<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<!-- If you delete this meta tag, the ground will open and swallow you. -->
<meta name="viewport" content="width=device-width" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Amazing Product of the week | {{config('app.name')}}</title>
<style >
  /* ------------------------------------- 
    GLOBAL 
------------------------------------- */
* { 
  margin:0;
  padding:0;
}
* { font-family: "Helvetica Neue", "Helvetica", Helvetica, Arial, sans-serif; }

img { 
  max-width: 100%; 
}
.collapse {
  margin:0;
  padding:0;
}
body {
  -webkit-font-smoothing:antialiased; 
  -webkit-text-size-adjust:none; 
  width: 100%!important; 
  height: 100%;
}


/* ------------------------------------- 
    ELEMENTS 
------------------------------------- */
a { color: #2BA6CB;}

.btn {
  text-decoration:none;
  color: #FFF;
  background-color: #666;
  padding:10px 16px;
  font-weight:bold;
  margin-right:10px;
  text-align:center;
  cursor:pointer;
  display: inline-block;
}

p.callout {
  padding:15px;
  background-color:#ECF8FF;
  margin-bottom: 15px;
}
.callout a {
  font-weight:bold;
  color: #2BA6CB;
}

table.social {
/*  padding:15px; */
  background-color: #ebebeb;
  
}
.social .soc-btn {
  padding: 3px 7px;
  font-size:12px;
  margin-bottom:10px;
  text-decoration:none;
  color: #FFF;font-weight:bold;
  display:block;
  text-align:center;
}
a.fb { background-color: #3B5998!important; }
a.tw { background-color: #1daced!important; }
a.gp { background-color: #DB4A39!important; }
a.ms { background-color: #000!important; }

.sidebar .soc-btn { 
  display:block;
  width:100%;
}

/* ------------------------------------- 
    HEADER 
------------------------------------- */
table.head-wrap { width: 100%;}

.header.container table td.logo { padding: 15px; }
.header.container table td.label { padding: 15px; padding-left:0px;}


/* ------------------------------------- 
    BODY 
------------------------------------- */
table.body-wrap { width: 100%;}


/* ------------------------------------- 
    FOOTER 
------------------------------------- */
table.footer-wrap { width: 100%;  clear:both!important;
}
.footer-wrap .container td.content  p { border-top: 1px solid rgb(215,215,215); padding-top:15px;}
.footer-wrap .container td.content p {
  font-size:10px;
  font-weight: bold;
  
}


/* ------------------------------------- 
    TYPOGRAPHY 
------------------------------------- */
h1,h2,h3,h4,h5,h6 {
font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif; line-height: 1.1; margin-bottom:15px; color:#000;
}
h1 small, h2 small, h3 small, h4 small, h5 small, h6 small { font-size: 60%; color: #6f6f6f; line-height: 0; text-transform: none; }

h1 { font-weight:200; font-size: 44px;}
h2 { font-weight:200; font-size: 37px;}
h3 { font-weight:500; font-size: 27px;}
h4 { font-weight:500; font-size: 23px;}
h5 { font-weight:900; font-size: 17px;}
h6 { font-weight:900; font-size: 14px; text-transform: uppercase; color:#444;}

.collapse { margin:0!important;}

p, ul { 
  margin-bottom: 10px; 
  font-weight: normal; 
  font-size:14px; 
  line-height:1.6;
}
p.lead { font-size:17px; }
p.last { margin-bottom:0px;}

ul li {
  margin-left:5px;
  list-style-position: inside;
}

/* ------------------------------------- 
    SIDEBAR 
------------------------------------- */
ul.sidebar {
  background:#ebebeb;
  display:block;
  list-style-type: none;
}
ul.sidebar li { display: block; margin:0;}
ul.sidebar li a {
  text-decoration:none;
  color: #666;
  padding:10px 16px;
/*  font-weight:bold; */
  margin-right:10px;
/*  text-align:center; */
  cursor:pointer;
  border-bottom: 1px solid #777777;
  border-top: 1px solid #FFFFFF;
  display:block;
  margin:0;
}
ul.sidebar li a.last { border-bottom-width:0px;}
ul.sidebar li a h1,ul.sidebar li a h2,ul.sidebar li a h3,ul.sidebar li a h4,ul.sidebar li a h5,ul.sidebar li a h6,ul.sidebar li a p { margin-bottom:0!important;}



/* --------------------------------------------------- 
    RESPONSIVENESS
    Nuke it from orbit. It's the only way to be sure. 
------------------------------------------------------ */

/* Set a max-width, and make it display as block so it will automatically stretch to that width, but will also shrink down on a phone or something */
.container {
  display:block!important;
  max-width:600px!important;
  margin:0 auto!important; /* makes it centered */
  clear:both!important;
}

/* This should also be a block element, so that it will fill 100% of the .container */
.content {
  padding:15px;
  max-width:600px;
  margin:0 auto;
  display:block; 
}

/* Let's make sure tables in the content area are 100% wide */
.content table { width: 100%; }


/* Odds and ends */
.column {
  width: 300px;
  float:left;
}
.column tr td { padding: 15px; }
.column-wrap { 
  padding:0!important; 
  margin:0 auto; 
  max-width:600px!important;
}
.column table { width:100%;}
.social .column {
  width: 280px;
  min-width: 279px;
  float:left;
}

/* Be sure to place a .clear element after each set of columns, just to be safe */
.clear { display: block; clear: both; }


/* ------------------------------------------- 
    PHONE
    For clients that support media queries.
    Nothing fancy. 
-------------------------------------------- */
@media only screen and (max-width: 600px) {
  
  a[class="btn"] { display:block!important; margin-bottom:10px!important; background-image:none!important; margin-right:0!important;}

  div[class="column"] { width: auto!important; float:none!important;}
  
  table.social div[class="column"] {
    width:auto!important;
  }

}
</style>

</head>
 <?php
use App\Product;

function getName($id)
  {
    $product = Product::find($id);
    if(!$product)
      {
        return 'Null';
      }
    return $product->name;  
  }

function getPrice($id)
  {
    $product = Product::find($id);
    if(!$product)
      {
        return 'Null';
      }
    $total = $product->price + $product->profit;
    $paystack = 0.015 * $total;
    $totalPrice = $total + $paystack;
    return round($totalPrice, -1); 
  }
function getSlug($id)
  {
    $product = Product::find($id);
    if(!$product)
      {
        return 'Null';
      }
    return $product->slug;  
  }
function getImage($id)
  {
    $product = Product::find($id);
    if(!$product)
      {
        return 'Null';
      }
    return $product->image; 
  }   
function getDetails($id)
  {
    $product = Product::find($id);
    if(!$product)
      {
        return 'Null';
      }
    return $product->details; 
  }


?>
<body bgcolor="#FFFFFF" topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">

<!-- HEADER -->
<table class="head-wrap" bgcolor="#999999">
  <tr>
    <td></td>
    <td class="header container" align="">
      
      <!-- /content -->
      <div class="content">
        <table bgcolor="#999999">
          <tr>
            <td><img src="{{config('app.url')}}img/logo.png" width="100" /></td>
            <td align="right"><h6 class="collapse">{{config('app.name')}}</h6></td>
          </tr>
        </table>
      </div>
      <!-- /content -->
      
    </td>
    <td></td>
  </tr>
</table><!-- /HEADER -->

<!-- BODY -->
<table class="body-wrap" bgcolor="">
  <tr>
    <td></td>
    <td class="container" align="" bgcolor="#FFFFFF">
      
      <!-- content -->
      <div class="content">
        <table>
          <tr>
            <td>
              
              <h1>Amazing Product of the week</h1>
              <p class="lead">We hand-picked products our customers liked. We hope you would love them too. </p>
              

            </td>
          </tr>
        </table>
      </div><!-- /content -->
      
      @foreach($productID as $id)
      <!-- content -->
      <div class="content">
        
        <table bgcolor="">
          <tr>
            <td class="small" width="35%" style="vertical-align: top; padding-right:10px;"><img src="{{config('app.url')}}/storage/{{getImage($id)}}" alt="{{getName($id)}} image" /></td>
            <td>
              <h4>{{getName($id)}} <small>&#8358;{{ number_format( getPrice($id) )}}</small></h4>
              <p class="">Detail(s): {{ str_limit(getDetails($id), 100)}}</p>
              <a class="btn" href="{{config('app.url')}}{{getSlug($id)}}/shop">View &raquo;</a>
            </td>
          </tr>
        </table>
      
      </div><!-- /content -->
      @endforeach     

      
      <!-- content -->
      <div class="content">
        <table bgcolor="">
          <tr>
            <td>
              
              <!-- social & contact -->
              <table bgcolor="" class="social" width="100%">
                <tr>
                  <td>
                    
                    <!--- column 1 -->
                    <div class="column">
                      <table bgcolor="" cellpadding="" align="left">
                    <tr>
                      <td>        
                        
                        <h5 class="">Connect with Us:</h5>
                        <p class="">
                          <a href="https://www.facebook.com/" class="soc-btn fb">Facebook</a> 
                          <a href="#" class="soc-btn tw">Twitter</a> 
                          <a href="mailto:contact@testechelectrical.com" class="soc-btn gp">Google+</a>
                        </p>
            
                        
                      </td>
                    </tr>
                  </table><!-- /column 1 -->
                    </div>
                    
                    <!--- column 2 -->
                    <div class="column">
                      <table bgcolor="" cellpadding="" align="left">
                    <tr>
                      <td>        
                                      
                        <h5 class="">Contact Info:</h5>                       
                        <p>Phone: <strong><a href="tel:+2347031382795">07031382795</a></strong><br/>
                Email: <strong><a href="mailto:contact@testechelectrical.com">contact@testechelectrical.com</a></strong></p>
                
                      </td>
                    </tr>
                  </table><!-- /column 2 -->  
                    </div>
                    
                    <div class="clear"></div>
  
                  </td>
                </tr>
              </table><!-- /social & contact -->
              
            </td>
          </tr>
        </table>
      </div><!-- /content -->
      

    </td>
    <td></td>
  </tr>
</table><!-- /BODY -->

<!-- FOOTER -->
<table class="footer-wrap">
  <tr>
    <td></td>
    <td class="container">
      
        <!-- content -->
        <div class="content">
          <table>
            <tr>
              <td align="center">
                <p>
                  <a href="#">Terms</a> |
                  <a href="#">Privacy</a> |
                  <a href="#"><unsubscribe>Unsubscribe</unsubscribe></a>
                </p>
              </td>
            </tr>
          </table>
        </div><!-- /content -->
        
    </td>
    <td></td>
  </tr>
</table><!-- /FOOTER -->

</body>
</html>