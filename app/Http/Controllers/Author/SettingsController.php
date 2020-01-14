<?php

namespace App\Http\Controllers\Author;

use App\Helpers\ImageHelper;
use Brian2694\Toastr\Facades\Toastr;
use Carbon\Carbon;
use App\User;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Intervention\Image\Facades\Image;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class SettingsController extends Controller
{
    public function index(){
        return view('author.settings');
    }
    public function updateProfile(Request $request){
        $this->validate($request,[
            'name' => 'required',
            'email' => 'required|email',
            'image' => 'image',
        ]);
        $user = User::findOrFail(Auth::id());
        if ($request->file('image')) {
            @unlink(public_path('uploads/user/'.$user->image));
            $config = array(
                'name' => "image",
                'path' => 'uploads/user',
                'width' => 500,
                'height' => 500,
            );
            $image = ImageHelper::uploadImage($config);
            $imageName = $image['filename'];
        }else {
            $imageName = $user->image;
        }
        $user->name = $request->name;
        $user->email = $request->email;
        $user->image = $imageName;
        $user->about = $request->about;
        $user->save();
        Toastr::success('Profile Successfully Updated :)','Success');
        return redirect()->back();
    }
    public function updatePassword(Request $request)
    {
        $this->validate($request,[
            'old_password' => 'required',
            'password'     => 'required|confirmed'
        ]);
        $hashedPassword = Auth::user()->password;
        if(Hash::check($request->old_password, $hashedPassword))
        {
            if(!Hash::check($request->password, $hashedPassword))
            {
                $user = User::findOrFail(Auth::id());
                $user ->password = Hash::make($request->password);
                $user ->save();
                Toastr::success('Password Successfully Updated :)','Success');
                Auth::logout();
                return redirect()->back();
            }
            else
            {
                Toastr::error('New Password & old password don,t be same','Error');
                return redirect()->back();
            }
        }
        else
        {
            Toastr::error('Old password not valid','Error');
            return redirect()->back();
        }
    }
}
