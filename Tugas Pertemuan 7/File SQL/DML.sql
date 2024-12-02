-- Nama Aggota Kelompok:
-- Fikri Armia Fahmi (2023071018)
-- Dava Ferdian Hadiputra (2023071021)

-- INSERT DATA SISWA
INSERT INTO data_siswa (nama, ktp, gender, tgl_lahir, alamat, status_siswa)
VALUES ("Armia", "2338275348273654", "Laki-laki", "2002-12-01", "Ds. Penusupan", "Belum Terdaftar");

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

INSERT INTO data_calon_siswa (no_pendaftaran, nama, ktp, gender, tgl_lahir, alamat, status_pembayaran)
VALUES (364, "Armia", "2338275348273654", "Laki-laki", "2002-12-1", "Ds. Penusupan", FALSE);

UPDATE data_calon_siswa
SET status_pembayaran = TRUE
WHERE no_pendaftaran = 364;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM data_siswa
WHERE nama = "Fikri";

DELETE FROM data_calon_siswa
WHERE nama = "Armia";

-- UPDATE VIEW
CREATE OR REPLACE VIEW nama_and_status AS
SELECT nama, ktp, status_siswa
FROM data_siswa
WHERE status_siswa = "Belum Terdaftar";
