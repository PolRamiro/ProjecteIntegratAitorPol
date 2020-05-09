-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-04-2020 a las 18:07:26
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `projectehort`
--

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `hort`
--

CREATE TABLE `hort` (
  `id_hort` int NOT NULL PRIMARY KEY,
  `Nom Hort` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `hort`
--

INSERT INTO `hort` (`id_hort`,`Nom Hort`) VALUES
(1,'hort municipal girona'),
(2,'hort municipal san feliu');
--
-- Estructura de tabla para la tabla `activitats`
--

CREATE TABLE `activitats` (
  `id_activitat` int NOT NULL PRIMARY KEY,
  `id_hort_on_realitza` int NOT NULL,
  `id_panell` int(11) NOT NULL,
  `Descripcio_Activitat` text NOT NULL,
  FOREIGN KEY (id_hort_on_realitza) REFERENCES hort(id_hort)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `activitats`
--

INSERT INTO `activitats` (`id_activitat`, `id_hort_on_realitza`, `id_panell`, `Descripcio_Activitat`) VALUES
(1,1, 4, 'utilitzar compostatge;14:30;22/7/21'),
(2,1, 4, 'utilitzar compostatge;14:30;22/7/21'),
(3,1, 0, 'Plantar llentias;13:00;07/10/20'),
(4,1, 2, 'Plantar llentias;13:00;07/10/20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `composts`
--

CREATE TABLE `composts` (
  `Data_comprobacio` varchar(10) NOT NULL,
  `Quantitat_kg` double NOT NULL,
  `id_hort_dipositat` int NOT NULL
  FOREIGN KEY (id_hort_dipositat) REFERENCES hort(id_hort),
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `composts`
--

INSERT INTO `composts` (`Data_comprobacio`, `Quantitat_kg`, `id_hort_dipositat`) VALUES
('10/11/20', 300.21, 2),
('10/11/20', 300.09, 1),
('23/4/20', 50.02, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `einas`
--

CREATE TABLE `einas` (
  `id_einas` int NOT NULL PRIMARY KEY,
  `Nom` varchar(50) NOT NULL,
  `id_hort_dipositat` int NOT NULL,
  FOREIGN KEY (id_hort_dipositat) REFERENCES hort(id_hort)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `einas`
--

INSERT INTO `einas` (`id_einas`,`Nom`, `id_hort_dipositat`) VALUES
(923414, 'Martell 40 cm', 2),
(234515, 'Serra metalica 56 cm', 1);

-- --------------------------------------------------------



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `llavors`
--

CREATE TABLE `llavors` (
  `id_llavor` int NOT NULL PRIMARY KEY,
  `id_hort_dipositat` int NOT NULL,
  `quantitat` int NOT NULL,
  `descripcio` varchar(50) NOT NULL,
  FOREIGN KEY (id_hort_dipositat) REFERENCES hort(id_hort)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `llavors`
--

INSERT INTO `llavors` (`id_llavor`, `id_hort_dipositat`, `quantitat`, `descripcio`) VALUES
(14,2,32,'llavors de meduixa mediterranea'),
(40,1,12,'llavors pruna peruana');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parcela`
--

CREATE TABLE `parcela` (
  `id_parcela` int NOT NULL PRIMARY KEY,
  `id_hort_localitzat` int NOT NULL,
  `id_llavors_plantades` int NOT NULL,
  `Dimensions_Amplada` int NOT NULL,
  `Dimensions_Altura` int NOT NULL,
  FOREIGN KEY (id_hort_localitzat) REFERENCES hort(id_hort),
  FOREIGN KEY (id_llavors_plantades) REFERENCES llavors(id_llavor)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `parcela`
--

INSERT INTO `parcela` (`id_parcela`, `id_hort_localitzat`, `id_llavors_plantades`, `Dimensions_Amplada`, `Dimensions_Altura`) VALUES
(2,2,14, 500, 500),
(3,1,40,367,257);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuaris`
--

CREATE TABLE `usuaris` (
  `id_usuari` int NOT NULL PRIMARY KEY,
  `id_Hort_Afiliat` int NOT NULL,
  `Nom_usuari` varchar(50) NOT NULL,
  `Contrasenya` varchar(50) NOT NULL,
  `Familia` varchar(255),
  `Ultima_Hora_entrada` varchar(255) NOT NULL,
  `Ultimahora_sortida` varchar(255) NOT NULL,
  `Administrador_local` boolean NOT NULL,
  `Administrador_Universal` boolean NOT NULL,
  `Actiu` boolean NOT NULL,
  `Total_hores_setmanals` int NOT NULL,
  FOREIGN KEY (id_Hort_Afiliat) REFERENCES hort(id_hort)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuaris`
--

INSERT INTO `usuaris` (`id_usuari`, `id_Hort_Afiliat`, `Nom_usuari`, `Contrasenya`, `Familia`, `Ultima_Hora_entrada`, `Ultimahora_sortida`, `Administrador_local`, `Administrador_Universal`, `Actiu`, `Total_hores_setmanals`) VALUES
(23516, 2,'Pere14', '12345','Adams','10:53','20:32',false,false,false,11),
(98371, 1,'Mikel23', 'contraseña','Corleone','09:21','13:14',false,false,false,23);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `parcela`
--
----PART POL
CREATE TABLE `necessitats`(
	`id` int NOT NULL PRIMARY KEY,
	`tipus` varchar(255),
	`descripcio` varchar(255),
	`id_hort_afiliat` int NOT NULL,
	FOREIGN KEY (id_hort_afiliat) REFERENCES hort(id_hort));
INSERT INTO `necessitats` (`id`, `tipus`, `descripcio`,`id_hort_afiliat`) VALUES
(1, 'COMPOSTATGE', '200 g. Fruits secs',1),
(2, 'COMPOSTATGE', '145 g. Fruita',1),
(3, 'COMPOSTATGE', '30 g Paper organic',1),
(4, 'EINES', '2 Pales de 1/2 metres',1),
(5, 'EINES', '4 Guants',1),
(6, 'MATERIAL PER PLANTAR', '230 llavors abet roig',1),
(7, 'MATERIAL PER PLANTAR', '13 llavors meduixa mediterranea',1),
(8, 'MATERIAL PER PLANTAR', '15 Cebes',1);

CREATE TABLE `informacio`(
	`id_informatiu` int NOT NULL PRIMARY KEY,
	`cos_informacio` varchar(255) NOT NULL,
	`imatge` binary);
INSERT INTO `informacio` (`id_informatiu`, `cos_informacio`) VALUES
(1,'El cultivo es en semillero, aunque como es bianual si quisiéramos recoger nuestras propias semillas tendríamos que dejar 2 años la planta para que sacara la flor. Los tiempos de cultivo de la tabla de arriba se corresponden con la cosecha de.'),
(2,'La alcachofa es una de las verduras de temporada del otoño y el invierno, ya que su recolección abarca desde octubre hasta abril. Se trata de un alimento muy completo, ya que además de poderse cocinar de un sinfín de formas, las propiedades de la alcachofa son muy beneficiosas para el ser humano.');

CREATE TABLE `horaris`(
	`id` int NOT NULL PRIMARY KEY,
	`id_hort` int NOT NULL,
	`nom_dia` varchar(255),
	`hora_entrada` varchar(255),
	`hora_sortida` varchar(255),
	`festiu` boolean,
	`numero_de_dia` int,
	FOREIGN KEY (id_hort) REFERENCES hort(id_hort)
	);
INSERT INTO `horaris` (`id`,`id_hort`,`nom_dia`,`hora_entrada`,`hora_sortida`,`festiu`,`numero_de_dia`) VALUES
(1,1,'Dilluns','09:00','21:00',false,21),
(2,1,'Dimarts','09:00','21:00',false,22),
(3,1,'Dimecres','09:00','21:00',false,23),
(4,1,'Dijous','09:00','21:00',false,24),
(5,1,'Divendres','09:00','21:00',false,25),
(6,1,'Dissabte','09:00','21:00',false,26),
(7,1,'Diumenge','09:00','21:00',true,27);

ALTER TABLE hort
ADD capacitat_maxima_usuaris int; 

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
