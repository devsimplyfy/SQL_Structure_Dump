/*
SQLyog Community v12.5.0 (64 bit)
MySQL - 5.7.20-log : Database - wsimcpsn_shopnowee
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`wsimcpsn_shopnowee` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `wsimcpsn_shopnowee`;

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` int(11) NOT NULL,
  `type_billing_shipping` varchar(250) NOT NULL,
  `firstName` varchar(200) NOT NULL,
  `lastName` varchar(200) NOT NULL,
  `address1` varchar(250) NOT NULL,
  `address2` varchar(250) NOT NULL,
  `address3` varchar(250) NOT NULL,
  `city` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL,
  `country` varchar(200) NOT NULL,
  `phoneNumber` varchar(100) NOT NULL,
  `isPrimary` int(11) NOT NULL,
  `createdDatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `username` varchar(36) NOT NULL,
  `password` varchar(36) NOT NULL,
  `emailid` text NOT NULL,
  `isactive` int(2) NOT NULL,
  `isadmin` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `attributes` */

DROP TABLE IF EXISTS `attributes`;

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `att_group_name` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `attributes_value` */

DROP TABLE IF EXISTS `attributes_value`;

CREATE TABLE `attributes_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `att_group_id` int(11) NOT NULL,
  `att_value` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `color_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `banners` */

DROP TABLE IF EXISTS `banners`;

CREATE TABLE `banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `image` varchar(300) NOT NULL,
  `status` varchar(50) NOT NULL,
  `show_homepage` varchar(100) NOT NULL,
  `product_ids` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `best_product` */

DROP TABLE IF EXISTS `best_product`;

CREATE TABLE `best_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `modified_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `cat_mapping` */

DROP TABLE IF EXISTS `cat_mapping`;

CREATE TABLE `cat_mapping` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `category` varchar(200) DEFAULT NULL,
  `sub_category` varchar(200) DEFAULT NULL,
  `child` varchar(200) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=319 DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

/*Table structure for table `color_code_main` */

DROP TABLE IF EXISTS `color_code_main`;

CREATE TABLE `color_code_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color_name` varchar(50) DEFAULT NULL,
  `color_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=988 DEFAULT CHARSET=latin1;

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(300) NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `google_id` varchar(500) NOT NULL,
  `image` varchar(500) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `deal_detail` */

DROP TABLE IF EXISTS `deal_detail`;

CREATE TABLE `deal_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `import_details` */

DROP TABLE IF EXISTS `import_details`;

CREATE TABLE `import_details` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `last_update` bigint(255) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `missing_color` */

DROP TABLE IF EXISTS `missing_color`;

CREATE TABLE `missing_color` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `color_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `product_attributes` */

DROP TABLE IF EXISTS `product_attributes`;

CREATE TABLE `product_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `att_group_id` int(11) NOT NULL,
  `att_group_val_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `stock` varchar(200) DEFAULT NULL,
  `price_change` int(11) DEFAULT NULL,
  `status` varchar(200) NOT NULL,
  `product_url` varchar(500) DEFAULT NULL,
  `original_product_id` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_id_idx` (`product_id`),
  KEY `fk_att_id` (`att_group_id`),
  CONSTRAINT `fk_att_id` FOREIGN KEY (`att_group_id`) REFERENCES `attributes` (`id`),
  CONSTRAINT `fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Table structure for table `product_image` */

DROP TABLE IF EXISTS `product_image`;

CREATE TABLE `product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` varchar(50) NOT NULL,
  `image` varchar(400) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `product_image_keywords` */

DROP TABLE IF EXISTS `product_image_keywords`;

CREATE TABLE `product_image_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` varchar(50) NOT NULL,
  `keywords` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `product_keywords` */

DROP TABLE IF EXISTS `product_keywords`;

CREATE TABLE `product_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` varchar(50) NOT NULL,
  `keywords` varchar(400) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `product_offers` */

DROP TABLE IF EXISTS `product_offers`;

