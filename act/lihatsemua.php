<?php
include ('../connect.php');
$id = $_GET['id'];

// $query = mysqli_query($conn, "SELECT package.id_package, 
// 									package.name, 
// 									package.price, 
// 									users.role_id as role
// 			                        FROM package 
// 			                        join users on package.id_user=users.id_user
// 			                        where role_id !='C' and role_id !='A'
// 			                        order by package.id_package ASC");

$querysearch	="SELECT package.id_package as id_package, 
									package.name as name, 
									package.price as price, 
									users.role_id as role
			                        FROM package 
			                        join users on package.id_user=users.id_user
			                        where role_id !='C' and role_id !='A'
			                        order by package.id_package ASC";
			   
$hasil=mysqli_query($conn, $querysearch);
while($baris = mysqli_fetch_array($hasil))
	{
		$id=$baris['id_package'];
        $name=$baris['name'];
        $price=$baris['price']; 
        // $id_travel=$baris['id_travel'];
        
        $dataarray[]=array('id'=>$id,'name'=>$name,'price'=>$price);
    }
echo json_encode ($dataarray);
?>
