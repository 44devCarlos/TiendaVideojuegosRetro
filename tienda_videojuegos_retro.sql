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

-- Volcando estructura para procedimiento tienda_videojuegos_retro.ActualizarConsola
DROP PROCEDURE IF EXISTS `ActualizarConsola`;
DELIMITER //
CREATE PROCEDURE `ActualizarConsola`(
	IN `_stock` INT,
	IN `_idConsola` INT
)
BEGIN
	UPDATE consolas 
	SET stock = _stock WHERE idConsola = _idConsola;
END//
DELIMITER ;

-- Volcando estructura para procedimiento tienda_videojuegos_retro.ActualizarVideojuego
DROP PROCEDURE IF EXISTS `ActualizarVideojuego`;
DELIMITER //
CREATE PROCEDURE `ActualizarVideojuego`(
	IN `_stock` INT,
	IN `_idVideojuego` INT
)
BEGIN
	UPDATE videojuegos SET stock = _stock WHERE idVideojuego = _idVideojuego;
END//
DELIMITER ;

-- Volcando estructura para procedimiento tienda_videojuegos_retro.AgregarConsola
DROP PROCEDURE IF EXISTS `AgregarConsola`;
DELIMITER //
CREATE PROCEDURE `AgregarConsola`(
	IN `_nombre` VARCHAR(50),
	IN `_marca` VARCHAR(50),
	IN `_precio` DECIMAL(20,6),
	IN `_stock` INT,
	IN `_anioLanzamiento` INT,
	IN `_informacion` TEXT,
	IN `_imagen` TEXT
)
BEGIN
	INSERT INTO consolas (nombre, marca, precio, stock, anioLanzamiento, informacion, imagen) 
	VALUES (_nombre, _marca, _precio, _stock, _anioLanzamiento, _informacion, _imagen);
END//
DELIMITER ;

-- Volcando estructura para procedimiento tienda_videojuegos_retro.AgregarProducto
DROP PROCEDURE IF EXISTS `AgregarProducto`;
DELIMITER //
CREATE PROCEDURE `AgregarProducto`(
	IN `p_id` INT,
	IN `p_stock` INT,
	IN `p_precio` DECIMAL(20,6),
	IN `p_nombre` VARCHAR(50)
)
BEGIN
    -- Variable para identificar la tabla
    DECLARE esConsola BOOLEAN;

    -- Verificar si el producto está en la tabla Consolas
    SELECT COUNT(*) > 0 INTO esConsola
    FROM consolas
    WHERE idConsola = p_id AND nombre = p_nombre;

    -- Insertar en la tabla correspondiente
    IF esConsola THEN
        INSERT INTO ventasconsola (cantidad, precio, idConsola)
        VALUES (p_stock, p_precio, p_id);
    ELSE
        -- Verificar si el producto está en la tabla Videojuegos
        SELECT COUNT(*) INTO @existeEnVideojuegos
        FROM Videojuegos
        WHERE idVideojuego = p_id AND nombre = p_nombre;

        IF @existeEnVideojuegos > 0 THEN
            INSERT INTO ventasjuegos (cantidad, precio, idJuego)
            VALUES (p_stock, p_precio, p_id);
        ELSE
            -- Manejar caso en el que no se encuentre en ninguna tabla
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El producto no existe en ninguna tabla';
        END IF;
    END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento tienda_videojuegos_retro.AgregarVideojuego
DROP PROCEDURE IF EXISTS `AgregarVideojuego`;
DELIMITER //
CREATE PROCEDURE `AgregarVideojuego`(
	IN `_nombre` VARCHAR(50),
	IN `_genero` VARCHAR(50),
	IN `_precio` DECIMAL(20,6),
	IN `_informacion` TEXT,
	IN `_stock` INT,
	IN `_idConsola` INT,
	IN `_imagen` TEXT
)
BEGIN
	INSERT INTO videojuegos (nombre, genero, precio, informacion, stock, idConsola, imagen) 
	VALUES (_nombre, _genero, _precio, _informacion, _stock, _idConsola, _imagen);
END//
DELIMITER ;

-- Volcando estructura para procedimiento tienda_videojuegos_retro.BuscarJuegoPorConsola
DROP PROCEDURE IF EXISTS `BuscarJuegoPorConsola`;
DELIMITER //
CREATE PROCEDURE `BuscarJuegoPorConsola`(
	IN `_idConsola` INT
)
BEGIN
	SELECT 
		v.idVideojuego,
		v.nombre,
		v.genero,
		v.precio,
		v.informacion,
		v.stock,
		c.nombre AS consola,
		v.imagen
		FROM videojuegos AS v
		LEFT JOIN consolas AS c ON c.idConsola = v.idConsola
		WHERE v.idConsola = _idConsola;
END//
DELIMITER ;

