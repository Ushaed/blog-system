<?php

namespace App\Http\Controllers\Author;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class FavoriteController extends Controller
{
    public function index()
    {
        $posts = Auth::user()->favorite_posts;
        return view('author.favorite',compact('posts'));
    }
}
