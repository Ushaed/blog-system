<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Models\User;
class Role extends Model
{
    protected $fillable = ['name','slug'];
    public function users()
    {
        return $this->hasMany('App\User');
    }
}
