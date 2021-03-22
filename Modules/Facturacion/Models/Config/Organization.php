<?php

namespace Models\Config;

use Illuminate\Database\Eloquent\Model as CustomModel;

class Organization extends CustomModel
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'api_type_organization';
    protected $primaryKey = 'id';
    protected $hidden = ['created_at', 'updated_at'];
}
