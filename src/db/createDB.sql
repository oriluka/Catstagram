CREATE DATABASE IF NOT EXISTS catgram;
USE catgram;

-- prob dont need userName userID primary key can be that 
CREATE TABLE IF NOT EXISTS users (
    userID VARCHAR(16) PRIMARY KEY,
    displayName VARCHAR(16) NOT NULL,
    displayPic VARCHAR(200),
    tag VARCHAR(200),
    email VARCHAR(50) NOT NULL,
    password VARCHAR(60) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE IF NOT EXISTS cats (
    catID INT AUTO_INCREMENT PRIMARY KEY, 
    creatorID VARCHAR(20) NOT NULL, 
    CONSTRAINT fk_creator
    FOREIGN KEY (creatorID) REFERENCES users(userID),
    ownerID VARCHAR(20),
    CONSTRAINT fk_user
    FOREIGN KEY (ownerID) REFERENCES users(userID),
    catName CHAR(16),
    likes CHAR(50),
    dislikes CHAR (50),
    birthdate DATE
)

CREATE TABLE IF NOT EXISTS photos (
    photoID INT AUTO_INCREMENT PRIMARY KEY,
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

CREATE TABLE IF NOT EXISTS tags (
    tagName CHAR(20) PRIMARY KEY,
    photoID NOT NULL,
    constraint fk_tagphoto
    FOREIGN KEY (photoID) REFERENCES photos(photoID)
)

-- might need to make tags it's own referene table at some point