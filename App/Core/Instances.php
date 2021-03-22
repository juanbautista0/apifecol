<?php

namespace App\Core;

/**
 * Instance Class
 * (EN) It is in charge of managing the instance to the holder, with the aim that the client uses only the resources of his instance.
 * (ES) Se encarga de gestionar la instancia al tenedor, con el objetivo que el cliente use solo los recursos de su instancia.
 * @author Juan Bautista <soyjuanbautista0@gmail.com>
 * @author Apifecol
 * @package Apifecol
 */
class Instances
{
    /**
     * @var string
     */
    public $instances;
    /**
     * @var string
     */
    public $name;

    /**
     * @var string
     */
    public $path;

    /**
     * @var string
     */
    public $storage;

    /**
     * @var string
     */
    public $storage_module;

    /**
     * @var array
     */
    public $instance_config;

    public function __construct(string $instance)
    {
        $this->instances        = config()->APP_INSTANCES_PATH;
        $this->name             = $instance;
        $this->path             = $this->GetPath();
        $this->storage          = $this->GetStorage();
        $this->storage_module   = $this->GetStorageModule();
        $this->instance_config  = json_decode(file_get_contents($this->GetConfigFile()), true);
    }

    private function GetPath(): string
    {
        return dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . $this->instances . DIRECTORY_SEPARATOR . $this->name . DIRECTORY_SEPARATOR;
    }

    private function GetStorage(): string
    {
        return dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . $this->instances . DIRECTORY_SEPARATOR . $this->name . DIRECTORY_SEPARATOR . "Storage" . DIRECTORY_SEPARATOR;
    }

    private function GetStorageModule(): string
    {
        return dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . $this->instances . DIRECTORY_SEPARATOR . $this->name . DIRECTORY_SEPARATOR . "Storage" . DIRECTORY_SEPARATOR . "Modules" . DIRECTORY_SEPARATOR;
    }

    private function GetConfigFile(): string
    {
        return dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR . $this->instances . DIRECTORY_SEPARATOR . $this->name . DIRECTORY_SEPARATOR . "config.json";
    }
}
