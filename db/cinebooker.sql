-- Start by creating the database
CREATE DATABASE IF NOT EXISTS `CinemaWorld`;
USE `CinemaWorld`;


-- Create the 'Format' table first because it is referenced by 'Showing'
CREATE TABLE IF NOT EXISTS`Format` (
   `FormatID` INT AUTO_INCREMENT PRIMARY KEY,
   `AudioType` VARCHAR(50),
   `Language` VARCHAR(50)
);


-- Create the 'Movie' table
CREATE TABLE IF NOT EXISTS`Movie` (
   `MovieID` INT AUTO_INCREMENT PRIMARY KEY,
   `Title` VARCHAR(255) NOT NULL,
   `MaturityRating` VARCHAR(50),
   `Studio` VARCHAR(100),
   `Country` VARCHAR(50),
   `Genre` VARCHAR(50)
);


-- Now create the 'Showing' table that references 'Movie' and 'Format'
CREATE TABLE IF NOT EXISTS`Showing` (
   `ShowingID` INT AUTO_INCREMENT PRIMARY KEY,
   `Showtime` DATETIME NOT NULL,
   `MovieID` INT,
   `FormatID` INT,
   FOREIGN KEY (`MovieID`) REFERENCES `Movie`(`MovieID`),
   FOREIGN KEY (`FormatID`) REFERENCES `Format`(`FormatID`)
);


-- Create the 'User' table next
CREATE TABLE IF NOT EXISTS`User` (
   `UserID` INT AUTO_INCREMENT PRIMARY KEY,
   `Name` VARCHAR(255) NOT NULL,
   `PhoneNumber` VARCHAR(20),
   `Email` VARCHAR(255),
   `Location` VARCHAR(255),
   `Age` INT,
   `Preferences` VARCHAR(255)
);


-- Create the 'Cinema' table
CREATE TABLE IF NOT EXISTS`Cinema` (
   `CinemaID` INT AUTO_INCREMENT PRIMARY KEY,
   `Location` VARCHAR(255) NOT NULL,
   `Amenities` TEXT,
   `Facilities` TEXT
);


-- 'Seat' table which could potentially link to a reservation system in the future
CREATE TABLE IF NOT EXISTS`Seat` (
   `SeatID` INT AUTO_INCREMENT PRIMARY KEY,
   `SeatNo` VARCHAR(10),
   `SeatRow` CHAR(1), -- Changed from 'Row' to 'SeatRow'
   `SeatType` VARCHAR(50),
   `CinemaID` INT,
   FOREIGN KEY (`CinemaID`) REFERENCES `Cinema`(`CinemaID`)
);


-- 'Booking' table that references 'User', 'Showing' and potentially 'Seat'
CREATE TABLE IF NOT EXISTS`Booking` (
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
CREATE TABLE IF NOT EXISTS`Event` (
   `EventID` INT AUTO_INCREMENT PRIMARY KEY,
   `Type` VARCHAR(50),
   `Date` DATETIME,
   `Description` TEXT,
   `CinemaID` INT,
   FOREIGN KEY (`CinemaID`) REFERENCES `Cinema`(`CinemaID`)
);


-- Create the 'Forum' table
CREATE TABLE IF NOT EXISTS`Forum` (
   `Topic` VARCHAR(255),
   `Section` VARCHAR(100),
   `Genre` VARCHAR(50),
   PRIMARY KEY (`Topic`)
);


-- 'Post' table referencing 'Forum' and 'User'
CREATE TABLE IF NOT EXISTS`Post` (
   `PostID` INT AUTO_INCREMENT PRIMARY KEY,
   `Content` TEXT,
   `UserID` INT,
   `Topic` VARCHAR(255),
   FOREIGN KEY (`UserID`) REFERENCES `User`(`UserID`)
);


-- 'Review' table referencing 'User'
CREATE TABLE IF NOT EXISTS`Review` (
   `ReviewID` INT AUTO_INCREMENT PRIMARY KEY,
   `Rating` INT CHECK (`Rating` BETWEEN 1 AND 10),
   `Title` VARCHAR(255),
   `UserID` INT,
   FOREIGN KEY (`UserID`) REFERENCES `User`(`UserID`)
);


-- 'Notification' table referencing 'User'
CREATE TABLE IF NOT EXISTS`Notification` (
   `NotificationID` INT AUTO_INCREMENT PRIMARY KEY,
   `Time` DATETIME,
   `Type` VARCHAR(50),
   `Sound` VARCHAR(50),
   `Content` TEXT,
   `UserID` INT,
   FOREIGN KEY (`UserID`) REFERENCES `User`(`UserID`)
);

-- User
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4698, '723-373-9852', 'bharbottle0@ox.ac.uk', 'Mesa', 29, 'Musical', 'Brad Harbottle');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4365, '215-612-0835', 'ncollett1@skype.com', 'Los Angeles', 41, 'Western', 'Nathaniel Collett');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4448, '140-502-6638', 'vbaggelley2@gizmodo.com', 'Minneapolis', 48, 'Comedy', 'Veriee Baggelley');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4321, '223-257-5442', 'gsprey3@jalbum.net', 'Miami', 18, 'Romance', 'Gerty Sprey');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4560, '763-532-4005', 'hdarlington4@tinyurl.com', 'Tulsa', 44, 'War', 'Hollis Darlington');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4314, '254-249-4992', 'cpeschke5@a8.net', 'Long Beach', 46, 'Romance', 'Cilka Peschke');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4015, '358-193-0625', 'mtullot6@com.com', 'Phoenix', 69, 'Family', 'Melitta Tullot');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4013, '382-477-8087', 'cfitzpatrick7@bloomberg.com', 'Fort Worth', 36, 'Romance', 'Caralie Fitzpatrick');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4152, '936-960-6484', 'emarwood8@blogger.com', 'Tucson', 56, 'Animation', 'Ermentrude Marwood');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4841, '733-216-9727', 'rsanney9@google.cn', 'Oklahoma City', 58, 'Thriller', 'Rodney Sanney');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4645, '503-685-7569', 'ahackfortha@diigo.com', 'Arlington', 61, 'Musical', 'Ailbert Hackforth');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4692, '621-995-1037', 'rwabyb@imdb.com', 'Dallas', 74, 'Comedy', 'Ruperta Waby');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4425, '847-633-1030', 'akildalec@nps.gov', 'Wichita', 26, 'Animation', 'Ansley Kildale');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4601, '231-111-5330', 'jjestecod@hc360.com', 'Fresno', 33, 'Documentary', 'Jemmie Jesteco');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4313, '661-577-9710', 'dantoszczyke@tinyurl.com', 'Dallas', 75, 'Documentary', 'Daniele Antoszczyk');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4059, '523-824-2385', 'wbettyf@a8.net', 'Baltimore', 22, 'Comedy', 'Wyatt Betty');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4889, '213-117-0458', 'jbooelng@symantec.com', 'Raleigh', 57, 'Adventure', 'Jamie Booeln');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4945, '477-456-2171', 'fcrebbinh@barnesandnoble.com', 'New York City', 76, 'Western', 'Fawne Crebbin');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4160, '668-400-0332', 'dcastellinii@rambler.ru', 'Dallas', 56, 'Crime', 'Dell Castellini');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4190, '200-164-5830', 'awilloughleyj@ibm.com', 'Tucson', 45, 'Action', 'Aviva Willoughley');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4930, '890-399-4753', 'jcrawshawk@nymag.com', 'Fresno', 25, 'Romance', 'Jenn Crawshaw');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4831, '333-652-5717', 'tauchterlonyl@ted.com', 'Tucson', 74, 'Action', 'Tanney Auchterlony');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4855, '411-221-0963', 'trobertm@alexa.com', 'Mesa', 57, 'Musical', 'Terrie Robert');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4746, '599-106-6809', 'aclynmansn@phpbb.com', 'Memphis', 16, 'Science Fiction', 'Andrea Clynmans');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4139, '736-320-0490', 'achancelloro@reverbnation.com', 'Raleigh', 62, 'Thriller', 'Anna Chancellor');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4665, '540-427-7631', 'imarkp@hugedomains.com', 'Portland', 48, 'Drama', 'Idaline Mark');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4821, '714-638-0306', 'zvanq@hostgator.com', 'Boston', 48, 'Comedy', 'Zulema Van Waadenburg');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4827, '813-564-6822', 'amaestror@linkedin.com', 'Houston', 69, 'Musical', 'Aili Maestro');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4578, '737-818-4814', 'kpfeffers@infoseek.co.jp', 'Atlanta', 75, 'Romance', 'Koren Pfeffer');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4215, '793-356-5799', 'dpawelekt@ted.com', 'New York City', 79, 'Animation', 'Demetria Pawelek');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4341, '272-155-6554', 'slongmateu@sciencedirect.com', 'El Paso', 68, 'Crime', 'Sarette Longmate');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4824, '812-990-6309', 'asedgmanv@ted.com', 'Philadelphia', 29, 'Comedy', 'Aurelie Sedgman');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4487, '587-508-5743', 'fmignotw@163.com', 'Charlotte', 75, 'Western', 'Filippo Mignot');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4410, '494-666-3995', 'dleyrroydx@wisc.edu', 'Austin', 76, 'Horror', 'Deena Leyrroyd');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4519, '822-493-6827', 'zloiseauy@google.it', 'Austin', 54, 'Adventure', 'Zita L''oiseau');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4621, '735-197-2018', 'jbecarisz@amazon.com', 'San Jose', 20, 'Thriller', 'Jermaine Becaris');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4761, '211-773-2149', 'skees10@mozilla.com', 'San Diego', 27, 'Drama', 'Spence Kees');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4590, '316-923-5621', 'bcoltherd11@theglobeandmail.com', 'San Antonio', 40, 'Western', 'Burr Coltherd');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4505, '774-376-0512', 'cost12@deviantart.com', 'Chicago', 43, 'Adventure', 'Chan Ost');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4742, '734-822-4263', 'sfriar13@blogtalkradio.com', 'Phoenix', 22, 'Crime', 'Sherm Friar');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4022, '915-922-4925', 'nlayhe14@businessinsider.com', 'Houston', 26, 'Adventure', 'Nadean Layhe');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4729, '374-601-7259', 'lnorkutt15@usa.gov', 'Indianapolis', 17, 'Romance', 'Liesa Norkutt');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4211, '318-877-9306', 'jferrotti16@google.es', 'San Antonio', 44, 'Horror', 'Jordan Ferrotti');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4311, '456-929-7204', 'cgersam17@hhs.gov', 'Oklahoma City', 32, 'Action', 'Caroljean Gersam');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4699, '138-205-9784', 'ldavoren18@meetup.com', 'Sacramento', 33, 'Family', 'Laney Davoren');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4459, '161-787-1392', 'dlynagh19@typepad.com', 'Portland', 18, 'Animation', 'Druci Lynagh');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4656, '866-521-4665', 'flinforth1a@uiuc.edu', 'Tulsa', 76, 'Musical', 'Fran Linforth');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4906, '989-854-6302', 'sgrenville1b@slashdot.org', 'Fort Worth', 42, 'Fantasy', 'Sax Grenville');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4599, '142-266-7423', 'bgahan1c@ft.com', 'Phoenix', 58, 'Crime', 'Bryana Gahan');
insert into User (UserID, PhoneNumber, Email, Location, Age, Preferences, Name) values (4446, '546-355-9170', 'jranshaw1d@ihg.com', 'Fresno', 21, 'Adventure', 'Johny Ranshaw');
-- Showing
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (1, '2023-06-15 23:49:40', '1', '1');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (2, '2023-12-14 15:55:06', '2', '2');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (3, '2023-08-25 19:03:23', '3', '3');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (4, '2023-05-15 04:32:20', '4', '4');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (5, '2023-04-26 18:56:49', '5', '5');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (6, '2023-08-21 11:11:46', '6', '6');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (7, '2023-07-22 19:02:26', '7', '7');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (8, '2024-04-04 19:29:09', '8', '8');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (9, '2023-07-24 20:31:18', '9', '9');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (10, '2024-04-14 00:24:09', '10', '10');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (11, '2023-08-04 04:06:41', '11', '11');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (12, '2024-02-11 04:56:32', '12', '12');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (13, '2023-05-28 21:46:12', '13', '13');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (14, '2023-05-17 17:02:52', '14', '14');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (15, '2023-05-13 16:30:55', '15', '15');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (16, '2024-01-22 21:38:29', '16', '16');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (17, '2023-08-22 00:16:01', '17', '17');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (18, '2023-08-18 00:13:51', '18', '18');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (19, '2024-02-11 08:02:51', '19', '19');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (20, '2023-07-29 11:39:48', '20', '20');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (21, '2023-09-04 11:37:57', '21', '21');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (22, '2024-03-10 07:47:11', '22', '22');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (23, '2023-05-21 11:13:52', '23', '23');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (24, '2023-12-06 15:47:10', '24', '24');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (25, '2023-08-22 11:43:52', '25', '25');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (26, '2024-02-17 14:55:43', '26', '26');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (27, '2023-12-28 01:19:11', '27', '27');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (28, '2023-11-07 07:14:36', '28', '28');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (29, '2023-06-07 13:42:05', '29', '29');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (30, '2023-05-28 20:36:29', '30', '30');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (31, '2023-12-12 02:34:23', '31', '31');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (32, '2023-12-19 15:22:02', '32', '32');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (33, '2023-07-09 00:49:54', '33', '33');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (34, '2023-05-03 19:22:16', '34', '34');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (35, '2024-03-13 19:07:10', '35', '35');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (36, '2024-03-13 02:38:09', '36', '36');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (37, '2023-12-18 05:54:08', '37', '37');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (38, '2023-05-27 01:14:07', '38', '38');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (39, '2023-07-24 09:26:14', '39', '39');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (40, '2023-09-02 21:16:15', '40', '40');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (41, '2024-01-08 20:58:44', '41', '41');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (42, '2023-10-23 23:14:19', '42', '42');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (43, '2023-06-11 01:40:25', '43', '43');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (44, '2024-02-01 17:52:26', '44', '44');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (45, '2023-11-23 03:13:33', '45', '45');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (46, '2024-04-18 18:01:24', '46', '46');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (47, '2024-01-19 11:45:39', '47', '47');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (48, '2024-03-25 19:42:06', '48', '48');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (49, '2023-09-08 16:49:34', '49', '49');
insert into Showing (ShowingID, Showtime, MovieID, FormatID) values (50, '2023-10-11 08:09:02', '50', '50');



