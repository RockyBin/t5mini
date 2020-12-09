<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
if(!function_exists('show')){
    function show($code=1,$msg='ok',$data=[],$httpCode=200){

        $result = [
            'code' => $code,
            'msg' => $msg,
            'data'=>$data
        ];

        return json($result,$httpCode);
    }
}

if(!function_exists('success')){
    function success($data = []){
        return show(\app\common\lib\EnumCode::OK,\app\common\lib\EnumCode::SUCCESS,$data);
    }
}

if(!function_exists('error')){
    function error($data = []){
        return show(\app\common\lib\EnumCode::ERR,\app\common\lib\EnumCode::ERROR, $data);
    }
}

if(!function_exists('curl_get')){
    function curl_get($url){
        $ch = curl_init();
        //设置选项，包括URL
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);//绕过ssl验证
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        //执行并获取HTML文档内容
        $output = curl_exec($ch);

        //释放curl句柄
        curl_close($ch);
        return $output;
    }
}