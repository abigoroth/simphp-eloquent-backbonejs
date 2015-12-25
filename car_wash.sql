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
  KEY `fk_cars_users_idx` (`users_idU`),
  CONSTRAINT `fk_cars_users` FOREIGN KEY (`users_idU`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (3,'WA8563','Waja EVO','Proton',1,'2015-12-24 02:29:40','2015-12-24 05:20:46'),(6,'KK22332','Wira','Proton',1,'2015-12-24 05:16:42','2015-12-24 07:29:28'),(7,'S01','Spider','Ferrari',1,'2015-12-24 15:18:21','2015-12-24 15:18:21'),(8,'P9111','911 Turbo','Porsche',1,'2015-12-24 15:19:28','2015-12-24 15:23:21'),(9,'K123','SS2','Zhonda',1,'2015-12-24 16:59:48','2015-12-24 16:59:48');
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
  `id` int(11) NOT NULL,
  `durationWC` int(11) DEFAULT NULL,
  `waterpressureWC` int(11) DEFAULT NULL,
  `dryerWC` tinyint(1) DEFAULT NULL,
  `polishWC` tinyint(1) DEFAULT NULL,
  `priceWC` int(11) DEFAULT NULL,
  `currencyWC` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `washing_categories`
--

LOCK TABLES `washing_categories` WRITE;
/*!40000 ALTER TABLE `washing_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `washing_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `washing_times`
--

DROP TABLE IF EXISTS `washing_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `washing_times` (
  `id` int(11) NOT NULL,
  `dateWT` varchar(10) DEFAULT NULL,
  `timeWT` varchar(6) DEFAULT NULL,
  `locationWT` varchar(45) DEFAULT NULL,
  `statusWT` varchar(45) DEFAULT NULL,
  `wash_timescol` varchar(45) DEFAULT NULL,
  `washing_categories_idWC` int(11) NOT NULL,
  `cars_idC` int(11) NOT NULL,
  `cars_users_idU` int(11) NOT NULL,
  PRIMARY KEY (`id`,`washing_categories_idWC`,`cars_idC`,`cars_users_idU`),
  KEY `fk_wash_times_washing_categories1_idx` (`washing_categories_idWC`),
  KEY `fk_wash_times_cars1_idx` (`cars_idC`,`cars_users_idU`),
  CONSTRAINT `fk_wash_times_washing_categories1` FOREIGN KEY (`washing_categories_idWC`) REFERENCES `washing_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_wash_times_cars1` FOREIGN KEY (`cars_idC`, `cars_users_idU`) REFERENCES `cars` (`id`, `users_idU`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `washing_times`
--

LOCK TABLES `washing_times` WRITE;
/*!40000 ALTER TABLE `washing_times` DISABLE KEYS */;
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

-- Dump completed on 2015-12-25  9:23:26
