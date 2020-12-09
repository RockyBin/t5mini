<?php


namespace app\common\lib\exception;


class ForbiddenException extends BaseException
{
    public $message = '权限不足！';
    public $code = 4001;
    public $httpCode = 403;
}