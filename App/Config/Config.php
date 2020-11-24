<?php

/**
 * (EN) Application configuration parameter
 * (ES) Parametros de configuración de aplicación
 * @package App
 * @subpackage Config
 * @author  Juan Bautista <soyjuanbautista0@gmail.com>
 * 
 */

/*
|-------------------------------------------------------------------
| (EN) Load environment variables
| (ES) Carga de variables de entorno
|-------------------------------------------------------------------
|
| (EN) Dotenv class instance for using environment variables
| (ES) Instancia de la clase Dotenv para el uso de variables de entorno
*/

$env = Dotenv\Dotenv::createMutable(dirname(dirname(__FILE__)) . '../../');
$env->load();

/*
|-------------------------------------------------------------------
| (EN) Debug Mode
| (ES) Modo depuración
|-------------------------------------------------------------------
|
| (EN) Validate if debug mode is active 
| (ES) Validar si el modo depuración está activo.
|
*/

if ($_ENV['APP_DEBUG'] == "true") :
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);
endif;