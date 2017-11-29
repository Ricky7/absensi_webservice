<?php

    class Admin {

        private $db; 
        private $error; 

        function __construct($db_conn) {

            $this->db = $db_conn;

            // Mulai session
            if(!isset($_SESSION)){
                session_start();
            }
        }

        public function login($username, $password)
        {
            try
            {
                // Ambil data dari database
                $query = $this->db->prepare("SELECT * FROM tbl_admin WHERE username = :username");
                $query->bindParam(":username", $username);
                $query->execute();
                $data = $query->fetch();

                // Jika jumlah baris > 0
                if($query->rowCount() > 0){
                    // jika password yang dimasukkan sesuai dengan yg ada di database
                    if(password_verify($password, $data['password'])){
                        $_SESSION['user_session'] = $data['id_admin'];
                        $_SESSION['user_role'] = $data['role'];
                        return true;
                    }else{
                        $this->error = "Username atau Password Salah";
                        return false;
                    }
                }else{
                    $this->error = "Akun tidak ada";
                    return false;
                }
            } catch (PDOException $e) {
                echo $e->getMessage();
                return false;
            }
        }

        public function loginAPI($nidn, $password)
        {
            try
            {
                // Ambil data dari database
                $query = $this->db->prepare("SELECT * FROM tbdosen WHERE nidn = :nidn");
                $query->bindParam(":nidn", $nidn);
                $query->execute();
                $data = $query->fetch();

                // Jika jumlah baris > 0
                if($query->rowCount() > 0){
                    // jika password yang dimasukkan sesuai dengan yg ada di database
                    if(password_verify($password, $data['password'])){
                        $msg = "Data Matched";
                        $msgJson = json_encode($msg);
                        echo $msgJson;
                    }else{
                        $msg = "Username atau Password Salah";
                        $msgJson = json_encode($msg);
                        echo $msgJson;
                    }
                }else{
                    $msg = "Akun tidak ada";
                    $msgJson = json_encode($msg);
                    echo $msgJson;
                }
            } catch (PDOException $e) {
                echo $e->getMessage();
                return false;
            }
        }

        public function jadwalAPI($nidn)
        {
            //$output = array();
            $statement = $this->db->prepare(
                "SELECT * FROM tbjatwalkuliah 
                INNER JOIN tbmatakuliah ON (tbjatwalkuliah.kd_matkul=tbmatakuliah.kd_matkul)
                INNER JOIN tbprodi ON (tbjatwalkuliah.prodi=tbprodi.kd_prodi)
                WHERE tbjatwalkuliah.dosen = '".$nidn."'"
            );
            $statement->execute();
            //$result = $statement->fetchAll();
            if($statement->rowCount()>0) {
                while($row[]=$statement->fetch(PDO::FETCH_ASSOC)) {
                    $tem = $row;
                    $json = json_encode($tem);
                }
                echo $json;
            } else {
                $msg = 'Kosong';
                $json = json_encode($msg);
                echo $json;
            }
            
        }

        public function absensiAPI($jadwal)
        {
            //$output = array();
            $statement = $this->db->prepare(
                "SELECT * FROM tbabsensi 
                WHERE id_jadwal = '".$jadwal."' AND status = '1'"
            );
            $statement->execute();
            //$result = $statement->fetchAll();
            if($statement->rowCount()>0) {
                while($row[]=$statement->fetch(PDO::FETCH_ASSOC)) {
                    $tem = $row;
                    $json = json_encode($tem);
                }
                echo $json;
            } else {
                $msg = 'Kosong';
                $json = json_encode($msg);
                echo $json;
            }
        }

        public function listMhsAPI($absensi)
        {
            //$output = array();
            $statement = $this->db->prepare(
                "SELECT * FROM tbabsensi_detail 
                INNER JOIN tbmahasiswa ON (tbabsensi_detail.id_mhs=tbmahasiswa.npm)
                WHERE tbabsensi_detail.id_absen = '".$absensi."'"
            );
            $statement->execute();
            //$result = $statement->fetchAll();
            if($statement->rowCount()>0) {
                while($row[]=$statement->fetch(PDO::FETCH_ASSOC)) {
                    $tem = $row;
                    $json = json_encode($tem);
                }
                echo $json;
            } else {
                $msg = 'Kosong';
                $json = json_encode($msg);
                echo $json;
            }
        }

        public function jadwalxMhsAPI($jadwal)
        {
            //$output = array();
            $statement = $this->db->prepare(
                "SELECT * FROM tbjadwalxmhs 
                INNER JOIN tbmahasiswa ON (tbjadwalxmhs.id_mhs=tbmahasiswa.npm)
                WHERE tbjadwalxmhs.id_jadwal = '".$jadwal."'"
            );
            $statement->execute();
            //$result = $statement->fetchAll();
            if($statement->rowCount()>0) {
                while($row[]=$statement->fetch(PDO::FETCH_ASSOC)) {
                    $tem = $row;
                    $json = json_encode($tem);
                }
                echo $json;
            } else {
                $msg = 'Kosong';
                $json = json_encode($msg);
                echo $json;
            }
        }

        public function inputMhsAPI($id_absen, $npm, $ket)
        {
            //$output = array();
            //ambil id jadwal dari tabel tbabsensi
            $jadwal = $this->db->prepare(
                "SELECT id_jadwal FROM tbabsensi
                WHERE id_absensi = '".$id_absen."'"
            );
            $jadwal->execute();
            $jadwalRes=$jadwal->fetch(PDO::FETCH_ASSOC);
            if($jadwal->rowCount()>0) {
                //cek jika mahasiswa terdaftar pada jadwal mata kuliah
                $cek = $this->db->prepare(
                    "SELECT * FROM tbjadwalxmhs
                    WHERE id_jadwal = '".$jadwalRes['id_jadwal']."' AND id_mhs = '".$npm."'"
                );
                $cek->execute();
                if($cek->rowCount()>0) {
                    //cek jika mahasiswa sudah terdaftar dalam absen
                    $statement = $this->db->prepare(
                        "SELECT * FROM tbabsensi_detail 
                        WHERE id_absen = '".$id_absen."' AND id_mhs = '".$npm."'"
                    );
                    $statement->execute();
                    //$result = $statement->fetchAll();
                    if(!$statement->rowCount()>0) {
                        //input mahasiswa
                        $inp = $this->db->prepare(
                            "INSERT INTO tbabsensi_detail (id_absen, id_mhs, ket, tgl_absen) 
                            VALUES ('{$id_absen}', '{$npm}', '{$ket}', NOW())"
                        );

                        if ($inp->execute()) {
                            //tambahkan absen ke laporan kehadiran
                            if($ket == 'I') {
                                $kets = 'ijin';
                            } else if($ket == 'S') {
                                $kets = 'sakit';
                            } else if($ket == 'H') {
                                $kets = 'hadir';
                            }
                            $hadir = $this->db->prepare(
                                "UPDATE tbjadwalxmhs SET {$kets} = {$kets}+1  
                                WHERE id_jadwal = '".$jadwalRes['id_jadwal']."' AND id_mhs = '".$npm."'"
                            );
                            $hadir->execute();

                            $msg = "Sukses";
                            $json = json_encode($msg);
                            echo $json;
                            return true;
                        }

                        return false;
                    } else {
                        $msg = 'Gagal';
                        $json = json_encode($msg);
                        echo $json;
                    }
                } else {
                    $msg = 'Mahasiswa Tidak terdaftar';
                    $json = json_encode($msg);
                    echo $json;
                }
            } else {
                $msg = 'Absensi Tidak ada';
                $json = json_encode($msg);
                echo $json;
            }

            
        }

        public function inputPrmAPI($id_jadwal)
        {
            $jadwal = $this->db->prepare(
                "SELECT id_absensi, id_jadwal, nama_absensi FROM tbabsensi
                WHERE tgl_buat IN (SELECT MAX(tgl_buat) from tbabsensi WHERE id_jadwal = '".$id_jadwal."')"
            );
            $jadwal->execute();
            $jadwalRes=$jadwal->fetch(PDO::FETCH_ASSOC);
            if($jadwal->rowCount()>0) {
                //jika ada buat pertemuan selanjutnya
                $last = (int) substr($jadwalRes['nama_absensi'], -1);
                $last += 1;
                $nama = 'Pertemuan '.$last;
                $next = $this->db->prepare(
                    "INSERT INTO tbabsensi (nama_absensi, id_jadwal, tgl_buat, status) 
                    VALUES ('{$nama}', '{$id_jadwal}', NOW(), '1')"
                );

                if ($next->execute()) {

                    $disable = $this->db->prepare(
                        "UPDATE tbabsensi SET status = '0'  
                        WHERE id_absensi = '".$jadwalRes['id_absensi']."'"
                    );

                    if ($disable->execute()) {

                        $msg = "Berhasil dibuat";
                        $json = json_encode($msg);
                        echo $json;
                        return true;
                    } 
                }

            } else {
                //buat pertemuan baru 1
                $new = $this->db->prepare(
                    "INSERT INTO tbabsensi (nama_absensi, id_jadwal, tgl_buat, status) 
                    VALUES ('Pertemuan 1', '{$id_jadwal}', NOW(), '1')"
                );

                if ($new->execute()) {

                    $msg = "Berhasil dibuat";
                    $json = json_encode($msg);
                    echo $json;
                    return true;
                }
            }
        }
        // public function jadwalAPIS()
        // {
        //     $output = array();
        //     $statement = $this->db->prepare(
        //         "SELECT * FROM tbjatwalkuliah"
        //     );
        //     $statement->execute();
        //     //$result = $statement->fetchAll();
        //     if($statement->rowCount()>0) {
        //         while($row[]=$statement->fetch(PDO::FETCH_ASSOC)) {
        //             $tem = $row;
        //             $json = json_encode($tem);
        //         }
        //     }
        //     echo $json;
            
        // }

        public function isAdminLoggedIn(){
            // Apakah user_session sudah ada di session
            if(isset($_SESSION['user_session']))
            {
                if($_SESSION['user_role'] == 'admin') 
                {
                    return true;
                }
            }
        }

        public function cekLogin() {

            if(!self::isAdminLoggedIn()){
                header("location: adm_login.php");
            }
        }

        // Ambil data admin yang sudah login
        public function getAdmin(){
            // Cek apakah sudah login
            if(!$this->isAdminLoggedIn()){
                return false;
            }

            try {
                // Ambil data Pengurus dari database
                $query = $this->db->prepare("SELECT * FROM tbl_admin WHERE id_admin = :id");
                $query->bindParam(":id", $_SESSION['user_session']);
                $query->execute();
                return $query->fetch();
            } catch (PDOException $e) {
                echo $e->getMessage();
                return false;
            }
        }

        public function hapusData($table, $fnme, $id) {
            $stmt = $this->db->prepare("DELETE FROM {$table} WHERE {$fnme}=:id");
            $stmt->bindparam(":id",$id);
            $stmt->execute();
            return true;
        }

        public function total_records($table)
		{
			 //include('../class/DBConnect.php');
			 $statement = $this->db->prepare("SELECT * FROM {$table}");
			 $statement->execute();
			 $result = $statement->fetchAll();
			 return $statement->rowCount();
		}

		public function dsn_fetch_single($id)
		{
			$output = array();
			$statement = $this->db->prepare(
				"SELECT * FROM tbdosen 
				WHERE nidn = '".$id."' 
				LIMIT 1"
			);
			$statement->execute();
			$result = $statement->fetchAll();
			foreach($result as $row)
			{
				$output["nidn"] = $row["nidn"];
				$output["nmdos"] = $row["nmdos"];
                $output["gender"] = $row["jk"];
				$output["unit_kerja"] = $row["unit_kerja"];
			}
			echo json_encode($output);
		}

        public function mhs_fetch_single($id)
        {
            $output = array();
            $statement = $this->db->prepare(
                "SELECT * FROM tbmahasiswa INNER JOIN tbfakultas INNER JOIN tbprodi ON (tbmahasiswa.fakultas=tbfakultas.kd_fak) AND (tbmahasiswa.kd_prodi=tbprodi.kd_prodi) WHERE npm = '".$id."' LIMIT 1"
            );
            $statement->execute();
            $result = $statement->fetchAll();
            foreach($result as $row)
            {
                $output["npm"] = $row["npm"];
                $output["nm_mhs"] = $row["nm_mhs"];
                $output["gender"] = $row["jk"];
                $output["kd_fak"] = $row["kd_fak"];
                $output["kd_prodi"] = $row["kd_prodi"];
            }
            echo json_encode($output);
        }

        public function mkul_fetch_single($id)
        {
            $output = array();
            $statement = $this->db->prepare(
                "SELECT * FROM tbmatakuliah 
                WHERE kd_matkul = '".$id."' 
                LIMIT 1"
            );
            $statement->execute();
            $result = $statement->fetchAll();
            foreach($result as $row)
            {
                $output["kd_matkul"] = $row["kd_matkul"];
                $output["nm_matkul"] = $row["nm_matkul"];
                $output["sks"] = $row["sks"];
                $output["semester"] = $row["semester"];
                $output["kurikulum"] = $row["kurikulum"];
            }
            echo json_encode($output);
        }

        public function ta_fetch_single($id)
        {
            $output = array();
            $statement = $this->db->prepare(
                "SELECT * FROM tbtahun_ajaran 
                WHERE id_ta = '".$id."' 
                LIMIT 1"
            );
            $statement->execute();
            $result = $statement->fetchAll();
            foreach($result as $row)
            {
                $output["sem"] = $row["semester"];
                $output["t_a"] = $row["tahun_ajaran"];
            }
            echo json_encode($output);
        }

        public function jk_fetch_single($id)
        {
            $output = array();
            $statement = $this->db->prepare(
                "SELECT * FROM tbjatwalkuliah 
                WHERE id = '".$id."' 
                LIMIT 1"
            );
            $statement->execute();
            $result = $statement->fetchAll();
            foreach($result as $row)
            {
                $output["id_jk"] = $row["id"];
                $output["t_a"] = $row["thn_ajaran"];
                $output["k_m"] = $row["kd_matkul"];
                $output["hr"] = $row["hari"];
                $output["k_j"] = $row["kd_jam"];
                $output["rg"] = $row["ruang"];
                $output["ds"] = $row["dosen"];
                $output["pr"] = $row["prodi"];
                $output["kl"] = $row["kelas"];

            }
            echo json_encode($output);
        }

        public function abs_fetch_single($id)
        {
            $output = array();
            $statement = $this->db->prepare(
                "SELECT * FROM tbabsensi 
                WHERE id_absensi = '".$id."' 
                LIMIT 1"
            );
            $statement->execute();
            $result = $statement->fetchAll();
            foreach($result as $row)
            {
                $output["nama_abs"] = $row["nama_absensi"];
            }
            echo json_encode($output);
        }

        public function getData($table) {

            try {
                // Ambil data kategori dari database
                $query = $this->db->prepare("SELECT * FROM {$table}");
                $query->execute();
                return $query->fetchAll();
            } catch (PDOException $e) {
                echo $e->getMessage();
                return false;
            }
        }

        public function getDataByID($table, $field, $id) {

            $stmt = $this->db->prepare("SELECT * FROM {$table} WHERE {$field}=:id");
            $stmt->execute(array(":id"=>$id));
            $editRow=$stmt->fetch(PDO::FETCH_ASSOC);
            return $editRow;
        }

        public function logout(){
            // Hapus session
            session_destroy();
            // Hapus user_session
            unset($_SESSION['user_session']);
            return true;
        }
    }
?>