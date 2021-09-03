CREATE DATABASE  IF NOT EXISTS `cekiai` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cekiai`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: cekiai
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cekiai`
--

DROP TABLE IF EXISTS `cekiai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cekiai` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `pardavejai_id` int NOT NULL,
  `mokejimu_tipai_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cekiai_pardavejai_idx` (`pardavejai_id`),
  KEY `fk_cekiai_mokejimu_tipai_idx` (`mokejimu_tipai_id`),
  CONSTRAINT `fk_cekiai_mokejimu_tipai` FOREIGN KEY (`mokejimu_tipai_id`) REFERENCES `mokejimu_tipai` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_cekiai_pardavejai` FOREIGN KEY (`pardavejai_id`) REFERENCES `parduotuves` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `islaidu_tipai`
--

DROP TABLE IF EXISTS `islaidu_tipai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `islaidu_tipai` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pavadinimas` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mokejimu_tipai`
--

DROP TABLE IF EXISTS `mokejimu_tipai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mokejimu_tipai` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pavadinimas` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parduotuves`
--

DROP TABLE IF EXISTS `parduotuves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parduotuves` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pavadinimas` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prekes`
--

DROP TABLE IF EXISTS `prekes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prekes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pavadinimas` varchar(255) COLLATE utf8_bin NOT NULL,
  `kaina` decimal(10,2) unsigned NOT NULL,
  `cekiai_id` int NOT NULL,
  `islaidu_tipai_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_prekes_cekiai_idx` (`cekiai_id`),
  KEY `fk_prekes_islaidu_tipai_idx` (`islaidu_tipai_id`),
  CONSTRAINT `fk_prekes_cekiai` FOREIGN KEY (`cekiai_id`) REFERENCES `cekiai` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_prekes_islaidu_tipai` FOREIGN KEY (`islaidu_tipai_id`) REFERENCES `islaidu_tipai` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-03 10:27:02
