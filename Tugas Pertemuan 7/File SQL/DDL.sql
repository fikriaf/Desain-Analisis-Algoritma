-- Nama Aggota Kelompok:
-- Fikri Armia Fahmi (2023071018)
-- Dava Ferdian Hadiputra (2023071021)

-- Sistem Pendaftaran Oracle Internasional School --

CREATE DATABASE Pendaftaran_OIS;
USE Pendaftaran_OIS;

CREATE TABLE formulir_pendaftaran (
	no_pendaftaran INT PRIMARY KEY,
	nama varchar(100),
    ktp varchar(50),
    gender varchar(50),
    tgl_lahir DATE,
    alamat varchar(50),
    status_pembayaran BOOLEAN
);

CREATE TABLE data_siswa (
	nama varchar(100),
    ktp varchar(50),
    gender varchar(50),
    tgl_lahir DATE,
    alamat varchar(50),
    status_siswa varchar(20)
);

CREATE TABLE data_calon_siswa (
	no_pendaftaran INT PRIMARY KEY,
	nama varchar(100),
    ktp varchar(50),
    gender varchar(50),
    tgl_lahir DATE,
    alamat varchar(50),
    status_pembayaran BOOLEAN DEFAULT FALSE
);

CREATE TABLE data_pembayaran (
	no_pendaftaran INT PRIMARY KEY,
    nama varchar(100),
    status_pembayaran BOOLEAN,
    FOREIGN KEY (no_pendaftaran) REFERENCES data_calon_siswa(no_pendaftaran)
);

CREATE TABLE bank (
	no_pendaftaran INT PRIMARY KEY,
    nama varchar(100),
    status_pembayaran BOOLEAN,
    FOREIGN KEY (no_pendaftaran) REFERENCES data_calon_siswa(no_pendaftaran)
);

CREATE TABLE ketua_yayasan(
	no_pendaftaran INT PRIMARY KEY,
    nama varchar(100),
    ktp varchar(50),
    gender varchar(50),
    tgl_lahir DATE,
    alamat varchar(50),
    status_pembayaran BOOLEAN,
    nilai_test DECIMAL(5, 2),
    FOREIGN KEY (no_pendaftaran) REFERENCES data_calon_siswa(no_pendaftaran)
);
    
    
CREATE TABLE kepala_sekolah (
	no_pendaftaran INT PRIMARY KEY,
    nama varchar(100),
    ktp varchar(50),
    gender varchar(50),
    tgl_lahir DATE,
    alamat varchar(50),
    status_pembayaran BOOLEAN,
    nilai_test DECIMAL(5, 2),
    FOREIGN KEY (no_pendaftaran) REFERENCES data_calon_siswa(no_pendaftaran)
);

CREATE TABLE hasil_test (
	no_pendaftaran INT PRIMARY KEY,
    nama varchar(100),
    nilai DECIMAL (5, 2),
    FOREIGN KEY (no_pendaftaran) REFERENCES data_calon_siswa(no_pendaftaran)
);

CREATE TABLE laporan (
	tanggal DATE,
	no_pendaftaran INT PRIMARY KEY,
    nama varchar(100)
);

CREATE VIEW nama_and_status AS
SELECT nama, status_siswa
FROM data_siswa
WHERE status_siswa = "Belum Terdaftar";


ALTER TABLE data_siswa ADD nomor INT AUTO_INCREMENT KEY FIRST;
ALTER TABLE formulir_pendaftaran ADD tgl DATE;

ALTER TABLE formulir_pendaftaran CHANGE nama nama_mahasiswa VARCHAR(100);
ALTER TABLE formulir_pendaftaran CHANGE nama_mahasiswa nama VARCHAR(100);

RENAME TABLE formulir_pendaftaran TO formulir;
RENAME TABLE formulir TO formulir_pendaftaran;

-- DROP DATABASE pendaftaran_OIS;
-- ALTER TABLE nama_table DROP nama_kolom
-- ALTER TABLE formulir_pendaftaran DROP tgl;

-- CREATE INDEX nama ON formulir_pendaftaran(nama);
-- DROP INDEX nama ON formulir_pendaftaran;

-- DROP PROCEDURE IF EXISTS insert_data_siswa;
-- DROP PROCEDURE IF EXISTS lihat_formulir;
-- DROP PROCEDURE IF EXISTS cek_ktp;
-- DROP PROCEDURE IF EXISTS insert_no_pendaftaran;
-- DROP PROCEDURE IF EXISTS bank_melihat_status;
-- DROP PROCEDURE IF EXISTS bayar;
-- DROP PROCEDURE IF EXISTS kirim_ke_bank;
-- DROP PROCEDURE IF EXISTS siswa_lihat_status_pembayaran;
-- DROP PROCEDURE IF EXISTS tampilkan_data_calon_siswa;
-- DROP PROCEDURE IF EXISTS buat_laporan;
-- DROP PROCEDURE IF EXISTS tampilkan_laporan;
-- DROP PROCEDURE IF EXISTS formulir_pendaftaran;
-- DROP PROCEDURE IF EXISTS formulir_pembayaran;
-- DROP VIEW nama_and_status;
