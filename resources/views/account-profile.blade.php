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

  	<title>My Profile | {{config('app.name')}}</title>
</head>
@endsection
@section('main-content')

        <div class="header-empty-space"></div>

        <div class="container">
            <div class="empty-space col-xs-b20"></div>

            <h4>My Profile</h4>
                @include('inc.messages')

              <div class="card user-card">
                <div class="card-body">
                  <div class="media">
                   @include('inc.account')
                  <hr>
                  <form action="{{ route('users.update') }}" method="POST">
                    {{ csrf_field() }}
                    {{ method_field('patch') }}
                    <div class="form-row">
                      <div class="form-group col-sm-6">
                        <label for="profileFirstName">First Name</label>
                        <input name="name" type="text" class="form-control" id="profileFirstName" value="{{ old('name', $user->name) }}">
                      </div>
                      <div class="form-group col-sm-6">
                        <label for="profileLastName">Last Name</label>
                        <input name="lname" type="text" class="form-control" id="profileLastName" value="{{ old('name', $user->lname) }}">
                      </div>
                      <div class="form-group col-sm-6">
                        <label for="profileEmail">Email address</label>
                        <input type="email" name="email" class="form-control" id="profileEmail" value="{{ old('email', $user->email) }}">
                      </div>
                      <div class="form-group col-sm-6">
                        <label for="profilePhone">Phone Number</label>
                        <input name="phone" type="number" class="form-control" id="profilePhone" value="{{ old('phone', $user->phone) }}">
                      </div>
                      <div class="form-group col-sm-12">
                        <label for="profilePhone">Address</label>
                        <input name="address" type="text" class="form-control" id="profileAddress" value="{{ old('phone', $user->address) }}">
                      </div>
                      {{-- <div class="row"> --}}
                        <div class="col-md-6">
                          <div class="form-group">
                            <label>State</label>
                              <select class="form-control dynamic" name="state" id="ng_state_id" data-dependent="lga" required="">
                                  <option>Select State</option>
                                  @foreach($states as $state)
                                      <option value="{{$state->name}}" {{ $state->name == $user->state ? 'selected' : '' }}>{{$state->name}}</option>
                                  @endforeach
                              </select>
                              
                          </div>
                        </div>
                        <div class="col-md-6">
                          <label>Local Government</label>
                          <div class="form-group">
                              <select id="lga" name="lga" class="form-control" required="">
                                  <option >Select Local Government</option>
                                  @foreach($lgas as $lga)
                                      <option value="{{$lga->name}}" {{ $lga->name == $user->lga ? 'selected' :  '' }}>{{$lga->name}}</option>
                                  @endforeach
                              </select>
                              
                          </div>
                          {{-- {{ csrf_field() }} --}}
                        </div>
                      {{-- </div> --}}
                      <div class="form-group col-sm-6">
                        <label for="profilePassword">Password</label>
                        <input type="password" name="password" class="form-control" id="profilePassword">
                        <p><i>Leave password blank to keep current password</i></p>
                      </div>
                      <div class="form-group col-sm-6">
                        <label for="profileConfirmPassword">Confirm Password</label>
                        <input type="password" name="password_confirmation" class="form-control" id="profileConfirmPassword">
                      </div>
                      <div class="form-group col-12">
                      
                        <button type="submit" class="btn btn-success btn-block">SAVE</button>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
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
