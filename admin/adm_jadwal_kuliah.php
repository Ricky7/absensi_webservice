<?php  
  
    require_once "../class/Admin.php";
    require_once "../class/DBConnect.php";


  	$admin = new Admin($db);
  	$datas = $admin->getAdmin();

    $prodi_data = $admin->getData('tbprodi');
    $thn_ajar = $admin->getData('tbtahun_ajaran');
    $matkul = $admin->getData('tbmatakuliah');
    $jam = $admin->getData('tbjam');
    $dosen = $admin->getData('tbdosen');

  	$admin->cekLogin();

?>
<?php
	include "adm_header.php";
	include "adm_sidebar.php";
?>

<div class="col-md-10">
	<div class="profile-content">
		<h3 align="center">Data Jadwal Kuliah</h3>
		<div class="table-responsive">
		    <div align="right">
		     <button type="button" id="add_button" data-toggle="modal" data-target="#userModal" class="btn btn-info btn-sm">Add</button>
		    </div>
		    <br />
		    <table id="user_data" class="table table-bordered table-striped">
		     <thead>
		      <tr>
           <th width="8%">ID</th>
		       <th width="5%">Hari</th>
		       <th width="4%">Jam</th>
		       <th width="25%">Mata Kuliah</th>
           <th width="6%">Ruang</th>
           <th width="18%">Kelas</th>
           <th width="10%">Dosen</th>
           <th width="5%">Sem</th>
           <th width="7%">Opsi</th>
		       <th width="7%">Edit</th>
		       <th width="7%">Delete</th>
		      </tr>
		     </thead>
		    </table>
		</div>
	</div>
</div>

