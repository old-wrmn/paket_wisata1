<?php

require '../connect.php';
$id = $_GET["id"];
?>

<div class="card col-xl-12">  
        <?php
            $query0 = "SELECT*FROM package where package.id_package='$id'";
            $query1 = "SELECT*FROM object_point where id_package='$id' ORDER BY object_point.no_urut ASC";

            $arr0 = array();
            $arr1 = array();
            $arr2 = array();
            $data0=mysqli_query($conn, $query0);
            while($row = mysqli_fetch_array($data0)){
              $arr0 = array(
                'id' => $row['id_package'],
                'name' => $row['name'],
                'price' => $row['price'],
                 'itinerary' => $row['itinerary']
              );
            } 

        ?>

  
      <header class="card-header">
        <h2 class="card-title" style="text-transform:capitalize;"><b> <?php echo $arr0['name']; ?></b></h2>
      </header>

      <div class="card-body">
        <div class="form-group form-group-float" style="text-align: left;">
            <input type="text" class="form-control" id="n0" value=<?php echo $arr0['id']; ?> hidden>
            <label class="form-group-float-label"><b>Package Name</b></label>
            <div class="input-group">
              <input type="text" name="name" class="form-control" id="n1" value=<?php echo $arr0['name']; ?> autofocus>
              <span class="input-group-append">
                <button class="btn btn-info" id='tombolup1' onclick='Up1()'>Update</button>
              </span>
            </div>
        </div>     

        <div class="form-group form-group-float" style="text-align: left;">
            <label class="form-group-float-label"><b>Price</b></label>
          <div class="input-group"> 
            <input type="number" name="price" class="form-control" id="n2" placeholder="Price (HANYA ANGKA)" value=<?php echo $arr0['price']; ?> >
            <span class="input-group-append">
              <button class="btn btn-info" id='tombolup2' onclick='Up2()'>Update</button>
            </span>
          </div>  
        </div> 

        <div class="form-group form-group-float" style="text-align: left;">
            <label class="form-group-float-label"><b>Itinerary</b></label>
            <div class="input-group">
              <textarea type="text" class="form-control" id="n7" rows='5' value=<?php echo $arr0['itinerary']; ?> autofocus><?php echo $arr0['itinerary']; ?></textarea>
              <span class="input-group-append">
                <button class="btn btn-info" id='tombolup1' onclick='Up4()'>Update</button>
              </span>
            </div>
        </div>  

        <div class="card col-md-12 bg-light">
          <div class="card-header header-elements-inline">
            <div class="header-elements">
              <div class="list-icons">
                <a class="list-icons-item" data-action="reload" id="reload"></a>
              </div>
            </div>
          </div>

          <a type="button" class="btn btn-outline bg-blue-400 text-blue-400 border-blue-400 mt-1 mb-3 col-xl-12" href="?page=formUpdateObjPackage&id=<?php echo $id ?>">Add Tourism Object</a>
          
        <table id="dataTable" class="table table-bordered table-hover datatable-highlight mb-3">
          <thead>
            <tr style="text-align: center;">
              <th>NO.</th>
              <th>Object</th>
              <th>District</th>
              <th>Distance</th>
              <th>Estimated Hour</th>
              <th>Action</th>               
            </tr>
          </thead>

            <?php

            $arr1 = array();
            $arr2 = array();
              $query = "SELECT * from package join object_point where package.id_package=object_point.id_package and package.id_package ='$id'";


                $data0=mysqli_query($conn, $query); $indexArray = 0;
                while($row = mysqli_fetch_array($data0)){
                $arr1[$indexArray] = array(
                $row['no_urut'],
                $row['id_souvenir'],
                $row['id_worship_place'],
                $row['id_restaurant'],
                $row['id_tourism'],
                $row['id_hotel'],
                $row['objek'],
                $row['lama_perjalanan'],
                $row['estimasi_waktu']
                ); $indexArray += 1;
                } 

                $a = count($arr1);

                $arr2[6] = "travel";
                $arr2[5] = "hotel";
                $arr2[4] = "tourism";
                $arr2[3] = "restaurant";
                $arr2[2] = "workship_place";
                $arr2[1] = "souvenir";
                for($i=0;$i<$a;$i++)  
                {
                $column = 0;
                
                    $query2="SELECT  
                     a.name AS n1,
                     b.name AS n2
                     FROM ".$arr2[$arr1[$i][6]]." AS a, district as b 
                     WHERE st_contains(b.geom, a.geom) and a.id_".$arr2[$arr1[$i][6]]." = '".$arr1[$i][$arr1[$i][6]]."'";

                    $data0=mysqli_query($conn, $query2);
                  
                    while($row = mysqli_fetch_array($data0))
                    {         
            ?>
            <tbody>     
              <tr>
                <td style="text-align: center; width: 5%"><?php echo $arr1[$i][0]; ?></td>
                <td style="width: 25%"><?php echo "$row[n1]"; ?></td>
                <td style="width: 20%"><?php echo "$row[n2]"; ?></td>
                <td style="width: 20%; text-align: center;"><?php echo $arr1[$i][7]; ?></td>
                <td style="width: 20%; text-align: center;"><?php echo $arr1[$i][8]; ?></td>
                <td style="width: 10%">
                  <input style="display: none;" id="<?php echo "datamodal".$arr1[$i][0]; ?>" value="<?php echo $arr1[$i][0].". ".$row['n1']." (".$row['n2'].")" ?>"/>
                  <input style="display: none;" id="<?php echo "dataisitime".$arr1[$i][0]; ?>" value="<?php echo $arr1[$i][6]; ?>" />    
                  <div class="btn-group">              
                  <button class="btn btn-outline bg-info-400 text-info-400 border-info-400 mr-1" id="<?php echo $arr1[$i][0]; ?>" data-toggle="modal" data-target="#myModal" onclick="getserial(this.id)"><i class="icon-pencil7"></i></button>
                  <button a id="<?php echo $arr1[$i][0]; ?>" class="btn btn-outline bg-danger-400 text-danger-400 border-danger-400 mr-1" onclick="deleto(<?=$arr1[$i][0];?>,this.id)" title='Delete'><i class="icon-trash"></i></button>
                  </div>
                </td>
              </tr>     
            </tbody>
            <?php }} ?>

        </table>
        </div>
              

      </div>

