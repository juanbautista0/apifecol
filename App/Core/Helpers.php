<?php

use Illuminate\Database\Capsule\Manager as DB;

if (!function_exists('_json')) {
    /**
     * _json
     * @param array $data
     * (EN) Array values
     * @param int $code
     * (EN) Http Code
     * @return void
     */
    function _json(array $data, $code = 200, $callback = false, $exe_time = true)
    {
        if (isset($data['code']) && $code == 200) {
            http_response_code($data['code']);
        } else {
            http_response_code($code);
        }
        if ($exe_time && isset($data['data'])) {
            //$data['data']['execution_time'] = (microtime(true) - APIFECOL_START);
        }

        header('Content-Type: application/json;charset=utf-8');
        echo json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
        ($callback) ? $callback() : true;
        die;
    }
}

if (!function_exists('html_minify')) {
    /**
     * (EN) Html minify
     * (ES) Minificaodr de código html
     */
    function html_minify($html)
    {
        $busca     = array('/\>[^\S ]+/s', '/[^\S ]+\</s', '/(\s)+/s');
        $reemplaza = array('>', '<', '\\1');
        return preg_replace($busca, $reemplaza, $html);
    }
}

if (!function_exists('bootORM')) {
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
            'database'  => ($db != '') ? $db : $_ENV['DB_DATABASE'],
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
    function db_query($db = '')
    {
        return strval('SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME=:db');
    }
}

if (!function_exists('form_validator')) {
    /**
     * (EN) Form validator
     * (ES) Validador de formulario
     */
    function form_validator(array $data, array $exceptions = [])
    {
        //Exceptions validation
        foreach ($exceptions as $i => $var) {
            unset($data[$var]);
        }
        $counter      = 0;
        $empty_fields = array();
        //Inputs validation
        foreach ($data as $field => $value) {
            if (empty($value)) {
                array_push($empty_fields, $field);
                $counter++;
            }
        }

        //Response
        if ($counter > 0 && !empty($empty_fields)) :
            _json([
                'code' => 400,
                'data' => [
                    'message' => 'Empty fields',
                    'empty_fields' => $empty_fields
                ]
            ], 400);
            die;
        else :
            return true;
        endif;
    }
}

if (!function_exists('check_base64_image')) {

    /**
     * (EN) Base64 image validator
     * (ES) Validador de imagenes en base64
     * @param string $base64
     * @param string $extension
     * @return bool
     */
    function check_base64_image($base64, $extension = '.jpg'): bool
    {
        $img = imagecreatefromstring(base64_decode($base64));
        if (!$img) {
            return false;
        }

        imagejpeg($img, "tmp{$extension}");
        $info = getimagesize("tmp{$extension}");
        unlink("tmp{$extension}");

        if ($info[0] > 0 && $info[1] > 0 && $info['mime']) {
            return true;
        }

        return false;
    }
}

if (!function_exists('upload_base64_image')) {

    /**
     * (EN) Image loader base 64
     * (ES) Cargador de imagenes en base64
     * @param string $base64
     * @param string $extension
     * @return bool
     */
    function upload_base64_image($base64, $destination_path, $file_name): bool
    {
        if (file_exists($destination_path)) {
            $img = imagecreatefromstring(base64_decode($base64));
            if (!$img) {
                return false;
            }
            imagejpeg($img, "{$destination_path}{$file_name}");
            $info = getimagesize("{$destination_path}{$file_name}");

            if ($info[0] > 0 && $info[1] > 0 && $info['mime']) {
                return true;
            }

            return false;
        }
        return false;
    }
}

if (!function_exists('rmdir_')) {
    /**
     * (EN) Directory deletion recursively.
     * (ES) Eliminación de directorio de manera recursiva.
     */
    function rmdir_($path, bool $path_delete = false)
    {
        if (!is_dir($path)) {
            throw new InvalidArgumentException("{$path} is not a directory");
        }
        if (substr($path, strlen($path) - 1, 1) != '/') {
            $path .= '/';
        }
        $dotfiles = glob($path . '.*', GLOB_MARK);
        $files    = glob($path . '*', GLOB_MARK);
        $files    = array_merge($files, $dotfiles);
        foreach ($files as $file) {
            if (basename($file) == '.' || basename($file) == '..') {
                continue;
            } else if (is_dir($file)) {
                rmdir_($file);
            } else {
                unlink($file);
            }
        }
        if (!$path_delete && rmdir($path)) {
            return true;
        } else if ($path_delete) {
            return true;
        } else {
            return false;
        }
    }
}

