<?php
include ('../../connect.php');

$id = $_POST['id'];
$name = $_POST['name'];
$address = $_POST['address'];
$desc = $_POST['description'];
// $district = $_POST['district'];
$geom = $_POST['geom'];


$sql = mysqli_query($conn, "insert into worship_place (id_worship_place, name, address, description, geom) values ('$id', '$name', '$address', '$desc', ST_GeomFromText('$geom'))") or die(mysqli_error($conn));

    if ($sql) 
    {
        echo"<script>
        alert ('Data Sudah ditambahkan!');
        eval(\"parent.location='../?page=worship'\");
        </script>";
    } else{
        echo "<script>alert('Error');
        eval(\"parent.location='../?page=formSaveWorship'\");
        </script>";
    }

  
?>