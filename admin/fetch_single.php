<?php
include('../class/DBConnect.php');
require_once "../class/Admin.php";

$admin = new Admin($db);

if(isset($_POST["user_id"])&& isset($_POST["table"]))
{

    if($_POST['table'] == 'tbdosen')
	{
		try {
	        $admin->dsn_fetch_single($_POST['user_id']);
	      } catch (Exception $e) {
	      	die($e->getMessage());
	      }
	}

	if($_POST['table'] == 'tbmahasiswa')
	{
		try {
	        $admin->mhs_fetch_single($_POST['user_id']);
	      } catch (Exception $e) {
	      	die($e->getMessage());
	      }
	}

	if($_POST['table'] == 'tbmatakuliah')
	{
		try {
	        $admin->mkul_fetch_single($_POST['user_id']);
	      } catch (Exception $e) {
	      	die($e->getMessage());
	      }
	}

	if($_POST['table'] == 'tbtahun_ajaran')
	{
		try {
	        $admin->ta_fetch_single($_POST['user_id']);
	      } catch (Exception $e) {
	      	die($e->getMessage());
	      }
	}

	if($_POST['table'] == 'tbjatwalkuliah')
	{
		try {
	        $admin->jk_fetch_single($_POST['user_id']);
	      } catch (Exception $e) {
	      	die($e->getMessage());
	      }
	}

	if($_POST['table'] == 'tbabsensi')
	{
		try {
	        $admin->abs_fetch_single($_POST['user_id']);
	      } catch (Exception $e) {
	      	die($e->getMessage());
	      }
	}
}
?>