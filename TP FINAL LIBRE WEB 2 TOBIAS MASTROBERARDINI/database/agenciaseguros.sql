-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-03-2024 a las 21:07:12
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `agenciaseguros`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opiniones`
--

CREATE TABLE `opiniones` (
  `id` int(11) NOT NULL,
  `opinion` varchar(250) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `prestadorId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `opiniones`
--

INSERT INTO `opiniones` (`id`, `opinion`, `usuario`, `prestadorId`) VALUES
(6, 'Buena atencion al cliente', '', 12),
(7, 'Mala experiencia para realizar cobros', '', 13),
(8, 'Buena experiencia realizando cobros', '', 14),
(9, 'Buenos precios', '', 15),
(10, 'Buena atencion y predisposicion', '', 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestadores`
--

CREATE TABLE `prestadores` (
  `prestadorId` int(11) NOT NULL,
  `fechaCreacion` date NOT NULL,
  `entidad` varchar(45) NOT NULL,
  `nombrePrestador` varchar(45) NOT NULL,
  `logo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestadores`
--

INSERT INTO `prestadores` (`prestadorId`, `fechaCreacion`, `entidad`, `nombrePrestador`, `logo`) VALUES
(12, '1978-02-10', 'Privada', 'La Caja', 'https://images.app.goo.gl/Dkbo5dp9Cd4PKHS28'),
(13, '1970-04-30', 'publica', 'La Nacion seguros', 'https://images.app.goo.gl/ydW1z76CK9PbYgq47'),
(14, '2000-02-02', 'privada', 'Seguros Rivadavia', 'https://images.app.goo.gl/5JM76qqH49fd7vzJ8'),
(15, '2003-03-20', 'Publica', 'Seguros Provincia', 'https://images.app.goo.gl/5RXVH2Ttb42aR7eN6'),
(16, '2013-11-30', 'Privada', 'La Segunda Seguros', 'https://images.app.goo.gl/HpWkpBx9mW7rte969');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguros`
--

CREATE TABLE `seguros` (
  `seguroId` int(11) NOT NULL,
  `nombreSeguro` varchar(45) NOT NULL,
  `fechaFinalizacion` date NOT NULL,
  `prestadorId` int(11) NOT NULL,
  `descripcionSeguro` text NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `seguros`
--

INSERT INTO `seguros` (`seguroId`, `nombreSeguro`, `fechaFinalizacion`, `prestadorId`, `descripcionSeguro`, `precio`) VALUES
(18, 'LC300', '0000-00-00', 12, 'Cobertura contra 3ros y granizo', 60000),
(19, 'LC500', '2025-03-13', 12, 'Cobertura contra 3ros, robo, incendio y granizo', 75000),
(20, 'LC1000', '2025-06-23', 12, 'Cobertura contra todo riesgo', 81000),
(21, 'LNS', '2025-05-03', 13, 'Cobertura contra 3ros y robo', 67000),
(22, 'LNS+', '2026-04-04', 13, 'Cobertura contra todo riesgo', 86000),
(23, 'SRivadavia', '2024-12-12', 14, 'Cobertura contra 3ros y robo', 74500),
(24, 'SRivadaviaMAS', '2024-12-12', 14, 'Cobertura contra 3ros, robo, incendio y granizo', 80000),
(25, 'ProvinciaS', '2025-01-10', 15, 'Cobertura contra 3ros', 63000),
(26, 'LSS', '2024-11-30', 16, 'Cobertura contra 3ros', 62000),
(27, 'LSS+', '2025-02-27', 16, 'Cobertura contra 3ros, robo e incendio', 69000),
(28, 'LSS++', '2025-04-15', 16, 'Cobertura contra todo riesgo', 78900);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario` varchar(200) NOT NULL,
  `contraseña` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario`, `contraseña`) VALUES
('webadmin', '$2y$10$UxnN7dhPtHarA2nI.vEsLuYi2yoCOegN5IgFrnPpsLcmnhuDEz/P6');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `opiniones`
--
ALTER TABLE `opiniones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prestadorId` (`prestadorId`),
  ADD KEY `usuario` (`usuario`) USING BTREE;

--
-- Indices de la tabla `prestadores`
--
ALTER TABLE `prestadores`
  ADD PRIMARY KEY (`prestadorId`);

--
-- Indices de la tabla `seguros`
--
ALTER TABLE `seguros`
  ADD PRIMARY KEY (`seguroId`),
  ADD KEY `prestadorId` (`prestadorId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `opiniones`
--
ALTER TABLE `opiniones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `prestadores`
--
ALTER TABLE `prestadores`
  MODIFY `prestadorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `seguros`
--
ALTER TABLE `seguros`
  MODIFY `seguroId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `opiniones`
--
ALTER TABLE `opiniones`
  ADD CONSTRAINT `opiniones_ibfk_1` FOREIGN KEY (`prestadorId`) REFERENCES `prestadores` (`prestadorId`);

--
-- Filtros para la tabla `seguros`
--
ALTER TABLE `seguros`
  ADD CONSTRAINT `seguros_ibfk_1` FOREIGN KEY (`prestadorId`) REFERENCES `prestadores` (`prestadorId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
