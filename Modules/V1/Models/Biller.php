<?php

namespace Models;

use Illuminate\Database\Eloquent\Model as CustomModel;
use Models\Config\Language;
use Models\Config\Liability;
use Models\Config\Municipality;
use Models\Config\NitType;
use Models\Config\Organization;
use Models\Config\Regime;
use Models\Config\Tax;
use Models\Config\TypeEnvironment;

class Biller extends CustomModel
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table      = 'api_billers';
    protected $primaryKey = 'id';
    protected $hidden     = ['created_at', 'updated_at'];


    /**
     * @var array
     */
    protected $with = [
        'Location.Department.Country', 'Language', 'LanguageDefault', 'NitType', 'NitTypeDefault', 'Regime', 'RegimeDefault', 'Organization', 'OrganizationDefault', 'Liability', 'LiabilityDefault', 'Tax', 'TaxDefault', 'Environment', 'EnvironmentDefault'
    ];


    /**
     * @var array
     */
    protected $fillable = [
        'identification_number', 'dv', 'nit_type_id', 'tax_id', 'name', 'email', 'type_currency_id', 'type_organization_id', 'type_regime_id', 'liability_id', 'municipality_id', 'merchant_registration', 'address', 'phone', 'language_id'
    ];



    public function Location()
    {
        return $this->hasOne(Municipality::class, 'id', 'municipality_id');
    }

    public function Language()
    {
        return $this->hasOne(Language::class, 'id', 'language_id');
    }

    public function LanguageDefault()
    {
        return $this->belongsTo(Language::class)
            ->withDefault([
                'id'          => 53,
                'code'        => 'es',
                'description' => 'español [Colombia]',
            ]);
    }

    public function NitType()
    {
        return $this->hasOne(NitType::class, 'id', 'nit_type_id');
    }

    public  function NitTypeDefault()
    {
        return $this->belongsTo(NitType::class)
            ->withDefault([
                'id'   => 3,
                'name' => 'Cédula de ciudadanía',
                'code' => '13',
            ]);
    }

    public function Regime()
    {
        return $this->hasOne(Regime::class, 'id', 'type_regime_id');
    }

    public function RegimeDefault()
    {
        return $this->belongsTo(Regime::class)
            ->withDefault([
                'id'   => 2,
                'name' => 'No responsable de IVA',
                'code' => '49',
            ]);
    }

    public function Organization()
    {
        return $this->hasOne(Organization::class, 'id', 'type_organization_id');
    }

    public function OrganizationDefault()
    {
        return $this->belongsTo(Organization::class)
            ->withDefault([
                'id'   => 2,
                'name' => 'Persona Natural',
                'code' => '2',
            ]);
    }

    public function Liability()
    {
        return $this->hasOne(Liability::class, 'id', 'liability_id');
    }

    public function LiabilityDefault()
    {
        return $this->belongsTo(Liability::class)
            ->withDefault([
                'id'   => 28,
                'name' => 'No responsable',
                'code' => 'R-99-PN',
            ]);
    }

    public function Tax()
    {
        return $this->hasOne(Tax::class, 'id', 'tax_id');
    }

    public function TaxDefault()
    {
        return $this->belongsTo(Tax::class)
            ->withDefault([
                'id'          => 1,
                'name'        => 'IVA',
                'description' => 'Impuesto de Valor Agregado',
                'code'        => '01',
            ]);
    }

    public function Environment()
    {
        return $this->hasOne(TypeEnvironment::class, 'id', 'type_environment_id');
    }

    public function EnvironmentDefault()
    {
        return $this->belongsTo(TypeEnvironment::class)
            ->withDefault([
                'id'     => 2,
                'name'   => 'Desarrollo',
                'code'   => '2',
                'qr_url' => 'https://catalogo-vpfe-hab.dian.gov.co/document/searchqr?documentkey=',
                'ws_url' => 'https://vpfe-hab.dian.gov.co/WcfDianCustomerServices.svc'

            ]);
    }
}
