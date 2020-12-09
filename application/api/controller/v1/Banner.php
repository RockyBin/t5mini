<?php


namespace app\api\controller\v1;


use app\api\model\Banner as BannerModel;
use app\common\lib\exception\DataException;
use app\common\lib\validate\IdMustIntValidate;

class Banner
{

    public function index($id){

        (new IdMustIntValidate())->goCheck();

        $banner = BannerModel::getBannerById($id);

        if(!$banner){
            throw new DataException();
        }

        return show(0, 'ok',$banner);
    }

}