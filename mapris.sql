-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-06-2017 a las 07:19:50
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mapris`
--
CREATE DATABASE IF NOT EXISTS `mapris` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mapris`;

DELIMITER $$
--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `fc_descencriptar` (`clave_codificada` VARCHAR(10)) RETURNS VARCHAR(10) CHARSET latin1 BEGIN
DECLARE var VARCHAR(10);
SET var = (SELECT decode(clave_codificada,255));
RETURN var;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `fc_encriptar` (`clave` VARCHAR(10)) RETURNS VARCHAR(10) CHARSET latin1 BEGIN
DECLARE var VARCHAR(10);
SET var = (SELECT encode(clave,255));
return var;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplazamientos`
--

CREATE TABLE `aplazamientos` (
  `idaplazamiento` int(11) NOT NULL,
  `motivo` text COMMENT 'Este campo almacena la razon por la cual se hace el aplazamiento',
  `fechaRetorno` datetime DEFAULT NULL,
  `idcliente` bigint(20) DEFAULT NULL,
  `id_tipo_aplazamiento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idClientes` bigint(20) NOT NULL COMMENT 'Este campo almacena la cedula de los clientes (Solo los clientes)',
  `idEmpresa` bigint(20) NOT NULL COMMENT 'Este campo almacena el (id) de la tabla "Empresa"\n',
  `estado` varchar(20) NOT NULL COMMENT 'Este campo almacena el estado que se encuentra el cliente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `correos`
--

CREATE TABLE `correos` (
  `id_correo` int(11) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `id_usuario` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `correos`
--

INSERT INTO `correos` (`id_correo`, `correo`, `id_usuario`) VALUES
(1, 'rdconsuegra@misena.edu.co', 1031174466);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datosclinicos`
--

