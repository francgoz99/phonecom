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

    <title>Contact Us | {{config('app.name')}}</title>
</head>
@endsection

@section('main-content')


        <div class="header-empty-space"></div>

        <div class="block-entry fixed-background" style="background-image: url(img/background-26.jpg);">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3">
                        <div class="cell-view simple-banner-height text-center">
                            <div class="empty-space col-xs-b35 col-sm-b70"></div>
                            <h1 class="h1 light">contact us</h1>
                            <div class="title-underline center"><span></span></div>
                            {{-- <div class="simple-article light transparent size-4">In feugiat molestie tortor a malesuada. Etiam a venenatis ipsum. Proin pharetra elit at feugiat commodo vel placerat tincidunt sapien nec</div> --}}
                            <div class="empty-space col-xs-b35 col-sm-b70"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="empty-space col-xs-b35 col-md-b70"></div>
        <div class="empty-space col-xs-b35 col-md-b70"></div>
        @include('inc.messages')
        <div class="container">
            <div class="text-center">
                <div class="simple-article size-3 grey uppercase col-xs-b5">our contacts</div>
                <div class="h2">we ready for your questions</div>
                <div class="title-underline center"><span></span></div>
            </div>
        </div>

        <div class="empty-space col-sm-b15 col-md-b50"></div>

        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <div class="icon-description-shortcode style-1">
                        <img class="icon" src="img/icon-25.png" alt="">
                        <div class="title h6">address</div>
                        <div class="description simple-article size-2">3 ILUPEJU WAY, IDUMOTA, LAGOS</div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="icon-description-shortcode style-1">
                        <img class="icon" src="img/icon-23.png" alt="">
                        <div class="title h6">phone</div>
                        <div class="description simple-article size-2" style="line-height: 26px;">
                            <a href="tel:+2349080897373">+2349080897373</a>
                            <br/>
                            <a href="tel:+2349080897373">+2349080897373</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="icon-description-shortcode style-1">
                        <img class="icon" src="img/icon-28.png" alt="">
                        <div class="title h6">email</div>
                        <div class="description simple-article size-2"><a href="mailto:offce@mobilephonestore.com">offce@mobilephonestore.com</a></div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="icon-description-shortcode style-1">
                        <img class="icon" src="img/icon-26.png" alt="">
                        <div class="title h6">Follow us</div>
                        <div class="follow light">
                            <a class="entry" href="#"><i class="fa fa-facebook"></i></a>
                            <a class="entry" href="#"><i class="fa fa-twitter"></i></a>
                            <a class="entry" href="#"><i class="fa fa-linkedin"></i></a>
                            <a class="entry" href="#"><i class="fa fa-google-plus"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="empty-space col-xs-b25 col-sm-b50"></div>
    
        {{-- <div class="container">    
            <div class="map-wrapper">
                <div id="map-canvas" class="full-width" data-lat="34.0151244" data-lng="-118.4729871" data-zoom="14"></div>
            </div>
            <div class="addresses-block hidden">
                <a class="marker" data-lat="34.0151244" data-lng="-118.4729871" data-string="1. Here is some address or email or phone or something else..."></a>
            </div>
        </div> --}}

        <div class="empty-space col-xs-b25 col-sm-b50"></div>

        <div class="container">
            <h4 class="h4 text-center col-xs-b25">have a questions?</h4>
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <form action="{{ route('contact.store') }}" class="contact-form" method="POST">
                            @csrf
                            @if(count($errors) > 0)
                                @foreach($errors->all() as $error)
                                    {{ $error }}
                                @endforeach
                            @endif
                        <div class="row m5">
                            <div class="col-sm-6">
                                <input class="simple-input col-xs-b20" type="text" value="" placeholder="Name" name="name" />
                            </div>
                            <div class="col-sm-6">
                                <input class="simple-input col-xs-b20" type="text" value="" placeholder="Email" name="email" />
                            </div>
                            <div class="col-sm-6">
                                <input class="simple-input col-xs-b20" type="text" value="" placeholder="Phone" name="phone" />
                            </div>
                            <div class="col-sm-12">
                                <textarea class="simple-input col-xs-b20" placeholder="Your message" name="body"></textarea>
                            </div>
                            <div class="col-sm-12">
                                <div class="text-center">
                                    <div class="button size-2 style-3">
                                        <span class="button-wrapper">
                                            <span class="icon"><img src="img/icon-4.png" alt=""></span>
                                            <span class="text">send message</span>
                                        </span>
                                        <input type="submit"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="empty-space col-xs-b35 col-md-b70"></div>
        <div class="empty-space col-xs-b35 col-md-b70"></div>
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

    <!-- MAP -->
    <script src="https://maps.googleapis.com/maps/api/js"></script>
    <script src="js/map.js"></script>

    <!-- CONTACT -->
    {{-- <script src="js/contact.form.js"></script> --}}
@endsection
