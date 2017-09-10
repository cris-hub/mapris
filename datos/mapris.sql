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
INSERT INTO `aplazamientos` VALUES (3,'Vacaciones','2017-02-14 00:00:00','2017-02-25 00:00:00');
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
INSERT INTO `clientes` VALUES (3,'Activa',1),(4,'Activa',1),(6,'Activa',2),(7,'Activa',4),(8,'ActivaActiva',5),(9,'Activa',7),(10,'Activa',8),(12,'Activa',3),(13,'Activa',6),(14,'Activa',9);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_horario`
--

LOCK TABLES `detalle_horario` WRITE;
/*!40000 ALTER TABLE `detalle_horario` DISABLE KEYS */;
INSERT INTO `detalle_horario` VALUES (1,1,'08:00:00',10,1),(2,2,'02:00:00',4,2),(3,3,'10:00:00',11,3),(4,4,'09:00:00',11,4),(5,5,'03:00:00',4,5),(6,6,'08:00:00',10,6),(7,7,'02:00:00',4,3),(8,8,'10:00:00',11,2);
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
INSERT INTO `empresas` VALUES (1,'8192','Cafam','Cll 54 # 32 - 53','Cra 182 # 45 - 31',1231231,4123123123),(2,'9178293','Exito','Cll 54 # 32 - 53','Cra 182 # 45 - 31',5019230,3109230182),(3,'954858-9887','Blake','P.O. Box 481, 1975 Nibh. Rd.','8010 Fermentum Street',0,0),(4,'418612-6514','Pena','P.O. Box 688, 3360 Eu Rd.','P.O. Box 226, 5231 Arcu. Av.',0,0),(5,'584158-3734','Mcdowell','2313 Purus, Ave','Ap #964-549 Accumsan Rd.',0,0),(6,'893108-5313','Sanders','7022 Arcu. Av.','626-6647 Magna Road',0,0),(7,'639694-3679','Sharpe','Ap #958-2347 Adipiscing Street','P.O. Box 899, 4071 Lorem Street',0,0),(8,'656841-3972','Avery','Ap #606-9663 At Avenue','P.O. Box 695, 3626 Magnis Avenue',0,0),(9,'712075-3715','Frederick','452-6850 Aliquam Street','732-6153 Tincidunt Road',0,0),(10,'104558-6029','Ross','256-5728 Purus Rd.','Ap #679-6827 Faucibus Avenue',0,0),(11,'035841-9208','Swanson','Ap #168-6789 Arcu. Rd.','Ap #340-1161 Non Street',0,0),(12,'243287-6098','Barber','715-1332 Tellus Avenue','8038 Ut Av.',0,0),(13,'954858-9887','Blake','P.O. Box 481, 1975 Nibh. Rd.','8010 Fermentum Street',0,0),(14,'418612-6514','Pena','P.O. Box 688, 3360 Eu Rd.','P.O. Box 226, 5231 Arcu. Av.',0,0),(15,'584158-3734','Mcdowell','2313 Purus, Ave','Ap #964-549 Accumsan Rd.',0,0),(16,'893108-5313','Sanders','7022 Arcu. Av.','626-6647 Magna Road',0,0),(17,'639694-3679','Sharpe','Ap #958-2347 Adipiscing Street','P.O. Box 899, 4071 Lorem Street',0,0),(18,'656841-3972','Avery','Ap #606-9663 At Avenue','P.O. Box 695, 3626 Magnis Avenue',0,0),(19,'712075-3715','Frederick','452-6850 Aliquam Street','732-6153 Tincidunt Road',0,0),(20,'104558-6029','Ross','256-5728 Purus Rd.','Ap #679-6827 Faucibus Avenue',0,0),(21,'035841-9208','Swanson','Ap #168-6789 Arcu. Rd.','Ap #340-1161 Non Street',0,0),(22,'243287-6098','Barber','715-1332 Tellus Avenue','8038 Ut Av.',0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios`
--

