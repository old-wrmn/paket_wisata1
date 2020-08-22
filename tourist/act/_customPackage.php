<?php
include ('../../connect.php');
$id_package = $_GET["id_package"];
$id_user = $_GET["id_user"];

$query = mysqli_query($conn,"SELECT MAX(id_package) AS id FROM package");
$result = mysqli_fetch_array($query);
$idmax = $result['id'];
$noUrut = (int) substr($idmax, 3, 3);
$noUrut++;
$char = "PKT";
$idmax = $char . sprintf("%03s", $noUrut);

$query0 = mysqli_query($conn, "insert into package (id_package, id_user) 
								values ('".$idmax."', '".$id_user."')");

$select1 = mysqli_query($conn, "SELECT * from package where id_package='".$id_package."'");
$baris = mysqli_fetch_array($select1);
	$id = $baris['id_package'];
    $name=$baris['name'];
    $price=$baris['price'];
    $itinerary=$baris['itinerary'];
    // $dataarray[]=array('id_package'=>$id, 'name'=>$name, 'price'=>$price,'itinerary'=>$itinerary);
    // echo json_encode($dataarray);

$select2 = mysqli_query($conn, "SELECT username FROM users where id_user='".$id_user."'"); 
$baris = mysqli_fetch_array($select2);
	$nameuser =$baris['username'];  
	// $dataarray1[]=array('name'=>$nameuser);
	// echo json_encode($dataarray1); 

$namenew = $name." Custom: ".$nameuser;
// echo "$namenew";

$query1 = mysqli_query($conn, "update package set name='".$namenew."', price='0', itinerary='".$itinerary."'where id_package='".$idmax."'");

$query2 = mysqli_query($conn, "insert into object_point 
								(no_urut, 
								id_package, 
								objek, 
								id_restaurant, 
								id_worship_place, 
								id_souvenir, 
								id_hotel, 
								id_tourism, 
								lama_perjalanan, 
								estimasi_waktu ) 
							SELECT 
								no_urut, 
								'".$idmax."', 
								objek, 
								id_restaurant, 
								id_worship_place, 
								id_souvenir, 
								id_hotel, 
								id_tourism, 
								lama_perjalanan, 
								estimasi_waktu
								FROM object_point
								where id_package='".$id_package."'");

if(mysqli_query($conn, $query2))
      {
        echo"<script>
        alert ('Data Deleted!');
        eval(\"parent.location='../?page=customPackage'\");
        </script>"; 
      }

?>