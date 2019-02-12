-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 12, 2019 at 04:20 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bimo`
--

-- --------------------------------------------------------

--
-- Table structure for table `bahan_makanan`
--

CREATE TABLE `bahan_makanan` (
  `id_bahan_makanan` varchar(10) NOT NULL,
  `id_makanan` varchar(5) NOT NULL,
  `id_bahan` varchar(10) NOT NULL,
  `jumlah` double NOT NULL,
  `satuan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bahan_makanan`
--

INSERT INTO `bahan_makanan` (`id_bahan_makanan`, `id_makanan`, `id_bahan`, `jumlah`, `satuan`) VALUES
('1', 'NSGRG', 'GR001', 0.2, 'KG'),
('10', 'SOTOA', 'GR003', 0.5, 'PCS'),
('11', 'SOTOA', 'AY001', 0.1, 'KG'),
('12', 'SOTOA', 'SR001', 0.05, 'KG'),
('13', 'SOTOA', 'GR005', 0.04, 'KG'),
('14', 'SOTOA', 'SR002', 0.02, 'KG'),
('15', 'BISTI', 'DG001', 0.3, 'KG'),
('16', 'BISTI', 'GR005', 0.1, 'KG'),
('17', 'BISTI', 'SR003', 0.1, 'KG'),
('18', 'BISTI', 'SR002', 0.1, 'KG'),
('19', 'DSSRT', 'BU001', 0.2, 'KG'),
('2', 'NSGRG', 'AY001', 0.08, 'KG'),
('20', 'DSSRT', 'BU002', 0.2, 'KG'),
('21', 'DSSRT', 'BU003', 0.2, 'KG'),
('22', 'DSSRT', 'BU004', 0.2, 'KG'),
('23', 'DSSRT', 'GR004', 0.5, 'PCS'),
('24', 'SOTOA', 'AY001', 0.1, 'KG'),
('25', 'SOTOA', 'GR003', 0.5, 'PCS'),
('26', 'SOTOA', 'GR005', 0.05, 'KG'),
('27', 'SOTOA', 'SR002', 0.015, 'KG'),
('28', 'SOTOA', 'SR001', 0.02, 'KG'),
('29', 'STO', 'AY001', 0.15, 'KG'),
('3', 'NSGRG', 'GR002', 0.5, 'PCS'),
('30', 'STO', 'GR003', 0.5, 'PCS'),
('31', 'STO', 'GR005', 0.06, 'KG'),
('32', 'STO', 'SR001', 0.015, 'KG'),
('33', 'STO', 'SR002', 0.02, 'KG'),
('34', 'NSGRG', 'SR002', 0.01, 'KG'),
('4', 'NSGRG', 'SR001', 0.01, 'KG'),
('5', 'SOTOA', 'GR003', 0.5, 'PCS'),
('6', 'SOTOA', 'AY001', 0.1, 'KG'),
('7', 'SOTOA', 'SR001', 0.05, 'KG'),
('8', 'SOTOA', 'GR005', 0.04, 'KG'),
('9', 'SOTOA', 'SR002', 0.02, 'KG');

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` varchar(30) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `satuan` varchar(10) NOT NULL,
  `harga_satuan` int(11) NOT NULL,
  `supplier` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `nama_kategori`, `satuan`, `harga_satuan`, `supplier`) VALUES
('AY001', 'AYAM POTONG', 'AYAM', 'KG', 40000, 'AURIGA'),
('BU001', 'APEL FUJI', 'BUAH', 'KG', 30000, 'APPLE JAYA'),
('BU002', 'MELON', 'BUAH', 'KG', 15000, 'APPLE JAYA'),
('BU003', 'SEMANGKA MERAH', 'BUAH', 'KG', 4000, 'APPLE JAYA'),
('BU004', 'SEMANGKA KUNING', 'BUAH', 'KG', 11000, 'APPLE JAYA'),
('DG001', 'DAGING SAPI', 'DAGING', 'KG', 118000, 'APPLE JAYA'),
('GR001', 'BERAS', 'GROCERIES', 'KG', 11000, 'AURIGA'),
('GR002', 'BUMBU NASI GORENG', 'GROCERIES', 'PCS', 5200, 'AURIGA'),
('GR003', 'BUMBU SOTO AYAM', 'GROCERIES', 'PCS', 5200, 'AURIGA'),
('GR004', 'AGAR - AGAR COKLAT', 'GROCERIES', 'PCS', 4400, 'AURIGA'),
('GR005', 'KENTANG', 'GROCERIES', 'KG', 14000, 'AURIGA'),
('SR001', 'DAUN BAWANG', 'SAYURAN_DAN_REMPAH', 'KG', 7000, 'APPLE JAYA'),
('SR002', 'TOMAT', 'SAYURAN_DAN_REMPAH', 'KG', 11000, 'APPLE JAYA'),
('SR003', 'WORTEL LOKAL', 'SAYURAN_DAN_REMPAH', 'KG', 13000, 'APPLE JAYA');

-- --------------------------------------------------------

--
-- Table structure for table `biaya`
--

