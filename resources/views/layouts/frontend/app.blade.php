<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title> @yield('title') - {{ config('app.name', 'Blog') }}</title>
    <link rel="shortcut icon" href="{{asset('public/assets/backend/favicon.png')}}" type="image/x-icon">

    <link href="{{asset('public/assets/frontend/common-css/bootstrap.css')}}" rel="stylesheet">

    <link href="{{asset('public/assets/frontend/common-css/swiper.css')}}" rel="stylesheet">

    <link href="{{asset('public/assets/frontend/common-css/ionicons.css')}}" rel="stylesheet">
    <link rel="stylesheet" href="{{asset('public/assets/frontend/toastr/css/toastr.min.css')}}">
    <style>
        footer .input-area {
            position: relative;
            height: 50px;
            width: 100%;
            box-shadow: 0px 0px 1px #bbb;
            background: #F5F7F6;
        }

        footer .input-area .email-input {
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            width: 100%;
            padding: 0 70px 0 20px;
            background: transparent;
            border: 0;
            outline: 0;
        }

        footer .input-area .submit-btn {
            position: absolute;
            top: 0;
            bottom: 0;
            right: 0;
            width: 50px;
            background: none;
            border: 0;
            outline: 0;
            margin-right: 10px;
            opacity: .8;
            cursor: pointer;
            transition: all .2s;
        }
    </style>
    @stack('css')


</head>
<body>
@include('layouts.frontend.partials.header')

@yield('content')


@include('layouts.frontend.partials.footer')


<script src="{{asset('public/assets/frontend/common-js/jquery-3.1.1.min.js')}}"></script>

<script src="{{asset('public/assets/frontend/common-js/tether.min.js')}}"></script>

<script src="{{asset('public/assets/frontend/common-js/bootstrap.js')}}"></script>

<script src="{{asset('public/assets/frontend/common-js/swiper.js')}}"></script>

<script src="{{asset('public/assets/frontend/common-js/scripts.js')}}"></script>

<script src="{{asset('public/assets/frontend/toastr/js/toastr.min.js')}}"></script>
{!! Toastr::message() !!}

<script>
    @if ($errors->any())
    @foreach ($errors->all() as $error)
    toastr.error('{{$error}}', 'Error', {
        closeButton: true,
        progressBar: true,
    });
    @endforeach
    @endif
</script>

@stack('js')
</body>
</html>
