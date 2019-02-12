
<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bimo";

$conn = new mysqli($servername, $username, $password, $dbname);
$query="delete from hitung";
	$conn->query($query);
?>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>INVENTORY CONTROL</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="{{ asset('css/bootstrap.min.css') }}">
        <link rel="stylesheet" type="text/css" href="{{ asset('css/bootstrap-theme.min.css') }}">
        <link rel="stylesheet" type="text/css" href="{{ asset('css/sticky-footer-navbar.css') }}">
        <link rel="stylesheet" type="text/css" href="{{ asset('css/sweetalert2.min.css') }}">
	
	    <style type="text/css">
            h1 { margin-bottom: 40px; }
            label { cursor: hand; cursor: pointer; }
        </style>
  </head>
  <body>
  <nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">INVENTORY CONTROL</a>
    </div>
    <ul class="nav navbar-nav">
	  <li><a href="http://localhost/bimo/index.php">PEMBELIAN</a></li>
	  <li><a href="http://localhost/bimo/tambahmakanan.php">TAMBAH MENU MAKANAN</a></li>
	  <li><a href="http://localhost/bimo/daftarmakanan.php">DAFTAR MENU MAKANAN</a></li>
	  <li><a href="http://localhost/bimo/transaksi.php">PEMAKAIAN</a></li>
    </ul>
  </div>
</nav>
<div>
<h2> FORM DATA BAHAN BAKU</h2>
</div>
	<div id="gantibarang">
		<table id="maintable">
			<tr>
				<td>ID BAHAN
				</td>
				<td>NAMA BAHAN BAKU
				</td>
				<td>KATEGORI
				</td>
				<td>SATUAN
				</td>
				<td>HARGA SATUAN
				</td>
			</tr>
			<tr>
				<td><input type="text" name="idbarang" id="idbarang">
				</td>
				<td><input type="text" name="namabarang" id="namabarang">
				</td>
				<td>
				<?php
				$sql = "select distinct(nama_kategori) from barang";
				$result = mysqli_query($conn, $sql);
				echo "<select name='kategori' id='kategori'>";
				while($row = mysqli_fetch_assoc($result)){
					echo "<option value='".$row['nama_kategori']."'>".$row['nama_kategori']."</option>";
				}
				echo "</select>";
				?>
				</td>
				<td><input type="text" name="size" id="size">
				</td>
				<td><input type="text" name="hargasatuan" id="hargasatuan">
				</td>
			</tr>
		</table>
	</div>
	<table>
		<tr>
			<td><input type="submit" name="tambah" id="tambah" value="Tambah" onclick=tambah()>
			</td>
			<td><input type="submit" name="ubah" id="ubah" value="Ubah" onclick=ubah()>
			</td>
			<td><input type="submit" name="hapus" id="hapus" value="Hapus" onclick=hapus()>
			</td>
		</tr>
	</table>
	<br>
	<?php
		if(isset($_POST['simpan'])){
			$sql = "select * from barang";
			$result = mysqli_query($conn, $sql);
			while($row = mysqli_fetch_assoc($result)){
				$jumlah = $_POST['qty_'.$row['id_barang']];
				if($jumlah == ""){
					$jumlah =0;
				}
				$total = $jumlah*$row['harga_satuan'];
				//echo $_POST['tgl'];
				$query="insert into transaksi values('biasa','".$_POST['tgl']."','".$row['id_barang']."','".$row['nama_barang']."','".$row['nama_kategori']."','".$row['satuan']."','".$jumlah."','".$row['harga_satuan']."','".$total."')";
				//$conn->query($query);
				if ($conn->query($query) === FALSE) {
					$query="update transaksi set nama_barang='".$row['nama_barang']."',nama_kategori='".$row['nama_kategori']."',satuan='".$row['satuan']."',jumlah='".$jumlah."' ,harga_satuan='".$row['harga_satuan']."',total='".$total."' where tgl='".$_POST['tgl']."' and id_barang='".$row['id_barang']."' and event='biasa'";
					//echo $query;
					$conn->query($query);
				}
				$query="insert into stok_bahan values('".$row['id_barang']."','".$row['nama_barang']."',".$jumlah.",'".$row['satuan']."')";
				if ($conn->query($query) === FALSE) {
					$query="update stok_bahan set jumlah = jumlah + ".$jumlah." where id_bahan = '".$row['id_barang']."'";
					//echo $query;
					$conn->query($query);
				}
				
			}
		}
		if(isset($_POST['simpan_event'])){
			$sql = "select * from barang";
			$result = mysqli_query($conn, $sql);
			//echo $_POST['totall'];
			$totall = 0;
			while($row = mysqli_fetch_assoc($result)){
				$jumlah = $_POST['qty_'.$row['id_barang']];
				if($jumlah == ""){
					$jumlah =0;
				}
				$total = $jumlah*$row['harga_satuan'];
				//echo $_POST['tgl'];
				$query="insert into transaksi values('".$_POST['nama_event']."','".$_POST['tgl']."','".$row['id_barang']."','".$row['nama_barang']."','".$row['nama_kategori']."','".$row['satuan']."','".$jumlah."','".$row['harga_satuan']."','".$total."')";
				//$conn->query($query);
				
				if ($conn->query($query) === FALSE) {
					$query="update transaksi nama_barang='".$row['nama_barang']."',nama_kategori='".$row['nama_kategori']."',satuan='".$row['satuan']."',jumlah='".$jumlah."' ,harga_satuan='".$row['harga_satuan']."',total='".$total."' where tgl='".$_POST['tgl']."' and id_barang='".$row['id_barang']."' and event='".$_POST['nama_event']."'";
					//echo $query;
					$conn->query($query);
					
				}
				$query="insert into stok_bahan values('".$row['id_barang']."','".$row['nama_barang']."',".$jumlah.",'".$row['satuan']."')";
				if ($conn->query($query) === FALSE) {
					$query="update stok_bahan set jumlah = jumlah + ".$jumlah." where id_bahan = '".$row['id_barang']."'";
					//echo $query;
					$conn->query($query);
				}

				$totall = $totall+$total;
			}
			$query="insert into t_event values('".$_POST['tgl']."','".$_POST['nama_event']."','".$totall."','".$_POST['harga_event']."','".$_POST['prosentase']."')";
				$conn->query($query);
		}
	?>

