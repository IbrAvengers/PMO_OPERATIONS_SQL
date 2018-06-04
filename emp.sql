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
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
