<?php
namespace App\Http\Controllers;

use App\Category;
use App\CategorySub;
$categories = Category::all();
$allSubCategories = CategorySub::all();
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

    <link href="{{asset('')}}css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="{{asset('')}}css/bootstrap.extension.css" rel="stylesheet" type="text/css" />
    <link href="{{asset('')}}css/style.css" rel="stylesheet" type="text/css" />
    <link href="{{asset('')}}css/swiper.css" rel="stylesheet" type="text/css" />
    <link href="{{asset('')}}css/sumoselect.css" rel="stylesheet" type="text/css" />
    <link href="{{asset('')}}css/font-awesome.min.css" rel="stylesheet" type="text/css" />

  	<title>CONNECTION ERROR | {{config('app.name')}}</title>
</head>
@endsection
@section('main-content')

        <div class="header-empty-space"></div>

        <div class="container">
            <div class="empty-space col-xs-b20"></div>

            <!-- 404 Content -->
              <div class="text-center">
                <div class="display-2"><i class="fa fa-signal"></i></div>
                <h1>OOPS! CONNECTION ERROR</h1>
                <h4>Please try again. Your connection is not strong</h4>
                <div class="btn-group btn-group-sm mt-3 mb-5" role="group">
                  <a class="btn btn-outline-info" href="javascript:history.back()" role="button"><i class="fa fa-arrow-left"></i> Go Back</a>
                  <a class="btn btn-info" href="{{ route('landing-page') }}" role="button"><i class="fa fa-home"></i> Home</a>
                </div>
                <p>Think this is an error? Please <a href="{{ route('contact') }}"><u>let us know.</u></a></p>
              </div>
              <!-- /404 Content -->
            
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
