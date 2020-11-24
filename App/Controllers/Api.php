<?php

class Api extends Controller
{

    public function __construct()
    {
        
    }
    public function index()
    {
        header("Content-type: application/json; charset=utf-8");

        //print_r($this->getUrl());
        echo json_encode($_SERVER, JSON_PRETTY_PRINT);
    }

    public function Test(string $test = "")
    {

    }
}
