-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-05-2021 a las 20:20:45
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

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
-- Estructura de tabla para la tabla `tbl_formulario`
--

CREATE TABLE `tbl_formulario` (
  `ID_FORMULARIO` int(11) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `APELLIDO` varchar(100) NOT NULL,
  `CORREO` varchar(100) NOT NULL,
  `TELEFONO` int(100) NOT NULL,
  `DIRECCION` varchar(100) NOT NULL,
  `ID_MENU` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_formulario`
--

INSERT INTO `tbl_formulario` (`ID_FORMULARIO`, `NOMBRE`, `APELLIDO`, `CORREO`, `TELEFONO`, `DIRECCION`, `ID_MENU`) VALUES
(1, 'KEYDI YOSSARI ', 'MENDEZ ARGUETA', 'YOSSARIMENDEZ@GMAIL.COM', 32700682, 'ALDEA EL TALADRO,DESVIO A PLAYITAS', 0),
(2, 'JUAN GUSTAVO', 'MACHADO LOPEZ', 'MACHADO123@GMAIL.COM', 99875564, 'BARRIO CABAÑAS', 0),
(3, 'LUIS ANTONIO', 'MEJIA PEREZ', 'JUANPEREZ@GMAIL.COM', 12345577, 'PARQUE SAN FRANCISCO , AL FRENTE DE LOS JUZGADOS,CASA COLOR VERDE.', 0),
(4, 'MARTHA JIMENA', 'ARIAGA GOMEZ', 'GOMEZGOMEZ@GMAIL.COM', 95290877, 'DOS CUADRAS DEPUES DEL MALL PREMIER,CASA DOS PLATNAS COLOR AZUL.', 0),
(5, 'YESSENIA MARISOL', 'MENDEZ CARDONA', 'YESENIAMENDEZ1974@GMAIL.COM', 97541234, '5 CUADRAS DEPUES DE EL SUPERMERCADO LA COLONIA, BODEAGA \"BODEGA GALANTE\" COLOR CAFE', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `ID_MENU` int(11) NOT NULL,
  `CAMARONES=180` varchar(100) NOT NULL,
  `AMBURGUESAS=150` varchar(100) NOT NULL,
  `PIZZA=100` varchar(100) NOT NULL,
  `ARROZ CHINO` varchar(100) NOT NULL,
  `COCA COLA` varchar(100) NOT NULL,
  `LIMONADA` varchar(100) NOT NULL,
  `MARACUYA` varchar(100) NOT NULL,
  `CAFE` varchar(100) NOT NULL,
  `PASTEL DE CHOCOLATE` varchar(100) NOT NULL,
  `PASTEL DE VAINILLA` varchar(100) NOT NULL,
  `SOPAS` varchar(100) NOT NULL,
  `ID_PEDIDO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_menu`
--

INSERT INTO `tbl_menu` (`ID_MENU`, `CAMARONES=180`, `AMBURGUESAS=150`, `PIZZA=100`, `ARROZ CHINO`, `COCA COLA`, `LIMONADA`, `MARACUYA`, `CAFE`, `PASTEL DE CHOCOLATE`, `PASTEL DE VAINILLA`, `SOPAS`, `ID_PEDIDO`) VALUES
(1, '4 PLATOS DE CAMARONES', '2 AMBUEGUESAS', '1 PIZZA', '', '5 REFRESCOS COCA-COLA', '', '', '', '2 PASTELES DE VAINILLA', '', '', 0),
(2, '3 CAMARONES', '', '', '', '', '3 LIMONADAS', '', '', '', '', '1 SOPA', 0),
(3, '', '5 AMBURGUESAS', '1 PIZZA', '', '1 COCA-COLA', '', '', '', '', '', '', 0),
(4, '', '', '', '', '', '', '', '', '5 PASTELES DE CHOCOLATE', '', '', 0),
(5, ' 2 CAMARONES', '', '5 PIZZAS', '1 ARROZ CHINO', '', '', '3 JUGOS DE MARACUYA', '', '', '', '', 0);

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
  `ID_MENU` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_pedido`
--

INSERT INTO `tbl_pedido` (`ID_PEDIDO`, `PLATO DE ENTRADA`, `PLATO FUERTE`, `BEBIDAS`, `POSTRES`, `ID_MENU`) VALUES
(1, 'PIZZA,AMBURGUESA', '', 'COCACOLA', 'PASTEL DE VAINILLA', 0),
(2, '', 'SOPA', 'LIMONADA', 'PASTEL CHOCOLATE', 0),
(3, 'PIZZA, CAMARONES', '', 'COCACOLA', '', 0),
(4, 'CAMRONES', 'SOPA', 'MARACUYA', '', 0),
(5, 'PIZZA,AMBURGUESA,CAMRONES', '', 'COCA COLA', 'PASTEL DE VAINILLA', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_total`
--

CREATE TABLE `tbl_total` (
  `ID_TOTAL` int(11) NOT NULL,
  `TOTAL` int(100) NOT NULL,
  `ID_PEDIDO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_total`
--

INSERT INTO `tbl_total` (`ID_TOTAL`, `TOTAL`, `ID_PEDIDO`) VALUES
(1, 580, 0),
(2, 200, 0),
(3, 150, 0),
(4, 255, 0),
(5, 384, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_formulario`
--
ALTER TABLE `tbl_formulario`
  ADD PRIMARY KEY (`ID_FORMULARIO`),
  ADD KEY `FK_MENU_FORMULARIO` (`ID_MENU`);

--
-- Indices de la tabla `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`ID_MENU`),
  ADD KEY `FK_PEDIDO_MENU` (`ID_PEDIDO`);

--
-- Indices de la tabla `tbl_pedido`
--
ALTER TABLE `tbl_pedido`
  ADD PRIMARY KEY (`ID_PEDIDO`),
  ADD KEY `FK_MENU_PEDIDO` (`ID_MENU`);

--
-- Indices de la tabla `tbl_total`
--
ALTER TABLE `tbl_total`
  ADD PRIMARY KEY (`ID_TOTAL`),
  ADD KEY `FK_PEDIDO_TOTAL` (`ID_PEDIDO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_formulario`
--
ALTER TABLE `tbl_formulario`
  MODIFY `ID_FORMULARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `ID_MENU` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_pedido`
--
ALTER TABLE `tbl_pedido`
  MODIFY `ID_PEDIDO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_total`
--
ALTER TABLE `tbl_total`
  MODIFY `ID_TOTAL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_formulario`
--
ALTER TABLE `tbl_formulario`
  ADD CONSTRAINT `FK_MENU_FORMULARIO` FOREIGN KEY (`ID_FORMULARIO`) REFERENCES `tbl_menu` (`ID_MENU`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD CONSTRAINT `FK_PEDIDO_MENU` FOREIGN KEY (`ID_MENU`) REFERENCES `tbl_pedido` (`ID_PEDIDO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_pedido`
--
ALTER TABLE `tbl_pedido`
  ADD CONSTRAINT `FK_MENU_PEDIDO` FOREIGN KEY (`ID_PEDIDO`) REFERENCES `tbl_menu` (`ID_MENU`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_total`
--
ALTER TABLE `tbl_total`
  ADD CONSTRAINT `FK_PEDIDO_TOTAL` FOREIGN KEY (`ID_TOTAL`) REFERENCES `tbl_pedido` (`ID_PEDIDO`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
