<?php

namespace Models\Config;

use Illuminate\Database\Eloquent\Model as CustomModel;

class TypeItemIdentificaction extends CustomModel
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'api_type_item_identifications';
    protected $primaryKey = 'id';
    protected $hidden = ['created_at', 'updated_at'];
}
