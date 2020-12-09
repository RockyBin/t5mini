<?php


namespace app\api\controller\v1;

use app\api\service\Token;
use app\common\lib\exception\BaseException;
use app\common\lib\exception\DataException;
use app\common\lib\validate\IdMustIntValidate;
use app\common\lib\validate\OrderValidate;
use app\api\service\Order as OrderService;
use app\common\lib\validate\PageValidate;
use app\api\model\Order as OrderModel;

class Order extends BaseController
{
    protected $beforeActionList = [
        'checkSuperPermission' => ['only'=>'place,olist,detail'],
    ];

    public function place(){
        (new OrderValidate())->goCheck();

        $oProducts = input('post.products/a');

        $orderService = new OrderService();
        $orders = $orderService->place($oProducts);

        return success($orders);
    }

    public function olist($page=1,$size=15){

        (new PageValidate())->goCheck();

        $uid = Token::getValueByToken();

        $orderList = OrderModel::getOrderList($uid, $page, $size);

        return success($orderList);
    }

    public function detail($id){
        (new IdMustIntValidate())->goCheck();

        $order = OrderModel::getDetail($id);

        if(!$order){
            throw new DataException();
        }

        return success($order);
    }

}