-- Seat
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (1, 22, 'L', 'Balcony', '49');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (2, 36, 'C', 'Balcony', '30');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (3, 1, 'G', 'Recliner', '50');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (4, 13, 'H', 'Luxury', '2');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (5, 5, 'C', 'Premium', '48');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (6, 40, 'O', 'Premium', '31');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (7, 39, 'N', 'Balcony', '40');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (8, 26, 'D', 'Love Seat', '7');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (9, 43, 'P', 'VIP', '36');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (10, 3, 'B', 'Standard', '42');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (11, 42, 'F', 'Bean Bag', '16');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (12, 16, 'F', 'Love Seat', '21');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (13, 17, 'J', 'Director''s Cut', '33');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (14, 32, 'E', 'Couples Only', '18');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (15, 40, 'H', 'Balcony', '46');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (16, 25, 'E', 'Recliner', '22');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (17, 29, 'A', 'Director''s Cut', '10');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (18, 14, 'L', 'Recliner', '39');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (19, 2, 'C', 'Standard', '14');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (20, 48, 'C', 'Luxury', '28');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (21, 43, 'L', 'Luxury', '1');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (22, 1, 'B', 'VIP', '17');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (23, 39, 'I', 'Standard', '20');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (24, 45, 'F', 'Love Seat', '24');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (25, 14, 'P', 'VIP', '38');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (26, 24, 'D', 'Standard', '25');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (27, 3, 'E', 'Love Seat', '34');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (28, 6, 'G', 'VIP', '8');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (29, 25, 'E', 'Director''s Cut', '26');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (30, 25, 'J', 'Standard', '45');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (31, 20, 'P', 'Couples Only', '5');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (32, 41, 'E', 'Premium', '19');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (33, 41, 'E', 'VIP', '43');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (34, 26, 'L', 'Director''s Cut', '3');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (35, 30, 'C', 'Bean Bag', '47');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (36, 26, 'G', 'Director''s Cut', '6');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (37, 43, 'J', 'Bean Bag', '41');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (38, 6, 'E', 'Luxury', '13');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (39, 9, 'N', 'Luxury', '23');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (40, 13, 'D', 'Couples Only', '44');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (41, 24, 'F', 'Couples Only', '9');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (42, 44, 'D', 'Director''s Cut', '11');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (43, 41, 'J', 'VIP', '15');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (44, 21, 'B', 'Balcony', '12');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (45, 36, 'F', 'Bean Bag', '37');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (46, 34, 'P', 'Premium', '29');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (47, 37, 'C', 'Standard', '32');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (48, 29, 'J', 'Director''s Cut', '35');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (49, 49, 'B', 'Luxury', '4');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (50, 11, 'P', 'Couples Only', '27');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (51, 25, 'F', 'Premium', '11');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (52, 41, 'M', 'Recliner', '37');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (53, 2, 'I', 'Bean Bag', '17');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (54, 13, 'D', 'Premium', '30');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (55, 36, 'L', 'Couples Only', '5');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (56, 37, 'G', 'Bean Bag', '38');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (57, 37, 'G', 'Bean Bag', '25');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (58, 36, 'E', 'Bean Bag', '34');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (59, 5, 'O', 'Love Seat', '13');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (60, 43, 'J', 'Recliner', '42');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (61, 3, 'C', 'Director''s Cut', '12');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (62, 23, 'J', 'Director''s Cut', '47');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (63, 28, 'O', 'VIP', '10');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (64, 12, 'G', 'Balcony', '20');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (65, 2, 'J', 'Recliner', '28');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (66, 31, 'D', 'Bean Bag', '15');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (67, 44, 'M', 'Couples Only', '23');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (68, 18, 'D', 'Balcony', '35');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (69, 4, 'O', 'Premium', '22');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (70, 27, 'C', 'VIP', '36');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (71, 50, 'B', 'Couples Only', '8');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (72, 15, 'F', 'Director''s Cut', '32');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (73, 32, 'H', 'Couples Only', '26');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (74, 8, 'M', 'VIP', '40');
insert into Seat (SeatID, SeatNo, SeatRow, SeatType, CinemaID) values (75, 22, 'I', 'Balcony', '41');
-- Review
insert into Review (ReviewID, UserID, Rating, Title) values (1, '14', 7, 'Forrest Gump');
insert into Review (ReviewID, UserID, Rating, Title) values (2, '45', 5, 'Forrest Gump');
insert into Review (ReviewID, UserID, Rating, Title) values (3, '3', 4, 'Avatar');
insert into Review (ReviewID, UserID, Rating, Title) values (4, '50', 2, 'Titanic');
insert into Review (ReviewID, UserID, Rating, Title) values (5, '10', 10, 'The Matrix');
insert into Review (ReviewID, UserID, Rating, Title) values (6, '27', 6, 'Avatar');
insert into Review (ReviewID, UserID, Rating, Title) values (7, '1', 4, 'Forrest Gump');
insert into Review (ReviewID, UserID, Rating, Title) values (8, '5', 9, 'The Shawshank Redemption');
insert into Review (ReviewID, UserID, Rating, Title) values (9, '25', 6, 'Pulp Fiction');
insert into Review (ReviewID, UserID, Rating, Title) values (10, '18', 9, 'The Shawshank Redemption');
insert into Review (ReviewID, UserID, Rating, Title) values (11, '32', 4, 'Forrest Gump');
insert into Review (ReviewID, UserID, Rating, Title) values (12, '49', 7, 'Inception');
insert into Review (ReviewID, UserID, Rating, Title) values (13, '2', 7, 'The Shawshank Redemption');
insert into Review (ReviewID, UserID, Rating, Title) values (14, '41', 1, 'The Godfather');
insert into Review (ReviewID, UserID, Rating, Title) values (15, '8', 6, 'The Dark Knight');
insert into Review (ReviewID, UserID, Rating, Title) values (16, '31', 2, 'The Godfather');
insert into Review (ReviewID, UserID, Rating, Title) values (17, '33', 6, 'Avatar');
insert into Review (ReviewID, UserID, Rating, Title) values (18, '40', 10, 'Titanic');
insert into Review (ReviewID, UserID, Rating, Title) values (19, '46', 2, 'Inception');
insert into Review (ReviewID, UserID, Rating, Title) values (20, '39', 2, 'Inception');
insert into Review (ReviewID, UserID, Rating, Title) values (21, '44', 4, 'Avatar');
insert into Review (ReviewID, UserID, Rating, Title) values (22, '47', 9, 'Pulp Fiction');
insert into Review (ReviewID, UserID, Rating, Title) values (23, '35', 3, 'Forrest Gump');
insert into Review (ReviewID, UserID, Rating, Title) values (24, '13', 9, 'Pulp Fiction');
insert into Review (ReviewID, UserID, Rating, Title) values (25, '6', 8, 'Titanic');
insert into Review (ReviewID, UserID, Rating, Title) values (26, '16', 9, 'Forrest Gump');
insert into Review (ReviewID, UserID, Rating, Title) values (27, '48', 2, 'Jurassic Park');
insert into Review (ReviewID, UserID, Rating, Title) values (28, '38', 5, 'Forrest Gump');
insert into Review (ReviewID, UserID, Rating, Title) values (29, '21', 4, 'Jurassic Park');
insert into Review (ReviewID, UserID, Rating, Title) values (30, '26', 6, 'Inception');
insert into Review (ReviewID, UserID, Rating, Title) values (31, '42', 4, 'The Dark Knight');
insert into Review (ReviewID, UserID, Rating, Title) values (32, '17', 10, 'Inception');
insert into Review (ReviewID, UserID, Rating, Title) values (33, '11', 3, 'Inception');
insert into Review (ReviewID, UserID, Rating, Title) values (34, '4', 1, 'The Shawshank Redemption');
insert into Review (ReviewID, UserID, Rating, Title) values (35, '34', 9, 'Pulp Fiction');
insert into Review (ReviewID, UserID, Rating, Title) values (36, '24', 10, 'The Shawshank Redemption');
insert into Review (ReviewID, UserID, Rating, Title) values (37, '22', 2, 'The Shawshank Redemption');
insert into Review (ReviewID, UserID, Rating, Title) values (38, '9', 6, 'The Dark Knight');
insert into Review (ReviewID, UserID, Rating, Title) values (39, '20', 9, 'Forrest Gump');
insert into Review (ReviewID, UserID, Rating, Title) values (40, '28', 2, 'The Dark Knight');
insert into Review (ReviewID, UserID, Rating, Title) values (41, '36', 4, 'Pulp Fiction');
insert into Review (ReviewID, UserID, Rating, Title) values (42, '23', 6, 'Jurassic Park');
insert into Review (ReviewID, UserID, Rating, Title) values (43, '19', 5, 'Jurassic Park');
insert into Review (ReviewID, UserID, Rating, Title) values (44, '15', 5, 'The Shawshank Redemption');
insert into Review (ReviewID, UserID, Rating, Title) values (45, '12', 1, 'Titanic');
insert into Review (ReviewID, UserID, Rating, Title) values (46, '7', 10, 'The Matrix');
insert into Review (ReviewID, UserID, Rating, Title) values (47, '43', 7, 'Titanic');
insert into Review (ReviewID, UserID, Rating, Title) values (48, '30', 2, 'Inception');
insert into Review (ReviewID, UserID, Rating, Title) values (49, '29', 3, 'Forrest Gump');
insert into Review (ReviewID, UserID, Rating, Title) values (50, '37', 4, 'Pulp Fiction');
insert into Review (ReviewID, UserID, Rating, Title) values (51, '7', 2, 'The Godfather');
insert into Review (ReviewID, UserID, Rating, Title) values (52, '21', 10, 'The Matrix');
insert into Review (ReviewID, UserID, Rating, Title) values (53, '25', 4, 'Forrest Gump');
insert into Review (ReviewID, UserID, Rating, Title) values (54, '2', 7, 'Avatar');
insert into Review (ReviewID, UserID, Rating, Title) values (55, '44', 2, 'Pulp Fiction');
insert into Review (ReviewID, UserID, Rating, Title) values (56, '43', 9, 'The Dark Knight');
insert into Review (ReviewID, UserID, Rating, Title) values (57, '45', 1, 'Pulp Fiction');
insert into Review (ReviewID, UserID, Rating, Title) values (58, '10', 9, 'Inception');
insert into Review (ReviewID, UserID, Rating, Title) values (59, '47', 6, 'Inception');
insert into Review (ReviewID, UserID, Rating, Title) values (60, '20', 7, 'Avatar');
insert into Review (ReviewID, UserID, Rating, Title) values (61, '15', 10, 'The Matrix');
insert into Review (ReviewID, UserID, Rating, Title) values (62, '46', 6, 'Avatar');
insert into Review (ReviewID, UserID, Rating, Title) values (63, '1', 5, 'The Godfather');
insert into Review (ReviewID, UserID, Rating, Title) values (64, '13', 10, 'The Dark Knight');
insert into Review (ReviewID, UserID, Rating, Title) values (65, '33', 9, 'Inception');
insert into Review (ReviewID, UserID, Rating, Title) values (66, '17', 4, 'Titanic');
insert into Review (ReviewID, UserID, Rating, Title) values (67, '8', 5, 'The Godfather');
insert into Review (ReviewID, UserID, Rating, Title) values (68, '37', 10, 'The Shawshank Redemption');
insert into Review (ReviewID, UserID, Rating, Title) values (69, '48', 6, 'Jurassic Park');
insert into Review (ReviewID, UserID, Rating, Title) values (70, '27', 8, 'Avatar');
insert into Review (ReviewID, UserID, Rating, Title) values (71, '23', 1, 'The Shawshank Redemption');
insert into Review (ReviewID, UserID, Rating, Title) values (72, '36', 3, 'Titanic');
insert into Review (ReviewID, UserID, Rating, Title) values (73, '32', 1, 'Titanic');
insert into Review (ReviewID, UserID, Rating, Title) values (74, '14', 1, 'Titanic');
insert into Review (ReviewID, UserID, Rating, Title) values (75, '16', 9, 'The Shawshank Redemption');

