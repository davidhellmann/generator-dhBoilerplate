# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.6.34)
# Datenbank: db58503077_cbmodules
# Erstellt am: 2017-04-16 23:00:03 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Export von Tabelle craft_assetfiles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assetfiles`;

CREATE TABLE `craft_assetfiles` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetfiles_filename_folderId_unq_idx` (`filename`,`folderId`),
  KEY `craft_assetfiles_sourceId_fk` (`sourceId`),
  KEY `craft_assetfiles_folderId_fk` (`folderId`),
  CONSTRAINT `craft_assetfiles_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `craft_assetfolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assetfiles_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assetfiles_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_assetfolders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assetfolders`;

CREATE TABLE `craft_assetfolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetfolders_name_parentId_sourceId_unq_idx` (`name`,`parentId`,`sourceId`),
  KEY `craft_assetfolders_parentId_fk` (`parentId`),
  KEY `craft_assetfolders_sourceId_fk` (`sourceId`),
  CONSTRAINT `craft_assetfolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `craft_assetfolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assetfolders_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_assetfolders` WRITE;
/*!40000 ALTER TABLE `craft_assetfolders` DISABLE KEYS */;

INSERT INTO `craft_assetfolders` (`id`, `parentId`, `sourceId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,1,'Site Images','','2017-04-16 22:48:52','2017-04-16 22:48:52','e0255984-fbff-4747-b52c-a1b52c263e0d'),
	(2,NULL,2,'Site Downloads','','2017-04-16 22:48:52','2017-04-16 22:48:52','9925a79c-a703-4e9b-864a-984de140b806'),
	(3,NULL,3,'Site Graphics','','2017-04-16 22:48:52','2017-04-16 22:48:52','2fd35fd8-f0d6-4d9d-8c20-b277fb4daf88'),
	(4,NULL,4,'Site Users','','2017-04-16 22:48:52','2017-04-16 22:48:52','e9f8b2ad-b6b5-41b6-a42f-83489e5eeead');

/*!40000 ALTER TABLE `craft_assetfolders` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_assetindexdata
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assetindexdata`;

CREATE TABLE `craft_assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sourceId` int(10) NOT NULL,
  `offset` int(10) NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recordId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetindexdata_sessionId_sourceId_offset_unq_idx` (`sessionId`,`sourceId`,`offset`),
  KEY `craft_assetindexdata_sourceId_fk` (`sourceId`),
  CONSTRAINT `craft_assetindexdata_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_assetsources
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assetsources`;

CREATE TABLE `craft_assetsources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetsources_name_unq_idx` (`name`),
  UNIQUE KEY `craft_assetsources_handle_unq_idx` (`handle`),
  KEY `craft_assetsources_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_assetsources_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_assetsources` WRITE;
/*!40000 ALTER TABLE `craft_assetsources` DISABLE KEYS */;

