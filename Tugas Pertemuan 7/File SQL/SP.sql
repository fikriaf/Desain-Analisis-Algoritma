-- Nama Aggota Kelompok:
-- Fikri Armia Fahmi (2023071018)
-- Dava Ferdian Hadiputra (2023071021)

DELIMITER //

-- SP INSERT DATA SISWA
CREATE PROCEDURE insert_data_siswa (IN sp_nama varchar(100), IN sp_ktp varchar(50), IN sp_gender varchar(50), IN sp_tgl_lahir DATE, IN sp_alamat varchar(50), IN sp_status_siswa varchar(20))
BEGIN
	INSERT INTO data_siswa (nama, ktp, gender, tgl_lahir, alamat, status_siswa)
    VALUES (sp_nama, sp_ktp, sp_gender, sp_tgl_lahir, sp_alamat, sp_status_siswa);
END //

-- SP MENAMPILKAN FORMULIR PENDAFTARAN
CREATE PROCEDURE lihat_formulir()
BEGIN
	SELECT * FROM formulir_pendaftaran;
END //

CREATE PROCEDURE cek_ktp (IN sp_ktp varchar(50))
BEGIN
	SELECT * FROM data_siswa WHERE ktp = sp_ktp;
END //

-- SP UNTUK MENGINSERT NOMOR PENDAFTARAN JIKA BELUM TERDAFTAR
CREATE PROCEDURE insert_no_pendaftaran (IN sp_no_pendaftaran INT, IN sp_nama varchar(100), IN sp_ktp varchar(50), IN sp_gender varchar(50), IN sp_tgl_lahir DATE, IN sp_alamat varchar(50))
BEGIN
    INSERT INTO data_calon_siswa (no_pendaftaran, nama, ktp, gender, tgl_lahir, alamat, status_pembayaran)
    VALUES (sp_no_pendaftaran, sp_nama, sp_ktp, sp_gender, sp_tgl_lahir, sp_alamat, FALSE);
END //

-- SP TAMPILKAN YANG SUDAH TERDAFTAR
CREATE PROCEDURE tampilkan_terdaftar()
BEGIN
	SELECT * FROM data_siswa
	WHERE status_siswa = "Terdaftar";
END //

-- SP UNTUK BANK MELIHAT STATUS PEMBAYARAN
CREATE PROCEDURE bank_melihat_status ()
BEGIN
    SELECT no_pendaftaran, nama, status_pembayaran FROM data_calon_siswa;
END //

-- SP UNTUK SISWA MELAKUKAN PEMBAYARAN
CREATE PROCEDURE bayar(IN sp_no_pendaftaran INT)
BEGIN
    UPDATE data_calon_siswa
    SET status_pembayaran = TRUE
    WHERE no_pendaftaran = sp_no_pendaftaran;
END //

-- SP UNTUK MENGIRIM DATA KE BANK DAN MENAMPILKANNYA
CREATE PROCEDURE kirim_ke_bank (IN sp_no_pendaftaran INT)
BEGIN
	INSERT INTO bank (no_pendaftaran, nama, status_pembayaran)
    SELECT no_pendaftaran, nama, status_pembayaran
    FROM data_calon_siswa;
END //

-- SP UNTUK UPDATE STATUS PEMBAYARAN MENJADI "BAYAR"
CREATE PROCEDURE update_status_bayar (IN sp_no_pendaftaran INT)
BEGIN
	ALTER TABLE data_calon_siswa
    MODIFY COLUMN status_pembayaran VARCHAR(10);
    UPDATE data_calon_siswa
    SET status_pembayaran = "Bayar"
    WHERE no_pendaftaran = sp_no_pendaftaran;
END //

-- SP MENGINSERT NILAI TEST
CREATE PROCEDURE insert_nilai (IN sp_no_pendaftaran INT, IN sp_nama VARCHAR(100), IN sp_nilai DECIMAL(5,2))
BEGIN
	INSERT INTO hasil_test (no_pendaftaran, nama, nilai)
    VALUES (sp_no_pendaftaran, sp_nama, sp_nilai);
END //

-- SP SISWA MELIHAT HASIL TEST
CREATE PROCEDURE lihat_hasil (IN sp_no_pendaftaran INT)
BEGIN
	SELECT * FROM hasil_test
    WHERE no_pendaftaran = sp_no_pendaftaran;
END //

-- SP SISWA MELIHAT STATUS PEMBAYARAN
CREATE PROCEDURE siswa_lihat_status_pembayaran (IN sp_no_pendaftaran INT)
BEGIN
	SELECT no_pendaftaran, nama, status_pembayaran FROM data_calon_siswa
    WHERE no_pendaftaran = sp_no_pendaftaran;
END //

-- SP MEMBUAT KWITANSI
CREATE PROCEDURE kwitansi (IN sp_no_pendaftaran INT)
BEGIN
	CREATE TABLE IF NOT EXISTS kwitansi (
		no_pendaftaran INT PRIMARY KEY,
		nomor_kuitansi VARCHAR(20) NOT NULL
	);
	-- Menghasilkan nomor kuitansi baru
	SET @random_number = FLOOR(100000 + (RAND() * 900000));
	SET @nomor_kuitansi = CONCAT('INV-', @random_number);
    -- Insert data
    INSERT INTO kwitansi (no_pendaftaran, nomor_kuitansi)
    VALUES (sp_no_pendaftaran, @nomor_kuitansi);
END //

-- SP TAMPILKAN DATA CALON SISWA BESERTA INFORMASI KWITANSI
CREATE PROCEDURE tampilkan_data_calon_siswa ()
BEGIN
    SELECT dcs.*, k.nomor_kuitansi 
	FROM data_calon_siswa dcs
	LEFT JOIN kwitansi k ON dcs.kwitansi = k.nomor_kuitansi;
END //


-- SP UNTUK MENAMPILKAN LAPORAN
CREATE PROCEDURE buat_laporan (IN sp_tanggal DATE, IN sp_no_pendaftaran INT,  IN sp_nama varchar(100))
BEGIN
	INSERT INTO laporan (tanggal, no_pendaftaran, nama)
    VALUES (sp_tanggal, sp_no_pendaftaran, sp_nama);
END //

-- SP TAMPILKAN LAPORAN
CREATE PROCEDURE tampilkan_laporan (IN sp_tanggal DATE)
BEGIN
	SELECT * FROM laporan
    WHERE tanggal = sp_tanggal;
END //


-- SP UNTUK FORMULIR PENDAFTARAN
CREATE PROCEDURE formulir_pendaftaran (IN sp_no_pendaftaran INT, IN sp_nama varchar(100), IN sp_ktp varchar(50), IN sp_gender varchar(50), IN sp_tgl_lahir DATE, IN sp_alamat varchar(50))
BEGIN
	INSERT INTO data_calon_siswa (no_pendaftaran, nama, ktp, gender, tgl_lahir, alamat)
    VALUES (sp_no_pendaftaran, sp_nama, sp_ktp, sp_gender, sp_tgl_lahir, sp_alamat);
END //

-- SP UNTUK FORMULIR PEMBAYARAN
CREATE PROCEDURE formulir_pembayaran (IN sp_no_pendaftaran INT, IN sp_nama varchar(100), IN sp_status_pembayaran BOOLEAN)
BEGIN
	INSERT INTO data_calon_siswa (no_pendaftaran, nama, status_pembayaran)
    VALUES (sp_no_pendaftaran, sp_nama, sp_status_pembayaran);
END //

DELIMITER ;
