<?php

namespace App\Controllers;

use App\Controllers\Frontend as BaseFrontendController;
use App\Helpers\Frontend as FrontendHelper;
use App\Helpers\Account as AccountHelper;
use App\Helpers\CartItem as CartItemHelper;
use App\Helpers\Cart as CartHelper;
use App\Library\BasicFunctions;
use Psr\Container\ContainerInterface;

class Cart extends BaseFrontendController {

    public function __construct(ContainerInterface $container) {
        parent::__construct($container);
        $this->frontend_helper = new FrontendHelper($this->container->get('logger'));
    }

    public function addToCart($request, $response, array $args) {
        $material_id = $args['material_id'];
        $design_id = $args['design_id'];

        $material = $this->frontend_helper->getById($material_id, 'materials', ['status' => 1]);
        $design = $this->frontend_helper->getById($design_id, 'designs', ['status' => 1]);
        $material_price = $material['sale_price'] == 0 ? $material['price'] : $material['sale_price'];
        $design_price = $design['sale_price'] == 0 ? $design['price'] : $design['sale_price'];

        if($material == false || $design == false) exit(json_encode(['success' => false]));

        $cart = $this->container->session->get('cart', ['items' => [], 'total' => 0, 'design_total' => 0]);
        array_push($cart['items'], new CartItemHelper($material_id, $design_id, $design['name'], $design['picture'], $design_price, $material['name'], $material['picture1'], $material_price));
        $cart['items'] = array_values($cart['items']);
        $cart['total'] += $material_price + $design_price;
        $cart['design_total'] += $design_price;
        $this->container->session->cart = $cart;
        exit(json_encode(['success' => true, 'cart' => $cart]));
    }

    public function removeFromCart($request, $response, array $args) {
        $cart_id = $args['cart_id'];

        $cart = $this->container->session->get('cart', ['items' => [], 'total' => 0]);
        $removed_item = $cart['items'][$cart_id];
        unset($cart['items'][$cart_id]);
        $cart['items'] = array_values($cart['items']);
        $cart['total'] -= ($removed_item->material_price + $removed_item->design_price);
        $cart['design_total'] -= $removed_item->design_price;
        $this->container->session->cart = $cart;
        exit(json_encode(['success' => true, 'cart' => $cart]));
    }

    public function clearCart($request, $response, array $args) {
        $cart = $this->container->session->get('cart', ['items' => [], 'total' => 0]);
        $cart['items'] = [];
        $cart['total'] = 0;
        $cart['design_total'] = 0;
        $this->container->session->cart = $cart;
        exit(json_encode(['success' => true, 'cart' => $cart]));
    }

    public function cart($request, $response, array $args) {
        $this->container->get('view')->render($response, 'cart.html', $this->data);
    }

    public function checkout($request, $response, array $args) {
        $this->account_helper = new AccountHelper($this->container->get('logger'));
        $this->data['addresses'] = $this->account_helper->getUserAddresses($this->container->session->user['id']);
        

        $cart = $this->container->session->get('cart');
        $cart['address_id'] = null;
        $cart['address'] = [];
        $cart['shipping_cost'] = null;
        $cart['charge'] = null;
        $cart['shipping_categories'] = [];
        $cart['payment_methods'] = [];
        $cart['payment_method'] = null;
        $cart['billing_address_id'] = null;
        $cart['billing_address'] = [];
        $cart['express_charge'] = 0;
        $this->container->session->cart = $cart;

        $this->container->get('view')->render($response, 'checkout.html', $this->data);
    }

    public function setShippingAddress($request, $response, array $args) {
        $cart = $this->container->session->get('cart');
        $cart['address_id'] = $args['address_id'];
        $cart['address'] = $this->frontend_helper->getById($args['address_id'], 'addresses', ['user_id' => $this->container->session->user['id']]);
        $cart['shipping_cost'] = 0;
        $this->container->session->cart = $cart;
        exit(json_encode(['success' => true]));
    }

