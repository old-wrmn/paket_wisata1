<?php
	$host = "localhost";
	$user = "phpmyadmin";
	$pass = "password123";
	$db = "paket_wisata1";
	$conn = mysqli_connect($host, $user, $pass, $db) or die ("GAGAL");
	mysqli_select_db($conn, $db);
?>
