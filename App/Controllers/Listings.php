<?php

/**
 * @author Juan Bautista <soyjuanbautista0@gmail.com>
 * @author Apifecol
 *
 * @package Controllers
 */

use \App\Traits\APIManager;
use \App\Core\Session;
use Illuminate\Database\Capsule\Manager as DB;

class Listings extends Controller implements Http
{
     use APIManager;

     /**
      * @var array $payload;
      * (EN) Token data
      * (ES) Datos del token
      * @access protected
      */
     protected $payload;

     /**
      * @var array list
      * (EN) List
      * (ES) Listado
      */
     public $list;

     /**
      * @var object $result;
      */
     public $result;

     /**
      * @var string $prefix
      */
     public $prefix;

     public function __construct()
     {
          $this->SetHeaders();

          //(EN) validate authentication
          //(ES) Validar autenticación
          Session::sessionValidator($this->GetAuthorizationHeader());

          //(EN) Get data token
          //(ES) Obtener datos del token
          $this->payload = Session::SessionGetData($this->GetAuthorizationHeader());
          $this->prefix = config()->DB_PREFIX;
     }

     /**
      * Index
      * Main method
      * @access public
      * @return void
      */
     public function index(): void
     {
          $this->list = get_class_methods(__CLASS__);
          unset($this->list['index']);
          _json(['code' => 200, 'data' => get_called_class()]);
     }

     /**
      * Rows
      * @access public
      * (EN) Records rows
      * (ES) Listado de registros
      * @param string $resource
      * @param int $id
      * @return void
      */
     public function Rows($resource = '', $id = '{id}'): void
     {
          $callback = function () {
               throw new Exception("Error Processing Request", 1);
          };
          try {
               if ($resource != '') {
                    $this->result = DB::table("{$this->prefix}_{$resource}")->get();
                    if ($id != '{id}') {
                         $id = intval($id);
                         $this->result = ($this->result->where('id', $id)->first() != NULL) ? $this->result->where('id', $id)->first() : $callback();
                    }
                    _json(['code' => 200, 'data' => $this->result]);
               }
          } catch (\Throwable $th) {
               //print_debug($th->getMessage());
               _json([
                    'code' => 404,
                    'data' => [
                         'message' => "Not Found id: {$id} table {$resource}"
                    ]
               ]);
          }
     }         
}
