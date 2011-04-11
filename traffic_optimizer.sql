-- MySQL dump 10.13  Distrib 5.1.41, for debian-linux-gnu (x86_64)
--
-- Host: 10.0.0.101    Database: traffic_optimizer
-- ------------------------------------------------------
-- Server version	5.0.75-0ubuntu10.3-log

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
-- Not dumping tablespaces as no INFORMATION_SCHEMA.FILES table on this server
--

--
-- Table structure for table `Advertiser`
--

DROP TABLE IF EXISTS `Advertiser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Advertiser` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `advertiser_name` varchar(50) NOT NULL,
  PRIMARY KEY  USING BTREE (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CampaignReportingType`
--

DROP TABLE IF EXISTS `CampaignReportingType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CampaignReportingType` (
  `id` int(11) NOT NULL auto_increment,
  `reporting_type` varchar(15) NOT NULL,
  PRIMARY KEY  USING BTREE (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CampaignType`
--

DROP TABLE IF EXISTS `CampaignType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CampaignType` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `campaign_type` char(3) NOT NULL,
  PRIMARY KEY  USING BTREE (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ConvertedTraffic`
--

DROP TABLE IF EXISTS `ConvertedTraffic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ConvertedTraffic` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `raw_traffic_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `tag` varchar(25) default NULL,
  `request_data_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  USING BTREE (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CountryUrlCampaign`
--

DROP TABLE IF EXISTS `CountryUrlCampaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CountryUrlCampaign` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `advertiser_id` int(10) unsigned NOT NULL,
  `campaign_type_id` tinyint(3) unsigned NOT NULL default '1',
  `reporting_type_id` tinyint(3) unsigned NOT NULL default '1',
  `campaign_value` decimal(10,2) unsigned NOT NULL default '0.00',
  `country_code` char(2) NOT NULL,
  `campaign_url` varchar(255) NOT NULL,
  `campaign_name` varchar(100) NOT NULL,
  PRIMARY KEY  USING BTREE (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ForeignSet`
--

DROP TABLE IF EXISTS `ForeignSet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ForeignSet` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `set_name` varchar(50) NOT NULL,
  `default_country_url_campaign_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  USING BTREE (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ProxyServer`
--

DROP TABLE IF EXISTS `ProxyServer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProxyServer` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `site_owner_id` int(10) unsigned NOT NULL,
  `proxy_server_ip` varchar(16) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `ip` (`proxy_server_ip`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='use for detecting incoming traffic and see if it''s coming fr';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Publisher`
--

DROP TABLE IF EXISTS `Publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Publisher` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `publisher_name` varchar(50) NOT NULL,
  `account_name` varchar(25) NOT NULL,
  `account_password` varchar(25) NOT NULL,
  PRIMARY KEY  USING BTREE (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PublisherSetMap`
--

DROP TABLE IF EXISTS `PublisherSetMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PublisherSetMap` (
  `id` int(11) NOT NULL auto_increment,
  `publisher_id` int(10) unsigned NOT NULL,
  `foreign_set_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  USING BTREE (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RawTraffic`
--

DROP TABLE IF EXISTS `RawTraffic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RawTraffic` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `publisher_id` int(10) unsigned NOT NULL,
  `country_url_campaign_id` int(10) unsigned NOT NULL,
  `country_code` char(2) NOT NULL,
  `created_at` datetime NOT NULL,
  `publisher_uid` varchar(15) NOT NULL,
  `ip` varchar(15) default NULL,
  `request_data_id` int(10) unsigned default NULL,
  PRIMARY KEY  USING BTREE (`id`),
  KEY `request_data_index` (`request_data_id`),
  KEY `Campaign_index` (`country_url_campaign_id`),
  KEY `publisher_index` (`publisher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6120933 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RequestData`
--

DROP TABLE IF EXISTS `RequestData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RequestData` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `created_at` datetime NOT NULL,
  `ip` char(15) NOT NULL,
  `http_referer` varchar(255) NOT NULL,
  `request_uri` varchar(255) NOT NULL,
  `port` smallint(6) unsigned NOT NULL,
  `path_translated` varchar(255) NOT NULL,
  `user_agent` varchar(100) NOT NULL,
  `request_method` varchar(10) NOT NULL,
  `country_code` char(2) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114119776 DEFAULT CHARSET=latin1 COMMENT='general server info about requests';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Rotator`
--

DROP TABLE IF EXISTS `Rotator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rotator` (
  `id` int(11) NOT NULL auto_increment,
  `rotator_name` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `active` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12257 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RotatorConvertedTraffic`
--

DROP TABLE IF EXISTS `RotatorConvertedTraffic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RotatorConvertedTraffic` (
  `id` int(11) NOT NULL auto_increment,
  `created_at` datetime NOT NULL,
  `rotator_raw_traffic_id` int(10) unsigned NOT NULL,
  `tag` varchar(50) default NULL,
  `request_data_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1305 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RotatorDestinationPath`
--

DROP TABLE IF EXISTS `RotatorDestinationPath`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RotatorDestinationPath` (
  `id` int(11) NOT NULL auto_increment,
  `path_name` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `url` varchar(512) NOT NULL,
  `path_percent` decimal(10,2) unsigned NOT NULL default '0.00',
  `rotator_id` int(10) unsigned NOT NULL,
  `active` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `rotator_index` (`rotator_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3828 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RotatorRawTraffic`
--

DROP TABLE IF EXISTS `RotatorRawTraffic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RotatorRawTraffic` (
  `id` int(11) NOT NULL auto_increment,
  `created_at` datetime NOT NULL,
  `rotator_destination_path_id` int(10) unsigned NOT NULL,
  `ip` varchar(15) NOT NULL,
  `url` varchar(255) NOT NULL,
  `path_percent` decimal(10,2) NOT NULL default '0.00',
  `request_data_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`id`),
  KEY `request_data_index` (`request_data_id`),
  KEY `destination_path_index` (`rotator_destination_path_id`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=112851605 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SetCampaignMap`
--

DROP TABLE IF EXISTS `SetCampaignMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SetCampaignMap` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `foreign_set_id` int(10) unsigned NOT NULL,
  `country_url_campaign_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  USING BTREE (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=326 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TrafficOptimizerDefaults`
--

DROP TABLE IF EXISTS `TrafficOptimizerDefaults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TrafficOptimizerDefaults` (
  `id` int(11) NOT NULL auto_increment,
  `rotator_id` int(10) unsigned NOT NULL,
  `publisher_id` int(10) unsigned NOT NULL,
  `foreign_set_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UnmatchedConversion`
--

DROP TABLE IF EXISTS `UnmatchedConversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UnmatchedConversion` (
  `id` bigint(20) NOT NULL auto_increment,
  `advertiser_id` bigint(20) default NULL,
  `country_url_campaign_id` bigint(20) default NULL,
  `raw_traffic_id` bigint(20) default NULL,
  `c_advertiser_id` bigint(20) default NULL,
  `c_country_url_campaign_id` bigint(20) default NULL,
  `c_raw_traffic_id` bigint(20) default NULL,
  `c_hash` varchar(255) default NULL,
  `http_referer` text,
  `ip` varchar(15) default NULL,
  `uri` varchar(255) default NULL,
  `created_at` datetime NOT NULL,
  `message` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2129 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-01-23  0:45:39
