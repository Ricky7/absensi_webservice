<?php

    class Dosen {

        private $db; 
        private $error; 

        function __construct($db_conn) {

            $this->db = $db_conn;

            // Mulai session
            if(!isset($_SESSION)){
                session_start();
            }
        }
    }
?>