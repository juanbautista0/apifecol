<?php

namespace App\Core;

use Exception;

/**
 * LogsManager class
 * (EN) Logs Manager.
 * (ES) Administrador de logs.
 * @author Juan Bautista <soyjuanbautista0@gmail.com>
 * @author Apifecol
 * @license GNU General Public License v3.0 <https://www.gnu.org/licenses/gpl-3.0.html>
 * @package App
 * @subpackage Core
 * 
 * Hecho con amor en Colombia 🇨🇴.
 */


class LogsManager
{
    /**
     * @var string
     * 
     */
    public $log_path;

    /**
     * @var string
     * 
     */
    public $log_file;

    /**
     * @param array $info
     * @param string $info['type']
     * @param string $info['message']
     * @param string $info['user']
     */
    public function __construct($info = [])
    {
        $this->log_path = (isset($info['path']) && !empty($info['path'])) ? $info['path'] : $this->GetPath();
        $this->log_file = date("Y-m-d") . "-Logs.json";


        try {
            if (!empty($info)) {
                $this->writeLog(array(
                    'type'    => $info['type'],
                    'message' => $info['message'],
                    'user'    => (isset($info['user'])) ? $info['user'] : config()->APP_NAME
                ));
            } else {
            }
            // continue execution of the bootstrapping phase
        } catch (Exception $e) {
            $this->writeLog(array(
                'type'    => 'ERROR',
                'message' => $e->getMessage(),
            ));
        }
    }

    private function GetPath(): string
    {
        return dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . 'LOGS' . DIRECTORY_SEPARATOR;
    }

    /**
     * writeLog
     * (EN) Method for writing Logs.
     * (ES) Metodo para escribir Logs
     * @access public
     * @param array $data
     * @return void
     */
    public function writeLog(array $datos = []): void
    {

        (file_exists($this->log_path))?chmod($this->log_path, 777):true;


        # Crear carpeta si no existe
        if (!file_exists($this->log_path . $this->log_file)) {
            if (!file_exists($this->log_path)) {
                mkdir($this->log_path, 777, true);
                chmod($this->log_path, 777);
            }

            $file       = $this->log_path . $this->log_file;
            $fp         = fopen($file, 'w+');
            $jsonVECTOR = array(
                'data' => array(),
            );

            $logData =
                array(
                    "type"    => $datos["type"],
                    "message" => $datos["message"],
                    "user"    => $datos["user"],
                    "IP"      => $this->getRealIP(),
                    "date"    => date("Y-m-d H:i:s")
                );

            array_push($jsonVECTOR['data'], $logData);
            $file = $this->log_path . $this->log_file;
            $fp   = fopen($file, 'a+');
            fwrite($fp, json_encode($jsonVECTOR, JSON_UNESCAPED_UNICODE));
            fclose($fp);
        } else {
            $fileLog     = file_get_contents($this->log_path . $this->log_file);
            $decode_logs = json_decode($fileLog, TRUE);

            $dataLog = array(
                "type"    => $datos["type"],
                "message" => $datos["message"],
                "user"    => $datos["user"],
                "IP"      => $this->getRealIP(),
                "date"    => date("Y-m-d H:i:s")
            );

            array_push($decode_logs['data'], $dataLog);
            $file = $this->log_path . $this->log_file;
            $fp   = fopen($file, 'w+');
            fwrite($fp, json_encode($decode_logs, JSON_UNESCAPED_UNICODE));
            fclose($fp);
        }
    }

    /**
     * getRealIP
     * (EN) Method to obtain client IP.
     * (ES) Método para obtener IP del cliente.
     * @access public
     * @return string
     */
    public function getRealIP(): string
    {
        if (isset($_SERVER["HTTP_CLIENT_IP"])) {

            return $_SERVER["HTTP_CLIENT_IP"];
        } elseif (isset($_SERVER["HTTP_X_FORWARDED_FOR"])) {

            return $_SERVER["HTTP_X_FORWARDED_FOR"];
        } elseif (isset($_SERVER["HTTP_X_FORWARDED"])) {

            return $_SERVER["HTTP_X_FORWARDED"];
        } elseif (isset($_SERVER["HTTP_FORWARDED_FOR"])) {

            return $_SERVER["HTTP_FORWARDED_FOR"];
        } elseif (isset($_SERVER["HTTP_FORWARDED"])) {

            return $_SERVER["HTTP_FORWARDED"];
        } else {

            return $_SERVER["REMOTE_ADDR"];
        }
    }
}
