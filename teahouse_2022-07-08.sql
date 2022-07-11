/*
SQLyog Professional v13.1.1 (64 bit)
MySQL - 5.7.24 : Database - teahouse
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`teahouse` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `teahouse`;

/*Table structure for table `codes` */

DROP TABLE IF EXISTS `codes`;

CREATE TABLE `codes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `code` int(10) DEFAULT NULL,
  `store_id` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `codes` */

insert  into `codes`(`id`,`user_id`,`code`,`store_id`) values
(1,2,123,2),
(2,3,124,3),
(3,3,125,3),
(4,4,126,1),
(5,5,127,1),
(6,6,128,1),
(7,7,129,1),
(8,8,130,1),
(9,9,131,1),
(10,10,132,1),
(11,12,133,1);

/*Table structure for table `gifts` */

DROP TABLE IF EXISTS `gifts`;

CREATE TABLE `gifts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `quantity` int(3) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `gifts` */

insert  into `gifts`(`id`,`name`,`quantity`,`image`) values
(1,'Iphone',2,'https://static.mservice.io/blogscontents/momo-upload-api-210108171524-637457229244489387.png'),
(2,'Một triệu tiền mặt',34,'https://vnn-imgs-a1.vgcloud.vn/image1.ictnews.vn/_Files/2020/04/15/1053x525-01_600x315.jpg'),
(3,'Balo',58,'https://idp.vn/wp-content/uploads/2020/02/KV-ch%C6%B0%C6%A1ng-tr%C3%ACnh-Quang-H%E1%BA%A3i.jpg');

/*Table structure for table `reports` */

DROP TABLE IF EXISTS `reports`;

CREATE TABLE `reports` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(100) DEFAULT NULL,
  `meta_value` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `reports` */

insert  into `reports`(`id`,`meta_key`,`meta_value`) values
(1,'received_user','6');

/*Table structure for table `rewards` */

DROP TABLE IF EXISTS `rewards`;

CREATE TABLE `rewards` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `gift_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone_number` varchar(10) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`email`,`phone_number`,`password`,`point`) values 
(1,'user01@gmail.com','0915111111','$2y$10$tS4QB1.hHQMgFxGYTbRhqewjAHP4XEgJFZT8.PcB59ikPPlHaThEK',8),
(2,'user02@gmail.com','0915111112','$2y$10$MC/hSafjts4KOiYRc18vBOAbjNrrrGTStV7EB/oJP9/lme0ny0Khq',5),
(3,'user03@gmail.com','0915111113','$2y$10$MC/hSafjts4KOiYRc18vBOAbjNrrrGTStV7EB/oJP9/lme0ny0Khq',4),
(4,'user04@gmail.com','0915111114','$2y$10$MC/hSafjts4KOiYRc18vBOAbjNrrrGTStV7EB/oJP9/lme0ny0Khq',0),
(5,'user05@gmail.com','0915111115','$2y$10$MC/hSafjts4KOiYRc18vBOAbjNrrrGTStV7EB/oJP9/lme0ny0Khq',0),
(6,'user06@gmail.com','0915111116','$2y$10$MC/hSafjts4KOiYRc18vBOAbjNrrrGTStV7EB/oJP9/lme0ny0Khq',0),
(7,'user07@gmail.com','0915111117','$2y$10$MC/hSafjts4KOiYRc18vBOAbjNrrrGTStV7EB/oJP9/lme0ny0Khq',0),
(8,'user08@gmail.com','0915111118','$2y$10$MC/hSafjts4KOiYRc18vBOAbjNrrrGTStV7EB/oJP9/lme0ny0Khq',0),
(9,'user09@gmail.com','0915111119','$2y$10$MC/hSafjts4KOiYRc18vBOAbjNrrrGTStV7EB/oJP9/lme0ny0Khq',0),
(10,'user10@gmail.com','0915111129','$2y$10$MC/hSafjts4KOiYRc18vBOAbjNrrrGTStV7EB/oJP9/lme0ny0Khq',0),
(11,'user11@gmail.com','0915111139','$2y$10$MC/hSafjts4KOiYRc18vBOAbjNrrrGTStV7EB/oJP9/lme0ny0Khq',0),
(12,'user12@gmail.com','0915111149','$2y$10$MC/hSafjts4KOiYRc18vBOAbjNrrrGTStV7EB/oJP9/lme0ny0Khq',0),
(13,'user13@gmail.com','0915111159','$2y$10$MC/hSafjts4KOiYRc18vBOAbjNrrrGTStV7EB/oJP9/lme0ny0Khq',0),
(14,'user14@gmail.com','0915111169','$2y$10$MC/hSafjts4KOiYRc18vBOAbjNrrrGTStV7EB/oJP9/lme0ny0Khq',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
