<?php

namespace App\Http\Controllers\Author;
use App\Category;
use App\Helpers\ImageHelper;
use App\Tag;
use App\Post;
use App\User;
use App\Notifications\NewAuthorPost;
Use Carbon\Carbon;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Notification;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Auth;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class PostController extends Controller
{

    public function index()
    {
        $posts =Auth::user()->posts()->latest()->get();
        return view('author.post.index',compact('posts'));
    }

    public function create()
    {
        $categories = Category::all();
        $tags       = Tag::all();
        return view('author.post.create',compact('categories','tags'));
    }

    public function store(Request $request)
    {
        $this->validate($request,[
            'title'      => 'required',
            'image'      => 'required|mimes:jpg,png,jpeg,bmp',
            'categories' => 'required',
            'tags'       => 'required',
            'body'       => 'required',

        ]);
        if ($request->file('image')) {
            $config = array(
                'name' => "image",
                'path' => 'uploads/post',
                'width' => 1600,
                'height' => 1066,
            );
            $image = ImageHelper::uploadImage($config);
            $imageName = $image['filename'];
        }
        $post = new Post();
        $post->user_id = Auth::id();
        $post->title = $request->title;
        $post->slug = str_slug($request->title);
        $post->image = $imageName;
        $post->body  =$request->body;
        if(isset($request->status))
        {
            $post->status=true;
        }
        else
        {
            $post->status=false;
        }
        $post->is_approved = false;
        $post->save();

        $post->categories()->attach($request->categories);
        $post->tags()->attach($request->tags);
//        $users = User::where('role_id','1')->get();
//        Notification::send($users, new NewAuthorPost($post));
        Toastr::success('Post Successfully Saved :)' ,'Success');
        return redirect()->route('author.post.index');
    }

    public function show(post $post)
    {
        if($post->user_id != Auth::id()){
            Toastr::error('You are not authorized to access this post','Error');
            return redirect()->back();
        }
        return view('author.post.show',compact('post'));
    }

    public function edit(post $post)
    {
        if($post->user_id != Auth::id()){
            Toastr::error('You are not authorized to access this post','Error');
            return redirect()->back();
        }
        $categories = Category::all();
        $tags       = Tag::all();
        return view('author.post.edit',compact('post','categories','tags'));
    }

    public function update(Request $request, post $post)
    {
        if($post->user_id != Auth::id()){
            Toastr::error('You are not authorized to access this post','Error');
            return redirect()->back();
        }
        $this->validate($request,[
            'title'      => 'required',
            'image'      => 'image',
            'categories' => 'required',
            'tags'       => 'required',
            'body'       => 'required',

        ]);

        if ($request->file('image')) {
            @unlink(public_path('uploads/post/'.$post->image));
            $config = array(
                'name' => "image",
                'path' => 'uploads/post',
                'width' => 1600,
                'height' => 1066,
            );
            $image = ImageHelper::uploadImage($config);
            $imageName = $image['filename'];
        }else {
            $imageName = $post->image;
        }
        $post->user_id = Auth::id();
        $post->title = $request->title;
        $post->slug = str_slug($request->title);
        $post->image = $imageName;
        $post->body  =$request->body;
        if(isset($request->status)) {
            $post->status=true;
        }else{
            $post->status=true;
        }
        $post->is_approved = false;
        $post->save();

        $post->categories()->sync($request->categories);
        $post->tags()->sync($request->tags);
        Toastr::success('Post Successfully Updated :)' ,'Success');
        return redirect()->route('author.post.index');
    }

    public function destroy(post $post)
    {
        @unlink(public_path('uploads/post/'.$post->image));
        $post->categories()->detach();
        $post->tags()->detach();
        $post->delete();
        Toastr::success('Post Successfully Deleted','Success');
        return redirect()->route('author.post.index');
    }
}
