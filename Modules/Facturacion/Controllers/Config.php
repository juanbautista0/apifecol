<?php

/**
 * Config controller
 * @author Juan Bautista <soyjuanbautista0@gmail.com>
 * @author Apifecol
 * @license GNU General Public License v3.0 <https:   //www.gnu.org/licenses/gpl-3.0.html>
 * @package Facturacion
 * @subpackage Controllers
 * 
 * Hecho con amor en Colombia 🇨🇴.
 */
use \App\Core\Controller;
use App\Interfaces\Http;
use App\Core\Session;
use \App\Traits\APIManager;
use \Traits\Dv;
use \Traits\Certificates;
use \Traits\FileManager;

use Models\Biller;

class Config extends Controller implements Http
{
    use APIManager;
    use Dv;
    use Certificates;
    use FileManager;
    public $process;


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
     * @var object $model
     */
    private $model;

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


    public function __construct(public $info)
    {
        $this->SetHeaders();

        //(EN) validate authentication (Set private controller)
        //(ES) Validar autenticación (Definir si el controlador es privado)
        Session::sessionValidator($this->GetAuthorizationHeader());

        //(EN) Get data token
        //(ES) Obtener datos del token
        $this->payload   = Session::SessionGetData($this->GetAuthorizationHeader());
        $this->relations = ['Location.Department.Country', 'NitType', 'Regime', 'Organization', 'Liability'];
        $this->tmp       = $this->ResponseTemplate();
    }

    public function index()
    {
    }

    /**
     * Software
     * (EN) Method for updating software information.
     * (ES) Método para la actualización del software
     * @access public
     * @param string $nit
     * @return void
     */
    public function Software(string $nit = '{nit}'): void
    {
        //Http method validate
        ($this->GetRequestMethod() != 'PUT') ? _json(['code' => 404, 'data' => ['message' => 'Http method not found']], 404) : true;

        if ($nit != '{nit}') {
            $this->model = Biller::where('identification_number', $nit)->first();
            //Biller validation
            ($this->model == NULL) ? _json(['code' => 404, 'data' => ['message' => 'Biller not found']], 404) : true;
            //Set software ID
            (isset($this->CustomRequest()['software_id']) && !empty($this->CustomRequest()['software_id'])) ? $this->model->software_id = $this->CustomRequest()['software_id'] : false;
            //Set pin value
            (isset($this->CustomRequest()['pin']) && !empty($this->CustomRequest()['pin'])) ? $this->model->pin = $this->CustomRequest()['pin'] : false;
            //Set test id value
            (isset($this->CustomRequest()['test_id']) && !empty($this->CustomRequest()['pin'])) ? $this->model->test_id = $this->CustomRequest()['test_id'] : false;

            //Save proces and response
            ($this->model->save()) ? _json(['code' => 200, 'data' => ['message' => 'Successful biller update']], 200) : _json(['code' => 400, 'data' => ['message' => 'Bad Request']], 400);
        } else {
            _json(['code' => 400, 'data' => ['message' => 'Bad Request, biller nit is a required value']], 404);
        }
    }

    /**
     * Certificate
     * (EN) Method for updating certificate information.
     * (ES) Método para la actualización de datos del ceritificado.
     * @access public
     * @param string $nit
     * @return void
     */
    public function Certificate(string $nit = '{nit}'): void
    {
        //Http method validate
        ($this->GetRequestMethod() != 'PUT') ? _json(['code' => 404, 'data' => ['message' => 'Http method not found']], 404) : true;

        if ($nit != '{nit}') {

            //Get Biller
            $this->model = Biller::where('identification_number', $nit)->first();
            $current = $this->model->certificate;

            //Biller validation
            ($this->model == NULL) ? _json(['code' => 404, 'data' => ['message' => 'Biller not found']], 404) : true;

            //Get values request
            $this->process = $this->CustomRequest();

            //Validate if isset certificate
            (!isset($this->process['certificate'])) ? _json(['code' => 400, 'data' => ['message' => 'Bad Request, certificate field is required']], 400) : true;

            //Validate if isset certificate password
            (!isset($this->process['certificate_password'])) ? _json(['code' => 400, 'data' => ['message' => 'Bad Request, certificate password field is required']], 400) : true;

            //Validate if isset certificate validity
            (!isset($this->process['certificate_validity']) || empty($this->process['certificate_validity'])) ? _json(['code' => 400, 'data' => ['message' => 'Bad Request, certificate validity field is required']], 400) : true;

            //Certificate format validation
            ($this->BeforeGoingUp($this->process['certificate'], $this->process['certificate_password']));

            //Upload and save certificate
            $this->model->certificate = $this->UploadCertificate(config()->APP_INSTANCES_PATH  . $nit, $this->process['certificate'], $this->process['certificate_password']);

            //Validation to determine if the certificate was uploaded
            ($this->model->certificate != "") ? true : _json(['code' => 422, 'data' => ['message' => 'Certificate upload could not be completed, please try again.']], 422);

            //Set certigficate password
            $this->model->certificate_password = $this->process['certificate_password'];
            //Set certigficate validity
            $this->model->certificate_validity = $this->process['certificate_validity'];

            //Save proces and response
            ($this->model->save()) ? _json(['code' => 200, 'data' => ['message' => 'Successful certificate update']], 200, function () use ($current, $nit) {
                $this->ApiLogs([
                    'type'    => 'DB-QUERY',
                    'message' => "Biller {$nit} has updated his certificate, the file ({$current}) has been removed.",
                    'user'    => $this->profile['email']
                ]);
                (!in_array($current, [NULL, ""])) ? unlink($this->CerticatePath(config()->APP_INSTANCES_PATH  . $nit) . $current) : true;
            }) : _json(['code' => 400, 'data' => ['message' => 'Bad Request']], 400);
        } else {
            _json(['code' => 400, 'data' => ['message' => 'Bad Request, biller nit is a required value']], 404);
        }
    }
}
