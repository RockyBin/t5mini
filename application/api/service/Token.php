<?php


namespace app\api\service;


use app\common\lib\EnumCode;
use app\common\lib\exception\BaseException;
use app\common\lib\exception\DataException;
use app\common\lib\exception\ForbiddenException;
use think\Request;
use app\api\model\User as UserModel;

class Token
{

    protected function generateToken(){
        return md5(uniqid().time().mt_rand(1,99999));
    }

    public static function getToken(){
        $token = Request::instance()->header('token');

        if(!$token){
            throw new DataException('参数缺少token!');
        }

        return $token;
    }

    public static function getValueByToken($key='uid'){

        $token = self::getToken();

        $tk = cache($token);

        if(!$tk){
            throw new DataException('token过期或不存在!');
        }

        return $tk[$key];
    }

    public static function checkUserPermission(){

        $scope = self::getValueByToken('scope');

        if(!$scope){
            throw new ForbiddenException();
        }else{
            if($scope >= EnumCode::USER){
                return true;
            }else{
                throw new ForbiddenException();
            }
        }

        return true;
    }

    public static function checkSuperPermission(){

        $scope = self::getValueByToken('scope');

        if(!$scope){
            throw new ForbiddenException();
        }else{
            if($scope == EnumCode::USER){
                return true;
            }else{
                throw new ForbiddenException();
            }
        }

        return true;
    }

    public static function checkVolidUser($checkedUser){

        $user = UserModel::get($checkedUser);

        if(!$user){
            throw new BaseException('用户不存在!');
        }

        $uid = self::getValueByToken();

        if($uid != $checkedUser){
            throw new BaseException('非法用户!');
        }

        return true;
    }

}