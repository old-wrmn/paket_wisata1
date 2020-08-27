<?php 
include ('../../connect.php');
$id_package = $_GET["id_package"];

      $selesai = mysqli_query($conn, "SELECT COUNT(id_worship_place) as msq from object_point where id_package='$id_package'");
      $baris = mysqli_fetch_array($selesai);
      $msq = $baris['msq'];
      $dataarray[]=array('msq'=>$msq);
      echo json_encode ($dataarray);
?>