-- Post
insert into Post (PostID, UserID, Topic, Content) values (1, 1, 'Top 10 Action Movies of All Time', 'I was completely immersed in the world of the movie.');
insert into Post (PostID, UserID, Topic, Content) values (2, 2, 'Romantic Comedies Discussion', 'This movie had me on the edge of my seat the whole time.');
insert into Post (PostID, UserID, Topic, Content) values (3, 3, 'Sci-Fi Movie Recommendations', 'I loved the plot twist at the end!');
insert into Post (PostID, UserID, Topic, Content) values (4, 4, 'Horror Movie Marathon Ideas', 'I was completely immersed in the world of the movie.');
insert into Post (PostID, UserID, Topic, Content) values (5, 5, 'Classic Films vs. Modern Movies Debate', 'The soundtrack really added to the emotional impact.');
insert into Post (PostID, UserID, Topic, Content) values (6, 6, 'Animated Movies for Kids', 'The special effects were amazing!');
insert into Post (PostID, UserID, Topic, Content) values (7, 7, 'Movie Soundtrack Appreciation', 'The special effects were amazing!');
insert into Post (PostID, UserID, Topic, Content) values (8, 8, 'Foreign Films Worth Watching', 'I was completely immersed in the world of the movie.');
insert into Post (PostID, UserID, Topic, Content) values (9, 9, 'Director Spotlight: Quentin Tarantino', 'The cinematography was stunning.');
insert into Post (PostID, UserID, Topic, Content) values (10, 10, 'Cinematic Universe Theories', 'Great character development throughout the movie.');
insert into Post (PostID, UserID, Topic, Content) values (11, 11, 'Oscar Snubs and Surprises', 'I loved the plot twist at the end!');
insert into Post (PostID, UserID, Topic, Content) values (12, 12, 'Movie Remake Reactions', 'I laughed so hard at that comedic scene.');
insert into Post (PostID, UserID, Topic, Content) values (13, 13, 'Hidden Gems on Netflix', 'The special effects were amazing!');
insert into Post (PostID, UserID, Topic, Content) values (14, 14, 'Movie Trivia Challenge', 'Great character development throughout the movie.');
insert into Post (PostID, UserID, Topic, Content) values (15, 15, 'Behind the Scenes of Blockbuster Films', 'I was completely immersed in the world of the movie.');
insert into Post (PostID, UserID, Topic, Content) values (16, 16, 'Movie Character Analysis', 'I can''t believe that shocking cliffhanger!');
insert into Post (PostID, UserID, Topic, Content) values (17, 17, 'Film Adaptations vs. Original Books', 'Great character development throughout the movie.');
insert into Post (PostID, UserID, Topic, Content) values (18, 18, 'Movie Sequels We Want to See', 'Great character development throughout the movie.');
insert into Post (PostID, UserID, Topic, Content) values (19, 19, 'Cult Classics Appreciation', 'The special effects were amazing!');
insert into Post (PostID, UserID, Topic, Content) values (20, 20, 'Movie Review Roundup', 'The special effects were amazing!');
insert into Post (PostID, UserID, Topic, Content) values (21, 21, 'Favorite Movie Quotes', 'Great character development throughout the movie.');
insert into Post (PostID, UserID, Topic, Content) values (22, 22, 'Movie Merchandise Collection Showcase', 'The acting was top-notch.');
insert into Post (PostID, UserID, Topic, Content) values (23, 23, 'Movie Poster Art Discussion', 'The special effects were amazing!');
insert into Post (PostID, UserID, Topic, Content) values (24, 24, 'Film Festival Highlights', 'Great character development throughout the movie.');
insert into Post (PostID, UserID, Topic, Content) values (25, 25, 'Movie Industry News Updates', 'I can''t believe that shocking cliffhanger!');
insert into Post (PostID, UserID, Topic, Content) values (26, 26, 'Movie Streaming Platform Comparison', 'I loved the plot twist at the end!');
insert into Post (PostID, UserID, Topic, Content) values (27, 27, 'Movie Marathon Themes', 'The acting was top-notch.');
insert into Post (PostID, UserID, Topic, Content) values (28, 28, 'Film Genre Preferences', 'The cinematography was stunning.');
insert into Post (PostID, UserID, Topic, Content) values (29, 29, 'Movie Plot Twist Analysis', 'The acting was top-notch.');
insert into Post (PostID, UserID, Topic, Content) values (30, 30, 'Celebrity Cameo Appreciation', 'I can''t believe that shocking cliffhanger!');
insert into Post (PostID, UserID, Topic, Content) values (31, 31, 'Movie Franchise Rankings', 'This movie had me on the edge of my seat the whole time.');
insert into Post (PostID, UserID, Topic, Content) values (32, 32, 'Movie Theories and Speculations', 'The cinematography was stunning.');
insert into Post (PostID, UserID, Topic, Content) values (33, 33, 'Movie Awards Predictions', 'The cinematography was stunning.');
insert into Post (PostID, UserID, Topic, Content) values (34, 34, 'Movie Memorabilia Collecting', 'The special effects were amazing!');
insert into Post (PostID, UserID, Topic, Content) values (35, 35, 'Film Score Analysis', 'I laughed so hard at that comedic scene.');
insert into Post (PostID, UserID, Topic, Content) values (36, 36, 'Movie Poster Design Critique', 'The special effects were amazing!');
insert into Post (PostID, UserID, Topic, Content) values (37, 37, 'Movie Makeup and Costume Design', 'I can''t believe that shocking cliffhanger!');
insert into Post (PostID, UserID, Topic, Content) values (38, 38, 'Movie Set Locations Exploration', 'I loved the plot twist at the end!');
insert into Post (PostID, UserID, Topic, Content) values (39, 39, 'Movie Premiere Experiences', 'The acting was top-notch.');
insert into Post (PostID, UserID, Topic, Content) values (40, 40, 'Movie Podcast Recommendations', 'Great character development throughout the movie.');
insert into Post (PostID, UserID, Topic, Content) values (41, 41, 'Movie Fan Theories', 'I loved the plot twist at the end!');
insert into Post (PostID, UserID, Topic, Content) values (42, 42, 'Movie Character Cosplay Ideas', 'I can''t believe that shocking cliffhanger!');
insert into Post (PostID, UserID, Topic, Content) values (43, 43, 'Movie Trailer Reactions', 'The soundtrack really added to the emotional impact.');
insert into Post (PostID, UserID, Topic, Content) values (44, 44, 'Movie Scene Analysis', 'Great character development throughout the movie.');
insert into Post (PostID, UserID, Topic, Content) values (45, 45, 'Movie Ratings and Reviews', 'Great character development throughout the movie.');
insert into Post (PostID, UserID, Topic, Content) values (46, 46, 'Movie Marathon Snacks Ideas', 'The soundtrack really added to the emotional impact.');
insert into Post (PostID, UserID, Topic, Content) values (47, 47, 'Movie Sound Effects Appreciation', 'I loved the plot twist at the end!');
insert into Post (PostID, UserID, Topic, Content) values (48, 48, 'Top 10 Action Movies of All Time', 'This movie had me on the edge of my seat the whole time.');
insert into Post (PostID, UserID, Topic, Content) values (49, 49, 'Romantic Comedies Discussion', 'The acting was top-notch.');
insert into Post (PostID, UserID, Topic, Content) values (50, 50, 'Sci-Fi Movie Recommendations', 'I laughed so hard at that comedic scene.');



