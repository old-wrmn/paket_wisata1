<?php
session_start();
    if(isset($_GET['username']))
    {
    	$username = $_SESSION['username'];
    }
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
	<link href="global_assets/css/icons/icomoon/styles.css" rel="stylesheet" type="text/css">
	<link href="global_assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="global_assets/css/bootstrap_limitless.min.css" rel="stylesheet" type="text/css">
	<link href="global_assets/css/layout.min.css" rel="stylesheet" type="text/css">
	<link href="global_assets/css/layout.css" rel="stylesheet" type="text/css">
	<link href="global_assets/css/components.min.css" rel="stylesheet" type="text/css">
	<link href="global_assets/css/colors.min.css" rel="stylesheet" type="text/css">

	<!-- /global stylesheets -->

	<!-- Slider CSS -->
	<link href="global_assets/css/slider.css" rel="stylesheet" type="text/css">

	<!-- Core JS files -->
	<script src="global_assets/js/main/jquery.min.js"></script>
	<script src="global_assets/js/main/bootstrap.bundle.min.js"></script>
	<script src="global_assets/js/plugins/loaders/blockui.min.js"></script>
	<script src="global_assets/js/plugins/ui/ripple.min.js"></script>
	<!-- /core JS files -->

	<!-- Theme JS files -->
	<script src="global_assets/js/app.js"></script>
	<script src="global_assets/js/demo_pages/maps/google/markers/animation.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBNnzxae2AewMUN0Tt_fC3gN38goeLVdVE"></script>

	<!-- /theme JS files -->


    <script src="config_public.js"></script>
    <script src="_map.js"></script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBNnzxae2AewMUN0Tt_fC3gN38goeLVdVE&sensor=true"></script>


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

			<span class="navbar-text ml-md-3">
				<span class="badge badge-mark border-orange-300 mr-2"></span>
				Selamat Datang
			</span>

			<ul class="navbar-nav ml-md-auto">
				<li class="nav-item">
					<a href="login.php" class="navbar-nav-link">
						<i class="icon-make-group mr-2"></i>
						Login
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


			<!-- Sidebar content -->
			<div class="sidebar-content">

				

				<!-- Main navigation -->
				<div class="card card-sidebar-mobile">
					<ul class="nav nav-sidebar" data-nav-type="accordion">

						<!-- Main -->
						<li class="nav-item-header">
							<div class="text-uppercase font-size-s font-weight-bold line-height-s">MENU
						</div><i class="icon-menu" title="Main"></i></li>
						<li class="nav-item">
							<a href="index.php" class="nav-link active">
								<i class="icon-home4"></i>
								<span>
									HOME
								</span>
							</a>
						</li>
						<li class="nav-item">
	                    	<a href="javascript:;" class="nav-link" id="showall" onclick="tampilsemua()">
	                    		<i class="icon-list"></i>
	                          	<span>All Package</span>
	                    	</a>
		                </li> 

		                <li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link"><i class="icon-copy"></i> <span>Search by Name Package</span></a>

							<ul class="nav nav-group-sub" data-submenu-title="Layouts">								
								<ul class="sub">
									<input type="text" class="form-control" placeholder="Name" id="nama_paket">
									<span class="input-group-btn">									
									<button type="button" class="btn btn-default icon-search4" title="Cari" value="caripaket" onclick="caripaket1();"><i class="fa fa-search"></i></button>
								</ul>				
							</ul>
						</li>

						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link"><i class="icon-copy"></i> <span>Search by Name Destination</span></a>

							<ul class="nav nav-group-sub" data-submenu-title="Layouts">								
								<ul class="sub">
									<div class="form-group row">								
										<div class="col-lg-9">
											<select class="form-control form-control-select2" data-fouc>
												<optgroup label="Choose Region">
													<option value="AK">Alaska</option>
													<option value="HI">Hawaii</option>
												</optgroup>												
											</select>
											<select class="form-control form-control-select2" data-fouc>
												<optgroup label="Choose Object">
													<option value="AK">Alaska</option>
													<option value="HI">Hawaii</option>
												</optgroup>												
											</select>
										</div>
									</div>										
									<button type="button" class="btn btn-default icon-search4" title="Cari" value="caripaket" onclick="caripaket1();"><i class="fa fa-search"></i></button>
								</ul>				
							</ul>
						</li>

						<li class="nav-item nav-item-submenu">
				          <a href="#" class="nav-link"><i class="icon-compass4"></i> <span>Tourism Around You</span></a>
				          
				          <ul class="nav nav-group-sub">
				            <ul class="nav-item">
				                <div class=" form-group" style="color: #26a69a; ; padding-left: 18px" > 

				                <label for="inputradius" style="font-size: 10pt";>Radius : </label>
				                <label  id="nilai"  style="font-size: 10pt";>0</label> m
				                <div></div>
				                <input  type="range" onchange="init();tourism_sekitar_user();cekkk();" id="inputradius" 
				                        name="inputradius" data-highlight="true" min="0" max="20" value="0" >
				                <script>
				                  function cekkk()
				                  {
				                    document.getElementById('nilai').innerHTML=document.getElementById('inputradius').value*100
				                  }
				                </script>
				              </div>
				            </ul> 
				          </ul>
				        </li>								
						<!-- /main -->
					</ul>
				</div>
				<!-- /main navigation -->

			</div>
			<!-- /sidebar content -->
			
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

