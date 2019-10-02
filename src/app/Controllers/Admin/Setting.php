<?php

namespace App\Controllers\Admin;

use App\Library\Controller as BaseController;
use App\Library\BasicFunctions;
use App\Helpers\Admin as AdminHelper;
use Psr\Container\ContainerInterface;
use Intervention\Image\ImageManager;

class Setting extends BaseController {

    public function __construct(ContainerInterface $container) {
        parent::__construct($container);
        $this->admin_helper = new AdminHelper($this->container->get('logger'));
    }

    public function settings($request, $response, array $args) {
        $this->data['banners'] = $this->admin_helper->getBanners(true);
        $this->data['settings'] = $this->admin_helper->getSettings();
        $this->data['business_categories'] = $this->admin_helper->getBusinessCategories(true);
        $this->data['pages'] = $this->admin_helper->getPages();
        $this->data['images'] = $this->admin_helper->getImages();
        $this->data['shipping_methods'] = $this->admin_helper->getShippingMethods();
        $this->container->get('view')->render($response, 'admin/settings.html', $this->data);
    }

    public function bannersManage($request, $response, array $args) {
        $banner_id = isset($args['banner_id']) ? $args['banner_id'] : 0;
        $this->data['banner'] = [];
        if($banner_id != 0) {
            $this->data['banner'] = $this->admin_helper->getBanner($banner_id);
        }
        $this->data['banner_id'] = $banner_id;
        $this->container->get('view')->render($response, 'admin/banners_manage.html', $this->data);
    }

    public function bannersManagePost($request, $response, array $args) {
        $data = $request->getParsedBody();
        $file = false;
        if($data['banner-title'] == '' || $data['banner-link'] == '' || $data['banner-desc'] == '' || $data['banner-btn-text'] == '' || ($data['banner_id'] == 0 && !getimagesize($_FILES['banner-picture']["tmp_name"]))) {
            $this->container->session->alert = ['message' => 'Banner form is invalid, please fill correctly', 'type' => 'danger'];
            return $response->withRedirect('/backend/account/settings/banners/manage/', 301);
        }
        if(getimagesize($_FILES['banner-picture']["tmp_name"])) {
            $manager = new ImageManager(array('driver' => 'gd'));
            $image = $manager->make($_FILES['banner-picture']["tmp_name"]);
            $image->save(__DIR__.'/../../../../public/banners/'.$_FILES['banner-picture']["name"]);
            $file = "/banners/" . $_FILES['banner-picture']["name"];
        }
        if($data['banner_id'] == 0) {
            $result = $this->admin_helper->createBanner($data['banner-title'], $data['banner-link'], $data['banner-desc'], $data['banner-btn-text'], $file);
        } else {
            $result = $this->admin_helper->updateBanner($data['banner_id'], $data['banner-title'], $data['banner-link'], $data['banner-desc'], $data['banner-btn-text'], $file);
        }

        if($result) {
            $this->container->session->alert = ['message' => 'Operation successful', 'type' => 'success'];
        } else {
            $this->container->session->alert = ['message' => 'Operation unsuccessful', 'type' => 'danger'];
        }
        return $response->withRedirect('/backend/account/settings', 301);
    }

    public function deleteBanner($request, $response, array $args) {
        $result = $this->admin_helper->deleteById($args['banner_id'], 'banners');
        if($result) $this->container->session->alert = ['message' => 'Banner deleted successfully', 'type' => 'success'];
        else $this->container->session->alert = ['message' => 'Banner deletion failed', 'type' => 'danger'];
        return $response->withRedirect('/backend/account/settings', 301);
    }

    public function updateSetting($request, $response, array $args) {
        $setting = $args['setting'];
        $content = $request->getQueryParam('content');

        $result = $this->admin_helper->updateSetting($setting, $content);
        if($result) $this->container->session->alert = ['message' => 'App data updated successfully', 'type' => 'success'];
        else $this->container->session->alert = ['message' => 'App data update failed', 'type' => 'danger'];
        return $response->withRedirect('/backend/account/settings', 301);
    }

    public function businessCategoriesPost($request, $response, array $args) {
        $data = $request->getParsedBody();
        if($data['category'] == '') {
            $this->container->session->alert = ['message' => 'Business Category form is invalid, please fill correctly', 'type' => 'danger'];
            return $response->withRedirect('/backend/account/settings', 301);
        }
        $result = $this->admin_helper->addBusinessCategory($data['category']);
        if(!$result) {
            $this->container->session->alert = ['message' => 'Operation could not be completed', 'type' => 'danger'];
            return $response->withRedirect('/backend/account/settings', 301);
        }
        $this->container->session->alert = ['message' => 'Business Category added successfully', 'type' => 'success'];
        return $response->withRedirect('/backend/account/settings', 301);
    }

