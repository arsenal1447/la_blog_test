# Laravel PHP Framework

本文基于laravel 5.2

原文地址：http://laravelcoding.com/blog/laravel-5-beauty-setting-up-a-windows-machine

中文翻译地址：http://laravelacademy.org/post/2116.html

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



## 添加 Font Awesome 和 DataTables

*现在 Bower 和 Gulp 都已经设置好了，前端资源也成功发布并引入视图文件了，最后我们还要添加另外两个高逼格的包：Font Awesome 和 DataTables，前者用于为 Bootstrap 设置图标字体，后者是一款 jQuery 表格插件，用于为 HTML 表格添加高级交互功能。*


	bower install fontawesome --save
	bower install datatables --save
	bower install datatables-plugins --save

我们还添加了 <font color="red">datatables-plugins</font> 以便使用 Bootstrap 风格的 DataTables。

接下来编辑 <font color="red">gulpfile.js</font> 拷贝需要的前端资源到项目中：




## 创建标签模型和迁移
首先需要创建 Tag 模型类：

	php artisan make:model --migration Tag
该命令会在 app 目录下创建模型文件 Tag.php，由于我们在 make:model 命令中使用了 --migration 选项，所以同时会创建  Tag 模型对应的数据表迁移。

在标签（Tag）和文章（Post）之间存在多对多的关联关系，因此还要按照下面的命令创建存放文章和标签对应关系的数据表迁移：

	php artisan make:migration --create=post_tag_pivot create_post_tag_pivot
编辑标签迁移文件



## 生成文件
	php artisan make:request TagCreateRequest
	php artisan make:request TagUpdateRequest

## 添加自定义函数
	app/helpers.php

>修改文件composer.json

	 "autoload": {
        "classmap": [
            "database"
        ],
        "psr-4": {
            "App\\": "app/"
        },
        "files":[
            "app/helpers.php"
        ]
	},


执行下面命令，即可加入到全局使用

	composer dumpauto

##使用的插件1

	composer require "dflydev/apache-mime-types"

## 生成上传相关文件

	php artisan make:request UploadFileRequest

	php artisan make:request UploadNewFolderRequest

## 使用的插件2
	composer require "doctrine/dbal"


##接下来使用 Artisan 命令创建新的迁移文件：

	php artisan make:migration --table=posts restructure_posts_table


我们对表字段略作说明：

	subtitle：文章副标题
	content_raw：Markdown格式文本
	content_html：使用 Markdown 编辑内容但同时保存 HTML 版本
	page_image：文章缩略图（封面图）
	meta_description：文章备注说明
	is_draft：该文章是否是草稿
	layout：使用的布局

##运行迁移

迁移已经创建并编辑好了，接下来我们登录到 Homestead 虚拟机中运行该迁移：

	php artisan migrate

## 添加 Selectize.js 和 Pickadate.js 前端插件
*首先是 Selectize.js。Selectize.js 是一个基于 jQuery 的 UI 控件，对于标签选择和下拉列表功能非常有用。我们将使用它来处理文章标签输入。使用 Bower 下载 <font color="red">Seletize.js</font>：*

	bower install selectize --save

接下来下载 Pickadate.js。Pickadate.js 是一个轻量级的 jQuery 日期时间选择插件，日期时间插件很多，选择使用  Pickadate.js 的原因是它在小型设备上也有很好的体验。下面我们使用 Bower 下载安装 <font color="red">Pickadate.js</font>：

	bower install pickadate --save


## 修改gulpfile.js文件

	gulp copyfiles


## 创建表单请求类
首先，使用 Artisan 命令创建表单请求处理类，对应文件会生成在 app/Http/Requests 目录下：

	php artisan make:request PostCreateRequest
	php artisan make:request PostUpdateRequest

## 创建 PostFormFields 任务

>接下来我们创建一个公用的、可以从 PostController 中调用的任务类，我们将其称之为 PostFormFields。该任务会在我们想要获取文章所有字段填充文章表单时被执行。

>首先使用 Artisan 命令创建任务类模板：

	php artisan make:job PostFormFields


## 使用 Clean Blog

