<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Tag;
use App\Http\Requests\TagCreateRequest;

class TagController extends Controller
{
    private $fields = [
        'tag'=>'',
        'title'=>'',
        'subtitle'=>'',
        'meta_description'=>'',
        'page_image'=>'',
        'layout'=>'blog.layouts.index',
        'reverse_direction'=>0,
    ];

    public function index(){
        $tags = Tag::all();
        return view('admin.tag.index')->withTags($tags);
    }

    /**
     * show form for creating new tag
     */
    public function create(){
        $data = [];
        foreach ($this->fields as $field => $default) {
            $data[$field] = old($field,$default);
        }

        return view('admin.tag.create',$data);
    }

    /**
     * Store the newly created tag in the database.
     *
     * @param TagCreateRequest $request
     * @return Response
     */
    public function store(TagCreateRequest $request)
    {
        $tag = new Tag();
        foreach (array_keys($this->fields) as $field) {
            $tag->$field = $request->get($field);
        }
        $tag->save();

        return redirect('/admin/tag')
                        ->withSuccess("The tag '$tag->tag' was created.");
    }
}
