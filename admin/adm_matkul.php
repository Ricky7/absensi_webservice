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
		<h3 align="center">Data Mata Kuliah</h3>
		<div class="table-responsive">
		    <div align="right">
		     <button type="button" id="add_button" data-toggle="modal" data-target="#userModal" class="btn btn-info btn-sm">Add</button>
		    </div>
		    <br />
		    <table id="user_data" class="table table-bordered table-striped">
		     <thead>
		      <tr>
		       <th width="15%">Kode Matkul</th>
		       <th width="35%">Nama MataKuliah</th>
		       <th width="4%">Sks</th>
		       <th width="15%">Semester</th>
           <th width="15%">Kurikulum</th>
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
     <h4 class="modal-title">Add Mata Kuliah</h4>
    </div>
    <div class="modal-body">
     <label>Kode Mata Kuliah</label>
     <input type="text" name="kd_matkul" id="kd_matkul" class="form-control" required/>
     <br />
     <label>Nama Mata Kuliah</label>
     <input type="text" name="nm_matkul" id="nm_matkul" class="form-control" required/>
     <br />
     <label>Sks</label>
     <br />
     <input type="radio" name="sks" id="sks" value="1" required/>
     1 Sks
     <input type="radio" name="sks" id="sks" value="2" required/>
     2 Sks
     <input type="radio" name="sks" id="sks" value="3" required/>
     3 Sks
     <input type="radio" name="sks" id="sks" value="4" required/>
     4 Sks
     <br /><br />
     <label>Semester</label>
        <select class="form-control" name="sem" id="sem" required>
          <option></option>
          <option value="1">Semester 1</option>
          <option value="2">Semester 2</option>
          <option value="3">Semester 3</option>
          <option value="4">Semester 4</option>
          <option value="5">Semester 5</option>
          <option value="6">Semester 6</option>
          <option value="7">Semester 7</option>
          <option value="8">Semester 8</option>
        </select>
     <br />
     <label>Kurikulum</label>
        <select class="form-control" name="kur" id="kur" required>
          <option></option>
          <option value="2013">2013</option>
          <option value="2014">2014</option>
          <option value="2015">2015</option>
          <option value="2016">2016</option>
          <option value="2017">2017</option>
          <option value="2018">2018</option>
          <option value="2019">2019</option>
          <option value="2020">2020</option>
          <option value="2021">2021</option>
          <option value="2022">2022</option>
        </select>
     <br />
    </div>
    <div class="modal-footer">
     <input type="hidden" name="user_id" id="user_id" />
     <input type="hidden" name="operation" id="operation" />
     <input type="hidden" name="table" id="table" value="tbmatakuliah"/>
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
  $('.modal-title').text("Add Mata kuliah");
  $('#action').val("Add");
  $('#operation').val("Add");
 });
 var op_id = 'matkul';
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
  var table = 'tbmatakuliah';
  $.ajax({
   url:"fetch_single.php",
   method:"POST",
   data:{user_id:user_id,table:table},
   dataType:"json",
   success:function(data)
   {
    $('#userModal').modal('show');
    $('#kd_matkul').val(data.kd_matkul).attr('readonly', 'readonly');;
    $('#nm_matkul').val(data.nm_matkul);
    $("input[name=sks][value=" + data.sks + "]").attr('checked', 'checked');
    $("#sem").val(data.semester).change();
    $("#kur").val(data.kurikulum).change();
    $('.modal-title').text("Edit Mata Kuliah");
    $('#user_id').val(user_id);
    $('#action').val("Edit");
    $('#operation').val("Edit");
   }
  })
 });
 
 $(document).on('click', '.delete', function(){
  var user_id = $(this).attr("id");
  var tbl = 'tbmatakuliah';
  var fnme = 'kd_matkul';
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
    $('#kd_matkul').attr('readonly', false);
});
</script>
<?php
	include "adm_footer.php";
?>