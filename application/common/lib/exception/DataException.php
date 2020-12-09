<?php


namespace app\common\lib\exception;


class DataException extends BaseException
{
    public $message = '数据不存在';
    public $code = 4001;
    public $httpCode = 500;


}