<?php
include ('../connect.php');
$regis = $_POST['regis'];
$id_user = $_POST['id_user'];
$username = $_POST['username'];
$password = $_POST['password'];
$email = $_POST['email'];
$address = $_POST['address'];
$contact = $_POST['contact'];
$role_id = $_POST['role_id'];


    $query = "insert into users (id_user, role_id, username, password, email, address, contact) values ('$id_user','$role_id','$username','$password','$email','$address','$contact')";

    $cek = mysqli_query($conn,$query);
    
    if($cek)
    {
      /*$_SESSION['admin']=true;
      header('Location:../admin');
      exit();*/
      header('Location:../login.php?reg=true');
    }
    else{
      echo "gagal";
    }
?>