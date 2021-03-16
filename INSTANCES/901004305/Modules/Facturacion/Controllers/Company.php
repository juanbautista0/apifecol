<?php

/**
 * @author Juan Bautista <soyjuanbautista0@gmail.com>
 * @author Apifecol
 * @license GNU General Public License v3.0 <https://www.gnu.org/licenses/gpl-3.0.html>
 * @package Facturacion
 * @subpackage Controllers
 * 
 * Hecho con amor en Colombia 🇨🇴.
 */

use \App\Traits\APIManager;


class Company extends Controller implements Http
{
    use APIManager;
    public $process;
    public function __construct(public $info)
    {
    }

    /**
     * index
     * Main method
     * @access public
     * @return void
     */
    public function index()
    {
        _json([], 404);
    }

    /**
     * config
     * @access public
     * @param string,int $nit
     * (EN) RUT Tax Identification Number.
     * (ES) Número de Identificación Tributaria RUT.
     */
    public function config(string | int $nit = '{nit}'): void
    {
        //Http method validate
        $this->process = match ($this->GetRequestMethod()) {
            'GET'    => $this->_GET($nit),
            'PUT'    => $this->_PUT($nit),
            'POST'   => $this->_POST($nit),
            'DELETE' => $this->_DELETE($nit),
        };
    }

    /**
     * _GET
     * (EN) get company data.
     * (ES) obtener datos de empresa
     * @access protected
     * @param string,int $nit
     * @return void
     */
    protected function _GET(string | int $nit = '{nit}'): void
    {
    }
    /**
     * _PUT
     * (EN) update company data.
     * (ES) actualizar datos de empresa
     * @access protected
     * @param string,int $nit
     * @return void
     */
    protected function _PUT(string | int $nit = '{nit}'): void
    {
    }
    /**
     * _POST
     * (EN) create company.
     * (ES) crear empresa.
     * @access protected
     * @param string,int $nit
     * @return void
     */
    protected function _POST(string | int $nit = '{nit}'): void
    {
    }
    /**
     * _DELETE
     * (EN) delete company.
     * (ES) eliminar empresa.
     * @access protected
     * @param string,int $nit
     * @return void
     */
    protected function _DELETE(string | int $nit = '{nit}'): void
    {
    }
}
