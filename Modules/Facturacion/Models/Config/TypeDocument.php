<?php

namespace Models\Config;

use Illuminate\Database\Eloquent\Model as CustomModel;

class TypeDocument extends CustomModel
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'api_type_documents';
    protected $primaryKey = 'id';
    protected $hidden = ['created_at', 'updated_at'];
}
