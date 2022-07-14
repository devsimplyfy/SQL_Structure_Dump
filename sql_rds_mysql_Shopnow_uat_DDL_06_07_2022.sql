/*
SQLyog Community v12.5.0 (64 bit)
MySQL - 5.7.22 : Database - shopnow_uat
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shopnow_uat` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `shopnow_uat`;

/*Table structure for table `Customer_Authentication` */

DROP TABLE IF EXISTS `Customer_Authentication`;

CREATE TABLE `Customer_Authentication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `accessToken` text NOT NULL,
  `idToken` text NOT NULL,
  `refreshToken` text,
  `status` varchar(15) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `Customer_Authentication` */

/*Table structure for table `Student` */

DROP TABLE IF EXISTS `Student`;

CREATE TABLE `Student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `value` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=488 DEFAULT CHARSET=latin1;

/*Data for the table `Student` */

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` int(11) NOT NULL,
  `type_billing_shipping` varchar(250) NOT NULL,
  `firstName` varchar(200) NOT NULL,
  `lastName` varchar(200) NOT NULL,
  `address1` varchar(250) NOT NULL,
  `address2` varchar(250) DEFAULT NULL,
  `address3` varchar(250) DEFAULT NULL,
  `city` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL,
  `country` varchar(200) NOT NULL,
  `phoneNumber` varchar(100) NOT NULL,
  `isPrimary` int(11) NOT NULL,
  `pincode` int(20) DEFAULT NULL,
  `email_address` varchar(100) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL DEFAULT '-1',
  `modified_by` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `fk_created_by` (`created_by`),
  KEY `fk_modified_by` (`modified_by`),
  CONSTRAINT `fk_created_by` FOREIGN KEY (`created_by`) REFERENCES `customers` (`id`),
  CONSTRAINT `fk_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=631 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Data for the table `address` */

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `username` varchar(36) NOT NULL,
  `password` varchar(36) NOT NULL,
  `isadmin` int(50) DEFAULT NULL,
  `emailid` text NOT NULL,
  `isactive` int(2) NOT NULL,
  `is_external` int(11) NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

insert  into `admin`(`id`,`name`,`username`,`password`,`isadmin`,`emailid`,`isactive`,`is_external`,`image`,`created_date`,`modified_date`,`created_by`,`modified_by`) values 
(1,'Flipkart','','',0,'flipkart@co.in',1,1,'https://vendorimage.s3.us-east-2.amazonaws.com/flipkart_logo_detail.jpg','2019-11-22 10:00:48','2019-11-22 10:00:54',NULL,NULL),
(2,'ShopNow','','',1,'shopnow@co.in',1,0,'https://vendorimage.s3.us-east-2.amazonaws.com/shopnow.png','2019-11-23 16:19:37','2019-11-23 16:19:41',NULL,NULL),
(3,'Amazon','','',0,'amazon.co.in',1,1,'https://amazon.in','2019-12-26 11:52:54','2019-12-26 11:52:58',NULL,NULL),
(4,'ShopnowPantry','','',1,'ShopnowPantry@gmail.com',1,1,'https://buckimage.s3.us-east-2.amazonaws.com/1603332870040.jpeg','2020-07-22 09:34:55','2020-10-22 02:14:30',NULL,-1),
(8,'Myntry','','',1,'Myntry@gmail.com',1,1,'https://buckimage.s3.us-east-2.amazonaws.com/1603341178538.jpeg','2020-10-22 03:21:12','2020-10-22 05:07:58',-1,-1),
(9,'Myntra','myntraIww','Test@123',0,'myntra@co.org',1,1,'https://buckimage.s3.us-east-2.amazonaws.com/1603340573392.jpeg','2020-10-22 04:18:23','2020-10-22 04:23:02',-1,-1),
(10,'sabyasachi coutoure','sabyasachiIww','Test@123',0,'',0,1,'','2020-10-22 05:22:40','2020-10-22 05:23:10',-1,-1);

/*Table structure for table `attributes` */

DROP TABLE IF EXISTS `attributes`;

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL,
  `att_group_name` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`att_group_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `attributes` */

insert  into `attributes`(`id`,`att_group_name`,`status`,`created_date`,`modified_date`,`created_by`,`modified_by`) values 
(1,'size','1','2020-04-08 05:37:57','2020-04-08 05:37:57',NULL,NULL),
(2,'color','1','2020-04-08 05:37:57','2020-04-08 05:37:57',NULL,NULL),
(3,'sizeUnit','1','2020-04-08 05:37:57','2020-04-08 05:37:57',NULL,NULL),
(4,'displaySize','1','2020-04-08 05:37:57','2020-04-08 05:37:57',NULL,NULL),
(5,'storage','1','2020-04-08 05:37:57','2020-04-08 05:37:57',NULL,NULL),
(6,'color1','1','2020-10-14 04:20:20','2020-10-14 04:20:20',-1,-1),
(7,'retr','-1','2020-10-14 10:38:52','2020-10-14 10:38:52',-1,1);

/*Table structure for table `attributes_value` */

DROP TABLE IF EXISTS `attributes_value`;

CREATE TABLE `attributes_value` (
  `id` bigint(255) NOT NULL,
  `att_group_id` int(11) NOT NULL,
  `att_value` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `color_code` varchar(50) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE_ATT_VAL` (`att_value`),
  KEY `fk_att` (`att_group_id`),
  CONSTRAINT `fk_att` FOREIGN KEY (`att_group_id`) REFERENCES `attributes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `attributes_value` */

/*Table structure for table `banners` */

DROP TABLE IF EXISTS `banners`;

CREATE TABLE `banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `image` varchar(300) NOT NULL,
  `status` varchar(50) NOT NULL,
  `show_homepage` varchar(100) NOT NULL,
  `product_ids` text,
  `products` text,
  `deal` text,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `banners` */

/*Table structure for table `best_product` */

DROP TABLE IF EXISTS `best_product`;

CREATE TABLE `best_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT '-1',
  `modified_by` int(11) DEFAULT '-1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unic_key` (`product_id`,`type`),
  KEY `fk` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Data for the table `best_product` */

/*Table structure for table `candidates` */

DROP TABLE IF EXISTS `candidates`;

