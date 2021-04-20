<cac:{{$node}}>
    <cbc:AdditionalAccountID>{{($customer->Organization!=NULL)?$customer->Organization->code:$customer->OrganizationDefault}}</cbc:AdditionalAccountID>
    <cac:Party>
        @if($customer->Organization!=NULL)
        @if ($customer->Organization->code == 2)
        <cac:PartyIdentification>
            <cbc:ID schemeAgencyID="195" schemeAgencyName="CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)" schemeID="{{$customer->dv}}" schemeName="{{($customer->NitType!=NULL)?$customer->NitType->code:$customer->NitTypeDefault->code}}">{{$customer->identification_number}}</cbc:ID>
        </cac:PartyIdentification>
        @endif
        @else
        <cac:PartyIdentification>
            <cbc:ID schemeAgencyID="195" schemeAgencyName="CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)" schemeID="{{$customer->dv}}" schemeName="{{($customer->NitType!=NULL)?$customer->NitType->code:$customer->NitTypeDefault->code}}">{{$customer->identification_number}}</cbc:ID>
        </cac:PartyIdentification>
        @endif
        <cac:PartyName>
            <cbc:Name>{{$customer->name}}</cbc:Name>
        </cac:PartyName>
        <cac:PartyTaxScheme>
            <cbc:RegistrationName>{{$customer->name}}</cbc:RegistrationName>
            <cbc:CompanyID schemeAgencyID="195" schemeAgencyName="CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)" schemeID="{{$customer->dv}}" schemeName="{{($customer->NitType!=NULL)?$customer->NitType->code:$customer->NitTypeDefault->code}}">{{$customer->identification_number}}</cbc:CompanyID>
            <cbc:TaxLevelCode listName="{{($customer->Regime!=NULL)?$customer->Regime->code:$customer->RegimeDefault->code}}">{{($customer->Liability!=NULL)?$customer->Liability->code:$customer->LiabilityDefault->code}}</cbc:TaxLevelCode>
            <cac:RegistrationAddress>
                <cbc:ID>{{$customer->Location->Department->code.$customer->Location->code}}</cbc:ID>
                <cbc:CityName>{{$customer->Location->name}}</cbc:CityName>
                <cbc:CountrySubentity>{{$customer->Location->Department->name}}</cbc:CountrySubentity>
                <cbc:CountrySubentityCode>{{$customer->Location->Department->code}}</cbc:CountrySubentityCode>
                <cac:AddressLine>
                    <cbc:Line>{{$customer->address}}</cbc:Line>
                </cac:AddressLine>
                <cac:Country>
                    <cbc:IdentificationCode>{{$customer->Location->Department->Country->code}}</cbc:IdentificationCode>
                    <cbc:Name languageID="{{($customer->Language!=NULL)?$customer->Language->code:$customer->LanguageDefault->code}}">{{$customer->Location->Department->Country->name}}</cbc:Name>
                </cac:Country>
            </cac:RegistrationAddress>
            <cac:TaxScheme>
                <cbc:ID>{{($customer->Tax!=NULL)?$customer->Tax->code:$customer->TaxDefault->code}}</cbc:ID>
                <cbc:Name>{{($customer->Tax!=NULL)?$customer->Tax->name:$customer->TaxDefault->name}}</cbc:Name>
            </cac:TaxScheme>
        </cac:PartyTaxScheme>
        <cac:PartyLegalEntity>
            <cbc:RegistrationName>{{$customer->name}}</cbc:RegistrationName>
            <cbc:CompanyID schemeAgencyID="195" schemeAgencyName="CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)" schemeID="{{$customer->dv}}" schemeName="{{$customer->type_document_identification_id['code']}}">{{$customer->identification_number}}</cbc:CompanyID>
            <cac:CorporateRegistrationScheme>
                <cbc:Name>{{(isset($customer->merchant_registration) && !empty($customer->merchant_registration))?$customer->merchant_registration:"N/A"}}</cbc:Name>
            </cac:CorporateRegistrationScheme>
        </cac:PartyLegalEntity>
        <cac:Contact>
            @if(isset($customer->phone) && !empty($customer->phone))
             <cbc:Telephone>{{$customer->phone}}</cbc:Telephone>
            @endif
            <cbc:ElectronicMail>{{$customer->email}}</cbc:ElectronicMail>
        </cac:Contact>
    </cac:Party>
</cac:{{$node}}>