CREATE TABLE `biaya` (
  `id_biaya` varchar(3) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `biaya_penyimpanan` int(11) NOT NULL,
  `biaya_pemesanan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `biaya`
--

INSERT INTO `biaya` (`id_biaya`, `nama_kategori`, `biaya_penyimpanan`, `biaya_pemesanan`) VALUES
('1', 'AYAM', 3945, 60600),
('10', 'SNACK', 3000, 60600),
('11', 'SOSIS', 3000, 60600),
('2', 'DAGING', 3945, 60600),
('3', 'BUAH', 2761, 60600),
('4', 'SAYURAN_DAN_REMPAH', 2761, 60600),
('5', 'GROCERIES', 3000, 60600),
('6', 'JUICE', 3000, 60600),
('7', 'KERUPUK', 3000, 60600),
('8', 'OTHER', 3000, 60600),
('9', 'SEAFOOD', 3000, 60600);

-- --------------------------------------------------------

--
-- Table structure for table `eoq`
--

CREATE TABLE `eoq` (
  `bulan` varchar(15) NOT NULL,
  `tahun` varchar(4) NOT NULL,
  `id_bahan` varchar(10) NOT NULL,
  `b_pemesanan` int(11) NOT NULL,
  `b_penyimpanan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eoq`
--

INSERT INTO `eoq` (`bulan`, `tahun`, `id_bahan`, `b_pemesanan`, `b_penyimpanan`) VALUES
('12', '2018', 'AY001', 60600, 3945),
('12', '2018', 'BU001', 60600, 2761),
('12', '2018', 'BU002', 60600, 2761),
('12', '2018', 'BU003', 60600, 2761),
('12', '2018', 'BU004', 60600, 2761),
('12', '2018', 'DG001', 60600, 3945),
('12', '2018', 'GR001', 60600, 3000),
('12', '2018', 'GR002', 60600, 3000),
('12', '2018', 'GR003', 60600, 3000),
('12', '2018', 'GR004', 60600, 3000),
('12', '2018', 'GR005', 60600, 3000),
('12', '2018', 'SR001', 60600, 2761),
('12', '2018', 'SR002', 60600, 2761),
('12', '2018', 'SR003', 60600, 2761);

-- --------------------------------------------------------

--
-- Table structure for table `hitung`
--

CREATE TABLE `hitung` (
  `id_barang` varchar(10) NOT NULL,
  `harga_satuan` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kategori_barang`
--

CREATE TABLE `kategori_barang` (
  `nama_kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori_barang`
--

INSERT INTO `kategori_barang` (`nama_kategori`) VALUES
('AYAM'),
('BUAH'),
('DAGING'),
('GROCERIES'),
('JUICE'),
('KERUPUK'),
('OTHER'),
('SAYURAN_DAN_REMPAH'),
('SEAFOOD'),
('SNACK'),
('SOSIS');

-- --------------------------------------------------------

--
-- Table structure for table `makanan`
--

CREATE TABLE `makanan` (
  `id_makanan` varchar(5) NOT NULL,
  `nama_makanan` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `makanan`
--

INSERT INTO `makanan` (`id_makanan`, `nama_makanan`) VALUES
('BISTI', 'BISTIK DAGING'),
('DSSRT', 'DESSERT'),
('NSGRG', 'NASI GORENG'),
('STO', 'SOTO');

-- --------------------------------------------------------

--
-- Table structure for table `stok_bahan`
--

CREATE TABLE `stok_bahan` (
  `id_bahan` varchar(10) NOT NULL,
  `nama_bahan` varchar(1000) NOT NULL,
  `jumlah` float NOT NULL,
  `satuan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stok_bahan`
--

INSERT INTO `stok_bahan` (`id_bahan`, `nama_bahan`, `jumlah`, `satuan`) VALUES
('AY001', 'AYAM POTONG', 3.01, 'KG'),
('BU001', 'APEL FUJI', 0, 'KG'),
('BU002', 'MELON', 0, 'KG'),
('BU003', 'SEMANGKA MERAH', 0, 'KG'),
('BU004', 'SEMANGKA KUNING', 0, 'KG'),
('DG001', 'DAGING SAPI', 0, 'KG'),
('GR001', 'BERAS', 0, 'KG'),
('GR002', 'BUMBU NASI GORENG', 3.5, 'PCS'),
('GR003', 'BUMBU SOTO AYAM', 3.5, 'PCS'),
('GR004', 'AGAR - AGAR COKLAT', 3.5, 'PCS'),
('GR005', 'KENTANG', 1.92, 'KG'),
('SR001', 'DAUN BAWANG', 2.675, 'KG'),
('SR002', 'TOMAT', 3.11, 'KG'),
('SR003', 'WORTEL LOKAL', 4.7, 'KG');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `event` varchar(30) NOT NULL,
  `tgl` date NOT NULL,
  `id_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `satuan` varchar(10) NOT NULL,
  `jumlah` float NOT NULL,
  `harga_satuan` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `status` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`event`, `tgl`, `id_barang`, `nama_barang`, `nama_kategori`, `satuan`, `jumlah`, `harga_satuan`, `total`, `status`) VALUES
('biasa', '2018-12-01', 'AY001', 'AYAM POTONG', 'AYAM', 'KG', 9, 40000, 360000, '1'),
('biasa', '2018-12-01', 'BU001', 'APEL FUJI', 'BUAH', 'KG', 6.5, 30000, 195000, '1'),
('biasa', '2018-12-01', 'BU002', 'MELON', 'BUAH', 'KG', 6.5, 15000, 97500, '1'),
('biasa', '2018-12-01', 'BU003', 'SEMANGKA MERAH', 'BUAH', 'KG', 6.5, 4000, 26000, '1'),
('biasa', '2018-12-01', 'BU004', 'SEMANGKA KUNING', 'BUAH', 'KG', 6.5, 11000, 71500, '1'),
('biasa', '2018-12-01', 'DG001', 'DAGING SAPI', 'DAGING', 'KG', 9, 118000, 1062000, '1'),
('biasa', '2018-12-01', 'GR001', 'BERAS', 'GROCERIES', 'KG', 6, 11000, 66000, '1'),
('biasa', '2018-12-01', 'GR002', 'BUMBU NASI GORENG', 'GROCERIES', 'PCS', 12, 5200, 62400, '1'),
('biasa', '2018-12-01', 'GR003', 'BUMBU SOTO AYAM', 'GROCERIES', 'PCS', 12, 5200, 62400, '1'),
('biasa', '2018-12-01', 'GR004', 'AGAR - AGAR COKLAT', 'GROCERIES', 'PCS', 12, 4400, 52800, '1'),
('biasa', '2018-12-01', 'GR005', 'KENTANG', 'GROCERIES', 'KG', 0, 14000, 0, '1'),
('biasa', '2018-12-01', 'SR001', 'DAUN BAWANG', 'SAYURAN_DAN_REMPAH', 'KG', 0, 7000, 0, '1'),
('biasa', '2018-12-01', 'SR002', 'TOMAT', 'SAYURAN_DAN_REMPAH', 'KG', 0, 11000, 0, '1'),
('biasa', '2018-12-01', 'SR003', 'WORTEL LOKAL', 'SAYURAN_DAN_REMPAH', 'KG', 0, 13000, 0, '1'),
('biasa', '2018-12-02', 'AY001', 'AYAM POTONG', 'AYAM', 'KG', 4, 40000, 160000, '1'),
('biasa', '2018-12-02', 'BU001', 'APEL FUJI', 'BUAH', 'KG', 5, 30000, 150000, '1'),
('biasa', '2018-12-02', 'BU002', 'MELON', 'BUAH', 'KG', 5, 15000, 75000, '1'),
('biasa', '2018-12-02', 'BU003', 'SEMANGKA MERAH', 'BUAH', 'KG', 5, 4000, 20000, '1'),
('biasa', '2018-12-02', 'BU004', 'SEMANGKA KUNING', 'BUAH', 'KG', 5, 11000, 55000, '1'),
('biasa', '2018-12-02', 'DG001', 'DAGING SAPI', 'DAGING', 'KG', 8, 118000, 944000, '1'),
('biasa', '2018-12-02', 'GR001', 'BERAS', 'GROCERIES', 'KG', 4, 11000, 44000, '1'),
('biasa', '2018-12-02', 'GR002', 'BUMBU NASI GORENG', 'GROCERIES', 'PCS', 10, 5200, 52000, '1'),
('biasa', '2018-12-02', 'GR003', 'BUMBU SOTO AYAM', 'GROCERIES', 'PCS', 10, 5200, 52000, '1'),
('biasa', '2018-12-02', 'GR004', 'AGAR - AGAR COKLAT', 'GROCERIES', 'PCS', 10, 4400, 44000, '1'),
('biasa', '2018-12-02', 'GR005', 'KENTANG', 'GROCERIES', 'KG', 15, 14000, 210000, '1'),
('biasa', '2018-12-02', 'SR001', 'DAUN BAWANG', 'SAYURAN_DAN_REMPAH', 'KG', 0, 7000, 0, '1'),
('biasa', '2018-12-02', 'SR002', 'TOMAT', 'SAYURAN_DAN_REMPAH', 'KG', 5, 11000, 55000, '1'),
('biasa', '2018-12-02', 'SR003', 'WORTEL LOKAL', 'SAYURAN_DAN_REMPAH', 'KG', 8, 13000, 104000, '1'),
('biasa', '2018-12-04', 'AY001', 'AYAM POTONG', 'AYAM', 'KG', 4, 40000, 160000, '1'),
('biasa', '2018-12-04', 'BU001', 'APEL FUJI', 'BUAH', 'KG', 6, 30000, 180000, '1'),
('biasa', '2018-12-04', 'BU002', 'MELON', 'BUAH', 'KG', 6, 15000, 90000, '1'),
('biasa', '2018-12-04', 'BU003', 'SEMANGKA MERAH', 'BUAH', 'KG', 6, 4000, 24000, '1'),
('biasa', '2018-12-04', 'BU004', 'SEMANGKA KUNING', 'BUAH', 'KG', 6, 11000, 66000, '1'),
('biasa', '2018-12-04', 'DG001', 'DAGING SAPI', 'DAGING', 'KG', 6, 118000, 708000, '1'),
('biasa', '2018-12-04', 'GR001', 'BERAS', 'GROCERIES', 'KG', 0, 11000, 0, '1'),
('biasa', '2018-12-04', 'GR002', 'BUMBU NASI GORENG', 'GROCERIES', 'PCS', 0, 5200, 0, '1'),
('biasa', '2018-12-04', 'GR003', 'BUMBU SOTO AYAM', 'GROCERIES', 'PCS', 0, 5200, 0, '1'),
('biasa', '2018-12-04', 'GR004', 'AGAR - AGAR COKLAT', 'GROCERIES', 'PCS', 0, 4400, 0, '1'),
('biasa', '2018-12-04', 'GR005', 'KENTANG', 'GROCERIES', 'KG', 0, 14000, 0, '1'),
('biasa', '2018-12-04', 'SR001', 'DAUN BAWANG', 'SAYURAN_DAN_REMPAH', 'KG', 0, 7000, 0, '1'),
('biasa', '2018-12-04', 'SR002', 'TOMAT', 'SAYURAN_DAN_REMPAH', 'KG', 0, 11000, 0, '1'),
('biasa', '2018-12-04', 'SR003', 'WORTEL LOKAL', 'SAYURAN_DAN_REMPAH', 'KG', 0, 13000, 0, '1'),
('biasa', '2018-12-05', 'AY001', 'AYAM POTONG', 'AYAM', 'KG', 5, 40000, 200000, '1'),
('biasa', '2018-12-05', 'BU001', 'APEL FUJI', 'BUAH', 'KG', 3, 30000, 90000, '1'),
('biasa', '2018-12-05', 'BU002', 'MELON', 'BUAH', 'KG', 3, 15000, 45000, '1'),
('biasa', '2018-12-05', 'BU003', 'SEMANGKA MERAH', 'BUAH', 'KG', 3, 4000, 12000, '1'),
('biasa', '2018-12-05', 'BU004', 'SEMANGKA KUNING', 'BUAH', 'KG', 3, 11000, 33000, '1'),
('biasa', '2018-12-05', 'DG001', 'DAGING SAPI', 'DAGING', 'KG', 5, 118000, 590000, '1'),
('biasa', '2018-12-05', 'GR001', 'BERAS', 'GROCERIES', 'KG', 5, 11000, 55000, '1'),
('biasa', '2018-12-05', 'GR002', 'BUMBU NASI GORENG', 'GROCERIES', 'PCS', 7, 5200, 36400, '1'),
('biasa', '2018-12-05', 'GR003', 'BUMBU SOTO AYAM', 'GROCERIES', 'PCS', 10, 5200, 52000, '1'),
('biasa', '2018-12-05', 'GR004', 'AGAR - AGAR COKLAT', 'GROCERIES', 'PCS', 10, 4400, 44000, '1'),
('biasa', '2018-12-05', 'GR005', 'KENTANG', 'GROCERIES', 'KG', 0, 14000, 0, '1'),
('biasa', '2018-12-05', 'SR001', 'DAUN BAWANG', 'SAYURAN_DAN_REMPAH', 'KG', 0, 7000, 0, '1'),
('biasa', '2018-12-05', 'SR002', 'TOMAT', 'SAYURAN_DAN_REMPAH', 'KG', 0, 11000, 0, '1'),
('biasa', '2018-12-05', 'SR003', 'WORTEL LOKAL', 'SAYURAN_DAN_REMPAH', 'KG', 0, 13000, 0, '1'),
('biasa', '2018-12-06', 'AY001', 'AYAM POTONG', 'AYAM', 'KG', 6, 40000, 240000, '1'),
('biasa', '2018-12-06', 'BU001', 'APEL FUJI', 'BUAH', 'KG', 4, 30000, 120000, '1'),
('biasa', '2018-12-06', 'BU002', 'MELON', 'BUAH', 'KG', 4, 15000, 60000, '1'),
('biasa', '2018-12-06', 'BU003', 'SEMANGKA MERAH', 'BUAH', 'KG', 4, 4000, 16000, '1'),
('biasa', '2018-12-06', 'BU004', 'SEMANGKA KUNING', 'BUAH', 'KG', 4, 11000, 44000, '1'),
('biasa', '2018-12-06', 'DG001', 'DAGING SAPI', 'DAGING', 'KG', 8, 118000, 944000, '1'),
('biasa', '2018-12-06', 'GR001', 'BERAS', 'GROCERIES', 'KG', 2, 11000, 22000, '1'),
('biasa', '2018-12-06', 'GR002', 'BUMBU NASI GORENG', 'GROCERIES', 'PCS', 12, 5200, 62400, '1'),
('biasa', '2018-12-06', 'GR003', 'BUMBU SOTO AYAM', 'GROCERIES', 'PCS', 12, 5200, 62400, '1'),
('biasa', '2018-12-06', 'GR004', 'AGAR - AGAR COKLAT', 'GROCERIES', 'PCS', 12, 4400, 52800, '1'),
('biasa', '2018-12-06', 'GR005', 'KENTANG', 'GROCERIES', 'KG', 5, 14000, 70000, '1'),
('biasa', '2018-12-06', 'SR001', 'DAUN BAWANG', 'SAYURAN_DAN_REMPAH', 'KG', 0, 7000, 0, '1'),
('biasa', '2018-12-06', 'SR002', 'TOMAT', 'SAYURAN_DAN_REMPAH', 'KG', 0, 11000, 0, '1'),
('biasa', '2018-12-06', 'SR003', 'WORTEL LOKAL', 'SAYURAN_DAN_REMPAH', 'KG', 8, 13000, 104000, '1'),
('biasa', '2018-12-07', 'AY001', 'AYAM POTONG', 'AYAM', 'KG', 7, 40000, 280000, '1'),
('biasa', '2018-12-07', 'BU001', 'APEL FUJI', 'BUAH', 'KG', 7, 30000, 210000, '1'),
('biasa', '2018-12-07', 'BU002', 'MELON', 'BUAH', 'KG', 7, 15000, 105000, '1'),
('biasa', '2018-12-07', 'BU003', 'SEMANGKA MERAH', 'BUAH', 'KG', 7, 4000, 28000, '1'),
('biasa', '2018-12-07', 'BU004', 'SEMANGKA KUNING', 'BUAH', 'KG', 7, 11000, 77000, '1'),
('biasa', '2018-12-07', 'DG001', 'DAGING SAPI', 'DAGING', 'KG', 9, 118000, 1062000, '1'),
('biasa', '2018-12-07', 'GR001', 'BERAS', 'GROCERIES', 'KG', 5, 11000, 55000, '1'),
('biasa', '2018-12-07', 'GR002', 'BUMBU NASI GORENG', 'GROCERIES', 'PCS', 18, 5200, 93600, '1'),
('biasa', '2018-12-07', 'GR003', 'BUMBU SOTO AYAM', 'GROCERIES', 'PCS', 18, 5200, 93600, '1'),
('biasa', '2018-12-07', 'GR004', 'AGAR - AGAR COKLAT', 'GROCERIES', 'PCS', 18, 4400, 79200, '1'),
('biasa', '2018-12-07', 'GR005', 'KENTANG', 'GROCERIES', 'KG', 3, 14000, 42000, '1'),
('biasa', '2018-12-07', 'SR001', 'DAUN BAWANG', 'SAYURAN_DAN_REMPAH', 'KG', 1, 7000, 7000, '1'),
('biasa', '2018-12-07', 'SR002', 'TOMAT', 'SAYURAN_DAN_REMPAH', 'KG', 5, 11000, 55000, '1'),
('biasa', '2018-12-07', 'SR003', 'WORTEL LOKAL', 'SAYURAN_DAN_REMPAH', 'KG', 4, 13000, 52000, '1'),
('biasa', '2018-12-08', 'AY001', 'AYAM POTONG', 'AYAM', 'KG', 8, 40000, 320000, '1'),
('biasa', '2018-12-08', 'BU001', 'APEL FUJI', 'BUAH', 'KG', 8, 30000, 240000, '1'),
('biasa', '2018-12-08', 'BU002', 'MELON', 'BUAH', 'KG', 8, 15000, 120000, '1'),
('biasa', '2018-12-08', 'BU003', 'SEMANGKA MERAH', 'BUAH', 'KG', 8, 4000, 32000, '1'),
('biasa', '2018-12-08', 'BU004', 'SEMANGKA KUNING', 'BUAH', 'KG', 8, 11000, 88000, '1'),
('biasa', '2018-12-08', 'DG001', 'DAGING SAPI', 'DAGING', 'KG', 9, 118000, 1062000, '1'),
('biasa', '2018-12-08', 'GR001', 'BERAS', 'GROCERIES', 'KG', 4, 11000, 44000, '1'),
('biasa', '2018-12-08', 'GR002', 'BUMBU NASI GORENG', 'GROCERIES', 'PCS', 12, 5200, 62400, '1'),
('biasa', '2018-12-08', 'GR003', 'BUMBU SOTO AYAM', 'GROCERIES', 'PCS', 12, 5200, 62400, '1'),
('biasa', '2018-12-08', 'GR004', 'AGAR - AGAR COKLAT', 'GROCERIES', 'PCS', 12, 4400, 52800, '1'),
('biasa', '2018-12-08', 'GR005', 'KENTANG', 'GROCERIES', 'KG', 5, 14000, 70000, '1'),
('biasa', '2018-12-08', 'SR001', 'DAUN BAWANG', 'SAYURAN_DAN_REMPAH', 'KG', 1.5, 7000, 10500, '1'),
('biasa', '2018-12-08', 'SR002', 'TOMAT', 'SAYURAN_DAN_REMPAH', 'KG', 0, 11000, 0, '1'),
('biasa', '2018-12-08', 'SR003', 'WORTEL LOKAL', 'SAYURAN_DAN_REMPAH', 'KG', 0, 13000, 0, '1'),
('biasa', '2018-12-09', 'AY001', 'AYAM POTONG', 'AYAM', 'KG', 4, 40000, 160000, '1'),
('biasa', '2018-12-09', 'BU001', 'APEL FUJI', 'BUAH', 'KG', 3, 30000, 90000, '1'),
('biasa', '2018-12-09', 'BU002', 'MELON', 'BUAH', 'KG', 3, 15000, 45000, '1'),
('biasa', '2018-12-09', 'BU003', 'SEMANGKA MERAH', 'BUAH', 'KG', 3, 4000, 12000, '1'),
('biasa', '2018-12-09', 'BU004', 'SEMANGKA KUNING', 'BUAH', 'KG', 3, 11000, 33000, '1'),
('biasa', '2018-12-09', 'DG001', 'DAGING SAPI', 'DAGING', 'KG', 8, 118000, 944000, '1'),
('biasa', '2018-12-09', 'GR001', 'BERAS', 'GROCERIES', 'KG', 4, 11000, 44000, '1'),
('biasa', '2018-12-09', 'GR002', 'BUMBU NASI GORENG', 'GROCERIES', 'PCS', 12, 5200, 62400, '1'),
('biasa', '2018-12-09', 'GR003', 'BUMBU SOTO AYAM', 'GROCERIES', 'PCS', 12, 5200, 62400, '1'),
('biasa', '2018-12-09', 'GR004', 'AGAR - AGAR COKLAT', 'GROCERIES', 'PCS', 12, 4400, 52800, '1'),
('biasa', '2018-12-09', 'GR005', 'KENTANG', 'GROCERIES', 'KG', 15, 14000, 210000, '1'),
('biasa', '2018-12-09', 'SR001', 'DAUN BAWANG', 'SAYURAN_DAN_REMPAH', 'KG', 0, 7000, 0, '1'),
('biasa', '2018-12-09', 'SR002', 'TOMAT', 'SAYURAN_DAN_REMPAH', 'KG', 4, 11000, 44000, '1'),
('biasa', '2018-12-09', 'SR003', 'WORTEL LOKAL', 'SAYURAN_DAN_REMPAH', 'KG', 3, 13000, 39000, '1'),
('biasa', '2018-12-10', 'AY001', 'AYAM POTONG', 'AYAM', 'KG', 7, 40000, 280000, '1'),
('biasa', '2018-12-10', 'BU001', 'APEL FUJI', 'BUAH', 'KG', 8, 30000, 240000, '1'),
('biasa', '2018-12-10', 'BU002', 'MELON', 'BUAH', 'KG', 8, 15000, 120000, '1'),
('biasa', '2018-12-10', 'BU003', 'SEMANGKA MERAH', 'BUAH', 'KG', 8, 4000, 32000, '1'),
('biasa', '2018-12-10', 'BU004', 'SEMANGKA KUNING', 'BUAH', 'KG', 8, 11000, 88000, '1'),
('biasa', '2018-12-10', 'DG001', 'DAGING SAPI', 'DAGING', 'KG', 10, 118000, 1180000, '1'),
('biasa', '2018-12-10', 'GR001', 'BERAS', 'GROCERIES', 'KG', 5, 11000, 55000, '1'),
('biasa', '2018-12-10', 'GR002', 'BUMBU NASI GORENG', 'GROCERIES', 'PCS', 24, 5200, 124800, '1'),
('biasa', '2018-12-10', 'GR003', 'BUMBU SOTO AYAM', 'GROCERIES', 'PCS', 24, 5200, 124800, '1'),
('biasa', '2018-12-10', 'GR004', 'AGAR - AGAR COKLAT', 'GROCERIES', 'PCS', 24, 4400, 105600, '1'),
('biasa', '2018-12-10', 'GR005', 'KENTANG', 'GROCERIES', 'KG', 0, 14000, 0, '1'),
('biasa', '2018-12-10', 'SR001', 'DAUN BAWANG', 'SAYURAN_DAN_REMPAH', 'KG', 0, 7000, 0, '1'),
('biasa', '2018-12-10', 'SR002', 'TOMAT', 'SAYURAN_DAN_REMPAH', 'KG', 0, 11000, 0, '1'),
('biasa', '2018-12-10', 'SR003', 'WORTEL LOKAL', 'SAYURAN_DAN_REMPAH', 'KG', 0, 13000, 0, '1'),
('biasa', '2018-12-11', 'AY001', 'AYAM POTONG', 'AYAM', 'KG', 0, 40000, 0, '1'),
('biasa', '2018-12-11', 'BU001', 'APEL FUJI', 'BUAH', 'KG', 0, 30000, 0, '1'),
('biasa', '2018-12-11', 'BU002', 'MELON', 'BUAH', 'KG', 0, 15000, 0, '1'),
('biasa', '2018-12-11', 'BU003', 'SEMANGKA MERAH', 'BUAH', 'KG', 0, 4000, 0, '1'),
('biasa', '2018-12-11', 'BU004', 'SEMANGKA KUNING', 'BUAH', 'KG', 0, 11000, 0, '1'),
('biasa', '2018-12-11', 'DG001', 'DAGING SAPI', 'DAGING', 'KG', 0, 118000, 0, '1'),
('biasa', '2018-12-11', 'GR001', 'BERAS', 'GROCERIES', 'KG', 0, 11000, 0, '1'),
('biasa', '2018-12-11', 'GR002', 'BUMBU NASI GORENG', 'GROCERIES', 'PCS', 0, 5200, 0, '1'),
('biasa', '2018-12-11', 'GR003', 'BUMBU SOTO AYAM', 'GROCERIES', 'PCS', 0, 5200, 0, '1'),
('biasa', '2018-12-11', 'GR004', 'AGAR - AGAR COKLAT', 'GROCERIES', 'PCS', 0, 4400, 0, '1'),
('biasa', '2018-12-11', 'GR005', 'KENTANG', 'GROCERIES', 'KG', 0, 14000, 0, '1'),
('biasa', '2018-12-11', 'SR001', 'DAUN BAWANG', 'SAYURAN_DAN_REMPAH', 'KG', 2, 7000, 14000, '1'),
('biasa', '2018-12-11', 'SR002', 'TOMAT', 'SAYURAN_DAN_REMPAH', 'KG', 7, 11000, 77000, '1'),
('biasa', '2018-12-11', 'SR003', 'WORTEL LOKAL', 'SAYURAN_DAN_REMPAH', 'KG', 9, 13000, 117000, '1'),
('biasa', '2018-12-12', 'AY001', 'AYAM POTONG', 'AYAM', 'KG', 5, 40000, 200000, '1'),
('biasa', '2018-12-12', 'BU001', 'APEL FUJI', 'BUAH', 'KG', 5, 30000, 150000, '1'),
('biasa', '2018-12-12', 'BU002', 'MELON', 'BUAH', 'KG', 5, 15000, 75000, '1'),
('biasa', '2018-12-12', 'BU003', 'SEMANGKA MERAH', 'BUAH', 'KG', 5, 4000, 20000, '1'),
('biasa', '2018-12-12', 'BU004', 'SEMANGKA KUNING', 'BUAH', 'KG', 5, 11000, 55000, '1'),
('biasa', '2018-12-12', 'DG001', 'DAGING SAPI', 'DAGING', 'KG', 5, 118000, 590000, '1'),
('biasa', '2018-12-12', 'GR001', 'BERAS', 'GROCERIES', 'KG', 5, 11000, 55000, '1'),
('biasa', '2018-12-12', 'GR002', 'BUMBU NASI GORENG', 'GROCERIES', 'PCS', 12, 5200, 62400, '1'),
('biasa', '2018-12-12', 'GR003', 'BUMBU SOTO AYAM', 'GROCERIES', 'PCS', 12, 5200, 62400, '1'),
('biasa', '2018-12-12', 'GR004', 'AGAR - AGAR COKLAT', 'GROCERIES', 'PCS', 12, 4400, 52800, '1'),
('biasa', '2018-12-12', 'GR005', 'KENTANG', 'GROCERIES', 'KG', 0, 14000, 0, '1'),
('biasa', '2018-12-12', 'SR001', 'DAUN BAWANG', 'SAYURAN_DAN_REMPAH', 'KG', 1, 7000, 7000, '1'),
('biasa', '2018-12-12', 'SR002', 'TOMAT', 'SAYURAN_DAN_REMPAH', 'KG', 6, 11000, 66000, '1'),
('biasa', '2018-12-12', 'SR003', 'WORTEL LOKAL', 'SAYURAN_DAN_REMPAH', 'KG', 2, 13000, 26000, '1'),
('biasa', '2018-12-14', 'AY001', 'AYAM POTONG', 'AYAM', 'KG', 4, 40000, 160000, '1'),
('biasa', '2018-12-14', 'BU001', 'APEL FUJI', 'BUAH', 'KG', 4, 30000, 120000, '1'),
('biasa', '2018-12-14', 'BU002', 'MELON', 'BUAH', 'KG', 4, 15000, 60000, '1'),
('biasa', '2018-12-14', 'BU003', 'SEMANGKA MERAH', 'BUAH', 'KG', 4, 4000, 16000, '1'),
('biasa', '2018-12-14', 'BU004', 'SEMANGKA KUNING', 'BUAH', 'KG', 4, 11000, 44000, '1'),
('biasa', '2018-12-14', 'DG001', 'DAGING SAPI', 'DAGING', 'KG', 9.5, 118000, 1121000, '1'),
('biasa', '2018-12-14', 'GR001', 'BERAS', 'GROCERIES', 'KG', 4, 11000, 44000, '1'),
('biasa', '2018-12-14', 'GR002', 'BUMBU NASI GORENG', 'GROCERIES', 'PCS', 10, 5200, 52000, '1'),
('biasa', '2018-12-14', 'GR003', 'BUMBU SOTO AYAM', 'GROCERIES', 'PCS', 10, 5200, 52000, '1'),
('biasa', '2018-12-14', 'GR004', 'AGAR - AGAR COKLAT', 'GROCERIES', 'PCS', 10, 4400, 44000, '1'),
('biasa', '2018-12-14', 'GR005', 'KENTANG', 'GROCERIES', 'KG', 4, 14000, 56000, '1'),
('biasa', '2018-12-14', 'SR001', 'DAUN BAWANG', 'SAYURAN_DAN_REMPAH', 'KG', 0, 7000, 0, '1'),
('biasa', '2018-12-14', 'SR002', 'TOMAT', 'SAYURAN_DAN_REMPAH', 'KG', 4, 11000, 44000, '1'),
('biasa', '2018-12-14', 'SR003', 'WORTEL LOKAL', 'SAYURAN_DAN_REMPAH', 'KG', 0, 13000, 0, '1'),
('biasa', '2018-12-15', 'AY001', 'AYAM POTONG', 'AYAM', 'KG', 5, 40000, 200000, '1'),
('biasa', '2018-12-15', 'BU001', 'APEL FUJI', 'BUAH', 'KG', 3, 30000, 90000, '1'),
('biasa', '2018-12-15', 'BU002', 'MELON', 'BUAH', 'KG', 3, 15000, 45000, '1'),
('biasa', '2018-12-15', 'BU003', 'SEMANGKA MERAH', 'BUAH', 'KG', 3, 4000, 12000, '1'),
('biasa', '2018-12-15', 'BU004', 'SEMANGKA KUNING', 'BUAH', 'KG', 3, 11000, 33000, '1'),
('biasa', '2018-12-15', 'DG001', 'DAGING SAPI', 'DAGING', 'KG', 8, 118000, 944000, '1'),
('biasa', '2018-12-15', 'GR001', 'BERAS', 'GROCERIES', 'KG', 5, 11000, 55000, '1'),
('biasa', '2018-12-15', 'GR002', 'BUMBU NASI GORENG', 'GROCERIES', 'PCS', 12, 5200, 62400, '1'),
('biasa', '2018-12-15', 'GR003', 'BUMBU SOTO AYAM', 'GROCERIES', 'PCS', 12, 5200, 62400, '1'),
('biasa', '2018-12-15', 'GR004', 'AGAR - AGAR COKLAT', 'GROCERIES', 'PCS', 12, 4400, 52800, '1'),
('biasa', '2018-12-15', 'GR005', 'KENTANG', 'GROCERIES', 'KG', 4, 14000, 56000, '1'),
('biasa', '2018-12-15', 'SR001', 'DAUN BAWANG', 'SAYURAN_DAN_REMPAH', 'KG', 1, 7000, 7000, '1'),
('biasa', '2018-12-15', 'SR002', 'TOMAT', 'SAYURAN_DAN_REMPAH', 'KG', 1, 11000, 11000, '1'),
('biasa', '2018-12-15', 'SR003', 'WORTEL LOKAL', 'SAYURAN_DAN_REMPAH', 'KG', 4, 13000, 52000, '1'),
('biasa', '2018-12-16', 'AY001', 'AYAM POTONG', 'AYAM', 'KG', 6, 40000, 240000, '1'),
('biasa', '2018-12-16', 'BU001', 'APEL FUJI', 'BUAH', 'KG', 6, 30000, 180000, '1'),
('biasa', '2018-12-16', 'BU002', 'MELON', 'BUAH', 'KG', 6, 15000, 90000, '1'),
('biasa', '2018-12-16', 'BU003', 'SEMANGKA MERAH', 'BUAH', 'KG', 6, 4000, 24000, '1'),
('biasa', '2018-12-16', 'BU004', 'SEMANGKA KUNING', 'BUAH', 'KG', 6, 11000, 66000, '1'),
('biasa', '2018-12-16', 'DG001', 'DAGING SAPI', 'DAGING', 'KG', 6, 118000, 708000, '1'),
('biasa', '2018-12-16', 'GR001', 'BERAS', 'GROCERIES', 'KG', 5, 11000, 55000, '1'),
('biasa', '2018-12-16', 'GR002', 'BUMBU NASI GORENG', 'GROCERIES', 'PCS', 24, 5200, 124800, '1'),
('biasa', '2018-12-16', 'GR003', 'BUMBU SOTO AYAM', 'GROCERIES', 'PCS', 24, 5200, 124800, '1'),
('biasa', '2018-12-16', 'GR004', 'AGAR - AGAR COKLAT', 'GROCERIES', 'PCS', 24, 4400, 105600, '1'),
('biasa', '2018-12-16', 'GR005', 'KENTANG', 'GROCERIES', 'KG', 4, 14000, 56000, '1'),
('biasa', '2018-12-16', 'SR001', 'DAUN BAWANG', 'SAYURAN_DAN_REMPAH', 'KG', 0, 7000, 0, '1'),
('biasa', '2018-12-16', 'SR002', 'TOMAT', 'SAYURAN_DAN_REMPAH', 'KG', 5, 11000, 55000, '1'),
('biasa', '2018-12-16', 'SR003', 'WORTEL LOKAL', 'SAYURAN_DAN_REMPAH', 'KG', 1, 13000, 13000, '1'),
('biasa', '2018-12-17', 'AY001', 'AYAM POTONG', 'AYAM', 'KG', 7, 40000, 280000, '1'),
('biasa', '2018-12-17', 'BU001', 'APEL FUJI', 'BUAH', 'KG', 7, 30000, 210000, '1'),
('biasa', '2018-12-17', 'BU002', 'MELON', 'BUAH', 'KG', 7, 15000, 105000, '1'),
('biasa', '2018-12-17', 'BU003', 'SEMANGKA MERAH', 'BUAH', 'KG', 7, 4000, 28000, '1'),
('biasa', '2018-12-17', 'BU004', 'SEMANGKA KUNING', 'BUAH', 'KG', 7, 11000, 77000, '1'),
('biasa', '2018-12-17', 'DG001', 'DAGING SAPI', 'DAGING', 'KG', 9, 118000, 1062000, '1'),
('biasa', '2018-12-17', 'GR001', 'BERAS', 'GROCERIES', 'KG', 6, 11000, 66000, '1'),
('biasa', '2018-12-17', 'GR002', 'BUMBU NASI GORENG', 'GROCERIES', 'PCS', 10, 5200, 52000, '1'),
('biasa', '2018-12-17', 'GR003', 'BUMBU SOTO AYAM', 'GROCERIES', 'PCS', 10, 5200, 52000, '1'),
('biasa', '2018-12-17', 'GR004', 'AGAR - AGAR COKLAT', 'GROCERIES', 'PCS', 10, 4400, 44000, '1'),
('biasa', '2018-12-17', 'GR005', 'KENTANG', 'GROCERIES', 'KG', 5, 14000, 70000, '1'),
('biasa', '2018-12-17', 'SR001', 'DAUN BAWANG', 'SAYURAN_DAN_REMPAH', 'KG', 1, 7000, 7000, '1'),
('biasa', '2018-12-17', 'SR002', 'TOMAT', 'SAYURAN_DAN_REMPAH', 'KG', 3, 11000, 33000, '1'),
('biasa', '2018-12-17', 'SR003', 'WORTEL LOKAL', 'SAYURAN_DAN_REMPAH', 'KG', 3, 13000, 39000, '1'),
('biasa', '2018-12-18', 'AY001', 'AYAM POTONG', 'AYAM', 'KG', 7, 40000, 280000, '1'),
('biasa', '2018-12-18', 'BU001', 'APEL FUJI', 'BUAH', 'KG', 5, 30000, 150000, '1'),
('biasa', '2018-12-18', 'BU002', 'MELON', 'BUAH', 'KG', 5, 15000, 75000, '1'),
('biasa', '2018-12-18', 'BU003', 'SEMANGKA MERAH', 'BUAH', 'KG', 5, 4000, 20000, '1'),
('biasa', '2018-12-18', 'BU004', 'SEMANGKA KUNING', 'BUAH', 'KG', 5, 11000, 55000, '1'),
('biasa', '2018-12-18', 'DG001', 'DAGING SAPI', 'DAGING', 'KG', 10, 118000, 1180000, '1'),
('biasa', '2018-12-18', 'GR001', 'BERAS', 'GROCERIES', 'KG', 6, 11000, 66000, '1'),
('biasa', '2018-12-18', 'GR002', 'BUMBU NASI GORENG', 'GROCERIES', 'PCS', 12, 5200, 62400, '1'),
('biasa', '2018-12-18', 'GR003', 'BUMBU SOTO AYAM', 'GROCERIES', 'PCS', 12, 5200, 62400, '1'),
('biasa', '2018-12-18', 'GR004', 'AGAR - AGAR COKLAT', 'GROCERIES', 'PCS', 12, 4400, 52800, '1'),
('biasa', '2018-12-18', 'GR005', 'KENTANG', 'GROCERIES', 'KG', 4, 14000, 56000, '1'),
('biasa', '2018-12-18', 'SR001', 'DAUN BAWANG', 'SAYURAN_DAN_REMPAH', 'KG', 0, 7000, 0, '1'),
('biasa', '2018-12-18', 'SR002', 'TOMAT', 'SAYURAN_DAN_REMPAH', 'KG', 5, 11000, 55000, '1'),
('biasa', '2018-12-18', 'SR003', 'WORTEL LOKAL', 'SAYURAN_DAN_REMPAH', 'KG', 5, 13000, 65000, '1'),
('biasa', '2018-12-19', 'AY001', 'AYAM POTONG', 'AYAM', 'KG', 10, 40000, 400000, '1'),
('biasa', '2018-12-19', 'BU001', 'APEL FUJI', 'BUAH', 'KG', 7, 30000, 210000, '1'),
('biasa', '2018-12-19', 'BU002', 'MELON', 'BUAH', 'KG', 7, 15000, 105000, '1'),
('biasa', '2018-12-19', 'BU003', 'SEMANGKA MERAH', 'BUAH', 'KG', 7, 4000, 28000, '1'),
('biasa', '2018-12-19', 'BU004', 'SEMANGKA KUNING', 'BUAH', 'KG', 7, 11000, 77000, '1'),
('biasa', '2018-12-19', 'DG001', 'DAGING SAPI', 'DAGING', 'KG', 11, 118000, 1298000, '1'),
('biasa', '2018-12-19', 'GR001', 'BERAS', 'GROCERIES', 'KG', 8, 11000, 88000, '1'),
('biasa', '2018-12-19', 'GR002', 'BUMBU NASI GORENG', 'GROCERIES', 'PCS', 24, 5200, 124800, '1'),
('biasa', '2018-12-19', 'GR003', 'BUMBU SOTO AYAM', 'GROCERIES', 'PCS', 24, 5200, 124800, '1'),
('biasa', '2018-12-19', 'GR004', 'AGAR - AGAR COKLAT', 'GROCERIES', 'PCS', 24, 4400, 105600, '1'),
('biasa', '2018-12-19', 'GR005', 'KENTANG', 'GROCERIES', 'KG', 6, 14000, 84000, '1'),
('biasa', '2018-12-19', 'SR001', 'DAUN BAWANG', 'SAYURAN_DAN_REMPAH', 'KG', 2, 7000, 14000, '1'),
('biasa', '2018-12-19', 'SR002', 'TOMAT', 'SAYURAN_DAN_REMPAH', 'KG', 4, 11000, 44000, '1'),
('biasa', '2018-12-19', 'SR003', 'WORTEL LOKAL', 'SAYURAN_DAN_REMPAH', 'KG', 4, 13000, 52000, '1'),
('biasa', '2018-12-20', 'AY001', 'AYAM POTONG', 'AYAM', 'KG', 6, 40000, 240000, '1'),
('biasa', '2018-12-20', 'BU001', 'APEL FUJI', 'BUAH', 'KG', 6, 30000, 180000, '1'),
('biasa', '2018-12-20', 'BU002', 'MELON', 'BUAH', 'KG', 6, 15000, 90000, '1'),
('biasa', '2018-12-20', 'BU003', 'SEMANGKA MERAH', 'BUAH', 'KG', 6, 4000, 24000, '1'),
('biasa', '2018-12-20', 'BU004', 'SEMANGKA KUNING', 'BUAH', 'KG', 6, 11000, 66000, '1'),
('biasa', '2018-12-20', 'DG001', 'DAGING SAPI', 'DAGING', 'KG', 6, 118000, 708000, '1'),
('biasa', '2018-12-20', 'GR001', 'BERAS', 'GROCERIES', 'KG', 5, 11000, 55000, '1'),
('biasa', '2018-12-20', 'GR002', 'BUMBU NASI GORENG', 'GROCERIES', 'PCS', 10, 5200, 52000, '1'),
('biasa', '2018-12-20', 'GR003', 'BUMBU SOTO AYAM', 'GROCERIES', 'PCS', 10, 5200, 52000, '1'),
('biasa', '2018-12-20', 'GR004', 'AGAR - AGAR COKLAT', 'GROCERIES', 'PCS', 10, 4400, 44000, '1'),
('biasa', '2018-12-20', 'GR005', 'KENTANG', 'GROCERIES', 'KG', 5, 14000, 70000, '1'),
('biasa', '2018-12-20', 'SR001', 'DAUN BAWANG', 'SAYURAN_DAN_REMPAH', 'KG', 0, 7000, 0, '1'),
('biasa', '2018-12-20', 'SR002', 'TOMAT', 'SAYURAN_DAN_REMPAH', 'KG', 4, 11000, 44000, '1'),
('biasa', '2018-12-20', 'SR003', 'WORTEL LOKAL', 'SAYURAN_DAN_REMPAH', 'KG', 2, 13000, 26000, '1'),
('biasa', '2018-12-21', 'AY001', 'AYAM POTONG', 'AYAM', 'KG', 4, 40000, 160000, '1'),
('biasa', '2018-12-21', 'BU001', 'APEL FUJI', 'BUAH', 'KG', 4, 30000, 120000, '1'),
('biasa', '2018-12-21', 'BU002', 'MELON', 'BUAH', 'KG', 4, 15000, 60000, '1'),
('biasa', '2018-12-21', 'BU003', 'SEMANGKA MERAH', 'BUAH', 'KG', 4, 4000, 16000, '1'),
('biasa', '2018-12-21', 'BU004', 'SEMANGKA KUNING', 'BUAH', 'KG', 4, 11000, 44000, '1'),
('biasa', '2018-12-21', 'DG001', 'DAGING SAPI', 'DAGING', 'KG', 8, 118000, 944000, '1'),
('biasa', '2018-12-21', 'GR001', 'BERAS', 'GROCERIES', 'KG', 5, 11000, 55000, '1'),
('biasa', '2018-12-21', 'GR002', 'BUMBU NASI GORENG', 'GROCERIES', 'PCS', 10, 5200, 52000, '1'),
('biasa', '2018-12-21', 'GR003', 'BUMBU SOTO AYAM', 'GROCERIES', 'PCS', 10, 5200, 52000, '1'),
('biasa', '2018-12-21', 'GR004', 'AGAR - AGAR COKLAT', 'GROCERIES', 'PCS', 10, 4400, 44000, '1'),
('biasa', '2018-12-21', 'GR005', 'KENTANG', 'GROCERIES', 'KG', 3, 14000, 42000, '1'),
('biasa', '2018-12-21', 'SR001', 'DAUN BAWANG', 'SAYURAN_DAN_REMPAH', 'KG', 0, 7000, 0, '1'),
('biasa', '2018-12-21', 'SR002', 'TOMAT', 'SAYURAN_DAN_REMPAH', 'KG', 2, 11000, 22000, '1'),
('biasa', '2018-12-21', 'SR003', 'WORTEL LOKAL', 'SAYURAN_DAN_REMPAH', 'KG', 2, 13000, 26000, '1'),
('biasa', '2018-12-22', 'AY001', 'AYAM POTONG', 'AYAM', 'KG', 7, 40000, 280000, '1'),
('biasa', '2018-12-22', 'BU001', 'APEL FUJI', 'BUAH', 'KG', 7, 30000, 210000, '1'),
('biasa', '2018-12-22', 'BU002', 'MELON', 'BUAH', 'KG', 7, 15000, 105000, '1'),
('biasa', '2018-12-22', 'BU003', 'SEMANGKA MERAH', 'BUAH', 'KG', 7, 4000, 28000, '1'),
('biasa', '2018-12-22', 'BU004', 'SEMANGKA KUNING', 'BUAH', 'KG', 7, 11000, 77000, '1'),
('biasa', '2018-12-22', 'DG001', 'DAGING SAPI', 'DAGING', 'KG', 10, 118000, 1180000, '1'),
('biasa', '2018-12-22', 'GR001', 'BERAS', 'GROCERIES', 'KG', 5, 11000, 55000, '1'),
('biasa', '2018-12-22', 'GR002', 'BUMBU NASI GORENG', 'GROCERIES', 'PCS', 12, 5200, 62400, '1'),
('biasa', '2018-12-22', 'GR003', 'BUMBU SOTO AYAM', 'GROCERIES', 'PCS', 12, 5200, 62400, '1'),
('biasa', '2018-12-22', 'GR004', 'AGAR - AGAR COKLAT', 'GROCERIES', 'PCS', 12, 4400, 52800, '1'),
('biasa', '2018-12-22', 'GR005', 'KENTANG', 'GROCERIES', 'KG', 5, 14000, 70000, '1'),
('biasa', '2018-12-22', 'SR001', 'DAUN BAWANG', 'SAYURAN_DAN_REMPAH', 'KG', 1, 7000, 7000, '1'),
('biasa', '2018-12-22', 'SR002', 'TOMAT', 'SAYURAN_DAN_REMPAH', 'KG', 5, 11000, 55000, '1'),
('biasa', '2018-12-22', 'SR003', 'WORTEL LOKAL', 'SAYURAN_DAN_REMPAH', 'KG', 5, 13000, 65000, '1'),
('biasa', '2018-12-23', 'AY001', 'AYAM POTONG', 'AYAM', 'KG', 10, 40000, 400000, '1'),
('biasa', '2018-12-23', 'BU001', 'APEL FUJI', 'BUAH', 'KG', 7, 30000, 210000, '1'),
('biasa', '2018-12-23', 'BU002', 'MELON', 'BUAH', 'KG', 7, 15000, 105000, '1'),
('biasa', '2018-12-23', 'BU003', 'SEMANGKA MERAH', 'BUAH', 'KG', 7, 4000, 28000, '1'),
('biasa', '2018-12-23', 'BU004', 'SEMANGKA KUNING', 'BUAH', 'KG', 7, 11000, 77000, '1'),
('biasa', '2018-12-23', 'DG001', 'DAGING SAPI', 'DAGING', 'KG', 10.5, 118000, 1239000, '1'),
('biasa', '2018-12-23', 'GR001', 'BERAS', 'GROCERIES', 'KG', 6, 11000, 66000, '1'),
('biasa', '2018-12-23', 'GR002', 'BUMBU NASI GORENG', 'GROCERIES', 'PCS', 24, 5200, 124800, '1'),
('biasa', '2018-12-23', 'GR003', 'BUMBU SOTO AYAM', 'GROCERIES', 'PCS', 24, 5200, 124800, '1'),
('biasa', '2018-12-23', 'GR004', 'AGAR - AGAR COKLAT', 'GROCERIES', 'PCS', 24, 4400, 105600, '1'),
('biasa', '2018-12-23', 'GR005', 'KENTANG', 'GROCERIES', 'KG', 5, 14000, 70000, '1'),
('biasa', '2018-12-23', 'SR001', 'DAUN BAWANG', 'SAYURAN_DAN_REMPAH', 'KG', 1, 7000, 7000, '1'),
('biasa', '2018-12-23', 'SR002', 'TOMAT', 'SAYURAN_DAN_REMPAH', 'KG', 3.5, 11000, 38500, '1'),
('biasa', '2018-12-23', 'SR003', 'WORTEL LOKAL', 'SAYURAN_DAN_REMPAH', 'KG', 2, 13000, 26000, '1'),
('biasa', '2018-12-24', 'AY001', 'AYAM POTONG', 'AYAM', 'KG', 4, 40000, 160000, '1'),
('biasa', '2018-12-24', 'BU001', 'APEL FUJI', 'BUAH', 'KG', 6, 30000, 180000, '1'),
('biasa', '2018-12-24', 'BU002', 'MELON', 'BUAH', 'KG', 6, 15000, 90000, '1'),
('biasa', '2018-12-24', 'BU003', 'SEMANGKA MERAH', 'BUAH', 'KG', 6, 4000, 24000, '1'),
('biasa', '2018-12-24', 'BU004', 'SEMANGKA KUNING', 'BUAH', 'KG', 6, 11000, 66000, '1'),
('biasa', '2018-12-24', 'DG001', 'DAGING SAPI', 'DAGING', 'KG', 8, 118000, 944000, '1'),
('biasa', '2018-12-24', 'GR001', 'BERAS', 'GROCERIES', 'KG', 8, 11000, 88000, '1'),
('biasa', '2018-12-24', 'GR002', 'BUMBU NASI GORENG', 'GROCERIES', 'PCS', 10, 5200, 52000, '1'),
('biasa', '2018-12-24', 'GR003', 'BUMBU SOTO AYAM', 'GROCERIES', 'PCS', 10, 5200, 52000, '1'),
('biasa', '2018-12-24', 'GR004', 'AGAR - AGAR COKLAT', 'GROCERIES', 'PCS', 10, 4400, 44000, '1'),
('biasa', '2018-12-24', 'GR005', 'KENTANG', 'GROCERIES', 'KG', 6, 14000, 84000, '1'),
('biasa', '2018-12-24', 'SR001', 'DAUN BAWANG', 'SAYURAN_DAN_REMPAH', 'KG', 2, 7000, 14000, '1'),
('biasa', '2018-12-24', 'SR002', 'TOMAT', 'SAYURAN_DAN_REMPAH', 'KG', 3, 11000, 33000, '1'),
('biasa', '2018-12-24', 'SR003', 'WORTEL LOKAL', 'SAYURAN_DAN_REMPAH', 'KG', 4, 13000, 52000, '1'),
('biasa', '2018-12-25', 'AY001', 'AYAM POTONG', 'AYAM', 'KG', 10, 40000, 400000, '1'),
('biasa', '2018-12-25', 'BU001', 'APEL FUJI', 'BUAH', 'KG', 8, 30000, 240000, '1'),
('biasa', '2018-12-25', 'BU002', 'MELON', 'BUAH', 'KG', 8, 15000, 120000, '1'),
('biasa', '2018-12-25', 'BU003', 'SEMANGKA MERAH', 'BUAH', 'KG', 8, 4000, 32000, '1'),
('biasa', '2018-12-25', 'BU004', 'SEMANGKA KUNING', 'BUAH', 'KG', 8, 11000, 88000, '1'),
('biasa', '2018-12-25', 'DG001', 'DAGING SAPI', 'DAGING', 'KG', 12, 118000, 1416000, '1'),
('biasa', '2018-12-25', 'GR001', 'BERAS', 'GROCERIES', 'KG', 8, 11000, 88000, '1'),
('biasa', '2018-12-25', 'GR002', 'BUMBU NASI GORENG', 'GROCERIES', 'PCS', 24, 5200, 124800, '1'),
('biasa', '2018-12-25', 'GR003', 'BUMBU SOTO AYAM', 'GROCERIES', 'PCS', 24, 5200, 124800, '1'),
('biasa', '2018-12-25', 'GR004', 'AGAR - AGAR COKLAT', 'GROCERIES', 'PCS', 24, 4400, 105600, '1'),
('biasa', '2018-12-25', 'GR005', 'KENTANG', 'GROCERIES', 'KG', 7, 14000, 98000, '1'),
('biasa', '2018-12-25', 'SR001', 'DAUN BAWANG', 'SAYURAN_DAN_REMPAH', 'KG', 0, 7000, 0, '1'),
('biasa', '2018-12-25', 'SR002', 'TOMAT', 'SAYURAN_DAN_REMPAH', 'KG', 5, 11000, 55000, '1'),
('biasa', '2018-12-25', 'SR003', 'WORTEL LOKAL', 'SAYURAN_DAN_REMPAH', 'KG', 3, 13000, 39000, '1'),
('biasa', '2018-12-26', 'AY001', 'AYAM POTONG', 'AYAM', 'KG', 10, 40000, 400000, '1'),
('biasa', '2018-12-26', 'BU001', 'APEL FUJI', 'BUAH', 'KG', 8, 30000, 240000, '1'),
('biasa', '2018-12-26', 'BU002', 'MELON', 'BUAH', 'KG', 8, 15000, 120000, '1'),
('biasa', '2018-12-26', 'BU003', 'SEMANGKA MERAH', 'BUAH', 'KG', 8, 4000, 32000, '1'),
('biasa', '2018-12-26', 'BU004', 'SEMANGKA KUNING', 'BUAH', 'KG', 8, 11000, 88000, '1'),
('biasa', '2018-12-26', 'DG001', 'DAGING SAPI', 'DAGING', 'KG', 12, 118000, 1416000, '1'),
('biasa', '2018-12-26', 'GR001', 'BERAS', 'GROCERIES', 'KG', 8, 11000, 88000, '1'),
('biasa', '2018-12-26', 'GR002', 'BUMBU NASI GORENG', 'GROCERIES', 'PCS', 12, 5200, 62400, '1'),
('biasa', '2018-12-26', 'GR003', 'BUMBU SOTO AYAM', 'GROCERIES', 'PCS', 12, 5200, 62400, '1'),
('biasa', '2018-12-26', 'GR004', 'AGAR - AGAR COKLAT', 'GROCERIES', 'PCS', 12, 4400, 52800, '1'),
('biasa', '2018-12-26', 'GR005', 'KENTANG', 'GROCERIES', 'KG', 8, 14000, 112000, '1'),
('biasa', '2018-12-26', 'SR001', 'DAUN BAWANG', 'SAYURAN_DAN_REMPAH', 'KG', 0, 7000, 0, '1'),
('biasa', '2018-12-26', 'SR002', 'TOMAT', 'SAYURAN_DAN_REMPAH', 'KG', 6, 11000, 66000, '1'),
('biasa', '2018-12-26', 'SR003', 'WORTEL LOKAL', 'SAYURAN_DAN_REMPAH', 'KG', 4, 13000, 52000, '1'),
('biasa', '2018-12-27', 'AY001', 'AYAM POTONG', 'AYAM', 'KG', 10, 40000, 400000, '1'),
('biasa', '2018-12-27', 'BU001', 'APEL FUJI', 'BUAH', 'KG', 6, 30000, 180000, '1'),
('biasa', '2018-12-27', 'BU002', 'MELON', 'BUAH', 'KG', 6, 15000, 90000, '1'),
('biasa', '2018-12-27', 'BU003', 'SEMANGKA MERAH', 'BUAH', 'KG', 6, 4000, 24000, '1'),
('biasa', '2018-12-27', 'BU004', 'SEMANGKA KUNING', 'BUAH', 'KG', 6, 11000, 66000, '1'),
('biasa', '2018-12-27', 'DG001', 'DAGING SAPI', 'DAGING', 'KG', 9, 118000, 1062000, '1'),
('biasa', '2018-12-27', 'GR001', 'BERAS', 'GROCERIES', 'KG', 5.5, 11000, 60500, '1'),
('biasa', '2018-12-27', 'GR002', 'BUMBU NASI GORENG', 'GROCERIES', 'PCS', 12, 5200, 62400, '1'),
('biasa', '2018-12-27', 'GR003', 'BUMBU SOTO AYAM', 'GROCERIES', 'PCS', 12, 5200, 62400, '1'),
('biasa', '2018-12-27', 'GR004', 'AGAR - AGAR COKLAT', 'GROCERIES', 'PCS', 12, 4400, 52800, '1'),
('biasa', '2018-12-27', 'GR005', 'KENTANG', 'GROCERIES', 'KG', 2, 14000, 28000, '1'),
('biasa', '2018-12-27', 'SR001', 'DAUN BAWANG', 'SAYURAN_DAN_REMPAH', 'KG', 1.5, 7000, 10500, '1'),
('biasa', '2018-12-27', 'SR002', 'TOMAT', 'SAYURAN_DAN_REMPAH', 'KG', 4, 11000, 44000, '1'),
('biasa', '2018-12-27', 'SR003', 'WORTEL LOKAL', 'SAYURAN_DAN_REMPAH', 'KG', 2, 13000, 26000, '1'),
('biasa', '2018-12-28', 'AY001', 'AYAM POTONG', 'AYAM', 'KG', 3, 40000, 120000, '1'),
('biasa', '2018-12-28', 'BU001', 'APEL FUJI', 'BUAH', 'KG', 4, 30000, 120000, '1'),
('biasa', '2018-12-28', 'BU002', 'MELON', 'BUAH', 'KG', 4, 15000, 60000, '1'),
('biasa', '2018-12-28', 'BU003', 'SEMANGKA MERAH', 'BUAH', 'KG', 4, 4000, 16000, '1'),
('biasa', '2018-12-28', 'BU004', 'SEMANGKA KUNING', 'BUAH', 'KG', 4, 11000, 44000, '1'),
('biasa', '2018-12-28', 'DG001', 'DAGING SAPI', 'DAGING', 'KG', 9, 118000, 1062000, '1'),
('biasa', '2018-12-28', 'GR001', 'BERAS', 'GROCERIES', 'KG', 6, 11000, 66000, '1'),
('biasa', '2018-12-28', 'GR002', 'BUMBU NASI GORENG', 'GROCERIES', 'PCS', 24, 5200, 124800, '1'),
('biasa', '2018-12-28', 'GR003', 'BUMBU SOTO AYAM', 'GROCERIES', 'PCS', 24, 5200, 124800, '1'),
('biasa', '2018-12-28', 'GR004', 'AGAR - AGAR COKLAT', 'GROCERIES', 'PCS', 24, 4400, 105600, '1'),
('biasa', '2018-12-28', 'GR005', 'KENTANG', 'GROCERIES', 'KG', 4, 14000, 56000, '1'),
('biasa', '2018-12-28', 'SR001', 'DAUN BAWANG', 'SAYURAN_DAN_REMPAH', 'KG', 0, 7000, 0, '1'),
('biasa', '2018-12-28', 'SR002', 'TOMAT', 'SAYURAN_DAN_REMPAH', 'KG', 3, 11000, 33000, '1'),
('biasa', '2018-12-28', 'SR003', 'WORTEL LOKAL', 'SAYURAN_DAN_REMPAH', 'KG', 2, 13000, 26000, '1'),
('biasa', '2018-12-29', 'AY001', 'AYAM POTONG', 'AYAM', 'KG', 8, 40000, 320000, '1'),
('biasa', '2018-12-29', 'BU001', 'APEL FUJI', 'BUAH', 'KG', 8, 30000, 240000, '1'),
('biasa', '2018-12-29', 'BU002', 'MELON', 'BUAH', 'KG', 8, 15000, 120000, '1'),
('biasa', '2018-12-29', 'BU003', 'SEMANGKA MERAH', 'BUAH', 'KG', 8, 4000, 32000, '1'),
('biasa', '2018-12-29', 'BU004', 'SEMANGKA KUNING', 'BUAH', 'KG', 8, 11000, 88000, '1'),
('biasa', '2018-12-29', 'DG001', 'DAGING SAPI', 'DAGING', 'KG', 12, 118000, 1416000, '1'),
('biasa', '2018-12-29', 'GR001', 'BERAS', 'GROCERIES', 'KG', 6, 11000, 66000, '1'),
('biasa', '2018-12-29', 'GR002', 'BUMBU NASI GORENG', 'GROCERIES', 'PCS', 12, 5200, 62400, '1'),
('biasa', '2018-12-29', 'GR003', 'BUMBU SOTO AYAM', 'GROCERIES', 'PCS', 12, 5200, 62400, '1'),
('biasa', '2018-12-29', 'GR004', 'AGAR - AGAR COKLAT', 'GROCERIES', 'PCS', 12, 4400, 52800, '1'),
('biasa', '2018-12-29', 'GR005', 'KENTANG', 'GROCERIES', 'KG', 7, 14000, 98000, '1'),
('biasa', '2018-12-29', 'SR001', 'DAUN BAWANG', 'SAYURAN_DAN_REMPAH', 'KG', 1, 7000, 7000, '1'),
('biasa', '2018-12-29', 'SR002', 'TOMAT', 'SAYURAN_DAN_REMPAH', 'KG', 5, 11000, 55000, '1'),
('biasa', '2018-12-29', 'SR003', 'WORTEL LOKAL', 'SAYURAN_DAN_REMPAH', 'KG', 4, 13000, 52000, '1'),
('biasa', '2018-12-30', 'AY001', 'AYAM POTONG', 'AYAM', 'KG', 18, 40000, 720000, '1'),
('biasa', '2018-12-30', 'BU001', 'APEL FUJI', 'BUAH', 'KG', 10, 30000, 300000, '1'),
('biasa', '2018-12-30', 'BU002', 'MELON', 'BUAH', 'KG', 10, 15000, 150000, '1'),
('biasa', '2018-12-30', 'BU003', 'SEMANGKA MERAH', 'BUAH', 'KG', 10, 4000, 40000, '1'),
('biasa', '2018-12-30', 'BU004', 'SEMANGKA KUNING', 'BUAH', 'KG', 10, 11000, 110000, '1'),
('biasa', '2018-12-30', 'DG001', 'DAGING SAPI', 'DAGING', 'KG', 17, 118000, 2006000, '1'),
('biasa', '2018-12-30', 'GR001', 'BERAS', 'GROCERIES', 'KG', 10, 11000, 110000, '1'),
('biasa', '2018-12-30', 'GR002', 'BUMBU NASI GORENG', 'GROCERIES', 'PCS', 24, 5200, 124800, '1'),
('biasa', '2018-12-30', 'GR003', 'BUMBU SOTO AYAM', 'GROCERIES', 'PCS', 24, 5200, 124800, '1'),
('biasa', '2018-12-30', 'GR004', 'AGAR - AGAR COKLAT', 'GROCERIES', 'PCS', 24, 4400, 105600, '1'),
('biasa', '2018-12-30', 'GR005', 'KENTANG', 'GROCERIES', 'KG', 7, 14000, 98000, '1'),
('biasa', '2018-12-30', 'SR001', 'DAUN BAWANG', 'SAYURAN_DAN_REMPAH', 'KG', 2, 7000, 14000, '1'),
('biasa', '2018-12-30', 'SR002', 'TOMAT', 'SAYURAN_DAN_REMPAH', 'KG', 4, 11000, 44000, '1'),
('biasa', '2018-12-30', 'SR003', 'WORTEL LOKAL', 'SAYURAN_DAN_REMPAH', 'KG', 6, 13000, 78000, '1'),
('biasa', '2018-12-31', 'AY001', 'AYAM POTONG', 'AYAM', 'KG', 5, 40000, 200000, '1'),
('biasa', '2018-12-31', 'BU001', 'APEL FUJI', 'BUAH', 'KG', 6, 30000, 180000, '1'),
('biasa', '2018-12-31', 'BU002', 'MELON', 'BUAH', 'KG', 6, 15000, 90000, '1'),
('biasa', '2018-12-31', 'BU003', 'SEMANGKA MERAH', 'BUAH', 'KG', 6, 4000, 24000, '1'),
('biasa', '2018-12-31', 'BU004', 'SEMANGKA KUNING', 'BUAH', 'KG', 6, 11000, 66000, '1'),
('biasa', '2018-12-31', 'DG001', 'DAGING SAPI', 'DAGING', 'KG', 4, 118000, 472000, '1'),
('biasa', '2018-12-31', 'GR001', 'BERAS', 'GROCERIES', 'KG', 8, 11000, 88000, '1'),
('biasa', '2018-12-31', 'GR002', 'BUMBU NASI GORENG', 'GROCERIES', 'PCS', 12, 5200, 62400, '1'),
('biasa', '2018-12-31', 'GR003', 'BUMBU SOTO AYAM', 'GROCERIES', 'PCS', 12, 5200, 62400, '1'),
('biasa', '2018-12-31', 'GR004', 'AGAR - AGAR COKLAT', 'GROCERIES', 'PCS', 12, 4400, 52800, '1'),
('biasa', '2018-12-31', 'GR005', 'KENTANG', 'GROCERIES', 'KG', 6, 14000, 84000, '1'),
('biasa', '2018-12-31', 'SR001', 'DAUN BAWANG', 'SAYURAN_DAN_REMPAH', 'KG', 2, 7000, 14000, '1'),
('biasa', '2018-12-31', 'SR002', 'TOMAT', 'SAYURAN_DAN_REMPAH', 'KG', 8, 11000, 88000, '1'),
('biasa', '2018-12-31', 'SR003', 'WORTEL LOKAL', 'SAYURAN_DAN_REMPAH', 'KG', 4, 13000, 52000, '1'),
('biasa', '2019-01-13', 'AY001', 'AYAM POTONG', 'AYAM', 'KG', 4, 40000, 160000, '1'),
('biasa', '2019-01-13', 'BU001', 'APEL FUJI', 'BUAH', 'KG', 3, 30000, 90000, '1'),
('biasa', '2019-01-13', 'BU002', 'MELON', 'BUAH', 'KG', 3, 15000, 45000, '1'),
('biasa', '2019-01-13', 'BU003', 'SEMANGKA MERAH', 'BUAH', 'KG', 3, 4000, 12000, '1'),
('biasa', '2019-01-13', 'BU004', 'SEMANGKA KUNING', 'BUAH', 'KG', 3, 11000, 33000, '1'),
('biasa', '2019-01-13', 'DG001', 'DAGING SAPI', 'DAGING', 'KG', 4, 118000, 472000, '1'),
('biasa', '2019-01-13', 'GR001', 'BERAS', 'GROCERIES', 'KG', 5, 11000, 55000, '1'),
('biasa', '2019-01-13', 'GR002', 'BUMBU NASI GORENG', 'GROCERIES', 'PCS', 12, 5200, 62400, '1'),
('biasa', '2019-01-13', 'GR003', 'BUMBU SOTO AYAM', 'GROCERIES', 'PCS', 12, 5200, 62400, '1'),
('biasa', '2019-01-13', 'GR004', 'AGAR - AGAR COKLAT', 'GROCERIES', 'PCS', 12, 4400, 52800, '1'),
('biasa', '2019-01-13', 'GR005', 'KENTANG', 'GROCERIES', 'KG', 5, 14000, 70000, '1'),
('biasa', '2019-01-13', 'SR001', 'DAUN BAWANG', 'SAYURAN_DAN_REMPAH', 'KG', 0, 7000, 0, '1'),
('biasa', '2019-01-13', 'SR002', 'TOMAT', 'SAYURAN_DAN_REMPAH', 'KG', 0, 11000, 0, '1'),
('biasa', '2019-01-13', 'SR003', 'WORTEL LOKAL', 'SAYURAN_DAN_REMPAH', 'KG', 0, 13000, 0, '1');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_bahan`
--

CREATE TABLE `transaksi_bahan` (
  `tgl` date NOT NULL,
  `id_bahan` varchar(10) NOT NULL,
  `jumlah` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi_bahan`
--

INSERT INTO `transaksi_bahan` (`tgl`, `id_bahan`, `jumlah`) VALUES
('2018-12-01', 'AY001', 6.9),
('2018-12-01', 'BU001', 6),
('2018-12-01', 'BU002', 6),
('2018-12-01', 'BU003', 6),
('2018-12-01', 'BU004', 6),
('2018-12-01', 'DG001', 9),
('2018-12-01', 'GR001', 4.5),
('2018-12-01', 'GR002', 15),
('2018-12-01', 'GR003', 15),
('2018-12-01', 'GR004', 15),
('2018-12-01', 'GR005', 4.5),
('2018-12-01', 'pilih', 0),
('2018-12-01', 'SR001', 0.6),
('2018-12-01', 'SR002', 0.6),
('2018-12-01', 'SR003', 3),
('2018-12-02', 'AY001', 5.75),
('2018-12-02', 'BU001', 5),
('2018-12-02', 'BU002', 5),
('2018-12-02', 'BU003', 5),
('2018-12-02', 'BU004', 5),
('2018-12-02', 'DG001', 7.5),
('2018-12-02', 'GR001', 3.75),
('2018-12-02', 'GR002', 12.5),
('2018-12-02', 'GR003', 12.5),
('2018-12-02', 'GR004', 12.5),
('2018-12-02', 'GR005', 3.75),
('2018-12-02', 'pilih', 0),
('2018-12-02', 'SR001', 0.5),
('2018-12-02', 'SR002', 0.5),
('2018-12-02', 'SR003', 2.5),
('2018-12-03', 'AY001', 4.6),
('2018-12-03', 'BU001', 4),
('2018-12-03', 'BU002', 4),
('2018-12-03', 'BU003', 4),
('2018-12-03', 'BU004', 4),
('2018-12-03', 'DG001', 6),
('2018-12-03', 'GR001', 3),
('2018-12-03', 'GR002', 10),
('2018-12-03', 'GR003', 10),
('2018-12-03', 'GR004', 10),
('2018-12-03', 'GR005', 3),
('2018-12-03', 'pilih', 0),
('2018-12-03', 'SR001', 0.4),
('2018-12-03', 'SR002', 0.4),
('2018-12-03', 'SR003', 2),
('2018-12-04', 'AY001', 5.75),
('2018-12-04', 'BU001', 5),
('2018-12-04', 'BU002', 5),
('2018-12-04', 'BU003', 5),
('2018-12-04', 'BU004', 5),
('2018-12-04', 'DG001', 7.5),
('2018-12-04', 'GR001', 3.75),
('2018-12-04', 'GR002', 12.5),
('2018-12-04', 'GR003', 12.5),
('2018-12-04', 'GR004', 12.5),
('2018-12-04', 'GR005', 3.75),
('2018-12-04', 'pilih', 0),
('2018-12-04', 'SR001', 0.5),
('2018-12-04', 'SR002', 0.5),
('2018-12-04', 'SR003', 2.5),
('2018-12-05', 'AY001', 5.75),
('2018-12-05', 'BU001', 5),
('2018-12-05', 'BU002', 5),
('2018-12-05', 'BU003', 5),
('2018-12-05', 'BU004', 5),
('2018-12-05', 'DG001', 7.5),
('2018-12-05', 'GR001', 3.75),
('2018-12-05', 'GR002', 12.5),
('2018-12-05', 'GR003', 12.5),
('2018-12-05', 'GR004', 12.5),
('2018-12-05', 'GR005', 4),
('2018-12-05', 'pilih', 0),
('2018-12-05', 'SR001', 0.625),
('2018-12-05', 'SR002', 0.75),
('2018-12-05', 'SR003', 2.5),
('2018-12-06', 'AY001', 6.44),
('2018-12-06', 'BU001', 5.6),
('2018-12-06', 'BU002', 5.6),
('2018-12-06', 'BU003', 5.6),
('2018-12-06', 'BU004', 5.6),
('2018-12-06', 'DG001', 8.4),
('2018-12-06', 'GR001', 4.2),
('2018-12-06', 'GR002', 14),
('2018-12-06', 'GR003', 14),
('2018-12-06', 'GR004', 14),
('2018-12-06', 'GR005', 4.48),
('2018-12-06', 'pilih', 0),
('2018-12-06', 'SR001', 0.7),
('2018-12-06', 'SR002', 0.84),
('2018-12-06', 'SR003', 2.8),
('2018-12-07', 'AY001', 5.75),
('2018-12-07', 'BU001', 5),
('2018-12-07', 'BU002', 5),
('2018-12-07', 'BU003', 5),
('2018-12-07', 'BU004', 5),
('2018-12-07', 'DG001', 7.5),
('2018-12-07', 'GR001', 5),
('2018-12-07', 'GR002', 12.5),
('2018-12-07', 'GR003', 12.5),
('2018-12-07', 'GR004', 12.5),
('2018-12-07', 'GR005', 4),
('2018-12-07', 'SR001', 0.625),
('2018-12-07', 'SR002', 3.25),
('2018-12-07', 'SR003', 2.5),
('2018-12-08', 'AY001', 5.75),
('2018-12-08', 'BU001', 5),
('2018-12-08', 'BU002', 5),
('2018-12-08', 'BU003', 5),
('2018-12-08', 'BU004', 5),
('2018-12-08', 'DG001', 7.5),
('2018-12-08', 'GR001', 3.75),
('2018-12-08', 'GR002', 12.5),
('2018-12-08', 'GR003', 12.5),
('2018-12-08', 'GR004', 12.5),
('2018-12-08', 'GR005', 4),
('2018-12-08', 'SR001', 0.625),
('2018-12-08', 'SR002', 3.25),
('2018-12-08', 'SR003', 2.5),
('2018-12-09', 'AY001', 6.9),
('2018-12-09', 'BU001', 6),
('2018-12-09', 'BU002', 6),
('2018-12-09', 'BU003', 6),
('2018-12-09', 'BU004', 6),
('2018-12-09', 'DG001', 9),
('2018-12-09', 'GR001', 6),
('2018-12-09', 'GR002', 15),
('2018-12-09', 'GR003', 15),
('2018-12-09', 'GR004', 15),
('2018-12-09', 'GR005', 4.8),
('2018-12-09', 'SR001', 0.75),
('2018-12-09', 'SR002', 3.9),
('2018-12-09', 'SR003', 3),
('2018-12-10', 'AY001', 6.9),
('2018-12-10', 'BU001', 6),
('2018-12-10', 'BU002', 6),
('2018-12-10', 'BU003', 6),
('2018-12-10', 'BU004', 6),
('2018-12-10', 'DG001', 9),
('2018-12-10', 'GR001', 6),
('2018-12-10', 'GR002', 15),
('2018-12-10', 'GR003', 15),
('2018-12-10', 'GR004', 15),
('2018-12-10', 'GR005', 4.8),
('2018-12-10', 'SR001', 0.75),
('2018-12-10', 'SR002', 3.9),
('2018-12-10', 'SR003', 3),
('2018-12-11', 'AY001', 4.6),
('2018-12-11', 'BU001', 4),
('2018-12-11', 'BU002', 4),
('2018-12-11', 'BU003', 4),
('2018-12-11', 'BU004', 4),
('2018-12-11', 'DG001', 6),
('2018-12-11', 'GR001', 4),
('2018-12-11', 'GR002', 10),
('2018-12-11', 'GR003', 10),
('2018-12-11', 'GR004', 10),
('2018-12-11', 'GR005', 3.2),
('2018-12-11', 'SR001', 0.5),
('2018-12-11', 'SR002', 2.6),
('2018-12-11', 'SR003', 2),
('2018-12-12', 'AY001', 4.6),
('2018-12-12', 'BU001', 4),
('2018-12-12', 'BU002', 4),
('2018-12-12', 'BU003', 4),
('2018-12-12', 'BU004', 4),
('2018-12-12', 'DG001', 6),
('2018-12-12', 'GR001', 4),
('2018-12-12', 'GR002', 10),
('2018-12-12', 'GR003', 10),
('2018-12-12', 'GR004', 10),
('2018-12-12', 'GR005', 3.2),
('2018-12-12', 'SR001', 0.5),
('2018-12-12', 'SR002', 2.6),
('2018-12-12', 'SR003', 2),
('2018-12-13', 'AY001', 5.75),
('2018-12-13', 'BU001', 5),
('2018-12-13', 'BU002', 5),
('2018-12-13', 'BU003', 5),
('2018-12-13', 'BU004', 5),
('2018-12-13', 'DG001', 7.5),
('2018-12-13', 'GR001', 5),
('2018-12-13', 'GR002', 12.5),
('2018-12-13', 'GR003', 12.5),
('2018-12-13', 'GR004', 12.5),
('2018-12-13', 'GR005', 4),
('2018-12-13', 'SR001', 0.625),
('2018-12-13', 'SR002', 3.25),
('2018-12-13', 'SR003', 2.5),
('2018-12-14', 'AY001', 5.75),
('2018-12-14', 'BU001', 5),
('2018-12-14', 'BU002', 5),
('2018-12-14', 'BU003', 5),
('2018-12-14', 'BU004', 5),
('2018-12-14', 'DG001', 7.5),
('2018-12-14', 'GR001', 5),
('2018-12-14', 'GR002', 12.5),
('2018-12-14', 'GR003', 12.5),
('2018-12-14', 'GR004', 12.5),
('2018-12-14', 'GR005', 4),
('2018-12-14', 'SR001', 0.625),
('2018-12-14', 'SR002', 3.25),
('2018-12-14', 'SR003', 2.5),
('2018-12-15', 'AY001', 5.75),
('2018-12-15', 'BU001', 5),
('2018-12-15', 'BU002', 5),
('2018-12-15', 'BU003', 5),
('2018-12-15', 'BU004', 5),
('2018-12-15', 'DG001', 7.5),
('2018-12-15', 'GR001', 5),
('2018-12-15', 'GR002', 12.5),
('2018-12-15', 'GR003', 12.5),
('2018-12-15', 'GR004', 12.5),
('2018-12-15', 'GR005', 4),
('2018-12-15', 'SR001', 0.625),
('2018-12-15', 'SR002', 3.25),
('2018-12-15', 'SR003', 2.5),
('2018-12-16', 'AY001', 6.9),
('2018-12-16', 'BU001', 6),
('2018-12-16', 'BU002', 6),
('2018-12-16', 'BU003', 6),
('2018-12-16', 'BU004', 6),
('2018-12-16', 'DG001', 9),
('2018-12-16', 'GR001', 6),
('2018-12-16', 'GR002', 15),
('2018-12-16', 'GR003', 15),
('2018-12-16', 'GR004', 15),
('2018-12-16', 'GR005', 4.8),
('2018-12-16', 'SR001', 0.75),
('2018-12-16', 'SR002', 3.9),
('2018-12-16', 'SR003', 3),
('2018-12-17', 'AY001', 6.9),
('2018-12-17', 'BU001', 6),
('2018-12-17', 'BU002', 6),
('2018-12-17', 'BU003', 6),
('2018-12-17', 'BU004', 6),
('2018-12-17', 'DG001', 9),
('2018-12-17', 'GR001', 6),
('2018-12-17', 'GR002', 15),
('2018-12-17', 'GR003', 15),
('2018-12-17', 'GR004', 15),
('2018-12-17', 'GR005', 4.8),
('2018-12-17', 'SR001', 0.75),
('2018-12-17', 'SR002', 3.9),
('2018-12-17', 'SR003', 3),
('2018-12-18', 'AY001', 6.9),
('2018-12-18', 'BU001', 6),
('2018-12-18', 'BU002', 6),
('2018-12-18', 'BU003', 6),
('2018-12-18', 'BU004', 6),
('2018-12-18', 'DG001', 9),
('2018-12-18', 'GR001', 6),
('2018-12-18', 'GR002', 15),
('2018-12-18', 'GR003', 15),
('2018-12-18', 'GR004', 15),
('2018-12-18', 'GR005', 4.8),
('2018-12-18', 'SR001', 0.75),
('2018-12-18', 'SR002', 3.9),
('2018-12-18', 'SR003', 3),
('2018-12-19', 'AY001', 8.05),
('2018-12-19', 'BU001', 7),
('2018-12-19', 'BU002', 7),
('2018-12-19', 'BU003', 7),
('2018-12-19', 'BU004', 7),
('2018-12-19', 'DG001', 10.5),
('2018-12-19', 'GR001', 7),
('2018-12-19', 'GR002', 17.5),
('2018-12-19', 'GR003', 17.5),
('2018-12-19', 'GR004', 17.5),
('2018-12-19', 'GR005', 5.6),
('2018-12-19', 'SR001', 0.875),
('2018-12-19', 'SR002', 4.55),
('2018-12-19', 'SR003', 3.5),
('2018-12-20', 'AY001', 4.6),
('2018-12-20', 'BU001', 4),
('2018-12-20', 'BU002', 4),
('2018-12-20', 'BU003', 4),
('2018-12-20', 'BU004', 4),
('2018-12-20', 'DG001', 6),
('2018-12-20', 'GR001', 4),
('2018-12-20', 'GR002', 10),
('2018-12-20', 'GR003', 10),
('2018-12-20', 'GR004', 10),
('2018-12-20', 'GR005', 3.2),
('2018-12-20', 'SR001', 0.5),
('2018-12-20', 'SR002', 2.6),
('2018-12-20', 'SR003', 2),
('2018-12-21', 'AY001', 6.9),
('2018-12-21', 'BU001', 6),
('2018-12-21', 'BU002', 6),
('2018-12-21', 'BU003', 6),
('2018-12-21', 'BU004', 6),
('2018-12-21', 'DG001', 9),
('2018-12-21', 'GR001', 6),
('2018-12-21', 'GR002', 15),
('2018-12-21', 'GR003', 15),
('2018-12-21', 'GR004', 15),
('2018-12-21', 'GR005', 4.8),
('2018-12-21', 'SR001', 0.75),
('2018-12-21', 'SR002', 3.9),
('2018-12-21', 'SR003', 3),
('2018-12-22', 'AY001', 6.9),
('2018-12-22', 'BU001', 6),
('2018-12-22', 'BU002', 6),
('2018-12-22', 'BU003', 6),
('2018-12-22', 'BU004', 6),
('2018-12-22', 'DG001', 9),
('2018-12-22', 'GR001', 6),
('2018-12-22', 'GR002', 15),
('2018-12-22', 'GR003', 15),
('2018-12-22', 'GR004', 15),
('2018-12-22', 'GR005', 4.8),
('2018-12-22', 'SR001', 0.75),
('2018-12-22', 'SR002', 3.9),
('2018-12-22', 'SR003', 3),
('2018-12-23', 'AY001', 6.9),
('2018-12-23', 'BU001', 6),
('2018-12-23', 'BU002', 6),
('2018-12-23', 'BU003', 6),
('2018-12-23', 'BU004', 6),
('2018-12-23', 'DG001', 9),
('2018-12-23', 'GR001', 6),
('2018-12-23', 'GR002', 15),
('2018-12-23', 'GR003', 15),
('2018-12-23', 'GR004', 15),
('2018-12-23', 'GR005', 4.8),
('2018-12-23', 'SR001', 0.75),
('2018-12-23', 'SR002', 3.9),
('2018-12-23', 'SR003', 3),
('2018-12-24', 'AY001', 10.35),
('2018-12-24', 'BU001', 9),
('2018-12-24', 'BU002', 9),
('2018-12-24', 'BU003', 9),
('2018-12-24', 'BU004', 9),
('2018-12-24', 'DG001', 13.5),
('2018-12-24', 'GR001', 9),
('2018-12-24', 'GR002', 22.5),
('2018-12-24', 'GR003', 22.5),
('2018-12-24', 'GR004', 22.5),
('2018-12-24', 'GR005', 7.2),
('2018-12-24', 'SR001', 1.125),
('2018-12-24', 'SR002', 5.85),
('2018-12-24', 'SR003', 4.5),
('2018-12-25', 'AY001', 10.35),
('2018-12-25', 'BU001', 9),
('2018-12-25', 'BU002', 9),
('2018-12-25', 'BU003', 9),
('2018-12-25', 'BU004', 9),
('2018-12-25', 'DG001', 13.5),
('2018-12-25', 'GR001', 9),
('2018-12-25', 'GR002', 22.5),
('2018-12-25', 'GR003', 22.5),
('2018-12-25', 'GR004', 22.5),
('2018-12-25', 'GR005', 7.2),
('2018-12-25', 'SR001', 1.125),
('2018-12-25', 'SR002', 5.85),
('2018-12-25', 'SR003', 4.5),
('2018-12-26', 'AY001', 6.9),
('2018-12-26', 'BU001', 6),
('2018-12-26', 'BU002', 6),
('2018-12-26', 'BU003', 6),
('2018-12-26', 'BU004', 6),
('2018-12-26', 'DG001', 9),
('2018-12-26', 'GR001', 6),
('2018-12-26', 'GR002', 15),
('2018-12-26', 'GR003', 15),
('2018-12-26', 'GR004', 15),
('2018-12-26', 'GR005', 4.8),
('2018-12-26', 'SR001', 0.75),
('2018-12-26', 'SR002', 3.9),
('2018-12-26', 'SR003', 3),
('2018-12-27', 'AY001', 5.75),
('2018-12-27', 'BU001', 5),
('2018-12-27', 'BU002', 5),
('2018-12-27', 'BU003', 5),
('2018-12-27', 'BU004', 5),
('2018-12-27', 'DG001', 7.5),
('2018-12-27', 'GR001', 5),
('2018-12-27', 'GR002', 12.5),
('2018-12-27', 'GR003', 12.5),
('2018-12-27', 'GR004', 12.5),
('2018-12-27', 'GR005', 4),
('2018-12-27', 'SR001', 0.625),
('2018-12-27', 'SR002', 3.25),
('2018-12-27', 'SR003', 2.5),
('2018-12-28', 'AY001', 6.9),
('2018-12-28', 'BU001', 6),
('2018-12-28', 'BU002', 6),
('2018-12-28', 'BU003', 6),
('2018-12-28', 'BU004', 6),
('2018-12-28', 'DG001', 9),
('2018-12-28', 'GR001', 6),
('2018-12-28', 'GR002', 15),
('2018-12-28', 'GR003', 15),
('2018-12-28', 'GR004', 15),
('2018-12-28', 'GR005', 4.8),
('2018-12-28', 'SR001', 0.75),
('2018-12-28', 'SR002', 3.9),
('2018-12-28', 'SR003', 3),
('2018-12-29', 'AY001', 8.05),
('2018-12-29', 'BU001', 7),
('2018-12-29', 'BU002', 7),
('2018-12-29', 'BU003', 7),
('2018-12-29', 'BU004', 7),
('2018-12-29', 'DG001', 10.5),
('2018-12-29', 'GR001', 7),
('2018-12-29', 'GR002', 17.5),
('2018-12-29', 'GR003', 17.5),
('2018-12-29', 'GR004', 17.5),
('2018-12-29', 'GR005', 5.6),
('2018-12-29', 'SR001', 0.875),
('2018-12-29', 'SR002', 4.55),
('2018-12-29', 'SR003', 3.5),
('2018-12-30', 'AY001', 9.2),
('2018-12-30', 'BU001', 8),
('2018-12-30', 'BU002', 8),
('2018-12-30', 'BU003', 8),
('2018-12-30', 'BU004', 8),
('2018-12-30', 'DG001', 12),
('2018-12-30', 'GR001', 8),
('2018-12-30', 'GR002', 20),
('2018-12-30', 'GR003', 20),
('2018-12-30', 'GR004', 20),
('2018-12-30', 'GR005', 6.4),
('2018-12-30', 'SR001', 1),
('2018-12-30', 'SR002', 5.2),
('2018-12-30', 'SR003', 4),
('2018-12-31', 'AY001', 11.5),
('2018-12-31', 'BU001', 10),
('2018-12-31', 'BU002', 10),
('2018-12-31', 'BU003', 10),
('2018-12-31', 'BU004', 10),
('2018-12-31', 'DG001', 15),
('2018-12-31', 'GR001', 10),
('2018-12-31', 'GR002', 25),
('2018-12-31', 'GR003', 25),
('2018-12-31', 'GR004', 25),
('2018-12-31', 'GR005', 8),
('2018-12-31', 'SR001', 1.25),
('2018-12-31', 'SR002', 6.5),
('2018-12-31', 'SR003', 5);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_makanan`
--

CREATE TABLE `transaksi_makanan` (
  `tgl` date NOT NULL,
  `id_makanan` varchar(5) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi_makanan`
--

INSERT INTO `transaksi_makanan` (`tgl`, `id_makanan`, `jumlah`) VALUES
('2018-12-01', 'BISTI', 30),
('2018-12-01', 'DSSRT', 30),
('2018-12-01', 'NSGRG', 30),
('2018-12-01', 'STO', 30),
('2018-12-02', 'BISTI', 25),
('2018-12-02', 'DSSRT', 25),
('2018-12-02', 'NSGRG', 25),
('2018-12-02', 'STO', 25),
('2018-12-03', 'BISTI', 20),
('2018-12-03', 'DSSRT', 20),
('2018-12-03', 'NSGRG', 20),
('2018-12-03', 'STO', 20),
('2018-12-04', 'BISTI', 25),
('2018-12-04', 'DSSRT', 25),
('2018-12-04', 'NSGRG', 25),
('2018-12-04', 'STO', 25),
('2018-12-05', 'BISTI', 25),
('2018-12-05', 'DSSRT', 25),
('2018-12-05', 'NSGRG', 25),
('2018-12-05', 'STO', 25),
('2018-12-06', 'BISTI', 28),
('2018-12-06', 'DSSRT', 28),
('2018-12-06', 'NSGRG', 28),
('2018-12-06', 'STO', 28),
('2018-12-07', 'BISTI', 25),
('2018-12-07', 'DSSRT', 25),
('2018-12-07', 'NSGRG', 25),
('2018-12-07', 'STO', 25),
('2018-12-08', 'BISTI', 25),
('2018-12-08', 'DSSRT', 25),
('2018-12-08', 'NSGRG', 25),
('2018-12-08', 'STO', 25),
('2018-12-09', 'BISTI', 30),
('2018-12-09', 'DSSRT', 30),
('2018-12-09', 'NSGRG', 30),
('2018-12-09', 'STO', 30),
('2018-12-10', 'BISTI', 30),
('2018-12-10', 'DSSRT', 30),
('2018-12-10', 'NSGRG', 30),
('2018-12-10', 'STO', 30),
('2018-12-11', 'BISTI', 20),
('2018-12-11', 'DSSRT', 20),
('2018-12-11', 'NSGRG', 20),
('2018-12-11', 'STO', 20),
('2018-12-12', 'BISTI', 20),
('2018-12-12', 'DSSRT', 20),
('2018-12-12', 'NSGRG', 20),
('2018-12-12', 'STO', 20),
('2018-12-13', 'BISTI', 25),
('2018-12-13', 'DSSRT', 25),
('2018-12-13', 'NSGRG', 25),
('2018-12-13', 'STO', 25),
('2018-12-14', 'BISTI', 25),
('2018-12-14', 'DSSRT', 25),
('2018-12-14', 'NSGRG', 25),
('2018-12-14', 'STO', 25),
('2018-12-15', 'BISTI', 25),
('2018-12-15', 'DSSRT', 25),
('2018-12-15', 'NSGRG', 25),
('2018-12-15', 'STO', 25),
('2018-12-16', 'BISTI', 30),
('2018-12-16', 'DSSRT', 30),
('2018-12-16', 'NSGRG', 30),
('2018-12-16', 'STO', 30),
('2018-12-17', 'BISTI', 30),
('2018-12-17', 'DSSRT', 30),
('2018-12-17', 'NSGRG', 30),
('2018-12-17', 'STO', 30),
('2018-12-18', 'BISTI', 30),
('2018-12-18', 'DSSRT', 30),
('2018-12-18', 'NSGRG', 30),
('2018-12-18', 'STO', 30),
('2018-12-19', 'BISTI', 35),
('2018-12-19', 'DSSRT', 35),
('2018-12-19', 'NSGRG', 35),
('2018-12-19', 'STO', 35),
('2018-12-20', 'BISTI', 20),
('2018-12-20', 'DSSRT', 20),
('2018-12-20', 'NSGRG', 20),
('2018-12-20', 'STO', 20),
('2018-12-21', 'BISTI', 30),
('2018-12-21', 'DSSRT', 30),
('2018-12-21', 'NSGRG', 30),
('2018-12-21', 'STO', 30),
('2018-12-22', 'BISTI', 30),
('2018-12-22', 'DSSRT', 30),
('2018-12-22', 'NSGRG', 30),
('2018-12-22', 'STO', 30),
('2018-12-23', 'BISTI', 30),
('2018-12-23', 'DSSRT', 30),
('2018-12-23', 'NSGRG', 30),
('2018-12-23', 'STO', 30),
('2018-12-24', 'BISTI', 45),
('2018-12-24', 'DSSRT', 45),
('2018-12-24', 'NSGRG', 45),
('2018-12-24', 'STO', 45),
('2018-12-25', 'BISTI', 45),
('2018-12-25', 'DSSRT', 45),
('2018-12-25', 'NSGRG', 45),
('2018-12-25', 'STO', 45),
('2018-12-26', 'BISTI', 30),
('2018-12-26', 'DSSRT', 30),
('2018-12-26', 'NSGRG', 30),
('2018-12-26', 'STO', 30),
('2018-12-27', 'BISTI', 25),
('2018-12-27', 'DSSRT', 25),
('2018-12-27', 'NSGRG', 25),
('2018-12-27', 'STO', 25),
('2018-12-28', 'BISTI', 30),
('2018-12-28', 'DSSRT', 30),
('2018-12-28', 'NSGRG', 30),
('2018-12-28', 'STO', 30),
('2018-12-29', 'BISTI', 35),
('2018-12-29', 'DSSRT', 35),
('2018-12-29', 'NSGRG', 35),
('2018-12-29', 'STO', 35),
('2018-12-30', 'BISTI', 40),
('2018-12-30', 'DSSRT', 40),
('2018-12-30', 'NSGRG', 40),
('2018-12-30', 'STO', 40),
('2018-12-31', 'BISTI', 50),
('2018-12-31', 'DSSRT', 50),
('2018-12-31', 'NSGRG', 50),
('2018-12-31', 'STO', 50);

-- --------------------------------------------------------

--
-- Table structure for table `t_event`
--

CREATE TABLE `t_event` (
  `tgl` date NOT NULL,
  `event` varchar(50) NOT NULL,
  `total` int(11) NOT NULL,
  `harga_event` int(11) NOT NULL,
  `prosentase` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `nama`, `status`) VALUES
('bimo', 'roosadi', 'Bimo', 0),
('wildan', 'harits', 'deden', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bahan_makanan`
--
ALTER TABLE `bahan_makanan`
  ADD PRIMARY KEY (`id_bahan_makanan`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD UNIQUE KEY `id_barang` (`id_barang`);

--
-- Indexes for table `biaya`
--
ALTER TABLE `biaya`
  ADD PRIMARY KEY (`id_biaya`);

--
-- Indexes for table `eoq`
--
ALTER TABLE `eoq`
  ADD PRIMARY KEY (`bulan`,`tahun`,`id_bahan`);

--
-- Indexes for table `hitung`
--
ALTER TABLE `hitung`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  ADD UNIQUE KEY `nama_kategori` (`nama_kategori`);

--
-- Indexes for table `makanan`
--
ALTER TABLE `makanan`
  ADD PRIMARY KEY (`id_makanan`);

--
-- Indexes for table `stok_bahan`
--
ALTER TABLE `stok_bahan`
  ADD PRIMARY KEY (`id_bahan`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`event`,`tgl`,`id_barang`);

--
-- Indexes for table `transaksi_bahan`
--
ALTER TABLE `transaksi_bahan`
  ADD PRIMARY KEY (`tgl`,`id_bahan`);

--
-- Indexes for table `transaksi_makanan`
--
ALTER TABLE `transaksi_makanan`
  ADD PRIMARY KEY (`tgl`,`id_makanan`);

--
-- Indexes for table `t_event`
--
ALTER TABLE `t_event`
  ADD PRIMARY KEY (`tgl`,`event`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
