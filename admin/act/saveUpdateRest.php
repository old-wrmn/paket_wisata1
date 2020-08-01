<?php
include ('../../connect.php');
$id = $_POST['id'];
$nama = $_POST['name'];
$address = $_POST['address'];
$open = $_POST['open'];
$close = $_POST['close'];
$desc = $_POST['description'];
$geom = $_POST['geom'];

$sql = mysqli_query($conn, "UPDATE restaurant set name='$nama', address='$address', open='$open', close='$close', description='$desc', geom=ST_GeomFromText('$geom') where id_restaurant='$id'") or die(mysqli_error($conn));
   


    if ($sql) 
    {
        echo"<script>
        alert ('Data Updated!');
        eval(\"parent.location='../?page=restaurantDetail&id=$id'\");
        </script>";
    } else{
        echo "<script>alert('Error');
        eval(\"parent.location='../?page=formUpdateRest&id=$id'\");
        </script>";
    }
    

?>
