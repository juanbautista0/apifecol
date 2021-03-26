<?php

namespace Traits;

/**
 * (EN) Certificate validator
 * (ES) Validador de certificados
 */

use Exception;

trait Certificates
{


    /**
     * BeforeGoingUp
     * @access public
     * @param string $certificate_base64
     * @param string $certificate_password
     * @return bool 
     */
    public function BeforeGoingUp(string $certificate_base64, string $certificate_password): bool
    {
        try {
            //Certificate format validation
            (!base64_decode($certificate_base64, true)) ? throw new Exception('Formato de certificado invalido.'): true;
            //Certificate reading validation
            (!openssl_pkcs12_read($certificateBinary = base64_decode($certificate_base64), $certificateData, $certificate_password)) ? throw new Exception('The certificate could not be read.'): true;
            return true;
        } catch (\Exception $th) {
            _json([
                'code' => 422,
                'data' => ['message' => $th->getMessage()]
            ], 422);

            return false;
        }
    }
}
