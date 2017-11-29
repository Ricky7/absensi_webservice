-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Oct 12, 2017 at 02:58 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_suradita`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbabsensi`
--

CREATE TABLE `tbabsensi` (
  `id_absensi` int(11) NOT NULL,
  `nama_absensi` varchar(50) NOT NULL,
  `id_jadwal` int(11) NOT NULL,
  `tgl_buat` datetime NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbabsensi`
--

INSERT INTO `tbabsensi` (`id_absensi`, `nama_absensi`, `id_jadwal`, `tgl_buat`, `status`) VALUES
(1, 'Pertemuan 1', 16208460, '2017-10-11 09:00:00', '1'),
(2, 'Pertemuan 2', 16208460, '2017-10-18 00:00:00', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tbabsensi_detail`
--

CREATE TABLE `tbabsensi_detail` (
  `id_abdt` int(11) NOT NULL,
  `id_absen` int(11) NOT NULL,
  `id_mhs` int(11) NOT NULL,
  `ket` enum('H','I','A','S') NOT NULL,
  `tgl_absen` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbabsensi_detail`
--

INSERT INTO `tbabsensi_detail` (`id_abdt`, `id_absen`, `id_mhs`, `ket`, `tgl_absen`) VALUES
(1, 1, 110840021, 'H', '2017-10-11 00:00:00'),
(2, 1, 110840040, 'H', '2017-10-11 00:00:00'),
(3, 1, 130810007, 'H', '2017-10-12 17:00:39'),
(4, 1, 130810005, 'H', '2017-10-12 17:10:50'),
(5, 2, 130810005, 'H', '2017-10-12 17:11:20'),
(6, 1, 160840022, 'H', '2017-10-12 17:45:19'),
(7, 1, 160840021, 'H', '2017-10-12 17:47:26'),
(8, 1, 160840020, 'H', '2017-10-12 17:50:19'),
(9, 1, 160840019, 'H', '2017-10-12 17:52:20'),
(10, 2, 160840019, 'H', '2017-10-12 17:55:18');

-- --------------------------------------------------------

--
-- Table structure for table `tbdosen`
--

CREATE TABLE `tbdosen` (
  `nidn` char(10) NOT NULL DEFAULT '',
  `nmdos` varchar(40) DEFAULT NULL,
  `tmpt_lahir` varchar(40) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jk` char(1) DEFAULT NULL COMMENT 'L= Laki-laki ; P= Perempuan',
  `Alamat` varchar(50) NOT NULL,
  `Kota` varchar(20) NOT NULL,
  `agama` char(1) DEFAULT NULL COMMENT 'K= Katolik;P= Protestan; I= Islam ; B = Budha ; H = Hindu ; D =dll',
  `unit_kerja` varchar(40) NOT NULL,
  `no_ktp` varchar(25) DEFAULT NULL,
  `HP` varchar(12) NOT NULL,
  `telp` char(13) DEFAULT NULL,
  `wagnegaraan` char(1) NOT NULL COMMENT 'A= WNI ; B= WNA',
  `status_sipil` char(1) NOT NULL COMMENT 'M= Menikah; J= Janda ; D = Duda ; L = Lajang ; B= Biarawan/ti;',
  `Foto` varchar(1000) DEFAULT NULL,
  `jbt_akademik` varchar(50) NOT NULL,
  `status_kepegawaian` varchar(30) NOT NULL COMMENT 'A=Dosen Tetap ; B=Dosen PNS DPK;C=Dosen PNS PTN;D=honorerNon PNS PTN ; E=Kontrak',
  `eMail` varchar(100) NOT NULL,
  `Tgl_masuk_dosen` date NOT NULL,
  `no_sertifikasi` varchar(20) NOT NULL,
  `pangkat` varchar(20) NOT NULL,
  `golongan` varchar(5) NOT NULL,
  `status` char(1) NOT NULL COMMENT 'A= status ; B= Sedang Study; C=Sedang diskors',
  `password` varchar(100) NOT NULL DEFAULT '$2y$10$BRdwSH8QSegjQd0FMfutvOlpLNbcU8DHhogN/fx6w8PjxgSwGBTTa'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbdosen`
--

INSERT INTO `tbdosen` (`nidn`, `nmdos`, `tmpt_lahir`, `tgl_lahir`, `jk`, `Alamat`, `Kota`, `agama`, `unit_kerja`, `no_ktp`, `HP`, `telp`, `wagnegaraan`, `status_sipil`, `Foto`, `jbt_akademik`, `status_kepegawaian`, `eMail`, `Tgl_masuk_dosen`, `no_sertifikasi`, `pangkat`, `golongan`, `status`, `password`) VALUES
('0022116605', 'Drs. Charles Butarbutar,M.Pd', '-', '2016-09-13', 'L', 'Jl. ABC No.5', 'Medan', 'K', 'Ilmu Komputer', '-', '-', '-', 'A', 'M', NULL, 'D', 'B', '-', '2016-09-20', '-', '', 'IVA', 'A', '$2y$10$BRdwSH8QSegjQd0FMfutvOlpLNbcU8DHhogN/fx6w8PjxgSwGBTTa'),
('0029097403', 'Misalina Br.Ginting,S.Kom,M.Si', 'medan', '1971-02-01', 'P', 'jL.Anyelir No 4 Komplek Kejaksaan\r\nSimpang Selayan', 'medan', 'K', '', NULL, '081361778467', '0', 'A', 'M', 'UNIKA_profile.jpg', 'A', 'A', 'misalinaginting@gmail.com', '0000-00-00', '3546576', '', 'IA', 'A', '$2y$10$BRdwSH8QSegjQd0FMfutvOlpLNbcU8DHhogN/fx6w8PjxgSwGBTTa'),
('0108117501', 'Andy Paul Harianja,ST,M.Kom ', 'Pematang Siantar', '1975-11-08', 'L', 'JL. Karya Wisata Komplek Graha Johor C4', 'Medan', 'K', '', NULL, '081210302907', '0617853036', 'A', 'M', 'UNIKA_DSC_0214.JPG', 'A', 'A', 'apharianja@gmail.com', '0000-00-00', '14101100903921', '', 'IA', 'A', '$2y$10$BRdwSH8QSegjQd0FMfutvOlpLNbcU8DHhogN/fx6w8PjxgSwGBTTa'),
('0109086301', 'Romasi Lumban Gaol,M.Si', 'Medan', '1959-08-17', 'P', 'medan', 'medan', 'K', 'Fakultas Ekonomi', '3456789098765', '345678998765', '845678765456', 'A', 'M', NULL, 'A', 'A', 'fghjhgf@dfjhgfgh.com', '0000-00-00', '345678765', '', 'IVA', 'A', '$2y$10$BRdwSH8QSegjQd0FMfutvOlpLNbcU8DHhogN/fx6w8PjxgSwGBTTa'),
('0110056201', 'Drs. Jon Piter Situmorang,PhD', 'medan', '2016-08-01', 'L', 'medan', 'medan', 'K', 'Fakultas Sastra', '9876543456789098', '987654567890', '987678998765', 'A', 'M', NULL, 'A', 'A', 'jon@yahoo.com', '0000-00-00', '98645678', '', 'IVA', 'A', '$2y$10$BRdwSH8QSegjQd0FMfutvOlpLNbcU8DHhogN/fx6w8PjxgSwGBTTa'),
('0111067801', 'Desinta Purba,ST,M.Kom', 'medan', '1973-02-01', 'P', 'Jln. Djamin Ginting Gg Purba Dalam No. 23 P.Bulan ', 'medan', 'K', '', NULL, '081362069808', '06216554', 'A', 'M', 'UNIKA_des.JPG', 'A', 'A', 'desinta_ust@gmail.com', '0000-00-00', '093545465733', '', 'IA', 'A', '$2y$10$BRdwSH8QSegjQd0FMfutvOlpLNbcU8DHhogN/fx6w8PjxgSwGBTTa'),
('0113066901', 'Ratna D E Sirait,SH,M.Hum', 'medan', '2016-08-17', 'P', 'medan', 'medan', 'K', 'Fakultas Hukum', '0987432346789098', '987545678985', '987654568987', 'A', 'M', NULL, 'A', 'A', 'asdad@yahoo.com', '0000-00-00', '45678987654', '', 'IVA', 'A', '$2y$10$BRdwSH8QSegjQd0FMfutvOlpLNbcU8DHhogN/fx6w8PjxgSwGBTTa'),
('0114046501', 'Dr. Zakarias Situmorang,MT', 'Binjai', '1965-04-14', 'L', 'Jl.anyelir no.3 kompleks kejaksaan. Medan selayang', 'medan', 'K', '', NULL, '08126479840', '061 8365745', 'A', 'M', 'UNIKA_P_20151224_181438.jpg', 'A', 'A', 'zakarias65@yahoo.com', '0000-00-00', '11101100913356', '', 'IA', 'A', '$2y$10$BRdwSH8QSegjQd0FMfutvOlpLNbcU8DHhogN/fx6w8PjxgSwGBTTa'),
('0115027901', 'Romanus Damanik,S.Kom,M.Kom', 'Simalungun', '1976-03-18', 'L', 'Medan', 'Medan', 'K', 'Ilmu Komputer', '', '234567898765', '234567876545', 'A', 'M', NULL, 'A', 'A', 'romanusdamanik@yahoo.com', '0000-00-00', '3456787654567', '', 'IIA', 'A', '$2y$10$BRdwSH8QSegjQd0FMfutvOlpLNbcU8DHhogN/fx6w8PjxgSwGBTTa'),
('0116117302', 'Emerson P. Malau,S.Si,M.Kom', 'medan', '2016-07-03', 'L', 'Jl Letjend Jamin Ginting No 42 Sibolangit Deli Ser', 'Deli Serdang', 'P', '', '', '08196053698', '0618210161', 'A', 'M', NULL, 'B', 'A', 'malauemerson@gmail.com', '0000-00-00', '2873928409824', '', 'IIA', 'A', '$2y$10$BRdwSH8QSegjQd0FMfutvOlpLNbcU8DHhogN/fx6w8PjxgSwGBTTa'),
('0117085201', 'Drs. Sihar Sitanggang,M.Hum', 'medan', '2016-08-02', 'L', 'medan', 'medan', 'K', 'Fakultas Sastra', '0987654321234556', '081256789087', '098900', 'A', 'M', NULL, 'A', 'A', 'adasda@yahoo.com', '0000-00-00', '123', '', 'IVA', 'A', '$2y$10$BRdwSH8QSegjQd0FMfutvOlpLNbcU8DHhogN/fx6w8PjxgSwGBTTa'),
('0117116101', 'Drs. Swingly Purba,M.Sc', 'medan', '1961-11-17', 'L', 'Jl. Rakyat Ujung No. 212 Medan', 'medan', 'K', '', NULL, '08126464913', '0616629380', 'A', 'M', 'UNIKA_swip.jpg', 'A', 'B', 'swingly_purba@yahoo.com', '0000-00-00', '111-012-004-117-07', '', 'IVA', 'A', '$2y$10$BRdwSH8QSegjQd0FMfutvOlpLNbcU8DHhogN/fx6w8PjxgSwGBTTa'),
('0118127801', 'Tonni Limbong,S.Kom,M.Kom', 'Pananggahan', '1978-12-18', 'L', 'Perumahan Xenia Blok C No. 10 Namorambe - Delitua.', 'Deli Serdang', 'K', '', NULL, '081267058001', '-', 'A', 'M', 'UNIKA_tonni.jpg', 'C', 'A', 'tonni.budidarma@gmail.com', '2016-09-21', '11101306118093', 'Penata', 'III C', 'A', '$2y$10$BRdwSH8QSegjQd0FMfutvOlpLNbcU8DHhogN/fx6w8PjxgSwGBTTa'),
('0120066202', 'Dr. Yohanes Suhardin,M.Hum', 'medan', '2016-08-24', 'L', 'medan', 'medan', 'K', 'Fakultas Hukm', '0987654321234567', '087652345678', '876543456789', 'A', 'M', NULL, 'A', 'A', 'dfghjkjhgghj@yahoo.com', '0000-00-00', '1234567876', '', 'IVA', 'A', '$2y$10$BRdwSH8QSegjQd0FMfutvOlpLNbcU8DHhogN/fx6w8PjxgSwGBTTa'),
('0120116601', 'Ria Veronika Sinaga,SE,M.SI', 'Medan', '1954-10-12', 'P', 'Medan', 'Medan', 'K', 'Fakultas Ekonomi', '-', '-', '-', 'A', 'M', NULL, 'D', 'A', '-', '2013-10-07', '-', '', 'IVA', 'A', '$2y$10$BRdwSH8QSegjQd0FMfutvOlpLNbcU8DHhogN/fx6w8PjxgSwGBTTa'),
('0122107901', 'Sorang Pakpahan,S.Kom,M.Kom', 'sosorbulu', '1979-10-22', 'L', 'Jl. Parang II Gg. Harmonis No.5 P. Bulan Medan', 'Medan', 'K', 'Fakultas Ilmu Komputer', '1234455', '081370023422', '0618210161', 'A', 'M', 'UNIKA_f1.jpg', 'A', 'A', 'sorangpakpahan@yahoo.co.id', '0000-00-00', '-', '', 'IIIB', 'A', '$2y$10$BRdwSH8QSegjQd0FMfutvOlpLNbcU8DHhogN/fx6w8PjxgSwGBTTa'),
('0124126801', 'Drs. Lamhot Sitorus,M.Kom', 'Tiga Dolok', '1968-12-24', 'L', 'Perumahan Pondok Indah Blok A-5B Tanjung Anom', 'Medan', 'K', '', NULL, '081376715620', '061 8210161', 'A', 'M', 'UNIKA_Foto1.png', 'A', 'A', 'lamhot68@yahoo.com', '2016-07-01', '11101100906473', '43', '2', 'A', '$2y$10$BRdwSH8QSegjQd0FMfutvOlpLNbcU8DHhogN/fx6w8PjxgSwGBTTa'),
('0125058003', 'Parasian D.P Silitonga,M.Cs', 'medan', '1970-02-01', 'L', 'Jln. Jamin ginting', 'medan', 'P', 'Fakultas Ilmu Komputer', NULL, '08324353', '0621', 'A', 'M', 'UNIKA_Awal.jpg', 'Lektor', 'A', 'parasian_ust@yahoo.com', '2002-07-03', '435346546', 'Penata Muda', 'III/a', 'A', '$2y$10$BRdwSH8QSegjQd0FMfutvOlpLNbcU8DHhogN/fx6w8PjxgSwGBTTa'),
('0126088202', 'Masdiana Sagala,S.Kom,M.Kom', 'samosir', '1973-02-01', 'P', 'Binjai', 'medan', 'K', 'Fakultas Ilmu Komputer', NULL, '085297582812', '0621457', 'A', 'M', 'UNIKA_Tn_VYkDB2cEr3ybXLSgD0xjLTj-pyqDu.jpg', 'A', 'A', 'masdiana_ust@gmail.com', '0000-00-00', '093545465723', '', 'IA', 'A', '$2y$10$BRdwSH8QSegjQd0FMfutvOlpLNbcU8DHhogN/fx6w8PjxgSwGBTTa'),
('0128076901', 'Drs. Surianto Sitepu,MT', 'medan', '1962-08-08', 'L', 'medan', 'medan', 'K', 'Fakultas Ilmu Komputer', '124567890987654', '234567899876', '5876543', 'A', 'M', NULL, 'A', 'A', 'ghjdajhdjah@yahoo.com', '0000-00-00', '34567876', '', 'IVA', 'A', '$2y$10$BRdwSH8QSegjQd0FMfutvOlpLNbcU8DHhogN/fx6w8PjxgSwGBTTa'),
('0529067401', 'Wasit Ginting S.Kom', 'Barus Jahe', '1974-06-28', 'L', 'Jln. Jamin Ginting \r\nGg. Mejuah-Juah No.10-B', 'medan', 'P', 'Fakultas Ilmu Komputer', NULL, '0822760357`1', '-', 'A', 'M', NULL, 'A', 'A', 'wasit_ust@gmail.com', '0000-00-00', '09354546575', '', 'IA', 'A', '$2y$10$BRdwSH8QSegjQd0FMfutvOlpLNbcU8DHhogN/fx6w8PjxgSwGBTTa'),
('0100000001', 'P. Thamrin Berutu,M.Pd,O.Carm', 'aaa', '2017-02-08', 'L', 'Pasar Merah', 'Medan', 'K', 'Fakultas Keguruan Dan Pendidikan', '-', '-', '-', 'A', 'A', NULL, 'B', 'A', 'thamrin@gmail.com', '2017-02-08', '-', '', 'IIIA', 'A', '$2y$10$BRdwSH8QSegjQd0FMfutvOlpLNbcU8DHhogN/fx6w8PjxgSwGBTTa'),
('0293847575', 'Suradita Ginting S.Kom', NULL, NULL, 'L', '', '', NULL, 'Fakultas Ilmu Komputer', NULL, '', NULL, '', '', NULL, '', '', '', '0000-00-00', '', '', '', '', '$2y$10$BRdwSH8QSegjQd0FMfutvOlpLNbcU8DHhogN/fx6w8PjxgSwGBTTa'),
('0234754522', 'Erta Sirait, S.Kom', NULL, NULL, 'P', '', '', NULL, 'Fakultas Ilmu Komputer', NULL, '', NULL, '', '', NULL, '', '', '', '0000-00-00', '', '', '', '', '$2y$10$BRdwSH8QSegjQd0FMfutvOlpLNbcU8DHhogN/fx6w8PjxgSwGBTTa');

-- --------------------------------------------------------

--
-- Table structure for table `tbfakultas`
--

CREATE TABLE `tbfakultas` (
  `kd_fak` char(2) NOT NULL,
  `nm_fak` char(40) NOT NULL,
  `dekan` char(10) NOT NULL,
  `wakil_dekan1` char(10) DEFAULT NULL,
  `wakil_dekan2` char(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbfakultas`
--

INSERT INTO `tbfakultas` (`kd_fak`, `nm_fak`, `dekan`, `wakil_dekan1`, `wakil_dekan2`) VALUES
('08', 'ILMU KOMPUTER', '1209091989', '0122107901', ''),
('01', 'EKONOMI', ' 010112810', ' 010102810', ' 010112890');

-- --------------------------------------------------------

--
-- Table structure for table `tbjam`
--

CREATE TABLE `tbjam` (
  `kd_jam` char(5) NOT NULL DEFAULT '',
  `jam` char(5) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbjam`
--

INSERT INTO `tbjam` (`kd_jam`, `jam`) VALUES
('AB', '08:00'),
('ABC', '08.00'),
('ABCD', '08.00'),
('CD', '09:45'),
('CDE', '09.40'),
('CDEF', '09.50'),
('DE', '10.45'),
('DEF', '10.45'),
('EF', '11:50'),
('EFGH', '11.40'),
('GH', '14.00'),
('GHI', '14.00'),
('IJ', '15.50');

-- --------------------------------------------------------

--
-- Table structure for table `tbjatwalkuliah`
--

CREATE TABLE `tbjatwalkuliah` (
  `id` char(10) NOT NULL DEFAULT '',
  `thn_ajaran` char(5) NOT NULL DEFAULT '',
  `kd_matkul` char(10) NOT NULL DEFAULT '',
  `hari` char(10) DEFAULT NULL,
  `kd_jam` char(10) DEFAULT NULL,
  `ruang` char(10) DEFAULT NULL,
  `dosen` varchar(40) DEFAULT NULL,
  `prodi` char(3) NOT NULL,
  `kelas` char(1) NOT NULL,
  `status_nilai` char(1) NOT NULL,
  `status` char(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbjatwalkuliah`
--

INSERT INTO `tbjatwalkuliah` (`id`, `thn_ajaran`, `kd_matkul`, `hari`, `kd_jam`, `ruang`, `dosen`, `prodi`, `kelas`, `status_nilai`, `status`) VALUES
('13108101', '20131', '0801000092', '5', 'IJ', 'I/2', '0022116605', '081', 'A', '', ''),
('13108102', '20131', '0801001052', '1', 'EF', 'I/3', '0114046501', '081', 'A', '', ''),
('13108103', '20131', '0821012012', '1', 'GH', 'C', '0529067401', '081', 'A', '', ''),
('13108104', '20131', '0801011042', '2', 'AB', 'I/3', '0110056201', '081', 'A', '', ''),
('13108105', '20131', '0801001063', '3', 'CD', 'I/4', '0114046501', '081', 'A', '', ''),
('13108106', '20131', '0801001023', '4', 'ABC', 'I/2', '0126088202', '081', 'A', '', ''),
('13108107', '20131', '0801001032', '4', 'IJ', 'A', '0126088202', '081', 'A', '', ''),
('13108108', '20131', '0801001032', '4', 'GH', 'A', '0126088202', '081', 'A', '', ''),
('13108109', '20131', '0801001072', '5', 'CD', 'I/2', '0029097403', '081', 'A', '', ''),
('13108110', '20131', '0801001081', '5', 'GH', 'A', '0029097403', '081', 'A', '', ''),
('16108101', '20161', '0801001063', '1', 'ABC', 'I/1', '0114046501', '081', 'A', '2', '1'),
('16108102', '20161', '0801001023', '1', 'DEF', 'I/3', '0116117302', '081', 'A', '2', '1'),
('16108103', '20161', '0801001072', '2', 'AB', 'I/3', '0029097403', '081', 'A', '2', '1'),
('16108104', '20161', '0801001081', '2', 'CD', 'D', '0029097403', '081', 'A', '2', '1'),
('16108105', '20161', '0801001052', '3', 'AB', 'I/2', '0114046501', '081', 'A', '2', '1'),
('16108106', '20161', '0801001032', '3', 'CDEF', 'C', '0116117302', '081', 'A', '2', '1'),
('16108107', '20161', '0801011042', '4', 'EF', 'I/2', '0110056201', '081', 'A', '2', '1'),
('16108108', '20161', '0821012012', '5', 'ABCD', 'C', '0529067401', '081', 'A', '2', '1'),
('16108109', '20161', '0801000092', '5', 'GH', 'I/2', '0022116605', '081', 'A', '2', '1'),
('16108110', '20161', '0801002242', '1', 'AB', 'III/1', '0126088202', '081', 'A', '2', '1'),
('16108111', '20161', '0801002211', '1', 'CD', 'A', '0126088202', '081', 'A', '2', '1'),
('16108112', '20161', '0801002222', '1', 'EF', 'I/1', '0529067401', '081', 'A', '2', '1'),
('16108113', '20161', '0801002232', '2', 'ABCD', 'B', '0529067401', '081', 'A', '2', '1'),
('16108114', '20161', '0801001262', '2', 'GH', 'I/3', '0124126801', '081', 'A', '2', '1'),
('16108115', '20161', '0801002252', '3', 'CDEF', 'D', '0126088202', '081', 'A', '2', '1'),
('16108116', '20161', '0801001272', '3', 'GH', 'I/4', '0128076901', '081', 'A', '2', '1'),
('16108117', '20161', '0801002202', '4', 'AB', 'I/4', '0126088202', '081', 'A', '2', '1'),
('16108118', '20161', '0821001303', '4', 'GHI', 'I/4', '0118127801', '081', 'A', '2', '1'),
('16108119', '20161', '0801001282', '5', 'EF', 'I/2', '0126088202', '081', 'A', '2', '1'),
('16108120', '20161', '0801001291', '5', 'GH', 'C', '0126088202', '081', 'A', '2', '1'),
('16108121', '20161', '0801000422', '4', 'CD', 'I/4', '0120066202', '081', 'A', '2', '1'),
('16108122', '20161', '0821002482', '1', 'GH', 'I/4', '0118127801', '081', 'A', '2', '1'),
('16108123', '20161', '0801001493', '2', 'ABC', 'I/2', '0116117302', '081', 'A', '2', '1'),
('16108124', '20161', '0801004622', '1', 'EF', 'I/2', '0114046501', '081', 'A', '2', '1'),
('16108125', '20161', '0801014642', '3', 'AB', 'I/4', '0108117501', '081', 'A', '2', '1'),
('16108126', '20161', '0801001502', '3', 'CD', 'I/4', '0111067801', '081', 'A', '2', '1'),
('16108127', '20161', '0801001511', '3', 'EF', 'E', '0111067801', '081', 'A', '2', '1'),
('16108128', '20161', '0801003652', '5', 'CD', 'I/3', '0029097403', '081', 'A', '2', '1'),
('16108129', '20161', '0821002451', '1', 'CD', 'C', '0118127801', '081', 'A', '2', '1'),
('16108130', '20161', '0801013661', '5', 'AB', 'I/1', '0122107901', '081', 'A', '2', ''),
('16108131', '20161', '0821002443', '2', 'GHI', 'I/4', '0118127801', '081', 'A', '2', '1'),
('16108132', '20161', '0801004632', '2', 'AB', 'I/4', '0113066901', '081', 'A', '2', '1'),
('16108133', '20161', '0821422033', '1', 'ABC', 'III/2', '0115027901', '081', 'A', '2', '1'),
('16108134', '20161', '0821422041', '1', 'GH', 'D', '0115027901', '081', 'A', '2', '1'),
('16108135', '20161', '0821322033', '2', 'CDE', 'I/4', '0115027901', '081', 'A', '2', '1'),
('16108136', '20161', '0821322041', '3', 'CD', 'B', '0115027901', '081', 'A', '2', '1'),
('16108137', '20161', '0801002462', '5', 'AB', 'I/3', '0125058003', '081', 'A', '2', '1'),
('16108138', '20161', '0821014432', '4', 'EF', 'I/3', '0120116601', '081', 'A', '2', '1'),
('16108139', '20161', '0801002472', '5', 'EFGH', 'D', '0125058003', '081', 'A', '2', '1'),
('16108140', '20161', '0801003673', '3', 'GHI', 'I/2', '0116117302', '081', 'A', '2', ''),
('16108141', '20161', '0801013661', '4', 'CD', 'I/1', '0118127801', '081', 'A', '', ''),
('16108401', '20161', '0804001063', '2', 'GHI', 'I/2', '0117116101', '084', 'A', '2', '1'),
('16108402', '20161', '0804001013', '1', 'ABC', 'I/2', '0124126801', '084', 'A', '2', '1'),
('16108403', '20161', '0804001091', '5', 'AB', 'D', '0029097403', '084', 'A', '2', '1'),
('16108404', '20161', '0804001082', '3', 'CD', 'I/2', '0029097403', '084', 'A', '2', '1'),
('16108405', '20161', '0804001052', '3', 'AB', 'I/2', '0114046501', '084', 'A', '2', '1'),
('16108407', '20161', '0804011042', '4', 'EF', 'I/2', '0110056201', '084', 'A', '2', '1'),
('16108408', '20161', '0804001022', '2', 'ABCD', 'A', '0124126801', '084', 'A', '2', '1'),
('16108409', '20161', '0804000072', '4', 'CD', 'I/4', '0120066202', '084', 'A', '2', '1'),
('16108410', '20161', '0804000032', '5', 'GH', 'I/2', '0022116605', '084', 'A', '2', '1'),
('16108411', '20161', '0814001222', '1', 'AB', 'I/4', '0111067801', '084', 'A', '2', '1'),
('16108412', '20161', '0804001272', '1', 'CD', 'I/3', '0111067801', '084', 'A', '2', '1'),
('16108413', '20161', '0804001302', '1', 'EF', 'I/4', '0124126801', '084', 'A', '2', '1'),
('16108414', '20161', '0804001282', '2', 'AB', 'I/3', '0108117501', '084', 'A', '2', '1'),
('16108415', '20161', '0804012261', '2', 'EF', 'B', '0118127801', '084', 'A', '2', '1'),
('16108416', '20161', '0804002232', '3', 'CD', 'I/3', '0122107901', '084', 'A', '2', '1'),
('16108417', '20161', '0804002241', '3', 'EF', 'A', '0122107901', '084', 'A', '2', '1'),
('16108418', '20161', '0804012252', '4', 'AB', 'I/3', '0118127801', '084', 'A', '2', '1'),
('16108419', '20161', '0804001213', '4', 'GHI', 'I/1', '0111067801', '084', 'A', '2', '1'),
('16108421', '20161', '0804001291', '5', 'CD', 'A', '0108117501', '084', 'A', '2', '1'),
('16108422', '20161', '0804014672', '3', 'DE', 'III/1', '0108117501', '084', 'A', '2', '1'),
('16108423', '20161', '0804001311', '5', 'AB', 'B', '0124126801', '084', 'A', '2', '1'),
('16108424', '20161', '0814013682', '1', 'AB', 'I/3', '0029097403', '084', 'A', '2', '1'),
('16108425', '20161', '0814122013', '1', 'DEF', 'III/1', '0125058003', '084', 'A', '2', '1'),
('16108426', '20161', '0814722041', '1', 'GH', 'A', '0114046501', '084', 'A', '2', '1'),
('16108427', '20161', '0814222033', '1', 'GHI', 'I/2', '0122107901', '084', 'A', '2', '1'),
('16108428', '20161', '0804004662', '2', 'AB', 'I/4', '0113066901', '084', 'A', '2', '1'),
('16108429', '20161', '0804002431', '2', 'CD', 'C', '0125058003', '084', 'A', '2', '1'),
('16108430', '20161', '0804001442', '1', 'EF', 'I/2', '0116117302', '084', 'A', '2', '1'),
('16108431', '20161', '0814012711', '2', 'GH', 'C', '0115027901', '084', 'A', '2', '1'),
('16108432', '20161', '0814322053', '3', 'ABC', 'III/1', '0529067401', '084', 'A', '2', '1'),
('16108433', '20161', '0804003692', '4', 'AB', 'III/1', '0111067801', '084', 'A', '2', '1'),
('16108434', '20161', '0804004652', '4', 'GH', 'I/2', '0126088202', '084', 'A', '2', '1'),
('16108435', '20161', '0814222041', '4', 'GH', 'C', '0122107901', '084', 'A', '2', '1'),
('16108436', '20161', '0814322061', '5', 'EF', 'C', '0529067401', '084', 'A', '2', '1'),
('16108437', '20161', '0814012702', '5', 'GH', 'I/3', '0115027901', '084', 'A', '2', '1'),
('16108438', '20161', '0814722033', '3', 'GHI', 'I/3', '0114046501', '084', 'A', '2', '1'),
('16108439', '20161', '0804013731', '1', 'GH', 'I/1', '0108117501', '084', 'A', '2', ''),
('16108440', '20161', '0804003723', '2', 'GH', 'I/1', '0108117501', '084', 'A', '2', ''),
('16108441', '20161', '0804002422', '5', 'CD', 'I/2', '0125058003', '084', 'A', '2', '1'),
('16108442', '20161', '0814122021', '3', 'GH', 'C', '0125058003', '084', 'A', '2', '1'),
('16108443', '20161', '0804001452', '5', 'AB', 'I/2', '0108117501', '084', 'A', '2', '1'),
('16108444', '20161', '0804001461', '4', 'AB', 'C', '0108117501', '084', 'A', '2', '1'),
('16208401', '20162', '0804001162', '1', 'AB', 'I/3', '0124126801', '084', 'A', '2', ''),
('16208402', '20162', '0804001352', '1', 'AB', 'I/2', '0115027901', '084', 'A', '2', ''),
('16208403', '20162', '0804011102', '5', 'AB', 'I/4', '0110056201', '084', 'A', '2', ''),
('16208404', '20162', '0814001572', '1', 'DE', 'I/1', '0114046501', '084', 'A', '2', ''),
('16208405', '20162', '0804002132', '1', 'EF', 'I/3', '0126088202', '084', 'A', '2', ''),
('16208406', '20162', '0804001403', '1', 'GHI', 'I/1', '0111067801', '084', 'A', '2', ''),
('16208407', '20162', '0814001582', '1', 'GH', 'I/3', '0114046501', '084', 'A', '2', ''),
('16208408', '20162', '0804000112', '2', 'AB', 'I/4', '0113066901', '084', 'A', '2', ''),
('16208409', '20162', '0814622013', '2', 'ABC', 'I/1', '0124126801', '084', 'A', '2', ''),
('16208410', '20162', '0804002362', '2', 'AB', 'I/2', '0125058003', '084', 'A', '2', ''),
('16208411', '20162', '0804001202', '2', 'CD', 'I/3', '0111067801', '084', 'A', '2', ''),
('16208412', '20162', '0804002333', '2', 'GHI', 'I/2', '0116117302', '084', 'A', '2', ''),
('16208413', '20162', '0804001171', '2', 'EF', 'LAB-A', '0124126801', '084', 'A', '2', ''),
('16208414', '20162', '0814422013', '2', 'GHI', 'I/1', '0122107901', '084', 'A', '2', ''),
('16208415', '20162', '0804012382', '2', 'EF', 'I/2', '0529067401', '084', 'A', '2', ''),
('16208416', '20162', '0804001123', '3', 'ABC', 'I/3', '0114046501', '084', 'A', '2', ''),
('16208417', '20162', '0804001552', '3', 'AB', 'I/2', '0108117501', '084', 'A', '2', ''),
('16208418', '20162', '0804013762', '3', 'CD', 'I/4', '0029097403', '084', 'A', '2', ''),
('16208419', '20162', '0814011532', '3', 'EF', 'I/2', '0114046501', '084', 'A', '2', ''),
('16208420', '20162', '0804002141', '3', 'EF', 'LAB-A', '0126088202', '084', 'A', '2', ''),
('16208421', '20162', '0804001411', '3', 'EF', 'LAB-D', '0111067801', '084', 'A', '2', ''),
('16208422', '20162', '0814011541', '3', 'GH', 'LAB-C', '0114046501', '084', 'A', '2', ''),
('16208423', '20162', '0804002341', '3', 'GH', 'LAB-D', '0116117302', '084', 'A', '2', ''),
('16208424', '20162', '0804001561', '4', 'AB', 'LAB-C', '0108117501', '084', 'A', '2', ''),
('16208425', '20162', '0814001182', '4', 'AB', 'I/2', '0111067801', '084', 'A', '2', ''),
('16208426', '20162', '0804000152', '5', 'EF', 'I/4', '0100000001', '084', 'A', '2', ''),
('16208427', '20162', '0804002372', '4', 'CDEF', 'LAB-A', '0125058003', '084', 'A', '2', ''),
('16208428', '20162', '0814001191', '4', 'EF', 'LAB-G', '0111067801', '084', 'A', '2', ''),
('16208429', '20162', '0814422021', '1', 'AB', 'LAB-C', '0122107901', '084', 'A', '2', ''),
('16208430', '20162', '0814622021', '5', 'AB', 'LAB-C', '0124126801', '084', 'A', '2', ''),
('16208431', '20162', '0804012391', '5', 'CD', 'LAB-C', '0529067401', '084', 'A', '2', ''),
('16208432', '20162', '0804014772', '5', 'CD', 'I/2', '0126088202', '084', 'A', '2', ''),
('16208433', '20162', '0814522021', '5', 'EF', 'LAB-B', '0125058003', '084', 'A', '2', ''),
('16208434', '20162', '0814001322', '5', 'GH', 'I/3', '0124126801', '084', 'A', '2', ''),
('16208435', '20162', '0814522013', '5', 'GHI', 'I/2', '0125058003', '084', 'A', '2', ''),
('16208101', '20162', '0801001143', '1', 'ABC', 'I/1', '0114046501', '081', 'A', '2', ''),
('16208102', '20162', '0801003722', '1', 'AB', 'I/4', '0029097403', '081', 'A', '2', ''),
('16208103', '20162', '0801002342', '1', 'CD', 'I/3', '0529067401', '081', 'A', '2', ''),
('16208104', '20162', '0801011132', '5', 'AB', 'I/4', '0110056201', '081', 'A', '2', ''),
('16208105', '20162', '0821002523', '1', 'DEF', 'I/2', '0116117302', '081', 'A', '2', ''),
('16208106', '20162', '0801001403', '1', 'GHI', 'I/2', '0125058003', '081', 'A', '2', ''),
('16208107', '20162', '0801001173', '1', 'DEF', 'I/4', '0118127801', '081', 'A', '2', ''),
('16208108', '20162', '0801002541', '1', 'GH', 'LAB-C', '0126088202', '081', 'A', '2', ''),
('16208109', '20162', '0801000312', '2', 'AB', 'I/4', '0113066901', '081', 'A', '2', ''),
('16208110', '20162', '0821012102', '2', 'CDEF', 'LAB-A', '0118127801', '081', 'A', '2', ''),
('16208111', '20162', '0821003572', '2', 'AB', 'I/3', '0029097403', '081', 'A', '2', ''),
('16208112', '20162', '0801002532', '2', 'CD', 'I/2', '0126088202', '081', 'A', '2', ''),
('16208113', '20162', '0801001382', '2', 'CD', 'I/4', '0108117501', '081', 'A', '2', ''),
('16208114', '20162', '0821322041', '2', 'GH', 'LAB-C', '0115027901', '081', 'A', '', ''),
('16208115', '20162', '0801001411', '2', 'GH', 'LAB-D', '0125058003', '081', 'A', '2', ''),
('16208116', '20162', '0801001363', '3', 'ABC', 'I/2', '0116117302', '081', 'A', '2', ''),
('16208117', '20162', '0801010181', '3', 'AB', 'LAB-A', '0118127801', '081', 'A', '2', ''),
('16208118', '20162', '0801002112', '3', 'CD', 'I/1', '0122107901', '081', 'A', '2', ''),
('16208119', '20162', '0801001391', '3', 'EF', 'LAB-C', '0108117501', '081', 'A', '2', ''),
('16208120', '20162', '0821011161', '3', 'EF', 'LAB-B', '0109086301', '081', 'A', '2', ''),
('16208121', '20162', '0821122033', '3', 'GHI', 'I/2', '0529067401', '081', 'A', '2', ''),
('16208122', '20162', '0801001371', '4', 'AB', 'LAB-D', '0116117302', '081', 'A', '2', ''),
('16208123', '20162', '0821011152', '4', 'AB', 'I/3', '0109086301', '081', 'A', '2', ''),
('16208124', '20162', '0801000322', '5', 'EF', 'I/3', '0100000001', '081', 'A', '2', ''),
('16208125', '20162', '0801002552', '4', 'CD', 'I/2', '0108117501', '081', 'A', '2', ''),
('16208126', '20162', '0821122041', '4', 'EF', 'LAB-C', '0529067401', '081', 'A', '2', ''),
('16208127', '20162', '0821011192', '4', 'CD', 'I/2', '0126088202', '081', 'A', '2', ''),
('16208128', '20162', '0821222033', '4', 'GHI', 'I/2', '0115027901', '081', 'A', '2', ''),
('16208129', '20162', '0801001333', '5', 'ABC', 'I/3', '0111067801', '081', 'A', '2', ''),
('16208130', '20162', '0801002561', '5', 'AB', 'LAB-A', '0108117501', '081', 'A', '2', ''),
('16208131', '20162', '0801002121', '4', 'EF', 'LAB-D', '0122107901', '081', 'A', '2', ''),
('16208132', '20162', '0801014732', '5', 'EF', 'I/2', '0126088202', '081', 'A', '2', ''),
('16208133', '20162', '0801002352', '5', 'EFGH', 'LAB-C', '0529067401', '081', 'A', '2', ''),
('16208134', '20162', '0801013661', '1', 'GH', 'III/1', '0116117302', '081', 'A', '', ''),
('16208436', '20162', '0804013731', '1', 'AB', 'III/1', '0108117501', '084', 'A', '', ''),
('16208135', '20162', '0801002746', '1', 'CDEF', 'I/1', '0122107901', '081', 'A', '', ''),
('16208136', '20162', '0801002746', '1', 'ABCD', 'I/1', '0118127801', '081', 'B', '', ''),
('16208137', '20162', '0801002746', '1', 'EFGH', 'I/1', '0115027901', '081', 'C', '', ''),
('16208138', '20162', '0801002746', '2', 'ABCD', 'I/1', '0116117302', '081', 'D', '', ''),
('16208437', '20162', '0804002786', '1', 'ABC', 'I/1', '0108117501', '084', 'A', '', ''),
('16208438', '20162', '0804002786', '2', 'CDEF', 'I/1', '0124126801', '084', 'B', '', ''),
('16208439', '20162', '0804002786', '3', 'CDEF', 'I/1', '0029097403', '084', 'C', '', ''),
('16208440', '20162', '0804002786', '4', 'CDEF', 'I/1', '0125058003', '084', 'D', '', ''),
('16208441', '20162', '0804002786', '4', 'EFGH', 'I/1', '0111067801', '084', 'E', '', ''),
('16208442', '20162', '0804002786', '5', 'EFGH', 'III/1', '0126088202', '084', 'F', '', ''),
('16208139', '20162', '0801002746', '5', 'CDEF', 'I/4', '0114046501', '081', 'E', '1', ''),
('16208140', '20162', '0801002746', '2', 'CDEF', 'I/4', '0529067401', '081', 'F', '', ''),
('16208141', '20162', '0801013661', '2', 'EF', 'I/4', '0122107901', '081', 'B', '2', ''),
('16208142', '20162', '0801013661', '2', 'EF', 'I/3', '0118127801', '081', 'C', '2', ''),
('16208143', '20162', '0801013661', '4', 'GH', 'I/4', '0114046501', '081', 'D', '1', ''),
('16208144', '20162', '0801013661', '1', 'GH', 'III/1', '0529067401', '081', 'E', '', ''),
('16208145', '20162', '0801013661', '4', 'DE', 'I/4', '0115027901', '081', 'F', '', ''),
('16208443', '20162', '0804013731', '2', 'CD', 'I/4', '0124126801', '084', 'B', '', ''),
('16208444', '20162', '0804013731', '4', 'EF', 'I/1', '0029097403', '084', 'C', '', ''),
('16208445', '20162', '0804013731', '3', 'EF', 'I/1', '0125058003', '084', 'D', '', ''),
('16208446', '20162', '0804013731', '5', 'GH', 'I/1', '0111067801', '084', 'E', '', ''),
('16208447', '20162', '0804013731', '4', 'GH', 'I/3', '0126088202', '084', 'F', '2', ''),
('16208146', '20162', '0821222041', '2', 'GH', 'LAB-C', '0115027901', '081', 'A', '2', ''),
('16208147', '20162', '0801002746', '1', 'CDEF', 'I/1', '0124126801', '081', 'G', '', ''),
('16208148', '20162', '0801002746', '1', 'EFGH', 'I/1', '0029097403', '081', 'L', '', ''),
('16208149', '20162', '0801002746', '1', 'ABCD', 'I/1', '0108117501', '081', 'H', '', ''),
('16208150', '20162', '0801002746', '2', 'EFGH', 'I/1', '0111067801', '081', 'I', '', ''),
('16208151', '20162', '0801002746', '2', 'ABCD', 'I/1', '0125058003', '081', 'J', '', ''),
('16208152', '20162', '0801002746', '3', 'ABCD', 'I/1', '0126088202', '081', 'K', '', ''),
('16208153', '20162', '0801013661', '5', 'ABCD', 'I/2', '0029097403', '081', 'G', '', ''),
('16208154', '20162', '0801013661', '5', 'CDEF', 'I/2', '0108117501', '081', 'H', '', ''),
('16208155', '20162', '0801013661', '4', 'EFGH', 'I/1', '0111067801', '081', 'I', '', ''),
('16208156', '20162', '0801013661', '4', 'EFGH', 'I/1', '0124126801', '081', 'J', '', ''),
('16208157', '20162', '0801013661', '3', 'EFGH', 'I/1', '0125058003', '081', 'L', '', ''),
('16208158', '20162', '0801013661', '3', 'EFGH', 'I/1', '0126088202', '081', 'K', '1', ''),
('16208448', '20162', '0804002786', '2', 'ABCD', 'I/1', '0114046501', '084', 'G', '', ''),
('16208449', '20162', '0804002786', '4', 'EFGH', 'I/1', '0115027901', '084', 'H', '', ''),
('16208450', '20162', '0804002786', '5', 'EFGH', 'I/2', '0116117302', '084', 'I', '', ''),
('16208451', '20162', '0804002786', '3', 'EFGH', 'I/1', '0118127801', '084', 'J', '', ''),
('16208452', '20162', '0804002786', '2', 'CDEF', 'I/1', '0122107901', '084', 'K', '', ''),
('16208453', '20162', '0804002786', '5', 'EFGH', 'I/1', '0529067401', '084', 'L', '', ''),
('16208454', '20162', '0804013731', '3', 'EFGH', 'I/2', '0114046501', '084', 'G', '', ''),
('16208455', '20162', '0804013731', '5', 'EFGH', 'I/1', '0115027901', '084', 'H', '', ''),
('16208456', '20162', '0804013731', '4', 'CDEF', 'I/2', '0116117302', '084', 'I', '', ''),
('16208457', '20162', '0804013731', '4', 'ABCD', 'I/4', '0118127801', '084', 'J', '', ''),
('16208458', '20162', '0804013731', '5', 'CD', 'I/1', '0125058003', '084', 'K', '', ''),
('16208459', '', '0804013731', '3', 'CDEF', 'I/2', '0128076901', '084', 'L', '', ''),
('16208460', '20171', '0801001333', '2', 'CDEF', 'I/5', '0120116601', '084', 'B', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id_admin` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(250) NOT NULL,
  `role` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id_admin`, `nama`, `username`, `password`, `role`) VALUES
(1, 'Jono', 'admin', '$2y$10$CU/8phQfsNRTPldgCuHROekJiopxuxClTKcaTI.ZqCwFwg71jpeWG', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbmahasiswa`
--

CREATE TABLE `tbmahasiswa` (
  `npm` char(9) NOT NULL DEFAULT '',
  `nm_mhs` varchar(40) DEFAULT NULL,
  `fakultas` char(2) NOT NULL,
  `kd_prodi` char(3) NOT NULL,
  `jk` char(1) DEFAULT NULL,
  `agama` char(1) DEFAULT NULL,
  `kewarganegaraan` char(1) DEFAULT NULL,
  `jlh_bersaudara` char(2) DEFAULT NULL,
  `status_sipil` char(1) DEFAULT NULL,
  `tmpt_lahir` varchar(40) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `alamat` varchar(40) DEFAULT NULL,
  `Foto` varchar(1000) DEFAULT NULL,
  `kodepos` varchar(6) DEFAULT NULL,
  `telp` char(12) DEFAULT NULL,
  `nm_sma` varchar(100) DEFAULT NULL,
  `alamat_sma` varchar(100) DEFAULT NULL,
  `kecamatan` varchar(50) DEFAULT NULL,
  `kabupaten` varchar(50) DEFAULT NULL,
  `kota` varchar(50) DEFAULT NULL,
  `provinsi` varchar(50) DEFAULT NULL,
  `thn_lulus` char(4) DEFAULT NULL,
  `no_ijazah` varchar(18) DEFAULT NULL,
  `tgl_ijazah` date DEFAULT NULL,
  `jlh_un` double DEFAULT NULL,
  `rataun` double DEFAULT NULL,
  `no_surat_pindah` varchar(40) DEFAULT NULL,
  `tgl_surat_pindah` date DEFAULT NULL,
  `pt_asal` varchar(50) DEFAULT NULL,
  `prog_studi_pindah` varchar(50) DEFAULT NULL,
  `asal_sekolah` varchar(50) DEFAULT NULL,
  `jenjang` varchar(5) DEFAULT NULL,
  `sks_yang_diakui` int(11) NOT NULL,
  `no_ijazah_terkhir` varchar(50) NOT NULL,
  `nm_ayah` varchar(40) DEFAULT NULL,
  `pekerjaan_ayah` varchar(40) DEFAULT NULL,
  `pendidikan_ayah` varchar(40) DEFAULT NULL,
  `status_ayah` char(1) DEFAULT NULL,
  `penghasilan_ayah` varchar(20) DEFAULT NULL,
  `nm_ibu` varchar(40) DEFAULT NULL,
  `pekerjaan_ibu` varchar(40) DEFAULT NULL,
  `pendidikan_ibu` varchar(40) DEFAULT NULL,
  `status_ibu` char(1) DEFAULT NULL,
  `penghasilan_ibu` varchar(20) DEFAULT NULL,
  `alamat_ortu` varchar(40) DEFAULT NULL,
  `kd_pos_ortu` char(6) DEFAULT NULL,
  `telp_ortu` char(13) DEFAULT NULL,
  `jlh_tanggungan` varchar(10) DEFAULT NULL,
  `namawali` varchar(50) DEFAULT NULL,
  `pekwali` char(1) DEFAULT NULL,
  `pendwali` char(1) DEFAULT NULL,
  `pengwali` char(1) DEFAULT NULL,
  `alamatwali` varchar(100) DEFAULT NULL,
  `telpwali` varchar(13) DEFAULT NULL,
  `ukuran_jaket` char(5) DEFAULT NULL,
  `status_anak` char(1) DEFAULT NULL,
  `status_mhs` char(1) DEFAULT NULL,
  `penguji1` varchar(30) DEFAULT NULL,
  `penguji2` varchar(30) DEFAULT NULL,
  `status_potongan` int(11) DEFAULT NULL,
  `penguji_tesprogram` char(10) NOT NULL,
  `judul_skripsi` text,
  `dosenPA` char(10) DEFAULT NULL,
  `tgl_daftar` date NOT NULL,
  `status` char(1) NOT NULL,
  `dosen_pembimbing` char(10) NOT NULL,
  `no_ktp` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbmahasiswa`
--

INSERT INTO `tbmahasiswa` (`npm`, `nm_mhs`, `fakultas`, `kd_prodi`, `jk`, `agama`, `kewarganegaraan`, `jlh_bersaudara`, `status_sipil`, `tmpt_lahir`, `tgl_lahir`, `alamat`, `Foto`, `kodepos`, `telp`, `nm_sma`, `alamat_sma`, `kecamatan`, `kabupaten`, `kota`, `provinsi`, `thn_lulus`, `no_ijazah`, `tgl_ijazah`, `jlh_un`, `rataun`, `no_surat_pindah`, `tgl_surat_pindah`, `pt_asal`, `prog_studi_pindah`, `asal_sekolah`, `jenjang`, `sks_yang_diakui`, `no_ijazah_terkhir`, `nm_ayah`, `pekerjaan_ayah`, `pendidikan_ayah`, `status_ayah`, `penghasilan_ayah`, `nm_ibu`, `pekerjaan_ibu`, `pendidikan_ibu`, `status_ibu`, `penghasilan_ibu`, `alamat_ortu`, `kd_pos_ortu`, `telp_ortu`, `jlh_tanggungan`, `namawali`, `pekwali`, `pendwali`, `pengwali`, `alamatwali`, `telpwali`, `ukuran_jaket`, `status_anak`, `status_mhs`, `penguji1`, `penguji2`, `status_potongan`, `penguji_tesprogram`, `judul_skripsi`, `dosenPA`, `tgl_daftar`, `status`, `dosen_pembimbing`, `no_ktp`) VALUES
(' 15081001', 'IDE MONICA  SITEPU', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, NULL, '0000-00-00', '', '', ''),
('110840021', 'ALRY ROMIANTO TARIGAN', '08', '084', 'L', 'P', 'A', '5', 'B', '5', '2016-10-17', '5', NULL, '5', '5', '3', '3', '3', '3', '3', '3', '3', '3', '2016-10-17', 3, 3, '', '0000-00-00', '', '', '', '', 0, '', '4', '4', '3', '1', '1', '4', '5', '3', '1', '1', 'e', '4', 'e', '3', '', '', '', '', '', '', 'M', NULL, NULL, NULL, NULL, NULL, '', NULL, '0124126801', '0000-00-00', '1', '', ''),
('110840040', 'JUICO NAIBAHO', '08', '084', 'L', 'P', 'A', '1', 'B', '1', '2016-10-09', '1', NULL, '1', '1', '1', '1', '4', '4', '4', '4', '3', '4', '2016-10-18', 4, 3, '', '0000-00-00', '', '', '', '', 0, '', '4', '4', '3', '1', '1', 'e', '2', '4', '1', '1', '4', '4', 'e', '3', '', '', '', '', '', '', 'M', NULL, NULL, NULL, NULL, NULL, '', NULL, '0029097403', '0000-00-00', '1', '', ''),
('120840006', 'MANIUR PURBA', '08', '084', 'L', 'P', 'A', '1', 'B', '1', '2016-10-02', '1', 'UNIKA_anonymoxa.JPG', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2016-10-09', 1, 1, '', '0000-00-00', '', '', '', '', 0, '', '1', '2', '3', '1', '1', '2', '4', '4', '1', '1', '1', '1', '2', '1', '', '', '', '', '', '', 'M', '', NULL, NULL, NULL, NULL, '', NULL, '0126088202', '0000-00-00', '1', '', '12166334549367'),
('120840007', 'OKTO BERTUA AMANAEL SUMARSO', '08', '084', 'L', 'K', 'A', '1', 'B', '1', '2016-10-10', '1', 'UNIKA_IMG_20170116_145735_686.jpg', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2016-10-24', 1, 1, '', '0000-00-00', '', '', '', '', 0, '', '1', '1', '1', '1', '1', '1', '2', '2', '1', '1', '1', '2', '2', '1', '', '', '', '', '', '', 'L', '', NULL, NULL, NULL, NULL, '', 'PERANCANGAN DAN IMPLEMENTASI ENKRIPSI DAN DEKRIPSI FILE DENGAN ALGORITMA ONE TIME', '0126088202', '0000-00-00', '1', '0029097403', '1'),
('120840015', 'EKA PUTRA SIREGAR', '08', '084', 'L', 'P', 'A', '2', 'B', 'Desa pon', '2016-10-10', 'Dusun 1 pem.gunung desa Lubuk Saban kec.', 'UNIKA_14890313_1084782244971676_1047707421207254752_o.jpg', '1', '082276683068', 'SMA Negeri 1 pantai Cermin', '3', '3', '3', '3', '3', '3', '3', '2016-10-30', 3, 4, '', '0000-00-00', '', '', '', '', 0, '', '3', '3', '3', '1', '1', '3', '2', '3', '1', '1', 'e', '3', '3', '3', '', '', '', '', '', '', 'L', '', NULL, NULL, NULL, NULL, '', NULL, '0108117501', '0000-00-00', '1', '', '1218013105940003'),
('120840018', 'TOMMY MANDALA PUTRA S', '08', '084', 'L', 'P', 'A', '3', 'B', 'Kabanjahe', '1995-01-23', 'jln. cempaka raya,Gg cempaka raya baru, ', 'UNIKA_1488982104482_pp.jpg', '20132', '085761367980', 'SMA N 1 BARUSJAHE', 'desa sukajulu', 'barusjahe', 'karo', 'kabanjahe', 'sumatera utara', '2012', '1', '2016-10-24', 1, 1, '', '0000-00-00', '', '', '', '', 0, '', 'hasil sitepu', '2', '6', '1', '1', 'm br ginting', '1', '5', '1', '1', 'desa persadanta ujung bandar', '22132', '081375775289', '2', 'toto ginting manik', '6', '6', '1', 'jl. abdl hakim Gg setia no 26', '0618466486', 'L', '', NULL, NULL, NULL, NULL, '', NULL, '0108117501', '0000-00-00', '1', '', '1206032301950002'),
('120840024', 'DOAN BOBY RICKY RAJAGUKGUK', '08', '084', 'L', 'P', 'A', '5', 'B', 'Pematangsiantar', '2017-02-28', '1', 'UNIKA_IMG_20170323_125633.jpg', '6', '08116214155', '7', '7', '7', '7', '7', '7', '7', '7', '2016-10-16', 7, 7, '', '0000-00-00', '', '', '', '', 0, '', 'E rajagukguk', '8', '4', '1', '0', 'Emmi sidabutar', '2', '2', '1', '1', '3', '3', '3', '4', '', '', '', '', '', '', 'M', '', NULL, NULL, NULL, NULL, '', 'PENGAMANAN DATA DENGAN MENGGUNAKAN CIPHER GANDA ', '0108117501', '0000-00-00', '1', '0124126801', '123467899643'),
('120840053', 'HARIONO CM SILALAHI', '08', '084', 'L', 'P', 'A', '3', 'B', '3', '2016-10-02', '3', NULL, '3', '32432', '', 'Jln ,Tarutung ,No 49', 'Balige', 'Toba Samosir', '', '2', '2', '2', '2016-10-31', 3, 3, '', '0000-00-00', '', '', '', '', 0, '', '3', '3', '3', '1', '2', '4', '6', '6', '1', '1', '6', '5', '5', '5', '', '', '', '', '', '', 'L', '', NULL, NULL, NULL, NULL, '', NULL, '0125058003', '0000-00-00', '1', '', '2'),
('130810001', 'RAHMAT SYUKUR ELI LAHAGU', '08', '081', 'L', 'P', 'A', '5', 'B', 'Desa Lahagu', '1995-04-14', 'Jl.melati raya gang anyelir, Lonadi Hous', 'UNIKA_Screenshot_2017-01-26-10-07-55_com.instagram.android_1487741913303.jpg', '0', '082274080602', 'SMA NEGERI 3 GUNUNGSITOLI', 'Jl.Pendidikan', '', 'Nias', 'Gunungsitoli', 'Sumut', '2013', '3424', '2016-09-13', 85, 66, '', '0000-00-00', '', '', '', '', 0, '', 'Setifano Lahagu', '2', '6', '1', '3', 'Zosima Gulo', '1', '4', '1', '2', 'Desa Lahagu, Nias Barat', '0', '0', '5', '', '', '', '', '', '', 'S', 'L', 'A', NULL, NULL, NULL, '', 'PENGEMBANGAN SISTEM PEMBAYARAN REKENING AIR PADA DESA BANDAR BARU ', '0118127801', '0000-00-00', '1', '0116117302', '1204271404950001'),
('130810002', 'NOVI AYU LESTARI Br BANGUN', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0118127801', '0000-00-00', '', '', ''),
('130810003', 'SUPENA BURNIA HALAWA', '08', '081', 'P', 'P', 'A', '3', 'B', 'Laowo Hilimbaruzo', '1994-08-17', 'Prum. Puri Anom Asri Blok A no 19 ', 'UNIKA_34.jpg', '0', '085270515372', 'SMK NEGERI 1 IDANOGAWO', '0', 'IDANOGAWO', 'NIAS', 'Gunungsitoli', 'Sumatera Utara', '2012', '0', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Taogomano Halawa', '1', '3', '1', '2', 'Susiliana ', '1', '1', '2', '1', '0', '0', '0', '3 ', 'Metrianus Gulo', '6', '6', '2', 'Prum. Puri Anom Asri Blok A no 19 ', '082166103280', 'S', '', 'A', NULL, NULL, NULL, '', 'SISTEM INFORMASI INVENTARIS DI UNIVERSISTA S KATOLIK SANTO THOMAS MEDAN BERBASIS WEB', '0118127801', '0000-00-00', '1', '0114046501', '0'),
('130810004', 'EVI RATNA SARI MANURUNG', '08', '081', 'P', 'K', 'A', '4', 'B', 'Pekan Baru', '1995-10-06', 'Jalan Besar Unika', 'UNIKA_DSC01159.jpg', '228200', '085265713150', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', 0, 0, '', '0000-00-00', '0', '0', '0', '0', 0, '0', 'Lasman Manurung', '5', '4', '1', '2', 'Nurmala Sari Sihotang', '6', '4', '1', '2', 'Pekan Baru', '0', '0', '0', 'netti', '6', '2', '3', 'Jalan Besar Unika', '0', 'M', '', 'A', NULL, NULL, NULL, '', 'SISTEM PENJUALAN DAN PEMESANAN PADA TOKO SIJABAT ULOS BERBASIS ANDROID', '0118127801', '0000-00-00', '1', '0114046501', '34'),
('130810005', 'SURADITA GINTING', '08', '081', 'L', 'K', 'A', '3', 'B', 'medan', '1995-06-09', 'desa batu layang kecamatan sibolangit', NULL, '0', '085760877185', 'SMA SWASTA RK DELI MURNI BANDAR BARU', '0', 'SIBOLANGIT', 'DELI SERDANG', '0', 'SUMATRA UTARA', '2010', '0', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'REM GINTING', '6', '4', '1', '1', 'MAGDALENA BR TARIGAN', '6', '4', '1', '1', 'DESA BATULAYANG KECAMATAN SIBOLANGIT', '0', '085276888709', '2', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0118127801', '0000-00-00', '1', '', ''),
('130810006', 'PONTINUS PONTIAMAN GULO', '08', '081', 'L', 'K', 'A', '7', 'B', 'Orahili', '1995-08-06', 'Jalan setiabudi No. 479-f Tanjung sari, ', 'UNIKA_chelsea.jpg', '0', '081377220290', 'SMK Swasta Pemda Nias', 'Jalan pelita', '', '', 'Gunungsitoli', 'Sumatera Utara', '2013', '0', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Faoziduhu Gulo', '1', '1', '1', '2', 'Ramilia Gulo', '1', '1', '1', '1', 'Jalan Merdeka No. 33 Kec Gido, Kab Nias', '0', '0', '4 orang', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', 'PERANCANGAN MEDIA INFORMASI PENGENALAN KEBUDAYAAN NIAS SELATAN BERBASIS WEB ', '0118127801', '0000-00-00', '1', '0108117501', '1204060608950002'),
('130810007', 'DANIEL LUMBAN TOBING', '08', '081', 'L', 'P', 'A', '3', 'B', 'LUBUK PAKAM', '1995-09-02', 'Desa Bangun Sari Baru Tanjung Morawa', 'UNIKA_daniel.jpg', '0', '085362906392', 'SMA RK LUBUK PAKAM', 'JLN PEMATANG SIANTAR LUBUK PAKAM', 'LUBUK PAKAM', 'DELI SERDANG', 'MEDAN', 'SUMUT', '2013', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'POLTAK LUMBAN TOBING', '6', '4', '1', '2', 'MASRIONA SITOPU', '6', '4', '1', '2', 'DESA BANGUN SARI BARU TANJUNG MORAWA', '0', '082370307781', '3', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0118127801', '0000-00-00', '1', '', '1207020209950001'),
('130810008', 'ALFONSO MORKY SINAGA', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0118127801', '0000-00-00', '', '', ''),
('130810009', 'MITCHEL AGUSTINUS SETIAWAN HUTAURUK', '08', '081', 'L', 'K', 'A', '2', 'B', 'BATUSANGKAR', '1995-08-14', 'Jln.Bunga Rinte,Simpang Selayang', 'UNIKA_ry.jpg', '-', '081362631267', '-', '-', '-', '-', '-', '-', '-', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Drs.Aleksander Saroha Hutauruk.M.Si', '2', '7', '1', '3', 'Rosita Adelfina Simanjuntak', '8', '5', '1', '1', '-', '-', '081267225514', '2', '', '', '', '', '', '', 'L', '', 'A', NULL, NULL, NULL, '', 'SISTEM INFORMASI AKADEMIK SMA NEGERI 1 SIANJUR MULA MULA ', '0118127801', '0000-00-00', '1', '0124126801', '1304081408950001'),
('130810010', 'MARIANI SINAGA', '08', '081', 'P', 'K', 'A', '6', 'B', 'Pematangsiantar', '1996-02-22', 'Asrama Mahasiswi UNIKA St. Thomas', NULL, '0', '085373099916', 'SMK NEGERI 1 Pematangsiantar', '-', '-', 'simalungun', 'Pematangsiantar', 'Sumatera Utara', '2013', '0', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'G.  Sinaga', '1', '4', '1', '3', 'T. Simarmata', '1', '4', '1', '2', 'Jln. Sisingamangaraja, Pematangsiantar', '0', '0', '3', '-', '', '', '', '-', '-', 'M', '', 'A', NULL, NULL, NULL, '', 'SISTEM INFORMASI PENJUALAN PADA KARO RUMAH MODE DI SIMALINGKAR BERBASIS WEB', '0529067401', '0000-00-00', '1', '0529067401', ''),
('130810011', 'RAHAYU SIALLAGAN', '08', '081', 'P', 'K', 'A', '9', 'B', 'seilama', '1994-07-23', 'Tanjung sari medan', 'UNIKA_IMG_20170118_102812.jpg', '0', '082166585600', 'SMA SUASTA PANTI BUDAYA  ', 'KISARAN,jln durian', 'KISARAN BARAT', 'ASAHAN', 'KISARAN', 'SUMATERA UTARA', '2013', '0', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Albiner siallagan', '1', '3', '1', '2', 'Narmina silalahi', '1', '2', '1', '2', 'Sei lama dusun 7,kecamatan simpang 4', '0', '081370005305', '2', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0529067401', '0000-00-00', '1', '', '1209126307940006'),
('130810012', 'SENIMAN SITEPU', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0529067401', '0000-00-00', '', '', ''),
('130810013', 'ULINASA GINTING', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0529067401', '0000-00-00', '', '', ''),
('130810014', 'KRISTIN SIMANJORANG', '08', '081', 'P', 'K', 'A', '4', 'B', 'Kisaran', '1996-02-28', 'Jl Setia Budi,T.Sari Gg.Horas Medan', 'UNIKA_PHOTO.jpg', '0', '082166764988', 'SMA Swasta Methodist-2 Kisaran', 'Jl.Belibis ,No.47 Kisaran', 'Kisaran Barat', 'Asahan', 'Kisaran', 'Sumatera Utara', '2013', '0', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Emmanuel Mual Simanjorang', '6', '3', '1', '1', 'Juria Napitu', '6', '3', '1', '1', 'Jl.Belibis N0.47 Kisaran', '0', '082304263426', '1', '0', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', 'SISTEM INFORMASI PENJUALAN MAKANAN INDUSTRI RUMAHAN PADA UD. REZEKI BARU BERBASIS WEB', '0115027901', '0000-00-00', '1', '0124126801', '-'),
('130810015', 'CHANDRA COLIA', '08', '081', 'L', 'K', 'A', '2', 'B', 'Berastagi', '0000-00-00', 'Jln Flamboyan Raya Tanjung Sari Medan', 'UNIKA_14100521_765802320226665_2497866990118348275_n.jpg', '0', '082276086926', 'SMA DELI MURNI DELI TUA', 'Deli Tua', 'Deli Serdang', '', 'Medan', 'Sumtera Utara', '2012', '0', '0000-00-00', 0, 0, '', '0000-00-00', '0', '0', '', '0', 0, '', 'Persatuan Colia', '1', '3', '1', '2', 'Senen Br Bangun', '1', '4', '1', '2', 'Desa Kubu Colia , Kec Dolat Rakyat ', '0', '081360181403', '1', '0', '', '', '', '0', '0', 'L', '', 'A', NULL, NULL, NULL, '', 'SISTEM PENDUKUNG KEPUTUSAN PENERIMAAN BANTUAN DANA MISKIN PADA KABUPATEN KARO', '0115027901', '0000-00-00', '1', '0124126801', '1206143006940001'),
('130810016', 'MEI DINDA Br GINTING', '08', '081', 'P', 'P', 'A', '3', 'B', 'Medan', '1995-05-29', 'Jl.Pintu Air IV ', NULL, '0', '085361850417', 'SMA MULIA PRATAMA MEDAN', 'Jl.Jahe raya Perumnas Simalingkar', '0', '0', '0', '0', '2013', '0', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Martin Luther Ginting,Sth', '6', '6', '1', '1', 'R.Bangun', '6', '4', '1', '1', 'Jl.Pintu Air IV', '0', '085261810503', '3', '0', '', '', '', '0', '0', 'S', '', 'A', NULL, NULL, NULL, '', 'SISTEM INFORMASI PENJUALAN DAN PEMESANAN TIKET BERBASIS WEBSITE PADA CV.SIBAYAK TRANS TOUR DAN TRAVEL', '0115027901', '0000-00-00', '1', '0108117501', ''),
('130810017', 'IRA IKA YANA Br SEMBIRING', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0115027901', '0000-00-00', '', '', ''),
('130810018', 'JOCELYNE OKTAVINA SEMBIRING', '08', '081', NULL, NULL, NULL, '5', NULL, 'medan', '2016-10-17', 'JL.Nazir Alwi no 2 USU', NULL, '20154', '081260517530', 'SMA Swasta Kristen Immanuel Medan', 'JL.Slamet Ryadi no 1', '', '', 'Medan', 'Medan', '2012', 'DN-07 Ma 0000168', '2012-05-26', 42, 7, '', '0000-00-00', '', '', '', '', 0, '', 'Ir.Tanib sembiring cholia', '6', '7', '1', '5', 'Maria dewani tarigan', '6', '5', '1', '4', 'JL.Nazir Alwi no 2 USU', '20154', '0811611836', '2', '', '', '', '', '', '', 'M', NULL, 'A', NULL, NULL, NULL, '', 'SISTEM INFORMASI PENJUALAN DAN PEMESANAN BARANG PADA PINTERA KREATIV BARBASIS ANDROID', '0115027901', '0000-00-00', '1', '0122107901', ''),
('130810019', 'JOSEPHINE OKTAVIRA SEMBIRING', '08', '081', '', 'P', '', '0', 'B', 'Medan', '2016-10-17', '0', NULL, '20154', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', 0, 0, '', '2016-10-18', '0', '0', '0', '0', 0, '0', '0', '2', '8', '1', '3', '0', '7', '7', '1', '3', '0', '00', '0', '0', '0', '7', '8', '3', '0', '0', 'M', '', 'A', NULL, NULL, NULL, '', 'SISTEM INFORMASI PENJUALAN BARANG DAN JASA PADA STUDIO PHOTO TOPAZ HEXAGON MEDAN BERBASIS WEB', '0115027901', '0000-00-00', '1', '0529067401', ''),
('130810020', 'MEI YANTI PANJAITAN', '08', '081', 'P', 'P', 'A', '4', 'B', 'Medan ', '1995-05-03', 'jl.perjuangan dusun IV desa sigara-gara ', NULL, '0', '085270772106', 'SMA YAPIM MEDAN', 'jl.air bersih no 69 medan', 'Patumbak', 'Deli serdang', 'Medan', 'Sumatera Utara', '2013', '0', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Aliper Panjaitan', '6', '2', '1', '1', 'Rosida Butar-butar', '6', '2', '1', '1', 'Jl.perjuangan I dusun IV', '0', '081264080885', '1', '', '', '', '', '', '', 'S', '-', 'A', NULL, NULL, NULL, '', 'APLIKASI PENGOLAHAN DATA PENYEWAAN GEDUNG PADA CATHOLIC CENTER MEDAN BERBASIS WEB', '0115027901', '0000-00-00', '1', '0115027901', '1207214305950001'),
('130810021', 'ERTA KARTINI', '08', '081', NULL, NULL, NULL, '5', NULL, 'Dumai', '1995-04-12', 'Jalan Setia Budi No.484 Tanjung Sari Med', NULL, '0', '085270439440', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', 0, 0, '', '2016-10-11', '0', 's', '0', 'SI', 0, '0', 'P.SIRAIT', '1', '4', '1', '2', 'Sariati Tambunan', '8', '4', '1', '2', 'Dumai', '0', '0', '0', 'ida', '8', '4', '2', 'Jalan setia budi no.484', '0', 'M', NULL, 'A', NULL, NULL, NULL, '', 'PERANCANGAN SISTEM INFORMASI WISATA KULINER DI KOTA MEDAN BERBASIS WEB', '0115027901', '0000-00-00', '1', '0125058003', ''),
('130810022', 'DODY ISKANDAR', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0115027901', '0000-00-00', '', '', ''),
('130810023', 'ROMA ITO MAGDALENA ', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0115027901', '0000-00-00', '', '', ''),
('130810024', 'TRI DITTO IMAN PUTRA WARUWU', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0115027901', '0000-00-00', '', '', ''),
('130810025', 'MASRAN GULTOM', '08', '081', 'L', 'k', 'A', '5', 'B', 'pondok bulu', '0199-01-11', 'jl. pemda Gg. anyelir', NULL, '21173', '085362208254', 'SMA RK BINTANG TIMUR Psiantar', 'Jln. marimbun no.5, Toba,siantar selatan,kota pemantang siantar,sumatera utara', '', '', '', 'Sumatera Utara', '2012', '0', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'BASIRUN GULTOM', '6', '4', '1', '3', 'NURSITI TURNIP', '1', '4', '1', '2', 'PONDOK BULU', '21173', '081376109968', '4', '', '', '', '', '', '', 'L', '', 'A', NULL, NULL, NULL, '', 'SISTEM INFORMASI KOST DIKOTA MEDAN BERBASIS WEB', '0115027901', '0000-00-00', '1', '0114046501', ''),
('130810026', 'ADESAH PUTRA SEMBIRING', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0116117302', '0000-00-00', '', '', ''),
('130810027', 'JHONNY PANGGABEAN', '08', '081', 'L', 'P', 'A', '3', 'B', 'Tarutung', '1996-10-19', 'Jalan Setia Budi Gg.Horas Medan', NULL, '20132', '081396271042', 'SMA SW HKBP PARAPAT', 'Jalan Bukit Barisan Parapat', 'Girsang Sipangan Bolon', 'Simalungun', 'Parapat', 'Sumatera Utara', '2013', '-', '2013-07-01', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Jinton Panggabean', '7', '4', '1', '2', 'K.Lumban Batu', '8', '5', '2', '1', 'Jalan Pembangunan No.35 Ajibata', '21174', '-', '3', '', '', '', '', '', '', 'S', '', 'A', NULL, NULL, NULL, '', NULL, '0116117302', '0000-00-00', '1', '', '1212081910960002'),
('130810028', 'IRPAN SAMUEL TAMBA', '08', '081', 'L', 'P', 'A', '5', 'B', 'Doloksanggul', '1996-01-28', 'Ngumban surbakti, Jl.melatirayaI ,Tanjun', NULL, '0', '085277296167', 'SMA Negeri 1 Dolok Sanggul', 'Purba Manalu', 'Dolok Sanggul', 'Humbang Hasundutan', 'Dolok Sanggul', 'Sumatera Utara', '2013', '0', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'K Tamba', '6', '4', '1', '2', 'J Tampubolon', '2', '5', '1', '1', 'Purba Manalu ', '0', '0', '5', 'U Tampubolon', '5', '6', '1', 'Ngumban Surbakti, Jl.melatirayaI ,Tanjung sari ,Medan Selayang', '0', 'M', '', 'A', NULL, NULL, NULL, '', 'SISTEM INFORMASI PENJULAN DAN PEMESANAN SPAREPART SEPEDA MOTOR DI TOKO SAUDARA JAYA MOTOR BERBASIS WEB', '0116117302', '0000-00-00', '1', '0029097403', '1216062801960003'),
('130810029', 'SIMON PETRUS DACHI', '08', '081', 'L', 'P', 'A', '4', 'B', 'Bukittinggi', '1994-06-14', 'jalan sunggal', NULL, '20128', '082368099319', 'SMA N 1 Telukdalam', 'Jl.Golkar', 'Pasar Telukdalam', 'Nias selatan', '', 'SUMATERA UTARA', '2013', '0', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Marthin Luther Dachi', '4', '6', '1', '4', 'Yuliana Hondro', '6', '4', '1', '4', 'Jl.Golkar', '20128', '082368099319', '3', '', '', '', '', '', '', 'L', '', 'A', NULL, NULL, NULL, '', NULL, '0116117302', '0000-00-00', '1', '', '1214061406940007'),
('130810030', 'GLOVANE ALBERTUS NADEAK', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0116117302', '0000-00-00', '', '', ''),
('130810031', 'SULASTRI LUMBANTORUAN', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0116117302', '0000-00-00', '', '', ''),
('130810032', 'MELISA RACHEL HUTAGALUNG', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0116117302', '0000-00-00', '', '', ''),
('130810033', 'ROBBY MUNTHE', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0116117302', '0000-00-00', '', '', ''),
('130840001', 'FERDINAND TANDI GAMA', '08', '084', 'L', 'K', 'A', '4', 'B', 'Dili, Timor Leste', '1995-02-02', 'Perumahan PemdaTk II. Jln. Teratai Kanan', 'UNIKA_10354181_839745582723788_511325994267561227_n.jpg', '75611', '085358655101', 'SMAN 2 Sangatta Utara', 'Jln. Soekarno Hatta', 'Sangatta Utara', 'Kutai Timur', 'Sangatta', 'Kalimantan Timur', '2013', '8197231212312', '2013-04-10', 0, 29, '', '0000-00-00', '', '', '', '', 0, '', 'Herman R. Tandiayu\'', '8', '4', '1', '4', 'Benedikta Theresia Gama', '6', '4', '1', '1', 'Jln. Pattimura Gg. Nuri no.46', '75611', '877876543567', '4', 'Fr. Cancio Da Costa Gama', '8', '4', '', 'Jln. Soposurung Balige', '', 'L', '', 'A', NULL, NULL, NULL, '', 'PERANCANGAN REPOSITORY MENGGUNAKAN PROTOKOL JSON BERBASIS ANDROID DAN PHP', '0029097403', '0000-00-00', '1', '0108117501', '098654567898765'),
('130840002', 'NICOLAS PUTRA HUTAGALUNG', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0029097403', '0000-00-00', '', '', ''),
('130840003', 'ALFANDY PANGESTU', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0029097403', '0000-00-00', '', '', ''),
('130840004', 'JEFRI SIAGIAN', '08', '084', 'L', 'K', 'A', '4', 'B', 'B.BATU', '1994-08-23', 'JLN HARMONIKA P.BULAN', 'UNIKA_1477529_624718504253841_1119217772_n.jpg', '123456', '082370448523', 'SMK CINTA RAKYAT', 'PEMATANG SIANTAR', 'SIANTAR', 'SIMALUNGUN', 'SIANTAR', 'SUMATRA UTARA', '2013', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'R.SIAGIAN', '6', '4', '2', '2', 'H.SINURAT', '6', '4', '1', '2', 'BP.MANDOGE KAB. ASAHAN', '-', '-', '4', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', 'SISTEM PENENTUAN KELAYAKAN NASABAH PENERIMAAN PINJAMAN PADA KOPERASI SAROHA BP.MANDOGE MENGGUNAKAN FUZY TSUKAMOTO ', '0029097403', '0000-00-00', '1', '0111067801', '1209172808940002'),
('130840005', 'JAKA SEHTANTA TARIGAN', '08', '084', 'L', 'P', 'A', '1', 'B', '1', '2016-10-09', '1', NULL, '1', '1', '2', '2', '2', '2', '3', '3', '3', '1', '2016-10-24', 2, 2, '', '0000-00-00', '', '', '', '', 0, '', '2', '3', '3', '1', '1', '2', '3', '3', '1', '1', '3', '3', '3', '3', '', '', '', '', '', '', 'L', '', 'A', NULL, NULL, NULL, '', NULL, '0029097403', '0000-00-00', '1', '', ''),
('130840006', 'YOHANES PANGARIBUAN', '08', '084', 'L', 'K', 'A', '4', 'B', 'Bengkulu', '1996-02-16', 'Jl. Flamboyan Raya, Gg. Bersama, Lorong ', 'UNIKA_jo.jpg', '20132', '082276526521', '-', '-', '-', '-', '-', '-', '-', '-', '0000-00-00', 0, 0, '', '0000-00-00', '-', '-', '-', '-', 0, '-', 'Aripin Pangaribuan', '1', '4', '1', '2', 'Dumaria Simanjuntak', '1', '3', '1', '2', 'Onanrunggu III, Kec. Sipahutar, Taput', '22471', '081397604839', '4', '-', '', '', '', '-', '-', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0029097403', '0000-00-00', '1', '', '-'),
('130840007', 'ANIRMA KANDIDA Br GINTING', '08', '084', 'P', 'K', 'A', '5', 'B', 'Delitua', '1995-09-13', 'Dusun I Talun Kenas, Kec. STM Hilir', 'UNIKA_IMG_7995.JPG', '20363', '085830935680', 'SMA RK Deli Murni Delitua', '-', 'STM Hilir', 'Deli Serdang', 'Medan', 'Sumatera Utara', '2013', '0', '2016-10-06', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Damel Paulus Ginting', '1', '4', '1', '3', 'Sempa Kata Gurusinga', '6', '2', '1', '3', 'Dusun I Talun Kenas, Kec. STM Hilir', '20363', '085261021805', '3', '', '', '', '', '', '', 'S', '', 'A', NULL, NULL, NULL, '', 'PENERAPAN ALGORITMA DFS DAN ALGORITMA FISHER YATES PADA EDUGAME OPERASI HITUNG ', '0029097403', '0000-00-00', '1', '0108117501', '0'),
('130840008', 'SAHAT MARTUA NAIPOSPOS', '08', '084', 'L', 'P', 'A', '4', 'B', 'porsea', '1995-07-24', 'Jl.flanboyan gg duku no. 8D', NULL, '20132', '081275426739', 'SMK Taruna Persada Dumai', 'Jl. Raja Ali haji purnama ', 'Dumai Barat', 'Dumai', 'Dumai', 'Riau', '2013', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Saunur Naipospos', '6', '4', '1', '4', 'Rusalan Simanjuntak', '6', '4', '1', '3', 'Jl.Raja Ali haji Purnama', '-', '-', '4 ', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', 'PENERAPAN KRIPTOGRAFI MENGGUNAKAN ALGORITMA RSA DAN VIGENERE CHIPER PADA DATABASE', '0029097403', '0000-00-00', '1', '0126088202', ''),
('130840009', 'EPO DESTANTO MANURUNG', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0029097403', '0000-00-00', '', '', ''),
('130840010', 'FERNANDO T. G. MANURUNG', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0029097403', '0000-00-00', '', '', ''),
('130840011', 'MAGDALENA JULIATI TURNIP', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0029097403', '0000-00-00', '', '', ''),
('130840012', 'SRI RAMA DANI Br KARO', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0029097403', '0000-00-00', '', '', ''),
('130840013', 'RITA SORTARIA MARUNDURI', '08', '084', 'P', 'P', 'A', '8', 'B', 'sirombu', '1992-11-12', 'jl.melati raya Tanjung Sari', 'UNIKA_3x4.jpg', '20132', '085370804699', 'sma negeri 1 sirombu', '--', '--', '--', '--', '--', '--', '--', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'fangatulo marunduri', '1', '4', '1', '1', 'yunima maru\'ao', '1', '1', '1', '1', 'nias', '22863', '082161005086', '4', '--', '', '', '', '', '', 'S', '', 'A', NULL, NULL, NULL, '', NULL, '0029097403', '0000-00-00', '1', '', '1204095211930001'),
('130840014', 'DAMIAN ROY DARLIN SIMBOLON', '08', '084', 'L', 'K', 'A', '4', 'B', 'Sibabi Atas', '1994-11-07', 'Jl.Setia Budi Gg.GBKP', 'UNIKA_IMG_20161217_132324.jpg', '-', '082304078617', '-', '-', '-', '-', '-', '-', '-', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', '-', '1', '6', '1', '1', '-', '3', '2', '1', '1', '-', '-', '-', '-', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', 'PENYISIPAN PESAN PADA FILE MP3 MENGGUNAKAN METODE LSB DAN ALGORITMA TARNSPOSITION CHIPER', '0029097403', '0000-00-00', '1', '0111067801', '165120711930009'),
('130840015', 'LAMMA NARMIAN', '08', '084', 'P', 'K', 'A', '7', 'B', 'Laerambong', '1995-01-07', 'Jln.Seikapuas No 113 Medan Sunggal', 'UNIKA_3x4 2 copy.jpg', '22211', '082294292509', 'SMK Anugerah Parulian ', 'Jln.Sidikalang-Medan Panji Bako', 'Sitinjo', 'Dairi', 'Sidikalang', 'Sumatera Utara', '2013', '---', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Tumpal Gideon Sihotang', '1', '4', '1', '1', 'Surta Sinaga', '1', '2', '1', '1', 'Sidikalang', '22211', '085260183505', '3', 'Berlin Sinaga', '8', '4', '2', 'Jln.Seikapuas No 113 Medan Sunggal', '082272162058', 'M', '', 'A', NULL, NULL, NULL, '', 'PERBANDINGAN ALGORITMA KRIPTOGRAFI TRANSPOSITION DAN ELGAMA PADA PENGAMANAN FILE TEKS', '0126088202', '0000-00-00', '1', '0029097403', '1211054701950001'),
('130840016', 'FRENGKY PERNANDO M', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0126088202', '0000-00-00', '', '', ''),
('130840017', 'MARTIN SIMBOLON', '08', '084', NULL, NULL, NULL, '1', NULL, '1', '2016-10-17', '1', NULL, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2016-10-31', 1, 1, '', '0000-00-00', '', '', '', '', 0, '', '2', '2', '3', '1', '1', '3', '5', '4', '1', '1', '44', '3', '4', '3', '', '', '', '', '', '', 'M', NULL, 'A', NULL, NULL, NULL, '', NULL, '0126088202', '0000-00-00', '1', '', ''),
('130840018', 'SIMON PETRUS  SIJABAT', '08', '084', NULL, NULL, NULL, '8', NULL, 'medan', '1994-11-14', 'jln.bakti no 25  gaperta ujung', NULL, '-', '081397989385', 'smp swasta persiapan', '-', '-', '-', 'medan', 'sumatra utara', '2010', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'K.Sijabat', '6', '4', '2', '2', 'A Br Sipahutar', '6', '3', '1', '2', 'jln.bakti no 25  gaperta ujung', '-', '081265605022', '8 orang', '', '', '', '', '', '', 'XL', NULL, 'A', NULL, NULL, NULL, '', NULL, '0126088202', '0000-00-00', '1', '', ''),
('130840019', 'HERTIKA YUNI ASTI SINAGA', '08', '084', 'P', 'P', 'A', '7', 'B', 'Pardamaran', '1995-07-28', 'jl setia budi gg horas tj sari ', 'UNIKA_img340.jpg', '20132', '081362996690', '--', '--', '--', '--', '', '--', '--', '--', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Perim Sinaga', '1', '4', '2', '1', 'Juliana Panggabean', '1', '4', '1', '1', 'Pulau Rakyat Tua dsn X Asahan', '21273', '081260537562', '1', '', '', '', '', '', '', 'S', '', 'A', NULL, NULL, NULL, '', 'PENGAMANAN PADA CITRA DIGITAL DENGAN PENGGUNAKAN METODE LEAST SIGNIFICANT BIT DAN END OF FILE', '0126088202', '0000-00-00', '1', '0126088202', 'Ga'),
('130840020', 'TIMBUL FRANSISCUS NADEAK', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0126088202', '0000-00-00', '', '', ''),
('130840021', ' MAROI HENRI WIJAYA GINTING', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0126088202', '0000-00-00', '', '', ''),
('130840022', ' ELVRIKO GULTOM', '08', '084', 'L', 'K', 'A', '4', 'B', 'Butar-Butar', '1993-08-28', 'Jln.Plamboyan raya Simpang Pemda', 'UNIKA_tmp_25183-Untitled-1e-1909247256.jpg', '20132', '085358655504', '12-12-2010', 'butar-butar', 'onanrunggu', 'samozir', 'samosir', 'sumut', '2010', '-00987755456u', '2016-10-12', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', '-', '1', '3', '1', '3', '-', '1', '2', '1', '3', 'Samosir', '-', '-', '-', 'BIBI KARO', '6', '5', '5', 'Tanjung Sari simpang pemda', '085267127876', 'M', '', 'A', NULL, NULL, NULL, '', 'PERANCANGAN DAN IMPLEMENTASI ENKRIPSI DAN DESKRIPSI FILE TEKS DENGAN ALGORITMA KOMBINASI CAESAR-RSA', '0126088202', '0000-00-00', '1', '0125058003', '1217092808930003'),
('130840023', 'MING-MING EUNIKE Br HOMBING', '08', '084', 'P', 'P', 'A', '3', 'B', 'SEI INTAN', '1995-06-03', 'jl.setiabudi gg.horas 14', 'UNIKA_17198299_1302013293201792_730837535_n.jpg', '20132', '082360796953', 'sma sriwijaya ', '--', '--', '--', '--', '--', '--', '--', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'P.M  Sihombing', '3', '4', '1', '3', 'D.E br.simanjuntak', '1', '3', '1', '1', 'Sei intan', '20132', '082360796953', '1', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0126088202', '0000-00-00', '1', '', '1406144306950002'),
('130840024', 'ROHANI SUFI YANTI SIMBOLON', '08', '084', 'P', 'K', 'A', '5', 'B', 'Pematang Durian Kec.Pantai Cermin', '1994-07-04', 'Jln.Setia Budi Tanjung Sari', 'UNIKA_IMG_20170316_094529.jpg', '20133', '082274397485', '--', '--', '--', '', '', '--', '--', '--', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Jengki Johannes Simbolon', '1', '3', '1', '1', 'Risma Uli Tampubolon', '1', '3', '1', '1', 'Pantai cermin', '24673', '081370014068', '5', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', 'PENGAMANAN DATA DENGAN MENGGUNAKAN TEKNIK KRIPTOGRAFI PUBLIC RSA DAN KNAPSACK', '0126088202', '0000-00-00', '1', '0125058003', '1218014407940006'),
('130840025', 'ROY DAHWAN', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0126088202', '0000-00-00', '', '', ''),
('130840026', ' ALLOY PINDO SITINJAK', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0126088202', '0000-00-00', '', '', ''),
('130840027', 'AYU JULIANTI E.S', '08', '084', 'P', 'K', 'A', '4', 'B', 'Binjai', '1996-03-29', 'Jln Soekarno Hatta No 157 Binjai', 'UNIKA_ayu1.jpg', '20731', '085274286242', 'SMA Negri 1 Binjai', 'Jl. Mongonsidi, No 10 Satria, Binjai Kota', 'Binjai Kota', 'Langkat', 'Kota Binjai', 'Sumatera Utara', '2013', '-', '2016-10-01', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', '-', '6', '4', '1', '1', '-', '8', '6', '1', '1', 'Jl Soekarno Hatta No 157 Binjai', '20731', '0', '4 orang', '', '', '', '', '', '', 'S', '', 'A', NULL, NULL, NULL, '', 'PENERAPAN ALGORITMA LINIER CONGRUENT METHOD DAN FLOOD FILL PADA PERANCANGAN APLIKASI EDUGAME', '0111067801', '0000-00-00', '1', '0116117302', '-'),
('130840028', 'DEVISABAS ALFRENDDY SINAGA', '08', '084', 'L', 'K', 'A', '6', 'B', 'LUMBAN LINTONG', '1995-12-05', 'JLN PLAMBOYAN RAYA TANJUNG SARI MEDAN', 'UNIKA_IMG_20160817_154251.jpg', '20132', '082360204024', 'SMK SWASTA PERSIAPAN', 'JLN PANE', '-----', 'SIMALUNGUN', 'PEMATANG SIANTAR', 'SUMATRA UTARA', '-', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'LAMBOK SIANAGA', '1', '3', '1', '1', 'TIURMA HUTAPEA', '1', '4', '1', '1', 'LUMBAN LINTONG', '21182', '085276215742', '2', '', '', '', '', '', '', 'XL', '', 'A', NULL, NULL, NULL, '', NULL, '0111067801', '0000-00-00', '1', '', '1208184512950001'),
('130840029', 'JHON VERY PARDAMEAN ', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0111067801', '0000-00-00', '', '', ''),
('130840030', 'JAMUDA MANURUNG', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0111067801', '0000-00-00', '', '', ''),
('130840031', 'THOMAS JUNANTA GINTING', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0111067801', '0000-00-00', '', '', ''),
('130840032', 'TAMEL TARIGAN', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0111067801', '0000-00-00', '', '', ''),
('130840033', 'ANDREIYA ISWAN FIRJAY BARUS', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0111067801', '0000-00-00', '', '', ''),
('130840034', 'NATALIA FLORIDA Br GINTING', '08', '084', 'P', 'P', 'A', '4', 'B', 'Sumbul', '1992-12-12', 'Jl. Setia budi No.485 Tanjung sari Medan', 'UNIKA_IMG_6134.jpg', '20132', '087748542663', 'SMA NEGERI 1 KABANJAHE', '-', 'Kabanjahe', 'Karo', '-', 'Sumatera utara', '-', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Raskami Ginting', '1', '4', '2', '1', 'Lina Medya Wati br Sitepu', '1', '3', '1', '1', 'Jl. Jamin Ginting Desa Sumber Mufakat ', '-', '085359358307', '3', '-', '', '', '', '-', '-', 'S', '', 'A', NULL, NULL, NULL, '', 'ANALISIS PERBANDINGANN RSA DENGAN BASE64', '0111067801', '0000-00-00', '1', '0122107901', '1206014107930201'),
('130840035', 'NORA SOVIANA SIMARMATA', '08', '084', 'P', 'K', 'A', '5', 'B', 'Tanjung Beringin', '1994-10-19', 'Jln.Setia Budi Tanjung Sari', 'UNIKA_5034 Nora.JPG', '20132', '082370956055', 'SMK CINTA RAKYAT', 'Pematanng Siantar', 'Marihat', '', 'Pematanng Siantar', 'Sumatera Utara', '2013', '--', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'HOTMAN SIMARMATA', '1', '4', '1', '1', 'BERNADETTA SIPAYUNG', '1', '4', '1', '1', 'Tanjung Beringin Sumbul, Sidikalang', '28812', '081260490263', '5', '', '', '', '', '', '', 'S', '', 'A', NULL, NULL, NULL, '', 'PENGAMANAN BASIS DATA DENGAN ALGORITMA RSA ', '0111067801', '0000-00-00', '1', '0124126801', '1211025910940002'),
('130840036', 'EGIA FALENTINO GINTING', '08', '084', NULL, NULL, NULL, '2', NULL, 'PEMATANG SIANTAR ', '1995-02-14', 'JLN.BUNGA MAWAR 8 PASAR V PADANG.BULAN M', NULL, '14022', '081265014838', 'SMA SANTO PETRUS MEDAN', 'JLN.LUKU 1 A.H NASUTION MEDAN', 'MEDAN SELAYANG', 'DELISERDANG', 'MEDAN', 'SUMATRA UTARA', '2012', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'E.D GINTING', '1', '6', '1', '2', 'R GIRSANG', '1', '6', '1', '2', 'JLN.KEMAJUAN SARIBUDOLOK SIMALUNGUN', '-', '08129394134', '1', 'R GINTING', '6', '4', '2', 'JLN.BUNGA MAWAR 8 PASAR V PADANG BULAN MEDAN', '081263383760', 'L', '', 'A', NULL, NULL, NULL, '', 'IMPLEMENTASI FUZZY LOGIC DALAM PEMILIHAN LEMBAGA KURSUS TERBAIK DIKOTA MEDAN', '0111067801', '0000-00-00', '1', '0111067801', ''),
('130840037', 'SANRI FIER SIRAIT', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0111067801', '0000-00-00', '', '', ''),
('130840038', 'LEONARDO SAGALA ', '08', '084', NULL, NULL, NULL, '3', NULL, 'Sait buntu', '1995-07-18', 'Jalan setia budi tanjung sari Medan', 'UNIKA_10259806_658835750851091_6413692756768676478_n.jpg', '20132', '082189378678', 'SMA SWASTA RK BINTANG TIMUR', 'PEMATANG SIANTAR', 'SIANTAR SELATAN', '-', 'KOTA PEMATANG SIANTAR', 'Sumatera Utara', '2013', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'POSMAN SAGALA', '2', '4', '1', '2', 'KINNA SILALAHI', '2', '5', '1', '3', 'SAIT BUTTU SARIBU ', '-', '081361766120', '3', '', '', '', '', '', '', 'L', '', 'A', NULL, NULL, NULL, '', 'IMPLEMENTASI TINY ENCRIPTION ALGORIYMA(TEA) UNTUK KEAMANAN SMS PADA MOBILE PHONE ', '0111067801', '0000-00-00', '1', '0118127801', ''),
('130840039', 'JIMMI GULTOM', '08', '084', 'L', 'P', 'A', '5', 'B', 'medan', '0000-00-00', 'jln.belanga no.25a', 'UNIKA_11027975_993443104023396_7116888193644080324_n.jpg', '211120', '083197761171', 'ypi amir hamzah', '-', '-', '-', '-', 'Sumatera Utara', '2011', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'nasib gultom', '6', '4', '1', '1', 'riana nababan', '8', '2', '1', '1', 'jln.helvetia medan', '212011', '083197761171', '1', '', '6', '4', '2', 'jln.belanga.25a', '', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0125058003', '0000-00-00', '1', '', '1271193004960002'),
('130840040', 'HAYCASKO SIRINGO RINGO ', '08', '084', NULL, NULL, NULL, '4', NULL, 'sukandebi', '1995-09-06', 'jl.setia budi gg.horas', 'UNIKA_12510256_1021089871288384_7425096552377758788_n.jpg', '20132', '082272565922', 'SMK ANUGERAH', 'SUKANDEBI', 'TIGALINGGA', 'DAIRI', 'TIGALINGGA', 'SUMATERA UTARA', '2013', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'MARKUS SIRINGO RINGO', '6', '4', '1', '3', 'LIDIA SIMANJUNTAK', '2', '6', '1', '3', 'SUKANDEBI', '22252', '085272561253', '4', '', '', '', '', '', '', 'L', '', 'A', NULL, NULL, NULL, '', 'GO FAST DENGAN ALGORITMA DJIKSTRA', '0125058003', '0000-00-00', '1', '0115027901', ''),
('130840041', 'ADY SUHARDIMAN SITANGGANG', '08', '084', NULL, NULL, NULL, '4', NULL, 'lumban ganda', '1994-05-05', 'jln.flamboyan raya tanjung sari', 'UNIKA_ady.jpg', '20132', '08538069991', 'SMA KATOLIK 1 KABANJAHE', 'jln.irian', 'kabanjahe', 'karo', 'kabanjahe', 'sumatera utara', '2013', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'J.Sitanggang', '1', '4', '1', '1', 'S br.malau', '1', '4', '1', '1', 'tanjung beringin kec.sumbul kab.dairi', '22281', '085361973477', '4 orang', '', '', '', '', '', '', 'S', '', 'A', NULL, NULL, NULL, '', NULL, '0125058003', '0000-00-00', '1', '', ''),
('130840042', 'MANGISI PARULIAN', '08', '084', 'L', 'P', 'A', '8', 'B', 'Pardamean', '1994-12-08', 'Jl.Griya Asam Kumbang Perumahan Torganda', 'UNIKA_10275592_653435278089081_2384037492220549315_o.jpg', '20133', '082136510616', 'SMK YP Parbina Nusantara Pematangsiantar', 'Jl.Lingga No.32 Pematangsiantar', 'Siantar Selatan', 'Kota Pematangsiantar', 'Pematangsiantar', 'Sumatera Utara', '2013', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Antoni Situmorang', '1', '4', '2', '2', 'Naorta Tamba', '1', '3', '1', '2', 'Pardamean - Kutacane Aceh Tenggara', '24673', '082274617177', '4', 'Jimmy B.P imangunsong', '5', '6', '4', 'Jl.Griya Asam Kumbang Perumahan Torganda Blok E No.33', '081370247829', 'M', '', 'A', NULL, NULL, NULL, '', 'PENGAMANAN FILE TEKS DENGAN MENGGUNAKAN METODE ENHANCED LSB STEGANOGRAFI (4 BIT)', '0125058003', '0000-00-00', '1', '0125058003', '1102060812940001'),
('130840043', 'DANNY LUMBAN GAOL', '08', '084', 'L', 'P', 'A', '5', 'B', 'Lumban Hariara', '1994-05-06', 'Perumahan Pemda TK II, Jln. Teratai Kana', 'UNIKA_uivlbjhbklhoij.jpg', '-', '082312806651', 'SMA NEGERI 1 POLLUNG', '-', 'Pollung', 'Humbang Hasundutan', '-', 'Sumatera Utara', '2012', '-', '0000-00-00', 0, 0, '-', '0000-00-00', '-', '-', '-', '-', 0, '-', 'Jekiman Lumban Gaol', '1', '2', '1', '1', 'Tinurbaya Silaban', '1', '3', '1', '1', 'Dolok Sanggul Sumatera Utara', '-', '-', '2', '', '', '', '', '-', '-', 'M', '-', 'A', NULL, NULL, NULL, '', 'APLIKASI MONITORING KEHADIRAN MAHASISWA BERBASIS SMS GATEWAY', '0125058003', '0000-00-00', '1', '0118127801', '1216020605940003'),
('130840044', 'HENDRA SIGALINGGING', '08', '084', 'L', 'P', 'A', '5', 'B', 'Dusun', '1995-08-24', 'Jalan setia budi tanjung sari Medan', 'UNIKA_20170213_120533.jpg', '20132', '085296422496', 'SMA NEGERI 1 PARBULUAN', ' 	JLN SISINGAMANGARAJA KM. 20 PARBULUAN ', 'Parbuluan', 'Dairi', 'Sidikalang', 'Sumatera Utara', '2013', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Sopar Sigalingging', '1', '3', '1', '3', 'Nurlina Nainggolan', '1', '4', '1', '2', 'Jalan Dolok Sanggul', '22282', '081260881065', '3', '-', '', '', '', '-', '-', 'XL', '-', 'A', NULL, NULL, NULL, '', 'APLIKASI MENERJEMAHAN UCAPAN KE TEKS PADA PERANGKAT ANDROID', '0125058003', '0000-00-00', '1', '0111067801', '-'),
('130840045', 'MICHAEL SIMBOLON', '08', '084', NULL, NULL, NULL, '5', NULL, 'Pantai Cermin', '1995-09-20', 'Pantai cermin,Kuala-lama dusun IX', 'UNIKA_mie.jpg', '20987', '085977366051', 'SMA NEGRI 1 PERBAUNGAN', 'KUALA LAMA DUSUN IX PANTAI CERMIN', 'PANTAI CERMIN', 'SERDANG BEDAGAI', 'MEDAN', 'SUMATRA UTARA', '2013', '09837492', '2013-10-02', 80, 85, '', '0000-00-00', '', '', '', '', 0, '', 'Arifin Simbolon', '1', '4', '1', '2', 'Lisda br Sihombing', '1', '4', '1', '1', 'kuala lama dusun IX', '20987', '-', '5', '', '', '', '', '', '', 'M', NULL, 'A', NULL, NULL, NULL, '', 'EDUGAME UNTUK PEMBELAJARAN SEJARAH PAHLAWAN BATAK MENGGUNAKAN ALGORITMA FISHER-YATES', '0125058003', '0000-00-00', '1', '0122107901', '');
INSERT INTO `tbmahasiswa` (`npm`, `nm_mhs`, `fakultas`, `kd_prodi`, `jk`, `agama`, `kewarganegaraan`, `jlh_bersaudara`, `status_sipil`, `tmpt_lahir`, `tgl_lahir`, `alamat`, `Foto`, `kodepos`, `telp`, `nm_sma`, `alamat_sma`, `kecamatan`, `kabupaten`, `kota`, `provinsi`, `thn_lulus`, `no_ijazah`, `tgl_ijazah`, `jlh_un`, `rataun`, `no_surat_pindah`, `tgl_surat_pindah`, `pt_asal`, `prog_studi_pindah`, `asal_sekolah`, `jenjang`, `sks_yang_diakui`, `no_ijazah_terkhir`, `nm_ayah`, `pekerjaan_ayah`, `pendidikan_ayah`, `status_ayah`, `penghasilan_ayah`, `nm_ibu`, `pekerjaan_ibu`, `pendidikan_ibu`, `status_ibu`, `penghasilan_ibu`, `alamat_ortu`, `kd_pos_ortu`, `telp_ortu`, `jlh_tanggungan`, `namawali`, `pekwali`, `pendwali`, `pengwali`, `alamatwali`, `telpwali`, `ukuran_jaket`, `status_anak`, `status_mhs`, `penguji1`, `penguji2`, `status_potongan`, `penguji_tesprogram`, `judul_skripsi`, `dosenPA`, `tgl_daftar`, `status`, `dosen_pembimbing`, `no_ktp`) VALUES
('130840046', 'THERESIA MARYATI NAIBAHO', '08', '084', 'P', 'K', 'A', '-', 'B', 'LUBUK ALUNG', '1995-06-15', 'ASRAMA MAHASISWI UNIKA ', 'UNIKA_1186679_728186310539777_915996606_n.jpg', '-', '-', 'SMKN 1 SINTUK TOBOH GADANG', 'JLN.SINTUK TOBOH GADANG', 'SINTUK', 'PADANG PARIAMAN', 'PADANG', 'SUMATERA BARAT', '2013', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'A.NAIBAHO', '6', '4', '1', '4', 'H.ANDRYANA SAGALA', '6', '4', '1', '4', 'JLN.LUBUK ALUNG', '-', '-', '4', '', '', '', '', '', '', 'S', '', 'A', NULL, NULL, NULL, '', 'IMPLEMENTASI ALGORITMA DIJKSTRA PADA PENCARIAN RUTE TERPENDEK RUMAH SAKIT DIKOTA MEDAN BERBASIS ANDROID', '0125058003', '0000-00-00', '1', '0124126801', '123456789'),
('130840047', 'IRWAN EDISON', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0125058003', '0000-00-00', '', '', ''),
('130840048', 'SURYADI SINAGA', '08', '084', 'L', 'P', 'A', '4', 'B', 'MARIHAT', '1995-08-26', 'JLN.SETIA BUDI NO.478 TANJUNG SARI MEDAN', 'UNIKA_IMG_20160806_204520.jpg', '20132', '082276596945', 'SMA KAMPUS NOMMENSEN PEMATANG SIANTAR', 'jln.sangnawaluh', '--', '--', 'SIANTAR', 'SUMATERA UTARA', '2013', '--', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'FIRMAN SINAGA', '1', '4', '1', '1', 'LENGSIANA DINNE SIAHAAN', '5', '5', '1', '1', 'MARIHAT', '21182', '082166852554', '2', '', '', '', '', '', '', 'S', '', 'A', NULL, NULL, NULL, '', 'IMPLEMENTASI ALGOTITMA DEPTH-FIRST SEARCH (DFS) PENCARIAN ANGGOTA BARU PADA LKP (LEMBAGA KURSUS DAN PELATIHAN)CELL POWER', '0125058003', '0000-00-00', '1', '0116117302', '1208182608950001'),
('130840049', 'SARDO S.M. PAULUS PURBA', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0125058003', '0000-00-00', '', '', ''),
('130840050', 'AGUSTIN SIBURIAN', '08', '084', 'P', 'P', 'A', '4', 'B', 'Kerasaan', '1995-08-10', 'Jl Unika Tanjung sari No.8 Medan', 'UNIKA_red.jpg', '20132', '081269258053', '-', '-', '', '', '', '-', '-', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Paingot Siburian', '1', '4', '1', '1', 'Tiomas Hutabalian', '6', '4', '1', '1', 'Kerasaan', '21184', '081260761615', '4', '', '', '', '', '', '', 'S', '', 'A', NULL, NULL, NULL, '', 'PERANCANGAN APLIKASI PENGAMANAN FILE BASIS DATA MENGGUNAKAN ALGORITMA CAESAR CIPHER', '0125058003', '0000-00-00', '1', '0108117501', '1208215008950001'),
('130840051', 'ANDRE RASMANA HABEAHAN', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0108117501', '0000-00-00', '', '', ''),
('130840052', 'FIRDAUD HUTAURUK', '08', '084', 'L', 'K', 'A', '3', 'B', 'Palembang', '1994-01-04', 'Jln. Setia Budi, Tj. Sari Medan', 'UNIKA_130840052.jpg', '20132', '085270287959', 'SMK 1 HKBP Seminarium Sipaholon', '-', 'Sipaholon', 'Tapanuli Utara', 'Tarutung', 'Sumatera Utara', '2013', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Elexson Hutauruk', '1', '2', '1', '2', 'Rosdiana Sibarani', '1', '2', '1', '2', 'Lumban Rihit, Sipaholon - Tarutung', '-', '081264469194', '1', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', 'PENERAPAN KRIPTOGRAFI DENGAN ALGORITMA RC4 DAN VIGENERE UNTUK MENGAMANKAN DATA GAMBAR ', '0108117501', '0000-00-00', '1', '0529067401', '12020400401940003'),
('130840053', 'JONRI TAMBUNAN', '08', '084', 'L', 'K', 'A', '1', 'B', '1', '1995-04-25', '1', 'UNIKA_jon.jpg', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2016-10-24', 1, 1, '', '0000-00-00', '', '', '', '', 0, '', '1', '3', '4', '1', '1', '1', '3', '4', '1', '1', '1', '1', '1', '1', '', '', '', '', '', '', 'L', '', 'A', NULL, NULL, NULL, '', 'IMPLEMENTASI ALGORITMA AES (ADVANCED ENCRYPTION STANDARAD) DAN METODE LSB+2(LEAST SINGNIFICANT BIT)', '0108117501', '0000-00-00', '1', '0114046501', '-'),
('130840054', 'ANDO HASIHOLAN PURBA', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0108117501', '0000-00-00', '', '', ''),
('130840055', 'PATAR ANDREAS SILALAHI', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0108117501', '0000-00-00', '', '', ''),
('130840056', 'NUANSA DIAN TOTO GINTING', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0108117501', '0000-00-00', '', '', ''),
('130840057', 'RASOKI GULTOM', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0108117501', '0000-00-00', '', '', ''),
('130840058', 'BERLIAN PUTRI IDAMAN BUULOLO', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0108117501', '0000-00-00', '', '', ''),
('130840059', 'UCOK P. SIMANUNGKALIT', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0108117501', '0000-00-00', '', '', ''),
('130840060', 'ANDRY HERY PURBA', '08', '084', 'L', 'K', 'A', '6', 'B', 'Sialang Buah, Dusun III Kec. Teluk.M', '2016-04-29', 'Jl. Gang Melati No.15 Pasar V. Setia Bud', 'UNIKA_13726587_1207891585908995_5902388245479468232_n.jpg', '20697', '081264423123', 'SMA Negeri.1 Kec. Teluk Mengkudu', 'Pematang Guntung Kec.Teluk Mengkudu', 'Teluk Mengkudu', 'Serdang Bedagai', 'Medan', 'Sumatera Utara', '2013', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Jhonny Purba', '8', '4', '2', '1', 'Risma Pangaribuan', '1', '4', '1', '3', 'Sialang Buah, Dusun III Kec. Teluk.M', '20697', '082162824449', '2', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', 'ANALISIS PERBANDINGAN ALGORITMA RABIN-KARP DAN LEVENSHTEIN DISTANCE DALAM MENGHITUNG KEMIRIPAN JURNAL  ', '0108117501', '0000-00-00', '1', '0114046501', '1218032904950005'),
('130840061', 'SAMUEL SIBUEA', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0108117501', '0000-00-00', '', '', ''),
('130840062', 'DALAN JOHANNES P.S', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0108117501', '0000-00-00', '', '', ''),
('140810001', 'RENCANA SYAH PUTRA ZILIWU', '08', '081', '', '', '', '8', '', 'HILIGARA', '1996-06-30', 'Jl. Setiabudi, gg horas', NULL, '20132', '085297480942', 'SMA NEGERI 1 GUNUNGSITOLI', '-', '-', '-', '-', 'SUMATERA UTARA', '2014', '-', '0000-00-00', 0, 0, '', '0000-00-00', '-', '-', '-', '-', 0, '-', 'FATOLOSA ZILIWU', '6', '2', '1', '2', 'MERINA LASE', '8', '2', '1', '1', 'Jl. Yossudarso, no 153 gunungsitoli', '-', '-', '-', '-', '', '', '', '-', '-', 'S', '', 'A', NULL, NULL, NULL, '', NULL, '0115027901', '0000-00-00', '1', '', ''),
('140810002', 'DERIUS GULO', '08', '081', 'L', 'P', 'A', '6', 'B', 'LAOWO HILIMBARUZO', '1995-08-07', 'jln, cempaka raya no.4 perumahan pemda', 'UNIKA_IMG_25600315_131229.jpg', '-', '081269526629', '-', '-', '-', '-', '-', 'Sumatra utara', '2014', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'BAZATULO', '1', '2', '1', '2', 'MARSAULINA TAMPUBOLON', '1', '3', '1', '1', 'HILIMBARUZO', '-', '081375766745', '6', '-', '1', '', '', '-', '-', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0115027901', '0000-00-00', '1', '', '1204100708950006'),
('140810003', 'YETI ROMINA NAIBAHO', '08', '081', 'P', 'K', 'A', '4', 'B', 'Pardamaran', '1996-11-11', 'Jln Setia Budi Gang Horas Tanjung Sari M', 'UNIKA_PhotoGrid_1490098566100.jpg', '-', '082367455871', 'SMA NEGERI 1 PULAU RAKYAT', 'PULAU RAKYAT TUA', 'PULAU RAKYAT', 'ASAHAN', '-', 'SUMATERA UTARA', '-', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'DERMAN NAIBAHO', '1', '4', '1', '2', 'TIOMIDA NADEAK', '1', '2', '1', '2', 'Pardamaran dusun X', '-', '081362243243', '4', '', '', '', '', '', '', 'S', '', 'A', NULL, NULL, NULL, '', NULL, '0115027901', '0000-00-00', '1', '', '1209145110960004'),
('140810004', 'ROHDEARTA PURBA', '08', '081', NULL, NULL, NULL, '5', NULL, 'Huta bayu', '1996-08-18', 'jln raharja gang mulia tanjung sari', NULL, '', '085761150635', 'smk swasta yapim medan', 'jln air bersih', '', '', 'MEDAN', 'SUMATRA UTARA', '2014', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'ADI PURBA', '1', '2', '1', '2', 'NAMPIN SARAGIH', '1', '2', '1', '1', 'Huta bayu', '-', '081375423627', '5', '', '', '', '', '', '', 'S', NULL, 'A', NULL, NULL, NULL, '', NULL, '0115027901', '0000-00-00', '1', '', ''),
('140810005', 'IGNASIUS PETHERSON MANURUNG', '08', '081', 'L', 'K', 'A', '1', 'B', '30JULI1996', '1996-07-30', 'Jalan sm raja km 1 no 1', 'UNIKA_14264220_1291928574151107_8485131095088446068_n.jpg', '1', '1', '1', 'Jalan sm raja km 1 no 1', 'Medan amplas', '1', 'Medan', '1', '2014', '1', '2016-10-17', 1, 1, '', '0000-00-00', '', '', '', '', 0, '', 'Pernaja Manurung', '8', '4', '2', '1', 'Henny Theresia Marbun', '8', '3', '1', '1', 'Jalan sm raja km 1 no 1', '1', '1', '1', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0115027901', '0000-00-00', '1', '', '0202'),
('140810006', 'INDI SUJANA BR SINUKABAN', '08', '081', 'P', 'P', 'A', '4', 'B', 'BERASTAGI', '1996-12-17', 'ASRAMA PUTRI JLN SETIA BUDI NO.479F TANJ', 'UNIKA_indi3.jpg', '20132', '082370982321', 'SMA NEGERI 1 KABANJAHE', '-', '-', '-', '-', 'SUMATERA UTARA', '2014', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'KOMANDO SINUKABAN', '6', '3', '1', '3', 'JARNI WARDANI BR SEMBIRING PANDIA', '6', '4', '1', '2', 'JLN ERSINALSAL ', '-', '081376164251', '4', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0115027901', '0000-00-00', '1', '', '23457896230009'),
('140810007', 'DEWI R.SIHITE', '08', '081', 'P', 'P', 'A', '4', 'B', 'PAKKAT', '1996-01-15', 'Jl.Parang1 Gg.Cinta Rakyat No.3', 'UNIKA_IMG_20160520_080553-1.jpg', '20142', '082165758377', 'SMA SWASTA RK SANTA MARIA PAKKAT', 'PAKKAT', 'PAKKAT', 'HUMBANG HASUNDUTAN', 'HUMBANG HASUNDUTAN', 'SUMATERA UTARA', '2014', 'DN-07 Ma 0034992', '2014-05-20', 8.55, 7.6, '', '0000-00-00', '', '', '', '', 0, '', 'HARDISON.SIHITE', '6', '3', '1', '1', 'ONIR.TINAMBUNAN', '2', '4', '1', '3', 'PAKKAT', '22455', '081290946987', '4', '', '', '', '', '', '', 'L', 'A', 'A', NULL, NULL, NULL, '', NULL, '0115027901', '0000-00-00', '1', '', '1216095501960005'),
('140810008', 'AVENTINUS FA\'ATULO HALAWA', '08', '081', 'L', 'K', 'A', '4', 'B', 'Bawa\'amahelato', '1996-11-28', 'Jln.Setia Budi gg. Pembda', NULL, '20353', '085206628722', 'SMK Swasta Pemda Nias', 'jln.Pelita no 9 Gunungsitoli', '00', 'Nias Induk', 'Gunungsitoli', 'SUMATERA UTARA', '2014', '00', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Elinudin Halawa', '2', '6', '1', '3', 'Fabiana Nasehati Sarumaha', '2', '6', '1', '2', 'Desa Hilifalawu', '00', '085275416732', '4', '', '', '', '', '', '', 'L', 'L', 'A', NULL, NULL, NULL, '', NULL, '0115027901', '0000-00-00', '1', '', '951107360013'),
('140810009', 'MASPRIADI MANIK', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0115027901', '0000-00-00', '', '', ''),
('140810010', 'JOY PRANATHA TARIGAN', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0115027901', '0000-00-00', '', '', ''),
('140810011', 'HEBRON NAINGGOLAN', '08', '081', 'L', 'K', 'A', '5', 'B', 'Kandis', '1995-07-15', 'Jl Besar Tanjun Selamat, Gg Masjid', 'UNIKA_IMG_20170110_144638[1].jpg', '20352', '085264764368', 'Smk Taruna Mandiri Pekan Baru', 'Jl Rajawali Sakti, Panam Pekan Baru Riau', '-', 'Siak', 'Pekan Baru', 'Riau', '2013', 'DN-09 Mk 0005083', '0000-00-00', 0, 0, '', '0000-00-00', '-', '-', '-', '-', 0, '-', 'Rediman Nainggolan', '1', '4', '1', '3', 'Demak Br Manurung', '1', '5', '1', '3', 'Kandis', '-', '082383228500', '-', '-', '', '', '', '-', '-', 'S', '', 'A', NULL, NULL, NULL, '', NULL, '0118127801', '0000-00-00', '1', '', '1271215609650001'),
('140810012', 'OCEFITRINA OPPUSUNGGU', '08', '081', 'P', 'K', 'A', '6', 'B', 'LUMBAN SIMBOON', '1995-06-27', 'JL.SETIA BUDI TANJUNG SARI MEDAN', NULL, '-', '082366504402', 'SMK ANUGERAH SIDIKAANG', '-', '', 'DAIRI', '', 'SUMATERA UTARA', '2014', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'MARTUA OPPUSUNGGU', '6', '4', '1', '2', 'RIA SIJABAT', '6', '4', '1', '2', 'SUMBUL PEGAGAN', '-', '081361298576', '6', '', '', '', '', '', '', 'S', '', 'A', NULL, NULL, NULL, '', NULL, '0118127801', '0000-00-00', '1', '', ''),
('140810013', 'ANNA FLOREN MARCELINA NDRURU', '08', '081', 'P', 'K', 'A', '4', 'B', 'MEDAN', '1996-03-20', 'Asrama Mahasiswi UNIKA St.Thomas Medan', 'UNIKA_17504293_662745180575469_3882409783955557647_o (3).jpg', '20132', '082165418706', 'SMA Swasta Katolik Bintang Laut ', 'Jl.diponegoro no.28', 'Teluk Dalam', 'Nias Selatan', '-', 'SUMATERA UTARA', '2014', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Markus Ndruru', '2', '6', '1', '3', 'Lirianna Dakhi', '2', '5', '1', '2', 'Botohilitano,Lorong Silambo ', '-', '-', '4', '', '', '', '', '', '', 'S', '', 'A', NULL, NULL, NULL, '', NULL, '0118127801', '0000-00-00', '1', '', '1214186003960001'),
('140810014', 'MONIKA GINTING', '08', '081', 'P', 'P', 'A', '3', 'B', 'launjuhar', '1996-01-12', 'sp.Selayang Medan', 'UNIKA_IMG_7278.JPG', '20135', '082363542639', 'SMA KATOLIK 2 KABANJAHE', 'Kabanjahe', 'Kabanjahe', 'Karo', 'Kabanjahe', 'SUMATERA UTARA', '2014', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Parte Ginting', '1', '3', '1', '1', 'Bunga br Pinem', '1', '2', '1', '1', 'Launjuhar', '22253', '081265263410', '3', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0118127801', '0000-00-00', '1', '', '12110665201960001'),
('140810015', 'OKTARIANI LAOLY', '08', '081', 'P', 'P', 'A', '7', 'B', 'Nias', '1994-10-05', 'Jln. Setiabudi Gg.Pepaya No. 4A Tanjung ', 'UNIKA_140810015.jpg', '20132', '085358382967', '--', '--', '--', '--', '--', '--', '--', '--', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Fagolosi Laoli', '1', '1', '1', '1', 'Nuruadi Farasi', '1', '1', '1', '1', 'Jln. Garuda IIIA Teluk Panji II', '--', '082167651532', '--', 'Robert Ginting', '6', '6', '2', 'Jln. Setiabudi Gg. Pepaya No. 4A Tanjung Sari-Medan', '082274995801', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0118127801', '0000-00-00', '1', '', ''),
('140810016', 'RANTO FRENDO SINAGA', '08', '081', 'L', 'K', 'A', '3', 'B', 'bandar lampung', '1994-11-21', 'jl.riharja', 'UNIKA_FB_IMG_14880266448772412[1].jpg', '20134', '082276061108', 'smk n2 pematang siantar', 'jl.sangnawaluh', 'siantar barat', '', 'pematang siantar', 'SUMATRA UTARA', '2014', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Pendi sinaga', '6', '3', '1', '1', 'Hotna turnip', '6', '4', '1', '1', 'Panombean Huta Urung', '-', '081370080242', '3', '-', '', '', '', '-', '-', 'S', '', 'A', NULL, NULL, NULL, '', NULL, '0118127801', '0000-00-00', '1', '', '1208062111940001'),
('140810017', 'SIPTA LATERANITA BR SITEPU', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0118127801', '0000-00-00', '', '', ''),
('140810018', 'PERDANA', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0118127801', '0000-00-00', '', '', ''),
('140810019', 'THERESYA SITORUS', '08', '081', 'P', 'K', 'I', '3', 'B', 'MEDAN', '1995-11-24', 'Sri Gunting Blok IA No.65', NULL, '20128', '082276154303', 'SMA NEGERI 15 MEDAN', 'Jl.Sekolah Pembangunan No.7', 'Medan Sunggal', 'Deli Serdang', 'MEDAN', 'SUMATRA UTARA', '2014', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Binsar Sitorus', '5', '4', '1', '3', 'Masdalida Hutagalung', '8', '4', '1', '1', 'Sri Gunting Blok IA NO.65 ', '20128', '-', '3', '', '', '', '', '', '', 'S', '', 'A', NULL, NULL, NULL, '', NULL, '0118127801', '0000-00-00', '1', '', ''),
('140810020', 'RIEN PELITA WATI ZEGA', '08', '081', NULL, NULL, NULL, '0', NULL, '0', '2016-10-04', '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2016-10-20', 0, 0, '', '0000-00-00', '', '', '0', '', 0, '0', '0', '2', '4', '1', '2', '0', '1', '3', '1', '2', '0', '0', '081265043428', '0', '', '', '', '', '', '', 'XL', NULL, NULL, NULL, NULL, NULL, '', NULL, '0118127801', '0000-00-00', '1', '', ''),
('140810021', 'PETRUS F.SIMANUNGKALIT', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0118127801', '0000-00-00', '', '', ''),
('140810022', 'DE MAWATI RUMAPEA', '08', '081', 'P', 'P', 'A', '7', 'B', 'Baga Batu', '1995-12-12', 'jl.melati 1 .25D komplek pemda', 'UNIKA_140810022.jpg', '20132', '085358489125', 'SMA PEMBANGUNAN BAGAN BATU', 'JL.IMAN BONJOL', 'BAGAN SINEMBAH', 'ROKAN HILIR', 'BAGAN BATU', 'RIAU', '2014', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'DARIAMAN RUMAPEA', '1', '2', '1', '2', 'RATIMA GULTOM', '1', '3', '2', '2', 'SIMPANG SIMAHOLDER', '-', '081365515562', '1', '', '', '', '', '', '', 'S', '', 'A', NULL, NULL, NULL, '', NULL, '0122107901', '0000-00-00', '1', '', ''),
('140810023', 'TOMI HARISON HUTAPEA', '08', '081', NULL, NULL, NULL, '2', NULL, 'Berastagi', '1997-02-08', 'Jln cempaka raya no 4A', NULL, '-', '081362356679', 'SMA SWASTA ADVENT MARTOBA', 'Jln Rakutta sembiring', '-', '-', 'Pematang Siantar', 'Sumatera Utara', '2014', '-', '0000-00-00', 0, 0, '', '0000-00-00', '-', '-', '-', '-', 0, '-', 'Hamonangan Hutapea', '1', '6', '1', '2', 'Kristina Sitepu', '1', '4', '1', '1', 'Desa ujung teran kec Merdeka Kab karo', '-', '-', '-', '-', '', '', '', '-', '-', 'M', NULL, 'A', NULL, NULL, NULL, '', NULL, '0122107901', '0000-00-00', '1', '', ''),
('140810024', 'MELISA BR.BUKIT', '08', '081', 'P', 'K', 'A', '2', 'B', 'binjai', '1996-10-18', 'jl.melati setia budi medan', 'UNIKA_aa.jpg', '20132', '081269803596', 'SMA katolik 2 kabanjahe', 'jalan kotacane', '-', 'karo', 'kabanjahe', 'sumut', '2014', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'jhonson bukit', '7', '4', '1', '3', 'suryati br ginting', '8', '4', '2', '1', 'desa surbakti', '22153', '081361378212', '1', '-', '', '', '', '-', '-', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0122107901', '0000-00-00', '1', '', '1206125212970001'),
('140810025', 'JUNO PURBA', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0122107901', '0000-00-00', '', '', ''),
('140810027', 'ETIMANTA VERONIKA BR PINEM', '08', '081', 'P', 'K', 'A', '4', 'B', 'Kuta Buluh ', '1995-02-02', 'Jln.Jamin Ginting Gg.Parang 3 Kec.Medan ', 'UNIKA_IMG_25600315_130848.jpg', '-', '085261066063', 'SMK Immanuel 2 Kaban Jahe', '-', '-', '-', '-', 'Sumatera Utara', '-', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Karibin Pinem', '1', '2', '2', '2', 'Riahukur Br Ginting', '1', '2', '1', '2', 'Kuta Buluh Kec.Tanah Pinem Kab.Dairi', '-', '085297469714', '1', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0114046501', '0000-00-00', '1', '', '1211064202890002'),
('140810028', 'VERONIKA RAJAGUKGUK', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0114046501', '0000-00-00', '', '', ''),
('140810029', 'MELDAWATI SAGALA', '08', '081', 'P', 'K', 'A', '5', 'B', 'Sipange', '1996-09-27', 'jln Setia Budi Pimpang Pemda Tanjung Sar', NULL, '-', '082276026092', 'SMK N 2 BALIGE', '-', '-', '-', '-', 'SUMATERA UTARA', '-', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'LINDUNG sagala', '1', '2', '1', '2', 'RENNI NABABAN', '1', '3', '1', '2', 'SIPANGE', NULL, '081263327822', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0114046501', '0000-00-00', '1', '', '-'),
('140810030', 'PUTRI GREGORIA MANALU', '08', '081', 'P', 'K', 'A', '5', 'B', 'Lubuk Cuik', '1997-01-10', 'Jl. Setia Budi Pasar 3 Tanjung Sari Meda', 'UNIKA_IMG_5969.JPG', '0', '082276497943', 'SMA SWASTA ASSISI SIANTAR', 'Jl. Asahan Km.6 Siantar', 'Siantar', 'Simalungun', 'Siantar', 'Sumatera Utara', '2014', '0', '2014-10-02', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'JONNER HOPSI MANALU', '2', '6', '1', '3', 'MINARNI PAKPAHAN', '2', '5', '1', '2', 'Desa Bulan-Bulan Kec Lima Puluh', '0', '081362404120', '5', '', '', '', '', '', '', 'S', '', 'A', NULL, NULL, NULL, '', NULL, '0114046501', '0000-00-00', '1', '', '123'),
('140810031', 'NELLI ROUNA BUATON', '08', '081', 'P', 'K', 'W', '5', 'B', 'Medan', '1996-01-15', 'jl.setia budi gg.horas tj sari', NULL, '20132', '085270718754', 'SMAS Pembangunan Bagan Batu', 'Bagan Batu', 'Bagan Sinembah', 'Rokan Hilir', 'Bagan Batu', 'Riau', '2014', '0', '2014-10-28', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Urasman Valentinus Nainggolan', '5', '4', '1', '3', 'Roma Uli Br.Simanjuntak', '1', '4', '1', '1', 'Jl,Simpang Perjuangan Bagan Batu', '28992', '082387467543', '3', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0529067401', '0000-00-00', '1', '', ''),
('140810032', 'NOVA RIANA BR GINTING', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0529067401', '0000-00-00', '', '', ''),
('140810033', 'MARIA ROULINA SIMBOLON', '08', '081', NULL, NULL, NULL, '2', NULL, 'Medan', '1997-02-25', 'Dusun II,tj.anom', NULL, '-', '082360710899', 'YPN.MARISI MEDAN', '-', '-', '-', 'Medan', 'Sumatra Utara', '2014', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'W.Simbolon', '6', '4', '1', '1', '(+)L.Sipayung', '6', '4', '2', '1', '-', '-', '-', '2', 'E.Nainggolan', '6', '3', '', 'Dusun II,tj.anom', '082168487861', 'M', NULL, 'A', NULL, NULL, NULL, '', NULL, '0529067401', '0000-00-00', '1', '', ''),
('140810034', 'INDRA JAYA PARLINDUNGAN .S', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0529067401', '0000-00-00', '', '', ''),
('140810035', 'TUMPUAN SINAGA', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0529067401', '0000-00-00', '', '', ''),
('140810036', 'OKTO GOKLAS SARAGI', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0529067401', '0000-00-00', '', '', ''),
('140810037', 'ALPONSO MORKY SINAGA', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0529067401', '0000-00-00', '', '', ''),
('140810038', 'EDI SAPUTRA GURUSINGA', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0529067401', '0000-00-00', '', '', ''),
('140810039', 'PERTALENTA TARIGAN', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0529067401', '0000-00-00', '', '', ''),
('140810040', 'UMUM MULIYADI SIMBOLON', '08', '081', 'L', 'P', 'A', '7', 'B', 'Kaban Jahe', '1993-05-16', 'Jl.Setia Budi, Gg GBKP, Tanjung Sari.', NULL, '20132', '085373045735', 'SMA NEGERI 1 LAU BALENG', 'Desa Buluh Pancur', 'Lau Baleng', 'Karo', 'Tanah Karo', 'Sumatera Utara', '2011', '', '2016-10-24', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Judin Simbolon', '1', '3', '2', '1', 'Reni Sihaloho', '1', '3', '1', '1', 'Desa Tanjung Pamah. Kec: Mardingding', '22165', '085373045735', '1', '', '', '', '', '', '', 'L', 'T', 'A', NULL, NULL, NULL, '', NULL, '0529067401', '0000-00-00', '1', '', '-'),
('140810041', 'JIMMY SEMBIRING', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0529067401', '0000-00-00', '', '', ''),
('140810042', 'DONNY  CHRISTIAN NAINGGOLAN', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0529067401', '0000-00-00', '', '', ''),
('140810043', 'IMANUEL FEBRIAN SITUMOTANG', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0529067401', '0000-00-00', '', '', ''),
('140810044', 'PARLUHUTAN TOGU TUA SILALAHI', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0529067401', '0000-00-00', '', '', ''),
('140810045', 'ESRA PORHOT MARPAUNG', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0529067401', '0000-00-00', '', '', ''),
('140810046', 'REMANDO SIMARMATA', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0529067401', '0000-00-00', '', '', ''),
('140810047', 'FREDY HUTASOIT', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0529067401', '0000-00-00', '', '', ''),
('140810048', 'HENRA MUNTHE', '08', '081', 'L', 'P', 'A', '1', 'B', '1', '0000-00-00', 'Jl.Setia Budi Gg.Pepaya No.1b Tanjung Sa', NULL, '1', '081263136162', '1', '1', '1', '1', '1', '1', '1', '1', '2016-10-10', 1, 1, '', '0000-00-00', '', '', '', '', 0, '', '1', '1', '2', '1', '1', '1', '1', '4', '1', '1', '1', '1', '1', '1', '', '', '', '', '', '', 'L', '', 'A', NULL, NULL, NULL, '', 'SISTEM INFORMASI GEOGRAFIS PARIWISATA KABUPATEN KARO BERBASIS WEB', '0529067401', '0000-00-00', '1', '0122107901', '1'),
('140810049', 'FERA NITA YOUSIDA SARAGIH', '08', '081', 'P', 'P', 'A', '5', 'B', 'Siak Raya', '2016-10-16', 'Jln.Ngumban surbakti.Gg Ayelir no 12 Med', NULL, '20132', '0821-6652-11', '1', '1', '1', '11', '1', '1', '1', '1', '2016-10-17', 1, 1, '', '0000-00-00', '', '', '', '', 0, '', '1', '1', '2', '1', '1', '1', '5', '4', '1', '2', '1', '1', '1', '1', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', 'SISTEM INFORMASI ADMINISTRASI SURAT MASUK DAN SURAT KELUAR PADA BIRO RETORAT UNIVERSISTAS KATOLIK SANTO THOMAS SUMATERA UTARA', '0529067401', '0000-00-00', '1', '0115027901', '1222035610930003'),
('140810050', 'JHON FREDICSON SIMANJUNTAK', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0529067401', '0000-00-00', '', '', ''),
('140810051', 'SUSI PERAWATI PANDIANGAN', '08', '081', 'p', 'K', 'A', '7', 'B', 'pangambatan', '2016-04-12', 'jl.setiabudi, Gg.unika', NULL, '0', '085207776363', 'SMA N 1 KOLANG', 'pangambatan ', 'Kolang', 'Tapanuli tengah', 'Sibolga', 'Sumatera utara', '2012', '0', '0000-00-00', 0, 0, '', '0000-00-00', '0', '0', '0', '00', 0, '0', 'DEWASLI PANDIANGAN', '6', '2', '1', '2', 'ROSMALIA MANALU', '1', '2', '1', '2', 'Pangambatan', '0', '0', '2', '0', '', '', '', '0', '0', 'M', '', 'A', NULL, NULL, NULL, '', 'APLIKASI PENGAMANAN IJAZAH MENGGUNAKAN METODE QR-CODE', '0529067401', '0000-00-00', '1', '0118127801', ''),
('140810052', 'ROSA ROSANI SARUMAHA', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0529067401', '0000-00-00', '', '', ''),
('140810053', 'LIA PEBRIANA BR PURBA', '08', '081', 'P', 'K', 'A', '1', 'B', 'peceren', '1995-08-08', 'jln.parang III kec.medan johor', NULL, '1', '081375005129', 'SMA SWASTA BERSAMA  BERASTAGI', '1', '1', '1', '1', '1', '1', '1', '2016-10-18', 1, 1, '', '0000-00-00', '', '', '', '', 0, '', 'wartawan purba', '6', '4', '1', '2', 'nursani br sembiring', '6', '3', '1', '2', 'desa doulu kec.berastagi', '1', '1', '2', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', 'SISTEM INFORMASI KOST DI KOTA MEDAN BERBASIS WEB', '0529067401', '0000-00-00', '1', '0114046501', 'o'),
('140810054', 'EFRAIM SITOHANG', '08', '081', 'L', 'K', 'A', '7', 'B', 'lumbansoit', '2016-10-11', 'Jl.setia Budi G.pepaya No.1 Tj.Sari Meda', 'UNIKA_20161231_182136-1.jpg', 'a', '082294058681', 'SMA.ST.MARIA TARUTUNG', 'Jl.D.I.Panjaitan No 39 Tarutung', 'Tarutung', 'Tapanuli Utara', 'Tarutung', 'Sumatera Utara', '2013', '1', '2016-10-17', 1, 1, '', '0000-00-00', '', '', '1', '', 0, '1', 'Bogard sitohang', '1', '3', '1', '0', 'Managam br.Hutauruk', '1', '3', '1', '1', 'Jl. Balige Tarutung', '22416', '1', '3', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', 'SISTEM INFORMASI TRANSAKSI PEMBELIAN DAN PENJUALAN KOPI PADA UD.MITRA KELUARGA', '0529067401', '0000-00-00', '1', '0029097403', '1202041712950002'),
('140840001', 'FRAN FESTUS DAKHI', '08', '084', 'L', 'K', 'W', '3', 'B', 'HILIMAENAMOLO', '1996-12-01', 'Jl. Raharja Gg. Sehati', 'UNIKA_14022216_952616254883911_4256852803820343304_n.jpg', '203132', '082276442544', '-', '-', '', '', '', '-', '-', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', '---', '1', '2', '1', '1', '-', '1', '2', '1', '1', '-', '22865', '-', '4', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0111067801', '0000-00-00', '1', '', ''),
('140840002', 'T. WAWASAN ZEBUA', '08', '084', 'L', 'P', 'A', '5', 'B', 'SISOBAHILI', '1996-05-07', 'jl. bunga pancur', 'UNIKA_Untitled.jpg', '-', '082167261312', 'SMA PARULIAN 1 MEDAN', '-', '', '', '', '-', '-', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'ATOSOKHI ZEBUA', '2', '6', '1', '1', 'YUNIAMIN ZEBUA', '2', '4', '1', '1', 'SISOBAHILI', '-', '-', '3', '', '', '', '', '', '', 'S', '', 'A', NULL, NULL, NULL, '', NULL, '0111067801', '0000-00-00', '1', '', '-'),
('140840003', 'YANUATO HULU', '08', '084', 'L', 'P', '', '6', '', 'LEWA-LEWA', '1995-01-10', 'Jl.Raharja Gg Sehati Medan selayang', 'UNIKA_10917428_416471288510159_6914747376128805355_n.jpg', '123', '082370257844', 'SMK EMMANUEL AGUNG GUNUNGSITOLI', 'JL.MELATI NO.159-161 LANDATAR ILIR GUNUNGSITOLI', 'GUNUNGSITOLI', 'NIAS', 'GUNUNGSITOLI', 'SUMATERAUTARA', '2014', 'DN-07 MK 0031241', '2014-05-20', 38, 6, '', '0000-00-00', '', '', '', '', 0, '', 'TALIZANOLO HULU', '1', '1', '1', '1', 'ATIBA TAFONAO', '1', '1', '1', '1', 'LEWA-LEWA', '123', '082370257844', '1 ORANG', 'FOAROTA TAFONAO', '5', '6', '2', 'KATO GUNUNGSITOLI', '085262514317', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0111067801', '0000-00-00', '1', '', ''),
('140840004', 'ESEKIA SIPAYUNG', '08', '084', 'P', 'K', 'A', '5', 'B', 'sei kramat', '1996-01-14', 'jalan setia budi no 479-f, tanjung sari ', 'UNIKA_3X4.jpg', '20132', '085370145434', 'SMA SWASTA TRITUNGGAL Tanjungbalai', '-', '-', '-', '-', '-', '-', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '-', '', 0, '', 'Linsarman Sipayung', '1', '3', '1', '2', 'Nelpi Hutabalian', '6', '4', '1', '1', 'Jalan alteri gang HKI Tanjungbalai', '21364', '085361787437', '4', '', '', '', '', '', '', 'S', '', 'A', NULL, NULL, NULL, '', NULL, '0111067801', '0000-00-00', '1', '', '1208172802940001'),
('140840005', 'HAPOSAN YUSTINUS SINAGA', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0111067801', '0000-00-00', '', '', ''),
('140840006', 'YOSEFA GUNARTY BR. TARIGAN', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0111067801', '0000-00-00', '', '', ''),
('140840007', 'ABDUL AMIRUDDIN RAJAGUKGUK', '08', '084', 'L', 'P', 'A', '5', 'B', 'SIMPANG TIGA', '1994-11-30', 'jln Setia Budi gang melati tanjung sari ', 'UNIKA_rajagukguk123.png', '-', '81262663793', 'SMA NEGERI 2 SIBORONGBORONG', 'SIBORONGBORONG', 'SIBORONGBORONG', 'TAPANULI UTARA', '-', 'SUMATERA UTARA', '2013', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'k Rajagukguk', '1', '3', '2', '1', 'R Gultom', '1', '2', '1', '2', 'SIMPANG TIGA PARANGINAN', '-', '-', '2', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0111067801', '0000-00-00', '1', '', '-'),
('140840008', 'REHMANA FIRDAUS SITEPU', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0111067801', '0000-00-00', '', '', ''),
('140840009', 'HANDRIAN CRYSTON BARUS', '08', '084', 'L', 'P', 'A', '-', 'B', 'DELITUA', '1995-09-06', 'DESA GUNUNG KELAWAS DUSUN 4 RAMPAH BARU', 'UNIKA_IMG_20160708_210121-1.jpg', '20356', '085359612212', 'SMA NEGERI 1 DELITUA', 'DESA GUNUNG KELAWAS DUSUN 4 RAMPAH BARU', 'NAMORAMBE', 'DELI SERDANG', 'MEDAN', 'SUMATRA UTARA', '2013', '-', '2013-05-24', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'EDWARD BARUS', '6', '4', '1', '1', 'HENNY NURTINAWATI BR PURBA', '2', '5', '1', '3', 'DESA GUNUNG KELAWAS DUSUN 4 RAMPAH BARU', '20356', '085276997269', '1', '', '', '', '', '', '', 'L', '', 'A', NULL, NULL, NULL, '', NULL, '0111067801', '0000-00-00', '1', '', '1207060609950003'),
('140840010', 'ESTI YULIANA', '08', '084', 'P', 'K', 'A', '4', 'B', 'batang toru ', '1995-11-04', 'gang horas', NULL, '20132', '082370187247', 'sma negeri 1 batang toru', '', 'batang toru jln sibolga aek pining', 'Batang toru', 'Tapanuli selatan', 'sumatera utara', ' 201', '2014', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Johler manullang', '6', '3', '1', '3', 'Masri pandiangan', '1', '4', '1', '1', 'wek 1V kampung baru batang toru', '22738', '082370187247', '4', '', '', '', '', '', '', 'S', '', 'A', NULL, NULL, NULL, '', NULL, '0111067801', '0000-00-00', '1', '', '1234456789809-09=0-'),
('140840011', 'KRISFINUS KARDO MAHULAE', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0124126801', '0000-00-00', '', '', ''),
('140840012', 'LIDYA MARBUN', '08', '084', 'P', 'K', 'A', '-', 'B', 'SIDIKALANG', '1996-10-08', '-', NULL, '20132', '-', '-', '-', '', '', '', '-', '-', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'BILHER MARBUN', '8', '3', '2', '1', 'RODINCE SIAHAAN', '2', '6', '1', '2', 'JLN RUNDING NO.8, SUKARAMAI', '22271', '081333610754', '3', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0124126801', '0000-00-00', '1', '', ''),
('140840013', 'HERIANTO SIMORANGKIR', '08', '084', 'L', 'K', 'A', '4', 'B', 'Sibolga', '1996-11-15', 'jln.cempaka no:16 padang bulan', 'UNIKA_15027632_1220436034682338_8051187411270190960_n.jpg', '-', '082168396703', 'SMA SWASTA KATOLIK SIBOLGA', '-', 'Sibolga', 'Tapanuli Tengah', 'Sibolga', 'SUMATRA UTARA', '2014', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Reinhard Parlindungan Simorangkir', '2', '6', '1', '2', 'Hetty Lumban Tobing', '8', '4', '1', '1', 'jln.GG.sakura no:39', '-', '081361292606', '5', '', '', '', '', '', '', 'L', '', 'A', NULL, NULL, NULL, '', NULL, '0124126801', '0000-00-00', '1', '', '-'),
('140840014', 'TUTUR MARIDUP HUTAGAOL', '08', '084', 'P', 'P', 'A', '7', 'B', 'SIRIA - RIA', '1995-12-02', 'Jl. Setia Budi No 478 B Tanjung Sari ', NULL, '20132', '085270759771', 'SMK NEGERI 1 TEBING TINGGI', '-', 'TEBING TINGGI', 'SERDANG BEDAGAI', 'TEBING TINGGI', 'SUMATERA UTARA', '2014', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'TUMBUR HUTAGAOL', '6', '4', '1', '1', 'NORMA MANALU', '2', '5', '1', '3', 'DUSUN VIII RIA RIA SEI BAMBAN', '20695', '082277927211', '7', '-', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0124126801', '0000-00-00', '1', '', '1218154212950001'),
('140840015', 'ANWAR ERI TRIANSAH DAMANIK', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0124126801', '0000-00-00', '', '', ''),
('140840016', 'DICO BHASTIAN TORONG', '08', '084', 'L', 'K', 'A', '3', 'B', 'Sibosur', '1996-02-17', 'EPLASMET PMT DOLOK ILIR', 'UNIKA_16299391_255826348173327_2396985790843525252_n.jpg', '-', '082272314045', 'SMA NEGERI 1 DOLOK MERAWAN', 'DOLOK MERAWAN', 'DOLOK MERAWAN', 'SERDANG BEDAGAI', '', 'SUMATERA UTARA', '2014', '0', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'S.TORONG', '3', '4', '1', '2', 'R.br.Manurung', '8', '4', '1', '1', 'EMPLASMET PMT DOLOK ILIR', '-', '-', '2', '', '', '', '', '', '', 'L', '', 'A', NULL, NULL, NULL, '', NULL, '0124126801', '0000-00-00', '1', '', '-'),
('140840017', 'NATALIA SIJABAT', '08', '084', 'P', 'K', 'A', '5', 'B', 'Medan', '1996-12-25', 'Gaperta Jln.asrama Gg.rel No.82', 'UNIKA_natalia.jpg', '20132', '085398180635', 'SMK SWASTA TELADAN SUMUT-2', '-', '', '', 'Medan', 'Sumatera Utara', '2011', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'L.Sijabat', '6', '3', '1', '2', 'P.siringo-ringo', '8', '2', '1', '1', 'Gaperta Jln.asrama Gg.Rel No.82', '-', '082368691745', '2', '', '', '', '', '', '', 'S', '', 'A', NULL, NULL, NULL, '', NULL, '0124126801', '0000-00-00', '1', '', '-'),
('140840018', 'JAMES SUPRIADI S.LASE', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0124126801', '0000-00-00', '', '', ''),
('140840019', 'SUPARMAN PURBA', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0124126801', '0000-00-00', '', '', ''),
('140840020', 'Willi Candra Ompusunggu', '08', '084', 'L', 'K', 'A', '1', 'B', '1', '2016-10-23', '1', NULL, '1', '1', '2', '5', '5', '5', '5', '5', '5', '5', '0000-00-00', 5, 5, '', '0000-00-00', '', '', '', '', 0, '', '4', '3', '4', '1', '2', '4', '3', '4', '1', '1', 'e', 'r', 'r', 'e', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0124126801', '0000-00-00', '1', '', '219000000000'),
('140840021', 'MIXON PAELASULI HUTAGALUNG', '08', '084', 'L', 'P', 'A', '4', 'B', 'Medan', '1996-01-04', 'Jalan Penampungan II GG Gereja LK IX', 'UNIKA_10373107_655843834494681_6555406774108861434_o.jpg', '20124', '085261810866', '-', '-', '-', '-', '-', '-', '2014', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'N Hutagalung', '5', '4', '1', '2', 'M Siburian', '8', '4', '1', '1', 'Jalan Penampungan II GG Gereja LK IX', '20124', '081396852306', '4', '', '', '', '', '', '', 'L', '', 'A', NULL, NULL, NULL, '', NULL, '0126088202', '0000-00-00', '1', '', '-'),
('140840022', 'ELISABET BR.DEPARI', '08', '084', 'P', 'P', 'A', '4', 'B', 'Kabanjahe', '1995-04-08', 'Jl.Setia Budi Tj.Sari No.458', 'UNIKA_3x4.jpg', '20132', '082168549406', 'SMA Swasta GBKP Kabanjahe', 'JL. MARIAM GINTING NO.03', 'Kabanjahe', 'Karo', 'Kab. Karo', 'Sumatera Utara ', '-', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Perlindungan Depari', '1', '4', '1', '1', 'Mastaria Br Ginting', '1', '3', '1', '2', 'Desa Seberaya', '-', '-', '4', '-', '', '', '', '-', '-', 'S', '', 'A', NULL, NULL, NULL, '', NULL, '0126088202', '0000-00-00', '1', '', '1206044804950001'),
('140840023', 'ROBERTO PURBA', '08', '084', NULL, NULL, NULL, '5', NULL, 'Sipinggan', '1996-12-07', 'jln.setia budi gg.rahmat ', NULL, '', '081269713967', 'SMK swt.Parbina nusantara', 'jln.lingga no.32', 'Siantar marihat', '', 'Pematang siantar', 'Sumatera Utara', '2014', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Drs.Marlom purba', '2', '6', '1', '3', 'Nila wati saragih', '8', '4', '1', '1', 'Sipinggan', '', '', '-', '', '', '', '', '', '', 'M', NULL, 'A', NULL, NULL, NULL, '', NULL, '0126088202', '0000-00-00', '1', '', '');
INSERT INTO `tbmahasiswa` (`npm`, `nm_mhs`, `fakultas`, `kd_prodi`, `jk`, `agama`, `kewarganegaraan`, `jlh_bersaudara`, `status_sipil`, `tmpt_lahir`, `tgl_lahir`, `alamat`, `Foto`, `kodepos`, `telp`, `nm_sma`, `alamat_sma`, `kecamatan`, `kabupaten`, `kota`, `provinsi`, `thn_lulus`, `no_ijazah`, `tgl_ijazah`, `jlh_un`, `rataun`, `no_surat_pindah`, `tgl_surat_pindah`, `pt_asal`, `prog_studi_pindah`, `asal_sekolah`, `jenjang`, `sks_yang_diakui`, `no_ijazah_terkhir`, `nm_ayah`, `pekerjaan_ayah`, `pendidikan_ayah`, `status_ayah`, `penghasilan_ayah`, `nm_ibu`, `pekerjaan_ibu`, `pendidikan_ibu`, `status_ibu`, `penghasilan_ibu`, `alamat_ortu`, `kd_pos_ortu`, `telp_ortu`, `jlh_tanggungan`, `namawali`, `pekwali`, `pendwali`, `pengwali`, `alamatwali`, `telpwali`, `ukuran_jaket`, `status_anak`, `status_mhs`, `penguji1`, `penguji2`, `status_potongan`, `penguji_tesprogram`, `judul_skripsi`, `dosenPA`, `tgl_daftar`, `status`, `dosen_pembimbing`, `no_ktp`) VALUES
('140840024', 'FRISKA AGUSTINA', '08', '084', 'P', 'P', 'A', '2', 'B', 'Jakarta', '1996-08-10', 'jl.bunga wijaya kusuma perumahan residen', 'UNIKA_foto_.jpg', '20132', '082315089066', 'SMA N 1 Pangururan', '-', '', '', '', '-', '-', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Tagor Timbul Sihotang', '7', '4', '2', '1', 'Funiyati sosowiriyo', '6', '2', '1', '1', 'jl. toh kuning desa dukuhan jawa tengah', '-', '081226073001', '2', 'Tigor Sihotang', '6', '6', '3', 'jl.SM raja no.19 pasar lama pangururan kab.samosir', '-', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0126088202', '0000-00-00', '1', '', '-'),
('140840025', 'ABEDNEGO OMPUSUNGGU', '08', '084', 'L', 'K', 'A', '4', 'B', 'Kelapa Tinggi', '1996-05-22', 'Jl.setia Budi Tarabunga', 'UNIKA_12072690_832130636907357_40403787141063723_n.jpg', '-', '085275112541', 'SMA Sw.Katolik Cinta Kasih', '-', '-', '-', '-', '-', '-', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Martua Ompusunggu', '1', '2', '1', '1', 'Saudur Sitinjak', '2', '6', '1', '2', 'Kelapa Tinggi', '20695', '-', '1', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0126088202', '0000-00-00', '1', '', '1218152505960002'),
('140840026', 'PUNGUAN RAJAGUKGUK', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0126088202', '0000-00-00', '', '', ''),
('140840027', 'KONGRES TARIGAN', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0126088202', '0000-00-00', '', '', ''),
('140840028', 'OFFEN NISTON GIAWA', '08', '084', 'L', 'P', '', '4', 'B', 'Hilizoliga', '1994-02-28', '-', 'UNIKA_IMG_20160719_154203.jpg', '-', '085282597524', 'SMA NEGERI 3 GUNUNGSITOLI', '-', '-', '-', '-', '-', '-', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'SERTI GIAWA', '2', '6', '1', '3', 'YASEMINAT HALAWA', '1', '3', '1', '1', 'HILIZOLIGA', '-', '085358508396', '4', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0126088202', '0000-00-00', '1', '', ''),
('140840029', 'RISKY SITEPU', '08', '084', 'L', 'K', 'A', '3', 'M', 'pematang siantar', '1995-09-14', 'jln.setia budi tanjung sari wisma tara b', 'UNIKA_14947448_668938719946836_7694247309882383122_n.jpg', '-', '082165686184', '-SMA RK DELI MURNI BANDAR BARU', '-DESA BANDAR BARU', 'sibolangit', 'deli sedang', '-', 'sumatra utara', '2013', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'tintang sitepu', '1', '4', '1', '3', 'mery sembiring', '1', '4', '1', '4', 'kuta great kec.tiga binangga', '-', '08126359702', '4', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0126088202', '0000-00-00', '1', '', '1272031409950001'),
('140840030', 'YOHANNES FERNANDO TAMPUBOLON', '08', '084', 'L', 'P', 'A', '5', 'B', 'MEDAN', '1996-06-25', 'Jln Tani Asli', 'UNIKA_13962689_1105296792869522_4898672356643795623_n.jpg', '-', '082370212201', 'SMK SWASTA TELADAN SUMATERA UTARA', '-', '-', '-', '-', 'Sumatera Utara', '-', '-', '0000-00-00', 0, 0, '-', '2016-10-03', '-', '-', '-', '-', 0, '-', 'SAUT POLTAK TAMPUBOLON', '6', '5', '1', '3', 'ROSLINDA Br SIMBOLON', '8', '4', '1', '1', 'Jln Tani Asli', '-', '-', '-', '-', '', '', '', '-', '-', 'S', '-', 'A', NULL, NULL, NULL, '', NULL, '0126088202', '0000-00-00', '1', '', '-'),
('140840031', 'ARGANA NATANAEL SARAGI', '08', '084', 'L', 'K', 'A', '5', 'B', '11', '2016-10-16', '1', 'UNIKA_10492421_257944601065929_2203845541761335662_n.jpg', '55', '5', '5', '5', '5', '5', '4', '4', '4', '4', '2016-10-16', 4, 4, '', '0000-00-00', '', '', '', '', 0, '', '2', '5', '4', '1', '1', 'e', '1', '4', '1', '1', '4', '4', '4', '4', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0029097403', '0000-00-00', '1', '', '12345678910'),
('140840032', 'OBOR SIAGIAN', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0029097403', '0000-00-00', '', '', ''),
('140840033', 'AGUS SANI PERDANA', '08', '084', 'L', 'K', 'A', '1', 'B', 'Medan', '0000-00-00', '1', NULL, '20124', '1', '1', '1', '1', '11', '1', '1', '1', '1', '2016-10-10', 1, 1, '', '0000-00-00', '', '', '', '', 0, '', 'S.Perangin-Angin', '3', '6', '2', '1', 'N br Saragi Napitu', '6', '6', '1', '1', 'Lampung Tengah', '1', '1', '1', 'D Perangin-Angin', '3', '5', '2', 'Jln. Gelatik X No 240 Perumnas Mandala', '', 'L', '', 'A', NULL, NULL, NULL, '', NULL, '0029097403', '0000-00-00', '1', '', '1408400330808'),
('140840034', 'DEDI KRISTIAN HALAWA', '08', '084', 'L', 'P', '', '4', '', 'SISOBAHILI', '1996-12-20', 'Jl. Pales 7a No. 17', 'UNIKA_aq.jpg', '-', '082366020480', 'SMA NEGERI 1 LOLOWAU', 'LOLOWAU', 'LOLOWAU', 'NIAS SELATAN', '-', 'SUMATERA UTARA', '2014', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'TEMAARO HALAWA', '1', '1', '1', '1', 'YEMIMA WARUWU', '1', '2', '1', '1', 'SISOBAHILI', '22864', '081370951749', '-', '', '', '', '', '', '', 'S', '', 'A', NULL, NULL, NULL, '', NULL, '0029097403', '0000-00-00', '1', '', ''),
('140840035', 'RONALDSIUS PURBA', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0029097403', '0000-00-00', '', '', ''),
('140840036', 'SEPWANTO PURBA', '08', '084', 'L', 'P', 'W', '8', 'B', 'Durian Banggal', '1994-09-22', 'jln.sakura I ', 'UNIKA_13775463_1000771813375400_1170829260761375307_n.jpg', '-', '082277656048', 'SMA ST PETRUS MEDAN', 'jln.luku I sim.pos Medan', '-', '-', 'MEDAN', 'SUMATERA UTARA', '2013', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Kompianus Purba', '1', '3', '1', '2', 'Kontaria Damanik', '1', '2', '1', '1', 'Desa Nagori Durian Banggal', '-', '-', '1', 'Kompiderson Purba', '6', '', '', '-', '-', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0029097403', '0000-00-00', '1', '', ''),
('140840037', 'MARTI ANDES HUTAGAOL', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0029097403', '0000-00-00', '', '', ''),
('140840038', 'TIMBUL RONI SITORUS', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0029097403', '0000-00-00', '', '', ''),
('140840039', 'TOGU EVANDO SITUMORANG', '08', '084', 'L', 'K', 'A', '8', 'B', 'padang bolak', '1995-04-05', 'jalan setia budi gang.rahmat', 'UNIKA_11406906_883520701719221_5108591009567533980_n.jpg', '-', '085376885913', 'smk taruna satria pekanbaru', 'jalan delima nomor 5', 'kecamatan panam', '-', 'pekanbaru', 'riau', '2014', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Ramlan situmorang', '6', '4', '1', '3', 'Dormani boru tobing', '8', '2', '1', '2', 'pekanbaru kandis desa pauh', '-', '-', '5 orang', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0029097403', '0000-00-00', '1', '', '54566'),
('140840040', 'DUMA JULIDA PANDIANGAN', '08', '084', 'P', 'K', 'A', '5', 'B', 'Palipi', '1996-10-10', 'Jalan saroja 2 no 2, tanjung slamat', 'UNIKA_17077605_158980964618587_8671529994142351360_n.jpg', '20132', '081264286789', 'SMK GRAFIKA BINA MEDIA MEDAN', 'Jalan setia budi no 479, tanjung sari medan', 'Medan selayang', '-', '-', '-', '-', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Arab Pandiangan', '6', '4', '2', '3', 'Manumpan Manullang', '6', '4', '1', '2', 'jalan Dusun Tornauli, kec Aek korsik', '12132', '082164954842', '5', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0029097403', '0000-00-00', '1', '', '-'),
('140840041', 'APRINSON SIAGIAN', '08', '084', NULL, NULL, NULL, '1', NULL, '1', '2016-10-03', '1', NULL, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2016-10-10', 1, 1, '', '0000-00-00', '', '', '', '', 0, '', '1', '2', '1', '1', '1', '1', '2', '2', '1', '1', '1', '1', '1', '1', '', '', '', '', '', '', 'M', NULL, 'A', NULL, NULL, NULL, '', NULL, '0125058003', '0000-00-00', '1', '', ''),
('140840042', 'RIAN RENDI PANE', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0125058003', '0000-00-00', '', '', ''),
('140840043', 'DEWI MAKDALENA', '08', '084', 'P', 'P', 'A', '9', 'B', 'PARDAMEAN', '1986-11-02', 'jln.setibudi tanjungsari Gg.pepaya medan', NULL, '20132', '085358383039', 'SMA N2 LW SIGALA_GALA', 'PARDAMEAN', 'BABULMAKMUR', 'ACEH TENGGARA', 'KUTA CANE', 'NANGRO ACEH DARUSALAM', '2014', '-', '0000-00-00', 0, 0, '', '0000-00-00', '-', '-', '-', '-', 0, '-', 'MANGATAS PANGARIBUAN', '1', '3', '1', '1', 'ROSMASENTI SILAEN', '1', '3', '1', '2', 'PARDAMEAN', '24673', '082162350192', '6', '-', '', '', '', '-', '-', 'S', '', 'A', NULL, NULL, NULL, '', NULL, '0125058003', '0000-00-00', '1', '', '-'),
('140840044', 'IAN TULUS SAPUTRA SILITONGA', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0125058003', '0000-00-00', '', '', ''),
('140840045', 'KONTESA PANJAITAN', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0125058003', '0000-00-00', '', '', ''),
('140840046', 'LAMPITA SIREGAR', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0125058003', '0000-00-00', '', '', ''),
('140840047', 'SYALOM RAMOTAN SITUMORANG', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0125058003', '0000-00-00', '', '', ''),
('140840048', 'BENNYFIRMAN RISKY HASIBUAN', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0125058003', '0000-00-00', '', '', ''),
('140840049', 'ANDREIYA ISWAN FIRJAY BARUS', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0125058003', '0000-00-00', '', '', ''),
('150810001', 'AGUS YOSTIN DAELI', '08', '081', 'L', 'K', 'A', '-', 'B', 'Medan', '1997-08-22', 'Jln. Melati Raya', 'UNIKA_DAELI.jpg', '-', '082276774257', 'SMA NEGERI 1 LAHOMI', 'Desa Onowaembo', 'Lahomi', 'Nias Barat', '-', 'Sumatera Utara', '2015', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Yosafat Badugo Daeli', '1', '2', '1', '1', 'Atisa Zebua', '2', '4', '1', '1', 'Onowambo Kec. lahomi Kab. Nias Barat', '22863', '085372131861', '1 Orang', '', '', '', '', '', '', 'M', 'M', 'A', NULL, NULL, NULL, '', NULL, '0116117302', '0000-00-00', '1', '', '1204252208970001'),
('150810002', 'SRI KARTINI SIMARMATA', '08', '081', 'P', 'K', 'A', '3', 'B', 'Medan', '2016-01-07', 'jl.kamboja VI perumnas helvetia Medan', 'UNIKA_Capture.PNG', '20124', '082165447218', 'SMA NEGERI 1 SINUNUKAN', '1', '1', '1', '1', '1', '1', '1', '2016-10-18', 1, 1, '-', '0000-00-00', '-', '-', '-', '-', 0, '-', 'Yustinus Simarmata', '6', '6', '2', '0', 'Melinda Rina Pasaribu', '6', '6', '2', '0', '1', '1', '1', '1', '-', '', '', '', '-', '-', 'M', '-', 'A', NULL, NULL, NULL, '', NULL, '0116117302', '0000-00-00', '1', '', '1'),
('150810003', 'PETRUS MEIDIANTO GINTING', '08', '081', NULL, NULL, NULL, '3', NULL, 'Medan', '1997-05-30', 'Jln.Bunga Cempaka XIII No.58 C', NULL, '20131', '082362167011', 'SMK Raksana Medan', '-', '-', '-', '-', '-', '-', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Daniel Abadi Ginting', '7', '4', '1', '1', 'Tamianta br Perangin angin', '2', '5', '1', '2', 'Jln.Bunga Cempaka XIII NO.58 C', '20131', '081376163820', '3', '', '', '', '', '', '', 'L', NULL, 'A', NULL, NULL, NULL, '', NULL, '0116117302', '0000-00-00', '1', '', ''),
('150810004', 'REKA ROLENA MANURUNG', '08', '081', 'P', 'K', 'A', '5', 'B', 'Afd XII Bahjambi', '1996-10-14', 'Huta Purwodadi Afd XII Bahjambi III', 'UNIKA_reka[1].jpg', '-', '085261551204', 'SMA SWASTA BINAGUNA TANAH JAWA', '-', 'Tanah Jawa', 'Simalungun', 'Pematang Siantar', 'Sumatera Utara', '2014', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'PARSAORAN MANURUNG', '1', '4', '1', '1', 'HERMINA BUTAR-BUTAR', '2', '4', '1', '3', 'Huta Purwodadi Afd XII Bahjambi III', '-', '-', '-', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0116117302', '0000-00-00', '1', '', '-'),
('150810005', 'ELSA MARTIS DAMANIK', '08', '081', 'P', 'K', 'A', '0', 'B', 'Kisaran', '1991-07-17', 'Komplek Perumahan Waikiki', NULL, '20132', '082285375276', '-', '-', '', '', '', '-', '-', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Martinus Damanik', '6', '6', '1', '1', '-', '8', '6', '1', '1', 'Dusun III Desa Ofa Padang Mahondang', '21273', '081260578735', '1 Orang', 'Geradus Pulo Damanik', '6', '6', '1', 'Komplek Perumahan Galaxy Residence - Medan Tuntungan', '082274884866', 'M', '', 'A', NULL, NULL, NULL, '', 'E-TIKET PADA BUS PT.ALMASAR INDONESIA DI KOTA MEDAN', '0116117302', '0000-00-00', '1', '0115027901', '1209145707910003'),
('150810006', 'BAKTI DAS EGER DAMANIK', '08', '081', 'L', 'K', 'A', '6', 'B', 'MEDAN', '1997-05-19', 'JALAN MENTENG 2 GANG PELITA NO2A', 'UNIKA_as.jpg', '20217', '085207003541', 'SMA NEGERI 14 MEDAN', 'JALAN PELAJAR TIMUR UJUNG', 'MEDAN DENAI', '-', '-', 'SUMATRA UTARA', '-', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'MANSEN DAMANIK', '8', '4', '2', '1', 'TIURMINA SIMARMATA', '6', '4', '1', '2', 'JALAN MENTENG 2 GANG PELITA NO 2A', '20217', '085207003541', '2', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0116117302', '0000-00-00', '1', '', '127110190597002'),
('150810007', 'HOSEA GLORI BR GINTING', '08', '081', 'P', 'K', 'A', '6', 'B', 'kabanjahe', '1997-08-11', 'Alam baru jl.penerbangan', 'UNIKA_2X3 (2).jpg', '-', '085760014783', 'SMA NEGERI 2 KABANJAHE', 'Jl jamin ginting kabanjahe', 'Simpang empat', 'karo', '', 'SUMATERA UTARA', '2015', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Johannis Ginting', '2', '6', '2', '2', 'Aslinta Sitepu', '1', '4', '1', '2', 'Desa Nangbelawan', '-', '-', '1', '-', '', '', '', '-', '-', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0116117302', '0000-00-00', '1', '', '1206125607970001'),
('150810008', 'CHIKA MEYANA SARAGIH', '08', '081', 'P', 'P', 'A', '2', 'B', 'Haranggaol', '1997-05-30', 'Jalan ngumban Surbakti gang sedapmalam V', 'UNIKA_chika[1].jpg', '-', '085370039850', 'SMK SWASTA TELADAN PEMATANGSIANTAR', 'PEMATANGSIANTAR', '-', '-', '-', '-', '2015', '-', '0000-00-00', 0, 0, '-', '0000-00-00', '-', '-', '-', '', 0, '-', 'JONNIAMAN SARAGIH', '1', '3', '1', '1', 'RANIA SINAGA', '1', '4', '1', '1', 'HARANGGAOL', '-', '085276885746', '2', '-', '', '', '', '', '', 'S', '-', 'A', NULL, NULL, NULL, '', NULL, '0116117302', '0000-00-00', '1', '', '-'),
('150810009', 'EDLI RUMIAR MANIK', '08', '081', 'L', 'K', 'A', '5', 'B', 'BAH BANGUN', '1996-05-11', 'GANG BERSAMA', 'UNIKA_editan.jpg', '-', '085297425096', 'SMA N 1 SIDAMANIK', 'JLN. BESAR SIDAMANIK', 'SIDAMANIK', 'SIMALUNGUN', 'PEMATANG SIANTAR', 'SUMATRA UTARA', '2015', '-', '2015-05-14', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'MARJON MANIK', '1', '2', '1', '2', 'NISIP SILALAHI', '1', '3', '1', '2', 'BAH BANGUN', '21711', '-', '4', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0116117302', '0000-00-00', '1', '', '1208101105960001'),
('150810010', 'DEVITA SARI NAINGGOLAN', '08', '081', 'P', 'K', 'A', '8', 'B', 'Kbn.sayur,Sei Bamban', '1997-01-10', 'Tj.Anom,Jl.Sembahe Baru', 'UNIKA_devitta.jpg', '20353', '082276715875', 'SMK NEGERI 1 SEI RAMPAH', 'Kebun Sayur', 'Sei Bamban', 'Serdang Bedagai', '', 'Sumatera Utara', '2015', '-', '2015-05-15', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Salam nainggolan', '1', '4', '2', '1', 'Meryati Sitohang', '1', '4', '1', '1', 'kebun sayur, Sei Bamban', '20695', '081263864575', '4', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0116117302', '0000-00-00', '1', '', '1218155001970001'),
('150810011', 'MEI PRANDIAWAN AMBARITA', '08', '081', 'L', 'K', 'A', '4', 'B', 'Perdagangan', '1998-05-03', 'Jln.Bungan Cempaka Psr III ,Setia Budi', 'UNIKA_11054_616038171829158_3050782805494608702_n.jpg', '20131', '081268144680', 'SMA Negeri 1 Kandis', '/', 'Kandis', 'Siak', '', 'Riau', '2015', '/', '2016-09-14', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Repin Ambarita', '1', '4', '1', '3', 'Sri Lestari Silalahi', '1', '4', '1', '1', 'Libo Pauh Km 26 Bonai Darussalam', '/', '085363197042', '4', '', '', '', '', '/', '/', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0116117302', '0000-00-00', '1', '', '/'),
('150810012', 'HERI HERMAWAN SIPAYUNG', '08', '081', NULL, NULL, NULL, '2', NULL, 'marihat', '1997-08-01', 'Jln.raharja pondok batuan no.10 tanjung ', NULL, '', '085261076939', '-', '-', 'purba', 'simalungun', '-', 'sumatera utara', '2015', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Sarpin sipayung', '4', '2', '1', '3', 'Rostaulina purba', '1', '4', '1', '1', 'Tigarunggu', '21165', '-', '2', '', '', '', '', '', '', 'M', NULL, 'A', NULL, NULL, NULL, '', NULL, '0116117302', '0000-00-00', '1', '', ''),
('150810013', 'EMMY SARINA SIHALOHO', '08', '081', 'P', 'K', 'A', '1', 'B', '11', '2016-10-17', '1', 'UNIKA__DSC1108.JPG', '1', '1', '2', '2', '2', '2', '2', '2', '2', '2', '2016-10-18', 2, 2, '', '0000-00-00', '', '', '', '', 0, '', '2', '2', '2', '1', '1', '2', '6', '5', '1', '2', '2', '2', '2', '2', '', '', '', '', '', '', 'L', '', 'A', NULL, NULL, NULL, '', NULL, '0122107901', '0000-00-00', '1', '', '1202044106960002'),
('150810014', 'IVO TINAMBUNAN', '08', '081', 'L', 'K', 'A', '3', 'B', 'Medan', '1997-05-19', 'Jl.A.Haris nasution Gg.horas No.15', 'UNIKA_imageipo.jpg', '20143', '085270181269', 'SMA CAHAYA MEDAN', 'Jl.Hayam Wuruk No.11', 'Medan Baru', '', 'Medan', 'Sumatera utara', '2015', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Ruslan Tinambunan', '5', '5', '1', '1', 'Betty Sinabariba', '5', '5', '2', '1', 'Jl.A.Haris Nasution Gg.horas No.15', '20143', '081264596464', '4', '', '', '', '', '', '', 'XL', '', 'A', NULL, NULL, NULL, '', NULL, '0122107901', '0000-00-00', '1', '', '1271111905970001'),
('150810015', 'WILLIAM DERSON FAUZI TINAMBUNAN', '08', '081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0122107901', '0000-00-00', '', '', ''),
('150810016', 'EVRI PEBRIANI MANIK', '08', '081', 'P', 'K', 'A', '3', 'B', 'medan ', '1996-04-13', 'Komp Srigunting Blok B No 27 - medan sun', 'UNIKA_IMG20160626062241.jpg', '20128', '085361061558', 'Smk Brigjend Katamso 1 ', '-', 'medan-sunggal', 'deli serdang ', 'medan', 'sumatera utara', '-', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Effendi Manik', '6', '4', '1', '2', 'Roslin Br Sihombing', '8', '3', '1', '1', 'Komp Srigunting Blok B No 27 - medan sun', '20128', '081362055788', '3', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0122107901', '0000-00-00', '1', '', '0'),
('150810017', 'IDE MONIKA SITEPU', '08', '081', NULL, NULL, NULL, '1', NULL, 'MEDAN', '0000-00-00', 'JALAN ANGGREK RAYA NO.180', NULL, '20135', '085261109372', 'SMK N 8 MEDAN', 'JALAN ANGGREK RAYA NO.180', 'MEDAN TUNTUNGAN', '-', 'MEDAN', 'SUMATERA UTARA', '-', '-', '0000-00-00', 0, 0, '', '0000-00-00', 'UNIKA SANTO THOMAS MEDAN', '-', 'SMK N 8 MEDAN', 'S1', 18, '-', 'ALIM VIUS SITEPU', '1', '4', '2', '2', 'BAGEDI NATALIA BR SEMBIRING', '1', '5', '1', '2', 'JALAN ANGGREK RAYA NO.180', '20135', '081376624979', '1', 'BAGEDI NATALIA BR SEMBIRING', '1', '5', '2', 'JALAN ANGGREK RAYA NO.180', '081376624979', 'M', NULL, 'A', NULL, NULL, NULL, '', NULL, '0122107901', '0000-00-00', '1', '', ''),
('150810018', 'ANDIKA SEBAYANG', '08', '081', 'L', 'K', 'A', '2', 'B', 'Gunung', '1996-05-17', 'jln.Bunga Rinte Gang Kaban', 'UNIKA_andika.jpg', '1234', '082362873707', 'SMA N 1 TIGABINANGA', 'DESA GUNUNG', 'TIGA BINANGA', 'KARO', '', 'SUMATRA UTARA', '2014', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'RISMAN SEBAYANG', '1', '2', '1', '2', 'RIA br SEMBIRING', '1', '4', '1', '1', 'DESA GUNUNG', '1234', '081396783406', '-', '', '', '', '', '', '', 'L', '', 'A', NULL, NULL, NULL, '', NULL, '0122107901', '0000-00-00', '1', '', '1206080107950006'),
('150810019', 'KIKI NARYO SIMAMORA', '08', '081', NULL, NULL, NULL, '-', NULL, '-', '0000-00-00', '-', NULL, '0', '-', '-', '-', '-', '-', '-', '-', '-', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '-', '-', '-', 0, '-', '-', '2', '1', '1', '1', '-', '1', '1', '1', '1', '-', '', '', '-', '', '', '', '', '', '', 'M', NULL, 'A', NULL, NULL, NULL, '', NULL, '0122107901', '0000-00-00', '1', '', ''),
('150810020', 'EVITA SITANGGANG', '08', '081', 'P', 'K', 'A', '7', 'B', 'Cinta Maju', '1997-03-28', '-', 'UNIKA_DSC_6844.JPG', '-', '082274453509', 'SMA Katolik Cinta Kasih', '-', '-', '-', '-', '-', '-', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '-', '-', '-', 0, '-', 'Jatua Sitanggang', '1', '3', '1', '2', 'Tama Uli Malau', '1', '2', '1', '2', 'Indrapura', '21256', '082164036454', '2', '-', '', '', '', '-', '-', 'S', '', 'A', NULL, NULL, NULL, '', NULL, '0122107901', '0000-00-00', '1', '', 'belum ada'),
('150810021', 'ELISAHAB MATUA PINAYUNGAN', '08', '081', 'L', 'P', 'A', '4', 'B', 'P.O MANDUAMAS', '1996-07-08', 'Tanjung sari Jl. Setia Budi Gg Pemda', 'UNIKA_C360_2016-05-04-09-48-09-122.jpg', '-', '082368858021', 'SMA NEGERI 1 MANDUAMAS', 'MANDUAMAS', 'MANDUAMAS', 'TAPANULI TENGAH', '-', 'SUMATRA UTARA', '2015', 'DN-07 Ma 0044253', '2015-05-15', 0, 0, '-', '0000-00-00', '-', '-', '-', '-', 0, '-', 'AHMAD PINAYUNGAN', '1', '3', '2', '1', 'TIORENNI SIMANULLANG', '2', '4', '1', '3', 'MANDUAMAS', '22565', '082161426674', '4', '-', '', '', '', '-', '-', 'M', '-', 'A', NULL, NULL, NULL, '', NULL, '0122107901', '0000-00-00', '1', '', '-'),
('150810022', 'SAFARMAN JAYA HALAWA', '08', '081', 'L', 'K', 'I', '2', '', 'Olayama', '1997-09-13', 'Jl. Setia Budi Gg. Pepaya No. 1B Tanjung', NULL, '20132', '082272100375', 'SMA SWASTA PEMBDA 1 GUNUNGSITOLI', 'Jl. Pelita No.09 Gunungsitoli-Nias', '', '', '', 'Sumatera Utara', '2015', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'LEWI HALAWA', '2', '5', '1', '3', 'NUTIBA GULO', '1', '4', '1', '1', 'Jl. Nias Tengah KM. 60 Nias', '22867', '081362822940', '2', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0122107901', '0000-00-00', '1', '', ''),
('150810023', 'ANDRO LUMBAN GAOL', '08', '081', NULL, NULL, NULL, '1', NULL, '1', '2016-10-16', '1', NULL, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2016-10-03', 1, 1, '', '0000-00-00', '', '', '', '', 0, '', '1', '3', '3', '2', '1', '2', '4', '3', '1', '1', '1', '1', '1', '1', '', '', '', '', '', '', 'M', NULL, 'A', NULL, NULL, NULL, '', NULL, '0122107901', '0000-00-00', '1', '', ''),
('150810024', 'SUKMA LIANI BR SEMBIRING KEMBAREN', '08', '081', 'P', 'P', 'A', '2', 'B', 'laubaleng', '1996-06-10', 'jln.setiabudi no.482 tanjung sari medan', 'UNIKA_sukma.JPG', '20132', '081360873675', 'SMA negri 1 tigabinanga', 'tigabinanga', 'tigabinanga ', 'karo', '-', 'Sumatra utara', '2014', 'DN-07 Ma 0023480', '2014-05-26', 24, 5, '', '0000-00-00', '', '', '', '', 0, '', 'JASON SEMBIRING KEMBAREN', '1', '3', '1', '2', 'DIANA BR PINEM', '1', '3', '1', '2', 'desa sukajulu ', '22162', '082165549052', '2', '', '', '', '', '', '', 'XL', '-', 'A', NULL, NULL, NULL, '', NULL, '0122107901', '0000-00-00', '1', '', '1206084107950039'),
('150810025', 'EMEN HOTMAN', '08', '081', NULL, NULL, NULL, '1', NULL, '1', '2016-12-04', '1', NULL, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2016-12-04', 1, 1, '', '0000-00-00', '', '', '', '', 0, '', '1', '2', '3', '1', '1', '1', '1', '3', '1', '1', '11', '1', '1', '1', '1', '2', '3', '1', '1', '1', 'S', NULL, 'A', NULL, NULL, NULL, '', NULL, '0122107901', '0000-00-00', '1', '', ''),
('150840001', 'MAYSHELA FITHRIA BR. SEMBIRING', '08', '084', 'P', 'P', 'A', '3', 'B', 'bandar-baru', '1997-05-27', 'Dusun I bandar-baru', 'UNIKA_222.jpg', '20357', '082165370393', 'SMA RK DELI MURNI BANDAR-BARU', 'bandar-baru jl.jamin ginting km 43', 'sibolangit', 'Deliserdang', 'Medan', 'SUMATERA UTARA', '2015', '0', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'NUAH SEMBIRING', '5', '3', '1', '2', 'SRIWATI BR.GINTING', '1', '3', '1', '1', 'BANDAR-BARU', '20357', '081360155913', '2', '', '', '', '', '', '', 'S', '', 'A', NULL, NULL, NULL, '', NULL, '0108117501', '0000-00-00', '1', '', '1207036705970001'),
('150840002', 'DESIAMAN', '08', '084', 'L', 'K', 'A', '5', 'B', 'Aek Arong', '1995-09-21', 'Jl. Flamboyan Raya', 'UNIKA_DSC_0778.jpg', '-', '085361644366', 'Smk Sw Maduma Sibolga', 'Tukka', 'Pandan', 'Tapanuli Tengah', 'Sibolga', 'Sumatera Utara', '2015', '0', '2015-07-22', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Suono Telaumbanua', '6', '2', '1', '1', 'Yulisa Zendrato', '6', '2', '1', '1', 'Tapanuli Selatan', '-', '-', '5', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0108117501', '0000-00-00', '1', '', '1203012109950001'),
('150840003', 'PRETTY MARTAULINA SITOMPUL', '08', '084', 'P', 'K', 'A', '8', 'B', 'Gardu', '1996-08-28', 'Jln.Setia Budi tanjung sari, Gg.horas', 'UNIKA_PRETTI.jpg', '-', '082277744080', 'SMK SWASTA YAPIM TARUNA STABAT', 'STABAT', '-', '-', 'STABAT', 'SUMATERA UTARA', '2015', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Saut Halomoan Sitompul', '6', '4', '1', '1', 'Kedelima Br Nainggolan', '1', '1', '1', '1', 'Gardu Tg.Putus', '-', '-', '3', '', '', '', '', '', '', 'S', '', 'A', NULL, NULL, NULL, '', NULL, '0108117501', '0000-00-00', '1', '', '1205126808960008'),
('150840004', 'INTAN SARI SEMBIRING KEMBAREN', '08', '084', 'P', 'K', 'A', '4', 'B', 'PEMATANGSIANTAR', '1998-04-23', 'JL.UNIKA ', 'UNIKA_intan.jpg', '-', '085296908023', 'SMA SWASTA TELADAN ', 'JL.SINGOSARI NO.3', 'SIANTAR BARAT', 'SIMALUNGUN', 'PEMATANGSIANTAR', 'SUMATERA UTARA', '2015', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'PATIAMAN SEMBIRING KEMBAREN', '6', '4', '1', '2', 'HERLINA WATY SIDABUTAR', '3', '4', '1', '2', 'JL.PDT J WISMAR SARAGIH', '21142', '081362475520', '4', '', '', '', '', '', '', 'S', '', 'A', NULL, NULL, NULL, '', NULL, '0108117501', '0000-00-00', '1', '', '-'),
('150840005', 'RIKKI KARDO TARIGAN', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0108117501', '0000-00-00', '', '', ''),
('150840006', 'THEODORA LOLA S', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0108117501', '0000-00-00', '', '', ''),
('150840007', 'SUSI DAHYANTI NAINGGOLAN', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0108117501', '0000-00-00', '', '', ''),
('150840008', 'JONI SIHOMBING', '08', '084', 'L', 'K', 'A', '5', 'B', 'DESA PON ', '1998-05-03', 'Jl. Setia Budi Pasar 1, Tanjung sari Med', 'UNIKA_joni_sihombing.jpg', '-', '082166470828', 'SMAN 1 SEIBAMBAN', 'DSN.VI DESA PON', 'SEIBAMBAN', 'SERDANG BEDAGAI', 'MEDAN', 'SUMATERA UTARA', '2015', '-', '0000-00-00', 0, 0, '', '0000-00-00', '-', '-', '-', '-', 0, '-', 'SARLES SIHOMBING', '4', '4', '1', '2', 'TIURMA SILALAHI', '2', '4', '1', '2', 'DESA PON', '20995', '-', '5', '-', '', '', '', '-', '-', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0108117501', '0000-00-00', '1', '', '-'),
('150840009', 'EVALINA SIMARMATA', '08', '084', 'P', 'P', 'A', '2', 'B', 'simantin 3', '1997-04-20', 'jl.Tanjung sari ', 'UNIKA_eva.jpg', '-', '085275090900', 'SMA SWASTA METHODIST', 'PEMATANG SIANTAR', '-', '-', 'MADYA', 'SUMATERA UTARA', '2015', '-', '2015-05-19', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'JUARA SIMARMATA (ALM)', '6', '3', '2', '1', 'HETTY NAINGGOLAN', '6', '4', '1', '2', 'SIMANTIN PANEI DAME', '-', '082160850538', '2', '', '', '', '', '', '', 'S', '', 'A', NULL, NULL, NULL, '', NULL, '0108117501', '0000-00-00', '1', '', '1208046004970004'),
('150840010', 'SANDRI AGUNG SIMBOLON', '08', '084', 'L', 'K', 'A', '7', 'B', 'Arapayung', '1997-12-20', 'Jln. Setia Budi Gg. Pemda', 'UNIKA_12552618_516072171887467_8571157709383102183_n.jpg', '-', '081266285419', 'SMK Negeri 1 Pantai Cermin', 'Desa Arapayung Dusun 3', 'Pantai Cermin', 'Serdang Bedagai', '-', 'Sumatera Utara', '2015', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Ojak Simbolon', '1', '2', '1', '3', 'Melly Sinaga', '1', '4', '1', '1', 'Desa Arapayung Dusun 3', '20987', '082168540283', '7', '', '', '', '', '', '', 'XL', '-', 'A', NULL, NULL, NULL, '', NULL, '0108117501', '0000-00-00', '1', '', '-'),
('150840011', 'TRINO SUANTO MANULLANG', '08', '084', NULL, NULL, NULL, '6', NULL, 'SIMATUPANG', '1992-03-20', 'Jln.Setia Budi Tanjung Sari', NULL, '20132', '082365160289', 'SMA N 1 MUARA ', 'DESA SIMATUPANG ', 'KEC.MUARA ', 'TAPANULI UTARA', 'KOTA MEDAN', 'SUMATERA UTARA', '2009', '-', '0000-00-00', 0, 0, '', '2014-09-20', 'UNIVERSITAS PUTERA BATAM', '-', 'SMA N 1 MUARA', 'S1', 86, '-', 'ALADIN MANULLANG', '1', '2', '1', '1', 'MANGISI TOGATOROP', '1', '2', '1', '1', 'JLN.GEREJA DESA SIMATUPANG', '-', '085262926275', '-', '-', '', '', '', '-', '-', 'S', NULL, 'A', NULL, NULL, NULL, '', NULL, '0124126801', '0000-00-00', '1', '', ''),
('150840012', 'JOHANSEN SITUMORANG', '08', '084', NULL, NULL, NULL, '5', NULL, 'mela ,sibolga', '1998-03-04', 'Tanjung Sari Gg.Rahmat', NULL, '-', '081377382466', 'SMK Negeri 1 Sibolga', 'Jl.ferdinand lumban tobing no . 33 Samping rumah sakit', '-', '-', 'Sibolga', 'Sumatera Utara', '2015', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'MARALI SITUMORANG', '8', '4', '1', '1', 'POSMA PANJAITAN', '8', '3', '1', '1', 'Jl.sibolga-barus Km 8.5 , Poriaha Panoru', '-', '085275188590', '5', '', '', '', '', '', '', 'M', NULL, 'A', NULL, NULL, NULL, '', NULL, '0124126801', '0000-00-00', '1', '', ''),
('150840013', 'ADIYANTO OKTAVIANUS BUATON', '08', '084', 'L', 'K', 'A', '3', 'B', 'MEDAN', '1996-10-07', 'JLN.ANGGREK 1 NO.12 SIMP SELAYANG KEC ME', 'UNIKA_adi1.jpg', '20135', '085361288601', '-', '-', '-', '-', '-', '-', '-', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'TASIUS BUATON', '6', '5', '1', '2', 'REPELITA BARASA', '5', '6', '1', '2', 'JLN.ANGGREK 1 NO.12 SIMP SELAYANG KEC ME', '20135', '081263527118', '3', '', '', '', '', '', '', 'L', '', 'A', NULL, NULL, NULL, '', NULL, '0124126801', '0000-00-00', '1', '', '1271070710960002'),
('150840014', 'EDDY SAPUTRA PANGGABEAN', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0124126801', '0000-00-00', '', '', ''),
('150840015', 'LAMRIA LUMBANRAJA', '08', '084', 'P', 'K', 'A', '5', 'B', 'Dusun VIII Jatian', '2016-11-10', 'Jl Pijar Podi No 135 H', 'UNIKA_LAMRIA.jpg', '-', '082273708341', 'SMA NEGERI 1 SEI BAMBAN', 'JALAN PENDIDIKAN DESA GEMPOLAN', 'SEI BAMBAN', 'SERDANG BEDAGAI', 'TEBING TINGGI', 'SUMATRA UTARA', '-', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'MAGDIN LUMBANRAJA', '2', '4', '1', '2', 'ROBINA ETROPIA SINAGA', '1', '2', '1', '1', 'Dusun VIII Jatian', '20695', '081264141115', '1', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0124126801', '0000-00-00', '1', '', '-'),
('150840016', 'ITA JUWITA SARAGIH', '08', '084', 'P', 'K', 'A', '3', 'B', 'Malasori', '1997-02-01', 'Jln.Pijar Podi No135 H', 'UNIKA_IMG copy.jpg', '-', '081264423186', 'SMA N1 SEI BAMBAN', 'Jln.Pendidikan Gempolan', 'Sei Bamban', 'Serdang Bedagai', '-', 'Sumatera Utara', '2015', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'SAKEN SARAGIH', '1', '4', '1', '1', 'OLU ANI DAMANIK', '1', '4', '1', '1', 'Malasori ', '-', '085398004865', '4 Orang', '', '', '', '', '', '', 'S', '', 'A', NULL, NULL, NULL, '', NULL, '0125058003', '0000-00-00', '1', '', '-'),
('150840017', 'HERMAN LASE', '08', '084', 'L', 'K', 'A', '2', 'B', 'OMBOLATA AFULU', '1996-10-20', 'OMBOLATA AFULU', 'UNIKA_herman1.jpg', '-', '081269142796', 'SMA NEGERI 1 AFULU', 'AFULU', 'AFULU', 'NIAS UTARA', 'LOTU', 'SUMATERA UTARA', '2014', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'AFERLI LASE', '1', '1', '1', '2', 'YUNIANI ZALUKHU', '1', '1', '1', '2', 'OMBOLATA AFULU', '-', '081264691109', '2', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0125058003', '0000-00-00', '1', '', '1204142010960001'),
('150840018', 'MEI LESTARI HAREFA', '08', '084', 'P', 'P', 'A', '4', 'B', 'Hiliweto', '1997-05-31', 'Jl. Setia Budi Tanjung Sari No.482, Meda', 'UNIKA_MEI.JPG', '-', '082369057409', 'Sekolah Swasta Lentera Harapan Gunungsitoli Utara', 'Jl. Arah Awa\'ai Km. 12,5', 'Gunungsitoli Utara', 'Gunungsitoli', 'Gunungsitoli', 'Sumatera Utara', '2015', 'DN-07 Ma 0022976', '2015-05-15', 340.4, 56.7, '', '0000-00-00', '', '', '', '', 0, '', 'Manase Harefa', '8', '6', '1', '3', 'Nurhawari Zendrato', '8', '4', '1', '2', 'Jl. Golkar Pondok Baru No.03, Nias', '-', '081383344572', '-', '', '', '', '', '', '', 'S', '', 'A', NULL, NULL, NULL, '', NULL, '0125058003', '0000-00-00', '1', '', '1204017105970002'),
('150840019', 'SANDI W PANJAITAN', '08', '084', NULL, NULL, NULL, '4', NULL, 'Buluduri', '1997-08-01', 'Jln setia Budi Tanjung Sari Pasar V Meda', NULL, '22383', '082384793057', ' SMA NEGERI 1 HABINSARAN', 'PARSOBURAN', 'KECAMATAN HABINSARAN', 'TOBA SAMOSIR', 'MEDAN', '-', '2015', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'RAMSES PANJAITAN', '1', '4', '1', '2', 'HOTNA SIMATUPANG', '1', '4', '1', '2', 'PARSOBURAN', '22383', '081362348730', '4 ', '', '', '', '', '', '', 'M', NULL, 'A', NULL, NULL, NULL, '', NULL, '0125058003', '0000-00-00', '1', '', ''),
('150840020', 'HERDIN LAIA', '08', '084', 'L', 'K', 'A', '5', 'B', 'Sibolga', '1997-02-11', 'Jl. Flamboyan, Gang Bersama, Medan', 'UNIKA_DSC04266.JPG', '20132', '085261912165', 'SMK Negeri 1 Amandraya', 'Amandraya', 'Kec. Amandraya', 'Nias Selatan', 'Teluk Dalam', 'Sumatera Utara', '2015', '/', '2015-10-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Asarudi Laia', '6', '2', '1', '1', 'Terimakasih Sihura', '8', '2', '1', '1', 'Desa Boholu, Kec. Amandraya', '/', '081263769094', '7', '/', '', '', '', '/', '/', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0125058003', '0000-00-00', '1', '', '1214071102970004'),
('150840021', 'REYMONDO SIMANJUNTAK', '08', '084', NULL, NULL, NULL, '4', NULL, 'Pematang Siantar', '1997-03-14', 'Jln.SetiaBudi Simpang UNIKA Medan', NULL, '', '082360015711', 'SMA SWASTA SANTO YOSEPH MEDAN', 'jln,flamboyan raya no 139', '', '', '', 'SUMATRA UTARA', '2015', '0', '2015-10-15', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Antony Victor Simanjuntak', '6', '4', '1', '1', 'Rumida Sinaga', '8', '4', '1', '1', 'Jln.Simpang Smallholder BaganBatu ,Riau', '', '085271607575', '4', '', '', '', '', '', '', 'M', NULL, 'A', NULL, NULL, NULL, '', NULL, '0029097403', '0000-00-00', '1', '', ''),
('150840022', 'JOGI M S SIAHAAN', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0029097403', '0000-00-00', '', '', ''),
('150840023', 'HARIS AURELIUS NAINGGOLAN', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0029097403', '0000-00-00', '', '', ''),
('150840024', 'BASTIAN WELFRID PURBA', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0029097403', '0000-00-00', '', '', ''),
('150840025', 'AMORIN RAMBE', '08', '084', NULL, NULL, NULL, '5', NULL, 'HABATU', '1997-11-16', 'Jl. Karya Cilincing Medan', NULL, '', '082168290296', 'SMA RK BINTANG TIMUR PEMATANGSIANTAR', 'Jl. Marimbun No.5 Pematangsiantar', '-', 'Simalungun', 'Pematangsiantar', 'Sumatera Utara', '2015', '-', '2016-10-11', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'HOLMAN RAMBE', '6', '4', '1', '3', 'LIDIA SINURAT', '1', '4', '1', '1', 'HABATU BANDAR PULO', '21184', '081361768007', '5', '', '', '', '', '', '', 'M', NULL, 'A', NULL, NULL, NULL, '', NULL, '0111067801', '0000-00-00', '1', '', ''),
('150840026', 'SORAYA MARIA GULTOM', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0111067801', '0000-00-00', '', '', ''),
('150840027', 'MATILDA FITRI HARTATI NABABAN', '08', '084', 'P', 'K', 'A', '5', 'B', 'KANDIS', '1998-03-17', 'Setia Budi Tanjung sari psr.III ', 'UNIKA_matilda.jpg', '-', '085363714716', 'SMK N 1 KANDIS ', '-', 'KANDIS', 'SIAK', 'PEKANBARU', 'RIAU', '2015', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'James Nababan', '6', '4', '1', '1', 'Nuraya Tohang', '8', '4', '1', '1', 'kandis psr.Minggu Km.80', '-', '085365567805', '5', '-', '', '', '', '', '', 'S', '', 'A', NULL, NULL, NULL, '', NULL, '0111067801', '0000-00-00', '1', '', '1408105703980005'),
('150840028', 'BASTIAN WELFRID PURBA', '08', '084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, '', NULL, '0111067801', '0000-00-00', '', '', ''),
('150840029', 'DEDY FRANSIDA SIDABUTAR', '08', '084', 'L', 'K', 'A', '4', 'B', 'Marihat Dolok', '1998-08-11', 'Jalan Ngumban Surbakti ,Tanjung Sarii', 'UNIKA_20170309_083158_copy.JPG', '20132', '081262175957', 'SMA N 1 Dolok Panribuan', 'Jalan Parapat Km.22', 'Dolok Panribuan', 'Simalungun ', 'Pematang Siantar', 'Sumatera Utara', '2015', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Pondang Sidabutar', '2', '6', '1', '3', 'Herdelima Sinaga', '6', '4', '1', '1', 'Jalan Parapat Km.22 Tiga Dolok', '21173', '081370024417', '5', '', '', '', '', '', '', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0111067801', '0000-00-00', '1', '', '_'),
('150840031', 'LENA SIAGIAN', '08', '084', 'P', 'K', 'A', '5', 'B', 'SIBANING', '1995-11-10', 'GANG RAHARJA NO 07 A TANJUNG SARI', 'UNIKA_LENA.jpg', '20132', '081360809929', 'SMA N 1 HABINSARAN', 'SIBANING', 'NASSAU', 'TOBA SAMOSIR', '', 'SUMATERA UTARA', '2014', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'GUNUNG SIAGIAN', '1', '4', '1', '2', 'REBESTINA SAGALA', '1', '3', '1', '1', 'SIBANING', '22383', '081265043428', '5', 'IIN PANJAITAN', '5', '6', '3', '', '', 'M', '', 'A', NULL, NULL, NULL, '', NULL, '0111067801', '0000-00-00', '1', '', '-'),
('150840032', 'OLIVIA ROMA RITO SAMOSIR', '08', '084', 'P', 'K', 'A', '4', 'B', 'Pekanbaru', '1997-06-09', 'jl.tanjung sari gg.keluarga', 'UNIKA_oliv.jpg', '-', '082277740497', 'SMK NEGERI 7 PEKANBARU', 'Jl.Erba Ujung', 'Rumbai Pesisir', 'Pekanbaru', 'Pekanbaru', 'Riau', '2015', '-', '2015-10-29', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'PARDAMEAN SAMOSIR', '5', '4', '1', '2', 'NERIA SITUMEANG', '8', '4', '1', '1', 'Jl.Erba Ujung', '-', '081365555690', '3', '', '', '', '', '', '', 'S', '', 'A', NULL, NULL, NULL, '', NULL, '0111067801', '0000-00-00', '1', '', '-'),
('150840051', 'DAVID F ARITONANG', '08', '084', NULL, NULL, NULL, '5', NULL, 'Tambunan,Lumban Gaol ', '1992-06-11', 'Jl Gang Pepaya', NULL, '', '085721583278', 'SMAN 2 Balige', 'Jl Kartini', 'Balige', 'Toba Samosir', 'Medan', 'Sumatera Utara', '2010', '0', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Elisker Aritonang', '1', '4', '1', '1', 'Lasmaria Tambunan', '2', '6', '1', '2', 'Tambunan,Lumban Gaol', '22312', '085276538130', '5', '', '', '', '', '', '', 'S', NULL, 'A', NULL, NULL, NULL, '', NULL, '0111067801', '0000-00-00', '1', '', ''),
('160810001', 'Zecrin Damai Harefa', '08', '081', 'L', 'P', 'A', '6', 'B', 'Kun-Kun', '1997-07-26', 'Jln. flamboyan, Gg Bersama, Medan, Sumat', 'UNIKA_fb.jpg', '-', '081377220871', 'SMA S Kesuma Indah', '-', '-', 'Tapanuli Selatan', 'Padangsidimpuan', 'Sumatera Utara', '2016', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Irwan', '1', '2', '1', '3', 'Notiria', '1', '2', '1', '1', 'NATAL, Mandailing natal, Sumut', '-', '082272282798', '9', '', '', '', '', '', '', 'M', '0', 'A', NULL, NULL, NULL, '', NULL, '0116117302', '2016-09-20', '1', '', '1213162607970002'),
('160810002', 'Veronika Situmorang', '08', '081', 'P', 'K', 'I', '4', 'B', 'Indrapura', '1996-06-05', 'Tanjung sari Jl. Setia Budi Gg Pepaya', 'UNIKA_IMG_20161006_111938.jpg', '21256', '082383941353', 'SMA NEGERI 1 AIR PUTIH', 'Indrapura', 'Sei Suka', 'Batu Bara', 'Indrapura', 'Sumatera Utara', '2014', '-', '2014-05-20', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Hotmaratur Tua Situmorang', '1', '4', '2', '1', 'Esti Simbolon', '1', '4', '1', '1', 'Indrapura', '21256', '082272727816', '4', '', '', '', '', '', '', 'S', '2', 'A', NULL, NULL, NULL, '', NULL, '0116117302', '2016-09-20', '1', '', ''),
('160810003', 'IRA MAGDALENA SINAGA', '08', '081', 'P', 'K', '', '5', 'B', 'INDRAPURA ', '1998-10-18', 'JLN TANJUNG SARI', 'UNIKA__MG_3524 copy.jpg', '2525', '-', 'SMA KATOLIK CINTA KASIH', 'JL. PERJUANGAN NO.5', 'SERDANG BERDAGAI', '', 'TEBING TINGGI', 'SUMATERA UTARA', '2016', '-', '2016-09-01', 62, 80, '', '0000-00-00', '', '', '', '', 0, '', 'ALBER SINAGA', '2', '4', '1', '3', 'RUSLAN MANIK', '2', '2', '1', '3', 'INDRAPURA', '-', '082273010962', '2', '-', '', '', '', '', '', 'S', '2', 'A', NULL, NULL, NULL, '', NULL, '0116117302', '2016-09-20', '1', '', ''),
('160810004', 'PIUS SALVATORE DEPARI', '08', '081', 'L', 'K', 'A', '3', 'B', 'Desa Ajimbelang', '1997-06-30', 'JLN. SETIA BUDI TANJUNG SARI', 'UNIKA_13233037_1041290839274647_4308231774272257814_n.jpg', '-', '081270851351', 'SMK N 1 MERDEKA', 'DESA AJIBUHARA', 'TIGAPANAH', 'KARO', 'KABANJAHE', 'SUMATRA UTARA', '2015', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'DEMO DEPARI', '1', '4', '1', '2', 'ELISABET BR SINUHAJI', '1', '4', '1', '2', 'DESA AJIBUHARA', '22171', '081370976978', '3', '', '', '', '', '', '', 'M', '0', 'A', NULL, NULL, NULL, '', NULL, '0116117302', '2016-09-20', '1', '', ''),
('160810005', 'RAUN HERYADI SINAGA', '08', '081', 'L', 'P', 'A', '2', 'B', 'medan', '1997-10-03', 'jln.luku no.3 medan', 'UNIKA_FB_IMG_14888996304222477.jpg', '-', '082252773161', 'sma negeri 1 pollung', 'parsingguran 2', 'pollung', 'humbang hasundutan', 'Dolok Sanggul', 'sumatera utara', '2016', '-', '0000-00-00', 0, 0, '', '0000-00-00', '-', '-', '-', '-', 0, '-', 'hulman sinaga', '1', '4', '1', '1', 'renta banjarnahor', '1', '4', '1', '2', 'parsingguran 2', '-', '082166649084', '2', 'Ihot Rumapea', '8', '6', '3', 'jl.jaya tani no.11 gang liasta', '081370438658', 'M', '0', 'A', NULL, NULL, NULL, '', NULL, '0116117302', '2016-09-20', '1', '', '1216020310970003'),
('160810006', 'Rudi sidabalok', '08', '081', 'L', 'P', 'A', '2', 'B', 'pematangsiantar', '1998-03-12', 'jalan.melati raya gg.anyelir', NULL, '21145', '082273895627', 'sma negeri 2 pematangsiantar', 'jallan patuan anggi no.8', 'siantar utara', 'kota pematangsiantar', 'pematangsiantar', 'sumatera utara', '2016', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'edison sidabalok', '8', '4', '1', '1', 'emnita sinaga', '6', '5', '1', '1', 'jalan mojopahit no.66', '21145', '081361095256', '3', '', '', '', '', '', '', 'M', '0', 'A', NULL, NULL, NULL, '', NULL, '0122107901', '2016-09-20', '1', '', ''),
('160810007', 'pantun sihombing', '08', '081', 'L', 'P', '', '2', 'B', '', '1997-04-16', 'jln gan bahagia 2', 'UNIKA_C360_2016-10-07-11-25-15-409.jpg', '22611', '081291207842', 'sma santo petrus sidikalang', 'jln lae hole', 'parbuluan', 'sidikalang', '', 'sumatra utara', '2016', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', 'sma santo petrus sidikalang', '', 0, '', 'takkas sihombing', '1', '4', '1', '1', 'wati sianturi', '1', '3', '1', '2', 'jln lae hole sidikalang dairi', '22452', '082274911145', '2', '-', '', '', '', '', '', 'L', '0', 'A', NULL, NULL, NULL, '', NULL, '0122107901', '2016-09-20', '1', '', '');
INSERT INTO `tbmahasiswa` (`npm`, `nm_mhs`, `fakultas`, `kd_prodi`, `jk`, `agama`, `kewarganegaraan`, `jlh_bersaudara`, `status_sipil`, `tmpt_lahir`, `tgl_lahir`, `alamat`, `Foto`, `kodepos`, `telp`, `nm_sma`, `alamat_sma`, `kecamatan`, `kabupaten`, `kota`, `provinsi`, `thn_lulus`, `no_ijazah`, `tgl_ijazah`, `jlh_un`, `rataun`, `no_surat_pindah`, `tgl_surat_pindah`, `pt_asal`, `prog_studi_pindah`, `asal_sekolah`, `jenjang`, `sks_yang_diakui`, `no_ijazah_terkhir`, `nm_ayah`, `pekerjaan_ayah`, `pendidikan_ayah`, `status_ayah`, `penghasilan_ayah`, `nm_ibu`, `pekerjaan_ibu`, `pendidikan_ibu`, `status_ibu`, `penghasilan_ibu`, `alamat_ortu`, `kd_pos_ortu`, `telp_ortu`, `jlh_tanggungan`, `namawali`, `pekwali`, `pendwali`, `pengwali`, `alamatwali`, `telpwali`, `ukuran_jaket`, `status_anak`, `status_mhs`, `penguji1`, `penguji2`, `status_potongan`, `penguji_tesprogram`, `judul_skripsi`, `dosenPA`, `tgl_daftar`, `status`, `dosen_pembimbing`, `no_ktp`) VALUES
('160810008', 'Fera novianti sibagariang', '08', '081', 'P', 'P', '', '6', 'B', 'hutaraja ', '1997-11-12', 'jln setia budi ', 'UNIKA_VERA.jpg', '22452', '082274559849', 'SMA NEG.1 SIBORONGBORONG', '-', 'SIPOHOLON', 'TAPANULI UTARA', '-', 'SUMATRA UTARA', '-', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'WALUSMAN SIBAGARIANG', '1', '4', '1', '1', 'ROMANTI PURBA', '1', '4', '1', '1', '-', '-', '-', '6', '', '', '', '', '', '', 'S', '0', 'A', NULL, NULL, NULL, '', NULL, '0122107901', '2016-09-20', '1', '', ''),
('160810009', 'Natal nadapdap', '08', '081', 'L', 'K', 'A', '5', 'B', 'DESA GAJAH', '1998-12-27', 'JLN.SETIA BUDI TANJUNG SARI', 'UNIKA_IMG20170228083435.jpg', '21264', '081375189978', '-', '-', '', '', '', '-', '-', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'ARSINIUS NADAPDAP', '1', '4', '1', '2', 'ASTI GULTOM', '2', '6', '1', '3', 'DESA GAJAH', '21264', '082164984573', '3', '', '', '', '', '', '', 'M', '2', 'A', NULL, NULL, NULL, '', NULL, '0122107901', '2016-09-20', '1', '', '1209072712980001'),
('160810010', 'Ropita Hotrezkina Malau', '08', '081', 'P', 'P', 'W', '5', 'B', 'pasar besuesen', '1997-10-11', 'Tj.Sari jl.Setia Budi Gg Pepaya', 'UNIKA_12983197_819854044812652_37747568914433783_o-1.jpg', '21163', '082274911145', 'SMA N 1 DOLOK PARDAMEAN', 'SIPINTUANGIN', 'DOLOK PARDAMEAN', 'SIMALUNGUN', '-', 'SUMUT', '2016', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Haposan Marulitua Malau', '1', '4', '1', '1', 'Rapeta Widyana Simarmata', '1', '4', '1', '1', 'pasar besuesen desa Pariksabungan', '21163', '085372594495', '6', '', '', '', '', '', '', 'M', '0', 'A', NULL, NULL, NULL, '', NULL, '0122107901', '2016-09-20', '1', '', ''),
('160810011', 'Nelby amelia kasandra manurung', '08', '081', 'P', 'P', 'W', '3', 'B', 'Manokwari', '1995-01-16', 'Jl.setia budi tanjung sari medan', 'UNIKA_B612_20160618_132946.jpg', '22611', '081261817479', 'SMA Santu Fransiskus', 'Aek tolang', 'Aek tolang', 'Tapanuli tengah', 'Pandan', 'Sumatra utara', '2013', '-', '0000-00-00', 0, 0, '', '0000-00-00', '-', '-', '-', '-', 0, '-', 'Panahatan manurung', '6', '4', '1', '2', 'Normawati napitupulu', '8', '4', '1', '1', 'Aek tolang jl arion no 17', '-', '081375850704', '2', '-', '', '', '', '', '', 'S', '0', 'A', NULL, NULL, NULL, '', NULL, '0122107901', '2016-09-21', '1', '', ''),
('160810012', 'Chintia Arina Br Tarigan', '08', '081', 'P', 'P', 'W', '4', 'B', 'Desa Dokan', '1997-03-12', 'JL.Flamboyan Gg.Ikif', 'UNIKA_FB_IMG_1475812120374.jpg', '-', '085760038174', 'SMA-SMK YAPIM TARUNA MEREK', 'jl merek-saribudolok, Desa situnggaling', 'Merek', 'Karo', 'Kabanjahe', 'Sumatera Utara', '2015', '-', '2016-09-15', 87, 80, '', '0000-00-00', '', '', '', '', 0, '', 'Amigo Tarigan', '1', '4', '1', '1', 'Lina Br Ginting', '1', '4', '1', '3', 'medan', '-', '-', '2', '', '', '', '', '', '', 'S', '0', 'A', NULL, NULL, NULL, '', NULL, '0122107901', '2016-09-21', '1', '', ''),
('160810013', 'Joniman Jaya Daeli', '08', '081', 'L', 'P', 'A', '07', 'B', 'Lolowa\'u', '1998-01-10', 'jln.bahagia no 24 padang bulan', 'UNIKA_14889924_332083667166441_4361552247624561565_o.jpg', '22452', '081318086571', 'SMK NEGERI 1 LOLOWA\'U', 'Lolowa\'u.', 'Kecamatan Lolowa\'u', 'Nias Selatan', 'Kota Nias Selatan', 'Sumatera Utara', '-', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'SERUBABELI DAELI', '2', '4', '1', '3', 'RUTI WARUWU', '6', '4', '1', '2', 'Kecamatan Lolowa\'u', '22452', '082366865649', '04', '', '', '', '', '', '', 'M', '0', 'A', NULL, NULL, NULL, '', NULL, '0114046501', '2016-09-21', '1', '', '-'),
('160810014', 'Nurlijah pandiangan', '08', '081', 'P', 'P', 'W', '6', 'B', 'Raniate', '1997-04-29', 'jln.bahagia no 24 padang bulan', 'UNIKA_IMG_4235.JPG', '22616', '0853537853', 'Smk negeri 1 sarudik', 'Sibolga', 'sarudik', 'Tapanuli tengah', 'sibolga', 'Sumtera Utara', '2016', '-', '0000-00-00', 276, 67, '', '0000-00-00', '', '', '', '', 0, '', 'Jahormat pandiangan', '1', '4', '1', '3', 'Sainal Tiosanna Panjaitan', '1', '3', '1', '2', 'Sibolga', '22616', '081397457304', '5', '', '', '', '', '', '', 'M', '0', 'A', NULL, NULL, NULL, '', NULL, '0114046501', '2016-09-21', '1', '', ''),
('160810015', 'Ebenezer . S', '08', '081', 'L', 'K', 'W', '4', 'B', 'Medan', '1995-08-08', 'Jl. Petunia Raya Blok E No 29 Medan', 'UNIKA_C360_2016-10-07-11-24-21-336.jpg', '20132', '085831724862', 'EMPHATY', '-', '-', '-', '-', '-', '-', '-', '0000-00-00', 0, 0, '', '0000-00-00', '-', '-', '-', '-', 0, '-', 'Abdonsius Sitanggang', '5', '7', '1', '1', 'Rosintan Manalu', '6', '6', '1', '1', 'Jl. Petunia Raya Blok E No 29 Medan', '-', '085262081387', '-', '-', '', '', '', '-', '-', 'XL', '1', 'A', NULL, NULL, NULL, '', NULL, '0114046501', '2016-09-21', '1', '', ''),
('160810016', 'Lisbet Zaluchu', '08', '081', 'P', 'P', 'A', '2', 'B', 'Sibolga', '1998-07-17', 'Jln.  bunga rinte GG bangun No 1A', 'UNIKA_20161006_103803.jpg', '20135', '081260333421', 'SMA NEGERI 17 MEDAN', 'JLN. jamin ginting, laucih, medan tuntungan', 'Medan tuntungan ', '-', 'kota medan', 'sumatera utara', '2016', '-', '0000-00-00', 0, 0, '', '0000-00-00', '-', '-', '-', '-', 0, '-', 'Salatieli zaluchu', '7', '6', '1', '3', 'Sama ginting', '2', '6', '1', '3', 'Jln.  bunga rinte GG bangun No 1A', '20135', '081260333421', '2', '-', '', '', '', '-', '-', 'L', '0', 'A', NULL, NULL, NULL, '', NULL, '0114046501', '2016-09-21', '1', '', '1201205707980003'),
('160810017', 'JOHANNES SIRINGORINGO', '08', '081', 'L', 'P', '', '-', 'B', 'medan', '1996-01-02', 'Jl. Setia Budi Pasar 1, Tanjung sari Med', 'UNIKA_14718798_1796812407274810_8014947749909803493_n.jpg', '-', '082165465814', 'SMK RIS MADUMA SUMBU', 'Jalan Besar Tanjung Beringin', 'Sumbul', 'Dairi', '-', 'SUMATERA UTARA', '2015', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'ARIFIN SIRINGORINGO', '8', '3', '2', '1', 'RIA SILALAHI', '1', '3', '1', '1', 'Ds Tanjung Beringin Dusu1 Kec, Sumbu ', '22281', '-', '3', '-', '', '', '', '-', '-', 'L', '0', 'A', NULL, NULL, NULL, '', NULL, '0114046501', '2016-09-21', '1', '', ''),
('160840001', 'KARLINCE SRY AYU', '08', '084', 'P', 'P', 'A', '5', 'B', 'PARDAMEAN', '1998-09-04', 'JLN.SETIA BUDI, GANG BERSAMA', 'UNIKA_C360_2016-09-22-09-04-57-282.jpg', '20132', '085361038977', 'SMA NEGERI 2 LAWE SIGALA-GALA', 'JLN KUTACANE DESA KUTE BAKTI', 'BABUL MAKMUR', 'ACEH TENGGARA', 'KUTA CANE', 'ACEH', '2016', 'DN.06 Ma/06 001023', '2016-05-07', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'SINTONG SIMBOLON', '1', '4', '1', '1', 'KATARINA', '2', '6', '1', '2', 'PARDAMEAN', '24673', '085206124943', '2 ORANG', '', '', '', '', '', '', 'M', '0', 'A', NULL, NULL, NULL, '', NULL, '0108117501', '2016-09-22', '1', '', ''),
('160840002', 'REKAWATI SIMAMORA', '08', '084', 'P', 'P', 'A', '5', 'B', 'Dolok sanggul ', '1998-03-03', 'Jln.sei tuntung baru no 34', 'UNIKA_FB_IMG_1475132818336.jpg', '20514', '082277104623', 'SMA N 1 SIBORONGBORONG', 'jln.sisingamangaraja no.153 Siborongborong', 'Siborongborong', 'Tapanuli Utara', '0', 'Sumatera Utara', '2016', '0', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Saut Simamora', '6', '2', '1', '2', 'Tampe Panggabean', '1', '3', '1', '1', 'Hutaraja', '22452', '082360292729', '5', '', '', '', '', '', '', 'M', '0', 'A', NULL, NULL, NULL, '', NULL, '0108117501', '2016-09-22', '1', '', ''),
('160840003', 'Destri Gultom', '08', '084', 'P', 'K', 'A', '4', 'B', 'Pematang Kerasaan', '1995-12-28', 'Jl.setia budi ', 'UNIKA_Untitled-1.jpg', '20132', '081377013957', 'SMK SWASTA ABDI SEJATI KERASAAN-1', 'JL. besar siantar-perdagangan NO. 232 KERASAAN I P. BANDAR', 'Bandar', 'simalungun', 'Perdagangan', 'Sumatera Utara', '2013', 'DN-07 Mk 0049377', '2013-05-24', 50, 8, '', '0000-00-00', '', '', '', '', 0, '', 'Marolop Gultom', '1', '4', '1', '1', 'Dahliana Silalahi', '1', '4', '1', '1', 'JL. besar siantar perdagangan', '21184', '082274159427', '3', '-', '', '', '', '-', '-', 'S', '-', 'A', NULL, NULL, NULL, '', NULL, '0108117501', '2016-09-22', '1', '', '1208236812950001'),
('160840004', 'Santi veronika purba', '08', '084', 'P', 'K', 'A', '3', 'B', 'simamora', '1997-07-17', 'JL besar UNIKA Tanjung sari', 'UNIKA_14488857_284932721893528_1839855378_o.jpg', '22474', '081363377826', 'SMA N 1 PAGARAN', 'SIMAMORA NABOLAK', 'PAGARAN', 'TAPANULI UTARA', '-', 'SUMATERA UTARA', '2016', '-', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Lampos Purba', '6', '4', '1', '2', 'Rominto Aritonang', '6', '4', '1', '2', 'SIMAMORA NABOLAK', '22474', '082162963163', '3', '', '', '', '', '', '', 'S', '0', 'A', NULL, NULL, NULL, '', NULL, '0108117501', '2016-09-22', '1', '', ''),
('160840005', 'KRISTIANTO ANUGRAH WARUWU B', '08', '084', 'L', 'P', 'A', '1', 'B', 'FULOLO', '1998-06-13', 'JALAN SIMPANG PEMBDA, GANG BONSAI', 'UNIKA_20150630_080828.jpg', '20132', '082276261839', 'SMA SWASTA SANTU FRANSISKUS', 'AEK TOLANG', 'PANDAN', 'TAPANULI TENGAH', '', 'SUMATERA UTARA', '2016', '0', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'TE\'ARO WARUWU', '2', '6', '1', '3', 'MENIARI ZALUKHU', '2', '6', '1', '3', 'JALAN SOEKARNO No. 167, NIAS UTARA,', '22853', '082361719933', '1', '', '', '', '', '', '', 'M', '0', 'A', NULL, NULL, NULL, '', NULL, '0108117501', '2016-09-22', '1', '', ''),
('160840006', 'HENDRA.P.SIRAIT', '08', '084', 'L', 'P', 'A', '2', 'B', 'BINTUNI,PAPUA BARAT', '1998-11-12', 'jln,lizardi putra kompleks setia budi vi', 'UNIKA_Hendra.jpg', '20132', '081377416315', 'SMA SWASTA SANTO YOSEPH MEDAN', 'jl,flamboyan raya no 139', '', '', 'MEDAN', 'SUMATRA UTARA', '2016', '0', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'BISMAN SIRAIT', '6', '5', '1', '1', 'DWI KRISTIANINGSIH SITORUS', '8', '3', '1', '1', 'sp,3 jalur 8', '0', '085244203563', '0', 'HERIANTO IVAN ROY SITUMORANG', '8', '6', '', 'jln lizardi purta kompleks setia budi vista blok I-1', '082260661034', 'XL', '0', 'A', NULL, NULL, NULL, '', NULL, '0124126801', '2016-09-22', '1', '', ''),
('160840007', 'PAINTO JUNA PUTRA', '08', '084', 'L', 'K', 'A', '3', 'B', 'Gresik', '1998-06-17', 'Medan, Tampuk Dusun 3', 'UNIKA_sadas.jpg', '0', '082276783130', 'SMA SWASTA RK DELI MURNI', '0', '0', '0', '0', 'PROVINSI SUMATRA UTARA', '2016', '0', '0000-00-00', 400, 0, '', '0000-00-00', '', '', '', '', 0, '', 'EMANUEL NAHAS', '6', '4', '1', '1', 'Mariati bru sembiring', '6', '4', '1', '1', 'Jln. Jamin ginting Gg.Pelawi Desa raya', '22152', '082276783130', '0', '0', '', '', '', '0', '0', 'M', '0', 'A', NULL, NULL, NULL, '', NULL, '0124126801', '2016-09-22', '1', '', ''),
('160840008', 'colin sugara siagian', '08', '084', 'L', 'P', 'A', '2', 'B', 'MEDAN', '1998-03-28', 'jln ringroad baru no.28 setia budi pasar', 'UNIKA_img002.jpg', '20132', '081287114798', 'SMANSA NEGERI 1 MEDAN', ' Jl. Teuku Cik Ditiro No.1, Madras Hulu, Medan Polonia, Kota Medan, Sumatera Utara 20152', 'Medan Polonia', '', 'Kota medan', 'sumatera utara', '2016', '0', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Ir.Parlindugan siagian', '6', '6', '1', '3', 'dumaria sibarani', '8', '4', '1', '3', 'jln. Ringroad no.28 tj sari medan', '20132', '08126525224', '1', '', '', '', '', '', '', 'M', '0', 'A', NULL, NULL, NULL, '', NULL, '0124126801', '2016-09-22', '1', '', ''),
('160840009', 'Rizki bona P.sigalingging', '08', '084', 'L', 'P', 'A', '4', 'B', 'sigalingging', '1997-09-17', 'Jln.tanjung sari', 'UNIKA_20151221_184056~3.jpg', '22282', '082167989619', 'SMK NEGERI 1 LUMBANJULU', 'AEK NATOLU', 'LUMBANJULU', 'TOBA SAMOSIR', '', 'SUMATERA UTARA', '2015', 'DN-07 MK 0065331', '2015-05-15', 450, 80, '', '0000-00-00', '', '', '', '', 0, '', 'SUPARMIN SIGALINGGING', '1', '4', '1', '1', 'MERTA CIBRO', '1', '4', '1', '1', 'SIGALINGGING', '22282', '082272690626', '4 ORANG', '', '', '', '', '', '', 'L', '0', 'A', NULL, NULL, NULL, '', NULL, '0124126801', '2016-09-22', '1', '', ''),
('160840010', 'Malem banta', '08', '084', 'L', 'P', 'A', '2', 'B', 'Telagah', '1997-11-04', ' jl. raharja pondok batuan', 'UNIKA_12963513_1716943491878644_5048143127544274591_n.jpg', '20122', '085206115355', 'SMA . ST YOSEPH MEDAN', 'JL. FLAMBOYAN RAYA 139', 'MEDAN SELAYANG', '', 'MEDAN', 'SUMATRA UTARA', '2016', '-', '0000-00-00', 0, 0, '', '0000-00-00', '-', '-', '-', '-', 0, '-', 'MASANA GURKI', '1', '2', '1', '2', 'SIMPAR MILALA', '1', '4', '1', '2', 'JL. SEI BINGAI KAB LANGKAT', '20771', '081375262794', '2', '-', '', '', '', '-', '-', 'M', '2', 'A', NULL, NULL, NULL, '', NULL, '0124126801', '2016-09-22', '1', '', '-'),
('160840011', 'HOLMA KRISTOFORA SIAHAAN', '08', '084', 'P', 'K', 'A', '4', 'B', 'Ambarita', '1997-11-04', 'jl.flamboyan raya gang bersama 1 no.6', 'UNIKA_B612-2016-09-29-07-53-56.jpg', '20132', '085270335656', 'SMA N 1 SIMANINDO', 'Ambarita', 'Simanindo', 'Samosir', '', 'Sumatera Utara', '2015', '0', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'HERRI SIAHAAN', '6', '4', '1', '1', 'RITA PASARIBU', '2', '5', '1', '3', 'Ambarita', '22395', '081370154271', '1', '', '', '', '', '', '', 'S', '0', 'A', NULL, NULL, NULL, '', NULL, '0125058003', '2016-09-22', '1', '', ''),
('160840012', 'Pesta Yohanna Sibarani', '08', '084', 'P', 'K', 'A', '5', 'B', 'Medan', '1998-12-15', 'Jalan Menteng II Gang Pembangunan', 'UNIKA_CARBFBFG.jpg', '20228', '0', 'SMA Swasta Katolik Tri Sakti Medan', 'Jl. Raya Menteng Gg. Benteng No. 21 Medan', 'Medan Denai', 'Medan', 'Medan', 'Sumatera Utara', '2016', '0', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Rimbun Sibarani', '8', '4', '1', '1', 'Warista Sidauruk', '8', '3', '1', '2', 'Jl. Menteng II Gg. Pembangunan', '20228', '081223279535', '5', '', '', '', '', '', '', 'M', '0', 'A', NULL, NULL, NULL, '', NULL, '0125058003', '2016-09-22', '1', '', ''),
('160840013', 'JOHN HOWARD PURBA', '08', '084', 'L', 'P', 'A', '3', 'B', 'MEDAN', '1998-10-10', 'TANJUNG SARI PASAR V GANG MELATI', 'UNIKA_IMG20170212165709.jpg', '20132', '081265322096', 'SMA N 1 DOLOKSANGGUL', 'PAKKAT TORUAN', 'DOLOKSANGGUL', 'HUMBANG HASUNDUTAN', '0', 'SUMATERA UTARA', '2016', '0', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'MAROLOP PURBA', '6', '4', '1', '2', 'TIAWAN PASARIBU', '2', '6', '1', '3', 'PAKKAT TORUAN', '22457', '082277990645', '3', '0', '', '', '', '0', '0', 'L', '2', 'A', NULL, NULL, NULL, '', NULL, '0125058003', '2016-09-22', '1', '', '1216061010980004'),
('160840014', 'jupri manungkalit', '08', '084', 'L', 'P', 'A', '7', 'B', 'pamingke', '1996-10-09', 'Setia budi ,jl. melati', 'UNIKA_BeautyPlus_20160304222434_save-1.jpg', '-', '082387932883', 'smk yapim bandar', 'jl. jamin purba ', 'bandar', 'simalungun', 'perdangangan', 'sumatera utara', '2016', '0', '0000-00-00', 45, 79, '', '0000-00-00', '', '', '', '', 0, '', 'pikir simanungkalit', '1', '3', '1', '2', 'minauli manalu', '1', '3', '1', '1', 'peranap', '-', '-', '2', '', '', '', '', '', '', 'M', '0', 'A', NULL, NULL, NULL, '', NULL, '0125058003', '2016-09-22', '1', '', ''),
('160840015', 'Rolas Meiputra Nababan', '08', '084', 'L', 'K', 'A', '6', 'B', 'Sipultak', '1998-05-01', 'Komplek Kampung Cempaka Hijau No.B7 Jal', 'UNIKA_dada.jpg', '20131', '081260621699', 'SMA Swasta Swadaya Pulau Rakyat', 'Jalan Yaspenda No 37 Pulau Rakyat', 'Pulau Rakyat Pekan', 'Asahan', 'Asahan', 'SUMATERA UTARA', '2016', '0', '0000-00-00', 223, 37, '', '0000-00-00', '', '', '', '', 0, '', 'Anjur Nababan', '3', '4', '1', '2', 'Tionar Tambunan', '3', '4', '1', '2', 'Dususn V Desa Manis Pulau Rakyat', '21273', '01375989150', '6', '', '', '', '', '', '', 'M', '0', 'A', NULL, NULL, NULL, '', NULL, '0125058003', '2016-09-22', '1', '', ''),
('160840016', 'JOSUA VAN  MITCHELLE SITUMORANG', '08', '084', 'L', 'P', 'A', '3', 'B', 'MEDAN', '0000-00-00', 'JLN. VANILI RAYA NO.45 PRUMNAS SIMALINGK', 'UNIKA_jo4.jpg', '20141', '085761559118', 'SMA W.R.SUPRATMAN 2 MEDAN', 'JL.BRIGZEIN ZEND HAMID NO.33 MEDAN', 'MEDAN JOHOR', '', 'MEDAN', 'SUMATRA UTARA', '2016', '0', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'PINONDANG SITUMORANG', '5', '7', '1', '1', 'ROSDIANA PANGGABEAN', '8', '6', '1', '1', 'JL. VANILI RAYA NO.45 MEDAN', '20141', '081361583828', '5', '', '', '', '', '', '', 'L', '0', 'A', NULL, NULL, NULL, '', NULL, '0029097403', '2016-09-22', '1', '', ''),
('160840017', 'HENGKI TANTOI LAOLI', '08', '084', 'L', 'P', 'A', '6', 'B', 'onombongi', '1998-03-25', 'desa tanjung slamat', 'UNIKA_DP.jpg', '20128', '082276740570', 'Smk Negeri 1 Gunungsitoli', 'Jln. Cik Ditiro', 'Gunungsitoli', 'Nias', 'Gunungsitoli', 'Sumatera Utara', '2016', '0', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Temasokhi Laoli', '1', '1', '2', '1', 'Yustin Mendrofa', '1', '3', '1', '2', 'Jln. Nias Tengah Km.25', '22851', '085359573099', '6', '', '', '', '', '', '', 'M', '0', 'A', NULL, NULL, NULL, '', NULL, '0029097403', '2016-09-22', '1', '', '1204202503980003'),
('160840018', 'Evita sari Situmorang', '08', '084', 'P', 'K', 'A', '10', 'B', 'pandomayu', '1998-10-09', 'setia budi', NULL, '21254', '082273532580', 'SMA ABDI SEJATI ', 'jln. sudirman no 273', 'bandar', 'simalungun', 'perdagangan', 'Sumatera Utara', '2016', '0', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Kaslen Situmorang', '1', '3', '2', '1', 'Masta Tamba', '1', '1', '1', '1', 'pandomayu', '21254', '081360707561', '1', '', '', '', '', '', '', 'M', '0', 'A', NULL, NULL, NULL, '', NULL, '0029097403', '2016-09-22', '1', '', '-'),
('160840019', 'dian pramudia antonius tarigan', '08', '084', 'L', 'K', 'A', '4', 'B', 'Kabanjahe', '1998-03-23', 'Rambung Baru.kec.sibolangit', 'UNIKA_IMG_20160927_095640_540.JPG', '20357', '083197802052', 'YP.KATHOLIK DELIMURNI', 'BANDAR BARU', 'SIBOLANGIT', 'DELISERDANG', '0', 'SUMATERA UTARA', '2015', '0', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'ANTONIUS TARIGAN', '6', '3', '1', '1', 'PAKENTA Br GURUSINGA', '2', '4', '1', '3', 'RAMBUNG BARU', '20357', '085372098276', '4', '', '', '', '', '', '', 'L', '2', 'A', NULL, NULL, NULL, '', NULL, '0029097403', '2016-09-22', '1', '', ''),
('160840020', 'AGUNG PERDANA HUTABRAT', '08', '084', 'L', 'K', 'A', '6', 'B', 'PEMATANG SIANTAR', '1998-08-31', 'JL.dahlia 4 . simpang pemda', 'UNIKA_20160929_153250-1.jpg', '-', '085362075981', 'SMK GKPI 1 PEMATANG SIANTAR', 'JL. NARUMONDA ATAS NO.155 BLK', 'SIANTAR SELATAN', '', 'PEMATANG SIANTAR', 'SUMATRA UTARA', '2016', '-', '0000-00-00', 0, 0, '', '0000-00-00', '-', '-', '-', '-', 0, '-', 'TOMMY HUTABARAT', '6', '2', '1', '1', 'LAMRIA SITOMPUL', '8', '2', '1', '1', 'JL.NARUMONDA ATAS NO.155 BLK', '21125', '081276428802', '4', '-', '', '', '', '-', '-', 'XL', '0', 'A', NULL, NULL, NULL, '', NULL, '0029097403', '2016-09-22', '1', '', ''),
('160840021', 'Ginola Tarigan', '08', '084', 'L', 'K', 'A', '2', 'B', 'Medan', '1998-09-05', 'Jl. Parang 1 Gg. Karonta No. 12', 'UNIKA_gdfg.jpg', '20142', '-', 'SMKN 9 Medan', 'Jl. Patriot No. 20A', 'Medan Sunggal', '0', 'Medan', 'Sumatera Utara', '2016', '0', '0000-00-00', 0, 0, '', '0000-00-00', '', '', '', '', 0, '', 'Usaha Tarigan S.Pd', '5', '6', '1', '1', 'Sabar Ginting A.md', '6', '5', '1', '1', 'Jl. Parang 1 Gg. Karonta No 12', '20142', '085361308871', '0', '', '', '', '', '', '', 'XL', '0', 'A', NULL, NULL, NULL, '', NULL, '0029097403', '2016-09-22', '1', '', ''),
('160840022', 'Rony Pandapotan Saragih', '08', '084', 'L', 'P', 'A', '2', 'B', 'Tembilahan', '0000-00-00', 'Jl.jamin ginting.', NULL, '20155', '081261155537', 'Nusantara', 'Tembilahan', 'Tembilahan', 'Indragili Hilir', 'Tembilahan', 'Riau', '2014', '0004703', '2014-09-20', 7, 6, '', '0000-00-00', '-', '', '', '', 0, '', 'Eliwanser Saragih', '7', '4', '1', '2', 'Ronda Purba', '2', '6', '1', '3', 'S.Hinalang', '21167', '082283530129', '2', 'Julkfly Simbolon', '8', '6', '', 'Jln.Jamin Ginting', '081377164965', 'M', '1', 'A', NULL, NULL, NULL, '', NULL, '0029097403', '2016-09-22', '1', '', ''),
('110840022', 'MICHAEL BERNARDO MALAU', '08', '084', 'L', 'K', NULL, '1', NULL, 'aa', '2017-03-07', 'a', NULL, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2017-03-20', 1, 1, '', '0000-00-00', '', '', '', '', 0, '', '1', '3', '4', '1', '2', '1', '2', '3', '1', '2', '1', '1', '1', '1', '1', '6', '6', '3', '1', '1', 'M', NULL, NULL, NULL, NULL, NULL, '', NULL, '0124126801', '0000-00-00', '1', '', ''),
('110840046', 'RIKI APRIANTA MILALA', '08', '084', 'L', 'K', NULL, '1', NULL, 'aa', '2017-03-07', 'a', NULL, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2017-03-20', 1, 1, '', '0000-00-00', '', '', '', '', 0, '', '1', '3', '4', '1', '2', '1', '2', '3', '1', '2', '1', '1', '1', '1', '1', '6', '6', '3', '1', '1', 'M', NULL, NULL, NULL, NULL, NULL, '', NULL, '0029097403', '0000-00-00', '1', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbmatakuliah`
--

CREATE TABLE `tbmatakuliah` (
  `kd_matkul` char(10) NOT NULL DEFAULT '',
  `nm_matkul` varchar(40) DEFAULT NULL,
  `sks` int(11) DEFAULT NULL,
  `kategori` char(1) NOT NULL,
  `semester` int(11) DEFAULT NULL,
  `kodeprasyrat` char(10) NOT NULL,
  `kurikulum` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbmatakuliah`
--

INSERT INTO `tbmatakuliah` (`kd_matkul`, `nm_matkul`, `sks`, `kategori`, `semester`, `kodeprasyrat`, `kurikulum`) VALUES
('0801000092', 'Bahasa Indonesia', 2, 'D', 1, '0', '2013'),
('0801000312', 'Pendidikan Pancasila', 2, 'D', 4, '0', '2013'),
('0801000322', 'Pendidikan Agama', 2, 'D', 4, '0', '2013'),
('0801000422', 'Pendidikan Kewarganegaraan', 2, 'D', 5, '0', '2013'),
('0801001023', 'Algoritma Pemrograman', 3, 'D', 1, '0', '2013'),
('0801001032', 'Praktikum Algoritma Pemrograman ', 2, 'B', 1, '0', '2013'),
('0801001052', 'Logika Informatika', 2, 'D', 1, '0', '2013'),
('0801001063', 'Matematika I', 3, 'D', 1, '0', '2013'),
('0801001072', 'Pengantar Teknologi Informasi', 2, 'D', 1, '0', '2013'),
('0801001081', 'Praktikum Pengantar Teknologi Informasi', 1, 'B', 1, '0', '2013'),
('0801001143', 'Matematika II', 3, 'D', 2, '0', '2013'),
('0801001173', 'Pengantar Basis Data', 3, 'D', 2, '0', '2013'),
('0801001262', 'Matematika Diskrit', 2, 'D', 3, '0', '2013'),
('0801001272', 'Organisasi dan Arsitektur Komputer', 2, 'D', 3, '0', '2013'),
('0801001282', 'Struktur Data', 2, 'D', 3, '0', '2013'),
('0801001291', 'Praktikum Struktur Data', 1, 'B', 3, '0', '2013'),
('0801001333', 'Riset Operasi', 3, 'D', 4, '0', '2013'),
('0801001363', 'Jaringan Komputer', 3, 'D', 4, '0', '2013'),
('0801001371', 'Praktikum Jaringan Komputer', 1, 'B', 4, '0', '2013'),
('0801001382', 'Rekayasa Perangkat Lunak', 2, 'D', 4, '0', '2013'),
('0801001391', 'Praktikum Rekayasa Perangkat Lunak', 1, 'B', 4, '0', '2013'),
('0801001403', 'Sistem Operasi', 3, 'D', 4, '0', '2013'),
('0801001411', 'Praktikum Sistem Operasi', 1, 'B', 4, '0', '2013'),
('0801001493', 'Keamanan Komputer', 3, 'D', 5, '0', '2013'),
('0801001502', 'Statistika', 2, 'D', 5, '0', '2013'),
('0801001511', 'Praktikum Statistika', 1, 'B', 5, '0', '2013'),
('0801002112', 'Pemrograman Visual I', 2, 'D', 2, '0', '2013'),
('0801002121', 'Praktikum Pemrograman Visual I', 1, 'B', 2, '0', '2013'),
('0801002202', 'Pemrograman Visual II', 2, 'D', 3, '0', '2013'),
('0801002211', 'Praktikum Pemrograman Visual II', 1, 'B', 3, '0', '2013'),
('0801002222', 'Pemrograman Web I', 2, 'D', 3, '0', '2013'),
('0801002232', 'Praktikum Pemrograman Web I', 2, 'B', 3, '0', '2013'),
('0801002242', 'Sistem Basis Data', 2, 'D', 3, '0', '2013'),
('0801002252', 'Praktikum Sistem Basis Data', 2, 'B', 3, '0', '2013'),
('0801002342', 'Pemrograman Web II', 2, 'D', 4, '0', '2013'),
('0801002352', 'Praktikum Pemrograman Web II', 2, 'B', 4, '0', '2013'),
('0801002462', 'Pemrograman Java', 2, 'D', 5, '0', '2013'),
('0801002472', 'Praktikum Pemrograman Java', 2, 'B', 5, '0', '2013'),
('0801002532', 'Desain Berorientasi Objek', 2, 'D', 6, '0', '2013'),
('0801002541', 'Praktikum Desain Berorientasi Objek', 1, 'B', 6, '0', '2013'),
('0801002552', 'Interaksi Manusia dan Komputer', 2, 'D', 6, '0', '2013'),
('0801002561', 'Prak.Int. Manusia dan Komputer', 1, 'B', 6, '0', '2013'),
('0801002746', 'Tugas Akhir', 6, 'D', 8, '0', '2013'),
('0801003652', 'Metode Penelitian', 2, 'D', 7, '0', '2013'),
('0801003673', 'Praktek Kerja Lapangan/KKN', 3, 'A', 7, '0', '2013'),
('0801003722', 'Kecakapan Antar Personal', 2, 'D', 8, '0', '2013'),
('0801004622', 'Ilmu Kealaman Dasar', 2, 'D', 7, '0', '2013'),
('0801004632', 'Ilmu Sosial dan Budaya Dasar', 2, 'D', 7, '0', '2013'),
('0801010181', 'Praktikum Pengantar Basis Data', 1, 'B', 2, '0', '2013'),
('0801011042', 'Bahasa Inggris Komputer I', 2, 'D', 1, '0', '2013'),
('0801011132', 'Bahasa Inggris Komputer II', 2, 'D', 2, '0', '2013'),
('0801013661', 'Proyek Perangkat Lunak', 1, 'B', 7, '0', '2013'),
('0801014642', 'Kewirausahaan', 2, 'D', 7, '0', '2013'),
('0801014732', 'Etika Profesi', 2, 'D', 8, '0', '2013'),
('0804000032', 'Bahasa Indonesia', 2, 'D', 1, '0', '2013'),
('0804000072', 'Pendidikan Kewarganegaraan', 2, 'D', 1, '0', '2013'),
('0804000112', 'Pendidikan Pancasila', 2, 'D', 2, '0', '2013'),
('0804000152', 'Pendidikan Agama', 2, 'D', 2, '0', '2013'),
('0804001013', 'Algoritma Pemrograman', 3, 'D', 1, '0', '2013'),
('0804001022', 'Praktikum Algoritma Pemrograman', 2, 'B', 1, '0', '2013'),
('0804001052', 'Logika Informatika', 2, 'D', 1, '0', '2013'),
('0804001063', 'Matematika I', 3, 'D', 1, '', '2013'),
('0804001082', 'Pengantar Teknologi Informasi', 2, 'D', 1, '0', '2013'),
('0804001091', 'Praktikum Pengantar Teknologi Informasi', 1, 'B', 1, '0', '2013'),
('0804001123', 'Matematika II', 3, 'D', 2, '', '2013'),
('0804001162', 'Pengantar Basis Data', 2, 'D', 2, '0', '2013'),
('0804001171', 'Praktikum Pengantar Basis Data', 1, 'B', 2, '0', '2013'),
('0804001202', 'Statistika', 2, 'D', 2, '0', '2013'),
('0804001213', 'Matematika Diskrit', 3, 'D', 3, '0', '2013'),
('0804001272', 'Riset Operasi', 2, 'D', 3, '0', '2013'),
('0804001282', 'Sistem Basis Data', 2, 'D', 3, '0', '2013'),
('0804001291', 'Praktikum Sistem Basis Data', 1, 'B', 3, '0', '2013'),
('0804001302', 'Struktur Data', 2, 'D', 3, '0', '2013'),
('0804001311', 'Praktikum Struktur Data', 1, 'B', 3, '0', '2013'),
('0804001352', 'Organisasi dan Arsitektur Komputer', 2, 'D', 4, '0', '2013'),
('0804001403', 'Sistem Operasi', 3, 'D', 4, '0', '2013'),
('0804001411', 'Praktikum Sistem Operasi', 1, 'B', 4, '0', '2013'),
('0804001442', 'Keamanan Komputer', 2, 'D', 5, '0', '2013'),
('0804001452', 'Rekayasa Perangkat Lunak', 2, 'D', 5, '0', '2013'),
('0804001461', 'Praktikum Rekayasa Perangkat Lunak', 1, 'B', 5, '0', '2013'),
('0804001552', 'Interaksi Manusia dan Komputer', 2, 'D', 6, '0', '2013'),
('0804001561', 'Praktikum Interaksi Manusia dan Komputer', 1, 'B', 6, '0', '2013'),
('0804002132', 'Pemrograman Visual I', 2, 'D', 2, '0', '2013'),
('0804002141', 'Praktikum Pemrograman Visual I', 1, 'B', 2, '0', '2013'),
('0804002232', 'Pemrograman Visual II', 2, 'D', 3, '0', '2013'),
('0804002241', 'Praktium Pemrograman Visual II', 1, 'B', 3, '0', '2013'),
('0804002333', 'Jaringan Komputer', 3, 'D', 4, '0', '2013'),
('0804002341', 'Praktikum Jaringan Komputer', 1, 'B', 4, '0', '2013'),
('0804002362', 'Pemrograman Java', 2, 'D', 4, '0', '2013'),
('0804002372', 'Praktikum Pemrograman Java', 2, 'B', 4, '0', '2013'),
('0804002422', 'Desain Berorientasi Objek', 2, 'D', 5, '0', '2013'),
('0804002431', 'Praktikum Desain Berorientasi Objek', 1, 'B', 5, '0', '2013'),
('0804002786', 'Tugas Akhir', 6, 'D', 8, '0', '2013'),
('0804003692', 'Metode Penelitan', 2, 'D', 7, '0', '2013'),
('0804003723', 'Prakek Kerja Lapangan/KKN', 3, 'A', 7, '0', '2013'),
('0804004652', 'Ilmu Kealaman Dasar', 2, 'D', 7, '0', '2013'),
('0804004662', 'Ilmu Sosial dan Budaya Dasar', 2, 'D', 7, '0', '2013'),
('0804011042', 'Bahasa Inggris Komputer I', 2, 'D', 1, '0', '2013'),
('0804011102', 'Bahasa Inggris Komputer II', 2, 'D', 2, '0', '2013'),
('0804012252', 'Pemrograman Web I', 2, 'D', 3, '0', '2013'),
('0804012261', 'Praktikum Pemrograman Web I', 1, 'B', 3, '0', '2013'),
('0804012382', 'Pemrograman Web II', 2, 'D', 4, '0', '2013'),
('0804012391', 'Praktikum Pemrograman Web II', 1, 'B', 4, '0', '2013'),
('0804013731', 'Proyek Perangkat Lunak', 1, 'B', 7, '0', '2013'),
('0804013762', 'Kecakapan Antar Personal', 2, 'D', 8, '0', '2013'),
('0804014672', 'Kewirausahaan', 2, 'D', 7, '0', '2013'),
('0804014772', 'Etika Profesi', 2, 'D', 8, '0', '2013'),
('0814001182', 'Sistem Digital', 2, 'D', 2, '0', '2013'),
('0814001191', 'Praktikum Sistem Digital', 1, 'B', 2, '0', '2013'),
('0814001222', 'Matriks dan Transformasi Linier', 2, 'D', 3, '0', '2013'),
('0814001322', 'Analisa dan Desain Algoritma', 2, 'D', 4, '0', '2013'),
('0814001572', 'Kecerdasan Buatan', 2, 'D', 6, '0', '2013'),
('0814001582', 'Teori Bahasa dan Otomata', 2, 'D', 6, '0', '2013'),
('0814011532', 'Grafika Komputer', 2, 'D', 6, '0', '2013'),
('0814011541', 'Praktikum Grafika Komputer', 1, 'B', 6, '', '2013'),
('0814012702', 'Pengolahan Data Spatial', 2, 'D', 7, '0', '2013'),
('0814012711', 'Praktikum Pengolahan Data Spatial', 1, 'B', 7, '0', '2013'),
('0814013682', 'Manajemen Proyek TI', 2, 'D', 7, '0', '2013'),
('0814122013', 'Basis Data Terdistribusi', 3, 'D', 5, '0', '2013'),
('0814122021', 'Praktikum Basis Data Terdistribusi', 1, 'B', 5, '0', '2013'),
('0814122033', 'Komputasi Client Server', 3, 'D', 5, '0', '2013'),
('0814122041', 'Praktikum Komputasi Client Server', 1, 'B', 5, '0', '2013'),
('0814122053', 'Sistem Terdistribusi', 3, 'D', 5, '0', '2013'),
('0814122061', 'Praktikum Sistem Terdistribusi', 1, 'B', 5, '0', '2013'),
('0814222013', 'Jaringan Nirkabel', 3, 'D', 5, '0', '2013'),
('0814222021', 'Praktikum Jaringan Nirkabel', 1, 'B', 5, '0', '2013'),
('0814222033', 'Pemrograman Jaringan', 3, 'D', 5, '0', '2013'),
('0814222041', 'Praktikum Pemrograman Jaringan', 1, 'B', 5, '0', '2013'),
('0814222053', 'Kecerdasan Komputasi', 3, 'D', 5, '0', '2013'),
('0814222061', 'Praktikum Kecerdasan Komputasi', 1, 'B', 5, '0', '2013'),
('0814322013', 'Keamanan Jaringan', 3, 'D', 5, '0', '2013'),
('0814322021', 'Praktikum Keamanan Jaringan', 1, 'B', 5, '0', '2013'),
('0814322033', 'Simulasi dan Game Komputer', 3, 'D', 5, '0', '2013'),
('0814322041', 'Praktikum Simulasi dan Game Komputer', 1, 'B', 5, '0', '2013'),
('0814322053', 'Pengolahan Citra Digital', 3, 'D', 5, '0', '2013'),
('0814322061', 'Praktikum Pengolahan Citra Digital', 1, 'B', 5, '0', '2013'),
('0814422013', 'Perancangan dan Manajemen Jaringan', 3, 'D', 6, '0', '2013'),
('0814422021', 'Prak Perancangan dan Manajemen Jaringan', 1, 'B', 6, '0', '2013'),
('0814422033', 'Grafika 3 Dimensi', 3, 'D', 6, '0', '2013'),
('0814422041', 'Praktikum Grafika 3 Dimensi', 1, 'B', 6, '0', '2013'),
('0814422053', 'Mikrokontroler', 3, 'D', 6, '0', '2013'),
('0814422061', 'Praktikum Mikrokontroler', 1, 'B', 6, '0', '2013'),
('0814522013', 'Teknologi Antar Jaringan', 3, 'D', 6, '0', '2013'),
('0814522021', 'Praktikum Teknologi Antar Jaringan', 1, 'B', 6, '0', '2013'),
('0814522033', 'Sistem Pakar', 3, 'C', 6, '0', '2013'),
('0814522041', 'Praktikum Sistem Pakar', 1, 'B', 6, '0', '2013'),
('0814522053', 'Mikroprosesor', 3, 'D', 6, '0', '2013'),
('0814522061', 'Praktikum Mikroprosesor', 1, 'B', 6, '0', '2013'),
('0814622013', 'Logika Samar', 3, 'D', 6, '0', '2013'),
('0814622021', 'Praktikum Logika Samar', 1, 'B', 6, '0', '2013'),
('0814622033', 'Robotika', 3, 'D', 6, '0', '2013'),
('0814622053', 'Pengenalan Pola', 3, 'D', 6, '0', '2013'),
('0814622061', 'Praktikum Pengenalan Pola', 1, 'B', 6, '0', '2013'),
('0814722013', 'Algoritma Genetika', 3, 'D', 7, '0', '2013'),
('0814722021', 'Praktikum Algoritma Genetika', 1, 'B', 7, '0', '2013'),
('0814722033', 'Jaringan Saraf Tiruan', 3, 'D', 7, '0', '2013'),
('0814722041', 'Praktikum Jaringan Saraf Tiruan', 1, 'B', 7, '0', '2013'),
('0821001303', 'Sistem Informasi', 3, 'D', 3, '0', '2013'),
('0821002443', 'Analisa & Perancangan SI', 3, 'D', 5, '0', '2013'),
('0821002451', 'Praktikum Analisa & Perancangan SI', 1, 'B', 5, '0', '2013'),
('0821002482', 'Testing dan Implementasi SI', 2, 'D', 5, '', '2013'),
('0821002523', 'Audit Sistem Informasi', 3, 'D', 6, '0', '2013'),
('0821003572', 'Manajemen Proyek SI', 2, 'D', 6, '0', '2013'),
('0821011152', 'Pengantar Akutansi', 2, 'D', 2, '0', '2013'),
('0821011161', 'Praktikum Pengantar Akutansi', 1, 'B', 2, '0', '2013'),
('0821011192', 'Proses Bisnis', 2, 'D', 2, '0', '2013'),
('0821012012', 'Aplikasi Desain Grafis', 2, 'C', 1, '0', '2013'),
('0821012102', 'Aplikasi Multimedia', 2, 'C', 2, '0', '2013'),
('0821014432', 'Pengantar Manajemen', 2, 'D', 5, '0', '2013'),
('0821122013', 'e-bussines', 3, 'D', 6, '', '2013'),
('0821122021', 'Praktikum e-bussines', 1, 'B', 6, '0', '2013'),
('0821122033', 'Pemrograman Game', 3, 'D', 6, '0', '2013'),
('0821122041', 'Praktikum Pemrograman Game', 1, 'B', 6, '0', '2013'),
('0821222013', 'Enterprise Resource Planning', 3, 'D', 6, '0', '2013'),
('0821222021', 'Prakt. Enterprise Resource Planning', 1, 'B', 6, '0', '2013'),
('0821222033', 'Pemrograman Mobile', 3, 'D', 6, '0', '2013'),
('0821222041', 'Praktikum Pemrogramn Mobile', 1, 'B', 6, '0', '2013'),
('0821322013', 'Decision Support System', 3, 'D', 7, '', '2013'),
('0821322021', 'Praktikum Decision Support System', 1, 'B', 7, '', '2013'),
('0821322033', 'Sistem Informasi Mobile', 3, 'D', 7, '0', '2013'),
('0821322041', 'Praktikum Sistem Informasi Mobile', 1, 'B', 7, '', '2013'),
('0821422013', 'Teknologi Mobile', 3, 'D', 7, '0', '2013'),
('0821422021', 'Praktikum Teknologi Mobile', 1, 'D', 7, '0', '2013'),
('0821422033', 'Sistem Terdistribusi', 3, 'D', 7, '0', '2013'),
('0821422041', 'Praktikum Sistem Terdistribusi', 1, 'B', 7, '0', '2013');

-- --------------------------------------------------------

--
-- Table structure for table `tbprodi`
--

CREATE TABLE `tbprodi` (
  `kd_fak` char(2) NOT NULL,
  `kd_prodi` char(3) NOT NULL,
  `nm_prodi` varchar(40) NOT NULL,
  `noskpend` varchar(40) NOT NULL,
  `tglskpend` date NOT NULL,
  `nosk_akr` varchar(20) NOT NULL,
  `tglsk_akr` date NOT NULL,
  `tglsk_berlaku_akr` date NOT NULL,
  `nilai_akreditas` char(1) NOT NULL,
  `nidn_kaprodi` char(10) NOT NULL,
  `email_prodi` varchar(30) NOT NULL,
  `jenjang_studi` char(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbprodi`
--

INSERT INTO `tbprodi` (`kd_fak`, `kd_prodi`, `nm_prodi`, `noskpend`, `tglskpend`, `nosk_akr`, `tglsk_akr`, `tglsk_berlaku_akr`, `nilai_akreditas`, `nidn_kaprodi`, `email_prodi`, `jenjang_studi`) VALUES
('08', '081', 'Sistem Informasi', '1231023123010', '2016-07-04', '120310234', '2016-07-03', '2017-07-16', 'C', '0116117302', 'sisfo@ust.ac.id', 'S1'),
('08', '084', 'Teknik Informatika', '234567', '2016-07-05', '12345', '2016-07-03', '2016-07-01', 'C', '0108117501', 'tekninfo@ust.ac.id', 'S1');

-- --------------------------------------------------------

--
-- Table structure for table `tbtahun_ajaran`
--

CREATE TABLE `tbtahun_ajaran` (
  `status` char(1) NOT NULL,
  `semester` int(11) NOT NULL,
  `id_ta` char(5) NOT NULL,
  `tahun_ajaran` char(4) NOT NULL,
  `tanggal_buat` datetime NOT NULL,
  `id_user` char(10) NOT NULL,
  `tanggal_edit` datetime NOT NULL,
  `edit_id_user` char(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbtahun_ajaran`
--

INSERT INTO `tbtahun_ajaran` (`status`, `semester`, `id_ta`, `tahun_ajaran`, `tanggal_buat`, `id_user`, `tanggal_edit`, `edit_id_user`) VALUES
('N', 1, '20121', '2012', '2016-08-24 09:54:07', 'admin', '2016-09-20 18:44:12', '1111'),
('N', 2, '20122', '2012', '2016-08-24 10:47:23', 'admin', '2016-08-31 00:59:10', '1111'),
('N', 3, '20123', '2012', '2016-08-29 21:40:59', 'admin', '2016-08-30 05:10:50', 'admin'),
('N', 1, '20131', '2013', '2016-08-24 15:18:49', '1111', '2016-09-28 02:22:48', '130810001'),
('N', 2, '20132', '2013', '2016-08-28 19:07:05', 'admin', '2016-08-31 07:34:55', 'admin'),
('N', 3, '20133', '2013', '2016-08-29 16:46:57', '1111', '2016-08-29 21:40:26', 'admin'),
('N', 1, '20141', '2014', '2016-08-29 16:47:14', '1111', '2016-09-04 04:55:47', '1111'),
('N', 2, '20142', '2014', '2016-08-29 16:47:31', '1111', '2016-08-30 05:05:52', 'admin'),
('N', 3, '20143', '2014', '2016-08-29 16:47:48', '1111', '2016-08-30 05:07:15', 'admin'),
('N', 1, '20151', '2015', '2016-08-29 16:48:28', '1111', '2016-08-30 05:01:27', 'admin'),
('N', 2, '20152', '2015', '2016-08-29 16:49:16', '1111', '2016-08-30 05:02:32', 'admin'),
('N', 3, '20153', '2015', '2016-08-29 16:49:32', '1111', '2016-08-30 05:03:46', 'admin'),
('N', 1, '20161', '2016', '2016-08-23 06:45:45', '1111', '2017-10-07 18:55:32', 'Admin'),
('A', 2, '20162', '2016', '2016-08-29 16:49:39', '1111', '2017-10-07 18:55:28', 'Admin'),
('N', 3, '20163', '2016', '2016-08-29 16:49:47', '1111', '2017-10-07 18:54:51', 'Admin'),
('N', 1, '20171', '2017', '2017-10-07 18:56:30', 'Admin', '2017-10-07 18:56:30', 'Admin'),
('N', 2, '20172', '2017', '2017-10-07 18:56:58', 'Admin', '2017-10-07 18:56:58', 'Admin'),
('N', 3, '20173', '2017', '2017-10-07 18:57:51', 'Admin', '2017-10-07 18:57:51', 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbabsensi`
--
ALTER TABLE `tbabsensi`
  ADD PRIMARY KEY (`id_absensi`),
  ADD KEY `id_jadwal` (`id_jadwal`);

--
-- Indexes for table `tbabsensi_detail`
--
ALTER TABLE `tbabsensi_detail`
  ADD PRIMARY KEY (`id_abdt`),
  ADD KEY `id_absen` (`id_absen`),
  ADD KEY `id_mhs` (`id_mhs`);

--
-- Indexes for table `tbdosen`
--
ALTER TABLE `tbdosen`
  ADD PRIMARY KEY (`nidn`);

--
-- Indexes for table `tbfakultas`
--
ALTER TABLE `tbfakultas`
  ADD PRIMARY KEY (`kd_fak`);

--
-- Indexes for table `tbjam`
--
ALTER TABLE `tbjam`
  ADD PRIMARY KEY (`kd_jam`);

--
-- Indexes for table `tbjatwalkuliah`
--
ALTER TABLE `tbjatwalkuliah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `tbmahasiswa`
--
ALTER TABLE `tbmahasiswa`
  ADD PRIMARY KEY (`npm`);

--
-- Indexes for table `tbmatakuliah`
--
ALTER TABLE `tbmatakuliah`
  ADD PRIMARY KEY (`kd_matkul`);

--
-- Indexes for table `tbprodi`
--
ALTER TABLE `tbprodi`
  ADD PRIMARY KEY (`kd_prodi`);

--
-- Indexes for table `tbtahun_ajaran`
--
ALTER TABLE `tbtahun_ajaran`
  ADD PRIMARY KEY (`id_ta`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbabsensi`
--
ALTER TABLE `tbabsensi`
  MODIFY `id_absensi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbabsensi_detail`
--
ALTER TABLE `tbabsensi_detail`
  MODIFY `id_abdt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
