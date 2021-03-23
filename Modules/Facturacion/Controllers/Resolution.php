<?php

/**
 * Resolution controller
 * @author Juan Bautista <soyjuanbautista0@gmail.com>
 * @author Apifecol
 * @license GNU General Public License v3.0 <https:   //www.gnu.org/licenses/gpl-3.0.html>
 * @package Facturacion
 * @subpackage Controllers
 *
 * Hecho con amor en Colombia 🇨🇴.
 */

use \App\Traits\APIManager;
use Models\Biller;
use Models\Config\Resolution as Resolutions;

class Resolution extends Controller implements Http
{
    use APIManager;
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
     * @var object $biller
     */
    private $biller;

    /**
     * @var array $relations
     */
    private $relations;

    /**
     * @var array $profile
     */
    public $profile;

    /**
     * @var array $fields
     */
    public $fields;

    public function __construct(public $info)
    {
        $this->model = new Resolutions;
        $this->biller = new Biller;
        $this->tmp = $this->ResponseTemplate();
        $this->relations = ['TypeDocument'];
        $this->fields = ["type_document_id", "prefix", "resolution", "resolution_date", "technical_key", "from", "to", "date_from", "date_to"];
    }

    /**
     * index
     * Main method
     * @access public
     * @return mixed
     */
    public function index(): mixed
    {
        return _json([], 404);
    }

    /**
     * Resolution
     * (EN) Creation of DIAN invoicing resolution.
     * (ES) Creación de resolución de facturación DIAN.
     * @access public
     * @param int $nit
     * @param string $resolution_id
     * @return void
     */
    public function config(int | string $nit, string  $resolution_id = '{resolution_id}'): void
    {
        //Http method validate
        $this->process = match ($this->GetRequestMethod()) {
            'GET' => $this->_GET(intval($nit), $resolution_id),
            'PUT' => $this->_PUT($nit, $resolution_id),
            'POST' => $this->_POST($nit),
            'DELETE' => $this->_DELETE($resolution_id),
            default => _json(['code' => 404, 'data' => ['message' => 'Http method not found']], 404)
        };
    }

    /**
     * _GET
     * (EN) get resolution data.
     * (ES) obtener datos de resolución
     * @access protected
     * @param string,int $nit
     * @return void
     */
    public function _GET(int $nit, string | int $resolution_id = '{resolution_id}'): void
    {

        //Get biller
        $this->biller = $this->biller::where('identification_number', $nit)->first();
        //Biller validate
        ($this->biller != NULL) ? true : _json(['code' => 404, 'data' => ['message' => 'Biller not found']]);

        if ($resolution_id != '{resolution_id}') {
            $this->result = $this->model::with($this->relations)->where('id', $resolution_id)->where('biller_id', $this->biller->id)->first();
            //Resolution validate
            ($this->result != NULL) ? true : _json(['code' => 404, 'data' => ['message' => 'Resolution not found']]);
        } else {
            $this->result = $this->model::with($this->relations)->where('biller_id', $this->biller->id)->get();
            //Resolution validate
            ($this->result->toArray() != NULL) ? true : _json(['code' => 404, 'data' => ['message' => 'Resolution not found']]);
        }
        _json(['code' => 200, 'data' => $this->result->toArray()]);
    }

    /**
     * _PUT
     * (EN) update resolution data.
     * (ES) actualizar datos de resolución
     * @access protected
     * @param string,int $nit
     * @return void
     */
    public function _PUT(string | int $nit = '{nit}', string | int $resolution_id = '{resolution_id}'): void
    {
        if ($this->biller::where('identification_number', $nit)->first() != NULL) {
            //validate if isset resolution by id
            ($this->model::where('id', $resolution_id)->first() != NULL) ? true : _json(['code' => 404, 'data' => ['message' => 'Resolution not found']]);

            $this->model = $this->model::where('id', $resolution_id)->first();
            $emptyField = function ($field) {
                _json(['code' => 400, 'data' => ['message' => "Bad Request, field {$field} is required."]]);
            };
            //Get values request
            $this->result = $this->CustomRequest();
            //Enrichment and validate model
            foreach ($this->fields as $key) {
                if ($key == 'resolution') {
                    //validate if isset resolution by resolution code
                    ($this->model::where('resolution', $this->result[$key])->where('id', '!=', $this
                        ->model
                        ->id)
                        ->first() != NULL) ? _json(['code' => 422, 'data' => ['message' => "Unprocessable Entity, The resolution {$this->result[$key]} already exists."]]) : true;
                }
                //Set value field
                $this
                    ->model->{$key} = (isset($this->result[$key]) && !empty($this->result[$key])) ? $this->result[$key] : $emptyField($key);
            }
            //Save and response process
            ($this
                ->model
                ->save()) ? _json(['code' => 200, 'data' => ['message' => 'Resolution successfully updated']]) : _json(['code' => 422, 'data' => ['message' => 'Unprocessable Entity, try again.']]);
        } else {
            //Not found
            _json(['code' => 404, 'data' => ['message' => 'Biller not found']]);
        }
    }
    /**
     * _POST
     * (EN) create resolution.
     * (ES) crear resolución.
     * @access protected
     * @param string,int $nit
     * @return void
     */
    public function _POST(string | int $nit = '{nit}'): void
    {
        if ($this->biller::where('identification_number', $nit)->first() != NULL) {
            $emptyField = function ($field) {
                _json(['code' => 400, 'data' => ['message' => "Bad Request, field {$field} is required."]]);
            };

            //Get biller
            $this->biller = $this->biller::where('identification_number', $nit)->first();
            $this
                ->model->biller_id = $this
                ->biller->id;
            //Get values request
            $this->result = $this->CustomRequest();
            foreach ($this->fields as $key) {
                if ($key == 'resolution') {
                    //validate if isset resolution by resolution code
                    ($this->model::where('resolution', $this->result[$key])->first() != NULL) ? _json(['code' => 422, 'data' => ['message' => "Unprocessable Entity, The resolution {$this->result[$key]} already exists."]]) : true;
                }
                //Save and response process
                $this
                    ->model->{$key} = (isset($this->result[$key]) && !empty($this->result[$key])) ? $this->result[$key] : $emptyField($key);
            }
            //Save and response process
            ($this
                ->model
                ->save()) ? _json(['code' => 200, 'data' => ['message' => 'Resolution successfully created']]) : _json(['code' => 422, 'data' => ['message' => 'Unprocessable Entity, try again.']]);
        } else {
            _json(['code' => 404, 'data' => ['message' => 'Biller not found']]);
        }
    }
    /**
     * _DELETE
     * (EN) delete resolution.
     * (ES) eliminar resolución.
     * @access protected
     * @param string,int $nit
     * @return void
     */
    public function _DELETE(string | int $resolution_id = '{resolution_id}'): void
    {
        //Get resolution
        $this->result = $this->model::where('id', $resolution_id)->first();
        //resolution validate and delete process
        ($this->result != NULL) ? true : _json(['code' => 404, 'data' => 'Resolution Not found'], 404);

        //Remove/delete/log action
        ($this->result->delete()) ? _json(['code' => 200, 'data' => ['message' => 'OK', 'logs' => $this->ApiLogs(['type' => 'DB-QUERY', 'message' => "Resolution {$resolution_id} deleted", 'user' => $this->profile['email']])]], 200) : _json(['code' => 400, 'data' => 'Bad Request'], 400);
    }
}
