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

  	<title>Wishlist | {{config('app.name')}}</title>
</head>
@endsection
@section('main-content')

        <div class="header-empty-space"></div>

        <div class="container">
            <div class="empty-space col-xs-b20"></div>

            <h4>Wishlist</h4>
                 @include('inc.messages')

              <div class="card user-card">
                <div class="card-body">
                  <div class="media">
                    @include('inc.account')
                  <hr>
                  @if(Cart::instance('wishlist')->count())
                  <table class="table table-cart">
                    <tbody>
                      
                      @foreach(Cart::instance('wishlist')->content() as $item)
                      <tr>
                        <td>                      
                          {{--<form action="{{ route('wishlist.destroy', $item->rowId) }}" method="POST">
                              {{ csrf_field() }}
                              {{ method_field('DELETE') }}
                              <button type="submit" class="btn btn-sm btn-outline-warning rounded-circle" title="Remove"><i class="fa fa-close"></i></button>
                          </form>--}}
                        </td>
                        <td>
                          <a href="{{ route('shop.show', $item->model->slug) }}"><img src="{{ productImage($item->model->image) }}" width="50" height="50" alt="{{ $item->model->name}} - {!! $item->model->details!!}"></a>         
                          <form action="{{ route('wishlist.destroy', $item->rowId) }}" method="POST">
                              {{ csrf_field() }}
                              {{ method_field('DELETE') }}
                              <button type="submit" class="btn btn-sm btn-outline-warning rounded">Remove</button>
                          </form>
                        </td>
                        <td>
                          <h6><a href="{{ route('shop.show', $item->model->slug) }}" class="text-body">{{ $item->model->name}} - {!! $item->model->details!!}</a></h6>
                          <h6 class="text-muted">&#8358;{{ number_format( totalcash($item->model->price, $item->model->profit) )}}</h6>
                          
                            {!!getStockLevel($item->model->quantity)!!}
                          
                        </td>
                        <td>
                          <form action="{{ route('wishlist.switchToCart', $item->rowId) }}" method="POST">
                              {{ csrf_field() }}
                            <button type="submit" class="btn btn-info btn-sm">Move to cart</button>
                          </form>
                        </td>
                      </tr>
                      @endforeach

                      
                      {{--<tr>
                        <td colspan="4">
                          <button class="btn btn-outline-secondary">CLEAR ALL</button>
                        </td>
                      </tr>--}}
                    </tbody>
                  </table>
                  @endif
                </div>
              </div>
          </div>
            
            <div class="empty-space col-xs-b20"></div>
        </div>
        
@endsection
@section('script')
    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/swiper.jquery.min.js"></script>
    <script src="js/global.js"></script>

    <!-- styled select -->
    <script src="js/jquery.sumoselect.min.js"></script>

    <!-- counter -->
    <script src="js/jquery.classycountdown.js"></script>
    <script src="js/jquery.knob.js"></script>
    <script src="js/jquery.throttle.js"></script>
@endsection
