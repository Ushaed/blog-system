<?php

namespace App\Http\Controllers;
use App\Subscriber;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;

class SubscriberController extends Controller
{
    public function store(Request $request)
    {
        $this->validate($request,[
            'email' => 'required|email|unique:subscribers',
        ]);
        $subscribers = new Subscriber();
        $subscribers->email = $request->email;
        $subscribers->save();
        Toastr::success('You are now member ','Success');
        return redirect()->back();
    }
}
