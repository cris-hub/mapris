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
-- Table structure for table `aplazamientos`
--

DROP TABLE IF EXISTS `aplazamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aplazamientos` (
  `idaplazamiento` int(11) NOT NULL,
  `motivo` text COMMENT 'Este campo almacena la razon por la cual se hace el aplazamiento',
  `fechaRetorno` datetime DEFAULT NULL,
  `idcliente` bigint(20) DEFAULT NULL,
  `id_tipo_aplazamiento` int(11) NOT NULL,
  PRIMARY KEY (`idaplazamiento`),
  KEY `FKClientesAplazamientos_idx` (`idcliente`),
  KEY `fk_aplazamiento_tipo_aplazamiento` (`id_tipo_aplazamiento`),
  CONSTRAINT `FKClientesAplazamientos` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idClientes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_aplazamiento_tipo_aplazamiento` FOREIGN KEY (`id_tipo_aplazamiento`) REFERENCES `tipo_aplazamiento` (`id_tipo`)
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
INSERT INTO `clientes` VALUES (1234242341,1,'prenatal');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `correos`
--

LOCK TABLES `correos` WRITE;
/*!40000 ALTER TABLE `correos` DISABLE KEYS */;
INSERT INTO `correos` VALUES (1,'rdconsuegra@misena.edu.co',1031174466);
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
/*!40000 ALTER TABLE `direcciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direcciones_has_empresa`
--

DROP TABLE IF EXISTS `direcciones_has_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direcciones_has_empresa` (
  `direcciones_iddirecciones` int(11) NOT NULL,
  `empresa_idEmpresa` bigint(20) NOT NULL,
  PRIMARY KEY (`direcciones_iddirecciones`,`empresa_idEmpresa`),
  KEY `fk_direcciones_has_empresa_empresa1_idx` (`empresa_idEmpresa`),
  KEY `fk_direcciones_has_empresa_direcciones1_idx` (`direcciones_iddirecciones`),
  CONSTRAINT `fk_direcciones_has_empresa_direcciones1` FOREIGN KEY (`direcciones_iddirecciones`) REFERENCES `direcciones` (`iddirecciones`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_direcciones_has_empresa_empresa1` FOREIGN KEY (`empresa_idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciones_has_empresa`
--

LOCK TABLES `direcciones_has_empresa` WRITE;
/*!40000 ALTER TABLE `direcciones_has_empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `direcciones_has_empresa` ENABLE KEYS */;
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
  PRIMARY KEY (`idEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,'Colpatria'),(2,'Porvenir'),(3,'Bancolombia');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa_has_telefonos`
--

DROP TABLE IF EXISTS `empresa_has_telefonos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa_has_telefonos` (
  `empresa_idEmpresa` bigint(20) NOT NULL,
  `telefonos_id_telefono` int(11) NOT NULL,
  PRIMARY KEY (`empresa_idEmpresa`,`telefonos_id_telefono`),
  KEY `fk_empresa_has_telefonos_telefonos1_idx` (`telefonos_id_telefono`),
  KEY `fk_empresa_has_telefonos_empresa1_idx` (`empresa_idEmpresa`),
  CONSTRAINT `fk_empresa_has_telefonos_empresa1` FOREIGN KEY (`empresa_idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_empresa_has_telefonos_telefonos1` FOREIGN KEY (`telefonos_id_telefono`) REFERENCES `telefonos` (`id_telefono`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa_has_telefonos`
--

LOCK TABLES `empresa_has_telefonos` WRITE;
/*!40000 ALTER TABLE `empresa_has_telefonos` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa_has_telefonos` ENABLE KEYS */;
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
  `idPrograma` int(11) NOT NULL COMMENT 'Este campo almacena el (id) de la tabla "Programas"',
  `idCliente` bigint(20) NOT NULL COMMENT 'Este campo almacena el (id) de la tabla "Clientes"',
  `fechaInicio` date DEFAULT NULL COMMENT 'Este campo almacena la fecha en que fue realizada la incripcion al programa',
  `fechaFin` date DEFAULT NULL,
  `valor` int(11) DEFAULT NULL COMMENT 'Este campo almacena el coste de la inscripcion',
  PRIMARY KEY (`idInscripciones`),
  KEY `fk_InscripcionesCliente_idx` (`idCliente`),
  KEY `FKProgramasInscripciones` (`idPrograma`),
  CONSTRAINT `FKProgramasInscripciones` FOREIGN KEY (`idPrograma`) REFERENCES `programas` (`idProgramas`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_InscripcionesCliente` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idClientes`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripciones`
--

LOCK TABLES `inscripciones` WRITE;
/*!40000 ALTER TABLE `inscripciones` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidades`
--

LOCK TABLES `localidades` WRITE;
/*!40000 ALTER TABLE `localidades` DISABLE KEYS */;
INSERT INTO `localidades` VALUES (1,'USAQUÉN'),(2,'CHAPINERO'),(3,'SANTA FE'),(4,'SAN CRISTÖBAL'),(5,'USME'),(6,'TUNJUELIO'),(7,'BOSA'),(8,'KENNEDY'),(9,'FONTIBÖN'),(10,'ENGATIVÄ'),(11,'SUBA'),(12,'BARRIOS UNIDOS'),(13,'LOS MÄRTIRES'),(14,'ANTONIO NARIÑO'),(15,'PUENTE ARANDA'),(16,'LA CANDELARIA'),(17,'RAFAEL URIBE URIBE'),(18,'CIUDAD BOLÏVAR'),(19,'SUMAPAZ');
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
INSERT INTO `permisos` VALUES (1,'Perfil','','fa fa-user',NULL),(2,'Programas','','fa fa-heart',NULL),(3,'Agenda','','fa fa-calendar',NULL),(4,'Usuarios','','fa fa-users',NULL),(5,'crud','','fa fa-list',NULL),(42,'usuarios','/app/usuarios/listar.xhtml','fa fa-list-ul',4),(44,'Registrar usuario','/app/usuarios/nuevo.xhtml','fa fa-plus',4);
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
INSERT INTO `permisosroles` VALUES (1,1),(1,3),(2,1),(2,3),(3,1),(4,1),(5,1),(5,3),(42,1),(44,1);
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
INSERT INTO `personalmedico` VALUES (1031174466,'Entrenadora Fisica','Rutinas Prenatales');
/*!40000 ALTER TABLE `personalmedico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programas`
--

DROP TABLE IF EXISTS `programas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programas` (
  `idProgramas` int(11) NOT NULL COMMENT 'Este campo es la clave primaria de la tabla y  almacena el (id) ',
  `fechaInicio` date DEFAULT NULL,
  `idRutinaServicios` int(11) NOT NULL,
  PRIMARY KEY (`idProgramas`),
  KEY `fk_programas_rutinaservicios1_idx` (`idRutinaServicios`),
  CONSTRAINT `FK_ProgramasRutinasServicios` FOREIGN KEY (`idRutinaServicios`) REFERENCES `rutinaservicios` (`idServicios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programas`
--

LOCK TABLES `programas` WRITE;
/*!40000 ALTER TABLE `programas` DISABLE KEYS */;
INSERT INTO `programas` VALUES (1111,'2017-04-09',1);
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
INSERT INTO `roles` VALUES (1,'Administrador','Encargado del sistema de información'),(2,'Cliente','El acceso a consultas de las rutinas y el agendamiento de citas por parte de los usuarios'),(3,'Personal Medico','Personal medico orientado al tratamiento de los programas del gimnasio');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolesusuarios`
--

DROP TABLE IF EXISTS `rolesusuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rolesusuarios` (
  `idRoles` int(11) NOT NULL COMMENT 'Este campo almacena el (id) de la tabla "Roles"',
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
INSERT INTO `rolesusuarios` VALUES (1,1031174466);
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
INSERT INTO `rutinas` VALUES (1,'Pilates',''),(2,'Esferodinamia',''),(3,'Rumba',''),(4,'Yoga',''),(5,'Body Jam','');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rutinaservicios`
--

LOCK TABLES `rutinaservicios` WRITE;
/*!40000 ALTER TABLE `rutinaservicios` DISABLE KEYS */;
INSERT INTO `rutinaservicios` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1);
/*!40000 ALTER TABLE `rutinaservicios` ENABLE KEYS */;
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
  PRIMARY KEY (`idServicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,'Pre-natal','Programa especializado al estado pre natal o periodo de gestación de la mujer');
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
  `fecha` date DEFAULT NULL COMMENT 'Este campo almacena la fecha de la realizacion de la clase del programa',
  `hora` time DEFAULT NULL COMMENT 'Este campo almacena la hora en que se realiza el programa',
  `idPrograma` int(11) DEFAULT NULL,
  `numeroSesiones` int(11) DEFAULT NULL,
  PRIMARY KEY (`idSesiones`),
  KEY `FKSesionesProgramas_idx` (`idPrograma`),
  KEY `FKPersonalSesiones` (`idPersonalMedico`),
  CONSTRAINT `FKPersonalSesiones` FOREIGN KEY (`idPersonalMedico`) REFERENCES `personalmedico` (`idPersonalMedico`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKSesionesProgramas` FOREIGN KEY (`idPrograma`) REFERENCES `programas` (`idProgramas`) ON DELETE CASCADE ON UPDATE CASCADE
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
INSERT INTO `tg_registro_usuarios` VALUES ('2017-06-02','13:33:07',1234242341),('2017-06-07','18:11:56',441242134);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tg_roles_usuarios_after_update`
--

LOCK TABLES `tg_roles_usuarios_after_update` WRITE;
/*!40000 ALTER TABLE `tg_roles_usuarios_after_update` DISABLE KEYS */;
INSERT INTO `tg_roles_usuarios_after_update` VALUES (1,'2017-06-01','22:50:28',0,1031174466,1,NULL,NULL),(2,'2017-06-02','08:41:10',0,1031174466,2,1031174466,1),(3,'2017-06-02','08:41:32',0,1031174466,2,1031174466,2),(4,'2017-06-02','08:41:49',0,1031174466,2,1031174466,2),(5,'2017-06-02','08:41:51',0,1031174466,2,1031174466,2),(6,'2017-06-02','09:49:31',0,1031174466,1,1031174466,2);
/*!40000 ALTER TABLE `tg_roles_usuarios_after_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_aplazamiento`
--

DROP TABLE IF EXISTS `tipo_aplazamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_aplazamiento` (
  `id_tipo` int(11) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_aplazamiento`
--

LOCK TABLES `tipo_aplazamiento` WRITE;
/*!40000 ALTER TABLE `tipo_aplazamiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_aplazamiento` ENABLE KEYS */;
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
INSERT INTO `usuarios` VALUES (0,'fdsfsa','sfsafd','sdfdsafs','safsdf','2016-04-11','rrtgzfgdarw',NULL,3),(1031174466,'Maria','Lina','Gomez','Carvajal','1997-07-01','1031174466',NULL,1),(1234242341,'Lina','Maria','Riqulmen','Parodia','1993-06-19','1234242341',NULL,2);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_has_direcciones`
--

LOCK TABLES `usuarios_has_direcciones` WRITE;
/*!40000 ALTER TABLE `usuarios_has_direcciones` DISABLE KEYS */;
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

-- Dump completed on 2017-06-07 23:32:48
