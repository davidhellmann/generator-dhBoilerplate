# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.6.34)
# Datenbank: fm-craftcms
# Erstellt am: 2017-02-23 12:05:28 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Export von Tabelle craft_amforms_content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_amforms_content`;

CREATE TABLE `craft_amforms_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_name` text COLLATE utf8_unicode_ci,
  `field_firstName` text COLLATE utf8_unicode_ci,
  `field_lastName` text COLLATE utf8_unicode_ci,
  `field_website` text COLLATE utf8_unicode_ci,
  `field_emailAddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_telephoneNumber` text COLLATE utf8_unicode_ci,
  `field_mobileNumber` text COLLATE utf8_unicode_ci,
  `field_comment` text COLLATE utf8_unicode_ci,
  `field_reaction` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_amforms_content_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_amforms_content_title_idx` (`title`),
  KEY `craft_amforms_content_locale_fk` (`locale`),
  CONSTRAINT `craft_amforms_content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_amforms_content_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_amforms_exports
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_amforms_exports`;

CREATE TABLE `craft_amforms_exports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total` int(10) DEFAULT '0',
  `totalCriteria` int(10) DEFAULT NULL,
  `finished` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `map` text COLLATE utf8_unicode_ci,
  `criteria` text COLLATE utf8_unicode_ci,
  `submissions` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_amforms_exports_formId_fk` (`formId`),
  CONSTRAINT `craft_amforms_exports_formId_fk` FOREIGN KEY (`formId`) REFERENCES `craft_amforms_forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_amforms_forms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_amforms_forms`;

