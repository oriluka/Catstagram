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
    ownerID VARCHAR,
    CONSTRAINT fk_user
    FOREIGN KEY (ownerID) REFERENCES users(userID),
    catName CHAR(16),
    likes CHAR(50),
    dislikes CHAR (50)
    age INT
)

CREATE TABLE IF NOT EXISTS photos (
    photoID VARCHAR(20) PRIMARY KEY,
    link VARCHAR,
    catUID,
    CONSTRAINT fk_catID
    FOREIGN KEY (catUID) REFERENCES cats(catID)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE IF NOT EXISTS favorites (
    userID,
    constraint fk_likeuser
    FOREIGN KEY (userID) REFERENCES users(userID),
    photoID,
    constraint fk_photoid
    FOREIGN KEY (photoID) REFERENCES photos(photoID),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)