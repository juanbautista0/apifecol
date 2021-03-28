<?php

namespace Traits;

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
        'number' => "",
        'type_document_id' => 1,
        'type_operation_id' => 22,
        'type_currency_id' => 52,
        'resolution_id' => 1,
        'due_date' => '2021-05-26',
        'customer' =>
        [
            'identification_number' => 1234567890,
            'name' => 'Customer Test',
            'email' => 'test@test.com',
        ],
        'invoice_period' =>
        [
            'start_date' => '2021-05-25',
            'start_time' => '12:00:00',
            'end_date' => '2021-05-25',
            'end_time' => '12:00:00',
        ],
        'order_reference' =>
        [
            'id' => 'A53568',
            'issue_date' => '2021-05-06',
        ],
        'payment_exchange_rate' =>
        [
            'type_currency_id' => 50,
            'calculation_rate' => 158487.44,
            'date' => '2021-05-15',
        ],
        'legal_monetary_totals' =>
        [
            'line_extension_amount' => '0.00',
            'tax_exclusive_amount' => '0.00',
            'tax_inclusive_amount' => '0.00',
            'allowance_total_amount' => '0.00',
            'charge_total_amount' => '0.00',
            'payable_amount' => '0.00',
        ],
        'prepaid_payments' =>
        [
            'paid_amount' => '',
            'received_date' => '2021-05-19',
            'paid_date' => '2021-05-19',
            'instruction_id' => '',
        ],
        'invoice_lines' =>
        [
            0 =>
            [
                'unit_measure_id' => 642,
                'invoiced_quantity' => '1.000000',
                'line_extension_amount' => '0.00',
                'free_of_charge_indicator' => false,
                'allowance_charges' =>
                [
                    0 =>
                    [
                        'charge_indicator' => false,
                        'allowance_charge_reason' => 'Discount',
                        'amount' => '0.00',
                        'base_amount' => '0.00',
                    ],
                ],
                'tax_totals' =>
                [
                    0 =>
                    [
                        'tax_id' => 1,
                        'tax_amount' => '0.00',
                        'taxable_amount' => '0.00',
                        'percent' => '19.00',
                    ],
                ],
                'description' => 'XXXXXXXXXXX',
                'code' => '1234567890',
                'type_item_identification_id' => 3,
                'price_amount' => '0.00',
                'base_quantity' => '1.000000',
            ],
        ],
    ];
    /**
     * @var array $InvoiceFieldsExceptions
     */
    public $InvoiceFieldsExceptions = ["prepaid_payments" => true, "payment_exchange_rate" => true, "order_reference" => true, "invoice_period" => true, "number" => true];
}
