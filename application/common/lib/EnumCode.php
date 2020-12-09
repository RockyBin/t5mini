<?php


namespace app\common\lib;


class EnumCode
{

    const SUCCESS = 'ok';
    const ERROR = 'fail';
    const OK = 0;
    const ERR = 1;
    const USER =15;
    // 待支付
    const UNPAID = 1;

    // 已支付
    const PAID = 2;

    // 已发货
    const DELIVERED = 3;

    // 已支付，但库存不足
    const PAID_BUT_OUT_OF = 4;

    // 已处理PAID_BUT_OUT_OF
    const HANDLED_OUT_OF = 5;

}