-- MySQL dump 10.14  Distrib 5.5.68-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: amacc
-- ------------------------------------------------------
-- Server version	5.5.68-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(50) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_password` tinytext NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'test admin','admin@email.com','$2a$10$.M.GJ5wHg6bALZLh33.6C.lBv4bMKpqYjxGY1npeOTlyIqEazCNMS'),(2,'test admin 2','dwiki@email.com','$2a$10$HwSgR8FyqqTdszq13z830.6.oFJk2tS8xr9uLc68OyZcEP5Xa0KGC');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachments` (
  `attachment_id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_id` int(11) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `attachment_name` varchar(40) NOT NULL,
  `attachment_file` tinyblob NOT NULL,
  PRIMARY KEY (`attachment_id`),
  KEY `bill_id` (`bill_id`),
  KEY `invoice_id` (`invoice_id`),
  CONSTRAINT `attachments_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`bill_id`),
  CONSTRAINT `attachments_ibfk_2` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`invoices_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
INSERT INTO `attachments` VALUES (1,1,NULL,'test foto','ÿØÿà\0JFIF\0,,\0\0ÿáúExif\0\0MM\0*\0\0\0\0;\0\0\0\0\0\0J‡i\0\0\0\0\0\0Zœ\0\0\0\0 \0\0Òê\0\0\0\0\0\0>\0\0\0\0ê\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0');
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bills` (
  `bill_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL,
  `bill_start_date` datetime NOT NULL,
  `bill_due_date` datetime NOT NULL,
  `bill_number` varchar(20) NOT NULL,
  `bill_order_number` varchar(50) DEFAULT NULL,
  `bill_discount` int(5) DEFAULT NULL,
  `bill_total` int(11) NOT NULL,
  `bill_status` tinytext NOT NULL,
  `bill_type` tinytext NOT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (1,1,'2023-02-15 03:57:00','2023-02-16 15:24:59','BILL-0001',NULL,50,35000,'RECIEVED','raw'),(6,1,'2023-02-15 23:41:00','2023-02-16 19:00:00','BILL-0002','string',0,50000,'DRAFT','raw');
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices` (
  `invoices_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL,
  `invoice_start_date` datetime NOT NULL,
  `invoice_due_date` datetime NOT NULL,
  `invoice_number` varchar(20) NOT NULL,
  `invoice_order_number` varchar(50) DEFAULT NULL,
  `invoice_title` varchar(40) DEFAULT NULL,
  `invoice_subheading` varchar(40) DEFAULT NULL,
  `invoice_logo` tinyblob,
  `invoice_status` tinytext NOT NULL,
  `invoice_type` tinytext NOT NULL,
  PRIMARY KEY (`invoices_id`) USING BTREE,
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_purchases`
--

DROP TABLE IF EXISTS `item_purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_purchases` (
  `item_purchase_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `item_purchase_qty` int(11) NOT NULL,
  `item_purchase_time` datetime NOT NULL,
  PRIMARY KEY (`item_purchase_id`),
  KEY `item_id` (`item_id`),
  KEY `bill_id` (`bill_id`),
  CONSTRAINT `bill_id` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`bill_id`),
  CONSTRAINT `item_id` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_purchases`
--

LOCK TABLES `item_purchases` WRITE;
/*!40000 ALTER TABLE `item_purchases` DISABLE KEYS */;
INSERT INTO `item_purchases` VALUES (1,1,1,1,'2023-02-14 20:59:58'),(2,2,1,2,'2023-02-14 20:59:58'),(3,1,6,1,'2023-02-15 16:46:12'),(4,2,6,1,'2023-02-15 16:46:12');
/*!40000 ALTER TABLE `item_purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_sells`
--

DROP TABLE IF EXISTS `item_sells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_sells` (
  `item_sell_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `item_sell_time` datetime NOT NULL,
  PRIMARY KEY (`item_sell_id`) USING BTREE,
  KEY `item_id` (`item_id`),
  KEY `bill_id` (`invoice_id`),
  CONSTRAINT `item_sells_2` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`invoices_id`),
  CONSTRAINT `item_sells_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_sells`
--

