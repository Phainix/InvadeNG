<?php

namespace App\Routes;

use App\Controllers\Auth as AuthController;

class Auth {

    public static function declare($app) {
        $container = $app->getContainer();
        $container['AuthController'] = function ($c) {
            return new AuthController($c);
        };
        $app->get('/login', 'AuthController:login');
        $app->post('/login', 'AuthController:loginPost');
        $app->get('/register', 'AuthController:login');
        $app->post('/register', 'AuthController:register');
    }

}