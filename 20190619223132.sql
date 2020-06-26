/*
MySQL Backup
Database: bookmanage
Backup Time: 2019-06-19 22:31:32
*/

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `bookmanage`.`admin`;
DROP TABLE IF EXISTS `bookmanage`.`book`;
DROP TABLE IF EXISTS `bookmanage`.`history`;
DROP TABLE IF EXISTS `bookmanage`.`reader`;
CREATE TABLE `admin` (
  `admin_id` varchar(20) NOT NULL,
  `admin_name` varchar(20) NOT NULL,
  `admin_pwd` varchar(20) NOT NULL,
  `admin_phone` int(11) NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `Admin_admin_name_uindex` (`admin_name`),
  UNIQUE KEY `Admin_admin_phone_uindex` (`admin_phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `book` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_isbn` int(250) NOT NULL DEFAULT '1',
  `book_name` varchar(30) NOT NULL,
  `book_author` varchar(20) NOT NULL,
  `book_press` varchar(50) NOT NULL,
  `book_type` varchar(20) NOT NULL,
  `book_count` int(30) NOT NULL,
  `book_remain_count` int(11) DEFAULT NULL,
  `book_money` int(11) DEFAULT NULL,
  PRIMARY KEY (`book_isbn`),
  UNIQUE KEY `book_book_id_uindex` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
CREATE TABLE `history` (
  `number` int(255) NOT NULL AUTO_INCREMENT,
  `reader_number` varchar(30) NOT NULL,
  `reader_name` varchar(30) NOT NULL,
  `book_name` varchar(50) DEFAULT NULL,
  `book_isbn` varchar(50) NOT NULL,
  `reader_rent_date` varchar(100) NOT NULL,
  PRIMARY KEY (`number`),
  UNIQUE KEY `number_isbn` (`reader_number`,`book_isbn`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
CREATE TABLE `reader` (
  `reader_number` varchar(30) NOT NULL,
  `reader_name` varchar(30) NOT NULL,
  `reader_pwd` varchar(33) NOT NULL,
  `reader_dept` varchar(50) NOT NULL,
  `reader_major` varchar(30) NOT NULL,
  `reader_class` varchar(20) NOT NULL,
  `reader_phone` varchar(11) NOT NULL,
  `reader_sex` varchar(10) NOT NULL,
  `reader_birthday` varchar(50) DEFAULT NULL,
  `reader_age` varchar(11) NOT NULL,
  `reader_email` varchar(50) DEFAULT NULL,
  `book_isbn` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`reader_number`),
  UNIQUE KEY `Reader_reader_number_uindex` (`reader_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
BEGIN;
LOCK TABLES `bookmanage`.`admin` WRITE;
DELETE FROM `bookmanage`.`admin`;
INSERT INTO `bookmanage`.`admin` (`admin_id`,`admin_name`,`admin_pwd`,`admin_phone`) VALUES ('T1', 'admin', '110112', 1234567890);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `bookmanage`.`book` WRITE;
DELETE FROM `bookmanage`.`book`;
INSERT INTO `bookmanage`.`book` (`book_id`,`book_isbn`,`book_name`,`book_author`,`book_press`,`book_type`,`book_count`,`book_remain_count`,`book_money`) VALUES (1, 123456789, 'C??', '?????', '??????', '????', 30, 29, 100),(2, 147258369, 'java', 'bj', 'bx', '????', 20, 19, 100);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `bookmanage`.`history` WRITE;
DELETE FROM `bookmanage`.`history`;
INSERT INTO `bookmanage`.`history` (`number`,`reader_number`,`reader_name`,`book_name`,`book_isbn`,`reader_rent_date`) VALUES (28, 'R2', '???', 'C??', '123456789', '2019-4-29 15:28:51'),(29, 'R1', '110112', 'java', '147258369', '2019-4-29 15:29:01');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `bookmanage`.`reader` WRITE;
DELETE FROM `bookmanage`.`reader`;
INSERT INTO `bookmanage`.`reader` (`reader_number`,`reader_name`,`reader_pwd`,`reader_dept`,`reader_major`,`reader_class`,`reader_phone`,`reader_sex`,`reader_birthday`,`reader_age`,`reader_email`,`book_isbn`) VALUES ('T1234', '??', 'f2dbc251454c5c92365bc08be58bca7d', '???', '????', 'B1243', '13344343445', '?', '1998-1-1', '22', '12@qq.com', NULL);
UNLOCK TABLES;
COMMIT;
