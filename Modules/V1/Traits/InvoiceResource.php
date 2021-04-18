<?php

namespace Traits;

use Models\Config\Tax;
use Models\Config\TypeItemIdentificaction;
use Models\Config\TypeUnitMeasure;

/**
 * (EN) Invoice resources
 * (ES) Recursos de factura
 */
trait InvoiceResource
{
    /**
     * @var array $InvoiceFieldsRequireds
     */
    public $InvoiceFieldsRequireds = [
        'number'            => "",
        'type_document_id'  => 1,
        'type_operation_id' => 22,
        'type_currency_id'  => 52,
        'resolution_id'     => 1,
        'due_date'          => '2021-05-26',
        'customer'          =>
        [
            "identification_number" => 901004305,
            "name"                  => "Customer Test",
            "email"                 => "test@test.com",
            "nit_type_id"           => 6,
            "type_regime_id"        => 1,
            "liability_id"          => 1,
            "type_organization_id"  => 1,
            "municipality_id"       => 1,
            "language_id"           => 53,
            "tax_id"                => 1,
            "merchant_registration" => "245889"
        ],
        'invoice_period' =>
        [
            'start_date' => '2021-05-25',
            'start_time' => '12:00:00',
            'end_date'   => '2021-05-25',
            'end_time'   => '12:00:00',
        ],
        'order_reference' =>
        [
            'id'         => 'A53568',
            'issue_date' => '2021-05-06',
        ],
        'payment_exchange_rate' =>
        [
            'type_currency_id' => 50,
            'calculation_rate' => 158487.44,
            'date'             => '2021-05-15',
        ],
        'legal_monetary_totals' =>
        [
            'line_extension_amount'  => '0.00',
            'tax_exclusive_amount'   => '0.00',
            'tax_inclusive_amount'   => '0.00',
            'allowance_total_amount' => '0.00',
            'charge_total_amount'    => '0.00',
            'payable_amount'         => '0.00',
        ],
        'prepaid_payments' =>
        [
            'paid_amount'    => '',
            'received_date'  => '2021-05-19',
            'paid_date'      => '2021-05-19',
            'instruction_id' => '',
        ],
        'invoice_lines' =>
        [
            0 =>
            [
                'unit_measure_id'          => 642,
                'invoiced_quantity'        => '1.000000',
                'line_extension_amount'    => '0.00',
                'free_of_charge_indicator' => false,
                'allowance_charges'        =>
                [
                    0 =>
                    [
                        'charge_indicator'        => false,
                        'allowance_charge_reason' => 'Discount',
                        'amount'                  => '0.00',
                        'base_amount'             => '0.00',
                    ],
                ],
                'tax_totals' =>
                [
                    0 =>
                    [
                        'tax_id'         => 1,
                        'tax_amount'     => '0.00',
                        'taxable_amount' => '0.00',
                        'percent'        => '19.00',
                    ],
                ],
                'description'                 => 'XXXXXXXXXXX',
                'code'                        => '1234567890',
                'type_item_identification_id' => 3,
                'price_amount'                => '0.00',
                'base_quantity'               => '1.000000',
            ],
        ]
    ];

    /**
     * @var array $LinesFieldsRequireds
     */
    public $LinesFieldsRequireds =  [
        'unit_measure_id'          => 642,
        'invoiced_quantity'        => '1.000000',
        'line_extension_amount'    => '0.00',
        'free_of_charge_indicator' => false,
        'allowance_charges'        => [
            0 => [
                'charge_indicator'        => false,
                'allowance_charge_reason' => 'Discount',
                'amount'                  => '0.00',
                'base_amount'             => '0.00',
            ],
        ],
        'tax_totals' => [
            0 => [
                'tax_id'         => 1,
                'tax_amount'     => '0.00',
                'taxable_amount' => '0.00',
                'percent'        => '19.00',
            ],
        ],
        'description'                 => 'XXXXXXXXXXX',
        'code'                        => '1234567890',
        'type_item_identification_id' => 3,
        'price_amount'                => '0.00',
        'base_quantity'               => '1.000000',
    ];

    /**
     * @var array
     */
    public $invoiceRelations = [
        'TypeDocument', 'TypeDocumentDefault', 'TypeOperation', 'TypeOperationDefault', 'TypeCurrency', 'TypeCurrencyDefault', 'Resolution'
    ];
    /**
     * @var array $InvoiceFieldsExceptions
     */
    public $InvoiceFieldsExceptions = ["prepaid_payments" => true, "payment_exchange_rate" => true, "order_reference" => true, "invoice_period" => true, "number" => true];

    /**
     * @var array $RelationsKeys
     */
    public $RelationsKeys = [
        "type_document_id",
        "type_operation_id",
        "type_currency_id",
        "resolution_id"
    ];

    /**
     * @var object
     */
    public $invoice;

    /**
     * @var object
     */
    public $lines;

    /**
     * (EN) Validate Relationship Keys that were entered by the customer.
     * (ES) Validar Llaves de relación que fueron ingresadas por el cliente.
     * @param object $input
     * @return void
     */
    public function ValidateRelationshipKeys(object $inputs, array $Keys = [], string $entity = ''): void
    {
        // Validation Relationship Keys
        foreach ($Keys as $key => $value) ($value::where('id', $inputs->{$key})->first() != NULL) ? true : _json(['code' => 404, 'data' => ['message' =>  "$entity" . str_replace("_", " ", ucwords($key)) . ' not found']]);
    }

    /**
     * ValidateInvoiceLines
     * (EN) Validation invoice lines
     * (ES) Valiación de líneas de factura
     * @access public
     * @param array $lines
     * @param array $exceptions
     * @return void
     */
    public function ValidateInvoiceLines(array $lines, array $exceptions = []): void
    {
        foreach ($this->LinesFieldsRequireds as $key => $value) {
            foreach ($lines as $key1 => $value1) {
                (isset($lines[$key1][$key])) ? true : _json(['code' => 400, 'data' => ['message' => "Bad Request, {$key} is a required field for invoice lines."]]);
            }
        }

        foreach ($this->request->invoice_lines as $key => $value) {
            $this->ValidateRelationshipKeys((object) $value, [
                "unit_measure_id"             => new TypeUnitMeasure,
                "type_item_identification_id" => new TypeItemIdentificaction,
            ], "Invoice line ");

            foreach ($value['tax_totals'] as $key1 => $value1) {
                $this->ValidateRelationshipKeys((object) $value1, [
                    "tax_id"      => new Tax,
                ], "Invoice line ");
            }
        }
    }

    /**
     * ValidateInvoiceEntryData
     * (EN) Validación de los campos de entrada de un objeto de factura.
     * (ES) Validación de los campos de entrada de un objeto de factura.
     * @access public
     * @return void
     */
    public function ValidateInvoiceEntryData(): void
    {
    }
}
