<?php
require '../connect.php';
$id = $_GET["id"];
//echo "woiiiiiiiiiiiiiiiiiiiii $id";
//DATA souvenir
$query = "SELECT souvenir.id_souvenir, souvenir.name, souvenir.address, souvenir.open, souvenir.close,  souvenir.description, st_x(st_centroid(souvenir.geom)) as lon, st_y(st_centroid(souvenir.geom)) as lat from souvenir where souvenir.id_souvenir ='$id'";
$hasil=mysqli_query($conn, $query);
while($baris = mysqli_fetch_array($hasil)){
  $id=$baris['id_souvenir'];
  $name=$baris['name'];
  $address=$baris['address'];
  $open=$baris['open'];
  $close=$baris['close'];
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
			$querysearch="SELECT gallery_souvenir FROM souvenir_gallery where id_souvenir='$id'";
			$hasil=mysqli_query($conn, $querysearch);			 
			$xx = 0;
	     	while($baris = mysqli_fetch_array($hasil)){
     			$nilai=$baris['gallery_souvenir'];
     			$xx++;
	 	?>			
		  <a href="#" onclick="galeri1('tw001')">
		  	<img src="../_foto/<?php echo $nilai; ?>" style="object-fit: contain;">
		  </a>
		<?php } ?>

		</div>
	</div>
</div>
<button type="button" class="btn btn-round bg-info mb-2" data-toggle="modal" data-target="#modal_theme_info"><i class="icon-file-picture2 mr-1"></i>Lihat Media</button>
</center>

<!-- Info modal -->
<div id="modal_theme_info" class="modal fade" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header bg-info">
				<h4 class="modal-title">Picture of <?php echo $name ?></h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			
			<div class="modal-body">

				<div class="row">
					<div class="col-sm-12"> <!-- menampilkan peta-->
					    <section class="panel">
					        <div class="panel-body">
					        	<center>
		                        <div class="html5gallery" style="max-height:700px;overflow:auto;" data-skin="horizontal" data-width="350" data-height="200" data-resizemode="fit">  
						    	<?php
									$id=$_GET['id'];
									$querysearch="SELECT gallery_souvenir FROM souvenir_gallery where id_souvenir='$id'";
									$hasil=mysqli_query($conn, $querysearch);			 
									$xx = 0;
							     	while($baris = mysqli_fetch_array($hasil)){
						     			$nilai=$baris['gallery_souvenir'];
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

				</div>	

			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
			</div>
		</div>

	</div>
</div>
<!-- /info modal -->

<div class="card">
	<table  class="ml-3 mt-3 mb-3">
		<tbody style='vertical-align:top;'>
			<tr><td><b>Name</b></td><td>:</td><td><?php echo $name ?></td></tr>			
			<tr><td width="150px"><b>Address</b></td><td> :&nbsp; </td><td style='text-transform:capitalize;'><?php echo $address ?></td></tr>
			<tr><td><b>Open</b></td><td>:</td><td><?php echo $open ?></td></tr>
			<tr><td><b>Close</b></td> <td> :</td><td><?php echo $close ?></td></tr>
			<tr><td><b>Description<b> </td><td>: </td><td><?php echo $desc ?></td></tr>
			<!-- <tr><td><b>Type<b> </td><td>: </td><td><?php echo $tourism_type ?></td></tr> -->
			<tr><td><b>Koordinat<b> </td><td>: </td><td><b>Latitude</b> : <?php echo $lat ?> <br><b>Longitude</b> : <?php echo $lng ?></td></tr>
			<!-- <tr><td><b>Fasility<b> </td><td>: </td><td><?php echo $facility ?></td></tr> -->
		</tbody>					
	</table>
</div>

<script type="text/javascript">
	$('#twp').hide();
	$('#tay').hide();
	$('#spn').hide();
	$('#spd').hide();
</script>