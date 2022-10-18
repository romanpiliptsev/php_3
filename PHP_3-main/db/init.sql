CREATE DATABASE IF NOT EXISTS appDB;
CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'password';
GRANT SELECT, UPDATE, INSERT ON appDB.* TO 'user'@'%';
FLUSH PRIVILEGES;

USE appDB;
CREATE TABLE IF NOT EXISTS users (
  ID INT(11) NOT NULL AUTO_INCREMENT,
  login VARCHAR(20) NOT NULL,
  password VARCHAR(40) NOT NULL,
  PRIMARY KEY (ID)
);
CREATE TABLE IF NOT EXISTS products (
  ID INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(20) NOT NULL,
  price INTEGER,
  PRIMARY KEY (ID)
);

INSERT INTO users (login, password)
SELECT * FROM (SELECT 'roman', '{SHA}QL0AFWMIX8NRZTKeof9cXsvbvu8=') AS tmp
WHERE NOT EXISTS (
    SELECT login FROM users WHERE login='roman' AND password='123'
) LIMIT 1;

INSERT INTO products (name, price)
SELECT * FROM (SELECT 'Adidas Ball Brazuka', 3999) AS tmp
WHERE NOT EXISTS (
    SELECT name FROM products WHERE name = 'Adidas Ball Brazuka' AND price = 3999
) LIMIT 1;

INSERT INTO products (name, price)
SELECT * FROM (SELECT 'Football socks', 499) AS tmp
WHERE NOT EXISTS (
    SELECT name FROM products WHERE name = 'Nike Football socks' AND price = 499
) LIMIT 1;

INSERT INTO products (name, price)
SELECT * FROM (SELECT 'Football T-shirt', 4999) AS tmp
WHERE NOT EXISTS (
    SELECT name FROM products WHERE name = 'Puma Football T-shirt' AND price = 4999
) LIMIT 1;

INSERT INTO products (name, price)
SELECT * FROM (SELECT 'Football boots', 4299) AS tmp
WHERE NOT EXISTS (
    SELECT name FROM products WHERE name = 'Nike Football boots' AND price = 4299
) LIMIT 1;

INSERT INTO products (name, price)
SELECT * FROM (SELECT 'Football shorts', 2799) AS tmp
WHERE NOT EXISTS (
    SELECT name FROM products WHERE name = 'Football shorts' AND price = 2799
) LIMIT 1;