CREATE TABLE `product_offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offer_name` varchar(200) NOT NULL,
  `product_id` int(11) NOT NULL,
  `vendor_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `product_option_group` */

DROP TABLE IF EXISTS `product_option_group`;

CREATE TABLE `product_option_group` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `option_name` varchar(255) NOT NULL,
  `create_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(4) DEFAULT NULL,
  `modify_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `product_options` */

DROP TABLE IF EXISTS `product_options`;

CREATE TABLE `product_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `opt_group_val_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

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
  UNIQUE KEY `vendor_product_id` (`vendor_product_id`),
  KEY `id` (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=398386 DEFAULT CHARSET=latin1;

/*Table structure for table `products_family` */

DROP TABLE IF EXISTS `products_family`;

CREATE TABLE `products_family` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` varchar(50) DEFAULT NULL,
  `product_family` int(11) DEFAULT NULL,
  `product_family_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_family` (`product_family`),
  KEY `vendor_product_id` (`product_family_id`)
) ENGINE=InnoDB AUTO_INCREMENT=142910 DEFAULT CHARSET=latin1;

/*Table structure for table `top_picks` */

DROP TABLE IF EXISTS `top_picks`;

CREATE TABLE `top_picks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `modified_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `wish_list` */

DROP TABLE IF EXISTS `wish_list`;

