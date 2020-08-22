<?php
include ('../connect.php');
$id = $_GET["id"]
?>

<!-- --------------------------------------------Section 2-------------------------------------------- -->

<div id="data-new"> 	
	<div class="row">
		<div class="col-md-8">
		<div class="card mt-2" style="">  
			<div class="card-header">
			    <center>
			        <h2 class="card-title bg-info">Add Object</h2>
			    </center>
			</div> 
			<div class="card-body">

				<div class="form-group row">
					<input type="text" name="id_package" id="id_package" value="<?php echo $id ?>" hidden>
				    <label class="col-form-label col-sm-2 ml-3">District</label>
				    <div class="col-lg-8">                
				        <select class="form-control" id="district" onchange="cariObjek()">
				          <option value="0">Choose District</option>
				      <?php
				        $sql = mysqli_query($conn, "SELECT id_district, name FROM district");		                            
				        while($data =  mysqli_fetch_array($sql)){
				          $iddisc = $data['id_district'];
				          $named = $data['name'];

				        

				       echo "<option value=\"$iddisc\">$named</option>";} 
				       ?>
				        </select>

				    </div>
				</div>

				<div class="form-group row">
				    <label class="col-form-label col-sm-2 ml-3">Object</label>
				    <div class="col-xl-8">                
				        <select class="form-control" id="objek" onchange="cariObjek()">
				        	<option value="0">Choose Object</option>
				            <option value="1">Souvenir</option>
				            <option value="2">Mosque</option>
				            <option value="3">Restaurant</option>
				            <option value="4">Tourism</option>
				            <option value="5">Hotel</option>
				        </select>

				    </div>
				</div>

				<div class="form-group row">
				    <label class="col-form-label col-sm-2 ml-3">Choose Place</label>
				    <div class="col-lg-8">                
				        <select class="form-control" id="cariObjek">

				        </select>

				    </div>
				</div>
				<div class="form-group form-group-float">
					<label class="form-group-float-label">Lama Perjalanan</label>
					  	<input type="text" id="time" name="time" id="time" class="form-control" placeholder="Lama perjalana dari asal">
				</div>	
				<div class="form-group form-group-float">
					<label class="form-group-float-label">Estimated Hour</label>
					  	<input type="text" id="estimated" name="estimated" id="estimated" class="form-control" placeholder="Berada di sini xx menit">
				</div>	
			</div>
			<div class="card-footer d-flex justify-content-between align-items-center bg-info border-top-0">
				<button type="button" class="btn btn-outline bg-white text-white border-white border-2"  onclick='show2()'><i class="icon-plus3 mr-1"></i>Add</button>
	          	<a href="?page=packageList" class="btn btn-outline bg-white text-white border-white border-2">Save</a>			
		    </div>
		</div>
		</div>

		<div class="col-xl-4">
		<div class="card mt-2" style="">
			<div class="card-header">
			    <center>
			        <h2 class="card-title bg-info">Tourist Object</h2>
			    </center>
			</div>
		  <div class="card-body" style="max-height:100%;">

		      <table class="table table-bordered table-hover datatable-highlight mb-1" style="width: 100%" id='hasilcaritempat'>
	      	
		      	<thead>
					<tr>
						<th style="width: 10%; text-align: center;"><b>No.</b></th>
						<th style="width: 90%; text-align: center;"><b>Object</b></th>
					</tr>
		      	</thead>

						<?php

						$arr1 = array();
						$arr2 = array();
							$query = "SELECT * from package join object_point where package.id_package=object_point.id_package and package.id_package ='$id'";


								$data0=mysqli_query($conn, $query); $indexArray = 0;
								while($row = mysqli_fetch_array($data0)){
								$arr1[$indexArray] = array(
								$row['no_urut'],
								$row['id_souvenir'],
								$row['id_worship_place'],
								$row['id_restaurant'],
								$row['id_tourism'],
								$row['id_hotel'],
								$row['objek'],
								$row['lama_perjalanan'],
								$row['estimasi_waktu']
								); $indexArray += 1;
								}	

								$a = count($arr1);

								$arr2[6] = "travel";
								$arr2[5] = "hotel";
								$arr2[4] = "tourism";
								$arr2[3] = "restaurant";
								$arr2[2] = "workship_place";
								$arr2[1] = "souvenir";
								for($i=0;$i<$a;$i++)	
								{
								$column = 0;
								
						        $query2="SELECT  
						         a.name AS n1,
						         b.name AS n2
						         FROM ".$arr2[$arr1[$i][6]]." AS a, district as b 
						         WHERE st_contains(b.geom, a.geom) and a.id_".$arr2[$arr1[$i][6]]." = '".$arr1[$i][$arr1[$i][6]]."'";

										$data0=mysqli_query($conn, $query2);
						      
										while($row = mysqli_fetch_array($data0))
						        {					
						?>	

		      	<tbody>
		      		<td><?php echo $arr1[$i][0]; ?></td>
		      		<td><?php echo "$row[n1]"; ?></td>
		      	</tbody>
		      	<?php }} ?>
		      </table>

		  </div>
		</div> 
		</div>

	</div> 
