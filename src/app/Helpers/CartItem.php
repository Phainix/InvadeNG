<?php

namespace App\Helpers;


class CartItem {

    public function __construct($material_id, $design_id, $design_name, $design_picture, $design_price, $material_name, $material_picture, $material_price) {
        $this->material_id = $material_id;
        $this->design_id = $design_id;
        $this->design_name = $design_name;
        $this->design_picture = $design_picture;
        $this->design_price = $design_price;
        $this->material_name = $material_name;
        $this->material_picture = $material_picture;
        $this->material_price = $material_price;
    }

}