    public function shipping($request, $response, array $args) {
        $this->data['shipping'] = $this->frontend_helper->getShippingMethods();
        $shipping_desc = ['non-african' => 'Other Countries', 'african' => 'Other African Countries'];
        $shipping_processed = [];
        foreach ($this->data['shipping'] as $key => $value) {
            if(!isset($shipping_processed[$value['price']])) $shipping_processed[$value['price']] = [];
            array_push($shipping_processed[$value['price']], $value['type'] == 'nigerian' ? $value['state'] : $shipping_desc[$value['type']]);
        }
        $this->data['shipping_categories'] = $shipping_processed;

        $cart = $this->container->session->get('cart');
        $cart['shipping_cost'] = 0;
        $cart['express_charge'] = 0;
        $cart['shipping_categories'] = $shipping_processed;
        $this->container->session->cart = $cart;
        $this->data['session'] = $this->container->session;

        $this->container->get('view')->render($response, 'shipping.html', $this->data);
    }

    public function setShippingPrice($request, $response, array $args) {
        $cart = $this->container->session->get('cart');
        $cart['shipping_cost'] = $args['price'];
        $this->container->session->cart = $cart;
        exit(json_encode(['success' => true, 'cart' => $cart]));
    }

    public function setShippingExpress($request, $response, array $args) {
        $val = $args['val'];
        $cart = $this->container->session->get('cart');
        $cart['express_charge'] = $val == 1 ? $cart['design_total'] * 0.6 : 0;
        $this->container->session->cart = $cart;
        exit(json_encode(['success' => true, 'cart' => $cart]));
    }

    public function payment($request, $response, array $args) {
        $this->account_helper = new AccountHelper($this->container->get('logger'));
        $this->data['addresses'] = $this->account_helper->getUserAddresses($this->container->session->user['id']);

        $cart = $this->container->session->get('cart');
        $total = $cart['total'] + $cart['shipping_cost'];

        $charge = 0;

        if($cart['address']['country_type'] == 'nigerian') {
            $percentage = 1.5;
            $charge = $total * ($percentage/100);
            if((int)$total < 2500) $charge += 100;
            $charge = $charge > 2000 ? 2000 : $charge;
        } else {
            $percentage = 3.9;
            $charge = ($total * ($percentage/100)) + 100;
        }

        $cart['payment_methods'] = ['PAYSTACK' => ceil($charge)];
        $cart['payment_method'] = '';
        $cart['charge'] = 0;
        $this->container->session->cart = $cart;
        $this->data['session'] = $this->container->session;

        $this->container->get('view')->render($response, 'payment.html', $this->data);
    }

    public function setBillingAddress($request, $response, array $args) {
        $cart = $this->container->session->get('cart');
        $cart['billing_address_id'] = $args['address_id'];
        $cart['billing_address'] = $this->frontend_helper->getById($args['address_id'], 'addresses', ['user_id' => $this->container->session->user['id']]);
        $this->container->session->cart = $cart;
        exit(json_encode(['success' => true]));
    }

    public function setPaymentMethod($request, $response, array $args) {
        $cart = $this->container->session->get('cart');
        $cart['payment_method'] = $args['method'];
        $cart['charge'] = $cart['payment_methods'][$cart['payment_method']];
        $this->container->session->cart = $cart;
        exit(json_encode(['success' => true, 'cart' => $cart]));
    }

