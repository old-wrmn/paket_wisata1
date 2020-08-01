
    <!-- Text inputs -->
    <center>
        <div class="card mt-2" style="width: 50%;">   
        <div class="card-header">
            <center>
                <h2 class="card-title bg-teal-400">REGISTRATION</h2>
            </center>
        </div>       
        <form action="act/saveUpdateUser.php" enctype="multipart/form-data" method="POST">
            <?php
              include '../connect.php';
                  if (isset($_GET['id']))
                    {
                      $id=$_GET['id'];
                      $sql = mysqli_query($conn,"SELECT 
                          users.id_user, 
                          users.username as nama,
                          users.password as pass,
                          users.email as mail, 
                          users.address, 
                          users.contact
                          FROM users
                          where users.id_user='$id'");
            
                    $data =  mysqli_fetch_array($sql);
                  }
            ?>

            <div class="card-body">            
                <div class="form-group form-group-float" style="text-align: left;">
                    <!-- <label class="form-group-float-label"><b>User ID</b></label> -->
                    <input type="text" name="id" class="form-control" readonly value="<?php echo $id;?>">
                </div>
                <div class="form-group form-group-float" style="text-align: left;">
                    <label class="form-group-float-label"><b>Username</b></label>
                    <input type="text" name="username" class="form-control" placeholder="Username" value="<?php echo $data['nama'] ?>" autofocus>
                </div>

                <div class="form-group form-group-float" style="text-align: left;">
                    <label class="form-group-float-label"><b>Password</b></label>
                    <input type="text" name="password" class="form-control" placeholder="Password" value="<?php echo $data['pass'] ?>">
                </div>              

                <div class="form-group form-group-float" style="text-align: left;">
                    <label class="form-group-float-label"><b>E-mail</b></label>
                    <input type="text" name="email" class="form-control" placeholder="E-mail" value="<?php echo $data['mail'] ?>">
                </div>

                <div class="form-group form-group-float" style="text-align: left;">
                    <label class="form-group-float-label"><b>Address</b></label>
                    <input type="text" name="address" class="form-control" placeholder="Address" value="<?php echo $data['address'] ?>">
                </div>

                <div class="form-group form-group-float" style="text-align: left;">
                    <label class="form-group-float-label"><b>Phone Number</b></label>
                    <input type="text" name="contact" class="form-control" placeholder="Phone Number" value="<?php echo $data['contact'] ?>">
                </div>                        
            </div>
            <div class="card-footer d-flex justify-content-between align-items-center bg-teal-400 border-top-0">
              <!-- <a href="login.php" class="btn btn-outline bg-white text-white border-white border-2">Back</a> -->
              <button type="submit" class="btn btn-outline bg-white text-white border-white border-2">Submit <i class="icon-paperplane ml-2"></i></button>
            </div>
        </form>  
        </div>
    </center>    
    <!-- /text inputs -->

    <!-- Core JS files -->
      <script src="../global_assets/js/main/jquery.min.js"></script>
      <script src="../global_assets/js/main/bootstrap.bundle.min.js"></script>
      <script src="../global_assets/js/plugins/loaders/blockui.min.js"></script>
      <script src="../global_assets/js/plugins/ui/ripple.min.js"></script>    
    <!-- /core JS files -->

    <!-- Theme JS files -->
    <script src="../global_assets/js/plugins/forms/inputs/inputmask.js"></script>
    <script src="../global_assets/js/plugins/forms/selects/select2.min.js"></script>
    <script src="../global_assets/js/plugins/forms/selects/bootstrap_multiselect.js"></script>
    <script src="../global_assets/js/plugins/forms/styling/uniform.min.js"></script>
    <script src="../global_assets/js/plugins/extensions/jquery_ui/core.min.js"></script>
    <script src="../global_assets/js/plugins/forms/inputs/typeahead/typeahead.bundle.min.js"></script>
    <script src="../global_assets/js/plugins/forms/tags/tagsinput.min.js"></script>
    <script src="../global_assets/js/plugins/forms/tags/tokenfield.min.js"></script>
    <script src="../global_assets/js/plugins/forms/inputs/touchspin.min.js"></script>
    <script src="../global_assets/js/plugins/forms/inputs/maxlength.min.js"></script>
    <script src="../global_assets/js/plugins/forms/inputs/formatter.min.js"></script>
    
    <script src="../global_assets/js/demo_pages/form_floating_labels.js"></script>
    <!-- /theme JS files -->
