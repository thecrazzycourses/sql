# SQL

mysql -u rahul -p
$Dec2017

source sqlfile.sql

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

Database is a bunch of Tables

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
SELECT MIN(released_year) FROM books; // 1945
SELECT MAX(released_year) FROM books; // 2016

This won't work because first MIN(released_year) will evaluate which return 1 row then title will evaluate which return first row title.
SELECT MIN(released_year),title FROM books; // 1945

Solution
SELECT released_year,title FROM books WHERE released_year=(SELECT MIN(released_year) FROM books);
SELECT released_year,title FROM books WHERE released_year=(SELECT MAX(released_year) FROM books);

SELECT released_year,title FROM books ORDER BY released_year ASC LIMIT 1;
SELECT released_year,title FROM books ORDER BY released_year DESC LIMIT 1;

GROUP BY with MIN & MAX:
SELECT author_fname,author_lname, MIN(released_year) FROM books GROUP BY author_lname,author_fname;
SELECT author_fname,author_lname, MAX(released_year) FROM books GROUP BY author_lname,author_fname;

# SUM
SELECT author_fname,author_lname, SUM(pages) FROM books GROUP BY author_lname, author_fname;

# AVG
SELECT author_fname,author_lname,released_year, AVG(pages) FROM books GROUP BY author_lname, author_fname;

# DATA TYPES
CHAR(1)
VARCHAR(20)
INT
DECIMAL(5,2) // Max 5 digit and 2 of them after decimal ex 999.99
FLOAT // upto 7 digit precision
DOUBLE // // upto 15 digit precision
DATE // YYYY-MM-DD
TIME // HH:MM:SS
DATETIME // YYYY-MM-DD HH:MM:SS, Range 1000-01-01 9999-12-31
TIMESTAMP // Range 1970-01-01 2038-01-19

SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();

SELECT DATEDIFF('2020-11-20', '2020-10-19');
SELECT DATEDIFF(NOW(), '1989-05-22');

SELECT DAY('2020-11-24');
SELECT DAYNAME('2020-11-24');
SELECT DAYOFWEEK('2020-11-24');
SELECT DAYOFMONTH('2020-11-24');
SELECT DAYOFYEAR('2020-11-24');

SELECT MONTH(NOW());
SELECT MONTHNAME(NOW());

SELECT YEAR(NOW());
SELECT YEARWEEK(NOW());

SELECT HOUR(Now());
SELECT MINUTE(NOW());
SELECT SECOND(NOW());

SELECT DATE_FORMAT(NOW(), '%D %W %M %Y %H:%i:%s %p');

# Created On & Updated On
CREATE TABLE comments(content VARCHAR(50), created_on TIMESTAMP DEFAULT NOW());
INSERT INTO comments(content) VALUES ('My first content');
INSERT INTO comments(content) VALUES ('My second content');
SELECT * FROM comments;


CREATE TABLE comments2(content VARCHAR(50), created_on TIMESTAMP DEFAULT NOW(), updated_on TIMESTAMP DEFAULT NOW() ON UPDATE NOW());
INSERT INTO comments2(content) VALUES ('My first content');
INSERT INTO comments2(content) VALUES ('My second content');
SELECT * FROM comments2;
UPDATE comments2 SET content='My First Update...' where content='My first content';
SELECT * FROM comments2;

# Logical Operator
SELECT title, released_year FROM books WHERE released_year != 2003;
SELECT title, released_year FROM books WHERE released_year = 2003;
SELECT title, released_year FROM books WHERE released_year BETWEEN 2001 AND 2003;
SELECT title, released_year FROM books WHERE released_year NOT BETWEEN 2001 AND 2003;
SELECT title, released_year FROM books WHERE title LIKE 'W%';
SELECT title, released_year FROM books WHERE title NOT LIKE 'W%';
SELECT title, released_year FROM books WHERE released_year < 2004;
SELECT title, released_year FROM books WHERE released_year > 2004;
SELECT title, released_year FROM books WHERE released_year <= 2003 ORDER BY released_year;
SELECT 99 > 0; // 1 True
SELECT 99 > 543; // 0 False
SELECT * FROM books WHERE author_lname = 'Eggers' AND released_year > 2010;
SELECT * FROM books WHERE author_lname = 'Eggers' OR released_year > 2010;
SELECT title, author_lname FROM books WHERE author_lname IN ('Eggers', 'Lahiri', 'Smith');
SELECT title, released_year FROM books WHERE released_year NOT IN ('2003', '2004');
SELECT title, released_year, 
       CASE 
           WHEN released_year >=2000 THEN 'Modern Lit' 
           WHEN released_year >=2004 THEN 'More Modern Lit' 
           ELSE '20th Century Lit' 
       END AS GENRE 
FROM books;

# Relationship

# One : Many : use customer_order.sql for table creation
Customers : Orders ( 1 Customer can have many orders)

SELECT * FROM orders WHERE customer_id = (SELECT id FROM customers WHERE last_name = 'George');

-- IMPLICIT INNER JOIN
SELECT * FROM customers, orders WHERE customers.id = orders.customer_id;
SELECT first_name, last_name, order_date, amount FROM customers, orders WHERE customers.id = orders.customer_id;
SELECT * FROM customers, orders WHERE customers.id = orders.customer_id AND customers.last_name = 'Davis';

