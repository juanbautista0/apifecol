<?php

class Api extends Controller
{

    public function __construct()
    {
    }
    public function index()
    {
        //header("Content-type: application/json; charset=utf-8");
        //print_r($this->getUrl());
        //echo json_encode($_SERVER, JSON_PRETTY_PRINT);

        $headers = [
            'Access-Control-Allow-Origin: *',
            'Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method',
            'Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE',
            'Allow: GET, POST, OPTIONS, PUT, DELETE'
    
        ];

        foreach($headers as $key){
            echo $key."<br>";
        }
    }
}
