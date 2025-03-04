sql DDL di CLI
  
-- copynya satu satu masukin ke cmd
  
-- CREATE DATABASE 

  create database mahasiswa;

-- USE DATABASE (Khusus CLI)

  use mahasiswa;

-- CREATE TABLE 

  create table data_siswa (nim int(11),nama char(50),alamat char(30));

-- Make Row  

  INSERT INTO `data_siswa`(`nim`, `nama`, `alamat`) VALUES (1234,'japran','bekasi')

-- ALTER TABLE (ADD COLUMN) 

  ALTER TABLE mahasiswa ADD jurusan varchar(50);

-- ALTER TABLE (ADD MULTI COLUMN)

  alter table data_siswa add (fakultas varchar(50), jurusan2 varchar(50));

-- ALTER TABLE (MODIFY COLUMN) 

  alter table data_siswa modify nama varchar(60);

-- CREATE INDEX 

  CREATE UNIQUE INDEX unik ON data_siswa (alamat);

-- ALTER DROP (DROP COLUMN)

  alter table data_siswa drop column jurusan2;

-- ALTER RENAME (CHANGE FIELD)

  alter table data_siswa change fakultas fakultas1 varchar(50);

-- DROP DATABASE

  DROP DATABASE Mahasiswa; (hati-hati nyobanya)

-- DROP TABLE

  DROP TABLE MAHASISWA; (Hati-hati nyobanya)

-- DROP INDEX

  DROP INDEX MHSIDX;

-- DROP VIEW

  DROP VIEW MHSVIEW;

-- #not null with default 

Nilai default-nya :

•Nol untuk tipe field NUMERIC
•Blank untuk tipe field CHARACTER
•CURRENT DATE untuk tipe field DATE
•CURRENT TIME untuk tipe field TIME
