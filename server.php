<?php

/**
 * ApiFecol PHP Framework | To continue programming
 *
 * @package  Public
 * @author   Juan Bautista <soyjuanbautista@gmail.com>
 */
define('APIFECOL_START', microtime(true));

$path_console = __DIR__ . DIRECTORY_SEPARATOR;




/*
|--------------------------------------------------------------------------
| Register The Auto Loader Composer
|--------------------------------------------------------------------------
|
| (EN) Class loader using composer for the entire application
| (ES) Cargador de clases mediante composer para toda la aplicacion
|
*/
(file_exists('../vendor/autoload.php')) ? require  '../vendor/autoload.php' : (isset($path_console) && file_exists($path_console . 'vendor/autoload.php') ? require $path_console . 'vendor/autoload.php' : true);



/*
|--------------------------------------------------------------------------
| Application settings
|--------------------------------------------------------------------------
|
| (EN) Here are the application settings
| (ES) Aquí se incluyen las configuraciones de la aplicacion
|
*/
require (isset($path_console)) ? $path_console . 'App/Config/Config.php' : '../App/Config/Config.php';


/*
|--------------------------------------------------------------------------
| Register The Auto Loader Genesis
|--------------------------------------------------------------------------
|
| (EN) Genesis Automatic class loader
| (ES) Cargador de clases automatico de genesis 
|
*/

spl_autoload_register(function ($className) use ($path_console) {
    $path_core = (isset($path_console)) ? str_replace('\\', '/', $className) .  '.php' : '../App/Core/' . str_replace('\\', '/', $className) .  '.php';
    //echo $path_core."<br>";die;
    //Instance by namespace
    $by_namespace = function () use ($className) {
        //Class
        $class = explode('\\', $className);
        //Path file
        $path_file  = dirname(dirname(__FILE__)) . DIRECTORY_SEPARATOR . str_replace('\\', '/',  join("\\", array_unique($class))) .  '.php';
        //Require
        (file_exists($path_file)) ? ($className != 'int' ? require_once $path_file : true) : true;
    };

    //Instantiated by the new statement or by namespace
    (file_exists($path_core)) ? require_once $path_core : $by_namespace();
});

/*
|--------------------------------------------------------------------------
| Application start
|--------------------------------------------------------------------------
| 
| (EN) Apifecol starts on a single line
| (ES) Apifecol se inicia en una sola linea
*/

return new \App\Core\Kernel;
