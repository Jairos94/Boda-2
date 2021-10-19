-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-10-2021 a las 08:12:12
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `evento`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `confirmacion`
--

CREATE TABLE `confirmacion` (
  `cfrId` int(11) NOT NULL,
  `cfrDescripcion` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `confirmacion`
--

INSERT INTO `confirmacion` (`cfrId`, `cfrDescripcion`) VALUES
(1, 'Se asistirá al evento'),
(2, 'No se asistirá'),
(3, 'Invitado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `efectivo`
--

CREATE TABLE `efectivo` (
  `efID` int(11) NOT NULL,
  `efDescrición` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `efectivo`
--

INSERT INTO `efectivo` (`efID`, `efDescrición`) VALUES
(1, 'Si'),
(2, 'No');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatusregalo`
--

CREATE TABLE `estatusregalo` (
  `ettrId` int(11) NOT NULL,
  `ettrDescripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estatusregalo`
--

INSERT INTO `estatusregalo` (`ettrId`, `ettrDescripcion`) VALUES
(1, 'Disponible'),
(2, 'Ocupado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `evnId` int(11) NOT NULL,
  `evnFecha` date NOT NULL,
  `evnCapacidadInvitados` int(11) NOT NULL,
  `evnTipoEvento` int(11) NOT NULL,
  `evnNumLista` int(11) NOT NULL,
  `evnDescripcion` varchar(250) NOT NULL,
  `evnUbicacion` varchar(300) DEFAULT NULL,
  `evrHoraInicio` time NOT NULL,
  `evrHoraFinal` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`evnId`, `evnFecha`, `evnCapacidadInvitados`, `evnTipoEvento`, `evnNumLista`, `evnDescripcion`, `evnUbicacion`, `evrHoraInicio`, `evrHoraFinal`) VALUES
(1, '2021-12-05', 40, 1, 1, 'Boda de Jairo y Regina', 'https://goo.gl/maps/uH6T8BeeeEkuG1Q99', '14:00:00', '18:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listaorganizadores`
--

CREATE TABLE `listaorganizadores` (
  `ldsoID` int(11) NOT NULL,
  `ldsoEvento` int(11) NOT NULL,
  `ldsoPersona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `listaorganizadores`
--

INSERT INTO `listaorganizadores` (`ldsoID`, `ldsoEvento`, `ldsoPersona`) VALUES
(1, 1, 1),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listapersonas`
--

CREATE TABLE `listapersonas` (
  `lspId` int(11) NOT NULL,
  `lspPersona` int(11) NOT NULL,
  `lpsEventp` int(11) NOT NULL,
  `lpsConfirmacion` int(11) DEFAULT NULL,
  `lspEfectivo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `listapersonas`
--

INSERT INTO `listapersonas` (`lspId`, `lspPersona`, `lpsEventp`, `lpsConfirmacion`, `lspEfectivo`) VALUES
(1, 3, 1, 1, 1),
(2, 6, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listaregalos`
--

CREATE TABLE `listaregalos` (
  `lsrID` int(11) NOT NULL,
  `lsrNumLista` int(11) NOT NULL,
  `lsrRegalo` int(11) NOT NULL,
  `lsrEstado` int(11) NOT NULL,
  `lsrListaPersonas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `listaregalos`
--

INSERT INTO `listaregalos` (`lsrID`, `lsrNumLista`, `lsrRegalo`, `lsrEstado`, `lsrListaPersonas`) VALUES
(1, 1, 1, 2, 1),
(2, 1, 2, 1, NULL),
(3, 1, 3, 1, NULL),
(4, 1, 4, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `numlista`
--

CREATE TABLE `numlista` (
  `lsnID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `numlista`
--

INSERT INTO `numlista` (`lsnID`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `psrId` int(11) NOT NULL,
  `psrNombre` varchar(50) DEFAULT NULL,
  `psrApellido1` varchar(50) DEFAULT NULL,
  `psrApellido2` varchar(50) DEFAULT NULL,
  `psrTelNum` varchar(15) NOT NULL,
  `psrEmail` varchar(50) DEFAULT NULL,
  `psrPass` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`psrId`, `psrNombre`, `psrApellido1`, `psrApellido2`, `psrTelNum`, `psrEmail`, `psrPass`) VALUES
(1, 'Jairo', 'Rivera', 'Céspedes', '60047416', 'jairo.ri.ce@gmail.com', 'boda123'),
(2, 'Regina', 'Palma', 'Sirias', '62320564', 'boda@boda', 'boda123'),
(3, 'Andres', 'Rivera', 'Céspedes', '87870743', NULL, NULL),
(6, 'Ruth', 'Céspedes', 'Ordeñana', '87172648', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regalos`
--

CREATE TABLE `regalos` (
  `rglId` int(11) NOT NULL,
  `rglDescripcion` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `regalos`
--

INSERT INTO `regalos` (`rglId`, `rglDescripcion`) VALUES
(1, 'Licuadora'),
(2, 'Ollas'),
(3, 'Efectivo'),
(4, 'Vasos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoevento`
--

CREATE TABLE `tipoevento` (
  `tpeId` int(11) NOT NULL,
  `tpeDescripcion` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipoevento`
--

INSERT INTO `tipoevento` (`tpeId`, `tpeDescripcion`) VALUES
(1, 'Boda');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `confirmacion`
--
ALTER TABLE `confirmacion`
  ADD PRIMARY KEY (`cfrId`);

--
-- Indices de la tabla `efectivo`
--
ALTER TABLE `efectivo`
  ADD PRIMARY KEY (`efID`);

--
-- Indices de la tabla `estatusregalo`
--
ALTER TABLE `estatusregalo`
  ADD PRIMARY KEY (`ettrId`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`evnId`),
  ADD KEY `evnTipoEvento` (`evnTipoEvento`),
  ADD KEY `evnNumLista` (`evnNumLista`);

--
-- Indices de la tabla `listaorganizadores`
--
ALTER TABLE `listaorganizadores`
  ADD PRIMARY KEY (`ldsoID`),
  ADD KEY `ldsoEvento` (`ldsoEvento`),
  ADD KEY `ldsoPersona` (`ldsoPersona`);

--
-- Indices de la tabla `listapersonas`
--
ALTER TABLE `listapersonas`
  ADD PRIMARY KEY (`lspId`),
  ADD KEY `lspPersona` (`lspPersona`),
  ADD KEY `lpsEventp` (`lpsEventp`),
  ADD KEY `lpsConfirmacion` (`lpsConfirmacion`),
  ADD KEY `lspEfectivo` (`lspEfectivo`);

--
-- Indices de la tabla `listaregalos`
--
ALTER TABLE `listaregalos`
  ADD PRIMARY KEY (`lsrID`),
  ADD KEY `lsrNumLista` (`lsrNumLista`),
  ADD KEY `lsrRegalo` (`lsrRegalo`),
  ADD KEY `lsrEstado` (`lsrEstado`),
  ADD KEY `lsrListaPersonas` (`lsrListaPersonas`);

--
-- Indices de la tabla `numlista`
--
ALTER TABLE `numlista`
  ADD PRIMARY KEY (`lsnID`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`psrId`);

--
-- Indices de la tabla `regalos`
--
ALTER TABLE `regalos`
  ADD PRIMARY KEY (`rglId`);

--
-- Indices de la tabla `tipoevento`
--
ALTER TABLE `tipoevento`
  ADD PRIMARY KEY (`tpeId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `confirmacion`
--
ALTER TABLE `confirmacion`
  MODIFY `cfrId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `efectivo`
--
ALTER TABLE `efectivo`
  MODIFY `efID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estatusregalo`
--
ALTER TABLE `estatusregalo`
  MODIFY `ettrId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `evnId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `listaorganizadores`
--
ALTER TABLE `listaorganizadores`
  MODIFY `ldsoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `listapersonas`
--
ALTER TABLE `listapersonas`
  MODIFY `lspId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `listaregalos`
--
ALTER TABLE `listaregalos`
  MODIFY `lsrID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `numlista`
--
ALTER TABLE `numlista`
  MODIFY `lsnID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `psrId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `regalos`
--
ALTER TABLE `regalos`
  MODIFY `rglId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipoevento`
--
ALTER TABLE `tipoevento`
  MODIFY `tpeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`evnTipoEvento`) REFERENCES `tipoevento` (`tpeId`),
  ADD CONSTRAINT `evento_ibfk_2` FOREIGN KEY (`evnNumLista`) REFERENCES `numlista` (`lsnID`);

--
-- Filtros para la tabla `listaorganizadores`
--
ALTER TABLE `listaorganizadores`
  ADD CONSTRAINT `listaorganizadores_ibfk_1` FOREIGN KEY (`ldsoEvento`) REFERENCES `evento` (`evnId`),
  ADD CONSTRAINT `listaorganizadores_ibfk_2` FOREIGN KEY (`ldsoPersona`) REFERENCES `persona` (`psrId`);

--
-- Filtros para la tabla `listapersonas`
--
ALTER TABLE `listapersonas`
  ADD CONSTRAINT `listapersonas_ibfk_1` FOREIGN KEY (`lspPersona`) REFERENCES `persona` (`psrId`),
  ADD CONSTRAINT `listapersonas_ibfk_2` FOREIGN KEY (`lpsEventp`) REFERENCES `evento` (`evnId`),
  ADD CONSTRAINT `listapersonas_ibfk_3` FOREIGN KEY (`lpsConfirmacion`) REFERENCES `confirmacion` (`cfrId`),
  ADD CONSTRAINT `listapersonas_ibfk_4` FOREIGN KEY (`lspEfectivo`) REFERENCES `efectivo` (`efID`);

--
-- Filtros para la tabla `listaregalos`
--
ALTER TABLE `listaregalos`
  ADD CONSTRAINT `listaregalos_ibfk_1` FOREIGN KEY (`lsrNumLista`) REFERENCES `numlista` (`lsnID`),
  ADD CONSTRAINT `listaregalos_ibfk_2` FOREIGN KEY (`lsrRegalo`) REFERENCES `regalos` (`rglId`),
  ADD CONSTRAINT `listaregalos_ibfk_3` FOREIGN KEY (`lsrEstado`) REFERENCES `estatusregalo` (`ettrId`),
  ADD CONSTRAINT `listaregalos_ibfk_4` FOREIGN KEY (`lsrListaPersonas`) REFERENCES `listapersonas` (`lspId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
