<?php
	include('../class/DBConnect.php');
	require_once "../class/Admin.php";

	$admin = new Admin($db);

	if($_POST['op_id'] == 'dosen') 
	{
		$query = '';
		$output = array();
		$query .= "SELECT * FROM tbdosen ";
		if(isset($_POST["search"]["value"]))
		{
		 $query .= 'WHERE nidn LIKE "%'.$_POST["search"]["value"].'%" ';
		 $query .= 'OR nmdos LIKE "%'.$_POST["search"]["value"].'%" ';
		}
		if(isset($_POST["order"]))
		{
		 $query .= 'ORDER BY '.$_POST['order']['0']['column'].' '.$_POST['order']['0']['dir'].' ';
		}
		else
		{
		 $query .= 'ORDER BY nidn DESC ';
		}
		if($_POST["length"] != -1)
		{
		 $query .= 'LIMIT ' . $_POST['start'] . ', ' . $_POST['length'];
		}
		$statement = $db->prepare($query);
		$statement->execute();
		$result = $statement->fetchAll();
		$data = array();
		$filtered_rows = $statement->rowCount();
		foreach($result as $row)
		{
		 $sub_array = array();
		 $sub_array[] = $row["nidn"];
		 $sub_array[] = $row["nmdos"];
		 $sub_array[] = $row["jk"];
		 $sub_array[] = $row["unit_kerja"];
		 $sub_array[] = '<button type="button" name="update" id="'.$row["nidn"].'" class="btn btn-warning btn-xs update">Update</button>';
		 $sub_array[] = '<button type="button" name="delete" id="'.$row["nidn"].'" class="btn btn-danger btn-xs delete">Delete</button>';
		 $data[] = $sub_array;
		}
		$output = array(
		 "draw"    => intval($_POST["draw"]),
		 "recordsTotal"  =>  $filtered_rows,
		 "recordsFiltered" => $admin->total_records('tbdosen'),
		 "data"    => $data
		);
		echo json_encode($output);
	}
	
	if($_POST['op_id'] == 'mhs') 
	{
		$query = '';
		$output = array();
		$query .= "SELECT * FROM tbmahasiswa INNER JOIN tbfakultas INNER JOIN tbprodi ON 
		(tbmahasiswa.fakultas=tbfakultas.kd_fak) AND (tbmahasiswa.kd_prodi=tbprodi.kd_prodi) ";
		if(isset($_POST["search"]["value"]))
		{
		 $query .= 'WHERE tbmahasiswa.npm LIKE "%'.$_POST["search"]["value"].'%" ';
		 $query .= 'OR tbmahasiswa.nm_mhs LIKE "%'.$_POST["search"]["value"].'%" ';
		}
		if(isset($_POST["order"]))
		{
		 $query .= 'ORDER BY '.$_POST['order']['0']['column'].' '.$_POST['order']['0']['dir'].' ';
		}
		else
		{
		 $query .= 'ORDER BY tbmahasiswa.npm DESC ';
		}
		if($_POST["length"] != -1)
		{
		 $query .= 'LIMIT ' . $_POST['start'] . ', ' . $_POST['length'];
		}
		$statement = $db->prepare($query);
		$statement->execute();
		$result = $statement->fetchAll();
		$data = array();
		$filtered_rows = $statement->rowCount();
		foreach($result as $row)
		{
		 $sub_array = array();
		 $sub_array[] = $row["npm"];
		 $sub_array[] = $row["nm_mhs"];
		 $sub_array[] = $row["jk"];
		 $sub_array[] = $row["nm_fak"];
		 $sub_array[] = $row["nm_prodi"];
		 $sub_array[] = '<button type="button" name="update" id="'.$row["npm"].'" class="btn btn-warning btn-xs update">Update</button>';
		 $sub_array[] = '<button type="button" name="delete" id="'.$row["npm"].'" class="btn btn-danger btn-xs delete">Delete</button>';
		 $data[] = $sub_array;
		}
		$output = array(
		 "draw"    => intval($_POST["draw"]),
		 "recordsTotal"  =>  $filtered_rows,
		 "recordsFiltered" => $admin->total_records('tbmahasiswa'),
		 "data"    => $data
		);
		echo json_encode($output);
	}

	if($_POST['op_id'] == 'matkul') 
	{
		$query = '';
		$output = array();
		$query .= "SELECT * FROM tbmatakuliah ";
		if(isset($_POST["search"]["value"]))
		{
		 $query .= 'WHERE kd_matkul LIKE "%'.$_POST["search"]["value"].'%" ';
		 $query .= 'OR nm_matkul LIKE "%'.$_POST["search"]["value"].'%" ';
		}
		if(isset($_POST["order"]))
		{
		 $query .= 'ORDER BY '.$_POST['order']['0']['column'].' '.$_POST['order']['0']['dir'].' ';
		}
		else
		{
		 $query .= 'ORDER BY kd_matkul DESC ';
		}
		if($_POST["length"] != -1)
		{
		 $query .= 'LIMIT ' . $_POST['start'] . ', ' . $_POST['length'];
		}
		$statement = $db->prepare($query);
		$statement->execute();
		$result = $statement->fetchAll();
		$data = array();
		$filtered_rows = $statement->rowCount();
		foreach($result as $row)
		{
		 $sub_array = array();
		 $sub_array[] = $row["kd_matkul"];
		 $sub_array[] = $row["nm_matkul"];
		 $sub_array[] = $row["sks"];
		 $sub_array[] = $row["semester"];
		 $sub_array[] = $row["kurikulum"];
		 $sub_array[] = '<button type="button" name="update" id="'.$row["kd_matkul"].'" class="btn btn-warning btn-xs update">Update</button>';
		 $sub_array[] = '<button type="button" name="delete" id="'.$row["kd_matkul"].'" class="btn btn-danger btn-xs delete">Delete</button>';
		 $data[] = $sub_array;
		}
		$output = array(
		 "draw"    => intval($_POST["draw"]),
		 "recordsTotal"  =>  $filtered_rows,
		 "recordsFiltered" => $admin->total_records('tbmatakuliah'),
		 "data"    => $data
		);
		echo json_encode($output);
	}

	if($_POST['op_id'] == 't_ajaran') 
	{
		$query = '';
		$output = array();
		$query .= "SELECT * FROM tbtahun_ajaran ";
		if(isset($_POST["search"]["value"]))
		{
		 $query .= 'WHERE semester LIKE "%'.$_POST["search"]["value"].'%" ';
		 $query .= 'OR tahun_ajaran LIKE "%'.$_POST["search"]["value"].'%" ';
		}
		if(isset($_POST["order"]))
		{
		 $query .= 'ORDER BY '.$_POST['order']['0']['column'].' '.$_POST['order']['0']['dir'].' ';
		}
		else
		{
		 $query .= 'ORDER BY id_ta DESC ';
		}
		if($_POST["length"] != -1)
		{
		 $query .= 'LIMIT ' . $_POST['start'] . ', ' . $_POST['length'];
		}
		$statement = $db->prepare($query);
		$statement->execute();
		$result = $statement->fetchAll();
		$data = array();
		$filtered_rows = $statement->rowCount();
		foreach($result as $row)
		{
		 $sub_array = array();
		 $sub_array[] = $row["tahun_ajaran"];
		 if($row["semester"] == 1) {
		 	$ta = 'Ganjil';
		 } else if($row['semester'] == 2) {
		 	$ta = 'Genap';
		 }
		 $sub_array[] = $ta;
		 $sub_array[] = $row["tanggal_edit"];
		 $sub_array[] = $row["edit_id_user"];
		 $sub_array[] = '<button type="button" name="update" id="'.$row["id_ta"].'" class="btn btn-warning btn-xs update">Update</button>';
		 $sub_array[] = '<button type="button" name="delete" id="'.$row["id_ta"].'" class="btn btn-danger btn-xs delete">Delete</button>';
		 $data[] = $sub_array;
		}
		$output = array(
		 "draw"    => intval($_POST["draw"]),
		 "recordsTotal"  =>  $filtered_rows,
		 "recordsFiltered" => $admin->total_records('tbtahun_ajaran'),
		 "data"    => $data
		);
		echo json_encode($output);
	}

	if($_POST['op_id'] == 'jadwal') 
	{
		$query = '';
		$output = array();
		$query .= "SELECT * FROM tbjatwalkuliah 
		INNER JOIN tbtahun_ajaran ON (tbjatwalkuliah.thn_ajaran=tbtahun_ajaran.id_ta)
		INNER JOIN tbjam ON (tbjatwalkuliah.kd_jam=tbjam.kd_jam)
		INNER JOIN tbmatakuliah ON (tbjatwalkuliah.kd_matkul=tbmatakuliah.kd_matkul)
		INNER JOIN tbdosen ON (tbjatwalkuliah.dosen=tbdosen.nidn)
		INNER JOIN tbprodi ON (tbjatwalkuliah.prodi=tbprodi.kd_prodi)
		";
		 
		if(isset($_POST["search"]["value"]))
		{
		 $query .= 'WHERE tbmatakuliah.nm_matkul LIKE "%'.$_POST["search"]["value"].'%" ';
		 $query .= 'OR tbdosen.nmdos LIKE "%'.$_POST["search"]["value"].'%" ';
		 $query .= 'OR tbjatwalkuliah.hari LIKE "%'.$_POST["search"]["value"].'%" ';
		}
		if(isset($_POST["order"]))
		{
		 $query .= 'ORDER BY '.$_POST['order']['0']['column'].' '.$_POST['order']['0']['dir'].' ';
		}
		else
		{
		 $query .= 'ORDER BY tbjatwalkuliah.id DESC ';
		}
		if($_POST["length"] != -1)
		{
		 $query .= 'LIMIT ' . $_POST['start'] . ', ' . $_POST['length'];
		}
		$statement = $db->prepare($query);
		$statement->execute();
		$result = $statement->fetchAll();
		$data = array();
		$filtered_rows = $statement->rowCount();
		foreach($result as $row)
		{
		 $sub_array = array();
		 switch ($row["hari"]) {
		 	case '1':
		 		$hari = 'Senin';
		 		break;

		 	case '2':
		 		$hari = 'Selasa';
		 		break;

		 	case '3':
		 		$hari = 'Rabu';
		 		break;
		 	
		 	case '4':
		 		$hari = 'Kamis';
		 		break;

		 	case '5':
		 		$hari = 'Jumat';
		 		break;	
		 }
		 $sub_array[] = $row["id"];
		 $sub_array[] = $hari;
		 $sub_array[] = $row["jam"].' - '.$row['end'];
		 $sub_array[] = $row["nm_matkul"];
		 $sub_array[] = $row["ruang"];
		 $kelas = $row["nm_prodi"].' ('.$row["kelas"].')';
		 $sub_array[] = $kelas;
		 $sub_array[] = $row["nmdos"];
		 $sub_array[] = $row["semester"];
		 $sub_array[] = '<a href="adm_data_absensi.php?id='.$row["id"].'" class="btn btn-success btn-xs">Jadwal</a>'.'<div style="padding-bottom:5px;"></div>'.'<a href="adm_jadwal_mhs.php?id='.$row["id"].'" class="btn btn-warning btn-xs">Daftar</a>';
		 $sub_array[] = '<button type="button" name="update" id="'.$row["id"].'" class="btn btn-warning btn-xs update">Update</button>';
		 $sub_array[] = '<button type="button" name="delete" id="'.$row["id"].'" class="btn btn-danger btn-xs delete">Delete</button>';
		 $data[] = $sub_array;
		}
		$output = array(
		 "draw"    => intval($_POST["draw"]),
		 "recordsTotal"  =>  $filtered_rows,
		 "recordsFiltered" => $admin->total_records('tbjatwalkuliah'),
		 "data"    => $data
		);
		echo json_encode($output);
	}

	if($_POST['op_id'] == 'absensi') 
	{
		$query = '';
		$output = array();
		$query .= "SELECT * FROM tbabsensi 
		INNER JOIN tbjatwalkuliah ON (tbabsensi.id_jadwal=tbjatwalkuliah.id) WHERE tbabsensi.id_jadwal={$_POST['id_jadwal']} ";
		if(isset($_POST["search"]["value"]))
		{
		 $query .= 'AND tbabsensi.nama_absensi LIKE "%'.$_POST["search"]["value"].'%" ';
		}
		if(isset($_POST["order"]))
		{
		 $query .= 'ORDER BY '.$_POST['order']['0']['column'].' '.$_POST['order']['0']['dir'].' ';
		}
		else
		{
		 $query .= 'ORDER BY tbabsensi.id_absensi DESC ';
		}
		if($_POST["length"] != -1)
		{
		 $query .= 'LIMIT ' . $_POST['start'] . ', ' . $_POST['length'];
		}
		$statement = $db->prepare($query);
		$statement->execute();
		$result = $statement->fetchAll();
		$data = array();
		$filtered_rows = $statement->rowCount();
		foreach($result as $row)
		{
		 $sub_array = array();
		 $sub_array[] = $row["nama_absensi"];
		 $dosen = $admin->getDataByID('tbdosen', 'nidn', $row["dosen"]);
		 $sub_array[] = $dosen['nmdos'];
		 $matkul = $admin->getDataByID('tbmatakuliah', 'kd_matkul', $row["kd_matkul"]);
		 $sub_array[] = $matkul['nm_matkul'];
		 $sub_array[] = $row["tgl_buat"];
		 $sub_array[] = '<a href="adm_absen_dtl.php?id='.$row["id_absensi"].'" class="btn btn-success btn-xs">Open</a>';
		 $sub_array[] = '<button type="button" name="update" id="'.$row["id_absensi"].'" class="btn btn-warning btn-xs update">Update</button>';
		 $sub_array[] = '<button type="button" name="delete" id="'.$row["id_absensi"].'" class="btn btn-danger btn-xs delete">Delete</button>';
		 $data[] = $sub_array;
		}
		$output = array(
		 "draw"    => intval($_POST["draw"]),
		 "recordsTotal"  =>  $filtered_rows,
		 "recordsFiltered" => $admin->total_records('tbabsensi'),
		 "data"    => $data
		);
		echo json_encode($output);
	}

	if($_POST['op_id'] == 'absensi_detail') 
	{
		$query = '';
		$output = array();
		$query .= "SELECT * FROM tbabsensi_detail 
		INNER JOIN tbabsensi ON (tbabsensi_detail.id_absen=tbabsensi.id_absensi) 
		INNER JOIN tbmahasiswa ON (tbabsensi_detail.id_mhs=tbmahasiswa.npm)
		WHERE tbabsensi_detail.id_absen={$_POST['id_absen']} ";
		if(isset($_POST["search"]["value"]))
		{
		 $query .= 'AND tbmahasiswa.nm_mhs LIKE "%'.$_POST["search"]["value"].'%" ';
		 //$query .= 'OR tbmahasiswa.npm LIKE "%'.$_POST["search"]["value"].'%" ';
		}
		if(isset($_POST["order"]))
		{
		 $query .= 'ORDER BY '.$_POST['order']['0']['column'].' '.$_POST['order']['0']['dir'].' ';
		}
		else
		{
		 $query .= 'ORDER BY tbabsensi_detail.id_abdt DESC ';
		}
		if($_POST["length"] != -1)
		{
		 $query .= 'LIMIT ' . $_POST['start'] . ', ' . $_POST['length'];
		}
		$statement = $db->prepare($query);
		$statement->execute();
		$result = $statement->fetchAll();
		$data = array();
		$filtered_rows = $statement->rowCount();
		foreach($result as $row)
		{
		 $sub_array = array();
		 $sub_array[] = $row["npm"];
		 $sub_array[] = $row['nm_mhs'];
		 $sub_array[] = $row['ket'];
		 $sub_array[] = $row['jk'];
		 $sub_array[] = $row['tgl_absen'];
		 // $sub_array[] = '<a href="adm_absensi_detail.php?id='.$row["id_absensi"].'" class="btn btn-success btn-xs">Open</a>';
		 //$sub_array[] = '<button type="button" name="update" id="'.$row["id_abdt"].'" class="btn btn-warning btn-xs update">Update</button>';
		 //$sub_array[] = '<button type="button" name="delete" id="'.$row["id_abdt"].'" class="btn btn-danger btn-xs delete">Delete</button>';
		 $data[] = $sub_array;
		}
		$output = array(
		 "draw"    => intval($_POST["draw"]),
		 "recordsTotal"  =>  $filtered_rows,
		 "recordsFiltered" => $admin->total_records('tbabsensi_detail'),
		 "data"    => $data
		);
		echo json_encode($output);
	}

	if($_POST['op_id'] == 't_jadxmhs') 
	{
		$query = '';
		$output = array();
		$query .= "SELECT * FROM tbjadwalxmhs 
		INNER JOIN tbmahasiswa ON (tbjadwalxmhs.id_mhs=tbmahasiswa.npm)
		WHERE tbjadwalxmhs.id_jadwal={$_POST['id_jadwal']} ";
		if(isset($_POST["search"]["value"]))
		{
		 $query .= 'AND tbmahasiswa.nm_mhs LIKE "%'.$_POST["search"]["value"].'%" ';
		 //$query .= 'OR tbmahasiswa.npm LIKE "%'.$_POST["search"]["value"].'%" ';
		}
		if(isset($_POST["order"]))
		{
		 $query .= 'ORDER BY '.$_POST['order']['0']['column'].' '.$_POST['order']['0']['dir'].' ';
		}
		else
		{
		 $query .= 'ORDER BY tbmahasiswa.npm DESC ';
		}
		if($_POST["length"] != -1)
		{
		 $query .= 'LIMIT ' . $_POST['start'] . ', ' . $_POST['length'];
		}
		$statement = $db->prepare($query);
		$statement->execute();
		$result = $statement->fetchAll();
		$data = array();
		$filtered_rows = $statement->rowCount();
		foreach($result as $row)
		{
		 $sub_array = array();
		 $sub_array[] = $row["npm"];
		 $sub_array[] = $row['nm_mhs'];
		 $sub_array[] = $row['hadir'];
		 $sub_array[] = $row['ijin'];
		 $sub_array[] = $row['sakit'];
		 // $sub_array[] = '<a href="adm_absensi_detail.php?id='.$row["id_absensi"].'" class="btn btn-success btn-xs">Open</a>';
		 //$sub_array[] = '<button type="button" name="update" id="'.$row["id_abdt"].'" class="btn btn-warning btn-xs update">Update</button>';
		 $sub_array[] = '<button type="button" name="delete" id="'.$row["id_jdm"].'" class="btn btn-danger btn-xs delete">Delete</button>';
		 $data[] = $sub_array;
		}
		$output = array(
		 "draw"    => intval($_POST["draw"]),
		 "recordsTotal"  =>  $filtered_rows,
		 "recordsFiltered" => $admin->total_records('tbjadwalxmhs'),
		 "data"    => $data
		);
		echo json_encode($output);
	}
?>