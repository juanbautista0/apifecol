<cac:PaymentMeans>
    <cbc:ID>{{($invoice->PaymentForm!=NULL)?$invoice->PaymentForm->code: $invoice->PaymentFormDefault->code}}</cbc:ID>
    <cbc:PaymentMeansCode>{{($invoice->PaymentMethod!=NULL)?$invoice->PaymentMethod->code:$invoice->PaymentMethodDefault->code}}</cbc:PaymentMeansCode>
    @if (($invoice->PaymentForm!=NULL)?$invoice->PaymentForm->code: $invoice->PaymentFormDefault->code == '2')
        <cbc:PaymentDueDate>{{(isset($invoice->due_date) && !empty($invoice->due_date))?$invoice->due_date:date("Y-m-d")}}</cbc:PaymentDueDate>
    @endif
    <cbc:PaymentID>{{($invoice->PaymentForm!=NULL)?$invoice->PaymentForm->code: $invoice->PaymentFormDefault->code}}</cbc:PaymentID>
</cac:PaymentMeans>
@if($invoice->Resolution->prefix != "NC" && $invoice->Resolution->prefix != "ND")
{{--
    @if($invoice->AdvancePayment != NULL && $invoice->AdvancePayment->sum('total') < $invoice->total && $invoice->advance_payment_count > 0)
        <cac:PrepaidPayment>
            <cbc:ID>{{$invoice->AdvancePayment->last()->number}}</cbc:ID>
            <cbc:PaidAmount currencyID="{{$invoice->customer['type_currency_id']['code']}}">{{number_format($invoice->AdvancePayment->sum('total'), 2, '.', '')}}</cbc:PaidAmount>
            <cbc:ReceivedDate>{{$invoice->AdvancePayment()->get()->last()->pay_date}}</cbc:ReceivedDate>
            <cbc:PaidDate>{{$invoice->AdvancePayment()->get()->last()->pay_date}}</cbc:PaidDate>
            @if($invoice->AdvancePayment()->get()->last()->comments != NULL)
            <cbc:InstructionID>{{$invoice->AdvancePayment()->get()->last()->comments}}</cbc:InstructionID>
            @endif
        </cac:PrepaidPayment>
    @endif
--}}
@endif