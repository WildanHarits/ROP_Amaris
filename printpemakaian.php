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
$asdd=0;
if(isset($_GET['tgl'])){
    $asdd=1;
}else if(isset($_GET['bln'])){
    $asdd=2;
}
$isian = "
<table style='width: 100%; border: 1px solid #cecece;'>
    <tr>
        <th colspan='2' style='width:100%' align='center'>Laporan Pemakaian Bahan Baku (";
        if($asdd==1){
            $isian .= " Harian ";
        }else if($asdd==2){
            $isian .= " Bulanan ";
        }
        $isian .= ") </th>
    </tr>
    <tr>
        <td></td>
    </tr>
    <tr>";
    if($asdd==1){
        $isian .="<td colspan='2'>Tanggal : ".$_GET['tgl']."</td>";
    }else if($asdd==2){
        $isian .="<td>Bulan : ";
        if($_GET['bln']=='1'){
            $isian .= "Januari";
        }
        if($_GET['bln']=='2'){
            $isian .= "Februari";
        }
        if($_GET['bln']=='3'){
            $isian .= "Maret";
        }
        if($_GET['bln']=='4'){
            $isian .= "April";
        }
        if($_GET['bln']=='5'){
            $isian .= "Mei";
        }
        if($_GET['bln']=='6'){
            $isian .= "Juni";
        }
        if($_GET['bln']=='7'){
            $isian .= "Juli";
        }
        if($_GET['bln']=='8'){
            $isian .= "Agustus";
        }
        if($_GET['bln']=='9'){
            $isian .= "September";
        }
        if($_GET['bln']=='10'){
            $isian .= "Oktober";
        }
        if($_GET['bln']=='11'){
            $isian .= "November";
        }
        if($_GET['bln']=='12'){
            $isian .= "Desember";
        }
        $isian .="</td><td>".$_GET['thn']."</td>";
    }
    
    $isian .="</tr>
</table>

<table style='border: 1px solid #cecece; width: 100%;'>
    <thead style='background-color: #cecece;'>
        <tr>
            
            ";
            if($asdd==1){
            $isian .= "<th style='width:20%'>No</th>
            <th style='width:40%'>Nama Barang</th>
            <th style='width:20%'>Jumlah Pakai</th>
            <th style='width:20%'>Satuan</th>";
            }else if($asdd==2){
            $isian .= "<th style='width:10%'>No</th>
            <th style='width:40%'>Nama Barang</th>
            <th style='width:10%'>Jumlah Pakai</th>
            <th style='width:10%'>Satuan</th>
            <th style='width:10%'>Pemakaian rata rata</th>
            <th style='width:10%'>Pemakaian maksimum</th>";
            }
            $isian .="</tr>
    </thead>
    <tbody>
	";
if($asdd==1){
        $sql = "select distinct nama_kategori FROM transaksi_bahan a join barang b on (a.id_bahan = b.id_barang) where tgl='".$_GET['tgl']."'";
    }else if($asdd==2){
        $sql = "select distinct nama_kategori FROM transaksi_bahan a join barang b on (a.id_bahan = b.id_barang) where date_format(tgl,'%c')='".$_GET['bln']."' and date_format(tgl,'%Y') = '".$_GET['thn']."'";
    }

$result = mysqli_query($conn, $sql);
$total=0;
$no=0;
while($row = mysqli_fetch_assoc($result)){
    if($asdd==1){
        $sql2 = "select * from transaksi_bahan a join barang b on (a.id_bahan = b.id_barang) where tgl='".$_GET['tgl']."' and nama_kategori='".$row['nama_kategori']."'";
    }else if($asdd==2){
        $sql2 = "select * , max(jumlah) max,avg(jumlah) avg,sum(jumlah) from transaksi_bahan a join barang b on (a.id_bahan = b.id_barang) where date_format(tgl,'%c')='".$_GET['bln']."' and date_format(tgl,'%Y') = '".$_GET['thn']."' and nama_kategori='".$row['nama_kategori']."' group by id_bahan";
    }
    
    
    $result2 = mysqli_query($conn, $sql2);
    //$isian .="<tr align='center'><td colspan='3'><b>".$row['nama_kategori']."</b></td></tr>";
    
    while($row2 = mysqli_fetch_assoc($result2)){
        if($row2['jumlah']!='0'){
            $no++;
            if($asdd==1){
                $isian .="<tr align='center'><td>".$no."</td><td text-align: 'left'>".$row2['nama_barang']."</td><td>".$row2['satuan']."</td><td>".$row2['jumlah']."</td></tr>";        
                }else if($asdd==2){
                    $isian .="<tr align='center'><td>".$no."</td><td>".$row2['nama_barang']."</td><td>".$row2['jumlah']."</td><td>".$row2['satuan']."</td><td>".number_format($row2['avg'],1)."</td><td>".$row2['max']."</td></tr>";
                }
            //$isian .="<tr align='center'><td>".$no."</td><td>".$row2['nama_barang']."</td><td>".$row2['satuan']."</td><td>".$row2['jumlah']."</td><td>".number_format($row2['avg'],1)."</td><td>".$row2['max']."</td></tr>";
            //$total += $row2['total'];
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
// /echo $isian;
?>