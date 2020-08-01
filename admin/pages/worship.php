<!-- Highlighting rows and columns -->
				<div class="card col-md-12">
					<div class="card-header header-elements-inline">
						<h3 class="card-title">
							<b>Data Worship Place</b>
						</h3>
						<div class="header-elements">
							<div class="list-icons">
		                		<a class="list-icons-item" data-action="collapse"></a>
		                		<a class="list-icons-item" data-action="reload"></a>
		                		<a class="list-icons-item" data-action="remove"></a>
		                	</div>
	                	</div>
					</div>

					<div class="card-body">
						<a href="?page=formSaveWorship" type="button" class="btn btn-outline bg-blue-400 text-blue-400 border-blue-400">Add Worship Place</a>
					</div>

					<table id="dataTable" class="table table-bordered table-hover datatable-highlight">
						<thead>
							<tr style="text-align: center;">
								<th>ID Worship Place</th>
								<th>Name</th>
								<th>Address</th>
								<th class="text-center" style="width: 100px">Actions</th>
							</tr>
						</thead>
						<tbody>
                                <?php                       
                                    $sql = mysqli_query($conn, "SELECT * FROM worship_place order by id_worship_place ASC");
                                    while($data =  mysqli_fetch_array($sql)){
                                    $id = $data['id_worship_place'];
                                    $nama = $data['name'];
                                    $alamat = $data['address'];
                                ?>				
							<tr>
                                <td style="text-align: center; width: 15%"><?php echo "$id"; ?></td>
                                <td style="width: 30%"><?php echo "$nama"; ?></td>
                                <td style="width: 40%"><?php echo "$alamat"; ?></td>                                
                                <td style="text-align: center; width: 15%">
                                    <div class="btn-group">
                						<a href="?page=worshipDetail&id=<?php echo $id; ?>" class="btn btn-outline bg-blue-400 text-blue-400 border-blue-400"  title='Detail'><i class="icon-list"></i></a> &nbsp&nbsp&nbsp&nbsp
                						<a href="act/deleteWorship.php?id=<?php echo $id; ?>" class="btn btn-outline bg-danger-400 text-danger-400 border-danger-400" title='Delete'><i class="icon-trash"></i></a>
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