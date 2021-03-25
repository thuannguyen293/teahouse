# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.7.25)
# Database: teahouse
# Generation Time: 2021-03-25 10:00:32 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table gifts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gifts`;

CREATE TABLE `gifts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `quantity` int(3) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `gifts` WRITE;
/*!40000 ALTER TABLE `gifts` DISABLE KEYS */;

INSERT INTO `gifts` (`id`, `name`, `quantity`, `image`)
VALUES
	(1,'Iphone',2,'https://static.mservice.io/blogscontents/momo-upload-api-210108171524-637457229244489387.png'),
	(2,'Một triệu tiền mặt',35,'https://vnn-imgs-a1.vgcloud.vn/image1.ictnews.vn/_Files/2020/04/15/1053x525-01_600x315.jpg'),
	(3,'Balo',63,'https://idp.vn/wp-content/uploads/2020/02/KV-ch%C6%B0%C6%A1ng-tr%C3%ACnh-Quang-H%E1%BA%A3i.jpg');

/*!40000 ALTER TABLE `gifts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table points
# ------------------------------------------------------------

DROP TABLE IF EXISTS `points`;

CREATE TABLE `points` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(10) NOT NULL DEFAULT '',
  `point` int(11) NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `store_id` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `points` WRITE;
/*!40000 ALTER TABLE `points` DISABLE KEYS */;

INSERT INTO `points` (`id`, `phone_number`, `point`, `code`, `store_id`)
VALUES
	(1,'0915111111',8,NULL,1),
	(2,'0915111112',5,'123',2),
	(3,'0915111113',4,'124,125',3),
	(4,'0915111114',1,'',1),
	(5,'0915111115',1,'',1),
	(6,'0915111116',1,'',1),
	(7,'0915111117',1,'',1);

/*!40000 ALTER TABLE `points` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table reports
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reports`;

CREATE TABLE `reports` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(100) DEFAULT NULL,
  `meta_value` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;

INSERT INTO `reports` (`id`, `meta_key`, `meta_value`)
VALUES
	(1,'received_user','0');

/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rewards
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rewards`;

CREATE TABLE `rewards` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `gift_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone_number` varchar(10) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `email`, `phone_number`, `password`)
VALUES
	(2,'user01@gmail.com','0915111111','$2y$10$tS4QB1.hHQMgFxGYTbRhqewjAHP4XEgJFZT8.PcB59ikPPlHaThEK'),
	(3,'user02@gmail.com','0915111112','$2y$10$MC/hSafjts4KOiYRc18vBOAbjNrrrGTStV7EB/oJP9/lme0ny0Khq'),
	(4,'user03@gmail.com','0915111113','$2y$10$MC/hSafjts4KOiYRc18vBOAbjNrrrGTStV7EB/oJP9/lme0ny0Khq'),
	(5,'user04@gmail.com','0915111114','$2y$10$MC/hSafjts4KOiYRc18vBOAbjNrrrGTStV7EB/oJP9/lme0ny0Khq'),
	(6,'user05@gmail.com','0915111115','$2y$10$MC/hSafjts4KOiYRc18vBOAbjNrrrGTStV7EB/oJP9/lme0ny0Khq'),
	(7,'user06@gmail.com','0915111116','$2y$10$MC/hSafjts4KOiYRc18vBOAbjNrrrGTStV7EB/oJP9/lme0ny0Khq'),
	(8,'user07@gmail.com','0915111117','$2y$10$MC/hSafjts4KOiYRc18vBOAbjNrrrGTStV7EB/oJP9/lme0ny0Khq');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