LOCK TABLES `item_sells` WRITE;
/*!40000 ALTER TABLE `item_sells` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_sells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(50) NOT NULL,
  `item_description` text,
  `item_purchase_price` int(10) DEFAULT NULL,
  `item_sell_price` int(10) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'masker','test item',30000,NULL),(2,'vitamin a','menyehatkan tubuh',20000,NULL);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(50) NOT NULL,
  `supplier_email` varchar(50) DEFAULT NULL,
  `supplier_telephone` varchar(20) DEFAULT NULL,
  `supplier_web` varchar(30) DEFAULT NULL,
  `supplier_npwp` varchar(16) DEFAULT NULL,
  `supplier_address` text,
  `supplier_type` varchar(20) NOT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'jeremiah','jeremiahmaramis00@gmail.com','123456',NULL,NULL,'kebalen','vendor'),(2,'testSupp','sup@gmail.com','0812',NULL,'12345','kebalen','vendor'),(3,'Hendi','hendi@gmail.com','091283213','www.gg.com','1233456','scbd','vendor'),(4,'Hendi','hendi@gmail.com','091283213','www.gg.com','1233456','scbd','vendor'),(5,'Hendi','hendi@gmail.com','091283213','www.gg.com','1233456','scbd','vendor'),(6,'Hendi','hendi@gmail.com','091283213','www.gg.com','1233456','scbd','vendor'),(7,'Hendi','hendi@gmail.com','091283213','www.gg.com','1233456','scbd','vendor'),(8,'Hendi','hendi@gmail.com','091283213','www.gg.com','1233456','scbd','vendor'),(9,'Hendi','hendi@gmail.com','091283213','www.gg.com','1233456','scbd','vendor'),(10,'Hendi','hendi@gmail.com','123423432','www.emyu.com','123123213','scbd','vendor'),(11,'Hendi','hendi@gmail.com','091283213','www.gg.com','1233456','scbd','vendor'),(12,'Hendi','hendi@gmail.com','123423432','www.emyu.com','123123213','scbd','vendor'),(13,'Hendi','hendi@gmail.com','123423432','www.emyu.com','123123213','scbd','vendor'),(14,'Hendi','hendi@gmail.com','091283213','www.gg.com','1233456','scbd','vendor'),(15,'Hendi','hendi@gmail.com','091283213','www.gg.com','1233456','scbd','vendor'),(16,'Hendi','hendi@gmail.com','091283213','www.gg.com','1233456','scbd','vendor'),(17,'Hendi','hendi@gmail.com','091283213','www.gg.com','1233456','scbd','vendor'),(18,'Hendi','hendi@gmail.com','091283213','www.gg.com','1233456','scbd','vendor'),(19,'Jokowi','jokowi@gmail.com','091283213','www.gg.com','1233456','scbd','vendor'),(20,'PT.maju','maju@mundur.com','091283213','www.gg.com','1233456','scbd','vendor');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_supplier_bills`
--

DROP TABLE IF EXISTS `v_supplier_bills`;
/*!50001 DROP VIEW IF EXISTS `v_supplier_bills`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_supplier_bills` (
  `bill_id` tinyint NOT NULL,
  `supplier_id` tinyint NOT NULL,
  `bill_start_date` tinyint NOT NULL,
  `bill_due_date` tinyint NOT NULL,
  `bill_number` tinyint NOT NULL,
  `bill_order_number` tinyint NOT NULL,
  `bill_discount` tinyint NOT NULL,
  `bill_status` tinyint NOT NULL,
  `bill_type` tinyint NOT NULL,
  `supplier_name` tinyint NOT NULL,
  `supplier_type` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_supplier_bills`
--

/*!50001 DROP TABLE IF EXISTS `v_supplier_bills`*/;
/*!50001 DROP VIEW IF EXISTS `v_supplier_bills`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_supplier_bills` AS select `bills`.`bill_id` AS `bill_id`,`bills`.`supplier_id` AS `supplier_id`,`bills`.`bill_start_date` AS `bill_start_date`,`bills`.`bill_due_date` AS `bill_due_date`,`bills`.`bill_number` AS `bill_number`,`bills`.`bill_order_number` AS `bill_order_number`,`bills`.`bill_discount` AS `bill_discount`,`bills`.`bill_status` AS `bill_status`,`bills`.`bill_type` AS `bill_type`,`suppliers`.`supplier_name` AS `supplier_name`,`suppliers`.`supplier_type` AS `supplier_type` from (`suppliers` join `bills` on((`suppliers`.`supplier_id` = `bills`.`supplier_id`))) where (`suppliers`.`supplier_type` = 'vendor') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-18 23:23:30
