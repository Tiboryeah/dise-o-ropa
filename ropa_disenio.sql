-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: ropa_disenio
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `archivo_diseno`
--

DROP TABLE IF EXISTS `archivo_diseno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `archivo_diseno` (
  `Archivo_ID` int NOT NULL AUTO_INCREMENT,
  `Diseno_ID` int DEFAULT NULL,
  `Usuario_ID` int DEFAULT NULL,
  `Nombre_Archivo` varchar(255) DEFAULT NULL,
  `Ruta_Archivo` varchar(255) DEFAULT NULL,
  `Fecha_Guardado` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Archivo_ID`),
  KEY `Diseno_ID` (`Diseno_ID`),
  KEY `Usuario_ID` (`Usuario_ID`),
  CONSTRAINT `archivo_diseno_ibfk_1` FOREIGN KEY (`Diseno_ID`) REFERENCES `diseno` (`Diseno_ID`),
  CONSTRAINT `archivo_diseno_ibfk_2` FOREIGN KEY (`Usuario_ID`) REFERENCES `cuenta` (`Usuario_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivo_diseno`
--

LOCK TABLES `archivo_diseno` WRITE;
/*!40000 ALTER TABLE `archivo_diseno` DISABLE KEYS */;
INSERT INTO `archivo_diseno` VALUES (1,1,1,'floral_diseño.png','/archivos/maria/floral_diseño.png','2024-11-01 20:55:28'),(2,6,2,'minimalista_blanco.png','/archivos/juan/minimalista_blanco.png','2024-11-01 20:55:28'),(3,11,3,'geometrico_diseño.png','/archivos/ana/geometrico_diseño.png','2024-11-01 20:55:28'),(4,16,4,'elegancia_negra.png','/archivos/luis/elegancia_negra.png','2024-11-01 20:55:28'),(5,21,5,'flores_primaverales.png','/archivos/carmen/flores_primaverales.png','2024-11-01 20:55:28');
/*!40000 ALTER TABLE `archivo_diseno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuenta` (
  `Usuario_ID` int NOT NULL,
  `Contrasena` varchar(255) DEFAULT NULL,
  `Activa` tinyint(1) DEFAULT NULL,
  `Admin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Usuario_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
INSERT INTO `cuenta` VALUES (1,'pass123',1,0),(2,'abc123',1,0),(3,'designme',1,0),(4,'stylish99',1,0),(5,'password1',1,0);
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disenador`
--

DROP TABLE IF EXISTS `disenador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disenador` (
  `Disenador_ID` int NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Usuario_ID` int DEFAULT NULL,
  PRIMARY KEY (`Disenador_ID`),
  KEY `Usuario_ID` (`Usuario_ID`),
  CONSTRAINT `disenador_ibfk_1` FOREIGN KEY (`Usuario_ID`) REFERENCES `cuenta` (`Usuario_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disenador`
--

LOCK TABLES `disenador` WRITE;
/*!40000 ALTER TABLE `disenador` DISABLE KEYS */;
INSERT INTO `disenador` VALUES (1,'Maria Lopez','maria.lopez@example.com',1),(2,'Juan Perez','juan.perez@example.com',2),(3,'Ana Torres','ana.torres@example.com',3),(4,'Luis Gomez','luis.gomez@example.com',4),(5,'Carmen Diaz','carmen.diaz@example.com',5);
/*!40000 ALTER TABLE `disenador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diseno`
--

DROP TABLE IF EXISTS `diseno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diseno` (
  `Diseno_ID` int NOT NULL,
  `Diseno_name` varchar(255) DEFAULT NULL,
  `Diseno_date` date DEFAULT NULL,
  `Color` varchar(50) DEFAULT NULL,
  `Talla` varchar(50) DEFAULT NULL,
  `Prenda_ID` int DEFAULT NULL,
  `Disenador_ID` int DEFAULT NULL,
  PRIMARY KEY (`Diseno_ID`),
  KEY `Prenda_ID` (`Prenda_ID`),
  KEY `Disenador_ID` (`Disenador_ID`),
  CONSTRAINT `diseno_ibfk_1` FOREIGN KEY (`Prenda_ID`) REFERENCES `prenda` (`Prenda_ID`),
  CONSTRAINT `diseno_ibfk_2` FOREIGN KEY (`Disenador_ID`) REFERENCES `disenador` (`Disenador_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diseno`
--

LOCK TABLES `diseno` WRITE;
/*!40000 ALTER TABLE `diseno` DISABLE KEYS */;
INSERT INTO `diseno` VALUES (1,'Diseño Floral','2024-01-01','Rojo','M',1,1),(2,'Rayas Elegantes','2024-01-05','Azul','L',2,1),(3,'Vintage Chic','2024-01-10','Negro','S',3,1),(4,'Casual Verde','2024-01-12','Verde','M',4,1),(5,'Verano Tropical','2024-01-15','Amarillo','L',1,1),(6,'Minimalista Blanco','2024-02-01','Blanco','L',5,2),(7,'Grafiti Urbano','2024-02-03','Negro','M',2,2),(8,'Vintage Denim','2024-02-06','Azul','S',4,2),(9,'Años 80','2024-02-10','Rosa','M',3,2),(10,'Boho Chic','2024-02-12','Verde','L',1,2),(11,'Geométrico','2024-03-01','Azul','S',2,3),(12,'Clásico Blanco','2024-03-05','Blanco','M',5,3),(13,'Tonos Pastel','2024-03-10','Lila','L',1,3),(14,'Safari','2024-03-12','Caqui','M',4,3),(15,'Étnico','2024-03-15','Naranja','S',3,3),(16,'Elegancia Negra','2024-04-01','Negro','L',1,4),(17,'Retro Pop','2024-04-05','Rojo','M',3,4),(18,'Urban Style','2024-04-10','Gris','L',2,4),(19,'Camuflaje','2024-04-12','Verde','S',5,4),(20,'Brillante','2024-04-15','Dorado','M',4,4),(21,'Flores Primaverales','2024-05-01','Rosa','M',1,5),(22,'Abstracto','2024-05-03','Azul','L',3,5),(23,'Galaxia','2024-05-06','Morado','S',2,5),(24,'Formal Negro','2024-05-10','Negro','L',5,5),(25,'Rústico','2024-05-12','Marrón','M',4,5);
/*!40000 ALTER TABLE `diseno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_descargas`
--

DROP TABLE IF EXISTS `historial_descargas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_descargas` (
  `Descarga_ID` int NOT NULL AUTO_INCREMENT,
  `Archivo_ID` int DEFAULT NULL,
  `Usuario_ID` int DEFAULT NULL,
  `Fecha_Descarga` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Descarga_ID`),
  KEY `Archivo_ID` (`Archivo_ID`),
  KEY `Usuario_ID` (`Usuario_ID`),
  CONSTRAINT `historial_descargas_ibfk_1` FOREIGN KEY (`Archivo_ID`) REFERENCES `archivo_diseno` (`Archivo_ID`),
  CONSTRAINT `historial_descargas_ibfk_2` FOREIGN KEY (`Usuario_ID`) REFERENCES `cuenta` (`Usuario_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_descargas`
--

LOCK TABLES `historial_descargas` WRITE;
/*!40000 ALTER TABLE `historial_descargas` DISABLE KEYS */;
INSERT INTO `historial_descargas` VALUES (1,1,1,'2024-02-01 10:30:00'),(2,2,2,'2024-02-02 15:00:00'),(3,3,3,'2024-02-03 12:00:00'),(4,4,4,'2024-02-04 18:00:00'),(5,5,5,'2024-02-05 09:30:00');
/*!40000 ALTER TABLE `historial_descargas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prenda`
--

DROP TABLE IF EXISTS `prenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prenda` (
  `Prenda_ID` int NOT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Prenda_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prenda`
--

LOCK TABLES `prenda` WRITE;
/*!40000 ALTER TABLE `prenda` DISABLE KEYS */;
INSERT INTO `prenda` VALUES (1,'Camiseta','Disponible'),(2,'Sudadera','Disponible'),(3,'Pantalón','Disponible'),(4,'Chaqueta','Disponible'),(5,'Vestido','Disponible');
/*!40000 ALTER TABLE `prenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version_diseno`
--

DROP TABLE IF EXISTS `version_diseno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `version_diseno` (
  `Version_ID` int NOT NULL AUTO_INCREMENT,
  `Archivo_ID` int DEFAULT NULL,
  `Version_Numero` int DEFAULT NULL,
  `Fecha_Version` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Version_ID`),
  KEY `Archivo_ID` (`Archivo_ID`),
  CONSTRAINT `version_diseno_ibfk_1` FOREIGN KEY (`Archivo_ID`) REFERENCES `archivo_diseno` (`Archivo_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version_diseno`
--

LOCK TABLES `version_diseno` WRITE;
/*!40000 ALTER TABLE `version_diseno` DISABLE KEYS */;
/*!40000 ALTER TABLE `version_diseno` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-01 15:05:54
