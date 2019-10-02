<?php

namespace App\Controllers\Admin;

use App\Library\Controller as BaseController;
use App\Library\BasicFunctions;
use App\Helpers\Admin as AdminHelper;
use Psr\Container\ContainerInterface;

class Measurement extends BaseController {

    public function __construct(ContainerInterface $container) {
        parent::__construct($container);
        $this->admin_helper = new AdminHelper($this->container->get('logger'));
    }

    public function measurements($request, $response, array $args) {
        $measurement = $this->admin_helper->getSetting('measurements');
        $this->data['measurements'] = json_decode($measurement['content']);
        $this->container->get('view')->render($response, 'admin/measurements.html', $this->data);
    }

    public function measurementsPost($request, $response, array $args) {
        $data = $request->getParsedBody();
        if($data['measurement'] == '') {
            $this->container->session->alert = ['message' => 'Measurement form is invalid, please fill correctly', 'type' => 'danger'];
            return $response->withRedirect('/backend/account/measurements', 301);
        }
        $measurement = $this->admin_helper->getSetting('measurements');
        if($measurement == false) {
            $this->container->session->alert = ['message' => 'Operation could not be completed', 'type' => 'danger'];
            return $response->withRedirect('/backend/account/measurements', 301);
        }
        $r = json_decode($measurement['content']);
        if(!is_array($r)) {
            $this->container->session->alert = ['message' => 'Operation could not be completed', 'type' => 'danger'];
            return $response->withRedirect('/backend/account/measurements', 301);
        }
        array_push($r, array('name' => $data['measurement'], 'status' => true));
        
        $result = $this->admin_helper->updateSetting('measurements', json_encode($r));
        if(!$result) {
            $this->container->session->alert = ['message' => 'Operation could not be completed', 'type' => 'danger'];
            return $response->withRedirect('/backend/account/measurements', 301);
        }
        $this->container->session->alert = ['message' => 'Measurement added successfully', 'type' => 'success'];
        return $response->withRedirect('/backend/account/measurements', 301);
    }

    public function deleteMeasurement($request, $response, array $args) {
        $measurement = $this->admin_helper->getSetting('measurements');
        if($measurement == false) {
            $this->container->session->alert = ['message' => 'Operation could not be completed', 'type' => 'danger'];
            return $response->withRedirect('/backend/account/measurements', 301);
        }
        $r = json_decode($measurement['content']);
        if(!is_array($r)) {
            $this->container->session->alert = ['message' => 'Operation could not be completed', 'type' => 'danger'];
            return $response->withRedirect('/backend/account/measurements', 301);
        }
        unset($r[$args['index']]);
        $result = $this->admin_helper->updateSetting('measurements', json_encode(array_values($r)));
        if(!$result) {
            $this->container->session->alert = ['message' => 'Operation could not be completed', 'type' => 'danger'];
            return $response->withRedirect('/backend/account/measurements', 301);
        }
        $this->container->session->alert = ['message' => 'Measurement deleted successfully', 'type' => 'success'];
        return $response->withRedirect('/backend/account/measurements', 301);
    }

    public function toggleMeasurement($request, $response, array $args) {
        $measurement = $this->admin_helper->getSetting('measurements');
        if($measurement == false) {
            $this->container->session->alert = ['message' => 'Operation could not be completed', 'type' => 'danger'];
            return $response->withRedirect('/backend/account/measurements', 301);
        }
        $r = json_decode($measurement['content']);
        if(!is_array($r)) {
            $this->container->session->alert = ['message' => 'Operation could not be completed', 'type' => 'danger'];
            return $response->withRedirect('/backend/account/measurements', 301);
        }
        $r[$args['index']]->status = !$r[$args['index']]->status;
        $result = $this->admin_helper->updateSetting('measurements', json_encode($r));
        if(!$result) {
            $this->container->session->alert = ['message' => 'Operation could not be completed', 'type' => 'danger'];
            return $response->withRedirect('/backend/account/measurements', 301);
        }
        $this->container->session->alert = ['message' => 'Measurement toggled successfully', 'type' => 'success'];
        return $response->withRedirect('/backend/account/measurements', 301);
    }
    
}