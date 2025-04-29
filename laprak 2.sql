
CREATE TABLE user (
    id_user INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(20) NOT NULL,
    fullname VARCHAR(100) NOT NULL,
    tgl_lahir DATE NOT NULL,
    jenis_kelamin ENUM('L', 'P') NOT NULL
);

CREATE TABLE admin (
    id_admin INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(20) NOT NULL,
    fullname VARCHAR(100) NOT NULL,
    jenis_kelamin ENUM('L', 'P') NOT NULL
);

CREATE TABLE kategori (
    id_kategori INT PRIMARY KEY AUTO_INCREMENT,
    nama_kategori VARCHAR(100) NOT NULL
);

CREATE TABLE penulis (
    id_penulis INT PRIMARY KEY AUTO_INCREMENT,
    nama_penulis VARCHAR(100) NOT NULL,
    tgl_lahir DATE NOT NULL,
    email VARCHAR(100) NULL
);

CREATE TABLE penerbit (
    id_penerbit INT PRIMARY KEY AUTO_INCREMENT,
    nama_penerbit VARCHAR(100) NOT NULL,
    alamat VARCHAR(255) NULL,
    telp VARCHAR(13) NULL
);

CREATE TABLE rak (
    id_rak INT PRIMARY KEY AUTO_INCREMENT,
    lokasi ENUM('L1', 'L2', 'L3') NOT NULL,
    nama_rak VARCHAR(100) NOT NULL
);

CREATE TABLE buku (
    id_buku INT PRIMARY KEY AUTO_INCREMENT,
    judul VARCHAR(100) NOT NULL,
    stok INT NOT NULL,
    tahun_terbit YEAR NOT NULL,
    id_penulis INT NOT NULL,
    id_penerbit INT NOT NULL,
    id_kategori INT NOT NULL,
    id_rak INT NOT NULL,
    FOREIGN KEY (id_penulis) REFERENCES penulis(id_penulis),
    FOREIGN KEY (id_penerbit) REFERENCES penerbit(id_penerbit),
    FOREIGN KEY (id_kategori) REFERENCES kategori(id_kategori),
    FOREIGN KEY (id_rak) REFERENCES rak(id_rak)
);


CREATE TABLE detail_buku (
    id_buku INT PRIMARY KEY,
    sinopsis VARCHAR(450) NULL,
    jum_hal INT NOT NULL,
    FOREIGN KEY (id_buku) REFERENCES buku(id_buku)
);

CREATE TABLE peminjaman (
    id_peminjaman INT PRIMARY KEY AUTO_INCREMENT,
    wkt_peminjaman DATETIME NOT NULL,
    wkt_pengembalian DATETIME NULL,
    kondisi ENUM('baik', 'buruk') NOT NULL,
    denda INT NOT NULL,
    id_buku INT,
    id_user INT,
    id_admin INT,
    FOREIGN KEY (id_buku) REFERENCES buku(id_buku),
    FOREIGN KEY (id_user) REFERENCES user(id_user),
    FOREIGN KEY (id_admin) REFERENCES admin(id_admin)
);

INSERT INTO admin (username, fullname, jenis_kelamin) VALUES
    ('admin1', 'Budi Santoso', 'L'),
    ('admin2', 'Rina Wijaya', 'P'),
    ('admin3', 'Ahmad Faisal', 'L'),
    ('admin4', 'Sri Lestari', 'P'),
    ('admin5', 'Andi Prasetyo', 'L'),
    ('admin6', 'Dewi Ayu', 'P'),
    ('admin7', 'Fajar Nugroho', 'L'),
    ('admin8', 'Siti Nurhaliza', 'P'),
    ('admin9', 'Dedi Setiawan', 'L'),
    ('admin10', 'Maya Puspita', 'P');

INSERT INTO kategori (nama_kategori) VALUES
    ('Fiksi'),
    ('Non-Fiksi'),
    ('Ilmiah'),
    ('Biografi'),
    ('Fantasi'),
    ('Sejarah'),
    ('Teknologi'),
    ('Kesehatan'),
    ('Keluarga'),
    ('Seni');

INSERT INTO penerbit (nama_penerbit, alamat, telp) VALUES
    ('Gramedia', 'J1. Palmerah Barat 29', '02153650110'),
    ('Erlangga', 'J1. H. Baping Raya 100', '0214756000'),
    ('GagasMedia', 'J1. Haji Nawi Raya No.5', '0217278 2123'),
    ('Mizan', 'J1. Cinambo No. 135', '0227808037'),
    ('Elex Media Komputindo', 'J1. Raya Kebayoran Lama 121', '0217299050'),
    ('Bentang Pustaka', 'J1. Pandega Padma No. 19', '0274583030'),
    ('Visi Media', 'J1. Kaliurang Km. 6,5', '0274516577'),
    ('Zahira Publishing', 'J1. Margonda Raya No. 358', '0217873290'),
    ('Pastel Books', 'J1. Kemang Timur No. 67', '0217193010'),
    ('Andi Publisher', 'Jl. Beo No. 38', '0274548561');

