<?php

namespace App\Core;

define('PATH_CLI', dirname(dirname(__FILE__)));


class Cli
{

    public  $config;
     
    public function __construct(array $inputs = [])
    {
        if (!empty($inputs)) :
            self::CommandsManager($inputs);
        endif;
    }

    /**
     * @access public
     * @param array $console
     * All inputs from console GLI
     */
    public function CommandsManager(array $console)
    {
        unset($console[0]); //Delete genesis input
        if ($console[1] == 'Help' || $console[1] == 'help' || $console[1] == 'ayuda') :
            echo $this->Help();
            exit();
        endif;
        //Get commands config
        $this->config = parse_ini_file(PATH_CLI . DIRECTORY_SEPARATOR . 'Console' . DIRECTORY_SEPARATOR . 'commands.ini', true);
        foreach ($this->config as $key => $value) {
            foreach ($console as $key2 => $value2) {
                //validar si existe el comando padre
                if ($key == $console[1]) {
                    //verificar si existe el tipo de acción solicitada
                    if (isset($this->config[$key][$console[2]])) {
                        $console[3] = $console[3] ?? false;
                        if ($console[3]) {
                            self::BuilderInit($console[1], $console[2], $console[3]);
                        } else {
                            echo "(EN) \e[0;31mError: \e[0mA parameter was not indicated, its value should be like this: \e[0;34m" . $console[1] . " " . $console[2] . " item_name\e[0m" . " try with: \e[0;34mphp genesis help\e[0m\n";
                            echo "(ES) \e[0;31mError: \e[0mNo se indico un párametro, su camando debe ser así: \e[0;34m" . $console[1] . " " . $console[2] . " nombre_elemento" . "\e[0m intente con:  \e[0;34mphp genesis help\e[0m\n";
                        }
                        break;
                    } else {
                        echo "(EN) \e[0;32m" . $key . "\e[0m command available, but function \e[0;31m" . $console[2] . "\e[0m not found, try: \e[0;34mphp genesis help\e[0m\n";
                        echo "(ES) Comando \e[0;32m" . $key . "\e[0m disponible, pero la funcion \e[0;31m" . $console[2] . "\e[0m no fue encontrada, intente con: \e[0;34mphp genesis help\e[0m\n";
                        break;
                    }
                } else {
                }
            }
        }
        die();
    }
    /**
     * Help
     * (EN) This method was responsible for displaying the help screen for the console.
     * (ES) Este método se encarg de mostrar la pantalla de ayuda para la consola.
     * @access public
     * @return string 
     */
    public function Help()
    {
        $this->config = parse_ini_file(PATH_CLI . DIRECTORY_SEPARATOR . 'Console' . DIRECTORY_SEPARATOR . 'commands.ini', true);
        $display = "";

        foreach ($this->config as $key => $value) {
            $display .= $key . ":\n\n";
            foreach ($value as $subitem) {
                $search    = '__name__';
                $replace = "\e[0;34mitem_name\e[0m";
                $pos       = strrpos($subitem, $search);
                if ($pos !== false) {
                    $item = substr_replace($subitem, $replace, $pos, strlen($search));
                    $display .= $item . "\n";
                }
            }
        }


        return "-------------------------------------------------\n
        \e[1;37;44mGenesis Console Tool\e[0m\n-------------------------------------------------\n
        \nUsage: command [options] [arguments]\n\nAvailable commands:\n\n" . $display . "\n";
    }

    /**
     * BuilderInit
     * (EN) This method is responsible for managing the construction
     * of the valid request in the genesis console tool.
     * 
     * (ES) Este método se encarga de gestionar la construcción
     * de la petición valida en la herramienta de consola genesis.
     * 
     * @access public 
     * @param  string $action
     * Action to execute.
     * @param string $function
     * function call to action.
     * @return string
     */
    public function BuilderInit(string $action, string $function, string $parameter)
    {
        switch ($action) {
            case 'make':
                $method = "Create" . $function;
                self::$method($parameter);
                break;
            default:
                # code...
                break;
        }
    }

    /**
     * CreateController
     * (EN) This method is responsible for creating controllers.
     * (ES) Este método se encarga de crear controladores.
     * 
     * @access public
     * @param string $name
     * (EN) Defines the name of the controller you want to create.
     * (ES) Define el nombre del controlador que quiere crear.
     */
    public  function CreateController(string $name)
    {
        if (!file_exists(PATH_CLI . DIRECTORY_SEPARATOR . 'Controllers' . DIRECTORY_SEPARATOR . $name . ".php")) {
            // Abrir el archivo, creándolo si no existe:
            $file = fopen(PATH_CLI . DIRECTORY_SEPARATOR . 'Controllers' . DIRECTORY_SEPARATOR . $name . ".php", "w+b");


            if ($file == false) {
                echo "\e[0;31mError al crear el controlador\e[0m\n";
                echo "\e[0;31mFailed to create controller\e[0m\n";
            } else {
                $canvas = file_get_contents(PATH_CLI . DIRECTORY_SEPARATOR  . 'Console' . DIRECTORY_SEPARATOR . 'Controller.txt');
                $buscar    = '<controller></controller>';
                $remplazar = "" . $name . "";
                $pos       = strrpos($canvas, $buscar);
                if ($pos !== false) {
                    $controller = substr_replace($canvas, $remplazar, $pos, strlen($buscar));
                }
                // Escribir en el archivo:

                if (fwrite($file, $controller)) {
                    // Fuerza a que se escriban los datos pendientes en el buffer:
                    fflush($file);
                    echo "(EN) \e[0;42;30mController " . $name . " created successfully\e[0m\n";
                    echo "(ES) \e[0;42;30mControlador " . $name . " creado con éxito\e[0m\n";
                }
            }
            // Cerrar el archivo:
            fclose($file);
        } else {
            echo "(EN) The \e[1;33m" . $name . "\e[0m controller already exists.\n";
            echo "(ES) El controlador \e[1;33m" . $name . "\e[0m ya existe.\n";
        }
    }

    /**
     * CreateModel
     * (EN) This method is responsible for creating models.
     * (ES) Este método se encarga de crear modelos.
     * 
     * @access public
     * @param string $name
     * (EN) Defines the name of the model you want to create.
     * (ES) Define el nombre del model que quiere crear.
     */
    public  function CreateModel(string $name)
    {
        if (!file_exists(PATH_CLI . DIRECTORY_SEPARATOR . 'Models' . DIRECTORY_SEPARATOR . $name . ".php")) {
            // Abrir el archivo, creándolo si no existe:
            $file = fopen(PATH_CLI . DIRECTORY_SEPARATOR . 'Models' . DIRECTORY_SEPARATOR . $name . ".php", "w+b");


            if ($file == false) {
                echo "\e[0;31mError al crear el modelo\e[0m\n";
                echo "\e[0;31mFailed to create model\e[0m\n";
            } else {
                $canvas = file_get_contents(PATH_CLI . DIRECTORY_SEPARATOR  . 'Console' . DIRECTORY_SEPARATOR . 'Model.txt');
                $buscar    = '<model></model>';
                $remplazar = "" . $name . "";
                $pos       = strrpos($canvas, $buscar, 0);
                if ($pos !== false) {
                    $model = substr_replace($canvas, $remplazar, $pos, strlen($buscar));
                }
                // Escribir en el archivo:

                if (fwrite($file, $model)) {
                    // Fuerza a que se escriban los datos pendientes en el buffer:
                    fflush($file);
                    echo "(EN) \e[0;42;30mModel " . $name . " created successfully\e[0m\n";
                    echo "(ES) \e[0;42;30mModelo " . $name . " creado con éxito\e[0m\n";
                }
            }
            // Cerrar el archivo:
            fclose($file);
        } else {
            echo "(EN) The \e[1;33m" . $name . "\e[0m model already exists.\n";
            echo "(ES) El modelo \e[1;33m" . $name . "\e[0m ya existe.\n";
        }
    }
}
