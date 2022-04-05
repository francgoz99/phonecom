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

    <title>My Cart | {{config('app.name')}}</title>
</head>
@endsection

@section('main-content')

        <div class="header-empty-space"></div>

        <div class="container">
            <div class="empty-space col-xs-b15 col-sm-b30"></div>
            <div class="breadcrumbs">
                <a href="{{ route('landing-page') }}">home</a>
                <a href="#">shopping cart</a>
            </div>
            <div class="empty-space col-xs-b15 col-sm-b50 col-md-b100"></div>
            <div class="text-center">
                {{-- <div class="simple-article size-3 grey uppercase col-xs-b5">shopping cart</div> --}}
                <div class="h2">
                    @if(Cart::count() > 0)
                        You have {{Cart::count()}} item(s) in your cart
                    @else
                        Cart page
                    @endif
                </div>
                <div class="title-underline center"><span></span></div>
            </div>
        </div>

        {{-- <div class="empty-space col-xs-b35 col-md-b70"></div> --}}

        <div class="container">
            @include('inc.messages')
            <table class="cart-table">
                <thead>
                    <tr>
                        <th style="width: 95px;"></th>
                        <th>product name</th>
                        <th style="width: 150px;">price</th>
                        <th style="width: 260px;">quantity</th>
                        <th style="width: 150px;">Sub total</th>
                        <th style="width: 70px;"></th>
                    </tr>
                </thead>
                <tbody>
                    @if(Cart::count() > 0)
                    @foreach(Cart::content() as $item)
                    <tr>
                        <td data-title=" ">
                            <a class="cart-entry-thumbnail" href="#"><img src="{{ productImage($item->model->image) }}" style="width: 100%;" alt="{{ $item->model->name}}"></a>
                        </td>
                        <td data-title=" "><h6 class="h6"><a href="#">{{ $item->model->name}}</a></h6></td>
                        <td data-title="Price: ">&#8358;{{ number_format( totalcash($item->model->price) )}}</td>
                        <td data-title="Quantity: ">
                            <select class="quantity form-control" data-id="{{ $item->rowId }}" data-productQuantity="{{$item->model->quantity}}">
                                @for($i = 1; $i < 5 + 1; $i++)
                                    <option {{ $item->qty == $i ? 'selected' : '' }} >{{$i}}</option>
                                @endfor
                            </select>
                            {{-- <div class="quantity-select">
                                <span class="minus"></span>
                                <span class="number">2</span>
                                <span class="plus"></span>
                            </div> --}}
                        </td>
                        <td data-title="Total:">&#8358;{{ number_format( $item->subtotal)}}</td>
                        <td data-title="">
                            
                            <form action="{{ route('cart.destroy', $item->rowId) }}" method="POST">
                                  {{ csrf_field() }}
                                  {{ method_field('DELETE') }}
                                  <button type="submit" ><div class="button-close"></div></button>
                              </form>
                              <form action="{{ route('cart.wishlist', $item->rowId) }}" method="POST">
                                  {{ csrf_field() }}
                                  <button type="submit"><i class="fa fa-heart"></i></button>
                              </form>
                        </td>
                    </tr>
                    @endforeach
                    @endif
                    
                    
                </tbody>
            </table>
            <div class="empty-space col-xs-b35"></div>
            <div class="row">
                <div class="col-sm-6 col-md-5 col-xs-b10 col-sm-b0">
                    <div class="single-line-form">
                        @if(! session()->has('coupon'))
                        <form action="{{ route('coupon.store') }}"  method="POST">
                            @csrf
                            <input name="coupon_code" class="simple-input" type="text" value="" placeholder="Enter your coupon code" />
                            <div class="button size-2 style-3">
                                <span class="button-wrapper">
                                    <span class="icon"><img src="img/icon-4.png" alt=""></span>
                                    <span class="text">submit</span>
                                </span>
                                <input type="submit" value="">
                            </div>
                        </form>
                        @else
                        <form action="{{ route('coupon.destroy') }}"  method="POST">
                            @csrf
                            {{ method_field('delete') }}
                            <div class="button size-2 style-3">
                                <span class="button-wrapper">
                                    <span class="icon"><img src="img/icon-4.png" alt=""></span>
                                    <span class="text">Remove Coupon</span>
                                </span>
                                <input type="submit" value="">
                            </div>
                        </form>
                        @endif
                        
                    </div>
                </div>
                <div class="col-sm-6 col-md-7 col-sm-text-right">
                    <div class="buttons-wrapper">
                        <a class="button size-2 style-2" href="{{ route('shop.index') }}">
                            <span class="button-wrapper">
                                <span class="icon"><img src="img/icon-2.png" alt=""></span>
                                <span class="text">Continue shopping</span>
                            </span>
                        </a>
                        <a class="button size-2 style-3" href="{{ route('checkout.index') }}">
                            <span class="button-wrapper">
                                <span class="icon"><img src="img/icon-4.png" alt=""></span>
                                <span class="text">proceed to checkout</span>
                            </span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="empty-space col-xs-b35 col-md-b70"></div>
            <div class="row">
                
                <div class="col-md-12">
                    <h4 class="h4">cart totals</h4>
                    <div class="order-details-entry simple-article size-3 grey uppercase">
                        <div class="row">
                            <div class="col-xs-6">
                                cart subtotal
                            </div>
                            <div class="col-xs-6 col-xs-text-right">
                                <div class="color">&#8358;{{number_format($newTotal)}}</div>
                            </div>
                        </div>
                    </div>
                    
                    
                </div>
            </div>
            <div class="empty-space col-xs-b35 col-md-b70"></div>
            <div class="empty-space col-xs-b35 col-md-b70"></div>
        </div>
@endsection
  @section('script')
    <script src="js/app.js"></script>
     <script >

        (function(){
          const classname = document.querySelectorAll('.quantity')

          Array.from(classname).forEach(function(element){
              element.addEventListener('change', function(){
                  const id = element.getAttribute('data-id')
                  const productQuantity = element.getAttribute('data-productQuantity')
                  
                    axios.patch(`/cart/${id}`, {
                    quantity: this.value,
                    productQuantity: productQuantity
                  })
                  .then(function (response) {
                    //console.log(response);
                    window.location.href = '{{ route('cart.index') }}'
                  })
                  .catch(function (error) {
                    //console.log(error);
                    window.location.href = '{{ route('cart.index') }}'
                  });
              })
          })

        })();
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
