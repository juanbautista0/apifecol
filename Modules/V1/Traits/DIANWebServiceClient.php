<?php

namespace Traits;

use Traits\FileManager;
use Exception;
use DOMDocument;
use stdClass;

/**
 * (EN) DIAN Web Service Client
 * (ES) Cliente de servicio web DIAN
 */
trait DIANWebServiceClient
{
    /**
     * @var string 
     * 
     */
    public $wsAction = 'http://wcf.dian.colombia/IWcfDianCustomerServices/';

    /**
     * @var string 
     * 
     */
    public $bodyXml = 'http://wcf.dian.colombia/IWcfDianCustomerServices/';

    /**
     * @var array
     * 
     */
    public $availableMethods = [
        'GetStatus',
        'GetStatusZip',
        'SendBillAsync',
        'SendBillSync',
        'SendTestSetAsync',
        'GetXmlByDocumentKey',
        'GetNumberingRange'
    ];


    /**
     * @var bool
     */
    public $byepass = false;


    /**
     * @var object
     */
    public $result;


    /**
     * @var array
     */
    public $urlWSDian = [
        '3' =>  [
            'urlDian' => "https://gtpa-webservices-input-test.azurewebsites.net/WcfDianCustomerServices.svc?wsdl",
            '_WSA_TO' => "https://gtpa-webservices-input-test.azurewebsites.net/WcfDianCustomerServices.svc",
        ],
        '2' =>[
            'urlDian' => "https://vpfe-hab.dian.gov.co/WcfDianCustomerServices.svc?wsdl",
            '_WSA_TO' => "https://vpfe-hab.dian.gov.co/WcfDianCustomerServices.svc",
        ],
        '1' =>[
            'urlDian' => "https://vpfe.dian.gov.co/WcfDianCustomerServices.svc?wsdl",
            '_WSA_TO' => "https://vpfe.dian.gov.co/WcfDianCustomerServices.svc?",
        ]
    ];

    /**
     * @var array
     */
    public $urlWSDianDefault =[
        'urlDian'   => "https://vpfe-hab.dian.gov.co/WcfDianCustomerServices.svc?wsdl",
        '_WSA_TO'   => "https://vpfe-hab.dian.gov.co/WcfDianCustomerServices.svc",
    ];


    /**
     * @var string
     */
    public $set_enviroment;


    /**
     * (EN) This method defines the url of the DIAN web services, through the environment used
     * (ES) Este método define la url del web services de la DIAN, mediante el ambiente usado
     * @access public
     * @var string $enviroment
     * @return array
     */
    public function urlWS_DIAN(string $environment): array
    {
        if(isset($this->urlWSDian[$environment])):
            return $this->urlWSDian[$environment];
        else:
            return $this->urlWSDianDefault;
        endif;
    }


    /**
     * (EN) Base xml template for SOAP requests.
     * (ES) Plantilla xml base para las peticiones SOAP.
     * 
     * @return string
     */
    public function BaseXml(string $body = "")
    {
        return $body;
    }

    /**
     * (EN) Template get status
     * (ES) Plantilla Obtener estado.
     * @var string $trackId
     * Track ID CUFE del Documento Electrónico
     * 
     * @var string $environment
     * Tipo de ambiente para el envio
     * @return string
     */
    public function GetStatus(string $trackId, string $environment): string
    {

        $this->set_enviroment = $environment;
        return $this->XmlGenerate(
            <<<XML
            <wcf:GetStatus>
                <wcf:trackId>{$trackId}</wcf:trackId>
            </wcf:GetStatus>
            XML,
            $environment,
            'GetStatus'
        );
    }


    /**
     * (EN) Template to send invoice asynchronously.
     * (ES) Plantilla para enviar factura de forma asincrona.
     * @var string $fileName
     * Nombre del archivo que se envia.
     * 
     * @var string $contentFile
     * Contenido del archivo códificado en base 64.
     * 
     * @var string $environment
     * Tipo de ambiente para el envio
     * 
     * @return string
     */
    public function SendBillAsync(string $fileName, $contentFile, string $environment): string
    {
        $this->set_enviroment = $environment;
        return $this->XmlGenerate(
            <<<XML
            <wcf:SendBillAsync>
                <wcf:fileName>{$fileName}</wcf:fileName>
                <wcf:contentFile>{$contentFile}</wcf:contentFile>
            </wcf:SendBillAsync>
            XML,
            $environment,
            'SendBillAsync'

        );
    }

    /**
     * (EN) Send Receive a ZIP with UBLs DE for Enablement testing, synchronously.
     * (ES) Enviar Recibir un ZIP con UBLs DE para pruebas de Habilitación, de manera sincrona.
     * @var string $fileName
     * Nombre del archivo que se envia.
     * 
     * @var string $contentFile
     * Contenido del archivo códificado en base 64.
     * 
     * @var string $environment
     * Tipo de ambiente para el envio
     * 
     * @return string
     */
    public function SendBillSync(string $fileName, string $contentFile, string $environment): string
    {
        $this->set_enviroment = $environment;
        return  $this->XmlGenerate(
            <<<XML
        <wcf:SendBillSync>
            <wcf:fileName>{$fileName}</wcf:fileName>
            <wcf:contentFile>{$contentFile}</wcf:contentFile>
        </wcf:SendBillSync>
        XML,
            $environment,
            'SendBillSync'

        );
    }

    /**
     * (EN) Send Receive a ZIP with UBLs DE for Enablement testing, asynchronously.
     * (ES) Enviar Recibir un ZIP con UBLs DE para pruebas de Habilitación, de manera asincrona.
     * @var string $fileName
     * Nombre del archivo que se envia.
     * 
     * @var string $contentFile
     * Contenido del archivo códificado en base 64.
     * 
     * @var string $testID
     * Track ID o más conocido cómo el test id, usado para el proceso de habilitación, solo pruebas.
     * 
     * @var string $environment
     * Tipo de ambiente para el envio
     * 
     * @return string
     */
    public function SendTestSetAsync(string $fileName, string $contentFile, string $testID, string $environment): string
    {
        $this->set_enviroment = $environment;
        return  $this->XmlGenerate(
            <<<XML
        <wcf:SendTestSetAsync>
            <wcf:fileName>{$fileName}</wcf:fileName>
            <wcf:contentFile>{$contentFile}</wcf:contentFile>
            <wcf:testSetId>{$testID}</wcf:testSetId>
        </wcf:SendTestSetAsync>
        XML,
            $environment,
            'SendTestSetAsync'
        );
    }

