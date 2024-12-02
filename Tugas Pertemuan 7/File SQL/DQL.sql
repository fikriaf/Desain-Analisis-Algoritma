-- Nama Aggota Kelompok:
-- Fikri Armia Fahmi (2023071018)
-- Dava Ferdian Hadiputra (2023071021)

-- TAMPILKAN TABLE
SELECT * FROM formulir_pendaftaran;
SELECT * FROM data_siswa;
SELECT * FROM data_calon_siswa;
SELECT * FROM data_pembayaran;
SELECT * FROM bank;
SELECT * FROM ketua_yayasan;
SELECT * FROM kepala_sekolah;
SELECT * FROM hasil_test;

-- SHOW
SHOW CREATE DATABASE pendaftaran_ois; 
SHOW TABLES;
SHOW CREATE TABLE data_siswa;
SHOW COLUMNS FROM data_siswa; 

-- TAMPILKAN VIEW
SELECT * FROM nama_and_status;

-- MATERIALIZE VIEW
SELECT * FROM mv_pendaftaran_hasil_test;
