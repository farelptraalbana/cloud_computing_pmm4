-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Mar 2024 pada 17.02
-- Versi server: 10.4.32-MariaDB-log
-- Versi PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ppdb_sd13`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `berita`
--

CREATE TABLE `berita` (
  `id_berita` int(11) NOT NULL,
  `judul_berita` varchar(50) NOT NULL,
  `mitra` varchar(50) NOT NULL,
  `penjelasan_berita` varchar(255) NOT NULL,
  `foto_berita` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `berita`
--

INSERT INTO `berita` (`id_berita`, `judul_berita`, `mitra`, `penjelasan_berita`, `foto_berita`) VALUES
(1, 'Kurikulum Merdeka', 'Kementrian Pendidikan', 'Kurikulum Merdeka meberikan keleluasaan kepada pendidik untuk menciptakan pembelajaran berkualitas yang sesuai dengan kebutuhan dan lingkungan belajar peserta didik.', 'Kurikulum.png'),
(2, 'PPDB 2024', 'Dinas Pendidikan', 'PPDB 2024 belum berlangsung silahkan menunggu dan pantau terus wesite ini, karena update berita akan diberikan melalui berita pada laman ini terimakasih.', 'ppdbnew.png'),
(3, 'Merdeka Mengajar', 'Kementrian Pendidikan', 'Merdeka Belajar adalah sebuah program yang digagas oleh Menteri Pendidikan, Kebudayaan, Riset, dan Teknologi, Nadiem Anwar Makarim sebagai upaya untuk bebas berpikir dan berekspresi.', 'mengajar.png'),
(4, 'Pelajar Pancasila', 'Kementrian Pendidikan', 'Pelajar Pancasila merupakan ciri karakter dan kompetensi yang diharapkan untuk diraih oleh peserta didik, yang didasarkan pada nilai-nilai luhur Pancasila.', 'pelajar.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `berkas`
--

CREATE TABLE `berkas` (
  `id_berkas` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `kartu_keluarga` varchar(500) NOT NULL,
  `akta_lahir` varchar(500) NOT NULL,
  `pas_foto` varchar(500) NOT NULL,
  `ktp` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `berkas`
--

INSERT INTO `berkas` (`id_berkas`, `id_siswa`, `kartu_keluarga`, `akta_lahir`, `pas_foto`, `ktp`) VALUES
(18, 7, 'kk.jpg', 'akta.jpg', 'Rovy Saputra Nugeraha.png', 'ktp.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `biodata_ayah`
--

CREATE TABLE `biodata_ayah` (
  `id_ayah` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `nama_ayah` varchar(50) NOT NULL,
  `pekerjaan_ayah` varchar(50) NOT NULL,
  `alamat_ayah` varchar(75) NOT NULL,
  `no_hp_ayah` varchar(15) NOT NULL,
  `tgl_lahir_ayah` date NOT NULL,
  `tempat_lahir_ayah` varchar(30) NOT NULL,
  `pend_terakhir_ayah` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `biodata_ayah`
--

INSERT INTO `biodata_ayah` (`id_ayah`, `id_siswa`, `nama_ayah`, `pekerjaan_ayah`, `alamat_ayah`, `no_hp_ayah`, `tgl_lahir_ayah`, `tempat_lahir_ayah`, `pend_terakhir_ayah`) VALUES
(11, 7, 'Prabowo Gibran', 'Presiden RI', 'Jalan dekat markas banteng', '0899789875324', '1945-10-25', 'Jakarta', 'S3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `biodata_ibu`
--

CREATE TABLE `biodata_ibu` (
  `id_ibu` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `nama_ibu` varchar(50) NOT NULL,
  `pekerjaan_ibu` varchar(50) NOT NULL,
  `alamat_ibu` varchar(75) NOT NULL,
  `no_hp_ibu` varchar(15) NOT NULL,
  `tgl_lahir_ibu` date NOT NULL,
  `tempat_lahir_ibu` varchar(30) NOT NULL,
  `pend_terakhir_ibu` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `biodata_ibu`
--

INSERT INTO `biodata_ibu` (`id_ibu`, `id_siswa`, `nama_ibu`, `pekerjaan_ibu`, `alamat_ibu`, `no_hp_ibu`, `tgl_lahir_ibu`, `tempat_lahir_ibu`, `pend_terakhir_ibu`) VALUES
(3, 7, 'Siti Nurhasanah', 'Ibu Rumah Tangga', 'Jalan Cempedak', '08653423143', '1945-04-03', 'Daik', 'S1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `biodata_siswa`
--

CREATE TABLE `biodata_siswa` (
  `id_siswa` int(11) NOT NULL,
  `id_login_siswa` int(11) NOT NULL,
  `nama_siswa` varchar(50) NOT NULL,
  `tgl_lahir_siswa` date NOT NULL,
  `tempat_lahir_siswa` varchar(25) NOT NULL,
  `alamat_siswa` varchar(75) NOT NULL,
  `nik_siswa` int(20) NOT NULL,
  `jk_siswa` enum('Laki-Laki','Perempuan') NOT NULL,
  `agama_siswa` varchar(20) NOT NULL,
  `anak_ke` int(10) NOT NULL,
  `jumlah_saudara` int(10) NOT NULL,
  `status_keluarga` enum('Anak Kandung','Anak Angkat','Lainnya') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `biodata_siswa`
--

INSERT INTO `biodata_siswa` (`id_siswa`, `id_login_siswa`, `nama_siswa`, `tgl_lahir_siswa`, `tempat_lahir_siswa`, `alamat_siswa`, `nik_siswa`, `jk_siswa`, `agama_siswa`, `anak_ke`, `jumlah_saudara`, `status_keluarga`) VALUES
(7, 5, 'Rovy Saputra Nugeraha', '2002-10-10', 'Daik', 'Jalan Gang Murai', 987654321, 'Laki-Laki', 'Islam', 1, 2, 'Anak Kandung');

-- --------------------------------------------------------

--
-- Struktur dari tabel `countdown_login`
--

CREATE TABLE `countdown_login` (
  `id_countdown` int(11) NOT NULL,
  `target_datetime` datetime NOT NULL,
  `status` enum('Aktif','NonAktif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `countdown_login`
--

INSERT INTO `countdown_login` (`id_countdown`, `target_datetime`, `status`) VALUES
(1, '2024-02-02 19:00:00', 'Aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_guru`
--