Clean Blog 是 Start Bootstrap 提供的一个免费博客模板，本节我们将使用该模板美化博客前台页面。

使用 Bower 获取Clean Blog

首先我们使用 Bower 下载 Clean Blog：

	bower install clean-blog --save

使用 Gulp 管理 Clean Blog 的 Less 文件

编辑 gulpfile.js，在 copyfiles 任务底部添加如下这段代码：

	// Copy clean-blog less files
	gulp.src("vendor/bower_dl/clean-blog/less/**")
	    .pipe(gulp.dest("resources/assets/less/clean-blog"));

然后运行 gulp copyfiles，新添加的 clean blog 的资源文件就会被拷贝到 public 目录下。

##创建 BlogIndexData 任务

如果请求参数中指定了标签，那么我们需要根据该标签来过滤要显示的文章。要实现该功能，我们创建一个独立的任务来聚合指定标签文章，而不是将业务逻辑一股脑写到控制器中。

首先，使用 Artisan 命令创建一个任务类：

	php artisan make:job BlogIndexData


## 创建表单请求类

我们知道联系表单包含用户名，邮箱地址，以及消息内容，这里我们和之前后台系统一样使用表单请求类来对表单字段进行验证。使用 Artisan 命令创建该请求类：

	php artisan make:request ContactMeRequest

##创建控制器

下面我们创建在路由中使用的控制器：

	php artisan make:controller --plain ContactController
	or
	php artisan make:controller  ContactController


##使用数据库驱动

这里我们使用数据库驱动实现队列。

登录到 Homestead 虚拟机，运行如下迁移命令创建存放队列任务的 <font color="red">jobs</font> 表：

	php artisan queue:table
	php artisan migrate


然后编辑 .env 文件并修改 QUEUE_DRIVER 的配置值为 database。

##自动处理队列
queue:work 命令有个缺陷，就是每次有新任务推送到队列后需要手动登录到服务器并运行该命令，任务才会被执行，这显然是不合理的，对此我们可以使用一些自动化解决方案。

一种方式是将 artisan queue:listen 命令加入到服务器启动脚本中，该命令会在新任务推送到队列时自动调用 artisan queue:work。这种方案的问题是 queue:listen  命令会一直挂在那里，消耗 CPU 资源，而且一旦命令挂掉，新的任务还是无法执行，更好的解决方案是使用 Supervisor 来运行 queue:listen。

**使用 Supervisor 运行 queue:listen**

Supervisor 是 *nix 系统上用于监控和管理进程的工具，我们这里不深入探究如何安装这个工具，如果你使用 Homestead 作为本地开发环境，则该工具已经为我们安装好了。

以 Homestead 上预装的 Supervisor 为例，在 /etc/supervisor/conf.d 目录下创建 blog.conf，并编辑该文件内容如下：

	[program:blog-queue-listen]
	command=php /home/vagrant/Code/blog/artisan queue:listen
	user=vagrant
	process_name=%(program_name)s_%(process_num)d
	directory=/home/vagrant/Code/blog
	stdout_logfile=/home/vagrant/Code/blog/storage/logs/supervisord.log
	redirect_stderr=true
	numprocs=1
保存该文件后关闭在正在运行的 Supervisor 服务，然后使用如下命令重新启动 Supervisor：

	sudo supervisord -c /etc/supervisor/supervisord.conf
使用如下命令可以查看所有正在监听的队列：

	sudo supervisorctl status
这样，推送到队列的任务就可以正常被执行了。

使用调度命令

对小的站点而言还有一种方式是使用调度任务每分钟运行一次 queue:work，或者每五分钟，这可以通过使用 Laravel 5.1 的命令行调度器来完成。


##实现 RSS 订阅
RSS 订阅对大部分博客应用而言是必备功能。在 Laravrel 5.1 中实现 RSS 订阅非常便捷。

安装 Composer 依赖包

我们使用 suin/php-rss-writer 来生成 RSS 文件。

首先使用 Composer 安装该依赖包：

	composer require suin/php-rss-writer


## Api接口
	http://local.blog_test.com/api/show
