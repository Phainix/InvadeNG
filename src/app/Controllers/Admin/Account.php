<?php

namespace App\Controllers\Admin;

use App\Library\Controller as BaseController;
use App\Library\BasicFunctions;
use App\Helpers\Account as AccountHelper;
use Psr\Container\ContainerInterface;

class Account extends BaseController {

    public function __construct(ContainerInterface $container) {
        parent::__construct($container);
        $this->account_helper = new AccountHelper($this->container->get('logger'));
    }

    public function dashboard($request, $response, array $args) {
        $this->container->get('view')->render($response, 'admin/dashboard.html', $this->data);
    }

    public function users($request, $response, array $args) {
        $this->data['users'] = $this->account_helper->getAllUsers();
        $this->container->get('view')->render($response, 'admin/users.html', $this->data);
    }

    public function changeStatus($request, $response, array $args) {
        $result = $this->account_helper->changeStatus($args['user'], $args['status']);
        if($result) $this->container->session->alert = ['message' => 'User status changed successfully', 'type' => 'success'];
        else $this->container->session->alert = ['message' => 'User status change failed', 'type' => 'danger'];
        return $response->withRedirect('/backend/account/users', 301);
    }

    public function changeType($request, $response, array $args) {
        $result = $this->account_helper->changeType($args['user'], $args['type']);
        if($result) $this->container->session->alert = ['message' => 'User '.($args['type'] == '1' ? 'upgrade' : 'downgrade').' successful', 'type' => 'success'];
        else $this->container->session->alert = ['message' => 'User '.($args['type'] == '1' ? 'upgrade' : 'downgrade').' failed', 'type' => 'danger'];
        return $response->withRedirect('/backend/account/users', 301);
    }

    public function contact($request, $response, array $args) {
        $this->data['contacts'] = $this->account_helper->getAllContacts();
        $this->container->get('view')->render($response, 'admin/contact.html', $this->data);
    }
    
}