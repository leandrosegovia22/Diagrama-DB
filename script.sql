CREATE DATABASE  IF NOT EXISTS `Diagrama` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Diagrama`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: Diagrama
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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Drama'),(2,'Drama|Horror|Thriller'),(3,'Action|Sci-Fi'),(4,'Action|Comedy|Crime|Drama|Thriller'),(5,'Drama|Romance'),(6,'Comedy|Romance'),(7,'Action|Comedy|Crime|Thriller'),(8,'Crime|Thriller'),(9,'Drama'),(10,'Drama');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_modificacion` date NOT NULL,
  `eliminacion` tinyint NOT NULL,
  `usuarios_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_notas_usuarios1_idx` (`usuarios_id`),
  CONSTRAINT `fk_notas_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO `notas` VALUES (1,'Filbert Nut Meat','Bypass Left Ureter to Bladder with Nonautologous Tissue Substitute, Open Approach','2021-08-25','2020-09-23',0,1),(2,'Buspirone hydrochloride','Drainage of Peritoneal Cavity, Percutaneous Endoscopic Approach, Diagnostic','2021-06-08','2021-04-10',1,2),(3,'Torsemide','Replacement of Buccal Mucosa with Nonautologous Tissue Substitute, External Approach','2020-09-05','2021-01-19',0,3),(4,'Azithromycin','Destruction of Right Parotid Duct, Open Approach','2020-12-01','2020-09-11',0,4),(5,'lithium carbonate','Change Cast on Left Toe','2021-02-24','2021-05-27',1,5),(6,'Naproxen sodium','Drainage of Left Humeral Shaft with Drainage Device, Percutaneous Endoscopic Approach','2021-05-24','2021-02-03',0,6),(7,'Benazepril Hydrochloride','Introduction of Platelet Inhibitor into Peripheral Artery, Percutaneous Approach','2020-11-29','2021-01-25',1,7),(8,'Danazol','Supplement Left Upper Extremity Bursa and Ligament with Nonautologous Tissue Substitute, Percutaneous Endoscopic Approach','2020-12-18','2021-03-17',1,8),(9,'metoprolol tartrate','Alteration of Right Upper Eyelid with Autologous Tissue Substitute, Open Approach','2020-11-30','2020-09-05',1,9),(10,'ERYTHROMYCIN ETHYLSUCCINATE AND SULFISOXAZOLE ACETYL','Dilation of Right Brachial Artery, Bifurcation, with Four or More Intraluminal Devices, Open Approach','2021-07-13','2021-01-17',1,10);
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas_categorias`
--

DROP TABLE IF EXISTS `notas_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas_categorias` (
  `notas_id` int NOT NULL,
  `categorias_id` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_notas_has_categorias_categorias1_idx` (`categorias_id`),
  KEY `fk_notas_has_categorias_notas1_idx` (`notas_id`),
  CONSTRAINT `fk_notas_has_categorias_categorias1` FOREIGN KEY (`categorias_id`) REFERENCES `categorias` (`id`),
  CONSTRAINT `fk_notas_has_categorias_notas1` FOREIGN KEY (`notas_id`) REFERENCES `notas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas_categorias`
--

LOCK TABLES `notas_categorias` WRITE;
/*!40000 ALTER TABLE `notas_categorias` DISABLE KEYS */;
INSERT INTO `notas_categorias` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10);
/*!40000 ALTER TABLE `notas_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Terrence','toke0@cafepress.com'),(2,'Krystyna','keliyahu1@networksolutions.com'),(3,'Cecile','chands2@sphinn.com'),(4,'Chickie','ckedslie3@free.fr'),(5,'Ardra','amatonin4@hc360.com'),(6,'Tucky','tcazin5@blogger.com'),(7,'Chandra','calaway6@people.com.cn'),(8,'Belita','belleyne7@booking.com'),(9,'Wainwright','wlemary8@moonfruit.com'),(10,'Jasmine','jdelacourt9@friendfeed.com');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-01 18:16:23
