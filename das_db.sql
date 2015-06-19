-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: das_db
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.12.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aluno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `endereco_id` int(11) NOT NULL,
  `telefone_id` int(11) NOT NULL,
  `matricula` varchar(30) NOT NULL,
  `curso_id` int(11) NOT NULL,
  `data_ingresso` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `endereco_id` (`endereco_id`),
  KEY `aluno_01ba8b38` (`telefone_id`),
  KEY `aluno_8f21b3a5` (`curso_id`),
  CONSTRAINT `curso_id_refs_id_a3724184` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`id`),
  CONSTRAINT `endereco_id_refs_id_709caeba` FOREIGN KEY (`endereco_id`) REFERENCES `endereco` (`id`),
  CONSTRAINT `telefone_id_refs_id_6443a77f` FOREIGN KEY (`telefone_id`) REFERENCES `telefone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (1,'Eduardo','edu@mail.com',1,1,'201202222',1,'2012-01-01'),(2,'Jeferson','jef@mail.com',2,2,'201202223',1,'2012-01-01'),(3,'Abelardo','abel@mail.com',3,3,'201202224',1,'2012-01-01'),(4,'Jurema','jur@mail.com',4,4,'201202225',1,'2012-01-01'),(5,'Teobaldo','teo@mail.com',5,5,'201202456',1,'2012-01-01'),(6,'Juca','juca@mail.com',6,6,'201202499',1,'2012-01-01');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno_disciplinas`
--

DROP TABLE IF EXISTS `aluno_disciplinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aluno_disciplinas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aluno_id` int(11) NOT NULL,
  `disciplina_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `aluno_id` (`aluno_id`,`disciplina_id`),
  KEY `aluno_disciplinas_f5bb521d` (`aluno_id`),
  KEY `aluno_disciplinas_3b8d720d` (`disciplina_id`),
  CONSTRAINT `aluno_id_refs_id_5bf38d40` FOREIGN KEY (`aluno_id`) REFERENCES `aluno` (`id`),
  CONSTRAINT `disciplina_id_refs_id_65a71941` FOREIGN KEY (`disciplina_id`) REFERENCES `disciplina` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_disciplinas`
--