</div>
<!-- --------------------------------------------Section 2-------------------------------------------- -->

<script type="text/javascript">
	var i = 0;
	var paket_id = [];  //id objek
	var paket_objek = []; //status

function cariObjek(){
      $('#cariObjek').empty();
     
      var district = document.getElementById('district').value;
      var objek =document.getElementById('objek').value;
      
      if (objek!=0 && district!=0){
        $.ajax({url: "http://localhost/paket_wisata/tourist/act/cariObjek.php?objek="+objek+"&district="+district, data: "", dataType: 'json', success: function(rows){
          console.log(rows);
          console.log("http://localhost/paket_wisata/tourist/act/cariObjek.php?objek="+objek+"&district="+district); 
               
                for (var i in rows){
                
                var row = rows[i];
                var id = row.id;
                var name = row.name; 
                console.log(id);
                console.log(name);
                $('#cariObjek').append('<option value="'+id+'">'+name+'</option>');
}
          }});//end ajax
        }//end if	
}	



var no =1
function show2(){
  console.log('show 2 fired');
	var data0 = document.getElementById('id_package').value;
	var data1 = document.getElementById('objek').value;
  var data2 = document.getElementById('cariObjek').value;
  var data3 = document.getElementById('time').value;
   var data9 = document.getElementById('estimated').value;
  var name = $("#cariObjek option:selected").text();
        
        $('#hasilcaritempat').append("<tr><td>"+no+"</td><td>"+name+"</td></tr>");
        no++;

  paket_id.push(data2);
  paket_objek.push(data1);
  for (var i = 0; i < paket_id.length; i++) {
    console.log(paket_id[i]);
    console.log(paket_objek[i]);

    console.log("ertyuityguigighjkyuiotyiofgfghfdcfhgcfhgcgfhcgfhchgfchfgc");
  };
  var itu = "act/savePackage.php?data1=2&data2="+data0+"&data3="+data1+"&data4="+data2+"&data5="+data3+"&data7="+data9;
  console.log(itu);
  
  //nyimpan ka object point
	$.ajax({
    url: "act/savePackage.php?data1=2&data2="+data0+"&data3="+data1+"&data4="+data2+"&data5="+data3+"&data7="+data9,
    data: "", 
    dataType: 'json', 
    success: function(rows){
      console.log(url);
	}});

  //
  console.log("act/savePackage.php?data1=3&data2="+data0+"&data3="+data1);
	$.ajax({
    url: "act/savePackage.php?data1=3&data2="+data0+"&data3="+data1, 
    data: "", 
    dataType: 'json', 
    success: function(rows){
      $('#hasilcaritempat').empty();
  		//$('#hasilcaritempat').append("<tr><td>"+nourut+"</td><td>"+district+"</td><td>"+name+"</td></tr>");
      //nourut++;
  		
  	}
  });
}
	
</script>
<script type="text/javascript">
	$('#twp').hide();
	$('#tay').hide();
	$('#spn').hide();
	$('#spd').hide();
</script>

    <!-- Core JS files -->
      <script src="../global_assets/js/main/jquery.min.js"></script>
      <script src="../global_assets/js/main/bootstrap.bundle.min.js"></script>
      <script src="../global_assets/js/plugins/loaders/blockui.min.js"></script>
      <script src="../global_assets/js/plugins/ui/ripple.min.js"></script>    
    <!-- /core JS files -->

    <!-- Theme JS files -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="../global_assets/js/plugins/forms/inputs/inputmask.js"></script>
    <script src="../global_assets/js/plugins/forms/selects/select2.min.js"></script>
    <script src="../global_assets/js/plugins/forms/selects/bootstrap_multiselect.js"></script>
    <script src="../global_assets/js/plugins/forms/styling/uniform.min.js"></script>
    <script src="../global_assets/js/plugins/extensions/jquery_ui/core.min.js"></script>
    <script src="../global_assets/js/plugins/forms/inputs/typeahead/typeahead.bundle.min.js"></script>
    <script src="../global_assets/js/plugins/forms/tags/tagsinput.min.js"></script>
    <script src="../global_assets/js/plugins/forms/tags/tokenfield.min.js"></script>
    <script src="../global_assets/js/plugins/forms/inputs/touchspin.min.js"></script>
    <script src="../global_assets/js/plugins/forms/inputs/maxlength.min.js"></script>
    <script src="../global_assets/js/plugins/forms/inputs/formatter.min.js"></script>
    
    <script src="../global_assets/js/demo_pages/form_floating_labels.js"></script>
    <!-- /theme JS files