-- Notification
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (1, '48', '2:01 AM', 'Pop', 'Get 50% off on all movie rentals this weekend only. Don''t miss out!', 'Seat upgrades');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (2, '40', '11:04 PM', 'Chime', 'Discover hidden gems: Check out our curated list of indie movies to watch this month.', 'Upcoming events');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (3, '8', '2:10 AM', 'Pop', 'Watch the classic movie ''Casablanca'' in stunning 4K quality. Limited time offer!', 'Upcoming events');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (4, '17', '7:50 AM', 'Bell', 'Join our movie trivia contest and win exciting prizes. Test your knowledge now!', 'Bonus points earned');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (5, '34', '11:57 PM', 'Whistle', 'Get 50% off on all movie rentals this weekend only. Don''t miss out!', 'Seat upgrades');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (6, '18', '3:45 PM', 'Chime', 'stars in the new movie ''The Secret Agent''. Watch now!', 'Exclusive offers');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (7, '7', '5:35 PM', 'Whistle', 'Get personalized recommendations based on your viewing history. Find your next favorite movie today!', 'Nearby cinema deals');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (8, '41', '10:17 AM', 'Ding', 'Upgrade to premium membership and unlock access to exclusive content and early releases.', 'Nearby cinema deals');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (9, '12', '9:51 AM', 'Whistle', 'stars in the new movie ''The Secret Agent''. Watch now!', 'Seat upgrades');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (10, '45', '11:19 PM', 'Chime', 'Your favorite actor', 'Ticket confirmations');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (11, '32', '6:03 PM', 'Pop', 'New episode of your favorite TV show ''The Detective Chronicles'' now available to watch!', 'Exclusive offers');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (12, '10', '1:51 AM', 'Bell', 'John Doe', 'Seat upgrades');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (13, '47', '4:27 PM', 'Chime', 'John Doe', 'Upcoming events');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (14, '16', '4:39 AM', 'Ding', 'John Doe', 'Reminder for movie start time');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (15, '37', '10:28 PM', 'Bell', 'Get personalized recommendations based on your viewing history. Find your next favorite movie today!', 'New movie releases');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (16, '31', '7:14 AM', 'Ding', 'John Doe', 'New movie releases');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (17, '36', '1:41 PM', 'Ding', 'Get 50% off on all movie rentals this weekend only. Don''t miss out!', 'New movie releases');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (18, '20', '10:00 AM', 'Chime', 'Discover hidden gems: Check out our curated list of indie movies to watch this month.', 'Exclusive offers');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (19, '26', '3:04 AM', 'Pop', 'Get personalized recommendations based on your viewing history. Find your next favorite movie today!', 'Exclusive offers');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (20, '1', '9:45 PM', 'Whistle', 'Exclusive sneak peek: Behind the scenes of the upcoming movie ''The Mystery of the Lost City''', 'Exclusive offers');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (21, '50', '5:36 PM', 'Ding', 'Discover hidden gems: Check out our curated list of indie movies to watch this month.', 'Ticket confirmations');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (22, '13', '6:51 AM', 'Whistle', 'Discover hidden gems: Check out our curated list of indie movies to watch this month.', 'Ticket confirmations');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (23, '11', '1:39 PM', 'Whistle', 'Upgrade to premium membership and unlock access to exclusive content and early releases.', 'Exclusive offers');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (24, '2', '7:19 AM', 'Bell', 'John Doe', 'New movie releases');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (25, '15', '9:07 PM', 'Ding', 'John Doe', 'Seat upgrades');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (26, '46', '11:55 AM', 'Ding', 'John Doe', 'Seat upgrades');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (27, '25', '5:16 PM', 'Pop', 'Exclusive sneak peek: Behind the scenes of the upcoming movie ''The Mystery of the Lost City''', 'New movie releases');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (28, '27', '5:53 AM', 'Chime', 'New episode of your favorite TV show ''The Detective Chronicles'' now available to watch!', 'Seat upgrades');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (29, '35', '8:38 AM', 'Pop', 'Join our movie trivia contest and win exciting prizes. Test your knowledge now!', 'Special discounts');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (30, '23', '1:59 AM', 'Bell', 'Upgrade to premium membership and unlock access to exclusive content and early releases.', 'Bonus points earned');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (31, '3', '10:12 PM', 'Whistle', 'John Doe', 'New movie releases');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (32, '33', '1:18 PM', 'Ding', 'Your favorite actor', 'Reminder for movie start time');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (33, '21', '12:33 PM', 'Chime', 'New movie release: ''The Galactic Adventure'' now available for streaming!', 'Bonus points earned');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (34, '42', '12:07 AM', 'Whistle', 'Upgrade to premium membership and unlock access to exclusive content and early releases.', 'Loyalty program rewards');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (35, '9', '3:35 AM', 'Pop', 'stars in the new movie ''The Secret Agent''. Watch now!', 'Loyalty program rewards');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (36, '24', '6:30 AM', 'Ding', 'Discover hidden gems: Check out our curated list of indie movies to watch this month.', 'Reminder for movie start time');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (37, '29', '5:18 AM', 'Ding', 'Exclusive sneak peek: Behind the scenes of the upcoming movie ''The Mystery of the Lost City''', 'Upcoming events');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (38, '22', '7:16 PM', 'Ding', 'Your favorite actor', 'Nearby cinema deals');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (39, '38', '5:57 AM', 'Chime', 'John Doe', 'Upcoming events');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (40, '5', '9:30 PM', 'Bell', 'Get 50% off on all movie rentals this weekend only. Don''t miss out!', 'Exclusive offers');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (41, '14', '12:34 PM', 'Ding', 'Your favorite actor', 'Loyalty program rewards');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (42, '6', '6:19 AM', 'Ding', 'New episode of your favorite TV show ''The Detective Chronicles'' now available to watch!', 'Seat upgrades');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (43, '44', '6:26 PM', 'Whistle', 'Get personalized recommendations based on your viewing history. Find your next favorite movie today!', 'Seat upgrades');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (44, '19', '2:45 AM', 'Pop', 'Get personalized recommendations based on your viewing history. Find your next favorite movie today!', 'New movie releases');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (45, '4', '1:01 PM', 'Ding', 'New movie release: ''The Galactic Adventure'' now available for streaming!', 'Exclusive offers');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (46, '30', '4:03 AM', 'Chime', 'Get personalized recommendations based on your viewing history. Find your next favorite movie today!', 'Exclusive offers');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (47, '49', '8:24 AM', 'Whistle', 'Upgrade to premium membership and unlock access to exclusive content and early releases.', 'Upcoming events');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (48, '43', '11:39 PM', 'Ding', 'New episode of your favorite TV show ''The Detective Chronicles'' now available to watch!', 'Bonus points earned');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (49, '28', '7:55 PM', 'Ding', 'New episode of your favorite TV show ''The Detective Chronicles'' now available to watch!', 'Ticket confirmations');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (50, '39', '12:26 PM', 'Pop', 'Watch the classic movie ''Casablanca'' in stunning 4K quality. Limited time offer!', 'Upcoming events');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (51, '44', '4:45 PM', 'Ding', 'John Doe', 'New movie releases');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (52, '45', '10:05 PM', 'Whistle', 'Exclusive sneak peek: Behind the scenes of the upcoming movie ''The Mystery of the Lost City''', 'Loyalty program rewards');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (53, '40', '7:16 PM', 'Pop', 'New episode of your favorite TV show ''The Detective Chronicles'' now available to watch!', 'Exclusive offers');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (54, '7', '11:58 PM', 'Chime', 'New movie release: ''The Galactic Adventure'' now available for streaming!', 'Seat upgrades');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (55, '18', '2:20 PM', 'Ding', 'Exclusive sneak peek: Behind the scenes of the upcoming movie ''The Mystery of the Lost City''', 'Loyalty program rewards');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (56, '47', '7:05 AM', 'Pop', 'Join our movie trivia contest and win exciting prizes. Test your knowledge now!', 'Nearby cinema deals');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (57, '9', '9:50 PM', 'Ding', 'Upgrade to premium membership and unlock access to exclusive content and early releases.', 'Seat upgrades');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (58, '1', '5:23 AM', 'Pop', 'Your favorite actor', 'Ticket confirmations');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (59, '30', '6:57 PM', 'Chime', 'New episode of your favorite TV show ''The Detective Chronicles'' now available to watch!', 'Ticket confirmations');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (60, '29', '1:39 PM', 'Bell', 'New movie release: ''The Galactic Adventure'' now available for streaming!', 'Special discounts');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (61, '3', '9:34 AM', 'Pop', 'Discover hidden gems: Check out our curated list of indie movies to watch this month.', 'Ticket confirmations');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (62, '21', '2:32 PM', 'Chime', 'New episode of your favorite TV show ''The Detective Chronicles'' now available to watch!', 'Special discounts');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (63, '5', '7:22 PM', 'Chime', 'Get 50% off on all movie rentals this weekend only. Don''t miss out!', 'Bonus points earned');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (64, '20', '7:34 AM', 'Whistle', 'Join our movie trivia contest and win exciting prizes. Test your knowledge now!', 'Reminder for movie start time');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (65, '6', '10:25 AM', 'Bell', 'Discover hidden gems: Check out our curated list of indie movies to watch this month.', 'Nearby cinema deals');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (66, '39', '8:08 PM', 'Whistle', 'stars in the new movie ''The Secret Agent''. Watch now!', 'Loyalty program rewards');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (67, '32', '12:52 AM', 'Chime', 'Get 50% off on all movie rentals this weekend only. Don''t miss out!', 'Reminder for movie start time');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (68, '50', '6:14 AM', 'Whistle', 'Exclusive sneak peek: Behind the scenes of the upcoming movie ''The Mystery of the Lost City''', 'Nearby cinema deals');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (69, '10', '9:37 PM', 'Bell', 'Join our movie trivia contest and win exciting prizes. Test your knowledge now!', 'Bonus points earned');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (70, '19', '3:24 AM', 'Pop', 'Upgrade to premium membership and unlock access to exclusive content and early releases.', 'Loyalty program rewards');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (71, '38', '3:59 PM', 'Bell', 'stars in the new movie ''The Secret Agent''. Watch now!', 'Exclusive offers');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (72, '2', '6:44 PM', 'Bell', 'stars in the new movie ''The Secret Agent''. Watch now!', 'Upcoming events');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (73, '11', '6:49 PM', 'Bell', 'Join our movie trivia contest and win exciting prizes. Test your knowledge now!', 'Bonus points earned');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (74, '46', '11:36 AM', 'Pop', 'Upgrade to premium membership and unlock access to exclusive content and early releases.', 'Seat upgrades');
insert into Notification (NotificationID, UserID, Time, Sound, Content, Type) values (75, '49', '11:13 PM', 'Pop', 'New movie release: ''The Galactic Adventure'' now available for streaming!', 'Exclusive offers');

