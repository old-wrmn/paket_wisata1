var server = ipServerTourism;

function selesai(id_booking){

  $.ajax({
     type : "POST",
     url  : server+'agen/act/selesai.php',
     dataType : "JSON",
     data : {id_booking:id_booking},
     success: function(data){
         alert('Email Sudah Dikirim ke');
     }
  });
  alert('Data Has Been Send');
  location.reload();
}
