<?php


namespace app\common\lib\exception;


use think\exception\Handle;
use think\Request;

class ApiExceptionHandle extends Handle
{
    public $message = '';
    public $code = 1;
    public $httpCode = 500;

    public function render(\Exception $e)
    {
        $data['error'] = Request::instance()->url();

        if($e instanceof BaseException){
            $this->message = $e->message;
            $this->code = $e->code;
            $this->httpCode = $e->httpCode;
        }else{
            $this->message = $e->getMessage();
            $this->code = $e->getCode();
            $this->httpCode = 500;
        }

        return show(1, $this->message,$data, $this->httpCode);
    }

}