<?php

namespace Models\Config;

use Illuminate\Database\Eloquent\Model as CustomModel;

class Language extends CustomModel
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'api_languages';
    protected $primaryKey = 'id';
    protected $hidden = ['created_at', 'updated_at'];
}
