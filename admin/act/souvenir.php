<?php
include ('../../connect.php');
$id=$_GET['id'];

$querysearch = "SELECT ST_AsGeoJSON(souvenir.geom) AS geom ,id_souvenir, name,  ST_X(ST_Centroid(souvenir.geom)) AS lng, ST_Y(ST_CENTROID(souvenir.geom)) AS lat FROM souvenir where id_souvenir='$id'";

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
			'id' => $isinya['id_souvenir'],
			'name' => $isinya['name']
			)
		);
	array_push($hasil['features'], $features);
}
echo json_encode($hasil);

?>