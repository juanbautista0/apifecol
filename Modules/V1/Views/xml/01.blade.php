<Invoice
    xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
    xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
    xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
    xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
    xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
    xmlns:sts="http://www.dian.gov.co/contratos/facturaelectronica/v1/Structures"
    xmlns:xades="http://uri.etsi.org/01903/v1.3.2#"
    xmlns:xades141="http://uri.etsi.org/01903/v1.4.1#"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2     http://docs.oasis-open.org/ubl/os-UBL-2.1/xsd/maindoc/UBL-Invoice-2.1.xsd">
    {{-- UBLExtensions --}}
    @include('xml._ubl_extensions')
    <cbc:UBLVersionID>UBL 2.1</cbc:UBLVersionID>
    <cbc:CustomizationID>{{$company->type_operation->code}}</cbc:CustomizationID>
    <cbc:ProfileID>DIAN 2.1</cbc:ProfileID>
    <cbc:ProfileExecutionID>{{($company->Environment != NULL)?$company->Environment->code:$company->EnvironmentDefault->code}}</cbc:ProfileExecutionID>
    <cbc:ID>{{$resolution->next_consecutive}}</cbc:ID>
    <cbc:UUID schemeID="{{($company->Environment!=NULL)?$company->Environment->code:$company->EnvironmentDefault->code}}" schemeName="{{($invoice->TypeDocument!=NULL)?$invoice->TypeDocument->algoritm:$invoice->TypeDocumentDefault->algoritm}}">__CUFE__</cbc:UUID>
    <cbc:IssueDate>{{$IssueDate ?? Carbon\Carbon::now()->format('Y-m-d')}}</cbc:IssueDate>
    <cbc:IssueTime>{{$IssueTime ?? Carbon\Carbon::now()->format('H:i:s')}}-05:00</cbc:IssueTime>
    <cbc:InvoiceTypeCode>{{($invoice->TypeDocument!=NULL)?$invoice->TypeDocument->code:$invoice->TypeDocumentDefault->code}}</cbc:InvoiceTypeCode>
    <cbc:DocumentCurrencyCode>{{($invoice->TypeCurrency!=NULL)?$invoice->TypeCurrency->code:$invoice->TypeCurrencyDefault->code}}</cbc:DocumentCurrencyCode>
    <cbc:LineCountNumeric>{{count($lines)}}</cbc:LineCountNumeric>
    {{-- AccountingSupplierParty --}}
    @include('xml._accounting', ['node' => 'AccountingSupplierParty', 'supplier' => true])
    {{-- AccountingCustomerParty --}}
    @include('xml._accounting_customer', ['node' => 'AccountingCustomerParty', 'customer' => $customer])
    {{-- PaymentMeans --}}
    @include('xml._payment_means')
    {{-- PaymentTerms --}}
    @include('xml._payment_terms')
    {{-- AllowanceCharges --}}
    @include('xml._allowance_charges')
    {{-- TaxTotals --}}
    @include('xml._tax_totals')
    {{-- LegalMonetaryTotal --}}
    @include('xml._legal_monetary_total', ['node' => 'LegalMonetaryTotal'])
    {{-- InvoiceLines --}}
    @include('xml._invoice_lines')
</Invoice>