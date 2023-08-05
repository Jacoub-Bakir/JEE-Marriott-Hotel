CREATE DATABASE  IF NOT EXISTS `tourisme` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tourisme`;
-- MySQL dump 10.13  Distrib 8.0.27, for macos11 (x86_64)
--
-- Host: localhost    Database: tourisme
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `activite`
--

DROP TABLE IF EXISTS `activite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activite` (
  `nom` varchar(50) NOT NULL,
  `capacite` int NOT NULL,
  `place_libres` int NOT NULL,
  `date_activite` datetime NOT NULL,
  PRIMARY KEY (`nom`),
  CONSTRAINT `CHK_capacite` CHECK ((`capacite` >= `place_libres`)),
  CONSTRAINT `CHK_greatThanZero` CHECK (((`capacite` >= 0) and (`place_libres` >= 0)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activite`
--

LOCK TABLES `activite` WRITE;
/*!40000 ALTER TABLE `activite` DISABLE KEYS */;
INSERT INTO `activite` VALUES ('allmand',75,53,'2022-05-02 17:20:58'),('arabic',190,14,'2022-04-20 17:23:00'),('bascketball',14,14,'2022-01-31 01:08:15'),('Booking',250,250,'2022-04-26 01:28:57'),('Boxing',200,200,'2022-01-01 01:05:57'),('Coding',1000,364,'2021-12-30 01:52:22'),('CSS Battle',45,11,'2021-12-04 01:32:36'),('cube',10,8,'2010-02-05 10:00:00'),('english',150,100,'2022-01-10 16:10:10'),('football',11,0,'2020-02-01 11:00:00'),('french',150,134,'2022-04-16 12:00:00'),('Hacker Rank',50,8,'2021-12-04 01:41:30'),('handball',7,4,'2022-03-10 21:00:00'),('JUDO',300,150,'2021-12-20 01:10:00'),('Rugby',22,19,'2022-02-02 00:49:29'),('Ski',50,50,'2021-12-26 01:22:45'),('spanish',200,145,'2021-12-13 17:05:00'),('Start Coding Club',120,110,'2021-05-28 18:26:00'),('Swiming',100,78,'2022-04-02 00:50:56');
/*!40000 ALTER TABLE `activite` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `activite_AFTER_INSERT` AFTER INSERT ON `activite` FOR EACH ROW BEGIN
DECLARE leVisiteur VARCHAR(50);
DECLARE finished INTEGER DEFAULT 0; 
DECLARE cursor_visiteur CURSOR FOR 
SELECT nomSpectateur 
FROM reserve_activite;
DECLARE CONTINUE HANDLER 
FOR NOT FOUND SET finished = 1;
OPEN cursor_visiteur;
FETCH NEXT FROM cursor_visiteur INTO leVisiteur;
visiteur_loop: LOOP	
	FETCH NEXT FROM cursor_visiteur INTO leVisiteur;
    IF finished = 1 THEN LEAVE visiteur_loop;
    END IF;
    
	INSERT INTO Publicite (activite , visiteur, date_activite) VALUES (NEW.nom, leVisiteur , NEW.date_activite);
	
END LOOP;
CLOSE cursor_visiteur;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `activiteparsite`
--

DROP TABLE IF EXISTS `activiteparsite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activiteparsite` (
  `nomsite` varchar(50) NOT NULL,
  `nomactivite` varchar(50) NOT NULL,
  KEY `nomactivite_idx` (`nomactivite`),
  KEY `nomsite_idx` (`nomsite`),
  CONSTRAINT `nomactivite` FOREIGN KEY (`nomactivite`) REFERENCES `activite` (`nom`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `nomsite` FOREIGN KEY (`nomsite`) REFERENCES `sitetouristique` (`nom`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activiteparsite`
--

LOCK TABLES `activiteparsite` WRITE;
/*!40000 ALTER TABLE `activiteparsite` DISABLE KEYS */;
/*!40000 ALTER TABLE `activiteparsite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Annulation`
--

DROP TABLE IF EXISTS `Annulation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Annulation` (
  `visiteur` varchar(50) NOT NULL,
  `hotel` varchar(50) NOT NULL,
  `chambre` int NOT NULL,
  `date_debut` timestamp NOT NULL,
  PRIMARY KEY (`visiteur`,`hotel`,`chambre`,`date_debut`),
  KEY `nomHotel_idx` (`hotel`),
  KEY `nomHotelAnnule_idx` (`hotel`),
  KEY `roomNumber_idx` (`chambre`),
  CONSTRAINT `nomHotelAnnule` FOREIGN KEY (`hotel`) REFERENCES `hotel` (`nom`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `nomVisiteurAnnule` FOREIGN KEY (`visiteur`) REFERENCES `visiteur` (`nomVisiteur`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roomNumber` FOREIGN KEY (`chambre`) REFERENCES `chambre` (`numero`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Annulation`
--

LOCK TABLES `Annulation` WRITE;
/*!40000 ALTER TABLE `Annulation` DISABLE KEYS */;
/*!40000 ALTER TABLE `Annulation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus`
--

DROP TABLE IF EXISTS `bus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bus` (
  `ligne` int NOT NULL,
  `horaire` varchar(10) NOT NULL,
  PRIMARY KEY (`ligne`,`horaire`),
  KEY `horaire_sueSite_idx` (`horaire`),
  KEY `ligne_surSite` (`ligne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus`
--

LOCK TABLES `bus` WRITE;
/*!40000 ALTER TABLE `bus` DISABLE KEYS */;
/*!40000 ALTER TABLE `bus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chambre`
--

DROP TABLE IF EXISTS `chambre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chambre` (
  `numero` int NOT NULL,
  `hotel` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `prix` float NOT NULL,
  `nmbrPersonne` int NOT NULL,
  PRIMARY KEY (`numero`,`hotel`),
  KEY `chambreHotel_idx` (`hotel`),
  CONSTRAINT `chambreHotel` FOREIGN KEY (`hotel`) REFERENCES `hotel` (`nom`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chambre`
--

LOCK TABLES `chambre` WRITE;
/*!40000 ALTER TABLE `chambre` DISABLE KEYS */;
INSERT INTO `chambre` VALUES (1,'Magic','in front of the sea',100000,4),(2,'Magic','without windows',45000,2);
/*!40000 ALTER TABLE `chambre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dessert_hotel`
--

DROP TABLE IF EXISTS `dessert_hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dessert_hotel` (
  `ligne_bus` int NOT NULL,
  `nomhotel` varchar(50) NOT NULL,
  `horaire_bus` varchar(10) NOT NULL,
  UNIQUE KEY `ligne_bus_UNIQUE` (`ligne_bus`),
  KEY `nomhotel_idx` (`nomhotel`),
  KEY `horaire` (`horaire_bus`),
  CONSTRAINT `horaire_bus` FOREIGN KEY (`horaire_bus`) REFERENCES `bus` (`horaire`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ligne_bus` FOREIGN KEY (`ligne_bus`) REFERENCES `bus` (`ligne`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `nomhotel` FOREIGN KEY (`nomhotel`) REFERENCES `hotel` (`nom`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dessert_hotel`
--

LOCK TABLES `dessert_hotel` WRITE;
/*!40000 ALTER TABLE `dessert_hotel` DISABLE KEYS */;
/*!40000 ALTER TABLE `dessert_hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dessert_site`
--

DROP TABLE IF EXISTS `dessert_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dessert_site` (
  `bus_ligne` int NOT NULL,
  `bus_horaire` varchar(10) NOT NULL,
  `site` varchar(50) NOT NULL,
  KEY `site_idx` (`site`),
  KEY `bus_ligne_idx` (`bus_ligne`),
  KEY `bus_horaire_idx` (`bus_horaire`),
  CONSTRAINT `bus_horaire` FOREIGN KEY (`bus_horaire`) REFERENCES `bus` (`horaire`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bus_ligne` FOREIGN KEY (`bus_ligne`) REFERENCES `bus` (`ligne`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `siteTouristique` FOREIGN KEY (`site`) REFERENCES `sitetouristique` (`nom`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dessert_site`
--

LOCK TABLES `dessert_site` WRITE;
/*!40000 ALTER TABLE `dessert_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `dessert_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
  `nom` varchar(50) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `codepostal` varchar(45) NOT NULL,
  `ville` varchar(45) NOT NULL,
  `etoiles` int NOT NULL,
  `capacite` int NOT NULL,
  `disponible` int NOT NULL,
  PRIMARY KEY (`nom`),
  UNIQUE KEY `nom_UNIQUE` (`nom`),
  CONSTRAINT `CHK_nmbrChambre` CHECK (((`capacite` > 0) and (`disponible` >= 0) and (`capacite` >= `disponible`)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES ('Magic','constantine','2500','constantine',5,100,100);
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Publicite`
--

DROP TABLE IF EXISTS `Publicite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Publicite` (
  `activite` varchar(50) NOT NULL,
  `visiteur` varchar(50) NOT NULL,
  `date_activite` datetime NOT NULL,
  PRIMARY KEY (`activite`,`visiteur`),
  KEY `visiteur_idx` (`visiteur`),
  CONSTRAINT `activite` FOREIGN KEY (`activite`) REFERENCES `activite` (`nom`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `visiteur` FOREIGN KEY (`visiteur`) REFERENCES `spectateur` (`nomSpectateur`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Publicite`
--

LOCK TABLES `Publicite` WRITE;
/*!40000 ALTER TABLE `Publicite` DISABLE KEYS */;
INSERT INTO `Publicite` VALUES ('allmand','bakir','2022-05-02 17:20:58'),('allmand','hassan','2022-05-02 17:20:58'),('allmand','ILYES','2022-05-02 17:20:58'),('arabic','bakir','2022-04-20 17:23:00'),('arabic','hassan','2022-04-20 17:23:00'),('arabic','ILYES','2022-04-20 17:23:00'),('french','bakir','2022-04-16 12:00:00'),('french','hassan','2022-04-16 12:00:00'),('french','ILYES','2022-04-16 12:00:00'),('spanish','bakir','2021-12-13 17:05:00'),('spanish','hassan','2021-12-13 17:05:00'),('spanish','ILYES','2021-12-13 17:05:00'),('Start Coding Club','bakir','2021-05-28 18:26:00'),('Start Coding Club','hassan','2021-05-28 18:26:00'),('Start Coding Club','ILYES','2021-05-28 18:26:00');
/*!40000 ALTER TABLE `Publicite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserve_activite`
--

DROP TABLE IF EXISTS `reserve_activite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserve_activite` (
  `nomSpectateur` varchar(50) NOT NULL,
  `nom_activite` varchar(50) NOT NULL,
  PRIMARY KEY (`nomSpectateur`,`nom_activite`),
  KEY `nom_activite_idx` (`nom_activite`),
  CONSTRAINT `nom_activite` FOREIGN KEY (`nom_activite`) REFERENCES `activite` (`nom`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `nomSpectateur` FOREIGN KEY (`nomSpectateur`) REFERENCES `spectateur` (`nomSpectateur`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserve_activite`
--

LOCK TABLES `reserve_activite` WRITE;
/*!40000 ALTER TABLE `reserve_activite` DISABLE KEYS */;
INSERT INTO `reserve_activite` VALUES ('bakir','allmand'),('bakir','bascketball'),('bakir','CSS Battle'),('hassan','CSS Battle'),('ILYES','CSS Battle'),('ILYES','handball');
/*!40000 ALTER TABLE `reserve_activite` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `place_libresExist` BEFORE INSERT ON `reserve_activite` FOR EACH ROW BEGIN
	DECLARE pl int;
    
	SELECT place_libres into pl
    FROM activite
    WHERE NEW.nom_activite = nom;
    
    IF (pl = 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Désolé : pas de places libres';
    END IF;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `updateActivitePlaceLibres` AFTER INSERT ON `reserve_activite` FOR EACH ROW BEGIN
	UPDATE activite
    SET place_libres = place_libres + 1
    WHERE nom = NEW.nom_activite; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `MinActivitePlaceLibres` AFTER DELETE ON `reserve_activite` FOR EACH ROW BEGIN
	UPDATE activite
    SET place_libres = place_libres - 1
    WHERE nom = OLD.nom_activite; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `reserver_hotel`
--

DROP TABLE IF EXISTS `reserver_hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserver_hotel` (
  `Visiteur` varchar(50) NOT NULL,
  `hotel` varchar(50) NOT NULL,
  `chambre` int NOT NULL,
  `date_res` timestamp NOT NULL,
  `date_fin` timestamp NOT NULL,
  PRIMARY KEY (`Visiteur`,`hotel`,`chambre`,`date_res`),
  KEY `hotelName_idx` (`hotel`),
  KEY `numeroChambre_idx` (`chambre`),
  CONSTRAINT `hotelName` FOREIGN KEY (`hotel`) REFERENCES `hotel` (`nom`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `nomVisiteur` FOREIGN KEY (`Visiteur`) REFERENCES `visiteur` (`nomVisiteur`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `numeroChambre` FOREIGN KEY (`chambre`) REFERENCES `chambre` (`numero`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserver_hotel`
--

LOCK TABLES `reserver_hotel` WRITE;
/*!40000 ALTER TABLE `reserver_hotel` DISABLE KEYS */;
INSERT INTO `reserver_hotel` VALUES ('Bakir','Magic',1,'2022-01-12 09:00:00','2022-01-17 09:00:00');
/*!40000 ALTER TABLE `reserver_hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `nom` varchar(50) NOT NULL,
  `tel` varchar(10) NOT NULL,
  `type_cuisine` varchar(50) NOT NULL,
  `hotel` varchar(50) NOT NULL,
  `site` varchar(50) NOT NULL,
  PRIMARY KEY (`nom`),
  UNIQUE KEY `nom_UNIQUE` (`nom`),
  KEY `type_cuisine_idx` (`type_cuisine`),
  KEY `hotel_idx` (`hotel`),
  KEY `site_idx` (`site`),
  CONSTRAINT `hotel` FOREIGN KEY (`hotel`) REFERENCES `hotel` (`nom`),
  CONSTRAINT `site` FOREIGN KEY (`site`) REFERENCES `sitetouristique` (`nom`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `type_cuisine` FOREIGN KEY (`type_cuisine`) REFERENCES `type_cuisine` (`label`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitetouristique`
--

DROP TABLE IF EXISTS `sitetouristique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitetouristique` (
  `nom` varchar(50) NOT NULL,
  `anciennete` date NOT NULL,
  PRIMARY KEY (`nom`),
  UNIQUE KEY `nom_UNIQUE` (`nom`),
  KEY `siteTouristique` (`nom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitetouristique`
--

LOCK TABLES `sitetouristique` WRITE;
/*!40000 ALTER TABLE `sitetouristique` DISABLE KEYS */;
INSERT INTO `sitetouristique` VALUES ('www.mariot.com','2024-01-01');
/*!40000 ALTER TABLE `sitetouristique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spectateur`
--

DROP TABLE IF EXISTS `spectateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spectateur` (
  `nomSpectateur` varchar(50) NOT NULL,
  `Adresse` varchar(50) NOT NULL,
  `tel` char(10) NOT NULL,
  PRIMARY KEY (`nomSpectateur`),
  UNIQUE KEY `nomSpectateur_UNIQUE` (`nomSpectateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spectateur`
--

LOCK TABLES `spectateur` WRITE;
/*!40000 ALTER TABLE `spectateur` DISABLE KEYS */;
INSERT INTO `spectateur` VALUES ('bakir','constantine','0549601802'),('hassan','trig-jdida','0764527384'),('ILYES','smara','0645328745');
/*!40000 ALTER TABLE `spectateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_cuisine`
--

DROP TABLE IF EXISTS `type_cuisine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_cuisine` (
  `label` varchar(50) NOT NULL,
  PRIMARY KEY (`label`),
  UNIQUE KEY `label_UNIQUE` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_cuisine`
--

LOCK TABLES `type_cuisine` WRITE;
/*!40000 ALTER TABLE `type_cuisine` DISABLE KEYS */;
INSERT INTO `type_cuisine` VALUES ('VIP');
/*!40000 ALTER TABLE `type_cuisine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visiteur`
--

DROP TABLE IF EXISTS `visiteur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visiteur` (
  `nomVisiteur` varchar(50) NOT NULL,
  `Adresse` varchar(45) NOT NULL,
  `tel` int NOT NULL,
  PRIMARY KEY (`nomVisiteur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visiteur`
--

LOCK TABLES `visiteur` WRITE;
/*!40000 ALTER TABLE `visiteur` DISABLE KEYS */;
INSERT INTO `visiteur` VALUES ('Bakir','constantine',549601802);
/*!40000 ALTER TABLE `visiteur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'tourisme'
--

--
-- Dumping routines for database 'tourisme'
--
/*!50003 DROP PROCEDURE IF EXISTS `annuler_reservation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `annuler_reservation`(IN visiteur VARCHAR(50), IN hotel VARCHAR(50), IN chambre INT, IN date_res TIMESTAMP, OUT msg varchar(100))
BEGIN

DECLARE delai INT;
start transaction ;
    if (select timestampdiff(DAY, CURRENT_TIMESTAMP, date_res)) >= 1 then
		DELETE FROM `tourisme`.`reserver_hotel` WHERE (`Visiteur` = visiteur AND `hotel` = hotel AND `chambre` = chambre AND `date_res` = date_res);
        INSERT INTO `tourisme`.`Annulation` (`visiteur`, `hotel`,`chambre`, `date_debut`) VALUES (visiteur, hotel, chambre, date_res);
        set msg ='reservation canceled with success';
        select sleep(10) into delai;
        commit;
    else
		  set msg ='Sorry, you can not cancel this reservation :  ';
		  select sleep(10) into delai;
		commit;
     END IF;   

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consulter_hotels` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consulter_hotels`(IN start_date TIMESTAMP,IN fin_date TIMESTAMP )
BEGIN
DECLARE delai INT;
start transaction ;

	SELECT hotel,COUNT(numero) FROM tourisme.chambre AS tc
	WHERE NOT EXISTS (  SELECT hotel,chambre AS numero FROM tourisme.reserver_hotel AS tr WHERE tc.hotel=tr.hotel AND tc.numero = tr.chambre AND ((tr.date_res <= fin_date AND tr.date_fin>= fin_date) OR (tr.date_fin >= start_date AND tr.date_res<= start_date) ))
    GROUP BY hotel;
    select sleep(10) into delai;
    commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reserver_chambre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reserver_chambre`(IN leVisiteur VARCHAR(50), IN leHotel VARCHAR(50), IN laChambre INT, IN start_date TIMESTAMP,IN fin_date TIMESTAMP, OUT msg varchar(100))
BEGIN
DECLARE delai INT;
start transaction ;
    if (SELECT COUNT(`visiteur`) FROM `tourisme`.`Annulation`) <= 2 THEN
    
		if(SELECT EXISTS(SELECT hotel,numero FROM tourisme.chambre AS tc
						 WHERE NOT EXISTS (  
										SELECT hotel,chambre AS numero FROM tourisme.reserver_hotel AS tr 
                                        WHERE tc.hotel=tr.hotel AND tc.numero = tr.chambre AND ((tr.date_res <= fin_date AND tr.date_fin>= fin_date) OR (tr.date_fin >= start_date AND tr.date_res<= start_date )))
						 AND hotel=leHotel AND numero=laChambre)) = 1 THEN
                         
			INSERT INTO `tourisme`.`reserver_hotel` (`Visiteur`, `hotel`, `chambre`, `date_res`, `date_fin`) VALUES (leVisiteur, leHotel, laChambre, start_date, fin_date);
			set msg ='reservation with success';
			select sleep(10) into delai;
			commit;
            
		else
			set msg ='Sorry, you can not reserve in this room it is busy ';
			select sleep(10) into delai;
			commit;
		END IF;
    else
		  set msg ='Sorry, you can not make a reservation anymore you canceled a lot ';
		  select sleep(10) into delai;
		commit;
	END IF;   

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-05 18:28:10
