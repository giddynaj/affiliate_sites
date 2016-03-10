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
INSERT INTO `clients` VALUES (1,'welcome','localhost','2016-03-03 23:18:00','2016-03-03 23:18:00'),(2,'abc','abc.com','2016-03-09 10:27:06','2016-03-09 10:27:06'),(3,'def','def.com','2016-03-09 14:20:28','2016-03-09 14:20:28');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,25,'2016-03-06 13:05:42','2016-03-06 13:05:42'),(2,25,'2016-03-06 13:14:44','2016-03-06 13:14:44'),(3,25,'2016-03-06 13:15:39','2016-03-06 13:15:39'),(4,25,'2016-03-06 13:17:53','2016-03-06 13:17:53'),(5,25,'2016-03-06 13:18:41','2016-03-06 13:18:41'),(6,25,'2016-03-06 13:21:16','2016-03-06 13:21:16'),(7,26,'2016-03-06 21:23:58','2016-03-06 21:23:58'),(8,27,'2016-03-07 04:00:29','2016-03-07 04:00:29'),(9,27,'2016-03-07 04:06:22','2016-03-07 04:06:22');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_groups`
--

DROP TABLE IF EXISTS `field_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_groups`
--

LOCK TABLES `field_groups` WRITE;
/*!40000 ALTER TABLE `field_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `field_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  `html_type` varchar(45) DEFAULT NULL,
  `label` varchar(45) DEFAULT NULL,
  `placeholder` varchar(45) DEFAULT NULL,
  `default_value` varchar(45) DEFAULT NULL,
  `options_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
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
INSERT INTO `schema_migrations` VALUES ('20160301181121'),('20160302114057'),('20160302114513'),('20160303124718'),('20160303124842'),('20160303232619'),('20160306130403');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stages`
--

LOCK TABLES `stages` WRITE;
/*!40000 ALTER TABLE `stages` DISABLE KEYS */;
INSERT INTO `stages` VALUES (1,'selection',2,13,'abc',1),(2,'signup',2,13,'abc',2),(3,'carview',2,13,'abc',3),(4,'index',1,1,'welcome',1),(5,'index',3,14,'def',1),(6,'selection',2,15,'def',1),(7,'signup',2,15,'def',2),(8,'carview',2,15,'def',3);
/*!40000 ALTER TABLE `stages` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitors`
--

