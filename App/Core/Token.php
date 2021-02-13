<?php

/**
 * Auth Class
 * @author Juan Bautista main developer
 * @package Lib
 */

namespace App\Core;

use Firebase\JWT\JWT;
use Exception;

class Token
{
    private static $secret_key;
    private static $encrypt = ['HS256'];
    private static $aud = null;
    private static $private_key;
    private static $public_key;
    private $certificate = 'genesis';
    public  static $token_time = 86400;
    private static $session_name = 'Genesis';

    public function __construct()
    {
        self::$private_key = config()->APP_SECRET_KEY;
        self::$public_key = config()->APP_PUBLIC_KEY;
        self::$private_key = ($this->issetCertificate('.pem') == true) ? file_get_contents(dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . $this->certificate . '.pem') : self::$secret_key;
        self::$public_key = ($this->issetCertificate('.pub') ==true) ? file_get_contents(dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . $this->certificate . '.pub') : self::$public_key;
    }

    /**
     * SignIn
     * (IN) This method is responsible for starting and generating the session token
     * (ES) Este método se encarga de iniciar y generar el token de sesión
     * @access public
     * @param array $data
     * Array que contiene toda la información de sesión del usuario
     * @return string
     */
    public static function SignIn(array $data = [], int $exp): string
    {
        session_name(self::$session_name);
        $time = time();
        $time = $time + self::$token_time;
        $exp = $exp ?? $time;
        $token = array(
            'exp' => $exp,
            'aud' => self::Aud(),
            'data' => $data
        );

        return JWT::encode($token, self::$private_key,'HS256');
    }

    /**
     * Check
     * (IN) This method is responsible for validating the session token
     * (ES) Este método se encarga de validar el token de sesion
     * @access public
     * @param string $token
     * Contiene el token codificado
     * @return bool
     */
    public static function Check(string $token, bool $encoded = false)
    {
        try {
            if (empty($token)) {
                throw new Exception("Invalid token supplied.");
                return false;
            } else {

                $decode = JWT::decode(
                    $token,
                    self::$private_key,
                    array('HS256')
                );

                if (!$encoded && $decode->aud === self::Aud()) {
                    return true;
                } else if ($encoded) {
                    return true;
                } else {
                    return false;
                }
            }
        } catch (\Throwable $th) {
            return false;
        }
    }

    /**
     * GetData
     * (IN) This method is responsible for obtaining the token information
     * decodes the data element
     * (ES) Este método se encarga de obtener la información del token
     * decofica el elemento data
     * @access public
     * @param string $token
     * Contiene el token codificado
     * @return object
     */
    public static function GetData(string $token): array
    {
        return (array) JWT::decode(
            $token,
            self::$private_key,
            self::$encrypt
        )->data;
    }

    /**
     * Aud
     * (IN)This method is responsible for obtaining the host information
     * client that communicates to the application and returns the information
     * encrypted.
     * (ES) Este método se encarga de obtener la información del host
     * cliente que se comunica a la aplicación y retorma la información
     * encriptada.
     * @access private
     * @return string
     */
    private static function Aud()
    {
        $aud = '';

        if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
            $aud = $_SERVER['HTTP_CLIENT_IP'];
        } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
            $aud = $_SERVER['HTTP_X_FORWARDED_FOR'];
        } else {
            $aud = $_SERVER['REMOTE_ADDR'];
        }

        $aud .= @$_SERVER['HTTP_USER_AGENT'];
        $aud .= gethostname();

        return sha1($aud);
    }

    /**
     * issetCertificate()
     * @access public
     * @param string $extension
     * Define la extensión del certificado
     * @return bool
     */
    public function issetCertificate(string $extension): bool
    {
        if (file_exists(dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . $this->certificate . $extension)) :
            return true;
        else :
            return false;
        endif;
    }
}