-- Volcando estructura para tabla tienda_videojuegos_retro.compras
DROP TABLE IF EXISTS `compras`;
CREATE TABLE IF NOT EXISTS `compras` (
  `idCompra` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `total` decimal(20,6) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCompra`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `FK_compras_usuarios` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla tienda_videojuegos_retro.compras: ~0 rows (aproximadamente)

-- Volcando estructura para tabla tienda_videojuegos_retro.consolas
DROP TABLE IF EXISTS `consolas`;
CREATE TABLE IF NOT EXISTS `consolas` (
  `idConsola` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `anioLanzamiento` year(4) DEFAULT NULL,
  `informacion` text DEFAULT NULL,
  `imagen` text DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`idConsola`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla tienda_videojuegos_retro.consolas: ~13 rows (aproximadamente)
INSERT INTO `consolas` (`idConsola`, `nombre`, `marca`, `precio`, `stock`, `anioLanzamiento`, `informacion`, `imagen`, `fecha_creacion`) VALUES
	(2, 'Atari 2600', 'Atari', 80, 30, '1977', 'Primera consola masivamente adoptada que popularizó los videojuegos.', 'https://upload.wikimedia.org/wikipedia/commons/b/b9/Atari-2600-Wood-4Sw-Set.jpg', '2024-12-04 20:17:32'),
	(3, 'Nintendo Entertainment System (NES)', 'Nintendo', 100, 8, '1985', 'Consola icónica que introdujo juegos como Mario Bros y Zelda.', 'https://i.ebayimg.com/images/g/AD4AAOSw3YphYRwA/s-l400.jpg', '2024-12-04 20:17:32'),
	(4, 'Super Nintendo Entertainment System (SNES)', 'Nintendo', 120, 20, '1990', 'La sucesora del NES con gráficos mejorados y títulos memorables.', 'https://i.ebayimg.com/images/g/ImQAAOSwJU9lYkPc/s-l400.jpg', '2024-12-04 20:17:32'),
	(5, 'Sega Genesis', 'Sega', 70, 15, '1988', 'Competencia directa del SNES con títulos como Sonic.', 'https://m.media-amazon.com/images/I/71TzmD6BpwL.jpg', '2024-12-04 20:17:32'),
	(6, 'Sony PlayStation', 'Sony', 70, 5, '1994', 'La primera consola de Sony que revolucionó los videojuegos en CD.', 'https://i.ebayimg.com/images/g/-tAAAOSwHWtcvJzb/s-l500.jpg', '2024-12-04 20:17:32'),
	(7, 'Nintendo 64', 'Nintendo', 120, 25, '1996', 'Consola que introdujo juegos en 3D como Super Mario 64 y Zelda Ocarina of Time.', 'https://i.ebayimg.com/00/s/MTIwMFgxNjAw/z/Y8UAAOSwTxhfFQ~b/$_12.JPG?set_id=880000500F', '2024-12-04 20:17:32'),
	(8, 'Sega Dreamcast', 'Sega', 80, 50, '1999', 'Última consola de Sega con juegos innovadores como Sonic Adventure.', 'https://i.ebayimg.com/images/g/HloAAOSwao9ho5Cq/s-l400.jpg', '2024-12-04 20:17:32'),
	(9, 'Game Boy', 'Nintendo', 50, 10, '1989', 'Consola portátil que revolucionó los videojuegos móviles con títulos como Tetris.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/Game-Boy-FL.jpg/800px-Game-Boy-FL.jpg', '2024-12-04 20:17:32'),
	(10, 'PlayStation 2', 'Sony', 70, 49, '2000', 'Consola más vendida de todos los tiempos con un vasto catálogo de juegos.', 'https://media.zenfs.com/es/tarreo_527/29c0b45204ece6618d3500f9559bea9a', '2024-12-04 20:17:32'),
	(11, 'Xbox 360', 'Microsoft', 60, 10, '2001', 'Primera consola de Microsoft que popularizó Xbox Live.', 'https://i.ebayimg.com/images/g/RswAAOSw8s1kRXI3/s-l1200.jpg', '2024-12-04 20:17:32'),
	(24, 'Playstation 3', 'Playstation', 120, 30, '2006', 'Playstation 3', 'imagen.png', '2024-12-06 09:18:08');

-- Volcando estructura para tabla tienda_videojuegos_retro.detalles_compra
DROP TABLE IF EXISTS `detalles_compra`;
CREATE TABLE IF NOT EXISTS `detalles_compra` (
  `idDetalle` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `idCompra` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`idDetalle`),
  KEY `idCompra` (`idCompra`),
  CONSTRAINT `FK_detalles_compra_compras` FOREIGN KEY (`idCompra`) REFERENCES `compras` (`idCompra`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla tienda_videojuegos_retro.detalles_compra: ~0 rows (aproximadamente)

-- Volcando estructura para procedimiento tienda_videojuegos_retro.ObtenerConsolasConMayorGanancia
DROP PROCEDURE IF EXISTS `ObtenerConsolasConMayorGanancia`;
DELIMITER //
CREATE PROCEDURE `ObtenerConsolasConMayorGanancia`()
BEGIN
    SELECT c.idConsola, c.nombre AS consola, SUM(vc.cantidad * vc.precio) AS ganancia_total
    FROM ventasConsola vc
    JOIN consolas c ON vc.idConsola = c.idConsola
    GROUP BY c.idConsola
    ORDER BY ganancia_total DESC
	 LIMIT 5;
END//
DELIMITER ;

-- Volcando estructura para procedimiento tienda_videojuegos_retro.ObtenerConsolasMasVendidas
DROP PROCEDURE IF EXISTS `ObtenerConsolasMasVendidas`;
DELIMITER //
CREATE PROCEDURE `ObtenerConsolasMasVendidas`()
BEGIN
    SELECT c.idConsola, c.nombre AS consola, SUM(vc.cantidad) AS total_vendido
    FROM ventasConsola vc
    JOIN consolas c ON vc.idConsola = c.idConsola
    GROUP BY c.idConsola
    ORDER BY total_vendido DESC
	 LIMIT 5;
END//
DELIMITER ;

-- Volcando estructura para procedimiento tienda_videojuegos_retro.ObtenerJuegosConMayorGanancia
DROP PROCEDURE IF EXISTS `ObtenerJuegosConMayorGanancia`;
DELIMITER //
CREATE PROCEDURE `ObtenerJuegosConMayorGanancia`()
BEGIN
    SELECT v.idVideojuego, v.nombre AS videojuego, ROUND(SUM(vj.cantidad * vj.precio), 2) AS ganancia_total
    FROM ventasJuegos vj
    JOIN videojuegos v ON vj.idJuego = v.idVideojuego
    GROUP BY v.idVideojuego
    ORDER BY ganancia_total DESC
	 LIMIT 5;
END//
DELIMITER ;

-- Volcando estructura para procedimiento tienda_videojuegos_retro.ObtenerJuegosMasVendidos
DROP PROCEDURE IF EXISTS `ObtenerJuegosMasVendidos`;
DELIMITER //
CREATE PROCEDURE `ObtenerJuegosMasVendidos`()
BEGIN
    SELECT v.idVideojuego, v.nombre AS videojuego, SUM(vj.cantidad) AS total_vendido
    FROM ventasJuegos vj
    JOIN videojuegos v ON vj.idJuego = v.idVideojuego
    GROUP BY v.idVideojuego
    ORDER BY total_vendido DESC
	 LIMIT 5;
END//
DELIMITER ;

-- Volcando estructura para procedimiento tienda_videojuegos_retro.ObtenerProductos
DROP PROCEDURE IF EXISTS `ObtenerProductos`;
DELIMITER //
CREATE PROCEDURE `ObtenerProductos`()
BEGIN
	SELECT
	c.nombre,
	c.anioLanzamiento,
	c.imagen,
	v.nombre,
	v.genero,
	v.imagen
	 FROM consolas AS c LEFT JOIN videojuegos AS v ON v.idConsola = c.idConsola;
END//
DELIMITER ;

-- Volcando estructura para procedimiento tienda_videojuegos_retro.RegistrarUsuario
DROP PROCEDURE IF EXISTS `RegistrarUsuario`;
DELIMITER //
CREATE PROCEDURE `RegistrarUsuario`(
	IN `_nombre` VARCHAR(50),
	IN `_email` TEXT,
	IN `_contrasena` VARCHAR(255)
)
BEGIN
	INSERT INTO usuarios (nombre, email, rol, contrasena) 
	VALUES (_nombre, _email, 'Usuario', SHA2(_contrasena, 256));
END//
DELIMITER ;

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
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `email` text DEFAULT NULL,
  `rol` varchar(50) DEFAULT NULL,
  `contrasena` varchar(70) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`idUsuario`),
  KEY `rol` (`rol`),
  CONSTRAINT `FK_usuarios_rol` FOREIGN KEY (`rol`) REFERENCES `rol` (`rol`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla tienda_videojuegos_retro.usuarios: ~3 rows (aproximadamente)
INSERT INTO `usuarios` (`idUsuario`, `nombre`, `email`, `rol`, `contrasena`, `fecha_creacion`) VALUES
	(1, 'Admin', 'prueba.admin@gmail.com', 'Admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2024-12-04 09:40:08'),
	(6, 'Carlos', 'carv2012@gmail.com', 'Usuario', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', '2024-12-04 17:13:12'),
	(7, 'Jorge', 'jorge@gmail.com', 'Usuario', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', '2024-12-04 21:19:56');

-- Volcando estructura para tabla tienda_videojuegos_retro.ventasconsola
DROP TABLE IF EXISTS `ventasconsola`;
CREATE TABLE IF NOT EXISTS `ventasconsola` (
  `idVentaConsola` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `idConsola` int(11) NOT NULL,
  PRIMARY KEY (`idVentaConsola`),
  KEY `idConsola` (`idConsola`),
  CONSTRAINT `ventasconsola_ibfk_1` FOREIGN KEY (`idConsola`) REFERENCES `consolas` (`idConsola`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla tienda_videojuegos_retro.ventasconsola: ~9 rows (aproximadamente)
INSERT INTO `ventasconsola` (`idVentaConsola`, `cantidad`, `precio`, `idConsola`) VALUES
	(1, 10, 19.99, 9),
	(2, 10, 19.99, 9),
	(3, 10, 19.99, 9),
	(4, 10, 19.99, 9),
	(5, 10, 19.99, 9),
	(8, 1, 100.00, 3),
	(9, 1, 70.00, 10),
	(10, 1, 100.00, 3),
	(11, 10, 19.99, 9),
	(12, 1, 100.00, 3);

-- Volcando estructura para tabla tienda_videojuegos_retro.ventasjuegos
DROP TABLE IF EXISTS `ventasjuegos`;
CREATE TABLE IF NOT EXISTS `ventasjuegos` (
  `idVentaJuego` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `idJuego` int(11) NOT NULL,
  PRIMARY KEY (`idVentaJuego`),
  KEY `idJuego` (`idJuego`),
  CONSTRAINT `ventasjuegos_ibfk_1` FOREIGN KEY (`idJuego`) REFERENCES `videojuegos` (`idVideojuego`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla tienda_videojuegos_retro.ventasjuegos: ~7 rows (aproximadamente)
INSERT INTO `ventasjuegos` (`idVentaJuego`, `cantidad`, `precio`, `idJuego`) VALUES
	(1, 10, 19.99, 63),
	(5, 1, 24.00, 2),
	(6, 1, 27.00, 5),
	(7, 1, 36.00, 47),
	(8, 0, 24.00, 2),
	(9, 1, 19.00, 1),
	(10, 1, 32.99, 13);

-- Volcando estructura para procedimiento tienda_videojuegos_retro.VerConsolas
DROP PROCEDURE IF EXISTS `VerConsolas`;
DELIMITER //
CREATE PROCEDURE `VerConsolas`()
BEGIN
	SELECT 
	consolas.idConsola,
	consolas.nombre,
	consolas.marca,
	consolas.precio,
	consolas.stock,
	consolas.anioLanzamiento,
	consolas.informacion,
	consolas.imagen
	FROM consolas;
END//
DELIMITER ;

-- Volcando estructura para procedimiento tienda_videojuegos_retro.VerificarUsuario
DROP PROCEDURE IF EXISTS `VerificarUsuario`;
DELIMITER //
CREATE PROCEDURE `VerificarUsuario`(
	IN `_email` VARCHAR(50),
	IN `_contrasena` VARCHAR(255)
)
BEGIN
	SELECT idUsuario, nombre, email, rol 
	FROM usuarios 
	WHERE email = _email AND contrasena = SHA2(_contrasena, 256);
END//
DELIMITER ;

-- Volcando estructura para procedimiento tienda_videojuegos_retro.VerVideojuegos
DROP PROCEDURE IF EXISTS `VerVideojuegos`;
DELIMITER //
CREATE PROCEDURE `VerVideojuegos`()
BEGIN
	SELECT 
	v.idVideojuego,
	v.nombre,
	v.genero,
	v.precio,
	v.informacion,
	v.stock,
	c.nombre AS consola,
	v.imagen
	FROM videojuegos AS v
	LEFT JOIN consolas AS c ON c.idConsola = v.idConsola;
END//
DELIMITER ;

-- Volcando estructura para tabla tienda_videojuegos_retro.videojuegos
DROP TABLE IF EXISTS `videojuegos`;
CREATE TABLE IF NOT EXISTS `videojuegos` (
  `idVideojuego` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `genero` varchar(50) DEFAULT NULL,
  `precio` decimal(20,6) DEFAULT NULL,
  `informacion` text DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `idConsola` int(11) DEFAULT NULL,
  `imagen` text DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`idVideojuego`) USING BTREE,
  KEY `id_consola` (`idConsola`) USING BTREE,
  CONSTRAINT `FK_videojuegos_consolas` FOREIGN KEY (`idConsola`) REFERENCES `consolas` (`idConsola`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla tienda_videojuegos_retro.videojuegos: ~100 rows (aproximadamente)
INSERT INTO `videojuegos` (`idVideojuego`, `nombre`, `genero`, `precio`, `informacion`, `stock`, `idConsola`, `imagen`, `fecha_creacion`) VALUES
	(1, 'Pac-Man', 'Arcade', 19.990000, 'Versión para Atari del clásico arcade, un éxito mundial.', 110, 2, 'https://steelcollectibles.com/cdn/shop/products/jm_786x.jpg?v=1656093740', '2024-12-04 20:48:07'),
	(2, 'Space Invaders', 'Arcade', 24.990000, 'Pionero de los juegos de disparos, con alienígenas como enemigos.', 79, 2, 'https://moviegalorestore.com/wp-content/uploads/2024/01/20240111_142521.jpg', '2024-12-04 20:48:07'),
	(3, 'Pitfall!', 'Aventura', 29.990000, 'Uno de los primeros juegos de plataformas, desarrollado por Activision.', 60, 2, 'https://i.ebayimg.com/images/g/0wEAAOSwrvhnFXVz/s-l1600.jpg', '2024-12-04 20:48:07'),
	(4, 'Asteroids', 'Arcade', 22.990000, 'Juego espacial de disparos donde destruyes asteroides y sobrevives.', 70, 2, 'https://www.atarimania.com/2600/boxes/hi_res/asteroids_color_cart_12.jpg', '2024-12-04 20:48:07'),
	(5, 'Adventure', 'Aventura', 27.990000, 'Primer juego de acción y aventura, influyente en RPGs modernos.', 49, 2, 'https://www.atarimania.com/2600/boxes/hi_res/adventure_color_pal_cart.jpg', '2024-12-04 20:48:07'),
	(6, 'Breakout', 'Puzzle', 18.990000, 'Juego tipo arcade que inspiró a Arkanoid.', 90, 2, 'https://curiouscrowcompany.com/cdn/shop/files/IMG_6910.jpg?v=1708212478', '2024-12-04 20:48:07'),
	(7, 'Centipede', 'Arcade', 21.990000, 'Juego de disparos con estrategia donde eliminas insectos invasores.', 85, 2, 'https://retroravengames.com/cdn/shop/products/centipede_ad7ce309-3eb2-4569-b4be-a51de4b17e0a_580x.jpg?v=1632497960', '2024-12-04 20:48:07'),
	(8, 'Missile Command', 'Arcade', 23.990000, 'Protege tus ciudades de un ataque de misiles en este clásico.', 75, 2, 'https://www.atarimania.com/2600/boxes/hi_res/missile_command_color_cart.jpg', '2024-12-04 20:48:07'),
	(9, 'Frogger', 'Puzzle', 26.990000, 'Ayuda a la rana a cruzar carreteras y ríos llenos de obstáculos.', 65, 2, 'https://www.atarimania.com/2600/boxes/hi_res/frogger_standard_cart_6.jpg', '2024-12-04 20:48:07'),
	(10, 'Combat', 'Acción', 15.990000, 'Multijugador con vehículos como tanques y aviones.', 120, 2, 'https://www.atarimania.com/2600/boxes/hi_res/combat_text_gatefold_cart.jpg', '2024-12-04 20:48:07'),
	(11, 'Super Mario Bros.', 'Plataformas', 29.990000, 'El icónico juego de Mario que definió el género de plataformas.', 150, 3, 'https://ia801401.us.archive.org/14/items/super-mario-bros-nes/00_coverscreenshot.png', '2024-12-04 22:30:11'),
	(12, 'The Legend of Zelda', 'Aventura', 34.990000, 'Aventura épica con exploración y resolución de acertijos.', 120, 3, 'https://upload.wikimedia.org/wikipedia/en/4/41/Legend_of_zelda_cover_%28with_cartridge%29_gold.png', '2024-12-04 22:30:11'),
	(13, 'Metroid', 'Acción/Aventura', 32.990000, 'Juego de exploración no lineal protagonizado por Samus Aran.', 100, 3, 'https://static.wixstatic.com/media/112fd3_2aea3e6db9a34c97afc09ac361ddb101.png/v1/fill/w_420,h_575,al_c,lg_1,q_85,enc_auto/112fd3_2aea3e6db9a34c97afc09ac361ddb101.png', '2024-12-04 22:30:11'),
	(14, 'Mega Man 2', 'Acción/Plataformas', 27.990000, 'Clásico juego de acción con batallas contra jefes icónicos.', 80, 3, 'https://upload.wikimedia.org/wikipedia/en/b/be/Megaman2_box.jpg', '2024-12-04 22:30:11'),
	(15, 'Duck Hunt', 'Shooter', 19.990000, 'Juego de disparos con la famosa pistola Zapper.', 90, 3, 'https://upload.wikimedia.org/wikipedia/en/1/14/DuckHuntBox.jpg', '2024-12-04 22:30:11'),
	(16, 'Castlevania', 'Acción/Plataformas', 31.990000, 'Clásico de vampiros con el cazador Simon Belmont.', 70, 3, 'https://upload.wikimedia.org/wikipedia/en/5/51/Castlevania_1_cover.png', '2024-12-04 22:30:11'),
	(17, 'Punch-Out!!', 'Deportes', 24.990000, 'Juego de boxeo protagonizado por Little Mac.', 85, 3, 'https://upload.wikimedia.org/wikipedia/en/3/3d/Punch-out_mrdream_boxart.PNG', '2024-12-04 22:30:11'),
	(18, 'Excitebike', 'Carreras', 22.990000, 'Juego de carreras de motocross con diseño de pistas.', 60, 3, 'https://upload.wikimedia.org/wikipedia/en/f/f8/Excitebike_cover.jpg', '2024-12-04 22:30:11'),
	(19, 'Kirby\'s Adventure', 'Plataformas', 28.990000, 'Juego de plataformas con el adorable Kirby.', 75, 3, 'https://m.media-amazon.com/images/M/MV5BYWFjZmI0ODEtYjk4Yy00ZmRiLTg1ZDMtYTNkYTlhNDAxNDRiXkEyXkFqcGc@._V1_.jpg', '2024-12-04 22:30:11'),
	(20, 'Final Fantasy', 'RPG', 39.990000, 'El inicio de una de las sagas RPG más populares de la historia.', 50, 3, 'https://upload.wikimedia.org/wikipedia/en/d/d8/FF1_USA_boxart.jpg', '2024-12-04 22:30:11'),
	(21, 'Super Mario World', 'Plataformas', 34.990000, 'Juego de plataformas con Yoshi y una amplia variedad de niveles.', 150, 4, 'https://upload.wikimedia.org/wikipedia/en/3/32/Super_Mario_World_Coverart.png', '2024-12-04 22:33:15'),
	(22, 'The Legend of Zelda: A Link to the Past', 'Aventura', 39.990000, 'Una de las mejores entregas de Zelda con exploración y puzles memorables.', 120, 4, 'https://upload.wikimedia.org/wikipedia/en/2/21/The_Legend_of_Zelda_A_Link_to_the_Past_SNES_Game_Cover.jpg', '2024-12-04 22:33:15'),
	(23, 'Super Metroid', 'Acción/Aventura', 36.990000, 'Juego de exploración no lineal protagonizado por Samus Aran.', 100, 4, 'https://freebie.games/wp-content/uploads/2023/07/Super-Metroid.png', '2024-12-04 22:33:15'),
	(24, 'Donkey Kong Country', 'Plataformas', 31.990000, 'Juego de plataformas revolucionario con gráficos prerenderizados.', 90, 4, 'https://upload.wikimedia.org/wikipedia/en/1/1a/Donkey_Kong_Country_SNES_cover.png', '2024-12-04 22:33:15'),
	(25, 'Final Fantasy VI', 'RPG', 44.990000, 'Una de las mejores entregas de Final Fantasy con una historia épica.', 70, 4, 'https://www.retroplace.com/pics/snes/packshots/196865--final-fantasy-iii.png', '2024-12-04 22:33:15'),
	(26, 'Chrono Trigger', 'RPG', 49.990000, 'Clásico RPG con viajes en el tiempo y múltiples finales.', 80, 4, 'https://upload.wikimedia.org/wikipedia/en/a/a7/Chrono_Trigger.jpg', '2024-12-04 22:33:15'),
	(27, 'Street Fighter II', 'Lucha', 29.990000, 'Uno de los juegos de lucha más populares de todos los tiempos.', 110, 4, 'https://i.ytimg.com/vi/qm_KV1G-d0c/sddefault.jpg', '2024-12-04 22:33:15'),
	(28, 'Super Mario Kart', 'Carreras', 32.990000, 'El juego que inició la famosa serie de carreras de Mario.', 100, 4, 'https://upload.wikimedia.org/wikipedia/en/3/38/Supermariokart_box.JPG', '2024-12-04 22:33:15'),
	(29, 'Star Fox', 'Shooter', 30.990000, 'Innovador juego de naves con gráficos 3D gracias al chip Super FX.', 90, 4, 'https://assets-prd.ignimgs.com/2022/01/08/starfox-org-square-1641669681262.jpg', '2024-12-04 22:33:15'),
	(30, 'EarthBound', 'RPG', 45.990000, 'Un juego de rol único con humor y personajes entrañables.', 60, 4, 'https://upload.wikimedia.org/wikipedia/en/1/1f/EarthBound_Box.jpg', '2024-12-04 22:33:15'),
	(31, 'Sonic the Hedgehog', 'Plataformas', 29.990000, 'El icónico juego de Sonic que definió a Sega Genesis.', 140, 5, 'https://i.ebayimg.com/images/g/ghUAAOSw63dl6c-r/s-l400.jpg', '2024-12-04 23:28:57'),
	(32, 'Streets of Rage 2', 'Beat \'em up', 34.990000, 'Juego de peleas callejeras con acción cooperativa.', 100, 5, 'https://m.media-amazon.com/images/I/71jdWLSdY7L._AC_UF1000,1000_QL80_.jpg', '2024-12-04 23:28:57'),
	(33, 'Golden Axe', 'acción', 27.990000, 'Juego de acción y fantasía con múltiples personajes jugables.', 90, 5, 'https://upload.wikimedia.org/wikipedia/en/9/9c/Golden_Axe.jpg', '2024-12-04 23:28:57'),
	(34, 'Mortal Kombat', 'Lucha', 31.990000, 'Clásico de lucha famoso por su violencia y fatalities.', 120, 5, 'https://i.ebayimg.com/images/g/jA8AAOSw8gFkzr5l/s-l1200.jpg', '2024-12-04 23:28:57'),
	(35, 'Altered Beast', 'Acción', 26.990000, 'Juego de acción mitológica donde te transformas en bestias.', 80, 5, 'https://freebie.games/wp-content/uploads/2023/06/Altered-Beast.png', '2024-12-04 23:28:57'),
	(36, 'Shinobi III: Return of the Ninja Master', 'Acción/Plataformas', 33.990000, 'Un clásico de ninjas con combate fluido y niveles desafiantes.', 75, 5, 'https://upload.wikimedia.org/wikipedia/en/1/1c/Shinobi_III_Return_of_the_Ninja_Master.jpg', '2024-12-04 23:28:57'),
	(37, 'Gunstar Heroes', 'Run and Gun', 35.990000, 'Juego de disparos lleno de acción y combates frenéticos.', 60, 5, 'https://upload.wikimedia.org/wikipedia/en/8/80/Gunstar_Heroes.jpg', '2024-12-04 23:28:57'),
	(38, 'Castlevania: Bloodlines', 'Acción/Plataformas', 39.990000, 'Una excelente entrega de la saga Castlevania.', 50, 5, 'https://upload.wikimedia.org/wikipedia/en/thumb/a/af/Castlevania_Bloodlines.jpg/220px-Castlevania_Bloodlines.jpg', '2024-12-04 23:28:57'),
	(39, 'Phantasy Star IV', 'RPG', 44.990000, 'Un clásico RPG con historia profunda y exploración espacial.', 45, 5, 'https://media.gamestop.com/i/gamestop/10125861/Phantasy-Star-IV---Sega-Genesis', '2024-12-04 23:28:57'),
	(40, 'Ecco the Dolphin', 'Aventura', 28.990000, 'Juego único de exploración protagonizado por un delfín.', 70, 5, 'https://upload.wikimedia.org/wikipedia/en/c/c8/Ecco-cover.jpg', '2024-12-04 23:28:57'),
	(41, 'Final Fantasy VII', 'RPG', 44.990000, 'Un épico juego de rol que redefinió el género con gráficos revolucionarios.', 120, 6, 'https://upload.wikimedia.org/wikipedia/en/c/c2/Final_Fantasy_VII_Box_Art.jpg', '2024-12-04 23:29:26'),
	(42, 'Resident Evil', 'Survival Horror', 39.990000, 'El juego que popularizó el género de terror de supervivencia.', 90, 6, 'https://cdn.mobygames.com/covers/4152040-resident-evil-playstation-front-cover.jpg', '2024-12-04 23:29:26'),
	(43, 'Metal Gear Solid', 'Acción/Sigilo', 41.990000, 'Un juego de sigilo con una narrativa cinematográfica.', 85, 6, 'https://media.vandal.net/m/181/metal-gear-solid-201961220192328_1.jpg', '2024-12-04 23:29:26'),
	(44, 'Crash Bandicoot', 'Plataformas', 34.990000, 'El carismático marsupial en una aventura de plataformas.', 110, 6, 'https://media.vandal.net/m/1420/crash-bandicoot-201610518540_1.jpg', '2024-12-04 23:29:26'),
	(45, 'Spyro the Dragon', 'Plataformas', 32.990000, 'Aventura de plataformas protagonizada por un dragón púrpura.', 100, 6, 'https://www.thevideogamecompany.com/cdn/shop/products/spyro-the-dragon-sony-playstation-1-ps1-711719422822-cover-art.jpg?v=1657401852', '2024-12-04 23:29:26'),
	(46, 'Gran Turismo', 'Carreras', 37.990000, 'Un simulador de carreras revolucionario con vehículos realistas.', 95, 6, 'https://www.lukiegames.com/assets/images/PS1/ps1_gran_turismo_p_kxfx51.jpg', '2024-12-04 23:29:26'),
	(47, 'Tekken 3', 'Lucha', 36.990000, 'Uno de los mejores juegos de lucha de todos los tiempos.', 109, 6, 'https://www.thevideogamecompany.com/cdn/shop/products/tekken-3-sony-playstation-1-ps1-722674020794-cover-art.jpg?v=1657402086', '2024-12-04 23:29:26'),
	(48, 'Castlevania: Symphony of the Night', 'Acción/Aventura', 39.990000, 'Un clásico de acción con elementos de exploración.', 70, 6, 'https://i.pinimg.com/originals/84/6b/85/846b856a423e022a31cdd5742a0081e9.png', '2024-12-04 23:29:26'),
	(49, 'Tomb Raider', 'Aventura', 35.990000, 'La aventura icónica de Lara Croft en 3D.', 80, 6, 'https://i.ebayimg.com/images/g/2d0AAOxymiVQ9xsQ/s-l400.jpg', '2024-12-04 23:29:26'),
	(50, 'Tony Hawk\'s Pro Skater 2', 'Deportes', 29.990000, 'Un simulador de skateboarding con trucos y niveles memorables.', 95, 6, 'https://upload.wikimedia.org/wikipedia/en/4/41/Tony_Hawk%27s_Pro_Skater_2_cover.png', '2024-12-04 23:29:26'),
	(51, 'Super Mario 64', 'Plataformas', 39.990000, 'Un revolucionario juego de plataformas en 3D.', 150, 7, 'https://upload.wikimedia.org/wikipedia/en/6/6a/Super_Mario_64_box_cover.jpg', '2024-12-04 23:44:11'),
	(52, 'The Legend of Zelda: Ocarina of Time', 'Aventura', 44.990000, 'Considerado uno de los mejores juegos de todos los tiempos.', 120, 7, 'https://upload.wikimedia.org/wikipedia/en/5/57/The_Legend_of_Zelda_Ocarina_of_Time.jpg', '2024-12-04 23:44:11'),
	(53, 'GoldenEye 007', 'Shooter', 34.990000, 'El shooter multijugador que definió una era.', 110, 7, 'https://upload.wikimedia.org/wikipedia/en/3/36/GoldenEye007box.jpg', '2024-12-04 23:44:11'),
	(54, 'Mario Kart 64', 'Carreras', 37.990000, 'Juego de carreras de karts con multijugador local.', 140, 7, 'https://m.media-amazon.com/images/M/MV5BOTljNDc5MDctNzBkOS00MzkzLThjNzAtZmZmOWQyY2Y1Zjk3XkEyXkFqcGc@.V1_FMjpg_UX1000.jpg', '2024-12-04 23:44:11'),
	(55, 'Donkey Kong 64', 'Plataformas', 35.990000, 'Una aventura en 3D con Donkey Kong y sus amigos.', 100, 7, 'https://i.ebayimg.com/images/g/5x8AAOSwXLJkhVqM/s-l1200.jpg', '2024-12-04 23:44:11'),
	(56, 'Star Fox 64', 'Shooter', 36.990000, 'Juego de naves con gráficos avanzados y control preciso.', 90, 7, 'https://upload.wikimedia.org/wikipedia/en/6/63/StarFox64_N64_Game_Box.jpg', '2024-12-04 23:44:11'),
	(57, 'Super Smash Bros.', 'Lucha', 32.990000, 'El inicio de la popular saga de lucha multijugador.', 130, 7, 'https://upload.wikimedia.org/wikipedia/en/4/42/Supersmashbox.jpg', '2024-12-04 23:44:11'),
	(58, 'Banjo-Kazooie', 'Plataformas', 38.990000, 'Aventura de plataformas con personajes entrañables.', 85, 7, 'https://upload.wikimedia.org/wikipedia/en/1/12/Banjo_Kazooie_Cover.png', '2024-12-04 23:44:11'),
	(59, 'Perfect Dark', 'Shooter', 35.990000, 'Un shooter futurista con mecánicas avanzadas.', 75, 7, 'https://images.wikidexcdn.net/mwuploads/esssbwiki/thumb/3/3d/latest/20130922140200/Caratula_Perfect_Dark.jpg/1200px-Caratula_Perfect_Dark.jpg', '2024-12-04 23:44:11'),
	(60, 'Paper Mario', 'RPG', 41.990000, 'Un RPG con un estilo gráfico único y una historia encantadora.', 65, 7, 'https://upload.wikimedia.org/wikipedia/en/6/61/Papermario.jpg', '2024-12-04 23:44:11'),
	(61, 'Sonic Adventure', 'Plataformas', 39.990000, 'El regreso de Sonic en 3D, con múltiples personajes y una gran aventura.', 120, 8, 'https://media.gamestop.com/i/gamestop/10122558/Sonic-Adventure---Sega-Dreamcast?$pdp$', '2024-12-04 23:59:51'),
	(62, 'Shenmue', 'Aventura', 44.990000, 'Una épica aventura de mundo abierto con gráficos revolucionarios.', 100, 8, 'https://upload.wikimedia.org/wikipedia/en/e/e2/ShenmueDCbox.jpg', '2024-12-04 23:59:51'),
	(63, 'Crazy Taxi', 'Carreras/Arcade', 29.990000, 'Conduce un taxi loco en una frenética búsqueda de pasajeros.', 140, 8, 'https://media.gamestop.com/i/gamestop/10122559/Crazy-Taxi---Sega-Dreamcast?$pdp$', '2024-12-04 23:59:51'),
	(64, 'SoulCalibur', 'Lucha', 34.990000, 'Juego de lucha en 3D conocido por su fluidez y gráficos avanzados.', 110, 8, 'https://retroravengames.com/cdn/shop/products/soulcalibur_580x.jpg?v=1614013560', '2024-12-04 23:59:51'),
	(65, 'Jet Set Radio', 'Acción', 36.990000, 'Juego estilizado de patinaje y graffiti con música inolvidable.', 95, 8, 'https://i.ebayimg.com/images/g/nIIAAOSw8b1gO35J/s-l1200.jpg', '2024-12-04 23:59:51'),
	(66, 'Resident Evil Code: Veronica', 'Survival Horror', 41.990000, 'Nueva entrega de la saga Resident Evil con narrativa mejorada.', 85, 8, 'https://nightwingvideogamereproductions.net/cdn/shop/products/20220226_042615_1024x1024.jpg?v=1645932116', '2024-12-04 23:59:51'),
	(67, 'Marvel vs. Capcom 2', 'Lucha', 39.990000, 'Lucha entre héroes de Marvel y personajes de Capcom en equipos de 3.', 75, 8, 'https://media.gamestop.com/i/gamestop/10122593/Marvel-vs.-Capcom-2---Sega-Dreamcast?$pdp$', '2024-12-04 23:59:51'),
	(68, 'Skies of Arcadia', 'RPG', 42.990000, 'Un RPG épico ambientado en un mundo de piratas aéreos.', 60, 8, 'https://upload.wikimedia.org/wikipedia/en/6/65/ArcadiaDC.png', '2024-12-04 23:59:51'),
	(69, 'Virtua Tennis', 'Deportes', 28.990000, 'Juego de tenis con controles precisos y diversión arcade.', 130, 8, 'https://i.ebayimg.com/images/g/EqAAAOSwPUZbXFdn/s-l1600.jpg', '2024-12-04 23:59:51'),
	(70, 'Phantasy Star Online', 'RPG/Online', 39.990000, 'Uno de los primeros RPG multijugador en línea para consolas.', 50, 8, 'https://m.media-amazon.com/images/I/81+Qb6bqvzL._AC_UF1000,1000_QL80_.jpg', '2024-12-04 23:59:51'),
	(71, 'Tetris', 'Puzzle', 19.990000, 'El adictivo juego de rompecabezas que impulsó las ventas de la consola.', 200, 9, 'https://upload.wikimedia.org/wikipedia/en/4/4a/Tetris_Boxshot.jpg', '2024-12-05 00:22:01'),
	(72, 'Pokémon Red', 'RPG', 29.990000, 'Primera entrega de la saga Pokémon, donde coleccionas y entrenas criaturas.', 150, 9, 'https://m.media-amazon.com/images/I/71aow5iRsfL._AC_UF1000,1000_QL80_.jpg', '2024-12-05 00:22:01'),
	(73, 'The Legend of Zelda: Link’s Awakening', 'Aventura', 34.990000, 'Una entrega única de Zelda diseñada específicamente para Game Boy.', 100, 9, 'https://upload.wikimedia.org/wikipedia/en/c/c1/Link%27s_Awakening.png', '2024-12-05 00:22:01'),
	(74, 'Super Mario Land', 'Plataformas', 24.990000, 'El debut portátil de Mario en un mundo completamente nuevo.', 180, 9, 'https://upload.wikimedia.org/wikipedia/en/2/22/Super-mario-land-gameboy-boxart.png', '2024-12-05 00:22:01'),
	(75, 'Kirby’s Dream Land', 'Plataformas', 21.990000, 'La primera aventura de Kirby, un adorable héroe que puede absorber enemigos.', 120, 9, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmO_DnPRXIPVpvlZ30xWOAWpkCSZSjEHf7OA&s', '2024-12-05 00:22:01'),
	(76, 'Metroid II: Return of Samus', 'Acción/Aventura', 27.990000, 'La secuela de Metroid que expandió la historia de Samus Aran.', 90, 9, 'https://upload.wikimedia.org/wikipedia/en/9/93/Metroid2_boxart.jpg', '2024-12-05 00:22:01'),
	(77, 'Donkey Kong', 'Puzzle/Plataformas', 22.990000, 'Una versión ampliada del clásico arcade con elementos innovadores.', 140, 9, 'https://upload.wikimedia.org/wikipedia/en/2/23/Donkey_Kong_94_box_art.jpg', '2024-12-05 00:22:01'),
	(78, 'Dr. Mario', 'Puzzle', 19.990000, 'Un juego de rompecabezas donde eliminas virus con píldoras de colores.', 130, 9, 'https://www.lukiegames.com/assets/images/GB/gb_dr_mario_p_r2571i.jpg', '2024-12-05 00:22:01'),
	(79, 'Final Fantasy Adventure', 'RPG', 29.990000, 'Un precursor de la serie Mana, con acción y exploración.', 80, 9, 'https://upload.wikimedia.org/wikipedia/en/c/ca/Final-Fantasy-Adventure-GameBoy-Boxart.png', '2024-12-05 00:22:01'),
	(80, 'Wario Land: Super Mario Land 3', 'Plataformas', 26.990000, 'El debut de Wario como protagonista en un juego único de plataformas.', 110, 9, 'https://upload.wikimedia.org/wikipedia/en/7/78/Wario-land-gameboy-boxart.png', '2024-12-05 00:22:01'),
	(81, 'Grand Theft Auto: San Andreas', 'Acción/Aventura', 29.990000, 'Juego de mundo abierto donde controlas a CJ en su regreso a Los Santos.', 150, 10, 'https://i.ebayimg.com/images/g/76wAAOSwPGBfnI0R/s-l500.jpg', '2024-12-05 11:07:24'),
	(82, 'Metal Gear Solid 3: Snake Eater', 'Sigilo', 34.990000, 'Una obra maestra de sigilo con una historia profunda.', 120, 10, 'https://media.vandal.net/m/1482/20041224183037_1.jpg', '2024-12-05 11:07:24'),
	(83, 'Final Fantasy X', 'RPG', 39.990000, 'La primera entrega de Final Fantasy para PS2 con gráficos en 3D completos.', 130, 10, 'https://upload.wikimedia.org/wikipedia/en/a/a7/Ffxboxart.jpg', '2024-12-05 11:07:24'),
	(84, 'God of War', 'Acción/Aventura', 29.990000, 'Juego de acción épico que sigue la historia de Kratos.', 140, 10, 'https://media.vandal.net/m/3268/200562215934_1.jpg', '2024-12-05 11:07:24'),
	(85, 'Shadow of the Colossus', 'Aventura', 32.990000, 'Una experiencia única de derrotar gigantes colosos.', 100, 10, 'https://media.vandal.net/m/1903/20051224193432_1.jpg', '2024-12-05 11:07:24'),
	(86, 'Kingdom Hearts', 'RPG', 37.990000, 'Una mezcla mágica de Disney y Square Enix en un RPG.', 110, 10, 'https://media.vandal.net/m/3011/200610102659_1.jpg', '2024-12-05 11:07:24'),
	(87, 'Resident Evil 4', 'Survival Horror', 39.990000, 'Revolucionó el género con su jugabilidad y atmósfera.', 125, 10, 'https://m.media-amazon.com/images/I/71iXh6wFHNL._SL1500_.jpg', '2024-12-05 11:07:24'),
	(88, 'Jak and Daxter: The Precursor Legacy', 'Plataformas', 28.990000, 'Aventura de plataformas con un mundo abierto y fluidez en la jugabilidad.', 150, 10, 'https://media.vandal.net/m/693/jak-and-daxter-the-precursor-legacy-20161012121052_1.jpg', '2024-12-05 11:07:24'),
	(89, 'Devil May Cry 3: Dante\'s Awakening', 'Acción', 34.990000, 'Precuela que presenta al joven Dante con combate dinámico.', 90, 10, 'https://www.retroplace.com/pics/ps2/packshots/73733--devil-may-cry-3-dantes-awakening.png', '2024-12-05 11:07:24'),
	(90, 'Gran Turismo 4', 'Carreras', 25.990000, 'Simulador de carreras con un nivel de detalle impresionante.', 200, 10, 'https://i.pinimg.com/474x/7d/d2/b6/7dd2b6da282b0fc50c7a39279f73a32c.jpg', '2024-12-05 11:07:24'),
	(91, 'Halo 3', 'FPS', 29.990000, 'La épica conclusión de la trilogía original de Halo.', 200, 11, 'https://m.media-amazon.com/images/I/813gXz6Vi0L.jpg', '2024-12-05 11:38:49'),
	(92, 'Gears of War', 'TPS', 34.990000, 'Revolucionó los shooters en tercera persona con su sistema de cobertura.', 180, 11, 'https://i5-mx.walmartimages.com/mg/gm/3pp/asr/a8a361ae-7e64-4389-be88-5af13cc2872d.36a6eb1df1ca983e5b88f072314273d0.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF', '2024-12-05 11:38:49'),
	(93, 'The Elder Scrolls V: Skyrim', 'RPG', 39.990000, 'Un vasto mundo abierto lleno de aventuras y dragones.', 150, 11, 'https://m.media-amazon.com/images/I/91NVln5RVFL.jpg', '2024-12-05 11:38:49'),
	(94, 'Red Dead Redemption', 'Acción/Aventura', 29.990000, 'Un western épico de mundo abierto desarrollado por Rockstar.', 170, 11, 'https://www.todoconsolas.com/457-large_default/red_dead_redemption_xbox360_sp_po0187.jpg', '2024-12-05 11:38:49'),
	(95, 'Mass Effect 2', 'RPG/Acción', 35.990000, 'Un juego de rol cinemático con una narrativa envolvente.', 140, 11, 'https://m.media-amazon.com/images/I/71XQcMKeK7L._AC_UF894,1000_QL80_.jpg', '2024-12-05 11:38:49'),
	(96, 'Call of Duty: Modern Warfare 2', 'FPS', 25.990000, 'Un shooter de acción trepidante con un multijugador icónico.', 200, 11, 'https://m.media-amazon.com/images/I/717R001a7VL._AC_UF350,350_QL50_.jpg', '2024-12-05 11:38:49'),
	(97, 'Fable II', 'RPG', 32.990000, 'El encantador RPG de Lionhead Studios lleno de elecciones.', 130, 11, 'https://m.media-amazon.com/images/I/71OPYlisAxL._SL1215_.jpg', '2024-12-05 11:38:49'),
	(98, 'Batman: Arkham City', 'Acción/Aventura', 29.990000, 'Un juego de acción que establece un nuevo estándar para juegos de superhéroes.', 160, 11, 'https://m.media-amazon.com/images/I/71Wi4p59OAL._AC_UF894,1000_QL80_.jpg', '2024-12-05 11:38:49'),
	(99, 'BioShock', 'FPS', 27.990000, 'Un shooter atmosférico ambientado en la ciudad submarina de Rapture.', 140, 11, 'https://i.ebayimg.com/images/g/LbkAAOSw~R9mPqLd/s-l1200.jpg', '2024-12-05 11:38:49'),
	(100, 'Forza Motorsport 4', 'Carreras', 28.990000, 'Un simulador de carreras impresionante exclusivo de Xbox 360.', 200, 11, 'https://s.pacn.ws/1/p/bm/pa.209401.1.jpg?v=lw2jhc', '2024-12-05 11:38:49');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