<!-- --------------------------------------------MODAL------------------------------------------------- -->
  <div id="myModal" class="modal fade" tabindex="-1">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header bg-warning">
          <h4 class="modal-title" id="judul">Update</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">

          <div class="form-group row" id="data0">
            <label for="example-search-input" class="col-sm-3 col-form-label">Choose district</label>
              <div class="col-sm-6">
                <input type="hidden" id="no_urut" value=""/>
                <select class="form-control select2" style="width: 100%;" id="district" onchange="cariobjek()">
                    <option value="0">-- Choose district --</option>
                      <?php
                        $sql = mysqli_query($conn, "select * from district");
                        while($row1 = mysqli_fetch_array($sql)){
                          echo "<option value=\"$row1[id_district]\">$row1[name]</option>";}
                      ?>
                  </select>
              </div>
          </div> 

          <div class="form-group row" id="data1">
            <label for="example-search-input" class="col-sm-3 col-form-label">Choose Object</label>
              <div class="col-sm-6">
                <select class="form-control select2" style="width: 100%;" id="n3" onchange="cariobjek()">
                    <option value="0">-- Choose Object --</option>
                    <option value="1">Souvenir</option>
                    <option value="2">Mosque</option>
                    <option value="3">Restaurant</option>
                    <option value="4">Tourism</option>
                    <option value="5">Hotel</option>
                  </select>
              </div>
          </div> 
            
          <div class="form-group row" id="data2">
            <label for="example-search-input" class="col-sm-3 col-form-label">Choose Place</label>
              <div class="col-sm-6">
                <select class="form-control select2" style="width: 100%;" id="n4"></select>
              </div>
          </div> 
          
          <div class="form-group row" id="data3">
            <label for="example-search-input" class="col-sm-3 col-form-label">Distance</label>
              <div class="col-sm-6">
                <input type="text" class="form-control" style="width: 100%;" id="n6" />
              </div>
          </div>

          <div class="form-group row" id="data3">
            <label for="example-search-input" class="col-sm-3 col-form-label">Estimated Hour</label>
              <div class="col-sm-6">
                <input type="text" class="form-control" style="width: 100%;" id="n9" />
              </div>
          </div> 

        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="Up3()">Save</button>
        </div>
      </div>

    </div>
  </div>
  <!-- --------------------------------------------MODAL------------------------------------------------- -->

</div>


<script type="text/javascript">
  function getserial(serial){
    var input = document.getElementById('no_urut');
    var isidm = "datamodal"+serial;
    var input2 = document.getElementById(isidm).value;
    var isitime = "dataisitime"+serial;
    var input3 = document.getElementById(isitime).value;
    var id_package = "<?php echo $id; ?>";
    input.value = serial;
    console.log("data id page :::::::::::::::: "+id_package);
    console.log("getserial fired with serial : "+serial);
    console.log("hai ini data  : "+input3);
    document.getElementById('judul').innerHTML = input2;
    // document.getElementById('n6').value = input3;

  }

