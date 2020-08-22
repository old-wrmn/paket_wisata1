<?php

include ('../../connect.php');
$id_booking = $_POST['id_booking'];
// $id_booking = 'BKG005';

$updateBooking = mysqli_query($conn, "UPDATE booking set status='SELESAI' where id_booking='".$id_booking."'");

?>