LOCK TABLES `horarios` WRITE;
/*!40000 ALTER TABLE `horarios` DISABLE KEYS */;
INSERT INTO `horarios` VALUES (1,1,'2017-08-10','2017-08-12'),(2,2,'2017-08-12','2017-08-14'),(3,3,'2017-08-14','2017-08-16'),(4,4,'2017-08-16','2017-08-18'),(5,5,'2017-08-20','2017-08-24'),(6,6,'2017-08-25','2017-08-30'),(7,7,'2017-09-01','2017-09-05'),(8,8,'2017-09-05','2017-09-10');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripciones`
--

LOCK TABLES `inscripciones` WRITE;
/*!40000 ALTER TABLE `inscripciones` DISABLE KEYS */;
INSERT INTO `inscripciones` VALUES (1,1,4,'Activa');
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
INSERT INTO `permisos` VALUES (0,'inicio','/app/index.xhtml\n','fa fa-home',NULL),(1,'perfil','','portrait',NULL),(2,'usuarios','/app/administrador/usuarios/ver.xhtml','group',NULL),(3,'aplazamientos','','insert invitation',NULL),(5,'calendario','','date range',NULL),(6,'agendar','','content paste',NULL),(7,'inscripciones','/app/administrador/inscripciones/ver.xhtml','content paste',NULL),(8,'empresa','/app/administrador/empresa/ver.xhtml','business center',NULL),(10,'sesiones','/app/administrador/sesiones/ver.xhtml','fa fa-cog',NULL),(11,'miPerfil','/app/perfil/miperfil.xhtml','fa fa-user',1),(12,'cambiarDatos','/app/perfil/cambiardatos.xhtml','fa fa-pencil',1),(13,'programas',NULL,NULL,NULL),(21,'listarUsuarios','/app/usuarios/listar.xhtml','fa fa-list',2),(22,'nuevoUsuario','/app/usuarios/nuevo.xhtml','fa fa-user-plus',2),(30,'editarAplazamiento','/app//usuarios/editar.xhtml','fa fa-pencil-square-o',2),(31,'listaAplazamientos','/app/aplazamientos/lista.xhtml','fa fa-list',3),(32,'registrarAplazamiento','/app/aplazamientos/registrarAplazamiento.xhtml','fa fa-plus',3),(33,'verAplazamiento','/app/aplazamientos/ver.xhtml','fa fa-user',3),(34,'verAplazamiento','/app/aplazamientos/verCliente.xhtml','fa fa-user',3),(41,'misProgramas','/app/cliente/programas/programas.xhtml',NULL,13),(51,'nuevoCalendario','/app/administrador/calendario/nuevo.xhtml','fa fa-user-plus',5),(52,'listarCalendario','/app/administrador/calendario/calendario.xhtml','fa fa-calendar',5),(61,'reservar','/app/cliente/servicios/servicios.xhtml','fa fa-pencil-square-o',6),(62,'Mi calendario','/app/cliente/calendario/calendario.xhtml',NULL,5),(71,'listaInscripciones','/app/administrador/inscripciones/inscripciones.xhtml','fa fa-list-ol',7),(72,'editarIncripcion','/app/administrador/inscripciones/editar.xhtml','fa fa-pencil',7),(73,'nuevaInscripcion','/app/administrador/inscripciones/registrar.xhtml','fa fa-user-plus',7),(81,'listarEmpresas','/app/administrador/empresa/empresas.xhtml','fa fa-th-large',8),(82,'editarEmpresa','/app/administrador/empresa/editar.xhtml','fa fa-pencil',8),(83,'nuevaEmpresa','/app/administrador/empresa/registrar.xhtml','fa fa-user-plus',8),(101,'nuevaSesion','/app/administrador/sesiones/registrar.xhtml','fa fa-user-plus',10),(102,'listarSesiones','/app/administrador/sesiones/sesiones.xhtml','fa fa-th-large',10),(103,'editarSesiones','/app/administrador/sesiones/editar.xhtml','fa fa-cog',10),(111,'salones','/app/administrador/salones/ver.xhtml','fa fa-cog',NULL),(112,'registrarSalones','/app/administrador/salones/registrar.xhtml','fa fa-user',111),(113,'listarSalones','/app/administrador/salones/salones.xhtml','fa fa-user',111),(114,'editarSalones','/app/administrador/salones/editar.xhtml','fa fa-user',111),(222,'programas','/app/administrador/programas/ver.xhtml','fa fa-user',NULL),(223,'listarProgramas','/app/administrador/programas/programas.xhtml','fa fa-th-large',222),(224,'registrarProgramas','/app/administrador/programas/registrar.xhtml','fa fa-cog',222),(225,'editarProgramas','/app/administrador/programas/editar.xhtml','fa fa-user',222),(333,'personalMedico','/app/administrador/personal/ver.xhtml','fa fa-user',NULL),(334,'listarPersonal','/app/administrador/personal/medico.xhtml','fa fa-th-large',333),(335,'nuevoPersonal','/app/administrador/personal/registrar.xhtml','fa fa-user-plus',333),(444,'salonesServicios','/app/administrador/salones-servicios/editar.xhtml','fa fa-user',NULL),(445,'listarSalonesServicios','/app/administrador/salones-servicios/salones-servicios.xhtml','fa fa-th-large',444),(446,'nuevoSalonesServicios','/app/administrador/salones-servicios/nuevo.xhtml','fa fa-user',444),(555,'servicio','/app/administrador/servicios/ver.xhtml','fa fa-user',NULL),(556,'listarServicio','/app/administrador/servicios/servicios.xhtml','fa fa-th-large',555),(557,'registrarServicio','/app/administrador/servicios/registrar.xhtml','fa fa-th-large',555),(558,'editarServicio','/app/administrador/servicios/editar.xhtml','fa fa-th-large',555),(666,'cliente','/app/administrador/clientes/ver.xhtml','fa fa-th-large',NULL),(667,'listarCliente','/app/administrador/clientes/cliente.xhtml','fa fa-user',666),(668,'editarCliente','/app/administrador/clientes/editar.xhtml','fa fa-user',666),(669,'registrarCliente','/app/administrador/clientes/registrar.xhtml','fa fa-user',666),(777,'datosClinicos','','fa fa-user',NULL),(778,'registrarDatos','/app/cliente/datos/registrar.xhtml','fa fa-user',777),(779,'verDatos','/app/cliente/datos/ver.xhtml','fa fa-user',777),(780,'datosClinicos',NULL,'fa fa-user',NULL),(781,'listarDatos','/app/personal/datos/clinicos.xhtml','fa fa-user',780),(782,'verDatos','/app/personal/datos/ver.xhtml','fa fa-user',780);
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
  KEY `fk_permisos_has_roles_permisos1_idx` (`fk_id_permiso`),
  CONSTRAINT `fk_permisos_has_roles_permisos1` FOREIGN KEY (`fk_id_permiso`) REFERENCES `permisos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_permisos_has_roles_roles1` FOREIGN KEY (`fk_id_rol`) REFERENCES `roles` (`idRoles`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisosroles`
