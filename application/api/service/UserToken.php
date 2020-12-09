<?php


namespace app\api\service;


use app\api\model\User as UserModel;
use app\common\lib\exception\WxloginException;

class UserToken extends Token
{

    protected $appid = '';
    protected $secret = '';
    protected $code = '';
    protected $login_url = '';

    public function __construct($code='')
    {
        $this->init($code);
    }

    private function init($code){
        $this->appid = config('wx.appid');
        $this->secret = config('wx.secret');
        $this->code = $code;
        $this->login_url = sprintf(config('wx.wx_login_url'), $this->appid, $this->secret, $this->code);
    }

    public function token(){

        $result = curl_get($this->login_url);

        $res = json_decode($result,true);

        if(empty($res)){
            throw new \Exception('服务器内部错误');
        }else{
            $loginFail = array_key_exists('errcode', $res);

            if($loginFail){
                throw new WxloginException();
            }else{
                return $this->grantToken($res);
            }
        }

    }

    private function grantToken($res){
        //{"session_key":"LixFZVsmcQUmwedFTNLU2g==","openid":"oPI4p43wGdbobOhYZCAYUXjgQzWo"}

        //获取用户openId
        $openId = $res['openid'];

        //判断用户是否存
        $user = UserModel::where('openid', '=', $openId)->find();
        if($user){
            $uid = $user->id;
        }else{
            $u = UserModel::create([
                'openid' => $openId
            ]);

            $uid = $u->id;
        }

        $res['uid'] = $uid;
        $res['scope'] = 15;

        $expire_in = 3600 * 24 *30;

        //生成token
        $token = $this->generateToken();

        cache($token,$res,$expire_in);

        return $token;
    }

}