<div id="userModal" class="modal fade">
 <div class="modal-dialog">
  <form method="post" id="user_form" enctype="multipart/form-data">
   <div class="modal-content">
    <div class="modal-header">
     <button type="button" class="close" data-dismiss="modal">&times;</button>
     <h4 class="modal-title">Add Jadwal Kuliah</h4>
    </div>
    <div class="modal-body">
     <label>Tahun Ajaran</label>
        <select class="form-control" name="ta" id="ta" required>
          <option></option>
          <?php foreach ($thn_ajar as $value): ?>
          <?php
            if($value['semester'] == 1) { $th = 'Ganjil'; }
              else if ($value['semester'] == 2) { $th = 'Genap'; }
          ?>
            <option value="<?php echo $value['id_ta']; ?>"><?php echo $value['tahun_ajaran'].' Semester '.$th; ?></option>
          <?php endforeach; ?>
        </select>
     <br />
     <label>Mata Kuliah</label>
        <select class="form-control" name="matkul" id="matkul" required>
          <option></option>
          <?php foreach ($matkul as $value): ?>
            <option value="<?php echo $value['kd_matkul']; ?>"><?php echo $value['nm_matkul']; ?></option>
          <?php endforeach; ?>
        </select>
     <br />
     <label>Hari</label>
        <select class="form-control" name="hari" id="hari" required>
          <option></option>
          <option value="1">Senin</option>
          <option value="2">Selasa</option>
          <option value="3">Rabu</option>
          <option value="4">Kamis</option>
          <option value="5">Jumat</option>
        </select>
     <br />
     <label>Jam</label>
        <select class="form-control" name="jam" id="jam" required>
          <option></option>
          <?php foreach ($jam as $value): ?>
            <option value="<?php echo $value['kd_jam']; ?>"><?php echo $value['jam'].' - '.$value['end']; ?></option>
          <?php endforeach; ?>
        </select>
     <br />
     <label>Ruang</label>
     <select class="form-control" name="ruang" id="ruang" required>
          <option></option>
          <option value="1/1">Kelas 1/1</option>
          <option value="1/2">Kelas 1/2</option>
          <option value="1/3">Kelas 1/3</option>
          <option value="1/4">Kelas 1/4</option>
          <option value="1/5">Kelas 1/5</option>
          <option value="1/6">Kelas 1/6</option>
          <option value="1/7">Kelas 1/7</option>
          <option value="1/8">Kelas 1/8</option>
          <option value="1/9">Kelas 1/9</option>
          <option value="1/10">Kelas 1/10</option>
          <option value="2/1">Kelas 2/1</option>
          <option value="2/2">Kelas 2/2</option>
          <option value="2/3">Kelas 2/3</option>
          <option value="2/4">Kelas 2/4</option>
          <option value="2/5">Kelas 2/5</option>
          <option value="2/6">Kelas 2/6</option>
          <option value="2/7">Kelas 2/7</option>
          <option value="2/8">Kelas 2/8</option>
          <option value="2/9">Kelas 2/9</option>
          <option value="2/10">Kelas 2/10</option>
          <option value="3/1">Kelas 3/1</option>
          <option value="3/2">Kelas 3/2</option>
          <option value="3/3">Kelas 3/3</option>
          <option value="3/4">Kelas 3/4</option>
          <option value="3/5">Kelas 3/5</option>
          <option value="3/6">Kelas 3/6</option>
          <option value="3/7">Kelas 3/7</option>
          <option value="3/8">Kelas 3/8</option>
          <option value="3/9">Kelas 3/9</option>
          <option value="3/10">Kelas 3/10</option>
          <option value="A">Lab A</option>
          <option value="B">Lab B</option>
          <option value="C">Lab C</option>
          <option value="D">Lab D</option>
          <option value="E">Lab E</option>
          <option value="F">Lab F</option>
          <option value="G">Lab G</option>
          <option value="H">Lab H</option>
          <option value="I">Lab I</option>
          <option value="J">Lab J</option>
          <option value="K">Lab K</option>
          <option value="L">Lab L</option>
          <option value="M">Lab M</option>
          <option value="N">Lab N</option>
          <option value="O">Lab O</option>
          <option value="P">Lab P</option>
          <option value="Q">Lab Q</option>
          <option value="R">Lab R</option>
          <option value="S">Lab S</option>
          <option value="T">Lab T</option>
          <option value="U">Lab U</option>
          <option value="V">Lab V</option>
          <option value="W">Lab W</option>
          <option value="X">Lab X</option>
          <option value="Y">Lab Y</option>
          <option value="Z">Lab Z</option>
        </select>
     <br />
     <label>Dosen Pengajar</label>
        <select class="form-control" name="dosen" id="dosen" required>
          <option></option>
          <?php foreach ($dosen as $value): ?>
            <option value="<?php echo $value['nidn']; ?>"><?php echo $value['nmdos']; ?></option>
          <?php endforeach; ?>
        </select>
     <br />
     <label>Program Studi</label>
      <select class="form-control" name="prodi" id="prodi" required>
        <option></option>
        <?php foreach ($prodi_data as $value): ?>
          <option value="<?php echo $value['kd_prodi']; ?>"><?php echo $value['nm_prodi']; ?></option>
        <?php endforeach; ?>
      </select>
      <br />
      <label>Kelas</label>
        <select class="form-control" name="kelas" id="kelas" required>
          <option></option>
          <option value="A">A</option>
          <option value="B">B</option>
          <option value="C">C</option>
          <option value="D">D</option>
          <option value="E">E</option>
          <option value="F">F</option>
          <option value="G">G</option>
          <option value="H">H</option>
          <option value="I">I</option>
          <option value="J">J</option>
          <option value="K">K</option>
          <option value="L">L</option>
          <option value="M">M</option>
        </select>
     <br />
    </div>
    <div class="modal-footer">
     <input type="hidden" name="user_id" id="user_id" />
     <input type="hidden" name="operation" id="operation" />
     <input type="hidden" name="table" id="table" value="tbjatwalkuliah"/>
     <input type="submit" name="action" id="action" class="btn btn-success" value="Add" />
     <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
    </div>
   </div>
  </form>
 </div>
</div>

<div id="absenModal" class="modal fade">
 <div class="modal-dialog">
  <form method="post" id="absen_form" enctype="multipart/form-data">
   <div class="modal-content">
    <div class="modal-header">
     <button type="button" class="close" data-dismiss="modal">&times;</button>
     <h4 class="modal-title">Add Absensi</h4>
    </div>
    <div class="modal-body">
     <label>Judul Absensi</label>
     <input type="text" name="judul" id="judul" class="form-control" required/>
     <input type="hidden" name="id_jadwal" id="id_jadwal" value=""/>
     <br />
    </div>
    <div class="modal-footer">
      <input type="hidden" name="table" id="table" value="tbabsensi"/>
     <input type="submit" name="action" id="action" class="btn btn-success" value="Add" />
     <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
    </div>
   </div>
  </form>
 </div>
