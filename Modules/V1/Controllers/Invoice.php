<?php

/**
 * Invoice controller
 * @author Juan Bautista <soyjuanbautista0@gmail.com>
 * @author Apifecol
 * @license GNU General Public License v3.0 <https:   //www.gnu.org/licenses/gpl-3.0.html>
 * @package V1
 * @subpackage Controllers
 * 
 * Hecho con amor en Colombia 🇨🇴.
 */

use \App\Core\Controller;
use \App\Core\Session;
use \App\Interfaces\Http;
use \App\Traits\APIManager;
use Libs\Signatory;
use Models\Biller;
use Models\Config\AllowanceCharge;
use Models\Config\Discount;
use Models\Config\Language;
use Models\Config\Liability;
use Models\Config\Municipality;
use Models\Config\NitType;
use Models\Config\Organization;
use Models\Config\PaymentForm;
use Models\Config\PaymentMethod;
use Models\Config\Regime;
use Models\Invoice as ModelsInvoice;
use Models\Config\Resolution;
use Models\Config\Tax;
use Models\Config\TaxTotal;
use Models\Config\TypeCurrency;
use Models\Config\TypeDocument;
use Models\Config\TypeOperation;
use Models\Config\TypeUnitMeasure;
use Models\InvoiceLine;
use Traits\BillerResources;
use Traits\Dv;
use Traits\InvoiceResource;
use Traits\FileManager;

class Invoice extends Controller implements Http
{
    use APIManager;
    use Dv;
    use BillerResources;
    use InvoiceResource;
    use FileManager;
    public $process;


    /**ValidateRelationshipKeys
     * @var object $model
     */
    private $model;

    /**
     * @var object $biller
     */
    private $biller;

    /**ValidateRelationshipKeys
     * @var array $tmp
     * @param int $tmp['code']
     * @param array $tmp['data']
     */
    public $tmp;

    /**
     * @var object $result
     */
    public $result;

    /**
     * @var array $request
     */
    public $request;

    /**
     * @var array $relations
     */
    private $relations;

    /**
     * @var array $payload
     */
    private $payload;


    /**
     * @var array $profile
     */
    public $profile;

    /**
     * @var string $module
     */
    public $module;

    /**
     * @var mixed $nit
     */
    public $nit_;

    /**
     * @var string
     */
    public $xml;

    /**
     * @var string
     */
    public $xmlSigned;

    public function __construct(public $info)
    {
        $this->SetHeaders();

        // (EN) validate authentication (Set private controller)
        // (ES) Validar autenticación (Definir si el controlador es privado)
        Session:: sessionValidator($this->GetAuthorizationHeader());

        // (EN) Get data token
        // (ES) Obtener datos del token
        $this->payload = Session::SessionGetData($this->GetAuthorizationHeader());
        // Invoice Relations
        $this->relations = $this->invoiceRelations;
        $this->tmp       = $this->ResponseTemplate();

        $this->model  = new ModelsInvoice;
        $this->biller = new Biller;
    }

    public function index()
    {
        _json([], 404);
    }

