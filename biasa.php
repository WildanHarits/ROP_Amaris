<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bimo";

$conn = new mysqli($servername, $username, $password, $dbname);


?>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>PRINT FILE EXCEL DAILY BREAKFAST</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
  </head>
  <body>
      <nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="http://localhost/bimo/">Market List</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="http://localhost/bimo/breakfast.php">Home</a></li>
      <li><a href="http://localhost/bimo/biasa.php">Print Excel</a></li>
    </ul>
  </div>
</nav>
    <?php
	$sql = "select distinct(tgl) from transaksi where event='biasa'";
	$result = mysqli_query($conn, $sql);
	echo "<h4>FILE EXCEL DAILY BREAKFAST</h4>";
	while($row = mysqli_fetch_assoc($result)){
		echo "<a href='print_biasa.php?tgl=".$row['tgl']."'>ML-BF(".$row['tgl'].")</a><br>";
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