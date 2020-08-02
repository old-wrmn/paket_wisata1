<?php
include ('../connect.php'); 

$status = $_GET["status"];
$id = $_GET["id"];
/*
1 industri
2 mesjid
3 rm
4 tw
5 htl
*/
 
if ($status == 1) {
	$querysearch = " SELECT object_point.id_package, package.name, package.price FROM object_point left join package on package.id_package = object_point.id_package where id_souvenir = '$id' ";
} else if ($status == 2) {
	$querysearch = " SELECT object_point.id_package, package.name, package.price FROM object_point left join package on package.id_package = object_point.id_package where id_worship_place = '$id' ";
} else if ($status == 3) {
	$querysearch = " SELECT object_point.id_package, package.name, package.price FROM object_point left join package on package.id_package = object_point.id_package where id_restaurant = '$id' ";
} else if ($status == 4) {
	$querysearch = "SELECT object_point.id_package, package.name, package.price FROM object_point left join package on package.id_package = object_point.id_package where id_tourism = '$id' ";
}
else if ($status == 5) {
	$querysearch = " SELECT object_point.id_package, package.name, package.price FROM object_point left join package on package.id = object_point.id_package where id_hotel = '$id' ";
}



$hasil=mysqli_query($conn, $querysearch);
while($row = mysqli_fetch_array($hasil))
	{
		  $id=$row['id_package'];
		  // $id_travel=$row['id_travel'];
		  $name=$row['name'];
		  $price=$row['price'];
		  $dataarray[]=array('id'=>$id,'name'=>$name,'price'=>$price);  
	}
echo json_encode ($dataarray);
?>

