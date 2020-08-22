<?php
include ('../connect.php');

$id_package = $_GET["id_package"];
// $id_package = "PKT028";
 
$querysearch	=" 	SELECT no_urut, id_tourism, id_restaurant, id_souvenir, id_worship_place, id_hotel
					FROM object_point where id_package = '$id_package'";

$hasil=mysqli_query($conn, $querysearch);
while($row = mysqli_fetch_array($hasil))
	{
		  $no_urut=$row['no_urut'];
		  $id_tourism=$row['id_tourism'];
		  $id_restaurant=$row['id_restaurant'];
		  $id_souvenir=$row['id_souvenir'];
		  $id_worship_place=$row['id_worship_place'];
		  $id_hotel=$row['id_hotel'];
		  $latitude = 0;
		  $longitude = 0;
		  if($id_tourism!==null)
		  {
		  	$querysearch2 = "SELECT ST_X(ST_Centroid(geom)) AS longitude, 
					ST_Y(ST_CENTROID(geom)) As latitude FROM tourism where id_tourism='$id_tourism'";	
		  }
		  else if($id_restaurant!==null)
		  {
		  	$querysearch2 = "SELECT ST_X(ST_Centroid(geom)) AS longitude, 
					ST_Y(ST_CENTROID(geom)) As latitude FROM restaurant where id_restaurant='$id_restaurant'";	
		  }
		  else if($id_souvenir!==null)
		  {
		  	$querysearch2 = "SELECT ST_X(ST_Centroid(geom)) AS longitude, 
					ST_Y(ST_CENTROID(geom)) As latitude FROM souvenir where id_souvenir='$id_souvenir'";	
		  }
		  else if($id_hotel!==null)
		  {
		  	$querysearch2 = "SELECT ST_X(ST_Centroid(geom)) AS longitude, 
					ST_Y(ST_CENTROID(geom)) As latitude FROM hotel where id_hotel='$id_hotel'";	
		  }
		  else
		  {
		  	$querysearch2 = "SELECT ST_X(ST_Centroid(geom)) AS longitude, 
					ST_Y(ST_CENTROID(geom)) As latitude FROM worship_place where id='$id_worship_place'";	
		  }
			$hasil2=mysqli_query($conn, $querysearch2);
			while($row = mysqli_fetch_array($hasil2))
			{
			  $latitude=$row['latitude'];				
			  $longitude=$row['longitude']; 
			  
			}		  


		  $dataarray[]=array('no_urut'=>$no_urut,'id_tourism'=>$id_tourism, 'id_restaurant'=>$id_restaurant,'id_souvenir'=>$id_souvenir,'id_worship_place'=>$id_worship_place,'id_hotel'=>$id_hotel, 'latitude'=>$latitude, 'longitude'=>$longitude);  
	}
echo json_encode ($dataarray);
?>