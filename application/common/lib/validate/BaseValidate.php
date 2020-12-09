<?php


namespace app\common\lib\validate;


use app\common\lib\exception\DataException;
use think\Validate;
use app\common\lib\exception\BaseException;

class BaseValidate extends Validate
{

    public function goCheck(){

        $param = input('param.');

        if(!$this->batch()->check($param)){

            $msg = $this->getError();

            $error = '';
            if($msg){
                foreach($msg as $m){
                    $error .= $m;
                }
            }

            throw new BaseException($error,0, 400);
        }
    }

    protected function idInt($value){

        if(is_numeric($value) && (intval($value) + 0) > 0 &&  ($value + 0) >0){
            return true;
        }

        return false;
    }

    protected function isNotEmpty($value){

        if($value != ''){
            return true;
        }

        return false;
    }

    protected function isMobile($value){
        if(strlen($value)!=11){
            return false;
        }
        if(preg_match("/^1[3456789]{1}[0-9]{9}$/",$value)){
            return true;
        }else{
            return false;
        }
    }

    public function filterData(){
        $param = input('param.');

        if(array_key_exists('user_id', $param) || array_key_exists('uid', $param)){
            throw new DataException('非法提交!');
        }

        $data = $this->rule;
        $arr = [];
        foreach($data as $k=>$v){
            $arr[$k] = $param[$k];
        }

        return $arr;
    }

}