CREATE TABLE `datosclinicos` (
  `idCliente` bigint(20) NOT NULL COMMENT 'Este campo almacena la cedula del cliente de la tabla "Clientes"',
  `rh` char(2) DEFAULT NULL COMMENT 'Este campo almacena el tipo de sangre del cliente',
  `datosPosparto` int(11) DEFAULT NULL COMMENT 'Este campo almacena el archivo correspondiente al dato clinico del programa Posparto',
  `datosPrenatales` int(11) DEFAULT NULL COMMENT 'Este campo almacena el archivo correspondiente al dato clinico del programa Prenatal'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones`
--

CREATE TABLE `direcciones` (
  `iddirecciones` int(11) NOT NULL,
  `id_localidad` int(11) NOT NULL,
  `avenida` varchar(45) DEFAULT NULL,
  `calle` varchar(45) DEFAULT NULL,
  `carrera` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones_has_empresa`
--

CREATE TABLE `direcciones_has_empresa` (
  `direcciones_iddirecciones` int(11) NOT NULL,
  `empresa_idEmpresa` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `idEmpresa` bigint(20) NOT NULL COMMENT 'Este campo es la clave primaria de la tabla y  almacena el (id) ',
  `nombre` varchar(45) NOT NULL COMMENT 'Este campo almacena el nombre de la empresa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`idEmpresa`, `nombre`) VALUES
(1, 'Colpatria'),
(2, 'Porvenir'),
(3, 'Bancolombia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa_has_telefonos`
--

CREATE TABLE `empresa_has_telefonos` (
  `empresa_idEmpresa` bigint(20) NOT NULL,
  `telefonos_id_telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `id_estados` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripccion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id_estados`, `nombre`, `descripccion`) VALUES
(1, 'activo', ''),
(2, 'bloqueado', NULL),
(3, 'sin rol', NULL),
(4, 'sin permisos', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones`
--

CREATE TABLE `inscripciones` (
  `idInscripciones` int(11) NOT NULL COMMENT 'Este campo es la clave primaria de la tabla y  almacena el (id) \n',
  `idPrograma` int(11) NOT NULL COMMENT 'Este campo almacena el (id) de la tabla "Programas"',
  `idCliente` bigint(20) NOT NULL COMMENT 'Este campo almacena el (id) de la tabla "Clientes"',
  `fechaInicio` date DEFAULT NULL COMMENT 'Este campo almacena la fecha en que fue realizada la incripcion al programa',
  `fechaFin` date DEFAULT NULL,
  `valor` int(11) DEFAULT NULL COMMENT 'Este campo almacena el coste de la inscripcion'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidades`
--

CREATE TABLE `localidades` (
  `id_localidad` int(11) NOT NULL,
  `localidad` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `localidades`
--

INSERT INTO `localidades` (`id_localidad`, `localidad`) VALUES
(1, 'USAQUÉN'),
(2, 'CHAPINERO'),
(3, 'SANTA FE'),
(4, 'SAN CRISTÖBAL'),
(5, 'USME'),
(6, 'TUNJUELIO'),
(7, 'BOSA'),
(8, 'KENNEDY'),
(9, 'FONTIBÖN'),
(10, 'ENGATIVÄ'),
(11, 'SUBA'),
(12, 'BARRIOS UNIDOS'),
(13, 'LOS MÄRTIRES'),
(14, 'ANTONIO NARIÑO'),
(15, 'PUENTE ARANDA'),
(16, 'LA CANDELARIA'),
(17, 'RAFAEL URIBE URIBE'),
(18, 'CIUDAD BOLÏVAR'),
(19, 'SUMAPAZ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `url` text,
  `icon` varchar(45) DEFAULT NULL,
  `permisos_padre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id`, `nombre`, `url`, `icon`, `permisos_padre`) VALUES
(1, 'Perfil', '', 'fa fa-user', NULL),
(2, 'Programas', '', 'fa fa-heart', NULL),
(3, 'Agenda', '', 'fa fa-calendar', NULL),
(4, 'Usuarios', '', 'fa fa-users', NULL),
(5, 'Citas', '', 'fa fa-list', NULL),
(6, 'Aplazamientos', '', 'fa fa-list-ul', NULL),
(42, 'usuarios', '/app/usuarios/listar.xhtml', 'fa fa-list-ul', 4),
(44, 'Registrar usuario', '/app/usuarios/nuevo.xhtml', 'fa fa-plus', 4),
(51, 'Rutinas Citas', '/app/citas/listarrutinas.xhtml', 'fa fa-list', 5),
(61, 'Registro Aplazamientos', '/app/aplazamientos/lista.xhtml\r\n', 'fa fa-list-ul', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisosroles`
--

CREATE TABLE `permisosroles` (
  `permisos_id` int(11) NOT NULL,
  `roles_idRoles` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `permisosroles`
--

INSERT INTO `permisosroles` (`permisos_id`, `roles_idRoles`) VALUES
(1, 1),
(1, 3),
(2, 1),
(2, 3),
(3, 1),
(4, 1),
(5, 1),
(5, 3),
(6, 1),
(42, 1),
(44, 1),
(51, 1),
(61, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personalmedico`
--

CREATE TABLE `personalmedico` (
  `idPersonalMedico` bigint(20) NOT NULL COMMENT 'Este campo almacena la cedula de cada Personal Medico (Solo Personal Medico)',
  `perfilProfesional` varchar(45) NOT NULL COMMENT 'Este campo almacena la especialidad que tiene cada Personal Medico ',
  `cargo` varchar(20) NOT NULL COMMENT 'Este campo almacena el tipo de cargo que tiene el personal Medico (Prenatal o Posnatal)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `personalmedico`
--

INSERT INTO `personalmedico` (`idPersonalMedico`, `perfilProfesional`, `cargo`) VALUES
(1031174466, 'Entrenadora Fisica', 'Rutinas Prenatales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programas`
--

CREATE TABLE `programas` (
  `idProgramas` int(11) NOT NULL COMMENT 'Este campo es la clave primaria de la tabla y  almacena el (id) ',
  `fechaInicio` date DEFAULT NULL,
  `idRutinaServicios` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `programas`
--

INSERT INTO `programas` (`idProgramas`, `fechaInicio`, `idRutinaServicios`) VALUES
(1111, '2017-04-09', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idRoles` int(11) NOT NULL COMMENT 'Este campo es la clave primaria de la tabla y  almacena el (id)',
  `nombre` varchar(20) NOT NULL COMMENT 'Este campo almacena el nombre de cada rol',
  `descripcion` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`idRoles`, `nombre`, `descripcion`) VALUES
(1, 'Administrador', 'Encargado del sistema de información'),
(2, 'Cliente', 'El acceso a consultas de las rutinas y el agendamiento de citas por parte de los usuarios'),
(3, 'Personal Medico', 'Personal medico orientado al tratamiento de los programas del gimnasio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rolesusuarios`
--

CREATE TABLE `rolesusuarios` (
  `idRoles` int(11) NOT NULL DEFAULT '2' COMMENT 'Este campo almacena el (id) de la tabla "Roles"',
  `idUsuarios` bigint(20) NOT NULL COMMENT 'Este campo almacena el (id) de la tabla "Usuarios"'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rolesusuarios`
--

INSERT INTO `rolesusuarios` (`idRoles`, `idUsuarios`) VALUES
(1, 1031174466),
(2, 24367890),
(2, 43829148);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutinas`
--

CREATE TABLE `rutinas` (
  `idRutinas` int(11) NOT NULL COMMENT 'Este campo es la clave primaria de la tabla y  almacena el (id) ',
  `nombre` varchar(45) NOT NULL COMMENT 'Este campo almacena el nombre de la rutina',
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rutinas`
--

INSERT INTO `rutinas` (`idRutinas`, `nombre`, `descripcion`) VALUES
(1, 'Pilates', ''),
(2, 'Esferodinamia', ''),
(3, 'Rumba', ''),
(4, 'Yoga', ''),
(5, 'Body Jam', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutinaservicios`
--

CREATE TABLE `rutinaservicios` (
  `idRutinaServicios` int(11) NOT NULL,
  `idRutinas` int(11) NOT NULL,
  `idServicios` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rutinaservicios`
--

INSERT INTO `rutinaservicios` (`idRutinaServicios`, `idRutinas`, `idServicios`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `idServicio` int(11) NOT NULL COMMENT 'Este campo es la clave primaria de la tabla y  almacena el (id) de cada programa',
  `nombre` varchar(20) DEFAULT NULL COMMENT 'Este campo almacena el nombre de programa ',
  `descripcion` text COMMENT 'Este campo almacena una pequeña descripcion de cada programa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`idServicio`, `nombre`, `descripcion`) VALUES
(1, 'Pre-natal', 'Programa especializado al estado pre natal o periodo de gestación de la mujer');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesiones`
--

CREATE TABLE `sesiones` (
  `idSesiones` int(11) NOT NULL COMMENT 'Este campo es la clave primaria de la tabla y  almacena el (id) ',
  `idPersonalMedico` bigint(20) DEFAULT NULL COMMENT 'Este campo almacena el (id) de la tabla "Programa"',
  `fecha` date DEFAULT NULL COMMENT 'Este campo almacena la fecha de la realizacion de la clase del programa',
  `hora` time DEFAULT NULL COMMENT 'Este campo almacena la hora en que se realiza el programa',
  `idPrograma` int(11) DEFAULT NULL,
  `numeroSesiones` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos`
--

CREATE TABLE `telefonos` (
  `id_telefono` int(11) NOT NULL,
  `numero` varchar(15) DEFAULT NULL,
  `tipo_telefono_idtipo_telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tg_registro_usuarios`
--

CREATE TABLE `tg_registro_usuarios` (
  `fecha_registro` date DEFAULT NULL,
  `hora_registro` time DEFAULT NULL,
  `id_nuevo_usuario` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tg_registro_usuarios`
--

INSERT INTO `tg_registro_usuarios` (`fecha_registro`, `hora_registro`, `id_nuevo_usuario`) VALUES
('2017-06-02', '13:33:07', 1234242341),
('2017-06-07', '18:11:56', 441242134);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tg_roles_usuarios_after_update`
--

CREATE TABLE `tg_roles_usuarios_after_update` (
  `id_actualizacion_rol` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  `actualiza_id` bigint(20) DEFAULT NULL,
  `actualizo_id` bigint(20) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL,
  `anterior_usuario` bigint(20) DEFAULT NULL,
  `anterior_rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tg_roles_usuarios_after_update`
--

INSERT INTO `tg_roles_usuarios_after_update` (`id_actualizacion_rol`, `fecha`, `Hora`, `actualiza_id`, `actualizo_id`, `id_rol`, `anterior_usuario`, `anterior_rol`) VALUES
(1, '2017-06-01', '22:50:28', 0, 1031174466, 1, NULL, NULL),
(2, '2017-06-02', '08:41:10', 0, 1031174466, 2, 1031174466, 1),
(3, '2017-06-02', '08:41:32', 0, 1031174466, 2, 1031174466, 2),
(4, '2017-06-02', '08:41:49', 0, 1031174466, 2, 1031174466, 2),
(5, '2017-06-02', '08:41:51', 0, 1031174466, 2, 1031174466, 2),
(6, '2017-06-02', '09:49:31', 0, 1031174466, 1, 1031174466, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_aplazamiento`
--

CREATE TABLE `tipo_aplazamiento` (
  `id_tipo` int(11) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_telefono`
--

CREATE TABLE `tipo_telefono` (
  `idtipo_telefono` int(11) NOT NULL,
  `tipo` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `cedula` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Este campo almacena la cedula de todos los usuarios',
  `primer_nombre` varchar(20) NOT NULL COMMENT 'Este campo almacena el nombre de cada usuario',
  `segundo_nombre` varchar(20) DEFAULT NULL COMMENT 'Este campo almacena el apellido de cada usuario',
  `primer_apellido` varchar(20) NOT NULL,
  `segundo_apellido` varchar(20) DEFAULT NULL,
  `fechaNaci` date DEFAULT NULL COMMENT 'Este campo almacena la fecha de nacimineto de cada usuario',
  `clave` varchar(200) NOT NULL,
  `imegen_perfil` blob,
  `id_estados` int(11) DEFAULT '3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`cedula`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `fechaNaci`, `clave`, `imegen_perfil`, `id_estados`) VALUES
(24367890, 'Lorena', 'hgjvkg', 'Maria', 'gjgjkghg', '2017-06-04', 'Gustam', NULL, 3),
(43829148, 'sdhajfldhlj', 'djldskfakjfh', 'sldfhadlfjksh', 'sdklfhsakjlf', '2017-06-04', '4218421439', NULL, 3),
(1031174466, 'Nicol', 'Lina', 'Gomez', 'Carvajal', '1997-07-01', '1031174466', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_has_direcciones`
--

CREATE TABLE `usuarios_has_direcciones` (
  `id_direccion` smallint(6) NOT NULL,
  `usuarios_cedula` bigint(20) NOT NULL,
  `direcciones_iddirecciones` int(11) NOT NULL,
  `vive_aqui` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_has_telefonos`
--

CREATE TABLE `usuarios_has_telefonos` (
  `usuarios_cedula` bigint(20) NOT NULL,
  `telefonos_id_telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aplazamientos`
--
ALTER TABLE `aplazamientos`
  ADD PRIMARY KEY (`idaplazamiento`),
  ADD KEY `FKClientesAplazamientos_idx` (`idcliente`),
  ADD KEY `fk_aplazamiento_tipo_aplazamiento` (`id_tipo_aplazamiento`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idClientes`),
  ADD KEY `fk_ClientesEmpresa_idx` (`idEmpresa`);

--
-- Indices de la tabla `correos`
--
ALTER TABLE `correos`
  ADD PRIMARY KEY (`id_correo`),
  ADD KEY `fk_usuarios_correos` (`id_usuario`);

--
-- Indices de la tabla `datosclinicos`
--
ALTER TABLE `datosclinicos`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD PRIMARY KEY (`iddirecciones`),
  ADD KEY `fk_direcciones_localidad` (`id_localidad`);

--
-- Indices de la tabla `direcciones_has_empresa`
--
ALTER TABLE `direcciones_has_empresa`
  ADD PRIMARY KEY (`direcciones_iddirecciones`,`empresa_idEmpresa`),
  ADD KEY `fk_direcciones_has_empresa_empresa1_idx` (`empresa_idEmpresa`),
  ADD KEY `fk_direcciones_has_empresa_direcciones1_idx` (`direcciones_iddirecciones`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`idEmpresa`);

--
-- Indices de la tabla `empresa_has_telefonos`
--
ALTER TABLE `empresa_has_telefonos`
  ADD PRIMARY KEY (`empresa_idEmpresa`,`telefonos_id_telefono`),
  ADD KEY `fk_empresa_has_telefonos_telefonos1_idx` (`telefonos_id_telefono`),
  ADD KEY `fk_empresa_has_telefonos_empresa1_idx` (`empresa_idEmpresa`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id_estados`);

--
-- Indices de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD PRIMARY KEY (`idInscripciones`),
  ADD KEY `fk_InscripcionesCliente_idx` (`idCliente`),
  ADD KEY `FKProgramasInscripciones` (`idPrograma`);

--
-- Indices de la tabla `localidades`
--
ALTER TABLE `localidades`
  ADD PRIMARY KEY (`id_localidad`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_permisos_permisos1_idx` (`permisos_padre`);

--
-- Indices de la tabla `permisosroles`
--
ALTER TABLE `permisosroles`
  ADD PRIMARY KEY (`permisos_id`,`roles_idRoles`),
  ADD KEY `fk_permisos_has_roles_roles1_idx` (`roles_idRoles`),
  ADD KEY `fk_permisos_has_roles_permisos1_idx` (`permisos_id`);

--
-- Indices de la tabla `personalmedico`
--
ALTER TABLE `personalmedico`
  ADD PRIMARY KEY (`idPersonalMedico`);

--
-- Indices de la tabla `programas`
--
ALTER TABLE `programas`
  ADD PRIMARY KEY (`idProgramas`),
  ADD KEY `fk_programas_rutinaservicios1_idx` (`idRutinaServicios`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idRoles`);

--
-- Indices de la tabla `rolesusuarios`
--
ALTER TABLE `rolesusuarios`
  ADD KEY `fkRoles_RolesUsuarios_idx` (`idRoles`),
  ADD KEY `fk_UsuariosRoles_idx` (`idUsuarios`);

--
-- Indices de la tabla `rutinas`
--
ALTER TABLE `rutinas`
  ADD PRIMARY KEY (`idRutinas`);

--
-- Indices de la tabla `rutinaservicios`
--
ALTER TABLE `rutinaservicios`
  ADD PRIMARY KEY (`idRutinaServicios`),
  ADD KEY `FkRutnas_RutinasServicios_idx` (`idRutinas`),
  ADD KEY `FkServicios_RutinasServicios_idx` (`idServicios`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`idServicio`);

--
-- Indices de la tabla `sesiones`
--
ALTER TABLE `sesiones`
  ADD PRIMARY KEY (`idSesiones`),
  ADD KEY `FKSesionesProgramas_idx` (`idPrograma`),
  ADD KEY `FKPersonalSesiones` (`idPersonalMedico`);

--
-- Indices de la tabla `telefonos`
--
ALTER TABLE `telefonos`
  ADD PRIMARY KEY (`id_telefono`,`tipo_telefono_idtipo_telefono`),
  ADD KEY `fk_telefonos_tipo_telefono1_idx` (`tipo_telefono_idtipo_telefono`);

--
-- Indices de la tabla `tg_roles_usuarios_after_update`
--
ALTER TABLE `tg_roles_usuarios_after_update`
  ADD PRIMARY KEY (`id_actualizacion_rol`);

--
-- Indices de la tabla `tipo_aplazamiento`
--
ALTER TABLE `tipo_aplazamiento`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `tipo_telefono`
--
ALTER TABLE `tipo_telefono`
  ADD PRIMARY KEY (`idtipo_telefono`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`cedula`),
  ADD KEY `fk_usuarios_estados_idx` (`id_estados`);

--
-- Indices de la tabla `usuarios_has_direcciones`
--
ALTER TABLE `usuarios_has_direcciones`
  ADD PRIMARY KEY (`id_direccion`),
  ADD KEY `fk_usuarios_has_direcciones_direcciones1_idx` (`direcciones_iddirecciones`),
  ADD KEY `fk_usuarios_has_direcciones_usuarios1_idx` (`usuarios_cedula`);

--
-- Indices de la tabla `usuarios_has_telefonos`
--
ALTER TABLE `usuarios_has_telefonos`
  ADD PRIMARY KEY (`usuarios_cedula`,`telefonos_id_telefono`),
  ADD KEY `fk_usuarios_has_telefonos_telefonos1_idx` (`telefonos_id_telefono`),
  ADD KEY `fk_usuarios_has_telefonos_usuarios1_idx` (`usuarios_cedula`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `correos`
--
ALTER TABLE `correos`
  MODIFY `id_correo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id_estados` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `localidades`
--
ALTER TABLE `localidades`
  MODIFY `id_localidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT de la tabla `rutinaservicios`
--
ALTER TABLE `rutinaservicios`
  MODIFY `idRutinaServicios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `sesiones`
--
ALTER TABLE `sesiones`
  MODIFY `idSesiones` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Este campo es la clave primaria de la tabla y  almacena el (id) ';
--
-- AUTO_INCREMENT de la tabla `tg_roles_usuarios_after_update`
--
ALTER TABLE `tg_roles_usuarios_after_update`
  MODIFY `id_actualizacion_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `usuarios_has_direcciones`
--
ALTER TABLE `usuarios_has_direcciones`
  MODIFY `id_direccion` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aplazamientos`
--
ALTER TABLE `aplazamientos`
  ADD CONSTRAINT `FKClientesAplazamientos` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idClientes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_aplazamiento_tipo_aplazamiento` FOREIGN KEY (`id_tipo_aplazamiento`) REFERENCES `tipo_aplazamiento` (`id_tipo`);

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_ClientesEmpresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ClientesUsuarios` FOREIGN KEY (`idClientes`) REFERENCES `usuarios` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `correos`
--
ALTER TABLE `correos`
  ADD CONSTRAINT `fk_usuarios_correos` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`cedula`);

--
-- Filtros para la tabla `datosclinicos`
--
ALTER TABLE `datosclinicos`
  ADD CONSTRAINT `fk_DatosClientes` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idClientes`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD CONSTRAINT `fk_direcciones_localidad` FOREIGN KEY (`id_localidad`) REFERENCES `localidades` (`id_localidad`);

--
-- Filtros para la tabla `direcciones_has_empresa`
--
ALTER TABLE `direcciones_has_empresa`
  ADD CONSTRAINT `fk_direcciones_has_empresa_direcciones1` FOREIGN KEY (`direcciones_iddirecciones`) REFERENCES `direcciones` (`iddirecciones`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_direcciones_has_empresa_empresa1` FOREIGN KEY (`empresa_idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empresa_has_telefonos`
--
ALTER TABLE `empresa_has_telefonos`
  ADD CONSTRAINT `fk_empresa_has_telefonos_empresa1` FOREIGN KEY (`empresa_idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empresa_has_telefonos_telefonos1` FOREIGN KEY (`telefonos_id_telefono`) REFERENCES `telefonos` (`id_telefono`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD CONSTRAINT `FKProgramasInscripciones` FOREIGN KEY (`idPrograma`) REFERENCES `programas` (`idProgramas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_InscripcionesCliente` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idClientes`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `fk_permisos_permisos1` FOREIGN KEY (`permisos_padre`) REFERENCES `permisos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `permisosroles`
--
ALTER TABLE `permisosroles`
  ADD CONSTRAINT `fk_permisos_has_roles_permisos1` FOREIGN KEY (`permisos_id`) REFERENCES `permisos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_permisos_has_roles_roles1` FOREIGN KEY (`roles_idRoles`) REFERENCES `roles` (`idRoles`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `personalmedico`
--
ALTER TABLE `personalmedico`
  ADD CONSTRAINT `FKClientesUsuarios` FOREIGN KEY (`idPersonalMedico`) REFERENCES `usuarios` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `programas`
--
ALTER TABLE `programas`
  ADD CONSTRAINT `FK_ProgramasRutinasServicios` FOREIGN KEY (`idRutinaServicios`) REFERENCES `rutinaservicios` (`idServicios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `rolesusuarios`
--
ALTER TABLE `rolesusuarios`
  ADD CONSTRAINT `fK_RolesUsuarios` FOREIGN KEY (`idRoles`) REFERENCES `roles` (`idRoles`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_UsuariosRoles` FOREIGN KEY (`idUsuarios`) REFERENCES `usuarios` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `rutinaservicios`
--
ALTER TABLE `rutinaservicios`
  ADD CONSTRAINT `FkRutnas_RutinasServicios` FOREIGN KEY (`idRutinas`) REFERENCES `rutinas` (`idRutinas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FkServicios_RutinasServicios` FOREIGN KEY (`idServicios`) REFERENCES `servicios` (`idServicio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sesiones`
--
ALTER TABLE `sesiones`
  ADD CONSTRAINT `FKPersonalSesiones` FOREIGN KEY (`idPersonalMedico`) REFERENCES `personalmedico` (`idPersonalMedico`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKSesionesProgramas` FOREIGN KEY (`idPrograma`) REFERENCES `programas` (`idProgramas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `telefonos`
--
ALTER TABLE `telefonos`
  ADD CONSTRAINT `fk_telefonos_tipo_telefono1` FOREIGN KEY (`tipo_telefono_idtipo_telefono`) REFERENCES `tipo_telefono` (`idtipo_telefono`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_estados`) REFERENCES `estados` (`id_estados`);

--
-- Filtros para la tabla `usuarios_has_direcciones`
--
ALTER TABLE `usuarios_has_direcciones`
  ADD CONSTRAINT `fk_usuarios_has_direcciones_direcciones1` FOREIGN KEY (`direcciones_iddirecciones`) REFERENCES `direcciones` (`iddirecciones`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuarios_has_direcciones_usuarios1` FOREIGN KEY (`usuarios_cedula`) REFERENCES `usuarios` (`cedula`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios_has_telefonos`
--
ALTER TABLE `usuarios_has_telefonos`
  ADD CONSTRAINT `fk_usuarios_has_telefonos_telefonos1` FOREIGN KEY (`telefonos_id_telefono`) REFERENCES `telefonos` (`id_telefono`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuarios_has_telefonos_usuarios1` FOREIGN KEY (`usuarios_cedula`) REFERENCES `usuarios` (`cedula`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
