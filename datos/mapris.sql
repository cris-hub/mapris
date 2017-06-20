-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-06-2017 a las 15:23:39
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
CREATE DATABASE IF NOT EXISTS `mapris` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `mapris`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades`
--

CREATE TABLE `actividades` (
  `idadtividad` int(11) NOT NULL,
  `idRutinas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `actividades`
--

INSERT INTO `actividades` (`idadtividad`, `idRutinas`) VALUES
(1, 1),
(4, 1),
(2, 2),
(5, 2),
(3, 3),
(6, 3);

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
-- Estructura de tabla para la tabla `cita_medica`
--

CREATE TABLE `cita_medica` (
  `idcita_medica` int(11) NOT NULL,
  `consultorios_idconsultorio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1600072330999, 1, '1'),
(1600112313399, 2, '1'),
(1602081548099, 3, '1'),
(1602120920199, 4, '1'),
(1603010433999, 5, '1'),
(1605052037499, 6, '1'),
(1606072561599, 7, '1'),
(1607032664899, 8, '1'),
(1608021707799, 9, '1'),
(1609080393299, 10, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultorios`
--

CREATE TABLE `consultorios` (
  `idconsultorio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `consultorios`
--

INSERT INTO `consultorios` (`idconsultorio`) VALUES
(1),
(2),
(3);

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
(1, 'ma@gmail.com', 1031174466),
(2, 'ka@gmail.com', 1600032140599),
(3, 'lo@gmail.com', 1600072330999),
(4, 'po@gmail.com', 1600112313399),
(5, 'pa@gmail.com', 1602081548099),
(6, 'ro@gmail.com', 1602120920199),
(7, 'yu@gmail.com', 1603010433999),
(8, 'pri@gmail.com', 1605052037499),
(9, 'io@gmail.com', 1606072561599),
(10, 'tupac@gmail.com', 1607032664899);

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

--
-- Volcado de datos para la tabla `datosclinicos`
--

INSERT INTO `datosclinicos` (`idCliente`, `rh`, `datosPosparto`, `datosPrenatales`) VALUES
(1600072330999, 'O+', 1, 2),
(1600112313399, 'A-', 1, 2),
(1602081548099, 'A+', 1, 2),
(1602120920199, 'B-', 1, 2),
(1603010433999, 'O-', 1, 2),
(1605052037499, 'A-', 1, 2),
(1606072561599, 'O+', 1, 2),
(1607032664899, 'A-', 1, 2),
(1608021707799, 'B+', 1, 2),
(1609080393299, 'O-', 1, 2);

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

--
-- Volcado de datos para la tabla `direcciones`
--

INSERT INTO `direcciones` (`iddirecciones`, `id_localidad`, `avenida`, `calle`, `carrera`) VALUES
(1, 1, 'Apdo.:904-3880 Pellentesque ', '47', '35'),
(2, 2, 'Apartado núm.: 874, 8683 Aenean Carretera', '30', '96'),
(3, 3, '1300 Turpis Av.', '19', '89'),
(4, 4, '2189 Eleifend Ctra.', '80', '61'),
(5, 5, 'Apdo.:600-9662 Ante, ', '43', '45'),
(6, 6, 'Apdo.:107-8067 Velit Carretera', '16', '49'),
(7, 7, 'Apartado núm.: 350, 3766 Vitae C/', '38', '53'),
(8, 8, '822-2509 Quisque Avenida', '85', '92'),
(9, 9, '194-7742 Eget Av.', '74', '15'),
(10, 10, 'Apartado núm.: 998, 1484 Egestas. Avenida', '26', '31'),
(11, 11, 'Apdo.:710-564 Sodales. Avenida', '92', '40'),
(12, 12, '3366 Scelerisque C.', '69', '65'),
(13, 13, 'Apdo.:137-294 Semper C/', '07', '60'),
(14, 14, 'Apdo.:645-6971 Elit, Calle', '35', '35'),
(15, 15, 'Apdo.:110-3944 Quis C.', '12', '25'),
(16, 16, 'Apdo.:997-2950 Enim C.', '60', '89'),
(17, 17, '7200 Erat, C/', '61', '29'),
(18, 18, 'Apdo.:464-7252 Mi. Avda.', '68', '07'),
(19, 19, '904-6981 Pharetra. C/', '05', '93'),
(20, 20, 'Apartado núm.: 807, 7904 Ultrices ', '06', '09'),
(21, 21, '5887 Euismod Ctra.', '72', '36'),
(22, 22, 'Apdo.:771-5232 Augue Avda.', '50', '83'),
(23, 23, '5041 Mus. Ctra.', '02', '63'),
(24, 24, 'Apdo.:848-1779 Non, C.', '71', '62'),
(25, 25, 'Apdo.:938-8999 Ligula. ', '21', '92'),
(26, 26, 'Apartado núm.: 893, 8575 Hendrerit Carretera', '85', '12'),
(27, 27, '3593 Luctus Avda.', '57', '30'),
(28, 28, 'Apartado núm.: 849, 4725 Nulla Calle', '45', '84'),
(29, 29, '650-1954 Nulla Avenida', '23', '56'),
(30, 30, '9336 Arcu. C/', '89', '80'),
(31, 31, '2814 Semper, Calle', '08', '69'),
(32, 32, '548 Mus. C.', '71', '29'),
(33, 33, 'Apartado núm.: 633, 5523 Sed, Carretera', '65', '36'),
(34, 34, '623-8277 Montes, Ctra.', '71', '58'),
(35, 35, 'Apdo.:175-469 Vestibulum Ctra.', '57', '81'),
(36, 36, 'Apartado núm.: 937, 7188 Donec Avenida', '95', '36'),
(37, 37, 'Apdo.:418-7348 Vitae C/', '59', '52'),
(38, 38, 'Apdo.:796-1356 Sapien Ctra.', '17', '37'),
(39, 39, 'Apartado núm.: 840, 4955 Accumsan ', '25', '68'),
(40, 40, '8005 Vitae ', '46', '02'),
(41, 41, '6348 Eget, C/', '98', '81'),
(42, 42, '9386 Convallis C/', '17', '19'),
(43, 43, 'Apdo.:967-5753 Sagittis. C.', '71', '49'),
(44, 44, 'Apartado núm.: 832, 7641 Ultrices. Av.', '68', '17'),
(45, 45, 'Apdo.:326-2083 Suscipit Avda.', '36', '07'),
(46, 46, 'Apartado núm.: 504, 3764 Vivamus Calle', '74', '38'),
(47, 47, '506-1545 Aenean C.', '35', '48'),
(48, 48, 'Apdo.:227-2638 Scelerisque, Avda.', '70', '79'),
(49, 49, 'Apartado núm.: 126, 5453 Ornare, C.', '72', '28'),
(50, 50, '3656 Sem. Avda.', '95', '50'),
(51, 51, '6432 Donec C/', '52', '15'),
(52, 52, 'Apartado núm.: 875, 988 Quis Carretera', '82', '16'),
(53, 53, 'Apartado núm.: 682, 8720 Aliquet Ctra.', '58', '86'),
(54, 54, 'Apdo.:911-1614 Bibendum. C/', '52', '71'),
(55, 55, 'Apdo.:389-6894 Non C/', '10', '26'),
(56, 56, 'Apartado núm.: 143, 4278 At, Avda.', '88', '69'),
(57, 57, '8932 Augue C/', '28', '51'),
(58, 58, 'Apartado núm.: 312, 3434 At, C/', '68', '62'),
(59, 59, '4209 Eu Av.', '84', '27'),
(60, 60, '9462 Arcu. Carretera', '87', '57'),
(61, 61, 'Apartado núm.: 813, 4792 Fusce Carretera', '47', '54'),
(62, 62, '2041 Sed Carretera', '42', '30'),
(63, 63, 'Apartado núm.: 381, 1275 Sed C.', '23', '09'),
(64, 64, '837-9733 Et Av.', '61', '46'),
(65, 65, 'Apartado núm.: 764, 9260 Imperdiet Carretera', '98', '30'),
(66, 66, 'Apartado núm.: 478, 271 Tincidunt, Carretera', '60', '34'),
(67, 67, 'Apartado núm.: 449, 4521 Odio. Avenida', '74', '87'),
(68, 68, '9239 Mollis Ctra.', '01', '27'),
(69, 69, 'Apartado núm.: 334, 7242 Lectus Ctra.', '83', '09'),
(70, 70, '700-1342 Purus Avda.', '61', '77'),
(71, 71, 'Apartado núm.: 200, 5326 Mauris, Carretera', '82', '15'),
(72, 72, 'Apdo.:124-9400 Odio Av.', '07', '83'),
(73, 73, 'Apartado núm.: 576, 5699 Ante. Avda.', '20', '95'),
(74, 74, 'Apartado núm.: 353, 4519 Ridiculus Av.', '71', '97'),
(75, 75, 'Apartado núm.: 518, 7410 Sed Calle', '61', '44'),
(76, 76, 'Apartado núm.: 666, 9346 Arcu. Calle', '11', '34'),
(77, 77, '733-8968 Massa. Calle', '42', '86'),
(78, 78, 'Apartado núm.: 201, 7505 Quisque C.', '54', '59'),
(79, 79, 'Apdo.:711-9967 Neque. Calle', '69', '11'),
(80, 80, '202-4463 Luctus Ctra.', '03', '82'),
(81, 81, 'Apdo.:100-9342 Et C/', '74', '55'),
(82, 82, 'Apartado núm.: 425, 1357 Laoreet, Carretera', '99', '84'),
(83, 83, '256-9359 Libero ', '79', '40'),
(84, 84, 'Apdo.:918-8707 Massa. Calle', '73', '61'),
(85, 85, 'Apartado núm.: 546, 7094 Nulla. C.', '62', '37'),
(86, 86, 'Apdo.:260-2324 Posuere ', '95', '35'),
(87, 87, '267-6523 Ante Ctra.', '20', '73'),
(88, 88, '451-9433 Non, Ctra.', '91', '47'),
(89, 89, '703-1842 Quam. Ctra.', '14', '65'),
(90, 90, 'Apartado núm.: 921, 5433 Ipsum Carretera', '82', '70'),
(91, 91, '3852 Integer ', '46', '58'),
(92, 92, 'Apdo.:784-4314 Sed ', '59', '33'),
(93, 93, 'Apartado núm.: 345, 8986 Consequat, Av.', '81', '11'),
(94, 94, '3534 Molestie. C/', '44', '28'),
(95, 95, 'Apdo.:653-9562 Bibendum Avenida', '68', '93'),
(96, 96, 'Apdo.:651-8423 Vestibulum Avda.', '17', '42'),
(97, 97, '4985 A Carretera', '84', '92'),
(98, 98, 'Apartado núm.: 342, 993 Et, Calle', '84', '96'),
(99, 99, 'Apartado núm.: 392, 9324 Fames Ctra.', '97', '08'),
(100, 100, 'Apartado núm.: 610, 8443 Ipsum Carretera', '10', '00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones_has_empresa`
--

CREATE TABLE `direcciones_has_empresa` (
  `direcciones_iddirecciones` int(11) NOT NULL,
  `empresa_idEmpresa` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `direcciones_has_empresa`
--

INSERT INTO `direcciones_has_empresa` (`direcciones_iddirecciones`, `empresa_idEmpresa`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26),
(27, 27),
(28, 28),
(29, 29),
(30, 30),
(31, 31),
(32, 32),
(33, 33),
(34, 34),
(35, 35),
(36, 36),
(37, 37),
(38, 38),
(39, 39),
(40, 40),
(41, 41),
(42, 42),
(43, 43),
(44, 44),
(45, 45),
(46, 46),
(47, 47),
(48, 48),
(49, 49),
(50, 50),
(51, 51),
(52, 52),
(53, 53),
(54, 54),
(55, 55),
(56, 56),
(57, 57),
(58, 58),
(59, 59),
(60, 60),
(61, 61),
(62, 62),
(63, 63),
(64, 64),
(65, 65),
(66, 66),
(67, 67),
(68, 68),
(69, 69),
(70, 70),
(71, 71),
(72, 72),
(73, 73),
(74, 74),
(75, 75),
(76, 76),
(77, 77),
(78, 78),
(79, 79),
(80, 80),
(81, 81),
(82, 82),
(83, 83),
(84, 84),
(85, 85),
(86, 86),
(87, 87),
(88, 88),
(89, 89),
(90, 90),
(91, 91),
(92, 92),
(93, 93),
(94, 94),
(95, 95),
(96, 96),
(97, 97),
(98, 98),
(99, 99),
(100, 100);

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
(1, 'Augue LLC'),
(2, 'Vitae Risus Duis Limited'),
(3, 'Orci Tincidunt Corporation'),
(4, 'Fringilla Donec Incorporated'),
(5, 'Dignissim Lacus Aliquam LLC'),
(6, 'Morbi Accumsan Ltd'),
(7, 'Enim Nec Tempus LLP'),
(8, 'Arcu Curabitur Ut PC'),
(9, 'Dolor Nonummy Ac Industries'),
(10, 'Torquent Per Conubia Inc.'),
(11, 'Mauris LLP'),
(12, 'Non Arcu Vivamus Foundation'),
(13, 'Morbi Company'),
(14, 'Facilisis Magna Tellus PC'),
(15, 'Cum Sociis Natoque LLC'),
(16, 'Eu Odio Tristique Foundation'),
(17, 'Purus Inc.'),
(18, 'Elit Elit Fermentum Corp.'),
(19, 'Sed Pede Nec LLC'),
(20, 'Tellus Sem Mollis Foundation'),
(21, 'Mauris Inc.'),
(22, 'A Aliquet Vel Corporation'),
(23, 'Ullamcorper Viverra Limited'),
(24, 'Lacinia Orci Consectetuer Corporation'),
(25, 'Sem Ut Dolor Corporation'),
(26, 'Consectetuer Mauris Id Corporation'),
(27, 'Volutpat Nunc Institute'),
(28, 'Aliquam Incorporated'),
(29, 'Blandit Mattis PC'),
(30, 'Dictum Augue Malesuada Corp.'),
(31, 'Posuere Company'),
(32, 'Pharetra Corp.'),
(33, 'Maecenas Malesuada LLC'),
(34, 'Sodales Mauris LLP'),
(35, 'Sapien Limited'),
(36, 'Dui Incorporated'),
(37, 'Et Ultrices Consulting'),
(38, 'Mauris Limited'),
(39, 'Nunc LLC'),
(40, 'Placerat Cras Dictum Company'),
(41, 'Fusce Feugiat Lorem PC'),
(42, 'Eu Turpis Corporation'),
(43, 'Lectus Rutrum LLP'),
(44, 'Risus Quis Corporation'),
(45, 'Euismod Enim Corporation'),
(46, 'Nibh PC'),
(47, 'Quam A Company'),
(48, 'Ridiculus Consulting'),
(49, 'Amet Consulting'),
(50, 'Adipiscing Mauris LLP'),
(51, 'Nulla LLC'),
(52, 'Cursus Incorporated'),
(53, 'Nunc Laoreet Incorporated'),
(54, 'Dolor Elit Pellentesque LLP'),
(55, 'Tincidunt Ltd'),
(56, 'Duis Gravida Corporation'),
(57, 'Ipsum Industries'),
(58, 'Gravida Limited'),
(59, 'Nec Incorporated'),
(60, 'Elit Etiam LLP'),
(61, 'Interdum Nunc Limited'),
(62, 'Dui LLC'),
(63, 'Sollicitudin Inc.'),
(64, 'Est Nunc Corporation'),
(65, 'Aliquam Corporation'),
(66, 'Ligula Nullam Institute'),
(67, 'Est Congue Foundation'),
(68, 'Vestibulum Accumsan Neque Corporation'),
(69, 'Sodales Institute'),
(70, 'Ut Institute'),
(71, 'Lacus Ut Nec Corporation'),
(72, 'Dictum Phasellus In Ltd'),
(73, 'Elit Erat Vitae Corp.'),
(74, 'Ac Nulla Corp.'),
(75, 'Nulla At Sem Inc.'),
(76, 'Quam Foundation'),
(77, 'Lorem Auctor Corp.'),
(78, 'Mauris Vel Turpis Foundation'),
(79, 'Donec Associates'),
(80, 'Porta Corporation'),
(81, 'Cras Sed Leo Consulting'),
(82, 'Suspendisse Sagittis Nullam Associates'),
(83, 'Conubia Consulting'),
(84, 'Ligula Aenean LLC'),
(85, 'Auctor Vitae Aliquet Associates'),
(86, 'Sed LLC'),
(87, 'Quis Urna Industries'),
(88, 'Nunc Sit Industries'),
(89, 'Dolor Sit Amet Consulting'),
(90, 'Lorem Ipsum Dolor Industries'),
(91, 'Class Ltd'),
(92, 'Odio Corp.'),
(93, 'Taciti Sociosqu Industries'),
(94, 'Bibendum Ullamcorper Incorporated'),
(95, 'Lacus Cras Interdum LLC'),
(96, 'Mauris Company'),
(97, 'Eros Nec LLP'),
(98, 'Quam A Consulting'),
(99, 'Feugiat Sed Associates'),
(100, 'Lobortis PC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa_has_telefonos`
--

CREATE TABLE `empresa_has_telefonos` (
  `empresa_idEmpresa` bigint(20) NOT NULL,
  `telefonos_id_telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empresa_has_telefonos`
--

INSERT INTO `empresa_has_telefonos` (`empresa_idEmpresa`, `telefonos_id_telefono`) VALUES
(80, 80),
(81, 81),
(82, 82),
(83, 83),
(84, 84),
(85, 85),
(86, 86),
(87, 87),
(88, 88),
(89, 89),
(90, 90),
(91, 91),
(92, 92),
(93, 93),
(94, 94),
(95, 95),
(96, 96),
(97, 97),
(98, 98),
(99, 99),
(100, 100);

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
(1, 'activo', 'usuario puede aceder al sistema'),
(2, 'bloqueado', ' usuario bloqueado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones`
--

CREATE TABLE `inscripciones` (
  `idInscripciones` int(11) NOT NULL COMMENT 'Este campo es la clave primaria de la tabla y  almacena el (id) \n',
  `idCliente` bigint(20) NOT NULL COMMENT 'Este campo almacena el (id) de la tabla "Clientes"',
  `fechaInicio` date DEFAULT NULL COMMENT 'Este campo almacena la fecha en que fue realizada la incripcion al programa',
  `valor` int(11) DEFAULT NULL COMMENT 'Este campo almacena el coste de la inscripcion',
  `id_servicio` int(11) NOT NULL,
  `numero_sesiones` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `inscripciones`
--

INSERT INTO `inscripciones` (`idInscripciones`, `idCliente`, `fechaInicio`, `valor`, `id_servicio`, `numero_sesiones`) VALUES
(1, 1600072330999, '2016-12-12', 200000, 1, 10),
(2, 1600112313399, '2016-12-24', 300000, 2, 20),
(3, 1602081548099, '2016-11-20', 300000, 3, 5),
(4, 1602120920199, '2016-10-24', 200000, 4, 9),
(5, 1603010433999, '2016-09-12', 100000, 5, 10),
(6, 1605052037499, '2016-09-09', 150000, 6, 8),
(7, 1606072561599, '2016-11-01', 200000, 7, 10),
(8, 1607032664899, '2016-12-12', 300000, 8, 9),
(9, 1608021707799, '2016-12-12', 200000, 9, 10),
(10, 1609080393299, '2016-08-08', 300000, 10, 10);

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
(1, 'Forge-Philippe'),
(2, 'Stockton-on-Tees'),
(3, 'Wambeek'),
(4, 'Denver'),
(5, 'Dublin'),
(6, 'Rostock'),
(7, 'Kalisz'),
(8, 'Uluberia'),
(9, 'Macquenoise'),
(10, 'El Quisco'),
(11, 'Huntsville'),
(12, 'Columbia'),
(13, 'Osgoode'),
(14, 'Vellore'),
(15, 'Greater Hobart'),
(16, 'Quesada'),
(17, 'Ancud'),
(18, 'Manukau'),
(19, 'Dalcahue'),
(20, 'Calestano'),
(21, 'Olathe'),
(22, 'Monte Giberto'),
(23, 'Bath'),
(24, 'Whitby'),
(25, 'Hallaar'),
(26, 'Schriek'),
(27, 'Annone di Brianza'),
(28, 'Houffalize'),
(29, 'Roselies'),
(30, 'Santa Cruz'),
(31, 'Peñalolén'),
(32, 'Bairnsdale'),
(33, 'Bilbo'),
(34, 'Worcester'),
(35, 'Watermaal-Bosvoorde'),
(36, 'Berwick'),
(37, 'Motueka'),
(38, 'Tielrode'),
(39, 'Clarksville'),
(40, 'Ross-on-Wye'),
(41, 'Taunton'),
(42, 'Brandenburg'),
(43, 'Mackay'),
(44, 'Kempten'),
(45, 'Patna'),
(46, 'Fort Good Hope'),
(47, 'Aubange'),
(48, 'Barrie'),
(49, 'Penicuik'),
(50, 'Bègles'),
(51, 'Santa Caterina Villarmosa'),
(52, 'Redcliffe'),
(53, 'Barrie'),
(54, 'Romano d\'Ezzelino'),
(55, 'Leoben'),
(56, 'Contulmo'),
(57, 'Ingelheim'),
(58, 'Grand Rapids'),
(59, 'Hamoir'),
(60, 'Wollongong'),
(61, 'Rouvreux'),
(62, 'Regina'),
(63, 'Chetwynd'),
(64, 'Telford'),
(65, 'Crieff'),
(66, 'Bothey'),
(67, 'Cochrane'),
(68, 'Rohtak'),
(69, 'Biala Podlaska'),
(70, 'Burlington'),
(71, 'Rocca d\'Arce'),
(72, 'La Seyne-sur-Mer'),
(73, 'Civitacampomarano'),
(74, 'Norrkoping'),
(75, 'Brentwood'),
(76, 'Würzburg'),
(77, 'Monteroni d\'Arbia'),
(78, 'Celle'),
(79, 'La Higuera'),
(80, 'Castiglione di Sicilia'),
(81, 'Pamplona'),
(82, 'Altmünster'),
(83, 'Neerrepen'),
(84, 'Ottawa'),
(85, 'Leers-et-Fosteau'),
(86, 'CŽroux-Mousty'),
(87, 'Gaithersburg'),
(88, 'Vielsalm'),
(89, 'Neubrandenburg'),
(90, 'Pitrufquén'),
(91, 'Thorold'),
(92, 'Sijsele'),
(93, 'Snaaskerke'),
(94, 'Regensburg'),
(95, 'Meppel'),
(96, 'Caxias'),
(97, 'Vucht'),
(98, 'Morro d\'Alba'),
(99, 'Campbelltown'),
(100, 'Denver');

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
(1, 'perfil', '', 'fa fa-user-o\r', NULL),
(2, 'usuarios', '', 'fa fa-users\r', NULL),
(3, 'aplazamientos', '', 'fa fa-clock-o\r', NULL),
(4, 'citas', '', 'fa fa-calendar-check-o\r', NULL),
(5, 'agenda', '', 'fa fa-calendar\r', NULL),
(11, 'Mi perfil', '/app/perfil/miperfil.xhtml', 'fa fa-user\r', 1),
(12, 'Cambiar Datos', '/app/perfil/cambiardatos.xhtml', 'fa fa-pencil\r', 1),
(21, 'Lista usuarios', '/app/usuarios/listar.xhtml', 'fa fa-list\r', 2),
(22, 'Nuevo usuario', '/app/usuarios/nuevo.xhtml', 'fa fa-user-plus\r', 2),
(31, 'Lista Aplazamientos', '/app/aplazamientos/lista.xhtml', 'fa fa-list\r', 3),
(32, 'Registrar aplazamiento', '/app/aplazamientos/nuevo.xhtml', 'fa fa-plus\r', 3);

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
(2, 1),
(3, 1),
(11, 1),
(12, 1),
(21, 1),
(22, 1),
(31, 1),
(32, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personalmedico`
--

CREATE TABLE `personalmedico` (
  `idPersonalMedico` bigint(20) NOT NULL COMMENT 'Este campo almacena la cedula de cada Personal Medico (Solo Personal Medico)',
  `perfilProfesional` varchar(45) NOT NULL COMMENT 'Este campo almacena la especialidad que tiene cada Personal Medico ',
  `cargo` varchar(70) NOT NULL COMMENT 'Este campo almacena el tipo de cargo que tiene el personal Medico (Prenatal o Posnatal)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `personalmedico`
--

INSERT INTO `personalmedico` (`idPersonalMedico`, `perfilProfesional`, `cargo`) VALUES
(1600072330999, 'Ginecobstetra', 'Profesional en la salud'),
(1602120920199, 'Fisioterapeuta', 'Profesional en la salud'),
(1606072561599, 'Masajista', 'Profesional en la salud'),
(1609080393299, 'Estétisista', 'Profesional en la belleza'),
(1616110563599, 'Especialista en Yoga ', 'Profesional en el arte de la meditación');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programas`
--

CREATE TABLE `programas` (
  `idprograma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `programas`
--

INSERT INTO `programas` (`idprograma`) VALUES
(1),
(2),
(3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programas_has_clases`
--

CREATE TABLE `programas_has_clases` (
  `idprograma` int(11) NOT NULL,
  `idactividad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `programas_has_clases`
--

INSERT INTO `programas_has_clases` (`idprograma`, `idactividad`) VALUES
(1, 1),
(2, 2),
(3, 3);

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
(1, 'Administrador', 'Maxima autoridad del sistema'),
(2, 'Cliente', 'Usuarios rutinarios del sistema'),
(3, 'Personal Medico', 'Especialistas del gimnasio');

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
(2, 1600032140599),
(3, 1600072330999),
(1, 1600112313399),
(2, 1602081548099),
(3, 1602120920199),
(1, 1603010433999),
(2, 1605052037499),
(3, 1606072561599),
(1, 1607032664899),
(2, 1608021707799),
(3, 1609080393299),
(1, 1610122573899),
(2, 1611012149999),
(3, 1616110563599);

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
(1, 'Rutina Prenatal', 'Programa de prevención, Acondicionamiento fisicio: Yoga, Pilates, Esferodinamia, Rumba, BodyJam. Curso Psicoprofiláctico, Spa y Relajación'),
(2, 'Rutina Posnatal', 'Programa de prevención, Acondicionamiento fisico: Yoga posparto, Pilates posparto, Tono, Acondicionamiento fisico. Área especializada en posparto y reducción de peso y medidas'),
(3, 'Rutina Club bebé', 'Taller Shantala, Baby rumba, Yoga Baby y Taller de primeros auxilios para padres y cuidadores');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salones`
--

CREATE TABLE `salones` (
  `id_salones` varchar(45) NOT NULL,
  `actividad` int(11) DEFAULT NULL,
  `salon` varchar(45) NOT NULL,
  `descripcion` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `salones`
--

INSERT INTO `salones` (`id_salones`, `actividad`, `salon`, `descripcion`) VALUES
('1', 1, '1', 'psap'),
('2', 2, '2', 'aisjd'),
('3', 3, '3', 'akjsdkl'),
('4', 4, '4', 'aksdkla'),
('5', 5, '5', 'asdasd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `idServicio` int(11) NOT NULL COMMENT 'Este campo es la clave primaria de la tabla y  almacena el (id) de cada programa',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Este campo almacena el nombre de programa ',
  `descripcion` text COMMENT 'Este campo almacena una pequeña descripcion de cada programa',
  `tipo_servicio_idtipo_servicio` int(11) NOT NULL,
  `inicio` datetime DEFAULT NULL,
  `fin` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`idServicio`, `nombre`, `descripcion`, `tipo_servicio_idtipo_servicio`, `inicio`, `fin`) VALUES
(1, 'Programa de promoción y prevención', 'Programa de prevención y promoción en el estado prenatal, valoración física realizada por profesional en Fisioterapia.', 1, '2016-12-12 00:00:00', '2017-05-05 00:00:00'),
(2, 'Acondicionamiento Fisico', 'Clases de Salón especialmente diseñadas para total seguridad de las embarazadas', 1, '2016-12-12 00:00:00', '2017-05-05 00:00:00'),
(3, 'Curso Psicoprofiláctico', 'Curso grupal o personalizado  de preparación para el parto y la maternidad.', 1, '2016-12-12 00:00:00', '2017-05-05 00:00:00'),
(4, 'Spa y Relajación', 'Masajes Prenatales: Masajes relajantes y drenajes linfáticos.  Spa Prenatal: Depilación completa especial para el parto, exfoliación corporal, hidratacion facial, chocolaterapia, masaje relajante, drenaje linfático, musicoterapia, aromaterapia, manicura y pedicura con productos naturales.', 1, '2016-12-12 00:00:00', '2017-05-05 00:00:00'),
(5, 'Programa de promoción y prevención', 'Valoración médica realizada por Ginecologia, valoración física realizada por Fisioterapeuta, valoración nutricional realizada por Nutricionista, valoración por médicina Estética.', 2, '2016-12-12 00:00:00', '2017-05-05 00:00:00'),
(6, 'Acondicionamiento Físico', 'Clases posparto de: yoga posparto, pilates posparto, tono y acondicionamiento fisico posnatal', 2, '2016-12-12 00:00:00', '2017-05-05 00:00:00'),
(7, 'Área Especializada', 'Manejo de la incontinencia urinaria por medio de Electroestimulación y biofeedback perineal y Drenaje mamario: Masajes especiales durante la lactancia para la prevención de la mastitis puerperal.', 2, '2016-12-12 00:00:00', '2017-05-05 00:00:00'),
(8, 'Reducción de peso y medidas', 'Sesiones especializadas para mujeres lactantes en posparto o poscesárea', 2, '2016-12-12 00:00:00', '2017-05-05 00:00:00'),
(9, 'Taller de Shantala', 'El arte de acariciar a tú bebé, técnica Hindu de estimulación a través del masaje. Regula el sistema digestivo, circulatorio, respiratorio y musculo- esqueletico; activa conexion afectiva con sus padres.', 3, '2016-12-12 00:00:00', '2017-05-05 00:00:00'),
(10, 'Baby Rumba', 'Ritmo y movimiento generan en el bebé la estimulación sensorial y el control vestibular, mejorando la tonificación neuromuscular. Activa la conexión papás - bebé, generando seguridad y tranquilidad.', 3, '2016-12-12 00:00:00', '2017-05-05 00:00:00'),
(11, 'Yoga Baby', 'Los movimientos suaves, armónicos y controlados del Yoga Baby favorecen la relajación y el equilibrio del bebé y la mamá.', 3, '2016-12-12 00:00:00', '2017-05-05 00:00:00'),
(12, 'Taller de Primeros Auxilios para Padres y Cuidadores', 'Cuatro (4) sesiones teórico - prácticas de una (1) hora.', 3, '2016-12-12 00:00:00', '2017-05-05 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesiones`
--

CREATE TABLE `sesiones` (
  `idSesiones` int(11) NOT NULL COMMENT 'Este campo es la clave primaria de la tabla y  almacena el (id) ',
  `idPersonalMedico` bigint(20) DEFAULT NULL COMMENT 'Este campo almacena el (id) de la tabla "Programa"',
  `fecha` date NOT NULL COMMENT 'Este campo almacena la fecha de la realizacion de la clase del programa',
  `hora` time DEFAULT NULL COMMENT 'Este campo almacena la hora en que se realiza el programa',
  `inscripciones_idInscripciones` int(11) NOT NULL,
  `estado` tinyint(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sesiones`
--

INSERT INTO `sesiones` (`idSesiones`, `idPersonalMedico`, `fecha`, `hora`, `inscripciones_idInscripciones`, `estado`) VALUES
(1, 1600072330999, '2016-12-01', '14:20:00', 1, 1),
(2, 1602120920199, '2016-12-02', '17:30:00', 1, 1),
(3, 1600072330999, '2016-12-04', '08:30:00', 2, 1),
(4, 1606072561599, '2016-12-31', '14:20:00', 4, 1),
(5, 1609080393299, '2016-09-09', '15:30:00', 3, 1),
(6, 1616110563599, '2016-12-12', '13:00:00', 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos`
--

CREATE TABLE `telefonos` (
  `id_telefono` int(11) NOT NULL,
  `numero` varchar(15) DEFAULT NULL,
  `tipo_telefono_idtipo_telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `telefonos`
--

INSERT INTO `telefonos` (`id_telefono`, `numero`, `tipo_telefono_idtipo_telefono`) VALUES
(1, '906-8455', 1),
(2, '779-762-7318', 2),
(3, '203-9179', 2),
(4, '498-615-3176', 2),
(5, '752-285-5733', 1),
(6, '699-6237', 2),
(7, '135-3082', 1),
(8, '480-9367', 2),
(9, '901-589-2343', 2),
(10, '825-158-1977', 2),
(11, '132-683-5274', 2),
(12, '456-787-9648', 1),
(13, '245-410-7001', 1),
(14, '530-148-7682', 2),
(15, '357-760-4524', 1),
(16, '682-320-1173', 2),
(17, '350-569-9937', 1),
(18, '565-383-9299', 1),
(19, '676-1262', 2),
(20, '789-7332', 1),
(21, '354-0470', 1),
(22, '622-285-0449', 1),
(23, '285-8020', 1),
(24, '115-4660', 2),
(25, '282-429-7262', 1),
(26, '297-3059', 2),
(27, '988-364-8186', 2),
(28, '839-876-2241', 1),
(29, '395-910-2923', 1),
(30, '451-664-1052', 1),
(31, '538-5351', 2),
(32, '990-3747', 1),
(33, '187-187-2145', 2),
(34, '514-861-1342', 2),
(35, '850-6036', 2),
(36, '499-355-4256', 1),
(37, '639-663-4048', 2),
(38, '352-9580', 2),
(39, '728-3308', 1),
(40, '944-2352', 2),
(41, '308-3084', 2),
(42, '386-830-4249', 1),
(43, '691-633-5018', 2),
(44, '525-335-7184', 1),
(45, '780-3509', 2),
(46, '843-728-9069', 2),
(47, '763-906-2255', 1),
(48, '676-287-9729', 2),
(49, '268-3152', 2),
(50, '364-8399', 1),
(51, '414-5925', 1),
(52, '403-8104', 1),
(53, '323-5845', 1),
(54, '708-1691', 1),
(55, '594-7705', 2),
(56, '746-465-1255', 1),
(57, '613-802-7831', 2),
(58, '263-0313', 2),
(59, '465-893-4506', 1),
(60, '776-1161', 1),
(61, '238-399-8390', 2),
(62, '190-222-3655', 1),
(63, '754-181-5288', 2),
(64, '184-780-7422', 1),
(65, '879-2590', 2),
(66, '481-6103', 1),
(67, '543-4630', 2),
(68, '876-265-1247', 1),
(69, '340-495-3640', 1),
(70, '618-352-5570', 1),
(71, '185-772-8517', 2),
(72, '624-4952', 1),
(73, '658-2041', 2),
(74, '533-8514', 2),
(75, '727-9284', 2),
(76, '108-5830', 2),
(77, '802-7488', 2),
(78, '226-834-3639', 1),
(79, '956-932-7299', 2),
(80, '687-2538', 1),
(81, '412-869-9422', 2),
(82, '482-322-7448', 2),
(83, '310-2380', 2),
(84, '550-0652', 1),
(85, '759-321-9855', 2),
(86, '447-195-3710', 1),
(87, '103-9253', 2),
(88, '807-794-0055', 2),
(89, '711-4327', 1),
(90, '337-5176', 2),
(91, '886-3475', 2),
(92, '984-8961', 1),
(93, '312-531-5245', 2),
(94, '388-8277', 2),
(95, '431-130-0793', 2),
(96, '846-6895', 1),
(97, '618-427-5432', 2),
(98, '651-6902', 2),
(99, '632-3366', 2),
(100, '521-419-9930', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tg_registro_usuarios`
--

CREATE TABLE `tg_registro_usuarios` (
  `fecha_registro` date DEFAULT NULL,
  `hora_registro` time DEFAULT NULL,
  `id_nuevo_usuario` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_aplazamiento`
--

CREATE TABLE `tipo_aplazamiento` (
  `id_tipo` int(11) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_aplazamiento`
--

INSERT INTO `tipo_aplazamiento` (`id_tipo`, `tipo`) VALUES
(1, 'Vacaciones'),
(2, 'Motivo personal'),
(3, 'Motivo medico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_servicio`
--

CREATE TABLE `tipo_servicio` (
  `idtipo_servicio` int(11) NOT NULL,
  `tipo_servicio` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_servicio`
--

INSERT INTO `tipo_servicio` (`idtipo_servicio`, `tipo_servicio`) VALUES
(1, 'Programa Prenatal'),
(2, 'Programa Posnatal'),
(3, 'Club bebé');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_telefono`
--

CREATE TABLE `tipo_telefono` (
  `idtipo_telefono` int(11) NOT NULL,
  `tipo` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_telefono`
--

INSERT INTO `tipo_telefono` (`idtipo_telefono`, `tipo`) VALUES
(1, 'Fijo'),
(2, 'Celular');

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
  `id_estados` int(11) DEFAULT '3',
  `fecha_registro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`cedula`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `fechaNaci`, `clave`, `imegen_perfil`, `id_estados`, `fecha_registro`) VALUES
(1031174466, 'Rub', 'Lorena', 'Maella ', 'Parra', '1995-06-21', '1031174466', NULL, 1, '0000-00-00'),
(1600032140599, 'Gretchen', 'Janna', 'Mccray', 'Evans', '1998-02-26', 'UWD99TPB6PM', 0x50656e617469627573204574204c4c43, 1, '0000-00-00'),
(1600072330999, 'Ariel', 'Ashely', 'Benton', 'Ramirez', '1996-09-20', 'XXI49MEC5JL', 0x4e6f6e204e6973692041656e65616e20436f6e73756c74696e67, 1, '0000-00-00'),
(1600112313399, 'Quyn', 'Rebecca', 'Ortiz', 'Stewart', '1995-04-27', 'EMS11CWJ1IY', 0x41656e65616e20536564204c4c43, 1, '0000-00-00'),
(1602081548099, 'Denise', 'Patience', 'Atkins', 'Dominguez', '1993-04-29', 'EOF50SRS7DA', 0x4f64696f20536167697474697320436f72702e, 1, '0000-00-00'),
(1602120920199, 'Kylee', 'Hanna', 'Diaz', 'Wallace', '1999-08-30', 'VWV85GCH0MR', 0x566976616d757320436f6e73756c74696e67, 1, '0000-00-00'),
(1603010433999, 'Abra', 'Zena', 'Stout', 'Deleon', '1992-05-08', 'LCA51OMK3KU', 0x5065646520457420526973757320496e73746974757465, 1, '0000-00-00'),
(1605052037499, 'Iliana', 'Rosalyn', 'Delaney', 'Fleming', '1996-01-27', 'XUP91ZXY1FP', 0x497073756d20436f72706f726174696f6e, 1, '0000-00-00'),
(1606072561599, 'Kalia', 'Zoe', 'Everett', 'King', '1995-10-12', 'FIB03HOQ6ZU', 0x446f6c6f72205175697371756520466f756e646174696f6e, 1, '0000-00-00'),
(1607032664899, 'Chantale', 'Diana', 'Melton', 'Lindsay', '1994-03-11', 'IYF43GUJ4RN', 0x4e756c6c61204575204e6571756520496e632e, 1, '0000-00-00'),
(1608021707799, 'Denise', 'Veronica', 'Giles', 'Howell', '1996-10-27', 'ZZQ75FLZ6JN', 0x466163696c69736973204d61676e61204c4c50, 1, '0000-00-00'),
(1609080393299, 'Brenda', 'Michelle', 'Joyner', 'Stone', '1990-06-24', 'PDE34ARW3GD', 0x446f6e656320436f6e73756c74696e67, 1, '0000-00-00'),
(1610122573899, 'Serena', 'Unity', 'Beard', 'David', '1994-04-09', 'SKM13NKJ5EM', 0x5065646520436f6e73756c74696e67, 1, '0000-00-00'),
(1611012149999, 'Kessie', 'Hedda', 'Robertson', 'Pace', '1995-11-08', 'ZXO52JNG4PV', 0x4575204e6571756520466f756e646174696f6e, 1, '0000-00-00'),
(1616110563599, 'Daphne', 'Ava', 'Johnson', 'Walls', '1992-07-11', 'VFS24TEL8MC', 0x54726973746971756520436f6d70616e79, 1, '0000-00-00'),
(1617070797699, 'Madison', 'Sarah', 'Beach', 'Walls', '1991-01-19', 'UVO65FSC9UC', 0x4e69736c20436f72702e, 1, '0000-00-00'),
(1619012900899, 'Lenore', 'Iliana', 'Kirkland', 'Rodgers', '1995-11-22', 'IGW59YND0FH', 0x4120556c7472696369657320496e632e, 1, '0000-00-00'),
(1620021257999, 'Minerva', 'Holly', 'Patton', 'Levine', '1998-07-20', 'YVQ34QPD3DX', 0x4d6f6c6c697320436f6d70616e79, 1, '0000-00-00'),
(1620070122399, 'Dominique', 'Aphrodite', 'Perez', 'Bell', '1998-08-07', 'DHO55EBJ4YS', 0x456c656966656e64204567657374617320496e73746974757465, 1, '0000-00-00'),
(1624070236699, 'Evelyn', 'Lisandra', 'Moon', 'Mckay', '1991-09-10', 'JJW57UII7TG', 0x416d657420526973757320446f6e6563204c696d69746564, 1, '0000-00-00'),
(1625122186199, 'Aubrey', 'Virginia', 'Deleon', 'Mason', '1996-11-25', 'NNR25LDT3TT', 0x436f6e64696d656e74756d205043, 1, '0000-00-00'),
(1626052311299, 'Mona', 'TaShya', 'Wooten', 'Clements', '1998-06-02', 'JYB07IFL6HJ', 0x446f6e6563204c756374757320496e73746974757465, 1, '0000-00-00'),
(1628112079399, 'Rebekah', 'Isadora', 'Mann', 'Abbott', '1995-04-24', 'ZSD58LJR0RU', 0x417567756520506f72747469746f7220496e74657264756d20436f72702e, 1, '0000-00-00'),
(1631030680699, 'Lesley', 'Kylee', 'Clark', 'Acevedo', '1997-08-26', 'WTH59JBK4CM', 0x4e6f6e204e69736920496e73746974757465, 1, '0000-00-00'),
(1632031299399, 'Illiana', 'Eve', 'Martin', 'Swanson', '1996-03-27', 'TZH91FRD5RI', 0x4665726d656e74756d204172637520566573746962756c756d20496e636f72706f7261746564, 1, '0000-00-00'),
(1633070177799, 'Brenna', 'Autumn', 'Harper', 'Charles', '1996-07-01', 'SWP76UXG9XM', 0x43757273757320496e6475737472696573, 1, '0000-00-00'),
(1634011459899, 'Avye', 'Kaye', 'Frank', 'Church', '1998-07-12', 'LEM36UNR9QG', 0x496163756c697320416c6971756574204469616d20436f72702e, 1, '0000-00-00'),
(1635010473799, 'Melissa', 'Erin', 'Austin', 'Guy', '1992-12-07', 'RUB10ZLJ7CE', 0x4665726d656e74756d204c696d69746564, 1, '0000-00-00'),
(1635050159199, 'Guinevere', 'Vanna', 'Mckinney', 'Morton', '1994-10-17', 'BYO82RUL7AN', 0x4e756c6c616d2056656c697420436f6d70616e79, 1, '0000-00-00'),
(1635081917699, 'MacKenzie', 'Desirae', 'Rojas', 'Salas', '1999-02-01', 'TOD90NVJ1OX', 0x536f63696973204e61746f71756520436f6e73756c74696e67, 1, '0000-00-00'),
(1636110154999, 'Clio', 'Sierra', 'Winters', 'Zimmerman', '1993-10-03', 'UPE65RTB1GG', 0x416320436f72702e, 1, '0000-00-00'),
(1638021692099, 'Judith', 'Lysandra', 'Rodriquez', 'Mcdowell', '1999-07-24', 'GIB10SSR9PH', 0x4f72636920436f72702e, 1, '0000-00-00'),
(1638072795999, 'Regan', 'Lael', 'Coffey', 'Mcdaniel', '1999-03-28', 'BCS05BRE6NK', 0x45726174204e65717565204e6f6e20466f756e646174696f6e, 1, '0000-00-00'),
(1640062455699, 'Regina', 'Leandra', 'Carrillo', 'Lott', '1993-05-21', 'JWB65PAS4MN', 0x436f6e736563746574756572204d617572697320496420436f72706f726174696f6e, 1, '0000-00-00'),
(1643051588399, 'Hanna', 'Oprah', 'Nieves', 'Collins', '1993-10-04', 'KVA93YSY7UH', 0x4172637520436f6d70616e79, 1, '0000-00-00'),
(1643062018899, 'Zephr', 'Charlotte', 'Torres', 'Pennington', '1993-01-26', 'RHD05REW2SV', 0x496e746567657220496e20496e6475737472696573, 1, '0000-00-00'),
(1644032003999, 'Kylee', 'Giselle', 'Franco', 'Rodriquez', '1996-04-21', 'PJO11PZK8GC', 0x50686172657472612046656c69732045676574204c4c43, 1, '0000-00-00'),
(1644050781999, 'Leah', 'Adara', 'Blackburn', 'Mcdonald', '1990-09-22', 'NBK75FSV4WU', 0x4c696265726f20436f72706f726174696f6e, 1, '0000-00-00'),
(1644071024399, 'Kathleen', 'April', 'Wilkins', 'Singleton', '1993-02-12', 'WEI55QMB1OO', 0x496e746567657220496e204c7464, 1, '0000-00-00'),
(1644110404799, 'Xyla', 'Ivory', 'Arnold', 'Barnes', '1991-12-11', 'SNX46OLI6TA', 0x447569204e65632054656d70757320436f6d70616e79, 1, '0000-00-00'),
(1646012369599, 'Uta', 'Denise', 'Guthrie', 'Burnett', '1996-06-27', 'PPA99HZW3IY', 0x496d70657264696574204e6f6e20566573746962756c756d20436f6d70616e79, 1, '0000-00-00'),
(1646061457799, 'Hollee', 'MacKensie', 'Whitney', 'Woods', '1993-04-04', 'BQJ80DUI4RZ', 0x4567657420566f6c757470617420466f756e646174696f6e, 1, '0000-00-00'),
(1646062955099, 'Quincy', 'Inga', 'Britt', 'Drake', '1999-08-01', 'MBN38DZU8JS', 0x416363756d73616e2053656420466163696c69736973204173736f636961746573, 1, '0000-00-00'),
(1647062147599, 'Maggie', 'Natalie', 'Booth', 'Berry', '1997-10-08', 'VXY08KCW7UY', 0x5175616d204c7464, 1, '0000-00-00'),
(1647072657899, 'Raya', 'Kessie', 'Hines', 'Hull', '1996-02-18', 'ZRX71GTH6BK', 0x53656d20566974616520416c697175616d20436f6d70616e79, 1, '0000-00-00'),
(1647082077799, 'Sydney', 'Alexandra', 'Black', 'Combs', '1993-09-17', 'NKK14IJB2JK', 0x50657220496e636570746f732048796d656e61656f73205043, 1, '0000-00-00'),
(1647112505399, 'Basia', 'Myra', 'Davenport', 'Hernandez', '1998-04-06', 'KQX27EPY8WB', 0x517569732054726973746971756520416320496e636f72706f7261746564, 1, '0000-00-00'),
(1648031209799, 'Ursula', 'Charde', 'Huff', 'Glover', '1993-08-02', 'IRY28WPZ7LU', 0x4174205043, 1, '0000-00-00'),
(1649020833299, 'Blossom', 'Melissa', 'May', 'Koch', '1992-11-27', 'AEX89MVL0RS', 0x4d6f6c6573746965204173736f636961746573, 1, '0000-00-00'),
(1649051323699, 'Chelsea', 'Brianna', 'Paul', 'Bowen', '1990-07-14', 'DUJ31IEU5PN', 0x5269737573204e756e6320436f72706f726174696f6e, 1, '0000-00-00'),
(1650043095299, 'Kylee', 'Nerea', 'Rosa', 'Sosa', '1991-10-24', 'CWY43EHD1EF', 0x4e6563204f72636920446f6e656320436f6d70616e79, 1, '0000-00-00'),
(1652011895499, 'Gail', 'Robin', 'Ratliff', 'Stout', '1994-11-13', 'WPM35ENA5AI', 0x4163204d6920456c656966656e64204c4c43, 1, '0000-00-00'),
(1652102652399, 'Hedy', 'Anjolie', 'Morton', 'Wright', '1998-10-03', 'USL04XQP9US', 0x4d6f7262692054726973746971756520496e636f72706f7261746564, 1, '0000-00-00'),
(1653031551999, 'Fallon', 'Sloane', 'Henson', 'Calhoun', '1997-03-03', 'HBM34OZK3SK', 0x4d6574757320416c697175616d2045726174204173736f636961746573, 1, '0000-00-00'),
(1653062792899, 'Caryn', 'Julie', 'Bernard', 'Church', '1995-02-18', 'ZZG23AXP8PK', 0x437572737573204e756e6320496e6475737472696573, 1, '0000-00-00'),
(1654041580999, 'Hadley', 'Aurora', 'Collier', 'Salas', '1995-04-29', 'RML62KST6DT', 0x54656d706f7220496e6475737472696573, 1, '0000-00-00'),
(1654051030299, 'Keelie', 'Miriam', 'Crawford', 'Malone', '1998-11-23', 'WWW70XJK6CH', 0x46656c697320507572757320496e632e, 1, '0000-00-00'),
(1654082011399, 'Alexis', 'Kameko', 'Chen', 'Ball', '1995-01-23', 'OUX14VXK8NB', 0x4e6f6e204c756374757320536974204173736f636961746573, 1, '0000-00-00'),
(1654082763799, 'Fallon', 'Winifred', 'Mays', 'Reed', '1997-12-13', 'ELI39KIT0NF', 0x45726174204567657420497073756d204c4c50, 1, '0000-00-00'),
(1657072660599, 'Jillian', 'Zoe', 'Beard', 'Arnold', '1993-06-17', 'TBE13OKD0ID', 0x4c6163696e696120417420436f72706f726174696f6e, 1, '0000-00-00'),
(1657081443599, 'Fiona', 'Karyn', 'Mccall', 'Jordan', '1994-05-15', 'SYU89EDU0MH', 0x477261766964612053616769747469732044756973204c696d69746564, 1, '0000-00-00'),
(1658051745199, 'Joan', 'Lana', 'Blake', 'Velez', '1996-10-05', 'YPP87ADH1MO', 0x506c61636572617420436f6e73756c74696e67, 1, '0000-00-00'),
(1658081702699, 'Teegan', 'Dakota', 'Britt', 'Wynn', '1991-05-05', 'QOT02BFW8GS', 0x446f6c6f7220456765737461732052686f6e637573204c4c43, 1, '0000-00-00'),
(1659020657099, 'Ina', 'Halla', 'Goodman', 'Stanton', '1999-12-09', 'CWS57LYT5DQ', 0x56697461652056656c69742045676573746173204c7464, 1, '0000-00-00'),
(1660090704299, 'Pascale', 'Noelle', 'Brooks', 'Munoz', '1993-12-31', 'KWB85XXH4XA', 0x4d61676e61204e6563205175616d20466f756e646174696f6e, 1, '0000-00-00'),
(1661021815699, 'Alyssa', 'Ina', 'Ford', 'Oneil', '1997-01-14', 'GNK87TXV5GR', 0x456e696d20477261766964612053697420436f6d70616e79, 1, '0000-00-00'),
(1661041780599, 'Ruth', 'Farrah', 'Kennedy', 'Whitaker', '1992-03-27', 'PBF35XJM6SQ', 0x4c756374757320436f6d70616e79, 1, '0000-00-00'),
(1662071657499, 'Xena', 'Keely', 'Hahn', 'Santiago', '1998-04-01', 'SFT12ZVC4ZL', 0x53757370656e646973736520547269737469717565204e65717565204c696d69746564, 1, '0000-00-00'),
(1662072498799, 'Naomi', 'Caryn', 'Wilder', 'Oneil', '1992-09-21', 'REC97RDH1KB', 0x4469676e697373696d2054656d706f72204172637520436f72706f726174696f6e, 1, '0000-00-00'),
(1663072618599, 'Vivian', 'Lael', 'Higgins', 'Duke', '1995-02-16', 'BMI30DUM3JQ', 0x53697420436f72702e, 1, '0000-00-00'),
(1664050261499, 'Tana', 'Rowan', 'Goodwin', 'Park', '1993-02-15', 'WUG43NDO2RM', 0x4e756e6320496e6475737472696573, 1, '0000-00-00'),
(1666082568399, 'Eden', 'Neve', 'Vang', 'Palmer', '1995-06-03', 'NWX40WZR1PN', 0x54696e636964756e7420436f6d70616e79, 1, '0000-00-00'),
(1667091232899, 'Taylor', 'Mallory', 'Ferrell', 'Chase', '1999-03-17', 'OIE22AVX5HM', 0x52686f6e637573204173736f636961746573, 1, '0000-00-00'),
(1667113047799, 'Nevada', 'Ayanna', 'Molina', 'Oneill', '1999-03-19', 'TLO65IOK3YU', 0x45726174204e6f6e756d6d7920556c74726963696573204c7464, 1, '0000-00-00'),
(1667122476399, 'Darrel', 'Lillian', 'Woods', 'Santiago', '1994-05-06', 'VDJ28CPK9YG', 0x53697420436f72702e, 1, '0000-00-00'),
(1669040800199, 'Breanna', 'Stephanie', 'Hopkins', 'Anthony', '1993-06-11', 'LGZ28ITK9RP', 0x5665686963756c6120466f756e646174696f6e, 1, '0000-00-00'),
(1670091641899, 'Brielle', 'Ulla', 'Cain', 'Barker', '1993-03-23', 'XGU04SUJ1WN', 0x496d706572646965742045726174204e6f6e756d6d79204c7464, 1, '0000-00-00'),
(1670111517699, 'Melissa', 'Lysandra', 'Whitehead', 'Lang', '1993-05-04', 'CSV62EBU6OW', 0x526973757320496e6475737472696573, 1, '0000-00-00'),
(1671032851499, 'Pearl', 'Neve', 'Beach', 'Fry', '1993-07-01', 'CGO12LEF0LR', 0x4661756369627573204c7464, 1, '0000-00-00'),
(1673052776899, 'Cara', 'Sandra', 'Talley', 'Fox', '1998-07-21', 'SLM50DRB5QH', 0x416c6971756574204c696265726f20496e6475737472696573, 1, '0000-00-00'),
(1674022095199, 'Yetta', 'Maya', 'Justice', 'Hudson', '1994-09-17', 'RFX92BJH2MJ', 0x54656c6c757320496e636f72706f7261746564, 1, '0000-00-00'),
(1676061980799, 'Stella', 'Unity', 'Bray', 'Macias', '1991-09-27', 'LSI23WRQ9ND', 0x4d69204c6f72656d20436f72706f726174696f6e, 1, '0000-00-00'),
(1677080338899, 'Jescie', 'Kelsie', 'Robbins', 'Gilmore', '1999-10-16', 'YXY91CPX8RI', 0x4e756c6c6120496e74656765722056756c70757461746520496e73746974757465, 1, '0000-00-00'),
(1678040526099, 'Cherokee', 'Jayme', 'Carr', 'Burks', '1992-11-07', 'KCZ37JQU2KP', 0x456c69742050656c6c656e74657371756520496e636f72706f7261746564, 1, '0000-00-00'),
(1679100511999, 'Tatum', 'Roanna', 'Woodard', 'Benton', '1994-12-29', 'IGA13PQS1LM', 0x4d61737361204173736f636961746573, 1, '0000-00-00'),
(1680011953799, 'Serena', 'Amethyst', 'Dillard', 'Ferrell', '1994-03-25', 'DHC18ZUC9VW', 0x45742041726375204173736f636961746573, 1, '0000-00-00'),
(1683082403599, 'Deirdre', 'Ora', 'Holmes', 'Conway', '1994-08-25', 'QLI99DKG8AL', 0x56656c2054757270697320436f72702e, 1, '0000-00-00'),
(1684020282399, 'Xandra', 'Zenaida', 'Romero', 'Stout', '1995-12-25', 'UQT54IPK0DO', 0x45726174204567657420497073756d204c696d69746564, 1, '0000-00-00'),
(1685030614099, 'Leslie', 'Kai', 'Donovan', 'Horne', '1993-05-13', 'UGL16RNM8AV', 0x4d617373612053757370656e646973736520496e632e, 1, '0000-00-00'),
(1687071412899, 'Kiayada', 'Gail', 'Decker', 'Powell', '1999-01-10', 'ALW37ZJN8BF', 0x4e6962682056756c707574617465204d617572697320436f72706f726174696f6e, 1, '0000-00-00'),
(1688012500799, 'Clementine', 'Brianna', 'Wyatt', 'Harmon', '1999-12-07', 'CNH03RXD6FO', 0x4e6563204c656f20436f72706f726174696f6e, 1, '0000-00-00'),
(1691102489599, 'Maya', 'Whilemina', 'Terry', 'Garrison', '1993-12-12', 'GEO35EVP2ST', 0x50686173656c6c757320446f6c6f7220496e6475737472696573, 1, '0000-00-00'),
(1692061225799, 'Nola', 'Brooke', 'Barber', 'Morin', '1993-05-07', 'OUV44JOV2QH', 0x457469616d204c696d69746564, 1, '0000-00-00'),
(1692111185099, 'Rhiannon', 'Amy', 'Schultz', 'Herring', '1997-11-09', 'SYG83PYH0GV', 0x4567657420566f6c7574706174204f726e61726520436f72706f726174696f6e, 1, '0000-00-00'),
(1693011923799, 'Alfreda', 'Renee', 'Levy', 'Fields', '1995-02-15', 'WKP94LZI1AB', 0x526973757320446f6e656320466f756e646174696f6e, 1, '0000-00-00'),
(1693020964499, 'Jaquelyn', 'Naida', 'Hickman', 'Leblanc', '1991-04-29', 'LWY38GTS4XI', 0x456765737461732044756973204163205043, 1, '0000-00-00'),
(1693063060799, 'Sierra', 'Whitney', 'Gardner', 'Mcgowan', '1995-10-15', 'DRO63IKX0JU', 0x52757472756d20496e6475737472696573, 1, '0000-00-00'),
(1694111915199, 'Suki', 'Jescie', 'Thompson', 'Cantu', '1996-07-10', 'AUI82JKC4FO', 0x416d65742044617069627573204964205043, 1, '0000-00-00'),
(1697052772099, 'Heidi', 'Kalia', 'Hester', 'Robles', '1994-04-25', 'HVJ43RVY4OE', 0x4c756374757320437572616269747572204c7464, 1, '0000-00-00'),
(1698082293299, 'Meghan', 'Susan', 'Cox', 'Morgan', '1997-08-31', 'TBN93DAI2KR', 0x517569737175652056617269757320436f6e73756c74696e67, 1, '0000-00-00'),
(1698113071199, 'Melinda', 'Melyssa', 'Morgan', 'Kelly', '1999-08-06', 'IVT01RVV5AB', 0x4475697320566f6c7574706174204e756e6320496e73746974757465, 1, '0000-00-00');

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

--
-- Volcado de datos para la tabla `usuarios_has_direcciones`
--

INSERT INTO `usuarios_has_direcciones` (`id_direccion`, `usuarios_cedula`, `direcciones_iddirecciones`, `vive_aqui`) VALUES
(1, 1031174466, 1, 1),
(2, 1600032140599, 2, 1),
(3, 1600072330999, 3, 1),
(4, 1600112313399, 4, 1),
(5, 1602081548099, 5, 1),
(6, 1602120920199, 6, 1),
(7, 1603010433999, 7, 1),
(8, 1605052037499, 8, 1),
(9, 1606072561599, 9, 1),
(10, 1607032664899, 10, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_has_telefonos`
--

CREATE TABLE `usuarios_has_telefonos` (
  `usuarios_cedula` bigint(20) NOT NULL,
  `telefonos_id_telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios_has_telefonos`
--

INSERT INTO `usuarios_has_telefonos` (`usuarios_cedula`, `telefonos_id_telefono`) VALUES
(1031174466, 1),
(1600032140599, 2),
(1600072330999, 3),
(1600112313399, 4),
(1602081548099, 5),
(1602120920199, 6),
(1603010433999, 7),
(1605052037499, 8),
(1606072561599, 9),
(1607032664899, 10);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD PRIMARY KEY (`idadtividad`),
  ADD KEY `fk_clases_rutinas1_idx` (`idRutinas`);

--
-- Indices de la tabla `aplazamientos`
--
ALTER TABLE `aplazamientos`
  ADD PRIMARY KEY (`idaplazamiento`),
  ADD KEY `FKClientesAplazamientos_idx` (`idcliente`),
  ADD KEY `fk_aplazamiento_tipo_aplazamiento` (`id_tipo_aplazamiento`);

--
-- Indices de la tabla `cita_medica`
--
ALTER TABLE `cita_medica`
  ADD PRIMARY KEY (`idcita_medica`),
  ADD KEY `fk_cita_medica_consultorios1_idx` (`consultorios_idconsultorio`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idClientes`),
  ADD KEY `fk_ClientesEmpresa_idx` (`idEmpresa`);

--
-- Indices de la tabla `consultorios`
--
ALTER TABLE `consultorios`
  ADD PRIMARY KEY (`idconsultorio`);

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
  ADD KEY `fk_inscripciones_servicios1_idx` (`id_servicio`);

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
  ADD PRIMARY KEY (`idprograma`);

--
-- Indices de la tabla `programas_has_clases`
--
ALTER TABLE `programas_has_clases`
  ADD PRIMARY KEY (`idprograma`,`idactividad`),
  ADD KEY `fk_programas_has_clases_clases1_idx` (`idactividad`),
  ADD KEY `fk_programas_has_clases_programas1_idx` (`idprograma`);

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
-- Indices de la tabla `salones`
--
ALTER TABLE `salones`
  ADD PRIMARY KEY (`id_salones`),
  ADD KEY `fk_salones_clases1_idx` (`actividad`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`idServicio`),
  ADD KEY `fk_servicios_tipo_servicio1_idx` (`tipo_servicio_idtipo_servicio`);

--
-- Indices de la tabla `sesiones`
--
ALTER TABLE `sesiones`
  ADD PRIMARY KEY (`idSesiones`,`fecha`),
  ADD KEY `FKPersonalSesiones` (`idPersonalMedico`),
  ADD KEY `fk_sesiones_inscripciones1_idx` (`inscripciones_idInscripciones`);

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
-- Indices de la tabla `tipo_servicio`
--
ALTER TABLE `tipo_servicio`
  ADD PRIMARY KEY (`idtipo_servicio`);

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
  MODIFY `id_correo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id_estados` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `localidades`
--
ALTER TABLE `localidades`
  MODIFY `id_localidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT de la tabla `sesiones`
--
ALTER TABLE `sesiones`
  MODIFY `idSesiones` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Este campo es la clave primaria de la tabla y  almacena el (id) ', AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `tg_roles_usuarios_after_update`
--
ALTER TABLE `tg_roles_usuarios_after_update`
  MODIFY `id_actualizacion_rol` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `usuarios_has_direcciones`
--
ALTER TABLE `usuarios_has_direcciones`
  MODIFY `id_direccion` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD CONSTRAINT `fk_clases_rutinas1` FOREIGN KEY (`idRutinas`) REFERENCES `rutinas` (`idRutinas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_clases_servicios1` FOREIGN KEY (`idadtividad`) REFERENCES `servicios` (`idServicio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `aplazamientos`
--
ALTER TABLE `aplazamientos`
  ADD CONSTRAINT `FKClientesAplazamientos` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idClientes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_aplazamiento_tipo_aplazamiento` FOREIGN KEY (`id_tipo_aplazamiento`) REFERENCES `tipo_aplazamiento` (`id_tipo`);

--
-- Filtros para la tabla `cita_medica`
--
ALTER TABLE `cita_medica`
  ADD CONSTRAINT `fk_cita_medica_consultorios1` FOREIGN KEY (`consultorios_idconsultorio`) REFERENCES `consultorios` (`idconsultorio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cita_medica_servicios1` FOREIGN KEY (`idcita_medica`) REFERENCES `servicios` (`idServicio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `fk_InscripcionesCliente` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idClientes`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_inscripciones_servicios1` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`idServicio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `fk_programas_servicios1` FOREIGN KEY (`idprograma`) REFERENCES `servicios` (`idServicio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `programas_has_clases`
--
ALTER TABLE `programas_has_clases`
  ADD CONSTRAINT `fk_programas_has_clases_clases1` FOREIGN KEY (`idactividad`) REFERENCES `actividades` (`idadtividad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_programas_has_clases_programas1` FOREIGN KEY (`idprograma`) REFERENCES `programas` (`idprograma`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `rolesusuarios`
--
ALTER TABLE `rolesusuarios`
  ADD CONSTRAINT `fK_RolesUsuarios` FOREIGN KEY (`idRoles`) REFERENCES `roles` (`idRoles`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_UsuariosRoles` FOREIGN KEY (`idUsuarios`) REFERENCES `usuarios` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `salones`
--
ALTER TABLE `salones`
  ADD CONSTRAINT `fk_salones_clases1` FOREIGN KEY (`actividad`) REFERENCES `actividades` (`idadtividad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `fk_servicios_tipo_servicio1` FOREIGN KEY (`tipo_servicio_idtipo_servicio`) REFERENCES `tipo_servicio` (`idtipo_servicio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sesiones`
--
ALTER TABLE `sesiones`
  ADD CONSTRAINT `FKPersonalSesiones` FOREIGN KEY (`idPersonalMedico`) REFERENCES `personalmedico` (`idPersonalMedico`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sesiones_inscripciones1` FOREIGN KEY (`inscripciones_idInscripciones`) REFERENCES `inscripciones` (`idInscripciones`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