CREATE TABLE `wish_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(100) NOT NULL,
  `product_id` varchar(100) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/* Function  structure for function  `SPLIT_STR` */

/*!50003 DROP FUNCTION IF EXISTS `SPLIT_STR` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `SPLIT_STR`(X TEXT,delim VARCHAR(12),pos INT) RETURNS varchar(255) CHARSET utf8
    DETERMINISTIC
begin
		RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(X, delim, pos),LENGTH(SUBSTRING_INDEX(X, delim, pos -1)) + 1),delim, '');
    end */$$
DELIMITER ;

/* Procedure structure for procedure `categoriesInsUpdate` */

/*!50003 DROP PROCEDURE IF EXISTS  `categoriesInsUpdate` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `categoriesInsUpdate`(IN catName VARCHAR(100),IN img VARCHAR(100),IN productID VARCHAR(50), OUT insProductID INT)
BEGIN
	DECLARE iCatID INT DEFAULT 0;
	#DECLARE iAttrValID INT DEFAULT 0;
	
	SELECT id INTO @iCatID FROM categories WHERE LOWER(NAME) = LOWER(catName) AND STATUS = 1;
	IF NOT EXISTS (SELECT id FROM categories WHERE LOWER(NAME) = LOWER(catName) AND STATUS = 1 ) THEN
		INSERT INTO categories(NAME,image,STATUS) VALUES (catName,img,1);
		SELECT id INTO @iCatID FROM attributes WHERE id= LAST_INSERT_ID();
        #select iAttrID;
	END IF;
    SELECT @iCatID;
END */$$
DELIMITER ;

/* Procedure structure for procedure `catNameCheck` */

/*!50003 DROP PROCEDURE IF EXISTS  `catNameCheck` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `catNameCheck`(IN child_ varchar(200))
BEGIN
	DECLARE iCatID INT DEFAULT 2;
	DECLARE iParentID INT;
	DECLARE catName1 VARCHAR(200);
	DECLARE catName2 VARCHAR(200);
	
	
	#SELECT NAME INTO @catName1 FROM categories WHERE id=catId;
    #select parent_id INTO @iParentId FROM categories WHERE id=catId;
    
	#SELECT NAME INTO @catName2 from categories WHERE id=@iParentId;
    select category,sub_category from cat_mapping where child=child_;
	
   # SELECT @catName1,@catName2;
END */$$
DELIMITER ;

/* Procedure structure for procedure `dealsProcedure` */

/*!50003 DROP PROCEDURE IF EXISTS  `dealsProcedure` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `dealsProcedure`(IN catName VARCHAR(256),IN subCatName VARCHAR(200),IN child_cat VARCHAR(200),IN prodName VARCHAR(500),IN description TEXT,IN regularPrice FLOAT, IN salePrice FLOAT, IN stock VARCHAR(50), IN image VARCHAR(500),IN prodUrl VARCHAR(300),IN productID VARCHAR(500),IN vendorID VARCHAR(50),IN parentId VARCHAR(50),IN similarProductId VARCHAR(500),IN start_date_ts varchar(100),IN end_date_ts varchar(100),OUT insProductID INT)
BEGIN
	DECLARE iCatID INT DEFAULT 0;
	DECLARE iParentID INT DEFAULT 0;
	DECLARE iSubCat VARCHAR(200);
	DECLARE ipdID INT DEFAULT 0;
	DECLARE POSITION INT DEFAULT 0 ;
	DECLARE deal_product_id int(11);
	DECLARE id_deal VARCHAR(255);
	DECLARE iidDeal INT DEFAULT 0;
	DECLARE iDealID TEXT;
	declare iPRODUCTID TEXT;
	DECLARE iDealName VARCHAR(200);
	#DECLARE iProdID INT DEFAULT 0;
	#SELECT id INTO @iCatID FROM cat_mapping WHERE LOWER(category) = LOWER(catName) AND LOWER(child) = LOWER(child) ;
	SELECT id INTO @iParentID FROM categories WHERE LOWER(NAME) = LOWER(catName);
	
	IF NOT EXISTS (SELECT id FROM categories WHERE LOWER(NAME) = LOWER(catName)) THEN
		INSERT INTO categories(NAME,parent_id,image,STATUS) VALUES (catName,0,image,1);
		SELECT id INTO @iParentID FROM categories WHERE id= LAST_INSERT_ID();				
	END IF;	

	SELECT sub_category INTO @iSubCat FROM cat_mapping WHERE LOWER(category) = LOWER(catName) AND LOWER(child) = LOWER(child_cat);		
	SELECT id INTO @iCatID FROM categories WHERE LOWER(NAME) = LOWER(@iSubCat) AND parent_id = @iParentID;
	
	IF NOT EXISTS (SELECT id FROM categories WHERE LOWER(NAME) = LOWER(@iSubCat) AND parent_id = @iParentID) THEN
		INSERT INTO categories(NAME,parent_id,image,STATUS) VALUES (@iSubCat,@iParentID,image,1);
		SELECT id INTO @iCatID FROM categories WHERE id= LAST_INSERT_ID();
	END IF;        
	
	SELECT id INTO @iCatID FROM categories WHERE LOWER(NAME) = LOWER(@iSubCat) AND parent_id = @iParentID;
		INSERT INTO products(NAME,description,regular_price,sale_price,category_id,stock,image,product_url,vendor_product_id,vendor_id,parent_id,similar_product_id,STATUS) VALUES (prodName,description,regularPrice,salePrice,@iCatID,stock,image,prodUrl,productID,vendorID,0,similarProductId,1) ON DUPLICATE KEY UPDATE NAME = prodName, description = description, regular_price = regularPrice, sale_price = salePrice, category_id = @iCatID, stock = stock, image = image, product_url = prodUrl, vendor_product_id = productID, vendor_id = vendorID, parent_id = 0, similar_product_id = similarProductId, STATUS = 1;	
	SELECT id INTO @ipdID FROM products WHERE id= LAST_INSERT_ID();
	
	IF NOT EXISTS (SELECT id from deals where end_date = end_date_ts) then			
		SELECT CONCAT('Deal-',id) into @iDealName from deals ORDER by id DESC limit 1;
		INSERT INTO deals(name,image,status,show_homepage,product_ids,start_date,end_date,created_by,modified_by) VALUES (@iDealName,'0','1','1',@ipdID,start_date_ts,end_date_ts,-1,-1);
		SELECT id INTO @iidDeal FROM deals WHERE id= LAST_INSERT_ID();
		insert into deal_detail(deal_id,product_id) values (@iidDeal,@ipdID);
		
	ELSE				
		SELECT product_ids into @iDealID from deals where end_date = end_date_ts;
		#select @iDealID;
		SELECT id into @id_deal from deals where end_date = end_date_ts;
		#SET product_ids1 = Concat(@iDealID,',',@ipdID)
		
		update deals SET product_ids = Concat(@iDealID,',',@ipdID) where end_date = end_date_ts;
		
		SELECT product_ids into @iPRODUCTID from deals where end_date = end_date_ts;
		SELECT id into @id_deal from deals where end_date = end_date_ts;
		#select @iPRODUCTID;
		simple_loop: LOOP	
			SET POSITION = POSITION + 1;
			SET deal_product_id = SPLIT_STR(@iPRODUCTID,",",POSITION);
		
			#select deal_product_id;
			IF deal_product_id = '' THEN
				LEAVE simple_loop;   
			END IF;
			
			
			if not exists(select product_id from deal_detail where product_id=deal_product_id)then
				INSERT IGNORE INTO deal_detail(deal_id,product_id) VALUES (@id_deal,deal_product_id);
			END IF;	
		
		END LOOP simple_loop;		
		
	END IF;	
END */$$
DELIMITER ;

/* Procedure structure for procedure `ImageProcedure` */

/*!50003 DROP PROCEDURE IF EXISTS  `ImageProcedure` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ImageProcedure`(IN productId VARCHAR(50),IN img_200 VARCHAR(400),IN img_400 VARCHAR(400),IN img_800 VARCHAR(400))
BEGIN
DECLARE pId INT DEFAULT 0;

    select id into @pId from products where vendor_product_id = productId;
	
	if not exists(SELECT id from product_image where product_id = @pId and size = "200x200" ) THEN
		INSERT INTO product_image(product_id,image,size) VALUES (@pId,img_200,"200x200");
	ELSE
		update product_image set image = img_200 where product_id = @pId AND size = "200x200";
	END IF;
		
	if not exists(SELECT id from product_image where product_id = @pId and size = "400x400" ) THEN
		INSERT INTO product_image(product_id,image,size) VALUES (@pId,img_400,"400x400");
	ELSE
		update product_image set image = img_400 where product_id = @pId AND size = "400x400";
	END IF;	
	
	if not exists(SELECT id from product_image where product_id = @pId and size = "800x800" ) THEN
		INSERT INTO product_image(product_id,image,size) VALUES (@pId,img_800,"800x800");
	ELSE
		update product_image set image = img_800 where product_id = @pId AND size = "800x800";	
	END IF;	
    
