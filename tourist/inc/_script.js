    var server = ipServerTourism;
    var map;
    var markersDua = [];
    var markersDkt = [];
    var centerBaru;
    var koordinat = null;
    var infoposisi= [];
    var centerLokasi;
    var markerposisi = [];
    var infoDua = [];
    var hapusMarkersDkt = [];
    var circles = [];
    var directionsDisplay = [];

// -----------------------------------------------------------------------------------------------------------------------
// --------------------------------------------- BOOKING ---------------------------------------------
// -----------------------------------------------------------------------------------------------------------------------



var booking_id = "";
var booking_price = "";

function booking(id,price){
  booking_id = id;
  booking_price = price;
  var user_id = document.getElementById('user_id').value;
  document.getElementById('id_package').value = booking_id;
  document.getElementById('custom').href = "act/_customPackage.php?id_package="+booking_id+"&id_user="+user_id+"";
}

function send(id_booking){

  $.ajax({
     type : "POST",
     url  : server+'tourist/act/kirimEmail.php',
     dataType : "JSON",
     data : {id_booking:id_booking},
     success: function(data){
         alert('Email Sudah Dikirim ke');
     }
  });
  alert('Data Has Been Send');
  location.reload();
}

function sendCust(id_package){

  $.ajax({
     type : "POST",
     url  : server+'tourist/act/pesanPktKstm.php?id_package='+id_package,
     dataType : "JSON",
     success: function(data){
         console.log(url); 
         alert('Data Has Been Send!');
     }
  });
  window.location.href='?page=customPackage1&id='+id_package ;
  
}

function update(id_booking){                    
  update_id = id_booking;                      
  document.getElementById('id_booking').value = update_id;

  $.ajax({ 
        url: server+'tourist/act/_dataBooking.php?id='+id_booking, data: "", dataType: 'json', success: function(rows)
          { 
          for (var i in rows) 
            {   
              var row = rows[i];
            var id  = row.id;
            // var id_travel  = row.id_travel;
            var people  = row.people;
            var oneprice = row.satuan;
            var date = row.date;
            var price = row.price;                                
            console.log(name);
            } 
            console.log(id, people, oneprice, price, date);
           document.getElementById('id_package').value = id;
           document.getElementById('total').value = people;
           document.getElementById('olddate').value = date;
           document.getElementById('oneprice').value = oneprice;
           document.getElementById('totalprice').value = price;
          }
        }); 

}

function delPackage(id_package){
  window.location.href='act/deletePackage.php?id='+id_package ;

}

function hapus(id_booking){
  window.location.href='act/deleteBooking.php?id_booking='+id_booking ;

}            

function hitung()
{
  var hitung = document.getElementById('total').value;
  if (hitung==1){
    hitung = hitung * booking_price;
    document.getElementById('totalprice').value = hitung; 
  }
  else {
    hitung = hitung * booking_price;
    document.getElementById('totalprice').value = hitung;
  }
   
}

function hitungupdate(id_booking)
{
  var hitung = document.getElementById('total').value;
  var booking_price=document.getElementById('oneprice').value;
  hitung = hitung * booking_price;
  document.getElementById('totalprice').value = hitung;  
}

// -----------------------------------------------------------------------------------------------------------------------
// --------------------------------------------- BOOKING ---------------------------------------------
// -----------------------------------------------------------------------------------------------------------------------
