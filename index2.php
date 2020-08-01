<?php 
session_start();
if(!isset($_SESSION['c'])){
  echo"<script language='JavaScript'>document.location='../login.php'</script>";
    exit();
}
include $_SERVER['DOCUMENT_ROOT'].'/paket_wisata/layout/navbar2.php' 
?>

<?php startblock('title') ?>
<title>Home</title>
<?php endblock() ?>

<?php startblock('content') ?>	
<!-- Content area -->
<div class="content">

	<!-- Animated markers -->	

	<div class="card col-8">
		<div class="card-header header-elements-inline" style="padding-top: 5px; padding-bottom: 0px; padding-right: 5px;">
			<h6 class="card-title">Google Map with Location List</h6>
				
				<header class="card-header" style="float:right; padding-top: 2px; padding-bottom: 1px; padding-right: 2px;">
                  <input type="hidden" id="myLatLocation" value="0">
                  <input type="hidden" id="myLngLocation" value="0">
                 
                  <a class="btn btn-default" role="button" data-toggle="collapse" onclick="posisisekarang()" title="Current Position" style="margin-right:5px; background: #26a69a "><i class="icon-pin" style="color: white;"></i></a>
                 
                  <a class="btn btn-default" role="button" data-toggle="collapse" onclick="lokasimanual()" title=" Manual Position" style="margin-right:5px; background: #26a69a"><i class="icon-pushpin" style="color: white ;"></i></a>
                  <label id="tombol">
                 
                  <a class="btn btn-default" role="button" id="showlegenda" data-toggle="collapse" onclick="legenda()" title="Legend" style="margin-right:5px; background: #26a69a"><i class="icon-eye" style="color: white ;"></i></a>
                 
                  </label>
                </header>
		</div>
		<div class="centered" id="map_marker_animation" style="height:460px"></div>
	</div>

	<!-- /animated markers -->
			
</div>
<!-- /content area -->
<?php endblock() ?>			