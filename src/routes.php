<?php

use Slim\App;
use Slim\Http\Request;
use Slim\Http\Response;

use App\Routes\Frontend as FrontendRoutes;
use App\Routes\Auth as AuthRoutes;
use App\Routes\Account as AccountRoutes;
use App\Routes\Admin as AdminRoutes;

return function (App $app) {
    $container = $app->getContainer();
    $app->add($container->get('csrf'));

    FrontendRoutes::declare($app);
    AuthRoutes::declare($app);
    AccountRoutes::declare($app);
    AdminRoutes::declare($app);
};
