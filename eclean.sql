-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2020 at 06:14 PM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eclean`
--

-- --------------------------------------------------------

--
-- Table structure for table `layanan`
--

CREATE TABLE `layanan` (
  `id_layanan` int(11) NOT NULL,
  `jenis_layanan` text NOT NULL,
  `nama_layanan` text NOT NULL,
  `harga_layanan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `layanan`
--

INSERT INTO `layanan` (`id_layanan`, `jenis_layanan`, `nama_layanan`, `harga_layanan`) VALUES
(1, 'Cuci Sepatu', 'Cuci', 25000),
(2, 'Reparasi Sepatu', 'Servis', 30000),
(3, 'Cuci Sepatu', 'Cuci Gokil', 35000),
(4, 'Reparasi Sepatu', 'Servis Kilat', 40000);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `alamat_rumah` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `username`, `no_hp`, `email`, `password`, `alamat_rumah`) VALUES
(3, 'hoseajaya', '081310831668', 'hoseamangunsong512@gmail.com', 'Puters0!', 'Jl. Puter VI No. 12'),
(4, 'pelanggan1', '0923', 'asal@assal.com', 'LOL', 'Jl. AJA'),
(5, 'pengguna1', '12345', 'halo@google.com', 'kaka', 'Jl. Contoh 1'),
(6, 'pelanggan2', '190190', 'aduhapaya@domain.id', 'pelanggan2', 'Jl. Rumah 1');

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `id_pemesanan` int(11) NOT NULL,
  `id_layanan` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `jumlah_pasang_sepatu` int(11) NOT NULL,
  `pengurangan_harga` int(11) DEFAULT NULL,
  `foto_sepatu` longblob NOT NULL,
  `total_harga` int(11) NOT NULL,
  `tanggal_pemesanan` datetime NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pemesanan`
--

INSERT INTO `pemesanan` (`id_pemesanan`, `id_layanan`, `id_pelanggan`, `jumlah_pasang_sepatu`, `pengurangan_harga`, `foto_sepatu`, `total_harga`, `tanggal_pemesanan`, `status`) VALUES
(4, 1, 3, 2, 12000, '', 68000, '2020-12-07 20:59:47', ''),
(5, 1, 3, 4, 24000, 0x5669727475616c426f785f5072616b74696b756d5f30365f30395f323031395f31325f35395f31372e706e67, 136000, '2020-12-07 21:32:54', '3 hari lagi selesai'),
(6, 4, 3, 1, 9000000, 0x5669727475616c426f785f5072616b74696b756d5f30365f30395f323031395f31335f31315f33342e706e67, 17500, '2020-12-08 00:00:06', 'Baru Diterima'),
(7, 4, 3, 1, 9000000, 0x5669727475616c426f785f5072616b74696b756d5f30365f30395f323031395f31335f31395f30332e706e67, 17500, '2020-12-08 00:01:57', '');

-- --------------------------------------------------------

--
-- Table structure for table `pemilik`
--

CREATE TABLE `pemilik` (
  `id_pemilik` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `alamat_rumah` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pemilik`
--

INSERT INTO `pemilik` (`id_pemilik`, `username`, `no_hp`, `email`, `password`, `alamat_rumah`) VALUES
(1, 'pemilikaja', '082919283943', 'pemilikberjaya@gmail.com', 'pemilikpulang', 'Jl. Mall Raya');

-- --------------------------------------------------------

--
-- Table structure for table `promo`
--

CREATE TABLE `promo` (
  `kode_promo` varchar(50) NOT NULL,
  `id_layanan` int(11) NOT NULL,
  `opsi_pengurangan` varchar(50) NOT NULL,
  `pengurangan` int(11) NOT NULL,
  `judul_artikel` varchar(200) DEFAULT NULL,
  `isi_artikel` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `promo`
--

INSERT INTO `promo` (`kode_promo`, `id_layanan`, `opsi_pengurangan`, `pengurangan`, `judul_artikel`, `isi_artikel`) VALUES
('KELOMPOK2JAYA', 4, 'Angka Langsung', 22500, 'Kelompok 2 Jaya, Pake Kode Promo KELOMPOK2JAYA Biar Lo Lebih Keren', 'Kelompok 2 Jaya, promo ini mengurangi harga servis kilat sebesar 22500'),
('PROMOASIK', 1, 'Berdasarkan Persentase', 15, 'Gunakan Kode PROMOASIK Untuk Mendapatkan Diskon 15% Untuk Cuci Sepatu', 'E-Clean menghadirkan kode promo untuk pertama kalinya dengan kode PROMOASIK. Promo Asik pasti asik. Dengan kode PROMOASIK, anda mendapatkan diskon 15% untuk layanan pencucian sepatu.'),
('SERVISMANTAP', 2, 'Angka Langsung', 20000, 'Servis Mantap dengan E-Clean dan Servis Semakin Mantap dengan SERVISMANTAP', 'Servis sepatu di E-Clean memberikan kemudahan bagi anda dalam memesan layanan cuci dan servis sepatu. Promo ini mengurangi harga servis sepatu sebesar 20000 dengan memasukkan kode promo SERVISMANTAP.');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `nama_pelanggan` varchar(100) NOT NULL,
  `komen_pelanggan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`nama_pelanggan`, `komen_pelanggan`) VALUES
('Yunico', 'Mantap dah pokoknya E-Clean ini');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_invoice` int(11) NOT NULL,
  `id_pemesanan` int(11) NOT NULL,
  `bukti_pembayaran` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_invoice`, `id_pemesanan`, `bukti_pembayaran`) VALUES
(1, 4, 0x53637265656e73686f74202831292e706e67),
(2, 5, 0x5669727475616c426f785f5072616b74696b756d5f30365f30395f323031395f31325f35375f30312e706e67),
(3, 6, 0x5669727475616c426f785f5072616b74696b756d5f30365f30395f323031395f31325f35385f31322e706e67),
(4, 7, 0x5669727475616c426f785f5072616b74696b756d5f30365f30395f323031395f31345f32385f34322e706e67);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `layanan`
--
ALTER TABLE `layanan`
  ADD PRIMARY KEY (`id_layanan`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`id_pemesanan`),
  ADD KEY `id_layanan` (`id_layanan`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indexes for table `pemilik`
--
ALTER TABLE `pemilik`
  ADD PRIMARY KEY (`id_pemilik`);

--
-- Indexes for table `promo`
--
ALTER TABLE `promo`
  ADD PRIMARY KEY (`kode_promo`),
  ADD KEY `id_layanan` (`id_layanan`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD UNIQUE KEY `nama_pelanggan` (`nama_pelanggan`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_invoice`),
  ADD KEY `id_pemesanan` (`id_pemesanan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pemesanan`
--
ALTER TABLE `pemesanan`
  MODIFY `id_pemesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pemilik`
--
ALTER TABLE `pemilik`
  MODIFY `id_pemilik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_invoice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `pemesanan_ibfk_1` FOREIGN KEY (`id_layanan`) REFERENCES `layanan` (`id_layanan`),
  ADD CONSTRAINT `pemesanan_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);

--
-- Constraints for table `promo`
--
ALTER TABLE `promo`
  ADD CONSTRAINT `promo_ibfk_1` FOREIGN KEY (`id_layanan`) REFERENCES `layanan` (`id_layanan`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_pemesanan`) REFERENCES `pemesanan` (`id_pemesanan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
