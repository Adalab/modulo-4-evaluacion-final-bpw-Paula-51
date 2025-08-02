-- MySQL dump 10.13  Distrib 8.0.43, for macos15 (arm64)
--
-- Host: localhost    Database: Springfield
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `capitulos`
--

DROP TABLE IF EXISTS `capitulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `capitulos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) DEFAULT NULL,
  `numero_episodio` int NOT NULL,
  `temporada` int NOT NULL,
  `fecha_emision` date NOT NULL,
  `sinopsis` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capitulos`
--

LOCK TABLES `capitulos` WRITE;
/*!40000 ALTER TABLE `capitulos` DISABLE KEYS */;
/*!40000 ALTER TABLE `capitulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frases`
--

DROP TABLE IF EXISTS `frases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `texto` text NOT NULL,
  `marca_tiempo` varchar(45) DEFAULT NULL,
  `descripcion` text,
  `personajes_id` int NOT NULL,
  PRIMARY KEY (`id`,`personajes_id`),
  KEY `fk_frases_personajes_idx` (`personajes_id`),
  CONSTRAINT `fk_frases_personajes` FOREIGN KEY (`personajes_id`) REFERENCES `personajes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frases`
--

LOCK TABLES `frases` WRITE;
/*!40000 ALTER TABLE `frases` DISABLE KEYS */;
/*!40000 ALTER TABLE `frases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personajes`
--

DROP TABLE IF EXISTS `personajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personajes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `ocupación` varchar(45) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personajes`
--

LOCK TABLES `personajes` WRITE;
/*!40000 ALTER TABLE `personajes` DISABLE KEYS */;
/*!40000 ALTER TABLE `personajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personajes_has_capitulos`
--

DROP TABLE IF EXISTS `personajes_has_capitulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personajes_has_capitulos` (
  `personajes_id` int NOT NULL,
  `capitulos_id` int NOT NULL,
  PRIMARY KEY (`personajes_id`,`capitulos_id`),
  KEY `fk_personajes_has_capitulos_capitulos1_idx` (`capitulos_id`),
  KEY `fk_personajes_has_capitulos_personajes1_idx` (`personajes_id`),
  CONSTRAINT `fk_personajes_has_capitulos_capitulos1` FOREIGN KEY (`capitulos_id`) REFERENCES `capitulos` (`id`),
  CONSTRAINT `fk_personajes_has_capitulos_personajes1` FOREIGN KEY (`personajes_id`) REFERENCES `personajes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personajes_has_capitulos`
--

LOCK TABLES `personajes_has_capitulos` WRITE;
/*!40000 ALTER TABLE `personajes_has_capitulos` DISABLE KEYS */;
/*!40000 ALTER TABLE `personajes_has_capitulos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-30 21:25:32
/* rellenar tablas desde MySQL Workbench - PERSONAJES */
INSERT INTO `Springfield`.`personajes` (`id`, `nombre`, `apellido`, `ocupación`, `descripcion`) VALUES ('2', 'Homer', 'Simpson', 'Central Nuclear', 'Padre de familia, típico americano. Tauro');
INSERT INTO `Springfield`.`personajes` (`id`, `nombre`, `apellido`, `ocupación`, `descripcion`) VALUES ('3', 'Montgomery', 'Burns', 'CEO de la central nuclear', 'El habitante más mayor de Springfield');
INSERT INTO `Springfield`.`personajes` (`id`, `nombre`, `apellido`, `ocupación`, `descripcion`) VALUES ('4', 'Edna', 'Krabbapel', 'Profesora de primaria', 'Alcohólica deprimida enamorada del director');
INSERT INTO `Springfield`.`personajes` (`id`, `nombre`, `apellido`, `ocupación`, `descripcion`) VALUES ('5', 'Nelson', 'Munch', 'Abusón', 'Bully principal del colegio de primaria');
INSERT INTO `Springfield`.`personajes` (`id`, `nombre`, `apellido`, `ocupación`, `descripcion`) VALUES ('6', 'Milhouse', 'Van Houten', 'Nerd', 'Pequeño traumatizado por sus problemas familiares');

/*frases*/
INSERT INTO `Springfield`.`frases` (`id`, `texto`, `descripcion`, `personajes_id`) VALUES ('2', 'Oh', 'expresión típica cuando comete un error', '2');
UPDATE `Springfield`.`frases` SET `descripcion` = 'frase insultante' WHERE (`id` = '1') and (`personajes_id` = '1');
INSERT INTO `Springfield`.`frases` (`id`, `texto`, `descripcion`, `personajes_id`) VALUES ('3', 'Yo no he sido', 'Frase estrella del salto a la fama de Bart', '1');
INSERT INTO `Springfield`.`frases` (`id`, `texto`, `descripcion`, `personajes_id`) VALUES ('4', 'Todo ha salido a pedir de Milhouse', 'La única vez que le sale algo bien ', '6');
INSERT INTO `Springfield`.`frases` (`id`, `texto`, `descripcion`, `personajes_id`) VALUES ('5', 'Excelente', 'Expresión favorita del Sr Burns', '3');
INSERT INTO `Springfield`.`frases` (`id`, `texto`, `descripcion`, `personajes_id`) VALUES ('6', 'JÁ!', 'Risa irónica de la profesora ', '4');
INSERT INTO `Springfield`.`frases` (`id`, `texto`, `descripcion`, `personajes_id`) VALUES ('7', 'Papá, puedes verme?', 'Oración que le canta nelson a su padre por las noches para comunicarse con él', '5');
INSERT INTO `Springfield`.`frases` (`id`, `texto`, `descripcion`, `personajes_id`) VALUES ('8', 'En esta casa seguimos las leyes de la termodinámica', 'Final de una discusión en pareja que tienen Homer y marge en la cama ', '2');


INSERT INTO `Springfield`.`capitulos` (`id`, `titulo`, `numero_episodio`, `temporada`, `fecha_emision`, `sinopsis`) 
VALUES 
(1, 'Bart el genio', 2, 1, '1990-01-14', 'Bart cambia su examen con el de Martin y es enviado a una escuela para superdotados.'),
(2, 'Homer el Hereje', 3, 4, '1992-10-08', 'Homer decide dejar de ir a la iglesia y empieza a disfrutar de los domingos a su manera.'),
(3, '¿Dónde está el alma de Bart?', 4, 7, '1995-10-29', 'Bart vende su alma a Milhouse por cinco dólares y luego se arrepiente.'),
(4, 'La última tentación de Homer', 9, 5, '1993-12-09', 'Homer se siente atraído por una nueva compañera de trabajo llamada Mindy.'),
(5, 'El enemigo de Homer', 23, 8, '1997-05-04', 'Homer conoce a Frank Grimes, quien detesta su actitud irresponsable.'),
(6, 'El abuelo y la inefable historia de la abuela Simpson', 20, 6, '1995-04-30', 'Abraham revela la historia secreta de la madre de Homer, Mona Simpson.'),
(7, 'El saxo de Lisa', 3, 9, '1997-10-19', 'Se cuenta cómo Lisa consiguió su saxofón en un momento difícil para la familia.'),
(8, 'Marge contra el monorraíl', 12, 4, '1993-01-14', 'Springfield compra un monorraíl que resulta ser una estafa.'),
(9, 'Lisa la vegetariana', 5, 7, '1995-10-15', 'Lisa decide dejar de comer carne tras visitar una granja.'),
(10, 'Quién mató al Sr. Burns (Parte 1)', 25, 6, '1995-05-21', 'El Sr. Burns decide robar el sol a Springfield y luego recibe un disparo misterioso.');