@extends('layouts.backend.app')

@section('title')
    Category
@endsection

@push('css')
    
@endpush

@section('content')
<div class="container-fluid">
       
        <!-- Vertical Layout | With Floating Label -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            Add new Category
                        </h2>
                        <ul class="header-dropdown m-r--5">
                            <li class="dropdown">
                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                    <i class="material-icons">more_vert</i>
                                </a>
                            
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <form method="POST" action="{{route('admin.category.store')}}" enctype="multipart/form-data">
                            @csrf
                            <div class="form-group form-float">
                                <div class="form-line">
                                    <input type="text" id="name" class="form-control" name="name" placeholder="Category Name">
                                    <label class="form-label"></label>
                                </div>
                            </div>
                            <div class="form-group form-float">
                                <div class="form-line">
                                    <input type="file" class="form-control" name="image" >
                                   
                                </div>
                            </div>
                            <a href="{{route('admin.category.index')}}" class="btn btn-danger m-t-15 waves-effect">BACK</a>
                            <button type="submit" class="btn btn-primary m-t-15 waves-effect">SUBMIT</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Vertical Layout | With Floating Label -->
       
    </div>
@endsection

@push('js')
    
@endpush