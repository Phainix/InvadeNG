<?php

namespace App\Controllers\Admin;

use App\Library\Controller as BaseController;
use App\Library\BasicFunctions;
use App\Helpers\Admin as AdminHelper;
use Psr\Container\ContainerInterface;
use Intervention\Image\ImageManager;

class Material extends BaseController {

    public function __construct(ContainerInterface $container) {
        parent::__construct($container);
        $this->admin_helper = new AdminHelper($this->container->get('logger'));
    }

    public function materials($request, $response, array $args) {
        $this->data['materials'] = $this->admin_helper->getMaterials(true);
        $this->container->get('view')->render($response, 'admin/materials.html', $this->data);
    }

    public function materialsManage($request, $response, array $args) {
        $material_id = isset($args['material_id']) ? $args['material_id'] : 0;
        $this->data['material'] = [];
        if($material_id != 0) {
            $this->data['material'] = $this->admin_helper->getMaterial($material_id);
        }
        $this->data['material_id'] = $material_id;
        $this->container->get('view')->render($response, 'admin/materials_manage.html', $this->data);
    }
    
    public function materialsManagePost($request, $response, array $args) {
        $data = $request->getParsedBody();
        $file = false;
        if($data['material-name'] == '' || $data['material-price'] == '' || ($data['material_id'] == 0 && !getimagesize($_FILES['material-picture']["tmp_name"]))) {
            $this->container->session->alert = ['message' => 'Material form is invalid, please fill correctly', 'type' => 'danger'];
            return $response->withRedirect('/backend/account/materials/manage/', 301);
        }
        if(getimagesize($_FILES['material-picture']["tmp_name"])) {
            // create an image manager instance with favored driver
            $manager = new ImageManager(array('driver' => 'gd'));

            // to finally create image instances
            $image = $manager->make($_FILES['material-picture']["tmp_name"])->fit(300, 300);
            $image->save(__DIR__.'/../../../../public/materials/'.$_FILES['material-picture']["name"]);
            $file = "/materials/" . $_FILES['material-picture']["name"];
        }
        if($data['material_id'] == 0) {
            $result = $this->admin_helper->createMaterial($data['material-name'], $data['material-price'], $file);
        } else {
            $result = $this->admin_helper->updateMaterial($data['material_id'], $data['material-name'], $data['material-price'], $data['material-sale-price'], $file);
        }

        if($result) {
            $this->container->session->alert = ['message' => 'Operation successful', 'type' => 'success'];
        } else {
            $this->container->session->alert = ['message' => 'Operation unsuccessful', 'type' => 'danger'];
        }
        return $response->withRedirect('/backend/account/materials', 301);
    }

    public function changeMaterialStatus($request, $response, array $args) {
        $result = $this->admin_helper->changeStatus($args['material_id'], $args['status'], 'materials');
        if($result) $this->container->session->alert = ['message' => 'Material status changed successfully', 'type' => 'success'];
        else $this->container->session->alert = ['message' => 'Material status change failed', 'type' => 'danger'];
        return $response->withRedirect('/backend/account/materials', 301);
    }
    
}