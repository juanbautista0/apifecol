<?php

/**
 * ApiFecol PHP Framework | To continue programming
 *
 * @package  Public
 * @author   Juan Bautista <soyjuanbautista@gmail.com>
 */
define('APIFECOL_START', microtime(true));


/*
|--------------------------------------------------------------------------
| Register The Auto Loader Composer
|--------------------------------------------------------------------------
|
| (EN) Class loader using composer for the entire application
| (ES) Cargador de clases mediante composer para toda la aplicacion
|
*/
if (file_exists('../vendor/autoload.php')) {
    require '../vendor/autoload.php';
}


/*
|--------------------------------------------------------------------------
| Application settings
|--------------------------------------------------------------------------
|
| (EN) Here are the application settings
| (ES) Aquí se incluyen las configuraciones de la aplicacion
|
*/
require '../App/Config/Config.php';


/*
|--------------------------------------------------------------------------
| Register The Auto Loader Genesis
|--------------------------------------------------------------------------
|
| (EN) Genesis Automatic class loader
| (ES) Cargador de clases automatico de genesis 
|
*/
spl_autoload_register(function ($className) {

    //Instantiated by the new statement 
    if (file_exists('../App/Core/' . str_replace('\\', '/', $className) .  '.php')): 
        require_once '../App/Core/' . str_replace('\\', '/', $className) .  '.php';
    else: 
        $class = explode('\\', $className);
        if (file_exists(dirname(dirname(__FILE__)) . DIRECTORY_SEPARATOR . str_replace('\\', '/',  join("\\", array_unique($class))) .  '.php')): 
            //Instance by namespace
            if ($className != 'int'): 
                require_once  dirname(dirname(__FILE__)) . DIRECTORY_SEPARATOR . str_replace('\\', '/',  join("\\", array_unique($class))) .  '.php';
            endif;
        endif;

    endif;
});

/*
|--------------------------------------------------------------------------
| Application start
|--------------------------------------------------------------------------
| 
| (EN) Apifecol starts on a single line
| (ES) Apifecol se inicia en una sola linea
*/

$start = new Core;
