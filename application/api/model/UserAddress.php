<?php


namespace app\api\model;


use app\api\service\Token;
use app\common\lib\exception\BaseException;
use app\api\model\User as UserModel;

class UserAddress extends BaseModel
{

    public static function saveAddress($validate){

        $uid = Token::getValueByToken();

        $user = UserModel::get($uid);

        if(!$user){
            throw new BaseException('该用户不存在');
        }

        $param = $validate->filterData();

        $userAddr = $user->address;

        if(!$userAddr){
            return $user->address()->save($param);
        }else{
            return $user->address->save($param);
        }

    }

}