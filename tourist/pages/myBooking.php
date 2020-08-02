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
								<th>ID Booking</th>
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
                                    $sql = mysqli_query($conn, "SELECT detail_booking.id_booking, detail_booking.travel_dates, detail_booking.number_people, detail_booking.total_price, booking.status FROM detail_booking join booking on detail_booking.id_booking=booking.id_booking where booking.id_user = '".$_SESSION['id_user']."' order by id_package ASC");
                                    while($data =  mysqli_fetch_array($sql)){
                                    $id_booking = $data['id_booking'];
                                    $date = $data['travel_dates'];
                                    $people = $data['number_people'];
                                    $price = $data['total_price'];
                                    $status = $data['status'];
                                ?>
							<tr>
                                <td style="text-align: center; width: 15%"><?php echo "$id_booking"; ?></td>
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
                                        <button a onclick="update('<?=$id_booking?>')" <?php if ($data['status']=="TERKIRIM") { echo "disabled";  }   ?> id="btnup" class="btn btn-outline bg-blue-400 text-blue-400 border-blue-400 mr-1"  title='Detail'><i class="icon-list"></i></button>
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
</script>
