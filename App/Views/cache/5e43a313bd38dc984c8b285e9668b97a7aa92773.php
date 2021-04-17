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
    
    <?php echo $__env->make('xml._ubl_extensions', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    <cbc:UBLVersionID>UBL 2.1</cbc:UBLVersionID>
    <cbc:CustomizationID><?php echo e($company->type_operation->code); ?></cbc:CustomizationID>
    <cbc:ProfileID>DIAN 2.1</cbc:ProfileID>
    <cbc:ProfileExecutionID><?php echo e($company->type_environment->code); ?></cbc:ProfileExecutionID>
    <cbc:ID><?php echo e($resolution->next_consecutive); ?></cbc:ID>
    <cbc:UUID schemeID="<?php echo e($company->type_environment->code); ?>" schemeName="<?php echo e($typeDocument->cufe_algorithm); ?>"/>
    <cbc:IssueDate><?php echo e($date ?? Carbon\Carbon::now()->format('Y-m-d')); ?></cbc:IssueDate>
    <cbc:IssueTime><?php echo e($time ?? Carbon\Carbon::now()->format('H:i:s')); ?>-05:00</cbc:IssueTime>
    <cbc:InvoiceTypeCode><?php echo e($typeDocument->code); ?></cbc:InvoiceTypeCode>
    <cbc:DocumentCurrencyCode><?php echo e($company->type_currency->code); ?></cbc:DocumentCurrencyCode>
    <cbc:LineCountNumeric><?php echo e($invoiceLines->count()); ?></cbc:LineCountNumeric>
    
    <?php echo $__env->make('xml._accounting', ['node' => 'AccountingSupplierParty', 'supplier' => true], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    
    <?php echo $__env->make('xml._accounting', ['node' => 'AccountingCustomerParty', 'user' => $customer], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    
    <?php echo $__env->make('xml._payment_means', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    
    <?php echo $__env->make('xml._payment_terms', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    
    <?php echo $__env->make('xml._allowance_charges', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    
    <?php echo $__env->make('xml._tax_totals', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    
    <?php echo $__env->make('xml._legal_monetary_total', ['node' => 'LegalMonetaryTotal'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    
    <?php echo $__env->make('xml._invoice_lines', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
</Invoice>
<?php /**PATH /var/www/html/apifecol/Modules/V1/Views/xml/01.blade.php ENDPATH**/ ?>