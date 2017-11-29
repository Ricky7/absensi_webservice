<?php
include('../class/DBConnect.php');
include('function.php');
if(isset($_POST["operation"]) && isset($_POST["table"]))
{
	//dosen
	if($_POST["operation"] == "Add" && $_POST["table"] == "tbdosen")
	{
		$dosen = $db->prepare(
            "SELECT nidn FROM tbdosen
            WHERE nidn = '".$_POST["nidn"]."'"
        );
        $dosen->execute();
        $dosenRes=$dosen->fetch(PDO::FETCH_ASSOC);
        if(!$dosen->rowCount()>0) {
        	$statement = $db->prepare("
				INSERT INTO tbdosen (nidn, nmdos, jk, unit_kerja) 
				VALUES (:nidn, :nmdos, :jk, :unit_kerja)
			");
			$result = $statement->execute(
				array(
					':nidn'			=>	$_POST["nidn"],
					':nmdos'		=>	$_POST["nmdos"],
					':jk'			=>	$_POST["jk"],
					':unit_kerja'	=>	$_POST["unit_kerja"]
				)
			);
			if(!empty($result))
			{
				echo 'Data Inserted';
			}
        } else { 
        	echo 'Data Sudah ada';
        }
		
	}

	if($_POST["operation"] == "Edit" && $_POST["table"] == "tbdosen")
	{
		$statement = $db->prepare(
			"UPDATE tbdosen 
			SET nmdos = :nmdos, jk = :jk, unit_kerja = :unit_kerja  
			WHERE nidn = :nidn
			"
		);
		$result = $statement->execute(
			array(
				':nmdos'		=>	$_POST["nmdos"],
				':jk'			=>	$_POST["jk"],
				':unit_kerja'	=>	$_POST["unit_kerja"],
				':nidn'			=>	$_POST["user_id"]
			)
		);
		if(!empty($result))
		{
			echo 'Data Updated';
		}
	}

	//mahasiswa
	if($_POST["operation"] == "Add" && $_POST["table"] == "tbmahasiswa")
	{
		$mhs = $db->prepare(
            "SELECT npm FROM tbmahasiswa
            WHERE npm = '".$_POST["npm"]."'"
        );
        $mhs->execute();
        $mhsRes=$mhs->fetch(PDO::FETCH_ASSOC);
        if(!$mhs->rowCount()>0) {
        	$statement = $db->prepare("
				INSERT INTO tbmahasiswa (npm, nm_mhs, jk, fakultas, kd_prodi) 
				VALUES (:npm, :nm_mhs, :jk, :fakultas, :kd_prodi)
			");
			$result = $statement->execute(
				array(
					':npm'			=>	$_POST["npm"],
					':nm_mhs'		=>	$_POST["nm_mhs"],
					':jk'			=>	$_POST["jk"],
					':fakultas'		=>	$_POST["fak"],
					':kd_prodi'		=>	$_POST["prodi"]
				)
			);
			if(!empty($result))
			{
				echo 'Data Inserted';
			}
        } else {
        	echo 'Data sudah ada';
        }
	}
	
	if($_POST["operation"] == "Edit" && $_POST["table"] == "tbmahasiswa")
	{
		$statement = $db->prepare("UPDATE tbmahasiswa SET nm_mhs = :nm_mhs, jk = :jk, fakultas = :fakultas, 
		kd_prodi = :kd_prodi WHERE npm = :npm
		");
		$result = $statement->execute(
			array(
				':nm_mhs'		=>	$_POST["nm_mhs"],
				':jk'			=>	$_POST["jk"],
				':fakultas'		=>	$_POST["fak"],
				':kd_prodi'		=>	$_POST["prodi"],
				':npm'			=>	$_POST["user_id"]
			)
		);
		if(!empty($result))
		{
			echo 'Data Updated';
		}
	}

	//matakuliah
	if($_POST["operation"] == "Add" && $_POST["table"] == "tbmatakuliah")
	{
		$matkul = $db->prepare(
            "SELECT kd_matkul FROM tbmatakuliah
            WHERE kd_matkul = '".$_POST["kd_matkul"]."'"
        );
        $matkul->execute();
        $matkulRes=$matkul->fetch(PDO::FETCH_ASSOC);
        if(!$matkul->rowCount()>0) {
        	$statement = $db->prepare("
				INSERT INTO tbmatakuliah (kd_matkul, nm_matkul, sks, semester, kurikulum) 
				VALUES (:kd_matkul, :nm_matkul, :sks, :semester, :kurikulum)
			");
			$result = $statement->execute(
				array(
					':kd_matkul'	=>	$_POST["kd_matkul"],
					':nm_matkul'	=>	$_POST["nm_matkul"],
					':sks'			=>	$_POST["sks"],
					':semester'		=>	$_POST["sem"],
					':kurikulum'	=>	$_POST["kur"]
				)
			);
			if(!empty($result))
			{
				echo 'Data Inserted';
			}
        } else {
        	echo 'Data sudah ada';
        }
		
	}

	if($_POST["operation"] == "Edit" && $_POST["table"] == "tbmatakuliah")
	{
		$statement = $db->prepare(
			"UPDATE tbmatakuliah 
			SET nm_matkul = :nm_matkul, sks = :sks, semester = :semester, kurikulum = :kurikulum  
			WHERE kd_matkul = :kd_matkul
			"
		);
		$result = $statement->execute(
			array(
				':nm_matkul'	=>	$_POST["nm_matkul"],
				':sks'			=>	$_POST["sks"],
				':semester'		=>	$_POST["sem"],
				':kurikulum'	=>	$_POST["kur"],
				':kd_matkul'	=>	$_POST["user_id"]
			)
		);
		if(!empty($result))
		{
			echo 'Data Updated';
		}
	}

	//tahun ajaran
	if($_POST["operation"] == "Add" && $_POST["table"] == "tbtahun_ajaran")
	{
		$th = $db->prepare(
            "SELECT id_ta FROM tbtahun_ajaran
            WHERE id_ta = '".$_POST["t_a"].''.$_POST["sem"]."'"
        );
        $th->execute();
        $thRes=$th->fetch(PDO::FETCH_ASSOC);
        if(!$th->rowCount()>0) {
        	$statement = $db->prepare("
				INSERT INTO tbtahun_ajaran (status, semester, id_ta, tahun_ajaran, tanggal_buat, id_user, tanggal_edit, edit_id_user) 
				VALUES (:status, :semester, :id_ta, :tahun_ajaran, NOW(), :id_user, NOW(), :edit_id_user)
			");
			$result = $statement->execute(
				array(
					':status'		=>	'N',
					':semester'		=>	$_POST["sem"],
					':id_ta'		=>	$_POST["t_a"].''.$_POST["sem"],
					':tahun_ajaran'	=>	$_POST["t_a"],
					':id_user'		=>	'Admin',
					':edit_id_user'	=>	'Admin'
				)
			);
			if(!empty($result))
			{
				echo 'Data Inserted';
			}
        } else {
        	echo 'Data sudah ada';
        }
		
	}

	if($_POST["operation"] == "Edit" && $_POST["table"] == "tbtahun_ajaran")
	{
		$statement = $db->prepare(
			"UPDATE tbtahun_ajaran 
			SET semester = :semester, id_ta = :id_ta, tahun_ajaran = :tahun_ajaran, tanggal_edit = NOW(), edit_id_user = :edit_id_user  
			WHERE id_ta = :id_ta
			"
		);
		$result = $statement->execute(
			array(
				':semester'		=>	$_POST["sem"],
				':id_ta'		=>	$_POST["t_a"].''.$_POST["sem"],
				':tahun_ajaran'	=>	$_POST["t_a"],
				':edit_id_user'	=>	'Admin',
				':id_ta'		=>	$_POST["user_id"]
			)
		);
		if(!empty($result))
		{
			echo 'Data Updated';
		}
	}

	//Jadwal Kuliah
	if($_POST["operation"] == "Add" && $_POST["table"] == "tbjatwalkuliah")
	{
		$urutOne = (int) substr($_POST["ta"], 2, 3);
		$urutTwo = $_POST["prodi"];
		$urut = $urutOne.''.$urutTwo;
		$term = "$urut%";
		$stmt = $db->prepare("SELECT MAX(id) as maxid FROM tbjatwalkuliah WHERE id like :id LIMIT 1");
		$stmt->bindparam(":id",$term);
		$stmt->execute();
		$dataID=$stmt->fetch(PDO::FETCH_ASSOC);
		$lastID = (int) substr($dataID['maxid'], 6);
		if($lastID == 0){
			$lastID = '01';
		} else {
			$lastID += 1;
		}
		$nextID = $urut.''.$lastID;

		//echo $nextID;
		//exit();

		//jika ada
		if($stmt->rowCount()>0) {
			$statement = $db->prepare("
			INSERT INTO tbjatwalkuliah (id, thn_ajaran, kd_matkul, hari, 
				kd_jam, ruang, dosen, prodi, kelas) 
			VALUES (:id, :thn_ajaran, :kd_matkul, :hari, :kd_jam, 
				:ruang, :dosen, :prodi, :kelas)
			");
			$result = $statement->execute(
				array(
					':id'			=>	$nextID,
					':thn_ajaran'	=>	$_POST["ta"],
					':kd_matkul'	=>	$_POST["matkul"],
					':hari'			=>	$_POST["hari"],
					':kd_jam'		=>	$_POST["jam"],
					':ruang'		=>	$_POST["ruang"],
					':dosen'		=>	$_POST["dosen"],
					':prodi'		=>	$_POST["prodi"],
					':kelas'		=>	$_POST["kelas"]
				)
			);
			if(!empty($result))
			{
				echo 'Data Inserted';
			}
		}		
	}

	if($_POST["operation"] == "Edit" && $_POST["table"] == "tbjatwalkuliah")
	{
		$statement = $db->prepare(
			"UPDATE tbjatwalkuliah 
			SET thn_ajaran = :thn_ajaran, kd_matkul = :kd_matkul, 
			hari = :hari, kd_jam = :kd_jam, ruang = :ruang, dosen = :dosen,
			prodi = :prodi, kelas = :kelas, kelas = :kelas  
			WHERE id = :idx
			"
		);
		$result = $statement->execute(
			array(
				':thn_ajaran'	=>	$_POST["ta"],
				':kd_matkul'	=>	$_POST["matkul"],
				':hari'			=>	$_POST["hari"],
				':kd_jam'		=>	$_POST["jam"],
				':ruang'		=>	$_POST["ruang"],
				':dosen'		=>	$_POST["dosen"],
				':prodi'		=>	$_POST["prodi"],
				':kelas'		=>	$_POST["kelas"],
				':idx'			=>	$_POST["user_id"]
			)
		);
		if(!empty($result))
		{
			echo 'Data Updated';
		}
	}

	//absensi
	if($_POST["operation"] == "Add" && $_POST["table"] == "tbabsensi")
	{
		$absen = $db->prepare(
            "SELECT id_jadwal, nama_absensi FROM tbabsensi
            WHERE id_jadwal = '".$_POST["id_jadwal"]."' AND nama_absensi = '".$_POST["nama_abs"]."'"
        );
        $absen->execute();
        $absenRes=$absen->fetch(PDO::FETCH_ASSOC);
        if(!$absen->rowCount()>0) {
        	//do it
        	$statement = $db->prepare("
			INSERT INTO tbabsensi (nama_absensi, id_jadwal, tgl_buat, status) 
			VALUES (:nama_absensi, :id_jadwal, NOW(), :status)
			");
			$result = $statement->execute(
				array(
					':nama_absensi'	=>	$_POST["nama_abs"],
					':id_jadwal'	=>	$_POST["id_jadwal"],
					':status'		=>	'1'
				)
			);
			if(!empty($result))
			{
				echo 'Data Inserted';
			}
        } else {
        	echo "Data Sudah Ada";
        }
		
	}

	if($_POST["operation"] == "Edit" && $_POST["table"] == "tbabsensi")
	{
		$absen = $db->prepare(
            "SELECT id_jadwal, nama_absensi FROM tbabsensi
            WHERE id_jadwal = '".$_POST["id_jadwal"]."' AND nama_absensi = '".$_POST["nama_abs"]."'"
        );
        $absen->execute();
        $absenRes=$absen->fetch(PDO::FETCH_ASSOC);
        if(!$absen->rowCount()>0) {
        	$statement = $db->prepare(
				"UPDATE tbabsensi 
				SET nama_absensi = :nama_absensi  
				WHERE id_absensi = :id_absensi
				"
			);
			$result = $statement->execute(
				array(
					':nama_absensi'	=>	$_POST["nama_abs"],
					':id_absensi'		=>	$_POST["user_id"]
				)
			);
			if(!empty($result))
			{
				echo 'Data Updated';
			}
        } else {
        	echo "Data Sudah Ada";
        }
		
	}

	//jadwalxmhs
	if($_POST["operation"] == "Add" && $_POST["table"] == "tbjadwalxmhs")
	{
		$mhs = $db->prepare(
            "SELECT id_mhs FROM tbjadwalxmhs
            WHERE id_mhs = '".$_POST["id_mhs"]."' AND id_jadwal = '".$_POST["id_jadwal"]."'"
        );
        $mhs->execute();
        $mhsRes=$mhs->fetch(PDO::FETCH_ASSOC);
        if(!$mhs->rowCount()>0) {
        	$statement = $db->prepare("
				INSERT INTO tbjadwalxmhs (id_jadwal, id_mhs) 
				VALUES (:id_jadwal, :id_mhs)
			");
			$result = $statement->execute(
				array(
					':id_jadwal'	=>	$_POST["id_jadwal"],
					':id_mhs'	=>	$_POST["id_mhs"]
				)
			);
			if(!empty($result))
			{
				echo 'Data Inserted';
			}
        } else {
        	echo 'Data sudah ada';
        }
		
	}

	if($_POST["operation"] == "Edit" && $_POST["table"] == "tbjadwalxmhs")
	{
		$statement = $db->prepare(
			"UPDATE tbjadwalxmhs 
			SET id_jadwal = :id_jadwal, id_mhs = :id_mhs  
			WHERE id_jdm = :id_jdm
			"
		);
		$result = $statement->execute(
			array(
				':id_jadwal'	=>	$_POST["id_jadwal"],
				':id_mhs'	 	=>	$_POST["id_mhs"],
				':id_jdm'		=>	$_POST["user_id"]
			)
		);
		if(!empty($result))
		{
			echo 'Data Updated';
		}
	}

	//tbabsen_detail
	if($_POST["operation"] == "Add" && $_POST["table"] == "tbabsensi_detail")
	{
		//ambil id jadwal dari tabel tbabsensi
		$jadwal = $db->prepare(
            "SELECT id_jadwal FROM tbabsensi
            WHERE id_absensi = '".$_POST["id_absen"]."'"
        );
        $jadwal->execute();
        $jadwalRes=$jadwal->fetch(PDO::FETCH_ASSOC);
        if($jadwal->rowCount()>0) {
        	//cek jika mahasiswa terdaftar pada jadwal mata kuliah
        	$cek = $db->prepare(
                "SELECT * FROM tbjadwalxmhs
                WHERE id_jadwal = '".$jadwalRes['id_jadwal']."' AND id_mhs = '".$_POST["id_mhs"]."'"
            );
            $cek->execute();
            if($cek->rowCount()>0) {
            	//cek jika mahasiswa sudah terdaftar dalam absen
            	$statement = $db->prepare(
                    "SELECT * FROM tbabsensi_detail 
                    WHERE id_absen = '".$_POST["id_absen"]."' AND id_mhs = '".$_POST["id_mhs"]."'"
                );
                $statement->execute();
                if(!$statement->rowCount()>0) {
                	//input mahasiswa
                	$statement = $db->prepare("
						INSERT INTO tbabsensi_detail (id_absen, id_mhs, ket, tgl_absen) 
						VALUES (:id_absen, :id_mhs, :ket, NOW())
					");
					$result = $statement->execute(
						array(
							':id_absen'	=>	$_POST["id_absen"],
							':id_mhs'	=>	$_POST["id_mhs"],
							':ket'		=>	$_POST["ket"]
						)
					);
					if(!empty($result)) {
						if($_POST['ket'] == 'I') {
							$ket = 'ijin';
						} else if($_POST['ket'] == 'S') {
							$ket = 'sakit';
						}
						$hadir = $db->prepare(
                            "UPDATE tbjadwalxmhs SET {$ket} = {$ket}+1  
                            WHERE id_jadwal = '".$jadwalRes['id_jadwal']."' AND id_mhs = '".$_POST["id_mhs"]."'"
                        );
                        if($hadir->execute()) {
                        	echo 'Data Inserted';
                        }
					}
                } else {
                	echo "Mahasiswa sudah diabsen";
                }
            } else {
            	echo "Mahasiswa tidak terdaftar";
            }
        } else {
        	echo 'Absensi Tidak ada';
        }	
	}
}

?>