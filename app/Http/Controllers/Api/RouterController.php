<?php
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Services\ApiServer\Server;
use App\Services\ApiServer\Error;

use App\Http\Requests;
use App\Post;
use App\Tag;
use Illuminate\Http\Request;

/**
 * Api入口控制器
 * @author Flc <2016-7-31 10:16:42>
 */
class RouterController extends Controller
{
    /**
     * API总入口
     * @return [type] [description]
     */
    public function index()
    {
        $server = new Server(new Error);
        return $server->run();
    }

    public function showPost(Request $request)
    {
        $post = Post::with('tags')->firstOrFail();
        return [
            "status"=> true,
            "code"=> "200",
            "msg"=> "成功",
            "data"=>$post,
        ];
    }
}
