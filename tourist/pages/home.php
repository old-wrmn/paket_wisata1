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
			          <a href="#" onclick="galeri1('tw001')"><img src="../_foto/pam.jpg"></a>
			          <a href="#" onclick="galeri1('tw011')"><img src="../_foto/pam.jpg"></a>
			          <a href="#" onclick="galeri1('tw004')"><img src="../_foto/pam.jpg"></a>
			          <a href="#" onclick="galeri1('tw005')"><img src="../_foto/pam.jpg"></a>
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
			</div>
		</div>
	</div>	

<!-- --------------------------------------------------------------------------------------------- -->
	<!---- --------------------------------- Modal BOOKING --------------------------------- ---->
<!-- --------------------------------------------------------------------------------------------- -->
	<div id="modalbooking" class="modal fade" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">				
					<div class="modal-header bg-primary">
						<h4 class="modal-title">Booking Your Package</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
				<form name="form_input" action="act/simpanBooking.php" method="POST" enctype="multipart/form-data">
					<div class="modal-body">
						<?php
		                include ('../connect.php');

			              $query = mysqli_query($conn,"SELECT MAX(id_booking) AS id FROM booking");
			              $result = mysqli_fetch_array($query);
			              $idmax = $result['id'];
			              $noUrut = (int) substr($idmax, 3, 3);
			              $noUrut++;
			              $char = "BKG";
			              $idmax = $char . sprintf("%03s", $noUrut);      


		                ?>

						<div class="form-group row">							
							<div class="col-lg-12">
								<div class="row">
									<div class="col-md-4">
										<input name="id_booking" id = "id_booking" class="form-control text-center" value="<?php echo $idmax;?>" readonly>
										<span class="badge d-block badge-info form-text text-center">ID BOOKING</span>
									</div>

									<div class="col-md-4">
										<input name="user_id" id = "user_id" class="form-control text-center hidden" value="<?php echo "$_SESSION[id_user]" ?>" readonly>
										<span class="badge d-block badge-info form-text text-center"><?php echo "$_SESSION[username]" ?></span>
									</div>

									<div class="col-md-4">
										<input name="id_package" id = "id_package" class="form-control text-center hidden" readonly>
										<span class="badge d-block badge-info form-text text-center">ID PAKET</span>
									</div>
								</div>
							</div>
						</div>
					
						<div class="form-group row">
							<label class="col-form-label col-md-2">Number of People</label>
							<div class="col-md-4 text-center">
		                		<input type="number" name="total" id = "total" onkeyup="hitung()" placeholder="Number of People" autocomplete="off" class="form-control placeholder-no-fix">
							</div>
						</div>

						<div class="form-group row">
							<label class="col-form-label col-md-2">Purchase Date</label>
							<div class="col-md-4 text-center">
		                		<input type="form-text" name="pdate" id="pdate" autocomplete="off" class="form-control placeholder-no-fix" value="<?php echo date('Y-m-d'); ?>" readonly>
							</div>
						</div>												

						<div class="form-group row">
							<label class="col-form-label col-md-2">Date of Departure</label>
							<div class="col-md-4 text-center">
		                		<input type="date" name="date" id="date" placeholder="Date" autocomplete="off" class="form-control placeholder-no-fix">
							</div>
						</div>						

						<div class="form-group row">
							<label class="col-form-label col-md-2">Total Price</label>
							<div class="col-md-4 text-center">
		                		<input type="number" id="totalprice" name="totalprice" placeholder="Total Price"  autocomplete="off" class="form-control placeholder-no-fix text-danger" readonly>
							</div>
						</div>						
						
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
						<button type="submit" class="btn bg-primary">Save changes</button>
					</div>
				</form>
			</div>
		</div>
	</div>
<!-- --------------------------------------------------------------------------------------------- -->
	<!---- --------------------------------- End Modal BOOKING --------------------------------- ---->
<!-- --------------------------------------------------------------------------------------------- -->