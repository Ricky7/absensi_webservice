<?php  
  
    require_once "../class/Admin.php";
    require_once "../class/DBConnect.php";


  	$admin = new Admin($db);
	$datas = $admin->getAdmin();

	$admin->cekLogin();

?>
<?php
	include "adm_header.php";
	include "adm_sidebar.php";
?>

<div class="col-md-10">
    <div class="profile-content">
	    
	    <!-- Content -->
	    <div class="col-md-4 col-md-offset-4">
	      	
	    </div>
	    <!-- //Content -->
    </div>
</div>
<?php
	include "adm_footer.php";
?>