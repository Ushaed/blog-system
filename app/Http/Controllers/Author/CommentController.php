<?php

namespace App\Http\Controllers\Author;
use App\Comment;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;

class CommentController extends Controller
{
    public function index()
    {
        $posts = Auth::user()->posts;
        return view('author.comments',compact('posts'));
    }
    public function destroy($id)
    {
        $comment = Comment::findOrFail($id);
        if($comment->post->user->id == Auth::id())
        {
            $comment->delete();
            Toastr::success('Category Deleted Successfully','Success');
        }
        else 
        {
            Toastr::error('Access deny','Error');
        }
        
        return redirect()->back();
    }
}
