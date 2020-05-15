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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add Token',6,'add_token'),(17,'Can change Token',6,'change_token'),(18,'Can delete Token',6,'delete_token'),(19,'Can add cors model',7,'add_corsmodel'),(20,'Can change cors model',7,'change_corsmodel'),(21,'Can delete cors model',7,'delete_corsmodel'),(22,'Can add 系统用户表',8,'add_user'),(23,'Can change 系统用户表',8,'change_user'),(24,'Can delete 系统用户表',8,'delete_user'),(25,'Can add 视频表单',9,'add_basevideo'),(26,'Can change 视频表单',9,'change_basevideo'),(27,'Can delete 视频表单',9,'delete_basevideo'),(28,'Can add 分类表',10,'add_category'),(29,'Can change 分类表',10,'change_category'),(30,'Can delete 分类表',10,'delete_category'),(31,'Can add 评论表',11,'add_comment'),(32,'Can change 评论表',11,'change_comment'),(33,'Can delete 评论表',11,'delete_comment'),(34,'Can add 网站配置表',12,'add_config'),(35,'Can change 网站配置表',12,'change_config'),(36,'Can delete 网站配置表',12,'delete_config'),(37,'Can add 发现表',13,'add_discover'),(38,'Can change 发现表',13,'change_discover'),(39,'Can delete 发现表',13,'delete_discover'),(40,'Can add refresh token表',14,'add_refreshtoken'),(41,'Can change refresh token表',14,'change_refreshtoken'),(42,'Can delete refresh token表',14,'delete_refreshtoken'),(43,'Can add 系统角色表',15,'add_sysrole'),(44,'Can change 系统角色表',15,'change_sysrole'),(45,'Can delete 系统角色表',15,'delete_sysrole'),(46,'Can add 用户角色关联表',16,'add_sysuserrole'),(47,'Can change 用户角色关联表',16,'change_sysuserrole'),(48,'Can delete 用户角色关联表',16,'delete_sysuserrole'),(49,'Can add 标签表',17,'add_tags'),(50,'Can change 标签表',17,'change_tags'),(51,'Can delete 标签表',17,'delete_tags'),(52,'Can add 用户轨迹表',18,'add_travel'),(53,'Can change 用户轨迹表',18,'change_travel'),(54,'Can delete 用户轨迹表',18,'delete_travel');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corsheaders_corsmodel`
--

DROP TABLE IF EXISTS `corsheaders_corsmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corsheaders_corsmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cors` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corsheaders_corsmodel`
--

LOCK TABLES `corsheaders_corsmodel` WRITE;
/*!40000 ALTER TABLE `corsheaders_corsmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `corsheaders_corsmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_tb_user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','permission'),(3,'auth','group'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(6,'authtoken','token'),(7,'corsheaders','corsmodel'),(8,'backend','user'),(9,'backend','basevideo'),(10,'backend','category'),(11,'backend','comment'),(12,'backend','config'),(13,'backend','discover'),(14,'backend','refreshtoken'),(15,'backend','sysrole'),(16,'backend','sysuserrole'),(17,'backend','tags'),(18,'backend','travel');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-05-15 19:45:33.527641'),(2,'contenttypes','0002_remove_content_type_name','2020-05-15 19:45:33.614631'),(3,'auth','0001_initial','2020-05-15 19:45:33.853641'),(4,'auth','0002_alter_permission_name_max_length','2020-05-15 19:45:33.897440'),(5,'auth','0003_alter_user_email_max_length','2020-05-15 19:45:33.904428'),(6,'auth','0004_alter_user_username_opts','2020-05-15 19:45:33.911414'),(7,'auth','0005_alter_user_last_login_null','2020-05-15 19:45:33.919408'),(8,'auth','0006_require_contenttypes_0002','2020-05-15 19:45:33.923165'),(9,'auth','0007_alter_validators_add_error_messages','2020-05-15 19:45:33.929166'),(10,'auth','0008_alter_user_username_max_length','2020-05-15 19:45:33.936982'),(11,'auth','0009_alter_user_last_name_max_length','2020-05-15 19:45:33.943968'),(12,'backend','0001_initial','2020-05-15 19:45:35.020100'),(13,'admin','0001_initial','2020-05-15 19:45:35.122180'),(14,'admin','0002_logentry_remove_auto_add','2020-05-15 19:45:35.131717'),(15,'authtoken','0001_initial','2020-05-15 19:45:35.185969'),(16,'authtoken','0002_auto_20160226_1747','2020-05-15 19:45:35.242233'),(17,'corsheaders','0001_initial','2020-05-15 19:45:35.258189'),(18,'sessions','0001_initial','2020-05-15 19:45:35.311156');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
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
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_base_video`
--

