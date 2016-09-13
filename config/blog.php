<?php
return [
        'name'=>'My blog',
        'title'=>'My blog',
        'subtitle'=>'http://blog.zxx123.cn',
        'description'=>'Laravel学习blog',
        'author'=>'周鑫鑫',
        'page_image'=>'home-bg.jpg',
        'posts_per_page'=>10,
        'rss_size' => 25,
        'uploads'=>[
                'storage'=>'local',
                'webpath'=>'/uploads',
        ],
        'contact_email'=>env('MAIL_FROM'),
];
?>