INSERT INTO penulis (nama_penulis, tgl_lahir, email) VALUES
    ('Pramoedya Ananta Toer', '1925-02-06', 'pramoedya@gmail.com'),
    ('Andrea Hirata', '1967-10-24', 'andrea@gmail.com'),
    ('Tere Liye', '1979-05-21', 'tere@gmail.com'),
    ('Dewi Lestari', '1976-01-20', 'dewi@gmail.com'),
    ('Habiburrahman El Shirazy', '1976-09-30', 'habiburrahman@gmail.com'),
    ('Ahmad Fuadi', '1972-12-30', 'ahmad@gmail.com'),
    ('Asma Nadia', '1972-03-26', 'asma@gmail.com'),
    ('Ayunda Risyma', '1985-04-15', 'ayunda@gmail.com'),
    ('Ayu Utami', '1968-11-21', 'ayu@gmail.com'),
    ('Mira W', '1950-09-13', 'mira@gmail.com');

INSERT INTO rak (nama_rak, lokasi) VALUES
    ('Rak Satu', 'L1'),
    ('Rak Dua', 'L1'),
    ('Rak Tiga', 'L1'),
    ('Rak Empat', 'L1'),
    ('Rak Lima', 'L2'),
    ('Rak Enam', 'L2'),
    ('Rak Tujuh', 'L2'),
    ('Rak Delapan', 'L3'),
    ('Rak Sembilan', 'L3'),
    ('Rak Sepuluh', 'L3');

INSERT INTO user (username, fullname, tgl_lahir, jenis_kelamin) VALUES
    ('leon', 'Leonidas', '2004-06-08', 'L'),
    ('dani', 'Dani Ramadhan', '2005-01-08', 'L'),
    ('lili', 'Liliana', '2005-06-08', 'P'),
    ('rama', 'Rahman Oratmangun', '2005-01-22', 'L'),
    ('bambang', 'Bambang Haryanto', '2002-05-01', 'L'),
    ('siti', 'Siti Aisyah', '2001-06-01', 'P'),
    ('yusuf', 'Yusuf Arif', '2012-07-01', 'L'),
    ('rina', 'Rina Suryani', '2007-08-01', 'P'),
    ('agus', 'Agus Wijaya', '2003-09-01', 'L'),
    ('dewi', 'Dewi Sari', '2004-10-01', 'P');

INSERT INTO buku (judul, stok, tahun_terbit, id_penulis, id_penerbit, id_kategori, id_rak) VALUES
    ('Laskar Pelangi', 15, 2005, 2, 1, 1, 1),
    ('Bumi Manusia', 10, 1980, 1, 2, 5, 2),
    ('Negeri 5 Menara', 20, 2009, 6, 3, 1, 3),
    ('Supernova', 12, 2001, 4, 4, 6, 4),
    ('Ayat-ayat Cinta', 30, 2004, 5, 5, 1, 5),
    ('Pulang', 8, 2012, 3, 6, 2, 6),
    ('Sang Pemimpi', 14, 2006, 2, 7, 1, 7),
    ('Anak Semua Bangsa', 11, 1981, 1, 8, 5, 8),
    ('Rantau 1 Muara', 18, 2013, 6, 9, 1, 9),
    ('Perahu Kertas', 25, 2009, 4, 10, 4, 10);

INSERT INTO peminjaman (wkt_peminjaman, wkt_pengembalian, kondisi, denda, id_buku, id_user, id_admin) VALUES
    ('2023-01-01 10:00:00', '2023-01-10 10:00:00', 'baik', 0, 1, 1, 1),
    ('2023-02-01 11:00:00', '2023-02-11 11:00:00', 'baik', 0, 2, 2, 2),
    ('2023-03-01 12:00:00', '2023-03-11 12:00:00', 'baik', 0, 3, 3, 3),
    ('2023-04-01 13:00:00', '2023-04-11 13:00:00', 'baik', 0, 4, 4, 4),
    ('2023-05-01 14:00:00', '2023-05-11 14:00:00', 'baik', 0, 5, 5, 5),
    ('2023-06-01 15:00:00', '2023-06-11 15:00:00', 'baik', 0, 6, 6, 6),
    ('2023-07-01 16:00:00', '2023-07-11 16:00:00', 'baik', 0, 7, 7, 7),
    ('2023-08-01 17:00:00', '2023-08-11 17:00:00', 'baik', 0, 8, 8, 8),
    ('2023-09-01 18:00:00', '2023-09-11 18:00:00', 'baik', 0, 9, 9, 9),
    ('2023-10-01 19:00:00', '2023-10-11 19:00:00', 'baik', 0, 10, 10, 10),
    ('2024-01-01 10:00:00', '2024-01-10 10:00:00', 'baik', 0, 1, 1, 2),
    ('2024-02-01 11:00:00', '2024-02-11 11:00:00', 'baik', 0, 2, 2, 3),
    ('2024-03-01 12:00:00', '2024-03-11 12:00:00', 'baik', 0, 3, 3, 4),
    ('2024-04-01 13:00:00', '2024-04-11 13:00:00', 'baik', 0, 4, 4, 5);

