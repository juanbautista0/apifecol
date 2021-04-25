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
use Models\Config\ZipNumbering;
use Models\InvoiceLine;
use Traits\BillerResources;
use Traits\Dv;
use Traits\InvoiceResource;
use Traits\FileManager;
use Traits\DIANWebServiceClient;

class Invoice extends Controller implements Http
{
    use APIManager;
    use Dv;
    use BillerResources;
    use InvoiceResource;
    use FileManager;
    use DIANWebServiceClient;
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

    /**
     * @var object
     */
    public $zipNumbering;

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

        $this->model        = new ModelsInvoice;
        $this->biller       = new Biller;
        $this->zipNumbering = new ZipNumbering;
    }

    public function index()
    {
        _json([], 404);
    }

    /**
     * (EN) Create national sales invoice.
     * (ES) Crear factura de venta nacional.
     * @access public
     * @param string,int $nit
     * @return void
     */
    public function Create(string | int $nit = '{nit}'): void
    {
        $this->biller = $this->biller::with($this->billerRelations)->where('identification_number', $nit)->first();

        ($this->biller != NULL) ? true: _json(['code' => 404, 'data' => ['message' => 'Biller not found']]);

        $this->biller->dv = $this->GetDv($this->biller->identification_number);

        inputs_validator($this->CustomRequest(), $this->InvoiceFieldsRequireds, $this->InvoiceFieldsExceptions, "Invoice object");

        $this->request = (object) $this->CustomRequest();

        $this->ValidateRelationshipKeys($this->request, [
            "type_document_id"                 => new TypeDocument,
            "type_operation_id"                => new TypeOperation,
            "type_currency_id"                 => new TypeCurrency,
            "resolution_id"                    => new Resolution,
            "payment_method_id"                => new PaymentMethod,
            "payment_form_id"                  => new PaymentForm,
            "payment_duration_unit_measure_id" => new TypeUnitMeasure
        ], "Invoice ");

        $this->ValidateRelationshipKeys((object) $this->request->customer, [
            "nit_type_id"          => new NitType,
            "type_regime_id"       => new Regime,
            "liability_id"         => new Liability,
            "type_organization_id" => new Organization,
            "municipality_id"      => new Municipality,
            "language_id"          => new Language,
            "tax_id"               => new Tax,
        ], "Customer ");

        foreach ($this->request->tax_totals as $key => $value)  $this->ValidateRelationshipKeys((object)$value, [
            "tax_id" => new Tax,
        ], "TaxTotal ");

        foreach ($this->request->allowance_charges as $key => $value)  $this->ValidateRelationshipKeys((object)$value, [
            "discount_id" => new Discount,
        ], "AllowanceCharges ");


        $this->customer = new Biller(collect($this->request->customer)->toArray());
        $this->customer->load($this->billerRelations);
        $this->customer->dv = $this->GetDv($this->customer->identification_number);

        (count($this->request->invoice_lines) > 0) ? true: _json(['code' => 400, 'data' => ['message' => 'Bad Request The invoice has not lines']]);

        $this->ValidateInvoiceLines($this->request->invoice_lines);

        ($this->invoice->Resolution->status != 1 &&
            $this->invoice->Resolution->date_to < Carbon\Carbon:: now()->format('Y-m-d') &&
            $this->invoice->Resolution->to   >= $this->invoice->number &&
            $this->invoice->Resolution->from <= $this->invoice->number) ? true : _json(['code' => 400, 'data' => ['message' => 'Bad Request please validate resolution']]);

        unset($this->request->customer);

        $this->invoice = new ModelsInvoice(collect($this->request)->toArray());

        $this->lines = collect();
        foreach ($this->request->invoice_lines as $key => $line) $this->lines->push(new InvoiceLine($line));
        foreach ($this->lines as $key => $line) $line->load($this->invoiceLinesRelations);

        $this->taxTotals = collect();
        foreach ($this->request->tax_totals ?? [] as $taxT) $this->taxTotals->push(new TaxTotal($taxT));
        foreach ($this->taxTotals as $line) $line->load($this->taxTotalsRelations);

        $this->AllowanceCharges = collect();
        foreach ($this->request->allowance_charges ?? [] as $line)  $this->AllowanceCharges->push(new AllowanceCharge($line));

        foreach ($this->lines as $line) [
            fn () => $line->setAllowanceChargesAttribute((array)$line->allowance_charges ?? []),
            fn () => $line->setTaxTotalsAttribute((array)$line->tax_totals ?? []),
        ];
        $this->IssueDate = Carbon\Carbon::now()->format('Y-m-d');
        $this->IssueTime = Carbon\Carbon::now()->format('H:i:s');

        $this->xml = $this->view(
            'xml.01', //View file name
            [
                'company'             => $this->biller,                            // Biller data
                'customer'            => $this->customer,                          // Customer data
                'invoice'             => $this->invoice->load($this->relations),   // Invoice data
                'IssueDate'           => $this->IssueDate,                         // Date
                'IssueTime'           => $this->IssueTime,                         // Time
                'lines'               => $this->lines,                             // invoice lines data
                'allowanceCharges'    => $this->AllowanceCharges,                  // Allowance charges
                'taxTotals'           => $this->taxTotals,                         // Tax total
                'legalMonetaryTotals' => $this->request->legal_monetary_totals     // Legal monetary totals
            ],
            // Module name
            $this->module
        );

        $this->Document = new DOMDocument('1.0', 'UTF-8');
        $this->Document->loadXML($this->xml);
        $this->DomXPath   = new DOMXPath($this->Document);
        $this->cufe       = $this->Cufe($this->DomXPath, $this->Document, $this->invoice->Resolution->technical_key, true);
        $this->UUIDsha256 = hash("sha256", $this->cufe);
        $this->xml        = str_replace('__CUFE__', $this->cufe,  $this->xml);
        $this->xml        = str_replace('__QRCODE__', ($this->biller->Environment != NULL) ? $this->biller->Environment->qr_url . $this->cufe : $this->biller->EnvironmentDefault->qr_url . $this->cufe,  $this->xml);

        // Signatory 
        $this->Signatory = new Signatory;
        $this->xmlSigned = $this->Signatory->Sign(
            $this->CerticatePath(config()->APP_INSTANCES_PATH  . $this->biller->identification_number) . $this->biller->certificate,
            $this->biller->certificate_password,
            $this->xml,
            $this->UUIDsha256,
            $this->invoice->TypeDocument->prefix
        );


        $this->zipNumber = ($this->zipNumbering::whereYear("created_at", date("Y"))->get()->last() != NULL) ? $this->zipNumbering::whereYear("created_at", date("Y"))->get()->last()->number + 1 : 1;
        $this->currentZipNumber = $this->zipNumbering::whereYear("created_at", date("Y"))->get()->last() ?? new stdClass;
        $this->xmlName   = $this->ElectronicDocumentName('000', $this->biller->identification_number, $this->invoice->number, $this->invoice->Resolution->prefix) . '.xml';
        $this->fileName  = $this->ElectronicDocumentName('000', $this->biller->identification_number, $this->zipNumber, 'z') . '.zip';
        $this->zip64     = $this->PackingZip($this->XmlSignedPath(config()->APP_INSTANCES_PATH  . $this->biller->identification_number),  $this->xmlSigned, $this->fileName,  $this->xmlName);

        //file_put_contents($this->XmlSignedPath(config()->APP_INSTANCES_PATH  . $this->biller->identification_number) . $this->xmlName, $this->xmlSigned);

        $this->SendMethod  = ($this->biller->SendMethod != NULL) ? $this->biller->SendMethod->name : $this->biller->SendMethodDefault->name;
        
        list($this->_WS_ACTION, $this->_BODY) = match ($this->SendMethod) {
            'SendTestSetAsync' => $this->retornaBody($this->SendMethod, $this->fileName, $this->zip64, $this->biller->test_id, "", ""),
            'SendBillSync'     => $this->retornaBody($this->SendMethod, $this->fileName, $this->zip64, "", "", ""),
            'SendBillAsync'    => $this->retornaBody($this->SendMethod, $this->fileName, $this->zip64, "", "", ""),
            default            => _json(['code' => 400, 'data' => ['message' => 'Unsupported request, define a validated sending method.']])
        };

        $this->environmentType = ($this->biller->Environment != NULL) ? $this->biller->Environment->code : $this->biller->EnvironmentDefault->code;

        $this->petitionDIAN = $this->BuildSignedPetition(
            $this->CerticatePath(config()->APP_INSTANCES_PATH  . $this->biller->identification_number) . $this->biller->certificate,
            $this->biller->certificate_password,
            '',
            $this->_WS_ACTION,
            $this->urlWS_DIAN($this->environmentType)['_WSA_TO'],
            $this->_BODY
        );
        
        $this->responseDIAN = $this->SendPetition($this->xmlName, $this->urlWS_DIAN($this->environmentType), $this->petitionDIAN, $this->XmlResponsesPath(config()->APP_INSTANCES_PATH  . $this->biller->identification_number));
        $this->zipKey       = $this->parseXml(strval($this->responseDIAN), $this->SendMethod);

        if($this->SendMethod == 'SendBillSync'){
            $this->documentStatus = $this->setResponseZipKey(strval($this->responseDIAN), true);
        }else{
            sleep(6);
            $this->documentStatus = $this->setResponseZipKey($this->getStatusZip($this->zipKey,  $this->ElectronicDocumentName('000', explode(".",$this->xmlName)[0], "rq") . '.xml', $this->CerticatePath(config()->APP_INSTANCES_PATH  . $this->biller->identification_number) . $this->biller->certificate, $this->biller->certificate_password, $this->environmentType, $this->XmlResponsesPath(config()->APP_INSTANCES_PATH  . $this->biller->identification_number)));
        }

        
        ($this->documentStatus['IsValid'] == "true")?$this->CorrectlyProcessedInvoice([
            /**
             * here are the callbacks
             * -Save xml invoice and zip file
             * -Generate attachment
             * -Send mail to customer
             */
        ],$this->invoice,
         $this->lines, 
         $this->AllowanceCharges,
         $this->taxTotals,
         $this->request->legal_monetary_totals,
         $this->biller, 
         $this->customer, 
         ['StatusDescription'=>'test'], 
         $this->xmlName,
         "this->zipKey", 
         $this->cufe, 
         "{$this->IssueDate}{$this->IssueTime}"): $this->InvoiceProcessingError();

    }
}
