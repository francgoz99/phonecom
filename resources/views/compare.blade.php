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

  	<title>Compare | {{config('app.name')}}</title>
</head>
@endsection
@section('main-content')

        <div class="header-empty-space"></div>

        <div class="container">
            <div class="empty-space col-xs-b20"></div>

            <h4>Compare</h4>
                @if(Cart::instance('compare')->count() > 0)
                      <div class="table-responsive">
                        <table class="table table-bordered text-center table-wishlist">
                          <thead>
                            <tr>
                              
                              @foreach(Cart::instance('compare')->content() as $item)
                              <th>
                                <p><a href="{{ route('shop.show', $item->model->slug) }}"><img src="{{ productImage($item->model->image) }}" width="75" height="75" alt="{{ $item->model->name}} - {!! str_limit($item->model->details, 30) !!}"></a></p>
                                <p><a href="{{ route('shop.show', $item->model->slug) }}" class="text-body">{{ $item->model->name}} - {!! str_limit($item->model->details, 30) !!}</a></p>
                                <div class="btn-group btn-group-sm" role="group">
                                  <form action="{{ route('compare.switchToCart', $item->rowId) }}" method="POST">
                                      {{ csrf_field() }}
                                  <button type="submit" class="btn btn-outline-info">Add to cart</button>
                                  </form>
                                </div>
                              </th>
                              @endforeach              
                              
                              
                            </tr>
                          </thead>
                          <tbody>
                            <tr>

                            @foreach(Cart::instance('compare')->content() as $item)
                              <td>
                                <strong>Price:</strong>
                                <div>&#8358;{{ number_format( totalcash($item->model->price, $item->model->profit) )}}</div>
                              </td>      
                            @endforeach  
                              
                            </tr>
                            {{--<tr>
                              <td>
                                <strong>Model:</strong>
                                <div>Model 1</div>
                              </td>
                              <td>
                                <strong>Model:</strong>
                                <div>Model 2</div>
                              </td>
                              <td>
                                <strong>Model:</strong>
                                <div>Model 3</div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <strong>Brand:</strong>
                                <div>Brand 1</div>
                              </td>
                              <td>
                                <strong>Brand:</strong>
                                <div>Brand 2</div>
                              </td>
                              <td>
                                <strong>Brand:</strong>
                                <div>Brand 3</div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <strong>Availability:</strong>
                                <div>Availabel 1</div>
                              </td>
                              <td>
                                <strong>Availability:</strong>
                                <div>Availabel 2</div>
                              </td>
                              <td>
                                <strong>Availability:</strong>
                                <div>Availabel 3</div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <strong>Rating:</strong>
                                <div><div class="rating" data-value="2"></div></div>
                                <a href="#" class="text-muted small">(2 reviews)</a>
                              </td>
                              <td>
                                <strong>Rating:</strong>
                                <div><div class="rating" data-value="3"></div></div>
                                <a href="#" class="text-muted small">(3 reviews)</a>
                              </td>
                              <td>
                                <strong>Rating:</strong>
                                <div><div class="rating" data-value="4"></div></div>
                                <a href="#" class="text-muted small">(4 reviews)</a>
                              </td>
                            </tr>--}}
                            <tr>
                              @foreach(Cart::instance('compare')->content() as $item)
                              <td>                    
                                <div class="btn-group btn-group-sm" role="group">
                                   <form action="{{ route('compare.destroy', $item->rowId) }}" method="POST">
                                      {{ csrf_field() }}
                                      {{ method_field('DELETE') }}
                                  <button type="submit" class="btn btn-outline-info">Remove</button>
                                  </form>
                                </div>
                              </td>
                              @endforeach                  
                            </tr>
                          </tbody>
                        </table>
                      </div>
            @endif
            
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
