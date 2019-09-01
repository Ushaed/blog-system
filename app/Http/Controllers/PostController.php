<?php

namespace App\Http\Controllers;
use App\Post;
Use App\Tag;
use Session;
use App\Category;
use Illuminate\Http\Request;

class PostController extends Controller
{
    public function index()
    {
     $posts = Post::latest()->approved()->published()->paginate(6);
        return view('posts',compact('posts'));
    }
    public function details($slug)
    {
        $post = Post::where('slug',$slug)->approved()->published()->first();
        $randomPosts = Post::approved()->published()->take(3)->inRandomOrder()->get();
        $blogKey     = 'blog_'.$post->id;
        if(!Session::has($blogKey))
        {
            $post->increment('view_count');
            Session::put($blogKey,1);
        }
        return view('post',compact('post','randomPosts'));
    }
    public function postsByCategory($slug)
    {
         $category = Category::where('slug',$slug)->first();
         return view('category',compact('category'));
    }
}
