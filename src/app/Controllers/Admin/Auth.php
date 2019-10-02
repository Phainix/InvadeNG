<?php

namespace App\Controllers\Admin;

use App\Library\Controller as BaseController;
use App\Library\BasicFunctions;
use App\Helpers\Auth as AuthHelper;
use App\Helpers\Account as AccountHelper;
use Psr\Container\ContainerInterface;

class Auth extends BaseController {

    public function __construct(ContainerInterface $container) {
        parent::__construct($container);
        $this->auth_helper = new AuthHelper($this->container->get('logger'));
        $this->account_helper = new AccountHelper($this->container->get('logger'));
    }

    public function register($request, $response, array $args) {
        $data = $request->getParsedBody();
        if($data['register-name'] == '' || $data['register-email'] == '' || $data['register-number'] == '' || $data['register-password'] == '') {
            $this->container->session->alert = ['message' => 'Registration form is invalid, please fill correctly', 'type' => 'danger'];
            return $response->withRedirect('/login', 301);
        }
        $user = $this->account_helper->getUserByEmail($data['register-email']);
        if($user !== false) {
            $this->container->session->alert = ['message' => 'This email address is linked to anther account, please login or try again with  a different email', 'type' => 'danger'];
            return $response->withRedirect('/login', 301);
        }
        $registered = $this->account_helper->addUser(['name' => $data['register-name'], 'email' => $data['register-email'], 'number' => $data['register-number'], 'password' => $data['register-password'], 'type' => 3]);
        if($registered) {
            return $response->withRedirect('/account/measurement');
        }
        $this->container->session->alert = ['message' => 'Registration unsuccessful, please try again', 'type' => 'danger'];
        return $response->withRedirect('/login', 301);
        
    }

    public function login($request, $response, array $args) {
        $data = $request->getParsedBody();
        if($data['login-email'] == '' || $data['login-password'] == '') {
            $this->container->session->alert = ['message' => 'Login form is invalid, please fill correctly', 'type' => 'danger'];
            return $response->withRedirect('/backend', 301);
        }
        $user = $this->account_helper->getUserByEmail($data['login-email']);
        if($user === false) {
            $this->container->session->alert = ['message' => 'Email or Password is incorrect, please try again', 'type' => 'danger'];
            return $response->withRedirect('/backend', 301);
        }

        if(hash('sha512', $data['login-password']) !== $user['password']) {
            $this->container->session->alert = ['message' => 'Email or Password is incorrect, please try again', 'type' => 'danger'];
            return $response->withRedirect('/backend', 301);
        }

        if($user['user_type'] != 1 && $user['user_type'] != 2) {
            $this->container->session->alert = ['message' => 'Please login from user console', 'type' => 'danger'];
            return $response->withRedirect('/login', 301);
        }

        $this->startUserSession($user);
        if($user['user_type'] == 1) return $response->withRedirect('/backend/account/dashboard', 301);
        if($user['user_type'] == 2) return $response->withRedirect('/backend/designer/dashboard', 301);
    }

    private function startUserSession($user) {
        $userSession = ['first_name' => $user['first_name'], 'last_name' => $user['last_name'], 'email' => $user['email'], 'msisdn' => $user['msisdn'], 'id' => $user['id'], 'type' => $user['user_type'], 'username' => $user['username'], 'session_id' => BasicFunctions::genRand(64)];
        if($user['user_type'] == 1) $userSession['admin'] = true;
        if($user['user_type'] == 2) $userSession['designer'] = true;
        $this->container->session->user = $userSession;
        $this->account_helper->updateLastLogin($userSession);
        $this->auth_helper->createSession($userSession);
    }
}