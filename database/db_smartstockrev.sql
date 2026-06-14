-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2025 at 01:29 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_smartstockrev`
--

-- --------------------------------------------------------

--
-- Table structure for table `tmbarang`
--

CREATE TABLE `tmbarang` (
  `Id_barang` int(11) NOT NULL,
  `kode` varchar(10) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `Id_kategori` int(11) DEFAULT NULL,
  `satuan` varchar(20) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tmbarang`
--

INSERT INTO `tmbarang` (`Id_barang`, `kode`, `nama`, `Id_kategori`, `satuan`, `stok`) VALUES
(1, 'BR01', 'Beras Pandan Wangi', 1, 'Kg', 56),
(2, 'MIEGOR1', 'Mie Indomie Goreng', 2, 'Buah', 40),
(3, 'MIEGOR2', 'Mie Sedap Goreng', 2, 'Buah', 40),
(4, 'MINUM1', 'Le Mineral', 3, 'Buah', 24),
(5, 'MINUM2', 'Aqua', 3, 'Buah', 40),
(6, 'GD1', 'Good Day Coffe Freeze Choc Orange', 4, 'Buah', 10),
(7, 'GD2', 'Good Day Chocochinno', 4, 'Buah', 10),
(8, 'GD3', 'Good Day Moccacino', 4, 'Buah', 10),
(9, 'NS1', 'Nutrisari Blewah', 4, 'Buah', 10),
(10, 'NS2', 'Nutrisari Anggur Hijau', 4, 'Buah', 10);

-- --------------------------------------------------------

--
-- Table structure for table `tmkategori`
--

