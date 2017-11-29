<?php  
  
    require_once "../class/Admin.php";
    require_once "../class/DBConnect.php";


  	$admin = new Admin($db);

    $admin->logout();

    // Redirect ke login
    header('location: adm_login.php');
 ?>