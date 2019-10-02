<?php

namespace App\Helpers;

use App\Library\Model;
use App\Helpers\App as AppHelper;
use App\Library\BasicFunctions;

class Frontend extends AppHelper  {

    public function __construct($logger) {
        parent::__construct($logger);
    }

    public function getDesigns($category = 0, $page = 1, $order = false, $limit = 12) {
        $model = new Model($this->logger);
        $model->setTable('designs');
        $model->get('designs.*');
        $model->get('categories.name as category');
        $model->get('CASE WHEN designs.sale_price = 0 THEN designs.price ELSE designs.sale_price END AS price_edited');
        $model->where('designs.status', 1);
        if($category != 0) $model->where('category_id', $category);
        if($order) {
            $model->orderby($order[0], $order[1]);
        } else {
            $model->orderby('designs.id');
        }
        $model->join('categories', 'categories.id', 'designs.category_id');
        $model->limit($limit, $page);
        $data = $model->select();
        return count($data) > 0 ? $data : [];
    }

    public function getTotalDesignCount($category = 0, $filter = false) {
        $model = new Model($this->logger);
        $model->setTable('designs');
        $model->get('count(*) as total');
        $model->where('designs.status', 1);
        if($category != 0) $model->where('category_id', $category);
        $data = $model->select();
        return count($data) > 0 ? $data[0]['total'] : 0;
    }

    public function contactUs($user, $data) {
        $model = new Model($this->logger);
        $model->setTable('contact');
        $model->set('name', $data['contact-name']);
        $model->set('email', $data['contact-email']);
        $model->set('message', $data['contact-message']);
        $model->set('date_created', 'now()', true);
        return $model->insert();
    }

}