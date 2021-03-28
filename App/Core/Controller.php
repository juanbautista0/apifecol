<?php

namespace App\Core;

/**
 * Main controller Api Fecol Framework
 * (EN) This controller is responsible for managing the main logic of the 
 * application, views, models and useful methods.
 * 
 * (ES) Este controlador se encarga de gestionar la lógica 
 * principal de la aplicación, vistas, modelos y métodos utiles.
 * @package    App
 * @subpackage Core
 * @author     Juan Bautista <soyjuanbautista0@gmail.com>
 * 
 */

use Jenssegers\Blade\Blade;
use App\Core\ModuleManager;



class Controller extends Kernel
{
    /**
     * @var string $currentModule
     */
    public $currentModule;

    /**
     * @var object
     */
    public $moduleManager;
    /**
     * @var string
     */
    public $viewPath;
    /**
     * @var string
     */
    public $viewCache;

    /**
     * @var string $viewFormat;
     */
    public $viewFormat;

    /**
     * 
     * view
     * (EN) This method is responsible for rendering the views.
     * (ES) Este método se encarga de renderizar las vistas.
     * @param string $view
     * (EN) Name and path of the view file
     * (ES) Nombre y ruta del archivo de vista
     * @param array  $data
     * (EN) Array containing variables that will be passed to the view.
     * (ES) Array que contiene variables que seran pasadas a la vista.
     * @return object 
     * @show() Method to return view in a string.
     * @clean() Method in charge of clearing the view cache.
     */
    public function view(string $view, array $data = [], string $module = "", bool $minify = false)
    {
        $this->moduleManager = new ModuleManager('');
        $this->viewPath      = $this->moduleManager->plugins_path . $module . DIRECTORY_SEPARATOR . "Views" . DIRECTORY_SEPARATOR;
        $this->viewCache     = dirname(dirname(__FILE__)) . DIRECTORY_SEPARATOR . 'Views' . DIRECTORY_SEPARATOR . 'cache';
        $this->viewFormat    = '.blade.php';

        if (file_exists($this->viewPath) && file_exists($this->viewCache)) :
            $blade  = new Blade($this->viewPath, $this->viewCache);
            $render = ($minify != false) ?  $blade->make($view, $data)->render() : html_minify($blade->make($view, $data)->render());
            rmdir_($this->viewCache, true);
            return $render;
        endif;
    }

    /**
     * IndexParam()
     * @access public
     * @return mixed
     */
    public function IndexParam(): mixed
    {
        return (count($this->getUrl()) > 2) ? $this->getUrl()[3] : $this->getUrl();
    }
}