    public function processPayment($request, $response, array $args) {
        $cart = $this->container->session->get('cart');

        $this->cart_helper = new CartHelper($this->container->get('logger'));
        $this->account_helper = new AccountHelper($this->container->get('logger'));

        $total_payment_amount = $cart['total'] + $cart['shipping_cost'] + $cart['charge'] + $cart['express_charge'];
        $request_id = BasicFunctions::genRand(6).'-'.BasicFunctions::genRand(12).'-'. BasicFunctions::genRand(6);
        $user_id = $this->container->session->user['id'];

        $payment = $this->cart_helper->logPayment($user_id, $total_payment_amount, $cart['payment_method'], $cart['charge'], $request_id);

        if(!$payment) exit(json_encode(['success' => false]));

        $payment_record = $this->cart_helper->getPaymentLog($request_id);

        if(count($payment_record) == 0) exit(json_encode(['success' => false]));

        $payment_id = $payment_record['id'];

        $order_ref = BasicFunctions::genRand(6).'-'.BasicFunctions::genRand(12).'-'. BasicFunctions::genRand(6);

        $order = $this->cart_helper->logOrder($user_id, $total_payment_amount, $cart['total'], $cart['design_total'], $cart['shipping_cost'], $cart['express_charge'], $cart['charge'], $cart['address_id'], $cart['billing_address_id'], $payment_id, $order_ref);

        if(!$order) exit(json_encode(['success' => false]));

        $order_record = $this->cart_helper->getOrderLog($order_ref);

        if(count($order_record) == 0) exit(json_encode(['success' => false]));

        $order_id = $order_record['id'];

        $mmm = $this->account_helper->getUserDefaultMeasurement($user_id);
        $measurement_id = $mmm == false ? 0 : $mmm['id'];

        foreach ($cart['items'] as $key => $value) {
            $order_detail = $this->cart_helper->logOrderDetail($user_id, $order_id, $value->design_id, $value->material_id, $value->design_price, $value->material_price, $order_ref, 0, $measurement_id);

            if(!$order_detail) exit(json_encode(['success' => false]));
        }

        exit(json_encode(['success' => true, 'request_id' => $request_id, 'order_ref' => $order_ref, 'amount' => $total_payment_amount, 'email' => $this->container->session->user['email']]));
    }

    public function completeOrder($request, $response, array $args) {
        $ref = $args['ref'];
        $order_ref = $args['order_ref'];

        $result = array();
        //The parameter after verify/ is the transaction reference to be verified
        $url = 'https://api.paystack.co/transaction/verify/'.$ref;

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt(
        $ch, CURLOPT_HTTPHEADER, [
            'Authorization: Bearer sk_test_4a540caf4d1083fe08e116ded332abef89cbea60']
        );
        $request = curl_exec($ch);
        curl_close($ch);

        $logger = $this->container->get('logger');

        $logger->info("PAYSTACK RESPONSE $ref " . $request);
        $tech_issue = true;

        if ($request) {
            $result = json_decode($request, true);
            if($result){
                
                if($result['data']){
                    $tech_issue = false;
                    $status = 'FAILED';
                    //something came in
                    if($result['data']['status'] == 'success'){
                        $status = 'SUCCESS';
                        // the transaction was successful, you can deliver value
                        /* 
                        @ also remember that if this was a card transaction, you can store the 
                        @ card authorization to enable you charge the customer subsequently. 
                        @ The card authorization is in: 
                        @ $result['data']['authorization']['authorization_code'];
                        @ PS: Store the authorization with this email address used for this transaction. 
                        @ The authorization will only work with this particular email.
                        @ If the user changes his email on your system, it will be unusable
                        */
                        $logger->info("Transaction was successful");
                    }else{
                        // the transaction was not successful, do not deliver value'
                        // print_r($result);  //uncomment this line to inspect the result, to check why it failed.
                        $logger->error("Transaction was not successful: Last gateway response was: ".$result['data']['gateway_response']);
                    }
                    $res = json_encode($result['data']);

                    $this->cart_helper = new CartHelper($this->container->get('logger'));
                    $log = $this->cart_helper->updatePayment($ref, $status, $res);

                    $logOrder = $this->cart_helper->updateOrder($order_ref, $status == 'SUCCESS' ? 'COMPLETED' : 'UNCOMPLETED');

                    if(!$log || !$logOrder) $tech_issue = true;
                }else{
                    $logger->error($result['message']);
                }

            }else{
            //print_r($result);
            $logger->error("Something went wrong while trying to convert the request variable to json. Uncomment the print_r command to see what is in the result variable.");
            }
        }else{
            //var_dump($request);
            $logger->error("Something went wrong while executing curl. Uncomment the var_dump line above this line to see what the issue is. Please check your CURL command to make sure everything is ok");
        }

        $this->container->session->del('cart');
        $this->data['status'] = $status;
        $this->data['tech_issue'] = $tech_issue;
        $this->data['order_ref'] = $order_ref;
        $this->container->get('view')->render($response, 'order-completed.html', $this->data);

    }
}