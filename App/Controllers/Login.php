<?php

/**
 * @author Henry Pandales <henrypandale@gmail.com>
 * @author Juan Bautista <soyjuanbautista0@gmail.com>
 *
 * @package Controllers
 */


use Illuminate\Database\Capsule\Manager as DB;
use \App\Traits\APIManager;
use \App\Core\Session;

class Login extends Controller implements Http
{
     use APIManager;

     /**
      * @var string $db_tenancy
      * @access protected
      */
     protected $db_tenancy;

     /**
      * @var object $tenancy;
      * @access protected
      */

     protected $tenancy;

     /**
      * @var object $profile 
      * @access protected 
      */
     protected $profile;

     /**
      * @var object $biller
      * @access protected
      */
     protected $biller;

     /**
      * @var string $http_method
      * (EN) Http method for default
      * (ES) Método Http por defecto
      * @access public
      */

     public $http_method = 'POST';

     /**
      * @var array $requireds
      * (EN) Required fields
      * (ES) Campos requeridos
      * @access public
      */
     public $requireds_login = [
          'email',
          'password',
          'NIT'
     ];

     /**
      * @var object $session
      * @access public
      */
     public $session;




     public function __construct()
     {
          $this->SetHeaders();
          $this->session = new Session;
     }

     /**
      * Login
      * (ES) Método inicio de sesión
      * (EN) Login method
      * [@APIManager POST]
      * @access public
      * @return void
      */

     public function Login(): void
     {
          _json(['code'=>202, 'data'=>$this->CustomRequest()]);
          //http code 202
          if (!empty($this->CustomRequest()) && $this->HttpMethodValidate() && isset($this->CustomRequest()['tenancy']) && $this->DatabaseValidate($this->CustomRequest()['tenancy'])) {
               $this->RequiredsValidate();
               $this->profile = App\Models\Profile::where('email', $this->CustomRequest()['email']);               //Perfil
               $this->biller  = App\Models\Biller::where('identification_number', $this->CustomRequest()['NIT']);  //facturador
               /**
                * Nota: Henry por favor plantear todas las posibles validaciones de estado, paquete, documentos usados, etc..
                * Acá solo voy hacer una validación breve para mostrar la funcionalida de autenticación, si es exitosa retornará un token
                * que podrá ser usado durante en todas las llamadas a la API y sus métodos (End points).
                */

               /**
                * Se está valiando qué: Exista el perfil, el facturador, el password, el estado del perfil (Faltan)
                */
               if (true) { //if ($this->profile->first() != NULL && $this->biller->first() != NULL && password_verify($this->CustomRequest()['password'], $this->profile->first()->password) && $this->profile->first()->status == 1) {

                    //Pendiente definir el token e implementar el objeto Session::class
                    _json([
                         'code' => 202,
                         'data' => [
                              'message' => 'Accepted',
                              //Token data
                              'token'   => Session::SessionStart([
                                   'tenancy'     => $this->CustomRequest()['tenancy'], //Instance or Database
                                   'profile'     => $this->profile->first()->id, //Prodfile ID
                                   'biller'      => $this->biller->first()->id, //Biller ID
                                   'NIT'         => strval($this->biller->first()->identification_number), // NIT or VAT
                                   'remember_me' => (isset($this->CustomRequest()['remember_me'])) ? true : false //Remember me
                              ]),                         ]
                    ]);
               } else {
                    _json(['code' => 403, 'message' => 'Access permission denied']);
               }
          } else {
               _json(['code' => 403, 'message' => 'Access permission denied']);
          }
     }

     protected function HttpMethodValidate(): bool
     {
          $process = function ($flat) {
               if ($flat) {
                    return true;
               } else {
                    _json([
                         'code' => 400,
                         'data' => [
                              'message' => "Http method no valid"
                         ]
                    ], 400);
                    return false;
               }
          };
          $return = ($this->GetRequestMethod() == $this->http_method) ? $process(true) :  $process(false);
          return $return;
     }

     /**
      * RequiredsValidate()
      * @access public
      * @return void
      */
     public function RequiredsValidate(): void
     {
          foreach ($this->requireds_login as $key) {
               if (!isset($this->CustomRequest()[$key]) && empty($this->CustomRequest()[$key])) {
                    _json([
                         'code' => 400,
                         'data' => [
                              'message'     => 'Empty field',
                              'empty_field' => $key,
                         ]
                    ], 400);
                    die;
               } else {
                    continue;
               }
          }
     }

     /**
      * Index
      * Main method
      * @access public
      */
     public function index()
     {
          $this->ApiInfo();
     }

     /**
      * DatabaseValidate()
      * @access public
      * @param  string $db
      * @return bool
      */
     public function DatabaseValidate(string $db = ''): bool
     {
          //(EN) Here starts the ORM with the dummy database
          //(ES)Aquí se inicia el ORM con la base de datos dummy
          bootORM(config()->DB_DATABASE);
          //(EN) Here is get the databases
          //(ES) Aquí se obtiene la bases de datos
          $database = DB::select(
               DB::raw(db_query($db)),
               array(
                    ':db' => $db
               )
          );

          //(ES) Función anonima para ejecutar la validación
          //(EN) anonymous function execute the validation
          $process = function ($p, $db = '') {
               if ($p) {
                    //Set database tenancy
                    $this->db_tenancy = $db;
                    //Set tenancy
                    $this->SetTenancy();
                    return true;
               } else {
                    return false;
               }
          };

          (isset($database) && !empty($database)) ? $process(true, $database[0]->SCHEMA_NAME) : $process(false);
          if ($this->db_tenancy != NULL) {
               return true;
          } else {
               return false;
          }
     }

     /**
      * SetTenancy()
      * @access public
      * @return void
      */
     public function SetTenancy(): void
     {
          if ($this->db_tenancy != NULL) {
               bootORM($this->db_tenancy);
          }
     }
}
