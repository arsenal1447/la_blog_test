<?php
return [
        'name'=>'My blog',
        'title'=>'My blog',
        'subtitle'=>'http://local.blog_test.com',
        'description'=>'Laravel学院致力于提供优质Laravel中文学习资源',
        'author'=>'zxx',
        'page_image'=>'home-bg.jpg',
        'posts_per_page'=>10,
        'rss_size' => 25,
        'uploads'=>[
                'storage'=>'local',
                'webpath'=>'/uploads/laravel wenjianjia',
        ],
        'contact_email'=>env('MAIL_FROM'),
];
?>
