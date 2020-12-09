<?php


namespace app\common\lib\validate;


class IdMustIntValidate extends BaseValidate
{

    protected $rule = [
        'id' => 'require|idInt'
    ];

    protected $message = [
        'id' => 'id必须为正整数!'
    ];

}