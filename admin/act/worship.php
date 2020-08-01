<?php
include ('../../connect.php');
$id=$_GET['id'];

$querysearch = "SELECT ST_AsGeoJSON(worship_place.geom) AS geom ,id_worship_place, name,  ST_X(ST_Centroid(worship_place.geom)) AS lng, ST_Y(ST_CENTROID(worship_place.geom)) AS lat FROM worship_place where id_worship_place='$id'";

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
			'id' => $isinya['id_worship_place'],
			'name' => $isinya['name']
			)
		);
	array_push($hasil['features'], $features);
}
echo json_encode($hasil);

?>