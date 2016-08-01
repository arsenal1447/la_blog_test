<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Tag;

class TagController extends Controller
{
    public function index(){
        $tags = Tag::all();
        return view('admin.tag.index')->withTags($tags);
    }
}
