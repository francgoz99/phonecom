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

  	<title>{!!$post->title!!} | {{config('app.name')}}</title>
    <meta name="keywords" content="{!! str_limit($post->meta_keywords, 60) !!}">
    <meta name="description" content="{!! str_limit($post->body, 150) !!}">
</head>
@endsection

@section('main-content')    


        <div class="header-empty-space"></div>

        <div class="container">
            <div class="empty-space col-xs-b15 col-sm-b30"></div>
            <div class="breadcrumbs">
                <a href="{{ route('landing-page') }}">home</a>
                <a href="{{ route('blog.index') }}">blog</a>
                <a>{!!$post->title!!}</a>
            </div>
            <div class="empty-space col-xs-b15 col-sm-b50 col-md-b100"></div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-9">
                    <div class="row">
                        <div class="col-sm-8">
                            <div class="simple-article size-1 grey uppercase col-xs-b10">{{$post->created_at->format('M d / Y')}} &nbsp;&nbsp;<a class="color" href="#">Admin</a> &nbsp;&nbsp;<a class="color" href="#"></a></div>
                            <h1 class="h3 col-xs-b5 col-sm-b30">{!!$post->title!!}</h1>
                        </div>
                        <div class="col-sm-4 col-sm-text-right">
                            <div class="blog-comments"><i class="fa fa-comment-o" aria-hidden="true"></i> 5 &nbsp;&nbsp;&nbsp;<i class="fa fa-heart-o" aria-hidden="true"></i> 20</div>
                        </div>
                    </div>
                    <div class="simple-article size-2">
                        <div class="embed-responsive embed-responsive-16by9">
                            <img src="{{ productImage($post->image) }}">
                        </div>
                        <h5>{!!$post->title!!}</h5>
                        {!!$post->body!!}
                        
                    </div>
                    {{-- <div class="empty-space col-xs-b30"></div>
                    <div class="row">
                        <div class="col-sm-6 col-xs-b15 col-sm-b0">
                            <div class="tags light clearfix">
                                <span class="title">tags:</span>
                                <a class="tag">headphoness</a>
                                <a class="tag">accessories</a>
                                <a class="tag">new</a>
                            </div>
                        </div>
                        <div class="col-sm-6 col-sm-text-right">
                            <div class="follow light">
                                <span class="title">share:</span>
                                <a class="entry" href="#"><i class="fa fa-facebook"></i></a>
                                <a class="entry" href="#"><i class="fa fa-twitter"></i></a>
                                <a class="entry" href="#"><i class="fa fa-linkedin"></i></a>
                                <a class="entry" href="#"><i class="fa fa-google-plus"></i></a>
                                <a class="entry" href="#"><i class="fa fa-pinterest-p"></i></a>
                            </div>
                        </div>
                    </div> --}}

                    <div class="empty-space col-xs-b35 col-md-b70"></div>
                    <div class="empty-space col-xs-b35 col-md-b70"></div>

                    <div class="simple-article size-3 grey uppercase col-xs-b5">related posts</div>
                    <div class="h3">something interesting too</div>
                    <div class="title-underline left"><span></span></div>
                    <div class="empty-space col-xs-b35"></div>

                    <div class="row">
                        @if($populars->count() > 0)
                        @foreach($populars as $popular)
                            <div class="col-sm-4 col-xs-b30 col-sm-b0">
                                <div class="icon-description-shortcode style-2">
                                    <a href="{{ route('blog.show', $popular->slug) }}" class="image-icon simple-mouseover rounded-image">
                                        <img class="image-thumbnail rounded-image" src="{{ productImage($popular->image) }}" alt="" />
                                    </a>
                                    <div class="content">
                                        <h6 class="title h6"><a href="{{ route('blog.show', $popular->slug) }}">{!!$popular->title!!}</a></h6>
                                        <div class="subtitle simple-article size-1 grey uppercase col-xs-b10">{{$popular->created_at->format('M d / Y')}} &nbsp;&nbsp;<a class="color" href="{{ route('blog.show', $popular->slug) }}">Admin</a> &nbsp;&nbsp;<a class="color" href="{{ route('blog.show', $popular->slug) }}"></a></div>
                                        <div class="description simple-article size-2">{{str_limit(strip_tags($popular->body), $limit = 100, $end = '...')}}</div>
                                        <a class="button size-1 style-3" href="{{ route('blog.show', $popular->slug) }}">
                                            <span class="button-wrapper">
                                                <span class="icon"><img src="img/icon-4.png" alt=""></span>
                                                <span class="text">learn more</span>
                                            </span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                        @else
                        <p>No Popular Post this week</p>
                        @endif

                        

                    </div>

                    <div class="empty-space col-xs-b35 col-md-b70"></div>
                    <div class="empty-space col-xs-b35 col-md-b70"></div>

                    {{-- <div class="simple-article size-3 grey uppercase col-xs-b5">testimonials</div> --}}
                    <div class="h3">Comment(s)</div>
                    <div class="title-underline left"><span></span></div>

                    <div class="empty-space col-xs-b15 col-md-b50"></div>

                    <div class="comments-wrapper">
                        @if($comments->count() > 0)
                            @foreach($comments as $comment)

                        <div class="comment-entry">
                            <div class="comment-top">
                                <img class="image" src="img/thumbnail-84.jpg" alt="" />
                                <div class="content">
                                    <h6 class="h6 col-xs-b5">{{$comment->name}}</h6>
                                    <div class="simple-article size-1 grey uppercase">{{$comment->created_at->format('M d / Y')}}</div>
                                </div>
                                <div class="simple-article size-2">{{$comment->body}}</div>
                               {{--  <a class="button size-1 style-5" href="#">
                                    <span class="button-wrapper">
                                        <span class="icon"><i class="fa fa-comment-o" aria-hidden="true"></i></span>
                                        <span class="text">reply</span>
                                    </span>
                                </a> --}}
                            </div>
                            <div class="empty-space col-xs-b35"></div>
                        </div>
                        @endforeach
                          @else
                          <div class="comment-entry">
                                <p>No Comment yet!</p>
                            </div>
                          @endif
                    </div>
                    <hr>
                    <div class="empty-space col-xs-b15"></div>
                    <div class="row m10">
                        <div class="h3">Comment below</div>
                        <form action="{{ route('blog.store') }}" method="POST">
                            @csrf
                            
                            <input type="hidden" name="post_id" value="{{$post->id}}">
                            <div class="col-sm-12">
                                <textarea name="body" class="simple-input" placeholder="Your Message"></textarea>
                                <div class="empty-space col-xs-b20"></div>
                            </div>
                            <div class="col-sm-12 text-right">
                                <div class="button size-2 style-3">
                                    <span class="button-wrapper">
                                        <span class="icon"><img src="img/icon-4.png" alt=""></span>
                                        <span class="text">submit</span>
                                    </span>
                                    <input type="submit"/>
                                </div>
                            </div>
                        </form>
                        
                    </div>
                    
                    <div class="empty-space col-xs-b35 col-md-b70"></div>

                </div>
                <div class="col-md-3">
                    <div class="single-line-form">
                        <input class="simple-input small" type="text" value="" placeholder="Enter keyword">
                        <div class="submit-icon">
                            <i class="fa fa-search" aria-hidden="true"></i>
                            <input type="submit"/>
                        </div>
                    </div>
                    <div class="empty-space col-xs-b25 col-sm-b50"></div>

                    <div class="h4 col-xs-b10">categories</div>
                    <ul class="categories-menu alignleft">
                        <li>
                            <a href="#">laptops &amp; computers</a>
                            <div class="toggle"></div>
                            <ul>
                                <li>
                                    <a href="#">laptops &amp; computers</a>
                                    <div class="toggle"></div>
                                    <ul>
                                        <li>
                                            <a href="#">laptops &amp; computers</a>
                                        </li>
                                        <li>
                                            <a href="#">video &amp; photo cameras</a>
                                        </li>
                                        <li>
                                            <a href="#">smartphones</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">video &amp; photo cameras</a>
                                    <div class="toggle"></div>
                                    <ul>
                                        <li>
                                            <a href="#">video &amp; photo cameras</a>
                                        </li>
                                        <li>
                                            <a href="#">smartphones</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">smartphones</a>
                                </li>
                                <li>
                                    <a href="#">tv &amp; audio</a>
                                </li>
                                <li>
                                    <a href="#">gadgets</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">video &amp; photo cameras</a>
                            <div class="toggle"></div>
                            <ul>
                                <li>
                                    <a href="#">laptops &amp; computers</a>
                                    <div class="toggle"></div>
                                    <ul>
                                        <li>
                                            <a href="#">laptops &amp; computers</a>
                                        </li>
                                        <li>
                                            <a href="#">video &amp; photo cameras</a>
                                        </li>
                                        <li>
                                            <a href="#">smartphones</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">video &amp; photo cameras</a>
                                    <div class="toggle"></div>
                                    <ul>
                                        <li>
                                            <a href="#">laptops &amp; computers</a>
                                        </li>
                                        <li>
                                            <a href="#">smartphones</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">smartphones</a>
                                </li>
                                <li>
                                    <a href="#">tv &amp; audio</a>
                                </li>
                                <li>
                                    <a href="#">gadgets</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">smartphones</a>
                            <div class="toggle"></div>
                            <ul>
                                <li>
                                    <a href="#">laptops &amp; computers</a>
                                    <div class="toggle"></div>
                                    <ul>
                                        <li>
                                            <a href="#">laptops &amp; computers</a>
                                        </li>
                                        <li>
                                            <a href="#">video &amp; photo cameras</a>
                                        </li>
                                        <li>
                                            <a href="#">smartphones</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">video &amp; photo cameras</a>
                                    <div class="toggle"></div>
                                    <ul>
                                        <li>
                                            <a href="#">video &amp; photo cameras</a>
                                        </li>
                                        <li>
                                            <a href="#">smartphones</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">smartphones</a>
                                </li>
                                <li>
                                    <a href="#">tv &amp; audio</a>
                                </li>
                                <li>
                                    <a href="#">gadgets</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">tv &amp; audio</a>
                            <div class="toggle"></div>
                            <ul>
                                <li>
                                    <a href="#">laptops &amp; computers</a>
                                    <div class="toggle"></div>
                                    <ul>
                                        <li>
                                            <a href="#">laptops &amp; computers</a>
                                        </li>
                                        <li>
                                            <a href="#">video &amp; photo cameras</a>
                                        </li>
                                        <li>
                                            <a href="#">smartphones</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">video &amp; photo cameras</a>
                                    <div class="toggle"></div>
                                    <ul>
                                        <li>
                                            <a href="#">video &amp; photo cameras</a>
                                        </li>
                                        <li>
                                            <a href="#">smartphones</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">smartphones</a>
                                </li>
                                <li>
                                    <a href="#">tv &amp; audio</a>
                                </li>
                                <li>
                                    <a href="#">gadgets</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">gadgets</a>
                            <div class="toggle"></div>
                            <ul>
                                <li>
                                    <a href="#">laptops &amp; computers</a>
                                    <div class="toggle"></div>
                                    <ul>
                                        <li>
                                            <a href="#">laptops &amp; computers</a>
                                        </li>
                                        <li>
                                            <a href="#">video &amp; photo cameras</a>
                                        </li>
                                        <li>
                                            <a href="#">smartphones</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">video &amp; photo cameras</a>
                                    <div class="toggle"></div>
                                    <ul>
                                        <li>
                                            <a href="#">video &amp; photo cameras</a>
                                        </li>
                                        <li>
                                            <a href="#">smartphones</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">smartphones</a>
                                </li>
                                <li>
                                    <a href="#">tv &amp; audio</a>
                                </li>
                                <li>
                                    <a href="#">gadgets</a>
                                </li>
                            </ul>
                        </li>
                    </ul>

                    <div class="empty-space col-xs-b25 col-sm-b50"></div>

                    <div class="h4 col-xs-b25">Popular Tags</div>
                    <div class="blog-shortcode style-2">
                        <a href="#" class="preview rounded-image simple-mouseover"><img class="rounded-image" src="img/thumbnail-73.jpg" alt="" /></a>
                        <div class="title h6"><a href="#">Phasellus rhoncus in nunc sit</a></div>
                        <div class="description simple-article size-1 grey uppercase">apr 07 / 15 &nbsp;&nbsp;<a class="color" href="#">john wick</a> &nbsp;&nbsp;<a class="color" href="#">Gadgets</a></div>
                    </div>
                    <div class="empty-space col-xs-b25"></div>
                    <div class="blog-shortcode style-2">
                        <a href="#" class="preview rounded-image simple-mouseover"><img class="rounded-image" src="img/thumbnail-74.jpg" alt="" /></a>
                        <div class="title h6"><a href="#">Fusce viverra id diam nec</a></div>
                        <div class="description simple-article size-1 grey uppercase">apr 07 / 15 &nbsp;&nbsp;<a class="color" href="#">john wick</a> &nbsp;&nbsp;<a class="color" href="#">Gadgets</a></div>
                    </div>

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

                    <div class="empty-space col-xs-b25 col-sm-b50"></div>

                    <div class="h4 col-xs-b25">youtube chanel</div>

                    <div class="swiper-container" data-breakpoints="1" data-xs-slides="1" data-sm-slides="2" data-md-slides="1" data-lt-slides="1"  data-slides-per-view="1" data-space="30">
                        <div class="swiper-button-prev hidden"></div>
                        <div class="swiper-button-next hidden"></div>
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <div class="blog-shortcode style-2">
                                    <a class="preview rounded-image">
                                        <img class="rounded-image" src="img/thumbnail-75.jpg" alt="" />
                                        <span class="play-button open-video" data-src="https://www.youtube.com/embed/kQT2y3UiosQ?autoplay=1&amp;loop=1&amp;modestbranding=1&amp;rel=0&amp;showinfo=0&amp;color=white&amp;theme=light&amp;wmode=transparent"></span>
                                    </a>
                                    <div class="title h6"><a href="#">Phasellus rhoncus in nunc sit</a></div>
                                    <div class="description simple-article size-1 grey">Duis fringilla felis et faucibus semper. Aliquam gravida elit et lectus viverra porta.</div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="blog-shortcode style-2">
                                    <a class="preview rounded-image">
                                        <img class="rounded-image" src="img/thumbnail-76.jpg" alt="" />
                                        <span class="play-button open-video" data-src="https://www.youtube.com/embed/kQT2y3UiosQ?autoplay=1&amp;loop=1&amp;modestbranding=1&amp;rel=0&amp;showinfo=0&amp;color=white&amp;theme=light&amp;wmode=transparent"></span>
                                    </a>
                                    <div class="title h6"><a href="#">Phasellus rhoncus in nunc sit</a></div>
                                    <div class="description simple-article size-1 grey">Duis fringilla felis et faucibus semper. Aliquam gravida elit et lectus viverra porta.</div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-pagination relative-pagination-small"></div>
                    </div>


                    <div class="empty-space col-xs-b25 col-sm-b50"></div>

                </div>
            </div>
        </div>

        <div class="empty-space col-xs-b35 col-md-b70"></div>
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

    <!-- masonry -->
    <script src="{{asset('')}}js/isotope.pkgd.min.js"></script>
    <script>
        $(window).load(function(){
            var $container = $('.grid').isotope({
                itemSelector: '.grid-item',
                masonry: {
                    columnWidth: '.grid-sizer'
                }
            });
        });
    </script>
@endsection
