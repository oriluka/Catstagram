CREATE DATABASE IF NOT EXISTS catgram;
USE catgram;

CREATE TABLE IF NOT EXISTS users (
    userID VARCHAR(20) PRIMARY KEY,
    displayName VARCHAR(16) NOT NULL,
    userName VARCHAR(12) NOT NULL,
    tag VARCHAR(200),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE IF NOT EXISTS cats (
    catID VARCHAR(20) PRIMARY KEY, 
    creatorID VARCHAR(20) NOT NULL, 
    CONSTRAINT fk_creator
    FOREIGN KEY (creatorID) REFERENCES users(userID),
    ownerID VARCHAR(20),
    CONSTRAINT fk_user
    FOREIGN KEY (ownerID) REFERENCES users(userID),
    catName CHAR(16),
    likes CHAR(50),
    dislikes CHAR (50),
    age INT
)

CREATE TABLE IF NOT EXISTS photos (
    photoID VARCHAR(20) PRIMARY KEY,
    link VARCHAR NOT NULL,
    catUID VARCHAR(20) NOT NULL,
    CONSTRAINT fk_catID
    FOREIGN KEY (catUID) REFERENCES cats(catID),
    posterID NOT NULL,
    CONSTRAINT fk_userID
    FOREIGN KEY (posterID) REFERENCES users(userID),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE IF NOT EXISTS favorites (
    userID NOT NULL,
    constraint fk_likeuser
    FOREIGN KEY (userID) REFERENCES users(userID),
    photoID NOT NULL,
    constraint fk_photoid
    FOREIGN KEY (photoID) REFERENCES photos(photoID),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)