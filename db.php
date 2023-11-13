<?php

class DB {
    private string $servername ;
    private string $username;
    private string $password;
    private string $dbname;

    public function __construct() {
        $this->servername = "localhost";
        $this->username  = "root";
        $this->password  = "Ww/47A.5@nrj5FI/";
        $this->dbname = "ipsmatazanos";
    }

    public function connect() {
        $conn = new mysqli($this->servername, $this->username, $this->password, $this->dbname);

        if ($conn->connect_error) {
            die("Conexión fallida: " . $conn->connect_error);
        }

        return $conn;
    }
}

