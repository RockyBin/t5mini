<?php


namespace app\api\service;

use app\api\model\OrderProduct;
use app\api\model\Product as ProductModel;
use app\api\model\UserAddress;
use app\common\lib\exception\BaseException;
use app\api\model\Order as OrderModel;
use think\Db;

class Order－－
{
    protected $oProducts;
    protected $products;
    protected $uid;

    public function place($oProducts){
        $this->oProducts = $oProducts;
        $this->products = $this->getProducts();
        $this->uid = Token::getValueByToken();

        $status = $this->getOrderStatus();

        if(!$status['pass']){
            $status['order_id'] = -1;
            return $status;
        }

        $snapOrder = $this->getSnapOrder();
        $order = $this->createOrder($snapOrder);

        return $order;
    }

    private function createOrder($snapOrder){

        Db::startTrans();

        try{
            $orderNO = $this->makeOrderSN();

            $order = new OrderModel();
            $order->order_no = $orderNO;
            $order->user_id = $this->uid;
            $order->total_price = $snapOrder['orderPrice'];
            $order->snap_img = $snapOrder['snapImg'];
            $order->snap_name = $snapOrder['snapName'];
            $order->total_count = $snapOrder['totalCount'];
            $order->snap_items = json_encode($snapOrder['pStatus']);
            $order->snap_address = $snapOrder['snapAddress'];

            $order->save();

            $orderId = $order->id;
            $create_time = $order->create_time;
            $orderProduct = new OrderProduct();

            foreach($this->oProducts as &$p){
                $p['order_id'] = $orderId;
            }

            $orderProduct->saveAll($this->oProducts);
            Db::commit();
            return [
                'order_id' => $orderId,
                'order_no' => $orderNO,
                'create_time' => $create_time,
            ];

        }catch(\Exception $e){
            Db::rollback();
            throw $e;
        }

    }

    public function makeOrderSN(){
        $ycode = ['A','B','C','D','E','F','G','H','I','J','K'];

        $orderSN = $ycode[(intval(date('Y')) % 11)] . time() . mt_rand(0,999999);

        return $orderSN;
    }

    private function getSnapOrder(){
        $snap = [
            'orderPrice' => 0,
            'totalCount' =>0,
            'pStatus'=>[],
            'snapName'=>$this->products[0]['name'],
            'snapImg'=>$this->products[0]['main_img_url'],
            'snapAddress'=>json_encode($this->getUserAddress()),
        ];

        if(count($this->products) >1){
            $snap['snapName'] .= '等';
        }

        for($i=0;$i<count($this->products);$i++){
            $oProduct = $this->oProducts[$i];
            $product = $this->products[$i];

            $status = $this->getSnapProduct($product, $oProduct['count']);

            $snap['orderPrice'] += $status['totalPrice'];
            $snap['totalCount'] += $status['count'];

            array_push($snap['pStatus'], $status);
        }

        return $snap;
    }

    private function getSnapProduct($product,$count){
        $pStatus = [
            'id' =>-1,
            'name' => '',
            'price' => 0,
            'totalPrice' => 0,
            'count' => 0,
            'main_img_url' =>''
        ];

        $pStatus['id'] = $product['id'];
        $pStatus['name'] = $product['name'];
        $pStatus['price'] = $product['price'];
        $pStatus['count'] = $count;
        $pStatus['totalPrice'] = $product['price'] * $count;
        $pStatus['main_img_url'] = $product['main_img_url'];

        return $pStatus;
    }

    private function getOrderStatus(){
        $oStatus = [
            'pass' => true,
            'orderPrice' => 0,
            'pStatusArray' => [],
        ];

        foreach($this->oProducts as $oProduct){
            $status = $this->getProductStatus($oProduct['product_id'], $oProduct['count'], $this->products);

            if(!$status['haveStock']){
                $oStatus['pass'] = false;
            }

            $oStatus['orderPrice'] += $status['totalPrice'];

            array_push($oStatus['pStatusArray'], $status);
        }

        return $oStatus;
    }

    private function getProductStatus($product_id,$count,$products){
        $pIndex = -1;
        $pStatus = [
            'id' => null,
            'name' => '',
            'haveStock' => false,
            'totalPrice' => 0,
            'count' =>0,
        ];

        for($i=0;$i<count($products);$i++){
            if($product_id == $products[$i]['id']){
                $pIndex = $i;
            }
        }

        if($pIndex == -1){
            throw new BaseException('id为'.$product_id.'的商品不存!');
        }else{
            $product = $products[$pIndex];
            $pStatus['id'] = $product_id;
            $pStatus['name'] = $product['name'];
            $pStatus['count'] = $count;
            $pStatus['totalPrice'] = $product['price'] * $count;

            if($product['stock'] - $count >= 0){
                $pStatus['haveStock'] = true;
            }

            return $pStatus;
        }
    }

    private function getProducts(){

        $ids = [];

        foreach($this->oProducts as $v){
            array_push($ids, $v['product_id']);
        }

        $products = ProductModel::all($ids);

        $products = collection($products)->visible(['id','name','stock','price','main_img_url'])->toArray();

        return $products;
    }

    private function getUserAddress(){
        $address = UserAddress::where('user_id','=', $this->uid)->find();

        if(!$address){
            throw new BaseException('收货人地址不能为空!');
        }

        return $address;
    }
}