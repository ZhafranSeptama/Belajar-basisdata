-- buat database 
create database Zhafran_102042400063 ;

-- buat table 

-- Tabel positions
CREATE TABLE positions (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    salary DECIMAL(10, 2)
);
select * from employee;

-- Tabel offices
CREATE TABLE offices (
    id INT PRIMARY KEY,
    province VARCHAR(255),
    city VARCHAR(255),
    address TEXT,
    phone VARCHAR(20)
);

-- Tabel employee
CREATE TABLE employee (
    id INT PRIMARY KEY,
    position_id INT,
    office_id INT,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255),
    FOREIGN KEY (position_id) REFERENCES positions(id),
    FOREIGN KEY (office_id) REFERENCES offices(id)
);

# isi table 
-- table position
INSERT INTO positions (id, name, salary) VALUES
(555, 'IT Consultant', 800),
(556, 'System Analyst', 900),
(557, 'Data Engineer', 1200),
(558, 'Data Analyst', 1500),
(559, 'Software Engineer', 1000);
-- Table offices
INSERT INTO offices (id, province, city, address, phone) VALUES
(775, 'Jawa Barat', 'Bandung', 'Jl. Buah batu', '082100876511'),
(776, 'Sumatera Utara', 'Medan', 'Jl. Karya', '082188889901'),
(777, 'Kalimantan Selatan', 'Banjarmasin', 'Jl. Ahmad Yani', '081278999034'),
(778, 'Sulawesi Tengah', 'Palu', 'Jl. Gatot Subroto', '085710192922'),
(779, 'Papua', 'Jayapura', 'Jl. Soekarno Hatta', '087827272655');

-- Table employee
INSERT INTO employee (id, position_id, office_id, name, email, password) VALUES
(063, 555, 775, 'Zhafran', 'zhafran@gmail.com', 'japranbebas'),
(996, 556, 776, 'Justin', 'justin@gmail.com', 'bukanjustinbieber'),
(997, 557, 777, 'Barbara', 'barbara@gmail.com', 'barbarahunt'),
(998, 558, 778, 'Angela', 'angela@gmail.com', 'angelajola'),
(999, 559, 779, 'Gundala', 'gundala@gmail.com', 'gundalagundah'),
(1000, 555, 775, 'Martin', 'martin88@gmail.com', 'martiness88'),
(1001, 556, 776, 'Joseph', 'joseph0@gmail.com', 'josephess0'),
(1002, 557, 777, 'Gabriel', 'gabygabriel@gmail.com', 'gabrielessbriel'),
(1003, 558, 778, 'Jack', 'jackychen@gmail.com', 'jackesshen'),
(1004, 559, 779, 'Isabel', 'isabelaaa@gmail.com', 'isabelessaaa');

-- soal no 1
select name from employee 
where office_id = (select office_id from employee where name ='Barbara');

-- soal 2 
SELECT name
FROM employee
WHERE position_id NOT IN (SELECT id FROM positions WHERE salary = 
(SELECT salary FROM positions WHERE id = 
(SELECT position_id FROM employee WHERE name = 'Joseph')));

-- soal 3 
SELECT name
FROM positions
WHERE salary > (SELECT MAX(salary) FROM positions
WHERE id IN (SELECT position_id FROM employee WHERE office_id IN (SELECT id FROM offices WHERE province = 'Papua')));

-- soal 4 
SELECT name
FROM employee
WHERE position_id IN (
SELECT id FROM positions WHERE salary <= (SELECT AVG(salary) FROM positions));

-- soal 5
SELECT name
FROM employee
WHERE position_id IN (SELECT id FROM positions
WHERE salary > (SELECT MAX(salary) FROM positions
WHERE id IN ( SELECT position_id FROM employee WHERE office_id = (
SELECT id FROM offices WHERE city = 'Medan'))));

-- soal 6
SELECT employee.name, offices.city
FROM employee, positions, offices
WHERE employee.position_id = positions.id
  AND employee.office_id = offices.id
  AND (positions.name = 'Data Analyst' OR positions.name = 'Software Engineer');

-- soal 7 
SELECT name
FROM employee
WHERE office_id IN (SELECT id FROM offices WHERE city = 'Banjarmasin')
UNION
SELECT name FROM employee WHERE position_id IN ( SELECT id FROM positions WHERE name = 'Data Analyst');


-- soal 8 
SELECT name
FROM employee
WHERE office_id IN ( SELECT id FROM offices WHERE province = 'Papua')
AND position_id IN ( SELECT id FROM positions WHERE name = 'Software Engineer');


-- soal  9
SELECT name
FROM employee
WHERE office_id IN ( SELECT id FROM offices WHERE city = 'Palu')
AND position_id NOT IN ( SELECT id FROM positions WHERE name = 'Data Analyst');

