<?php

use App\Traits\APIManager;

class Api extends Controller
{
    use APIManager;

    public function __construct()
    {
    }
    public function index()
    {
        echo "<pre>";
        print_r($this->getUrl());
    }
}
