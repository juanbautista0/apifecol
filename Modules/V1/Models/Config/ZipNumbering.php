<?php

namespace Models\Config;

use Illuminate\Database\Eloquent\Model as CustomModel;

class ZipNumbering extends CustomModel
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'api_zip_numbering';
    protected $primaryKey = 'id';
    protected $hidden = ['created_at', 'updated_at'];
}
