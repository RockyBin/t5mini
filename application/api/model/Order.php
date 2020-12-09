<?php


namespace app\api\model;


class Order extends BaseModel
{

    protected $autoWriteTimestamp = true;

    protected $hidden = ['prepay_id'];

    //snap_address
    public function getSnapAddressAttr($value){
        if(!$value){
            return null;
        }

        return json_decode($value, true);
    }

    //snap_items
    public function getSnapItemsAttr($value){
        if(!$value){
            return null;
        }

        return json_decode($value, true);
    }


    public static function getOrderList($uid,$page, $size){

        $data = self::where('user_id', '=', $uid)
            ->order('create_time','desc')
            ->page($page, $size)
            ->select();

        if(!$data){
            $d['cur_total'] = 0;
            $d['cur_page'] = $page;
            $d['per_size'] = $size;
            $d['data'] = $data;

            return $d;
        }

        $data = collection($data)->hidden(['snap_items','snap_address','prepay_id'])->toArray();

        $count = count($data);

        $d['cur_total'] = $count;
        $d['cur_page'] = $page;
        $d['per_size'] = $size;
        $d['data'] = $data;

        return $d;
    }

    public static function getDetail($id){
        $data = self::get($id);

        return $data;
    }
}