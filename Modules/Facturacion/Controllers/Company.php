<?php

/**
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
use Models\Biller;

class Company extends Controller implements Http
{
    use APIManager;
    use Dv;
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
     * @return void
     */
    public function index()
    {
        _json([], 404);
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
        ($this->result != NULL) ? $this->result->dv = $this->GetDv($this->result->identification_number) : false;

        //validation and response
        ($this->result != NULL) ? _json($this->result->toArray(), 200) : _json([], 404);
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
        $this->ApiLogs([
            'type'    => 'TEST',
            'message' => $nit,
            'user'    => $this->profile['email']
        ]);
    }
}
