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

  	<title>{{config('app.name')}}</title>
    <style>
        /*width:100%;*/
        @media (max-width: 720px) {
            .dimg {
                height: 135px;
            }
            .new-empty-space{
                height: 100px;
            }
        }
        @media (min-width: 730px) {
            .dimg {
                height: 250px;
            }
            .new-empty-space{
                height: 70px;
            }
        }
    </style>
</head>
@endsection
@section('main-content')

        <div class="new-empty-space"></div>
        {{-- <div class="header-empty-space"></div> --}}

        {{-- <div class="slider-wrapper">
            <div class="swiper-button-prev visible-lg"></div>
            <div class="swiper-button-next visible-lg"></div>
            <div class="swiper-container" data-parallax="1" data-auto-height="1">
               <div class="swiper-wrapper">
                    @if($banners->count() > 0)
                    @foreach($banners as $banner)
                   <div class="swiper-slide" style="background-image: url({!! productImage($banner->image) !!});">
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="cell-view page-height">
                                        <div class="col-xs-b40 col-sm-b80"></div>
                                        <div data-swiper-parallax-x="-600">
                                            <div class="simple-article light transparent size-3">PROFESSIONAL EDITION</div>
                                            <div class="col-xs-b5"></div>
                                        </div>
                                        <div data-swiper-parallax-x="-500">
                                            <h1 class="h1 light">choice of the professionals</h1>
                                            <div class="title-underline light left"><span></span></div>
                                        </div>
                                        <div data-swiper-parallax-x="-400">
                                            <div class="simple-article size-4 light transparent">
                                                <p>In feugiat molestie tortor a malesuada. Etiam a venenatis ipsum. Proin pharetra elit at feugiat commodo vel placerat tincidunt sapien nec</p>
                                            </div>
                                            <div class="col-xs-b30"></div>
                                        </div>
                                        <div data-swiper-parallax-x="-300">
                                            <div class="buttons-wrapper">
                                                <a class="button size-2 style-1" href="#">
                                                    <span class="button-wrapper">
                                                        <span class="icon"><img src="img/icon-1.png" alt=""></span>
                                                        <span class="text">Learn More</span>
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-xs-b40 col-sm-b80"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row-background right hidden-xs" data-swiper-parallax-x="-600">
                                <img src="img/background-12.png" alt="" />
                            </div>
                            <div class="empty-space col-xs-b80 col-sm-b0"></div>
                        </div>
                   </div>
                   @endforeach  
                    @endif
                   
                   
               </div>
               <div class="swiper-pagination swiper-pagination-white"></div>
            </div>
        </div> --}}

        <div class="empty-space col-xs-b15 col-sm-b50 col-md-b100"></div>
            <div class="row">
                <div class="col-md-12">
                    <div class="swiper-container rounded">
                        <div class="swiper-button-prev style-1 hidden"></div>
                        <div class="swiper-button-next style-1 hidden"></div>
                        <div class="swiper-wrapper">
                            @if($banners->count() > 0)
                            @foreach($banners as $banner)
                            <div class="swiper-slide">
                                <div class="banner-shortcode style-1">
                                    <div class="background" style="background-image: url({!! productImage($banner->image) !!});"></div>
                                    {{-- <div class="description valign-middle">
                                        <div class="valign-middle-content">
                                            <div class="simple-article size-3 light fulltransparent">DON'T MISS!</div>
                                            <div class="banner-title color">UP TO 70%</div>
                                            <div class="h4 light">best android tv box</div>
                                            <div class="empty-space col-xs-b25"></div>
                                            <a class="button size-1 style-3" href="#">
                                                <span class="button-wrapper">
                                                    <span class="icon"><img src="img/icon-4.png" alt=""></span>
                                                    <span class="text">learn more</span>
                                                </span>
                                            </a>
                                        </div>
                                        <div class="empty-space col-xs-b60 col-sm-b0"></div>
                                    </div> --}}
                                </div>
                            </div>
                            @endforeach  
                            @endif
                            
                        </div>
                        <div class="swiper-pagination"></div>
                    </div>
                </div>
            </div>


            <div class="empty-space col-xs-b25 col-sm-b60"></div>
            <div class="container">
                <div class="text-center">
                    <div class="simple-article size-3 grey uppercase col-xs-b5">Top Selling Products</div>
                    <div class="h2">choose the best</div>
                    <div class="title-underline center"><span></span></div>
                </div>
            </div>
            <div class="products-content">
                <div class="products-wrapper">
                    <div class="row nopadding">
                        @if($latests->count() > 0)
                            @foreach($latests as $latest)
                            <div class="col-sm-3">
                                <div class="product-shortcode style-1">
                                    <div class="title" style="padding: 10px;">
                                        <div class="simple-article size-1 color col-xs-b5"><a href="{{ route('shop.show', $latest->slug) }}">
                                            {!! $latest->quantity < setting('site.stock_threshold') ? '<span class="ribbon off">Only '.$latest->quantity.' left</span>' : ''!!}
                                        </a></div>
                                        <div class="h6 animate-to-green"><a href="{{ route('shop.show', $latest->slug) }}">{!! strip_tags($latest->name) !!}</a></div>
                                    </div>
                                    <div class="preview">
                                        <div class="dimg">
                                            <img src="{{ productImage($latest->image) }}" alt="{{ $latest->name}}" style="height: 100%;">
                                        </div>
                                        
                                        <div class="preview-buttons valign-middle">
                                            <div class="valign-middle-content">
                                                <a class="button size-2 style-2" href="{{ route('shop.show', $latest->slug) }}">
                                                    <span class="button-wrapper">
                                                        <span class="icon"><img src="img/icon-1.png" alt=""></span>
                                                        <span class="text">View</span>
                                                    </span>
                                                </a>
                                                <form action="{{ route('cart.store') }}" method="POST">
                                                    @csrf
                                                    <input type="hidden" name="id" value="{{ $latest->id }}">
                                                    <input type="hidden" name="name" value="{{ $latest->name }}">
                                                    <input type="hidden" name="price" value="{{ totalcash($latest->price) }}">
                                                    <button class="button size-2 style-3" type="submit">
                                                        <span class="button-wrapper">
                                                            <span class="icon"><img src="img/icon-3.png" alt=""></span>
                                                            <span class="text">Add To Cart</span>
                                                        </span>
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="price">
                                        
                                        <div class="simple-article size-4"><span class="color">&#8358;{{ number_format( totalcash($latest->price))}}</span>&nbsp;&nbsp;&nbsp;<span class="line-through">&#8358;{{ number_format( slash($latest->price) )}}</span></div>
                                    </div>
                                    
                                </div>  
                            </div>
                        @endforeach
                        @else
                          <p>No product Found</p>
                        @endif 
                        
                    </div>
                </div>
            </div>

        {{-- <div class="empty-space col-xs-b35 col-md-b70"></div> --}}
        <div class="empty-space col-xs-b35 col-md-b70"></div>

        <div class="row nopadding">
            <div class="col-md-6">
                <div class="banner-shortcode style-3 wide" style="background-image: url(img/background-14.jpg);">
                    <div class="valign-middle-cell">
                        <div class="slider-product-preview hidden-xs">
                            <img src="img/product-preview-15.png" alt="">
                        </div>
                        <div class="valign-middle-content">
                            <div class="simple-article size-3 light transparent uppercase col-xs-b5">relax collection</div>
                            <h3 class="h3 light">your perfect sound</h3>
                            <div class="title-underline light left"><span></span></div>
                            <div class="simple-article size-4 light transparent col-xs-b30">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesentir pulvinar ante et nisl scelerisque.</div>
                            <a class="button size-2 style-1" href="#">
                                <span class="button-wrapper">
                                    <span class="icon"><img src="img/icon-1.png" alt=""></span>
                                    <span class="text">learn more</span>
                                </span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="banner-shortcode style-3 wide" style="background-image: url(img/background-15.jpg);">
                    <div class="valign-middle-cell">
                        <div class="slider-product-preview hidden-xs">
                            <img src="img/product-preview-12.png" alt="">
                        </div>
                        <div class="valign-middle-content">
                            <div class="simple-article size-3 light transparent uppercase col-xs-b5">street collection</div>
                            <h3 class="h3 light">noise is not a problem</h3>
                            <div class="title-underline light left"><span></span></div>
                            <div class="simple-article size-4 light transparent col-xs-b30">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesentir pulvinar ante et nisl scelerisque.</div>
                            <a class="button size-2 style-1" href="#">
                                <span class="button-wrapper">
                                    <span class="icon"><img src="img/icon-1.png" alt=""></span>
                                    <span class="text">learn more</span>
                                </span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="empty-space col-xs-b25 col-sm-b60"></div>
            <div class="container">
                <div class="text-center">
                    <div class="simple-article size-3 grey uppercase col-xs-b5">choose the best</div>
                    <div class="h2">Featured Products</div>
                    <div class="title-underline center"><span></span></div>
                </div>
            </div>
            <div class="products-content">
                <div class="products-wrapper">
                    <div class="row nopadding">
                        @if($boosteds->count() > 0)
                            @foreach($boosteds as $boosted)
                            <div class="col-sm-3">
                                <div class="product-shortcode style-1">
                                    <div class="title" style="padding: 10px;">
                                        <div class="simple-article size-1 color col-xs-b5"><a href="{{ route('shop.show', $boosted->slug) }}">
                                            {!! $boosted->quantity < setting('site.stock_threshold') ? '<span class="ribbon off">Only '.$boosted->quantity.' left</span>' : ''!!}
                                        </a></div>
                                        <div class="h6 animate-to-green"><a href="{{ route('shop.show', $boosted->slug) }}">{!! strip_tags($boosted->name) !!}</a></div>
                                    </div>
                                    <div class="preview">
                                        <div class="dimg">
                                            <img src="{{ productImage($boosted->image) }}" alt="{{ $boosted->name}}" style="height: 100%;">
                                        </div>
                                        <div class="preview-buttons valign-middle">
                                            <div class="valign-middle-content">
                                                <a class="button size-2 style-2" href="{{ route('shop.show', $boosted->slug) }}">
                                                    <span class="button-wrapper">
                                                        <span class="icon"><img src="img/icon-1.png" alt=""></span>
                                                        <span class="text">View</span>
                                                    </span>
                                                </a>
                                                <form action="{{ route('cart.store') }}" method="POST">
                                                    @csrf
                                                    <input type="hidden" name="id" value="{{ $boosted->id }}">
                                                    <input type="hidden" name="name" value="{{ $boosted->name }}">
                                                    <input type="hidden" name="price" value="{{ totalcash($boosted->price) }}">
                                                    <button class="button size-2 style-3" type="submit">
                                                        <span class="button-wrapper">
                                                            <span class="icon"><img src="img/icon-3.png" alt=""></span>
                                                            <span class="text">Add To Cart</span>
                                                        </span>
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="price">
                                        
                                        <div class="simple-article size-4"><span class="color">&#8358;{{ number_format( totalcash($boosted->price))}}</span>&nbsp;&nbsp;&nbsp;<span class="line-through">&#8358;{{ number_format( slash($boosted->price) )}}</span></div>
                                    </div>
                                    
                                </div>  
                            </div>
                        @endforeach
                        @else
                          <p>No product Found</p>
                        @endif 
                        
                    </div>
                </div>
            </div>

        <div class="empty-space col-xs-b20"></div>

        <div style="padding: 15px; background: #f7f7f7;">
            <div class="row nopadding">
                <div class="col-sm-6 col-md-3">
                    <a class="product-shortcode style-2">
                        <span class="preview"><img src="img/product-13.png" alt="" /></span>
                        <span class="description">
                            <span class="h6 animate-to-green">smart watches</span>
                            <span class="simple-article size-1 animate-to-fulltransparent">137 PRODUCTS</span>
                        </span>
                    </a>
                </div>
                <div class="col-sm-6 col-md-3">
                    <a class="product-shortcode style-2">
                        <span class="preview"><img src="img/product-14.png" alt="" /></span>
                        <span class="description">
                            <span class="h6 animate-to-green">smart watches</span>
                            <span class="simple-article size-1 animate-to-fulltransparent">137 PRODUCTS</span>
                        </span>
                    </a>
                </div>
                <div class="col-sm-6 col-md-3">
                    <a class="product-shortcode style-2">
                        <span class="preview"><img src="img/product-15.png" alt="" /></span>
                        <span class="description">
                            <span class="h6 animate-to-green">smart watches</span>
                            <span class="simple-article size-1 animate-to-fulltransparent">137 PRODUCTS</span>
                        </span>
                    </a>
                </div>
                <div class="col-sm-6 col-md-3">
                    <a class="product-shortcode style-2">
                        <span class="preview"><img src="img/product-16.png" alt="" /></span>
                        <span class="description">
                            <span class="h6 animate-to-green">smart watches</span>
                            <span class="simple-article size-1 animate-to-fulltransparent">137 PRODUCTS</span>
                        </span>
                    </a>
                </div>
            </div>
        </div>

        <div class="slider-wrapper">
            <div class="swiper-button-prev hidden"></div>
            <div class="swiper-button-next hidden"></div>
            <div class="swiper-container" data-breakpoints="1" data-xs-slides="1" data-sm-slides="2" data-md-slides="2" data-lt-slides="3"  data-slides-per-view="4">
                <div class="swiper-wrapper">
                    @if($posts->count() > 0)
                        @foreach($posts as $post)
                    <div class="swiper-slide">
                        <div class="product-shortcode style-6">
                            <div class="content">
                                <div class="title">
                                    <div class="simple-article size-3 color col-xs-b5"><a href="{{ route('blog.show', $post->slug) }}">{!! $post->created_at->format('d M, Y') !!}</a></div>
                                    <div class="h5 animate-to-green"><a href="{{ route('blog.show', $post->slug) }}">{!! $post->title !!}</a></div>
                                </div>
                                <div class="description">
                                    <div class="simple-article text size-2 animate-to-fulltransparent">{!! str_limit(strip_tags($post->body), $limit = 100, $end = '...') !!} </div>
                                </div>
                                <div class="preview">
                                    <img src="{{ productImage($post->image) }}" alt="{!! $post->title !!}" />
                                </div>
                                {{-- <div class="price">
                                    <div class="simple-article size-4 grey animate-to-fulltransparent">From <span class="color">$155.00</span></div>
                                </div> --}}
                                <div class="preview-button">
                                    <a class="button size-2 style-3" href="{{ route('blog.show', $post->slug) }}">
                                        <span class="button-wrapper">
                                            <span class="icon"><img src="img/icon-4.png" alt=""></span>
                                            <span class="text">Read More</span>
                                        </span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    @endforeach

                  @else
                  <p>No Post yet!</p>
                  @endif
                  
                </div>
                <div class="swiper-pagination relative-pagination"></div>
            </div>
        </div>


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
@endsection
