<?php

namespace App\Helpers;

use App\Library\Model;
use App\Library\BasicFunctions;

class Auth {

    public function __construct($logger) {
        $this->logger = $logger;
    }

    public function createSession($user) {
        $model = new Model($this->logger);
        $model->setTable('authentication');
        $model->set('user_id', $user['id']);
        $model->set('session_id', $user['session_id']);
        $model->set('date_created', 'now()', true);
        $model->set('last_activity', 'now()', true);
        $result = $model->insert();
        return $result;
    }

    public function getSession($user) {
        $model = new Model($this->logger);
        $model->setTable('authentication');
        $model->where('user_id', $user['id']);
        $model->where('session_id', $user['session_id']);
        $model->orderby('id');
        $session = $model->select();
        return count($session) > 0 ? $session[0] : false;
    }

    public function extendSession($user) {
        $model = new Model($this->logger);
        $model->setTable('authentication');
        $model->where('user_id', $user['id']);
        $model->where('session_id', $user['session_id']);
        $model->set('last_activity', 'now()', true);
        $session = $model->update();
        return $session;
    }

}