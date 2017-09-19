CREATE DATABASE  IF NOT EXISTS `mapris` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `mapris`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mapris
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.25-MariaDB

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
-- Table structure for table `aplazamientos`
--

DROP TABLE IF EXISTS `aplazamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aplazamientos` (
  `fk_id_usuario` int(11) NOT NULL,
  `motivo` text COMMENT 'Este campo almacena la razon por la cual se hace el aplazamiento',
  `inicio` datetime DEFAULT NULL,
  `fin` datetime DEFAULT NULL,
  PRIMARY KEY (`fk_id_usuario`),
  CONSTRAINT `fk_aplazamientos_clientes1` FOREIGN KEY (`fk_id_usuario`) REFERENCES `clientes` (`fk_id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `fk_id_usuario` int(11) NOT NULL,
  `estado` varchar(20) NOT NULL COMMENT 'Este campo almacena el estado que se encuentra el cliente',
  `fk_id_empresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`fk_id_usuario`),
  KEY `fk_clientes_empresas2_idx` (`fk_id_empresa`),
  CONSTRAINT `fk_clientes_empresas2` FOREIGN KEY (`fk_id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_clientes_usuarios2` FOREIGN KEY (`fk_id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (3,'Activa',1),(4,'Activa',1),(6,'Activa',2),(7,'Activa',4),(8,'Activa',5),(9,'Activa',7),(10,'Activa',8),(12,'Activa',3),(13,'Activa',6),(14,'Activa',9);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cursos` (
  `id_curso` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_servicio` int(11) NOT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `sesiones` int(11) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_curso`),
  KEY `fk_cursos_servicios1_idx` (`fk_id_servicio`),
  CONSTRAINT `fk_cursos_servicios1` FOREIGN KEY (`fk_id_servicio`) REFERENCES `servicios` (`id_servicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,1,'En proceso',8,100000),(2,2,'En proceso',2,90000),(3,3,'En proceso',10,800000),(4,4,'En proceso',10,700000),(5,5,'En proceso',8,500000),(6,42,'En proceso',7,70000),(7,43,'En proceso',6,100000),(8,44,'En proceso',5,110000);
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datosclinicos`
--

DROP TABLE IF EXISTS `datosclinicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datosclinicos` (
  `id_datos_clinicos` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_sangre` varchar(3) DEFAULT NULL COMMENT 'Este campo almacena el tipo de sangre del cliente',
  `alergias` varchar(45) DEFAULT NULL COMMENT 'Este campo almacena el archivo correspondiente al dato clinico del programa Posparto',
  `url` varchar(80) DEFAULT NULL COMMENT 'Este campo almacena el archivo correspondiente al dato clinico del programa Prenatal',
  `fk_id_usuario` int(11) NOT NULL,
  `patologia` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_datos_clinicos`),
  KEY `fk_datosclinicos_clientes1_idx` (`fk_id_usuario`),
  CONSTRAINT `fk_datosclinicos_clientes1` FOREIGN KEY (`fk_id_usuario`) REFERENCES `clientes` (`fk_id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datosclinicos`
--

LOCK TABLES `datosclinicos` WRITE;
/*!40000 ALTER TABLE `datosclinicos` DISABLE KEYS */;
INSERT INTO `datosclinicos` VALUES (1,'O+','Alergia al polvo','/files/users/7777/profile_clinical_data/GUIA_APRENDIZAJE 4.4.pdf',3,'Diabetes');
/*!40000 ALTER TABLE `datosclinicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_horario`
--

DROP TABLE IF EXISTS `detalle_horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_horario` (
  `iddetalle_horario` int(11) NOT NULL AUTO_INCREMENT,
  `horarios_id_horario` int(11) NOT NULL,
  `hora_inicio` time DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `dia_semana` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddetalle_horario`),
  KEY `fk_detalle_horario_horarios1_idx` (`horarios_id_horario`),
  CONSTRAINT `fk_detalle_horario_horarios1` FOREIGN KEY (`horarios_id_horario`) REFERENCES `horarios` (`id_horario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_horario`
--

LOCK TABLES `detalle_horario` WRITE;
/*!40000 ALTER TABLE `detalle_horario` DISABLE KEYS */;
INSERT INTO `detalle_horario` VALUES (1,1,'08:00:00',10,1),(2,2,'02:00:00',4,2),(3,3,'10:00:00',11,3),(4,4,'09:00:00',11,4),(5,5,'03:00:00',4,5),(6,6,'08:00:00',10,6),(7,7,'02:00:00',4,3),(8,8,'10:00:00',11,2),(9,10,'07:38:40',8,0),(10,12,'07:38:40',8,0),(11,14,'07:40:12',8,0),(12,16,'10:26:00',6,3),(13,18,'07:06:00',NULL,4),(14,20,'07:06:00',NULL,4),(15,22,'04:03:00',6,1);
/*!40000 ALTER TABLE `detalle_horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresas` (
  `id_empresa` int(11) NOT NULL AUTO_INCREMENT,
  `NIT` varchar(20) NOT NULL COMMENT 'Este campo es la clave primaria de la tabla y  almacena el (id) ',
  `nombre` varchar(45) NOT NULL COMMENT 'Este campo almacena el nombre de la empresa',
  `direccionP` varchar(45) DEFAULT NULL,
  `direccionO` varchar(45) DEFAULT NULL,
  `telefonoF` bigint(20) DEFAULT NULL,
  `telefonoC` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (1,'8192','Cafam','Cll 54 # 32 - 53','Cra 182 # 45 - 31',1231231,4123123123),(2,'9178293','Exito','Cll 54 # 32 - 53','Cra 182 # 45 - 31',5019230,3109230182),(3,'954858-9887','Blake','P.O. Box 481, 1975 Nibh. Rd.','8010 Fermentum Street',7312981,3134123123),(4,'418612-6514','Pena','P.O. Box 688, 3360 Eu Rd.','P.O. Box 226, 5231 Arcu. Av.',8172317,1342341342),(5,'584158-3734','Mcdowell','2313 Purus, Ave','Ap #964-549 Accumsan Rd.',1827387,3123123123),(6,'893108-5313','Sanders','7022 Arcu. Av.','626-6647 Magna Road',8712377,3123123124),(7,'639694-3679','Sharpe','Ap #958-2347 Adipiscing Street','P.O. Box 899, 4071 Lorem Street',8712377,3212314124),(8,'656841-3972','Avery','Ap #606-9663 At Avenue','P.O. Box 695, 3626 Magnis Avenue',3123777,3125132333),(9,'712075-3715','Frederick','452-6850 Aliquam Street','732-6153 Tincidunt Road',1283818,3151231233),(10,'104558-6029','Ross','256-5728 Purus Rd.','Ap #679-6827 Faucibus Avenue',8172389,3141312313),(11,'035841-9208','Swanson','Ap #168-6789 Arcu. Rd.','Ap #340-1161 Non Street',3123123,3141231233),(12,'243287-6098','Barber','715-1332 Tellus Avenue','8038 Ut Av.',3123123,3141231231),(13,'954858-9887','Blake','P.O. Box 481, 1975 Nibh. Rd.','8010 Fermentum Street',1231233,3617277273),(14,'418612-6514','Pena','P.O. Box 688, 3360 Eu Rd.','P.O. Box 226, 5231 Arcu. Av.',4123133,3717273788),(15,'584158-3734','Mcdowell','2313 Purus, Ave','Ap #964-549 Accumsan Rd.',1241233,3717172727),(16,'893108-5313','Sanders','7022 Arcu. Av.','626-6647 Magna Road',4134233,3182721919),(17,'639694-3679','Sharpe','Ap #958-2347 Adipiscing Street','P.O. Box 899, 4071 Lorem Street',1231341,3717282838),(18,'656841-3972','Avery','Ap #606-9663 At Avenue','P.O. Box 695, 3626 Magnis Avenue',1342343,3127738189),(19,'712075-3715','Frederick','452-6850 Aliquam Street','732-6153 Tincidunt Road',1342344,8381727381),(20,'104558-6029','Ross','256-5728 Purus Rd.','Ap #679-6827 Faucibus Avenue',4231313,3818283828),(21,'035841-9208','Swanson','Ap #168-6789 Arcu. Rd.','Ap #340-1161 Non Street',4134134,3717283828),(22,'243287-6098','Barber','715-1332 Tellus Avenue','8038 Ut Av.',4132423,3172738189);
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estados` (
  `id_estados` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Los estados hace referencia al acceso del sistema de información, si su estado al momento de ingresar al sistema es bloqueado, no podrá ingresar, mientras que, si su estado es activo accedera con normalidad. Esto lo decide el administrador al bloquear o no un usuario, el estado por default que tendra un cliente al registrarse es bloqueado mientras se le asigna su programa y rutina, y se avala su inscripción',
  `nombre` varchar(45) DEFAULT NULL,
  `descripccion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_estados`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'Activo','Activo en el sistema'),(2,'Bloqueado','Bloqueado del sistema'),(3,'Sin Rol','Sin rol asignado en el sistema');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horarios`
--

DROP TABLE IF EXISTS `horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horarios` (
  `id_horario` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_curso` int(11) NOT NULL,
  `fechaInicio` date DEFAULT NULL,
  `fechaFin` date DEFAULT NULL,
  PRIMARY KEY (`id_horario`),
  KEY `fk_horarios_cursos1_idx` (`fk_id_curso`),
  CONSTRAINT `fk_horarios_cursos1` FOREIGN KEY (`fk_id_curso`) REFERENCES `cursos` (`id_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios`
--

LOCK TABLES `horarios` WRITE;
/*!40000 ALTER TABLE `horarios` DISABLE KEYS */;
INSERT INTO `horarios` VALUES (1,1,'2017-08-10','2017-08-12'),(2,2,'2017-08-12','2017-08-14'),(3,3,'2017-08-14','2017-08-16'),(4,4,'2017-08-16','2017-08-18'),(5,5,'2017-08-20','2017-08-24'),(6,6,'2017-08-25','2017-08-30'),(7,7,'2017-09-01','2017-09-05'),(8,8,'2017-09-05','2017-09-10'),(9,5,'2017-09-30','2017-12-11'),(10,5,'2017-09-30','2017-12-11'),(11,5,'2017-09-30','2017-12-11'),(12,5,'2017-09-30','2017-12-11'),(13,6,'2017-09-30','2017-12-11'),(14,6,'2017-09-30','2017-12-11'),(15,5,'2017-09-10','2017-12-11'),(16,5,'2017-09-10','2017-12-11'),(17,6,'2017-09-01','2017-09-30'),(18,6,'2017-09-01','2017-09-30'),(19,6,'2017-09-01','2017-09-30'),(20,6,'2017-09-01','2017-09-30'),(21,1,'2017-09-01','2017-09-30'),(22,1,'2017-09-01','2017-09-30');
/*!40000 ALTER TABLE `horarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscripciones`
--

DROP TABLE IF EXISTS `inscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscripciones` (
  `id_inscripcion` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_curso` int(11) NOT NULL,
  `fk_id_usuario` int(11) NOT NULL,
  `estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_inscripcion`),
  KEY `fk_clientes_has_cursos_cursos1_idx` (`fk_id_curso`),
  KEY `fk_inscripciones_clientes1_idx` (`fk_id_usuario`),
  CONSTRAINT `fk_clientes_has_cursos_cursos1` FOREIGN KEY (`fk_id_curso`) REFERENCES `cursos` (`id_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inscripciones_clientes1` FOREIGN KEY (`fk_id_usuario`) REFERENCES `clientes` (`fk_id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripciones`
--

LOCK TABLES `inscripciones` WRITE;
/*!40000 ALTER TABLE `inscripciones` DISABLE KEYS */;
INSERT INTO `inscripciones` VALUES (1,1,4,'Activa'),(2,2,3,'Activa');
/*!40000 ALTER TABLE `inscripciones` ENABLE KEYS */;
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
  KEY `fk_permisos_permisos1_idx` (`permisos_padre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
INSERT INTO `permisos` VALUES (10,'perfil','','portrait',NULL),(11,'miPerfil','/app/perfil/miperfil.xhtml','fa fa-user',10),(12,'cambiarDatos','/app/perfil/cambiardatos.xhtml','fa fa-pencil',10),(20,'administradores','','group',NULL),(21,'nuevoUsuario','/app/administrador/usuarios/nuevo.xhtml','fa fa-user-plus',20),(22,'listarUsuarios','/app/administrador/usuarios/administradores.xhtml','fa fa-list',20),(30,'aplazamientos','','insert invitation',NULL),(31,'verAplazamiento','/app/aplazamientos/verCliente.xhtml','fa fa-user',30),(32,'verAplazamiento','/app/aplazamientos/ver.xhtml','fa fa-user',30),(33,'registrarAplazamiento','/app/aplazamientos/registrarAplazamiento.xhtml','fa fa-plus',30),(34,'listaAplazamientos','/app/aplazamientos/lista.xhtml','fa fa-list',30),(40,'calendario','','date range',NULL),(41,'nuevoCalendario','/app/administrador/calendario/nuevo.xhtml','fa fa-user-plus',40),(42,'listarCalendario','/app/administrador/calendario/calendario.xhtml','fa fa-calendar',40),(43,'Mi calendario','/app/cliente/calendario/calendario.xhtml',NULL,40),(50,'agendar','','content paste',NULL),(51,'reservar','/app/cliente/servicios/servicios.xhtml','fa fa-pencil-square-o',50),(60,'inscripciones','/app/administrador/inscripciones/ver.xhtml','content paste',NULL),(61,'listaInscripciones','/app/administrador/inscripciones/inscripciones.xhtml','fa fa-list-ol',60),(62,'editarIncripcion','/app/administrador/inscripciones/editar.xhtml','fa fa-pencil',60),(63,'nuevaInscripcion','/app/administrador/inscripciones/registrar.xhtml','fa fa-user-plus',60),(70,'empresa','/app/administrador/empresa/ver.xhtml','business center',NULL),(71,'listarEmpresas','/app/administrador/empresa/empresas.xhtml','fa fa-th-large',70),(72,'editarEmpresa','/app/administrador/empresa/editar.xhtml','fa fa-pencil',70),(73,'nuevaEmpresa','/app/administrador/empresa/registrar.xhtml','fa fa-user-plus',70),(90,'salones','/app/administrador/salones/ver.xhtml','fa fa-cog',NULL),(91,'editarSalones','/app/administrador/salones/editar.xhtml','fa fa-user',90),(92,'listarSalones','/app/administrador/salones/salones.xhtml','fa fa-user',90),(93,'registrarSalones','/app/administrador/salones/registrar.xhtml','fa fa-user',90),(120,'personalMedico','/app/administrador/personal/ver.xhtml','fa fa-user',NULL),(121,'listarPersonal','/app/administrador/personal/medico.xhtml','fa fa-th-large',120),(122,'nuevoPersonal','/app/administrador/personal/registrar.xhtml','fa fa-user-plus',120),(130,'salonesServicios','/app/administrador/salones-servicios/editar.xhtml','fa fa-user',NULL),(131,'listarSalonesServicios','/app/administrador/salones-servicios/salones-servicios.xhtml','fa fa-th-large',130),(132,'nuevoSalonesServicios','/app/administrador/salones-servicios/nuevo.xhtml','fa fa-user',130),(140,'servicio','/app/administrador/servicios/ver.xhtml','fa fa-user',NULL),(141,'listarServicio','/app/administrador/servicios/servicios.xhtml','fa fa-th-large',140),(142,'registrarServicio','/app/administrador/servicios/registrar.xhtml','fa fa-th-large',140),(143,'editarServicio','/app/administrador/servicios/editar.xhtml','fa fa-th-large',140),(150,'cliente','/app/administrador/clientes/ver.xhtml','fa fa-th-large',NULL),(151,'registrarCliente','/app/administrador/clientes/registrar.xhtml','fa fa-user',150),(152,'editarCliente','/app/administrador/clientes/editar.xhtml','fa fa-user',150),(153,'listarCliente','/app/administrador/clientes/cliente.xhtml','fa fa-user',150),(160,'datosClinicos','','fa fa-user',NULL),(161,'verDatos','/app/cliente/datos/ver.xhtml','fa fa-user',160),(162,'registrarDatos','/app/cliente/datos/registrar.xhtml','fa fa-user',160),(170,'datosClinicos',NULL,'fa fa-user',NULL),(171,'verDatos','/app/personal/datos/ver.xhtml','fa fa-user',170),(172,'listarDatos','/app/personal/datos/clinicos.xhtml','fa fa-user',170),(180,'Grafico','','fa fa-user',NULL),(181,'Ver','/app/administrador/grafico/ver.xhtml','',180),(190,'Rutinas',NULL,'fa fa-user',NULL),(191,'Ver Rutina','/app/cliente/programas/prenatal/programapre.xhtml','',190),(200,'Rutinas',NULL,'fa fa-user',NULL),(201,'Ver Rutina','/app/cliente/programas/posnatal/programapos.xhtml','',200),(210,'Rutinas',NULL,'fa fa-user',NULL),(211,'Ver Rutina','/app/cliente/programas/clubbebe/programabebe.xhtml','',210);
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisosroles`
--

DROP TABLE IF EXISTS `permisosroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permisosroles` (
  `fk_id_permiso` int(11) NOT NULL,
  `fk_id_rol` int(11) NOT NULL,
  PRIMARY KEY (`fk_id_permiso`,`fk_id_rol`),
  KEY `fk_permisos_has_roles_roles1_idx` (`fk_id_rol`),
  KEY `fk_permisos_has_roles_permisos1_idx` (`fk_id_permiso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisosroles`
--

LOCK TABLES `permisosroles` WRITE;
/*!40000 ALTER TABLE `permisosroles` DISABLE KEYS */;
INSERT INTO `permisosroles` VALUES (10,1),(10,2),(10,3),(10,4),(10,5),(11,1),(11,2),(11,3),(11,4),(11,5),(12,1),(12,2),(12,3),(12,4),(12,5),(20,1),(21,1),(22,1),(30,1),(30,2),(30,3),(30,4),(30,5),(31,2),(31,3),(31,4),(32,5),(33,2),(33,3),(33,4),(34,1),(40,1),(40,2),(40,3),(40,4),(40,5),(41,1),(41,5),(42,1),(42,5),(43,2),(43,3),(43,4),(50,2),(50,3),(50,4),(51,2),(51,3),(51,4),(60,1),(61,1),(62,1),(63,1),(70,1),(71,1),(72,1),(73,1),(90,5),(91,5),(92,5),(93,5),(120,1),(121,1),(122,1),(130,5),(131,5),(132,5),(140,5),(141,5),(142,5),(143,5),(150,1),(151,1),(152,1),(153,1),(160,2),(160,3),(160,4),(161,2),(161,3),(161,4),(162,2),(162,3),(162,4),(170,5),(171,5),(172,5),(180,1),(181,1),(190,2),(191,2),(200,3),(201,3),(210,4),(211,4);
/*!40000 ALTER TABLE `permisosroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personalmedico`
--

DROP TABLE IF EXISTS `personalmedico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personalmedico` (
  `fk_id_usuario` int(11) NOT NULL,
  `perfilProfesional` varchar(45) NOT NULL COMMENT 'Este campo almacena la especialidad que tiene cada Personal Medico ',
  `cargo` varchar(20) NOT NULL COMMENT 'Este campo almacena el tipo de cargo que tiene el personal Medico (Prenatal o Posnatal)',
  PRIMARY KEY (`fk_id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personalmedico`
--

LOCK TABLES `personalmedico` WRITE;
/*!40000 ALTER TABLE `personalmedico` DISABLE KEYS */;
INSERT INTO `personalmedico` VALUES (3,'Pediatra','Profesional '),(4,'Ginicologo','Profesional '),(11,'Nutricionista','Profesional ');
/*!40000 ALTER TABLE `personalmedico` ENABLE KEYS */;
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
INSERT INTO `roles` VALUES (1,'Administrador','Encargado primordial del sistema'),(2,'Cliente Prenatal','Usuario recurrente en el area Prenatal'),(3,'Cliente Posnatal','Usuario recurrente en el area Posnatal'),(4,'Clientes Club Bebe','Usuario recurrente en el area Club bebe'),(5,'Personal Medico','Personal involucrado del gimnasio');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolesusuarios`
--

DROP TABLE IF EXISTS `rolesusuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rolesusuarios` (
  `fk_id_roles` int(11) NOT NULL DEFAULT '2' COMMENT 'Este campo almacena el (id) de la tabla "Roles"',
  `fk_id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`fk_id_usuario`,`fk_id_roles`),
  KEY `fkRoles_RolesUsuarios_idx` (`fk_id_roles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolesusuarios`
--

LOCK TABLES `rolesusuarios` WRITE;
/*!40000 ALTER TABLE `rolesusuarios` DISABLE KEYS */;
INSERT INTO `rolesusuarios` VALUES (2,3),(5,4),(1,5),(2,6),(3,7),(3,8),(4,9),(4,10),(5,11),(2,12),(3,13),(4,14);
/*!40000 ALTER TABLE `rolesusuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salones`
--

DROP TABLE IF EXISTS `salones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salones` (
  `id_salones` int(11) NOT NULL AUTO_INCREMENT COMMENT 'La tabla salones hace referencia los espacios que tiene el gimnasio para el desarrollo de cada uno de los programas\n',
  `salon` varchar(45) NOT NULL,
  `descripcion` text,
  `estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_salones`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salones`
--

LOCK TABLES `salones` WRITE;
/*!40000 ALTER TABLE `salones` DISABLE KEYS */;
INSERT INTO `salones` VALUES (1,'Salón Prenatal A','Salón acondicionado con elementos fisicos, para las actividades prenatales','Activo'),(2,'Salón Prenatal B','Salón medico, para las actividades prenatales','Activo'),(3,'Salón Posnatal A','Salón acondicionado con elementos fisicos, para las actividades posnatales','Activo'),(4,'Salón Posnatal B','Salón medico, para las actividades posnatales','Activo'),(5,'Salón Club bebe A','Salón acondicionado con elementos fisicos, para las actividades club bebe','Activo'),(6,'Salón Club bebe B','Salón medico, para las actividades posnatales club bebe','Activo'),(7,'Salón Spa A','Salon de relajamiento ','Activo'),(8,'Salón Spa B','Salon de relajamiento ','Activo');
/*!40000 ALTER TABLE `salones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salones_has_servicios`
--

DROP TABLE IF EXISTS `salones_has_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salones_has_servicios` (
  `salones_id_salones` int(11) NOT NULL,
  `servicios_id_servicio` int(11) NOT NULL,
  `estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`salones_id_salones`,`servicios_id_servicio`),
  KEY `fk_salones_has_servicios_servicios1_idx` (`servicios_id_servicio`),
  KEY `fk_salones_has_servicios_salones1_idx` (`salones_id_salones`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salones_has_servicios`
--

LOCK TABLES `salones_has_servicios` WRITE;
/*!40000 ALTER TABLE `salones_has_servicios` DISABLE KEYS */;
INSERT INTO `salones_has_servicios` VALUES (1,1,'Vinculado'),(1,2,'Vinculado'),(1,6,'Vinculado'),(1,8,'Vinculado'),(2,3,'Vinculado'),(2,7,'Vinculado'),(2,9,'Vinculado'),(3,4,'Vinculado'),(5,5,'Vinculado');
/*!40000 ALTER TABLE `salones_has_servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicios` (
  `id_servicio` int(11) NOT NULL AUTO_INCREMENT COMMENT 'La tabla servicios hace referencia a los servicios que el gimnasio ofrece en los programas o independientemente de ellos, es decir, Spa, Pilates, Yoga, Baby Rumba, Control Nutricional, entre otros. Por lo general las rutinas contienen una serie de servicios y una rutina podrá pertenecer a muchos programas que harían un paquete completo que ofrece el gimnasio. ',
  `nombre` varchar(50) DEFAULT NULL COMMENT 'Este campo almacena el nombre de programa ',
  `descripcion` text COMMENT 'Este campo almacena una pequeña descripcion de cada programa',
  `valor` double DEFAULT NULL,
  `objetivo` text,
  `sesiones` int(11) NOT NULL,
  `fk_sub_servicios` int(11) DEFAULT NULL,
  `fk_tipo_servicio` int(11) NOT NULL,
  PRIMARY KEY (`id_servicio`),
  KEY `fk_servicios_subservicios_idx` (`fk_sub_servicios`),
  KEY `fk_servicios_tipos_servicios1_idx` (`fk_tipo_servicio`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,'Yoga','Clase de relajación orientada a las artes orientales del Yoga',100000,'Relajación',4,NULL,3),(2,'Pilates','Clase de acondicionamiento fisico',90000,'Acondicionamiento fisico',3,NULL,3),(3,'Prenatal','Programa completo prenata',800000,'Mentalidad sana para recibir el nuevo bebe',10,NULL,1),(4,'Posnatal','Programa completo posnata',700000,'Recuperar la figura',10,NULL,1),(5,'Club bebe','Programa completo club bebe',500000,'Interactuar en familia',8,NULL,1),(6,'Programas de promoción y preve','Valoracion fisica',NULL,NULL,0,3,2),(7,'Acondicionamiento Físico','Clases que mejoran el estado fisico',NULL,NULL,0,3,2),(8,'Curso Psicoprofiláctico','Preparación para el parto y la maternidad.',NULL,NULL,0,3,2),(9,'Spa y Relajación','Relajacion y descanso',NULL,NULL,0,3,2),(12,'Programa de promoción y prevencion','Valoracion fisica',NULL,'',0,4,2),(13,'Acondicionamiento Físico','Clases que mejoran el estado fisico',NULL,NULL,0,4,2),(14,'Área Especializada','Area medica',NULL,NULL,0,4,2),(15,'Reducción de peso y medidas','Ponte en forma',NULL,NULL,0,4,2),(16,'Taller de Shantala','técnica Hindu de estimulación a través del masaje',NULL,NULL,0,5,2),(17,'Baby Rumba','Ritmo y movimiento generan en el bebé la estimulación sensorial',NULL,NULL,0,5,2),(18,'Yoga Baby','Los movimientos suaves, armónicos ',NULL,NULL,0,5,2),(19,'Taller de Primeros Auxilios','Seguridad del bebé',NULL,NULL,0,5,2),(42,'Programas de promoción y preve',NULL,70000,NULL,0,NULL,3),(43,'Acondicionamiento Físico',NULL,80000,NULL,0,NULL,3),(44,'Curso Psicoprofiláctico',NULL,100000,NULL,0,NULL,3),(45,'Spa y Relajación',NULL,120000,NULL,0,NULL,3),(46,'Programa de promoción y preven',NULL,130000,NULL,0,NULL,3),(47,'Área Especializada',NULL,150000,NULL,0,NULL,3),(48,'Reducción de peso y medidas',NULL,160000,NULL,0,NULL,3),(49,'Taller de Shantala',NULL,100000,NULL,0,NULL,3),(50,'Yoga Baby',NULL,90000,NULL,0,NULL,3),(51,'Baby Rumba',NULL,120000,NULL,0,NULL,3),(52,'Taller de Primeros Auxilios',NULL,60000,NULL,0,NULL,3),(53,'Ginecologa',NULL,70000,NULL,0,NULL,4),(54,'Nutricionista',NULL,80000,NULL,0,NULL,4),(55,'Terapeuta',NULL,90000,NULL,0,NULL,4);
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_servicios`
--

DROP TABLE IF EXISTS `tipos_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos_servicios` (
  `id_tipo_servicio` int(11) NOT NULL AUTO_INCREMENT,
  `tipos_servicio` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_servicio`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_servicios`
--

LOCK TABLES `tipos_servicios` WRITE;
/*!40000 ALTER TABLE `tipos_servicios` DISABLE KEYS */;
INSERT INTO `tipos_servicios` VALUES (1,'Programa','Agrupación de servicios'),(2,'Rutina','Servicio conformado por distintas actividades'),(3,'Servicio','Actividad individual'),(4,'Cita Medica','Cita de salud');
/*!40000 ALTER TABLE `tipos_servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(20) NOT NULL COMMENT 'Este campo almacena la cedula de todos los usuarios',
  `nombres` varchar(20) NOT NULL COMMENT 'Este campo almacena el nombre de cada usuario',
  `apellidos` varchar(20) NOT NULL,
  `clave` varchar(200) NOT NULL,
  `fechaNaci` date DEFAULT NULL COMMENT 'Este campo almacena la fecha de nacimineto de cada usuario',
  `imagen_perfil` varchar(100) DEFAULT NULL,
  `correoElectronico` varchar(45) DEFAULT NULL,
  `telefonoFijo` varchar(7) DEFAULT '0000000',
  `telefonoCelular` varchar(10) DEFAULT '310000000',
  `fecha_registro` date DEFAULT NULL,
  `fk_id_estados` int(11) NOT NULL DEFAULT '3',
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `cedula_UNIQUE` (`cedula`),
  KEY `fk_usuarios_estados_idx` (`fk_id_estados`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (3,'7777','Maria','Loaiza','lola','1999-08-10',NULL,'mari@gmail.com','5019230','3109230182','2017-08-03',1),(4,'9999','Sandra','Paez','lola','1999-01-01',NULL,'mari@gmail.com','3123123','3123123123','2017-08-09',1),(5,'2222','Kitra','Dane','lola','0000-00-00',NULL,'porttitor.tellus@eumetus.edu','03 99 5','(545) 754-','2017-09-04',1),(6,'33814330','Lael','Macon','lola','0000-00-00',NULL,'dui.Cum.sociis@nonluctussit.ca','09 23 1','(348) 968-','2017-09-04',1),(7,'36725575','Eleanor','Shad','lola','0000-00-00',NULL,'hendrerit@aliquet.edu','08 42 4','(136) 529-','2017-09-04',1),(8,'8054203','Morgan','Byron','lola','0000-00-00',NULL,'Aliquam.gravida.mauris@natoquepenatibuset.org','09 59 5','(305) 625-','2017-09-04',1),(9,'17590748','Galena','Zahir','lola','0000-00-00',NULL,'Curabitur.ut.odio@risusNullaeget.edu','07 47 6','(156) 904-','2017-09-04',1),(10,'27958069','Halla','Dante','lola','0000-00-00',NULL,'sapien.Cras.dolor@utcursus.net','04 53 0','(314) 259-','2017-09-04',1),(11,'7428683','Faith','Plato','lola','0000-00-00',NULL,'eu.odio@penatibuset.org','03 19 7','(116) 537-','2017-09-04',1),(12,'20518418','Roanna','Jeremy','lola','0000-00-00',NULL,'mi@maurisrhoncusid.ca','04 42 4','(597) 892-','2017-09-04',1),(13,'41479865','Eliana','Neville','lola','0000-00-00',NULL,'mollis@egetnisi.org','03 01 3','(700) 853-','2017-09-04',1),(14,'42861327','Gillian','Allen','lola','0000-00-00',NULL,'adipiscing.lobortis.risus@aliquam.net','03 89 5','(779) 351-','2017-09-04',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mapris'
--

--
-- Dumping routines for database 'mapris'
--
/*!50003 DROP FUNCTION IF EXISTS `fc_descencriptar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fc_descencriptar`(`clave_codificada` VARCHAR(10)) RETURNS varchar(10) CHARSET latin1
BEGIN
DECLARE var VARCHAR(10);
SET var = (SELECT decode(clave_codificada,255));
RETURN var;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fc_encriptar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fc_encriptar`(`clave` VARCHAR(35) CHARSET utf8) RETURNS varchar(35) CHARSET utf8
BEGIN
DECLARE var VARCHAR(35);
SET var = (SELECT MD5(clave));
return var;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_validar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_validar_usuario`(IN `pr_cedula` VARCHAR(20), IN `pr_clave` VARCHAR(20))
    NO SQL
SELECT * FROM usuarios WHERE cedula = pr_cedula AND  fc_encriptar(clave) = fc_encriptar(pr_clave) ;;
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

-- Dump completed on 2017-09-18 21:42:41
