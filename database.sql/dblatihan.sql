-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Jan 2025 pada 15.16
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dblatihan`
--
CREATE DATABASE IF NOT EXISTS `dblatihan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dblatihan`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kategori`
--

CREATE TABLE `tbl_kategori` (
  `id` int(11) UNSIGNED NOT NULL,
  `kategori` varchar(200) NOT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `Aktif` enum('Y','N') DEFAULT 'Y',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_kategori`
--

INSERT INTO `tbl_kategori` (`id`, `kategori`, `slug`, `Aktif`, `created_at`, `updated_at`) VALUES
(1, 'Kategori 1', NULL, 'Y', '2025-01-07 09:20:31', NULL),
(2, 'Kategori 2', NULL, 'N', '2025-01-07 09:20:31', NULL),
(3, 'Kategori 3', NULL, 'Y', '2025-01-07 09:20:31', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_log`
--

CREATE TABLE `tbl_log` (
  `id` int(11) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `user` varchar(100) NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT current_timestamp(),
  `title_lama` varchar(200) DEFAULT NULL,
  `title_baru` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_log`
--

INSERT INTO `tbl_log` (`id`, `keterangan`, `user`, `waktu`, `title_lama`, `title_baru`) VALUES
(1, 'INSERT', 'root@localhost', '2025-01-08 03:29:41', NULL, 'Dickrullah Brilian Akbar');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_posts`
--

CREATE TABLE `tbl_posts` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(100) DEFAULT 'Noimage.jpg',
  `hits` int(11) NOT NULL DEFAULT 0,
  `aktif` enum('Y','N') NOT NULL DEFAULT 'Y',
  `status` enum('publish','draft') NOT NULL DEFAULT 'publish',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_posts`
--

INSERT INTO `tbl_posts` (`id`, `title`, `slug`, `user_id`, `content`, `image`, `hits`, `aktif`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Dickrullah Brilian Akbar', '', 0, '', 'Noimage.jpg', 0, 'Y', 'publish', NULL, NULL);

--
-- Trigger `tbl_posts`
--
DELIMITER $$
CREATE TRIGGER `after_delete_tbl_posts` AFTER DELETE ON `tbl_posts` FOR EACH ROW BEGIN
    INSERT INTO tbl_log (keterangan, user, title_lama)
    VALUES ('DELETE', USER(), OLD.title);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_insert_tbl_posts` AFTER INSERT ON `tbl_posts` FOR EACH ROW BEGIN
    INSERT INTO tbl_log (keterangan, user, title_baru)
    VALUES ('INSERT', USER(), NEW.title);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_tbl_posts` AFTER UPDATE ON `tbl_posts` FOR EACH ROW BEGIN
    INSERT INTO tbl_log (keterangan, user, title_lama, title_baru)
    VALUES ('UPDATE', USER(), OLD.title, NEW.title);
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_log`
--
ALTER TABLE `tbl_log`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_posts`
--
ALTER TABLE `tbl_posts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_log`
--
ALTER TABLE `tbl_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_posts`
--
ALTER TABLE `tbl_posts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