    public function deleteBusinessCategories($request, $response, array $args) {
        $result = $this->admin_helper->deleteBusinessCategories($args['id']);
        if(!$result) {
            $this->container->session->alert = ['message' => 'Operation could not be completed', 'type' => 'danger'];
            return $response->withRedirect('/backend/account/settings', 301);
        }
        $this->container->session->alert = ['message' => 'Business Category deleted successfully', 'type' => 'success'];
        return $response->withRedirect('/backend/account/settings', 301);
    }

    public function toggleBusinessCategories($request, $response, array $args) {
        $result = $this->admin_helper->toggleBusinessCategories($args['id'],$args['status']);
        if(!$result) {
            $this->container->session->alert = ['message' => 'Operation could not be completed', 'type' => 'danger'];
            return $response->withRedirect('/backend/account/settings', 301);
        }
        $this->container->session->alert = ['message' => 'Business Category toggled successfully', 'type' => 'success'];
        return $response->withRedirect('/backend/account/settings', 301);
    }

    public function pagesManage($request, $response, array $args) {
        $page_id = isset($args['page_id']) ? $args['page_id'] : 0;
        $this->data['page'] = [];
        if($page_id != 0) {
            $this->data['page'] = $this->admin_helper->getPage($page_id);
        }
        $this->data['page_id'] = $page_id;
        $this->container->get('view')->render($response, 'admin/pages_manage.html', $this->data);
    }

    public function pagesManagePost($request, $response, array $args) {
        $data = $request->getParsedBody();
        if($data['page-title'] == '' || $data['page-link'] == '' || $data['page-content'] == '') {
            $this->container->session->alert = ['message' => 'Page form is invalid, please fill correctly', 'type' => 'danger'];
            return $response->withRedirect('/backend/account/settings/pages/manage/', 301);
        }
        if($data['page_id'] == 0) {
            $result = $this->admin_helper->createPage($data['page-title'], $data['page-link'], $data['page-content']);
        } else {
            $result = $this->admin_helper->updatePage($data['page_id'], $data['page-title'], $data['page-link'], $data['page-content']);
        }

        if($result) {
            $this->container->session->alert = ['message' => 'Operation successful', 'type' => 'success'];
        } else {
            $this->container->session->alert = ['message' => 'Operation unsuccessful', 'type' => 'danger'];
        }
        return $response->withRedirect('/backend/account/settings', 301);
    }

    public function imagesPost($request, $response, array $args) {
        $data = $request->getParsedBody();
        $file = false;
        if(!getimagesize($_FILES['file']["tmp_name"])) {
            $this->container->session->alert = ['message' => 'Image form is invalid, please fill correctly', 'type' => 'danger'];
            return $response->withRedirect('/backend/account/settings', 301);
        }
        if(getimagesize($_FILES['file']["tmp_name"])) {
            $manager = new ImageManager(array('driver' => 'gd'));
            $image = $manager->make($_FILES['file']["tmp_name"]);
            $image->save(__DIR__.'/../../../../public/images/'.$_FILES['file']["name"]);
            $file = "/images/" . $_FILES['file']["name"];
        }
        $result = $this->admin_helper->createImage($file);

        if($result) {
            $this->container->session->alert = ['message' => 'Operation successful', 'type' => 'success'];
        } else {
            $this->container->session->alert = ['message' => 'Operation unsuccessful', 'type' => 'danger'];
        }
        return $response->withRedirect('/backend/account/settings', 301);
    }

    public function deletePage($request, $response, array $args) {
        $result = $this->admin_helper->deleteById($args['page_id'], 'pages');
        if($result) $this->container->session->alert = ['message' => 'Page deleted successfully', 'type' => 'success'];
        else $this->container->session->alert = ['message' => 'Page deletion failed', 'type' => 'danger'];
        return $response->withRedirect('/backend/account/settings', 301);
    }

    public function updateShipping($request, $response, array $args) {
        $shipping_method_id = $args['shipping_method_id'];
        $content = $request->getQueryParam('content');

        $result = $this->admin_helper->updateShipping($shipping_method_id, $content);
        if($result) $this->container->session->alert = ['message' => 'Shipping updated successfully', 'type' => 'success'];
        else $this->container->session->alert = ['message' => 'shipping update failed', 'type' => 'danger'];
        return $response->withRedirect('/backend/account/settings', 301);
    }

}
