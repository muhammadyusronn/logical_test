-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 17 Des 2021 pada 04.50
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tes`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_mahasiswa`
--

CREATE TABLE `tbl_mahasiswa` (
  `mhs_id` int(11) NOT NULL,
  `mhs_nama` varchar(20) NOT NULL,
  `mhs_angkatan` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_mahasiswa`
--

INSERT INTO `tbl_mahasiswa` (`mhs_id`, `mhs_nama`, `mhs_angkatan`) VALUES
(1, 'Jono', '2018'),
(2, 'Taufik', '2018'),
(3, 'Maria', '2019'),
(4, 'Sari', '2019'),
(5, 'Bambang', '2019');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_mahasiswa_nilai`
--

CREATE TABLE `tbl_mahasiswa_nilai` (
  `mhs_nilai_id` int(11) NOT NULL,
  `mhs_id` int(11) NOT NULL,
  `mk_id` int(11) NOT NULL,
  `nilai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_mahasiswa_nilai`
--

INSERT INTO `tbl_mahasiswa_nilai` (`mhs_nilai_id`, `mhs_id`, `mk_id`, `nilai`) VALUES
(1, 1, 2, 76),
(2, 2, 2, 74),
(3, 4, 2, 80),
(4, 1, 1, 70),
(5, 2, 1, 82),
(6, 4, 1, 78),
(7, 5, 1, 60);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_matakuliah`
--

CREATE TABLE `tbl_matakuliah` (
  `mk_id` int(11) NOT NULL,
  `mk_kode` varchar(10) NOT NULL,
  `mk_sks` int(11) NOT NULL,
  `mk_nama` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_matakuliah`
--

INSERT INTO `tbl_matakuliah` (`mk_id`, `mk_kode`, `mk_sks`, `mk_nama`) VALUES
(1, 'MK202', 3, 'OOP'),
(2, 'MK303', 2, 'Basis Data');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_mahasiswa`
--
ALTER TABLE `tbl_mahasiswa`
  ADD PRIMARY KEY (`mhs_id`);

--
-- Indeks untuk tabel `tbl_mahasiswa_nilai`
--
ALTER TABLE `tbl_mahasiswa_nilai`
  ADD PRIMARY KEY (`mhs_nilai_id`),
  ADD KEY `mhs_id` (`mhs_id`),
  ADD KEY `mk_id` (`mk_id`);

--
-- Indeks untuk tabel `tbl_matakuliah`
--
ALTER TABLE `tbl_matakuliah`
  ADD PRIMARY KEY (`mk_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_mahasiswa`
--
ALTER TABLE `tbl_mahasiswa`
  MODIFY `mhs_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tbl_mahasiswa_nilai`
--
ALTER TABLE `tbl_mahasiswa_nilai`
  MODIFY `mhs_nilai_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tbl_matakuliah`
--
ALTER TABLE `tbl_matakuliah`
  MODIFY `mk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_mahasiswa_nilai`
--
ALTER TABLE `tbl_mahasiswa_nilai`
  ADD CONSTRAINT `tbl_mahasiswa_nilai_ibfk_1` FOREIGN KEY (`mhs_id`) REFERENCES `tbl_mahasiswa` (`mhs_id`),
  ADD CONSTRAINT `tbl_mahasiswa_nilai_ibfk_2` FOREIGN KEY (`mk_id`) REFERENCES `tbl_matakuliah` (`mk_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
