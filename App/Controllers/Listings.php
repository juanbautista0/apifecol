<?php

/**
 * @author Juan Bautista <soyjuanbautista0@gmail.com>
 * @author Apifecol
 *
 * @package Controllers
 */

use \App\Traits\APIManager;
use \App\Core\Session;
use App\Models\ListingsDIAN\Department;

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

     public function __construct()
     {
          $this->SetHeaders();

          //(EN) validate authentication
          //(ES) Validar autenticación
          Session::sessionValidator($this->GetAuthorizationHeader());

          //(EN) Get data token
          //(ES) Obtener datos del token
          $this->payload = Session::SessionGetData($this->GetAuthorizationHeader());
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
      * Countries
      * @access public
      * (EN) Country Listings
      * (ES) Listado de paises
      * @param int $id
      * (EN) Country ID.
      * (ES) ID de País
      * 
      * @author Juan Bautista <soyjuanbautista0@gmail.com>
      * @return void
      */
     public function Countries($id = 0): void
     {
          if ($id != 0) :
               $this->result =  App\Models\ListingsDIAN\Country::where('id', $id);
               if ($this->result->first() != NULL) :
                    _json([
                         'code' => 200,
                         'data' => $this->result->first()->toArray()
                    ]);
               else :
                    _json([
                         'code' => 404,
                         'data' => [
                              'message' => 'Not Found'
                         ]
                    ]);
               endif;
          else :
               _json([
                    'code' => 200,
                    'data' => App\Models\ListingsDIAN\Country::all()->toArray()
               ]);
          endif;
     }

     /**
      * Departments
      * @access public
      * (EN) Departments Listings (Provinces)
      * (ES) Listado de departamentos (Provincias)
      * @param int $id
      * (EN) Department ID.
      * (ES) ID de departamento
      * 
      * @author Juan Bautista <soyjuanbautista0@gmail.com>
      * @return void
      */
     public function Departments(int $id = 0): void
     {
          if ($id != 0) :
               _json([
                    'code' => 200,
                    'data' => App\Models\ListingsDIAN\Department::where('id', $id)->first()->toArray()
               ]);
          else :
               _json([
                    'code' => 200,
                    'data' => App\Models\ListingsDIAN\Department::all()->toArray()
               ]);
          endif;
     }
}
