<?php  
  
    require_once "class/Guru.php";
    require_once "class/Siswa.php";
    require_once "class/DBConnect.php";


  	$guru = new Guru($db);
  	$siswa = new Siswa($db);
  	$dataguru = $guru->getGuru();
  	$datasiswa = $siswa->getSiswa();

  	if(isset($_POST['guru'])){

	      $nig = $_POST['nig'];
	      $password = $_POST['password'];

	      if($guru->login($nig, $password)){
	          
	        switch ($data) {
	          case 'Guru':
	            header("location: guru_index.php");
	            break;
	          
	          default:
	            header("location: index.php");
	            break;
	        }

	      }else{
	          $error = $guru->getLastError();
	      }
	  }

	  if(isset($_POST['siswa'])){

	      $nis = $_POST['nis'];
	      $password = $_POST['password'];

	      if($siswa->login($nis, $password)){
	          
	        switch ($data) {
	          case 'Siswa':
	            header("location: siswa_index.php");
	            break;
	          
	          default:
	            header("location: index.php");
	            break;
	        }

	      }else{
	          $error = $siswa->getLastError();
	      }
	  }

?>
<html>
<head>
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

  <title>Ujian Online</title>

  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <script data-require="jquery@*" data-semver="2.0.3" src="assets/js/jquery-3.2.1.min.js"></script>
    <script data-require="bootstrap@*" data-semver="3.1.1" src="assets/js/bootstrap.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="assets/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
</head>
</head>

<body style="background:#C9E5BE;">
	<nav class="navbar navbar-default" style="background:#5D5E73;">
	  <div class="container-fluid">
	    
	  </div><!-- /.container-fluid -->
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-md-12" style="padding-top:40px;">
				<div class="row" id="test">
					<div class="col-md-4 col-md-offset-4" style="padding-top:30px;">
						<h4 align="center" style="color:#fff;">Sistem Informasi Absensi</h4>
						<form method="post">
							<?php if (isset($error)): ?>
				              <div class="alert alert-danger">
				                  <?php echo $error ?>
				              </div>
					         <?php endif; ?>
						  <div class="form-group" >
						    <label style="color:#fff;">No Induk</label>
						    <input type="text" class="form-control" name="no_induk" placeholder="No Induk">
						  </div>
						  <div class="form-group">
						    <label style="color:#fff;">Password</label>
						    <input type="password" class="form-control" name="password" placeholder="Password">
						  </div>
						  <center>
						  	<button type="submit" name="guru" class="btn btn-success">Masuk</button>
						  </center>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<div id="content"></div>
		
	</div>
	
</body>
<script>
	$("#guru").click(function(){
	    //alert("The paragraph was clicked.");
	    $( "#content" ).load( "guru/guru_login.php" );
	});
	$("#siswa").click(function(){
	    //alert("The paragraph was clicked.");
	    $( "#content" ).load( "siswa/siswa_login.php" );
	});
</script>
</html>