<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bimo";

$conn = new mysqli($servername, $username, $password, $dbname);

$query="update barang set nama_barang='".$_GET['nama_barang']."',nama_kategori='".$_GET['kategori']."',satuan='".$_GET['size']."',harga_satuan='".$_GET['hargasatuan']."' where id_barang='".$_GET['id_barang']."'";
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
      echo "</tr>";
    }
    ?>  
  </table>