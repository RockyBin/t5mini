<?php


namespace app\api\controller\v1;

use app\api\model\Category as CategoryModel;
use app\common\lib\exception\DataException;

class Category
{

    public function index(){

        $categories = CategoryModel::getAll();

        if(!$categories){
            throw new DataException();
        }

        return success($categories);
    }

}