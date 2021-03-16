<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model as CustomModel;

class Profile extends CustomModel
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'api_profiles';
    protected $primaryKey = 'id';
    protected $hidden = array('password');

    public function Biller()
    {
        return $this->hasMany(Biller::class, 'profile_id', 'id');
    }
}