CREATE TABLE `candidates` (
  `id` int(4) NOT NULL,
  `position` varchar(20) DEFAULT NULL,
  `salary` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `candidates` */

/*Table structure for table `cart_items` */

DROP TABLE IF EXISTS `cart_items`;

CREATE TABLE `cart_items` (
  `CartItemId` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` varchar(50) NOT NULL,
  `UserId` int(11) NOT NULL,
  `CheckedOut` binary(1) NOT NULL DEFAULT '0',
  `ProductId` int(11) NOT NULL,
  `VendorId` varchar(45) NOT NULL,
  `Quantity` int(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`CartItemId`),
  UNIQUE KEY `ProductId` (`ProductId`,`UserId`,`device_id`),
  KEY `fk_userid` (`UserId`),
  KEY `fk_create` (`created_by`),
  KEY `fk_modify` (`modified_by`),
  CONSTRAINT `fk_create` FOREIGN KEY (`created_by`) REFERENCES `customers` (`id`),
  CONSTRAINT `fk_modify` FOREIGN KEY (`modified_by`) REFERENCES `customers` (`id`),
  CONSTRAINT `fk_product_id_cart` FOREIGN KEY (`ProductId`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_userid` FOREIGN KEY (`UserId`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1544 DEFAULT CHARSET=latin1;

/*Data for the table `cart_items` */

/*Table structure for table `cart_promocode` */

DROP TABLE IF EXISTS `cart_promocode`;

CREATE TABLE `cart_promocode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `promocode_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `promo_id` (`device_id`,`user_id`,`promocode_id`),
  KEY `fk_create_promo` (`created_by`),
  KEY `fk_modify_promo` (`modified_by`),
  CONSTRAINT `fk_create_promo` FOREIGN KEY (`created_by`) REFERENCES `customers` (`id`),
  CONSTRAINT `fk_modify_promo` FOREIGN KEY (`modified_by`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=830 DEFAULT CHARSET=latin1;

/*Data for the table `cart_promocode` */

/*Table structure for table `cart_total_details` */

DROP TABLE IF EXISTS `cart_total_details`;

CREATE TABLE `cart_total_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `device_id` varchar(200) DEFAULT NULL,
  `total_number_of_items` int(20) DEFAULT NULL,
  `sub_total` float DEFAULT NULL,
  `shipping_charge` float DEFAULT NULL,
  `promo_discount` float DEFAULT NULL,
  `offer_discount` float DEFAULT NULL,
  `total_discount` float DEFAULT NULL,
  `sub_total_before_tax` float DEFAULT NULL,
  `tax` float DEFAULT NULL,
  `grand_total` float(10,2) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=384 DEFAULT CHARSET=latin1;

/*Data for the table `cart_total_details` */

/*Table structure for table `cat_mapping` */

DROP TABLE IF EXISTS `cat_mapping`;

CREATE TABLE `cat_mapping` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `category` varchar(200) DEFAULT NULL,
  `sub_category` varchar(200) DEFAULT NULL,
  `child` varchar(200) DEFAULT NULL,
  `vendor_id` int(50) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1097 DEFAULT CHARSET=utf8;

/*Data for the table `cat_mapping` */

insert  into `cat_mapping`(`id`,`category`,`sub_category`,`child`,`vendor_id`,`created_date`,`modified_date`,`created_by`,`modified_by`) values 
(1,'Men','Accessories','Arm Warmers',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(2,'Men','Accessories','Caps',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(3,'Men','Accessories','Cravats',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(4,'Men','Accessories','Cufflinks',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(5,'Men','Accessories','Gloves',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(6,'Men','Accessories','Hats',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(7,'Men','Accessories','Handkerchiefs',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(8,'Men','Accessories','Mufflers',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(9,'Men','Accessories','Ties',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(10,'Men','Accessories','Raincoats',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(11,'Men','Accessories','Scarfs',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(12,'Men','Beauty and Personal care','Aftershave Creams',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(13,'Men','Beauty and Personal care','Aftershave Lotions',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(14,'Men','Beauty and Personal care','Aftershave Splashes',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(15,'Men','Beauty and Personal care','Disposable Shaving Razors',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(16,'Men','Beauty and Personal care','Hair Oils',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(17,'Men','Beauty and Personal care','Hair Brushes',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(18,'Men','Beauty and Personal care','Hair Colors',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(19,'Men','Beauty and Personal care','Shaving Brushes',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(20,'Men','Beauty and Personal care','Shaving Soaps',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(21,'Men','Beauty and Personal care','Shaving Cartridges',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(22,'Men','Beauty and Personal care','Shaving Foams',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(23,'Men','Beauty and Personal care','Shaving Blades',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(24,'Men','Beauty and Personal care','Shaving Gels',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(25,'Men','Beauty and Personal care','Shaving Lotions',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(26,'Men','Beauty and Personal care','Shaving Razors',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(27,'Men','Bottoms','Cargos',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(28,'Men','Bottoms','Dungarees',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(29,'Men','Bottoms','Harem Pants',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(30,'Men','Bottoms','Jeans',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(31,'Men','Bottoms','Lungis',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(32,'Men','Clothing/Fabrics','Shirt Fabrics',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(33,'Men','Clothing/Fabrics','Trouser Fabrics',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(34,'Men','Clothing/Fabrics','Suit Fabrics',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(35,'Men','Clothing/Fabrics','Multi-purpose Fabrics',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(36,'Men','Clothing/Fabrics','Shirt & Trouser Fabrics',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(37,'Men','Clothing/Fabrics','Jacket Fabrics',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(38,'Men','Clothing/Fabrics','Safari Fabrics',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(39,'Men','Clothing/Fabrics','Kurta Fabrics',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(40,'Men','Ethnic wear','Churidars',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(41,'Men','Ethnic wear','Dhotis',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(42,'Men','Ethnic wear','Ethnic Sets',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(43,'Men','Ethnic wear','Kurtas',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(44,'Men','Innerwear, Sleepwear','Briefs',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(45,'Men','Innerwear, Sleepwear','Boxers',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(46,'Men','Innerwear, Sleepwear','Pyjamas & Lounge Pants',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(47,'Men','Innerwear, Sleepwear','Pyjamas',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(48,'Men','Outerwear,Sweaters','Cardigans',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(49,'Men','Outerwear,Sweaters','Jackets',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(50,'Men','Outerwear,Sweaters','Bomber Jackets',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(51,'Men','Outerwear,Sweaters','Quilted Jackets',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(52,'Men','Outerwear,Sweaters','Parka Jackets',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(53,'Men','Outerwear,Sweaters','Bodycon Jackets',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(54,'Men','Outerwear,Sweaters','Pullovers',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(55,'Men','Outerwear,Sweaters','Pocket Squares',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(56,'Men','Shoewear','Slippers & Flip Flops',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(57,'Men','Shoewear','Casual Shoes',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(58,'Men','Shoewear','Formal Shoes',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(59,'Men','Shoewear','Sports Shoes',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(60,'Men','Shoewear','Ethnic Shoes',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(61,'Men','Shoewear','Sandals & Floaters',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(62,'Men','Suits & blazers','Blazers',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(63,'Men','Suits & blazers','Waistcoats',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(64,'Men','Suits & blazers','Coats',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(65,'Men','Tops','Polos & T-Shirts',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(66,'Men','Tops','Formal Shirts',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(67,'Men','Tops','Casual Shirts',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(68,'Men','Accessories','Bandanas',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(69,'Men','Combo Sets','Combo Sets',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(70,'Women','Ethnic wear','Abayas & Burqas',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(71,'Women','Accessories','Applique Patches',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(72,'Women','Accessories','Bandanas',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(73,'Women','Accessories','Caps',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(74,'Women','Accessories','Corsets',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(75,'Women','Accessories','Garters',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(76,'Women','Accessories','Gloves',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(77,'Women','Accessories','Hats',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(78,'Women','Accessories','Handkerchiefs',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(79,'Women','Accessories','Female Urinating Devices',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(80,'Women','Accessories','Fashion Tapes',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(81,'Women','Accessories','Tights',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(82,'Women','Accessories','Mufflers',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(83,'Women','Accessories','Mittens',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(84,'Women','Accessories','Ponchos',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(85,'Women','Accessories','Pepper Safety Devices',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(86,'Women','Accessories','Raincoats',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(87,'Women','Accessories','Scarves & Stoles',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(88,'Women','Beauty and Personal care','Manicure and Kits',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(89,'Women','Beauty and Personal care','Moisturizers and Creams',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(90,'Women','Bottoms','Capris',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(91,'Women','Bottoms','Track Pants',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(92,'Women','Bottoms','Trousers',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(93,'Women','Bottoms','Cargos',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(94,'Women','Bottoms','Dungarees',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(95,'Women','Bottoms','Skirts',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(96,'Women','Bottoms','Jumpsuits',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(97,'Women','Bottoms','Jeans',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(98,'Women','Bottoms','Harem Pants',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(101,'Women','Bottoms','Shorts',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(102,'Women','Bottoms','Leggings & Jeggings',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(103,'Women','Bottoms','Leggings & Tights',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(104,'Women','Bottoms','Jeggings',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(106,'Women','Bottoms','Leggings',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(107,'Women','Bottoms','Patialas',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(108,'Women','Clothing/Fabrics','Shirt Fabrics',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(109,'Women','Clothing/Fabrics','Trouser Fabrics',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(110,'Women','Clothing/Fabrics','Suit Fabrics',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(111,'Women','Clothing/Fabrics','Shirt & Trouser Fabrics',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(112,'Women','Ethnic wear','Blouses',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(113,'Women','Ethnic wear','Lehenga Cholis',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(114,'Women','Ethnic wear','Churidars',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(115,'Women','Ethnic wear','Ethnic Bottoms',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(116,'Women','Ethnic wear','Dresses',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(117,'Women','Ethnic wear','Kurtas',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(118,'Women','Ethnic wear','Gowns',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(119,'Women','Ethnic wear','Dupattas',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(120,'Women','Ethnic wear','Ethnic Sets',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(121,'Women','Ethnic wear','Kurtis',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(122,'Women','Ethnic wear','Dress Materials',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(123,'Women','Ethnic wear','Petticoats',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(124,'Women','Ethnic wear','Salwars',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(125,'Women','Ethnic wear','Salwar',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(126,'Women','Ethnic wear','Saris',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(127,'Women','Ethnic wear','Saree Falls',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(128,'Women','Innerwear,Sleepwear,Swimmingwear','Swimsuits',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(129,'Women','Innerwear,Sleepwear,Swimmingwear','Bra Strap Converters & Clips',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(130,'Women','Innerwear,Sleepwear,Swimmingwear','Bra Charm And Brooch',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(131,'Women','Innerwear,Sleepwear,Swimmingwear','Bodysuits',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(132,'Women','Innerwear,Sleepwear,Swimmingwear','Bra Strap Cushions',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(133,'Women','Innerwear,Sleepwear,Swimmingwear','Bra Pads & Petals',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(134,'Women','Innerwear,Sleepwear,Swimmingwear','Sports Bras',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(135,'Women','Innerwear,Sleepwear,Swimmingwear','Bras',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(136,'Women','Innerwear,Sleepwear,Swimmingwear','Bra Extenders',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(137,'Women','Innerwear,Sleepwear,Swimmingwear','Bra Straps',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(138,'Women','Innerwear,Sleepwear,Swimmingwear','Boxers',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(139,'Women','Innerwear,Sleepwear,Swimmingwear','Camisoles & Slips',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(140,'Women','Innerwear,Sleepwear,Swimmingwear','Night Dresses & Nighties',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(141,'Women','Innerwear,Sleepwear,Swimmingwear','Kaftans',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(142,'Women','Innerwear,Sleepwear,Swimmingwear','Lingerie Sets',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(143,'Women','Innerwear,Sleepwear,Swimmingwear','Lingerie Washbags',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(145,'Women','Innerwear,Sleepwear,Swimmingwear','Night Suits',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(146,'Women','Innerwear,Sleepwear,Swimmingwear','Panties',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(147,'Women','Innerwear,Sleepwear,Swimmingwear','Pyjamas & Lounge Pants',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(148,'Women','Jwellery','Mangalsutra',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(149,'Women','Jwellery','Mangalsutras',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(150,'Women','Jwellery','Tanmaniyas',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(151,'Women','Jwellery','Tanmaniya',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(152,'Women','Outerwear,Sweaters','Shrugs',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(153,'Women','Outerwear,Sweaters','Coats',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(154,'Women','Outerwear,Sweaters','Cardigans',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(155,'Women','Outerwear,Sweaters','Fashion Jackets',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(156,'Women','Outerwear,Sweaters','Shrugs & Jackets',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(157,'Women','Outerwear,Sweaters','Jackets',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(158,'Women','Outerwear,Sweaters','Sports Jackets',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(160,'Women','Outerwear,Sweaters','Leg Warmers',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(161,'Women','Outerwear,Sweaters','Sweaters & Pullovers',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(162,'Women','Shoewear','Slippers & Flip Flops',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(163,'Women','Shoewear','Flats',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(164,'Women','Shoewear','Sports Sandals',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(165,'Women','Shoewear','Wedges',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(166,'Women','Shoewear','Running',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(167,'Women','Shoewear','Bellies',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(168,'Women','Shoewear','Sneakers',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(169,'Women','Shoewear','Casual Shoes',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(170,'Women','Shoewear','Formal Shoes',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(171,'Women','Shoewear','Sports Shoes',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(172,'Women','Shoewear','Boots',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(173,'Women','Shoewear','Loafers',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(174,'Women','Shoewear','Ethnic Shoes',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(175,'Women','Shoewear','Gym & Fitness',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(176,'Women','Shoewear','Canvas',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(177,'Women','Shoewear','Walking',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(178,'Women','Shoewear','Trekking & Outdoors',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(179,'Women','Shoewear','Football',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(180,'Women','Shoewear','Basketball',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(181,'Women','Shoewear','Tennis',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(182,'Women','Shoewear','Cricket',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(183,'Women','Suits,Blazers','Blazers',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(184,'Women','Suits,Blazers','Waistcoats',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(185,'Women','Tops','Tops',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(186,'Women','Tops','Polos & T-Shirts',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(187,'Women','Tops','Sweatshirts',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(188,'Women','Tops','Shirts',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(189,'Women','Combo Sets','Combo Sets',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(190,'Women','Additional','Personal Security Alarms',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(191,'Boys','Accessories','Caps',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(192,'Boys','Accessories','Gloves',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(193,'Boys','Accessories','Hats',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(194,'Boys','Accessories','Mittens',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(195,'Boys','Accessories','Mufflers',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(196,'Boys','Accessories','Raincoats',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(197,'Boys','Accessories','Scarfs',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(198,'Boys','Bottoms','Track Pants',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(199,'Boys','Bottoms','Dungarees',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(200,'Boys','Bottoms','Harem Pants',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(201,'Boys','Bottoms','Jeans',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(202,'Boys','Bottoms','Shorts',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(203,'Boys','Bottoms','Three Fourths',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(204,'Boys','Bottoms','Jumpsuits',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(205,'Boys','Bottoms','Sandals',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(206,'Boys','Costume Wear','Costume Wear',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(208,'Boys','Ethnic wear','Ethnic Sets',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(210,'Boys','Outerwear,Sweaters','Winter & Seasonal Wear',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(211,'Boys','Outerwear,Sweaters','Cardigan',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(212,'Boys','Outerwear,Sweaters','Jackets',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(213,'Boys','Outerwear,Sweaters','Thermals',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(214,'Boys','Outerwear,Sweaters','Pullovers',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(215,'Boys','Shoewear','Casual Shoes',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(216,'Boys','Shoewear','Slippers & Flip Flops',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(217,'Boys','Shoewear','Formal Shoes',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(218,'Boys','Shoewear','Sports Shoes',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(220,'Boys','Shoewear','Ethnic Shoes',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(221,'Boys','Shoewear','School Shoes',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(222,'Boys','Sleepwear','Nightwear',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(223,'Boys','Sleepwear','Sleepsuits',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(224,'Boys','Sleepwear','Bodysuits & Sleepsuits',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(226,'Boys','Sleepwear','Pyjamas',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(227,'Boys','Suits,Blazers','Suits',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(228,'Boys','Suits,Blazers','Blazers',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(229,'Boys','Suits,Blazers','Coats',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(230,'Boys','Tops','Bodysuits',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(231,'Boys','Tops','T-Shirts',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(232,'Boys','Tops','Vests',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(233,'Boys','Tops','Shirts',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(234,'Boys','Innerwear & Sleepwear','Bloomers & Drawers',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(235,'Boys','Innerwear & Sleepwear','Briefs',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(236,'Boys','Combo Sets','Combo Sets',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(237,'Boys','Additional','Clogs',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(238,'Boys','Additional','Boys',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(239,'Boys','Additional','Baby Boys',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(240,'Men','Additional','Men',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(241,'Women','Additional','Women',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(242,'Women','Innerwear,Sleepwear,Swimmingwear','Babydolls',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(243,'Girls','Accessories','Caps',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(244,'Girls','Accessories','Hats',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(245,'Girls','Accessories','Arm Warmers',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(246,'Girls','Accessories','Gloves',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(247,'Girls','Accessories','Tights',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(248,'Girls','Accessories','Mittens',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(249,'Girls','Accessories','Raincoats',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(250,'Girls','Accessories','Shrugs',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(251,'Girls','Accessories','Scarves & Stoles',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(252,'Girls','Bottoms','Track Pants',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(253,'Girls','Bottoms','Capris',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(254,'Girls','Bottoms','Cargos',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(255,'Girls','Bottoms','Dungarees',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(256,'Girls','Bottoms','Jumpsuits',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(257,'Girls','Bottoms','Harem Pants',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(258,'Girls','Bottoms','Jeans',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(260,'Girls','Bottoms','Leggings & Jeggings',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(261,'Girls','Bottoms','Jeggings',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(262,'Girls','Bottoms','Leggings',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(263,'Girls','Bottoms','Shorts',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(265,'Girls','Costume Wears','Costume Wears',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(266,'Girls','Ethnic Wear','Ethnic Sets',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(267,'Girls','Ethnic Wear','Dresses',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(268,'Girls','Ethnic Wear','Dupattas',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(269,'Girls','Ethnic Wear','Gowns',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(270,'Girls','Ethnic Wear','Lehenga Cholis',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(271,'Girls','Ethnic Wear','Kurtis',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(272,'Girls','Ethnic Wear','Kurtas',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(273,'Girls','Ethnic Wear','Saris',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(274,'Girls','Innerwear & Sleepwear','Bloomers & Drawers',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(275,'Girls','Innerwear & Sleepwear','Innerwear & Sleepwear',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(276,'Girls','Innerwear & Sleepwear','Sleepsuits',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(277,'Girls','Innerwear & Sleepwear','Bodysuits & Sleepsuits',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(278,'Girls','Innerwear & Sleepwear','Bodysuits',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(279,'Girls','Innerwear & Sleepwear','Bras',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(280,'Girls','Innerwear & Sleepwear','Camisoles & Slips',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(281,'Girls','Innerwear & Sleepwear','Kaftans',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(282,'Girls','Innerwear & Sleepwear','Panties',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(283,'Girls','Innerwear & Sleepwear','Nightwear',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(284,'Girls','Innerwear & Sleepwear','Pyjamas',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(285,'Girls','Outerwear,Sweaters','Coats',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(286,'Girls','Outerwear,Sweaters','Winter & Seasonal Wear',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(287,'Girls','Outerwear,Sweaters','Cardigans',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(288,'Girls','Outerwear,Sweaters','Jackets',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(289,'Girls','Outerwear,Sweaters','Thermals',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(290,'Girls','Outerwear,Sweaters','Thermal Pants',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(291,'Girls','Outerwear,Sweaters','Pullovers',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(292,'Girls','Outerwear,Sweaters','Ponchos',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(293,'Girls','Shoewear','Casual Shoes',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(294,'Girls','Shoewear','Slippers & Flip Flops',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(295,'Girls','Shoewear','Sandals',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(296,'Girls','Shoewear','Flats',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(297,'Girls','Shoewear','Clogs',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(299,'Girls','Shoewear','Sports Shoes',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(300,'Girls','Shoewear','Ethnic Shoes',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(301,'Girls','Shoewear','Formal Shoes',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(302,'Girls','Shoewear','School Shoes',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(303,'Girls','Innerwear & Sleepwear','Night Suits',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(305,'Girls','Tops','T-Shirts',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(306,'Girls','Tops','Tops',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(307,'Girls','Tops','Shirts',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(308,'Girls','Combo Sets','Combo Sets',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(309,'Girls','Additional','Baby Girls',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(310,'Girls','Additional','Girls',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(311,'Women','Jewellery','Jewellery',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(312,'Men','Clothing/Fabrics','Mens Clothing',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(313,'Women','Clothing/Fabrics','Womens Clothing',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(314,'Women','Shoewear','Womens Footwear',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(315,'Men','Shoewear','Mens Footwear',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(316,'Kids','Kids Footwear','Kids Footwear',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(317,'Kids','Kids Clothing','Kids Clothing',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(318,'Kids','Kids Fashion','Kids Fashion',1,'2020-04-08 05:47:28','2020-04-08 05:47:28',NULL,NULL),
(319,'Boys','Ethnic Wear','Clothing Fabric',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(320,'Boys','Ethnic Wear','Kurta Sets',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(321,'Boys','Accessories','Rain Suit',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(322,'Boys','Ethnic Wear','Sherwani',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(323,'Boys','Suits,Blazers','Suits',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(324,'Boys','Swimming Wear','Swimwear',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(325,'Boys','Innerwear','Boxers',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(326,'Boys','Bottoms','Capris',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(327,'Boys','Ethnic Wear','Churidar',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(328,'Boys','Bottoms','Dungarees',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(329,'Boys','Bottoms','Harem Pants',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(330,'Boys','Bottoms','Jeans',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(331,'Boys','Bottoms','Jeggings',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(332,'Boys','Bottoms','Jodhpuri Pants',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(333,'Boys','Bottoms','Leggings',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(334,'Boys','Bottoms','Lounge Shorts',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(335,'Boys','Bottoms','Pyjamas',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(336,'Boys','Bottoms','Rain Trousers',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(337,'Boys','Bottoms','Shorts',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(338,'Boys','Bottoms','Swim Bottoms',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(339,'Boys','Bottoms','Tights',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(340,'Boys','Bottoms','Track Pants',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(341,'Boys','Bottoms','Tracksuits',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(342,'Boys','Bottoms','Trousers',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(343,'Boys','Ethnic Wear','Clothing Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(344,'Boys','Ethnic Wear','Dresses',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(345,'Boys','Ethnic Wear','Jumpsuit',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(346,'Boys','Innerwear','Briefs',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(347,'Boys','Innerwear','Innerwear Vests',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(348,'Boys','Innerwear','Shapewear',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(349,'Boys','Innerwear','Thermal Bottoms',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(350,'Boys','Innerwear','Thermal Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(351,'Boys','Innerwear','Thermal Tops',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(352,'Boys','Innerwear','Trunk',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(353,'Boys','Loungewear and Nightwear','Lounge Pants',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(354,'Boys','Loungewear and Nightwear','Lounge Tshirts',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(355,'Boys','Loungewear and Nightwear','Night suits',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(356,'Boys','Loungewear and Nightwear','Robe',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(357,'Boys','Suits,Blazers','Blazers',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(358,'Boys','Topwear','Bodysuit',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(359,'Boys','Topwear','Coats',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(360,'Boys','Topwear','Dupatta',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(361,'Boys','Topwear','Jackets',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(362,'Boys','Topwear','Jackets Smart',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(363,'Boys','Ethnic Wear','Kurtas',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(364,'Boys','Ethnic Wear','Nehru Jackets',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(365,'Boys','Topwear','Rain Jacket',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(366,'Boys','Topwear','Rompers',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(367,'Boys','Topwear','Shirts',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(368,'Boys','Outerwear','Shrug',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(369,'Boys','Outerwear','Sweaters',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(370,'Boys','Topwear','Sweatshirts',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(371,'Boys','Swimming Wear','Swim Tops',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(372,'Boys','Topwear','Tops',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(373,'Boys','Topwear','Tshirts',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(374,'Boys','Topwear','Tshirts Smart',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(375,'Boys','Topwear','Waistcoat',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(376,'Boys','Accessories','Belts',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(377,'Boys','Accessories','Ties and Cufflinks',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(378,'Boys','Footwear','Flip Flops',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(379,'Boys','Footwear','Sandal',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(380,'Boys','Footwear','Sandals',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(381,'Boys','Footwear','Sports Sandals',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(382,'Boys','Footwear','Shoes',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(383,'Boys','Footwear','Booties',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(384,'Boys','Footwear','Casual Shoes',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(385,'Boys','Footwear','Flats',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(386,'Boys','Footwear','Formal Shoes',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(387,'Boys','Footwear','Heels',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(388,'Boys','Footwear','Sports Shoes',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(389,'Boys','Accessories','Gloves',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(390,'Boys','Loungewear and Nightwear','Bath Robe',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(391,'Boys','Towels','Bath Towels',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(392,'Boys','Towels','Beach Towels',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(393,'Boys','Towels','Face Towels',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(394,'Boys','Towels','Hand Towels',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(395,'Boys','Outerwear','Aprons',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(396,'Boys','Personal Care','Body Lotion',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(397,'Boys','Personal Care','Body Oil',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(398,'Boys','Personal Care','Body Wash and Scrub',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(399,'Boys','Personal Care','Body Wax and Essentials',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(400,'Boys','Personal Care','Hair Oil',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(401,'Boys','Personal Care','Hand and Feet Cream',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(402,'Boys','Personal Care','Hand Wash and Sanitizer',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(403,'Boys','Personal Care','Nail Essentials',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(404,'Boys','Personal Care','Personal Care Hamper',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(405,'Boys','Personal Care','Beauty Accessory',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(406,'Boys','Personal Care','Beauty Gift Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(407,'Boys','Personal Care','Body Mist',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(408,'Boys','Personal Care','Deodorant',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(409,'Boys','Personal Care','Fragrance Gift Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(410,'Boys','Personal Care','Perfume and Body Mist',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(411,'Boys','Personal Care','Face Moisturisers',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(412,'Boys','Personal Care','Hair Brush and Comb',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(413,'Boys','Personal Care','Hair Care Kit',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(414,'Boys','Personal Care','Hair Cream and Mask',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(415,'Boys','Personal Care','Hair Gel and Spray',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(416,'Boys','Personal Care','Hair Serum',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(417,'Boys','Personal Care','Shampoo and Conditioner',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(418,'Boys','Personal Care','Hands & Feet',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(419,'Boys','Personal Care','Lip Care',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(420,'Boys','Personal Care','Lip Liner',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(421,'Boys','Personal Care','Highlighter and Blush',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(422,'Boys','Personal Care','Mens Grooming Kit',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(423,'Boys','Personal Care','Beard & Moustache Care',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(424,'Boys','Personal Care','Hair Colour',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(425,'Boys','Personal Care','Shaving Brush & Razor',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(426,'Boys','Personal Care','Shaving Essentials',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(427,'Boys','Personal Care','Bath Accessories',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(428,'Boys','Personal Care','Eye Cream',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(429,'Boys','Personal Care','Face Wash and Cleanser',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(430,'Boys','Personal Care','Sunscreen',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(431,'Boys','Personal Care','Toner',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(432,'Boys','Personal Care','Face Scrub and Exfoliator',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(433,'Boys','Personal Care','Face Serum and Gel',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(434,'Boys','Personal Care','Mask and Peel',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(435,'Boys','Personal Care','Skin Care Gift Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(436,'Boys','Personal Care','Trimmer',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(437,'Boys','Accessories','Mufflers',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(438,'Boys','Accessories','Shoe Care',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(439,'Boys','Accessories','Socks',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(440,'Boys','Sporting Goods','Basketballs',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(441,'Boys','Sporting Goods','Cricket Bats',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(442,'Boys','Sporting Goods','Footballs',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(443,'Boys','Accessories','Stoles',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(444,'Boys','Accessories','Ties',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(445,'Boys','Accessories','Wallets',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(446,'Boys','Accessories','Laundry Bag',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(447,'Boys','Accessories','Watches',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(448,'Boys','Accessories','Watch Gift Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(449,'Boys','Accessories','Watch Organiser',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(450,'Boys','Accessories','Backpacks',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(451,'Boys','Accessories','Clutches',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(452,'Boys','Accessories','Duffel Bag',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(453,'Boys','Accessories','Handbags',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(454,'Boys','Accessories','Laptop Bag',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(455,'Boys','Accessories','Messenger Bag',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(456,'Boys','Accessories','Mobile Pouch',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(457,'Boys','Accessories','Rucksacks',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(458,'Boys','Accessories','Tablet Sleeve',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(459,'Boys','Accessories','Trolley Bag',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(460,'Boys','Accessories','Waist Pouch',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(461,'Boys','Accessories','Sleeping Bag',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(462,'Boys','Accessories','Sunglasses',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(463,'Boys','Accessories','Sunglasses Case',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(464,'Boys','Accessories','Frames',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(465,'Boys','Accessories','Hair Accessory',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(466,'Boys','Accessories','Headphones',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(467,'Boys','Accessories','Headwear',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(468,'Boys','Accessories','Caps',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(469,'Boys','Accessories','Hat',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(470,'Boys','Accessories','Headband',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(471,'Boys','Accessories','Helmets',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(472,'Boys','Accessories','Key chain',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(473,'Boys','Accessories','Mobile Accessories',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(474,'Boys','Accessories','Fitness Bands',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(475,'Boys','Accessories','Smart Watches',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(476,'Boys','Accessories','Wristbands',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(477,'Boys','Accessories','Stationery',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(478,'Boys','Accessories','Suspenders',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(479,'Boys','Accessories','Travel Accessory',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(480,'Boys','Accessories','School Essentials',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(481,'Boys','Accessories','Pocket Squares',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(482,'Boys','Accessories','Accessory Gift Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(483,'Kids','Accessories','Baby Care Products',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(484,'Kids','Accessories','Baby Gear & Nursery',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(485,'Kids','Accessories','Bibs',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(486,'Kids','Accessories','Feeding Essentials',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(487,'Kids','Accessories','Mittens',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(488,'Kids','Accessories','Sleepsuit',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(489,'Kids','Accessories','Rain Suit',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(490,'Kids','Accessories','School Essentials',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(491,'Women','Ethnic Wear','Burqas',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(492,'Women','Ethnic Wear','Clothing Fabric',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(493,'Women','Ethnic Wear','Dress Material',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(494,'Women','Ethnic Wear','Kurta Sets',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(495,'Women','Accessories','Rain Suit',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(496,'Women','Swimming Wear','Swimwear',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(497,'Women','Bottoms','Capris',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(498,'Women','Ethnic Wear','Churidar',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(499,'Women','Bottoms','Dungarees',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(500,'Women','Bottoms','Harem Pants',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(501,'Women','Bottoms','Jeans',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(502,'Women','Bottoms','Jeggings',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(503,'Women','Bottoms','Jodhpuri Pants',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(504,'Women','Bottoms','Lounge Shorts',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(505,'Women','Bottoms','Leggings',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(506,'Women','Bottoms','Palazzos',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(507,'Women','Bottoms','Patiala',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(508,'Women','Bottoms','Patiala and Dupatta',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(509,'Women','Bottoms','Pyjamas',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(510,'Women','Bottoms','Rain Trousers',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(511,'Women','Bottoms','Salwar',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(512,'Women','Bottoms','Salwar and Dupatta',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(513,'Women','Bottoms','Shorts',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(514,'Women','Bottoms','Skirts',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(515,'Women','Bottoms','Stockings',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(516,'Women','Bottoms','Swim Bottoms',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(517,'Women','Bottoms','Tights',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(518,'Women','Bottoms','Track Pants',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(519,'Women','Bottoms','Tracksuits',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(520,'Women','Bottoms','Trousers',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(521,'Women','Ethnic Wear','Clothing Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(522,'Women','Ethnic Wear','Dresses',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(523,'Women','Ethnic Wear','Jumpsuit',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(524,'Women','Innerwear','Bra',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(525,'Women','Innerwear','Briefs',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(526,'Women','Innerwear','Innerwear Vests',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(527,'Women','Innerwear','Camisoles',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(528,'Women','Innerwear','Lingerie Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(529,'Women','Innerwear','Shapewear',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(530,'Women','Innerwear','Thermal Bottoms',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(531,'Women','Innerwear','Thermal Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(532,'Women','Innerwear','Thermal Tops',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(533,'Women','Innerwear','Trunk',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(534,'Women','Loungewear and Nightwear','Baby Dolls',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(535,'Women','Loungewear and Nightwear','Lounge Pants',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(536,'Women','Loungewear and Nightwear','Lounge Tshirts',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(537,'Women','Loungewear and Nightwear','Night suits',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(538,'Women','Loungewear and Nightwear','Nightdress',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(539,'Women','Loungewear and Nightwear','Robe',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(540,'Women','Loungewear and Nightwear','Sleep Shirts',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(541,'Women','Ethnic Wear','Saree Blouse',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(542,'Women','Ethnic Wear','Sarees',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(543,'Women','Suits,Blazers','Blazers',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(544,'Women','Topwear','Bodysuit',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(545,'Women','Topwear','Coats',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(546,'Women','Topwear','Corset',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(547,'Women','Topwear','Dupatta',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(548,'Women','Topwear','Jackets',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(549,'Women','Ethnic Wear','Kurtas',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(550,'Women','Ethnic Wear','Kurtis',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(551,'Women','Ethnic Wear','Lehenga Choli',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(552,'Women','Topwear','Rain Jacket',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(553,'Women','Topwear','Rompers',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(554,'Women','Accessories','Shawl',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(555,'Women','Topwear','Shirts',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(556,'Women','Outerwear','Shrug',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(557,'Women','Outerwear','Sweaters',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(558,'Women','Topwear','Sweatshirts',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(559,'Women','Swimming Wear','Swim Tops',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(560,'Women','Topwear','Tops',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(561,'Women','Topwear','Tshirts',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(562,'Women','Topwear','Tunics',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(563,'Women','Topwear','Waistcoat',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(564,'Women','Accessories','Belts',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(565,'Women','Accessories','Ties and Cufflinks',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(566,'Women','Footwear','Flip Flops',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(567,'Women','Footwear','Sandal',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(568,'Women','Footwear','Sandals',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(569,'Women','Footwear','Sports Sandals',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(570,'Women','Footwear','Shoes',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(571,'Women','Footwear','Casual Shoes',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(572,'Women','Footwear','Flats',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(573,'Women','Footwear','Formal Shoes',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(574,'Women','Footwear','Heels',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(575,'Women','Footwear','Sports Shoes',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(576,'Women','Accessories','Free Gifts',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(577,'Women','Accessories','Gloves',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(578,'Women','Loungewear and Nightwear','Bath Robe',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(579,'Women','Towels','Bath Towels',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(580,'Women','Towels','Beach Towels',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(581,'Women','Towels','Face Towels',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(582,'Women','Towels','Hand Towels',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(583,'Women','Towels','Towel set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(584,'Women','Towels','Kitchen Towels',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(585,'Women','Outerwear','Aprons',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(586,'Women','Personal Care','Bath and Body Gift Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(587,'Women','Personal Care','Bath soak and oil',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(588,'Women','Personal Care','Body Lotion',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(589,'Women','Personal Care','Body Oil',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(590,'Women','Personal Care','Body Wash and Scrub',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(591,'Women','Personal Care','Body Wax and Essentials',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(592,'Women','Personal Care','Hair Oil',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(593,'Women','Personal Care','Hand and Feet Cream',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(594,'Women','Personal Care','Hand Wash and Sanitizer',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(595,'Women','Personal Care','Nail Essentials',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(596,'Women','Personal Care','Personal Care Hamper',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(597,'Women','Personal Care','Toiletry Kit',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(598,'Women','Personal Care','Beauty Accessory',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(599,'Women','Personal Care','Epilator',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(600,'Women','Personal Care','Beauty Gift Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(601,'Women','Personal Care','Facial Kit',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(602,'Women','Personal Care','Mascara',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(603,'Women','Personal Care','Aroma Oils',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(604,'Women','Personal Care','Body Mist',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(605,'Women','Personal Care','Deodorant',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(606,'Women','Personal Care','Fragrance Gift Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(607,'Women','Personal Care','Perfume and Body Mist',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(608,'Women','Personal Care','Face Moisturisers',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(609,'Women','Personal Care','Hair Brush and Comb',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(610,'Women','Personal Care','Hair Care Kit',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(611,'Women','Personal Care','Hair Cream and Mask',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(612,'Women','Personal Care','Hair Gel and Spray',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(613,'Women','Personal Care','Hair Serum',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(614,'Women','Personal Care','Shampoo and Conditioner',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(615,'Women','Personal Care','Hands & Feet',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(616,'Women','Personal Care','Lip Care',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(617,'Women','Personal Care','Lip Gloss',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(618,'Women','Personal Care','Lip Liner',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(619,'Women','Personal Care','Lip Plumper',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(620,'Women','Personal Care','Lipstick',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(621,'Women','Personal Care','Compact',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(622,'Women','Personal Care','Concealer',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(623,'Women','Personal Care','Eyebrow Enhancer',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(624,'Women','Personal Care','Eyeshadow',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(625,'Women','Personal Care','False Eyelashes',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(626,'Women','Personal Care','Foundation and Primer',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(627,'Women','Personal Care','Highlighter and Blush',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(628,'Women','Personal Care','Makeup Brushes',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(629,'Women','Personal Care','Makeup Gift Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(630,'Women','Personal Care','Makeup Kit',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(631,'Women','Personal Care','Makeup Remover',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(632,'Women','Personal Care','Sindoor',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(633,'Women','Personal Care','Nail Polish',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(634,'Women','Personal Care','Bath Accessories',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(635,'Women','Personal Care','Eye Cream',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(636,'Women','Personal Care','Face Wash and Cleanser',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(637,'Women','Personal Care','Feminine Hygiene',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(638,'Women','Personal Care','Sunscreen',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(639,'Women','Personal Care','Toner',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(640,'Women','Personal Care','BB and CC Cream',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(641,'Women','Personal Care','Bleach',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(642,'Women','Personal Care','Face Scrub and Exfoliator',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(643,'Women','Personal Care','Face Serum and Gel',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(644,'Women','Personal Care','Mask and Peel',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(645,'Women','Personal Care','Skin Care Gift Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(646,'Women','Personal Care','Hair Appliance',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(647,'Women','Personal Care','Trimmer',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(648,'Women','Accessories','Mufflers',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(649,'Women','Accessories','Shoe Care',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(650,'Women','Accessories','Socks',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(651,'Women','Accessories','Stoles',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(652,'Women','Accessories','Wallets',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(653,'Women','Accessories','Laundry Bag',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(654,'Women','Accessories','Watches',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(655,'Women','Accessories','Watch Gift Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(656,'Women','Accessories','Watch Organiser',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(657,'Women','Accessories','Backpacks',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(658,'Women','Accessories','Clutches',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(659,'Women','Accessories','Duffel Bag',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(660,'Women','Accessories','Handbags',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(661,'Women','Accessories','Laptop Bag',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(662,'Women','Accessories','Messenger Bag',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(663,'Women','Accessories','Mobile Pouch',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(664,'Women','Accessories','Rucksacks',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(665,'Women','Accessories','Tablet Sleeve',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(666,'Women','Accessories','Trolley Bag',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(667,'Women','Accessories','Waist Pouch',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(668,'Women','Accessories','Sleeping Bag',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(669,'Women','Accessories','Sunglasses',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(670,'Women','Accessories','Sunglasses Case',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(671,'Women','Accessories','Frames',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(672,'Women','Accessories','Hair Accessory',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(673,'Women','Accessories','Headphones',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(674,'Women','Accessories','Headwear',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(675,'Women','Accessories','Caps',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(676,'Women','Accessories','Hat',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(677,'Women','Accessories','Headband',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(678,'Women','Accessories','Helmets',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(679,'Women','Accessories','Key chain',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(680,'Women','Accessories','Mobile Accessories',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(681,'Women','Accessories','Fitness Bands',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(682,'Women','Accessories','Smart Watches',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(683,'Women','Accessories','Wristbands',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(684,'Women','Accessories','Stationery',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(685,'Women','Accessories','Suspenders',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(686,'Women','Accessories','Travel Accessory',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(687,'Women','Jewellery','Anklet',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(688,'Women','Jewellery','Bangle',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(689,'Women','Jewellery','Bracelet',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(690,'Women','Jewellery','Brooch',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(691,'Women','Jewellery','Earrings',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(692,'Women','Jewellery','Head Jewellery',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(693,'Women','Jewellery','Jewellery Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(694,'Women','Jewellery','Mangalsutra',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(695,'Women','Jewellery','Necklace and Chains',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(696,'Women','Jewellery','Nosepin',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(697,'Women','Jewellery','Pendant',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(698,'Women','Jewellery','Ring',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(699,'Women','Accessories','Saree Accessories',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(700,'Women','Accessories','Lingerie accessories',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(701,'Women','Jewellery','Bangle Diamond',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(702,'Women','Jewellery','Bangle Gold',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(703,'Women','Jewellery','Bracelet Diamond',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(704,'Women','Jewellery','Bracelet Gold',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(705,'Women','Jewellery','Earrings Diamond',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(706,'Women','Jewellery','Earrings Gold',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(707,'Women','Jewellery','Necklace and Chains Diamond',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(708,'Women','Jewellery','Necklace Gold',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(709,'Women','Jewellery','Nosepin Diamond',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(710,'Women','Jewellery','Nosepin Gold',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(711,'Women','Jewellery','Pendant Diamond',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(712,'Women','Jewellery','Pendant Gold',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(713,'Women','Jewellery','Precious Studded Necklace',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(714,'Women','Jewellery','Ring Diamond',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(715,'Women','Jewellery','Ring Gold',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(716,'Women','Accessories','Accessory Gift Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(717,'Men','Ethnic Wear','Clothing Fabric',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(718,'Men','Ethnic Wear','Kurta Sets',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(719,'Men','Accessories','Rain Suit',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(720,'Men','Ethnic Wear','Sherwani',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(721,'Men','Suits,Blazers','Suits',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(722,'Men','Swimming Wear','Swimwear',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(723,'Men','Innerwear','Boxers',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(724,'Men','Bottoms','Capris',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(725,'Men','Ethnic Wear','Churidar',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(726,'Men','Ethnic Wear','Dhotis',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(727,'Men','Bottoms','Dungarees',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(728,'Men','Bottoms','Harem Pants',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(729,'Men','Bottoms','Jeans',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(730,'Men','Bottoms','Jeggings',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(731,'Men','Bottoms','Jodhpuri Pants',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(732,'Men','Bottoms','Leggings',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(733,'Men','Bottoms','Lounge Shorts',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(734,'Men','Bottoms','Pyjamas',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(735,'Men','Bottoms','Rain Trousers',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(736,'Men','Bottoms','Salwar',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(737,'Men','Bottoms','Shorts',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(738,'Men','Bottoms','Swim Bottoms',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(739,'Men','Bottoms','Tights',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(740,'Men','Bottoms','Track Pants',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(741,'Men','Bottoms','Tracksuits',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(742,'Men','Bottoms','Trousers',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(743,'Men','Ethnic Wear','Clothing Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(744,'Men','Ethnic Wear','Dresses',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(745,'Men','Ethnic Wear','Jumpsuit',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(746,'Men','Innerwear','Briefs',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(747,'Men','Innerwear','Innerwear Vests',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(748,'Men','Innerwear','Shapewear',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(749,'Men','Innerwear','Thermal Bottoms',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(750,'Men','Innerwear','Thermal Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(751,'Men','Innerwear','Thermal Tops',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(752,'Men','Innerwear','Trunk',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(753,'Men','Loungewear and Nightwear','Lounge Pants',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(754,'Men','Loungewear and Nightwear','Lounge Tshirts',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(755,'Men','Loungewear and Nightwear','Night suits',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(756,'Men','Loungewear and Nightwear','Robe',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(757,'Men','Suits,Blazers','Blazers',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(758,'Men','Topwear','Bodysuit',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(759,'Men','Topwear','Coats',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(760,'Men','Topwear','Dupatta',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(761,'Men','Topwear','Jackets',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(762,'Men','Topwear','Jackets Smart',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(763,'Men','Ethnic Wear','Kurtas',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(764,'Men','Ethnic Wear','Nehru Jackets',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(765,'Men','Topwear','Rain Jacket',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(766,'Men','Topwear','Rompers',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(767,'Men','Topwear','Shirts',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(768,'Men','Outerwear','Shrug',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(769,'Men','Outerwear','Sweaters',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(770,'Men','Topwear','Sweatshirts',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(771,'Men','Swimming Wear','Swim Tops',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(772,'Men','Topwear','Tops',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(773,'Men','Topwear','Tshirts',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(774,'Men','Topwear','Tshirts Smart',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(775,'Men','Topwear','Waistcoat',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(776,'Men','Accessories','Belts',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(777,'Men','Accessories','Ties and Cufflinks',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(778,'Men','Footwear','Flip Flops',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(779,'Men','Footwear','Sandal',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(780,'Men','Footwear','Sandals',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(781,'Men','Footwear','Sports Sandals',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(782,'Men','Footwear','Shoes',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(783,'Men','Footwear','Casual Shoes',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(784,'Men','Footwear','Flats',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(785,'Men','Footwear','Formal Shoes',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(786,'Men','Footwear','Heels',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(787,'Men','Footwear','Sports Shoes',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(788,'Men','Accessories','Free Gifts',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(789,'Men','Accessories','Gloves',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(790,'Men','Loungewear and Nightwear','Bath Robe',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(791,'Men','Towels','Bath Towels',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(792,'Men','Towels','Beach Towels',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(793,'Men','Towels','Face Towels',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(794,'Men','Towels','Hand Towels',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(795,'Men','Towels','Towel Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(796,'Men','Outerwear','Aprons',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(797,'Men','Personal Care','Bath and Body Gift Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(798,'Men','Personal Care','Bath Soak Salt and Oil',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(799,'Men','Personal Care','Body Lotion',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(800,'Men','Personal Care','Body Oil',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(801,'Men','Personal Care','Body Wash and Scrub',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(802,'Men','Personal Care','Body Wax and Essentials',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(803,'Men','Personal Care','Hair Oil',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(804,'Men','Personal Care','Hand and Feet Cream',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(805,'Men','Personal Care','Hand Wash and Sanitizer',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(806,'Men','Personal Care','Nail Essentials',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(807,'Men','Personal Care','Personal Care Hamper',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(808,'Men','Personal Care','Toiletry Kit',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(809,'Men','Personal Care','Beauty Accessory',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(810,'Men','Personal Care','Beauty Gift Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(811,'Men','Personal Care','Facial Kit',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(812,'Men','Personal Care','Aroma Oils',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(813,'Men','Personal Care','Body Mist',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(814,'Men','Personal Care','Deodorant',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(815,'Men','Personal Care','Fragrance Gift Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(816,'Men','Personal Care','Perfume and Body Mist',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(817,'Men','Personal Care','Face Moisturisers',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(818,'Men','Personal Care','Hair Brush and Comb',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(819,'Men','Personal Care','Hair Care Kit',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(820,'Men','Personal Care','Hair Cream and Mask',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(821,'Men','Personal Care','Hair Gel and Spray',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(822,'Men','Personal Care','Hair Serum',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(823,'Men','Personal Care','Shampoo and Conditioner',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(824,'Men','Personal Care','Hands & Feet',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(825,'Men','Personal Care','Lip Care',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(826,'Men','Personal Care','Compact',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(827,'Men','Personal Care','Foundation and Primer',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(828,'Men','Personal Care','Concealer',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(829,'Men','Personal Care','Kajal and Eyeliner',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(830,'Men','Personal Care','Makeup Brushes',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(831,'Men','Personal Care','Makeup Kit',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(832,'Men','Personal Care','Makeup Remover',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(833,'Men','Personal Care','Lip Liner',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(834,'Men','Personal Care','Highlighter and Blush',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(835,'Men','Personal Care','Mens Grooming Kit',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(836,'Men','Personal Care','Beard & Moustache Care',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(837,'Men','Personal Care','Hair Colour',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(838,'Men','Personal Care','Shaving Brush & Razor',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(839,'Men','Personal Care','Shaving Essentials',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(840,'Men','Personal Care','Bath Accessories',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(841,'Men','Personal Care','Eye Cream',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(842,'Men','Personal Care','Face Wash and Cleanser',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(843,'Men','Personal Care','Sunscreen',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(844,'Men','Personal Care','Toner',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(845,'Men','Personal Care','Bleach',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(846,'Men','Personal Care','Face Scrub and Exfoliator',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(847,'Men','Personal Care','Face Serum and Gel',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(848,'Men','Personal Care','Mask and Peel',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(849,'Men','Personal Care','Skin Care Gift Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(850,'Men','Personal Care','Hair Appliance',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(851,'Men','Personal Care','Trimmer',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(852,'Men','Accessories','Mufflers',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(853,'Men','Accessories','Shoe Care',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(854,'Men','Accessories','Socks',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(855,'Men','Sporting Goods','Basketballs',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(856,'Men','Sporting Goods','Cricket Bats',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(857,'Men','Sporting Goods','Footballs',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(858,'Men','Accessories','Stoles',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(859,'Men','Accessories','Ties',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(860,'Men','Accessories','Wallets',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(861,'Men','Accessories','Laundry Bag',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(862,'Men','Accessories','Watches',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(863,'Men','Accessories','Watch Gift Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(864,'Men','Accessories','Watch Organiser',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(865,'Men','Accessories','Backpacks',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(866,'Men','Accessories','Clutches',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(867,'Men','Accessories','Duffel Bag',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(868,'Men','Accessories','Handbags',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(869,'Men','Accessories','Laptop Bag',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(870,'Men','Accessories','Messenger Bag',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(871,'Men','Accessories','Mobile Pouch',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(872,'Men','Accessories','Rucksacks',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(873,'Men','Accessories','Tablet Sleeve',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(874,'Men','Accessories','Trolley Bag',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(875,'Men','Accessories','Waist Pouch',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(876,'Men','Accessories','Sleeping Bag',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(877,'Men','Accessories','Sunglasses',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(878,'Men','Accessories','Sunglasses Case',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(879,'Men','Accessories','Frames',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(880,'Men','Accessories','Hair Accessory',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(881,'Men','Accessories','Headphones',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(882,'Men','Accessories','Headwear',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(883,'Men','Accessories','Caps',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(884,'Men','Accessories','Hat',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(885,'Men','Accessories','Headband',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(886,'Men','Accessories','Bracelet',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(887,'Men','Accessories','Brooch',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(888,'Men','Accessories','Earrings',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(889,'Men','Accessories','Helmets',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(890,'Men','Accessories','Key chain',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(891,'Men','Accessories','Mobile Accessories',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(892,'Men','Accessories','Fitness Bands',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(893,'Men','Accessories','Smart Watches',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(894,'Men','Accessories','Wristbands',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(895,'Men','Accessories','Stationery',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(896,'Men','Accessories','Suspenders',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(897,'Men','Accessories','Travel Accessory',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(898,'Men','Accessories','Pocket Squares',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(899,'Men','Accessories','Accessory Gift Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(900,'Girls','Ethnic Wear','Clothing Fabric',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(901,'Girls','Ethnic Wear','Dress Material',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(902,'Girls','Ethnic Wear','Kurta Sets',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(903,'Girls','Accessories','Rain Suit',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(904,'Girls','Swimming Wear','Swimwear',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(905,'Girls','Innerwear','Boxers',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(906,'Girls','Bottoms','Capris',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(907,'Girls','Ethnic Wear','Churidar',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(908,'Girls','Bottoms','Dungarees',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(909,'Girls','Bottoms','Harem Pants',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(910,'Girls','Bottoms','Jeans',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(911,'Girls','Bottoms','Jeggings',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(912,'Girls','Bottoms','Jodhpuri Pants',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(913,'Girls','Bottoms','Leggings',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(914,'Girls','Bottoms','Lounge Shorts',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(915,'Girls','Bottoms','Palazzos',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(916,'Girls','Bottoms','Patiala',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(917,'Girls','Bottoms','Patiala and Dupatta',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(918,'Girls','Bottoms','Pyjamas',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(919,'Girls','Bottoms','Rain Trousers',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(920,'Girls','Bottoms','Shorts',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(921,'Girls','Bottoms','Skirts',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(922,'Girls','Bottoms','Stockings',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(923,'Girls','Bottoms','Swim Bottoms',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(924,'Girls','Bottoms','Tights',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(925,'Girls','Bottoms','Track Pants',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(926,'Girls','Bottoms','Tracksuits',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(927,'Girls','Bottoms','Trousers',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(928,'Girls','Ethnic Wear','Clothing Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(929,'Girls','Ethnic Wear','Dresses',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(930,'Girls','Ethnic Wear','Jumpsuit',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(931,'Girls','Innerwear','Bra',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(932,'Girls','Innerwear','Briefs',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(933,'Girls','Innerwear','Camisoles',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(934,'Girls','Innerwear','Innerwear Vests',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(935,'Girls','Innerwear','Lingerie Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(936,'Girls','Innerwear','Shapewear',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(937,'Girls','Innerwear','Thermal Bottoms',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(938,'Girls','Innerwear','Thermal Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(939,'Girls','Innerwear','Thermal Tops',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(940,'Girls','Innerwear','Trunk',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(941,'Girls','Loungewear and Nightwear','Baby Dolls',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(942,'Girls','Loungewear and Nightwear','Lounge Pants',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(943,'Girls','Loungewear and Nightwear','Lounge Tshirts',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(944,'Girls','Loungewear and Nightwear','Night suits',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(945,'Girls','Loungewear and Nightwear','Nightdress',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(946,'Girls','Loungewear and Nightwear','Robe',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(947,'Girls','Loungewear and Nightwear','Sleep Shirts',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(948,'Girls','Ethnic Wear','Saree Blouse',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(949,'Girls','Ethnic Wear','Sarees',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(950,'Girls','Suits,Blazers','Blazers',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(951,'Girls','Topwear','Bodysuit',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(952,'Girls','Topwear','Coats',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(953,'Girls','Topwear','Corset',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(954,'Girls','Topwear','Dupatta',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(955,'Girls','Topwear','Jackets',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(956,'Girls','Ethnic Wear','Kurtas',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(957,'Girls','Ethnic Wear','Kurtis',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(959,'Girls','Ethnic Wear','Lehenga Choli',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(960,'Girls','Topwear','Rain Jacket',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(961,'Girls','Topwear','Rompers',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(962,'Girls','Accessories','Shawl',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(963,'Girls','Topwear','Shirts',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(964,'Girls','Outerwear','Shrug',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(965,'Girls','Outerwear','Sweaters',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(966,'Girls','Topwear','Sweatshirts',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(967,'Girls','Swimming Wear','Swim Tops',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(968,'Girls','Topwear','Tops',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(969,'Girls','Topwear','Tshirts',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(970,'Girls','Topwear','Tunics',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(971,'Girls','Topwear','Waistcoat',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(972,'Girls','Accessories','Belts',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(973,'Girls','Accessories','Ties and Cufflinks',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(974,'Girls','Footwear','Flip Flops',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(975,'Girls','Footwear','Sandal',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(976,'Girls','Footwear','Sandals',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(977,'Girls','Footwear','Sports Sandals',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(978,'Girls','Footwear','Shoes',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(979,'Girls','Footwear','Booties',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(980,'Girls','Footwear','Casual Shoes',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(981,'Girls','Footwear','Flats',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(982,'Girls','Footwear','Formal Shoes',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(983,'Girls','Footwear','Heels',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(984,'Girls','Footwear','Sports Shoes',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(985,'Girls','Accessories','Gloves',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(986,'Girls','Loungewear and Nightwear','Bath Robe',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(987,'Girls','Towels','Bath Towels',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(988,'Girls','Towels','Beach Towels',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(989,'Girls','Towels','Face Towels',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(990,'Girls','Towels','Hand Towels',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(991,'Girls','Outerwear','Aprons',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(992,'Girls','Personal Care','Body Lotion',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(993,'Girls','Personal Care','Body Oil',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(994,'Girls','Personal Care','Body Wash and Scrub',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(995,'Girls','Personal Care','Body Wax and Essentials',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(996,'Girls','Personal Care','Hair Oil',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(997,'Girls','Personal Care','Hand and Feet Cream',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(998,'Girls','Personal Care','Hand Wash and Sanitizer',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(999,'Girls','Personal Care','Nail Essentials',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1000,'Girls','Personal Care','Personal Care Hamper',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1001,'Girls','Personal Care','Toiletry Kit',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1002,'Girls','Personal Care','Beauty Accessory',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1003,'Girls','Personal Care','Epilator',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1004,'Girls','Personal Care','Beauty Gift Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1005,'Girls','Personal Care','Mascara',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1006,'Girls','Personal Care','Body Mist',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1007,'Girls','Personal Care','Deodorant',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1008,'Girls','Personal Care','Fragrance Gift Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1009,'Girls','Personal Care','Perfume and Body Mist',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1010,'Girls','Personal Care','Face Moisturisers',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1011,'Girls','Personal Care','Hair Brush and Comb',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1012,'Girls','Personal Care','Hair Care Kit',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1013,'Girls','Personal Care','Hair Cream and Mask',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1014,'Girls','Personal Care','Hair Gel and Spray',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1015,'Girls','Personal Care','Hair Serum',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1016,'Girls','Personal Care','Shampoo and Conditioner',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1017,'Girls','Personal Care','Hands & Feet',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1018,'Girls','Personal Care','Lip Care',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1019,'Girls','Personal Care','Lip Gloss',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1020,'Girls','Personal Care','Lip Liner',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1021,'Girls','Personal Care','Lip Plumper',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1022,'Girls','Personal Care','Lipstick',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1023,'Girls','Personal Care','Compact',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1024,'Girls','Personal Care','Concealer',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1025,'Girls','Personal Care','Eyebrow Enhancer',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1026,'Girls','Personal Care','Eyeshadow',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1027,'Girls','Personal Care','False Eyelashes',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1028,'Girls','Personal Care','Foundation and Primer',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1029,'Girls','Personal Care','Highlighter and Blush',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1030,'Girls','Personal Care','Makeup Brushes',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1031,'Girls','Personal Care','Makeup Gift Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1032,'Girls','Personal Care','Makeup Kit',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1033,'Girls','Personal Care','Makeup Remover',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1034,'Girls','Personal Care','Sindoor',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1035,'Girls','Personal Care','Nail Polish',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1036,'Girls','Personal Care','Bath Accessories',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1037,'Girls','Personal Care','Eye Cream',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1038,'Girls','Personal Care','Face Wash and Cleanser',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1039,'Girls','Personal Care','Feminine Hygiene',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1040,'Girls','Personal Care','Sunscreen',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1041,'Girls','Personal Care','Toner',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1042,'Girls','Personal Care','BB and CC Cream',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1043,'Girls','Personal Care','Bleach',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1044,'Girls','Personal Care','Face Scrub and Exfoliator',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1045,'Girls','Personal Care','Face Serum and Gel',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1046,'Girls','Personal Care','Mask and Peel',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1047,'Girls','Personal Care','Skin Care Gift Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1048,'Girls','Personal Care','Hair Appliance',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1049,'Girls','Personal Care','Trimmer',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1050,'Girls','Accessories','Mufflers',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1051,'Girls','Accessories','Shoe Care',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1052,'Girls','Accessories','Socks',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1053,'Girls','Accessories','Stoles',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1054,'Girls','Accessories','Wallets',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1055,'Girls','Accessories','Laundry Bag',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1056,'Girls','Accessories','Watches',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1057,'Girls','Accessories','Watch Gift Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1058,'Girls','Accessories','Watch Organiser',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1059,'Girls','Accessories','Backpacks',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1060,'Girls','Accessories','Clutches',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1061,'Girls','Accessories','Duffel Bag',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1062,'Girls','Accessories','Handbags',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1063,'Girls','Accessories','Laptop Bag',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1064,'Girls','Accessories','Messenger Bag',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1065,'Girls','Accessories','Mobile Pouch',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1066,'Girls','Accessories','Rucksacks',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1067,'Girls','Accessories','Tablet Sleeve',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1068,'Girls','Accessories','Trolley Bag',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1069,'Girls','Accessories','Waist Pouch',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1070,'Girls','Accessories','Sleeping Bag',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1071,'Girls','Accessories','Sunglasses',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1072,'Girls','Accessories','Sunglasses Case',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1073,'Girls','Accessories','Frames',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1074,'Girls','Accessories','Hair Accessory',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1075,'Girls','Accessories','Headphones',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1076,'Girls','Accessories','Headwear',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1077,'Girls','Accessories','Caps',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1078,'Girls','Accessories','Hat',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1079,'Girls','Accessories','Headband',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1080,'Girls','Accessories','Helmets',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1081,'Girls','Accessories','Key chain',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1082,'Girls','Accessories','Mobile Accessories',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1083,'Girls','Accessories','Fitness Bands',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1084,'Girls','Accessories','Smart Watches',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1085,'Girls','Accessories','Wristbands',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1086,'Girls','Accessories','Stationery',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1087,'Girls','Accessories','Suspenders',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1088,'Girls','Accessories','Travel Accessory',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1089,'Girls','Accessories','School Essentials',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1090,'Girls','Accessories','Accessory Gift Set',5,'2020-06-10 09:42:05','2020-06-10 09:42:05',NULL,NULL),
(1091,'women','Accessories','Arm Warmer',2,'2020-10-20 08:20:45','2020-10-20 11:19:30',-1,-1),
(1092,'women','Accessories','Arm Warmers',2,'2020-10-20 10:10:30','2020-10-20 10:10:30',-1,-1);

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `parent_id` varchar(50) NOT NULL DEFAULT '0',
  `image` varchar(500) NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

/*Data for the table `categories` */

insert  into `categories`(`id`,`name`,`parent_id`,`image`,`status`,`created_date`,`modified_date`,`created_by`,`modified_by`) values 
(1,'Women','0','https://rukminim1.flixcart.com/image/800/800/abaya-burqa/b/g/u/wb00004-hawai-m-original-imae3ffwybx7fdkt.jpeg?q=90','1','2018-10-31 13:29:52','2018-10-31 13:29:52',NULL,NULL),
(2,'Ethnic wear','1','https://rukminim1.flixcart.com/image/800/800/abaya-burqa/b/g/u/wb00004-hawai-m-original-imae3ffwybx7fdkt.jpeg?q=90','1','2018-10-31 13:29:52','2020-08-13 07:53:45',NULL,NULL),
(3,'Boys','0','https://rukminim1.flixcart.com/image/800/800/apparels-combo/m/7/m/jb5pckvestdyk-1col-jb3pckshrtcmb-2multicolor-gkidz-original-imae4hckhzt8zraz.jpeg?q=90','1','2018-10-31 13:40:48','2018-10-31 13:40:48',NULL,NULL),
(4,'Additional','3','https://rukminim1.flixcart.com/image/800/800/apparels-combo/m/7/m/jb5pckvestdyk-1col-jb3pckshrtcmb-2multicolor-gkidz-original-imae4hckhzt8zraz.jpeg?q=90','1','2018-10-31 13:40:48','2018-10-31 13:40:48',NULL,NULL),
(5,'Men','0','https://rukminim1.flixcart.com/image/800/800/apparels-combo/e/x/t/2103-golden-yellow-black-nivia-original-imae5wfzjwgx5qbh.jpeg?q=90','1','2018-10-31 13:40:48','2018-10-31 13:40:48',NULL,NULL),
(6,'Additional','5','https://rukminim1.flixcart.com/image/800/800/apparels-combo/e/x/t/2103-golden-yellow-black-nivia-original-imae5wfzjwgx5qbh.jpeg?q=90','1','2018-10-31 13:40:48','2018-10-31 13:40:48',NULL,NULL),
(7,'Girls','0','https://rukminim1.flixcart.com/image/800/800/apparels-combo/j/p/r/jg2-cmb5-sty-5-bwgmulticolor-gkidz-original-imae7h22tz4jxx6z.jpeg?q=90','1','2018-10-31 13:40:49','2018-10-31 13:40:49',NULL,NULL),
(8,'Additional','7','https://rukminim1.flixcart.com/image/800/800/apparels-combo/j/p/r/jg2-cmb5-sty-5-bwgmulticolor-gkidz-original-imae7h22tz4jxx6z.jpeg?q=90','1','2018-10-31 13:40:49','2018-10-31 13:40:49',NULL,NULL),
(9,'Additional','1','https://rukminim1.flixcart.com/image/800/800/apparels-combo/u/r/p/cl-28-red-cl-32-bl-claura-original-imaeafzqh2zdg4qp.jpeg?q=90','1','2018-10-31 13:56:23','2018-10-31 13:56:23',NULL,NULL),
(10,'Ethnic wear','3','https://rukminim1.flixcart.com/image/800/800/apparels-combo/k/u/y/vasbco014-jbn-creation-original-imaegfcayzp3uexc.jpeg?q=90','1','2018-10-31 14:18:29','2018-10-31 14:18:29',NULL,NULL),
(11,'Sleepwear','3','https://rukminim1.flixcart.com/image/800/800/apparels-combo/s/m/k/cset-dl450-beige-black-dbpc-beige-black-dongli-original-imaegz7yyv5r3nxd.jpeg?q=90','1','2018-10-31 15:10:44','2018-10-31 15:10:44',NULL,NULL),
(12,'Innerwear & Sleepwear','7','https://rukminim1.flixcart.com/image/800/800/apparels-combo/j/v/z/sm777-green-sm1400-red-smh600-green-red-sini-mini-original-imaegvxpyjkqxcha.jpeg?q=90','1','2018-10-31 15:37:05','2018-10-31 15:37:05',NULL,NULL),
(13,'Suits,Blazers','3','https://rukminim1.flixcart.com/image/800/800/suit/s/h/h/ak2218blue-adidas-13-14-years-original-imaezzrhhbufdjak.jpeg?q=90','1','2018-10-31 15:40:33','2020-08-13 08:33:44',NULL,NULL),
(14,'Ethnic Wear','7','https://rukminim1.flixcart.com/image/800/800/apparels-combo/e/v/g/hb469-hey-baby-original-imaehvdczz8huwzk.jpeg?q=90','1','2018-10-31 15:46:39','2018-10-31 15:46:39',NULL,NULL),
(15,'Accessories','1','https://rukminim1.flixcart.com/image/800/800/applique-patch/g/z/a/jutt-work-patch-empatera-original-imaehayqzbbhgcqe.jpeg?q=90','1','2018-10-31 16:10:48','2018-10-31 16:10:48',NULL,NULL),
(16,'Accessories','5','https://rukminim1.flixcart.com/image/800/800/arm-sleeve/h/t/q/am-ts-flosmc-1-alphaman-l-original-imae83padhg2gefd.jpeg?q=90','1','2018-10-31 16:10:50','2018-10-31 16:10:50',NULL,NULL),
(17,'Beauty and Personal care','5','https://rukminim1.flixcart.com/image/800/800/aftershave-lotion/b/z/z/brut-100-ml-eau-de-brut-aftershave-original-imad9e3wetfmazug.jpeg?q=90','1','2018-10-31 16:10:59','2020-08-13 07:58:40',NULL,NULL),
(18,'Innerwear,Sleepwear,Swimmingwear','1','https://rukminim1.flixcart.com/image/800/800/babydoll/m/k/t/x81-60bs-klamotten-free-original-imae8y24b44fq5kh.jpeg?q=90','1','2018-10-31 17:30:55','2020-08-13 07:53:59',NULL,NULL),
(19,'Accessories','7','https://rukminim1.flixcart.com/image/800/800/bandana/b/6/t/120-36-cm250-fabseasons-s-original-imaenwzwgmbt4yff.jpeg?q=90','1','2018-11-01 10:31:46','2018-11-01 10:31:46',NULL,NULL),
(20,'Tops','1','https://rukminim1.flixcart.com/image/800/800/blouse/9/a/k/s-110024459red-honey-by-pantaloons-original-imaeqnsw2fjghcvf.jpeg?q=90','1','2018-11-01 11:07:11','2018-11-01 11:07:11',NULL,NULL),
(21,'Innerwear & Sleepwear','3','https://rukminim1.flixcart.com/image/800/800/bloomer-drawer/7/h/j/18-24-months-printed-bloomer-boy-s-girl-s-brief-panty-pack-of-12-original-imaegupzmqzk4hnm.jpeg?q=90','1','2018-11-01 11:32:41','2018-11-01 11:32:41',NULL,NULL),
(22,'Tops','3','https://rukminim1.flixcart.com/image/800/800/bodysuit-sleepsuit/t/4/k/6-3-rbtko164-blue-bus-store-na-original-imaearmznatmhszq.jpeg?q=90','1','2018-11-01 11:33:09','2018-11-01 11:33:09',NULL,NULL),
(23,'Shoewear','7','https://rukminim1.flixcart.com/image/800/800/jmwch3k0/kids-shoe/m/q/c/12-890429000-disney-original-imaf9zzpj6xey2yz.jpeg?q=90','1','2018-11-01 11:34:41','2018-11-01 11:34:41',NULL,NULL),
(24,'Shoewear','3','https://rukminim1.flixcart.com/image/800/800/jm573ww0/bootie/w/f/z/6-12-mapbbo0684-disney-9-original-imaf94btgcjffy3g.jpeg?q=90','1','2018-11-01 11:34:42','2018-11-01 11:34:42',NULL,NULL),
(25,'Outerwear,Sweaters','1','https://rukminim1.flixcart.com/image/800/800/j83d8cw0/coat/u/5/h/xl-sardar-coat-rani-ariva-original-imaewy46sk2fdpz4.jpeg?q=90','1','2018-11-02 09:13:32','2020-08-13 07:54:10',NULL,NULL),
(26,'Innerwear, Sleepwear','5','https://rukminim1.flixcart.com/image/800/800/brief/f/z/g/1402-dora-80-original-imae7yhwk2txv2tz.jpeg?q=90','1','2018-11-02 18:56:15','2020-08-13 08:04:40',NULL,NULL),
(27,'Suits,Blazers','1','https://rukminim1.flixcart.com/image/800/800/blazer/u/h/v/vwbz313f3481-van-heusen-s-original-imadhm49k8xrnjft.jpeg?q=90','1','2018-11-02 18:57:26','2020-08-13 07:54:20',NULL,NULL),
(28,'Suits & blazers','5','https://rukminim1.flixcart.com/image/800/800/blazer/b/m/f/bz-712g-platinum-studio-36-original-imadtd8qndnugrmt.jpeg?q=90','1','2018-11-02 18:57:27','2020-08-14 04:27:42',NULL,NULL),
(29,'Accessories','3','https://rukminim1.flixcart.com/image/800/800/cap/y/8/u/144-96-hk21red-innovationthestore-l-original-imae43juzs4kbqgp.jpeg?q=90','1','2018-11-02 19:10:53','2018-11-02 19:10:53',NULL,NULL),
(30,'Outerwear,Sweaters','7','https://rukminim1.flixcart.com/image/800/800/coat/r/t/g/w5tg40001-pumpkin-patch-12-18-months-original-imaecux7bns5gvzs.jpeg?q=90','1','2018-11-02 19:17:44','2020-08-13 08:29:26',NULL,NULL),
(31,'Outerwear,Sweaters','3','https://rukminim1.flixcart.com/image/800/800/cardigan/y/m/u/48-36-10000742-lilliput-3-4-years-original-imaeazf4yrwjnhhu.jpeg?q=90','1','2018-11-02 19:23:34','2020-08-13 08:30:58',NULL,NULL),
(32,'Outerwear,Sweaters','5','https://rukminim1.flixcart.com/image/800/800/cardigan/x/u/y/swtrca01-srota-xl-original-imadqsy4d8xns4px.jpeg?q=90','1','2018-11-02 19:23:47','2020-08-13 07:59:13',NULL,NULL),
(33,'Ethnic wear','5','https://rukminim1.flixcart.com/image/800/800/churidar/s/w/g/pr-109-3-prayyan-l-original-imaemw8ytfrtkzsp.jpeg?q=90','1','2018-11-02 19:33:04','2020-08-13 08:24:26',NULL,NULL),
(34,'Bottoms','1','https://rukminim1.flixcart.com/image/800/800/capri/u/k/d/awcr313c1798-allen-solly-28-original-imadhc4csdczpsxw.jpeg?q=90','1','2018-11-02 19:33:27','2018-11-02 19:33:27',NULL,NULL),
(35,'Bottoms','7','https://rukminim1.flixcart.com/image/800/800/capri/e/q/g/132-120-tsyg-ss14-mf3010-red-super-young-original-imae2rpz53byhcfd.jpeg?q=90','1','2018-11-02 19:34:00','2018-11-02 19:34:00',NULL,NULL),
(36,'Bottoms','5','https://rukminim1.flixcart.com/image/800/800/cargo/n/d/b/ceilingblack-pepe-32-original-imadwkfhsj2znuhz.jpeg?q=90','1','2018-11-02 20:04:29','2018-11-02 20:04:29',NULL,NULL),
(37,'Bottoms','3','https://rukminim1.flixcart.com/image/800/800/j2hw58w0/kids-short/w/h/f/6-7-years-ukst5210khakhi-khakhi-u-s-polo-kids-original-imaetu9kbapfsgws.jpeg?q=90','1','2018-11-05 10:44:22','2018-11-05 10:44:22',NULL,NULL),
(38,'Tops','7','https://rukminim1.flixcart.com/image/800/800/kids-dress/t/7/q/p30602067365161navy-people-navy-8-9-years-original-imaepw2gnweurdg6.jpeg?q=90','1','2018-11-05 13:10:18','2018-11-05 13:10:18',NULL,NULL),
(39,'Clothing/Fabrics','5','https://rukminim1.flixcart.com/image/800/800/fabric/f/k/2/ch-shrt-0814-18-cotton-hub-original-imadzddsa5guk32m.jpeg?q=90','1','2018-11-05 14:06:03','2018-11-05 14:06:03',NULL,NULL),
(40,'Clothing/Fabrics','1','https://rukminim1.flixcart.com/image/800/800/fabric/a/k/j/psbps4-306-pshopee-original-imaee82ffkezampg.jpeg?q=90','1','2018-11-05 14:25:14','2018-11-05 14:25:14',NULL,NULL),
(41,'Costume Wears','7','https://rukminim1.flixcart.com/image/800/800/j51cbrk0/kids-dress/k/u/c/0-6-months-c-204-black-black-aarika-original-imaecyhfed9qbzmh.jpeg?q=90','1','2018-11-05 16:32:48','2018-11-05 16:32:48',NULL,NULL),
(42,'Costume Wear','3','https://rukminim1.flixcart.com/image/800/800/kid-costume-wear/4/x/h/72-60-pf002-pakhi-fashions-original-imae99cgr2tfpwhq.jpeg?q=90','1','2018-11-05 16:32:49','2020-08-13 08:32:17',NULL,NULL),
(43,'Innerwear,Sleepwear,Swimmingwear','5','https://rukminim1.flixcart.com/image/800/800/moisturizer-cream/j/k/k/50-almond-nutrifying-skin-food-iraya-original-imaer6qt2ystnczq.jpeg?q=90','1','2018-11-13 10:13:27','2020-08-14 04:28:34',NULL,NULL),
(44,'Innerwear & Sleepwear','5','https://rukminim1.flixcart.com/image/800/800/night-suit/t/3/p/ns-101-black-colors-and-blends-38-original-imadzwgatrpdfg7y.jpeg?q=90','1','2018-11-13 10:37:30','2018-11-13 10:37:30',NULL,NULL),
(45,'Sleepwear','5','https://rukminim1.flixcart.com/image/800/800/night-suit/a/g/t/1-1-roundblack-vivid-bharti-5xl-original-imae5wxvhhhqd2e5.jpeg?q=90','1','2018-11-13 10:37:59','2018-11-13 10:37:59',NULL,NULL),
(46,'Shoewear','5','https://rukminim1.flixcart.com/image/800/800/slipper-flip-flop/6/u/7/black-white-806-stylar-6-original-imae2yzzghrganah.jpeg?q=90','1','2018-11-13 13:57:56','2018-11-13 13:57:56',NULL,NULL),
(47,'Shoewear','1','https://rukminim1.flixcart.com/image/800/800/slipper-flip-flop/b/n/x/c-navy-orange-biker-chick-sole-threads-4-original-imae3r8cnw7xyj6r.jpeg?q=90','1','2018-11-13 13:57:57','2018-11-13 13:57:57',NULL,NULL),
(48,'Mens Footwear','5','https://rukminim1.flixcart.com/image/800/800/jnyxd3k0/shoe/8/x/q/aerocft-9-yonex-white-black-original-imafagv2zqz7dsgb.jpeg?q=90','1','2018-11-23 10:13:36','2018-11-23 10:13:36',NULL,NULL),
(49,'Mens Clothing','5','https://rukminim1.flixcart.com/flap/800/800/image/9b6aafffae035ed0.jpeg?q=90','1','2018-11-23 10:53:57','2018-11-23 10:53:57',NULL,NULL),
(50,'Kids','0','https://rukminim1.flixcart.com/flap/800/800/image/3e891c.jpg?q=90','1','2018-11-23 10:53:57','2018-11-23 10:53:57',NULL,NULL),
(51,'Kids Clothing','50','https://rukminim1.flixcart.com/flap/800/800/image/3e891c.jpg?q=90','1','2018-11-23 10:53:57','2018-11-23 10:53:57',NULL,NULL),
(52,'Jewellery','1','https://rukminim1.flixcart.com/image/800/800/bangle-bracelet-armlet/f/u/b/wa-125-31-2-4-much-more-64-original-imaemc4zjgrvbrge.jpeg?q=90','1','2018-11-23 10:53:57','2018-11-23 10:53:57',NULL,NULL),
(53,'null','0','https://rukminim1.flixcart.com/flap/800/800/image/0fad27.jpg?q=90','1','2018-11-23 10:53:57','2020-07-20 13:49:03',NULL,NULL),
(54,'Jewellery','53','https://rukminim1.flixcart.com/flap/800/800/image/0fad27.jpg?q=90','1','2018-11-23 10:53:57','2018-11-23 10:53:57',NULL,NULL),
(55,'Womens Clothing','1','https://rukminim1.flixcart.com/image/800/800/j2z1fgw0/kurta/t/y/y/xl-110027978red-rangmanch-by-pantaloons-original-imaeu3yu4vpsmxkz.jpeg?q=90','1','2018-11-23 10:53:57','2018-11-23 10:53:57',NULL,NULL),
(56,'Womens Clothing','53','https://rukminim1.flixcart.com/image/800/800/j3g6pow0/lipstick/x/d/p/3-6-9-to-5-matte-lip-color-lakme-original-imaetvrttrasfrsx.jpeg?q=90','1','2018-11-23 10:53:57','2018-11-23 10:53:57',NULL,NULL),
(57,'Womens Footwear','1','https://rukminim1.flixcart.com/image/800/800/jn0msnk0/shoe/h/c/u/19139901-4-puma-peach-original-imaf9s23sejqjtcx.jpeg?q=90','1','2018-11-23 10:53:57','2018-11-23 10:53:57',NULL,NULL),
(58,'Kids Clothing','53','https://rukminim1.flixcart.com/image/800/800/j406vm80/fabric/s/f/g/vpl-mahiya-red-6085-divastri-original-imaetpra2uzfazhz.jpeg?q=90','1','2018-11-23 10:53:57','2018-11-23 10:53:57',NULL,NULL),
(59,'Womens Footwear','53','https://rukminim1.flixcart.com/flap/800/800/image/022e96a8d051f9d7.jpg?q=90','1','2018-11-27 17:23:28','2018-11-27 17:23:28',NULL,NULL),
(60,'Mens Footwear','53','https://rukminim1.flixcart.com/image/800/800/jfk00i80/kids-nightwear/x/7/h/2-3-years-mcbaw17sc003-miss-chief-original-imaf3zwwvbxym4k4.jpeg?q=90','1','2019-03-06 10:42:14','2019-03-06 10:42:14',NULL,NULL),
(61,'Tops','5','https://rukminim1.flixcart.com/image/800/800/shirt/a/q/8/lesh7506white-lee-m-original-imadvk2wwazhj8ap.jpeg?q=90','1','2019-03-07 10:47:55','2019-03-07 10:47:55',NULL,NULL),
(62,'Combo Sets','1','https://rukminim1.flixcart.com/image/800/800/apparels-combo/r/g/z/7110531012-iw-a1-indiweaves-original-imaejngxw7dfsu65.jpeg?q=90','1','2019-04-20 15:20:00','2019-04-20 15:20:00',NULL,NULL),
(67,'Combo Sets','3','https://rukminim1.flixcart.com/image/800/800/apparels-combo/4/7/v/jb2-cmb2-lsl-dyk-1-colmulticolor-gkidz-original-imae7h53refkbdgr.jpeg?q=90','1','2019-12-31 12:11:45','2019-12-31 12:11:48',NULL,NULL),
(70,'categ','1','','0','2020-10-22 05:46:54','2020-10-22 05:46:54',-1,-1),
(71,'categ','3','','0','2020-10-22 07:04:48','2020-10-22 07:04:48',-1,-1),
(72,'categ','0','https://buckimage.s3.us-east-2.amazonaws.com/1603350795796.jpeg','0','2020-10-22 07:04:59','2020-10-22 07:20:50',-1,-1),
(73,'categ','7','https://buckimage.s3.us-east-2.amazonaws.com/1603350473429.jpeg','0','2020-10-22 07:07:56','2020-10-22 07:07:56',-1,-1),
(74,'categ','53','','0','2020-10-22 07:21:31','2020-10-22 07:21:31',-1,-1);

/*Table structure for table `color_code_main` */

DROP TABLE IF EXISTS `color_code_main`;

CREATE TABLE `color_code_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color_name` varchar(50) DEFAULT NULL,
  `color_code` varchar(50) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=989 DEFAULT CHARSET=latin1;

/*Data for the table `color_code_main` */

insert  into `color_code_main`(`id`,`color_name`,`color_code`,`created_date`,`modified_date`,`created_by`,`modified_by`) values 
(1,'2Black','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(2,'Ablack','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(3,'B-Black','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(4,'Bblack','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(5,'Black','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(6,'Black C','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(7,'Black Cat','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(8,'Black color','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(9,'Black Ditsy','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(10,'black doted','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(11,'Black Geo','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(12,'Black Multiprint','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(13,'Black N Leaf Print','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(14,'Black N Print','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(15,'Black Print','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(16,'Black Printed','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(17,'Black Satin','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(18,'Black solid body','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(19,'Black trims','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(20,'Black_Bra','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(21,'Black01','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(22,'Black02','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(23,'Black06','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(24,'Black1','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(25,'Black2','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(26,'Black3','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(27,'Black4','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(28,'Black5','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(29,'Black6','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(30,'BlackA','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(31,'BlackB','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(32,'BlackC','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(33,'BlackE24','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(34,'Blacl','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(35,'BLK','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(36,'blkack','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(37,'Bold Black','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(38,'COAL BLACK','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(39,'EL-BR-054Black','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(40,'EL-WS7SB004Bold Black Print','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(41,'Electric Black','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(42,'English Black','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(43,'Floral Black','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(44,'Midnight Black','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(45,'Mysterious Black Floral','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(46,'night black','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(47,'Pitch Black','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(49,'POLLUTION MONSTER MASK FULL FACE CAP BLACK FOR BIK','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(50,'Puma Black','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(51,'Puma Black Heather','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(52,'Puma BlackPUMA','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(53,'RB006Black','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(54,'Vintage Black','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(55,'ZBlack2','#000000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(56,'MP-BR-015Navy Blue','#000080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(57,'MP-BR-016Navy Blue/White','#000080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(58,'Navi Blue','#000080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(59,'NaviBlue','#000080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(60,'Navy','#000080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(61,'Navy Blossom','#000080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(62,'Navy Blue','#000080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(63,'Navy Leopard Print','#000080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(64,'NAVY TBLUE','#000080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(65,'NavyBlue','#000080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(66,'Nevy Blue','#000080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(67,'RB010Navy Blue','#000080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(68,'True Navy','#000080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(69,'Blue Dark','#00008b','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(70,'Dark Blue','#00008b','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(71,'Earth Blue','#0000A0','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(72,'Milange Blue','#0000fc','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(73,'Ablue','#0000ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(74,'BBlue','#0000ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(75,'biue','#0000ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(76,'Blue','#0000ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(77,'Blue Jewel','#0000ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(78,'Blue matrix','#0000ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(79,'Blue N Print','#0000ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(80,'Blue Piping','#0000ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(81,'BLUE ROMPER','#0000ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(82,'blue01','#0000ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(83,'blue02','#0000ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(84,'blue03','#0000ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(85,'blue04','#0000ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(86,'blue05','#0000ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(87,'blue07','#0000ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(88,'blue1','#0000ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(89,'BlueC','#0000ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(90,'BlueE','#0000ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(91,'INSIGNIA BLUE','#0000ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(92,'LBlue','#0000ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(93,'Mauritius blue','#0000ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(94,'MESH BLUE','#0000ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(96,'Mint Blue','#429E9D','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(97,'MYKONE BLUE','#0000ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(98,'N.Blue','#0000ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(99,'new blue eyes','#0000ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(100,'nibbi blue','#0000ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(101,'PBLUE','#0000ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(103,'R Blue','#0000ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(104,'RBlue','#0000ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(105,'see blue','#0000FF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(106,'TBBLUE','#0000ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(107,'tblue','#0000ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(108,'Vibrant Blue','#0000ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(109,'Cobalt Blue','#0020C2','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(110,'BlackishBlue','#003366','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(111,'Blueberry Blue','#0041C2','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(112,'Classic Cobalt','#0047ab','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(113,'Cobalt','#0047ab','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(114,'Dark Green','#006400','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(115,'Persian Blue','#0067a5','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(116,'Sea blue','#006994','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(117,'Botel Green','#006a4e','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(118,'Bottle','#006a4e','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(119,'BOTTLE GREEN','#006a4e','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(120,'Bottle Green Print','#006a4e','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(121,'Teal Green','#006d5b','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(122,'Ocean Blue','#0077be','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(123,'Azure','#007fff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(124,'Beautiful green','#008000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(125,'Cgreen','#008000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(126,'Green01','#008000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(127,'Green02','#008000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(128,'Green03','#008000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(129,'Green04','#008000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(130,'Green05','#008000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(131,'Green06','#008000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(132,'M.Green','#008000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(133,'Original Green','#008000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(134,'Pgreen','#008000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(135,'Rama','#008000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(136,'S.Green','#008000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(137,'Jteal','#008080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(138,'Teal','#008080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(139,'Jade','#00A86B','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(140,'Scuba Blue','#00B2CA','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(141,'Deep Blue','#00bfff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(142,'Deep SkyBlue','#00bfff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(143,'Dot Militry green','#00FF00','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(144,'Green','#00FF00','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(145,'green Mixed','#00FF00','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(146,'Green N Print','#00FF00','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(147,'Green Two Tone','#00FF00','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(148,'MGreen','#00FF00','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(149,'Military Green','#00FF00','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(151,'R Green','#00FF00','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(152,'Aqua','#00ffff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(153,'Cyan','#00FFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(154,'Cyan or Aqua','#00FFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(155,'ARUBA BLUE','#018c85','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(156,'ARUBA BLUE_1','#018c85','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(157,'Greyblack','#020202','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(158,'snorkel blue','#034F84','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(159,'Aqua green','#03bb85','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(160,'Neon black','#0A0A08','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(161,'Tiffany Blue','#0abab5','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(162,'Night','#0C090A','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(163,'SAPPHIRE','#0f52ba','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(164,'Sapphire Blue','#0f52ba','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(165,'Denim Dark Blue','#151B8D','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(166,'Lapis Blue','#15317E','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(167,'DARK DENIM','#1560bd','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(168,'DENIM','#1560BD','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(169,'Denimx','#1560BD','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(170,'Blue Eyes','#1569C7','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(171,'Blue Dress','#157DEC','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(172,'Dodger Blue','#1589FF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(173,'Fluroscent Blue','#15f4ee','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(174,'Petrol','#16738F','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(175,'Petrol blue','#16738F','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(176,'Midnight Blue','#191970','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(177,'Purplish Blue','#1c18ab','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(178,'MOROCCAN BLUE','#1c6190','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(179,'Aqua blue','#1e5878','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(180,'AquaBlue','#1e5878','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(181,'Blue Orchid','#1F45FC','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(182,'Robin Blue','#1fcecb','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(183,'Robin Egg Blue','#1fcecb','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(184,'Rama Green','#20B2AA','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(185,'Rema Green','#20B2AA','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(186,'SODALITE BLUE','#253668','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(187,'Dark Slate Grey','#25383C','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(188,'Dark Forest Green','#254117','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(189,'Indigo Blue','#27334c','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(190,'Atlantic Blue','#28293b','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(191,'Carbon Black','#293542','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(192,'Midnight','#2B1B17','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(193,'Dark Slate Blue','#2B3856','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(194,'Blue Jay','#2B547E','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(195,'Atoll','#2B797A','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(196,'Gunmetal','#2C3539','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(197,'Dazzling Blue','#2E4DA7','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(198,'Brinjal','#301934','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(199,'Medium Sea Green','#306754','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(200,'Blue Ribbon','#306EFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(201,'Greenish Blue','#307D7E','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(202,'Blue Ivy','#3090C7','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(203,'peacock','#326872','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(204,'Peacock Blue','#326872','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(205,'ferozi','#326DBB','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(206,'Firoze','#326DBB','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(207,'Firozi','#326DBB','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(208,'Lime Green','#32cd32','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(209,'Blue Whale','#342D7E','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(210,'Medium Forest Green','#347235','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(211,'Shamrock Green','#347C17','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(212,'Jungle Green','#347C2C','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(213,'Medium Spring Green','#348017','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(214,'Medium Aquamarine','#348781','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(215,'Windows Blue','#357EC7','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(216,'Charcoal','#36454f','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(217,'Charcoal grey','#36454f','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(218,'Teal Blue','#367588','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(219,'Glacial Blue Ice','#368BC1','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(220,'Apple mint','#36C395','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(221,'Pine Green','#387C44','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(222,'Butterfly Blue','#38ACEC','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(223,'Neon green','#39ff14','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(224,'PEACOCK GREEN','#3a6066','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(225,'Oil','#3B3131','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(226,'Dark Turquoise','#3B9C9C','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(227,'Deep Sky Blue','#3BB9FF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(228,'Iridium','#3D3C3A','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(229,'Clover Green','#3EA055','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(230,'Light Sea Green','#3EA99F','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(231,'Choco Brown','#3f000f','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(232,'Turqouise','#40E0D0','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(233,'Turquise','#40E0D0','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(234,'Turquoise','#40E0D0','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(235,'Turquoise Blue','#40E0D0','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(236,'Turquoise_1','#40E0D0','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(237,'Turquoise_2','#40E0D0','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(238,'Roal Blue','#4169e1','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(239,'royal blue','#4169e1','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(240,'Royal Blue1','#4169e1','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(241,'Royal Blue11','#4169e1','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(242,'Royal Blue2','#4169e1','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(243,'Royal Blue6','#4169e1','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(244,'Royal Blue7','#4169e1','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(245,'Royal Blue9','#4169e1','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(246,'RoyalBLue','#4169e1','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(247,'Leaf Green','#426640','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(249,'Seaweed Green','#437C17','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(250,'Sea Turtle Green','#438D80','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(251,'Macaw Blue Green','#43BFC7','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(252,'PURPLE VELVET','#443C54','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(253,'Pepper Green','#456c3b','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(254,'Purple Monster','#461B7E','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(255,'Black Eel','#463E3F','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(256,'steel blue','#4682b4','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(257,'Jellyfish','#46C7C7','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(258,'Taupe','#483C32','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(259,'Silk Blue','#488AC7','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(260,'Medium Turquoise','#48CCCD','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(261,'Mocha','#493D26','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(262,'Iris Blue','#4a5862','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(263,'Spring Green','#4AA02C','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(264,'Indigo','#4B0082','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(265,'PURPLE BERRY','#4b4a74','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(266,'Natural green','#4b8b3b','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(267,'Black Cow','#4C4646','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(268,'Beetle Green','#4C787E','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(269,'Green Apple','#4CC417','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(270,'Kelly Green','#4CC552','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(271,'Neon Blue','#4d4dff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(272,'Noen Blue','#4d4dff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(273,'Purple Haze','#4E387E','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(274,'Forest Green','#4E9258','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(275,'Blue Diamond','#4EE2EC','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(276,'Elegant Black','#4f494b','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(277,'Metallic Blue','#4f738e','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(278,'Berry Blue','#4f86f7','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(279,'Blueberry','#4F86F7','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(280,'Gray Wolf','#504A4B','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(281,'Celeste','#50EBEC','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(282,'Zombie Green','#54C571','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(283,'sea green','#54ff9f','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(284,'megand','#556b2f','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(285,'MEGANDI','#556b2f','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(286,'mehendi','#556b2f','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(287,'mehndi','#556b2f','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(288,'MehndiGreen','#556b2f','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(289,'Vampire Gray','#565051','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(290,'Marble Blue','#566D7E','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(291,'Iceberg','#56A5EC','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(292,'Purple Iris','#571B7E','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(293,'Azure Blue','#5794ae','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(294,'Azure Blue Pixel Print','#5794ae','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(295,'Stoplight Go Green','#57E964','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(296,'Blue Zircon','#57FEFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(297,'Plum Purple','#583759','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(298,'Nebula Green','#59E817','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(299,'Gray Dolphin','#5C5858','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(300,'Crystal Blue','#5CB3FF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(301,'JEANS BLUE','#5DADEC','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(302,'Grape','#5E5A80','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(303,'Grayish Turquoise','#5E7D7E','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(304,'Arctic Blue','#5ea3b3','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(305,'Jade Green','#5EFB6E','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(306,'Emerald Green','#5FFB17','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(308,'EGGPLANT','#614051','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(309,'Jet Gray','#616D7E','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(310,'Hazel Green','#617C58','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(311,'Dark purple','#620062','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(312,'Carbon Gray','#625D5D','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(313,'Mist Blue','#646D7E','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(314,'Cornflower Blue','#6495ED','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(315,'Algae Green','#64E986','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(316,'Hot Red','#651415','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(317,'Slate Gray','#657383','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(318,'Blue Depths','#65778D','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(319,'Blue Koi','#659EC7','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(320,'Ash Gray','#666362','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(321,'Fern Green','#667C26','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(322,'Livid','#6699CC','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(323,'Blue Lotus','#6960EC','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(324,'Purple Jam','#6A287E','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(325,'Green Onion','#6AA121','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(326,'Dragon Green','#6AFB92','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(327,'Purple Amethyst','#6C2DC7','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(328,'Green Snake','#6CBB3C','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(329,'Alien Green','#6CC417','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(330,'Cloudy Gray','#6D6968','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(331,'Light Slate Gray','#6D7B8D','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(332,'Coffe','#6f4e37','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(333,'Coffee','#6f4e37','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(334,'Algiers blue','#70a1a3','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(335,'wine','#722f37','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(336,'Smokey Gray','#726E6D','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(337,'Venom Green','#728C00','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(338,'Light Steel Blue','#728FCE','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(339,'Light Slate Blue','#736AFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(340,'Slate Blue','#737CA1','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(341,'Ruby Wine','#77353D','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(342,'Blue Hosta','#77BFC7','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(343,'Royal purple','#7851a9','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(344,'ROYALPURPLE','#7851a9','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(345,'Sandstone','#786D5F','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(346,'Camouflage Green','#78866B','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(347,'Northern Lights Blue','#78C7C7','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(348,'VERRY CHERRY','#790604','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(349,'Denim Blue','#79BAEC','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(350,'Purple Sage Bush','#7A5DC7','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(351,'Iris Purple','#7a617c','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(352,'steel gray','#7b9095','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(353,'Blue green','#7BCCB5','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(354,'Rumba Red','#7C2439','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(355,'PICKLED BEET','#7c3e53','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(356,'Plum Pie','#7D0541','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(357,'Plum Velvet','#7D0552','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(358,'Cherry Red','#7d161a','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(359,'Dark Orchid','#7D1B7E','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(360,'EL-WS7SB002Electric Blue','#7DF9FF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(361,'Electric Blue','#7DF9FF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(362,'Tron Blue','#7DFDFE','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(363,'Blood Red','#7E3517','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(364,'Velvet Maroon','#7E354D','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(365,'Sangria','#7E3817','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(366,'Viola Purple','#7E587E','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(367,'volite','#7f00ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(368,'Lovely Purple','#7F38EC','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(369,'Sepia','#7F462C','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(370,'Rosy Finch','#7F4E52','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(371,'Red Dirt','#7F5217','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(372,'Dull Purple','#7F525D','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(373,'Puce','#7F5A58','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(374,'Hummingbird Green','#7FE817','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(375,'Aquamarine','#7FFFD4','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(376,'Cyan Green','#7fffd4','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(377,'Marun','#800000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(378,'BURGUNDY','#800020','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(379,'Apurple','#800080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(380,'Aqua Print','#800080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(381,'Deep Purple','#800080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(382,'JAMBALI','#800080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(383,'JAMBLI','#800080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(384,'Littlepurple','#800080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(385,'PURPAL','#800080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(386,'Purple Hearts','#800080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(387,'Purple Magic','#800080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(388,'Purple N Print','#800080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(389,'purple1','#800080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(391,'PURPLEC','#800080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(392,'PurpleE','#800080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(393,'PurpleE24','#800080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(394,'purpul','#800080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(395,'Sexy Purple','#800080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(396,'Firebrick','#800517','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(397,'Oak Brown','#806517','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(398,'olive','#808000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(399,'DGREY','#808080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(400,'gray','#808080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(401,'grey','#808080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(402,'Grey01','#808080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(403,'Grey02','#808080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(404,'Grey03','#808080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(405,'Grey04','#808080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(406,'Grey1','#808080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(407,'GREYMELANGE','#808080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(408,'Milange Grey','#808080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(409,'Multi Gray','#808080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(410,'Multi Grey','#808080','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(411,'AMaroon','#810541','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(412,'Mahroon','#810541','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(413,'Maroon01','#810541','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(414,'Maroon02','#810541','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(415,'mehroon','#810541','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(416,'MROON','#810541','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(417,'Original Maroon','#810541','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(418,'CherryBlack','#811B33','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(419,'Red Dahlia','#812630','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(420,'Deep Maroon','#820000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(421,'Raw Umber','#826644','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(422,'Moccasin','#827839','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(423,'Army Brown','#827B60','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(424,'Light Sky Blue','#82CAFA','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(425,'Day Sky Blue','#82CAFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(426,'Brown Bear','#835C3B','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(427,'Granite','#837E7C','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(428,'Dark Violet','#842DCE','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(429,'Medium Purple','#8467D7','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(430,'Battleship Gray','#848482','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(431,'Sage Green','#848b79','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(432,'Dollar Bill Green','#85BB65','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(433,'Columbia Blue','#87AFC7','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(434,'sky','#87ceeb','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(435,'Sky Blue','#87ceeb','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(436,'skyblue','#87ceeb','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(437,'Lawn Green','#87F717','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(438,'Stone Grey','#888c8d','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(439,'Aztech Purple','#893BFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(440,'Green Peas','#89C35C','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(441,'Baby Blue','#89cff0','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(442,'Sienna','#8A4117','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(443,'Chartreuse','#8AFB17','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(444,'Dark magenta','#8b008b','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(445,'Violet','#8D38C9','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(446,'Purple','#8E35EF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(447,'Falsa','#8E3E43','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(448,'Blue Lagoon','#8EEBEC','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(449,'Dark Sea Green','#8fbc8f','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(450,'Light Green','#90EE90','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(451,'LightGreen','#90EE90','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(452,'LITE GREEN','#90ee90','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(453,'Sugar Plum','#914E75','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(454,'Crocus Purple','#9172EC','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(455,'Dark Tan','#918151','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(456,'Cyan Opaque','#92C7C7','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(457,'Pista','#93c572','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(458,'Pista Green','#93c572','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(459,'Lucite Green','#93D3C3','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(460,'Light Aquamarine','#93FFE8','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(461,'Chestnut','#954535','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(462,'Wood','#966F33','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(463,'Parrat Green','#96cb7f','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(464,'parrot','#96cb7f','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(465,'parrot green','#96cb7f','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(466,'Perrot green','#96cb7f','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(467,'RB007Perrot Green','#96cb7f','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(468,'Autumn Leaves','#98482b','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(469,'Blue Gray','#98AFC7','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(470,'Mint green','#98ff98','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(471,'Crimson Red','#990000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(472,'Red Wine','#990012','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(473,'Frog Green','#99C68E','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(474,'Yellow Green','#9ACD32','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(475,'Dark Yellow','#9b870c','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(477,'Yellow Dark','#9b870c','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(478,'Iguana Green','#9CB071','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(479,'Candy Red','#9d2a17','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(480,'Sorrell Brown','#9d7f61','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(481,'Pistachio Green','#9DC209','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(482,'Purple Mimosa','#9E7BFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(483,'Cranberry','#9F000F','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(485,'Salad Green','#A1C935','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(486,'Jasmine Purple','#A23BEC','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(487,'Blue Bell','#a2a2d0','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(488,'browen','#A52A2A','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(489,'Brown','#A52A2A','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(490,'Brown01','#A52A2A','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(491,'Brown02','#A52A2A','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(492,'Brown03','#A52A2A','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(493,'Brown05','#A52A2A','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(494,'Purple Flower','#A74AC7','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(495,'rouge','#a94064','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(496,'ROUGE RED','#a94064','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(497,'English Red','#AB4B52','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(498,'Light Blue','#ADD8E6','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(499,'LightBlue','#ADD8E6','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(500,'Dark Goldenrod','#AF7817','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(501,'Bullet Shell','#AF9B60','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(502,'Coral Blue','#AFDCEC','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(503,'Turquoise Light','#afeeee','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(504,'maroon','#b03060','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(505,'Purple Daffodil','#B041FF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(506,'Medium Orchid','#B048B5','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(507,'Bronze metallic','#b08d57','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(508,'Purple Rose','#B09FCA','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(509,'POWDER BLUE','#b0e0e6','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(510,'Radiant Orchid','#B163A3','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(511,'Green Yellow','#B1FB17','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(512,'Lightmaroon','#B22222','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(513,'Ash Grey','#b2beb5','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(514,'Avocado Green','#B2C248','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(515,'Rasberry Rose','#b3446c','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(516,'Raspberry','#b3446c','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(517,'Rosy Brown','#B38481','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(518,'Sandalwood','#b4946c','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(519,'Pastel Blue','#B4CFEC','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(520,'Light Brown','#B5651D','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(521,'Brass','#B5A642','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(522,'Green Thumb','#B5EAAA','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(523,'Gray Cloud','#B6B6B4','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(524,'BRIGHT RUST','#b7410e','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(525,'Rust','#b7410e','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(526,'LIME','\"#B7C52C','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(527,'Blue Angel','#B7CEEC','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(528,'Capper','#b87333','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(529,'Copper','#B87333','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(530,'copper cat','#b87333','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(531,'Plum','#B93B8F','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(532,'Plum Origami','#B93B8F','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(533,'SWEET LILAC','#b99ec8','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(534,'Deer','#ba8759','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(535,'Olive Green','#bab86c','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(536,'BLOOMING BLUE','#bbd7e7','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(537,'Metallic Silver','#BCC6CC','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(538,'Silver metalic bra','#BCC6CC','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(539,'Slime Green','#BCE954','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(540,'wild lilac','#beb8cd','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(541,'LIME PUNCH','#BFD833','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(542,'Mahogany','#C04000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(543,'Jute','#c0957b','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(544,'light perple','#c0aee0','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(545,'RB010Silver','#C0C0C0','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(546,'silver','#C0C0C0','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(547,'Chilli Pepper','#C11B17','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(548,'Burnt Pink','#C12267','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(549,'Dark Carnation Pink','#C12283','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(550,'Rogue Pink','#C12869','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(551,'DEEP FUSCHIA','#c154c1','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(552,'Contessa Red','#c16f68','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(553,'Camel','#C19A6B','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(554,'Camel brown','#C19A6B','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(555,'WMELANGE','#c1cf7a','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(556,'Bashful Pink','#C25283','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(557,'Tulip Pink','#C25A7C','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(558,'ECRU','#C2B280','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(559,'ECRU PR','#C2B280','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(560,'Sand','#C2B280','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(561,'Neon purple','#c32aff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(562,'Chestnut Red','#C34A2C','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(563,'Red Fox','#C35817','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(564,'Purple Dragon','#C38EC7','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(565,'Light Jade','#C3FDB8','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(566,'Tyrian Purple','#C45AEC','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(567,'Orange Salmon','#C47451','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(568,'Pink Bow','#C48189','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(569,'Lipstick Pink','#C48793','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(570,'Mulberry Purple','#C54B8C','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(571,'Purple Mulberry','#C54B8C','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(572,'Cinnamon','#C58917','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(573,'Khaki Rose','#C5908E','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(574,'light purple','#c67dc6','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(575,'Litpurple','#c67dc6','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(576,'Caramel','#C68E17','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(577,'Wisteria Purple','#C6AEC7','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(578,'Verry Berry','#c75878','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(579,'Cookie Brown','#C7A317','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(580,'Rugby','#C7A994','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(581,'Tiger Orange','#C88141','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(582,'Lilac','#C8A2C8','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(583,'Fall Leaf Brown','#C8B560','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(584,'LimeLight','#c8cd77','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(585,'Ginger Brown','#C9BE62','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(586,'Medium Violet Red','#CA226B','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(587,'Brick Red','#cb4154','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(588,'Wild Lime','#CBD862','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(589,'Peech','#CC3366','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(590,'Sedona','#CC6600','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(591,'sesame','#cc9e6d','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(592,'SESAME - AMERICAN BEAUTY PR','#cc9e6d','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(593,'Tea Green','#CCFB5D','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(594,'Fluorescent Yellow','#CCFF00','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(595,'Light Slate','#CCFFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(596,'Cabaret','#cd526c','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(597,'Bronze','#cd7f32','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(598,'fire red','#ce2029','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(599,'Flame Scarlet','#CE2B37','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(600,'Bright Silver','#CFCED3','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(601,'Pale Blue Lily','#CFECEC','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(602,'gajari','#D12F49','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(603,'gajjri','#D12F49','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(604,'Gajri','#D12F49','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(605,'Pale Violet Red','#D16587','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(606,'Gray Goose','#D1D0CE','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(607,'Pear','#d1e231','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(608,'Choclate','#D2691E','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(610,'chocolate','#D2691E','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(611,'Cosmic Pink','#d26ea4','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(612,'TAN','#D2B48','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(613,'Thistle','#D2B9D3','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(614,'Light Grey','#D3D3D3','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(615,'LIGHTGRAY','#D3D3D3','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(616,'LIGHTGREY','#D3D3D3','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(617,'Heliotrope Purple','#D462FF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(618,'Orange Gold','#D4A017','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(619,'sandal','#d7b38c','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(620,'Mushroom','#d8ccc0','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(622,'ORCHID','#da70d6','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(623,'Wild orchid','#DA70D6','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(624,'Fiery Red','#db5243','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(625,'Grapefruit','#DC381F','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(626,'Deep Sea Coral','#DC5D61','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(627,'Neon Red','#DD0048','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(628,'Rose Cloud','#DDB3A3','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(629,'CERISE','#de3163','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(630,'Cherry','#de3163','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(631,'Blush','#DE5D83','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(632,'BurlyWood','#DEB887','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(633,'ruby','#e0115','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(634,'Mauve','#E0B0FF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(635,'Light Cyan','#E0FFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(636,'Dark Salmon','#E18B6B','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(637,'Crimson','#E238EC','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(638,'Brown Sugar','#E2A76F','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(639,'CADIUM RED','#e30022','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(640,'Dimorphotheca Magenta','#E3319D','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(641,'Cadillac Pink','#E38AAE','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(642,'Lavender blue','#E3E4FA','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(643,'Mexican Pink','#e4007c','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(644,'Love Red','#E41B17','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(645,'Lava Red','#E42217','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(646,'Pink Lemonade','#E4287C','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(647,'Pink Cupcake','#E45E9D','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(648,'Amaranth','#E52B50','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(649,'Valentine Red','#E55451','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(650,'Shocking Orange','#E55B3C','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(651,'Papaya Orange','#E56717','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(652,'SUNKIST CORAL','#E5697B','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(653,'Blush Red','#E56E94','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(654,'Pale Cream','#e5cb90','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(655,'Platinum','#E5E4E2','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(656,'Halloween Orange','#E66C2C','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(657,'Sunrise Orange','#E67451','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(658,'Blush Pink','#E6A9EC','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(659,'lavender','#e6e6fa','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(660,'Lavender N Print','#e6e6fa','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(661,'Dark Pink','#e75480','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(662,'Dark Rani','#e75480','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(663,'DarkPink','#e75480','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(664,'American Rose Red','#e7638f','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(665,'Rose red','#e7638f','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(666,'Light Coral','#E77471','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(667,'Pink Daisy','#E799A3','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(668,'Pink Rose','#E7A1B0','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(669,'chiku','#E7D5AD','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(670,'Chickoo','#E7D5AD','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(671,'Chikoo','#E7D5AD','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(672,'Light Gold','#E7DC8B','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(673,'Tiger Lilly','#e87660','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(674,'School Bus Yellow','#E8A317','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(675,'Bee Yellow','#E9AB17','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(676,'Periwinkle','#E9CFEC','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(677,'Golden brown','#EAC117','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(678,'Lavender Pinocchio','#EBDDE2','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(679,'Water','#EBF4FA','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(680,'Rose Gold','#ECC5C0','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(681,'Tan Brown','#ECE5B6','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(682,'Carrot','#ED9121','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(683,'carrot REd','#ED9121','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(684,'Carrot(orange)','#ed9121','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(685,'Desert Sand','#EDC9AF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(686,'Goldenrod','#EDDA74','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(687,'Harvest Gold','#EDE275','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(688,'Sandy Brown','#EE9A4D','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(689,'Pearl white','#eeebd9','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(690,'BISCUIT','#efcca2','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(691,'Khaki','#F0E68C','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(692,'snow white','#F0F0EC','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(693,'AliceBlue','#F0F8FF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(694,'Tangerine','#f28500','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(695,'Tengerine','#f28500','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(696,'Macaroni and Cheese','#F2BB66','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(697,'Dusty Cedar','#f2f3d3','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(698,'Vanilla','#F3E5AB','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(699,'NEON YELLOW','#F3F315','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(700,'Bright Neon Pink','#F433FF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(701,'Baby Pink','#f4c2c2','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(702,'BABYPINK','#f4c2c2','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(703,'Light Baby Pink','#F4C2C2','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(704,'Tea Red','#f4c2c2','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(705,'tea Rose','#f4c2c2','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(706,'SUNSHINE YELLOW','#f4db87','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(707,'Reddish Pink','#f5246a','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(708,'REDISH PINK','#f5246a','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(709,'Deep Pink','#F52887','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(710,'beiege','#f5f5dc','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(711,'beige','#f5f5dc','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(712,'Beige01','#f5f5dc','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(713,'Beige02','#f5f5dc','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(714,'Beige03','#f5f5dc','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(715,'Beige04','#f5f5dc','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(716,'Beigh','#f5f5dc','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(717,'BEIIGE','#f5f5dc','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(718,'Biege','#f5f5dc','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(719,'\"pinch style beige bra',' scan bra\"','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(720,'special beige','#f5f5dc','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(721,'Whitesmoke','#f5f5f5','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(722,'Ruby Red','#F62217','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(723,'Electric Pink','#f62681','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(724,'Fire Engine Red','#F62817','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(725,'Violet Red','#F6358A','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(726,'French rose','#F64A8A','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(727,'Hot Pink','#F660AB','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(728,'Ferrari Red','#F70D1A','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(729,'Bean Red','#F75D59','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(730,'Carnation Pink','#F778A1','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(731,'spanish pink','#f7bfbe','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(732,'Rose Quartz','#f7cac9','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(733,'Champagne','#F7E7CE','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(734,'Construction Cone Orange','#F87431','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(735,'Dark Orange','#F88017','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(736,'Basket Ball Orange','#F88158','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(737,'coral','#f88379','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(738,'Coral pink','#f88379','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(739,'CORAL PK','#f88379','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(740,'Birch','#f8dfa1','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(741,'GhostWhite','#f8f8ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(742,'CYBER PINK','#F971AF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(743,'Light Salmon','#F9966B','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(744,'Flamingo Pink','#F9A7B0','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(745,'Blossom Pink','#F9B7FF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(746,'AZALEA','#F9C0C4','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(747,'Summer Glow','#f9d71c','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(748,'Light Pink','#FAAFBA','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(749,'Light Rani','#FAAFBA','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(750,'Dark OR','#FAB57F','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(751,'Light Orange','#FAB57F','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(752,'AntiqueWhite','#FAEBD7','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(753,'Beer','#FBB117','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(754,'Saffron','#FBB917','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(755,'Misty Rose','#FBBBB9','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(756,'Apricot','#fbceb1','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(757,'Blonde','#FBF6D9','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(758,'Strawberry','#fc5a8d','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(759,'Watermelon Pink','#FC6C85','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(760,'Cotton Candy','#FCDFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(761,'HONEY','#FCEDC5','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(762,'Neon Orange','#FD5F00','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(763,'Bright Gold','#FDD017','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(764,'Pig Pink','#FDD7E4','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(765,'Romantic Pink','#fde4e8','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(766,'Cream Yellow','#FDECC4','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(767,'Pearl','#FDEEF4','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(768,'Cute Pink','#fec0ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(769,'Milk White','#FEFCFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(770,'Ared','#FF0000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(771,'BRed','#FF0000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(772,'CHINESE RED','#FF0000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(773,'HAUTE RED','#FF0000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(774,'Lovely Red','#FF0000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(775,'MESH RED','#ff0000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(776,'rad','#FF0000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(777,'REAL RED','#FF0000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(778,'Red','#FF0000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(779,'Red C','#FF0000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(780,'Red Cheetah','#FF0000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(781,'Red colorblock','#FF0000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(783,'Red N Print','#FF0000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(784,'Red Printed','#FF0000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(785,'Red Squer','#FF0000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(786,'Red01','#FF0000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(787,'Red02','#FF0000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(788,'Red1','#FF0000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(789,'Red2','#FF0000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(790,'Red3','#FF0000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(791,'Red4','#FF0000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(792,'Red5','#FF0000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(793,'RedA','#FF0000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(794,'RedB','#FF0000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(795,'RedC','#FF0000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(796,'RedE24','#FF0000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(797,'REDLV','#FF0000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(798,'Sweet Red','#FF0000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(799,'TRed','#FF0000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(800,'Wonderful Red','#FF0000','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(801,'Carmine Rose','#ff0040','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(802,'Bright Pink','#ff007f','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(803,'China Rose','#ff007f','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(804,'Dark Rose','#ff007f','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(805,'Rose','#FF007F','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(806,'Violet rose','#FF007F','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(807,'English Magenta','#ff00ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(808,'Hot Magenta','#ff00ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(809,'Magena','#FF00FF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(810,'Magenta','#FF00FF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(811,'Magentta','#ff00ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(812,'Majanta','#ff00ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(813,'Majenta','#ff00ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(814,'mazanta','#ff00ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(815,'mazenta','#ff00ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(816,'Mergenta','#FF00FF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(817,'Fuchia','#FF00FF.','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(818,'Fuchsia','#FF00FF.','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(819,'American rose','#ff033e','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(820,'Fluroscent Pink','#ff1493','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(821,'Scarlet','#FF2400','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(822,'Scarlet Red','#ff2400','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(823,'Coral Red','#ff4040','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(824,'Tomato','#ff6347','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(825,'Tomato Red','#ff6347','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(826,'Tometo','#ff6347','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(827,'TomotoRed','#ff6347','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(828,'rose pink','#ff66cc','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(829,'rosepink','#ff66cc','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(830,'Rosette Pink','#ff66cc','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(831,'rosy pink','#ff66cc','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(832,'Hot Pink Animal Print','#FF69B4','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(833,'hotpink','#FF69B4','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(834,'queen','#FF69B4','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(835,'R-Rani','#FF69B4','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(836,'Rani','#FF69B4','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(837,'Rani1','#FF69B4','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(838,'RB010Rani','#FF69B4','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(839,'Trendy Pink','#FF69B4','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(840,'NEON DEEP PINK','#ff6ec7','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(841,'Neon Pink','#ff6ec7','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(843,'NeonPink','#ff6ec7','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(844,'Pumpkin Orange','#ff7518','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(845,'Fuschia Pink','#ff77ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(846,'Fuscia Pink','#ff77ff','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(847,'Mango Orange','#FF8040','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(848,'Shocking bright Orange','#FF8300','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(849,'SALMON ROSE','#FF8894','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(850,'English orange','#FFA500','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(851,'Orange','#FFA500','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(852,'Cantaloupe','#FFA62F','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(853,'Light Red','#ffb3b3','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(854,'Pink_1','#ffb5c5','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(855,'pink1','#ffb5c5','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(856,'Lite Pink','#ffb6c1','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(857,'Cherry Pink','#ffb7c5','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(858,'APink','#FFC0CB','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(859,'EL-BR-025Pink','#ffc0cb','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(860,'English Pink','#ffc0cb','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(861,'L.Pink','#ffc0cb','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(862,'LT PINK','#ffc0cb','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(864,'MESH PINK','#ffc0cb','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(865,'MESH RIBPINK','#ffc0cb','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(866,'MPink','#FFC0CB','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(867,'Paradise Pink','#FFC0CB','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(868,'peacoat-no color-pink box print','#ffc0cb','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(869,'Peppy pink','#FFC0CB','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(870,'Pink','#ffc0cb','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(871,'Pink Demon','#ffc0cb','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(872,'Pink Dogwood','#ffc0cb','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(873,'pink doted','#ffc0cb','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(874,'Pink Floral','#ffc0cb','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(875,'Pink Glo','#ffc0cb','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(876,'Pink Lace','#ffc0cb','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(877,'Pink N Print','#ffc0cb','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(878,'Pink Plaid','#ffc0cb','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(879,'Pink Stripe','#ffc0cb','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(880,'PinkC','#ffc0cb','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(881,'PinkE','#ffc0cb','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(882,'PNK','#FFC0CB','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(883,'Pretty Pink','#FFC0CB','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(884,'RPink','#FFC0CB','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(885,'Super Pink','#ffc0cb','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(886,'sweet pink','#FFC0CB','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(887,'Tickle Me Pink','#ffc0cb','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(888,'TPink','#FFC0CB','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(889,'Yarrow Pink Straps','#ffc0cb','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(890,'BUBBLEGUM PINK','#ffc1cc','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(891,'Deep Peach','#FFCBA4','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(892,'Pastel pink','#ffd1dc','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(893,'Dark Gold','#FFD700','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(894,'gold','#FFD700','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(895,'Golden','#FFD700','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(896,'Golden Haze','#FFD700','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(897,'goldes','#FFD700','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(898,'Golg','#FFD700','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(899,'Yellow gold','#FFD700','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(900,'Rubber Ducky Yellow','#FFD801','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(901,'peach','#ffdab9','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(902,'Peach color','#ffdab9','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(903,'Peach Echo','#ffdab9','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(904,'Peach-Puff','#ffdab9','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(905,'Soft Fluo Peach Heather','#ffdab9','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(906,'Tropical Peach','#ffdab9','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(907,'Dijon Mustard','#FFDB58','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(908,'Mustard','#FFDB58','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(909,'golden Yellow','#ffdf00','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(910,'Pink Bubble Gum','#FFDFDD','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(911,'2Skin','#ffe0bd','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(912,'ALMOST NUDE','#ffe0bd','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(913,'Nude','#ffe0bd','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(914,'Nude color','#ffe0bd','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(915,'NUDE PINK','#ffe0bd','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(916,'Sikin','#ffe0bd','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(917,'Skin','#ffe0bd','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(918,'Skin Nude','#ffe0bd','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(919,'Skin1','#ffe0bd','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(920,'Skin2','#ffe0bd','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(921,'SkinA','#ffe0bd','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(922,'Skine','#ffe0bd','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(923,'SKN','#ffe0bd','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(924,'white skin','#ffe0bd','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(925,'Sun Yellow','#FFE87C','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(926,'BlanchedAlmond','#FFEBCD','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(927,'Corn Yellow','#FFF380','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(928,'SeaShell','#FFF5EE','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(929,'Lemon','#FFF700','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(930,'Winter white','#fff7e0','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(931,'Lemon Chiffon','#FFF8C6','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(932,'Cornsilk','#FFF8DC','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(933,'Vanilla Bean','#fffcb4','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(934,'VANILLA BEAN-MINT','#fffcb4','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(935,'Cr?me','#fffdd0','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(936,'Cream','#fffdd0','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(937,'Cream colour','#fffdd0','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(938,'Crme','#fffdd0','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(939,'Multi Cream','#fffdd0','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(940,'GYellow','#FFFF00','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(941,'MESH YELLOW','#FFFF00','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(942,'plane yellow','#FFFF00','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(943,'Yellow','#FFFF00','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(944,'yellow mosoo','#FFFF00','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(945,'Yellow01','#FFFF00','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(946,'YELLOW1','#FFFF00','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(947,'yellowtribal','#FFFF00','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(948,'Yeloow','#FFFF00','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(949,'Pale Yellow','#FFFFBF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(950,'Parchment','#FFFFC2','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(951,'Vanilla Ice','#FFFFC9','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(952,'cottoni yellow','#FFFFE0','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(953,'Light Yellow','#FFFFE0','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(954,'Ivory','#FFFFF0','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(955,'Ivory (153)','#FFFFF0','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(956,'Ivory Coral Reef','#FFFFF0','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(957,'off white','#fffff2','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(958,'2White','#FFFFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(959,'Enhanced White','#FFFFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(960,'MP-BR-015White','#FFFFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(961,'no color-peacoat-white box print','#FFFFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(962,'Peppy White','#FFFFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(963,'Plain White with White straps','#FFFFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(964,'Pure White','#FFFFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(965,'simple white','#FFFFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(966,'W-White','#FFFFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(967,'whie','#FFFFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(968,'WHISPER WHITE-TROPICANA PRINT','#FFFFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(969,'White','#FFFFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(970,'White (100)','#FFFFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(971,'White C','#FFFFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(972,'White Deer','#FFFFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(973,'white N Print','#FFFFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(974,'WHITE PRINT','#FFFFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(975,'White Smoke','#FFFFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(976,'White solid body with white trims','#FFFFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(977,'White01','#FFFFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(978,'White02','#FFFFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(979,'White03','#FFFFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(980,'white1','#FFFFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(981,'white2','#FFFFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(982,'White3','#FFFFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(983,'whiteA','#FFFFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(984,'WhiteSassy','#FFFFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(985,'Whitw','#FFFFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(986,'WHT','#FFFFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(987,'ZWhite1','#FFFFFF','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL),
(988,'multicolor','#F0F0F0','2020-04-08 05:48:04','2020-04-08 05:48:04',NULL,NULL);

/*Table structure for table `contact_us` */

DROP TABLE IF EXISTS `contact_us`;

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `phone_number` varchar(250) DEFAULT NULL,
  `organization_name` varchar(500) DEFAULT NULL,
  `message` text,
  `type` varchar(250) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT '-1',
  `modified_by` int(11) DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

/*Data for the table `contact_us` */

insert  into `contact_us`(`id`,`name`,`email`,`phone_number`,`organization_name`,`message`,`type`,`created_date`,`modified_date`,`created_by`,`modified_by`) values 
(1,'Sam Hendricks','sam@gmail.com','9845215201','Simplyfy','We are interested to deal with shopnow','message','2021-11-12 07:59:50','2021-11-12 07:59:50',-1,-1),
(2,'Sam Hendricks','s','','Simplyfy','We are interested to deal with shopnow','message','2021-11-12 07:59:50','2021-11-12 07:59:50',-1,-1),
(3,'Sam Hendricks','','452','Simplyfy','We are interested to deal with shopnow','message','2021-11-12 07:59:50','2021-11-12 07:59:50',-1,-1),
(4,'Ricky Weise','ricky@gmail.com','984521478','Sunbyte','Please let us know t&c.','query','2021-11-12 07:59:50','2021-11-12 07:59:50',-1,-1),
(5,'Sam Hendricks','sam@gmail.com','98457825','Simplyfy','We are interested to deal with shopnow','message','2021-11-12 07:59:50','2021-11-12 07:59:50',-1,-1),
(6,'Sam Patel','','9863524','Simplyfy','We are interested to deal with shopnow','message','2021-11-12 07:59:50','2021-11-12 07:59:50',-1,-1),
(7,'Ramesh Weise','ricky@gmail.com','984521478','Sunbyte','Please let us know t&c.','query','2021-11-12 07:59:50','2021-11-12 07:59:50',-1,-1),
(8,'Ritesh Kulkarni','','9863524','Simplyfy','We are interested to deal with shopnow','message','2021-11-12 07:59:50','2021-11-12 07:59:50',-1,-1),
(9,'Abay Kulkarni','','9863524','Simplyfy','We are interested to deal with shopnow','partner','2021-11-12 07:59:50','2021-11-12 07:59:50',-1,-1),
(10,'Abay Patel','','9863524','Simplyfy','We are interested to deal with shopnow','partner','2021-11-12 07:59:50','2021-11-12 07:59:50',-1,-1),
(11,'KukadiyaAnil','anil.kukadiya94@gmail.com','','Wayway','Testmessage','contactus','2021-11-12 07:59:50','2021-11-12 07:59:50',-1,-1),
(12,'hdhd','bdbdn@sns.com','','bsbs','bdbdn','contactus','2021-11-12 07:59:50','2021-11-12 07:59:50',-1,-1),
(13,'Anil','anil.kukadiya94@gmail.com','7874805480','Anil','test','partner','2021-11-12 07:59:50','2021-11-12 07:59:50',-1,-1),
(14,'tesy','jdx@jdjd.com','1234567890','jd','jdjdjd','partner','2021-11-12 07:59:50','2021-11-12 07:59:50',-1,-1),
(15,'fgc','ndnd@bdn.com','4676466464','jdjd','ndnd','contactus','2021-11-12 07:59:50','2021-11-12 07:59:50',-1,-1),
(16,'hf','jdjd@ss.com','','hd','hdjd','contactus','2021-11-12 07:59:50','2021-11-12 07:59:50',-1,-1),
(17,'hfr','jdjdg@ss.com','1234567890','hd1','hdjd1','contactus','2021-11-12 07:59:50','2021-11-12 07:59:50',-1,-1),
(18,'urur','hdjdj@hdjd.com','','d','x','partner','2021-11-12 07:59:50','2021-11-12 07:59:50',-1,-1),
(19,'D K Patel','','9863524','','','','2021-11-12 08:02:31','2021-11-12 08:02:31',-1,-1),
(20,'Ricky Weise','ricky@gmail.com','984521478','Sunbyte','Please let us know t&c.','query','2021-11-12 13:45:43','2021-11-12 13:45:43',-1,-1),
(21,'Anil','abc@gmail.com','+917874805480','','','partner','2021-11-13 04:21:42','2021-11-13 04:21:42',-1,-1),
(22,'Abay Patel','','9863524','Simplyfy','We are interested to deal with shopnow','partner','2021-11-15 16:40:50','2021-11-15 16:40:50',-1,-1),
(23,'Abay Patel','ravi@gmail.com','9863524','Simplyfy','We are interested to deal with shopnow','partner','2021-11-15 16:45:31','2021-11-15 16:45:31',-1,-1),
(24,'ravi','rv@g.com','9904795771','rajkot','fdgkjhfdkjg','partner','2021-11-16 13:52:12','2021-11-16 13:52:12',-1,-1),
(25,'ravi','rv@g.com','9904795771','rajkot','fdgkjhfdkjg','partner','2021-11-16 13:52:17','2021-11-16 13:52:17',-1,-1),
(26,'ga','rg@v.com','9879879878','rajk','hjghj','partner','2021-11-16 15:03:05','2021-11-16 15:03:05',-1,-1),
(27,'hij','t@h.com','987609876','hug','ja','partner','2021-11-16 15:04:46','2021-11-16 15:04:46',-1,-1),
(28,'bcc','cvc@ffd.com','1234567890','gc','vo','partner','2021-11-17 06:45:21','2021-11-17 06:45:21',-1,-1),
(29,'gc','ccc@vv.com','1234567890','vo','gc','partner','2021-11-17 06:48:01','2021-11-17 06:48:01',-1,-1),
(30,'D K Patel','','9863524','','','Contact Us','2021-11-17 06:49:15','2021-11-17 06:49:15',-1,-1),
(31,'zgdg','xbbdvd@rrs.com','8948544845','sg','','contactus','2021-12-18 08:44:53','2021-12-18 08:44:53',-1,-1),
(32,'ravi','rv@gmail.com','8780497908','','','partner','2021-12-18 09:44:20','2021-12-18 09:44:20',-1,-1),
(33,'ravi','rv@gmail.com','','','','partner','2021-12-24 15:49:42','2021-12-24 15:49:42',-1,-1),
(34,'ravi','ev@gmail.com','','','','partner','2021-12-24 15:50:11','2021-12-24 15:50:11',-1,-1),
(35,'ravi','rv@gmail.com','','','','partner','2021-12-24 15:50:29','2021-12-24 15:50:29',-1,-1),
(36,'gc','gf@gg.com','','','','partner','2021-12-24 17:58:01','2021-12-24 17:58:01',-1,-1),
(37,'gc','ff@gf.com','','g','gc','partner','2021-12-24 17:58:23','2021-12-24 17:58:23',-1,-1),
(38,'gc','bb@gg.com','','hi','','partner','2021-12-24 17:58:45','2021-12-24 17:58:45',-1,-1),
(39,'Ravi','','8787878787','','','partner','2021-12-28 15:58:44','2021-12-28 15:58:44',-1,-1),
(40,'ravi','rv@gmail.com','','','','partner','2021-12-28 15:59:04','2021-12-28 15:59:04',-1,-1),
(41,'gc','','1234567890','','','partner','2021-12-28 17:16:55','2021-12-28 17:16:55',-1,-1),
(42,'bhag','','1234567890','n','no','partner','2021-12-28 17:17:12','2021-12-28 17:17:12',-1,-1),
(43,'hand','','1234567800','b','b','partner','2021-12-28 17:17:29','2021-12-28 17:17:29',-1,-1),
(44,'bxxn','','1111111111','Ben','no','partner','2021-12-28 17:18:04','2021-12-28 17:18:04',-1,-1),
(45,'ravi','','8780497908','','','partner','2021-12-28 17:43:16','2021-12-28 17:43:16',-1,-1),
(46,'ravi','rv@gmail.com','','','','partner','2021-12-28 17:43:32','2021-12-28 17:43:32',-1,-1),
(47,'abc\nabc\nabc','abc@gmail.com','1234567890','abc\nabc','abc','contactus','2022-03-13 10:18:32','2022-03-13 10:18:32',-1,-1);

/*Table structure for table `couriers` */

DROP TABLE IF EXISTS `couriers`;

CREATE TABLE `couriers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courier_name` varchar(250) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vendor_id` (`vendor_id`),
  CONSTRAINT `fk_vendor_id` FOREIGN KEY (`vendor_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `couriers` */

insert  into `couriers`(`id`,`courier_name`,`vendor_id`,`status`,`created_date`,`modified_date`,`created_by`,`modified_by`) values 
(1,'BlueDart',1,1,'2020-04-08 05:48:41','2020-04-08 05:48:41',NULL,NULL),
(2,'DHFL',1,1,'2020-04-08 05:48:41','2020-04-08 05:48:41',NULL,NULL),
(3,'Maruti',1,1,'2020-04-08 05:48:41','2020-04-08 05:48:41',NULL,NULL),
(4,'FedX',2,1,'2020-04-08 05:48:41','2020-04-08 05:48:41',NULL,NULL),
(5,'BlueDart',2,1,'2020-04-08 05:48:41','2020-04-08 05:48:41',NULL,NULL),
(6,'BlueDart',3,1,'2020-04-08 05:48:41','2020-04-08 05:48:41',NULL,NULL),
(7,'BlueDart',4,1,'2020-07-22 09:58:14','2020-07-22 09:58:14',NULL,NULL),
(8,'ABC',1,0,'2021-08-03 06:14:01','2021-08-03 06:14:01',-1,-1),
(9,'AdfgdgBC',1,1,'2021-08-03 07:51:26','2021-08-05 10:02:12',-1,-1),
(10,'gt\'g',8,1,'2021-08-03 08:48:12','2021-08-03 08:48:12',-1,-1),
(11,'hrttr',8,1,'2021-08-03 09:05:36','2021-08-05 04:25:11',-1,-1),
(12,'gergergrh',2,0,'2021-08-04 12:15:33','2021-08-04 12:18:40',-1,-1),
(13,'gergergrh',8,1,'2021-08-04 12:16:33','2021-08-05 09:27:26',-1,-1);

/*Table structure for table `customer_notifications` */

DROP TABLE IF EXISTS `customer_notifications`;

CREATE TABLE `customer_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `mobile_number` varchar(20) DEFAULT NULL,
  `cust_noti_schedule` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT '-1',
  `modified_by` int(11) DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

/*Data for the table `customer_notifications` */

/*Table structure for table `customer_order_address` */

DROP TABLE IF EXISTS `customer_order_address`;

CREATE TABLE `customer_order_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_billing_shipping` varchar(500) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `address1` varchar(200) NOT NULL,
  `address2` varchar(200) DEFAULT NULL,
  `address3` varchar(200) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `pincode` int(20) NOT NULL,
  `phoneNumber` varchar(500) NOT NULL,
  `email_address` varchar(200) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_create_order_add` (`created_by`),
  KEY `fk_modify_order_add` (`modified_by`),
  KEY `fk_cust_id_address` (`customer_id`),
  CONSTRAINT `fk_create_order_add` FOREIGN KEY (`created_by`) REFERENCES `customers` (`id`),
  CONSTRAINT `fk_cust_id1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `fk_modify_order_add` FOREIGN KEY (`modified_by`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=554 DEFAULT CHARSET=latin1;

/*Data for the table `customer_order_address` */

/*Table structure for table `customer_order_details` */

DROP TABLE IF EXISTS `customer_order_details`;

CREATE TABLE `customer_order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `order_number` varchar(200) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `name` varchar(500) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `attribute` varchar(500) DEFAULT NULL,
  `regular_price` float DEFAULT NULL,
  `sale_price` float DEFAULT NULL,
  `expected_date_of_delivery` date DEFAULT NULL,
  `delivery_status_code` varchar(200) DEFAULT NULL,
  `vendor_product_id` varchar(200) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `discounts` float DEFAULT NULL,
  `promocodes` varchar(50) DEFAULT NULL,
  `shipping_charge` float DEFAULT '0',
  `effective_price` float DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `productId` (`product_id`),
  KEY `user_id` (`customer_id`),
  KEY `fk_create_order_detail` (`created_by`),
  KEY `fk_modify_order_detail` (`modified_by`),
  CONSTRAINT `fk_create_order_detail` FOREIGN KEY (`created_by`) REFERENCES `customers` (`id`),
  CONSTRAINT `fk_modify_order_detail` FOREIGN KEY (`modified_by`) REFERENCES `customers` (`id`),
  CONSTRAINT `order_id` FOREIGN KEY (`order_id`) REFERENCES `customer_orders` (`order_id`),
  CONSTRAINT `productId` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `user_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=840 DEFAULT CHARSET=latin1;

/*Data for the table `customer_order_details` */

/*Table structure for table `customer_orders` */

DROP TABLE IF EXISTS `customer_orders`;

CREATE TABLE `customer_orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(100) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_status_code` varchar(100) DEFAULT NULL,
  `date_of_placed_order` timestamp NULL DEFAULT NULL,
  `date_of_order_paid` timestamp NULL DEFAULT NULL,
  `payment_status` varchar(100) DEFAULT NULL,
  `mode_of_payment` varchar(100) DEFAULT NULL,
  `paymentGateway` varchar(200) DEFAULT NULL,
  `txnId` varchar(200) DEFAULT NULL,
  `authorization_id` varchar(100) DEFAULT NULL,
  `sub_total` float DEFAULT NULL,
  `tax` float DEFAULT NULL,
  `shipping` float DEFAULT NULL,
  `grand_total` float DEFAULT NULL,
  `delivery_address_id` int(11) DEFAULT NULL,
  `billing_address_id` int(11) DEFAULT NULL,
  `promocode` varchar(200) DEFAULT NULL,
  `discounts` float DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `delivery_address_id` (`delivery_address_id`),
  KEY `billing_address_id` (`billing_address_id`),
  KEY `cust_id` (`customer_id`),
  KEY `fk_create_order` (`created_by`),
  KEY `fk_modify_order` (`modified_by`),
  CONSTRAINT `billing_address_id` FOREIGN KEY (`billing_address_id`) REFERENCES `customer_order_address` (`id`),
  CONSTRAINT `cust_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `delivery_address_id` FOREIGN KEY (`delivery_address_id`) REFERENCES `customer_order_address` (`id`),
  CONSTRAINT `fk_create_order` FOREIGN KEY (`created_by`) REFERENCES `customers` (`id`),
  CONSTRAINT `fk_modify_order` FOREIGN KEY (`modified_by`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=400 DEFAULT CHARSET=latin1;

/*Data for the table `customer_orders` */

/*Table structure for table `customer_orders11` */

DROP TABLE IF EXISTS `customer_orders11`;

CREATE TABLE `customer_orders11` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer_payment_id` float DEFAULT NULL,
  `order_status_code` varchar(200) DEFAULT NULL,
  `date_of_placed_order` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `total_order_price` float DEFAULT NULL,
  `date_of_order_paid` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `coupon_used_details` varchar(100) DEFAULT NULL,
  `delivery_address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `customer_orders11` */

/*Table structure for table `customer_payment_methods` */

DROP TABLE IF EXISTS `customer_payment_methods`;

CREATE TABLE `customer_payment_methods` (
  `payment_method_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `payment_method_code` varchar(100) DEFAULT NULL,
  `name_on_card` varchar(100) DEFAULT NULL,
  `card_number` int(100) NOT NULL,
  `expiry_month` int(11) DEFAULT NULL,
  `expiry_year` year(4) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`payment_method_id`),
  UNIQUE KEY `customer_id` (`customer_id`,`card_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `customer_payment_methods` */

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(150) DEFAULT NULL,
  `last_name` varchar(200) DEFAULT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(300) NOT NULL,
  `phone_number` varchar(500) DEFAULT NULL,
  `google_id` varchar(500) DEFAULT NULL,
  `device_id` varchar(500) DEFAULT NULL,
  `image` longblob,
  `status` varchar(50) DEFAULT '2',
  `subscribed` int(11) DEFAULT '0',
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT '-1',
  `modified_by` int(11) DEFAULT '-1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE Email` (`email`),
  UNIQUE KEY `UNIQUE Phone_Number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=479 DEFAULT CHARSET=latin1;

/*Data for the table `customers` */

/*Table structure for table `deal_detail` */

DROP TABLE IF EXISTS `deal_detail`;

CREATE TABLE `deal_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

/*Data for the table `deal_detail` */

/*Table structure for table `deals` */

DROP TABLE IF EXISTS `deals`;

CREATE TABLE `deals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `image` varchar(500) NOT NULL DEFAULT '0',
  `status` varchar(50) NOT NULL DEFAULT '1',
  `show_homepage` varchar(100) NOT NULL DEFAULT '0',
  `product_ids` text NOT NULL,
  `start_date` varchar(100) DEFAULT NULL,
  `end_date` varchar(100) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT '-1',
  `modified_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` int(11) DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

/*Data for the table `deals` */

/*Table structure for table `email_template` */

DROP TABLE IF EXISTS `email_template`;

CREATE TABLE `email_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(200) DEFAULT NULL,
  `template_type` varchar(200) DEFAULT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `text` text,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT '-1',
  `modified_by` int(11) DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `email_template` */

/*Table structure for table `faq` */

DROP TABLE IF EXISTS `faq`;

CREATE TABLE `faq` (
  `faq_id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(500) DEFAULT NULL,
  `answer` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`faq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `faq` */

insert  into `faq`(`faq_id`,`question`,`answer`) values 
(1,'How do I track my Shopnow order?','Go to My Orders in your Shopnow account to track your package.'),
(2,'How do I find my order details?','Go to My Orders in your Shopnow account to find details for all your orders.'),
(3,'What if I miss my Shopnow order delivery?','Do not worry,the delivery agent will try to deliver again on the next working day. You can also call the delivery agent to get the latest delivery update.'),
(4,'How do I return my order on Shopnow?','Place a return request in the My Orders page. You will get an option to choose refund/replace/exchange as per our return policy.'),
(5,'Can I ask the delivery agent to reschedule the pickup date?','Yes. You can schedule the pickup date based on your convenience.'),
(6,'What is the Shopnow return policy for cash on delivery?','In case of cash on delivery,you will have to provide a bank account number for the refund. For replacement/exchange,you will be given an alternate product for the returned product.');

/*Table structure for table `fashion_products` */

DROP TABLE IF EXISTS `fashion_products`;

CREATE TABLE `fashion_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fashion_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT '-1',
  `modified_by` int(11) DEFAULT '-1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unic` (`fashion_id`,`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=687 DEFAULT CHARSET=latin1;

/*Data for the table `fashion_products` */

/*Table structure for table `fashion_trends` */

DROP TABLE IF EXISTS `fashion_trends`;

CREATE TABLE `fashion_trends` (
  `fashion_id` int(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL,
  `keywords` text,
  `image` varchar(500) DEFAULT NULL,
  `instagram_id` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT '-1',
  `modified_by` int(11) DEFAULT '-1',
  PRIMARY KEY (`fashion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=latin1;

/*Data for the table `fashion_trends` */

/*Table structure for table `lookup` */

DROP TABLE IF EXISTS `lookup`;

CREATE TABLE `lookup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(500) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;

/*Data for the table `lookup` */

insert  into `lookup`(`id`,`name`,`type`,`status`,`parent`,`created_date`,`modified_date`,`created_by`,`modified_by`) values 
(1,'India','COUNTRY','1',0,'2020-04-08 05:52:14','2020-04-08 05:52:14',0,0),
(2,'Gujrat','STATE','1',1,'2020-04-08 05:52:14','2020-04-08 05:52:14',0,0),
(3,'Baroda','CITY','1',2,'2020-04-08 05:52:14','2020-04-08 05:52:14',0,0),
(4,'Ahemdabad','CITY','1',2,'2020-04-08 05:52:14','2020-04-08 05:52:14',0,0),
(5,'COD','PAYMENT_MODE','1',12,'2020-04-08 05:52:14','2020-04-08 05:52:14',0,0),
(6,'Internet_Banking','PAYMENT_MODE','1',12,'2020-04-08 05:52:14','2020-04-08 05:52:14',0,0),
(7,'Credit_Card','PAYMENT_MODE','1',12,'2020-04-08 05:52:14','2020-04-08 05:52:14',0,0),
(8,'Debit_Card','PAYMENT_MODE','1',12,'2020-04-08 05:52:14','2020-04-08 05:52:14',0,0),
(9,'Goa','STATE','1',1,'2020-04-08 05:52:14','2020-04-08 05:52:14',0,0),
(10,'Panji','CITY','1',9,'2020-04-08 05:52:14','2020-04-08 05:52:14',0,0),
(11,'Payment','MONETARY','1',0,'2020-04-08 05:52:14','2020-04-08 05:52:14',0,0),
(12,'Payment_Mode','METHOD','1',11,'2020-04-08 05:52:14','2020-04-08 05:52:14',0,0),
(13,'PAYMENT_GATEWAY','GATEWAY','1',11,'2020-04-08 05:52:14','2020-04-08 05:52:14',0,0),
(14,'Order_Status','ORDER_FILTER','1',0,'2020-04-08 05:52:14','2020-04-08 05:52:14',0,0),
(15,'Placed','ORDER_STATUS','1',14,'2020-04-08 05:52:14','2020-04-08 05:52:14',0,0),
(16,'Shipped','ORDER_STATUS','1',14,'2020-04-08 05:52:14','2020-04-08 05:52:14',0,0),
(17,'Packed','ORDER_STATUS','1',14,'2020-04-08 05:52:14','2020-04-08 05:52:14',0,0),
(18,'In_Transit','ORDER_STATUS','1',14,'2020-04-08 05:52:14','2020-04-08 05:52:14',0,0),
(19,'Out_For_Delivery','ORDER_STATUS','1',14,'2020-04-08 05:52:14','2020-04-08 05:52:14',0,0),
(20,'Delivered','ORDER_STATUS','1',14,'2020-04-08 05:52:14','2020-04-08 05:52:14',0,0),
(21,'0 to 25','PRICE_FILTER','1',0,'2020-04-08 05:52:14','2020-04-08 05:52:14',0,0),
(22,'25 to 50','PRICE_FILTER','1',0,'2020-04-08 05:52:14','2020-04-08 05:52:14',0,0),
(23,'50 to 75','PRICE_FILTER','1',0,'2020-04-08 05:52:14','2020-04-08 05:52:14',0,0),
(24,'75 to 100','PRICE_FILTER','1',0,'2020-04-08 05:52:14','2020-04-08 05:52:14',0,0),
(25,'100+','PRICE_FILTER','1',0,'2020-04-08 05:52:14','2020-04-08 05:52:14',0,0),
(26,'ITEM_SIMILARITY','ITEM_SIMILARITY','1',0,'2020-05-19 07:58:51','2020-05-19 07:58:51',NULL,NULL),
(27,'PRODUCT_SIMILARITY','ITEM_SIMILARITY','1',26,'2020-05-19 07:59:53','2020-05-19 07:59:53',NULL,NULL),
(28,'VENDOR_PRODUCT_MATCH','ITEM_SIMILARITY','1',26,'2020-05-19 08:00:17','2020-05-19 08:00:17',NULL,NULL),
(29,'NOTIFICATION','NOTIFICATION','1',0,'2020-05-28 06:22:31','2020-05-28 06:22:31',0,0),
(30,'OFFER','NOTIFICATION','1',29,'2020-05-28 06:22:47','2020-05-28 06:22:47',0,0),
(31,'ORDER','NOTIFICATION','1',29,'2020-05-28 06:23:24','2020-05-28 06:23:24',0,0),
(32,'PAYTM','PAYMENT_GATEWAY','1',13,'2020-06-17 08:03:27','2020-06-17 08:03:27',0,0),
(33,'PAYPAL','PAYMENT_GATEWAY','1',13,'2020-06-17 08:04:16','2020-06-17 08:04:16',0,0),
(34,'BEST_PRODUCT','BEST_PRODUCT','1',0,'2020-06-20 11:35:17','2020-06-20 11:35:17',0,0),
(35,'ITEM_TRENDING','BEST_PRODUCT','1',34,'2020-06-20 11:36:01','2020-06-20 11:36:01',0,0),
(37,'Canada','COUNTRY','1',0,'2020-07-29 09:30:18','2020-07-29 09:30:18',NULL,NULL),
(38,'USA','COUNTRY','1',0,'2020-07-29 09:30:34','2020-07-29 09:30:34',NULL,NULL),
(39,'Madhya Pradesh','STATE','1',1,'2020-07-29 09:31:16','2020-07-29 09:31:16',NULL,NULL),
(40,'Uttar Pradesh','STATE','1',1,'2020-07-29 09:31:29','2020-07-29 09:31:29',NULL,NULL),
(41,'Rajasthan','STATE','1',1,'2020-07-29 09:31:35','2020-07-29 09:31:35',NULL,NULL),
(42,'Kerala','STATE','1',1,'2020-07-29 09:33:52','2020-07-29 09:33:52',NULL,NULL),
(43,'Bhopal','CITY','1',39,'2020-07-29 09:35:16','2020-07-29 09:35:16',NULL,NULL),
(44,'Jabalpur','CITY','1',39,'2020-07-29 09:36:34','2020-07-29 09:36:34',NULL,NULL),
(45,'Agra','CITY','1',40,'2020-07-29 09:36:56','2020-07-29 09:36:56',NULL,NULL),
(46,'Jhansi','CITY','1',40,'2020-07-29 09:37:03','2020-07-29 09:37:03',NULL,NULL),
(47,'Jaipur','CITY','1',41,'2020-07-29 09:37:14','2020-07-29 09:37:14',NULL,NULL),
(48,'Udaipur','CITY','1',41,'2020-07-29 09:37:31','2020-07-29 09:37:31',NULL,NULL),
(49,'Kochi','CITY','1',42,'2020-07-29 09:37:54','2020-07-29 09:37:54',NULL,NULL),
(50,'Thrissur','CITY','1',42,'2020-07-29 09:38:24','2020-07-29 09:38:24',NULL,NULL),
(51,'Aluva','CITY','1',42,'2020-07-29 09:38:31','2020-07-29 09:38:31',NULL,NULL),
(52,'Alberta','STATE','1',37,'2020-07-29 09:41:00','2020-07-29 09:41:00',NULL,NULL),
(53,'Ontario','STATE','1',37,'2020-07-29 09:41:08','2020-07-29 09:41:08',NULL,NULL),
(54,'Quebec','STATE','1',37,'2020-07-29 09:41:17','2020-07-29 09:41:17',NULL,NULL),
(55,'Waterloo','CITY','1',53,'2020-07-29 09:42:02','2020-07-29 09:42:02',NULL,NULL),
(56,'Burlington','CITY','1',53,'2020-07-29 09:42:15','2020-07-29 09:42:15',NULL,NULL),
(57,'levis','CITY','1',53,'2020-07-29 09:42:54','2020-07-29 09:42:54',NULL,NULL),
(58,'Montreal','CITY','1',53,'2020-07-29 09:43:00','2020-07-29 09:43:00',NULL,NULL),
(59,'Calgary','CITY','1',53,'2020-07-29 09:43:30','2020-07-29 09:43:30',NULL,NULL),
(60,'Edmonton','CITY','1',53,'2020-07-29 09:43:41','2020-07-29 09:43:41',NULL,NULL),
(61,'California','STATE','1',38,'2020-07-29 09:45:12','2020-07-29 09:45:12',NULL,NULL),
(62,'Washington','STATE','1',38,'2020-07-29 09:45:17','2020-07-29 09:45:17',NULL,NULL),
(63,'Florida','STATE','1',38,'2020-07-29 09:45:22','2020-07-29 09:45:22',NULL,NULL),
(64,'New York','STATE','1',38,'2020-07-29 09:45:41','2020-07-29 09:45:41',NULL,NULL),
(65,'Los Angeles','CITY','1',61,'2020-07-29 09:46:49','2020-07-29 09:46:49',NULL,NULL),
(66,'San Diego','CITY','1',61,'2020-07-29 09:47:15','2020-07-29 09:47:15',NULL,NULL),
(67,'Torrance','CITY','1',61,'2020-07-29 09:47:21','2020-07-29 09:47:21',NULL,NULL),
(68,'Seattle','CITY','1',62,'2020-07-31 04:22:19','2020-07-31 04:22:19',NULL,NULL),
(69,'Vancouver','CITY','1',62,'2020-07-31 04:22:36','2020-07-31 04:22:36',NULL,NULL),
(70,'Orlando','CITY','1',63,'2020-07-31 04:23:08','2020-07-31 04:23:08',NULL,NULL),
(71,'Miami','CITY','1',63,'2020-07-31 04:23:11','2020-07-31 04:23:11',NULL,NULL),
(72,'Florida City','CITY','1',63,'2020-07-31 04:23:16','2020-07-31 04:23:16',NULL,NULL),
(73,'New York','CITY','1',64,'2020-07-31 04:24:42','2020-07-31 04:24:42',NULL,NULL),
(74,'Buffalo','CITY','1',64,'2020-07-31 04:24:46','2020-07-31 04:24:46',NULL,NULL),
(75,'Irvine','CITY','1',61,'2020-07-31 04:25:25','2020-07-31 04:25:25',NULL,NULL),
(76,'XYZ','dummy','0',0,'2021-08-09 04:06:37','2021-08-09 04:06:37',-1,-1),
(77,'XYZ','dummy1','0',0,'2021-08-09 04:08:17','2021-08-09 04:08:17',-1,-1),
(78,'XYZ1','dummy1','0',77,'2021-08-09 04:08:52','2021-08-09 04:08:52',-1,-1),
(79,'sdg','dfs','1',0,'2021-08-09 05:29:24','2021-08-09 05:29:24',-1,-1),
(80,'sdg','dfs','1',79,'2021-08-09 05:29:52','2021-08-09 05:29:52',-1,-1),
(81,'fgghgg','dummy','0',76,'2021-08-09 05:31:57','2021-08-09 07:31:24',-1,-1),
(82,'fgghgg','dfhfhfh','0',0,'2021-08-09 07:34:27','2021-08-09 07:34:27',-1,-1),
(83,'dgfdfdgf','dfhfhfh','1',82,'2021-08-09 07:37:56','2021-08-09 07:39:56',-1,-1),
(84,'dgbbfjjutyu','dfhfhfh','0',82,'2021-08-09 07:38:04','2021-08-09 07:38:04',-1,-1);

/*Table structure for table `notifications` */

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_name` varchar(100) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `notification_schedule` datetime DEFAULT CURRENT_TIMESTAMP,
  `message` text,
  `notification_state` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT '-1',
  `modified_by` int(11) DEFAULT '-1',
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

/*Data for the table `notifications` */

/*Table structure for table `order_details` */

DROP TABLE IF EXISTS `order_details`;

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(500) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_description` varchar(1000) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `order_Date_Time` datetime DEFAULT CURRENT_TIMESTAMP,
  `expected_date_of_delivery` date DEFAULT NULL,
  `delivery_status_code` varchar(50) DEFAULT NULL,
  `delivery_address` varchar(300) DEFAULT NULL,
  `vendorId` varchar(100) DEFAULT NULL,
  `vendor_product_id` varchar(100) DEFAULT NULL,
  `quantity` int(100) DEFAULT NULL,
  `mode_of_payment` varchar(20) DEFAULT NULL,
  `transaction_id` varchar(200) DEFAULT NULL,
  `authorization_id` varchar(200) DEFAULT NULL,
  `discounts` decimal(20,2) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `order_status` varchar(500) DEFAULT NULL,
  `payment_gateway` varchar(50) DEFAULT NULL,
  `order_number` varchar(500) NOT NULL,
  `tax` float DEFAULT NULL,
  `shipping` float DEFAULT NULL,
  `promocode` varchar(20) DEFAULT NULL,
  `sub_total` float DEFAULT NULL,
  `grand_total` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

/*Data for the table `order_details` */

/*Table structure for table `order_tracking` */

DROP TABLE IF EXISTS `order_tracking`;

CREATE TABLE `order_tracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) DEFAULT NULL,
  `courier_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `tracking_number` int(11) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `expected_date_of_delivery` datetime DEFAULT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `actual_date_of_delivery` datetime DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id1` (`order_id`),
  KEY `vendor` (`vendor_id`),
  KEY `courier` (`courier_id`),
  CONSTRAINT `courier` FOREIGN KEY (`courier_id`) REFERENCES `couriers` (`id`),
  CONSTRAINT `order_id1` FOREIGN KEY (`order_id`) REFERENCES `customer_orders` (`order_id`),
  CONSTRAINT `vendor` FOREIGN KEY (`vendor_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=398 DEFAULT CHARSET=latin1;

/*Data for the table `order_tracking` */

/*Table structure for table `payment_transactions` */

DROP TABLE IF EXISTS `payment_transactions`;

CREATE TABLE `payment_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paymentType` varchar(500) DEFAULT NULL,
  `txnToken` varchar(500) DEFAULT NULL,
  `txnAmount` float DEFAULT NULL,
  `timestamp` varchar(500) DEFAULT NULL,
  `resultStatus` varchar(500) DEFAULT NULL,
  `resultMsg` varchar(500) DEFAULT NULL,
  `resultStatusCode` varchar(500) DEFAULT NULL,
  `txnOrderId` bigint(20) DEFAULT NULL,
  `currency` varchar(50) DEFAULT NULL,
  `finalTxnDate` datetime DEFAULT NULL,
  `finalStatus` varchar(500) DEFAULT NULL,
  `finalRespCode` varchar(500) DEFAULT NULL,
  `finalRespMsg` varchar(500) DEFAULT NULL,
  `bankTxnId` varchar(500) DEFAULT NULL,
  `bankName` varchar(500) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `txnId` varchar(500) DEFAULT NULL,
  `paymentGateway` varchar(500) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=660 DEFAULT CHARSET=latin1;

/*Data for the table `payment_transactions` */

/*Table structure for table `pincodes` */

DROP TABLE IF EXISTS `pincodes`;

CREATE TABLE `pincodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pincode` int(255) NOT NULL,
  `city` varchar(250) NOT NULL,
  `state` varchar(250) NOT NULL,
  `country` varchar(250) NOT NULL,
  `zone` varchar(250) NOT NULL,
  `is_metro` tinyint(1) NOT NULL,
  `is_RoI_A` tinyint(1) DEFAULT NULL,
  `is_RoI_B` tinyint(1) DEFAULT NULL,
  `is_special_destination` tinyint(1) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

/*Data for the table `pincodes` */

insert  into `pincodes`(`id`,`pincode`,`city`,`state`,`country`,`zone`,`is_metro`,`is_RoI_A`,`is_RoI_B`,`is_special_destination`,`created_date`,`modified_date`,`created_by`,`modified_by`) values 
(1,380001,'Ahemdabad','Gujarat','India','west',1,0,0,0,'2020-04-08 05:53:29','2020-04-08 05:53:29',NULL,NULL),
(2,394510,'Surat','Uttar','India','west',1,0,0,0,'2020-04-08 05:53:29','2020-04-08 05:53:29',NULL,NULL),
(3,700001,'uttar p','West Bengal','India','east',1,1,0,0,'2020-04-08 05:53:29','2020-04-08 05:53:29',NULL,NULL),
(4,380004,'Jammu','Jammu','India','NA',0,0,0,1,'2020-04-08 05:53:29','2020-04-08 05:53:29',NULL,NULL),
(6,403110,'Panjhi','Goa','India','south',0,1,0,0,'2020-04-08 05:53:29','2020-04-08 05:53:29',NULL,NULL),
(7,110024,'Lajpatnagar','Delhi','India','North',1,0,1,0,'2020-04-08 05:53:29','2020-04-08 05:53:29',NULL,NULL),
(8,390020,'Baroda','Gujarat','India','west',0,1,0,0,'2020-04-08 05:53:29','2020-04-08 05:53:29',NULL,NULL),
(9,382010,'GANDHINAGAR','Gujarat','India','west',0,1,0,0,'2020-04-08 05:53:29','2020-04-08 05:53:29',NULL,NULL),
(10,474008,'aizawal','Mizoram','India','East',0,1,0,0,'2020-04-08 05:53:29','2020-04-08 05:53:29',NULL,NULL),
(11,343433,'leh','ladakh','india','north',0,1,0,1,'2020-04-08 05:53:29','2020-04-08 05:53:29',NULL,NULL),
(12,123456,'kohima','nagaland','india','east',0,0,1,1,'2020-04-08 05:53:29','2020-04-08 05:53:29',NULL,NULL),
(13,102000,'Victoria','British Columbia','Canada','central',0,1,0,0,'2020-04-08 05:53:29','2020-04-08 05:53:29',NULL,NULL),
(14,110001,'Delhi-NCR','Delhi','India','north',0,1,0,0,'2020-04-08 05:53:29','2020-04-08 05:53:29',NULL,NULL),
(15,400020,'MUMBAI','Maharashtra','India','west',1,1,0,0,'2020-04-08 05:53:29','2020-04-08 05:53:29',NULL,NULL),
(17,0,'0','0','0','0',0,0,0,0,'2020-07-29 09:03:00','2020-07-29 09:03:00',NULL,NULL),
(18,388235,'kapadvanj','Gujarat','India','West',0,1,0,0,'2021-08-14 02:49:43','2021-08-14 03:21:52',-1,-1),
(19,0,'etah','uttar pradesh','India','north',0,0,5,0,'2021-08-14 07:07:48','2021-08-14 07:15:42',-1,-1),
(20,123123,'jhansi','uttar pradesh','India','north',0,0,5,0,'2021-08-14 07:24:28','2021-08-14 07:24:28',-1,-1),
(21,0,'lalitpur','uttar pradesh','India','north',0,0,5,0,'2021-08-14 07:24:56','2021-08-14 07:24:56',-1,-1),
(22,0,'sdvxv','uttar pradesh','India','north',1,2,5,5,'2021-08-14 07:34:48','2021-08-14 07:34:48',-1,-1),
(23,0,'dfgdfg','uttar pradesh','India','north',1,1,0,0,'2021-08-14 07:43:10','2021-08-14 07:43:10',-1,-1),
(24,0,'dfgdfg','uttar pradesh','India','north',1,1,0,0,'2021-08-14 07:43:24','2021-08-14 07:43:24',-1,-1),
(25,123123,'jhansi','uttar pradesh','India','north',1,1,0,0,'2021-08-14 07:46:06','2021-08-14 07:46:06',-1,-1),
(26,346364,'jhansi','zauttar pradesh','India','north',1,0,0,0,'2021-08-14 08:13:17','2021-08-14 08:13:17',-1,-1),
(27,346364,'jhansi','uttar pradesh','India','north',31,3,12,5,'2021-08-14 08:13:20','2021-08-14 08:48:56',-1,-1);

/*Table structure for table `product_attributes` */

DROP TABLE IF EXISTS `product_attributes`;

CREATE TABLE `product_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `att_group_id` int(11) NOT NULL,
  `att_group_val_id` bigint(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `stock` varchar(200) DEFAULT NULL,
  `price_change` int(11) DEFAULT NULL,
  `status` varchar(200) NOT NULL,
  `product_url` varchar(500) DEFAULT NULL,
  `original_product_id` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `combine_key` (`att_group_id`,`att_group_val_id`,`original_product_id`),
  KEY `fk_att_val_id` (`att_group_val_id`),
  CONSTRAINT `fk_att_grp_id` FOREIGN KEY (`att_group_id`) REFERENCES `attributes` (`id`),
  CONSTRAINT `fk_att_val_id` FOREIGN KEY (`att_group_val_id`) REFERENCES `attributes_value` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3574 DEFAULT CHARSET=latin1;

/*Data for the table `product_attributes` */

/*Table structure for table `product_brand` */

DROP TABLE IF EXISTS `product_brand`;

CREATE TABLE `product_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

/*Data for the table `product_brand` */

insert  into `product_brand`(`id`,`name`,`created_date`,`modified_date`,`created_by`,`modified_by`) values 
(1,'Hawai','2020-04-08 05:54:26','2020-04-08 05:54:26',NULL,NULL),
(2,'Momin','2020-04-08 05:54:26','2020-04-08 05:54:26',NULL,NULL),
(3,'Dongli','2020-04-08 05:54:26','2020-04-08 05:54:26',NULL,NULL),
(4,'NA','2020-04-08 05:54:26','2020-04-08 05:54:26',NULL,NULL),
(5,'Crocs','2020-05-25 12:39:38','2020-05-25 12:39:38',-1,-1),
(6,'Doink','2020-05-25 12:39:39','2020-05-25 12:39:39',-1,-1),
(7,'Elite','2020-05-25 12:39:40','2020-05-25 12:39:40',-1,-1),
(8,'Orbit','2020-05-25 12:39:41','2020-05-25 12:39:41',-1,-1),
(9,'Desi Saga','2020-05-25 12:39:44','2020-05-25 12:39:44',-1,-1),
(10,'Puma','2020-05-25 12:39:45','2020-05-25 12:39:45',-1,-1),
(11,'Asian','2020-05-25 12:39:46','2020-05-25 12:39:46',-1,-1),
(12,'Nivia','2020-05-25 12:39:48','2020-05-25 12:39:48',-1,-1),
(13,'Kopps','2020-05-25 12:39:49','2020-05-25 12:39:49',-1,-1),
(14,'Panahi','2020-05-25 12:39:50','2020-05-25 12:39:50',-1,-1),
(15,'VAGON','2020-05-25 12:39:53','2020-05-25 12:39:53',-1,-1),
(16,'Swiggy','2020-05-25 12:39:55','2020-05-25 12:39:55',-1,-1),
(17,'Elle Wings','2020-05-25 12:39:55','2020-05-25 12:39:55',-1,-1),
(18,'Willywinkies','2020-05-25 12:39:57','2020-05-25 12:39:57',-1,-1),
(19,'Goldstar','2020-05-25 12:39:59','2020-05-25 12:39:59',-1,-1),
(20,'Earton','2020-05-25 12:40:02','2020-05-25 12:40:02',-1,-1),
(21,'Dry','2020-05-25 12:40:05','2020-05-25 12:40:05',-1,-1),
(22,'Barbie','2020-05-25 12:40:09','2020-05-25 12:40:09',-1,-1),
(23,'Al Artz','2020-05-25 12:40:11','2020-05-25 12:40:11',-1,-1),
(24,'Leatherwood1','2020-05-25 12:40:15','2020-05-25 12:40:15',-1,-1),
(25,'Ortan','2020-05-25 12:40:25','2020-05-25 12:40:25',-1,-1),
(26,'Lucy & Luke By Liberty','2020-05-25 12:40:27','2020-05-25 12:40:27',-1,-1),
(27,'ADIDAS','2020-05-25 12:40:38','2020-05-25 12:40:38',-1,-1),
(28,'Asian Shoes','2020-05-25 12:40:42','2020-05-25 12:40:42',-1,-1),
(29,'REEBOK','2020-05-25 12:40:58','2020-05-25 12:40:58',-1,-1),
(30,'Fuel','2020-05-25 12:41:00','2020-05-25 12:41:00',-1,-1),
(31,'Prada','2020-10-15 09:49:14','2020-10-15 09:49:14',-1,-1),
(34,'Dolce & Gabbana','2020-10-17 04:02:58','2020-10-17 04:02:58',-1,-1),
(35,'Balenciaga','2020-10-17 04:08:12','2020-10-17 04:08:12',-1,-1),
(36,'Hermes','2020-10-17 04:16:11','2020-10-19 06:46:24',-1,-1);

/*Table structure for table `product_image` */

DROP TABLE IF EXISTS `product_image`;

CREATE TABLE `product_image` (
  `id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL,
  `image` varchar(400) CHARACTER SET utf8 DEFAULT NULL,
  `size` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `product_image` */

/*Table structure for table `product_offers` */

DROP TABLE IF EXISTS `product_offers`;

CREATE TABLE `product_offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offer_name` varchar(200) NOT NULL,
  `product_id` int(11) NOT NULL,
  `vendor_id` varchar(50) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Data for the table `product_offers` */

/*Table structure for table `product_option_group` */

DROP TABLE IF EXISTS `product_option_group`;

CREATE TABLE `product_option_group` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `option_name` varchar(255) NOT NULL,
  `status` int(2) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` int(11) DEFAULT NULL,
  `created_by` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

/*Data for the table `product_option_group` */

/*Table structure for table `product_option_value` */

DROP TABLE IF EXISTS `product_option_value`;

CREATE TABLE `product_option_value` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `value` text NOT NULL,
  `group_id` int(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(4) DEFAULT NULL,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

/*Data for the table `product_option_value` */

/*Table structure for table `product_options` */

DROP TABLE IF EXISTS `product_options`;

CREATE TABLE `product_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `opt_group_val_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Data for the table `product_options` */

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) CHARACTER SET utf8mb4 NOT NULL,
  `description` text CHARACTER SET utf8mb4 NOT NULL,
  `regular_price` float NOT NULL,
  `sale_price` float NOT NULL,
  `category_id` int(50) NOT NULL,
  `stock` varchar(50) NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `product_url` text NOT NULL,
  `vendor_product_id` varchar(500) NOT NULL,
  `similar_product_id` varchar(800) DEFAULT NULL,
  `recommended_product_id` varchar(500) DEFAULT NULL,
  `do_not_display` varchar(200) NOT NULL DEFAULT '0',
  `parent_id` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(200) NOT NULL,
  `vendor_id` varchar(45) NOT NULL,
  `keyword` varchar(4000) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brand` (`brand_id`),
  CONSTRAINT `brand` FOREIGN KEY (`brand_id`) REFERENCES `product_brand` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `products` */

/*Table structure for table `products_family` */

DROP TABLE IF EXISTS `products_family`;

CREATE TABLE `products_family` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` varchar(50) DEFAULT NULL,
  `product_family_id` int(11) DEFAULT NULL,
  `group_id` int(50) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_product_id` (`product_family_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Data for the table `products_family` */

/*Table structure for table `promocodes` */

DROP TABLE IF EXISTS `promocodes`;

CREATE TABLE `promocodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `promocode` varchar(500) NOT NULL,
  `start_time` varchar(100) NOT NULL,
  `end_time` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `promo_value` float NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `promo_value_type` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Data for the table `promocodes` */

insert  into `promocodes`(`id`,`promocode`,`start_time`,`end_time`,`status`,`promo_value`,`description`,`promo_value_type`,`created_date`,`modified_date`,`created_by`,`modified_by`) values 
(1,'STRIKE500','1274316119000','1820367784000',1,500,'500 off','Fixed','2020-04-08 05:56:13','2020-04-08 05:56:13',NULL,NULL),
(2,'NOW2','1274316119000','1852364662000',1,2,'2% off','Variable','2020-04-08 05:56:13','2020-04-08 05:56:13',NULL,NULL),
(3,'STRIKE100','1574316119000','1809474331000',1,100,'100 off','Fixed','2020-04-08 05:56:13','2020-04-08 05:56:13',NULL,NULL),
(4,'FIRST10','1274316119000','1820367784000',1,10,'10% off','Variable','2020-04-08 05:56:13','2020-04-08 05:56:13',NULL,NULL),
(5,'STRIKE5','1226134262000','1820367784000',1,5,'5 off','Fixed','2020-04-08 05:56:13','2020-04-08 05:56:13',NULL,NULL),
(6,'expiredPromo','1374316119000','1420367784000',1,10,'10 off','Fixed','2020-04-08 05:56:13','2020-04-08 05:56:13',NULL,NULL),
(7,'OFFER23','1274316119000','1870670383000',1,23,'23% OFF','Variable','2020-04-08 05:56:13','2020-04-08 05:56:13',NULL,NULL),
(8,'SUMMER','1274316119000','1770670383000',1,15,'15 off','Fixed','2020-04-08 05:56:13','2020-04-08 05:56:13',NULL,NULL),
(9,'WINTER','1574316119000','1820367784000',0,7,'7% off','Variable','2020-04-15 10:21:53','2020-04-15 10:21:53',NULL,NULL),
(10,'HUGEPROFIT','1574316119000','1970670383000',1,10,'10 off','Fixed','2020-05-13 06:17:26','2020-05-13 06:17:26',NULL,NULL),
(11,'status0','1274316119000','1820367784000',0,1,'1 off','Fixed','2020-09-01 10:58:16','2020-09-01 10:58:16',NULL,NULL),
(12,'FESTIVE4000','1174316119000','1820367784000',1,4000,'4000 off','Fixed','2020-09-03 12:13:10','2020-09-03 12:13:10',NULL,NULL),
(13,'promoToLaunch','1819973689000','1914668089000',1,13,'13 off','Fixed','2020-09-03 12:15:38','2020-09-03 12:15:38',NULL,NULL),
(14,'now30','1274316119000','1914668089000',1,30,'30 off','Variable','2020-09-10 05:21:22','2020-09-10 05:21:22',NULL,NULL),
(17,'falt debit','1624102695000','1641458950000',0,20,'flat 20 rs','fixed','2020-10-19 04:33:12','2020-10-19 05:33:09',-1,-1),
(20,'1qsefd','1574316119000000','1674316075800000',1,6,'6% off','variable','2020-10-19 08:25:49','2020-10-19 08:25:49',-1,-1),
(21,'qFESTIVE4000','1539937614000000','1540024014000000',1,6,'6% off','variable','2020-10-19 08:27:48','2020-10-19 08:27:48',-1,-1),
(22,'aFESTIVE4000','1666254414000000','1697790414000000',1,7,'7% off','variable','2020-10-19 08:28:36','2020-10-19 08:29:56',-1,-1);

/*Table structure for table `refund` */

DROP TABLE IF EXISTS `refund`;

CREATE TABLE `refund` (
  `refund_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_number` varchar(100) DEFAULT NULL,
  `refund_grant_total` float DEFAULT NULL,
  `date_of_order_cancelled` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `refund_status` varchar(50) DEFAULT NULL,
  `refund_type` varchar(50) DEFAULT NULL,
  `refund_account_number` varchar(50) DEFAULT NULL,
  `date_of_refund` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `product_id` varchar(50) DEFAULT NULL,
  `order_cancel_reason` text,
  `discounts` decimal(10,2) DEFAULT '0.00',
  `shipping` float DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`refund_id`,`date_of_refund`)
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=latin1;

/*Data for the table `refund` */

/*Table structure for table `return_table` */

DROP TABLE IF EXISTS `return_table`;

CREATE TABLE `return_table` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` varchar(50) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `refund_id` int(11) DEFAULT NULL,
  `return_status` varchar(50) DEFAULT NULL,
  `date_of_return_request` datetime DEFAULT CURRENT_TIMESTAMP,
  `return_option` varchar(50) DEFAULT NULL,
  `order_return_reason` text,
  `pickup_date` datetime DEFAULT NULL,
  `return_condition` varchar(100) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=latin1;

/*Data for the table `return_table` */

/*Table structure for table `shipping_categories` */

DROP TABLE IF EXISTS `shipping_categories`;

CREATE TABLE `shipping_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courier_id` int(11) NOT NULL,
  `category_name` varchar(250) NOT NULL,
  `weight` varchar(250) NOT NULL,
  `intra_city` float DEFAULT NULL,
  `intra_zone` float DEFAULT NULL,
  `metro_to_metro` float DEFAULT NULL,
  `roi_A` float DEFAULT NULL,
  `roi_B` float DEFAULT NULL,
  `special_destination` float DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_courier_id` (`courier_id`),
  CONSTRAINT `fk_courier_id` FOREIGN KEY (`courier_id`) REFERENCES `couriers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `shipping_categories` */

insert  into `shipping_categories`(`id`,`courier_id`,`category_name`,`weight`,`intra_city`,`intra_zone`,`metro_to_metro`,`roi_A`,`roi_B`,`special_destination`,`status`,`created_date`,`modified_date`,`created_by`,`modified_by`) values 
(1,1,'Standard','0-500 gms',30,38,48,53,57,68,1,'2020-04-08 05:57:32','2020-04-08 05:57:32',NULL,NULL),
(3,1,'Express','0-500 gms',61,87,97,107,112,129,1,'2020-04-08 05:57:32','2020-04-08 05:57:32',NULL,NULL),
(4,1,'NDD','0-500 gms',80,100,120,125,127,140,1,'2020-04-08 05:57:32','2020-04-08 05:57:32',NULL,NULL),
(5,2,'Standard','0-500 gms',50,70,90,95,100,110,1,'2020-04-08 05:57:32','2020-04-08 05:57:32',NULL,NULL),
(6,2,'Express','0-500 gms',70,90,100,105,110,130,1,'2020-04-08 05:57:32','2020-04-08 05:57:32',NULL,NULL),
(7,2,'NDD','0-500 gms',28,37,46,51,54,65,1,'2020-04-08 05:57:32','2020-04-08 05:57:32',NULL,NULL),
(8,3,'Standard','0-500 gms',35,45,60,65,70,100,1,'2020-04-08 05:57:32','2020-04-08 05:57:32',NULL,NULL),
(9,3,'Express','0-500 gms',40,50,65,70,75,110,1,'2020-04-08 05:57:32','2020-04-08 05:57:32',NULL,NULL),
(10,5,'NDD','0-500 gms',67,69,64,62,89,126,1,'2020-04-08 05:57:32','2020-04-08 05:57:32',NULL,NULL),
(11,5,'Standard','0-500 gms',15,20,55,60,65,100,1,'2020-04-08 05:57:32','2020-04-08 05:57:32',NULL,NULL),
(12,6,'Standard','0-500 gms',40,42,55,60,65,100,1,'2020-04-08 05:57:32','2020-04-08 05:57:32',NULL,NULL),
(13,7,'Standard','0-500 gms',50,60,70,80,90,100,1,'2020-07-22 10:01:23','2020-07-22 10:01:23',NULL,NULL),
(14,1,'value3','0-500',10,10,20,10,10,10,1,'2021-08-07 05:32:30','2021-08-07 05:58:24',-1,-1),
(15,12,'ag','0-500 gms',1,0,0,0,0,0,0,'2021-08-07 08:43:00','2021-08-07 08:43:00',-1,-1),
(16,12,'fsd\'sdf','0-500 gms',423.34,23.22,45,344,23,42,0,'2021-08-07 10:28:37','2021-08-07 10:28:37',-1,-1);

/*Table structure for table `similar_products` */

DROP TABLE IF EXISTS `similar_products`;

CREATE TABLE `similar_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `similar_product_id` int(11) NOT NULL,
  `confidence_score` float NOT NULL,
  `product_vendor_id` int(11) NOT NULL,
  `similar_product_vendor_id` int(11) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT '-1',
  `modified_by` int(11) DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `fk_similar_pid` (`product_id`),
  KEY `fk_similar_pid_respective` (`similar_product_id`),
  KEY `fk_main_vendor_id` (`product_vendor_id`),
  KEY `fk_similar_vendor_id` (`similar_product_vendor_id`),
  CONSTRAINT `fk_main_vendor_id` FOREIGN KEY (`product_vendor_id`) REFERENCES `admin` (`id`),
  CONSTRAINT `fk_similar_pid` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_similar_pid_respective` FOREIGN KEY (`similar_product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_similar_vendor_id` FOREIGN KEY (`similar_product_vendor_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;

/*Data for the table `similar_products` */

/*Table structure for table `similar_products_sample` */

DROP TABLE IF EXISTS `similar_products_sample`;

CREATE TABLE `similar_products_sample` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `similar_product_id` int(11) NOT NULL,
  `confidence_score` float NOT NULL,
  `product_vendor_id` int(11) NOT NULL,
  `similar_product_vendor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sample_fk1` (`product_id`),
  KEY `sample_fk2` (`similar_product_id`),
  KEY `sample_fk3` (`product_vendor_id`),
  KEY `sample_fk4` (`similar_product_vendor_id`),
  CONSTRAINT `sample_fk1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `sample_fk2` FOREIGN KEY (`similar_product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `sample_fk3` FOREIGN KEY (`product_vendor_id`) REFERENCES `admin` (`id`),
  CONSTRAINT `sample_fk4` FOREIGN KEY (`similar_product_vendor_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30477 DEFAULT CHARSET=latin1;

/*Data for the table `similar_products_sample` */

/*Table structure for table `top_picks` */

DROP TABLE IF EXISTS `top_picks`;

CREATE TABLE `top_picks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=latin1;

/*Data for the table `top_picks` */

/*Table structure for table `vendor_address` */

DROP TABLE IF EXISTS `vendor_address`;

CREATE TABLE `vendor_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `type_billing_shipping` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `address1` varchar(250) DEFAULT NULL,
  `address2` varchar(250) DEFAULT NULL,
  `address3` varchar(250) DEFAULT NULL,
  `city` varchar(250) DEFAULT NULL,
  `state` varchar(250) DEFAULT NULL,
  `country` varchar(250) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `phone_number` varchar(250) DEFAULT NULL,
  `isPrimary` tinyint(1) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_id` (`vendor_id`),
  CONSTRAINT `vendor_id` FOREIGN KEY (`vendor_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `vendor_address` */

insert  into `vendor_address`(`id`,`vendor_id`,`type_billing_shipping`,`name`,`address1`,`address2`,`address3`,`city`,`state`,`country`,`pincode`,`phone_number`,`isPrimary`,`created_date`,`modified_date`,`created_by`,`modified_by`) values 
(1,2,'shipping','shopnow','indiabulles',NULL,NULL,'Baroda','Gujarat','India',390020,'1800000024',0,'2019-11-05 14:32:17','2019-11-01 14:32:28',NULL,NULL),
(2,1,'shipping','flipkart','nehrunugar','nehrunugar','nehrunugar','Ahemdabad','Gujarat','India',380001,'1800000025',0,'2019-11-26 12:36:48','2020-09-17 07:18:25',NULL,NULL),
(4,4,'shipping','ShopnowPantry','indiabulles',NULL,NULL,'Baroda','Gujarat','India',390020,'9624778899',0,'2020-07-22 10:21:41','2020-07-22 10:22:52',NULL,NULL),
(8,3,'abc','abcd','abc','','','abc','abc','abc',12345,'123',1,'2020-10-21 10:38:27','2020-10-21 10:40:22',3,3),
(10,4,'billing','myntra','12C-2, old rajendra nagar','near metro station','New Delhi','New Delhi','Union Territory','India',110001,'+9166776677677',0,'2020-10-21 11:05:29','2020-10-21 11:10:57',4,4),
(12,4,'billing','myntra','12C-2, old rajendra nagar','near metro station','New Delhi','New Delhi','Union Territory','India',110001,'+9166776677677',0,'2020-10-21 11:10:57','2020-10-21 11:11:19',4,4),
(13,4,'billing','myntra','12C-2, old rajendra nagar','near metro station','New Delhi','New Delhi','Union Territory','India',110001,'+9166776677677',0,'2020-10-21 11:11:19','2020-10-21 11:13:52',4,4),
(14,4,'billing','myntra','12C-2, old rajendra nagar','near metro station','New Delhi','New Delhi','Union Territory','India',110001,'+9166776677677',1,'2020-10-21 11:13:52','2020-10-21 11:13:52',4,4),
(15,4,'billing','myntra','12C-2, old rajendra nagar','near metro station','New Delhi','New Delhi','Union Territory','India',110001,'+9166776677677',1,'2020-10-21 12:06:38','2020-10-21 12:06:38',-1,-1);

/*Table structure for table `vendor_configuration` */

DROP TABLE IF EXISTS `vendor_configuration`;

CREATE TABLE `vendor_configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `return_policy_period` int(20) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT '-1',
  `modified_by` int(11) DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `vendore_fk` (`vendor_id`),
  CONSTRAINT `vendore_fk` FOREIGN KEY (`vendor_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `vendor_configuration` */

insert  into `vendor_configuration`(`id`,`vendor_id`,`return_policy_period`,`created_date`,`modified_date`,`created_by`,`modified_by`) values 
(1,1,1000,'2020-06-18 06:40:06','2020-06-18 06:40:06',-1,-1),
(2,2,2,'2020-06-18 06:40:14','2020-06-18 06:40:14',-1,-1),
(3,3,2,'2020-06-18 06:40:28','2020-06-18 06:40:28',-1,-1),
(4,4,30,'2020-10-22 01:59:32','2020-10-22 02:14:30',-1,-1),
(5,8,20,'2020-10-22 03:21:12','2020-10-22 05:07:58',-1,-1),
(6,9,10,'2020-10-22 04:18:23','2020-10-22 04:23:02',-1,-1),
(7,10,3,'2020-10-22 05:22:40','2020-10-22 05:23:10',-1,-1);

/*Table structure for table `wish_list` */

DROP TABLE IF EXISTS `wish_list`;

CREATE TABLE `wish_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(100) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wish_list_unic` (`customer_id`,`product_id`),
  KEY `fk_wish` (`product_id`),
  KEY `fk_create_wish1` (`created_by`),
  KEY `fk_modify_wish1` (`modified_by`),
  CONSTRAINT `fk_create_wish1` FOREIGN KEY (`created_by`) REFERENCES `customers` (`id`),
  CONSTRAINT `fk_customer_id1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `fk_modify_wish1` FOREIGN KEY (`modified_by`) REFERENCES `customers` (`id`),
  CONSTRAINT `fk_product_id1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=521 DEFAULT CHARSET=latin1;

/*Data for the table `wish_list` */

/* Procedure structure for procedure `abc` */

/*!50003 DROP PROCEDURE IF EXISTS  `abc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `abc`()
BEGIN
#select * from products limit 1;
insert into Student (name) values("ajay");
	END */$$
DELIMITER ;

/* Procedure structure for procedure `abctest` */

/*!50003 DROP PROCEDURE IF EXISTS  `abctest` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `abctest`(in spid int(11),IN proid INT(11),IN similarid INT(11),IN confidence_score float(10),IN pro_vendor_id INT(11),IN similar_vendor_id INT(11),IN stype INT(11),OUT insProductID varchar(256))
BEGIN
 
if spid=0 then  
 
IF NOT EXISTS(select id from lookup where id=stype and name='PRODUCT_SIMILARITY') THEN
       SET insProductID = 'enter valid type';
  
 
elseIF NOT EXISTS(select id from products where id=proid) THEN
       SET insProductID = 'product_id not valid';
 
        
elseIF NOT EXISTS (SELECT id FROM products WHERE id=similarid) THEN
            SET insProductID = 'similar product id not valid';
     
  
 elseIF NOT EXISTS (SELECT id FROM products WHERE vendor_id=pro_vendor_id and id=proid) THEN
            SET insProductID = 'product vendor_id not valid';
  
 elseIF NOT EXISTS (SELECT id FROM products WHERE vendor_id=similar_vendor_id and id=similarid) THEN
            SET insProductID = 'similar product vendor id not valid';
          
  ELSEIF EXISTS (SELECT id FROM similar_products WHERE product_id=proid and similar_product_id=similarid and type=stype) THEN
            SET insProductID = 'product_id and similar_product_is of same type presant so not insert into table'; 
 
 
           
   
  else 
  SET insProductID = 'final';
  end if;
  
        if  insProductID = 'final' then
        
		INSERT INTO similar_products  (product_id,similar_product_id,confidence_score,product_vendor_id,similar_product_vendor_id,type) VALUES(proid,similarid,confidence_score,pro_vendor_id,similar_vendor_id,stype);
         SET insProductID = 'product insert successful';
        end if;

else

   IF NOT EXISTS(SELECT id FROM lookup WHERE id=stype AND NAME='PRODUCT_SIMILARITY') THEN
       SET insProductID = 'enter valid type';
  
   elseIF NOT EXISTS(SELECT id FROM products WHERE id=proid) THEN
       SET insProductID = 'product_id not valid';
       
   ELSEIF NOT EXISTS (SELECT id FROM similar_products WHERE id=spid AND product_id=proid AND TYPE=stype) THEN
            SET insProductID = 'id not valid for update';  
 
        
    ELSEIF NOT EXISTS (SELECT id FROM products WHERE id=similarid) THEN
            SET insProductID = 'similar product id not valid';
     
  
     ELSEIF NOT EXISTS (SELECT id FROM products WHERE vendor_id=pro_vendor_id AND id=proid) THEN
            SET insProductID = 'product vendor_id not valid';
  
     ELSEIF NOT EXISTS (SELECT id FROM products WHERE vendor_id=similar_vendor_id AND id=similarid) THEN
            SET insProductID = 'similar product vendor id not valid';
      
     ELSE 
       SET insProductID = 'final';
  END IF;
  
        IF  insProductID = 'final' THEN
     
	update  similar_products set  product_id=proid,similar_product_id=similarid,confidence_score=confidence_score,product_vendor_id=pro_vendor_id,similar_product_vendor_id=similar_vendor_id,type=stype,modified_date=NOW() where id=spid and product_id=proid and type=stype;
         
         SET insProductID = 'product update successful';
         
        END IF;

end if;
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `cart_total_details_insert_delete` */

/*!50003 DROP PROCEDURE IF EXISTS  `cart_total_details_insert_delete` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `cart_total_details_insert_delete`(IN custid INT(11),IN devid varchar(200),in total_items INT(11),in subtotal float,shipchrg float, promo_dis float ,in offer_dis  float , in total_dis FLOAT, in total_before_tax FLOAT ,in tx float,in grandttal float,OUT insProductID int(11))
BEGIN
 
IF custid!=0 THEN  
 
IF  EXISTS(SELECT id FROM cart_total_details WHERE customer_id=custid ) THEN
      
       
       update cart_total_details set customer_id=custid,device_id=devid,total_number_of_items=total_items,sub_total=subtotal,shipping_charge=shipchrg,promo_discount=promo_dis,offer_discount=offer_dis,total_discount=total_dis,sub_total_before_tax=total_before_tax,tax=tx,grand_total=grandttal,modified_date=NOW() WHERE customer_id=custid;
       SET insProductID = 1;
 else
 
       INSERT INTO cart_total_details (customer_id,device_id,total_number_of_items,sub_total,shipping_charge,promo_discount,offer_discount,total_discount,sub_total_before_tax,tax,grand_total)VALUES(custid,devid,total_items,subtotal,shipchrg,promo_dis,offer_dis,total_dis,total_before_tax,tx,grandttal);
	SET insProductID = 2;
 
end if;

else 

IF  EXISTS(SELECT id FROM cart_total_details WHERE customer_id=custid and device_id=devid) THEN
      
      UPDATE cart_total_details SET customer_id=custid,device_id=devid,total_number_of_items=total_items,sub_total=subtotal,shipping_charge=shipchrg,promo_discount=promo_dis,offer_discount=offer_dis,total_discount=total_dis,sub_total_before_tax=total_before_tax,tax=tx,grand_total=grandttal,modified_date=NOW() WHERE customer_id=0 and device_id=devid;      
       SET insProductID = 99;
 ELSE
 
       INSERT INTO cart_total_details (customer_id,device_id,total_number_of_items,sub_total,shipping_charge,promo_discount,offer_discount,total_discount,sub_total_before_tax,tax,grand_total)VALUES(custid,devid,total_items,subtotal,shipchrg,promo_dis,offer_dis,total_dis,total_before_tax,tx,grandttal);
	SET insProductID = 100;
 
end if ;    
  

END IF;
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `customer_notification` */

/*!50003 DROP PROCEDURE IF EXISTS  `customer_notification` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `customer_notification`(IN cust_Noti_id INT(11),IN Noti_id VARCHAR(200),IN Cust_id INT(11),IN Not_schedule DATETIME, OUT insProductID VARCHAR(100))
BEGIN
	
	DECLARE iSstatus VARCHAR(100) DEFAULT 0;
	DECLARE cust_name VARCHAR(100);
	DECLARE cust_mobile VARCHAR(100);
	
IF cust_Noti_id=0 THEN  
	
	IF NOT EXISTS(SELECT id FROM customers WHERE id=Cust_id ) THEN 	
		SET  insProductID ='customer not valid';
	 
	 ELSEIF NOT EXISTS(SELECT id FROM customers WHERE id=Cust_id AND STATUS=1) THEN
		SET  insProductID ='customer not conform in if';
	 
	 ELSEIF NOT EXISTS(SELECT id FROM customers WHERE id=Cust_id AND subscribed=1) THEN
		SET  insProductID ='customer not susbriction for notification in if';
		
	  elseIF NOT EXISTS(SELECT notification_id FROM notifications WHERE notification_id=Noti_id) THEN 	 		
		SET  insProductID ='notification_id not valid';
	
	 ELSE
	
		 
	 SELECT phone_number INTO @cust_mobile FROM customers WHERE id=Cust_id ;
	 		  
	 INSERT IGNORE INTO customer_notifications (notification_id,customer_id,mobile_number,cust_noti_schedule,status)VALUES(Noti_id,Cust_id,@cust_mobile,Not_schedule,1);
	 SET insProductID='insert notification sucessful';

	END IF;
	
	
ELSE
	
	
	 IF NOT EXISTS(SELECT notification_id FROM notifications WHERE notification_id=Noti_id) THEN 	 		
	 SET  insProductID ='notification_id not valid';
	 
	 ELSEIF NOT EXISTS(SELECT id FROM customer_notifications WHERE id= cust_Noti_id) THEN 	 
	 SET  insProductID ='customer notification id not valid';
	 
	
	
	 ELSEIF NOT EXISTS(SELECT id FROM customers WHERE id=Cust_id ) THEN 	 
	 SET  insProductID ='customer not valid';
	 
	 ELSEIF NOT EXISTS(SELECT id FROM customers WHERE id=Cust_id AND STATUS=1) THEN 
	 SET  insProductID ='customer not conform in else';
	 
	 ELSEIF NOT EXISTS(SELECT id FROM customers WHERE id=Cust_id AND subscribed=1) THEN 
	 SET  insProductID ='customer not susbriction for notification';
	
	
	ELSE
		 
	 SELECT phone_number INTO @cust_mobile FROM customers WHERE id=Cust_id ;	   
	 UPDATE customer_notifications SET notification_id=Noti_id,customer_id=Cust_id,mobile_number=@cust_mobile,cust_noti_schedule=Not_schedule,modified_date=NOW() WHERE notification_id=Noti_id;
	 SET insProductID='update notification sucessful';

	END IF;
		
END IF;
	
	

	END */$$
DELIMITER ;

/* Procedure structure for procedure `fashion` */

/*!50003 DROP PROCEDURE IF EXISTS  `fashion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `fashion`(IN fid INT(11),IN pname varchar(256),IN keywords varchar(256),IN instragramid varchar(256),IN fstatus int(11),IN img varchar(256),OUT insProductID1 VARCHAR(256))
BEGIN
 
 DECLARE fashionID INT DEFAULT 0; 
 
 
 
IF fid=0 THEN  
 
	
  
		INSERT INTO fashion_trends (name,keywords,image,instagram_id,status) VALUES(pNAME,keywords,img,instragramid,fstatus);
		
		select fashion_id into @fashionID from fashion_trends  order by fashion_id desc limit 1;
		SET insProductID1 = concat('fashion_id insert successful ~ ',@fashionID);
      

ELSE
        
	 
         UPDATE fashion_trends SET NAME=pNAME,keywords=keywords,instagram_id=instragramid,image=img,status=fstatus,modified_date=now() WHERE fashion_id=fid;
         
         SET insProductID1 = 'fashion_id update successful';

END IF;
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `fashion_image` */

/*!50003 DROP PROCEDURE IF EXISTS  `fashion_image` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `fashion_image`(IN fid INT(11),IN pimage VARCHAR(256),OUT insProductID1 VARCHAR(256))
BEGIN
 
 DECLARE fashionID INT DEFAULT 0; 
 
 
 
IF fid=0 THEN  
 
	
  
		INSERT INTO fashion_trends (image) VALUES(pimage);
		
		SELECT fashion_id INTO @fashionID FROM fashion_trends  ORDER BY fashion_id DESC LIMIT 1;
		
		SET insProductID1 = CONCAT('fashion_id_image insert successful ~ ',@fashionID);
      

ELSE
        
	 
         UPDATE fashion_trends SET image=pimage,modified_date=NOW() WHERE fashion_id=fid;
         
         SET insProductID1 = 'fashion_id_image update successful';

END IF;
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `notification` */

/*!50003 DROP PROCEDURE IF EXISTS  `notification` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `notification`(IN Noti_id INT(11),IN Not_name VARCHAR(200),IN Not_type INT(11),in Not_schedule datetime,IN Message VARCHAR(500),IN Not_state VARCHAR(255), OUT insProductID varchar(100))
BEGIN
	
	
IF Noti_id=0 THEN  
	
	
			  
	 INSERT INTO notifications (notification_name,TYPE,notification_schedule,message,notification_state)VALUE(Not_name,Not_type,Not_schedule,Message,Not_state);
	 set insProductID='insert notification sucessful';

	
	
	
else
	
	
	 IF NOT EXISTS(SELECT notification_id FROM notifications WHERE notification_id=Noti_id) THEN 	 		
	 SET  insProductID ='notification_id not valid';
	
	
	
	
	ELSE
		 
		   
	 update notifications set notification_name=Not_name,TYPE=Not_type,notification_schedule=Not_schedule,message=Message,notification_state=Not_state,modified_date=NOW() where notification_id=Noti_id;
	 SET insProductID='update notification sucessful';

	END IF;
		
END IF;
	
	

	END */$$
DELIMITER ;

/* Procedure structure for procedure `productInsUpdate` */

/*!50003 DROP PROCEDURE IF EXISTS  `productInsUpdate` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `productInsUpdate`(IN catName VARCHAR(256),IN subCatName VARCHAR(200),IN child_cat VARCHAR(200),IN prodName VARCHAR(500),IN productBrand VARCHAR(255),IN description TEXT,IN regularPrice FLOAT, IN salePrice FLOAT, IN stock_i VARCHAR(50), IN image VARCHAR(500),IN prodUrl VARCHAR(300),IN productID VARCHAR(500),IN vendorID VARCHAR(50),IN parentId VARCHAR(50),IN similarProductId VARCHAR(500), OUT insProductID INT)
BEGIN

DECLARE iCatID INT DEFAULT 0;
DECLARE iParentID INT DEFAULT 0;
DECLARE iSubCat VARCHAR(200);
DECLARE iPID INT DEFAULT 0;
DECLARE POSITION INT DEFAULT 0 ;
DECLARE variant_product_id VARCHAR(200);
DECLARE iVariant INT;
DECLARE iVariantID INT;
DECLARE iStockTrue INT;
DECLARE iDisplay INT;
DECLARE iBrandID INT;

SET @iDisplay = 0;

SELECT id INTO @iParentID FROM categories WHERE LOWER(NAME) = LOWER(catName);

IF NOT EXISTS (SELECT id FROM categories WHERE LOWER(NAME) = LOWER(catName)) THEN
INSERT INTO categories(NAME,parent_id,image,STATUS) VALUES (catName,0,image,1);
SELECT id INTO @iParentID FROM categories WHERE id= LAST_INSERT_ID();
END IF;

SELECT sub_category INTO @iSubCat FROM cat_mapping WHERE LOWER(category) = LOWER(catName) AND LOWER(child) = LOWER(child_cat) AND vendor_id = vendorID;
SELECT id INTO @iCatID FROM categories WHERE LOWER(NAME) = LOWER(@iSubCat) AND parent_id = @iParentID;

IF (stock_i = 'false')  THEN
SET @iDisplay = 1;
END IF;

IF NOT EXISTS (SELECT id FROM categories WHERE LOWER(NAME) = LOWER(@iSubCat) AND parent_id = @iParentID) THEN
INSERT INTO categories(NAME,parent_id,image,STATUS) VALUES (@iSubCat,@iParentID,image,1);
SELECT id INTO @iCatID FROM categories WHERE id= LAST_INSERT_ID();
END IF;        

SELECT id INTO @iCatID FROM categories WHERE LOWER(NAME) = LOWER(@iSubCat) AND parent_id = @iParentID;

IF NOT EXISTS (SELECT id FROM product_brand WHERE LOWER(NAME) = LOWER(productBrand)) THEN
insert into product_brand(name,created_by,modified_by) values (productBrand,-1,-1);
SELECT id INTO @iBrandID FROM product_brand WHERE id= LAST_INSERT_ID();
END IF; 

SELECT id INTO @iBrandID FROM product_brand WHERE LOWER(NAME) = LOWER(productBrand);

INSERT INTO products(NAME,description,brand_id,regular_price,sale_price,category_id,stock,image,product_url,vendor_product_id,vendor_id,do_not_display,parent_id,similar_product_id,STATUS) VALUES (prodName,description,@iBrandID,regularPrice,salePrice,@iCatID,stock_i,image,prodUrl,productID,vendorID,@iDisplay,0,similarProductId,1) ON DUPLICATE KEY UPDATE NAME = prodName, description = description, brand_id = @iBrandID, regular_price = regularPrice, sale_price = salePrice, category_id = @iCatID, stock = stock_i, image = image, product_url = prodUrl, vendor_product_id = productID, vendor_id = vendorID, do_not_display = @iDisplay, parent_id = 0, similar_product_id = similarProductId, STATUS = 1;


END */$$
DELIMITER ;

/* Procedure structure for procedure `product_attr` */

/*!50003 DROP PROCEDURE IF EXISTS  `product_attr` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `product_attr`(IN att_grp_id INT(11),IN att_val_id BIGINT(255),IN productID VARCHAR(50),IN active_ID VARCHAR(50),IN vendorID VARCHAR(50),IN prodURL VARCHAR(500),IN stock_i VARCHAR(50),IN price INT(11))
BEGIN

	DECLARE iGAttrID INT DEFAULT 0;
	DECLARE iAttrValID INT DEFAULT 0;
	DECLARE pId INT DEFAULT 0;
	DECLARE activeId INT DEFAULT 0;
	
	#select id into @iGAttrID from attributes where att_key_hbase = att_grp_id and status = '1';
	#SELECT id INTO @iAttrValID FROM attributes_value WHERE att_value_hbase_key = att_val_id AND STATUS = '1';
	#SELECT id INTO @activeId FROM products WHERE vendor_product_id = active_ID AND vendor_id = vendorID;
	#SELECT id INTO @pId FROM products WHERE vendor_product_id = productID and vendor_id = vendorID;
	
	IF active_ID = productID THEN
		SELECT id INTO @activeId FROM products WHERE vendor_product_id = active_ID AND vendor_id = vendorID;
		INSERT INTO product_attributes (att_group_id,att_group_val_id,product_id,stock,price_change,STATUS,product_url,original_product_id) VALUES (att_grp_id,att_val_id,@activeId,stock_i,price,'1',prodURL,@activeId) ON DUPLICATE KEY UPDATE att_group_id = att_grp_id, att_group_val_id = att_val_id, product_id = @activeId, stock = stock, price_change = price, STATUS = '1', product_url = prodURL, original_product_id = @activeId;
	ELSE
		SELECT id INTO @activeId FROM products WHERE vendor_product_id = active_ID AND vendor_id = vendorID;
		SELECT id INTO @pId FROM products WHERE vendor_product_id = productID AND vendor_id = vendorID;
		INSERT INTO product_attributes (att_group_id,att_group_val_id,product_id,stock,price_change,STATUS,product_url,original_product_id) VALUES (att_grp_id,att_val_id,@activeId,stock_i,price,'1',prodURL,@pId) ON DUPLICATE KEY UPDATE att_group_id = att_grp_id, att_group_val_id = att_val_id, product_id = @activeId, stock = stock, price_change = price, STATUS = '1', product_url = prodURL, original_product_id = @pId;
	END IF;	

END */$$
DELIMITER ;

/* Procedure structure for procedure `similar_product_add_update` */

/*!50003 DROP PROCEDURE IF EXISTS  `similar_product_add_update` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `similar_product_add_update`(in spid int(11),IN proid INT(11),IN similarid INT(11),IN confidence_score float(10),IN pro_vendor_id INT(11),IN similar_vendor_id INT(11),IN stype INT(11),OUT insProductID varchar(256))
BEGIN
 
if stype=27 then

   if spid=0 then  
 
	IF NOT EXISTS(select id from lookup where id=stype and name='PRODUCT_SIMILARITY') THEN
	SET insProductID = 'enter valid type';
  
 
	elseIF NOT EXISTS(select id from products where id=proid) THEN
	SET insProductID = 'Enter valid Product id';
 
        
	elseIF NOT EXISTS (SELECT id FROM products WHERE id=similarid) THEN
            SET insProductID = 'Enter valid Similar Product Id';
     
  
	elseIF NOT EXISTS (SELECT id FROM products WHERE vendor_id=pro_vendor_id and id=proid) THEN
            SET insProductID = 'Please enter correct vendor id for the product';
  
	elseIF NOT EXISTS (SELECT id FROM products WHERE vendor_id=similar_vendor_id and id=similarid) THEN
            SET insProductID = 'Please enter correct vendor id for the similar-product';
          
	ELSEIF EXISTS (SELECT id FROM similar_products WHERE product_id=proid and similar_product_id=similarid and type=stype) THEN
            SET insProductID = 'This entry is already present in the database record'; 
   
    ELSEIF pro_vendor_id!=similar_vendor_id THEN
            SET insProductID = 'Vendor id for product and similar-product should be same';
   
   
	else 
	SET insProductID = 'final';
	end if;
  
        if  insProductID = 'final' then
        
		INSERT INTO similar_products  (product_id,similar_product_id,confidence_score,product_vendor_id,similar_product_vendor_id,type) VALUES(proid,similarid,confidence_score,pro_vendor_id,similar_vendor_id,stype);
         SET insProductID = 'Record inserted successfully';
        end if;

   else

	IF NOT EXISTS(SELECT id FROM lookup WHERE id=stype AND NAME='PRODUCT_SIMILARITY') THEN
	SET insProductID = 'enter valid type';
  
	elseIF NOT EXISTS(SELECT id FROM products WHERE id=proid) THEN
	SET insProductID = 'Enter valid Product id';
       
	ELSEIF NOT EXISTS (SELECT id FROM similar_products WHERE id=spid AND product_id=proid AND TYPE=stype) THEN
            SET insProductID = 'id (spid) on which, update is to be made, is invalid';  
 
        
	ELSEIF NOT EXISTS (SELECT id FROM products WHERE id=similarid) THEN
            SET insProductID = 'Enter valid Similar Product Id';
     
  
	ELSEIF NOT EXISTS (SELECT id FROM products WHERE vendor_id=pro_vendor_id AND id=proid) THEN
            SET insProductID = 'Please enter correct vendor id for the product';
  
	ELSEIF NOT EXISTS (SELECT id FROM products WHERE vendor_id=similar_vendor_id AND id=similarid) THEN
            SET insProductID = 'Please enter correct vendor id for the similar-product';
     
      ELSEIF pro_vendor_id!=similar_vendor_id THEN
            SET insProductID = 'Vendor id for product and similar-product should be same';
   
        ELSE 
       SET insProductID = 'final';
	END IF;
  
        IF  insProductID = 'final' THEN
     
	update  similar_products set  product_id=proid,similar_product_id=similarid,confidence_score=confidence_score,product_vendor_id=pro_vendor_id,similar_product_vendor_id=similar_vendor_id,type=stype,modified_date=NOW() where id=spid and product_id=proid and type=stype;
         
         SET insProductID = 'data updated successfully';
         
        END IF;

   end if;

else


IF spid=0 THEN  
 
IF NOT EXISTS(SELECT id FROM lookup WHERE id=stype AND NAME='VENDOR_PRODUCT_MATCH') THEN
       SET insProductID = 'enter valid type';
  
 
ELSEIF NOT EXISTS(SELECT id FROM products WHERE id=proid) THEN
       SET insProductID = 'Enter valid Product id';
 
        
ELSEIF NOT EXISTS (SELECT id FROM products WHERE id=similarid) THEN
            SET insProductID = 'Enter valid Similar Product Id';
     
  
 ELSEIF NOT EXISTS (SELECT id FROM products WHERE vendor_id=pro_vendor_id AND id=proid) THEN
            SET insProductID = 'Please enter correct vendor id for the product';
  
 ELSEIF NOT EXISTS (SELECT id FROM products WHERE vendor_id=similar_vendor_id AND id=similarid) THEN
            SET insProductID = 'Please enter correct vendor id for the similar-product';
            
   elseIf pro_vendor_id=similar_vendor_id then
            SET insProductID = 'Vendor id for product and similar-product should be different';
          
 ELSEIF EXISTS (SELECT id FROM similar_products WHERE product_id=proid AND similar_product_id=similarid AND TYPE=stype) THEN
            SET insProductID = 'This entry is already present in the database record'; 
 
 
           
   
  ELSE 
  SET insProductID = 'final';
  END IF;
  
        IF  insProductID = 'final' THEN
        
		INSERT INTO similar_products  (product_id,similar_product_id,confidence_score,product_vendor_id,similar_product_vendor_id,TYPE) VALUES(proid,similarid,confidence_score,pro_vendor_id,similar_vendor_id,stype);
         SET insProductID = 'Record inserted successfully';
        END IF;

ELSE

   IF NOT EXISTS(SELECT id FROM lookup WHERE id=stype AND NAME='VENDOR_PRODUCT_MATCH') THEN
       SET insProductID = 'enter valid type';
  
   ELSEIF NOT EXISTS(SELECT id FROM products WHERE id=proid) THEN
       SET insProductID = 'Enter valid Product id';
       
   ELSEIF NOT EXISTS (SELECT id FROM similar_products WHERE id=spid AND product_id=proid AND TYPE=stype) THEN
            SET insProductID = 'id (spid) on which, update is to be made, is invalid';  
 
        
    ELSEIF NOT EXISTS (SELECT id FROM products WHERE id=similarid) THEN
            SET insProductID = 'Enter valid Similar Product Id';
     
  
     ELSEIF NOT EXISTS (SELECT id FROM products WHERE vendor_id=pro_vendor_id AND id=proid) THEN
            SET insProductID = 'Please enter correct vendor id for the product';
  
     ELSEIF NOT EXISTS (SELECT id FROM products WHERE vendor_id=similar_vendor_id AND id=similarid) THEN
            SET insProductID = 'Please enter correct vendor id for the similar-product';
             
     ELSEIF pro_vendor_id=similar_vendor_id THEN
            SET insProductID = 'Vendor id for product and similar-product should be different';
   
      
     ELSE 
       SET insProductID = 'final';
  END IF;
  
        IF  insProductID = 'final' THEN
     
	UPDATE  similar_products SET  product_id=proid,similar_product_id=similarid,confidence_score=confidence_score,product_vendor_id=pro_vendor_id,similar_product_vendor_id=similar_vendor_id,TYPE=stype,modified_date=NOW() WHERE id=spid AND product_id=proid AND TYPE=stype;
         
         SET insProductID = 'data updated successfully';
         
        END IF;

END IF;
end if;
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `trending_add_update` */

/*!50003 DROP PROCEDURE IF EXISTS  `trending_add_update` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `trending_add_update`(IN bpid INT(11),IN proid INT(11),stype INT(11),OUT insProductID VARCHAR(256))
BEGIN
 
IF bpid=0 THEN  
 
IF NOT EXISTS(SELECT id FROM lookup WHERE id=stype AND NAME='PRODUCT_SIMILARITY') THEN
       SET insProductID = 'enter valid type';
  
 
ELSEIF NOT EXISTS(SELECT id FROM products WHERE id=proid and do_not_display=0 and stock='true') THEN
       SET insProductID = 'product_id not valid';
       
 ELSEIF EXISTS (SELECT id FROM best_product WHERE product_id=proid and type=stype) THEN
            SET insProductID = 'product_id  presant so not insert into table'; 

           
   
  ELSE 
  SET insProductID = 'final';
  END IF;
  
        IF  insProductID = 'final' THEN
        
		INSERT INTO best_product (product_id,TYPE) VALUES(proid,stype);
         SET insProductID = 'product insert successful';
        END IF;

ELSE

   IF NOT EXISTS(SELECT id FROM lookup WHERE id=stype AND NAME='PRODUCT_SIMILARITY') THEN
       SET insProductID = 'enter valid type';
  
   ELSEIF NOT EXISTS(SELECT id FROM products WHERE id=proid AND do_not_display=0 AND stock='true') THEN
       SET insProductID = 'product_id not valid';
       
   ELSEIF NOT EXISTS (SELECT id FROM `best_product` WHERE id=bpid AND product_id=proid AND TYPE=stype) THEN
            SET insProductID = 'id not valid for update';  
 
        
     
     ELSE 
       SET insProductID = 'final';
  END IF;
  
        IF  insProductID = 'final' THEN
     
	UPDATE  `best_product` SET product_id=proid,TYPE=stype,modified_date=NOW() WHERE id=bpid AND product_id=proid AND TYPE=stype;
         
         SET insProductID = 'product update successful';
         
        END IF;

END IF;
	
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
