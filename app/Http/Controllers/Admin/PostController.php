<?php

namespace App\Http\Controllers\Admin;
use App\Category;
use App\Helpers\ImageHelper;
use App\Tag;
use App\Post;
Use Carbon\Carbon;
use App\Subscriber;
use App\Notifications\AdminPostApproval;
use App\Notifications\NewPostNotify;
use Illuminate\Support\Facades\Notification;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Auth;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class PostController extends Controller
{

    public function index()
    {
        $posts = Post::latest()->get();
        return view('admin.post.index',compact('posts'));
    }

    public function create()
    {
        $categories = Category::all();
        $tags       = Tag::all();
        return view('admin.post.create',compact('categories','tags'));
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
        $post->is_approved = true;
        $post->save();

        $post->categories()->attach($request->categories);
        $post->tags()->attach($request->tags);
        $subscribers = Subscriber::all();
        foreach ($subscribers as $subscriber) {
           Notification::route('mail',$subscriber->email)
           ->notify(new NewPostNotify($post));
        }
        Toastr::success('Post Successfully Saved :)' ,'Success');
        return redirect()->route('admin.post.index');
    }


    public function show(post $post)
    {
        return view('admin.post.show',compact('post'));
    }


    public function edit(post $post)
    {

        $categories = Category::all();
        $tags       = Tag::all();
        return view('admin.post.edit',compact('post','categories','tags'));
    }


    public function update(Request $request, post $post)
    {
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
        $post->is_approved = true;
        $post->save();

        $post->categories()->sync($request->categories);
        $post->tags()->sync($request->tags);

        Toastr::success('Post Successfully Saved :)' ,'Success');
        return redirect()->route('admin.post.index');
    }
    public function pending()
    {
        $posts = Post::where('is_approved',false)->get();
        return view('admin.post.pending',compact('posts'));
    }
    public function approval($id)
    {
        $post = Post::findOrFail($id);
        if ($post->is_approved == false)
        {
            $post->is_approved = true;
            $post->save();
//            $post->user->notify(new AdminPostApproval($post));
//            $subscribers = Subscriber::all();
//            foreach ($subscribers as $subscriber) {
//            Notification::route('mail',$subscriber->email)
//            ->notify(new NewPostNotify($post));
//            }
            Toastr::success('Post Successfully Approved :)','Success');
        } else {
            Toastr::info('This Post is already approved','Info');
        }
        return redirect()->route('admin.post.pending');
    }

    public function destroy(post $post)
    {
        @unlink(public_path('uploads/post/'.$post->image));
        $post->categories()->detach();
        $post->tags()->detach();
        $post->delete();
        Toastr::success('Post Successfully Deleted','Success');
        return redirect()->route('admin.post.index');

    }
}
