<?php
include ('../../connect.php'); 

      $id=$_GET['id'];
      $gallery =mysqli_query($conn, "DELETE from video_package where id_package = '$id'");
      $object =mysqli_query($conn, "DELETE from object_point where id_package = '$id'");
      
      $sql="DELETE from package where id_package= '$id' ";
      if(mysqli_query($conn, $sql))
      {
        echo"<script>
        alert ('Data Deleted!');
        eval(\"parent.location='../?page=packageList'\");
        </script>"; 
      }
      else
      {
        echo"<script>alert ('Failed to Delete Data!');</script>";
      }
    
  
?>