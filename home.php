				<!-- Main charts -->
				<div class="row">
					<div class="col-xl-8">
                           
 					<!-- google maps with location list -->
						<div class="card">
							<div class="card-header header-elements-inline" style="padding-top: 5px; padding-bottom: 0px; padding-right: 5px;">
								<h6 class="card-title">Google Map with Location List</h6>
									
									<header class="card-header" style="float:right; padding-top: 2px; padding-bottom: 1px; padding-right: 2px;">
		                              <input type="hidden" id="myLatLocation" value="0">
		                              <input type="hidden" id="myLngLocation" value="0">
		                             
		                              <a class="btn btn-default" role="button" data-toggle="collapse" onclick="posisisekarang()" title="Current Position" style="margin-right:5px; background: #26a69a "><i class="icon-pin" style="color: white;"></i></a>
		                             
		                              <a class="btn btn-default" role="button" data-toggle="collapse" onclick="lokasimanual()" title=" Manual Position" style="margin-right:5px; background: #26a69a"><i class="icon-pushpin" style="color: white ;"></i></a>
		                              <label id="tombol">
		                             
		                              <a class="btn btn-default" role="button" id="showlegenda" data-toggle="collapse" onclick="legenda()" title="Legend" style="margin-right:5px; background: #26a69a"><i class="icon-eye" style="color: white ;"></i></a>
		                             
		                              </label>
		                            </header>
							</div>
							<div class="centered" id="map" style="height:460px"></div>
						</div>
					<!-- /google maps with location list -->
					</div>

					<div class="col-xl-4">
						<div class="card"  id="galleryrecommendxxx">
						  <div  class="col-md-12 col-sm-12 mb">
						  	<div class="white-panel pns" style="height: 300px">	
					            <div class="card-header">
					                <center>
					                  <h2 class="card-title bg-teal-400">Tourism Recommendation</h2>                  
					                </center>
					            </div>

						       <div class="slider" id="gallery1">
						        <div class="isi-slider">
						          <a href="#" onclick="galeri1('tw001')"><img src="_foto/sitinur.jpg"></a>
						          <a href="#" onclick="galeri1('tw011')"><img src="_foto/pam.jpg"></a>
						          <a href="#" onclick="galeri1('tw004')"><img src="_foto/sitinur.jpg"></a>
						          <a href="#" onclick="galeri1('tw005')"><img src="_foto/pam.jpg"></a>
						        </div>
						       </div>
						    </div>
						  </div>                
						</div>
			            
						<div class="card">
	                    <!-- DATA TABLE -->
							<div id="view_kanan_table" class="col-md-12 col-sm-12 mb" style="display:none;">
								<div class="white-panel pns" style="height: 495px">
								   <div class="white-header" style="height:40px;margin:20px; background:#26a69a; color:black">
								     <h5 class="btn btn-default" style="color: white; width: 100%; " id="judul_table">List Tourism</h5>
								   </div>

								   <div style="height:410px; overflow-y: scroll; margin:20px;">
								      <table style="color:black" class="table table-bordered">
								        <tbody id='kanan_table'></tbody>
								      </table>
								   </div>
								</div>
							</div>

							<div id="view_kanan_table1" class="col-md-12 col-sm-12 mb" style="display:none;">
		                        <div class="white-panel pns" style="height: 350px; ">
		                           <div class="white-header" style="height:40px;margin:20px;background:#26a69a;color:black">
		                             <h5 class="btn btn-default" style="color: white; width: 100%; " id="judul_table">Object Arround</h5>
		                           </div>
									
		                           <div style=" margin:20px;">
		                              <table style="color:black" class="table" border="0">
		                                <tbody id='kanan_table1'></tbody>
		                              </table>
		                           </div>
		                        </div>
	                      	</div>

                   		<!-- DATA TABLE OBJEK SEKITAR-->
							<div id="view_table_sekitar" class="col-md-12 col-sm-12 mb" style="display:none">
								<div class="white-panel pns">
								   <div class="white-header" style="height:40px;margin:20px;background: #26a69a;color:black">
								     <h5 class="btn btn-default" style="color: white; width: 275px; ">Search Results Object Around</h5>
								   </div>

								   <div style="margin:20px; overflow-y: scroll;">
								      <table id="table_hotel" class="table table-bordered">
								        <tbody id='table_kanan_hotel' style='color:black'></tbody>
								      </table>  
								      <table id="table_tourism" class="table table-bordered">
								        <tbody id='table_kanan_tourism' style='color:black'></tbody>
								      </table>  
								      <table id="table_worship" class="table table-bordered">
								        <tbody id='table_kanan_worship' style='color:black'></tbody>
								      </table>  
								      <table id="table_souvenir" class="table table-bordered">
								        <tbody id='table_kanan_souvenir' style='color:black'></tbody>
								      </table>  
								      <table id="table_culinary" class="table table-bordered">
								        <tbody id='table_kanan_culinary' style='color:black'></tbody>
								      </table>  
								      <table id="table_industry" class="table table-bordered">
								        <tbody id='table_kanan_industry' style='color:black'></tbody>
								      </table>  
								      <table id="table_restaurant" class="table table-bordered">
								        <tbody id='table_kanan_restaurant' style='color:black'></tbody>
								      </table>  
								      <table id="table_angkot" class="table table-bordered">
								        <tbody id='table_kanan_angkot' style='color:black'></tbody>
								      </table>  
								   </div>
								</div>
							</div>
						
						</div>
					</div>
				</div>	



<!-- --------------------------------------------------------------------------------------------- -->
	<!---- --------------------------------- Modal BOOKING --------------------------------- ---->
<!-- --------------------------------------------------------------------------------------------- -->
	<div id="modalbooking" class="modal fade" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">				
					<div class="modal-header bg-danger">
						<h4 class="modal-title">Warning</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>		

					<div class="modal-body">
						<h6>Untuk dapat memesan <b>Paket Wisata</b> anda harus <span class="text-primary">Login</span> terlebih dahulu!</h6>					
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-link text-danger" data-dismiss="modal">Close</button>
						<a href="login.php" type="button" class="btn bg-primary btn-link">Login</a>
					</div>				
			</div>
		</div>
	</div>
<!-- --------------------------------------------------------------------------------------------- -->
	<!---- --------------------------------- End Modal BOOKING --------------------------------- ---->
<!-- --------------------------------------------------------------------------------------------- -->				