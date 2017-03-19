# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.6.33)
# Datenbank: db66095865_craftcms
# Erstellt am: 2017-03-19 15:27:44 +0000
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

LOCK TABLES `craft_assetfiles` WRITE;
/*!40000 ALTER TABLE `craft_assetfiles` DISABLE KEYS */;

INSERT INTO `craft_assetfiles` (`id`, `sourceId`, `folderId`, `filename`, `kind`, `width`, `height`, `size`, `dateModified`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(17,1,1,'accessventures_preview.jpg','image',1280,800,60967,'2017-03-05 17:49:58','2017-03-19 14:40:07','2017-03-19 14:40:07','82513d61-8939-405a-b0ea-07a67d24888a'),
	(18,1,1,'andreabrugi_preview.jpg','image',1280,800,131176,'2017-03-05 17:49:58','2017-03-19 14:40:08','2017-03-19 14:40:08','bc91488e-86d9-4a33-8c6e-6258ae830bf3'),
	(19,1,1,'daniel-hyngar_preview.jpeg','image',1280,800,60420,'2017-03-05 17:49:58','2017-03-19 14:40:08','2017-03-19 14:40:08','79d1401f-98d0-4e69-8dc3-f584178fe4a5'),
	(20,1,1,'admirhadzic_preview.jpg','image',1280,800,34465,'2017-03-05 17:49:58','2017-03-19 14:40:08','2017-03-19 14:40:08','9e15590d-7fb8-41b3-b5ba-5c0b2a780d43'),
	(21,1,1,'firstround_preview.jpg','image',1280,800,39227,'2017-03-05 17:49:58','2017-03-19 14:40:09','2017-03-19 14:40:09','41006ed2-6789-4311-9781-f273e64e2121'),
	(22,1,1,'glamuzina-architects_preview.jpg','image',1280,800,73723,'2017-03-05 17:49:58','2017-03-19 14:40:09','2017-03-19 14:40:09','3297bae8-125f-4001-9126-646869a4399b'),
	(23,1,1,'milanote_preview.jpg','image',1280,800,86298,'2017-03-05 17:49:58','2017-03-19 14:40:09','2017-03-19 14:40:09','a5f823bc-952b-467c-96a8-3b4e99d0f503'),
	(24,1,1,'panoply_preview.jpg','image',1280,800,147819,'2017-03-05 17:49:58','2017-03-19 14:40:09','2017-03-19 14:40:09','3cb7c6cd-c8e7-41fa-8f6b-5884c45a961d'),
	(25,1,1,'red-collar_preview.jpg','image',1280,800,49515,'2017-03-05 17:49:58','2017-03-19 14:40:10','2017-03-19 14:40:10','b3d0d33b-fe5c-4619-b5cf-3d7ba1c1ecf7'),
	(26,1,1,'sa-studio_preview.jpg','image',1280,800,45460,'2017-03-05 17:49:58','2017-03-19 14:40:10','2017-03-19 14:40:10','413f1ff5-312a-437b-ad12-25af1d9b9ac5');

/*!40000 ALTER TABLE `craft_assetfiles` ENABLE KEYS */;
UNLOCK TABLES;


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
	(1,1,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-21 21:25:03','2017-02-21 21:29:56','638b03c6-19f7-4d25-b885-d2ef13e849c0'),
	(4,4,'en','Homepage',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-21 21:30:09','2017-02-21 21:30:09','46e548bd-6492-40d1-9040-ae0f9bcee463'),
	(5,5,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-21 21:30:15','2017-02-21 21:30:15','2412953a-4876-49e1-a2c4-d0d6d763d920'),
	(7,7,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-21 21:30:17','2017-03-13 09:53:58','125921f2-a242-45bc-8799-e0f4da642beb'),
	(9,9,'en',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'',NULL,'2017-02-27 14:01:46','2017-02-27 17:29:58','8bb9aad3-559f-4dc4-b287-95941d695960'),
	(13,15,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-27 17:28:08','2017-02-27 17:29:58','64c1c143-9d9d-467b-b104-ef1b22f1d598'),
	(14,17,'en','Accessventures Preview',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-19 14:40:07','2017-03-19 14:40:07','8455adb4-41bf-4176-86da-2885f3970a06'),
	(15,18,'en','Andreabrugi Preview',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-19 14:40:08','2017-03-19 14:40:08','42e627d0-c364-493c-91a5-a79da0da2918'),
	(16,19,'en','Daniel Hyngar Preview',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-19 14:40:08','2017-03-19 14:40:08','7c049d13-95a5-4004-91ee-86267cba9460'),
	(17,20,'en','Admirhadzic Preview',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-19 14:40:08','2017-03-19 14:40:08','3e7c9240-cae0-4781-ab44-fb3f94c51f66'),
	(18,21,'en','Firstround Preview',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-19 14:40:09','2017-03-19 14:40:09','530d2c3d-d7fb-4f22-9039-569d1d4edfd5'),
	(19,22,'en','Glamuzina Architects Preview',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-19 14:40:09','2017-03-19 14:40:09','7243b227-38d7-4d80-817a-23cfc08020ab'),
	(20,23,'en','Milanote Preview',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-19 14:40:09','2017-03-19 14:40:09','c94a2447-2840-4bdb-a2c1-92671b9a41ae'),
	(21,24,'en','Panoply Preview',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-19 14:40:09','2017-03-19 14:40:09','22fca089-bb78-44ed-8f05-67ee3de68819'),
	(22,25,'en','Red Collar Preview',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-19 14:40:10','2017-03-19 14:40:10','61029551-84e9-4ab4-a7bb-7d72fdd14028'),
	(23,26,'en','Sa Studio Preview',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-19 14:40:10','2017-03-19 14:40:10','0ebb0c45-c0dc-4df9-8f4f-10b5d3aa4b45'),
	(24,27,'en','Modules',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-19 14:43:02','2017-03-19 15:27:05','6d84344b-6ddb-41d6-9b6b-ea95492de1b4'),
	(25,28,'en',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'Text Modules',NULL,NULL,NULL,NULL,NULL,'This is a Subline for Text Modules',NULL,'2017-03-19 14:47:38','2017-03-19 15:27:05','be5e5263-f8a1-4b9d-9e0d-2b822fc7587c'),
	(26,30,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Headline',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-19 14:47:38','2017-03-19 15:27:05','d78138b3-7398-400f-9f11-1d7191aa958e'),
	(27,32,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.</p>\n<ul><li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. </li><li>Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. </li><li>Sed blandit augue vitae augue scelerisque bibendum. </li><li>Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.</li></ul><p><strong>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.</strong></p>\n<p><em>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.</em></p>\n<ol><li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. </li><li>Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. </li><li>Vivamus sit amet libero turpis, non venenatis urna. </li><li>In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.</li></ol>',NULL,NULL,NULL,NULL,'2017-03-19 14:47:38','2017-03-19 15:27:05','a4a28e28-c121-48df-ac96-a15af36a1c6e'),
	(28,33,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.</p>',NULL,NULL,NULL,NULL,'2017-03-19 14:47:38','2017-03-19 15:27:05','585e579b-d5ce-485a-a361-73e92996ff28'),
	(29,34,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-19 14:47:38','2017-03-19 15:27:05','7d004122-fdde-4312-8f9a-195cf9cd2886'),
	(30,35,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus.',NULL,'Max Mustermann','',NULL,NULL,'2017-03-19 14:47:39','2017-03-19 15:27:05','d631dd08-ef4d-4929-bfdf-c5cd8f087baa'),
	(31,36,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. ',NULL,'Max Mustermann','',NULL,NULL,'2017-03-19 14:47:39','2017-03-19 15:27:05','c01d8300-48de-4073-ab0d-4fd7425d97ed'),
	(32,37,'en',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'Button Modules',NULL,NULL,NULL,NULL,NULL,'This is a Subline for Button Modules',NULL,'2017-03-19 14:51:02','2017-03-19 15:27:06','d9d0eb13-99ab-43ff-9f4f-81362ff3e39f'),
	(33,39,'en',NULL,NULL,NULL,NULL,'{\"type\":\"custom\",\"email\":\"\",\"tel\":\"\",\"custom\":\"http:\\/\\/google.com\",\"entry\":\"\",\"asset\":\"\",\"category\":\"\",\"customText\":\"Google\",\"target\":\"\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-19 14:51:02','2017-03-19 15:27:06','7c50704a-5402-444a-afd0-4ed7fde4d9e3'),
	(34,41,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-19 14:51:02','2017-03-19 15:27:06','b02360df-8820-4029-b1cf-35a058900cfd'),
	(35,46,'en',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'More Modules',NULL,NULL,NULL,NULL,NULL,'This is a Subline for More Modules',NULL,'2017-03-19 14:51:02','2017-03-19 15:27:06','a7f4e809-4463-47bf-824b-843c9bbe85dd'),
	(36,48,'en',NULL,NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"Term 1\",\"col2\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.\"},{\"col1\":\"Term 2\",\"col2\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.\"},{\"col1\":\"Term 3\",\"col2\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.\"}]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-19 14:51:02','2017-03-19 15:27:06','8255ee12-ed76-4e10-91c8-a670825606a1'),
	(37,50,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/8-3EqarcyVo\" frameborder=\"0\" allowfullscreen></iframe>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-19 14:51:02','2017-03-19 15:27:06','025e2adb-21f2-4923-8c78-54be45f7ae51'),
	(38,52,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-19 14:51:02','2017-03-19 15:27:06','8a8d4e34-7185-4468-b702-7d79bf9124d3'),
	(39,54,'en',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'Content Wrapper Modules',NULL,NULL,NULL,NULL,NULL,'This is a Subline for Content Wrapper Modules',NULL,'2017-03-19 15:27:06','2017-03-19 15:27:06','decdbfb4-e102-4002-8025-74da815c75f6'),
	(40,56,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-19 15:27:06','2017-03-19 15:27:06','f205d16e-1c4c-4f67-95be-d976b8e3a742'),
	(41,57,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'This is a Headline',NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-19 15:27:06','2017-03-19 15:27:06','be3b0e81-49dc-43b9-8a42-fc33a3261eb8'),
	(42,58,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.</p>',NULL,NULL,NULL,NULL,'2017-03-19 15:27:06','2017-03-19 15:27:06','f00f9048-3193-4fd1-8163-529395e0d02c'),
	(43,59,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'This is a Headline',NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-19 15:27:06','2017-03-19 15:27:06','ee47f373-e5b6-4123-b9c8-aa3a4fb1d37b'),
	(44,60,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.</p>',NULL,NULL,NULL,NULL,'2017-03-19 15:27:06','2017-03-19 15:27:06','9515e4c7-69ea-4182-a3cf-a1bde0df900e'),
	(45,61,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-19 15:27:06','2017-03-19 15:27:06','494c9639-2f2a-4bba-b120-4c1f299c27f6'),
	(46,63,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-19 15:27:06','2017-03-19 15:27:06','f4fad284-0b88-4a2c-aee7-8b40ce462ac2'),
	(47,64,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.</p>',NULL,NULL,NULL,NULL,'2017-03-19 15:27:06','2017-03-19 15:27:06','f8dc63df-7532-46e7-af37-b490090537c9'),
	(48,65,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-19 15:27:06','2017-03-19 15:27:06','a5d02ca4-4c45-4138-b424-ce710959aba7'),
	(49,66,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.</p>',NULL,NULL,NULL,NULL,'2017-03-19 15:27:06','2017-03-19 15:27:06','8344ae75-94d8-4119-96b6-1898a0b8e09d');

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
	(7,'User',1,0,'2017-02-21 21:30:17','2017-03-13 09:53:58','fe435802-5086-4dae-ab83-f049a1185afa'),
	(9,'Neo_Block',1,0,'2017-02-27 14:01:46','2017-02-27 17:29:58','c58bb12f-d281-4428-8af2-66196d3f5a06'),
	(10,'SuperTable_Block',1,0,'2017-02-27 14:01:46','2017-02-27 17:29:58','32c17906-b070-4f7b-b236-7ef7d0ee9658'),
	(12,'SuperTable_Block',1,0,'2017-02-27 14:01:46','2017-02-27 17:29:39','eb83ae23-9bb6-48bf-bb18-0b0a97d894c5'),
	(15,'Neo_Block',1,0,'2017-02-27 17:28:08','2017-02-27 17:29:58','4d0e69bf-2ba3-4160-9a0e-482f061c2495'),
	(16,'SuperTable_Block',1,0,'2017-02-27 17:28:08','2017-02-27 17:29:59','a03b0af9-7b5a-4b49-aec4-217cb1a064b2'),
	(17,'Asset',1,0,'2017-03-19 14:40:07','2017-03-19 14:40:07','62d3e12f-3caf-4b10-b358-84543b0ac451'),
	(18,'Asset',1,0,'2017-03-19 14:40:08','2017-03-19 14:40:08','7aca31b1-f7cd-44d4-b03e-6cf368d9dc8d'),
	(19,'Asset',1,0,'2017-03-19 14:40:08','2017-03-19 14:40:08','4ddc1948-3521-40c1-80c3-577c294a0f04'),
	(20,'Asset',1,0,'2017-03-19 14:40:08','2017-03-19 14:40:08','70ca66c8-1203-4978-838f-72a9ac1658ca'),
	(21,'Asset',1,0,'2017-03-19 14:40:09','2017-03-19 14:40:09','95ce0cf2-e3ed-413d-9b9b-fca7a2dc8d98'),
	(22,'Asset',1,0,'2017-03-19 14:40:09','2017-03-19 14:40:09','e26a1a78-06ba-48cc-9fc2-5ac2665f2735'),
	(23,'Asset',1,0,'2017-03-19 14:40:09','2017-03-19 14:40:09','38eaa4b1-c445-484d-bc7b-58e746e03d97'),
	(24,'Asset',1,0,'2017-03-19 14:40:09','2017-03-19 14:40:09','d26189dc-86f9-47e1-97ed-52664a540e30'),
	(25,'Asset',1,0,'2017-03-19 14:40:10','2017-03-19 14:40:10','29c107a0-d5e8-47da-ad96-723683fd92fd'),
	(26,'Asset',1,0,'2017-03-19 14:40:10','2017-03-19 14:40:10','ce292d45-3f85-4bef-83b6-7d625d72fa0e'),
	(27,'Entry',1,0,'2017-03-19 14:43:02','2017-03-19 15:27:05','a871fc67-4123-4c3c-91a1-c94e7ab92c31'),
	(28,'Neo_Block',1,0,'2017-03-19 14:47:38','2017-03-19 15:27:05','ab9ee8b7-34a3-4a75-a1b9-21e264cbd9da'),
	(29,'SuperTable_Block',1,0,'2017-03-19 14:47:38','2017-03-19 15:27:05','3c5bd6ef-3451-4dbc-a100-108da29f01d0'),
	(30,'Neo_Block',1,0,'2017-03-19 14:47:38','2017-03-19 15:27:05','604d3c66-8c03-4b49-9789-98ab3dcc7c19'),
	(31,'SuperTable_Block',1,0,'2017-03-19 14:47:38','2017-03-19 15:27:05','58a96c3c-9fec-4e98-819d-a1197590eb18'),
	(32,'Neo_Block',1,0,'2017-03-19 14:47:38','2017-03-19 15:27:05','4a0ef526-3d35-48e4-878f-1cfcb99aaa65'),
	(33,'Neo_Block',1,0,'2017-03-19 14:47:38','2017-03-19 15:27:05','4f47220f-3eb9-4d34-a56e-8b404ac44069'),
	(34,'Neo_Block',1,0,'2017-03-19 14:47:38','2017-03-19 15:27:05','8842afaf-2c73-4413-b184-2b16674c694f'),
	(35,'Neo_Block',1,0,'2017-03-19 14:47:39','2017-03-19 15:27:05','1972c683-32ef-41dd-8e87-d3640b079320'),
	(36,'Neo_Block',1,0,'2017-03-19 14:47:39','2017-03-19 15:27:05','c7a6e2f7-ce1b-4499-8b1c-37fe5926398e'),
	(37,'Neo_Block',1,0,'2017-03-19 14:51:02','2017-03-19 15:27:06','d6f7939b-df0f-4ca2-9021-2fda8e1ff6f2'),
	(38,'SuperTable_Block',1,0,'2017-03-19 14:51:02','2017-03-19 15:27:06','f5885433-63a6-4923-928b-82a3dd65a268'),
	(39,'Neo_Block',1,0,'2017-03-19 14:51:02','2017-03-19 15:27:06','8f0cf766-5f8b-4f8a-bbca-5eb39c2152c4'),
	(40,'SuperTable_Block',1,0,'2017-03-19 14:51:02','2017-03-19 15:27:06','4fc1d875-332e-428d-bad3-241749374204'),
	(41,'Neo_Block',1,0,'2017-03-19 14:51:02','2017-03-19 15:27:06','d86651e5-baa6-4a8d-a59d-9c0bf6165862'),
	(42,'SuperTable_Block',1,0,'2017-03-19 14:51:02','2017-03-19 15:27:06','7f09d60e-d066-48ce-b631-a4b8b38b8699'),
	(43,'SuperTable_Block',1,0,'2017-03-19 14:51:02','2017-03-19 15:27:06','e61aeb14-ed5c-42db-b614-835a432e8914'),
	(44,'SuperTable_Block',1,0,'2017-03-19 14:51:02','2017-03-19 15:27:06','17a112cc-ebfe-4248-9982-36475f65d1e9'),
	(45,'SuperTable_Block',1,0,'2017-03-19 14:51:02','2017-03-19 15:27:06','83b9d404-40ca-468f-b3bb-5fc110b6236d'),
	(46,'Neo_Block',1,0,'2017-03-19 14:51:02','2017-03-19 15:27:06','3f16f406-a350-4418-9e83-b0291b175822'),
	(47,'SuperTable_Block',1,0,'2017-03-19 14:51:02','2017-03-19 15:27:06','daacbf44-a1e3-43be-8e24-378bc8bfc1b0'),
	(48,'Neo_Block',1,0,'2017-03-19 14:51:02','2017-03-19 15:27:06','f004b450-4090-439c-abb0-89be9704631d'),
	(49,'SuperTable_Block',1,0,'2017-03-19 14:51:02','2017-03-19 15:27:06','580889bc-13dd-4b9f-ac38-e424b76e0875'),
	(50,'Neo_Block',1,0,'2017-03-19 14:51:02','2017-03-19 15:27:06','dad252a7-0fca-4c12-a18d-c0349cc9ca7c'),
	(51,'SuperTable_Block',1,0,'2017-03-19 14:51:02','2017-03-19 15:27:06','6916b514-ef1e-4de0-bd84-7c1fd0983d50'),
	(52,'Neo_Block',1,0,'2017-03-19 14:51:02','2017-03-19 15:27:06','335bfe69-8dd3-45aa-8cef-90a22e042261'),
	(53,'SuperTable_Block',1,0,'2017-03-19 14:51:02','2017-03-19 15:27:06','7e3e887d-b781-4ca7-b776-359fa24dbb5b'),
	(54,'Neo_Block',1,0,'2017-03-19 15:27:06','2017-03-19 15:27:06','92b04079-6bcf-49ea-9636-21d912971134'),
	(55,'SuperTable_Block',1,0,'2017-03-19 15:27:06','2017-03-19 15:27:06','89d451d3-dadb-478e-9a11-3dd57e4b6f33'),
	(56,'Neo_Block',1,0,'2017-03-19 15:27:06','2017-03-19 15:27:06','9796ef60-5f4b-4820-bb54-fa1ebedfbfb6'),
	(57,'Neo_Block',1,0,'2017-03-19 15:27:06','2017-03-19 15:27:06','c87a3b1f-079a-4df4-b234-a4d346eb44c9'),
	(58,'Neo_Block',1,0,'2017-03-19 15:27:06','2017-03-19 15:27:06','1458900c-6ef9-45ac-a062-4e1aa043c8d4'),
	(59,'Neo_Block',1,0,'2017-03-19 15:27:06','2017-03-19 15:27:06','c6d89c8b-eb80-41d4-87b0-5c8c83d19e39'),
	(60,'Neo_Block',1,0,'2017-03-19 15:27:06','2017-03-19 15:27:06','ace0b115-2094-4edb-aec0-022cc9b28962'),
	(61,'Neo_Block',1,0,'2017-03-19 15:27:06','2017-03-19 15:27:06','375a7028-2c28-4b38-ab17-a1206bbf4634'),
	(62,'SuperTable_Block',1,0,'2017-03-19 15:27:06','2017-03-19 15:27:06','6f703ab8-5104-480e-973e-238ba5596494'),
	(63,'Neo_Block',1,0,'2017-03-19 15:27:06','2017-03-19 15:27:06','26a2cfd5-7882-4869-8556-2fd682bb0651'),
	(64,'Neo_Block',1,0,'2017-03-19 15:27:06','2017-03-19 15:27:06','348a0892-61f4-4db6-926b-5fd58661f36e'),
	(65,'Neo_Block',1,0,'2017-03-19 15:27:06','2017-03-19 15:27:06','79e15f8a-4e30-4a20-ad74-4a9836ffeed1'),
	(66,'Neo_Block',1,0,'2017-03-19 15:27:06','2017-03-19 15:27:06','4920e516-ec55-4c96-a89f-01c619554c41');

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
	(7,7,'en','',NULL,1,'2017-02-21 21:30:17','2017-03-13 09:53:58','775ee77c-d6b7-40b2-84ff-b9b784e91f43'),
	(9,9,'en','',NULL,1,'2017-02-27 14:01:46','2017-02-27 17:29:58','c34e2384-fde1-4d0c-94f8-3d50b7ed1a41'),
	(10,10,'en','',NULL,1,'2017-02-27 14:01:46','2017-02-27 17:29:58','d22ce6b1-a8fe-4668-b979-c16f49b26ac1'),
	(12,12,'en','',NULL,1,'2017-02-27 14:01:46','2017-02-27 17:29:39','8424f0d5-3b61-43ef-a948-5f3b7f408956'),
	(15,15,'en','',NULL,1,'2017-02-27 17:28:08','2017-02-27 17:29:58','900a7828-f08b-4f67-a357-dde6bebb6513'),
	(16,16,'en','',NULL,1,'2017-02-27 17:28:08','2017-02-27 17:29:59','bc29ec8f-1505-43de-90d3-464461232159'),
	(17,17,'en','accessventures-preview',NULL,1,'2017-03-19 14:40:07','2017-03-19 14:40:07','0aa79358-350b-455e-bb26-246ed74f7c6e'),
	(18,18,'en','andreabrugi-preview',NULL,1,'2017-03-19 14:40:08','2017-03-19 14:40:08','4f844a05-41d7-489f-94df-fcc7331bb3e3'),
	(19,19,'en','daniel-hyngar-preview',NULL,1,'2017-03-19 14:40:08','2017-03-19 14:40:08','a36c1864-8d9c-4e4b-9f85-ba0c603a6bdb'),
	(20,20,'en','admirhadzic-preview',NULL,1,'2017-03-19 14:40:08','2017-03-19 14:40:08','b461fd72-3e13-41a4-be3b-406f6a99d399'),
	(21,21,'en','firstround-preview',NULL,1,'2017-03-19 14:40:09','2017-03-19 14:40:09','3a468099-199d-444c-9da6-8892379c2078'),
	(22,22,'en','glamuzina-architects-preview',NULL,1,'2017-03-19 14:40:09','2017-03-19 14:40:09','fd86d526-db14-4985-b04d-e4399bcc7d04'),
	(23,23,'en','milanote-preview',NULL,1,'2017-03-19 14:40:09','2017-03-19 14:40:09','21b1e7b6-7559-4596-978c-242e0feb820b'),
	(24,24,'en','panoply-preview',NULL,1,'2017-03-19 14:40:09','2017-03-19 14:40:09','c649718f-d100-4260-98df-2de7de60afee'),
	(25,25,'en','red-collar-preview',NULL,1,'2017-03-19 14:40:10','2017-03-19 14:40:10','84570457-9c55-48a0-921d-1cd94655ca92'),
	(26,26,'en','sa-studio-preview',NULL,1,'2017-03-19 14:40:10','2017-03-19 14:40:10','0a686b0f-163f-460a-92f3-1071bf4ca68d'),
	(27,27,'en','modules','modules',1,'2017-03-19 14:43:02','2017-03-19 15:27:05','1b670589-0d39-46f5-8786-ac70c950ec03'),
	(28,28,'en','',NULL,1,'2017-03-19 14:47:38','2017-03-19 15:27:05','a2a87f6f-a6af-4fa5-af47-cc612576e5dc'),
	(29,29,'en','',NULL,1,'2017-03-19 14:47:38','2017-03-19 15:27:05','e286ce45-4b86-4a20-80ac-81b09c86d709'),
	(30,30,'en','',NULL,1,'2017-03-19 14:47:38','2017-03-19 15:27:05','aa458b00-c8d0-4f00-bf19-88210fa0ca04'),
	(31,31,'en','',NULL,1,'2017-03-19 14:47:38','2017-03-19 15:27:05','df9feea7-74a8-44c3-9d91-5598bdcf2ad5'),
	(32,32,'en','',NULL,1,'2017-03-19 14:47:38','2017-03-19 15:27:05','8921e6e3-ae8e-447b-b5cc-614a4323b4f2'),
	(33,33,'en','',NULL,1,'2017-03-19 14:47:38','2017-03-19 15:27:05','b9c35849-5cf2-45bc-9592-f7a841dc4858'),
	(34,34,'en','',NULL,1,'2017-03-19 14:47:39','2017-03-19 15:27:05','c736ec54-669a-407a-81b8-38d8ac98edd0'),
	(35,35,'en','',NULL,1,'2017-03-19 14:47:39','2017-03-19 15:27:05','dc97778f-e88a-471d-a94f-01c4471835c3'),
	(36,36,'en','',NULL,1,'2017-03-19 14:47:39','2017-03-19 15:27:05','21416503-0bcd-43ce-9093-810100b6ead8'),
	(37,37,'en','',NULL,1,'2017-03-19 14:51:02','2017-03-19 15:27:06','8373098d-0abc-40c8-ace2-ed1d08c5ceaa'),
	(38,38,'en','',NULL,1,'2017-03-19 14:51:02','2017-03-19 15:27:06','74d54b88-4591-43db-8439-c88ed046d993'),
	(39,39,'en','',NULL,1,'2017-03-19 14:51:02','2017-03-19 15:27:06','f50d687b-cc2b-4b8c-a098-93d760273815'),
	(40,40,'en','',NULL,1,'2017-03-19 14:51:02','2017-03-19 15:27:06','612b68f5-b8fb-4f3c-97b9-610219d90176'),
	(41,41,'en','',NULL,1,'2017-03-19 14:51:02','2017-03-19 15:27:06','174cb030-4004-49f3-91f2-60257f0e8acb'),
	(42,42,'en','',NULL,1,'2017-03-19 14:51:02','2017-03-19 15:27:06','1aeaba53-62b4-4338-a89e-d5c206c04a5d'),
	(43,43,'en','',NULL,1,'2017-03-19 14:51:02','2017-03-19 15:27:06','238fa7e1-d819-448b-b558-92bc107c7d2d'),
	(44,44,'en','',NULL,1,'2017-03-19 14:51:02','2017-03-19 15:27:06','9424cedd-cb20-4052-aa54-134ebfb17a58'),
	(45,45,'en','',NULL,1,'2017-03-19 14:51:02','2017-03-19 15:27:06','a22676d7-a1b7-4dfa-bba4-25dd5fe02ca6'),
	(46,46,'en','',NULL,1,'2017-03-19 14:51:02','2017-03-19 15:27:06','c4803f86-17bd-42fb-8fd9-a8d0d72c7279'),
	(47,47,'en','',NULL,1,'2017-03-19 14:51:02','2017-03-19 15:27:06','899d3240-ff98-4f6d-aa37-c503ec53fc00'),
	(48,48,'en','',NULL,1,'2017-03-19 14:51:02','2017-03-19 15:27:06','4ed8dbc0-02f8-49ad-82ec-114e53cde8f6'),
	(49,49,'en','',NULL,1,'2017-03-19 14:51:02','2017-03-19 15:27:06','641c408a-e2a4-4cd9-b1b1-562ee09c2cd8'),
	(50,50,'en','',NULL,1,'2017-03-19 14:51:02','2017-03-19 15:27:06','0e82fd68-6a5c-491f-8281-5dc0df64ef19'),
	(51,51,'en','',NULL,1,'2017-03-19 14:51:02','2017-03-19 15:27:06','46f1c8da-24a1-42de-8f74-9378a1007cfb'),
	(52,52,'en','',NULL,1,'2017-03-19 14:51:02','2017-03-19 15:27:06','c3fc5f89-1f62-4732-af90-6578accce4ee'),
	(53,53,'en','',NULL,1,'2017-03-19 14:51:02','2017-03-19 15:27:06','5e6b9415-d5d2-4e6e-8075-b46fddfeb5b4'),
	(54,54,'en','',NULL,1,'2017-03-19 15:27:06','2017-03-19 15:27:06','605b9aba-b557-424a-8901-5fef91e3a87a'),
	(55,55,'en','',NULL,1,'2017-03-19 15:27:06','2017-03-19 15:27:06','f9940d1a-9413-4873-9633-c5a8b985f065'),
	(56,56,'en','',NULL,1,'2017-03-19 15:27:06','2017-03-19 15:27:06','9d1847ca-e564-45e2-90ea-a85f334bc580'),
	(57,57,'en','',NULL,1,'2017-03-19 15:27:06','2017-03-19 15:27:06','e696efa4-52c7-4316-a87e-42beeffbd15a'),
	(58,58,'en','',NULL,1,'2017-03-19 15:27:06','2017-03-19 15:27:06','ed89adb6-c867-47f3-accd-79066f6faf4b'),
	(59,59,'en','',NULL,1,'2017-03-19 15:27:06','2017-03-19 15:27:06','b273f644-c707-40df-a97d-a6b720852363'),
	(60,60,'en','',NULL,1,'2017-03-19 15:27:06','2017-03-19 15:27:06','0f95bddc-f4d1-41d7-af50-fafa57923179'),
	(61,61,'en','',NULL,1,'2017-03-19 15:27:06','2017-03-19 15:27:06','407b9e39-d342-45d1-808f-20fd0b45e0ae'),
	(62,62,'en','',NULL,1,'2017-03-19 15:27:06','2017-03-19 15:27:06','9de245f3-14f9-4d5c-b77f-8eb38d5181cb'),
	(63,63,'en','',NULL,1,'2017-03-19 15:27:06','2017-03-19 15:27:06','6746eaa8-18e8-4295-ba9e-1895ac06c70f'),
	(64,64,'en','',NULL,1,'2017-03-19 15:27:06','2017-03-19 15:27:06','45dafd27-63e9-4fd0-8c9d-8fdd4e050b56'),
	(65,65,'en','',NULL,1,'2017-03-19 15:27:06','2017-03-19 15:27:06','8a1b6cf0-daed-4415-bd06-c3c29a78bc25'),
	(66,66,'en','',NULL,1,'2017-03-19 15:27:06','2017-03-19 15:27:06','5d8d3406-d8c8-4f87-bd66-50e533f4c46c');

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
	(4,3,NULL,NULL,'2017-02-21 21:30:09',NULL,'2017-02-21 21:30:09','2017-02-21 21:30:09','c30ab2da-2c63-4f99-9f0e-00efff1b08a8'),
	(27,5,NULL,NULL,'2017-03-19 14:43:02',NULL,'2017-03-19 14:43:02','2017-03-19 15:27:06','88409443-ef2f-47b9-85a7-f6e0e6d15c71');

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
	(4,4,55,'News','news',1,'Title',NULL,1,'2017-02-21 21:30:09','2017-02-21 21:30:15','d230dd7f-4f6e-47f8-a7f7-65d2024c58ab'),
	(5,5,159,'Modules','modules',1,'',NULL,1,'2017-03-19 14:43:02','2017-03-19 14:45:10','39f00a52-b1c0-4681-941e-439ccd43bc16');

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
	(171,82,97,25,0,1,'2017-03-13 10:15:52','2017-03-13 10:15:52','2fdcc65b-5874-4355-8252-8c0ecbe4d10d'),
	(172,82,97,26,0,2,'2017-03-13 10:15:52','2017-03-13 10:15:52','3caee97e-12e3-4a0c-8ff0-3e2994f2f650'),
	(173,82,97,27,0,3,'2017-03-13 10:15:52','2017-03-13 10:15:52','e82cc42e-b63c-4fb9-bdd5-b29905541337'),
	(174,82,97,30,0,4,'2017-03-13 10:15:52','2017-03-13 10:15:52','477c439b-d7b3-4c7a-8b48-2d1fc8d6b1bd'),
	(241,123,160,69,0,1,'2017-03-13 10:22:58','2017-03-13 10:22:58','d212cba0-c7da-4cce-bbb0-6668389a15c4'),
	(242,123,160,72,0,2,'2017-03-13 10:22:58','2017-03-13 10:22:58','a8f44218-2f7c-4fa6-92f1-8273c23cd75d'),
	(243,123,160,73,0,3,'2017-03-13 10:22:58','2017-03-13 10:22:58','5eafde3c-f929-4356-b2ff-54c24de61c37'),
	(244,124,161,32,0,1,'2017-03-13 10:40:13','2017-03-13 10:40:13','31a259f3-cf6b-4c73-9805-d315c5f4c39e'),
	(245,124,161,33,0,2,'2017-03-13 10:40:13','2017-03-13 10:40:13','745dcc7b-6c51-4a46-8831-6756128b6b23'),
	(246,125,162,35,0,1,'2017-03-13 10:42:48','2017-03-13 10:42:48','f47b3fc9-3e37-452b-9ad2-2253904f3468'),
	(247,125,162,36,0,2,'2017-03-13 10:42:48','2017-03-13 10:42:48','9604cb77-fb5b-45ad-b0e0-108c35e31f95'),
	(248,126,163,38,0,1,'2017-03-13 10:45:34','2017-03-13 10:45:34','91a08d1c-5fa2-460f-8951-da1b1c403bb1'),
	(249,126,163,39,0,2,'2017-03-13 10:45:34','2017-03-13 10:45:34','04e5dc0e-0a26-44dd-a4bc-a9ace67eb7c0'),
	(250,126,163,40,0,3,'2017-03-13 10:45:34','2017-03-13 10:45:34','574a420b-08b6-4cee-9c01-f8ed01c5fe57'),
	(253,128,165,106,0,1,'2017-03-13 10:46:41','2017-03-13 10:46:41','12eb6284-ccbf-446b-ac66-e1adc75e97e6'),
	(254,128,165,44,0,2,'2017-03-13 10:46:41','2017-03-13 10:46:41','3ae1b97d-c6fc-42ec-bd53-82163daceba0'),
	(255,128,165,45,0,3,'2017-03-13 10:46:41','2017-03-13 10:46:41','8f2575da-252c-4f1e-a67f-812cc535d2e9'),
	(256,129,166,47,0,1,'2017-03-13 10:49:27','2017-03-13 10:49:27','9811f7ce-4a4f-40df-844b-47e315cd11fc'),
	(257,129,166,48,0,2,'2017-03-13 10:49:27','2017-03-13 10:49:27','6422dcb8-8ba7-41d9-96cf-2621a2403ef7'),
	(258,129,166,49,0,3,'2017-03-13 10:49:27','2017-03-13 10:49:27','863a59df-8d39-42d2-994c-de75068768c0'),
	(259,130,167,51,0,1,'2017-03-13 10:50:32','2017-03-13 10:50:32','90a1d7b5-85b6-46f3-953f-1994015662ef'),
	(260,130,167,52,0,2,'2017-03-13 10:50:32','2017-03-13 10:50:32','aeede9a7-fd42-46d2-9652-4cbe8b9f1415'),
	(261,130,167,53,0,3,'2017-03-13 10:50:32','2017-03-13 10:50:32','0fa86d4a-ad5a-40e9-897f-2a047a37d67a'),
	(262,131,168,55,0,1,'2017-03-13 10:51:34','2017-03-13 10:51:34','38daef59-0f0e-431c-98a0-dfe7523f2c0f'),
	(263,131,168,56,0,2,'2017-03-13 10:51:34','2017-03-13 10:51:34','ffa42faa-79e7-426b-a862-e14f4cc00980'),
	(264,131,168,57,0,3,'2017-03-13 10:51:34','2017-03-13 10:51:34','44a5a364-0023-4738-a214-64d526c405c0'),
	(265,132,169,59,0,1,'2017-03-13 10:52:37','2017-03-13 10:52:37','9533b6a2-a0e2-429f-b989-8a3df6756987'),
	(266,132,169,60,0,2,'2017-03-13 10:52:37','2017-03-13 10:52:37','5317c644-c92a-4a53-94bf-7c2d1f6dc24a'),
	(267,132,169,61,0,3,'2017-03-13 10:52:37','2017-03-13 10:52:37','321f1b8c-8280-4090-a4de-301521efa395'),
	(268,132,169,62,0,4,'2017-03-13 10:52:37','2017-03-13 10:52:37','fd982dca-a932-464b-ac57-8e7b13584c99'),
	(275,135,172,82,0,1,'2017-03-13 11:36:31','2017-03-13 11:36:31','b9cff68d-c856-4ce0-bdb7-e74dbd757e4c'),
	(276,135,172,83,0,2,'2017-03-13 11:36:31','2017-03-13 11:36:31','1773cd73-621e-4816-8fe0-ee1aca0bbf86'),
	(277,135,172,84,0,3,'2017-03-13 11:36:31','2017-03-13 11:36:31','53bbe86d-628e-42fa-9930-0ded44ee07ef'),
	(278,136,173,86,0,1,'2017-03-13 11:38:26','2017-03-13 11:38:26','5e01cdf8-df0c-40d2-acb7-88575d56789d'),
	(279,137,174,94,0,1,'2017-03-19 14:37:36','2017-03-19 14:37:36','25bc1a8f-3eb3-4b96-a01d-8e700999496b'),
	(280,137,174,102,0,2,'2017-03-19 14:37:36','2017-03-19 14:37:36','d16179ef-eb77-4c28-aa2f-1c30a571dc69'),
	(281,137,175,87,0,1,'2017-03-19 14:37:36','2017-03-19 14:37:36','806e05aa-f7bb-4040-b817-9c1cdd5d242c'),
	(282,137,175,77,0,2,'2017-03-19 14:37:36','2017-03-19 14:37:36','63b0f365-9041-4800-b76d-d068cb22cb42'),
	(283,138,176,94,0,1,'2017-03-19 14:37:36','2017-03-19 14:37:36','2dafe503-75ce-4182-a9b9-eaf252284e16'),
	(284,138,177,42,0,1,'2017-03-19 14:37:36','2017-03-19 14:37:36','e099a21e-e2e8-4867-ae8d-072411697191'),
	(285,139,178,99,0,1,'2017-03-19 14:37:36','2017-03-19 14:37:36','22748388-b9e4-489e-9869-29ba2c6298b3'),
	(286,140,179,99,0,1,'2017-03-19 14:37:36','2017-03-19 14:37:36','c50f40e8-f81c-4027-803d-b4d0de174b1b'),
	(287,142,180,98,0,1,'2017-03-19 14:37:36','2017-03-19 14:37:36','c8fdff23-09ec-43c4-840f-2a9ed6a793e0'),
	(288,142,180,100,0,2,'2017-03-19 14:37:36','2017-03-19 14:37:36','30b4ff1d-eaa9-4934-a455-f5fdaef71b73'),
	(289,142,180,101,0,3,'2017-03-19 14:37:36','2017-03-19 14:37:36','3f610203-aab0-4c13-a521-e7efa1bebc0b'),
	(290,143,181,95,0,1,'2017-03-19 14:37:36','2017-03-19 14:37:36','26e2ca0f-43dc-460c-b1ba-19aba81f6895'),
	(291,143,181,103,0,2,'2017-03-19 14:37:36','2017-03-19 14:37:36','c1a1d349-6a29-47e8-9e0f-f95ac70e0d8a'),
	(292,143,182,46,0,1,'2017-03-19 14:37:36','2017-03-19 14:37:36','26b17ecd-2fe9-47cd-a0d9-d052e46cea0e'),
	(293,144,183,96,0,1,'2017-03-19 14:37:36','2017-03-19 14:37:36','0d74d065-8136-4d54-ba2e-3a0d999f392d'),
	(294,144,184,50,0,1,'2017-03-19 14:37:36','2017-03-19 14:37:36','a63b9f01-5c16-4603-beda-0169ed20e478'),
	(295,145,185,96,0,1,'2017-03-19 14:37:36','2017-03-19 14:37:36','340c62b1-0c97-47e7-b992-48a8e4f2128f'),
	(296,145,186,54,0,1,'2017-03-19 14:37:36','2017-03-19 14:37:36','dd117e1c-eef6-4e92-ba71-348caadf5b39'),
	(297,146,187,95,0,1,'2017-03-19 14:37:36','2017-03-19 14:37:36','c1578786-5c9d-4597-bfc1-89025eb1ffbd'),
	(298,146,188,58,0,1,'2017-03-19 14:37:36','2017-03-19 14:37:36','0af48408-5365-460c-86bd-f3ef6268b4c0'),
	(299,147,189,96,0,1,'2017-03-19 14:37:36','2017-03-19 14:37:36','08bd4291-5d92-4622-807e-5dc447b8d1b3'),
	(300,147,190,63,0,1,'2017-03-19 14:37:36','2017-03-19 14:37:36','5799bfab-da02-44e0-b2b8-acf645f0f51c'),
	(301,148,191,88,0,1,'2017-03-19 14:37:36','2017-03-19 14:37:36','3fd10161-831c-494f-ac04-5cb558f3052b'),
	(302,148,192,24,0,1,'2017-03-19 14:37:36','2017-03-19 14:37:36','568dcfda-0b7f-4f53-8986-fb06c2d5094d'),
	(303,149,193,89,0,1,'2017-03-19 14:37:36','2017-03-19 14:37:36','ee2df728-720b-4a72-ad65-fc08288f3246'),
	(304,149,194,31,0,1,'2017-03-19 14:37:36','2017-03-19 14:37:36','3d9f88ff-39e0-4449-8cd2-edf1ebe1e4f5'),
	(305,151,196,97,0,1,'2017-03-19 14:37:36','2017-03-19 14:37:36','3f1c5b42-73ab-45a7-ac22-a2108e9f2873'),
	(306,152,198,85,0,1,'2017-03-19 14:37:36','2017-03-19 14:37:36','863cab05-f8cd-408b-8bc6-66f7fba9cd0c'),
	(307,154,199,92,0,1,'2017-03-19 14:37:36','2017-03-19 14:37:36','7ec59879-d6ca-4ee5-b4a3-e3c5db4bd83d'),
	(308,154,200,34,0,1,'2017-03-19 14:37:36','2017-03-19 14:37:36','ffe12a32-9826-4b4b-9dc5-708ba2b73605'),
	(309,155,201,93,0,1,'2017-03-19 14:37:36','2017-03-19 14:37:36','9c438833-0b0d-4710-b170-b8391f64dfe4'),
	(310,155,202,37,0,1,'2017-03-19 14:37:36','2017-03-19 14:37:36','a28036f2-7f81-44a2-89c5-ba4417787be8'),
	(311,156,204,81,0,1,'2017-03-19 14:37:36','2017-03-19 14:37:36','afb952bd-2da5-49a2-bd38-f6f315ffa7b5'),
	(312,157,205,78,0,1,'2017-03-19 14:38:15','2017-03-19 14:38:15','456f06fa-fdca-464d-ad16-eeac347f7a0a'),
	(313,157,205,79,0,2,'2017-03-19 14:38:15','2017-03-19 14:38:15','9a770870-ce49-437b-a665-e59a6242ec54'),
	(314,157,205,80,0,3,'2017-03-19 14:38:15','2017-03-19 14:38:15','167a7568-fbd0-43a0-865c-1fe4ac216d37'),
	(315,159,206,104,0,1,'2017-03-19 14:45:10','2017-03-19 14:45:10','919fa09c-f373-43c3-90bf-682ee3408fed');

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
	(13,'SuperTable_Block','2017-02-21 21:30:10','2017-02-21 21:30:10','48ec75fc-94d1-44d2-82c9-d7f2b352e957'),
	(14,'SuperTable_Block','2017-02-21 21:30:10','2017-02-21 21:30:10','b301de6d-f973-49a9-861d-8d8e649a65f3'),
	(28,'SuperTable_Block','2017-02-21 21:30:14','2017-02-21 21:30:14','1dc0a18b-d260-4f80-a26f-159e4bebbd77'),
	(50,'Asset','2017-02-21 21:30:15','2017-02-21 21:30:15','8879161b-b3cc-40c2-bad8-d430d1444b92'),
	(51,'Asset','2017-02-21 21:30:15','2017-02-21 21:30:15','4f3027c5-66d7-4c05-bb2a-13ce13330a14'),
	(52,'Asset','2017-02-21 21:30:15','2017-02-21 21:30:15','e5a582d9-914b-4f56-b2e4-64e2e97c28a7'),
	(53,'Asset','2017-02-21 21:30:15','2017-02-21 21:30:15','6f7b8b5d-96b2-4782-a3fa-e66519d4ccfe'),
	(54,'Entry','2017-02-21 21:30:15','2017-02-21 21:30:15','87a2f14c-a8cd-4665-b3a0-0c77fcf5cb2c'),
	(55,'Entry','2017-02-21 21:30:15','2017-02-21 21:30:15','6860387c-6bc2-4fb7-a1bb-eef2fcb31dae'),
	(56,'GlobalSet','2017-02-21 21:30:15','2017-02-21 21:30:15','9f00691b-1027-4f21-8526-42ee7620c020'),
	(57,'Category','2017-02-21 21:30:15','2017-02-21 21:30:15','af95a0c2-5600-44c7-bde4-54b67a032e8e'),
	(82,'SuperTable_Block','2017-03-13 10:15:52','2017-03-13 10:15:52','790c17f2-54fe-4640-b9d6-18792caabbca'),
	(123,'SuperTable_Block','2017-03-13 10:22:58','2017-03-13 10:22:58','5755bdbc-92a6-42e5-be0e-e9a1b960acc0'),
	(124,'SuperTable_Block','2017-03-13 10:40:13','2017-03-13 10:40:13','a1219f95-c630-40fe-bee2-7957a963fcd2'),
	(125,'SuperTable_Block','2017-03-13 10:42:48','2017-03-13 10:42:48','d1f95efb-ea4d-45ca-a46e-81fcde1847fe'),
	(126,'SuperTable_Block','2017-03-13 10:45:34','2017-03-13 10:45:34','93d3781d-4064-4733-b43f-33813fa912f9'),
	(128,'SuperTable_Block','2017-03-13 10:46:41','2017-03-13 10:46:41','0d661e9f-7f43-4f70-b39e-c8bf771c6439'),
	(129,'SuperTable_Block','2017-03-13 10:49:27','2017-03-13 10:49:27','f5233056-5717-4d18-9987-43e02583bed2'),
	(130,'SuperTable_Block','2017-03-13 10:50:32','2017-03-13 10:50:32','3ca8999e-7130-464c-a2f8-e2b898ebeb1e'),
	(131,'SuperTable_Block','2017-03-13 10:51:34','2017-03-13 10:51:34','8bb50de7-2fb5-43dc-b06c-14e56bc82ea7'),
	(132,'SuperTable_Block','2017-03-13 10:52:37','2017-03-13 10:52:37','14333d89-4899-4a3c-b5f0-23158eceb126'),
	(135,'SuperTable_Block','2017-03-13 11:36:31','2017-03-13 11:36:31','c7aaefdf-2fd0-4360-9751-79ef732f8d03'),
	(136,'SuperTable_Block','2017-03-13 11:38:26','2017-03-13 11:38:26','77be0190-9137-4bca-9713-f5efdd8e0b13'),
	(137,'Neo_Block','2017-03-19 14:37:36','2017-03-19 14:37:36','3e04cfec-16cd-4fd7-8a57-bd439613cbde'),
	(138,'Neo_Block','2017-03-19 14:37:36','2017-03-19 14:37:36','98b6b35c-047d-473c-a5f8-70b8743545b4'),
	(139,'Neo_Block','2017-03-19 14:37:36','2017-03-19 14:37:36','ef026cb2-b1db-4c01-b499-67e6972b6690'),
	(140,'Neo_Block','2017-03-19 14:37:36','2017-03-19 14:37:36','bfb1957d-3a7f-472f-b1d1-95c11cd0266e'),
	(141,'Neo_Block','2017-03-19 14:37:36','2017-03-19 14:37:36','d6177a0c-cb5c-4199-97c0-01988613ab67'),
	(142,'Neo_Block','2017-03-19 14:37:36','2017-03-19 14:37:36','40bc31d6-eeab-4744-bd85-1e0deb17fc6d'),
	(143,'Neo_Block','2017-03-19 14:37:36','2017-03-19 14:37:36','1901ab82-a116-4950-a996-54b676818d73'),
	(144,'Neo_Block','2017-03-19 14:37:36','2017-03-19 14:37:36','460eb90e-fe32-4936-b2f4-3ddde2147a30'),
	(145,'Neo_Block','2017-03-19 14:37:36','2017-03-19 14:37:36','f0e629ec-9053-4e8a-a403-1a09ee868355'),
	(146,'Neo_Block','2017-03-19 14:37:36','2017-03-19 14:37:36','5e3af74e-c918-409f-9df9-a69128b675ff'),
	(147,'Neo_Block','2017-03-19 14:37:36','2017-03-19 14:37:36','688cc637-2c7d-42b2-8cdf-d320a903af9d'),
	(148,'Neo_Block','2017-03-19 14:37:36','2017-03-19 14:37:36','23ab8f5c-654c-4f6a-8b89-b88c030e58ec'),
	(149,'Neo_Block','2017-03-19 14:37:36','2017-03-19 14:37:36','ef53172d-0e12-462d-94c3-85cb23314a99'),
	(150,'Neo_Block','2017-03-19 14:37:36','2017-03-19 14:37:36','8cd3a4e6-474c-4f82-95d4-8625dfc25e71'),
	(151,'Neo_Block','2017-03-19 14:37:36','2017-03-19 14:37:36','400dbef5-6d59-44ea-a626-8c7d9d40af51'),
	(152,'Neo_Block','2017-03-19 14:37:36','2017-03-19 14:37:36','521c4b9d-8afc-44b9-903c-d5ac9f0d24bc'),
	(153,'Neo_Block','2017-03-19 14:37:36','2017-03-19 14:37:36','1ce9df87-6c5a-4a3d-995e-e353482ec98f'),
	(154,'Neo_Block','2017-03-19 14:37:36','2017-03-19 14:37:36','4eb8a5fb-6049-4efe-ba85-12a9f8815bcf'),
	(155,'Neo_Block','2017-03-19 14:37:36','2017-03-19 14:37:36','af5cd5a3-0df5-4a15-8a57-1e106a0f484b'),
	(156,'Neo_Block','2017-03-19 14:37:36','2017-03-19 14:37:36','a057cf9e-e99e-430d-97c4-1cb35f894e56'),
	(157,'SuperTable_Block','2017-03-19 14:38:15','2017-03-19 14:38:15','0a2c64b5-e86a-4593-83b5-abc9aecbfeaf'),
	(159,'Entry','2017-03-19 14:45:10','2017-03-19 14:45:10','cbcf10bf-355d-41e8-a998-78c62bd762c2');

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
	(97,82,'Content',1,'2017-03-13 10:15:52','2017-03-13 10:15:52','ee00e57f-0bb8-4094-b744-713d50897cd7'),
	(160,123,'Content',1,'2017-03-13 10:22:58','2017-03-13 10:22:58','8e4c5526-0513-47e2-8b59-78548dc64221'),
	(161,124,'Content',1,'2017-03-13 10:40:13','2017-03-13 10:40:13','88681bfb-1010-46f9-bf14-c56595275f0c'),
	(162,125,'Content',1,'2017-03-13 10:42:48','2017-03-13 10:42:48','edeb0a73-17d2-42ff-b812-1a1b36a523c1'),
	(163,126,'Content',1,'2017-03-13 10:45:34','2017-03-13 10:45:34','247b947d-c81c-4008-8f32-f116e15da253'),
	(165,128,'Content',1,'2017-03-13 10:46:41','2017-03-13 10:46:41','1efbe527-1cec-440d-ac78-0a2b756b3c97'),
	(166,129,'Content',1,'2017-03-13 10:49:27','2017-03-13 10:49:27','dd1b2974-440c-49f5-be1e-d2fb206e8dab'),
	(167,130,'Content',1,'2017-03-13 10:50:32','2017-03-13 10:50:32','76002f81-60b5-4fa9-94bd-894dc726c899'),
	(168,131,'Content',1,'2017-03-13 10:51:34','2017-03-13 10:51:34','c20f851f-40b5-4a26-8e87-74dc9054334a'),
	(169,132,'Content',1,'2017-03-13 10:52:37','2017-03-13 10:52:37','c0290176-cd63-4485-b60e-30c27e5f418a'),
	(172,135,'Content',1,'2017-03-13 11:36:31','2017-03-13 11:36:31','e2109419-939e-40e5-a843-f6e940fecfdb'),
	(173,136,'Content',1,'2017-03-13 11:38:26','2017-03-13 11:38:26','82e52b37-b9f2-409a-93dc-12be7cc5f8b7'),
	(174,137,'Content',1,'2017-03-19 14:37:36','2017-03-19 14:37:36','feefef46-3be9-410a-be8f-e235c1fc6518'),
	(175,137,'Settings',2,'2017-03-19 14:37:36','2017-03-19 14:37:36','cef2ebb3-d241-4472-ae81-e891bb226486'),
	(176,138,'Content',1,'2017-03-19 14:37:36','2017-03-19 14:37:36','a8f5edf0-2f02-4539-b7be-4d8c3e84b1b9'),
	(177,138,'Settings',2,'2017-03-19 14:37:36','2017-03-19 14:37:36','1100899a-e37d-4b0f-b2d0-b2a6fcb7c0bc'),
	(178,139,'Content',1,'2017-03-19 14:37:36','2017-03-19 14:37:36','082c0993-d112-4ee1-9db0-f729bbb46e99'),
	(179,140,'Content',1,'2017-03-19 14:37:36','2017-03-19 14:37:36','dacf2979-1a61-4d37-841e-7d15ce8a02ab'),
	(180,142,'Content',1,'2017-03-19 14:37:36','2017-03-19 14:37:36','7e3db2ab-e751-42e9-946b-42888aeb85b0'),
	(181,143,'Content',1,'2017-03-19 14:37:36','2017-03-19 14:37:36','5ba7acab-a57d-4516-a011-aaf1cf5af8c0'),
	(182,143,'Settings',2,'2017-03-19 14:37:36','2017-03-19 14:37:36','898ee33c-cc06-409f-ab42-e962b82eb171'),
	(183,144,'Content',1,'2017-03-19 14:37:36','2017-03-19 14:37:36','cba50e5f-8870-494b-81ff-718be7b523db'),
	(184,144,'Settings',2,'2017-03-19 14:37:36','2017-03-19 14:37:36','494dabb7-ea2c-4df6-8eea-8b332bf63be3'),
	(185,145,'Content',1,'2017-03-19 14:37:36','2017-03-19 14:37:36','e55fda81-3d8e-49ab-9696-cbd333133cde'),
	(186,145,'Settings',2,'2017-03-19 14:37:36','2017-03-19 14:37:36','bf8dae01-7da3-43ce-a9e4-ba91a0d51681'),
	(187,146,'Content',1,'2017-03-19 14:37:36','2017-03-19 14:37:36','e487419c-a0d2-4f10-8a99-c3b2ab4403da'),
	(188,146,'Settings',2,'2017-03-19 14:37:36','2017-03-19 14:37:36','4204af23-9fb8-4103-9241-1c219763a3d0'),
	(189,147,'Content',1,'2017-03-19 14:37:36','2017-03-19 14:37:36','0c501194-3e7f-4214-9251-52ed0fa4fc05'),
	(190,147,'Settings',2,'2017-03-19 14:37:36','2017-03-19 14:37:36','f2a2cd12-5a2f-47bc-943d-677efe20df45'),
	(191,148,'Content',1,'2017-03-19 14:37:36','2017-03-19 14:37:36','0d40fa0f-7922-4983-825d-e6e9b6699893'),
	(192,148,'Settings',2,'2017-03-19 14:37:36','2017-03-19 14:37:36','6454ee7e-689b-44f8-9a62-8b90d0dd82de'),
	(193,149,'Content',1,'2017-03-19 14:37:36','2017-03-19 14:37:36','8a50e03d-9ddc-431d-91ac-2c73e04b52d5'),
	(194,149,'Settings',2,'2017-03-19 14:37:36','2017-03-19 14:37:36','b4f857e3-b264-4134-8cbd-426c6ed2adea'),
	(195,150,'Content',1,'2017-03-19 14:37:36','2017-03-19 14:37:36','daf64f4d-c4e1-4435-a508-111e316d6158'),
	(196,151,'Content',1,'2017-03-19 14:37:36','2017-03-19 14:37:36','93f3faad-7957-48eb-9040-1d0e58f9513e'),
	(197,152,'Content',1,'2017-03-19 14:37:36','2017-03-19 14:37:36','67da5cd2-1353-4c32-a45b-9c38874c2462'),
	(198,152,'Settings',2,'2017-03-19 14:37:36','2017-03-19 14:37:36','60e25db2-125d-43ac-9dda-820bf588fe75'),
	(199,154,'Content',1,'2017-03-19 14:37:36','2017-03-19 14:37:36','5d22097c-3aae-4dac-9a33-59b4a9b8ab26'),
	(200,154,'Settings',2,'2017-03-19 14:37:36','2017-03-19 14:37:36','5a359855-d320-4295-9bab-f084f06ce4e2'),
	(201,155,'Content',1,'2017-03-19 14:37:36','2017-03-19 14:37:36','68d0933d-28cf-4585-9e5f-cc8a8b651e09'),
	(202,155,'Settings',2,'2017-03-19 14:37:36','2017-03-19 14:37:36','65ab31bc-0075-4257-85c7-de313981b390'),
	(203,156,'Content',1,'2017-03-19 14:37:36','2017-03-19 14:37:36','9ff46204-eaef-48bd-8393-02679b116104'),
	(204,156,'Settings',2,'2017-03-19 14:37:36','2017-03-19 14:37:36','d6c4e354-c272-4932-b7f3-ffa3dcc2d15b'),
	(205,157,'Content',1,'2017-03-19 14:38:15','2017-03-19 14:38:15','3366df7b-12a8-40a3-bc2a-d3ba97d6856f'),
	(206,159,'Content',1,'2017-03-19 14:45:10','2017-03-19 14:45:10','ac75f3bc-092c-4a66-8f6a-4f98b6242a79');

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
	(24,7,'Settings: Button','settingsButton','global','',0,'SuperTable','{\"columns\":{\"25\":{\"width\":\"\"},\"26\":{\"width\":\"\"},\"27\":{\"width\":\"\"},\"30\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-02-21 21:30:10','2017-03-13 10:15:52','8e511e01-5224-495d-8de1-85674f72b63e'),
	(25,NULL,'Style','style','superTableBlockType:3','',0,'Dropdown','{\"options\":[{\"label\":\"Primary\",\"value\":\"primary\",\"default\":\"1\"},{\"label\":\"Secondary\",\"value\":\"secondary\",\"default\":\"\"}]}','2017-02-21 21:30:11','2017-03-13 10:15:52','54c9d5e7-0323-4f89-b90c-ff4c7b952740'),
	(26,NULL,'Alignment','alignment','superTableBlockType:3','',0,'Dropdown','{\"options\":[{\"label\":\"Left\",\"value\":\"left\",\"default\":\"1\"},{\"label\":\"Center\",\"value\":\"center\",\"default\":\"\"},{\"label\":\"Right\",\"value\":\"right\",\"default\":\"\"},{\"label\":\"Full\",\"value\":\"full\",\"default\":\"\"}]}','2017-02-21 21:30:11','2017-03-13 10:15:52','c90db377-bfdc-4570-af4f-6acf2fe5372d'),
	(27,NULL,'With Icon','withIcon','superTableBlockType:3','',0,'Lightswitch','{\"default\":\"\"}','2017-02-21 21:30:11','2017-03-13 10:15:52','c72bdda6-e82e-4f92-9ea7-a5bc4b17d9b7'),
	(30,NULL,'Icon','icon','superTableBlockType:3','',0,'Dropdown','{\"options\":[{\"label\":\"Icon Sample\",\"value\":\"iconSample\",\"default\":\"1\"}]}','2017-02-21 21:30:11','2017-03-13 10:15:52','ae6db900-b198-42fa-b0ff-da08e8d6b871'),
	(31,7,'Settings: ButtonGroup','settingsButtonGroup','global','',0,'SuperTable','{\"columns\":{\"32\":{\"width\":\"\"},\"33\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-02-21 21:30:11','2017-03-13 10:40:13','6b606f87-2c11-4d92-a27a-7f7917e9f4d7'),
	(32,NULL,'Style','style','superTableBlockType:4','',0,'Dropdown','{\"options\":[{\"label\":\"Primary\",\"value\":\"primary\",\"default\":\"1\"},{\"label\":\"Secondary\",\"value\":\"secondary\",\"default\":\"\"}]}','2017-02-21 21:30:11','2017-03-13 10:40:13','f4c4a7b5-23f4-4222-905e-3e639a4b0d1e'),
	(33,NULL,'Alignment','alignment','superTableBlockType:4','',0,'Dropdown','{\"options\":[{\"label\":\"Left\",\"value\":\"left\",\"default\":\"1\"},{\"label\":\"Center\",\"value\":\"center\",\"default\":\"\"},{\"label\":\"Right\",\"value\":\"right\",\"default\":\"\"},{\"label\":\"Full\",\"value\":\"full\",\"default\":\"\"}]}','2017-02-21 21:30:11','2017-03-13 10:40:13','de9ee8c7-fc05-49eb-823f-bac25cb71c41'),
	(34,7,'Settings: Definition List','settingsDefinitionList','global','',0,'SuperTable','{\"columns\":{\"35\":{\"width\":\"\"},\"36\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-02-21 21:30:11','2017-03-13 10:42:48','571cdf57-e321-4db7-8cab-2cc31836b44b'),
	(35,NULL,'Columns Ratio','columnsRatio','superTableBlockType:5','',0,'Dropdown','{\"options\":[{\"label\":\"1:1\",\"value\":\"50-50\",\"default\":\"1\"},{\"label\":\"1:2\",\"value\":\"33-66\",\"default\":\"\"},{\"label\":\"1:3\",\"value\":\"25-75\",\"default\":\"\"}]}','2017-02-21 21:30:11','2017-03-13 10:42:48','8d5a4325-d696-4595-9d8d-f361a8ae37e2'),
	(36,NULL,'Layout','layout','superTableBlockType:5','',0,'Dropdown','{\"options\":[{\"label\":\"Table Layout\",\"value\":\"table\",\"default\":\"1\"},{\"label\":\"Row Layout\",\"value\":\"row\",\"default\":\"\"}]}','2017-02-21 21:30:11','2017-03-13 10:42:48','b071ddb9-bb3f-41d7-9fe0-352dd95a11de'),
	(37,7,'Settings: Embed','settingsEmbed','global','',0,'SuperTable','{\"columns\":{\"38\":{\"width\":\"\"},\"39\":{\"width\":\"\"},\"40\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-02-21 21:30:11','2017-03-13 10:45:34','740db4b6-459b-4e34-8591-e6093074dd0b'),
	(38,NULL,'Video','video','superTableBlockType:6','',0,'Lightswitch','{\"default\":\"1\"}','2017-02-21 21:30:11','2017-03-13 10:45:34','1a550e04-7b67-4adf-ba51-27e49531adf6'),
	(39,NULL,'Embed Position','embedPosition','superTableBlockType:6','',0,'Dropdown','{\"options\":[{\"label\":\"Left\",\"value\":\"left\",\"default\":\"1\"},{\"label\":\"Center\",\"value\":\"center\",\"default\":\"\"},{\"label\":\"Right\",\"value\":\"right\",\"default\":\"\"}]}','2017-02-21 21:30:11','2017-03-13 10:45:34','4346889f-3a96-4a9b-9dac-a3ed90d80dda'),
	(40,NULL,'Embed: Width','embedWidth','superTableBlockType:6','',0,'Dropdown','{\"options\":[{\"label\":\"Full\",\"value\":\"full\",\"default\":\"1\"},{\"label\":\"Three Quarter\",\"value\":\"threeQuarter\",\"default\":\"\"},{\"label\":\"Half\",\"value\":\"half\",\"default\":\"\"}]}','2017-02-21 21:30:11','2017-03-13 10:45:34','e0c1ec82-332e-4d67-8719-234f635adc88'),
	(41,7,'Settings: Focal Point','settingsFocalPoint','global','',0,'FocalPointField_FocalPoint','{\"defaultFocalPoint\":\"50% 50%\"}','2017-02-21 21:30:11','2017-02-21 21:30:11','28101a38-68ba-4859-8b6d-1aff70dfdbee'),
	(42,7,'Settings: Headline','settingsHeadline','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"44\":{\"width\":\"\"},\"45\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-02-21 21:30:11','2017-03-13 10:46:41','92ca3cd7-d804-44b8-9b63-da776226ea61'),
	(44,NULL,'Semantic Size','semanticSize','superTableBlockType:7','',0,'Dropdown','{\"options\":[{\"label\":\"H1\",\"value\":\"h1\",\"default\":\"\"},{\"label\":\"H2\",\"value\":\"h2\",\"default\":\"1\"},{\"label\":\"H3\",\"value\":\"h3\",\"default\":\"\"},{\"label\":\"H4\",\"value\":\"h4\",\"default\":\"\"},{\"label\":\"H5\",\"value\":\"h5\",\"default\":\"\"},{\"label\":\"H6\",\"value\":\"h6\",\"default\":\"\"}]}','2017-02-21 21:30:12','2017-03-13 10:46:41','6ddf306d-e682-480f-80e5-ad482bdd1d46'),
	(45,NULL,'Visual Size','visualSize','superTableBlockType:7','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"1\"},{\"label\":\"Looks like H1\",\"value\":\"h1\",\"default\":\"\"},{\"label\":\"Looks like H2\",\"value\":\"h2\",\"default\":\"\"},{\"label\":\"Looks like H3\",\"value\":\"h3\",\"default\":\"\"},{\"label\":\"Looks like H4\",\"value\":\"h4\",\"default\":\"\"},{\"label\":\"Looks like H5\",\"value\":\"h5\",\"default\":\"\"},{\"label\":\"Looks like H6\",\"value\":\"h6\",\"default\":\"\"}]}','2017-02-21 21:30:12','2017-03-13 10:46:41','7e16ee86-2aa7-40f5-b6cd-6556880bf43e'),
	(46,7,'Settings: Image Cover','settingsImageCover','global','',0,'SuperTable','{\"columns\":{\"47\":{\"width\":\"\"},\"48\":{\"width\":\"\"},\"49\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-02-21 21:30:12','2017-03-13 10:49:27','acb40eab-e4f9-494c-88d6-6dabcbd34b12'),
	(47,NULL,'Background Position','backgroundPosition','superTableBlockType:8','',0,'Dropdown','{\"options\":[{\"label\":\"Focalpoint\",\"value\":\"focalpoint\",\"default\":\"1\"},{\"label\":\"Left : Top\",\"value\":\"0% 0%\",\"default\":\"\"},{\"label\":\"Left : Center\",\"value\":\"0% 50%\",\"default\":\"\"},{\"label\":\"Left : Bottom\",\"value\":\"0% 100%\",\"default\":\"\"},{\"label\":\"Center : Top\",\"value\":\"50% 0%\",\"default\":\"\"},{\"label\":\"Center : Center\",\"value\":\"50% 50%\",\"default\":\"\"},{\"label\":\"Center : Bottom\",\"value\":\"50% 100%\",\"default\":\"\"},{\"label\":\"Right : Top\",\"value\":\"100% 0%\",\"default\":\"\"},{\"label\":\"Right : Center\",\"value\":\"100% 50%\",\"default\":\"\"},{\"label\":\"Right : Bottom\",\"value\":\"100% 100%\",\"default\":\"\"}]}','2017-02-21 21:30:12','2017-03-13 10:49:27','1c15989a-eedd-4562-99fa-6b6a98f09c1c'),
	(48,NULL,'Text Vertical Position','textVerticalPosition','superTableBlockType:8','',0,'Dropdown','{\"options\":[{\"label\":\"Top\",\"value\":\"top\",\"default\":\"\"},{\"label\":\"Center\",\"value\":\"center\",\"default\":\"\"},{\"label\":\"Bottom\",\"value\":\"bottom\",\"default\":\"1\"}]}','2017-02-21 21:30:12','2017-03-13 10:49:27','0f4da27a-2145-4f7f-a486-360a847fd253'),
	(49,NULL,'Text Alignment','textAlignment','superTableBlockType:8','',0,'Dropdown','{\"options\":[{\"label\":\"Left\",\"value\":\"left\",\"default\":\"\"},{\"label\":\"Center\",\"value\":\"center\",\"default\":\"1\"},{\"label\":\"Right\",\"value\":\"right\",\"default\":\"\"}]}','2017-02-21 21:30:12','2017-03-13 10:49:27','5da7db5a-1636-4a91-ada5-3f13a3620710'),
	(50,7,'Settings: Image Gallery','settingsImageGallery','global','',0,'SuperTable','{\"columns\":{\"51\":{\"width\":\"\"},\"52\":{\"width\":\"\"},\"53\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-02-21 21:30:12','2017-03-13 10:50:32','4219627d-e662-4234-a516-c1783b2e3ce4'),
	(51,NULL,'Colums','columns','superTableBlockType:9','',0,'Dropdown','{\"options\":[{\"label\":\"6\",\"value\":\"6\",\"default\":\"1\"},{\"label\":\"5\",\"value\":\"5\",\"default\":\"\"},{\"label\":\"4\",\"value\":\"4\",\"default\":\"\"},{\"label\":\"3\",\"value\":\"3\",\"default\":\"\"},{\"label\":\"2\",\"value\":\"2\",\"default\":\"\"}]}','2017-02-21 21:30:12','2017-03-13 10:50:32','61171418-8f53-410b-9394-9c9bb78e0f52'),
	(52,NULL,'Image Position','imagePosition','superTableBlockType:9','',0,'Dropdown','{\"options\":[{\"label\":\"Focalpoint\",\"value\":\"focalpoint\",\"default\":\"1\"},{\"label\":\"Left : Top\",\"value\":\"0% 0%\",\"default\":\"\"},{\"label\":\"Left : Center\",\"value\":\"0% 50%\",\"default\":\"\"},{\"label\":\"Left : Bottom\",\"value\":\"0% 100%\",\"default\":\"\"},{\"label\":\"Center : Top\",\"value\":\"50% 0%\",\"default\":\"\"},{\"label\":\"Center : Center\",\"value\":\"50% 50%\",\"default\":\"\"},{\"label\":\"Center : Bottom\",\"value\":\"50% 100%\",\"default\":\"\"},{\"label\":\"Right : Top\",\"value\":\"100% 0%\",\"default\":\"\"},{\"label\":\"Right : Center\",\"value\":\"100% 50%\",\"default\":\"\"},{\"label\":\"Right : Bottom\",\"value\":\"100% 100%\",\"default\":\"\"}]}','2017-02-21 21:30:12','2017-03-13 10:50:32','b2f99a61-f278-49df-b979-26ec71f8c79c'),
	(53,NULL,'Image Thumbs Ratio','imageThumbsRatio','superTableBlockType:9','',0,'Dropdown','{\"options\":[{\"label\":\"16:10\",\"value\":\"16:10\",\"default\":\"\"},{\"label\":\"16:9\",\"value\":\"16:9\",\"default\":\"\"},{\"label\":\"4:3\",\"value\":\"4:3\",\"default\":\"\"},{\"label\":\"3:2\",\"value\":\"3:2\",\"default\":\"\"},{\"label\":\"2:1\",\"value\":\"2:1\",\"default\":\"\"},{\"label\":\"1:1\",\"value\":\"1:1\",\"default\":\"1\"},{\"label\":\"1:2\",\"value\":\"1:2\",\"default\":\"\"},{\"label\":\"2:3\",\"value\":\"2:3\",\"default\":\"\"},{\"label\":\"3:4\",\"value\":\"3:4\",\"default\":\"\"},{\"label\":\"9:16\",\"value\":\"9:16\",\"default\":\"\"},{\"label\":\"10:16\",\"value\":\"10:16\",\"default\":\"\"}]}','2017-02-21 21:30:12','2017-03-13 10:50:32','35214074-5809-4b92-9424-3c39bb48684f'),
	(54,7,'Settings: Image Grid','settingsImageGrid','global','',0,'SuperTable','{\"columns\":{\"55\":{\"width\":\"\"},\"56\":{\"width\":\"\"},\"57\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-02-21 21:30:12','2017-03-13 10:51:34','50e99800-0680-4311-b12e-b0f85bf975cb'),
	(55,NULL,'Caption','caption','superTableBlockType:10','',0,'Lightswitch','{\"default\":\"\"}','2017-02-21 21:30:12','2017-03-13 10:51:34','2552b0ca-d5cd-4e17-b94b-76e0636ce738'),
	(56,NULL,'Columns','columns','superTableBlockType:10','',0,'Dropdown','{\"options\":[{\"label\":\"3\",\"value\":\"3\",\"default\":\"\"},{\"label\":\"2\",\"value\":\"2\",\"default\":\"1\"},{\"label\":\"1\",\"value\":\"1\",\"default\":\"\"}]}','2017-02-21 21:30:12','2017-03-13 10:51:34','fd0d3d2e-1231-4f20-8cd2-3a6c20a4c97b'),
	(57,NULL,'Image Ratio','imageRatio','superTableBlockType:10','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"1\"},{\"label\":\"16:10\",\"value\":\"16:10\",\"default\":\"\"},{\"label\":\"16:9\",\"value\":\"16:9\",\"default\":\"\"},{\"label\":\"4:3\",\"value\":\"4:3\",\"default\":\"\"},{\"label\":\"3:2\",\"value\":\"3:2\",\"default\":\"\"},{\"label\":\"2:1\",\"value\":\"2:1\",\"default\":\"\"},{\"label\":\"1:1\",\"value\":\"1:1\",\"default\":\"\"},{\"label\":\"1:2\",\"value\":\"1:2\",\"default\":\"\"},{\"label\":\"2:3\",\"value\":\"2:3\",\"default\":\"\"},{\"label\":\"3:4\",\"value\":\"3:4\",\"default\":\"\"},{\"label\":\"9:16\",\"value\":\"9:16\",\"default\":\"\"},{\"label\":\"10:16\",\"value\":\"10:16\",\"default\":\"\"}]}','2017-02-21 21:30:12','2017-03-13 10:51:34','b91b1b0e-2df2-4322-a444-527cefa88f5e'),
	(58,7,'Settings: Image Single','settingsImageSingle','global','',0,'SuperTable','{\"columns\":{\"59\":{\"width\":\"\"},\"60\":{\"width\":\"\"},\"61\":{\"width\":\"\"},\"62\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-02-21 21:30:12','2017-03-13 10:52:37','f3ebfea7-930c-4559-a939-8739da0eafa7'),
	(59,NULL,'Caption','caption','superTableBlockType:11','',0,'Lightswitch','{\"default\":\"\"}','2017-02-21 21:30:12','2017-03-13 10:52:37','ba5db803-1b8d-4c10-8792-fd0893bc5fb9'),
	(60,NULL,'Image Position','imagePosition','superTableBlockType:11','',0,'Dropdown','{\"options\":[{\"label\":\"Left\",\"value\":\"left\",\"default\":\"\"},{\"label\":\"Center\",\"value\":\"center\",\"default\":\"1\"},{\"label\":\"Right\",\"value\":\"right\",\"default\":\"\"}]}','2017-02-21 21:30:12','2017-03-13 10:52:37','b2ee8e1c-114e-4f25-9c00-f5c16a4d82a8'),
	(61,NULL,'Image Ratio','imageRatio','superTableBlockType:11','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"1\"},{\"label\":\"16:10\",\"value\":\"16:10\",\"default\":\"\"},{\"label\":\"16:9\",\"value\":\"16:9\",\"default\":\"\"},{\"label\":\"4:3\",\"value\":\"4:3\",\"default\":\"\"},{\"label\":\"3:2\",\"value\":\"3:2\",\"default\":\"\"},{\"label\":\"2:1\",\"value\":\"2:1\",\"default\":\"\"},{\"label\":\"1:1\",\"value\":\"1:1\",\"default\":\"\"},{\"label\":\"1:2\",\"value\":\"1:2\",\"default\":\"\"},{\"label\":\"2:3\",\"value\":\"2:3\",\"default\":\"\"},{\"label\":\"3:4\",\"value\":\"3:4\",\"default\":\"\"},{\"label\":\"9:16\",\"value\":\"9:16\",\"default\":\"\"},{\"label\":\"10:16\",\"value\":\"10:16\",\"default\":\"\"}]}','2017-02-21 21:30:12','2017-03-13 10:52:37','9f132934-c270-475b-b3c7-fbff360eebe6'),
	(62,NULL,'Image Width','imageWidth','superTableBlockType:11','',0,'Dropdown','{\"options\":[{\"label\":\"Full\",\"value\":\"full\",\"default\":\"1\"},{\"label\":\"Three Quarter\",\"value\":\"threeQuarter\",\"default\":\"\"},{\"label\":\"Half\",\"value\":\"half\",\"default\":\"\"}]}','2017-02-21 21:30:12','2017-03-13 10:52:37','55f40ce2-def2-4aa0-bd0b-7c4a5347f77b'),
	(63,7,'Settings: Image Slider','settingsImageSlider','global','',0,'SuperTable','{\"columns\":{\"69\":{\"width\":\"\"},\"72\":{\"width\":\"\"},\"73\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-02-21 21:30:12','2017-03-13 10:22:58','ec384fc7-31ba-4900-9f56-ac39876942a3'),
	(69,NULL,'Image Ratio','imageRatio','superTableBlockType:12','',0,'Dropdown','{\"options\":[{\"label\":\"16:10\",\"value\":\"16:10\",\"default\":\"1\"},{\"label\":\"16:9\",\"value\":\"16:9\",\"default\":\"\"},{\"label\":\"4:3\",\"value\":\"4:3\",\"default\":\"\"},{\"label\":\"3:2\",\"value\":\"3:2\",\"default\":\"\"},{\"label\":\"2:1\",\"value\":\"2:1\",\"default\":\"\"},{\"label\":\"1:1\",\"value\":\"1:1\",\"default\":\"\"},{\"label\":\"1:2\",\"value\":\"1:2\",\"default\":\"\"},{\"label\":\"2:3\",\"value\":\"2:3\",\"default\":\"\"},{\"label\":\"3:4\",\"value\":\"3:4\",\"default\":\"\"},{\"label\":\"9:16\",\"value\":\"9:16\",\"default\":\"\"},{\"label\":\"10:16\",\"value\":\"10:16\",\"default\":\"\"}]}','2017-02-21 21:30:13','2017-03-13 10:22:58','14cdcb23-9019-4dd9-b270-4e74ea9c3826'),
	(72,NULL,'Navigation','navigation','superTableBlockType:12','',0,'Lightswitch','{\"default\":\"1\"}','2017-02-21 21:30:13','2017-03-13 10:22:58','113b04c2-2d0b-41cb-85d7-6af47204cf67'),
	(73,NULL,'Pagination','pagination','superTableBlockType:12','',0,'Lightswitch','{\"default\":\"1\"}','2017-02-21 21:30:13','2017-03-13 10:22:58','46804b2d-f8ea-49fe-a194-b19e23652c60'),
	(77,7,'Settings: Section','settingsSection','global','',0,'SuperTable','{\"columns\":{\"78\":{\"width\":\"\"},\"79\":{\"width\":\"\"},\"80\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Section Options\",\"maxRows\":null}','2017-02-21 21:30:13','2017-03-19 14:38:15','1ff15ce4-5b84-4c8a-80ec-76281bba55ef'),
	(78,NULL,'Background Color','backgroundColor','superTableBlockType:13','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"1\"},{\"label\":\"Black\",\"value\":\"black\",\"default\":\"\"},{\"label\":\"White\",\"value\":\"white\",\"default\":\"\"}]}','2017-02-21 21:30:13','2017-03-19 14:38:15','565c7ce4-258c-4df0-8cf4-354b979b5ae0'),
	(79,NULL,'Full Width','fullWidth','superTableBlockType:13','',0,'Lightswitch','{\"default\":\"\"}','2017-02-21 21:30:13','2017-03-19 14:38:15','46571a18-ba60-4d72-99e8-0ac7aa4a009c'),
	(80,NULL,'Padding Vertical','paddingVertical','superTableBlockType:13','',0,'Dropdown','{\"options\":[{\"label\":\"None\",\"value\":\"none\",\"default\":\"\"},{\"label\":\"Small\",\"value\":\"small\",\"default\":\"\"},{\"label\":\"Medium\",\"value\":\"medium\",\"default\":\"1\"},{\"label\":\"Large\",\"value\":\"large\",\"default\":\"\"}]}','2017-02-21 21:30:13','2017-03-19 14:38:15','e2baa731-87c8-47b4-af0d-70c21e0b2d72'),
	(81,7,'Settings: Separator','settingsSeparator','global','',0,'SuperTable','{\"columns\":{\"82\":{\"width\":\"\"},\"83\":{\"width\":\"\"},\"84\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-02-21 21:30:13','2017-03-13 11:36:31','70bdc43f-da8d-495f-b7a1-6c12c50e32c9'),
	(82,NULL,'Full Width','fullWidth','superTableBlockType:14','',0,'Lightswitch','{\"default\":\"\"}','2017-02-21 21:30:13','2017-03-13 11:36:31','25d4fe0a-06c9-4713-8789-9a71c5a6b8ed'),
	(83,NULL,'Style','style','superTableBlockType:14','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"1\"}]}','2017-02-21 21:30:13','2017-03-13 11:36:31','96454438-80d3-412d-bdd4-6705f97a7e58'),
	(84,NULL,'Margin Vertical','marginVertical','superTableBlockType:14','',0,'Dropdown','{\"options\":[{\"label\":\"None\",\"value\":\"none\",\"default\":\"\"},{\"label\":\"Small\",\"value\":\"small\",\"default\":\"1\"},{\"label\":\"Medium\",\"value\":\"medium\",\"default\":\"\"},{\"label\":\"Large\",\"value\":\"large\",\"default\":\"\"}]}','2017-02-21 21:30:14','2017-03-13 11:36:31','4667ddd7-9983-4271-9e46-26f836af726e'),
	(85,7,'Settings: Two Columns','settingsTwoColumns','global','',0,'SuperTable','{\"columns\":{\"86\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-02-21 21:30:14','2017-03-13 11:38:26','4c163695-d67e-40aa-8d75-8e471bc2127b'),
	(86,NULL,'Columns Ratio','columnsRatio','superTableBlockType:15','',0,'Dropdown','{\"options\":[{\"label\":\"1:1\",\"value\":\"50-50\",\"default\":\"\"},{\"label\":\"2:1\",\"value\":\"66-33\",\"default\":\"\"},{\"label\":\"3:1\",\"value\":\"75-25\",\"default\":\"\"},{\"label\":\"1:3\",\"value\":\"25-75\",\"default\":\"\"},{\"label\":\"1:2\",\"value\":\"33-66\",\"default\":\"\"}]}','2017-02-21 21:30:14','2017-03-13 11:38:26','5123883a-1ab2-44b9-8b0d-43ad43d88b21'),
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
	(104,3,'Content Builder: Neo','contentBuilderNeo','global','',0,'Neo','{\"maxBlocks\":null}','2017-02-21 21:30:15','2017-03-19 14:37:36','9172ad61-ae3c-4788-a854-ba4abbb9ba0f'),
	(106,NULL,'Indented','indented','superTableBlockType:7','',0,'Lightswitch','{\"default\":\"\"}','2017-03-13 10:46:41','2017-03-13 10:46:41','ddb337a8-cf43-49e8-90a7-a2034fca2034');

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
	(1,'2.6.2967','2.6.9',2,'SITE_NAME','http://craftcms.fredmansky.dev','UTC',1,0,'2017-02-21 21:25:00','2017-03-19 14:32:46','0c1df341-4676-48c4-b3d5-1fc36ed7a3ba');

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

LOCK TABLES `craft_neoblocks` WRITE;
/*!40000 ALTER TABLE `craft_neoblocks` DISABLE KEYS */;

INSERT INTO `craft_neoblocks` (`id`, `ownerId`, `fieldId`, `typeId`, `collapsed`, `ownerLocale`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(28,27,104,1,0,NULL,'2017-03-19 14:47:38','2017-03-19 15:27:05','ab3128a5-2d5a-4730-b8eb-7b57b765c819'),
	(30,27,104,2,0,NULL,'2017-03-19 14:47:38','2017-03-19 15:27:05','419a0b1b-6605-400e-ad84-bb49472dcf3e'),
	(32,27,104,3,0,NULL,'2017-03-19 14:47:38','2017-03-19 15:27:05','f199806e-9f65-4d37-b04c-548336666e66'),
	(33,27,104,4,0,NULL,'2017-03-19 14:47:38','2017-03-19 15:27:05','ce9dd0ae-3ee6-405e-85db-9dc71fe7984a'),
	(34,27,104,5,0,NULL,'2017-03-19 14:47:39','2017-03-19 15:27:05','1eaf8a6e-acc9-4f76-8864-237b60931505'),
	(35,27,104,6,0,NULL,'2017-03-19 14:47:39','2017-03-19 15:27:05','eac7afdd-5e29-4d47-9c76-8c4d6d674174'),
	(36,27,104,6,0,NULL,'2017-03-19 14:47:39','2017-03-19 15:27:05','c8da9e7d-687e-457a-a836-ecf1967a3a36'),
	(37,27,104,1,0,NULL,'2017-03-19 14:51:02','2017-03-19 15:27:06','5d572839-8f59-4de3-b848-f056c7ff58b5'),
	(39,27,104,12,0,NULL,'2017-03-19 14:51:02','2017-03-19 15:27:06','e8ef1abe-ed7c-425d-9fe6-fccf9c348292'),
	(41,27,104,13,0,NULL,'2017-03-19 14:51:02','2017-03-19 15:27:06','ed2fb51f-d485-4dfb-955d-3b53ec43b9da'),
	(46,27,104,1,0,NULL,'2017-03-19 14:51:02','2017-03-19 15:27:06','46c8b8a5-4934-45f9-8975-a8d9f4f274f8'),
	(48,27,104,18,0,NULL,'2017-03-19 14:51:02','2017-03-19 15:27:06','ddf92654-b5bf-4419-90b9-271efca33f77'),
	(50,27,104,19,0,NULL,'2017-03-19 14:51:02','2017-03-19 15:27:06','5add8e1d-8ee5-4925-b972-854ebe899346'),
	(52,27,104,20,0,NULL,'2017-03-19 14:51:02','2017-03-19 15:27:06','5ff23943-8af7-4a77-9418-7f3c1bdfa943'),
	(54,27,104,1,0,NULL,'2017-03-19 15:27:06','2017-03-19 15:27:06','14fff73b-551e-4530-933c-32c5605fc203'),
	(56,27,104,14,0,NULL,'2017-03-19 15:27:06','2017-03-19 15:27:06','c785735e-95dd-47d0-8fd4-ef06b0ef470a'),
	(57,27,104,15,0,NULL,'2017-03-19 15:27:06','2017-03-19 15:27:06','4042dedc-c6ec-42e4-b992-a87b59fc8f3e'),
	(58,27,104,3,0,NULL,'2017-03-19 15:27:06','2017-03-19 15:27:06','b9b7dd1b-e14f-475f-95e7-b7d268c92ba4'),
	(59,27,104,15,0,NULL,'2017-03-19 15:27:06','2017-03-19 15:27:06','bd621b95-f71f-4625-a96c-ff66038c5022'),
	(60,27,104,3,0,NULL,'2017-03-19 15:27:06','2017-03-19 15:27:06','464aeac9-c35d-4019-b69a-b92a3032e818'),
	(61,27,104,16,0,NULL,'2017-03-19 15:27:06','2017-03-19 15:27:06','a03afdfd-2709-4ef1-a9e9-f64a70e3d953'),
	(63,27,104,17,0,NULL,'2017-03-19 15:27:06','2017-03-19 15:27:06','fdd82c8a-373b-459a-a0e1-7cde540ff6e5'),
	(64,27,104,3,0,NULL,'2017-03-19 15:27:06','2017-03-19 15:27:06','c39e361a-aca4-4492-b928-9abc418c379d'),
	(65,27,104,17,0,NULL,'2017-03-19 15:27:06','2017-03-19 15:27:06','1aba19dd-71b4-4026-841a-7d4839ebf981'),
	(66,27,104,3,0,NULL,'2017-03-19 15:27:06','2017-03-19 15:27:06','b7c9bb44-f78e-4831-b1b8-a0bc21371a62');

/*!40000 ALTER TABLE `craft_neoblocks` ENABLE KEYS */;
UNLOCK TABLES;


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

LOCK TABLES `craft_neoblockstructures` WRITE;
/*!40000 ALTER TABLE `craft_neoblockstructures` DISABLE KEYS */;

INSERT INTO `craft_neoblockstructures` (`id`, `structureId`, `ownerId`, `fieldId`, `ownerLocale`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(8,10,27,104,NULL,'2017-03-19 15:27:05','2017-03-19 15:27:05','d84bb65e-c940-4e30-af40-4236deea4735');

/*!40000 ALTER TABLE `craft_neoblockstructures` ENABLE KEYS */;
UNLOCK TABLES;


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
	(1,104,137,'Content Section','contentSection',NULL,NULL,'',1,2,'2017-02-21 21:30:15','2017-03-19 14:37:36','0e8e9073-26d0-4835-afc2-d5e4f7e43127'),
	(2,104,138,'Headline','headline',NULL,NULL,'',1,8,'2017-02-21 21:30:15','2017-03-19 14:37:36','e44cc173-b209-4a19-9f54-b374f0af3c14'),
	(3,104,139,'Rich Text','richText',NULL,2,'',1,9,'2017-02-21 21:30:15','2017-03-19 14:37:36','05cac5e3-a182-4869-94a0-e4217124f721'),
	(4,104,140,'Rich Text Marginals','richTextMarginals',NULL,2,'[\"marginalColumn\"]',1,10,'2017-02-21 21:30:15','2017-03-19 14:37:36','c760a34a-4fbd-4f2f-945d-e619eca11fb2'),
	(5,104,141,'Marginal Column','marginalColumn',NULL,1,'[\"quote\",\"imageSingle\"]',0,11,'2017-02-21 21:30:15','2017-03-19 14:37:36','de970d11-5828-49c6-828d-ae0484bbf19c'),
	(6,104,142,'Quote','quote',NULL,NULL,'',1,12,'2017-02-21 21:30:15','2017-03-19 14:37:36','ff01243b-1277-4bac-a0c1-89b8cd041f58'),
	(7,104,143,'Image Cover','imageCover',NULL,NULL,'',1,14,'2017-02-21 21:30:15','2017-03-19 14:37:36','a1d53e91-bb4f-4f08-b080-48ec6c0586b5'),
	(8,104,144,'Image Gallery','imageGallery',NULL,NULL,'',1,15,'2017-02-21 21:30:15','2017-03-19 14:37:36','155ebc47-cdd3-47af-8c0f-7228e1c522a4'),
	(9,104,145,'Image Grid','imageGrid',NULL,NULL,'',1,16,'2017-02-21 21:30:15','2017-03-19 14:37:36','8364d609-2369-492d-b541-9f0ba4f49169'),
	(10,104,146,'Image Single','imageSingle',NULL,NULL,'',1,17,'2017-02-21 21:30:15','2017-03-19 14:37:36','2935578f-aa87-45e6-9b9f-5c065f97edcd'),
	(11,104,147,'Image Slider','imageSlider',NULL,NULL,'',1,18,'2017-02-21 21:30:15','2017-03-19 14:37:36','99ed428c-ae5f-4c5a-b0db-18d9de7b43b5'),
	(12,104,148,'Button','button',NULL,NULL,'',1,20,'2017-02-21 21:30:15','2017-03-19 14:37:36','c9ffacd6-bbe0-424d-97e5-ca758b9e62e1'),
	(13,104,149,'Button Group','buttonGroup',NULL,5,'',1,21,'2017-02-21 21:30:15','2017-03-19 14:37:36','aba8c89c-3429-4cd4-b166-f3f4be940041'),
	(14,104,150,'Accordion','accordion',NULL,NULL,'[\"accordionContent\"]',1,3,'2017-02-21 21:30:15','2017-03-19 14:37:36','39c71d8a-02fe-4715-9bd0-50ba9f674027'),
	(15,104,151,'Accordion Content','accordionContent',NULL,NULL,'[\"twoColumns\",\"headline\",\"richText\",\"richTextMarginals\",\"quote\",\"imageGallery\",\"imageGrid\",\"imageSingle\",\"button\",\"buttonGroup\",\"definitionList\",\"embed\",\"separator\"]',0,4,'2017-02-21 21:30:15','2017-03-19 14:37:36','8d681d3f-f4e1-4be4-8e88-0908767afcb8'),
	(16,104,152,'Two Columns','twoColumns',NULL,2,'[\"column\"]',1,5,'2017-02-21 21:30:15','2017-03-19 14:37:36','2d25fdae-d55d-453d-bbf9-705befd1ce6e'),
	(17,104,153,'Column','column',NULL,NULL,'[\"accordion\",\"headline\",\"richText\",\"quote\",\"imageGallery\",\"imageGrid\",\"imageSingle\",\"button\",\"buttonGroup\",\"definitionList\",\"embed\",\"separator\"]',0,6,'2017-02-21 21:30:15','2017-03-19 14:37:36','b9e8f725-b23c-431d-87b1-aa3530eae5f1'),
	(18,104,154,'Definition List','definitionList',NULL,NULL,'',1,23,'2017-02-21 21:30:15','2017-03-19 14:37:36','cd036e4a-4763-423f-8905-021f940278a3'),
	(19,104,155,'Embed','embed',NULL,NULL,'',1,24,'2017-02-21 21:30:15','2017-03-19 14:37:36','5d9f9219-c773-45ff-b695-523d55d070b2'),
	(20,104,156,'Separator','separator',NULL,NULL,'',1,25,'2017-02-21 21:30:15','2017-03-19 14:37:36','efecfce7-281c-4cbd-a9c2-c2b74eaf8102');

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
	(23,104,'Text Modules',7,'2017-03-19 14:37:36','2017-03-19 14:37:36','ee237eb9-5516-4863-a1f4-a5cf6b143327'),
	(24,104,'Image Modules',13,'2017-03-19 14:37:36','2017-03-19 14:37:36','4abe523c-17af-4659-81f3-2659e55ec560'),
	(25,104,'Button Modules',19,'2017-03-19 14:37:36','2017-03-19 14:37:36','f0a783a1-7653-4c0c-826e-896911f644a4'),
	(26,104,'Content Wrapper',1,'2017-03-19 14:37:36','2017-03-19 14:37:36','c08b68a7-e601-4caa-9e28-c3476bb9f223'),
	(27,104,'More Modules…',22,'2017-03-19 14:37:36','2017-03-19 14:37:36','cda2697f-9cd0-4830-9d85-b27afde73521');

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
	(1,'CpCss','1.1.1','1.1.0',NULL,'unknown',1,'{\"cssFile\":\"\",\"additionalCss\":\"#footer {\\r\\n  margin-top: 50vh;\\r\\n}\\r\\n\\r\\n.blocks .matrixblock {\\r\\n  width: calc(94% - 28px);\\r\\n  margin-left: 6%;\\r\\n}\\r\\n\\r\\n\\r\\n.blocks .mc-solid-contentSection {\\r\\n  width: calc(100% - 28px);\\r\\n  margin-top: 40px;\\r\\n  margin-left: 0;\\r\\n}\\r\\n\\r\\n.blocks .mc-solid-accordionLabel {\\r\\n  width: calc(97% - 28px);\\r\\n  margin-top: 20px;\\r\\n  margin-left: 3%;\\r\\n}\\r\\n\\r\\n.blocks .matrixblock:first-child {\\r\\n  margin-top: 10px;\\r\\n}\\r\\n\\r\\n.ni_blocks .ni_block:first-child {\\r\\n  margin-top: 10px;\\r\\n}\\r\\n\\r\\n\\r\\n.ni_blocks .ni_block {\\r\\n  width: 95%;\\r\\n  margin-left: 5%;\\r\\n}\\r\\n\\r\\n.ni_blocks .ni_block--contentSection,\\r\\n.ni_block_children .ni_block {\\r\\n  width: 100%;\\r\\n  margin-left: 0%;\\r\\n}\\r\\n\\r\\n.ni_block--contentSection .ni_block_topbar {\\r\\n  height: 40px;\\r\\n  line-height: 40px;\\r\\n  background-color: #E4E5E6;\\r\\n}\\r\\n\\r\\n.ni_block--contentSection .ni_block_topbar_item.tabs .tab {\\r\\n  height: 40px;\\r\\n}\\r\\n\"}','2017-02-21 21:28:24','2017-02-21 21:28:24','2017-03-19 14:40:45','e2a94690-c558-46fd-8eb8-f34abbf46d49'),
	(2,'FocalPointField','1.0.2',NULL,NULL,'unknown',1,NULL,'2017-02-21 21:28:26','2017-02-21 21:28:26','2017-03-19 14:40:45','5cd46ae4-6d5e-4cf9-906b-59d76c0df074'),
	(3,'Imager','1.5.0','1.0.0',NULL,'unknown',1,NULL,'2017-02-21 21:28:27','2017-02-21 21:28:27','2017-03-19 14:40:45','e8c5d9c3-8d01-42be-9e43-944ce0782720'),
	(4,'Kint','1.1.0','1.0.0',NULL,'unknown',1,NULL,'2017-02-21 21:28:29','2017-02-21 21:28:29','2017-03-19 14:40:45','34ea7f07-03d2-4970-addf-b7be9fa3c6cf'),
	(5,'FruitLinkIt','2.3.4','2.3.0',NULL,'unknown',1,NULL,'2017-02-21 21:28:31','2017-02-21 21:28:31','2017-03-19 14:40:45','111e40c1-89eb-4f35-a041-670450819069'),
	(6,'Minify','1.1.1','1.0.0',NULL,'unknown',1,NULL,'2017-02-21 21:28:33','2017-02-21 21:28:33','2017-03-19 14:40:45','aca690f8-4b51-43b2-a0d9-33a4dc4b5c9b'),
	(7,'Neo','1.4.1','1.4.1',NULL,'unknown',1,NULL,'2017-02-21 21:28:35','2017-02-21 21:28:35','2017-03-19 14:40:45','9f4d2780-61f9-48cc-a3c5-426c1e018255'),
	(9,'Retour','1.0.19','1.0.4',NULL,'unknown',1,NULL,'2017-02-21 21:28:44','2017-02-21 21:28:44','2017-03-19 14:40:45','0b3cd184-c95d-4ec1-9a34-4389a236f91b'),
	(10,'Sitemap','v1.0.0-alpha.4',NULL,NULL,'unknown',1,NULL,'2017-02-21 21:28:51','2017-02-21 21:28:51','2017-03-19 14:40:45','3bf9d449-a89d-4852-99af-0c0cb5d92b87'),
	(11,'Seomatic','1.1.43','1.1.25',NULL,'unknown',1,NULL,'2017-02-21 21:28:55','2017-02-21 21:28:55','2017-03-19 14:40:45','4aa0377d-c306-4ddd-ba68-765bca48bdc3'),
	(12,'SuperTable','1.0.3','1.0.0',NULL,'unknown',1,NULL,'2017-02-21 21:29:03','2017-02-21 21:29:03','2017-03-19 14:40:45','e086f775-3e1c-421d-9398-07839f26357d'),
	(14,'TheArchitect','1.6.0','1.6.0',NULL,'unknown',1,NULL,'2017-02-21 21:29:07','2017-02-21 21:29:07','2017-03-19 14:40:45','a63a63a4-a1d3-4c9d-ab00-60a97d1d3954'),
	(15,'Cookies','1.0.4','1.0.0',NULL,'unknown',1,NULL,'2017-03-13 09:48:38','2017-03-13 09:48:38','2017-03-19 14:40:45','8d8f1bfa-2766-4392-8711-f4cd6228bb39');

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
	(17,'filename',0,'en',' accessventures_preview jpg '),
	(17,'extension',0,'en',' jpg '),
	(17,'kind',0,'en',' image '),
	(17,'slug',0,'en',' accessventures preview '),
	(17,'title',0,'en',' accessventures preview '),
	(17,'field',18,'en',''),
	(17,'field',41,'en',' 50% 50% '),
	(18,'filename',0,'en',' andreabrugi_preview jpg '),
	(18,'extension',0,'en',' jpg '),
	(18,'kind',0,'en',' image '),
	(18,'slug',0,'en',' andreabrugi preview '),
	(18,'title',0,'en',' andreabrugi preview '),
	(18,'field',18,'en',''),
	(18,'field',41,'en',' 50% 50% '),
	(19,'filename',0,'en',' daniel hyngar_preview jpeg '),
	(19,'extension',0,'en',' jpeg '),
	(19,'kind',0,'en',' image '),
	(19,'slug',0,'en',' daniel hyngar preview '),
	(19,'title',0,'en',' daniel hyngar preview '),
	(19,'field',18,'en',''),
	(19,'field',41,'en',' 50% 50% '),
	(20,'filename',0,'en',' admirhadzic_preview jpg '),
	(20,'extension',0,'en',' jpg '),
	(20,'kind',0,'en',' image '),
	(20,'slug',0,'en',' admirhadzic preview '),
	(20,'title',0,'en',' admirhadzic preview '),
	(20,'field',18,'en',''),
	(20,'field',41,'en',' 50% 50% '),
	(21,'filename',0,'en',' firstround_preview jpg '),
	(21,'extension',0,'en',' jpg '),
	(21,'kind',0,'en',' image '),
	(21,'slug',0,'en',' firstround preview '),
	(21,'title',0,'en',' firstround preview '),
	(21,'field',18,'en',''),
	(21,'field',41,'en',' 50% 50% '),
	(22,'filename',0,'en',' glamuzina architects_preview jpg '),
	(22,'extension',0,'en',' jpg '),
	(22,'kind',0,'en',' image '),
	(22,'slug',0,'en',' glamuzina architects preview '),
	(22,'title',0,'en',' glamuzina architects preview '),
	(22,'field',18,'en',''),
	(22,'field',41,'en',' 50% 50% '),
	(23,'filename',0,'en',' milanote_preview jpg '),
	(23,'extension',0,'en',' jpg '),
	(23,'kind',0,'en',' image '),
	(23,'slug',0,'en',' milanote preview '),
	(23,'title',0,'en',' milanote preview '),
	(23,'field',18,'en',''),
	(23,'field',41,'en',' 50% 50% '),
	(24,'filename',0,'en',' panoply_preview jpg '),
	(24,'extension',0,'en',' jpg '),
	(24,'kind',0,'en',' image '),
	(24,'slug',0,'en',' panoply preview '),
	(24,'title',0,'en',' panoply preview '),
	(24,'field',18,'en',''),
	(24,'field',41,'en',' 50% 50% '),
	(25,'filename',0,'en',' red collar_preview jpg '),
	(25,'extension',0,'en',' jpg '),
	(25,'kind',0,'en',' image '),
	(25,'slug',0,'en',' red collar preview '),
	(25,'title',0,'en',' red collar preview '),
	(25,'field',18,'en',''),
	(25,'field',41,'en',' 50% 50% '),
	(26,'filename',0,'en',' sa studio_preview jpg '),
	(26,'extension',0,'en',' jpg '),
	(26,'kind',0,'en',' image '),
	(26,'slug',0,'en',' sa studio preview '),
	(26,'title',0,'en',' sa studio preview '),
	(26,'field',18,'en',''),
	(26,'field',41,'en',' 50% 50% '),
	(4,'slug',0,'en',' homepage '),
	(4,'title',0,'en',' homepage '),
	(5,'slug',0,'en',''),
	(5,'field',4,'en',''),
	(10,'slug',0,'en',''),
	(10,'field',78,'en',' default '),
	(10,'field',79,'en',' 0 '),
	(10,'field',80,'en',' default '),
	(16,'slug',0,'en',''),
	(16,'field',59,'en',' 0 '),
	(16,'field',60,'en',' default '),
	(16,'field',61,'en',' default '),
	(16,'field',62,'en',' default '),
	(1,'username',0,'en',' davidhellmann '),
	(1,'firstname',0,'en',' david '),
	(1,'lastname',0,'en',' hellmann '),
	(1,'fullname',0,'en',' david hellmann '),
	(1,'email',0,'en',' david fredmansky at '),
	(1,'slug',0,'en',''),
	(7,'username',0,'en',' superuser '),
	(7,'firstname',0,'en',' super '),
	(7,'lastname',0,'en',' user '),
	(7,'fullname',0,'en',' super user '),
	(7,'email',0,'en',' super user com '),
	(7,'slug',0,'en',''),
	(27,'slug',0,'en',' modules '),
	(27,'title',0,'en',' modules '),
	(27,'field',104,'en',''),
	(28,'field',94,'en',' text modules '),
	(28,'field',102,'en',' this is a subline for text modules '),
	(28,'field',87,'en',''),
	(28,'field',77,'en',' default 0 medium '),
	(28,'slug',0,'en',''),
	(29,'field',78,'en',' default '),
	(29,'field',79,'en',' 0 '),
	(29,'field',80,'en',' medium '),
	(29,'slug',0,'en',''),
	(30,'field',94,'en',' headline '),
	(30,'field',42,'en',' 0 h2 default '),
	(30,'slug',0,'en',''),
	(31,'field',106,'en',' 0 '),
	(31,'field',44,'en',' h2 '),
	(31,'field',45,'en',' default '),
	(31,'slug',0,'en',''),
	(32,'field',99,'en',' lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue '),
	(32,'slug',0,'en',''),
	(33,'field',99,'en',' lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue '),
	(33,'slug',0,'en',''),
	(34,'slug',0,'en',''),
	(35,'field',98,'en',' lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus '),
	(35,'field',100,'en',' max mustermann '),
	(35,'field',101,'en',''),
	(35,'slug',0,'en',''),
	(36,'field',98,'en',' lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum '),
	(36,'field',100,'en',' max mustermann '),
	(36,'field',101,'en',''),
	(36,'slug',0,'en',''),
	(37,'field',94,'en',' button modules '),
	(37,'field',102,'en',' this is a subline for button modules '),
	(37,'field',87,'en',''),
	(37,'field',77,'en',' default 0 medium '),
	(37,'slug',0,'en',''),
	(38,'field',78,'en',' default '),
	(38,'field',79,'en',' 0 '),
	(38,'field',80,'en',' medium '),
	(38,'slug',0,'en',''),
	(39,'field',88,'en',' custom http google com click here google '),
	(39,'field',24,'en',' center iconsample primary 0 '),
	(39,'slug',0,'en',''),
	(40,'field',25,'en',' primary '),
	(40,'field',26,'en',' center '),
	(40,'field',27,'en',' 0 '),
	(40,'field',30,'en',' iconsample '),
	(40,'slug',0,'en',''),
	(41,'field',89,'en',' custom http google com google custom http google com google custom http google com google '),
	(41,'field',31,'en',' center primary '),
	(41,'slug',0,'en',''),
	(42,'field',90,'en',' custom http google com google '),
	(42,'slug',0,'en',''),
	(43,'field',90,'en',' custom http google com google '),
	(43,'slug',0,'en',''),
	(44,'field',90,'en',' custom http google com google '),
	(44,'slug',0,'en',''),
	(45,'field',32,'en',' primary '),
	(45,'field',33,'en',' center '),
	(45,'slug',0,'en',''),
	(46,'field',94,'en',' more modules '),
	(46,'field',102,'en',' this is a subline for more modules '),
	(46,'field',87,'en',''),
	(46,'field',77,'en',' default 0 medium '),
	(46,'slug',0,'en',''),
	(47,'field',78,'en',' default '),
	(47,'field',79,'en',' 0 '),
	(47,'field',80,'en',' medium '),
	(47,'slug',0,'en',''),
	(48,'field',92,'en',' term 1 lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue term 1 lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue term 2 lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue term 2 lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue term 3 lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue term 3 lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue '),
	(48,'field',34,'en',' 50 50 table '),
	(48,'slug',0,'en',''),
	(49,'field',35,'en',' 50 50 '),
	(49,'field',36,'en',' table '),
	(49,'slug',0,'en',''),
	(50,'field',93,'en',''),
	(50,'field',37,'en',' left full 1 '),
	(50,'slug',0,'en',''),
	(51,'field',38,'en',' 1 '),
	(51,'field',39,'en',' left '),
	(51,'field',40,'en',' full '),
	(51,'slug',0,'en',''),
	(52,'field',81,'en',' 0 small default '),
	(52,'slug',0,'en',''),
	(53,'field',82,'en',' 0 '),
	(53,'field',83,'en',' default '),
	(53,'field',84,'en',' small '),
	(53,'slug',0,'en',''),
	(54,'field',94,'en',' content wrapper modules '),
	(54,'field',102,'en',' this is a subline for content wrapper modules '),
	(54,'field',87,'en',''),
	(54,'field',77,'en',' default 0 medium '),
	(54,'slug',0,'en',''),
	(55,'field',78,'en',' default '),
	(55,'field',79,'en',' 0 '),
	(55,'field',80,'en',' medium '),
	(55,'slug',0,'en',''),
	(56,'slug',0,'en',''),
	(57,'field',97,'en',' this is a headline '),
	(57,'slug',0,'en',''),
	(58,'field',99,'en',' lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue '),
	(58,'slug',0,'en',''),
	(59,'field',97,'en',' this is a headline '),
	(59,'slug',0,'en',''),
	(60,'field',99,'en',' lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue '),
	(60,'slug',0,'en',''),
	(61,'field',85,'en',' 50 50 '),
	(61,'slug',0,'en',''),
	(62,'field',86,'en',' 50 50 '),
	(62,'slug',0,'en',''),
	(63,'slug',0,'en',''),
	(64,'field',99,'en',' lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue '),
	(64,'slug',0,'en',''),
	(65,'slug',0,'en',''),
	(66,'field',99,'en',' lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue '),
	(66,'slug',0,'en','');

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
	(4,NULL,'News','news','channel',1,'news/_entry',0,'2017-02-21 21:30:09','2017-02-21 21:30:09','71e89540-9e60-47d2-8dac-1b27c3bbc0a0'),
	(5,NULL,'Modules','modules','single',1,'modules',0,'2017-03-19 14:43:02','2017-03-19 14:43:02','075491c9-118f-4009-9e1c-208a85c8b642');

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
	(4,4,'en',1,'news/{postDate.year}/{slug}',NULL,'2017-02-21 21:30:09','2017-02-21 21:30:09','5f6ea072-d332-47b4-91b9-f433fd5685ab'),
	(5,5,'en',1,'modules',NULL,'2017-03-19 14:43:02','2017-03-19 14:43:02','5558d61b-02c9-4db0-bb3f-32f75d957fa9');

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
	(1,1,'ce7c0c88653f037475a16d5b4dcf71755bd12157czozMjoibWJZd2R4UHhVZTNzRDlwc2tXZUJpVnNMemZjR2F6NUsiOw==','2017-02-21 21:25:05','2017-02-21 21:25:05','da955d5e-fe4a-43b2-97ae-4442b6b14290'),
	(3,1,'9ccc69cb0a84754d95041439f36c089d63f41180czozMjoidUNuM2ZRU1d6TDI5TnJOeURpZmxiU19sSVZqOXZkVTYiOw==','2017-03-13 09:45:55','2017-03-13 09:45:55','d11b059a-dbd4-4409-bb30-37f3fbd946ba'),
	(4,1,'4874424fef588cfaad46b483489e45fc16260b43czozMjoidnlyMG5lbWNtR2Z1dWM1d1plcVI0UU5pbGNDNk9HbFAiOw==','2017-03-19 14:30:52','2017-03-19 14:30:52','7fd5f13a-c591-475f-bda1-a47d7898933d');

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

LOCK TABLES `craft_structureelements` WRITE;
/*!40000 ALTER TABLE `craft_structureelements` DISABLE KEYS */;

INSERT INTO `craft_structureelements` (`id`, `structureId`, `elementId`, `root`, `lft`, `rgt`, `level`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(12,6,NULL,12,1,6,0,'2017-02-27 17:29:58','2017-02-27 17:29:58','61caadc6-9bd4-4b92-b1f2-fdbd30d6c8e5'),
	(13,6,9,12,2,3,1,'2017-02-27 17:29:58','2017-02-27 17:29:58','f013f4e3-72a0-40e2-afd7-972b069ea445'),
	(14,6,15,12,4,5,1,'2017-02-27 17:29:59','2017-02-27 17:29:59','58f01556-1a2e-4a36-84b2-5ed17d0e2eb2'),
	(53,10,NULL,53,1,52,0,'2017-03-19 15:27:05','2017-03-19 15:27:05','15e235e7-7661-4113-8b8c-16032299761d'),
	(54,10,28,53,2,3,1,'2017-03-19 15:27:05','2017-03-19 15:27:05','e12cbedd-a9fc-4d67-9996-0b14d54524b3'),
	(55,10,30,53,4,5,1,'2017-03-19 15:27:05','2017-03-19 15:27:05','6546ddc7-0967-4858-a3d5-9514ff15a70e'),
	(56,10,32,53,6,7,1,'2017-03-19 15:27:05','2017-03-19 15:27:05','aafc9bff-b4db-472e-9d22-93f48fa6cf12'),
	(57,10,33,53,8,13,1,'2017-03-19 15:27:05','2017-03-19 15:27:05','f7288b4f-95ad-4ca5-ae33-41f0d1e458ad'),
	(58,10,34,53,9,12,2,'2017-03-19 15:27:05','2017-03-19 15:27:05','fb87ce80-1d6b-4729-aabc-c96b494a4848'),
	(59,10,35,53,10,11,3,'2017-03-19 15:27:05','2017-03-19 15:27:05','4b75f9f1-6b58-4494-b9a1-f8b10528dc50'),
	(60,10,36,53,14,15,1,'2017-03-19 15:27:06','2017-03-19 15:27:06','7c012521-cb2a-4283-a8b0-4e65e6b12bf4'),
	(61,10,37,53,16,17,1,'2017-03-19 15:27:06','2017-03-19 15:27:06','cc592ccd-1f22-4760-bcd1-c39f51a12f9b'),
	(62,10,39,53,18,19,1,'2017-03-19 15:27:06','2017-03-19 15:27:06','2717601a-26ee-48b9-bab2-dd3355fca27d'),
	(63,10,41,53,20,21,1,'2017-03-19 15:27:06','2017-03-19 15:27:06','620c92a7-8bd2-4a6a-9cde-18796dded3ae'),
	(64,10,46,53,22,23,1,'2017-03-19 15:27:06','2017-03-19 15:27:06','3a3db576-165a-4285-a322-037808b694ba'),
	(65,10,48,53,24,25,1,'2017-03-19 15:27:06','2017-03-19 15:27:06','0b665e01-bac9-46e1-a30a-3855d5b4f95b'),
	(66,10,50,53,26,27,1,'2017-03-19 15:27:06','2017-03-19 15:27:06','2df2fb45-1680-41fe-925e-8ce5bbfc29d6'),
	(67,10,52,53,28,29,1,'2017-03-19 15:27:06','2017-03-19 15:27:06','fa1c91c7-9d57-4df8-a591-877657c5666e'),
	(68,10,54,53,30,31,1,'2017-03-19 15:27:06','2017-03-19 15:27:06','78f768e6-a24b-4195-bfd2-5bbaff8270e5'),
	(69,10,56,53,32,41,1,'2017-03-19 15:27:06','2017-03-19 15:27:06','8a8ca4c9-19cd-4888-bf1b-8d858bb9ff90'),
	(70,10,57,53,33,36,2,'2017-03-19 15:27:06','2017-03-19 15:27:06','330f56d8-9454-46d4-8ce3-bcaca6c10134'),
	(71,10,58,53,34,35,3,'2017-03-19 15:27:06','2017-03-19 15:27:06','63e2c4a0-2f55-4cc3-92e9-b36ddd1d6693'),
	(72,10,59,53,37,40,2,'2017-03-19 15:27:06','2017-03-19 15:27:06','67c6acb1-f6b6-4126-a4a6-0bce5d71a7d7'),
	(73,10,60,53,38,39,3,'2017-03-19 15:27:06','2017-03-19 15:27:06','93db3b40-3946-4fae-941e-54577b2238de'),
	(74,10,61,53,42,51,1,'2017-03-19 15:27:06','2017-03-19 15:27:06','ce66e497-9dfe-4c85-8525-56db3ef8192b'),
	(75,10,63,53,43,46,2,'2017-03-19 15:27:06','2017-03-19 15:27:06','63f1acda-ec88-4c47-b838-f6e8204483b2'),
	(76,10,64,53,44,45,3,'2017-03-19 15:27:06','2017-03-19 15:27:06','60480cec-6064-48b9-b424-950691c717c9'),
	(77,10,65,53,47,50,2,'2017-03-19 15:27:06','2017-03-19 15:27:06','fb4ef13f-c3a2-4eee-9e4b-e1bdc38e1cce'),
	(78,10,66,53,48,49,3,'2017-03-19 15:27:06','2017-03-19 15:27:06','0a26a140-20d6-4f3b-9793-c0e1ecb9e0a7');

/*!40000 ALTER TABLE `craft_structureelements` ENABLE KEYS */;
UNLOCK TABLES;


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
	(2,1,'2017-02-23 11:59:41','2017-02-23 12:00:56','76b5d042-3279-4750-add7-79f64df16d72'),
	(6,NULL,'2017-02-27 17:29:58','2017-02-27 17:29:58','ffb30458-981d-4397-bf49-578d08439d60'),
	(10,NULL,'2017-03-19 15:27:05','2017-03-19 15:27:05','e6105eb1-8895-4aba-b801-8ca3634853e1');

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

LOCK TABLES `craft_supertableblocks` WRITE;
/*!40000 ALTER TABLE `craft_supertableblocks` DISABLE KEYS */;

INSERT INTO `craft_supertableblocks` (`id`, `ownerId`, `fieldId`, `typeId`, `sortOrder`, `ownerLocale`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(10,9,77,13,1,NULL,'2017-02-27 14:01:46','2017-02-27 17:29:58','6dd5ca59-001c-46ed-befe-cb27e994ceb2'),
	(16,15,58,11,1,NULL,'2017-02-27 17:28:08','2017-02-27 17:29:59','16b4ec06-4a37-47ac-94ce-237fc8f4e227'),
	(29,28,77,13,1,NULL,'2017-03-19 14:47:38','2017-03-19 15:27:05','2bc17db6-d266-4d02-81c6-bdbc2abbc552'),
	(31,30,42,7,1,NULL,'2017-03-19 14:47:38','2017-03-19 15:27:05','573e064c-96ba-4c07-81e9-67a41826380c'),
	(38,37,77,13,1,NULL,'2017-03-19 14:51:02','2017-03-19 15:27:06','d7b045f4-5605-4d95-9c2c-5312b0206e3e'),
	(40,39,24,3,1,NULL,'2017-03-19 14:51:02','2017-03-19 15:27:06','4a88f8bc-0393-4254-bdd4-c220cd2650bf'),
	(42,41,89,16,1,NULL,'2017-03-19 14:51:02','2017-03-19 15:27:06','d9ed55b2-812a-4adb-92ec-fe86d795cced'),
	(43,41,89,16,2,NULL,'2017-03-19 14:51:02','2017-03-19 15:27:06','8570ff8c-0fe2-489d-9895-03f620216391'),
	(44,41,89,16,3,NULL,'2017-03-19 14:51:02','2017-03-19 15:27:06','28b8e64d-0e2a-4f88-b5f6-7d6ee5a1884e'),
	(45,41,31,4,1,NULL,'2017-03-19 14:51:02','2017-03-19 15:27:06','14c5e59f-406a-4064-bf76-35a75be4d73f'),
	(47,46,77,13,1,NULL,'2017-03-19 14:51:02','2017-03-19 15:27:06','966ef416-a193-42f5-abab-c6bed9417fd3'),
	(49,48,34,5,1,NULL,'2017-03-19 14:51:02','2017-03-19 15:27:06','9fa27e7c-c7b3-4118-8933-a8efb383cf5a'),
	(51,50,37,6,1,NULL,'2017-03-19 14:51:02','2017-03-19 15:27:06','64b88628-7d51-4546-949a-1488d64ac446'),
	(53,52,81,14,1,NULL,'2017-03-19 14:51:02','2017-03-19 15:27:06','68682866-a3ad-4844-9bba-d6d429cc4d65'),
	(55,54,77,13,1,NULL,'2017-03-19 15:27:06','2017-03-19 15:27:06','e491ace7-f53b-467d-b903-3e929569c226'),
	(62,61,85,15,1,NULL,'2017-03-19 15:27:06','2017-03-19 15:27:06','8aef2764-72fa-4015-8c25-c454178e1a32');

/*!40000 ALTER TABLE `craft_supertableblocks` ENABLE KEYS */;
UNLOCK TABLES;


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
	(3,24,82,'2017-02-21 21:30:11','2017-03-13 10:15:52','34980645-68f9-4e62-a52b-a5db68e2636a'),
	(4,31,124,'2017-02-21 21:30:11','2017-03-13 10:40:13','93ca8254-0261-4078-af91-4d5e209a0f91'),
	(5,34,125,'2017-02-21 21:30:11','2017-03-13 10:42:48','c6e769d6-d74d-43b0-983c-ce833e892aa1'),
	(6,37,126,'2017-02-21 21:30:11','2017-03-13 10:45:34','0a5745ee-5602-4edd-b296-3b86d3beea84'),
	(7,42,128,'2017-02-21 21:30:11','2017-03-13 10:46:41','53de6099-2db8-4825-9c96-e556361a58db'),
	(8,46,129,'2017-02-21 21:30:12','2017-03-13 10:49:27','3a317cd8-1e6f-45b4-b0fa-d27eea3df8b8'),
	(9,50,130,'2017-02-21 21:30:12','2017-03-13 10:50:32','b4192fba-422d-4893-a4d3-cd2b7fd2f49b'),
	(10,54,131,'2017-02-21 21:30:12','2017-03-13 10:51:34','602475bf-6746-4db6-b079-58859d80a45e'),
	(11,58,132,'2017-02-21 21:30:12','2017-03-13 10:52:37','5377894c-3f7f-4498-8903-a0c4c7804ae8'),
	(12,63,123,'2017-02-21 21:30:13','2017-03-13 10:22:58','78c1aee8-021d-4892-84b3-ca8801a71a34'),
	(13,77,157,'2017-02-21 21:30:13','2017-03-19 14:38:15','506f284d-c4bb-4fdf-a753-07fc5b133e91'),
	(14,81,135,'2017-02-21 21:30:13','2017-03-13 11:36:31','aa3a6735-ff9e-4cbf-9a82-1954a4f0f07f'),
	(15,85,136,'2017-02-21 21:30:14','2017-03-13 11:38:26','f0784d25-1f26-41ab-99da-172acba73735'),
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

LOCK TABLES `craft_supertablecontent_settingsbutton` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_settingsbutton` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_settingsbutton` (`id`, `elementId`, `locale`, `field_style`, `field_alignment`, `field_withIcon`, `field_icon`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,40,'en','primary','center',0,'iconSample','2017-03-19 14:51:02','2017-03-19 15:27:06','43864f2d-7ae9-496b-aa94-623c74bda1d3');

/*!40000 ALTER TABLE `craft_supertablecontent_settingsbutton` ENABLE KEYS */;
UNLOCK TABLES;


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

LOCK TABLES `craft_supertablecontent_settingsbuttongroup` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_settingsbuttongroup` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_settingsbuttongroup` (`id`, `elementId`, `locale`, `field_style`, `field_alignment`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,45,'en','primary','center','2017-03-19 14:51:02','2017-03-19 15:27:06','755bfaf5-a903-4af8-b1d3-cb9fa576220f');

/*!40000 ALTER TABLE `craft_supertablecontent_settingsbuttongroup` ENABLE KEYS */;
UNLOCK TABLES;


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

LOCK TABLES `craft_supertablecontent_settingsdefinitionlist` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_settingsdefinitionlist` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_settingsdefinitionlist` (`id`, `elementId`, `locale`, `field_columnsRatio`, `field_layout`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,49,'en','50-50','table','2017-03-19 14:51:02','2017-03-19 15:27:06','8208674e-d4a5-44b6-9bca-a68173be8509');

/*!40000 ALTER TABLE `craft_supertablecontent_settingsdefinitionlist` ENABLE KEYS */;
UNLOCK TABLES;


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

LOCK TABLES `craft_supertablecontent_settingsembed` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_settingsembed` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_settingsembed` (`id`, `elementId`, `locale`, `field_video`, `field_embedPosition`, `field_embedWidth`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,12,'en',1,'default','default','2017-02-27 14:01:46','2017-02-27 17:29:39','fde765fe-a9b2-4136-af7b-8e8aa5b3d733'),
	(2,51,'en',1,'left','full','2017-03-19 14:51:02','2017-03-19 15:27:06','42711218-5b48-4d06-9d82-1c060bdcf250');

/*!40000 ALTER TABLE `craft_supertablecontent_settingsembed` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_settingsheadline
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingsheadline`;

CREATE TABLE `craft_supertablecontent_settingsheadline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_semanticSize` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'h2',
  `field_visualSize` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_indented` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_settingsheadline_elementId_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingsheadline_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingsheadline_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingsheadline_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_settingsheadline` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_settingsheadline` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_settingsheadline` (`id`, `elementId`, `locale`, `field_semanticSize`, `field_visualSize`, `field_indented`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,31,'en','h2','default',0,'2017-03-19 14:47:38','2017-03-19 15:27:05','865a269b-2fea-485e-8482-4ca9bbcee095');

/*!40000 ALTER TABLE `craft_supertablecontent_settingsheadline` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_settingshorizontalruler
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingshorizontalruler`;

CREATE TABLE `craft_supertablecontent_settingshorizontalruler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_fullWidth` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_marginVertical` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craf_supertableconte_settingshorizontalru_elementI_local_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingshorizontalruler_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingshorizontalruler_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingshorizontalruler_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_settingshorizontalruler` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_settingshorizontalruler` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_settingshorizontalruler` (`id`, `elementId`, `locale`, `field_style`, `field_fullWidth`, `field_marginVertical`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,563,'en','default',0,'large','2017-02-19 23:39:43','2017-02-20 20:43:37','6bb35579-b793-4246-827b-7e5c5c2100b9');

/*!40000 ALTER TABLE `craft_supertablecontent_settingshorizontalruler` ENABLE KEYS */;
UNLOCK TABLES;


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

LOCK TABLES `craft_supertablecontent_settingsimagesingle` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_settingsimagesingle` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_settingsimagesingle` (`id`, `elementId`, `locale`, `field_caption`, `field_imagePosition`, `field_imageRatio`, `field_imageWidth`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,16,'en',0,'default','default','default','2017-02-27 17:28:08','2017-02-27 17:29:59','a24016aa-cffd-4a29-8c43-1e4fd6a6c7aa');

/*!40000 ALTER TABLE `craft_supertablecontent_settingsimagesingle` ENABLE KEYS */;
UNLOCK TABLES;


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

LOCK TABLES `craft_supertablecontent_settingssection` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_settingssection` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_settingssection` (`id`, `elementId`, `locale`, `field_backgroundColor`, `field_fullWidth`, `field_paddingVertical`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,10,'en','default',0,'default','2017-02-27 14:01:46','2017-02-27 17:29:58','4c4151a7-23fe-4b75-8971-ca84e987b8f0'),
	(2,29,'en','default',0,'medium','2017-03-19 14:47:38','2017-03-19 15:27:05','5926f5e0-bc60-4946-bd4b-a197b5b54959'),
	(3,38,'en','default',0,'medium','2017-03-19 14:51:02','2017-03-19 15:27:06','7d5e53ea-8aa6-4b7b-ad0f-05056a22ff73'),
	(4,47,'en','default',0,'medium','2017-03-19 14:51:02','2017-03-19 15:27:06','a28fbb2a-7496-4abe-959a-17c0a22a4768'),
	(5,55,'en','default',0,'medium','2017-03-19 15:27:06','2017-03-19 15:27:06','66017d00-1a23-4b0c-b592-e37a946e9f2b');

/*!40000 ALTER TABLE `craft_supertablecontent_settingssection` ENABLE KEYS */;
UNLOCK TABLES;


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

LOCK TABLES `craft_supertablecontent_settingsseparator` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_settingsseparator` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_settingsseparator` (`id`, `elementId`, `locale`, `field_fullWidth`, `field_style`, `field_marginVertical`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,53,'en',0,'default','small','2017-03-19 14:51:02','2017-03-19 15:27:06','f8aceb62-6b9d-4707-b17e-cb15e5047f66');

/*!40000 ALTER TABLE `craft_supertablecontent_settingsseparator` ENABLE KEYS */;
UNLOCK TABLES;


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

LOCK TABLES `craft_supertablecontent_settingstwocolumns` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_settingstwocolumns` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_settingstwocolumns` (`id`, `elementId`, `locale`, `field_columnsRatio`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,62,'en','50-50','2017-03-19 15:27:06','2017-03-19 15:27:06','5d381492-4b63-4367-8c79-18f32a7b2d33');

/*!40000 ALTER TABLE `craft_supertablecontent_settingstwocolumns` ENABLE KEYS */;
UNLOCK TABLES;


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

LOCK TABLES `craft_supertablecontent_singlebuttongroup` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_singlebuttongroup` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_singlebuttongroup` (`id`, `elementId`, `locale`, `field_button`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,42,'en','{\"type\":\"custom\",\"email\":\"\",\"tel\":\"\",\"custom\":\"http:\\/\\/google.com\",\"entry\":\"\",\"asset\":\"\",\"category\":\"\",\"customText\":\"Google\",\"target\":\"\"}','2017-03-19 14:51:02','2017-03-19 15:27:06','e5931f5c-86a5-409b-9a69-8ef42bb54be8'),
	(2,43,'en','{\"type\":\"custom\",\"email\":\"\",\"tel\":\"\",\"custom\":\"http:\\/\\/google.com\",\"entry\":\"\",\"asset\":\"\",\"category\":\"\",\"customText\":\"Google\",\"target\":\"\"}','2017-03-19 14:51:02','2017-03-19 15:27:06','681bebf2-749b-4d81-95ef-0452e3ee5fae'),
	(3,44,'en','{\"type\":\"custom\",\"email\":\"\",\"tel\":\"\",\"custom\":\"http:\\/\\/google.com\",\"entry\":\"\",\"asset\":\"\",\"category\":\"\",\"customText\":\"Google\",\"target\":\"\"}','2017-03-19 14:51:02','2017-03-19 15:27:06','53832863-ed3a-4131-92c9-57ccad5a8c3c');

/*!40000 ALTER TABLE `craft_supertablecontent_singlebuttongroup` ENABLE KEYS */;
UNLOCK TABLES;


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
	(1,'davidhellmann',NULL,'David','Hellmann','david@fredmansky.at','$2y$13$XdeudxRcgdiqby0iPzCIkuwd.RoJB/GdieXO/kHdgMuyfwxEqI4WG',NULL,1,1,0,0,0,0,0,'2017-03-19 14:30:52','::1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2017-02-21 21:25:03','2017-02-21 21:25:03','2017-03-19 14:30:52','a3222b4f-e824-4ab5-a27f-6a450b2c9525'),
	(7,'superuser',NULL,'Super','User','super@user.com','superuser',NULL,1,1,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'$2y$13$Hl6SFY4Q6/FcCp.BKQVrxuPrkVUGcU3vtqsU32.7guyjkOtR/ejMG','2017-02-21 21:30:19',NULL,0,NULL,'2017-02-21 21:30:17','2017-03-13 09:53:58','0f38a6ac-82c0-4268-936d-00ce423d2efa');

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