END */$$
DELIMITER ;

/* Procedure structure for procedure `image_keywordsProcedure` */

/*!50003 DROP PROCEDURE IF EXISTS  `image_keywordsProcedure` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `image_keywordsProcedure`(IN product_id VARCHAR(50),IN keywords VARCHAR(400))
BEGIN
DECLARE pId INT DEFAULT 0;
    select id into @pId from products where vendor_product_id = product_id;
    
	INSERT INTO product_image_keywords(product_id,keywords) VALUES (@pId,keywords)ON DUPLICATE KEY UPDATE image_keywords = keywords;
END */$$
DELIMITER ;

/* Procedure structure for procedure `keywordsProcedure` */

/*!50003 DROP PROCEDURE IF EXISTS  `keywordsProcedure` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`iww_db`@`admin-pc` PROCEDURE `keywordsProcedure`(IN product_id VARCHAR(50),IN product_keywords VARCHAR(400))
BEGIN
DECLARE pId INT DEFAULT 0;
	if exists(select id from products where vendor_product_id = product_id)then
		#select id into @pId from products where vendor_product_id = product_id;
		#INSERT INTO product_keywords(product_id,keywords) VALUES (@pId,keywords)ON DUPLICATE KEY UPDATE keywords = keywords;
        update products set keyword = product_keywords where vendor_product_id=product_id;
    end if;
END */$$
DELIMITER ;

/* Procedure structure for procedure `offersInsUpdate` */

