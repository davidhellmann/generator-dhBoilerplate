# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.6.34)
# Datenbank: db135103347_craftcms
# Erstellt am: 2017-02-21 21:34:31 +0000
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
	(1,NULL,1,'Site Images','','2017-02-21 21:30:09','2017-02-21 21:30:09','168699ff-17e6-4338-94fc-df8d19ed89ae'),
	(2,NULL,2,'Site Downloads','','2017-02-21 21:30:09','2017-02-21 21:30:09','25658b00-771c-4a02-8052-17e662619898'),
	(3,NULL,3,'Site Graphics','','2017-02-21 21:30:10','2017-02-21 21:30:10','11f06896-6f47-469a-bb83-15cc838d87f3'),
	(4,NULL,4,'Site Users','','2017-02-21 21:30:10','2017-02-21 21:30:10','af74c57f-6e9f-4a73-9875-66c476b4528f');

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
	(1,'Site Images','siteImages','Local','{\"path\":\"{uploadPath}\\/images\\/\",\"publicURLs\":1,\"url\":\"{uploadUrl}\\/images\\/\"}',1,50,'2017-02-21 21:30:09','2017-02-21 21:30:15','8f5c1fc4-180b-438e-b335-37472bde327a'),
	(2,'Site Downloads','siteDownloads','Local','{\"path\":\"{uploadPath}\\/downloads\\/\",\"publicURLs\":1,\"url\":\"{uploadUrl}\\/downloads\\/\"}',2,51,'2017-02-21 21:30:09','2017-02-21 21:30:15','0bc06021-f958-44a1-8342-9595c2c895a7'),
	(3,'Site Graphics','siteGraphics','Local','{\"path\":\"{uploadPath}\\/graphics\\/\",\"publicURLs\":1,\"url\":\"{uploadUrl}\\/graphics\\/\"}',3,52,'2017-02-21 21:30:10','2017-02-21 21:30:15','80109671-db49-4a18-b1dc-f958d2f07fa9'),
	(4,'Site Users','siteUsers','Local','{\"path\":\"{uploadPath}\\/users\\/\",\"publicURLs\":1,\"url\":\"{uploadUrl}\\/users\\/\"}',4,53,'2017-02-21 21:30:10','2017-02-21 21:30:15','10a4c117-6ddd-40bb-bcc7-7e843e67b42f');

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
	(1,1,57,'Default','default',1,'','2017-02-21 21:30:10','2017-02-21 21:30:15','7526dab8-dd2a-4861-9b5f-222bf55077e7');

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
	(1,1,'en','default/{slug}','{parent.uri}/{slug}','2017-02-21 21:30:10','2017-02-21 21:30:10','c646ba45-d1af-44c7-823c-6dbb0d60e528');

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
  `field_body` text COLLATE utf8_unicode_ci,
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