    /**
     * (EN) Get xml by document key (CUFE o CUDE).
     * (ES) Obtener xml por clave de documento (CUFE o CUDE).
     * @var string $trackId
     * Track ID CUFE del Documento Electrónico
     * 
     * @var string $environment
     * Tipo de ambiente para el envio
     * @return string
     */
    public function GetXmlByDocumentKey(string $trackId, string $environment): string
    {
        $this->set_enviroment = $environment;
        return  $this->XmlGenerate(
            <<<XML
            <wcf:GetXmlByDocumentKey>
                <wcf:trackId>{$trackId}</wcf:trackId>
            </wcf:GetXmlByDocumentKey>
        XML,
            $environment,
            'GetXmlByDocumentKey'
        );
    }

    /** 
     * (EN) Consultation of Numbering Ranges registered in DIAN delivering the information related to these ranges.
     * (ES) Consulta de Rangos de Numeración registrado en DIAN entregando la información relacionada con estos rangos.
     * @var string $accountCode
     * (EN) Identification Number of the person obliged to invoice electronically.
     * (ES) Número de identificación tributaria del obligado a Facturar Electrónicamente.
     * @var string $accountCodeT
     * (EN) Software owner identification number
     * (ES) Número de identificación tributaria del dueño del Software.
     * @var string $softwareCode
     * (EN) Identification number of the software that generates the electronic invoices.
     * (ES) Número de identificación del software que genera las facturas electrónicas.
     * 
     * @var string $environment
     * @return string
     */
    public function GetNumberingRange(string $accountCode, string $accountCodeT, string $softwareCode, string $environment): string
    {
        $this->set_enviroment = $environment;
        return $this->XmlGenerate(
            <<<XML
            <wcf:GetNumberingRange>
                <wcf:accountCode>{$accountCode}</wcf:accountCode>
                <wcf:accountCodeT>{$accountCodeT}</wcf:accountCodeT>
                <wcf:softwareCode>{$softwareCode}</wcf:softwareCode>
            </wcf:GetNumberingRange>
            XML,
            $environment,
            'GetNumberingRange'
        );
    }

    private function XmlGenerate(string $xml, string $environment, $action = ''): string
    {

        return $this->SOAPTemplate($this->BaseXml($xml), $action, $environment);
    }

    public function SOAPTemplate(string $xml_body = '', string $actionMethod = '', string $environment = '')
    {
        $this->wsAction = $this->wsAction . $actionMethod;
        //America/Bogota
        date_default_timezone_set('America/Bogota');
        $_wsuCreated = date('Y-m-d\TH:i:s', strtotime('+5 hour', strtotime(date('Y-m-d\TH:i:s')))) . '.000Z';  //inicializo la fecha con la hora
        $_wsuExpires = date('Y-m-d\TH:i:s', strtotime('+22 hour', strtotime(date('Y-m-d\TH:i:s')))) . '.000Z';  //inicializo la fecha con la hora
        $_wsa_action = $this->urlWS_DIAN($environment)['_WSA_TO'];
        return
            <<<XML
        <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:wcf="http://wcf.dian.colombia">
            <soap:Header xmlns:wsa="http://www.w3.org/2005/08/addressing">
                <wsse:Security xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd" xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd">
                    <wsu:Timestamp wsu:Id="TS-E18C26835F9A7946EA15544903041616">
                        <wsu:Created>_wsuCreated</wsu:Created>
                        <wsu:Expires>_wsuExpires</wsu:Expires>
                    </wsu:Timestamp>
                    <wsse:BinarySecurityToken EncodingType="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary" ValueType="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-x509-token-profile-1.0#X509v3" wsu:Id="X509-E18C26835F9A7946EA15544903040561">BASE64_CERT</wsse:BinarySecurityToken></wsse:Security>
                <wsa:Action>_WS_ACTION</wsa:Action>
                    <wsa:To wsu:Id="id-E18C26835F9A7946EA15544903041014" xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd">_WSA_TO</wsa:To>
                </soap:Header>
                <soap:Body>
            _BODY
                </soap:Body>
        </soap:Envelope>
        XML;
    }

