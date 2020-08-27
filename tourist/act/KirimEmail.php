<?php
// session_start('C');
include ('../../connect.php');
$id_booking = $_POST['id_booking'];
// $id_booking = 'BKG005';

$updateBooking = mysqli_query($conn, "UPDATE booking set status='TERKIRIM' where id_booking='".$id_booking."'");

 
 $query = " SELECT booking.purchase_date, 
            package.name as nama_paket, 
            package.id_user as agen,
            booking.id_booking, 
            booking.id_user, 
            detail_booking.total_price, 
            detail_booking.travel_dates, 
            detail_booking.total_price, 
            package.price, 
            users.email, 
            users.address as alamat,
            users.username,  
            users.contact FROM booking 
                        LEFT JOIN detail_booking on booking.id_booking = detail_booking.id_booking  
                        LEFT JOIN package on detail_booking.id_package = package.id_package
                        left join users on booking.id_user = users.id_user 
                        
                         where booking.id_booking = '".$id_booking."'";
    $cek = mysqli_query($conn, $query);
    $data = mysqli_fetch_array($cek);    
        $id_agen = $data['agen'];
        $address = $data['alamat'];
        echo json_encode ($data);

$query2 = mysqli_query($conn, "SELECT username, email FROM users WHERE id_user='".$id_agen."'");
$data2 = mysqli_fetch_array($query2);
    $usernameAgen = $data2['username'];
    $emailAgen = $data2['email'];
    $dataarray[] = array('usernameAgen' =>$usernameAgen, 'emailAgen' =>$emailAgen);
echo json_encode ($data2);

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
        $mail->addAddress($emailAgen, $usernameAgen); //email penerima
        //    $mail->addAddress("$email", "$Username");
        $mail->Subject = 'GIS TOURISM PACKAGE PADANG CITY' ; 
        $mail->Body = "Anda mendapatkan pesanan paket wisata dari : 
                        <table>
                          <tbody>
                            <tr>
                               <td>E-mail</td> <td>:  &nbsp;</td> <td>".$data['email']."</td>
                            </tr>                          
                            <tr>
                                <td>Nama Pembeli </td> <td>:  &nbsp;</td> <td>".$data['username']."</td> 
                            </tr>
                            <tr>
                                <td>No Urut Pesanan </td> <td>:  &nbsp;</td> <td>".$data['id_booking']."</td> 
                            </tr>
                            <tr>
                                <td>Nama Paket </td> <td>:  &nbsp;</td> <td> ".$data['nama_paket']."</td>
                            </tr>
                            <tr>
                                <td>Tanggal Pemesanan </td> <td>:  &nbsp;</td> <td> ".$data['purchase_date']."</td>
                            </tr>
                            <tr>
                                <td>Nama Pemesan</td> <td>:  &nbsp;</td> <td> ".$data['username']."</td>
                            </tr>
                            <tr>
                                <td>No Telepon </td> <td>:  &nbsp;</td> <td>".$data['contact']."</td>
                            </tr>
                            <tr>
                               <td>Total Harga </td> <td>:  &nbsp;</td> <td>".$data['total_price']."</td>
                            </tr>
                          </tbody>
                      </table>"; 

        $mail->AltBody = ' Ini adalah badan dalam teks biasa untuk klien email non-HTML ' ;    

        if ($mail -> send ()) {
          $status = array('KirimEmail' => Sukses );
        }else{
          $status = array('KirimEmail' => Gagal );
        }
        echo json_encode($status);       
?>