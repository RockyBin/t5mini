<?php


namespace app\common\lib\validate;


use app\common\lib\exception\BaseException;

class OrderValidate extends BaseValidate
{

    protected $rule = [
        'products' => 'require|productCheck'
    ];

    protected $signRule = [
        'product_id' => 'require|idInt',
        'count' => 'require|idInt',
    ];

    public function productCheck($value){

        if(empty($value)){
            throw new BaseException('商品列表不能为空!');
        }

        if(!is_array($value)){
            return false;
        }

        foreach($value as $v){
            $this->ckAttr($v);
        }

        return true;
    }

    protected function ckAttr($value){
        $validate = new BaseValidate($this->signRule);

        $res = $validate->check($value);

        if(!$res){
            throw new BaseException('商品列表参数错误!');
        }

        return true;
    }

}