@extends('voyager::master')
<style>
      .invoice-box {
        max-width: 800px;
        margin: auto;
        padding: 30px;
        border: 1px solid #eee;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
        font-size: 16px;
        line-height: 24px;
        font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
        color: #555;
      }

      .invoice-box table {
        width: 100%;
        line-height: inherit;
        text-align: left;
      }

      .invoice-box table td {
        padding: 5px;
        vertical-align: top;
      }

      .invoice-box table tr td:nth-child(2) {
        text-align: right;
      }

      .invoice-box table tr.top table td {
        padding-bottom: 20px;
      }

      .invoice-box table tr.top table td.title {
        font-size: 45px;
        line-height: 45px;
        color: #333;
      }

      .invoice-box table tr.information table td {
        padding-bottom: 40px;
      }

      .invoice-box table tr.heading td {
        background: #eee;
        border-bottom: 1px solid #ddd;
        font-weight: bold;
      }

      .invoice-box table tr.details td {
        padding-bottom: 20px;
      }

      .invoice-box table tr.item td {
        border-bottom: 1px solid #eee;
      }

      .invoice-box table tr.item.last td {
        border-bottom: none;
      }

      .invoice-box table tr.total td:nth-child(2) {
        border-top: 2px solid #eee;
        font-weight: bold;
      }

      @media only screen and (max-width: 600px) {
        .invoice-box table tr.top table td {
          width: 100%;
          display: block;
          text-align: center;
        }

        .invoice-box table tr.information table td {
          width: 100%;
          display: block;
          text-align: center;
        }
      }

      /** RTL **/
      .invoice-box.rtl {
        direction: rtl;
        font-family: Tahoma, 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
      }

      .invoice-box.rtl table {
        text-align: right;
      }

      .invoice-box.rtl table tr td:nth-child(2) {
        text-align: left;
      }
    </style>
@section('content')
  <div class="invoice-box">
      <table cellpadding="0" cellspacing="0">
        <tr class="top">
          <td colspan="2">
            <table>
              <tr>
                <td class="title text-center" style="background-color: black;">
                  <img src="{{asset('img/logo.png')}}" style="width: 100%; max-width: 100px; background-color: black;" />
                </td>

                <td>
                  Invoice #: {{$invoice_id}}<br />
                  Created: 
                    @if($get_invoice)
                      {{$get_invoice->created_at->format('d M, Y')}}
                    @else
                      NULL
                    @endif
                  <br />
                  Due: 
                    @if($get_invoice)
                      {{$get_invoice->created_at->format('d M, Y')}}
                    @else
                      NULL
                    @endif
                </td>
              </tr>
            </table>
          </td>
        </tr>

        <tr class="information">
          <td colspan="2">
            <table>
              <tr>
                <td>
                  {{config('app.name')}}<br />
                  12345 Sunny Road<br />
                  Sunnyville, CA 12345
                </td>

                <td>
                  {{-- Acme Corp.<br /> --}}
                  @if($get_invoice)
                    {{$get_invoice->user_name}}
                  @else
                    John Doe
                  @endif
                  <br />
                  no-reply@example.com
                </td>
              </tr>
            </table>
          </td>
        </tr>

        {{-- <tr class="heading">
          <td>Payment Method</td>

          <td>Check #</td>
        </tr>

        <tr class="details">
          <td>Check</td>

          <td>1000</td>
        </tr> --}}

        <tr class="heading">
          <td>Product</td>

          <td>Price</td>

          <td>Quantity</td>

          <td>Total</td>
        </tr>

        @if($invoices->count() > 0)
          @foreach($invoices as $invoice)
          <tr class="item">
            <td>{{getProduct($invoice->product_id)->name}}</td>

            <td>&#8358;{{number_format(getProduct($invoice->product_id)->price)}}</td>

            <td>{{number_format($invoice->product_qty)}}</td>

            <td>&#8358;{{number_format(getProduct($invoice->product_id)->price * $invoice->product_qty)}}</td>
          </tr>
          @endforeach
        @endif

        

        <tr class="total">
          <td></td>

          <td>Total: 
            <?php $nTotal = 0; ?>
            @if($invoices->count() > 0)
            @foreach($invoices as $invoice)
              <?php 
                $nTotal += getProduct($invoice->product_id)->price * $invoice->product_qty;
              ?>
            @endforeach
            @endif
            &#8358; {{number_format($nTotal)}}
          </td>
        </tr>
      </table>
      {{-- <a href="{{ route('voyager.invoices.index') }}" class="btn btn-success">Email Invoice to customer</a>
      <a href="{{ route('voyager.invoices.index') }}" class="btn btn-danger">Cancel the Invoice</a>
      <a href="{{ route('voyager.invoices.index') }}" class="btn btn-info">Generate New Invoice</a> --}}
    </div>
@stop