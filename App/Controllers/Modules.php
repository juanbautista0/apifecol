<?php

/**
 * @author Juan Bautista <soyjuanbautista0@gmail.com>
 * @author Apifecol
 *
 * @package Controllers
 */

use App\Core\ModuleManager;
use \App\Traits\APIManager;
use \App\Core\Session;
use \App\Models\Profile;

class Modules extends Controller
{
     use APIManager;

     /**
      * @var string $module_path
      * @access public
      */
     public $module_path;
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
      * @var array
      */
     public $info;


     /**
      * @var object $result;
      */
     public $result;

     /**
      * @var string $prefix
      */
     public $prefix;

     public $module;
     public $controller;
     public $method;
     public $param;
     public function __construct()
     {
          $this->SetHeaders();
          $this->module_path = dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . config()->APP_MODULE_PATH . DIRECTORY_SEPARATOR;


          $process = function (bool $context = false, array $data = []) {
               /**
                * $data['key]
                * [0 => "id profile", 1 => "user_type", 2 => "tenancy"]
                */
               if ($context && !empty($data)) :
                    bootORM(explode(".", base64_decode(base64_decode($data['key'])))[2]);
                    $this->model = new Profile;
                    $this->Enrichment($this->model::where('id', explode(".", base64_decode(base64_decode($data['key'])))[0])->first()->toArray(), explode(".", base64_decode(base64_decode($data['key'])))[1], explode(".", base64_decode(base64_decode($data['key'])))[2], explode(".", base64_decode(base64_decode($data['key'])))[0]);
               else :
                    Session::sessionValidator($this->GetAuthorizationHeader());
                    $this->model = new Profile;

                    //(EN) Get data token
                    //(ES) Obtener datos del token
                    $this->payload = Session::SessionGetData($this->GetAuthorizationHeader());
                    $this->Enrichment($this->model::where('id', $this->payload['profile'])->first()->toArray(), (isset($this->payload['NIT']) && !empty($this->payload['NIT'])) ? $this->payload['NIT'] : $this->CustomRequest()['NIT'], $this->payload['tenancy'], $this->payload['profile']);
                    $this->ModuleLoader($this->getUrl());

               endif;
          };

          //Validate ejecution context
          match (true) {
               (isset($_GET['key']) && !empty($_GET['key']) && count(explode(".", base64_decode(base64_decode($_GET['key'])))) == 3) => $process(true, $_GET),
               (isset($_POST['key']) && !empty($_POST['key']) && count(explode(".", base64_decode(base64_decode($_POST['key'])))) == 3) => $process(true, $_POST),
               default => $process(),
          };
     }

     /**
      * Index
      * Main method
      * @access public
      */
     public function index()
     {
     }

     public function Enrichment(array $profile, string $nit, string $db, int $profile_id)
     {
          $this->info   = $profile;
          $this->info['instance']  = $nit;
          $this->info['database']   = $db;
          $this->info['profile_id'] = $profile_id;
     }

     /**
      * ModuleLoader
      * (EN) Application module loader
      * (ES) Cargador de módulos de aplicación
      * @access public
      * @param array
      */
     public function ModuleLoader(array $uri)
     {
          //Module
          $this->module = (isset($uri[1]) && !empty($uri[1])) ? $uri[1] : null;
          //Controller
          $this->controller = (isset($uri[2]) && !empty($uri[2])) ? ucwords($uri[2]) : null;
          //Method
          $this->method = (isset($uri[3]) && !empty($uri[3])) ? $uri[3] : config()->APP_INDEX;
          //Param
          $this->param = (isset($uri[4]) && !empty($uri[4])) ? $uri[4] : null;

          $this->manager = new ModuleManager($this->info['instance']);

          // (EN) Check that the module and its package exist
          // (ES) Comrpobar que el módulo y su paquete existe
          if (file_exists($this->manager->plugins_path . $this->module . DIRECTORY_SEPARATOR . "Controllers" . DIRECTORY_SEPARATOR . $this->controller . ".php")) {

               //(ES) Cargador de clases de módulo
               $this->AutoloaderModules($this->manager->plugins_path . $this->module . DIRECTORY_SEPARATOR);
               //Define module permissions
               //chmod($this->manager->plugins_path . $this->module,  0777);
               //$this->ModuleValidator();

               // (EN) Require the module with its representation in controller
               //((ES) Requerir el módulo con su representación en controlador)

               require_once $this->manager->plugins_path . $this->module . DIRECTORY_SEPARATOR . "Controllers" . DIRECTORY_SEPARATOR . $this->controller . ".php";
               $this->controller              = new $this->controller($this->info);
               $this->controller->profile     = $this->info;
               $this->controller->path_module = $this->manager->plugins_path . $this->module . DIRECTORY_SEPARATOR;
               $this->controller->module      = $this->module;





               // (EN) clean up and url to just use the parameters
               // (ES) limpiar y url para solo usar los párametros
               unset($uri[0]);
               unset($uri[1]);
               unset($uri[2]);
               unset($uri[3]);

               $this->param = $uri ? array_values($uri) : [];
               if (method_exists($this->controller, $this->method)) {
                    return call_user_func_array(array($this->controller, $this->method), $this->param);
               } else {
                    if ($this->method == 'cron' || $this->method  == 'Cron') {
                         exit();
                    } else {
                         return call_user_func_array(array($this->controller, config()->APP_INDEX), $this->param);
                    }
               }
          } else {
               _json([], 404);
          }
     }

     /**
      * AutoloaderModules
      * (EN) Class loader
      * (ES) Cargador de clases
      * @access public
      * @param string
      * @return void
      */
     public function AutoloaderModules(string $path): void
     {

          try {
               spl_autoload_register(function ($className) use ($path) {
                    //Instantiated by the new statement 
                    if (file_exists($path . str_replace('\\', '/', $className) .  '.php')) :
                         require_once $path . str_replace('\\', '/', $className) .  '.php';
                    else :
                         //Instance by namespace
                         if ($className != 'int') :
                              $class = explode('\\', $className);
                              //echo  $path . str_replace('\\', '/',  join("\\", array_unique($class))) .  '.php';
                              if (file_exists($path . str_replace('\\', '/',  join("\\", array_unique($class))) .  '.php')) :
                                   require_once  $path . str_replace('\\', '/',  join("\\", array_unique($class))) .  '.php';
                              endif;
                         endif;
                    endif;
               });
          } catch (\Exception $th) {
               throw $th;
          }
     }
}
