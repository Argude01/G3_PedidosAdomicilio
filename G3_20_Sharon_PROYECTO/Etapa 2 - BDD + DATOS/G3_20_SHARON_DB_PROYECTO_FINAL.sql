-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-06-2021 a las 20:03:31
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_registro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_cliente`
--

CREATE TABLE `tbl_cliente` (
  `ID_FORMULARIO` int(11) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `APELLIDO` varchar(100) NOT NULL,
  `CORREO` varchar(100) NOT NULL,
  `TELEFONO` int(100) NOT NULL,
  `DIRECCION` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_cliente`
--

INSERT INTO `tbl_cliente` (`ID_FORMULARIO`, `NOMBRE`, `APELLIDO`, `CORREO`, `TELEFONO`, `DIRECCION`) VALUES
(3, 'JOSE', 'ARIAS', 'JOSEARIAS@GMAIL.COM', 97340215, 'PLAYITAS, AJUTERIQUE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `ID_MENU` int(11) NOT NULL,
  `CAMARONES=180` int(50) NOT NULL,
  `HAMBURGUESAS=150` int(50) NOT NULL,
  `PIZZA=100` int(50) NOT NULL,
  `ARROZ CHINO=160` int(50) NOT NULL,
  `SOPAS=60` int(50) NOT NULL,
  `LIMONADA=15` int(50) NOT NULL,
  `MARACUYA=15` int(50) NOT NULL,
  `CAFE=12` int(50) NOT NULL,
  `COCA COLA=160` int(50) NOT NULL,
  `PASTEL DE VAINILLA=50` int(50) NOT NULL,
  `PASTEL DE CHOCOLATE=50` int(50) NOT NULL,
  `ID_FORMULARIO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_menu`
--

INSERT INTO `tbl_menu` (`ID_MENU`, `CAMARONES=180`, `HAMBURGUESAS=150`, `PIZZA=100`, `ARROZ CHINO=160`, `SOPAS=60`, `LIMONADA=15`, `MARACUYA=15`, `CAFE=12`, `COCA COLA=160`, `PASTEL DE VAINILLA=50`, `PASTEL DE CHOCOLATE=50`, `ID_FORMULARIO`) VALUES
(3, 1, 1, 1, 0, 3, 1, 0, 0, 1, 2, 0, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_pedido`
--

CREATE TABLE `tbl_pedido` (
  `ID_PEDIDO` int(11) NOT NULL,
  `PLATO DE ENTRADA` varchar(100) NOT NULL,
  `PLATO FUERTE` varchar(100) NOT NULL,
  `BEBIDAS` varchar(100) NOT NULL,
  `POSTRES` varchar(100) NOT NULL,
  `TOTAL` int(11) NOT NULL,
  `ID_FORMULARIO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_pedido`
--

INSERT INTO `tbl_pedido` (`ID_PEDIDO`, `PLATO DE ENTRADA`, `PLATO FUERTE`, `BEBIDAS`, `POSTRES`, `TOTAL`, `ID_FORMULARIO`) VALUES
(3, 'CAMARONES', 'PIZZA HAMBURGUESA ', 'COCA COLA LIMONADA', 'PASTEL DE VAINILLA Y CHOCOLATE', 600, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_cliente`
--
ALTER TABLE `tbl_cliente`
  ADD PRIMARY KEY (`ID_FORMULARIO`);

--
-- Indices de la tabla `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`ID_MENU`),
  ADD KEY `FK_PEDIDO_MENU` (`ID_FORMULARIO`);

--
-- Indices de la tabla `tbl_pedido`
--
ALTER TABLE `tbl_pedido`
  ADD PRIMARY KEY (`ID_PEDIDO`),
  ADD KEY `FK_FORMULARIO_PEDIDO` (`ID_FORMULARIO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_cliente`
--
ALTER TABLE `tbl_cliente`
  MODIFY `ID_FORMULARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `ID_MENU` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tbl_pedido`
--
ALTER TABLE `tbl_pedido`
  MODIFY `ID_PEDIDO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD CONSTRAINT `FK_MENU_FORMULARIO` FOREIGN KEY (`ID_MENU`) REFERENCES `tbl_cliente` (`ID_FORMULARIO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_pedido`
--
ALTER TABLE `tbl_pedido`
  ADD CONSTRAINT `FK_FORMULARIO_PEDIDO` FOREIGN KEY (`ID_PEDIDO`) REFERENCES `tbl_cliente` (`ID_FORMULARIO`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
