<?php

namespace App\Helpers;

use App\Library\Model;
use App\Helpers\App as AppHelper;
use App\Library\BasicFunctions;

class Account extends AppHelper {

    public function __construct($logger) {
        parent::__construct($logger);
    }

    public function getAllUsers() {
        $model = new Model($this->logger);
        $model->setTable('users');
        $users = $model->select();
        return count($users) > 0 ? $users : [];
    }

    public function getUserByEmail($email) {
        $users = false;
        $model = new Model($this->logger);
        $model->setTable('users');
        $model->where('email', $email);
        $users = $model->select();
        return count($users) > 0 ? $users[0] : false;
    }

    public function addUser($user) {
        $name = explode(' ', $user['name']);
        $model = new Model($this->logger);
        $model->setTable('users');
        $model->set('first_name', $name[0]);
        $model->set('last_name', $name[1]);
        $model->set('email', $user['email']);
        $model->set('msisdn', $user['number']);
        $model->set('password', hash('sha512', $user['password']));
        $model->set('user_type', $user['type']);
        $model->set('status', 1);
        $model->set('date_created', 'now()', true);
        $result = $model->insert();
        return $result;
    }

    public function updateLastLogin($user) {
        $model = new Model($this->logger);
        $model->setTable('users');
        $model->where('id', $user['id']);
        $model->set('last_login', 'now()', true);
        $result = $model->update();
        return $result;
    }

    public function changeStatus($user, $status) {
        $model = new Model($this->logger);
        $model->setTable('users');
        $model->where('id', $user);
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

    public function getUserDefaultMeasurement($user) {
        $model = new Model($this->logger);
        $model->setTable('measurement');
        $model->where('user_id', $user);
        $model->where('is_default', '1');
        $result = $model->select();
        return count($result) > 0 ? $result[0] : false;
    }

    public function createMeasurement($user, $details, $is_default) {
        $model = new Model($this->logger);
        $model->setTable('measurement');
        $model->set('user_id', $user);
        $model->set('is_default', $is_default);
        $model->set('details', $details);
        $model->set('date_created', 'now()', true);
        $result = $model->insert();
        return $result;
    }

    public function updateMeasurement($id, $details) {
        $model = new Model($this->logger);
        $model->setTable('measurement');
        $model->set('details', $details);
        $model->set('date_updated', 'now()', true);
        $model->where('id', $id);
        $result = $model->update();
        return $result;
    }

    public function updateUser($id, $name, $email, $number) {
        $name = explode(' ', $name);
        $model = new Model($this->logger);
        $model->setTable('users');
        $model->set('first_name', $name[0]);
        $model->set('last_name', $name[1]);
        $model->set('email', $email);
        $model->set('msisdn', $number);
        $model->where('id', $id);
        $model->set('date_updated', 'now()', true);
        $result = $model->update();
        return $result;
    }

    public function changePassword($id, $current_password, $new_password) {
        $model = new Model($this->logger);
        $model->setTable('users');
        $model->set('password', hash('sha512', $new_password));
        $model->set('date_updated', 'now()', true);
        $model->where('id', $id);
        $model->where('password', hash('sha512', $current_password));
        $result = $model->update();
        return $result;
    }

    public function addAddress($user, $data) {
        $model = new Model($this->logger);
        $model->setTable('addresses');
        $model->set('fname', $data['address-fname']);
        $model->set('lname', $data['address-lname']);
        $model->set('address', $data['address']);
        $model->set('address_line2', $data['address-line2']);
        $model->set('city', $data['address-city']);
        $model->set('msisdn', $data['address-number']);
        $model->set('country_type', $data['address-country']);
        $model->set('country', $data['country']);
        $model->set('state', $data['state']);
        $model->set('postal_code', $data['address-postal']);
        $model->set('user_id', $user);
        $model->set('is_default', 0);
        $model->set('date_created', 'now()', true);
        $result = $model->insert();
        return $result;
    }

    public function getUserAddresses($user) {
        $model = new Model($this->logger);
        $model->setTable('addresses');
        $model->where('user_id', $user);
        $result = $model->select();
        return count($result) > 0 ? $result : [];
    }

    public function updateAddress($user, $data) {
        $model = new Model($this->logger);
        $model->setTable('addresses');
        $model->set('fname', $data['address-fname']);
        $model->set('lname', $data['address-lname']);
        $model->set('address', $data['address']);
        $model->set('address_line2', $data['address-line2']);
        $model->set('city', $data['address-city']);
        $model->set('msisdn', $data['address-number']);
        $model->set('country_type', $data['address-country']);
        $model->set('country', $data['country']);
        $model->set('state', $data['state']);
        $model->set('postal_code', $data['address-postal']);
        $model->where('user_id', $user);
        $model->where('id', $data['address-id']);
        $model->set('date_updated', 'now()', true);
        $result = $model->update();
        return $result;
    }

    public function getAllContacts() {
        $model = new Model($this->logger);
        $model->setTable('contact');
        $data = $model->select();
        return count($data) > 0 ? $data : [];
    }

    public function getUserOrders($user, $limit, $page) {
        $model = new Model($this->logger);
        $model->setTable('orders');
        $model->where('user_id', $user);
        $model->orderby('id', 'desc');
        $result = $model->paginate($limit, $page);
        return count($result) > 0 ? $result : [];
    }

    public function getUserOrderDetails($user, $order_id) {
        $model = new Model($this->logger);
        $model->get('orders.*');
        $model->get('order_details.design_price');
        $model->get('order_details.material_id');
        $model->get('order_details.material_price');
        $model->get('order_details.design_id');
        $model->get('designs.name as design_name');
        $model->get('designs.picture as design_picture');
        $model->get('materials.picture1 as material_picture');
        $model->get('materials.name as material_name');
        $model->setTable('orders');
        $model->where('orders.user_id', $user);
        $model->where('orders.id', $order_id);
        $model->join('order_details', 'order_details.order_id', 'orders.id', 'INNER');
        $model->join('designs', 'designs.id', 'order_details.design_id');
        $model->join('materials', 'materials.id', 'order_details.material_id');
        $model->orderby('orders.id', 'desc');
        $result = $model->select();
        return count($result) > 0 ? $result : [];
    }

    public function getUserOrder($user, $order_id) {
        $model = new Model($this->logger);
        $model->setTable('orders');
        $model->where('user_id', $user);
        $model->where('id', $order_id);
        $model->orderby('id', 'desc');
        $result = $model->paginate($limit, $page);
        return count($result) > 0 ? $result[0] : [];
    }

}