<?php

namespace Models;

use Illuminate\Database\Eloquent\Model as CustomModel;
use Models\Config\PaymentForm;
use Models\Config\PaymentMethod;
use Models\Config\TypeCurrency;
use Models\Config\TypeDocument;
use Models\Config\TypeOperation;
use Models\Config\Resolution;
use Models\Config\TypeUnitMeasure;

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

    /**
     * @var array
     */
    protected $with = [
        'TypeDocument', 'TypeDocumentDefault', 'TypeOperation', 'TypeOperationDefault', 'TypeCurrency', 'TypeCurrencyDefault', 'Resolution', 'PaymentMethod', 'PaymentMethodDefault','PaymentForm','PaymentFormDefault','PaymentDuration','PaymentDurationDefault'
    ];

    /**
     * @var array
     */
    protected $fillable = [
        'number', 'type_document_id', 'type_operation_id', 'type_currency_id', 'resolution_id', 'due_date', 'payment_method_id', 'payment_form_id', 'payment_duration_unit_measure_id', 'delivery_comments','delivery_company_id','delivery_terms_id','xml_name','cufe','zipkey','acknowledgement_receipt','date_time_dian','status_dian1','status_dian2'
    ];


    public function Biller()
    {
        return $this->hasOne(Biller::class, 'id', 'biller_id');
    }

    public function TypeDocument()
    {
        return $this->hasOne(TypeDocument::class, 'id', 'type_document_id');
    }

    public function TypeDocumentDefault()
    {
        return $this->belongsTo(TypeDocument::class)
            ->withDefault([
                'id'       => 1,
                'name'     => 'Factura de Venta Nacional',
                'code'     => '01',
                'algoritm' => 'CUFE-SHA384',
                'prefix'   => 'fv',
            ]);
    }

    public function TypeOperation()
    {
        return $this->hasOne(TypeOperation::class, 'id', 'type_operation_id');
    }

    public function TypeOperationDefault()
    {
        return $this->belongsTo(TypeOperation::class)
            ->withDefault([
                'id'   => 22,
                'name' => 'Estándar *',
                'code' => '10'
            ]);
    }

    public function TypeCurrency()
    {
        return $this->hasOne(TypeCurrency::class, 'id', 'type_currency_id');
    }

    public function TypeCurrencyDefault()
    {
        return $this->belongsTo(TypeCurrency::class)
            ->withDefault([
                'id'       => 52,
                'country'  => 'Colombia',
                'currency' => 'Colombian peso',
                'code'     => 'COP',
                'symbol'   => '$'
            ]);
    }

    public function PaymentMethod()
    {
        return $this->hasOne(PaymentMethod::class, 'id', 'payment_method_id');
    }

    public function PaymentMethodDefault()
    {
        return $this->belongsTo(PaymentMethod::class)
            ->withDefault([
                'id'       => 126,
                'name'     => 'Transferencia Débito Bancaria',
                'code'     => '47',
            ]);
    }

    public function PaymentForm()
    {
        return $this->hasOne(PaymentForm::class, 'id', 'payment_form_id');
    }

    public function PaymentFormDefault()
    {
        return $this->belongsTo(PaymentForm::class)
            ->withDefault([
                'id'       => 2,
                'name'     => 'Crédito',
                'code'     => '2',
            ]);
    }

    public function PaymentDuration()
    {
        return $this->hasOne(TypeUnitMeasure::class, 'id', 'payment_duration_unit_measure_id');
    }
    public function PaymentDurationDefault()
    {
        return $this->belongsTo(TypeUnitMeasure::class)
        ->withDefault([
            'id'       => 606,
            'name'     => 'día',
            'code'     => 'DAY',
        ]);
    }
    public function Resolution()
    {
        return $this->hasOne(Resolution::class, 'id', 'resolution_id');
    }
}
