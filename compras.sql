-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-05-2024 a las 06:22:46
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `compras`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `cliente_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cliente_id`, `nombre`, `telefono`, `email`) VALUES
(1, 'Carlos montoya', '315591585', 'carlos@gmail.com'),
(2, 'Maria Garcia', '0987654321', 'maria.garcia@gmail.com'),
(3, 'Carlos Sanchez', '1112223333', 'carlos.sanchez@gmail.com'),
(4, 'Laura Gomez', '4445556666', 'laura.gomez@gmail.com'),
(5, 'Ana Martinez', '7778889999', 'ana.martinez@gmail.com'),
(6, 'Luis Fernandez', '1010101010', 'luis.fernandez@gmail.com'),
(7, 'Sofia Lopez', '1212121212', 'sofia.lopez@gmail.com'),
(8, 'Pedro Ramirez', '1313131313', 'pedro.ramirez@gmail.com'),
(9, 'Carmen Torres', '1414141414', 'carmen.torres@gmail.com'),
(10, 'Jose Diaz', '1515151515', 'jose.diaz@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `compra_id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_compra` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`compra_id`, `cliente_id`, `producto_id`, `cantidad`, `fecha_compra`) VALUES
(1, 1, 1, 1, '2024-05-01'),
(2, 2, 2, 2, '2024-05-02'),
(3, 3, 3, 1, '2024-05-03'),
(4, 4, 4, 2, '2024-05-04'),
(5, 5, 5, 1, '2024-05-05'),
(6, 6, 6, 3, '2024-05-06'),
(7, 7, 7, 2, '2024-05-07'),
(8, 8, 8, 1, '2024-05-08'),
(9, 9, 9, 2, '2024-05-09'),
(10, 10, 10, 10, '2024-05-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `producto_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`producto_id`, `nombre`, `descripcion`, `precio`, `stock`) VALUES
(1, 'Laptop', 'Laptop de alta gama', 1200.00, 10),
(2, 'Smartphone', 'Smartphone última generación', 800.00, 20),
(3, 'Tablet', 'Tablet con pantalla HD', 300.00, 15),
(4, 'Monitor', 'Monitor 24 pulgadas', 150.00, 25),
(5, 'Teclado', 'Teclado mecánico', 50.00, 50),
(6, 'Mouse', 'Mouse inalámbrico', 25.00, 40),
(7, 'Impresora', 'Impresora multifuncional', 200.00, 10),
(8, 'Auriculares', 'Auriculares cancelación ruido', 75.00, 30),
(9, 'Cámara', 'Cámara digital', 500.00, 5),
(10, 'Disco Duro', 'Disco duro externo 1TB', 100.00, 20);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cliente_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`compra_id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`producto_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `compra_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `producto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`),
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
