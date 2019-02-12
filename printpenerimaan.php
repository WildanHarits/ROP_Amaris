<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bimo";
$conn = new mysqli($servername, $username, $password, $dbname);
session_start();
require __DIR__.'/vendor/autoload.php';

use Spipu\Html2Pdf\Html2Pdf;

$html2pdf = new Html2Pdf();
$isian = "
<table style='width: 100%;'>
    <tr>
        <th style='width:100%' align='center'>Laporan Penerimaan</th>
    </tr>
    <tr>
        <td></td>
    </tr>
    <tr>
        <td>Tanggal : ".$_GET['tgl']."</td>
    </tr>
</table>

<table style='border: 1px solid #cecece; width: 100%;'>
    <thead style='background-color: #cecece;'>
        <tr>
            <th style='width:20%'>Jumlah</th>
            <th style='width:20%'>Satuan</th>
            <th style='width:60%'>Nama Barang</th>
        </tr>
    </thead>
    <tbody>
	";
$sql = "select distinct nama_kategori from transaksi where tgl='".$_GET['tgl']."' and event='biasa'";
$result = mysqli_query($conn, $sql);
$total=0;
while($row = mysqli_fetch_assoc($result)){
    $sql2 = "select * from transaksi where tgl='".$_GET['tgl']."' and event='biasa' and nama_kategori='".$row['nama_kategori']."'";
    $result2 = mysqli_query($conn, $sql2);
    $isian .="<tr align='center'><td colspan='3'><b>".$row['nama_kategori']."</b></td></tr>";
    while($row2 = mysqli_fetch_assoc($result2)){
        if($row2['jumlah']!='0'){

            $isian .="<tr align='center'><td>".$row2['jumlah']."</td><td>".$row2['satuan']."</td><td>".$row2['nama_barang']."</td></tr>";
            $total += $row2['total'];
        }
    }
}
$isian .=" 
    </tbody>
</table>
";
//$isian .= "Total : ".$total;
$html2pdf->writeHTML($isian);
$html2pdf->output();

?>