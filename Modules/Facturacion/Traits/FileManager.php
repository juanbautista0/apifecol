<?php

namespace Traits;

use Traits\DeployBillerDirectory;
use Traits\Certificates;
use ZipArchive;

/**
 * FileManager
 */
trait FileManager
{

    /**
     * @var array
     * @access public
     */
    public $extension_certificates = ['pfx'];

    /**
     * @var string
     * @access public
     */
    public $file_name;

    /**
     * @var string
     * @access public
     */
    public $xml_name;

    use DeployBillerDirectory;
    use Certificates;
    /**
     * UploadCertificate()
     * @access public
     * @param string $storage_path
     * @param string $certificateBase64
     * @param string $certificatePassword
     * @return string
     */
    public function UploadCertificate(string $storage_path, string $certificateBase64, string $certificatePassword) //: bool
    {

        //validate
        $this->BeforeGoingUp($certificateBase64, $certificatePassword);

        if (file_exists($storage_path)) {
            //Nombre del archivo a guardar
            $file_name   = time() .  date("Y")."certificate.pfx";

            //Ruta donde se guara el archivo
            $target_file = $this->CerticatePath($storage_path) . $file_name;

            //Aquí se guardar certificado
            if (file_put_contents($target_file, base64_decode($certificateBase64))) {
                return $file_name;
            } else {

                return "";
            }
        } else {

            return "";
        }
    }

    /**
     * CerticatePath()
     * (EN) Method of returning the path where the electronic signature certificates are stored.
     * (ES) Método encardor de retornar la ruta donde se almacenan los certificados de firma electrónica.
     * @access public
     * @param string $storage_path
     * (EN) Path of the instance and the corresponding module.
     * (ES) Ruta de la instancia y el modulo correspondiente.
     * @return string
     */
    public function CerticatePath(string $storage_path): string
    {
        return $storage_path . DIRECTORY_SEPARATOR . $this->main_path . $this->scheme_directory[0] . DIRECTORY_SEPARATOR;
    }


    /**
     * XmlSignedPath()
     * (EN) Method in charge of returning the path where the signed xml are stored.
     * (ES) Método encargado de retornar la ruta donde se almacenan los xml firmados.
     * @access public
     * @param string $storage_path
     * (EN) Path of the instance and the corresponding module.
     * (ES) Ruta de la instancia y el modulo correspondiente.
     * @return string
     */
    public function XmlSignedPath(string $storage_path): string
    {
        return $storage_path . DIRECTORY_SEPARATOR . $this->main_path . $this->xml_main_path . $this->scheme_directory['xml'][1] . DIRECTORY_SEPARATOR;
    }

    /**
     * AttachmentPath()
     * (EN) Method in charge of returning the path where the signed xml are stored.
     * (ES) Método encargado de retornar la ruta donde se almacenan los xml firmados.
     * @access public
     * @param string $storage_path
     * (EN) Path of the instance and the corresponding module.
     * (ES) Ruta de la instancia y el modulo correspondiente.
     * @return string
     */
    public function AttachmentPath(string $storage_path): string
    {
        return $storage_path . DIRECTORY_SEPARATOR . $this->main_path . $this->xml_main_path . $this->scheme_directory['xml'][3] . DIRECTORY_SEPARATOR;
    }


    /**
     *  XmlResponsesPath()
     * (EN) Method in charge of returning the path where the xml are stored with the signed DIAN response.
     * (ES) Método encargado de retornar la ruta donde se almacenan los xml con la respuesta de la DIAN firmados.
     * @access public
     * @param string $storage_path
     * (EN) Path of the instance and the corresponding module.
     * (ES) Ruta de la instancia y el modulo correspondiente.
     * @return string
     */
    public function XmlResponsesPath(string $storage_path): string
    {
        return $storage_path . DIRECTORY_SEPARATOR . $this->main_path . $this->xml_main_path . $this->scheme_directory['xml'][2] . DIRECTORY_SEPARATOR;
    }

    /**
     * nombreArchivo()
     * (EN) It is responsible for defining the name of the electronic document.
     * (ES) Se encarga de definir el nombre del documento electrónico.
     *
     * @param string $letter
     * (EN) Letter that defines the type of document.
     * (ES) Letra que define el tipo de documento.
     * @param string $nit
     * (EN) Electronic Biller (TIC/TIN) without DV, ten (10) digits aligned on the right and 
     * filled with zeros on the left.
     * (ES) (NIT/CC) del Facturador Electrónico sin DV, de diez (10) dígitos  
     * alineados a la derecha y relleno con ceros a la izquierda.
     * @param int $numero
     * (EN) Numbering of the electronic document.
     * (ES) Numeración del documento electrónico.
     *
     * @var string $prefix
     * @return string
     * example return: fv08001972680001900000011
     */
    public function ElectronicDocumentName($letter, $nit, $number, $prefix = ""): string
    {
        return    $prefix . str_pad($nit, 10, "0", STR_PAD_LEFT) . $letter . substr(strval(date("Y")), -2) . str_pad($number, 8, "0", STR_PAD_LEFT); //consecutivo de archivos enviados, de ocho (8) dígitos decimales alineados a la derecha
    }

    /**
     * @access public
     * @param  string $zip_path
     * @param  string $xml_signed
     * @param  string $file_name;
     * @param  string $xml_name;
     * 
     * @return string 
     */
    public function PackingZip(string $zip_path, string $xml_signed, string $file_name, $xml_name): string
    {
        // crear new zip
        $zip = new ZipArchive;
        $zip->open($zip_path . $file_name, ZipArchive::CREATE);
        // agregar el xml filmado 
        $zip->addFromString($zip_path . $xml_name, $xml_signed);
        $zip->close();

        // get the contents 
        $document = file_get_contents($zip_path . $file_name);

        // codificar
        return base64_encode($document);
    }
}
