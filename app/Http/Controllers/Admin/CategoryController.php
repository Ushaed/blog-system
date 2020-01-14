<?php

namespace App\Http\Controllers\Admin;

use App\Helpers\ImageHelper;
use Illuminate\Http\Request;

use App\Category;
use Brian2694\Toastr\Facades\Toastr;
use Carbon\Carbon;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;
class CategoryController extends Controller
{
    public function index()
    {
        $categories = Category::latest()->get();
        return view ('admin.category.index',compact('categories'));
    }

    public function create()
    {
        return view('admin.category.create');
    }

    public function store(Request $request)
    {
        $this->validate($request,[
            'name' => 'required|unique:categories',
            'image' => 'required|mimes:jpeg,bmp,png,jpg'
        ]);
        if ($request->file('image')) {
//            @unlink(public_path('uploads/category/'.$request->image));
            $config = array(
                'name' => "image",
                'path' => 'uploads/category',
                'width' => 500,
                'height' => 333,
            );
            $image = ImageHelper::uploadImage($config);
            $imageName = $image['filename'];
        }
        $category = new Category();
        $category->name = $request->name;
        $category->slug = str_slug($request->name);
        $category->image = $imageName;
        $category->save();
        Toastr::success('Category Successfully Saved :)' ,'Success');
        return redirect()->route('admin.category.index');

    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        $category = Category::find($id);
        return view('admin.category.edit',compact('category'));
    }

    public function update(Request $request, $id)
    {
        $this->validate($request,[
            'name'=>'required',
            'image'=>'mimes:jpg,jpeg,png,bmp'
        ]);
        $category = Category::findOrFail($id);
        if ($request->file('image')) {
            @unlink(public_path('uploads/category/'.$category->image));
            $config = array(
                'name' => "image",
                'path' => 'uploads/category',
                'width' => 500,
                'height' => 333,
            );
            $image = ImageHelper::uploadImage($config);
            $imageName = $image['filename'];
        }else{
            $imageName=$category->image;
        }
        $category->name = $request->name;
        $category->slug =  str_slug($request->name);
        $category->image =$imageName;
        $category->save();
        Toastr::success('Category Successfully Updated','Success');
        return redirect()->route('admin.category.index');

    }

    public function destroy($id)
    {
        $category = Category::find($id);
        @unlink(public_path('uploads/category/'.$category->image));
        $category->delete();
        Toastr::success('Category Deleted Successfully','Success');
        return redirect()->back();

    }
}
