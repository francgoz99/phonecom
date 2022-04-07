@extends('layouts.app')
@section('head')
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no, minimal-ui"/>
    
    <!-- fonts -->
    <link href="https://fonts.googleapis.com/css?family=Questrial|Raleway:700,900" rel="stylesheet">

    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap.extension.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/swiper.css" rel="stylesheet" type="text/css" />
    <link href="css/sumoselect.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />

    <title>Checkout | {{config('app.name')}}</title>
    {{-- <style>
        .col-mdx-6{
            width:50%;
            position:relative;
            min-height:1px;
            padding-right:15px;
            padding-left:15px;
            /*float:left;*/
        }
    </style> --}}
</head>
@endsection

<?php
  foreach(Cart::instance('default')->content() as $item)
    {
        $product_id[] = $item->model->id;
        $product_qty[] = $item->qty;
    }
?>

@section('main-content')


        <div class="header-empty-space"></div>

        <div class="container">
            <div class="empty-space col-xs-b15 col-sm-b30"></div>
            <div class="breadcrumbs">
                <a href="{{ route('landing-page') }}">home</a>
                <a href="#">checkout</a>
            </div>
            <div class="empty-space col-xs-b15 col-sm-b50 col-md-b100"></div>
            <div class="text-center">
                <div class="simple-article size-3 grey uppercase col-xs-b5">checkout</div>
                <div class="h2">check your info</div>
                <div class="title-underline center"><span></span></div>
            </div>
        </div>

        <div class="empty-space col-xs-b35 col-md-b70"></div>

        <div class="container">
            <div class="row">
            <form action="{{ route('pay') }}" method="POST" >
                @csrf
                <div class="col-md-12 col-xs-b50 col-md-b0" style="float: none;">
                    <h4 class="h4 col-xs-b25">billing details</h4>



                    <div class="row m10">
                        <div class="col-sm-6">
                            <input class="simple-input" type="text" value="{{ auth()->user()->name}}" placeholder="First name" />
                            <div class="empty-space col-xs-b20"></div>
                        </div>
                        <div class="col-sm-6">
                            <input class="simple-input" type="text" value="{{ auth()->user()->lname}}" placeholder="Last name" />
                            <div class="empty-space col-xs-b20"></div>
                        </div>
                    </div>
                    <input class="simple-input" type="email" name="email" value="{{ auth()->user()->email}}" placeholder="Email" />
                    <div class="empty-space col-xs-b20"></div>
                    <input class="simple-input" type="text" name="phone" value="{{ auth()->user()->phone}}" placeholder="Street address" />
                    <div class="empty-space col-xs-b20"></div>
                    <input class="simple-input" type="text" name="address" value="{{ auth()->user()->address}}" placeholder="Street address" />
                    <div class="empty-space col-xs-b20"></div>

                    <div class="form-group">
                        <label>Delivery Address (Leave blank if you want to use your profile delivery address.)</label>
                        <input type="text" name="altaddress" class="simple-input" placeholder="Delivery Address" id="altaddress">
                        <small id="addr2Help" class="form-text text-muted">* Leave blank if you want delivery at your profile address </small>
                    </div>
                    <div class="empty-space col-xs-b20"></div>                    
                    
                    <label class="checkbox-entry">
                        <input type="checkbox" checked><span>Privacy policy agreement</span>
                    </label>
                    <div class="empty-space col-xs-b50"></div>

                    <input type="hidden" name="email" value="{{auth()->user()->email}}"> {{-- required --}}
                    {{-- <input type="hidden" name="orderID" value="555555555555"> --}}
                    <input type="hidden"  name="amount" value="{{$newTotal}}00"> {{-- required in kobo --}}
                    <input type="hidden" name="quantity" value="1">
                    <input type="hidden" id="metadata" name="metadata" value="{{ json_encode($array = ['name' => auth()->user()->name,'address' => auth()->user()->address, 'phone' => auth()->user()->phone, 'delivery_fee' => $delivery_sum, 'user_id' => auth()->user()->id, 'newSubtotal' => $newSubtotal, 'discount' => $discount, 'discount_code' => $discount_code, 'product_id' => $product_id, 'product_qty' => $product_qty, 'altaddress' =>  '', ]) }}" > {{-- For other necessary things you want to add to your payload. it is optional though --}}
                    <input type="hidden" name="reference" value="{{ Paystack::genTranxRef() }}"> {{-- required --}}
                    <input type="hidden" name="key" value="{{ config('paystack.secretKey') }}"> {{-- required --}}
                    {{ csrf_field() }} {{-- works only when using laravel 5.1, 5.2 --}}

                    
                    {{-- <textarea class="simple-input" placeholder="Note about your order"></textarea> --}}
                </div>
            
                <div class="col-md-12">
                    <h4 class="h4 col-xs-b25">your order</h4>
                    @if(Cart::content()->count() > 0)
                    @foreach(Cart::content() as $item)
                    <div class="cart-entry clearfix">
                        <a class="cart-entry-thumbnail" href="#"><img src="{{productImage($item->model->image)}}" alt="{{ $item->model->name}}" style="width: 100px;"></a>
                        <div class="cart-entry-description">
                            <table>
                                <tbody>
                                    <tr>
                                        <td>
                                            <div class="h6"><a href="#">{{ $item->model->name}}</a></div>
                                            <div class="simple-article size-1">QUANTITY: {{$item->qty}}</div>
                                        </td>
                                        <td>
                                            <div class="simple-article size-3 grey">&#8358;{{ number_format(totalcash($item->model->price))}}</div>
                                            {{-- <div class="simple-article size-1">TOTAL: $310.00</div> --}}
                                        </td>
                                        <td>
                                            <div class="cart-color" style="background: #eee;"></div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    @endforeach
                    @endif
                    
                    
                    <div class="order-details-entry simple-article size-3 grey uppercase">
                        <div class="row">
                            <div class="col-xs-6">
                                cart subtotal
                            </div>
                            <div class="col-xs-6 col-xs-text-right">
                                <div class="color">&#8358;{{ number_format(Cart::subtotal()) }}</div>
                            </div>
                        </div>
                    </div>
                    @if(session()->has('coupon'))
                    <div class="order-details-entry simple-article size-3 grey uppercase">
                        <div class="row">
                            <div class="col-xs-6">
                                Discount({{ session()->get('coupon')['name'] }})
                            </div>
                            <div class="col-xs-6 col-xs-text-right">
                                <div class="color">- &#8358;{{ number_format($discount) }}</div>
                            </div>
                        </div>
                    </div>
                    <div class="order-details-entry simple-article size-3 grey uppercase">
                        <div class="row">
                            <div class="col-xs-6">
                                New SubTotal
                            </div>
                            <div class="col-xs-6 col-xs-text-right">
                                <div class="color">&#8358;{{ number_format($newSubtotal) }}</div>
                            </div>
                        </div>
                    </div>
                    @endif
                    <div class="order-details-entry simple-article size-3 grey uppercase">
                        <div class="row">
                            <div class="col-xs-6">
                                shipping and handling
                            </div>
                            <div class="col-xs-6 col-xs-text-right">
                                <div class="color">&#8358;{{number_format($delivery_sum)}}</div>
                            </div>
                        </div>
                    </div>
                    <div class="order-details-entry simple-article size-3 grey uppercase">
                        <div class="row">
                            <div class="col-xs-6">
                                order total
                            </div>
                            <div class="col-xs-6 col-xs-text-right">
                                <div class="color">&#8358;{{number_format($newTotal)}}</div>
                            </div>
                        </div>
                    </div>
                    <div class="empty-space col-xs-b50"></div>
                    
                    <div class="row">
                        <div class="col-md-6">
                            <div class="button block size-2 style-3">
                                <span class="button-wrapper">
                                    <span class="icon"><img src="img/icon-4.png" alt=""></span>
                                    <span class="text">Pay using Paystack</span>
                                </span>
                                <input type="submit"/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="button block size-2 style-2">
                                <span class="button-wrapper" style="padding-top: 15px; padding-bottom: 15px;">
                                    <span class="icon"><img src="img/icon-4.png" alt=""></span>
                                    <a href='tel:+2347031382795'><i class="fa fa-phone fa-lg"></i> Call To Order</a>
                                </span>
                            </div>
                            
                        </div>
                        
                    </div>
                    
                    
                    
                    
                </div>
            </form>
            <form action="{{ route('pay.on.delivery') }}" method="POST">
                @csrf
                <input type="hidden" name="altaddress" id="podaltaddress" value="">
                <input type="hidden" name="delivery_fee" value="{{$delivery_sum}}">
                <input type="hidden" name="billing_discount" value="{{$discount}}">
                <input type="hidden" name="billing_discount_code" value="{{$discount_code}}">
                <input type="hidden" name="billing_subtotal" value="{{$newSubtotal}}">
                <input type="hidden" name="billing_total" value="{{$newSubtotal + $delivery_sum}}">
                {{-- <input type="hidden" name="productId" value="{{$product_id}}">
                <input type="hidden" name="productQty" value="{{$product_qty}}"> --}}

                <div class="row">
                    <div class="col-md-6">
                        <div class="button block size-2 style-2">
                            <span class="button-wrapper" style="margin: 15px;">
                                <span class="icon"><img src="img/icon-4.png" alt=""></span>
                                <span class="text">Pay On Delivery</span>
                            </span>
                            <input type="submit" onclick="podalty();" />
                        </div>
                        
                    </div>
                    
                </div>
            </form>
            {{-- <form action="{{ route('processTransaction', $newSubtotal + $delivery_sum) }}" method="POST">
                @csrf
                <div class="col-md-12">
                    <div class="button block size-2 style-3">
                        <span class="button-wrapper">
                            <span class="icon"><img src="img/icon-4.png" alt=""></span>
                            <span class="text">Pay Using Paypal</span>
                        </span>
                        <input type="submit"/>
                    </div>
                </div>
            </form> --}}
            <div class="col-md-12">
                <div class="button block size-2 style-3">
                    <span class="button-wrapper">
                        <span class="icon"><img src="img/icon-4.png" alt=""></span>
                        <span class="text">Pay Using Paypal</span>
                    </span>
                    <input type="submit"/>
                </div>
            </div>
            
            </div>
        </div>

        <div class="empty-space col-xs-b35 col-md-b70"></div>
