<?php

include('../class/DBConnect.php');
require_once "../class/Admin.php";

$admin = new Admin($db);
$datas = $admin->getAdmin();

$admin->cekLogin();

if(isset($_POST["tbl"]) && isset($_POST["fnme"]) && isset($_POST["user_id"]))
{
	try {
	  $admin->hapusData($_POST['tbl'], $_POST['fnme'], $_POST['user_id']);
	  echo 'Data Terhapus';
	  } catch (Exception $e) {
	      die($e->getMessage());
	      echo 'Terjadi Kesalahan';
	  }
}



?>