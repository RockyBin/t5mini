<?php


namespace app\api\service;


use app\api\model\Order as OrderModel;
use app\api\model\OrderProduct;
use app\api\model\Product as ProductModel;
use app\api\model\UserAddress;
use app\common\lib\exception\BaseException;
use think\Db;

class Order
{

    protected $oProducts;
    protected $products;
    protected $uid;

    public function place($oProducts){
        $this->oProducts = $oProducts;
        $this->uid = Token::getValueByToken();
        $this->products = $this->getProducts();

        $status = $this->getOrderStatus();

        if(!$status['pass']){
            $status['order_id'] = -1;
            return $status;
        }

        $snapOrder = $this->snapOrder();

        $status = $this->createOrder($snapOrder);

        return $status;
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

    private function snapOrder(){
        $snap = [
            'orderPrice' => 0,
            'totalCount' =>0,
            'pStatus' => [],
            'snapName' => $this->products[0]['name'],
            'snapImg' => $this->products[0]['main_img_url'],
            'snapAddress' => json_encode($this->getUserAddress())
        ];

        for($i=0;$i<count($this->products);$i++){
            $oProduct = $this->oProducts[$i];
            $product = $this->products[$i];

            $status = $this->getSnapProduct($oProduct['product_id'], $oProduct['count'],$product);
            $snap['orderPrice'] += $status['totalPrice'];
            $snap['totalCount'] += $status['count'];

            array_push($snap['pStatus'], $status);
        }

        return $snap;
    }

    private function getSnapProduct($product_id,$count,$product){
        $status = [
            'id' => $product_id,
            'name' => $product['name'],
            'price' => $product['price'],
            'main_img_url' => $product['main_img_url'],
            'count' => $count,
            'totalPrice' => $product['price'] * $count,
        ];

        return $status;
    }

    public function checkStock($oid){
        $oProducts = OrderProduct::where('order_id', '=', $oid)->select();
        $this->oProducts = $oProducts;
        $this->products = $this->getProducts();

        $status = $this->getOrderStatus();
        return $status;
    }

    private function getOrderStatus(){
        $oStatus = [
            'pass' => true,
            'orderPrice' => 0,
            'pStatusArray' => [],
        ];

        foreach($this->oProducts as $oProduct){
            $status = $this->getProductStatus($oProduct['product_id'],$oProduct['count'],$this->products);
            if(!$status['haveStock']){
                $oStatus['pass'] = false;
            }

            $oStatus['orderPrice'] += $status['totalPrice'];

            array_push($oStatus['pStatusArray'], $status);
        }

        return $oStatus;
    }

    private function getProductStatus($product_id, $count, $products){
        $pIndex = -1;

        $pStatus = [
            'id' => null,
            'haveStock' => false,
            'name' => '',
            'price' => 0,
            'count' => 0,
            'totalPrice' =>0,
            'main_img_url' => ''
        ];

        for($i=0;$i<count($products);$i++){
            if($product_id == $products[$i]['id']){
                $pIndex = $i;
            }
        }

        if($pIndex == -1){
            throw new BaseException('id为'.$product_id.'的商品不存在!');
        }

        $product = $products[$pIndex];
        $pStatus['id'] = $product_id;
        $pStatus['name'] = $product['name'];
        $pStatus['price'] = $product['price'];
        $pStatus['main_img_url'] = $product['main_img_url'];
        $pStatus['count'] = $count;
        $pStatus['totalPrice'] = $product['price'] * $count;

        if($product['stock'] - $count >= 0){
            $pStatus['haveStock'] = true;
        }

        return $pStatus;
    }

    private function getProducts(){
        $ids = [];

        foreach($this->oProducts as $p){
            array_push($ids, $p['product_id']);
        }

        $products = ProductModel::all($ids);

        $products = collection($products)->visible(['id','name','stock','price','main_img_url'])->toArray();

        return $products;
    }

    private function makeOrderSN(){
        $yCode = ['A','B','C','D','E','F','G','H','I','J','J','K'];

        $sn = $yCode[intval(date('Y') % 12)].time().mt_rand(1,9999);

        return $sn;
    }

    private function getUserAddress(){
        $address = UserAddress::where('user_id', '=', $this->uid)->find();

        if(!$address){
            throw new BaseException('收货人地址不能为空！');
        }

        return $address;
    }
}