CREATE TABLE `tmkategori` (
  `Id_kategori` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `no_rak` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tmkategori`
--

INSERT INTO `tmkategori` (`Id_kategori`, `nama`, `no_rak`) VALUES
(1, 'Beras', 1),
(2, 'Mie', 2),
(3, 'Minuman', 3),
(4, 'Minuman Sachet', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tmpelanggan`
--

CREATE TABLE `tmpelanggan` (
  `Id_pelanggan` int(11) NOT NULL,
  `kode` varchar(10) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `no_telp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tmpelanggan`
--

INSERT INTO `tmpelanggan` (`Id_pelanggan`, `kode`, `nama`, `alamat`, `no_telp`) VALUES
(1, 'USH001', 'Vito', 'Sragen', '08598765432');

-- --------------------------------------------------------

--
-- Table structure for table `tmpetugas`
--

CREATE TABLE `tmpetugas` (
  `Id_petugas` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `status` enum('aktif','nonaktif') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tmpetugas`
--

INSERT INTO `tmpetugas` (`Id_petugas`, `nama`, `username`, `password`, `status`) VALUES
(1, 'Titan Adhitya', 'admin', '$2a$10$sxBu.ZZ4zStmJAzI8OVoJejvT5vTGbaVlmzLUaCjzffp9lfmvNIyG', 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `tmsupplier`
--

CREATE TABLE `tmsupplier` (
  `Id_supplier` int(11) NOT NULL,
  `kode` varchar(10) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` varchar(200) DEFAULT NULL,
  `no_telp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tmsupplier`
--

INSERT INTO `tmsupplier` (`Id_supplier`, `kode`, `nama`, `alamat`, `no_telp`) VALUES
(1, 'JUMBO', 'Jumbo', 'Solobaru', '085156789432');

-- --------------------------------------------------------

--
-- Table structure for table `trbarang_keluar`
--

CREATE TABLE `trbarang_keluar` (
  `Id_barang_keluar` int(11) NOT NULL,
  `tgl` date DEFAULT NULL,
  `Id_petugas` int(11) DEFAULT NULL,
  `Id_pelanggan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `trbarang_keluar`
--

INSERT INTO `trbarang_keluar` (`Id_barang_keluar`, `tgl`, `Id_petugas`, `Id_pelanggan`) VALUES
(1, '2024-12-18', 1, 1),
(2, '2024-12-18', 1, 1),
(3, '2024-12-18', 1, 1),
(4, '2024-12-19', 1, 1),
(5, '2025-01-07', 1, 1),
(6, '2025-01-07', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `trbarang_keluar_detail`
--

CREATE TABLE `trbarang_keluar_detail` (
  `Id_barang_keluar` int(11) NOT NULL,
  `Id_barang` int(11) NOT NULL,
  `jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `trbarang_keluar_detail`
--

INSERT INTO `trbarang_keluar_detail` (`Id_barang_keluar`, `Id_barang`, `jumlah`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 1),
(4, 1, 1),
(5, 1, 1),
(6, 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `trbarang_masuk`
--

CREATE TABLE `trbarang_masuk` (
  `Id_barang_masuk` int(11) NOT NULL,
  `tgl` date DEFAULT NULL,
  `Id_petugas` int(11) DEFAULT NULL,
  `Id_supplier` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `trbarang_masuk`
--

INSERT INTO `trbarang_masuk` (`Id_barang_masuk`, `tgl`, `Id_petugas`, `Id_supplier`) VALUES
(1, '2024-12-18', 1, 1),
(2, '2024-12-18', 1, 1),
(3, '2024-12-18', 1, 1),
(4, '2024-12-18', 1, 1),
(5, '2024-12-18', 1, 1),
(6, '2024-12-18', 1, 1),
(7, '2024-12-18', 1, 1),
(8, '2025-01-07', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `trbarang_masuk_detail`
--

CREATE TABLE `trbarang_masuk_detail` (
  `Id_barang_masuk` int(11) NOT NULL,
  `Id_barang` int(11) NOT NULL,
  `jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `trbarang_masuk_detail`
--

INSERT INTO `trbarang_masuk_detail` (`Id_barang_masuk`, `Id_barang`, `jumlah`) VALUES
(1, 1, 5),
(2, 1, 1),
(3, 1, 1),
(4, 1, 1),
(5, 1, 1),
(6, 1, 1),
(7, 1, 1),
(8, 1, 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tmbarang`
--
ALTER TABLE `tmbarang`
  ADD PRIMARY KEY (`Id_barang`),
  ADD UNIQUE KEY `kode` (`kode`),
  ADD KEY `Id_kategori` (`Id_kategori`);

--
-- Indexes for table `tmkategori`
--
ALTER TABLE `tmkategori`
  ADD PRIMARY KEY (`Id_kategori`);

--
-- Indexes for table `tmpelanggan`
--
ALTER TABLE `tmpelanggan`
  ADD PRIMARY KEY (`Id_pelanggan`),
  ADD UNIQUE KEY `kode` (`kode`);

--
-- Indexes for table `tmpetugas`
--
ALTER TABLE `tmpetugas`
  ADD PRIMARY KEY (`Id_petugas`);

--
-- Indexes for table `tmsupplier`
--
ALTER TABLE `tmsupplier`
  ADD PRIMARY KEY (`Id_supplier`),
  ADD UNIQUE KEY `kode` (`kode`);

--
-- Indexes for table `trbarang_keluar`
--
ALTER TABLE `trbarang_keluar`
  ADD PRIMARY KEY (`Id_barang_keluar`),
  ADD KEY `Id_petugas` (`Id_petugas`),
  ADD KEY `Id_pelanggan` (`Id_pelanggan`);

--
-- Indexes for table `trbarang_keluar_detail`
--
ALTER TABLE `trbarang_keluar_detail`
  ADD PRIMARY KEY (`Id_barang_keluar`,`Id_barang`),
  ADD KEY `Id_barang` (`Id_barang`);

--
-- Indexes for table `trbarang_masuk`
--
ALTER TABLE `trbarang_masuk`
  ADD PRIMARY KEY (`Id_barang_masuk`),
  ADD KEY `Id_petugas` (`Id_petugas`),
  ADD KEY `Id_supplier` (`Id_supplier`);

--
-- Indexes for table `trbarang_masuk_detail`
--
ALTER TABLE `trbarang_masuk_detail`
  ADD PRIMARY KEY (`Id_barang_masuk`,`Id_barang`),
  ADD KEY `Id_barang` (`Id_barang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tmbarang`
--
ALTER TABLE `tmbarang`
  MODIFY `Id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tmkategori`
--
ALTER TABLE `tmkategori`
  MODIFY `Id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tmpelanggan`
--
ALTER TABLE `tmpelanggan`
  MODIFY `Id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tmpetugas`
--
ALTER TABLE `tmpetugas`
  MODIFY `Id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tmsupplier`
--
ALTER TABLE `tmsupplier`
  MODIFY `Id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `trbarang_keluar`
--
ALTER TABLE `trbarang_keluar`
  MODIFY `Id_barang_keluar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `trbarang_masuk`
--
ALTER TABLE `trbarang_masuk`
  MODIFY `Id_barang_masuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tmbarang`
--
ALTER TABLE `tmbarang`
  ADD CONSTRAINT `tmbarang_ibfk_1` FOREIGN KEY (`Id_kategori`) REFERENCES `tmkategori` (`Id_kategori`);

--
-- Constraints for table `trbarang_keluar`
--
ALTER TABLE `trbarang_keluar`
  ADD CONSTRAINT `trbarang_keluar_ibfk_1` FOREIGN KEY (`Id_petugas`) REFERENCES `tmpetugas` (`Id_petugas`),
  ADD CONSTRAINT `trbarang_keluar_ibfk_2` FOREIGN KEY (`Id_pelanggan`) REFERENCES `tmpelanggan` (`Id_pelanggan`);

--
-- Constraints for table `trbarang_keluar_detail`
--
ALTER TABLE `trbarang_keluar_detail`
  ADD CONSTRAINT `trbarang_keluar_detail_ibfk_1` FOREIGN KEY (`Id_barang_keluar`) REFERENCES `trbarang_keluar` (`Id_barang_keluar`),
  ADD CONSTRAINT `trbarang_keluar_detail_ibfk_2` FOREIGN KEY (`Id_barang`) REFERENCES `tmbarang` (`Id_barang`);

--
-- Constraints for table `trbarang_masuk`
--
ALTER TABLE `trbarang_masuk`
  ADD CONSTRAINT `trbarang_masuk_ibfk_1` FOREIGN KEY (`Id_petugas`) REFERENCES `tmpetugas` (`Id_petugas`),
  ADD CONSTRAINT `trbarang_masuk_ibfk_2` FOREIGN KEY (`Id_supplier`) REFERENCES `tmsupplier` (`Id_supplier`);

--
-- Constraints for table `trbarang_masuk_detail`
--
ALTER TABLE `trbarang_masuk_detail`
  ADD CONSTRAINT `trbarang_masuk_detail_ibfk_1` FOREIGN KEY (`Id_barang_masuk`) REFERENCES `trbarang_masuk` (`Id_barang_masuk`),
  ADD CONSTRAINT `trbarang_masuk_detail_ibfk_2` FOREIGN KEY (`Id_barang`) REFERENCES `tmbarang` (`Id_barang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
