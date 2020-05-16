-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: valley
-- ------------------------------------------------------
-- Server version	8.0.12

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

INSERT INTO `tb_user` VALUES (1,'pbkdf2_sha256$100000$yguxFr8P4tYr$wou6iE09zMpocLjkN/ofakIuLm+u7HsaWzbMtkpQ6B4=',NULL,1,'admin','','','timehaswingss@gmail.com',1,1,'2020-05-15 19:46:41.437403','','',0,0,'2020-05-15 19:46:41.523694',0);
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add Token',6,'add_token'),(17,'Can change Token',6,'change_token'),(18,'Can delete Token',6,'delete_token'),(19,'Can add cors model',7,'add_corsmodel'),(20,'Can change cors model',7,'change_corsmodel'),(21,'Can delete cors model',7,'delete_corsmodel'),(22,'Can add 系统用户表',8,'add_user'),(23,'Can change 系统用户表',8,'change_user'),(24,'Can delete 系统用户表',8,'delete_user'),(25,'Can add 视频表单',9,'add_basevideo'),(26,'Can change 视频表单',9,'change_basevideo'),(27,'Can delete 视频表单',9,'delete_basevideo'),(28,'Can add 分类表',10,'add_category'),(29,'Can change 分类表',10,'change_category'),(30,'Can delete 分类表',10,'delete_category'),(31,'Can add 评论表',11,'add_comment'),(32,'Can change 评论表',11,'change_comment'),(33,'Can delete 评论表',11,'delete_comment'),(34,'Can add 网站配置表',12,'add_config'),(35,'Can change 网站配置表',12,'change_config'),(36,'Can delete 网站配置表',12,'delete_config'),(37,'Can add 发现表',13,'add_discover'),(38,'Can change 发现表',13,'change_discover'),(39,'Can delete 发现表',13,'delete_discover'),(40,'Can add refresh token表',14,'add_refreshtoken'),(41,'Can change refresh token表',14,'change_refreshtoken'),(42,'Can delete refresh token表',14,'delete_refreshtoken'),(43,'Can add 系统角色表',15,'add_sysrole'),(44,'Can change 系统角色表',15,'change_sysrole'),(45,'Can delete 系统角色表',15,'delete_sysrole'),(46,'Can add 用户角色关联表',16,'add_sysuserrole'),(47,'Can change 用户角色关联表',16,'change_sysuserrole'),(48,'Can delete 用户角色关联表',16,'delete_sysuserrole'),(49,'Can add 标签表',17,'add_tags'),(50,'Can change 标签表',17,'change_tags'),(51,'Can delete 标签表',17,'delete_tags'),(52,'Can add 用户轨迹表',18,'add_travel'),(53,'Can change 用户轨迹表',18,'change_travel'),(54,'Can delete 用户轨迹表',18,'delete_travel');
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','permission'),(3,'auth','group'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(6,'authtoken','token'),(7,'corsheaders','corsmodel'),(8,'backend','user'),(9,'backend','basevideo'),(10,'backend','category'),(11,'backend','comment'),(12,'backend','config'),(13,'backend','discover'),(14,'backend','refreshtoken'),(15,'backend','sysrole'),(16,'backend','sysuserrole'),(17,'backend','tags'),(18,'backend','travel');

--
-- Dumping routines for database 'valley'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-15 19:48:02
