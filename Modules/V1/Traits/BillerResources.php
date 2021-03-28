<?php

namespace Traits;

/**
 * (EN) Biller resources
 * (ES) Recursos de facturador
 */
trait BillerResources
{
    public $billerRelations = ['Location.Department.Country', 'NitType', 'Regime', 'Organization', 'Liability'];
}