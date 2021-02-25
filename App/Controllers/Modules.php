<?php

/**
 * @author Juan Bautista <soyjuanbautista0@gmail.com>
 * @author Apifecol
 *
 * @package Controllers
 */

use \App\Traits\APIManager;
use \App\Core\Session;

class Modules extends Controller
{
     use APIManager;

     /**
      * @var string $module_path
      * @access public
      */
     public $module_path;


     public $module;
     public $controller;
     public $method;
     public $param;
     public function __construct()
     {
          $this->SetHeaders();
          //Session::sessionValidator($this->GetAuthorizationHeader());
          $this->module_path = dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . config()->APP_MODULE_PATH . DIRECTORY_SEPARATOR;
          print_debug($this->module_path);
     }

     /**
      * Index
      * Main method
      * @access public
      */
     public function index()
     {
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
     }
}
