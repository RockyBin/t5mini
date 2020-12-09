<?php


namespace app\api\controller\v1;


use app\common\lib\validate\IdMustIntValidate;
use app\api\service\Pay as PayService;
use think\Loader;
use think\Log;
use app\api\service\PayNotify as PayNotifyService;
Loader::import('Wxpay.WxPay',EXTEND_PATH, '.Api.php');

class Pay extends BaseController
{

    public function pre_order($id=''){
        (new IdMustIntValidate())->goCheck();

        $payService = new PayService($id);
        $res = $payService->pay();

        return success($res);
    }

    public function receiveNotify(){

        $postXml = file_get_contents('php://input');

        Log::record('rockpay:'.var_export($postXml,true));

        $config = new \WxPayConfig();

        $payNotify = new PayNotifyService();
        $payNotify->Handle($config,false);

    }
}