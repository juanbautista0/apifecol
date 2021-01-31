<?php

namespace App\Traits;

trait APIManager
{
    public $info_api;
    public $rest;
    public $_allow = array();
    public $_content_type = "application/json; charset=utf-8";
    public $_request = array();
    public $requireds;

    public $headers = [
        'Access-Control-Allow-Origin: *',
        'Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method',
        'Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE',
        'Allow: GET, POST, OPTIONS, PUT, DELETE'
    ];
    private $_method = "";
    private $_code = 200;
    public  $apiModel;
    public  $result;
    public  $api_info;
    public  $api_ini;
    public  $scheme;
    public  $counter;
    public  $write_api;

    public function __construct()
    {

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
                return $_POST;
                break;
                //Datos enviado por PUT
            case 'PUT':
                parse_str(file_get_contents("php://input"), $_PUT);
                return $_PUT;
                break;
                //Datos enviado por UPDATE
            case 'UPDATE':
                parse_str(file_get_contents("php://input"), $_UPDATE);
                return $_UPDATE;
                break;
                //Datos enviado por DELETE
            case 'DELETE':
                parse_str(file_get_contents("php://input"), $_DELETE);
                return $_DELETE;
                break;
        }
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

    /**
     * SetMainHeaders
     * @access public
     * (ES) Defini los valores de la cabecera para las respuestas de la API.
     * (EN) Define the header values for API responses.
     * @return void
     */
    private function SetMainHeaders(): void
    {
        header("HTTP/1.1 " . $this->_code . " " . $this->get_status_message());
        header("Content-Type:" . $this->_content_type);
    }
}
