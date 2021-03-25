<?php
namespace App\Core;
/**
 * Core Class
 * (EN) It is responsible for executing the mvc pattern of the genesis framework.
 * (ES) Se encarga de ejecutar el patron mvc del framework genesis.
 *
 * @author Juan Bautista <soyjuanbautista0@gmail.com>
 */


class Kernel
{
    /**
     *
     * @var string
     * (EN) Current controller for the application during execution.
     * (ES) Define el controlador actual de la aplicación durante la ejecución.
     */
    protected $currentController;

    /**
     *
     * @var string
     * (EN) Current method for the application during execution.
     * (ES) Define el método actual de la aplicación durante la ejecución.
     */
    protected $currentMethod;

    /**
     *
     * @var array
     * (EN) url parameters.
     * (ES) parámetros url.
     */
    protected $parameters        = [];

    /**
     * @var object
     * (EN) Instance Profile
     * (ES) Perfil de Instancia
     */
    protected $profile;

    /**
     * @var object 
     * (EN) Session
     * (ES) Session
     */
    protected $access;

    public function __construct()
    {

        $this->currentController = $_ENV['APP_CONTROLLER'];
        $this->currentMethod = $_ENV['APP_INDEX'];
        \App\Core\ErrorHandler::Init();

        try {
            //$this->errorTry();

            $url = $this->getUrl();
            unset($_GET['url']);

            //(EN) Search in Controllers if the called controller exists.
            //(ES) Buscar en Controladores si el controlador llamado existe.
            if (file_exists(dirname(dirname(__FILE__)) . DIRECTORY_SEPARATOR . 'Controllers' . DIRECTORY_SEPARATOR . ucwords($url[0]) . '.php')) {

                // (EN) If the controller exists it is set as the default controller.
                // (ES) Si el controlador existe se setea como controlador por defecto.
                $this->currentController = ucwords($url[0]);
                //Unset index
                unset($url[0]);
            }
            if (file_exists(dirname(dirname(__FILE__)) . DIRECTORY_SEPARATOR . 'Controllers' . DIRECTORY_SEPARATOR . ucwords($this->currentController) . '.php')) {
                // (EN) Require controller
                // (ES) Requerir el controlador
                require_once dirname(dirname(__FILE__)) . DIRECTORY_SEPARATOR . 'Controllers' . DIRECTORY_SEPARATOR . ucwords($this->currentController) . '.php';
                $this->currentController = new $this->currentController;
            }
            // (EN) Check the second part of the url, the method the action.
            // (ES) Chequear la segunda parte de la url, el método la acción.
            if (isset($url[1])) {
                if (method_exists($this->currentController, $url[1])) {
                    //Chequeamos el método
                    $this->currentMethod = $url[1];
                    unset($url[1]);
                }
            }

            // (EN) Get parameters
            // (ES) Obtener parametros
            $this->parameters = $url ? array_values($url) : [];

            // (EN) Callback with an array of parameters.
            // (ES) Llamada de retorno con un array de parámetros.
            call_user_func_array([$this->currentController, $this->currentMethod], $this->parameters);
        } catch (\Throwable $th) {
            _json([
                'code'       => 500,
                'data'          => [
                    'message'    => "Server error",
                    'error'      => $th->getMessage(),
                    'line' => $th->getLine(),
                    'file' => explode(".", basename($th->getFile()))[0],
                ]
            ]);
        }
    }

    /**
     * getUrl
     * (EN) This method is responsible for mapping the url variable and setting its values ​​in an array.
     * (ES) Este método se encarga de mapear la variable url y setear sus valores en un arreglo.
     * @access public
     * @return array
     */
    public function getUrl(): array
    {

        if (isset($_GET['url'])) {
            // (EN) We clean the spaces that are to the right of the url.
            // (ES) Limpiamos los espacios que estan a la derecha de la url.
            $url = rtrim($_GET['url'], '/');
            $url = filter_var($url, FILTER_SANITIZE_URL);
            $url = explode('/', $url);
            return $url;
        } else {
            $url = urldecode(
                parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH)
            );

            $url = rtrim($url, '/');
            $url = filter_var($url, FILTER_SANITIZE_URL);
            $url = explode('/', $url);
            $url = array_values($url);
            unset($url[0]);
            $url = array_values($url);
            if (empty($url)) {

                $url[0] = $_ENV['APP_CONTROLLER'];
            }
        }
        return array_values($url);
    }

    /**
     *hostUri()
     * (EN) This method verifies the environment server.
     * (ES) Este método Verifica el servidor de entorno.
     * @access public 
     *  
     */
    public function hostUri()
    {
        //(EN) Default url of the application.
        $set = explode("://", $_ENV['APP_URL']);
        if ($set[1] != $_SERVER['HTTP_HOST']) {
            throw new Exception("Your variable for the application url (APP_URL) does not match the execution environment.");
        }
    }

    /**
     * errorTry
     * (EN) This method is responsible for capturing all errors, warnings and news generated during execution.
     * (ES) Este método se encarga de capturar todos los errores, advertencias y noticias generadas durante la ejecución.
     * @access public 
     */
    public function errorTry()
    {


        set_error_handler(function ($errno, $errstr, $errfile, $errline, $errcontext) {
            if (0 === error_reporting()) {
                return false;
            }
            throw new Exception($errstr, 0, $errno, $errfile, $errline);
        });
    }
}
