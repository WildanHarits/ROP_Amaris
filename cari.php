<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bimo";

$conn = new mysqli($servername, $username, $password, $dbname);

$query="delete from hitung";
$conn->query($query);
?>
<div id="table-wrapper">
  <div id="table-scroll">
	

 <table class="table table-condensed table-hover" BORDER='5'>
         <thead>
            <th>QTY</th>
            <th>SIZE</th>
            <th>ID BARANG</th>
			<th>NAMA BARANG</th>
            <th>TOTAL HARGA</th>
        </thead>
		<?php
		$sql = "select * from transaksi where tgl='".$_GET['date']."' and event='".$_GET['event']."'";
		
		
		$result = mysqli_query($conn, $sql);
		while($row = mysqli_fetch_assoc($result)){
			if($row['jumlah']!=0){
			$query="insert into hitung values('".$row['id_barang']."','".$row['harga_satuan']."','".$row['jumlah']."','".$row['total']."')";
			$conn->query($query);
			}
			echo "<tr>";
			echo "<td><input name='qty_".$row['id_barang']."' type='text' id='qty_".$row['id_barang']."' value='".$row['jumlah']."' onkeyup=cekharga('".$row['id_barang']."','".$row['harga_satuan']."')>";
			echo "</td>";
			echo "<td>".$row['satuan'];
			echo "</td>";
			echo "<td>".$row['id_barang'];
			echo "</td>";
			echo "<td><button type='button' id='dbarang' onclick=cekgantibarang('".$row['id_barang']."')>".$row['nama_barang']."</button>";
			echo "</td>";
			echo "<td><input type='text' id='hasil_".$row['id_barang']."' value=".$row['total']." disabled>";
			echo "</td>";
			echo "</tr>";
		}
		?>	
			<style type="text/css">
#table-wrapper {
  position:relative;
}
#table-scroll {
  height:380px;
  overflow:auto;  
  margin-top:20px;
}
#table-wrapper table {
  width:100%;

}
#table-wrapper table * {
  background:white;
  color:black;
}
#table-wrapper table thead th .text {
  position:absolute;   
  top:-20px;
  z-index:2;
  height:20px;
  width:35%;
  border:1px solid red;
}
            </style>
	</table>
		</div>
		<?php
	$sql = "select sum(total) from transaksi where tgl='".$_GET['date']."' and event='biasa' ";
	
	$result = mysqli_query($conn, $sql);

	while($row = mysqli_fetch_assoc($result)){
		echo "<div id='total'>";
		echo "Total : <input type='text' name='totall' id='totall' value='".$row['sum(total)']."' disabled>";
		echo "</div>";
	}
	?>
		harga event :<input type="text" name="harga_event" id="harga_event" onkeyup=cekprosentase()>
	prosentase :<input type="text" name="prosentase" id="prosentase" disabled>
	nama event :<input type="text" name="nama_event" id="nama_event">
	<input type="submit" name="simpan_event" id="simpan_event" value="Simpan Event">
	</form>
	
	</div>	
		<footer class="footer">
            <div class="container">
                <p class="text-muted"><center>&copy; 2017. Bimo Roosadi.</p>
            </div>
        </footer>