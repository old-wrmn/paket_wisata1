<?php
include ('../connect.php');
session_start();
if(isset($_POST['username'])){
	$username = $_POST['username'];
	$password = $_POST['password'];
	// $username = $_POST['username'];
	// $pass = $password;
	//$pass=$password;
	$sql = mysqli_query($conn,"SELECT * FROM users WHERE upper(username)=upper('$username') and password='$password'");
	$num = mysqli_num_rows($sql);
	$dt = mysqli_fetch_array($sql);
	if($num==1){		
		$_SESSION['username'] = $username;
		
		if($dt['role_id']=='A'){

			$_SESSION['A'] = true;
			?><script language="JavaScript">document.location='../admin/index.php'</script><?php
			echo "<script>
		alert (' lalalala');	
		</script>";
		}

		if($dt['role_id']=='B'){
			$sql=mysqli_query($conn,"select password from users where username='$dt[username]'");
			$dt2=mysqli_fetch_assoc($sql);
			if($dt['username']!=$dt2['password'])
			{
			echo "<script>
			alert ('Fill with correct data!');
			eval(\"parent.location='../login.php '\");	
			</script>";
			}
			$_SESSION['B'] = true;
			$_SESSION['id_user']=$dt['id_user'];
			$_SESSION['role_id']=$dt['role_id'];
			$_SESSION['username']=$dt['username'];			
			// $query=pg_query("select * from travel where id='$dt[travel_id]'");
			// $data=pg_fetch_assoc($query);
			// $_SESSION['user_id']=$data['user_id'];
			?><script language="JavaScript">document.location='../agen/index.php'</script><?php
		}

		if($dt['role_id']=='C'){
			$sql=mysqli_query($conn,"select password from users where username='$dt[username]'");
			$dt2=mysqli_fetch_assoc($sql);
			if($dt['username']!=$dt2['password'])
			{
			echo "<script>
			alert ('Fill with correct data!');
			eval(\"parent.location='../login.php '\");	
			</script>";
			}
			$_SESSION['C'] = true;
			$_SESSION['id_user']=$dt['id_user'];
			$_SESSION['role_id']=$dt['role_id'];
			$_SESSION['username']=$dt['username'];
			// $query=pg_query("select * from users where user_id='$dt[user_id]'");
			// $data=pg_fetch_assoc($query);
			// $_SESSION['user_id']=$data['user_id'];
			?><script language="JavaScript">document.location='../tourist/index.php'</script><?php
		}		
		
		
	}else{
		echo "<script>
		alert (' Login Failed, Please Fill Your id_user and Password Correctly !');
		eval(\"parent.location='../login.php '\");	
		</script>";
	}
}
?>