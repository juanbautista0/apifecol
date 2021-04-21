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
use Models\Biller;
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
use Models\Config\TypeCurrency;
use Models\Config\TypeDocument;
use Models\Config\TypeOperation;
use Models\Config\TypeUnitMeasure;
use Models\InvoiceLine;
use Traits\BillerResources;
use Traits\Dv;
use Traits\InvoiceResource;

class Invoice extends Controller implements Http
{
    use APIManager;
    use Dv;
    use BillerResources;
    use InvoiceResource;
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

    public function __construct(public $info)
    {
        $this->SetHeaders();

        // (EN) validate authentication (Set private controller)
        // (ES) Validar autenticación (Definir si el controlador es privado)
        Session::sessionValidator($this->GetAuthorizationHeader());

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
        ($this->biller != NULL) ? true : _json(['code' => 404, 'data' => ['message' => 'Biller not found']]);

        $this->biller->dv = $this->GetDv($this->biller->identification_number);

        // Validation of the content of the request body
        inputs_validator($this->CustomRequest(), $this->InvoiceFieldsRequireds, $this->InvoiceFieldsExceptions, "Invoice object");

        // Get request data
        $this->request = (object) $this->CustomRequest();

        // Validate relations keys invoice
        $this->ValidateRelationshipKeys($this->request, [
            "type_document_id"  => new TypeDocument,
            "type_operation_id" => new TypeOperation,
            "type_currency_id"  => new TypeCurrency,
            "resolution_id"     => new Resolution,
            "payment_method_id" => new PaymentMethod,
            "payment_form_id"   => new PaymentForm,
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

        // Create customer object from a collection, also inheriting the relationships from the biller model. 
        $this->customer = new Biller(collect($this->request->customer)->toArray());
        $this->customer->load($this->billerRelations);
        $this->customer->dv = $this->GetDv($this->customer->identification_number);

        // Validate quantity invoice lines
        (count($this->request->invoice_lines) > 0) ? true : _json(['code' => 400, 'data' => ['message' => 'Bad Request The invoice has no lines']]);

        // Validate invoice line fields 
        $this->ValidateInvoiceLines($this->request->invoice_lines);

        // unset customer data from request
        unset($this->request->customer);

        // Set invoice model
        $this->invoice = new ModelsInvoice(collect($this->request)->toArray());

        // Set invoice line model
        $this->lines = collect();
        foreach ($this->request->invoice_lines as $line) $this->lines->push(new InvoiceLine($line));
        //Load relations
        foreach ($this->lines as $line) $line->load($this->invoiceLinesRelations);

        //Pendientes
        /**
         * - PaymentTerms
         * - Pintar líneas
         * -Incorporar firma
         */
        $this->xml = $this->view('xml.01', [
            'company'  => $this->biller,
            'customer' => $this->customer,
            'invoice'  => $this->invoice->load($this->relations),
            'lines'    => $this->lines
        ], $this->module);

        echo $this->xml;
    }
}
