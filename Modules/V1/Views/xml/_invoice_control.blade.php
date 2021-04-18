<sts:InvoiceControl>
    <sts:InvoiceAuthorization>{{$$invoice->Resolution->resolution}}</sts:InvoiceAuthorization>
    <sts:AuthorizationPeriod>
        <cbc:StartDate>{{$invoice->Resolution->date_from}}</cbc:StartDate>
        <cbc:EndDate>{{$invoice->Resolution->date_to}}</cbc:EndDate>
    </sts:AuthorizationPeriod>
    <sts:AuthorizedInvoices>
        @if ($invoice->Resolution->prefix)
            <sts:Prefix>{{$invoice->Resolution->prefix}}</sts:Prefix>
        @endif
        <sts:From>{{$invoice->Resolution->from}}</sts:From>
        <sts:To>{{$invoice->Resolution->to}}</sts:To>
    </sts:AuthorizedInvoices>
</sts:InvoiceControl>