-- MySQL dump 10.13  Distrib 5.7.11, for osx10.11 (x86_64)
--
-- Host: localhost    Database: development
-- ------------------------------------------------------
-- Server version	5.7.11

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
-- Table structure for table `client_versions`
--

DROP TABLE IF EXISTS `client_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_client_versions_on_client_id` (`client_id`),
  KEY `index_description` (`description`),
  CONSTRAINT `fk_rails_b76cc0c01f` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_versions`
--

LOCK TABLES `client_versions` WRITE;
/*!40000 ALTER TABLE `client_versions` DISABLE KEYS */;
INSERT INTO `client_versions` VALUES (1,1,'2016-03-03 23:27:00','2016-03-03 23:27:00','default'),(13,2,'2016-03-09 10:54:51','2016-03-09 10:54:51','default'),(14,3,'2016-03-09 14:20:39','2016-03-09 14:20:39','default'),(15,2,'2016-03-09 20:12:51','2016-03-09 20:12:51','test version');
/*!40000 ALTER TABLE `client_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `base_url` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'welcome','localhost','2016-03-03 23:18:00','2016-03-03 23:18:00'),(2,'abc','bookkeepfinder.com','2016-03-09 10:27:06','2016-03-09 10:27:06'),(3,'def','def.com','2016-03-09 14:20:28','2016-03-09 14:20:28');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitor_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `event_type` varchar(45) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,25,'2016-03-06 13:05:42','2016-03-06 13:05:42',NULL,NULL),(2,25,'2016-03-06 13:14:44','2016-03-06 13:14:44',NULL,NULL),(3,25,'2016-03-06 13:15:39','2016-03-06 13:15:39',NULL,NULL),(4,25,'2016-03-06 13:17:53','2016-03-06 13:17:53',NULL,NULL),(5,25,'2016-03-06 13:18:41','2016-03-06 13:18:41',NULL,NULL),(6,25,'2016-03-06 13:21:16','2016-03-06 13:21:16',NULL,NULL),(7,26,'2016-03-06 21:23:58','2016-03-06 21:23:58',NULL,NULL),(8,27,'2016-03-07 04:00:29','2016-03-07 04:00:29',NULL,NULL),(9,27,'2016-03-07 04:06:22','2016-03-07 04:06:22',NULL,NULL),(10,19,'2016-03-11 01:34:50','2016-03-11 01:34:50',NULL,NULL),(11,21,'2016-03-11 10:14:45','2016-03-11 10:14:45',NULL,NULL),(12,21,'2016-03-11 10:16:15','2016-03-11 10:16:15',NULL,NULL),(13,21,'2016-03-11 10:17:04','2016-03-11 10:17:04',NULL,NULL),(14,21,'2016-03-11 10:22:14','2016-03-11 10:22:14',NULL,NULL),(15,21,'2016-03-11 10:52:31','2016-03-11 10:52:31',NULL,NULL),(16,21,'2016-03-11 10:52:36','2016-03-11 10:52:36',NULL,NULL),(17,21,'2016-03-11 10:52:50','2016-03-11 10:52:50',NULL,NULL),(18,21,'2016-03-11 10:55:41','2016-03-11 10:55:41',NULL,NULL),(19,23,'2016-03-12 14:10:29','2016-03-12 14:10:29',NULL,NULL),(20,23,'2016-03-12 14:19:28','2016-03-12 14:19:28',NULL,NULL),(21,23,'2016-03-12 14:19:42','2016-03-12 14:19:42',NULL,NULL),(22,23,'2016-03-12 14:19:46','2016-03-12 14:19:46',NULL,NULL),(23,23,'2016-03-12 14:19:49','2016-03-12 14:19:49',NULL,NULL),(24,23,'2016-03-12 14:20:08','2016-03-12 14:20:08',NULL,NULL),(25,23,'2016-03-12 14:20:09','2016-03-12 14:20:09',NULL,NULL),(26,23,'2016-03-12 14:20:09','2016-03-12 14:20:09',NULL,NULL),(27,23,'2016-03-12 14:20:10','2016-03-12 14:20:10',NULL,NULL),(28,23,'2016-03-12 14:20:10','2016-03-12 14:20:10',NULL,NULL),(29,23,'2016-03-12 14:20:11','2016-03-12 14:20:11',NULL,NULL),(30,23,'2016-03-12 14:20:11','2016-03-12 14:20:11',NULL,NULL),(31,23,'2016-03-12 14:20:12','2016-03-12 14:20:12',NULL,NULL),(32,23,'2016-03-12 14:20:12','2016-03-12 14:20:12',NULL,NULL),(33,23,'2016-03-12 14:20:13','2016-03-12 14:20:13',NULL,NULL),(34,23,'2016-03-12 14:20:13','2016-03-12 14:20:13',NULL,NULL),(35,23,'2016-03-12 14:20:14','2016-03-12 14:20:14',NULL,NULL),(36,23,'2016-03-12 14:25:42','2016-03-12 14:25:42',NULL,NULL),(37,23,'2016-03-12 14:28:54','2016-03-12 14:28:54',NULL,NULL),(38,23,'2016-03-12 14:29:00','2016-03-12 14:29:00',NULL,NULL),(39,23,'2016-03-12 14:31:56','2016-03-12 14:31:56',NULL,NULL),(40,23,'2016-03-12 14:32:11','2016-03-12 14:32:11',NULL,NULL),(41,23,'2016-03-12 14:32:12','2016-03-12 14:32:12',NULL,NULL),(42,23,'2016-03-12 14:32:13','2016-03-12 14:32:13',NULL,NULL),(43,23,'2016-03-12 14:32:14','2016-03-12 14:32:14',NULL,NULL),(44,23,'2016-03-12 14:32:14','2016-03-12 14:32:14',NULL,NULL),(45,23,'2016-03-12 14:32:52','2016-03-12 14:32:52',NULL,NULL),(46,23,'2016-03-12 14:32:53','2016-03-12 14:32:53',NULL,NULL),(47,23,'2016-03-12 14:32:53','2016-03-12 14:32:53',NULL,NULL),(48,23,'2016-03-12 14:32:54','2016-03-12 14:32:54',NULL,NULL),(49,23,'2016-03-12 14:32:54','2016-03-12 14:32:54',NULL,NULL),(50,23,'2016-03-12 14:33:56','2016-03-12 14:33:56',NULL,NULL),(51,23,'2016-03-12 14:33:56','2016-03-12 14:33:56',NULL,NULL),(52,23,'2016-03-12 14:33:57','2016-03-12 14:33:57',NULL,NULL),(53,23,'2016-03-12 14:33:57','2016-03-12 14:33:57',NULL,NULL),(54,23,'2016-03-12 14:33:58','2016-03-12 14:33:58',NULL,NULL),(55,23,'2016-03-12 14:33:58','2016-03-12 14:33:58',NULL,NULL),(56,23,'2016-03-12 14:33:59','2016-03-12 14:33:59',NULL,NULL),(57,23,'2016-03-12 14:33:59','2016-03-12 14:33:59',NULL,NULL),(58,23,'2016-03-12 14:34:00','2016-03-12 14:34:00',NULL,NULL),(59,23,'2016-03-12 14:34:47','2016-03-12 14:34:47',NULL,NULL),(60,23,'2016-03-12 14:34:48','2016-03-12 14:34:48',NULL,NULL),(61,23,'2016-03-12 14:34:48','2016-03-12 14:34:48',NULL,NULL),(62,23,'2016-03-12 14:34:49','2016-03-12 14:34:49',NULL,NULL),(63,23,'2016-03-12 14:34:49','2016-03-12 14:34:49',NULL,NULL),(64,23,'2016-03-12 14:34:50','2016-03-12 14:34:50',NULL,NULL),(65,23,'2016-03-12 14:34:50','2016-03-12 14:34:50',NULL,NULL),(66,23,'2016-03-12 14:34:51','2016-03-12 14:34:51',NULL,NULL),(67,23,'2016-03-12 14:35:33','2016-03-12 14:35:33',NULL,NULL),(68,23,'2016-03-12 14:35:44','2016-03-12 14:35:44',NULL,NULL),(69,23,'2016-03-12 14:35:54','2016-03-12 14:35:54',NULL,NULL),(70,23,'2016-03-12 14:42:11','2016-03-12 14:42:11',NULL,NULL),(71,23,'2016-03-12 14:42:19','2016-03-12 14:42:19',NULL,NULL),(72,23,'2016-03-12 14:50:59','2016-03-12 14:50:59',NULL,NULL),(73,23,'2016-03-12 14:53:02','2016-03-12 14:53:02',NULL,NULL),(74,23,'2016-03-12 14:53:04','2016-03-12 14:53:04',NULL,NULL),(75,23,'2016-03-12 14:53:30','2016-03-12 14:53:30',NULL,NULL),(76,23,'2016-03-12 14:54:09','2016-03-12 14:54:09',NULL,NULL),(77,23,'2016-03-12 14:54:36','2016-03-12 14:54:36',NULL,NULL),(78,23,'2016-03-12 14:54:44','2016-03-12 14:54:44',NULL,NULL),(79,23,'2016-03-12 14:54:55','2016-03-12 14:54:55',NULL,NULL),(80,23,'2016-03-12 14:54:56','2016-03-12 14:54:56',NULL,NULL),(81,23,'2016-03-12 14:54:56','2016-03-12 14:54:56',NULL,NULL),(82,23,'2016-03-12 14:54:57','2016-03-12 14:54:57',NULL,NULL),(83,23,'2016-03-12 14:54:57','2016-03-12 14:54:57',NULL,NULL),(84,23,'2016-03-12 14:54:58','2016-03-12 14:54:58',NULL,NULL),(85,23,'2016-03-12 14:54:59','2016-03-12 14:54:59',NULL,NULL),(86,23,'2016-03-12 14:54:59','2016-03-12 14:54:59',NULL,NULL),(87,23,'2016-03-12 14:55:00','2016-03-12 14:55:00',NULL,NULL),(88,23,'2016-03-12 14:55:00','2016-03-12 14:55:00',NULL,NULL),(89,23,'2016-03-12 15:08:12','2016-03-12 15:08:12',NULL,NULL),(90,24,'2016-03-13 16:11:35','2016-03-13 16:11:35',NULL,NULL),(91,25,'2016-03-13 22:55:48','2016-03-13 22:55:48',NULL,NULL),(92,25,'2016-03-13 22:55:49','2016-03-13 22:55:49',NULL,NULL),(93,25,'2016-03-13 22:55:50','2016-03-13 22:55:50',NULL,NULL),(94,25,'2016-03-13 22:55:52','2016-03-13 22:55:52',NULL,NULL),(95,25,'2016-03-13 22:55:53','2016-03-13 22:55:53',NULL,NULL),(96,25,'2016-03-13 22:55:54','2016-03-13 22:55:54',NULL,NULL),(97,30,'2016-03-16 11:33:33','2016-03-16 11:33:33',NULL,NULL),(98,30,'2016-03-16 11:36:41','2016-03-16 11:36:41',NULL,NULL),(99,31,'2016-03-16 23:38:25','2016-03-16 23:38:25',NULL,NULL),(100,31,'2016-03-16 23:51:08','2016-03-16 23:51:08',NULL,NULL),(101,32,'2016-03-18 00:58:48','2016-03-18 00:58:48',NULL,NULL),(102,33,'2016-03-18 10:46:25','2016-03-18 10:46:25',NULL,NULL),(103,34,'2016-03-18 23:47:24','2016-03-18 23:47:24',NULL,NULL),(104,34,'2016-03-18 23:47:29','2016-03-18 23:47:29',NULL,NULL),(105,34,'2016-03-18 23:53:11','2016-03-18 23:53:11',NULL,NULL),(106,34,'2016-03-19 00:03:28','2016-03-19 00:03:28',NULL,NULL),(107,34,'2016-03-19 00:06:50','2016-03-19 00:06:50',NULL,NULL),(108,35,'2016-03-19 10:09:08','2016-03-19 10:09:08',NULL,NULL),(109,35,'2016-03-19 10:52:53','2016-03-19 10:52:53',NULL,NULL),(110,37,'2016-03-21 21:40:35','2016-03-21 21:40:35',NULL,NULL),(111,37,'2016-03-21 21:44:17','2016-03-21 21:44:17',NULL,NULL),(112,37,'2016-03-21 21:45:37','2016-03-21 21:45:37',NULL,NULL),(113,37,'2016-03-21 21:46:14','2016-03-21 21:46:14',NULL,NULL),(114,37,'2016-03-21 21:46:18','2016-03-21 21:46:18',NULL,NULL),(115,37,'2016-03-21 21:46:22','2016-03-21 21:46:22',NULL,NULL),(116,37,'2016-03-21 21:47:06','2016-03-21 21:47:06',NULL,NULL),(117,37,'2016-03-21 21:49:19','2016-03-21 21:49:19',NULL,NULL),(118,37,'2016-03-21 21:49:20','2016-03-21 21:49:20',NULL,NULL),(119,38,'2016-03-22 19:10:58','2016-03-22 19:10:58',NULL,NULL),(120,39,'2016-03-23 02:00:21','2016-03-23 02:00:21',NULL,NULL),(121,40,'2016-03-23 13:53:36','2016-03-23 13:53:36',NULL,NULL),(122,42,'2016-03-23 19:23:20','2016-03-23 19:23:20',NULL,NULL),(123,47,'2016-03-24 11:30:05','2016-03-24 11:30:05',NULL,NULL),(124,47,'2016-03-24 11:32:46','2016-03-24 11:32:46',NULL,NULL),(125,47,'2016-03-24 11:44:25','2016-03-24 11:44:25',NULL,'{\"primary_accounting_needs\"=>\"Managing accounts receivable and payable\"}'),(126,47,'2016-03-24 11:46:07','2016-03-24 11:46:07',NULL,'{\"current_accounting_software\"=>\"Xero\"}'),(127,47,'2016-03-24 11:47:34','2016-03-24 11:47:34',NULL,'{\"current_accounting_software\"=>\"NolaPro\"}'),(128,47,'2016-03-24 11:49:25','2016-03-24 11:49:25',NULL,'{\"current_accounting_software\"=>\"Xero\"}'),(129,47,'2016-03-24 11:49:56','2016-03-24 11:49:56','event','{\"current_accounting_software\"=>\"Sage\"}'),(130,48,'2016-03-24 23:27:43','2016-03-24 23:27:43','event','{\"state\"=>\"Should not be here\"}'),(131,48,'2016-03-24 23:30:05','2016-03-24 23:30:05','event','{\"frequency_help_needed\"=>\"Monthly\"}'),(132,49,'2016-03-24 23:48:41','2016-03-24 23:48:41','event','{\"email\"=>\"eberjan@gmail.com\"}'),(133,49,'2016-03-24 23:48:56','2016-03-24 23:48:56','event','{\"zipcode\"=>\"07002\"}'),(134,49,'2016-03-24 23:49:07','2016-03-24 23:49:07','submit','{\"email\"=>\"eberjan@gmail.com\", \"zipcode\"=>\"07002\"}'),(135,49,'2016-03-24 23:55:31','2016-03-24 23:55:31','event','{\"email\"=>\"eberjan@gmail.com\"}'),(136,49,'2016-03-24 23:55:41','2016-03-24 23:55:41','event','{\"zipcode\"=>\"07002\"}'),(137,49,'2016-03-24 23:57:11','2016-03-24 23:57:11','submit','{\"email\"=>\"eberjan@gmail.com\", \"zipcode\"=>\"07002\"}'),(138,49,'2016-03-25 00:02:01','2016-03-25 00:02:01','submit','{\"email\"=>\"eberjan@gmail.com\", \"zipcode\"=>\"07002\"}'),(139,49,'2016-03-25 00:06:29','2016-03-25 00:06:29','event','{\"email\"=>\"eberjan@gmail.com\"}'),(140,49,'2016-03-25 00:13:59','2016-03-25 00:13:59','submit','{\"email\"=>\"eberjan@gmail.com\", \"zipcode\"=>\"07002\"}'),(141,49,'2016-03-25 00:16:20','2016-03-25 00:16:20','event','{\"email\"=>\"eberjan@gmail.com\"}'),(142,49,'2016-03-25 00:16:26','2016-03-25 00:16:26','event','{\"zipcode\"=>\"07002\"}'),(143,49,'2016-03-25 00:16:28','2016-03-25 00:16:28','submit','{\"email\"=>\"eberjan@gmail.com\", \"zipcode\"=>\"07002\"}'),(144,49,'2016-03-25 00:18:54','2016-03-25 00:18:54','event','{\"email\"=>\"eberjan@gmail.com\"}'),(145,49,'2016-03-25 00:18:59','2016-03-25 00:18:59','event','{\"zipcode\"=>\"07002\"}'),(146,49,'2016-03-25 00:19:00','2016-03-25 00:19:00','submit','{\"email\"=>\"eberjan@gmail.com\", \"zipcode\"=>\"07002\"}'),(147,49,'2016-03-25 00:24:24','2016-03-25 00:24:24','event','{\"email\"=>\"eberjan@gmail.com\"}'),(148,49,'2016-03-25 00:24:29','2016-03-25 00:24:29','event','{\"zipcode\"=>\"07002\"}'),(149,49,'2016-03-25 00:24:42','2016-03-25 00:24:42','submit','{\"email\"=>\"eberjan@gmail.com\", \"zipcode\"=>\"07002\"}'),(150,49,'2016-03-25 00:34:48','2016-03-25 00:34:48','submit','{\"email\"=>\"\", \"zipcode\"=>\"\"}'),(151,49,'2016-03-25 00:52:51','2016-03-25 00:52:51','event','{\"email\"=>\"eberjan@gmail.com\"}'),(152,49,'2016-03-25 00:52:53','2016-03-25 00:52:53','event','{\"zipcode\"=>\"07002\"}'),(153,49,'2016-03-25 00:53:18','2016-03-25 00:53:18','submit','{\"email\"=>\"eberjan@gmail.com\", \"zipcode\"=>\"07002\"}'),(154,49,'2016-03-25 00:53:27','2016-03-25 00:53:27','submit','{\"email\"=>\"eberjan@gmail.com\", \"zipcode\"=>\"07002\"}'),(155,49,'2016-03-25 00:56:26','2016-03-25 00:56:26','submit','{\"email\"=>\"\", \"zipcode\"=>\"\"}'),(156,49,'2016-03-25 00:56:59','2016-03-25 00:56:59','submit','{\"email\"=>\"\", \"zipcode\"=>\"\"}'),(157,49,'2016-03-25 01:13:51','2016-03-25 01:13:51','submit','{\"email\"=>\"\", \"zipcode\"=>\"\"}'),(158,49,'2016-03-25 01:32:46','2016-03-25 01:32:46','submit',NULL),(159,50,'2016-03-25 07:38:47','2016-03-25 07:38:47','submit',NULL),(160,50,'2016-03-25 07:45:02','2016-03-25 07:45:02','submit',NULL),(161,50,'2016-03-25 07:45:05','2016-03-25 07:45:05','submit',NULL),(162,50,'2016-03-25 07:45:54','2016-03-25 07:45:54','submit',NULL),(163,50,'2016-03-25 07:47:13','2016-03-25 07:47:13','submit',NULL),(164,50,'2016-03-25 07:47:15','2016-03-25 07:47:15','submit',NULL),(165,50,'2016-03-25 07:51:37','2016-03-25 07:51:37','submit',NULL);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_field_groups`
--

DROP TABLE IF EXISTS `form_field_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_field_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_field_groups`
--

LOCK TABLES `form_field_groups` WRITE;
/*!40000 ALTER TABLE `form_field_groups` DISABLE KEYS */;
INSERT INTO `form_field_groups` VALUES (1,NULL),(2,NULL);
/*!40000 ALTER TABLE `form_field_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_field_memberships`
--

DROP TABLE IF EXISTS `form_field_memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_field_memberships` (
  `form_field_group_id` int(11) NOT NULL,
  `form_field_id` int(11) DEFAULT NULL,
  `field_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_field_memberships`
--

LOCK TABLES `form_field_memberships` WRITE;
/*!40000 ALTER TABLE `form_field_memberships` DISABLE KEYS */;
INSERT INTO `form_field_memberships` VALUES (1,1,1),(1,2,3),(1,3,2),(1,4,4),(1,5,5),(1,6,6),(1,7,7),(1,8,8),(1,9,9),(1,10,10),(2,11,1),(2,12,2);
/*!40000 ALTER TABLE `form_field_memberships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_fields`
--

DROP TABLE IF EXISTS `form_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `html_type` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `placeholder` varchar(45) DEFAULT NULL,
  `default_value` varchar(45) DEFAULT NULL,
  `options_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_fields`
