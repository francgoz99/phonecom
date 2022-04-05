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
    <style>
        /*width:100%;*/
        @media (max-width: 720px) {
            .dimg {
                height: 135px;
            }
        }
        @media (min-width: 730px) {
            .dimg {
                height: 250px;
            }
        }
    </style>

    <meta name="keywords" content="{{ $product->keywords}}">
    <meta name="description" content="{{ $product->name}} is in {{$subName}} category and it's features are {!! $product->details !!}">
    <meta property="og:image" content="{{ productImage($product->image) }}">
    <title>{{ $product->name}} :- {!! str_limit($product->details, 30) !!} | {{config('app.name')}}</title>
</head>
@endsection
@section('main-content')


        <div class="header-empty-space"></div>

        <div class="container">
            <div class="empty-space col-xs-b15 col-sm-b30"></div>
            <div class="breadcrumbs">
                <a href="{{ route('landing-page') }}">home</a>
                <a href="#">{{$subName}}</a>
                <a href="#">{{$product->name}}</a>
            </div>
            <div class="empty-space col-xs-b15 col-sm-b50 col-md-b100"></div>
            <div class="row">
                <div class="col-md-9 col-md-push-3">
                    <div class="row">
                        <div class="col-sm-6 col-xs-b30 col-sm-b0">
                            
                            <div class="main-product-slider-wrapper swipers-couple-wrapper">
                                <div class="swiper-container swiper-control-top">
                                   <div class="swiper-button-prev hidden"></div>
                                   <div class="swiper-button-next hidden"></div>
                                   <div class="swiper-wrapper">

                                       <div class="swiper-slide">
                                            <div class="swiper-lazy-preloader"></div>
                                            <div class="product-big-preview-entry swiper-lazy" data-background="{{ productImage($product->image) }}"></div>
                                       </div>
                                       @if($product->images)                    
                                            @foreach( json_decode($product->images, true) as $image)
                                           <div class="swiper-slide">
                                                <div class="swiper-lazy-preloader"></div>
                                                <div class="product-big-preview-entry swiper-lazy" data-background="{{ productImage($image) }}"></div>
                                           </div>
                                            @endforeach
                                        @endif
                                       
                                   </div>
                                </div>

                                <div class="empty-space col-xs-b30 col-sm-b60"></div>

                                <div class="swiper-container swiper-control-bottom" data-breakpoints="1" data-xs-slides="3" data-sm-slides="3" data-md-slides="4" data-lt-slides="4" data-slides-per-view="5" data-center="1" data-click="1">
                                   <div class="swiper-button-prev hidden"></div>
                                   <div class="swiper-button-next hidden"></div>
                                   <div class="swiper-wrapper">
                                       <div class="swiper-slide">
                                            <div class="product-small-preview-entry">
                                                <img src="{{ productImage($product->image) }}" alt="" style="width: 100%;" />
                                            </div>
                                        </div>
                                        @if($product->images)                    
                                            @foreach( json_decode($product->images, true) as $image)
                                            <div class="swiper-slide">
                                                <div class="product-small-preview-entry">
                                                    <img src="{{ productImage($image) }}" alt="" style="width: 100%;" />
                                                </div>
                                            </div>
                                            @endforeach
                                        @endif
                                        

                                   </div>
                                </div>
                            </div>

                        </div>
                        <div class="col-sm-6">
                            {{-- <div class="simple-article size-3 grey col-xs-b5"><small>{!!$stockLevel!!}</small></div> --}}
                            <div class="h3 col-xs-b25">{{$product->name}}</div>
                            <div class="row col-xs-b25">
                                <div class="col-sm-6">
                                    <div class="simple-article size-5 grey">PRICE: <span class="color">&#8358;{{ number_format(totalcash($product->price)) }}</span></div>        
                                </div>
                                <div class="col-sm-6 col-sm-text-right">
                                    @if($reviews->count() > 0)
                                    <?php 
                                        $total = $reviews->sum('rating') / $reviews->count();
                                    ?>
                                    <div class="rate-wrapper align-inline">
                                        @for($i = 0; $i < $total; $i++)
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                        @endfor
                                    </div>
                                    <div class="simple-article size-2 align-inline">{{$reviews->count()}} Reviews</div>
                                    @else
                                    <div class="simple-article size-2 align-inline">0 Reviews</div>
                                    @endif
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="simple-article size-3 col-xs-b5">ITEM NO.: <span class="grey">#{{$product->id}}</span></div>
                                </div>
                                <div class="col-sm-6 col-sm-text-right">
                                    <div class="simple-article size-3 col-xs-b20">AVAILABLILITY.: <span class="grey">{!!$stockLevel!!}</span></div>
                                </div>
                            </div>
                            {{-- <div class="simple-article size-3 col-xs-b30">Vivamus in tempor eros. Phasellus rhoncus in nunc sit amet mattis. Integer in ipsum vestibulum, molestie arcu ac, efficitur tellus. Phasellus id vulputate erat.</div> --}}
                            {{-- <div class="row col-xs-b40">
                                <div class="col-sm-3">
                                    <div class="h6 detail-data-title size-1">size:</div>
                                </div>
                                <div class="col-sm-9">
                                    <select class="SlectBox">
                                        <option disabled="disabled" selected="selected">Choose size</option>
                                        <option value="volvo">Volvo</option>
                                        <option value="saab">Saab</option>
                                        <option value="mercedes">Mercedes</option>
                                        <option value="audi">Audi</option>
                                    </select>
                                </div>
                            </div> --}}
                            {{-- <div class="row col-xs-b40">
                                <div class="col-sm-3">
                                    <div class="h6 detail-data-title">color:</div>
                                </div>
                                <div class="col-sm-9">
                                    <div class="color-selection size-1">
                                        <div class="entry active" style="color: #a7f050;"></div>
                                        <div class="entry" style="color: #50e3f0;"></div>
                                        <div class="entry" style="color: #eee;"></div>
                                        <div class="entry" style="color: #4d900c;"></div>
                                        <div class="entry" style="color: #edb82c;"></div>
                                        <div class="entry" style="color: #7d3f99;"></div>
                                        <div class="entry" style="color: #3481c7;"></div>
                                        <div class="entry" style="color: #bf584b;"></div>
                                    </div>
                                </div>
                            </div> --}}
                            {{-- <div class="row col-xs-b40">
                                <div class="col-sm-3">
                                    <div class="h6 detail-data-title size-1">quantity:</div>
                                </div>
                                <div class="col-sm-9">
                                    <div class="quantity-select">
                                        <span class="minus"></span>
                                        <span class="number">1</span>
                                        <span class="plus"></span>
                                    </div>
                                </div>
                            </div> --}}
                            
                            <div class="row m5 col-xs-b40">
                                @if($product->quantity > 0)
                                <form action="{{ route('cart.store') }}" method="POST">
                                  @csrf
                                  <input type="hidden" name="id" value="{{ $product->id }}">
                                  <input type="hidden" name="name" value="{{ $product->name }}">
                                  <input type="hidden" name="price" value="{{ totalcash($product->price) }}">
                                    <div class="col-sm-6 col-xs-b10 col-sm-b0">
                                        <button class="button size-2 style-2 block" type="submit">
                                            <span class="button-wrapper">
                                                <span class="icon"><img src="img/icon-2.png" alt=""></span>
                                                <span class="text">add to cart</span>
                                            </span>
                                        </button>
                                    </div>
                                </form>
                                @endif 
                                <form action="{{ route('compare.store') }}" method="POST">
                                    @csrf
                                    <input type="hidden" name="id" value="{{ $product->id }}">
                                    <input type="hidden" name="name" value="{{ $product->name }}">
                                    <input type="hidden" name="price" value="{{ totalcash($product->price) }}">
                                    <div class="col-sm-6">
                                        <button class="button size-2 style-1 block noshadow" href="#">
                                        <span class="button-wrapper">
                                            <span class="icon"><i class="fa fa-heart-o" aria-hidden="true"></i></span>
                                            <span class="text">add to Compare</span>
                                        </span>
                                    </button>
                                    </div>
                                </form>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="h6 detail-data-title size-2">share:</div>
                                </div>
                                <div class="col-sm-9">
                                    <div class="follow light">
                                        <a class="entry" href="https://www.facebook.com/sharer/sharer.php?u={{url()->current()}}"><i class="fa fa-facebook"></i></a>
                                        <a class="entry" href="https://twitter.com/intent/tweet?text=Check out {{$product->name.' '.str_limit($product->details, 100).' - Click on the link '}}{{url()->current()}}"><i class="fa fa-twitter"></i></a>
                                        <a class="entry" href="https://wa.me/?text=Check out {{$product->name.' '.str_limit($product->details, 100).' - Click on the link '}}{{url()->current()}}"><i class="fa fa-whatsapp"></i></a>
                                        {{-- <a class="entry" href="#"><i class="fa fa-google-plus"></i></a>
                                        <a class="entry" href="#"><i class="fa fa-pinterest-p"></i></a> --}}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="empty-space col-xs-b35 col-md-b70"></div>

                    <div class="tabs-block">
                        <div class="tabulation-menu-wrapper text-center">
                            <div class="tabulation-title simple-input">description</div>
                            <ul class="tabulation-toggle">
                                <li><a class="tab-menu active">description</a></li>
                                {{-- <li><a class="tab-menu">technical specs</a></li> --}}
                                <li><a class="tab-menu">Reviews</a></li>
                            </ul>
                        </div>
                        <div class="empty-space col-xs-b30 col-sm-b60"></div>

                        <div class="tab-entry visible">                            
                            {!! $product->description !!}
                        </div>

                        
                        <div class="tab-entry">
                            @if($reviews->count() > 0)
                             @foreach($reviews as $review)
                            <div class="testimonial-entry">
                                <div class="row col-xs-b20">
                                    <div class="col-xs-8">
                                        <img class="preview" src="img/testimonial-1.jpg" alt="" />
                                        <div class="heading-description">
                                            <div class="h6 col-xs-b5">{{$review->user_name }}</div>
                                            <div class="rate-wrapper align-inline">
                                                @for($i = 0; $i < $review->rating; $i++)
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                @endfor
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-4 text-right">
                                        <div class="simple-article size-1 grey">{{$review->created_at->format('M d / Y')}}</div>
                                    </div>
                                </div>
                                <div class="simple-article size-2 col-xs-b15">
                                    {{strip_tags($review->review)}}
                                </div>
                                {{-- <div class="pros">
                                    <div class="simple-article size-2 col-xs-b15">Runc dictum, erat id molestie vestibulum, ex leo vestibulum justo, luctus tempor erat sem quis</div>
                                </div>
                                <div class="cons">
                                    <div class="simple-article size-2 col-xs-b25">Do not have</div>
                                </div> --}}
                            </div>
                            @endforeach

                              @else
                                <h6>No Review yet!</h6>
                              @endif
                            
                            
                            
                        </div>
                    </div>

                    <div class="empty-space col-xs-b35 col-md-b70"></div>

                    {{-- <div class="swiper-container rounded">
                        <div class="swiper-button-prev style-1 hidden"></div>
                        <div class="swiper-button-next style-1 hidden"></div>
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <div class="banner-shortcode style-1">
                                    <div class="background" style="background-image: url(img/thumbnail-14.jpg);"></div>
                                    <div class="description valign-middle">
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
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="banner-shortcode style-1">
                                    <div class="background" style="background-image: url(img/thumbnail-10.jpg);"></div>
                                    <div class="description valign-middle">
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
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-pagination"></div>
                    </div>

                    <div class="empty-space col-xs-b35 col-md-b70"></div>
                    <div class="empty-space col-md-b70"></div> --}}

                </div>
                <div class="col-md-3 col-md-pull-9">
                    <div class="h4 col-xs-b10">popular categories</div>
                    <ul class="categories-menu transparent">
                        <?php $i = 0; ?>
                          @foreach($categories as $category)
                          <?php $i++;?>
                        <li>
                            <a href="#">{{$category->name}}</a>
                            <div class="toggle"></div>
                            <ul>                                
                                @foreach($allSubCategories as $allSubCategory)
                                    @if($category->id == $allSubCategory->category_id)
                                        <li>
                                            <a href="{{ route('shop.index', ['subCategory' => $allSubCategory->name]) }}">{{$allSubCategory->name}}</a>
                                        </li>
                                    @endif
                                @endforeach
                            </ul>
                        </li>
                        @endforeach
                        
                    </ul>

                    <div class="empty-space col-xs-b25 col-sm-b50"></div>

                    {{-- <div class="h4 col-xs-b25">Price</div>
                    <div id="prices-range"></div>
                    <div class="simple-article size-1">PRICE: <span class="grey">$<span class="min-price">40</span> - $<span class="max-price">300</span></span></div>

                    <div class="empty-space col-xs-b25 col-sm-b50"></div>

                    <div class="h4 col-xs-b25">Brands</div>
                    <label class="checkbox-entry">
                        <input type="checkbox"><span>LG</span>
                    </label>
                    <div class="empty-space col-xs-b10"></div>
                    <label class="checkbox-entry">
                        <input type="checkbox"><span>SAMSUNG</span>
                    </label>
                    <div class="empty-space col-xs-b10"></div>
                    <label class="checkbox-entry">
                        <input type="checkbox"><span>Apple</span>
                    </label>
                    <div class="empty-space col-xs-b10"></div>
                    <label class="checkbox-entry">
                        <input type="checkbox"><span>HTC</span>
                    </label>
                    <div class="empty-space col-xs-b10"></div>
                    <label class="checkbox-entry">
                        <input type="checkbox"><span>Google</span>
                    </label>

                    <div class="empty-space col-xs-b25 col-sm-b50"></div>

                    <div class="h4 col-xs-b25">Choose Color</div>
                    <div class="color-selection size-1">
                        <div class="entry active" style="color: #a7f050;"></div>
                        <div class="entry" style="color: #50e3f0;"></div>
                        <div class="entry" style="color: #eee;"></div>
                        <div class="entry" style="color: #4d900c;"></div>
                        <div class="entry" style="color: #edb82c;"></div>
                        <div class="entry" style="color: #7d3f99;"></div>
                        <div class="entry" style="color: #3481c7;"></div>
                        <div class="entry" style="color: #bf584b;"></div>
                    </div>

                    <div class="empty-space col-xs-b25 col-sm-b50"></div>

                    <div class="h4 col-xs-b25">Operation System</div>
                    <label class="checkbox-entry">
                        <input type="checkbox"><span>Android</span>
                    </label>
                    <div class="empty-space col-xs-b10"></div>
                    <label class="checkbox-entry">
                        <input type="checkbox"><span>IOS</span>
                    </label>
                    <div class="empty-space col-xs-b10"></div>
                    <label class="checkbox-entry">
                        <input type="checkbox"><span>Windows Phone</span>
                    </label>
                    <div class="empty-space col-xs-b10"></div>
                    <label class="checkbox-entry">
                        <input type="checkbox"><span>Symbian</span>
                    </label>
                    <div class="empty-space col-xs-b10"></div>
                    <label class="checkbox-entry">
                        <input type="checkbox"><span>Blackberry OS</span>
                    </label>

                    <div class="empty-space col-xs-b25 col-sm-b50"></div>

                    <div class="h4 col-xs-b25">Popular Tags</div>
                    <div class="tags light clearfix">
                        <a class="tag">headphoness</a>
                        <a class="tag">accessories</a>
                        <a class="tag">new</a>
                        <a class="tag">wireless</a>
                        <a class="tag">cables</a>
                        <a class="tag">devices</a>
                        <a class="tag">gadgets</a>
                        <a class="tag">brands</a>
                        <a class="tag">replacements</a>
                        <a class="tag">cases</a>
                        <a class="tag">cables</a>
                        <a class="tag">professional</a>
                    </div>

                    <div class="empty-space col-xs-b25 col-sm-b60"></div> --}}


                </div>
            </div>

            <div class="swiper-container arrows-align-top" data-breakpoints="1" data-xs-slides="1" data-sm-slides="3" data-md-slides="4" data-lt-slides="4" data-slides-per-view="5">
                <div class="h4 swiper-title">Related Products</div>
                <div class="empty-space col-xs-b20"></div>
                <div class="swiper-button-prev style-1"></div>
                <div class="swiper-button-next style-1"></div>
                <div class="swiper-wrapper">

                    @if($relaProducts->count() > 0)
                    @foreach($relaProducts as $relaProduct)
                    <div class="swiper-slide">
                        <div class="product-shortcode style-1 small">
                            <div class="title">
                                <div class="simple-article size-1 color col-xs-b5"><a href="{{ route('shop.show', $relaProduct->slug) }}">{!!$subName!!}</a></div>
                                <div class="h6 animate-to-green"><a href="{{ route('shop.show', $relaProduct->slug) }}">{{ $relaProduct->name}}</a></div>
                            </div>
                            <div class="preview">
                                <div class="dimg">
                                    <img src="{{ productImage($relaProduct->image) }}" alt="{{ $relaProduct->name}}" style="height: 100%;">
                                </div>
                                <div class="preview-buttons valign-middle">
                                    <div class="valign-middle-content">
                                        <a class="button size-2 style-2" href="{{ route('shop.show', $relaProduct->slug) }}">
                                            <span class="button-wrapper">
                                                <span class="icon"><img src="img/icon-1.png" alt=""></span>
                                                <span class="text">View Product</span>
                                            </span>
                                        </a>
                                        @if($product->quantity > 0)
                                            <form action="{{ route('cart.store') }}" method="POST">
                                              {{ csrf_field() }}
                                              <input type="hidden" name="id" value="{{ $product->id }}">
                                              <input type="hidden" name="name" value="{{ $product->name }}">
                                              <input type="hidden" name="price" value="{{ totalcash($product->price) }}">
                                                <button class="button size-2 style-3" type="submit">
                                                    <span class="button-wrapper">
                                                        <span class="icon"><img src="img/icon-3.png" alt=""></span>
                                                        <span class="text">Add To Cart</span>
                                                    </span>
                                                </button>
                                            </form>
                                        @endif
                                    </div>
                                </div>
                            </div>
                            <div class="price">
                                <div class="simple-article size-4 dark">&#8358;{{ number_format( totalcash($relaProduct->price))}}</div>
                            </div>
                        </div>
                    </div>
                    @endforeach
                    @endif

                </div>
                <div class="swiper-pagination relative-pagination visible-xs"></div>
            </div>

            <div class="empty-space col-xs-b35 col-md-b70"></div>
            <div class="empty-space col-md-b70"></div>

            

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

    <!-- range slider -->
    <script src="{{asset('')}}js/jquery-ui.min.js"></script>
    <script src="{{asset('')}}js/jquery.ui.touch-punch.min.js"></script>
    <script>
        $(document).ready(function(){
            var minVal = parseInt($('.min-price').text());
            var maxVal = parseInt($('.max-price').text());
            $( "#prices-range" ).slider({
                range: true,
                min: minVal,
                max: maxVal,
                step: 5,
                values: [ minVal, maxVal ],
                slide: function( event, ui ) {
                    $('.min-price').text(ui.values[ 0 ]);
                    $('.max-price').text(ui.values[ 1 ]);
                }
            });
        });
    </script>
@endsection
