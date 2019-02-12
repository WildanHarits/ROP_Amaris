<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bimo";

$conn = new mysqli($servername, $username, $password, $dbname);
$hasil = 'a';
if(isset($_GET['id_barang'])){
	$query="insert into hitung values('".$_GET['id_barang']."','".$_GET['harga_satuan']."','".$_GET['qty']."','".$_GET['total']."')";
	$hasil = 'b';
	if ($conn->query($query) === FALSE) {
		$query="UPDATE hitung SET harga_satuan='".$_GET['harga_satuan']."', jumlah='".$_GET['qty']."',total='".$_GET['total']."' WHERE id_barang='".$_GET['id_barang']."'";
		$conn->query($query);
		$hasil = 'c';
	}
}
//echo $hasil;
$sql = "select sum(total) from hitung";
$result = mysqli_query($conn, $sql);

while($row = mysqli_fetch_assoc($result)){
	echo "Total : <input type='text' name='totall' id='totall' value='".$row['sum(total)']."' disabled>";
}
?>