/*!50003 DROP PROCEDURE IF EXISTS  `offersInsUpdate` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `offersInsUpdate`(IN offerDetails VARCHAR(500),IN productID VARCHAR(500),IN vendorID VARCHAR(50),OUT insProductID INT)
BEGIN
	DECLARE POSITION INT DEFAULT 0 ;
	DECLARE iPID INT DEFAULT 0;
	DECLARE offer VARCHAR(200);
	
	SELECT id INTO @iPID FROM products WHERE vendor_product_id = productID and vendor_id = vendorID;
	
	simple_loop: LOOP	
			SET POSITION = POSITION + 1;
			SET offer = SPLIT_STR(offerDetails,",",POSITION);
		
			IF offer = '' THEN
				LEAVE simple_loop;   
			END IF;	
			
			insert into product_offers(offer_name,product_id,vendor_id) values (offer,@iPID,vendorID) on duplicate key update offer_name = offer, vendor_id = vendorID;  
	END LOOP simple_loop;				
END */$$
DELIMITER ;

/* Procedure structure for procedure `optionsInsUpdate` */

/*!50003 DROP PROCEDURE IF EXISTS  `optionsInsUpdate` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `optionsInsUpdate`(IN pstrAttrName VARCHAR(200),IN pstrAttrVal VARCHAR(200),IN productID VARCHAR(50),IN vendorID VARCHAR(50), OUT insProductID INT)
BEGIN

	DECLARE iOptionID INT DEFAULT 0;
	DECLARE iOptionValID INT DEFAULT 0;
	DECLARE POSITION INT DEFAULT 0 ;
	DECLARE opt_name VARCHAR(255);
	DECLARE opt_val VARCHAR(255);
	DECLARE pId INT DEFAULT 0;
	    
	SELECT id INTO @pId FROM products WHERE vendor_product_id = productID and vendor_id = vendorID;
    
	simple_loop: LOOP	
		SET POSITION = POSITION + 1;
		SET opt_name = SPLIT_STR(pstrAttrName,"~",POSITION);
		SET opt_val = SPLIT_STR(pstrAttrVal,"~",POSITION);

		IF opt_name = '' THEN
			LEAVE simple_loop;   
		END IF;
	
		SELECT id INTO @iOptionID FROM product_option_group WHERE LOWER(option_name) = LOWER(opt_name) AND STATUS = 1;
    
		IF NOT EXISTS (SELECT id FROM product_option_group WHERE LOWER(option_name) = LOWER(opt_name) AND STATUS = 1 ) THEN
		
			INSERT INTO product_option_group(option_name,STATUS) VALUES (opt_name,1);
			SELECT id INTO @iOptionID FROM product_option_group WHERE id= LAST_INSERT_ID();
		END IF;
		
        
		IF NOT EXISTS (SELECT id FROM product_option_value WHERE LOWER(value) = LOWER(opt_val) AND STATUS = 1 AND group_id = @iOptionID) THEN
		    INSERT INTO product_option_value(group_id,value,STATUS) VALUES (@iOptionID,opt_val,1);
				SELECT id INTO @iOptionValID FROM product_option_group WHERE id= LAST_INSERT_ID();
		END IF;
		
		SELECT id INTO @iOptionValID FROM product_option_value WHERE LOWER(Value) = LOWER(opt_val) AND STATUS = 1 AND group_id = @iOptionID;
				
		IF NOT EXISTS (SELECT id FROM product_options WHERE group_id = @iOptionID AND opt_group_val_id = @iOptionValID AND product_id = @pId) THEN
			INSERT INTO product_options(group_id,opt_group_val_id,product_id) VALUES (@iOptionID,@iOptionValID,@pId);
			SELECT id INTO @insProductID FROM product_options WHERE id= LAST_INSERT_ID();
		END IF;        
    
	 
	END LOOP simple_loop;

END */$$
DELIMITER ;

/* Procedure structure for procedure `productInsUpdate` */

