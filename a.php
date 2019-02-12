
<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bimo";

$conn = new mysqli($servername, $username, $password, $dbname);
$sql = "select * from stok_bahan where id_bahan='".$_GET['b']."'";
$result = mysqli_query($conn, $sql);
while($row = mysqli_fetch_assoc($result)){
	echo $row['satuan'];
}
?>