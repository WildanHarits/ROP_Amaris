<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bimo";

$conn = new mysqli($servername, $username, $password, $dbname);
session_start();
$query="delete from hitung";
  $conn->query($query);

?>
<?php
    if(isset($_POST['laporan'])){
      header("Location:printharian.php?tgl=".$_POST['tgllaporan']);
    }
    if(isset($_POST['laporanbulanan'])){
      header("Location:printbulanan.php?bln=".$_POST['bulanan']."&thn=".$_POST['tahunan']);
    }
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
        $query="insert into transaksi values('biasa','".$_POST['tgl']."','".$row['id_barang']."','".$row['nama_barang']."','".$row['nama_kategori']."','".$row['satuan']."','".$jumlah."','".$row['harga_satuan']."','".$total."','0')";
        echo $query;
        //$conn->query($query);
        if ($conn->query($query) === FALSE) {
          $query="update transaksi set nama_barang='".$row['nama_barang']."',nama_kategori='".$row['nama_kategori']."',satuan='".$row['satuan']."',jumlah='".$jumlah."' ,harga_satuan='".$row['harga_satuan']."',total='".$total."' where tgl='".$_POST['tgl']."' and id_barang='".$row['id_barang']."' and event='biasa'";
          //echo $query;
          $conn->query($query);
        }
        /*$query="insert into stok_bahan values('".$row['id_barang']."','".$row['nama_barang']."',".$jumlah.",'".$row['satuan']."')";
        if ($conn->query($query) === FALSE) {
          $query="update stok_bahan set jumlah = jumlah + ".$jumlah." where id_bahan = '".$row['id_barang']."'";
          //echo $query;
          $conn->query($query);
        }*/
        
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
  if(!isset($_SESSION['username'])){
    header("Location:login.php?b=2");
  }
  ?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Dashboard</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
  <!-- Morris chart -->
  <link rel="stylesheet" href="bower_components/morris.js/morris.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="bower_components/jvectormap/jquery-jvectormap.css">
  <!-- Date Picker -->
  <link rel="stylesheet" href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="index2.html" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>A</b>LT</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Admin</b>LTE</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          <li class="dropdown messages-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-envelope-o"></i>
              <span class="label label-success">4</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 4 messages</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                  <li><!-- start message -->
                    <a href="#">
                      <div class="pull-left">
                        <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        Support Team
                        <small><i class="fa fa-clock-o"></i> 5 mins</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                  <!-- end message -->
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        AdminLTE Design Team
                        <small><i class="fa fa-clock-o"></i> 2 hours</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="dist/img/user4-128x128.jpg" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        Developers
                        <small><i class="fa fa-clock-o"></i> Today</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        Sales Department
                        <small><i class="fa fa-clock-o"></i> Yesterday</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="dist/img/user4-128x128.jpg" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        Reviewers
                        <small><i class="fa fa-clock-o"></i> 2 days</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="footer"><a href="#">See All Messages</a></li>
            </ul>
          </li>
          <!-- Notifications: style can be found in dropdown.less -->
          <li class="dropdown notifications-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-bell-o"></i>
              <span class="label label-warning">10</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 10 notifications</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                  <li>
                    <a href="#">
                      <i class="fa fa-users text-aqua"></i> 5 new members joined today
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-warning text-yellow"></i> Very long description here that may not fit into the
                      page and may cause design problems
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-users text-red"></i> 5 new members joined
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-shopping-cart text-green"></i> 25 sales made
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-user text-red"></i> You changed your username
                    </a>
                  </li>
                </ul>
              </li>
              <li class="footer"><a href="#">View all</a></li>
            </ul>
          </li>
          <!-- Tasks: style can be found in dropdown.less -->
          <li class="dropdown tasks-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-flag-o"></i>
              <span class="label label-danger">9</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 9 tasks</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Design some buttons
                        <small class="pull-right">20%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">20% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Create a nice theme
                        <small class="pull-right">40%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-green" style="width: 40%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">40% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Some task I need to do
                        <small class="pull-right">60%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-red" style="width: 60%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">60% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Make beautiful transitions
                        <small class="pull-right">80%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-yellow" style="width: 80%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">80% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                </ul>
              </li>
              <li class="footer">
                <a href="#">View all tasks</a>
              </li>
            </ul>
          </li>
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs">Alexander Pierce</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                <p>
                  Alexander Pierce - Web Developer
                  <small>Member since Nov. 2012</small>
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a href="#">Followers</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Sales</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Friends</a>
                  </div>
                </div>
                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">Profile</a>
                </div>
                <div class="pull-right">
                  <a href="login.php?b=1" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>Alexander Pierce</p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
          <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <?php
          if($_SESSION['status']=='0'){
            ?>
            <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MAIN NAVIGATION</li>
        <li class="active treeview">
          <a href="#">
            <i class="fa fa-dashboard"></i> <span>Pembelian</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="index.php"><i class="fa fa-circle-o"></i> Data bahan baku</a></li>
            <li><a href="stok_bahan.php"><i class="fa fa-circle-o"></i> Stok bahan</a></li>
            <li><a href="penerimaan.php"><i class="fa fa-circle-o"></i> Penerimaan</a></li>
          </ul>
        </li>
        <li>
          <a href="transaksi.php">
            <i class="fa fa-calendar"></i> <span>Transaksi</span>
          </a>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-dashboard"></i> <span>Makanan</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="tambahmakanan.php"><i class="fa fa-circle-o"></i> Tambah Makanan</a></li>
            <li><a href="daftarmakanan.php"><i class="fa fa-circle-o"></i> Daftar Makanan</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-dashboard"></i> <span>Metode</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="eoq.php"><i class="fa fa-circle-o"></i> EOQ</a></li>
            <li><a href="ss.php"><i class="fa fa-circle-o"></i> Safety Stock</a></li>
            <li><a href="rop.php"><i class="fa fa-circle-o"></i> ROP</a></li>
          </ul>
        </li>
      </ul>
          <?php
          }else if($_SESSION['status']=='1'){
            ?>
          <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MAIN NAVIGATION</li>
        <li class="active treeview">
          <a href="#">
            <i class="fa fa-dashboard"></i> <span>Pembelian</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="index.php"><i class="fa fa-circle-o"></i> Data bahan baku</a></li>
          </ul>
        </li>
        <li>
          <a href="transaksi.php">
            <i class="fa fa-calendar"></i> <span>Transaksi</span>
          </a>
        </li>
        
      </ul>
            <?php
          }
          ?>
      
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Dashboard
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->
      
      <!-- /.row -->
      <!-- Main row -->
      <div class="row">
        <!-- Left col -->
        <?php
        if($_SESSION['status']=='0'){
        ?>
        <section class="col-lg-12">
          <!-- Custom tabs (Charts with tabs)-->
          <!-- quick email widget -->
          <div class="box box-info">
            <div class="box-header">
              <i class="fa fa-envelope"></i>

              <h3 class="box-title">FORM DATA BAHAN BAKU</h3>
              <!-- tools box -->
              <div class="pull-right box-tools">
                
              </div>
              <!-- /. tools -->
            </div>
            <div class="box-body" id="gantibarang">
              <form action="#" method="post">
                <div class="form-group">ID BAHAN
                  <input type="text" class="form-control" name="idbarang" id="idbarang">
                </div>
                <div class="form-group">NAMA BAHAN BAKU
                  <input type="text" class="form-control" name="namabarang" id="namabarang">
                </div>
                <div class="form-group">KATEGORI
                  <?php
                $sql = "select distinct(nama_kategori) from barang";
                $result = mysqli_query($conn, $sql);
                echo "<select name='kategori' class='form-control' id='kategori'>";
                while($row = mysqli_fetch_assoc($result)){
                  echo "<option value='".$row['nama_kategori']."'>".$row['nama_kategori']."</option>";
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
              </form>
            </div>
            <div class="box-footer clearfix">
              <input type="submit" name="tambah" id="tambah" value="Tambah" onclick=tambah()>
              <input type="submit" name="ubah" id="ubah" value="Ubah" onclick=ubah()>
              <input type="submit" name="hapus" id="hapus" value="Hapus" onclick=hapus()>
              <button type="button" class="pull-right btn btn-default" id="sendEmail">Send
                <i class="fa fa-arrow-circle-right"></i></button>
            </div>
          </div>

          <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <!-- /.box-header -->
            <div class="box-body">
              <form method="POST">
              Tanggal : <input type="date" name="date" id="date" onchange=cektgl() required>
            <input type="button" name="cari" id="cari" onclick=cari() value="cari">
            
  <input type="text" name="tgl" id="tgl" hidden>
              <!--box2-->
            <div id="tampildata">
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
                  $bulann='';
                  $tahunn='';
                  $sql2 = "select distinct tahun from eoq order by tahun desc limit 1";  
                  $result2 = mysqli_query($conn, $sql2);
                  while($row2 = mysqli_fetch_assoc($result2)){
                    $sql4 = "select distinct bulan from eoq where tahun='".$row2['tahun']."' order by bulan desc limit 1"; 
                    $result4 = mysqli_query($conn, $sql4);
                    while($row4 = mysqli_fetch_assoc($result4)){
                      $bulann = $row4['bulan'];
                      $tahunn = $row2['tahun'];
                      //echo $bulann.$tahunn;
                    }
                  }
                  $sql3 = "select * from stok_bahan a join eoq b on (a.id_bahan=b.id_bahan) join barang c on (a.id_bahan=c.id_barang) join biaya d on (c.nama_kategori=d.nama_kategori) where bulan = '".$bulann."' and tahun='".$tahunn."'";
                  //echo $sql3;
                  $result3 = mysqli_query($conn, $sql3);
                  $asdd=0;
                  while($row3 = mysqli_fetch_assoc($result3)){
                    $cekcek[$asdd]=$row3['jumlah'];

                    if($row['b_penyimpanan']!='0'){
                      $sql2 = "select sum(jumlah) a ,MAX(jumlah) b, AVG(jumlah) c from transaksi_bahan where date_format(tgl,'%c') = '".$bulann."' and date_format(tgl,'%Y') = '".$tahunn."' and id_bahan='".$row3['id_bahan']."'";
                      //echo $sql2; 
                      $result2 = mysqli_query($conn, $sql2);
                      while($row2 = mysqli_fetch_assoc($result2)){
                        //echo $row['b_penyimpanan'];
                        $hasil = sqrt((2*$row2['a']*$row3['b_pemesanan'])/$row3['b_penyimpanan']);
                        $hasil2 = ($row2['b']-$row2['c'])*1;
                        $hasil3=($row2['c']*1)+$hasil2;
                        //echo $hasil3;
                      }

                      $eoq[$asdd]=$hasil;
                      $rop[$asdd]=$hasil3;
                      //echo number_format($hasil,2);
                    }
                    else{
                      $eoq[$asdd]="-";
                    }

                    $asdd++;
                  }
                $sql = "select * from barang join stok_bahan on (barang.id_barang=stok_bahan.id_bahan)";
                $result = mysqli_query($conn, $sql);
                $asas=0;
                $totalsemua=0;
                while($row = mysqli_fetch_assoc($result)){
                  $cekcekk=0;
                  if($cekcek[$asas]<$rop[$asas]){
                    $cekcekk=1;
                    
                  }
                  echo "<tr>";
                  echo "<td><input name='qty_".$row['id_barang']."' type='text' id='qty_".$row['id_barang']."' onkeyup=cekharga('".$row['id_barang']."','".$row['harga_satuan']."') ";
                  if($cekcekk==1){
                    echo "value='".number_format($eoq[$asas],1)."'";
                  }
                  echo ">";
                  $sql = "select * from stok_bahan a join barang c on (a.id_bahan=c.id_barang) join biaya d on (c.nama_kategori=d.nama_kategori)";
                  if($cekcekk==1){
                    echo "Segera beli";
                  }
                  //echo $cekcek[$asas];
                  //echo $eoq[$asas];
                  
                  echo "</td>";
                  echo "<td>".$row['satuan'];
                  echo "</td>";
                  echo "<td>".$row['id_barang'];
                  echo "</td>";
                  echo "<td><button type='button' id='dbarang' onclick=cekgantibarang('".$row['id_barang']."')>".$row['nama_barang']."</button>";
                  echo "</td>";
                  echo "<td><input type='text' id='hasil_".$row['id_barang']."' value=";
                  if($cekcekk==1){
                    $totalsemua += number_format($eoq[$asas],1)*$row['harga_satuan'];
                    echo number_format($eoq[$asas],1)*$row['harga_satuan'];
                  }else{
                    echo "0";
                  }
                  echo " disabled>";
                  echo "</td>";
                  echo "<td>".$row['supplier'];
                  echo "</td>";
                  echo "</tr>";
                  $asas++;                
                }
                ?>  
              </table>
            
              <div id="total">
    Total : <input type="text" name="totall" id="totall" value=<?php 
    if($cekcekk==1){
      echo $totalsemua;
    }else{
      echo "0";
    } ?> disabled>
    </div>
  
    </div>
    <input type="submit" name="simpan" id="simpan" value="BELI BAHAN">
    </form>
            </div>
          </div>
        
        </section>
        <?php
        }
        ?>
        <div class="col-xs-12">
          <div class="box">
            <!-- /.box-header -->
            <div class="box-body">
              <form method="post">
                Laporan Daily Market List : <input type="date" name="tgllaporan"><input type="submit" name="laporan" value="Cetak laporan"><br>
                Laporan Pemakaian Bulanan: <select name='bulanan'>
                  <option value="1">Januari</option>
                  <option value="2">Februari</option>
                  <option value="3">Maret</option>
                  <option value="4">April</option>
                  <option value="5">Mei</option>
                  <option value="6">Juni</option>
                  <option value="7">Juli</option>
                  <option value="8">Agustus</option>
                  <option value="9">September</option>
                  <option value="10">Oktober</option>
                  <option value="11">November</option>
                  <option value="12">Desember</option>
                </select>
                <select name="tahunan">
          <option value="2017">2017</option>
          <option value="2018">2018</option>
          <option value="2019">2019</option>
        </select><input type="submit" name="laporanbulanan" value="Cetak laporan">
              </form>
          </div>
        </div>
      </div>
        <!-- /.Left col -->
        <!-- right col (We are only adding the ID to make the widgets sortable)-->
        
        <!-- right col -->
      </div>
      <!-- /.row (main row) -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.4.0
    </div>
    <strong>Copyright &copy; 2014-2016 <a href="https://adminlte.io">Almsaeed Studio</a>.</strong> All rights
    reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">Recent Activity</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-birthday-cake bg-red"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                <p>Will be 23 on April 24th</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-user bg-yellow"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>

                <p>New phone +1(800)555-1234</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>

                <p>nora@example.com</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-file-code-o bg-green"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>

                <p>Execution time 5 seconds</p>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

        <h3 class="control-sidebar-heading">Tasks Progress</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Custom Template Design
                <span class="label label-danger pull-right">70%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Update Resume
                <span class="label label-success pull-right">95%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-success" style="width: 95%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Laravel Integration
                <span class="label label-warning pull-right">50%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Back End Framework
                <span class="label label-primary pull-right">68%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

      </div>
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
        <form method="post">
          <h3 class="control-sidebar-heading">General Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Report panel usage
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Some information about this general settings option
            </p>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Allow mail redirect
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Other sets of options are available
            </p>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Expose author name in posts
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Allow the user to show his name in blog posts
            </p>
          </div>
          <!-- /.form-group -->

          <h3 class="control-sidebar-heading">Chat Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Show me as online
              <input type="checkbox" class="pull-right" checked>
            </label>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Turn off notifications
              <input type="checkbox" class="pull-right">
            </label>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Delete chat history
              <a href="javascript:void(0)" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
            </label>
          </div>
          <!-- /.form-group -->
        </form>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
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
        //alert(val1);
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
      var f = document.getElementById("supplier").value;
      if( (a == "")||(b == "")||(c == "")||(d == "")||(e == "")||(f == "")){
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
          xihttp.open("GET", "tampildata.php?id_barang="+a+"&nama_barang="+b+"&kategori="+c+"&size="+d+"&hargasatuan="+e+"&supplier="+f, true);
          xihttp.send();
        document.getElementById('idbarang').value = null;
        document.getElementById('namabarang').value = null;
        document.getElementById('kategori').value = null;
        document.getElementById('size').value = null;
        document.getElementById('hargasatuan').value = 0;
        document.getElementById('supplier').value = null;
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
<script src="bower_components/jquery/dist/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="bower_components/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.7 -->
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Morris.js charts -->
<script src="bower_components/raphael/raphael.min.js"></script>
<script src="bower_components/morris.js/morris.min.js"></script>
<!-- Sparkline -->
<script src="bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- jQuery Knob Chart -->
<script src="bower_components/jquery-knob/dist/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="bower_components/moment/min/moment.min.js"></script>
<script src="bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- datepicker -->
<script src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<script src="bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script>
  $(function () {
    $('#example1').DataTable()
    $('#example2').DataTable({
      'paging'      : true,
      'lengthChange': false,
      'lengthChange': false,
      'searching'   : false,
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false
    })
  })
</script>
</body>
</html>
