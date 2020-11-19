# SQL

# DBMS & DB 
APPLICATION -> DBMS(Create, Read, Update, Delete) -> DATABASE ( Collection of Data ex DB Schema )

# SQL
Language we used to talk to DB for Find, Update.
We write a structured query language for Find, Update.
Its standard used by MySQL, Oracle, PostgresSQL.
There DBMS will be different but use same structured query language.

Note:
We can use Cloud9 instead of installing on Local Machine.

# DATABASE COMMANDS
SHOW DATABASES; // Show All Databases
CREATE DATABASE soap_store; // Create Database, Snake Case
DROP DATABASE soap_store; // Delete Database
USE soap_store; // Select Database for use
SELECT DATABASE(); // Show Current Using Database

Database is bunch of Tables

# CREATE TABLES COMMANDS
CREATE DATABASE cat_app;
USE cat_app;
CREATE TABLE cats (
    name VARCHAR(15),
    age INT
);
SHOW TABLES;
SHOW COLUMNS FROM cats;
DESCRIBE cats; OR DESC cats
DROP TABLE cats;

# INSERT TABLES COMMANDS 
DROP DATABASE cat_app;
CREATE DATABASE cat_app;
USE cat_app;
CREATE TABLE cats (
                      name VARCHAR(15),
                      age INT
);
INSERT INTO cats (name, age) VALUES ('Cat-1', 1);
INSERT INTO cats (name, age) VALUES ('Cat-2', 2);
INSERT INTO cats (name, age) VALUES ('Cat-3', 3),('Cat-4', 4);
SELECT * FROM cats;

Note:
SHOW WARNINGS;
If we pass text for int column then we get warning and data will be 
default to 0.
If we pass to many char for varchar then it will be truncated.

# NULL 
If we create a table with Null Allowed & while inserting data we don't
provide value for that column then we will store NULL in that column.

To prevent NULL insertion, we need to make sure, we don't allow NULL.
DROP DATABASE cat_app;
CREATE DATABASE cat_app;
USE cat_app;
CREATE TABLE cats (
                      name VARCHAR(15) NOT NULL,
                      age INT NOT NULL
);

Now if we try inserting null value then we will going to get :
INSERT INTO cats() value();
Field 'name' doesn't have a default value
Field 'age' doesn't have a default value

Note:
If we don't provide name or age then it will default to '' for text 
and 0 for int

# DEFAULT
DROP DATABASE cat_app;
CREATE DATABASE cat_app;
USE cat_app;
CREATE TABLE cats (
                      name VARCHAR(15) NOT NULL DEFAULT 'unnamed',
                      age INT NOT NULL DEFAULT 0
);
INSERT INTO cats() value();

# PRIMARY KEY
A Unique Identifier
DROP DATABASE cat_app;
CREATE DATABASE cat_app;
USE cat_app;
CREATE TABLE cats (
                      cat_id INT NOT NULL,
                      name VARCHAR(15) NOT NULL DEFAULT 'unnamed',
                      age INT NOT NULL DEFAULT 0,
                      PRIMARY KEY (cat_id)
);
INSERT INTO cats (cat_id,name, age) VALUES (1, 'Cat-1', 1);
INSERT INTO cats (cat_id,name, age) VALUES (2, 'Cat-2', 2);

# AUTO_INCREMENT
DROP DATABASE cat_app;
CREATE DATABASE cat_app;
USE cat_app;
CREATE TABLE cats (
                      cat_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                      name VARCHAR(15) NOT NULL DEFAULT 'unnamed',
                      age INT NOT NULL DEFAULT 0,
);
INSERT INTO cats (name, age) VALUES ('Cat-1', 1);
INSERT INTO cats (name, age) VALUES ('Cat-2', 2);
SELECT * FROM cats;

# READ
DROP DATABASE cat_app;
CREATE DATABASE cat_app;
USE cat_app;
CREATE TABLE cats (
                      cat_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                      name VARCHAR(100),
                      breed VARCHAR(100),
                      age INT 
);
INSERT INTO cats (name, breed, age)
VALUES ('Ringo', 'Tabby' , 4),
       ('Cindy', 'Maine Coon' , 10),
       ('Dumbledore', 'Maine Coon' , 11),
       ('Egg', 'Persian', 12);

SELECT * FROM cats;
SELECT name FROM cats;
SELECT name,age FROM cats;
SELECT * FROM cats WHERE age=4;
SELECT * FROM cats WHERE breed='Maine Coon';
SELECT cat_id AS id FROM cats;

# UPDATE
UPDATE <tablename> SET <what> WHERE <where>
UPDATE cats SET breed='Maine Coon' WHERE name='Cindy';
UPDATE cats SET breed='Maine Coon',age=2 WHERE name='Cindy';

