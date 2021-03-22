<?php

namespace Traits;

/**
 * (EN) Calculate check digit
 * (ES) Calcular dígito de verificación.
 */
trait Dv
{


    /**
     * (EN) VAT, RUT
     * (ES) NIT
     * @var int
     */
    private $nit;

    /**
     * Nit array
     * @var array
     */
    private $nitArray;

    /**
     * Length
     * @var int
     */
    private $length;

    /**
     * (EN) Multiplier
     * (ES) Multiplicador
     * @var array
     */
    public $multiplier = [
        1 => 3,
        2 => 7,
        3 => 13,
        4 => 17,
        5 => 19,
        6 => 23,
        7 => 29,
        8 => 37,
        9 => 41,
        10 => 43,
        11 => 47,
        12 => 53,
        13 => 59,
        14 => 67,
        15 => 71,
    ];




    /**
     * GetDv
     * (EN) Return check digit value.
     * (ES) Retorna el valor del dígito de verificación.
     * @return string
     */
    public function GetDv(int $nit): string
    {
        $this->nit = $nit;
        $this->nitArray = str_split($this->nit);
        $this->length = count($this->nitArray);

        $module = null;
        $accumulator = 0;

        foreach ($this->nitArray as $key => $value) $accumulator += ($value * $this->multiplier[($this->length - $key)]);

        if (($module = ($accumulator % 11)) > 1) return (11 - $module);

        return (string) $module;
    }
}
