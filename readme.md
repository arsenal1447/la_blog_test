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




## 查看应用中的所有路由命令 

	php artisan route:list

显示结果

![](https://github.com/zxx1988328/la_blog_test/blob/master/img/route.png)


## add amdin user

	Psy Shell v0.7.2 (PHP 5.6.11 — cli) by Justin Hilemanan
	>>> $user = new App\User;
	=> App\User {#642}
	>>> $user->name = 'admin'
	=> "admin"
	>>> $user->email = 'zxx@qq.com'
	=> "zxx@qq.com"
	>>> $user->password = bcrypt('123456')
	=> "$2y$10$Jfwi4x4d98MO5SJbZovt7u9z1ZM7tBHQRHvKwSNSAmNqa9aeDbHn."
	>>> $user->save();
	=> true
	>>>


![](https://github.com/zxx1988328/la_blog_test/blob/master/img/add_user.png)


## 增加debug工具

>cmd 运行 ：
	
	composer require barryvdh/laravel-debugbar

**config/app.php**代码中添加相应代码，然后cmd运行

	php artisan vendor:publish --provider="Barryvdh\Debugbar\ServiceProvider"

![](https://github.com/zxx1988328/la_blog_test/blob/master/img/debug_tool.png)



在博客项目根目录下创建 **.bowerrc** 文件，这是可选的，这样做的目的是为了告诉 Bower 所有下载的文件都会存放到 **vendor** 目录下，如果跳过这一步，Bower 将在项目根目录下创建一个 bower_dl 目录用于存放下载文件。这里我们编辑 .bowerrc 文件内容如下：

	{
	    "directory": "vendor/bower_dl"
	}

##  生成bower.json文件

	bower init

修改内容如下：

	{
	  "name": "la_blog_test",
	  "description": "My blog test",
	  "main": "",
	  "authors": [
	    "zxx "
	  ],
	  "license": "MIT",
	  "homepage": "https://github.com/zxx1988328/la_blog_test",
	  "ignore": [
	    "**/.*",
	    "node_modules",
	    "vendor/bower_dl",
	    "test",
	    "tests"
	  ]
	}


## 修改gulpfile文件 

可能会提示缺少一些插件，安装即可

	cnpm 安装即可 laravel-elixir，vinyl-map，new-from，clean-css


依次执行
	
	gulp copyfiles 
	gulp 


执行结果

![](https://github.com/zxx1988328/la_blog_test/blob/dev1/img/gulpfile.png)