sql DDL di CLI
-- copynya satu satu masukin ke cmd
  
-- create database 

  create database mahasiswa;

-- use database 

  use mahasiswa;

-- bikin table 

  create table data_siswa (nim int(11),nama char(50),alamat char(30));

-- bikin row 

  INSERT INTO `data_siswa`(`nim`, `nama`, `alamat`) VALUES (1234,'japran','bekasi')

-- alter table add column 

  ALTER TABLE mahasiswa ADD jurusan varchar(50);

-- alter table multi column

  alter table data_siswa add (fakultas varchar(50), jurusan2 varchar(50));

-- alter table modify column 

  alter table data_siswa modify nama varchar(60);

-- create index 

  CREATE UNIQUE INDEX unik ON data_siswa (alamat);

-- #not null with default 

Nilai default-nya :

•Nol untuk tipe field NUMERIC
•Blank untuk tipe field CHARACTER
•CURRENT DATE untuk tipe field DATE
•CURRENT TIME untuk tipe field TIME