</div>

<script type="text/javascript" language="javascript" >
$(document).ready(function(){
 $('#add_button').click(function(){
  $('#user_form')[0].reset();
  $('.modal-title').text("Add Tahun Ajaran");
  $('#action').val("Add");
  $('#operation').val("Add");
 });
 var op_id = 'jadwal';
 var dataTable = $('#user_data').DataTable({
  "processing":true,
  "serverSide":true,
  "order":[],
  "ajax":{
   url:"fetch.php",
   type:"POST",
   data:{op_id:op_id},
   dataType:"json"
  },
  "columnDefs":[
   {
    "targets":[0, 3, 4],
    "orderable":false,
   },
  ],

 });

 $(document).on('submit', '#user_form', function(event){
  event.preventDefault();
  var t_a = $('#t_a').val();
  var sem = $('#sem').val();

  if(t_a != '' && sem != '')
  {
   $.ajax({
    url:"insert.php",
    method:'POST',
    data:new FormData(this),
    contentType:false,
    processData:false,
    success:function(data)
    {
     alert(data);
     $('#user_form')[0].reset();
     $('#userModal').modal('hide');
     dataTable.ajax.reload();
    }
   });
  }
  else
  {
   alert("Salah satu form tidak diisi!");
  }
 });
 
 $(document).on('click', '.update', function(){
  var user_id = $(this).attr("id");
  var table = 'tbjatwalkuliah';
  $.ajax({
   url:"fetch_single.php",
   method:"POST",
   data:{user_id:user_id,table:table},
   dataType:"json",
   success:function(data)
   {
    $('#userModal').modal('show');
    //$('#id_jdwl').val(data.id_jk);
    $('#ta').val(data.t_a).change();
    $('#matkul').val(data.k_m).change();
    $('#hari').val(data.hr).change();
    $('#jam').val(data.k_j).change();
    $('#ruang').val(data.rg).change();
    $('#dosen').val(data.ds).change();
    $('#prodi').val(data.pr).change();
    $('#kelas').val(data.kl).change();
    $('.modal-title').text("Edit Jadwal Kuliah");
    $('#user_id').val(user_id);
    $('#action').val("Edit");
    $('#operation').val("Edit");
   }
  })
 });
 
 $(document).on('click', '.delete', function(){
  var user_id = $(this).attr("id");
  var tbl = 'tbjatwalkuliah';
  var fnme = 'id';
  if(confirm("Penghapusan Data, Yakin?"))
  {
   $.ajax({
    url:"adm_delete.php",
    method:"POST",
    data:{user_id:user_id,tbl:tbl,fnme:fnme},
    success:function(data)
    {
     alert(data);
     dataTable.ajax.reload();
    }
   });
  }
  else
  {
   return false; 
  }
 });

 // $(document).on('click', '.open', function(){
 //  var jadwal_id = $(this).attr("id");
 //  $('#absenModal').modal('show');
 //  $('#id_jadwal').val(jadwal_id);
 // });

 // $(document).on('submit', '#absen_form', function(event){
 //  event.preventDefault();
 //  var judul = $('#judul').val();
 //  var id_jadwal = $('#id_jadwal').val();

 //  if(judul != '' && id_jadwal != '')
 //  {
 //   $.ajax({
 //    url:"insert.php",
 //    method:'POST',
 //    data:new FormData(this),
 //    contentType:false,
 //    processData:false,
 //    success:function(data)
 //    {
 //     alert(data);
 //     $('#absen_form')[0].reset();
 //     $('#absenModal').modal('hide');
 //     dataTable.ajax.reload();
 //    }
 //   });
 //  }
 //  else
 //  {
 //   alert("Salah satu form tidak diisi!");
 //  }
 // });
});

$('#userModal').on('hidden.bs.modal', function (e) {
    $("input[name=sks]").attr('checked', false);
});
</script>
<?php
	include "adm_footer.php";
?>