/*!50003 DROP PROCEDURE IF EXISTS  `productInsUpdate` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `productInsUpdate`(IN catName VARCHAR(256),IN subCatName VARCHAR(200),IN child_cat VARCHAR(200),IN prodName VARCHAR(500),IN description TEXT,IN regularPrice FLOAT, IN salePrice FLOAT, IN stock_i VARCHAR(50), IN image VARCHAR(500),IN prodUrl VARCHAR(300),IN productID VARCHAR(500),IN vendorID VARCHAR(50),IN parentId VARCHAR(50),IN similarProductId VARCHAR(500),IN activeID VARCHAR(500), OUT insProductID INT)
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
	
	SELECT id INTO @iParentID FROM categories WHERE LOWER(NAME) = LOWER(catName);
	
	IF NOT EXISTS (SELECT id FROM categories WHERE LOWER(NAME) = LOWER(catName)) THEN
		INSERT INTO categories(NAME,parent_id,image,STATUS) VALUES (catName,0,image,1);
		SELECT id INTO @iParentID FROM categories WHERE id= LAST_INSERT_ID();				
	END IF;	

	SELECT sub_category INTO @iSubCat FROM cat_mapping WHERE LOWER(category) = LOWER(catName) AND LOWER(child) = LOWER(child_cat);		
	SELECT id INTO @iCatID FROM categories WHERE LOWER(NAME) = LOWER(@iSubCat) AND parent_id = @iParentID;
	
	IF (stock_i = 'false')  THEN
		set @iDisplay = 1;
	END IF;
	
	IF NOT EXISTS (SELECT id FROM categories WHERE LOWER(NAME) = LOWER(@iSubCat) AND parent_id = @iParentID) THEN
		INSERT INTO categories(NAME,parent_id,image,STATUS) VALUES (@iSubCat,@iParentID,image,1);
		SELECT id INTO @iCatID FROM categories WHERE id= LAST_INSERT_ID();
	END IF;        
	
	SELECT id INTO @iCatID FROM categories WHERE LOWER(NAME) = LOWER(@iSubCat) AND parent_id = @iParentID;
	
		INSERT INTO products(NAME,description,regular_price,sale_price,category_id,stock,image,product_url,vendor_product_id,vendor_id,do_not_display,parent_id,similar_product_id,STATUS) VALUES (prodName,description,regularPrice,salePrice,@iCatID,stock_i,image,prodUrl,productID,vendorID,@iDisplay,0,similarProductId,1) ON DUPLICATE KEY UPDATE NAME = prodName, description = description, regular_price = regularPrice, sale_price = salePrice, category_id = @iCatID, stock = stock_i, image = image, product_url = prodUrl, vendor_product_id = productID, vendor_id = vendorID, do_not_display = @iDisplay, parent_id = 0, similar_product_id = similarProductId, STATUS = 1;	
	
	/*SELECT id INTO @iPID FROM products WHERE vendor_product_id = productID AND vendor_id = vendorID;
		
		
	IF NOT EXISTS(SELECT id FROM products_family WHERE product_family = @iPID or product_family_id = @iPID)THEN
	
		
		simple_loop: LOOP	
			SET POSITION = POSITION + 1;
			SET variant_product_id = SPLIT_STR(productFamily,",",POSITION);
		
			IF variant_product_id = '' THEN
				LEAVE simple_loop;   
			END IF;			
			
			IF EXISTS(SELECT products_family.id FROM products_family INNER JOIN products ON products.id = products_family.product_family WHERE products.vendor_product_id = productID AND products.vendor_id = vendorID)THEN
				select "LEFT";	
				LEAVE simple_loop;
							
			else			
				select "ENTERED";
				INSERT IGNORE INTO products(NAME,description,regular_price,sale_price,category_id,stock,image,product_url,vendor_product_id,vendor_id,parent_id,similar_product_id,STATUS,do_not_display) VALUES (prodName,description,0.0,0.0,@iCatID,stock_i,"","",variant_product_id,vendorID,0,similarProductId,0,1);
				SELECT id INTO @iVariantID FROM products WHERE vendor_product_id = variant_product_id AND vendor_id = vendorID;				
				INSERT IGNORE INTO products_family(vendor_id,product_family,product_family_id) VALUES (vendorID,@iVariantID,@iPID);				
			END IF;
			
			IF NOT EXISTS(SELECT id FROM products_family WHERE product_family = @iPID)THEN				
				INSERT IGNORE INTO products_family(vendor_id,product_family,product_family_id) VALUES (vendorID,@iPID,@iPID);
			END IF;
			
					
		END LOOP simple_loop;
		SET POSITION = 0;
	END IF;
	
	SELECT product_family INTO @iVariant FROM products_family WHERE product_family_id = @iPID AND product_family = @iPID AND vendor_id = vendorID;
	IF (stock_i = 'false' AND @iVariant = @iPID)  THEN
		select "FALSE";
		UPDATE products SET do_not_display = '1' WHERE vendor_product_id = productID;
		
				SELECT p.id into @iStockTrue  FROM products_family pf LEFT JOIN products p ON p.id = pf.product_family WHERE product_family_id = productID AND product_family != productID AND p.stock != 'false' LIMIT 1;
				
				UPDATE products SET do_not_display = '1' WHERE vendor_product_id = productID;
				UPDATE products SET do_not_display = '0' WHERE vendor_product_id = @iStockTrue;
				UPDATE products_family SET product_family_id = (SELECT id FROM products WHERE vendor_product_id = @iStockTrue AND vendor_id = vendorID) WHERE product_family_id = @iPID;
				
				UPDATE product_attributes SET product_id = (SELECT id FROM products WHERE vendor_product_id = @iStockTrue) WHERE product_id = @iPID;
				
	END IF;	*/
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `spInsUpdateProdAttr` */

