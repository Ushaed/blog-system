<?php

namespace App\Http\Controllers\Admin;
use App\Subscriber;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class SubscriberController extends Controller
{
    public function index()
    {
        $subscribers = Subscriber::latest()->get();
        return view('admin.subscriber.index',compact('subscribers'));
    }
    public function destroy(Request $request,$subscriber)
    {
        $subscribers = Subscriber::find($subscriber);
        $subscribers->delete();
        Toastr::success('Successfully deleted ','Success');
        return redirect()->back();
    }
}
