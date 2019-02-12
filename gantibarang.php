<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bimo";

$conn = new mysqli($servername, $username, $password, $dbname);

?>
<form action="#" method="post">
	<?php
			$sql = "select * from barang where id_barang='".$_GET['id_barang']."'";
			$result = mysqli_query($conn, $sql);
			$hasil = 0;
			while($row = mysqli_fetch_assoc($result)){
			?>
    <div class="form-group">ID BAHAN
      <input type="text" class="form-control" name="idbarang" id="idbarang" value="<?php echo $row['id_barang']; ?>">
    </div>
    <div class="form-group">NAMA BAHAN BAKU
      <input type="text" class="form-control" name="namabarang" id="namabarang" value="<?php echo $row['nama_barang']; ?>">
    </div>
    <div class="form-group">KATEGORI
      <?php
				$sqll = "select distinct(nama_kategori) from barang";
				$resultt = mysqli_query($conn, $sqll);
				
				echo "<select class='form-control' name='kategori' id='kategori'>";
				while($roww = mysqli_fetch_assoc($resultt)){
					
					if($roww['nama_kategori']==$row['nama_kategori']){
					echo "<option value='".$roww['nama_kategori']."' selected>".$roww['nama_kategori']."</option>";	
					
					}
					else{
					echo "<option value='".$roww['nama_kategori']."'>".$roww['nama_kategori']."</option>";	
					
					}
					
				}
				echo "</select>";
				?>
    </div>
    <div class="form-group">SATUAN
      <input type="text" class="form-control" name="size" id="size" value="<?php echo $row['satuan']; ?>">
    </div>
    <div class="form-group">HARGA SATUAN
      <input type="text" class="form-control" name="hargasatuan" id="hargasatuan" value="<?php echo $row['harga_satuan']; ?>">
    </div>
    <div class="form-group">SUPPLIER
      <input type="text" class="form-control" name="supplier" id="supplier" value="<?php echo $row['supplier']; ?>">
    </div>	
    <?php	
			
			$hasil=1;
			}
			if($hasil==0){
				?>
			<div class="form-group">ID BAHAN
      <input type="text" class="form-control" name="idbarang" id="idbarang">
    </div>
    <div class="form-group">NAMA BAHAN BAKU
      <input type="text" class="form-control" name="namabarang" id="namabarang">
    </div>
    <div class="form-group">KATEGORI
      <?php
				$sqll = "select distinct(nama_kategori) from barang";
				$resultt = mysqli_query($conn, $sqll);
				
				echo "<select name='kategori' id='kategori'>";
				while($roww = mysqli_fetch_assoc($resultt)){
					
					if($roww['nama_kategori']==$row['nama_kategori']){
					echo "<option value='".$roww['nama_kategori']."' selected>".$roww['nama_kategori']."</option>";	
					
					}
					else{
					echo "<option value='".$roww['nama_kategori']."'>".$roww['nama_kategori']."</option>";	
					
					}
					
				}
				echo "</select>";
				?>
    </div>
    <div class="form-group">SATUAN
      <input type="text" class="form-control" name="size" id="size">
    </div>
    <div class="form-group">HARGA SATUAN
      <input type="text" class="form-control" name="hargasatuan" id="hargasatuan">
    </div>
	<div class="form-group">SUPPLIER
      <input type="text" class="form-control" name="supplier" id="supplier">
    </div>	
			<?php
			}
			?>
  </form>