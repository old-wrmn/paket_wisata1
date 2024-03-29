<!-- Animated markers --> 

  <div class="card col-sm-12">
    <div class="card-header header-elements-inline" style="padding-top: 5px; padding-bottom: 0px; padding-right: 5px;">
      <h4 class="card-title">
        <b>Mark Worship Place Locations</b>
      </h4>
        
        <header class="card-header" style="float:right; padding-top: 2px; padding-bottom: 1px; padding-right: 2px;">
          <div class="card-title">

            <input id="latlng" type="text" class="form-control" style="width:200px" value="" placeholder="Latitude, Longitude">

            <button class="btn btn-sm btn-outline bg-teal-400 text-teal-400 border-teal-400 mt-1 mb-1" id="btnlatlng" type="button" title="Geocode"><i class="icon icon-search4"></i></button>

            <button class="btn btn-sm btn-outline bg-danger-400 text-danger-400 border-danger-400 mt-1 mb-1 ml-2" id="delete-button" type="button" title="Remove shape"><i class="icon icon-close2"></i></button>

          </div>           
        </header>
    </div>
    <div class="centered" id="map" style="margin-bottom: 5px; z-index:50"></div>

    <!-- Horizontal form modal -->
    <div class="container">
    <button type="button" class="btn col-sm-12 btn-sm bg-blue-400 text-blue-400 border-blue-400 mt-0 mb-1 ml-0" data-toggle="modal" data-target="#modal_form_horizontal">Input Data<i class="icon-pencil7 ml-2"></i></button>

            <div id="modal_form_horizontal" class="modal fade" tabindex="-1">
              <div class="modal-dialog modal-lg">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title">Input Data</h5>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                  </div>

                  <form name="form_input" action="act/saveWorship.php" class="form-horizontal" enctype="multipart/form-data" method="POST">
                    <?php
                      include '../connect.php';
                          $query = mysqli_query($conn,"SELECT MAX(id_worship_place) AS id FROM worship_place");
                          $result = mysqli_fetch_array($query);
                          $idmax = $result['id'];
                          $noUrut = (int) substr($idmax, 3, 3);
                          $noUrut++;
                          $char = "WOR";
                          $idmax = $char . sprintf("%03s", $noUrut);
                    ?>
                    <div class="form-group row">
                      <!-- <label class="col-form-label col-sm-3">Last name</label> -->
                      <div class="col-sm-9">
                        <input type="hidden" class="form-control" id="id" name="id" value="<?php echo $idmax;?>">
                      </div>
                    </div>                

                    <div class="modal-body">
                      <div class="form-group row">
                        <label class="col-form-label col-sm-3">Coordinat</label>
                        <div class="col-sm-9">
                          <textarea type="text" id="geom" name="geom" class="form-control" readonly></textarea>
                        </div>
                      </div>

                      <div class="form-group row">
                        <label class="col-form-label col-sm-3">Name</label>
                        <div class="col-sm-9">
                          <input type="text" name="name" class="form-control">
                        </div>
                      </div>

                      <div class="form-group row">
                        <label class="col-form-label col-sm-3">Address</label>
                        <div class="col-sm-9">
                          <textarea type="text" name="address" class="form-control"></textarea>
                        </div>
                      </div>    
                                                                                                  
                      <div class="form-group row">
                        <label class="col-form-label col-sm-3">Description</label>
                        <div class="col-sm-9">
                          <textarea type="text" name="description" class="form-control"></textarea>
                        </div>
                      </div>                        
                    </div>

                    <div class="modal-footer">
                      <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
                      <button type="submit" class="btn bg-primary">Submit form</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
    </div>       
    <!-- /horizontal form modal --> 

  </div>

  <script type="text/javascript" src="inc/mapdraw.js"></script>