INSERT INTO `craft_content` (`id`, `elementId`, `locale`, `title`, `field_body`, `field_pluginSeomatic`, `field_settingsFocalPoint`, `field_singleAnchor`, `field_singleButton`, `field_singleCode`, `field_singleDefinitionList`, `field_singleEmbedCode`, `field_singleHeadline`, `field_singleLabel`, `field_singleQuote`, `field_singleRichText`, `field_singleSource`, `field_singleSourceUrl`, `field_singleSubline`, `field_singleText`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-21 21:25:03','2017-02-21 21:29:56','638b03c6-19f7-4d25-b885-d2ef13e849c0'),
	(4,4,'en','Homepage',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-21 21:30:09','2017-02-21 21:30:09','46e548bd-6492-40d1-9040-ae0f9bcee463'),
	(5,5,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-21 21:30:15','2017-02-21 21:30:15','2412953a-4876-49e1-a2c4-d0d6d763d920');

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

LOCK TABLES `craft_deprecationerrors` WRITE;
/*!40000 ALTER TABLE `craft_deprecationerrors` DISABLE KEYS */;

INSERT INTO `craft_deprecationerrors` (`id`, `key`, `fingerprint`, `lastOccurrence`, `file`, `line`, `class`, `method`, `template`, `templateLine`, `message`, `traces`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'getBuild()','Craft\\AppBehavior:149','2017-02-21 21:29:03','/Users/dh/___DEV/___Fredmansky/dev.fredmansky.craftcms/___dist/craft/app/etc/behaviors/AppBehavior.php',149,'Craft\\AppBehavior','getBuild',NULL,NULL,'craft()->getBuild() has been deprecated. As of Craft 2.6.2951, craft()->getVersion() returns the complete version number (X.Y.Z).','[{\"objectClass\":\"Craft\\\\DeprecatorService\",\"file\":\"\\/Users\\/dh\\/___DEV\\/___Fredmansky\\/dev.fredmansky.craftcms\\/___dist\\/craft\\/app\\/etc\\/behaviors\\/AppBehavior.php\",\"line\":149,\"class\":\"Craft\\\\DeprecatorService\",\"method\":\"log\",\"args\":\"\\\"getBuild()\\\", \\\"craft()->getBuild() has been deprecated. As of Craft 2.6.2951, c...\\\"\"},{\"objectClass\":\"Craft\\\\AppBehavior\",\"file\":\"\\/Users\\/dh\\/___DEV\\/___Fredmansky\\/dev.fredmansky.craftcms\\/___dist\\/craft\\/app\\/framework\\/base\\/CComponent.php\",\"line\":261,\"class\":\"Craft\\\\AppBehavior\",\"method\":\"getBuild\",\"args\":null},{\"objectClass\":\"Craft\\\\WebApp\",\"file\":\"\\/Users\\/dh\\/___DEV\\/___Fredmansky\\/dev.fredmansky.craftcms\\/___dist\\/plugins\\/supertable\\/SuperTablePlugin.php\",\"line\":53,\"class\":\"CComponent\",\"method\":\"__call\",\"args\":\"\\\"getBuild\\\", array()\"},{\"objectClass\":\"Craft\\\\SuperTablePlugin\",\"file\":\"\\/Users\\/dh\\/___DEV\\/___Fredmansky\\/dev.fredmansky.craftcms\\/___dist\\/craft\\/app\\/services\\/PluginsService.php\",\"line\":391,\"class\":\"Craft\\\\SuperTablePlugin\",\"method\":\"onBeforeInstall\",\"args\":null},{\"objectClass\":\"Craft\\\\PluginsService\",\"file\":\"\\/Users\\/dh\\/___DEV\\/___Fredmansky\\/dev.fredmansky.craftcms\\/___dist\\/craft\\/app\\/controllers\\/PluginsController.php\",\"line\":44,\"class\":\"Craft\\\\PluginsService\",\"method\":\"installPlugin\",\"args\":\"\\\"SuperTable\\\"\"},{\"objectClass\":\"Craft\\\\PluginsController\",\"file\":\"\\/Users\\/dh\\/___DEV\\/___Fredmansky\\/dev.fredmansky.craftcms\\/___dist\\/craft\\/app\\/framework\\/web\\/actions\\/CInlineAction.php\",\"line\":49,\"class\":\"Craft\\\\PluginsController\",\"method\":\"actionInstallPlugin\",\"args\":null},{\"objectClass\":\"CInlineAction\",\"file\":\"\\/Users\\/dh\\/___DEV\\/___Fredmansky\\/dev.fredmansky.craftcms\\/___dist\\/craft\\/app\\/framework\\/web\\/CController.php\",\"line\":308,\"class\":\"CInlineAction\",\"method\":\"runWithParams\",\"args\":\"array(\\\"p\\\" => \\\"admin\\/settings\\/plugins\\/\\\")\"},{\"objectClass\":\"Craft\\\\PluginsController\",\"file\":\"\\/Users\\/dh\\/___DEV\\/___Fredmansky\\/dev.fredmansky.craftcms\\/___dist\\/craft\\/app\\/framework\\/web\\/CController.php\",\"line\":286,\"class\":\"CController\",\"method\":\"runAction\",\"args\":\"CInlineAction\"},{\"objectClass\":\"Craft\\\\PluginsController\",\"file\":\"\\/Users\\/dh\\/___DEV\\/___Fredmansky\\/dev.fredmansky.craftcms\\/___dist\\/craft\\/app\\/framework\\/web\\/CController.php\",\"line\":265,\"class\":\"CController\",\"method\":\"runActionWithFilters\",\"args\":\"CInlineAction, array()\"},{\"objectClass\":\"Craft\\\\PluginsController\",\"file\":\"\\/Users\\/dh\\/___DEV\\/___Fredmansky\\/dev.fredmansky.craftcms\\/___dist\\/craft\\/app\\/framework\\/web\\/CWebApplication.php\",\"line\":282,\"class\":\"CController\",\"method\":\"run\",\"args\":\"\\\"installPlugin\\\"\"},{\"objectClass\":\"Craft\\\\WebApp\",\"file\":\"\\/Users\\/dh\\/___DEV\\/___Fredmansky\\/dev.fredmansky.craftcms\\/___dist\\/craft\\/app\\/etc\\/web\\/WebApp.php\",\"line\":817,\"class\":\"CWebApplication\",\"method\":\"runController\",\"args\":\"\\\"plugins\\/installPlugin\\\"\"},{\"objectClass\":\"Craft\\\\WebApp\",\"file\":\"\\/Users\\/dh\\/___DEV\\/___Fredmansky\\/dev.fredmansky.craftcms\\/___dist\\/craft\\/app\\/etc\\/web\\/WebApp.php\",\"line\":287,\"class\":\"Craft\\\\WebApp\",\"method\":\"_processActionRequest\",\"args\":null},{\"objectClass\":\"Craft\\\\WebApp\",\"file\":\"\\/Users\\/dh\\/___DEV\\/___Fredmansky\\/dev.fredmansky.craftcms\\/___dist\\/craft\\/app\\/framework\\/base\\/CApplication.php\",\"line\":185,\"class\":\"Craft\\\\WebApp\",\"method\":\"processRequest\",\"args\":null},{\"objectClass\":\"Craft\\\\WebApp\",\"file\":\"\\/Users\\/dh\\/___DEV\\/___Fredmansky\\/dev.fredmansky.craftcms\\/___dist\\/craft\\/app\\/index.php\",\"line\":62,\"class\":\"CApplication\",\"method\":\"run\",\"args\":null},{\"objectClass\":null,\"file\":\"\\/Users\\/dh\\/___DEV\\/___Fredmansky\\/dev.fredmansky.craftcms\\/___dist\\/public\\/index.php\",\"line\":31,\"class\":null,\"method\":\"require_once\",\"args\":\"\\\"\\/Users\\/dh\\/___DEV\\/___Fredmansky\\/dev.fredmansky.craftcms\\/___dist\\/c...\\\"\"}]','2017-02-21 21:29:03','2017-02-21 21:29:03','4411d5a8-c26d-4a3a-8e95-8483e82a35c4');

/*!40000 ALTER TABLE `craft_deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;


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
	(1,'User',1,0,'2017-02-21 21:25:03','2017-02-21 21:28:15','5cb69a2b-cdb4-4ad2-aaf1-9394b6da7077'),
	(4,'Entry',1,0,'2017-02-21 21:30:09','2017-02-21 21:30:09','d9906ce6-63ef-4a32-9f0b-cd005affd8e8'),
	(5,'GlobalSet',1,0,'2017-02-21 21:30:15','2017-02-21 21:30:15','381e2970-a21e-4c7b-9fd8-5d98371519a2');

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
	(1,1,'en','',NULL,1,'2017-02-21 21:25:03','2017-02-21 21:29:56','385f1859-1d5a-4bc5-9645-c2dda77b05c7'),
	(4,4,'en','homepage','__home__',1,'2017-02-21 21:30:09','2017-02-21 21:30:09','bdc66730-9a97-4004-bd2e-eb32846e7e83'),
	(5,5,'en','',NULL,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','92315c78-9040-40be-873c-4e5fbdd5b51b');

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
	(4,3,NULL,NULL,'2017-02-21 21:30:09',NULL,'2017-02-21 21:30:09','2017-02-21 21:30:09','c30ab2da-2c63-4f99-9f0e-00efff1b08a8');

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
	(3,3,54,'Homepage','homepage',1,'Title',NULL,1,'2017-02-21 21:30:09','2017-02-21 21:30:15','2497666d-2e95-404a-b9d5-ae996e45b7fe'),
	(4,4,55,'News','news',1,'Title',NULL,1,'2017-02-21 21:30:09','2017-02-21 21:30:15','d230dd7f-4f6e-47f8-a7f7-65d2024c58ab');

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
	(1,'Default','2017-02-21 21:25:05','2017-02-21 21:25:05','fb05458f-d0d6-40a3-8c34-b5f3d449366e'),
	(2,'Categories','2017-02-21 21:30:09','2017-02-21 21:30:09','f683dc2a-fc26-4c44-b2ba-88884263d796'),
	(3,'Content Builder','2017-02-21 21:30:09','2017-02-21 21:30:09','0d52a457-3dd1-4c7a-b90e-df4f12ba0b00'),
	(4,'Globals','2017-02-21 21:30:09','2017-02-21 21:30:09','182c9d62-a79b-4c8b-a5aa-de1b728c0d7b'),
	(5,'Grouped','2017-02-21 21:30:09','2017-02-21 21:30:09','021d655b-05ba-46bb-aa7a-dd85b5ae1d69'),
	(6,'Plugins','2017-02-21 21:30:09','2017-02-21 21:30:09','3c696a1f-7f8d-4038-9fc1-03233dcfa41b'),
	(7,'Settings','2017-02-21 21:30:09','2017-02-21 21:30:09','1294a69c-21ad-4eaa-abd3-e211d84dc2e5'),
	(8,'Singles','2017-02-21 21:30:09','2017-02-21 21:30:09','930f7518-ccfc-4194-9fee-b676a1504037');

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
	(4,13,3,5,0,1,'2017-02-21 21:30:10','2017-02-21 21:30:10','6ce3b100-4d63-443a-b951-39a135085687'),
	(5,13,3,6,0,2,'2017-02-21 21:30:10','2017-02-21 21:30:10','856ccdff-e531-438c-9fad-e22bd8363ba5'),
	(6,13,3,7,0,3,'2017-02-21 21:30:10','2017-02-21 21:30:10','b447a12c-f00e-45f7-af8b-ae6bcf64a764'),
	(7,13,3,8,0,4,'2017-02-21 21:30:10','2017-02-21 21:30:10','ece2c196-bbe3-4609-9727-3e16c7beb5a1'),
	(8,13,3,9,0,5,'2017-02-21 21:30:10','2017-02-21 21:30:10','78875c60-c238-47e5-b6cd-a49ab7472b9d'),
	(9,13,3,10,0,6,'2017-02-21 21:30:10','2017-02-21 21:30:10','7322eed5-cfe0-463f-8fd6-46d9b2a4f088'),
	(10,13,3,11,0,7,'2017-02-21 21:30:10','2017-02-21 21:30:10','90971474-6e01-4b19-bcad-54476d4defd4'),
	(11,13,3,12,0,8,'2017-02-21 21:30:10','2017-02-21 21:30:10','e1f8e8ec-f00b-40c3-8cd2-2ddb05176f8d'),
	(12,13,3,13,0,9,'2017-02-21 21:30:10','2017-02-21 21:30:10','e1063a95-7739-4754-8767-c0e52484fa43'),
	(13,13,3,14,0,10,'2017-02-21 21:30:10','2017-02-21 21:30:10','fe0ab66d-00d7-4887-af3c-6c4d2d6b35c5'),
	(14,13,3,15,0,11,'2017-02-21 21:30:10','2017-02-21 21:30:10','90336551-b28b-4a93-9528-b551100b0a2f'),
	(15,13,3,16,0,12,'2017-02-21 21:30:10','2017-02-21 21:30:10','13d5019f-3de0-4d67-be57-f888779657fa'),
	(16,13,3,17,0,13,'2017-02-21 21:30:10','2017-02-21 21:30:10','718cd9f1-0a45-4596-abbf-7e99ab561f1a'),
	(17,14,4,19,0,1,'2017-02-21 21:30:10','2017-02-21 21:30:10','b65acd79-e78e-46c8-a0ae-4b2f1d8fe617'),
	(18,14,4,20,0,2,'2017-02-21 21:30:10','2017-02-21 21:30:10','427b7890-2d46-4617-aac0-aeb4de784004'),
	(19,14,4,21,0,3,'2017-02-21 21:30:10','2017-02-21 21:30:10','71f1d08d-52d8-436d-9309-aef9924a9331'),
	(20,14,4,22,0,4,'2017-02-21 21:30:10','2017-02-21 21:30:10','7034e177-f246-4ef5-98f1-9dd185765863'),
	(21,15,5,25,0,1,'2017-02-21 21:30:11','2017-02-21 21:30:11','e64e92d8-4602-4574-a60e-559f663e1e57'),
	(22,15,5,26,0,2,'2017-02-21 21:30:11','2017-02-21 21:30:11','76393dd8-362d-4b33-9d9e-6e44f762be26'),
	(23,15,5,27,0,3,'2017-02-21 21:30:11','2017-02-21 21:30:11','6b927664-d3fa-448a-98ad-fb8dc4f2b56a'),
	(24,15,5,28,0,4,'2017-02-21 21:30:11','2017-02-21 21:30:11','9072d323-c12d-4d55-b939-04fd7b00c4a5'),
	(25,15,5,29,0,5,'2017-02-21 21:30:11','2017-02-21 21:30:11','fc8df44e-d5de-4c2c-a581-a23919e00065'),
	(26,15,5,30,0,6,'2017-02-21 21:30:11','2017-02-21 21:30:11','11049663-91a8-4f31-89c3-e3496ecf0999'),
	(27,16,6,32,0,1,'2017-02-21 21:30:11','2017-02-21 21:30:11','322665d1-d5ef-4289-b764-d88ade586890'),
	(28,16,6,33,0,2,'2017-02-21 21:30:11','2017-02-21 21:30:11','165e0302-8a06-4f17-b111-7b17114a02e6'),
	(29,17,7,35,0,1,'2017-02-21 21:30:11','2017-02-21 21:30:11','0534ed8c-4908-4e3f-a228-ad276665078e'),
	(30,17,7,36,0,2,'2017-02-21 21:30:11','2017-02-21 21:30:11','1d036e99-5fba-4596-9d4d-acf24366cbca'),
	(31,18,8,38,0,1,'2017-02-21 21:30:11','2017-02-21 21:30:11','19794148-b5b6-4995-8b56-332900774e14'),
	(32,18,8,39,0,2,'2017-02-21 21:30:11','2017-02-21 21:30:11','756fa556-a06d-44ee-b736-fe9be6923fb0'),
	(33,18,8,40,0,3,'2017-02-21 21:30:11','2017-02-21 21:30:11','6f5f3332-30a5-49d8-98f1-82c1374bc269'),
	(34,19,9,43,0,1,'2017-02-21 21:30:12','2017-02-21 21:30:12','925070fc-dec3-4bfc-bead-ec0385f5cf74'),
	(35,19,9,44,0,2,'2017-02-21 21:30:12','2017-02-21 21:30:12','a5cae365-3bd4-487b-b242-f9655e70dd08'),
	(36,19,9,45,0,3,'2017-02-21 21:30:12','2017-02-21 21:30:12','d1a03213-a035-49d9-8638-06c096543350'),
	(37,20,10,47,0,1,'2017-02-21 21:30:12','2017-02-21 21:30:12','6f95addd-1e37-499e-a3b7-70f7c5e20ad3'),
	(38,20,10,48,0,2,'2017-02-21 21:30:12','2017-02-21 21:30:12','268a0906-a315-455b-aac9-ca3778d733c6'),
	(39,20,10,49,0,3,'2017-02-21 21:30:12','2017-02-21 21:30:12','8d0d9683-f78f-405d-97e9-e99f48d652d5'),
	(40,21,11,51,0,1,'2017-02-21 21:30:12','2017-02-21 21:30:12','b386e0a3-3196-4cfe-b237-a5cee67ed723'),
	(41,21,11,52,0,2,'2017-02-21 21:30:12','2017-02-21 21:30:12','8cca53a0-cf4a-4a17-bd26-ad5df1487979'),
	(42,21,11,53,0,3,'2017-02-21 21:30:12','2017-02-21 21:30:12','5f51e9c4-fa4c-4dcd-a505-5aea28d1bbf7'),
	(43,22,12,55,0,1,'2017-02-21 21:30:12','2017-02-21 21:30:12','d371d871-1ad1-4515-b8cd-f3ba6ceb624d'),
	(44,22,12,56,0,2,'2017-02-21 21:30:12','2017-02-21 21:30:12','97d7098f-2ecb-48f6-b8a4-a232273dc78e'),
	(45,22,12,57,0,3,'2017-02-21 21:30:12','2017-02-21 21:30:12','65db3744-4256-4605-b822-dc820a0e541d'),
	(46,23,13,59,0,1,'2017-02-21 21:30:12','2017-02-21 21:30:12','9f45e3ad-1780-40ab-8245-93c00f2af0f0'),
	(47,23,13,60,0,2,'2017-02-21 21:30:12','2017-02-21 21:30:12','d2c70b68-ba0f-4718-9612-7dc89097922e'),
	(48,23,13,61,0,3,'2017-02-21 21:30:12','2017-02-21 21:30:12','285c8849-cfb5-4cae-9517-2e262c43bee9'),
	(49,23,13,62,0,4,'2017-02-21 21:30:12','2017-02-21 21:30:12','26179da2-9356-4683-add9-63d48a71c27b'),
	(50,24,14,64,0,1,'2017-02-21 21:30:13','2017-02-21 21:30:13','c941a8ec-dd2a-4ecd-979b-48bd763690f7'),
	(51,24,14,65,0,2,'2017-02-21 21:30:13','2017-02-21 21:30:13','6f691776-5e3c-4cff-aeff-da92397995a6'),
	(52,24,14,66,0,3,'2017-02-21 21:30:13','2017-02-21 21:30:13','0b091465-0086-4361-bab8-8f7d737ed7f0'),
	(53,24,14,67,0,4,'2017-02-21 21:30:13','2017-02-21 21:30:13','34003a0a-2eb6-476d-97b6-a2c035632f87'),
	(54,24,14,68,0,5,'2017-02-21 21:30:13','2017-02-21 21:30:13','4b1f68f2-2da1-4244-a247-3e9143bea302'),
	(55,24,14,69,0,6,'2017-02-21 21:30:13','2017-02-21 21:30:13','2459bb77-e36d-45c2-a621-84917fb696a0'),
	(56,24,14,70,0,7,'2017-02-21 21:30:13','2017-02-21 21:30:13','b4ff5473-f711-4356-b904-523b9e7286f0'),
	(57,24,14,71,0,8,'2017-02-21 21:30:13','2017-02-21 21:30:13','f840da8a-f7b5-47a2-9c98-df2b9b9ea8e3'),
	(58,24,14,72,0,9,'2017-02-21 21:30:13','2017-02-21 21:30:13','4fe9a4d0-cd4b-4c3e-b06c-345329d5a403'),
	(59,24,14,73,0,10,'2017-02-21 21:30:13','2017-02-21 21:30:13','6cbfd62d-1a7f-44de-bca1-4d1590ef9d1f'),
	(60,24,14,74,0,11,'2017-02-21 21:30:13','2017-02-21 21:30:13','ab138916-0f1c-4d3d-8e52-47ce9835db8c'),
	(61,24,14,75,0,12,'2017-02-21 21:30:13','2017-02-21 21:30:13','21a27f39-0c7d-449f-9bf8-730e3ba54386'),
	(62,24,14,76,0,13,'2017-02-21 21:30:13','2017-02-21 21:30:13','3d205e47-6817-4130-af82-ef738cb20906'),
	(63,25,15,78,0,1,'2017-02-21 21:30:13','2017-02-21 21:30:13','d7c7cc03-b14a-4be4-8372-faa3a67a1867'),
	(64,25,15,79,0,2,'2017-02-21 21:30:13','2017-02-21 21:30:13','5b5f6e8e-2e88-4c78-84ee-e71266e9ee8e'),
	(65,25,15,80,0,3,'2017-02-21 21:30:13','2017-02-21 21:30:13','60be6049-537f-4208-9dac-372a16b22be9'),
	(66,26,16,82,0,1,'2017-02-21 21:30:14','2017-02-21 21:30:14','83c6063e-6d64-4bf3-90b5-1f81bc5159ea'),
	(67,26,16,83,0,2,'2017-02-21 21:30:14','2017-02-21 21:30:14','5ac4042b-e855-4a3b-99a0-53732e7c21c5'),
	(68,26,16,84,0,3,'2017-02-21 21:30:14','2017-02-21 21:30:14','0e1430ba-189e-4d05-8ffa-e266e1102063'),
	(69,27,17,86,0,1,'2017-02-21 21:30:14','2017-02-21 21:30:14','db1bbd1e-b4d1-4fd7-86b1-10c452c22902'),
	(70,28,18,90,0,1,'2017-02-21 21:30:14','2017-02-21 21:30:14','23363f63-2e94-46d5-b647-a6cac3be2bab'),
	(71,29,19,94,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','26989e66-c184-4264-bc19-99d1feee6db3'),
	(72,29,19,102,0,2,'2017-02-21 21:30:15','2017-02-21 21:30:15','8a20fd2d-928b-4818-b289-9f996e3961d7'),
	(73,29,20,87,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','c92baac5-703e-4380-a773-e5f748e7028c'),
	(74,29,20,77,0,2,'2017-02-21 21:30:15','2017-02-21 21:30:15','1b65dfba-9e66-4594-b5e8-038b3b7ef23a'),
	(75,30,21,94,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','f539082f-cc25-49db-840d-2922a57ead48'),
	(76,30,22,42,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','084fc9ef-5bae-4179-8156-ae88701497a8'),
	(77,31,23,99,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','76bb4b15-b500-42b0-85d5-c37156a7d39d'),
	(78,32,24,99,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','c33f3f57-c934-46b6-aaa0-127bea263c3c'),
	(79,34,25,98,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','94f08730-995e-454b-9701-3415cafa2be7'),
	(80,34,25,100,0,2,'2017-02-21 21:30:15','2017-02-21 21:30:15','7f95d859-45f2-4e31-bf9c-df12d16b3d90'),
	(81,34,25,101,0,3,'2017-02-21 21:30:15','2017-02-21 21:30:15','eb34aec6-2823-4de0-ae87-6008f7121f0e'),
	(82,35,26,95,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','dc21a4af-c933-4c15-ae8d-e6686e79393a'),
	(83,35,26,103,0,2,'2017-02-21 21:30:15','2017-02-21 21:30:15','1cd7e707-d8c9-47bf-bca9-1209c2c5543b'),
	(84,35,27,46,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','b780416f-947a-4c45-8ce6-b60487d51b3a'),
	(85,36,28,96,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','cfc6e4b0-4766-4e5c-a7cb-83e3a3b3def0'),
	(86,36,29,50,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','7fd88570-ab63-4818-90c8-4c9c8fc317e0'),
	(87,37,30,96,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','3763099d-7426-4619-b3a8-ef3db6733bb3'),
	(88,37,31,54,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','18b3d7d7-8428-4997-ba0a-ec588186ef7d'),
	(89,38,32,95,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','6d88c052-ca06-4b84-877e-6ead3c171722'),
	(90,38,33,58,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','1a851cad-a515-44a2-b4e9-bcf774e1cb32'),
	(91,39,34,96,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','49301c9a-3254-4523-8144-1f4da53f5c56'),
	(92,39,35,63,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','e8a67343-22cb-4d0a-90bd-1fd0c8376e6d'),
	(93,40,36,88,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','70951b29-afcb-407f-97d9-0ff6aa78e3a1'),
	(94,40,37,24,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','0cf12e97-995a-4826-a3e2-ebb8976418c0'),
	(95,41,38,89,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','83622c96-4121-4fc8-a009-864825442302'),
	(96,41,39,31,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','d07c879f-1933-4eba-bc07-ec4e212988ff'),
	(97,43,41,97,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','55c10449-878d-4dd4-b8c7-65d742942783'),
	(98,44,43,85,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','ef3ebf87-3798-444d-9120-93c257fb24ee'),
	(99,46,44,92,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','228b0ad1-9ea2-4905-9392-5e73776047da'),
	(100,46,45,34,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','8442e650-5ec2-44e9-8c11-6369c0f95b1d'),
	(101,47,46,93,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','5f522f17-e4d8-46a1-a361-ade9a84d819a'),
	(102,47,47,37,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','0d989d75-9076-4edd-afc5-67463b829fc2'),
	(103,48,49,81,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','0e1cbf75-ab6d-43a5-aa4e-021040243db6'),
	(104,49,50,95,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','a7b273c6-aa73-4523-9a95-012dc93e06df'),
	(105,49,50,94,0,2,'2017-02-21 21:30:15','2017-02-21 21:30:15','b8c21730-3abd-4065-ab52-cff31af03fd0'),
	(106,49,50,99,0,3,'2017-02-21 21:30:15','2017-02-21 21:30:15','9849b3e7-0804-4817-8c8e-35bd3ec95b07'),
	(107,49,51,58,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','614391d3-fc4e-454d-bb18-4e10f61f8ed2'),
	(108,49,51,42,0,2,'2017-02-21 21:30:15','2017-02-21 21:30:15','e7c20c21-9a83-4c2f-9b1c-e41e65e34d05'),
	(109,50,52,18,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','b3748877-b9c0-42e3-a302-6c0671a25ed1'),
	(110,50,52,41,0,2,'2017-02-21 21:30:15','2017-02-21 21:30:15','96b8db5c-e426-47d9-87a5-d8cfb0770ca6'),
	(111,51,53,18,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','8aa931f0-aa4d-4da9-b465-454678a94b61'),
	(112,52,54,18,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','91128c7f-3c05-4729-86e8-b28ca75b22d4'),
	(113,53,55,18,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','f9ebe229-f28c-4321-954f-a5ad42ec296f'),
	(114,55,57,104,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','ef5abcdd-a734-458b-b725-99e0fb09d411'),
	(115,55,58,3,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','ea604f8a-ce06-4213-9069-7b33817a4020'),
	(116,55,59,23,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','9d0a80a4-d58f-462f-91da-0f3a711ff5c0'),
	(117,56,60,4,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','ef363271-da5c-4cae-8162-b0399dd2c7b2');

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
	(1,'Tag','2017-02-21 21:25:05','2017-02-21 21:25:05','804dabb9-0ea0-4e0d-b8a5-2fe8ecafa7af'),
	(13,'SuperTable_Block','2017-02-21 21:30:10','2017-02-21 21:30:10','48ec75fc-94d1-44d2-82c9-d7f2b352e957'),
	(14,'SuperTable_Block','2017-02-21 21:30:10','2017-02-21 21:30:10','b301de6d-f973-49a9-861d-8d8e649a65f3'),
	(15,'SuperTable_Block','2017-02-21 21:30:11','2017-02-21 21:30:11','f16e2293-6042-4069-928b-e3535a923d4d'),
	(16,'SuperTable_Block','2017-02-21 21:30:11','2017-02-21 21:30:11','c0d51957-4bdc-4ab3-8feb-72c3b1b25a5b'),
	(17,'SuperTable_Block','2017-02-21 21:30:11','2017-02-21 21:30:11','ff181aaf-7074-428e-9543-15f15a1d8409'),
	(18,'SuperTable_Block','2017-02-21 21:30:11','2017-02-21 21:30:11','52afb1f2-d4a1-42a3-b2a6-8ce91b3029f1'),
	(19,'SuperTable_Block','2017-02-21 21:30:12','2017-02-21 21:30:12','88d22b1d-819c-435e-85dc-1d2a8ad50f34'),
	(20,'SuperTable_Block','2017-02-21 21:30:12','2017-02-21 21:30:12','c497c0e4-d07c-4c1e-bee1-7a766b1a914b'),
	(21,'SuperTable_Block','2017-02-21 21:30:12','2017-02-21 21:30:12','4b595fe9-96a2-43fb-906e-d9dcf9a73200'),
	(22,'SuperTable_Block','2017-02-21 21:30:12','2017-02-21 21:30:12','00cda8fa-2724-470a-8a8d-9252920c7ebf'),
	(23,'SuperTable_Block','2017-02-21 21:30:12','2017-02-21 21:30:12','d281acc5-f47d-4f7e-ac7a-f3c240a58c69'),
	(24,'SuperTable_Block','2017-02-21 21:30:13','2017-02-21 21:30:13','69827751-53d4-4fd7-bb3f-2aa93e405734'),
	(25,'SuperTable_Block','2017-02-21 21:30:13','2017-02-21 21:30:13','f8c594bd-5233-4dc8-afdf-a6cdc6ea103c'),
	(26,'SuperTable_Block','2017-02-21 21:30:14','2017-02-21 21:30:14','5058f285-1386-4f03-88ba-3dcfc747274f'),
	(27,'SuperTable_Block','2017-02-21 21:30:14','2017-02-21 21:30:14','fed68a5e-b6dd-4209-9fe8-3c1cb6228771'),
	(28,'SuperTable_Block','2017-02-21 21:30:14','2017-02-21 21:30:14','1dc0a18b-d260-4f80-a26f-159e4bebbd77'),
	(29,'Neo_Block','2017-02-21 21:30:15','2017-02-21 21:30:15','3cc410f2-b521-491d-88c0-afc19e682ca8'),
	(30,'Neo_Block','2017-02-21 21:30:15','2017-02-21 21:30:15','ffe4ca8c-72de-4ef6-a70a-df94542026a0'),
	(31,'Neo_Block','2017-02-21 21:30:15','2017-02-21 21:30:15','7e5dd146-1929-49c2-b69a-d52f9c98c1c1'),
	(32,'Neo_Block','2017-02-21 21:30:15','2017-02-21 21:30:15','4b819799-0983-466b-a2fd-2332a919e580'),
	(33,'Neo_Block','2017-02-21 21:30:15','2017-02-21 21:30:15','8447f93e-afd0-4e1b-b8ae-1cf50cba7c90'),
	(34,'Neo_Block','2017-02-21 21:30:15','2017-02-21 21:30:15','4a8993d1-4a28-430b-861d-2ef5dea3b77e'),
	(35,'Neo_Block','2017-02-21 21:30:15','2017-02-21 21:30:15','e0830933-8714-48ee-b5a7-9eb53ee58e21'),
	(36,'Neo_Block','2017-02-21 21:30:15','2017-02-21 21:30:15','118df787-a255-4124-b250-dd53a6964cb2'),
	(37,'Neo_Block','2017-02-21 21:30:15','2017-02-21 21:30:15','ad98d530-2413-4ad9-b62e-184fbd21af3e'),
	(38,'Neo_Block','2017-02-21 21:30:15','2017-02-21 21:30:15','546f8ce7-3029-4127-9a95-6b0aa7ba1b34'),
	(39,'Neo_Block','2017-02-21 21:30:15','2017-02-21 21:30:15','d23be047-d3d7-4e8e-9a1a-e94b062c7ea9'),
	(40,'Neo_Block','2017-02-21 21:30:15','2017-02-21 21:30:15','6b74b00a-679b-4a0d-bf05-cb22d6605fe1'),
	(41,'Neo_Block','2017-02-21 21:30:15','2017-02-21 21:30:15','224230ac-0d34-422c-95b1-3b2b9161f49e'),
	(42,'Neo_Block','2017-02-21 21:30:15','2017-02-21 21:30:15','75dd17c1-cf7c-4424-9027-9ddb88e66242'),
	(43,'Neo_Block','2017-02-21 21:30:15','2017-02-21 21:30:15','ffe065e0-0402-47bb-9246-e645c5c04c87'),
	(44,'Neo_Block','2017-02-21 21:30:15','2017-02-21 21:30:15','32bfc66e-3675-4710-844f-d65cde382fdc'),
	(45,'Neo_Block','2017-02-21 21:30:15','2017-02-21 21:30:15','c47af143-2d58-462a-ae92-193d628195cf'),
	(46,'Neo_Block','2017-02-21 21:30:15','2017-02-21 21:30:15','5632dce1-7cd0-45af-bb85-c9d8b6a01e3e'),
	(47,'Neo_Block','2017-02-21 21:30:15','2017-02-21 21:30:15','1ac6cf0b-cfe0-47d0-aae8-2e0fafc5e2a4'),
	(48,'Neo_Block','2017-02-21 21:30:15','2017-02-21 21:30:15','005cf52d-76ba-4d5b-b941-b7bf9fc0d01f'),
	(49,'Neo_Block','2017-02-21 21:30:15','2017-02-21 21:30:15','9eb0806d-31e3-43ee-a85f-9bfa81774107'),
	(50,'Asset','2017-02-21 21:30:15','2017-02-21 21:30:15','8879161b-b3cc-40c2-bad8-d430d1444b92'),
	(51,'Asset','2017-02-21 21:30:15','2017-02-21 21:30:15','4f3027c5-66d7-4c05-bb2a-13ce13330a14'),
	(52,'Asset','2017-02-21 21:30:15','2017-02-21 21:30:15','e5a582d9-914b-4f56-b2e4-64e2e97c28a7'),
	(53,'Asset','2017-02-21 21:30:15','2017-02-21 21:30:15','6f7b8b5d-96b2-4782-a3fa-e66519d4ccfe'),
	(54,'Entry','2017-02-21 21:30:15','2017-02-21 21:30:15','87a2f14c-a8cd-4665-b3a0-0c77fcf5cb2c'),
	(55,'Entry','2017-02-21 21:30:15','2017-02-21 21:30:15','6860387c-6bc2-4fb7-a1bb-eef2fcb31dae'),
	(56,'GlobalSet','2017-02-21 21:30:15','2017-02-21 21:30:15','9f00691b-1027-4f21-8526-42ee7620c020'),
	(57,'Category','2017-02-21 21:30:15','2017-02-21 21:30:15','af95a0c2-5600-44c7-bde4-54b67a032e8e');

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
	(3,13,'Content',1,'2017-02-21 21:30:10','2017-02-21 21:30:10','de585445-a95d-466d-bad0-08de48664594'),
	(4,14,'Content',1,'2017-02-21 21:30:10','2017-02-21 21:30:10','5c6f55fc-3ffe-4071-8142-18e087c69fd7'),
	(5,15,'Content',1,'2017-02-21 21:30:11','2017-02-21 21:30:11','7b017db4-1ad8-462c-b547-6960acddcf7f'),
	(6,16,'Content',1,'2017-02-21 21:30:11','2017-02-21 21:30:11','acdb0f3a-7d02-4f1f-9879-9d8a5a57200b'),
	(7,17,'Content',1,'2017-02-21 21:30:11','2017-02-21 21:30:11','6651657f-446b-4938-917e-3fe66b648323'),
	(8,18,'Content',1,'2017-02-21 21:30:11','2017-02-21 21:30:11','cb6adac7-2837-4af1-b600-3b59f4311d1f'),
	(9,19,'Content',1,'2017-02-21 21:30:12','2017-02-21 21:30:12','193d3f75-ee01-4ad4-8c77-3548323d69e6'),
	(10,20,'Content',1,'2017-02-21 21:30:12','2017-02-21 21:30:12','622083f8-b7da-4645-b023-8e897043c41f'),
	(11,21,'Content',1,'2017-02-21 21:30:12','2017-02-21 21:30:12','dec29a2b-628b-42c4-90c8-2c13c39d5c9c'),
	(12,22,'Content',1,'2017-02-21 21:30:12','2017-02-21 21:30:12','52dbd124-f9c3-4f0f-ba2d-190c192df8b7'),
	(13,23,'Content',1,'2017-02-21 21:30:12','2017-02-21 21:30:12','9d396a3f-e6f7-41fa-9d42-af5a190e0a60'),
	(14,24,'Content',1,'2017-02-21 21:30:13','2017-02-21 21:30:13','2cce6869-a0b6-430f-a479-b43793e3e7c7'),
	(15,25,'Content',1,'2017-02-21 21:30:13','2017-02-21 21:30:13','de779f0a-03bc-48d7-9c53-eb6c5623f0ad'),
	(16,26,'Content',1,'2017-02-21 21:30:14','2017-02-21 21:30:14','de1b46c3-a304-4884-8396-e2abd3f1976d'),
	(17,27,'Content',1,'2017-02-21 21:30:14','2017-02-21 21:30:14','ca748926-5657-4dfb-892f-66f6c1f3d115'),
	(18,28,'Content',1,'2017-02-21 21:30:14','2017-02-21 21:30:14','d6b1bf38-0ae8-4f89-9149-07b64aa05908'),
	(19,29,'Content',1,'2017-02-21 21:30:15','2017-02-21 21:30:15','54e6d81d-b403-4f8f-965b-52dfd0a0cbe0'),
	(20,29,'Settings',2,'2017-02-21 21:30:15','2017-02-21 21:30:15','6684723d-9e92-48e0-a2ef-a0e1298d4620'),
	(21,30,'Content',1,'2017-02-21 21:30:15','2017-02-21 21:30:15','4f4de703-0e76-4284-b7dd-5ad0d7ae38da'),
	(22,30,'Settings',2,'2017-02-21 21:30:15','2017-02-21 21:30:15','7e354bf2-1bba-4344-a7d4-accafaa4058a'),
	(23,31,'Content',1,'2017-02-21 21:30:15','2017-02-21 21:30:15','41a628ef-29b1-484a-8947-04cc54c6c1f7'),
	(24,32,'Content',1,'2017-02-21 21:30:15','2017-02-21 21:30:15','28794f62-fdc0-400c-be37-924a8bf6ee6b'),
	(25,34,'Content',1,'2017-02-21 21:30:15','2017-02-21 21:30:15','701e854a-cce8-411a-9b2e-87e957bf359c'),
	(26,35,'Content',1,'2017-02-21 21:30:15','2017-02-21 21:30:15','d44985e8-a07a-4114-b855-edb6db83f9ea'),
	(27,35,'Settings',2,'2017-02-21 21:30:15','2017-02-21 21:30:15','7a0c2098-f011-4592-b396-9f4d8ed491c5'),
	(28,36,'Content',1,'2017-02-21 21:30:15','2017-02-21 21:30:15','e144bb8b-0506-49ec-ab47-29409a6393a2'),
	(29,36,'Settings',2,'2017-02-21 21:30:15','2017-02-21 21:30:15','1fa191f6-3587-4fba-a3eb-c1f62bc56651'),
	(30,37,'Content',1,'2017-02-21 21:30:15','2017-02-21 21:30:15','6baad1b5-7ef6-4920-a05e-810c49eb9b7d'),
	(31,37,'Settings',2,'2017-02-21 21:30:15','2017-02-21 21:30:15','b5dfa493-093c-40a0-804a-12405dd9287f'),
	(32,38,'Content',1,'2017-02-21 21:30:15','2017-02-21 21:30:15','2955b7dd-480b-4281-86bf-4d69a85d1d9a'),
	(33,38,'Settings',2,'2017-02-21 21:30:15','2017-02-21 21:30:15','07313b09-bf77-40eb-ba96-8742bd4cedcf'),
	(34,39,'Content',1,'2017-02-21 21:30:15','2017-02-21 21:30:15','2f91ad81-9e3e-49de-aead-05f86a6f9efb'),
	(35,39,'Settings',2,'2017-02-21 21:30:15','2017-02-21 21:30:15','c6d1f99f-3ad3-4d33-a8e7-8ca480e55844'),
	(36,40,'Content',1,'2017-02-21 21:30:15','2017-02-21 21:30:15','7be1b7a6-a9ce-4552-b130-3fefd18a52bb'),
	(37,40,'Settings',2,'2017-02-21 21:30:15','2017-02-21 21:30:15','76955669-27e8-4d4d-8b8b-cd868816ac37'),
	(38,41,'Content',1,'2017-02-21 21:30:15','2017-02-21 21:30:15','7dc1e707-bd49-4e83-93d2-2ea3e0eae3b1'),
	(39,41,'Settings',2,'2017-02-21 21:30:15','2017-02-21 21:30:15','0760b15a-ddca-41bf-abb0-aa0626d30312'),
	(40,42,'Content',1,'2017-02-21 21:30:15','2017-02-21 21:30:15','920f77a7-c27f-462c-83a6-e11b97797f5a'),
	(41,43,'Content',1,'2017-02-21 21:30:15','2017-02-21 21:30:15','39793fea-8346-4201-89ae-822815ccedbf'),
	(42,44,'Content',1,'2017-02-21 21:30:15','2017-02-21 21:30:15','ab109beb-6005-4aab-99e6-0401cc366688'),
	(43,44,'Settings',2,'2017-02-21 21:30:15','2017-02-21 21:30:15','327e2d69-1c0c-4da6-950c-9fc0dbfa6e14'),
	(44,46,'Content',1,'2017-02-21 21:30:15','2017-02-21 21:30:15','2c237dff-8b39-415c-8af9-cf21ea429078'),
	(45,46,'Settings',2,'2017-02-21 21:30:15','2017-02-21 21:30:15','e08c645e-23eb-4841-9c51-4ced44e8470d'),
	(46,47,'Content',1,'2017-02-21 21:30:15','2017-02-21 21:30:15','998ab86d-b407-41be-967c-cd101577217c'),
	(47,47,'Settings',2,'2017-02-21 21:30:15','2017-02-21 21:30:15','76fee83f-a1a3-4264-87ac-c931452d11d9'),
	(48,48,'Content',1,'2017-02-21 21:30:15','2017-02-21 21:30:15','de66e294-b0d9-4923-9324-3f493d31e627'),
	(49,48,'Settings',2,'2017-02-21 21:30:15','2017-02-21 21:30:15','283bb359-cca2-461e-ab91-4b551132520c'),
	(50,49,'Content',1,'2017-02-21 21:30:15','2017-02-21 21:30:15','ddca1343-ab0b-4fe6-b3d9-f0617f34cd4e'),
	(51,49,'Settings',2,'2017-02-21 21:30:15','2017-02-21 21:30:15','0d1e3ac5-e547-461e-bc33-53d88e2efef8'),
	(52,50,'Content',1,'2017-02-21 21:30:15','2017-02-21 21:30:15','a08c5da5-18d9-4f9c-9389-1223a1e4686e'),
	(53,51,'Content',1,'2017-02-21 21:30:15','2017-02-21 21:30:15','9a2e3213-031c-424f-82b8-310cbffc7cf9'),
	(54,52,'Content',1,'2017-02-21 21:30:15','2017-02-21 21:30:15','e3e1e993-cb73-475b-88ba-3470cdbaff8a'),
	(55,53,'Content',1,'2017-02-21 21:30:15','2017-02-21 21:30:15','001c0eba-8f43-4549-8f57-f01381c8cef5'),
	(56,54,'Content',1,'2017-02-21 21:30:15','2017-02-21 21:30:15','3b220d3e-4a8a-4850-a3a8-e8c7de358588'),
	(57,55,'Content Neo',1,'2017-02-21 21:30:15','2017-02-21 21:30:15','311d4093-44e2-4de7-ab96-306df7174f88'),
	(58,55,'Meta',2,'2017-02-21 21:30:15','2017-02-21 21:30:15','e9ed43b0-d62c-4d40-bb20-93e1986d6e6a'),
	(59,55,'SEO',3,'2017-02-21 21:30:15','2017-02-21 21:30:15','fe4e729b-9164-42c4-b5cb-04e437bf09ed'),
	(60,56,'Content',1,'2017-02-21 21:30:15','2017-02-21 21:30:15','b1ee48af-39fd-4f08-af35-86df64b2fff3');

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
	(1,1,'Body','body','global',NULL,1,'RichText','{\"configFile\":\"Standard.json\",\"columnType\":\"text\"}','2017-02-21 21:25:05','2017-02-21 21:25:05','936708d6-89cb-40f7-beb3-4bff93f6be0f'),
	(2,1,'Tags','tags','global',NULL,0,'Tags','{\"source\":\"taggroup:1\"}','2017-02-21 21:25:05','2017-02-21 21:25:05','fd5a38bb-e5b0-44aa-b911-80e0a8e662a9'),
	(3,2,'Category: Default','categoryDefault','global','',0,'Categories','{\"source\":\"group:1\",\"limit\":\"\",\"selectionLabel\":\"\"}','2017-02-21 21:30:10','2017-02-21 21:30:10','9489ba02-aeee-4c7f-a76d-b38a40c4f0f6'),
	(4,4,'Global: Social Networks','globalSocialNetworks','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"},\"new4\":{\"width\":\"\"},\"new5\":{\"width\":\"\"},\"new6\":{\"width\":\"\"},\"new7\":{\"width\":\"\"},\"new8\":{\"width\":\"\"},\"new9\":{\"width\":\"\"},\"new10\":{\"width\":\"\"},\"new11\":{\"width\":\"\"},\"new12\":{\"width\":\"\"},\"new13\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-02-21 21:30:10','2017-02-21 21:30:10','d12a78d7-2fe7-4dc2-b810-0f6347880a31'),
	(5,NULL,'Behance Username','behanceUsername','superTableBlockType:1','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-02-21 21:30:10','2017-02-21 21:30:10','c870e747-c97b-4207-90db-4e0b956475d0'),
	(6,NULL,'Dribbble Username','dribbbleUsername','superTableBlockType:1','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-02-21 21:30:10','2017-02-21 21:30:10','b5f2234a-1ec3-46ad-aa4b-1a4a9e469823'),
	(7,NULL,'Facebook Username','facebookUsername','superTableBlockType:1','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-02-21 21:30:10','2017-02-21 21:30:10','74ae77c0-706b-4ead-a70c-42d5f67845c3'),
	(8,NULL,'GitHub Username','githubUsername','superTableBlockType:1','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-02-21 21:30:10','2017-02-21 21:30:10','4c20ad01-8eb1-455a-bf59-3f36b4be024d'),
	(9,NULL,'Google+ Username','googleUsername','superTableBlockType:1','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-02-21 21:30:10','2017-02-21 21:30:10','46382f58-5d5b-4655-9172-0f974f0f9777'),
	(10,NULL,'Instagram Username','instagramUsername','superTableBlockType:1','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-02-21 21:30:10','2017-02-21 21:30:10','09da6e61-916a-4f3c-9e6b-5825af34b0ac'),
	(11,NULL,'LinkedIn Username','linkedinUsername','superTableBlockType:1','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-02-21 21:30:10','2017-02-21 21:30:10','51121e20-b00f-413e-84b9-84797315b363'),
	(12,NULL,'Medium Username','mediumUsername','superTableBlockType:1','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-02-21 21:30:10','2017-02-21 21:30:10','3794efc7-0da4-40b0-8bd1-42fc66f29975'),
	(13,NULL,'Pinterest Username','pinterestUsername','superTableBlockType:1','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-02-21 21:30:10','2017-02-21 21:30:10','5d55163d-ac8f-4706-9f05-16d0ad908a29'),
	(14,NULL,'Tumblr Username','tumblrUsername','superTableBlockType:1','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-02-21 21:30:10','2017-02-21 21:30:10','d9f9e25b-1b7a-417f-aba0-ee04864a8a2b'),
	(15,NULL,'Twitter Username','twitterUsername','superTableBlockType:1','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-02-21 21:30:10','2017-02-21 21:30:10','7212a7c8-fa5d-4ff4-9419-94a8dc5c3fce'),
	(16,NULL,'VSCO Username','vscoUsername','superTableBlockType:1','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-02-21 21:30:10','2017-02-21 21:30:10','665de67c-6647-4d5b-bd54-74aaebeca06d'),
	(17,NULL,'Xing Username','xingUsername','superTableBlockType:1','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-02-21 21:30:10','2017-02-21 21:30:10','4ae117df-59c3-4d26-bec8-09bb8fb0e1d5'),
	(18,5,'Grouped: Caption','groupedCaption','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"},\"new4\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-02-21 21:30:10','2017-02-21 21:30:10','8747b46a-258e-4a3d-a7e2-a213f0540202'),
	(19,NULL,'Caption Title','captionTitle','superTableBlockType:2','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-02-21 21:30:10','2017-02-21 21:30:10','d95e3fe6-54ce-4414-8182-8f611e4d1ed7'),
	(20,NULL,'Caption','caption','superTableBlockType:2','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":1,\"initialRows\":4}','2017-02-21 21:30:10','2017-02-21 21:30:10','2eaa7b4e-e7d8-4351-bbd9-2383534331ca'),
	(21,NULL,'Source','source','superTableBlockType:2','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-02-21 21:30:10','2017-02-21 21:30:10','eb6563f2-f75a-4c6c-85f2-65eb0a786702'),
	(22,NULL,'Source URL','sourceUrl','superTableBlockType:2','',0,'FruitLinkIt','{\"types\":[\"custom\"],\"defaultText\":\"\",\"allowCustomText\":\"\",\"allowTarget\":\"\",\"entrySources\":[],\"entrySelectionLabel\":\"Select an entry\",\"assetSources\":\"*\",\"assetSelectionLabel\":\"Select an asset\",\"categorySources\":\"*\",\"categorySelectionLabel\":\"Select a category\"}','2017-02-21 21:30:10','2017-02-21 21:30:10','5a524de3-18a9-4492-8420-a74b8bc94dae'),
	(23,6,'Plugin: Seomatic','pluginSeomatic','global','',0,'Seomatic_Meta','{\"assetSources\":\"*\",\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"WebPage\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoTitle\":\"\",\"seoTitleSourceChangeable\":1,\"seoDescriptionSource\":\"custom\",\"seoDescriptionSourceField\":\"title\",\"seoDescription\":\"\",\"seoDescriptionSourceChangeable\":1,\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoKeywords\":\"\",\"seoKeywordsSourceChangeable\":1,\"seoImageIdSource\":\"custom\",\"seoImageIdSourceField\":\"cbmImage\",\"seoImageIdSourceChangeable\":1,\"seoImageTransform\":\"\",\"twitterCardType\":\"\",\"twitterCardTypeChangeable\":1,\"seoTwitterImageIdSource\":\"custom\",\"seoTwitterImageIdSourceField\":\"cbmImage\",\"seoTwitterImageIdSourceChangeable\":1,\"seoTwitterImageTransform\":\"\",\"openGraphType\":\"\",\"openGraphTypeChangeable\":1,\"seoFacebookImageIdSource\":\"custom\",\"seoFacebookImageIdSourceField\":\"cbmImage\",\"seoFacebookImageIdSourceChangeable\":1,\"seoFacebookImageTransform\":\"\",\"robots\":\"\",\"robotsChangeable\":1}','2017-02-21 21:30:10','2017-02-21 21:30:10','a6089863-0c03-4e6b-aec3-15fe6741ab57'),
	(24,7,'Settings: Button','settingsButton','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"},\"new4\":{\"width\":\"\"},\"new5\":{\"width\":\"\"},\"new6\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-02-21 21:30:10','2017-02-21 21:30:10','8e511e01-5224-495d-8de1-85674f72b63e'),
	(25,NULL,'Style','style','superTableBlockType:3','',0,'Dropdown','{\"options\":[{\"label\":\"Primary\",\"value\":\"primary\",\"default\":1},{\"label\":\"Secondary\",\"value\":\"secondary\",\"default\":\"\"}]}','2017-02-21 21:30:11','2017-02-21 21:30:11','54c9d5e7-0323-4f89-b90c-ff4c7b952740'),
	(26,NULL,'Alignment','alignment','superTableBlockType:3','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Left\",\"value\":\"left\",\"default\":\"\"},{\"label\":\"Center\",\"value\":\"center\",\"default\":\"\"},{\"label\":\"Right\",\"value\":\"right\",\"default\":\"\"},{\"label\":\"Full\",\"value\":\"full\",\"default\":\"\"}]}','2017-02-21 21:30:11','2017-02-21 21:30:11','c90db377-bfdc-4570-af4f-6acf2fe5372d'),
	(27,NULL,'With Icon','withIcon','superTableBlockType:3','',0,'Lightswitch','{\"default\":\"\"}','2017-02-21 21:30:11','2017-02-21 21:30:11','c72bdda6-e82e-4f92-9ea7-a5bc4b17d9b7'),
	(28,NULL,'Icon Position','iconPosition','superTableBlockType:3','',0,'Dropdown','{\"options\":[{\"label\":\"Left\",\"value\":\"left\",\"default\":\"\"},{\"label\":\"Right\",\"value\":\"right\",\"default\":1}]}','2017-02-21 21:30:11','2017-02-21 21:30:11','2e4f3874-a3ef-4733-85b6-70077d96b00e'),
	(29,NULL,'Icon Size','iconSize','superTableBlockType:3','',0,'Dropdown','{\"options\":[{\"label\":\"16px\",\"value\":\"16px\",\"default\":1},{\"label\":\"24px\",\"value\":\"24px\",\"default\":\"\"}]}','2017-02-21 21:30:11','2017-02-21 21:30:11','ca6f5b0c-802a-420c-8571-88d0de69a491'),
	(30,NULL,'Icon','icon','superTableBlockType:3','',0,'Dropdown','{\"options\":[{\"label\":\"Icon Sample\",\"value\":\"iconSample\",\"default\":1}]}','2017-02-21 21:30:11','2017-02-21 21:30:11','ae6db900-b198-42fa-b0ff-da08e8d6b871'),
	(31,7,'Settings: ButtonGroup','settingsButtonGroup','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-02-21 21:30:11','2017-02-21 21:30:11','6b606f87-2c11-4d92-a27a-7f7917e9f4d7'),
	(32,NULL,'Style','style','superTableBlockType:4','',0,'Dropdown','{\"options\":[{\"label\":\"Primary\",\"value\":\"primary\",\"default\":1},{\"label\":\"Secondary\",\"value\":\"secondary\",\"default\":\"\"}]}','2017-02-21 21:30:11','2017-02-21 21:30:11','f4c4a7b5-23f4-4222-905e-3e639a4b0d1e'),
	(33,NULL,'Alignment','alignment','superTableBlockType:4','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Left\",\"value\":\"left\",\"default\":\"\"},{\"label\":\"Center\",\"value\":\"center\",\"default\":\"\"},{\"label\":\"Right\",\"value\":\"right\",\"default\":\"\"},{\"label\":\"Full\",\"value\":\"full\",\"default\":\"\"}]}','2017-02-21 21:30:11','2017-02-21 21:30:11','de9ee8c7-fc05-49eb-823f-bac25cb71c41'),
	(34,7,'Settings: Definition List','settingsDefinitionList','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-02-21 21:30:11','2017-02-21 21:30:11','571cdf57-e321-4db7-8cab-2cc31836b44b'),
	(35,NULL,'Columns Ratio','columnsRatio','superTableBlockType:5','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"1:1\",\"value\":\"50-50\",\"default\":\"\"},{\"label\":\"1:2\",\"value\":\"33-66\",\"default\":\"\"},{\"label\":\"1:3\",\"value\":\"25-75\",\"default\":\"\"}]}','2017-02-21 21:30:11','2017-02-21 21:30:11','8d5a4325-d696-4595-9d8d-f361a8ae37e2'),
	(36,NULL,'Layout','layout','superTableBlockType:5','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"\"},{\"label\":\"Table Layout\",\"value\":\"table\",\"default\":\"\"},{\"label\":\"Row Layout\",\"value\":\"row\",\"default\":\"\"}]}','2017-02-21 21:30:11','2017-02-21 21:30:11','b071ddb9-bb3f-41d7-9fe0-352dd95a11de'),
	(37,7,'Settings: Embed','settingsEmbed','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-02-21 21:30:11','2017-02-21 21:30:11','740db4b6-459b-4e34-8591-e6093074dd0b'),
	(38,NULL,'Video','video','superTableBlockType:6','',0,'Lightswitch','{\"default\":1}','2017-02-21 21:30:11','2017-02-21 21:30:11','1a550e04-7b67-4adf-ba51-27e49531adf6'),
	(39,NULL,'Embed Position','embedPosition','superTableBlockType:6','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Left\",\"value\":\"left\",\"default\":\"\"},{\"label\":\"Center\",\"value\":\"center\",\"default\":\"\"},{\"label\":\"Right\",\"value\":\"right\",\"default\":\"\"}]}','2017-02-21 21:30:11','2017-02-21 21:30:11','4346889f-3a96-4a9b-9dac-a3ed90d80dda'),
	(40,NULL,'Embed: Width','embedWidth','superTableBlockType:6','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Auto\",\"value\":\"auto\",\"default\":\"\"},{\"label\":\"Full\",\"value\":\"full\",\"default\":\"\"},{\"label\":\"Three Quarter\",\"value\":\"threeQuarter\",\"default\":\"\"},{\"label\":\"Half\",\"value\":\"half\",\"default\":\"\"}]}','2017-02-21 21:30:11','2017-02-21 21:30:11','e0c1ec82-332e-4d67-8719-234f635adc88'),
	(41,7,'Settings: Focal Point','settingsFocalPoint','global','',0,'FocalPointField_FocalPoint','{\"defaultFocalPoint\":\"50% 50%\"}','2017-02-21 21:30:11','2017-02-21 21:30:11','28101a38-68ba-4859-8b6d-1aff70dfdbee'),
	(42,7,'Settings: Headline','settingsHeadline','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"50%\"},\"new3\":{\"width\":\"50%\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-02-21 21:30:11','2017-02-21 21:30:11','92ca3cd7-d804-44b8-9b63-da776226ea61'),
	(43,NULL,'Indented','indented','superTableBlockType:7','',0,'Lightswitch','{\"default\":\"\"}','2017-02-21 21:30:12','2017-02-21 21:30:12','559ab625-51e4-4d78-b5d8-911e69122710'),
	(44,NULL,'Semantic Size','semanticSize','superTableBlockType:7','',0,'Dropdown','{\"options\":[{\"label\":\"H1\",\"value\":\"h1\",\"default\":\"\"},{\"label\":\"H2\",\"value\":\"h2\",\"default\":1},{\"label\":\"H3\",\"value\":\"h3\",\"default\":\"\"},{\"label\":\"H4\",\"value\":\"h4\",\"default\":\"\"},{\"label\":\"H5\",\"value\":\"h5\",\"default\":\"\"},{\"label\":\"H6\",\"value\":\"h6\",\"default\":\"\"}]}','2017-02-21 21:30:12','2017-02-21 21:30:12','6ddf306d-e682-480f-80e5-ad482bdd1d46'),
	(45,NULL,'Visual Size','visualSize','superTableBlockType:7','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Looks like H1\",\"value\":\"h1\",\"default\":\"\"},{\"label\":\"Looks like H2\",\"value\":\"h2\",\"default\":\"\"},{\"label\":\"Looks like H3\",\"value\":\"h3\",\"default\":\"\"},{\"label\":\"Looks like H4\",\"value\":\"h4\",\"default\":\"\"},{\"label\":\"Looks like H5\",\"value\":\"h5\",\"default\":\"\"},{\"label\":\"Looks like H6\",\"value\":\"h6\",\"default\":\"\"}]}','2017-02-21 21:30:12','2017-02-21 21:30:12','7e16ee86-2aa7-40f5-b6cd-6556880bf43e'),
	(46,7,'Settings: Image Cover','settingsImageCover','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-02-21 21:30:12','2017-02-21 21:30:12','acb40eab-e4f9-494c-88d6-6dabcbd34b12'),
	(47,NULL,'Background Position','backgroundPosition','superTableBlockType:8','',0,'Dropdown','{\"options\":[{\"label\":\"Focalpoint\",\"value\":\"focalpoint\",\"default\":1},{\"label\":\"Left : Top\",\"value\":\"0% 0%\",\"default\":\"\"},{\"label\":\"Left : Center\",\"value\":\"0% 50%\",\"default\":\"\"},{\"label\":\"Left : Bottom\",\"value\":\"0% 100%\",\"default\":\"\"},{\"label\":\"Center : Top\",\"value\":\"50% 0%\",\"default\":\"\"},{\"label\":\"Center : Center\",\"value\":\"50% 50%\",\"default\":\"\"},{\"label\":\"Center : Bottom\",\"value\":\"50% 100%\",\"default\":\"\"},{\"label\":\"Right : Top\",\"value\":\"100% 0%\",\"default\":\"\"},{\"label\":\"Right : Center\",\"value\":\"100% 50%\",\"default\":\"\"},{\"label\":\"Right : Bottom\",\"value\":\"100% 100%\",\"default\":\"\"}]}','2017-02-21 21:30:12','2017-02-21 21:30:12','1c15989a-eedd-4562-99fa-6b6a98f09c1c'),
	(48,NULL,'Text Vertical Position','textVerticalPosition','superTableBlockType:8','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Top\",\"value\":\"top\",\"default\":\"\"},{\"label\":\"Center\",\"value\":\"center\",\"default\":\"\"},{\"label\":\"Bottom\",\"value\":\"bottom\",\"default\":\"\"}]}','2017-02-21 21:30:12','2017-02-21 21:30:12','0f4da27a-2145-4f7f-a486-360a847fd253'),
	(49,NULL,'Text Alignment','textAlignment','superTableBlockType:8','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Left\",\"value\":\"left\",\"default\":\"\"},{\"label\":\"Center\",\"value\":\"center\",\"default\":\"\"},{\"label\":\"Right\",\"value\":\"right\",\"default\":\"\"}]}','2017-02-21 21:30:12','2017-02-21 21:30:12','5da7db5a-1636-4a91-ada5-3f13a3620710'),
	(50,7,'Settings: Image Gallery','settingsImageGallery','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-02-21 21:30:12','2017-02-21 21:30:12','4219627d-e662-4234-a516-c1783b2e3ce4'),
	(51,NULL,'Colums','columns','superTableBlockType:9','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":6,\"value\":6,\"default\":\"\"},{\"label\":5,\"value\":5,\"default\":\"\"},{\"label\":4,\"value\":4,\"default\":\"\"},{\"label\":3,\"value\":3,\"default\":\"\"},{\"label\":2,\"value\":2,\"default\":\"\"}]}','2017-02-21 21:30:12','2017-02-21 21:30:12','61171418-8f53-410b-9394-9c9bb78e0f52'),
	(52,NULL,'Image Position','imagePosition','superTableBlockType:9','',0,'Dropdown','{\"options\":[{\"label\":\"Focalpoint\",\"value\":\"focalpoint\",\"default\":1},{\"label\":\"Left : Top\",\"value\":\"0% 0%\",\"default\":\"\"},{\"label\":\"Left : Center\",\"value\":\"0% 50%\",\"default\":\"\"},{\"label\":\"Left : Bottom\",\"value\":\"0% 100%\",\"default\":\"\"},{\"label\":\"Center : Top\",\"value\":\"50% 0%\",\"default\":\"\"},{\"label\":\"Center : Center\",\"value\":\"50% 50%\",\"default\":\"\"},{\"label\":\"Center : Bottom\",\"value\":\"50% 100%\",\"default\":\"\"},{\"label\":\"Right : Top\",\"value\":\"100% 0%\",\"default\":\"\"},{\"label\":\"Right : Center\",\"value\":\"100% 50%\",\"default\":\"\"},{\"label\":\"Right : Bottom\",\"value\":\"100% 100%\",\"default\":\"\"}]}','2017-02-21 21:30:12','2017-02-21 21:30:12','b2f99a61-f278-49df-b979-26ec71f8c79c'),
	(53,NULL,'Image Thumbs Ratio','imageThumbsRatio','superTableBlockType:9','',0,'Dropdown','{\"options\":[{\"label\":\"16:10\",\"value\":\"16:10\",\"default\":\"\"},{\"label\":\"16:9\",\"value\":\"16:9\",\"default\":\"\"},{\"label\":\"4:3\",\"value\":\"4:3\",\"default\":\"\"},{\"label\":\"3:2\",\"value\":\"3:2\",\"default\":\"\"},{\"label\":\"2:1\",\"value\":\"2:1\",\"default\":\"\"},{\"label\":\"1:1\",\"value\":\"1:1\",\"default\":1},{\"label\":\"1:2\",\"value\":\"1:2\",\"default\":\"\"},{\"label\":\"2:3\",\"value\":\"2:3\",\"default\":\"\"},{\"label\":\"3:4\",\"value\":\"3:4\",\"default\":\"\"},{\"label\":\"9:16\",\"value\":\"9:16\",\"default\":\"\"},{\"label\":\"10:16\",\"value\":\"10:16\",\"default\":\"\"}]}','2017-02-21 21:30:12','2017-02-21 21:30:12','35214074-5809-4b92-9424-3c39bb48684f'),
	(54,7,'Settings: Image Grid','settingsImageGrid','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-02-21 21:30:12','2017-02-21 21:30:12','50e99800-0680-4311-b12e-b0f85bf975cb'),
	(55,NULL,'Caption','caption','superTableBlockType:10','',0,'Lightswitch','{\"default\":\"\"}','2017-02-21 21:30:12','2017-02-21 21:30:12','2552b0ca-d5cd-4e17-b94b-76e0636ce738'),
	(56,NULL,'Columns','columns','superTableBlockType:10','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":3,\"value\":3,\"default\":\"\"},{\"label\":2,\"value\":2,\"default\":\"\"},{\"label\":1,\"value\":1,\"default\":\"\"}]}','2017-02-21 21:30:12','2017-02-21 21:30:12','fd0d3d2e-1231-4f20-8cd2-3a6c20a4c97b'),
	(57,NULL,'Image Ratio','imageRatio','superTableBlockType:10','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"16:10\",\"value\":\"16:10\",\"default\":\"\"},{\"label\":\"16:9\",\"value\":\"16:9\",\"default\":\"\"},{\"label\":\"4:3\",\"value\":\"4:3\",\"default\":\"\"},{\"label\":\"3:2\",\"value\":\"3:2\",\"default\":\"\"},{\"label\":\"2:1\",\"value\":\"2:1\",\"default\":\"\"},{\"label\":\"1:1\",\"value\":\"1:1\",\"default\":\"\"},{\"label\":\"1:2\",\"value\":\"1:2\",\"default\":\"\"},{\"label\":\"2:3\",\"value\":\"2:3\",\"default\":\"\"},{\"label\":\"3:4\",\"value\":\"3:4\",\"default\":\"\"},{\"label\":\"9:16\",\"value\":\"9:16\",\"default\":\"\"},{\"label\":\"10:16\",\"value\":\"10:16\",\"default\":\"\"}]}','2017-02-21 21:30:12','2017-02-21 21:30:12','b91b1b0e-2df2-4322-a444-527cefa88f5e'),
	(58,7,'Settings: Image Single','settingsImageSingle','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"},\"new4\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-02-21 21:30:12','2017-02-21 21:30:12','f3ebfea7-930c-4559-a939-8739da0eafa7'),
	(59,NULL,'Caption','caption','superTableBlockType:11','',0,'Lightswitch','{\"default\":\"\"}','2017-02-21 21:30:12','2017-02-21 21:30:12','ba5db803-1b8d-4c10-8792-fd0893bc5fb9'),
	(60,NULL,'Image Position','imagePosition','superTableBlockType:11','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Left\",\"value\":\"left\",\"default\":\"\"},{\"label\":\"Center\",\"value\":\"center\",\"default\":\"\"},{\"label\":\"Right\",\"value\":\"right\",\"default\":\"\"}]}','2017-02-21 21:30:12','2017-02-21 21:30:12','b2ee8e1c-114e-4f25-9c00-f5c16a4d82a8'),
	(61,NULL,'Image Ratio','imageRatio','superTableBlockType:11','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"16:10\",\"value\":\"16:10\",\"default\":\"\"},{\"label\":\"16:9\",\"value\":\"16:9\",\"default\":\"\"},{\"label\":\"4:3\",\"value\":\"4:3\",\"default\":\"\"},{\"label\":\"3:2\",\"value\":\"3:2\",\"default\":\"\"},{\"label\":\"2:1\",\"value\":\"2:1\",\"default\":\"\"},{\"label\":\"1:1\",\"value\":\"1:1\",\"default\":\"\"},{\"label\":\"1:2\",\"value\":\"1:2\",\"default\":\"\"},{\"label\":\"2:3\",\"value\":\"2:3\",\"default\":\"\"},{\"label\":\"3:4\",\"value\":\"3:4\",\"default\":\"\"},{\"label\":\"9:16\",\"value\":\"9:16\",\"default\":\"\"},{\"label\":\"10:16\",\"value\":\"10:16\",\"default\":\"\"}]}','2017-02-21 21:30:12','2017-02-21 21:30:12','9f132934-c270-475b-b3c7-fbff360eebe6'),
	(62,NULL,'Image Width','imageWidth','superTableBlockType:11','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Full\",\"value\":\"full\",\"default\":\"\"},{\"label\":\"Three Quarter\",\"value\":\"threeQuarter\",\"default\":\"\"},{\"label\":\"Half\",\"value\":\"half\",\"default\":\"\"}]}','2017-02-21 21:30:12','2017-02-21 21:30:12','55f40ce2-def2-4aa0-bd0b-7c4a5347f77b'),
	(63,7,'Settings: Image Slider','settingsImageSlider','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"33%\"},\"new2\":{\"width\":\"33%\"},\"new3\":{\"width\":\"33%\"},\"new4\":{\"width\":\"33%\"},\"new5\":{\"width\":\"33%\"},\"new6\":{\"width\":\"33%\"},\"new7\":{\"width\":\"33%\"},\"new8\":{\"width\":\"33%\"},\"new9\":{\"width\":\"33%\"},\"new10\":{\"width\":\"33%\"},\"new11\":{\"width\":\"33%\"},\"new12\":{\"width\":\"33%\"},\"new13\":{\"width\":\"33%\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-02-21 21:30:12','2017-02-21 21:30:12','ec384fc7-31ba-4900-9f56-ac39876942a3'),
	(64,NULL,'Autoplay','autoplay','superTableBlockType:12','Delay between transitions (in ms). If this parameter is not specified, auto play will be disabled',0,'Dropdown','{\"options\":[{\"label\":\"Disabled\",\"value\":\"disabled\",\"default\":1},{\"label\":\"Slow\",\"value\":\"slow\",\"default\":\"\"},{\"label\":\"Medium\",\"value\":\"medium\",\"default\":\"\"},{\"label\":\"Fast\",\"value\":\"fast\",\"default\":\"\"}]}','2017-02-21 21:30:13','2017-02-21 21:30:13','961eea20-dd38-4363-94d0-d73555058f95'),
	(65,NULL,'Cell Align','cellAlign','superTableBlockType:12','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Left\",\"value\":\"\\\"left\\\"\",\"default\":\"\"},{\"label\":\"Center\",\"value\":\"\\\"center\\\"\",\"default\":\"\"},{\"label\":\"Right\",\"value\":\"\\\"right\\\"\",\"default\":\"\"}]}','2017-02-21 21:30:13','2017-02-21 21:30:13','b9ae8342-d351-4c8b-ae46-a0e1f8cdaf5e'),
	(66,NULL,'Draggable','draggable','superTableBlockType:12','',0,'Lightswitch','{\"default\":1}','2017-02-21 21:30:13','2017-02-21 21:30:13','156593ea-755c-4b98-aa06-828246d2e228'),
	(67,NULL,'Free Scroll','freeScroll','superTableBlockType:12','If true then slides will not have fixed positions',0,'Lightswitch','{\"default\":\"\"}','2017-02-21 21:30:13','2017-02-21 21:30:13','4d2d9123-f936-4e6c-8f6f-5fd884796edc'),
	(68,NULL,'Group Cells','groupCells','superTableBlockType:12','',0,'Lightswitch','{\"default\":1}','2017-02-21 21:30:13','2017-02-21 21:30:13','e0be11c0-6207-4182-b7de-3d3414602a77'),
	(69,NULL,'Image Ratio','imageRatio','superTableBlockType:12','',0,'Dropdown','{\"options\":[{\"label\":\"16:10\",\"value\":\"16:10\",\"default\":1},{\"label\":\"16:9\",\"value\":\"16:9\",\"default\":\"\"},{\"label\":\"4:3\",\"value\":\"4:3\",\"default\":\"\"},{\"label\":\"3:2\",\"value\":\"3:2\",\"default\":\"\"},{\"label\":\"2:1\",\"value\":\"2:1\",\"default\":\"\"},{\"label\":\"1:1\",\"value\":\"1:1\",\"default\":\"\"},{\"label\":\"1:2\",\"value\":\"1:2\",\"default\":\"\"},{\"label\":\"2:3\",\"value\":\"2:3\",\"default\":\"\"},{\"label\":\"3:4\",\"value\":\"3:4\",\"default\":\"\"},{\"label\":\"9:16\",\"value\":\"9:16\",\"default\":\"\"},{\"label\":\"10:16\",\"value\":\"10:16\",\"default\":\"\"}]}','2017-02-21 21:30:13','2017-02-21 21:30:13','14cdcb23-9019-4dd9-b270-4e74ea9c3826'),
	(70,NULL,'Loop','loop','superTableBlockType:12','',0,'Lightswitch','{\"default\":\"\"}','2017-02-21 21:30:13','2017-02-21 21:30:13','b3805984-e048-4468-ad37-51e94bec3caa'),
	(71,NULL,'Pause on Hover','pauseOnHover','superTableBlockType:12','',0,'Lightswitch','{\"default\":1}','2017-02-21 21:30:13','2017-02-21 21:30:13','c800a76d-8eb1-468f-80c2-dcaa1d94d52d'),
	(72,NULL,'Navigation','navigation','superTableBlockType:12','',0,'Lightswitch','{\"default\":1}','2017-02-21 21:30:13','2017-02-21 21:30:13','113b04c2-2d0b-41cb-85d7-6af47204cf67'),
	(73,NULL,'Pagination','pagination','superTableBlockType:12','',0,'Lightswitch','{\"default\":1}','2017-02-21 21:30:13','2017-02-21 21:30:13','46804b2d-f8ea-49fe-a194-b19e23652c60'),
	(74,NULL,'Right To Left','rightToLeft','superTableBlockType:12','',0,'Lightswitch','{\"default\":\"\"}','2017-02-21 21:30:13','2017-02-21 21:30:13','4800be9a-c95a-4fb9-a15b-ad86466e9ee2'),
	(75,NULL,'Slides Per View','slidesPerView','superTableBlockType:12','Number of slides per view (slides visible at the same time on slider\'s container).',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":1,\"value\":1,\"default\":\"\"},{\"label\":2,\"value\":2,\"default\":\"\"},{\"label\":3,\"value\":3,\"default\":\"\"},{\"label\":4,\"value\":4,\"default\":\"\"},{\"label\":5,\"value\":5,\"default\":\"\"},{\"label\":6,\"value\":6,\"default\":\"\"}]}','2017-02-21 21:30:13','2017-02-21 21:30:13','a6d28877-5448-461a-91d0-57890dbc327c'),
	(76,NULL,'Speed','speed','superTableBlockType:12','Duration of transition between slides (in ms)',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Slow\",\"value\":\"slow\",\"default\":\"\"},{\"label\":\"Medium\",\"value\":\"medium\",\"default\":\"\"},{\"label\":\"Fast\",\"value\":\"fast\",\"default\":\"\"}]}','2017-02-21 21:30:13','2017-02-21 21:30:13','ba22b0f5-3fe4-4596-b266-87a8f34ef7fe'),
	(77,7,'Settings: Section','settingsSection','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Section Options\",\"maxRows\":null}','2017-02-21 21:30:13','2017-02-21 21:30:13','1ff15ce4-5b84-4c8a-80ec-76281bba55ef'),
	(78,NULL,'Background Color','backgroundColor','superTableBlockType:13','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Black\",\"value\":\"black\",\"default\":\"\"},{\"label\":\"White\",\"value\":\"white\",\"default\":\"\"}]}','2017-02-21 21:30:13','2017-02-21 21:30:13','565c7ce4-258c-4df0-8cf4-354b979b5ae0'),
	(79,NULL,'Full Width','fullWidth','superTableBlockType:13','',0,'Lightswitch','{\"default\":\"\"}','2017-02-21 21:30:13','2017-02-21 21:30:13','46571a18-ba60-4d72-99e8-0ac7aa4a009c'),
	(80,NULL,'Padding Vertical','paddingVertical','superTableBlockType:13','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"None\",\"value\":\"none\",\"default\":\"\"},{\"label\":\"Small\",\"value\":\"small\",\"default\":\"\"},{\"label\":\"Medium\",\"value\":\"medium\",\"default\":\"\"},{\"label\":\"Large\",\"value\":\"large\",\"default\":\"\"}]}','2017-02-21 21:30:13','2017-02-21 21:30:13','e2baa731-87c8-47b4-af0d-70c21e0b2d72'),
	(81,7,'Settings: Separator','settingsSeparator','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-02-21 21:30:13','2017-02-21 21:30:13','70bdc43f-da8d-495f-b7a1-6c12c50e32c9'),
	(82,NULL,'Full Width','fullWidth','superTableBlockType:14','',0,'Lightswitch','{\"default\":\"\"}','2017-02-21 21:30:13','2017-02-21 21:30:13','25d4fe0a-06c9-4713-8789-9a71c5a6b8ed'),
	(83,NULL,'Style','style','superTableBlockType:14','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1}]}','2017-02-21 21:30:13','2017-02-21 21:30:13','96454438-80d3-412d-bdd4-6705f97a7e58'),
	(84,NULL,'Margin Vertical','marginVertical','superTableBlockType:14','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"None\",\"value\":\"none\",\"default\":\"\"},{\"label\":\"Small\",\"value\":\"small\",\"default\":\"\"},{\"label\":\"Medium\",\"value\":\"medium\",\"default\":\"\"},{\"label\":\"Large\",\"value\":\"large\",\"default\":\"\"}]}','2017-02-21 21:30:14','2017-02-21 21:30:14','4667ddd7-9983-4271-9e46-26f836af726e'),
	(85,7,'Settings: Two Columns','settingsTwoColumns','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-02-21 21:30:14','2017-02-21 21:30:14','4c163695-d67e-40aa-8d75-8e471bc2127b'),
	(86,NULL,'Columns Ratio','columnsRatio','superTableBlockType:15','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"1:1\",\"value\":\"50-50\",\"default\":\"\"},{\"label\":\"2:1\",\"value\":\"66-33\",\"default\":\"\"},{\"label\":\"3:1\",\"value\":\"75-25\",\"default\":\"\"},{\"label\":\"1:3\",\"value\":\"25-75\",\"default\":\"\"},{\"label\":\"1:2\",\"value\":\"33-66\",\"default\":\"\"}]}','2017-02-21 21:30:14','2017-02-21 21:30:14','5123883a-1ab2-44b9-8b0d-43ad43d88b21'),
	(87,8,'Single: Anchor','singleAnchor','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-02-21 21:30:14','2017-02-21 21:30:14','261ab46c-756f-4656-8f84-42bb9994d947'),
	(88,8,'Single: Button','singleButton','global','',0,'FruitLinkIt','{\"types\":[\"email\",\"tel\",\"custom\",\"entry\",\"category\",\"asset\"],\"defaultText\":\"Click here\",\"allowCustomText\":1,\"allowTarget\":1,\"entrySources\":[],\"entrySelectionLabel\":\"Select an entry\",\"assetSources\":\"*\",\"assetSelectionLabel\":\"Select an asset\",\"categorySources\":\"*\",\"categorySelectionLabel\":\"Select a category\"}','2017-02-21 21:30:14','2017-02-21 21:30:14','904e4fcf-d088-4f07-b68c-bedf3b8618ee'),
	(89,8,'Single: Button Group','singleButtonGroup','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":null,\"selectionLabel\":\"Add a Button\",\"maxRows\":5}','2017-02-21 21:30:14','2017-02-21 21:30:14','6379cf76-1781-42a2-9dd4-db6fbdf51538'),
	(90,NULL,'Button','button','superTableBlockType:16','',0,'FruitLinkIt','{\"types\":[\"email\",\"tel\",\"custom\",\"entry\",\"category\",\"asset\"],\"defaultText\":\"\",\"allowCustomText\":1,\"allowTarget\":1,\"entrySources\":[],\"entrySelectionLabel\":\"Select an entry\",\"assetSources\":\"*\",\"assetSelectionLabel\":\"Select an asset\",\"categorySources\":\"*\",\"categorySelectionLabel\":\"Select a category\"}','2017-02-21 21:30:14','2017-02-21 21:30:14','bac3747b-6430-4166-b66e-f9266d7dc9d4'),
	(91,8,'Single: Code','singleCode','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":1,\"initialRows\":8}','2017-02-21 21:30:14','2017-02-21 21:30:14','13573a30-d4ba-44c9-bc9c-681b3b66e89a'),
	(92,8,'Single: Definition List','singleDefinitionList','global','',0,'Table','{\"columns\":{\"col1\":{\"heading\":\"Definition Term\",\"handle\":\"definitionTerm\",\"width\":\"\",\"type\":\"singleline\"},\"col2\":{\"heading\":\"Definition Description\",\"handle\":\"definitionDescription\",\"width\":\"\",\"type\":\"singleline\"}},\"defaults\":{\"row1\":{\"col1\":\"\",\"col2\":\"\"}}}','2017-02-21 21:30:14','2017-02-21 21:30:14','fcd4ea64-3205-441a-a6e6-193f433a5db1'),
	(93,8,'Single: Embed Code','singleEmbedCode','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":1,\"initialRows\":2}','2017-02-21 21:30:14','2017-02-21 21:30:14','556cfea4-ef52-40cf-a2af-afba90ededca'),
	(94,8,'Single: Headline','singleHeadline','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-02-21 21:30:14','2017-02-21 21:30:14','c0d50651-5977-4581-995a-6cb37f280774'),
	(95,8,'Single: Image','singleImage','global','',0,'Assets','{\"useSingleFolder\":1,\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":1,\"allowedKinds\":[\"image\"],\"limit\":1,\"viewMode\":\"list\",\"selectionLabel\":\"Add an Image\"}','2017-02-21 21:30:14','2017-02-21 21:30:14','7f0baf2f-13a7-4b6d-b400-994ef7ce2a80'),
	(96,8,'Single: Images','singleImages','global','',0,'Assets','{\"useSingleFolder\":1,\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":1,\"allowedKinds\":[\"image\"],\"limit\":\"\",\"viewMode\":\"list\",\"selectionLabel\":\"Add an Image\"}','2017-02-21 21:30:14','2017-02-21 21:30:14','22eabf42-54af-421e-afb4-8f0bc679b8de'),
	(97,8,'Single: Label','singleLabel','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-02-21 21:30:14','2017-02-21 21:30:14','e74fa9f5-c342-4111-9006-25af33da7f5a'),
	(98,8,'Single: Quote','singleQuote','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":1,\"initialRows\":4}','2017-02-21 21:30:14','2017-02-21 21:30:14','04f7fdc3-6db5-4be8-920a-a85a2ffa3416'),
	(99,8,'Single: Rich Text','singleRichText','global','',0,'RichText','{\"configFile\":\"Custom.json\",\"availableAssetSources\":\"*\",\"availableTransforms\":\"*\",\"cleanupHtml\":1,\"purifyHtml\":1,\"columnType\":\"text\"}','2017-02-21 21:30:14','2017-02-21 21:30:14','b5a17117-4560-41a5-b323-501d5d248342'),
	(100,8,'Single: Source','singleSource','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-02-21 21:30:15','2017-02-21 21:30:15','5a491716-81f2-4cf4-bae2-ba33809f0fff'),
	(101,8,'Single: Source Url','singleSourceUrl','global','',0,'FruitLinkIt','{\"types\":[\"custom\"],\"defaultText\":\"\",\"allowCustomText\":1,\"allowTarget\":\"\",\"entrySources\":[],\"entrySelectionLabel\":\"Select an entry\",\"assetSources\":\"*\",\"assetSelectionLabel\":\"Select an asset\",\"categorySources\":\"*\",\"categorySelectionLabel\":\"Select a category\"}','2017-02-21 21:30:15','2017-02-21 21:30:15','3a6d6bd1-e43b-4fbe-af40-2e1af1988990'),
	(102,8,'Single: Subline','singleSubline','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-02-21 21:30:15','2017-02-21 21:30:15','778777d8-4748-4c37-a974-ed9f1aa32fb2'),
	(103,8,'Single: Text','singleText','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-02-21 21:30:15','2017-02-21 21:30:15','774f5e40-b8aa-4c0b-b123-4bb24978e0c2'),
	(104,3,'Content Builder: Neo','contentBuilderNeo','global','',0,'Neo','{\"maxBlocks\":null}','2017-02-21 21:30:15','2017-02-21 21:30:15','9172ad61-ae3c-4788-a854-ba4abbb9ba0f');

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
	(5,'Social Networks','socialNetworks',56,'2017-02-21 21:30:15','2017-02-21 21:30:15','d10f0363-6bb3-4fb2-8063-00310021d9af');

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
	(1,'2.6.2962','2.6.9',2,'SITE_NAME','http://craftcms.fredmansky.dev','UTC',1,0,'2017-02-21 21:25:00','2017-02-21 21:29:40','0c1df341-4676-48c4-b3d5-1fc36ed7a3ba');

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
	('en',2,'2017-02-21 21:29:49','2017-02-21 21:29:49','e062f68a-8e52-40cd-9388-9aae7564f4cf');

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
	(1,NULL,'m000000_000000_base','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','79c5b920-681d-4d01-9335-986fe51de09e'),
	(2,NULL,'m140730_000001_add_filename_and_format_to_transformindex','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','7eba2fda-98d6-4414-a7cc-55296fb666e8'),
	(3,NULL,'m140815_000001_add_format_to_transforms','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','83ce4776-3aa9-4b89-a24b-1f216b17795f'),
	(4,NULL,'m140822_000001_allow_more_than_128_items_per_field','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','bb1d735d-d120-4c48-a77a-4fae0f611a83'),
	(5,NULL,'m140829_000001_single_title_formats','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','0e494cf6-8ce1-4667-a15c-58e2ce47f424'),
	(6,NULL,'m140831_000001_extended_cache_keys','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','21339ae8-8578-4389-b137-0f78ddf6a9ef'),
	(7,NULL,'m140922_000001_delete_orphaned_matrix_blocks','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','d60d71e8-073e-4508-8dd0-7571506842fa'),
	(8,NULL,'m141008_000001_elements_index_tune','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','b2320cb4-836b-475e-86ad-3c8e4a8b4a29'),
	(9,NULL,'m141009_000001_assets_source_handle','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','a3d9f760-676c-464f-b779-859ccf7bda67'),
	(10,NULL,'m141024_000001_field_layout_tabs','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','139598b5-cb74-492b-aa27-ce925de8ebdd'),
	(11,NULL,'m141030_000000_plugin_schema_versions','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','bfa7cdb9-5e6c-4c88-a52f-6c5c4d42fa11'),
	(12,NULL,'m141030_000001_drop_structure_move_permission','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','90d140bc-8a20-4829-8cd9-6b6f102ab7c5'),
	(13,NULL,'m141103_000001_tag_titles','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','55018872-639d-409f-bacd-491b22823638'),
	(14,NULL,'m141109_000001_user_status_shuffle','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','65c8f970-9b5c-405b-921f-440d6aadb8bb'),
	(15,NULL,'m141126_000001_user_week_start_day','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','cad00337-69f9-490d-b224-ef5610ad2ae3'),
	(16,NULL,'m150210_000001_adjust_user_photo_size','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','76a65c73-2116-4daa-9096-94e71fe149c7'),
	(17,NULL,'m150724_000001_adjust_quality_settings','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','bed72933-d55f-4eaf-8d0e-006b9adbd62e'),
	(18,NULL,'m150827_000000_element_index_settings','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','7b433e1f-be1c-4055-8404-c54a4eeb414f'),
	(19,NULL,'m150918_000001_add_colspan_to_widgets','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','ad6aa721-873f-4c90-b8b5-861b34d5c9d0'),
	(20,NULL,'m151007_000000_clear_asset_caches','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','033e8dcb-4484-45c5-ba47-be93a0b9715b'),
	(21,NULL,'m151109_000000_text_url_formats','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','d2d47f3f-6d3e-41c6-ad42-122ad73a7b6b'),
	(22,NULL,'m151110_000000_move_logo','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','c9f585ad-9f01-4c3e-b0b1-6573fb284cf4'),
	(23,NULL,'m151117_000000_adjust_image_widthheight','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','473a8498-db72-4e43-b0a1-04dcaf94108e'),
	(24,NULL,'m151127_000000_clear_license_key_status','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','d2a7b483-15b1-4341-a764-c2f3e02e98da'),
	(25,NULL,'m151127_000000_plugin_license_keys','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','e2f8f9a3-a7fe-4cf6-8259-18f8f99b7207'),
	(26,NULL,'m151130_000000_update_pt_widget_feeds','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','f76bd438-31de-4311-adeb-d09243b6c66a'),
	(27,NULL,'m160114_000000_asset_sources_public_url_default_true','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','a253ddac-4633-4e08-967d-248a8d2e404a'),
	(28,NULL,'m160223_000000_sortorder_to_smallint','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','0d01dc96-2ba8-4a72-9d80-4cf39fcc0a11'),
	(29,NULL,'m160229_000000_set_default_entry_statuses','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','1919bd9e-b353-4534-a29c-91a56316b012'),
	(30,NULL,'m160304_000000_client_permissions','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','36f94abb-6900-49a6-b9d2-5f986cb1bc0d'),
	(31,NULL,'m160322_000000_asset_filesize','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','5ad7cb32-104a-420d-b8f5-9db1b146bee5'),
	(32,NULL,'m160503_000000_orphaned_fieldlayouts','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','db53f774-d543-4c34-a6d6-46e1e38f6675'),
	(33,NULL,'m160510_000000_tasksettings','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','0cf10395-8c9c-444c-b1fd-4b8a7718c40d'),
	(34,NULL,'m160829_000000_pending_user_content_cleanup','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','e290b911-6ecc-4b43-920e-3be9ba3b216b'),
	(35,NULL,'m160830_000000_asset_index_uri_increase','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','07854dfd-0550-4c79-9db0-7d7fd305865a'),
	(36,NULL,'m160919_000000_usergroup_handle_title_unique','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','782c9881-ec46-4f13-9d6c-57467e8b1ac4'),
	(37,NULL,'m161108_000000_new_version_format','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','50f5848c-7dac-4302-9e29-f6a7c5693dc4'),
	(38,NULL,'m161109_000000_index_shuffle','2017-02-21 21:25:01','2017-02-21 21:25:01','2017-02-21 21:25:01','78da2dc1-64f8-43ca-9779-4d8c005434f6'),
	(39,1,'m140516_000000_cpCss_changeSettingsFieldName','2017-02-21 21:28:24','2017-02-21 21:28:24','2017-02-21 21:28:24','627e5242-8f30-4c74-87ef-a84e43d0402d'),
	(40,5,'m160208_010101_FruitLinkIt_UpdateExistingLinkItFields','2017-02-21 21:28:31','2017-02-21 21:28:31','2017-02-21 21:28:31','ab0b6e83-43c5-4e1f-8add-7a6abf35d984'),
	(41,7,'m160428_202308_Neo_UpdateBlockLevels','2017-02-21 21:28:35','2017-02-21 21:28:35','2017-02-21 21:28:35','b7210762-5019-4f5d-91e8-0f946eb7fcee'),
	(42,7,'m160515_005002_Neo_UpdateBlockStructure','2017-02-21 21:28:35','2017-02-21 21:28:35','2017-02-21 21:28:35','18e69826-41b2-47a1-b021-be50eb09b56b'),
	(43,7,'m160605_191540_Neo_UpdateBlockStructureLocales','2017-02-21 21:28:35','2017-02-21 21:28:35','2017-02-21 21:28:35','c14b5f7d-dcc6-49a5-9541-6928a17eaa57'),
	(44,7,'m161029_230849_Neo_AddMaxChildBlocksSetting','2017-02-21 21:28:35','2017-02-21 21:28:35','2017-02-21 21:28:35','3de4c8b9-aa6d-4e8c-b2c5-ed799ef07099'),
	(45,9,'m160426_020311_retour_FixIndexes','2017-02-21 21:28:44','2017-02-21 21:28:44','2017-02-21 21:28:44','34881270-3d7a-4030-8c0d-7745a434d982'),
	(46,9,'m160427_000000_retour_addHandledStats','2017-02-21 21:28:44','2017-02-21 21:28:44','2017-02-21 21:28:44','0e9a66ac-ed92-4702-9b9e-481185d42ff5'),
	(47,9,'m160514_000000_retour_convertToElementId','2017-02-21 21:28:44','2017-02-21 21:28:44','2017-02-21 21:28:44','da4ceeff-814c-4cda-a147-a1021d090adb'),
	(48,9,'m160704_000000_retour_addReferrerStats','2017-02-21 21:28:44','2017-02-21 21:28:44','2017-02-21 21:28:44','7419d9cf-9ee6-4082-8b41-d8057d84e10d'),
	(49,11,'m151225_000000_seomatic_addHumansField','2017-02-21 21:28:55','2017-02-21 21:28:55','2017-02-21 21:28:55','d866db4e-de4d-4374-84e6-ea331969ba56'),
	(50,11,'m151226_000000_seomatic_addTwitterFacebookFields','2017-02-21 21:28:55','2017-02-21 21:28:55','2017-02-21 21:28:55','5d9a92d7-78ba-476a-859b-72c5d3c09ad0'),
	(51,11,'m160101_000000_seomatic_addRobotsFields','2017-02-21 21:28:55','2017-02-21 21:28:55','2017-02-21 21:28:55','f9eca167-0073-4ed4-9cf4-c5c6f8d13ad7'),
	(52,11,'m160111_000000_seomatic_addTitleFields','2017-02-21 21:28:55','2017-02-21 21:28:55','2017-02-21 21:28:55','299198b1-4a16-42fd-b5fa-cc03de87ed28'),
	(53,11,'m160122_000000_seomatic_addTypeFields','2017-02-21 21:28:55','2017-02-21 21:28:55','2017-02-21 21:28:55','a7ef5603-5bf0-42be-9bc9-8a7b3fd1d0e5'),
	(54,11,'m160123_000000_seomatic_addOpeningHours','2017-02-21 21:28:55','2017-02-21 21:28:55','2017-02-21 21:28:55','110085f0-b46e-4b3b-913f-3d3da4320b64'),
	(55,11,'m160202_000000_seomatic_addSocialHandles','2017-02-21 21:28:55','2017-02-21 21:28:55','2017-02-21 21:28:55','b755f0ad-dc0b-45ba-9133-70fcfa0c1a50'),
	(56,11,'m160204_000000_seomatic_addGoogleAnalytics','2017-02-21 21:28:55','2017-02-21 21:28:55','2017-02-21 21:28:55','b68825ba-7c4f-4910-8e7c-51a7ea0a9840'),
	(57,11,'m160205_000000_seomatic_addResturantMenu','2017-02-21 21:28:55','2017-02-21 21:28:55','2017-02-21 21:28:55','a44113e9-792e-4e55-906c-f53575d89790'),
	(58,11,'m160206_000000_seomatic_addGoogleAnalyticsPlugins','2017-02-21 21:28:55','2017-02-21 21:28:55','2017-02-21 21:28:55','88104068-eab4-45ea-aaca-d10ad206531f'),
	(59,11,'m160206_000000_seomatic_addGoogleAnalyticsSendPageView','2017-02-21 21:28:55','2017-02-21 21:28:55','2017-02-21 21:28:55','36c6201c-e21c-4d4d-8e8e-374a88372692'),
	(60,11,'m160209_000000_seomatic_alterDescriptionsColumns','2017-02-21 21:28:55','2017-02-21 21:28:55','2017-02-21 21:28:55','91a76ae9-db1e-4e5a-9ad9-92ca49375ec4'),
	(61,11,'m160209_000001_seomatic_addRobotsTxt','2017-02-21 21:28:55','2017-02-21 21:28:55','2017-02-21 21:28:55','0a856578-c13d-4494-843c-7ab037eed12f'),
	(62,11,'m160227_000000_seomatic_addFacebookAppId','2017-02-21 21:28:55','2017-02-21 21:28:55','2017-02-21 21:28:55','ecb2e926-e258-49d3-b7c9-76f91497b8f5'),
	(63,11,'m160416_000000_seomatic_addContactPoints','2017-02-21 21:28:55','2017-02-21 21:28:55','2017-02-21 21:28:55','53f64028-88d4-4c40-82db-01e7edb06597'),
	(64,11,'m160509_000000_seomatic_addSiteLinksBing','2017-02-21 21:28:55','2017-02-21 21:28:55','2017-02-21 21:28:55','a9e4fc09-b340-421f-a8aa-b6b0600c07c0'),
	(65,11,'m160707_000000_seomatic_addGoogleTagManager','2017-02-21 21:28:55','2017-02-21 21:28:55','2017-02-21 21:28:55','af764722-3e72-42e9-a2b1-0fa7ca0c62cc'),
	(66,11,'m160715_000000_seomatic_addSeoImageTransforms','2017-02-21 21:28:55','2017-02-21 21:28:55','2017-02-21 21:28:55','63963b18-52d0-49aa-b1a4-9fe4e810449e'),
	(67,11,'m160723_000000_seomatic_addSeoMainEntityOfPage','2017-02-21 21:28:55','2017-02-21 21:28:55','2017-02-21 21:28:55','e33ba120-e767-47b9-8f58-6ee0b6543aca'),
	(68,11,'m160724_000000_seomatic_addSeoMainEntityCategory','2017-02-21 21:28:55','2017-02-21 21:28:55','2017-02-21 21:28:55','773e0511-25a7-4416-ad54-37ae17504758'),
	(69,11,'m160811_000000_seomatic_addVimeo','2017-02-21 21:28:55','2017-02-21 21:28:55','2017-02-21 21:28:55','969a85af-e1a9-46e1-be0e-35c989359e48'),
	(70,11,'m160904_000000_seomatic_addTwitterFacebookImages','2017-02-21 21:28:55','2017-02-21 21:28:55','2017-02-21 21:28:55','835e2271-b8c9-4a28-9441-cfdfd95ddebc'),
	(71,11,'m161220_000000_seomatic_addPriceRange','2017-02-21 21:28:55','2017-02-21 21:28:55','2017-02-21 21:28:55','601b4e4a-4129-4b87-a034-f2ac92b8e4cd'),
	(72,11,'m170212_000000_seomatic_addGoogleAnalyticsAnonymizeIp','2017-02-21 21:28:55','2017-02-21 21:28:55','2017-02-21 21:28:55','cc806531-80a8-4adb-b62b-7a180a302c5c'),
	(73,11,'m170212_000000_seomatic_addWikipedia','2017-02-21 21:28:55','2017-02-21 21:28:55','2017-02-21 21:28:55','66139fb0-cbac-4bf5-a24c-ff0c9a99a1b5'),
	(74,12,'m150901_144609_superTable_fixForContentTables','2017-02-21 21:29:03','2017-02-21 21:29:03','2017-02-21 21:29:03','e01713da-c86c-42e5-8a23-bf32763ed217');

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
	(1,104,29,'Content Section','contentSection',NULL,NULL,'',1,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','0e8e9073-26d0-4835-afc2-d5e4f7e43127'),
	(2,104,30,'Headline','headline',NULL,NULL,'',1,3,'2017-02-21 21:30:15','2017-02-21 21:30:15','e44cc173-b209-4a19-9f54-b374f0af3c14'),
	(3,104,31,'Rich Text','richText',NULL,2,'',1,4,'2017-02-21 21:30:15','2017-02-21 21:30:15','05cac5e3-a182-4869-94a0-e4217124f721'),
	(4,104,32,'Rich Text Marginals','richTextMarginals',NULL,2,'[\"marginalColumn\"]',1,5,'2017-02-21 21:30:15','2017-02-21 21:30:15','c760a34a-4fbd-4f2f-945d-e619eca11fb2'),
	(5,104,33,'Marginal Column','marginalColumn',NULL,1,'[\"quote\",\"imageSingle\"]',0,6,'2017-02-21 21:30:15','2017-02-21 21:30:15','de970d11-5828-49c6-828d-ae0484bbf19c'),
	(6,104,34,'Quote','quote',NULL,NULL,'',1,7,'2017-02-21 21:30:15','2017-02-21 21:30:15','ff01243b-1277-4bac-a0c1-89b8cd041f58'),
	(7,104,35,'Image Cover','imageCover',NULL,NULL,'',1,9,'2017-02-21 21:30:15','2017-02-21 21:30:15','a1d53e91-bb4f-4f08-b080-48ec6c0586b5'),
	(8,104,36,'Image Gallery','imageGallery',NULL,NULL,'',1,10,'2017-02-21 21:30:15','2017-02-21 21:30:15','155ebc47-cdd3-47af-8c0f-7228e1c522a4'),
	(9,104,37,'Image Grid','imageGrid',NULL,NULL,'',1,11,'2017-02-21 21:30:15','2017-02-21 21:30:15','8364d609-2369-492d-b541-9f0ba4f49169'),
	(10,104,38,'Image Single','imageSingle',NULL,NULL,'',1,12,'2017-02-21 21:30:15','2017-02-21 21:30:15','2935578f-aa87-45e6-9b9f-5c065f97edcd'),
	(11,104,39,'Image Slider','imageSlider',NULL,NULL,'',1,13,'2017-02-21 21:30:15','2017-02-21 21:30:15','99ed428c-ae5f-4c5a-b0db-18d9de7b43b5'),
	(12,104,40,'Button','button',NULL,NULL,'',1,15,'2017-02-21 21:30:15','2017-02-21 21:30:15','c9ffacd6-bbe0-424d-97e5-ca758b9e62e1'),
	(13,104,41,'Button Group','buttonGroup',NULL,5,'',1,16,'2017-02-21 21:30:15','2017-02-21 21:30:15','aba8c89c-3429-4cd4-b166-f3f4be940041'),
	(14,104,42,'Accordion','accordion',NULL,NULL,'[\"accordionContent\"]',1,18,'2017-02-21 21:30:15','2017-02-21 21:30:15','39c71d8a-02fe-4715-9bd0-50ba9f674027'),
	(15,104,43,'Accordion Content','accordionContent',NULL,NULL,'[\"headline\",\"richText\",\"richTextMarginals\",\"quote\",\"imageGallery\",\"imageGrid\",\"imageSingle\",\"button\",\"buttonGroup\",\"twoColumns\",\"definitionList\",\"embed\",\"separator\",\"imageText\"]',0,19,'2017-02-21 21:30:15','2017-02-21 21:30:15','8d681d3f-f4e1-4be4-8e88-0908767afcb8'),
	(16,104,44,'Two Columns','twoColumns',NULL,2,'[\"column\"]',1,20,'2017-02-21 21:30:15','2017-02-21 21:30:15','2d25fdae-d55d-453d-bbf9-705befd1ce6e'),
	(17,104,45,'Column','column',NULL,NULL,'[\"headline\",\"richText\",\"quote\",\"imageGallery\",\"imageGrid\",\"imageSingle\",\"button\",\"buttonGroup\",\"accordion\",\"definitionList\",\"embed\",\"separator\"]',0,21,'2017-02-21 21:30:15','2017-02-21 21:30:15','b9e8f725-b23c-431d-87b1-aa3530eae5f1'),
	(18,104,46,'Definition List','definitionList',NULL,NULL,'',1,23,'2017-02-21 21:30:15','2017-02-21 21:30:15','cd036e4a-4763-423f-8905-021f940278a3'),
	(19,104,47,'Embed','embed',NULL,NULL,'',1,24,'2017-02-21 21:30:15','2017-02-21 21:30:15','5d9f9219-c773-45ff-b695-523d55d070b2'),
	(20,104,48,'Separator','separator',NULL,NULL,'',1,25,'2017-02-21 21:30:15','2017-02-21 21:30:15','efecfce7-281c-4cbd-a9c2-c2b74eaf8102'),
	(21,104,49,'Image + Text','imageText',NULL,1,'[\"buttonGroup\"]',1,27,'2017-02-21 21:30:15','2017-02-21 21:30:15','e6f6132c-a5bc-4b59-8d7a-fefadd6219ac');

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
	(1,104,'Text Modules',2,'2017-02-21 21:30:15','2017-02-21 21:30:15','0997577d-6682-4272-81a8-be058561d416'),
	(2,104,'Image Modules',8,'2017-02-21 21:30:15','2017-02-21 21:30:15','0658e797-3417-4d65-ac81-ac4e4b47f156'),
	(3,104,'Button Modules',14,'2017-02-21 21:30:15','2017-02-21 21:30:15','d1e51004-0f58-48e8-8cb2-32a55d820057'),
	(4,104,'Content Wrapper',17,'2017-02-21 21:30:15','2017-02-21 21:30:15','10ff12cd-cadf-4223-8174-ffc619d9e7ec'),
	(5,104,'More Modules…',22,'2017-02-21 21:30:15','2017-02-21 21:30:15','62034561-add1-4d48-b343-225989d9199f'),
	(6,104,'NOT READY YET',26,'2017-02-21 21:30:15','2017-02-21 21:30:15','fb4dd6ed-7185-4973-916c-cc0af3aa1a5e');

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
	(1,'CpCss','1.1.1','1.1.0',NULL,'unknown',1,'{\"cssFile\":\"\",\"additionalCss\":\"#footer {\\r\\n  margin-top: 50vh;\\r\\n}\\r\\n\\r\\n.blocks .matrixblock {\\r\\n  width: calc(94% - 28px);\\r\\n  margin-left: 6%;\\r\\n}\\r\\n\\r\\n\\r\\n.blocks .mc-solid-contentSection {\\r\\n  width: calc(100% - 28px);\\r\\n  margin-top: 40px;\\r\\n  margin-left: 0;\\r\\n}\\r\\n\\r\\n.blocks .mc-solid-accordionLabel {\\r\\n  width: calc(97% - 28px);\\r\\n  margin-top: 20px;\\r\\n  margin-left: 3%;\\r\\n}\\r\\n\\r\\n.blocks .matrixblock:first-child {\\r\\n  margin-top: 10px;\\r\\n}\\r\\n\\r\\n.ni_blocks .ni_block:first-child {\\r\\n  margin-top: 10px;\\r\\n}\\r\\n\\r\\n\\r\\n.ni_blocks .ni_block {\\r\\n  width: 95%;\\r\\n  margin-left: 5%;\\r\\n}\\r\\n\\r\\n.ni_blocks .ni_block--contentSection,\\r\\n.ni_block_children .ni_block {\\r\\n  width: 100%;\\r\\n  margin-left: 0%;\\r\\n}\\r\\n\\r\\n.ni_block--contentSection .ni_block_topbar {\\r\\n  height: 40px;\\r\\n  line-height: 40px;\\r\\n  background-color: #E4E5E6;\\r\\n}\\r\\n\\r\\n.ni_block--contentSection .ni_block_topbar_item.tabs .tab {\\r\\n  height: 40px;\\r\\n}\\r\\n\"}','2017-02-21 21:28:24','2017-02-21 21:28:24','2017-02-21 21:29:37','e2a94690-c558-46fd-8eb8-f34abbf46d49'),
	(2,'FocalPointField','1.0.2',NULL,NULL,'unknown',1,NULL,'2017-02-21 21:28:26','2017-02-21 21:28:26','2017-02-21 21:29:37','5cd46ae4-6d5e-4cf9-906b-59d76c0df074'),
	(3,'Imager','1.4.0','1.0.0',NULL,'unknown',1,NULL,'2017-02-21 21:28:27','2017-02-21 21:28:27','2017-02-21 21:29:37','e8c5d9c3-8d01-42be-9e43-944ce0782720'),
	(4,'Kint','1.1.0','1.0.0',NULL,'unknown',1,NULL,'2017-02-21 21:28:29','2017-02-21 21:28:29','2017-02-21 21:29:37','34ea7f07-03d2-4970-addf-b7be9fa3c6cf'),
	(5,'FruitLinkIt','2.3.4','2.3.0',NULL,'unknown',1,NULL,'2017-02-21 21:28:31','2017-02-21 21:28:31','2017-02-21 21:29:37','111e40c1-89eb-4f35-a041-670450819069'),
	(6,'Minify','1.1.1','1.0.0',NULL,'unknown',1,NULL,'2017-02-21 21:28:33','2017-02-21 21:28:33','2017-02-21 21:29:37','aca690f8-4b51-43b2-a0d9-33a4dc4b5c9b'),
	(7,'Neo','1.4.1','1.4.1',NULL,'unknown',1,NULL,'2017-02-21 21:28:35','2017-02-21 21:28:35','2017-02-21 21:29:37','9f4d2780-61f9-48cc-a3c5-426c1e018255'),
	(8,'PreparseField','0.3.6','1.0.0',NULL,'unknown',1,NULL,'2017-02-21 21:28:37','2017-02-21 21:28:37','2017-02-21 21:29:37','214aeaef-a378-42b0-ad82-21f12475346d'),
	(9,'Retour','1.0.19','1.0.4',NULL,'unknown',1,NULL,'2017-02-21 21:28:44','2017-02-21 21:28:44','2017-02-21 21:29:37','0b3cd184-c95d-4ec1-9a34-4389a236f91b'),
	(10,'Sitemap','v1.0.0-alpha.4',NULL,NULL,'unknown',1,NULL,'2017-02-21 21:28:51','2017-02-21 21:28:51','2017-02-21 21:29:37','3bf9d449-a89d-4852-99af-0c0cb5d92b87'),
	(11,'Seomatic','1.1.42','1.1.25',NULL,'unknown',1,NULL,'2017-02-21 21:28:55','2017-02-21 21:28:55','2017-02-21 21:29:37','4aa0377d-c306-4ddd-ba68-765bca48bdc3'),
	(12,'SuperTable','1.0.2','1.0.0',NULL,'unknown',1,NULL,'2017-02-21 21:29:03','2017-02-21 21:29:03','2017-02-21 21:29:37','e086f775-3e1c-421d-9398-07839f26357d'),
	(13,'TaskManager','0.4.3',NULL,NULL,'unknown',1,NULL,'2017-02-21 21:29:05','2017-02-21 21:29:05','2017-02-21 21:29:37','177dd52d-a700-4a8e-9bf0-335b663b9c3d'),
	(14,'TheArchitect','1.6.0','1.6.0',NULL,'unknown',1,NULL,'2017-02-21 21:29:07','2017-02-21 21:29:07','2017-02-21 21:29:37','a63a63a4-a1d3-4c9d-ab00-60a97d1d3954');

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



# Export von Tabelle craft_retour_redirects
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_retour_redirects`;

CREATE TABLE `craft_retour_redirects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `associatedElementId` int(11) NOT NULL,
  `redirectSrcUrl` text COLLATE utf8_unicode_ci,
  `redirectSrcUrlParsed` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `redirectMatchType` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'match',
  `redirectDestUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `redirectHttpCode` int(10) DEFAULT '301',
  `hitCount` int(10) DEFAULT '0',
  `hitLastTime` datetime DEFAULT '2017-02-21 21:28:44',
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_retour_redirects_redirectSrcUrlParsed_unq_idx` (`redirectSrcUrlParsed`),
  KEY `craft_retour_redirects_locale_associatedElementId_idx` (`locale`,`associatedElementId`),
  KEY `craft_retour_redirects_associatedElementId_fk` (`associatedElementId`),
  CONSTRAINT `craft_retour_redirects_associatedElementId_fk` FOREIGN KEY (`associatedElementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_retour_redirects_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_retour_static_redirects
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_retour_static_redirects`;

CREATE TABLE `craft_retour_static_redirects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `redirectSrcUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `redirectSrcUrlParsed` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `redirectMatchType` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'match',
  `redirectDestUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `redirectHttpCode` int(10) DEFAULT '301',
  `hitCount` int(10) DEFAULT '0',
  `hitLastTime` datetime DEFAULT '2017-02-21 21:28:44',
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `associatedElementId` int(10) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_retour_static_redirects_redirectSrcUrlParsed_unq_idx` (`redirectSrcUrlParsed`),
  KEY `craft_retour_static_redirects_locale_id_idx` (`locale`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_retour_stats
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_retour_stats`;

CREATE TABLE `craft_retour_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `redirectSrcUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `referrerUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `hitCount` int(10) DEFAULT '0',
  `hitLastTime` datetime DEFAULT '2017-02-21 21:28:45',
  `handledByRetour` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_retour_stats_redirectSrcUrl_unq_idx` (`redirectSrcUrl`),
  KEY `craft_retour_stats_hitCount_id_idx` (`hitCount`,`id`)
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
	(1,'username',0,'de',' davidhellmann '),
	(1,'firstname',0,'de',' david '),
	(1,'lastname',0,'de',' hellmann '),
	(1,'fullname',0,'de',' david hellmann '),
	(1,'email',0,'de',' david fredmansky at '),
	(1,'slug',0,'de',''),
	(5,'slug',0,'en',''),
	(5,'field',4,'en',''),
	(4,'slug',0,'en',' homepage '),
	(4,'title',0,'en',' homepage ');

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
	(3,NULL,'Homepage','homepage','single',1,'index',0,'2017-02-21 21:30:09','2017-02-21 21:30:09','a4e3080a-028d-4695-998c-a43da7be9ff0'),
	(4,NULL,'News','news','channel',1,'news/_entry',0,'2017-02-21 21:30:09','2017-02-21 21:30:09','71e89540-9e60-47d2-8dac-1b27c3bbc0a0');

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
	(3,3,'en',1,'__home__',NULL,'2017-02-21 21:30:09','2017-02-21 21:30:09','492fa712-3688-4470-b7fb-a855a2ab4bc9'),
	(4,4,'en',1,'news/{postDate.year}/{slug}',NULL,'2017-02-21 21:30:09','2017-02-21 21:30:09','5f6ea072-d332-47b4-91b9-f433fd5685ab');

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

LOCK TABLES `craft_seomatic_settings` WRITE;
/*!40000 ALTER TABLE `craft_seomatic_settings` DISABLE KEYS */;

INSERT INTO `craft_seomatic_settings` (`id`, `siteSeoImageId`, `siteSeoTwitterImageId`, `siteSeoFacebookImageId`, `genericOwnerImageId`, `genericCreatorImageId`, `locale`, `siteSeoName`, `siteSeoTitle`, `siteSeoTitleSeparator`, `siteSeoTitlePlacement`, `siteSeoDescription`, `siteSeoKeywords`, `siteSeoImageTransform`, `siteSeoFacebookImageTransform`, `siteSeoTwitterImageTransform`, `siteTwitterCardType`, `siteOpenGraphType`, `siteRobots`, `siteRobotsTxt`, `siteLinksSearchTargets`, `siteLinksQueryInput`, `googleSiteVerification`, `bingSiteVerification`, `googleAnalyticsUID`, `googleTagManagerID`, `googleAnalyticsSendPageview`, `googleAnalyticsAdvertising`, `googleAnalyticsEcommerce`, `googleAnalyticsEEcommerce`, `googleAnalyticsLinkAttribution`, `googleAnalyticsLinker`, `googleAnalyticsAnonymizeIp`, `siteOwnerType`, `siteOwnerSubType`, `siteOwnerSpecificType`, `genericOwnerName`, `genericOwnerAlternateName`, `genericOwnerDescription`, `genericOwnerUrl`, `genericOwnerTelephone`, `genericOwnerEmail`, `genericOwnerStreetAddress`, `genericOwnerAddressLocality`, `genericOwnerAddressRegion`, `genericOwnerPostalCode`, `genericOwnerAddressCountry`, `genericOwnerGeoLatitude`, `genericOwnerGeoLongitude`, `organizationOwnerDuns`, `organizationOwnerFounder`, `organizationOwnerFoundingDate`, `organizationOwnerFoundingLocation`, `organizationOwnerContactPoints`, `localBusinessPriceRange`, `localBusinessOwnerOpeningHours`, `corporationOwnerTickerSymbol`, `restaurantOwnerServesCuisine`, `restaurantOwnerMenuUrl`, `restaurantOwnerReservationsUrl`, `personOwnerGender`, `personOwnerBirthPlace`, `twitterHandle`, `facebookHandle`, `facebookProfileId`, `facebookAppId`, `linkedInHandle`, `googlePlusHandle`, `youtubeHandle`, `youtubeChannelHandle`, `instagramHandle`, `pinterestHandle`, `githubHandle`, `vimeoHandle`, `wikipediaUrl`, `siteCreatorType`, `siteCreatorSubType`, `siteCreatorSpecificType`, `genericCreatorName`, `genericCreatorAlternateName`, `genericCreatorDescription`, `genericCreatorUrl`, `genericCreatorTelephone`, `genericCreatorEmail`, `genericCreatorStreetAddress`, `genericCreatorAddressLocality`, `genericCreatorAddressRegion`, `genericCreatorPostalCode`, `genericCreatorAddressCountry`, `genericCreatorGeoLatitude`, `genericCreatorGeoLongitude`, `organizationCreatorDuns`, `organizationCreatorFounder`, `organizationCreatorFoundingDate`, `organizationCreatorFoundingLocation`, `organizationCreatorContactPoints`, `localBusinessCreatorOpeningHours`, `corporationCreatorTickerSymbol`, `restaurantCreatorServesCuisine`, `restaurantCreatorMenuUrl`, `restaurantCreatorReservationsUrl`, `personCreatorGender`, `personCreatorBirthPlace`, `genericCreatorHumansTxt`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,NULL,NULL,NULL,NULL,'en','SITE_NAME','This is the default global title of the site pages.','|','after','This is the default global natural language description of the content on the site pages.','default,global,comma-separated,keywords','','','','summary','website','','# robots.txt for {{ siteUrl }}\n\nSitemap: {{ siteUrl }}/sitemap.xml\n\n# Don\'t allow web crawlers to index Craft\n\nUser-agent: *\nDisallow: /craft/\n','','','','','','',1,0,0,0,0,0,0,'Organization','Corporation','','SITE_NAME','','','http://craftcms.fredmansky.dev/','','','','','','','','','','','','','','','$$$','','','','','','','','','','','','','','','','','','','','','Organization','Corporation','','','','','','','','','','','','','','','','','','','','','','','','','','','/* TEAM */\n\n{% if seomaticCreator.name is defined and seomaticCreator.name %}\nCreator: {{ seomaticCreator.name }}\n{% endif %}\n{% if seomaticCreator.url is defined and seomaticCreator.url %}\nURL: {{ seomaticCreator.url }}\n{% endif %}\n{% if seomaticCreator.description is defined and seomaticCreator.description %}\nDescription: {{ seomaticCreator.description }}\n{% endif %}\n\n/* THANKS */\n\nPixel & Tonic - https://pixelandtonic.com\n\n/* SITE */\n\nStandards: HTML5, CSS3\nComponents: Craft CMS, Yii, PHP, Javascript, SEOmatic','2017-02-21 21:33:13','2017-02-21 21:33:13','ac81ee2a-e351-454b-ae56-750c6a201883');

/*!40000 ALTER TABLE `craft_seomatic_settings` ENABLE KEYS */;
UNLOCK TABLES;


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
	(1,1,'ce7c0c88653f037475a16d5b4dcf71755bd12157czozMjoibWJZd2R4UHhVZTNzRDlwc2tXZUJpVnNMemZjR2F6NUsiOw==','2017-02-21 21:25:05','2017-02-21 21:25:05','da955d5e-fe4a-43b2-97ae-4442b6b14290');

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
	(1,NULL,'2017-02-21 21:30:10','2017-02-21 21:30:15','ab9bf0ec-57a6-4f22-b0be-0cb9f704c311');

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
	(1,4,13,'2017-02-21 21:30:10','2017-02-21 21:30:10','36f821db-2c65-4ecf-bd43-2396cc1e159d'),
	(2,18,14,'2017-02-21 21:30:10','2017-02-21 21:30:10','0deb2948-d845-4be1-ac92-63dd9093ab20'),
	(3,24,15,'2017-02-21 21:30:11','2017-02-21 21:30:11','34980645-68f9-4e62-a52b-a5db68e2636a'),
	(4,31,16,'2017-02-21 21:30:11','2017-02-21 21:30:11','93ca8254-0261-4078-af91-4d5e209a0f91'),
	(5,34,17,'2017-02-21 21:30:11','2017-02-21 21:30:11','c6e769d6-d74d-43b0-983c-ce833e892aa1'),
	(6,37,18,'2017-02-21 21:30:11','2017-02-21 21:30:11','0a5745ee-5602-4edd-b296-3b86d3beea84'),
	(7,42,19,'2017-02-21 21:30:11','2017-02-21 21:30:12','53de6099-2db8-4825-9c96-e556361a58db'),
	(8,46,20,'2017-02-21 21:30:12','2017-02-21 21:30:12','3a317cd8-1e6f-45b4-b0fa-d27eea3df8b8'),
	(9,50,21,'2017-02-21 21:30:12','2017-02-21 21:30:12','b4192fba-422d-4893-a4d3-cd2b7fd2f49b'),
	(10,54,22,'2017-02-21 21:30:12','2017-02-21 21:30:12','602475bf-6746-4db6-b079-58859d80a45e'),
	(11,58,23,'2017-02-21 21:30:12','2017-02-21 21:30:12','5377894c-3f7f-4498-8903-a0c4c7804ae8'),
	(12,63,24,'2017-02-21 21:30:13','2017-02-21 21:30:13','78c1aee8-021d-4892-84b3-ca8801a71a34'),
	(13,77,25,'2017-02-21 21:30:13','2017-02-21 21:30:13','506f284d-c4bb-4fdf-a753-07fc5b133e91'),
	(14,81,26,'2017-02-21 21:30:13','2017-02-21 21:30:14','aa3a6735-ff9e-4cbf-9a82-1954a4f0f07f'),
	(15,85,27,'2017-02-21 21:30:14','2017-02-21 21:30:14','f0784d25-1f26-41ab-99da-172acba73735'),
	(16,89,28,'2017-02-21 21:30:14','2017-02-21 21:30:14','127e6159-028e-4abd-bdc2-cd74de1bb983');

/*!40000 ALTER TABLE `craft_supertableblocktypes` ENABLE KEYS */;
UNLOCK TABLES;


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
  `field_alignment` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_withIcon` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_iconPosition` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'right',
  `field_iconSize` varchar(255) COLLATE utf8_unicode_ci DEFAULT '16px',
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
  `field_alignment` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
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
  `field_columnsRatio` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_layout` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `field_embedPosition` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_embedWidth` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
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
  `field_textVerticalPosition` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_textAlignment` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
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
  `field_columns` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
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
  `field_columns` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
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
  `field_imagePosition` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_imageRatio` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_imageWidth` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
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
  `field_autoplay` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'disabled',
  `field_cellAlign` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_draggable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_freeScroll` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_groupCells` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_imageRatio` varchar(255) COLLATE utf8_unicode_ci DEFAULT '16:10',
  `field_loop` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_pauseOnHover` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_navigation` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_pagination` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_rightToLeft` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_slidesPerView` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_speed` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
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
  `field_paddingVertical` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
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
  `field_marginVertical` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
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
  `field_columnsRatio` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
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
	(1,'email','{\"protocol\":\"php\",\"emailAddress\":\"david@fredmansky.at\",\"senderName\":\"SITE_NAME\"}','2017-02-21 21:25:05','2017-02-21 21:25:05','e2b561d9-0cd0-4c63-ad5c-84946c559ccc');

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

LOCK TABLES `craft_taggroups` WRITE;
/*!40000 ALTER TABLE `craft_taggroups` DISABLE KEYS */;

INSERT INTO `craft_taggroups` (`id`, `name`, `handle`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Default','default',1,'2017-02-21 21:25:05','2017-02-21 21:25:05','2b46d4d7-cc3f-4bc6-9320-4e4d3ce7fa64');

/*!40000 ALTER TABLE `craft_taggroups` ENABLE KEYS */;
UNLOCK TABLES;


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
	(1,'davidhellmann',NULL,'David','Hellmann','david@fredmansky.at','$2y$13$XdeudxRcgdiqby0iPzCIkuwd.RoJB/GdieXO/kHdgMuyfwxEqI4WG',NULL,1,1,0,0,0,0,0,'2017-02-21 21:25:05','::1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2017-02-21 21:25:03','2017-02-21 21:25:03','2017-02-21 21:28:15','a3222b4f-e824-4ab5-a27f-6a450b2c9525');

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
	(1,1,'RecentEntries',1,NULL,NULL,1,'2017-02-21 21:25:08','2017-02-21 21:25:08','29f07aae-8311-495f-a1dc-a547544a3ac9'),
	(2,1,'GetHelp',2,NULL,NULL,1,'2017-02-21 21:25:08','2017-02-21 21:25:08','f3419bf4-ff68-407c-b431-9c2f686c5b90'),
	(3,1,'Updates',3,NULL,NULL,1,'2017-02-21 21:25:08','2017-02-21 21:25:08','bcccfcd5-f3f0-424b-bb1b-b1dc52dd1665'),
	(4,1,'Feed',4,NULL,'{\"url\":\"https:\\/\\/craftcms.com\\/news.rss\",\"title\":\"Craft News\"}',1,'2017-02-21 21:25:08','2017-02-21 21:25:08','80f57cc4-8781-4472-8d7b-32275d1faf52');

/*!40000 ALTER TABLE `craft_widgets` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