-- EXPLICIT INNER JOIN
SELECT first_name, last_name, order_date, amount FROM customers JOIN orders ON customers.id = orders.customer_id;

-- LEFT JOIN
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SELECT customer_id,first_name, last_name, order_date, AVG(amount) FROM customers JOIN orders ON customers.id = orders.customer_id GROUP BY orders.customer_id;
SELECT first_name, last_name, IFNULL(SUM(amount), 0) AS total_spent FROM customers LEFT JOIN orders ON customers.id = orders.customer_id GROUP BY customers.id ORDER BY total_spent;

-- RIGHT JOIN
SELECT first_name, last_name, IFNULL(SUM(amount), 0) AS total_spent FROM customers RIGHT JOIN orders ON customers.id = orders.customer_id GROUP BY customers.id ORDER BY total_spent;

# Many To Many : use tv_review_app.sql for table creation
3 Tables 

# Instagram DB
CREATE TABLE users (
id INTEGER AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(255) UNIQUE NOT NULL,
created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photos (
id INTEGER AUTO_INCREMENT PRIMARY KEY,
image_url VARCHAR(255) NOT NULL,
user_id INTEGER NOT NULL,
created_at TIMESTAMP DEFAULT NOW(),
FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE comments (
id INTEGER AUTO_INCREMENT PRIMARY KEY,
comment_text VARCHAR(255) NOT NULL,
photo_id INTEGER NOT NULL,
user_id INTEGER NOT NULL,
created_at TIMESTAMP DEFAULT NOW(),
FOREIGN KEY(photo_id) REFERENCES photos(id),
FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE likes (
user_id INTEGER NOT NULL,
photo_id INTEGER NOT NULL,
created_at TIMESTAMP DEFAULT NOW(),
FOREIGN KEY(user_id) REFERENCES users(id),
FOREIGN KEY(photo_id) REFERENCES photos(id),
PRIMARY KEY(user_id, photo_id)
);

CREATE TABLE follows (
follower_id INTEGER NOT NULL,
followee_id INTEGER NOT NULL,
created_at TIMESTAMP DEFAULT NOW(),
FOREIGN KEY(follower_id) REFERENCES users(id),
FOREIGN KEY(followee_id) REFERENCES users(id),
PRIMARY KEY(follower_id, followee_id)
);

CREATE TABLE tags (
id INTEGER AUTO_INCREMENT PRIMARY KEY,
tag_name VARCHAR(255) UNIQUE,
created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tags (
photo_id INTEGER NOT NULL,
tag_id INTEGER NOT NULL,
FOREIGN KEY(photo_id) REFERENCES photos(id),
FOREIGN KEY(tag_id) REFERENCES tags(id),
PRIMARY KEY(photo_id, tag_id)
);

or Use
ig_clone_data.sql

Questions:
1. Find 5 oldest users : 
   SELECT * FROM users ORDER BY created_at limit 5;
2. What day of week do most users register on ?
   SELECT username, DAYNAME(created_at) AS day, COUNT(*) AS total FROM users GROUP BY day ORDER BY total desc LIMIT 2;
3. Find the users who never posted a photo ?
   SELECT username FROM users LEFT JOIN photos p on users.id = p.user_id WHERE p.id IS NULL ;
4. Who get the most likes ?
   SELECT
   username,
   photos.id,
   photos.image_url,
   COUNT(*) AS total
   FROM photos
   INNER JOIN likes
   ON likes.photo_id = photos.id
   INNER JOIN users
   ON photos.user_id = users.id
   GROUP BY photos.id
   ORDER BY total DESC
   LIMIT 1;
5. How many times does avg user photos
   SELECT (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) as avg_photos;
6. What are top 5 most used hashtag
   SELECT tags.tag_name,
   Count(*) AS total
   FROM photo_tags
   JOIN tags
   ON photo_tags.tag_id = tags.id
   GROUP BY tags.id
   ORDER BY total DESC
   LIMIT 5; 
7. Find the users who have liked on there every single photo
   SELECT username,
   Count(*) AS num_likes
   FROM   users
   INNER JOIN likes
   ON users.id = likes.user_id
   GROUP  BY likes.user_id
   HAVING num_likes = (SELECT Count(*)
   FROM   photos);


## Database Triggers

Dont use trigger, do this logic in middleware like spring boot and don't let user even reach to db for these type of logic 

trigger_time: Before & After
trigger_event: Insert, Update & Delete
table_name : users, photos, likes ....


CREATE DATABASE trigger_db;
USE trigger_db;
CREATE TABLE users (
username VARCHAR(50),
age INT
);
INSERT INTO users (username, age) VALUES ('rahul', 28);
INSERT INTO users (username, age) VALUES ('ravi', 16);
SELECT * FROM users;

Need to set this using root user : SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER $$

CREATE TRIGGER must_be_adult
BEFORE INSERT ON users FOR EACH ROW
BEGIN
IF NEW.age < 18
THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Must be today Date';
END IF;
END;

$$

DELIMITER ;

Note : DELIMITER $$ : This will change the DELIMITER to $$ instead if ;
for example : select * from users $$
and then again when we run DELIMITER ; will change this to
select * from users ;
   
