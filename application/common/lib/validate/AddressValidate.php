<?php


namespace app\common\lib\validate;


class AddressValidate extends BaseValidate
{

    protected $rule = [
        'name' => 'require|isNotEmpty',
        'mobile' => 'require|isMobile',
        'country' => 'require|isNotEmpty',
        'detail' => 'require|isNotEmpty',
    ];



}