<?php

namespace App\Helpers;

use App\Library\Model;
use App\Helpers\App as AppHelper;
use App\Library\BasicFunctions;

class Cart extends AppHelper {

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

    public function logPayment($user_id, $total_payment_amount, $payment_method, $charge, $request_id) {
        $model = new Model($this->logger);
        $model->setTable('payments');
        $model->set('method', $payment_method);
        $model->set('user_id', $user_id);
        $model->set('amount', $total_payment_amount);
        $model->set('charge', $charge);
        $model->set('request_id', $request_id);
        $model->set('status', 'PENDING');
        $model->set('payment_reference', null, true);
        $model->set('payment_response', null, true);
        $model->set('date_updated', null, true);
        $model->set('date_created', 'now()', true);
        $result = $model->insert();
        return $result;
    }

    public function getPaymentLog($request_id) {
        $model = new Model($this->logger);
        $model->setTable('payments');
        $model->where('request_id', $request_id);
        $records = $model->select();
        return count($records) > 0 ? $records[0] : [];
    }

    public function logOrder($user_id, $total_amount, $total_cart_amount, $design_amount, $shipping_amount, $express_charge, $transaction_charge, $shipping_address_id, $billing_address_id, $payment_id, $order_ref) {
        $model = new Model($this->logger);
        $model->setTable('orders');
        $model->set('user_id', $user_id);
        $model->set('total_amount', $total_amount);
        $model->set('total_cart_amount', $total_cart_amount);
        $model->set('design_amount', $design_amount);
        $model->set('shipping_amount', $shipping_amount);
        $model->set('express_charge', $express_charge);
        $model->set('transaction_charge', $transaction_charge);
        $model->set('shipping_address_id', $shipping_address_id);
        $model->set('billing_address_id', $billing_address_id);
        $model->set('payment_id', $payment_id);
        $model->set('order_ref', $order_ref);
        $model->set('status', 'CREATED');
        $model->set('date_created', 'now()', true);
        $result = $model->insert();
        return $result;
    }

    public function getOrderLog($order_ref) {
        $model = new Model($this->logger);
        $model->setTable('orders');
        $model->where('order_ref', $order_ref);
        $records = $model->select();
        return count($records) > 0 ? $records[0] : [];
    }

    public function logOrderDetail($user_id, $order_id, $design_id, $material_id, $design_price, $material_price, $order_ref, $user_style, $measurement_id) {
        $model = new Model($this->logger);
        $model->setTable('order_details');
        $model->set('user_id', $user_id);
        $model->set('order_id', $order_id);
        $model->set('design_id', $design_id);
        $model->set('material_id', $material_id);
        $model->set('design_price', $design_price);
        $model->set('material_price', $material_price);
        $model->set('user_style', $user_style);
        $model->set('measurement_id', $measurement_id);
        $model->set('order_ref', $order_ref);
        $model->set('status', 'CREATED');
        $model->set('date_created', 'now()', true);
        $result = $model->insert();
        return $result;
    }

    public function updatePayment($ref, $status, $res) {
        $model = new Model($this->logger);
        $model->setTable('payments');
        $model->where('request_id', $ref);
        $model->set('status', $status);
        $model->set('payment_response', $res);
        $model->set('date_updated', 'now()', true);
        $result = $model->update();
        return $result;
    }

    public function updateOrder($ref, $status) {
        $model = new Model($this->logger);
        $model->setTable('orders');
        $model->where('order_ref', $ref);
        $model->set('status', $status);
        $model->set('date_updated', 'now()', true);
        $result = $model->update();
        return $result;
    }

}