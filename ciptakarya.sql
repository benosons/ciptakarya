-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 03, 2022 at 08:26 AM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ciptakarya`
--

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id` int(11) NOT NULL,
  `judul` varchar(64) DEFAULT NULL,
  `intro` text,
  `tag` varchar(24) DEFAULT NULL,
  `isi` text,
  `gambar` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  `bag` varchar(16) DEFAULT NULL,
  `stat` varchar(255) DEFAULT NULL,
  `idfile` int(5) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(16) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(16) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `data_agenda`
--

CREATE TABLE `data_agenda` (
  `id` int(5) NOT NULL,
  `deskripsi` text NOT NULL,
  `tanggal` date NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_agenda`
--

INSERT INTO `data_agenda` (`id`, `deskripsi`, `tanggal`, `status`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(2, '<p>testing</p>', '2022-04-09', 1, '2022-03-31 20:37:29', '1', '0000-00-00 00:00:00', '1');

-- --------------------------------------------------------

--
-- Table structure for table `data_balai`
--

CREATE TABLE `data_balai` (
  `id` int(5) NOT NULL,
  `kategori` int(5) NOT NULL,
  `linkgeo` varchar(255) NOT NULL,
  `jml_pns` int(50) NOT NULL,
  `jml_nonpns` int(50) NOT NULL,
  `aset_terimakan` int(50) NOT NULL,
  `aset_proses` int(50) NOT NULL,
  `hu` int(50) NOT NULL,
  `mta` int(50) NOT NULL,
  `toilet` int(50) NOT NULL,
  `jml_orang` int(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_balai`
--

INSERT INTO `data_balai` (`id`, `kategori`, `linkgeo`, `jml_pns`, `jml_nonpns`, `aset_terimakan`, `aset_proses`, `hu`, `mta`, `toilet`, `jml_orang`, `created_at`, `created_by`) VALUES
(1, 1, '-', 1, 1, 1, 1, 1, 1, 0, 1, '2022-03-30 03:15:31', '1'),
(2, 3, '-', 1, 1, 1, 1, 1, 1, 0, 1, '2022-03-30 03:17:13', '1'),
(3, 3, '-', 1, 1, 1, 1, 1, 1, 1, 1, '2022-03-30 03:20:24', '1');

-- --------------------------------------------------------

--
-- Table structure for table `data_banner`
--

CREATE TABLE `data_banner` (
  `id` int(5) NOT NULL,
  `judul` text NOT NULL,
  `tipe` varchar(50) NOT NULL,
  `keterangan` text NOT NULL,
  `status` int(5) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_banner`
--

INSERT INTO `data_banner` (`id`, `judul`, `tipe`, `keterangan`, `status`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(4, 'judul', 'halaman', 'test', 0, '2022-03-31 06:43:21', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `data_berita`
--

CREATE TABLE `data_berita` (
  `id` int(11) NOT NULL,
  `judul` text,
  `intro` text,
  `tag` varchar(32) DEFAULT NULL,
  `isi` longtext,
  `bagian` int(4) DEFAULT NULL,
  `date` varchar(24) DEFAULT NULL,
  `stat` int(2) DEFAULT NULL,
  `idfile` int(5) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(4) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `data_berita`
--

INSERT INTO `data_berita` (`id`, `judul`, `intro`, `tag`, `isi`, `bagian`, `date`, `stat`, `idfile`, `create_date`, `create_by`, `update_date`, `update_by`) VALUES
(12, 'TESTed', 'TEST', 'TEST', '<p>TEST</p>', 2, '03/29/2022', 0, 0, '2022-03-29 04:04:20', '1', '2022-03-31 03:52:12', '1');

-- --------------------------------------------------------

--
-- Table structure for table `data_buku_profil`
--

CREATE TABLE `data_buku_profil` (
  `id` int(5) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `intro` text NOT NULL,
  `tahun` varchar(20) NOT NULL,
  `kategori` varchar(150) NOT NULL,
  `stat` int(5) NOT NULL,
  `create_date` datetime NOT NULL,
  `create_by` varchar(50) NOT NULL,
  `update_date` datetime NOT NULL,
  `update_by` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_buku_profil`
--

INSERT INTO `data_buku_profil` (`id`, `judul`, `intro`, `tahun`, `kategori`, `stat`, `create_date`, `create_by`, `update_date`, `update_by`) VALUES
(1, 'judulpoi', 'testsdsadsdasdas', '2022', 'Profil Infrastruktur Permukiman', 1, '2022-04-02 23:00:32', '1', '0000-00-00 00:00:00', '1'),
(2, 'judul', 'fdghjk', '2022', 'test', 1, '2022-04-03 08:16:14', '1', '2022-04-03 08:16:14', '1');

-- --------------------------------------------------------

--
-- Table structure for table `data_file`
--

CREATE TABLE `data_file` (
  `id` int(11) NOT NULL,
  `id_parent` int(64) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `path` text,
  `size` varchar(32) DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `filename` text,
  `caption` text,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `data_file`
--

INSERT INTO `data_file` (`id`, `id_parent`, `type`, `path`, `size`, `extension`, `filename`, `caption`, `create_date`, `update_date`) VALUES
(25, 11, 'berita', './assets/upload/berita/2022/03/14', '7460340', 'image/jpeg', 'days gone 17 ready.jpg', NULL, '2022-03-14 15:02:57', '2022-03-14 16:05:18'),
(35, 2, 'poster', './assets/upload/galeri/banner/2022/03/31', '42105', 'image/jpeg', 'profile-card.jpg', NULL, '2022-03-31 06:34:41', '2022-03-31 06:34:41'),
(9, 7, 'poster', './assets/upload/galeri/poster/2022/02/01', '63974', 'image/jpeg', '1146175_571239072961877_52607445_o.jpg', 'sip lah', '2022-02-01 13:51:17', '2022-02-01 13:51:17'),
(31, 5, 'profile', './assets/upload/profile/2022/03/30', '55484', 'image/jpeg', 'example1.jpeg', NULL, '2022-03-30 01:43:56', '2022-03-30 01:43:56'),
(13, 3, 'profile', './assets/upload/profile/2022/02/02', '60712', 'image/jpeg', '1498852_571238729628578_1690165841_o.jpg', NULL, '2022-02-02 15:59:52', '2022-02-02 15:59:52'),
(34, 1, 'poster', './assets/upload/galeri/banner/2022/03/31', '42105', 'image/jpeg', 'profile-card.jpg', NULL, '2022-03-31 06:30:15', '2022-03-31 06:30:15'),
(21, 6, 'berita', './assets/upload/berita/2022/03/14', '110946', 'image/jpeg', 'WhatsApp Image 2022-03-02 at 9.44.13 AM.jpeg', '', '2022-03-14 13:22:06', '2022-03-14 13:22:06'),
(16, 2, 'berita', './assets/upload/berita/2022/03/04', '7460340', 'image/jpeg', 'days gone 17 ready.jpg', 'gbr 2', '2022-03-04 12:43:51', '2022-03-04 12:43:51'),
(27, 9, 'foto', './assets/upload/galeri/foto/2022/03/14', '7460340', 'image/jpeg', 'days gone 17 ready.jpg', 'testing', '2022-03-14 17:24:45', '2022-03-14 17:24:45'),
(30, 12, 'berita', './assets/upload/berita/2022/03/29', '101969', 'image/jpeg', 'thumb-v-y-2.jpg', 'TEST', '2022-03-29 04:04:20', '2022-03-29 04:05:44'),
(29, 4, 'profile', './assets/upload/profile/2022/03/28', '79637', 'image/jpeg', 'thumb-v-y-1.jpg', NULL, '2022-03-28 13:12:08', '2022-03-28 13:12:08'),
(32, 6, 'profile', './assets/upload/profile/2022/03/30', '55484', 'image/jpeg', 'example1.jpeg', NULL, '2022-03-30 01:48:52', '2022-03-30 01:48:52'),
(33, 13, 'poster', './assets/upload/galeri/poster/2022/03/31', '36688', 'image/jpeg', '1.jpg', NULL, '2022-03-31 03:12:57', '2022-03-31 03:13:26'),
(56, 2, 'buku', './assets/upload/file/buku/2022/04/03', '107424', 'application/pdf', 'dummy_file.pdf', NULL, '2022-04-03 08:16:14', '2022-04-03 08:16:14'),
(37, 4, 'banner', './assets/upload/galeri/banner/2022/03/31', '83825', 'image/jpeg', 'img_2.jpg', NULL, '2022-03-31 06:43:21', '2022-03-31 07:25:09'),
(38, 2, 'infografis', './assets/upload/galeri/infografis/2022/03/31', '11293', 'image/png', 'darkBG.png', NULL, '2022-03-31 19:45:38', '2022-03-31 19:45:38'),
(54, 1, 'buku', './assets/upload/file/buku/2022/04/02', '107424', 'application/pdf', 'dummy_file.pdf', NULL, '2022-04-02 23:00:32', '2022-04-02 23:00:32'),
(55, 1, 'buku', './assets/upload/file/buku/2022/04/03', '237441', 'application/x-zip-compressed', 'lightbox2-2.11.1.zip', NULL, '2022-04-02 23:00:32', '2022-04-03 05:51:33'),
(57, 2, 'buku', './assets/upload/file/buku/2022/04/03', '12361371', 'application/x-zip-compressed', 'IDM.6.37.b.14.kuyhAa.Me.zip', NULL, '2022-04-03 08:16:14', '2022-04-03 08:16:14'),
(60, 2, 'laporan', './assets/upload/file/laporan/2022/04/03', '107424', 'application/pdf', 'dummy_file.pdf', NULL, '2022-04-03 08:23:34', '2022-04-03 08:23:34'),
(61, 2, 'laporan', './assets/upload/file/laporan/2022/04/03', '237441', 'application/x-zip-compressed', 'lightbox2-2.11.1.zip', NULL, '2022-04-03 08:23:34', '2022-04-03 08:23:34'),
(62, 14, 'poster', './assets/upload/galeri/poster/2022/04/03', '1542777', 'image/jpeg', 'hunter-newton-wxu6mKDrYd8-unsplash.jpg', NULL, '2022-04-03 08:24:10', '2022-04-03 08:24:10');

-- --------------------------------------------------------

--
-- Table structure for table `data_foto`
--

CREATE TABLE `data_foto` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `Sektor` varchar(4) DEFAULT NULL,
  `tahun` varchar(8) DEFAULT NULL,
  `status` varchar(4) DEFAULT NULL,
  `create_by` varchar(8) DEFAULT NULL,
  `update_by` varchar(8) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `data_foto`
--

INSERT INTO `data_foto` (`id`, `judul`, `Sektor`, `tahun`, `status`, `create_by`, `update_by`, `create_date`, `update_date`) VALUES
(9, 'test', '1', '2022', 'on', '1', '1', '2022-03-14 17:24:45', '2022-03-14 17:24:45');

-- --------------------------------------------------------

--
-- Table structure for table `data_grafis`
--

CREATE TABLE `data_grafis` (
  `id` int(5) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `tahun` varchar(50) NOT NULL,
  `status` int(5) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_grafis`
--

INSERT INTO `data_grafis` (`id`, `judul`, `tahun`, `status`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(2, 'judulpoi', '2022', 0, '2022-03-31 19:45:38', '1', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `data_laporan`
--

CREATE TABLE `data_laporan` (
  `id` int(5) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `intro` text NOT NULL,
  `tahun` varchar(50) NOT NULL,
  `kategori` varchar(150) NOT NULL,
  `stat` int(5) NOT NULL,
  `create_by` varchar(50) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_by` varchar(50) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_laporan`
--

INSERT INTO `data_laporan` (`id`, `judul`, `intro`, `tahun`, `kategori`, `stat`, `create_by`, `create_date`, `update_by`, `update_date`) VALUES
(2, 'judul', 'test', '2022', 'test', 1, '1', '2022-04-03 08:23:34', '1', '2022-04-03 08:23:34');

-- --------------------------------------------------------

--
-- Table structure for table `data_poster`
--

CREATE TABLE `data_poster` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `bulan` varchar(4) DEFAULT NULL,
  `tahun` varchar(8) DEFAULT NULL,
  `status` varchar(4) DEFAULT NULL,
  `create_by` varchar(8) DEFAULT NULL,
  `update_by` varchar(8) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `data_poster`
--

INSERT INTO `data_poster` (`id`, `judul`, `bulan`, `tahun`, `status`, `create_by`, `update_by`, `create_date`, `update_date`) VALUES
(14, 'judul', '1', '2022', '1', '1', '1', '2022-04-03 08:24:10', '2022-04-03 08:24:10'),
(13, 'judul', '1', '2022', '1', '1', '1', '2022-03-31 03:12:57', '2022-03-31 03:49:57');

-- --------------------------------------------------------

--
-- Table structure for table `data_profile`
--

CREATE TABLE `data_profile` (
  `id` int(11) NOT NULL,
  `tusi` longtext,
  `visi` longtext,
  `profile` longtext,
  `alamat` text,
  `stat` int(2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(8) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(8) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `data_profile`
--

INSERT INTO `data_profile` (`id`, `tusi`, `visi`, `profile`, `alamat`, `stat`, `create_date`, `create_by`, `update_date`, `update_by`) VALUES
(3, 'weqweq', 'eqweqwe', 'eqweqwe', 'ewqeqw', NULL, '2022-02-02 15:59:52', '1', '2022-02-02 15:59:52', '1'),
(4, 'weqweq', 'eqweqwe', 'eqweqwe', 'ewqeqw', NULL, '2022-03-28 13:12:08', '1', '2022-03-28 13:12:08', '1'),
(5, 'test', 'test', 'test', 'test', NULL, '2022-03-30 01:43:56', '1', '2022-03-30 01:43:56', '1'),
(6, 'TEST', 'TEST', 'TEST', 'TEST', NULL, '2022-03-30 01:48:52', '1', '2022-03-30 01:48:52', '1');

-- --------------------------------------------------------

--
-- Table structure for table `data_text`
--

CREATE TABLE `data_text` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `tipe` varchar(50) DEFAULT NULL,
  `isi` varchar(255) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `status` int(5) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` datetime DEFAULT NULL,
  `stat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `data_video`
--

CREATE TABLE `data_video` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `sektor` varchar(255) DEFAULT NULL,
  `tahun` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `stat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `data_video`
--

INSERT INTO `data_video` (`id`, `judul`, `sektor`, `tahun`, `info`, `link`, `create_date`, `create_by`, `update_date`, `update_by`, `stat`) VALUES
(1, 'e32423423', '1', '2022', '0', 'https://www.youtube.com/watch?v=0MkBYD8NIKU', '2022-03-04 14:02:20', '1', '2022-03-04 14:02:20', '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kabupaten_kota`
--

CREATE TABLE `kabupaten_kota` (
  `id` int(100) NOT NULL,
  `id_provinsi` int(100) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kabupaten_kota`
--

INSERT INTO `kabupaten_kota` (`id`, `id_provinsi`, `nama`) VALUES
(3201, 32, 'Kabupaten Bogor'),
(3202, 32, 'Kabupaten Sukabumi'),
(3203, 32, 'Kabupaten Cianjur'),
(3204, 32, 'Kabupaten Bandung'),
(3205, 32, 'Kabupaten Garut'),
(3206, 32, 'Kabupaten Tasikmalaya'),
(3207, 32, 'Kabupaten Ciamis'),
(3208, 32, 'Kabupaten Kuningan'),
(3209, 32, 'Kabupaten Cirebon'),
(3210, 32, 'Kabupaten Majalengka'),
(3211, 32, 'Kabupaten Sumedang'),
(3212, 32, 'Kabupaten Indramayu'),
(3213, 32, 'Kabupaten Subang'),
(3214, 32, 'Kabupaten Purwakarta'),
(3215, 32, 'Kabupaten Karawang'),
(3216, 32, 'Kabupaten Bekasi'),
(3217, 32, 'Kabupaten Bandung Barat'),
(3218, 32, 'Kabupaten Pangandaran'),
(3271, 32, 'Kota Bogor'),
(3272, 32, 'Kota Sukabumi'),
(3273, 32, 'Kota Bandung'),
(3274, 32, 'Kota Cirebon'),
(3275, 32, 'Kota Bekasi'),
(3276, 32, 'Kota Depok'),
(3277, 32, 'Kota Cimahi'),
(3278, 32, 'Kota Tasikmalaya'),
(3279, 32, 'Kota Banjar');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_laporan`
--

CREATE TABLE `kategori_laporan` (
  `id` int(5) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `create_by` varchar(50) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_by` varchar(50) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori_laporan`
--

INSERT INTO `kategori_laporan` (`id`, `nama`, `create_by`, `create_date`, `update_by`, `update_date`) VALUES
(1, 'test', '1', '2022-04-03 08:15:32', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kategori_profile`
--

CREATE TABLE `kategori_profile` (
  `id` int(5) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `create_by` varchar(50) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_by` varchar(50) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori_profile`
--

INSERT INTO `kategori_profile` (`id`, `nama`, `create_by`, `create_date`, `update_by`, `update_date`) VALUES
(2, 'Profil Infrastruktur Permukiman\r\n', '1', '2022-04-03 05:56:47', NULL, NULL),
(3, 'test', '1', '2022-04-03 06:25:42', NULL, NULL),
(4, 'popoperserqweqwe', '1', '2022-04-03 06:28:23', '1', '2022-04-03 07:51:25'),
(6, 'tewstas', '1', '2022-04-03 08:12:11', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kota`
--

CREATE TABLE `kota` (
  `id` int(11) NOT NULL,
  `name` varchar(24) DEFAULT NULL,
  `desc` varchar(24) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kota`
--

INSERT INTO `kota` (`id`, `name`, `desc`) VALUES
(1, 'Kabupaten_Bandung', 'Kabupaten Bandung'),
(2, 'Kabupaten_Bandung_Barat', 'Kabupaten Bandung Barat'),
(3, 'Kabupaten_Bekasi', 'Kabupaten Bekasi'),
(4, 'Kabupaten_Bogor', 'Kabupaten Bogor'),
(5, 'Kabupaten_Ciamis', 'Kabupaten Ciamis'),
(6, 'Kabupaten_Cianjur', 'Kabupaten Cianjur'),
(7, 'Kabupaten_Cirebon', 'Kabupaten Cirebon'),
(8, 'Kabupaten_Garut', 'Kabupaten Garut'),
(9, 'Kabupaten_Indramayu', 'Kabupaten Indramayu'),
(10, 'Kabupaten_Karawang', 'Kabupaten Karawang'),
(11, 'Kabupaten_Kuningan', 'Kabupaten Kuningan'),
(12, 'Kabupaten_Majalengka', 'Kabupaten Majalengka'),
(13, 'Kabupaten_Pangandaran', 'Kabupaten Pangandaran'),
(14, 'Kabupaten_Purwakarta', 'Kabupaten Purwakarta'),
(15, 'Kabupaten_Subang', 'Kabupaten Subang'),
(16, 'Kabupaten_Sukabumi', 'Kabupaten Sukabumi'),
(17, 'Kabupaten_Sumedang', 'Kabupaten Sumedang'),
(18, 'Kabupaten_Tasikmalaya', 'Kabupaten Tasikmalaya'),
(19, 'Kota_Bandung', 'Kota Bandung'),
(20, 'Kota_Banjar', 'Kota Banjar'),
(21, 'Kota_Bekasi', 'Kota Bekasi'),
(22, 'Kota_Bogor', 'Kota Bogor'),
(23, 'Kota_Cimahi', 'Kota Cimahi'),
(24, 'Kota_Cirebon', 'Kota Cirebon'),
(25, 'Kota_Depok', 'Kota Depok'),
(26, 'Kota_Sukabumi', 'Kota Sukabumi'),
(27, 'Kota_Tasikmalaya', 'Kota Tasikmalaya');

-- --------------------------------------------------------

--
-- Table structure for table `muser`
--

CREATE TABLE `muser` (
  `id` int(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` varchar(30) DEFAULT NULL,
  `role` int(16) DEFAULT NULL,
  `islogin` int(1) DEFAULT NULL,
  `status` int(5) DEFAULT NULL COMMENT '0 = nonactive, 1= active,',
  `name` varchar(24) DEFAULT NULL,
  `no_telp` varchar(16) DEFAULT NULL,
  `email` varchar(16) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `satker` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `muser`
--

INSERT INTO `muser` (`id`, `username`, `password`, `created_by`, `updated_by`, `created_at`, `updated_at`, `role`, `islogin`, `status`, `name`, `no_telp`, `email`, `img`, `satker`) VALUES
(1, 'admin', '827ccb0eea8a706c4c34a16891f84e7b', NULL, NULL, NULL, NULL, 10, 0, 1, 'admin', NULL, NULL, 'assets/dokumen/gambar/user/default.jpg.', NULL),
(44, '452780', '1a97768dc9dffc384357957de04045f6', 'admin', NULL, '2022-03-24 08:46:50', NULL, 20, 0, 1, '452780', NULL, NULL, NULL, '452780'),
(41, '420138', 'db72353c6d6ed20192d08b36e11124fb', 'admin', NULL, '2022-03-24 08:46:09', NULL, 20, 0, 1, '420138', NULL, NULL, NULL, '420138'),
(42, '420139', 'd83cccccc3b1a614f801dfc6df0fe61b', 'admin', NULL, '2022-03-24 08:46:24', NULL, 20, 0, 1, '420139', NULL, NULL, NULL, '420139'),
(43, '452771', '0f458c6043fa93e095ce90d576c4d745', 'admin', NULL, '2022-03-24 08:46:40', NULL, 20, 0, 1, '452771', NULL, NULL, NULL, '452771'),
(45, '466162', '20868a93ff2080784ec7732ed378da99', 'admin', NULL, '2022-03-24 08:48:13', NULL, 20, 0, 1, '466162', NULL, NULL, NULL, '466162'),
(46, '466178', 'de969da78edd72fcc0616f18147e46f6', 'admin', NULL, '2022-03-24 08:48:20', NULL, 20, 0, 1, '466178', NULL, NULL, NULL, '466178'),
(47, '466190', '8b60cba4851f0adbfe4853d8d77e279a', 'admin', NULL, '2022-03-24 08:49:03', NULL, 20, 0, 1, '466190', NULL, NULL, NULL, '466190'),
(48, '622213', '9a995cb1a0e4ff3730b8fd35af24d318', 'admin', NULL, '2022-03-24 08:49:12', NULL, 20, 0, 1, '622213', NULL, NULL, NULL, '622213'),
(49, '631097', '8c75a156e60cf41bf6cb2f84d0f93149', 'admin', NULL, '2022-03-24 08:49:21', NULL, 20, 0, 1, '631097', NULL, NULL, NULL, '631097'),
(50, '400740', '899cd80169c7dc22fff620efd8b12960', 'admin', NULL, '2022-03-24 08:56:48', NULL, 30, 0, 1, '400740', NULL, NULL, NULL, '400740'),
(51, '493183', '35f1d466237b91d5e2e20011401ee423', 'admin', NULL, '2022-03-24 08:56:57', NULL, 30, 0, 1, '493183', NULL, NULL, NULL, '493183'),
(52, '505096', '21cc5e95c4180e118117b17c9ac15ee4', 'admin', NULL, '2022-03-24 08:57:04', NULL, 30, 0, 1, '505096', NULL, NULL, NULL, '505096'),
(53, '505097', 'ec3c148b5de63edd5b702446934741c7', 'admin', NULL, '2022-03-24 08:57:10', NULL, 30, 0, 1, '505097', NULL, NULL, NULL, '505097'),
(54, '505099', 'ebef1261139a43313e6227ea19896211', 'admin', NULL, '2022-03-24 08:57:33', NULL, 30, 0, 1, '505099', NULL, NULL, NULL, '505099'),
(55, '505100', '106dc1efe6aa5b77ea4bb6290160a462', 'admin', NULL, '2022-03-24 08:57:38', NULL, 30, 0, 1, '505100', NULL, NULL, NULL, '505100'),
(56, '505101', 'b14bce9b162024d0236432ea27b5de01', 'admin', NULL, '2022-03-24 08:57:44', NULL, 30, 0, 1, '505101', NULL, NULL, NULL, '505101'),
(57, '505102', '1dd36cdfc60c5637a1fd26ff740d6774', 'admin', NULL, '2022-03-24 08:57:49', NULL, 30, 0, 1, '505102', NULL, NULL, NULL, '505102'),
(58, '505103', '90ba473e877df087e9ab08e01b459b0b', 'admin', NULL, '2022-03-24 08:57:55', NULL, 30, 0, 1, '505103', NULL, NULL, NULL, '505103'),
(59, '505104', '3aca76ad9fdc4d3f6bcd6e63113281d1', 'admin', NULL, '2022-03-24 08:58:01', NULL, 30, 0, 1, '505104', NULL, NULL, NULL, '505104'),
(60, '505105', '7b2aea9e975a2517f14543d0b241378a', 'admin', NULL, '2022-03-24 08:58:06', NULL, 30, 0, 1, '505105', NULL, NULL, NULL, '505105'),
(61, '505106', 'acf9f4d4bc5c5c1ecc8a49a8f75dc612', 'admin', NULL, '2022-03-24 08:58:13', NULL, 30, 0, 1, '505106', NULL, NULL, NULL, '505106'),
(62, '505107', '04e287a314e42f7bb6b4ecfaa9747d95', 'admin', NULL, '2022-03-24 08:58:18', NULL, 30, 0, 1, '505107', NULL, NULL, NULL, '505107'),
(63, '505108', 'b08caed0f67f5669d6e2de084481544a', 'admin', NULL, '2022-03-24 08:58:26', NULL, 30, 0, 1, '505108', NULL, NULL, NULL, '505108'),
(64, '505110', '76675d14c0e78df64a32b9ddc5875eb6', 'admin', NULL, '2022-03-24 08:58:31', NULL, 30, 0, 1, '505110', NULL, NULL, NULL, '505110'),
(65, '505730', 'b7953ebcd6f59ee3a65de2967e69390b', 'admin', NULL, '2022-03-24 08:58:36', NULL, 30, 0, 1, '505730', NULL, NULL, NULL, '505730'),
(66, '505749', '7449d44db0cbff83a965cf083f389f1e', 'admin', NULL, '2022-03-24 08:59:59', NULL, 30, 0, 1, '505749', NULL, NULL, NULL, '505749'),
(67, '505755', 'a27ebf8411363b30e03e391ab22d6a50', 'admin', NULL, '2022-03-24 09:00:08', NULL, 30, 0, 1, '505755', NULL, NULL, NULL, '505755'),
(68, '505770', '2101fb39f208742244eb475449b7b9d1', 'admin', NULL, '2022-03-24 09:00:14', NULL, 30, 0, 1, '505770', NULL, NULL, NULL, '505770'),
(69, '505786', '4fb801b4994e91f9d78b6badaeef99aa', 'admin', NULL, '2022-03-24 09:00:19', NULL, 30, 0, 1, '505786', NULL, NULL, NULL, '505786'),
(70, '505821', '4c12dd4f838a9dcbd7a2fb5e422398a6', 'admin', NULL, '2022-03-24 09:00:25', NULL, 30, 0, 1, '505821', NULL, NULL, NULL, '505821'),
(71, '505837', 'eeb006066e392d325b220051835b254a', 'admin', NULL, '2022-03-24 09:00:30', NULL, 30, 0, 1, '505837', NULL, NULL, NULL, '505837'),
(72, '505840', '65930bb2613673fada03edbe922c6852', 'admin', NULL, '2022-03-24 09:00:35', NULL, 30, 0, 1, '505840', NULL, NULL, NULL, '505840'),
(73, '505843', '0113fac2d29cee31bf2a0f5dfd3959a3', 'admin', NULL, '2022-03-24 09:00:40', NULL, 30, 0, 1, '505843', NULL, NULL, NULL, '505843'),
(74, '505868', 'f31e88217a21e4f851aae65fb1ae0fdd', 'admin', NULL, '2022-03-24 09:00:45', NULL, 30, 0, 1, '505868', NULL, NULL, NULL, '505868'),
(75, '505874', '7810ccf71def43e6789c2745066e4897', 'admin', NULL, '2022-03-24 09:00:50', NULL, 30, 0, 1, '505874', NULL, NULL, NULL, '505874'),
(76, '505880', '3fe1dca8fcabf93cf60b24d9ce6ef6c2', 'admin', NULL, '2022-03-24 09:00:55', NULL, 30, 0, 1, '505880', NULL, NULL, NULL, '505880'),
(77, '505899', '51cc37811aed827d723885188669ce77', 'admin', NULL, '2022-03-24 09:01:00', NULL, 30, 0, 1, '505899', NULL, NULL, NULL, '505899'),
(78, '505900', '0ad084da7fc8ab46464f9fe759926e21', 'admin', NULL, '2022-03-24 09:01:05', NULL, 30, 0, 1, '505900', NULL, NULL, NULL, '505900'),
(79, '505931', '6d0ecd8b737d88dde2e6a604942abf47', 'admin', NULL, '2022-03-24 09:01:11', NULL, 30, 0, 1, '505931', NULL, NULL, NULL, '505931'),
(80, '505940', 'ee49c938fab69250c111b1454061865c', 'admin', NULL, '2022-03-24 09:01:17', NULL, 30, 0, 1, '505940', NULL, NULL, NULL, '505940'),
(81, '505993', '3b6620ecd3bf5900f5935985a2a434b6', 'admin', NULL, '2022-03-24 09:01:22', NULL, 30, 0, 1, '505993', NULL, NULL, NULL, '505993'),
(82, '506022', 'ff51d8608215e291cb1a07f988f110e4', 'admin', NULL, '2022-03-24 09:01:27', NULL, 30, 0, 1, '506022', NULL, NULL, NULL, '506022'),
(83, '506038', '8398b9df1caef79d900f89e3393d3db9', 'admin', NULL, '2022-03-24 09:01:32', NULL, 30, 0, 1, '506038', NULL, NULL, NULL, '506038');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id_role` int(16) NOT NULL,
  `role_name` varchar(32) DEFAULT NULL,
  `role_desc` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id_role`, `role_name`, `role_desc`) VALUES
(10, 'admin', 'Superadmin'),
(20, 'direktorat', 'Direktorat'),
(30, 'balai', 'Balai');

-- --------------------------------------------------------

--
-- Table structure for table `satker`
--

CREATE TABLE `satker` (
  `id` int(11) NOT NULL,
  `kode_satker` varchar(12) DEFAULT NULL,
  `role` varchar(4) DEFAULT NULL,
  `nama_satker` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `satker`
--

INSERT INTO `satker` (`id`, `kode_satker`, `role`, `nama_satker`) VALUES
(1, '420138', '20', 'DIREKTORAT BINA TEKNIK PERMUKIMAN DAN PERUMAHAN'),
(2, '420139', '20', 'DIREKTORAT KEPATUHAN INTERN'),
(3, '452771', '20', 'DIREKTORAT PENGEMBANGAN KAWASAN PERMUKIMAN'),
(4, '452780', '20', 'DIREKTORAT BINA PENATAAN BANGUNAN'),
(5, '466162', '20', 'DIREKTORAT KETERPADUAN INFRASTRUKTUR PERMUKIMAN'),
(6, '466178', '20', 'DIREKTORAT AIR MINUM'),
(7, '466190', '20', 'DIREKTORAT SANITASI'),
(8, '622213', '20', 'SEKRETARIAT DIREKTORAT JENDERAL CIPTA KARYA'),
(9, '631097', '20', 'PUSAT PENGEMBANGAN SARANA PRASARANA PENDIDIKAN, OLAHRAGA DAN PASAR'),
(10, '400740', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH KALIMANTAN UTARA'),
(11, '493183', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH JAKARTA METROPOLITAN'),
(12, '505096', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH RIAU'),
(13, '505097', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH KEPULAUAN RIAU'),
(14, '505099', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH BENGKULU'),
(15, '505100', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH KEPULAUAN BANGKA BELITUNG'),
(16, '505101', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH DI YOGYAKARTA'),
(17, '505102', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH SULAWESI UTARA'),
(18, '505103', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH GORONTALO'),
(19, '505104', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH SULAWESI BARAT'),
(20, '505105', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH SULAWESI TENGGARA'),
(21, '505106', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH BALI'),
(22, '505107', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH NUSA TENGGARA BARAT'),
(23, '505108', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH MALUKU'),
(24, '505110', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH MALUKU UTARA'),
(25, '505730', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH ACEH'),
(26, '505749', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH SUMATERA UTARA'),
(27, '505755', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH SUMATERA BARAT'),
(28, '505770', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH JAMBI'),
(29, '505786', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH SUMATERA SELATAN'),
(30, '505821', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH LAMPUNG'),
(31, '505837', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH JAWA BARAT'),
(32, '505840', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH BANTEN'),
(33, '505843', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH JAWA TENGAH'),
(34, '505868', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH JAWA TIMUR'),
(35, '505874', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH KALIMANTAN BARAT'),
(36, '505880', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH KALIMANTAN TENGAH'),
(37, '505899', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH KALIMANTAN SELATAN'),
(38, '505900', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH KALIMANTAN TIMUR'),
(39, '505931', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH SULAWESI TENGAH'),
(40, '505940', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH SULAWESI SELATAN'),
(41, '505993', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH NUSA TENGGARA TIMUR'),
(42, '506022', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH PAPUA'),
(43, '506038', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH PAPUA BARAT');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `data_agenda`
--
ALTER TABLE `data_agenda`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_balai`
--
ALTER TABLE `data_balai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_banner`
--
ALTER TABLE `data_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_berita`
--
ALTER TABLE `data_berita`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `data_buku_profil`
--
ALTER TABLE `data_buku_profil`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_file`
--
ALTER TABLE `data_file`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `data_foto`
--
ALTER TABLE `data_foto`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `data_grafis`
--
ALTER TABLE `data_grafis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_laporan`
--
ALTER TABLE `data_laporan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_poster`
--
ALTER TABLE `data_poster`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `data_profile`
--
ALTER TABLE `data_profile`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `data_text`
--
ALTER TABLE `data_text`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `data_video`
--
ALTER TABLE `data_video`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `kategori_laporan`
--
ALTER TABLE `kategori_laporan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_profile`
--
ALTER TABLE `kategori_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kota`
--
ALTER TABLE `kota`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `muser`
--
ALTER TABLE `muser`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`) USING BTREE;

--
-- Indexes for table `satker`
--
ALTER TABLE `satker`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_agenda`
--
ALTER TABLE `data_agenda`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_balai`
--
ALTER TABLE `data_balai`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `data_banner`
--
ALTER TABLE `data_banner`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `data_berita`
--
ALTER TABLE `data_berita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `data_buku_profil`
--
ALTER TABLE `data_buku_profil`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_file`
--
ALTER TABLE `data_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `data_foto`
--
ALTER TABLE `data_foto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `data_grafis`
--
ALTER TABLE `data_grafis`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_laporan`
--
ALTER TABLE `data_laporan`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_poster`
--
ALTER TABLE `data_poster`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `data_profile`
--
ALTER TABLE `data_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `data_text`
--
ALTER TABLE `data_text`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_video`
--
ALTER TABLE `data_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kategori_laporan`
--
ALTER TABLE `kategori_laporan`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kategori_profile`
--
ALTER TABLE `kategori_profile`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kota`
--
ALTER TABLE `kota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `muser`
--
ALTER TABLE `muser`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `satker`
--
ALTER TABLE `satker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
