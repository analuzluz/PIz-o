/*
SQLyog Community v13.1.1 (64 bit)
MySQL - 10.3.10-MariaDB : Database - pi2evento
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pi2evento` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `pi2evento`;

/*Table structure for table `cidade` */

DROP TABLE IF EXISTS `cidade`;

CREATE TABLE `cidade` (
  `id_cidade` int(11) NOT NULL AUTO_INCREMENT,
  `nome_cidade` varchar(45) DEFAULT NULL,
  `estado_id_estado` int(11) NOT NULL,
  PRIMARY KEY (`id_cidade`),
  KEY `fk_cidade_estado_idx` (`estado_id_estado`),
  CONSTRAINT `fk_cidade_estado` FOREIGN KEY (`estado_id_estado`) REFERENCES `estado` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `cidade` */

insert  into `cidade`(`id_cidade`,`nome_cidade`,`estado_id_estado`) values 
(1,'BALNEÁRIO CAMBORIÚ',1),
(2,'ITAJAÍ',1),
(3,'CAMBORIÚ',1),
(4,'ITAPEMA',1);

/*Table structure for table `classificacao_idade` */

DROP TABLE IF EXISTS `classificacao_idade`;

CREATE TABLE `classificacao_idade` (
  `id_classificacao_idade` int(11) NOT NULL AUTO_INCREMENT,
  `idade` varchar(11) NOT NULL,
  PRIMARY KEY (`id_classificacao_idade`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `classificacao_idade` */

insert  into `classificacao_idade`(`id_classificacao_idade`,`idade`) values 
(1,'+18'),
(2,'+16'),
(3,'+14'),
(4,'+12'),
(5,'+10'),
(6,'LIVRE');

/*Table structure for table `estado` */

DROP TABLE IF EXISTS `estado`;

CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `nome_estado` varchar(45) NOT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `estado` */

insert  into `estado`(`id_estado`,`nome_estado`) values 
(1,'santa catarina');

/*Table structure for table `evento` */

DROP TABLE IF EXISTS `evento`;

CREATE TABLE `evento` (
  `id_evento` int(11) NOT NULL AUTO_INCREMENT,
  `nome_evento` varchar(45) NOT NULL,
  `descricao_evento` varchar(45) DEFAULT NULL,
  `usuario_id_usuario` int(11) NOT NULL,
  `tipo_evento_id_tipo_evento` int(11) NOT NULL,
  `classificacao_idade_id_classificacao_idade` int(11) NOT NULL,
  `id_cidade` int(11) NOT NULL,
  `logradoro` varchar(255) NOT NULL,
  `numero` varchar(5) DEFAULT NULL,
  `telefone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id_evento`),
  KEY `fk_evento_usuario1_idx` (`usuario_id_usuario`),
  KEY `fk_evento_tipo_evento1_idx` (`tipo_evento_id_tipo_evento`),
  KEY `fk_evento_classificacao_idade1_idx` (`classificacao_idade_id_classificacao_idade`),
  KEY `fk_evento_cidade` (`id_cidade`),
  CONSTRAINT `fk_evento_cidade` FOREIGN KEY (`id_cidade`) REFERENCES `cidade` (`id_cidade`),
  CONSTRAINT `fk_evento_classificacao_idade1` FOREIGN KEY (`classificacao_idade_id_classificacao_idade`) REFERENCES `classificacao_idade` (`id_classificacao_idade`),
  CONSTRAINT `fk_evento_tipo_evento1` FOREIGN KEY (`tipo_evento_id_tipo_evento`) REFERENCES `tipo_evento` (`id_tipo_evento`),
  CONSTRAINT `fk_evento_usuario1` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `evento` */

insert  into `evento`(`id_evento`,`nome_evento`,`descricao_evento`,`usuario_id_usuario`,`tipo_evento_id_tipo_evento`,`classificacao_idade_id_classificacao_idade`,`id_cidade`,`logradoro`,`numero`,`telefone`) values 
(4,'ssssss','ffff',1,1,2,2,'fff','333','3'),
(5,'aula','ahaha',1,1,3,1,'avenida','90','2222222');

/*Table structure for table `tipo_evento` */

DROP TABLE IF EXISTS `tipo_evento`;

CREATE TABLE `tipo_evento` (
  `id_tipo_evento` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo_evento`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `tipo_evento` */

insert  into `tipo_evento`(`id_tipo_evento`,`categoria`) values 
(1,'ACADEMICO'),
(2,'ESPORTES'),
(3,'CIENTIFICO'),
(4,'CORPORATIVO'),
(5,'INSTITUCIONAL'),
(6,'ADVERSOS');

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(10) NOT NULL,
  `datanasc` date DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `usuario` */

insert  into `usuario`(`id_usuario`,`nome`,`telefone`,`email`,`senha`,`datanasc`) values 
(1,'Ana Carolina Girardine Luz','47984137438','anacarolinagirardine6@gmail.com','ana','2001-02-06'),
(2,'Andressa Santos Alves Lima ','47992598063','andressasts1@gmail.com','123123','2001-01-25'),
(3,'Andressa Santos Alves Lima ','47992598063','andressasts1@gmail.com','123123','2001-01-25');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
