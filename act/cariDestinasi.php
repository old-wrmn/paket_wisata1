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
	$querysearch = " SELECT package.id_package, 
							package.name, 
							package.price,
							package.id_user,
							users.role_id 
							FROM package 
							join object_point on object_point.id_package = package.id_package 
							join users on package.id_user = users.id_user
							where id_souvenir = '$id' and users.role_id='B' ";
} else if ($status == 2) {
	$querysearch = " SELECT package.id_package, 
							package.name, 
							package.price,
							package.id_user,
							users.role_id 
							FROM package 
							join object_point on object_point.id_package = package.id_package 
							join users on package.id_user = users.id_user
							where id_worship_place = '$id' and users.role_id='B' ";
} else if ($status == 3) {
	$querysearch = " SELECT package.id_package, 
							package.name, 
							package.price,
							package.id_user,
							users.role_id 
							FROM package 
							join object_point on object_point.id_package = package.id_package 
							join users on package.id_user = users.id_user
							where id_restaurant = '$id' and users.role_id='B' ";
} else if ($status == 4) {
	$querysearch = " SELECT package.id_package, 
							package.name, 
							package.price,
							package.id_user,
							users.role_id 
							FROM package 
							join object_point on object_point.id_package = package.id_package 
							join users on package.id_user = users.id_user
							where id_tourism = '$id' and users.role_id='B' ";
}
else if ($status == 5) {
	$querysearch = " SELECT package.id_package, 
							package.name, 
							package.price,
							package.id_user,
							users.role_id 
							FROM package 
							join object_point on object_point.id_package = package.id_package 
							join users on package.id_user = users.id_user
							where id_hotel = '$id' and users.role_id='B' ";
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