    /**
     * BuildSignedRequest
     * 
     * Método encargado del envio de solicitudes, documentos y otras consultas mediante SOAP.
     * Esta funcionalidad es unica y exclusiva para la facturación electrónica de Colombia.
     * 
     * @access public
     * @var string $certificate (ES) Ruta del certificado.
     * @var string $password (ES) Contraseña de certificado.
     * @var string $xmlTemp (ES) Plantilla xml soap con documento electrónico.
     * @var string $action (ES) Método de acción, ejemplo:
     * 
     *  -GetStatus
     * 
     *  -GetStatusZip
     * 
     *  -SendBillAsync
     * 
     *  -SendBillSync
     * 
     *  -SendTestSetAsync
     * 
     *  -GetXmlByDocumentKey
     * 
     *  -GetNumberingRange
     * 
     * @var string $response_path (ES) Ruta donde guardan las respuestas de envio.
     * @var bool $uso  (ES) Uso de la respuesta de envio, true para obtener 
     * el xml unicamente y false por defecto para detallar la respuesta.
     * @var bool $getStatusZip (ES) No enviar nada, se deja por defecto false.
     */
    public function BuildSignedRequest(string $certificate, string $password,  string $xmlTemp, string $action, $response_path, string $file_name, bool $uso = false, bool $getStatusZip = false)
    {
        //Definición mediante la variables $pfx del ceritificado, se obtiene como string
        if (!$pfx = file_get_contents($certificate)) {
            //Si no se puede leer el archivo se retornará el siguiente mensaje:
            _json(['code'=>500, 'data'=>['message'=>'No se puede leer el fichero del certificado o no existe en la ruta especificada']]);
        }
        //Autenticación y lectura del certificado, se definen sus valores en la variable $key
        if (openssl_pkcs12_read($pfx, $key, $password)) {
            $publicKey  = $key['cert'];
            $privateKey = $key['pkey'];
            $publicPEM  = '';
            openssl_x509_export($publicKey, $publicPEM);

            $publicPEM = str_replace("\r", '', str_replace("\n", '', str_replace('-----END CERTIFICATE-----', '', str_replace('-----BEGIN CERTIFICATE-----', '', $publicPEM))));
        } else {
            //Si el sistema no logra autenticarse con el certificado, se lanzará la siguiente respuesta:
            _json(['code'=>500, 'data'=>['message'=>'No se puede leer el almacén de certificados o la clave no es la correcta']]);
        }
        //Plantilla xml firmada
        $xmlTemp     = $this->InsertSoapSignature($xmlTemp, $privateKey, $publicPEM, $action, $response_path, $uso);
        //Acá se crea el objeto resultado para definir todo el detalle del firmado, envio y respuesta
       
        $this->result = new stdClass;
        //Plantilla xml firmada
        $this->result->xml  = $xmlTemp;
        //Resultado de envio

        $this->result->send = $this->SendRequestSoap($xmlTemp, $this->urlWS_DIAN($this->set_enviroment)['urlDian'], $xmlTemp, $response_path, $file_name, $uso);
        
        //validación de recursividad
        if ($getStatusZip != false) {
            //Si este método esta siendo llamado desdel si mismo, retornará lo siguiente:
            return $this->result->send;
        } else {
            //Validación de tipo de uso
            if ($uso != false) {
                //Si el uso es verdadero o true, retornara unicamente la respuesta en xml
                return $this->result->send;
            } else {
                //De lo contrario se definirá todo el detalle del envio y la respuesta obtenida
                //Zip key
                $this->result->zipKey =  $this->parseXml($this->result->send, $action);


                //Validar el método y acción de envio, para determinar la estructura
                if ($action == 'SendBillSync') {
                    //De manera asincrona no se valida el zip pkey
                    $this->result->document_status = $this->setResponseZipKey($this->BuildSignedRequest($certificate, $password, $this->GetStatusZip($this->result->zipKey, $this->set_enviroment), 'GetStatusZip', $response_path, false), true);
                } else {
                    //De cualquier otro método de envio (Asincrono) se esperan 6 segundo y se realiza para validar el estado del documento.
                    sleep(6);
                    $this->result->document_status = $this->setResponseZipKey($this->BuildSignedRequest($certificate, $password, $this->GetStatusZip($this->result->zipKey, $this->set_enviroment), 'GetStatusZip', $response_path, true), false);
                }

                //Acá se retorna el objeto resultado con todo el detalle
                return $this->result;
            }
        }
    }

    /**
     *  InsertSoapSignature()
     * (EN) Method for signing the SOAP request xml.
     * (ES) Método para firmar la petición SOAP xml.
     * @access public
     * @param string $xml;
     * @param string $privateKey
     * @param string $_WSA_TO
     * @param string $response_path
     * @param bool $uso 
     *  
     * 
     * @return mixed
     */
    public function InsertSoapSignature(string $xml, string $privateKey, string $publicPEM, string $_WSA_TO, $response_path, bool $uso = false)
    {
        $documentDigest = $this->GetDocumentDigest($_WSA_TO);

        //$xmnls_signeg = 'xmlns:ds="http://www.w3.org/2000/09/xmldsig#"';

        // Preparar el KeyInfo
        $kInfo = $this->GetKeyInfo();
        $sInfo1 = $this->SigneInfoOne($documentDigest);


        //signedinfo canonicalizado en c14nexc . no hace falta pasarlo por el c14n
        $sInfo =  $this->SigneInfo($documentDigest);

        $signaturePayload = $sInfo;
        $d1p = new DOMDocument('1.0', 'UTF-8');
        $d1p->loadXML($signaturePayload);
        $signaturePayload = $d1p->C14N(false, false, null, null);
        $resultadodefirma = '';

        openssl_sign($signaturePayload, $resultadodefirma, $privateKey, OPENSSL_ALGO_SHA256);
        //file_put_contents("firmasinbase64.xml", $resultadodefirma);
        $resultadodefirma = base64_encode($resultadodefirma);

        /*$xml = str_replace("\r", "", str_replace("\n", "", $xml));
        $xml = str_replace('&', '&amp;', $xml);*/



        //Armamos toda la estructura de la firma
        $sig =   $this->SignatureScheme($sInfo1, $resultadodefirma, $kInfo);
        $xml     = str_replace('_BASE64_CERT_', $publicPEM, $xml);
        $buscar    = '__SIGNATURE__';
        $remplazar = $sig;
        $pos       = strrpos($xml, $buscar);
        if ($pos !== false) {
            $xml = substr_replace($xml, $remplazar, $pos, strlen($buscar));
        }
        /*$d1p = new DOMDocument('1.0', 'UTF-8');
        $d1p->loadXML($xml);
        $xml = $d1p->C14N(false, false, null, null);*/
        //echo $xml;die;
        file_put_contents("test2.xml", $xml);
        return $xml;
    }

    /**
     * (EN) Get document digest
     * (ES) Obtener digest del documento
     * @access private
     * @param string $_WSA_TO
     * @return string
     * 
     */
    private function GetDocumentDigest(string $_WSA_TO): string
    {
        // Definir los namespace para los diferentes nodos
        $xmnls_signeg = <<<XML
            <wsa:To xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:wcf="http://wcf.dian.colombia" xmlns:wsa="http://www.w3.org/2005/08/addressing" xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd" wsu:Id="id-E18C26835F9A7946EA15544903041014">{$_WSA_TO}</wsa:To>
            XML;

        $d = new DOMDocument('1.0');
        $d->loadXML($xmnls_signeg);
        $canonizadoreal = $d->C14N(false, false, null, null);
        return base64_encode(hash('sha256', $canonizadoreal, true));
    }

