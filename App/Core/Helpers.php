<?php
use Illuminate\Database\Capsule\Manager as DB;

if(!function_exists('_json')){
    /**
     * _json
     * @param array $data
     * (EN) Array values
     * @param int $code
     * (EN) Http Code
     * @return void
     */
    function _json(array $data, $code = 200)
    {
        http_response_code($code);
        header('Content-Type: application/json;charset=utf-8');
        echo json_encode($data, JSON_PRETTY_PRINT);
    }
}


if(!function_exists('bootORM')){
    /**
     * bootORM
     * @param string $db
     * (EN) Database name
     * @return void
     */
    function bootORM(string $db = '')
    {
       $capsule = new DB;
       $capsule->addConnection([
        'driver'    => $_ENV['DB_DRIVER'],
        'host'      => $_ENV['DB_HOST'],
        'database'  =>($db != '')?$db: $_ENV['DB_DATABASE'],
        'username'  => $_ENV['DB_USERNAME'],
        'password'  => $_ENV['DB_PASSWORD'],
        'charset'   => $_ENV['DB_CHARSET'],
        'collation' => $_ENV['DB_COLLATION'],
        'prefix'    => '',
       ]);

       $capsule->setAsGlobal();
       $capsule->bootEloquent();
    }
}

if (!function_exists('config')) {
    /**
     * (EN) get environment var
     * (ES) trae las variables de entorno
     */
    function config()
    {
        $_ENV['APP_LANG'] = substr($_SERVER['HTTP_ACCEPT_LANGUAGE'], 0, 2);
        return (object) $_ENV;
    }
}

if (!function_exists('print_debug')) {
    /**
     * (EN) Get the OS string name
     * (ES) traer el nombre del SO
     */
    function print_debug($data = null, bool $var_dump = false)
    {
        if ($var_dump) {
            var_dump($data);
            die;
        } else {
            echo "<pre>";
            print_r($data ?? $_POST);
            echo "</pre>";
            die;
        }
    }
}

if (!function_exists('db_query')) {
    /**
     * (EN) Get the OS string name
     * (ES) traer el nombre del SO
     */
    function db_query($db)
    {
      return "SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME='{$db}'";
    }
}

