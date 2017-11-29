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
		<h3 align="center">Data Dosen</h3>
		<div class="table-responsive">
		    <div align="right">
		     <button type="button" id="add_button" data-toggle="modal" data-target="#userModal" class="btn btn-info btn-sm">Add</button>
		    </div>
		    <br />
		    <table id="user_data" class="table table-bordered table-striped">
		     <thead>
		      <tr>
		       <th width="12%">No Induk</th>
		       <th width="33%">Nama Dosen</th>
		       <th width="10%">J.K</th>
		       <th width="25%">Unit Kerja</th>
		       <th width="10%">Edit</th>
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
     <h4 class="modal-title">Add User</h4>
    </div>
    <div class="modal-body">
     <label>No Induk</label>
     <input type="text" name="nidn" id="nidn" class="form-control" required/>
     <br />
     <label>Nama Dosen</label>
     <input type="text" name="nmdos" id="nmdos" class="form-control" required/>
     <br />
     <label>Jenis Kelamin</label>
     <br />
     <input type="radio" name="jk" id="jk" value="L" required/>
     Laki - laki
     <input type="radio" name="jk" id="jk" value="P" required/>
     Perempuan
     <br /><br />
     <label>Unit Kerja</label>
     <select class="form-control" name="unit_kerja" id="unit_kerja" required>
          <option></option>
          <option value="Fakultas Ilmu Komputer">Fakultas Ilmu Komputer</option>
          <option value="Fakultas Hukum">Fakultas Hukum</option>
          <option value="Fakultas Ekonomi">Fakultas Ekonomi</option>
          <option value="Fakultas Pertanian">Fakultas Pertanian</option>
          <option value="Fakultas Keguruan dan Pendidikan">Fakultas Keguruan dan Pendidikan</option>
          <option value="Fakultas Teknik">Fakultas Teknik</option>
          <option value="Fakultas Sastra">Fakultas Sastra</option>
        </select>
     <br />
    </div>
    <div class="modal-footer">
     <input type="hidden" name="user_id" id="user_id" />
     <input type="hidden" name="operation" id="operation" />
     <input type="hidden" name="table" id="table" value="tbdosen"/>
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
  $('.modal-title').text("Add Dosen");
  $('#action').val("Add");
  $('#operation').val("Add");
  $('#user_uploaded_image').html('');
 });
 var op_id = 'dosen';
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
  var nidn = $('#nidn').val();
  var nmdos = $('#nmdos').val();
  var jk = $('#jk').val();
  var unit_kerja = $('#unit_kerja').val();

  if(nidn != '' && nmdos != '' && jk != '' && unit_kerja != '')
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
  var table = 'tbdosen';
  $.ajax({
   url:"fetch_single.php",
   method:"POST",
   data:{user_id:user_id,table:table},
   dataType:"json",
   success:function(data)
   {
    $('#userModal').modal('show');
    $('#nidn').val(data.nidn).attr('readonly', 'readonly');
    $('#nmdos').val(data.nmdos);
    $("input[name=jk][value=" + data.gender + "]").attr('checked', 'checked');
    $('#unit_kerja').val(data.unit_kerja).change();
    $('.modal-title').text("Edit User");
    $('#user_id').val(user_id);
    $('#action').val("Edit");
    $('#operation').val("Edit");
   }
  })
 });
 
 $(document).on('click', '.delete', function(){
  var user_id = $(this).attr("id");
  var tbl = 'tbdosen';
  var fnme = 'nidn';
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
    $('#nidn').attr('readonly', false);
});
</script>
<?php
	include "adm_footer.php";
?>