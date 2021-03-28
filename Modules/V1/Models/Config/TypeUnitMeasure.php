<?php

namespace Models\Config;

use Illuminate\Database\Eloquent\Model as CustomModel;

class TypeUnitMeasure extends CustomModel
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'api_unit_measures';
    protected $primaryKey = 'id';
    protected $hidden = ['created_at', 'updated_at'];
}
