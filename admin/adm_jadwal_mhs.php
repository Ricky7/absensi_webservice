<?php  
  
    require_once "../class/Admin.php";
    require_once "../class/DBConnect.php";


  	$admin = new Admin($db);
  	$datas = $admin->getAdmin();

  	$admin->cekLogin();

    if(isset($_REQUEST['id'])) {
      $id_jadwal = $_REQUEST['id'];
    }

    $mhs = $admin->getData('tbmahasiswa');
    $jadwal = $admin->getDataByID('tbjatwalkuliah', 'id', $id_jadwal);
    $matkul = $admin->getDataByID('tbmatakuliah', 'kd_matkul', $jadwal['kd_matkul']);
    $dosen = $admin->getDataByID('tbdosen', 'nidn', $jadwal['dosen']);

?>
<?php
	include "adm_header.php";
	include "adm_sidebar.php";
?>

<div class="col-md-10">
	<div class="profile-content">
		<h3 align="center">Data Mahasiswa <font color="blue"><?php echo $matkul['nm_matkul'] ?></font></h3>
    <br />
    <h5><?php echo $dosen['nmdos'] ?></h5>
		<div class="table-responsive">
		    <div align="right">
		     <button type="button" id="add_button" data-toggle="modal" data-target="#userModal" class="btn btn-info btn-sm">Add</button>
		    </div>
		    <br />
		    <table id="user_data" class="table table-bordered table-striped">
		     <thead>
		      <tr>
		       <th width="20%">No Induk</th>
		       <th width="40%">Nama Mahasiswa</th>
		       <th width="10%">Hadir</th>
           <th width="10%">Ijin</th>
		       <th width="10%">Sakit</th>
           <th width="10%">Delete</th>
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
     <h4 class="modal-title">Add Mahasiswa</h4>
    </div>
    <div class="modal-body">
    <input type="hidden" name="id_jadwal" id="id_jadwal" value="<?php echo $id_jadwal; ?>"/>
    <br />
     <label>Mahasiswa</label>
        <select class="form-control" name="id_mhs" id="id_mhs" required>
          <option></option>
          <?php foreach ($mhs as $value): ?>
            <option value="<?php echo $value['npm']; ?>"><?php echo $value['nm_mhs']; ?></option>
          <?php endforeach; ?>
        </select>
     <br />
    </div>
    <div class="modal-footer">
     <input type="hidden" name="user_id" id="user_id" />
     <input type="hidden" name="operation" id="operation" />
     <input type="hidden" name="table" id="table" value="tbjadwalxmhs"/>
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
  $('.modal-title').text("Add Mahasiswa");
  $('#action').val("Add");
  $('#operation').val("Add");
 });
 var op_id = 't_jadxmhs';
 var id_jadwal = "<?php echo $id_jadwal; ?>";
 var dataTable = $('#user_data').DataTable({
  "processing":true,
  "serverSide":true,
  "order":[],
  "ajax":{
   url:"fetch.php",
   type:"POST",
   data:{op_id:op_id,id_jadwal:id_jadwal},
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
  var table = 'tbtahun_ajaran';
  $.ajax({
   url:"fetch_single.php",
   method:"POST",
   data:{user_id:user_id,table:table},
   dataType:"json",
   success:function(data)
   {
    $('#userModal').modal('show');
    $('#t_a').val(data.t_a);
    $('#sem').val(data.sem).change();
    $('.modal-title').text("Edit Tahun Ajaran");
    $('#user_id').val(user_id);
    $('#action').val("Edit");
    $('#operation').val("Edit");
   }
  })
 });
 
 $(document).on('click', '.delete', function(){
  var user_id = $(this).attr("id");
  var tbl = 'tbjadwalxmhs';
  var fnme = 'id_jdm';
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
});

$('#userModal').on('hidden.bs.modal', function (e) {
    $("input[name=sks]").attr('checked', false);
});
</script>
<?php
	include "adm_footer.php";
?>