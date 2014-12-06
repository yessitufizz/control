/*
SQLyog Ultimate v9.63 
MySQL - 5.5.27 : Database - apli
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`apli` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `apli`;

/*Table structure for table `alumno6` */

DROP TABLE IF EXISTS `alumno6`;

CREATE TABLE `alumno6` (
  `id_grupoal` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `id_grupo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_grupoal`),
  KEY `id` (`id`),
  KEY `id_grupo` (`id_grupo`),
  CONSTRAINT `alumno6_ibfk_1` FOREIGN KEY (`id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `alumno6_ibfk_2` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `alumno6` */

/*Table structure for table `detalle` */

DROP TABLE IF EXISTS `detalle`;

CREATE TABLE `detalle` (
  `id_det` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `id_materia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_det`),
  KEY `id` (`id`),
  KEY `id_materia` (`id_materia`),
  CONSTRAINT `id` FOREIGN KEY (`id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `id_materia` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;

/*Data for the table `detalle` */

insert  into `detalle`(`id_det`,`id`,`id_materia`) values (40,16,3),(44,2,1),(45,2,2),(53,15,2),(55,15,3),(56,18,3),(57,18,4),(58,2,4),(59,2,3),(60,2,11),(61,16,11);

/*Table structure for table `detallegrupo` */

DROP TABLE IF EXISTS `detallegrupo`;

CREATE TABLE `detallegrupo` (
  `id_Detalle` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `id_grupo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Detalle`,`id`),
  KEY `idd` (`id`),
  KEY `id_grupo` (`id_grupo`),
  CONSTRAINT `idd` FOREIGN KEY (`id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `id_grupo` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Data for the table `detallegrupo` */

insert  into `detallegrupo`(`id_Detalle`,`id`,`id_grupo`) values (3,21,14),(4,23,14),(5,24,14),(6,22,14),(8,31,14),(9,30,14),(16,38,14),(18,35,14),(21,36,14),(22,33,14),(17,34,15),(20,40,15),(7,27,16),(11,26,16),(12,28,16),(13,29,17);

/*Table structure for table `grupo` */

DROP TABLE IF EXISTS `grupo`;

CREATE TABLE `grupo` (
  `id_grupo` int(11) NOT NULL AUTO_INCREMENT,
  `grupo` varchar(20) DEFAULT NULL,
  `avatar` varchar(20) DEFAULT NULL,
  `orden` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `grupo` */

insert  into `grupo`(`id_grupo`,`grupo`,`avatar`,`orden`,`status`) values (14,'320',NULL,NULL,'1'),(15,'321',NULL,NULL,'1'),(16,'322',NULL,NULL,'1'),(17,'323',NULL,NULL,'1');

/*Table structure for table `juegodetalle` */

DROP TABLE IF EXISTS `juegodetalle`;

CREATE TABLE `juegodetalle` (
  `id_juego` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `calif` int(10) DEFAULT NULL,
  `intentos` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_juego`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `juegodetalle` */

insert  into `juegodetalle`(`id_juego`,`id`,`calif`,`intentos`) values (1,16,7,NULL),(2,16,7,NULL),(3,16,7,NULL),(4,16,7,NULL),(5,16,6,NULL),(9,16,4,NULL),(10,16,6,NULL),(11,16,7,NULL),(14,1,5,NULL);

/*Table structure for table `materia` */

DROP TABLE IF EXISTS `materia`;

CREATE TABLE `materia` (
  `id_materia` int(11) NOT NULL AUTO_INCREMENT,
  `materia` varchar(20) DEFAULT NULL,
  `avatar` varchar(20) DEFAULT NULL,
  `orden` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `materia` */

insert  into `materia`(`id_materia`,`materia`,`avatar`,`orden`,`status`) values (1,'Matemáticas','1','2','1'),(2,'Historia','qwerty','1','1'),(3,'ciencias','aserty','3','1'),(4,'Geografía','hola','4','1'),(11,'química',NULL,NULL,NULL),(12,'español',NULL,NULL,NULL),(13,'filosofia',NULL,NULL,NULL);

/*Table structure for table `preguntas` */

DROP TABLE IF EXISTS `preguntas`;

CREATE TABLE `preguntas` (
  `id_p` int(11) NOT NULL AUTO_INCREMENT,
  `pregunta` varchar(100) NOT NULL,
  `respuesta` varchar(200) DEFAULT NULL,
  `f1` varchar(200) DEFAULT NULL,
  `f2` varchar(200) DEFAULT NULL,
  `ok` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_p`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `preguntas` */

insert  into `preguntas`(`id_p`,`pregunta`,`respuesta`,`f1`,`f2`,`ok`) values (1,'¿Los osos polares son zurdos?','Los osos no escriben','falso','cierto','cierto'),(2,'¿Qué es un EWOK?','un perro','personaje de star wars','un escritor','personaje de star wars'),(3,'¿Quién fue famoso esposo de Frida Kahlo? ','Juan rulfo','Diego Rivera','Octavio Paz','Diego Rivera'),(4,'¿Qué se coloca entre los números de una dirección ip','puntos','comas','guiones','puntos'),(5,'es un sistema de impresión mediante el uso de toner','laser','inyección','matriz de puntos','laser'),(6,'¿Cuál es poliedro qué tiene cuatro caras?','tetraedro','cuabrado','cubo','tetraedro'),(7,'¿quién dijo \"Sólo sé que no sé nada\" ?','Sócrates ','Platón','César','Sócrates '),(8,'La montaña más alta de México es ','Citlaltépetl','Xinantecatl','popocatepetl','Citlaltépetl'),(9,'Es un tipo de imagen','gif','mkv','avi','gif'),(10,'Stephen King se dedicaba a...?','Escribir','comer','actuar','Escribir'),(11,'Es un Servicio de internet','correo electrónico','correo postal','imprimir','correo electrónico'),(12,'capital del estado de México','Toluca','Lerma','Metepec','Toluca'),(13,'Científico Mexicano','Mario Molina','Einstein','Galileo','Mario Molina'),(14,'Es un Sistema operativo','word','Android','excel','Android'),(15,'nombre del Basquetbolista que apareció en la película space jam','Kobe Bryant','Michael Jordan','LeBron James','Michael Jordan'),(16,'número del basquetbolista Michael Jordan','o','23','300','23');

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) DEFAULT NULL,
  `apellido_pat` varchar(250) DEFAULT NULL,
  `apellido_mat` varchar(250) DEFAULT NULL,
  `telefono` varchar(250) DEFAULT NULL,
  `calle` varchar(250) DEFAULT NULL,
  `num_ext` int(5) DEFAULT NULL,
  `num_int` int(5) DEFAULT NULL,
  `colonia` varchar(250) DEFAULT NULL,
  `municipio` varchar(250) DEFAULT NULL,
  `estado` varchar(250) DEFAULT NULL,
  `codigoPostal` int(5) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `usuario` varchar(250) DEFAULT NULL,
  `pws` varchar(250) DEFAULT NULL,
  `estatus` varchar(250) DEFAULT NULL,
  `nivel` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

/*Data for the table `usuario` */

insert  into `usuario`(`id`,`nombre`,`apellido_pat`,`apellido_mat`,`telefono`,`calle`,`num_ext`,`num_int`,`colonia`,`municipio`,`estado`,`codigoPostal`,`correo`,`usuario`,`pws`,`estatus`,`nivel`) values (1,'Ber','Eduardo','Bonilla','7233379516','ind',33,1,'san nicolas','toluca','mexico',50230,'lalal@hotmail.xom','admin','1234','1','1'),(2,'Uriel','Molina','Villegas','7224192061','sierra',1,2,'san felipe de jesus','ameyalco','mexico',7510,'uuhdhd@gmail.com','carlos','1234','1','2'),(14,'arnold','asd','asdas',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1'),(15,'Bertin Eduardo','Bonilla','Rivas',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','2'),(16,'Rodrigo','asd','asdas',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'prof1','123','1','2'),(18,'carlos','Pérez','González',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','2'),(21,'pedro','gonzález','pérez',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','3'),(22,'iván','hinojosa','contreras',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','3'),(23,'antonio','contreras','castañeda',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','3'),(24,'anahí','guitiérrez','ibañez',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','3'),(25,'felix','castro','megg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','3'),(26,'jack','castro','wg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','3'),(27,'pedro','chavira','wg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','3'),(28,'pedro','chavira','barrios',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','3'),(29,'ruth','chavira','barrios',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','3'),(30,'fredy','jimenez','barrios',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','3'),(31,'fredy','jimenez','pérez',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','3'),(32,'Bernardo','jimenez','pérez',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','3'),(33,'Bernardo','bonilla','pérez',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','3'),(34,'jorge','bonilla','pérez',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','3'),(35,'gustavo','bonilla','pérez',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','3'),(36,'ick','bonilla','pérez',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','3'),(37,'ick','gasol','pérez',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','3'),(38,'ick','gasol','petriovick',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','3'),(39,'kevin','durant','petriovick',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','3'),(40,'tony','romo','petriovick',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','3');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
