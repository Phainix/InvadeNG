<?php

namespace App\Controllers\Admin;

use App\Library\Controller as BaseController;
use App\Library\BasicFunctions;
use App\Helpers\Admin as AdminHelper;
use Psr\Container\ContainerInterface;
use Intervention\Image\ImageManager;

class Design extends BaseController {

    public function __construct(ContainerInterface $container) {
        parent::__construct($container);
        $this->admin_helper = new AdminHelper($this->container->get('logger'));
    }

    public function designs($request, $response, array $args) {
        $this->data['designs'] = $this->admin_helper->getDesigns(true);
        $this->container->get('view')->render($response, 'admin/designs.html', $this->data);
    }

    public function designsManage($request, $response, array $args) {
        $design_id = isset($args['design_id']) ? $args['design_id'] : 0;
        $this->data['design'] = [];
        if($design_id != 0) {
            $this->data['design'] = $this->admin_helper->getDesign($design_id);
        }
        $this->data['design_id'] = $design_id;
        $this->data['categories'] = $this->admin_helper->getCategories();
        $this->container->get('view')->render($response, 'admin/designs_manage.html', $this->data);
    }
    
    public function designsManagePost($request, $response, array $args) {
        $data = $request->getParsedBody();
        $picture = false;
        if($data['design-name'] == '' || $data['design-price'] == '' || $data['design-category'] == '' || $data['design-desc'] == '' || ($data['design_id'] == 0 && !getimagesize($_FILES['design-picture']["tmp_name"]))) {
            $this->container->session->alert = ['message' => 'Design form is invalid, please fill correctly', 'type' => 'danger'];
            return $response->withRedirect('/backend/account/designs/manage/', 301);
        }
        $pictures = [];
        foreach($_FILES as $file => $details) {
            if(getimagesize($_FILES[$file]["tmp_name"])) {
                $manager = new ImageManager(array('driver' => 'gd'));
                $image = $manager->make($_FILES[$file]["tmp_name"])->fit(270, 400);
                $image->save(__DIR__.'/../../../../public/designs/'.$_FILES[$file]["name"]);
                if($file == 'design-picture') {
                    $picture = "/designs/" . $_FILES[$file]["name"];
                } else {
                    array_push($pictures, "/designs/" . $_FILES[$file]["name"]);
                }
            }
        }
        if($data['design_id'] == 0) {
            $result = $this->admin_helper->createDesign($data['design-name'], $data['design-price'], $data['design-category'], $data['design-desc'], $picture, json_encode($pictures));
        } else {
            $result = $this->admin_helper->updateDesign($data['design_id'], $data['design-name'], $data['design-price'], $data['design-category'], $data['design-desc'], $data['design-sale-price'], $picture, json_encode($pictures));
        }

        if($result) {
            $this->container->session->alert = ['message' => 'Operation successful', 'type' => 'success'];
        } else {
            $this->container->session->alert = ['message' => 'Operation unsuccessful', 'type' => 'danger'];
        }
        return $response->withRedirect('/backend/account/designs', 301);
    }

    public function changeDesignStatus($request, $response, array $args) {
        $result = $this->admin_helper->changeStatus($args['design_id'], $args['status'], 'designs');
        if($result) $this->container->session->alert = ['message' => 'Design status changed successfully', 'type' => 'success'];
        else $this->container->session->alert = ['message' => 'Design status change failed', 'type' => 'danger'];
        return $response->withRedirect('/backend/account/designs', 301);
    }

    public function changeDesignFeatured($request, $response, array $args) {
        $result = $this->admin_helper->changeDesignFeatured($args['design_id'], $args['featured']);
        if($result) $this->container->session->alert = ['message' => 'Operation successful', 'type' => 'success'];
        else $this->container->session->alert = ['message' => 'Operation failed', 'type' => 'danger'];
        return $response->withRedirect('/backend/account/designs', 301);
    }
    
}