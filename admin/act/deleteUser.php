<?php
include ('../../connect.php');

$id = $_GET['id'];
  $sql   = "delete from users where id_user='$id'";

  
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
eval(\"parent.location='../?page=user'\");
</script>";

?>