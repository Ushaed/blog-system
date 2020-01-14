<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Category;
use App\post;
class HomeController extends Controller
{
    public function index()
    {
        $categories = Category::all();
        $posts       = Post::approved()->published()->latest()->take(6)->get();
        return view('welcome',compact('categories','posts'));
    }
}