LOCK TABLES `visitors` WRITE;
/*!40000 ALTER TABLE `visitors` DISABLE KEYS */;
INSERT INTO `visitors` VALUES (1,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-09 18:58:26',NULL,NULL,13,2,'2016-03-09 18:58:26'),(2,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-09 18:58:37',NULL,NULL,13,2,'2016-03-09 18:58:37'),(3,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-09 18:58:40',NULL,NULL,13,2,'2016-03-09 18:58:40'),(4,'/','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-09 18:58:50',NULL,NULL,1,1,'2016-03-09 18:58:50'),(5,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-09 19:20:09',NULL,NULL,1,1,'2016-03-09 19:20:09'),(6,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-09 19:24:39',NULL,NULL,14,3,'2016-03-09 19:24:39'),(7,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-09 19:25:56',NULL,NULL,14,3,'2016-03-09 19:25:56'),(8,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-09 19:32:34',NULL,NULL,14,3,'2016-03-09 19:32:34'),(9,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-10 01:38:43',NULL,NULL,NULL,2,'2016-03-10 01:38:43'),(10,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-10 01:41:44',NULL,NULL,NULL,2,'2016-03-10 01:41:44'),(11,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-10 01:42:00',NULL,NULL,13,2,'2016-03-10 01:42:00'),(12,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-10 01:43:03',NULL,NULL,13,2,'2016-03-10 01:43:03'),(13,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-10 01:44:43',NULL,NULL,13,2,'2016-03-10 01:44:43'),(14,'/','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-10 01:51:45',NULL,NULL,1,1,'2016-03-10 01:51:45'),(15,'/','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36',NULL,'2016-03-10 01:52:06',NULL,NULL,14,3,'2016-03-10 01:52:06');
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
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits`
--

LOCK TABLES `visits` WRITE;
/*!40000 ALTER TABLE `visits` DISABLE KEYS */;
INSERT INTO `visits` VALUES (1,7,2,NULL,'2016-03-04 00:21:07','2016-03-04 00:21:07'),(2,19,1,NULL,'2016-03-05 02:45:20','2016-03-05 02:45:20'),(3,19,1,NULL,'2016-03-05 02:47:03','2016-03-05 02:47:03'),(4,19,1,NULL,'2016-03-05 02:47:16','2016-03-05 02:47:16'),(5,20,1,NULL,'2016-03-05 18:55:58','2016-03-05 18:55:58'),(6,20,1,NULL,'2016-03-05 20:51:26','2016-03-05 20:51:26'),(7,20,1,NULL,'2016-03-05 21:09:23','2016-03-05 21:09:23'),(8,20,1,NULL,'2016-03-05 21:10:02','2016-03-05 21:10:02'),(9,20,1,NULL,'2016-03-05 21:10:47','2016-03-05 21:10:47'),(10,20,1,NULL,'2016-03-05 21:12:51','2016-03-05 21:12:51'),(11,20,1,NULL,'2016-03-05 21:13:30','2016-03-05 21:13:30'),(12,20,1,NULL,'2016-03-05 21:14:37','2016-03-05 21:14:37'),(13,20,1,NULL,'2016-03-05 23:58:53','2016-03-05 23:58:53'),(14,20,1,NULL,'2016-03-06 00:01:17','2016-03-06 00:01:17'),(15,20,1,NULL,'2016-03-06 00:02:42','2016-03-06 00:02:42'),(16,20,NULL,NULL,'2016-03-06 00:03:04','2016-03-06 00:03:04'),(17,20,NULL,NULL,'2016-03-06 00:04:29','2016-03-06 00:04:29'),(18,20,NULL,NULL,'2016-03-06 00:06:57','2016-03-06 00:06:57'),(19,20,NULL,NULL,'2016-03-06 00:07:18','2016-03-06 00:07:18'),(20,20,NULL,NULL,'2016-03-06 00:11:05','2016-03-06 00:11:05'),(21,20,NULL,NULL,'2016-03-06 00:14:42','2016-03-06 00:14:42'),(22,20,NULL,NULL,'2016-03-06 00:15:16','2016-03-06 00:15:16'),(23,20,NULL,NULL,'2016-03-06 00:16:10','2016-03-06 00:16:10'),(24,20,NULL,NULL,'2016-03-06 00:19:34','2016-03-06 00:19:34'),(25,25,NULL,NULL,'2016-03-06 13:01:30','2016-03-06 13:01:30'),(26,25,NULL,NULL,'2016-03-06 13:21:09','2016-03-06 13:21:09'),(27,25,NULL,NULL,'2016-03-06 13:26:28','2016-03-06 13:26:28'),(28,25,NULL,NULL,'2016-03-06 13:26:32','2016-03-06 13:26:32'),(29,27,NULL,NULL,'2016-03-07 03:57:03','2016-03-07 03:57:03'),(30,27,NULL,NULL,'2016-03-07 03:59:31','2016-03-07 03:59:31'),(31,27,NULL,NULL,'2016-03-07 04:00:12','2016-03-07 04:00:12'),(32,27,NULL,NULL,'2016-03-07 04:06:11','2016-03-07 04:06:11'),(33,27,NULL,NULL,'2016-03-07 04:18:09','2016-03-07 04:18:09'),(34,27,NULL,NULL,'2016-03-07 04:18:37','2016-03-07 04:18:37'),(35,27,NULL,NULL,'2016-03-07 04:21:33','2016-03-07 04:21:33'),(36,27,NULL,NULL,'2016-03-07 04:26:47','2016-03-07 04:26:47'),(37,27,NULL,NULL,'2016-03-07 04:43:09','2016-03-07 04:43:09'),(38,27,NULL,NULL,'2016-03-07 05:06:00','2016-03-07 05:06:00'),(39,27,NULL,NULL,'2016-03-07 05:08:03','2016-03-07 05:08:03'),(40,27,NULL,NULL,'2016-03-07 05:10:54','2016-03-07 05:10:54'),(41,27,NULL,NULL,'2016-03-07 05:12:21','2016-03-07 05:12:21'),(42,28,NULL,NULL,'2016-03-07 12:49:40','2016-03-07 12:49:40'),(43,28,NULL,NULL,'2016-03-07 12:54:23','2016-03-07 12:54:23'),(44,28,NULL,NULL,'2016-03-07 12:54:51','2016-03-07 12:54:51'),(45,29,NULL,NULL,'2016-03-08 22:45:33','2016-03-08 22:45:33'),(46,30,NULL,NULL,'2016-03-09 06:06:13','2016-03-09 06:06:13'),(47,30,NULL,NULL,'2016-03-09 06:07:10','2016-03-09 06:07:10'),(48,30,NULL,NULL,'2016-03-09 06:07:13','2016-03-09 06:07:13'),(49,31,NULL,NULL,'2016-03-09 12:54:36','2016-03-09 12:54:36'),(50,31,NULL,NULL,'2016-03-09 14:30:11','2016-03-09 14:30:11'),(51,32,NULL,NULL,'2016-03-09 14:31:38','2016-03-09 14:31:38'),(52,33,NULL,NULL,'2016-03-09 15:17:08','2016-03-09 15:17:08'),(53,33,NULL,NULL,'2016-03-09 15:21:47','2016-03-09 15:21:47'),(54,34,NULL,NULL,'2016-03-09 15:22:08','2016-03-09 15:22:08'),(55,34,NULL,NULL,'2016-03-09 15:27:24','2016-03-09 15:27:24'),(56,33,NULL,NULL,'2016-03-09 15:27:32','2016-03-09 15:27:32'),(57,34,NULL,NULL,'2016-03-09 15:27:51','2016-03-09 15:27:51'),(58,35,NULL,NULL,'2016-03-09 15:29:41','2016-03-09 15:29:41'),(59,36,NULL,NULL,'2016-03-09 15:30:39','2016-03-09 15:30:39'),(60,37,NULL,NULL,'2016-03-09 15:34:06','2016-03-09 15:34:06'),(61,40,NULL,NULL,'2016-03-09 15:38:56','2016-03-09 15:38:56'),(62,40,NULL,NULL,'2016-03-09 15:39:20','2016-03-09 15:39:20'),(63,40,NULL,NULL,'2016-03-09 15:41:42','2016-03-09 15:41:42'),(64,33,NULL,NULL,'2016-03-09 15:46:19','2016-03-09 15:46:19'),(65,33,NULL,NULL,'2016-03-09 15:46:23','2016-03-09 15:46:23'),(66,40,NULL,NULL,'2016-03-09 15:46:52','2016-03-09 15:46:52'),(67,33,NULL,NULL,'2016-03-09 15:46:57','2016-03-09 15:46:57'),(68,33,NULL,NULL,'2016-03-09 15:47:38','2016-03-09 15:47:38'),(69,33,NULL,NULL,'2016-03-09 15:48:38','2016-03-09 15:48:38'),(70,41,NULL,NULL,'2016-03-09 15:49:33','2016-03-09 15:49:33'),(71,41,NULL,NULL,'2016-03-09 15:49:39','2016-03-09 15:49:39'),(72,42,NULL,NULL,'2016-03-09 15:52:31','2016-03-09 15:52:31'),(73,43,NULL,NULL,'2016-03-09 15:52:46','2016-03-09 15:52:46'),(74,44,NULL,NULL,'2016-03-09 16:00:28','2016-03-09 16:00:28'),(75,45,NULL,NULL,'2016-03-09 16:01:39','2016-03-09 16:01:39'),(76,40,NULL,NULL,'2016-03-09 16:02:00','2016-03-09 16:02:00'),(77,45,NULL,NULL,'2016-03-09 16:02:10','2016-03-09 16:02:10'),(78,1,NULL,NULL,'2016-03-09 18:58:26','2016-03-09 18:58:26'),(79,2,NULL,NULL,'2016-03-09 18:58:37','2016-03-09 18:58:37'),(80,3,NULL,NULL,'2016-03-09 18:58:40','2016-03-09 18:58:40'),(81,4,NULL,NULL,'2016-03-09 18:58:50','2016-03-09 18:58:50'),(82,3,NULL,NULL,'2016-03-09 19:01:08','2016-03-09 19:01:08'),(83,3,NULL,NULL,'2016-03-09 19:17:31','2016-03-09 19:17:31'),(84,1,NULL,NULL,'2016-03-09 19:17:37','2016-03-09 19:17:37'),(85,4,NULL,NULL,'2016-03-09 19:17:54','2016-03-09 19:17:54'),(86,5,NULL,NULL,'2016-03-09 19:20:09','2016-03-09 19:20:09'),(87,5,NULL,NULL,'2016-03-09 19:21:26','2016-03-09 19:21:26'),(88,5,NULL,NULL,'2016-03-09 19:21:36','2016-03-09 19:21:36'),(89,5,NULL,NULL,'2016-03-09 19:22:05','2016-03-09 19:22:05'),(90,5,NULL,NULL,'2016-03-09 19:22:23','2016-03-09 19:22:23'),(91,5,NULL,NULL,'2016-03-09 19:23:36','2016-03-09 19:23:36'),(92,6,NULL,NULL,'2016-03-09 19:24:39','2016-03-09 19:24:39'),(93,7,NULL,NULL,'2016-03-09 19:25:56','2016-03-09 19:25:56'),(94,7,NULL,NULL,'2016-03-09 19:26:12','2016-03-09 19:26:12'),(95,7,NULL,NULL,'2016-03-09 19:27:54','2016-03-09 19:27:54'),(96,7,NULL,NULL,'2016-03-09 19:30:37','2016-03-09 19:30:37'),(97,7,NULL,NULL,'2016-03-09 19:30:45','2016-03-09 19:30:45'),(98,7,NULL,NULL,'2016-03-09 19:30:47','2016-03-09 19:30:47'),(99,7,NULL,NULL,'2016-03-09 19:32:27','2016-03-09 19:32:27'),(100,8,NULL,NULL,'2016-03-09 19:32:34','2016-03-09 19:32:34'),(101,8,NULL,NULL,'2016-03-09 19:34:14','2016-03-09 19:34:14'),(102,3,NULL,NULL,'2016-03-09 19:35:14','2016-03-09 19:35:14'),(103,3,NULL,NULL,'2016-03-09 19:40:41','2016-03-09 19:40:41'),(104,8,NULL,NULL,'2016-03-09 19:40:46','2016-03-09 19:40:46'),(105,4,NULL,NULL,'2016-03-09 19:40:58','2016-03-09 19:40:58'),(106,4,NULL,NULL,'2016-03-09 19:58:42','2016-03-09 19:58:42'),(107,3,NULL,NULL,'2016-03-09 19:58:47','2016-03-09 19:58:47'),(108,8,NULL,NULL,'2016-03-09 19:58:51','2016-03-09 19:58:51'),(109,8,NULL,NULL,'2016-03-09 19:58:55','2016-03-09 19:58:55'),(110,4,NULL,NULL,'2016-03-09 20:09:55','2016-03-09 20:09:55'),(111,4,NULL,NULL,'2016-03-09 20:17:36','2016-03-09 20:17:36'),(112,8,NULL,NULL,'2016-03-09 20:17:45','2016-03-09 20:17:45'),(113,8,NULL,NULL,'2016-03-09 20:17:53','2016-03-09 20:17:53'),(114,8,NULL,NULL,'2016-03-09 20:17:56','2016-03-09 20:17:56'),(115,8,NULL,NULL,'2016-03-09 20:17:58','2016-03-09 20:17:58'),(116,11,NULL,NULL,'2016-03-10 01:42:00','2016-03-10 01:42:00'),(117,12,NULL,NULL,'2016-03-10 01:43:03','2016-03-10 01:43:03'),(118,12,NULL,NULL,'2016-03-10 01:44:13','2016-03-10 01:44:13'),(119,12,NULL,NULL,'2016-03-10 01:44:31','2016-03-10 01:44:31'),(120,13,NULL,NULL,'2016-03-10 01:44:43','2016-03-10 01:44:43'),(121,13,NULL,NULL,'2016-03-10 01:46:10','2016-03-10 01:46:10'),(122,13,NULL,NULL,'2016-03-10 01:48:34','2016-03-10 01:48:34'),(123,13,NULL,NULL,'2016-03-10 01:48:43','2016-03-10 01:48:43'),(124,13,NULL,NULL,'2016-03-10 01:49:11','2016-03-10 01:49:11'),(125,13,NULL,NULL,'2016-03-10 01:49:13','2016-03-10 01:49:13'),(126,13,NULL,NULL,'2016-03-10 01:49:30','2016-03-10 01:49:30'),(127,13,NULL,NULL,'2016-03-10 01:51:29','2016-03-10 01:51:29'),(128,13,NULL,NULL,'2016-03-10 01:51:39','2016-03-10 01:51:39'),(129,14,NULL,NULL,'2016-03-10 01:51:47','2016-03-10 01:51:47'),(130,15,NULL,NULL,'2016-03-10 01:52:08','2016-03-10 01:52:08');
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

-- Dump completed on 2016-03-10  6:40:20
