<?php
//ML-BF()
$file="ML-BF(".$_GET['tgl'].").xls";
header("Content-type: application/vnd.ms-excel");
header("Content-Disposition: attachment; filename=$file");
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bimo";

$conn = new mysqli($servername, $username, $password, $dbname);
?>

DAILY MARKET LIST<br>
BREAKFAST <?php echo $_GET['tgl']; ?><br>
<table border='1'>
	<tr>
		<td>QTY
		</td>
		<td>SIZE
		</td>
		<td>NAMA BARANG
		</td>
		<td>TOTAL HARGA
		</td>
	</tr>
<?php

$sqll = "select distinct(nama_kategori) from barang";
$resultt = mysqli_query($conn, $sqll);
$i=0;
while($roww = mysqli_fetch_assoc($resultt)){
	$kategori[$i]=$roww['nama_kategori'];
	$i++;
	}

for($a=0;$a<$i;$a++){
	$sql = "select * from transaksi where event='biasa' and tgl='".$_GET['tgl']."' and nama_kategori='".$kategori[$a]."' and jumlah!='0'";
	$result = mysqli_query($conn, $sql);
	echo "<tr>";
		echo "<td colspan='4' bgcolor='silver'><center>".$kategori[$a];
		echo "</td>";
		echo "</tr>";
	while($row = mysqli_fetch_assoc($result)){
		
		echo "<tr>";
		echo "<td>".$row['jumlah'];
		echo "</td>";
		echo "<td>".$row['satuan'];
		echo "</td>";
		echo "<td>".$row['nama_barang'];
		echo "</td>";
		echo "<td>".$row['total'];
		echo "</td>";
		echo "</tr>";
		}
	}
	echo "</table>";
$sql = "select sum(total) from transaksi where event='biasa' and tgl='".$_GET['tgl']."'";
	$result = mysqli_query($conn, $sql);
	
	while($row = mysqli_fetch_assoc($result)){
		
		echo "Total : ".$row['sum(total)'];
		
	}	
?>

</table>