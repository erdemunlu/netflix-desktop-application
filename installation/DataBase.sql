-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: netflixdb
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `kullaniciprogramtablosu`
--

DROP TABLE IF EXISTS `kullaniciprogramtablosu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kullaniciprogramtablosu` (
  `KullaniciId` int NOT NULL,
  `ProgramId` int NOT NULL,
  `IzlemeTarihi` date NOT NULL,
  `IzlemeSuresi` int NOT NULL,
  `KaldigiBolum` int NOT NULL,
  `Puan` int NOT NULL,
  KEY `KullaniciId` (`KullaniciId`),
  KEY `ProgramId` (`ProgramId`),
  CONSTRAINT `kullaniciprogramtablosu_ibfk_1` FOREIGN KEY (`KullaniciId`) REFERENCES `kullanicitablosu` (`Id`),
  CONSTRAINT `kullaniciprogramtablosu_ibfk_2` FOREIGN KEY (`ProgramId`) REFERENCES `programtablosu` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kullaniciprogramtablosu`
--

LOCK TABLES `kullaniciprogramtablosu` WRITE;
/*!40000 ALTER TABLE `kullaniciprogramtablosu` DISABLE KEYS */;
/*!40000 ALTER TABLE `kullaniciprogramtablosu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kullanicitablosu`
--

DROP TABLE IF EXISTS `kullanicitablosu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kullanicitablosu` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Isim` varchar(255) NOT NULL,
  `SoyIsim` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Sifre` varchar(255) NOT NULL,
  `DogumTarihi` date DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kullanicitablosu`
--

LOCK TABLES `kullanicitablosu` WRITE;
/*!40000 ALTER TABLE `kullanicitablosu` DISABLE KEYS */;
/*!40000 ALTER TABLE `kullanicitablosu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programtablosu`
--

DROP TABLE IF EXISTS `programtablosu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programtablosu` (
  `Id` int NOT NULL,
  `Isim` varchar(255) NOT NULL,
  `Tip` varchar(255) NOT NULL,
  `BolumSayisi` int NOT NULL,
  `ProgramUzunlugu` int NOT NULL,
  `Puan` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programtablosu`
--

LOCK TABLES `programtablosu` WRITE;
/*!40000 ALTER TABLE `programtablosu` DISABLE KEYS */;
INSERT INTO `programtablosu` VALUES (1,'Recep Ivedik 6','Film',1,110,3),(2,'Assasins Creed','Film',1,140,9),(3,'Alacakaranlik','Film',1,126,4),(4,'Yuzuklerin Efendisi Kralin Donusu','Film',1,251,8),(5,'Interstellar','Film',1,169,1),(6,'Harry Potter ve Melez Prens','Film',1,154,7),(7,'Aydaki Son Adam','Film',1,96,2),(8,'Plastik Okyanus','Film',1,102,6),(9,'Arif V 216','Film',1,126,3),(10,'Pk','Film',1,153,3),(11,'Victor Frankenstein','Film',1,110,7),(12,'Charlienin Cikolata Fabrikasi','Film',1,115,3),(13,'Alvin ve Sincaplar','Film',1,92,5),(14,'Kung Fu Panda','Film',1,95,2),(15,'Shrek','Film',1,95,7),(16,'Bizi Hatirla','Film',1,120,1),(17,'Delibal','Film',1,117,6),(18,'Kardesim Benim','Film',1,120,3),(19,'Dangal','Film',1,169,3),(20,'Yer Cekimi','Film',1,91,3),(21,'Jaws','Film',1,130,8),(22,'Da Vinci Sifresi','Film',1,174,3),(23,'Iron Fist','Dizi',23,60,5),(24,'Dirilis Ertugrul','Dizi',150,120,8),(25,'Trol Avcilari: Arcadia Hikayeleri','Dizi',52,20,4),(26,'How I Met Your Mother','Dizi',208,20,9),(27,'Leyla ile Mecnun','Dizi',93,60,9),(28,'Beni Boyle Sev','Dizi',89,90,5),(29,'Patron Bebek Yine Is Basinda','Dizi',37,20,3),(30,'Atiye','Dizi',8,40,8),(31,'Masha And The Bear','Dizi',25,20,3),(32,'The Originals','Dizi',37,40,8),(33,'Beyblade','Dizi',51,20,7),(34,'Sonic X','Dizi',52,20,6),(35,'Dunyanin En Siradisi Evleri','TV Show',12,40,4),(36,'Car Masters','TV Show',16,40,3),(37,'The Big Family Cooking','TV Show',26,60,3);
/*!40000 ALTER TABLE `programtablosu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programturtablosu`
--

DROP TABLE IF EXISTS `programturtablosu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programturtablosu` (
  `ProgramId` int NOT NULL,
  `TurId` int NOT NULL,
  KEY `ProgramId` (`ProgramId`),
  KEY `TurId` (`TurId`),
  CONSTRAINT `programturtablosu_ibfk_1` FOREIGN KEY (`ProgramId`) REFERENCES `programtablosu` (`Id`),
  CONSTRAINT `programturtablosu_ibfk_2` FOREIGN KEY (`TurId`) REFERENCES `turtablosu` (`TurId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programturtablosu`
--

LOCK TABLES `programturtablosu` WRITE;
/*!40000 ALTER TABLE `programturtablosu` DISABLE KEYS */;
INSERT INTO `programturtablosu` VALUES (1,1),(2,1),(2,2),(3,1),(3,3),(4,1),(4,2),(5,1),(5,4),(6,1),(6,2),(6,5),(7,6),(8,6),(9,2),(9,7),(10,2),(10,3),(11,1),(11,2),(11,8),(12,5),(12,7),(13,5),(14,1),(14,5),(15,5),(15,7),(16,4),(17,3),(17,4),(18,4),(18,7),(19,4),(20,2),(20,4),(21,10),(22,10),(23,1),(24,1),(25,1),(25,5),(26,3),(27,3),(28,3),(28,4),(29,5),(29,7),(30,1),(30,3),(31,5),(32,4),(32,8),(33,5),(33,11),(34,1),(34,11),(35,12),(36,12),(37,12);
/*!40000 ALTER TABLE `programturtablosu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turtablosu`
--

DROP TABLE IF EXISTS `turtablosu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turtablosu` (
  `TurId` int NOT NULL,
  `Isim` varchar(255) NOT NULL,
  PRIMARY KEY (`TurId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turtablosu`
--

LOCK TABLES `turtablosu` WRITE;
/*!40000 ALTER TABLE `turtablosu` DISABLE KEYS */;
INSERT INTO `turtablosu` VALUES (1,'Aksiyon ve Macera'),(2,'Bilimkurgu ve Fantastik'),(3,'Romantik'),(4,'Drama'),(5,'Cocuk ve Aile'),(6,'Belgesel'),(7,'Komedi'),(8,'Korku'),(9,'Bilim ve Doga'),(10,'Gerilim'),(11,'Anime'),(12,'Reality Program');
/*!40000 ALTER TABLE `turtablosu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-11 18:28:35
