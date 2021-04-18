<cac:{{$node}}>
    <cbc:AdditionalAccountID>{{($company->Organization!=NULL)?$company->Organization->code:$company->OrganizationDefault}}</cbc:AdditionalAccountID>
    <cac:Party>
        @if($company->Organization!=NULL)
        @if ($company->Organization->code == 2)
        <cac:PartyIdentification>
            <cbc:ID schemeAgencyID="195" schemeAgencyName="CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)" schemeID="{{$company->dv}}" schemeName="{{($company->NitType!=NULL)?$company->NitType->code:$company->NitTypeDefault->code}}">{{$company->identification_number}}</cbc:ID>
        </cac:PartyIdentification>
        @endif
        @else
        <cac:PartyIdentification>
            <cbc:ID schemeAgencyID="195" schemeAgencyName="CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)" schemeID="{{$company->dv}}" schemeName="{{($company->NitType!=NULL)?$company->NitType->code:$company->NitTypeDefault->code}}">{{$company->identification_number}}</cbc:ID>
        </cac:PartyIdentification>
        @endif
        <cac:PartyName>
            <cbc:Name>{{$company->name}}</cbc:Name>
        </cac:PartyName>
        @isset($supplier)
        <cac:PhysicalLocation>
            <cac:Address>
                <cbc:ID>{{$company->Location->Department->code.$company->Location->code}}</cbc:ID>
                <cbc:CityName>{{$company->Location->name}}</cbc:CityName>
                <cbc:CountrySubentity>{{$company->Location->Department->name}}</cbc:CountrySubentity>
                <cbc:CountrySubentityCode>{{$company->Location->Department->code}}</cbc:CountrySubentityCode>
                <cac:AddressLine>
                    <cbc:Line>{{$company->address}}</cbc:Line>
                </cac:AddressLine>
                <cac:Country>
                    <cbc:IdentificationCode>{{$company->Location->Department->Country->code}}</cbc:IdentificationCode>
                    <cbc:Name languageID="{{($company->Language!=NULL)?$company->Language->code:$company->LanguageDefault->code}}">{{$company->Location->Department->Country->name}}</cbc:Name>
                </cac:Country>
            </cac:Address>
        </cac:PhysicalLocation>
        @endisset
        <cac:PartyTaxScheme>
            <cbc:RegistrationName>{{$company->name}}</cbc:RegistrationName>
            <cbc:CompanyID schemeAgencyID="195" schemeAgencyName="CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)" schemeID="{{$company->dv}}" schemeName="{{($company->NitType!=NULL)?$company->NitType->code:$company->NitTypeDefault->code}}">{{$company->identification_number}}</cbc:CompanyID>
            <cbc:TaxLevelCode listName="{{($company->Regime!=NULL)?$company->Regime->code:$company->RegimeDefault->code}}">{{($company->Liability!=NULL)?$company->Liability->code:$company->LiabilityDefault->code}}</cbc:TaxLevelCode>
            <cac:RegistrationAddress>
                <cbc:ID>{{$company->Location->Department->code.$company->Location->code}}</cbc:ID>
                <cbc:CityName>{{$company->Location->name}}</cbc:CityName>
                <cbc:CountrySubentity>{{$company->Location->Department->name}}</cbc:CountrySubentity>
                <cbc:CountrySubentityCode>{{$company->Location->Department->code}}</cbc:CountrySubentityCode>
                <cac:AddressLine>
                    <cbc:Line>{{$company->address}}</cbc:Line>
                </cac:AddressLine>
                <cac:Country>
                    <cbc:IdentificationCode>{{$company->Location->Department->Country->code}}</cbc:IdentificationCode>
                    <cbc:Name languageID="{{($company->Language!=NULL)?$company->Language->code:$company->LanguageDefault->code}}">{{$company->Location->Department->Country->name}}</cbc:Name>
                </cac:Country>
            </cac:RegistrationAddress>
            <cac:TaxScheme>
                <cbc:ID>{{($company->Tax!=NULL)?$company->Tax->code:$company->TaxDefault->code}}</cbc:ID>
                <cbc:Name>{{($company->Tax!=NULL)?$company->Tax->name:$company->TaxDefault->name}}</cbc:Name>
            </cac:TaxScheme>
        </cac:PartyTaxScheme>
        <cac:PartyLegalEntity>
            <cbc:RegistrationName>{{$company->name}}</cbc:RegistrationName>
            <cbc:CompanyID schemeAgencyID="195" schemeAgencyName="CO, DIAN (Dirección de Impuestos y Aduanas Nacionales)" schemeID="{{$company->dv}}" schemeName="{{$company->type_document_identification_id['code']}}">{{$company->identification_number}}</cbc:CompanyID>
            <cac:CorporateRegistrationScheme>
                @isset($supplier)
                <cbc:ID>{{$invoice->Resolution->prefix}}</cbc:ID>
                @endisset
                <cbc:Name>{{$company->merchant_registration}}</cbc:Name>
            </cac:CorporateRegistrationScheme>
        </cac:PartyLegalEntity>
        <cac:Contact>
            <cbc:Telephone>{{$company->phone}}</cbc:Telephone>
            <cbc:ElectronicMail>{{$company->email}}</cbc:ElectronicMail>
        </cac:Contact>
    </cac:Party>
</cac:{{$node}}>