if (!function_exists('inputs_validator')) {
    /**
     * (EN) Form validator
     * (ES) Validador de formulario
     */
    function inputs_validator(array $inputs = [], array $requireds = [], array $exceptions = [], string $entity = "")
    {
        $empty = function ($i, $callback = false) {
            ($callback) ? $callback() : true;
            return _json([
                'code' => 400,
                'data' => [
                    'message'      => 'Empty fields',
                    'empty_fields' => $i
                ]
            ], 400);
        };
        //validar entradas
        (empty($inputs)) ? $empty($entity, function () use ($requireds, $entity, $exceptions) {
            return _json([
                'code' => 400,
                'data' => [
                    'message'      => 'Empty fields',
                    'empty_fields' => $entity,
                    'example'      => $requireds,
                    'not_required' => array_keys($exceptions)
                ]
            ], 400);
        }) : true;

        //Iteración sobre los campos requeridos
        foreach ($requireds as $key => $value) {
            //Validar si existe el indice principal
            if (isset($inputs[$key])) {

                if (!isset($exceptions[$key])) {
                    //Validar si indice es un array
                    if (is_array($inputs[$key]) && isset($requireds[$key])) {

                        //Si es un array iteramos sobre los campos del mismo
                        foreach ($requireds[$key] as $key1 => $value1) {
                            if (is_array($inputs[$key][$key1])) {
                                //Comentar y crear la forma de validar
                                continue;
                                foreach ($inputs[$key][$key1] as $key2 => $value2) {
                                    if (isset($requireds[$key][$key1][$key2])) {
                                        //Validar si existe
                                        (!isset($inputs[$key][$key1][$key2])) ? $empty("{$key}=>{$key2}") : true;
                                        //validar que no esté vacio
                                        (empty($inputs[$key][$key1][$key2])) ? $empty("{$key}=>{$key2}") : true;
                                    } else {
                                        //Mensaje de campo vacio
                                        $empty("{$key}=>{$key2}");
                                    }
                                }
                            } else {
                                if (isset($requireds[$key][$key1])) {
                                    //Validar si existe
                                    (!isset($inputs[$key][$key1])) ? $empty("{$key}=>{$key1}") : true;
                                    //validar que no esté vacio
                                    (empty($inputs[$key][$key1])) ? $empty("{$key}=>{$key1}") : true;
                                } else {
                                    //Mensaje de campo vacio
                                    $empty("{$key}=>{$key1}");
                                }
                            }
                        }
                    } else {
                        //Validar que no esté vacio
                        ($inputs[$key] === NULL || $inputs[$key] == "") ? $empty($key) : true;
                    }
                } elseif (isset($exceptions[$key]) && !empty($inputs[$key])) {
                    //Validar si indice es un array
                    if (is_array($inputs[$key])) {
                        //Si es un array iteramos sobre los campos del mismo
                        foreach ($requireds[$key] as $key1 => $value1) {

                            if (isset($inputs[$key][$key1])) {
                                (!isset($inputs[$key][$key1]))                                ? $empty("{$key}=>{$key1}") : true;
                                ($inputs[$key][$key1] === NULL || $inputs[$key][$key1] == "") ? $empty("{$key}=>{$key1}") : true;
                            } else {
                                $empty("{$key}=>{$key1}");
                            }
                        }
                    } else {
                        //Validar que no esté vacio
                        ($inputs[$key] === NULL || $inputs[$key] == "") ? $empty($key) : true;
                    }
                } else {
                    continue;
                    if (is_array($inputs[$key])) {
                        //Si es un array iteramos sobre los campos del mismo
                        foreach ($inputs[$key] as $key1 => $value1) {

                            if (isset($inputs[$key][$key1])) {
                                ($inputs[$key][$key1] === NULL || $inputs[$key][$key1] == "") ? $empty("{$key}=>{$key1}") : true;
                            } else {
                                $empty("{$key}=>{$key1}");
                            }
                        }
                    } else {
                        ($inputs[$key] === NULL || $inputs[$key] == "") ? $empty($key) : true;
                    }
                }
            } else {
                //Sino existe en las entradas, pero si en los requeridos y no está en excepciones
                if (isset($requireds[$key]) && !isset($exceptions[$key])) {
                    //Mensaje de campo vacio
                    $empty($key);
                }
            }
        }
    }
}
