<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bimo";

$conn = new mysqli($servername, $username, $password, $dbname);




?>
Tanggal : <input type="date" name="date" id="date" onchange=cektgl()>
<input type="button" name="cari" id="cari" onclick=cari() value="cari">
<form method="POST">
<input type="text" name="tgl" id="tgl" hidden>

<table border="1">
		<tr>
			<td>QTY
			</td>
			<td>SIZE
			</td>
			<td>ID BARANG
			</td>
			<td>NAMA BARANG
			</td>
			<td>TOTAL HARGA
			</td>
		</tr>
		<?php
		$sql = "select * from barang where nama_kategori='".$_GET['kategori']."'";
		
		$result = mysqli_query($conn, $sql);
		while($row = mysqli_fetch_assoc($result)){
			echo "<tr>";
			echo "<td><input type='text' name='qty_".$row['id_barang']."' id='qty_".$row['id_barang']."' onkeyup=cekharga('".$row['id_barang']."','".$row['harga_satuan']."')>";
			echo "</td>";
			echo "<td>".$row['satuan'];
			echo "</td>";
			echo "<td>".$row['id_barang'];
			echo "</td>";
			echo "<td>".$row['nama_barang'];
			echo "</td>";
			echo "<td><input type='text' id='hasil_".$row['id_barang']."' value=0 disabled>";
			echo "</td>";
			echo "</tr>";
		}
		?>
	</table>
	<form method="POST">
		<input type="submit" name="simpan" id="simpan" value="Simpan">
	</form>