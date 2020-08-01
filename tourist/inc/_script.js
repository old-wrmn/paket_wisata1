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

function booking(id,price)
{
  booking_id = id;
  booking_price = price;
  document.getElementById('id_package').value = booking_id;
}

function send(id_booking)
                   {

                    
          
                  //  console.log(id_booking);

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

function update(id_booking)
                   {
                    window.location.href='updatebooking.php?id_booking='+id_booking ;

                    
                    }

function hapus(id_booking)


                   {
                   window.location.href='deletebooking.php?id_booking='+id_booking ;
                    
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
  var booking_price=document.getElementById('price').value;
  hitung = hitung * booking_price;
  document.getElementById('totalprice').value = hitung;  
}

// -----------------------------------------------------------------------------------------------------------------------
// --------------------------------------------- BOOKING ---------------------------------------------
// -----------------------------------------------------------------------------------------------------------------------