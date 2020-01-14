@extends('layouts.frontend.app')

@section('title','single post')

@push('css')
    <link href="{{asset('assets/frontend/category-sidebar/css/styles.css')}}" rel="stylesheet">

    <link href="{{asset('assets/frontend/category-sidebar/css/responsive.css')}}" rel="stylesheet">

<style>
        .slider {
            height: 400px;
            width: 100%;
            background-image: url({{asset('uploads/category/'.$category->image)}});
            background-size: cover;
        }
    .favorite_posts{
        color:green;
    }
</style>
@endpush

@section('content')
<div class="slider display-table center-text">
    <h1 class="title display-table-cell"><b>{{$category->name}}</b></h1>
</div><!-- slider -->


<section class="blog-area section">
    <div class="container">

        <div class="row">

            <div class="col-lg-12 col-md-12">
                <div class="row">
                    @if ($category->posts->count() > 0)

                    @foreach ($category->posts as $post)
                    <div class="col-lg-4 col-md-6">
                        <div class="card h-100">
                            <div class="single-post post-style-1">

                                <div class="blog-image"><img src="{{asset('uploads/post/'.$post->image)}}" alt="Blog Image"></div>

                                <a class="avatar" href="#"><img src="{{asset('uploads/user/'.$post->user->image)}}" alt="Profile Image"></a>

                                <div class="blog-info">

                                    <h4 class="title"><a href="{{route('post.details',$post->slug)}}"><b>{{$post->title}}</b></a></h4>

                                    <ul class="post-footer">
                                            <li>
                                                    @guest
                                                        <a href="javascript:void(0);" onclick="toastr.info('To add favorite list. You need to login first.','Info',{
                                                            closeButton: true,
                                                            progressBar: true,
                                                        })"><i class="ion-heart"></i>{{ $post->favorite_to_users->count() }}</a>
                                                    @else
                                                        <a href="javascript:void(0);" onclick="document.getElementById('favorite-form-{{ $post->id }}').submit();"
                                                           class="{{ !Auth::user()->favorite_posts->where('pivot.post_id',$post->id)->count()  == 0 ? 'favorite_posts' : ''}}"><i class="ion-heart"></i>{{ $post->favorite_to_users->count() }}</a>

                                                        <form id="favorite-form-{{ $post->id }}" method="POST" action="{{ route('post.favorite',$post->id) }}" style="display: none;">
                                                            @csrf
                                                        </form>
                                                    @endguest

                                                </li>
                                                <li>
                                                    <a href="#"><i class="ion-chatbubble"></i>{{ $post->comments->count() }}</a>
                                                </li>
                                                <li>
                                                    <a href="#"><i class="ion-eye"></i>{{ $post->view_count }}</a>
                                                </li>
                                    </ul>

                                </div><!-- blog-info -->
                            </div><!-- single-post -->
                        </div><!-- card -->
                    </div><!-- col-lg-4 col-md-6 -->
                    @endforeach
                      @else
                      <div class="col-lg-4 col-md-6">
                            <div class="card h-100">
                                <div class="single-post post-style-1">

                                  <h4 class="title">No post found</h4>


                            </div><!-- card -->
                        </div><!-- col-lg-4 col-md-6 -->
                    @endif

                </div><!-- row -->

            </div><!-- col-lg-12 col-md-12 -->

        </div><!-- row -->

    </div><!-- container -->
</section><!-- section -->

@endsection

@push('js')

@endpush
