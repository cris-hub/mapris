-- MySQL dump 10.16  Distrib 10.1.21-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: localhost
-- ------------------------------------------------------
-- Server version	10.1.21-MariaDB

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
-- Table structure for table `actividades`
--

DROP TABLE IF EXISTS `actividades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actividades` (
  `idadtividad` int(11) NOT NULL,
  `idRutinas` int(11) NOT NULL,
  PRIMARY KEY (`idadtividad`),
  KEY `fk_clases_rutinas1_idx` (`idRutinas`),
  CONSTRAINT `fk_clases_rutinas1` FOREIGN KEY (`idRutinas`) REFERENCES `rutinas` (`idRutinas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_clases_servicios1` FOREIGN KEY (`idadtividad`) REFERENCES `servicios` (`idServicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividades`
--

LOCK TABLES `actividades` WRITE;
/*!40000 ALTER TABLE `actividades` DISABLE KEYS */;
INSERT INTO `actividades` VALUES (1,1),(4,1),(2,2),(5,2),(3,3),(6,3);
/*!40000 ALTER TABLE `actividades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aplazamientos`
--

DROP TABLE IF EXISTS `aplazamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aplazamientos` (
  `idaplazamiento` int(11) NOT NULL,
  `motivo` text COMMENT 'Este campo almacena la razon por la cual se hace el aplazamiento',
  `idcliente` bigint(20) DEFAULT NULL,
  `servicios_idServicio` int(11) NOT NULL,
  PRIMARY KEY (`idaplazamiento`),
  KEY `FKClientesAplazamientos_idx` (`idcliente`),
  KEY `fk_aplazamientos_servicios1_idx` (`servicios_idServicio`),
  CONSTRAINT `FKClientesAplazamientos` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idClientes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_aplazamientos_servicios1` FOREIGN KEY (`servicios_idServicio`) REFERENCES `servicios` (`idServicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aplazamientos`
--

LOCK TABLES `aplazamientos` WRITE;
/*!40000 ALTER TABLE `aplazamientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `aplazamientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cita_medica`
--

DROP TABLE IF EXISTS `cita_medica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cita_medica` (
  `idcita_medica` int(11) NOT NULL,
  `consultorios_idconsultorio` int(11) NOT NULL,
  PRIMARY KEY (`idcita_medica`),
  KEY `fk_cita_medica_consultorios1_idx` (`consultorios_idconsultorio`),
  CONSTRAINT `fk_cita_medica_consultorios1` FOREIGN KEY (`consultorios_idconsultorio`) REFERENCES `consultorios` (`idconsultorio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cita_medica_servicios1` FOREIGN KEY (`idcita_medica`) REFERENCES `servicios` (`idServicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cita_medica`
--

LOCK TABLES `cita_medica` WRITE;
/*!40000 ALTER TABLE `cita_medica` DISABLE KEYS */;
/*!40000 ALTER TABLE `cita_medica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `idClientes` bigint(20) NOT NULL COMMENT 'Este campo almacena la cedula de los clientes (Solo los clientes)',
  `idEmpresa` bigint(20) NOT NULL COMMENT 'Este campo almacena el (id) de la tabla "Empresa"\n',
  `estado` varchar(20) NOT NULL COMMENT 'Este campo almacena el estado que se encuentra el cliente',
  PRIMARY KEY (`idClientes`),
  KEY `fk_ClientesEmpresa_idx` (`idEmpresa`),
  CONSTRAINT `fk_ClientesEmpresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_ClientesUsuarios` FOREIGN KEY (`idClientes`) REFERENCES `usuarios` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1600112313399,2,'1'),(1602081548099,3,'1'),(1602120920199,4,'1'),(1603010433999,5,'1'),(1607032664899,8,'1'),(1609080393299,10,'1');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultorios`
--

DROP TABLE IF EXISTS `consultorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consultorios` (
  `idconsultorio` int(11) NOT NULL,
  PRIMARY KEY (`idconsultorio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultorios`
--

LOCK TABLES `consultorios` WRITE;
/*!40000 ALTER TABLE `consultorios` DISABLE KEYS */;
INSERT INTO `consultorios` VALUES (1),(2),(3);
/*!40000 ALTER TABLE `consultorios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `correos`
--

DROP TABLE IF EXISTS `correos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `correos` (
  `id_correo` int(11) NOT NULL AUTO_INCREMENT,
  `correo` varchar(45) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  PRIMARY KEY (`id_correo`),
  KEY `fk_usuarios_correos` (`id_usuario`),
  CONSTRAINT `fk_usuarios_correos` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `correos`
--

LOCK TABLES `correos` WRITE;
/*!40000 ALTER TABLE `correos` DISABLE KEYS */;
INSERT INTO `correos` VALUES (1,'ma@gmail.com',1031174466),(2,'ka@gmail.com',1600032140599),(4,'po@gmail.com',1600112313399),(5,'pa@gmail.com',1602081548099),(6,'ro@gmail.com',1602120920199),(7,'yu@gmail.com',1603010433999),(10,'tupac@gmail.com',1607032664899);
/*!40000 ALTER TABLE `correos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datosclinicos`
--

DROP TABLE IF EXISTS `datosclinicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datosclinicos` (
  `idCliente` bigint(20) NOT NULL COMMENT 'Este campo almacena la cedula del cliente de la tabla "Clientes"',
  `rh` char(2) DEFAULT NULL COMMENT 'Este campo almacena el tipo de sangre del cliente',
  `datosPosparto` int(11) DEFAULT NULL COMMENT 'Este campo almacena el archivo correspondiente al dato clinico del programa Posparto',
  `datosPrenatales` int(11) DEFAULT NULL COMMENT 'Este campo almacena el archivo correspondiente al dato clinico del programa Prenatal',
  PRIMARY KEY (`idCliente`),
  CONSTRAINT `fk_DatosClientes` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idClientes`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datosclinicos`
--

LOCK TABLES `datosclinicos` WRITE;
/*!40000 ALTER TABLE `datosclinicos` DISABLE KEYS */;
INSERT INTO `datosclinicos` VALUES (1600112313399,'A-',1,2),(1602081548099,'A+',1,2),(1602120920199,'B-',1,2),(1603010433999,'O-',1,2),(1607032664899,'A-',1,2),(1609080393299,'O-',1,2);
/*!40000 ALTER TABLE `datosclinicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direcciones`
--

DROP TABLE IF EXISTS `direcciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direcciones` (
  `iddirecciones` int(11) NOT NULL,
  `id_localidad` int(11) NOT NULL,
  `avenida` varchar(45) DEFAULT NULL,
  `calle` varchar(45) DEFAULT NULL,
  `carrera` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iddirecciones`),
  KEY `fk_direcciones_localidad` (`id_localidad`),
  CONSTRAINT `fk_direcciones_localidad` FOREIGN KEY (`id_localidad`) REFERENCES `localidades` (`id_localidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciones`
--

LOCK TABLES `direcciones` WRITE;
/*!40000 ALTER TABLE `direcciones` DISABLE KEYS */;
INSERT INTO `direcciones` VALUES (1,1,'Apdo.:904-3880 Pellentesque ','47','35'),(2,2,'Apartado núm.: 874, 8683 Aenean Carretera','30','96'),(3,3,'1300 Turpis Av.','19','89'),(4,4,'2189 Eleifend Ctra.','80','61'),(5,5,'Apdo.:600-9662 Ante, ','43','45'),(6,6,'Apdo.:107-8067 Velit Carretera','16','49'),(7,7,'Apartado núm.: 350, 3766 Vitae C/','38','53'),(8,8,'822-2509 Quisque Avenida','85','92'),(9,9,'194-7742 Eget Av.','74','15'),(10,10,'Apartado núm.: 998, 1484 Egestas. Avenida','26','31'),(11,11,'Apdo.:710-564 Sodales. Avenida','92','40'),(12,12,'3366 Scelerisque C.','69','65'),(13,13,'Apdo.:137-294 Semper C/','07','60'),(14,14,'Apdo.:645-6971 Elit, Calle','35','35'),(15,15,'Apdo.:110-3944 Quis C.','12','25'),(16,16,'Apdo.:997-2950 Enim C.','60','89'),(17,17,'7200 Erat, C/','61','29'),(18,18,'Apdo.:464-7252 Mi. Avda.','68','07'),(19,19,'904-6981 Pharetra. C/','05','93'),(20,20,'Apartado núm.: 807, 7904 Ultrices ','06','09'),(21,21,'5887 Euismod Ctra.','72','36'),(22,22,'Apdo.:771-5232 Augue Avda.','50','83'),(23,23,'5041 Mus. Ctra.','02','63'),(24,24,'Apdo.:848-1779 Non, C.','71','62'),(25,25,'Apdo.:938-8999 Ligula. ','21','92'),(26,26,'Apartado núm.: 893, 8575 Hendrerit Carretera','85','12'),(27,27,'3593 Luctus Avda.','57','30'),(28,28,'Apartado núm.: 849, 4725 Nulla Calle','45','84'),(29,29,'650-1954 Nulla Avenida','23','56'),(30,30,'9336 Arcu. C/','89','80'),(31,31,'2814 Semper, Calle','08','69'),(32,32,'548 Mus. C.','71','29'),(33,33,'Apartado núm.: 633, 5523 Sed, Carretera','65','36'),(34,34,'623-8277 Montes, Ctra.','71','58'),(35,35,'Apdo.:175-469 Vestibulum Ctra.','57','81'),(36,36,'Apartado núm.: 937, 7188 Donec Avenida','95','36'),(37,37,'Apdo.:418-7348 Vitae C/','59','52'),(38,38,'Apdo.:796-1356 Sapien Ctra.','17','37'),(39,39,'Apartado núm.: 840, 4955 Accumsan ','25','68'),(40,40,'8005 Vitae ','46','02'),(41,41,'6348 Eget, C/','98','81'),(42,42,'9386 Convallis C/','17','19'),(43,43,'Apdo.:967-5753 Sagittis. C.','71','49'),(44,44,'Apartado núm.: 832, 7641 Ultrices. Av.','68','17'),(45,45,'Apdo.:326-2083 Suscipit Avda.','36','07'),(46,46,'Apartado núm.: 504, 3764 Vivamus Calle','74','38'),(47,47,'506-1545 Aenean C.','35','48'),(48,48,'Apdo.:227-2638 Scelerisque, Avda.','70','79'),(49,49,'Apartado núm.: 126, 5453 Ornare, C.','72','28'),(50,50,'3656 Sem. Avda.','95','50'),(51,51,'6432 Donec C/','52','15'),(52,52,'Apartado núm.: 875, 988 Quis Carretera','82','16'),(53,53,'Apartado núm.: 682, 8720 Aliquet Ctra.','58','86'),(54,54,'Apdo.:911-1614 Bibendum. C/','52','71'),(55,55,'Apdo.:389-6894 Non C/','10','26'),(56,56,'Apartado núm.: 143, 4278 At, Avda.','88','69'),(57,57,'8932 Augue C/','28','51'),(58,58,'Apartado núm.: 312, 3434 At, C/','68','62'),(59,59,'4209 Eu Av.','84','27'),(60,60,'9462 Arcu. Carretera','87','57'),(61,61,'Apartado núm.: 813, 4792 Fusce Carretera','47','54'),(62,62,'2041 Sed Carretera','42','30'),(63,63,'Apartado núm.: 381, 1275 Sed C.','23','09'),(64,64,'837-9733 Et Av.','61','46'),(65,65,'Apartado núm.: 764, 9260 Imperdiet Carretera','98','30'),(66,66,'Apartado núm.: 478, 271 Tincidunt, Carretera','60','34'),(67,67,'Apartado núm.: 449, 4521 Odio. Avenida','74','87'),(68,68,'9239 Mollis Ctra.','01','27'),(69,69,'Apartado núm.: 334, 7242 Lectus Ctra.','83','09'),(70,70,'700-1342 Purus Avda.','61','77'),(71,71,'Apartado núm.: 200, 5326 Mauris, Carretera','82','15'),(72,72,'Apdo.:124-9400 Odio Av.','07','83'),(73,73,'Apartado núm.: 576, 5699 Ante. Avda.','20','95'),(74,74,'Apartado núm.: 353, 4519 Ridiculus Av.','71','97'),(75,75,'Apartado núm.: 518, 7410 Sed Calle','61','44'),(76,76,'Apartado núm.: 666, 9346 Arcu. Calle','11','34'),(77,77,'733-8968 Massa. Calle','42','86'),(78,78,'Apartado núm.: 201, 7505 Quisque C.','54','59'),(79,79,'Apdo.:711-9967 Neque. Calle','69','11'),(80,80,'202-4463 Luctus Ctra.','03','82'),(81,81,'Apdo.:100-9342 Et C/','74','55'),(82,82,'Apartado núm.: 425, 1357 Laoreet, Carretera','99','84'),(83,83,'256-9359 Libero ','79','40'),(84,84,'Apdo.:918-8707 Massa. Calle','73','61'),(85,85,'Apartado núm.: 546, 7094 Nulla. C.','62','37'),(86,86,'Apdo.:260-2324 Posuere ','95','35'),(87,87,'267-6523 Ante Ctra.','20','73'),(88,88,'451-9433 Non, Ctra.','91','47'),(89,89,'703-1842 Quam. Ctra.','14','65'),(90,90,'Apartado núm.: 921, 5433 Ipsum Carretera','82','70'),(91,91,'3852 Integer ','46','58'),(92,92,'Apdo.:784-4314 Sed ','59','33'),(93,93,'Apartado núm.: 345, 8986 Consequat, Av.','81','11'),(94,94,'3534 Molestie. C/','44','28'),(95,95,'Apdo.:653-9562 Bibendum Avenida','68','93'),(96,96,'Apdo.:651-8423 Vestibulum Avda.','17','42'),(97,97,'4985 A Carretera','84','92'),(98,98,'Apartado núm.: 342, 993 Et, Calle','84','96'),(99,99,'Apartado núm.: 392, 9324 Fames Ctra.','97','08'),(100,100,'Apartado núm.: 610, 8443 Ipsum Carretera','10','00');
/*!40000 ALTER TABLE `direcciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `idEmpresa` bigint(20) NOT NULL COMMENT 'Este campo es la clave primaria de la tabla y  almacena el (id) ',
  `nombre` varchar(45) NOT NULL COMMENT 'Este campo almacena el nombre de la empresa',
  `direccionP` varchar(45) DEFAULT NULL,
  `direccionO` varchar(45) DEFAULT NULL,
  `telefonoF` bigint(20) DEFAULT NULL,
  `telefonoC` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`idEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,'El apojeo','Calle siempre viva','Fasalis 200',2919029,3123242425),(2,'Vitae Risus Duis Limited','Apdo.:452-9780 Erat Avenida','8389 Suspendisse Avda.',793,903),(3,'Orci Tincidunt Corporation','Apartado núm.: 439, 8810 Tempus C.','Apdo.:196-7901 Duis C.',967,421),(4,'Fringilla Donec Incorporated','Apdo.:535-8438 Nunc Avenida','Apartado núm.: 376, 8122 Magna. Ctra.',968,580),(5,'Dignissim Lacus Aliquam LLC','Apartado núm.: 223, 9032 Magna. Ctra.','160-9189 Ridiculus Carretera',259,452),(6,'Morbi Accumsan Ltd','Apdo.:983-9356 Urna. Avenida','Apdo.:980-4715 Cum C/',638,150),(7,'Enim Nec Tempus LLP','Apdo.:842-5765 Interdum. Av.','Apartado núm.: 882, 9381 Aliquet C/',138,331),(8,'Arcu Curabitur Ut PC','3126 Dignissim C.','Apartado núm.: 191, 357 Auctor. Avda.',896,290),(9,'Dolor Nonummy Ac Industries','Apartado núm.: 212, 9740 Luctus Avenida','Apdo.:423-5407 Consequat ',154,863),(10,'Torquent Per Conubia Inc.','372-9413 Pellentesque C.','Apartado núm.: 155, 1330 Morbi Avda.',964,392),(11,'Mauris LLP','374-7501 Metus. Calle','3088 Mollis ',376,640),(12,'Non Arcu Vivamus Foundation','253-5280 Curabitur Calle','Apartado núm.: 280, 8387 Non C.',929,906),(13,'Morbi Company','844-2528 Eleifend, C.','403-9288 Aliquet ',141,645),(14,'Facilisis Magna Tellus PC','5465 Eu Calle','Apartado núm.: 349, 1586 Urna, Av.',641,803),(15,'Cum Sociis Natoque LLC','4018 In, Av.','Apartado núm.: 340, 398 Venenatis C/',259,426),(16,'Eu Odio Tristique Foundation','330-1949 Ipsum Av.','150-1575 Nonummy Av.',605,274),(17,'Purus Inc.','808-6100 Ut ','Apartado núm.: 153, 1824 Tellus Carretera',715,818),(18,'Elit Elit Fermentum Corp.','Apartado núm.: 791, 1231 Gravida Carretera','Apdo.:613-1809 Ipsum C.',204,196),(19,'Sed Pede Nec LLC','Apartado núm.: 833, 1260 At C/','225-4214 Pede. Calle',665,742),(20,'Tellus Sem Mollis Foundation','6791 Dolor. ','4521 Vivamus Carretera',789,204),(21,'Mauris Inc.','523-9341 Mauris C.','Apdo.:382-1647 At Calle',726,667),(22,'A Aliquet Vel Corporation','Apartado núm.: 218, 8815 Nulla C/','Apdo.:578-5467 Sapien. Av.',780,573),(23,'Ullamcorper Viverra Limited','183-573 Tellus Avda.','652-6681 Eu C/',472,425),(24,'Lacinia Orci Consectetuer Corporation','5323 Neque. Calle','Apdo.:242-4508 Etiam Calle',199,841),(25,'Sem Ut Dolor Corporation','331-1709 Adipiscing Calle','5536 Non Avda.',138,861),(26,'Consectetuer Mauris Id Corporation','920-1085 Sed Carretera','9713 Fringilla. Ctra.',960,916),(27,'Volutpat Nunc Institute','Apartado núm.: 836, 9646 Velit Ctra.','Apartado núm.: 674, 2334 Praesent Calle',195,920),(28,'Aliquam Incorporated','Apdo.:884-2544 Congue. Avenida','Apartado núm.: 794, 4474 Arcu. Ctra.',744,388),(29,'Blandit Mattis PC','Apdo.:406-4270 Ornare. C/','9000 Scelerisque C/',599,438),(30,'Dictum Augue Malesuada Corp.','514-9129 Dis Avenida','Apartado núm.: 435, 6828 Suspendisse Av.',812,122),(31,'Posuere Company','6287 Erat. Avda.','233-8968 Fusce C.',772,550),(32,'Pharetra Corp.','Apdo.:725-3550 Nisi. Ctra.','574-3210 Enim. Ctra.',849,913),(33,'Maecenas Malesuada LLC','4138 Nulla Ctra.','264 Et Ctra.',115,181),(34,'Sodales Mauris LLP','Apartado núm.: 527, 5573 Lorem Calle','Apdo.:126-9684 Facilisis Calle',115,601),(35,'Sapien Limited','242-9634 Quisque Carretera','772-4500 Eu Avenida',361,243),(36,'Dui Incorporated','7060 Mi Avda.','6854 Placerat, C/',419,538),(37,'Et Ultrices Consulting','882-4291 Nunc. C/','6749 Dolor. Avda.',309,492),(38,'Mauris Limited','792-7025 Lacus. C.','624-1022 Libero. Av.',414,417),(39,'Nunc LLC','Apartado núm.: 696, 1025 Massa. C.','Apdo.:496-9286 Risus. Carretera',964,420),(40,'Placerat Cras Dictum Company','9628 Arcu. ','Apdo.:245-2583 Imperdiet Ctra.',880,653),(41,'Fusce Feugiat Lorem PC','Apdo.:575-2071 Nec, ','266-6761 Proin Calle',709,638),(42,'Eu Turpis Corporation','3445 Sit Avda.','Apdo.:662-6269 Nulla. Ctra.',101,753),(43,'Lectus Rutrum LLP','Apartado núm.: 705, 9924 Mi. C.','682-2298 Consequat, Avenida',384,760),(44,'Risus Quis Corporation','9705 Congue. C/','Apdo.:302-2471 Dignissim. Calle',116,405),(45,'Euismod Enim Corporation','856-9532 Semper Avenida','557-1952 Facilisis, Carretera',839,708),(46,'Nibh PC','654-9826 Pellentesque Calle','Apdo.:296-8431 Nunc Calle',284,521),(47,'Quam A Company','Apdo.:102-7702 Magna. Av.','6271 Velit Ctra.',621,349),(48,'Ridiculus Consulting','Apdo.:875-9453 Est C/','Apartado núm.: 771, 9673 Egestas Calle',746,443),(49,'Amet Consulting','4159 Eu, Av.','Apdo.:932-8296 Tellus ',182,998),(50,'Adipiscing Mauris LLP','100-3415 Molestie C/','Apdo.:760-3262 Aliquam C.',265,454),(51,'Nulla LLC','654-1126 Diam C/','4861 Orci, Av.',921,465),(52,'Cursus Incorporated','608-9892 Non, Avenida','Apdo.:143-8230 Lorem Ctra.',600,466),(53,'Nunc Laoreet Incorporated','771-8771 Nulla C/','Apdo.:129-4075 Et, Avenida',578,511),(54,'Dolor Elit Pellentesque LLP','9003 Ligula Avda.','Apdo.:205-573 Rhoncus. ',145,636),(55,'Tincidunt Ltd','Apartado núm.: 344, 6154 In, Calle','9479 Nunc C.',837,833),(56,'Duis Gravida Corporation','Apdo.:703-886 Tristique C.','Apdo.:579-1685 Purus. Avda.',164,419),(57,'Ipsum Industries','919-7831 Non, Avda.','125-3846 Dui. Calle',300,326),(58,'Gravida Limited','968-2437 Vitae Carretera','Apdo.:488-6473 Diam ',153,994),(59,'Nec Incorporated','Apartado núm.: 927, 9634 Dictum. Ctra.','Apdo.:120-5996 Molestie ',566,219),(60,'Elit Etiam LLP','594-5048 Ac Carretera','Apartado núm.: 186, 1668 Nulla. C/',627,827),(61,'Interdum Nunc Limited','Apdo.:672-8335 Ut Ctra.','Apdo.:182-7118 Molestie Avenida',256,320),(62,'Dui LLC','6948 Duis Carretera','Apartado núm.: 548, 2788 Fusce Av.',794,354),(63,'Sollicitudin Inc.','Apartado núm.: 321, 2315 Turpis Avenida','715-2355 Nisl. Avenida',309,178),(64,'Est Nunc Corporation','Apdo.:115-3245 Fusce ','7319 Quam Calle',729,731),(65,'Aliquam Corporation','977-192 Mi Calle','350-7583 Ipsum. Avenida',201,941),(66,'Ligula Nullam Institute','493-2043 Nulla Avda.','206-8029 Nisl C/',352,114),(67,'Est Congue Foundation','Apdo.:219-194 Erat. Avda.','Apartado núm.: 395, 6640 Dui ',906,572),(68,'Vestibulum Accumsan Neque Corporation','Apdo.:797-3549 Vitae Avenida','766-6488 Eget Ctra.',537,499),(69,'Sodales Institute','2495 Lorem Carretera','4431 Nunc Av.',138,847),(70,'Ut Institute','Apdo.:550-6728 Mauris ','Apartado núm.: 434, 2516 Nunc. Avda.',487,790),(71,'Lacus Ut Nec Corporation','Apartado núm.: 565, 8599 Penatibus Carretera','Apartado núm.: 193, 3073 Amet Avenida',401,985),(72,'Dictum Phasellus In Ltd','Apdo.:818-7463 Erat. Av.','Apdo.:922-3422 Tortor C.',614,185),(73,'Elit Erat Vitae Corp.','724-3814 Curabitur Calle','684-7300 Non, C/',506,689),(74,'Ac Nulla Corp.','Apdo.:306-1961 Vivamus Ctra.','Apdo.:521-2564 Consequat Calle',513,177),(75,'Nulla At Sem Inc.','501-6954 Suspendisse Carretera','8882 Neque Avenida',755,102),(76,'Quam Foundation','595-3978 Cras C.','759-1621 Sem Avenida',429,270),(77,'Lorem Auctor Corp.','591-1337 Maecenas Av.','311-9870 Et C.',162,705),(78,'Mauris Vel Turpis Foundation','Apdo.:818-6879 Orci ','4966 Amet Av.',283,804),(79,'Donec Associates','Apdo.:645-5607 Sapien Avenida','Apdo.:773-7256 Dui ',628,494),(80,'Porta Corporation','Apdo.:149-2714 Vestibulum, C/','Apartado núm.: 430, 5597 Sociis Ctra.',183,387),(81,'Cras Sed Leo Consulting','2412 Elit Calle','Apdo.:873-6482 Ornare, C/',434,167),(82,'Suspendisse Sagittis Nullam Associates','6501 Sed ','Apdo.:636-5008 Ornare ',282,196),(83,'Conubia Consulting','Apdo.:373-2112 Montes, ','Apdo.:332-5072 Lacus. Avda.',919,316),(84,'Ligula Aenean LLC','Apartado núm.: 488, 4098 Fusce C/','Apdo.:316-1946 Elementum, ',207,215),(85,'Auctor Vitae Aliquet Associates','510-1344 Vitae, Ctra.','Apdo.:840-2981 At Calle',161,732),(86,'Sed LLC','542-7566 Erat C/','Apdo.:962-6663 Molestie Calle',581,416),(87,'Quis Urna Industries','Apdo.:100-934 Scelerisque Carretera','3216 Porttitor Avda.',781,188),(88,'Nunc Sit Industries','Apartado núm.: 100, 3830 Ante. Avda.','1725 Mi C.',853,937),(89,'Dolor Sit Amet Consulting','2173 Lobortis ','548-2443 Augue. Calle',544,798),(90,'Lorem Ipsum Dolor Industries','262-6041 Ridiculus Av.','Apartado núm.: 386, 9366 Pharetra Carretera',783,996),(91,'Class Ltd','923-7657 Cursus Av.','738-6256 Sed Avda.',696,639),(92,'Odio Corp.','Apdo.:734-452 Rutrum Avda.','Apartado núm.: 556, 511 Facilisi. Calle',694,488),(93,'Taciti Sociosqu Industries','723-3823 Velit. Avenida','Apdo.:212-9686 Vel, Carretera',932,583),(94,'Bibendum Ullamcorper Incorporated','7127 Magna C.','Apdo.:423-6579 Auctor Avda.',248,952),(95,'Lacus Cras Interdum LLC','Apdo.:386-8824 Ligula. Calle','531-5301 A, Calle',685,555),(96,'Mauris Company','5271 Et Av.','5368 Purus C/',213,955),(97,'Eros Nec LLP','Apdo.:887-3525 Elit Carretera','Apartado núm.: 540, 4339 Auctor, Av.',655,236),(98,'Quam A Consulting','Apartado núm.: 890, 2904 Pede C/','3429 Molestie C.',238,818),(99,'Feugiat Sed Associates','Apdo.:952-7164 In Carretera','7328 Sociis Avda.',461,778),(100,'Lobortis PC','9458 Fusce Av.','Apartado núm.: 734, 4376 Donec Calle',264,957);
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estados` (
  `id_estados` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripccion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_estados`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'activo',''),(2,'bloqueado',NULL),(3,'sin rol',NULL),(4,'sin permisos',NULL);
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscripciones`
--

DROP TABLE IF EXISTS `inscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscripciones` (
  `idInscripciones` int(11) NOT NULL COMMENT 'Este campo es la clave primaria de la tabla y  almacena el (id) \n',
  `idCliente` bigint(20) NOT NULL COMMENT 'Este campo almacena el (id) de la tabla "Clientes"',
  `fechaInicio` date DEFAULT NULL COMMENT 'Este campo almacena la fecha en que fue realizada la incripcion al programa',
  `valor` int(11) DEFAULT NULL COMMENT 'Este campo almacena el coste de la inscripcion',
  `id_servicio` int(11) NOT NULL,
  `numero_sesiones` int(11) DEFAULT NULL,
  `estado` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idInscripciones`),
  KEY `fk_InscripcionesCliente_idx` (`idCliente`),
  KEY `fk_inscripciones_servicios1_idx` (`id_servicio`),
  CONSTRAINT `fk_InscripcionesCliente` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idClientes`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_inscripciones_servicios1` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`idServicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripciones`
--

LOCK TABLES `inscripciones` WRITE;
/*!40000 ALTER TABLE `inscripciones` DISABLE KEYS */;
INSERT INTO `inscripciones` VALUES (10,1609080393299,'2017-06-21',300000,10,10,'Activa');
/*!40000 ALTER TABLE `inscripciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidades`
--

DROP TABLE IF EXISTS `localidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localidades` (
  `id_localidad` int(11) NOT NULL AUTO_INCREMENT,
  `localidad` varchar(30) NOT NULL,
  PRIMARY KEY (`id_localidad`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidades`
--

LOCK TABLES `localidades` WRITE;
/*!40000 ALTER TABLE `localidades` DISABLE KEYS */;
INSERT INTO `localidades` VALUES (1,'Forge-Philippe'),(2,'Stockton-on-Tees'),(3,'Wambeek'),(4,'Denver'),(5,'Dublin'),(6,'Rostock'),(7,'Kalisz'),(8,'Uluberia'),(9,'Macquenoise'),(10,'El Quisco'),(11,'Huntsville'),(12,'Columbia'),(13,'Osgoode'),(14,'Vellore'),(15,'Greater Hobart'),(16,'Quesada'),(17,'Ancud'),(18,'Manukau'),(19,'Dalcahue'),(20,'Calestano'),(21,'Olathe'),(22,'Monte Giberto'),(23,'Bath'),(24,'Whitby'),(25,'Hallaar'),(26,'Schriek'),(27,'Annone di Brianza'),(28,'Houffalize'),(29,'Roselies'),(30,'Santa Cruz'),(31,'Peñalolén'),(32,'Bairnsdale'),(33,'Bilbo'),(34,'Worcester'),(35,'Watermaal-Bosvoorde'),(36,'Berwick'),(37,'Motueka'),(38,'Tielrode'),(39,'Clarksville'),(40,'Ross-on-Wye'),(41,'Taunton'),(42,'Brandenburg'),(43,'Mackay'),(44,'Kempten'),(45,'Patna'),(46,'Fort Good Hope'),(47,'Aubange'),(48,'Barrie'),(49,'Penicuik'),(50,'Bègles'),(51,'Santa Caterina Villarmosa'),(52,'Redcliffe'),(53,'Barrie'),(54,'Romano d\'Ezzelino'),(55,'Leoben'),(56,'Contulmo'),(57,'Ingelheim'),(58,'Grand Rapids'),(59,'Hamoir'),(60,'Wollongong'),(61,'Rouvreux'),(62,'Regina'),(63,'Chetwynd'),(64,'Telford'),(65,'Crieff'),(66,'Bothey'),(67,'Cochrane'),(68,'Rohtak'),(69,'Biala Podlaska'),(70,'Burlington'),(71,'Rocca d\'Arce'),(72,'La Seyne-sur-Mer'),(73,'Civitacampomarano'),(74,'Norrkoping'),(75,'Brentwood'),(76,'Würzburg'),(77,'Monteroni d\'Arbia'),(78,'Celle'),(79,'La Higuera'),(80,'Castiglione di Sicilia'),(81,'Pamplona'),(82,'Altmünster'),(83,'Neerrepen'),(84,'Ottawa'),(85,'Leers-et-Fosteau'),(86,'CŽroux-Mousty'),(87,'Gaithersburg'),(88,'Vielsalm'),(89,'Neubrandenburg'),(90,'Pitrufquén'),(91,'Thorold'),(92,'Sijsele'),(93,'Snaaskerke'),(94,'Regensburg'),(95,'Meppel'),(96,'Caxias'),(97,'Vucht'),(98,'Morro d\'Alba'),(99,'Campbelltown'),(100,'Denver');
/*!40000 ALTER TABLE `localidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permisos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `url` text,
  `icon` varchar(45) DEFAULT NULL,
  `permisos_padre` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_permisos_permisos1_idx` (`permisos_padre`),
  CONSTRAINT `fk_permisos_permisos1` FOREIGN KEY (`permisos_padre`) REFERENCES `permisos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
INSERT INTO `permisos` VALUES (0,'inicio','/app/index.xhtml\n','fa fa-home',NULL),(1,'perfil','','fa fa-user-o',NULL),(2,'usuarios','/app/administrador/usuarios/ver.xhtml','fa fa-users',NULL),(3,'aplazamientos','','fa fa-clock-o',NULL),(4,'citas','','fa fa-calendar-check-o',NULL),(5,'agenda','','fa fa-calendar',NULL),(6,'agendar','','fa fa-calendar-check-o',NULL),(7,'inscripciones','/app/administrador/inscripciones/ver.xhtml','fa fa-list-alt',NULL),(8,'empresa','/app/administrador/empresa/ver.xhtml','fa fa-columns',NULL),(11,'miPerfil','/app/perfil/miperfil.xhtml','fa fa-user',1),(12,'cambiarDatos','/app/perfil/cambiardatos.xhtml','fa fa-pencil',1),(21,'listarUsuarios','/app/usuarios/listar.xhtml','fa fa-list',2),(22,'nuevoUsuario','/app/usuarios/nuevo.xhtml','fa fa-user-plus',2),(30,'editarAplazamiento','/app//usuarios/editar.xhtml','fa fa-pencil-square-o',2),(31,'listaAplazamientos','/app/aplazamientos/lista.xhtml','fa fa-list',3),(32,'registrarAplazamiento','/app/aplazamientos/nuevo.xhtml','fa fa-plus',3),(61,'reservar','/app/cliente/servicios.xhtml','fa fa-pencil-square-o',6),(71,'listaInscripciones','/app/administrador/inscripciones/inscripciones.xhtml','fa fa-list-ol',7),(72,'editarIncripcion','/app/administrador/inscripciones/editar.xhtml','fa fa-pencil',7),(81,'listarEmpresas','/app/administrador/empresa/empresas.xhtml','fa fa-th-large',8),(82,'editarEmpresa','/app/administrador/empresa/editar.xhtml','fa fa-pencil',8);
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisosroles`
--

DROP TABLE IF EXISTS `permisosroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permisosroles` (
  `permisos_id` int(11) NOT NULL,
  `roles_idRoles` int(11) NOT NULL,
  PRIMARY KEY (`permisos_id`,`roles_idRoles`),
  KEY `fk_permisos_has_roles_roles1_idx` (`roles_idRoles`),
  KEY `fk_permisos_has_roles_permisos1_idx` (`permisos_id`),
  CONSTRAINT `fk_permisos_has_roles_permisos1` FOREIGN KEY (`permisos_id`) REFERENCES `permisos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_permisos_has_roles_roles1` FOREIGN KEY (`roles_idRoles`) REFERENCES `roles` (`idRoles`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisosroles`
--

LOCK TABLES `permisosroles` WRITE;
/*!40000 ALTER TABLE `permisosroles` DISABLE KEYS */;
INSERT INTO `permisosroles` VALUES (1,1),(1,2),(2,1),(3,1),(6,2),(7,1),(8,1),(11,1),(11,2),(12,1),(12,2),(21,1),(22,1),(31,1),(32,1),(61,2),(71,1),(72,1),(81,1),(82,1);
/*!40000 ALTER TABLE `permisosroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personalmedico`
--

DROP TABLE IF EXISTS `personalmedico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personalmedico` (
  `idPersonalMedico` bigint(20) NOT NULL COMMENT 'Este campo almacena la cedula de cada Personal Medico (Solo Personal Medico)',
  `perfilProfesional` varchar(45) NOT NULL COMMENT 'Este campo almacena la especialidad que tiene cada Personal Medico ',
  `cargo` varchar(20) NOT NULL COMMENT 'Este campo almacena el tipo de cargo que tiene el personal Medico (Prenatal o Posnatal)',
  PRIMARY KEY (`idPersonalMedico`),
  CONSTRAINT `FKClientesUsuarios` FOREIGN KEY (`idPersonalMedico`) REFERENCES `usuarios` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personalmedico`
--

LOCK TABLES `personalmedico` WRITE;
/*!40000 ALTER TABLE `personalmedico` DISABLE KEYS */;
INSERT INTO `personalmedico` VALUES (1602120920199,'Fisioterapeuta','Profesional en la sa'),(1609080393299,'Estétisista','Profesional en la be'),(1616110563599,'Especialista en Yoga ','Profesional en el ar');
/*!40000 ALTER TABLE `personalmedico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programas`
--

DROP TABLE IF EXISTS `programas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programas` (
  `idprograma` int(11) NOT NULL,
  PRIMARY KEY (`idprograma`),
  CONSTRAINT `fk_programas_servicios1` FOREIGN KEY (`idprograma`) REFERENCES `servicios` (`idServicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programas`
--

LOCK TABLES `programas` WRITE;
/*!40000 ALTER TABLE `programas` DISABLE KEYS */;
INSERT INTO `programas` VALUES (1),(2),(3);
/*!40000 ALTER TABLE `programas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programas_has_clases`
--

DROP TABLE IF EXISTS `programas_has_clases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programas_has_clases` (
  `idprograma` int(11) NOT NULL,
  `idactividad` int(11) NOT NULL,
  PRIMARY KEY (`idprograma`,`idactividad`),
  KEY `fk_programas_has_clases_clases1_idx` (`idactividad`),
  KEY `fk_programas_has_clases_programas1_idx` (`idprograma`),
  CONSTRAINT `fk_programas_has_clases_clases1` FOREIGN KEY (`idactividad`) REFERENCES `actividades` (`idadtividad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_programas_has_clases_programas1` FOREIGN KEY (`idprograma`) REFERENCES `programas` (`idprograma`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programas_has_clases`
--

LOCK TABLES `programas_has_clases` WRITE;
/*!40000 ALTER TABLE `programas_has_clases` DISABLE KEYS */;
INSERT INTO `programas_has_clases` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `programas_has_clases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `idRoles` int(11) NOT NULL COMMENT 'Este campo es la clave primaria de la tabla y  almacena el (id)',
  `nombre` varchar(20) NOT NULL COMMENT 'Este campo almacena el nombre de cada rol',
  `descripcion` text,
  PRIMARY KEY (`idRoles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador','Encargado del sistema de información'),(2,'Cliente','El acceso a consultas de las rutinas y el agendamiento de citas por parte de los usuarios'),(3,'PersonalMedico','Personal medico orientado al tratamiento de los programas del gimnasio');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolesusuarios`
--

DROP TABLE IF EXISTS `rolesusuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rolesusuarios` (
  `idRoles` int(11) NOT NULL DEFAULT '2' COMMENT 'Este campo almacena el (id) de la tabla "Roles"',
  `idUsuarios` bigint(20) NOT NULL COMMENT 'Este campo almacena el (id) de la tabla "Usuarios"',
  KEY `fkRoles_RolesUsuarios_idx` (`idRoles`),
  KEY `fk_UsuariosRoles_idx` (`idUsuarios`),
  CONSTRAINT `fK_RolesUsuarios` FOREIGN KEY (`idRoles`) REFERENCES `roles` (`idRoles`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_UsuariosRoles` FOREIGN KEY (`idUsuarios`) REFERENCES `usuarios` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolesusuarios`
--

LOCK TABLES `rolesusuarios` WRITE;
/*!40000 ALTER TABLE `rolesusuarios` DISABLE KEYS */;
INSERT INTO `rolesusuarios` VALUES (1,1031174466),(2,1600032140599),(1,1600112313399),(2,1602081548099),(3,1602120920199),(1,1603010433999),(1,1607032664899),(3,1609080393299),(1,1610122573899),(2,1611012149999),(3,1616110563599);
/*!40000 ALTER TABLE `rolesusuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rutinas`
--

DROP TABLE IF EXISTS `rutinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rutinas` (
  `idRutinas` int(11) NOT NULL COMMENT 'Este campo es la clave primaria de la tabla y  almacena el (id) ',
  `nombre` varchar(45) NOT NULL COMMENT 'Este campo almacena el nombre de la rutina',
  `descripcion` text NOT NULL,
  PRIMARY KEY (`idRutinas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rutinas`
--

LOCK TABLES `rutinas` WRITE;
/*!40000 ALTER TABLE `rutinas` DISABLE KEYS */;
INSERT INTO `rutinas` VALUES (1,'Rutina Prenatal','Programa de prevención, Acondicionamiento fisicio: Yoga, Pilates, Esferodinamia, Rumba, BodyJam. Curso Psicoprofiláctico, Spa y Relajación'),(2,'Rutina Posnatal','Programa de prevención, Acondicionamiento fisico: Yoga posparto, Pilates posparto, Tono, Acondicionamiento fisico. Área especializada en posparto y reducción de peso y medidas'),(3,'Rutina Club bebé','Taller Shantala, Baby rumba, Yoga Baby y Taller de primeros auxilios para padres y cuidadores');
/*!40000 ALTER TABLE `rutinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rutinaservicios`
--

DROP TABLE IF EXISTS `rutinaservicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rutinaservicios` (
  `idRutinaServicios` int(11) NOT NULL AUTO_INCREMENT,
  `idRutinas` int(11) NOT NULL,
  `idServicios` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRutinaServicios`),
  KEY `FkRutnas_RutinasServicios_idx` (`idRutinas`),
  KEY `FkServicios_RutinasServicios_idx` (`idServicios`),
  CONSTRAINT `FkRutnas_RutinasServicios` FOREIGN KEY (`idRutinas`) REFERENCES `rutinas` (`idRutinas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FkServicios_RutinasServicios` FOREIGN KEY (`idServicios`) REFERENCES `servicios` (`idServicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rutinaservicios`
--

LOCK TABLES `rutinaservicios` WRITE;
/*!40000 ALTER TABLE `rutinaservicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `rutinaservicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salones`
--

DROP TABLE IF EXISTS `salones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salones` (
  `id_salones` varchar(45) NOT NULL,
  `actividad` int(11) DEFAULT NULL,
  `salon` varchar(45) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_salones`),
  KEY `fk_salones_clases1_idx` (`actividad`),
  CONSTRAINT `fk_salones_clases1` FOREIGN KEY (`actividad`) REFERENCES `actividades` (`idadtividad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salones`
--

LOCK TABLES `salones` WRITE;
/*!40000 ALTER TABLE `salones` DISABLE KEYS */;
INSERT INTO `salones` VALUES ('1',1,'1','psap'),('2',2,'2','aisjd'),('3',3,'3','akjsdkl'),('4',4,'4','aksdkla'),('5',5,'5','asdasd');
/*!40000 ALTER TABLE `salones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicios` (
  `idServicio` int(11) NOT NULL COMMENT 'Este campo es la clave primaria de la tabla y  almacena el (id) de cada programa',
  `nombre` varchar(20) DEFAULT NULL COMMENT 'Este campo almacena el nombre de programa ',
  `descripcion` text COMMENT 'Este campo almacena una pequeña descripcion de cada programa',
  `tipo_servicio_idtipo_servicio` int(11) NOT NULL,
  `inicio` datetime DEFAULT NULL,
  `fin` datetime DEFAULT NULL,
  PRIMARY KEY (`idServicio`),
  KEY `fk_servicios_tipo_servicio1_idx` (`tipo_servicio_idtipo_servicio`),
  CONSTRAINT `fk_servicios_tipo_servicio1` FOREIGN KEY (`tipo_servicio_idtipo_servicio`) REFERENCES `tipo_servicio` (`idtipo_servicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,'Programa de promoció','Programa de prevención y promoción en el estado prenatal, valoración física realizada por profesional en Fisioterapia.',1,'2016-12-12 00:00:00','2017-05-05 00:00:00'),(2,'Acondicionamiento Fi','Clases de Salón especialmente diseñadas para total seguridad de las embarazadas',1,'2016-12-12 00:00:00','2017-05-05 00:00:00'),(3,'Curso Psicoprofiláct','Curso grupal o personalizado  de preparación para el parto y la maternidad.',1,'2016-12-12 00:00:00','2017-05-05 00:00:00'),(4,'Spa y Relajación','Masajes Prenatales: Masajes relajantes y drenajes linfáticos.  Spa Prenatal: Depilación completa especial para el parto, exfoliación corporal, hidratacion facial, chocolaterapia, masaje relajante, drenaje linfático, musicoterapia, aromaterapia, manicura y pedicura con productos naturales.',1,'2016-12-12 00:00:00','2017-05-05 00:00:00'),(5,'Programa de promoció','Valoración médica realizada por Ginecologia, valoración física realizada por Fisioterapeuta, valoración nutricional realizada por Nutricionista, valoración por médicina Estética.',2,'2016-12-12 00:00:00','2017-05-05 00:00:00'),(6,'Acondicionamiento Fí','Clases posparto de: yoga posparto, pilates posparto, tono y acondicionamiento fisico posnatal',2,'2016-12-12 00:00:00','2017-05-05 00:00:00'),(7,'Área Especializada','Manejo de la incontinencia urinaria por medio de Electroestimulación y biofeedback perineal y Drenaje mamario: Masajes especiales durante la lactancia para la prevención de la mastitis puerperal.',2,'2016-12-12 00:00:00','2017-05-05 00:00:00'),(8,'Reducción de peso y ','Sesiones especializadas para mujeres lactantes en posparto o poscesárea',2,'2016-12-12 00:00:00','2017-05-05 00:00:00'),(9,'Taller de Shantala','El arte de acariciar a tú bebé, técnica Hindu de estimulación a través del masaje. Regula el sistema digestivo, circulatorio, respiratorio y musculo- esqueletico; activa conexion afectiva con sus padres.',3,'2016-12-12 00:00:00','2017-05-05 00:00:00'),(10,'Baby Rumba','Ritmo y movimiento generan en el bebé la estimulación sensorial y el control vestibular, mejorando la tonificación neuromuscular. Activa la conexión papás - bebé, generando seguridad y tranquilidad.',3,'2016-12-12 00:00:00','2017-05-05 00:00:00'),(11,'Yoga Baby','Los movimientos suaves, armónicos y controlados del Yoga Baby favorecen la relajación y el equilibrio del bebé y la mamá.',3,'2016-12-12 00:00:00','2017-05-05 00:00:00'),(12,'Taller de Primeros A','Cuatro (4) sesiones teórico - prácticas de una (1) hora.',3,'2016-12-12 00:00:00','2017-05-05 00:00:00');
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesiones`
--

DROP TABLE IF EXISTS `sesiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sesiones` (
  `idSesiones` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Este campo es la clave primaria de la tabla y  almacena el (id) ',
  `idPersonalMedico` bigint(20) DEFAULT NULL COMMENT 'Este campo almacena el (id) de la tabla "Programa"',
  `fecha` date NOT NULL COMMENT 'Este campo almacena la fecha de la realizacion de la clase del programa',
  `hora` time DEFAULT NULL COMMENT 'Este campo almacena la hora en que se realiza el programa',
  `inscripciones_idInscripciones` int(11) NOT NULL,
  `estado` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`idSesiones`,`fecha`),
  KEY `FKPersonalSesiones` (`idPersonalMedico`),
  KEY `fk_sesiones_inscripciones1_idx` (`inscripciones_idInscripciones`),
  CONSTRAINT `FKPersonalSesiones` FOREIGN KEY (`idPersonalMedico`) REFERENCES `personalmedico` (`idPersonalMedico`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sesiones_inscripciones1` FOREIGN KEY (`inscripciones_idInscripciones`) REFERENCES `inscripciones` (`idInscripciones`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesiones`
--

LOCK TABLES `sesiones` WRITE;
/*!40000 ALTER TABLE `sesiones` DISABLE KEYS */;
/*!40000 ALTER TABLE `sesiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefonos`
--

DROP TABLE IF EXISTS `telefonos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefonos` (
  `id_telefono` int(11) NOT NULL,
  `numero` varchar(15) DEFAULT NULL,
  `tipo_telefono_idtipo_telefono` int(11) NOT NULL,
  PRIMARY KEY (`id_telefono`,`tipo_telefono_idtipo_telefono`),
  KEY `fk_telefonos_tipo_telefono1_idx` (`tipo_telefono_idtipo_telefono`),
  CONSTRAINT `fk_telefonos_tipo_telefono1` FOREIGN KEY (`tipo_telefono_idtipo_telefono`) REFERENCES `tipo_telefono` (`idtipo_telefono`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonos`
--

LOCK TABLES `telefonos` WRITE;
/*!40000 ALTER TABLE `telefonos` DISABLE KEYS */;
INSERT INTO `telefonos` VALUES (1,'906-8455',1),(2,'779-762-7318',2),(3,'203-9179',2),(4,'498-615-3176',2),(5,'752-285-5733',1),(6,'699-6237',2),(7,'135-3082',1),(8,'480-9367',2),(9,'901-589-2343',2),(10,'825-158-1977',2),(11,'132-683-5274',2),(12,'456-787-9648',1),(13,'245-410-7001',1),(14,'530-148-7682',2),(15,'357-760-4524',1),(16,'682-320-1173',2),(17,'350-569-9937',1),(18,'565-383-9299',1),(19,'676-1262',2),(20,'789-7332',1),(21,'354-0470',1),(22,'622-285-0449',1),(23,'285-8020',1),(24,'115-4660',2),(25,'282-429-7262',1),(26,'297-3059',2),(27,'988-364-8186',2),(28,'839-876-2241',1),(29,'395-910-2923',1),(30,'451-664-1052',1),(31,'538-5351',2),(32,'990-3747',1),(33,'187-187-2145',2),(34,'514-861-1342',2),(35,'850-6036',2),(36,'499-355-4256',1),(37,'639-663-4048',2),(38,'352-9580',2),(39,'728-3308',1),(40,'944-2352',2),(41,'308-3084',2),(42,'386-830-4249',1),(43,'691-633-5018',2),(44,'525-335-7184',1),(45,'780-3509',2),(46,'843-728-9069',2),(47,'763-906-2255',1),(48,'676-287-9729',2),(49,'268-3152',2),(50,'364-8399',1),(51,'414-5925',1),(52,'403-8104',1),(53,'323-5845',1),(54,'708-1691',1),(55,'594-7705',2),(56,'746-465-1255',1),(57,'613-802-7831',2),(58,'263-0313',2),(59,'465-893-4506',1),(60,'776-1161',1),(61,'238-399-8390',2),(62,'190-222-3655',1),(63,'754-181-5288',2),(64,'184-780-7422',1),(65,'879-2590',2),(66,'481-6103',1),(67,'543-4630',2),(68,'876-265-1247',1),(69,'340-495-3640',1),(70,'618-352-5570',1),(71,'185-772-8517',2),(72,'624-4952',1),(73,'658-2041',2),(74,'533-8514',2),(75,'727-9284',2),(76,'108-5830',2),(77,'802-7488',2),(78,'226-834-3639',1),(79,'956-932-7299',2),(80,'687-2538',1),(81,'412-869-9422',2),(82,'482-322-7448',2),(83,'310-2380',2),(84,'550-0652',1),(85,'759-321-9855',2),(86,'447-195-3710',1),(87,'103-9253',2),(88,'807-794-0055',2),(89,'711-4327',1),(90,'337-5176',2),(91,'886-3475',2),(92,'984-8961',1),(93,'312-531-5245',2),(94,'388-8277',2),(95,'431-130-0793',2),(96,'846-6895',1),(97,'618-427-5432',2),(98,'651-6902',2),(99,'632-3366',2),(100,'521-419-9930',2);
/*!40000 ALTER TABLE `telefonos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tg_registro_usuarios`
--

DROP TABLE IF EXISTS `tg_registro_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tg_registro_usuarios` (
  `fecha_registro` date DEFAULT NULL,
  `hora_registro` time DEFAULT NULL,
  `id_nuevo_usuario` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tg_registro_usuarios`
--

LOCK TABLES `tg_registro_usuarios` WRITE;
/*!40000 ALTER TABLE `tg_registro_usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tg_registro_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tg_roles_usuarios_after_update`
--

DROP TABLE IF EXISTS `tg_roles_usuarios_after_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tg_roles_usuarios_after_update` (
  `id_actualizacion_rol` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  `actualiza_id` bigint(20) DEFAULT NULL,
  `actualizo_id` bigint(20) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL,
  `anterior_usuario` bigint(20) DEFAULT NULL,
  `anterior_rol` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_actualizacion_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tg_roles_usuarios_after_update`
--

LOCK TABLES `tg_roles_usuarios_after_update` WRITE;
/*!40000 ALTER TABLE `tg_roles_usuarios_after_update` DISABLE KEYS */;
/*!40000 ALTER TABLE `tg_roles_usuarios_after_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_servicio`
--

DROP TABLE IF EXISTS `tipo_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_servicio` (
  `idtipo_servicio` int(11) NOT NULL,
  `tipo_servicio` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtipo_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_servicio`
--

LOCK TABLES `tipo_servicio` WRITE;
/*!40000 ALTER TABLE `tipo_servicio` DISABLE KEYS */;
INSERT INTO `tipo_servicio` VALUES (1,'Programa Prenatal'),(2,'Programa Posnatal'),(3,'Club bebé');
/*!40000 ALTER TABLE `tipo_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_telefono`
--

DROP TABLE IF EXISTS `tipo_telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_telefono` (
  `idtipo_telefono` int(11) NOT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idtipo_telefono`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_telefono`
--

LOCK TABLES `tipo_telefono` WRITE;
/*!40000 ALTER TABLE `tipo_telefono` DISABLE KEYS */;
INSERT INTO `tipo_telefono` VALUES (1,'Fijo'),(2,'Celular');
/*!40000 ALTER TABLE `tipo_telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `cedula` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Este campo almacena la cedula de todos los usuarios',
  `primer_nombre` varchar(20) NOT NULL COMMENT 'Este campo almacena el nombre de cada usuario',
  `segundo_nombre` varchar(20) DEFAULT NULL COMMENT 'Este campo almacena el apellido de cada usuario',
  `primer_apellido` varchar(20) NOT NULL,
  `segundo_apellido` varchar(20) DEFAULT NULL,
  `fechaNaci` date DEFAULT NULL COMMENT 'Este campo almacena la fecha de nacimineto de cada usuario',
  `clave` varchar(200) NOT NULL,
  `imegen_perfil` blob,
  `id_estados` int(11) DEFAULT '3',
  `fecha_registro` date DEFAULT NULL,
  PRIMARY KEY (`cedula`),
  KEY `fk_usuarios_estados_idx` (`id_estados`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_estados`) REFERENCES `estados` (`id_estados`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1031174466,'Nicol','Lorena','Maella ','Parra','1995-06-21','399dec8439a6d672fd92ea183f99e682',NULL,1,NULL),(1600032140599,'Gretchen','Janna','Mccray','Evans','1998-02-26','80a6c12e1ae3b63a86ec741aa8ef0cb4','Penatibus Et LLC',1,NULL),(1600112313399,'Quyn','Rebecca','Ortiz','Stewart','1995-04-27','EMS11CWJ1IY','Aenean Sed LLC',1,NULL),(1602081548099,'Denise','Patience','Atkins','Dominguez','1993-04-29','EOF50SRS7DA','Odio Sagittis Corp.',1,NULL),(1602120920199,'Kylee','Hanna','Diaz','Wallace','1999-08-30','VWV85GCH0MR','Vivamus Consulting',1,NULL),(1603010433999,'Abra','Zena','Stout','Deleon','1992-05-08','LCA51OMK3KU','Pede Et Risus Institute',1,NULL),(1607032664899,'Chantale','Diana','Melton','Lindsay','1994-03-11','IYF43GUJ4RN','Nulla Eu Neque Inc.',1,NULL),(1609080393299,'Brenda','Michelle','Joyner','Stone','1990-06-24','PDE34ARW3GD','Donec Consulting',1,NULL),(1610122573899,'Serena','Unity','Beard','David','1994-04-09','SKM13NKJ5EM','Pede Consulting',1,NULL),(1611012149999,'Kessie','Hedda','Robertson','Pace','1995-11-08','ZXO52JNG4PV','Eu Neque Foundation',1,NULL),(1616110563599,'Daphne','Ava','Johnson','Walls','1992-07-11','VFS24TEL8MC','Tristique Company',1,NULL),(1619012900899,'Lenore','Iliana','Kirkland','Rodgers','1995-11-22','IGW59YND0FH','A Ultricies Inc.',1,NULL),(1620021257999,'Minerva','Holly','Patton','Levine','1998-07-20','YVQ34QPD3DX','Mollis Company',1,NULL),(1620070122399,'Dominique','Aphrodite','Perez','Bell','1998-08-07','DHO55EBJ4YS','Eleifend Egestas Institute',1,NULL),(1624070236699,'Evelyn','Lisandra','Moon','Mckay','1991-09-10','JJW57UII7TG','Amet Risus Donec Limited',1,NULL),(1625122186199,'Aubrey','Virginia','Deleon','Mason','1996-11-25','NNR25LDT3TT','Condimentum PC',1,NULL),(1626052311299,'Mona','TaShya','Wooten','Clements','1998-06-02','JYB07IFL6HJ','Donec Luctus Institute',1,NULL),(1628112079399,'Rebekah','Isadora','Mann','Abbott','1995-04-24','ZSD58LJR0RU','Augue Porttitor Interdum Corp.',1,NULL),(1631030680699,'Lesley','Kylee','Clark','Acevedo','1997-08-26','WTH59JBK4CM','Non Nisi Institute',1,NULL),(1632031299399,'Illiana','Eve','Martin','Swanson','1996-03-27','TZH91FRD5RI','Fermentum Arcu Vestibulum Incorporated',1,NULL),(1633070177799,'Brenna','Autumn','Harper','Charles','1996-07-01','SWP76UXG9XM','Cursus Industries',1,NULL),(1634011459899,'Avye','Kaye','Frank','Church','1998-07-12','LEM36UNR9QG','Iaculis Aliquet Diam Corp.',1,NULL),(1635050159199,'Guinevere','Vanna','Mckinney','Morton','1994-10-17','BYO82RUL7AN','Nullam Velit Company',1,NULL),(1636110154999,'Clio','Sierra','Winters','Zimmerman','1993-10-03','UPE65RTB1GG','Ac Corp.',1,NULL),(1638021692099,'Judith','Lysandra','Rodriquez','Mcdowell','1999-07-24','GIB10SSR9PH','Orci Corp.',1,NULL),(1638072795999,'Regan','Lael','Coffey','Mcdaniel','1999-03-28','BCS05BRE6NK','Erat Neque Non Foundation',1,NULL),(1640062455699,'Regina','Leandra','Carrillo','Lott','1993-05-21','JWB65PAS4MN','Consectetuer Mauris Id Corporation',1,NULL),(1643051588399,'Hanna','Oprah','Nieves','Collins','1993-10-04','KVA93YSY7UH','Arcu Company',1,NULL),(1643062018899,'Zephr','Charlotte','Torres','Pennington','1993-01-26','RHD05REW2SV','Integer In Industries',1,NULL),(1644032003999,'Kylee','Giselle','Franco','Rodriquez','1996-04-21','PJO11PZK8GC','Pharetra Felis Eget LLC',1,NULL),(1644050781999,'Leah','Adara','Blackburn','Mcdonald','1990-09-22','NBK75FSV4WU','Libero Corporation',1,NULL),(1644071024399,'Kathleen','April','Wilkins','Singleton','1993-02-12','WEI55QMB1OO','Integer In Ltd',1,NULL),(1644110404799,'Xyla','Ivory','Arnold','Barnes','1991-12-11','SNX46OLI6TA','Dui Nec Tempus Company',1,NULL),(1646012369599,'Uta','Denise','Guthrie','Burnett','1996-06-27','PPA99HZW3IY','Imperdiet Non Vestibulum Company',1,NULL),(1646061457799,'Hollee','MacKensie','Whitney','Woods','1993-04-04','BQJ80DUI4RZ','Eget Volutpat Foundation',1,NULL),(1646062955099,'Quincy','Inga','Britt','Drake','1999-08-01','MBN38DZU8JS','Accumsan Sed Facilisis Associates',1,NULL),(1647062147599,'Maggie','Natalie','Booth','Berry','1997-10-08','VXY08KCW7UY','Quam Ltd',1,NULL),(1647072657899,'Raya','Kessie','Hines','Hull','1996-02-18','ZRX71GTH6BK','Sem Vitae Aliquam Company',1,NULL),(1647082077799,'Sydney','Alexandra','Black','Combs','1993-09-17','NKK14IJB2JK','Per Inceptos Hymenaeos PC',1,NULL),(1648031209799,'Ursula','Charde','Huff','Glover','1993-08-02','IRY28WPZ7LU','At PC',1,NULL),(1649020833299,'Blossom','Melissa','May','Koch','1992-11-27','AEX89MVL0RS','Molestie Associates',1,NULL),(1649051323699,'Chelsea','Brianna','Paul','Bowen','1990-07-14','DUJ31IEU5PN','Risus Nunc Corporation',1,NULL),(1650043095299,'Kylee','Nerea','Rosa','Sosa','1991-10-24','CWY43EHD1EF','Nec Orci Donec Company',1,NULL),(1652011895499,'Gail','Robin','Ratliff','Stout','1994-11-13','WPM35ENA5AI','Ac Mi Eleifend LLC',1,NULL),(1652102652399,'Hedy','Anjolie','Morton','Wright','1998-10-03','USL04XQP9US','Morbi Tristique Incorporated',1,NULL),(1653031551999,'Fallon','Sloane','Henson','Calhoun','1997-03-03','HBM34OZK3SK','Metus Aliquam Erat Associates',1,NULL),(1653062792899,'Caryn','Julie','Bernard','Church','1995-02-18','ZZG23AXP8PK','Cursus Nunc Industries',1,NULL),(1654041580999,'Hadley','Aurora','Collier','Salas','1995-04-29','RML62KST6DT','Tempor Industries',1,NULL),(1654051030299,'Keelie','Miriam','Crawford','Malone','1998-11-23','WWW70XJK6CH','Felis Purus Inc.',1,NULL),(1654082011399,'Alexis','Kameko','Chen','Ball','1995-01-23','OUX14VXK8NB','Non Luctus Sit Associates',1,NULL),(1654082763799,'Fallon','Winifred','Mays','Reed','1997-12-13','ELI39KIT0NF','Erat Eget Ipsum LLP',1,NULL),(1657072660599,'Jillian','Zoe','Beard','Arnold','1993-06-17','TBE13OKD0ID','Lacinia At Corporation',1,NULL),(1657081443599,'Fiona','Karyn','Mccall','Jordan','1994-05-15','SYU89EDU0MH','Gravida Sagittis Duis Limited',1,NULL),(1658051745199,'Joan','Lana','Blake','Velez','1996-10-05','YPP87ADH1MO','Placerat Consulting',1,NULL),(1658081702699,'Teegan','Dakota','Britt','Wynn','1991-05-05','QOT02BFW8GS','Dolor Egestas Rhoncus LLC',1,NULL),(1659020657099,'Ina','Halla','Goodman','Stanton','1999-12-09','CWS57LYT5DQ','Vitae Velit Egestas Ltd',1,NULL),(1660090704299,'Pascale','Noelle','Brooks','Munoz','1993-12-31','KWB85XXH4XA','Magna Nec Quam Foundation',1,NULL),(1661021815699,'Alyssa','Ina','Ford','Oneil','1997-01-14','GNK87TXV5GR','Enim Gravida Sit Company',1,NULL),(1661041780599,'Ruth','Farrah','Kennedy','Whitaker','1992-03-27','PBF35XJM6SQ','Luctus Company',1,NULL),(1662071657499,'Xena','Keely','Hahn','Santiago','1998-04-01','SFT12ZVC4ZL','Suspendisse Tristique Neque Limited',1,NULL),(1662072498799,'Naomi','Caryn','Wilder','Oneil','1992-09-21','REC97RDH1KB','Dignissim Tempor Arcu Corporation',1,NULL),(1663072618599,'Vivian','Lael','Higgins','Duke','1995-02-16','BMI30DUM3JQ','Sit Corp.',1,NULL),(1664050261499,'Tana','Rowan','Goodwin','Park','1993-02-15','WUG43NDO2RM','Nunc Industries',1,NULL),(1666082568399,'Eden','Neve','Vang','Palmer','1995-06-03','NWX40WZR1PN','Tincidunt Company',1,NULL),(1667091232899,'Taylor','Mallory','Ferrell','Chase','1999-03-17','OIE22AVX5HM','Rhoncus Associates',1,NULL),(1667113047799,'Nevada','Ayanna','Molina','Oneill','1999-03-19','TLO65IOK3YU','Erat Nonummy Ultricies Ltd',1,NULL),(1667122476399,'Darrel','Lillian','Woods','Santiago','1994-05-06','VDJ28CPK9YG','Sit Corp.',1,NULL),(1669040800199,'Breanna','Stephanie','Hopkins','Anthony','1993-06-11','LGZ28ITK9RP','Vehicula Foundation',1,NULL),(1670091641899,'Brielle','Ulla','Cain','Barker','1993-03-23','XGU04SUJ1WN','Imperdiet Erat Nonummy Ltd',1,NULL),(1670111517699,'Melissa','Lysandra','Whitehead','Lang','1993-05-04','CSV62EBU6OW','Risus Industries',1,NULL),(1671032851499,'Pearl','Neve','Beach','Fry','1993-07-01','CGO12LEF0LR','Faucibus Ltd',1,NULL),(1673052776899,'Cara','Sandra','Talley','Fox','1998-07-21','SLM50DRB5QH','Aliquet Libero Industries',1,NULL),(1674022095199,'Yetta','Maya','Justice','Hudson','1994-09-17','RFX92BJH2MJ','Tellus Incorporated',1,NULL),(1676061980799,'Stella','Unity','Bray','Macias','1991-09-27','LSI23WRQ9ND','Mi Lorem Corporation',1,NULL),(1677080338899,'Jescie','Kelsie','Robbins','Gilmore','1999-10-16','YXY91CPX8RI','Nulla Integer Vulputate Institute',1,NULL),(1678040526099,'Cherokee','Jayme','Carr','Burks','1992-11-07','KCZ37JQU2KP','Elit Pellentesque Incorporated',1,NULL),(1679100511999,'Tatum','Roanna','Woodard','Benton','1994-12-29','IGA13PQS1LM','Massa Associates',1,NULL),(1680011953799,'Serena','Amethyst','Dillard','Ferrell','1994-03-25','DHC18ZUC9VW','Et Arcu Associates',1,NULL),(1683082403599,'Deirdre','Ora','Holmes','Conway','1994-08-25','QLI99DKG8AL','Vel Turpis Corp.',1,NULL),(1684020282399,'Xandra','Zenaida','Romero','Stout','1995-12-25','UQT54IPK0DO','Erat Eget Ipsum Limited',1,NULL),(1685030614099,'Leslie','Kai','Donovan','Horne','1993-05-13','UGL16RNM8AV','Massa Suspendisse Inc.',1,NULL),(1687071412899,'Kiayada','Gail','Decker','Powell','1999-01-10','ALW37ZJN8BF','Nibh Vulputate Mauris Corporation',1,NULL),(1688012500799,'Clementine','Brianna','Wyatt','Harmon','1999-12-07','CNH03RXD6FO','Nec Leo Corporation',1,NULL),(1691102489599,'Maya','Whilemina','Terry','Garrison','1993-12-12','GEO35EVP2ST','Phasellus Dolor Industries',1,NULL),(1692061225799,'Nola','Brooke','Barber','Morin','1993-05-07','OUV44JOV2QH','Etiam Limited',1,NULL),(1692111185099,'Rhiannon','Amy','Schultz','Herring','1997-11-09','SYG83PYH0GV','Eget Volutpat Ornare Corporation',1,NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_usuario_before_insert` BEFORE INSERT ON `usuarios` FOR EACH ROW SET NEW.clave =  fc_encriptar(new.clave),
new.fecha_registro = CURRENT_DATE */;;
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_before_update_password` BEFORE UPDATE ON `usuarios` FOR EACH ROW SET new.clave = fc_encriptar(new.clave) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `usuarios_has_direcciones`
--

DROP TABLE IF EXISTS `usuarios_has_direcciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios_has_direcciones` (
  `id_direccion` smallint(6) NOT NULL AUTO_INCREMENT,
  `usuarios_cedula` bigint(20) NOT NULL,
  `direcciones_iddirecciones` int(11) NOT NULL,
  `vive_aqui` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_direccion`),
  KEY `fk_usuarios_has_direcciones_direcciones1_idx` (`direcciones_iddirecciones`),
  KEY `fk_usuarios_has_direcciones_usuarios1_idx` (`usuarios_cedula`),
  CONSTRAINT `fk_usuarios_has_direcciones_direcciones1` FOREIGN KEY (`direcciones_iddirecciones`) REFERENCES `direcciones` (`iddirecciones`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_has_direcciones_usuarios1` FOREIGN KEY (`usuarios_cedula`) REFERENCES `usuarios` (`cedula`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_has_direcciones`
--

LOCK TABLES `usuarios_has_direcciones` WRITE;
/*!40000 ALTER TABLE `usuarios_has_direcciones` DISABLE KEYS */;
INSERT INTO `usuarios_has_direcciones` VALUES (1,1031174466,1,1),(2,1600032140599,2,1),(4,1600112313399,4,1),(5,1602081548099,5,1),(6,1602120920199,6,1),(7,1603010433999,7,1),(10,1607032664899,10,1);
/*!40000 ALTER TABLE `usuarios_has_direcciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_has_telefonos`
--

DROP TABLE IF EXISTS `usuarios_has_telefonos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios_has_telefonos` (
  `usuarios_cedula` bigint(20) NOT NULL,
  `telefonos_id_telefono` int(11) NOT NULL,
  PRIMARY KEY (`usuarios_cedula`,`telefonos_id_telefono`),
  KEY `fk_usuarios_has_telefonos_telefonos1_idx` (`telefonos_id_telefono`),
  KEY `fk_usuarios_has_telefonos_usuarios1_idx` (`usuarios_cedula`),
  CONSTRAINT `fk_usuarios_has_telefonos_telefonos1` FOREIGN KEY (`telefonos_id_telefono`) REFERENCES `telefonos` (`id_telefono`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_has_telefonos_usuarios1` FOREIGN KEY (`usuarios_cedula`) REFERENCES `usuarios` (`cedula`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_has_telefonos`
--

LOCK TABLES `usuarios_has_telefonos` WRITE;
/*!40000 ALTER TABLE `usuarios_has_telefonos` DISABLE KEYS */;
INSERT INTO `usuarios_has_telefonos` VALUES (1031174466,1),(1600032140599,2),(1600112313399,4),(1602081548099,5),(1602120920199,6),(1603010433999,7),(1607032664899,10);
/*!40000 ALTER TABLE `usuarios_has_telefonos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-30  0:52:48
