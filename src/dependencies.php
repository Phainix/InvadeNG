<?php

use Slim\App;

return function (App $app) {
    $container = $app->getContainer();

    // view renderer
    $container['renderer'] = function ($c) {
        $settings = $c->get('settings')['renderer'];
        return new \Slim\Views\PhpRenderer($settings['template_path']);
    };

    // monolog
    $container['logger'] = function ($c) {
        $settings = $c->get('settings')['logger'];
        $logger = new \Monolog\Logger($settings['name']);
        $logger->pushProcessor(new \Monolog\Processor\UidProcessor());
        $logger->pushHandler(new \Monolog\Handler\StreamHandler($settings['path'], $settings['level']));
        return $logger;
    };

    $container['view'] = function ($container) {
        $view = new \Slim\Views\Twig(__DIR__.'/app/Views', [
            'cache' => false
        ]);
    
        // Instantiate and add Slim specific extension
        $router = $container->get('router');
        $uri = \Slim\Http\Uri::createFromEnvironment(new \Slim\Http\Environment($_SERVER));
        $view->addExtension(new \Slim\Views\TwigExtension($router, $uri));
        return $view;
    };

    $container['session'] = function ($container) {
        return new \SlimSession\Helper;
    };
    
    $container['csrf'] = function ($container)  {
        $guard = new \Slim\Csrf\Guard();
        $guard->setFailureCallable(function ($request, $response, $next) use ($container) {
            $request = $request->withAttribute("csrf_status", false);
            $container->session->alert = ['message' => 'Operation could not be completed, please try again', 'type' => 'danger'];

            $refererHeader = $request->getHeader('HTTP_REFERER');
            if ($refererHeader) {
                // Extract referer value
                $referer = array_shift($refererHeader);
            }

            return $response->withRedirect($referer, 301);
        });
        return $guard;
    };
};
