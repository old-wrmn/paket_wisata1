<?php
include ('../../connect.php');

$id = $_POST['id'];
$name = $_POST['name'];
$address = $_POST['address'];
$cont = $_POST['contact'];
// $district = $_POST['district'];
$geom = $_POST['geom'];


$sql = mysqli_query($conn, "insert into hotel (id_hotel, name, address, contact, geom) values ('$id', '$name', '$address', $cont, ST_GeomFromText('$geom'))") or die(mysqli_error($conn));

    if ($sql) 
    {
        echo"<script>
        alert ('Data Sudah ditambahkan!');
        eval(\"parent.location='../?page=hotel'\");
        </script>";
    } else{
        echo "<script>alert('Error');
        eval(\"parent.location='../?page=formSaveHotel'\");
        </script>";
    }

  
?>