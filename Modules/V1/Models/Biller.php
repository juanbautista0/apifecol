<?php

namespace Models;

use Illuminate\Database\Eloquent\Model as CustomModel;
use Models\Config\Liability;
use Models\Config\Municipality;
use Models\Config\NitType;
use Models\Config\Organization;
use Models\Config\Regime;

class Biller extends CustomModel
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'api_billers';
    protected $primaryKey = 'id';
    protected $hidden = ['created_at', 'updated_at'];


    public function Location()
    {
        return $this->hasOne(Municipality::class, 'id', 'municipality_id');
    }

    public function NitType()
    {
        return $this->hasOne(NitType::class, 'id', 'nit_type_id');
    }

    public function Regime()
    {
        return $this->hasOne(Regime::class, 'id', 'type_regime_id');
    }

    public function Organization()
    {
        return $this->hasOne(Organization::class, 'id', 'type_organization_id');
    }

    public function Liability()
    {
        return $this->hasOne(Liability::class, 'id', 'type_organization_id');
    }
}
