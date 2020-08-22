<?php
include ('../../connect.php');

//$datenow = echo date('Y-M-d');

$user_id = $_POST['user_id'];
$pdate = $_POST['pdate'];
$date = $_POST['date'];
$total = $_POST['total'];
$totalprice = $_POST['totalprice'];
$id_booking = $_POST['id_booking'];
$id_package = $_POST['id_package'];
 

// $variabel_cari = $date."-".$id_booking."-".$id_package;
$variabel_cari = $date;

$text =mysqli_query ($conn, "insert into booking (id_booking, id_user, purchase_date, date, status) values ('$id_booking', '$user_id', '$pdate', '$date', 'PERLU DIKIRIM')") or die(mysqli_error($conn));

$text2 =mysqli_query ($conn, "insert into detail_booking (id_booking, id_package, number_people, total_price, travel_dates) values ('$id_booking','$id_package', '$total', '$totalprice', '$variabel_cari')") or die(mysqli_error($conn));

 if ($text)
 {
 

 	if ($text2)
 	{
 	echo"<script>
        alert ('Data Added!');
        eval(\"parent.location='../index.php'\");
        </script>";
    }

 }
 
 else 
 {
 	echo 'error';
 }  
?>