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
    protected $table = 'profile';
    protected $primaryKey = 'id';

    public function Biller()
    {
        return $this->hasMany(Biller::class, 'profile_id', 'id');
    }
}
