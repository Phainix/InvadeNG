<?php

namespace App\Routes;

use App\Controllers\Home as HomeController;
use App\Controllers\Cart as CartController;
use App\MiddleWare\AuthMiddleware;

class Frontend {

    public static function declare($app) {
        $container = $app->getContainer();
        $container['HomeController'] = function ($c) {
            return new HomeController($c);
        };
        $container['CartController'] = function ($c) {
            return new CartController($c);
        };
        $app->get('/', 'HomeController:home');
        $app->get('/designs/[{category_id}]', 'HomeController:designs');
        $app->get('/contactus', 'HomeController:contactus');
        $app->post('/contactus', 'HomeController:contactusPost');
        $app->get('/pages/{page}', 'HomeController:pages');
        $app->group('/cart', function($app) use($container) {
            $app->get('', 'CartController:cart');
            $app->get('/add/{material_id}/{design_id}', 'CartController:addToCart');
            $app->get('/remove/{cart_id}', 'CartController:removeFromCart');
            $app->get('/clear', 'CartController:clearCart');
            $app->get('/checkout', 'CartController:checkout')->add(new AuthMiddleware($container));
            $app->get('/shipping/set/{address_id}', 'CartController:setShippingAddress');
            $app->get('/shipping/express/{val}', 'CartController:setShippingExpress');
            $app->get('/shipping', 'CartController:shipping')->add(new AuthMiddleware($container));
            $app->get('/shipping/price/set/{price}', 'CartController:setShippingPrice');
            $app->get('/payment', 'CartController:payment')->add(new AuthMiddleware($container));
            $app->get('/billing/set/{address_id}', 'CartController:setBillingAddress');
            $app->get('/payment/set/{method}', 'CartController:setPaymentMethod');
            $app->get('/payment/process', 'CartController:processPayment')->add(new AuthMiddleware($container));
        });
        $app->get('/order/completed/{ref}/{order_ref}', 'CartController:completeOrder')->add(new AuthMiddleware($container));
    }

}