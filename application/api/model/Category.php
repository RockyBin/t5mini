<?php


namespace app\api\model;


class Category extends BaseModel
{
    public function topicImg(){
        return $this->belongsTo('Image', 'topic_img_id', 'id');
    }

    public static function getAll(){
        $categories = self::with('topicImg')->select();

        return $categories;
    }

}