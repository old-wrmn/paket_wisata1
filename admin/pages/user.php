<!-- Highlighting rows and columns -->
				<div class="card col-md-12">
					<div class="card-header header-elements-inline">
						<h3 class="card-title">
							<b>Users Data</b>
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
						<a href="?page=formSaveUser" type="button" class="btn btn-outline bg-blue-400 text-blue-400 border-blue-400">Add Users</a>
					</div>

					<table id="dataTable" class="table table-bordered table-hover datatable-highlight">
						<thead>
							<tr style="text-align: center;">
								<th>ID User</th>								
								<th>Username</th>
								<th>Role</th>
								<th>Address</th>
								<th class="text-center" style="width: 100px">Actions</th>
							</tr>
						</thead>
						<tbody>
                                <?php                       
                                    $sql = mysqli_query($conn, "SELECT users.id_user, users.username, users.address, role.name as role FROM users join role where users.role_id=role.role_id order by id_user ASC");
                                    while($data =  mysqli_fetch_array($sql)){
                                    $id = $data['id_user'];                                    
                                    $username = $data['username'];
                                    $role = $data['role'];
                                    $alamat = $data['address'];
                                ?>				
							<tr>
                                <td style="text-align: center; width: 15%"><?php echo "$id"; ?></td>
                                <td style="width: 20%"><?php echo "$username"; ?></td>
                                <td style="text-align: center; width: 15%"><?php echo "$role"; ?></td>
                                <td style="width: 35%"><?php echo "$alamat"; ?></td>                                
                                <td style="text-align: center; width: 15%">
                                    <div class="btn-group">
                						<a href="?page=userDetail&id=<?php echo $id; ?>" class="btn btn-outline bg-blue-400 text-blue-400 border-blue-400"  title='Detail'><i class="icon-list"></i></a> &nbsp&nbsp&nbsp&nbsp
                						<a href="act/deleteUser.php?id=<?php echo $id; ?>" class="btn btn-outline bg-danger-400 text-danger-400 border-danger-400" title='Delete'><i class="icon-trash"></i></a>
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