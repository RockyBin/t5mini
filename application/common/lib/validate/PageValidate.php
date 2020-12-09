<?php


namespace app\common\lib\validate;


class PageValidate extends BaseValidate
{

    protected $rule = [
        'page' => 'require|idInt'
    ];

    protected $message = [
        'page' => '页码必须为正整数!'
    ];

}