# DELETE
Similar like SELECT
DELETE FROM cats WHERE age=4;

Note:
Don't do this, it will delete all the data from cats table.
DELETE FROM cats;

Note:
RUN a *.sql file : SOURCE file_name.sql
Make sure you are in right directory
If we have directory like dev/cats_app.sql then : SOURCE dev/cats_app.sql
or GO to that directory first & run : SOURCE cats_app.sql

# STRING FUNCTIONS

# CONCAT
SELECT CONCAT(author_lname,',', ' ', author_fname) FROM books; // Lahiri, Jhumpa
SELECT CONCAT(author_lname,',', author_fname) FROM books; // Lahiri,Jhumpa
SELECT CONCAT(author_fname,' ', author_lname) FROM books; // Jhumpa Lahiri

CONCAT WITH SEPARATOR
SELECT CONCAT_WS('-',title,author_fname,author_lname) FROM books; // The Namesake-Jhumpa-Lahiri

# SUBSTRING
SELECT SUBSTRING('HELLO WORLD', 1, 4); // HELL
SELECT SUBSTRING('HELLO WORLD', 1, 5); // HELLO
SELECT SUBSTRING('HELLO WORLD', 7); // WORLD Starting Given Index to End

# SUBSTR Does the same thing
SELECT SUBSTR('HELLO WORLD', 7); // WORLD Starting Given Index to End

SELECT CONCAT(SUBSTR(title, 1,9), '...') AS 'Short Title' FROM books; // The Names...

# REPLACE
SELECT REPLACE('Hello YOUR_NAME', 'YOUR_NAME', 'Rahul Choudhary'); // Hello Rahul Choudhary
SELECT REPLACE('Hello Rahul Choudhary', 'o', 0); // Hell0 Rahul Ch0udhary Its Case Sensitive
SELECT REPLACE('Cheese Bread Butter', ' ', ' and '); // Cheese and Bread and Butter

# REVERSE
SELECT REVERSE('RAHUL'); // LUHAR

# CHAR_LENGTH
SELECT CHAR_LENGTH('RAHUL'); // 5

# UPPER AND LOWER
SELECT UPPER('rahul'); // RAHUL
SELECT LOWER('RAHUL'); // rahul

# DISTINCT
SELECT DISTINCT author_lname FROM books;
SELECT DISTINCT author_lname, author_fname FROM books;

# ORDER BY
SELECT author_lname FROM books ORDER BY author_lname; // By Default its ASC
SELECT author_lname FROM books ORDER BY author_lname ASC;
SELECT author_lname FROM books ORDER BY author_lname DESC;
SELECT title,author_fname,author_lname FROM books ORDER BY 2; // Order By author_fname
SELECT author_fname,author_lname FROM books ORDER BY author_lname,author_fname; // First sort by author_lname then author_fname

# LIMIT
SELECT title FROM books LIMIT 3; // Will only show first 3
SELECT title,released_year FROM books ORDER BY released_year LIMIT 5;
SELECT title,released_year FROM books ORDER BY released_year LIMIT 1,9; // This will give 9 row
SELECT title,released_year FROM books ORDER BY released_year LIMIT 10,19; // This will give 9 row
SELECT title,released_year FROM books ORDER BY released_year LIMIT 20,29; // This will give 9 row

# LIKE
SELECT * FROM books WHERE author_fname LIKE '%da%'; // anything da anything
SELECT * FROM books WHERE author_fname LIKE 'da%'; // Start with da anything
SELECT * FROM books WHERE title LIKE '%the%';

SELECT * FROM books WHERE stock_quantity LIKE '__'; // 2 digit
SELECT * FROM books WHERE stock_quantity LIKE '___'; // 3 digit

SELECT * FROM books WHERE title LIKE '%\%%'; // if we have % in search, we need to escape : Consider 10% the Lobster
SELECT * FROM books WHERE title LIKE '%\_%'; // fake_book

# Aggregate Functions

# COUNT
SELECT COUNT(*) FROM books;
SELECT COUNT(DISTINCT author_fname) FROM books; // unique author
SELECT COUNT(DISTINCT author_fname, author_lname) FROM books;

SELECT title FROM books WHERE title LIKE '%the%';
SELECT COUNT(*) FROM books WHERE title LIKE '%the%';

# GROUP BY
RUN this if you see issue sql error 1055 sqlstate 42000 : SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
Group By will create a single row with the related items for that column

SELECT title, author_lname FROM books;
SELECT author_fname,author_lname, COUNT(*) FROM books GROUP BY author_lname;

# MIN & MAX

