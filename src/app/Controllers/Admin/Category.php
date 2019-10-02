<?php

namespace App\Controllers\Admin;

use App\Library\Controller as BaseController;
use App\Library\BasicFunctions;
use App\Helpers\Admin as AdminHelper;
use Psr\Container\ContainerInterface;

class Category extends BaseController {

    public function __construct(ContainerInterface $container) {
        parent::__construct($container);
        $this->admin_helper = new AdminHelper($this->container->get('logger'));
    }

    public function categories($request, $response, array $args) {
        $this->data['categories'] = $this->admin_helper->getCategories(true);
        $this->container->get('view')->render($response, 'admin/categories.html', $this->data);
    }

    public function categoriesPost($request, $response, array $args) {
        $data = $request->getParsedBody();
        if($data['category'] == '') {
            $this->container->session->alert = ['message' => 'Category form is invalid, please fill correctly', 'type' => 'danger'];
            return $response->withRedirect('/backend/account/category', 301);
        }
        $result = $this->admin_helper->addCategory($data['category']);
        if(!$result) {
            $this->container->session->alert = ['message' => 'Operation could not be completed', 'type' => 'danger'];
            return $response->withRedirect('/backend/account/categories', 301);
        }
        $this->container->session->alert = ['message' => 'Category added successfully', 'type' => 'success'];
        return $response->withRedirect('/backend/account/categories', 301);
    }

    public function deleteCategories($request, $response, array $args) {
        $result = $this->admin_helper->deleteCategories($args['id']);
        if(!$result) {
            $this->container->session->alert = ['message' => 'Operation could not be completed', 'type' => 'danger'];
            return $response->withRedirect('/backend/account/categories', 301);
        }
        $this->container->session->alert = ['message' => 'Category deleted successfully', 'type' => 'success'];
        return $response->withRedirect('/backend/account/categories', 301);
    }

    public function toggleCategories($request, $response, array $args) {
        $result = $this->admin_helper->toggleCategories($args['id'],$args['status']);
        if(!$result) {
            $this->container->session->alert = ['message' => 'Operation could not be completed', 'type' => 'danger'];
            return $response->withRedirect('/backend/account/categories', 301);
        }
        $this->container->session->alert = ['message' => 'Category toggled successfully', 'type' => 'success'];
        return $response->withRedirect('/backend/account/categories', 301);
    }
    
}