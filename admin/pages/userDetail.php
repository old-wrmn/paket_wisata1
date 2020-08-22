<?php
require '../connect.php';
$id = $_GET["id"];
//echo "woiiiiiiiiiiiiiiiiiiiii $id";
//DATA hotel
$query = "SELECT * from users where id_user ='$id'";
$hasil=mysqli_query($conn, $query);
while($baris = mysqli_fetch_array($hasil)){
  $id=$baris['id_user'];
  $roleid=$baris['role_id'];
  $username=$baris['username'];
  $mail=$baris['email'];
  $address=$baris['address'];
  $contact=$baris['contact'];
  // $tourism_type=$baris['tourism_type'];
}
?>

<center>
<div class="card col-md-4" id="galleryrecommendxxx">
	<div class="slider" id="gallery1">
		<div class="isi-slider">
		  <a href="#" onclick="galeri1('tw001')"><img src="../_foto/sitinur.jpg"></a>
		  <a href="#" onclick="galeri1('tw011')"><img src="../_foto/pam.jpg"></a>
		  <a href="#" onclick="galeri1('tw004')"><img src="../_foto/sitinur.jpg"></a>
		  <a href="#" onclick="galeri1('tw005')"><img src="../_foto/pam.jpg"></a>
		</div>
	</div>
</div>
<a href="?page=formUpdateUser&id=<?php echo $id ?>" class="btn btn-round btn-warning mb-2"><i class="icon-pencil7 mr-1"></i>Update Data</a>
</center>

<div class="card">
	<table  class="ml-3 mt-3">
		<tbody style='vertical-align:top;'>
			<tr><td><b>Name</b></td><td>:</td><td><?php echo $username ?></td></tr>			
			<tr><td><b>E-mail</b></td><td>:</td><td><?php echo $mail ?></td></tr>	
			<tr><td width="150px"><b>Address</b></td><td> :&nbsp; </td><td style='text-transform:capitalize;'><?php echo $address ?></td></tr>					
			<tr><td><b>contact<b> </td><td>: </td><td><?php echo $contact ?></td></tr>
			<tr><td><a href="?page=formsetF&id=<?php echo $id ?>" class="btn btn-round btn-warning"><i class="fa fa-edit"></i> Set Facility</a></td></tr></tr>
			<tr><td><br></td></tr>
		</tbody>					
	</table>
</div>