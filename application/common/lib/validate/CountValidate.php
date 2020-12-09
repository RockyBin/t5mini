<?php


namespace app\common\lib\validate;


class CountValidate extends BaseValidate
{

    protected $rule = [
        'num' => 'between:1,15'
    ];

}