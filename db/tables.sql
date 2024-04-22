-- Start by creating the database
CREATE DATABASE IF NOT EXISTS `CinemaWorld`;
USE `CinemaWorld`;


-- Create the 'Format' table first because it is referenced by 'Showing'
CREATE TABLE `Format` (
   `FormatID` INT AUTO_INCREMENT PRIMARY KEY,
   `AudioType` VARCHAR(50),
   `Language` VARCHAR(50)
);


-- Create the 'Movie' table
CREATE TABLE `Movie` (
   `MovieID` INT AUTO_INCREMENT PRIMARY KEY,
   `Title` VARCHAR(255) NOT NULL,
   `MaturityRating` VARCHAR(50),
   `Studio` VARCHAR(100),
   `Country` VARCHAR(50),
   `Genre` VARCHAR(50)
);


-- Now create the 'Showing' table that references 'Movie' and 'Format'
CREATE TABLE `Showing` (
   `ShowingID` INT AUTO_INCREMENT PRIMARY KEY,
   `Showtime` DATETIME NOT NULL,
   `MovieID` INT,
   `FormatID` INT,
   FOREIGN KEY (`MovieID`) REFERENCES `Movie`(`MovieID`),
   FOREIGN KEY (`FormatID`) REFERENCES `Format`(`FormatID`)
);


-- Create the 'User' table next
CREATE TABLE `User` (
   `UserID` INT AUTO_INCREMENT PRIMARY KEY,
   `Name` VARCHAR(255) NOT NULL,
   `PhoneNumber` VARCHAR(20),
   `Email` VARCHAR(255),
   `Location` VARCHAR(255),
   `Age` INT,
   `Preferences` VARCHAR(255)
);


-- Create the 'Cinema' table
CREATE TABLE `Cinema` (
   `CinemaID` INT AUTO_INCREMENT PRIMARY KEY,
   `Location` VARCHAR(255) NOT NULL,
   `Amenities` TEXT,
   `Facilities` TEXT
);


-- 'Seat' table which could potentially link to a reservation system in the future
CREATE TABLE `Seat` (
   `SeatID` INT AUTO_INCREMENT PRIMARY KEY,
   `SeatNo` VARCHAR(10),
   `SeatRow` CHAR(1), -- Changed from 'Row' to 'SeatRow'
   `SeatType` VARCHAR(50),
   `CinemaID` INT,
   FOREIGN KEY (`CinemaID`) REFERENCES `Cinema`(`CinemaID`)
);


-- 'Booking' table that references 'User', 'Showing' and potentially 'Seat'
CREATE TABLE `Booking` (
   `BookingID` INT AUTO_INCREMENT PRIMARY KEY,
   `UserID` INT,
   `ShowingID` INT,
   `SeatID` INT,
   `Price` DECIMAL(10, 2),
   FOREIGN KEY (`UserID`) REFERENCES `User`(`UserID`),
   FOREIGN KEY (`ShowingID`) REFERENCES `Showing`(`ShowingID`),
   FOREIGN KEY (`SeatID`) REFERENCES `Seat`(`SeatID`)
);


-- Create the 'Event' table
CREATE TABLE `Event` (
   `EventID` INT AUTO_INCREMENT PRIMARY KEY,
   `Type` VARCHAR(50),
   `Date` DATETIME,
   `Description` TEXT,
   `CinemaID` INT,
   FOREIGN KEY (`CinemaID`) REFERENCES `Cinema`(`CinemaID`)
);


-- Create the 'Forum' table
CREATE TABLE `Forum` (
   `Topic` VARCHAR(255),
   `Section` VARCHAR(100),
   `Genre` VARCHAR(50),
   PRIMARY KEY (`Topic`)
);


-- 'Post' table referencing 'Forum' and 'User'
CREATE TABLE `Post` (
   `PostID` INT AUTO_INCREMENT PRIMARY KEY,
   `Content` TEXT,
   `UserID` INT,
   `Topic` VARCHAR(255),
   FOREIGN KEY (`UserID`) REFERENCES `User`(`UserID`),
   FOREIGN KEY (`Topic`) REFERENCES `Forum`(`Topic`)
);


-- 'Review' table referencing 'User'
CREATE TABLE `Review` (
   `ReviewID` INT AUTO_INCREMENT PRIMARY KEY,
   `Rating` INT CHECK (`Rating` BETWEEN 1 AND 5),
   `Title` VARCHAR(255),
   `UserID` INT,
   FOREIGN KEY (`UserID`) REFERENCES `User`(`UserID`)
);


-- 'Notification' table referencing 'User'
CREATE TABLE `Notification` (
   `NotificationID` INT AUTO_INCREMENT PRIMARY KEY,
   `Time` DATETIME,
   `Type` VARCHAR(50),
   `Sound` VARCHAR(50),
   `Content` TEXT,
   `UserID` INT,
   FOREIGN KEY (`UserID`) REFERENCES `User`(`UserID`)
);
