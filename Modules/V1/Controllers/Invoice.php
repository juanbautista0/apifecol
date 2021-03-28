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
use Models\Invoice as ModelsInvoice;
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


    /**
     * @var object $model
     */
    private $model;

    /**
     * @var object $biller
     */
    private $biller;

    /**
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


    public function __construct(public $info)
    {

        $this->SetHeaders();

        //(EN) validate authentication (Set private controller)
        //(ES) Validar autenticación (Definir si el controlador es privado)
        Session::sessionValidator($this->GetAuthorizationHeader());

        //(EN) Get data token
        //(ES) Obtener datos del token
        $this->payload   = Session::SessionGetData($this->GetAuthorizationHeader());
        $this->relations = [];
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
        //Get biller
        $this->biller = $this->biller::where('identification_number', $nit)->first();

        //Validate biller
        ($this->biller != NULL) ? true : _json(['code' => 404, 'data' => ['message' => 'Biller not found']]);

        //Validation of the content of the request body
        inputs_validator($this->CustomRequest(), $this->InvoiceFieldsRequireds, $this->InvoiceFieldsExceptions, "Invoice object");
    }
}
