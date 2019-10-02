<?php

namespace App\Controllers\Admin;

use Psr\Container\ContainerInterface;
use App\Library\Controller as BaseController;

class Admin extends BaseController {

    public function __construct(ContainerInterface $container) {
        parent::__construct($container);
    }

    public function home($request, $response, array $args) {
        $this->container->session->delete('user');
        $this->container->get('view')->render($response, 'admin/home.html', $this->data);
    }
}