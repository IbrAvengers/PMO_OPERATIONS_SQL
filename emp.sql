-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               10.2.6-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for pocdb
CREATE DATABASE IF NOT EXISTS `pocdb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `pocdb`;

-- Dumping structure for table pocdb.dept
CREATE TABLE IF NOT EXISTS `dept` (
  `deptid` varchar(255) NOT NULL,
  `dept` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`deptid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table pocdb.dept: 1 rows
/*!40000 ALTER TABLE `dept` DISABLE KEYS */;
INSERT INTO `dept` (`deptid`, `dept`) VALUES
	('IT', 'Java');
/*!40000 ALTER TABLE `dept` ENABLE KEYS */;

-- Dumping structure for table pocdb.employee
CREATE TABLE IF NOT EXISTS `employee` (
  `id` int(50) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table pocdb.employee: ~2 rows (approximately)
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` (`id`, `name`) VALUES
	(100, 'AAA'),
	(101, 'BBB');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;

-- Dumping structure for table pocdb.employee_details
CREATE TABLE IF NOT EXISTS `employee_details` (
  `emp_id` varchar(50) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT 1,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `ibm_mail_id` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `ph_number` varchar(255) NOT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table pocdb.employee_details: ~3 rows (approximately)
/*!40000 ALTER TABLE `employee_details` DISABLE KEYS */;
INSERT INTO `employee_details` (`emp_id`, `enabled`, `first_name`, `last_name`, `ibm_mail_id`, `password`, `ph_number`) VALUES
	('admin', 1, 'admin', 'admin', 'admin@in.ibm.com', '$2a$10$d8027AsDTYYFWWDvhiS27u3m8RPq3zhOwd91FP5jT6Xvqyd2X5cya', '9999999999'),
	('manager', 1, 'kappa', 'ram', 'ramkappa@in.ibm.com', '$2a$10$3TVTQLsHGhmWszpDwB6z7uvqWWhON3QuCFR369/cfBhaD5YX4SuUC', '9532552662'),
	('usr1', 1, 'usr', '1', 'usr1@in.ibm.com', '$2a$10$3lMsX/3YccZISOf3DJOKge8zOtO6WDAr40G3dYGzOR5LzNBX2tASG', '9999999999');
/*!40000 ALTER TABLE `employee_details` ENABLE KEYS */;

-- Dumping structure for table pocdb.employee_roles
CREATE TABLE IF NOT EXISTS `employee_roles` (
  `role_id` int(11) NOT NULL,
  `emp_id` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`role_id`),
  KEY `FK_employee_roles_employee_details` (`emp_id`),
  CONSTRAINT `FK_employee_roles_employee_details` FOREIGN KEY (`emp_id`) REFERENCES `employee_details` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table pocdb.employee_roles: ~3 rows (approximately)
/*!40000 ALTER TABLE `employee_roles` DISABLE KEYS */;
INSERT INTO `employee_roles` (`role_id`, `emp_id`, `role`) VALUES
	(1, 'admin', 'ROLE_ADMIN'),
	(2, 'usr1', 'ROLE_USER'),
	(3, 'manager', 'ROLE_MANAGER');
/*!40000 ALTER TABLE `employee_roles` ENABLE KEYS */;

-- Dumping structure for table pocdb.hibernate_sequence
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table pocdb.hibernate_sequence: ~1 rows (approximately)
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` (`next_val`) VALUES
	(2);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;

-- Dumping structure for table pocdb.teacher
CREATE TABLE IF NOT EXISTS `teacher` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `salary` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table pocdb.teacher: ~3 rows (approximately)
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` (`id`, `name`, `salary`) VALUES
	(1, 'aaaa', 10000),
	(2, 'bbbb', 10000),
	(2, 'cccc', 10000);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;

-- Dumping structure for table pocdb.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table pocdb.user: ~1 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `name`) VALUES
	(1, 'AAA');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Dumping structure for table pocdb.users
CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table pocdb.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`username`, `password`, `enabled`) VALUES
	('adm1', '$2a$10$BtspKRPlqjs6/EYOnzaS2uhU3tWd3i9/7MdcxioKS4AqT93lkyI9u', 1),
	('usr1', '$2a$10$335D2EXcKIpbNIxPghinLOCQqLe.L6VZWNFZeULxcmGb6Y4PuEqDW', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table pocdb.user_login
CREATE TABLE IF NOT EXISTS `user_login` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `deptid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `FKlcw5160u1qkhl99qo50f7w2ns` (`deptid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table pocdb.user_login: 1 rows
/*!40000 ALTER TABLE `user_login` DISABLE KEYS */;
INSERT INTO `user_login` (`username`, `password`, `deptid`) VALUES
	('usr4', 'pwd1', 'IT');
/*!40000 ALTER TABLE `user_login` ENABLE KEYS */;

-- Dumping structure for table pocdb.user_login2
CREATE TABLE IF NOT EXISTS `user_login2` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table pocdb.user_login2: ~1 rows (approximately)
/*!40000 ALTER TABLE `user_login2` DISABLE KEYS */;
INSERT INTO `user_login2` (`userid`, `password`) VALUES
	(5, 'pwd af');
/*!40000 ALTER TABLE `user_login2` ENABLE KEYS */;

-- Dumping structure for table pocdb.user_roles
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`user_role_id`),
  UNIQUE KEY `uni_username_role` (`role`,`username`),
  KEY `fk_username_idx` (`username`),
  CONSTRAINT `fk_username` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table pocdb.user_roles: ~2 rows (approximately)
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` (`user_role_id`, `username`, `role`) VALUES
	(2, 'adm1', 'ROLE_ADMIN'),
	(1, 'usr1', 'ROLE_USER');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
