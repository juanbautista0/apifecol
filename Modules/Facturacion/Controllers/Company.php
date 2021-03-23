<?php

/**
 * Company controller
 * @author Juan Bautista <soyjuanbautista0@gmail.com>
 * @author Apifecol
 * @license GNU General Public License v3.0 <https://www.gnu.org/licenses/gpl-3.0.html>
 * @package Facturacion
 * @subpackage Controllers
 * 
 * Hecho con amor en Colombia 🇨🇴.
 */

use \App\Traits\APIManager;
use \Traits\Dv;
use \Traits\DeployBillerDirectory;
use Models\Biller;

class Company extends Controller implements Http
{
    use APIManager;
    use Dv;
    use DeployBillerDirectory;
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
     * @var array $profile
     */
    public $profile;

    public function __construct(public $info)
    {
        $this->model =  new Biller;
        $this->relations = ['Location.Department.Country', 'NitType', 'Regime', 'Organization', 'Liability'];
        $this->tmp = $this->ResponseTemplate();
    }

    /**
     * index
     * Main method
     * @access public
     * @return mixed
     */
    public function index(): mixed
    {
        return  _json([], 404);
    }

    /**
     * config
     * @access public
     * @param string,int $nit
     * (EN) RUT Tax Identification Number.
     * (ES) Número de Identificación Tributaria RUT.
     */
    public function config(string | int $nit = '{nit}'): void
    {
        //Http method validate
        $this->process = match ($this->GetRequestMethod()) {
            'GET'    => $this->_GET($nit),
            'PUT'    => $this->_PUT($nit),
            'POST'   => $this->_POST($nit),
            'DELETE' => $this->_DELETE($nit),
            default  =>  _json(['code' => 404, 'data' => ['message' => 'Http method not found']], 404)
        };
    }

    /**
     * _GET
     * (EN) get company data.
     * (ES) obtener datos de empresa
     * @access protected
     * @param string,int $nit
     * @return void
     */
    public function _GET(string | int $nit = '{nit}'): void
    {

        //Get biller 
        $this->result = $this->model::with($this->relations)->where('identification_number', $nit)->first();

        //Set Dv
        ($this->result != NULL) ? $this->result->dv = $this->GetDv((int) $this->result->identification_number) : false;

        //Validation and response
        ($this->result != NULL) ? _json(['code' => 200, 'data' => $this->result->toArray()], 200) : _json(['code' => 404, 'data' => 'Not found'], 404);
    }
    /**
     * _PUT
     * (EN) update company data.
     * (ES) actualizar datos de empresa
     * @access protected
     * @param string,int $nit
     * @return void
     */
    public function _PUT(string | int $nit = '{nit}'): void
    {
        //Get biller 
        $this->result = $this->model::where('identification_number', $nit)->first();
        //Model enrichment
        //Biller validate
        if ($this->result != NULL) :
            try {
                foreach ($this->CustomRequest() as $key => $value) {
                    $this->result->{$key} = $value;
                }
                if ($this->result->save()) {

                    //Successful biller update
                    $this->tmp['code'] = 200;
                    $this->tmp['data']['message'] = 'Successful biller update';
                    _json($this->tmp);
                } else {
                    //Successful biller update
                    $this->tmp['code'] = 400;
                    $this->tmp['data']['message'] = 'Bad Request';
                    _json($this->tmp);
                }
            } catch (\Throwable $th) {
                $this->ApiLogs([
                    'type'    => 'ERROR',
                    'message' => $th->getMessage(),
                    'user'    => $this->profile['email']
                ]);
                $this->tmp['code'] = 500;
                $this->tmp['data']['message'] = $th->getMessage();
                _json($this->tmp);
            }

        else :
            //Biller not found
            $this->tmp['code'] = 404;
            $this->tmp['data']['message'] = 'Biller not found';
            _json($this->tmp);
        endif;
    }
    /**
     * _POST
     * (EN) create company.
     * (ES) crear empresa.
     * @access protected
     * @param string,int $nit
     * @return void
     */
    public function _POST(string | int $nit = '{nit}'): void
    {
        //Nit Validation
        if ($nit != '{nit}') {
            ($this->model::where('identification_number', $nit)->first() != NULL) ? _json(['code' => 409, 'data' => ['message' => "NIT {$nit} already exists"]]) : true;
            //Model enrichment
            foreach ($this->CustomRequest() as $key => $value) {
                $this->model->{$key} = $value;
            }
            //Save biller
            ($this->model->save()) ? _json(['code' => 201, 'data' => ['message' => 'Created']], 201, function () use ($nit) {
                $this->StorageDirectory(config()->APP_DIRECTORY . config()->APP_INSTANCES_PATH . DIRECTORY_SEPARATOR . $nit);
            }) : _json(['code' => 400, 'data' => 'Bad Request'], 400);
        }
    }
    /**
     * _DELETE
     * (EN) delete company.
     * (ES) eliminar empresa.
     * @access protected
     * @param string,int $nit
     * @return void
     */
    public function _DELETE(string | int $nit = '{nit}'): void
    {
        //Get Biller
        $this->result = $this->model::where('identification_number', $nit)->first();
        //Biller validate and delete process
        if ($this->result != NULL) {

            //Remove/delete action
            ($this->result->delete()) ? _json(['code' => 200, 'data' => [
                'message' => 'OK',
                'logs'    =>  $this->ApiLogs([
                    'type'    => 'DB-QUERY',
                    'message' => "Biller $nit deleted",
                    'user'    => $this->profile['email']
                ])
            ]], 200) : _json(['code' => 400, 'data' => 'Bad Request'], 400);
        } else {
            //Not found Biller
            _json(['code' => 404, 'data' => 'Not found'], 404);
        }
    }
}
