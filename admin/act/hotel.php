<?php
include ('../../connect.php');
$id=$_GET['id'];

$querysearch = "SELECT ST_AsGeoJSON(hotel.geom) AS geom ,id_hotel, name,  ST_X(ST_Centroid(hotel.geom)) AS lng, ST_Y(ST_CENTROID(hotel.geom)) AS lat FROM hotel where id_hotel='$id'";

$result = mysqli_query($conn, $querysearch);
$hasil = array(
	'type'	=> 'FeatureCollection',
	'features' => array()
	);
while ($isinya = mysqli_fetch_assoc($result)) {
	$features = array(
		'type' => 'Feature',
		'geometry' => json_decode($isinya['geom']),
		
		'properties' => array(
			'id' => $isinya['id_hotel'],
			'name' => $isinya['name']
			)
		);
	array_push($hasil['features'], $features);
}
echo json_encode($hasil);

?>