INSERT INTO peminjaman (wkt_peminjaman, wkt_pengembalian, kondisi, denda, id_buku, id_user, id_admin) VALUES
    ('2023-01-01 10:00:00', NULL, 'baik', 0, 1, 1, 1);

INSERT INTO detail_buku(id_buku, sinopsis, jum_hal) VALUES
    (1, 'Perjuangan kehidupan seseorang dalam meraih mimpinya', 400),
    (2, 'Berkisah mengenai cinta seorang laki-laki kepada perempuannya', 350),
    (3, 'Perjuangan bersama teman-teman seperjuangan', 385),
    (4, 'Berkisah mengenai ke-empat sahabat yang terjebak di fenomena astronomi', 488),
    (5, 'Kisah cinta kedua insan manusia', 320),
    (6, 'Kembalinya sang dambaan hati', 297),
    (7, 'Berkisah mengenai perjungan meraih mimpi-mimpi', 562),
    (8, 'Perjuangan rakyat demi mendapat keadilan', 645),
    (9, 'Berkisah mengenai perjuangan anak rantauan', 345),
    (10, 'Kisah lika-liku dikala hati jatuh cinta', 400);
    
    
-- no 2
SELECT
    p.id_peminjaman,
    u.fullname AS nama_user,
    b.judul AS judul_buku,
    a.fullname AS nama_admin,
    p.wkt_peminjaman
FROM
    peminjaman p
JOIN
    user u ON p.id_user = u.id_user
JOIN
    buku b ON p.id_buku = b.id_buku
JOIN
    admin a ON p.id_admin = a.id_admin
ORDER BY
    p.wkt_peminjaman DESC;
    
-- no 3
SELECT id_user FROM user WHERE fullname = 'Siti Aisyah';
SELECT id_buku FROM buku WHERE judul = 'Supernova';
SELECT id_admin FROM admin WHERE fullname = 'Budi Santoso';
INSERT INTO peminjaman (wkt_peminjaman, wkt_pengembalian, kondisi, denda, id_buku, id_user, id_admin)
VALUES ('2025-04-29 09:00:00', NULL, 'baik', 0, 4, 6, 1);

SELECT
    b.judul AS judul_buku,
    u.fullname AS nama_peminjam,
    a.fullname AS nama_admin
FROM
    peminjaman p
JOIN
    buku b ON p.id_buku = b.id_buku
JOIN
    user u ON p.id_user = u.id_user
JOIN
    admin a ON p.id_admin = a.id_admin
WHERE
    p.id_buku = 4 AND p.id_user = 6 AND p.wkt_peminjaman = '2025-04-29 09:00:00';
-- no 4
SELECT
    p.id_peminjaman,
    u.username,
    b.judul,
    p.kondisi AS kondisi_sebelum,
    p.wkt_peminjaman,
    p.wkt_pengembalian
FROM
    peminjaman p
JOIN
    user u ON p.id_user = u.id_user
JOIN
    buku b ON p.id_buku = b.id_buku
WHERE
    u.username = 'leon' AND p.wkt_pengembalian IS NULL;

UPDATE peminjaman
SET kondisi = 'rusak'
WHERE id_user = (SELECT id_user FROM user WHERE username = 'leon')
  AND wkt_pengembalian IS NULL;
  
SELECT
    p.id_peminjaman,
    u.username,
    b.judul,
    p.kondisi,
    p.wkt_peminjaman,
    p.wkt_pengembalian
FROM
    peminjaman p
JOIN
    user u ON p.id_user = u.id_user
JOIN
    buku b ON p.id_buku = b.id_buku
WHERE
    u.username = 'leon' AND p.wkt_pengembalian IS NULL;
    
    
-- no 5
SELECT
    p.id_peminjaman,
    u.username,
    b.judul,
    p.wkt_peminjaman,
    p.wkt_pengembalian
FROM
    peminjaman p
JOIN
    user u ON p.id_user = u.id_user
JOIN
    buku b ON p.id_buku = b.id_buku
WHERE
    u.username = 'yusuf' AND b.judul = 'Sang Pemimpi';
    
DELETE FROM peminjaman
WHERE id_user = (SELECT id_user FROM user WHERE username = 'yusuf')
  AND id_buku = (SELECT id_buku FROM buku WHERE judul = 'Sang Pemimpi');
  
SELECT
    p.id_peminjaman,
    u.username,
    b.judul,
    p.wkt_peminjaman,
    p.wkt_pengembalian
FROM
    peminjaman p
JOIN
    user u ON p.id_user = u.id_user
JOIN
    buku b ON p.id_buku = b.id_buku
WHERE
    u.username = 'yusuf' AND b.judul = 'Sang Pemimpi';
    
-- no 6
SELECT
    u.fullname,
    COUNT(p.id_buku) AS total_peminjaman
FROM
    user u
LEFT JOIN
    peminjaman p ON u.id_user = p.id_user
GROUP BY
    u.fullname
ORDER BY
    total_peminjaman DESC;
    
-- no 7
SELECT
    b.judul
FROM
    buku b
LEFT JOIN
    peminjaman p ON b.id_buku = p.id_buku
WHERE
    p.id_peminjaman IS NULL;