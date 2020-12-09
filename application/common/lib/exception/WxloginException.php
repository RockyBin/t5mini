<?php


namespace app\common\lib\exception;


class WxloginException extends BaseException
{
    public $message = '微信登录失败!';
    public $code = 4002;
    public $httpCode = 500;
}