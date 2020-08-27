<?php
// session_start('C');
include ('../../connect.php');
$id_package = $_GET['id_package'];
// $id_package = 'PKT005';

 
 $query = " SELECT package.id_package, 
                        package.name as namaPaket, 
                        package.price, 
                        package.id_user,
                        users.username as namaCustomer,
                        users.role_id as role,
                        users.email as emailCustomer
                        FROM package 
                        join users on package.id_user=users.id_user 
                        
                        where package.id_package = '".$id_package."'";

$customDate = date('d-m-Y');

$cek = mysqli_query($conn, $query);
    $data = mysqli_fetch_array($cek);    
        $namaCustomer = $data['namaCustomer'];
        $namaPaket = $data['namaPaket'];
        $emailCustomer = $data['emailCustomer'];
        echo json_encode ($data);

        // $emailtravel = $emailAgen;
        // $namatr = $usernameAgen;
//$emailtravel = 'firdausrizki17@gmail.com';
//$namatr = 'Rizki Firdus';
    // require('PHPMailer/class.phpmailer.php');
require '../../global_assets/PHPMailer/src/Exception.php';
require '../../global_assets/PHPMailer/src/PHPMailer.php';
require '../../global_assets/PHPMailer/src/SMTP.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
  
$mail = new PHPMailer(true); 
$mail->isSMTP();
        $mail->SMTPDebug = 2;
        $mail->Host = 'smtp.gmail.com';
        $mail->Port = 587;
        $mail->SMTPSecure='tls';
        $mail->SMTPAuth = true;
        $mail->Username = "aplikasi.paketwisata@gmail.com"; //email kirim dari aplikasi
        $mail->Password = "awytbg19";

        $mail->setFrom("aplikasi.paketwisata@gmail.com");
        $mail->isHTML(true);
        $mail->SMTPOptions = array(
        'ssl' => array(
            'verify_peer' => false,
            'verify_peer_name' => false,
            'allow_self_signed' => true
        )
    );
         // Setel format email ke HTML 
        $mail->addAddress("email.agenperjalanan@gmail.com"); //email penerima
        //    $mail->addAddress("$email", "$Username");
        $mail->Subject = 'GIS TOURISM PACKAGE PADANG CITY' ; 
        $mail->Body = "Anda mendapatkan pesanan paket wisata yang dikustomisasi dari: 
                        <table>
                          <tbody>
                            <tr>
                               <td>E-mail</td> <td>:  &nbsp;</td> <td>".$emailCustomer."</td>
                            </tr>                          
                            <tr>
                                <td>Nama Pembeli </td> <td>:  &nbsp;</td> <td>".$namaCustomer."</td> 
                            </tr>
                            <tr>
                                <td>Kustomisasi </td> <td>:  &nbsp;</td> <td>".$id_package."</td> 
                            </tr>
                            <tr>
                                <td>Nama Paket </td> <td>:  &nbsp;</td> <td> ".$namaPaket."</td>
                            </tr>
                            <tr>
                                <td>Tanggal Kustomisasi </td> <td>:  &nbsp;</td> <td> ".$customDate."</td>
                            </tr>
                          </tbody>
                      </table>
                      <b>Mohon segera memperbarui harga paket.</b>"; 

        $mail->AltBody = ' Ini adalah badan dalam teks biasa untuk klien email non-HTML ' ;    

        if ($mail -> send ()) {
          $status = array('KirimEmail' => Sukses );
        }else{
          $status = array('KirimEmail' => Gagal );
        }
        echo json_encode($status);       
?>