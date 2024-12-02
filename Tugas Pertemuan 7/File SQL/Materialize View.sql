SELECT * FROM mv_pendaftaran_hasil_test;

DELIMITER \\
-- Drop tabel jika sudah ada
CREATE TABLE mv_pendaftaran_hasil_test AS
SELECT 
    ds.nama,
    ds.ktp,
    ds.gender,
    ds.tgl_lahir,
    ds.alamat,
    ds.status_siswa,
    ht.nilai AS nilai_test
FROM 
    data_siswa ds
LEFT JOIN 
    hasil_test ht 
ON 
    ds.nama = ht.nama;

CREATE TRIGGER after_insert_data_siswa
AFTER INSERT ON data_siswa
FOR EACH ROW
BEGIN
    INSERT INTO mv_pendaftaran_hasil_test (nama, ktp, gender, tgl_lahir, alamat, status_siswa)
    VALUES (NEW.nama, NEW.ktp, NEW.gender, NEW.tgl_lahir, NEW.alamat, NEW.status_siswa);
END \\

CREATE TRIGGER after_update_data_siswa
AFTER UPDATE ON data_siswa
FOR EACH ROW
BEGIN
    UPDATE mv_pendaftaran_hasil_test
    SET 
        nama = NEW.nama,
        ktp = NEW.ktp,
        gender = NEW.gender,
        tgl_lahir = NEW.tgl_lahir,
        alamat = NEW.alamat,
        status_siswa = NEW.status_siswa
    WHERE nama = OLD.nama;
END \\

DELIMITER ;