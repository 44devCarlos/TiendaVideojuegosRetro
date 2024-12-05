-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para tienda_videojuegos_retro
DROP DATABASE IF EXISTS `tienda_videojuegos_retro`;
CREATE DATABASE IF NOT EXISTS `tienda_videojuegos_retro` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `tienda_videojuegos_retro`;

-- Volcando estructura para tabla tienda_videojuegos_retro.consolas
DROP TABLE IF EXISTS `consolas`;
CREATE TABLE IF NOT EXISTS `consolas` (
  `id_consola` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `anio_lanzamiento` int(11) DEFAULT NULL,
  `informacion` text DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id_consola`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla tienda_videojuegos_retro.consolas: ~0 rows (aproximadamente)
INSERT INTO `consolas` (`id_consola`, `nombre`, `marca`, `stock`, `anio_lanzamiento`, `informacion`, `fecha_creacion`) VALUES
	(1, 'consola1', 'a', 25, 1500, NULL, '2024-12-03 16:17:32');

-- Volcando estructura para tabla tienda_videojuegos_retro.rol
DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `rol` varchar(50) NOT NULL,
  PRIMARY KEY (`rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla tienda_videojuegos_retro.rol: ~2 rows (aproximadamente)
INSERT INTO `rol` (`rol`) VALUES
	('Admin'),
	('Usuario');

-- Volcando estructura para tabla tienda_videojuegos_retro.usuarios
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `email` text DEFAULT NULL,
  `rol` varchar(50) DEFAULT NULL,
  `contrasena` varchar(50) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id_usuario`),
  KEY `rol` (`rol`),
  CONSTRAINT `FK_usuarios_rol` FOREIGN KEY (`rol`) REFERENCES `rol` (`rol`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla tienda_videojuegos_retro.usuarios: ~1 rows (aproximadamente)
INSERT INTO `usuarios` (`id_usuario`, `nombre`, `email`, `rol`, `contrasena`, `fecha_creacion`) VALUES
	(1, 'Admin', 'prueba.admin@gmail.com', 'Admin', NULL, '2024-12-04 09:40:08');

-- Volcando estructura para tabla tienda_videojuegos_retro.videojuegos
DROP TABLE IF EXISTS `videojuegos`;
CREATE TABLE IF NOT EXISTS `videojuegos` (
  `id_videojuego` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` int(11) DEFAULT NULL,
  `genero` int(11) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `informacion` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `id_consola` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id_videojuego`),
  KEY `id_consola` (`id_consola`),
  CONSTRAINT `FK_videojuegos_consolas` FOREIGN KEY (`id_consola`) REFERENCES `consolas` (`id_consola`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla tienda_videojuegos_retro.videojuegos: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
