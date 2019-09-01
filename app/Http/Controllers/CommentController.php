<?php

namespace App\Http\Controllers;
use App\Comment;
use Illuminate\Support\Facades\Auth;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;

class CommentController extends Controller
{
    public function store(Request $request,$post)
    {
        $this->validate($request,[
            'comment'=>'required'
        ]);
       $comments = new Comment;
       $comments->post_id=$post;
       $comments->user_id=Auth::id();
       $comments->comment = $request->comment;
       $comments->save();
       Toastr::success('Comment successfully published :)','Success');
            return redirect()->back();
    }
}
