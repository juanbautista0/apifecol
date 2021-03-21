<?php

/**
 * Listings Controller
 * @author Juan Bautista <soyjuanbautista0@gmail.com>
 * @author Apifecol
 * @license GNU General Public License v3.0 <https://www.gnu.org/licenses/gpl-3.0.html>
 * @package Facturacion
 * @subpackage Controllers
 * 
 * Hecho con amor en Colombia 🇨🇴.
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

          //(EN) validate authentication (Set private controller)
          //(ES) Validar autenticación (Definir si el controlador es privado)
          Session::sessionValidator($this->GetAuthorizationHeader());

          //(EN) Get data token
          //(ES) Obtener datos del token
          $this->payload = Session::SessionGetData($this->GetAuthorizationHeader());
          $this->prefix = config()->DB_PREFIX;
     }

     #[Route("/listings", methods: ["GET"])]
     public function index(): void
     {
          $this->list = get_class_methods(__CLASS__);
          unset($this->list['index']);
          _json(['code' => 200, 'data' => get_called_class()]);
     }

     #[Route("/listings/rows/{source}/{id}", methods: ["GET"])]
     public function Rows(string $resource = '{source}', string | int  $id =  "{id}"): void
     {
          if ($resource != '{source}') {
               $this->result = DB::table("{$this->prefix}_{$resource}")->get();

               if ($id !=  "{id}") {
                    $id = intval($id);
                    $this->result = ($this->result->where('id', $id)->first() != NULL) ? $this->result->where('id', $id)->first() : NULL;
               }

               ($this->result != NULL) ? _json(['code' => 200, 'data' => $this->result]) : _json([
                    'code' => 404,
                    'data' => [
                         'message' => "Not Found id: {$id} table {$resource}"
                    ]
               ]);
          } else {
               _json([
                    'code' => 404,
                    'data' => [
                         'message' => "Not Found id: {$id} table {$resource}"
                    ]
               ]);
          }
     }
}
