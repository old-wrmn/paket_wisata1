<?php
include ('../../connect.php');
$id = $_POST['id'];
$nama = $_POST['name'];
$address = $_POST['address'];
$contact = $_POST['contact'];
$geom = $_POST['geom'];

$sql = mysqli_query($conn, "UPDATE hotel set name='$nama', address='$address', contact=$contact, geom=ST_GeomFromText('$geom') where id_hotel='$id'") or die(mysqli_error($conn));
   


    if ($sql) 
    {
        echo"<script>
        alert ('Data Updated!');
        eval(\"parent.location='../?page=hotelDetail&id=$id'\");
        </script>";
    } else{
        echo "<script>alert('Error');
        eval(\"parent.location='../?page=formUpdateHotel&id=$id'\");
        </script>";
    }
    

?>
