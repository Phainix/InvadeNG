<?php

namespace App\Helpers;

use App\Library\Model;
use App\Helpers\App as AppHelper;
use App\Library\BasicFunctions;

class Admin extends AppHelper {

    public function __construct($logger) {
        parent::__construct($logger);
    }

    public function updateSetting($identifier, $content) {
        $model = new Model($this->logger);
        $model->setTable('settings');
        $model->where('identifier', $identifier);
        $model->set('content', $content);
        $model->set('date_updated', 'now()', true);
        $result = $model->update();
        return $result;
    }

    public function addCategory($category) {
        $model = new Model($this->logger);
        $model->setTable('categories');
        $model->set('name', $category);
        $model->set('status', 1);
        $model->set('date_created', 'now()', true);
        $result = $model->insert();
        return $result;
    }

    public function deleteCategories($id) {
        $model = new Model($this->logger);
        $model->setTable('categories');
        $model->where('id', $id);
        $result = $model->delete();
        return $result;
    }

    public function toggleCategories($id, $status) {
        $model = new Model($this->logger);
        $model->setTable('categories');
        $model->where('id', $id);
        $model->set('status', $status);
        $model->set('date_updated', 'now()', true);
        $result = $model->update();
        return $result;
    }

    public function changeStatus($id, $status, $table) {
        $model = new Model($this->logger);
        $model->setTable($table);
        $model->where('id', $id);
        $model->set('status', $status);
        $model->set('date_updated', 'now()', true);
        $result = $model->update();
        return $result;
    }

    public function changeType($user, $type) {
        $model = new Model($this->logger);
        $model->setTable('users');
        $model->where('id', $user);
        $model->set('user_type', $type);
        $model->set('date_updated', 'now()', true);
        $result = $model->update();
        return $result;
    }

    public function createMaterial($name, $price, $picture) {
        $model = new Model($this->logger);
        $model->setTable('materials');
        $model->set('name', $name);
        $model->set('price', $price);
        $model->set('picture1', $picture);
        $model->set('status', 1);
        $model->set('date_created', 'now()', true);
        $result = $model->insert();
        return $result;
    }

    public function updateMaterial($id, $name, $price, $sale_price, $file) {
        $model = new Model($this->logger);
        $model->setTable('materials');
        $model->where('id', $id);
        $model->set('name', $name);
        $model->set('price', $price);
        $model->set('sale_price', $sale_price);
        if($file != false) $model->set('picture1', $file);
        $model->set('date_updated', 'now()', true);
        $result = $model->update();
        return $result;
    }

    public function createDesign($name, $price, $category, $desc, $picture, $other_pictures) {
        $model = new Model($this->logger);
        $model->setTable('designs');
        $model->set('name', $name);
        $model->set('price', $price);
        $model->set('category_id', $category);
        $model->set('description', $desc);
        $model->set('picture', $picture);
        $model->set('other_pictures', $other_pictures);
        $model->set('status', 1);
        $model->set('date_created', 'now()', true);
        $result = $model->insert();
        return $result;
    }

    public function updateDesign($id, $name, $price, $category, $desc, $sale_price, $picture, $other_pictures) {
        $model = new Model($this->logger);
        $model->setTable('designs');
        $model->where('id', $id);
        $model->set('name', $name);
        $model->set('price', $price);
        $model->set('category_id', $category);
        $model->set('description', $desc);
        $model->set('sale_price', $sale_price);
        if($picture != false) {
            $model->set('picture', $picture);
            $model->set('other_pictures', $other_pictures);
        }
        $model->set('date_updated', 'now()', true);
        $result = $model->update();
        return $result;
    }

    public function changeDesignFeatured($id, $featured) {
        $model = new Model($this->logger);
        $model->setTable('designs');
        $model->where('id', $id);
        $model->set('featured', $featured);
        $model->set('date_updated', 'now()', true);
        $result = $model->update();
        return $result;
    }

    public function getBanner($id) {
        $model = new Model($this->logger);
        $model->setTable('banners');
        $model->where('id', $id);
        $data = $model->select();
        return count($data) > 0 ? $data[0] : [];
    }

    public function createBanner($title, $link, $desc, $btn, $image) {
        $model = new Model($this->logger);
        $model->setTable('banners');
        $model->set('title', $title);
        $model->set('link', $link);
        $model->set('btn_text', $btn);
        $model->set('description', $desc);
        $model->set('image', $image);
        $model->set('status', 1);
        $model->set('date_created', 'now()', true);
        $result = $model->insert();
        return $result;
    }

    public function updateBanner($id, $title, $link, $desc, $btn, $image) {
        $model = new Model($this->logger);
        $model->setTable('banners');
        $model->where('id', $id);
        $model->set('title', $title);
        $model->set('link', $link);
        $model->set('btn_text', $btn);
        $model->set('description', $desc);
        if($image != false) {
            $model->set('image', $image);
        }
        $model->set('date_updated', 'now()', true);
        $result = $model->update();
        return $result;
    }

    public function addBusinessCategory($category) {
        $model = new Model($this->logger);
        $model->setTable('business_categories');
        $model->set('name', $category);
        $model->set('status', 1);
        $model->set('date_created', 'now()', true);
        $result = $model->insert();
        return $result;
    }

    public function deleteBusinessCategories($id) {
        $model = new Model($this->logger);
        $model->setTable('business_categories');
        $model->where('id', $id);
        $result = $model->delete();
        return $result;
    }

    public function toggleBusinessCategories($id, $status) {
        $model = new Model($this->logger);
        $model->setTable('business_categories');
        $model->where('id', $id);
        $model->set('status', $status);
        $model->set('date_updated', 'now()', true);
        $result = $model->update();
        return $result;
    }

    public function getPage($id) {
        $model = new Model($this->logger);
        $model->setTable('pages');
        $model->where('id', $id);
        $data = $model->select();
        return count($data) > 0 ? $data[0] : [];
    }

    public function createPage($title, $link, $content) {
        $model = new Model($this->logger);
        $model->setTable('pages');
        $model->set('title', $title);
        $model->set('link', $link);
        $model->set('content', $content);
        $model->set('date_created', 'now()', true);
        $result = $model->insert();
        return $result;
    }

    public function updatePage($id, $title, $link, $content) {
        $model = new Model($this->logger);
        $model->setTable('pages');
        $model->where('id', $id);
        $model->set('title', $title);
        $model->set('link', $link);
        $model->set('content', $content);
        $model->set('date_updated', 'now()', true);
        $result = $model->update();
        return $result;
    }

    public function createImage($file) {
        $model = new Model($this->logger);
        $model->setTable('images');
        $model->set('link', $file);
        $model->set('date_created', 'now()', true);
        $result = $model->insert();
        return $result;
    }

    public function getImages() {
        $model = new Model($this->logger);
        $model->setTable('images');
        $data = $model->select();
        return count($data) > 0 ? $data : [];
    }

    public function updateShipping($shipping_method_id, $content) {
        $model = new Model($this->logger);
        $model->setTable('shipping_methods');
        $model->where('id', $shipping_method_id);
        $model->set('price', $content);
        $model->set('date_updated', 'now()', true);
        $result = $model->update();
        return $result;
    }

}