<?php


namespace app\api\controller\v1;


use app\common\lib\exception\DataException;
use app\common\lib\validate\CountValidate;
use app\common\lib\validate\IdMustIntValidate;
use app\api\model\Product as ProductModel;

class Product
{

    public function getByCategoryId($id){
        (new IdMustIntValidate())->goCheck();

        $products = ProductModel::getByCategoryId($id);

        if(!$products){
            throw new DataException();
        }

        return success($products);
    }

    public function recent($num=15){

        (new CountValidate())->goCheck();

        $recent = ProductModel::getRecent($num);

        if(!$recent){
            throw new DataException();
        }

        return success($recent);
    }

    public function detail($id){

        (new IdMustIntValidate())->goCheck();

        $product = ProductModel::getDetailById($id);

        if(!$product){
            throw new DataException();
        }

        return success($product);
    }

}