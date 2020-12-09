<?php


namespace app\api\model;


class ProductImage extends BaseModel
{
    public function img(){
        return $this->belongsTo('Image', 'img_id', 'id');
    }
}