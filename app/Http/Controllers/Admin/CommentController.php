<?php

namespace App\Http\Controllers\Admin;
use App\Comment;
use App\Post;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CommentController extends Controller
{
    public function index()
    {
//        $comments = Comment::latest()->get();
//        return view('admin.comments',compact('comments'));
        $posts = Post::all();
        return view('admin.comments_new',compact('posts'));
    }
    public function destroy($id)
    {
        Comment::findOrFail($id)->delete();
        Toastr::success('Comment Deleted Successfully','Success');
        return redirect()->back();
    }
}
