<?php
include ('../../connect.php');
$id = $_POST['id'];
$nama = $_POST['name'];
$address = $_POST['address'];
$desc = $_POST['description'];
$geom = $_POST['geom'];

$sql = mysqli_query($conn, "UPDATE worship_place set name='$nama', address='$address', description='$desc', geom=ST_GeomFromText('$geom') where id_worship_place='$id'") or die(mysqli_error($conn));
   


    if ($sql) 
    {
        echo"<script>
        alert ('Data Updated!');
        eval(\"parent.location='../?page=worshipDetail&id=$id'\");
        </script>";
    } else{
        echo "<script>alert('Error');
        eval(\"parent.location='../?page=formUpdateWorship&id=$id'\");
        </script>";
    }
    

?>
