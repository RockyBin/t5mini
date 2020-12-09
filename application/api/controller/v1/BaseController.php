<?php


namespace app\api\controller\v1;


use app\api\service\Token;
use app\common\lib\EnumCode;
use app\common\lib\exception\ForbiddenException;
use think\Controller;

class BaseController extends Controller
{

    public function checkUserPermission(){
        Token::checkUserPermission();
    }

    public function checkSuperPermission(){
        Token::checkSuperPermission();
    }

}