-- Movie
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (1, 'Sex and Fury (Furyô anego den: Inoshika Ochô)', 'Mountain High Studios', 'France', 'Action|Crime|Thriller', 'PG');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (2, 'Little Vampire, The', 'Mountain High Studios', 'Germany', 'Adventure|Children', 'NC-17');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (3, 'Sun, The (Solntse)', 'Silver Screen Studios', 'Japan', 'Drama', 'NR');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (4, 'One Kill', 'Moonbeam Films', 'Canada', 'Crime|Drama', 'MA');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (5, 'Pretty One, The', 'Emerald City Entertainment', 'United Kingdom', 'Comedy|Drama', 'M');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (6, 'March of the Wooden Soldiers (a.k.a. Babes in Toyland)', 'Silver Screen Studios', 'United States', 'Children|Comedy|Fantasy', 'M');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (7, 'Mirror Mirror', 'Mountain High Studios', 'Brazil', 'Adventure|Comedy|Fantasy', 'NR');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (8, 'Unholy Three, The', 'Oceanview Films', 'Australia', 'Crime|Drama|Romance', 'PG');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (9, 'Aziz Ansari: Intimate Moments for a Sensual Evening', 'Emerald City Entertainment', 'United States', 'Comedy|Documentary', 'X');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (10, 'Four Feathers, The', 'Starlight Productions', 'Germany', 'Adventure|War', 'Unrated');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (11, 'Inhale', 'Silver Screen Studios', 'South Africa', 'Drama|Thriller', 'PG-13');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (12, 'Just Between Friends', 'Moonbeam Films', 'France', 'Drama', 'M');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (13, 'Velvet Vampire, The', 'Emerald City Entertainment', 'United Kingdom', 'Fantasy|Horror', 'MA');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (14, 'Ocean''s Eleven', 'Cityscape Cinema', 'United States', 'Crime|Thriller', 'R');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (15, 'Ricky Gervais Live 2: Politics', 'Starlight Productions', 'Japan', 'Comedy', 'NC-17');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (16, 'Once You''re Born You Can No Longer Hide (Quando sei nato non puoi più nasconderti)', 'Silver Screen Studios', 'Japan', 'Adventure|Drama', 'M');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (17, 'My Dear Desperado', 'Emerald City Entertainment', 'France', 'Comedy', 'MA');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (18, 'Ilsa, She Wolf of the SS', 'Midnight Motion Pictures', 'Canada', 'Horror', 'R');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (19, 'Life of Another, The (La vie d''une autre)', 'Sunset Studios', 'Germany', 'Comedy|Drama|Mystery', 'X');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (20, 'Dead Silent', 'Cityscape Cinema', 'Canada', 'Thriller', 'PG-13');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (21, 'On the Town', 'Emerald City Entertainment', 'United States', 'Comedy|Musical|Romance', 'Unrated');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (22, 'Stage Beauty', 'Midnight Motion Pictures', 'Australia', 'Drama', 'NC-17');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (23, 'Uncle Marin, the Billionaire (Nea Marin miliardar) (Uncle Martin, the Multimillionaire)', 'Moonbeam Films', 'Japan', 'Comedy', 'Unrated');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (24, 'Los Angeles Plays Itself', 'Oceanview Films', 'United States', 'Documentary', 'PG');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (25, 'Casino', 'Oceanview Films', 'Canada', 'Crime|Drama', 'R');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (26, 'Big Street, The', 'Sunset Studios', 'South Africa', 'Drama|Romance', 'MA');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (27, 'Blank Generation, The', 'Emerald City Entertainment', 'India', 'Musical', 'PG-13');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (28, '20,000 Days on Earth', 'Mountain High Studios', 'Australia', 'Documentary|Drama|Musical', 'PG');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (29, 'Ordinary Decent Criminal', 'Sunset Studios', 'United Kingdom', 'Comedy|Crime', 'MA');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (30, 'Trial of the Road (Check-up on the Roads) (Checkpoint) (Proverka na dorogakh)', 'Oceanview Films', 'Germany', 'Drama|War', 'Unrated');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (31, 'Mahakaal (The Monster)', 'Mountain High Studios', 'Australia', 'Horror', 'NR');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (32, 'Girl Who Leapt Through Time, The (Toki o kakeru shôjo)', 'Mountain High Studios', 'Japan', 'Animation|Comedy|Drama|Romance|Sci-Fi', 'PG');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (33, 'Graveyard Shift (Stephen King''s Graveyard Shift)', 'Moonbeam Films', 'Brazil', 'Horror|Thriller', 'NR');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (34, 'Ecstasy (Éxtasis)', 'Cityscape Cinema', 'France', 'Drama', 'R');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (35, 'How I Killed My Father (a.k.a. My Father and I) (Comment j''ai tué mon Père)', 'Golden Gate Pictures', 'Canada', 'Drama', 'R');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (36, 'Rosvo Roope', 'Emerald City Entertainment', 'United Kingdom', 'Drama|Romance', 'G');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (37, 'Alexander and the Terrible, Horrible, No Good, Very Bad Day', 'Oceanview Films', 'United Kingdom', 'Comedy', 'NR');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (38, 'Cat Returns, The (Neko no ongaeshi)', 'Silver Screen Studios', 'Australia', 'Adventure|Animation|Children|Fantasy', 'NC-17');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (39, 'Wish You Were Here', 'Golden Gate Pictures', 'South Africa', 'Drama|Mystery', 'NC-17');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (40, 'Nim''s Island', 'Silver Screen Studios', 'Canada', 'Adventure|Comedy|Fantasy', 'NC-17');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (41, 'Invincible', 'Midnight Motion Pictures', 'United States', 'Drama', 'MA');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (42, 'Cheech & Chong''s The Corsican Brothers', 'Emerald City Entertainment', 'Australia', 'Comedy', 'PG-13');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (43, 'Case 39', 'Emerald City Entertainment', 'France', 'Horror|Thriller', 'Unrated');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (44, 'Stone of Destiny', 'Midnight Motion Pictures', 'Canada', 'Adventure|Comedy|Crime|Drama', 'PG-13');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (45, 'Caine Mutiny, The', 'Golden Gate Pictures', 'Germany', 'Drama|War', 'NC-17');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (46, 'Very Annie Mary', 'Silver Screen Studios', 'South Africa', 'Comedy|Musical', 'MA');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (47, 'Goodbye World', 'Cityscape Cinema', 'Germany', 'Comedy|Drama', 'NR');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (48, 'The Hunters', 'Silver Screen Studios', 'Australia', 'Adventure', 'NR');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (49, 'Midnight Clear', 'Oceanview Films', 'Japan', 'Drama', 'G');
insert into Movie (MovieID, Title, Studio, Country, Genre, MaturityRating) values (50, 'Pekka ja Pätkä neekereinä', 'Mountain High Studios', 'India', 'Comedy', 'G');

