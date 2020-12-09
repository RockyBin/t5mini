<?php


namespace app\api\controller\v1;

use app\api\model\Theme as ThemeModel;
use app\common\lib\EnumCode;
use app\common\lib\exception\DataException;
use app\common\lib\validate\IdMustIntValidate;

class Theme
{

    public function index(){

        $themes = ThemeModel::getAll();

        if(!$themes){
            throw new DataException();
        }

        return success($themes);
    }

    public function getThemeById($id){

        (new IdMustIntValidate())->goCheck();

        $theme = ThemeModel::getThemeById($id);

        if(!$theme){
            throw new DataException();
        }

        return success($theme);
    }

}