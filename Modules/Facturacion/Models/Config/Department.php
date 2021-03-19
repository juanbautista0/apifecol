<?php

namespace Models\Config;

use Illuminate\Database\Eloquent\Model as CustomModel;

class Department extends CustomModel
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'api_departments';
    protected $primaryKey = 'id';
    protected $hidden = ['created_at', 'updated_at'];


    public function Country()
    {
        return $this->hasOne(Country::class, 'id', 'country_id');
    }
}
