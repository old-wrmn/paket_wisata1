<?php
	$host = "localhost";
	$user = "root";
	$pass = "malik";
	$db = "paket_wisata1";
	$conn = mysqli_connect($host, $user, $pass, $db) or die ("GAGAL");
	mysqli_select_db($conn, $db); 
?>