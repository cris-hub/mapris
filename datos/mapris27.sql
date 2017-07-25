CREATE DATABASE  IF NOT EXISTS `mapris` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mapris`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mapris
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
  `idaplazamiento` int(11) NOT NULL,
  `motivo` text COMMENT 'Este campo almacena la razon por la cual se hace el aplazamiento',
  `idcliente` bigint(20) NOT NULL,
  `inicio` datetime DEFAULT NULL,
  `fin` datetime DEFAULT NULL,
  PRIMARY KEY (`idaplazamiento`),
  KEY `FKClientesAplazamientos_idx` (`idcliente`),
  CONSTRAINT `FKClientesAplazamientos` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idClientes`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `calendario`
--

DROP TABLE IF EXISTS `calendario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendario` (
  `idCalendario` int(11) NOT NULL,
  `lunes` datetime DEFAULT NULL,
  `martes` datetime DEFAULT NULL,
  `miercoles` datetime DEFAULT NULL,
  `jueves` datetime DEFAULT NULL,
  `viernes` datetime DEFAULT NULL,
  `sabado` datetime DEFAULT NULL,
  `domingo` datetime DEFAULT NULL,
  PRIMARY KEY (`idCalendario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendario`
--

LOCK TABLES `calendario` WRITE;
/*!40000 ALTER TABLE `calendario` DISABLE KEYS */;
INSERT INTO `calendario` VALUES (1,'0000-00-00 00:00:00','2017-07-04 00:00:00','2017-07-04 00:00:00','2017-07-04 00:00:00','2017-07-04 00:00:00','2017-07-04 00:00:00','2017-07-04 00:00:00');
/*!40000 ALTER TABLE `calendario` ENABLE KEYS */;
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
INSERT INTO `clientes` VALUES (112312,1,'Activo');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `datosclinicos` ENABLE KEYS */;
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
INSERT INTO `empresa` VALUES (1,'Cafam','Cll 45 # 45 -12','Cll 43 # 45-45',6524144,3109463525);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'Activo','Usuario que puede ingresar al sistem'),(2,'Bloqueado','Usuario que ha sido dado de baja en el sistem'),(3,'Inhabilitado','Usuario a la espera de habilitar la cuenta');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fechas_disponibles`
--

DROP TABLE IF EXISTS `fechas_disponibles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fechas_disponibles` (
  `idFechas` int(11) NOT NULL,
  `fechas_disponibles` datetime DEFAULT NULL,
  PRIMARY KEY (`idFechas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fechas_disponibles`
--

LOCK TABLES `fechas_disponibles` WRITE;
/*!40000 ALTER TABLE `fechas_disponibles` DISABLE KEYS */;
/*!40000 ALTER TABLE `fechas_disponibles` ENABLE KEYS */;
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
  `idPrograma` int(11) NOT NULL,
  `fechaInicio` date DEFAULT NULL COMMENT 'Este campo almacena la fecha en que fue realizada la incripcion al programa',
  `valor` int(11) DEFAULT NULL COMMENT 'Este campo almacena el coste de la inscripcion',
  `estado` varchar(25) DEFAULT NULL,
  `fechaAplazamiento` datetime DEFAULT NULL,
  `fechaRetornoAplazamiento` datetime DEFAULT NULL,
  `idSesiones` int(11) NOT NULL,
  PRIMARY KEY (`idInscripciones`),
  KEY `fk_InscripcionesCliente_idx` (`idCliente`),
  KEY `fk_inscripciones_programas1_idx` (`idPrograma`),
  KEY `fk_inscripciones_sesiones1_idx` (`idSesiones`),
  CONSTRAINT `fk_InscripcionesCliente` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idClientes`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_inscripciones_programas1` FOREIGN KEY (`idPrograma`) REFERENCES `programas` (`idPrograma`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inscripciones_sesiones1` FOREIGN KEY (`idSesiones`) REFERENCES `sesiones` (`idSesiones`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripciones`
--

LOCK TABLES `inscripciones` WRITE;
/*!40000 ALTER TABLE `inscripciones` DISABLE KEYS */;
INSERT INTO `inscripciones` VALUES (1,112312,1,'2017-09-09',300000,'Activa',NULL,NULL,3),(5,112312,1,'2017-07-24',10000,'activo',NULL,NULL,1);
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
  KEY `fk_permisos_permisos1_idx` (`permisos_padre`),
  CONSTRAINT `fk_permisos_permisos1` FOREIGN KEY (`permisos_padre`) REFERENCES `permisos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
INSERT INTO `permisos` VALUES (0,'inicio','/app/index.xhtml\n','fa fa-home',NULL),(1,'perfil','','perm identity',NULL),(2,'usuarios','/app/administrador/usuarios/ver.xhtml','group',NULL),(3,'aplazamientos','','fa fa-clock-o',NULL),(4,'citas','','fa fa-calendar-check-o',NULL),(5,'calendario','','fa fa-calendar',NULL),(6,'agendar','','fa fa-calendar-check-o',NULL),(7,'inscripciones','/app/administrador/inscripciones/ver.xhtml','fa fa-list-alt',NULL),(8,'empresa','/app/administrador/empresa/ver.xhtml','fa fa-columns',NULL),(9,'rutina','/app/administrador/rutinas/ver.xhtml','fa fa-user-plus',NULL),(10,'sesiones','/app/administrador/sesiones/ver.xhtml','fa fa-cog',NULL),(11,'miPerfil','/app/perfil/miperfil.xhtml','fa fa-user',1),(12,'cambiarDatos','/app/perfil/cambiardatos.xhtml','fa fa-pencil',1),(13,'programas',NULL,NULL,NULL),(21,'listarUsuarios','/app/usuarios/listar.xhtml','fa fa-list',2),(22,'nuevoUsuario','/app/usuarios/nuevo.xhtml','fa fa-user-plus',2),(30,'editarAplazamiento','/app//usuarios/editar.xhtml','fa fa-pencil-square-o',2),(31,'listaAplazamientos','/app/aplazamientos/lista.xhtml','fa fa-list',3),(32,'registrarAplazamiento','/app/aplazamientos/registrarAplazamiento.xhtml','fa fa-plus',3),(41,'misProgramas','/app/cliente/programas/programas.xhtml',NULL,13),(51,'nuevoCalendario','/app/administrador/calendario/nuevo.xhtml','fa fa-user-plus',5),(52,'listarCalendario','/app/administrador/calendario/calendario.xhtml','fa fa-calendar',5),(61,'reservar','/app/cliente/servicios/servicios.xhtml','fa fa-pencil-square-o',6),(71,'listaInscripciones','/app/administrador/inscripciones/inscripciones.xhtml','fa fa-list-ol',7),(72,'editarIncripcion','/app/administrador/inscripciones/editar.xhtml','fa fa-pencil',7),(73,'nuevaInscripcion','/app/administrador/inscripciones/registrar.xhtml','fa fa-user-plus',7),(81,'listarEmpresas','/app/administrador/empresa/empresas.xhtml','fa fa-th-large',8),(82,'editarEmpresa','/app/administrador/empresa/editar.xhtml','fa fa-pencil',8),(83,'nuevaEmpresa','/app/administrador/empresa/registrar.xhtml','fa fa-user-plus',8),(91,'listarRutina','/app/administrador/rutinas/rutinas.xhtml','fa fa-th-large',9),(92,'editarRutina','/app/administrador/rutinas/editar.xhtml','fa fa-cog',9),(93,'nuevaRutina','/app/administrador/rutinas/nuevo.xhtml','fa fa-th-large',9),(101,'nuevaSesion','/app/administrador/sesiones/registrar.xhtml','fa fa-user-plus',10),(102,'listarSesiones','/app/administrador/sesiones/sesiones.xhtml','fa fa-th-large',10),(103,'editarSesiones','/app/administrador/sesiones/editar.xhtml','fa fa-cog',10),(111,'salones','/app/administrador/salones/ver.xhtml','fa fa-cog',NULL),(112,'registrarSalones','/app/administrador/salones/registrar.xhtml','fa fa-user',111),(113,'listarSalones','/app/administrador/salones/salones.xhtml','fa fa-user',111),(114,'editarSalones','/app/administrador/salones/editar.xhtml','fa fa-user',111),(222,'programas','/app/administrador/programas/ver.xhtml','fa fa-user',NULL),(223,'listarProgramas','/app/administrador/programas/programas.xhtml','fa fa-th-large',222),(224,'registrarProgramas','/app/administrador/programas/registrar.xhtml','fa fa-cog',222),(225,'editarProgramas','/app/administrador/programas/editar.xhtml','fa fa-user',222),(333,'personalMedico','/app/administrador/personal/ver.xhtml','fa fa-user',NULL),(334,'listarPersonal','/app/administrador/personal/medico.xhtml','fa fa-th-large',333),(335,'nuevoPersonal','/app/administrador/personal/registrar.xhtml','fa fa-user-plus',333),(444,'rutinaServicio','/app/administrador/rutinaservicios/editar.xhtml','fa fa-user',NULL),(445,'listarRutinaServicio','/app/administrador/rutinaservicios/rutinas-servicios.xhtml','fa fa-th-large',444),(446,'nuevoRutinaServicio','/app/administrador/rutinaservicios/nuevo.xhtml','fa fa-user',444),(555,'servicio','/app/administrador/servicios/ver.xhtml','fa fa-user',NULL),(556,'listarServicio','/app/administrador/servicios/servicios.xhtml','fa fa-th-large',555),(557,'registrarServicio','/app/administrador/servicios/registrar.xhtml','fa fa-th-large',555),(558,'editarServicio','/app/administrador/servicios/editar.xhtml','fa fa-th-large',555);
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
INSERT INTO `permisosroles` VALUES (1,1),(2,1),(3,1),(5,1),(7,1),(8,1),(10,1),(11,1),(12,1),(21,1),(22,1),(31,1),(32,1),(51,1),(52,1),(71,1),(72,1),(73,1),(81,1),(82,1),(83,1),(101,1),(102,1),(333,1),(334,1),(335,1),(1,2),(6,2),(11,2),(12,2),(13,2),(41,2),(61,2),(9,3),(91,3),(92,3),(93,3),(111,3),(112,3),(113,3),(114,3),(222,3),(223,3),(224,3),(225,3),(444,3),(445,3),(446,3),(555,3),(556,3),(557,3),(558,3);
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
INSERT INTO `personalmedico` VALUES (54534,'Perfil profesional','Fisioterapeuta'),(81928,'Profesional en salud mental y espiritual','Profesor de Ioga');
/*!40000 ALTER TABLE `personalmedico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programas`
--

DROP TABLE IF EXISTS `programas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programas` (
  `idPrograma` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `idRutinas` int(11) NOT NULL,
  `idSalones` int(11) NOT NULL,
  PRIMARY KEY (`idPrograma`),
  KEY `fk_programas_rutinas1_idx` (`idRutinas`),
  KEY `fk_programas_salones1_idx` (`idSalones`),
  CONSTRAINT `fk_programas_rutinas1` FOREIGN KEY (`idRutinas`) REFERENCES `rutinas` (`idRutinas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_programas_salones1` FOREIGN KEY (`idSalones`) REFERENCES `salones` (`id_salones`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programas`
--

LOCK TABLES `programas` WRITE;
/*!40000 ALTER TABLE `programas` DISABLE KEYS */;
INSERT INTO `programas` VALUES (1,'Programa posnatal','2017-07-04 00:00:00',1,1),(2,'Programa prenatal','2017-01-01 00:00:00',1,1),(81,'Programa de Let Fu\'a','2017-07-21 08:15:05',1,23);
/*!40000 ALTER TABLE `programas` ENABLE KEYS */;
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
INSERT INTO `roles` VALUES (1,'Administrador','Encargado del sistema'),(2,'Cliente','Usuarios habitual del sistem'),(3,'Personal medico','Encargado del bienestar de los clientes del g');
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
INSERT INTO `rolesusuarios` VALUES (1,1111),(2,112312),(3,81928);
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
INSERT INTO `rutinas` VALUES (1,'Rutina de acondicionamiento fisico','Ejercicio Acondicionador de fisicio');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rutinaservicios`
--

LOCK TABLES `rutinaservicios` WRITE;
/*!40000 ALTER TABLE `rutinaservicios` DISABLE KEYS */;
INSERT INTO `rutinaservicios` VALUES (1,1,1),(2,1,2),(3,1,3);
/*!40000 ALTER TABLE `rutinaservicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salones`
--

DROP TABLE IF EXISTS `salones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salones` (
  `id_salones` int(11) NOT NULL,
  `actividad` int(11) DEFAULT NULL,
  `salon` varchar(45) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_salones`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salones`
--

LOCK TABLES `salones` WRITE;
/*!40000 ALTER TABLE `salones` DISABLE KEYS */;
INSERT INTO `salones` VALUES (1,23,'1A','Salón especializado en el programa prenatal'),(23,99,'4B Posnatal','Gimnasio Posnatal dotado para ejecutar ejercicios del programa posnatal');
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
  `idCalendario` int(11) NOT NULL,
  PRIMARY KEY (`idServicio`),
  KEY `fk_servicios_tipo_servicio1_idx` (`idCalendario`),
  CONSTRAINT `fk_servicios_tipo_servicio1` FOREIGN KEY (`idCalendario`) REFERENCES `calendario` (`idCalendario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,'Pilates','Ejercicio de acondicionamiento',1),(2,'Esferodinamia','Ejercicio de acondicionamiento',1),(3,'Yoga','Ejercicio de Relajación',1);
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesiones`
--

DROP TABLE IF EXISTS `sesiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sesiones` (
  `idSesiones` int(11) NOT NULL,
  `numero_sesiones` int(11) NOT NULL,
  PRIMARY KEY (`idSesiones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesiones`
--

LOCK TABLES `sesiones` WRITE;
/*!40000 ALTER TABLE `sesiones` DISABLE KEYS */;
INSERT INTO `sesiones` VALUES (1,5),(2,10),(3,15),(4,20),(5,25);
/*!40000 ALTER TABLE `sesiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud_citas`
--

DROP TABLE IF EXISTS `solicitud_citas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitud_citas` (
  `idCitas` int(11) NOT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `idClientes` bigint(20) NOT NULL,
  `idServicio` int(11) NOT NULL,
  `idFecha` int(11) NOT NULL,
  PRIMARY KEY (`idCitas`),
  KEY `fk_solicitud_citas_clientes1_idx` (`idClientes`),
  KEY `fk_solicitud_citas_servicios1_idx` (`idServicio`),
  KEY `fk_solicitud_citas_fechas_disponibles1_idx` (`idFecha`),
  CONSTRAINT `fk_solicitud_citas_clientes1` FOREIGN KEY (`idClientes`) REFERENCES `clientes` (`idClientes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_solicitud_citas_fechas_disponibles1` FOREIGN KEY (`idFecha`) REFERENCES `fechas_disponibles` (`idFechas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_solicitud_citas_servicios1` FOREIGN KEY (`idServicio`) REFERENCES `servicios` (`idServicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud_citas`
--

LOCK TABLES `solicitud_citas` WRITE;
/*!40000 ALTER TABLE `solicitud_citas` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitud_citas` ENABLE KEYS */;
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
  `hora` time DEFAULT NULL,
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
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `cedula` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Este campo almacena la cedula de todos los usuarios',
  `nombres` varchar(20) NOT NULL COMMENT 'Este campo almacena el nombre de cada usuario',
  `apellidos` varchar(20) NOT NULL,
  `fechaNaci` date DEFAULT NULL COMMENT 'Este campo almacena la fecha de nacimineto de cada usuario',
  `clave` varchar(200) NOT NULL,
  `imagen_perfil` blob,
  `id_estados` int(11) DEFAULT '3',
  `fecha_registro` date DEFAULT NULL,
  `correoElectronico` varchar(45) DEFAULT NULL,
  `telefonoFijo` varchar(7) DEFAULT '0000000',
  `telefonoCelular` varchar(10) DEFAULT '310000000',
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
INSERT INTO `usuarios` VALUES (1111,'Paula','Mendez','0199-01-01','fceeb9b9d469401fe558062c4bd25954',NULL,1,'2017-07-04','pm@gmailcom','4312321','3104391876'),(54534,'Kiler','Doom','1999-01-01','b3d80ff388ec7b0bee1b251856ec56e8',NULL,1,'2017-07-23','neutro@gmail.com','4334213','3182818199'),(81928,'Beltrout','Brench','1999-11-11','fceeb9b9d469401fe558062c4bd25954',NULL,1,'2017-07-17','Bb@gmail.com','7621371','3111111111'),(112312,'Maria','Melendez','1999-12-22','934b535800b1cba8f96a5d72f72f1611',NULL,1,'2017-07-04','MM@gmaill.com',NULL,NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mapris`.`tr_usuario_before_insert`
BEFORE INSERT ON `mapris`.`usuarios`
FOR EACH ROW
SET NEW.clave =  fc_encriptar(new.clave),
new.fecha_registro = CURRENT_DATE */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mapris`.`tr_before_update_password`
BEFORE UPDATE ON `mapris`.`usuarios`
FOR EACH ROW
SET new.clave = fc_encriptar(new.clave) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_validar_usuario`(IN `pr_cedula` BIGINT(20), IN `pr_clave` VARCHAR(20))
    NO SQL
SELECT * FROM usuarios WHERE cedula = pr_cedula AND  clave = fc_encriptar(pr_clave) ;;
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

-- Dump completed on 2017-07-25  3:13:02
