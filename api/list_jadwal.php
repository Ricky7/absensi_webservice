<?php
	require_once "../class/Admin.php";
	require_once "../class/DBConnect.php";

  	$admin = new Admin($db);

	// Getting the received JSON into $json variable.
 	$json = file_get_contents('php://input');
 
	// decoding the received JSON and store into $obj variable.
	$obj = json_decode($json,true);
	$nidn = $obj['nidn'];
	//$nidn = $_REQUEST['nidn'];

	try {
        $admin->jadwalAPI($nidn);
        //header("location: return_list.php");
    } catch (Exception $e) {
        die($e->getMessage());
    }

?>