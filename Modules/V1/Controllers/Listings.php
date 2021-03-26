<?php

/**
 * Listings Controller
 * @author Juan Bautista <soyjuanbautista0@gmail.com>
 * @author Apifecol
 * @license GNU General Public License v3.0 <https:   //www.gnu.org/licenses/gpl-3.0.html>
 * @package Facturacion
 * @subpackage Controllers
 * 
 * Hecho con amor en Colombia 🇨🇴.
 */

use \App\Core\Controller;
use App\Traits\APIManager;
use \App\Interfaces\Http;
use App\Core\Session;
use Models\Biller;
use Models\Config\Country;
use Models\Config\Municipality;
use Models\Config\Language;
use Models\Config\Regime;
use Models\Config\TypeDocument;
use Models\Config\TypeCurrency;
use Models\Config\TypeOperation;
use Models\Config\TypeEnvironment;
use Models\Config\Liability;
use Models\Config\NitType;
use Models\Config\Organization;


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

          $this->list =  [
               'Country'                    => [new Country, '(EN) Countries. (ES) Países.'],
               'Biller'                     => [new Biller, '(EN) Billers. (ES) Facturadores.'],
               'Language'                   => [new Language, '(EN) Languages. (ES) Lenguajes.'],
               'TypeRegime'                 => [new Regime, '(EN) Regigemes. (ES) Regímenes.'],
               'TypeDocument'               => [new TypeDocument, '(EN) Documents types. (ES) Tipos de Documentos.'],
               'TypeCurrency'               => [new TypeCurrency, '(EN) Currencies types. (ES) Tipos de moneda.'],
               'Municipality'               => [new Municipality, '(EN) Municipalities. (ES) Municipios.'],
               'TypeLiability'              => [new Liability, '(EN) Liabilities. (ES) Responsabilidades.'],
               'TypeOperation'              => [new TypeOperation, '(EN) Operations types. (ES) Tipos de operaciones.'],
               'TypeEnvironment'            => [new TypeEnvironment, '(EN) Types environment. (ES) Tipos de ambientes.'],
               'TypeOrganization'           => [new Organization, '(EN) Types organizations. (ES) Tipos de organizaciones.'],
               'TypeDocumentIdentification' => [new NitType, '(EN) Types of identification documents. (ES) Tipos de documentos de identificación'],
          ];
     }

     /**
      * @access public
      * @param bool $ctx
      * @return mixed
      */
     public function index(bool $ctx = false): mixed
     {
          $this->result = [];
          foreach ($this->list as $key => $value) {
               $this->result[$key] = $this->list[$key][1];
          }
          return ($ctx) ? $this->result : _json(['code' => 200, 'data' => $this->result]);
     }

     /**
      * Rows
      * @access public
      * @param string $resource
      * (EN) Name of listing resource.
      * (ES) Nombre del recurso de listado
      * @param string,int $id
      * (EN) ID
      * (ES) Identificador
      * @return void 
      */
     public function Rows(string $resource = '{source}', string | int  $id =  "{id}"): void
     {
          if ($resource != '{source}' && isset($this->list[$resource])) {
               $this->result = $this->list[$resource][0]::get();

               if ($id != "{id}") {
                    $this->result = ($this->list[$resource][0]::where('id', intval($id))->first() != NULL) ? $this->list[$resource][0]::where('id', intval($id))->first() : NULL;
               }

               ($this->result != NULL) ? _json(['code' => 200, 'data' => $this->result->toArray()]) : _json([
                    'code' => 404,
                    'data' => ['message' => "Not Found id: {$id} resource {$resource}"]
               ]);
          } else {
               _json([
                    'code' => 404,
                    'data' => ['message' => "Not Found resource {$resource}, try one of the options: " . join(",", array_keys($this->index(true))) . "."]
               ]);
          }
     }
}
