<?php
  use App\Category;
  $categories = Category::all();
?>
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

  	<title>Login | {{config('app.name')}}</title>
</head>
@endsection
@section('main-content')

        <div class="header-empty-space"></div>

        <div class="container">
            <div class="empty-space col-xs-b20"></div>

            <div class="popup-container size-2">
                <div class="popup-align">
                    <h3 class="h3 text-center">Log in</h3>
                    <form method="POST" action="{{ route('login') }}" >
                        @csrf

                        <div class="empty-space col-xs-b30"></div>
                        <input class="simple-input" type="email" name="email" id="email" placeholder="Email*" value="{{ old('email') }}" required />
                            @if ($errors->has('email'))
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $errors->first('email') }}</strong>
                                </span>
                            @endif

                        <div class="empty-space col-xs-b10 col-sm-b20"></div>
                        <input class="simple-input" type="password" name="password" id="password_in" required placeholder="Password*" />
                        @if ($errors->has('password'))
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $errors->first('password') }}</strong>
                            </span>
                        @endif
                        <div class="empty-space col-xs-b10 col-sm-b20"></div>

                        <div class="row">
                            <div class="col-sm-6 col-xs-b10 col-sm-b0">
                                <div class="empty-space col-sm-b5"></div>
                                <input type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}>
                                <div class="empty-space col-sm-b5"></div>
                                <a href="{{ route('password.request') }}" class="simple-link">Forgot password?</a>
                                <div class="empty-space col-xs-b5"></div>
                                <a class="simple-link" href="/register">register now</a>
                            </div>
                            <div class="col-sm-6 text-right">
                                <button class="button size-2 style-3">
                                    <span class="button-wrapper">
                                        <span class="icon"><img src="img/icon-4.png" alt="" /></span>
                                        <span class="text">Login</span>
                                    </span>
                                </button>  
                            </div>
                        </div>
                    </form>
                    {{-- <div class="popup-or">
                        <span>or</span>
                    </div>
                    <div class="row m5">
                        <div class="col-sm-4 col-xs-b10 col-sm-b0">
                            <a class="button facebook-button size-2 style-4 block" href="#">
                                <span class="button-wrapper">
                                    <span class="icon"><img src="img/icon-4.png" alt="" /></span>
                                    <span class="text">facebook</span>
                                </span>
                            </a>
                        </div>
                        <div class="col-sm-4 col-xs-b10 col-sm-b0">
                            <a class="button twitter-button size-2 style-4 block" href="#">
                                <span class="button-wrapper">
                                    <span class="icon"><img src="img/icon-4.png" alt="" /></span>
                                    <span class="text">twitter</span>
                                </span>
                            </a>
                        </div>
                        <div class="col-sm-4">
                            <a class="button google-button size-2 style-4 block" href="#">
                                <span class="button-wrapper">
                                    <span class="icon"><img src="img/icon-4.png" alt="" /></span>
                                    <span class="text">google+</span>
                                </span>
                            </a>
                        </div>
                    </div> --}}
                </div>
                <div class="button-close"></div>
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
