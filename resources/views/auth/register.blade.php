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

  	<title>Register | {{config('app.name')}}</title>
</head>
@endsection
@section('main-content')

        <div class="header-empty-space"></div>

        <div class="container">
            <div class="empty-space col-xs-b20"></div>

            <div class="popup-container size-2">
                <div class="popup-align">
                    <h3 class="h3 text-center">register</h3>
                    <form method="POST" action="{{ route('register') }}">
                        @csrf
                      {{-- @captcha
                        @if(count($errors) > 0)
                            @foreach($errors->all() as $error)
                                {{ $error }}
                            @endforeach
                        @endif --}}
                        <div class="empty-space col-xs-b30"></div>
                        <input class="simple-input" type="text" name="name" value="{{ old('name') }}" required placeholder="First Name*">
                        @if ($errors->has('name'))
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $errors->first('name') }}</strong>
                            </span>
                        @endif

                        <div class="empty-space col-xs-b30"></div>
                        <input class="simple-input" type="text" name="lname" value="{{ old('lname') }}" required placeholder="Last Name*">
                        @if ($errors->has('lname'))
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $errors->first('lname') }}</strong>
                            </span>
                        @endif

                        <div class="empty-space col-xs-b10 col-sm-b20"></div>
                        <input class="simple-input" type="email" name="email" value="{{ old('email') }}" required placeholder="Email address*">
                        @if ($errors->has('email'))
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $errors->first('email') }}</strong>
                            </span>
                        @endif

                        <div class="empty-space col-xs-b30"></div>
                        <input class="simple-input" type="text" name="phone" value="{{ old('phone') }}" required placeholder="Phone Number*">
                        @if ($errors->has('phone'))
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $errors->first('phone') }}</strong>
                            </span>
                        @endif

                        <div class="empty-space col-xs-b30"></div>
                        <input class="simple-input" type="text" name="address" value="{{ old('address') }}" required placeholder="Address*">
                        @if ($errors->has('address'))
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $errors->first('address') }}</strong>
                            </span>
                        @endif

                        <div class="empty-space col-xs-b30"></div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <select class="form-control dynamic" name="state" id="ng_state_id" data-dependent="lga" required="">
                                        <option>Select State</option>
                                        @foreach($states as $state)
                                            <option value="{{$state->name}}">{{$state->name}}</option>
                                        @endforeach
                                    </select>
                                    
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <select id="lga" name="lga" class="form-control" required="">
                                        <option >Select Local Government</option>
                                    </select>
                                    
                                </div>
                                {{-- {{ csrf_field() }} --}}
                            </div>
                        </div>

                        <div class="empty-space col-xs-b10 col-sm-b20"></div>
                        <input class="simple-input" type="password" name="password" required placeholder="Password*">
                        @if ($errors->has('password'))
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $errors->first('password') }}</strong>
                            </span>
                        @endif

                        <div class="empty-space col-xs-b10 col-sm-b20"></div>
                        <input name="password_confirmation" class="simple-input" type="password" value="" placeholder="Confirm password" />

                        <input type="hidden" name="referrer" value="{{session()->get('refId') ? session()->get('refId') : 'NoRef' }}">

                        <div class="empty-space col-xs-b10 col-sm-b20"></div>
                        <div class="row">
                            <div class="col-sm-7 col-xs-b10 col-sm-b0">
                                <div class="empty-space col-sm-b15"></div>
                                <label class="checkbox-entry">
                                    <input type="checkbox" /><span><a href="#">Privacy policy agreement</a></span>
                                </label>
                                <p>Already registered? click <a href="/login">Here</a> to Login</p>
                            </div>
                            <div class="col-sm-5 text-right">
                                <button class="button size-2 style-3" type="submit">
                                    <span class="button-wrapper">
                                        <span class="icon"><img src="img/icon-4.png" alt="" /></span>
                                        <span class="text">Register</span>
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
    <script src="js/app.js"></script>
      <script>
        $(document).ready(function(){

          $('.dynamic').change(function(){
              if($(this).val() != '')
              {
                var select = $(this).attr("id");
                var value = $(this).val();
                var dependent = $(this).data('dependent');
                var _token = $('input[name="_token"]').val();
                $.ajax({
                  url:"{{ route('lga.fetch') }}",
                  method:"POST",
                  data:{select:select, value:value, _token:_token, dependent:dependent},
                  success:function(result)
                    {
                         $('#'+dependent).html(result);
                    }

                })
              }
          });

        });
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
@endsection
