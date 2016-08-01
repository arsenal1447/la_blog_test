<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Services\UploadManager;

class UploadController extends Controller
{
    protected $manager;

    public function __construct(UploadManager $manager){
        $this->manager = $manager;
    }
    
    /**
     * Show page of files / subfolders
     */
     public function index(Request $request){
         $folder = $request->get('folder');
         $data = $this->manager->folderInfo($folder);

         return view('admin.upload.index',$data);
     }
}
