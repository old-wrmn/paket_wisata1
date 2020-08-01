<?php 
require 'connect.php';

$query = mysqli_query($conn,"SELECT ST_TextFromGeom(district.geom) AS geom ,id, name FROM district ORDER BY id ASC");
if (!$query) {
    printf("Error: %s\n", mysqli_error($conn));
    exit();
}
$data = mysqli_fetch_array($query);					            	
$username = $data['geom'];	

echo "$username";
 ?>