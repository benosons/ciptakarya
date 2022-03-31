/*
 Navicat Premium Data Transfer

 Source Server         : MYSQL-LOCAL
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : ciptakarya_v2

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 31/03/2022 23:36:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for berita
-- ----------------------------
DROP TABLE IF EXISTS `berita`;
CREATE TABLE `berita`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `intro` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tag` varchar(24) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `isi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `gambar` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `caption` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal` datetime NULL DEFAULT NULL,
  `bag` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `stat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `idfile` int(5) NOT NULL,
  `create_date` datetime NULL DEFAULT NULL,
  `create_by` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT NULL,
  `update_by` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of berita
-- ----------------------------

-- ----------------------------
-- Table structure for data_agenda
-- ----------------------------
DROP TABLE IF EXISTS `data_agenda`;
CREATE TABLE `data_agenda`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `deskripsi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` date NOT NULL,
  `status` int(11) NOT NULL,
  `create_at` datetime NOT NULL,
  `create_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `update_at` datetime NOT NULL,
  `update_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_agenda
-- ----------------------------
INSERT INTO `data_agenda` VALUES (2, '<p>testing</p>', '2022-04-09', 1, '2022-03-31 20:37:29', '1', '0000-00-00 00:00:00', '1');

-- ----------------------------
-- Table structure for data_balai
-- ----------------------------
DROP TABLE IF EXISTS `data_balai`;
CREATE TABLE `data_balai`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `kategori` int(5) NOT NULL,
  `linkgeo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jml_pns` int(50) NOT NULL,
  `jml_nonpns` int(50) NOT NULL,
  `aset_terimakan` int(50) NOT NULL,
  `aset_proses` int(50) NOT NULL,
  `hu` int(50) NOT NULL,
  `mta` int(50) NOT NULL,
  `toilet` int(50) NOT NULL,
  `jml_orang` int(50) NOT NULL,
  `create_at` datetime NOT NULL,
  `create_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_balai
-- ----------------------------
INSERT INTO `data_balai` VALUES (1, 1, '-', 1, 1, 1, 1, 1, 1, 0, 1, '2022-03-30 03:15:31', '1');
INSERT INTO `data_balai` VALUES (2, 3, '-', 1, 1, 1, 1, 1, 1, 0, 1, '2022-03-30 03:17:13', '1');
INSERT INTO `data_balai` VALUES (3, 3, '-', 1, 1, 1, 1, 1, 1, 1, 1, '2022-03-30 03:20:24', '1');

-- ----------------------------
-- Table structure for data_banner
-- ----------------------------
DROP TABLE IF EXISTS `data_banner`;
CREATE TABLE `data_banner`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `judul` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tipe` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` int(5) NOT NULL,
  `create_at` datetime NOT NULL,
  `create_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `update_at` datetime NULL DEFAULT NULL,
  `update_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_banner
-- ----------------------------
INSERT INTO `data_banner` VALUES (4, 'judul', 'halaman', 'test', 0, '2022-03-31 06:43:21', '1', NULL, NULL);

-- ----------------------------
-- Table structure for data_berita
-- ----------------------------
DROP TABLE IF EXISTS `data_berita`;
CREATE TABLE `data_berita`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `intro` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tag` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `isi` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `bagian` int(4) NULL DEFAULT NULL,
  `date` varchar(24) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `stat` int(2) NULL DEFAULT NULL,
  `idfile` int(5) NOT NULL,
  `create_date` datetime NULL DEFAULT NULL,
  `create_by` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT NULL,
  `update_by` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of data_berita
-- ----------------------------
INSERT INTO `data_berita` VALUES (12, 'TESTed', 'TEST', 'TEST', '<p>TEST</p>', 2, '03/29/2022', 0, 0, '2022-03-29 04:04:20', '1', '2022-03-31 03:52:12', '1');

-- ----------------------------
-- Table structure for data_file
-- ----------------------------
DROP TABLE IF EXISTS `data_file`;
CREATE TABLE `data_file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_parent` int(64) NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `path` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `size` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `extension` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `filename` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `caption` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_date` datetime NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 40 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of data_file
-- ----------------------------
INSERT INTO `data_file` VALUES (25, 11, 'berita', './assets/upload/berita/2022/03/14', '7460340', 'image/jpeg', 'days gone 17 ready.jpg', NULL, '2022-03-14 15:02:57', '2022-03-14 16:05:18');
INSERT INTO `data_file` VALUES (35, 2, 'poster', './assets/upload/galeri/banner/2022/03/31', '42105', 'image/jpeg', 'profile-card.jpg', NULL, '2022-03-31 06:34:41', '2022-03-31 06:34:41');
INSERT INTO `data_file` VALUES (9, 7, 'poster', './assets/upload/galeri/poster/2022/02/01', '63974', 'image/jpeg', '1146175_571239072961877_52607445_o.jpg', 'sip lah', '2022-02-01 13:51:17', '2022-02-01 13:51:17');
INSERT INTO `data_file` VALUES (31, 5, 'profile', './assets/upload/profile/2022/03/30', '55484', 'image/jpeg', 'example1.jpeg', NULL, '2022-03-30 01:43:56', '2022-03-30 01:43:56');
INSERT INTO `data_file` VALUES (13, 3, 'profile', './assets/upload/profile/2022/02/02', '60712', 'image/jpeg', '1498852_571238729628578_1690165841_o.jpg', NULL, '2022-02-02 15:59:52', '2022-02-02 15:59:52');
INSERT INTO `data_file` VALUES (34, 1, 'poster', './assets/upload/galeri/banner/2022/03/31', '42105', 'image/jpeg', 'profile-card.jpg', NULL, '2022-03-31 06:30:15', '2022-03-31 06:30:15');
INSERT INTO `data_file` VALUES (21, 6, 'berita', './assets/upload/berita/2022/03/14', '110946', 'image/jpeg', 'WhatsApp Image 2022-03-02 at 9.44.13 AM.jpeg', '', '2022-03-14 13:22:06', '2022-03-14 13:22:06');
INSERT INTO `data_file` VALUES (16, 2, 'berita', './assets/upload/berita/2022/03/04', '7460340', 'image/jpeg', 'days gone 17 ready.jpg', 'gbr 2', '2022-03-04 12:43:51', '2022-03-04 12:43:51');
INSERT INTO `data_file` VALUES (27, 9, 'foto', './assets/upload/galeri/foto/2022/03/14', '7460340', 'image/jpeg', 'days gone 17 ready.jpg', 'testing', '2022-03-14 17:24:45', '2022-03-14 17:24:45');
INSERT INTO `data_file` VALUES (30, 12, 'berita', './assets/upload/berita/2022/03/29', '101969', 'image/jpeg', 'thumb-v-y-2.jpg', 'TEST', '2022-03-29 04:04:20', '2022-03-29 04:05:44');
INSERT INTO `data_file` VALUES (29, 4, 'profile', './assets/upload/profile/2022/03/28', '79637', 'image/jpeg', 'thumb-v-y-1.jpg', NULL, '2022-03-28 13:12:08', '2022-03-28 13:12:08');
INSERT INTO `data_file` VALUES (32, 6, 'profile', './assets/upload/profile/2022/03/30', '55484', 'image/jpeg', 'example1.jpeg', NULL, '2022-03-30 01:48:52', '2022-03-30 01:48:52');
INSERT INTO `data_file` VALUES (33, 13, 'poster', './assets/upload/galeri/poster/2022/03/31', '36688', 'image/jpeg', '1.jpg', NULL, '2022-03-31 03:12:57', '2022-03-31 03:13:26');
INSERT INTO `data_file` VALUES (37, 4, 'banner', './assets/upload/galeri/banner/2022/03/31', '83825', 'image/jpeg', 'img_2.jpg', NULL, '2022-03-31 06:43:21', '2022-03-31 07:25:09');
INSERT INTO `data_file` VALUES (38, 2, 'infografis', './assets/upload/galeri/infografis/2022/03/31', '11293', 'image/png', 'darkBG.png', NULL, '2022-03-31 19:45:38', '2022-03-31 19:45:38');
INSERT INTO `data_file` VALUES (39, 6, 'text', './assets/upload/file/text/2022/03/31', '107424', 'application/pdf', 'dummy_file.pdf', NULL, '2022-03-31 22:46:59', '2022-03-31 22:46:59');

-- ----------------------------
-- Table structure for data_foto
-- ----------------------------
DROP TABLE IF EXISTS `data_foto`;
CREATE TABLE `data_foto`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Sektor` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tahun` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `create_by` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `update_by` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `create_date` datetime NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of data_foto
-- ----------------------------
INSERT INTO `data_foto` VALUES (9, 'test', '1', '2022', 'on', '1', '1', '2022-03-14 17:24:45', '2022-03-14 17:24:45');

-- ----------------------------
-- Table structure for data_grafis
-- ----------------------------
DROP TABLE IF EXISTS `data_grafis`;
CREATE TABLE `data_grafis`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tahun` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` int(5) NOT NULL,
  `create_at` datetime NOT NULL,
  `create_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `update_at` datetime NOT NULL,
  `update_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_grafis
-- ----------------------------
INSERT INTO `data_grafis` VALUES (2, 'judulpoi', '2022', 0, '2022-03-31 19:45:38', '1', '0000-00-00 00:00:00', '');

-- ----------------------------
-- Table structure for data_poster
-- ----------------------------
DROP TABLE IF EXISTS `data_poster`;
CREATE TABLE `data_poster`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bulan` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tahun` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `create_by` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `update_by` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `create_date` datetime NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of data_poster
-- ----------------------------
INSERT INTO `data_poster` VALUES (13, 'judul', '1', '2022', '1', '1', '1', '2022-03-31 03:12:57', '2022-03-31 03:49:57');

-- ----------------------------
-- Table structure for data_profile
-- ----------------------------
DROP TABLE IF EXISTS `data_profile`;
CREATE TABLE `data_profile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tusi` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `visi` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `profile` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `alamat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `stat` int(2) NULL DEFAULT NULL,
  `create_date` datetime NULL DEFAULT NULL,
  `create_by` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT NULL,
  `update_by` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of data_profile
-- ----------------------------
INSERT INTO `data_profile` VALUES (3, 'weqweq', 'eqweqwe', 'eqweqwe', 'ewqeqw', NULL, '2022-02-02 15:59:52', '1', '2022-02-02 15:59:52', '1');
INSERT INTO `data_profile` VALUES (4, 'weqweq', 'eqweqwe', 'eqweqwe', 'ewqeqw', NULL, '2022-03-28 13:12:08', '1', '2022-03-28 13:12:08', '1');
INSERT INTO `data_profile` VALUES (5, 'test', 'test', 'test', 'test', NULL, '2022-03-30 01:43:56', '1', '2022-03-30 01:43:56', '1');
INSERT INTO `data_profile` VALUES (6, 'TEST', 'TEST', 'TEST', 'TEST', NULL, '2022-03-30 01:48:52', '1', '2022-03-30 01:48:52', '1');

-- ----------------------------
-- Table structure for data_text
-- ----------------------------
DROP TABLE IF EXISTS `data_text`;
CREATE TABLE `data_text`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tipe` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `isi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `date` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` int(5) NOT NULL,
  `create_date` datetime NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT NULL,
  `update_by` datetime NULL DEFAULT NULL,
  `stat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of data_text
-- ----------------------------
INSERT INTO `data_text` VALUES (6, 'judulannn', 'halaman', '-', '03/31/2022 - 04/23/2022', 1, '2022-03-31 22:46:59', '1', '2022-03-31 11:09:37', '0000-00-00 00:00:00', NULL);

-- ----------------------------
-- Table structure for data_video
-- ----------------------------
DROP TABLE IF EXISTS `data_video`;
CREATE TABLE `data_video`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sektor` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tahun` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `info` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `link` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `create_date` datetime NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `stat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of data_video
-- ----------------------------
INSERT INTO `data_video` VALUES (1, 'e32423423', '1', '2022', '0', 'https://www.youtube.com/watch?v=0MkBYD8NIKU', '2022-03-04 14:02:20', '1', '2022-03-04 14:02:20', '1', NULL);

-- ----------------------------
-- Table structure for kabupaten_kota
-- ----------------------------
DROP TABLE IF EXISTS `kabupaten_kota`;
CREATE TABLE `kabupaten_kota`  (
  `id` int(100) NOT NULL,
  `id_provinsi` int(100) NOT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of kabupaten_kota
-- ----------------------------
INSERT INTO `kabupaten_kota` VALUES (3201, 32, 'Kabupaten Bogor');
INSERT INTO `kabupaten_kota` VALUES (3202, 32, 'Kabupaten Sukabumi');
INSERT INTO `kabupaten_kota` VALUES (3203, 32, 'Kabupaten Cianjur');
INSERT INTO `kabupaten_kota` VALUES (3204, 32, 'Kabupaten Bandung');
INSERT INTO `kabupaten_kota` VALUES (3205, 32, 'Kabupaten Garut');
INSERT INTO `kabupaten_kota` VALUES (3206, 32, 'Kabupaten Tasikmalaya');
INSERT INTO `kabupaten_kota` VALUES (3207, 32, 'Kabupaten Ciamis');
INSERT INTO `kabupaten_kota` VALUES (3208, 32, 'Kabupaten Kuningan');
INSERT INTO `kabupaten_kota` VALUES (3209, 32, 'Kabupaten Cirebon');
INSERT INTO `kabupaten_kota` VALUES (3210, 32, 'Kabupaten Majalengka');
INSERT INTO `kabupaten_kota` VALUES (3211, 32, 'Kabupaten Sumedang');
INSERT INTO `kabupaten_kota` VALUES (3212, 32, 'Kabupaten Indramayu');
INSERT INTO `kabupaten_kota` VALUES (3213, 32, 'Kabupaten Subang');
INSERT INTO `kabupaten_kota` VALUES (3214, 32, 'Kabupaten Purwakarta');
INSERT INTO `kabupaten_kota` VALUES (3215, 32, 'Kabupaten Karawang');
INSERT INTO `kabupaten_kota` VALUES (3216, 32, 'Kabupaten Bekasi');
INSERT INTO `kabupaten_kota` VALUES (3217, 32, 'Kabupaten Bandung Barat');
INSERT INTO `kabupaten_kota` VALUES (3218, 32, 'Kabupaten Pangandaran');
INSERT INTO `kabupaten_kota` VALUES (3271, 32, 'Kota Bogor');
INSERT INTO `kabupaten_kota` VALUES (3272, 32, 'Kota Sukabumi');
INSERT INTO `kabupaten_kota` VALUES (3273, 32, 'Kota Bandung');
INSERT INTO `kabupaten_kota` VALUES (3274, 32, 'Kota Cirebon');
INSERT INTO `kabupaten_kota` VALUES (3275, 32, 'Kota Bekasi');
INSERT INTO `kabupaten_kota` VALUES (3276, 32, 'Kota Depok');
INSERT INTO `kabupaten_kota` VALUES (3277, 32, 'Kota Cimahi');
INSERT INTO `kabupaten_kota` VALUES (3278, 32, 'Kota Tasikmalaya');
INSERT INTO `kabupaten_kota` VALUES (3279, 32, 'Kota Banjar');

-- ----------------------------
-- Table structure for kota
-- ----------------------------
DROP TABLE IF EXISTS `kota`;
CREATE TABLE `kota`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(24) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `desc` varchar(24) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 28 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of kota
-- ----------------------------
INSERT INTO `kota` VALUES (1, 'Kabupaten_Bandung', 'Kabupaten Bandung');
INSERT INTO `kota` VALUES (2, 'Kabupaten_Bandung_Barat', 'Kabupaten Bandung Barat');
INSERT INTO `kota` VALUES (3, 'Kabupaten_Bekasi', 'Kabupaten Bekasi');
INSERT INTO `kota` VALUES (4, 'Kabupaten_Bogor', 'Kabupaten Bogor');
INSERT INTO `kota` VALUES (5, 'Kabupaten_Ciamis', 'Kabupaten Ciamis');
INSERT INTO `kota` VALUES (6, 'Kabupaten_Cianjur', 'Kabupaten Cianjur');
INSERT INTO `kota` VALUES (7, 'Kabupaten_Cirebon', 'Kabupaten Cirebon');
INSERT INTO `kota` VALUES (8, 'Kabupaten_Garut', 'Kabupaten Garut');
INSERT INTO `kota` VALUES (9, 'Kabupaten_Indramayu', 'Kabupaten Indramayu');
INSERT INTO `kota` VALUES (10, 'Kabupaten_Karawang', 'Kabupaten Karawang');
INSERT INTO `kota` VALUES (11, 'Kabupaten_Kuningan', 'Kabupaten Kuningan');
INSERT INTO `kota` VALUES (12, 'Kabupaten_Majalengka', 'Kabupaten Majalengka');
INSERT INTO `kota` VALUES (13, 'Kabupaten_Pangandaran', 'Kabupaten Pangandaran');
INSERT INTO `kota` VALUES (14, 'Kabupaten_Purwakarta', 'Kabupaten Purwakarta');
INSERT INTO `kota` VALUES (15, 'Kabupaten_Subang', 'Kabupaten Subang');
INSERT INTO `kota` VALUES (16, 'Kabupaten_Sukabumi', 'Kabupaten Sukabumi');
INSERT INTO `kota` VALUES (17, 'Kabupaten_Sumedang', 'Kabupaten Sumedang');
INSERT INTO `kota` VALUES (18, 'Kabupaten_Tasikmalaya', 'Kabupaten Tasikmalaya');
INSERT INTO `kota` VALUES (19, 'Kota_Bandung', 'Kota Bandung');
INSERT INTO `kota` VALUES (20, 'Kota_Banjar', 'Kota Banjar');
INSERT INTO `kota` VALUES (21, 'Kota_Bekasi', 'Kota Bekasi');
INSERT INTO `kota` VALUES (22, 'Kota_Bogor', 'Kota Bogor');
INSERT INTO `kota` VALUES (23, 'Kota_Cimahi', 'Kota Cimahi');
INSERT INTO `kota` VALUES (24, 'Kota_Cirebon', 'Kota Cirebon');
INSERT INTO `kota` VALUES (25, 'Kota_Depok', 'Kota Depok');
INSERT INTO `kota` VALUES (26, 'Kota_Sukabumi', 'Kota Sukabumi');
INSERT INTO `kota` VALUES (27, 'Kota_Tasikmalaya', 'Kota Tasikmalaya');

-- ----------------------------
-- Table structure for muser
-- ----------------------------
DROP TABLE IF EXISTS `muser`;
CREATE TABLE `muser`  (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `updated_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `role` int(16) NULL DEFAULT NULL,
  `islogin` int(1) NULL DEFAULT NULL,
  `status` int(5) NULL DEFAULT NULL COMMENT '0 = nonactive, 1= active,',
  `name` varchar(24) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_telp` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `img` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `satker` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 85 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of muser
-- ----------------------------
INSERT INTO `muser` VALUES (1, 'admin', '827ccb0eea8a706c4c34a16891f84e7b', NULL, NULL, NULL, NULL, 10, 1, 1, 'admin', NULL, NULL, 'assets/dokumen/gambar/user/default.jpg.', NULL);
INSERT INTO `muser` VALUES (44, '452780', '1a97768dc9dffc384357957de04045f6', 'admin', NULL, '2022-03-24 15:46:50', NULL, 20, 0, 1, '452780', NULL, NULL, NULL, '452780');
INSERT INTO `muser` VALUES (41, '420138', 'db72353c6d6ed20192d08b36e11124fb', 'admin', NULL, '2022-03-24 15:46:09', NULL, 20, 0, 1, '420138', NULL, NULL, NULL, '420138');
INSERT INTO `muser` VALUES (42, '420139', 'd83cccccc3b1a614f801dfc6df0fe61b', 'admin', NULL, '2022-03-24 15:46:24', NULL, 20, 0, 1, '420139', NULL, NULL, NULL, '420139');
INSERT INTO `muser` VALUES (43, '452771', '0f458c6043fa93e095ce90d576c4d745', 'admin', NULL, '2022-03-24 15:46:40', NULL, 20, 0, 1, '452771', NULL, NULL, NULL, '452771');
INSERT INTO `muser` VALUES (45, '466162', '20868a93ff2080784ec7732ed378da99', 'admin', NULL, '2022-03-24 15:48:13', NULL, 20, 0, 1, '466162', NULL, NULL, NULL, '466162');
INSERT INTO `muser` VALUES (46, '466178', 'de969da78edd72fcc0616f18147e46f6', 'admin', NULL, '2022-03-24 15:48:20', NULL, 20, 0, 1, '466178', NULL, NULL, NULL, '466178');
INSERT INTO `muser` VALUES (47, '466190', '8b60cba4851f0adbfe4853d8d77e279a', 'admin', NULL, '2022-03-24 15:49:03', NULL, 20, 0, 1, '466190', NULL, NULL, NULL, '466190');
INSERT INTO `muser` VALUES (48, '622213', '9a995cb1a0e4ff3730b8fd35af24d318', 'admin', NULL, '2022-03-24 15:49:12', NULL, 20, 0, 1, '622213', NULL, NULL, NULL, '622213');
INSERT INTO `muser` VALUES (49, '631097', '8c75a156e60cf41bf6cb2f84d0f93149', 'admin', NULL, '2022-03-24 15:49:21', NULL, 20, 0, 1, '631097', NULL, NULL, NULL, '631097');
INSERT INTO `muser` VALUES (50, '400740', '899cd80169c7dc22fff620efd8b12960', 'admin', NULL, '2022-03-24 15:56:48', NULL, 30, 0, 1, '400740', NULL, NULL, NULL, '400740');
INSERT INTO `muser` VALUES (51, '493183', '35f1d466237b91d5e2e20011401ee423', 'admin', NULL, '2022-03-24 15:56:57', NULL, 30, 0, 1, '493183', NULL, NULL, NULL, '493183');
INSERT INTO `muser` VALUES (52, '505096', '21cc5e95c4180e118117b17c9ac15ee4', 'admin', NULL, '2022-03-24 15:57:04', NULL, 30, 0, 1, '505096', NULL, NULL, NULL, '505096');
INSERT INTO `muser` VALUES (53, '505097', 'ec3c148b5de63edd5b702446934741c7', 'admin', NULL, '2022-03-24 15:57:10', NULL, 30, 0, 1, '505097', NULL, NULL, NULL, '505097');
INSERT INTO `muser` VALUES (54, '505099', 'ebef1261139a43313e6227ea19896211', 'admin', NULL, '2022-03-24 15:57:33', NULL, 30, 0, 1, '505099', NULL, NULL, NULL, '505099');
INSERT INTO `muser` VALUES (55, '505100', '106dc1efe6aa5b77ea4bb6290160a462', 'admin', NULL, '2022-03-24 15:57:38', NULL, 30, 0, 1, '505100', NULL, NULL, NULL, '505100');
INSERT INTO `muser` VALUES (56, '505101', 'b14bce9b162024d0236432ea27b5de01', 'admin', NULL, '2022-03-24 15:57:44', NULL, 30, 0, 1, '505101', NULL, NULL, NULL, '505101');
INSERT INTO `muser` VALUES (57, '505102', '1dd36cdfc60c5637a1fd26ff740d6774', 'admin', NULL, '2022-03-24 15:57:49', NULL, 30, 0, 1, '505102', NULL, NULL, NULL, '505102');
INSERT INTO `muser` VALUES (58, '505103', '90ba473e877df087e9ab08e01b459b0b', 'admin', NULL, '2022-03-24 15:57:55', NULL, 30, 0, 1, '505103', NULL, NULL, NULL, '505103');
INSERT INTO `muser` VALUES (59, '505104', '3aca76ad9fdc4d3f6bcd6e63113281d1', 'admin', NULL, '2022-03-24 15:58:01', NULL, 30, 0, 1, '505104', NULL, NULL, NULL, '505104');
INSERT INTO `muser` VALUES (60, '505105', '7b2aea9e975a2517f14543d0b241378a', 'admin', NULL, '2022-03-24 15:58:06', NULL, 30, 0, 1, '505105', NULL, NULL, NULL, '505105');
INSERT INTO `muser` VALUES (61, '505106', 'acf9f4d4bc5c5c1ecc8a49a8f75dc612', 'admin', NULL, '2022-03-24 15:58:13', NULL, 30, 0, 1, '505106', NULL, NULL, NULL, '505106');
INSERT INTO `muser` VALUES (62, '505107', '04e287a314e42f7bb6b4ecfaa9747d95', 'admin', NULL, '2022-03-24 15:58:18', NULL, 30, 0, 1, '505107', NULL, NULL, NULL, '505107');
INSERT INTO `muser` VALUES (63, '505108', 'b08caed0f67f5669d6e2de084481544a', 'admin', NULL, '2022-03-24 15:58:26', NULL, 30, 0, 1, '505108', NULL, NULL, NULL, '505108');
INSERT INTO `muser` VALUES (64, '505110', '76675d14c0e78df64a32b9ddc5875eb6', 'admin', NULL, '2022-03-24 15:58:31', NULL, 30, 0, 1, '505110', NULL, NULL, NULL, '505110');
INSERT INTO `muser` VALUES (65, '505730', 'b7953ebcd6f59ee3a65de2967e69390b', 'admin', NULL, '2022-03-24 15:58:36', NULL, 30, 0, 1, '505730', NULL, NULL, NULL, '505730');
INSERT INTO `muser` VALUES (66, '505749', '7449d44db0cbff83a965cf083f389f1e', 'admin', NULL, '2022-03-24 15:59:59', NULL, 30, 0, 1, '505749', NULL, NULL, NULL, '505749');
INSERT INTO `muser` VALUES (67, '505755', 'a27ebf8411363b30e03e391ab22d6a50', 'admin', NULL, '2022-03-24 16:00:08', NULL, 30, 0, 1, '505755', NULL, NULL, NULL, '505755');
INSERT INTO `muser` VALUES (68, '505770', '2101fb39f208742244eb475449b7b9d1', 'admin', NULL, '2022-03-24 16:00:14', NULL, 30, 0, 1, '505770', NULL, NULL, NULL, '505770');
INSERT INTO `muser` VALUES (69, '505786', '4fb801b4994e91f9d78b6badaeef99aa', 'admin', NULL, '2022-03-24 16:00:19', NULL, 30, 0, 1, '505786', NULL, NULL, NULL, '505786');
INSERT INTO `muser` VALUES (70, '505821', '4c12dd4f838a9dcbd7a2fb5e422398a6', 'admin', NULL, '2022-03-24 16:00:25', NULL, 30, 0, 1, '505821', NULL, NULL, NULL, '505821');
INSERT INTO `muser` VALUES (71, '505837', 'eeb006066e392d325b220051835b254a', 'admin', NULL, '2022-03-24 16:00:30', NULL, 30, 0, 1, '505837', NULL, NULL, NULL, '505837');
INSERT INTO `muser` VALUES (72, '505840', '65930bb2613673fada03edbe922c6852', 'admin', NULL, '2022-03-24 16:00:35', NULL, 30, 0, 1, '505840', NULL, NULL, NULL, '505840');
INSERT INTO `muser` VALUES (73, '505843', '0113fac2d29cee31bf2a0f5dfd3959a3', 'admin', NULL, '2022-03-24 16:00:40', NULL, 30, 0, 1, '505843', NULL, NULL, NULL, '505843');
INSERT INTO `muser` VALUES (74, '505868', 'f31e88217a21e4f851aae65fb1ae0fdd', 'admin', NULL, '2022-03-24 16:00:45', NULL, 30, 0, 1, '505868', NULL, NULL, NULL, '505868');
INSERT INTO `muser` VALUES (75, '505874', '7810ccf71def43e6789c2745066e4897', 'admin', NULL, '2022-03-24 16:00:50', NULL, 30, 0, 1, '505874', NULL, NULL, NULL, '505874');
INSERT INTO `muser` VALUES (76, '505880', '3fe1dca8fcabf93cf60b24d9ce6ef6c2', 'admin', NULL, '2022-03-24 16:00:55', NULL, 30, 0, 1, '505880', NULL, NULL, NULL, '505880');
INSERT INTO `muser` VALUES (77, '505899', '51cc37811aed827d723885188669ce77', 'admin', NULL, '2022-03-24 16:01:00', NULL, 30, 0, 1, '505899', NULL, NULL, NULL, '505899');
INSERT INTO `muser` VALUES (78, '505900', '0ad084da7fc8ab46464f9fe759926e21', 'admin', NULL, '2022-03-24 16:01:05', NULL, 30, 0, 1, '505900', NULL, NULL, NULL, '505900');
INSERT INTO `muser` VALUES (79, '505931', '6d0ecd8b737d88dde2e6a604942abf47', 'admin', NULL, '2022-03-24 16:01:11', NULL, 30, 0, 1, '505931', NULL, NULL, NULL, '505931');
INSERT INTO `muser` VALUES (80, '505940', 'ee49c938fab69250c111b1454061865c', 'admin', NULL, '2022-03-24 16:01:17', NULL, 30, 0, 1, '505940', NULL, NULL, NULL, '505940');
INSERT INTO `muser` VALUES (81, '505993', '3b6620ecd3bf5900f5935985a2a434b6', 'admin', NULL, '2022-03-24 16:01:22', NULL, 30, 0, 1, '505993', NULL, NULL, NULL, '505993');
INSERT INTO `muser` VALUES (82, '506022', 'ff51d8608215e291cb1a07f988f110e4', 'admin', NULL, '2022-03-24 16:01:27', NULL, 30, 0, 1, '506022', NULL, NULL, NULL, '506022');
INSERT INTO `muser` VALUES (83, '506038', '8398b9df1caef79d900f89e3393d3db9', 'admin', NULL, '2022-03-24 16:01:32', NULL, 30, 0, 1, '506038', NULL, NULL, NULL, '506038');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id_role` int(16) NOT NULL,
  `role_name` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `role_desc` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_role`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (10, 'admin', 'Superadmin');
INSERT INTO `role` VALUES (20, 'direktorat', 'Direktorat');
INSERT INTO `role` VALUES (30, 'balai', 'Balai');

-- ----------------------------
-- Table structure for satker
-- ----------------------------
DROP TABLE IF EXISTS `satker`;
CREATE TABLE `satker`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_satker` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `role` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_satker` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pulau` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_fe` int(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of satker
-- ----------------------------
INSERT INTO `satker` VALUES (1, '420138', '20', 'DIREKTORAT BINA TEKNIK PERMUKIMAN DAN PERUMAHAN', NULL, NULL);
INSERT INTO `satker` VALUES (2, '420139', '20', 'DIREKTORAT KEPATUHAN INTERN', NULL, NULL);
INSERT INTO `satker` VALUES (3, '452771', '20', 'DIREKTORAT PENGEMBANGAN KAWASAN PERMUKIMAN', NULL, NULL);
INSERT INTO `satker` VALUES (4, '452780', '20', 'DIREKTORAT BINA PENATAAN BANGUNAN', NULL, NULL);
INSERT INTO `satker` VALUES (5, '466162', '20', 'DIREKTORAT KETERPADUAN INFRASTRUKTUR PERMUKIMAN', NULL, NULL);
INSERT INTO `satker` VALUES (6, '466178', '20', 'DIREKTORAT AIR MINUM', NULL, NULL);
INSERT INTO `satker` VALUES (7, '466190', '20', 'DIREKTORAT SANITASI', NULL, NULL);
INSERT INTO `satker` VALUES (8, '622213', '20', 'SEKRETARIAT DIREKTORAT JENDERAL CIPTA KARYA', NULL, NULL);
INSERT INTO `satker` VALUES (9, '631097', '20', 'PUSAT PENGEMBANGAN SARANA PRASARANA PENDIDIKAN, OLAHRAGA DAN PASAR', NULL, NULL);
INSERT INTO `satker` VALUES (10, '400740', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH KALIMANTAN UTARA', 'KALIMANTAN', 5);
INSERT INTO `satker` VALUES (11, '493183', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH JAKARTA METROPOLITAN', NULL, NULL);
INSERT INTO `satker` VALUES (12, '505096', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH RIAU', 'SUMATERA', 4);
INSERT INTO `satker` VALUES (13, '505097', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH KEPULAUAN RIAU', 'SUMATERA', 10);
INSERT INTO `satker` VALUES (14, '505099', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH BENGKULU', 'SUMATERA', 7);
INSERT INTO `satker` VALUES (15, '505100', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH KEPULAUAN BANGKA BELITUNG', 'SUMATERA', 9);
INSERT INTO `satker` VALUES (16, '505101', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH DI YOGYAKARTA', 'JAWA', 4);
INSERT INTO `satker` VALUES (17, '505102', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH SULAWESI UTARA', 'SULAWESI', 1);
INSERT INTO `satker` VALUES (18, '505103', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH GORONTALO', 'SULAWESI', 5);
INSERT INTO `satker` VALUES (19, '505104', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH SULAWESI BARAT', 'SULAWESI', 6);
INSERT INTO `satker` VALUES (20, '505105', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH SULAWESI TENGGARA', 'SULAWESI', 4);
INSERT INTO `satker` VALUES (21, '505106', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH BALI', 'BALI-NUSA', 1);
INSERT INTO `satker` VALUES (22, '505107', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH NUSA TENGGARA BARAT', 'BALI-NUSA', 2);
INSERT INTO `satker` VALUES (23, '505108', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH MALUKU', 'MALUKU-PAPUA', 1);
INSERT INTO `satker` VALUES (24, '505110', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH MALUKU UTARA', 'MALUKU-PAPUA', 2);
INSERT INTO `satker` VALUES (25, '505730', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH ACEH', 'SUMATERA', 1);
INSERT INTO `satker` VALUES (26, '505749', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH SUMATERA UTARA', 'SUMATERA', 2);
INSERT INTO `satker` VALUES (27, '505755', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH SUMATERA BARAT', 'SUMATERA', 3);
INSERT INTO `satker` VALUES (28, '505770', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH JAMBI', 'SUMATERA', 5);
INSERT INTO `satker` VALUES (29, '505786', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH SUMATERA SELATAN', 'SUMATERA', 6);
INSERT INTO `satker` VALUES (30, '505821', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH LAMPUNG', 'SUMATERA', 8);
INSERT INTO `satker` VALUES (31, '505837', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH JAWA BARAT', 'JAWA', 2);
INSERT INTO `satker` VALUES (32, '505840', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH BANTEN', 'JAWA', 6);
INSERT INTO `satker` VALUES (33, '505843', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH JAWA TENGAH', 'JAWA', 3);
INSERT INTO `satker` VALUES (34, '505868', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH JAWA TIMUR', 'JAWA', 5);
INSERT INTO `satker` VALUES (35, '505874', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH KALIMANTAN BARAT', 'KALIMANTAN', 1);
INSERT INTO `satker` VALUES (36, '505880', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH KALIMANTAN TENGAH', 'KALIMANTAN', 2);
INSERT INTO `satker` VALUES (37, '505899', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH KALIMANTAN SELATAN', 'KALIMANTAN', 3);
INSERT INTO `satker` VALUES (38, '505900', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH KALIMANTAN TIMUR', 'KALIMANTAN', 4);
INSERT INTO `satker` VALUES (39, '505931', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH SULAWESI TENGAH', 'SULAWESI', 2);
INSERT INTO `satker` VALUES (40, '505940', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH SULAWESI SELATAN', 'SULAWESI', 3);
INSERT INTO `satker` VALUES (41, '505993', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH NUSA TENGGARA TIMUR', 'BALI-NUSA', 3);
INSERT INTO `satker` VALUES (42, '506022', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH PAPUA', 'MALUKU-PAPUA', 4);
INSERT INTO `satker` VALUES (43, '506038', '30', 'BALAI PRASARANA PERMUKIMAN WILAYAH PAPUA BARAT', 'MALUKU-PAPUA', 3);

SET FOREIGN_KEY_CHECKS = 1;
