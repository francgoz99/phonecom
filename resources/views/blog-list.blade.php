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

  	<title>Blog | {{config('app.name')}}</title>
</head>
@endsection

@section('main-content')


        <div class="header-empty-space"></div>

        <div class="container">
            <div class="empty-space col-xs-b15 col-sm-b30"></div>
            <div class="breadcrumbs">
                <a href="{{ route('landing-page') }}">home</a>
                <a href="#">blog</a>
            </div>
            <div class="empty-space col-xs-b15 col-sm-b50 col-md-b100"></div>
            <div class="text-center">
                {{-- <div class="simple-article size-3 grey uppercase col-xs-b5">popular products</div> --}}
                <div class="h2">{{config('app.name')}} &amp; Blog</div>
                <div class="title-underline center"><span></span></div>
            </div>
        </div>

        <div class="empty-space col-xs-b35 col-md-b70"></div>

        <div class="container">
            <div class="row">
                <div class="col-md-9">
                    @if($posts->count() > 0)
                     @foreach($posts as $post)
                    <div class="blog-shortcode style-3">
                        <a class="preview rounded-image simple-mouseover" href="{{ route('blog.show', $post->slug) }}"><img class="rounded-image" src="{{ productImage($post->image) }}" alt="" /></a>
                        <div class="date">
                            <span>{!! $post->created_at->format('d') !!}</span> {!! $post->created_at->format('M / Y') !!}
                        </div>
                        <div class="content">
                            <div class="blog-comments">{{--<i class="fa fa-comment-o" aria-hidden="true"></i> 5  &nbsp;&nbsp;&nbsp;<i class="fa fa-heart-o" aria-hidden="true"></i> 20 --}}</div>
                            <h4 class="title h4"><a href="{{ route('blog.show', $post->slug) }}">{!! $post->title !!}</a></h4>
                            <div class="description simple-article size-1 grey uppercase"><a class="color" href="{{ route('blog.show', $post->slug) }}">Admin</a> &nbsp;&nbsp;<a class="color" href="{{ route('blog.show', $post->slug) }}">...</a></div>
                            <div class="description-article simple-article size-2">{{str_limit(strip_tags($post->body), $limit = 100, $end = '...')}}</div>
                            <a class="button size-2 style-3" href="{{ route('blog.show', $post->slug) }}">
                                <span class="button-wrapper">
                                    <span class="icon"><img src="img/icon-4.png" alt=""></span>
                                    <span class="text">learn more</span>
                                </span>
                            </a>
                        </div>
                    </div>

                    <div class="empty-space col-xs-b35 col-md-b70"></div>
                    @endforeach

                  @else
                  <p>No Post yet!</p>
                  @endif                  

                    


                    <div class="row">
                        {{-- <div class="col-sm-3 hidden-xs">
                            <a class="button size-1 style-5" href="#">
                                <span class="button-wrapper">
                                    <span class="icon"><i class="fa fa-angle-left" aria-hidden="true"></i></span>
                                    <span class="text">prev page</span>
                                </span>
                            </a>
                        </div> --}}
                        <div class="col-sm-6 text-center">
                            <div class="pagination-wrapper">
                                {{ $posts->appends(request()->input())->links() }}
                            </div>
                        </div>
                        {{-- <div class="col-sm-3 hidden-xs text-right">
                            <a class="button size-1 style-5" href="#">
                                <span class="button-wrapper">
                                    <span class="icon"><i class="fa fa-angle-right" aria-hidden="true"></i></span>
                                    <span class="text">prev page</span>
                                </span>
                            </a>
                        </div> --}}
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
                    <ul class="categories-menu transparent">
                        <?php $i = 0; ?>
                          @foreach($categories as $category)
                          <?php $i++;?>
                        <li><a href="#">{{$category->name}}</a></li>
                        @endforeach
                        
                    </ul>

                    <div class="empty-space col-xs-b25 col-sm-b50"></div>

                    <div class="h4 col-xs-b25">Popular Posts</div>
                    @if($populars->count() > 0)
                       @foreach($populars as $popular)
                            <div class="blog-shortcode style-2">
                                <a href="{{ route('blog.show', $popular->slug) }}" class="preview rounded-image simple-mouseover"><img class="rounded-image" src="img/thumbnail-73.jpg" alt="{!!$popular->title!!}" /></a>
                                <div class="title h6"><a href="{{ route('blog.show', $popular->slug) }}">{!!$popular->title!!}</a></div>
                                <div class="description simple-article size-1 grey uppercase">
                                    {!! $popular->created_at->format('M d') !!} / {!! $popular->created_at->format('Y') !!} </div>
                            </div>
                            <div class="empty-space col-xs-b25"></div>
                        @endforeach
                     @else
                    <p>No Popular Post this week</p>
                    @endif
                  


                    

                </div>
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

    <!-- masonry -->
    <script src="js/isotope.pkgd.min.js"></script>
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
