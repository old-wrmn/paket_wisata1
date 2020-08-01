
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<div class="form-group row">
				    <div class="col-lg-8">                
				        <select class="form-control" id="district" onchange="cariObjek()">
				          <option value="0">Choose District</option>
				      <?php
				      include ('../connect.php');

				        $sql = mysqli_query($conn, "SELECT id_district, name FROM district");		                            
				        while($data =  mysqli_fetch_array($sql)){
					        $iddisc = $data['id_district'];
					        $named = $data['name'];				       
					       	// echo "<option value=\"$iddisc\">$named</option>";} 

				       ?>
				       <option value=""><?php echo "$named";?></option>
				   <?php } ?>
				        </select>

				    </div>
				</div>

				<div class="form-group row">
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
				    <div class="col-lg-8">                
				        <select class="form-control" id="cariObjek">

				        </select>

				    </div>
				</div>	


<script type="text/javascript">
	var i = 0;
	var paket_id = [];  //id objek
	var paket_objek = []; //status

function cariObjek(){
      $('#cariObjek').empty();
     
      var district = document.getElementById('district').value;
      var objek =document.getElementById('objek').value;
      
      if (objek!=0 && district!=0){
        $.ajax({url: "http://localhost/paket_wisata/act/cariObjek.php?objek="+objek+"&district="+district, data: "", dataType: 'json', success: function(rows){
          console.log(rows);
          console.log("http://localhost/paket_wisata/act/cariObjek.php?objek="+objek+"&district="+district); 
               
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
</script>				
</body>
</html>
