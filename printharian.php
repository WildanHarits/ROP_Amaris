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
$no=0;
$isian = "
<table style='width: 100%;'>
    <tr>
        <th style='width:80%'>Laporan pembelian bahan baku harian</th>
        <td style='width:20%'></td>
    </tr>
    <tr>
        <td colspan='2'></td>
    </tr>
    <tr>
        <td colspan='2'>Tanggal : ".$_GET['tgl']."</td>
    </tr>
</table>
<table style='text-align: left;width: 100%;'>
    <tr>
        <th style='width:60%'></th>
        <th style='width:40%'></th>
    </tr>
    <tr>
        <td style='width:60%'></td>
        <td style='width:40%'></td>
    </tr>
    <tr>
        <td colspan='2'></td>
    </tr>
</table>

<table style='border: 1px solid #cecece; width: 100%;'>
    <thead style='background-color: #cecece;'>
        <tr>
            <th style='width:5%'>No</th>
            <th style='width:23%'>Nama Bahan</th>
            <th style='width:15%'>Satuan</th>
            <th style='width:10%'>Jumlah beli</th>
            <th style='width:15%'>Harga satuan</th>
            <th style='width:15%'>Total Harga</th>
            <th style='width:15%'>Supplier</th>
        </tr>
    </thead>
    <tbody>
	";
$sql = "select distinct nama_kategori from transaksi where tgl='".$_GET['tgl']."' and event='biasa'";
$result = mysqli_query($conn, $sql);
$total=0;

while($row = mysqli_fetch_assoc($result)){
    
    $sql2 = "select * from transaksi join barang on (transaksi.id_barang=barang.id_barang) where tgl='".$_GET['tgl']."' and event='biasa' and transaksi.nama_kategori='".$row['nama_kategori']."'";
    //echo $sql2;
    $result2 = mysqli_query($conn, $sql2);
    //$isian .="<tr align='center'><td colspan='7'><b>".$row['nama_kategori']."</b></td></tr>";
    while($row2 = mysqli_fetch_assoc($result2)){
        if($row2['jumlah']!='0'){
            $no++;
            $isian .="<tr><td>".$no."</td><td>".$row2['nama_barang']."</td><td>".$row2['satuan']."</td><td>".$row2['jumlah']."</td><td>".$row2['harga_satuan']."</td><td>".$row2['total']."</td><td>".$row2['supplier']."</td></tr>";
            $total += $row2['total'];
        }
    }
}
$isian .=" 
    </tbody>
</table>
";
$isian .= "Total : ".$total;
$html2pdf->writeHTML($isian);
$html2pdf->output();

?>