INSERT INTO `craft_assetsources` (`id`, `name`, `handle`, `type`, `settings`, `sortOrder`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Site Images','siteImages','Local','{\"path\":\"{uploadPath}\\/images\\/\",\"publicURLs\":1,\"url\":\"{uploadUrl}\\/images\\/\"}',1,50,'2017-04-16 22:48:52','2017-04-16 22:49:03','ff0b5648-f1d6-418e-ba27-5075ee7ed5ca'),
	(2,'Site Downloads','siteDownloads','Local','{\"path\":\"{uploadPath}\\/downloads\\/\",\"publicURLs\":1,\"url\":\"{uploadUrl}\\/downloads\\/\"}',2,51,'2017-04-16 22:48:52','2017-04-16 22:49:03','8f7efc74-2340-4272-aeda-5ed035ef86ed'),
	(3,'Site Graphics','siteGraphics','Local','{\"path\":\"{uploadPath}\\/graphics\\/\",\"publicURLs\":1,\"url\":\"{uploadUrl}\\/graphics\\/\"}',3,52,'2017-04-16 22:48:52','2017-04-16 22:49:03','e8bc61b2-50c2-490c-9613-acb241ba431f'),
	(4,'Site Users','siteUsers','Local','{\"path\":\"{uploadPath}\\/users\\/\",\"publicURLs\":1,\"url\":\"{uploadUrl}\\/users\\/\"}',4,53,'2017-04-16 22:48:52','2017-04-16 22:49:03','c2ff7f4c-55dc-4a42-93d4-59505cda75f0');

/*!40000 ALTER TABLE `craft_assetsources` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_assettransformindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assettransformindex`;

CREATE TABLE `craft_assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT NULL,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_assettransformindex_sourceId_fileId_location_idx` (`sourceId`,`fileId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_assettransforms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assettransforms`;

CREATE TABLE `craft_assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `height` int(10) DEFAULT NULL,
  `width` int(10) DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(10) DEFAULT NULL,
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assettransforms_name_unq_idx` (`name`),
  UNIQUE KEY `craft_assettransforms_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_categories`;

CREATE TABLE `craft_categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_categories_groupId_fk` (`groupId`),
  CONSTRAINT `craft_categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_categories_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_categorygroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_categorygroups`;

CREATE TABLE `craft_categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_categorygroups_name_unq_idx` (`name`),
  UNIQUE KEY `craft_categorygroups_handle_unq_idx` (`handle`),
  KEY `craft_categorygroups_structureId_fk` (`structureId`),
  KEY `craft_categorygroups_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_categorygroups` WRITE;
/*!40000 ALTER TABLE `craft_categorygroups` DISABLE KEYS */;

INSERT INTO `craft_categorygroups` (`id`, `structureId`, `fieldLayoutId`, `name`, `handle`, `hasUrls`, `template`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,58,'Default','default',1,'','2017-04-16 22:50:30','2017-04-16 22:50:30','188f3c4d-2d6c-46be-9c65-903ac3db6c76');

/*!40000 ALTER TABLE `craft_categorygroups` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_categorygroups_i18n
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_categorygroups_i18n`;

CREATE TABLE `craft_categorygroups_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `urlFormat` text COLLATE utf8_unicode_ci,
  `nestedUrlFormat` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_categorygroups_i18n_groupId_locale_unq_idx` (`groupId`,`locale`),
  KEY `craft_categorygroups_i18n_locale_fk` (`locale`),
  CONSTRAINT `craft_categorygroups_i18n_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_categorygroups_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_categorygroups_i18n` WRITE;
/*!40000 ALTER TABLE `craft_categorygroups_i18n` DISABLE KEYS */;

INSERT INTO `craft_categorygroups_i18n` (`id`, `groupId`, `locale`, `urlFormat`, `nestedUrlFormat`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'de','default/{slug}','{parent.uri}/{slug}','2017-04-16 22:50:30','2017-04-16 22:50:30','099a53d9-25b6-48e6-8d42-cc29c06ffa2a');

/*!40000 ALTER TABLE `craft_categorygroups_i18n` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_content`;

CREATE TABLE `craft_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_pluginSeomatic` text COLLATE utf8_unicode_ci,
  `field_settingsFocalPoint` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_singleAnchor` text COLLATE utf8_unicode_ci,
  `field_singleButton` text COLLATE utf8_unicode_ci,
  `field_singleCode` text COLLATE utf8_unicode_ci,
  `field_singleDefinitionList` text COLLATE utf8_unicode_ci,
  `field_singleEmbedCode` text COLLATE utf8_unicode_ci,
  `field_singleHeadline` text COLLATE utf8_unicode_ci,
  `field_singleLabel` text COLLATE utf8_unicode_ci,
  `field_singleQuote` text COLLATE utf8_unicode_ci,
  `field_singleRichText` text COLLATE utf8_unicode_ci,
  `field_singleSource` text COLLATE utf8_unicode_ci,
  `field_singleSourceUrl` text COLLATE utf8_unicode_ci,
  `field_singleSubline` text COLLATE utf8_unicode_ci,
  `field_singleText` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_content_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_content_title_idx` (`title`),
  KEY `craft_content_locale_fk` (`locale`),
  CONSTRAINT `craft_content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_content_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_content` WRITE;
/*!40000 ALTER TABLE `craft_content` DISABLE KEYS */;

INSERT INTO `craft_content` (`id`, `elementId`, `locale`, `title`, `field_pluginSeomatic`, `field_settingsFocalPoint`, `field_singleAnchor`, `field_singleButton`, `field_singleCode`, `field_singleDefinitionList`, `field_singleEmbedCode`, `field_singleHeadline`, `field_singleLabel`, `field_singleQuote`, `field_singleRichText`, `field_singleSource`, `field_singleSourceUrl`, `field_singleSubline`, `field_singleText`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-16 21:53:42','2017-04-16 21:53:42','d0823a0f-a07f-4750-aae2-c64b5131b2c5'),
	(4,4,'de','Homepage',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-16 22:48:52','2017-04-16 22:48:52','33215c87-bbc0-45fa-8e1c-adb0601eaa92'),
	(5,5,'de','Modules',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-16 22:48:52','2017-04-16 22:48:52','1b8d64a7-32b4-4dd0-9b86-eee90214b9af'),
	(6,6,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-16 22:49:03','2017-04-16 22:49:03','59c70a0e-77ae-46fb-8f2a-00ff9bf4dd8f');

/*!40000 ALTER TABLE `craft_content` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_deprecationerrors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_deprecationerrors`;

CREATE TABLE `craft_deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) unsigned NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `templateLine` smallint(6) unsigned DEFAULT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `traces` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_elementindexsettings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_elementindexsettings`;

CREATE TABLE `craft_elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_elementindexsettings_type_unq_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_elements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_elements`;

CREATE TABLE `craft_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `archived` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_elements_type_idx` (`type`),
  KEY `craft_elements_enabled_idx` (`enabled`),
  KEY `craft_elements_archived_dateCreated_idx` (`archived`,`dateCreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_elements` WRITE;
/*!40000 ALTER TABLE `craft_elements` DISABLE KEYS */;

INSERT INTO `craft_elements` (`id`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'User',1,0,'2017-04-16 21:53:42','2017-04-16 21:53:42','b9c2bd4b-c068-45fc-9760-bc6107691d2b'),
	(4,'Entry',1,0,'2017-04-16 22:48:52','2017-04-16 22:48:52','a216f836-8252-4f04-aaad-40b19b0fd94a'),
	(5,'Entry',1,0,'2017-04-16 22:48:52','2017-04-16 22:48:52','1528fa5d-880c-4c02-990a-f8c773f5eb9e'),
	(6,'GlobalSet',1,0,'2017-04-16 22:49:03','2017-04-16 22:49:03','05e2ebe3-b333-4020-8e73-24d7e5c9c0de');

/*!40000 ALTER TABLE `craft_elements` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_elements_i18n
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_elements_i18n`;

CREATE TABLE `craft_elements_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_elements_i18n_elementId_locale_unq_idx` (`elementId`,`locale`),
  UNIQUE KEY `craft_elements_i18n_uri_locale_unq_idx` (`uri`,`locale`),
  KEY `craft_elements_i18n_slug_locale_idx` (`slug`,`locale`),
  KEY `craft_elements_i18n_enabled_idx` (`enabled`),
  KEY `craft_elements_i18n_locale_fk` (`locale`),
  CONSTRAINT `craft_elements_i18n_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_elements_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_elements_i18n` WRITE;
/*!40000 ALTER TABLE `craft_elements_i18n` DISABLE KEYS */;

INSERT INTO `craft_elements_i18n` (`id`, `elementId`, `locale`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'de','',NULL,1,'2017-04-16 21:53:42','2017-04-16 21:53:42','f62f4336-026f-47a1-ad80-3c23aa756d4f'),
	(4,4,'de','homepage','__home__',1,'2017-04-16 22:48:52','2017-04-16 22:48:52','73ad8ab1-228c-4fb3-b707-3cb697ae55d3'),
	(5,5,'de','modules','modules',1,'2017-04-16 22:48:52','2017-04-16 22:48:52','4c07ed46-b518-48cf-90cb-44c91579600c'),
	(6,6,'de','',NULL,1,'2017-04-16 22:49:03','2017-04-16 22:49:03','fd02fd31-754a-410a-8ff2-4b579d1cd428');

/*!40000 ALTER TABLE `craft_elements_i18n` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_emailmessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_emailmessages`;

CREATE TABLE `craft_emailmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` char(150) COLLATE utf8_unicode_ci NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_emailmessages_key_locale_unq_idx` (`key`,`locale`),
  KEY `craft_emailmessages_locale_fk` (`locale`),
  CONSTRAINT `craft_emailmessages_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_entries`;

CREATE TABLE `craft_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entries_sectionId_idx` (`sectionId`),
  KEY `craft_entries_typeId_idx` (`typeId`),
  KEY `craft_entries_postDate_idx` (`postDate`),
  KEY `craft_entries_expiryDate_idx` (`expiryDate`),
  KEY `craft_entries_authorId_fk` (`authorId`),
  CONSTRAINT `craft_entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_entries` WRITE;
/*!40000 ALTER TABLE `craft_entries` DISABLE KEYS */;

INSERT INTO `craft_entries` (`id`, `sectionId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(4,3,NULL,NULL,'2017-04-16 22:48:52',NULL,'2017-04-16 22:48:52','2017-04-16 22:48:52','77150553-bb5a-4f6d-9185-2f663ef161f1'),
	(5,4,NULL,NULL,'2017-04-16 22:48:52',NULL,'2017-04-16 22:48:52','2017-04-16 22:48:52','34d64afe-d272-4d07-b2d5-3fbb69a34f30');

/*!40000 ALTER TABLE `craft_entries` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_entrydrafts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_entrydrafts`;

CREATE TABLE `craft_entrydrafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` tinytext COLLATE utf8_unicode_ci,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entrydrafts_entryId_locale_idx` (`entryId`,`locale`),
  KEY `craft_entrydrafts_sectionId_fk` (`sectionId`),
  KEY `craft_entrydrafts_creatorId_fk` (`creatorId`),
  KEY `craft_entrydrafts_locale_fk` (`locale`),
  CONSTRAINT `craft_entrydrafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entrydrafts_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entrydrafts_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_entrydrafts_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_entrytypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_entrytypes`;

CREATE TABLE `craft_entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Title',
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_entrytypes_name_sectionId_unq_idx` (`name`,`sectionId`),
  UNIQUE KEY `craft_entrytypes_handle_sectionId_unq_idx` (`handle`,`sectionId`),
  KEY `craft_entrytypes_sectionId_fk` (`sectionId`),
  KEY `craft_entrytypes_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_entrytypes` WRITE;
/*!40000 ALTER TABLE `craft_entrytypes` DISABLE KEYS */;

INSERT INTO `craft_entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleLabel`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(3,3,59,'Homepage','homepage',1,'Title',NULL,1,'2017-04-16 22:48:52','2017-04-16 22:50:54','5523e1a6-09ec-41da-8346-f234fc79a17a'),
	(4,4,60,'Modules','modules',1,'',NULL,1,'2017-04-16 22:48:52','2017-04-16 22:50:54','e4f17c23-e055-4d0e-b4b4-5d10bd234de1'),
	(5,5,61,'News','news',1,'Title',NULL,1,'2017-04-16 22:48:52','2017-04-16 22:50:54','a7735d3a-d13b-4fc1-8f2e-24edba816813'),
	(6,6,62,'Pages','pages',1,'Title',NULL,1,'2017-04-16 22:56:24','2017-04-16 22:56:24','9d1a8865-03bb-4839-aa69-17e31ede8053');

/*!40000 ALTER TABLE `craft_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_entryversions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_entryversions`;

CREATE TABLE `craft_entryversions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `num` smallint(6) unsigned NOT NULL,
  `notes` tinytext COLLATE utf8_unicode_ci,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entryversions_entryId_locale_idx` (`entryId`,`locale`),
  KEY `craft_entryversions_sectionId_fk` (`sectionId`),
  KEY `craft_entryversions_creatorId_fk` (`creatorId`),
  KEY `craft_entryversions_locale_fk` (`locale`),
  CONSTRAINT `craft_entryversions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_entryversions_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entryversions_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_entryversions_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_fieldgroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fieldgroups`;

CREATE TABLE `craft_fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fieldgroups_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_fieldgroups` WRITE;
/*!40000 ALTER TABLE `craft_fieldgroups` DISABLE KEYS */;

INSERT INTO `craft_fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(2,'Categories','2017-04-16 22:48:51','2017-04-16 22:48:51','9994af79-f80c-4ee6-ab9a-5bb8af9119f9'),
	(3,'Content Builder','2017-04-16 22:48:51','2017-04-16 22:48:51','9a10d5bc-f6cf-493f-94be-837733e97e5f'),
	(4,'Globals','2017-04-16 22:48:51','2017-04-16 22:48:51','83629bee-7cec-41c3-a3a9-4bfd86cbc4c7'),
	(5,'Grouped','2017-04-16 22:48:51','2017-04-16 22:48:51','1dde50f0-136a-46aa-b91e-309832204f97'),
	(6,'Plugins','2017-04-16 22:48:51','2017-04-16 22:48:51','26e4cfd0-f271-47b0-848f-5c3d9b15aa3c'),
	(7,'Settings','2017-04-16 22:48:52','2017-04-16 22:48:52','d57d0bfc-cfa0-46ab-8f76-9b7e592f8db4'),
	(8,'Singles','2017-04-16 22:48:52','2017-04-16 22:48:52','b3b74b0a-8327-470a-b835-e2e815eedc2d');

/*!40000 ALTER TABLE `craft_fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_fieldlayoutfields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fieldlayoutfields`;

CREATE TABLE `craft_fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  KEY `craft_fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  KEY `craft_fieldlayoutfields_tabId_fk` (`tabId`),
  KEY `craft_fieldlayoutfields_fieldId_fk` (`fieldId`),
  CONSTRAINT `craft_fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `craft_fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayoutfields` DISABLE KEYS */;

INSERT INTO `craft_fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(4,13,3,5,0,1,'2017-04-16 22:48:52','2017-04-16 22:48:52','a5a60fb6-6867-4ffc-97c5-b05de5376f25'),
	(5,13,3,6,0,2,'2017-04-16 22:48:52','2017-04-16 22:48:52','301ab85a-6f6a-4ee4-a986-ae4ea1100566'),
	(6,13,3,7,0,3,'2017-04-16 22:48:52','2017-04-16 22:48:52','be5300a4-4e44-4550-a245-a764e1d90acc'),
	(7,13,3,8,0,4,'2017-04-16 22:48:52','2017-04-16 22:48:52','586ac8f9-1203-4dad-bce2-f3db7d958e5c'),
	(8,13,3,9,0,5,'2017-04-16 22:48:52','2017-04-16 22:48:52','f1eaba51-ce33-4e56-867d-9b15654a3bab'),
	(9,13,3,10,0,6,'2017-04-16 22:48:52','2017-04-16 22:48:52','2ba6f639-8aaf-47aa-b2bc-0baf6ffe69c1'),
	(10,13,3,11,0,7,'2017-04-16 22:48:52','2017-04-16 22:48:52','30c7f104-656e-429b-b640-dcb7ab67e976'),
	(11,14,4,13,0,1,'2017-04-16 22:48:53','2017-04-16 22:48:53','92692c5e-41c9-4773-805f-468d1050e3bc'),
	(12,14,4,14,0,2,'2017-04-16 22:48:53','2017-04-16 22:48:53','f4ffbd2d-699c-4576-b074-8d2c5a27b42c'),
	(13,14,4,15,0,3,'2017-04-16 22:48:53','2017-04-16 22:48:53','c9cab88d-b8e2-4496-a541-ab7b03337726'),
	(14,14,4,16,0,4,'2017-04-16 22:48:53','2017-04-16 22:48:53','0b8e7d47-ce85-408e-bad8-7a6f2020f1ce'),
	(15,14,4,17,0,5,'2017-04-16 22:48:53','2017-04-16 22:48:53','fa0e5359-0432-487f-bb74-2f00118fc65b'),
	(16,14,4,18,0,6,'2017-04-16 22:48:53','2017-04-16 22:48:53','438f3ac5-02c4-4fd5-b10f-c5f3304043c2'),
	(17,14,4,19,0,7,'2017-04-16 22:48:53','2017-04-16 22:48:53','f4eb8563-8d76-44ce-9af3-d5e7b5959428'),
	(18,14,4,20,0,8,'2017-04-16 22:48:53','2017-04-16 22:48:53','0fad40f3-7871-4692-98be-6eebde08d144'),
	(19,14,4,21,0,9,'2017-04-16 22:48:53','2017-04-16 22:48:53','dc337c9c-041d-47a6-b971-40c4fa845d60'),
	(20,14,4,22,0,10,'2017-04-16 22:48:53','2017-04-16 22:48:53','7ce0e0d9-4019-4cd6-921b-8f2f0e28bed0'),
	(21,14,4,23,0,11,'2017-04-16 22:48:53','2017-04-16 22:48:53','40e9479d-b057-4f2f-aeb2-af791e3221c6'),
	(22,14,4,24,0,12,'2017-04-16 22:48:53','2017-04-16 22:48:53','53e15e6e-0545-4aeb-b7a9-eff76a92d43e'),
	(23,14,4,25,0,13,'2017-04-16 22:48:53','2017-04-16 22:48:53','873107af-818f-4d18-b77d-594ca5d3d006'),
	(24,15,5,27,0,1,'2017-04-16 22:48:54','2017-04-16 22:48:54','3e4e0544-374f-4356-a314-f7dd3d81a166'),
	(25,15,5,28,0,2,'2017-04-16 22:48:54','2017-04-16 22:48:54','28a51620-9a0d-4d9a-827e-1f10ac365ae6'),
	(26,15,5,29,0,3,'2017-04-16 22:48:54','2017-04-16 22:48:54','19684494-7425-4bc6-aa45-f6152ffa3c7b'),
	(27,15,5,30,0,4,'2017-04-16 22:48:54','2017-04-16 22:48:54','2a584ce2-8e27-4f31-94ba-99d237bb95a5'),
	(28,16,6,33,0,1,'2017-04-16 22:48:55','2017-04-16 22:48:55','7d87fda0-0b7a-48c7-9ecb-d7b89fc8a7c1'),
	(29,16,6,34,0,2,'2017-04-16 22:48:55','2017-04-16 22:48:55','8195ab71-15a8-4c5d-8443-5bddc0407699'),
	(30,16,6,35,0,3,'2017-04-16 22:48:55','2017-04-16 22:48:55','95972cbd-0732-4d00-80dc-6043ce10f1e0'),
	(31,16,6,36,0,4,'2017-04-16 22:48:55','2017-04-16 22:48:55','12473daf-0fb9-4703-9e8b-3c04d6469dd0'),
	(32,17,7,38,0,1,'2017-04-16 22:48:55','2017-04-16 22:48:55','be0caa24-1430-4843-b675-62a440cadf48'),
	(33,17,7,39,0,2,'2017-04-16 22:48:55','2017-04-16 22:48:55','937cecd3-ab07-40ed-b7a9-308e3e859ff7'),
	(34,18,8,41,0,1,'2017-04-16 22:48:55','2017-04-16 22:48:55','aea2236a-f06d-4970-b6f0-6b7d6e8483d3'),
	(35,18,8,42,0,2,'2017-04-16 22:48:55','2017-04-16 22:48:55','d1c7b371-426e-45e9-88aa-7beddf42cf5c'),
	(36,19,9,44,0,1,'2017-04-16 22:48:56','2017-04-16 22:48:56','554813c8-efe6-47ed-84b7-d72a7502d218'),
	(37,19,9,45,0,2,'2017-04-16 22:48:56','2017-04-16 22:48:56','591470b4-b24a-48f1-9052-bc4e84227c47'),
	(38,19,9,46,0,3,'2017-04-16 22:48:56','2017-04-16 22:48:56','295ed385-50dd-4794-bd57-4308c5b0e0a1'),
	(39,20,10,49,0,1,'2017-04-16 22:48:57','2017-04-16 22:48:57','4c126cc2-e837-42a1-9c01-947d03473c06'),
	(40,20,10,50,0,2,'2017-04-16 22:48:57','2017-04-16 22:48:57','a9221e54-a2be-4171-b3f8-86ae8b1aed25'),
	(41,20,10,51,0,3,'2017-04-16 22:48:57','2017-04-16 22:48:57','709f5582-4c99-4e41-b6ca-64dc3c0274f2'),
	(42,21,11,53,0,1,'2017-04-16 22:48:57','2017-04-16 22:48:57','256d1a0d-a135-4903-a02c-a826fe2684df'),
	(43,21,11,54,0,2,'2017-04-16 22:48:57','2017-04-16 22:48:57','648136f5-79e4-4240-8e92-7eaa3585e070'),
	(44,21,11,55,0,3,'2017-04-16 22:48:57','2017-04-16 22:48:57','86e1b47d-a9a9-4364-99ea-8c25c3087ec5'),
	(45,22,12,57,0,1,'2017-04-16 22:48:58','2017-04-16 22:48:58','5e4c6629-b5b7-4125-ab53-9b83f0469a50'),
	(46,22,12,58,0,2,'2017-04-16 22:48:58','2017-04-16 22:48:58','6bf3db0b-7458-4e16-98a9-81083da0268a'),
	(47,22,12,59,0,3,'2017-04-16 22:48:58','2017-04-16 22:48:58','fd9d8c85-cb8e-4982-9cb2-1d5d278ba6fc'),
	(48,23,13,61,0,1,'2017-04-16 22:48:58','2017-04-16 22:48:58','cdd509fc-7b3f-4ddc-8d70-0ad8c6a40a62'),
	(49,23,13,62,0,2,'2017-04-16 22:48:58','2017-04-16 22:48:58','45fff081-ee04-495c-b620-5999371777db'),
	(50,23,13,63,0,3,'2017-04-16 22:48:58','2017-04-16 22:48:58','c62d64e7-e2eb-4b51-8484-2313b8eec6f8'),
	(51,24,14,65,0,1,'2017-04-16 22:48:59','2017-04-16 22:48:59','4fe9cb84-a66d-4258-a334-ef2dc7e05282'),
	(52,24,14,66,0,2,'2017-04-16 22:48:59','2017-04-16 22:48:59','7d5d4848-8399-48c5-beb1-b119d052434c'),
	(53,24,14,67,0,3,'2017-04-16 22:48:59','2017-04-16 22:48:59','a866470e-83a2-47cb-bf1a-f40dd0e5d4d0'),
	(54,24,14,68,0,4,'2017-04-16 22:48:59','2017-04-16 22:48:59','769da901-6a97-4bba-a7e4-4e33995a3bb1'),
	(55,25,15,70,0,1,'2017-04-16 22:48:59','2017-04-16 22:48:59','702b2880-133e-4a6b-ba42-97baf0b8ea6d'),
	(56,25,15,71,0,2,'2017-04-16 22:48:59','2017-04-16 22:48:59','3904b78a-c549-4446-82cc-5bc6c3d56488'),
	(57,25,15,72,0,3,'2017-04-16 22:48:59','2017-04-16 22:48:59','fed3ebc1-c8a8-452a-8b1c-071b8b8a8e20'),
	(58,26,16,74,0,1,'2017-04-16 22:49:00','2017-04-16 22:49:00','fe90c6c9-8de9-4b72-91b3-d45ddde28588'),
	(59,26,16,75,0,2,'2017-04-16 22:49:00','2017-04-16 22:49:00','d5c0e410-2fda-4b50-b2d1-f2bdd2441c63'),
	(60,26,16,76,0,3,'2017-04-16 22:49:00','2017-04-16 22:49:00','a038edab-9806-4d68-b03f-34fc47fc5c61'),
	(61,27,17,78,0,1,'2017-04-16 22:49:00','2017-04-16 22:49:00','8127723b-c491-422a-b6c8-5c9bc16b3cc5'),
	(62,27,17,79,0,2,'2017-04-16 22:49:00','2017-04-16 22:49:00','610bd33a-5b10-4430-9329-43c17d02bdf3'),
	(63,27,17,80,0,3,'2017-04-16 22:49:00','2017-04-16 22:49:00','c6d14104-918e-4a32-85bd-0a5d1d7b0940'),
	(64,28,18,82,0,1,'2017-04-16 22:49:01','2017-04-16 22:49:01','f201f300-8d3c-4d6b-94a2-4765c81a82b9'),
	(65,29,19,86,0,1,'2017-04-16 22:49:01','2017-04-16 22:49:01','42e4156a-870f-4856-97ae-19e8dc94b919'),
	(66,30,20,90,0,1,'2017-04-16 22:49:03','2017-04-16 22:49:03','9d89d273-e25b-426d-b255-9dc2e9347e37'),
	(67,30,20,98,0,2,'2017-04-16 22:49:03','2017-04-16 22:49:03','1cadca74-7412-4fc5-a247-ec0257a5b3b4'),
	(68,30,21,83,0,1,'2017-04-16 22:49:03','2017-04-16 22:49:03','e8a583ff-4820-4703-b763-54ad522d7f7c'),
	(69,30,21,73,0,2,'2017-04-16 22:49:03','2017-04-16 22:49:03','ad654de8-a596-42aa-8915-fff6850ce73f'),
	(70,32,23,93,0,1,'2017-04-16 22:49:03','2017-04-16 22:49:03','91f8f8f3-3493-49b5-92c3-829d08bfea7a'),
	(71,33,25,81,0,1,'2017-04-16 22:49:03','2017-04-16 22:49:03','88a74c0f-175f-482f-97f4-5b77c3ed6897'),
	(72,35,26,90,0,1,'2017-04-16 22:49:03','2017-04-16 22:49:03','f645b793-cebb-46cf-9293-bd96dd59ba54'),
	(73,35,27,48,0,1,'2017-04-16 22:49:03','2017-04-16 22:49:03','21b05484-99e5-4f6c-849f-14bb7b6224ee'),
	(74,36,28,95,0,1,'2017-04-16 22:49:03','2017-04-16 22:49:03','40596a24-781f-4405-9d28-f2022868a3fb'),
	(75,37,29,95,0,1,'2017-04-16 22:49:03','2017-04-16 22:49:03','0326c1e7-7a50-490b-b6ed-da458bee7489'),
	(76,39,30,94,0,1,'2017-04-16 22:49:03','2017-04-16 22:49:03','d8ccbed2-1c86-4d6d-816b-683ecd582f3a'),
	(77,39,30,96,0,2,'2017-04-16 22:49:03','2017-04-16 22:49:03','93c91c79-e25b-4687-be6a-6a179a48ae63'),
	(78,39,30,97,0,3,'2017-04-16 22:49:03','2017-04-16 22:49:03','5adefcd5-8ba1-444e-9c65-3521a2d1da12'),
	(79,40,31,91,0,1,'2017-04-16 22:49:03','2017-04-16 22:49:03','1016d093-b095-4a81-a11a-c832580708f1'),
	(80,40,31,99,0,2,'2017-04-16 22:49:03','2017-04-16 22:49:03','c942298c-ab29-4795-b154-860d747fbfd5'),
	(81,40,32,52,0,1,'2017-04-16 22:49:03','2017-04-16 22:49:03','93ac8ad3-336c-4911-a838-f786a5a5f15d'),
	(82,41,33,92,0,1,'2017-04-16 22:49:03','2017-04-16 22:49:03','78d40f82-4533-4c9b-a9a6-163be0e0b758'),
	(83,41,34,56,0,1,'2017-04-16 22:49:03','2017-04-16 22:49:03','013e81fd-b047-46cb-a302-5f91559d2693'),
	(84,42,35,92,0,1,'2017-04-16 22:49:03','2017-04-16 22:49:03','a0595d8e-9bd6-4601-8ad6-bcd2b4d64cd1'),
	(85,42,36,60,0,1,'2017-04-16 22:49:03','2017-04-16 22:49:03','535880da-a58a-4c60-a033-5284130b11b2'),
	(86,43,37,91,0,1,'2017-04-16 22:49:03','2017-04-16 22:49:03','67374883-0f52-4148-93df-0e5123b61ebf'),
	(87,43,38,64,0,1,'2017-04-16 22:49:03','2017-04-16 22:49:03','4c806902-579f-4b3a-bfd8-668cb56a1e31'),
	(88,44,39,92,0,1,'2017-04-16 22:49:03','2017-04-16 22:49:03','ef4bb7b5-a7cf-4036-abcb-cbda5af32236'),
	(89,44,40,69,0,1,'2017-04-16 22:49:03','2017-04-16 22:49:03','b7dad340-5b41-43fb-87cd-da849a98454e'),
	(90,45,41,84,0,1,'2017-04-16 22:49:03','2017-04-16 22:49:03','1a39a304-95e5-4e13-8c8c-874e82a05432'),
	(91,45,42,32,0,1,'2017-04-16 22:49:03','2017-04-16 22:49:03','6a2d16ff-7965-4640-aa31-2b0030274b98'),
	(92,46,43,85,0,1,'2017-04-16 22:49:03','2017-04-16 22:49:03','3c6255b7-ada9-4c69-b6ef-2667dead893b'),
	(93,46,44,37,0,1,'2017-04-16 22:49:03','2017-04-16 22:49:03','1a4f573b-aa86-421e-8102-5c9b0ba778b0'),
	(94,47,45,88,0,1,'2017-04-16 22:49:03','2017-04-16 22:49:03','f06d0da3-2a32-4533-9aea-aa49091e7752'),
	(95,47,46,40,0,1,'2017-04-16 22:49:03','2017-04-16 22:49:03','a88980b9-b48a-4d05-a418-04f6995065ee'),
	(96,48,47,89,0,1,'2017-04-16 22:49:03','2017-04-16 22:49:03','18ef6ed1-eb08-4838-90ad-471eb48257d6'),
	(97,48,48,43,0,1,'2017-04-16 22:49:03','2017-04-16 22:49:03','7d7f7883-7159-483f-af6c-4c263c25d857'),
	(98,49,50,77,0,1,'2017-04-16 22:49:03','2017-04-16 22:49:03','527d9310-1fed-43b9-b74b-190eff83d54e'),
	(99,50,51,26,0,1,'2017-04-16 22:49:03','2017-04-16 22:49:03','7b4f4089-faf0-40f7-b026-c854633030ae'),
	(100,50,51,47,0,2,'2017-04-16 22:49:03','2017-04-16 22:49:03','b755860e-11b9-49ff-8cdb-7f8eca2bf663'),
	(101,51,52,26,0,1,'2017-04-16 22:49:03','2017-04-16 22:49:03','971c6df5-0932-4191-9e8c-1d573be635e4'),
	(102,52,53,26,0,1,'2017-04-16 22:49:03','2017-04-16 22:49:03','34a3c4b2-a61d-41de-b0e8-242015b9a8f3'),
	(103,53,54,26,0,1,'2017-04-16 22:49:03','2017-04-16 22:49:03','abd9855c-a0c5-4b9e-98ae-d16f865ba6e6'),
	(108,57,60,12,0,1,'2017-04-16 22:49:03','2017-04-16 22:49:03','a447c83c-2e2b-4352-8f43-d5cde4898e59'),
	(109,60,62,100,0,1,'2017-04-16 22:50:54','2017-04-16 22:50:54','fc27caae-0d91-444c-8824-1717e11ee74d'),
	(110,61,63,100,0,1,'2017-04-16 22:50:54','2017-04-16 22:50:54','122f466e-4faa-4125-89b5-320a1092ec49'),
	(111,61,64,3,0,1,'2017-04-16 22:50:54','2017-04-16 22:50:54','0cd14865-874e-4cb7-b540-0f7fb59c9f12'),
	(112,61,65,31,0,1,'2017-04-16 22:50:54','2017-04-16 22:50:54','28c95367-87e0-44bb-868e-1a3a24ed5cd3');

/*!40000 ALTER TABLE `craft_fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_fieldlayouts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fieldlayouts`;

CREATE TABLE `craft_fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fieldlayouts_type_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_fieldlayouts` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayouts` DISABLE KEYS */;

INSERT INTO `craft_fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(13,'SuperTable_Block','2017-04-16 22:48:52','2017-04-16 22:48:52','84ec66fe-438c-41c9-9ad6-d8551e9359c6'),
	(14,'SuperTable_Block','2017-04-16 22:48:53','2017-04-16 22:48:53','cd987564-825a-4f26-a7bb-d46a77e74019'),
	(15,'SuperTable_Block','2017-04-16 22:48:54','2017-04-16 22:48:54','40d3ba27-29c7-4ddb-837f-2ab4f76c308e'),
	(16,'SuperTable_Block','2017-04-16 22:48:55','2017-04-16 22:48:55','21a69951-f453-47d4-bf3c-5cd5b877e227'),
	(17,'SuperTable_Block','2017-04-16 22:48:55','2017-04-16 22:48:55','52d2feb8-1dce-43bb-b27f-a2041544b230'),
	(18,'SuperTable_Block','2017-04-16 22:48:55','2017-04-16 22:48:55','a6f48cd5-f329-46be-8fcc-dd8b332951ee'),
	(19,'SuperTable_Block','2017-04-16 22:48:56','2017-04-16 22:48:56','f9fd5e91-16c0-489d-9102-7f98c5d7c8bc'),
	(20,'SuperTable_Block','2017-04-16 22:48:57','2017-04-16 22:48:57','e4468a1d-4d89-499d-b56b-04b0d0b579c9'),
	(21,'SuperTable_Block','2017-04-16 22:48:57','2017-04-16 22:48:57','195790ea-e473-4aed-b00e-610a292f407e'),
	(22,'SuperTable_Block','2017-04-16 22:48:58','2017-04-16 22:48:58','221ad0cc-e6a6-4af0-a794-eae8313be347'),
	(23,'SuperTable_Block','2017-04-16 22:48:58','2017-04-16 22:48:58','7b39b17a-d42d-4aae-81ae-2a4f34f003d9'),
	(24,'SuperTable_Block','2017-04-16 22:48:59','2017-04-16 22:48:59','2bedaf19-d6dd-4b50-ba17-7a9a15e8cd9a'),
	(25,'SuperTable_Block','2017-04-16 22:48:59','2017-04-16 22:48:59','89e473c3-0c15-4585-9fca-a46de5acf1e7'),
	(26,'SuperTable_Block','2017-04-16 22:49:00','2017-04-16 22:49:00','bbda4f03-b80c-4eee-9a56-d2029e857b97'),
	(27,'SuperTable_Block','2017-04-16 22:49:00','2017-04-16 22:49:00','a93ca467-5fa1-4eff-841f-bba4dd20cc95'),
	(28,'SuperTable_Block','2017-04-16 22:49:01','2017-04-16 22:49:01','043e5bf8-074d-45a7-9a11-50d7c32b1208'),
	(29,'SuperTable_Block','2017-04-16 22:49:01','2017-04-16 22:49:01','8c830c2b-9863-4f78-a837-c6e34d7a3de6'),
	(30,'Neo_Block','2017-04-16 22:49:03','2017-04-16 22:49:03','bec0e549-8c7d-44e0-bc87-f968cf49714d'),
	(31,'Neo_Block','2017-04-16 22:49:03','2017-04-16 22:49:03','a27754f5-726b-4679-850b-6e18dd5f3d96'),
	(32,'Neo_Block','2017-04-16 22:49:03','2017-04-16 22:49:03','8a7bdded-b6c7-4e17-b2a6-1fad1491ccea'),
	(33,'Neo_Block','2017-04-16 22:49:03','2017-04-16 22:49:03','932ec0e6-2f38-46d0-9fc2-c29fb1fac387'),
	(34,'Neo_Block','2017-04-16 22:49:03','2017-04-16 22:49:03','43aca7cf-b772-42b6-9c4f-9f4c7a8b77ff'),
	(35,'Neo_Block','2017-04-16 22:49:03','2017-04-16 22:49:03','88b5d3a4-57f2-4616-89dc-e76645d26b43'),
	(36,'Neo_Block','2017-04-16 22:49:03','2017-04-16 22:49:03','d9b84b7c-645f-4195-866b-43a3298bcda8'),
	(37,'Neo_Block','2017-04-16 22:49:03','2017-04-16 22:49:03','b6098bde-62e1-40d8-8ef0-e7aecbd621f9'),
	(38,'Neo_Block','2017-04-16 22:49:03','2017-04-16 22:49:03','d13223e8-7509-40b4-b1c0-e9a051ffc96a'),
	(39,'Neo_Block','2017-04-16 22:49:03','2017-04-16 22:49:03','e1899c0f-25ce-486f-831f-dbd028b6c7ac'),
	(40,'Neo_Block','2017-04-16 22:49:03','2017-04-16 22:49:03','5f09094b-62f4-41a0-9613-7c1f741f0e2f'),
	(41,'Neo_Block','2017-04-16 22:49:03','2017-04-16 22:49:03','e5bc34f6-0998-4c1b-8dc1-d8a4f08de734'),
	(42,'Neo_Block','2017-04-16 22:49:03','2017-04-16 22:49:03','fe8b1706-2903-4b2a-ade1-02985ffe6dea'),
	(43,'Neo_Block','2017-04-16 22:49:03','2017-04-16 22:49:03','7ee1f415-5ff8-41dd-8b67-9bfc6c87991d'),
	(44,'Neo_Block','2017-04-16 22:49:03','2017-04-16 22:49:03','bc8f8f85-6aad-43db-9ed6-f772a59e00b5'),
	(45,'Neo_Block','2017-04-16 22:49:03','2017-04-16 22:49:03','af41f54c-f5d3-425a-a5f5-9749f190a69c'),
	(46,'Neo_Block','2017-04-16 22:49:03','2017-04-16 22:49:03','613e5039-fcea-4042-85de-5789dbfed82d'),
	(47,'Neo_Block','2017-04-16 22:49:03','2017-04-16 22:49:03','07749319-6b9d-4c42-8b98-12219a2d93c1'),
	(48,'Neo_Block','2017-04-16 22:49:03','2017-04-16 22:49:03','500c76bb-c9b5-42c4-8c02-06005ad345fd'),
	(49,'Neo_Block','2017-04-16 22:49:03','2017-04-16 22:49:03','9766cf0f-bf4b-4e27-9296-fa5563998c98'),
	(50,'Asset','2017-04-16 22:49:03','2017-04-16 22:49:03','fe71cc0b-e5ed-4b25-b1eb-56bc7be8939b'),
	(51,'Asset','2017-04-16 22:49:03','2017-04-16 22:49:03','77461fdf-6c59-4c8b-9d8f-50886e76ef7d'),
	(52,'Asset','2017-04-16 22:49:03','2017-04-16 22:49:03','a6282a9d-2e19-44d2-8776-8eb70035ac58'),
	(53,'Asset','2017-04-16 22:49:03','2017-04-16 22:49:03','dd89dd45-8914-4e62-8034-15c154766aec'),
	(57,'GlobalSet','2017-04-16 22:49:03','2017-04-16 22:49:03','fe1ca5fd-a218-45f1-bce2-2839768c4a86'),
	(58,'Category','2017-04-16 22:50:30','2017-04-16 22:50:30','f837bfa0-44b1-4e1f-9e0f-6d8477ec1af5'),
	(59,'Entry','2017-04-16 22:50:54','2017-04-16 22:50:54','52e2db79-3c1c-4171-9eca-5c8820b59bc1'),
	(60,'Entry','2017-04-16 22:50:54','2017-04-16 22:50:54','2cbefcd5-323f-4d89-ac74-23ed17091e18'),
	(61,'Entry','2017-04-16 22:50:54','2017-04-16 22:50:54','8a144c09-6973-449d-ae30-624d4fe0ae92'),
	(62,'Entry','2017-04-16 22:56:24','2017-04-16 22:56:24','72539bda-f54f-4897-b9a0-d32502898220');

/*!40000 ALTER TABLE `craft_fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_fieldlayouttabs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fieldlayouttabs`;

CREATE TABLE `craft_fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  KEY `craft_fieldlayouttabs_layoutId_fk` (`layoutId`),
  CONSTRAINT `craft_fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayouttabs` DISABLE KEYS */;

INSERT INTO `craft_fieldlayouttabs` (`id`, `layoutId`, `name`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(3,13,'Content',1,'2017-04-16 22:48:52','2017-04-16 22:48:52','ddf7ff43-0835-45db-b192-b99d96ae689b'),
	(4,14,'Content',1,'2017-04-16 22:48:53','2017-04-16 22:48:53','f74fff47-bc9e-432d-be65-b01bcf14286b'),
	(5,15,'Content',1,'2017-04-16 22:48:54','2017-04-16 22:48:54','9514d65d-7e2c-4a92-9b9b-83e0b6441ba7'),
	(6,16,'Content',1,'2017-04-16 22:48:55','2017-04-16 22:48:55','61a58e5c-6e55-4415-8116-9899007dd618'),
	(7,17,'Content',1,'2017-04-16 22:48:55','2017-04-16 22:48:55','28b234bd-564b-4cf5-9f36-1566b8212afa'),
	(8,18,'Content',1,'2017-04-16 22:48:55','2017-04-16 22:48:55','7ffaef62-7eb7-4de8-8c4a-c060fe36d287'),
	(9,19,'Content',1,'2017-04-16 22:48:56','2017-04-16 22:48:56','46586fbd-3e8e-4553-bd93-e8e9425971d0'),
	(10,20,'Content',1,'2017-04-16 22:48:57','2017-04-16 22:48:57','38eb46c2-2ccb-43fb-8bac-2cb7efaa1c8a'),
	(11,21,'Content',1,'2017-04-16 22:48:57','2017-04-16 22:48:57','35c2b7dd-3e9a-4990-9dcb-127240029c7b'),
	(12,22,'Content',1,'2017-04-16 22:48:58','2017-04-16 22:48:58','d130c873-c539-4e10-bbf1-e863e239a0f3'),
	(13,23,'Content',1,'2017-04-16 22:48:58','2017-04-16 22:48:58','95fe3b05-4239-40f0-a93e-8f9689fb8dc8'),
	(14,24,'Content',1,'2017-04-16 22:48:59','2017-04-16 22:48:59','8ea5c5ad-560e-4722-9340-634102b399b7'),
	(15,25,'Content',1,'2017-04-16 22:48:59','2017-04-16 22:48:59','d05a25b5-6b6e-4bbf-b07d-e2e901a12ec2'),
	(16,26,'Content',1,'2017-04-16 22:49:00','2017-04-16 22:49:00','0e8b925d-e96e-4192-9944-35c9c31f388d'),
	(17,27,'Content',1,'2017-04-16 22:49:00','2017-04-16 22:49:00','f34f15a3-c7e9-440f-895a-e12c305af11f'),
	(18,28,'Content',1,'2017-04-16 22:49:01','2017-04-16 22:49:01','902c9f4d-29aa-464f-9f09-4814bdf3b470'),
	(19,29,'Content',1,'2017-04-16 22:49:01','2017-04-16 22:49:01','566a1488-86d5-460c-9714-3452467cdbea'),
	(20,30,'Content',1,'2017-04-16 22:49:03','2017-04-16 22:49:03','9de82b37-817f-4838-8ffd-ad7c6325f0c5'),
	(21,30,'Settings',2,'2017-04-16 22:49:03','2017-04-16 22:49:03','f3057513-019f-425c-ba51-20e15b88fb36'),
	(22,31,'Content',1,'2017-04-16 22:49:03','2017-04-16 22:49:03','953a9dd5-2860-44cb-bd13-55fa392e8fa5'),
	(23,32,'Content',1,'2017-04-16 22:49:03','2017-04-16 22:49:03','1d660a10-174c-4d83-b910-c05f1f6bfc84'),
	(24,33,'Content',1,'2017-04-16 22:49:03','2017-04-16 22:49:03','5acb6ae6-c176-4288-977c-a1f6cc58f251'),
	(25,33,'Settings',2,'2017-04-16 22:49:03','2017-04-16 22:49:03','c4c25f5e-28c8-4c57-8d5e-5c0c86afe680'),
	(26,35,'Content',1,'2017-04-16 22:49:03','2017-04-16 22:49:03','347bfc74-481a-4d7e-9ddf-05b802e03a2d'),
	(27,35,'Settings',2,'2017-04-16 22:49:03','2017-04-16 22:49:03','236018bd-057c-4d26-9c83-b997ac00110d'),
	(28,36,'Content',1,'2017-04-16 22:49:03','2017-04-16 22:49:03','d2f444d3-2801-4320-801b-04a81db1f248'),
	(29,37,'Content',1,'2017-04-16 22:49:03','2017-04-16 22:49:03','0cb9c19d-a825-4589-ab4e-3a682013b422'),
	(30,39,'Content',1,'2017-04-16 22:49:03','2017-04-16 22:49:03','dcfe28a4-d032-4b9b-9ddf-93378dc896e3'),
	(31,40,'Content',1,'2017-04-16 22:49:03','2017-04-16 22:49:03','2e6b8098-1d35-4c14-aa95-3651502e5e4b'),
	(32,40,'Settings',2,'2017-04-16 22:49:03','2017-04-16 22:49:03','b029c373-f95f-489b-a366-2354be38eee5'),
	(33,41,'Content',1,'2017-04-16 22:49:03','2017-04-16 22:49:03','e3eeb91e-ee08-4346-8d15-387d6279516b'),
	(34,41,'Settings',2,'2017-04-16 22:49:03','2017-04-16 22:49:03','05039281-f3a3-45a2-a576-45dceb027a04'),
	(35,42,'Content',1,'2017-04-16 22:49:03','2017-04-16 22:49:03','f90b479c-97f9-4c1d-b477-089c516dd7c2'),
	(36,42,'Settings',2,'2017-04-16 22:49:03','2017-04-16 22:49:03','2253a881-d16a-4fb1-ba02-2e4738336e3e'),
	(37,43,'Content',1,'2017-04-16 22:49:03','2017-04-16 22:49:03','23f31c1e-fbd7-4392-9c44-30bbb9b90bc4'),
	(38,43,'Settings',2,'2017-04-16 22:49:03','2017-04-16 22:49:03','92e65d47-2506-49cd-a2ec-224a987697ba'),
	(39,44,'Content',1,'2017-04-16 22:49:03','2017-04-16 22:49:03','2950a1c3-90d2-4f66-9cee-41c30373e72b'),
	(40,44,'Settings',2,'2017-04-16 22:49:03','2017-04-16 22:49:03','c9f244ab-61ef-4e4f-b8d6-4009a022d7a5'),
	(41,45,'Content',1,'2017-04-16 22:49:03','2017-04-16 22:49:03','c9b8abd5-766b-442b-b95f-0310c06a0b83'),
	(42,45,'Settings',2,'2017-04-16 22:49:03','2017-04-16 22:49:03','444b3f58-3208-4166-985d-8546fd599253'),
	(43,46,'Content',1,'2017-04-16 22:49:03','2017-04-16 22:49:03','22331423-95be-4e54-b622-bab1e5067aeb'),
	(44,46,'Settings',2,'2017-04-16 22:49:03','2017-04-16 22:49:03','0d7dd488-3a41-4dba-8d4a-b2a613406b90'),
	(45,47,'Content',1,'2017-04-16 22:49:03','2017-04-16 22:49:03','59b173c8-3a5f-42fc-ba1e-cec0e18c7d24'),
	(46,47,'Settings',2,'2017-04-16 22:49:03','2017-04-16 22:49:03','132fe154-b136-4477-8081-1d97e94b1ae5'),
	(47,48,'Content',1,'2017-04-16 22:49:03','2017-04-16 22:49:03','bba03578-d0d9-4821-89b8-38974b121b92'),
	(48,48,'Settings',2,'2017-04-16 22:49:03','2017-04-16 22:49:03','5630a55a-b945-42c9-b932-76d7448c2295'),
	(49,49,'Content',1,'2017-04-16 22:49:03','2017-04-16 22:49:03','b72c0e52-cabd-474e-88f4-ee3ee141ba0b'),
	(50,49,'Settings',2,'2017-04-16 22:49:03','2017-04-16 22:49:03','58a8f7c0-dc5f-450a-8ceb-034c4cf06afc'),
	(51,50,'Content',1,'2017-04-16 22:49:03','2017-04-16 22:49:03','7ac06180-abe9-4fa1-8bfe-5170df40f36f'),
	(52,51,'Content',1,'2017-04-16 22:49:03','2017-04-16 22:49:03','5a6aacb7-34e5-48fe-bff2-90a187e340bf'),
	(53,52,'Content',1,'2017-04-16 22:49:03','2017-04-16 22:49:03','4a77c3a2-b27f-414e-b670-74eb86a9d71b'),
	(54,53,'Content',1,'2017-04-16 22:49:03','2017-04-16 22:49:03','6b52fe1a-ba75-43a9-abfc-3567990e7861'),
	(60,57,'Content',1,'2017-04-16 22:49:03','2017-04-16 22:49:03','dff5fceb-7e29-43db-8fb4-4f5038ab3024'),
	(61,59,'Content',1,'2017-04-16 22:50:54','2017-04-16 22:50:54','5d8f062c-59b9-46f0-8c51-d9281af2655e'),
	(62,60,'Content',1,'2017-04-16 22:50:54','2017-04-16 22:50:54','c974e55a-a6c4-4e65-acc3-2dd4b3a83f0b'),
	(63,61,'Content Neo',1,'2017-04-16 22:50:54','2017-04-16 22:50:54','ea6c2926-bfdd-40c7-b0d3-ccb2e243c2e2'),
	(64,61,'Meta',2,'2017-04-16 22:50:54','2017-04-16 22:50:54','cbee3064-d627-405a-9576-1f16ab2fa03f'),
	(65,61,'SEO',3,'2017-04-16 22:50:54','2017-04-16 22:50:54','8d9ffd8f-79ec-414c-b227-2ddf1ff7b024');

/*!40000 ALTER TABLE `craft_fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fields`;

CREATE TABLE `craft_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(58) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `instructions` text COLLATE utf8_unicode_ci,
  `translatable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fields_handle_context_unq_idx` (`handle`,`context`),
  KEY `craft_fields_context_idx` (`context`),
  KEY `craft_fields_groupId_fk` (`groupId`),
  CONSTRAINT `craft_fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_fields` WRITE;
/*!40000 ALTER TABLE `craft_fields` DISABLE KEYS */;

INSERT INTO `craft_fields` (`id`, `groupId`, `name`, `handle`, `context`, `instructions`, `translatable`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(3,2,'Category: Default','categoryDefault','global','',0,'Categories','{\"source\":\"default\",\"limit\":\"\",\"selectionLabel\":\"\"}','2017-04-16 22:48:52','2017-04-16 22:48:52','f99eb1e1-cf4f-4c6a-a6a9-c0b670f178eb'),
	(4,4,'Global: Contact','globalContact','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"},\"new4\":{\"width\":\"\"},\"new5\":{\"width\":\"\"},\"new6\":{\"width\":\"\"},\"new7\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-04-16 22:48:52','2017-04-16 22:48:52','775a80e1-a6c7-45e3-9b73-28c6c4af82bd'),
	(5,NULL,'Company','company','superTableBlockType:1','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:52','2017-04-16 22:48:52','2057f1f5-4c1a-47b6-93a6-cba4928e37f4'),
	(6,NULL,'Street','street','superTableBlockType:1','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:52','2017-04-16 22:48:52','ae9276a2-45c6-416e-912a-40b6138d5295'),
	(7,NULL,'Postal Code','postalCode','superTableBlockType:1','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:52','2017-04-16 22:48:52','700b3fab-6c34-4d52-91e3-7040a2b924c4'),
	(8,NULL,'Location','location','superTableBlockType:1','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:52','2017-04-16 22:48:52','dd655459-562b-407b-b61f-01b6e4769cdc'),
	(9,NULL,'Mail','mail','superTableBlockType:1','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:52','2017-04-16 22:48:52','58e879da-d437-452b-afcb-945da6296860'),
	(10,NULL,'Phone','phone','superTableBlockType:1','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:52','2017-04-16 22:48:52','40502cff-09b2-48d2-8a35-842a68042436'),
	(11,NULL,'Mobile Phone','mobilePhone','superTableBlockType:1','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:52','2017-04-16 22:48:52','5e0c3714-2202-4a5a-a017-6a36d2da3f8c'),
	(12,4,'Global: Social Networks','globalSocialNetworks','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"},\"new4\":{\"width\":\"\"},\"new5\":{\"width\":\"\"},\"new6\":{\"width\":\"\"},\"new7\":{\"width\":\"\"},\"new8\":{\"width\":\"\"},\"new9\":{\"width\":\"\"},\"new10\":{\"width\":\"\"},\"new11\":{\"width\":\"\"},\"new12\":{\"width\":\"\"},\"new13\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-04-16 22:48:52','2017-04-16 22:48:52','96454479-754b-48d9-b20f-6d621eb39274'),
	(13,NULL,'Behance Username','behanceUsername','superTableBlockType:2','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:52','2017-04-16 22:48:52','f178e6ee-4f62-4fb6-aa1b-1dc1f9a4125e'),
	(14,NULL,'Dribbble Username','dribbbleUsername','superTableBlockType:2','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:52','2017-04-16 22:48:52','0264b7f0-0649-48d3-a4f1-31f1332550a5'),
	(15,NULL,'Facebook Username','facebookUsername','superTableBlockType:2','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:53','2017-04-16 22:48:53','5069d545-691d-45e6-8777-a70c04f66a64'),
	(16,NULL,'GitHub Username','githubUsername','superTableBlockType:2','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:53','2017-04-16 22:48:53','45e2ea9f-0a63-485e-bb08-d157145b0e96'),
	(17,NULL,'Google+ Username','googleUsername','superTableBlockType:2','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:53','2017-04-16 22:48:53','0b61a60d-1ef5-42ea-84d1-8fd002d9ec52'),
	(18,NULL,'Instagram Username','instagramUsername','superTableBlockType:2','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:53','2017-04-16 22:48:53','6dcdec28-9110-4fd6-bc7b-425c86b9bb71'),
	(19,NULL,'LinkedIn Username','linkedinUsername','superTableBlockType:2','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:53','2017-04-16 22:48:53','2c906266-ab3d-43c5-9d12-25377d733d87'),
	(20,NULL,'Medium Username','mediumUsername','superTableBlockType:2','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:53','2017-04-16 22:48:53','9b6c9242-d31f-4e54-abd3-d8f11ff341f6'),
	(21,NULL,'Pinterest Username','pinterestUsername','superTableBlockType:2','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:53','2017-04-16 22:48:53','7b05a406-f57f-40f4-aca3-28d0792d956d'),
	(22,NULL,'Tumblr Username','tumblrUsername','superTableBlockType:2','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:53','2017-04-16 22:48:53','522b13a2-3053-49e1-b670-deddfc2b1b7f'),
	(23,NULL,'Twitter Username','twitterUsername','superTableBlockType:2','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:53','2017-04-16 22:48:53','9b4b71ec-b14d-4780-9ac5-75e2f2d17095'),
	(24,NULL,'VSCO Username','vscoUsername','superTableBlockType:2','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:53','2017-04-16 22:48:53','7b2f374c-f8c2-45a6-8875-43a1697f1dca'),
	(25,NULL,'Xing Username','xingUsername','superTableBlockType:2','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:53','2017-04-16 22:48:53','12175b53-dbfe-42ce-aac1-2fb448b51b04'),
	(26,5,'Grouped: Caption','groupedCaption','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"},\"new4\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-04-16 22:48:53','2017-04-16 22:48:53','fafa7ae1-a36e-44e9-88e4-2f9daf4f9900'),
	(27,NULL,'Caption Title','captionTitle','superTableBlockType:3','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:54','2017-04-16 22:48:54','3f73e9e5-7181-4c97-9c4b-de0755a70f94'),
	(28,NULL,'Caption','caption','superTableBlockType:3','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":1,\"initialRows\":4}','2017-04-16 22:48:54','2017-04-16 22:48:54','f6e95218-fc09-4235-a491-471c1c2d3914'),
	(29,NULL,'Source','source','superTableBlockType:3','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:54','2017-04-16 22:48:54','d6d22381-2c84-4784-96fc-8564e6b5d384'),
	(30,NULL,'Source URL','sourceUrl','superTableBlockType:3','',0,'FruitLinkIt','{\"types\":[\"custom\"],\"defaultText\":\"\",\"allowCustomText\":\"\",\"allowTarget\":\"\",\"entrySources\":[],\"entrySelectionLabel\":\"Select an entry\",\"assetSources\":\"*\",\"assetSelectionLabel\":\"Select an asset\",\"categorySources\":\"*\",\"categorySelectionLabel\":\"Select a category\"}','2017-04-16 22:48:54','2017-04-16 22:48:54','39aa2cb6-f8c4-492f-8300-4f6291025bc0'),
	(31,6,'Plugin: Seomatic','pluginSeomatic','global','',0,'Seomatic_Meta','{\"assetSources\":\"*\",\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"WebPage\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoTitle\":\"\",\"seoTitleSourceChangeable\":1,\"seoDescriptionSource\":\"custom\",\"seoDescriptionSourceField\":\"title\",\"seoDescription\":\"\",\"seoDescriptionSourceChangeable\":1,\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoKeywords\":\"\",\"seoKeywordsSourceChangeable\":1,\"seoImageIdSource\":\"custom\",\"seoImageIdSourceField\":\"cbmImage\",\"seoImageIdSourceChangeable\":1,\"seoImageTransform\":\"\",\"twitterCardType\":\"\",\"twitterCardTypeChangeable\":1,\"seoTwitterImageIdSource\":\"custom\",\"seoTwitterImageIdSourceField\":\"cbmImage\",\"seoTwitterImageIdSourceChangeable\":1,\"seoTwitterImageTransform\":\"\",\"openGraphType\":\"\",\"openGraphTypeChangeable\":1,\"seoFacebookImageIdSource\":\"custom\",\"seoFacebookImageIdSourceField\":\"cbmImage\",\"seoFacebookImageIdSourceChangeable\":1,\"seoFacebookImageTransform\":\"\",\"robots\":\"\",\"robotsChangeable\":1}','2017-04-16 22:48:54','2017-04-16 22:48:54','07f85313-5d91-415c-9bd3-6cd0acf06af1'),
	(32,7,'Settings: Button','settingsButton','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"},\"new4\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-04-16 22:48:54','2017-04-16 22:48:54','08cd9e7a-9813-425d-a459-957dfbd8d3f4'),
	(33,NULL,'Style','style','superTableBlockType:4','',0,'Dropdown','{\"options\":[{\"label\":\"Primary\",\"value\":\"primary\",\"default\":1},{\"label\":\"Secondary\",\"value\":\"secondary\",\"default\":\"\"}]}','2017-04-16 22:48:54','2017-04-16 22:48:54','01c6ed96-507a-4b5b-b289-e724f15bb9f4'),
	(34,NULL,'Alignment','alignment','superTableBlockType:4','',0,'Dropdown','{\"options\":[{\"label\":\"Left\",\"value\":\"left\",\"default\":1},{\"label\":\"Center\",\"value\":\"center\",\"default\":\"\"},{\"label\":\"Right\",\"value\":\"right\",\"default\":\"\"},{\"label\":\"Full\",\"value\":\"full\",\"default\":\"\"}]}','2017-04-16 22:48:54','2017-04-16 22:48:54','3ef6503f-da31-4ba9-b345-afa2b7c8a582'),
	(35,NULL,'With Icon','withIcon','superTableBlockType:4','',0,'Lightswitch','{\"default\":\"\"}','2017-04-16 22:48:54','2017-04-16 22:48:54','e49d80c5-fa5b-410c-93c5-6c8fd92cea6c'),
	(36,NULL,'Icon','icon','superTableBlockType:4','',0,'Dropdown','{\"options\":[{\"label\":\"Icon Sample\",\"value\":\"iconSample\",\"default\":1}]}','2017-04-16 22:48:55','2017-04-16 22:48:55','6882dfa7-51ee-4047-bccc-6640382a4a53'),
	(37,7,'Settings: ButtonGroup','settingsButtonGroup','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-04-16 22:48:55','2017-04-16 22:48:55','2ce3ba09-a1bf-4a19-bafd-421b3114a1e9'),
	(38,NULL,'Style','style','superTableBlockType:5','',0,'Dropdown','{\"options\":[{\"label\":\"Primary\",\"value\":\"primary\",\"default\":1},{\"label\":\"Secondary\",\"value\":\"secondary\",\"default\":\"\"}]}','2017-04-16 22:48:55','2017-04-16 22:48:55','6c309da0-b686-4525-9228-a816b6fdfea4'),
	(39,NULL,'Alignment','alignment','superTableBlockType:5','',0,'Dropdown','{\"options\":[{\"label\":\"Left\",\"value\":\"left\",\"default\":1},{\"label\":\"Center\",\"value\":\"center\",\"default\":\"\"},{\"label\":\"Right\",\"value\":\"right\",\"default\":\"\"},{\"label\":\"Full\",\"value\":\"full\",\"default\":\"\"}]}','2017-04-16 22:48:55','2017-04-16 22:48:55','006f2f65-036f-4194-9eb3-40aab320f0a7'),
	(40,7,'Settings: Definition List','settingsDefinitionList','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-04-16 22:48:55','2017-04-16 22:48:55','415cfc65-b315-494c-8c28-97cf7bac58e9'),
	(41,NULL,'Columns Ratio','columnsRatio','superTableBlockType:6','',0,'Dropdown','{\"options\":[{\"label\":\"1:1\",\"value\":\"50-50\",\"default\":1},{\"label\":\"1:2\",\"value\":\"33-66\",\"default\":\"\"},{\"label\":\"1:3\",\"value\":\"25-75\",\"default\":\"\"}]}','2017-04-16 22:48:55','2017-04-16 22:48:55','161f4ffe-b03e-41ae-b6aa-5e6a9b397493'),
	(42,NULL,'Layout','layout','superTableBlockType:6','',0,'Dropdown','{\"options\":[{\"label\":\"Table Layout\",\"value\":\"table\",\"default\":1},{\"label\":\"Row Layout\",\"value\":\"row\",\"default\":\"\"}]}','2017-04-16 22:48:55','2017-04-16 22:48:55','0d5a23e5-8449-462c-bfc3-d5b9fe45f3b7'),
	(43,7,'Settings: Embed','settingsEmbed','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-04-16 22:48:55','2017-04-16 22:48:55','e53396bc-f7a9-48f6-b84d-d0688ec3e36c'),
	(44,NULL,'Video','video','superTableBlockType:7','',0,'Lightswitch','{\"default\":1}','2017-04-16 22:48:56','2017-04-16 22:48:56','99315949-73eb-4c8e-aa88-76cc3045b38f'),
	(45,NULL,'Embed Position','embedPosition','superTableBlockType:7','',0,'Dropdown','{\"options\":[{\"label\":\"Left\",\"value\":\"left\",\"default\":1},{\"label\":\"Center\",\"value\":\"center\",\"default\":\"\"},{\"label\":\"Right\",\"value\":\"right\",\"default\":\"\"}]}','2017-04-16 22:48:56','2017-04-16 22:48:56','a536303f-28f8-44ce-a714-7016c49cbefd'),
	(46,NULL,'Embed: Width','embedWidth','superTableBlockType:7','',0,'Dropdown','{\"options\":[{\"label\":\"Full\",\"value\":\"full\",\"default\":1},{\"label\":\"Three Quarter\",\"value\":\"threeQuarter\",\"default\":\"\"},{\"label\":\"Half\",\"value\":\"half\",\"default\":\"\"}]}','2017-04-16 22:48:56','2017-04-16 22:48:56','0a23214e-c6eb-43ae-ba97-6687d0c41bc2'),
	(47,7,'Settings: Focal Point','settingsFocalPoint','global','',0,'FocalPointField_FocalPoint','{\"defaultFocalPoint\":\"50% 50%\"}','2017-04-16 22:48:56','2017-04-16 22:48:56','56b4e0bb-3648-4872-a635-41125c6d0fd5'),
	(48,7,'Settings: Headline','settingsHeadline','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-04-16 22:48:56','2017-04-16 22:48:56','0cc564f2-f3aa-4195-acfe-e2d440c35d1f'),
	(49,NULL,'Indented','indented','superTableBlockType:8','',0,'Lightswitch','{\"default\":\"\"}','2017-04-16 22:48:56','2017-04-16 22:48:56','b91cd474-62c4-4ff6-a691-3b1f451f5a9f'),
	(50,NULL,'Semantic Size','semanticSize','superTableBlockType:8','',0,'Dropdown','{\"options\":[{\"label\":\"H1\",\"value\":\"h1\",\"default\":\"\"},{\"label\":\"H2\",\"value\":\"h2\",\"default\":1},{\"label\":\"H3\",\"value\":\"h3\",\"default\":\"\"},{\"label\":\"H4\",\"value\":\"h4\",\"default\":\"\"},{\"label\":\"H5\",\"value\":\"h5\",\"default\":\"\"},{\"label\":\"H6\",\"value\":\"h6\",\"default\":\"\"}]}','2017-04-16 22:48:57','2017-04-16 22:48:57','e762c338-786b-4e81-89c6-bb58d32ebc28'),
	(51,NULL,'Visual Size','visualSize','superTableBlockType:8','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Looks like H1\",\"value\":\"h1\",\"default\":\"\"},{\"label\":\"Looks like H2\",\"value\":\"h2\",\"default\":\"\"},{\"label\":\"Looks like H3\",\"value\":\"h3\",\"default\":\"\"},{\"label\":\"Looks like H4\",\"value\":\"h4\",\"default\":\"\"},{\"label\":\"Looks like H5\",\"value\":\"h5\",\"default\":\"\"},{\"label\":\"Looks like H6\",\"value\":\"h6\",\"default\":\"\"}]}','2017-04-16 22:48:57','2017-04-16 22:48:57','de49f995-e774-4d2b-ad9c-17376f79a2ae'),
	(52,7,'Settings: Image Cover','settingsImageCover','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-04-16 22:48:57','2017-04-16 22:48:57','209881bb-a426-47e6-aaa2-79354a549e58'),
	(53,NULL,'Background Position','backgroundPosition','superTableBlockType:9','',0,'Dropdown','{\"options\":[{\"label\":\"Focalpoint\",\"value\":\"focalpoint\",\"default\":1},{\"label\":\"Left : Top\",\"value\":\"0% 0%\",\"default\":\"\"},{\"label\":\"Left : Center\",\"value\":\"0% 50%\",\"default\":\"\"},{\"label\":\"Left : Bottom\",\"value\":\"0% 100%\",\"default\":\"\"},{\"label\":\"Center : Top\",\"value\":\"50% 0%\",\"default\":\"\"},{\"label\":\"Center : Center\",\"value\":\"50% 50%\",\"default\":\"\"},{\"label\":\"Center : Bottom\",\"value\":\"50% 100%\",\"default\":\"\"},{\"label\":\"Right : Top\",\"value\":\"100% 0%\",\"default\":\"\"},{\"label\":\"Right : Center\",\"value\":\"100% 50%\",\"default\":\"\"},{\"label\":\"Right : Bottom\",\"value\":\"100% 100%\",\"default\":\"\"}]}','2017-04-16 22:48:57','2017-04-16 22:48:57','bdd100ab-144e-4264-a75a-b5e6cb7c3350'),
	(54,NULL,'Text Vertical Position','textVerticalPosition','superTableBlockType:9','',0,'Dropdown','{\"options\":[{\"label\":\"Top\",\"value\":\"top\",\"default\":\"\"},{\"label\":\"Center\",\"value\":\"center\",\"default\":\"\"},{\"label\":\"Bottom\",\"value\":\"bottom\",\"default\":1}]}','2017-04-16 22:48:57','2017-04-16 22:48:57','332b34bc-c8e4-4ae5-8bc1-b4a1d403aaf2'),
	(55,NULL,'Text Alignment','textAlignment','superTableBlockType:9','',0,'Dropdown','{\"options\":[{\"label\":\"Left\",\"value\":\"left\",\"default\":\"\"},{\"label\":\"Center\",\"value\":\"center\",\"default\":1},{\"label\":\"Right\",\"value\":\"right\",\"default\":\"\"}]}','2017-04-16 22:48:57','2017-04-16 22:48:57','80e5dc50-61d7-4a7c-b1d9-8591cde2c6d9'),
	(56,7,'Settings: Image Gallery','settingsImageGallery','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-04-16 22:48:57','2017-04-16 22:48:57','21cf9e06-e54a-49e8-8799-c46f1308abcb'),
	(57,NULL,'Colums','columns','superTableBlockType:10','',0,'Dropdown','{\"options\":[{\"label\":6,\"value\":6,\"default\":1},{\"label\":5,\"value\":5,\"default\":\"\"},{\"label\":4,\"value\":4,\"default\":\"\"},{\"label\":3,\"value\":3,\"default\":\"\"},{\"label\":2,\"value\":2,\"default\":\"\"}]}','2017-04-16 22:48:57','2017-04-16 22:48:57','72e6effe-f568-4a11-8038-6d64a548ee83'),
	(58,NULL,'Image Position','imagePosition','superTableBlockType:10','',0,'Dropdown','{\"options\":[{\"label\":\"Focalpoint\",\"value\":\"focalpoint\",\"default\":1},{\"label\":\"Left : Top\",\"value\":\"0% 0%\",\"default\":\"\"},{\"label\":\"Left : Center\",\"value\":\"0% 50%\",\"default\":\"\"},{\"label\":\"Left : Bottom\",\"value\":\"0% 100%\",\"default\":\"\"},{\"label\":\"Center : Top\",\"value\":\"50% 0%\",\"default\":\"\"},{\"label\":\"Center : Center\",\"value\":\"50% 50%\",\"default\":\"\"},{\"label\":\"Center : Bottom\",\"value\":\"50% 100%\",\"default\":\"\"},{\"label\":\"Right : Top\",\"value\":\"100% 0%\",\"default\":\"\"},{\"label\":\"Right : Center\",\"value\":\"100% 50%\",\"default\":\"\"},{\"label\":\"Right : Bottom\",\"value\":\"100% 100%\",\"default\":\"\"}]}','2017-04-16 22:48:57','2017-04-16 22:48:57','56a92d04-bb91-47f0-9958-9cf59125118a'),
	(59,NULL,'Image Thumbs Ratio','imageThumbsRatio','superTableBlockType:10','',0,'Dropdown','{\"options\":[{\"label\":\"16:10\",\"value\":\"16:10\",\"default\":\"\"},{\"label\":\"16:9\",\"value\":\"16:9\",\"default\":\"\"},{\"label\":\"4:3\",\"value\":\"4:3\",\"default\":\"\"},{\"label\":\"3:2\",\"value\":\"3:2\",\"default\":\"\"},{\"label\":\"2:1\",\"value\":\"2:1\",\"default\":\"\"},{\"label\":\"1:1\",\"value\":\"1:1\",\"default\":1},{\"label\":\"1:2\",\"value\":\"1:2\",\"default\":\"\"},{\"label\":\"2:3\",\"value\":\"2:3\",\"default\":\"\"},{\"label\":\"3:4\",\"value\":\"3:4\",\"default\":\"\"},{\"label\":\"9:16\",\"value\":\"9:16\",\"default\":\"\"},{\"label\":\"10:16\",\"value\":\"10:16\",\"default\":\"\"}]}','2017-04-16 22:48:58','2017-04-16 22:48:58','812a3f7a-45d9-4351-8bb3-7a11f5aeb371'),
	(60,7,'Settings: Image Grid','settingsImageGrid','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-04-16 22:48:58','2017-04-16 22:48:58','b0f61e15-eec0-4227-b19b-3db8252c752c'),
	(61,NULL,'Caption','caption','superTableBlockType:11','',0,'Lightswitch','{\"default\":\"\"}','2017-04-16 22:48:58','2017-04-16 22:48:58','364a21c0-c4fd-4da0-a2c0-f9f83fb5233e'),
	(62,NULL,'Columns','columns','superTableBlockType:11','',0,'Dropdown','{\"options\":[{\"label\":3,\"value\":3,\"default\":\"\"},{\"label\":2,\"value\":2,\"default\":1},{\"label\":1,\"value\":1,\"default\":\"\"}]}','2017-04-16 22:48:58','2017-04-16 22:48:58','6cf16dcf-f649-464d-9be3-f40daefb1333'),
	(63,NULL,'Image Ratio','imageRatio','superTableBlockType:11','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"16:10\",\"value\":\"16:10\",\"default\":\"\"},{\"label\":\"16:9\",\"value\":\"16:9\",\"default\":\"\"},{\"label\":\"4:3\",\"value\":\"4:3\",\"default\":\"\"},{\"label\":\"3:2\",\"value\":\"3:2\",\"default\":\"\"},{\"label\":\"2:1\",\"value\":\"2:1\",\"default\":\"\"},{\"label\":\"1:1\",\"value\":\"1:1\",\"default\":\"\"},{\"label\":\"1:2\",\"value\":\"1:2\",\"default\":\"\"},{\"label\":\"2:3\",\"value\":\"2:3\",\"default\":\"\"},{\"label\":\"3:4\",\"value\":\"3:4\",\"default\":\"\"},{\"label\":\"9:16\",\"value\":\"9:16\",\"default\":\"\"},{\"label\":\"10:16\",\"value\":\"10:16\",\"default\":\"\"}]}','2017-04-16 22:48:58','2017-04-16 22:48:58','81d289bd-9d5d-49fd-93a4-9dff38fa9966'),
	(64,7,'Settings: Image Single','settingsImageSingle','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"},\"new4\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-04-16 22:48:58','2017-04-16 22:48:58','810871ff-93b3-4f1d-a8ff-8e3743dd8361'),
	(65,NULL,'Caption','caption','superTableBlockType:12','',0,'Lightswitch','{\"default\":\"\"}','2017-04-16 22:48:58','2017-04-16 22:48:58','674b8645-5a09-44f1-9b6c-d7f73179886f'),
	(66,NULL,'Image Position','imagePosition','superTableBlockType:12','',0,'Dropdown','{\"options\":[{\"label\":\"Left\",\"value\":\"left\",\"default\":\"\"},{\"label\":\"Center\",\"value\":\"center\",\"default\":1},{\"label\":\"Right\",\"value\":\"right\",\"default\":\"\"}]}','2017-04-16 22:48:59','2017-04-16 22:48:59','2bedac5a-5b13-49ef-92d0-91478e203fe7'),
	(67,NULL,'Image Ratio','imageRatio','superTableBlockType:12','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"16:10\",\"value\":\"16:10\",\"default\":\"\"},{\"label\":\"16:9\",\"value\":\"16:9\",\"default\":\"\"},{\"label\":\"4:3\",\"value\":\"4:3\",\"default\":\"\"},{\"label\":\"3:2\",\"value\":\"3:2\",\"default\":\"\"},{\"label\":\"2:1\",\"value\":\"2:1\",\"default\":\"\"},{\"label\":\"1:1\",\"value\":\"1:1\",\"default\":\"\"},{\"label\":\"1:2\",\"value\":\"1:2\",\"default\":\"\"},{\"label\":\"2:3\",\"value\":\"2:3\",\"default\":\"\"},{\"label\":\"3:4\",\"value\":\"3:4\",\"default\":\"\"},{\"label\":\"9:16\",\"value\":\"9:16\",\"default\":\"\"},{\"label\":\"10:16\",\"value\":\"10:16\",\"default\":\"\"}]}','2017-04-16 22:48:59','2017-04-16 22:48:59','5c9b3f7d-b541-4f5a-b514-cfc65f52ef7b'),
	(68,NULL,'Image Width','imageWidth','superTableBlockType:12','',0,'Dropdown','{\"options\":[{\"label\":\"Full\",\"value\":\"full\",\"default\":1},{\"label\":\"Three Quarter\",\"value\":\"threeQuarter\",\"default\":\"\"},{\"label\":\"Half\",\"value\":\"half\",\"default\":\"\"}]}','2017-04-16 22:48:59','2017-04-16 22:48:59','2661efb8-eb33-45be-8b5b-bd92ce47d06b'),
	(69,7,'Settings: Image Slider','settingsImageSlider','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-04-16 22:48:59','2017-04-16 22:48:59','cd018358-a1a4-40d0-a332-1cba4dfbc14e'),
	(70,NULL,'Image Ratio','imageRatio','superTableBlockType:13','',0,'Dropdown','{\"options\":[{\"label\":\"16:10\",\"value\":\"16:10\",\"default\":1},{\"label\":\"16:9\",\"value\":\"16:9\",\"default\":\"\"},{\"label\":\"4:3\",\"value\":\"4:3\",\"default\":\"\"},{\"label\":\"3:2\",\"value\":\"3:2\",\"default\":\"\"},{\"label\":\"2:1\",\"value\":\"2:1\",\"default\":\"\"},{\"label\":\"1:1\",\"value\":\"1:1\",\"default\":\"\"},{\"label\":\"1:2\",\"value\":\"1:2\",\"default\":\"\"},{\"label\":\"2:3\",\"value\":\"2:3\",\"default\":\"\"},{\"label\":\"3:4\",\"value\":\"3:4\",\"default\":\"\"},{\"label\":\"9:16\",\"value\":\"9:16\",\"default\":\"\"},{\"label\":\"10:16\",\"value\":\"10:16\",\"default\":\"\"}]}','2017-04-16 22:48:59','2017-04-16 22:48:59','0be4f25a-452b-4c08-914d-ce1cb40d71f6'),
	(71,NULL,'Navigation','navigation','superTableBlockType:13','',0,'Lightswitch','{\"default\":1}','2017-04-16 22:48:59','2017-04-16 22:48:59','087ecfe2-a335-42ce-929f-2cfd88e3f7e5'),
	(72,NULL,'Pagination','pagination','superTableBlockType:13','',0,'Lightswitch','{\"default\":1}','2017-04-16 22:48:59','2017-04-16 22:48:59','b1654cbd-9fb1-4e70-aaad-e296cf33e17e'),
	(73,7,'Settings: Section','settingsSection','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Section Options\",\"maxRows\":null}','2017-04-16 22:48:59','2017-04-16 22:48:59','8fabec04-d56b-4b9e-9387-759a5a223433'),
	(74,NULL,'Background Color','backgroundColor','superTableBlockType:14','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Black\",\"value\":\"black\",\"default\":\"\"},{\"label\":\"White\",\"value\":\"white\",\"default\":\"\"}]}','2017-04-16 22:49:00','2017-04-16 22:49:00','f8094dfe-0a52-4bc0-bd65-f3628d1a10d9'),
	(75,NULL,'Full Width','fullWidth','superTableBlockType:14','',0,'Lightswitch','{\"default\":\"\"}','2017-04-16 22:49:00','2017-04-16 22:49:00','9fc896ef-e002-4809-805e-bc7c64740e7a'),
	(76,NULL,'Padding Vertical','paddingVertical','superTableBlockType:14','',0,'Dropdown','{\"options\":[{\"label\":\"None\",\"value\":\"none\",\"default\":\"\"},{\"label\":\"Small\",\"value\":\"small\",\"default\":\"\"},{\"label\":\"Medium\",\"value\":\"medium\",\"default\":1},{\"label\":\"Large\",\"value\":\"large\",\"default\":\"\"}]}','2017-04-16 22:49:00','2017-04-16 22:49:00','21fe272b-40cb-43da-933f-d55c4ecdb2ff'),
	(77,7,'Settings: Separator','settingsSeparator','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-04-16 22:49:00','2017-04-16 22:49:00','1c16da1a-9828-49c5-9e0b-1aee38fbfbed'),
	(78,NULL,'Full Width','fullWidth','superTableBlockType:15','',0,'Lightswitch','{\"default\":\"\"}','2017-04-16 22:49:00','2017-04-16 22:49:00','de0b8df7-f8cb-42a9-bf5c-5052d27f9f43'),
	(79,NULL,'Style','style','superTableBlockType:15','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1}]}','2017-04-16 22:49:00','2017-04-16 22:49:00','f16ffbfa-5ac1-4106-b2a9-788bb96cb649'),
	(80,NULL,'Margin Vertical','marginVertical','superTableBlockType:15','',0,'Dropdown','{\"options\":[{\"label\":\"None\",\"value\":\"none\",\"default\":\"\"},{\"label\":\"Small\",\"value\":\"small\",\"default\":1},{\"label\":\"Medium\",\"value\":\"medium\",\"default\":\"\"},{\"label\":\"Large\",\"value\":\"large\",\"default\":\"\"}]}','2017-04-16 22:49:00','2017-04-16 22:49:00','1fcf5028-579b-41eb-8c3f-57c23c97f15f'),
	(81,7,'Settings: Two Columns','settingsTwoColumns','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-04-16 22:49:00','2017-04-16 22:49:00','18802973-8832-41e0-a612-0e29b2c9487c'),
	(82,NULL,'Columns Ratio','columnsRatio','superTableBlockType:16','',0,'Dropdown','{\"options\":[{\"label\":\"1:1\",\"value\":\"50-50\",\"default\":\"\"},{\"label\":\"2:1\",\"value\":\"66-33\",\"default\":\"\"},{\"label\":\"3:1\",\"value\":\"75-25\",\"default\":\"\"},{\"label\":\"1:3\",\"value\":\"25-75\",\"default\":\"\"},{\"label\":\"1:2\",\"value\":\"33-66\",\"default\":\"\"}]}','2017-04-16 22:49:01','2017-04-16 22:49:01','8f8d6b41-1126-47ed-9021-55a3edaee831'),
	(83,8,'Single: Anchor','singleAnchor','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:49:01','2017-04-16 22:49:01','dd3cf74d-e16d-4a66-b61c-dacf217067c9'),
	(84,8,'Single: Button','singleButton','global','',0,'FruitLinkIt','{\"types\":[\"email\",\"tel\",\"custom\",\"entry\",\"category\",\"asset\"],\"defaultText\":\"Click here\",\"allowCustomText\":1,\"allowTarget\":1,\"entrySources\":[],\"entrySelectionLabel\":\"Select an entry\",\"assetSources\":\"*\",\"assetSelectionLabel\":\"Select an asset\",\"categorySources\":\"*\",\"categorySelectionLabel\":\"Select a category\"}','2017-04-16 22:49:01','2017-04-16 22:49:01','8177593b-8cee-481a-854d-bfd5adc54c09'),
	(85,8,'Single: Button Group','singleButtonGroup','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":null,\"selectionLabel\":\"Add a Button\",\"maxRows\":5}','2017-04-16 22:49:01','2017-04-16 22:49:01','994107ce-abe4-4651-aa03-00bd619cd9f9'),
	(86,NULL,'Button','button','superTableBlockType:17','',0,'FruitLinkIt','{\"types\":[\"email\",\"tel\",\"custom\",\"entry\",\"category\",\"asset\"],\"defaultText\":\"\",\"allowCustomText\":1,\"allowTarget\":1,\"entrySources\":[],\"entrySelectionLabel\":\"Select an entry\",\"assetSources\":\"*\",\"assetSelectionLabel\":\"Select an asset\",\"categorySources\":\"*\",\"categorySelectionLabel\":\"Select a category\"}','2017-04-16 22:49:01','2017-04-16 22:49:01','51e3766b-5805-45eb-9140-a8bcb61048d5'),
	(87,8,'Single: Code','singleCode','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":1,\"initialRows\":8}','2017-04-16 22:49:02','2017-04-16 22:49:02','0c6beed0-c301-4bcc-b324-87a47d76d1cc'),
	(88,8,'Single: Definition List','singleDefinitionList','global','',0,'Table','{\"columns\":{\"col1\":{\"heading\":\"Definition Term\",\"handle\":\"definitionTerm\",\"width\":\"\",\"type\":\"singleline\"},\"col2\":{\"heading\":\"Definition Description\",\"handle\":\"definitionDescription\",\"width\":\"\",\"type\":\"singleline\"}},\"defaults\":{\"row1\":{\"col1\":\"\",\"col2\":\"\"}}}','2017-04-16 22:49:02','2017-04-16 22:49:02','cd553829-4aea-4a8a-88de-d33d8ec628e2'),
	(89,8,'Single: Embed Code','singleEmbedCode','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":1,\"initialRows\":2}','2017-04-16 22:49:02','2017-04-16 22:49:02','00e69e8a-9cfd-4fd2-953a-27efe4ecc6cc'),
	(90,8,'Single: Headline','singleHeadline','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:49:02','2017-04-16 22:49:02','3ef9aa49-1347-43d9-ab83-e5d017f535f6'),
	(91,8,'Single: Image','singleImage','global','',0,'Assets','{\"useSingleFolder\":1,\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":1,\"allowedKinds\":[\"image\"],\"limit\":1,\"viewMode\":\"list\",\"selectionLabel\":\"Add an Image\"}','2017-04-16 22:49:02','2017-04-16 22:49:02','3f8d6749-4752-43ac-8c4b-c114bdb261dd'),
	(92,8,'Single: Images','singleImages','global','',0,'Assets','{\"useSingleFolder\":1,\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":1,\"allowedKinds\":[\"image\"],\"limit\":\"\",\"viewMode\":\"list\",\"selectionLabel\":\"Add an Image\"}','2017-04-16 22:49:02','2017-04-16 22:49:02','a68296a9-b5fa-450a-a6c3-2a92ddac6bb3'),
	(93,8,'Single: Label','singleLabel','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:49:02','2017-04-16 22:49:02','e3341790-52a1-4fab-ba84-1e9157f4f0cf'),
	(94,8,'Single: Quote','singleQuote','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":1,\"initialRows\":4}','2017-04-16 22:49:02','2017-04-16 22:49:02','717862d4-82be-413f-8ab2-03d6515f6b2e'),
	(95,8,'Single: Rich Text','singleRichText','global','',0,'RichText','{\"configFile\":\"Custom.json\",\"availableAssetSources\":\"*\",\"availableTransforms\":\"*\",\"cleanupHtml\":1,\"purifyHtml\":1,\"columnType\":\"text\"}','2017-04-16 22:49:02','2017-04-16 22:49:02','f85c7165-6da7-44a9-928c-57095d6f6cfe'),
	(96,8,'Single: Source','singleSource','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:49:03','2017-04-16 22:49:03','ca0751da-0f25-4028-9e3d-17cdee2d809c'),
	(97,8,'Single: Source Url','singleSourceUrl','global','',0,'FruitLinkIt','{\"types\":[\"custom\"],\"defaultText\":\"\",\"allowCustomText\":1,\"allowTarget\":\"\",\"entrySources\":[],\"entrySelectionLabel\":\"Select an entry\",\"assetSources\":\"*\",\"assetSelectionLabel\":\"Select an asset\",\"categorySources\":\"*\",\"categorySelectionLabel\":\"Select a category\"}','2017-04-16 22:49:03','2017-04-16 22:49:03','28ac9431-3120-41a6-a177-85a8f047d82f'),
	(98,8,'Single: Subline','singleSubline','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:49:03','2017-04-16 22:49:03','9e2275b6-c045-4134-96b7-7320ffac648d'),
	(99,8,'Single: Text','singleText','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:49:03','2017-04-16 22:49:03','93e95a04-5244-4b57-aed4-575f7a4e1bcf'),
	(100,3,'Content Builder: Neo','contentBuilderNeo','global','',0,'Neo','{\"maxBlocks\":null}','2017-04-16 22:49:03','2017-04-16 22:49:03','aab66a18-eccb-4d87-9ce7-41dbac12dc72');

/*!40000 ALTER TABLE `craft_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_globalsets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_globalsets`;

CREATE TABLE `craft_globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_globalsets_name_unq_idx` (`name`),
  UNIQUE KEY `craft_globalsets_handle_unq_idx` (`handle`),
  KEY `craft_globalsets_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_globalsets` WRITE;
/*!40000 ALTER TABLE `craft_globalsets` DISABLE KEYS */;

INSERT INTO `craft_globalsets` (`id`, `name`, `handle`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(6,'Social Networks','socialNetworks',57,'2017-04-16 22:49:03','2017-04-16 22:49:03','6f8165d1-2636-4d74-96d7-9d86cf9f6774');

/*!40000 ALTER TABLE `craft_globalsets` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_info`;

CREATE TABLE `craft_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `edition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `siteUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timezone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `on` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maintenance` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_info` WRITE;
/*!40000 ALTER TABLE `craft_info` DISABLE KEYS */;

INSERT INTO `craft_info` (`id`, `version`, `schemaVersion`, `edition`, `siteName`, `siteUrl`, `timezone`, `on`, `maintenance`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'2.6.2972','2.6.9',2,'CB Modules','http://cbmodules.dev','UTC',1,0,'2017-04-16 21:53:40','2017-04-16 21:53:55','66d3ce2a-d695-463f-af51-9364c16014bf');

/*!40000 ALTER TABLE `craft_info` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_locales
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_locales`;

CREATE TABLE `craft_locales` (
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`locale`),
  KEY `craft_locales_sortOrder_idx` (`sortOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_locales` WRITE;
/*!40000 ALTER TABLE `craft_locales` DISABLE KEYS */;

INSERT INTO `craft_locales` (`locale`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	('de',1,'2017-04-16 21:53:40','2017-04-16 21:53:40','5ba3eb5a-8d4d-450a-be3f-a67d9deb0281');

/*!40000 ALTER TABLE `craft_locales` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_matrixblocks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_matrixblocks`;

CREATE TABLE `craft_matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `ownerLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_matrixblocks_ownerId_idx` (`ownerId`),
  KEY `craft_matrixblocks_fieldId_idx` (`fieldId`),
  KEY `craft_matrixblocks_typeId_idx` (`typeId`),
  KEY `craft_matrixblocks_sortOrder_idx` (`sortOrder`),
  KEY `craft_matrixblocks_ownerLocale_fk` (`ownerLocale`),
  CONSTRAINT `craft_matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_ownerLocale_fk` FOREIGN KEY (`ownerLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_matrixblocktypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_matrixblocktypes`;

CREATE TABLE `craft_matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  UNIQUE KEY `craft_matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  KEY `craft_matrixblocktypes_fieldId_fk` (`fieldId`),
  KEY `craft_matrixblocktypes_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_migrations`;

CREATE TABLE `craft_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pluginId` int(11) DEFAULT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_migrations_version_unq_idx` (`version`),
  KEY `craft_migrations_pluginId_fk` (`pluginId`),
  CONSTRAINT `craft_migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `craft_plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_migrations` WRITE;
/*!40000 ALTER TABLE `craft_migrations` DISABLE KEYS */;

INSERT INTO `craft_migrations` (`id`, `pluginId`, `version`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,'m000000_000000_base','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','34c86331-352c-422d-91cb-91bee8e0775a'),
	(2,NULL,'m140730_000001_add_filename_and_format_to_transformindex','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','82e65bc6-1d36-418f-848c-cd4e63760e9b'),
	(3,NULL,'m140815_000001_add_format_to_transforms','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','b1d89579-cd57-45a2-b9a8-ea5515840e73'),
	(4,NULL,'m140822_000001_allow_more_than_128_items_per_field','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','50d74475-24b3-496a-97f3-45f52decf189'),
	(5,NULL,'m140829_000001_single_title_formats','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','882a17a3-4d21-4254-9993-071bcf510740'),
	(6,NULL,'m140831_000001_extended_cache_keys','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','a398483c-2ba3-4402-8c12-25e08d31161f'),
	(7,NULL,'m140922_000001_delete_orphaned_matrix_blocks','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','3e688e6b-5238-4412-8c55-e7c4a84a2f28'),
	(8,NULL,'m141008_000001_elements_index_tune','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','77d11847-afa9-44bb-814f-3e581b12bde7'),
	(9,NULL,'m141009_000001_assets_source_handle','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','a613dcd1-f095-4e72-93a9-479c94330386'),
	(10,NULL,'m141024_000001_field_layout_tabs','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','d341e12b-0567-40a0-b85d-189a347e99a0'),
	(11,NULL,'m141030_000000_plugin_schema_versions','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','b4ce151b-8ada-479f-b9e4-775c68df3459'),
	(12,NULL,'m141030_000001_drop_structure_move_permission','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','3aa2db26-80a4-40ff-991a-5691e7b6f71b'),
	(13,NULL,'m141103_000001_tag_titles','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','c7c3a5ff-080a-464b-8e25-9ee1d30a1e5d'),
	(14,NULL,'m141109_000001_user_status_shuffle','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','3eaa99f3-02d0-409b-91f7-b3f2fb7cdabb'),
	(15,NULL,'m141126_000001_user_week_start_day','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','7cad0efe-4733-4bf2-ad5b-f505ff80596a'),
	(16,NULL,'m150210_000001_adjust_user_photo_size','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','faf56ab2-19fa-46bc-b04c-2f8d2ad19f0b'),
	(17,NULL,'m150724_000001_adjust_quality_settings','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','bc12216d-99ff-4b8d-b758-f138be0f9a1c'),
	(18,NULL,'m150827_000000_element_index_settings','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','40b83042-36cc-48e5-8556-bceecc610c3d'),
	(19,NULL,'m150918_000001_add_colspan_to_widgets','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','843fee34-28ed-46c0-b10a-e44edf9310bb'),
	(20,NULL,'m151007_000000_clear_asset_caches','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','0313d1dd-2e9d-4cfd-862f-a3b52b9bfff1'),
	(21,NULL,'m151109_000000_text_url_formats','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','ea7ceee5-b55d-4b5d-af20-4a437e9d0cdd'),
	(22,NULL,'m151110_000000_move_logo','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','d3183561-c7ef-418e-a56c-411af2b4e19b'),
	(23,NULL,'m151117_000000_adjust_image_widthheight','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','0c1d5844-7ca2-4011-8433-122da5ab8bd8'),
	(24,NULL,'m151127_000000_clear_license_key_status','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','62832846-b3ab-4270-b486-94062525412e'),
	(25,NULL,'m151127_000000_plugin_license_keys','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','a41e443d-36ff-4807-b89f-5b4eb4b9b90b'),
	(26,NULL,'m151130_000000_update_pt_widget_feeds','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','c7976a29-16a0-4818-8d72-d2ddf027efc9'),
	(27,NULL,'m160114_000000_asset_sources_public_url_default_true','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','113ef289-b71c-433c-9626-831a478139f7'),
	(28,NULL,'m160223_000000_sortorder_to_smallint','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','6bafb16d-671a-4750-99dd-5fcdddd19099'),
	(29,NULL,'m160229_000000_set_default_entry_statuses','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','ceda5daf-f712-4ba6-95ea-79e0f82daa0c'),
	(30,NULL,'m160304_000000_client_permissions','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','1a0b1be4-4ff6-42a5-93f4-8ec502eabd84'),
	(31,NULL,'m160322_000000_asset_filesize','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','0b81a941-5551-4551-a856-8b30fb157881'),
	(32,NULL,'m160503_000000_orphaned_fieldlayouts','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','4afdf993-8b62-4d4e-8712-bdaa93c85587'),
	(33,NULL,'m160510_000000_tasksettings','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','31db222e-d762-467c-91bc-4e82e0158d35'),
	(34,NULL,'m160829_000000_pending_user_content_cleanup','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','488b69ed-f175-45c0-ad85-571bcb596f14'),
	(35,NULL,'m160830_000000_asset_index_uri_increase','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','91d935fb-53aa-477c-8c22-18e5f4aefa2a'),
	(36,NULL,'m160919_000000_usergroup_handle_title_unique','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','9edeb9b6-db43-4280-aa21-c3b3dbbe481d'),
	(37,NULL,'m161108_000000_new_version_format','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','32ac0d42-b8d2-4193-84a6-2122a6bd01a8'),
	(38,NULL,'m161109_000000_index_shuffle','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','35b918cc-d481-49ad-8dc9-e821b590162a'),
	(39,1,'m140516_000000_cpCss_changeSettingsFieldName','2017-04-16 22:11:42','2017-04-16 22:11:42','2017-04-16 22:11:42','5dea3491-1997-4832-b027-6f6a25d63172'),
	(40,6,'m160208_010101_FruitLinkIt_UpdateExistingLinkItFields','2017-04-16 22:11:59','2017-04-16 22:11:59','2017-04-16 22:11:59','5d9f4d1e-77dd-489b-a0ce-2217af684917'),
	(41,8,'m160428_202308_Neo_UpdateBlockLevels','2017-04-16 22:42:26','2017-04-16 22:42:26','2017-04-16 22:42:26','28b4f3c3-4794-48fc-9964-31f1180d1bb6'),
	(42,8,'m160515_005002_Neo_UpdateBlockStructure','2017-04-16 22:42:26','2017-04-16 22:42:26','2017-04-16 22:42:26','7e50a633-057e-4116-9626-a722d764e655'),
	(43,8,'m160605_191540_Neo_UpdateBlockStructureLocales','2017-04-16 22:42:26','2017-04-16 22:42:26','2017-04-16 22:42:26','a01e6062-f7dd-4581-af3f-34b11779a86d'),
	(44,8,'m161029_230849_Neo_AddMaxChildBlocksSetting','2017-04-16 22:42:26','2017-04-16 22:42:26','2017-04-16 22:42:26','3a738e9b-8675-40e4-9f9a-2cd8fba7039b'),
	(45,10,'m150901_144609_superTable_fixForContentTables','2017-04-16 22:42:40','2017-04-16 22:42:40','2017-04-16 22:42:40','ec32b640-a9b3-45bb-aa19-ab8bc227b734'),
	(46,12,'m151225_000000_seomatic_addHumansField','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','3a3af2fd-ee9a-4e60-a239-41319426a39b'),
	(47,12,'m151226_000000_seomatic_addTwitterFacebookFields','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','b82521da-6324-4546-8eac-efeadb43fa9f'),
	(48,12,'m160101_000000_seomatic_addRobotsFields','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','eb34fb5e-0551-42e2-a7b4-44ab9a589179'),
	(49,12,'m160111_000000_seomatic_addTitleFields','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','eff3382f-d57b-4334-81cf-c419ae091a4b'),
	(50,12,'m160122_000000_seomatic_addTypeFields','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','588c7cd0-a6b6-4fe7-89d4-4965d7326dd3'),
	(51,12,'m160123_000000_seomatic_addOpeningHours','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','a0cb30be-7399-44c3-9d31-db4c35e27c68'),
	(52,12,'m160202_000000_seomatic_addSocialHandles','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','28a03ec3-ca7a-48d6-9a85-8a7d4e6c28f3'),
	(53,12,'m160204_000000_seomatic_addGoogleAnalytics','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','4d16eae5-214d-4b30-9cd7-20ccfdae5f9a'),
	(54,12,'m160205_000000_seomatic_addResturantMenu','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','61ab347a-f412-465d-bb26-7a737cc36960'),
	(55,12,'m160206_000000_seomatic_addGoogleAnalyticsPlugins','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','bd3764ab-3a48-450e-a962-2e34b9bd1536'),
	(56,12,'m160206_000000_seomatic_addGoogleAnalyticsSendPageView','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','aa75c945-f817-4ea7-82b2-96938d3bc096'),
	(57,12,'m160209_000000_seomatic_alterDescriptionsColumns','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','6c6259a9-e2a3-4739-bbd4-d78af1d977d8'),
	(58,12,'m160209_000001_seomatic_addRobotsTxt','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','1e02082b-fc8a-498c-8302-82123d370fcc'),
	(59,12,'m160227_000000_seomatic_addFacebookAppId','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','9c8c0eab-b647-4240-99c7-be71a1eae2ed'),
	(60,12,'m160416_000000_seomatic_addContactPoints','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','32a00fbd-2954-46d5-a16b-40c6d15c4b7e'),
	(61,12,'m160509_000000_seomatic_addSiteLinksBing','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','a61e8b4b-196d-4ddd-97cc-b18d4db31e9c'),
	(62,12,'m160707_000000_seomatic_addGoogleTagManager','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','e335e873-8c05-4bb3-b7a3-4aa115a9aceb'),
	(63,12,'m160715_000000_seomatic_addSeoImageTransforms','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','0f3c67fb-2faf-49d9-adbd-b7a3a81cb5a7'),
	(64,12,'m160723_000000_seomatic_addSeoMainEntityOfPage','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','be4201f6-457f-4a7c-becb-ddaed38eda2a'),
	(65,12,'m160724_000000_seomatic_addSeoMainEntityCategory','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','7ecf241f-01d6-4d1a-a599-dbe86834994b'),
	(66,12,'m160811_000000_seomatic_addVimeo','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','5a8d8f58-d777-48df-a944-557004d51735'),
	(67,12,'m160904_000000_seomatic_addTwitterFacebookImages','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','54bd54a7-7390-497c-9584-c21020f1ebb1'),
	(68,12,'m161220_000000_seomatic_addPriceRange','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','73cded4b-2617-4c06-bdea-ee407d29cf00'),
	(69,12,'m170212_000000_seomatic_addGoogleAnalyticsAnonymizeIp','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','269348bf-3426-49be-911f-8f14cd491b00'),
	(70,12,'m170212_000000_seomatic_addWikipedia','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','89c6faca-1d72-4e6f-b5f9-37bdfca82ad8');

/*!40000 ALTER TABLE `craft_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_neoblocks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_neoblocks`;

CREATE TABLE `craft_neoblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `collapsed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ownerLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_neoblocks_ownerId_idx` (`ownerId`),
  KEY `craft_neoblocks_fieldId_idx` (`fieldId`),
  KEY `craft_neoblocks_typeId_idx` (`typeId`),
  KEY `craft_neoblocks_collapsed_idx` (`collapsed`),
  KEY `craft_neoblocks_ownerLocale_fk` (`ownerLocale`),
  CONSTRAINT `craft_neoblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_neoblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_neoblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_neoblocks_ownerLocale_fk` FOREIGN KEY (`ownerLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_neoblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_neoblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_neoblockstructures
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_neoblockstructures`;

CREATE TABLE `craft_neoblockstructures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `ownerLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_neoblockstructures_structureId_idx` (`structureId`),
  KEY `craft_neoblockstructures_ownerId_idx` (`ownerId`),
  KEY `craft_neoblockstructures_fieldId_idx` (`fieldId`),
  KEY `craft_neoblockstructures_ownerLocale_fk` (`ownerLocale`),
  CONSTRAINT `craft_neoblockstructures_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_neoblockstructures_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_neoblockstructures_ownerLocale_fk` FOREIGN KEY (`ownerLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_neoblockstructures_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_neoblocktypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_neoblocktypes`;

CREATE TABLE `craft_neoblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `maxBlocks` int(10) DEFAULT '0',
  `maxChildBlocks` int(10) DEFAULT '0',
  `childBlocks` text COLLATE utf8_unicode_ci,
  `topLevel` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_neoblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  UNIQUE KEY `craft_neoblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  KEY `craft_neoblocktypes_fieldId_fk` (`fieldId`),
  KEY `craft_neoblocktypes_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_neoblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_neoblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_neoblocktypes` WRITE;
/*!40000 ALTER TABLE `craft_neoblocktypes` DISABLE KEYS */;

INSERT INTO `craft_neoblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `maxBlocks`, `maxChildBlocks`, `childBlocks`, `topLevel`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,100,30,'Content Section','contentSection',NULL,NULL,'',1,2,'2017-04-16 22:49:03','2017-04-16 22:49:03','78239f04-f35e-4486-96c0-22ce83005e52'),
	(2,100,31,'Accordion','accordion',NULL,NULL,'[\"accordionContent\"]',1,3,'2017-04-16 22:49:03','2017-04-16 22:49:03','24a92ae0-ef4c-47ff-a4bf-ae9c7b51a842'),
	(3,100,32,'Accordion Content','accordionContent',NULL,NULL,'[\"twoColumns\",\"headline\",\"richText\",\"richTextMarginals\",\"quote\",\"imageGallery\",\"imageGrid\",\"imageSingle\",\"button\",\"buttonGroup\",\"definitionList\",\"embed\",\"separator\"]',0,4,'2017-04-16 22:49:03','2017-04-16 22:49:03','a1f6f60c-322b-4f9f-be18-92641e5fc621'),
	(4,100,33,'Two Columns','twoColumns',NULL,2,'[\"column\"]',1,5,'2017-04-16 22:49:03','2017-04-16 22:49:03','923a02f6-5448-4c01-9658-a53002677da6'),
	(5,100,34,'Column','column',NULL,NULL,'[\"accordion\",\"headline\",\"richText\",\"quote\",\"imageGallery\",\"imageGrid\",\"imageSingle\",\"button\",\"buttonGroup\",\"definitionList\",\"embed\",\"separator\"]',0,6,'2017-04-16 22:49:03','2017-04-16 22:49:03','aa8ae593-add3-41fc-acf3-99656f120965'),
	(6,100,35,'Headline','headline',NULL,NULL,'',1,8,'2017-04-16 22:49:03','2017-04-16 22:49:03','17fd7dce-492b-46c0-9e31-1349ede5974d'),
	(7,100,36,'Rich Text','richText',NULL,2,'',1,9,'2017-04-16 22:49:03','2017-04-16 22:49:03','7ac911e0-9050-4a42-9973-4fd2254979d7'),
	(8,100,37,'Rich Text Marginals','richTextMarginals',NULL,2,'[\"marginalColumn\"]',1,10,'2017-04-16 22:49:03','2017-04-16 22:49:03','6766b9e5-47e3-419e-9b4f-747380865009'),
	(9,100,38,'Marginal Column','marginalColumn',NULL,1,'[\"quote\",\"imageSingle\"]',0,11,'2017-04-16 22:49:03','2017-04-16 22:49:03','3474dff3-8e0f-40cb-bd85-0959acab99b8'),
	(10,100,39,'Quote','quote',NULL,NULL,'',1,12,'2017-04-16 22:49:03','2017-04-16 22:49:03','0f31b23d-9cf9-4af2-9177-da772cb61534'),
	(11,100,40,'Image Cover','imageCover',NULL,NULL,'',1,14,'2017-04-16 22:49:03','2017-04-16 22:49:03','eff1c786-4c77-49ca-b177-873fbd713465'),
	(12,100,41,'Image Gallery','imageGallery',NULL,NULL,'',1,15,'2017-04-16 22:49:03','2017-04-16 22:49:03','1052add9-8383-4344-9c8e-b17abd59adeb'),
	(13,100,42,'Image Grid','imageGrid',NULL,NULL,'',1,16,'2017-04-16 22:49:03','2017-04-16 22:49:03','e9cda3a8-9c3b-45e8-888f-98fa13cb219d'),
	(14,100,43,'Image Single','imageSingle',NULL,NULL,'',1,17,'2017-04-16 22:49:03','2017-04-16 22:49:03','875dae98-1d96-4528-a3d2-d5a72b4664d2'),
	(15,100,44,'Image Slider','imageSlider',NULL,NULL,'',1,18,'2017-04-16 22:49:03','2017-04-16 22:49:03','996e77e7-6822-4714-af11-eede05096719'),
	(16,100,45,'Button','button',NULL,NULL,'',1,20,'2017-04-16 22:49:03','2017-04-16 22:49:03','5fb03a9b-975c-4e05-adcf-ccfeeebeafec'),
	(17,100,46,'Button Group','buttonGroup',NULL,5,'',1,21,'2017-04-16 22:49:03','2017-04-16 22:49:03','208ab3ca-885d-44a5-aa88-7b31cb15ba25'),
	(18,100,47,'Definition List','definitionList',NULL,NULL,'',1,23,'2017-04-16 22:49:03','2017-04-16 22:49:03','a7c26f72-f741-4679-95bf-26e52968fee4'),
	(19,100,48,'Embed','embed',NULL,NULL,'',1,24,'2017-04-16 22:49:03','2017-04-16 22:49:03','bfdd8ca2-35d6-4716-8f16-120127bb8dbc'),
	(20,100,49,'Separator','separator',NULL,NULL,'',1,25,'2017-04-16 22:49:03','2017-04-16 22:49:03','c1b095f7-15f7-48b1-9cad-8cdf7a67c07e');

/*!40000 ALTER TABLE `craft_neoblocktypes` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_neogroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_neogroups`;

CREATE TABLE `craft_neogroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_neogroups_fieldId_fk` (`fieldId`),
  CONSTRAINT `craft_neogroups_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_neogroups` WRITE;
/*!40000 ALTER TABLE `craft_neogroups` DISABLE KEYS */;

INSERT INTO `craft_neogroups` (`id`, `fieldId`, `name`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,100,'Content Wrapper',1,'2017-04-16 22:49:03','2017-04-16 22:49:03','653a1775-03e0-4b93-8662-bd31e8d88093'),
	(2,100,'Text Modules',7,'2017-04-16 22:49:03','2017-04-16 22:49:03','9961c544-d772-4612-8f71-1379a099669c'),
	(3,100,'Image Modules',13,'2017-04-16 22:49:03','2017-04-16 22:49:03','89b989f1-7758-41a0-8a04-7de578a9ca4d'),
	(4,100,'Button Modules',19,'2017-04-16 22:49:03','2017-04-16 22:49:03','3907646a-945d-415b-bfee-a500f1d7a34c'),
	(5,100,'More Modules…',22,'2017-04-16 22:49:03','2017-04-16 22:49:03','7d0750fd-f945-42e4-b81f-35be1f7a9d32');

/*!40000 ALTER TABLE `craft_neogroups` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_plugins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_plugins`;

CREATE TABLE `craft_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `licenseKey` char(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `settings` text COLLATE utf8_unicode_ci,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_plugins` WRITE;
/*!40000 ALTER TABLE `craft_plugins` DISABLE KEYS */;

INSERT INTO `craft_plugins` (`id`, `class`, `version`, `schemaVersion`, `licenseKey`, `licenseKeyStatus`, `enabled`, `settings`, `installDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'CpCss','1.1.1','1.1.0',NULL,'unknown',1,NULL,'2017-04-16 22:11:42','2017-04-16 22:11:42','2017-04-16 22:11:42','14fc1ae7-d768-4028-bd92-4498515ce6d3'),
	(2,'Cookies','1.0.4','1.0.0',NULL,'unknown',1,NULL,'2017-04-16 22:11:44','2017-04-16 22:11:44','2017-04-16 22:11:44','ef47ceba-51a6-4565-90bd-bfc199022e6c'),
	(3,'FocalPointField','1.0.2',NULL,NULL,'unknown',1,NULL,'2017-04-16 22:11:48','2017-04-16 22:11:48','2017-04-16 22:11:48','4e64b877-25c4-4f86-91ff-a5e3109b4e2f'),
	(4,'Imager','1.5.0','1.0.0',NULL,'unknown',1,NULL,'2017-04-16 22:11:50','2017-04-16 22:11:50','2017-04-16 22:11:50','0cff012d-6717-4a58-aa39-51268d2dbe80'),
	(5,'Kint','1.1.0','1.0.0',NULL,'unknown',1,NULL,'2017-04-16 22:11:55','2017-04-16 22:11:55','2017-04-16 22:11:55','f101513d-d2bd-4990-a866-6ad089964b4a'),
	(6,'FruitLinkIt','2.3.4','2.3.0',NULL,'unknown',1,NULL,'2017-04-16 22:11:59','2017-04-16 22:11:59','2017-04-16 22:11:59','47ace0df-f9d6-49c2-9647-788d50e2e275'),
	(7,'Minify','1.1.1','1.0.0',NULL,'unknown',1,NULL,'2017-04-16 22:42:23','2017-04-16 22:42:23','2017-04-16 22:42:23','16bd2799-b641-4981-a41c-0e3392a48d5a'),
	(8,'Neo','1.4.1','1.4.1',NULL,'unknown',1,NULL,'2017-04-16 22:42:26','2017-04-16 22:42:26','2017-04-16 22:42:26','70d7e5dd-2268-40a4-85f3-a7ab5dcf34cc'),
	(9,'SidebarEnhancer','1.0.6','1.0.0',NULL,'unknown',1,NULL,'2017-04-16 22:42:33','2017-04-16 22:42:33','2017-04-16 22:42:33','217a761d-a45d-4d67-8ee2-7cbd11ac91c4'),
	(10,'SuperTable','1.0.3','1.0.0',NULL,'unknown',1,NULL,'2017-04-16 22:42:40','2017-04-16 22:42:40','2017-04-16 22:42:40','196c672e-f9cb-444f-b32c-f399bca73a78'),
	(11,'TheArchitect','1.6.0','1.6.0',NULL,'unknown',1,NULL,'2017-04-16 22:42:43','2017-04-16 22:42:43','2017-04-16 22:42:43','fb4f3140-f2f7-4c99-9257-087a3f99f655'),
	(12,'Seomatic','1.1.43','1.1.25',NULL,'unknown',1,NULL,'2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','7dcd03d0-54c8-47ed-b618-e93935503345');

/*!40000 ALTER TABLE `craft_plugins` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_rackspaceaccess
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_rackspaceaccess`;

CREATE TABLE `craft_rackspaceaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `connectionKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `storageUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cdnUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_rackspaceaccess_connectionKey_unq_idx` (`connectionKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_relations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_relations`;

CREATE TABLE `craft_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_relations_fieldId_sourceId_sourceLocale_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceLocale`,`targetId`),
  KEY `craft_relations_sourceId_fk` (`sourceId`),
  KEY `craft_relations_sourceLocale_fk` (`sourceLocale`),
  KEY `craft_relations_targetId_fk` (`targetId`),
  CONSTRAINT `craft_relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_relations_sourceLocale_fk` FOREIGN KEY (`sourceLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_routes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_routes`;

CREATE TABLE `craft_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `urlParts` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `urlPattern` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_routes_urlPattern_unq_idx` (`urlPattern`),
  KEY `craft_routes_locale_idx` (`locale`),
  CONSTRAINT `craft_routes_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_searchindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_searchindex`;

CREATE TABLE `craft_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`locale`),
  FULLTEXT KEY `craft_searchindex_keywords_idx` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_searchindex` WRITE;
/*!40000 ALTER TABLE `craft_searchindex` DISABLE KEYS */;

INSERT INTO `craft_searchindex` (`elementId`, `attribute`, `fieldId`, `locale`, `keywords`)
VALUES
	(1,'username',0,'de',' superuser '),
	(1,'firstname',0,'de',''),
	(1,'lastname',0,'de',''),
	(1,'fullname',0,'de',''),
	(1,'email',0,'de',' davidhellmann com gmail com '),
	(1,'slug',0,'de',''),
	(6,'field',12,'de',''),
	(6,'slug',0,'de',''),
	(5,'title',0,'de',' modules '),
	(5,'slug',0,'de',' modules '),
	(4,'slug',0,'de',' homepage '),
	(4,'title',0,'de',' homepage ');

/*!40000 ALTER TABLE `craft_searchindex` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_sections`;

CREATE TABLE `craft_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `hasUrls` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enableVersioning` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_sections_name_unq_idx` (`name`),
  UNIQUE KEY `craft_sections_handle_unq_idx` (`handle`),
  KEY `craft_sections_structureId_fk` (`structureId`),
  CONSTRAINT `craft_sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_sections` WRITE;
/*!40000 ALTER TABLE `craft_sections` DISABLE KEYS */;

INSERT INTO `craft_sections` (`id`, `structureId`, `name`, `handle`, `type`, `hasUrls`, `template`, `enableVersioning`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(3,NULL,'Homepage','homepage','single',1,'index',0,'2017-04-16 22:48:52','2017-04-16 22:48:52','18ce4035-f866-4843-8748-e27173a3a8f8'),
	(4,NULL,'Modules','modules','single',1,'modules',0,'2017-04-16 22:48:52','2017-04-16 22:48:52','0fe1fe7e-9e1d-432b-9401-fa46118d05f4'),
	(5,NULL,'News','news','channel',1,'channels/news/_entry',1,'2017-04-16 22:48:52','2017-04-16 22:56:28','222d6ea4-e3a8-4270-8dae-597e1c1f38d4'),
	(6,2,'Pages','pages','structure',1,'structures/pages/_entry',1,'2017-04-16 22:56:24','2017-04-16 22:56:24','ad6b7331-f1d3-44a9-b70f-24214262a47b');

/*!40000 ALTER TABLE `craft_sections` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_sections_i18n
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_sections_i18n`;

CREATE TABLE `craft_sections_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `enabledByDefault` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `urlFormat` text COLLATE utf8_unicode_ci,
  `nestedUrlFormat` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_sections_i18n_sectionId_locale_unq_idx` (`sectionId`,`locale`),
  KEY `craft_sections_i18n_locale_fk` (`locale`),
  CONSTRAINT `craft_sections_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_sections_i18n_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_sections_i18n` WRITE;
/*!40000 ALTER TABLE `craft_sections_i18n` DISABLE KEYS */;

INSERT INTO `craft_sections_i18n` (`id`, `sectionId`, `locale`, `enabledByDefault`, `urlFormat`, `nestedUrlFormat`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(3,3,'de',1,'__home__',NULL,'2017-04-16 22:48:52','2017-04-16 22:48:52','8ac9640e-87a2-45f7-b83b-049ba0bf403d'),
	(4,4,'de',1,'modules',NULL,'2017-04-16 22:48:52','2017-04-16 22:48:52','0405acd3-102d-46ef-b580-bd0a9d068f4d'),
	(5,5,'de',0,'n/{slug}',NULL,'2017-04-16 22:48:52','2017-04-16 22:53:42','746a5783-5275-4025-9255-047aeab14ceb'),
	(6,6,'de',0,'p/{slug}','{parent.uri}/{slug}','2017-04-16 22:56:24','2017-04-16 22:56:24','9ac9729b-5fda-42ca-9777-90aa49b58024');

/*!40000 ALTER TABLE `craft_sections_i18n` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_seomatic_meta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_seomatic_meta`;

CREATE TABLE `craft_seomatic_meta` (
  `id` int(11) NOT NULL,
  `seoImageId` int(11) DEFAULT NULL,
  `seoTwitterImageId` int(11) DEFAULT NULL,
  `seoFacebookImageId` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'de',
  `elementId` int(10) DEFAULT '0',
  `metaType` enum('default','template') COLLATE utf8_unicode_ci DEFAULT 'template',
  `metaPath` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `seoMainEntityCategory` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `seoMainEntityOfPage` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `seoTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `seoDescription` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `seoKeywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `seoImageTransform` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `seoFacebookImageTransform` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `seoTwitterImageTransform` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `twitterCardType` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'summary',
  `openGraphType` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'website',
  `robots` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_seomatic_meta_seoImageId_fk` (`seoImageId`),
  KEY `craft_seomatic_meta_seoTwitterImageId_fk` (`seoTwitterImageId`),
  KEY `craft_seomatic_meta_seoFacebookImageId_fk` (`seoFacebookImageId`),
  CONSTRAINT `craft_seomatic_meta_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_seomatic_meta_seoFacebookImageId_fk` FOREIGN KEY (`seoFacebookImageId`) REFERENCES `craft_assetfiles` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_seomatic_meta_seoImageId_fk` FOREIGN KEY (`seoImageId`) REFERENCES `craft_assetfiles` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_seomatic_meta_seoTwitterImageId_fk` FOREIGN KEY (`seoTwitterImageId`) REFERENCES `craft_assetfiles` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_seomatic_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_seomatic_settings`;

CREATE TABLE `craft_seomatic_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteSeoImageId` int(11) DEFAULT NULL,
  `siteSeoTwitterImageId` int(11) DEFAULT NULL,
  `siteSeoFacebookImageId` int(11) DEFAULT NULL,
  `genericOwnerImageId` int(11) DEFAULT NULL,
  `genericCreatorImageId` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `siteSeoName` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `siteSeoTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `siteSeoTitleSeparator` varchar(10) COLLATE utf8_unicode_ci DEFAULT '|',
  `siteSeoTitlePlacement` enum('before','after','none') COLLATE utf8_unicode_ci DEFAULT 'after',
  `siteSeoDescription` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `siteSeoKeywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `siteSeoImageTransform` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `siteSeoFacebookImageTransform` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `siteSeoTwitterImageTransform` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `siteTwitterCardType` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `siteOpenGraphType` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `siteRobots` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `siteRobotsTxt` text COLLATE utf8_unicode_ci,
  `siteLinksSearchTargets` text COLLATE utf8_unicode_ci,
  `siteLinksQueryInput` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `googleSiteVerification` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `bingSiteVerification` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `googleAnalyticsUID` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `googleTagManagerID` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `googleAnalyticsSendPageview` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `googleAnalyticsAdvertising` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `googleAnalyticsEcommerce` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `googleAnalyticsEEcommerce` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `googleAnalyticsLinkAttribution` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `googleAnalyticsLinker` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `googleAnalyticsAnonymizeIp` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteOwnerType` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `siteOwnerSubType` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `siteOwnerSpecificType` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerName` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerAlternateName` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerDescription` varchar(1024) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerTelephone` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerStreetAddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerAddressLocality` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerAddressRegion` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerPostalCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerAddressCountry` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerGeoLatitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerGeoLongitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationOwnerDuns` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationOwnerFounder` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationOwnerFoundingDate` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationOwnerFoundingLocation` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationOwnerContactPoints` text COLLATE utf8_unicode_ci,
  `localBusinessPriceRange` varchar(10) COLLATE utf8_unicode_ci DEFAULT '$$$',
  `localBusinessOwnerOpeningHours` text COLLATE utf8_unicode_ci,
  `corporationOwnerTickerSymbol` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `restaurantOwnerServesCuisine` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `restaurantOwnerMenuUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `restaurantOwnerReservationsUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `personOwnerGender` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `personOwnerBirthPlace` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `twitterHandle` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `facebookHandle` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `facebookProfileId` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `facebookAppId` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `linkedInHandle` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `googlePlusHandle` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `youtubeHandle` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `youtubeChannelHandle` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `instagramHandle` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `pinterestHandle` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `githubHandle` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `vimeoHandle` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `wikipediaUrl` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `siteCreatorType` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `siteCreatorSubType` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `siteCreatorSpecificType` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorName` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorAlternateName` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorDescription` varchar(1024) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorTelephone` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorStreetAddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorAddressLocality` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorAddressRegion` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorPostalCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorAddressCountry` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorGeoLatitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorGeoLongitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationCreatorDuns` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationCreatorFounder` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationCreatorFoundingDate` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationCreatorFoundingLocation` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationCreatorContactPoints` text COLLATE utf8_unicode_ci,
  `localBusinessCreatorOpeningHours` text COLLATE utf8_unicode_ci,
  `corporationCreatorTickerSymbol` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `restaurantCreatorServesCuisine` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `restaurantCreatorMenuUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `restaurantCreatorReservationsUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `personCreatorGender` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `personCreatorBirthPlace` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorHumansTxt` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_seomatic_settings_siteSeoImageId_fk` (`siteSeoImageId`),
  KEY `craft_seomatic_settings_siteSeoTwitterImageId_fk` (`siteSeoTwitterImageId`),
  KEY `craft_seomatic_settings_siteSeoFacebookImageId_fk` (`siteSeoFacebookImageId`),
  KEY `craft_seomatic_settings_genericOwnerImageId_fk` (`genericOwnerImageId`),
  KEY `craft_seomatic_settings_genericCreatorImageId_fk` (`genericCreatorImageId`),
  CONSTRAINT `craft_seomatic_settings_genericCreatorImageId_fk` FOREIGN KEY (`genericCreatorImageId`) REFERENCES `craft_assetfiles` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_seomatic_settings_genericOwnerImageId_fk` FOREIGN KEY (`genericOwnerImageId`) REFERENCES `craft_assetfiles` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_seomatic_settings_siteSeoFacebookImageId_fk` FOREIGN KEY (`siteSeoFacebookImageId`) REFERENCES `craft_assetfiles` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_seomatic_settings_siteSeoImageId_fk` FOREIGN KEY (`siteSeoImageId`) REFERENCES `craft_assetfiles` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_seomatic_settings_siteSeoTwitterImageId_fk` FOREIGN KEY (`siteSeoTwitterImageId`) REFERENCES `craft_assetfiles` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_sessions`;

CREATE TABLE `craft_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_sessions_uid_idx` (`uid`),
  KEY `craft_sessions_token_idx` (`token`),
  KEY `craft_sessions_dateUpdated_idx` (`dateUpdated`),
  KEY `craft_sessions_userId_fk` (`userId`),
  CONSTRAINT `craft_sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_sessions` WRITE;
/*!40000 ALTER TABLE `craft_sessions` DISABLE KEYS */;

INSERT INTO `craft_sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(2,1,'ae98f9b273b3bdaf2aa81e4beba8347f376a4f37czozMjoienFYdkJrfkpkdTZiWEtIVVdYRnpVM3Qzdzl0RDFSTkQiOw==','2017-04-16 22:06:52','2017-04-16 22:06:52','19036233-290c-41cc-b605-c1fdf1a3761f');

/*!40000 ALTER TABLE `craft_sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_shunnedmessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_shunnedmessages`;

CREATE TABLE `craft_shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_shunnedmessages_userId_message_unq_idx` (`userId`,`message`),
  CONSTRAINT `craft_shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_structureelements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_structureelements`;

CREATE TABLE `craft_structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  KEY `craft_structureelements_root_idx` (`root`),
  KEY `craft_structureelements_lft_idx` (`lft`),
  KEY `craft_structureelements_rgt_idx` (`rgt`),
  KEY `craft_structureelements_level_idx` (`level`),
  KEY `craft_structureelements_elementId_fk` (`elementId`),
  CONSTRAINT `craft_structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_structures
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_structures`;

CREATE TABLE `craft_structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_structures` WRITE;
/*!40000 ALTER TABLE `craft_structures` DISABLE KEYS */;

INSERT INTO `craft_structures` (`id`, `maxLevels`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,'2017-04-16 22:50:30','2017-04-16 22:50:30','1a4b9299-b069-4a7b-8c00-29504646e00f'),
	(2,NULL,'2017-04-16 22:56:24','2017-04-16 22:56:24','b851dd62-a4ec-48ae-af65-c381d767cd41');

/*!40000 ALTER TABLE `craft_structures` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertableblocks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertableblocks`;

CREATE TABLE `craft_supertableblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `ownerLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_supertableblocks_ownerId_idx` (`ownerId`),
  KEY `craft_supertableblocks_fieldId_idx` (`fieldId`),
  KEY `craft_supertableblocks_typeId_idx` (`typeId`),
  KEY `craft_supertableblocks_sortOrder_idx` (`sortOrder`),
  KEY `craft_supertableblocks_ownerLocale_fk` (`ownerLocale`),
  CONSTRAINT `craft_supertableblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertableblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertableblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertableblocks_ownerLocale_fk` FOREIGN KEY (`ownerLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_supertableblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_supertableblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertableblocktypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertableblocktypes`;

CREATE TABLE `craft_supertableblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_supertableblocktypes_fieldId_fk` (`fieldId`),
  KEY `craft_supertableblocktypes_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_supertableblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertableblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertableblocktypes` WRITE;
/*!40000 ALTER TABLE `craft_supertableblocktypes` DISABLE KEYS */;

INSERT INTO `craft_supertableblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,4,13,'2017-04-16 22:48:52','2017-04-16 22:48:52','60bdee99-32b1-4e4b-850a-6708d326c322'),
	(2,12,14,'2017-04-16 22:48:52','2017-04-16 22:48:53','bf03f528-fcb9-409f-8810-558a6cb5c950'),
	(3,26,15,'2017-04-16 22:48:53','2017-04-16 22:48:54','98ceb5ec-625b-4040-b42a-64ca1806af25'),
	(4,32,16,'2017-04-16 22:48:54','2017-04-16 22:48:55','3dd66ead-99ef-432f-84f7-d0e15ef8b4a6'),
	(5,37,17,'2017-04-16 22:48:55','2017-04-16 22:48:55','6709c019-9bb8-4c24-a0f5-2ae0f5390eee'),
	(6,40,18,'2017-04-16 22:48:55','2017-04-16 22:48:55','cd2d37bf-dcf2-41b4-b0af-63c411272c09'),
	(7,43,19,'2017-04-16 22:48:56','2017-04-16 22:48:56','6ea0042c-9175-409d-8e9e-5653aac81b3d'),
	(8,48,20,'2017-04-16 22:48:56','2017-04-16 22:48:57','d24e51f5-0e6e-452d-b8cd-08f1de33fb44'),
	(9,52,21,'2017-04-16 22:48:57','2017-04-16 22:48:57','1af0637f-91eb-490a-b106-970749c29d88'),
	(10,56,22,'2017-04-16 22:48:57','2017-04-16 22:48:58','c2c345f5-b507-4b2f-b880-0d00c2d2528c'),
	(11,60,23,'2017-04-16 22:48:58','2017-04-16 22:48:58','29078bf3-96e3-48fb-af00-9bb3fe011899'),
	(12,64,24,'2017-04-16 22:48:58','2017-04-16 22:48:59','9ff59a2c-435b-49f6-b637-88b187d27e61'),
	(13,69,25,'2017-04-16 22:48:59','2017-04-16 22:48:59','e5bb65e6-af3c-4894-86b3-0a3255563865'),
	(14,73,26,'2017-04-16 22:49:00','2017-04-16 22:49:00','c2262ae1-52ac-47b8-a956-55ba97b2d301'),
	(15,77,27,'2017-04-16 22:49:00','2017-04-16 22:49:00','4e35ee79-fc78-4e89-b876-0f4ead3020ce'),
	(16,81,28,'2017-04-16 22:49:01','2017-04-16 22:49:01','3c7280e4-a978-4ff4-9bb4-d538384284ed'),
	(17,85,29,'2017-04-16 22:49:01','2017-04-16 22:49:01','90a4cf47-bc1f-453a-b62b-5b2bd78817df');

/*!40000 ALTER TABLE `craft_supertableblocktypes` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_globalcontact
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_globalcontact`;

CREATE TABLE `craft_supertablecontent_globalcontact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_company` text COLLATE utf8_unicode_ci,
  `field_street` text COLLATE utf8_unicode_ci,
  `field_postalCode` text COLLATE utf8_unicode_ci,
  `field_location` text COLLATE utf8_unicode_ci,
  `field_mail` text COLLATE utf8_unicode_ci,
  `field_phone` text COLLATE utf8_unicode_ci,
  `field_mobilePhone` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_globalcontact_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_globalcontact_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_globalcontact_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_globalcontact_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_globalsocialnetworks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_globalsocialnetworks`;

CREATE TABLE `craft_supertablecontent_globalsocialnetworks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_behanceUsername` text COLLATE utf8_unicode_ci,
  `field_dribbbleUsername` text COLLATE utf8_unicode_ci,
  `field_facebookUsername` text COLLATE utf8_unicode_ci,
  `field_githubUsername` text COLLATE utf8_unicode_ci,
  `field_googleUsername` text COLLATE utf8_unicode_ci,
  `field_instagramUsername` text COLLATE utf8_unicode_ci,
  `field_linkedinUsername` text COLLATE utf8_unicode_ci,
  `field_mediumUsername` text COLLATE utf8_unicode_ci,
  `field_pinterestUsername` text COLLATE utf8_unicode_ci,
  `field_tumblrUsername` text COLLATE utf8_unicode_ci,
  `field_twitterUsername` text COLLATE utf8_unicode_ci,
  `field_vscoUsername` text COLLATE utf8_unicode_ci,
  `field_xingUsername` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_globalsocialnetwor_elementI_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_globalsocialnetworks_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_globalsocialnetworks_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_globalsocialnetworks_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_groupedcaption
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_groupedcaption`;

CREATE TABLE `craft_supertablecontent_groupedcaption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_captionTitle` text COLLATE utf8_unicode_ci,
  `field_caption` text COLLATE utf8_unicode_ci,
  `field_source` text COLLATE utf8_unicode_ci,
  `field_sourceUrl` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_groupedcaption_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_groupedcaption_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_groupedcaption_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_groupedcaption_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_settingsbutton
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingsbutton`;

CREATE TABLE `craft_supertablecontent_settingsbutton` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'primary',
  `field_alignment` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'left',
  `field_withIcon` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'iconSample',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_settingsbutton_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingsbutton_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingsbutton_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingsbutton_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_settingsbuttongroup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingsbuttongroup`;

CREATE TABLE `craft_supertablecontent_settingsbuttongroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'primary',
  `field_alignment` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'left',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_settingsbuttongrou_elementI_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingsbuttongroup_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingsbuttongroup_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingsbuttongroup_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_settingsdefinitionlist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingsdefinitionlist`;

CREATE TABLE `craft_supertablecontent_settingsdefinitionlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_columnsRatio` varchar(255) COLLATE utf8_unicode_ci DEFAULT '50-50',
  `field_layout` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'table',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craf_supertableconte_settingsdefinitionli_elementI_local_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingsdefinitionlist_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingsdefinitionlist_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingsdefinitionlist_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_settingsembed
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingsembed`;

CREATE TABLE `craft_supertablecontent_settingsembed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_video` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_embedPosition` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'left',
  `field_embedWidth` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'full',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_settingsembed_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingsembed_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingsembed_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingsembed_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_settingsheadline
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingsheadline`;

CREATE TABLE `craft_supertablecontent_settingsheadline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_indented` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_semanticSize` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'h2',
  `field_visualSize` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_settingsheadline_elementId_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingsheadline_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingsheadline_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingsheadline_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_settingsimagecover
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingsimagecover`;

CREATE TABLE `craft_supertablecontent_settingsimagecover` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_backgroundPosition` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'focalpoint',
  `field_textVerticalPosition` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'bottom',
  `field_textAlignment` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'center',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_settingsimagecove_elementId_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingsimagecover_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingsimagecover_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingsimagecover_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_settingsimagegallery
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingsimagegallery`;

CREATE TABLE `craft_supertablecontent_settingsimagegallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_columns` varchar(255) COLLATE utf8_unicode_ci DEFAULT '6',
  `field_imagePosition` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'focalpoint',
  `field_imageThumbsRatio` varchar(255) COLLATE utf8_unicode_ci DEFAULT '1:1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_settingsimagegalle_elementI_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingsimagegallery_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingsimagegallery_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingsimagegallery_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_settingsimagegrid
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingsimagegrid`;

CREATE TABLE `craft_supertablecontent_settingsimagegrid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_caption` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_columns` varchar(255) COLLATE utf8_unicode_ci DEFAULT '2',
  `field_imageRatio` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_settingsimagegri_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingsimagegrid_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingsimagegrid_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingsimagegrid_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_settingsimagesingle
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingsimagesingle`;

CREATE TABLE `craft_supertablecontent_settingsimagesingle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_caption` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_imagePosition` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'center',
  `field_imageRatio` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_imageWidth` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'full',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_settingsimagesingl_elementI_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingsimagesingle_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingsimagesingle_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingsimagesingle_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_settingsimageslider
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingsimageslider`;

CREATE TABLE `craft_supertablecontent_settingsimageslider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_imageRatio` varchar(255) COLLATE utf8_unicode_ci DEFAULT '16:10',
  `field_navigation` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_pagination` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_settingsimageslide_elementI_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingsimageslider_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingsimageslider_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingsimageslider_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_settingssection
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingssection`;

CREATE TABLE `craft_supertablecontent_settingssection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_backgroundColor` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_fullWidth` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_paddingVertical` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'medium',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_settingssection_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingssection_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingssection_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingssection_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_settingsseparator
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingsseparator`;

CREATE TABLE `craft_supertablecontent_settingsseparator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_fullWidth` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_marginVertical` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'small',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_settingsseparato_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingsseparator_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingsseparator_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingsseparator_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_settingstwocolumns
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingstwocolumns`;

CREATE TABLE `craft_supertablecontent_settingstwocolumns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_columnsRatio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_settingstwocolumn_elementId_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingstwocolumns_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingstwocolumns_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingstwocolumns_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_singlebuttongroup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_singlebuttongroup`;

CREATE TABLE `craft_supertablecontent_singlebuttongroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_button` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_singlebuttongrou_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_singlebuttongroup_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_singlebuttongroup_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_singlebuttongroup_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_systemsettings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_systemsettings`;

CREATE TABLE `craft_systemsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_systemsettings_category_unq_idx` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_systemsettings` WRITE;
/*!40000 ALTER TABLE `craft_systemsettings` DISABLE KEYS */;

INSERT INTO `craft_systemsettings` (`id`, `category`, `settings`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'email','{\"protocol\":\"php\",\"emailAddress\":\"davidhellmann.com@gmail.com\",\"senderName\":\"CB Modules\"}','2017-04-16 21:53:45','2017-04-16 21:53:45','e533a2a9-277f-4f3f-8efa-0a8260e46c45');

/*!40000 ALTER TABLE `craft_systemsettings` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_taggroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_taggroups`;

CREATE TABLE `craft_taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_taggroups_name_unq_idx` (`name`),
  UNIQUE KEY `craft_taggroups_handle_unq_idx` (`handle`),
  KEY `craft_taggroups_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_tags`;

CREATE TABLE `craft_tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_tags_groupId_fk` (`groupId`),
  CONSTRAINT `craft_tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_tags_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_tasks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_tasks`;

CREATE TABLE `craft_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `currentStep` int(11) unsigned DEFAULT NULL,
  `totalSteps` int(11) unsigned DEFAULT NULL,
  `status` enum('pending','error','running') COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` mediumtext COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_tasks_root_idx` (`root`),
  KEY `craft_tasks_lft_idx` (`lft`),
  KEY `craft_tasks_rgt_idx` (`rgt`),
  KEY `craft_tasks_level_idx` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_templatecachecriteria
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_templatecachecriteria`;

CREATE TABLE `craft_templatecachecriteria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `criteria` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_templatecachecriteria_cacheId_fk` (`cacheId`),
  KEY `craft_templatecachecriteria_type_idx` (`type`),
  CONSTRAINT `craft_templatecachecriteria_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_templatecacheelements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_templatecacheelements`;

CREATE TABLE `craft_templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  KEY `craft_templatecacheelements_cacheId_fk` (`cacheId`),
  KEY `craft_templatecacheelements_elementId_fk` (`elementId`),
  CONSTRAINT `craft_templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_templatecaches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_templatecaches`;

CREATE TABLE `craft_templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_templatecaches_expiryDate_cacheKey_locale_path_idx` (`expiryDate`,`cacheKey`,`locale`,`path`),
  KEY `craft_templatecaches_locale_fk` (`locale`),
  CONSTRAINT `craft_templatecaches_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_tokens`;

CREATE TABLE `craft_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_tokens_token_unq_idx` (`token`),
  KEY `craft_tokens_expiryDate_idx` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_usergroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_usergroups`;

CREATE TABLE `craft_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_usergroups_name_unq_idx` (`name`),
  UNIQUE KEY `craft_usergroups_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_usergroups_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_usergroups_users`;

CREATE TABLE `craft_usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  KEY `craft_usergroups_users_userId_fk` (`userId`),
  CONSTRAINT `craft_usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_userpermissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_userpermissions`;

CREATE TABLE `craft_userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_userpermissions_usergroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_userpermissions_usergroups`;

CREATE TABLE `craft_userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  KEY `craft_userpermissions_usergroups_groupId_fk` (`groupId`),
  CONSTRAINT `craft_userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_userpermissions_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_userpermissions_users`;

CREATE TABLE `craft_userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  KEY `craft_userpermissions_users_userId_fk` (`userId`),
  CONSTRAINT `craft_userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_users`;

CREATE TABLE `craft_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preferredLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weekStartDay` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `client` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `suspended` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pending` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `archived` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIPAddress` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(4) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `verificationCode` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_users_username_unq_idx` (`username`),
  UNIQUE KEY `craft_users_email_unq_idx` (`email`),
  KEY `craft_users_verificationCode_idx` (`verificationCode`),
  KEY `craft_users_uid_idx` (`uid`),
  KEY `craft_users_preferredLocale_fk` (`preferredLocale`),
  CONSTRAINT `craft_users_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_users_preferredLocale_fk` FOREIGN KEY (`preferredLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_users` WRITE;
/*!40000 ALTER TABLE `craft_users` DISABLE KEYS */;

INSERT INTO `craft_users` (`id`, `username`, `photo`, `firstName`, `lastName`, `email`, `password`, `preferredLocale`, `weekStartDay`, `admin`, `client`, `locked`, `suspended`, `pending`, `archived`, `lastLoginDate`, `lastLoginAttemptIPAddress`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'superuser',NULL,NULL,NULL,'davidhellmann.com@gmail.com','$2y$13$XiQ7RMMV2PbU.93SnT4rv.AFs4ahr0H3kEH1D6iMq86GjfyoOUA86',NULL,0,1,0,0,0,0,0,'2017-04-16 22:06:52','::1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2017-04-16 21:53:42','2017-04-16 21:53:42','2017-04-16 22:06:52','df730679-fa87-4b60-991e-9e821fddf5f8');

/*!40000 ALTER TABLE `craft_users` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_widgets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_widgets`;

CREATE TABLE `craft_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(4) unsigned DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_widgets_userId_fk` (`userId`),
  CONSTRAINT `craft_widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_widgets` WRITE;
/*!40000 ALTER TABLE `craft_widgets` DISABLE KEYS */;

INSERT INTO `craft_widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'RecentEntries',1,NULL,NULL,1,'2017-04-16 21:53:48','2017-04-16 21:53:48','a0486e93-9906-4a43-8a41-87655110a763'),
	(2,1,'GetHelp',2,NULL,NULL,1,'2017-04-16 21:53:48','2017-04-16 21:53:48','47393184-ed49-4cac-b467-072bb668e2e5'),
	(3,1,'Updates',3,NULL,NULL,1,'2017-04-16 21:53:48','2017-04-16 21:53:48','698a2a43-9adc-46de-b45d-49f310a68567'),
	(4,1,'Feed',4,NULL,'{\"url\":\"https:\\/\\/craftcms.com\\/news.rss\",\"title\":\"Craft News\"}',1,'2017-04-16 21:53:48','2017-04-16 21:53:48','a8e4e8ba-f896-402a-a164-65f1774b6793');

/*!40000 ALTER TABLE `craft_widgets` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
