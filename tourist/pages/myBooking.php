<!-- Highlighting rows and columns -->
				<div class="card col-md-12">
					<div class="card-header header-elements-inline">
						<h3 class="card-title">
							<b>Instruksi Pembelian</b>
						</h3>						
					</div>		
					<div class="card-body">						
						<u>
							-------------------------------
						</u>
					</div>			
				</div>
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
								<th>ID Booking</th>
								<th>Package Name</th>
								<th>Travel Dates</th>
								<th>Number of People</th>
								<th>Price</th>
								<th>Status</th>
								<th class="text-center" style="width: 100px">Actions</th>
							</tr>
						</thead>
						<tbody>
                                <?php      
                                // $session = $_SESSION['id_user']         
                                    $sql = mysqli_query($conn, "SELECT detail_booking.id_booking, 
                                    	detail_booking.travel_dates, 
                                    	detail_booking.number_people, 
                                    	detail_booking.total_price, 
                                    	detail_booking.id_package, 
                                    	booking.status,
                                    	package.name 
                                    	FROM detail_booking 
                                    	join booking on detail_booking.id_booking=booking.id_booking 
                                    	join package on detail_booking.id_package=package.id_package
                                    	where booking.id_user = '".$_SESSION['id_user']."' order by id_package ASC");
                                    while($data =  mysqli_fetch_array($sql)){
                                    $id_booking = $data['id_booking'];
                                    $id_package = $data['id_package'];
                                    $date = $data['travel_dates'];
                                    $people = $data['number_people'];
                                    $price = $data['total_price'];
                                    $status = $data['status'];
                                    $package = $data['name'];
                                ?>				
							<tr>
                                <td style="text-align: center; width: 15%"><a href="?page=detailPackage&id=<?php echo "$id_package"; ?>"><?php echo "$id_booking"; ?></a></td>
                                <td style="text-align: center; width: 15%"><?php echo "$package"; ?></td>
                                <td style="text-align: center; width: 15%"><?php echo "$date"; ?></td>
                                <td style="text-align: center; width: 10%"><?php echo "$people"; ?></td>
                                <td style="text-align: left; width: 20%">Rp <?php echo "$price"; ?>,-</td>
                                <?php 
                                	if ($status=="PERLU DIKIRIM") {
                                		echo "<td style=\"text-align: center; width: 15%\"><span class=\"badge badge-warning\" style=\"font-size:12px\"> $status <span></td>";
                                	}elseif ($status=="TERKIRIM") {
                                		echo "<td style=\"text-align: center; width: 15%\"><span class=\"badge badge-success\" style=\"font-size:12px\"> $status <span></td>";
                                	}
                                ?>
                                <td style="text-align: center; width: 15%">
                                    <div class="btn-group">
                						<button a href='#modalbooking' data-toggle='modal' onclick="update('<?=$id_booking?>')" <?php if ($data['status']=="TERKIRIM") { echo "disabled";  }   ?> id="btnup" class="btn btn-outline bg-blue-400 text-blue-400 border-blue-400 mr-1"  title='Detail'><i class="icon-list"></i></button>

                						<button a onclick="hapus('<?=$id_booking?>')" <?php if ($data['status']=="TERKIRIM") { echo "disabled";  }  ?> id="btndel" class="btn btn-outline bg-danger-400 text-danger-400 border-danger-400 mr-1" title='Delete'><i class="icon-trash"></i></button>
                						
                						<button a onclick="send('<?=$id_booking?>')" <?php if ($data['status']=="TERKIRIM") { echo "disabled";  }   ?> id="btnsend" class="btn btn-outline bg-success-400 text-success-400 border-success-400" title='Send it'><i class="icon-paperplane"></i></button>
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
						<h4 class="modal-title">Update Your Booking</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
				<form name="form_input" action="act/saveUpdateBooking.php" method="POST" enctype="multipart/form-data">
					<div class="modal-body">
						<div class="form-group row">							
							<div class="col-lg-12">
								<div class="row">
									<div class="col-md-4">
										<input name="id_booking" id = "id_booking" class="form-control text-center" readonly>
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
		                		<input type="number" name="total" id = "total" onchange="hitungupdate()" placeholder="Number of People" autocomplete="off" class="form-control placeholder-no-fix">
							</div>
						</div>

						<div class="form-group row">
							<label class="col-form-label col-md-2">Current Date</label>
							<div class="col-md-4 text-center">
		                		<input type="form-text" name="pdate" id="pdate" autocomplete="off" class="form-control placeholder-no-fix" value="<?php echo date('Y-m-d'); ?>" readonly>
							</div>
						</div>												

						<div class="form-group row">
							<label class="col-form-label col-md-2">Change Travel Dates</label>
							<div class="row ml-1">
								<div class="col-md-4 text-center">
			                		<input type="form-text" name="olddate" id="olddate" autocomplete="off" class="form-control placeholder-no-fix" readonly>
								</div>	
								
								<span class="mt-2"><i class="icon-arrow-right7"></i></span>							
								<div class="col-md-6 text-center">
			                		<input type="date" name="date" id="date" placeholder="Date" autocomplete="off" class="form-control placeholder-no-fix">
								</div>
							</div>
						</div>	

						<div class="form-group row" hidden>
							<label class="col-form-label col-md-2">Price</label>
							<div class="col-md-4 text-center">
		                		<input type="number" id="oneprice" name="oneprice" autocomplete="off" class="form-control placeholder-no-fix text-danger" readonly>
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