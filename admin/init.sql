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

INSERT INTO valley.tb_tags (name,`desc`,is_active,creater_id,creater_name,create_time,updater_name,updater_id,update_time,is_delete) VALUES
('MV','精彩MV',1,1,'admin','2020-05-15 20:10:05.062154','admin',1,'2020-05-15 20:10:05.062154',0)
,('舞台','劲爆舞台现场',1,1,'admin','2020-05-15 20:11:22.091035','admin',1,'2020-05-15 20:11:22.092033',0)
,('影视','经典影视片段',1,1,'admin','2020-05-15 20:11:48.898951','admin',1,'2020-05-15 20:11:48.899949',0)
,('福利','你懂得',1,1,'admin','2020-05-15 20:12:28.336756','admin',1,'2020-05-15 20:12:28.336756',0)
,('热门','热门',1,1,'admin','2020-05-15 20:13:54.437706','admin',1,'2020-05-15 20:13:54.437706',0)
,('推荐','推荐',1,1,'admin','2020-05-15 20:14:09.016324','admin',1,'2020-05-15 20:14:09.016324',0)
,('美女','美女',1,1,'admin','2020-05-15 20:14:39.099052','admin',1,'2020-05-15 20:14:39.099052',0)
,('热血','热血',1,1,'admin','2020-05-15 20:15:09.027803','admin',1,'2020-05-15 20:15:09.027803',0)
,('唯美','唯美',1,1,'admin','2020-05-15 20:15:23.065527','admin',1,'2020-05-15 20:15:23.065527',0)
,('搞笑','搞笑',1,1,'admin','2020-05-15 20:15:30.944179','admin',1,'2020-05-15 20:15:30.944179',0)
;

INSERT INTO valley.tb_tags (name,`desc`,is_active,creater_id,creater_name,create_time,updater_name,updater_id,update_time,is_delete) VALUES
('反转','反转',1,1,'admin','2020-05-15 20:15:45.179034','admin',1,'2020-05-15 20:15:45.179034',0)
,('其它','其它',1,1,'admin','2020-05-15 20:16:00.268121','admin',1,'2020-05-15 20:16:00.268121',0)
;

INSERT INTO valley.tb_sys_role (name,`desc`,is_active,creater_id,creater_name,create_time,updater_name,updater_id,update_time,is_delete) VALUES
('普通管理员','普通管理员',1,1,'admin','2020-05-16 09:50:01.913586','admin',1,'2020-05-16 09:50:01.913586',0)
,('访客','访客',1,1,'admin','2020-05-16 09:52:46.306713','admin',1,'2020-05-16 09:52:46.306713',0)
,('会员','会员',1,1,'admin','2020-05-16 09:53:12.143812','admin',1,'2020-05-16 09:53:12.144813',0)
,('贵宾','贵宾',1,1,'admin','2020-05-16 09:53:29.80572','admin',1,'2020-05-16 09:53:29.80572',0)
,('永久贵宾','永久贵宾',1,1,'admin','2020-05-16 09:54:05.485116','admin',1,'2020-05-16 09:54:05.485116',0)
;

INSERT INTO valley.tb_category (name,`desc`,is_active,creater_id,creater_name,create_time,updater_name,updater_id,update_time,is_delete) VALUES
('剧集','剧集',1,1,'admin','2020-05-15 20:18:27.658751','admin',1,'2020-05-15 20:18:27.658751',0)
,('电影','电影',1,1,'admin','2020-05-15 20:18:43.499049','admin',1,'2020-05-15 20:18:43.499049',0)
,('动漫','动漫',1,1,'admin','2020-05-15 20:18:49.753143','admin',1,'2020-05-15 20:18:49.753143',0)
,('综艺','综艺',1,1,'admin','2020-05-15 20:19:15.667381','admin',1,'2020-05-15 20:19:15.667381',0)
,('奇闻','奇闻',1,1,'admin','2020-05-15 20:19:32.933203','admin',1,'2020-05-15 20:19:32.934202',0)
,('游戏','游戏',1,1,'admin','2020-05-15 20:19:40.747209','admin',1,'2020-05-15 20:19:40.747209',0)
,('体育','体育',1,1,'admin','2020-05-15 20:19:47.936582','admin',1,'2020-05-15 20:19:47.936582',0)
,('火爆','火爆',1,1,'admin','2020-05-15 20:20:00.551137','admin',1,'2020-05-15 20:20:00.551137',0)
;
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
