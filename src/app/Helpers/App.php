<?php

namespace App\Helpers;

use App\Library\Model;
use App\Library\BasicFunctions;

class App {

    public function __construct($logger) {
        $this->logger = $logger;
    }

    public function getSettings() {
        $model = new Model($this->logger);
        $model->setTable('settings');
        $data = $model->select();
        $data2 = [];
        foreach ($data as $key => $value) {
            $data2[$value['identifier']] = $value;
        }
        return count($data2) > 0 ? $data2 : [];
    }

    public function getSetting($identifier) {
        $model = new Model($this->logger);
        $model->setTable('settings');
        $model->where('identifier', $identifier);
        $data = $model->select();
        return count($data) > 0 ? $data[0] : false;
    }
    
    public function getCategories($all = false, $order = false) {
        $model = new Model($this->logger);
        $model->setTable('categories');
        if($all == false) $model->where('status', 1);
        if($order) {
            $model->orderby($order[0], $order[1]);
        } else {
            $model->orderby('id');
        }
        $data = $model->select();
        return count($data) > 0 ? $data : [];
    }

    public function getCategory($id) {
        $model = new Model($this->logger);
        $model->setTable('categories');
        $model->where('id', $id);
        $data = $model->select();
        return count($data) > 0 ? $data[0] : [];
    }

    public function getMaterials($all = false, $order = false) {
        $model = new Model($this->logger);
        $model->setTable('materials');
        if($all == false) $model->where('status', 1);
        if($order) {
            $model->orderby($order[0], $order[1]);
        } else {
            $model->orderby('id');
        }
        $data = $model->select();
        return count($data) > 0 ? $data : [];
    }

    public function getMaterial($id) {
        $model = new Model($this->logger);
        $model->setTable('materials');
        $model->where('id', $id);
        $data = $model->select();
        return count($data) > 0 ? $data[0] : [];
    }

    public function getDesigns($all = false, $order = false) {
        $model = new Model($this->logger);
        $model->setTable('designs');
        $model->get('designs.*');
        $model->get('categories.name as category');
        if($all == false) $model->where('status', 1);
        if($order) {
            $model->orderby($order[0], $order[1]);
        } else {
            $model->orderby('id');
        }
        $model->join('categories', 'categories.id', 'designs.category_id');
        $data = $model->select();
        return count($data) > 0 ? $data : [];
    }

    public function getDesign($id) {
        $model = new Model($this->logger);
        $model->setTable('designs');
        $model->where('id', $id);
        $data = $model->select();
        return count($data) > 0 ? $data[0] : [];
    }

    public function getBanners($all = false) {
        $model = new Model($this->logger);
        $model->setTable('banners');
        if($all == false) $model->where('status', 1);
        $model->orderby('id');
        $data = $model->select();
        return count($data) > 0 ? $data : [];
    }

    public function deleteById($id, $table) {
        $model = new Model($this->logger);
        $model->setTable($table);
        $model->where('id', $id);
        $result = $model->delete();
        return $result;
    }

    public function getById($id, $table, $where = []) {
        $model = new Model($this->logger);
        $model->setTable($table);
        $model->where('id', $id);
        foreach ($where as $key => $value) {
            $model->where($key, $value);
        }
        $data = $model->select();
        return count($data) > 0 ? $data[0] : [];
    }

    public function getBusinessCategories($all = false) {
        $model = new Model($this->logger);
        $model->setTable('business_categories');
        if($all == false) $model->where('status', 1);
        $data = $model->select();
        return count($data) > 0 ? $data : [];
    }

    public function getPages($page = false) {
        $model = new Model($this->logger);
        $model->setTable('pages');
        if($page != false) $model->where('link', $page);
        $data = $model->select();
        return count($data) > 0 ? $data : [];
    }

    public function getShippingMethods() {
        $model = new Model($this->logger);
        $model->setTable('shipping_methods');
        $model->orderby('id', 'ASC');
        $data = $model->select();
        return count($data) > 0 ? $data : [];
    }

    public function getAddress() {
        $model = new Model($this->logger);
        $model->setTable('addresses');
        
    }

}