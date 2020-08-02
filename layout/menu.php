			<!-- Sidebar content -->
			<div class="sidebar-content">

				

				<!-- Main navigation -->
				<div class="card card-sidebar-mobile">
					<ul class="nav nav-sidebar" data-nav-type="accordion">

						<!-- Main -->
						<li class="nav-item-header">
							<div class="text-uppercase font-size-s font-weight-bold line-height-s">MENU
						</div><i class="icon-menu" title="Main"></i></li>
						<li class="nav-item">
							<a href="index.php" class="nav-link active">
								<i class="icon-home4"></i>
								<span>
									HOME
								</span>
							</a>
						</li>
						<li class="nav-item">
	                    	<a href="javascript:;" class="nav-link" id="showall" onclick="tampilsemua()">
	                    		<i class="icon-list"></i>
	                          	<span>Tourism Package</span>
	                    	</a>
		                </li> 

						<li class="nav-item nav-item-submenu">
				          <a href="#" class="nav-link"><i class="icon-compass4"></i> <span>Tourism Around You</span></a>
				          
				          <ul class="nav nav-group-sub">
				            <ul class="nav-item">
				                <div class=" form-group" style="color: #26a69a; ; padding-left: 18px" > 

				                <label for="inputradius" style="font-size: 10pt";>Radius : </label>
				                <label  id="nilai"  style="font-size: 10pt";>0</label> m
				                <div></div>
				                <input  type="range" onchange="init();tourism_sekitar_user();cekkk();" id="inputradius" 
				                        name="inputradius" data-highlight="true" min="0" max="20" value="0" >
				                <script>
				                  function cekkk()
				                  {
				                    document.getElementById('nilai').innerHTML=document.getElementById('inputradius').value*100
				                  }
				                </script>
				              </div>
				            </ul> 
				          </ul>
				        </li>			

		                <li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link"><i class="icon-search4"></i> <span>Search Package by Name</span></a>

							<ul class="nav nav-group-sub" data-submenu-title="Layouts">								
								<ul class="sub ml-3 mr-4">
									<input type="text" class="form-control mt-1"  placeholder="Name" id="nama_paket">
									<span class="input-group-btn">									
									<button type="button" class="btn btn-outline bg-blue-400 text-blue-400 border-blue-400 icon-search4 mt-1" title="Cari" value="caripaket" onclick="cariPaket();"><i class="fa fa-search"></i></button>
								</ul>				
							</ul>
						</li>
						              

						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link"><i class="icon-copy"></i> <span>Search Package by Destination</span></a>

							<ul class="nav nav-group-sub" data-submenu-title="Layouts">								
								<ul class="sub">

<!-- --------------------------------------------------------------------------------------------- -->

									<div class="form-group row mt-1 ml-3 mr-4">								    
									        <select class="form-control" id="district" onchange="cariObjek()">
									          <option value="0">Choose District</option>
									      <?php
									      include ('connect.php');

									        $sql = mysqli_query($conn, "SELECT id_district, name FROM district");		                            
									        while($data =  mysqli_fetch_array($sql)){
										        $iddisc = $data['id_district'];
										        $named = $data['name'];				       
										       	echo "<option value=\"$iddisc\">$named</option>";} 

									       ?>
									        </select>

									</div>

									<div class="form-group row ml-3 mr-4">								    
									        <select class="form-control" id="objek" onchange="cariObjek()">
									        	<option value="0">Choose Object</option>
									            <option value="1">Souvenir</option>
									            <option value="2">Mosque</option>
									            <option value="3">Restaurant</option>
									            <option value="4">Tourism</option>
									            <option value="5">Hotel</option>
									        </select>

									</div>

									<div class="form-group row ml-3 mr-4">								    
									        <select class="form-control" id="cariObjek">

									        </select>

									</div>	
<!-- --------------------------------------------------------------------------------------------- -->
									<div class="form-group row ml-3 mr-4">
										<button type="button" class="btn btn-outline bg-blue-400 text-blue-400 border-blue-400 icon-search4 mt-1" title="Cari" value="caripaket" onclick="cariDestinasi();"><i class="fa fa-search"></i></button>
									</div>
								</ul>				
							</ul>
						</li>
					
						<!-- /main -->
					</ul>
				</div>
				<!-- /main navigation -->

			</div>
			<!-- /sidebar content -->

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