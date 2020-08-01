<?php
include ('../../connect.php');
$regis = $_POST['regis'];
$id_user = $_POST['id_user'];
$username = $_POST['username'];
$password = $_POST['password'];
$email = $_POST['email'];
$address = $_POST['address'];
$contact = $_POST['contact'];
$role_id = $_POST['role_id'];


    $query = "insert into users (id_user, role_id, username, password, email, address, contact) values ('$id_user','$role_id','$username','$password','$email','$address','$contact')";

    $sql = mysqli_query($conn,$query);
    
 if ($sql)
 {
  echo"<script>
        alert ('Data Added!');
        eval(\"parent.location='../?page=user'\");
        </script>";
 }
 else 
 {
  echo 'error';
 }
?>