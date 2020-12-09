<?php


namespace app\api\controller\v1;


use app\api\service\UserToken;
use app\common\lib\validate\TokenValidate;

class User
{
    public function token($code=''){
        (new TokenValidate())->goCheck();

        $ut = new UserToken($code);
        $token = $ut->token();

        return success(['token'=>$token]);
    }
}