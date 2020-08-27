<?php
include ('../connect.php');  

$objek = $_GET["objek"];
$district = $_GET["district"];


if($objek == '1')
{
	$querysearch = "select a.id_souvenir, a.name, st_x(st_centroid(a.geom)) as lon,st_y(st_centroid(a.geom)) as lat  from souvenir a, district  where st_contains(district.geom, a.geom) and district.id_district='$district'";

$result=mysqli_query($conn, $querysearch);
while($row = mysqli_fetch_array($result))
    {
        $id_district=$district;
        $id=$row['id_souvenir'];
        $name=$row['name'];
        $dataarray[]=array('id'=>$id, 'id_district'=>$id_district, 'name'=>$name);
    }
echo json_encode ($dataarray);


}
 else if ($objek == '2')
{
	$querysearch1 = "select a.id_worship_place, a.name, st_x(st_centroid(a.geom)) as lon,st_y(st_centroid(a.geom)) as lat  from worship_place a, district  where st_contains(district.geom, a.geom) and district.id_district='$district'";

$result=mysqli_query($conn, $querysearch1);
while($row = mysqli_fetch_array($result))
    {
        $id_district=$district;
        $id=$row['id_worship_place'];
        $name=$row['name'];
        $dataarray1[]=array('id'=>$id, 'id_district'=>$id_district, 'name'=>$name);
    }
echo json_encode ($dataarray1);
} 

else if ($objek == '3')
{
	$querysearch2 = "select a.id_restaurant, a.name, st_x(st_centroid(a.geom)) as lon,st_y(st_centroid(a.geom)) as lat  from restaurant a, district  where st_contains(district.geom, a.geom) and district.id_district='$district'";

$result=mysqli_query($conn, $querysearch2);
while($row = mysqli_fetch_array($result))
    {
        $id_district=$district;
        $id=$row['id_restaurant'];
        $name=$row['name'];
        $dataarray2[]=array('id'=>$id, 'id_district'=>$id_district, 'name'=>$name);
    }
echo json_encode ($dataarray2);
} 
else if ($objek == '5')
{
    $querysearch4 = "select a.id_hotel, a.name, st_x(st_centroid(a.geom)) as lon,st_y(st_centroid(a.geom)) as lat  from hotel a, district  where st_contains(district.geom, a.geom) and district.id_district='$district'";
$result=mysqli_query($conn, $querysearch4);
while($row = mysqli_fetch_array($result))
     {

         $id=$row['id_hotel'];
         $name=$row['name'];
         $longitude=$row['lon'];
          $latitude=$row['lat'];
          $dataarray4[]=array('id'=>$id, 'longitude'=>$longitude, 'latitude'=>$latitude, 
            'name'=>$name);
    
    }
echo json_encode ($dataarray4);
}

else 

{
$querysearch3 = "select a.id_tourism, a.name, st_x(st_centroid(a.geom)) as lon,st_y(st_centroid(a.geom)) as lat  from tourism a, district  where st_contains(district.geom, a.geom) and district.id_district='$district'";
$result=mysqli_query($conn, $querysearch3);
// $dataarray3=[];
while($row = mysqli_fetch_array($result))
    {
        
        
         $id=$row['id_tourism'];
         $name=$row['name'];
         $longitude=$row['lon'];
          $latitude=$row['lat'];
          $dataarray3[]=array('id'=>$id, 'longitude'=>$longitude, 'latitude'=>$latitude, 
            'name'=>$name);
    }
    //echo $load;
echo json_encode ($dataarray3);
 //echo var_dump($result);
}

?>