<?php


namespace app\api\model;


class Theme extends BaseModel
{
    protected $hidden = ['delete_time', 'update_time'];

    public function products(){
        return $this->belongsToMany('Product','ThemeProduct', 'theme_id', 'product_id');
    }

    public function topicImg(){
        return $this->belongsTo('Image', 'topic_img_id','id');
    }

    public static function getAll(){

        $themes = self::with('topicImg')->select();

        return $themes;
    }

    public static function getThemeById($id){
        $themes = self::with(['topicImg', 'products'])->find($id);

        return $themes;
    }

}