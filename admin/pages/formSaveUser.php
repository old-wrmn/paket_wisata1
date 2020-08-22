
    <!-- Text inputs -->

        <div class="card mt-2" style="width: 100%;">   
        <div class="card-header">
            <center>
                <h2 class="card-title bg-teal-400">REGISTRATION</h2>
            </center>
        </div>       
        <form action="act/registration.php" method="POST">
            <div class="card-body">
                <div class="form-group form-group-float" style="text-align: left;">
                <?php                
                    $query = "SELECT MAX(id_user) AS id_user FROM users";
                    $result = mysqli_query($conn,$query);
                    $data = mysqli_fetch_array($result);
                    $id_user = $data['id_user'];                                        
                    $noUrut = (int) substr($id_user, 3, 3);
                    $noUrut++;
                    $char = "usr";
                    // if ($id_user==$result) {$id_user=1;}
                    // else {$id_user++;}
                    
                    // $id_user = $char . sprintf("%03s", $id_user);
                    $id_user = $char . sprintf("%03s", $noUrut);
                ?>
                    <label class="form-group-float-label"><b>User ID</b></label>
                    <input type="text" name="id_user" class="form-control" readonly value="<?php echo $id_user; ?>">
                </div>
                <div class="form-group form-group-float" style="text-align: left;">
                    <label class="form-group-float-label"><b>Username</b></label>
                    <input type="text" name="username" class="form-control" placeholder="Username" autofocus>
                </div>

                <div class="form-group form-group-float" style="text-align: left;">
                    <label class="form-group-float-label"><b>Password</b></label>
                    <input type="password" name="password" class="form-control" placeholder="Password">
                </div>

<!--                 <div class="form-group form-group-float">
                    <div class="col-lg-12">    
                        <label class="form-group-float-label"><b>Role</b></label>           
                        <select class="form-control form-control-lg" name="role_id">
                          <option value="#">Pilih Role</option>
                      <?php
                        $sql = mysqli_query($conn, "SELECT role_id, name FROM role");
                        while($data =  mysqli_fetch_array($sql)){
                          $idrole = $data['role_id'];
                          $name = $data['name'];
                        ?>  

                          <option value="<?php echo "$idrole" ?>"><?php echo "$name" ?></option>

                      <?php } ?>
                        </select>
                    </div>
                </div>   -->             

                <div class="col-md-6">
                  <div class="form-group">
                    <label class="font-weight-semibold mt-2">Pilih Role</label>
                                          <?php
                        $sql = mysqli_query($conn, "SELECT role_id, name FROM role");
                        while($data =  mysqli_fetch_array($sql)){
                          $idrole = $data['role_id'];
                          $name = $data['name'];
                        ?>  
                    <div class="form-check">
                      <label class="form-check-label">
                        <input type="radio" class="form-check-input" value="<?php echo "$idrole" ?>" name="role_id" checked>
                        <?php echo "$name" ?>
                      </label>
                    </div>
                      <?php } ?>

                  </div>
                </div>  

                <div class="form-group form-group-float" style="text-align: left;">
                    <label class="form-group-float-label"><b>E-mail</b></label>
                    <input type="text" name="email" class="form-control" placeholder="E-mail">
                </div>

                <div class="form-group form-group-float" style="text-align: left;">
                    <label class="form-group-float-label"><b>Address</b></label>
                    <input type="text" name="address" class="form-control" placeholder="Address">
                </div>

                <div class="form-group form-group-float" style="text-align: left;">
                    <label class="form-group-float-label"><b>Phone Number</b></label>
                    <input type="number" name="contact" class="form-control" placeholder="Phone Number">
                </div>                                        
            </div>
            <div class="card-footer d-flex justify-content-between align-items-center bg-teal-400 border-top-0">
              <a href="?page=user" class="btn btn-outline bg-white text-white border-white border-2">Back</a>
              <button type="submit" name="regis" class="btn btn-outline bg-white text-white border-white border-2">Submit <i class="icon-paperplane ml-2"></i></button>
            </div>
        </form>  
        </div>

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
