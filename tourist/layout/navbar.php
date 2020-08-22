<?php
session_start();
if(!isset($_SESSION['C'])){
  echo"<script language='JavaScript'>document.location='../login.php'</script>";
    exit();
}
include $_SERVER['DOCUMENT_ROOT'].'/paket_wisata/connect.php';
require_once  'ti.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Halal Tourism • Padang</title>

	<!-- Global stylesheets -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
	<link href="../global_assets/css/icons/icomoon/styles.css" rel="stylesheet" type="text/css">
	<link href="../global_assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="../global_assets/css/bootstrap_limitless.min.css" rel="stylesheet" type="text/css">
	<link href="../global_assets/css/layout.min.css" rel="stylesheet" type="text/css">
	<link href="../global_assets/css/layout.css" rel="stylesheet" type="text/css">
	<link href="../global_assets/css/components.min.css" rel="stylesheet" type="text/css">
	<link href="../global_assets/css/colors.min.css" rel="stylesheet" type="text/css">

	<!-- /global stylesheets -->

	<!-- Slider CSS -->
	<link href="../global_assets/css/slider.css" rel="stylesheet" type="text/css">

	<!-- Core JS files -->
	<script src="../global_assets/js/main/jquery.min.js"></script>
	<script src="../global_assets/js/main/bootstrap.bundle.min.js"></script>
	<script src="../global_assets/js/plugins/loaders/blockui.min.js"></script>
	<script src="../global_assets/js/plugins/ui/ripple.min.js"></script>
	<script src="../global_assets/js/plugins/tables/datatables/datatables.min.js"></script>
	<script src="../global_assets/js/demo_pages/datatables_advanced.js"></script>
	<!-- /core JS files -->

	<!-- Theme JS files -->
	<script src="../global_assets/js/app.js"></script>
	<script src="../global_assets/js/demo_pages/maps/google/markers/animation.js"></script>
	<script src="../global_assets/js/plugins/forms/selects/select2.min.js"></script>
	<script src="../global_assets/js/plugins/forms/styling/uniform.min.js"></script>
	<script src="../global_assets/js/demo_pages/form_layouts.js"></script>
	<script src="../global_assets/js/demo_pages/form_inputs.js"></script>	
	<script src="../global_assets/js/demo_pages/components_media.js"></script>

	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBNnzxae2AewMUN0Tt_fC3gN38goeLVdVE"></script>

	<!-- /theme JS files -->


    <script src="../config_public.js"></script>
    <script src="../inc/_map.js"></script>
    <script src="../tourist/inc/_script.js"></script>
<!--     <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBNnzxae2AewMUN0Tt_fC3gN38goeLVdVE&sensor=true"></script>
 -->

<style type="text/css">
      #legend {
        background: white;
        padding: 15px;
        margin: 10px;
        font-size: 12px;
        font-color: black;
        font-family: Arial, sans-serif;
    }
    .color {
        border: 1px solid;
        height: 12px;
        width: 12px;
        margin-right: 3px;
        float: left;
        opacity: 0.7;
    }
    .a {
        background: #ff3300;
      }
    .b {
        background: #ffd777;
      }
    .c {
        background: #00b300;
      }
    .d {
        background: #618685;
      }
    .e {
        background: #337AFF;
      }
    .f {
        background: #FF9300;
      }
    .g {
        background: #FF00C1;
      }
    .h {
        background: #FF0000;
      }
    .i {
        background: #04FF00;
      }
    .j {
        background: #EC00FF;
      }
    .k {
        background: #0A0D85;
      }
    .l {
        background: navy;
      }
   </style>

    <!--LOADER-->
    <style>
    #loader {
      border: 16px solid #f3f3f3;
      border-radius: 50%;
      border-top: 16px solid #3498db;
      width: 40px;
      margin: 5px;
      height: 40px;
      -webkit-animation: spin 2s linear infinite;
      animation: spin 2s linear infinite;
    }

    @-webkit-keyframes spin {
      0% { -webkit-transform: rotate(0deg); }
      100% { -webkit-transform: rotate(360deg); }
    }

    @keyframes spin {
      0% { transform: rotate(0deg); }
      100% { transform: rotate(360deg); }
    }
    </style>


</head>

