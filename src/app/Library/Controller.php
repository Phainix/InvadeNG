<?php

namespace App\Library;

use Psr\Container\ContainerInterface;

class Controller {

    public function __construct(ContainerInterface $container, $bodyClass = '') {
        $this->container = $container;
        $this->data = ['body' => $bodyClass, 'session' => $this->container->session, 'csrf' => $this->container->csrf];
    }

}