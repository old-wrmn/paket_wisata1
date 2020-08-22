<!-- Highlighting rows and columns -->
				<div class="card col-md-12">
					<div class="card-header header-elements-inline">
						<h3 class="card-title">
							<b>Package List</b>
						</h3>
						<div class="header-elements">
							<div class="list-icons">
		                		<a class="list-icons-item" data-action="collapse"></a>
		                	</div>
	                	</div>
					</div>

					<table id="dataTable" class="table table-bordered table-hover datatable-highlight">
						<thead>
							<tr style="text-align: center;">
								<th>ID Package</th>
								<th>Package Name</th>
								<th>Price</th>
								<th class="text-center" style="width: 100px">Actions</th>
							</tr>
						</thead>
						<tbody>
                                <?php      
                                // $session = $_SESSION['id_user']         
                                    $sql = mysqli_query($conn, "SELECT package.id_package, 
										package.name, 
										package.price, 
										users.role_id as role
				                        FROM package 
				                        join users on package.id_user=users.id_user
                                    	where users.id_user = '".$_SESSION['id_user']."' order by id_package ASC");
                                    while($data =  mysqli_fetch_array($sql)){
                                    $id_package = $data['id_package'];
                                    $name = $data['name'];
                                    $price = $data['price'];
 
                                ?>				
							<tr>
                                <td style="text-align: center; width: 20%"><a href="?page=customPackage1&id=<?php echo $id_package ?>"><?php echo "$id_package"; ?></a></td>
                                <td style="text-align: center; width: 40%"><?php echo "$name"; ?></td>
                                <td style="text-align: center; width: 20%"><?php echo "$price"; ?></td>
                                <td style="text-align: center; width: 20%">
                                	<div class="btn-group">
                                	<a role="button" class="btn btn-outline bg-green-400 text-green-400 border-green-400 icon-envelop5 mr-1" title="booking" href="#modalbooking" data-toggle="modal" onclick='booking("<?="$id_package"?>","<?="$price"?>")'></a>
                                	<a role="button" title="Package Info" class="btn btn-outline bg-info-400 text-info-400 border-info-400 icon-info22 ml-1" value="Route"></a>
                                	</div>
                                </td>
							</tr>
						<?php } ?>
						</tbody>
					</table>
				</div>
				<!-- /highlighting rows and columns -->	

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

					<div class="modal-footer card-footer d-flex justify-content-between align-items-center bg-primary">
						
						<a type="button" class="btn btn-outline bg-white text-white border-white border-2 legitRipple" id="custom">Custom Package</a>
						<!-- <button type="button" class="btn btn-link" data-dismiss="modal">Close</button> -->
						<button type="submit" class="btn btn-outline bg-white text-white border-white border-2 legitRipple">Booking</button>
						
					</div>
				</form>
			</div>
		</div>
	</div>
<!-- --------------------------------------------------------------------------------------------- -->
	<!---- --------------------------------- End Modal BOOKING --------------------------------- ---->
<!-- --------------------------------------------------------------------------------------------->				

<script type="text/javascript">
$('#dataTable').dataTable( {
  "columnDefs": [ {
      "targets": 'nosort',
      "orderable": true
    } ]
} );
</script>

<script type="text/javascript">
	$('#twp').hide();
	$('#tay').hide();
	$('#spn').hide();
	$('#spd').hide();
	$('#cp').hide();
</script>