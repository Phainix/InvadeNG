<?php

namespace App\MiddleWare;

use App\Library\BasicFunctions;
use App\Helpers\Auth as AuthHelper;

class AuthMiddleware
{

    public function __construct($container, $user_type = '3') {
        $this->container = $container;
        if($user_type == '1') {
            $this->user = 'admin';
            $this->login_page = '/backend';
        } elseif($user_type == '2') {
            $this->user = 'designer';
            $this->login_page = '/backend';
        } elseif($user_type == '3') {
            $this->user = 'user';
            $this->login_page = '/login';
        }
    }
    /**
     * Example middleware invokable class
     *
     * @param  \Psr\Http\Message\ServerRequestInterface $request  PSR7 request
     * @param  \Psr\Http\Message\ResponseInterface      $response PSR7 response
     * @param  callable                                 $next     Next middleware
     *
     * @return \Psr\Http\Message\ResponseInterface
     */
    public function __invoke($request, $response, $next)
    {
        
        if(!$this->container->session->exists('user')) return $response->withRedirect($this->login_page, 301);

        $user = $this->container->session->user;

        if($this->user == 'admin') {
            if($user['admin'] !== true) return $response->withRedirect($this->login_page, 301);
        }

        if($this->user == 'designer') {
            if($user['designer'] !== true) return $response->withRedirect($this->login_page, 301);
        }

        $this->auth_helper = new AuthHelper($this->container->get('logger'));
        $session = $this->auth_helper->getSession($user);
        if(!$session) return $response->withRedirect($this->login_page, 301);

        $now = new \DateTime('NOW', new \DateTimeZone('Africa/Lagos'));
        $last = new \DateTime($session['last_activity'], new \DateTimeZone('Africa/Lagos'));
        $last->add(new \DateInterval('PT10M'));

        if($now > $last) {
            return $response->withRedirect($this->login_page, 301);
        }

        $this->auth_helper->extendSession($user);
        $response = $next($request, $response);
        return $response;
    }
}