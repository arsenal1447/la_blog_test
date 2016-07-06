# Laravel PHP Framework

## 遇到问题
	npm install laravel-elixir --save-dev

>报错：Cannot find module 'laravel-elixir'

解决办法：使用cnpm

>安装 cnpm

*因为npm安装插件是从国外服务器下载，受网络影响大，可能出现异常，如果npm的服务器在中国就好了，所以我们乐于分享的淘宝团队干了这事。32个赞！来自官网：“这是一个完整 npmjs.org 镜像，你可以用此代替官方版本(只读)，同步频率目前为 10分钟 一次以保证尽量与官方服务同步*。
	
	npm install cnpm -g --registry=https://registry.npm.taobao.org

*注：cnpm跟npm用法完全一致，只是在执行命令时将npm改为cnpm（以下操作将以cnpm代替npm）。*

>再次安装 *laravel-elixir*

	cnpm install laravel-elixir --save-dev

正常安装，运行
>gulp


结果如下图

![](https://github.com/zxx1988328/la_blog_test/blob/master/img/phpunit_run.png)


## 实时监控代码

	gulp tdd

>修改测试代码: tests/ExampleTest.php 中的 see() 这一行测试代码如下

	$this->visit('/')->see('Laravel Zhou');

>报错

![](https://github.com/zxx1988328/la_blog_test/blob/master/img/fail_1.png)

>然后再修改回来，测试通过

![](https://github.com/zxx1988328/la_blog_test/blob/master/img/ok_1.png)


## 生成controller遇到的问题

>执行	php artisan make:controller BlogController --plain



报错

	[Symfony\Component\Debug\Exception\FatalErrorException]
	Call to undefined function get()

![](https://github.com/zxx1988328/la_blog_test/blob/master/img/question_1.png)

报错原因：**E:\work\la_blog_test\app\Http\route.php** 代码里找不到get()方法

	get('/', function () {
	    return redirect('/blog');
	});
	
	get('blog', 'BlogController@index');
	get('blog/{slug}', 'BlogController@showPost');

解决办法：加上route,

	Route::get('/', function () {
	    return redirect('/blog');
	});
	
	Route::get('blog', 'BlogController@index');
	Route::get('blog/{slug}', 'BlogController@showPost');

执行的命令也会报错,

![](https://github.com/zxx1988328/la_blog_test/blob/master/img/question_2.png)

解决办法：去除 参数 **--plain**,再去执行

	php artisan make:controller BlogController
