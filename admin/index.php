<?php 
include $_SERVER['DOCUMENT_ROOT'].'/paket_wisata/admin/layout/navbar.php' 
?>

<?php startblock('title') ?>
<title>Home</title>
<?php endblock() ?>

<?php startblock('content') ?>	
<!-- Content area -->
<div class="content">


		      <?php
		      $p=isset($_GET['page']) ? $_GET['page'] : null;
		      $page="pages/".$p.".php";
		      if(file_exists($page)){
		        include($page);
		      }elseif($p==""){
		        include('pages/home.php');
		      }else{
		        include('pages/404.php');
		      }
		      ?>

			
</div>
<!-- /content area -->
<?php endblock() ?>			