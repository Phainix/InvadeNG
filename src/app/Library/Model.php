<?php

namespace App\Library;

class Model {

    private $table = "";
    private $where = [];
    private $columns = "*";
    private $order = "";
    private $insert_columns = [];
    private $insert_values = [];
    private $join = [];
    private $limit = "";

    public function __construct($logger) {
        $this->logger = $logger;
    }

    public function setTable($table) {
        $this->table = $table;
    }

    public function where($column, $data, $type = false) {
        array_push($this->where, $type == true ? "$column = $data" : "$column = '$data'");
    }

    public function get($column) {
        if($this->columns == "*") {
            $this->columns = $column;
        } else {
            $this->columns .= "," . $column;
        }
    }

    public function set($column, $data, $type = false) {
        array_push($this->insert_columns, $column);
        array_push($this->insert_values, $type ? $data : "'$data'");
    }

    public function orderby($column, $type = 'DESC') {
        $this->order = " ORDER BY $column $type";
    }

    public function join($table, $column1, $column2, $type = "") {
        array_push($this->join, " $type JOIN $table on $column1 = $column2");
    }

    public function limit($size, $start) {
        $this->limit = " LIMIT $size OFFSET $start";
    }

    public function select() {
        $sql = "SELECT $this->columns FROM $this->table ";
        $join = implode(" ", $this->join);
        $sql .= $join;
        $where = implode(" AND ", $this->where);
        if($where != "") {
            $sql .= " WHERE $where";
        }
        $sql .= $this->order;
        $sql .= $this->limit;

        $this->connect();
        if($this->conn == false) {
            $this->logger->error("SELECT failed: " . $this->conn->error);
            $this->logger->error("$sql");
            return [];
        }
        $result = $this->conn->query($sql);
        if (!$result) {
            $this->logger->error("SELECT failed: " . $this->conn->error);
            $this->logger->error("$sql");
            return [];
        }
        $rows = [];
        while($row = $result->fetch_assoc()) {
            $rows[]=$row;
        }
        $result->close();
        $this->conn->close();
        return $rows;
    }

    public function paginate($limit, $page) {
        $sql = "SELECT $this->columns FROM $this->table ";
        $join = implode(" ", $this->join);
        $sql .= $join;
        $where = implode(" AND ", $this->where);
        if($where != "") {
            $sql .= " WHERE $where";
        }
        $sql .= $this->order;
        $sql .= $this->limit;

        if($limit != -1) {
            $start = ($page - 1) * $limit;
            $sql .= " LIMIT $start, $limit";
        }

        $this->connect();
        if($this->conn == false) {
            $this->logger->error("SELECT failed: " . $this->conn->error);
            $this->logger->error("$sql");
            return [];
        }
        $result = $this->conn->query($sql);
        if (!$result) {
            $this->logger->error("SELECT failed: " . $this->conn->error);
            $this->logger->error("$sql");
            return [];
        }
        $rows = [];
        while($row = $result->fetch_assoc()) {
            $rows[]=$row;
        }
        $result->close();
        $this->conn->close();
        return $rows;
    }

    public function insert() {
        $columns = implode(",", $this->insert_columns);
        $values = implode(",", $this->insert_values);
        $sql = "INSERT INTO $this->table ($columns) VALUES ($values)";
        $this->connect();
        if($this->conn == false) {
            return false;
        }
        $result = $this->conn->query($sql);
        if ($result === true) {
            return true;
        }
        $this->logger->error("INSERT failed: " . $this->conn->error);
        $this->logger->error("$sql");
        return false;
    }

    public function update() {
        $sets = [];
        foreach ($this->insert_columns as $key => $value) {
            $sets[] = "$value = ".$this->insert_values[$key];
        }
        $set = implode(",", $sets);
        $sql = "UPDATE $this->table SET $set";
        $where = implode(" AND ", $this->where);
        if($where != "") {
            $sql .= " WHERE $where";
        }
        $this->connect();
        if($this->conn == false) {
            return false;
        }
        $result = $this->conn->query($sql);
        if ($result === true) {
            return $this->conn->affected_rows;
        }
        $this->logger->error("UPDATE failed: " . $this->conn->error);
        $this->logger->error("$sql");
        return false;
    }

    public function delete() {
        if(count($this->where) == 0) return false;
        $sql = "DELETE FROM $this->table";
        $where = implode(" AND ", $this->where);
        if($where != "") {
            $sql .= " WHERE $where";
        }
        $this->connect();
        if($this->conn == false) {
            return false;
        }
        $result = $this->conn->query($sql);
        if ($result === true) {
            return true;
        }
        $this->logger->error("DELETE failed: " . $this->conn->error);
        $this->logger->error("$sql");
        return false;
    }

    private function connect() {
        // ******* Production *********
        // $servername = "localhost";
        // $username = "invadeng_invade";
        // $password = "bhADc?0a]5)S";
        // $dbname = "invadeng_invade";
        // ******* Production *********

        // ******* Local *********
        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "invade";
        // ******* Local *********

        // ******* Heroku *********
        $servername = "us-cdbr-iron-east-01.cleardb.net";
        $username = "bc7821161005a0";
        $password = "1c6e9a4a";
        $dbname = "heroku_b50c3839590bc9f";
        // ******* Heroku *********

        // Create connection
        $this->conn = new \mysqli($servername, $username, $password, $dbname);

        // Check connection
        if ($this->conn->connect_error) {
            $this->logger->error("DB Connection failed: " . $this->conn->connect_error);
            $this->conn = false;
        } 
    }

}