    /**
     * (EN) Get key info
     * (ES) Obtener información de llave
     * @access private
     * @return string
     */
    private function GetKeyInfo(): string
    {
        return <<<XML
        <ds:KeyInfo Id="KI-E18C26835F9A7946EA15544903040902">
            <wsse:SecurityTokenReference wsu:Id="STR-E18C26835F9A7946EA15544903040943">
                <wsse:Reference URI="#X509-E18C26835F9A7946EA15544903040561" ValueType="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-x509-token-profile-1.0#X509v3"/>
            </wsse:SecurityTokenReference>
        </ds:KeyInfo>
        XML;
    }

    /**
     * (EN) Singnded info one
     * (ES) Información firmada por uno
     * @access private
     * @param string $documentDigest
     * @return string
     */
    private function SigneInfoOne(string $documentDigest): string
    {
        return <<<XML
        <ds:SignedInfo>
            <ds:CanonicalizationMethod Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#">
                <ec:InclusiveNamespaces xmlns:ec="http://www.w3.org/2001/10/xml-exc-c14n#" PrefixList="wsa soap wcf"/>
            </ds:CanonicalizationMethod>
            <ds:SignatureMethod Algorithm="http://www.w3.org/2001/04/xmldsig-more#rsa-sha256"/>
            <ds:Reference URI="#id-E18C26835F9A7946EA15544903041014">
            <ds:Transforms>
                <ds:Transform Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#">
                    <ec:InclusiveNamespaces xmlns:ec="http://www.w3.org/2001/10/xml-exc-c14n#" PrefixList="soap wcf"/>
                </ds:Transform>
            </ds:Transforms>
            <ds:DigestMethod Algorithm="http://www.w3.org/2001/04/xmlenc#sha256"/>
            <ds:DigestValue>{$documentDigest}</ds:DigestValue>
            </ds:Reference>
        </ds:SignedInfo>
        XML;
    }

    /**
     * (EN) Signe info
     * (ES) Información de firma
     * @access private
     * @param string $documentDigest
     * @return string
     */
    private function SigneInfo(string $documentDigest): string
    {
        return <<<XML
            <ds:SignedInfo xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:wcf="http://wcf.dian.colombia" xmlns:wsa="http://www.w3.org/2005/08/addressing">
                <ds:CanonicalizationMethod Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#">
                    <ec:InclusiveNamespaces xmlns:ec="http://www.w3.org/2001/10/xml-exc-c14n#" PrefixList="wsa soap wcf"></ec:InclusiveNamespaces>
                </ds:CanonicalizationMethod>
                <ds:SignatureMethod Algorithm="http://www.w3.org/2001/04/xmldsig-more#rsa-sha256"></ds:SignatureMethod>
                <ds:Reference URI="#id-E18C26835F9A7946EA15544903041014">
                    <ds:Transforms>
                     <ds:Transform Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#">
                       <ec:InclusiveNamespaces xmlns:ec="http://www.w3.org/2001/10/xml-exc-c14n#" PrefixList="soap wcf"></ec:InclusiveNamespaces>
                     </ds:Transform>
                   </ds:Transforms>
                <ds:DigestMethod Algorithm="http://www.w3.org/2001/04/xmlenc#sha256"></ds:DigestMethod>
                <ds:DigestValue>{$documentDigest}</ds:DigestValue>
               </ds:Reference>
            </ds:SignedInfo>
        XML;
    }

    /**
     * (EN) Signature scheme
     * (ES) Esquema de firma
     * @access private
     * @param string $sInfo1
     * @param string $signeResult
     * @param string $kInfo
     */
    private function SignatureScheme(string $sInfo1, string $signeResult, string $kInfo): string
    {
        return <<<XML
            <ds:Signature xmlns:ds="http://www.w3.org/2000/09/xmldsig#" Id="SIG-E18C26835F9A7946EA15544903041175">
                {$sInfo1}
                <ds:SignatureValue>{$signeResult}</ds:SignatureValue>
                {$kInfo}
            </ds:Signature>
        XML;
    }