<body onload="init()" >

	<!-- Main navbar -->
	<div class="navbar navbar-expand-md navbar-dark bg-indigo navbar-static">
		<div class="navbar-brand">
			<a href="index.html" class="d-inline-block">
				<h5 style="color: white; margin: 0px"><b>WEBGIS</b> • Padang Tourism</h5>
			</a>
		</div>

		<div class="d-md-none">
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-mobile">
				<i class="icon-tree5"></i>
			</button>
			<button class="navbar-toggler sidebar-mobile-main-toggle" type="button">
				<i class="icon-paragraph-justify3"></i>
			</button>
		</div>

		<div class="collapse navbar-collapse" id="navbar-mobile">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a href="#" class="navbar-nav-link sidebar-control sidebar-main-toggle d-none d-md-block">
						<i class="icon-paragraph-justify3"></i>
					</a>
				</li>
			</ul>

			<?php
				$query = mysqli_query($conn,"SELECT username FROM users WHERE username='$_SESSION[username]'");
				$data = mysqli_fetch_assoc($query);					            	
	            	$username = $data['username'];			
			?>
			<span class="navbar-text ml-md-3">			
				<span class="badge badge-mark border-green-300 mr-2"></span>
				Selamat Datang, <b><?php echo "$username"; ?></b>
			</span>

			<ul class="navbar-nav ml-md-auto">
				<li class="nav-item">
					<a href="../logout.php" class="navbar-nav-link">
						<i class="icon-make-group mr-2"></i>
						Logout
					</a>					
				</li>
			</ul>
		</div>
	</div>
	<!-- /main navbar -->


	<!-- Page content -->
	<div class="page-content">

		<!-- Main sidebar -->
		<div class="sidebar sidebar-light sidebar-main sidebar-expand-md">

			<!-- Sidebar mobile toggler -->
			<div class="sidebar-mobile-toggler text-center">
				<a href="#" class="sidebar-mobile-main-toggle">
					<i class="icon-arrow-left8"></i>
				</a>
				<span class="font-weight-semibold">Navigation</span>
				<a href="#" class="sidebar-mobile-expand">
					<i class="icon-screen-full"></i>
					<i class="icon-screen-normal"></i>
				</a>
			</div>
			<!-- /sidebar mobile toggler -->


			

			<?php include ("menu.php"); ?>


			
		</div>
		<!-- /main sidebar -->

		<!-- Main content -->
		<div class="content-wrapper">

			<!-- Page header -->
			<div class="page-header page-header-light">

				<div class="breadcrumb-line breadcrumb-line-light header-elements-md-inline">
					<div class="d-flex">
						<div class="breadcrumb">
							<a href="index.php" class="breadcrumb-item"><i class="icon-home2 mr-2"></i> Home</a>
							<span class="breadcrumb-item active">
								Dashboard
							</span>
						</div>

						<a href="#" class="header-elements-toggle text-default d-md-none"><i class="icon-more"></i></a>
					</div>
					
				</div>
			</div>
			<!-- /page header -->

<!-- ------------------------------------------------------------------------------------------------------->
			<?php startblock('content') ?><?php endblock() ?>
<!-- ------------------------------------------------------------------------------------------------------->			


<!-- Footer -->
			<div class="navbar navbar-expand-lg navbar-light">
				<div class="text-center d-lg-none w-100">
					<button type="button" class="navbar-toggler dropdown-toggle" data-toggle="collapse" data-target="#navbar-footer">
						<i class="icon-unfold mr-2"></i>
						Footer
					</button>
				</div>

				<div class="navbar-collapse collapse" id="navbar-footer">
					<span class="navbar-text">
						 <a href="#">Malik A. Aziz Lubis</a> - <a href="#" target="_blank">1611521016</a> &copy; 2019
					</span>
				</div>
			</div>
			<!-- /footer -->

		</div>
		<!-- /main content -->

	</div>
	<!-- /page content -->
	</div>


</body>
<!-- 
	<script src="../global_assets/js/demo_pages/form_floating_labels.js"></script>
	<script src="../global_assets/js/plugins/forms/selects/bootstrap_multiselect.js"></script>
	<script src="../global_assets/js/plugins/forms/inputs/typeahead/typeahead.bundle.min.js"></script>
	<script src="../global_assets/js/plugins/forms/tags/tagsinput.min.js"></script>
	<script src="../global_assets/js/plugins/forms/tags/tokenfield.min.js"></script>
	<script src="../global_assets/js/plugins/forms/inputs/touchspin.min.js"></script>
	<script src="../global_assets/js/plugins/forms/inputs/maxlength.min.js"></script>
	<script src="../global_assets/js/plugins/forms/inputs/formatter.min.js"></script> -->

</html>
