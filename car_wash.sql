-- MySQL dump 10.13  Distrib 5.6.27, for osx10.11 (x86_64)
--
-- Host: localhost    Database: car_wash
-- ------------------------------------------------------
-- Server version	5.6.10

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
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registrationC` varchar(45) DEFAULT NULL,
  `modelC` varchar(45) DEFAULT NULL,
  `brandC` varchar(45) DEFAULT NULL,
  `users_idU` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`,`users_idU`),
  KEY `fk_cars_users_idx` (`users_idU`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (3,'WA8563U','Waja EVO','Proton',1,'2015-12-24 02:29:40','2015-12-25 09:54:43'),(6,'KK22332','Wira','Proton',1,'2015-12-24 05:16:42','2015-12-24 07:29:28'),(7,'S01','Spider','Ferrari',1,'2015-12-24 15:18:21','2015-12-24 15:18:21'),(8,'P9111','911 Turbo','Porsche',1,'2015-12-24 15:19:28','2015-12-24 15:23:21'),(9,'K123','SS2','Zhonda',1,'2015-12-24 16:59:48','2015-12-24 16:59:48');
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeU` varchar(45) DEFAULT NULL,
  `nameU` varchar(45) DEFAULT NULL,
  `adressU` varchar(45) DEFAULT NULL,
  `phoneU` int(11) DEFAULT NULL,
  `emailU` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Customer','Ahmad','no 23',1222232,'yakob@g.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `washing_categories`
--

DROP TABLE IF EXISTS `washing_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `washing_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `durationWC` int(11) DEFAULT NULL,
  `waterpressureWC` int(11) DEFAULT NULL,
  `dryerWC` tinyint(1) DEFAULT NULL,
  `polishWC` tinyint(1) DEFAULT NULL,
  `priceWC` int(11) DEFAULT NULL,
  `currencyWC` varchar(45) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `washing_categories`
--

LOCK TABLES `washing_categories` WRITE;
/*!40000 ALTER TABLE `washing_categories` DISABLE KEYS */;
INSERT INTO `washing_categories` VALUES (1,20,200,1,1,100,'RM','Package A');
/*!40000 ALTER TABLE `washing_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `washing_times`
--

DROP TABLE IF EXISTS `washing_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `washing_times` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateWT` varchar(10) DEFAULT NULL,
  `timeWT` varchar(6) DEFAULT NULL,
  `locationWT` varchar(45) DEFAULT NULL,
  `statusWT` varchar(45) DEFAULT NULL,
  `wash_timescol` varchar(45) DEFAULT NULL,
  `washing_categories_idWC` int(11) NOT NULL,
  `cars_idC` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`,`washing_categories_idWC`,`cars_idC`),
  KEY `fk_wash_times_washing_categories1_idx` (`washing_categories_idWC`),
  KEY `fk_wash_times_cars1_idx` (`cars_idC`),
  CONSTRAINT `fk_wash_times_washing_categories1` FOREIGN KEY (`washing_categories_idWC`) REFERENCES `washing_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `washing_times`
--

LOCK TABLES `washing_times` WRITE;
/*!40000 ALTER TABLE `washing_times` DISABLE KEYS */;
INSERT INTO `washing_times` VALUES (1,'12/25/2015','10AM','1.5620999866081733 , 103.62813167273998','NNN',NULL,1,6,'2015-12-25 03:20:16','2015-12-25 06:10:26'),(2,'12/25/2015','10AM','1.5635585655465163 , 103.62718753516674','New',NULL,1,9,'2015-12-25 03:48:15','2015-12-25 03:48:15'),(8,'12/26/2015','8AM','1.5634727668134958 , 103.62731628119946','New',NULL,1,8,'2015-12-25 05:50:45','2015-12-25 05:50:45'),(12,'12/26/2015','10AM','-12.047207787378563 , -77.02113457024097','New',NULL,1,1,'2015-12-25 08:52:30','2015-12-25 08:52:30'),(13,'12/26/2015','10AM','-12.04716581720013 , -77.0179159194231','New',NULL,1,3,'2015-12-25 08:57:16','2015-12-25 08:57:16'),(14,'12/26/2015','10AM','-12.045319122854156 , -77.02061958611012','New',NULL,1,9,'2015-12-25 08:58:18','2015-12-25 08:58:18'),(15,'12/26/2015','10AM','-12.045319122854156 , -77.02061958611012','New',NULL,1,9,'2015-12-25 08:59:41','2015-12-25 08:59:41'),(16,'12/26/2015','10AM','1.563917386870048 , 103.6266342876479','New',NULL,1,9,'2015-12-25 09:01:17','2015-12-25 09:01:17'),(17,'12/26/2015','10AM','-12.047291727715722 , -77.01963253319263','New',NULL,1,9,'2015-12-25 09:11:56','2015-12-25 09:11:56'),(18,'12/26/2015','10AM','-12.049180378362935 , -77.01924629509449','New',NULL,1,9,'2015-12-25 09:13:48','2015-12-25 09:13:48'),(19,'12/26/2015','10AM','1.5642020559324754 , 103.62864665687084','New',NULL,1,9,'2015-12-25 09:14:33','2015-12-25 09:14:33');
/*!40000 ALTER TABLE `washing_times` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-26 14:25:53
