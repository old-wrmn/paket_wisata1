<?php
include ('../../connect.php');
$id = $_GET['id'];
// $id = 'BKG007';
$querysearch	="SELECT detail_booking.id_package, 
							detail_booking.number_people, 
							detail_booking.total_price, 
							package.price as harga_satuan,
							booking.date
							FROM detail_booking 
							join package on detail_booking.id_package=package.id_package 
							join booking on detail_booking.id_booking=booking.id_booking
							where detail_booking.id_booking='$id'";
			   
$hasil=mysqli_query($conn, $querysearch);
while($baris = mysqli_fetch_array($hasil))
	{
		$id=$baris['id_package'];
        $people=$baris['number_people'];
        $oneprice=$baris['harga_satuan']; 
        $date=$baris['date'];
        $price=$baris['total_price']; 
        // $id_travel=$baris['id_travel'];
        
        $dataarray[]=array('id'=>$id,'people'=>$people, 'satuan'=>$oneprice, 'date'=>$date, 'price'=>$price);
    }
echo json_encode ($dataarray);
?>