<!------------------------------------------------------------------------------------------------------------------------------------->
<!-- MENAMPILKAN PETA -->

			<!-- Content area -->
			<div class="content">

				<!-- Main charts -->
				<div class="row">
					<div class="col-xl-8">
                           
 					<!-- google maps with location list -->
						<div class="card">
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
							<div class="centered" id="map" style="height:460px"></div>
						</div>
					<!-- /google maps with location list -->
					</div>

					<div class="col-xl-4">
						<div class="card"  id="galleryrecommendxxx">
						  <div  class="col-md-12 col-sm-12 mb">
						  	<div class="white-panel pns" style="height: 300px">	
					            <div class="card-header">
					                <center>
					                  <h2 class="card-title bg-teal-400">Tourism Recommendation</h2>                  
					                </center>
					            </div>

						       <div class="imam-slider" id="gallery1">
						        <div class="isi-slider">
						          <a href="#" onclick="galeri1('tw001')"><img src="../_foto/pam.jpg"></a>
						          <a href="#" onclick="galeri1('tw011')"><img src="../_foto/pam.jpg"></a>
						          <a href="#" onclick="galeri1('tw004')"><img src="../_foto/pam.jpg"></a>
						          <a href="#" onclick="galeri1('tw005')"><img src="../_foto/pam.jpg"></a>
						        </div>
						       </div>
						    </div>
						  </div>                
						</div>
			            
						<div class="card">
	                    <!-- DATA TABLE -->
							<div id="view_kanan_table" class="col-md-12 col-sm-12 mb" style="display:none;">
								<div class="white-panel pns" style="height: 495px">
								   <div class="white-header" style="height:40px;margin:20px; background:#26a69a; color:black">
								     <h5 class="btn btn-default" style="color: white; width: 100%; " id="judul_table">List Tourism</h5>
								   </div>

								   <div style="height:410px; overflow-y: scroll; margin:20px;">
								      <table style="color:black" class="table table-bordered">
								        <tbody id='kanan_table'></tbody>
								      </table>
								   </div>
								</div>
							</div>

							<div id="view_kanan_table1" class="col-md-12 col-sm-12 mb" style="display:none;">
		                        <div class="white-panel pns" style="height: 350px; ">
		                           <div class="white-header" style="height:40px;margin:20px;background:#26a69a;color:black">
		                             <h5 class="btn btn-default" style="color: white; width: 100%; " id="judul_table">Object Arround</h5>
		                           </div>
									
		                           <div style=" margin:20px;">
		                              <table style="color:black" class="table" border="0">
		                                <tbody id='kanan_table1'></tbody>
		                              </table>
		                           </div>
		                        </div>
	                      	</div>

                   		<!-- DATA TABLE OBJEK SEKITAR-->
							<div id="view_table_sekitar" class="col-md-12 col-sm-12 mb" style="display:none">
								<div class="white-panel pns">
								   <div class="white-header" style="height:40px;margin:20px;background: #26a69a;color:black">
								     <h5 class="btn btn-default" style="color: white; width: 275px; ">Search Results Object Around</h5>
								   </div>

								   <div style="margin:20px; overflow-y: scroll;">
								      <table id="table_hotel" class="table table-bordered">
								        <tbody id='table_kanan_hotel' style='color:black'></tbody>
								      </table>  
								      <table id="table_tourism" class="table table-bordered">
								        <tbody id='table_kanan_tourism' style='color:black'></tbody>
								      </table>  
								      <table id="table_worship" class="table table-bordered">
								        <tbody id='table_kanan_worship' style='color:black'></tbody>
								      </table>  
								      <table id="table_souvenir" class="table table-bordered">
								        <tbody id='table_kanan_souvenir' style='color:black'></tbody>
								      </table>  
								      <table id="table_culinary" class="table table-bordered">
								        <tbody id='table_kanan_culinary' style='color:black'></tbody>
								      </table>  
								      <table id="table_industry" class="table table-bordered">
								        <tbody id='table_kanan_industry' style='color:black'></tbody>
								      </table>  
								      <table id="table_restaurant" class="table table-bordered">
								        <tbody id='table_kanan_restaurant' style='color:black'></tbody>
								      </table>  
								      <table id="table_angkot" class="table table-bordered">
								        <tbody id='table_kanan_angkot' style='color:black'></tbody>
								      </table>  
								   </div>
								</div>
							</div>
						
						</div>
					</div>
				</div>		
			</div>
			<!-- /content area -->



<!-- END MENAMPILKAN PETA -->
<!------------------------------------------------------------------------------------------------------------------------------------->

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
						 <a href="#">Muhammad Imam Sutria</a> - <a href="#" target="_blank">1511521023</a> &copy; 2019
					</span>
<!-- 					<ul class="navbar-nav ml-lg-auto">
						<li class="nav-item"><a href="https://kopyov.ticksy.com/" class="navbar-nav-link" target="_blank"><i class="icon-lifebuoy mr-2"></i> Support</a></li>
						<li class="nav-item"><a href="http://demo.interface.club/limitless/docs/" class="navbar-nav-link" target="_blank"><i class="icon-file-text2 mr-2"></i> Docs</a></li>
						<li class="nav-item"><a href="https://themeforest.net/item/limitless-responsive-web-application-kit/13080328?ref=kopyov" class="navbar-nav-link font-weight-semibold"><span class="text-pink-400"><i class="icon-cart2 mr-2"></i> Purchase</span></a></li>
					</ul> -->
				</div>
			</div>
			<!-- /footer -->

		</div>
		<!-- /main content -->

	</div>
	<!-- /page content -->
	</div>


</body>
</html>
