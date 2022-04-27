<!DOCTYPE html>
<html lang="en">

<link rel="shortcut icon" href="img/favicon.ico" />
<script src="https://kit.fontawesome.com/dfbe4c7cae.js" crossorigin="anonymous"></script>
@yield('head')
<body>

    <!-- LOADER -->
    <div id="loader-wrapper"></div>

    <div id="content-block">
        <!-- HEADER -->
        <header>
            <div class="header-top">
                <div class="content-margins">
                    <div class="row">
                        <div class="col-md-5 hidden-xs hidden-sm">
                            <div class="entry"><b>contact us:</b> <a href="tel:+2349080897373">+2349080897373</a></div>
                            {{-- <div class="entry"><b>email:</b> <a href="mailto:office@mobilephonestore.com">office@mobilephonestore.com</a></div> --}}
                        </div>
                        <div class="col-md-7 col-md-text-right">
                            
                            
                            <div class="entry hidden-xs hidden-sm"><a href="{{ route('wishlist.index') }}"><i class="fa fa-heart-o" aria-hidden="true"></i></a></div>
                            <div class="entry hidden-xs hidden-sm cart">
                                <a href="{{ route('cart.index') }}">
                                    <b class="hidden-xs">Your bag</b>
                                    <span class="cart-icon">
                                        <i class="fa fa-shopping-bag" aria-hidden="true"></i>
                                        <span class="cart-label">
                                            @if(Cart::instance('default')->count() > 0)
                                              {{ Cart::instance('default')->count() }}
                                            @else
                                                0
                                            @endif  
                                        </span>
                                    </span>
                                    <span class="cart-title hidden-xs">$&#8358;{{ session()->has('coupon') ? number_format(session()->get('newTotal')) : number_format(Cart::total()) }}</span>
                                </a>
                                <div class="cart-toggle hidden-xs hidden-sm">
                                    <div class="cart-overflow">

                                        @if(Cart::instance('default')->count() > 0)
                                            @foreach(Cart::content() as $item)
                                        <div class="cart-entry clearfix">
                                            <a class="cart-entry-thumbnail" href="{{ route('shop.show', $item->model->slug) }}">
                                                <img src="{{ productImage($item->model->image) }}" alt="" style="width:100px;" />
                                            </a>
                                            <div class="cart-entry-description">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <div class="h6"><a href="{{ route('shop.show', $item->model->slug) }}">{{ $item->model->name}}</a></div>
                                                            <div class="simple-article size-1">QUANTITY: {{$item->qty}}</div>
                                                        </td>
                                                        <td>
                                                            <div class="simple-article size-3 grey">&#8358;{{ number_format($item->model->price)}}</div>
                                                            <div class="simple-article size-1">TOTAL: &#8358;{{ number_format($item->qty * $item->model->price)}}</div>
                                                        </td>
                                                        <td>
                                                            <div class="cart-color" style="background: #eee;"></div>
                                                        </td>
                                                        <td>
                                                            <form action="{{ route('cart.destroy', $item->rowId) }}" method="POST">
                                                                  @csrf
                                                                  {{ method_field('DELETE') }}
                                                                  <button type="submit"><div class="button-close"></div></button>
                                                              </form>
                                                            
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                        @endforeach
                                            @endif
                                        
                                        
                                    </div>
                                    <div class="empty-space col-xs-b40"></div>
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <div class="cell-view empty-space col-xs-b50">
                                                <div class="simple-article size-5 grey">TOTAL <span class="color">&#8358;{{ session()->has('coupon') ? number_format(session()->get('newTotal')) : number_format(Cart::total()) }}</span></div>
                                            </div>
                                        </div>
                                        <div class="col-xs-6 text-right">
                                            <a class="button size-2 style-3" href="{{ route('checkout.index') }}">
                                                <span class="button-wrapper">
                                                    <span class="icon"><img src="img/icon-4.png" alt=""></span>
                                                    <span class="text">proceed to checkout</span>
                                                </span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="hamburger-icon">
                                <span></span>
                                <span></span>
                                <span></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header-bottom">
                <div class="content-margins">
                    <div class="row">
                        <div class="col-xs-3 col-sm-1">
                            <a id="logo" href="{{ route('landing-page') }}"><img src="img/logo-2.png" alt="" /></a>  
                        </div>
                        <div class="col-xs-9 col-sm-11 text-right">
                            <div class="nav-wrapper">
                                <div class="nav-close-layer"></div>
                                <nav>
                                    <ul>
                                        <li>
                                            <a href="{{ route('landing-page') }}">Home</a>
                                        </li>
                                        <?php $i = 0; ?>
                                          @foreach($categories as $category)
                                          <?php $i++;?>
                                        <li class="{{ request()->category == $category->slug ? 'active' : ''}}">
                                            <a href="">{{$category->name}}</a>
                                            <div class="menu-toggle"></div>
                                            <ul>
                                                @foreach($allSubCategories as $allSubCategory)
                                                    @if($category->id == $allSubCategory->category_id)
                                                        <li><a href="{{ route('shop.index', ['subCategory' => $allSubCategory->name]) }}">{{$allSubCategory->name}}</a></li>
                                                    @endif
                                                @endforeach
                                            </ul>
                                        </li>
                                        @endforeach
                                        {{-- <li>
                                            <a href="about1.html">about us</a>
                                        </li> --}}
                                        <li>
                                            <a href="">My Account</a>
                                            <div class="menu-toggle"></div>
                                            <ul>
                                                @guest
                                                    <li><a href="/login">Login</a></li>
                                                    <li><a href="/register">Register</a></li>  
                                                @else
                                                <li>
                                                    <a href="{{ route('users.edit') }}"><i class="fa fa-user"></i> My Profile</a>
                                                </li>
                                               
                                                <li>
                                                    <a href="{{ route('orders.index') }}"><i class="fa fa-box"></i> My Orders</a>
                                                </li>
                                                <li>
                                                    <a href="{{ route('wishlist.index') }}"><i class="fa fa-heart"></i> Wishlist ({{Cart::instance('wishlist')->count()}})</a>
                                                </li>
                                                <li>
                                                    <a href="{{ route('logout') }}" onclick="event.preventDefault();             document.getElementById('logout-form').submit();"><i class="fa fa-sign-out-alt"></i> Logout</a>
                                                </li>
                                                <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                                  @csrf
                                              </form>
                                                @endguest                                                 
                                            </ul>
                                        </li>
                                        <li><a href="{{ route('contact') }}">contact</a></li>
                                    </ul>
                                    <div class="navigation-title">
                                        Navigation
                                        <div class="hamburger-icon active">
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                        </div>
                                    </div>
                                </nav>
                            </div>
                            <div class="header-bottom-icon toggle-search"><i class="fa fa-search" aria-hidden="true"></i></div>
                            <div class="header-bottom-icon visible-rd">
                                <a href="{{ route('wishlist.index') }}">
                                    <i class="fa fa-heart-o" aria-hidden="true"></i>
                                </a>                                
                            </div>
                            <div class="header-bottom-icon visible-rd">
                                <a href="{{ route('cart.index') }}">
                                    <i class="fa fa-shopping-bag" aria-hidden="true"></i>
                                    <span class="cart-label">
                                        @if(Cart::instance('default')->count() > 0)
                                          {{ Cart::instance('default')->count() }}
                                        @else
                                            0
                                        @endif 
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="header-search-wrapper">
                        <div class="header-search-content">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-sm-8 col-sm-offset-2 col-lg-6 col-lg-offset-3">
                                        <form  action="{{ route('search') }}" method="GET">
                                            @csrf
                                            <div class="search-submit">
                                                <i class="fa fa-search" aria-hidden="true"></i>
                                                <input type="submit"/>
                                            </div>
                                            <input class="simple-input style-1" type="text" name="item" value="{{ request()->input('item')}}" placeholder="Search for products..." />
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="button-close"></div>
                        </div>
                    </div>
                </div>
            </div>

        </header>


        @yield('main-content')

        <!-- FOOTER -->
        <footer>
            <div class="container">
                <div class="footer-top">
                    <div class="row">
                        <div class="col-sm-6 col-md-4 col-xs-b30 col-md-b0">
                            <img src="img/logo-1.png" alt="" />
                            <div class="empty-space col-xs-b20"></div>
                            <div class="simple-article size-2 light fulltransparent">Integer posuere orci sit amet feugiat pellent que. Suspendisse vel tempor justo, sit amet posuere orci dapibus auctor</div>
                            <div class="empty-space col-xs-b20"></div>
                            
                        </div>
                        <div class="col-sm-6 col-md-4 col-xs-b30 col-md-b0">
                            <h6 class="h6 light">quick links</h6>
                            <div class="empty-space col-xs-b20"></div>
                            <div class="footer-column-links">
                                <div class="row">
                                    <div class="col-xs-6">
                                        <a href="{{ route('about') }}">About us</a>
                                        <a href="{{ route('faq') }}">Faq</a>
                                        @auth
                                        <a href="{{ route('users.edit') }}">My account</a>
                                        @else
                                        <a href="/login">Login</a>
                                        @endauth
                                        <a href="{{ route('blog.index') }}">Blog</a>
                                        <a href="{{ route('contact') }}">Contacts</a>
                                        <a href="{{ route('policy') }}">Privacy Policy</a>
                                        <a href="{{ route('tandc') }}">Terms and Conditions</a>
                                    </div>
                                    <div class="col-xs-6">
                                        <?php $i = 0; ?>
                                          @foreach($categories as $category)
                                          <?php $i++;?>
                                        <a href="#">{{$category->name}}</a>
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-sm-6 col-md-4">
                            <h6 class="h6 light">Contact Info</h6>
                            <div class="empty-space col-xs-b20"></div>
                            <div class="footer-contact"><i class="fa fa-mobile" aria-hidden="true"></i> contact us: <a href="tel:+2349080897373">+2349080897373</a></div>
                            <div class="footer-contact"><i class="fa fa-envelope-o" aria-hidden="true"></i> email: <a href="mailto:office@mobilephonestore.com">office@mobilephonestore.com</a></div>
                            <div class="footer-contact"><i class="fa fa-map-marker" aria-hidden="true"></i> address: <a href="#">3 ILUPEJU WAY, IDUMOTA, LAGOS, NIGERIA</a></div>
                        </div>
                    </div>
                </div>
                <div class="footer-bottom">
                    <div class="row">
                        <div class="col-lg-8 col-xs-text-center col-lg-text-left col-xs-b20 col-lg-b0">
                            <div class="copyright">&copy; {{date('Y')}} All rights reserved. Development by Unit7 Communications</div>
                            <div class="follow">
                                <a class="entry" href="#"><i class="fa fa-facebook"></i></a>
                                <a class="entry" href="#"><i class="fa fa-twitter"></i></a>
                                <a class="entry" href="#"><i class="fa fa-linkedin"></i></a>
                                <a class="entry" href="#"><i class="fa fa-google-plus"></i></a>
                                <a class="entry" href="#"><i class="fa fa-pinterest-p"></i></a>
                            </div>
                        </div>
                        <div class="col-lg-4 col-xs-text-center col-lg-text-right">
                            <div class="footer-payment-icons">
                                <a class="entry"><img src="img/thumbnail-4.jpg" alt="" /></a>
                                <a class="entry"><img src="img/thumbnail-5.jpg" alt="" /></a>
                                <a class="entry"><img src="img/thumbnail-6.jpg" alt="" /></a>
                                <a class="entry"><img src="img/thumbnail-7.jpg" alt="" /></a>
                                <a class="entry"><img src="img/thumbnail-8.jpg" alt="" /></a>
                                <a class="entry"><img src="img/thumbnail-9.jpg" alt="" /></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </div>

    
    @yield('script')

</body>
</html>
