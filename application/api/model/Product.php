<?php


namespace app\api\model;


class Product extends BaseModel
{

    protected $hidden = ['create_time', 'delete_time', 'update_time', 'from'];

    public function imgs(){
        return $this->hasMany('ProductImage','product_id', 'id');
    }

    public function property(){
        return $this->hasMany('ProductProperty','product_id', 'id');
    }

    protected function getMainImgUrlAttr($value, $data){
        if($data['from'] ==1){
            return config('setting.prefix_url') . $value;
        }else{
            return $value;
        }
    }

    public static function getByCategoryId($id){
        $products = self::where('category_id','=',$id)->select();

        $products = collection($products)->hidden(['summary', 'stock', 'img_id', 'category_id'])->toArray();

        return $products;
    }

    public static function getRecent($limit){

        $products = self::limit($limit)
            ->order('create_time', 'desc')
            ->select();

        $products = collection($products)->hidden(['summary','img_id','category_id'])->toArray();

        return $products;
    }

    public static function getDetailById($id){

        $product = self::with([
            'imgs' => function($query){
                $query->with('img')->order('order', 'desc');
            }
        ])
            ->with(['property'])->find($id);

        return $product;
    }

}