<?php

namespace Models\Config;

use Illuminate\Database\Eloquent\Model as CustomModel;

class TypeCurrency extends CustomModel
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'api_type_currencies';
    protected $primaryKey = 'id';
    protected $hidden = ['created_at', 'updated_at'];
}
