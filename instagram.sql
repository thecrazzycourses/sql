DROP DATABASE IF EXISTS instagram;
CREATE DATABASE instagram;
USE instagram;

-- Users
DROP TABLE IF EXISTS users;
CREATE TABLE users
(
    id         INTEGER PRIMARY KEY AUTO_INCREMENT,
    username   VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO users (username)
VALUES ('BlueTheCat'),
       ('CharlieBrown'),
       ('RahulChoudhary');

-- Photos
DROP TABLE IF EXISTS photos;
CREATE TABLE photos
(
    id         INTEGER PRIMARY KEY AUTO_INCREMENT,
    image_url  VARCHAR(255) NOT NULL,
    user_id    INTEGER      NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users (id)
);
INSERT INTO photos (image_url, user_id)
VALUES ('/sasdd', 1),
       ('/egqe', 2),
       ('/ejjhew', 2);

-- Comments
DROP TABLE IF EXISTS comments;
CREATE TABLE comments
(
    id           INTEGER PRIMARY KEY AUTO_INCREMENT,
    comment_text VARCHAR(255) NOT NULL,
    user_id      INTEGER      NOT NULL,
    photo_id     INTEGER      NOT NULL,
    created_at   TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (photo_id) REFERENCES photos (id)
);
INSERT INTO comments (comment_text, user_id, photo_id)
VALUES ('Meow!', 1, 2),
       ('Amazing Shot', 3, 2),
       ('I love This', 2, 1);

-- Likes
DROP TABLE IF EXISTS likes;
CREATE TABLE likes
(
    user_id    INTEGER NOT NULL,
    photo_id   INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (photo_id) REFERENCES photos (id),
    PRIMARY KEY (user_id, photo_id)
);
INSERT INTO likes (user_id, photo_id)
VALUES (1, 1),
       (2, 1),
       (1, 2),
       (1, 3),
       (3, 3);

-- Follows
DROP TABLE IF EXISTS follows;
CREATE TABLE follows
(
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at  TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (follower_id) REFERENCES users (id),
    FOREIGN KEY (followee_id) REFERENCES users (id),
    PRIMARY KEY (follower_id, followee_id)
);
INSERT INTO follows (follower_id, followee_id)
VALUES (1, 2),
       (1, 3),
       (3, 1),
       (2, 3);


-- Tags
DROP TABLE IF EXISTS tags;
CREATE TABLE tags
(
    id         INTEGER PRIMARY KEY AUTO_INCREMENT,
    tag_name   VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);
INSERT INTO tags (tag_name)
VALUES ('adorable'),
       ('cute'),
       ('sunrise');


-- Photo_Tags
DROP TABLE IF EXISTS photo_tags;
CREATE TABLE photo_tags
(
    photo_id   INTEGER NOT NULL,
    tag_id     INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (photo_id) REFERENCES photos (id),
    FOREIGN KEY (tag_id) REFERENCES tags (id),
    PRIMARY KEY (photo_id, tag_id)
);
INSERT INTO photo_tags (photo_id, tag_id)
VALUES (1, 1),
       (1, 2),
       (2, 3),
       (3, 2);


