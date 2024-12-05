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

-- Volcando estructura para tabla tienda_videojuegos_retro.compras
DROP TABLE IF EXISTS `compras`;
CREATE TABLE IF NOT EXISTS `compras` (
  `id_compra` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `total` decimal(20,6) DEFAULT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `FK_compras_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla tienda_videojuegos_retro.compras: ~0 rows (aproximadamente)

-- Volcando estructura para tabla tienda_videojuegos_retro.consolas
DROP TABLE IF EXISTS `consolas`;
CREATE TABLE IF NOT EXISTS `consolas` (
  `id_consola` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `anio_lanzamiento` int(11) DEFAULT NULL,
  `informacion` text DEFAULT NULL,
  `imagen` text DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id_consola`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla tienda_videojuegos_retro.consolas: ~10 rows (aproximadamente)
INSERT INTO `consolas` (`id_consola`, `nombre`, `marca`, `precio`, `stock`, `anio_lanzamiento`, `informacion`, `imagen`, `fecha_creacion`) VALUES
	(2, 'Atari 2600', 'Atari', 80, 50, 1977, 'Primera consola masivamente adoptada que popularizó los videojuegos.', 'https://upload.wikimedia.org/wikipedia/commons/b/b9/Atari-2600-Wood-4Sw-Set.jpg', '2024-12-04 20:17:32'),
	(3, 'Nintendo Entertainment System (NES)', 'Nintendo', 100, 30, 1985, 'Consola icónica que introdujo juegos como Mario Bros y Zelda.', 'https://i.ebayimg.com/images/g/AD4AAOSw3YphYRwA/s-l400.jpg', '2024-12-04 20:17:32'),
	(4, 'Super Nintendo Entertainment System (SNES)', 'Nintendo', 120, 40, 1990, 'La sucesora del NES con gráficos mejorados y títulos memorables.', 'https://i.ebayimg.com/images/g/ImQAAOSwJU9lYkPc/s-l400.jpg', '2024-12-04 20:17:32'),
	(5, 'Sega Genesis', 'Sega', 70, 35, 1988, 'Competencia directa del SNES con títulos como Sonic.', 'https://m.media-amazon.com/images/I/71TzmD6BpwL.jpg', '2024-12-04 20:17:32'),
	(6, 'Sony PlayStation', 'Sony', 70, 25, 1994, 'La primera consola de Sony que revolucionó los videojuegos en CD.', 'https://i.ebayimg.com/images/g/-tAAAOSwHWtcvJzb/s-l500.jpg', '2024-12-04 20:17:32'),
	(7, 'Nintendo 64', 'Nintendo', 120, 45, 1996, 'Consola que introdujo juegos en 3D como Super Mario 64 y Zelda Ocarina of Time.', 'https://i.ebayimg.com/00/s/MTIwMFgxNjAw/z/Y8UAAOSwTxhfFQ~b/$_12.JPG?set_id=880000500F', '2024-12-04 20:17:32'),
	(8, 'Sega Dreamcast', 'Sega', 80, 20, 1999, 'Última consola de Sega con juegos innovadores como Sonic Adventure.', 'https://i.ebayimg.com/images/g/HloAAOSwao9ho5Cq/s-l400.jpg', '2024-12-04 20:17:32'),
	(9, 'Game Boy', 'Nintendo', 50, 60, 1989, 'Consola portátil que revolucionó los videojuegos móviles con títulos como Tetris.', 'https://i.ebayimg.com/images/g/HloAAOSwao9ho5Cq/s-l400.jpg', '2024-12-04 20:17:32'),
	(10, 'PlayStation 2', 'Sony', 70, 70, 2000, 'Consola más vendida de todos los tiempos con un vasto catálogo de juegos.', 'https://media.zenfs.com/es/tarreo_527/29c0b45204ece6618d3500f9559bea9a', '2024-12-04 20:17:32'),
	(11, 'Xbox', 'Microsoft', 60, 30, 2001, 'Primera consola de Microsoft que popularizó Xbox Live.', 'https://i.ebayimg.com/images/g/RswAAOSw8s1kRXI3/s-l1200.jpg', '2024-12-04 20:17:32');

-- Volcando estructura para tabla tienda_videojuegos_retro.detalles_compra
DROP TABLE IF EXISTS `detalles_compra`;
CREATE TABLE IF NOT EXISTS `detalles_compra` (
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `id_compra` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id_detalle`),
  KEY `id_compra` (`id_compra`),
  CONSTRAINT `FK_detalles_compra_compras` FOREIGN KEY (`id_compra`) REFERENCES `compras` (`id_compra`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla tienda_videojuegos_retro.detalles_compra: ~0 rows (aproximadamente)

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
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `email` text DEFAULT NULL,
  `rol` varchar(50) DEFAULT NULL,
  `contrasena` varchar(70) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id_usuario`),
  KEY `rol` (`rol`),
  CONSTRAINT `FK_usuarios_rol` FOREIGN KEY (`rol`) REFERENCES `rol` (`rol`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla tienda_videojuegos_retro.usuarios: ~3 rows (aproximadamente)
INSERT INTO `usuarios` (`id_usuario`, `nombre`, `email`, `rol`, `contrasena`, `fecha_creacion`) VALUES
	(1, 'Admin', 'prueba.admin@gmail.com', 'Admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2024-12-04 09:40:08'),
	(6, 'Carlos', 'carv2012@gmail.com', 'Usuario', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', '2024-12-04 17:13:12'),
	(7, 'Jorge', 'jorge@gmail.com', 'Usuario', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', '2024-12-04 21:19:56');

-- Volcando estructura para procedimiento tienda_videojuegos_retro.VerConsolas
DROP PROCEDURE IF EXISTS `VerConsolas`;
DELIMITER //
CREATE PROCEDURE `VerConsolas`()
BEGIN
	SELECT 
	consolas.id_consola,
	consolas.nombre,
	consolas.marca,
	consolas.precio,
	consolas.stock,
	consolas.anio_lanzamiento,
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
	SELECT id_usuario, nombre, email, rol 
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
	v.id_videojuego,
	v.nombre,
	v.genero,
	v.precio,
	v.informacion,
	v.stock,
	c.nombre AS consola,
	v.imagen
	FROM videojuegos AS v
	LEFT JOIN consolas AS c ON c.id_consola = v.id_consola;
END//
DELIMITER ;

-- Volcando estructura para tabla tienda_videojuegos_retro.videojuegos
DROP TABLE IF EXISTS `videojuegos`;
CREATE TABLE IF NOT EXISTS `videojuegos` (
  `id_videojuego` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `genero` varchar(50) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `informacion` text DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `id_consola` int(11) DEFAULT NULL,
  `imagen` text DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id_videojuego`),
  KEY `id_consola` (`id_consola`),
  CONSTRAINT `FK_videojuegos_consolas` FOREIGN KEY (`id_consola`) REFERENCES `consolas` (`id_consola`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla tienda_videojuegos_retro.videojuegos: ~80 rows (aproximadamente)
INSERT INTO `videojuegos` (`id_videojuego`, `nombre`, `genero`, `precio`, `informacion`, `stock`, `id_consola`, `imagen`, `fecha_creacion`) VALUES
	(1, 'Pac-Man', 'Arcade', 19.99, 'Versión para Atari del clásico arcade, un éxito mundial.', 100, 2, 'https://steelcollectibles.com/cdn/shop/products/jm_786x.jpg?v=1656093740', '2024-12-04 20:48:07'),
	(2, 'Space Invaders', 'Arcade', 24.99, 'Pionero de los juegos de disparos, con alienígenas como enemigos.', 80, 2, 'https://moviegalorestore.com/wp-content/uploads/2024/01/20240111_142521.jpg', '2024-12-04 20:48:07'),
	(3, 'Pitfall!', 'Aventura', 29.99, 'Uno de los primeros juegos de plataformas, desarrollado por Activision.', 60, 2, 'https://i.ebayimg.com/images/g/0wEAAOSwrvhnFXVz/s-l1600.jpg', '2024-12-04 20:48:07'),
	(4, 'Asteroids', 'Arcade', 22.99, 'Juego espacial de disparos donde destruyes asteroides y sobrevives.', 70, 2, 'https://www.atarimania.com/2600/boxes/hi_res/asteroids_color_cart_12.jpg', '2024-12-04 20:48:07'),
	(5, 'Adventure', 'Aventura', 27.99, 'Primer juego de acción y aventura, influyente en RPGs modernos.', 50, 2, 'https://www.atarimania.com/2600/boxes/hi_res/adventure_color_pal_cart.jpg', '2024-12-04 20:48:07'),
	(6, 'Breakout', 'Puzzle', 18.99, 'Juego tipo arcade que inspiró a Arkanoid.', 90, 2, 'https://curiouscrowcompany.com/cdn/shop/files/IMG_6910.jpg?v=1708212478', '2024-12-04 20:48:07'),
	(7, 'Centipede', 'Arcade', 21.99, 'Juego de disparos con estrategia donde eliminas insectos invasores.', 85, 2, 'https://retroravengames.com/cdn/shop/products/centipede_ad7ce309-3eb2-4569-b4be-a51de4b17e0a_580x.jpg?v=1632497960', '2024-12-04 20:48:07'),
	(8, 'Missile Command', 'Arcade', 23.99, 'Protege tus ciudades de un ataque de misiles en este clásico.', 75, 2, 'https://www.atarimania.com/2600/boxes/hi_res/missile_command_color_cart.jpg', '2024-12-04 20:48:07'),
	(9, 'Frogger', 'Puzzle', 26.99, 'Ayuda a la rana a cruzar carreteras y ríos llenos de obstáculos.', 65, 2, 'https://www.atarimania.com/2600/boxes/hi_res/frogger_standard_cart_6.jpg', '2024-12-04 20:48:07'),
	(10, 'Combat', 'Acción', 15.99, 'Multijugador con vehículos como tanques y aviones.', 120, 2, 'https://www.atarimania.com/2600/boxes/hi_res/combat_text_gatefold_cart.jpg', '2024-12-04 20:48:07'),
	(11, 'Super Mario Bros.', 'Plataformas', 29.99, 'El icónico juego de Mario que definió el género de plataformas.', 150, 3, 'https://ia801401.us.archive.org/14/items/super-mario-bros-nes/00_coverscreenshot.png', '2024-12-04 22:30:11'),
	(12, 'The Legend of Zelda', 'Aventura', 34.99, 'Aventura épica con exploración y resolución de acertijos.', 120, 3, 'https://upload.wikimedia.org/wikipedia/en/4/41/Legend_of_zelda_cover_%28with_cartridge%29_gold.png', '2024-12-04 22:30:11'),
	(13, 'Metroid', 'Acción/Aventura', 32.99, 'Juego de exploración no lineal protagonizado por Samus Aran.', 100, 3, 'https://static.wixstatic.com/media/112fd3_2aea3e6db9a34c97afc09ac361ddb101.png/v1/fill/w_420,h_575,al_c,lg_1,q_85,enc_auto/112fd3_2aea3e6db9a34c97afc09ac361ddb101.png', '2024-12-04 22:30:11'),
	(14, 'Mega Man 2', 'Acción/Plataformas', 27.99, 'Clásico juego de acción con batallas contra jefes icónicos.', 80, 3, 'https://upload.wikimedia.org/wikipedia/en/b/be/Megaman2_box.jpg', '2024-12-04 22:30:11'),
	(15, 'Duck Hunt', 'Shooter', 19.99, 'Juego de disparos con la famosa pistola Zapper.', 90, 3, 'https://upload.wikimedia.org/wikipedia/en/1/14/DuckHuntBox.jpg', '2024-12-04 22:30:11'),
	(16, 'Castlevania', 'Acción/Plataformas', 31.99, 'Clásico de vampiros con el cazador Simon Belmont.', 70, 3, 'https://upload.wikimedia.org/wikipedia/en/5/51/Castlevania_1_cover.png', '2024-12-04 22:30:11'),
	(17, 'Punch-Out!!', 'Deportes', 24.99, 'Juego de boxeo protagonizado por Little Mac.', 85, 3, 'https://upload.wikimedia.org/wikipedia/en/3/3d/Punch-out_mrdream_boxart.PNG', '2024-12-04 22:30:11'),
	(18, 'Excitebike', 'Carreras', 22.99, 'Juego de carreras de motocross con diseño de pistas.', 60, 3, 'https://upload.wikimedia.org/wikipedia/en/f/f8/Excitebike_cover.jpg', '2024-12-04 22:30:11'),
	(19, 'Kirby\'s Adventure', 'Plataformas', 28.99, 'Juego de plataformas con el adorable Kirby.', 75, 3, 'https://m.media-amazon.com/images/M/MV5BYWFjZmI0ODEtYjk4Yy00ZmRiLTg1ZDMtYTNkYTlhNDAxNDRiXkEyXkFqcGc@._V1_.jpg', '2024-12-04 22:30:11'),
	(20, 'Final Fantasy', 'RPG', 39.99, 'El inicio de una de las sagas RPG más populares de la historia.', 50, 3, 'https://upload.wikimedia.org/wikipedia/en/d/d8/FF1_USA_boxart.jpg', '2024-12-04 22:30:11'),
	(21, 'Super Mario World', 'Plataformas', 34.99, 'Juego de plataformas con Yoshi y una amplia variedad de niveles.', 150, 4, 'https://upload.wikimedia.org/wikipedia/en/3/32/Super_Mario_World_Coverart.png', '2024-12-04 22:33:15'),
	(22, 'The Legend of Zelda: A Link to the Past', 'Aventura', 39.99, 'Una de las mejores entregas de Zelda con exploración y puzles memorables.', 120, 4, 'https://upload.wikimedia.org/wikipedia/en/2/21/The_Legend_of_Zelda_A_Link_to_the_Past_SNES_Game_Cover.jpg', '2024-12-04 22:33:15'),
	(23, 'Super Metroid', 'Acción/Aventura', 36.99, 'Juego de exploración no lineal protagonizado por Samus Aran.', 100, 4, 'https://freebie.games/wp-content/uploads/2023/07/Super-Metroid.png', '2024-12-04 22:33:15'),
	(24, 'Donkey Kong Country', 'Plataformas', 31.99, 'Juego de plataformas revolucionario con gráficos prerenderizados.', 90, 4, 'https://upload.wikimedia.org/wikipedia/en/1/1a/Donkey_Kong_Country_SNES_cover.png', '2024-12-04 22:33:15'),
	(25, 'Final Fantasy VI', 'RPG', 44.99, 'Una de las mejores entregas de Final Fantasy con una historia épica.', 70, 4, 'https://www.retroplace.com/pics/snes/packshots/196865--final-fantasy-iii.png', '2024-12-04 22:33:15'),
	(26, 'Chrono Trigger', 'RPG', 49.99, 'Clásico RPG con viajes en el tiempo y múltiples finales.', 80, 4, 'https://upload.wikimedia.org/wikipedia/en/a/a7/Chrono_Trigger.jpg', '2024-12-04 22:33:15'),
	(27, 'Street Fighter II', 'Lucha', 29.99, 'Uno de los juegos de lucha más populares de todos los tiempos.', 110, 4, 'https://i.ytimg.com/vi/qm_KV1G-d0c/sddefault.jpg', '2024-12-04 22:33:15'),
	(28, 'Super Mario Kart', 'Carreras', 32.99, 'El juego que inició la famosa serie de carreras de Mario.', 100, 4, 'https://upload.wikimedia.org/wikipedia/en/3/38/Supermariokart_box.JPG', '2024-12-04 22:33:15'),
	(29, 'Star Fox', 'Shooter', 30.99, 'Innovador juego de naves con gráficos 3D gracias al chip Super FX.', 90, 4, 'https://assets-prd.ignimgs.com/2022/01/08/starfox-org-square-1641669681262.jpg', '2024-12-04 22:33:15'),
	(30, 'EarthBound', 'RPG', 45.99, 'Un juego de rol único con humor y personajes entrañables.', 60, 4, 'https://upload.wikimedia.org/wikipedia/en/1/1f/EarthBound_Box.jpg', '2024-12-04 22:33:15'),
	(31, 'Sonic the Hedgehog', 'Plataformas', 29.99, 'El icónico juego de Sonic que definió a Sega Genesis.', 140, 5, 'https://i.ebayimg.com/images/g/ghUAAOSw63dl6c-r/s-l400.jpg', '2024-12-04 23:28:57'),
	(32, 'Streets of Rage 2', 'Beat \'em up', 34.99, 'Juego de peleas callejeras con acción cooperativa.', 100, 5, 'https://m.media-amazon.com/images/I/71jdWLSdY7L._AC_UF1000,1000_QL80_.jpg', '2024-12-04 23:28:57'),
	(33, 'Golden Axe', 'acción', 27.99, 'Juego de acción y fantasía con múltiples personajes jugables.', 90, 5, 'https://upload.wikimedia.org/wikipedia/en/9/9c/Golden_Axe.jpg', '2024-12-04 23:28:57'),
	(34, 'Mortal Kombat', 'Lucha', 31.99, 'Clásico de lucha famoso por su violencia y fatalities.', 120, 5, 'https://i.ebayimg.com/images/g/jA8AAOSw8gFkzr5l/s-l1200.jpg', '2024-12-04 23:28:57'),
	(35, 'Altered Beast', 'Acción', 26.99, 'Juego de acción mitológica donde te transformas en bestias.', 80, 5, 'https://freebie.games/wp-content/uploads/2023/06/Altered-Beast.png', '2024-12-04 23:28:57'),
	(36, 'Shinobi III: Return of the Ninja Master', 'Acción/Plataformas', 33.99, 'Un clásico de ninjas con combate fluido y niveles desafiantes.', 75, 5, 'https://upload.wikimedia.org/wikipedia/en/1/1c/Shinobi_III_Return_of_the_Ninja_Master.jpg', '2024-12-04 23:28:57'),
	(37, 'Gunstar Heroes', 'Run and Gun', 35.99, 'Juego de disparos lleno de acción y combates frenéticos.', 60, 5, 'https://upload.wikimedia.org/wikipedia/en/8/80/Gunstar_Heroes.jpg', '2024-12-04 23:28:57'),
	(38, 'Castlevania: Bloodlines', 'Acción/Plataformas', 39.99, 'Una excelente entrega de la saga Castlevania.', 50, 5, 'https://upload.wikimedia.org/wikipedia/en/thumb/a/af/Castlevania_Bloodlines.jpg/220px-Castlevania_Bloodlines.jpg', '2024-12-04 23:28:57'),
	(39, 'Phantasy Star IV', 'RPG', 44.99, 'Un clásico RPG con historia profunda y exploración espacial.', 45, 5, 'https://media.gamestop.com/i/gamestop/10125861/Phantasy-Star-IV---Sega-Genesis', '2024-12-04 23:28:57'),
	(40, 'Ecco the Dolphin', 'Aventura', 28.99, 'Juego único de exploración protagonizado por un delfín.', 70, 5, 'https://upload.wikimedia.org/wikipedia/en/c/c8/Ecco-cover.jpg', '2024-12-04 23:28:57'),
	(41, 'Final Fantasy VII', 'RPG', 44.99, 'Un épico juego de rol que redefinió el género con gráficos revolucionarios.', 120, 6, 'https://upload.wikimedia.org/wikipedia/en/c/c2/Final_Fantasy_VII_Box_Art.jpg', '2024-12-04 23:29:26'),
	(42, 'Resident Evil', 'Survival Horror', 39.99, 'El juego que popularizó el género de terror de supervivencia.', 90, 6, 'https://cdn.mobygames.com/covers/4152040-resident-evil-playstation-front-cover.jpg', '2024-12-04 23:29:26'),
	(43, 'Metal Gear Solid', 'Acción/Sigilo', 41.99, 'Un juego de sigilo con una narrativa cinematográfica.', 85, 6, 'https://media.vandal.net/m/181/metal-gear-solid-201961220192328_1.jpg', '2024-12-04 23:29:26'),
	(44, 'Crash Bandicoot', 'Plataformas', 34.99, 'El carismático marsupial en una aventura de plataformas.', 110, 6, 'https://media.vandal.net/m/1420/crash-bandicoot-201610518540_1.jpg', '2024-12-04 23:29:26'),
	(45, 'Spyro the Dragon', 'Plataformas', 32.99, 'Aventura de plataformas protagonizada por un dragón púrpura.', 100, 6, 'https://www.thevideogamecompany.com/cdn/shop/products/spyro-the-dragon-sony-playstation-1-ps1-711719422822-cover-art.jpg?v=1657401852', '2024-12-04 23:29:26'),
	(46, 'Gran Turismo', 'Carreras', 37.99, 'Un simulador de carreras revolucionario con vehículos realistas.', 95, 6, 'https://www.lukiegames.com/assets/images/PS1/ps1_gran_turismo_p_kxfx51.jpg', '2024-12-04 23:29:26'),
	(47, 'Tekken 3', 'Lucha', 36.99, 'Uno de los mejores juegos de lucha de todos los tiempos.', 110, 6, 'https://www.thevideogamecompany.com/cdn/shop/products/tekken-3-sony-playstation-1-ps1-722674020794-cover-art.jpg?v=1657402086', '2024-12-04 23:29:26'),
	(48, 'Castlevania: Symphony of the Night', 'Acción/Aventura', 39.99, 'Un clásico de acción con elementos de exploración.', 70, 6, 'https://i.pinimg.com/originals/84/6b/85/846b856a423e022a31cdd5742a0081e9.png', '2024-12-04 23:29:26'),
	(49, 'Tomb Raider', 'Aventura', 35.99, 'La aventura icónica de Lara Croft en 3D.', 80, 6, 'https://i.ebayimg.com/images/g/2d0AAOxymiVQ9xsQ/s-l400.jpg', '2024-12-04 23:29:26'),
	(50, 'Tony Hawk\'s Pro Skater 2', 'Deportes', 29.99, 'Un simulador de skateboarding con trucos y niveles memorables.', 95, 6, 'https://upload.wikimedia.org/wikipedia/en/4/41/Tony_Hawk%27s_Pro_Skater_2_cover.png', '2024-12-04 23:29:26'),
	(51, 'Super Mario 64', 'Plataformas', 39.99, 'Un revolucionario juego de plataformas en 3D.', 150, 7, 'https://upload.wikimedia.org/wikipedia/en/6/6a/Super_Mario_64_box_cover.jpg', '2024-12-04 23:44:11'),
	(52, 'The Legend of Zelda: Ocarina of Time', 'Aventura', 44.99, 'Considerado uno de los mejores juegos de todos los tiempos.', 120, 7, 'https://upload.wikimedia.org/wikipedia/en/5/57/The_Legend_of_Zelda_Ocarina_of_Time.jpg', '2024-12-04 23:44:11'),
	(53, 'GoldenEye 007', 'Shooter', 34.99, 'El shooter multijugador que definió una era.', 110, 7, 'https://upload.wikimedia.org/wikipedia/en/3/36/GoldenEye007box.jpg', '2024-12-04 23:44:11'),
	(54, 'Mario Kart 64', 'Carreras', 37.99, 'Juego de carreras de karts con multijugador local.', 140, 7, 'https://m.media-amazon.com/images/M/MV5BOTljNDc5MDctNzBkOS00MzkzLThjNzAtZmZmOWQyY2Y1Zjk3XkEyXkFqcGc@.V1_FMjpg_UX1000.jpg', '2024-12-04 23:44:11'),
	(55, 'Donkey Kong 64', 'Plataformas', 35.99, 'Una aventura en 3D con Donkey Kong y sus amigos.', 100, 7, 'https://i.ebayimg.com/images/g/5x8AAOSwXLJkhVqM/s-l1200.jpg', '2024-12-04 23:44:11'),
	(56, 'Star Fox 64', 'Shooter', 36.99, 'Juego de naves con gráficos avanzados y control preciso.', 90, 7, 'https://upload.wikimedia.org/wikipedia/en/6/63/StarFox64_N64_Game_Box.jpg', '2024-12-04 23:44:11'),
	(57, 'Super Smash Bros.', 'Lucha', 32.99, 'El inicio de la popular saga de lucha multijugador.', 130, 7, 'https://upload.wikimedia.org/wikipedia/en/4/42/Supersmashbox.jpg', '2024-12-04 23:44:11'),
	(58, 'Banjo-Kazooie', 'Plataformas', 38.99, 'Aventura de plataformas con personajes entrañables.', 85, 7, 'https://upload.wikimedia.org/wikipedia/en/1/12/Banjo_Kazooie_Cover.png', '2024-12-04 23:44:11'),
	(59, 'Perfect Dark', 'Shooter', 35.99, 'Un shooter futurista con mecánicas avanzadas.', 75, 7, 'https://images.wikidexcdn.net/mwuploads/esssbwiki/thumb/3/3d/latest/20130922140200/Caratula_Perfect_Dark.jpg/1200px-Caratula_Perfect_Dark.jpg', '2024-12-04 23:44:11'),
	(60, 'Paper Mario', 'RPG', 41.99, 'Un RPG con un estilo gráfico único y una historia encantadora.', 65, 7, 'https://upload.wikimedia.org/wikipedia/en/6/61/Papermario.jpg', '2024-12-04 23:44:11'),
	(61, 'Sonic Adventure', 'Plataformas', 39.99, 'El regreso de Sonic en 3D, con múltiples personajes y una gran aventura.', 120, 8, 'https://media.gamestop.com/i/gamestop/10122558/Sonic-Adventure---Sega-Dreamcast?$pdp$', '2024-12-04 23:59:51'),
	(62, 'Shenmue', 'Aventura', 44.99, 'Una épica aventura de mundo abierto con gráficos revolucionarios.', 100, 8, 'https://upload.wikimedia.org/wikipedia/en/e/e2/ShenmueDCbox.jpg', '2024-12-04 23:59:51'),
	(63, 'Crazy Taxi', 'Carreras/Arcade', 29.99, 'Conduce un taxi loco en una frenética búsqueda de pasajeros.', 140, 8, 'https://media.gamestop.com/i/gamestop/10122559/Crazy-Taxi---Sega-Dreamcast?$pdp$', '2024-12-04 23:59:51'),
	(64, 'SoulCalibur', 'Lucha', 34.99, 'Juego de lucha en 3D conocido por su fluidez y gráficos avanzados.', 110, 8, 'https://retroravengames.com/cdn/shop/products/soulcalibur_580x.jpg?v=1614013560', '2024-12-04 23:59:51'),
	(65, 'Jet Set Radio', 'Acción', 36.99, 'Juego estilizado de patinaje y graffiti con música inolvidable.', 95, 8, 'https://i.ebayimg.com/images/g/nIIAAOSw8b1gO35J/s-l1200.jpg', '2024-12-04 23:59:51'),
	(66, 'Resident Evil Code: Veronica', 'Survival Horror', 41.99, 'Nueva entrega de la saga Resident Evil con narrativa mejorada.', 85, 8, 'https://nightwingvideogamereproductions.net/cdn/shop/products/20220226_042615_1024x1024.jpg?v=1645932116', '2024-12-04 23:59:51'),
	(67, 'Marvel vs. Capcom 2', 'Lucha', 39.99, 'Lucha entre héroes de Marvel y personajes de Capcom en equipos de 3.', 75, 8, 'https://media.gamestop.com/i/gamestop/10122593/Marvel-vs.-Capcom-2---Sega-Dreamcast?$pdp$', '2024-12-04 23:59:51'),
	(68, 'Skies of Arcadia', 'RPG', 42.99, 'Un RPG épico ambientado en un mundo de piratas aéreos.', 60, 8, 'https://upload.wikimedia.org/wikipedia/en/6/65/ArcadiaDC.png', '2024-12-04 23:59:51'),
	(69, 'Virtua Tennis', 'Deportes', 28.99, 'Juego de tenis con controles precisos y diversión arcade.', 130, 8, 'https://i.ebayimg.com/images/g/EqAAAOSwPUZbXFdn/s-l1600.jpg', '2024-12-04 23:59:51'),
	(70, 'Phantasy Star Online', 'RPG/Online', 39.99, 'Uno de los primeros RPG multijugador en línea para consolas.', 50, 8, 'https://m.media-amazon.com/images/I/81+Qb6bqvzL._AC_UF1000,1000_QL80_.jpg', '2024-12-04 23:59:51'),
	(71, 'Tetris', 'Puzzle', 19.99, 'El adictivo juego de rompecabezas que impulsó las ventas de la consola.', 200, 9, 'https://upload.wikimedia.org/wikipedia/en/4/4a/Tetris_Boxshot.jpg', '2024-12-05 00:22:01'),
	(72, 'Pokémon Red', 'RPG', 29.99, 'Primera entrega de la saga Pokémon, donde coleccionas y entrenas criaturas.', 150, 9, 'https://m.media-amazon.com/images/I/71aow5iRsfL._AC_UF1000,1000_QL80_.jpg', '2024-12-05 00:22:01'),
	(73, 'The Legend of Zelda: Link’s Awakening', 'Aventura', 34.99, 'Una entrega única de Zelda diseñada específicamente para Game Boy.', 100, 9, 'https://upload.wikimedia.org/wikipedia/en/c/c1/Link%27s_Awakening.png', '2024-12-05 00:22:01'),
	(74, 'Super Mario Land', 'Plataformas', 24.99, 'El debut portátil de Mario en un mundo completamente nuevo.', 180, 9, 'https://upload.wikimedia.org/wikipedia/en/2/22/Super-mario-land-gameboy-boxart.png', '2024-12-05 00:22:01'),
	(75, 'Kirby’s Dream Land', 'Plataformas', 21.99, 'La primera aventura de Kirby, un adorable héroe que puede absorber enemigos.', 120, 9, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmO_DnPRXIPVpvlZ30xWOAWpkCSZSjEHf7OA&s', '2024-12-05 00:22:01'),
	(76, 'Metroid II: Return of Samus', 'Acción/Aventura', 27.99, 'La secuela de Metroid que expandió la historia de Samus Aran.', 90, 9, 'https://upload.wikimedia.org/wikipedia/en/9/93/Metroid2_boxart.jpg', '2024-12-05 00:22:01'),
	(77, 'Donkey Kong', 'Puzzle/Plataformas', 22.99, 'Una versión ampliada del clásico arcade con elementos innovadores.', 140, 9, 'https://upload.wikimedia.org/wikipedia/en/2/23/Donkey_Kong_94_box_art.jpg', '2024-12-05 00:22:01'),
	(78, 'Dr. Mario', 'Puzzle', 19.99, 'Un juego de rompecabezas donde eliminas virus con píldoras de colores.', 130, 9, 'https://www.lukiegames.com/assets/images/GB/gb_dr_mario_p_r2571i.jpg', '2024-12-05 00:22:01'),
	(79, 'Final Fantasy Adventure', 'RPG', 29.99, 'Un precursor de la serie Mana, con acción y exploración.', 80, 9, 'https://upload.wikimedia.org/wikipedia/en/c/ca/Final-Fantasy-Adventure-GameBoy-Boxart.png', '2024-12-05 00:22:01'),
	(80, 'Wario Land: Super Mario Land 3', 'Plataformas', 26.99, 'El debut de Wario como protagonista en un juego único de plataformas.', 110, 9, 'https://upload.wikimedia.org/wikipedia/en/7/78/Wario-land-gameboy-boxart.png', '2024-12-05 00:22:01');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
