<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model as CustomModel;

class Biller extends CustomModel
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'biller';
    protected $primaryKey = 'id';
}
