<?php

namespace Traits;

use Exception;
use Lib\Signatory;
use Models\Config\Tax;
use Models\Config\TypeItemIdentificaction;
use Models\Config\TypeUnitMeasure;
use Traits\BillerResources;

/**
 * (EN) Invoice resources
 * (ES) Recursos de factura
 */
trait InvoiceResource
{
    use BillerResources;
    /**
     * @var array $InvoiceFieldsRequireds
     */
    public $InvoiceFieldsRequireds = [
        'number'                           => "",
        'type_document_id'                 => 1,
        'type_operation_id'                => 22,
        'type_currency_id'                 => 52,
        'resolution_id'                    => 1,
        'due_date'                         => '2021-05-26',
        'payment_method_id'                => 47,
        'payment_form_id'                  => 2,
        'payment_duration_unit_measure_id' => 606,
        'customer'                         =>
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
        'tax_totals' => [
            0 => [
                'tax_id'         => 1,
                'tax_amount'     => '0.00',
                'percent'        => '0.00',
                'taxable_amount' => '0.00'
            ]
        ],
        'allowance_charges' => [
            0 =>
            [
                'charge_indicator'        => false,
                'allowance_charge_reason' => 'Discount',
                'amount'                  => '0.00',
                'base_amount'             => '0.00',
            ],
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
        'TypeDocument', 'TypeDocumentDefault', 'TypeOperation', 'TypeOperationDefault', 'TypeCurrency', 'TypeCurrencyDefault', 'Resolution', 'PaymentMethod', 'PaymentMethodDefault', 'PaymentForm', 'PaymentFormDefault', 'PaymentDuration', 'PaymentDurationDefault'
    ];
    /**
     * @var array
     */
    public $defaulRelationsUnset = [
        'TypeDocumentDefault',
        'TypeOperationDefault',
        'TypeCurrencyDefault',
        'PaymentMethodDefault',
        'PaymentFormDefault',
        'PaymentDurationDefault'
    ];

    /**
     * @var array
     */
    public $invoiceLinesRelations = [
        'TypeUnitMeasure', 'TypeItemIdentification', 'ReferencePrice',
    ];

    /**
     * @var array
     */
    public $taxTotalsRelations = [
        'tax', 'unit_measure',
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
     * @var object
     */
    public $taxTotals;

    /**
     * @var object
     */
    public $AllowanceCharges;

    /**
     * @var object
     */
    public $Document;

    /**
     * @var object
     */
    public $DomXPath;

    /**
     * @var string
     */
    public $technicalKey;

    /**
     * @var string
     */
    public $groupOfTotals = 'LegalMonetaryTotal';

    /**
     * @var string
     */
    public $cufe;

    /**
     * @var string
     */
    public $UUIDsha256;

    /**
     * @var object
     */
    public $Signatory;

    /**
     * @var int 
     */
    public $zipNumber;

    /**
     * @var string
     */
    public $xmlName;

    /**
     * @var string
     */
    public $fileName;

    /**
     * @var string
     */
    public $zip64;

    /**
     * @var string
     */
    public $_WS_ACTION;

    /**
     * @var string
     */
    public $_BODY;

    /**
     * @var string
     */
    public $SendMethod;

    /**
     * @var string
     */
    public $petitionDIAN;

    /**
     * @var string
     */
    public $environmentType;

    /**
     * @var string
     */
    public $responseDIAN;

    /**
     * @var string
     */
    public $zipKey;

    /**
     * @var array
     */
    public $documentStatus;

    /**
     * @var object
     */
    public $currentZipNumber;

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
                    "tax_id" => new Tax,
                ], "Invoice line ");
            }
        }
    }

    /**
     * (EN) Get tag from xml document.
     * (ES) Obtener etiqueta desde el documento xml
     * @param string $tag
     * @param int    $item
     * @return mixed
     */
    protected function GetTag($tag, $item = 0): mixed
    {
        $tag = $this->Document->documentElement->getElementsByTagName($tag);

        if (is_null($tag->item(0))) {
            throw new Exception('Class ' . get_class($this) . ": The tag name {$tag} does not exist.");
        }

        return $tag->item($item);
    }

    /**
     * (EN) Unique electronic invoice code
     * (ES) Código único de factura electrónica
     * @param object $dompath
     * @param object $documentXml
     * @param string $tk
     * @param bool    $ctx
     * 
     * @return string
     */
    private function Cufe(object $dompath, object $documentXml, string $tk, bool $ctx = false): string
    {
        $this->DomXPath     = $dompath;
        $this->Document     = $documentXml;
        $this->technicalKey = $tk;
        $cufevalue          = "{$this->GetTag('ID', 0)->nodeValue}{$this->GetTag('IssueDate', 0)->nodeValue}{$this->GetTag('IssueTime', 0)->nodeValue}{$this->DOMquery("cac:{$this->groupOfTotals}/cbc:LineExtensionAmount")->nodeValue}01" . ($this->DOMquery('cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID=01]/cbc:TaxAmount', false)->nodeValue ?? '0.00') . '04' . ($this->DOMquery('cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID=04]/cbc:TaxAmount', false)->nodeValue ?? '0.00') . '03' . ($this->DOMquery('cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID=03]/cbc:TaxAmount', false)->nodeValue ?? '0.00') . "{$this->DOMquery("cac:{$this->groupOfTotals}/cbc:PayableAmount")->nodeValue}{$this->DOMquery('cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID')->nodeValue}{$this->DOMquery('cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID')->nodeValue}{$this->technicalKey}{$this->GetTag('ProfileExecutionID', 0)->nodeValue}";
        //$this->GetTag('UUID', 0)->nodeValue = hash('sha384', "{$this->GetTag('ID', 0)->nodeValue}{$this->GetTag('IssueDate', 0)->nodeValue}{$this->GetTag('IssueTime', 0)->nodeValue}{$this->DOMquery("cac:{$this->groupOfTotals}/cbc:LineExtensionAmount")->nodeValue}01" . ($this->DOMquery('cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID=01]/cbc:TaxAmount', false)->nodeValue ?? '0.00') . '04' . ($this->DOMquery('cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID=04]/cbc:TaxAmount', false)->nodeValue ?? '0.00') . '03' . ($this->DOMquery('cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID=03]/cbc:TaxAmount', false)->nodeValue ?? '0.00') . "{$this->DOMquery("cac:{$this->groupOfTotals}/cbc:PayableAmount")->nodeValue}{$this->DOMquery('cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID')->nodeValue}{$this->DOMquery('cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID')->nodeValue}{$this->technicalKey}{$this->GetTag('ProfileExecutionID', 0)->nodeValue}");
        return ($ctx) ? hash('sha384', $cufevalue) : $cufevalue;
    }

    /**
     * (EN) DOM query
     * (ES) Consulta al DOM
     * @param string $query
     * @param bool   $validate
     * @param int    $item
     * @return mixed
     */
    protected function DOMquery($query, $validate = true, $item = 0): mixed
    {
        $tag = $this->DomXPath->query($query);
        if (($validate) && (null == $tag->item(0))) {
            throw new Exception('Class ' . get_class($this) . ": The query {$query} does not exist.");
        }
        if (is_null($item)) {
            return $tag;
        }

        return $tag->item($item);
    }
    /**
     * (EN) Validación de los campos de entrada de un objeto de factura.
     * (ES) Validación de los campos de entrada de un objeto de factura.
     * @access public
     * @return void
     */
    public function ValidateInvoiceEntryData(): void
    {
    }

    /**
     * (EN) Method in charge of managing the process after the DIAN has approved the electronic invoice.
     * (ES) Método encargado de gestionar proceso después de que la DIAN haya aprobado la factura electrónica.
     * @access public
     * @param  array  $callbacks
     * @param  object $invoice
     * @param  object $invoiceLines
     * @param  object $allowanceCharges
     * @param  object $taxTotals
     * @param  array  $legalMonetaryTotals
     * @param  object $biller
     * @param  object $customer
     * @param  array  $documentStatus
     * @param  string $xmlName
     * @param  string $zipKey
     * @param  string $cufe
     * @param  string $dateTimeDian
     * @return void
     */
    public function CorrectlyProcessedInvoice(array $callbacks = [], object $invoice, object $invoiceLines, object $allowanceCharges, object $taxTotals, array $legalMonetaryTotals, object $biller, object $customer, array $documentStatus, string $xmlName, string $zipKey, string $cufe, string $dateTimeDian): void
    {

        (!empty($callbacks)) ? $this->CallsbacksAfter($callbacks) : true;

        foreach ($this->billerRelations as $key) unset($customer->{$key});


        $data = [
            'date_time_dian'        => strval($dateTimeDian),
            'status_dian1'          => $documentStatus['StatusDescription'],
            'xml_name'              => $xmlName,
            'cufe'                  => $cufe,
            'zipkey'                => $zipKey,
            'biller_id'             => $biller->id,
            'customer'              => json_encode($customer->toArray()),
            'invoice_lines'         => json_encode($invoiceLines->toArray()),
            'allowance_charges'     => json_encode($allowanceCharges->toArray() ?? []),
            'tax_totals'            => json_encode($taxTotals->toArray() ?? []),
            'legal_monetary_totals' => json_encode($legalMonetaryTotals ?? []),
        ];

        foreach ($this->invoiceRelations as $key) unset($invoice->{$key});

        foreach ($data as $key => $value) $invoice->{$key} = $value;

        $invoice->save();
    }

    /**
     * (EN) Method to manage the process after the failure of the electronic invoice issuance.
     * (ES) Método encarga de gestionar el proceso una vez falle la la emisión de factura electrónica.
     * @access public
     * @param array $callbacks
     * @param string $file
     */
    public function InvoiceProcessingError(string $file = ''): void
    {
    }


    /**
     * (EN) Actions for later.
     * (ES) Acciones para despues.
     */
    public function CallsbacksAfter(array $calls): void
    {
        foreach ($calls as $action) (is_callable($action)) ? $action() : true;
    }
}
