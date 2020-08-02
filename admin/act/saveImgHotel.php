<?php 
	include ('../../connect.php');
	$id = $_POST['id'];
	$querysearch="select id_item from hotel_gallery where id_hotel='$id' order by id_item desc limit 1";


	 $hasil=mysqli_query($conn, $querysearch);
	 $id_item = 1;
	 while($baris = mysqli_fetch_array($hasil))
	 {
	 	$angka = $baris['id_item'] + 1;
	 	$id_item = $angka;
	 }

	$jenis_gambar=$_FILES['image']['type'];
	if(($jenis_gambar=="image/jpeg" || $jenis_gambar=="image/jpg" || $jenis_gambar=="image/gif"  || $jenis_gambar=="image/png") && ($_FILES["image"]["size"] <= 5000000)){
		$sourcename=$_FILES["image"]["name"];
		$name=$sourcename;
		$name=$id.$id_item.".jpg";
		$filepath="../../_foto/".$name;
		move_uploaded_file($_FILES["image"]["tmp_name"],$filepath);
		$sqlGambar = mysqli_query($conn, "insert into hotel_gallery(id_item, id_hotel, gallery_hotel) values('$id_item','$id','$name')");
		if($sqlGambar){
			header("location:../index.php?page=hotelDetail&id=$id");
		}
	}

	else{
		echo "The Picture Isn't Valid!<br>";
		echo "Go Back To <a href='../index.php?page=hotelDetail&id=$id'></a>";
	}
?>