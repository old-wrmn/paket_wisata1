<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
  <title>Login</title>

  <!-- Global stylesheets -->
  <link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
  <link href="global_assets/css/icons/icomoon/styles.css" rel="stylesheet" type="text/css">
  <link href="global_assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="global_assets/css/bootstrap_limitless.min.css" rel="stylesheet" type="text/css">
  <link href="global_assets/css/layout.min.css" rel="stylesheet" type="text/css">
  <link href="global_assets/css/components.min.css" rel="stylesheet" type="text/css">
  <link href="global_assets/css/colors.min.css" rel="stylesheet" type="text/css">
  <!-- /global stylesheets -->
</head>

  <body background="_foto/1.jpg">

      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <center>
        <form class="mt-5" action="act/session.php" method="post" style="width: 25%;">
          <div class="card">
            <div class="card-header">
                <center>
                  <h1 class="card-title bg-teal-400">SIGN IN</h1>                  
                </center>
            </div>

            <div class="card-body">
              <div class="form-group">
                <label><b>Username:</b></label>
                <input type="text" class="form-control" name="username" style="text-align: center;" placeholder="" autofocus>
              </div>

              <div class="form-group">
                <label><b>Your Password:</b></label>
                <input type="password" class="form-control" name="password" style="text-align: center;" placeholder="">
              </div>
              <p class="ml-0" style="text-align: left;">Belum punya akun? Daftar <a href="regis.php">di sini</a></p>
            </div>            

            <div class="card-footer d-flex justify-content-between align-items-center bg-teal-400 border-top-0">
              <a href="index.php" class="btn btn-outline bg-white text-white border-white border-2">Back</a>
              <button type="submit" name="submit" class="btn btn-outline bg-white text-white border-white border-2">Login <i class="icon-paperplane ml-2"></i></button>
            </div>
          </div>
        </form>
      </center>

    <!-- js placed at the end of the document so the pages load faster -->
      <!-- Core JS files -->
      <script src="global_assets/js/main/jquery.min.js"></script>
      <script src="global_assets/js/main/bootstrap.bundle.min.js"></script>
      <script src="global_assets/js/plugins/loaders/blockui.min.js"></script>
      <script src="global_assets/js/plugins/ui/ripple.min.js"></script>
      <!-- /core JS files -->

      <!-- Theme JS files -->
      <script src="global_assets/js/app.js"></script>
      <script src="global_assets/js/plugins/forms/styling/switchery.min.js"></script>
      <script src="global_assets/js/demo_pages/maps/google/markers/animation.js"></script>  
      <script src="global_assets/js/plugins/forms/selects/select2.min.js"></script>
      <script src="global_assets/js/plugins/forms/styling/uniform.min.js"></script>
      <script src="global_assets/js/demo_pages/form_layouts.js"></script>

      <script src="global_assets/js/app.js"></script>
      <script src="global_assets/js/demo_pages/form_actions.js"></script>
      <!-- /theme JS files -->

    <!--BACKSTRETCH-->
    <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->

  </body>

</html>