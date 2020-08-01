<!-- Text inputs -->

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

     //              $query = mysqli_query($conn, "SELECT * FROM package");
				 //  $cek = 0;
				 //  $IdPackage = array();
				 //  $a0 = 0;
				 //  while($a = mysqli_fetch_array($query)){
					// $IdPackage[$a0] = $a['id_package'];
					// $a0 += 1;
				 //  }
				 //  $dataPackage = count($IdPackage);
				 //  $resArray = array();
				 //  $resArray[0] = 0;
				 //  $a1 = 0;
				 //  for($i=0;$i<$dataPackage;$i++){
					// $cek = 0;
					// for($j=0;$j<$dataPackage;$j++){
					// 	$k = $i + 1;
					// 	if($k == $IdPackage[$j]){
					// 		$cek = 1;
					// 	}
					// }
					// if($cek == 0){
					// 	$resArray[$a1] = $i + 1; $a1 += 1;
					// }
				 //  }
				 //  if($resArray[0] == 0){
					//   $resArray[0] = $dataPackage + 1;
				 //  }

                
                ?>

    <form method="POST">
        <div class="card-body">    
        <div id="data-dis">        
            <div class="form-group form-group-float" style="text-align: left;">  
            	<label class="form-group-float-label"><b>Package ID</b></label>              
                <input type="text" name="id_package" class="form-control" value="<?php echo $idmax; ?>" id="id_package" disabled>
            </div>  

            <div class="form-group form-group-float" style="text-align: left;">    
            	<label class="form-group-float-label"><b>Agent Name</b></label>            
                <input type="text" name="id_user" class="form-control" value="<?php echo $_SESSION['username']; ?>" id="id_user" disabled>
            </div>  
        </div>
        <div id="data-1">
            <div class="form-group form-group-float" style="text-align: left;">
                <label class="form-group-float-label"><b>Package Name</b></label>
                <input type="text" name="name" class="form-control" id="name" placeholder="Package Name" autofocus>
            </div>            

			<div class="form-group row">
				<label class="col-form-label col-sm-3">Itinerary</label>
				<div class="col-sm-12">
				  	<textarea type="text" id="itinerary" name="itinerary" id="itinerary" class="form-control"></textarea>
				</div>
			</div>

            <div class="form-group form-group-float" style="text-align: left;">
                <label class="form-group-float-label"><b>Price</b></label>
                <input type="number" name="price" class="form-control" id="price" placeholder="Price">
            </div> 
        </div>                                           
        </div>
        <div id="btn-1">
	        <div class="card-footer d-flex justify-content-between align-items-center bg-info border-top-0">
	<!--           <a href="?page=user" class="btn btn-outline bg-white text-white border-white border-2">Back</a> -->
	<!--           <button type="submit" name="regis" class="btn btn-outline bg-white text-white border-white border-2">Submit <i class="icon-paperplane ml-2"></i></button> -->
				<button type="button" style="float: right;" class="btn btn-outline bg-white text-white border-white border-2 show-modal"  onclick='show1()'><i class="icon-plus3 mr-1"></i>Add Object</button>
	        </div>
	    </div>
<!-- --------------------------------------------Section 2-------------------------------------------- -->
		<div id="data0">
		<div class="form-group row" style="display:none;">
		    <label class="col-form-label col-sm-2 ml-3">District</label>
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

		<div class="form-group row" style="display:none;">
		    <label class="col-form-label col-sm-2 ml-3">Object</label>
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

		<div class="form-group row" style="display:none;">
		    <label class="col-form-label col-sm-2 ml-3">Choose Place</label>
		    <div class="col-lg-9">                
		        <select class="form-control" id="cariObjek">

		        </select>

		    </div>
		</div>
		</div>
<!-- --------------------------------------------Section 2-------------------------------------------- -->

    </form>  
    </div>

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
		document.getElementById("data0").style.display = "";
		document.getElementById("data1").style.display = "";
		document.getElementById("data2").style.display = "";
	// 	document.getElementById("caritempatwisata").style.display = "";
		document.getElementById("data-dis").style.display = "none";
		document.getElementById("data-1").style.display = "none";
		document.getElementById("btn-1").style.display = "none";
    console.log('jalan tes lagi 3,'+id+', '+name+', '+price+','+itinerary);
		$.ajax({url:"act/savePackage.php?data1=1&data2="+id+"&data4="+name+"&data5="+price+"&data6="+itinerary, 
      data: "", dataType: 'json', success: function(rows){
			console.log('jalan tes lagi 4');
		}});
		
	}
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