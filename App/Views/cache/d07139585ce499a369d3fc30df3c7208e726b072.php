<ext:UBLExtensions>
    <ext:UBLExtension>
        <ext:ExtensionContent>
            <sts:DianExtensions>
                <?php if($resolution->type_document_id == 1): ?>
                    <?php echo $__env->renderWhen($resolution->resolution, 'xml._invoice_control', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path'])); ?>
                <?php endif; ?>
                <sts:InvoiceSource>
                    <cbc:IdentificationCode listAgencyID="6" listAgencyName="United Nations Economic Commission for Europe" listSchemeURI="urn:oasis:names:specification:ubl:codelist:gc:CountryIdentificationCode-2.1"><?php echo e($company->country->code); ?></cbc:IdentificationCode>
                </sts:InvoiceSource>
                <sts:SoftwareProvider>
                    <sts:ProviderID schemeAgencyID="195" schemeAgencyName="CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)" <?php if($company->type_document_identification_id == 6): ?> schemeID="<?php echo e($company->dv); ?>" <?php endif; ?> schemeName="<?php echo e($company->type_document_identification->code); ?>"><?php echo e($company->identification_number); ?></sts:ProviderID>
                    <sts:SoftwareID schemeAgencyID="195" schemeAgencyName="CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)"><?php echo e($company->software->identifier); ?></sts:SoftwareID>
                </sts:SoftwareProvider>
                <sts:SoftwareSecurityCode schemeAgencyID="195" schemeAgencyName="CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)"/>
                <sts:AuthorizationProvider>
                    <sts:AuthorizationProviderID schemeAgencyID="195" schemeAgencyName="CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)" schemeID="4" schemeName="31">800197268</sts:AuthorizationProviderID>
                </sts:AuthorizationProvider>
                <sts:QRCode>QRCode</sts:QRCode>
            </sts:DianExtensions>
        </ext:ExtensionContent>
    </ext:UBLExtension>
    <ext:UBLExtension>
        <ext:ExtensionContent/>
    </ext:UBLExtension>
</ext:UBLExtensions>
<?php /**PATH /var/www/html/apifecol/Modules/V1/Views/xml/_ubl_extensions.blade.php ENDPATH**/ ?>