-- Forum
insert into Forum (Section, Genre, Topic) values ('Behind the Scenes', 'Action', 'Top 10 Action Movies of All Time');
insert into Forum (Section, Genre, Topic) values ('Soundtrack Discussions', 'Thriller', 'Romantic Comedies Discussion');
insert into Forum (Section, Genre, Topic) values ('Behind the Scenes', 'Comedy', 'Sci-Fi Movie Recommendations');
insert into Forum (Section, Genre, Topic) values ('Movie Reviews', 'Drama', 'Horror Movie Marathon Ideas');
insert into Forum (Section, Genre, Topic) values ('Movie Reviews', 'Action', 'Classic Films vs. Modern Movies Debate');
insert into Forum (Section, Genre, Topic) values ('Behind the Scenes', 'Drama', 'Animated Movies for Kids');
insert into Forum (Section, Genre, Topic) values ('Actor Discussions', 'Comedy', 'Movie Soundtrack Appreciation');
insert into Forum (Section, Genre, Topic) values ('Actor Discussions', 'Sci-Fi', 'Foreign Films Worth Watching');
insert into Forum (Section, Genre, Topic) values ('Trivia', 'Horror', 'Director Spotlight: Quentin Tarantino');
insert into Forum (Section, Genre, Topic) values ('General Discussion', 'Fantasy', 'Cinematic Universe Theories');
insert into Forum (Section, Genre, Topic) values ('Actor Discussions', 'Action', 'Oscar Snubs and Surprises');
insert into Forum (Section, Genre, Topic) values ('Behind the Scenes', 'Mystery', 'Movie Remake Reactions');
insert into Forum (Section, Genre, Topic) values ('Soundtrack Discussions', 'Mystery', 'Hidden Gems on Netflix');
insert into Forum (Section, Genre, Topic) values ('Soundtrack Discussions', 'Sci-Fi', 'Movie Trivia Challenge');
insert into Forum (Section, Genre, Topic) values ('Polls', 'Comedy', 'Behind the Scenes of Blockbuster Films');
insert into Forum (Section, Genre, Topic) values ('Polls', 'Action', 'Movie Character Analysis');
insert into Forum (Section, Genre, Topic) values ('Trivia', 'Sci-Fi', 'Film Adaptations vs. Original Books');
insert into Forum (Section, Genre, Topic) values ('Polls', 'Mystery', 'Movie Sequels We Want to See');
insert into Forum (Section, Genre, Topic) values ('Actor Discussions', 'Mystery', 'Cult Classics Appreciation');
insert into Forum (Section, Genre, Topic) values ('Movie Reviews', 'Fantasy', 'Movie Review Roundup');
insert into Forum (Section, Genre, Topic) values ('Recommendations', 'Thriller', 'Favorite Movie Quotes');
insert into Forum (Section, Genre, Topic) values ('Behind the Scenes', 'Action', 'Movie Merchandise Collection Showcase');
insert into Forum (Section, Genre, Topic) values ('Soundtrack Discussions', 'Horror', 'Movie Poster Art Discussion');
insert into Forum (Section, Genre, Topic) values ('Polls', 'Horror', 'Film Festival Highlights');
insert into Forum (Section, Genre, Topic) values ('Trivia', 'Fantasy', 'Movie Industry News Updates');
insert into Forum (Section, Genre, Topic) values ('General Discussion', 'Romance', 'Movie Streaming Platform Comparison');
insert into Forum (Section, Genre, Topic) values ('Trivia', 'Documentary', 'Movie Marathon Themes');
insert into Forum (Section, Genre, Topic) values ('Actor Discussions', 'Documentary', 'Film Genre Preferences');
insert into Forum (Section, Genre, Topic) values ('Behind the Scenes', 'Fantasy', 'Movie Plot Twist Analysis');
insert into Forum (Section, Genre, Topic) values ('Trivia', 'Horror', 'Celebrity Cameo Appreciation');
insert into Forum (Section, Genre, Topic) values ('Soundtrack Discussions', 'Action', 'Movie Franchise Rankings');
insert into Forum (Section, Genre, Topic) values ('Soundtrack Discussions', 'Action', 'Movie Theories and Speculations');
insert into Forum (Section, Genre, Topic) values ('Recommendations', 'Thriller', 'Movie Awards Predictions');
insert into Forum (Section, Genre, Topic) values ('Movie Reviews', 'Romance', 'Movie Memorabilia Collecting');
insert into Forum (Section, Genre, Topic) values ('Movie Reviews', 'Sci-Fi', 'Film Score Analysis');
insert into Forum (Section, Genre, Topic) values ('Actor Discussions', 'Mystery', 'Movie Poster Design Critique');
insert into Forum (Section, Genre, Topic) values ('Trivia', 'Thriller', 'Movie Makeup and Costume Design');
insert into Forum (Section, Genre, Topic) values ('Movie Reviews', 'Documentary', 'Movie Set Locations Exploration');
insert into Forum (Section, Genre, Topic) values ('General Discussion', 'Romance', 'Movie Premiere Experiences');
insert into Forum (Section, Genre, Topic) values ('Behind the Scenes', 'Thriller', 'Movie Podcast Recommendations');
insert into Forum (Section, Genre, Topic) values ('Actor Discussions', 'Comedy', 'Movie Fan Theories');
insert into Forum (Section, Genre, Topic) values ('Soundtrack Discussions', 'Thriller', 'Movie Character Cosplay Ideas');
insert into Forum (Section, Genre, Topic) values ('General Discussion', 'Fantasy', 'Movie Trailer Reactions');
insert into Forum (Section, Genre, Topic) values ('General Discussion', 'Comedy', 'Movie Scene Analysis');
insert into Forum (Section, Genre, Topic) values ('Polls', 'Comedy', 'Movie Ratings and Reviews');
insert into Forum (Section, Genre, Topic) values ('Soundtrack Discussions', 'Documentary', 'Movie Marathon Snacks Ideas');
insert into Forum (Section, Genre, Topic) values ('Actor Discussions', 'Action', 'Movie Sound Effects Appreciation');
insert into Forum (Section, Genre, Topic) values ('Movie Reviews', 'Horror', 'Top 10 Action Movies of All Time');
insert into Forum (Section, Genre, Topic) values ('Trivia', 'Fantasy', 'Romantic Comedies Discussion');
insert into Forum (Section, Genre, Topic) values ('Soundtrack Discussions', 'Action', 'Sci-Fi Movie Recommendations');

