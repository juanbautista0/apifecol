<?php

namespace Traits;

/**
 * (EN) Biller resources
 * (ES) Recursos de facturador
 */
trait BillerResources
{
    /**
     * @var array
     */
    public $billerRelations = ['Location.Department.Country', 'Language', 'LanguageDefault', 'NitType', 'NitTypeDefault', 'Regime', 'RegimeDefault', 'Organization', 'OrganizationDefault', 'Liability', 'LiabilityDefault', 'Tax', 'TaxDefault', 'Environment', 'EnvironmentDefault', 'SendMethod','SendMethodDefault'];


    /**
     * @var object
     */
    public $customer;
}