CREATE TABLE `craft_amforms_forms` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `redirectEntryId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `submitAction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `submitButton` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `afterSubmit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `afterSubmitText` text COLLATE utf8_unicode_ci,
  `submissionEnabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `displayTabTitles` tinyint(1) DEFAULT '0',
  `redirectUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sendCopy` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sendCopyTo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notificationEnabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `notificationFilesEnabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `notificationRecipients` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notificationSubject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmationSubject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notificationSenderName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmationSenderName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notificationSenderEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmationSenderEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notificationReplyToEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `formTemplate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tabTemplate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fieldTemplate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notificationTemplate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmationTemplate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_amforms_forms_fieldLayoutId_fk` (`fieldLayoutId`),
  KEY `craft_amforms_forms_redirectEntryId_fk` (`redirectEntryId`),
  CONSTRAINT `craft_amforms_forms_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_amforms_forms_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_amforms_forms_redirectEntryId_fk` FOREIGN KEY (`redirectEntryId`) REFERENCES `craft_entries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_amforms_notes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_amforms_notes`;

CREATE TABLE `craft_amforms_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submissionId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_amforms_notes_submissionId_fk` (`submissionId`),
  CONSTRAINT `craft_amforms_notes_submissionId_fk` FOREIGN KEY (`submissionId`) REFERENCES `craft_amforms_submissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_amforms_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_amforms_settings`;

CREATE TABLE `craft_amforms_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_amforms_settings_type_handle_unq_idx` (`type`,`handle`),
  KEY `craft_amforms_settings_type_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_amforms_settings` WRITE;
/*!40000 ALTER TABLE `craft_amforms_settings` DISABLE KEYS */;

INSERT INTO `craft_amforms_settings` (`id`, `enabled`, `type`, `name`, `handle`, `value`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,0,'general','Plugin name','pluginName','','2016-11-21 15:16:08','2016-11-21 15:16:08','b681b8dc-badb-4597-ae26-c90efb9558ea'),
	(2,0,'general','Quiet errors','quietErrors','0','2016-11-21 15:16:08','2016-11-21 15:16:08','56c8b4b5-4a42-42b6-bf5b-7e33e0623524'),
	(3,0,'general','Fields per set','fieldsPerSet','8','2016-11-21 15:16:08','2016-11-21 15:16:08','07b08050-58b5-4889-9b12-0d4d44883d11'),
	(4,0,'general','Use Mandrill for email','useMandrillForEmail','0','2016-11-21 15:16:08','2016-11-21 15:16:08','a7021751-bd41-4154-962a-00bba517fd93'),
	(5,0,'general','Bcc email address','bccEmailAddress','','2016-11-21 15:16:08','2016-11-21 15:16:08','b368e659-14f2-4b92-9a4f-b0f1f8f17d1a'),
	(6,0,'export','Delimiter','delimiter',';','2016-11-21 15:16:08','2016-11-21 15:16:08','87c88f86-95c2-45f2-a7a7-a25a1f890cf2'),
	(7,0,'export','Export rows per set','exportRowsPerSet','50','2016-11-21 15:16:08','2016-11-21 15:16:08','eb77961c-6f3d-46af-b6ca-b4d349c0524a'),
	(8,0,'export','Ignore Matrix field and block names','ignoreMatrixFieldAndBlockNames','0','2016-11-21 15:16:08','2016-11-21 15:16:08','6d4ef135-2924-4cc9-a7e3-b5aff0daf72e'),
	(9,0,'antispam','Honeypot enabled','honeypotEnabled','1','2016-11-21 15:16:08','2016-11-21 15:16:08','9b1b184c-5dea-49e7-bb38-e6e9e01f7fbd'),
	(10,0,'antispam','Honeypot name','honeypotName','yourssince1615','2016-11-21 15:16:08','2016-11-21 15:16:08','8fcc4be9-7f4b-4534-81f6-696e717b1ce5'),
	(11,0,'antispam','Time check enabled','timeCheckEnabled','1','2016-11-21 15:16:08','2016-11-21 15:16:08','2c81d019-1f17-4dfa-895a-83fc7d6dd935'),
	(12,0,'antispam','Minimum time in seconds','minimumTimeInSeconds','3','2016-11-21 15:16:08','2016-11-21 15:16:08','195d7c7e-2b52-440f-9d20-1891603a48fd'),
	(13,0,'antispam','Duplicate check enabled','duplicateCheckEnabled','1','2016-11-21 15:16:08','2016-11-21 15:16:08','b2dd50e9-156a-4c48-bbfa-6f0370fab212'),
	(14,0,'antispam','Origin check enabled','originCheckEnabled','1','2016-11-21 15:16:08','2016-11-21 15:16:08','fee0bb83-92ac-48fb-b8c2-4a8ec78e29f6'),
	(15,0,'recaptcha','Google reCAPTCHA enabled','googleRecaptchaEnabled','0','2016-11-21 15:16:08','2016-11-21 15:16:08','0c79a69e-bba4-4663-bd32-cb7655c1049f'),
	(16,0,'recaptcha','Site key','siteKey','','2016-11-21 15:16:08','2016-11-21 15:16:08','c7daba82-2bd1-4928-abe3-f71d8c6b43db'),
	(17,0,'recaptcha','Secret key','secretKey','','2016-11-21 15:16:08','2016-11-21 15:16:08','da11f8d8-7146-4556-8aea-08d0db35e65b'),
	(18,0,'templates','Form template','formTemplate','','2016-11-21 15:16:08','2016-11-21 15:16:08','94fbe636-b415-4ec6-9baf-d52b9ac380b5'),
	(19,0,'templates','Tab template','tabTemplate','','2016-11-21 15:16:08','2016-11-21 15:16:08','079c02ea-d06a-4ae9-9e2b-b8eb2cd21b4d'),
	(20,0,'templates','Field template','fieldTemplate','','2016-11-21 15:16:08','2016-11-21 15:16:08','42613d42-215f-46eb-a547-c4dbe1d2ae93'),
	(21,0,'templates','Notification template','notificationTemplate','','2016-11-21 15:16:08','2016-11-21 15:16:08','6f4ad3c6-b772-467b-9827-d9476c65ee13'),
	(22,0,'export','Ignore Matrix multiple rows','ignoreMatrixMultipleRows','0','2016-12-13 23:36:12','2016-12-13 23:36:12','90688e59-d61a-4518-bfc3-6156b9820097'),
	(23,0,'templates','Confirmation template','confirmationTemplate','','2016-12-13 23:36:13','2016-12-13 23:36:13','795e4d08-7c26-4b98-b2c5-894a6f2b9485');

/*!40000 ALTER TABLE `craft_amforms_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_amforms_submissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_amforms_submissions`;

CREATE TABLE `craft_amforms_submissions` (
  `id` int(11) NOT NULL,
  `formId` int(11) NOT NULL,
  `ipAddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userAgent` text COLLATE utf8_unicode_ci,
  `submittedFrom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_amforms_submissions_formId_fk` (`formId`),
  CONSTRAINT `craft_amforms_submissions_formId_fk` FOREIGN KEY (`formId`) REFERENCES `craft_amforms_forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_amforms_submissions_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_amnav_navs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_amnav_navs`;

CREATE TABLE `craft_amnav_navs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_amnav_navs_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_amnav_nodes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_amnav_nodes`;

CREATE TABLE `craft_amnav_nodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `navId` int(10) NOT NULL,
  `parentId` int(10) DEFAULT NULL,
  `order` int(10) DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `listClass` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blank` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `elementId` int(10) DEFAULT NULL,
  `elementType` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_amnav_nodes_elementId_elementType_locale_idx` (`elementId`,`elementType`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



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
	(1,1,57,'Default','default',1,'','2017-02-21 21:30:10','2017-02-21 21:30:15','7526dab8-dd2a-4861-9b5f-222bf55077e7'),
	(2,2,60,'Settings: Image Slider','settingsImageSlider',0,NULL,'2017-02-23 11:59:41','2017-02-23 12:00:56','6fa00a61-d737-439e-9003-3bb9ab42f617');

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
	(1,1,'en','default/{slug}','{parent.uri}/{slug}','2017-02-21 21:30:10','2017-02-21 21:30:10','c646ba45-d1af-44c7-823c-6dbb0d60e528'),
	(2,2,'en',NULL,NULL,'2017-02-23 11:59:41','2017-02-23 11:59:41','ca84727e-d7f9-405f-9fee-f4e53eb7ed66');

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
	(5,5,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-21 21:30:15','2017-02-21 21:30:15','2412953a-4876-49e1-a2c4-d0d6d763d920'),
	(6,6,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-21 21:30:15','2017-02-21 21:30:15','1cbb882b-cf9e-459e-9473-59e01b66e24f'),
	(7,7,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-21 21:30:17','2017-02-21 21:30:17','125921f2-a242-45bc-8799-e0f4da642beb');

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
	(5,'GlobalSet',1,0,'2017-02-21 21:30:15','2017-02-21 21:30:15','381e2970-a21e-4c7b-9fd8-5d98371519a2'),
	(6,'User',1,0,'2017-02-21 21:30:15','2017-02-21 21:30:15','49169ce1-9e5c-4c6a-ae7b-da8fb0579fc6'),
	(7,'User',1,0,'2017-02-21 21:30:17','2017-02-21 21:30:17','fe435802-5086-4dae-ab83-f049a1185afa');

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
	(5,5,'en','',NULL,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','92315c78-9040-40be-873c-4e5fbdd5b51b'),
	(6,6,'en','',NULL,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','f6fcd352-e10f-4e46-bfb1-1d776f951530'),
	(7,7,'en','',NULL,1,'2017-02-21 21:30:17','2017-02-21 21:30:17','775ee77c-d6b7-40b2-84ff-b9b784e91f43');

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



# Export von Tabelle craft_export_map
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_export_map`;

CREATE TABLE `craft_export_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `settings` text COLLATE utf8_unicode_ci,
  `map` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_feedme_feeds
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_feedme_feeds`;

CREATE TABLE `craft_feedme_feeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `feedUrl` text COLLATE utf8_unicode_ci,
  `feedType` enum('xml','rss','atom','json') COLLATE utf8_unicode_ci NOT NULL,
  `primaryElement` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `elementGroup` text COLLATE utf8_unicode_ci,
  `elementType` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duplicateHandle` enum('add','update','delete') COLLATE utf8_unicode_ci NOT NULL,
  `fieldMapping` text COLLATE utf8_unicode_ci,
  `fieldElementDefaults` text COLLATE utf8_unicode_ci,
  `fieldElementMapping` text COLLATE utf8_unicode_ci,
  `fieldDefaults` text COLLATE utf8_unicode_ci,
  `fieldUnique` text COLLATE utf8_unicode_ci,
  `passkey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `backup` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_feedme_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_feedme_log`;

CREATE TABLE `craft_feedme_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logsId` int(11) DEFAULT NULL,
  `errors` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_feedme_log_logsId_fk` (`logsId`),
  CONSTRAINT `craft_feedme_log_logsId_fk` FOREIGN KEY (`logsId`) REFERENCES `craft_feedme_logs` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_feedme_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_feedme_logs`;

CREATE TABLE `craft_feedme_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feedId` int(11) DEFAULT NULL,
  `items` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_feedme_logs_feedId_fk` (`feedId`),
  CONSTRAINT `craft_feedme_logs_feedId_fk` FOREIGN KEY (`feedId`) REFERENCES `craft_feedme_feeds` (`id`) ON DELETE CASCADE
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
	(8,'Singles','2017-02-21 21:30:09','2017-02-21 21:30:09','930f7518-ccfc-4194-9fee-b676a1504037'),
	(9,'Settings Selector','2017-02-23 11:59:01','2017-02-23 11:59:01','cc095568-cc57-408a-9807-da564f4606f0');

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
	(63,25,15,78,0,1,'2017-02-21 21:30:13','2017-02-21 21:30:13','d7c7cc03-b14a-4be4-8372-faa3a67a1867'),
	(64,25,15,79,0,2,'2017-02-21 21:30:13','2017-02-21 21:30:13','5b5f6e8e-2e88-4c78-84ee-e71266e9ee8e'),
	(65,25,15,80,0,3,'2017-02-21 21:30:13','2017-02-21 21:30:13','60be6049-537f-4208-9dac-372a16b22be9'),
	(66,26,16,82,0,1,'2017-02-21 21:30:14','2017-02-21 21:30:14','83c6063e-6d64-4bf3-90b5-1f81bc5159ea'),
	(67,26,16,83,0,2,'2017-02-21 21:30:14','2017-02-21 21:30:14','5ac4042b-e855-4a3b-99a0-53732e7c21c5'),
	(68,26,16,84,0,3,'2017-02-21 21:30:14','2017-02-21 21:30:14','0e1430ba-189e-4d05-8ffa-e266e1102063'),
	(69,27,17,86,0,1,'2017-02-21 21:30:14','2017-02-21 21:30:14','db1bbd1e-b4d1-4fd7-86b1-10c452c22902'),
	(70,28,18,90,0,1,'2017-02-21 21:30:14','2017-02-21 21:30:14','23363f63-2e94-46d5-b647-a6cac3be2bab'),
	(109,50,52,18,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','b3748877-b9c0-42e3-a302-6c0671a25ed1'),
	(110,50,52,41,0,2,'2017-02-21 21:30:15','2017-02-21 21:30:15','96b8db5c-e426-47d9-87a5-d8cfb0770ca6'),
	(111,51,53,18,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','8aa931f0-aa4d-4da9-b465-454678a94b61'),
	(112,52,54,18,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','91128c7f-3c05-4729-86e8-b28ca75b22d4'),
	(113,53,55,18,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','f9ebe229-f28c-4321-954f-a5ad42ec296f'),
	(114,55,57,104,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','ef5abcdd-a734-458b-b725-99e0fb09d411'),
	(115,55,58,3,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','ea604f8a-ce06-4213-9069-7b33817a4020'),
	(116,55,59,23,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','9d0a80a4-d58f-462f-91da-0f3a711ff5c0'),
	(117,56,60,4,0,1,'2017-02-21 21:30:15','2017-02-21 21:30:15','ef363271-da5c-4cae-8162-b0399dd2c7b2'),
	(118,58,61,64,0,1,'2017-02-23 11:58:50','2017-02-23 11:58:50','fa40802d-228a-4bc6-acb2-2c04f56ad750'),
	(119,58,61,65,0,2,'2017-02-23 11:58:50','2017-02-23 11:58:50','6d2a5899-434a-4c45-963c-52f7e07c485e'),
	(120,58,61,66,0,3,'2017-02-23 11:58:50','2017-02-23 11:58:50','86c4fba6-a7dd-4221-aad2-157911adb103'),
	(121,58,61,67,0,4,'2017-02-23 11:58:50','2017-02-23 11:58:50','da780cac-25b7-4351-b465-d87b5b5ab168'),
	(122,58,61,68,0,5,'2017-02-23 11:58:50','2017-02-23 11:58:50','d8ac077d-697a-479b-8ff8-4bb02a0a65d7'),
	(123,58,61,69,0,6,'2017-02-23 11:58:50','2017-02-23 11:58:50','870333e5-c25d-40ab-aaba-01c2da0a7911'),
	(124,58,61,70,0,7,'2017-02-23 11:58:50','2017-02-23 11:58:50','df2e6fe1-ccdb-4d64-bb8f-3541d1c499b4'),
	(125,58,61,71,0,8,'2017-02-23 11:58:50','2017-02-23 11:58:50','5ebe05b9-fa55-40fb-95ef-4a2e23d53e38'),
	(126,58,61,72,0,9,'2017-02-23 11:58:50','2017-02-23 11:58:50','717de209-40dc-4d6b-bb31-055db7ae8b5c'),
	(127,58,61,73,0,10,'2017-02-23 11:58:50','2017-02-23 11:58:50','e47d8491-0b38-4134-b39b-96d7dec240da'),
	(128,58,61,74,0,11,'2017-02-23 11:58:50','2017-02-23 11:58:50','fe2d6f14-c20a-4e06-ac1a-81dddb5a5751'),
	(129,58,61,75,0,12,'2017-02-23 11:58:50','2017-02-23 11:58:50','0a80f3d9-90f1-4289-91f8-56d509dfd2d7'),
	(130,58,61,76,0,13,'2017-02-23 11:58:50','2017-02-23 11:58:50','8e4f8176-3fb3-4829-bd1d-2bc2a37f8ae3'),
	(132,60,63,63,0,1,'2017-02-23 12:00:56','2017-02-23 12:00:56','6bc31b81-6fe5-4210-8dfe-df67d6e8ba43'),
	(133,61,64,94,0,1,'2017-02-23 12:01:17','2017-02-23 12:01:17','dd0ff439-c7a6-4f5f-8c99-3433f6f39482'),
	(134,61,64,102,0,2,'2017-02-23 12:01:17','2017-02-23 12:01:17','d12858e0-0f78-4b74-a616-0ba10a2f0e19'),
	(135,61,65,87,0,1,'2017-02-23 12:01:17','2017-02-23 12:01:17','b5953f58-261a-4c0f-834a-6850a22be8c2'),
	(136,61,65,77,0,2,'2017-02-23 12:01:17','2017-02-23 12:01:17','530199d7-dac1-4e13-acd9-15a0a5abda9e'),
	(137,62,66,94,0,1,'2017-02-23 12:01:17','2017-02-23 12:01:17','d4d5a2dd-6f03-42ed-a8be-48176a9286f8'),
	(138,62,67,42,0,1,'2017-02-23 12:01:17','2017-02-23 12:01:17','82a34723-6041-47e5-8637-ff56afc935af'),
	(139,63,68,99,0,1,'2017-02-23 12:01:17','2017-02-23 12:01:17','6041ed3e-2588-4abb-8c6f-587f95551989'),
	(140,64,69,99,0,1,'2017-02-23 12:01:17','2017-02-23 12:01:17','cac02008-6ed5-4771-a2dc-9af6dd72378c'),
	(141,66,70,98,0,1,'2017-02-23 12:01:17','2017-02-23 12:01:17','e5331d73-a8de-42a5-8481-df98fe514161'),
	(142,66,70,100,0,2,'2017-02-23 12:01:17','2017-02-23 12:01:17','3463da0b-1f0d-42a5-a126-9f982f6fa615'),
	(143,66,70,101,0,3,'2017-02-23 12:01:17','2017-02-23 12:01:17','9e2bc6d4-5db6-446c-9dd6-7c55b7e82e7f'),
	(144,67,71,95,0,1,'2017-02-23 12:01:17','2017-02-23 12:01:17','a3fcff18-1f79-4095-8116-c1c977b8c48f'),
	(145,67,71,103,0,2,'2017-02-23 12:01:17','2017-02-23 12:01:17','342596d2-d83c-4f02-a004-a30a19eef5f7'),
	(146,67,72,46,0,1,'2017-02-23 12:01:17','2017-02-23 12:01:17','4cbb65aa-ff0b-4cee-9a67-8174da3edf09'),
	(147,68,73,96,0,1,'2017-02-23 12:01:17','2017-02-23 12:01:17','adb10890-b4c2-4a02-bd4e-05546b91bf3b'),
	(148,68,74,50,0,1,'2017-02-23 12:01:17','2017-02-23 12:01:17','f1111a24-cc16-480b-ab82-80d60f22c5b7'),
	(149,69,75,96,0,1,'2017-02-23 12:01:17','2017-02-23 12:01:17','b8dfb965-5d85-44f2-9d3d-b8aaea7a0f6c'),
	(150,69,76,54,0,1,'2017-02-23 12:01:17','2017-02-23 12:01:17','c0b62fde-33a5-4c5b-8e30-a5d1b633d1a1'),
	(151,70,77,95,0,1,'2017-02-23 12:01:17','2017-02-23 12:01:17','d1c83baf-4d97-4961-8575-57d703cce472'),
	(152,70,78,58,0,1,'2017-02-23 12:01:17','2017-02-23 12:01:17','e2d9dd10-e2af-4537-b2dd-d12b34d11524'),
	(153,71,79,96,0,1,'2017-02-23 12:01:17','2017-02-23 12:01:17','295c5283-6b49-4ddd-912f-3c60c914967e'),
	(154,71,80,105,0,1,'2017-02-23 12:01:17','2017-02-23 12:01:17','e361b789-f57a-45aa-88df-0810a7d3df97'),
	(155,72,81,88,0,1,'2017-02-23 12:01:17','2017-02-23 12:01:17','f923c3d4-0f66-4f7c-b612-ce93f5c37d89'),
	(156,72,82,24,0,1,'2017-02-23 12:01:17','2017-02-23 12:01:17','d8706ded-dd7d-4147-8399-0b4d4bbcb709'),
	(157,73,83,89,0,1,'2017-02-23 12:01:17','2017-02-23 12:01:17','9d70d3e2-5591-4d18-8978-9ccbfb2dfac4'),
	(158,73,84,31,0,1,'2017-02-23 12:01:17','2017-02-23 12:01:17','d951b1fd-8032-4359-9f07-36b3eb14e755'),
	(159,75,86,97,0,1,'2017-02-23 12:01:17','2017-02-23 12:01:17','e5f82884-4244-4ea3-93ce-2e8803d9a4f3'),
	(160,76,88,85,0,1,'2017-02-23 12:01:17','2017-02-23 12:01:17','51b3b59a-ed0b-4c27-a326-6c399d86c97d'),
	(161,78,89,92,0,1,'2017-02-23 12:01:17','2017-02-23 12:01:17','c8817d73-84af-4083-ab9a-c6fd4d4cca2f'),
	(162,78,90,34,0,1,'2017-02-23 12:01:17','2017-02-23 12:01:17','b38de4cf-c77e-4b02-a778-7f2cd537245c'),
	(163,79,91,93,0,1,'2017-02-23 12:01:17','2017-02-23 12:01:17','e7212a99-1715-4391-9e3a-46eb11c69b8f'),
	(164,79,92,37,0,1,'2017-02-23 12:01:17','2017-02-23 12:01:17','1c3eb211-8f0c-47ca-a570-975016e95b82'),
	(165,80,94,81,0,1,'2017-02-23 12:01:17','2017-02-23 12:01:17','6fc119cf-57f7-4a16-a94f-f132edb59ab7'),
	(166,81,95,95,0,1,'2017-02-23 12:01:17','2017-02-23 12:01:17','a59309e4-8831-4778-a94d-82a639e363bb'),
	(167,81,95,94,0,2,'2017-02-23 12:01:17','2017-02-23 12:01:17','38ce9ecd-ecf4-4efa-afd3-04002e5b281c'),
	(168,81,95,99,0,3,'2017-02-23 12:01:17','2017-02-23 12:01:17','3eb7383f-002a-4b3a-a1d2-386e2b13fa59'),
	(169,81,96,58,0,1,'2017-02-23 12:01:17','2017-02-23 12:01:17','bd6eaf8e-2148-44c0-9be8-931098801d24'),
	(170,81,96,42,0,2,'2017-02-23 12:01:17','2017-02-23 12:01:17','bbb655d9-d092-4cda-aa3e-b5840e93b360');

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
	(25,'SuperTable_Block','2017-02-21 21:30:13','2017-02-21 21:30:13','f8c594bd-5233-4dc8-afdf-a6cdc6ea103c'),
	(26,'SuperTable_Block','2017-02-21 21:30:14','2017-02-21 21:30:14','5058f285-1386-4f03-88ba-3dcfc747274f'),
	(27,'SuperTable_Block','2017-02-21 21:30:14','2017-02-21 21:30:14','fed68a5e-b6dd-4209-9fe8-3c1cb6228771'),
	(28,'SuperTable_Block','2017-02-21 21:30:14','2017-02-21 21:30:14','1dc0a18b-d260-4f80-a26f-159e4bebbd77'),
	(50,'Asset','2017-02-21 21:30:15','2017-02-21 21:30:15','8879161b-b3cc-40c2-bad8-d430d1444b92'),
	(51,'Asset','2017-02-21 21:30:15','2017-02-21 21:30:15','4f3027c5-66d7-4c05-bb2a-13ce13330a14'),
	(52,'Asset','2017-02-21 21:30:15','2017-02-21 21:30:15','e5a582d9-914b-4f56-b2e4-64e2e97c28a7'),
	(53,'Asset','2017-02-21 21:30:15','2017-02-21 21:30:15','6f7b8b5d-96b2-4782-a3fa-e66519d4ccfe'),
	(54,'Entry','2017-02-21 21:30:15','2017-02-21 21:30:15','87a2f14c-a8cd-4665-b3a0-0c77fcf5cb2c'),
	(55,'Entry','2017-02-21 21:30:15','2017-02-21 21:30:15','6860387c-6bc2-4fb7-a1bb-eef2fcb31dae'),
	(56,'GlobalSet','2017-02-21 21:30:15','2017-02-21 21:30:15','9f00691b-1027-4f21-8526-42ee7620c020'),
	(57,'Category','2017-02-21 21:30:15','2017-02-21 21:30:15','af95a0c2-5600-44c7-bde4-54b67a032e8e'),
	(58,'SuperTable_Block','2017-02-23 11:58:50','2017-02-23 11:58:50','0b44d1c8-762c-458e-b541-b76b3fe3b3a5'),
	(60,'Category','2017-02-23 12:00:56','2017-02-23 12:00:56','61dd1628-cd54-457a-ac52-9083b0bc370d'),
	(61,'Neo_Block','2017-02-23 12:01:17','2017-02-23 12:01:17','833ef625-3ece-4183-a073-96d892fcab97'),
	(62,'Neo_Block','2017-02-23 12:01:17','2017-02-23 12:01:17','fe59b29b-ffc9-47d3-bad8-1622d9c84bec'),
	(63,'Neo_Block','2017-02-23 12:01:17','2017-02-23 12:01:17','737f1d4c-ef66-4a00-9c18-25b5ee2ad5a2'),
	(64,'Neo_Block','2017-02-23 12:01:17','2017-02-23 12:01:17','2c7eaf80-2a72-48cb-a7a3-6bfe098ecca4'),
	(65,'Neo_Block','2017-02-23 12:01:17','2017-02-23 12:01:17','da46111b-d7da-459e-9c9d-b901a8e03458'),
	(66,'Neo_Block','2017-02-23 12:01:17','2017-02-23 12:01:17','800a3635-edb2-4e51-b8cc-78bb524d0266'),
	(67,'Neo_Block','2017-02-23 12:01:17','2017-02-23 12:01:17','34f5d5ce-1795-4c07-abd7-0f78864d3847'),
	(68,'Neo_Block','2017-02-23 12:01:17','2017-02-23 12:01:17','59c1d94a-ad1e-4369-905f-c8ef6ba17445'),
	(69,'Neo_Block','2017-02-23 12:01:17','2017-02-23 12:01:17','afeb91a3-9883-4a5b-bb41-686556eb6263'),
	(70,'Neo_Block','2017-02-23 12:01:17','2017-02-23 12:01:17','2589b58f-3b29-4a91-aa4e-4c1e331b808f'),
	(71,'Neo_Block','2017-02-23 12:01:17','2017-02-23 12:01:17','974c5eb1-e1eb-444d-8047-1cb6338b81e0'),
	(72,'Neo_Block','2017-02-23 12:01:17','2017-02-23 12:01:17','9bfa8f3e-247e-4335-bab2-cd3943982f2e'),
	(73,'Neo_Block','2017-02-23 12:01:17','2017-02-23 12:01:17','9ab2b351-169c-44b7-95a9-92f9231427ab'),
	(74,'Neo_Block','2017-02-23 12:01:17','2017-02-23 12:01:17','d8c2b049-a939-4039-89cc-213e246fb348'),
	(75,'Neo_Block','2017-02-23 12:01:17','2017-02-23 12:01:17','880fccf1-40fa-4dcb-af96-99ebe7c4820b'),
	(76,'Neo_Block','2017-02-23 12:01:17','2017-02-23 12:01:17','bec757c8-fa32-47ea-a153-d896eae16ae7'),
	(77,'Neo_Block','2017-02-23 12:01:17','2017-02-23 12:01:17','fd50f4dc-5c21-45cd-b0a8-7d9cebf47ff9'),
	(78,'Neo_Block','2017-02-23 12:01:17','2017-02-23 12:01:17','fbd328a5-0032-45c9-ad63-af0a89fd0304'),
	(79,'Neo_Block','2017-02-23 12:01:17','2017-02-23 12:01:17','28562bf0-ec7d-4db1-858e-53adf23db030'),
	(80,'Neo_Block','2017-02-23 12:01:17','2017-02-23 12:01:17','391de0db-a440-48dc-ae3c-2409dab8a6bc'),
	(81,'Neo_Block','2017-02-23 12:01:17','2017-02-23 12:01:17','b72bc26b-57de-45e5-8a06-c618b778d99f');

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
	(15,25,'Content',1,'2017-02-21 21:30:13','2017-02-21 21:30:13','de779f0a-03bc-48d7-9c53-eb6c5623f0ad'),
	(16,26,'Content',1,'2017-02-21 21:30:14','2017-02-21 21:30:14','de1b46c3-a304-4884-8396-e2abd3f1976d'),
	(17,27,'Content',1,'2017-02-21 21:30:14','2017-02-21 21:30:14','ca748926-5657-4dfb-892f-66f6c1f3d115'),
	(18,28,'Content',1,'2017-02-21 21:30:14','2017-02-21 21:30:14','d6b1bf38-0ae8-4f89-9149-07b64aa05908'),
	(52,50,'Content',1,'2017-02-21 21:30:15','2017-02-21 21:30:15','a08c5da5-18d9-4f9c-9389-1223a1e4686e'),
	(53,51,'Content',1,'2017-02-21 21:30:15','2017-02-21 21:30:15','9a2e3213-031c-424f-82b8-310cbffc7cf9'),
	(54,52,'Content',1,'2017-02-21 21:30:15','2017-02-21 21:30:15','e3e1e993-cb73-475b-88ba-3470cdbaff8a'),
	(55,53,'Content',1,'2017-02-21 21:30:15','2017-02-21 21:30:15','001c0eba-8f43-4549-8f57-f01381c8cef5'),
	(56,54,'Content',1,'2017-02-21 21:30:15','2017-02-21 21:30:15','3b220d3e-4a8a-4850-a3a8-e8c7de358588'),
	(57,55,'Content Neo',1,'2017-02-21 21:30:15','2017-02-21 21:30:15','311d4093-44e2-4de7-ab96-306df7174f88'),
	(58,55,'Meta',2,'2017-02-21 21:30:15','2017-02-21 21:30:15','e9ed43b0-d62c-4d40-bb20-93e1986d6e6a'),
	(59,55,'SEO',3,'2017-02-21 21:30:15','2017-02-21 21:30:15','fe4e729b-9164-42c4-b5cb-04e437bf09ed'),
	(60,56,'Content',1,'2017-02-21 21:30:15','2017-02-21 21:30:15','b1ee48af-39fd-4f08-af35-86df64b2fff3'),
	(61,58,'Content',1,'2017-02-23 11:58:50','2017-02-23 11:58:50','b41db2e3-4ee9-4092-9214-1e1179318c66'),
	(63,60,'Settings',1,'2017-02-23 12:00:56','2017-02-23 12:00:56','dec11777-2bed-4582-b61a-96ee8d665fd7'),
	(64,61,'Content',1,'2017-02-23 12:01:17','2017-02-23 12:01:17','04f5b8a1-68f2-4dc1-ab2a-cc6271071761'),
	(65,61,'Settings',2,'2017-02-23 12:01:17','2017-02-23 12:01:17','ffb7fb37-f797-40f9-9375-d8ecbfbf55dc'),
	(66,62,'Content',1,'2017-02-23 12:01:17','2017-02-23 12:01:17','339860d9-8864-4842-9f0e-0208b2ef3f60'),
	(67,62,'Settings',2,'2017-02-23 12:01:17','2017-02-23 12:01:17','70b10732-7b29-4ec4-ad30-783e9635d559'),
	(68,63,'Content',1,'2017-02-23 12:01:17','2017-02-23 12:01:17','189a8fc7-1701-4027-9bee-15099deb256a'),
	(69,64,'Content',1,'2017-02-23 12:01:17','2017-02-23 12:01:17','6358282b-359a-48a4-8caa-adac3cdc690d'),
	(70,66,'Content',1,'2017-02-23 12:01:17','2017-02-23 12:01:17','a37c7d77-4528-4fb1-8264-72a2cc9f825f'),
	(71,67,'Content',1,'2017-02-23 12:01:17','2017-02-23 12:01:17','787e8e20-b887-49ae-81d8-cc0b04d1f2b5'),
	(72,67,'Settings',2,'2017-02-23 12:01:17','2017-02-23 12:01:17','385c3461-88dd-491f-8286-70435a63a3f2'),
	(73,68,'Content',1,'2017-02-23 12:01:17','2017-02-23 12:01:17','c72e9513-bea2-4f06-95a9-7bb6791f8295'),
	(74,68,'Settings',2,'2017-02-23 12:01:17','2017-02-23 12:01:17','63001307-eaab-4c4e-935e-555790042b23'),
	(75,69,'Content',1,'2017-02-23 12:01:17','2017-02-23 12:01:17','619d49dd-10bd-4dbe-a51f-f2c67b61641e'),
	(76,69,'Settings',2,'2017-02-23 12:01:17','2017-02-23 12:01:17','bb78ecc0-2656-4511-9e03-3c828bfb1df8'),
	(77,70,'Content',1,'2017-02-23 12:01:17','2017-02-23 12:01:17','b71661ab-3d64-47e0-a38e-1fbed97c89ed'),
	(78,70,'Settings',2,'2017-02-23 12:01:17','2017-02-23 12:01:17','5eed9cb2-0284-4256-ae2d-825200b65351'),
	(79,71,'Content',1,'2017-02-23 12:01:17','2017-02-23 12:01:17','9873a1e2-74d5-45be-aa99-b5ba6c8a132b'),
	(80,71,'Settings',2,'2017-02-23 12:01:17','2017-02-23 12:01:17','38930948-e0ba-4b53-bdc0-628157c10189'),
	(81,72,'Content',1,'2017-02-23 12:01:17','2017-02-23 12:01:17','87b21b49-08d0-4de3-8f79-fac7bcce62b5'),
	(82,72,'Settings',2,'2017-02-23 12:01:17','2017-02-23 12:01:17','c6ef32dd-2075-4ab5-afb0-b44a00cb8439'),
	(83,73,'Content',1,'2017-02-23 12:01:17','2017-02-23 12:01:17','73048bff-febb-41ab-84e1-5fa5dafa1c65'),
	(84,73,'Settings',2,'2017-02-23 12:01:17','2017-02-23 12:01:17','53d72700-6e43-492f-945c-b6265c8be293'),
	(85,74,'Content',1,'2017-02-23 12:01:17','2017-02-23 12:01:17','8c8dbeb6-8f3a-428a-98ef-70f511559f64'),
	(86,75,'Content',1,'2017-02-23 12:01:17','2017-02-23 12:01:17','8767b955-1a6a-4997-8e6b-a82fce9feced'),
	(87,76,'Content',1,'2017-02-23 12:01:17','2017-02-23 12:01:17','5fd1cc8b-7aae-4c89-a81e-3f4e9d22773a'),
	(88,76,'Settings',2,'2017-02-23 12:01:17','2017-02-23 12:01:17','c19be3f3-b348-4027-9777-909227b864a8'),
	(89,78,'Content',1,'2017-02-23 12:01:17','2017-02-23 12:01:17','cc4614d9-f316-43c5-b66f-c0fbeb14f589'),
	(90,78,'Settings',2,'2017-02-23 12:01:17','2017-02-23 12:01:17','b9f43572-bffb-4fb1-844a-0c7957ff7c78'),
	(91,79,'Content',1,'2017-02-23 12:01:17','2017-02-23 12:01:17','b7b561f4-b776-405a-b25e-a3bb147e30a6'),
	(92,79,'Settings',2,'2017-02-23 12:01:17','2017-02-23 12:01:17','91d4ade5-43a8-4b8e-8c7b-ccd194dc3c5b'),
	(93,80,'Content',1,'2017-02-23 12:01:17','2017-02-23 12:01:17','116fdced-4ee7-411d-8954-f5cb9fab81b3'),
	(94,80,'Settings',2,'2017-02-23 12:01:17','2017-02-23 12:01:17','75e0e0b6-8e42-451b-8a96-47ce3d2f606a'),
	(95,81,'Content',1,'2017-02-23 12:01:17','2017-02-23 12:01:17','54c43497-ac65-43e4-9890-86ca3cee267e'),
	(96,81,'Settings',2,'2017-02-23 12:01:17','2017-02-23 12:01:17','3507da5a-72b0-4bb4-a542-1e05b0e2b00d');

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
	(63,7,'Settings: Image Slider','settingsImageSlider','global','',0,'SuperTable','{\"columns\":{\"64\":{\"width\":\"\"},\"65\":{\"width\":\"\"},\"66\":{\"width\":\"\"},\"67\":{\"width\":\"\"},\"68\":{\"width\":\"\"},\"69\":{\"width\":\"\"},\"70\":{\"width\":\"\"},\"71\":{\"width\":\"\"},\"72\":{\"width\":\"\"},\"73\":{\"width\":\"\"},\"74\":{\"width\":\"\"},\"75\":{\"width\":\"\"},\"76\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-02-21 21:30:12','2017-02-23 11:58:50','ec384fc7-31ba-4900-9f56-ac39876942a3'),
	(64,NULL,'Autoplay','autoplay','superTableBlockType:12','Delay between transitions (in ms). If this parameter is not specified, auto play will be disabled',0,'Dropdown','{\"options\":[{\"label\":\"Disabled\",\"value\":\"disabled\",\"default\":\"1\"},{\"label\":\"Slow\",\"value\":\"slow\",\"default\":\"\"},{\"label\":\"Medium\",\"value\":\"medium\",\"default\":\"\"},{\"label\":\"Fast\",\"value\":\"fast\",\"default\":\"\"}]}','2017-02-21 21:30:13','2017-02-23 11:58:50','961eea20-dd38-4363-94d0-d73555058f95'),
	(65,NULL,'Cell Align','cellAlign','superTableBlockType:12','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"1\"},{\"label\":\"Left\",\"value\":\"left\",\"default\":\"\"},{\"label\":\"Center\",\"value\":\"center\",\"default\":\"\"},{\"label\":\"Right\",\"value\":\"right\",\"default\":\"\"}]}','2017-02-21 21:30:13','2017-02-23 11:58:50','b9ae8342-d351-4c8b-ae46-a0e1f8cdaf5e'),
	(66,NULL,'Draggable','draggable','superTableBlockType:12','',0,'Lightswitch','{\"default\":\"1\"}','2017-02-21 21:30:13','2017-02-23 11:58:50','156593ea-755c-4b98-aa06-828246d2e228'),
	(67,NULL,'Free Scroll','freeScroll','superTableBlockType:12','If true then slides will not have fixed positions',0,'Lightswitch','{\"default\":\"\"}','2017-02-21 21:30:13','2017-02-23 11:58:50','4d2d9123-f936-4e6c-8f6f-5fd884796edc'),
	(68,NULL,'Group Cells','groupCells','superTableBlockType:12','',0,'Lightswitch','{\"default\":\"1\"}','2017-02-21 21:30:13','2017-02-23 11:58:50','e0be11c0-6207-4182-b7de-3d3414602a77'),
	(69,NULL,'Image Ratio','imageRatio','superTableBlockType:12','',0,'Dropdown','{\"options\":[{\"label\":\"16:10\",\"value\":\"16:10\",\"default\":\"1\"},{\"label\":\"16:9\",\"value\":\"16:9\",\"default\":\"\"},{\"label\":\"4:3\",\"value\":\"4:3\",\"default\":\"\"},{\"label\":\"3:2\",\"value\":\"3:2\",\"default\":\"\"},{\"label\":\"2:1\",\"value\":\"2:1\",\"default\":\"\"},{\"label\":\"1:1\",\"value\":\"1:1\",\"default\":\"\"},{\"label\":\"1:2\",\"value\":\"1:2\",\"default\":\"\"},{\"label\":\"2:3\",\"value\":\"2:3\",\"default\":\"\"},{\"label\":\"3:4\",\"value\":\"3:4\",\"default\":\"\"},{\"label\":\"9:16\",\"value\":\"9:16\",\"default\":\"\"},{\"label\":\"10:16\",\"value\":\"10:16\",\"default\":\"\"}]}','2017-02-21 21:30:13','2017-02-23 11:58:50','14cdcb23-9019-4dd9-b270-4e74ea9c3826'),
	(70,NULL,'Loop','loop','superTableBlockType:12','',0,'Lightswitch','{\"default\":\"\"}','2017-02-21 21:30:13','2017-02-23 11:58:50','b3805984-e048-4468-ad37-51e94bec3caa'),
	(71,NULL,'Pause on Hover','pauseOnHover','superTableBlockType:12','',0,'Lightswitch','{\"default\":\"1\"}','2017-02-21 21:30:13','2017-02-23 11:58:50','c800a76d-8eb1-468f-80c2-dcaa1d94d52d'),
	(72,NULL,'Navigation','navigation','superTableBlockType:12','',0,'Lightswitch','{\"default\":\"1\"}','2017-02-21 21:30:13','2017-02-23 11:58:50','113b04c2-2d0b-41cb-85d7-6af47204cf67'),
	(73,NULL,'Pagination','pagination','superTableBlockType:12','',0,'Lightswitch','{\"default\":\"1\"}','2017-02-21 21:30:13','2017-02-23 11:58:50','46804b2d-f8ea-49fe-a194-b19e23652c60'),
	(74,NULL,'Right To Left','rightToLeft','superTableBlockType:12','',0,'Lightswitch','{\"default\":\"\"}','2017-02-21 21:30:13','2017-02-23 11:58:50','4800be9a-c95a-4fb9-a15b-ad86466e9ee2'),
	(75,NULL,'Slides Per View','slidesPerView','superTableBlockType:12','Number of slides per view (slides visible at the same time on slider\'s container).',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"1\"},{\"label\":\"1\",\"value\":\"1\",\"default\":\"\"},{\"label\":\"2\",\"value\":\"2\",\"default\":\"\"},{\"label\":\"3\",\"value\":\"3\",\"default\":\"\"},{\"label\":\"4\",\"value\":\"4\",\"default\":\"\"},{\"label\":\"5\",\"value\":\"5\",\"default\":\"\"},{\"label\":\"6\",\"value\":\"6\",\"default\":\"\"}]}','2017-02-21 21:30:13','2017-02-23 11:58:50','a6d28877-5448-461a-91d0-57890dbc327c'),
	(76,NULL,'Speed','speed','superTableBlockType:12','Duration of transition between slides (in ms)',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"1\"},{\"label\":\"Slow\",\"value\":\"slow\",\"default\":\"\"},{\"label\":\"Medium\",\"value\":\"medium\",\"default\":\"\"},{\"label\":\"Fast\",\"value\":\"fast\",\"default\":\"\"}]}','2017-02-21 21:30:13','2017-02-23 11:58:50','ba22b0f5-3fe4-4596-b266-87a8f34ef7fe'),
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
	(104,3,'Content Builder: Neo','contentBuilderNeo','global','',0,'Neo','{\"maxBlocks\":null}','2017-02-21 21:30:15','2017-02-23 12:01:17','9172ad61-ae3c-4788-a854-ba4abbb9ba0f'),
	(105,9,'Settings Selector: Image Slider','settingsSelectorImageSlider','global','',0,'Categories','{\"source\":\"group:2\",\"limit\":\"1\",\"selectionLabel\":\"Select Settings: Image Slider\"}','2017-02-23 12:00:49','2017-02-23 12:00:49','b53afa47-1515-4a09-9300-a917f3b0bd1f');

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


# Export von Tabelle craft_import_entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_import_entries`;

CREATE TABLE `craft_import_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `historyId` int(11) DEFAULT NULL,
  `entryId` int(11) DEFAULT NULL,
  `versionId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_import_entries_historyId_fk` (`historyId`),
  KEY `craft_import_entries_entryId_fk` (`entryId`),
  KEY `craft_import_entries_versionId_fk` (`versionId`),
  CONSTRAINT `craft_import_entries_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_import_entries_historyId_fk` FOREIGN KEY (`historyId`) REFERENCES `craft_import_history` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_import_entries_versionId_fk` FOREIGN KEY (`versionId`) REFERENCES `craft_entryversions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_import_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_import_history`;

CREATE TABLE `craft_import_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rows` int(10) DEFAULT NULL,
  `behavior` enum('append','replace','delete') COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('started','finished','reverted') COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_import_history_userId_fk` (`userId`),
  CONSTRAINT `craft_import_history_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_import_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_import_log`;

CREATE TABLE `craft_import_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `historyId` int(11) DEFAULT NULL,
  `line` int(10) DEFAULT NULL,
  `errors` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_import_log_historyId_fk` (`historyId`),
  CONSTRAINT `craft_import_log_historyId_fk` FOREIGN KEY (`historyId`) REFERENCES `craft_import_history` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



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



# Export von Tabelle craft_matrixcontent_cbmatrix
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_matrixcontent_cbmatrix`;

CREATE TABLE `craft_matrixcontent_cbmatrix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_modulButton_button` text COLLATE utf8_unicode_ci,
  `field_modulCopy_copy` text COLLATE utf8_unicode_ci,
  `field_modulDefinitionList_definitionList` text COLLATE utf8_unicode_ci,
  `field_modulHeadline_headline` text COLLATE utf8_unicode_ci,
  `field_modulHeadline_size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_modulHeadline_visualSize` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_modulImageCover_caption` text COLLATE utf8_unicode_ci,
  `field_modulImageGallery_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'lightbox',
  `field_modulImageGrid_cols` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_modulQuote_quote` text COLLATE utf8_unicode_ci,
  `field_modulQuote_source` text COLLATE utf8_unicode_ci,
  `field_modulVideoEmbed_videoEmbed` text COLLATE utf8_unicode_ci,
  `field_accordionLabel_label` text COLLATE utf8_unicode_ci,
  `field_modulCopyMarginal_copy` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixcontent_cbmatrix_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_matrixcontent_cbmatrix_locale_fk` (`locale`),
  CONSTRAINT `craft_matrixcontent_cbmatrix_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixcontent_cbmatrix_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_matrixcontent_cbmatrix` WRITE;
/*!40000 ALTER TABLE `craft_matrixcontent_cbmatrix` DISABLE KEYS */;

INSERT INTO `craft_matrixcontent_cbmatrix` (`id`, `elementId`, `locale`, `field_modulButton_button`, `field_modulCopy_copy`, `field_modulDefinitionList_definitionList`, `field_modulHeadline_headline`, `field_modulHeadline_size`, `field_modulHeadline_visualSize`, `field_modulImageCover_caption`, `field_modulImageGallery_style`, `field_modulImageGrid_cols`, `field_modulQuote_quote`, `field_modulQuote_source`, `field_modulVideoEmbed_videoEmbed`, `field_accordionLabel_label`, `field_modulCopyMarginal_copy`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(3,99,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-01 16:31:09','2017-02-01 17:08:40','443ab5e4-db59-4894-80ae-7ffa198e3b84'),
	(4,100,'en',NULL,NULL,NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-01 16:33:46','2017-02-01 17:08:40','70af4e12-9a66-4d2d-b585-f7099e3a96ca'),
	(5,101,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-01 16:33:46','2017-02-01 17:08:40','396fd0e5-cd7b-4095-818b-a2bbb8023895'),
	(6,102,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2017-02-01 16:33:46','2017-02-01 17:08:40','e1b7c30b-766c-40ad-9704-9b5985b664f5'),
	(7,103,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-01 16:33:46','2017-02-01 17:08:40','defd7d20-2d39-4697-b295-5361c776cd48'),
	(8,104,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2017-02-01 16:33:46','2017-02-01 17:08:40','058834d5-5614-4431-84b9-2207e886ff2e'),
	(9,105,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,NULL,'2017-02-01 16:33:46','2017-02-01 17:08:40','35f0524d-d346-4d21-8229-a9bf087dd82a'),
	(10,106,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-01 16:54:19','2017-02-01 17:08:40','fe1520b6-aebc-4d5d-b140-32233a77ed26'),
	(11,107,'en',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-01 16:54:19','2017-02-01 17:08:40','f990d8ef-c99e-4adf-8197-f8a021b38198'),
	(14,115,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-01 17:01:21','2017-02-01 17:08:40','cb7a0ff2-2898-4568-af67-0fdcc0ece3bb'),
	(15,116,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2017-02-01 17:03:28','2017-02-01 17:08:40','d4eb9867-4f93-4b65-ab27-622267ff0918'),
	(16,125,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2017-02-01 17:08:40','2017-02-01 17:08:40','355a8835-1c7f-4e24-bc9c-7b1655be207d'),
	(17,130,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-01 17:08:40','2017-02-01 17:08:40','2a9ae86e-bc33-44fb-86b6-bd7799c0e522'),
	(18,131,'en',NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.</p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-01 17:08:40','2017-02-01 17:08:40','37559b7e-22e3-42f1-8458-25e0458cab5c'),
	(19,132,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Label',NULL,'2017-02-01 17:08:40','2017-02-01 17:08:40','96621114-db0b-49ac-b4b2-ad4bdcfe1b58');

/*!40000 ALTER TABLE `craft_matrixcontent_cbmatrix` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_matrixcontent_column
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_matrixcontent_column`;

CREATE TABLE `craft_matrixcontent_column` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_columnQuote_quote` text COLLATE utf8_unicode_ci,
  `field_columnQuote_source` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixcontent_column_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_matrixcontent_column_locale_fk` (`locale`),
  CONSTRAINT `craft_matrixcontent_column_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixcontent_column_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_matrixcontent_column` WRITE;
/*!40000 ALTER TABLE `craft_matrixcontent_column` DISABLE KEYS */;

INSERT INTO `craft_matrixcontent_column` (`id`, `elementId`, `locale`, `field_columnQuote_quote`, `field_columnQuote_source`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,110,'en',NULL,NULL,'2017-02-01 16:54:19','2017-02-01 16:57:01','f31ec15d-784b-420a-bd65-bd1a6b616154'),
	(2,112,'en','','','2017-02-01 16:54:19','2017-02-01 16:57:01','1f7bb24f-ea40-4793-be3f-50ec0da67ed4'),
	(5,122,'en','','','2017-02-01 17:08:40','2017-02-01 17:08:40','115c8784-630a-40e8-bd72-a1f7ec7b995b'),
	(6,124,'en',NULL,NULL,'2017-02-01 17:08:40','2017-02-01 17:08:40','327eb0db-2e68-492b-9f9f-dbed46b9ccb0'),
	(7,127,'en','','','2017-02-01 17:08:40','2017-02-01 17:08:40','c688d683-8933-4c73-9cb9-c54c359a0321'),
	(8,129,'en',NULL,NULL,'2017-02-01 17:08:40','2017-02-01 17:08:40','81e4d1d1-dc69-41dc-ade8-d2affeabe7cd');

/*!40000 ALTER TABLE `craft_matrixcontent_column` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_matrixcontent_columns
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_matrixcontent_columns`;

CREATE TABLE `craft_matrixcontent_columns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_columnQuote_quote` text COLLATE utf8_unicode_ci,
  `field_columnQuote_source` text COLLATE utf8_unicode_ci,
  `field_columnQuote_sourceLink` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixcontent_columns_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_matrixcontent_columns_locale_fk` (`locale`),
  CONSTRAINT `craft_matrixcontent_columns_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixcontent_columns_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_matrixcontent_contentbuildermatrix
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_matrixcontent_contentbuildermatrix`;

CREATE TABLE `craft_matrixcontent_contentbuildermatrix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_contentSection_label` text COLLATE utf8_unicode_ci,
  `field_accordionLabel_label` text COLLATE utf8_unicode_ci,
  `field_buttonGroup_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'primary',
  `field_buttonGroup_alignment` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'left',
  `field_definitionList_modulDefinitionList` text COLLATE utf8_unicode_ci,
  `field_horizontalRuler_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_richText_richText` text COLLATE utf8_unicode_ci,
  `field_richTextMarginal_richText` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixcontent_contentbuildermatrix_elementId_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_matrixcontent_contentbuildermatrix_locale_fk` (`locale`),
  CONSTRAINT `craft_matrixcontent_contentbuildermatrix_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixcontent_contentbuildermatrix_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
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
	(1,104,61,'Content Section','contentSection',NULL,NULL,'',1,1,'2017-02-21 21:30:15','2017-02-23 12:01:17','0e8e9073-26d0-4835-afc2-d5e4f7e43127'),
	(2,104,62,'Headline','headline',NULL,NULL,'',1,3,'2017-02-21 21:30:15','2017-02-23 12:01:17','e44cc173-b209-4a19-9f54-b374f0af3c14'),
	(3,104,63,'Rich Text','richText',NULL,2,'',1,4,'2017-02-21 21:30:15','2017-02-23 12:01:17','05cac5e3-a182-4869-94a0-e4217124f721'),
	(4,104,64,'Rich Text Marginals','richTextMarginals',NULL,2,'[\"marginalColumn\"]',1,5,'2017-02-21 21:30:15','2017-02-23 12:01:17','c760a34a-4fbd-4f2f-945d-e619eca11fb2'),
	(5,104,65,'Marginal Column','marginalColumn',NULL,1,'[\"quote\",\"imageSingle\"]',0,6,'2017-02-21 21:30:15','2017-02-23 12:01:17','de970d11-5828-49c6-828d-ae0484bbf19c'),
	(6,104,66,'Quote','quote',NULL,NULL,'',1,7,'2017-02-21 21:30:15','2017-02-23 12:01:17','ff01243b-1277-4bac-a0c1-89b8cd041f58'),
	(7,104,67,'Image Cover','imageCover',NULL,NULL,'',1,9,'2017-02-21 21:30:15','2017-02-23 12:01:17','a1d53e91-bb4f-4f08-b080-48ec6c0586b5'),
	(8,104,68,'Image Gallery','imageGallery',NULL,NULL,'',1,10,'2017-02-21 21:30:15','2017-02-23 12:01:17','155ebc47-cdd3-47af-8c0f-7228e1c522a4'),
	(9,104,69,'Image Grid','imageGrid',NULL,NULL,'',1,11,'2017-02-21 21:30:15','2017-02-23 12:01:17','8364d609-2369-492d-b541-9f0ba4f49169'),
	(10,104,70,'Image Single','imageSingle',NULL,NULL,'',1,12,'2017-02-21 21:30:15','2017-02-23 12:01:17','2935578f-aa87-45e6-9b9f-5c065f97edcd'),
	(11,104,71,'Image Slider','imageSlider',NULL,NULL,'',1,13,'2017-02-21 21:30:15','2017-02-23 12:01:17','99ed428c-ae5f-4c5a-b0db-18d9de7b43b5'),
	(12,104,72,'Button','button',NULL,NULL,'',1,15,'2017-02-21 21:30:15','2017-02-23 12:01:17','c9ffacd6-bbe0-424d-97e5-ca758b9e62e1'),
	(13,104,73,'Button Group','buttonGroup',NULL,5,'',1,16,'2017-02-21 21:30:15','2017-02-23 12:01:17','aba8c89c-3429-4cd4-b166-f3f4be940041'),
	(14,104,74,'Accordion','accordion',NULL,NULL,'[\"accordionContent\"]',1,18,'2017-02-21 21:30:15','2017-02-23 12:01:17','39c71d8a-02fe-4715-9bd0-50ba9f674027'),
	(15,104,75,'Accordion Content','accordionContent',NULL,NULL,'[\"headline\",\"richText\",\"richTextMarginals\",\"quote\",\"imageGallery\",\"imageGrid\",\"imageSingle\",\"button\",\"buttonGroup\",\"twoColumns\",\"definitionList\",\"embed\",\"separator\",\"imageText\"]',0,19,'2017-02-21 21:30:15','2017-02-23 12:01:17','8d681d3f-f4e1-4be4-8e88-0908767afcb8'),
	(16,104,76,'Two Columns','twoColumns',NULL,2,'[\"column\"]',1,20,'2017-02-21 21:30:15','2017-02-23 12:01:17','2d25fdae-d55d-453d-bbf9-705befd1ce6e'),
	(17,104,77,'Column','column',NULL,NULL,'[\"headline\",\"richText\",\"quote\",\"imageGallery\",\"imageGrid\",\"imageSingle\",\"button\",\"buttonGroup\",\"accordion\",\"definitionList\",\"embed\",\"separator\"]',0,21,'2017-02-21 21:30:15','2017-02-23 12:01:17','b9e8f725-b23c-431d-87b1-aa3530eae5f1'),
	(18,104,78,'Definition List','definitionList',NULL,NULL,'',1,23,'2017-02-21 21:30:15','2017-02-23 12:01:17','cd036e4a-4763-423f-8905-021f940278a3'),
	(19,104,79,'Embed','embed',NULL,NULL,'',1,24,'2017-02-21 21:30:15','2017-02-23 12:01:17','5d9f9219-c773-45ff-b695-523d55d070b2'),
	(20,104,80,'Separator','separator',NULL,NULL,'',1,25,'2017-02-21 21:30:15','2017-02-23 12:01:17','efecfce7-281c-4cbd-a9c2-c2b74eaf8102'),
	(21,104,81,'Image + Text','imageText',NULL,1,'[\"buttonGroup\"]',1,27,'2017-02-21 21:30:15','2017-02-23 12:01:17','e6f6132c-a5bc-4b59-8d7a-fefadd6219ac');

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
	(7,104,'Text Modules',2,'2017-02-23 12:01:17','2017-02-23 12:01:17','a61b496c-535a-4021-8810-7fad4dc6b5c5'),
	(8,104,'Image Modules',8,'2017-02-23 12:01:17','2017-02-23 12:01:17','d1f160ae-1c03-432c-a612-b5b9596fbeab'),
	(9,104,'Button Modules',14,'2017-02-23 12:01:17','2017-02-23 12:01:17','a0054056-d94c-46ae-b4bf-0c5511d85568'),
	(10,104,'Content Wrapper',17,'2017-02-23 12:01:17','2017-02-23 12:01:17','80338de4-40cf-4ae7-93aa-ee68e5059458'),
	(11,104,'More Modules…',22,'2017-02-23 12:01:17','2017-02-23 12:01:17','596e1d53-7c08-400e-bc86-fd267c4a454c'),
	(12,104,'NOT READY YET',26,'2017-02-23 12:01:17','2017-02-23 12:01:17','52fee274-9581-4aff-aeb4-903b166a7c3e');

/*!40000 ALTER TABLE `craft_neogroups` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_pimpmymatrix_blocktypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_pimpmymatrix_blocktypes`;

CREATE TABLE `craft_pimpmymatrix_blocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `matrixBlockTypeId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `groupName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_pimpmymatrix_blocktypes_fieldId_fk` (`fieldId`),
  KEY `craft_pimpmymatrix_blocktypes_matrixBlockTypeId_fk` (`matrixBlockTypeId`),
  KEY `craft_pimpmymatrix_blocktypes_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_pimpmymatrix_blocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_pimpmymatrix_blocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_pimpmymatrix_blocktypes_matrixBlockTypeId_fk` FOREIGN KEY (`matrixBlockTypeId`) REFERENCES `craft_matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_pimpmymatrix_blocktypes` WRITE;
/*!40000 ALTER TABLE `craft_pimpmymatrix_blocktypes` DISABLE KEYS */;

INSERT INTO `craft_pimpmymatrix_blocktypes` (`id`, `fieldId`, `matrixBlockTypeId`, `fieldLayoutId`, `groupName`, `context`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(143,125,19,1296,'Wrapper','global','2017-02-08 17:16:06','2017-02-08 17:16:06','46c31764-29e9-44b4-8b4e-2edaf9bd4537'),
	(144,125,20,NULL,'Wrapper','global','2017-02-08 17:16:06','2017-02-08 17:16:06','5da76b64-9533-4962-821c-c62b41b907b0'),
	(145,125,23,NULL,'Text','global','2017-02-08 17:16:06','2017-02-08 17:16:06','8de3d188-d14f-4d7a-ae20-0dfcbba5aa0d'),
	(146,125,25,NULL,'Text','global','2017-02-08 17:16:06','2017-02-08 17:16:06','08752051-2e16-44cd-b225-e535a866789c'),
	(147,125,31,NULL,'Text','global','2017-02-08 17:16:06','2017-02-08 17:16:06','18e028a5-ad7f-44ca-99a6-08ab18e3d6c1'),
	(148,125,32,NULL,'Text','global','2017-02-08 17:16:06','2017-02-08 17:16:06','c247f5aa-03b0-419e-81cd-b9055361c7d8'),
	(149,125,33,NULL,'Text','global','2017-02-08 17:16:06','2017-02-08 17:16:06','ecc6e3da-efe9-4279-9183-57980b7c496e'),
	(150,125,27,NULL,'Images','global','2017-02-08 17:16:07','2017-02-08 17:16:07','ace95ac4-d595-4ba0-a307-df135c1fecb1'),
	(151,125,28,NULL,'Images','global','2017-02-08 17:16:07','2017-02-08 17:16:07','02acdbf6-388f-4d27-9263-7a29be963336'),
	(152,125,29,NULL,'Images','global','2017-02-08 17:16:07','2017-02-08 17:16:07','646b9888-ceb0-4268-bb06-1c42f09398fd'),
	(153,125,30,NULL,'Images','global','2017-02-08 17:16:07','2017-02-08 17:16:07','00ff502d-23b2-4044-bc70-894efd454f23'),
	(154,125,21,NULL,'Buttons','global','2017-02-08 17:16:07','2017-02-08 17:16:07','4a915141-86e1-4e7e-a0cb-55b5670a660f'),
	(155,125,22,NULL,'Buttons','global','2017-02-08 17:16:07','2017-02-08 17:16:07','e267859d-a244-484f-b83f-f9ed41452662'),
	(156,125,24,NULL,'More…','global','2017-02-08 17:16:07','2017-02-08 17:16:07','a96c1374-26e7-47da-8922-de075a1cb374'),
	(157,125,26,NULL,'More…','global','2017-02-08 17:16:07','2017-02-08 17:16:07','4de4ba54-0ac3-460d-b01e-65bb95107364');

/*!40000 ALTER TABLE `craft_pimpmymatrix_blocktypes` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_placid_accesstokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_placid_accesstokens`;

CREATE TABLE `craft_placid_accesstokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `forceQuery` tinyint(1) DEFAULT NULL,
  `encoded_token` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_placid_oauth_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_placid_oauth_tokens`;

CREATE TABLE `craft_placid_oauth_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tokenId` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_placid_oauth_tokens_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_placid_requests
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_placid_requests`;

CREATE TABLE `craft_placid_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tokenId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `oauth` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `params` text COLLATE utf8_unicode_ci,
  `headers` text COLLATE utf8_unicode_ci,
  `cache` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `cache_id` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_placid_requests_handle_unq_idx` (`handle`),
  KEY `craft_placid_requests_tokenId_fk` (`tokenId`),
  CONSTRAINT `craft_placid_requests_tokenId_fk` FOREIGN KEY (`tokenId`) REFERENCES `craft_placid_accesstokens` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_placid_requests` WRITE;
/*!40000 ALTER TABLE `craft_placid_requests` DISABLE KEYS */;

INSERT INTO `craft_placid_requests` (`id`, `tokenId`, `name`, `handle`, `url`, `oauth`, `params`, `headers`, `cache`, `cache_id`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,'Dribbble shots','dribbbleShots','http://api.dribbble.com/shots/everyone','','',NULL,1,NULL,'2016-11-21 16:33:52','2016-11-21 16:33:52','4a6e8d9c-d701-4ee8-96c4-ab235bc6d8ac');

/*!40000 ALTER TABLE `craft_placid_requests` ENABLE KEYS */;
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



# Export von Tabelle craft_reasons
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_reasons`;

CREATE TABLE `craft_reasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `conditionals` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_reasons_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_reasons_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE
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
	(7,'email',0,'en',' dan fredmansky at '),
	(7,'slug',0,'en',''),
	(7,'fullname',0,'en',' daniel wittberger '),
	(5,'slug',0,'en',''),
	(6,'username',0,'en',' andy '),
	(6,'firstname',0,'en',' andy '),
	(6,'lastname',0,'en',' schreyer '),
	(6,'fullname',0,'en',' andy schreyer '),
	(6,'email',0,'en',' andy fredmansky at '),
	(6,'slug',0,'en',''),
	(7,'username',0,'en',' dan '),
	(7,'firstname',0,'en',' daniel '),
	(7,'lastname',0,'en',' wittberger '),
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



# Export von Tabelle craft_simplemap_maps
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_simplemap_maps`;

CREATE TABLE `craft_simplemap_maps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `ownerLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lat` decimal(12,8) DEFAULT NULL,
  `lng` decimal(12,8) DEFAULT NULL,
  `zoom` int(10) DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parts` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_simplemap_maps_ownerId_idx` (`ownerId`),
  KEY `craft_simplemap_maps_fieldId_idx` (`fieldId`),
  KEY `craft_simplemap_maps_ownerLocale_fk` (`ownerLocale`),
  CONSTRAINT `craft_simplemap_maps_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_simplemap_maps_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_simplemap_maps_ownerLocale_fk` FOREIGN KEY (`ownerLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
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
	(1,NULL,'2017-02-21 21:30:10','2017-02-21 21:30:15','ab9bf0ec-57a6-4f22-b0be-0cb9f704c311'),
	(2,1,'2017-02-23 11:59:41','2017-02-23 12:00:56','76b5d042-3279-4750-add7-79f64df16d72');

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
	(12,63,58,'2017-02-21 21:30:13','2017-02-23 11:58:50','78c1aee8-021d-4892-84b3-ca8801a71a34'),
	(13,77,25,'2017-02-21 21:30:13','2017-02-21 21:30:13','506f284d-c4bb-4fdf-a753-07fc5b133e91'),
	(14,81,26,'2017-02-21 21:30:13','2017-02-21 21:30:14','aa3a6735-ff9e-4cbf-9a82-1954a4f0f07f'),
	(15,85,27,'2017-02-21 21:30:14','2017-02-21 21:30:14','f0784d25-1f26-41ab-99da-172acba73735'),
	(16,89,28,'2017-02-21 21:30:14','2017-02-21 21:30:14','127e6159-028e-4abd-bdc2-cd74de1bb983');

/*!40000 ALTER TABLE `craft_supertableblocktypes` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_1_modulbutton
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_1_modulbutton`;

CREATE TABLE `craft_supertablecontent_1_modulbutton` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_button` text COLLATE utf8_unicode_ci,
  `field_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'primary',
  `field_alignment` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'left',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_1_modulbutton_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_1_modulbutton_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_1_modulbutton_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_1_modulbutton_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_1_modulbutton` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_1_modulbutton` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_1_modulbutton` (`id`, `elementId`, `locale`, `field_button`, `field_style`, `field_alignment`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,216,'en','','primary','left','2017-02-08 00:15:26','2017-02-08 00:33:52','6cd04768-5d68-48e0-a7dc-ba070c8177e0'),
	(2,230,'en','','primary','left','2017-02-08 01:08:41','2017-02-08 01:08:41','97d797a6-5c06-4085-bd5f-4eaa8387c9e2');

/*!40000 ALTER TABLE `craft_supertablecontent_1_modulbutton` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_10_modulquote
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_10_modulquote`;

CREATE TABLE `craft_supertablecontent_10_modulquote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_quote` text COLLATE utf8_unicode_ci,
  `field_source` text COLLATE utf8_unicode_ci,
  `field_sourceLink` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_10_modulquote_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_10_modulquote_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_10_modulquote_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_10_modulquote_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_11_modulembed
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_11_modulembed`;

CREATE TABLE `craft_supertablecontent_11_modulembed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_code` text COLLATE utf8_unicode_ci,
  `field_source` text COLLATE utf8_unicode_ci,
  `field_sourceLink` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_11_modulembed_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_11_modulembed_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_11_modulembed_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_11_modulembed_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_12_modulsection
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_12_modulsection`;

CREATE TABLE `craft_supertablecontent_12_modulsection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_label` text COLLATE utf8_unicode_ci,
  `field_backgroundColor` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_12_modulsection_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_12_modulsection_locale_idx` (`locale`),
  CONSTRAINT `craft_supertablecontent_12_modulsection_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_12_modulsection_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_12_sectioninfos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_12_sectioninfos`;

CREATE TABLE `craft_supertablecontent_12_sectioninfos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_backgroundColor` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'white',
  `field_columnPadding` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'noPadding',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_12_sectioninfos_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_12_sectioninfos_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_12_sectioninfos_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_12_sectioninfos_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_14_marginalcolumns
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_14_marginalcolumns`;

CREATE TABLE `craft_supertablecontent_14_marginalcolumns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_14_marginalcolumn_elementId_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_14_marginalcolumns_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_14_marginalcolumns_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_14_marginalcolumns_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_14_marginalcolumns` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_14_marginalcolumns` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_14_marginalcolumns` (`id`, `elementId`, `locale`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,109,'en','2017-02-01 16:54:19','2017-02-01 16:57:01','ed0496a8-56fd-43c5-af43-bae02bd0119b'),
	(2,111,'en','2017-02-01 16:54:19','2017-02-01 16:57:01','6c611c06-0ac1-4be1-981e-c134341e32c7'),
	(3,114,'en','2017-02-01 16:57:01','2017-02-01 16:57:01','c7fc309e-77f6-422f-a441-46e8e38f92c8'),
	(6,121,'en','2017-02-01 17:08:40','2017-02-02 08:33:26','d14f2909-86b1-4365-951b-1b3e7ed3115f'),
	(7,123,'en','2017-02-01 17:08:40','2017-02-02 08:33:26','5737df52-fb08-4b92-b5cd-e9eb6a47cc15'),
	(8,126,'en','2017-02-01 17:08:40','2017-02-02 08:33:26','722a4fcc-2396-4cfe-bbad-316d09e4e4cd'),
	(9,128,'en','2017-02-01 17:08:40','2017-02-02 08:33:26','439cce3c-e1c0-452c-b6a3-de61cb3e2745'),
	(10,141,'en','2017-02-02 12:39:17','2017-02-07 09:43:41','98734b96-1246-4501-a117-5f1438adc2f3'),
	(11,143,'en','2017-02-02 12:39:17','2017-02-07 09:43:41','ff1f26ee-f466-4add-a8c2-70cff661e043'),
	(12,184,'en','2017-02-07 17:40:00','2017-02-07 17:54:24','462d41a5-f50e-476f-ab51-304d58e8eaa9'),
	(13,186,'en','2017-02-07 17:40:00','2017-02-07 17:54:24','67dd52c9-5b76-4d7e-950a-4a30f64b799a');

/*!40000 ALTER TABLE `craft_supertablecontent_14_marginalcolumns` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_17_modulimageslider
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_17_modulimageslider`;

CREATE TABLE `craft_supertablecontent_17_modulimageslider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_17_modulimageslide_elementI_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_17_modulimageslider_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_17_modulimageslider_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_17_modulimageslider_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_19_behaviour
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_19_behaviour`;

CREATE TABLE `craft_supertablecontent_19_behaviour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_width` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_19_behaviour_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_19_behaviour_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_19_behaviour_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_19_behaviour_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_19_behaviour` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_19_behaviour` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_19_behaviour` (`id`, `elementId`, `locale`, `field_width`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,211,'en','default','2017-02-08 23:20:23','2017-02-08 23:22:53','efb291ba-f7c0-414b-8fa9-a14be4640e57'),
	(2,216,'en','default','2017-02-08 23:31:11','2017-02-08 23:35:09','6b9ed27d-68ba-45ed-a5a9-87366d9d693c'),
	(3,223,'en','default','2017-02-09 20:53:49','2017-02-09 21:15:00','b8d8feed-e881-49f6-a441-4f7ec5e99133'),
	(4,226,'en','default','2017-02-09 21:14:53','2017-02-09 21:15:01','1d25abe2-965d-46ed-8ce3-4749a6b7e994'),
	(6,236,'en','default','2017-02-09 21:30:11','2017-02-13 12:53:05','26b32d2e-453c-4c6f-bde5-3d11f32e83a7'),
	(7,242,'en','default','2017-02-09 21:32:52','2017-02-09 22:28:31','131bfc67-e4b6-426b-88a4-68cc637a9005'),
	(8,245,'en','default','2017-02-09 21:32:59','2017-02-09 22:28:31','0876aa88-38a0-4017-96b9-c422f414219f'),
	(9,265,'en','default','2017-02-12 19:24:51','2017-02-13 12:53:05','9f9d27e7-e444-4490-884c-7cd6179ec233'),
	(10,272,'en','default','2017-02-13 10:51:41','2017-02-13 12:53:05','0bcdf39b-2de3-4fa5-a02c-79a058ab3ea5');

/*!40000 ALTER TABLE `craft_supertablecontent_19_behaviour` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_19_modulsection
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_19_modulsection`;

CREATE TABLE `craft_supertablecontent_19_modulsection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_backgroundColor` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_paddingVertical` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_textColor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_19_modulsection_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_19_modulsection_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_19_modulsection_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_19_modulsection_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_19_modulsection` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_19_modulsection` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_19_modulsection` (`id`, `elementId`, `locale`, `field_backgroundColor`, `field_paddingVertical`, `field_textColor`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,212,'en','default','default','default','2017-02-08 23:20:23','2017-02-08 23:22:53','95d244da-42c2-40ca-b81a-a8908f1cb446'),
	(2,217,'en','default','default','default','2017-02-08 23:31:11','2017-02-08 23:35:09','014e07cb-e064-4e00-bf9a-59f1b31781a7'),
	(3,224,'en','default','default','default','2017-02-09 20:53:49','2017-02-09 21:15:00','17ea25be-7584-42e9-ba7c-615c9f7e30ef'),
	(4,227,'en','default','default','default','2017-02-09 21:14:53','2017-02-09 21:15:01','aa97b3a0-f16f-437d-9d09-4438af01ebf0'),
	(6,237,'en','colorC','medium','white','2017-02-09 21:30:11','2017-02-13 12:53:05','91f5c821-facb-4fe4-afb9-49c972dfcdc0'),
	(7,243,'en','default','default','default','2017-02-09 21:32:52','2017-02-09 22:28:31','448b17e7-2043-4f53-8a54-0a2ecf65a055'),
	(8,246,'en','default','default','default','2017-02-09 21:32:59','2017-02-09 22:28:31','c8d2e337-b8f8-448d-bd5e-544df81db1d7'),
	(9,266,'en','default','default','default','2017-02-12 19:24:51','2017-02-13 12:53:05','c6c7a359-2f9d-4cc7-936a-6b051ff755f7'),
	(10,273,'en','default','default','default','2017-02-13 10:51:41','2017-02-13 12:53:05','b7d0912a-109f-45d2-b218-79215cd33270');

/*!40000 ALTER TABLE `craft_supertablecontent_19_modulsection` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_2_buttongroup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_2_buttongroup`;

CREATE TABLE `craft_supertablecontent_2_buttongroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_button` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_2_buttongroup_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_2_buttongroup_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_2_buttongroup_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_2_buttongroup_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_2_modulbutton
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_2_modulbutton`;

CREATE TABLE `craft_supertablecontent_2_modulbutton` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_button` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_2_modulbutton_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_2_modulbutton_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_2_modulbutton_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_2_modulbutton_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_21_modulbutton
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_21_modulbutton`;

CREATE TABLE `craft_supertablecontent_21_modulbutton` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_button` text COLLATE utf8_unicode_ci,
  `field_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'primary',
  `field_alignment` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'left',
  `field_withIcon` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `field_iconPosition` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'right',
  `field_icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'iconSample',
  `field_iconSize` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'small',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_21_modulbutton_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_21_modulbutton_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_21_modulbutton_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_21_modulbutton_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_21_modulbutton` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_21_modulbutton` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_21_modulbutton` (`id`, `elementId`, `locale`, `field_button`, `field_style`, `field_alignment`, `field_withIcon`, `field_iconPosition`, `field_icon`, `field_iconSize`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,219,'en','{\"type\":\"custom\",\"email\":\"\",\"tel\":\"\",\"custom\":\"http:\\/\\/davidhellmann.com\",\"entry\":\"\",\"asset\":\"\",\"category\":\"\",\"customText\":\"Link\",\"target\":\"\"}','primary','left','no','right','iconSample','small','2017-02-08 23:31:11','2017-02-09 21:15:01','b74d888b-7305-469b-9a8f-4a1bd377c2c0'),
	(2,221,'en','{\"type\":\"custom\",\"email\":\"\",\"tel\":\"\",\"custom\":\"http:\\/\\/davidhellmann.com\",\"entry\":\"\",\"asset\":\"\",\"category\":\"\",\"customText\":\"Link 2\",\"target\":\"\"}','primary','left','no','right','iconSample','small','2017-02-09 00:56:22','2017-02-09 21:15:01','b7487b4d-9533-4e62-8de3-de61d15f1938'),
	(3,240,'en','{\"type\":\"custom\",\"email\":\"\",\"tel\":\"\",\"custom\":\"http:\\/\\/google.com\",\"entry\":\"\",\"asset\":\"\",\"category\":\"\",\"customText\":\"Google\",\"target\":\"\"}','primary','left','no','right','iconSample','small','2017-02-09 21:32:52','2017-02-10 09:00:26','1dd88959-1885-43c2-9774-a5833104f9b0'),
	(4,249,'en','{\"type\":\"custom\",\"email\":\"\",\"tel\":\"\",\"custom\":\"http:\\/\\/google.com\",\"entry\":\"\",\"asset\":\"\",\"category\":\"\",\"customText\":\"Google\",\"target\":\"\"}','primary','left','no','right','iconSample','small','2017-02-09 21:33:56','2017-02-09 22:28:31','7f204b5b-44ff-4f18-80be-7fbbb9c66497'),
	(5,252,'en','{\"type\":\"custom\",\"email\":\"\",\"tel\":\"\",\"custom\":\"http:\\/\\/google.com\",\"entry\":\"\",\"asset\":\"\",\"category\":\"\",\"customText\":\"Google\",\"target\":\"\"}','primary','left','no','right','iconSample','small','2017-02-09 21:34:29','2017-02-09 22:28:31','fb1c53f2-5c7e-461d-aa18-d376f8dca863'),
	(6,254,'en','{\"type\":\"custom\",\"email\":\"\",\"tel\":\"\",\"custom\":\"http:\\/\\/google.com\",\"entry\":\"\",\"asset\":\"\",\"category\":\"\",\"customText\":\"Google\",\"target\":\"\"}','primary','center','no','right','iconSample','small','2017-02-09 22:28:01','2017-02-09 22:28:31','df2d379e-e815-4e9e-8088-6714eda01565'),
	(7,256,'en','{\"type\":\"custom\",\"email\":\"\",\"tel\":\"\",\"custom\":\"http:\\/\\/google.com\",\"entry\":\"\",\"asset\":\"\",\"category\":\"\",\"customText\":\"Google\",\"target\":\"\"}','primary','right','no','right','iconSample','small','2017-02-09 22:28:01','2017-02-09 22:28:31','eb41caeb-d64b-41c9-adb0-8d481201784d'),
	(8,258,'en','{\"type\":\"custom\",\"email\":\"\",\"tel\":\"\",\"custom\":\"http:\\/\\/google.com\",\"entry\":\"\",\"asset\":\"\",\"category\":\"\",\"customText\":\"Google\",\"target\":\"_blank\"}','primary','full','no','right','iconSample','small','2017-02-09 22:28:01','2017-02-09 22:28:31','524b5121-43d3-4c0b-8bd2-024f13007aa2'),
	(9,261,'en','{\"type\":\"custom\",\"email\":\"\",\"tel\":\"\",\"custom\":\"http:\\/\\/google.com\",\"entry\":\"\",\"asset\":\"\",\"category\":\"\",\"customText\":\"Google\",\"target\":\"\"}','primary','left','yes','right','iconSample','small','2017-02-10 09:37:24','2017-02-13 12:53:05','38398316-6f5c-4881-b4d6-b1d4541f6d5e');

/*!40000 ALTER TABLE `craft_supertablecontent_21_modulbutton` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_22_modulbutton
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_22_modulbutton`;

CREATE TABLE `craft_supertablecontent_22_modulbutton` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_button` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_22_modulbutton_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_22_modulbutton_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_22_modulbutton_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_22_modulbutton_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_24_modulembed
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_24_modulembed`;

CREATE TABLE `craft_supertablecontent_24_modulembed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_code` text COLLATE utf8_unicode_ci,
  `field_source` text COLLATE utf8_unicode_ci,
  `field_sourceLink` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_24_modulembed_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_24_modulembed_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_24_modulembed_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_24_modulembed_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_25_modulheadline
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_25_modulheadline`;

CREATE TABLE `craft_supertablecontent_25_modulheadline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_headline` text COLLATE utf8_unicode_ci,
  `field_semanticSize` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'h2',
  `field_visualSize` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_25_modulheadline_elementId_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_25_modulheadline_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_25_modulheadline_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_25_modulheadline_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_25_modulheadline` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_25_modulheadline` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_25_modulheadline` (`id`, `elementId`, `locale`, `field_headline`, `field_semanticSize`, `field_visualSize`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,263,'en','Ich bin eine Headline','h2','h2','2017-02-12 18:51:17','2017-02-13 12:53:05','3dec9efa-97ef-4283-9bb5-7cc9f0cfc5dd');

/*!40000 ALTER TABLE `craft_supertablecontent_25_modulheadline` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_27_modulimagecover
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_27_modulimagecover`;

CREATE TABLE `craft_supertablecontent_27_modulimagecover` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_imagePosition` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'center center',
  `field_imageCopy` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_27_modulimagecove_elementId_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_27_modulimagecover_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_27_modulimagecover_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_27_modulimagecover_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_28_modulimagegallery
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_28_modulimagegallery`;

CREATE TABLE `craft_supertablecontent_28_modulimagegallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_cols` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'cols-6',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_28_modulimagegaller_elementI_locale_unq_i` (`elementId`,`locale`),
  KEY `craft_supertablecontent_28_modulimagegallery_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_28_modulimagegallery_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_28_modulimagegallery_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_29_modulimagegrid
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_29_modulimagegrid`;

CREATE TABLE `craft_supertablecontent_29_modulimagegrid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_cols` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'cols-1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_29_modulimagegrid_elementId_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_29_modulimagegrid_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_29_modulimagegrid_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_29_modulimagegrid_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_30_modulimageslider
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_30_modulimageslider`;

CREATE TABLE `craft_supertablecontent_30_modulimageslider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_30_modulimageslide_elementI_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_30_modulimageslider_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_30_modulimageslider_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_30_modulimageslider_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_31_modulquote
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_31_modulquote`;

CREATE TABLE `craft_supertablecontent_31_modulquote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_quote` text COLLATE utf8_unicode_ci,
  `field_source` text COLLATE utf8_unicode_ci,
  `field_sourceLink` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_31_modulquote_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_31_modulquote_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_31_modulquote_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_31_modulquote_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_31_modulquote` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_31_modulquote` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_31_modulquote` (`id`, `elementId`, `locale`, `field_quote`, `field_source`, `field_sourceLink`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,269,'en','Es gibt nichts gutes außer man tut es ','Max Mustermann','{\"type\":\"custom\",\"custom\":\"http:\\/\\/google.com\"}','2017-02-12 19:27:55','2017-02-13 12:53:05','8ea3f9e5-8572-432a-9282-40996b940f0b');

/*!40000 ALTER TABLE `craft_supertablecontent_31_modulquote` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_33_marginalcolumns
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_33_marginalcolumns`;

CREATE TABLE `craft_supertablecontent_33_marginalcolumns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_33_marginalcolumn_elementId_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_33_marginalcolumns_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_33_marginalcolumns_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_33_marginalcolumns_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_36_behaviour
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_36_behaviour`;

CREATE TABLE `craft_supertablecontent_36_behaviour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_width` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_36_behaviour_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_36_behaviour_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_36_behaviour_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_36_behaviour_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_36_modulsection
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_36_modulsection`;

CREATE TABLE `craft_supertablecontent_36_modulsection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_backgroundColor` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_paddingVertical` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_textColor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_36_modulsection_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_36_modulsection_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_36_modulsection_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_36_modulsection_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_38_modulbutton
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_38_modulbutton`;

CREATE TABLE `craft_supertablecontent_38_modulbutton` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_button` text COLLATE utf8_unicode_ci,
  `field_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'primary',
  `field_alignment` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'left',
  `field_withIcon` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `field_iconPosition` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'right',
  `field_iconSize` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'small',
  `field_icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'iconSample',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_38_modulbutton_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_38_modulbutton_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_38_modulbutton_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_38_modulbutton_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_39_modulbutton
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_39_modulbutton`;

CREATE TABLE `craft_supertablecontent_39_modulbutton` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_button` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_39_modulbutton_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_39_modulbutton_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_39_modulbutton_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_39_modulbutton_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_41_modulembed
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_41_modulembed`;

CREATE TABLE `craft_supertablecontent_41_modulembed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_code` text COLLATE utf8_unicode_ci,
  `field_source` text COLLATE utf8_unicode_ci,
  `field_sourceLink` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_41_modulembed_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_41_modulembed_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_41_modulembed_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_41_modulembed_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_42_modulheadline
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_42_modulheadline`;

CREATE TABLE `craft_supertablecontent_42_modulheadline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_headline` text COLLATE utf8_unicode_ci,
  `field_semanticSize` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'h2',
  `field_visualSize` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_42_modulheadline_elementId_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_42_modulheadline_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_42_modulheadline_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_42_modulheadline_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_44_modulimagecover
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_44_modulimagecover`;

CREATE TABLE `craft_supertablecontent_44_modulimagecover` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_imagePosition` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'center center',
  `field_imageCopy` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_44_modulimagecove_elementId_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_44_modulimagecover_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_44_modulimagecover_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_44_modulimagecover_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_45_modulimagegallery
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_45_modulimagegallery`;

CREATE TABLE `craft_supertablecontent_45_modulimagegallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_cols` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'cols-6',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_45_modulimagegaller_elementI_locale_unq_i` (`elementId`,`locale`),
  KEY `craft_supertablecontent_45_modulimagegallery_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_45_modulimagegallery_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_45_modulimagegallery_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_46_modulimagegrid
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_46_modulimagegrid`;

CREATE TABLE `craft_supertablecontent_46_modulimagegrid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_cols` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'cols-1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_46_modulimagegrid_elementId_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_46_modulimagegrid_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_46_modulimagegrid_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_46_modulimagegrid_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_47_modulimageslider
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_47_modulimageslider`;

CREATE TABLE `craft_supertablecontent_47_modulimageslider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_47_modulimageslide_elementI_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_47_modulimageslider_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_47_modulimageslider_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_47_modulimageslider_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_48_modulquote
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_48_modulquote`;

CREATE TABLE `craft_supertablecontent_48_modulquote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_quote` text COLLATE utf8_unicode_ci,
  `field_source` text COLLATE utf8_unicode_ci,
  `field_sourceLink` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_48_modulquote_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_48_modulquote_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_48_modulquote_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_48_modulquote_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_5_modulheadline
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_5_modulheadline`;

CREATE TABLE `craft_supertablecontent_5_modulheadline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_headline` text COLLATE utf8_unicode_ci,
  `field_semanticSize` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'h2',
  `field_visualSize` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_5_modulheadline_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_5_modulheadline_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_5_modulheadline_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_5_modulheadline_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_5_modulheadline` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_5_modulheadline` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_5_modulheadline` (`id`, `elementId`, `locale`, `field_headline`, `field_semanticSize`, `field_visualSize`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(2,221,'en','','h2','default','2017-02-08 00:30:36','2017-02-08 01:08:41','7e207234-8207-4982-a013-6fcddbf3c0ff');

/*!40000 ALTER TABLE `craft_supertablecontent_5_modulheadline` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_50_marginalcolumns
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_50_marginalcolumns`;

CREATE TABLE `craft_supertablecontent_50_marginalcolumns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_50_marginalcolumn_elementId_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_50_marginalcolumns_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_50_marginalcolumns_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_50_marginalcolumns_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_7_modulimagecover
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_7_modulimagecover`;

CREATE TABLE `craft_supertablecontent_7_modulimagecover` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_imagePosition` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'center center',
  `field_imageCopy` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_7_modulimagecove_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_7_modulimagecover_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_7_modulimagecover_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_7_modulimagecover_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_7_modulimagecover` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_7_modulimagecover` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_7_modulimagecover` (`id`, `elementId`, `locale`, `field_imagePosition`, `field_imageCopy`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,224,'en','center center','','2017-02-08 00:30:36','2017-02-08 01:08:41','3d57db3e-ab42-4545-9934-6e802e316362');

/*!40000 ALTER TABLE `craft_supertablecontent_7_modulimagecover` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_8_modulimagegallery
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_8_modulimagegallery`;

CREATE TABLE `craft_supertablecontent_8_modulimagegallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_cols` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'cols-6',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_8_modulimagegaller_elementI_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_8_modulimagegallery_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_8_modulimagegallery_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_8_modulimagegallery_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_8_modulimagegallery` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_8_modulimagegallery` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_8_modulimagegallery` (`id`, `elementId`, `locale`, `field_cols`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,226,'en','cols-6','2017-02-08 00:30:36','2017-02-08 01:08:41','01f0d3cc-d775-44c8-aad5-6dc00dc3a21b');

/*!40000 ALTER TABLE `craft_supertablecontent_8_modulimagegallery` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_9_modulimagegrid
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_9_modulimagegrid`;

CREATE TABLE `craft_supertablecontent_9_modulimagegrid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_cols` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'cols-1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_9_modulimagegrid_elementId_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_9_modulimagegrid_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_9_modulimagegrid_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_9_modulimagegrid_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_9_modulimagegrid` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_9_modulimagegrid` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_9_modulimagegrid` (`id`, `elementId`, `locale`, `field_cols`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,228,'en','cols-2','2017-02-08 00:30:36','2017-02-08 01:08:41','efb54c20-2081-4670-bc8f-8d21e6fae837');

/*!40000 ALTER TABLE `craft_supertablecontent_9_modulimagegrid` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_behavioursection
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_behavioursection`;

CREATE TABLE `craft_supertablecontent_behavioursection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_width` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_paddingVertical` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_behavioursection_elementId_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_behavioursection_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_behavioursection_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_behavioursection_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_button
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_button`;

CREATE TABLE `craft_supertablecontent_button` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_button` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_button_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_button_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_button_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_button_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_button` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_button` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_button` (`id`, `elementId`, `locale`, `field_button`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,70,'de','{\"type\":\"entry\",\"email\":\"\",\"tel\":\"\",\"custom\":\"\",\"entry\":[\"40\"],\"asset\":\"\",\"category\":\"\",\"text\":\"CUSTOM TEXT\",\"target\":\"\"}','2016-12-02 11:52:23','2016-12-02 11:52:23','194fd296-b198-47fa-bf6f-da379a045951');

/*!40000 ALTER TABLE `craft_supertablecontent_button` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_buttons
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_buttons`;

CREATE TABLE `craft_supertablecontent_buttons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_button` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_buttons_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_buttons_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_buttons_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_buttons_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_caption
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_caption`;

CREATE TABLE `craft_supertablecontent_caption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_copy` text COLLATE utf8_unicode_ci,
  `field_source` text COLLATE utf8_unicode_ci,
  `field_sourceUrl` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_caption_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_caption_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_caption_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_caption_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_code
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_code`;

CREATE TABLE `craft_supertablecontent_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_language` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'plainText',
  `field_snippet` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_code_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_code_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_code_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_code_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_codepen
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_codepen`;

CREATE TABLE `craft_supertablecontent_codepen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_codepenTitle` text COLLATE utf8_unicode_ci,
  `field_codepenId` text COLLATE utf8_unicode_ci,
  `field_codepenUsername` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_codepen_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_codepen_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_codepen_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_codepen_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_columnsettings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_columnsettings`;

CREATE TABLE `craft_supertablecontent_columnsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_padding` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_columnsettings_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_columnsettings_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_columnsettings_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_columnsettings_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_contactmeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_contactmeta`;

CREATE TABLE `craft_supertablecontent_contactmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_headline` text COLLATE utf8_unicode_ci,
  `field_bio` text COLLATE utf8_unicode_ci,
  `field_eMail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_phone` text COLLATE utf8_unicode_ci,
  `field_jobTitle` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_contactmeta_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_contactmeta_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_contactmeta_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_contactmeta_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_contactmeta` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_contactmeta` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_contactmeta` (`id`, `elementId`, `locale`, `field_headline`, `field_bio`, `field_eMail`, `field_phone`, `field_jobTitle`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(2,79,'en','Headline','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.</p>','georg@kusser.com','+49 992 2343242 34234','Ing.','2016-12-02 12:28:13','2016-12-02 12:33:08','9344569b-9e42-4892-8603-1a6864f4ec28'),
	(3,80,'de','CUSTOM','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.</p>','davidhellmann.com@de.com','+65+4+','Ing','2016-12-02 12:42:49','2016-12-02 12:42:49','99b8d310-d453-4693-8159-ca52125b38c8');

/*!40000 ALTER TABLE `craft_supertablecontent_contactmeta` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_cta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_cta`;

CREATE TABLE `craft_supertablecontent_cta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_button` text COLLATE utf8_unicode_ci,
  `field_headline` text COLLATE utf8_unicode_ci,
  `field_copy` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_cta_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_cta_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_cta_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_cta_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_gist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_gist`;

CREATE TABLE `craft_supertablecontent_gist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_gistId` text COLLATE utf8_unicode_ci,
  `field_gistUsername` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_gist_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_gist_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_gist_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_gist_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
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



# Export von Tabelle craft_supertablecontent_headline
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_headline`;

CREATE TABLE `craft_supertablecontent_headline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_copy` text COLLATE utf8_unicode_ci,
  `field_size` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'notSet',
  `field_visualSize` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'notSet',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_headline_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_headline_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_headline_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_headline_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_imagefull
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_imagefull`;

CREATE TABLE `craft_supertablecontent_imagefull` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_caption` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_imagefull_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_imagefull_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_imagefull_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_imagefull_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_imagegallery
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_imagegallery`;

CREATE TABLE `craft_supertablecontent_imagegallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'lightbox',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_imagegallery_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_imagegallery_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_imagegallery_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_imagegallery_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_imagegrid
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_imagegrid`;

CREATE TABLE `craft_supertablecontent_imagegrid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_cols` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'cols--1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_imagegrid_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_imagegrid_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_imagegrid_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_imagegrid_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_modulbutton
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_modulbutton`;

CREATE TABLE `craft_supertablecontent_modulbutton` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_button` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_modulbutton_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_modulbutton_locale_idx` (`locale`),
  CONSTRAINT `craft_supertablecontent_modulbutton_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_modulbutton_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_modulcaption
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_modulcaption`;

CREATE TABLE `craft_supertablecontent_modulcaption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_caption` text COLLATE utf8_unicode_ci,
  `field_source` text COLLATE utf8_unicode_ci,
  `field_sourceUrl` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_modulcaption_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_modulcaption_locale_idx` (`locale`),
  CONSTRAINT `craft_supertablecontent_modulcaption_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_modulcaption_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_modulcaption` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_modulcaption` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_modulcaption` (`id`, `elementId`, `locale`, `field_caption`, `field_source`, `field_sourceUrl`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,35,'en','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.','ada','{\"type\":\"custom\",\"custom\":\"http:\\/\\/bla.blub\"}','2016-12-02 08:12:33','2016-12-02 08:12:33','b8420267-925b-49d7-b126-8e10d1c4b855');

/*!40000 ALTER TABLE `craft_supertablecontent_modulcaption` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_modulembed
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_modulembed`;

CREATE TABLE `craft_supertablecontent_modulembed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_code` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_modulembed_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_modulembed_locale_idx` (`locale`),
  CONSTRAINT `craft_supertablecontent_modulembed_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_modulembed_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_modulembed` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_modulembed` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_modulembed` (`id`, `elementId`, `locale`, `field_code`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(2,164,'en','','2017-02-07 09:43:41','2017-02-07 13:59:38','e69d0086-6cf4-4f03-8167-6ee8c133160b');

/*!40000 ALTER TABLE `craft_supertablecontent_modulembed` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_modulheadline
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_modulheadline`;

CREATE TABLE `craft_supertablecontent_modulheadline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_headline` text COLLATE utf8_unicode_ci,
  `field_semanticSize` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'h2',
  `field_visualSize` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_modulheadline_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_modulheadline_locale_idx` (`locale`),
  CONSTRAINT `craft_supertablecontent_modulheadline_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_modulheadline_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_modulheadline` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_modulheadline` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_modulheadline` (`id`, `elementId`, `locale`, `field_headline`, `field_semanticSize`, `field_visualSize`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(2,11,'en','test','','','2016-11-23 11:10:34','2016-11-23 12:47:19','69dbc56c-9c5b-436e-981e-049292b8fc21'),
	(3,92,'en','sadad','','','2017-01-30 11:33:02','2017-01-30 11:33:02','ba09894b-0148-48fb-b7f5-e42f0de6dcb9'),
	(4,174,'en','','','','2017-02-07 17:40:00','2017-02-07 17:40:00','21e155b6-b09c-45bd-873d-685a3a31d73a'),
	(5,287,'en',NULL,'h2','','2017-02-13 11:32:59','2017-02-13 11:32:59','9cb39b6e-ced7-47f6-bf41-3eaafa8e9a73'),
	(6,293,'en','Headline','h2','default','2017-02-13 11:39:50','2017-02-13 11:40:28','707ed1bb-64bd-450a-bb63-7b2e4e0fba6d');

/*!40000 ALTER TABLE `craft_supertablecontent_modulheadline` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_modulimagecover
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_modulimagecover`;

CREATE TABLE `craft_supertablecontent_modulimagecover` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_caption` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_modulimagecover_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_modulimagecover_locale_idx` (`locale`),
  CONSTRAINT `craft_supertablecontent_modulimagecover_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_modulimagecover_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_modulimagegallery
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_modulimagegallery`;

CREATE TABLE `craft_supertablecontent_modulimagegallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_cols` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'cols-4',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_modulimagegaller_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_modulimagegallery_locale_idx` (`locale`),
  CONSTRAINT `craft_supertablecontent_modulimagegallery_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_modulimagegallery_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_modulimagegrid
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_modulimagegrid`;

CREATE TABLE `craft_supertablecontent_modulimagegrid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_cols` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'cols-2',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_modulimagegrid_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_modulimagegrid_locale_idx` (`locale`),
  CONSTRAINT `craft_supertablecontent_modulimagegrid_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_modulimagegrid_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_modulquote
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_modulquote`;

CREATE TABLE `craft_supertablecontent_modulquote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_quote` text COLLATE utf8_unicode_ci,
  `field_source` text COLLATE utf8_unicode_ci,
  `field_sourceUrl` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_modulquote_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_modulquote_locale_idx` (`locale`),
  CONSTRAINT `craft_supertablecontent_modulquote_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_modulquote_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_modulquote` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_modulquote` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_modulquote` (`id`, `elementId`, `locale`, `field_quote`, `field_source`, `field_sourceUrl`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,300,'en','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.','Da ist das her','','2017-02-13 11:39:50','2017-02-13 11:40:28','76dd7734-efe7-48d7-85c9-4d53a40fa0be');

/*!40000 ALTER TABLE `craft_supertablecontent_modulquote` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_portfoliometa
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_portfoliometa`;

CREATE TABLE `craft_supertablecontent_portfoliometa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_jahr` datetime DEFAULT NULL,
  `field_abmessungen` text COLLATE utf8_unicode_ci,
  `field_bauherr` text COLLATE utf8_unicode_ci,
  `field_info` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_portfoliometa_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_portfoliometa_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_portfoliometa_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_portfoliometa_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_portfoliometa` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_portfoliometa` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_portfoliometa` (`id`, `elementId`, `locale`, `field_jahr`, `field_abmessungen`, `field_bauherr`, `field_info`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,45,'de',NULL,'','','','2016-12-02 09:34:46','2016-12-02 14:27:44','c6aaf919-71ea-486b-bd6b-93aca7839139');

/*!40000 ALTER TABLE `craft_supertablecontent_portfoliometa` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_portfoliometabridge
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_portfoliometabridge`;

CREATE TABLE `craft_supertablecontent_portfoliometabridge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_jahr` datetime DEFAULT NULL,
  `field_abmessungen` text COLLATE utf8_unicode_ci,
  `field_bauherr` text COLLATE utf8_unicode_ci,
  `field_info` text COLLATE utf8_unicode_ci,
  `field_laenge` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_portfoliometabridg_elementI_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_portfoliometabridge_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_portfoliometabridge_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_portfoliometabridge_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_portfoliometabridge` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_portfoliometabridge` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_portfoliometabridge` (`id`, `elementId`, `locale`, `field_jahr`, `field_abmessungen`, `field_bauherr`, `field_info`, `field_laenge`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,41,'en',NULL,'','','','lt3','2016-12-02 08:57:21','2016-12-02 08:57:21','1e8b567e-f8ef-4fe3-aa36-1b80e4b12355'),
	(2,44,'de','2014-11-30 23:00:00','L: 100m\r\nB: 50m\r\nT: 300m','Ich AG','<p>Lorem ipsum dolor sit <strong>amet</strong>, consectetur adipiscing elit. Phasellus quis lectus metus, at <em>posuere</em> neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue <strong>scelerisque</strong> bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.</p>','3t6','2016-12-02 09:01:37','2016-12-02 09:01:37','960b0b83-1f26-4fa8-ac05-959073a5e6a1');

/*!40000 ALTER TABLE `craft_supertablecontent_portfoliometabridge` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_quote
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_quote`;

CREATE TABLE `craft_supertablecontent_quote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_copy` text COLLATE utf8_unicode_ci,
  `field_source` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_quote_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_quote_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_quote_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_quote_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_sectionsettings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_sectionsettings`;

CREATE TABLE `craft_supertablecontent_sectionsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_backgroundColor` char(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_sectionsettings_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_sectionsettings_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_sectionsettings_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_sectionsettings_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_sectionsettings` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_sectionsettings` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_sectionsettings` (`id`, `elementId`, `locale`, `field_backgroundColor`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,14,'de','#fff700','2016-11-23 17:09:40','2016-11-23 17:58:25','c413a611-13d8-478e-96e6-e5c530329ac5'),
	(2,26,'de','#000000','2016-11-25 11:09:37','2016-11-25 11:09:37','efa61a62-70b9-47df-861f-44585a91d8e4'),
	(3,47,'de','#000000','2016-12-02 09:37:41','2016-12-02 09:37:41','e8631228-fcce-47a7-b023-e15ef2cc335c'),
	(4,57,'de','#000000','2016-12-02 11:07:28','2016-12-02 11:33:11','a4af0951-ac38-432b-983e-60494bf9d8df'),
	(5,85,'de','#000000','2016-12-02 14:27:44','2016-12-02 14:27:44','1e97e178-7054-4415-a534-d988ce646f67');

/*!40000 ALTER TABLE `craft_supertablecontent_sectionsettings` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_segmentsettings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_segmentsettings`;

CREATE TABLE `craft_supertablecontent_segmentsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_backgroundColor` char(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_segmentsettings_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_segmentsettings_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_segmentsettings_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_segmentsettings_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_settingbutton
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingbutton`;

CREATE TABLE `craft_supertablecontent_settingbutton` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'primary',
  `field_alignment` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_withIcon` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
  `field_iconPosition` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'right',
  `field_iconSize` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'small',
  `field_icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_settingbutton_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingbutton_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingbutton_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingbutton_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_settingbutton` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_settingbutton` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_settingbutton` (`id`, `elementId`, `locale`, `field_style`, `field_alignment`, `field_withIcon`, `field_iconPosition`, `field_iconSize`, `field_icon`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,326,'en','primary','default','no','right','small','default','2017-02-13 23:59:51','2017-02-13 23:59:51','a06b7359-f0c3-4792-8e60-d12d38983851');

/*!40000 ALTER TABLE `craft_supertablecontent_settingbutton` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_settingcolumns
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingcolumns`;

CREATE TABLE `craft_supertablecontent_settingcolumns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_padding` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_settingcolumns_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingcolumns_locale_idx` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingcolumns_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingcolumns_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_settingcolumns` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_settingcolumns` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_settingcolumns` (`id`, `elementId`, `locale`, `field_padding`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,90,'en',1,'2017-01-30 11:33:01','2017-01-30 11:33:01','f65f0dc4-7200-4c62-8b70-6a6a94e40620'),
	(2,96,'en',1,'2017-02-01 16:16:13','2017-02-01 16:16:13','8ea72b40-644d-43db-aac4-5c15f3ff5b14'),
	(3,161,'en',1,'2017-02-07 09:43:41','2017-02-07 09:43:41','cdac2d53-8eb2-4c9d-968c-2249a29bd416'),
	(4,172,'en',1,'2017-02-07 17:40:00','2017-02-07 17:40:00','fbc908a6-48c8-41d6-b111-92e2c69ab213'),
	(5,178,'en',1,'2017-02-07 17:40:00','2017-02-07 17:40:00','3e17cd0c-c4dd-4948-bbb6-d4b227c19203'),
	(6,276,'en',1,'2017-02-13 10:51:41','2017-02-13 10:51:41','7ee454b3-720a-4c39-8cb5-f4f6f41fb590'),
	(7,280,'en',1,'2017-02-13 10:51:41','2017-02-13 10:51:41','f512bb0f-17cd-4e60-a221-07ef5ea26952'),
	(8,291,'en',1,'2017-02-13 11:39:50','2017-02-13 11:39:50','d346f761-b38a-43e9-8200-050c022ba420'),
	(9,297,'en',1,'2017-02-13 11:39:50','2017-02-13 11:39:50','ad704338-ce38-4b97-aedc-96d50af91eb1');

/*!40000 ALTER TABLE `craft_supertablecontent_settingcolumns` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_settingheadline
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingheadline`;

CREATE TABLE `craft_supertablecontent_settingheadline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_semanticSize` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'h2',
  `field_visualSize` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_settingheadline_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingheadline_locale_idx` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingheadline_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingheadline_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_settingheadline` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_settingheadline` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_settingheadline` (`id`, `elementId`, `locale`, `field_semanticSize`, `field_visualSize`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(2,11,'en','','','2016-11-23 11:10:34','2016-11-23 12:47:19','69dbc56c-9c5b-436e-981e-049292b8fc21'),
	(3,92,'en','','','2017-01-30 11:33:02','2017-01-30 11:33:02','ba09894b-0148-48fb-b7f5-e42f0de6dcb9'),
	(4,174,'en','','','2017-02-07 17:40:00','2017-02-07 17:40:00','21e155b6-b09c-45bd-873d-685a3a31d73a'),
	(5,287,'en','h2','','2017-02-13 11:32:59','2017-02-13 11:32:59','9cb39b6e-ced7-47f6-bf41-3eaafa8e9a73'),
	(6,293,'en','h2','default','2017-02-13 11:39:50','2017-02-13 23:39:22','707ed1bb-64bd-450a-bb63-7b2e4e0fba6d'),
	(7,310,'en','h2','default','2017-02-13 23:34:14','2017-02-13 23:39:22','a492e34c-5331-45cc-a6d8-855ada003726'),
	(8,318,'en','h2','default','2017-02-13 23:55:58','2017-02-13 23:59:50','9e23139e-a994-4949-8d92-3c4843e8000b');

/*!40000 ALTER TABLE `craft_supertablecontent_settingheadline` ENABLE KEYS */;
UNLOCK TABLES;


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



# Export von Tabelle craft_supertablecontent_settingsection
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingsection`;

CREATE TABLE `craft_supertablecontent_settingsection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_backgroundColor` char(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_textColor` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_paddingVertical` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_width` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_settingsection_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingsection_locale_idx` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingsection_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingsection_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_settingsection` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_settingsection` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_settingsection` (`id`, `elementId`, `locale`, `field_backgroundColor`, `field_textColor`, `field_paddingVertical`, `field_width`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,89,'en','#000000','default','default','default','2017-01-30 11:33:01','2017-01-30 11:33:01','76270d11-f6ff-41e2-8951-40884f5d6c73'),
	(2,95,'en','#000000','default','default','default','2017-02-01 16:16:13','2017-02-01 16:16:13','a4cad5f3-4d27-42ee-8cec-4a57dc60eb94'),
	(3,160,'en','#000000','default','default','default','2017-02-07 09:43:41','2017-02-07 09:43:41','c9598fa2-e0e8-482d-88fc-1bdfcc3d0a21'),
	(4,171,'en','#000000','default','default','default','2017-02-07 17:39:59','2017-02-07 17:39:59','3da6a49c-4e8f-4df6-8fef-6148f4b43cc3'),
	(5,177,'en','#000000','default','default','default','2017-02-07 17:40:00','2017-02-07 17:40:00','28249aa5-ea6a-4a31-848a-0e04f8e044f0'),
	(6,275,'en','#000000','default','default','default','2017-02-13 10:51:41','2017-02-13 10:51:41','88f6f3e1-1837-4462-ae66-11e7451f2d68'),
	(7,279,'en','#000000','default','default','default','2017-02-13 10:51:41','2017-02-13 10:51:41','8e10a4e4-a71c-4bb1-b9b7-cce6d80057a5'),
	(8,290,'en','#000000','default','default','default','2017-02-13 11:39:50','2017-02-13 23:39:22','38f8ff79-0413-4bcc-80fd-22611c52842c'),
	(9,296,'en','#000000','default','default','default','2017-02-13 11:39:50','2017-02-13 23:39:22','2844094a-02ae-4293-b917-31d8d66511e1'),
	(10,316,'en','#000000','default','default','default','2017-02-13 23:55:58','2017-02-13 23:59:50','48a6ee01-f88c-4ca7-affd-cc39e5a9bb3a');

/*!40000 ALTER TABLE `craft_supertablecontent_settingsection` ENABLE KEYS */;
UNLOCK TABLES;


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



# Export von Tabelle craft_supertablecontent_settingstwocols
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingstwocols`;

CREATE TABLE `craft_supertablecontent_settingstwocols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_columnsRatio` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_settingstwocols_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingstwocols_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingstwocols_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingstwocols_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_settingstwocols` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_settingstwocols` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_settingstwocols` (`id`, `elementId`, `locale`, `field_columnsRatio`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,418,'en','default','2017-02-18 18:20:12','2017-02-19 23:54:06','56ad7f8b-8c77-415b-8e48-e9a4177898d9'),
	(2,469,'en','50-50','2017-02-19 22:09:37','2017-02-19 23:54:06','3411e014-1439-4794-bdc7-f4138b759de7'),
	(3,483,'en','66-33','2017-02-19 22:09:38','2017-02-19 23:54:06','be8684e2-17d7-4830-82ee-52654b70481f'),
	(4,497,'en','75-25','2017-02-19 22:09:38','2017-02-19 23:54:07','d2158fb3-8269-479f-873b-69687dc1534c'),
	(5,511,'en','25-75','2017-02-19 22:09:38','2017-02-19 23:54:07','1f80b6a5-9972-4455-9c52-c74c6d36bc03'),
	(6,525,'en','33-66','2017-02-19 22:12:33','2017-02-19 23:54:07','15a75e73-292b-4498-808c-4debe7d3ed41'),
	(7,601,'en','default','2017-02-20 08:12:58','2017-02-20 08:12:58','8dece17e-f4cd-45f7-a088-a63e04ffc00a');

/*!40000 ALTER TABLE `craft_supertablecontent_settingstwocols` ENABLE KEYS */;
UNLOCK TABLES;


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
	(1,'davidhellmann',NULL,'David','Hellmann','david@fredmansky.at','$2y$13$XdeudxRcgdiqby0iPzCIkuwd.RoJB/GdieXO/kHdgMuyfwxEqI4WG',NULL,1,1,0,0,0,0,0,'2017-02-21 21:25:05','::1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2017-02-21 21:25:03','2017-02-21 21:25:03','2017-02-21 21:28:15','a3222b4f-e824-4ab5-a27f-6a450b2c9525'),
	(6,'andy',NULL,'Andy','Schreyer','andy@fredmansky.at',NULL,NULL,1,1,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'$2y$13$TKXg2Plrux6WEK8CqQ/rw.PskoeNH7E9Q6q0BiVfAqDt2FJUdzMCG','2017-02-21 21:30:17',NULL,0,NULL,'2017-02-21 21:30:15','2017-02-21 21:30:17','6d32c057-73fd-4ddf-b5cd-cb449e74e164'),
	(7,'dan',NULL,'Daniel','Wittberger','dan@fredmansky.at',NULL,NULL,1,1,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'$2y$13$Hl6SFY4Q6/FcCp.BKQVrxuPrkVUGcU3vtqsU32.7guyjkOtR/ejMG','2017-02-21 21:30:19',NULL,0,NULL,'2017-02-21 21:30:17','2017-02-21 21:30:19','0f38a6ac-82c0-4268-936d-00ce423d2efa');

/*!40000 ALTER TABLE `craft_users` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_visitscount_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_visitscount_history`;

CREATE TABLE `craft_visitscount_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry` int(10) DEFAULT NULL,
  `sessionId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



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
