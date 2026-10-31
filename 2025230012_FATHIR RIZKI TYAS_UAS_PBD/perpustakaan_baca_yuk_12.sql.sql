-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2026 at 04:19 PM
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
-- Database: `perpustakaan_baca_yuk_12`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `ID_Anggota` varchar(10) NOT NULL,
  `Nama_Anggota` varchar(100) NOT NULL,
  `Alamat` varchar(200) DEFAULT NULL,
  `No_Telepon` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`ID_Anggota`, `Nama_Anggota`, `Alamat`, `No_Telepon`, `Email`) VALUES
('A001_12', 'Fathir Saputra', 'Jakarta', '081111111111', 'fathir@gmail.com'),
('A002_12', 'Rizki Cahaya', 'Bekasi', '081111111112', 'rizki@gmail.com'),
('A003_12', 'Budi Santoso', 'Depok', '081111111113', 'budi@gmail.com'),
('A004_12', 'Andi Wijaya', 'Bogor', '081111111114', 'andi@gmail.com'),
('A005_12', 'Siti Aminah', 'Bandung', '081111111115', 'siti@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `ID_Buku` varchar(10) NOT NULL,
  `Judul` varchar(100) NOT NULL,
  `Penulis` varchar(50) NOT NULL,
  `Penerbit` varchar(50) NOT NULL,
  `Tahun_Terbit` int(11) DEFAULT NULL,
  `Jumlah_Stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`ID_Buku`, `Judul`, `Penulis`, `Penerbit`, `Tahun_Terbit`, `Jumlah_Stok`) VALUES
('B001_12', 'Petualangan Fathir di Dunia Basis Data', 'Abdul Kadir', 'Andi', 2022, 22),
('B002_12', 'Belajar SQL bersama Rizki', 'Tere Liye', 'Gramedia', 2023, 22),
('B003_12', 'Struktur Data', 'Rinaldi Munir', 'Informatika', 2021, 18),
('B004_12', 'Algoritma Pemrograman', 'Tere Liye', 'Erlangga', 2020, 12),
('B005_12', 'Jaringan Komputer', 'Andrew S. Tanenbaum', 'Pearson', 2019, 10);

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `ID_Peminjaman` varchar(10) NOT NULL,
  `ID_Buku` varchar(10) DEFAULT NULL,
  `ID_Anggota` varchar(10) DEFAULT NULL,
  `Tanggal_Pinjam` date DEFAULT NULL,
  `Tanggal_Kembali` date DEFAULT NULL,
  `Denda` decimal(10,2) DEFAULT 0.00,
  `ID_Staf_Pencatat` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`ID_Peminjaman`, `ID_Buku`, `ID_Anggota`, `Tanggal_Pinjam`, `Tanggal_Kembali`, `Denda`, `ID_Staf_Pencatat`) VALUES
('P001_12', 'B001_12', 'A001_12', '2026-06-01', '2026-07-06', 5000.00, 'S001_12'),
('P002_12', 'B002_12', 'A002_12', '2026-06-03', NULL, 0.00, 'S002_12'),
('P003_12', 'B003_12', 'A003_12', '2026-06-05', '2026-06-12', 5000.00, 'S001_12'),
('P004_12', 'B004_12', 'A004_12', '2026-06-08', '2026-06-15', 0.00, 'S003_12'),
('P005_12', 'B005_12', 'A005_12', '2026-06-10', NULL, 0.00, 'S002_12');

-- --------------------------------------------------------

--
-- Table structure for table `staf`
--

CREATE TABLE `staf` (
  `ID_Staf` varchar(10) NOT NULL,
  `Nama_Staf` varchar(100) NOT NULL,
  `Jabatan` varchar(50) DEFAULT NULL,
  `No_Telepon` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staf`
--

INSERT INTO `staf` (`ID_Staf`, `Nama_Staf`, `Jabatan`, `No_Telepon`, `Email`) VALUES
('S001_12', 'Fathir Prakoso', 'Admin', '082222222221', 'fathir@perpus.com'),
('S002_12', 'Tyas Lestari', 'Petugas', '082222222222', 'tyas@perpus.com'),
('S003_12', 'Agus Salim', 'Kepala Perpustakaan', '082222222223', 'agus@perpus.com'),
('S004_12', 'Rina Wulandari', 'Petugas', '082222222224', 'rina@perpus.com'),
('S005_12', 'Dimas Putra', 'Admin', '082222222225', 'dimas@perpus.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`ID_Anggota`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`ID_Buku`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`ID_Peminjaman`),
  ADD KEY `FK_Peminjaman_Buku` (`ID_Buku`),
  ADD KEY `FK_Peminjaman_Anggota` (`ID_Anggota`),
  ADD KEY `FK_Staf` (`ID_Staf_Pencatat`);

--
-- Indexes for table `staf`
--
ALTER TABLE `staf`
  ADD PRIMARY KEY (`ID_Staf`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `FK_Peminjaman_Anggota` FOREIGN KEY (`ID_Anggota`) REFERENCES `anggota` (`ID_Anggota`),
  ADD CONSTRAINT `FK_Peminjaman_Buku` FOREIGN KEY (`ID_Buku`) REFERENCES `buku` (`ID_Buku`),
  ADD CONSTRAINT `FK_Staf` FOREIGN KEY (`ID_Staf_Pencatat`) REFERENCES `staf` (`ID_Staf`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