--

LOCK TABLES `permisosroles` WRITE;
/*!40000 ALTER TABLE `permisosroles` DISABLE KEYS */;
INSERT INTO `permisosroles` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,1),(3,1),(3,2),(3,3),(3,4),(5,1),(5,2),(5,3),(5,4),(5,5),(6,2),(6,3),(6,4),(7,1),(8,1),(10,1),(11,1),(11,2),(11,3),(11,4),(11,5),(12,1),(12,2),(12,3),(12,4),(12,5),(13,2),(21,1),(22,1),(31,1),(32,2),(33,1),(34,2),(41,2),(51,1),(52,1),(61,2),(62,2),(62,3),(62,4),(71,1),(72,1),(73,1),(81,1),(82,1),(83,1),(101,1),(102,1),(111,5),(112,5),(113,5),(114,5),(222,5),(223,5),(224,5),(225,5),(333,1),(334,1),(335,1),(444,5),(445,5),(446,5),(555,5),(556,5),(557,5),(558,5),(666,1),(666,5),(667,1),(667,5),(668,1),(668,5),(669,1),(669,5),(777,2),(777,3),(777,4),(778,2),(778,3),(778,4),(779,2),(779,3),(779,4),(780,5),(781,5),(782,5);
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
  PRIMARY KEY (`fk_id_usuario`),
  CONSTRAINT `fk_personalmedico_usuarios1` FOREIGN KEY (`fk_id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
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
INSERT INTO `roles` VALUES (1,'Administrador','Encargado primordial del sistema'),(2,'Clientes Prenatal','Usuario recurrente en el area Prenatal'),(3,'Clientes Posnatal','Usuario recurrente en el area Posnatal'),(4,'Clientes Club Bebe','Usuario recurrente en el area Club bebe'),(5,'Personal Medico','Personal involucrado del gimnasio');
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
  KEY `fkRoles_RolesUsuarios_idx` (`fk_id_roles`),
  CONSTRAINT `fK_RolesUsuarios` FOREIGN KEY (`fk_id_roles`) REFERENCES `roles` (`idRoles`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rolesusuarios_usuarios1` FOREIGN KEY (`fk_id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolesusuarios`
--

LOCK TABLES `rolesusuarios` WRITE;
/*!40000 ALTER TABLE `rolesusuarios` DISABLE KEYS */;
INSERT INTO `rolesusuarios` VALUES (1,2),(2,3),(5,4),(1,5),(2,6),(3,7),(3,8),(4,9),(4,10),(5,11),(2,12),(3,13),(4,14);
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
  KEY `fk_salones_has_servicios_salones1_idx` (`salones_id_salones`),
  CONSTRAINT `fk_salones_has_servicios_salones1` FOREIGN KEY (`salones_id_salones`) REFERENCES `salones` (`id_salones`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_salones_has_servicios_servicios1` FOREIGN KEY (`servicios_id_servicio`) REFERENCES `servicios` (`id_servicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `nombre` varchar(30) DEFAULT NULL COMMENT 'Este campo almacena el nombre de programa ',
  `descripcion` text COMMENT 'Este campo almacena una pequeña descripcion de cada programa',
  `valor` double DEFAULT NULL,
  `objetivo` text,
  `sesiones` int(11) NOT NULL,
  `fk_sub_servicios` int(11) DEFAULT NULL,
  `fk_tipo_servicio` int(11) NOT NULL,
  PRIMARY KEY (`id_servicio`),
  KEY `fk_servicios_subservicios_idx` (`fk_sub_servicios`),
  KEY `fk_servicios_tipos_servicios1_idx` (`fk_tipo_servicio`),
  CONSTRAINT `fk_servicios_subservicios` FOREIGN KEY (`fk_sub_servicios`) REFERENCES `servicios` (`id_servicio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicios_tipos_servicios1` FOREIGN KEY (`fk_tipo_servicio`) REFERENCES `tipos_servicios` (`id_tipo_servicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,'Yoga','Clase de relajación orientada a las artes orientales del Yoga',100000,'Relajación',4,NULL,3),(2,'Pilates','Clase de acondicionamiento fisico',90000,'Acondicionamiento fisico',3,NULL,3),(3,'Prenatal','Programa completo prenata',800000,'Mentalidad sana para recibir el nuevo bebe',10,NULL,1),(4,'Posnatal','Programa completo posnata',700000,'Recuperar la figura',10,NULL,1),(5,'Club bebe','Programa completo club bebe',500000,'Interactuar en familia',8,NULL,1),(6,'Programas de promoción y preve','Valoracion fisica',NULL,NULL,0,3,2),(7,'Acondicionamiento Físico','Clases que mejoran el estado fisico',NULL,NULL,0,3,2),(8,'Curso Psicoprofiláctico','Preparación para el parto y la maternidad.',NULL,NULL,0,3,2),(9,'Spa y Relajación','Relajacion y descanso',NULL,NULL,0,3,2),(12,'Programa de promoción y preven','Valoracion fisica',NULL,NULL,0,4,2),(13,'Acondicionamiento Físico','Clases que mejoran el estado fisico',NULL,NULL,0,4,2),(14,'Área Especializada','Area medica',NULL,NULL,0,4,2),(15,'Reducción de peso y medidas','Ponte en forma',NULL,NULL,0,4,2),(16,'Taller de Shantala','técnica Hindu de estimulación a través del masaje',NULL,NULL,0,5,2),(17,'Baby Rumba','Ritmo y movimiento generan en el bebé la estimulación sensorial',NULL,NULL,0,5,2),(18,'Yoga Baby','Los movimientos suaves, armónicos ',NULL,NULL,0,5,2),(19,'Taller de Primeros Auxilios','Seguridad del bebé',NULL,NULL,0,5,2),(42,'Programas de promoción y preve',NULL,70000,NULL,0,NULL,3),(43,'Acondicionamiento Físico',NULL,80000,NULL,0,NULL,3),(44,'Curso Psicoprofiláctico',NULL,100000,NULL,0,NULL,3),(45,'Spa y Relajación',NULL,120000,NULL,0,NULL,3),(46,'Programa de promoción y preven',NULL,130000,NULL,0,NULL,3),(47,'Área Especializada',NULL,150000,NULL,0,NULL,3),(48,'Reducción de peso y medidas',NULL,160000,NULL,0,NULL,3),(49,'Taller de Shantala',NULL,100000,NULL,0,NULL,3),(50,'Yoga Baby',NULL,90000,NULL,0,NULL,3),(51,'Baby Rumba',NULL,120000,NULL,0,NULL,3),(52,'Taller de Primeros Auxilios',NULL,60000,NULL,0,NULL,3),(53,'Ginecologa',NULL,70000,NULL,0,NULL,4),(54,'Nutricionista',NULL,80000,NULL,0,NULL,4),(55,'Terapeuta',NULL,90000,NULL,0,NULL,4);
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
  `imagen_perfil` varchar(150) NOT NULL DEFAULT '/resources/img/profile_image_icon.png',
  `correoElectronico` varchar(45) DEFAULT NULL,
  `telefonoFijo` varchar(7) DEFAULT '0000000',
  `telefonoCelular` varchar(10) DEFAULT '310000000',
  `fecha_registro` date DEFAULT NULL,
  `fk_id_estados` int(11) NOT NULL DEFAULT '3',
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `cedula_UNIQUE` (`cedula`),
  KEY `fk_usuarios_estados_idx` (`fk_id_estados`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`fk_id_estados`) REFERENCES `estados` (`id_estados`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (2,'1111111111','Lola','Martinez','lola','1999-01-01','/resources/img/profile_image_icon.png','','0000000','310000000','2017-08-02',1),(3,'7777','Maria','Loaiza','lola','1999-08-10','/resources/img/profile_image_icon.png','mari@gmail.com','5019230','3109230182','2017-08-03',1),(4,'9999','Sandra','Paez','lola','1999-01-01','/resources/img/profile_image_icon.png','mari@gmail.com','3123123','3123123123','2017-08-09',1),(5,'2222','Kitra','Dane','lola','1999-01-01','/resources/img/profile_image_icon.png','porttitor.tellus@eumetus.edu','03 99 5','(545) 754-','2017-09-04',1),(6,'33814330','Lael','Macon','lola','1999-01-01','/resources/img/profile_image_icon.png','dui.Cum.sociis@nonluctussit.ca','09 23 1','(348) 968-','2017-09-04',1),(7,'36725575','Eleanor','Shad','lola','1999-01-01','/resources/img/profile_image_icon.png','hendrerit@aliquet.edu','08 42 4','(136) 529-','2017-09-04',1),(8,'8054203','Morgan','Byron','lola','1999-01-01','/resources/img/profile_image_icon.png','Aliquam.gravida.mauris@natoquepenatibuset.org','09 59 5','(305) 625-','2017-09-04',1),(9,'17590748','Galena','Zahir','lola','1999-01-01','/resources/img/profile_image_icon.png','Curabitur.ut.odio@risusNullaeget.edu','07 47 6','(156) 904-','2017-09-04',1),(10,'27958069','Halla','Dante','lola','1999-01-01','/resources/img/profile_image_icon.png','sapien.Cras.dolor@utcursus.net','04 53 0','(314) 259-','2017-09-04',1),(11,'7428683','Faith','Plato','lola','1999-01-01','/resources/img/profile_image_icon.png','eu.odio@penatibuset.org','03 19 7','(116) 537-','2017-09-04',1),(12,'20518418','Roanna','Jeremy','lola','1999-01-01','/resources/img/profile_image_icon.png','mi@maurisrhoncusid.ca','04 42 4','(597) 892-','2017-09-04',1),(13,'41479865','Eliana','Neville','lola','1999-01-01','/resources/img/profile_image_icon.png','mollis@egetnisi.org','03 01 3','(700) 853-','2017-09-04',1),(14,'42861327','Gillian','Allen','lola','1999-01-01','/resources/img/profile_image_icon.png','adipiscing.lobortis.risus@aliquam.net','03 89 5','(779) 351-','2017-09-04',1);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mapris`.`tr_usuario_before_insert`
BEFORE INSERT ON `mapris`.`usuarios`
FOR EACH ROW
SET new.fecha_registro = CURRENT_DATE */;;
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

-- Dump completed on 2017-09-07 23:02:14
