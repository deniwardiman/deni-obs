-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: deni_obs
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `ranks`
--

DROP TABLE IF EXISTS `ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ranks` (
  `id` varchar(36) NOT NULL,
  `department` varchar(50) DEFAULT NULL,
  `student` varchar(100) DEFAULT NULL,
  `mark` varchar(255) DEFAULT NULL,
  `pass` double DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` bit(1) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `updated_by` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ranks`
--

LOCK TABLES `ranks` WRITE;
/*!40000 ALTER TABLE `ranks` DISABLE KEYS */;
INSERT INTO `ranks` VALUES ('004c26c0-f9da-4f53-8d4f-5832c002a4d9','department 1','Alexander','25',75,'2023-05-28 17:52:43',_binary '\0',NULL,NULL,NULL),('0f97013a-969d-45e2-83cd-ee96f3fd3f2e','department 1','Olivia','23',75,'2023-05-28 15:59:24',_binary '\0',NULL,NULL,NULL),('2ec5c00e-a17b-46f0-8c97-390c46986745','department 1','Arthur','60',75,'2023-05-28 15:59:24',_binary '\0',NULL,NULL,NULL),('2f599a2a-e571-4db1-befc-62424db66509','department 1','Victoria','90',75,'2023-05-28 15:59:24',_binary '\0',NULL,NULL,NULL),('4e5e27d8-15f8-48a6-a577-0925789b9f24','department 1','Mia','63',75,'2023-05-28 17:52:44',_binary '\0',NULL,NULL,NULL),('5b478ae0-25f2-44dd-9dcd-59e6a5d27b95','department 2','Noah','42',0,'2023-05-28 17:52:48',_binary '\0',NULL,NULL,NULL),('714f5e1c-7b39-4c79-a021-ebb54fb03547','department 2','Jade','32',0,'2023-05-28 17:52:46',_binary '\0',NULL,NULL,NULL),('76e85239-1330-40d5-b7eb-1905f23fba25','department 3','Jack','96',33.33,'2023-05-28 17:52:53',_binary '\0',NULL,NULL,NULL),('91817762-9d43-4090-9f2b-19292757a649','department 2','Maria','12',0,'2023-05-28 17:52:49',_binary '\0',NULL,NULL,NULL),('b87c05ab-e620-402c-9f37-b4863c5033ba','department 3','Giorgos','64',33.33,'2023-05-28 17:52:50',_binary '\0',NULL,NULL,NULL),('b87c05ab-e620-402c-9f37-b4863c5033bb','department 3','Grace','86',33.33,'2023-05-28 17:53:02',_binary '\0',NULL,NULL,NULL),('e51fce99-f7eb-4044-a861-6cededf763bc','department 2','Gabriel','86',0,'2023-05-28 17:52:47',_binary '\0',NULL,NULL,NULL),('f8ca0726-74d8-443a-8023-f385d2109144','department 2','Luca','75',0,'2023-05-28 17:52:45',_binary '\0',NULL,NULL,NULL);
/*!40000 ALTER TABLE `ranks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-28 18:09:17
