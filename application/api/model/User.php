<?php


namespace app\api\model;


class User extends BaseModel
{
    public function address(){
        return $this->hasOne('UserAddress', 'user_id', 'id');
    }
}