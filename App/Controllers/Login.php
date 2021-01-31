<?php

/**
 * @author Henry Pandales <henrypandale@gmail.com>
 * @author Juan Bautista <soyjuanbautista0@gmail.com>
 *
 * @package Controllers
 */

use Illuminate\Database\Capsule\Manager as DB;
use \App\Core\Token;

class Login extends Controller implements Http
{
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


     public function __construct()
     {
     }

     /**
      * Index
      * Main method
      * @access public
      */
     public function index()
     {
          print_debug([$this->DatabaseValidate('apifecol'), $this->db_tenancy]);
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
          $database =  DB::select(db_query($db));

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
              $this
          }
          
     }
}
