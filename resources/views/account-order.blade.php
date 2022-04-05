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

  	<title>My Order(s) | {{config('app.name')}}</title>
</head>
@endsection
@section('main-content')

        <div class="header-empty-space"></div>

        <div class="container">
            <div class="empty-space col-xs-b20"></div>

            <h4>My Order(s)</h4>
                @include('inc.messages')

              <div class="card user-card">
                <div class="card-body">
                  <div class="media">
                    @include('inc.account')
                  <hr>
                  <div class="table-responsive">
                    <table class="table table-hover">
                      <thead class="thead-light">
                        <tr>
                          <th>S/N</th>
                          <th scope="col">Order ID</th>
                          <th scope="col">Items</th>
                          <th scope="col">Date</th>
                          <th scope="col">Price</th>
                          <th scope="col">Status</th>
                          <th scope="col">Delivered</th>
                        </tr>
                      </thead>
                      <tbody>

                        @if($orders->count() > 0)
                          <?php $i = 0;?>
                          @foreach($orders as $order)
                          <?php $i++;?>
                          <tr>
                            <td>{{$i}}</td>
                            <th scope="row"><a href="{{ route('orders.show', $order->id) }}" class="text-info">ZS{{$order->id}}</a></th>
                            <td>
                                @foreach($order->products as $product) 
                                   {{$product->name}} - <img style="width: 30px; height: 40px;" src="{{ productImage($product->image) }}"><br>
                                @endforeach   
                             </td>
                            <td>{{$order->created_at}}</td>
                            <td>&#8358;{{ number_format( $order->billing_total)}}</td>
                            <td>{{$order->status}}</td>
                            <td>
                                {!!$order->shipped == 0 ? '<span class="badge badge-primary">In Progress</span>' : '<span class="badge badge-success">Delivered</span>' !!}
                            </td>
                          </tr>
                          @endforeach

                          @else
                            <p>No Order.</p>
                        @endif
                        
                      </tbody>
                    </table>
                  </div>
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