/*!50003 DROP PROCEDURE IF EXISTS  `spInsUpdateProdAttr` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsUpdateProdAttr`(IN pstrAttrName VARCHAR(200),IN pstrAttrVal VARCHAR(200),IN productID VARCHAR(50),IN activeID VARCHAR(50),IN vendorID VARCHAR(50),IN prodURL VARCHAR(500),IN stock VARCHAR(50), IN price INT(11), OUT insProductID INT)
BEGIN
	DECLARE iAttrID INT DEFAULT 0;
	DECLARE iAttrValID INT DEFAULT 0;
	DECLARE POSITION INT DEFAULT 0 ;
	DECLARE atr_name VARCHAR(255);
	DECLARE atr_val VARCHAR(255);
	DECLARE pId INT DEFAULT 0;
	DECLARE iPFId INT DEFAULT 0;
	DECLARE clr_code VARCHAR(255);
	
	DECLARE pos INT DEFAULT 0 ;
	DECLARE get_colorname VARCHAR(255);
    
	SELECT id INTO @pId FROM products WHERE vendor_product_id = productID;
    
	simple_loop: LOOP	
		SET POSITION = POSITION + 1;
		SET atr_name = SPLIT_STR(pstrAttrName,"~",POSITION);
		SET atr_val = SPLIT_STR(pstrAttrVal,"~",POSITION);

		IF atr_name = '' THEN
			LEAVE simple_loop;   
		END IF;
	
	SELECT id INTO @iAttrID FROM attributes WHERE LOWER(att_group_name) = LOWER(atr_name) AND STATUS = 1;
    #INSERT INTO log1(QUERY)VALUES('select id into @iAtrId');#For Log 
    IF NOT EXISTS (SELECT id FROM attributes WHERE LOWER(att_group_name) = LOWER(atr_name) AND STATUS = 1 ) THEN
		
        INSERT INTO attributes(att_group_name,STATUS) VALUES (atr_name,1);
		SELECT id INTO @iAttrID FROM attributes WHERE id= LAST_INSERT_ID();
		END IF;
   
   IF atr_name ='color'THEN
   #IF iAttrID =2 THEN
		
		splitcolor_loop: LOOP
			SET pos = pos + 1;	
			SET get_colorname = SPLIT_STR(atr_val,"&",pos); 
			
            SET get_colorname=TRIM(get_colorname);
            
			IF get_colorname= '' THEN
				LEAVE splitcolor_loop;   
			END IF;
            
		IF EXISTS(SELECT id FROM color_code_main WHERE color_name=get_colorname)THEN
            SELECT color_code INTO @clr_code FROM color_code_main WHERE color_name = get_colorname;
        ELSE
			INSERT INTO missing_color(color_name)VALUES(atr_val);
		END IF;
        
        IF NOT EXISTS (SELECT id FROM attributes WHERE LOWER(att_group_name) = LOWER(atr_name) AND STATUS = 1 ) THEN
			INSERT INTO attributes(att_group_name,STATUS) VALUES (atr_name,1);
		SELECT id INTO @iAttrID FROM attributes WHERE id= LAST_INSERT_ID();
		END IF;
        
        IF NOT EXISTS (SELECT id FROM attributes_value WHERE LOWER(att_value) = LOWER(get_colorname) AND STATUS = 1 AND att_group_id = @iAttrID) THEN
            INSERT INTO attributes_value(att_group_id,att_value,STATUS,color_code) VALUES (@iAttrID,get_colorname,1,@clr_code);
			SELECT id INTO @iAttrValID FROM attributes WHERE id= LAST_INSERT_ID();
		END IF;
	
		SELECT id INTO @iAttrValID FROM attributes_value WHERE LOWER(att_value) = LOWER(get_colorname) AND STATUS = 1 AND att_group_id = @iAttrID;
			
		IF NOT EXISTS (SELECT id FROM product_attributes WHERE att_group_id = @iAttrID AND att_group_val_id = @iAttrValID AND original_product_id = @pId  AND STATUS = 1 ) THEN
			SELECT id INTO @iPFId FROM products WHERE vendor_product_id = activeID and do_not_display = 0;
			INSERT INTO product_attributes(att_group_id,att_group_val_id,product_id,STATUS,product_url,original_product_id,stock,price_change) VALUES (@iAttrID,@iAttrValID,@iPFId,1,prodURL,@pId,stock,price);
			SELECT id INTO @insProductID FROM product_attributes WHERE id= LAST_INSERT_ID();
		END IF;        
        
        END LOOP splitcolor_loop;        
    
    
	ELSE
		
        
        IF NOT EXISTS (SELECT id FROM attributes_value WHERE LOWER(att_value) = LOWER(atr_val) AND STATUS = 1 AND att_group_id = @iAttrID) THEN
            INSERT INTO attributes_value(att_group_id,att_value,STATUS,color_code) VALUES (@iAttrID,atr_val,1,atr_val);
			SELECT id INTO @iAttrValID FROM attributes WHERE id= LAST_INSERT_ID();
		END IF;
	
		SELECT id INTO @iAttrValID FROM attributes_value WHERE LOWER(att_value) = LOWER(atr_val) AND STATUS = 1 AND att_group_id = @iAttrID;
			
		IF NOT EXISTS (SELECT id FROM product_attributes WHERE att_group_id = @iAttrID AND att_group_val_id = @iAttrValID AND original_product_id = @pId  AND STATUS = 1 ) THEN
			SELECT id INTO @iPFId FROM products WHERE vendor_product_id = activeID and do_not_display = 0;
			INSERT INTO product_attributes(att_group_id,att_group_val_id,product_id,STATUS,product_url,original_product_id,stock,price_change) VALUES (@iAttrID,@iAttrValID,@iPFId,1,prodURL,@pId,stock,price);
			SELECT id INTO @insProductID FROM product_attributes WHERE id= LAST_INSERT_ID();
		END IF;        
    END IF;
	 
END LOOP simple_loop;
END */$$
DELIMITER ;

/* Procedure structure for procedure `updateAttValue` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateAttValue` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`iww_db`@`admin-pc` PROCEDURE `updateAttValue`()
BEGIN
    DECLARE pos INT DEFAULT 0 ;
	DECLARE get_code VARCHAR(255);
    DECLARE get_name VARCHAR(255);
	

	simple1_loop: LOOP
		SET pos = pos + 1;	
		
        select color_name into get_name from color_code_main where id = pos;    
        
        IF pos = 343 THEN
			LEAVE simple1_loop;   
		END IF;
		
	#select color_code into @get_code from color_code_main where id=@pos;
    
    
    update attributes_value set color_code = (select color_code from color_code_main where color_name= get_name and att_group_id=2)where att_value= get_name AND att_group_id=2;
    
    #SELECT CONCAT_WS('&',get_code);
    END LOOP simple1_loop;
    
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