    /**
     * Create
     * (EN) Create national sales invoice.
     * (ES) Crear factura de venta nacional.
     * @access public
     * @param string,int $nit
     * @return void
     */
    public function Create(string | int $nit = '{nit}'): void
    {
        // Get biller
        $this->biller = $this->biller::with($this->billerRelations)->where('identification_number', $nit)->first();

        // Validate biller
        ($this->biller != NULL) ? true: _json(['code' => 404, 'data' => ['message' => 'Biller not found']]);

        // Set check digit
        $this->biller->dv = $this->GetDv($this->biller->identification_number);

        // Validation of the content of the request body
        inputs_validator($this->CustomRequest(), $this->InvoiceFieldsRequireds, $this->InvoiceFieldsExceptions, "Invoice object");

        // Get request data
        $this->request = (object) $this->CustomRequest();

        // Validate relations keys invoice
        $this->ValidateRelationshipKeys($this->request, [
            "type_document_id"                 => new TypeDocument,
            "type_operation_id"                => new TypeOperation,
            "type_currency_id"                 => new TypeCurrency,
            "resolution_id"                    => new Resolution,
            "payment_method_id"                => new PaymentMethod,
            "payment_form_id"                  => new PaymentForm,
            "payment_duration_unit_measure_id" => new TypeUnitMeasure
        ], "Invoice ");

        // Validate relation keys customer
        $this->ValidateRelationshipKeys((object) $this->request->customer, [
            "nit_type_id"          => new NitType,
            "type_regime_id"       => new Regime,
            "liability_id"         => new Liability,
            "type_organization_id" => new Organization,
            "municipality_id"      => new Municipality,
            "language_id"          => new Language,
            "tax_id"               => new Tax,
        ], "Customer ");

        // Validate relation keys tax totals
        foreach ($this->request->tax_totals as $key => $value)  $this->ValidateRelationshipKeys((object)$value, [
            "tax_id" => new Tax,
        ], "TaxTotal ");

        // Validate relation keys tax totals
        foreach ($this->request->allowance_charges as $key => $value)  $this->ValidateRelationshipKeys((object)$value, [
            "discount_id" => new Discount,
        ], "AllowanceCharges ");


        // Create customer object from a collection, also inheriting the relationships from the biller model. 
        $this->customer = new Biller(collect($this->request->customer)->toArray());
        $this->customer->load($this->billerRelations);
        $this->customer->dv = $this->GetDv($this->customer->identification_number);

        // Validate quantity invoice lines
        (count($this->request->invoice_lines) > 0) ? true: _json(['code' => 400, 'data' => ['message' => 'Bad Request The invoice has not lines']]);

        // Validate invoice line fields 
        $this->ValidateInvoiceLines($this->request->invoice_lines);

        // Resolution validity
        ($this->invoice->Resolution->status != 1 &&
         $this->invoice->Resolution->date_to < Carbon\Carbon:: now()->format('Y-m-d') &&
         $this->invoice->Resolution->to   >= $this->invoice->number &&
         $this->invoice->Resolution->from <= $this->invoice->number) ? true : _json(['code' => 400, 'data' => ['message' => 'Bad Request please validate resolution']]);

        // unset customer data from request
        unset($this->request->customer);

        // Set invoice model
        $this->invoice = new ModelsInvoice(collect($this->request)->toArray());

        // Set invoice line model & load relations invoce lines
        $this->lines = collect();
        foreach ($this->request->invoice_lines as $key => $line) $this->lines->push(new InvoiceLine($line));
        foreach ($this->lines as $key => $line) $line->load($this->invoiceLinesRelations);

        // Tax totals & load relations tax totals
        $this->taxTotals = collect();
        foreach ($this->request->tax_totals ?? [] as $taxT) $this->taxTotals->push(new TaxTotal($taxT));
        foreach ($this->taxTotals as $line) $line->load($this->taxTotalsRelations);

        // Allowance Charges invoice
        $this->AllowanceCharges = collect();
        foreach ($this->request->allowance_charges ?? [] as $line)  $this->AllowanceCharges->push(new AllowanceCharge($line));


        // Set tax totals and allowance charges invoice line
        foreach ($this->lines as $line) [
            fn () => $line->setAllowanceChargesAttribute((array)$line->allowance_charges ?? []),
            fn () => $line->setTaxTotalsAttribute((array)$line->tax_totals ?? []),
        ];

        // Xml file creation
        $this->xml = $this->view(
            'xml.01', //View file name (Electronic invoice)
            [
                'company'             => $this->biller,                            // Biller data
                'customer'            => $this->customer,                          // Customer data
                'invoice'             => $this->invoice->load($this->relations),   // Invoice data
                'IssueDate'           => Carbon\Carbon::now()->format('Y-m-d'),    // Date
                'IssueTime'           => Carbon\Carbon::now()->format('H:i:s'),    // Time
                'lines'               => $this->lines,                             // invoice lines data
                'allowanceCharges'    => $this->AllowanceCharges,                  // Allowance charges
                'taxTotals'           => $this->taxTotals,                         // Tax total
                'legalMonetaryTotals' => $this->request->legal_monetary_totals     // Legal monetary totals
            ],
            // Module name
            $this->module
        );

        // Set virtual DOM xml document
        $this->Document = new DOMDocument('1.0', 'UTF-8');
        // Load xml document from string
        $this->Document->loadXML($this->xml);
        // DOMX path
        $this->DomXPath = new DOMXPath($this->Document);
        // Cufe
        $this->cufe = $this->Cufe($this->DomXPath, $this->Document, $this->invoice->Resolution->technical_key, true);
        // UUID
        $this->UUIDsha256 = hash("sha256", $this->cufe);
        // Add cufe to xml document
        $this->xml = str_replace('__CUFE__', $this->cufe,  $this->xml);
        // Add value QR code
        $this->xml = str_replace('__QRCODE__', ($this->biller->Environment != NULL) ? $this->biller->Environment->qr_url . $this->cufe : $this->biller->EnvironmentDefault->qr_url . $this->cufe,  $this->xml);
        
        // Signatory 
        $this->Signatory = new Signatory;
        // Signed document
        $this->xmlSigned = $this->Signatory->Sign(
            $this->CerticatePath(config()->APP_INSTANCES_PATH  . $this->biller->identification_number) . $this->biller->certificate,
            $this->biller->certificate_password,
            $this->xml,
            $this->UUIDsha256,
            $this->invoice->TypeDocument->prefix
        );

        // Response of the process
        _json([
            'code' => 200,
            'data' => [
                'message'         => 'xml document successfully created',
                'document'        => $this->xmlSigned,
                'document_base64' => base64_encode($this->xmlSigned)
            ]
        ]);
    }
}
