-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-06-2021 a las 22:44:55
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
-- Estructura de tabla para la tabla `tbl_cliente`
--

CREATE TABLE `tbl_cliente` (
  `ID_CLIENTE` int(11) NOT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `APELLIDO` varchar(50) DEFAULT NULL,
  `CORREO` varchar(100) DEFAULT NULL,
  `TELEFONO` int(50) DEFAULT NULL,
  `DIRECCION` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_cliente`
--

INSERT INTO `tbl_cliente` (`ID_CLIENTE`, `NOMBRE`, `APELLIDO`, `CORREO`, `TELEFONO`, `DIRECCION`) VALUES
(5, 'KASSANDRA', 'MARQUEZ', 'KASSANDRAMARQUEZ@GMAIL.COM', 87095617, 'MEDIA CUADRA ABAJO DE GOLOSINAS ADONNIS'),
(6, 'OLMAN', 'MIRANDA', 'OLMANMIRANDA@GMAIL.COM', 96908677, 'BARRIO LOURDES'),
(7, 'SOFIA', 'ZUNIGA', 'SOFIAZUNIGA@GMAIL.COM', 88346715, 'BARRIO CABAÑAS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `ID_MENU` int(11) NOT NULL,
  `CAMARONES=180` int(100) NOT NULL,
  `AMBURGUESAS=45` int(100) NOT NULL,
  `PIZZA=189` int(100) NOT NULL,
  `ARROZ CHINO=150` int(100) NOT NULL,
  `SOPAS=60` int(100) NOT NULL,
  `LIMONADA=15` int(100) NOT NULL,
  `JUGO_MARACUYA=15` int(100) NOT NULL,
  `CAFE=12` int(100) NOT NULL,
  `COCA-COLA=20` int(100) NOT NULL,
  `PASTEL DE VAINILLA=50` int(100) NOT NULL,
  `PASTEL DE CHOCOLATE=50` int(100) NOT NULL,
  `ID_CLIENTE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_menu`
--

INSERT INTO `tbl_menu` (`ID_MENU`, `CAMARONES=180`, `AMBURGUESAS=45`, `PIZZA=189`, `ARROZ CHINO=150`, `SOPAS=60`, `LIMONADA=15`, `JUGO_MARACUYA=15`, `CAFE=12`, `COCA-COLA=20`, `PASTEL DE VAINILLA=50`, `PASTEL DE CHOCOLATE=50`, `ID_CLIENTE`) VALUES
(10, 2, 0, 0, 0, 2, 2, 0, 0, 2, 1, 0, 5),
(11, 0, 2, 0, 1, 0, 0, 0, 0, 2, 0, 1, 6),
(12, 5, 0, 0, 1, 0, 1, 3, 0, 1, 1, 0, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_pedidos`
--

CREATE TABLE `tbl_pedidos` (
  `ID_PEDIDO` int(11) NOT NULL,
  `PLATO DE ENTRADA` varchar(100) NOT NULL,
  `PLATA FUERTE` varchar(100) NOT NULL,
  `BEBIDAS` varchar(100) NOT NULL,
  `POSTRES` varchar(100) NOT NULL,
  `TOTAL =` int(100) DEFAULT NULL,
  `ID_CLIENTE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_pedidos`
--

INSERT INTO `tbl_pedidos` (`ID_PEDIDO`, `PLATO DE ENTRADA`, `PLATA FUERTE`, `BEBIDAS`, `POSTRES`, `TOTAL =`, `ID_CLIENTE`) VALUES
(6, '\r\n2 PLATOS DE SOPA', '2 PLATOS DE CAMARONES', '2 LIMONADAS\r\n2 COCA COLAS', '1 PASTEL DE VAINILLA', 600, 5),
(7, '1 BANDJEJA DE ARROZ CHINO', '2 PLATOS DE HAMBURGUESA', '2 COCA COLAS', '1 PASTEL DE CHOCOLATE', 600, 6),
(8, '5 PLATOS DE CAMARONES\r\n', '1 BANDEJA DE ARROZ CHINO', '1 LIMONADA\r\n3 MARACUYAS\r\n1 COCA COLA', '1 PASTEL DE VAINILLA', 1180, 7);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_cliente`
--
ALTER TABLE `tbl_cliente`
  ADD PRIMARY KEY (`ID_CLIENTE`);

--
-- Indices de la tabla `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`ID_MENU`),
  ADD KEY `FK_CLIENTE_MENU` (`ID_CLIENTE`);

--
-- Indices de la tabla `tbl_pedidos`
--
ALTER TABLE `tbl_pedidos`
  ADD PRIMARY KEY (`ID_PEDIDO`),
  ADD KEY `FK_CLIENTE_PEDIDOS` (`ID_CLIENTE`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_cliente`
--
ALTER TABLE `tbl_cliente`
  MODIFY `ID_CLIENTE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `ID_MENU` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `tbl_pedidos`
--
ALTER TABLE `tbl_pedidos`
  MODIFY `ID_PEDIDO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD CONSTRAINT `FK_CLIENTE_MENU` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `tbl_cliente` (`ID_CLIENTE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_pedidos`
--
ALTER TABLE `tbl_pedidos`
  ADD CONSTRAINT `FK_CLIENTE_PEDIDOS` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `tbl_cliente` (`ID_CLIENTE`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
