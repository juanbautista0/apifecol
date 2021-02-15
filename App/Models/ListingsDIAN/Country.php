<?php

namespace App\Models\ListingsDIAN;

use Illuminate\Database\Eloquent\Model as CustomModel;

class Country extends CustomModel
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'api_countries';
    protected $primaryKey = 'id';
    protected $hidden = ['created_at', 'updated_at'];

}