<div id="tampildata">
<div id="table-wrapper">
  <div id="table-scroll">
	

 <table class="table table-condensed table-hover" BORDER='5'>
         <thead>
            <th>ID BAHAN</th>
            <th>NAMA BAHAN</th>
            <th>JUMLAH STOK</th>
			<th>SATUAN</th>
        </thead>
		<?php
		$sql = "select * from stok_bahan";
		
		
		$result = mysqli_query($conn, $sql);
		while($row = mysqli_fetch_assoc($result)){
			echo "<tr>
			<td>".$row['id_bahan']."</td>
			<td>".$row['nama_bahan']."</td>
			<td>".$row['jumlah']."</td>
			<td>".$row['satuan']."</td>
			</tr>";
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
		<footer class="footer">
            <div class="container">
                <p class="text-muted"><center>&copy; 2017. Bimo Roosadi.</p>
            </div>
        </footer>
	
	<script>
		function cekprosentase(){
			var a = document.getElementById('harga_event').value;
			var b = document.getElementById('totall').value;
			var c =((b/a)*100);
			var d = c.toFixed(2);
			document.getElementById('prosentase').value =d+"%";
		}
		function cektgl(){
			var a = document.getElementById('date').value;
			document.getElementById('tgl').value = a;
		}
		function cekharga(val1,val2){
			var a = document.getElementById("qty_"+val1).value;
			var b = a*val2;
			document.getElementById('hasil_'+val1).value = b;
			cektotal(val1,val2,a,b);
		}
		/*val1 = id barang
		val2 = harga satuan
		val = quantity (a)
		val 4 = a*val2
		*/
		function cektotal(val1,val2,val3,val4){
			var xihttp = new XMLHttpRequest();
			xihttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					document.getElementById("total").innerHTML =
					this.responseText;
					}
				};
				xihttp.open("GET", "cektotal.php?id_barang="+val1+"&harga_satuan="+val2+"&qty="+val3+"&total="+val4, true);
				xihttp.send();
		}
		function cekgantibarang(val1){
			
			var xihttp = new XMLHttpRequest();
			xihttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					document.getElementById("gantibarang").innerHTML =
					this.responseText;
					}
				};
				xihttp.open("GET", "gantibarang.php?id_barang="+val1, true);
				xihttp.send();
		}
		function tambah(){
			var a = document.getElementById("idbarang").value;
			var b = document.getElementById("namabarang").value;
			var c = document.getElementById("kategori").value;
			var d = document.getElementById("size").value;
			var e = document.getElementById("hargasatuan").value;
			if( (a == "")||(b == "")||(c == "")||(d == "")||(e == "")){
				window.alert("Harap isikan semua field terlebih dahulu");
				}
			else{
				var xihttp = new XMLHttpRequest();
				xihttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {
						document.getElementById("tampildata").innerHTML =
						this.responseText;
						}
					};
					xihttp.open("GET", "tampildata.php?id_barang="+a+"&nama_barang="+b+"&kategori="+c+"&size="+d+"&hargasatuan="+e, true);
					xihttp.send();
				document.getElementById('idbarang').value = null;
				document.getElementById('namabarang').value = null;
				document.getElementById('kategori').value = null;
				document.getElementById('size').value = null;
				document.getElementById('hargasatuan').value = 0;
				}
			}
		function hapus(){
			var a = document.getElementById("idbarang").value;
			if( (a == "")){
				window.alert("Harap isikan semua field terlebih dahulu");
				}
			else{
				var xihttp = new XMLHttpRequest();
				xihttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {
						document.getElementById("tampildata").innerHTML =
						this.responseText;
						}
					};
					xihttp.open("GET", "hapusdata.php?id_barang="+a, true);
					xihttp.send();
				document.getElementById('idbarang').value = null;
				}
			}
		function ubah(){
			var a = document.getElementById("idbarang").value;
			var b = document.getElementById("namabarang").value;
			var c = document.getElementById("kategori").value;
			var d = document.getElementById("size").value;
			var e = document.getElementById("hargasatuan").value;
			if( (a == "")||(b == "")||(c == "")||(d == "")||(e == "")){
				window.alert("Harap isikan semua field terlebih dahulu");
				}
			else{
				var xihttp = new XMLHttpRequest();
				xihttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {
						document.getElementById("tampildata").innerHTML =
						this.responseText;
						}
					};
					xihttp.open("GET", "ubahdata.php?id_barang="+a+"&nama_barang="+b+"&kategori="+c+"&size="+d+"&hargasatuan="+e, true);
					xihttp.send();
				document.getElementById('idbarang').value = null;
				document.getElementById('namabarang').value = null;
				document.getElementById('kategori').value = null;
				document.getElementById('size').value = null;
				document.getElementById('hargasatuan').value = 0;
				}
			}
		function simpan(){
			var date = document.getElementById("date").value;
			if(date == ""){
				window.alert("Harap isikan field DATE terlebih dahulu");
				}
			else{
				//window.alert(date);
				var xihttp = new XMLHttpRequest();
				xihttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {
						document.getElementById("tampildata").innerHTML =
						this.responseText;
						}
					};
					xihttp.open("GET", "simpandata.php?date="+date, true);
					xihttp.send();
				}
			}
		function cari(){
			//window.alert("aaa");
			var a = document.getElementById("date").value;
			if(a == ""){
				window.alert("Harap isikan field DATE terlebih dahulu");
				}
			else{
				var xihttp = new XMLHttpRequest();
				xihttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {
						document.getElementById("tampildata").innerHTML =
						this.responseText;
						}
					};
					xihttp.open("GET", "carib.php?&date="+a, true);
					xihttp.send();
				var xixhttp = new XMLHttpRequest();
				xixhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					document.getElementById("total").innerHTML =
					this.responseText;
					}
				};
				xixhttp.open("GET", "cektotal.php", true);
				xixhttp.send();
				}
			}
	</script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>