<?php


namespace app\common\lib\exception;


use Throwable;

class BaseException extends \Exception
{
    public $message = '';
    public $code = 400;
    public $httpCode = 500;

    public function __construct($message = "", $code = 0, $httpCode = 500)
    {
        $this->message = $message == ''? $this->message : $message;
        $this->code = $code == 0 ? $this->code : code;
        $this->httpCode = $httpCode == 500 ? $this->httpCode : $httpCode;
    }

}