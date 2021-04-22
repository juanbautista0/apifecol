<cac:PaymentTerms>
    <cbc:ReferenceEventCode>{{($invoice->PaymentForm!=NULL)?$invoice->PaymentForm->code:$invoice->PaymentFormDefault->code}}</cbc:ReferenceEventCode>
    @if (($invoice->PaymentForm!=NULL)?$invoice->PaymentForm->code:$invoice->PaymentFormDefault->code == '2')
        <cac:SettlementPeriod>
            <cbc:DurationMeasure unitCode="{{($invoice->PaymentDuration!=NULL)?$invoice->PaymentDuration->code:$invoice->PaymentDurationDefault->code}}">{{($invoice->PaymentDuration!=NULL)?$invoice->PaymentDuration->name:$invoice->PaymentDurationDefault->name}}</cbc:DurationMeasure>
        </cac:SettlementPeriod>
    @endif
</cac:PaymentTerms>
