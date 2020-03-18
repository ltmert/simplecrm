# ************************************************************
# SQL Installation File
# Version 1.0
#
#
# Host: localhost (MySQL 5.5.5-10.1.9-MariaDB-log)
# Database: simple_crm
# Generation Time: 2020-03-17 23:33:07 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table contact
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contact`;

CREATE TABLE `contact` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Contact_Title` varchar(30) DEFAULT NULL,
  `Contact_First` varchar(5) NOT NULL,
  `Contact_Middle` varchar(30) DEFAULT NULL,
  `Contact_Last` varchar(8) NOT NULL,
  `Contact_Nickname` varchar(8) NOT NULL,
  `Lead_Referral_Source` varchar(23) NOT NULL,
  `Date_of_Initial_Contact` date NOT NULL,
  `Title` varchar(20) NOT NULL,
  `Company` varchar(16) NOT NULL,
  `Sector` varchar(12) NOT NULL,
  `Address` varchar(38) NOT NULL,
  `Address_Street_1` varchar(17) NOT NULL,
  `Address_Street_2` varchar(30) DEFAULT NULL,
  `Address_City` varchar(12) NOT NULL,
  `Address_State` char(2) NOT NULL DEFAULT '',
  `Address_Zip` int(11) NOT NULL,
  `Address_Country` varchar(30) DEFAULT NULL,
  `Phone` varchar(14) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Status` int(11) unsigned NOT NULL,
  `Website` varchar(23) NOT NULL,
  `LinkedIn_Profile` varchar(21) NOT NULL,
  `Background_Info` text NOT NULL,
  `Sales_Rep` int(11) unsigned NOT NULL,
  `Affinity` decimal(4,2) NOT NULL,
  `Project_Type` varchar(35) DEFAULT NULL,
  `Project_Description` tinytext,
  `Proposal_Due_Date` date DEFAULT NULL,
  `Budget` decimal(10,2) DEFAULT NULL,
  `Deliverables` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_SALES_REP` (`Sales_Rep`),
  KEY `FK_STATUS` (`Status`),
  CONSTRAINT `FK_SALES_REP` FOREIGN KEY (`Sales_Rep`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_STATUS` FOREIGN KEY (`Status`) REFERENCES `contact_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;

INSERT INTO `contact` (`id`, `Contact_Title`, `Contact_First`, `Contact_Middle`, `Contact_Last`, `Lead_Referral_Source`, `Date_of_Initial_Contact`, `Title`, `Company`, `Industry`, `Address`, `Address_Street_1`, `Address_Street_2`, `Address_City`, `Address_State`, `Address_Zip`, `Address_Country`, `Phone`, `Email`, `Status`, `Website`, `LinkedIn_Profile`, `Background_Info`, `Sales_Rep`, `Rating`, `Project_Type`, `Project_Description`, `Proposal_Due_Date`, `Budget`, `Deliverables`)
VALUES
	(1,');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;
# Dump of table contact_status
# ------------------------------------------------------------
DROP TABLE IF EXISTS `contact_status`;
CREATE TABLE `contact_status` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `contact_status` WRITE;
/*!40000 ALTER TABLE `contact_status` DISABLE KEYS */;
INSERT INTO `contact_status` (`id`, `status`)
VALUES
	(1,'lead'),
	(2,'opportunity'),
	(3,'customers'),
	(4,'archive');
/*!40000 ALTER TABLE `contact_status` ENABLE KEYS */;
UNLOCK TABLES;
# Dump of table notes
# ------------------------------------------------------------
DROP TABLE IF EXISTS `notes`;
CREATE TABLE `notes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT NULL,
  `Notes` tinytext,
  `Is_New_Todo` int(11) unsigned NOT NULL,
  `Todo_Type_ID` int(11) unsigned NOT NULL,
  `Todo_Desc_ID` int(11) unsigned NOT NULL,
  `Todo_Due_Date` varchar(29) DEFAULT NULL,
  `Contact` int(11) unsigned NOT NULL,
  `Task_Status` int(11) unsigned NOT NULL,
  `Task_Update` varchar(51) DEFAULT NULL,
  `Sales_Rep` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_EVENT_NAME` (`Todo_Type_ID`),
  KEY `FK_EVENT_TYPE` (`Todo_Desc_ID`),
  KEY `FK_CONTACT_ID` (`Contact`),
  KEY `FK_SALES_ID` (`Sales_Rep`),
  KEY `FK_TASK_STATUS` (`Task_Status`),
  CONSTRAINT `FK_CONTACT_ID` FOREIGN KEY (`Contact`) REFERENCES `contact` (`id`),
  CONSTRAINT `FK_EVENT_NAME` FOREIGN KEY (`Todo_Type_ID`) REFERENCES `todo_type` (`id`),
  CONSTRAINT `FK_EVENT_TYPE` FOREIGN KEY (`Todo_Desc_ID`) REFERENCES `todo_desc` (`id`),
  CONSTRAINT `FK_SALES_ID` FOREIGN KEY (`Sales_Rep`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_TASK_STATUS` FOREIGN KEY (`Task_Status`) REFERENCES `task_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` (`id`, `Date`, `Notes`, `Is_New_Todo`, `Todo_Type_ID`, `Todo_Desc_ID`, `Todo_Due_Date`, `Contact`, `Task_Status`, `Task_Update`, `Sales_Rep`)
VALUES
	(1,');
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;
# Dump of table roles
# ------------------------------------------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `role`)
VALUES
	(1,'Sales Rep'),
	(2,'Sales Manager'),
	(3,'Admin');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
# Dump of table task_status
# ------------------------------------------------------------
DROP TABLE IF EXISTS `task_status`;
CREATE TABLE `task_status` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `task_status` WRITE;
/*!40000 ALTER TABLE `task_status` DISABLE KEYS */;
INSERT INTO `task_status` (`id`, `status`)
VALUES
	(1,'pending'),
  (2,'in positive progress')
  (3,'in negative progress')
  (4,'not completed')
	(5,'completed');
/*!40000 ALTER TABLE `task_status` ENABLE KEYS */;
UNLOCK TABLES;
# Dump of table todo_desc
# ------------------------------------------------------------
DROP TABLE IF EXISTS `todo_desc`;
CREATE TABLE `todo_desc` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `todo_desc` WRITE;
/*!40000 ALTER TABLE `todo_desc` DISABLE KEYS */;
INSERT INTO `todo_desc` (`id`, `description`)
VALUES
	(1,'Follow Up Email'),
	(2,'Phone Call'),
	(3,'Face to Face Meeting'),
	(4,'On Site Demo'),
	(5,'Meetup'),
	(6,'Event'),
	(7,'Others');
/*!40000 ALTER TABLE `todo_desc` ENABLE KEYS */;
UNLOCK TABLES;
# Dump of table todo_type
# ------------------------------------------------------------
DROP TABLE IF EXISTS `todo_type`;
CREATE TABLE `todo_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `todo_type` WRITE;
/*!40000 ALTER TABLE `todo_type` DISABLE KEYS */;
INSERT INTO `todo_type` (`id`, `type`)
VALUES
	(1,'task'),
	(2,'meeting');
/*!40000 ALTER TABLE `todo_type` ENABLE KEYS */;
UNLOCK TABLES;
# Dump of table user_status
# ------------------------------------------------------------
DROP TABLE IF EXISTS `user_status`;
CREATE TABLE `user_status` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `user_status` WRITE;
/*!40000 ALTER TABLE `user_status` DISABLE KEYS */;
INSERT INTO `user_status` (`id`, `status`)
VALUES
	(1,'active'),
	(2,'inactive'),
	(3,'pending approval');
/*!40000 ALTER TABLE `user_status` ENABLE KEYS */;
UNLOCK TABLES;
# Dump of table users
# ------------------------------------------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Name_Title` varchar(30) DEFAULT NULL,
  `Name_First` varchar(6) NOT NULL,
  `Name_Middle` varchar(30) DEFAULT NULL,
  `Name_Last` varchar(8) NOT NULL,
  `Email` varchar(16) NOT NULL,
  `Password` varchar(9) NOT NULL,
  `User_Roles` int(11) unsigned NOT NULL,
  `User_Status` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_USER_STATUS` (`User_Status`),
  KEY `FK_ROLE` (`User_Roles`),
  CONSTRAINT `FK_ROLE` FOREIGN KEY (`User_Roles`) REFERENCES `roles` (`id`),
  CONSTRAINT `FK_USER_STATUS` FOREIGN KEY (`User_Status`) REFERENCES `user_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `Name_Title`, `Name_First`, `Name_Middle`, `Name_Last`, `Email`, `Password`, `User_Roles`, `User_Status`)
VALUES
	(1,);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
