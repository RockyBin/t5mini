<?php


namespace app\api\model;


class Image extends BaseModel
{
    protected $hidden = ['delete_time', 'update_time'];

    public function getUrlAttr($value,$data){

        if($data['from'] == 1){
            return config('setting.prefix_url') . $value;
        }else{
            return $value;
        }

    }
}