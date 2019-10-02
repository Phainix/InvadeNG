<?php

namespace App\Routes;

use App\Controllers\Account as AccountController;
use App\MiddleWare\AuthMiddleware;

class Account {

    public static function declare($app) {
        $container = $app->getContainer();
        $container['AccountController'] = function ($c) {
            return new AccountController($c);
        };

        $app->group('/account', function($app) {
            $app->get('/dashboard', 'AccountController:dashboard');
            $app->get('/measurement', 'AccountController:measurement');
            $app->post('/measurement', 'AccountController:measurementPost');
            $app->post('/edit_details', 'AccountController:editDetails');
            $app->post('/change_password', 'AccountController:changePassword');
            $app->get('/addresses/[{address_id}]', 'AccountController:addresses');
            $app->post('/addresses/new', 'AccountController:addressesNew');
            $app->post('/addresses/manage', 'AccountController:addressesManage');
            $app->get('/orders', 'AccountController:allOrders');
            $app->get('/orders/{order_id}', 'AccountController:orderDetails');
        })->add(new AuthMiddleware($container));

    }

}