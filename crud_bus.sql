-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Inang: 127.0.0.1
-- Waktu pembuatan: 10 Sep 2020 pada 17.10
-- Versi Server: 5.6.11
-- Versi PHP: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Basis data: `crud_bus`
--
CREATE DATABASE IF NOT EXISTS `crud_bus` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `crud_bus`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bus`
--

CREATE TABLE IF NOT EXISTS `bus` (
  `id_bus` int(11) NOT NULL AUTO_INCREMENT,
  `nama_bus` varchar(50) NOT NULL,
  `foto_bus` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id_bus`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data untuk tabel `bus`
--

INSERT INTO `bus` (`id_bus`, `nama_bus`, `foto_bus`, `status`) VALUES
(3, 'Ramayana', 'ramayana.png', 'Tunda'),
(4, 'Handoyo', '1.png', 'Telah Berangkat'),
(5, 'Sumber waras', 'smbrwrs.jpg', 'Batal Berangkat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE IF NOT EXISTS `jadwal` (
  `id_jadwal` int(11) NOT NULL AUTO_INCREMENT,
  `wkt_keberangkatan` time NOT NULL,
  `wkt_tiba` time NOT NULL,
  `jalur` varchar(50) NOT NULL,
  PRIMARY KEY (`id_jadwal`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `jadwal`
--

INSERT INTO `jadwal` (`id_jadwal`, `wkt_keberangkatan`, `wkt_tiba`, `jalur`) VALUES
(1, '00:09:00', '00:12:00', 'jogja-temanggung'),
(2, '00:20:20', '00:05:30', 'jogja-bekasi');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
