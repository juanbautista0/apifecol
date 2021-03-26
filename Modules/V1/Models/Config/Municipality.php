<?php

namespace Models\Config;

use Illuminate\Database\Eloquent\Model as CustomModel;

class Municipality extends CustomModel
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'api_municipalities';
    protected $primaryKey = 'id';
    protected $hidden = ['created_at', 'updated_at'];


    public function Department()
    {
        return $this->hasOne(Department::class, 'id', 'department_id');
    }
}