CREATE TABLE `data_guru` (
  `id_guru` int(11) NOT NULL,
  `nip_guru` varchar(20) NOT NULL,
  `nama_guru` varchar(30) NOT NULL,
  `alamat_guru` varchar(50) NOT NULL,
  `no_hp_guru` varchar(15) NOT NULL,
  `status_kepegawaian` enum('Pegawai','PPPK','Honorer') NOT NULL,
  `jenis_ptk` varchar(100) NOT NULL,
  `tgl_lahir_guru` date NOT NULL,
  `tempat_lahir_guru` varchar(30) NOT NULL,
  `jk_guru` enum('Laki-Laki','Perempuan') NOT NULL,
  `kompetensi_guru` varchar(50) NOT NULL,
  `jurusan_guru` varchar(30) NOT NULL,
  `kata_pengantar` varchar(255) NOT NULL,
  `foto_guru` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `data_guru`
--

INSERT INTO `data_guru` (`id_guru`, `nip_guru`, `nama_guru`, `alamat_guru`, `no_hp_guru`, `status_kepegawaian`, `jenis_ptk`, `tgl_lahir_guru`, `tempat_lahir_guru`, `jk_guru`, `kompetensi_guru`, `jurusan_guru`, `kata_pengantar`, `foto_guru`) VALUES
(6, '123456789', 'Irma Nurcahyani', 'Tanjungpinang', '08767654321', 'Honorer', 'Tenaga Administrasi Sekolah', '1980-07-26', 'Sragen', 'Perempuan', '-', 'Teknik Informatika', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquam cum quam quia, magni officiis corporis id eveniet et, hic culpa nemo repudiandae a assumenda nostrum nulla recusandae beatae mollitia quae!', 'guru-perempuan.png'),
(7, '198908012023211007', 'Alimun Akbar Siregar', 'Tanjungpinang', '09896565413', 'PPPK', 'Guru Mapel', '1989-08-01', 'MORANG', 'Laki-Laki', 'Guru Kelas SD/MI', 'Bahasa Indonesia', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquam cum quam quia, magni officiis corporis id eveniet et, hic culpa nemo repudiandae a assumenda nostrum nulla recusandae beatae mollitia quae!', 'guru-laki.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `e_learning`
--

CREATE TABLE `e_learning` (
  `id_learning` int(11) NOT NULL,
  `judul_konten` varchar(50) NOT NULL,
  `link_yt` varchar(100) NOT NULL,
  `file` varchar(500) NOT NULL,
  `kategori` enum('konten_yt','materi','game') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `e_learning`
--

INSERT INTO `e_learning` (`id_learning`, `judul_konten`, `link_yt`, `file`, `kategori`) VALUES
(5, 'Makanan Khas Melayu', 'https://wordwall.net/embed/ae6dda6f2ba647b3b57dab1c568dca2f', '', 'game'),
(7, 'GURINDAM 12 RAJA ALI HAJI │Pasal 1 s.d Pasal 4', 'https://www.youtube.com/embed/g2BjRfdQfTA', '', 'konten_yt'),
(8, 'INI GURINDAM PASAL KELIMA', 'https://www.youtube.com/embed/V8PNqTgc6-s', '', 'konten_yt'),
(9, 'INI GURINDAM PASAL KE-12', 'https://www.youtube.com/embed/28DYvldu8N0', '', 'konten_yt'),
(10, 'INI GURINDAM PASAL KE-11', 'https://www.youtube.com/embed/HrDBqquLhho', '', 'konten_yt'),
(12, 'Buku MTK Siswa Kelas 9', '-', 'Buku_Siswa_Matematika_Kelas_9_Revisi 2018_kadek.pdf', 'materi'),
(13, 'Buku Guru MTK kelas 9', 'https://www.kherysuryawan.id/2019/12/materi-pelajaran-matematika-kelas-7.html', 'Buku_Guru _Matematika_SMP_Kelas_9_Revisi_2018.pdf', 'materi'),
(14, 'Kelas VIII Matematika BS Sem 1', '-', 'Kelas VIII Matematika BS Sem 1.pdf', 'materi'),
(15, 'Pulau Penyegat', 'https://wordwall.net/embed/f458e34f787044eb82795c3b87c08300', '', 'game'),
(17, 'Kelas VIII Matematika BS Sem 1', '-', 'Kelas VIII Matematika BS Sem 2.pdf', 'materi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `e_learning_login`
--

CREATE TABLE `e_learning_login` (
  `id` int(11) NOT NULL,
  `qrcode` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `e_learning_login`
--

INSERT INTO `e_learning_login` (`id`, `qrcode`, `name`) VALUES
(1, 'LOGIN SYSTEM E-LEARNING', 'LOGIN SYSTEM E-LEARNING');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hasil_seleksi`
--

CREATE TABLE `hasil_seleksi` (
  `id_seleksi` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `tgl_penerimaan` date NOT NULL,
  `jalur_penerimaan` varchar(30) NOT NULL,
  `status_penerimaan` enum('Sudah di Setujui','Tidak di Setujui') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `login_admin`
--

CREATE TABLE `login_admin` (
  `id_pengguna` int(11) NOT NULL,
  `nama_pengguna` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` enum('Administrator','Guru') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `login_admin`
--

INSERT INTO `login_admin` (`id_pengguna`, `nama_pengguna`, `username`, `password`, `level`) VALUES
(1, 'Rovy Saputra Nugeraha', 'rovy', 'c4ca4238a0b923820dcc509a6f75849b', 'Administrator'),
(12, 'user', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator'),
(16, 'Farel Putra Albana', 'farel', '$2y$10$UHb./mfKwyYmCQJf00I/0.TRDIUi79Z.Oz8IVK1.zfSU8MccGy976', 'Administrator');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login_siswa`
--

CREATE TABLE `login_siswa` (
  `id_login_siswa` int(11) NOT NULL,
  `nik` varchar(25) NOT NULL,
  `nama_pendek` varchar(10) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `login_siswa`
--

INSERT INTO `login_siswa` (`id_login_siswa`, `nik`, `nama_pendek`, `email`, `password`, `status`) VALUES
(5, '987654321', 'Rovy', '2101020057@student.umrah.ac.id', '$2y$10$62JI8TUJQyIW6STwkiOHpeZjvayig.wcMN57Y47goxfaT92uE.dXq', 1),
(6, '2101020057', 'Farel', 'farelptraalbana@gmail.com', '$2y$10$iUQF8ricThRSYHrSMiE0vOePbHk6Ny9P/ML5ZStAOTTa9NjVzJ87e', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_profil`
--

CREATE TABLE `tb_profil` (
  `id_profil` int(11) NOT NULL,
  `nama_profil` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `bidang` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_profil`
--

INSERT INTO `tb_profil` (`id_profil`, `nama_profil`, `alamat`, `bidang`) VALUES
(1, 'SDN 013 TANJUNGPINANG BARAT', 'Jl. Yus Sudarso, TANJUNGPINANG BARAT, Kec. Tanjung Pinang Barat, Kota Tanjungpinang Prov. Kepulauan Riau', 'PENDIDIKAN');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id_berita`);

--
-- Indeks untuk tabel `berkas`
--
ALTER TABLE `berkas`
  ADD PRIMARY KEY (`id_berkas`),
  ADD KEY `id_siswa` (`id_siswa`);

--
-- Indeks untuk tabel `biodata_ayah`
--
ALTER TABLE `biodata_ayah`
  ADD PRIMARY KEY (`id_ayah`),
  ADD KEY `id_siswa` (`id_siswa`);

--
-- Indeks untuk tabel `biodata_ibu`
--
ALTER TABLE `biodata_ibu`
  ADD PRIMARY KEY (`id_ibu`),
  ADD KEY `id_siswa` (`id_siswa`);

--
-- Indeks untuk tabel `biodata_siswa`
--
ALTER TABLE `biodata_siswa`
  ADD PRIMARY KEY (`id_siswa`),
  ADD KEY `id_login_siswa` (`id_login_siswa`);

--
-- Indeks untuk tabel `countdown_login`
--
ALTER TABLE `countdown_login`
  ADD PRIMARY KEY (`id_countdown`);

--
-- Indeks untuk tabel `data_guru`
--
ALTER TABLE `data_guru`
  ADD PRIMARY KEY (`id_guru`);

--
-- Indeks untuk tabel `e_learning`
--
ALTER TABLE `e_learning`
  ADD PRIMARY KEY (`id_learning`);

--
-- Indeks untuk tabel `e_learning_login`
--
ALTER TABLE `e_learning_login`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `hasil_seleksi`
--
ALTER TABLE `hasil_seleksi`
  ADD PRIMARY KEY (`id_seleksi`),
  ADD KEY `id_siswa` (`id_siswa`);

--
-- Indeks untuk tabel `login_admin`
--
ALTER TABLE `login_admin`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indeks untuk tabel `login_siswa`
--
ALTER TABLE `login_siswa`
  ADD PRIMARY KEY (`id_login_siswa`);

--
-- Indeks untuk tabel `tb_profil`
--
ALTER TABLE `tb_profil`
  ADD PRIMARY KEY (`id_profil`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `berita`
--
ALTER TABLE `berita`
  MODIFY `id_berita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `berkas`
--
ALTER TABLE `berkas`
  MODIFY `id_berkas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `biodata_ayah`
--
ALTER TABLE `biodata_ayah`
  MODIFY `id_ayah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `biodata_ibu`
--
ALTER TABLE `biodata_ibu`
  MODIFY `id_ibu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `biodata_siswa`
--
ALTER TABLE `biodata_siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `countdown_login`
--
ALTER TABLE `countdown_login`
  MODIFY `id_countdown` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `data_guru`
--
ALTER TABLE `data_guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `e_learning`
--
ALTER TABLE `e_learning`
  MODIFY `id_learning` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `e_learning_login`
--
ALTER TABLE `e_learning_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `hasil_seleksi`
--
ALTER TABLE `hasil_seleksi`
  MODIFY `id_seleksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `login_admin`
--
ALTER TABLE `login_admin`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `login_siswa`
--
ALTER TABLE `login_siswa`
  MODIFY `id_login_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tb_profil`
--
ALTER TABLE `tb_profil`
  MODIFY `id_profil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `berkas`
--
ALTER TABLE `berkas`
  ADD CONSTRAINT `berkas_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `biodata_siswa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `biodata_ayah`
--
ALTER TABLE `biodata_ayah`
  ADD CONSTRAINT `biodata_ayah_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `biodata_siswa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `biodata_ibu`
--
ALTER TABLE `biodata_ibu`
  ADD CONSTRAINT `biodata_ibu_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `biodata_siswa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `biodata_siswa`
--
ALTER TABLE `biodata_siswa`
  ADD CONSTRAINT `biodata_siswa_ibfk_1` FOREIGN KEY (`id_login_siswa`) REFERENCES `login_siswa` (`id_login_siswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `hasil_seleksi`
--
ALTER TABLE `hasil_seleksi`
  ADD CONSTRAINT `hasil_seleksi_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `biodata_siswa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
