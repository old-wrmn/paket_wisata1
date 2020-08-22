<?php

include("../../connect.php");

$querysearch="SELECT id_package, name FROM package ORDER BY id_package ASC";

$result=mysqli_query($conn, $querysearch);

  while($baris = mysqli_fetch_array($result))
    {
        $id=$baris['id_package'];
        $nama=$baris['name'];

		    
        $dataarray[]=array('id'=>$id,'name'=>$nama);
    }
   echo json_encode ($dataarray);

