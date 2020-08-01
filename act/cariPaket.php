<?php
	include ('../connect.php');
	$name = $_GET['name'];
	$querysearch	="SELECT id_package, name, price
	                        FROM package as a  where upper(name) like upper('%$name%') order by id_package ASC";
				   
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
