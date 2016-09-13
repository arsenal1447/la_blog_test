<?php

    /*
     *  返回可读性更好的文件尺寸
     */
    function human_filesize($bytes,$decimals = 2){
        $size = ['B','kB','MB','GB','TB','PB'];
        $factor = floor((strlen($bytes)-1)/3);

        return sprintf("%.{$decimals}f",$bytes/pow(1024,$factor)).@$size[$factor];
    }

    /**
     * 判断文件的MIME类型是否为图片
     */
    function is_image($mimeType)
    {
        return starts_with($mimeType, 'image/');
    }

    /**
     *  return "checked" if true
     */
    function checked($value){
        return $value ? 'checked' : '';
    }

    /**
     * Return img url for headers
     */
    function page_image($value = null){
        if(empty($value)){
            $value = config('blog.page_image');
        }

        if(!starts_with($value,'http') && $value[0]!=='/'){
            $value = config('blog.uploads.webpath').'/'.$value;
        }

        return $value;

    }
    
    /**
     * @desc debug函数
     * @param $arr 需要打印的变量
     * @param string $flg
     */
    function pr($arr,$flg=''){
        if(is_array($arr) || is_object($arr)){
            echo "<pre>";
            print_R($arr);
            echo "</pre>";
        }elseif(is_string($arr) ){
            echo "<br>string==";
            echo $arr;
            echo "</br>";
        }elseif (is_bool($arr)){
            echo "<pre>";
            var_dump($arr);
            echo "</pre>";
        }
        if(!$flg){
            die('arr end');
        }else{
            echo "<br><hr>";
        }
    }
    
