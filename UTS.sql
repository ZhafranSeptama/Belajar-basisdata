-- create database
Create database data_rumahsakit_bhakti ;

-- Create table 

-- table pasien 063
create	table pasien063 (
    id_pasien varchar(10) primary key,
    Nama_Pasien varchar(100)    
);

-- table Kategori layanan 063
create	table Kategori_Layanan063 (
    id_Kategori varchar(10) primary key,
    Nama_Kategori varchar(100)    
);

-- table Unit 063
create	table Unit063 (
    id_Unit varchar(10) primary key,
    Nama_Unit varchar(100)    
);

-- table layanan 063
create	table Layanan063 (
    id_Layanan varchar(10) primary key,
    Nama_layanan varchar(100),
    biaya int,
    id_kategori varchar(10),
    id_unit varchar(10),
    foreign key (id_kategori) references Kategori_Layanan063(id_Kategori),
    foreign key (id_unit) references Unit063(id_Unit)
);

-- table transaksi 063
create	table transaksi063 (
    id_transaksi varchar(10) primary key,
    id_Pasien varchar(10),
    Tanggal date,
    jam time,
    foreign key (id_Pasien) references pasien063(id_pasien)
);

-- item transaksi 063
create	table Item_transaksi063 (
    id_item int auto_increment primary key,
    id_transaksi varchar(10),
    id_Layanan varchar(10),
    Jumlah int,
    foreign key (id_transaksi) references transaksi063(id_transaksi),
    foreign key (id_Layanan) references Layanan063(id_Layanan)
);

-- insert table 
INSERT INTO Kategori_Layanan063 VALUES
('K01', 'Obat'),
('K02', 'Rawat Inap'),
('K03', 'Tindakan Medis');

INSERT INTO Unit063  VALUES
('U01', 'Apotek'),
('U02', 'Rawat Inap'),
('U03', 'Bedah');

INSERT INTO Layanan063  VALUES
('L01', 'Obat Paracetamol', 20000, 'K01', 'U01'),
('L02', 'Kamar Rawat Inap', 140000, 'K02', 'U02'),
('L04', 'Biaya Tindakan Medis', 100000, 'K03', 'U03');

INSERT INTO pasien063  VALUES
('P01', 'Dani'),
('P02', 'Nindi');

INSERT INTO transaksi063  VALUES
('1111', 'P01', '2024-03-10', '19:11:30'),
('1112', 'P02', '2024-03-10', '20:12:10');

INSERT INTO Item_transaksi063  VALUES
('1111', 'L01', 2), 
('1111', 'L02', 1), 
('1112', 'L02', 2), 
('1112', 'L04', 1);


-- melihat hasil data 
Select * From pasien063;
Select * From transaksi063;
Select * From Item_transaksi063;
Select * From Layanan063;
Select * From Unit063;
Select * From Kategori_Layanan063;