-- Format
insert into Format (FormatID, AudioType, Language) values (1, 'DTS', 'Japanese');
insert into Format (FormatID, AudioType, Language) values (2, 'DTS', 'English');
insert into Format (FormatID, AudioType, Language) values (3, 'Sensurround', 'Japanese');
insert into Format (FormatID, AudioType, Language) values (4, 'Atmos', 'Mandarin');
insert into Format (FormatID, AudioType, Language) values (5, 'IMAX', 'English');
insert into Format (FormatID, AudioType, Language) values (6, 'Barco Auro 11.1', 'German');
insert into Format (FormatID, AudioType, Language) values (7, 'Surround Sound', 'Japanese');
insert into Format (FormatID, AudioType, Language) values (8, 'Dolby Digital', 'Russian');
insert into Format (FormatID, AudioType, Language) values (9, 'Surround Sound', 'Spanish');
insert into Format (FormatID, AudioType, Language) values (10, 'Atmos', 'Italian');
insert into Format (FormatID, AudioType, Language) values (11, 'Barco Auro 11.1', 'Russian');
insert into Format (FormatID, AudioType, Language) values (12, 'DTS', 'Portuguese');
insert into Format (FormatID, AudioType, Language) values (13, 'Surround Sound', 'Korean');
insert into Format (FormatID, AudioType, Language) values (14, 'THX', 'French');
insert into Format (FormatID, AudioType, Language) values (15, 'Surround Sound', 'Italian');
insert into Format (FormatID, AudioType, Language) values (16, '3D Audio', 'Italian');
insert into Format (FormatID, AudioType, Language) values (17, 'IMAX', 'English');
insert into Format (FormatID, AudioType, Language) values (18, 'Barco Auro 11.1', 'Italian');
insert into Format (FormatID, AudioType, Language) values (19, 'Atmos', 'Italian');
insert into Format (FormatID, AudioType, Language) values (20, 'Sensurround', 'Korean');
insert into Format (FormatID, AudioType, Language) values (21, 'Sensurround', 'Italian');
insert into Format (FormatID, AudioType, Language) values (22, 'Sensurround', 'Spanish');
insert into Format (FormatID, AudioType, Language) values (23, 'Barco Auro 11.1', 'French');
insert into Format (FormatID, AudioType, Language) values (24, '3D Audio', 'German');
insert into Format (FormatID, AudioType, Language) values (25, 'IMAX', 'Italian');
insert into Format (FormatID, AudioType, Language) values (26, '3D Audio', 'French');
insert into Format (FormatID, AudioType, Language) values (27, 'Barco Auro 11.1', 'Mandarin');
insert into Format (FormatID, AudioType, Language) values (28, 'IMAX', 'French');
insert into Format (FormatID, AudioType, Language) values (29, 'Barco Auro 11.1', 'Italian');
insert into Format (FormatID, AudioType, Language) values (30, 'THX', 'Mandarin');
insert into Format (FormatID, AudioType, Language) values (31, 'Dolby Digital', 'Korean');
insert into Format (FormatID, AudioType, Language) values (32, 'IMAX', 'French');
insert into Format (FormatID, AudioType, Language) values (33, 'THX', 'French');
insert into Format (FormatID, AudioType, Language) values (34, 'Dolby Digital', 'Japanese');
insert into Format (FormatID, AudioType, Language) values (35, 'IMAX', 'Italian');
insert into Format (FormatID, AudioType, Language) values (36, 'IMAX', 'Italian');
insert into Format (FormatID, AudioType, Language) values (37, '3D Audio', 'Spanish');
insert into Format (FormatID, AudioType, Language) values (38, 'Ultra Stereo', 'Portuguese');
insert into Format (FormatID, AudioType, Language) values (39, 'Barco Auro 11.1', 'German');
insert into Format (FormatID, AudioType, Language) values (40, 'Ultra Stereo', 'French');
insert into Format (FormatID, AudioType, Language) values (41, 'Surround Sound', 'Mandarin');
insert into Format (FormatID, AudioType, Language) values (42, 'Barco Auro 11.1', 'Japanese');
insert into Format (FormatID, AudioType, Language) values (43, 'Ultra Stereo', 'Spanish');
insert into Format (FormatID, AudioType, Language) values (44, 'Atmos', 'Korean');
insert into Format (FormatID, AudioType, Language) values (45, 'DTS', 'Mandarin');
insert into Format (FormatID, AudioType, Language) values (46, 'Surround Sound', 'Mandarin');
insert into Format (FormatID, AudioType, Language) values (47, 'DTS', 'French');
insert into Format (FormatID, AudioType, Language) values (48, 'Barco Auro 11.1', 'English');
insert into Format (FormatID, AudioType, Language) values (49, 'Surround Sound', 'Spanish');
insert into Format (FormatID, AudioType, Language) values (50, 'Surround Sound', 'German');

-- Event
insert into Event (EventID, Type, Date, Description, CinemaID) values (1, 'Movie premiere', '11/11/2023', 'Movie-themed Murder Mystery Dinner', '37');
insert into Event (EventID, Type, Date, Description, CinemaID) values (2, 'Drive-in movie event', '9/29/2023', 'Sci-Fi Movie Marathon', '3');
insert into Event (EventID, Type, Date, Description, CinemaID) values (3, 'Movie-themed costume party', '8/20/2023', 'Fantasy Movie Scavenger Hunt', '12');
insert into Event (EventID, Type, Date, Description, CinemaID) values (4, 'Movie marathon', '6/3/2023', 'Action Movie Trivia Challenge', '14');
insert into Event (EventID, Type, Date, Description, CinemaID) values (5, 'Movie premiere', '5/11/2023', 'Romantic Comedy Movie Night', '47');
insert into Event (EventID, Type, Date, Description, CinemaID) values (6, 'Film festival screening', '10/20/2023', 'Sci-Fi Movie Marathon', '49');
insert into Event (EventID, Type, Date, Description, CinemaID) values (7, 'Movie-themed escape room', '4/15/2024', 'Superhero Costume Party', '34');
insert into Event (EventID, Type, Date, Description, CinemaID) values (8, 'Movie-themed costume party', '1/25/2024', 'Horror Movie Escape Room', '27');
insert into Event (EventID, Type, Date, Description, CinemaID) values (9, 'Movie marathon', '12/10/2023', 'Action Movie Trivia Challenge', '7');
insert into Event (EventID, Type, Date, Description, CinemaID) values (10, 'Movie-themed escape room', '8/9/2023', 'Classic Movie Double Feature', '20');
insert into Event (EventID, Type, Date, Description, CinemaID) values (11, 'Movie premiere', '1/30/2024', 'Hollywood Glamour Gala', '6');
insert into Event (EventID, Type, Date, Description, CinemaID) values (12, 'Movie-themed escape room', '10/30/2023', 'Movie-themed Murder Mystery Dinner', '50');
insert into Event (EventID, Type, Date, Description, CinemaID) values (13, 'Movie trivia night', '6/9/2023', 'Hollywood Glamour Gala', '17');
insert into Event (EventID, Type, Date, Description, CinemaID) values (14, 'Film festival screening', '4/6/2024', 'Sci-Fi Movie Marathon', '40');
insert into Event (EventID, Type, Date, Description, CinemaID) values (15, 'Film festival screening', '12/12/2023', 'Superhero Costume Party', '19');
insert into Event (EventID, Type, Date, Description, CinemaID) values (16, 'Outdoor movie night', '4/4/2024', 'Movie-themed Murder Mystery Dinner', '39');
insert into Event (EventID, Type, Date, Description, CinemaID) values (17, 'Drive-in movie event', '2/1/2024', 'Classic Movie Double Feature', '33');
insert into Event (EventID, Type, Date, Description, CinemaID) values (18, 'Movie-themed escape room', '1/17/2024', 'Horror Movie Escape Room', '41');
insert into Event (EventID, Type, Date, Description, CinemaID) values (19, 'Movie marathon', '1/11/2024', 'Hollywood Glamour Gala', '4');
insert into Event (EventID, Type, Date, Description, CinemaID) values (20, 'Movie-themed escape room', '12/13/2023', 'Classic Movie Double Feature', '32');
insert into Event (EventID, Type, Date, Description, CinemaID) values (21, 'Movie-themed cooking class', '5/6/2023', 'Horror Movie Escape Room', '28');
insert into Event (EventID, Type, Date, Description, CinemaID) values (22, 'Movie marathon', '9/3/2023', 'Animated Movie Sing-Along', '9');
insert into Event (EventID, Type, Date, Description, CinemaID) values (23, 'Movie-themed escape room', '7/20/2023', 'Sci-Fi Movie Marathon', '45');
insert into Event (EventID, Type, Date, Description, CinemaID) values (24, 'Movie-themed cooking class', '7/28/2023', 'Fantasy Movie Scavenger Hunt', '21');
insert into Event (EventID, Type, Date, Description, CinemaID) values (25, 'Movie-themed costume party', '6/13/2023', 'Romantic Comedy Movie Night', '38');
insert into Event (EventID, Type, Date, Description, CinemaID) values (26, 'Outdoor movie night', '12/29/2023', 'Fantasy Movie Scavenger Hunt', '11');
insert into Event (EventID, Type, Date, Description, CinemaID) values (27, 'Outdoor movie night', '7/26/2023', 'Sci-Fi Movie Marathon', '31');
insert into Event (EventID, Type, Date, Description, CinemaID) values (28, 'Outdoor movie night', '3/5/2024', 'Horror Movie Escape Room', '8');
insert into Event (EventID, Type, Date, Description, CinemaID) values (29, 'Movie-themed costume party', '8/11/2023', 'Romantic Comedy Movie Night', '22');
insert into Event (EventID, Type, Date, Description, CinemaID) values (30, 'Movie-themed escape room', '6/3/2023', 'Animated Movie Sing-Along', '16');
insert into Event (EventID, Type, Date, Description, CinemaID) values (31, 'Film festival screening', '8/16/2023', 'Classic Movie Double Feature', '18');
insert into Event (EventID, Type, Date, Description, CinemaID) values (32, 'Movie-themed escape room', '7/5/2023', 'Animated Movie Sing-Along', '30');
insert into Event (EventID, Type, Date, Description, CinemaID) values (33, 'Movie-themed escape room', '8/23/2023', 'Fantasy Movie Scavenger Hunt', '10');
insert into Event (EventID, Type, Date, Description, CinemaID) values (34, 'Film festival screening', '11/18/2023', 'Classic Movie Double Feature', '24');
insert into Event (EventID, Type, Date, Description, CinemaID) values (35, 'Outdoor movie night', '1/1/2024', 'Superhero Costume Party', '29');
insert into Event (EventID, Type, Date, Description, CinemaID) values (36, 'Drive-in movie event', '6/8/2023', 'Classic Movie Double Feature', '5');
insert into Event (EventID, Type, Date, Description, CinemaID) values (37, 'Outdoor movie night', '5/24/2023', 'Horror Movie Escape Room', '35');
insert into Event (EventID, Type, Date, Description, CinemaID) values (38, 'Film festival screening', '12/28/2023', 'Romantic Comedy Movie Night', '43');
insert into Event (EventID, Type, Date, Description, CinemaID) values (39, 'Movie-themed escape room', '8/22/2023', 'Hollywood Glamour Gala', '2');
insert into Event (EventID, Type, Date, Description, CinemaID) values (40, 'Film festival screening', '5/18/2023', 'Action Movie Trivia Challenge', '48');
insert into Event (EventID, Type, Date, Description, CinemaID) values (41, 'Film festival screening', '11/3/2023', 'Romantic Comedy Movie Night', '44');
insert into Event (EventID, Type, Date, Description, CinemaID) values (42, 'Movie marathon', '8/17/2023', 'Romantic Comedy Movie Night', '42');
insert into Event (EventID, Type, Date, Description, CinemaID) values (43, 'Movie-themed costume party', '8/12/2023', 'Animated Movie Sing-Along', '26');
insert into Event (EventID, Type, Date, Description, CinemaID) values (44, 'Movie-themed costume party', '9/11/2023', 'Romantic Comedy Movie Night', '23');
insert into Event (EventID, Type, Date, Description, CinemaID) values (45, 'Movie-themed escape room', '4/22/2023', 'Romantic Comedy Movie Night', '25');
insert into Event (EventID, Type, Date, Description, CinemaID) values (46, 'Film festival screening', '2/27/2024', 'Romantic Comedy Movie Night', '15');
insert into Event (EventID, Type, Date, Description, CinemaID) values (47, 'Outdoor movie night', '8/15/2023', 'Horror Movie Escape Room', '36');
insert into Event (EventID, Type, Date, Description, CinemaID) values (48, 'Movie-themed cooking class', '1/5/2024', 'Action Movie Trivia Challenge', '1');
insert into Event (EventID, Type, Date, Description, CinemaID) values (49, 'Movie premiere', '12/29/2023', 'Movie-themed Murder Mystery Dinner', '46');
insert into Event (EventID, Type, Date, Description, CinemaID) values (50, 'Movie-themed costume party', '9/4/2023', 'Classic Movie Double Feature', '13');

