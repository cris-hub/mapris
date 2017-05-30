-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-05-2017 a las 06:08:01
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*Hola*/
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mapris`
--
CREATE DATABASE IF NOT EXISTS `mapris` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mapris`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplazamientos`
--

CREATE TABLE `aplazamientos` (
  `idaplazamiento` int(11) NOT NULL,
  `motivo` text COMMENT 'Este campo almacena la razon por la cual se hace el aplazamiento',
  `fechaRetorno` datetime DEFAULT NULL,
  `idcliente` bigint(20) DEFAULT NULL
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

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idClientes`, `idEmpresa`, `estado`) VALUES
(2222, 1, 'desasociada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `correos`
--

CREATE TABLE `correos` (
  `idCorreo` int(11) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `correos`
--

INSERT INTO `correos` (`idCorreo`, `correo`, `idUsuario`) VALUES
(1, 'ma412@misena.edu.co', 1),
(2, 'alexandrams1999@hotmail.com', 2),
(3, 'girlwholovesGod@gmail.com', 2),
(4, 'mari@hotmialc.h', 9),
(5, '6391@misena.edu.co', 10),
(6, 'ma412@misena.edu.co', 11),
(7, 'ma412@misena.edu.co', 12),
(8, 'ma412@misena.edu.co', 13),
(9, 'lolagmao.cmk', 14),
(10, 'lolagmao.cmk', 15),
(11, 'ma412@misena.edu.co', 16),
(12, 'ma412@misena.edu.co', 17);

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
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `idEmpresa` bigint(20) NOT NULL COMMENT 'Este campo es la clave primaria de la tabla y  almacena el (id) ',
  `nombre` varchar(45) NOT NULL COMMENT 'Este campo almacena el nombre de la empresa',
  `direccion` varchar(45) DEFAULT NULL COMMENT 'Este campo almacena la dirrecion de cada empresa',
  `telefono` int(11) DEFAULT NULL COMMENT 'Este campo almacena el telefono de cada empresa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`idEmpresa`, `nombre`, `direccion`, `telefono`) VALUES
(1, 'Cafám', 'Cll 23 # 23 - 24', 3456782);

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
(5, 'crud', '', 'fa fa-list', NULL),
(42, 'usuarios', '/app/usuarios/listar.xhtml', 'fa fa-list-ul', 4),
(44, 'Registrar usuario', '/app/usuarios/nuevo.xhtml', 'fa fa-plus', 4);

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
(42, 1),
(44, 1);

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
(3333, 'Profesional de la salud', 'Ginecobstetra');

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
  `idRoles` int(11) NOT NULL COMMENT 'Este campo almacena el (id) de la tabla "Roles"',
  `idUsuarios` bigint(20) NOT NULL COMMENT 'Este campo almacena el (id) de la tabla "Usuarios"'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rolesusuarios`
--

INSERT INTO `rolesusuarios` (`idRoles`, `idUsuarios`) VALUES
(1, 1111),
(2, 2222),
(3, 3333);

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
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `cedula` bigint(20) NOT NULL COMMENT 'Este campo almacena la cedula de todos los usuarios',
  `nombre` varchar(20) NOT NULL COMMENT 'Este campo almacena el nombre de cada usuario',
  `apellidos` varchar(40) NOT NULL COMMENT 'Este campo almacena el apellido de cada usuario',
  `email` varchar(40) DEFAULT NULL COMMENT 'Este campo almacena el correo electronico de cada usuario',
  `telefono` int(11) DEFAULT NULL COMMENT 'Este campo almacena el numero de telefono de cada usuario',
  `dirreccion` varchar(20) DEFAULT NULL COMMENT 'Este campo almacena la dirreccion de donde vive cada usuario',
  `fechaNaci` date NOT NULL COMMENT 'Este campo almacena la fecha de nacimineto de cada usuario',
  `clave` varchar(200) NOT NULL,
  `imegen_perfil` blob,
  `estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`cedula`, `nombre`, `apellidos`, `email`, `telefono`, `dirreccion`, `fechaNaci`, `clave`, `imegen_perfil`, `estado`) VALUES
(1111, 'maria', 'lorenzo', 'lorek09@gmail.com', 345425, 'dia 15 -43 ', '1987-04-11', '1111', NULL, 1),
(2222, 'ana ', 'peña', 'ana@peña', 367213, 'cll 112', '1991-03-04', '2222', NULL, 2),
(3333, 'Matilde Rocio', 'Peña Cañaveral', 'mt@gmail.com', 3456788, 'Cll 54 # 34 - 12 ', '1990-01-01', '3333', NULL, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aplazamientos`
--
ALTER TABLE `aplazamientos`
  ADD PRIMARY KEY (`idaplazamiento`),
  ADD KEY `FKClientesAplazamientos_idx` (`idcliente`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idClientes`),
  ADD KEY `fk_ClientesEmpresa_idx` (`idEmpresa`);

--
-- Indices de la tabla `datosclinicos`
--
ALTER TABLE `datosclinicos`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`idEmpresa`);

--
-- Indices de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD PRIMARY KEY (`idInscripciones`),
  ADD KEY `fk_InscripcionesCliente_idx` (`idCliente`),
  ADD KEY `FKProgramasInscripciones` (`idPrograma`);

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
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`cedula`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

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
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aplazamientos`
--
ALTER TABLE `aplazamientos`
  ADD CONSTRAINT `FKClientesAplazamientos` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idClientes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_ClientesEmpresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ClientesUsuarios` FOREIGN KEY (`idClientes`) REFERENCES `usuarios` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `datosclinicos`
--
ALTER TABLE `datosclinicos`
  ADD CONSTRAINT `fk_DatosClientes` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idClientes`) ON DELETE CASCADE ON UPDATE NO ACTION;

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
