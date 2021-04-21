<?php

namespace Models\Config;

use Illuminate\Database\Eloquent\Model as CustomModel;

class ReferencePrice extends CustomModel
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'api_reference_price';
    protected $primaryKey = 'id';
    protected $hidden = ['created_at', 'updated_at'];
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'code',
    ];
}