function deleto(id_package, serial){
  var z = document.getElementById('n0').value;

  $.ajax({
    url: 'act/savePackage.php?data1=91&data2='+z+'&dats5='+serial,   
    data: "", 
    dataType: 'php', 
    cache: false, 
     success: function(data){
      $('#dataTable').DataTable().ajax.reload(null, false);
      // $('#dataTable').load( "http://localhost/paket_wisata/agen/index.php?page=formUpdatePackage&id=PKT001 #dataTable" );
    }
  });

}

   function RefreshTable() {
    var z = document.getElementById('n0').value;
       $( "#dataTable" ).load( "http://localhost/paket_wisata/agen/index.php?page=formUpdatePackage&id="+z+" #dataTable" );
   }

   $("#reload").on("click", RefreshTable);
  
  function cariobjek(){
      $('#n4').empty();
     
      var district = document.getElementById('district').value;
      var objek =document.getElementById('n3').value;
      
      if (objek!=0 && district!=0){
        $.ajax({url: "http://localhost/paket_wisata/agen/act/cariObjek.php?objek="+objek+"&district="+district, data: "", dataType:
         'json', success: function(rows){
          console.log(rows);
          console.log("http://localhost/paket_wisata/agen/act/cariObjek.php?objek="+objek+"&district="+district); 
            if (objek=="1") {
              // console.log("jalan1");
              for (var i in rows){

                var row = rows[i];
                var id = row.id;
                var name = row.name;
                console.log(id);
                console.log(name);
                $('#n4').append('<option value="'+id+'">'+name+'</option>');

              }
            }
            else if (objek=="2") 
            {
              for (var i in rows)
              {
                var row = rows[i];
                var id = row.id;
                var name = row.name;
                console.log(id);
                console.log(name);
                $('#n4').append('<option value="'+id+'">'+name+'</option>');
              }
            }
            else if (objek=="3")
            {
              for (var i in rows)
              {
                var row = rows[i];
                var id = row.id;
                var name = row.name;
                console.log(id);
                console.log(name);
                $('#n4').append('<option value="'+id+'">'+name+'</option>');
              }
            }
            else if (objek=="5") 
            {
              for (var i in rows)
              {
                var row = rows[i];
                var id = row.id;
                var name = row.name;
                console.log(id);
                console.log(name);
                $('#n4').append('<option value="'+id+'">'+name+'</option>');
              }
            }
            else 
            {
              for (var i in rows)
              {
                var row = rows[i];
                var id = row.id;
                var name = row.name;
                console.log(id);
                console.log(name);
                $('#n4').append('<option value="'+id+'">'+name+'</option>');
              }
            }

          }});//end ajax
        }//end if
}
var nourut=1;
function tampilobjek(){
      var cariobjek = document.getElementById('n4').value;
      if (cariobjek == '') {
        alert("Please Choose Object");
      } else {
        nourut++;
        var no = nourut-1;
        var district = document.getElementById('district').value;
        console.log(district);
        var objek =document.getElementById('objek').value;
        console.log(objek);
       

        paket_objek.push(objek);
        paket_id.push(cariobjek);

        console.log("4578945678945678902345678903456789034567890456789");
        console.log(paket_objek.length);
        console.log("4578945678945678902345678903456789034567890456789");
        for (var i = 0; i<paket_objek.length; i++) {
          console.log(paket_objek[i]);
          console.log(paket_id[i]);
        };

        var hasil = document.getElementById('cariobjek');
        var name = hasil.options[hasil.selectedIndex].text;
        var id = document.getElementById('objek').value;
        $('#hasilcaritempat').append("<tr><td>"+no+"</td><td>"+name+"</td><td>"+id+"</td></tr>");
        
      }

}
function Up1(){
  console.log('ok');
  var z = document.getElementById('n0').value;
  var a = document.getElementById('n1').value;
  $.ajax({
    url: "act/savePackage.php?data1=33&data2="+z+"&data3="+a, 
    dataType: 'json', 
     success: function(rows){
      alert('test');
    }
  });
}
function Up2(){
  var z = document.getElementById('n0').value;
  var a = document.getElementById('n2').value;
  $.ajax({url: "act/savePackage.php?data1=4&data2="+z+"&data3="+a, data: "", dataType: 'json', success: function(rows){}});
}
function Up3(){
  var z = document.getElementById('n0').value;
  var a = document.getElementById('n3').value;
  var b = document.getElementById('n4').value;
  var g = document.getElementById('no_urut').value;
  var h = document.getElementById('n6').value;
 var j = document.getElementById('n9').value;
  console.log("serial number :"+g);
  $.ajax({url: "act/savePackage.php?dats1=5&dats2="+z+"&dats3="+a+"&dats4="+b+"&dats5="+g+"&dats6="+h+"&dats7="+j, data: "", dataType: 'json', success: function(rows){
  }});
  window.location.href = "?page=formUpdatePackage&id=<?php echo $id; ?>";
}
function Up4(){
  var z = document.getElementById('n0').value;
  var a = document.getElementById('n7').value;
  $.ajax({url: "act/savePackage.php?data1=44&data2="+z+"&data3="+a, data: "", dataType: 'json', success: function(rows){}});
  //window.location.href = "updatepaket.php?id=<?php echo $id; ?>";
  //alert('berhasil');
  console.log("serial number :"+a,z);
  console.log("act/savePackage.php?data1=44&data2="+z+"&data3="+a)
}  
</script>


    <!-- Theme JS files -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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
    <!-- /theme JS files