<?php
include ('../../connect.php');

$cari = $_GET["cari"];

$querysearch    ="SELECT tourism.id_tourism, tourism.name, tourism.address, tourism.open, tourism.close, tourism.ticket, st_x(st_centroid(tourism.geom)) as lon, st_y(st_centroid(tourism.geom)) as lat from tourism where tourism.id_tourism ='$cari'";              

$hasil=mysqli_query($conn, $querysearch);

while($baris = mysqli_fetch_array($hasil)){
      $id=$baris['id_tourism'];
      $name=$baris['name'];
      $address=$baris['address'];
      $open=$baris['open'];
      $close=$baris['close'];
      $ticket=$baris['ticket'];
      // $tourism_type=$baris['tourism_type'];
      $longitude=$baris['lon'];
      $latitude=$baris['lat'];
      $dataarray[]=array('id'=>$id,'name'=>$name,'address'=>$address,'open'=>$open, 'close'=>$close,'ticket'=>$ticket,'longitude'=>$longitude,'latitude'=>$latitude);
}

    //DATA GALLERY
    $query_gallery="SELECT id_item, gallery_tourism FROM tourism_gallery where id_tourism = '".$cari."' "; 
    
    $hasil2=mysqli_query($conn, $query_gallery);
    
    while($baris = mysqli_fetch_array($hasil2)){
        $id_item=$baris['id_item'];
        $gallery_tourism=$baris['gallery_tourism'];
        $data_gallery[]=array('id_item'=>$id_item,'gallery_tourism'=>$gallery_tourism);
    }

    //DATA FASILITAS
    // $query_fasilitas="SELECT facility_tourism.id, facility_tourism.name FROM facility_tourism left join detail_facility_tourism on detail_facility_tourism.id_facility = facility_tourism.id left join tourism on tourism.id = detail_facility_tourism.id_tourism where tourism.id = '".$cari."' "; 
    
    // $hasil3=mysqli_query($conn, $query_fasilitas);
    
    // while($baris = mysqli_fetch_array($hasil3)){
    //     $id=$baris['id'];
    //     $name=$baris['name'];
    //     $data_fasilitas[]=array('id'=>$id,'name'=>$name);
    // }

    $arr=array("data"=>$dataarray, "gallery"=>$data_gallery);
    echo json_encode($arr);

?>
