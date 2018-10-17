/*
SQLyog Community v13.1.1 (64 bit)
MySQL - 8.0.12 : Database - pi2evento
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `classificacao_idade` */

DROP TABLE IF EXISTS `classificacao_idade`;

CREATE TABLE `classificacao_idade` (
  `id_classificacao_idade` int(11) NOT NULL AUTO_INCREMENT,
  `idade` int(11) NOT NULL,
  PRIMARY KEY (`id_classificacao_idade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `endereco` */

DROP TABLE IF EXISTS `endereco`;

CREATE TABLE `endereco` (
  `id_endereco` int(11) NOT NULL AUTO_INCREMENT,
  `rua` varchar(45) NOT NULL,
  `bairro` varchar(45) NOT NULL,
  `lat` float NOT NULL,
  `long` float NOT NULL,
  `cidade_id_cidade` int(11) NOT NULL,
  PRIMARY KEY (`id_endereco`),
  KEY `fk_endereco_cidade1_idx` (`cidade_id_cidade`),
  CONSTRAINT `fk_endereco_cidade1` FOREIGN KEY (`cidade_id_cidade`) REFERENCES `cidade` (`id_cidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `estado` */

DROP TABLE IF EXISTS `estado`;

CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `nome_estado` varchar(45) NOT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `evento` */

DROP TABLE IF EXISTS `evento`;

CREATE TABLE `evento` (
  `id_evento` int(11) NOT NULL AUTO_INCREMENT,
  `nome_evento` varchar(45) NOT NULL,
  `descricao_evento` varchar(45) DEFAULT NULL,
  `endereco_id_endereco` int(11) NOT NULL,
  `usuario_id_usuario` int(11) NOT NULL,
  `tipo_evento_id_tipo_evento` int(11) NOT NULL,
  `classificacao_idade_id_classificacao_idade` int(11) NOT NULL,
  PRIMARY KEY (`id_evento`),
  KEY `fk_evento_endereco1_idx` (`endereco_id_endereco`),
  KEY `fk_evento_usuario1_idx` (`usuario_id_usuario`),
  KEY `fk_evento_tipo_evento1_idx` (`tipo_evento_id_tipo_evento`),
  KEY `fk_evento_classificacao_idade1_idx` (`classificacao_idade_id_classificacao_idade`),
  CONSTRAINT `fk_evento_classificacao_idade1` FOREIGN KEY (`classificacao_idade_id_classificacao_idade`) REFERENCES `classificacao_idade` (`id_classificacao_idade`),
  CONSTRAINT `fk_evento_endereco1` FOREIGN KEY (`endereco_id_endereco`) REFERENCES `endereco` (`id_endereco`),
  CONSTRAINT `fk_evento_tipo_evento1` FOREIGN KEY (`tipo_evento_id_tipo_evento`) REFERENCES `tipo_evento` (`id_tipo_evento`),
  CONSTRAINT `fk_evento_usuario1` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tipo_evento` */

DROP TABLE IF EXISTS `tipo_evento`;

CREATE TABLE `tipo_evento` (
  `id_tipo_evento` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `senha` varchar(10) NOT NULL,
  `datanasc` date DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
