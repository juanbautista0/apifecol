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
        "Access-Control-Allow-Origin: *",
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
        foreach ($this->headers as $key) {
            header($key);
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
}