-- Cinema
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (1, 'Austin', 'Digital projection', 'Security checkpoints');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (2, 'Kansas City', 'Promotions', 'Restrooms');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (3, 'Seattle', 'Baby screenings', 'Ticket kiosks');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (4, 'Houston', 'Lounges', 'Ticket counters');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (5, 'Charlotte', 'Reclining seats', 'Coat check');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (6, 'Columbus', 'Clean facilities', 'Ticket kiosks');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (7, 'Seattle', 'Cinema bars', 'Ticket kiosks');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (8, 'Los Angeles', 'Concessions', 'Ticket counters');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (9, 'Indianapolis', 'IMAX screens', 'Emergency exits');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (10, 'Nashville', 'Cinema bars', 'Box office');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (11, 'Tulsa', 'Online ticket booking', 'Emergency exits');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (12, 'Wichita', 'Outdoor seating areas', 'Ticket counters');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (13, 'Albuquerque', 'Themed decorations', 'Waiting areas');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (14, 'Tulsa', 'Themed decorations', 'Ticket counters');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (15, 'Boston', 'IMAX screens', 'Restrooms');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (16, 'Kansas City', 'Concessions', 'Exit doors');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (17, 'San Antonio', 'Baby screenings', 'Restrooms');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (18, 'Fresno', 'Free refills on popcorn', 'Emergency exits');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (19, 'Fresno', 'VIP seating', 'Box office');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (20, 'Arlington', 'Special events', 'Security checkpoints');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (21, 'Louisville', 'Movie displays', 'Ticket counters');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (22, 'Tulsa', 'Special events', 'Ticket kiosks');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (23, 'Dallas', 'IMAX screens', 'Box office');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (24, 'New Orleans', 'Outdoor seating areas', 'Box office');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (25, 'New Orleans', 'Cinema bars', 'Restrooms');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (26, 'Denver', 'Free refills on popcorn', 'Ticket kiosks');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (27, 'Arlington', 'Interactive experiences', 'Lost and found');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (28, 'Fresno', 'Reclining seats', 'Box office');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (29, 'Atlanta', 'Movie displays', 'Lost and found');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (30, 'Omaha', 'IMAX screens', 'Ticket counters');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (31, 'Minneapolis', 'Movie trivia in the lobby', 'Ticket kiosks');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (32, 'Atlanta', 'High-quality sound systems', 'Information desks');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (33, 'Austin', 'Reserved seating', 'Lobby');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (34, 'Chicago', 'Member loyalty programs', 'Restrooms');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (35, 'Washington', '3D screens', 'Ticket kiosks');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (36, 'Seattle', 'Movie displays', 'Security checkpoints');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (37, 'Raleigh', 'Movie trivia in the lobby', 'Ticket counters');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (38, 'Tulsa', 'Private screening rooms', 'Emergency exits');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (39, 'Cleveland', 'Digital projection', 'Lost and found');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (40, 'Chicago', 'High-quality sound systems', 'Coat check');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (41, 'El Paso', 'Interactive experiences', 'Emergency exits');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (42, 'Indianapolis', 'Merchandise', 'Cleaning stations');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (43, 'Oklahoma City', 'High-quality sound systems', 'Coat check');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (44, 'Albuquerque', 'Digital projection', 'Exit doors');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (45, 'Phoenix', 'VIP seating', 'Box office');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (46, 'San Jose', 'Parent screenings', 'Ticket kiosks');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (47, 'Louisville', 'Child-friendly amenities (e.g. booster seats)', 'Emergency exits');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (48, 'Columbus', 'Movie displays', 'Ticket kiosks');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (49, 'Indianapolis', 'Movie displays', 'Lobby');
insert into Cinema (CinemaID, Location, Amenities, Facilities) values (50, 'Wichita', 'Premium seating', 'Information desks');

-- Booking
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (1, 62.01, 1, 1, '1');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (2, 97.38, 2, 2, '2');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (3, 16.89, 3, 3, '3');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (4, 91.29, 4, 4, '4');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (5, 36.75, 5, 5, '5');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (6, 77.69, 6, 6, '6');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (7, 29.68, 7, 7, '7');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (8, 53.64, 8, 8, '8');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (9, 8.08, 9, 9, '9');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (10, 96.15, 10, 10, '10');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (11, 26.87, 11, 11, '11');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (12, 47.98, 12, 12, '12');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (13, 44.52, 13, 13, '13');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (14, 21.92, 14, 14, '14');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (15, 35.13, 15, 15, '15');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (16, 48.18, 16, 16, '16');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (17, 67.0, 17, 17, '17');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (18, 98.77, 18, 18, '18');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (19, 76.31, 19, 19, '19');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (20, 7.76, 20, 20, '20');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (21, 93.32, 21, 21, '21');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (22, 75.3, 22, 22, '22');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (23, 28.9, 23, 23, '23');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (24, 38.97, 24, 24, '24');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (25, 66.46, 25, 25, '25');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (26, 54.69, 26, 26, '26');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (27, 11.17, 27, 27, '27');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (28, 90.28, 28, 28, '28');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (29, 2.88, 29, 29, '29');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (30, 9.36, 30, 30, '30');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (31, 29.08, 31, 31, '31');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (32, 48.05, 32, 32, '32');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (33, 62.39, 33, 33, '33');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (34, 78.02, 34, 34, '34');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (35, 22.21, 35, 35, '35');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (36, 97.97, 36, 36, '36');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (37, 73.77, 37, 37, '37');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (38, 92.49, 38, 38, '38');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (39, 48.16, 39, 39, '39');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (40, 44.89, 40, 40, '40');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (41, 45.77, 41, 41, '41');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (42, 75.02, 42, 42, '42');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (43, 66.46, 43, 43, '43');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (44, 79.79, 44, 44, '44');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (45, 27.38, 45, 45, '45');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (46, 86.02, 46, 46, '46');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (47, 32.71, 47, 47, '47');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (48, 49.43, 48, 48, '48');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (49, 32.89, 49, 49, '49');
insert into Booking (BookingID, Price, UserID, ShowingID, SeatID) values (50, 42.15, 50, 50, '50');

