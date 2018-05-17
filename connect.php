<?php
  error_reporting(0);

  $host = 'localhost';
  $username = "wcadmin";
  $password = "wcadmin1234";
  $dbname = "whatscookin";
  $port = 3306;

  $conn = new mysqli($host, $username, $password, $dbname, $port);

  $errorMessage = $conn->connect_error;
?>