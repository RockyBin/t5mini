<?php


namespace app\common\lib\validate;


class TokenValidate extends BaseValidate
{

    protected $rule = [
        'code' => 'require|isNotEmpty'
    ];

}