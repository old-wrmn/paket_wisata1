<?php
include ('../../connect.php');

$id = $_GET['id'];
  $sql   = "delete from souvenir where id_souvenir='$id'";

  
  $delete = mysqli_query($conn, $sql);
  if ($delete){
    echo "<script>
    alert (' Data Successfully Delete');
    </script>";
  }
  else{
    echo "<script>
    alert ('Error');
    </script>";
  }

echo "<script>
eval(\"parent.location='../?page=souvenir'\");
</script>";

?>