<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bimo";

$conn = new mysqli($servername, $username, $password, $dbname);
$query="delete from hitung";
$conn->query($query);

?>

<table id="example1" class="table table-bordered table-hover">
                <thead>
                    <th>QTY</th>
                    <th>SIZE</th>
                    <th>ID BARANG</th>
                    <th>NAMA BARANG</th>
                    <th>TOTAL HARGA</th>
                </thead>
                <tbody>
                <?php
$sql = "select * from transaksi where tgl='".$_GET['date']."' and event='biasa'";
                $result = mysqli_query($conn, $sql);
                $hasilsemua=0;
                while($row = mysqli_fetch_assoc($result)){
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
            $hasilsemua = $hasilsemua+$row['total'];
                }
                ?>  
              </table>	
<div id="total">
    Total : <input type="text" name="totall" id="totall" value=<?php echo $hasilsemua ?> disabled>
    
    </div>
<script>
  $(function () {
    $('#example1').DataTable()
    $('#example2').DataTable()
  })
</script>