@extends('layouts.app')
@section('head')
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no, minimal-ui"/>
    
    <!-- fonts -->
    <link href="https://fonts.googleapis.com/css?family=Questrial|Raleway:700,900" rel="stylesheet">

    <link href="{{asset('')}}css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="{{asset('')}}css/bootstrap.extension.css" rel="stylesheet" type="text/css" />
    <link href="{{asset('')}}css/style.css" rel="stylesheet" type="text/css" />
    <link href="{{asset('')}}css/swiper.css" rel="stylesheet" type="text/css" />
    <link href="{{asset('')}}css/sumoselect.css" rel="stylesheet" type="text/css" />
    <link href="{{asset('')}}css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="{{ asset('css/starability-minified/starability-all.min.css') }}"/>

  	<title>Rate your Order | {{config('app.name')}}</title>
</head>
@endsection
@section('main-content')

        <div class="header-empty-space"></div>

        <div class="container">
            <div class="empty-space col-xs-b20"></div>

            @include('inc.messages')
            <h4>We would love your ratings and review for {{getProduct($rating->product_id)->name}}</h4>

              <div class="text-center py-5 my-5">
                <div class="row">
                  <div class="col-md-8">
                    <form action="{{ route('review.store') }}" method="POST" class="form-group">
                      @csrf
                      {{-- @captcha --}}

                      <fieldset class="starability-basic">
                        <legend>Your rating:</legend>
                        <input type="radio" id="no-rate" class="input-no-rate" name="rating" value="0" checked aria-label="No rating." />

                        <input type="radio" id="rate1" name="rating" value="1" />
                        <label for="rate1">1 star.</label>

                        <input type="radio" id="rate2" name="rating" value="2" />
                        <label for="rate2">2 stars.</label>

                        <input type="radio" id="rate3" name="rating" value="3" />
                        <label for="rate3">3 stars.</label>

                        <input type="radio" id="rate4" name="rating" value="4" />
                        <label for="rate4">4 stars.</label>

                        <input type="radio" id="rate5" name="rating" value="5" />
                        <label for="rate5">5 stars.</label>

                        <span class="starability-focus-ring"></span>
                      </fieldset><br>

                      <textarea class="form-control" name="review" placeholder="Review..."></textarea><br>
                      <input type="hidden" name="Thetoken" value="{{$rating->token}}">
                      <button class="btn btn-info" type="submit">Submit</button>

                  </form>
                  </div>
                </div>
                
              </div>
            
            <div class="empty-space col-xs-b20"></div>
        </div>
        
@endsection
@section('script')
    <script src="{{asset('')}}js/jquery-2.2.4.min.js"></script>
    <script src="{{asset('')}}js/swiper.jquery.min.js"></script>
    <script src="{{asset('')}}js/global.js"></script>

    <!-- styled select -->
    <script src="{{asset('')}}js/jquery.sumoselect.min.js"></script>

    <!-- counter -->
    <script src="{{asset('')}}js/jquery.classycountdown.js"></script>
    <script src="{{asset('')}}js/jquery.knob.js"></script>
    <script src="{{asset('')}}js/jquery.throttle.js"></script>
@endsection
