<?php  
  
    require_once "../class/Admin.php";
    require_once "../class/DBConnect.php";


  	$admin = new Admin($db);
  	$datas = $admin->getAdmin();

    $fak_data = $admin->getData('tbfakultas');
    $prodi_data = $admin->getData('tbprodi');

  	$admin->cekLogin();

?>
<?php
	include "adm_header.php";
	include "adm_sidebar.php";
?>

<div class="col-md-10">
	<div class="profile-content">
		<h3 align="center">Data Mahasiswa</h3>
		<div class="table-responsive">
		    <div align="right">
		     <button type="button" id="add_button" data-toggle="modal" data-target="#userModal" class="btn btn-info btn-sm">Add</button>
		    </div>
		    <br />
		    <table id="user_data" class="table table-bordered table-striped">
		     <thead>
		      <tr>
		       <th width="10%">No Induk</th>
		       <th width="30%">Nama Mahasiswa</th>
		       <th width="4%">J.K</th>
		       <th width="20%">Fakultas</th>
           <th width="20%">Prodi</th>
		       <th width="8%">Edit</th>
		       <th width="8%">Delete</th>
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
     <label>No Induk</label>
     <input type="text" name="npm" id="npm" class="form-control" required/>
     <br />
     <label>Nama Mahasiswa</label>
     <input type="text" name="nm_mhs" id="nm_mhs" class="form-control" required/>
     <br />
     <label>Jenis Kelamin</label>
     <br />
     <input type="radio" name="jk" id="jk" value="L" required/>
     Laki - laki
     <input type="radio" name="jk" id="jk" value="P" required/>
     Perempuan
     <br /><br />
     <label>Fakultas</label>
      <select class="form-control" name="fak" id="fak" required>
        <option></option>
        <?php foreach ($fak_data as $value): ?>
          <option value="<?php echo $value['kd_fak']; ?>"><?php echo $value['nm_fak']; ?></option>
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
    </div>
    <div class="modal-footer">
     <input type="hidden" name="user_id" id="user_id" />
     <input type="hidden" name="operation" id="operation" />
     <input type="hidden" name="table" id="table" value="tbmahasiswa"/>
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
 var op_id = 'mhs';
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
  var npm = $('#npm').val();
  var nm_mhs = $('#nm_mhs').val();
  var jk = $('#jk').val();
  var fak = $('#fak').val();
  var prodi = $('#prodi').val();
  //var table = 'tbmahasiswa';

  if(npm != '' && nm_mhs != '' && jk != '' && fak != '' && prodi != '')
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
  var table = 'tbmahasiswa';
  $.ajax({
   url:"fetch_single.php",
   method:"POST",
   data:{user_id:user_id,table:table},
   dataType:"json",
   success:function(data)
   {
    $('#userModal').modal('show');
    $('#npm').val(data.npm).attr('readonly', 'readonly');
    $('#nm_mhs').val(data.nm_mhs);
    $("input[name=jk][value=" + data.gender + "]").attr('checked', 'checked');
    $("#fak").val(data.kd_fak).change();
    $("#prodi").val(data.kd_prodi).change();
    $('.modal-title').text("Edit Mahasiswa");
    $('#user_id').val(user_id);
    $('#action').val("Edit");
    $('#operation').val("Edit");
   }
  })
 });
 
 $(document).on('click', '.delete', function(){
  var user_id = $(this).attr("id");
  var tbl = 'tbmahasiswa';
  var fnme = 'npm';
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
    $('#npm').attr('readonly', false);
});
</script>
<?php
	include "adm_footer.php";
?>