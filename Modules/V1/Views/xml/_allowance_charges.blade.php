@foreach ($lines as $key => $line)
@foreach($line->allowance_charges as $key1 => $value)
<cac:AllowanceCharge>
    <cbc:ID>{{(intval($key1) + 1)}}</cbc:ID>
    <cbc:ChargeIndicator>{{$value->charge_indicator}}</cbc:ChargeIndicator>
    @if (($value->charge_indicator === 'false') && ($value->discount))
    <cbc:AllowanceChargeReasonCode>{{$value->discount->code}}</cbc:AllowanceChargeReasonCode>
    @endif
    <cbc:AllowanceChargeReason>{{$value->allowance_charge_reason}}</cbc:AllowanceChargeReason>
    <cbc:MultiplierFactorNumeric>{{$value->multiplier_factor_numeric}}</cbc:MultiplierFactorNumeric>
    <cbc:Amount currencyID="{{($invoice->TypeCurrency != NULL)?$invoice->TypeCurrency->code:$invoice->TypeCurrencyDefault->code}}">{{number_format($value->amount, 2, '.', '')}}</cbc:Amount>
    @if ($value->base_amount)
    <cbc:BaseAmount currencyID="{{($invoice->TypeCurrency != NULL)?$invoice->TypeCurrency->code:$invoice->TypeCurrencyDefault->code}}">{{number_format($value->base_amount, 2, '.', '')}}</cbc:BaseAmount>
    @endif
</cac:AllowanceCharge>
@endforeach
@endforeach