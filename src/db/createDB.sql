CREATE DATABASE IF NOT EXISTS catgram;
USE catgram;

CREATE TABLE IF NOT EXISTS users (
    userID VARCHAR(20) PRIMARY KEY,
    displayName VARCHAR(16),
    userName VARCHAR(12),
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
    link VARCHAR,
    catUID,
    CONSTRAINT fk_catID
    FOREIGN KEY (catUID) REFERENCES cats(catID)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)