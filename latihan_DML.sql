# Latihan DML 

# Create table 

-- table mahasiswa
CREATE TABLE MAHASISWA (
    THANG INT,
    NIM INT,
    NAMA VARCHAR(30),
    ALAMAT VARCHAR(80),
    TGL DATETIME
);

-- table KRS 
CREATE TABLE KRS (
    NIM INT,
    IDKELAS INT,
    NILAI INT
);

-- Table Kelas 
CREATE TABLE KELAS (
    IDKELAS INT,
    KODE CHAR(2),
    NIP INT
);

-- Table MataKuliah
CREATE TABLE MATAKULIAH (
    KODE CHAR(2),
    MATAKULIAH VARCHAR(30),
    SKS INT
);

-- table Dosen 
CREATE TABLE DOSEN (
    NIP INT,
    NAMA VARCHAR(30)
);

# isi Table 

-- isi table KRS 
INSERT INTO KRS (NIM, IDKELAS, NILAI) VALUES
(1, 1, 8),
(2, 2, 7),
(3, 1, NULL),
(4, 2, 6),
(5, 3, 5),
(6, 1, 1);

-- isi table Mahasiswa
INSERT INTO MAHASISWA (THANG, NIM, NAMA, ALAMAT, TGL) VALUES
(2022, 1, 'Indah', 'Bandung', '2001-06-08'),
(2021, 2, 'Dafa', 'Bali', '2001-03-27'),
(2022, 3, 'Ratih', NULL, '2002-05-10'),
(2020, 4, 'Rizki', 'Yogyakarta', NULL),
(2021, 5, 'Deva', 'Surabaya', '2003-04-18'),
(2022, 6, 'Husna', 'Purwokerto', '2001-01-09');

-- isi table Kelas
INSERT INTO KELAS (IDKELAS, KODE, NIP) VALUES
(1, 'B1', 3),
(2, 'C1', 5),
(3, 'B1', 4),
(4, 'D1', 2),
(5, 'E1', 1),
(6, 'C2', 6);

-- isi table matakuliah 
INSERT INTO MATAKULIAH (KODE, MATAKULIAH, SKS) VALUES
('B1', 'Basis Data', 2),
('C1', 'Alpro', 3),
('A1', 'HEI', 2),
('D1', 'RPL', NULL),
('E1', 'Matdis', 3),
('C2', 'OOP', 4);

-- isi table Dosen
INSERT INTO DOSEN (NIP, NAMA) VALUES
(3, 'Desi'),
(5, 'Jajat'),
(4, 'Rudi'),
(2, 'Alif'),
(1, 'Sabar'),
(6, 'Fauzan');


# Latihan DML 

-- soal 1 
UPDATE MAHASISWA
SET THANG = 2024;

-- soal 2
UPDATE MAHASISWA
SET ALAMAT = 'Bandung';

-- soal 3
UPDATE MATAKULIAH
SET SKS = 3
WHERE KODE LIKE 'B%';

-- soal 4
UPDATE KRS
SET Nilai = 2
WHERE NIM IN (1, 3, 4) AND idKelas = 1;

-- soal 5
UPDATE MAHASISWA
SET ThAng = 2023, TGL = NULL
WHERE Nama LIKE '%I%' AND Alamat LIKE '%G';

-- soal 6
DELETE FROM Matakuliah
WHERE SKS IS NULL;

-- soal 7 
DELETE FROM Matakuliah
WHERE SKS = 2;

-- soal 8 
DELETE FROM Kelas
WHERE Kode = 'B1' OR NIP = 4;

-- soal 9 
DELETE FROM KRS
WHERE NIM <> 1 AND Nilai > 1;

-- soal 10 
DELETE FROM Mahasiswa
WHERE Alamat IS NULL AND Tgl IS NULL;

-- soal 11
INSERT INTO MAHASISWA (THANG, NIM, NAMA, ALAMAT, TGL) VALUES
(2025, 7, 'Galih', null, null),
(null, 8, 'Ratna', 'Tasikmalaya', null);

-- soal 12 
INSERT INTO KELAS (IDKELAS, KODE, NIP) VALUES
(7, 'B6', 5);

-- soal 13
select * from matakuliah;

-- soal 14 
SELECT * FROM matakuliah
WHERE sks = 3
ORDER BY kode;

-- soal 15
SELECT Nama FROM Dosen
WHERE Nama LIKE '%T';

-- soal 16 
SELECT * FROM Kelas
WHERE Kode > 'C';

-- soal 17 
SELECT * FROM Kelas 
WHERE idkelas > 2 AND NIP < 4
ORDER BY NIP DESC, idkelas ASC;

-- soal 18 
SELECT NIM, Nilai FROM KRS
WHERE Nilai IS NOT NULL AND IdKelas = 1
ORDER BY NIM;

-- soal 19 
SELECT ThAng, COUNT(*) AS Jumlah_Mahasiswa FROM Mahasiswa
GROUP BY ThAng
ORDER BY ThAng DESC;

-- soal 20 
SELECT NIM, IdKelas, Nilai, COUNT(Nilai) AS Jumlah_Nilai FROM KRS
WHERE Nilai IS NOT NULL AND NIM > 1
GROUP BY NIM, IdKelas, Nilai;

-- soal 21
SELECT NIM, AVG(Nilai)  FROM KRS
GROUP BY NIM
HAVING SUM(Nilai) > 3;

-- soal 22 
SELECT MAX(NIP) FROM Dosen
WHERE Nama LIKE '%i%';

select * from krs ;