DROP TABLE IF EXISTS `tb_base_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_base_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  `desc` varchar(500) NOT NULL,
  `artists` varchar(200) NOT NULL,
  `release_time` datetime(6) DEFAULT NULL,
  `res_url` varchar(300) NOT NULL,
  `thumbnail_url` varchar(300) NOT NULL,
  `cover_url` varchar(300) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `creater_id` int(11) NOT NULL,
  `creater_name` varchar(10) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `updater_id` int(11) NOT NULL,
  `updater_name` varchar(10) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_base_video_category_id_1524ece8` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_base_video`
--

LOCK TABLES `tb_base_video` WRITE;
/*!40000 ALTER TABLE `tb_base_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_base_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_base_video_tags`
--

DROP TABLE IF EXISTS `tb_base_video_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_base_video_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basevideo_id` int(11) NOT NULL,
  `tags_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_base_video_tags_basevideo_id_tags_id_0326a1aa_uniq` (`basevideo_id`,`tags_id`),
  KEY `tb_base_video_tags_basevideo_id_7567f009` (`basevideo_id`),
  KEY `tb_base_video_tags_tags_id_3f1fd9a0` (`tags_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_base_video_tags`
--

LOCK TABLES `tb_base_video_tags` WRITE;
/*!40000 ALTER TABLE `tb_base_video_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_base_video_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_category`
--

DROP TABLE IF EXISTS `tb_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(300) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `creater_id` int(11) NOT NULL,
  `creater_name` varchar(10) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `updater_name` varchar(10) NOT NULL,
  `updater_id` int(11) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_category`
--

LOCK TABLES `tb_category` WRITE;
/*!40000 ALTER TABLE `tb_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_comment`
--

DROP TABLE IF EXISTS `tb_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) NOT NULL,
  `score` decimal(4,2) NOT NULL,
  `creater_id` int(11) NOT NULL,
  `creater_name` varchar(10) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `video_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_comment_video_id_5f1903cd` (`video_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_comment`
--

LOCK TABLES `tb_comment` WRITE;
/*!40000 ALTER TABLE `tb_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_config`
--

DROP TABLE IF EXISTS `tb_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `value` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_config`
--

LOCK TABLES `tb_config` WRITE;
/*!40000 ALTER TABLE `tb_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_discover`
--

DROP TABLE IF EXISTS `tb_discover`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_discover` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content` longtext,
  `is_active` tinyint(1) NOT NULL,
  `creater_id` int(11) NOT NULL,
  `creater_name` varchar(10) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `updater_name` varchar(10) NOT NULL,
  `updater_id` int(11) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_discover`
--

LOCK TABLES `tb_discover` WRITE;
/*!40000 ALTER TABLE `tb_discover` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_discover` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_refresh_token`
--

DROP TABLE IF EXISTS `tb_refresh_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_refresh_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(80) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_refresh_token`
--

LOCK TABLES `tb_refresh_token` WRITE;
/*!40000 ALTER TABLE `tb_refresh_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_refresh_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_sys_role`
--

DROP TABLE IF EXISTS `tb_sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(300) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `creater_id` int(11) NOT NULL,
  `creater_name` varchar(10) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `updater_name` varchar(10) NOT NULL,
  `updater_id` int(11) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_sys_role`
--

LOCK TABLES `tb_sys_role` WRITE;
/*!40000 ALTER TABLE `tb_sys_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_sys_user_role`
--

DROP TABLE IF EXISTS `tb_sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_sys_user_role`
--

LOCK TABLES `tb_sys_user_role` WRITE;
/*!40000 ALTER TABLE `tb_sys_user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tags`
--

DROP TABLE IF EXISTS `tb_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(300) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `creater_id` int(11) NOT NULL,
  `creater_name` varchar(10) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `updater_name` varchar(10) NOT NULL,
  `updater_id` int(11) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tags`
--

LOCK TABLES `tb_tags` WRITE;
/*!40000 ALTER TABLE `tb_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_travel`
--

DROP TABLE IF EXISTS `tb_travel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_travel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `vid` int(11) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `action` varchar(40) NOT NULL,
  `access_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_travel`
--

LOCK TABLES `tb_travel` WRITE;
/*!40000 ALTER TABLE `tb_travel` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_travel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `creater_id` int(11) NOT NULL,
  `updater_id` int(11) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,'pbkdf2_sha256$100000$yguxFr8P4tYr$wou6iE09zMpocLjkN/ofakIuLm+u7HsaWzbMtkpQ6B4=',NULL,1,'admin','','','timehaswingss@gmail.com',1,1,'2020-05-15 19:46:41.437403','','',0,0,'2020-05-15 19:46:41.523694',0);
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_groups`
--

DROP TABLE IF EXISTS `tb_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_user_groups_user_id_group_id_adb62351_uniq` (`user_id`,`group_id`),
  KEY `tb_user_groups_user_id_162ae03c` (`user_id`),
  KEY `tb_user_groups_group_id_3d826fde` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_groups`
--

LOCK TABLES `tb_user_groups` WRITE;
/*!40000 ALTER TABLE `tb_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_user_permissions`
--

DROP TABLE IF EXISTS `tb_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_user_user_permissions_user_id_permission_id_fb1d58db_uniq` (`user_id`,`permission_id`),
  KEY `tb_user_user_permissions_user_id_1b639637` (`user_id`),
  KEY `tb_user_user_permissions_permission_id_83890c0b` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_user_permissions`
--

LOCK TABLES `tb_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `tb_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

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