    /**
     * (EN) Method for submission to the web services (WS) of the DIAN.
     * (ES) Método para el envio a los web services (WS) de la DIAN.
     *
     * @param $archivoafirmar
     * @param $urlDian
     * @param $peticion
     * @param $rutarespuesta
     *
     * @return file xml response
     */
    private function SendRequestSoap($archivoafirmar,  $urlDian, $peticion, $rutarespuesta, string $file_name, $uso = false)
    {

        $soap_request1 = $peticion;
        $NOMBREARCHIVOr = $rutarespuesta . "Solicitud-" . $file_name;


        file_put_contents($NOMBREARCHIVOr, $archivoafirmar);

        $header = array(
            "Content-type: application/soap+xml;charset=\"UTF-8\"",
            'Content-length: ' . strlen($soap_request1)
        );
        $soap_do = curl_init();
        curl_setopt($soap_do, CURLOPT_URL, $urlDian);
        curl_setopt($soap_do, CURLOPT_CONNECTTIMEOUT, 15); //180
        curl_setopt($soap_do, CURLOPT_TIMEOUT,        15); //180
        curl_setopt($soap_do, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($soap_do, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($soap_do, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($soap_do, CURLOPT_POST,           true);
        curl_setopt($soap_do, CURLOPT_POSTFIELDS,     $soap_request1);
        curl_setopt($soap_do, CURLOPT_HTTPHEADER,     $header);
        $xmlResponse = curl_exec($soap_do);
        //$xlresponse_soap=htmlspecialchars($xmlResponse, ENT_QUOTES) ;//solo para mostrarlo en pantalla

        if ($xmlResponse === false) {
            $err = 'Curl error: ' . curl_error($soap_do);
            curl_close($soap_do);
            return $err;
        } else {
            curl_close($soap_do);
            $NOMBREARCHIVOr = $rutarespuesta . "Respuesta-" . $file_name;
            file_put_contents($NOMBREARCHIVOr, $xmlResponse);
            //Validar que tipo de uso se le va dar a la respuesta de la petición
            if ($uso != false) {
                return $xmlResponse;
            } else {
                return $NOMBREARCHIVOr;
            }
        }
    }

    /**
     * parseXml
     * Se encarga de parsear las respuesta xml del SOAP DIAN y obtener el zipKey
     * @access public
     * @param string $rutaXMLcd app
     * Ruta del archivo xml de la respuesta SOAP
     * @return string
     */
    public function parseXml(string $rutaXml, string $type_request): string
    {

        if (file_exists($rutaXml)) {
            $xml = file_get_contents($rutaXml);
            $response = str_replace('xmlns="http://wcf.dian.colombia"', '', $xml);

            // crear objeto
            $obj = SimpleXML_Load_String($this->mungXML($response));

            unset($obj->s_Header);
            unset($obj->a_Action);
            switch ($type_request) {
                case 'SendTestSetAsync':
                    return $obj->s_Body->SendTestSetAsyncResponse->SendTestSetAsyncResult->b_ZipKey;
                    break;

                case 'SendBillAsync':
                    return $obj->s_Body->SendBillAsyncResponse->SendBillAsyncResult->b_ZipKey;
                    break;
                case 'SendBillSync':
                    return $obj->s_Body->SendBillSyncResponse->SendBillSyncResult->b_XmlDocumentKey;
                    break;
            }
        } else {
            return "no existe el archivo  xml";
        }
    }
    /**
     * mungXML
     * Se encarga de procesar un string con estructura xml de respuesta SOAP
     * @access public
     * @param string
     * @return string
     */
    public function mungXML(string $xmlString): string
    {

        // A REGULAR EXPRESSION TO MUNG THE XML
        $rgx
            = '#'           // REGEX DELIMITER
            . '('           // GROUP PATTERN 1
            . '\<'          // LOCATE A LEFT WICKET 
            . '/{0,1}'      // MAYBE FOLLOWED BY A SLASH
            . '.*?'         // ANYTHING OR NOTHING
            . ')'           // END GROUP PATTERN
            . '('           // GROUP PATTERN 2
            . ':{1}'        // A COLON (EXACTLY ONE)
            . ')'           // END GROUP PATTERN
            . '#'           // REGEX DELIMITER
            . '';
        // INSERT THE UNDERSCORE INTO THE TAG NAME
        $rep
            = '$1'          // BACKREFERENCE TO GROUP 1
            . '_'           // LITERAL UNDERSCORE IN PLACE OF GROUP 2
        ;
        // PERFORM THE REPLACEMENT
        return preg_replace($rgx, $rep, $xmlString);
    }

    /**
     * setResponseZipKey()
     * Se encarga de setear en un arreglo el resultado de la consulta del
     * del zip enviado a la DIAN, con los valores que se retornen
     * se determina en que estado queda la factura enviada a la DIAN
     * @access public
     * @param string $response
     * @return array 
     */
    public function setResponseZipKey(string $response, $type_request = false, $GetStatusResponse = false): array
    {

        if (file_exists($response)) {
            $xml = file_get_contents($response);
            $response = str_replace('xmlns="http://wcf.dian.colombia"', '', $xml);
            //Crear objeto
            $obj = SimpleXML_Load_String($this->mungXML($response));

            unset($obj->s_Header);
            unset($obj->a_Action);
            if ($GetStatusResponse) {
                return (array)$obj;
            }
            if ($type_request == false) {

                //Acá se comprueba si hubo un error
                if ($obj->s_Body->GetStatusZipResponse->GetStatusZipResult->b_DianResponse->b_IsValid == "true") {
                    //Si el resultado de IsValid es = string "true", es por que no hubo error
                    ///Arreglo sin Errores
                    $resultado = array(
                        'IsValid'           => "true",
                        'StatusCode'        => $obj->s_Body->GetStatusZipResponse->GetStatusZipResult->b_DianResponse->b_StatusCode,
                        'StatusDescription' => $obj->s_Body->GetStatusZipResponse->GetStatusZipResult->b_DianResponse->b_StatusDescription,
                        'StatusMessage'     => $obj->s_Body->GetStatusZipResponse->GetStatusZipResult->b_DianResponse->b_StatusMessage,
                        'XmlBase64Bytes'    => $obj->s_Body->GetStatusZipResponse->GetStatusZipResult->b_DianResponse->b_XmlBase64Bytes,
                        'XmlDocumentKey'    => $obj->s_Body->GetStatusZipResponse->GetStatusZipResult->b_DianResponse->b_XmlDocumentKey,
                        'XmlFileName'       => $obj->s_Body->GetStatusZipResponse->GetStatusZipResult->b_DianResponse->b_XmlFileName,
                    );
                } else {
                    //Arreglo con errores
                    $resultado = array(
                        'IsValid'           => "false",
                        'StatusCode'        => $obj->s_Body->GetStatusZipResponse->GetStatusZipResult->b_DianResponse->b_StatusCode,
                        'StatusDescription' => $obj->s_Body->GetStatusZipResponse->GetStatusZipResult->b_DianResponse->b_StatusDescription,
                        'ErrorMessage'      => $obj->s_Body->GetStatusZipResponse->GetStatusZipResult->b_DianResponse->b_ErrorMessage,
                        'StatusMessage'     => $obj->s_Body->GetStatusZipResponse->GetStatusZipResult->b_DianResponse->b_StatusMessage,
                        'XmlBase64Bytes'    => $obj->s_Body->GetStatusZipResponse->GetStatusZipResult->b_DianResponse->b_XmlBase64Bytes,
                        'XmlDocumentKey'    => $obj->s_Body->GetStatusZipResponse->GetStatusZipResult->b_DianResponse->b_XmlDocumentKey,
                        'XmlFileName'       => $obj->s_Body->GetStatusZipResponse->GetStatusZipResult->b_DianResponse->b_XmlFileName,
                    );
                }
            } else {
                if (isset($obj->s_Body->GetStatusResponse)) {
                    if ($obj->s_Body->GetStatusResponse->GetStatusResult->b_IsValid == "true") {
                        $resultado = array(
                            'IsValid'           => "true",
                            'StatusCode'        => $obj->s_Body->GetStatusResponse->GetStatusResult->b_StatusCode,
                            'StatusDescription' => $obj->s_Body->GetStatusResponse->GetStatusResult->b_StatusDescription,
                            'StatusMessage'     => $obj->s_Body->GetStatusResponse->GetStatusResult->b_StatusMessage,
                            'XmlBase64Bytes'    => $obj->s_Body->GetStatusResponse->GetStatusResult->b_XmlBase64Bytes,
                            'XmlDocumentKey'    => $obj->s_Body->GetStatusResponse->GetStatusResult->b_XmlDocumentKey,
                            'XmlFileName'       => $obj->s_Body->GetStatusResponse->GetStatusResult->b_XmlFileName,
                        );
                    } else {
                        $resultado = array(
                            'IsValid'           => "false",
                            'StatusCode'        => $obj->s_Body->GetStatusResponse->GetStatusResult->b_StatusCode,
                            'StatusDescription' => $obj->s_Body->GetStatusResponse->GetStatusResult->b_StatusDescription,
                            'StatusMessage'     => $obj->s_Body->GetStatusResponse->GetStatusResult->b_StatusMessage,
                            'XmlBase64Bytes'    => $obj->s_Body->GetStatusResponse->GetStatusResult->b_XmlBase64Bytes,
                            'XmlDocumentKey'    => $obj->s_Body->GetStatusResponse->GetStatusResult->b_XmlDocumentKey,
                            'XmlFileName'       => $obj->s_Body->GetStatusResponse->GetStatusResult->b_XmlFileName,
                        );
                    }
                } else {
                    if ($obj->s_Body->SendBillSyncResponse->SendBillSyncResult->b_IsValid == "true") {
                        $resultado = array(
                            'IsValid'           => "true",
                            'StatusCode'        => $obj->s_Body->SendBillSyncResponse->SendBillSyncResult->b_StatusCode,
                            'StatusDescription' => $obj->s_Body->SendBillSyncResponse->SendBillSyncResult->b_StatusDescription,
                            'StatusMessage'     => $obj->s_Body->SendBillSyncResponse->SendBillSyncResult->b_StatusMessage,
                            'XmlBase64Bytes'    => $obj->s_Body->SendBillSyncResponse->SendBillSyncResult->b_XmlBase64Bytes,
                            'XmlDocumentKey'    => $obj->s_Body->SendBillSyncResponse->SendBillSyncResult->b_XmlDocumentKey,
                            'XmlFileName'       => $obj->s_Body->SendBillSyncResponse->SendBillSyncResult->b_XmlFileName,
                        );
                    } else {
                        $resultado = array(
                            'IsValid'           => "false",
                            'StatusCode'        => $obj->s_Body->SendBillSyncResponse->SendBillSyncResult->b_StatusCode,
                            'StatusDescription' => $obj->s_Body->SendBillSyncResponse->SendBillSyncResult->b_StatusDescription,
                            'StatusMessage'     => $obj->s_Body->SendBillSyncResponse->SendBillSyncResult->b_StatusMessage,
                            'XmlBase64Bytes'    => $obj->s_Body->SendBillSyncResponse->SendBillSyncResult->b_XmlBase64Bytes,
                            'XmlDocumentKey'    => $obj->s_Body->SendBillSyncResponse->SendBillSyncResult->b_XmlDocumentKey,
                            'XmlFileName'       => $obj->s_Body->SendBillSyncResponse->SendBillSyncResult->b_XmlFileName,
                        );
                    }
                }
            }
            return $resultado;
        } else {
            throw new Exception('no existe el archivo xml.');
        }
    }


    /**
     * ExampleSendBillAsync
     * @return
     */
    public function ExamplesSOAP()
    {
        return array(
            "€this->BuildSignedRequest('CERTIFICATE_PATH', 'PASSWORD_CERTIFICADO', €this->GetStatus('CUFE/CUDE', 'ENVIROMENT'), 'GetStatus', 'RESPONSES_PATH'));",
            "El siguiente método es usado unicamente de forma recursiva por el mismo constructor de peticiones, para obtener el estado del documento cuando es enviado de forma asincrona\n
            €this->BuildSignedRequest('CERTIFICATE_PATH', 'PASSWORD_CERTIFICADO', €this->GetStatusZip('ZIP_KEY/CUFE/CUDE', 'ENVIROMENT', TRUE), 'GetStatusZip', 'RESPONSES_PATH'));",
            "€this->BuildSignedRequest('CERTIFICATE_PATH', 'PASSWORD_CERTIFICADO', €this->SendBillAsync('FILE_NAME', 'FILE_ENCODE_BASE64', 'ENVIROMENT'), 'SendBillAsyn', 'RESPONSES_PATH'));",
            "€this->BuildSignedRequest('CERTIFICATE_PATH', 'PASSWORD_CERTIFICADO', €SendBillSync('FILE_NAME', 'FILE_ENCODE_BASE64', 'ENVIROMENT'), 'SendBillSync', 'RESPONSES_PATH'));",
            "€this->BuildSignedRequest('CERTIFICATE_PATH', 'PASSWORD_CERTIFICADO', €this->SendTestSetAsync('FILE_NAME', 'FILE_ENCODE_BASE64', 'TEST_ID', 'ENVIROMENT'), 'SendTestSetAsync', 'RESPONSES_PATH'));",

        );
    }


    /**
     * (EN) Method build signed petition.
     * (ES) Método para construir las peticiones a la DIAN.
     *
     * @param $certificadop12
     * @param $clavecertificado
     * @param $plantilla
     * @param $_WS_ACTION
     * @param $_WSA_TO
     * @param $_BODY
     *
     * @return string zip temporal
     */
    public function BuildSignedPetition($certificadop12, $clavecertificado, $plantilla, $_WS_ACTION, $_WSA_TO, $_BODY) 
    {
        $xmlTemp = $this->SOAPTemplate();
        if (!$pfx = file_get_contents($certificadop12)) {
            _json(['code'=>400, 'data'=>['message'=>'No se puede leer el fichero del certificado o no existe en la ruta especificada.']]);
        }
        if (openssl_pkcs12_read($pfx, $key, $clavecertificado)) {
            $publicKey  = $key['cert'];
            $privateKey = $key['pkey'];
            $publicPEM  = '';
            openssl_x509_export($publicKey, $publicPEM);
            $publicPEM = str_replace("\r", '', str_replace("\n", '', str_replace('-----END CERTIFICATE-----', '', str_replace('-----BEGIN CERTIFICATE-----', '', $publicPEM))));
        } else {
            _json(['code'=>400, 'data'=>['message'=>'No se puede leer el almacén de certificados o la clave no es la correcta.']]);
        }
        date_default_timezone_set('America/Bogota');
        $_wsuCreated = date('Y-m-d\TH:i:s', strtotime('+5 hour', strtotime(date('Y-m-d\TH:i:s')))) . '.000Z';  //inicializo la fecha con la hora
        $_wsuExpires = date('Y-m-d\TH:i:s', strtotime('+22 hour', strtotime(date('Y-m-d\TH:i:s')))) . '.000Z';  //inicializo la fecha con la hora
        $xmlTemp     = str_replace('BASE64_CERT', $publicPEM, $xmlTemp);
        $xmlTemp     = str_replace('_wsuCreated', $_wsuCreated, $xmlTemp);
        $xmlTemp     = str_replace('_wsuExpires', $_wsuExpires, $xmlTemp);
        $xmlTemp     = str_replace('_WS_ACTION', $_WS_ACTION, $xmlTemp);
        $xmlTemp     = str_replace('_WSA_TO', $_WSA_TO, $xmlTemp);
        $xmlTemp     = str_replace('_BODY', $_BODY, $xmlTemp);
        $xmlTemp     = $this->insertaFirmaP($xmlTemp, $privateKey, $_WSA_TO);

        return $xmlTemp;
    }

    /**
     * insertaFirmaP()
     * Se encarga de la firma electronica en el documento.
     *
     * @param $xml
     * @param $privateKey
     * @param $_WSA_T
     *
     * @return file xml formater
     */
    public function insertaFirmaP($xml, $privateKey, $_WSA_TO)
    {
        // Definir los namespace para los diferentes nodos
        $xmnls_signeg =
            '<wsa:To xmlns:soap="http://www.w3.org/2003/05/soap-envelope" ' .
            'xmlns:wcf="http://wcf.dian.colombia" xmlns:wsa="http://www.w3.org/2005/08/addressing" xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd" ' .
            'wsu:Id="id-E18C26835F9A7946EA15544903041014">' . $_WSA_TO . '</wsa:To>';

        $d = new DOMDocument('1.0');
        $d->loadXML($xmnls_signeg);
        $canonizadoreal = $d->C14N(false, false, null, null);
        $documentDigest = base64_encode(hash('sha256', $canonizadoreal, true));

        $xmnls_signeg = 'xmlns:ds="http://www.w3.org/2000/09/xmldsig#"';

        // Preparar el KeyInfo
        $kInfo = '<ds:KeyInfo Id="KI-E18C26835F9A7946EA15544903040902">' .
            '<wsse:SecurityTokenReference wsu:Id="STR-E18C26835F9A7946EA15544903040943">' .
            '<wsse:Reference URI="#X509-E18C26835F9A7946EA15544903040561" ValueType="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-x509-token-profile-1.0#X509v3"/>' .
            '</wsse:SecurityTokenReference>' .
            '</ds:KeyInfo>';

        $sInfo1 = '<ds:SignedInfo>' .
            '<ds:CanonicalizationMethod Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#">' .
            '<ec:InclusiveNamespaces xmlns:ec="http://www.w3.org/2001/10/xml-exc-c14n#" PrefixList="wsa soap wcf"/>' .
            '</ds:CanonicalizationMethod>' .
            '<ds:SignatureMethod Algorithm="http://www.w3.org/2001/04/xmldsig-more#rsa-sha256"/>' .
            '<ds:Reference URI="#id-E18C26835F9A7946EA15544903041014">' .
            '<ds:Transforms>' .
            '<ds:Transform Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#">' .
            '<ec:InclusiveNamespaces xmlns:ec="http://www.w3.org/2001/10/xml-exc-c14n#" PrefixList="soap wcf"/>' .
            '</ds:Transform>' .
            '</ds:Transforms>' .
            '<ds:DigestMethod Algorithm="http://www.w3.org/2001/04/xmlenc#sha256"/>' .
            '<ds:DigestValue>' . $documentDigest . '</ds:DigestValue>' .
            '</ds:Reference>' .
            '</ds:SignedInfo>';

        //signedinfo canonicalizado en c14nexc . no hace falta pasarlo por el c14n
        $sInfo = '<ds:SignedInfo xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:wcf="http://wcf.dian.colombia" xmlns:wsa="http://www.w3.org/2005/08/addressing">' .
            '<ds:CanonicalizationMethod Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#">' .
            '<ec:InclusiveNamespaces xmlns:ec="http://www.w3.org/2001/10/xml-exc-c14n#" PrefixList="wsa soap wcf"></ec:InclusiveNamespaces>' .
            '</ds:CanonicalizationMethod>' .
            '<ds:SignatureMethod Algorithm="http://www.w3.org/2001/04/xmldsig-more#rsa-sha256"></ds:SignatureMethod>' .
            '<ds:Reference URI="#id-E18C26835F9A7946EA15544903041014">' .
            '<ds:Transforms>' .
            '<ds:Transform Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#">' .
            '<ec:InclusiveNamespaces xmlns:ec="http://www.w3.org/2001/10/xml-exc-c14n#" PrefixList="soap wcf"></ec:InclusiveNamespaces>' .
            '</ds:Transform>' .
            '</ds:Transforms>' .
            '<ds:DigestMethod Algorithm="http://www.w3.org/2001/04/xmlenc#sha256"></ds:DigestMethod>' .
            '<ds:DigestValue>' . $documentDigest . '</ds:DigestValue>' .
            '</ds:Reference>' .
            '</ds:SignedInfo>';

        $signaturePayload = $sInfo;
        //$d1p = new DOMDocument('1.0', 'UTF-8');
        //$d1p->loadXML($signaturePayload);
        //$signaturePayload=$d1p->C14N(true);
        $resultadodefirma = '';

        openssl_sign($signaturePayload, $resultadodefirma, $privateKey, OPENSSL_ALGO_SHA256);
        //file_put_contents("firmasinbase64.xml", $resultadodefirma);
        $resultadodefirma = base64_encode($resultadodefirma);

        //Armamos toda la estructura de la firma
        $sig =
            '<ds:Signature xmlns:ds="http://www.w3.org/2000/09/xmldsig#" Id="SIG-E18C26835F9A7946EA15544903041175">' .
            $sInfo1 .
            '<ds:SignatureValue>' .
            $resultadodefirma .
            '</ds:SignatureValue>' .
            $kInfo .
            '</ds:Signature>';

        $buscar    = '</wsse:BinarySecurityToken></wsse:Security>';
        $remplazar = '</wsse:BinarySecurityToken>' . $sig . '</wsse:Security>';
        $pos       = strrpos($xml, $buscar);
        if ($pos !== false) {
            $xml = substr_replace($xml, $remplazar, $pos, strlen($buscar));
        }

        return $xml;
    }

    /**
     * SendPetition()
     * Método para el envio a los web services (WS) de la DIAN.
     *
     * @param $archivoafirmar
     * @param $urlDian
     * @param $peticion
     * @param $rutarespuesta
     *
     * @return file xml response
     */
    public function SendPetition($archivoafirmar,  $urlDian, $peticion, $rutarespuesta, $uso = false)
    {
        $soap_request1 = $peticion;
        $NOMBREARCHIVOr = $rutarespuesta . "Solicitud-" . $archivoafirmar;
        file_put_contents($NOMBREARCHIVOr, $peticion);

        $header = array(
            "Content-type: application/soap+xml;charset=\"UTF-8\"",
            // "SOAPAction: \"EnvioFacturaElectronicaPeticion\"",
            "Content-length: " . strlen($soap_request1),
        );
        $soap_do = curl_init();
        curl_setopt($soap_do, CURLOPT_URL, $urlDian);
        curl_setopt($soap_do, CURLOPT_CONNECTTIMEOUT, 15);
        curl_setopt($soap_do, CURLOPT_TIMEOUT,        15);
        curl_setopt($soap_do, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($soap_do, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($soap_do, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($soap_do, CURLOPT_POST,           true);
        curl_setopt($soap_do, CURLOPT_POSTFIELDS,     $soap_request1);
        curl_setopt($soap_do, CURLOPT_HTTPHEADER,     $header);
        $xmlResponse = curl_exec($soap_do);
        //$xlresponse_soap=htmlspecialchars($xmlResponse, ENT_QUOTES) ;//solo para mostrarlo en pantalla


        if ($xmlResponse === false) {
            $err = 'Curl error: ' . curl_error($soap_do);
            curl_close($soap_do);
            return $err;
        } else {
            curl_close($soap_do);
            $NOMBREARCHIVOr = $rutarespuesta . "Respuesta-" . $archivoafirmar;
            file_put_contents($NOMBREARCHIVOr, $xmlResponse);
            //Validar que tipo de uso se le va dar a la respuesta de la petición
            if ($uso != false) {
                return $xmlResponse;
            } else {
                return $NOMBREARCHIVOr;
            }
        }
    }

    /**
     * (EN) It is responsible for defining the content of the xml body of the soap template.
     * (ES) Se encarga de definir contenido del cuerpo del xml de la plantilla soap.
     * @param $pMetodoOpcion
     * @param $param_1
     * @param $param_2
     * @param $param_3
     * @param $param_4
     * @param $param_5
     *
     * @return @array
     */
    public function retornaBody($pMetodoOpcion, $param_1, $param_2 = false, $param_3 = false, $param_4 = false, $param_5 = false):array
    {
        $wsAction = $this->wsAction . $pMetodoOpcion;

        $_BODY = match ($pMetodoOpcion){
            'GetStatus'          => "<wcf:GetStatus><wcf:trackId>{$param_1}/wcf:trackId></wcf:GetStatus>",
            'GetStatusZip'       => "<wcf:GetStatusZip><wcf:trackId>{$param_1}</wcf:trackId></wcf:GetStatusZip>",
            'SendBillAsync'      => "<wcf:SendBillAsync><wcf:fileName>{$param_1}</wcf:fileName><wcf:contentFile>{$param_2}</wcf:contentFile></wcf:SendBillAsync>",
            'SendBillSync'       => "<wcf:SendBillSync><wcf:fileName>{$param_1}</wcf:fileName><wcf:contentFile>{$param_2}</wcf:contentFile></wcf:SendBillSync>",
            'SendTestSetAsync'   => "<wcf:SendTestSetAsync><wcf:fileName>{$param_1}</wcf:fileName><wcf:contentFile>{$param_2}</wcf:contentFile><wcf:testSetId>{$param_3}</wcf:testSetId></wcf:SendTestSetAsync>",
            'GetXmlByDocumentKey'=> "<wcf:GetXmlByDocumentKey><wcf:trackId>{$param_1}</wcf:trackId></wcf:GetXmlByDocumentKey>",
            'GetNumberingRange'  => "<wcf:GetNumberingRange><wcf:accountCode>{$param_1}</wcf:accountCode><wcf:accountCodeT>{$param_1}</wcf:accountCodeT><wcf:softwareCode>{$param_3}</wcf:softwareCode></wcf:GetNumberingRange>",
            default              =>  _json(['code' => 404, 'data' => ['message' => 'Method of delivery not found']], 404)
        };

        return [$wsAction, $_BODY];
    }

    /**
     * getStatusZip()
     * Se encarga de realizar la petición SOAP para comprobar el estado 
     * del zipKey
     * @access public
     * @param string $ZipKey
     * Contiene el valor de la llave del zip
     * @return string $xml
     */
    public function getStatusZip(string $ZipKey, $numero, $certificado, $clavecertificado, $enviroment, $response_path)
    {
        list($_WS_ACTION, $_BODY) = $this->retornaBody("GetStatusZip", $ZipKey);
        $peticion1 = $this->BuildSignedPetition($certificado, $clavecertificado, '', $_WS_ACTION, $this->urlWS_DIAN($enviroment)['_WSA_TO'], $_BODY);

        $response1 = $this->SendPetition($numero, $this->urlWS_DIAN($enviroment)['urlDian'], $peticion1, $response_path);
        return $response1;
    }
}
