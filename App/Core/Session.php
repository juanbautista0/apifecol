<?php

namespace App\Core;

use App\Core\Token, DateTime;

/**
 * (EN) management class of session status
 * (ES) clase para manejar sesiones
 * @package Genesis
 * @author Juan Bautista
 * @author Andrés Felipe Delgado
 * 
 */
class Session
{
    /**
     * (ES) cookie con el token
     * (EN) token string
     * @var string
     */
    public static $token;
    public static $auth;
    public function __construct()
    {
    }
    /**
     * SessionStart()
     * @access public 
     * (ES) Método que inicia sesíon creando el JWT necesario y seteando su cookie
     * @param array $datos
     * Datos a guardar en el token
     * @param array $exc
     * Excepciones a no guardar en el token
     */
    public static function SessionStart(array $datos, array $exc = []): string
    {
        self::$token = new Token;
        if (count($exc) > 0) {
            foreach ($exc as $key => $value) {
                unset($datos[$value]);
            }
        }
        date_default_timezone_set($datos['time_zone'] ?? $_ENV['APP_TIME_ZONE']);
        $time = ($datos['remember_me'] == true) ? self::TokenTime(30) : self::TokenTime(1);
        return self::$token->SignIn($datos, $time);
    }
    /**
     * TokenTime()
     * @access public
     * @param int $days
     */
    public static function TokenTime(int $days)
    {
        $time =  new DateTime('now');
        $time = explode(" = ", $time->format('U = Y-m-d H:i:s'));
        $time = intval($time[0]) +  (60 * 60 * 24 * $days);
        return $time;
    }
    /**
     * SessionGetData()
     * @access public
     * (ES) Método que trae los datos de un JWT
     * @param string $token
     * Token pa decodificar
     */
    public static function SessionGetData(string $tokenString)
    {
        self::$token = new Token;
        if (!empty($tokenString)) {

            return self::$token->GetData($tokenString);
        }
    }
    /**
     * sessionValidator()
     * @access public 
     * (ES) Método que valida el token del cliente y inicia el ORM
     */
    public static function sessionValidator(string $token, array $exceptions = [])
    {

        self::$token = new Token;
        if (self::$token->Check($token)) {
            //setea una cookie en caso de que se elimine token que permita cerrar sesión de manera segura
            self::AddDBContext($token);
        } else {
            if (!empty($exceptions)) {
                //Permite
            } else {
                //self::sessionDestroy();
                _json(['code' => 401, 'data' => [
                    'message' => 'Unauthorized'
                ]]);
            }
        }
    }
    /**
     * Método exclusivo de Login Controller
     */
    public static function islogged(string $token, array $exceptions = [])
    {
        self::$token = new Token;
        if (self::$token->Check($token)) {
            _json([
                'code' => 202,
                'data' => [
                     'message' => 'Accepted',
                ]
            ]);
        } else {
            if (!empty($exceptions)) {
                //Permite
            } else {
                //self::sessionDestroy();
                _json(['code' => 401, 'data' => [
                    'message' => 'Unauthorized'
                ]]);
            }
        }
    }
    /**
     * sessionDestroy()
     * @access public
     * Método que destruye la session
     */
    public static function sessionDestroy()
    {
        //SI el token está definido reduce un devices logged en BD por peticion api y destruye las cookies
        if (true) {
        } elseif (false) {
            //si token no está definida permite usar la cookie wp-flag para traer los datos necesarios para una peticion api que reduzca en uno el devices_logged del usuario en BD

            //Destruye sesión/token

        } else {
        }
    }
    /**
     * @access public
     * (ES) Método que inicia ORM cuando ya se ha validado la session
     */
    public static function AddDBContext(string $token)
    {
        if (isset(self::SessionGetData($token)['tenancy']) && !empty(self::SessionGetData($token)['tenancy'])) {
            bootORM(self::SessionGetData($token)['tenancy']);
        } else {
            _json(['code' => 400, 'data' => [
                'message' => 'Bad Request'
            ]]);
        }
    }
}
