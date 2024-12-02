-- Nama Aggota Kelompok:
-- Fikri Armia Fahmi (2023071018)
-- Dava Ferdian Hadiputra (2023071021)

-- INSERT DATA SISWA
CALL insert_data_siswa (
	"Fikri",
    "1234567890123456",
    "Laki-laki",
    "2004-09-02",
    "Jl. Cendrawasih VI, No. 73",
    "Belum Terdaftar"
);
CALL insert_data_siswa(
	"Dava", 
	"2539657678264972", 
	"Laki-laki", 
	"2000-01-01", 
	"Jl. Mawar No. 12", 
	"Terdaftar"
);


-- TAMPILKAN ISIAN FORMULIR PENDAFTARAN
CALL lihat_formulir();

-- CEK APAKAH SISWA SUDAH PERNAH MENDAFTAR ATAU BELUM? Lakukan pencarian data sesuai KTP, atau nama dan tempat tanggal lahir 
CALL cek_ktp("1234567890123456");

-- JIKA BELUM, MAKA INSERT NOMOR PENDAFTARAN

CALL insert_no_pendaftaran(
	291,
	"Fikri",
    "1234567890123456",
    "Laki-laki",
    "2004-09-02",
    "Jl. Cendrawasih VI, No. 73"
);

-- JIKA SUDAH TERDAFTAR, TAMPILKAN DATA SISWA DARI HASIL PENCARIAN
CALL tampilkan_terdaftar();

-- BANK MENGAKSES DAN DAPAT MELIHAT DATA SISWA
CALL bank_melihat_status();

-- SISWA MELAKUKAN PEMBAYARAN
CALL bayar(291);

-- Berikan data/informasi Data siswa ke Bank (saat bank mencari Nomor pendaftaran, tampilkan nama dan data lainnya)
CALL kirim_ke_bank(291);
CALL bank_melihat_status();

-- Data status pembayaran dari Bank, diupdate ke table Data Siswa dengan status “Bayar” 
CALL update_status_bayar(291);
SELECT * FROM data_calon_siswa;

-- Siswa melakukan test sesuai dengan Nomor Pendaftaran dan Jawaban disimpan dalam table Hasil Test
CALL insert_nilai (291, "Fikri", 99.9);
SELECT * FROM hasil_test;

-- Proses pengolahan jawaban siswa dan update Hasil Test sesuai nilai yang diperoleh 
SELECT * FROM hasil_test;

-- Siswa dapat mengakses hasil test sesuai Nomor Perdaftaran
CALL lihat_hasil(291);

-- Siswa dapat mengakses Status Pembayaran sesuai Nomor Pendaftaran 
CALL siswa_lihat_status_pembayaran(291);

-- Buatkan kwitansi pembayaran (nomor kwitansi generate otomatis, tampilkan Data Calon Siswa) 
CALL kwitansi (291);
SELECT *  FROM kwitansi;
ALTER TABLE data_calon_siswa ADD COLUMN kwitansi varchar(100);

SET SQL_SAFE_UPDATES = 0;
UPDATE data_calon_siswa
SET kwitansi = (SELECT nomor_kuitansi FROM kwitansi LIMIT 1);

CALL tampilkan_data_calon_siswa();

-- Sistem dapat membuat Laporan Pembayaran dengan data dan informasi pada kolom sesuai yang dibutuhkan,
CALL buat_laporan ("2024-10-10", 291, "Fikri");

-- maka buat query untuk menampilkan Laporan ini sesuai pilihan periode tanggal 
CALL tampilkan_laporan("2024-10-10");
