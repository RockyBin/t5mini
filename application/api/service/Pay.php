<?php


namespace app\api\service;

use app\common\lib\exception\BaseException;
use app\api\service\Order as OrderService;
use app\api\model\Order as OrderModel;
use think\Loader;
use think\Log;

Loader::import('Wxpay.WxPay', EXTEND_PATH, '.Api.php');

class Pay extends Token
{
    protected $order_id;
    protected $order_no;
    protected $config;

    /**
     * 始始化订单
     * Pay constructor.
     * @param string $id
     * @throws BaseException
     */
    public function __construct($id='')
    {
        if(!$id){
            throw new BaseException('订单号不能为空');
        }

        $this->order_id = $id;
    }


    /**
     * 支付
     * @return array
     * @throws BaseException
     * @throws \WxPayException
     * @throws \app\common\lib\exception\DataException
     * @throws \think\exception\DbException
     */
    public function pay(){

        //检测订单号有效性
        $this->checkValid();

        //检测库存
        $orderService = new OrderService();
        $status = $orderService->checkStock($this->order_id);

        if(!$status['pass']){
            throw new BaseException('商品库存不足！');
        }

        //获取预计支付订单
        $res = $this->getPreOrder($status);

        return $res;
    }

    /**
     * 获取预支付订单
     * @param $status
     * @return array
     * @throws \WxPayException
     * @throws \app\common\lib\exception\DataException
     */
    protected function getPreOrder($status){

        $openId = Token::getValueByToken('openid');

        $trade_no = $this->order_no;
        //测试
        //$trade_no = 'I-'.time();

        //WxPayUnifiedOrder
        $wxPay = new \WxPayUnifiedOrder();
        $wxPay->SetOut_trade_no($trade_no);
        $wxPay->SetOpenid($openId);
        $wxPay->SetTotal_fee($status['orderPrice'] * 100);
        $wxPay->SetSignType('MD5');
        $wxPay->SetBody('goods');
        $wxPay->SetTrade_type("JSAPI");
        $wxPay->SetNotify_url(config('wx.wx_notify_url'));

        $config = new \WxPayConfig();
        $this->config = $config;
        $order = \WxPayApi::unifiedOrder($config, $wxPay);

        $result = $this->getPreOrderData($order);

        return $result;
    }

    /**
     * 获取预支付订单数据
     * @param $order
     * @return array
     * @throws \WxPayException
     */
    private function getPreOrderData($order){

        if($order['result_code'] == 'SUCCESS' && $order['return_code'] == 'SUCCESS'){

            //appId、timeStamp、nonceStr、package、signType
//            $data['appId'] = $order['appid'];
//            $data['timeStamp'] = time();
//            $data['nonceStr'] = $order['nonce_str'];
//            $data['package'] = 'prepay_id=' . $order['prepay_id'];
//            $data['signType'] = 'MD5';
//
//            $order['time'] = $data['timeStamp'];
//            $order['paySign'] = $this->generateSign($data,config('wx.key'));

            //记录预支付订单到表中
            $this->savePrepayId($order);
            //处理支付参数签名等信息
            $order = $this->sign($order);

        }else{
            Log::record('支付失败'.$order, 'error');
        }

        return $order;
    }

    /**
     * 使用WxPayJsApiPay类进行处理参数
     * @param $order
     * @return array
     * @throws \WxPayException
     */
    private function sign($order){
        $WxPayJsApi = new \WxPayJsApiPay();
        $WxPayJsApi->SetAppid($order['appid']);
        $WxPayJsApi->SetTimeStamp((string)time());
        $WxPayJsApi->SetNonceStr($order['nonce_str']);
        $pack = 'prepay_id=' . $order['prepay_id'];
        $WxPayJsApi->SetPackage($pack);
        $WxPayJsApi->SetSignType('MD5');

        $sign = $WxPayJsApi->MakeSign($this->config);
        $values = $WxPayJsApi->GetValues();

        $values['paySign'] = $sign;

        unset($values['appId']);

        return $values;
    }

    /**
     * 修改预处理订单
     * @param $order
     * @return OrderModel
     */
    private function savePrepayId($order){
        return OrderModel::where('id','=', $this->order_id)->update(['prepay_id'=>$order['prepay_id']]);
    }


    /**
     * 检测订单有效性
     * @return bool
     * @throws BaseException
     * @throws \think\exception\DbException
     */
    private function checkValid(){
        //判断订单是否存在
        $order = OrderModel::get($this->order_id);

        if(!$order){
            throw new BaseException('订单不存在!');
        }

        $this->order_no = $order->order_no;

        //判断用户有效性
        Token::checkVolidUser($order->user_id);

        //判断订单是否已支付
        if($order->status != 1){
            throw new BaseException('订单已支付!');
        }

        return true;
    }

    /**
     * 生成签名
     * @param $data
     * @param $pay_key
     * @return string
     */
    private function generateSign($data, $pay_key) {

        //排序
        ksort($data);

        //拼接字符串
        $stringA = '';
        foreach ($data as $key => $value) {

            if (!$value) continue;

            if ($stringA) $stringA.= '&' . $key . "=" . $value;

            else $stringA = $key . "=" . $value;

        }

        $wx_key = $pay_key;

        $stringSignTemp = $stringA . '&key=' . $wx_key;

        //返回md5字符串，并转成大写
        return strtoupper(md5($stringSignTemp));
    }
}