<!-- Text inputs -->
<div id="data-dis"> 
	<div class="card mt-2" style="width: 100%;">   
	    <div class="card-header">
	        <center>
	            <h2 class="card-title bg-info">Create Package</h2>
	        </center>
	    </div> 

	                <?php
	                include ('../connect.php');

		              $query = mysqli_query($conn,"SELECT MAX(id_package) AS id FROM package");
		              $result = mysqli_fetch_array($query);
		              $idmax = $result['id'];
		              $noUrut = (int) substr($idmax, 3, 3);
		              $noUrut++;
		              $char = "PKT";
		              $idmax = $char . sprintf("%03s", $noUrut);            
	                ?>

	    <form method="POST">	
	        <div class="card-body"> 
	            <div class="form-group form-group-float" style="text-align: left;">  
	            	<label class="form-group-float-label"><b>Package ID</b></label>              
	                <input type="text" name="id_package" class="form-control" value="<?php echo $idmax; ?>" id="id_package" disabled>
	            </div>  

	            <div class="form-group form-group-float" style="text-align: left;">    
	            	<label class="form-group-float-label"><b>Agent Name</b></label>            
	                <input type="text" name="id_user" class="form-control" value="<?php echo $_SESSION['username']; ?>" id="id_user" disabled>
	            </div>  

	            <div class="form-group form-group-float" style="text-align: left;">
	                <label class="form-group-float-label"><b>Package Name</b></label>
	                <input type="text" name="name" class="form-control" id="name" placeholder="Package Name" autofocus>
	            </div>            

				<div class="form-group row">
					<label class="col-form-label col-sm-3"><b>Itinerary</b></label>
					<div class="col-sm-12">
					  	<textarea type="text" id="itinerary" name="itinerary" id="itinerary" class="form-control"></textarea>
					</div>
				</div>

	            <div class="form-group form-group-float" style="text-align: left;">
	                <label class="form-group-float-label"><b>Price</b></label>
	                <input type="number" name="price" class="form-control" id="price" placeholder="Price (HANYA ANGKA)">
	            </div>                                        
	        </div>
	        
	        <div class="card-footer d-flex justify-content-between align-items-center bg-info border-top-0">
	<!--           <a href="?page=user" class="btn btn-outline bg-white text-white border-white border-2">Back</a> -->
	<!--           <button type="submit" name="regis" class="btn btn-outline bg-white text-white border-white border-2">Submit <i class="icon-paperplane ml-2"></i></button> -->
				<button type="button" style="float: right;" class="btn btn-outline bg-white text-white border-white border-2"  onclick='show1()'><i class="icon-plus3 mr-1"></i>Save and Add Object</button>
	        </div>
	    </form>  
	</div>
</div>

<!-- --------------------------------------------Section 2-------------------------------------------- -->

<div id="data-new" style="display: none;"> 	
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
		      </table>

		  </div>
		</div> 
		</div>

	</div> 
</div>
<!-- --------------------------------------------Section 2-------------------------------------------- -->

<!-- /text inputs -->

<!-- Info modal -->
<!-- <div id="modal" class="modal fade" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header bg-info">
				<h4 class="modal-title">Add Tourism Object</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			
			<form method="post">
			<div class="modal-body">

				<div class="row">
					<div class="col-sm-12">
					    <section class="panel">
					        <div class="panel-body">
					        	
							<div class="form-group row">
		                        <label class="col-form-label col-sm-3">District</label>
		                        <div class="col-lg-9">                
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
		                        <label class="col-form-label col-sm-3">Object</label>
		                        <div class="col-lg-9">                
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
		                        <label class="col-form-label col-sm-3">Choose Place</label>
		                        <div class="col-lg-9">                
		                            <select class="form-control" id="cariObjek">

		                            </select>

		                        </div>
		                    </div>

					        </div>				  					  
					    </section>
					</div>
				</div>	

			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
				<button type="submit" class="btn bg-info">Submit</button>
			</div>
			</form>
		</div>		
	</div>
</div> -->
<!-- /info modal -->

<script type="text/javascript">
	var i = 0;
	var paket_id = [];  //id objek
	var paket_objek = []; //status

function cariObjek(){
      $('#cariObjek').empty();
     
      var district = document.getElementById('district').value;
      var objek =document.getElementById('objek').value;
      
      if (objek!=0 && district!=0){
        $.ajax({url: "http://localhost/paket_wisata/agen/act/cariObjek.php?objek="+objek+"&district="+district, data: "", dataType: 'json', success: function(rows){
          console.log(rows);
          console.log("http://localhost/paket_wisata/agen/act/cariObjek.php?objek="+objek+"&district="+district); 
               
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

function show1(){
  console.log('jalan tes lagi'); 
	var name = document.getElementById('name').value;
	var price = document.getElementById('price').value;
	var id = document.getElementById('id_package').value;
	// var id_travel = document.getElementById('id_user').value;
  var itinerary = document.getElementById('itinerary').value;
  console.log('jalan tes lagi 2');
	if(document.getElementById('name').value != "" & document.getElementById('price').value != ""){
		document.getElementById("data-new").style.display = "";
	// 	document.getElementById("data1").style.display = "";
	// 	document.getElementById("data2").style.display = "";
	// 	document.getElementById("caritempatwisata").style.display = "";
		document.getElementById("data-dis").style.display = "none";
	// 	document.getElementById("data-1").style.display = "none";
    console.log('jalan tes lagi 3,'+id+', '+name+', '+price+','+itinerary);
		$.ajax({url:"act/savePackage.php?data1=1&data2="+id+"&data4="+name+"&data5="+price+"&data6="+itinerary, 
      data: "", dataType: 'json', success: function(rows){
			console.log('jalan tes lagi 4');
		}});
		
	}
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
  		for (var i in rows) {
        var row = rows[i];

  			//$('#hasilcaritempat').append("<tr><td>"+row.d1+"</td><td>"+row.d2+"</td><td>"+row.d3+"</td></tr>");
  		}
  	}
  });
}
	
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