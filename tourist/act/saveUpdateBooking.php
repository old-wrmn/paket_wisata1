<?php
include ('../../connect.php');

//
$pdate = $_POST['pdate'];
$date = $_POST['date'];
$olddate = $_POST['olddate'];
$total = $_POST['total'];
$totalprice = $_POST['totalprice'];
$id_booking = $_POST['id_booking'];
$id_package = $_POST['id_package'];

 // $variabel_cari = $date."".$id_booking."".$id_package;
    //query UPDATE

	if ($date==null) {
		$text =mysqli_query ($conn,  "UPDATE booking SET purchase_date='$pdate', date='$olddate'    
	    WHERE id_booking='$id_booking'") or die(mysqli_error($conn));
	    // echo $query;

	    $text2 =mysqli_query ($conn,  "UPDATE detail_booking SET number_people='$total', travel_dates='$olddate', total_price='$totalprice' WHERE id_booking='$id_booking'") or die(mysqli_error($conn));		
	}else{
		$text =mysqli_query ($conn,  "UPDATE booking SET purchase_date='$pdate', date='$date'    
	    WHERE id_booking='$id_booking'") or die(mysqli_error($conn));
	    // echo $query;

	    $text2 =mysqli_query ($conn,  "UPDATE detail_booking SET number_people='$total', travel_dates='$date', total_price='$totalprice' WHERE id_booking='$id_booking'") or die(mysqli_error($conn));
	}

 if ($text)
 {
 

 	if ($text2)
 	{
 	echo"<script>
        alert ('Data Added!');
        eval(\"parent.location='../?page=myBooking'\");
        </script>";
    }

 }
 
 else 
 {
 	echo 'error';
 } 
	?>