--

LOCK TABLES `form_fields` WRITE;
/*!40000 ALTER TABLE `form_fields` DISABLE KEYS */;
INSERT INTO `form_fields` VALUES (1,NULL,'text','firstname','First Name','First Name',NULL,NULL),(2,NULL,'select','state','State',NULL,'Please Select',1),(3,NULL,'text','lastname','Last Name','Last Name',NULL,NULL),(4,'What are your primary accounting needs?','select','primary_accounting_needs','What are your primary accounting needs?',NULL,NULL,2),(5,'What accounting software do you currently use?','select','current_accounting_software','What accounting software do you currently use?',NULL,NULL,3),(6,'Who is the accounting service for?','select','tax_classification','Who is the accounting service for?',NULL,NULL,4),(7,'What industry are you in?','multi_select','industry','What industry are you in?',NULL,NULL,5),(8,'How often do you need help?','select','frequency_help_needed','How often do you need help?',NULL,NULL,6),(9,'What is your annual company or personal income?','select','annual_income','What is your annual company or personal income?',NULL,NULL,7),(10,'How many employees do you have?','select','num_of_employees','How many employees do you have?',NULL,NULL,8),(11,NULL,'text','email','Email','Email',NULL,NULL),(12,NULL,'text','zipcode','ZipCode','ZipCode',NULL,NULL);
/*!40000 ALTER TABLE `form_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_submissions`
--

DROP TABLE IF EXISTS `form_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_submissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitor_id` int(11) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_submissions`
--

LOCK TABLES `form_submissions` WRITE;
/*!40000 ALTER TABLE `form_submissions` DISABLE KEYS */;
INSERT INTO `form_submissions` VALUES (1,37,'{\"lastname\"=>\"purugganan\", \"type\"=>\"event\", \"controller\"=>\"abc\", \"action\"=>\"index\", \"format\"=>\"json\"}'),(2,37,'{\"firstname\"=>\"eberjan\", \"lastname\"=>\"purugganan\", \"state\"=>\"Should not be here\", \"primary_accounting_needs\"=>\"Balancing books\", \"current_accounting_software\"=>\"Quickbooks\", \"tax_classification\"=>\"Individual or sole proprietorship\", \"industry\"=>\"Healthcare\", \"frequency_help_needed\"=>\"One-time\", \"annual_income\"=>\"Less than $100K\", \"num_of_employees\"=>\"No employees\", \"type\"=>\"submit\", \"controller\"=>\"abc\", \"action\"=>\"index\", \"format\"=>\"json\"}'),(3,37,'{\"firstname\"=>\"eberjan\", \"lastname\"=>\"purugganan\", \"state\"=>\"Should not be here\", \"primary_accounting_needs\"=>\"Balancing books\", \"current_accounting_software\"=>\"Quickbooks\", \"tax_classification\"=>\"Individual or sole proprietorship\", \"industry\"=>\"Healthcare\", \"frequency_help_needed\"=>\"One-time\", \"annual_income\"=>\"Less than $100K\", \"num_of_employees\"=>\"No employees\", \"type\"=>\"submit\", \"controller\"=>\"abc\", \"action\"=>\"index\", \"format\"=>\"json\"}'),(4,37,'{\"firstname\"=>\"eberjan\", \"lastname\"=>\"purugganan\", \"state\"=>\"Should not be here\", \"primary_accounting_needs\"=>\"Balancing books\", \"current_accounting_software\"=>\"Quickbooks\", \"tax_classification\"=>\"Individual or sole proprietorship\", \"industry\"=>\"Education\", \"frequency_help_needed\"=>\"One-time\", \"annual_income\"=>\"Less than $100K\", \"num_of_employees\"=>\"No employees\", \"type\"=>\"submit\", \"controller\"=>\"abc\", \"action\"=>\"index\", \"format\"=>\"json\"}'),(5,38,'{\"firstname\"=>\"\", \"lastname\"=>\"\", \"state\"=>\"Pennsylvania\", \"primary_accounting_needs\"=>\"Balancing books\", \"current_accounting_software\"=>\"Quickbooks\", \"tax_classification\"=>\"Individual or sole proprietorship\", \"industry\"=>\"Healthcare\", \"frequency_help_needed\"=>\"One-time\", \"annual_income\"=>\"Less than $100K\", \"num_of_employees\"=>\"No employees\", \"type\"=>\"submit\", \"controller\"=>\"abc\", \"action\"=>\"index\", \"format\"=>\"json\"}'),(6,39,'{\"firstname\"=>\"\", \"lastname\"=>\"\", \"state\"=>\"Pennsylvania\", \"primary_accounting_needs\"=>\"Balancing books\", \"current_accounting_software\"=>\"Quickbooks\", \"tax_classification\"=>\"Individual or sole proprietorship\", \"industry\"=>\"Healthcare\", \"frequency_help_needed\"=>\"One-time\", \"annual_income\"=>\"Less than $100K\", \"num_of_employees\"=>\"No employees\", \"radio1\"=>\"on\", \"radio2\"=>\"on\", \"radio3\"=>\"on\", \"type\"=>\"submit\", \"controller\"=>\"abc\", \"action\"=>\"index\", \"format\"=>\"json\"}'),(7,42,'{\"firstname\"=>\"\", \"lastname\"=>\"\", \"state\"=>\"Pennsylvania\", \"primary_accounting_needs\"=>\"Balancing books\", \"current_accounting_software\"=>\"Quickbooks\", \"tax_classification\"=>\"Individual or sole proprietorship\", \"industry\"=>\"Healthcare\", \"radio0\"=>\"541613:Marketing Consulting Services\", \"radio1\"=>\"541910:Marketing Research and Public Opinion Polling\", \"radio2\"=>\"926140:Regulation of Agricultural Marketing and Commodities\", \"radio3\"=>\"522294:Secondary Market Financing\", \"radio4\"=>\"541990:All Other Professional, Scientific, and Technical Services\", \"radio5\"=>\"423120:Motor Vehicle Supplies and New Parts Merchant Wholesalers\", \"radio6\"=>\"54191:Marketing Research and Public Opinion Polling\", \"radio7\"=>\"92614:Regulation of Agricultural Marketing and Commodities\", \"radio8\"=>\"315280:Other Cut and Sew Apparel Manufacturing\", \"radio9\"=>\"561591:Convention and Visitors Bureaus\", \"radio10\"=>\"315990:Apparel Accessories and Other Apparel Manufacturing\", \"radio11\"=>\"511130:Book Publishers\", \"radio12\"=>\"54161:Management Consulting Services\", \"radio13\"=>\"541611:Administrative Management and General Management Consulting Services\", \"radio14\"=>\"115310:Support Activities for Forestry\", \"radio15\"=>\"315220:Men\'s and Boys\' Cut and Sew Apparel Manufacturing\", \"radio16\"=>\"315240:Women\'s, Girls\', and Infants\' Cut and Sew Apparel Manufacturing\", \"radio17\"=>\"532:Rental and Leasing Services\", \"radio18\"=>\"42:Wholesale Trade\", \"frequency_help_needed\"=>\"One-time\", \"annual_income\"=>\"Less than $100K\", \"num_of_employees\"=>\"No employees\", \"type\"=>\"submit\", \"controller\"=>\"abc\", \"action\"=>\"index\", \"format\"=>\"json\"}'),(8,49,'{\"email\"=>\"eberjan@gmail.com\", \"zipcode\"=>\"07002\", \"type\"=>\"submit\", \"controller\"=>\"abc\", \"action\"=>\"index\", \"format\"=>\"json\"}'),(9,49,'{\"email\"=>\"eberjan@gmail.com\", \"zipcode\"=>\"07002\", \"type\"=>\"submit\", \"controller\"=>\"abc\", \"action\"=>\"index\", \"format\"=>\"json\"}'),(10,49,'{\"email\"=>\"eberjan@gmail.com\", \"zipcode\"=>\"07002\", \"type\"=>\"submit\", \"controller\"=>\"abc\", \"action\"=>\"index\", \"format\"=>\"json\"}'),(11,49,'{\"email\"=>\"eberjan@gmail.com\", \"zipcode\"=>\"07002\", \"type\"=>\"submit\", \"controller\"=>\"abc\", \"action\"=>\"index\", \"format\"=>\"json\"}'),(12,49,'{\"email\"=>\"eberjan@gmail.com\", \"zipcode\"=>\"07002\", \"type\"=>\"submit\", \"controller\"=>\"abc\", \"action\"=>\"index\", \"format\"=>\"json\"}'),(13,49,'{\"email\"=>\"eberjan@gmail.com\", \"zipcode\"=>\"07002\", \"type\"=>\"submit\", \"controller\"=>\"abc\", \"action\"=>\"index\", \"format\"=>\"json\"}'),(14,49,'{\"email\"=>\"eberjan@gmail.com\", \"zipcode\"=>\"07002\", \"type\"=>\"submit\", \"controller\"=>\"abc\", \"action\"=>\"index\", \"format\"=>\"json\"}'),(15,49,'{\"email\"=>\"\", \"zipcode\"=>\"\", \"type\"=>\"submit\", \"controller\"=>\"abc\", \"action\"=>\"index\", \"format\"=>\"json\"}'),(16,49,'{\"email\"=>\"eberjan@gmail.com\", \"zipcode\"=>\"07002\", \"type\"=>\"submit\", \"controller\"=>\"abc\", \"action\"=>\"index\", \"format\"=>\"json\"}'),(17,49,'{\"email\"=>\"eberjan@gmail.com\", \"zipcode\"=>\"07002\", \"type\"=>\"submit\", \"controller\"=>\"abc\", \"action\"=>\"index\", \"format\"=>\"json\"}'),(18,49,'{\"email\"=>\"eberjan@gmail.com\", \"zipcode\"=>\"07002\", \"type\"=>\"submit\", \"controller\"=>\"abc\", \"action\"=>\"index\", \"format\"=>\"json\"}'),(19,49,'{\"email\"=>\"\", \"zipcode\"=>\"\", \"type\"=>\"submit\", \"controller\"=>\"abc\", \"action\"=>\"index\", \"format\"=>\"json\"}'),(20,49,'{\"email\"=>\"\", \"zipcode\"=>\"\", \"type\"=>\"submit\", \"controller\"=>\"abc\", \"action\"=>\"index\", \"format\"=>\"json\"}'),(21,49,'{\"email\"=>\"\", \"zipcode\"=>\"\", \"type\"=>\"submit\", \"controller\"=>\"abc\", \"action\"=>\"index\", \"format\"=>\"json\"}'),(22,49,'{\"firstname\"=>\"\", \"lastname\"=>\"\", \"state\"=>\"Pennsylvania\", \"primary_accounting_needs\"=>\"Balancing books\", \"current_accounting_software\"=>\"Quickbooks\", \"tax_classification\"=>\"Individual or sole proprietorship\", \"industry\"=>\"Healthcare\", \"frequency_help_needed\"=>\"One-time\", \"annual_income\"=>\"Less than $100K\", \"num_of_employees\"=>\"No employees\", \"type\"=>\"submit\", \"controller\"=>\"abc\", \"action\"=>\"form\", \"format\"=>\"json\"}'),(23,49,'{\"firstname\"=>\"\", \"lastname\"=>\"\", \"state\"=>\"Pennsylvania\", \"primary_accounting_needs\"=>\"Balancing books\", \"current_accounting_software\"=>\"Quickbooks\", \"tax_classification\"=>\"Individual or sole proprietorship\", \"industry\"=>\"Healthcare\", \"frequency_help_needed\"=>\"One-time\", \"annual_income\"=>\"Less than $100K\", \"num_of_employees\"=>\"No employees\", \"type\"=>\"submit\", \"controller\"=>\"abc\", \"action\"=>\"form\", \"format\"=>\"json\"}'),(24,50,'{\"email\"=>\"\", \"zipcode\"=>\"\", \"type\"=>\"submit\", \"controller\"=>\"abc\", \"action\"=>\"index\", \"format\"=>\"json\"}'),(25,50,'{\"email\"=>\"\", \"zipcode\"=>\"\", \"type\"=>\"submit\", \"controller\"=>\"abc\", \"action\"=>\"index\", \"format\"=>\"json\"}'),(26,50,'{\"firstname\"=>\"\", \"lastname\"=>\"\", \"state\"=>\"Pennsylvania\", \"primary_accounting_needs\"=>\"Balancing books\", \"current_accounting_software\"=>\"Quickbooks\", \"tax_classification\"=>\"Individual or sole proprietorship\", \"industry\"=>\"Healthcare\", \"frequency_help_needed\"=>\"One-time\", \"annual_income\"=>\"Less than $100K\", \"num_of_employees\"=>\"No employees\", \"type\"=>\"submit\", \"controller\"=>\"abc\", \"action\"=>\"form\", \"format\"=>\"json\"}'),(27,50,'{\"firstname\"=>\"\", \"lastname\"=>\"\", \"state\"=>\"Pennsylvania\", \"primary_accounting_needs\"=>\"Balancing books\", \"current_accounting_software\"=>\"Quickbooks\", \"tax_classification\"=>\"Individual or sole proprietorship\", \"industry\"=>\"Healthcare\", \"frequency_help_needed\"=>\"One-time\", \"annual_income\"=>\"Less than $100K\", \"num_of_employees\"=>\"No employees\", \"type\"=>\"submit\", \"controller\"=>\"abc\", \"action\"=>\"form\", \"format\"=>\"json\"}'),(28,50,'{\"email\"=>\"\", \"zipcode\"=>\"\", \"type\"=>\"submit\", \"controller\"=>\"abc\", \"action\"=>\"index\", \"format\"=>\"json\"}'),(29,50,'{\"firstname\"=>\"\", \"lastname\"=>\"\", \"state\"=>\"Pennsylvania\", \"primary_accounting_needs\"=>\"Balancing books\", \"current_accounting_software\"=>\"Quickbooks\", \"tax_classification\"=>\"Individual or sole proprietorship\", \"industry\"=>\"Healthcare\", \"frequency_help_needed\"=>\"One-time\", \"annual_income\"=>\"Less than $100K\", \"num_of_employees\"=>\"No employees\", \"type\"=>\"submit\", \"controller\"=>\"abc\", \"action\"=>\"form\", \"format\"=>\"json\"}'),(30,50,'{\"email\"=>\"\", \"zipcode\"=>\"\", \"type\"=>\"submit\", \"controller\"=>\"abc\", \"action\"=>\"index\", \"format\"=>\"json\"}');
/*!40000 ALTER TABLE `form_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options_groups`
--

DROP TABLE IF EXISTS `options_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `value` varchar(155) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options_groups`
--

LOCK TABLES `options_groups` WRITE;
/*!40000 ALTER TABLE `options_groups` DISABLE KEYS */;
INSERT INTO `options_groups` VALUES (1,1,'Pennsylvania'),(2,1,'New Jersey'),(3,1,'Should not be here'),(4,1,'New York'),(5,1,'Massachusetts'),(6,1,'Nevada'),(7,2,'Balancing books'),(8,2,'Preparing tax returns'),(9,2,'Managing accounts receivable and payable'),(10,2,'Preparing financial statements'),(11,2,'Other'),(12,3,'Quickbooks'),(13,3,'Xero'),(14,3,'NolaPro'),(15,3,'Sage'),(16,3,'I currently don\'t use any accouting software'),(17,3,'Other'),(18,4,'Individual or sole proprietorship'),(19,4,'LLC or LLP'),(20,4,'C Corp'),(21,4,'S Corp'),(22,4,'Other'),(23,6,'One-time'),(24,6,'Weekly'),(25,6,'Monthly'),(26,6,'Quarterly'),(27,6,'Full time'),(28,6,'Other'),(29,5,'Healthcare'),(30,5,'Sales & marketing'),(31,5,'Financial services'),(32,5,'Education'),(33,5,'Information technology'),(34,5,'Manufacturing'),(35,5,'Environmental'),(36,5,'Describe'),(37,7,'Less than $100K'),(38,7,'$100K to $300K'),(39,7,'$300K to $1M'),(40,7,'$1M to $5M'),(41,7,'Other'),(42,8,'No employees'),(43,8,'1 to 5'),(44,8,'6 to 15'),(45,8,'15 to 50'),(46,8,'Other');
/*!40000 ALTER TABLE `options_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20160301181121'),('20160302114057'),('20160302114513'),('20160303124718'),('20160303124842'),('20160303232619'),('20160306130403'),('20160313223311'),('20160313223321');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stages`
--

DROP TABLE IF EXISTS `stages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `client_version_id` int(11) DEFAULT NULL,
  `layout_name` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `form_field_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stages`
--

LOCK TABLES `stages` WRITE;
/*!40000 ALTER TABLE `stages` DISABLE KEYS */;
INSERT INTO `stages` VALUES (1,'index',2,13,'abc',1,2),(2,'thankyou',2,13,'abc',3,NULL),(4,'index',1,1,'welcome',1,NULL),(5,'index',3,14,'def',1,NULL),(6,'selection',2,15,'def',1,NULL),(7,'signup',2,15,'def',2,NULL),(8,'carview',2,15,'def',3,NULL),(9,'form',2,13,'abc',2,1);
/*!40000 ALTER TABLE `stages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2016-03-13 22:36:05','2016-03-13 22:36:05','eberjan@gmail.com','$2a$10$eA/fnDosrT74kdmz9sWML.c3JlZkalP6l5CxxH5WTAs8iLU0MwAWy',NULL,NULL,NULL,1,'2016-03-13 22:36:05','2016-03-13 22:36:05','::1','::1');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitor_properties`
--

DROP TABLE IF EXISTS `visitor_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitor_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitor_id` int(11) NOT NULL,
  `key` varchar(45) DEFAULT NULL,
  `value` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitor_properties`
--

LOCK TABLES `visitor_properties` WRITE;
/*!40000 ALTER TABLE `visitor_properties` DISABLE KEYS */;
INSERT INTO `visitor_properties` VALUES (1,49,NULL,NULL,'2016-03-24 23:35:22'),(2,49,'this','that','2016-03-24 23:35:52');
/*!40000 ALTER TABLE `visitor_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitors`
--

DROP TABLE IF EXISTS `visitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `referer` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `context_id` int(11) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `client_version_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitors`
--

LOCK TABLES `visitors` WRITE;
/*!40000 ALTER TABLE `visitors` DISABLE KEYS */;
INSERT INTO `visitors` VALUES (1,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-09 18:58:26',NULL,NULL,13,2,'2016-03-09 18:58:26'),(2,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-09 18:58:37',NULL,NULL,13,2,'2016-03-09 18:58:37'),(3,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-09 18:58:40',NULL,NULL,13,2,'2016-03-09 18:58:40'),(4,'/','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-09 18:58:50',NULL,NULL,1,1,'2016-03-09 18:58:50'),(5,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-09 19:20:09',NULL,NULL,1,1,'2016-03-09 19:20:09'),(6,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-09 19:24:39',NULL,NULL,14,3,'2016-03-09 19:24:39'),(7,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-09 19:25:56',NULL,NULL,14,3,'2016-03-09 19:25:56'),(8,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-09 19:32:34',NULL,NULL,14,3,'2016-03-09 19:32:34'),(9,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-10 01:38:43',NULL,NULL,NULL,2,'2016-03-10 01:38:43'),(10,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-10 01:41:44',NULL,NULL,NULL,2,'2016-03-10 01:41:44'),(11,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-10 01:42:00',NULL,NULL,13,2,'2016-03-10 01:42:00'),(12,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-10 01:43:03',NULL,NULL,13,2,'2016-03-10 01:43:03'),(13,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-10 01:44:43',NULL,NULL,13,2,'2016-03-10 01:44:43'),(14,'/','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-10 01:51:45',NULL,NULL,1,1,'2016-03-10 01:51:45'),(15,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-10 01:52:06',NULL,NULL,14,3,'2016-03-10 01:52:06'),(16,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-10 12:00:32',NULL,NULL,13,2,'2016-03-10 12:00:32'),(17,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-10 12:00:32',NULL,NULL,13,2,'2016-03-10 12:00:32'),(18,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-11 01:25:37',NULL,NULL,13,2,'2016-03-11 01:25:37'),(19,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-11 01:25:38',NULL,NULL,13,2,'2016-03-11 01:25:38'),(20,'/','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-11 09:58:18',NULL,NULL,1,1,'2016-03-11 09:58:18'),(21,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-11 09:58:52',NULL,NULL,13,2,'2016-03-11 09:58:52'),(22,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-12 14:06:50',NULL,NULL,14,3,'2016-03-12 14:06:50'),(23,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-12 14:10:09',NULL,NULL,13,2,'2016-03-12 14:10:09'),(24,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-13 12:46:23',NULL,NULL,13,2,'2016-03-13 12:46:23'),(25,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-13 22:17:55',NULL,NULL,13,2,'2016-03-13 22:17:55'),(26,'/','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-13 22:34:11',NULL,NULL,1,1,'2016-03-13 22:34:11'),(27,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-15 01:27:52',NULL,NULL,13,2,'2016-03-15 01:27:52'),(28,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-16 00:19:22',NULL,NULL,13,2,'2016-03-16 00:19:22'),(29,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-16 11:22:23',NULL,NULL,13,2,'2016-03-16 11:22:23'),(30,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-16 11:32:53',NULL,NULL,13,2,'2016-03-16 11:32:53'),(31,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-16 23:24:16',NULL,NULL,13,2,'2016-03-16 23:24:16'),(32,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-18 00:49:08',NULL,NULL,13,2,'2016-03-18 00:49:08'),(33,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-18 10:46:22',NULL,NULL,13,2,'2016-03-18 10:46:22'),(34,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-18 21:20:10',NULL,NULL,13,2,'2016-03-18 21:20:10'),(35,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-19 10:01:14',NULL,NULL,13,2,'2016-03-19 10:01:14'),(36,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-20 22:44:50',NULL,NULL,13,2,'2016-03-20 22:44:50'),(37,'/index.json?lastname=purugganan&type=event','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36','http://www.bookkeepfinder.com:3000/','2016-03-21 21:40:35',NULL,NULL,13,2,'2016-03-21 21:40:35'),(38,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-22 19:10:54',NULL,NULL,13,2,'2016-03-22 19:10:54'),(39,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-23 01:28:23',NULL,NULL,13,2,'2016-03-23 01:28:23'),(40,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-23 11:48:14',NULL,NULL,13,2,'2016-03-23 11:48:14'),(41,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-23 19:20:37',NULL,NULL,1,1,'2016-03-23 19:20:37'),(42,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-23 19:22:51',NULL,NULL,13,2,'2016-03-23 19:22:51'),(43,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-23 20:12:18',NULL,NULL,1,1,'2016-03-23 20:12:18'),(44,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-24 11:19:55',NULL,NULL,1,1,'2016-03-24 11:19:55'),(45,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-24 11:19:56',NULL,NULL,1,1,'2016-03-24 11:19:56'),(46,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-24 11:20:09',NULL,NULL,1,1,'2016-03-24 11:20:09'),(47,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-24 11:21:14',NULL,NULL,13,2,'2016-03-24 11:21:14'),(48,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-24 23:13:40',NULL,NULL,13,2,'2016-03-24 23:13:40'),(49,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-24 23:34:57',NULL,NULL,13,2,'2016-03-24 23:34:57'),(50,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-25 07:38:14',NULL,NULL,13,2,'2016-03-25 07:38:14');
/*!40000 ALTER TABLE `visitors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visits`
--

DROP TABLE IF EXISTS `visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitor_id` int(11) DEFAULT NULL,
  `stage_id` int(11) DEFAULT NULL,
  `datetime_ts` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=540 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits`
--

LOCK TABLES `visits` WRITE;
/*!40000 ALTER TABLE `visits` DISABLE KEYS */;
INSERT INTO `visits` VALUES (1,7,2,NULL,'2016-03-04 00:21:07','2016-03-04 00:21:07'),(2,19,1,NULL,'2016-03-05 02:45:20','2016-03-05 02:45:20'),(3,19,1,NULL,'2016-03-05 02:47:03','2016-03-05 02:47:03'),(4,19,1,NULL,'2016-03-05 02:47:16','2016-03-05 02:47:16'),(5,20,1,NULL,'2016-03-05 18:55:58','2016-03-05 18:55:58'),(6,20,1,NULL,'2016-03-05 20:51:26','2016-03-05 20:51:26'),(7,20,1,NULL,'2016-03-05 21:09:23','2016-03-05 21:09:23'),(8,20,1,NULL,'2016-03-05 21:10:02','2016-03-05 21:10:02'),(9,20,1,NULL,'2016-03-05 21:10:47','2016-03-05 21:10:47'),(10,20,1,NULL,'2016-03-05 21:12:51','2016-03-05 21:12:51'),(11,20,1,NULL,'2016-03-05 21:13:30','2016-03-05 21:13:30'),(12,20,1,NULL,'2016-03-05 21:14:37','2016-03-05 21:14:37'),(13,20,1,NULL,'2016-03-05 23:58:53','2016-03-05 23:58:53'),(14,20,1,NULL,'2016-03-06 00:01:17','2016-03-06 00:01:17'),(15,20,1,NULL,'2016-03-06 00:02:42','2016-03-06 00:02:42'),(16,20,NULL,NULL,'2016-03-06 00:03:04','2016-03-06 00:03:04'),(17,20,NULL,NULL,'2016-03-06 00:04:29','2016-03-06 00:04:29'),(18,20,NULL,NULL,'2016-03-06 00:06:57','2016-03-06 00:06:57'),(19,20,NULL,NULL,'2016-03-06 00:07:18','2016-03-06 00:07:18'),(20,20,NULL,NULL,'2016-03-06 00:11:05','2016-03-06 00:11:05'),(21,20,NULL,NULL,'2016-03-06 00:14:42','2016-03-06 00:14:42'),(22,20,NULL,NULL,'2016-03-06 00:15:16','2016-03-06 00:15:16'),(23,20,NULL,NULL,'2016-03-06 00:16:10','2016-03-06 00:16:10'),(24,20,NULL,NULL,'2016-03-06 00:19:34','2016-03-06 00:19:34'),(25,25,NULL,NULL,'2016-03-06 13:01:30','2016-03-06 13:01:30'),(26,25,NULL,NULL,'2016-03-06 13:21:09','2016-03-06 13:21:09'),(27,25,NULL,NULL,'2016-03-06 13:26:28','2016-03-06 13:26:28'),(28,25,NULL,NULL,'2016-03-06 13:26:32','2016-03-06 13:26:32'),(29,27,NULL,NULL,'2016-03-07 03:57:03','2016-03-07 03:57:03'),(30,27,NULL,NULL,'2016-03-07 03:59:31','2016-03-07 03:59:31'),(31,27,NULL,NULL,'2016-03-07 04:00:12','2016-03-07 04:00:12'),(32,27,NULL,NULL,'2016-03-07 04:06:11','2016-03-07 04:06:11'),(33,27,NULL,NULL,'2016-03-07 04:18:09','2016-03-07 04:18:09'),(34,27,NULL,NULL,'2016-03-07 04:18:37','2016-03-07 04:18:37'),(35,27,NULL,NULL,'2016-03-07 04:21:33','2016-03-07 04:21:33'),(36,27,NULL,NULL,'2016-03-07 04:26:47','2016-03-07 04:26:47'),(37,27,NULL,NULL,'2016-03-07 04:43:09','2016-03-07 04:43:09'),(38,27,NULL,NULL,'2016-03-07 05:06:00','2016-03-07 05:06:00'),(39,27,NULL,NULL,'2016-03-07 05:08:03','2016-03-07 05:08:03'),(40,27,NULL,NULL,'2016-03-07 05:10:54','2016-03-07 05:10:54'),(41,27,NULL,NULL,'2016-03-07 05:12:21','2016-03-07 05:12:21'),(42,28,NULL,NULL,'2016-03-07 12:49:40','2016-03-07 12:49:40'),(43,28,NULL,NULL,'2016-03-07 12:54:23','2016-03-07 12:54:23'),(44,28,NULL,NULL,'2016-03-07 12:54:51','2016-03-07 12:54:51'),(45,29,NULL,NULL,'2016-03-08 22:45:33','2016-03-08 22:45:33'),(46,30,NULL,NULL,'2016-03-09 06:06:13','2016-03-09 06:06:13'),(47,30,NULL,NULL,'2016-03-09 06:07:10','2016-03-09 06:07:10'),(48,30,NULL,NULL,'2016-03-09 06:07:13','2016-03-09 06:07:13'),(49,31,NULL,NULL,'2016-03-09 12:54:36','2016-03-09 12:54:36'),(50,31,NULL,NULL,'2016-03-09 14:30:11','2016-03-09 14:30:11'),(51,32,NULL,NULL,'2016-03-09 14:31:38','2016-03-09 14:31:38'),(52,33,NULL,NULL,'2016-03-09 15:17:08','2016-03-09 15:17:08'),(53,33,NULL,NULL,'2016-03-09 15:21:47','2016-03-09 15:21:47'),(54,34,NULL,NULL,'2016-03-09 15:22:08','2016-03-09 15:22:08'),(55,34,NULL,NULL,'2016-03-09 15:27:24','2016-03-09 15:27:24'),(56,33,NULL,NULL,'2016-03-09 15:27:32','2016-03-09 15:27:32'),(57,34,NULL,NULL,'2016-03-09 15:27:51','2016-03-09 15:27:51'),(58,35,NULL,NULL,'2016-03-09 15:29:41','2016-03-09 15:29:41'),(59,36,NULL,NULL,'2016-03-09 15:30:39','2016-03-09 15:30:39'),(60,37,NULL,NULL,'2016-03-09 15:34:06','2016-03-09 15:34:06'),(61,40,NULL,NULL,'2016-03-09 15:38:56','2016-03-09 15:38:56'),(62,40,NULL,NULL,'2016-03-09 15:39:20','2016-03-09 15:39:20'),(63,40,NULL,NULL,'2016-03-09 15:41:42','2016-03-09 15:41:42'),(64,33,NULL,NULL,'2016-03-09 15:46:19','2016-03-09 15:46:19'),(65,33,NULL,NULL,'2016-03-09 15:46:23','2016-03-09 15:46:23'),(66,40,NULL,NULL,'2016-03-09 15:46:52','2016-03-09 15:46:52'),(67,33,NULL,NULL,'2016-03-09 15:46:57','2016-03-09 15:46:57'),(68,33,NULL,NULL,'2016-03-09 15:47:38','2016-03-09 15:47:38'),(69,33,NULL,NULL,'2016-03-09 15:48:38','2016-03-09 15:48:38'),(70,41,NULL,NULL,'2016-03-09 15:49:33','2016-03-09 15:49:33'),(71,41,NULL,NULL,'2016-03-09 15:49:39','2016-03-09 15:49:39'),(72,42,NULL,NULL,'2016-03-09 15:52:31','2016-03-09 15:52:31'),(73,43,NULL,NULL,'2016-03-09 15:52:46','2016-03-09 15:52:46'),(74,44,NULL,NULL,'2016-03-09 16:00:28','2016-03-09 16:00:28'),(75,45,NULL,NULL,'2016-03-09 16:01:39','2016-03-09 16:01:39'),(76,40,NULL,NULL,'2016-03-09 16:02:00','2016-03-09 16:02:00'),(77,45,NULL,NULL,'2016-03-09 16:02:10','2016-03-09 16:02:10'),(78,1,NULL,NULL,'2016-03-09 18:58:26','2016-03-09 18:58:26'),(79,2,NULL,NULL,'2016-03-09 18:58:37','2016-03-09 18:58:37'),(80,3,NULL,NULL,'2016-03-09 18:58:40','2016-03-09 18:58:40'),(81,4,NULL,NULL,'2016-03-09 18:58:50','2016-03-09 18:58:50'),(82,3,NULL,NULL,'2016-03-09 19:01:08','2016-03-09 19:01:08'),(83,3,NULL,NULL,'2016-03-09 19:17:31','2016-03-09 19:17:31'),(84,1,NULL,NULL,'2016-03-09 19:17:37','2016-03-09 19:17:37'),(85,4,NULL,NULL,'2016-03-09 19:17:54','2016-03-09 19:17:54'),(86,5,NULL,NULL,'2016-03-09 19:20:09','2016-03-09 19:20:09'),(87,5,NULL,NULL,'2016-03-09 19:21:26','2016-03-09 19:21:26'),(88,5,NULL,NULL,'2016-03-09 19:21:36','2016-03-09 19:21:36'),(89,5,NULL,NULL,'2016-03-09 19:22:05','2016-03-09 19:22:05'),(90,5,NULL,NULL,'2016-03-09 19:22:23','2016-03-09 19:22:23'),(91,5,NULL,NULL,'2016-03-09 19:23:36','2016-03-09 19:23:36'),(92,6,NULL,NULL,'2016-03-09 19:24:39','2016-03-09 19:24:39'),(93,7,NULL,NULL,'2016-03-09 19:25:56','2016-03-09 19:25:56'),(94,7,NULL,NULL,'2016-03-09 19:26:12','2016-03-09 19:26:12'),(95,7,NULL,NULL,'2016-03-09 19:27:54','2016-03-09 19:27:54'),(96,7,NULL,NULL,'2016-03-09 19:30:37','2016-03-09 19:30:37'),(97,7,NULL,NULL,'2016-03-09 19:30:45','2016-03-09 19:30:45'),(98,7,NULL,NULL,'2016-03-09 19:30:47','2016-03-09 19:30:47'),(99,7,NULL,NULL,'2016-03-09 19:32:27','2016-03-09 19:32:27'),(100,8,NULL,NULL,'2016-03-09 19:32:34','2016-03-09 19:32:34'),(101,8,NULL,NULL,'2016-03-09 19:34:14','2016-03-09 19:34:14'),(102,3,NULL,NULL,'2016-03-09 19:35:14','2016-03-09 19:35:14'),(103,3,NULL,NULL,'2016-03-09 19:40:41','2016-03-09 19:40:41'),(104,8,NULL,NULL,'2016-03-09 19:40:46','2016-03-09 19:40:46'),(105,4,NULL,NULL,'2016-03-09 19:40:58','2016-03-09 19:40:58'),(106,4,NULL,NULL,'2016-03-09 19:58:42','2016-03-09 19:58:42'),(107,3,NULL,NULL,'2016-03-09 19:58:47','2016-03-09 19:58:47'),(108,8,NULL,NULL,'2016-03-09 19:58:51','2016-03-09 19:58:51'),(109,8,NULL,NULL,'2016-03-09 19:58:55','2016-03-09 19:58:55'),(110,4,NULL,NULL,'2016-03-09 20:09:55','2016-03-09 20:09:55'),(111,4,NULL,NULL,'2016-03-09 20:17:36','2016-03-09 20:17:36'),(112,8,NULL,NULL,'2016-03-09 20:17:45','2016-03-09 20:17:45'),(113,8,NULL,NULL,'2016-03-09 20:17:53','2016-03-09 20:17:53'),(114,8,NULL,NULL,'2016-03-09 20:17:56','2016-03-09 20:17:56'),(115,8,NULL,NULL,'2016-03-09 20:17:58','2016-03-09 20:17:58'),(116,11,NULL,NULL,'2016-03-10 01:42:00','2016-03-10 01:42:00'),(117,12,NULL,NULL,'2016-03-10 01:43:03','2016-03-10 01:43:03'),(118,12,NULL,NULL,'2016-03-10 01:44:13','2016-03-10 01:44:13'),(119,12,NULL,NULL,'2016-03-10 01:44:31','2016-03-10 01:44:31'),(120,13,NULL,NULL,'2016-03-10 01:44:43','2016-03-10 01:44:43'),(121,13,NULL,NULL,'2016-03-10 01:46:10','2016-03-10 01:46:10'),(122,13,NULL,NULL,'2016-03-10 01:48:34','2016-03-10 01:48:34'),(123,13,NULL,NULL,'2016-03-10 01:48:43','2016-03-10 01:48:43'),(124,13,NULL,NULL,'2016-03-10 01:49:11','2016-03-10 01:49:11'),(125,13,NULL,NULL,'2016-03-10 01:49:13','2016-03-10 01:49:13'),(126,13,NULL,NULL,'2016-03-10 01:49:30','2016-03-10 01:49:30'),(127,13,NULL,NULL,'2016-03-10 01:51:29','2016-03-10 01:51:29'),(128,13,NULL,NULL,'2016-03-10 01:51:39','2016-03-10 01:51:39'),(129,14,NULL,NULL,'2016-03-10 01:51:47','2016-03-10 01:51:47'),(130,15,NULL,NULL,'2016-03-10 01:52:08','2016-03-10 01:52:08'),(131,16,NULL,NULL,'2016-03-10 12:00:32','2016-03-10 12:00:32'),(132,17,NULL,NULL,'2016-03-10 12:00:32','2016-03-10 12:00:32'),(133,18,NULL,NULL,'2016-03-11 01:25:37','2016-03-11 01:25:37'),(134,19,NULL,NULL,'2016-03-11 01:25:38','2016-03-11 01:25:38'),(135,19,NULL,NULL,'2016-03-11 01:34:40','2016-03-11 01:34:40'),(136,19,NULL,NULL,'2016-03-11 01:34:57','2016-03-11 01:34:57'),(137,20,NULL,NULL,'2016-03-11 09:58:18','2016-03-11 09:58:18'),(138,21,NULL,NULL,'2016-03-11 09:58:52','2016-03-11 09:58:52'),(139,21,NULL,NULL,'2016-03-11 09:58:52','2016-03-11 09:58:52'),(140,21,NULL,NULL,'2016-03-11 10:01:15','2016-03-11 10:01:15'),(141,21,NULL,NULL,'2016-03-11 10:04:56','2016-03-11 10:04:56'),(142,21,NULL,NULL,'2016-03-11 10:05:56','2016-03-11 10:05:56'),(143,21,NULL,NULL,'2016-03-11 10:06:24','2016-03-11 10:06:24'),(144,21,NULL,NULL,'2016-03-11 10:09:17','2016-03-11 10:09:17'),(145,21,NULL,NULL,'2016-03-11 10:11:33','2016-03-11 10:11:33'),(146,21,NULL,NULL,'2016-03-11 10:12:02','2016-03-11 10:12:02'),(147,21,NULL,NULL,'2016-03-11 10:13:42','2016-03-11 10:13:42'),(148,21,NULL,NULL,'2016-03-11 10:14:02','2016-03-11 10:14:02'),(149,21,NULL,NULL,'2016-03-11 10:14:40','2016-03-11 10:14:40'),(150,21,NULL,NULL,'2016-03-11 10:16:21','2016-03-11 10:16:21'),(151,21,NULL,NULL,'2016-03-11 10:38:38','2016-03-11 10:38:38'),(152,21,NULL,NULL,'2016-03-11 10:38:39','2016-03-11 10:38:39'),(153,21,NULL,NULL,'2016-03-11 10:38:41','2016-03-11 10:38:41'),(154,21,NULL,NULL,'2016-03-11 10:41:11','2016-03-11 10:41:11'),(155,21,NULL,NULL,'2016-03-11 10:43:56','2016-03-11 10:43:56'),(156,21,NULL,NULL,'2016-03-11 10:45:49','2016-03-11 10:45:49'),(157,21,NULL,NULL,'2016-03-11 10:46:15','2016-03-11 10:46:15'),(158,21,NULL,NULL,'2016-03-11 10:47:07','2016-03-11 10:47:07'),(159,21,NULL,NULL,'2016-03-11 10:49:39','2016-03-11 10:49:39'),(160,21,NULL,NULL,'2016-03-11 10:52:30','2016-03-11 10:52:30'),(161,21,NULL,NULL,'2016-03-11 10:52:31','2016-03-11 10:52:31'),(162,21,NULL,NULL,'2016-03-11 10:52:36','2016-03-11 10:52:36'),(163,21,NULL,NULL,'2016-03-11 10:52:50','2016-03-11 10:52:50'),(164,21,NULL,NULL,'2016-03-11 10:53:22','2016-03-11 10:53:22'),(165,21,NULL,NULL,'2016-03-11 10:55:41','2016-03-11 10:55:41'),(166,21,NULL,NULL,'2016-03-11 10:57:43','2016-03-11 10:57:43'),(167,22,NULL,NULL,'2016-03-12 14:06:50','2016-03-12 14:06:50'),(168,23,NULL,NULL,'2016-03-12 14:10:09','2016-03-12 14:10:09'),(169,23,NULL,NULL,'2016-03-12 14:19:25','2016-03-12 14:19:25'),(170,23,NULL,NULL,'2016-03-12 14:19:25','2016-03-12 14:19:25'),(171,23,NULL,NULL,'2016-03-12 14:19:28','2016-03-12 14:19:28'),(172,23,NULL,NULL,'2016-03-12 14:19:37','2016-03-12 14:19:37'),(173,23,NULL,NULL,'2016-03-12 14:19:37','2016-03-12 14:19:37'),(174,23,NULL,NULL,'2016-03-12 14:19:42','2016-03-12 14:19:42'),(175,23,NULL,NULL,'2016-03-12 14:19:46','2016-03-12 14:19:46'),(176,23,NULL,NULL,'2016-03-12 14:19:49','2016-03-12 14:19:49'),(177,23,NULL,NULL,'2016-03-12 14:20:08','2016-03-12 14:20:08'),(178,23,NULL,NULL,'2016-03-12 14:20:09','2016-03-12 14:20:09'),(179,23,NULL,NULL,'2016-03-12 14:20:09','2016-03-12 14:20:09'),(180,23,NULL,NULL,'2016-03-12 14:20:10','2016-03-12 14:20:10'),(181,23,NULL,NULL,'2016-03-12 14:20:10','2016-03-12 14:20:10'),(182,23,NULL,NULL,'2016-03-12 14:20:11','2016-03-12 14:20:11'),(183,23,NULL,NULL,'2016-03-12 14:20:11','2016-03-12 14:20:11'),(184,23,NULL,NULL,'2016-03-12 14:20:12','2016-03-12 14:20:12'),(185,23,NULL,NULL,'2016-03-12 14:20:12','2016-03-12 14:20:12'),(186,23,NULL,NULL,'2016-03-12 14:20:13','2016-03-12 14:20:13'),(187,23,NULL,NULL,'2016-03-12 14:20:13','2016-03-12 14:20:13'),(188,23,NULL,NULL,'2016-03-12 14:20:14','2016-03-12 14:20:14'),(189,23,NULL,NULL,'2016-03-12 14:28:53','2016-03-12 14:28:53'),(190,23,3,NULL,'2016-03-12 14:31:52','2016-03-12 14:31:52'),(191,23,NULL,NULL,'2016-03-12 14:31:58','2016-03-12 14:31:58'),(192,23,2,NULL,'2016-03-12 14:32:11','2016-03-12 14:32:11'),(193,23,3,NULL,'2016-03-12 14:32:12','2016-03-12 14:32:12'),(194,23,NULL,NULL,'2016-03-12 14:32:13','2016-03-12 14:32:13'),(195,23,2,NULL,'2016-03-12 14:32:14','2016-03-12 14:32:14'),(196,23,3,NULL,'2016-03-12 14:32:14','2016-03-12 14:32:14'),(197,23,NULL,NULL,'2016-03-12 14:32:52','2016-03-12 14:32:52'),(198,23,2,NULL,'2016-03-12 14:32:53','2016-03-12 14:32:53'),(199,23,3,NULL,'2016-03-12 14:32:53','2016-03-12 14:32:53'),(200,23,NULL,NULL,'2016-03-12 14:32:54','2016-03-12 14:32:54'),(201,23,2,NULL,'2016-03-12 14:32:54','2016-03-12 14:32:54'),(202,23,3,NULL,'2016-03-12 14:33:56','2016-03-12 14:33:56'),(203,23,1,NULL,'2016-03-12 14:33:56','2016-03-12 14:33:56'),(204,23,2,NULL,'2016-03-12 14:33:57','2016-03-12 14:33:57'),(205,23,3,NULL,'2016-03-12 14:33:57','2016-03-12 14:33:57'),(206,23,1,NULL,'2016-03-12 14:33:58','2016-03-12 14:33:58'),(207,23,2,NULL,'2016-03-12 14:33:58','2016-03-12 14:33:58'),(208,23,3,NULL,'2016-03-12 14:33:59','2016-03-12 14:33:59'),(209,23,1,NULL,'2016-03-12 14:33:59','2016-03-12 14:33:59'),(210,23,2,NULL,'2016-03-12 14:34:00','2016-03-12 14:34:00'),(211,23,3,NULL,'2016-03-12 14:34:47','2016-03-12 14:34:47'),(212,23,1,NULL,'2016-03-12 14:34:48','2016-03-12 14:34:48'),(213,23,2,NULL,'2016-03-12 14:34:48','2016-03-12 14:34:48'),(214,23,3,NULL,'2016-03-12 14:34:49','2016-03-12 14:34:49'),(215,23,1,NULL,'2016-03-12 14:34:49','2016-03-12 14:34:49'),(216,23,2,NULL,'2016-03-12 14:34:50','2016-03-12 14:34:50'),(217,23,3,NULL,'2016-03-12 14:34:50','2016-03-12 14:34:50'),(218,23,1,NULL,'2016-03-12 14:34:51','2016-03-12 14:34:51'),(219,23,2,NULL,'2016-03-12 14:35:43','2016-03-12 14:35:43'),(220,23,3,NULL,'2016-03-12 14:35:52','2016-03-12 14:35:52'),(221,23,1,NULL,'2016-03-12 14:35:59','2016-03-12 14:35:59'),(222,23,2,NULL,'2016-03-12 14:42:15','2016-03-12 14:42:15'),(223,23,3,NULL,'2016-03-12 14:42:26','2016-03-12 14:42:26'),(224,23,1,NULL,'2016-03-12 14:44:46','2016-03-12 14:44:46'),(225,23,1,NULL,'2016-03-12 14:44:48','2016-03-12 14:44:48'),(226,23,1,NULL,'2016-03-12 14:45:03','2016-03-12 14:45:03'),(227,23,1,NULL,'2016-03-12 14:45:17','2016-03-12 14:45:17'),(228,23,2,NULL,'2016-03-12 14:54:41','2016-03-12 14:54:41'),(229,23,3,NULL,'2016-03-12 14:54:46','2016-03-12 14:54:46'),(230,23,1,NULL,'2016-03-12 14:54:55','2016-03-12 14:54:55'),(231,23,2,NULL,'2016-03-12 14:54:56','2016-03-12 14:54:56'),(232,23,3,NULL,'2016-03-12 14:54:56','2016-03-12 14:54:56'),(233,23,1,NULL,'2016-03-12 14:54:57','2016-03-12 14:54:57'),(234,23,2,NULL,'2016-03-12 14:54:57','2016-03-12 14:54:57'),(235,23,3,NULL,'2016-03-12 14:54:58','2016-03-12 14:54:58'),(236,23,1,NULL,'2016-03-12 14:54:59','2016-03-12 14:54:59'),(237,23,2,NULL,'2016-03-12 14:54:59','2016-03-12 14:54:59'),(238,23,3,NULL,'2016-03-12 14:55:00','2016-03-12 14:55:00'),(239,23,1,NULL,'2016-03-12 14:55:00','2016-03-12 14:55:00'),(240,22,5,NULL,'2016-03-12 14:55:20','2016-03-12 14:55:20'),(241,23,1,NULL,'2016-03-12 15:08:10','2016-03-12 15:08:10'),(242,23,2,NULL,'2016-03-12 15:08:12','2016-03-12 15:08:12'),(243,24,1,NULL,'2016-03-13 12:46:23','2016-03-13 12:46:23'),(244,24,1,NULL,'2016-03-13 12:47:12','2016-03-13 12:47:12'),(245,24,1,NULL,'2016-03-13 12:47:22','2016-03-13 12:47:22'),(246,24,1,NULL,'2016-03-13 13:44:05','2016-03-13 13:44:05'),(247,24,1,NULL,'2016-03-13 13:44:39','2016-03-13 13:44:39'),(248,24,1,NULL,'2016-03-13 13:45:41','2016-03-13 13:45:41'),(249,24,1,NULL,'2016-03-13 13:47:09','2016-03-13 13:47:09'),(250,24,2,NULL,'2016-03-13 13:48:34','2016-03-13 13:48:34'),(251,24,1,NULL,'2016-03-13 13:48:42','2016-03-13 13:48:42'),(252,24,1,NULL,'2016-03-13 13:51:02','2016-03-13 13:51:02'),(253,24,1,NULL,'2016-03-13 13:52:29','2016-03-13 13:52:29'),(254,24,1,NULL,'2016-03-13 15:39:06','2016-03-13 15:39:06'),(255,24,1,NULL,'2016-03-13 15:50:12','2016-03-13 15:50:12'),(256,24,1,NULL,'2016-03-13 15:50:57','2016-03-13 15:50:57'),(257,24,1,NULL,'2016-03-13 15:54:04','2016-03-13 15:54:04'),(258,24,1,NULL,'2016-03-13 15:54:16','2016-03-13 15:54:16'),(259,24,1,NULL,'2016-03-13 15:55:22','2016-03-13 15:55:22'),(260,24,1,NULL,'2016-03-13 15:56:53','2016-03-13 15:56:53'),(261,24,1,NULL,'2016-03-13 15:57:54','2016-03-13 15:57:54'),(262,24,1,NULL,'2016-03-13 15:58:53','2016-03-13 15:58:53'),(263,24,1,NULL,'2016-03-13 15:59:50','2016-03-13 15:59:50'),(264,24,1,NULL,'2016-03-13 16:00:19','2016-03-13 16:00:19'),(265,24,1,NULL,'2016-03-13 16:00:57','2016-03-13 16:00:57'),(266,24,1,NULL,'2016-03-13 16:02:53','2016-03-13 16:02:53'),(267,24,1,NULL,'2016-03-13 16:04:57','2016-03-13 16:04:57'),(268,24,1,NULL,'2016-03-13 16:05:58','2016-03-13 16:05:58'),(269,24,1,NULL,'2016-03-13 16:07:06','2016-03-13 16:07:06'),(270,24,1,NULL,'2016-03-13 16:07:22','2016-03-13 16:07:22'),(271,24,1,NULL,'2016-03-13 16:08:37','2016-03-13 16:08:37'),(272,24,1,NULL,'2016-03-13 16:08:58','2016-03-13 16:08:58'),(273,24,1,NULL,'2016-03-13 16:09:42','2016-03-13 16:09:42'),(274,24,1,NULL,'2016-03-13 16:09:50','2016-03-13 16:09:50'),(275,24,1,NULL,'2016-03-13 16:10:11','2016-03-13 16:10:11'),(276,24,1,NULL,'2016-03-13 16:10:41','2016-03-13 16:10:41'),(277,24,2,NULL,'2016-03-13 16:11:35','2016-03-13 16:11:35'),(278,25,1,NULL,'2016-03-13 22:17:55','2016-03-13 22:17:55'),(279,26,4,NULL,'2016-03-13 22:34:11','2016-03-13 22:34:11'),(280,26,4,NULL,'2016-03-13 22:36:05','2016-03-13 22:36:05'),(281,26,4,NULL,'2016-03-13 22:36:12','2016-03-13 22:36:12'),(282,26,4,NULL,'2016-03-13 22:36:19','2016-03-13 22:36:19'),(283,26,4,NULL,'2016-03-13 22:40:25','2016-03-13 22:40:25'),(284,26,4,NULL,'2016-03-13 22:55:33','2016-03-13 22:55:33'),(285,25,1,NULL,'2016-03-13 22:55:44','2016-03-13 22:55:44'),(286,25,2,NULL,'2016-03-13 22:55:48','2016-03-13 22:55:48'),(287,25,3,NULL,'2016-03-13 22:55:49','2016-03-13 22:55:49'),(288,25,1,NULL,'2016-03-13 22:55:50','2016-03-13 22:55:50'),(289,25,2,NULL,'2016-03-13 22:55:52','2016-03-13 22:55:52'),(290,25,3,NULL,'2016-03-13 22:55:53','2016-03-13 22:55:53'),(291,25,1,NULL,'2016-03-13 22:55:54','2016-03-13 22:55:54'),(292,27,1,NULL,'2016-03-15 01:27:52','2016-03-15 01:27:52'),(293,28,1,NULL,'2016-03-16 00:19:22','2016-03-16 00:19:22'),(294,28,1,NULL,'2016-03-16 00:28:45','2016-03-16 00:28:45'),(295,28,1,NULL,'2016-03-16 00:31:24','2016-03-16 00:31:24'),(296,28,1,NULL,'2016-03-16 00:31:43','2016-03-16 00:31:43'),(297,28,1,NULL,'2016-03-16 00:32:16','2016-03-16 00:32:16'),(298,28,1,NULL,'2016-03-16 00:32:39','2016-03-16 00:32:39'),(299,28,1,NULL,'2016-03-16 00:33:20','2016-03-16 00:33:20'),(300,29,1,NULL,'2016-03-16 11:22:23','2016-03-16 11:22:23'),(301,30,1,NULL,'2016-03-16 11:32:53','2016-03-16 11:32:53'),(302,30,2,NULL,'2016-03-16 11:33:33','2016-03-16 11:33:33'),(303,30,1,NULL,'2016-03-16 11:36:36','2016-03-16 11:36:36'),(304,30,2,NULL,'2016-03-16 11:36:41','2016-03-16 11:36:41'),(305,31,1,NULL,'2016-03-16 23:24:16','2016-03-16 23:24:16'),(306,31,1,NULL,'2016-03-16 23:38:20','2016-03-16 23:38:20'),(307,32,1,NULL,'2016-03-18 00:49:08','2016-03-18 00:49:08'),(308,32,1,NULL,'2016-03-18 00:49:43','2016-03-18 00:49:43'),(309,32,1,NULL,'2016-03-18 00:50:26','2016-03-18 00:50:26'),(310,32,1,NULL,'2016-03-18 00:51:06','2016-03-18 00:51:06'),(311,32,1,NULL,'2016-03-18 00:51:20','2016-03-18 00:51:20'),(312,32,1,NULL,'2016-03-18 00:51:32','2016-03-18 00:51:32'),(313,32,1,NULL,'2016-03-18 00:52:37','2016-03-18 00:52:37'),(314,32,1,NULL,'2016-03-18 00:53:23','2016-03-18 00:53:23'),(315,32,1,NULL,'2016-03-18 00:53:58','2016-03-18 00:53:58'),(316,32,1,NULL,'2016-03-18 00:54:06','2016-03-18 00:54:06'),(317,32,1,NULL,'2016-03-18 00:54:24','2016-03-18 00:54:24'),(318,32,1,NULL,'2016-03-18 00:54:36','2016-03-18 00:54:36'),(319,32,1,NULL,'2016-03-18 00:54:41','2016-03-18 00:54:41'),(320,32,1,NULL,'2016-03-18 00:55:08','2016-03-18 00:55:08'),(321,32,1,NULL,'2016-03-18 00:55:26','2016-03-18 00:55:26'),(322,32,1,NULL,'2016-03-18 00:55:34','2016-03-18 00:55:34'),(323,32,1,NULL,'2016-03-18 00:55:52','2016-03-18 00:55:52'),(324,32,1,NULL,'2016-03-18 00:56:57','2016-03-18 00:56:57'),(325,32,1,NULL,'2016-03-18 01:00:06','2016-03-18 01:00:06'),(326,32,1,NULL,'2016-03-18 01:00:36','2016-03-18 01:00:36'),(327,33,1,NULL,'2016-03-18 10:46:22','2016-03-18 10:46:22'),(328,33,1,NULL,'2016-03-18 10:58:09','2016-03-18 10:58:09'),(329,33,1,NULL,'2016-03-18 10:58:19','2016-03-18 10:58:19'),(330,33,1,NULL,'2016-03-18 10:58:45','2016-03-18 10:58:45'),(331,33,1,NULL,'2016-03-18 10:58:57','2016-03-18 10:58:57'),(332,33,1,NULL,'2016-03-18 11:01:41','2016-03-18 11:01:41'),(333,33,1,NULL,'2016-03-18 11:03:04','2016-03-18 11:03:04'),(334,34,1,NULL,'2016-03-18 21:20:10','2016-03-18 21:20:10'),(335,34,1,NULL,'2016-03-18 23:17:56','2016-03-18 23:17:56'),(336,34,1,NULL,'2016-03-18 23:18:52','2016-03-18 23:18:52'),(337,34,1,NULL,'2016-03-18 23:19:02','2016-03-18 23:19:02'),(338,34,1,NULL,'2016-03-18 23:27:04','2016-03-18 23:27:04'),(339,34,1,NULL,'2016-03-18 23:27:47','2016-03-18 23:27:47'),(340,34,1,NULL,'2016-03-18 23:28:55','2016-03-18 23:28:55'),(341,34,1,NULL,'2016-03-18 23:29:01','2016-03-18 23:29:01'),(342,34,1,NULL,'2016-03-18 23:30:26','2016-03-18 23:30:26'),(343,34,1,NULL,'2016-03-18 23:30:28','2016-03-18 23:30:28'),(344,34,1,NULL,'2016-03-18 23:32:01','2016-03-18 23:32:01'),(345,34,1,NULL,'2016-03-18 23:39:30','2016-03-18 23:39:30'),(346,34,1,NULL,'2016-03-18 23:46:03','2016-03-18 23:46:03'),(347,34,1,NULL,'2016-03-18 23:47:16','2016-03-18 23:47:16'),(348,34,1,NULL,'2016-03-18 23:48:12','2016-03-18 23:48:12'),(349,34,1,NULL,'2016-03-18 23:50:38','2016-03-18 23:50:38'),(350,34,1,NULL,'2016-03-18 23:51:47','2016-03-18 23:51:47'),(351,34,2,NULL,'2016-03-19 00:03:28','2016-03-19 00:03:28'),(352,35,1,NULL,'2016-03-19 10:01:14','2016-03-19 10:01:14'),(353,35,1,NULL,'2016-03-19 10:01:42','2016-03-19 10:01:42'),(354,35,2,NULL,'2016-03-19 10:09:08','2016-03-19 10:09:08'),(355,35,2,NULL,'2016-03-19 10:22:28','2016-03-19 10:22:28'),(356,35,1,NULL,'2016-03-19 10:22:35','2016-03-19 10:22:35'),(357,35,2,NULL,'2016-03-19 10:52:53','2016-03-19 10:52:53'),(358,35,1,NULL,'2016-03-19 10:54:14','2016-03-19 10:54:14'),(359,35,1,NULL,'2016-03-19 10:56:43','2016-03-19 10:56:43'),(360,35,1,NULL,'2016-03-19 11:01:43','2016-03-19 11:01:43'),(361,35,1,NULL,'2016-03-19 11:02:37','2016-03-19 11:02:37'),(362,35,1,NULL,'2016-03-19 11:03:26','2016-03-19 11:03:26'),(363,35,1,NULL,'2016-03-19 11:05:45','2016-03-19 11:05:45'),(364,35,1,NULL,'2016-03-19 11:06:02','2016-03-19 11:06:02'),(365,35,1,NULL,'2016-03-19 11:06:39','2016-03-19 11:06:39'),(366,35,1,NULL,'2016-03-19 11:07:11','2016-03-19 11:07:11'),(367,35,1,NULL,'2016-03-19 11:07:25','2016-03-19 11:07:25'),(368,35,1,NULL,'2016-03-19 11:08:09','2016-03-19 11:08:09'),(369,35,1,NULL,'2016-03-19 11:08:33','2016-03-19 11:08:33'),(370,35,1,NULL,'2016-03-19 11:22:18','2016-03-19 11:22:18'),(371,35,1,NULL,'2016-03-19 11:24:04','2016-03-19 11:24:04'),(372,35,1,NULL,'2016-03-19 11:24:59','2016-03-19 11:24:59'),(373,35,1,NULL,'2016-03-19 11:26:57','2016-03-19 11:26:57'),(374,35,1,NULL,'2016-03-19 11:30:10','2016-03-19 11:30:10'),(375,35,1,NULL,'2016-03-19 11:30:32','2016-03-19 11:30:32'),(376,35,1,NULL,'2016-03-19 11:31:23','2016-03-19 11:31:23'),(377,35,1,NULL,'2016-03-19 11:32:52','2016-03-19 11:32:52'),(378,35,1,NULL,'2016-03-19 11:33:55','2016-03-19 11:33:55'),(379,35,1,NULL,'2016-03-19 11:34:38','2016-03-19 11:34:38'),(380,35,1,NULL,'2016-03-19 11:40:31','2016-03-19 11:40:31'),(381,35,1,NULL,'2016-03-19 11:41:19','2016-03-19 11:41:19'),(382,35,1,NULL,'2016-03-19 11:42:18','2016-03-19 11:42:18'),(383,35,1,NULL,'2016-03-19 11:43:15','2016-03-19 11:43:15'),(384,35,1,NULL,'2016-03-19 11:44:05','2016-03-19 11:44:05'),(385,35,1,NULL,'2016-03-19 14:58:45','2016-03-19 14:58:45'),(386,35,1,NULL,'2016-03-19 14:58:45','2016-03-19 14:58:45'),(387,35,1,NULL,'2016-03-19 14:59:01','2016-03-19 14:59:01'),(388,35,1,NULL,'2016-03-19 14:59:09','2016-03-19 14:59:09'),(389,35,1,NULL,'2016-03-19 14:59:12','2016-03-19 14:59:12'),(390,35,1,NULL,'2016-03-19 14:59:14','2016-03-19 14:59:14'),(391,35,1,NULL,'2016-03-19 14:59:20','2016-03-19 14:59:20'),(392,36,1,NULL,'2016-03-20 22:44:50','2016-03-20 22:44:50'),(393,37,2,NULL,'2016-03-21 21:44:31','2016-03-21 21:44:31'),(394,37,1,NULL,'2016-03-21 21:45:32','2016-03-21 21:45:32'),(395,37,1,NULL,'2016-03-21 21:46:09','2016-03-21 21:46:09'),(396,37,2,NULL,'2016-03-21 21:47:06','2016-03-21 21:47:06'),(397,37,2,NULL,'2016-03-21 21:49:10','2016-03-21 21:49:10'),(398,37,2,NULL,'2016-03-21 21:49:20','2016-03-21 21:49:20'),(399,37,1,NULL,'2016-03-21 22:00:31','2016-03-21 22:00:31'),(400,38,1,NULL,'2016-03-22 19:10:54','2016-03-22 19:10:54'),(401,38,2,NULL,'2016-03-22 19:10:58','2016-03-22 19:10:58'),(402,38,1,NULL,'2016-03-23 00:59:33','2016-03-23 00:59:33'),(403,38,1,NULL,'2016-03-23 00:59:56','2016-03-23 00:59:56'),(404,38,1,NULL,'2016-03-23 01:00:39','2016-03-23 01:00:39'),(405,38,1,NULL,'2016-03-23 01:01:44','2016-03-23 01:01:44'),(406,38,1,NULL,'2016-03-23 01:03:49','2016-03-23 01:03:49'),(407,38,1,NULL,'2016-03-23 01:04:26','2016-03-23 01:04:26'),(408,38,1,NULL,'2016-03-23 01:04:43','2016-03-23 01:04:43'),(409,38,1,NULL,'2016-03-23 01:04:56','2016-03-23 01:04:56'),(410,38,1,NULL,'2016-03-23 01:05:06','2016-03-23 01:05:06'),(411,38,1,NULL,'2016-03-23 01:05:26','2016-03-23 01:05:26'),(412,38,1,NULL,'2016-03-23 01:07:37','2016-03-23 01:07:37'),(413,38,1,NULL,'2016-03-23 01:07:56','2016-03-23 01:07:56'),(414,38,1,NULL,'2016-03-23 01:08:08','2016-03-23 01:08:08'),(415,38,1,NULL,'2016-03-23 01:08:37','2016-03-23 01:08:37'),(416,38,1,NULL,'2016-03-23 01:10:57','2016-03-23 01:10:57'),(417,38,1,NULL,'2016-03-23 01:11:24','2016-03-23 01:11:24'),(418,38,1,NULL,'2016-03-23 01:11:49','2016-03-23 01:11:49'),(419,38,1,NULL,'2016-03-23 01:12:24','2016-03-23 01:12:24'),(420,38,1,NULL,'2016-03-23 01:16:23','2016-03-23 01:16:23'),(421,38,1,NULL,'2016-03-23 01:17:01','2016-03-23 01:17:01'),(422,38,1,NULL,'2016-03-23 01:17:13','2016-03-23 01:17:13'),(423,38,1,NULL,'2016-03-23 01:17:28','2016-03-23 01:17:28'),(424,38,1,NULL,'2016-03-23 01:17:51','2016-03-23 01:17:51'),(425,38,1,NULL,'2016-03-23 01:18:48','2016-03-23 01:18:48'),(426,38,1,NULL,'2016-03-23 01:18:59','2016-03-23 01:18:59'),(427,39,1,NULL,'2016-03-23 01:28:23','2016-03-23 01:28:23'),(428,39,1,NULL,'2016-03-23 01:28:43','2016-03-23 01:28:43'),(429,39,1,NULL,'2016-03-23 01:29:27','2016-03-23 01:29:27'),(430,39,1,NULL,'2016-03-23 01:30:17','2016-03-23 01:30:17'),(431,39,1,NULL,'2016-03-23 01:30:50','2016-03-23 01:30:50'),(432,39,1,NULL,'2016-03-23 01:32:24','2016-03-23 01:32:24'),(433,39,1,NULL,'2016-03-23 01:33:44','2016-03-23 01:33:44'),(434,39,1,NULL,'2016-03-23 01:34:59','2016-03-23 01:34:59'),(435,39,1,NULL,'2016-03-23 01:36:12','2016-03-23 01:36:12'),(436,39,1,NULL,'2016-03-23 01:56:29','2016-03-23 01:56:29'),(437,39,1,NULL,'2016-03-23 01:59:57','2016-03-23 01:59:57'),(438,39,1,NULL,'2016-03-23 02:00:17','2016-03-23 02:00:17'),(439,39,2,NULL,'2016-03-23 02:00:21','2016-03-23 02:00:21'),(440,39,1,NULL,'2016-03-23 02:06:09','2016-03-23 02:06:09'),(441,40,1,NULL,'2016-03-23 11:48:14','2016-03-23 11:48:14'),(442,40,1,NULL,'2016-03-23 11:48:43','2016-03-23 11:48:43'),(443,40,1,NULL,'2016-03-23 11:49:48','2016-03-23 11:49:48'),(444,40,1,NULL,'2016-03-23 11:50:12','2016-03-23 11:50:12'),(445,40,1,NULL,'2016-03-23 11:52:23','2016-03-23 11:52:23'),(446,40,1,NULL,'2016-03-23 11:55:40','2016-03-23 11:55:40'),(447,40,1,NULL,'2016-03-23 11:57:25','2016-03-23 11:57:25'),(448,40,1,NULL,'2016-03-23 11:58:22','2016-03-23 11:58:22'),(449,40,1,NULL,'2016-03-23 12:02:32','2016-03-23 12:02:32'),(450,40,1,NULL,'2016-03-23 13:32:27','2016-03-23 13:32:27'),(451,40,1,NULL,'2016-03-23 13:33:23','2016-03-23 13:33:23'),(452,40,1,NULL,'2016-03-23 13:33:37','2016-03-23 13:33:37'),(453,40,1,NULL,'2016-03-23 13:35:02','2016-03-23 13:35:02'),(454,40,1,NULL,'2016-03-23 13:46:17','2016-03-23 13:46:17'),(455,40,1,NULL,'2016-03-23 13:52:30','2016-03-23 13:52:30'),(456,40,1,NULL,'2016-03-23 13:54:52','2016-03-23 13:54:52'),(457,41,4,NULL,'2016-03-23 19:20:37','2016-03-23 19:20:37'),(458,41,4,NULL,'2016-03-23 19:20:58','2016-03-23 19:20:58'),(459,41,4,NULL,'2016-03-23 19:21:01','2016-03-23 19:21:01'),(460,41,4,NULL,'2016-03-23 19:21:59','2016-03-23 19:21:59'),(461,42,1,NULL,'2016-03-23 19:22:51','2016-03-23 19:22:51'),(462,42,2,NULL,'2016-03-23 19:23:20','2016-03-23 19:23:20'),(463,43,4,NULL,'2016-03-23 20:12:19','2016-03-23 20:12:19'),(464,43,4,NULL,'2016-03-23 20:13:41','2016-03-23 20:13:41'),(465,43,4,NULL,'2016-03-23 20:15:54','2016-03-23 20:15:54'),(466,43,4,NULL,'2016-03-23 20:15:59','2016-03-23 20:15:59'),(467,44,4,NULL,'2016-03-24 11:19:55','2016-03-24 11:19:55'),(468,45,4,NULL,'2016-03-24 11:19:56','2016-03-24 11:19:56'),(469,46,4,NULL,'2016-03-24 11:20:09','2016-03-24 11:20:09'),(470,46,4,NULL,'2016-03-24 11:20:32','2016-03-24 11:20:32'),(471,46,4,NULL,'2016-03-24 11:20:35','2016-03-24 11:20:35'),(472,46,4,NULL,'2016-03-24 11:20:47','2016-03-24 11:20:47'),(473,47,1,NULL,'2016-03-24 11:21:14','2016-03-24 11:21:14'),(474,48,1,NULL,'2016-03-24 23:13:40','2016-03-24 23:13:40'),(475,48,1,NULL,'2016-03-24 23:15:38','2016-03-24 23:15:38'),(476,48,1,NULL,'2016-03-24 23:27:31','2016-03-24 23:27:31'),(477,48,1,NULL,'2016-03-24 23:34:44','2016-03-24 23:34:44'),(478,49,1,NULL,'2016-03-24 23:38:36','2016-03-24 23:38:36'),(479,49,1,NULL,'2016-03-24 23:48:23','2016-03-24 23:48:23'),(480,49,2,NULL,'2016-03-24 23:49:09','2016-03-24 23:49:09'),(481,49,1,NULL,'2016-03-24 23:50:54','2016-03-24 23:50:54'),(482,49,1,NULL,'2016-03-24 23:55:05','2016-03-24 23:55:05'),(483,49,1,NULL,'2016-03-25 00:02:23','2016-03-25 00:02:23'),(484,49,1,NULL,'2016-03-25 00:02:26','2016-03-25 00:02:26'),(485,49,1,NULL,'2016-03-25 00:16:12','2016-03-25 00:16:12'),(486,49,9,NULL,'2016-03-25 00:18:33','2016-03-25 00:18:33'),(487,49,1,NULL,'2016-03-25 00:18:43','2016-03-25 00:18:43'),(488,49,1,NULL,'2016-03-25 00:18:47','2016-03-25 00:18:47'),(489,49,9,NULL,'2016-03-25 00:19:01','2016-03-25 00:19:01'),(490,49,1,NULL,'2016-03-25 00:23:11','2016-03-25 00:23:11'),(491,49,1,NULL,'2016-03-25 00:24:14','2016-03-25 00:24:14'),(492,49,9,NULL,'2016-03-25 00:24:42','2016-03-25 00:24:42'),(493,49,1,NULL,'2016-03-25 00:34:16','2016-03-25 00:34:16'),(494,49,9,NULL,'2016-03-25 00:34:48','2016-03-25 00:34:48'),(495,49,1,NULL,'2016-03-25 00:52:45','2016-03-25 00:52:45'),(496,49,9,NULL,'2016-03-25 00:53:19','2016-03-25 00:53:19'),(497,49,9,NULL,'2016-03-25 00:53:27','2016-03-25 00:53:27'),(498,49,1,NULL,'2016-03-25 00:56:23','2016-03-25 00:56:23'),(499,49,9,NULL,'2016-03-25 00:56:26','2016-03-25 00:56:26'),(500,49,9,NULL,'2016-03-25 00:56:59','2016-03-25 00:56:59'),(501,49,1,NULL,'2016-03-25 01:13:48','2016-03-25 01:13:48'),(502,49,9,NULL,'2016-03-25 01:13:51','2016-03-25 01:13:51'),(503,49,9,NULL,'2016-03-25 01:19:09','2016-03-25 01:19:09'),(504,49,9,NULL,'2016-03-25 01:19:25','2016-03-25 01:19:25'),(505,49,9,NULL,'2016-03-25 01:23:23','2016-03-25 01:23:23'),(506,49,9,NULL,'2016-03-25 01:23:32','2016-03-25 01:23:32'),(507,49,2,NULL,'2016-03-25 01:32:47','2016-03-25 01:32:47'),(508,49,1,NULL,'2016-03-25 01:42:19','2016-03-25 01:42:19'),(509,49,1,NULL,'2016-03-25 01:42:49','2016-03-25 01:42:49'),(510,50,1,NULL,'2016-03-25 07:38:14','2016-03-25 07:38:14'),(511,50,1,NULL,'2016-03-25 07:38:26','2016-03-25 07:38:26'),(512,50,9,NULL,'2016-03-25 07:38:48','2016-03-25 07:38:48'),(513,50,1,NULL,'2016-03-25 07:40:29','2016-03-25 07:40:29'),(514,50,1,NULL,'2016-03-25 07:40:29','2016-03-25 07:40:29'),(515,50,1,NULL,'2016-03-25 07:42:20','2016-03-25 07:42:20'),(516,50,9,NULL,'2016-03-25 07:42:35','2016-03-25 07:42:35'),(517,50,9,NULL,'2016-03-25 07:44:20','2016-03-25 07:44:20'),(518,50,9,NULL,'2016-03-25 07:44:33','2016-03-25 07:44:33'),(519,50,9,NULL,'2016-03-25 07:44:49','2016-03-25 07:44:49'),(520,50,1,NULL,'2016-03-25 07:44:55','2016-03-25 07:44:55'),(521,50,1,NULL,'2016-03-25 07:44:55','2016-03-25 07:44:55'),(522,50,9,NULL,'2016-03-25 07:45:02','2016-03-25 07:45:02'),(523,50,2,NULL,'2016-03-25 07:45:05','2016-03-25 07:45:05'),(524,50,9,NULL,'2016-03-25 07:45:51','2016-03-25 07:45:51'),(525,50,2,NULL,'2016-03-25 07:45:54','2016-03-25 07:45:54'),(526,50,2,NULL,'2016-03-25 07:47:05','2016-03-25 07:47:05'),(527,50,1,NULL,'2016-03-25 07:47:10','2016-03-25 07:47:10'),(528,50,1,NULL,'2016-03-25 07:47:10','2016-03-25 07:47:10'),(529,50,9,NULL,'2016-03-25 07:47:13','2016-03-25 07:47:13'),(530,50,2,NULL,'2016-03-25 07:47:15','2016-03-25 07:47:15'),(531,50,1,NULL,'2016-03-25 07:51:33','2016-03-25 07:51:33'),(532,50,1,NULL,'2016-03-25 07:51:34','2016-03-25 07:51:34'),(533,50,9,NULL,'2016-03-25 07:52:19','2016-03-25 07:52:19'),(534,50,9,NULL,'2016-03-25 07:52:33','2016-03-25 07:52:33'),(535,50,9,NULL,'2016-03-25 07:54:25','2016-03-25 07:54:25'),(536,50,9,NULL,'2016-03-25 07:54:32','2016-03-25 07:54:32'),(537,50,9,NULL,'2016-03-25 07:54:52','2016-03-25 07:54:52'),(538,50,9,NULL,'2016-03-25 07:55:14','2016-03-25 07:55:14'),(539,50,9,NULL,'2016-03-25 07:59:59','2016-03-25 07:59:59');
/*!40000 ALTER TABLE `visits` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-25  4:24:29
