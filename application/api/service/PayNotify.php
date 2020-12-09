<?php


namespace app\api\service;

use app\api\model\Product;
use app\common\lib\EnumCode;
use think\Db;
use think\Loader;
use app\api\model\Order as OrderModel;
use app\api\service\Order as OrderService;
use think\Log;

Loader::import('Wxpay.WxPay',EXTEND_PATH, '.Api.php');

class PayNotify extends \WxPayNotify
{
    public function NotifyProcess($objData, $config, &$msg)
    {
        $objData = $objData->GetValues();
        Log::record('rockpay-$objData:'.var_export($objData,true));
        if($objData['result_code'] == 'SUCCESS'){

            $orderNo = $objData['out_trade_no'];

            Db::startTrans();

            try{
                $order = OrderModel::where('order_no', '=', $orderNo)->lock(true)->find();
                Log::record('rockpay-$order:'.var_export($order,true));
                Log::record('rockpay-$order->status:'.$order->status.'order_id'.$order->id);
                if($order->status == 1){
                    //检测库存
                    $orderService = new OrderService();
                    $status = $orderService->checkStock($order->id);

                    Log::record('rockpay-$status:'.var_export($status,true));
                    if($status['pass']){

                        //修改订单状态
                        $this->setOrderStatus($order->id,true);
                        //减库存
                        $this->reduceStock($status);

                    }else{
                        $this->setOrderStatus($this->id, false);
                    }
                }

                Db::commit();

            }catch (\Exception $e){
                Db::rollback();
                return false;
            }

        }

        return true;
    }

    private function setOrderStatus($oid,$success){

        $status = $success ? EnumCode::PAID : EnumCode::PAID_BUT_OUT_OF;

        OrderModel::where('id', '=', $oid)->update(['status'=>$status]);

    }

    private function reduceStock($status){
        foreach($status['pStatusArray'] as $singlePStatus){
            Product::where('id', '=', $singlePStatus['id'])->setDec('stock', $singlePStatus['count']);
        }
    }

}