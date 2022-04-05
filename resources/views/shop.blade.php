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

    <title>{{ $categoryName }} | {{config('app.name')}}</title>
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
</head>
@endsection

@section('main-content')    


        <div class="header-empty-space"></div>

        <div class="container">
            <div class="empty-space col-xs-b15 col-sm-b30"></div>
            <div class="breadcrumbs">
                <a href="{{ route('landing-page') }}">home</a>
                <a href="#">{{ $categoryName }}</a>
            </div>
            {{-- <div class="empty-space col-xs-b15 col-sm-b50 col-md-b100"></div> --}}
            <div class="row">
                <div class="col-md-9 col-md-push-3">
                    {{-- <div class="slider-wrapper">
                        <div class="swiper-container arrows-align-top" data-breakpoints="1" data-xs-slides="1" data-sm-slides="3" data-md-slides="4" data-lt-slides="4" data-slides-per-view="4">
                            <div class="h4 swiper-title">products</div>
                            <div class="empty-space col-xs-b20"></div>
                            <div class="swiper-button-prev style-1"></div>
                            <div class="swiper-button-next style-1"></div>
                            <div class="swiper-wrapper">
                                @if($products->count() > 0)
                                    @foreach($products as $product)
                                <div class="swiper-slide">
                                    <div class="product-shortcode style-1 small">
                                        <div class="title">
                                            <div class="simple-article size-1 color col-xs-b5"><a href="{{ route('shop.show', $product->slug) }}">
                                                {!! $product->quantity < setting('site.stock_threshold') ? '<span class="ribbon off">Only '.$product->quantity.' left</span>' : ''!!}
                                            </a></div>
                                            <div class="h6 animate-to-green"><a href="{{ route('shop.show', $product->slug) }}">{{ $product->name}}</a></div>
                                        </div>
                                        <div class="preview">
                                            <img src="{{ productImage($product->image) }}" alt="{{ $product->name}}">
                                            <div class="preview-buttons valign-middle">
                                                <div class="valign-middle-content">
                                                    <a class="button size-2 style-2" href="{{ route('shop.show', $product->slug) }}">
                                                        <span class="button-wrapper">
                                                            <span class="icon"><img src="img/icon-1.png" alt=""></span>
                                                            <span class="text">View</span>
                                                        </span>
                                                    </a>
                                                    <form action="{{ route('cart.store') }}" method="POST">
                                                        @csrf
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
                                                </div>
                                            </div>
                                        </div>
                                        <div class="price">
                                            <div class="simple-article size-4 dark">&#8358;{{ number_format( totalcash($product->price))}}</div>
                                        </div>
                                    </div>
                                </div>
                                @endforeach
                                @else
                                  <p>No product Found</p>
                                @endif

                               
                            </div>
                            <div class="swiper-pagination relative-pagination visible-xs"></div>
                        </div>
                    </div> --}}

                    {{-- <div class="empty-space col-xs-b20 col-sm-b35 col-md-b70"></div> --}}

                    <div class="align-inline spacing-1">
                        <div class="h4">Sort by price</div>
                    </div>
                    {{-- <div class="align-inline spacing-1">
                        <div class="simple-article size-1">SHOWING <b class="grey">15</b> OF <b class="grey">2 358</b> RESULTS</div>
                    </div>
                    <div class="align-inline spacing-1 hidden-xs">
                        <a class="pagination toggle-products-view active"><img src="img/icon-14.png" alt="" /><img src="img/icon-15.png" alt="" /></a>
                        <a class="pagination toggle-products-view"><img src="img/icon-16.png" alt="" /><img src="img/icon-17.png" alt="" /></a>
                    </div> --}}
                    <div class="align-inline spacing-1 filtration-cell-width-1">
                        <select class="SlectBox small">
                            <option disabled="disabled" selected="selected">Most popular products</option>
                            <option value="volvo">Volvo</option>
                            <option value="saab">Saab</option>
                            <option value="mercedes">Mercedes</option>
                            <option value="audi">Audi</option>
                        </select>
                    </div>
                    <div class="align-inline spacing-1 filtration-cell-width-2">
                        <select class="SlectBox small">
                            <li>
                                <a href="{{ route('shop.index', ['category' => request()->category, 'subCategory' => request()->subCategory, 'sort' => 'low_high']) }}">Low to High</a>
                            </li>
                            <li>
                                <a  href="{{ route('shop.index', ['category' => request()->category, 'subCategory' => request()->subCategory, 'sort' => 'high_low']) }}">High to Low</a>
                            </li>
                        </select>
                    </div>


                    {{-- <div class="empty-space col-xs-b25 col-sm-b60"></div> --}}

                    <div class="products-content">
                        <div class="products-wrapper">
                            <div class="row nopadding">
                                @if($products->count() > 0)
                                    @foreach($products as $product)
                                    <div class="col-sm-4">
                                        <div class="product-shortcode style-1">
                                            <div class="title" style="padding: 10px;">
                                                <div class="simple-article size-1 color col-xs-b5"><a href="{{ route('shop.show', $product->slug) }}">
                                                    {!! $product->quantity < setting('site.stock_threshold') ? '<span class="ribbon off">Only '.$product->quantity.' left</span>' : ''!!}
                                                </a></div>
                                                <div class="h6 animate-to-green"><a href="{{ route('shop.show', $product->slug) }}">{!! strip_tags($product->name) !!}</a></div>
                                            </div>
                                            <div class="preview">
                                                <div class="dimg">
                                                    <img src="{{ productImage($product->image) }}" alt="{{ $product->name}}" style="height: 100%;">
                                                </div>
                                                <div class="preview-buttons valign-middle">
                                                    <div class="valign-middle-content">
                                                        <a class="button size-2 style-2" href="{{ route('shop.show', $product->slug) }}">
                                                            <span class="button-wrapper">
                                                                <span class="icon"><img src="img/icon-1.png" alt=""></span>
                                                                <span class="text">View</span>
                                                            </span>
                                                        </a>
                                                        <form action="{{ route('cart.store') }}" method="POST">
                                                            @csrf
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
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="price">
                                                {{-- <div class="color-selection">
                                                    <div class="entry active" style="color: #a7f050;"></div>
                                                    <div class="entry" style="color: #50e3f0;"></div>
                                                    <div class="entry" style="color: #eee;"></div>
                                                </div> --}}
                                                <div class="simple-article size-4"><span class="color">&#8358;{{ number_format( totalcash($product->price))}}</span>&nbsp;&nbsp;&nbsp;<span class="line-through">&#8358;{{ number_format( slash($product->price) )}}</span></div>
                                            </div>
                                            {{-- <div class="description">
                                                <div class="simple-article text size-2">Mollis nec consequat at In feugiat mole stie tortor a malesuada</div>
                                                <div class="icons">
                                                    <form action="{{ route('compare.store') }}" method="POST">
                                                        @csrf
                                                        <input type="hidden" name="id" value="{{ $product->id }}">
                                                        <input type="hidden" name="name" value="{{ $product->name }}">
                                                        <input type="hidden" name="price" value="{{ totalcash($product->price) }}">
                                                        <button class="entry"><i class="fa fa-check" aria-hidden="true"></i></button>
                                                    </form>
                                                    <a class="entry open-popup" data-rel="3"><i class="fa fa-eye" aria-hidden="true"></i></a>
                                                    <a class="entry"><i class="fa fa-heart-o" aria-hidden="true"></i></a>
                                                </div>
                                            </div> --}}
                                        </div>  
                                    </div>
                                @endforeach
                                @else
                                  <p>No product Found</p>
                                @endif 
                                
                            </div>
                        </div>
                    </div>
                    <div class="empty-space col-xs-b35 col-sm-b0"></div>
                    
                        <div class="col-sm-12 text-center">
                            {{ $products->appends(request()->input())->onEachSide(1)->links() }}                          
                        </div>
                        

                    <div class="empty-space col-xs-b35 col-md-b70"></div>
                    <div class="empty-space col-md-b70"></div>
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

                    {{-- <div class="empty-space col-xs-b25 col-sm-b50"></div>

                    <div class="h4 col-xs-b25">Price</div>
                    <div id="prices-range"></div>
                    <div class="simple-article size-1">PRICE: <b class="grey">$<span class="min-price">40</span> - $<span class="max-price">300</span></b></div>

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
                    </div> --}}

                    <div class="empty-space col-xs-b25 col-sm-b50"></div>


                </div>
            </div>
            
        </div>

        <div class="empty-space col-xs-b15 col-sm-b45"></div>
        <div class="empty-space col-md-b70"></div>
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

    <!-- range slider -->
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.ui.touch-punch.min.js"></script>
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
