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
