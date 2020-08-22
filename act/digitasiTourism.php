<?php
include ('../connect.php');

$querysearch = "SELECT ST_AsGeoJSON(tourism.geom) AS geom ,id_tourism, name,  ST_X(ST_Centroid(tourism.geom)) AS lng, ST_Y(ST_CENTROID(tourism.geom)) AS lat FROM tourism";

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
			'id' => $isinya['id_tourism'],
			'name' => $isinya['name']
			)
		);
	array_push($hasil['features'], $features);
}
echo json_encode($hasil);

?>