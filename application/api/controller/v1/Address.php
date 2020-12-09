<?php


namespace app\api\controller\v1;


use app\api\service\Token;
use app\common\lib\EnumCode;
use app\common\lib\exception\ForbiddenException;
use app\common\lib\validate\AddressValidate;
use app\api\model\UserAddress;
use think\Controller;


class Address extends BaseController
{
    protected $beforeActionList = [
        'checkUserPermission' => ['only'=>'index'],

    ];


    public function index(){
        $validate = new AddressValidate();
        $validate->goCheck();

        $res = UserAddress::saveAddress($validate);

        return success($res);
    }


}