@endsection
@section('script')
    <script>
      function podalty() 
        {
          var altaddress = document.getElementById('altaddress').value;
          document.getElementById('podaltaddress').value = altaddress;
        }
    </script>
    <script>
      function alty() 
        {
          var altaddress = document.getElementById('altaddress').value;
          var metadata = document.getElementById('metadata').value;
          var position = -2;
          var output = [metadata.slice(0, position), altaddress, metadata.slice(position)].join('');
          document.getElementById('metadata').value = output;
          //window.alert(output);
          //document.getElementById('demoalt').innerHTML = altaddress;
          //document.getElementById('demoamount').value = altaddress;
        }
    </script>

    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/swiper.jquery.min.js"></script>
    <script src="js/global.js"></script>

    <!-- styled select -->
    <script src="js/jquery.sumoselect.min.js"></script>

    <!-- counter -->
    <script src="js/jquery.classycountdown.js"></script>
    <script src="js/jquery.knob.js"></script>
    <script src="js/jquery.throttle.js"></script>

    <!-- masonry -->
    <script src="js/isotope.pkgd.min.js"></script>
    <script>
        $(window).load(function(){
            var $container = $('.grid').isotope({
                itemSelector: '.grid-item',
                masonry: {
                    columnWidth: '.grid-sizer'
                }
            });
        });
    </script>
@endsection
