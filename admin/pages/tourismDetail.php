<?php
require '../connect.php';
$id = $_GET["id"];
//echo "woiiiiiiiiiiiiiiiiiiiii $id";
//DATA TOURISM
$query = "SELECT tourism.id_tourism, tourism.name, tourism.address, tourism.open, tourism.close, tourism.ticket, tourism.description, st_x(st_centroid(tourism.geom)) as lon, st_y(st_centroid(tourism.geom)) as lat from tourism where tourism.id_tourism ='$id'";
$hasil=mysqli_query($conn, $query);
while($baris = mysqli_fetch_array($hasil)){
  $id=$baris['id_tourism'];
  $name=$baris['name'];
  $address=$baris['address'];
  $open=$baris['open'];
  $close=$baris['close'];
  $ticket=$baris['ticket'];
  $desc=$baris['description'];
  // $tourism_type=$baris['tourism_type'];
  $lng=$baris['lon'];
  $lat=$baris['lat'];
  if ($lat=='' || $lng==''){
    $lat='<span style="color:red">Kosong</span>';
    $lng='<span style="color:red">Kosong</span>';
  }
}
?>

<center>
<div class="card col-md-4" id="galleryrecommendxxx">
	<div class="slider" id="gallery1">
		<div class="isi-slider">
    	<?php
			$id=$_GET['id'];
			$querysearch="SELECT gallery_tourism FROM tourism_gallery where id_tourism='$id'";
			$hasil=mysqli_query($conn, $querysearch);			 
			$xx = 0;
	     	while($baris = mysqli_fetch_array($hasil)){
     			$nilai=$baris['gallery_tourism'];
     			$xx++;
	 	?>			
		  <a href="#" onclick="galeri1('tw001')">
		  	<img src="../_foto/<?php echo $nilai; ?>" style="object-fit: contain;">
		  </a>
		<?php } ?>

		</div>
	</div>
</div>
<a href="?page=formUpdateTourism&id=<?php echo $id ?>" class="btn btn-round btn-warning mb-2"><i class="icon-pencil7 mr-1"></i>Update Data</a>
<button type="button" class="btn btn-round bg-info mb-2" data-toggle="modal" data-target="#modal_theme_info"><i class="icon-file-picture2 mr-1"></i>Tambah Gambar</button>
</center>

<!-- Info modal -->
<div id="modal_theme_info" class="modal fade" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header bg-info">
				<h4 class="modal-title">Upload Picture of <?php echo $name ?></h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			
			<form role="form" action="act/saveImgTourism.php" enctype="multipart/form-data" method="post">
			<div class="modal-body">

				<div class="row">
					<div class="col-sm-12"> <!-- menampilkan peta-->
					    <section class="panel">
					        <div class="panel-body">
					        	<center>
		                        <div class="html5gallery" style="max-height:700px;overflow:auto;" data-skin="horizontal" data-width="350" data-height="200" data-resizemode="fit">  
						    	<?php
									$id=$_GET['id'];
									$querysearch="SELECT gallery_tourism FROM tourism_gallery where id_tourism='$id'";
									$hasil=mysqli_query($conn, $querysearch);			 
									$xx = 0;
							     	while($baris = mysqli_fetch_array($hasil)){
						     			$nilai=$baris['gallery_tourism'];
						     			$xx++;
							 	?>
									<image src="../_foto/<?php echo $nilai; ?>" style="width:10%;">
									<!--image src="../foto/tw002_a.jpg" style="width:10%;"-->
								<?php
						    		}
						    		if($xx==0){
								?>
									<image src="../global_assets/images/pnotify/danger.png" style="width:10%;">
								<?php
						    		}
						    		echo "nilai foto $nilai";
								?>
								</div>
								</center>
					        </div>				  					  
					    </section>
					</div>

					<div class="col-sm-12"> <!-- menampilkan peta-->
					  	<section class="panel">
					        
					        <div class="panel-body">

						  			<div class="box-body">
										<input type="hidden" class="form-control hidden" name="id" value="<?php echo $id ?>">
										<div class="form-group">					 			
							 			<input type="file" class="form-control-uniform" name="image" data-fouc required>
										</div>
										<span style="color:red;">*Maximum image size 500kb</span>
						  			</div><!-- /.box-body -->

					        </div>			  
					  	</section>
					</div>
				</div>	

			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
				<button type="submit" class="btn bg-info">Submit</button>
			</div>
		</div>

		</form>		

	</div>
</div>
<!-- /info modal -->

<div class="card">
	<table  class="ml-3 mt-3">
		<tbody style='vertical-align:top;'>
			<tr><td width="150px"><b>Address</b></td><td> :&nbsp; </td><td style='text-transform:capitalize;'><?php echo $address ?></td></tr>
			<tr><td><b>Name</b></td><td>:</td><td><?php echo $name ?></td></tr>
			<tr><td><b>Open</b></td><td>:</td><td><?php echo $open ?></td></tr>
			<tr><td><b>Close</b></td> <td> :</td><td><?php echo $close ?></td></tr>
			<tr><td><b>Ticket<b> </td><td>: </td><td><?php echo $ticket ?></td></tr>
			<tr><td><b>Description<b> </td><td>: </td><td><?php echo $desc ?></td></tr>
			<!-- <tr><td><b>Type<b> </td><td>: </td><td><?php echo $tourism_type ?></td></tr> -->
			<tr><td><b>Koordinat<b> </td><td>: </td><td><b>Latitude</b> : <?php echo $lat ?> <br><b>Longitude</b> : <?php echo $lng ?></td></tr>
			<!-- <tr><td><b>Fasility<b> </td><td>: </td><td><?php echo $facility ?></td></tr> -->
			<tr><td><a href="?page=formsetF&id=<?php echo $id ?>" class="btn btn-round btn-warning"><i class="fa fa-edit"></i> Set Facility</a></td></tr></tr>
			<tr><td><br></td></tr>
		</tbody>					
	</table>
</div>


