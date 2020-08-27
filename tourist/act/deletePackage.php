<?php
include ('../../connect.php'); 

      $id=$_GET['id'];
      $gallery =mysqli_query($conn, "DELETE from package_gallery where id_package = '$id'");
      $object =mysqli_query($conn, "DELETE from object_point where id_package = '$id'");
      $detail_booking =mysqli_query($conn, "DELETE from detail_booking where id_package = '$id'");

      $sql= mysqli_query($conn, "DELETE from package where id_package= '$id'");
      if($sql)
      {
        echo"<script>
        alert ('Data Deleted!');
        eval(\"parent.location='../?page=customPackage'\");
        </script>"; 
      }
      else
      {
        echo"<script>alert ('Failed to Delete Data!');</script>";
      }
    
  
?>