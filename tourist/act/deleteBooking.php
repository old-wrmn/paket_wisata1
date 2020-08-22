<?php
  include ('../../connect.php');

      $id_booking=$_GET['id_booking'];
      $sql=mysqli_query($conn, "DELETE from detail_booking where id_booking = '$id_booking'");

      $sql2=mysqli_query($conn, "DELETE from booking where id_booking= '$id_booking'");

   if ($sql)
   {
   

    if ($sql2)
    {
    echo"<script>
          alert ('Data Deleted!');
          eval(\"parent.location='../?page=myBooking'\");
          </script>";
      }

   }
   
   else 
   {
    echo 'error';
   } 
    
  
?>