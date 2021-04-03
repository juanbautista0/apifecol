<?php

namespace Models;

use Illuminate\Database\Eloquent\Model as CustomModel;
use Models\Config\TypeCurrency;
use Models\Config\TypeDocument;
use Models\Config\TypeOperation;
use Models\Config\Resolution;

class Invoice extends CustomModel
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table      = 'api_invoices';
    protected $primaryKey = 'id';
    protected $hidden     = ['created_at', 'updated_at'];

    public function Biller()
    {
        return $this->hasOne(Biller::class, 'id', 'biller_id');
    }

    public function TypeDocument()
    {
        return $this->hasOne(TypeDocument::class, 'id', 'type_document_id');
    }

    public function TypeOperation()
    {
        return $this->hasOne(TypeOperation::class, 'id', 'type_operation_id');
    }

    public function TypeCurrency()
    {
        return $this->hasOne(TypeCurrency::class, 'id', 'type_currency_id');
    }

    public function Resolution()
    {
        return $this->hasOne(Resolution::class, 'id', 'resolution_id');
    }
}
