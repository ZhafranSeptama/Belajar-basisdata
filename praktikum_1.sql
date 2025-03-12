
CREATE TABLE user_0063 (
    id_user INT PRIMARY KEY,
    username VARCHAR(20),
    fullname VARCHAR(100),
    tgl_lahir DATE,
    jenis_kelamin ENUM('L', 'P')
);

CREATE TABLE admin_0063 (
    id_admin INT PRIMARY KEY,
    username VARCHAR(20),
    fullname VARCHAR(100),
    jenis_kelamin ENUM('L', 'P')
);

CREATE TABLE kategori_0063 (
    id_kategori INT PRIMARY KEY,
    nama_kategori VARCHAR(100)
);

CREATE TABLE rak_0063 (
    id_rak INT PRIMARY KEY,
    nama_rak VARCHAR(100),
    lokasi ENUM('...')
);

CREATE TABLE penulis_0063 (
    id_penulis INT PRIMARY KEY,
    nama_penulis VARCHAR(100),
    tgl_lahir DATE,
    email VARCHAR(100)
);

CREATE TABLE penerbit_0063 (
    id_penerbit INT PRIMARY KEY,
    nama_penerbit VARCHAR(100),
    alamat VARCHAR(255),
    telp VARCHAR(13)
);

CREATE TABLE buku_0063 (
    id_buku INT PRIMARY KEY,
    judul VARCHAR(100),
    stok INT,
    tahun_terbit YEAR(4),
    id_penulis INT,
    id_penerbit INT,
    id_kategori INT,
    id_rak INT,
    FOREIGN KEY (id_penulis) REFERENCES penulis_0063(id_penulis),
    FOREIGN KEY (id_penerbit) REFERENCES penerbit_0063(id_penerbit),
    FOREIGN KEY (id_kategori) REFERENCES kategori_0063(id_kategori),
    FOREIGN KEY (id_rak) REFERENCES rak_0063(id_rak)
);

CREATE TABLE detail_buku_0063 (
    id_buku INT,
    sinopsis VARCHAR(255),
    jum_hal INT,
    FOREIGN KEY (id_buku) REFERENCES buku_0063(id_buku)
);

CREATE TABLE peminjaman_0063 (
    id_peminjaman INT PRIMARY KEY,
    wkt_peminjaman DATETIME,
    wkt_pengembalian DATETIME,
    kondisi ENUM('...'),
    denda INT,
    id_buku INT,
    id_user INT,
    id_admin INT,
    FOREIGN KEY (id_buku) REFERENCES buku_0063(id_buku),
    FOREIGN KEY (id_user) REFERENCES user_0063(id_user),
    FOREIGN KEY (id_admin) REFERENCES admin_0063(id_admin)
);


-- ngubah nama table admin
rename table admin_0063 to admin_zhafran;

-- ngubah nama rak jadi label_rak
alter table rak_0063 change nama_rak label_rak varchar(110);

-- mengubah tipe data tahun 
alter table buku_0063 change tahun_terbit tahun_terbit INT;

-- hapus forignkey id_admin 
alter table peminjaman_0063 drop foreign key peminjaman_0063_ibfk_3;

-- add column di table penerbit 
alter table penerbit_0063 add column(Email varchar(110), performa float);

-- hapus kolom di table penulis 
alter table penulis_0063 drop column email;

-- drop tabel 
drop table detail_buku_0063;

