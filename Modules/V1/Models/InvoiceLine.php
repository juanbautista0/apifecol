<?php

namespace Models;

use Illuminate\Database\Eloquent\Model as CustomModel;
use Models\Config\AllowanceCharge;
use Models\Config\ReferencePrice;
use Models\Config\TaxTotal;
use Models\Config\TypeItemIdentificaction;
use Models\Config\TypeUnitMeasure;

class InvoiceLine extends CustomModel
{
    /**
     * With default model.
     *
     * @var array
     */
    protected $with = [
        'TypeUnitMeasure', 'TypeItemIdentification', 'ReferencePrice',
    ];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'unit_measure_id', 'type_item_identification_id', 'reference_price_id', 'invoiced_quantity', 'line_extension_amount', 'free_of_charge_indicator', 'description', 'code', 'price_amount', 'base_quantity', 'allowance_charges', 'tax_totals',
    ];

    /**
     * Get the unit measure that owns the invoice line.
     */
    public function TypeUnitMeasure()
    {
        return $this->belongsTo(TypeUnitMeasure::class, 'unit_measure_id', 'id');
    }

    /**
     * Get the type item identification that owns the invoice line.
     */
    public function TypeItemIdentification()
    {
        return $this->belongsTo(TypeItemIdentificaction::class, 'type_item_identification_id', 'id');
    }

    /**
     * Get the reference price that owns the invoice line.
     */
    public function ReferencePrice()
    {
        return $this->belongsTo(ReferencePrice::class);
    }

    /**
     * Get the invoice line allowance charges.
     *
     * @return string
     */
    public function getAllowanceChargesAttribute()
    {
        return $this->attributes['allowance_charges'] ?? [];
    }

    /**
     * Set the invoice line allowance charges.
     *
     * @param string $value
     */
    public function setAllowanceChargesAttribute(array $data = [])
    {
        $allowanceCharges = collect();

        foreach ($data as $value) {
            $allowanceCharges->push(new AllowanceCharge($value));
        }

        $this->attributes['allowance_charges'] = $allowanceCharges;
    }

    /**
     * Get the invoice line tax totals.
     *
     * @return string
     */
    public function getTaxTotalsAttribute()
    {
        return $this->attributes['tax_totals'] ?? [];
    }

    /**
     * Set the invoice line tax totals.
     *
     * @param string $value
     */
    public function setTaxTotalsAttribute(array $data = [])
    {
        $taxTotals = collect();

        foreach ($data as $value) $taxTotals->push(new TaxTotal($value));
        

        $this->attributes['tax_totals'] = $taxTotals;
    }

    /**
     * Get the free of charge indicator.
     *
     * @return string
     */
    public function getFreeOfChargeIndicatorAttribute()
    {
        return ($this->attributes['free_of_charge_indicator']) ? 'true': 'false';
    }
}
