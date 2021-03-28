<?php

namespace App\Core;

class View
{
    public function __construct(public $blade,public $view, public $data, public $minify, public $cache)
    {
    }

    public function Show()
    {
        return ($this->minify != false) ?  $this->blade->make($this->view, $this->data)->render(): html_minify($this->blade->make($this->view, $this->data)->render());
    }

    public function Clean()
    {
        rmdir_($this->cache);
    }
}
