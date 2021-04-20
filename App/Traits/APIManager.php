<?php

namespace App\Traits;

use \App\Core\LogsManager;


trait APIManager
{
    public $info_api;
    public $rest;
    public $_allow = array();
    public $_content_type = "application/json; charset=utf-8";
    public $_request = array();
    public $requireds;

    public $headers = [
        "Access-Control-Allow-Headers: *",
        "Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE",
        "Allow: GET, POST, OPTIONS, PUT, DELETE",
    ];
    public $_method = "";
    public $_code = 200;
    public  $apiModel;
    public  $result;
    public  $api_info;
    public  $api_ini;
    public  $scheme;
    public  $counter;
    public  $write_api;

    public function __construct()
    {
        $this->SetHeaders();
    }

    /**
     * CustomRequest
     * (ES) Permite visualizar los valores de las solicitudes personalizadas.
     * (EN) It allows to visualize the values of the customized requests.
     * @access public
     * @return array
     * con los datos enviados en las cabeceras.
     */
    public function CustomRequest(): array
    {
        switch ($this->GetRequestMethod()) {
                //Datos enviado por GET
            case 'GET':
                return $_GET;
                break;
                //Datos enviado por POST
            case 'POST':
                $_POST = $this->GetDataJson();
                return $_POST;
                break;
                //Datos enviado por PUT
            case 'PUT':
                $_PUT =  $this->GetDataJson();
                return $_PUT;
                break;
                //Datos enviado por UPDATE
            case 'UPDATE':
                $_UPDATE = $this->GetDataJson();
                return $_UPDATE;
                break;
                //Datos enviado por DELETE
            case 'DELETE':
                $_DELETE = $this->GetDataJson();
                return $_DELETE;
                break;
        }
    }


    /**
     * ApiInfo()
     * (EN) Show API info
     * (ES) Muestra información de la API
     * @access public
     * @return void
     */
    public function ApiInfo(): void
    {
        _json([
            'code' => 200,
            'data' => [
                'API' => config()->APP_NAME . " 🇨🇴",
                'description' => 'API facturación electrónica validación previa DIAN',
                'documentation' => 'apifecol.co',
                'response_time' => APIFECOL_START,

            ]

        ]);
    }


    /**
     * GetDataJson
     * @access public
     * @return array
     */
    public function GetDataJson(): array
    {
        return json_decode(file_get_contents('php://input'), true) ?? [];
    }

    /**
     * ResponseTemplate
     * @access public
     * @return array
     */
    public  function ResponseTemplate()
    {
        return [
            'code' => 200,
            'data' => []
        ];
    }

    /**
     * GetRequestMethod
     * @access public
     * Obtiene el tipo de método empleado para la petición hacía la API.
     * @return string 
     * El método usado por el cliente http.
     */
    public function GetRequestMethod(): string
    {
        return $_SERVER['REQUEST_METHOD'];
    }

    /**
     * SetHeaders
     * @access public
     * (ES) Defini los valores de las cabeceras por defecto para la API.
     * (EN) Define the header values for default for API.
     * @return void
     */
    private function SetHeaders(): void
    {
        $this->EnvironmentValidation();

        foreach ($this->headers as $key) {
            header($key);
        }
    }
    /**
     * EnvironmentValidation
     * @access public
     * @return void
     */
    public function EnvironmentValidation(): void
    {
        if (isset(config()->APP_TYPE_ENVIRONMENT)){
            $dev = fn () => array_push($this->headers, 'Access-Control-Allow-Origin: *');
            $production = function () {
                // get host name or IP address of the client
                if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
                    $origin = $_SERVER['HTTP_CLIENT_IP'];
                } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
                    $origin = $_SERVER['HTTP_X_FORWARDED_FOR'];
                } else {
                    $origin = $_SERVER['REMOTE_ADDR'];
                }

                if (!empty(explode(",", config()->APP_ALLOWED_DOMAINS))) {
                    if (in_array($origin, explode(",", config()->APP_ALLOWED_DOMAINS))) {
                        header('Access-Control-Allow-Origin: ' . $origin);
                    }
                } else {
                    header('Access-Control-Allow-Origin: *');
                }
            };
            
