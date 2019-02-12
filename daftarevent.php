<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bimo";

$conn = new mysqli($servername, $username, $password, $dbname);

$sql = "select * from t_event where tgl='".$_GET['tgl']."'";
$result = mysqli_query($conn, $sql);
while($row = mysqli_fetch_assoc($result)){
	echo "<a href='/bimo/?tgl=".$_GET['tgl']."&event=".$row['event']."'>".$row['event']."</a><br>";
	}
?>
