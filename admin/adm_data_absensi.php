<?php  
  
    require_once "../class/Admin.php";
    require_once "../class/DBConnect.php";


  	$admin = new Admin($db);
  	$datas = $admin->getAdmin();

  	$admin->cekLogin();

    if(isset($_REQUEST['id'])) {
      $id_jadwal = $_REQUEST['id'];
    }

?>
<?php
	include "adm_header.php";
	include "adm_sidebar.php";
?>

<div class="col-md-10">
	<div class="profile-content">
		<h3 align="center">Data Absensi</h3>
		<div class="table-responsive">
		    <div align="right">
		     <button type="button" id="add_button" data-toggle="modal" data-target="#userModal" class="btn btn-info btn-sm">Add</button>
		    </div>
		    <br />
		    <table id="user_data" class="table table-bordered table-striped">
		     <thead>
		      <tr>
		       <th width="25%">Absensi</th>
		       <th width="20%">Dosen</th>
           <th width="20%">Mata Kuliah</th>
           <th width="14%">Tanggal</th>
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
     <h4 class="modal-title">Add Absensi</h4>
    </div>
    <div class="modal-body">
     <label>Judul Absensi</label>
     <!-- <input type="text" name="nama_abs" id="nama_abs" class="form-control" required/> -->
     <select name="nama_abs" id="nama_abs" class="form-control" required>
      <option></option>
      <option value="Pertemuan 1">Pertemuan 1</option>
      <option value="Pertemuan 2">Pertemuan 2</option>
      <option value="Pertemuan 3">Pertemuan 3</option>
      <option value="Pertemuan 4">Pertemuan 4</option>
      <option value="Pertemuan 5">Pertemuan 5</option>
      <option value="Pertemuan 6">Pertemuan 6</option>
      <option value="Pertemuan 7">Pertemuan 7</option>
      <option value="Pertemuan 8">Pertemuan 8</option>
      <option value="Pertemuan 9">Pertemuan 9</option>
      <option value="Pertemuan 10">Pertemuan 10</option>
      <option value="Pertemuan 11">Pertemuan 11</option>
      <option value="Pertemuan 12">Pertemuan 12</option>
      <option value="Pertemuan 13">Pertemuan 13</option>
      <option value="Pertemuan 14">Pertemuan 14</option>
      <option value="Pertemuan 15">Pertemuan 15</option>
      <option value="Pertemuan 16">Pertemuan 16</option>
      <option value="Pertemuan 17">Pertemuan 17</option>
      <option value="Pertemuan 18">Pertemuan 18</option>
      <option value="Pertemuan 19">Pertemuan 19</option>
      <option value="Pertemuan 20">Pertemuan 20</option>
      <option value="Pertemuan 21">Pertemuan 21</option>
      <option value="Pertemuan 22">Pertemuan 22</option>
      <option value="Pertemuan 23">Pertemuan 23</option>
      <option value="Pertemuan 24">Pertemuan 24</option>
      <option value="Pertemuan 25">Pertemuan 25</option>
      <option value="Pertemuan 26">Pertemuan 26</option>
      <option value="Pertemuan 27">Pertemuan 27</option>
      <option value="Pertemuan 28">Pertemuan 28</option>
     </select>
     <input type="hidden" name="id_jadwal" id="id_jadwal" value="<?php echo $id_jadwal; ?>"/>
     <br />
    </div>
    <div class="modal-footer">
      <input type="hidden" name="user_id" id="user_id" />
      <input type="hidden" name="operation" id="operation" />
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
  $('.modal-title').text("Add Absensi");
  $('#action').val("Add");
  $('#operation').val("Add");
 });
 var op_id = 'absensi';
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
  var nama_abs = $('#nama_abs').val();
  var id_jadwal = $('#id_jadwal').val();

  if(nama_abs != '' && id_jadwal != '')
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
  var table = 'tbabsensi';
  $.ajax({
   url:"fetch_single.php",
   method:"POST",
   data:{user_id:user_id,table:table},
   dataType:"json",
   success:function(data)
   {
    $('#userModal').modal('show');
    $('#nama_abs').val(data.nama_abs).change();
    $('.modal-title').text("Edit Jadwal Kuliah");
    $('#user_id').val(user_id);
    $('#action').val("Edit");
    $('#operation').val("Edit");
   }
  })
 });
 
 $(document).on('click', '.delete', function(){
  var user_id = $(this).attr("id");
  var tbl = 'tbabsensi';
  var fnme = 'id_absensi';
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