            match (config()->APP_TYPE_ENVIRONMENT) {
                "DEV"         => $dev(),
                'dev'         => $dev(),
                'DEVELOPMENT' => $dev(),
                'development' => $dev(),
                'PROD'        => $production(),
                'prod'        => $production(),
                'PRODUCTION'  => $production(),
                'production'  => $production(),
                default       => $dev()
            };

        }
    }


    public function GetAuthorizationHeader(): string
    {
        $headers = '';
        if (isset($_SERVER['Authorization'])) {
            $headers = trim($_SERVER["Authorization"]);
        } else if (isset($_SERVER['HTTP_AUTHORIZATION'])) { //Nginx or fast CGI
            $headers = trim($_SERVER["HTTP_AUTHORIZATION"]);
        } elseif (function_exists('apache_request_headers')) {
            $requestHeaders = apache_request_headers();
            // Server-side fix for bug in old Android versions (a nice side-effect of this fix means we don't care about capitalization for Authorization)
            $requestHeaders = array_combine(array_map('ucwords', array_keys($requestHeaders)), array_values($requestHeaders));
            if (isset($requestHeaders['Authorization'])) {
                $headers = trim($requestHeaders['Authorization']);
            }
        }

        if (!empty($headers)) {
            if (substr($headers, 7) != '') {
                return  trim(preg_replace("/\s+/", "", substr($headers, 7)));
            }
            /*if (preg_match('/Bearer\s(\S+)/', $headers, $matches)) {
                return $matches[1];
            }*/
        }
        return '';
    }

    public function get_status_message(): void
    {
    }

    /**
     * ApiLogs
     * @access public
     * @param array $info
     * @param string $info['type']
     * @param string $info['message']
     * @param string $info['user']
     * @return bool
     */
    public function ApiLogs(array $data): bool
    {
        new LogsManager($data);
        return true;
    }


    /**
     * SetMainHeaders
     * @access public
     * (ES) Defini los valores de la cabecera para las respuestas de la API.
     * (EN) Define the header values for API responses.
     * @return void
     */
    private function SetMainHeaders(): void
    {
        //header("HTTP/1.1 " . $this->_code . " " . $this->get_status_message());
        /*header("Content-Type:" . $this->_content_type);
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
        header("Allow: GET, POST, OPTIONS, PUT, DELETE");
        $method = $_SERVER['REQUEST_METHOD'];
        if ($method == "OPTIONS") {
            die();
        }*/
    }

    /**
     * UriValidate
     * @access public
     * @param string $uri
     * @return bool 
     */
    public function UriValidate(string $url): bool
    {
        $url_format = '/^(https?):\/\/' .                           // protocol
            '(([a-z0-9$_\.\+!\*\'\(\),;\?&=-]|%[0-9a-f]{2})+' .     // username
            '(:([a-z0-9$_\.\+!\*\'\(\),;\?&=-]|%[0-9a-f]{2})+)?' .  // password
            '@)?(?#' .                                              // auth requires @
            ')((([a-z0-9]\.|[a-z0-9][a-z0-9-]*[a-z0-9]\.)*' .       // domain segments AND
            '[a-z][a-z0-9-]*[a-z0-9]' .                             // top level domain  OR
            '|((\d|[1-9]\d|1\d{2}|2[0-4][0-9]|25[0-5])\.){3}' .
            '(\d|[1-9]\d|1\d{2}|2[0-4][0-9]|25[0-5])' .             // IP address
            ')(:\d+)?' .                                            // port
            ')(((\/+([a-z0-9$_\.\+!\*\'\(\),;:@&=-]|%[0-9a-f]{2})*)*' . // path
            '(\?([a-z0-9$_\.\+!\*\'\(\),;:@&=-]|%[0-9a-f]{2})*)' .      // query string
            '?)?)?' .                                                   // path and query string optional
            '(#([a-z0-9$_\.\+!\*\'\(\),;:@&=-]|%[0-9a-f]{2})*)?' .      // fragment
            '$/i';
        /**
         * String starts with something
         * 
         * This function will return true only if input string starts with
         * niddle
         * 
         * @param string $string Input string
         * @param string $niddle Needle string
         * @return boolean
         */
        $str_starts_with = function ($string, $niddle) {
            return substr($string, 0, strlen($niddle)) == $niddle;
        };

        if ($str_starts_with(strtolower($url), 'http://localhost')) {
            return true;
        }
        return preg_match($url_format, $url);
    }
}
