<?php
include ('../../connect.php');
$id=$_GET['id'];

$querysearch = "SELECT ST_AsGeoJSON(restaurant.geom) AS geom ,id_restaurant, name,  ST_X(ST_Centroid(restaurant.geom)) AS lng, ST_Y(ST_CENTROID(restaurant.geom)) AS lat FROM restaurant where id_restaurant='$id'";

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
			'id' => $isinya['id_restaurant'],
			'name' => $isinya['name']
			)
		);
	array_push($hasil['features'], $features);
}
echo json_encode($hasil);

?>