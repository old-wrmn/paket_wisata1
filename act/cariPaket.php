<?php
	include ('../connect.php');
	$name = $_GET['name'];
	$idUser =  $_GET['id_user'];

if ($idUser==null) {
	$querysearch	="SELECT package.id_package, 
								package.name, 
								package.price
								FROM package 
								join users  on package.id_user=users.id_user
								where upper(name) like upper('$name') || users.role_id ='B'
								order by id_package ASC";
}else{
	$querysearch	="SELECT package.id_package, 
								package.name, 
								package.price
								FROM package 
								join users  on package.id_user=users.id_user
								where upper(name) like upper('$name') || users.role_id ='B' || users.id_user='$idUser' order by id_package ASC";
}

				   
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
