<?php

namespace App\Controllers;

use App\Controllers\Frontend as BaseFrontendController;
use App\Helpers\Frontend as FrontendHelper;
use App\Helpers\Account as AccountHelper;
use App\Library\BasicFunctions;
use Psr\Container\ContainerInterface;

class Home extends BaseFrontendController {

    public function __construct(ContainerInterface $container) {
        parent::__construct($container);
        $this->frontend_helper = new FrontendHelper($this->container->get('logger'));
    }

    public function home($request, $response, array $args) {
        // BasicFunctions::ddump($_SERVER,$request->getUri()->getBasePath(), $request->getAttribute('route'));
        $this->data['body'] = 'home';
        $this->data['featured'] = $this->frontend_helper->getDesigns(0, 0, ['featured', 'DESC'], 4);
        $this->data['banners'] = $this->frontend_helper->getBanners();
        $this->container->get('view')->render($response, 'home.html', $this->data);
    }

    public function designs($request, $response, array $args) {
        $category_id = isset($args['category_id']) ? $args['category_id'] : 0;
        $page = $request->getQueryParam('page') ?  $request->getQueryParam('page') : 1;
        $sort = $request->getQueryParam('sort') ?  $request->getQueryParam('sort') : 'date_desc';
        $sorters = [
            'featured' => ['featured', 'DESC'],
            'name_asc' => ['designs.name', 'ASC'],
            'name_desc' => ['designs.name', 'DESC'],
            'price_asc' => ['price_edited', 'ASC'],
            'price_desc' => ['price_edited', 'DESC'],
            'date_asc' => ['designs.id', 'ASC'],
            'date_desc' => ['designs.id', 'DESC']
        ];
        $this->data['designs'] = $this->frontend_helper->getDesigns($category_id, ($page-1) * 12, $sorters[$sort]);
        $this->data['sort'] = $sort;
        $this->data['page'] = $page;
        $this->data['total'] = $this->frontend_helper->getTotalDesignCount($category_id);
        $this->data['totalPages'] = (int)($this->data['total'] / 12);
        $this->data['totalPages'] += $this->data['total'] % 12 > 0 ? 1 : 0;
        $this->data['start'] = (($page-1) * 12) + 1;
        $this->data['end'] = $this->data['start'] + count($this->data['designs']) - 1;
        $this->data['title'] = ($category_id == 0) ? 'designs' : $this->frontend_helper->getCategory($category_id)['name'];
        $queryPage = $request->getQueryParams();
        if(isset($queryPage['page'])) unset($queryPage['page']);
        foreach ($queryPage as $key => &$value) {
            $value = "$key=$value";
        }
        $querySort = $request->getQueryParams();
        if(isset($querySort['sort'])) unset($querySort['sort']);
        foreach ($querySort as $key => &$value) {
            $value = "$key=$value";
        }
        $this->data['queryPage'] = "?".implode('&',$queryPage).(count($queryPage) == 0 ? '' : '&');
        $this->data['querySort'] = "?".implode('&',$querySort).(count($querySort) == 0 ? '' : '&');
        $this->container->get('view')->render($response, 'designs.html', $this->data);
    }

    public function contactus($request, $response, array $args) {
        $this->container->get('view')->render($response, 'contactus.html', $this->data);
    }

    public function contactusPost($request, $response, array $args) {
        $data = $request->getParsedBody();
        if($data['contact-name'] == '' || $data['contact-email'] == '' || $data['contact-message'] == '') {
            $this->container->session->alert = ['message' => 'Contact form is invalid, please fill correctly', 'type' => 'danger'];
            return $response->withRedirect('/contactus', 301);
        }

        $result = $this->frontend_helper->contactUs($this->container->session->user['id'], $data);
        if($result) {
            $this->container->session->alert = ['message' => 'Message sent successfully', 'type' => 'success'];
        } else {
            $this->container->session->alert = ['message' => 'Operation failed', 'type' => 'danger'];
        }
        return $response->withRedirect('/contactus', 301);
    }

    public function pages($request, $response, array $args) {
        $uri = $request->getUri()->getPath();
        $uri = str_replace('/pages', '', $uri);
        $this->data['page'] = $this->frontend_helper->getPages($uri)[0];
        $this->container->get('view')->render($response, 'pages.html', $this->data);
    }
    
}