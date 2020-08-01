<?php
require 'connect.php';

$querysearch = "SELECT ST_AsGeoJSON(district.geom) AS geom ,id_district, name,  ST_X(ST_Centroid(district.geom)) AS lng, ST_Y(ST_CENTROID(district.geom)) AS lat FROM district ORDER BY id_district ASC";

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
			'id' => $isinya['id_district'],
			'name' => $isinya['name'],
        
            'lat' => $isinya['lat'],
			'lng' => $isinya['lng']
			)
		);
	array_push($hasil['features'], $features);
}
echo json_encode($hasil);

?>