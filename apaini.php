                <?php
                require 'connect.php';
                  $query = mysqli_query($conn, "SELECT*FROM tourism");
				  $cek = 0;
				  $IdPackage = array();
				  $a0 = 0;
				  while($a = mysqli_fetch_array($query)){
					$IdPackage[$a0] = $a['id_tourism'];
					$a0 += 1;
				  }
				  $dataPackage = count($IdPackage);
				  $resArray = array();
				  $resArray[0] = 0;
				  $a1 = 0;
				  for($i=0;$i<$dataPackage;$i++){
					$cek = 0;
					for($j=0;$j<$dataPackage;$j++){
						$k = $i + 1;
						if($k == $IdPackage[$j]){
							$cek = 1;
						}
					}
					if($cek == 0){
						$resArray[$a1] = $i + 1; $a1 += 1;
					}
				  }
				  if($resArray[0] == 0){
					  $resArray[0] = $dataPackage + 1;
				  }

				  echo $resArray[0];
                ?>

