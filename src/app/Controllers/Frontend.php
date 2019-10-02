<?php

namespace App\Controllers;

use App\Library\Controller as BaseController;
use App\Helpers\Frontend as FrontendHelper;
use Psr\Container\ContainerInterface;

class Frontend extends BaseController {

    public function __construct(ContainerInterface $container) {
        parent::__construct($container);
        $frontend_helper = new FrontendHelper($this->container->get('logger'));
        $this->data['categories'] = $frontend_helper->getCategories();
        $this->data['materials'] = $frontend_helper->getMaterials();
        $this->data['settings'] = $frontend_helper->getSettings();
    }

}