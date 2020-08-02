<?php
include ('../../connect.php');
$id = $_POST['id'];
$username = $_POST['username'];
$password = $_POST['password'];
$email = $_POST['email'];
$address = $_POST['address'];
$contact = $_POST['contact'];
// $role_id = $_POST['role_id'];

$sql = mysqli_query($conn, "UPDATE users set username='$username', password='$password', email='$email', address='$address', contact=$contact where id_user='$id'") or die(mysqli_error($conn));
   


    if ($sql) 
    {
        echo"<script>
        alert ('Data Updated!');
        eval(\"parent.location='../?page=userDetail&id=$id'\");
        </script>";
    } else{
        echo "<script>alert('Error');
        eval(\"parent.location='../?page=formUpdateUser&id=$id'\");
        </script>";
    }
    

?>
