-- MySQL dump 10.13  Distrib 5.7.32, for Linux (x86_64)
--
-- Host: localhost    Database: dzqdatabase_placeholder
-- ------------------------------------------------------
-- Server version	5.7.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `dzqdatabase_placeholder`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dzqdatabase_placeholder` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `dzqdatabase_placeholder`;

--
-- Table structure for table `ppre_attachments`
--

DROP TABLE IF EXISTS `ppre_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_attachments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '附件 id',
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'uuid',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户 id',
  `type_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '类型数据ID(post_id,dialog_message_id…)',
  `order` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件排序',
  `type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型(0帖子附件，1帖子图片，2帖子视频，3帖子音频，4消息图片)',
  `is_remote` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否远程附件',
  `is_approved` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否合法',
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件系统生成的名称',
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件路径',
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件原名称',
  `file_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `file_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件类型',
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ip 地址',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_attachments`
--

LOCK TABLES `ppre_attachments` WRITE;
/*!40000 ALTER TABLE `ppre_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_categories`
--

DROP TABLE IF EXISTS `ppre_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类 id',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类描述',
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类图标',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '显示顺序',
  `property` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '属性：0 正常 1 首页展示',
  `thread_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题数',
  `moderators` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类版主',
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ip 地址',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_categories`
--

LOCK TABLES `ppre_categories` WRITE;
/*!40000 ALTER TABLE `ppre_categories` DISABLE KEYS */;
INSERT INTO `ppre_categories` VALUES (1,'默认分类','默认分类','',0,0,0,NULL,'127.0.0.1','2020-11-27 11:49:40','2020-11-27 11:49:40');
/*!40000 ALTER TABLE `ppre_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_deny_users`
--

DROP TABLE IF EXISTS `ppre_deny_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_deny_users` (
  `user_id` bigint(20) unsigned NOT NULL,
  `deny_user_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_deny_users`
--

LOCK TABLES `ppre_deny_users` WRITE;
/*!40000 ALTER TABLE `ppre_deny_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_deny_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_dialog`
--

DROP TABLE IF EXISTS `ppre_dialog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_dialog` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `dialog_message_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '最新消息ID',
  `sender_user_id` bigint(20) unsigned NOT NULL COMMENT '发送人UID',
  `recipient_user_id` bigint(20) unsigned NOT NULL COMMENT '收信人UID',
  `recipient_read_at` datetime DEFAULT NULL COMMENT '收信人阅读时间',
  `sender_read_at` datetime DEFAULT NULL COMMENT '发送人阅读时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `sender_deleted_at` datetime DEFAULT NULL COMMENT '发送人删除时间',
  `recipient_deleted_at` datetime DEFAULT NULL COMMENT '收信人删除时间',
  PRIMARY KEY (`id`),
  KEY `sender_user_id` (`sender_user_id`),
  KEY `recipient_user_id` (`recipient_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_dialog`
--

LOCK TABLES `ppre_dialog` WRITE;
/*!40000 ALTER TABLE `ppre_dialog` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_dialog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_dialog_message`
--

DROP TABLE IF EXISTS `ppre_dialog_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_dialog_message` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `dialog_id` bigint(20) unsigned NOT NULL COMMENT '会话ID',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `attachment_id` bigint(20) unsigned NOT NULL COMMENT '附件ID',
  `message_text` text COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_dialog_id` (`dialog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_dialog_message`
--

LOCK TABLES `ppre_dialog_message` WRITE;
/*!40000 ALTER TABLE `ppre_dialog_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_dialog_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_emoji`
--

DROP TABLE IF EXISTS `ppre_emoji`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_emoji` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '表情 id',
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '表情分类',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '表情地址',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '表情符号',
  `order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '显示顺序',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_emoji`
--

LOCK TABLES `ppre_emoji` WRITE;
/*!40000 ALTER TABLE `ppre_emoji` DISABLE KEYS */;
INSERT INTO `ppre_emoji` VALUES (1,'qq','emoji/qq/kelian.gif',':kelian:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(2,'qq','emoji/qq/haqian.gif',':haqian:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(3,'qq','emoji/qq/woshou.gif',':woshou:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(4,'qq','emoji/qq/aixin.gif',':aixin:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(5,'qq','emoji/qq/zuohengheng.gif',':zuohengheng:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(6,'qq','emoji/qq/weixiao.gif',':weixiao:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(7,'qq','emoji/qq/jingkong.gif',':jingkong:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(8,'qq','emoji/qq/tiaopi.gif',':tiaopi:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(9,'qq','emoji/qq/touxiao.gif',':touxiao:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(10,'qq','emoji/qq/youling.gif',':youling:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(11,'qq','emoji/qq/caidao.gif',':caidao:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(12,'qq','emoji/qq/cahan.gif',':cahan:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(13,'qq','emoji/qq/hecai.gif',':hecai:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(14,'qq','emoji/qq/keai.gif',':keai:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(15,'qq','emoji/qq/ciya.gif',':ciya:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(16,'qq','emoji/qq/saorao.gif',':saorao:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(17,'qq','emoji/qq/jingxi.gif',':jingxi:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(18,'qq','emoji/qq/ku.gif',':ku:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(19,'qq','emoji/qq/piezui.gif',':piezui:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(20,'qq','emoji/qq/se.gif',':se:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(21,'qq','emoji/qq/xia.gif',':xia:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(22,'qq','emoji/qq/yinxian.gif',':yinxian:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(23,'qq','emoji/qq/zhouma.gif',':zhouma:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(24,'qq','emoji/qq/kulou.gif',':kulou:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(25,'qq','emoji/qq/xu.gif',':xu:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(26,'qq','emoji/qq/jingya.gif',':jingya:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(27,'qq','emoji/qq/doge.gif',':doge:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(28,'qq','emoji/qq/bizui.gif',':bizui:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(29,'qq','emoji/qq/yangtuo.gif',':yangtuo:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(30,'qq','emoji/qq/shouqiang.gif',':shouqiang:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(31,'qq','emoji/qq/baoquan.gif',':baoquan:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(32,'qq','emoji/qq/yun.gif',':yun:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(33,'qq','emoji/qq/lanqiu.gif',':lanqiu:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(34,'qq','emoji/qq/zhemo.gif',':zhemo:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(35,'qq','emoji/qq/guzhang.gif',':guzhang:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(36,'qq','emoji/qq/shengli.gif',':shengli:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(37,'qq','emoji/qq/zaijian.gif',':zaijian:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(38,'qq','emoji/qq/dabing.gif',':dabing:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(39,'qq','emoji/qq/deyi.gif',':deyi:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(40,'qq','emoji/qq/hanxiao.gif',':hanxiao:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(41,'qq','emoji/qq/kun.gif',':kun:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(42,'qq','emoji/qq/hexie.gif',':hexie:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(43,'qq','emoji/qq/daku.gif',':daku:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(44,'qq','emoji/qq/wozuimei.gif',':wozuimei:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(45,'qq','emoji/qq/xiaoku.gif',':xiaoku:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(46,'qq','emoji/qq/xigua.gif',':xigua:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(47,'qq','emoji/qq/huaixiao.gif',':huaixiao:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(48,'qq','emoji/qq/liulei.gif',':liulei:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(49,'qq','emoji/qq/lenghan.gif',':lenghan:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(50,'qq','emoji/qq/qiudale.gif',':qiudale:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(51,'qq','emoji/qq/zhayanjian.gif',':zhayanjian:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(52,'qq','emoji/qq/qiaoda.gif',':qiaoda:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(53,'qq','emoji/qq/baojin.gif',':baojin:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(54,'qq','emoji/qq/OK.gif',':OK:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(55,'qq','emoji/qq/xiaojiujie.gif',':xiaojiujie:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(56,'qq','emoji/qq/gouyin.gif',':gouyin:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(57,'qq','emoji/qq/youhengheng.gif',':youhengheng:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(58,'qq','emoji/qq/tuosai.gif',':tuosai:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(59,'qq','emoji/qq/nanguo.gif',':nanguo:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(60,'qq','emoji/qq/quantou.gif',':quantou:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(61,'qq','emoji/qq/haixiu.gif',':haixiu:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(62,'qq','emoji/qq/koubi.gif',':koubi:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(63,'qq','emoji/qq/qiang.gif',':qiang:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(64,'qq','emoji/qq/pijiu.gif',':pijiu:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(65,'qq','emoji/qq/bishi.gif',':bishi:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(66,'qq','emoji/qq/yiwen.gif',':yiwen:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(67,'qq','emoji/qq/liuhan.gif',':liuhan:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(68,'qq','emoji/qq/wunai.gif',':wunai:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(69,'qq','emoji/qq/aini.gif',':aini:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(70,'qq','emoji/qq/bangbangtang.gif',':bangbangtang:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(71,'qq','emoji/qq/penxue.gif',':penxue:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(72,'qq','emoji/qq/haobang.gif',':haobang:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(73,'qq','emoji/qq/qinqin.gif',':qinqin:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(74,'qq','emoji/qq/xiaoyanger.gif',':xiaoyanger:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(75,'qq','emoji/qq/fendou.gif',':fendou:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(76,'qq','emoji/qq/ganga.gif',':ganga:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(77,'qq','emoji/qq/shuai.gif',':shuai:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(78,'qq','emoji/qq/juhua.gif',':juhua:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(79,'qq','emoji/qq/baiyan.gif',':baiyan:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(80,'qq','emoji/qq/fanu.gif',':fanu:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(81,'qq','emoji/qq/jie.gif',':jie:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(82,'qq','emoji/qq/chi.gif',':chi:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(83,'qq','emoji/qq/kuaikule.gif',':kuaikule:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(84,'qq','emoji/qq/zhuakuang.gif',':zhuakuang:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(85,'qq','emoji/qq/shui.gif',':shui:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(86,'qq','emoji/qq/dan.gif',':dan:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(87,'qq','emoji/qq/aoman.gif',':aoman:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(88,'qq','emoji/qq/fadai.gif',':fadai:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(89,'qq','emoji/qq/leiben.gif',':leiben:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(90,'qq','emoji/qq/tu.gif',':tu:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(91,'qq','emoji/qq/weiqu.gif',':weiqu:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40'),(92,'qq','emoji/qq/xieyanxiao.gif',':xieyanxiao:',0,'2020-11-27 11:49:40','2020-11-27 11:49:40');
/*!40000 ALTER TABLE `ppre_emoji` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_finance`
--

DROP TABLE IF EXISTS `ppre_finance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_finance` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `income` decimal(10,2) unsigned NOT NULL COMMENT '用户充值金额',
  `withdrawal` decimal(10,2) unsigned NOT NULL COMMENT '用户提现金额',
  `order_count` int(10) unsigned NOT NULL COMMENT '订单数量',
  `order_amount` decimal(10,2) unsigned NOT NULL COMMENT '订单金额',
  `total_profit` decimal(10,2) unsigned NOT NULL COMMENT '平台盈利',
  `register_profit` decimal(10,2) unsigned NOT NULL COMMENT '注册收入',
  `master_portion` decimal(10,2) unsigned NOT NULL COMMENT '打赏贴的分成',
  `withdrawal_profit` decimal(10,2) unsigned NOT NULL COMMENT '提现手续费收入',
  `created_at` date NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_finance`
--

LOCK TABLES `ppre_finance` WRITE;
/*!40000 ALTER TABLE `ppre_finance` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_finance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_group_paid_users`
--

DROP TABLE IF EXISTS `ppre_group_paid_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_group_paid_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '所属用户',
  `group_id` bigint(20) unsigned NOT NULL COMMENT '用户组 id',
  `order_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '订单 id',
  `operator_id` bigint(20) unsigned DEFAULT NULL COMMENT '操作人',
  `delete_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '删除类型：1到期删除，2管理员修改，3用户复购',
  `expiration_time` datetime NOT NULL COMMENT '用户组到期时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_group_paid_users`
--

LOCK TABLES `ppre_group_paid_users` WRITE;
/*!40000 ALTER TABLE `ppre_group_paid_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_group_paid_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_group_permission`
--

DROP TABLE IF EXISTS `ppre_group_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_group_permission` (
  `group_id` bigint(20) unsigned NOT NULL COMMENT '用户组 id',
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '权限名称',
  PRIMARY KEY (`group_id`,`permission`),
  CONSTRAINT `ppre_group_permission_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `ppre_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_group_permission`
--

LOCK TABLES `ppre_group_permission` WRITE;
/*!40000 ALTER TABLE `ppre_group_permission` DISABLE KEYS */;
INSERT INTO `ppre_group_permission` VALUES (6,'order.create'),(6,'trade.pay.order'),(7,'category1.thread.viewPosts'),(7,'category1.viewThreads'),(7,'switch.thread.viewPosts'),(7,'switch.viewThreads'),(7,'user.view'),(10,'attachment.create.0'),(10,'attachment.create.1'),(10,'cash.create'),(10,'category1.createThread'),(10,'category1.thread.reply'),(10,'category1.thread.viewPosts'),(10,'category1.viewThreads'),(10,'createThread.0'),(10,'createThread.1'),(10,'createThread.3'),(10,'createThread.5'),(10,'createThread.6'),(10,'dialog.create'),(10,'order.create'),(10,'switch.createThread'),(10,'switch.thread.reply'),(10,'switch.thread.viewPosts'),(10,'switch.viewThreads'),(10,'thread.favorite'),(10,'thread.likePosts'),(10,'trade.pay.order'),(10,'user.view'),(10,'userFollow.create');
/*!40000 ALTER TABLE `ppre_group_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_group_user`
--

DROP TABLE IF EXISTS `ppre_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_group_user` (
  `group_id` bigint(20) unsigned NOT NULL COMMENT '用户组 id',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户 id',
  `expiration_time` datetime DEFAULT NULL COMMENT '用户组到期时间',
  PRIMARY KEY (`group_id`,`user_id`),
  KEY `ppre_group_user_user_id_foreign` (`user_id`),
  CONSTRAINT `ppre_group_user_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `ppre_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ppre_group_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ppre_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_group_user`
--

LOCK TABLES `ppre_group_user` WRITE;
/*!40000 ALTER TABLE `ppre_group_user` DISABLE KEYS */;
INSERT INTO `ppre_group_user` VALUES (1,1,NULL);
/*!40000 ALTER TABLE `ppre_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_groups`
--

DROP TABLE IF EXISTS `ppre_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组 id',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户组名称',
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '类型',
  `color` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '颜色',
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'icon',
  `default` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否默认',
  `is_display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否显示在用户名后',
  `is_paid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否收费：0不收费，1收费',
  `fee` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '收费金额',
  `days` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '付费获得天数',
  `scale` double(3,1) NOT NULL DEFAULT '0.0' COMMENT '分成比例',
  `is_subordinate` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否可以 推广下线',
  `is_commission` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否可以 收入提成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_groups`
--

LOCK TABLES `ppre_groups` WRITE;
/*!40000 ALTER TABLE `ppre_groups` DISABLE KEYS */;
INSERT INTO `ppre_groups` VALUES (1,'管理员','','','',0,0,0,0.00,0,0.0,0,0),(6,'待付费','','','',0,0,0,0.00,0,0.0,0,0),(7,'游客','','','',0,0,0,0.00,0,0.0,0,0),(10,'普通会员','','','',1,0,0,0.00,0,0.0,0,0);
/*!40000 ALTER TABLE `ppre_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_invites`
--

DROP TABLE IF EXISTS `ppre_invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_invites` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '邀请 id',
  `group_id` bigint(20) unsigned NOT NULL COMMENT '默认用户组 id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型:1普通用户2管理员',
  `code` char(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '邀请码',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '邀请码生效时间',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '邀请码结束时间',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '邀请用户 id',
  `to_user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被邀请用户 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '邀请码状态:0失效1未使用2已使用3已过期',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_code` (`code`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_invites`
--

LOCK TABLES `ppre_invites` WRITE;
/*!40000 ALTER TABLE `ppre_invites` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_invites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_migrations`
--

DROP TABLE IF EXISTS `ppre_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_migrations`
--

LOCK TABLES `ppre_migrations` WRITE;
/*!40000 ALTER TABLE `ppre_migrations` DISABLE KEYS */;
INSERT INTO `ppre_migrations` VALUES (1,'2020_01_01_000001_create_users',1),(2,'2020_01_01_000002_create_groups',1),(3,'2020_01_01_000003_create_group_permission',1),(4,'2020_01_01_000004_create_group_user',1),(5,'2020_01_01_000005_create_categories',1),(6,'2020_01_01_000006_create_threads',1),(7,'2020_01_01_000007_create_posts',1),(8,'2020_01_01_000008_create_thread_user',1),(9,'2020_01_01_000009_create_post_user',1),(10,'2020_01_01_000010_create_post_mod',1),(11,'2020_01_01_000011_create_attachments',1),(12,'2020_01_01_000012_create_stop_words',1),(13,'2020_01_01_000013_create_operation_log',1),(14,'2020_01_01_000014_create_orders',1),(15,'2020_01_01_000015_create_pay_notify',1),(16,'2020_01_01_000016_create_user_wechats',1),(17,'2020_01_01_000017_create_user_wallets',1),(18,'2020_01_01_000018_create_user_wallet_cash',1),(19,'2020_01_01_000019_create_user_wallet_logs',1),(20,'2020_01_01_000020_create_user_login_fail_log',1),(21,'2020_01_01_000021_create_emoji',1),(22,'2020_01_01_000022_create_invites',1),(23,'2020_01_01_000023_create_mobile_codes',1),(24,'2020_01_01_000024_create_notifications',1),(25,'2020_01_01_000025_create_settings',1),(26,'2020_01_01_000026_create_user_follow',1),(27,'2020_01_01_000027_create_finance',1),(28,'2020_01_01_000028_create_dialog',1),(29,'2020_01_01_000029_create_dialog_message',1),(30,'2020_01_01_000030_create_notification_tpls',1),(31,'2020_01_01_000031_create_session_tokens',1),(32,'2020_01_01_000032_create_thread_video',1),(33,'2020_03_20_104938_add_order_to_attachments',1),(34,'2020_03_24_183227_create_user_wallet_fail_logs',1),(35,'2020_03_28_012029_alter_users',1),(36,'2020_04_14_101710_add_is_anonymous_to_orders',1),(37,'2020_04_14_104730_update_users_table',1),(38,'2020_04_14_174156_add_liked_count_to_users',1),(39,'2020_04_16_134237_create_post_mentions_user',1),(40,'2020_04_16_162908_add_free_words_to_threads',1),(41,'2020_04_17_152036_add_paid_count_to_threads',1),(42,'2020_04_20_185606_add_read_at_to_dialog',1),(43,'2020_04_23_143614_add_is_display_to_groups',1),(44,'2020_04_23_154946_create_topics',1),(45,'2020_04_23_155120_create_thread_topic',1),(46,'2020_04_26_111725_create_reports',1),(47,'2020_04_26_142056_create_deny_users',1),(48,'2020_04_30_150256_rename_operation_log_to_user_action_logs',1),(49,'2020_04_30_153136_create_operation_logs',1),(50,'2020_05_07_174510_add_location_to_posts',1),(51,'2020_05_08_172741_create_post_goods',1),(52,'2020_05_11_164733_create_group_paid_users',1),(53,'2020_05_11_164907_alter_add_expiration_time_to_groups',1),(54,'2020_05_11_165014_alter_add_groups_paid_mod',1),(55,'2020_05_11_165120_alter_add_group_id_to_orders',1),(56,'2020_05_11_175730_change_thread_video_columns',1),(57,'2020_05_21_191500_alter_user_wechats',1),(58,'2020_06_01_114859_alter_type_to_attachments',1),(59,'2020_06_01_172353_alter_attachment_to_dialog_message',1),(60,'2020_06_03_170416_alter_add_port_to_users',1),(61,'2020_06_03_170507_alter_add_port_to_posts',1),(62,'2020_06_08_155901_create_user_qq',1),(63,'2020_06_08_155901_create_user_qy_wechats',1),(64,'2020_06_10_105230_alter_add_foreign_key_to_user_follow',1),(65,'2020_06_10_115509_alter_bigint_to_all',1),(66,'2020_06_10_190229_alter_foreign_key_to_user_wechats',1),(67,'2020_06_12_185624_create_wechat_offiaccount_replies',1),(68,'2020_06_16_161128_change_threads_free_words_column_length',1),(69,'2020_06_23_170151_change_wechat_offiaccount_replies_column',1),(70,'2020_07_01_143404_change_user_wchats_user_id_to_null',1),(71,'2020_07_03_171957_change_timestamps_to_datetime',1),(72,'2020_07_15_183427_add_posts_reply_post_id_index',1),(73,'2020_07_22_180923_add_duration_to_thread_video',1),(74,'2020_07_24_145712_add_expired_at_to_orders',1),(75,'2020_08_03_183433_change_scale_to_groups',1),(76,'2020_08_04_154120_create_user_distributions',1),(77,'2020_08_05_114608_add_category_id_index_to_threads',1),(78,'2020_08_05_233234_add_be_scale_to_orders',1),(79,'2020_08_07_174108_add_code_unique_to_invites',1),(80,'2020_08_12_142541_create_user_ucenters',1),(81,'2020_08_12_161140_alert_add_recommended_to_topics',1),(82,'2020_08_12_161154_alert_add_recommended_at_to_topics',1),(83,'2020_08_17_111947_add_location_to_threads',1),(84,'2020_08_20_104455_add_is_subordinate_is_commission_to_groups',1),(85,'2020_08_26_181122_add_address_to_threads',1),(86,'2020_09_03_153645_add_moderators_to_categories',1),(87,'2020_09_04_152844_create_questions',1),(88,'2020_09_05_122736_add_question_id_to_user_wallet_logs',1),(89,'2020_09_08_111818_add_cash_type_to_user_wallet_cash',1),(90,'2020_09_09_184716_add_third_party_to_orders',1),(91,'2020_09_09_203924_add_foreign_keys_to_group_permission',1),(92,'2020_09_14_150620_add_is_site_to_threads',1),(93,'2020_09_21_184613_add_attachment_price_to_threads',1),(94,'2020_09_25_164242_add_delete_at_to_dialog',1),(95,'2020_09_27_175432_add_index_to_dialog_message',1),(96,'2020_09_27_184315_add_question_count_to_users',1),(97,'2020_10_12_160100_add_answered_at_to_questions',1),(98,'2020_10_13_190715_change_is_anonymous',1),(99,'2020_10_21_152510_add_signature_and_dialog_to_stop_words',1),(100,'2020_10_26_135924_add_is_display_to_threads',1),(101,'2020_10_26_141128_alter_thread_add_free_percent',1),(102,'2020_11_10_192530_add_some_index_to_user_wechats',1),(103,'2020_11_11_105024_change_price_to_post_goods',1);
/*!40000 ALTER TABLE `ppre_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_mobile_codes`
--

DROP TABLE IF EXISTS `ppre_mobile_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_mobile_codes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '验证码 id',
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '验证码',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '验证类型',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '验证状态',
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ip',
  `expired_at` datetime DEFAULT NULL COMMENT '验证码过期时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_mobile_codes`
--

LOCK TABLES `ppre_mobile_codes` WRITE;
/*!40000 ALTER TABLE `ppre_mobile_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_mobile_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_notification_tpls`
--

DROP TABLE IF EXISTS `ppre_notification_tpls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_notification_tpls` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '模板状态:1开启0关闭',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '通知类型:0系统1微信2短信',
  `type_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '类型名称',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `vars` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '可选的变量',
  `template_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '模板ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_notification_tpls`
--

LOCK TABLES `ppre_notification_tpls` WRITE;
/*!40000 ALTER TABLE `ppre_notification_tpls` DISABLE KEYS */;
INSERT INTO `ppre_notification_tpls` VALUES (1,1,0,'新用户注册并加入后','欢迎加入{sitename}','{username}你好，你已经成为{sitename} 的{groupname} ，请你在发表言论时，遵守当地法律法规。祝你在这里玩的愉快。','a:3:{s:10:\"{username}\";s:9:\"用户名\";s:10:\"{sitename}\";s:12:\"站点名称\";s:11:\"{groupname}\";s:9:\"用户组\";}',''),(2,1,0,'注册审核通过通知','注册审核通知','{username}你好，你的注册申请已审核通过。','a:1:{s:10:\"{username}\";s:9:\"用户名\";}',''),(3,1,0,'注册审核不通过通知','注册审核通知','{username}你好，你的注册申请审核不通过，原因：{reason}','a:2:{s:10:\"{username}\";s:9:\"用户名\";s:8:\"{reason}\";s:6:\"原因\";}',''),(4,1,0,'内容审核不通过通知','内容审核通知','{username}你好，你发布的内容 \"{content}\" 审核不通过，原因：{reason}','a:3:{s:10:\"{username}\";s:9:\"用户名\";s:9:\"{content}\";s:6:\"内容\";s:8:\"{reason}\";s:6:\"原因\";}',''),(5,1,0,'内容审核通过通知','内容审核通知','{username}你好，你发布的内容 \"{content}\" 审核通过','a:2:{s:10:\"{username}\";s:9:\"用户名\";s:9:\"{content}\";s:6:\"内容\";}',''),(6,1,0,'内容删除通知','内容通知','{username}你好，你发布的内容 \"{content} \" 已删除，原因：{reason}','a:3:{s:10:\"{username}\";s:9:\"用户名\";s:9:\"{content}\";s:6:\"内容\";s:8:\"{reason}\";s:6:\"原因\";}',''),(7,1,0,'内容精华通知','内容通知','{username}你好，你发布的内容 \"{content}\" 已设为精华','a:2:{s:10:\"{username}\";s:9:\"用户名\";s:9:\"{content}\";s:6:\"内容\";}',''),(8,1,0,'内容置顶通知','内容通知','{username}你好，你发布的内容 \"{content}\" 已置顶','a:2:{s:10:\"{username}\";s:9:\"用户名\";s:9:\"{content}\";s:6:\"内容\";}',''),(9,1,0,'内容修改通知','内容通知','{username}你好，你发布的内容 \"{content}\" 已被修改','a:2:{s:10:\"{username}\";s:9:\"用户名\";s:9:\"{content}\";s:6:\"内容\";}',''),(10,1,0,'用户禁用通知','用户通知','{username}你好，你的帐号已禁用，原因：{reason}','a:2:{s:10:\"{username}\";s:9:\"用户名\";s:8:\"{reason}\";s:6:\"原因\";}',''),(11,1,0,'用户解除禁用通知','用户通知','{username}你好，你的帐号已解除禁用','a:1:{s:10:\"{username}\";s:9:\"用户名\";}',''),(12,1,0,'用户角色调整通知','角色通知','{username}你好，你的角色由{oldgroupname}变更为{newgroupname}','a:3:{s:10:\"{username}\";s:9:\"用户名\";s:14:\"{oldgroupname}\";s:12:\"老用户组\";s:14:\"{newgroupname}\";s:12:\"新用户组\";}',''),(13,0,1,'新用户注册并加入后','微信注册通知','{\"data\":{\"first\":{\"value\":\"\\u4f60\\u597d\\uff0c\\u6b22\\u8fce\\u52a0\\u5165{sitename}\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{username}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{dateline}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u8bf7\\u4f60\\u5728\\u53d1\\u8868\\u8a00\\u8bba\\u65f6\\uff0c\\u9075\\u5b88\\u5f53\\u5730\\u6cd5\\u5f8b\\u6cd5\\u89c4\\u3002\\u795d\\u4f60\\u5728\\u8fd9\\u91cc\\u73a9\\u7684\\u6109\\u5feb\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:4:{s:10:\"{sitename}\";s:12:\"站点名称\";s:10:\"{username}\";s:9:\"用户名\";s:10:\"{dateline}\";s:12:\"通知时间\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";}',''),(14,0,1,'注册审核通过通知','微信注册审核通知','{\"data\":{\"first\":{\"value\":\"\\u4f60\\u7684\\u6ce8\\u518c\\u7533\\u8bf7\\u5df2\\u5ba1\\u6838\\u901a\\u8fc7\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{username}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{dateline}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u795d\\u4f60\\u5728\\u8fd9\\u91cc\\u73a9\\u7684\\u6109\\u5feb\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:3:{s:10:\"{username}\";s:9:\"用户名\";s:10:\"{dateline}\";s:12:\"通知时间\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";}',''),(15,0,1,'注册审核不通过通知','微信注册审核通知','{\"data\":{\"first\":{\"value\":\"\\u4f60\\u7684\\u6ce8\\u518c\\u7533\\u8bf7\\u5ba1\\u6838\\u4e0d\\u901a\\u8fc7\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{username}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{dateline}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u91cd\\u65b0\\u63d0\\u4ea4\\u7533\\u8bf7\",\"color\":\"#173177\"},\"keyword3\":{\"value\":\"{reason}\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:4:{s:10:\"{username}\";s:9:\"用户名\";s:10:\"{dateline}\";s:6:\"时间\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";s:8:\"{reason}\";s:6:\"原因\";}',''),(16,0,1,'内容审核通过通知','微信内容审核通知','{\"data\":{\"first\":{\"value\":\"\\u4f60\\u53d1\\u5e03\\u7684\\u5185\\u5bb9\\u5df2\\u5ba1\\u6838\\u901a\\u8fc7\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{content}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{dateline}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u67e5\\u770b\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:3:{s:9:\"{content}\";s:6:\"内容\";s:10:\"{dateline}\";s:12:\"通知时间\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";}',''),(17,0,1,'内容审核不通过通知','微信内容审核通知','{\"data\":{\"first\":{\"value\":\"\\u4f60\\u53d1\\u5e03\\u7684\\u5185\\u5bb9\\u5ba1\\u6838\\u4e0d\\u901a\\u8fc7\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{content}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{reason}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u67e5\\u770b\",\"color\":\"#173177\"},\"keyword3\":{\"value\":\"{dateline}\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:4:{s:9:\"{content}\";s:6:\"内容\";s:10:\"{dateline}\";s:12:\"通知时间\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";s:8:\"{reason}\";s:6:\"原因\";}',''),(18,0,1,'内容删除通知','微信内容通知','{\"data\":{\"first\":{\"value\":\"\\u4f60\\u53d1\\u5e03\\u7684\\u5185\\u5bb9\\u5df2\\u5220\\u9664\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{content}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{reason}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u67e5\\u770b\",\"color\":\"#173177\"},\"keyword3\":{\"value\":\"{dateline}\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:4:{s:9:\"{content}\";s:6:\"内容\";s:10:\"{dateline}\";s:12:\"通知时间\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";s:8:\"{reason}\";s:6:\"原因\";}',''),(19,0,1,'内容精华通知','微信内容通知','{\"data\":{\"first\":{\"value\":\"\\u4f60\\u53d1\\u5e03\\u7684\\u5185\\u5bb9\\u5df2\\u8bbe\\u4e3a\\u7cbe\\u534e\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{content}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{dateline}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u67e5\\u770b\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:3:{s:9:\"{content}\";s:6:\"内容\";s:10:\"{dateline}\";s:12:\"通知时间\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";}',''),(20,0,1,'内容置顶通知','微信内容通知','{\"data\":{\"first\":{\"value\":\"\\u4f60\\u53d1\\u5e03\\u7684\\u5185\\u5bb9\\u5df2\\u7f6e\\u9876\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{content}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{dateline}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u67e5\\u770b\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:3:{s:9:\"{content}\";s:6:\"内容\";s:10:\"{dateline}\";s:12:\"通知时间\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";}',''),(21,0,1,'内容修改通知','微信内容通知','{\"data\":{\"first\":{\"value\":\"\\u4f60\\u53d1\\u5e03\\u7684\\u5185\\u5bb9\\u5df2\\u88ab\\u4fee\\u6539\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{content}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{dateline}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u67e5\\u770b\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:3:{s:9:\"{content}\";s:6:\"内容\";s:10:\"{dateline}\";s:12:\"通知时间\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";}',''),(22,0,1,'帐号禁用通知','微信用户通知','{\"data\":{\"first\":{\"value\":\"\\u4f60\\u7684\\u5e10\\u53f7\\u5df2\\u7981\\u7528\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{username}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{reason}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u67e5\\u770b\",\"color\":\"#173177\"},\"keyword3\":{\"value\":\"{dateline}\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:4:{s:10:\"{username}\";s:9:\"用户名\";s:10:\"{dateline}\";s:12:\"通知时间\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";s:8:\"{reason}\";s:6:\"原因\";}',''),(23,0,1,'用户解除禁用通知','微信用户通知','{\"data\":{\"first\":{\"value\":\"\\u4f60\\u7684\\u5e10\\u53f7\\u5df2\\u89e3\\u9664\\u7981\\u7528\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{username}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{dateline}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u67e5\\u770b\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:3:{s:10:\"{username}\";s:9:\"用户名\";s:10:\"{dateline}\";s:12:\"通知时间\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";}',''),(24,0,1,'用户角色调整通知','微信角色通知','{\"data\":{\"first\":{\"value\":\"\\u4f60\\u7684\\u89d2\\u8272\\u5df2\\u53d8\\u66f4\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{username}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{oldgroupname}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u67e5\\u770b\",\"color\":\"#173177\"},\"keyword3\":{\"value\":\"{newgroupname}\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:4:{s:10:\"{username}\";s:9:\"用户名\";s:14:\"{oldgroupname}\";s:9:\"原角色\";s:14:\"{newgroupname}\";s:9:\"新角色\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";}',''),(25,1,0,'内容回复通知','内容通知','','',''),(26,1,0,'内容点赞通知','内容通知','','',''),(27,1,0,'内容支付通知','内容通知','','',''),(28,1,0,'内容@通知','内容通知','','',''),(29,0,1,'内容回复通知','微信内容通知','{\"data\":{\"first\":{\"value\":\"{username}\\u56de\\u590d\\u4e86\\u4f60\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{content}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{subject}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u67e5\\u770b\",\"color\":\"#173177\"},\"keyword3\":{\"value\":\"{dateline}\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:5:{s:10:\"{username}\";s:18:\"回复人用户名\";s:9:\"{content}\";s:12:\"回复内容\";s:9:\"{subject}\";s:12:\"原文内容\";s:10:\"{dateline}\";s:12:\"通知时间\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";}',''),(30,0,1,'内容点赞通知','微信内容通知','{\"data\":{\"first\":{\"value\":\"{username}\\u70b9\\u8d5e\\u4e86\\u4f60\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{content}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{dateline}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u67e5\\u770b\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:4:{s:10:\"{username}\";s:18:\"点赞人用户名\";s:9:\"{content}\";s:12:\"点赞内容\";s:10:\"{dateline}\";s:12:\"通知时间\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";}',''),(31,0,1,'内容支付通知','微信内容通知','{\"data\":{\"first\":{\"value\":\"{username}\\u652f\\u4ed8\\u4e86\\u4f60{money}\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{content}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{ordertype}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u67e5\\u770b\",\"color\":\"#173177\"},\"keyword3\":{\"value\":\"{dateline}\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:6:{s:10:\"{username}\";s:15:\"支付用户名\";s:7:\"{money}\";s:6:\"金额\";s:9:\"{content}\";s:6:\"内容\";s:11:\"{ordertype}\";s:12:\"支付类型\";s:10:\"{dateline}\";s:12:\"通知时间\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";}',''),(32,0,1,'内容@通知','微信内容通知','{\"data\":{\"first\":{\"value\":\"{username}@\\u4e86\\u4f60\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{content}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{dateline}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u67e5\\u770b\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:4:{s:10:\"{username}\";s:13:\"@人用户名\";s:9:\"{content}\";s:7:\"@内容\";s:10:\"{dateline}\";s:12:\"通知时间\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";}',''),(33,1,0,'提现通知','财务通知','','',''),(34,1,0,'提现失败通知','财务通知','','',''),(35,0,1,'提现通知','微信财务通知','{\"data\":{\"first\":{\"value\":\"\\u4f60\\u53d1\\u8d77\\u7684\\u63d0\\u73b0\\u8bf7\\u6c42\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{money}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{dateline}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u67e5\\u770b\",\"color\":\"#173177\"},\"keyword3\":{\"value\":\"{withdrawalStatus}\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:4:{s:7:\"{money}\";s:6:\"金额\";s:10:\"{dateline}\";s:12:\"申请时间\";s:18:\"{withdrawalStatus}\";s:12:\"提现状态\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";}',''),(36,0,1,'提现失败通知','微信财务通知','{\"data\":{\"first\":{\"value\":\"\\u4f60\\u53d1\\u8d77\\u7684\\u63d0\\u73b0\\u8bf7\\u6c42\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{money}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{dateline}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u67e5\\u770b\",\"color\":\"#173177\"},\"keyword3\":{\"value\":\"{withdrawalStatus}\",\"color\":\"#173177\"},\"keyword4\":{\"value\":\"{reason}\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:5:{s:7:\"{money}\";s:6:\"金额\";s:10:\"{dateline}\";s:12:\"申请时间\";s:18:\"{withdrawalStatus}\";s:12:\"提现状态\";s:8:\"{reason}\";s:6:\"原因\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";}',''),(37,1,0,'分成收入通知','内容通知','','',''),(38,0,1,'分成收入通知','微信内容通知','{\"data\":{\"first\":{\"value\":\"\\u4f60\\u6536\\u5230\\u4e86{username}\\u7684\\u5206\\u6210{money}\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{content}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{ordertype}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u67e5\\u770b\",\"color\":\"#173177\"},\"keyword3\":{\"value\":\"{dateline}\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:6:{s:10:\"{username}\";s:15:\"支付用户名\";s:7:\"{money}\";s:12:\"分成金额\";s:9:\"{content}\";s:6:\"内容\";s:11:\"{ordertype}\";s:12:\"支付类型\";s:10:\"{dateline}\";s:12:\"通知时间\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";}',''),(39,1,0,'问答提问通知','问答通知','','',''),(40,0,1,'问答提问通知','微信问答通知','{\"data\":{\"first\":{\"value\":\"{username}\\u5411\\u4f60\\u63d0\\u95ee\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{content}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{money}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u67e5\\u770b\",\"color\":\"#173177\"},\"keyword3\":{\"value\":\"{dateline}\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:5:{s:10:\"{username}\";s:9:\"问答人\";s:9:\"{content}\";s:20:\"主题(提问)内容\";s:7:\"{money}\";s:12:\"问答价格\";s:10:\"{dateline}\";s:12:\"通知时间\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";}',''),(41,1,0,'问答回答通知','问答通知','','',''),(42,0,1,'问答回答通知','微信问答通知','{\"data\":{\"first\":{\"value\":\"{username}\\u56de\\u7b54\\u4e86\\u4f60\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{content}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{dateline}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u67e5\\u770b\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:4:{s:10:\"{username}\";s:9:\"问答人\";s:9:\"{content}\";s:12:\"回答内容\";s:10:\"{dateline}\";s:12:\"通知时间\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";}',''),(43,1,0,'过期通知','内容通知','','',''),(44,0,1,'过期通知','微信内容通知','{\"data\":{\"first\":{\"value\":\"{username}\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"{detail}\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"{content}\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u70b9\\u51fb\\u67e5\\u770b\",\"color\":\"#173177\"},\"keyword3\":{\"value\":\"{dateline}\",\"color\":\"#173177\"}},\"redirect_url\":\"{redirecturl}\"}','a:5:{s:10:\"{username}\";s:33:\"您的问题超时未收到回答\";s:8:\"{detail}\";s:14:\"返还金额xx\";s:9:\"{content}\";s:6:\"内容\";s:10:\"{dateline}\";s:12:\"通知时间\";s:13:\"{redirecturl}\";s:12:\"跳转地址\";}','');
/*!40000 ALTER TABLE `ppre_notification_tpls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_notifications`
--

DROP TABLE IF EXISTS `ppre_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_notifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '通知 id',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '通知类型',
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '通知内容',
  `read_at` datetime DEFAULT NULL COMMENT '通知阅读时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `ppre_notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_notifications`
--

LOCK TABLES `ppre_notifications` WRITE;
/*!40000 ALTER TABLE `ppre_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_operation_logs`
--

DROP TABLE IF EXISTS `ppre_operation_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_operation_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志 id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'url路径',
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '请求方式',
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ip 地址',
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'body请求数据',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '日志类型:0后台操作',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_operation_logs`
--

LOCK TABLES `ppre_operation_logs` WRITE;
/*!40000 ALTER TABLE `ppre_operation_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_operation_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_orders`
--

DROP TABLE IF EXISTS `ppre_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单 id',
  `order_sn` char(22) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '订单编号',
  `payment_sn` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '支付编号',
  `amount` decimal(10,2) unsigned NOT NULL COMMENT '订单总金额',
  `master_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '站长分成金额',
  `author_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '作者分成金额',
  `third_party_amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '第三者收益金额',
  `be_scale` double(3,1) NOT NULL DEFAULT '0.0' COMMENT '作者受邀时的分成比例',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '付款人 id',
  `payee_id` bigint(20) unsigned NOT NULL COMMENT '收款人 id',
  `third_party_id` bigint(20) unsigned DEFAULT NULL COMMENT '第三者收益人 id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '交易类型：1注册、2打赏、3付费主题、4付费用户组',
  `group_id` bigint(20) unsigned DEFAULT NULL COMMENT '用户组 id',
  `thread_id` bigint(20) unsigned DEFAULT NULL COMMENT '主题 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '订单状态：0待付款；1已付款；2.取消订单；3支付失败；4订单过期',
  `payment_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '付款方式：微信（10：pc扫码，11：h5支付，12：微信内支付',
  `is_anonymous` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否匿名(0否1是)',
  `expired_at` datetime DEFAULT NULL COMMENT '付费注册过期时长',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `ppre_orders_thread_id_index` (`thread_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_orders`
--

LOCK TABLES `ppre_orders` WRITE;
/*!40000 ALTER TABLE `ppre_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_pay_notify`
--

DROP TABLE IF EXISTS `ppre_pay_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_pay_notify` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '支付通知 id',
  `payment_sn` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '支付编号',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '付款人 id',
  `trade_no` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商户平台交易号',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0未接受到通知，1收到通知',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_pay_notify`
--

LOCK TABLES `ppre_pay_notify` WRITE;
/*!40000 ALTER TABLE `ppre_pay_notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_pay_notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_post_goods`
--

DROP TABLE IF EXISTS `ppre_post_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_post_goods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品 id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '帖子 id',
  `platform_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '平台商品 id',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品标题',
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '价格',
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品封面图',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '商品来源:0淘宝 1天猫 2京东 等',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '商品状态:0正常 1失效/下架',
  `ready_content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '预解析内容',
  `detail_content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '解析详情页地址',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `idx_user` (`user_id`),
  KEY `idx_post` (`post_id`),
  KEY `idx_platform` (`platform_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_post_goods`
--

LOCK TABLES `ppre_post_goods` WRITE;
/*!40000 ALTER TABLE `ppre_post_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_post_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_post_mentions_user`
--

DROP TABLE IF EXISTS `ppre_post_mentions_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_post_mentions_user` (
  `post_id` bigint(20) unsigned NOT NULL,
  `mentions_user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`mentions_user_id`),
  KEY `ppre_post_mentions_user_mentions_user_id_foreign` (`mentions_user_id`),
  CONSTRAINT `ppre_post_mentions_user_mentions_user_id_foreign` FOREIGN KEY (`mentions_user_id`) REFERENCES `ppre_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ppre_post_mentions_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `ppre_posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_post_mentions_user`
--

LOCK TABLES `ppre_post_mentions_user` WRITE;
/*!40000 ALTER TABLE `ppre_post_mentions_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_post_mentions_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_post_mod`
--

DROP TABLE IF EXISTS `ppre_post_mod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_post_mod` (
  `post_id` bigint(20) unsigned NOT NULL COMMENT '帖子 id',
  `stop_word` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发的敏感词，半角逗号隔开',
  PRIMARY KEY (`post_id`),
  CONSTRAINT `ppre_post_mod_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `ppre_posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_post_mod`
--

LOCK TABLES `ppre_post_mod` WRITE;
/*!40000 ALTER TABLE `ppre_post_mod` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_post_mod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_post_user`
--

DROP TABLE IF EXISTS `ppre_post_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_post_user` (
  `post_id` bigint(20) unsigned NOT NULL COMMENT '帖子 id',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`post_id`,`user_id`),
  KEY `ppre_post_user_user_id_foreign` (`user_id`),
  CONSTRAINT `ppre_post_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `ppre_posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ppre_post_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ppre_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_post_user`
--

LOCK TABLES `ppre_post_user` WRITE;
/*!40000 ALTER TABLE `ppre_post_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_post_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_posts`
--

DROP TABLE IF EXISTS `ppre_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '回复 id',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '发表用户 id',
  `thread_id` bigint(20) unsigned DEFAULT NULL COMMENT '关联主题 id',
  `reply_post_id` bigint(20) unsigned DEFAULT NULL COMMENT '回复 id',
  `reply_user_id` bigint(20) unsigned DEFAULT NULL COMMENT '回复用户 id',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ip 地址',
  `port` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '端口',
  `reply_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联回复数',
  `like_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '喜欢数',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  `deleted_user_id` bigint(20) unsigned DEFAULT NULL COMMENT '删除用户 id',
  `is_first` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否首个回复',
  `is_comment` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否是回复回帖的内容',
  `is_approved` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否合法',
  PRIMARY KEY (`id`),
  KEY `ppre_posts_user_id_foreign` (`user_id`),
  KEY `ppre_posts_deleted_user_id_foreign` (`deleted_user_id`),
  KEY `ppre_posts_thread_id_index` (`thread_id`),
  KEY `idx_reply_post_id` (`reply_post_id`),
  CONSTRAINT `ppre_posts_deleted_user_id_foreign` FOREIGN KEY (`deleted_user_id`) REFERENCES `ppre_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ppre_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ppre_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_posts`
--

LOCK TABLES `ppre_posts` WRITE;
/*!40000 ALTER TABLE `ppre_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_questions`
--

DROP TABLE IF EXISTS `ppre_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_questions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `thread_id` bigint(20) unsigned DEFAULT NULL COMMENT '主题 id',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '提问人用户 id',
  `be_user_id` bigint(20) unsigned DEFAULT NULL COMMENT '被提问的用户 id',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '回答内容',
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '回答人 ip 地址',
  `port` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回答人端口',
  `price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '问答价格',
  `onlooker_unit_price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '围观单价',
  `onlooker_price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '当前围观总价格',
  `onlooker_number` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '当前围观总人数',
  `is_onlooker` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否允许围观',
  `is_answer` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否已回答 0未回答 1已回答 2已过期',
  `is_approved` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '回答内容是否合法',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `expired_at` datetime NOT NULL COMMENT '过期时间',
  `answered_at` datetime DEFAULT NULL COMMENT '回答时间',
  PRIMARY KEY (`id`),
  KEY `idx_thread_id` (`thread_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_be_user_id` (`be_user_id`),
  CONSTRAINT `ppre_questions_thread_id_foreign` FOREIGN KEY (`thread_id`) REFERENCES `ppre_threads` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_questions`
--

LOCK TABLES `ppre_questions` WRITE;
/*!40000 ALTER TABLE `ppre_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_reports`
--

DROP TABLE IF EXISTS `ppre_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_reports` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '举报 id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `thread_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主题 id',
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '回复 id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '举报类型:0个人主页 1主题 2评论/回复',
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '举报理由',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '举报状态:0未处理 1已处理',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_reports`
--

LOCK TABLES `ppre_reports` WRITE;
/*!40000 ALTER TABLE `ppre_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_session_tokens`
--

DROP TABLE IF EXISTS `ppre_session_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_session_tokens` (
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'token',
  `scope` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '作用域',
  `payload` text COLLATE utf8mb4_unicode_ci COMMENT '负载',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '用户 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `expired_at` datetime NOT NULL COMMENT '过期时间',
  UNIQUE KEY `ppre_session_tokens_token_unique` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_session_tokens`
--

LOCK TABLES `ppre_session_tokens` WRITE;
/*!40000 ALTER TABLE `ppre_session_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_session_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_settings`
--

DROP TABLE IF EXISTS `ppre_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_settings` (
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '设置项 key',
  `value` text COLLATE utf8mb4_unicode_ci COMMENT '设置项 value',
  `tag` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default' COMMENT '设置项 tag',
  PRIMARY KEY (`key`,`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_settings`
--

LOCK TABLES `ppre_settings` WRITE;
/*!40000 ALTER TABLE `ppre_settings` DISABLE KEYS */;
INSERT INTO `ppre_settings` VALUES ('miniprogram_video','1','wx_miniprogram'),('qcloud_sms','0','qcloud'),('qcloud_vod','0','qcloud'),('register_close','1','default'),('register_validate','0','default'),('site_author','1','default'),('site_author_scale','10','default'),('site_close','0','default'),('site_id','439a729eee2a4eb0aff232663724bc06','default'),('site_install','2020-11-27 11:49:40','default'),('site_manage','[{\"key\":1,\"desc\":\"PC端\",\"value\":true},{\"key\":2,\"desc\":\"H5端\",\"value\":true},{\"key\":3,\"desc\":\"小程序端\",\"value\":true}]','default'),('site_master_scale','0','default'),('site_mode','public','default'),('site_name','dzqtitle','default'),('site_secret','NPk0r8V827w2Sp0IQgKU4CsvJiRd1ZBO','default'),('support_file_ext','doc,docx,pdf,zip','default'),('support_img_ext','png,gif,jpg,jpeg,heic','default'),('support_max_size','5','default'),('user_count','1','default');
/*!40000 ALTER TABLE `ppre_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_stop_words`
--

DROP TABLE IF EXISTS `ppre_stop_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_stop_words` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '敏感词 id',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '创建用户 id',
  `ugc` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户内容处理方式',
  `username` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名处理方式',
  `signature` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户签名处理方式',
  `dialog` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '短消息处理方式',
  `find` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '敏感词或查找方式',
  `replacement` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '替换词或替换规则',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_stop_words`
--

LOCK TABLES `ppre_stop_words` WRITE;
/*!40000 ALTER TABLE `ppre_stop_words` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_stop_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_thread_topic`
--

DROP TABLE IF EXISTS `ppre_thread_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_thread_topic` (
  `thread_id` bigint(20) unsigned NOT NULL COMMENT '主题ID',
  `topic_id` bigint(20) unsigned NOT NULL COMMENT '话题ID',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`thread_id`,`topic_id`),
  KEY `ppre_thread_topic_topic_id_foreign` (`topic_id`),
  CONSTRAINT `ppre_thread_topic_thread_id_foreign` FOREIGN KEY (`thread_id`) REFERENCES `ppre_threads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ppre_thread_topic_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `ppre_topics` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_thread_topic`
--

LOCK TABLES `ppre_thread_topic` WRITE;
/*!40000 ALTER TABLE `ppre_thread_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_thread_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_thread_user`
--

DROP TABLE IF EXISTS `ppre_thread_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_thread_user` (
  `thread_id` bigint(20) unsigned NOT NULL COMMENT '主题 id',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`thread_id`,`user_id`),
  KEY `ppre_thread_user_user_id_foreign` (`user_id`),
  CONSTRAINT `ppre_thread_user_thread_id_foreign` FOREIGN KEY (`thread_id`) REFERENCES `ppre_threads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ppre_thread_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ppre_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_thread_user`
--

LOCK TABLES `ppre_thread_user` WRITE;
/*!40000 ALTER TABLE `ppre_thread_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_thread_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_thread_video`
--

DROP TABLE IF EXISTS `ppre_thread_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_thread_video` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '音视频 id',
  `thread_id` bigint(20) unsigned NOT NULL COMMENT '主题 id',
  `post_id` bigint(20) unsigned NOT NULL COMMENT '帖子 id',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户 id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '类型：0 视频 1 音频',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '音视频状态：0 转码中 1 转码完成 2 转码失败',
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '转码失败原因',
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `file_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '媒体文件唯一标识',
  `height` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '视频高',
  `width` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '视频宽',
  `duration` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '视频时长',
  `media_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '媒体播放地址',
  `cover_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '媒体封面地址',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `ppre_thread_video_thread_id_index` (`thread_id`),
  KEY `ppre_thread_video_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_thread_video`
--

LOCK TABLES `ppre_thread_video` WRITE;
/*!40000 ALTER TABLE `ppre_thread_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_thread_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_threads`
--

DROP TABLE IF EXISTS `ppre_threads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_threads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主题 id',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '创建用户 id',
  `last_posted_user_id` bigint(20) unsigned DEFAULT NULL COMMENT '最后回复用户 id',
  `category_id` int(10) unsigned DEFAULT NULL COMMENT '分类 id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '类型：0普通 1长文 2视频 3图片',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `attachment_price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '附件价格',
  `free_words` double unsigned NOT NULL DEFAULT '0' COMMENT '免费字数百分比',
  `post_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复数',
  `view_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '查看数',
  `rewarded_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '打赏数',
  `paid_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '付费数',
  `longitude` decimal(10,7) NOT NULL DEFAULT '0.0000000' COMMENT '经度',
  `latitude` decimal(10,7) NOT NULL DEFAULT '0.0000000' COMMENT '纬度',
  `address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '地址',
  `location` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '位置',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  `deleted_user_id` bigint(20) unsigned DEFAULT NULL COMMENT '删除用户 id',
  `is_approved` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否合法',
  `is_sticky` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `is_essence` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否加精',
  `is_site` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐到首页（0否 1是）',
  `is_anonymous` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否匿名 0否 1是',
  `is_display` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否显示 0否 1是',
  PRIMARY KEY (`id`),
  KEY `ppre_threads_user_id_foreign` (`user_id`),
  KEY `ppre_threads_last_posted_user_id_foreign` (`last_posted_user_id`),
  KEY `ppre_threads_deleted_user_id_foreign` (`deleted_user_id`),
  KEY `idx_category_id` (`category_id`),
  KEY `idx_is_sticky` (`is_sticky`),
  CONSTRAINT `ppre_threads_deleted_user_id_foreign` FOREIGN KEY (`deleted_user_id`) REFERENCES `ppre_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ppre_threads_last_posted_user_id_foreign` FOREIGN KEY (`last_posted_user_id`) REFERENCES `ppre_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ppre_threads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ppre_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_threads`
--

LOCK TABLES `ppre_threads` WRITE;
/*!40000 ALTER TABLE `ppre_threads` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_threads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_topics`
--

DROP TABLE IF EXISTS `ppre_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_topics` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '话题ID',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT 'user_id',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '话题名称',
  `thread_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题数',
  `view_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '阅读数',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `recommended_at` datetime DEFAULT NULL COMMENT '推荐时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_topics`
--

LOCK TABLES `ppre_topics` WRITE;
/*!40000 ALTER TABLE `ppre_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_user_action_logs`
--

DROP TABLE IF EXISTS `ppre_user_action_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_user_action_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志 id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '操作用户 id',
  `action` char(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作',
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `log_able_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型 id',
  `log_able_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '模型',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_user_action_logs`
--

LOCK TABLES `ppre_user_action_logs` WRITE;
/*!40000 ALTER TABLE `ppre_user_action_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_user_action_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_user_distributions`
--

DROP TABLE IF EXISTS `ppre_user_distributions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_user_distributions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) unsigned DEFAULT NULL COMMENT '父级id',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '用户ID',
  `be_scale` double(3,1) NOT NULL DEFAULT '0.0' COMMENT '受邀时的分成比例',
  `level` tinyint(4) NOT NULL DEFAULT '1' COMMENT '当前用户所处深度',
  `is_subordinate` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否可以 推广下线',
  `is_commission` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否可以 收入提成',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_user` (`user_id`),
  CONSTRAINT `ppre_user_distributions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ppre_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_user_distributions`
--

LOCK TABLES `ppre_user_distributions` WRITE;
/*!40000 ALTER TABLE `ppre_user_distributions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_user_distributions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_user_follow`
--

DROP TABLE IF EXISTS `ppre_user_follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_user_follow` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `from_user_id` bigint(20) unsigned NOT NULL COMMENT '关注人',
  `to_user_id` bigint(20) unsigned NOT NULL COMMENT '被关注人',
  `is_mutual` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否互相关注：0否 1是',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `ppre_user_follow_from_user_id_foreign` FOREIGN KEY (`from_user_id`) REFERENCES `ppre_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ppre_user_follow_to_user_id_foreign` FOREIGN KEY (`to_user_id`) REFERENCES `ppre_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_user_follow`
--

LOCK TABLES `ppre_user_follow` WRITE;
/*!40000 ALTER TABLE `ppre_user_follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_user_follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_user_login_fail_log`
--

DROP TABLE IF EXISTS `ppre_user_login_fail_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_user_login_fail_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志 id',
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ip 地址',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `username` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `count` tinyint(4) NOT NULL DEFAULT '1' COMMENT '错误次数',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `ppre_user_login_fail_log_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_user_login_fail_log`
--

LOCK TABLES `ppre_user_login_fail_log` WRITE;
/*!40000 ALTER TABLE `ppre_user_login_fail_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_user_login_fail_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_user_qq`
--

DROP TABLE IF EXISTS `ppre_user_qq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_user_qq` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `openid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'openid',
  `nickname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'qq昵称',
  `sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '性别',
  `province` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '城市',
  `headimgurl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_user_qq`
--

LOCK TABLES `ppre_user_qq` WRITE;
/*!40000 ALTER TABLE `ppre_user_qq` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_user_qq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_user_qy_wechats`
--

DROP TABLE IF EXISTS `ppre_user_qy_wechats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_user_qy_wechats` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `qy_userid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '企业微信企业用户id, corpid_userid联合全局唯一',
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '企业微信昵称',
  `sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '性别',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '电话',
  `address` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '地址',
  `headimgurl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_user_qy_wechats`
--

LOCK TABLES `ppre_user_qy_wechats` WRITE;
/*!40000 ALTER TABLE `ppre_user_qy_wechats` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_user_qy_wechats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_user_ucenters`
--

DROP TABLE IF EXISTS `ppre_user_ucenters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_user_ucenters` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `ucenter_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'uc用户 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `ppre_user_ucenters_user_id_index` (`user_id`),
  KEY `ppre_user_ucenters_ucenter_id_index` (`ucenter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_user_ucenters`
--

LOCK TABLES `ppre_user_ucenters` WRITE;
/*!40000 ALTER TABLE `ppre_user_ucenters` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_user_ucenters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_user_wallet_cash`
--

DROP TABLE IF EXISTS `ppre_user_wallet_cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_user_wallet_cash` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '提现 id',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '提现用户 id',
  `cash_sn` bigint(20) unsigned NOT NULL COMMENT '提现交易编号',
  `cash_charge` decimal(10,2) unsigned NOT NULL COMMENT '提现手续费',
  `cash_actual_amount` decimal(10,2) unsigned NOT NULL COMMENT '实际提现金额',
  `cash_apply_amount` decimal(10,2) unsigned NOT NULL COMMENT '提现申请金额',
  `cash_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '提现状态：1：待审核，2：审核通过，3：审核不通过，4：待打款， 5，已打款， 6：打款失败',
  `cash_mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '提现到账手机号码',
  `cash_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '提现转账类型：0：人工转账， 1：企业零钱付款',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注或原因',
  `trade_time` datetime DEFAULT NULL COMMENT '交易时间',
  `trade_no` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '交易号',
  `error_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '错误代码',
  `error_message` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '交易失败描叙',
  `refunds_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '返款状态，0未返款，1已返款',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_user_wallet_cash`
--

LOCK TABLES `ppre_user_wallet_cash` WRITE;
/*!40000 ALTER TABLE `ppre_user_wallet_cash` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_user_wallet_cash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_user_wallet_fail_logs`
--

DROP TABLE IF EXISTS `ppre_user_wallet_fail_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_user_wallet_fail_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志 id',
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ip 地址',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `ppre_user_wallet_fail_logs_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_user_wallet_fail_logs`
--

LOCK TABLES `ppre_user_wallet_fail_logs` WRITE;
/*!40000 ALTER TABLE `ppre_user_wallet_fail_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_user_wallet_fail_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_user_wallet_logs`
--

DROP TABLE IF EXISTS `ppre_user_wallet_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_user_wallet_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '钱包明细 id',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '明细所属用户 id',
  `source_user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '金额来源用户',
  `change_available_amount` decimal(10,2) NOT NULL COMMENT '变动可用金额',
  `change_freeze_amount` decimal(10,2) NOT NULL COMMENT '变动冻结金额',
  `change_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '10：提现冻结，11：提现成功，12：撤销提现解冻； 31：打赏收入，32：人工收入； 50：人工支出',
  `change_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '变动描述',
  `order_id` bigint(20) unsigned DEFAULT NULL COMMENT '关联订单记录ID',
  `user_wallet_cash_id` bigint(20) unsigned DEFAULT NULL COMMENT '关联提现记录ID',
  `question_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '关联问答记录 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_user_wallet_logs`
--

LOCK TABLES `ppre_user_wallet_logs` WRITE;
/*!40000 ALTER TABLE `ppre_user_wallet_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_user_wallet_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_user_wallets`
--

DROP TABLE IF EXISTS `ppre_user_wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_user_wallets` (
  `user_id` bigint(20) unsigned NOT NULL COMMENT '钱包所属人 id',
  `available_amount` decimal(10,2) unsigned NOT NULL COMMENT '可用金额',
  `freeze_amount` decimal(10,2) unsigned NOT NULL COMMENT '冻结金额',
  `wallet_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '钱包状态:0正常，1冻结提现',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_user_wallets`
--

LOCK TABLES `ppre_user_wallets` WRITE;
/*!40000 ALTER TABLE `ppre_user_wallets` DISABLE KEYS */;
INSERT INTO `ppre_user_wallets` VALUES (1,0.00,0.00,0,'2020-11-27 11:49:40','2020-11-27 11:49:40');
/*!40000 ALTER TABLE `ppre_user_wallets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_user_wechats`
--

DROP TABLE IF EXISTS `ppre_user_wechats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_user_wechats` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '用户 id',
  `mp_openid` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '公众号openid',
  `dev_openid` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '开放平台openid',
  `min_openid` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '小程序openid',
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '微信昵称',
  `sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '性别',
  `province` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '城市',
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '国家',
  `headimgurl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `privilege` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户特权信息',
  `unionid` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `idx_mp_openid` (`mp_openid`),
  KEY `idx_dev_openid` (`dev_openid`),
  KEY `idx_min_openid` (`min_openid`),
  KEY `idx_unionid` (`unionid`),
  CONSTRAINT `ppre_user_wechats_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ppre_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_user_wechats`
--

LOCK TABLES `ppre_user_wechats` WRITE;
/*!40000 ALTER TABLE `ppre_user_wechats` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_user_wechats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_users`
--

DROP TABLE IF EXISTS `ppre_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户 id',
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `pay_password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '支付密码',
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `signature` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '签名',
  `last_login_ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '最后登录 ip 地址',
  `last_login_port` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录端口',
  `register_ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '注册ip',
  `register_port` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册端口',
  `register_reason` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '注册原因',
  `username_bout` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户名修改次数',
  `thread_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题数',
  `follow_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关注数',
  `fans_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '粉丝数',
  `liked_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `question_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '提问数',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户状态：0正常 1禁用 2审核中 3审核拒绝 4审核忽略',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像地址',
  `identity` char(18) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '身份证号码',
  `realname` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '身份证姓名',
  `avatar_at` datetime DEFAULT NULL COMMENT '头像修改时间',
  `login_at` datetime DEFAULT NULL COMMENT '最后登录时间',
  `joined_at` datetime DEFAULT NULL COMMENT '付费加入时间',
  `expired_at` datetime DEFAULT NULL COMMENT '付费到期时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ppre_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_users`
--

LOCK TABLES `ppre_users` WRITE;
/*!40000 ALTER TABLE `ppre_users` DISABLE KEYS */;
INSERT INTO `ppre_users` VALUES (1,'adminuser','$2y$10$BAM8E7XlQIxuuCIh8zF9m.ipDK6WEmLDvCwlVGc9JMZwl5uja/gnK','','','','192.168.10.1',59346,'192.168.10.1',59346,'',0,0,0,0,0,0,0,'','','',NULL,NULL,NULL,NULL,'2020-11-27 11:49:40','2020-11-27 11:49:40');
/*!40000 ALTER TABLE `ppre_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppre_wechat_offiaccount_replies`
--

DROP TABLE IF EXISTS `ppre_wechat_offiaccount_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppre_wechat_offiaccount_replies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则名',
  `keyword` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '关键词',
  `match_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '匹配类型:0全匹配1半匹配',
  `reply_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '消息回复类型',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '回复文本内容',
  `media_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '素材ID',
  `media_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '素材类型:1图片2视频3语音4图文',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '数据类型:0被关注回复1消息回复2关键词回复',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否开启:0关闭1开启',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `idx_keyword` (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppre_wechat_offiaccount_replies`
--

LOCK TABLES `ppre_wechat_offiaccount_replies` WRITE;
/*!40000 ALTER TABLE `ppre_wechat_offiaccount_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppre_wechat_offiaccount_replies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-27  3:49:40
