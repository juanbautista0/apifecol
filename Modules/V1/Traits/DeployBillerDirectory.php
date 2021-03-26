<?php

namespace Traits;

/**
 * (EN) Deployment electronic invoice
 * (EN) Despliegue de facturación electrónica
 */
trait DeployBillerDirectory
{
    /**
     * @var array $scheme
     */
    public $scheme_directory = [
        'xml' => [
            'invoices',
            'xmlsigned',
            'responses',
            'attachment'
        ],
        'certificates'
    ];


    /**
     * @var string $main_path
     * @access public
     */
    public $main_path = 'Billing' . DIRECTORY_SEPARATOR;


    /**
     * @var string $xml_main_path
     * @access public
     */
    public $xml_main_path = 'xml' . DIRECTORY_SEPARATOR;

    /**
     * StorageDirectory
     * (EN) Method for creating and deploying the directory structure for the module
     * @access public
     * @param string $storage_path
     * @return void
     */
    public function StorageDirectory(string $storage_path): void
    {
        $storage_path .= DIRECTORY_SEPARATOR;
        if (!$this->IssetStorageDirectory($storage_path)) {
            if (mkdir($storage_path . $this->main_path, 0777, true)) {
                @chmod($storage_path . $this->main_path, 0777);
                foreach ($this->scheme_directory as $key => $value) {
                    if (!is_array($value)) {
                        mkdir($storage_path . $this->main_path . $value, 0777, true);
                    } else {
                        mkdir($storage_path . $this->main_path . $key, 0777, true);
                        foreach ($value as $key2) {
                            mkdir($storage_path .  $this->main_path . $key . DIRECTORY_SEPARATOR . $key2, 0777, true);
                        }
                    }
                }
            }
        }
    }
    /**
     * IssetStorageDirectory()
     * @access public
     * @return bool
     */
    public function IssetStorageDirectory($storage_path): bool
    {
        if (file_exists($storage_path . $this->main_path)) {
            return true;
        } else {
            return false;
        }
    }
}
