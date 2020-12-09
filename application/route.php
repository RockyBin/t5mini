<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

use think\Route;

Route::get('api/:version/banner/:id', 'api/:version.Banner/index');
Route::get('api/:version/theme/all', 'api/:version.theme/index');
Route::get('api/:version/theme/:id', 'api/:version.theme/getThemeById');
Route::get('api/:version/category/all', 'api/:version.category/index');
Route::get('api/:version/category/:id', 'api/:version.product/getByCategoryId');

Route::get('api/:version/product/recent', 'api/:version.product/recent');
Route::get('api/:version/product/:id', 'api/:version.product/detail');

Route::post('api/:version/user/token', 'api/:version.User/token');
Route::post('api/:version/address/index', 'api/:version.Address/index');
Route::post('api/:version/order/placeOrder', 'api/:version.Order/place');
Route::post('api/:version/pay/preOrder/:id', 'api/:version.Pay/pre_order');
Route::post('api/:version/pay/notify', 'api/:version.Pay/receiveNotify');

Route::get('api/:version/order/list/:page', 'api/:version.Order/olist');
Route::get('api/:version/order/detail/:id', 'api/:version.Order/detail');

//Route::get('api/:version/order/placeOrder', 'api/:version.Order/place');
