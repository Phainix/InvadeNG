<?php

namespace App\Controllers;

use App\Controllers\Frontend as BaseFrontendController;
use App\Library\BasicFunctions;
use App\Helpers\Account as AccountHelper;
use Psr\Container\ContainerInterface;

class Account extends BaseFrontendController {

    public function __construct(ContainerInterface $container) {
        parent::__construct($container);
        $this->account_helper = new AccountHelper($this->container->get('logger'));
    }

    public function dashboard($request, $response, array $args) {
        $mmm = $this->account_helper->getUserDefaultMeasurement($this->container->session->user['id']);
        $this->data['measurement_id'] = $mmm == false ? 0 : $mmm['id'];
        $this->data['user_measurement'] = $mmm == false ? [] : json_decode($mmm['details'], true);
        $this->data['addresses'] = $this->account_helper->getUserAddresses($this->container->session->user['id']);
        $this->data['orders'] = $this->account_helper->getUserOrders($this->container->session->user['id'], 5, 1);
        $this->container->get('view')->render($response, 'dashboard.html', $this->data);
    }

    public function measurement($request, $response, array $args) {
        $measurement = $this->account_helper->getSetting('measurements');
        $mm = json_decode($measurement['content']);
        $m = ['general' => []];
        foreach ($mm as $key => $value) {
            if($value->status == false) continue;
            $break = explode(':', $value->name);
            if(count($break) == 1) {
                array_push($m['general'], $value);
            } else {
                if(!isset($m[$break[0]])) {
                    $m[$break[0]] = [];
                }
                array_push($m[$break[0]], $value);
            }
        }
        
        $this->data['measurements'] = $m;

        $mmm = $this->account_helper->getUserDefaultMeasurement($this->container->session->user['id']);
        $this->data['measurement_id'] = $mmm == false ? 0 : $mmm['id'];
        $this->data['user_measurement'] = $mmm == false ? [] : json_decode($mmm['details'], true);
        $this->container->get('view')->render($response, 'measurement.html', $this->data);
    }

    public function measurementPost($request, $response, array $args) {
        $data = $request->getParsedBody();
        $measurement_id = $data['measurement_id'];
        unset($data[$this->container->csrf->getTokenNameKey()]);
        unset($data[$this->container->csrf->getTokenValueKey()]);
        unset($data['measurement_id']);
        if($measurement_id == 0) {
            $result = $this->account_helper->createMeasurement($this->container->session->user['id'], json_encode($data), 1);
        } else {
            $result = $this->account_helper->updateMeasurement($measurement_id, json_encode($data));
        }
        if($result) {
            $this->container->session->alert = ['message' => 'Operation successful', 'type' => 'success'];
        } else {
            $this->container->session->alert = ['message' => 'Operation unsuccessful', 'type' => 'danger'];
        }
        return $response->withRedirect('/account/measurement', 301);
    }

    public function editDetails($request, $response, array $args) {
        //$response = ['success' => false];
        $data = $request->getParsedBody();
        if($data['edit-name'] == '' || $data['edit-email'] == '' || $data['edit-number'] == '') {
            $this->container->session->alert = ['message' => 'Edit details form is invalid, please fill correctly', 'type' => 'danger'];
            return $response->withRedirect('/account/dashboard', 301);
        }
        $result = $this->account_helper->updateUser($this->container->session->user['id'], $data['edit-name'], $data['edit-email'], $data['edit-number']);
        if($result) {
            $name = explode(' ', $data['edit-name']);
            $userSession = $this->container->session->user;
            $userSession['first_name'] = $name[0];
            $userSession['last_name'] = $name[1];
            $userSession['email'] = $data['edit-email'];
            $userSession['msisdn'] = $data['edit-number'];
            $this->container->session->user = $userSession;
            $this->container->session->alert = ['message' => 'Operation successful', 'type' => 'success'];
        } else {
            $this->container->session->alert = ['message' => 'Operation failed', 'type' => 'danger'];
        }
        return $response->withRedirect('/account/dashboard', 301);
    }

    public function changePassword($request, $response, array $args) {
        $data = $request->getParsedBody();
        if($data['current-password'] == '' || $data['new-password'] == '' || $data['confirm-password'] == '' || $data['confirm-password'] != $data['new-password']) {
            $this->container->session->alert = ['message' => 'Change password form is invalid, please fill correctly', 'type' => 'danger'];
            return $response->withRedirect('/account/dashboard', 301);
        }
        $result = $this->account_helper->changePassword($this->container->session->user['id'], $data['current-password'], $data['new-password']);
        if($result) {
            $this->container->session->alert = ['message' => 'Operation successful', 'type' => 'success'];
        } else {
            $this->container->session->alert = ['message' => 'Operation failed', 'type' => 'danger'];
        }
        return $response->withRedirect('/account/dashboard', 301);
    }

    public function addresses($request, $response, array $args) {
        $this->data['addresses'] = $this->account_helper->getUserAddresses($this->container->session->user['id']);
        // $this->data['measurement_id'] = $mmm == false ? 0 : $mmm['id'];
        // $this->data['user_measurement'] = $mmm == false ? [] : json_decode($mmm['details'], true);
        $this->container->get('view')->render($response, 'addresses.html', $this->data);
    }

    public function addressesNew($request, $response, array $args) {
        $data = $request->getParsedBody();
        $result = $this->account_helper->addAddress($this->container->session->user['id'], $data);
        if($result) {
            $this->container->session->alert = ['message' => 'Operation successful', 'type' => 'success'];
        } else {
            $this->container->session->alert = ['message' => 'Operation failed', 'type' => 'danger'];
        }
        return $response->withRedirect('/account/addresses/', 301);
    }

    public function addressesManage($request, $response, array $args) {
        $data = $request->getParsedBody();
        $result = $this->account_helper->updateAddress($this->container->session->user['id'], $data);
        if($result) {
            $this->container->session->alert = ['message' => 'Operation successful', 'type' => 'success'];
        } else {
            $this->container->session->alert = ['message' => 'Operation failed', 'type' => 'danger'];
        }
        return $response->withRedirect('/account/addresses/', 301);
    }

    public function allOrders($request, $response, array $args) {
        $this->data['orders'] = $this->account_helper->getUserOrders($this->container->session->user['id'], -1, 1);
        $this->container->get('view')->render($response, 'orders.html', $this->data);
    }

    public function orderDetails($request, $response, array $args) {
        $order_id = $args['order_id'];
        $this->data['order'] = $this->account_helper->getUserOrder($this->container->session->user['id'], $order_id);
        if(count($this->data['order']) > 0) {
            $this->data['order_detail'] = $this->account_helper->getUserOrderDetails($this->container->session->user['id'], $order_id);
            $this->data['shipping_address'] = $this->account_helper->getAddress($this->data['order']['shipping_address']);
        }
        $this->container->get('view')->render($response, 'order-detail.html', $this->data);
    }
}