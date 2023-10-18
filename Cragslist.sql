
DROP DATABASE IF EXISTS Cragslist;

CREATE DATABASE Cragslist;

\c Cragslist

-- Create the Region table
CREATE TABLE Region (
    RegionID INT PRIMARY KEY,
    RegionName VARCHAR(255)
);

-- Create the User table
CREATE TABLE User (
    UserID INT PRIMARY KEY,
    Username VARCHAR(255),
    Email VARCHAR(255),
    Password VARCHAR(255)
);

-- Create the UserPreferredRegion junction table for the many-to-many relationship
CREATE TABLE UserPreferredRegion (
    UserPreferredRegionID INT PRIMARY KEY,
    UserID INT,
    RegionID INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (RegionID) REFERENCES Region(RegionID)
);

-- Create the Post table
CREATE TABLE Post (
    PostID INT PRIMARY KEY,
    Title VARCHAR(255),
    Text TEXT,
    UserID INT,
    Location VARCHAR(255),
    RegionID INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (RegionID) REFERENCES Region(RegionID)
);

-- Create the Category table
CREATE TABLE Category (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(255)
);

-- Create the PostCategory junction table for the many-to-many relationship
CREATE TABLE PostCategory (
    PostCategoryID INT PRIMARY KEY,
    PostID INT,
    CategoryID INT,
    FOREIGN KEY (PostID) REFERENCES Post(PostID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

INSERT INTO Region (RegionID, RegionName)
VALUES
    (1, 'North America'),
    (2, 'Europe'),
    (3, 'Asia'),
    (4, 'South America'),
    (5, 'Africa');

INSERT INTO User (UserID, Username, Email, Password)
VALUES
    (1, 'user1', 'user1@example.com', 'password1'),
    (2, 'user2', 'user2@example.com', 'password2'),
    (3, 'user3', 'user3@example.com', 'password3'),
    (4, 'user4', 'user4@example.com', 'password4');

INSERT INTO UserPreferredRegion (UserPreferredRegionID, UserID, RegionID)
VALUES
    (1, 1, 1),
    (2, 1, 2),
    (3, 2, 2),
    (4, 3, 1),
    (5, 3, 3),
    (6, 4, 4);

INSERT INTO Post (PostID, Title, Text, UserID, Location, RegionID)
VALUES
    (1, 'Post 1', 'This is the first post', 1, 'Location 1', 1),
    (2, 'Post 2', 'This is the second post', 2, 'Location 2', 2),
    (3, 'Post 3', 'This is the third post', 3, 'Location 3', 1),
    (4, 'Post 4', 'This is the fourth post', 1, 'Location 4', 3),
    (5, 'Post 5', 'This is the fifth post', 4, 'Location 5', 4);

INSERT INTO Category (CategoryID, CategoryName)
VALUES
    (1, 'Category 1'),
    (2, 'Category 2'),
    (3, 'Category 3'),
    (4, 'Category 4');

INSERT INTO PostCategory (PostCategoryID, PostID, CategoryID)
VALUES
    (1, 1, 1),
    (2, 1, 2),
    (3, 2, 2),
    (4, 3, 1),
    (5, 3, 3),
    (6, 4, 4),
    (7, 5, 1),
    (8, 5, 3);
