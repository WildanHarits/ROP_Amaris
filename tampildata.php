<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bimo";

$conn = new mysqli($servername, $username, $password, $dbname);

$query="insert into barang values('".$_GET['id_barang']."','".$_GET['nama_barang']."','".$_GET['kategori']."','".$_GET['size']."','".$_GET['hargasatuan']."','".$_GET['supplier']."')";
$conn->query($query);


?>
<table id="example1" class="table table-bordered table-hover">
                <thead>
                    <th>QTY</th>
                    <th>SIZE</th>
                    <th>ID BARANG</th>
                    <th>NAMA BARANG</th>
                    <th>TOTAL HARGA</th>
                    <th>SUPPLIER</th>
                </thead>
                <tbody>
                <?php
                $sql = "select * from barang";
                $result = mysqli_query($conn, $sql);
                while($row = mysqli_fetch_assoc($result)){
                  echo "<tr>";
                  echo "<td><input name='qty_".$row['id_barang']."' type='text' id='qty_".$row['id_barang']."' onkeyup=cekharga('".$row['id_barang']."','".$row['harga_satuan']."')>";
                  echo "</td>";
                  echo "<td>".$row['satuan'];
                  echo "</td>";
                  echo "<td>".$row['id_barang'];
                  echo "</td>";
                  echo "<td><button type='button' id='dbarang' onclick=cekgantibarang('".$row['id_barang']."')>".$row['nama_barang']."</button>";
                  echo "</td>";
                  echo "<td><input type='text' id='hasil_".$row['id_barang']."' value=0 disabled>";
                  echo "</td>";
                  echo "<td>".$row['supplier'];
                  echo "</td>";
                  echo "</tr>";
                }
                ?>  
              </table>
		
		<div id="total">
		Total : <input type="text" name="totall" id="totall" value=0 disabled>
		
		</div>
		harga event :<input type="text" name="harga_event" id="harga_event" onkeyup=cekprosentase()>
	prosentase :<input type="text" name="prosentase" id="prosentase">
	nama event :<input type="text" name="nama_event" id="nama_event">
	<input type="submit" name="simpan_event" id="simpan_event" value="Simpan Event">
	</form>
	
	</div>	
		<footer class="footer">
            <div class="container">
                <p class="text-muted"><center>&copy; 2017. Bimo Roosadi.</p>
            </div>
        </footer>