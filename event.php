<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bimo";

$conn = new mysqli($servername, $username, $password, $dbname);
session_start();
if(!isset($_SESSION['username'])){
  header("Location:login.php?b=2");
}

?>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FILE EXCEL EVENT</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
  </head>
  <body>
    <nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="http://localhost/bimo/">Market List</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="http://localhost/bimo/">Home</a></li>
      <li><a href="http://localhost/bimo/event.php">Print Excel</a></li>
    </ul>
  </div>
</nav>
    <?php
	$sql = "SELECT * from t_event";
	$result = mysqli_query($conn, $sql);
	echo "<h4>FILE EXCEL EVENT</h4>";
	while($row = mysqli_fetch_assoc($result)){
		echo "<a href='print_event.php?tgl=".$row['tgl']."&event=".$row['event']."&total=".$row['total']."&harga_event=".$row['harga_event']."&prosentase=".$row['prosentase']."'>".$row['event']."(".$row['tgl'].")</a><br>";
	}
	
	?>
			<footer class="footer">
            <div class="container">
                <p class="text-muted">&copy; 2017. Bimo Roosadi.</p>
            </div>
        </footer>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>