LOCK TABLES `aluno_disciplinas` WRITE;
/*!40000 ALTER TABLE `aluno_disciplinas` DISABLE KEYS */;
/*!40000 ALTER TABLE `aluno_disciplinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arquivo`
--

DROP TABLE IF EXISTS `arquivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arquivo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_arquivo` varchar(200) NOT NULL,
  `descricao_arquivo` varchar(200) DEFAULT NULL,
  `arquivo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arquivo`
--

LOCK TABLES `arquivo` WRITE;
/*!40000 ALTER TABLE `arquivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `arquivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add telefone',7,'add_telefone'),(20,'Can change telefone',7,'change_telefone'),(21,'Can delete telefone',7,'delete_telefone'),(22,'Can add endereco',8,'add_endereco'),(23,'Can change endereco',8,'change_endereco'),(24,'Can delete endereco',8,'delete_endereco'),(25,'Can add horario',9,'add_horario'),(26,'Can change horario',9,'change_horario'),(27,'Can delete horario',9,'delete_horario'),(28,'Can add periodo',10,'add_periodo'),(29,'Can change periodo',10,'change_periodo'),(30,'Can delete periodo',10,'delete_periodo'),(31,'Can add disciplina',11,'add_disciplina'),(32,'Can change disciplina',11,'change_disciplina'),(33,'Can delete disciplina',11,'delete_disciplina'),(34,'Can add curso',12,'add_curso'),(35,'Can change curso',12,'change_curso'),(36,'Can delete curso',12,'delete_curso'),(37,'Can add aluno',13,'add_aluno'),(38,'Can change aluno',13,'change_aluno'),(39,'Can delete aluno',13,'delete_aluno'),(40,'Can add professor',14,'add_professor'),(41,'Can change professor',14,'change_professor'),(42,'Can delete professor',14,'delete_professor'),(43,'Can add unidade',15,'add_unidade'),(44,'Can change unidade',15,'change_unidade'),(45,'Can delete unidade',15,'delete_unidade'),(46,'Can add noticia',16,'add_noticia'),(47,'Can change noticia',16,'change_noticia'),(48,'Can delete noticia',16,'delete_noticia'),(49,'Can add arquivo',17,'add_arquivo'),(50,'Can change arquivo',17,'change_arquivo'),(51,'Can delete arquivo',17,'delete_arquivo'),(52,'Can add turma',18,'add_turma'),(53,'Can change turma',18,'change_turma'),(54,'Can delete turma',18,'delete_turma'),(55,'Can add nota',19,'add_nota'),(56,'Can change nota',19,'change_nota'),(57,'Can delete nota',19,'delete_nota'),(58,'Can add frequencia',20,'add_frequencia'),(59,'Can change frequencia',20,'change_frequencia'),(60,'Can delete frequencia',20,'delete_frequencia');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$DcE7JUIwsTeq$yJr15CKRuhfQyuKydqMNXobiHMg2gZB1NwGrTr15NME=','2015-06-07 22:08:21',1,'admin','','','',1,1,'2015-06-07 22:06:52');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `cod` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'B. Sistemas de Informacao','BSI0'),(2,'Direito','DIR0'),(3,'Historia','HIS0');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso_disciplina`
--

DROP TABLE IF EXISTS `curso_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso_disciplina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `curso_id` int(11) NOT NULL,
  `disciplina_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `curso_id` (`curso_id`,`disciplina_id`),
  KEY `curso_disciplina_8f21b3a5` (`curso_id`),
  KEY `curso_disciplina_3b8d720d` (`disciplina_id`),
  CONSTRAINT `curso_id_refs_id_089af601` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`id`),
  CONSTRAINT `disciplina_id_refs_id_2a60018b` FOREIGN KEY (`disciplina_id`) REFERENCES `disciplina` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso_disciplina`
--

LOCK TABLES `curso_disciplina` WRITE;
/*!40000 ALTER TABLE `curso_disciplina` DISABLE KEYS */;
INSERT INTO `curso_disciplina` VALUES (1,1,1),(3,1,2),(2,1,3);
/*!40000 ALTER TABLE `curso_disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disciplina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `cod` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES (1,'Algoritmos','BSI001'),(2,'REDES','BSI002'),(3,'Eng. Software','BSI003'),(4,'Direito Básico I','DIR001'),(5,'Filosofia','DIR003'),(6,'História do RN','HIS003');
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'telefone','DAS_core','telefone'),(8,'endereco','DAS_core','endereco'),(9,'horario','DAS_core','horario'),(10,'periodo','DAS_core','periodo'),(11,'disciplina','DAS_core','disciplina'),(12,'curso','DAS_core','curso'),(13,'aluno','DAS_core','aluno'),(14,'professor','DAS_core','professor'),(15,'unidade','DAS_core','unidade'),(16,'noticia','DAS_core','noticia'),(17,'arquivo','DAS_core','arquivo'),(18,'turma','DAS_core','turma'),(19,'nota','DAS_core','nota'),(20,'frequencia','DAS_core','frequencia');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('b36hl23d6097i5jnxessyo9fafblagi1','NDdlOTFhZWE1ZjE5NDFjODBhZWRhY2Q3YzA2MDJmZmFjOWY5NGE3NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2015-06-21 22:08:21');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endereco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rua` varchar(200) NOT NULL,
  `complemento` varchar(200) DEFAULT NULL,
  `cep` varchar(200) NOT NULL,
  `bairro` varchar(200) DEFAULT NULL,
  `cidade` varchar(200) NOT NULL,
  `estado` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,'Rua A',NULL,'59300000',NULL,'Caico','RN'),(2,'Rua B',NULL,'59300000',NULL,'Caico','RN'),(3,'Rua C',NULL,'59300000',NULL,'Caico','RN'),(4,'Rua D',NULL,'59300000',NULL,'Caico','RN'),(5,'Rua E',NULL,'59300000',NULL,'Caico','RN'),(6,'Rua F',NULL,'59300000',NULL,'Caico','RN'),(7,'Rua G',NULL,'59300000',NULL,'Caico','RN'),(8,'Rua H',NULL,'59300000',NULL,'Caico','RN');
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frequencia`
--

DROP TABLE IF EXISTS `frequencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frequencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aluno_id` int(11) NOT NULL,
  `turma_id` int(11) NOT NULL,
  `n_faltas` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `frequencia_f5bb521d` (`aluno_id`),
  KEY `frequencia_49a96667` (`turma_id`),
  CONSTRAINT `aluno_id_refs_id_0cbda87a` FOREIGN KEY (`aluno_id`) REFERENCES `aluno` (`id`),
  CONSTRAINT `turma_id_refs_id_55b719a6` FOREIGN KEY (`turma_id`) REFERENCES `turma` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frequencia`
--

LOCK TABLES `frequencia` WRITE;
/*!40000 ALTER TABLE `frequencia` DISABLE KEYS */;
INSERT INTO `frequencia` VALUES (1,1,1,20);
/*!40000 ALTER TABLE `frequencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dia` varchar(3) NOT NULL,
  `horario` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
INSERT INTO `horario` VALUES (1,'Seg','M12'),(2,'Ter','M34'),(3,'Qua','M12');
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota`
--

DROP TABLE IF EXISTS `nota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` int(11) NOT NULL,
  `peso` int(11) NOT NULL,
  `aluno_id` int(11) NOT NULL,
  `turma_id` int(11) NOT NULL,
  `unidade_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nota_f5bb521d` (`aluno_id`),
  KEY `nota_49a96667` (`turma_id`),
  KEY `nota_041fc1dc` (`unidade_id`),
  CONSTRAINT `aluno_id_refs_id_1f818807` FOREIGN KEY (`aluno_id`) REFERENCES `aluno` (`id`),
  CONSTRAINT `turma_id_refs_id_aeb76e15` FOREIGN KEY (`turma_id`) REFERENCES `turma` (`id`),
  CONSTRAINT `unidade_id_refs_id_7de8a727` FOREIGN KEY (`unidade_id`) REFERENCES `unidade` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota`
--

LOCK TABLES `nota` WRITE;
/*!40000 ALTER TABLE `nota` DISABLE KEYS */;
/*!40000 ALTER TABLE `nota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticia`
--

DROP TABLE IF EXISTS `noticia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noticia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) NOT NULL,
  `corpo` varchar(900) NOT NULL,
  `data_noticia` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticia`
--

LOCK TABLES `noticia` WRITE;
/*!40000 ALTER TABLE `noticia` DISABLE KEYS */;
/*!40000 ALTER TABLE `noticia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodo`
--

DROP TABLE IF EXISTS `periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periodo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `periodo` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodo`
--

LOCK TABLES `periodo` WRITE;
/*!40000 ALTER TABLE `periodo` DISABLE KEYS */;
INSERT INTO `periodo` VALUES (1,'2012.1'),(2,'2012.2');
/*!40000 ALTER TABLE `periodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `endereco_id` int(11) NOT NULL,
  `telefone_id` int(11) NOT NULL,
  `matricula` varchar(30) NOT NULL,
  `tipo_contrato` varchar(200) NOT NULL,
  `data_contratacao` date NOT NULL,
  `data_recisao` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `endereco_id` (`endereco_id`),
  KEY `professor_01ba8b38` (`telefone_id`),
  CONSTRAINT `telefone_id_refs_id_b2839773` FOREIGN KEY (`telefone_id`) REFERENCES `telefone` (`id`),
  CONSTRAINT `endereco_id_refs_id_262747e0` FOREIGN KEY (`endereco_id`) REFERENCES `endereco` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefone`
--

DROP TABLE IF EXISTS `telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(200) NOT NULL,
  `tipo` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefone`
--

LOCK TABLES `telefone` WRITE;
/*!40000 ALTER TABLE `telefone` DISABLE KEYS */;
INSERT INTO `telefone` VALUES (1,'9999-8888','CE'),(2,'9999-8822','CE'),(3,'9999-8118','CE'),(4,'9999-0909','CE'),(5,'9911-8888','CE'),(6,'9469-8822','CE'),(7,'2671-8118','TE'),(8,'2134-0909','TE');
/*!40000 ALTER TABLE `telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma`
--

DROP TABLE IF EXISTS `turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disciplina_id` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `periodo_id` int(11) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_termino` date NOT NULL,
  `qtd_aulas` int(11) NOT NULL,
  `qtd_alunos` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `disciplina_id` (`disciplina_id`),
  KEY `turma_59ad88c4` (`periodo_id`),
  CONSTRAINT `disciplina_id_refs_id_2b777eb1` FOREIGN KEY (`disciplina_id`) REFERENCES `disciplina` (`id`),
  CONSTRAINT `periodo_id_refs_id_10ce50a3` FOREIGN KEY (`periodo_id`) REFERENCES `periodo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma`
--

LOCK TABLES `turma` WRITE;
/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
INSERT INTO `turma` VALUES (1,1,'Turma da Zueira',1,'2012-01-01','2017-01-01',70,50);
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma_alunos`
--

DROP TABLE IF EXISTS `turma_alunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turma_alunos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `turma_id` int(11) NOT NULL,
  `aluno_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `turma_id` (`turma_id`,`aluno_id`),
  KEY `turma_alunos_49a96667` (`turma_id`),
  KEY `turma_alunos_f5bb521d` (`aluno_id`),
  CONSTRAINT `turma_id_refs_id_e62a9b25` FOREIGN KEY (`turma_id`) REFERENCES `turma` (`id`),
  CONSTRAINT `aluno_id_refs_id_3216f867` FOREIGN KEY (`aluno_id`) REFERENCES `aluno` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma_alunos`
--

LOCK TABLES `turma_alunos` WRITE;
/*!40000 ALTER TABLE `turma_alunos` DISABLE KEYS */;
/*!40000 ALTER TABLE `turma_alunos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma_arquivo`
--

DROP TABLE IF EXISTS `turma_arquivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turma_arquivo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `turma_id` int(11) NOT NULL,
  `arquivo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `turma_id` (`turma_id`,`arquivo_id`),
  KEY `turma_arquivo_49a96667` (`turma_id`),
  KEY `turma_arquivo_9b0550d1` (`arquivo_id`),
  CONSTRAINT `turma_id_refs_id_42de6b77` FOREIGN KEY (`turma_id`) REFERENCES `turma` (`id`),
  CONSTRAINT `arquivo_id_refs_id_b912419c` FOREIGN KEY (`arquivo_id`) REFERENCES `arquivo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma_arquivo`
--

LOCK TABLES `turma_arquivo` WRITE;
/*!40000 ALTER TABLE `turma_arquivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `turma_arquivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma_horario`
--

DROP TABLE IF EXISTS `turma_horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turma_horario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `turma_id` int(11) NOT NULL,
  `horario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `turma_id` (`turma_id`,`horario_id`),
  KEY `turma_horario_49a96667` (`turma_id`),
  KEY `turma_horario_6e64cd21` (`horario_id`),
  CONSTRAINT `turma_id_refs_id_457a6045` FOREIGN KEY (`turma_id`) REFERENCES `turma` (`id`),
  CONSTRAINT `horario_id_refs_id_1794ba13` FOREIGN KEY (`horario_id`) REFERENCES `horario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma_horario`
--

LOCK TABLES `turma_horario` WRITE;
/*!40000 ALTER TABLE `turma_horario` DISABLE KEYS */;
/*!40000 ALTER TABLE `turma_horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma_noticia`
--

DROP TABLE IF EXISTS `turma_noticia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turma_noticia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `turma_id` int(11) NOT NULL,
  `noticia_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `turma_id` (`turma_id`,`noticia_id`),
  KEY `turma_noticia_49a96667` (`turma_id`),
  KEY `turma_noticia_f2536e2a` (`noticia_id`),
  CONSTRAINT `turma_id_refs_id_3305787f` FOREIGN KEY (`turma_id`) REFERENCES `turma` (`id`),
  CONSTRAINT `noticia_id_refs_id_92c4d57b` FOREIGN KEY (`noticia_id`) REFERENCES `noticia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma_noticia`
--

LOCK TABLES `turma_noticia` WRITE;
/*!40000 ALTER TABLE `turma_noticia` DISABLE KEYS */;
/*!40000 ALTER TABLE `turma_noticia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma_professor`
--

DROP TABLE IF EXISTS `turma_professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turma_professor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `turma_id` int(11) NOT NULL,
  `professor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `turma_id` (`turma_id`,`professor_id`),
  KEY `turma_professor_49a96667` (`turma_id`),
  KEY `turma_professor_b9498a38` (`professor_id`),
  CONSTRAINT `turma_id_refs_id_646204bc` FOREIGN KEY (`turma_id`) REFERENCES `turma` (`id`),
  CONSTRAINT `professor_id_refs_id_b0fae1b9` FOREIGN KEY (`professor_id`) REFERENCES `professor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma_professor`
--

LOCK TABLES `turma_professor` WRITE;
/*!40000 ALTER TABLE `turma_professor` DISABLE KEYS */;
/*!40000 ALTER TABLE `turma_professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidade`
--

DROP TABLE IF EXISTS `unidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidade`
--

LOCK TABLES `unidade` WRITE;
/*!40000 ALTER TABLE `unidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidade` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-08 11:22:38
