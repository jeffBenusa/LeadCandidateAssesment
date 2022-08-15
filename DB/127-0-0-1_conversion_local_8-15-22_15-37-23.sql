# ************************************************************
# Sequel Ace SQL dump
# Version 20033
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: 127.0.0.1 (MySQL 5.7.34)
# Database: conversion_local
# Generation Time: 2022-08-15 20:37:23 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table announcements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `announcements`;

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rtlrdaonqlxqeawlcjhehjdwsbumhmxtyqpq` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_mouajtdnradxfmlmlfgxtujjnnykmrkdmbwa` (`dateRead`),
  KEY `fk_qzezukiikheepfisvvsebrfrqxdpeqzeqzwh` (`pluginId`),
  CONSTRAINT `fk_dmdymraushlzklpzlzzdmibgjcvubqwxhsfb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qzezukiikheepfisvvsebrfrqxdpeqzeqzwh` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table assetindexdata
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assetindexdata`;

CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text COLLATE utf8_unicode_ci,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ttjcnhlipyhdabbpiisaznxvygjrmsykouch` (`sessionId`,`volumeId`),
  KEY `idx_gjsjxqikmobaxajyotzngglqmojatcoijorn` (`volumeId`),
  CONSTRAINT `fk_ihurnewrhwfncgtbrbgwmnfivggrtqmclkio` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table assets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assets`;

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_morxeskiuhhetkhjxlbkzwccubfsyfqucthz` (`filename`,`folderId`),
  KEY `idx_jsbaqgbchmhvwfarzfidhoycjupywtplpjcb` (`folderId`),
  KEY `idx_qwpfdlayetptozpizcwwevwuegkodwundofz` (`volumeId`),
  KEY `fk_eqkepqminrsscltpafdwypkcaszxpchdcxhl` (`uploaderId`),
  CONSTRAINT `fk_cdebdiwubdwqxvkdgikdtjgjeixtikjersjb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_eqkepqminrsscltpafdwypkcaszxpchdcxhl` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_hxdwvleytlntybuhownefbpowcucaxrlirwv` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vpsqphizovqiynxclnpgxccijxahtwaejpid` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;

INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(11,1,1,1,'truck2.jpg','image',5021,3085,2886991,NULL,0,0,'2022-08-14 00:11:45','2022-08-14 00:11:45','2022-08-14 00:11:45','0330b7a7-a643-4c1d-acbc-2f2529d8bc03'),
	(12,1,1,1,'truck1.jpg','image',4032,3016,2019241,NULL,0,0,'2022-08-14 00:11:49','2022-08-14 00:11:49','2022-08-14 00:11:49','c8f556c2-f3dd-4f1b-b0f9-cb932f0c69fb'),
	(16,1,1,1,'truck2.jpg','image',5021,3085,2886991,NULL,NULL,NULL,'2022-08-14 00:41:39','2022-08-14 00:41:40','2022-08-14 00:41:40','53550af4-99db-46a9-9c5f-45d18de95772'),
	(17,1,1,1,'truck1.jpg','image',4032,3016,2019241,NULL,NULL,NULL,'2022-08-14 00:41:43','2022-08-14 00:41:44','2022-08-14 00:41:44','305f3cc3-8b90-44bc-b863-9f96e410ee8c');

/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table assettransformindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assettransformindex`;

CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hfehntllgqfxltnwklzlnvkmxawxdiacjcdf` (`volumeId`,`assetId`,`location`),
  KEY `idx_tohpammcxxmlhocawinqedktylevghlazrny` (`assetId`,`format`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table assettransforms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assettransforms`;

CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vluhznhsdhszbkyieiwgowutayjjpeidxfyb` (`name`),
  KEY `idx_nxwemdrymqvqaokbzbtljoqdfkhgqericmnh` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jiylqopqmqdmebhlladwhfrvfyjwszicbfxu` (`groupId`),
  KEY `fk_yuxictwzxazbgbgfbitlfhlxydaffoexqkjl` (`parentId`),
  CONSTRAINT `fk_dsvjhepkcqukfuqqdtcwximvcrumyrscgcgf` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jisirelzvjwjoeylbkmoowurofftigomgmoa` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yuxictwzxazbgbgfbitlfhlxydaffoexqkjl` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table categorygroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categorygroups`;

CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tgnbcwrskqwxlxmmrjfprjlalrzlhjikxdzv` (`name`),
  KEY `idx_quwzdcrjfrulazctoaeamiqchufxlnvxvjkk` (`handle`),
  KEY `idx_gkplyivwwavowtwhfpmhyavmgvjmnxmasppv` (`structureId`),
  KEY `idx_hrkburkjudtgkyiclhvtsjssxsheajycwqhb` (`fieldLayoutId`),
  KEY `idx_jkdklsruuxxvbnowrbquolaeiagqqyjmoxpn` (`dateDeleted`),
  CONSTRAINT `fk_ojinaslfyyrnqwipcfcnrnntrqjtkirrfutp` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tnilugsdmzijdruftzzfqmidznfxdbgmkyoj` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table categorygroups_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categorygroups_sites`;

CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hltesflqjygtroncdibqjpoqmiotzsuymgdt` (`groupId`,`siteId`),
  KEY `idx_fjqeidsrytbtnycrbdzlkmdwsudkrmvuorhj` (`siteId`),
  CONSTRAINT `fk_kbmdjxjvgqwqqsqkplnaghitzmfccbkrkdmm` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vvstmohyctbkisnqkfktmgxuhwzqnstihiva` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table changedattributes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `changedattributes`;

CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_xdpqsaefwwhltpwzodneglguhiwmfvqjkvom` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_suhdfrxqoxvpzhuedgzqmnrtcmhsrkhzfshj` (`siteId`),
  KEY `fk_hbklrtrdnihbemfktiditjbsztytcvmjuaav` (`userId`),
  CONSTRAINT `fk_hbklrtrdnihbemfktiditjbsztytcvmjuaav` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_mratsuqltpanjqqhcejyxoptnkqvcrwbyybc` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_suhdfrxqoxvpzhuedgzqmnrtcmhsrkhzfshj` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;

INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`)
VALUES
	(1,1,'invalidLoginCount','2022-08-12 20:21:49',0,NULL),
	(1,1,'invalidLoginWindowStart','2022-08-12 20:21:49',0,NULL),
	(1,1,'lastPasswordChangeDate','2022-08-12 20:21:49',0,NULL),
	(1,1,'password','2022-08-12 20:21:49',0,NULL),
	(1,1,'verificationCode','2022-08-12 20:21:49',0,NULL),
	(1,1,'verificationCodeIssuedDate','2022-08-12 20:21:49',0,NULL);

/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table changedfields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `changedfields`;

CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_fztkbduxjlkxcuuvvtnejleefcipouvuzeyd` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_xizxwdprujrgkvckotbsbbhwtowcsfqdhvua` (`siteId`),
  KEY `fk_yufarpwlifqqrvbqpndsoetsscodaaerghao` (`fieldId`),
  KEY `fk_auehbktdzvbwjldgpbucxomnamnnkexindgu` (`userId`),
  CONSTRAINT `fk_auehbktdzvbwjldgpbucxomnamnnkexindgu` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_vdqpxljeaalsjdcilbihhppmbhdstebhpkvt` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_xizxwdprujrgkvckotbsbbhwtowcsfqdhvua` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yufarpwlifqqrvbqpndsoetsscodaaerghao` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;

INSERT INTO `changedfields` (`elementId`, `siteId`, `fieldId`, `dateUpdated`, `propagated`, `userId`)
VALUES
	(6,1,1,'2022-08-14 00:44:04',0,1);

/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `content`;

CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_text_ujcehzsb` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_swsqnhtxftqsxrpdfstckfpplgklzkuuqsee` (`elementId`,`siteId`),
  KEY `idx_yfrqykcwpfpkspzzglksjnnasjdolgkbvugx` (`siteId`),
  KEY `idx_rsagmzptxikyxrmwwquljgwiyimcpeendnny` (`title`),
  CONSTRAINT `fk_nrcyqucfkyqwgjoggfscghhydtclupfzguze` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qsbctkwuzngmuybeqlulhcfdqorvglkaaant` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;

INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_text_ujcehzsb`)
VALUES
	(1,1,1,NULL,'2022-08-11 16:15:38','2022-08-12 20:21:48','053587ac-cd10-45d8-8e4a-6025dd5d2d51',NULL),
	(2,2,1,'2022-08-12 07:22:17','2022-08-12 14:22:18','2022-08-12 14:22:18','ac40bd25-de60-4ffe-9624-cece5dc57c2e',NULL),
	(3,3,1,'2022-08-12 07:22:18','2022-08-12 14:22:19','2022-08-12 14:22:19','1313fca0-bae8-47fd-9413-37cf5e2b30b6',NULL),
	(4,4,1,'2022-08-12 07:24:55','2022-08-12 14:24:55','2022-08-12 14:24:55','6b482c01-f4f5-41a3-b020-1a3518f26bca',NULL),
	(5,5,1,'2022-08-12 07:24:55','2022-08-12 14:24:55','2022-08-12 14:24:55','0da8172f-6e9b-409f-8be8-a12f11963b16',NULL),
	(6,6,1,'Homepage','2022-08-12 21:29:14','2022-08-14 00:44:04','a381029b-f7b7-4a31-9d76-70e802541d6e',NULL),
	(7,7,1,'Homepage','2022-08-12 21:29:14','2022-08-12 21:29:14','bd05b510-4246-48e2-a0be-bb107c3d275a',NULL),
	(8,8,1,'Homepage','2022-08-14 00:04:43','2022-08-14 00:04:43','661ea305-f510-4397-abc9-ca45a3d36162',NULL),
	(11,11,1,'Truck2','2022-08-14 00:11:41','2022-08-14 00:37:48','b51df936-3791-4f35-929a-b164ecf6f253','Semi in desert'),
	(12,12,1,'Truck1','2022-08-14 00:11:45','2022-08-14 00:37:55','ed8d0c6b-66af-4df3-8c67-3f124d0b2451','Truck in snow'),
	(14,14,1,'Homepage','2022-08-14 00:12:07','2022-08-14 00:12:07','27e2bd4d-c528-4f15-bb87-f3e92ca5ab2b',NULL),
	(15,15,1,'Homepage','2022-08-14 00:16:54','2022-08-14 00:16:54','503b3f5c-37a7-4771-84d9-2fd65d73d005',NULL),
	(16,16,1,'Truck2','2022-08-14 00:41:35','2022-08-14 00:41:35','1d8a4dd6-4dd9-421c-8404-ba2070716b0b',NULL),
	(17,17,1,'Truck1','2022-08-14 00:41:40','2022-08-14 00:41:40','ec4ec933-3eaa-47ef-93cd-81d15d97d7b1',NULL),
	(19,19,1,'Homepage','2022-08-14 00:44:04','2022-08-14 00:44:04','4185a44f-1cfa-4eb1-9f76-e7897d504cf6',NULL),
	(20,20,1,'2022-08-14 12:58:43','2022-08-14 19:58:43','2022-08-14 19:58:43','b1256ad3-738c-4c68-9afe-ff6aebda3923',NULL),
	(21,21,1,'2022-08-14 13:04:04','2022-08-14 20:04:04','2022-08-14 20:04:04','5defd39e-2fff-4cc2-b36b-7404bdf78d2d',NULL),
	(22,22,1,'2022-08-14 13:13:01','2022-08-14 20:13:01','2022-08-14 20:13:01','67b61fcf-eb25-4df3-a513-45f6d84db9b2',NULL),
	(23,23,1,'2022-08-14 13:14:22','2022-08-14 20:14:22','2022-08-14 20:14:22','f805107a-9dc4-4357-8d9c-4c5b04ea8c14',NULL),
	(24,24,1,'2022-08-14 13:21:34','2022-08-14 20:21:35','2022-08-14 20:21:35','bf845f3a-2ccc-4dc3-bc7f-a8fd0bcf0073',NULL),
	(25,25,1,'2022-08-14 13:31:17','2022-08-14 20:31:17','2022-08-14 20:31:17','b3d1dc25-9baf-4ffc-bf0a-a7fc3b7d26b0',NULL),
	(26,26,1,'2022-08-14 13:32:13','2022-08-14 20:32:13','2022-08-14 20:32:13','1099bc67-ad81-4f14-a85a-c66fb603a1e0',NULL),
	(27,27,1,'2022-08-14 13:34:08','2022-08-14 20:34:08','2022-08-14 20:34:08','5d668fe6-d841-4d21-9de2-cd681d77cb68',NULL),
	(28,28,1,'2022-08-14 13:37:19','2022-08-14 20:37:19','2022-08-14 20:37:19','b97e4ebf-aaba-494e-966d-a0d326ca853f',NULL),
	(29,29,1,'2022-08-14 13:38:00','2022-08-14 20:38:00','2022-08-14 20:38:00','6dc064f9-8074-4951-b767-78157981bd22',NULL),
	(30,30,1,'2022-08-14 13:39:15','2022-08-14 20:39:15','2022-08-14 20:39:15','0a143231-2330-456f-ae7f-ef7f5d4843fe',NULL),
	(31,31,1,'2022-08-14 13:39:50','2022-08-14 20:39:50','2022-08-14 20:39:50','18471fba-7903-47c9-b85d-364fc76d4f3b',NULL),
	(32,32,1,'2022-08-14 13:46:21','2022-08-14 20:46:21','2022-08-14 20:46:21','8208c3a0-5d9e-4e11-8a53-bed0cacb342b',NULL),
	(33,33,1,'2022-08-14 13:47:22','2022-08-14 20:47:22','2022-08-14 20:47:22','ff58b249-187c-4e55-95f9-1120e88d5598',NULL),
	(34,34,1,'2022-08-14 13:54:42','2022-08-14 20:54:42','2022-08-14 20:54:42','cdf42156-5e92-498f-ae99-a4ba1885502b',NULL),
	(35,35,1,'2022-08-14 13:54:56','2022-08-14 20:54:56','2022-08-14 20:54:56','f221b0ff-6825-442f-8995-c2022c9e44ac',NULL),
	(36,36,1,'2022-08-14 13:58:31','2022-08-14 20:58:31','2022-08-14 20:58:31','4bb5db0a-1f48-429f-b21f-1c00f5a43c27',NULL),
	(37,37,1,'2022-08-14 13:59:30','2022-08-14 20:59:30','2022-08-14 20:59:30','0dfa2725-0c12-400c-bffa-64546aa46352',NULL),
	(38,38,1,'2022-08-14 14:02:31','2022-08-14 21:02:31','2022-08-14 21:02:31','c0a1f123-44ff-4230-887d-cd15c3eefee2',NULL),
	(39,39,1,'2022-08-14 14:04:04','2022-08-14 21:04:04','2022-08-14 21:04:04','4b665b17-bb9b-4721-87de-3db3f08430d1',NULL),
	(40,40,1,'2022-08-14 14:05:15','2022-08-14 21:05:15','2022-08-14 21:05:15','8b6b11d9-3364-4fd1-be8e-816094fa0c41',NULL),
	(41,41,1,'2022-08-14 14:14:27','2022-08-14 21:14:27','2022-08-14 21:14:27','71dafeb0-ccba-47be-a0f0-c6eacd458ff9',NULL),
	(42,42,1,'2022-08-14 14:18:19','2022-08-14 21:18:19','2022-08-14 21:18:19','ca0d8bf4-3002-4d49-8317-17bad74f4d90',NULL),
	(43,43,1,'2022-08-14 14:31:08','2022-08-14 21:31:08','2022-08-14 21:31:08','606e1a56-21b4-4c0c-8e46-fd61591cbfcd',NULL),
	(44,44,1,'2022-08-14 14:32:08','2022-08-14 21:32:09','2022-08-14 21:32:09','0f22dab5-ebc6-49cc-ac1c-640590c8d2d3',NULL),
	(45,45,1,'2022-08-14 14:32:31','2022-08-14 21:32:31','2022-08-14 21:32:31','70d1f48d-446b-4ce4-b92f-d20a4c8a1192',NULL),
	(46,46,1,'2022-08-14 14:32:48','2022-08-14 21:32:48','2022-08-14 21:32:48','360791dc-42f8-4756-a0e7-d9ae35ea3680',NULL),
	(47,47,1,'2022-08-14 14:34:05','2022-08-14 21:34:05','2022-08-14 21:34:05','5f32a70e-6695-47f2-9c59-f248f084d86b',NULL),
	(48,48,1,'2022-08-14 14:34:32','2022-08-14 21:34:32','2022-08-14 21:34:32','101b4b5d-899d-43e5-aa25-7d2918db70ff',NULL),
	(49,49,1,'2022-08-14 14:36:26','2022-08-14 21:36:26','2022-08-14 21:36:26','c892676a-bbdd-4062-8cf0-64a0da8818be',NULL),
	(50,50,1,'2022-08-14 14:38:27','2022-08-14 21:38:27','2022-08-14 21:38:27','e7153580-164e-493a-9f87-16b29ba43402',NULL),
	(51,51,1,'2022-08-14 14:44:16','2022-08-14 21:44:16','2022-08-14 21:44:16','b5bde105-1746-4454-bdac-5747a95e2c65',NULL),
	(52,52,1,'2022-08-15 13:32:21','2022-08-15 20:32:21','2022-08-15 20:32:21','e0ad52b1-3e6e-4ad2-915d-91c60f9e45bf',NULL),
	(53,53,1,'2022-08-15 13:34:41','2022-08-15 20:34:41','2022-08-15 20:34:41','e98db065-a368-4c6a-989d-a07c5e985bf0',NULL);

/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craftidtokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craftidtokens`;

CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_qomxsgbmzjxgnfzgxztrcltrsrmwitknjvxu` (`userId`),
  CONSTRAINT `fk_qomxsgbmzjxgnfzgxztrcltrsrmwitknjvxu` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table deprecationerrors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `deprecationerrors`;

CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `traces` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zxitpudpazkpxrtbvvuavxaxuxbvnqyrpkzu` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table drafts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `drafts`;

CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_rajhjhtirechuecwijglpieiybobgtzwbpjp` (`creatorId`,`provisional`),
  KEY `idx_igzzedauofiaomrmowzqihjfoswkizgsfocl` (`saved`),
  KEY `fk_gfpjjjglmomgylrpeidabtmjvpltfvbhxhuk` (`sourceId`),
  CONSTRAINT `fk_gfpjjjglmomgylrpeidabtmjvpltfvbhxhuk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zdbdlqycnmhbphcaozvrjetdnqovrizrrnmm` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table elementindexsettings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `elementindexsettings`;

CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wiqadkzjsemdnnoavajhhwjnlinmjzpiuzvd` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `elementindexsettings` WRITE;
/*!40000 ALTER TABLE `elementindexsettings` DISABLE KEYS */;

INSERT INTO `elementindexsettings` (`id`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Solspace\\Freeform\\Elements\\Submission','{\"sources\":{\"*\":{\"tableAttributes\":{\"1\":\"field_1\",\"2\":\"field_2\",\"3\":\"field_3\",\"4\":\"id\",\"5\":\"status\",\"6\":\"dateCreated\",\"7\":\"form\"}}}}','2022-08-12 14:31:25','2022-08-12 14:31:25','7ccf06f1-c640-4b9f-8e2a-f5fbea7e4bb3');

/*!40000 ALTER TABLE `elementindexsettings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table elements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `elements`;

CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_adyhjtbcbucyzwywdzdwrqduzotulzkmkiqv` (`dateDeleted`),
  KEY `idx_fuhvgyyqlvtzscuvhiwubpmpzhjhfpawrjsy` (`fieldLayoutId`),
  KEY `idx_teddmtobbrxjownjhkooilsaqlxqixgmegqx` (`type`),
  KEY `idx_sxttukvgtzmzatbludxbygiizmbdmlurmxxc` (`enabled`),
  KEY `idx_pdchgmgjzawnsepldjpnquvjkufxashsvuhq` (`archived`,`dateCreated`),
  KEY `idx_kedaezdmxcskzsmdzmqlyaqqduwqazbutpyd` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_unxjkofjnemaupsklttassjnvqsruiwmpakz` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_zozsscorauxzngzvxduaxkracmngjkutjbbn` (`canonicalId`),
  KEY `fk_hyzdkijomxstmhfcppkyyrrqkuilusfhydnp` (`draftId`),
  KEY `fk_tljndijypotvoislmeweeysgtzrowbsyewnd` (`revisionId`),
  CONSTRAINT `fk_hyzdkijomxstmhfcppkyyrrqkuilusfhydnp` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nmbuqwfloahotygrivahnewwneaxtgcdcvfx` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tljndijypotvoislmeweeysgtzrowbsyewnd` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zozsscorauxzngzvxduaxkracmngjkutjbbn` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;

INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`)
VALUES
	(1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2022-08-11 16:15:38','2022-08-12 20:21:48',NULL,NULL,'609ddcc6-1352-4e69-ace5-b9977e6012cd'),
	(2,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-12 14:22:17','2022-08-12 14:22:17',NULL,NULL,'85c4ae0f-8d72-412a-99e1-0cab0211b99a'),
	(3,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-12 14:22:18','2022-08-12 14:22:18',NULL,NULL,'a4c992cb-2b53-4288-abff-a06c124028b5'),
	(4,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-12 14:24:55','2022-08-12 14:24:55',NULL,NULL,'5819ccef-97e9-4bb8-8da1-df96128ebe67'),
	(5,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-12 14:24:55','2022-08-12 14:24:55',NULL,NULL,'05849384-00b5-4abe-80d4-9e34b4d8e073'),
	(6,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2022-08-12 21:29:14','2022-08-14 00:44:04',NULL,NULL,'034f0a7c-490b-45a3-a8e0-2e883b19fbb3'),
	(7,6,NULL,1,1,'craft\\elements\\Entry',1,0,'2022-08-12 21:29:14','2022-08-12 21:29:14',NULL,NULL,'f5a3d5f8-9300-43ae-8a41-3119ec3eaab2'),
	(8,6,NULL,2,1,'craft\\elements\\Entry',1,0,'2022-08-14 00:04:43','2022-08-14 00:04:43',NULL,NULL,'85c227f8-abb7-4f9d-8bf2-ee5343edb21a'),
	(11,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2022-08-14 00:11:41','2022-08-14 00:37:48',NULL,'2022-08-14 00:41:24','9f4d97c7-887e-4ca5-9bd1-09125d0a184f'),
	(12,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2022-08-14 00:11:45','2022-08-14 00:37:55',NULL,'2022-08-14 00:41:24','8dc1add0-ca6b-4a92-80bb-f8cb7355a4de'),
	(14,6,NULL,3,1,'craft\\elements\\Entry',1,0,'2022-08-14 00:12:07','2022-08-14 00:12:07',NULL,NULL,'44b2a523-db61-4595-9613-4a7b1fb5ae58'),
	(15,6,NULL,4,1,'craft\\elements\\Entry',1,0,'2022-08-14 00:16:54','2022-08-14 00:16:54',NULL,NULL,'b20cebea-942e-4e16-89b9-5cd8116f5ac7'),
	(16,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2022-08-14 00:41:35','2022-08-14 00:41:35',NULL,NULL,'0379796c-da50-4bd8-b507-38dd7fdd5c1e'),
	(17,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2022-08-14 00:41:40','2022-08-14 00:41:40',NULL,NULL,'866baa4d-e17e-4ad1-af8a-4cd9dca643e7'),
	(19,6,NULL,5,1,'craft\\elements\\Entry',1,0,'2022-08-14 00:44:04','2022-08-14 00:44:04',NULL,NULL,'e40d8b28-9a08-4344-b0d3-479210dca069'),
	(20,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-14 19:58:43','2022-08-14 19:58:43',NULL,NULL,'98495c10-ad7b-4ef4-9317-5bde6c8db48c'),
	(21,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-14 20:04:04','2022-08-14 20:04:04',NULL,NULL,'8504128d-7f24-425a-a4fa-c35909b50c8a'),
	(22,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-14 20:13:01','2022-08-14 20:13:01',NULL,NULL,'ab703882-d5a8-4b92-9661-517a8c1146e2'),
	(23,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-14 20:14:22','2022-08-14 20:14:22',NULL,NULL,'ec955fc5-31b9-45b3-8cbc-1f7e4c403cc6'),
	(24,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-14 20:21:34','2022-08-14 20:21:34',NULL,NULL,'c132fbbd-ada6-4c3a-98a1-bad3801bfbb1'),
	(25,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-14 20:31:17','2022-08-14 20:31:17',NULL,NULL,'83f7220e-36aa-484a-9f05-9bf5167c9727'),
	(26,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-14 20:32:13','2022-08-14 20:32:13',NULL,NULL,'62175ac7-8fd8-42c2-ab01-59d18db6f093'),
	(27,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-14 20:34:08','2022-08-14 20:34:08',NULL,NULL,'49959ffb-ea78-4914-8c0b-e66f9d3e0273'),
	(28,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-14 20:37:19','2022-08-14 20:37:19',NULL,NULL,'9e0a9af4-795f-4e2c-8237-f4a396b9905f'),
	(29,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-14 20:38:00','2022-08-14 20:38:00',NULL,NULL,'2704381d-7395-4518-bb79-1cd300ab4d63'),
	(30,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-14 20:39:15','2022-08-14 20:39:15',NULL,NULL,'db0e432f-65e1-41f0-a862-ed5b2a879649'),
	(31,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-14 20:39:50','2022-08-14 20:39:50',NULL,NULL,'fc45d86b-35ac-4e99-b448-10ff8c964e98'),
	(32,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-14 20:46:21','2022-08-14 20:46:21',NULL,NULL,'1e23896b-e474-4497-ba36-180f267e2e16'),
	(33,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-14 20:47:22','2022-08-14 20:47:22',NULL,NULL,'ba15c3d2-4451-49c7-b223-03dbfe834c53'),
	(34,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-14 20:54:42','2022-08-14 20:54:42',NULL,NULL,'23da0888-9aff-45d6-a2e2-b8552c5799a4'),
	(35,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-14 20:54:56','2022-08-14 20:54:56',NULL,NULL,'a3a2fe3e-5bd4-484e-a96b-d0c9885cb643'),
	(36,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-14 20:58:31','2022-08-14 20:58:31',NULL,NULL,'2fe9076f-a300-462e-a431-ebb7f861e950'),
	(37,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-14 20:59:30','2022-08-14 20:59:30',NULL,NULL,'af1c9eaf-00f5-467e-b825-3a21acd867c4'),
	(38,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-14 21:02:31','2022-08-14 21:02:31',NULL,NULL,'db165ccc-5627-46c9-84ab-1ff12b35943d'),
	(39,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-14 21:04:04','2022-08-14 21:04:04',NULL,NULL,'d764a4ad-5d41-477a-9da7-2f2f7f0ff39e'),
	(40,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-14 21:05:15','2022-08-14 21:05:15',NULL,NULL,'31725952-0769-4bdd-8d19-fffb6ff9eb50'),
	(41,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-14 21:14:27','2022-08-14 21:14:27',NULL,NULL,'f8b92368-4dee-4883-a3f8-1a7632d58b4d'),
	(42,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-14 21:18:19','2022-08-14 21:18:19',NULL,NULL,'73fa6db9-b958-4ec2-a6ab-413038484d9d'),
	(43,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-14 21:31:08','2022-08-14 21:31:08',NULL,NULL,'55d50e89-4d9e-4b2c-a075-1348b41f5722'),
	(44,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-14 21:32:08','2022-08-14 21:32:08',NULL,NULL,'951a9867-7a69-4443-934c-c0bc1d30ade8'),
	(45,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-14 21:32:31','2022-08-14 21:32:31',NULL,NULL,'c4c03676-1537-4a4b-a722-ef2ee5da6be2'),
	(46,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-14 21:32:48','2022-08-14 21:32:48',NULL,NULL,'d77ec193-f495-4cb2-a200-204e6a76aae1'),
	(47,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-14 21:34:05','2022-08-14 21:34:05',NULL,NULL,'96b8f67f-c8ed-48c6-99dc-543118ccf2f4'),
	(48,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-14 21:34:32','2022-08-14 21:34:32',NULL,NULL,'a1fb7ea9-071d-4f3a-9895-33aab8a910e4'),
	(49,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-14 21:36:26','2022-08-14 21:36:26',NULL,NULL,'dca21bf9-9fd1-4e7d-8216-9b69f6f7e688'),
	(50,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-14 21:38:27','2022-08-14 21:38:27',NULL,NULL,'b2cecf77-c009-42eb-a719-594839c127a3'),
	(51,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-14 21:44:16','2022-08-14 21:44:16',NULL,NULL,'62fe511d-d9d6-4bac-8ee1-61e061dbad68'),
	(52,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-15 20:32:21','2022-08-15 20:32:21',NULL,NULL,'2925f4ce-f70d-420e-8873-01395fc10e52'),
	(53,NULL,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2022-08-15 20:34:41','2022-08-15 20:34:41',NULL,NULL,'7bb70f9d-1e66-4c33-9b7e-cdf171b3ad68');

/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table elements_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `elements_sites`;

CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cldiomdlbjgjkxdnfisczvtplsiezlkoehhy` (`elementId`,`siteId`),
  KEY `idx_whholztejqrzvrnlmpahuieyweranlcabtci` (`siteId`),
  KEY `idx_fkffevszndgzrlvgirdcdxbpcynkyrrxyvrq` (`slug`,`siteId`),
  KEY `idx_iapzpmdtqjqksnzlwbxfzwfayegipstbmzoq` (`enabled`),
  KEY `idx_luagxqhusrwnnqisennikngnzqiycdrtuyma` (`uri`,`siteId`),
  CONSTRAINT `fk_nhakqwnsdlspwvdjlqhivecniladumoeeupz` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yteitdnvpriwseqbfwfaemeexadwtcedrfrf` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,1,NULL,NULL,1,'2022-08-11 16:15:38','2022-08-11 16:15:38','1c83eb24-6e28-4d96-a6b0-09bb7a5a101b'),
	(2,2,1,NULL,NULL,1,'2022-08-12 14:22:18','2022-08-12 14:22:18','2162e385-9e1b-4155-b430-25042042c020'),
	(3,3,1,NULL,NULL,1,'2022-08-12 14:22:19','2022-08-12 14:22:19','30ccce45-4e3e-4396-b864-826ff8561b3a'),
	(4,4,1,NULL,NULL,1,'2022-08-12 14:24:55','2022-08-12 14:24:55','8a35da23-1260-4c57-b6a7-f911d220b426'),
	(5,5,1,NULL,NULL,1,'2022-08-12 14:24:55','2022-08-12 14:24:55','f1a1828d-4d86-4a53-b0de-8810d4151049'),
	(6,6,1,'homepage','__home__',1,'2022-08-12 21:29:14','2022-08-12 21:29:14','e4101bcd-9dad-455b-9e32-d1f4a3c76ef4'),
	(7,7,1,'homepage','__home__',1,'2022-08-12 21:29:14','2022-08-12 21:29:14','0bee102c-28c9-4e98-bcaf-9f95a5f1e044'),
	(8,8,1,'homepage','__home__',1,'2022-08-14 00:04:43','2022-08-14 00:04:43','2a05f574-753b-498f-8e4b-d34c601332fa'),
	(11,11,1,NULL,NULL,1,'2022-08-14 00:11:41','2022-08-14 00:11:41','367c1bda-7e35-4287-880d-b40458f03408'),
	(12,12,1,NULL,NULL,1,'2022-08-14 00:11:45','2022-08-14 00:11:45','f450c0ef-eca2-4477-a7d7-620f61fa6cc1'),
	(14,14,1,'homepage','__home__',1,'2022-08-14 00:12:07','2022-08-14 00:12:07','f89a192d-5f00-4dc4-9b36-ee595cbfc46f'),
	(15,15,1,'homepage','__home__',1,'2022-08-14 00:16:54','2022-08-14 00:16:54','62d784c7-5b4d-4d98-a560-9c1e45753c8d'),
	(16,16,1,NULL,NULL,1,'2022-08-14 00:41:35','2022-08-14 00:41:35','293ac185-64fa-4a04-be55-0f9e7623f057'),
	(17,17,1,NULL,NULL,1,'2022-08-14 00:41:40','2022-08-14 00:41:40','e0d2a36a-401a-4a84-9119-b76ce3c27768'),
	(19,19,1,'homepage','__home__',1,'2022-08-14 00:44:04','2022-08-14 00:44:04','f3f127c8-c765-40aa-b3b6-75241d47d946'),
	(20,20,1,NULL,NULL,1,'2022-08-14 19:58:43','2022-08-14 19:58:43','044632db-52ba-44fa-8581-abfcd14ae4cf'),
	(21,21,1,NULL,NULL,1,'2022-08-14 20:04:04','2022-08-14 20:04:04','e7fc87ce-a839-443a-8e92-86755241269e'),
	(22,22,1,NULL,NULL,1,'2022-08-14 20:13:01','2022-08-14 20:13:01','d46d009e-f20d-493f-b949-5ba9f520b434'),
	(23,23,1,NULL,NULL,1,'2022-08-14 20:14:22','2022-08-14 20:14:22','51d943f0-488f-4bb7-a069-9bb9f370a632'),
	(24,24,1,NULL,NULL,1,'2022-08-14 20:21:35','2022-08-14 20:21:35','d28d830d-146b-4eaa-8753-1e9f48bad584'),
	(25,25,1,NULL,NULL,1,'2022-08-14 20:31:17','2022-08-14 20:31:17','14d61d07-5098-4ea9-bcf6-e39caf673f5e'),
	(26,26,1,NULL,NULL,1,'2022-08-14 20:32:13','2022-08-14 20:32:13','5058a418-917b-44dd-a8c0-296ef8775631'),
	(27,27,1,NULL,NULL,1,'2022-08-14 20:34:08','2022-08-14 20:34:08','2d82e8b5-3083-43f3-aee1-a8f153bcd225'),
	(28,28,1,NULL,NULL,1,'2022-08-14 20:37:19','2022-08-14 20:37:19','f5e2e7e7-216a-4f1e-a604-c5894391f687'),
	(29,29,1,NULL,NULL,1,'2022-08-14 20:38:00','2022-08-14 20:38:00','fd612666-0734-4b97-a922-c836894e1e84'),
	(30,30,1,NULL,NULL,1,'2022-08-14 20:39:15','2022-08-14 20:39:15','fa32c3d2-0d68-4f89-be8b-3c186283c970'),
	(31,31,1,NULL,NULL,1,'2022-08-14 20:39:50','2022-08-14 20:39:50','44d278c3-d144-4199-9b25-ab796585a387'),
	(32,32,1,NULL,NULL,1,'2022-08-14 20:46:21','2022-08-14 20:46:21','c7ef0c63-2be6-4274-834c-44e91d59d268'),
	(33,33,1,NULL,NULL,1,'2022-08-14 20:47:22','2022-08-14 20:47:22','ec526128-1dab-4268-a3a3-8b0c66fea964'),
	(34,34,1,NULL,NULL,1,'2022-08-14 20:54:42','2022-08-14 20:54:42','162760c5-9830-4498-ab59-8490376635a3'),
	(35,35,1,NULL,NULL,1,'2022-08-14 20:54:56','2022-08-14 20:54:56','7b84eb53-e023-479b-8c84-bc996aeee402'),
	(36,36,1,NULL,NULL,1,'2022-08-14 20:58:31','2022-08-14 20:58:31','688ec148-1178-490a-9b74-2c903ab64d62'),
	(37,37,1,NULL,NULL,1,'2022-08-14 20:59:30','2022-08-14 20:59:30','1eceea41-3383-4c51-99db-aa2257d53309'),
	(38,38,1,NULL,NULL,1,'2022-08-14 21:02:31','2022-08-14 21:02:31','312db983-5a2c-4680-a4d8-a9dca0dbdb56'),
	(39,39,1,NULL,NULL,1,'2022-08-14 21:04:04','2022-08-14 21:04:04','8c170f73-aed7-4600-9187-159d8dda56ba'),
	(40,40,1,NULL,NULL,1,'2022-08-14 21:05:15','2022-08-14 21:05:15','b1fdd0c6-9279-41a5-a044-c1424494cc13'),
	(41,41,1,NULL,NULL,1,'2022-08-14 21:14:27','2022-08-14 21:14:27','82b3f0a1-df8a-4fa6-9bab-8f629a3e75b9'),
	(42,42,1,NULL,NULL,1,'2022-08-14 21:18:19','2022-08-14 21:18:19','e28a752b-29c3-4844-93c0-f1acd90690d3'),
	(43,43,1,NULL,NULL,1,'2022-08-14 21:31:08','2022-08-14 21:31:08','250b9aa3-768a-416e-b42e-f98552f2e0cc'),
	(44,44,1,NULL,NULL,1,'2022-08-14 21:32:09','2022-08-14 21:32:09','7395d95f-a1e8-4e24-baa6-33c9486fca0b'),
	(45,45,1,NULL,NULL,1,'2022-08-14 21:32:31','2022-08-14 21:32:31','e8f51440-4246-418f-93f0-c1bc7daeeac1'),
	(46,46,1,NULL,NULL,1,'2022-08-14 21:32:48','2022-08-14 21:32:48','ce9e065c-58ae-4919-8bd6-6e0a6b7ec68c'),
	(47,47,1,NULL,NULL,1,'2022-08-14 21:34:05','2022-08-14 21:34:05','5ec7b43a-b4b6-4507-83b6-5b5eba1561a7'),
	(48,48,1,NULL,NULL,1,'2022-08-14 21:34:32','2022-08-14 21:34:32','2ad50eab-c589-4c10-91b9-a0cb7c7420a0'),
	(49,49,1,NULL,NULL,1,'2022-08-14 21:36:26','2022-08-14 21:36:26','b2a20ea1-fb52-4ddb-a1b0-faca13c982d7'),
	(50,50,1,NULL,NULL,1,'2022-08-14 21:38:27','2022-08-14 21:38:27','cf546031-0786-4c64-9afd-319a5f29cd4b'),
	(51,51,1,NULL,NULL,1,'2022-08-14 21:44:16','2022-08-14 21:44:16','9c15223b-e01c-4bd3-a26b-bb6e0aa0bed5'),
	(52,52,1,NULL,NULL,1,'2022-08-15 20:32:21','2022-08-15 20:32:21','fdeac5ae-81ec-432a-92ab-8c94e7c67651'),
	(53,53,1,NULL,NULL,1,'2022-08-15 20:34:41','2022-08-15 20:34:41','d76624e7-256c-41cb-a228-b962e8516864');

/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `entries`;

CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_siboqndcdlzendqlgxsdvqaejfsopiqfwkes` (`postDate`),
  KEY `idx_ufcujavqumyklyakfdqkfljdobeevvtxpbbw` (`expiryDate`),
  KEY `idx_yrryhpopxcqkrhiwviyhcdxwnczyqukskdsl` (`authorId`),
  KEY `idx_aqgkrlktbfsyslwwoyhwpapnoowbgcoleuap` (`sectionId`),
  KEY `idx_uqxikjqrweqtecnwdyaczhzikzjqpbcjxjao` (`typeId`),
  KEY `fk_bpthturjnqirepvglahpzlarkrvqvvayhhgy` (`parentId`),
  CONSTRAINT `fk_bpthturjnqirepvglahpzlarkrvqvvayhhgy` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_dylakpdfjbkvjmblmrvjnbkoaoypjhhdvsig` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ftbefhpuoygvimcljpnhqcfsvfitulwozhad` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rkvvasmnzsyedfaohhwjvlkpztdaaevzhyqx` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zilsdefcpqqfonzbccjzpuplhskxckajmisv` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;

INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(6,1,NULL,1,NULL,'2022-08-12 21:29:00',NULL,NULL,'2022-08-12 21:29:14','2022-08-12 21:29:14','f0593912-6578-4f19-bf74-145096158c27'),
	(7,1,NULL,1,NULL,'2022-08-12 21:29:00',NULL,NULL,'2022-08-12 21:29:14','2022-08-12 21:29:14','afabcfc1-5fe3-4fcf-aa02-f8d54603cf5a'),
	(8,1,NULL,1,NULL,'2022-08-12 21:29:00',NULL,NULL,'2022-08-14 00:04:43','2022-08-14 00:04:43','8c0de6be-b426-4e78-985b-7fdf0e1ece9c'),
	(14,1,NULL,1,NULL,'2022-08-12 21:29:00',NULL,NULL,'2022-08-14 00:12:07','2022-08-14 00:12:07','5e14ad45-6b18-4e72-aa73-a5ad9474c3e6'),
	(15,1,NULL,1,NULL,'2022-08-12 21:29:00',NULL,NULL,'2022-08-14 00:16:54','2022-08-14 00:16:54','fc3e39a9-a5cf-4194-a4ec-37a6fc6837b5'),
	(19,1,NULL,1,NULL,'2022-08-12 21:29:00',NULL,NULL,'2022-08-14 00:44:04','2022-08-14 00:44:04','730c6c3d-0356-4030-b314-e97877ad1854');

/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table entrytypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `entrytypes`;

CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yaynoezmtwqhcizxmomsvxjkcaakrtjjgohe` (`name`,`sectionId`),
  KEY `idx_ljqsjulkvrnsuvsrqcftqmoidcschczinrgs` (`handle`,`sectionId`),
  KEY `idx_sxotsptsktxnexboqnwhqmdyzgstxhwqepxp` (`sectionId`),
  KEY `idx_cxxaekytdfypfwfolkncoqsqdjeseqhopkfk` (`fieldLayoutId`),
  KEY `idx_aaieocdjaxykvtuowomtvzwdcickfbbdwghn` (`dateDeleted`),
  CONSTRAINT `fk_kaeyjzkdvixupbtlvcsvsdyzkpwkocprvoar` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_sogzhfjdaarjlhptsaqokgtiwfcduftpmoaw` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;

INSERT INTO `entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,1,1,'Homepage','homepage',0,'site',NULL,'{section.name|raw}',1,'2022-08-12 21:29:14','2022-08-12 21:29:14',NULL,'e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae');

/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fieldgroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fieldgroups`;

CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xeknhzoagdigkdlgjcvpbjsweretqwqpflgb` (`name`),
  KEY `idx_gjisbucyogqmblsqiglzxczotxpbbrgdcjrw` (`dateDeleted`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;

INSERT INTO `fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,'Common','2022-08-11 16:15:38','2022-08-11 16:15:38',NULL,'f57762b0-c0de-40bb-8373-43c2da606997');

/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fieldlayoutfields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fieldlayoutfields`;

CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bbcuravmugnonyqdvnrfolioewndxliooqte` (`layoutId`,`fieldId`),
  KEY `idx_loexmmrnrtxrilwuhjxzhoioctgcjnfawhjl` (`sortOrder`),
  KEY `idx_zmywedkkqsyjooavvrcsauyiqdwxdnpfshuf` (`tabId`),
  KEY `idx_nghoaifzcjklkhgsquqntmfgeezesautijfd` (`fieldId`),
  CONSTRAINT `fk_emxhrusyasewesbynsipxiqwtzyxticsgdsh` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jaffxxhavsjdrhbrgtmjnkibujsimiqamxye` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ulqyqrwhkedlbfvhxhquvkdubtgueiseddix` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;

INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,4,1,0,1,'2022-08-14 00:04:43','2022-08-14 00:04:43','053c8323-3ae3-439e-9516-a60f4419c320'),
	(6,2,10,2,0,1,'2022-08-14 00:39:12','2022-08-14 00:39:12','068dd3a0-93b4-4e0c-a7fe-9755e56dd0a5');

/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fieldlayouts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fieldlayouts`;

CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hdnmfltsxkgxxzibnjyrhbmcfammjtkyckaa` (`dateDeleted`),
  KEY `idx_bxcpxtqfrjgitzouszapowygqqpzeexswogd` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;

INSERT INTO `fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,'craft\\elements\\Entry','2022-08-12 21:29:14','2022-08-12 21:29:14',NULL,'26e0e8d7-45c7-4ca0-9e43-d5073fdf403c'),
	(2,'craft\\elements\\Asset','2022-08-14 00:03:29','2022-08-14 00:03:29',NULL,'b782024f-776f-4261-8400-ff9479d26a71');

/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fieldlayouttabs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fieldlayouttabs`;

CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `elements` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xhhkbiicwtewfhfwkfokxzmgvznqnovfvsww` (`sortOrder`),
  KEY `idx_uqzsmkkoonedohusoortlxwuawcbhukpfiaa` (`layoutId`),
  CONSTRAINT `fk_syisjjenkevvnnzztmyyfwjiawwfciaoelno` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;

INSERT INTO `fieldlayouttabs` (`id`, `layoutId`, `name`, `elements`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(4,1,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"1efe2a80-8045-41dd-ae04-8e64b18f4f03\"}]',1,'2022-08-14 00:04:43','2022-08-14 00:04:43','ac1f6722-5605-4df1-b062-3244dddbd432'),
	(10,2,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\AssetTitleField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"710c1936-f63d-4a3e-8ddd-1956d785b7ff\"}]',1,'2022-08-14 00:39:12','2022-08-14 00:39:12','0d40048c-21f9-48e8-8d82-a9e0d24cbc87');

/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fields`;

CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8_unicode_ci,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uuxgdzwfcuyrabugpgxtffelzpfqqbhkfgrz` (`handle`,`context`),
  KEY `idx_wgwjqkrmyzmodrfnjxhwdlbdtzcpjzahsfgz` (`groupId`),
  KEY `idx_pyxbvqfbgmkddkgbuixkgawgydyvetiggmua` (`context`),
  CONSTRAINT `fk_jawxhygrbinozxgwcfcfusjpmrgbwquhaytd` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;

INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'Slides','slides','global',NULL,'',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:274b5f37-481f-47df-8ece-a277e6d6a399\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:274b5f37-481f-47df-8ece-a277e6d6a399\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2022-08-14 00:04:32','2022-08-14 00:16:48','1efe2a80-8045-41dd-ae04-8e64b18f4f03'),
	(2,1,'Text','text','global','ujcehzsb','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2022-08-14 00:14:32','2022-08-14 00:14:32','710c1936-f63d-4a3e-8ddd-1956d785b7ff');

/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table freeform_crm_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `freeform_crm_fields`;

CREATE TABLE `freeform_crm_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `integrationId` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `required` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_crm_fields_type_idx` (`type`),
  KEY `freeform_crm_fields_integrationId_fk` (`integrationId`),
  CONSTRAINT `freeform_crm_fields_integrationId_fk` FOREIGN KEY (`integrationId`) REFERENCES `freeform_integrations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table freeform_export_notifications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `freeform_export_notifications`;

CREATE TABLE `freeform_export_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profileId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fileType` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `fileName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `frequency` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `recipients` text COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `freeform_export_notifications_profileId_fk` (`profileId`),
  CONSTRAINT `freeform_export_notifications_profileId_fk` FOREIGN KEY (`profileId`) REFERENCES `freeform_export_profiles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table freeform_export_profiles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `freeform_export_profiles`;

CREATE TABLE `freeform_export_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `limit` int(11) DEFAULT NULL,
  `dateRange` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rangeStart` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rangeEnd` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fields` text COLLATE utf8_unicode_ci NOT NULL,
  `filters` text COLLATE utf8_unicode_ci,
  `statuses` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `freeform_export_profiles_formId_fk` (`formId`),
  CONSTRAINT `freeform_export_profiles_formId_fk` FOREIGN KEY (`formId`) REFERENCES `freeform_forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table freeform_export_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `freeform_export_settings`;

CREATE TABLE `freeform_export_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `setting` mediumtext COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_export_settings_userId_fk` (`userId`),
  CONSTRAINT `freeform_export_settings_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table freeform_feed_messages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `freeform_feed_messages`;

CREATE TABLE `freeform_feed_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feedId` int(11) NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `conditions` text COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `issueDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_feed_messages_feedId_fk` (`feedId`),
  CONSTRAINT `freeform_feed_messages_feedId_fk` FOREIGN KEY (`feedId`) REFERENCES `freeform_feeds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table freeform_feeds
# ------------------------------------------------------------

DROP TABLE IF EXISTS `freeform_feeds`;

CREATE TABLE `freeform_feeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `min` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `max` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `issueDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `freeform_feeds_hash_unq_idx` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table freeform_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `freeform_fields`;

CREATE TABLE `freeform_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `required` tinyint(1) DEFAULT '0',
  `instructions` text COLLATE utf8_unicode_ci,
  `metaProperties` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`),
  KEY `freeform_fields_type_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `freeform_fields` WRITE;
/*!40000 ALTER TABLE `freeform_fields` DISABLE KEYS */;

INSERT INTO `freeform_fields` (`id`, `type`, `handle`, `label`, `required`, `instructions`, `metaProperties`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'text','firstName','First Name',0,NULL,NULL,'2022-08-11 16:52:04','2022-08-11 16:52:04','d8a74afb-2161-44e7-8dcb-a999a104e607'),
	(2,'text','lastName','Last Name',0,NULL,NULL,'2022-08-11 16:52:04','2022-08-11 16:52:04','842c62a3-5037-4eae-85e6-8abfda81281b'),
	(3,'email','email','Email',0,NULL,NULL,'2022-08-11 16:52:04','2022-08-11 16:52:04','aeacbee6-a754-41f8-a08a-cf6cbdbd876a'),
	(4,'text','website','Website',0,NULL,NULL,'2022-08-11 16:52:04','2022-08-11 16:52:04','1668e667-d600-4a87-89de-04805fc3290c'),
	(5,'text','cellPhone','Cell Phone',0,NULL,NULL,'2022-08-11 16:52:04','2022-08-11 16:52:04','e2eebdea-899c-43cb-8f58-371a7148601e'),
	(6,'text','homePhone','Home Phone',0,NULL,NULL,'2022-08-11 16:52:04','2022-08-11 16:52:04','62130c16-8fba-4ae6-99b5-bd382d49fd32'),
	(7,'text','companyName','Company Name',0,NULL,NULL,'2022-08-11 16:52:04','2022-08-11 16:52:04','998402c7-fdfb-4f6b-851d-5588f321d3de'),
	(8,'textarea','address','Address',0,NULL,'{\"rows\":2}','2022-08-11 16:52:04','2022-08-11 16:52:04','4cbc59e8-5bf2-4afe-aecd-14f1986c26ca'),
	(9,'text','city','City',0,NULL,NULL,'2022-08-11 16:52:04','2022-08-11 16:52:04','bdca0cfe-b0c3-4976-9e69-aa7d24d3a08f'),
	(10,'select','state','State',0,NULL,'{\"options\":[{\"value\":\"\",\"label\":\"Select a State\"},{\"value\":\"AL\",\"label\":\"Alabama\"},{\"value\":\"AK\",\"label\":\"Alaska\"},{\"value\":\"AZ\",\"label\":\"Arizona\"},{\"value\":\"AR\",\"label\":\"Arkansas\"},{\"value\":\"CA\",\"label\":\"California\"},{\"value\":\"CO\",\"label\":\"Colorado\"},{\"value\":\"CT\",\"label\":\"Connecticut\"},{\"value\":\"DE\",\"label\":\"Delaware\"},{\"value\":\"DC\",\"label\":\"District of Columbia\"},{\"value\":\"FL\",\"label\":\"Florida\"},{\"value\":\"GA\",\"label\":\"Georgia\"},{\"value\":\"HI\",\"label\":\"Hawaii\"},{\"value\":\"ID\",\"label\":\"Idaho\"},{\"value\":\"IL\",\"label\":\"Illinois\"},{\"value\":\"IN\",\"label\":\"Indiana\"},{\"value\":\"IA\",\"label\":\"Iowa\"},{\"value\":\"KS\",\"label\":\"Kansas\"},{\"value\":\"KY\",\"label\":\"Kentucky\"},{\"value\":\"LA\",\"label\":\"Louisiana\"},{\"value\":\"ME\",\"label\":\"Maine\"},{\"value\":\"MD\",\"label\":\"Maryland\"},{\"value\":\"MA\",\"label\":\"Massachusetts\"},{\"value\":\"MI\",\"label\":\"Michigan\"},{\"value\":\"MN\",\"label\":\"Minnesota\"},{\"value\":\"MS\",\"label\":\"Mississippi\"},{\"value\":\"MO\",\"label\":\"Missouri\"},{\"value\":\"MT\",\"label\":\"Montana\"},{\"value\":\"NE\",\"label\":\"Nebraska\"},{\"value\":\"NV\",\"label\":\"Nevada\"},{\"value\":\"NH\",\"label\":\"New Hampshire\"},{\"value\":\"NJ\",\"label\":\"New Jersey\"},{\"value\":\"NM\",\"label\":\"New Mexico\"},{\"value\":\"NY\",\"label\":\"New York\"},{\"value\":\"NC\",\"label\":\"North Carolina\"},{\"value\":\"ND\",\"label\":\"North Dakota\"},{\"value\":\"OH\",\"label\":\"Ohio\"},{\"value\":\"OK\",\"label\":\"Oklahoma\"},{\"value\":\"OR\",\"label\":\"Oregon\"},{\"value\":\"PA\",\"label\":\"Pennsylvania\"},{\"value\":\"RI\",\"label\":\"Rhode Island\"},{\"value\":\"SC\",\"label\":\"South Carolina\"},{\"value\":\"SD\",\"label\":\"South Dakota\"},{\"value\":\"TN\",\"label\":\"Tennessee\"},{\"value\":\"TX\",\"label\":\"Texas\"},{\"value\":\"UT\",\"label\":\"Utah\"},{\"value\":\"VT\",\"label\":\"Vermont\"},{\"value\":\"VA\",\"label\":\"Virginia\"},{\"value\":\"WA\",\"label\":\"Washington\"},{\"value\":\"WV\",\"label\":\"West Virginia\"},{\"value\":\"WI\",\"label\":\"Wisconsin\"},{\"value\":\"WY\",\"label\":\"Wyoming\"}]}','2022-08-11 16:52:04','2022-08-11 16:52:04','f7b4a219-8f3e-4ed6-ab28-d6a2f8fbdbc1'),
	(11,'text','zipCode','Zip Code',0,NULL,NULL,'2022-08-11 16:52:04','2022-08-11 16:52:04','bf40d3f2-f709-4b4a-8bd3-61f2a6369a63'),
	(12,'textarea','message','Message',0,NULL,'{\"rows\":5}','2022-08-11 16:52:04','2022-08-11 16:52:04','9d604f7a-3326-4021-bc64-7e5937813872'),
	(13,'number','number','Number',0,NULL,NULL,'2022-08-11 16:52:04','2022-08-11 16:52:04','5e5c39ca-833f-407d-a361-ad3cdd1ad70a'),
	(14,'cc_details','payment','',0,NULL,NULL,'2022-08-11 16:52:04','2022-08-11 16:52:04','f97eb2b9-4a30-45b8-a489-79009a461c7f');

/*!40000 ALTER TABLE `freeform_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table freeform_forms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `freeform_forms`;

CREATE TABLE `freeform_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `spamBlockCount` int(11) unsigned NOT NULL DEFAULT '0',
  `submissionTitleFormat` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `layoutJson` mediumtext COLLATE utf8_unicode_ci,
  `metadata` mediumtext COLLATE utf8_unicode_ci,
  `returnUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `defaultStatus` int(11) unsigned DEFAULT NULL,
  `formTemplateId` int(11) unsigned DEFAULT NULL,
  `color` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `optInDataStorageTargetHash` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `limitFormSubmissions` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extraPostUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extraPostTriggerPhrase` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `gtmEnabled` tinyint(1) DEFAULT '0',
  `gtmId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gtmEventName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `freeform_forms` WRITE;
/*!40000 ALTER TABLE `freeform_forms` DISABLE KEYS */;

INSERT INTO `freeform_forms` (`id`, `type`, `name`, `handle`, `spamBlockCount`, `submissionTitleFormat`, `description`, `layoutJson`, `metadata`, `returnUrl`, `defaultStatus`, `formTemplateId`, `color`, `optInDataStorageTargetHash`, `limitFormSubmissions`, `extraPostUrl`, `extraPostTriggerPhrase`, `order`, `gtmEnabled`, `gtmId`, `gtmEventName`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Solspace\\Freeform\\Form\\Types\\Regular','Form','form',0,'{{ dateCreated|date(\"Y-m-d H:i:s\") }}','','{\"composer\":{\"layout\":[[{\"id\":\"LOPbKEynX\",\"columns\":[\"4y97KM0lX\"]},{\"id\":\"Jw56LMXNa\",\"columns\":[\"YWx72j7gR\"]},{\"id\":\"P5wElnzdq\",\"columns\":[\"KnqkRE7jD\"]},{\"id\":\"GgDjqmK1m\",\"columns\":[\"Qzxk1Ak5o\"]},{\"id\":\"w6jnNkpXq\",\"columns\":[\"VOW2RGVpa\"]}]],\"properties\":{\"page0\":{\"type\":\"page\",\"label\":\"Page 1\"},\"form\":{\"type\":\"form\",\"name\":\"Form\",\"formType\":\"Solspace\\\\Freeform\\\\Form\\\\Types\\\\Regular\",\"handle\":\"form\",\"color\":\"#f9e52e\",\"submissionTitleFormat\":\"{{ dateCreated|date(\\\"Y-m-d H:i:s\\\") }}\",\"description\":\"\",\"formTemplate\":\"bootstrap-5.html\",\"returnUrl\":\"\",\"storeData\":true,\"ajaxEnabled\":true,\"defaultStatus\":2},\"validation\":{\"type\":\"validation\",\"validationType\":\"submit\",\"successMessage\":\"\",\"errorMessage\":\"\"},\"integration\":{\"type\":\"integration\",\"integrationId\":0,\"mapping\":[]},\"connections\":{\"type\":\"connections\",\"list\":null},\"rules\":{\"type\":\"rules\",\"list\":[]},\"admin_notifications\":{\"type\":\"admin_notifications\",\"notificationId\":0,\"recipients\":\"\"},\"payment\":{\"type\":\"payment\",\"integrationId\":0,\"mapping\":[]},\"4y97KM0lX\":{\"hash\":\"4y97KM0lX\",\"id\":1,\"type\":\"text\",\"handle\":\"firstName\",\"label\":\"First Name\",\"required\":false,\"instructions\":\"\",\"value\":\"\",\"placeholder\":\"\"},\"YWx72j7gR\":{\"hash\":\"YWx72j7gR\",\"id\":2,\"type\":\"text\",\"handle\":\"lastName\",\"label\":\"Last Name\",\"required\":false,\"instructions\":\"\",\"value\":\"\",\"placeholder\":\"\"},\"KnqkRE7jD\":{\"hash\":\"KnqkRE7jD\",\"id\":3,\"type\":\"email\",\"handle\":\"email\",\"label\":\"Email\",\"required\":false,\"instructions\":\"\",\"notificationId\":0,\"values\":[],\"placeholder\":\"\"},\"Qzxk1Ak5o\":{\"hash\":\"Qzxk1Ak5o\",\"id\":12,\"type\":\"textarea\",\"handle\":\"message\",\"label\":\"Message\",\"required\":false,\"instructions\":\"\",\"value\":\"\",\"placeholder\":\"\",\"rows\":5},\"VOW2RGVpa\":{\"type\":\"submit\",\"label\":\"Submit\",\"labelNext\":\"Submit\",\"labelPrev\":\"Previous\",\"disablePrev\":false,\"position\":\"left\"}}},\"context\":{\"page\":0,\"hash\":\"validation\"}}','{\"successBehaviour\":\"reload\"}','',2,NULL,'#f9e52e',NULL,NULL,'','',1,0,'','','2022-08-11 16:52:49','2022-08-12 14:24:34','723c85fc-0bd7-4ce0-b248-dad66ddce8d5');

/*!40000 ALTER TABLE `freeform_forms` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table freeform_integrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `freeform_integrations`;

CREATE TABLE `freeform_integrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accessToken` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `forceUpdate` tinyint(1) DEFAULT '0',
  `lastUpdate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`),
  KEY `freeform_integrations_type_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table freeform_integrations_queue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `freeform_integrations_queue`;

CREATE TABLE `freeform_integrations_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submissionId` int(11) NOT NULL,
  `integrationType` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fieldHash` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_integrations_queue_status_idx` (`status`),
  KEY `freeform_integrations_queue_submissionId_fk` (`submissionId`),
  CONSTRAINT `freeform_integrations_queue_id_fk` FOREIGN KEY (`id`) REFERENCES `freeform_mailing_list_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `freeform_integrations_queue_submissionId_fk` FOREIGN KEY (`submissionId`) REFERENCES `freeform_submissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table freeform_lock
# ------------------------------------------------------------

DROP TABLE IF EXISTS `freeform_lock`;

CREATE TABLE `freeform_lock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_lock_key_dateCreated_idx` (`key`,`dateCreated`),
  KEY `freeform_lock_dateCreated_idx` (`dateCreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `freeform_lock` WRITE;
/*!40000 ALTER TABLE `freeform_lock` DISABLE KEYS */;

INSERT INTO `freeform_lock` (`id`, `key`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'export-notifications','2022-08-11 16:52:05','2022-08-11 16:52:05','9e3762a3-d416-4bc8-a517-320443af4f85'),
	(2,'freeform-purge-cache-key','2022-08-11 16:52:07','2022-08-11 16:52:07','0b99904a-9bd4-4682-812e-e205b4b18ca8'),
	(3,'save-and-continue-cleanup','2022-08-11 16:52:07','2022-08-11 16:52:07','0287ec26-5e5b-4f43-abec-6bbe0fc1e127'),
	(4,'freeform-feed-cache-key','2022-08-11 16:52:13','2022-08-11 16:52:13','c703a649-8b0d-4295-872d-70746b95f2fb'),
	(5,'freeform-digest-cache-key','2022-08-11 16:52:14','2022-08-11 16:52:14','641730ca-352f-4230-baf9-266904e5c05a'),
	(6,'freeform-purge-cache-key','2022-08-11 17:52:56','2022-08-11 17:52:56','dcde7b0d-72b9-4624-863a-660f52ff9732'),
	(7,'save-and-continue-cleanup','2022-08-11 17:52:57','2022-08-11 17:52:57','5648e809-4a8b-48a9-a8d0-29f8ccf27b40'),
	(8,'freeform-purge-cache-key','2022-08-11 20:05:23','2022-08-11 20:05:23','2afef30b-a3ff-47de-9069-d21de5215e8b'),
	(9,'save-and-continue-cleanup','2022-08-11 20:05:24','2022-08-11 20:05:24','ce33aa24-9b11-42cc-b13b-b296a7bb01f0'),
	(10,'freeform-digest-cache-key','2022-08-11 20:05:25','2022-08-11 20:05:25','7e2a8da9-3c46-432c-af54-69955dd9c7c7'),
	(11,'export-notifications','2022-08-11 20:05:25','2022-08-11 20:05:25','286f2a2c-73ae-4733-aee8-46c53be84b21'),
	(12,'freeform-purge-cache-key','2022-08-11 21:05:26','2022-08-11 21:05:26','d8f7c09d-513e-4382-b0b3-7606f7b509f7'),
	(13,'save-and-continue-cleanup','2022-08-11 21:05:27','2022-08-11 21:05:27','e9e0dead-30e5-44d1-a627-1876631bcec9'),
	(14,'freeform-feed-cache-key','2022-08-11 21:52:30','2022-08-11 21:52:30','bcbab744-6e22-468c-b53d-e0fb2f53facb'),
	(15,'freeform-purge-cache-key','2022-08-12 13:28:16','2022-08-12 13:28:16','8b254b7f-eefe-493a-a2df-580358a47385'),
	(16,'save-and-continue-cleanup','2022-08-12 13:28:17','2022-08-12 13:28:17','10272891-a5e7-4e2f-b865-34ea4c642c2b'),
	(17,'freeform-feed-cache-key','2022-08-12 13:28:19','2022-08-12 13:28:19','c527952d-f201-4e8f-b4d9-e8e20726bf38'),
	(18,'freeform-digest-cache-key','2022-08-12 13:28:20','2022-08-12 13:28:20','5f4b0a9b-9cf1-4805-b9d7-67f1d3c4fe86'),
	(19,'export-notifications','2022-08-12 13:28:20','2022-08-12 13:28:20','ea445483-ecc3-47fd-a094-f046ff7c1b92'),
	(20,'freeform-purge-cache-key','2022-08-12 14:29:11','2022-08-12 14:29:11','9690ee90-66bc-45dd-bd1f-ff9533c09711'),
	(21,'save-and-continue-cleanup','2022-08-12 14:29:12','2022-08-12 14:29:12','3b60375a-01a5-40e8-ad43-dc517db7e8e0'),
	(22,'freeform-purge-cache-key','2022-08-12 19:00:59','2022-08-12 19:00:59','c7baebb2-08cf-43b0-8412-e050f425c745'),
	(23,'save-and-continue-cleanup','2022-08-12 19:00:59','2022-08-12 19:00:59','46a4fb48-2be6-4d8c-9c17-5d6eb6eedce3'),
	(24,'freeform-feed-cache-key','2022-08-12 19:00:59','2022-08-12 19:00:59','11a21dc0-5d34-4b81-ab6d-5bd9bb0c5cfc'),
	(25,'freeform-digest-cache-key','2022-08-12 19:01:00','2022-08-12 19:01:00','84c9ba68-d67d-427b-b4bc-ed701a487267'),
	(26,'export-notifications','2022-08-12 19:01:00','2022-08-12 19:01:00','4f4205fb-7c8d-459f-af53-7f3ac33131ee'),
	(27,'freeform-purge-cache-key','2022-08-12 20:16:30','2022-08-12 20:16:30','de689740-a837-4cab-90fe-e74f2162b6fa'),
	(28,'save-and-continue-cleanup','2022-08-12 20:16:30','2022-08-12 20:16:30','20f01d6a-73c6-48cf-b3a9-1875f9a3725d'),
	(29,'freeform-purge-cache-key','2022-08-12 21:17:26','2022-08-12 21:17:26','94f45edb-106b-4f53-bd0a-262099d6a564'),
	(30,'save-and-continue-cleanup','2022-08-12 21:17:26','2022-08-12 21:17:26','166cfff6-f72f-468c-9092-e95f37a788f8'),
	(31,'freeform-digest-cache-key','2022-08-12 22:01:00','2022-08-12 22:01:00','b1fbb410-b658-4a82-8824-fc691a8a69f9'),
	(32,'export-notifications','2022-08-12 22:01:00','2022-08-12 22:01:00','3a2fa1f2-2898-4955-b5f3-735019c7a6ef'),
	(33,'freeform-purge-cache-key','2022-08-12 22:18:12','2022-08-12 22:18:12','4c301236-dba4-47fd-9750-0e53e8080c1d'),
	(34,'save-and-continue-cleanup','2022-08-12 22:18:12','2022-08-12 22:18:12','8d188301-7627-4cdb-9e0c-d77319b63d4e'),
	(35,'freeform-purge-cache-key','2022-08-12 23:18:29','2022-08-12 23:18:29','3f0ef731-d2bc-4022-b29c-ddc1bf9d8151'),
	(36,'save-and-continue-cleanup','2022-08-12 23:18:29','2022-08-12 23:18:29','c3bfc0a8-f685-40bb-ba62-8fc9d4dc58ad'),
	(37,'freeform-purge-cache-key','2022-08-13 02:22:58','2022-08-13 02:22:58','1226deb0-ab63-46d4-884b-43ace0f60161'),
	(38,'save-and-continue-cleanup','2022-08-13 02:22:58','2022-08-13 02:22:58','06f6b71c-3d52-4ef0-8475-f07f6d170197'),
	(39,'freeform-feed-cache-key','2022-08-13 02:22:59','2022-08-13 02:22:59','552fbc79-105c-43a5-ad72-d255dc6252a3'),
	(40,'freeform-digest-cache-key','2022-08-13 02:22:59','2022-08-13 02:22:59','b5940278-0a5d-4129-8027-1aaafcd17501'),
	(41,'export-notifications','2022-08-13 02:22:59','2022-08-13 02:22:59','3bce95b2-3872-46f1-81be-010e69ffa25a'),
	(42,'freeform-purge-cache-key','2022-08-13 03:42:40','2022-08-13 03:42:40','36faef95-74ec-455b-b2b5-81d00daf5b77'),
	(43,'save-and-continue-cleanup','2022-08-13 03:42:40','2022-08-13 03:42:40','be0e426d-1c4f-4217-a91b-61699a6706ec'),
	(44,'freeform-purge-cache-key','2022-08-13 04:43:08','2022-08-13 04:43:08','15cb1b09-7bbf-47dc-b100-3bff1e159f45'),
	(45,'save-and-continue-cleanup','2022-08-13 04:43:08','2022-08-13 04:43:08','fbcb0672-5ec4-430d-99d0-166ede3bca5e'),
	(46,'freeform-purge-cache-key','2022-08-13 16:06:25','2022-08-13 16:06:25','9eedef5f-6386-4ae5-8a0e-26837cb17d94'),
	(47,'save-and-continue-cleanup','2022-08-13 16:06:25','2022-08-13 16:06:25','34f54363-d179-45f3-a464-c7a8a883d485'),
	(48,'freeform-feed-cache-key','2022-08-13 16:06:26','2022-08-13 16:06:26','f22b9e01-6565-48fa-a09d-092bb1e5cab0'),
	(49,'freeform-digest-cache-key','2022-08-13 16:06:27','2022-08-13 16:06:27','37f0d5ab-1e64-4643-8799-a37fd5951e55'),
	(50,'export-notifications','2022-08-13 16:06:27','2022-08-13 16:06:27','c21a39f3-0153-4894-9aed-5d7ea2642283'),
	(51,'freeform-purge-cache-key','2022-08-13 19:47:00','2022-08-13 19:47:00','1d3c0974-9420-43ae-8ed3-35e15b742043'),
	(52,'save-and-continue-cleanup','2022-08-13 19:47:00','2022-08-13 19:47:00','220578aa-b4e9-4118-b682-788318a51875'),
	(53,'freeform-digest-cache-key','2022-08-13 19:47:00','2022-08-13 19:47:00','58a8336f-d224-4190-b21f-6210e8c7b7c8'),
	(54,'export-notifications','2022-08-13 19:47:00','2022-08-13 19:47:00','06829757-c5af-4858-9908-95a4700ab20f'),
	(55,'freeform-purge-cache-key','2022-08-13 21:09:34','2022-08-13 21:09:34','6beefd8b-6196-4f4c-bae1-f0090d86eab4'),
	(56,'save-and-continue-cleanup','2022-08-13 21:09:34','2022-08-13 21:09:34','cd34a479-7bdf-4c8c-b79e-12e9f55cbbaa'),
	(57,'freeform-feed-cache-key','2022-08-13 21:09:35','2022-08-13 21:09:35','e4d5fa7f-599e-4a2c-9a78-405826da8870'),
	(58,'save-and-continue-cleanup','2022-08-13 22:09:34','2022-08-13 22:09:34','f5d6445d-45bc-472d-b944-32e7540cccaa'),
	(59,'freeform-purge-cache-key','2022-08-13 22:09:44','2022-08-13 22:09:44','64643c39-a7d6-4f40-8a6d-654b19dc0a78'),
	(60,'freeform-digest-cache-key','2022-08-13 22:47:03','2022-08-13 22:47:03','3b26d5ee-e729-4b1e-9fd9-e39c4568d528'),
	(61,'export-notifications','2022-08-13 22:47:03','2022-08-13 22:47:03','5cb85753-3865-4f29-904c-59e9379a25e3'),
	(62,'save-and-continue-cleanup','2022-08-13 23:09:37','2022-08-13 23:09:37','a0d3788b-53a1-46ba-9169-b014bcbbe727'),
	(63,'freeform-purge-cache-key','2022-08-13 23:09:44','2022-08-13 23:09:44','18e0aef7-c2a2-4f80-9708-3718ae0f4a02'),
	(64,'freeform-purge-cache-key','2022-08-14 00:10:24','2022-08-14 00:10:24','d568b78a-b392-4d48-85cf-ab14b631ce55'),
	(65,'save-and-continue-cleanup','2022-08-14 00:10:24','2022-08-14 00:10:24','e60944ac-0a07-419e-bc95-60724d0ef406'),
	(66,'freeform-purge-cache-key','2022-08-14 02:24:30','2022-08-14 02:24:30','2aa7f520-9d22-42cd-8eef-cb4b1689e4ed'),
	(67,'save-and-continue-cleanup','2022-08-14 02:24:30','2022-08-14 02:24:30','c4e3b41e-a569-47bb-a7cc-f6af0a65f795'),
	(68,'freeform-feed-cache-key','2022-08-14 02:24:30','2022-08-14 02:24:30','c59e35cc-c268-4a19-a3ce-8178ecf77bbb'),
	(69,'freeform-digest-cache-key','2022-08-14 02:24:30','2022-08-14 02:24:30','e11e6be2-7270-4837-92e5-98a71b6b5318'),
	(70,'export-notifications','2022-08-14 02:24:30','2022-08-14 02:24:30','53cdc7ee-7f3c-46da-988c-fe39b96ff516'),
	(71,'freeform-purge-cache-key','2022-08-14 03:24:49','2022-08-14 03:24:49','42471a51-a182-40dd-81a3-59e2ac39fb6c'),
	(72,'save-and-continue-cleanup','2022-08-14 03:24:49','2022-08-14 03:24:49','bc65c925-8403-4af0-aede-15b34ba51e40'),
	(73,'freeform-purge-cache-key','2022-08-14 04:56:29','2022-08-14 04:56:29','2583d247-cda8-4854-8fc3-146480426f0f'),
	(74,'save-and-continue-cleanup','2022-08-14 04:56:29','2022-08-14 04:56:29','7174c68d-ecdb-42e5-b23a-56d8b02ff897'),
	(75,'freeform-digest-cache-key','2022-08-14 05:50:36','2022-08-14 05:50:36','b442d33d-6b4d-42ff-b647-5fd4076c8861'),
	(76,'export-notifications','2022-08-14 05:50:36','2022-08-14 05:50:36','c5f1c09c-0d02-42f2-a8a4-f7d1b581bae1'),
	(77,'freeform-purge-cache-key','2022-08-14 05:56:47','2022-08-14 05:56:47','415e9070-26f9-4e11-a321-18eabb51bf4f'),
	(78,'save-and-continue-cleanup','2022-08-14 05:56:47','2022-08-14 05:56:47','c387e87b-43af-4b9f-82a2-2b6519928422'),
	(79,'freeform-purge-cache-key','2022-08-14 19:18:13','2022-08-14 19:18:13','557098bb-6214-42eb-bf68-ac2acf9492cc'),
	(80,'save-and-continue-cleanup','2022-08-14 19:18:13','2022-08-14 19:18:13','655bede6-c6ff-4d47-acca-bfe9195243cc'),
	(81,'freeform-feed-cache-key','2022-08-14 19:18:13','2022-08-14 19:18:13','85840c4b-030e-41d6-bf6e-40ff58c511f0'),
	(82,'freeform-digest-cache-key','2022-08-14 19:18:13','2022-08-14 19:18:13','4a98b608-6da0-45f8-a98a-ef85d720d25e'),
	(83,'export-notifications','2022-08-14 19:18:13','2022-08-14 19:18:13','5401af6a-8d6b-4155-a2ad-d468fd757316'),
	(84,'freeform-purge-cache-key','2022-08-14 20:18:17','2022-08-14 20:18:17','3ffba5ce-d640-4cd6-b9f6-c89bdf666753'),
	(85,'save-and-continue-cleanup','2022-08-14 20:18:18','2022-08-14 20:18:18','48411e1f-b8d4-4e82-892a-88e3a99cf898'),
	(86,'freeform-purge-cache-key','2022-08-14 21:18:19','2022-08-14 21:18:19','30daaf55-2010-42f2-8696-1892b30d432c'),
	(87,'save-and-continue-cleanup','2022-08-14 21:18:19','2022-08-14 21:18:19','b6e512b9-cde9-4812-8c63-8cd237393a44'),
	(88,'freeform-purge-cache-key','2022-08-14 22:26:26','2022-08-14 22:26:26','78821fe3-e1da-45c6-beb9-84aa9107afe9'),
	(89,'save-and-continue-cleanup','2022-08-14 22:26:26','2022-08-14 22:26:26','4db883c0-1ed0-4ffa-8d6c-fa60e43155e6'),
	(90,'freeform-digest-cache-key','2022-08-14 22:26:26','2022-08-14 22:26:26','2d37fd91-98ab-4b9a-846b-5b895d303b77'),
	(91,'export-notifications','2022-08-14 22:26:26','2022-08-14 22:26:26','7a73f5c3-a776-407c-b2c1-6be5437db2e0'),
	(92,'freeform-purge-cache-key','2022-08-15 00:11:11','2022-08-15 00:11:11','fb4eddf4-fef3-4097-8477-094a65de35ca'),
	(93,'save-and-continue-cleanup','2022-08-15 00:11:11','2022-08-15 00:11:11','21081cef-bad6-402c-9d73-854976df2f32'),
	(94,'freeform-feed-cache-key','2022-08-15 00:18:25','2022-08-15 00:18:25','ae2361c5-36a6-488b-9a9e-05610a1f0aca'),
	(95,'freeform-purge-cache-key','2022-08-15 01:12:34','2022-08-15 01:12:34','211dbc35-0f7c-4064-9713-8c3adb8fccb1'),
	(96,'save-and-continue-cleanup','2022-08-15 01:12:35','2022-08-15 01:12:35','8cf9893d-11f8-4076-9864-d4d6e2bf2f3b'),
	(97,'freeform-digest-cache-key','2022-08-15 01:38:18','2022-08-15 01:38:18','73086477-dd42-4478-932c-262ae061ee8c'),
	(98,'export-notifications','2022-08-15 01:38:18','2022-08-15 01:38:18','91baa8f3-6d70-4764-ace2-44ad44eb0f77'),
	(99,'freeform-purge-cache-key','2022-08-15 17:12:31','2022-08-15 17:12:31','6a54fe3c-65d1-4f57-8b1b-45b138998849'),
	(100,'save-and-continue-cleanup','2022-08-15 17:12:31','2022-08-15 17:12:31','d3e071ba-309d-4f93-b374-1e4b74019d70'),
	(101,'freeform-feed-cache-key','2022-08-15 17:12:31','2022-08-15 17:12:31','52a92968-3f86-44ae-a37e-bd53bdd0ac79'),
	(102,'freeform-digest-cache-key','2022-08-15 17:12:32','2022-08-15 17:12:32','130732a8-7091-4a1e-8c15-f6b47b4d236a'),
	(103,'export-notifications','2022-08-15 17:12:32','2022-08-15 17:12:32','66ddda27-7dcb-4074-b1e4-04f0f2ba5623'),
	(104,'freeform-purge-cache-key','2022-08-15 19:34:07','2022-08-15 19:34:07','6f28b9a6-d117-472e-a953-8dc22a9ad6ee'),
	(105,'save-and-continue-cleanup','2022-08-15 19:34:07','2022-08-15 19:34:07','9e198de2-932b-47ec-898e-0e8a3c5f4d5d'),
	(106,'freeform-digest-cache-key','2022-08-15 20:14:57','2022-08-15 20:14:57','9544e1ec-b457-48d2-8633-84e70768feb4'),
	(107,'export-notifications','2022-08-15 20:14:57','2022-08-15 20:14:57','29b3fd42-f855-4b97-b2cd-8099c7bbc159'),
	(108,'freeform-purge-cache-key','2022-08-15 20:34:18','2022-08-15 20:34:18','6e8d99c8-af2a-433d-8c6f-64347615a6af'),
	(109,'save-and-continue-cleanup','2022-08-15 20:34:18','2022-08-15 20:34:18','5b56a988-c43b-44a1-b37a-e9b5338ff5b2');

/*!40000 ALTER TABLE `freeform_lock` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table freeform_mailing_list_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `freeform_mailing_list_fields`;

CREATE TABLE `freeform_mailing_list_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mailingListId` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `required` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_mailing_list_fields_type_idx` (`type`),
  KEY `freeform_mailing_list_fields_mailingListId_fk` (`mailingListId`),
  CONSTRAINT `freeform_mailing_list_fields_mailingListId_fk` FOREIGN KEY (`mailingListId`) REFERENCES `freeform_mailing_lists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table freeform_mailing_lists
# ------------------------------------------------------------

DROP TABLE IF EXISTS `freeform_mailing_lists`;

CREATE TABLE `freeform_mailing_lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `integrationId` int(11) NOT NULL,
  `resourceId` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `memberCount` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `freeform_mailing_lists_integrationId_resourceId_unq_idx` (`integrationId`,`resourceId`),
  CONSTRAINT `freeform_mailing_lists_integrationId_fk` FOREIGN KEY (`integrationId`) REFERENCES `freeform_integrations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table freeform_notification_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `freeform_notification_log`;

CREATE TABLE `freeform_notification_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_notification_log_type_dateCreated_idx` (`type`,`dateCreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table freeform_notifications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `freeform_notifications`;

CREATE TABLE `freeform_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `fromName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fromEmail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `replyToName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `replyToEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bcc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bodyHtml` text COLLATE utf8_unicode_ci,
  `bodyText` text COLLATE utf8_unicode_ci,
  `autoText` tinyint(1) NOT NULL DEFAULT '1',
  `includeAttachments` tinyint(1) DEFAULT '1',
  `presetAssets` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table freeform_payment_gateway_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `freeform_payment_gateway_fields`;

CREATE TABLE `freeform_payment_gateway_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `integrationId` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `required` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_payment_gateway_fields_type_idx` (`type`),
  KEY `freeform_payment_gateway_fields_integrationId_fk` (`integrationId`),
  CONSTRAINT `freeform_payment_gateway_fields_integrationId_fk` FOREIGN KEY (`integrationId`) REFERENCES `freeform_integrations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table freeform_payments_payments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `freeform_payments_payments`;

CREATE TABLE `freeform_payments_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `integrationId` int(11) NOT NULL,
  `submissionId` int(11) NOT NULL,
  `subscriptionId` int(11) DEFAULT NULL,
  `resourceId` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last4` smallint(6) DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8_unicode_ci,
  `errorCode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `errorMessage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `freeform_payments_payments_integrationId_resourceId_unq_idx` (`integrationId`,`resourceId`),
  KEY `freeform_payments_payments_submissionId_fk` (`submissionId`),
  KEY `freeform_payments_payments_subscriptionId_fk` (`subscriptionId`),
  CONSTRAINT `freeform_payments_payments_integrationId_fk` FOREIGN KEY (`integrationId`) REFERENCES `freeform_integrations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `freeform_payments_payments_submissionId_fk` FOREIGN KEY (`submissionId`) REFERENCES `freeform_submissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `freeform_payments_payments_subscriptionId_fk` FOREIGN KEY (`subscriptionId`) REFERENCES `freeform_payments_subscriptions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table freeform_payments_subscription_plans
# ------------------------------------------------------------

DROP TABLE IF EXISTS `freeform_payments_subscription_plans`;

CREATE TABLE `freeform_payments_subscription_plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `integrationId` int(11) NOT NULL,
  `resourceId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_payments_subscription_plans_integrationId_fk` (`integrationId`),
  CONSTRAINT `freeform_payments_subscription_plans_integrationId_fk` FOREIGN KEY (`integrationId`) REFERENCES `freeform_integrations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table freeform_payments_subscriptions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `freeform_payments_subscriptions`;

CREATE TABLE `freeform_payments_subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `integrationId` int(11) NOT NULL,
  `submissionId` int(11) NOT NULL,
  `planId` int(11) NOT NULL,
  `resourceId` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interval` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intervalCount` smallint(6) DEFAULT NULL,
  `last4` smallint(6) DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8_unicode_ci,
  `errorCode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `errorMessage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `freeform_payments_subscriptions_integrationId_resourceId_unq_idx` (`integrationId`,`resourceId`),
  KEY `freeform_payments_subscriptions_submissionId_fk` (`submissionId`),
  KEY `freeform_payments_subscriptions_planId_fk` (`planId`),
  CONSTRAINT `freeform_payments_subscriptions_integrationId_fk` FOREIGN KEY (`integrationId`) REFERENCES `freeform_integrations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `freeform_payments_subscriptions_planId_fk` FOREIGN KEY (`planId`) REFERENCES `freeform_payments_subscription_plans` (`id`) ON DELETE CASCADE,
  CONSTRAINT `freeform_payments_subscriptions_submissionId_fk` FOREIGN KEY (`submissionId`) REFERENCES `freeform_submissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table freeform_saved_forms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `freeform_saved_forms`;

CREATE TABLE `freeform_saved_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `formId` int(11) NOT NULL,
  `token` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `payload` mediumtext COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_saved_forms_token_idx` (`token`),
  KEY `freeform_saved_forms_dateCreated_idx` (`dateCreated`),
  KEY `freeform_saved_forms_sessionId_idx` (`sessionId`),
  KEY `freeform_saved_forms_formId_fk` (`formId`),
  CONSTRAINT `freeform_saved_forms_formId_fk` FOREIGN KEY (`formId`) REFERENCES `freeform_forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table freeform_session_context
# ------------------------------------------------------------

DROP TABLE IF EXISTS `freeform_session_context`;

CREATE TABLE `freeform_session_context` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contextKey` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sessionId` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `formId` int(11) NOT NULL,
  `propertyBag` mediumtext COLLATE utf8_unicode_ci,
  `attributeBag` mediumtext COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_session_context_contextKey_formId_idx` (`contextKey`,`formId`),
  KEY `freeform_session_context_sessionId_idx` (`sessionId`),
  KEY `freeform_session_context_formId_fk` (`formId`),
  CONSTRAINT `freeform_session_context_formId_fk` FOREIGN KEY (`formId`) REFERENCES `freeform_forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table freeform_spam_reason
# ------------------------------------------------------------

DROP TABLE IF EXISTS `freeform_spam_reason`;

CREATE TABLE `freeform_spam_reason` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submissionId` int(11) NOT NULL,
  `reasonType` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `reasonMessage` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_spam_reason_submissionId_reasonType_idx` (`submissionId`,`reasonType`),
  CONSTRAINT `freeform_spam_reason_submissionId_fk` FOREIGN KEY (`submissionId`) REFERENCES `freeform_submissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table freeform_statuses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `freeform_statuses`;

CREATE TABLE `freeform_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isDefault` tinyint(1) DEFAULT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `freeform_statuses` WRITE;
/*!40000 ALTER TABLE `freeform_statuses` DISABLE KEYS */;

INSERT INTO `freeform_statuses` (`id`, `name`, `handle`, `color`, `isDefault`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Pending','pending','light',NULL,1,'2022-08-11 16:52:04','2022-08-11 16:52:04','cf34f7b1-6bb0-47ad-bb4d-bfa63573739e'),
	(2,'Open','open','green',1,2,'2022-08-11 16:52:04','2022-08-11 16:52:04','21e9b6c0-d814-4193-9cb4-acd92ec29796'),
	(3,'Closed','closed','grey',NULL,3,'2022-08-11 16:52:04','2022-08-11 16:52:04','e6b5f7ec-14bc-4aa3-aafc-b0b0ab19b24c');

/*!40000 ALTER TABLE `freeform_statuses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table freeform_submission_notes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `freeform_submission_notes`;

CREATE TABLE `freeform_submission_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submissionId` int(11) NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_submission_notes_submissionId_fk` (`submissionId`),
  CONSTRAINT `freeform_submission_notes_submissionId_fk` FOREIGN KEY (`submissionId`) REFERENCES `freeform_submissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table freeform_submissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `freeform_submissions`;

CREATE TABLE `freeform_submissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `incrementalId` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `statusId` int(11) DEFAULT NULL,
  `formId` int(11) NOT NULL,
  `token` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(46) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isSpam` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_1` text COLLATE utf8_unicode_ci,
  `field_2` text COLLATE utf8_unicode_ci,
  `field_3` text COLLATE utf8_unicode_ci,
  `field_4` text COLLATE utf8_unicode_ci,
  `field_5` text COLLATE utf8_unicode_ci,
  `field_6` text COLLATE utf8_unicode_ci,
  `field_7` text COLLATE utf8_unicode_ci,
  `field_8` text COLLATE utf8_unicode_ci,
  `field_9` text COLLATE utf8_unicode_ci,
  `field_10` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_11` text COLLATE utf8_unicode_ci,
  `field_12` text COLLATE utf8_unicode_ci,
  `field_13` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_14` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `freeform_submissions_incrementalId_unq_idx` (`incrementalId`),
  UNIQUE KEY `freeform_submissions_token_unq_idx` (`token`),
  KEY `freeform_submissions_userId_fk` (`userId`),
  KEY `freeform_submissions_formId_fk` (`formId`),
  KEY `freeform_submissions_statusId_fk` (`statusId`),
  CONSTRAINT `freeform_submissions_formId_fk` FOREIGN KEY (`formId`) REFERENCES `freeform_forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `freeform_submissions_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `freeform_submissions_statusId_fk` FOREIGN KEY (`statusId`) REFERENCES `freeform_statuses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `freeform_submissions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `freeform_submissions` WRITE;
/*!40000 ALTER TABLE `freeform_submissions` DISABLE KEYS */;

INSERT INTO `freeform_submissions` (`id`, `incrementalId`, `userId`, `statusId`, `formId`, `token`, `ip`, `isSpam`, `dateCreated`, `dateUpdated`, `uid`, `field_1`, `field_2`, `field_3`, `field_4`, `field_5`, `field_6`, `field_7`, `field_8`, `field_9`, `field_10`, `field_11`, `field_12`, `field_13`, `field_14`)
VALUES
	(2,1,NULL,2,1,'Vl3lMF4qHHCy1bS520F1KLlmWlWJoZwamcc2YYDPaStVsIvvfDZZCTSMnyNfhhxOqzNCc7FjWEU3oZNME7GP5iZghoxtrJ0GGi2h','172.18.0.1',0,'2022-08-12 14:22:18','2022-08-12 14:22:18','40c4cee3-295b-408f-a75e-cc0d0eb90953','Jerry','vargas','[\"jvargas1@conversionia.com\"]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Hello',NULL,NULL),
	(3,2,NULL,2,1,'Bfwrf042MCQH0ldLYs5Hl02J1npWidCGQaYX5UkEOfD8h0JsVWv4pze6oJVyGGEpaAyVqxMfUXA8UCwE0AzIZKs6M69Yfa4rlrB4','172.18.0.1',0,'2022-08-12 14:22:19','2022-08-12 14:22:19','3444d98c-d70c-4749-b4b7-8ed0b5db08d9','Jerry','vargas','[\"jvargas1@conversionia.com\"]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Hello',NULL,NULL),
	(4,3,NULL,2,1,'g3ClXrY4hBPXFrkySWkwGfCPz91VGhopwdCC4qbjTRBppHaweS9vKRq9EqJIUwkYiKsG4CnJ2hvHjM5WkWwWzix3jZc1q0OYOKrW','172.18.0.1',0,'2022-08-12 14:24:55','2022-08-12 14:24:55','7f649265-fa15-41e1-9b50-d98751406464','Jerry','vargas','[\"jvargas1@conversionia.com\"]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Test 123',NULL,NULL),
	(5,4,NULL,2,1,'p0JdiUceQ1wbj8BYEIeC2BUtV6A4V5fiimGqRJo8dOKaiAExv76PKqqxZF7XUUmRhXo40AvIhj5FFcUZ2q4AxgvHzssqCbKcTGXL','172.18.0.1',0,'2022-08-12 14:24:55','2022-08-12 14:24:55','be8fece9-961b-48fb-a271-2ed1153da5cb','Jerry','vargas','[\"jvargas1@conversionia.com\"]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Test 123',NULL,NULL),
	(42,5,1,2,1,'C6RJ7rRSBLnMHBfVOOa7smyqqoUHAyzzmlGp14ykXkQZB5Sk1yzaGMxlbyxjn8uzbxSRDC1CDgxervsKMRlSsjkPLt2veGGUTphC','::1',0,'2022-08-14 21:18:19','2022-08-14 21:18:19','712264a5-f005-435a-8ddc-035e2a337119','Jeff','Benusa','[\"jbtest18+cloudways@test.com\"]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Messsage',NULL,NULL),
	(43,6,1,2,1,'UrF74QQb2UqWBEBShPCH1MlnPv3bg0E9EGUGO2oJNELu9e4X5DKCvgASbxktBgkgsk9gs40xonNp4TZ6UTd9Vic7bsJajlbGzpA3','::1',0,'2022-08-14 21:31:08','2022-08-14 21:31:08','def00eac-c23a-4275-8fc6-4704e6ffba38','Jeff','Benusa','[\"jbtest18+cloudways@test.com\"]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sdf',NULL,NULL),
	(44,7,1,2,1,'tOIOPfhP6KuZbtq00KVAkHZfqQ5j7orDzzSXj39iaAN9Uo1AcprQ7qU2QRNgl8QEz6WzEwhTdNPCuldHt7CoDjkmgpmWlXD0kGlm','::1',0,'2022-08-14 21:32:09','2022-08-14 21:32:09','34dc535f-2ab0-4c30-9633-45699347efc4','Jeff','Benusa','[\"jbtest19+cloudways@test.com\"]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sadf',NULL,NULL),
	(45,8,1,2,1,'jsMwE3Y5nT3i9lqmChYybEOatDRBLy5rBWBE27Up1GzWK6LVV1Q1yrVsuHKnMxLMyGA3qcMICedLUjwcBQ6rqWmWiIsQPPv5GgWE','::1',0,'2022-08-14 21:32:31','2022-08-14 21:32:31','9095a067-622b-42fc-a29f-d8095f3d05cf','Jeff','Benusa','[\"jbtest19+cloudways@test.com\"]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sdf',NULL,NULL),
	(46,9,1,2,1,'DMkiE8YUjxmrRSEOghbMicVoESNNTlL5ZaHFhX5zvKmwnaO2IjfhxOmvp4dTVMDjuLgP371xc8fodqmUC8o1XGEZHbhhx9Ho7yeT','::1',0,'2022-08-14 21:32:48','2022-08-14 21:32:48','bb256d2e-17fe-4e56-8fd5-790fc6075cf7','Jeff','Benusa','[\"jbtest19+cloudways@test.com\"]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'asdf',NULL,NULL),
	(47,10,1,2,1,'jTaLlLYXbxqwMcFVwkChosKVgw57qo5uJZrdvIZfIwQjEQQ96ML8ZzCfQac294zxm58ojDdSEbNmJ9JSyxW75VXHkXGBUSnAA0jF','::1',0,'2022-08-14 21:34:05','2022-08-14 21:34:05','850188b6-4d88-4a0e-b0d0-b16bcafdaa4b','Jeff','Benusa','[\"jbtest18+cloudways@test.com\"]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sdf',NULL,NULL),
	(48,11,1,2,1,'q9OIvlPBuyHrwRrm6MAOgxl9OS8uqUhx6nOXXY9H4PEwBVQcOL0b09iM3QZk5oDL39U1GsAhLVNom23A24JlOAni4VTm5z7FwZYN','::1',0,'2022-08-14 21:34:32','2022-08-14 21:34:32','492ea56e-7be7-4567-8f50-3d0fdb29bee8','Jeff','Benusa','[\"jbtest18+cloudways@test.com\"]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sdf',NULL,NULL),
	(49,12,1,2,1,'4UCLRVp3ihVf4leeWApiowWetvfWNwtloyx2HzXHK2KeK4WNTpszPwcLBscQREW4CxCQr9ZqUMalPlZSBrqjFxqaI6YIoQmNvXQS','::1',0,'2022-08-14 21:36:26','2022-08-14 21:36:26','8c79e991-7dbf-4bb8-be2d-9ea0c280441a','Jeff','Benusa','[\"jbtest18+cloudways@test.com\"]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sadf',NULL,NULL),
	(50,13,1,2,1,'SeBHEMCSvmqMDgPUJrvOCv07DpWYRDeG6S1yZfW9M3gT7aYH60s8EWm8Y9aFbhxWdeyhNNz2f5XmaBgvUE3WzAlwnU5ohGQLBU6b','::1',0,'2022-08-14 21:38:28','2022-08-14 21:38:28','6928f438-8a10-497c-b30e-793757a37363','Jeff','Benusa','[\"jbtest18+cloudways@test.com\"]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dsgf',NULL,NULL),
	(51,14,1,2,1,'9D5glqaWze0fPSamYjK4Y8gWgyZq1I5B5eSjBCGuXX8AYNHD7cjl98PTeHerKSKhBPrGWR6rPkOTK5dbq2fxmM3RzcgoAdbTTcKF','::1',0,'2022-08-14 21:44:16','2022-08-14 21:44:16','04c9d18e-021e-4421-a066-a94ca822285e','Jeff','Benusa','[\"jbtest18+cloudways@test.com\"]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sdf',NULL,NULL),
	(52,15,NULL,2,1,'i3gwOkmSgrK6rsHJ1sExEjcOLw0LcXYCPD2RdaLtEF4ohWK6UDRZPfXed7iM3kSMyatdjxJHf4L3aL5zcfV4halLXOjD94g6X7qy','::1',0,'2022-08-15 20:32:21','2022-08-15 20:32:21','b2075124-fd02-4ca5-889d-ca1f6d5b7347','Jeff','Benusa','[\"jbtest18+cloudways@test.com\"]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'asdf',NULL,NULL),
	(53,16,1,2,1,'fFT0jFk4OTTtp0xUtfIgBK1d4KtKwq5Pk87iA2lOT7cOPd5BXgX32IM7T0mNRdLh1MoFDjEzUsxqWYC7wWeIVBNboUONnxyQqtOz','::1',0,'2022-08-15 20:34:41','2022-08-15 20:34:41','5b62983f-7c47-491a-87d4-7763dc26e5b9','Jeff','Benusa','[\"jbtest18+cloudways@test.com\"]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'asdf',NULL,NULL);

/*!40000 ALTER TABLE `freeform_submissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table freeform_unfinalized_files
# ------------------------------------------------------------

DROP TABLE IF EXISTS `freeform_unfinalized_files`;

CREATE TABLE `freeform_unfinalized_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `fieldHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `formToken` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_unfinalized_files_fieldHandle_formToken_idx` (`fieldHandle`,`formToken`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table freeform_webhooks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `freeform_webhooks`;

CREATE TABLE `freeform_webhooks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `webhook` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_webhooks_type_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `freeform_webhooks` WRITE;
/*!40000 ALTER TABLE `freeform_webhooks` DISABLE KEYS */;

INSERT INTO `freeform_webhooks` (`id`, `type`, `name`, `webhook`, `settings`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'modules\\conversion\\webhooks\\WebhookSite','Freeform Assessment ','$FREEFORM_WEBHOOK_URL','[]','2022-08-14 19:56:41','2022-08-14 21:41:20','457e692d-e9e4-4cd1-99e5-ce304f17af3b');

/*!40000 ALTER TABLE `freeform_webhooks` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table freeform_webhooks_form_relations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `freeform_webhooks_form_relations`;

CREATE TABLE `freeform_webhooks_form_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `webhookId` int(11) NOT NULL,
  `formId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_webhooks_form_relations_webhookId_idx` (`webhookId`),
  KEY `freeform_webhooks_form_relations_formId_idx` (`formId`),
  CONSTRAINT `freeform_webhooks_form_relations_formId_fk` FOREIGN KEY (`formId`) REFERENCES `freeform_forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `freeform_webhooks_form_relations_webhookId_fk` FOREIGN KEY (`webhookId`) REFERENCES `freeform_webhooks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `freeform_webhooks_form_relations` WRITE;
/*!40000 ALTER TABLE `freeform_webhooks_form_relations` DISABLE KEYS */;

INSERT INTO `freeform_webhooks_form_relations` (`id`, `webhookId`, `formId`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(8,1,1,'2022-08-14 21:41:20','2022-08-14 21:41:20','edbcb640-718d-4976-8653-5e5ad3fbf786');

/*!40000 ALTER TABLE `freeform_webhooks_form_relations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table globalsets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `globalsets`;

CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_txagscsefiiaebbdfvrumklmbjpitvmefowj` (`name`),
  KEY `idx_lqutbdhfokzwhzjgvidhrlhpigpcbwmvwcsq` (`handle`),
  KEY `idx_qxjjtkzrbdqjvgckepiklcihosfspgnvwbjr` (`fieldLayoutId`),
  KEY `idx_ooxxgwytcauvilpvcolgmjbfzqgyynxlhcew` (`sortOrder`),
  CONSTRAINT `fk_gtjmkeodiidtqcitjgagjfnthwknbgrluunx` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_lqjfoqcejaxipoqhmedjsdvhmiuoyrwgbznd` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table gqlschemas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gqlschemas`;

CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `scope` text COLLATE utf8_unicode_ci,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table gqltokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gqltokens`;

CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ubvvandgjszvlnefehvthdlsdkwmnnkvafcx` (`accessToken`),
  UNIQUE KEY `idx_okspsqdhqlgksfjccvhpunnyjkmdzebkgdoo` (`name`),
  KEY `fk_ttuaqbamgeuhjflfdxzbypazhboahvxngoms` (`schemaId`),
  CONSTRAINT `fk_ttuaqbamgeuhjflfdxzbypazhboahvxngoms` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `info`;

CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'3.7.51','3.7.33',0,'oqdeyikgnjbm','3@qpullwylcr','2022-08-11 16:15:38','2022-08-14 00:39:12','600c5136-a71c-419e-b664-21d86da027ae');

/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table matrixblocks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `matrixblocks`;

CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_olkufjfjwqfiiapvopehaimanlrnbwzvxxbe` (`ownerId`),
  KEY `idx_vwceifztdekbdujzubxvsoajbardqdaoauda` (`fieldId`),
  KEY `idx_nocoegbwegaeaeuourraruxdepetksvxxupl` (`typeId`),
  KEY `idx_wvpmbnqvkbqvlbybwblnxofycwyutzzmincy` (`sortOrder`),
  CONSTRAINT `fk_arwohodykpsxadbixmppcbfyiliesdfbgszz` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jakjeshgkacxtnhqvqwqgiganeufpcfpyyjk` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jqaecxnzgvbsekutkttxmaokajhdlvcoszlx` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kuwcrvvgwrgahtfqlfdblfcadekdyykvtlzr` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table matrixblocktypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `matrixblocktypes`;

CREATE TABLE `matrixblocktypes` (
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
  KEY `idx_rdkzfqeloatatrncsgowrznzqdlkerfykpxg` (`name`,`fieldId`),
  KEY `idx_upczvvjiwepsuehmdicjxqgsrcashlxfbxut` (`handle`,`fieldId`),
  KEY `idx_djeuyprbdosihmeonyewyuwltuzbzeqygbke` (`fieldId`),
  KEY `idx_jucqyrwpgbdzhqfcupxtvapnprktfacqfyou` (`fieldLayoutId`),
  CONSTRAINT `fk_fhpuhzasdnljwypotloyfpzssndxxkfmwobc` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_rhgpqyfsycshjrhzextqjvkguwydszfchplr` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jakltbsqacfdsvuezzvmtdsxfumfxxwubfxa` (`track`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'craft','Install','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','86d3008f-72f0-413e-8b30-7345df919342'),
	(2,'craft','m150403_183908_migrations_table_changes','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','f844dadb-61c9-4eb6-974c-1eda52a73a4d'),
	(3,'craft','m150403_184247_plugins_table_changes','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','27b25e76-02c8-4bb3-9258-466f943a04c4'),
	(4,'craft','m150403_184533_field_version','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','198b0261-d8f6-42f2-af9e-e61eb22f6973'),
	(5,'craft','m150403_184729_type_columns','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','f812eb8c-b5da-4345-b399-7ac1ca0285bc'),
	(6,'craft','m150403_185142_volumes','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','97fc7372-ae7b-4bd4-bbd7-50a16957d500'),
	(7,'craft','m150428_231346_userpreferences','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','5e2c435f-a250-4d7c-82e1-9128b87f2b79'),
	(8,'craft','m150519_150900_fieldversion_conversion','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','a02efc7b-3169-4043-acb8-b5e1be5105d1'),
	(9,'craft','m150617_213829_update_email_settings','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','eee4573a-d9a5-4a69-92a3-cf7ee91ad2af'),
	(10,'craft','m150721_124739_templatecachequeries','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','af0af6f5-af0a-4f7b-bc20-be6aa0f42e2c'),
	(11,'craft','m150724_140822_adjust_quality_settings','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','6b4ebe33-444a-4106-8378-2080fd7f32e7'),
	(12,'craft','m150815_133521_last_login_attempt_ip','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','28e9a8bb-c3da-4e25-aea6-27acfe8115d7'),
	(13,'craft','m151002_095935_volume_cache_settings','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','6bde3bc1-bc46-419c-89e8-8056805e1dab'),
	(14,'craft','m151005_142750_volume_s3_storage_settings','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','632994ce-8dcf-40a3-8c63-f6dee05c3c13'),
	(15,'craft','m151016_133600_delete_asset_thumbnails','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','baf7ed68-b67c-4f57-9d58-ccfb866c1849'),
	(16,'craft','m151209_000000_move_logo','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','6276d58a-3045-40a6-b116-8cd977560d47'),
	(17,'craft','m151211_000000_rename_fileId_to_assetId','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','73430159-f7eb-49b7-a541-7375724a3c49'),
	(18,'craft','m151215_000000_rename_asset_permissions','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','61a1f8d1-1e89-444a-9bc8-6d3790f677c6'),
	(19,'craft','m160707_000001_rename_richtext_assetsource_setting','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','de74a221-8425-4754-85a3-bd5d7d6faddb'),
	(20,'craft','m160708_185142_volume_hasUrls_setting','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','56b170c3-8b06-46a3-9022-1c81ab8d1d22'),
	(21,'craft','m160714_000000_increase_max_asset_filesize','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','959d9a8f-22de-4653-b586-a689381de9da'),
	(22,'craft','m160727_194637_column_cleanup','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','c92e232c-103f-4eec-85f4-e22de8652094'),
	(23,'craft','m160804_110002_userphotos_to_assets','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','6c6dfbe7-534b-4d39-8115-2a0305489ad1'),
	(24,'craft','m160807_144858_sites','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','4d2aca36-972b-4ca0-bb5b-fe01edc32a15'),
	(25,'craft','m160829_000000_pending_user_content_cleanup','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','bea0e487-a574-4494-981e-942ade25bd80'),
	(26,'craft','m160830_000000_asset_index_uri_increase','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','0828985d-2e59-441d-b577-84c987ecdada'),
	(27,'craft','m160912_230520_require_entry_type_id','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','798d62a4-7703-42fa-9716-5a450f74612b'),
	(28,'craft','m160913_134730_require_matrix_block_type_id','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','9d23a5cf-64cb-44c7-a0ce-d8ade87161fe'),
	(29,'craft','m160920_174553_matrixblocks_owner_site_id_nullable','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','6c1c3e83-96fc-4f1a-8e36-2428715e27aa'),
	(30,'craft','m160920_231045_usergroup_handle_title_unique','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','25747dde-c1bc-437d-aea8-ec23e836baa8'),
	(31,'craft','m160925_113941_route_uri_parts','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','9407da82-fc6f-4d41-9ad3-0007ffa77896'),
	(32,'craft','m161006_205918_schemaVersion_not_null','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','9fef2e54-0b37-4c59-807e-56c63a8a08a3'),
	(33,'craft','m161007_130653_update_email_settings','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','03a7657f-88f4-4f8f-862f-106636451353'),
	(34,'craft','m161013_175052_newParentId','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','b69435c9-0074-4e2a-b9a2-95f687b42fa2'),
	(35,'craft','m161021_102916_fix_recent_entries_widgets','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','9cbea828-2580-4286-82f4-8003f415d73d'),
	(36,'craft','m161021_182140_rename_get_help_widget','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','b4b61c1e-7882-4e94-b9ff-1cd539466cff'),
	(37,'craft','m161025_000000_fix_char_columns','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','a897f76e-ffe1-458a-8235-3c5171dd6e6c'),
	(38,'craft','m161029_124145_email_message_languages','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','67dcccd3-46be-4460-88e0-bdb95b2637fd'),
	(39,'craft','m161108_000000_new_version_format','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','464b9a02-33c7-47d9-9ae3-2120b59d859a'),
	(40,'craft','m161109_000000_index_shuffle','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','796c0e96-e020-42fd-988c-19833a3458b8'),
	(41,'craft','m161122_185500_no_craft_app','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','7be90adf-611f-43d4-a593-b7a0d80cc160'),
	(42,'craft','m161125_150752_clear_urlmanager_cache','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','99f75ede-0d9b-40d7-8e29-646d624826bc'),
	(43,'craft','m161220_000000_volumes_hasurl_notnull','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','669acb9a-36ad-4166-9d7b-887d5bbab772'),
	(44,'craft','m170114_161144_udates_permission','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','472f7e28-91fb-4173-9350-e03dc3caf732'),
	(45,'craft','m170120_000000_schema_cleanup','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','151047f1-be93-45f8-a573-079e87e65a20'),
	(46,'craft','m170126_000000_assets_focal_point','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','5aa2521e-a5d5-440b-910b-26ba5f353fef'),
	(47,'craft','m170206_142126_system_name','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','65661755-f042-417b-9b05-b7ef63aa1949'),
	(48,'craft','m170217_044740_category_branch_limits','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','c6b7f502-6e9e-4f33-9b3f-e9f231613053'),
	(49,'craft','m170217_120224_asset_indexing_columns','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','8aa25de4-9442-424c-8189-9d7019bd5423'),
	(50,'craft','m170223_224012_plain_text_settings','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','c775df9d-5da0-4509-8bf7-63f28c97d0d5'),
	(51,'craft','m170227_120814_focal_point_percentage','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','658b715e-9959-4ffd-a16f-4747309b6da8'),
	(52,'craft','m170228_171113_system_messages','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','8eae9d6f-e09e-430e-b3dd-3d0f2c64c0fc'),
	(53,'craft','m170303_140500_asset_field_source_settings','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','9bb30dd6-2cf2-4235-aba8-18344be7c9f4'),
	(54,'craft','m170306_150500_asset_temporary_uploads','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','e5414b74-f734-42c0-aa50-c9c2730f408f'),
	(55,'craft','m170523_190652_element_field_layout_ids','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','e10440d1-43f7-4407-ac1b-26b9813a2a33'),
	(56,'craft','m170621_195237_format_plugin_handles','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','64e823e4-46d2-4f22-9126-d13525733a58'),
	(57,'craft','m170630_161027_deprecation_line_nullable','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','3f85fb6a-60df-4e34-9cd2-caa19a5efdf9'),
	(58,'craft','m170630_161028_deprecation_changes','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','dc59c0ec-6348-4347-8f09-61a074164bd7'),
	(59,'craft','m170703_181539_plugins_table_tweaks','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','d0bff474-2134-44eb-8649-cde35cf5805a'),
	(60,'craft','m170704_134916_sites_tables','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','9f63ed32-ced4-40f3-b3a8-88e993c9949b'),
	(61,'craft','m170706_183216_rename_sequences','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','bddfd947-189e-4786-90f7-8fff412e9a48'),
	(62,'craft','m170707_094758_delete_compiled_traits','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','daf30d5c-8a42-4382-bdaa-cb61f2d6f8c4'),
	(63,'craft','m170731_190138_drop_asset_packagist','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','e696fc5f-4878-4389-bb4e-7d36f73950ef'),
	(64,'craft','m170810_201318_create_queue_table','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','ae00f14f-c576-48d7-ba12-5cc23a105257'),
	(65,'craft','m170903_192801_longblob_for_queue_jobs','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','fc609f03-160b-4e59-a383-d0ef2dfe8bf7'),
	(66,'craft','m170914_204621_asset_cache_shuffle','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','ca4c841d-b82d-4afc-b93d-4b10e5478d6d'),
	(67,'craft','m171011_214115_site_groups','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','4e4d90a6-c898-4f2e-8fbe-2d2cd7dd61f8'),
	(68,'craft','m171012_151440_primary_site','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','56b3dd31-2f77-46a1-b234-21cb06ea186e'),
	(69,'craft','m171013_142500_transform_interlace','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','a73c5d34-d1d4-4256-93aa-fd531bd8b3f6'),
	(70,'craft','m171016_092553_drop_position_select','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','f2754b75-00f9-4a3f-9374-6d4254b88cd6'),
	(71,'craft','m171016_221244_less_strict_translation_method','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','cdb5104e-de88-47bd-ab21-f81bfc47322d'),
	(72,'craft','m171107_000000_assign_group_permissions','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','b0e1552c-58fb-4890-aab9-e3184b072487'),
	(73,'craft','m171117_000001_templatecache_index_tune','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','7753df55-8cb5-4b3b-aa67-96317ec26b15'),
	(74,'craft','m171126_105927_disabled_plugins','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','88c7f39d-4343-40c4-93c1-dba5f0661ec4'),
	(75,'craft','m171130_214407_craftidtokens_table','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','b1126793-d1b9-4966-8ace-bb6f40e5aeee'),
	(76,'craft','m171202_004225_update_email_settings','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','04081140-2489-4cbe-831c-a24b40173fbd'),
	(77,'craft','m171204_000001_templatecache_index_tune_deux','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','064a93e9-5dae-4783-a350-c6597f0dd468'),
	(78,'craft','m171205_130908_remove_craftidtokens_refreshtoken_column','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','2b20a4ba-ca2a-42fd-b21f-db7a66ffa451'),
	(79,'craft','m171218_143135_longtext_query_column','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','665fe5e4-c0cb-46a9-9e70-ba4f89767487'),
	(80,'craft','m171231_055546_environment_variables_to_aliases','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','b8e401d1-a2ca-42e3-8a7a-eb389f0253d1'),
	(81,'craft','m180113_153740_drop_users_archived_column','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','b02bd08d-b2ac-4dbb-bdcc-5186d3edb073'),
	(82,'craft','m180122_213433_propagate_entries_setting','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','7beeab57-ebe0-430e-83ff-8ec777518ed5'),
	(83,'craft','m180124_230459_fix_propagate_entries_values','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','662d5988-ba21-4a21-9d28-71ee85b82ced'),
	(84,'craft','m180128_235202_set_tag_slugs','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','fe14b1fa-6500-457d-8ca0-38c6cd0c1f28'),
	(85,'craft','m180202_185551_fix_focal_points','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','7cee000b-f9b5-4f80-af2d-df968ffad648'),
	(86,'craft','m180217_172123_tiny_ints','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','d4467e0e-7aa0-4de7-a1c8-e09d1bc118aa'),
	(87,'craft','m180321_233505_small_ints','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','b8653257-c2b8-48b8-ad64-3e968ec6c835'),
	(88,'craft','m180404_182320_edition_changes','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','9d1817b1-586d-4957-baf6-ffc15c06c180'),
	(89,'craft','m180411_102218_fix_db_routes','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','d3f5e893-7f45-4f15-9784-149d44c5b7b7'),
	(90,'craft','m180416_205628_resourcepaths_table','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','7d976b4a-d542-4813-97b5-c9f430263860'),
	(91,'craft','m180418_205713_widget_cleanup','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','d4c52251-4332-4b8b-ad8b-8b63305971f1'),
	(92,'craft','m180425_203349_searchable_fields','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','a85a9ced-202e-4d14-80f2-8a3eeb5e1bf1'),
	(93,'craft','m180516_153000_uids_in_field_settings','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','f4ee9370-8dee-4ddc-8a7b-54a92853500d'),
	(94,'craft','m180517_173000_user_photo_volume_to_uid','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','12fc4e07-9c97-45c4-b80f-02cdaef71c04'),
	(95,'craft','m180518_173000_permissions_to_uid','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','ba01719e-b91f-4021-9b41-859ad80f7f81'),
	(96,'craft','m180520_173000_matrix_context_to_uids','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','8dc0d1f0-31bb-464b-aabd-8acbb4154531'),
	(97,'craft','m180521_172900_project_config_table','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','6b599689-7419-4038-823d-c4aa5d338c3a'),
	(98,'craft','m180521_173000_initial_yml_and_snapshot','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','c70c0345-7225-408c-b951-3c8ef7a44d14'),
	(99,'craft','m180731_162030_soft_delete_sites','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','dbd13446-a7b4-4038-bb10-0355c91ea26c'),
	(100,'craft','m180810_214427_soft_delete_field_layouts','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','7ba5c9d2-b15c-42c8-ba7d-0854b4148da1'),
	(101,'craft','m180810_214439_soft_delete_elements','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','8ab842a2-8031-40a6-9361-35b00c2da409'),
	(102,'craft','m180824_193422_case_sensitivity_fixes','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','ca3083e8-2521-4b4d-990f-e177e1cdc18f'),
	(103,'craft','m180901_151639_fix_matrixcontent_tables','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','a3c1d0e3-ed38-43d7-893e-1376ef246448'),
	(104,'craft','m180904_112109_permission_changes','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','ad0cf99e-6332-4852-9977-b1e030545bdb'),
	(105,'craft','m180910_142030_soft_delete_sitegroups','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','034cfb82-9f91-4918-b71c-8051fdef48c2'),
	(106,'craft','m181011_160000_soft_delete_asset_support','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','644c1cbb-538c-4dd3-8a1d-3c781f2a17fe'),
	(107,'craft','m181016_183648_set_default_user_settings','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','89902b1a-8d5e-4f31-9d15-02e146fe7aee'),
	(108,'craft','m181017_225222_system_config_settings','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','c2a6ec45-782c-4385-bdb1-97ea49afd2e9'),
	(109,'craft','m181018_222343_drop_userpermissions_from_config','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','3f75af7c-04f8-4590-9b9a-0f3f7d88e505'),
	(110,'craft','m181029_130000_add_transforms_routes_to_config','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','2336818c-6db2-4b5e-b9c9-4f8935b1e56d'),
	(111,'craft','m181112_203955_sequences_table','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','7c218f86-7687-486e-98e2-cda9dafb0913'),
	(112,'craft','m181121_001712_cleanup_field_configs','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','d1eb48a6-d878-47e5-9cf1-76a1c94fded8'),
	(113,'craft','m181128_193942_fix_project_config','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','0911ca88-d6fd-4ca0-9598-a992e2d53d8f'),
	(114,'craft','m181130_143040_fix_schema_version','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','6ef19994-83a9-46ba-9b79-417b7bb3d478'),
	(115,'craft','m181211_143040_fix_entry_type_uids','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','4ebda5eb-807b-428f-897e-7537fecedfdc'),
	(116,'craft','m181217_153000_fix_structure_uids','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','1e5e0e03-620d-4045-bccc-eb837abfd907'),
	(117,'craft','m190104_152725_store_licensed_plugin_editions','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','7d2caee4-f847-42f1-95e3-d4cea2eb98b5'),
	(118,'craft','m190108_110000_cleanup_project_config','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','cc5856f7-f129-40b2-9f36-323ea71797a0'),
	(119,'craft','m190108_113000_asset_field_setting_change','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','10c207b8-7356-47b0-8c11-178ec0bf0943'),
	(120,'craft','m190109_172845_fix_colspan','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','f7516775-605d-4471-b7da-e9a38230edcb'),
	(121,'craft','m190110_150000_prune_nonexisting_sites','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','33a0c176-234b-4248-975b-f59e64709837'),
	(122,'craft','m190110_214819_soft_delete_volumes','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','d2d048bf-cce2-4860-bfb9-f666ad145886'),
	(123,'craft','m190112_124737_fix_user_settings','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','bbbb65d7-c5bd-47d8-ad53-b74ad6d3da3c'),
	(124,'craft','m190112_131225_fix_field_layouts','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','a1b4b30b-8d60-46f4-97ac-013101f77c1c'),
	(125,'craft','m190112_201010_more_soft_deletes','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','bc7ab403-737a-4078-9443-d72ec3d2bcd0'),
	(126,'craft','m190114_143000_more_asset_field_setting_changes','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','7638e5d5-df29-4586-84b0-c98884f2a594'),
	(127,'craft','m190121_120000_rich_text_config_setting','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','31bc2678-e069-44b0-8371-038a86712c33'),
	(128,'craft','m190125_191628_fix_email_transport_password','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','14a43023-5e47-492d-8828-688ec135b079'),
	(129,'craft','m190128_181422_cleanup_volume_folders','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','708c1599-595d-4608-9577-1d009b9b3902'),
	(130,'craft','m190205_140000_fix_asset_soft_delete_index','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','ad3934de-6f41-46c4-b216-675464977c1d'),
	(131,'craft','m190218_143000_element_index_settings_uid','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','45cb4bab-3509-4ac1-9e9f-506d3572c84f'),
	(132,'craft','m190312_152740_element_revisions','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','50732ba8-c60d-4be3-841d-385758f5f8f7'),
	(133,'craft','m190327_235137_propagation_method','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','06effced-5c37-4668-97be-2899377a3b79'),
	(134,'craft','m190401_223843_drop_old_indexes','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','fdc2f7ba-e8cf-4328-8e18-b8a5540fb973'),
	(135,'craft','m190416_014525_drop_unique_global_indexes','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','19943ac3-f51b-4e94-8b1a-0a62fc77e911'),
	(136,'craft','m190417_085010_add_image_editor_permissions','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','4472a473-01e0-4c16-b562-62ea2198afb5'),
	(137,'craft','m190502_122019_store_default_user_group_uid','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','018a628c-9d20-4c7f-9008-70de20fe922b'),
	(138,'craft','m190504_150349_preview_targets','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','5218e9b9-3eb5-48a3-9c63-fd53181ad4cb'),
	(139,'craft','m190516_184711_job_progress_label','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','669e0b03-a95b-4d87-a56a-1ccbd0ee0f8d'),
	(140,'craft','m190523_190303_optional_revision_creators','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','a7dbf8da-42f8-4c1d-8fb0-43cc2c635e90'),
	(141,'craft','m190529_204501_fix_duplicate_uids','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','c16213a7-540d-4c4e-bd23-65ce341c0c29'),
	(142,'craft','m190605_223807_unsaved_drafts','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','eb7c22dd-9643-4a2f-8747-9c1ae95dd993'),
	(143,'craft','m190607_230042_entry_revision_error_tables','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','9973319e-0009-4cc8-a47e-b66538b537a7'),
	(144,'craft','m190608_033429_drop_elements_uid_idx','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','b59cc257-267d-4667-b86b-2441e0ccd950'),
	(145,'craft','m190617_164400_add_gqlschemas_table','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','f8a999f4-01db-48ab-8ae7-f754ce49d941'),
	(146,'craft','m190624_234204_matrix_propagation_method','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','8d7f8dea-9fe0-4d4f-8335-8a2acc0ef413'),
	(147,'craft','m190711_153020_drop_snapshots','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','9b641e76-772c-4234-bfb6-bf872904de59'),
	(148,'craft','m190712_195914_no_draft_revisions','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','e8e6848e-296f-41c5-ba83-31cbe5b5dae0'),
	(149,'craft','m190723_140314_fix_preview_targets_column','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','004abf37-2f95-440f-858f-38cae66bc5e8'),
	(150,'craft','m190820_003519_flush_compiled_templates','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','c57b96a2-be48-4d7b-96b0-31951246f471'),
	(151,'craft','m190823_020339_optional_draft_creators','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','a0f2b255-c97f-4529-af87-0a63b3533abb'),
	(152,'craft','m190913_152146_update_preview_targets','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','1e2ef38e-46cf-4641-9dae-33e2493cff20'),
	(153,'craft','m191107_122000_add_gql_project_config_support','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','2414d6e6-1b30-4c2d-9398-4b188fa08eda'),
	(154,'craft','m191204_085100_pack_savable_component_settings','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','e5e0f90c-00c6-497b-a6d2-54898833d1a6'),
	(155,'craft','m191206_001148_change_tracking','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','7b0ab1cd-7d89-4065-81c3-499f91eea05f'),
	(156,'craft','m191216_191635_asset_upload_tracking','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','36ed4c6f-0d6c-4988-92c3-4717f1b2ea7b'),
	(157,'craft','m191222_002848_peer_asset_permissions','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','88a12458-99a9-4aab-8c45-4ad1533f64fb'),
	(158,'craft','m200127_172522_queue_channels','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','9573a98c-3253-4370-b19e-05eb229c6967'),
	(159,'craft','m200211_175048_truncate_element_query_cache','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','32f1b253-b77c-4cfb-b4d3-041d93578325'),
	(160,'craft','m200213_172522_new_elements_index','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','f5cc7f65-124a-4dd1-ac57-cf51cde85653'),
	(161,'craft','m200228_195211_long_deprecation_messages','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','4c6269b7-8ebc-4516-ae42-bee6668a2bb0'),
	(162,'craft','m200306_054652_disabled_sites','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','fb94823d-709a-4ef7-85fb-c57d59cb679c'),
	(163,'craft','m200522_191453_clear_template_caches','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','eb8092c1-aad9-4344-87db-10c5dba35dd4'),
	(164,'craft','m200606_231117_migration_tracks','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','c2a343d8-161d-4490-926b-695479f09a26'),
	(165,'craft','m200619_215137_title_translation_method','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','0bf76d26-f6c8-4e3a-843e-2e0e7f9aa201'),
	(166,'craft','m200620_005028_user_group_descriptions','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','e1309ddc-7620-4f05-b751-6af77ae1c769'),
	(167,'craft','m200620_230205_field_layout_changes','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','9c75bda4-22aa-4989-90bb-97350d6685d3'),
	(168,'craft','m200625_131100_move_entrytypes_to_top_project_config','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','56af6823-035d-414d-ba66-1275927c1abb'),
	(169,'craft','m200629_112700_remove_project_config_legacy_files','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','b7637417-63bd-45b8-9296-8b193a162564'),
	(170,'craft','m200630_183000_drop_configmap','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','d0632a47-85b2-4535-8980-7701ca3e1f6d'),
	(171,'craft','m200715_113400_transform_index_error_flag','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','ca1b3b88-909a-43de-8202-e4feb9f25d93'),
	(172,'craft','m200716_110900_replace_file_asset_permissions','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','8abda7d0-fc3a-4000-9866-dd65c5033f64'),
	(173,'craft','m200716_153800_public_token_settings_in_project_config','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','42811e5a-652e-49f7-9ff9-ad87df676ec3'),
	(174,'craft','m200720_175543_drop_unique_constraints','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','4e44df87-31a3-49fe-b5b6-c16177109f36'),
	(175,'craft','m200825_051217_project_config_version','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','1b730e0e-6033-494f-a182-44fc0bd3455e'),
	(176,'craft','m201116_190500_asset_title_translation_method','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','da8f6e03-7073-41e5-b934-39f6bbe9a38f'),
	(177,'craft','m201124_003555_plugin_trials','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','1f310da3-7a8e-4cfa-a4d0-7be5f0513965'),
	(178,'craft','m210209_135503_soft_delete_field_groups','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','a67e4fd7-fcbd-43d4-97fd-26de63be6f80'),
	(179,'craft','m210212_223539_delete_invalid_drafts','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','058bc87f-28d0-4ab3-a494-a89bb770d023'),
	(180,'craft','m210214_202731_track_saved_drafts','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','942277dc-1b6f-440c-87f5-abea929e3a4f'),
	(181,'craft','m210223_150900_add_new_element_gql_schema_components','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','1474edd6-ba13-4d9f-8350-368a8ba2519a'),
	(182,'craft','m210302_212318_canonical_elements','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','4031922a-c3f7-49f0-b91f-68d2a07b7b83'),
	(183,'craft','m210326_132000_invalidate_projectconfig_cache','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','4bf5cc68-e034-4448-91ab-0c12615db849'),
	(184,'craft','m210329_214847_field_column_suffixes','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','3210a787-d82a-4655-91f3-ddfb88f7f0e5'),
	(185,'craft','m210331_220322_null_author','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','1c671832-e168-4a73-9857-7d9c08918628'),
	(186,'craft','m210405_231315_provisional_drafts','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','3c7e545d-7722-4e4c-9528-9693939bfc27'),
	(187,'craft','m210602_111300_project_config_names_in_config','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','3fb4d457-8511-4ff1-9553-050bc3c0fe8a'),
	(188,'craft','m210611_233510_default_placement_settings','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','f9f15f56-435f-45c9-abc2-5c07bd6d4211'),
	(189,'craft','m210613_145522_sortable_global_sets','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','b5ceadb0-f5fb-4db1-b4d6-99d69ea5c933'),
	(190,'craft','m210613_184103_announcements','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','59bd58da-1d3e-4656-905e-57045028ef87'),
	(191,'craft','m210829_000000_element_index_tweak','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','9644f3e5-c247-4295-8b8d-1c3a95563926'),
	(192,'craft','m220209_095604_add_indexes','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','88e902dc-cfc4-41b2-9324-56a50a7fc86c'),
	(193,'craft','m220214_000000_truncate_sessions','2022-08-11 16:15:39','2022-08-11 16:15:39','2022-08-11 16:15:39','24254497-688e-4563-8cbc-bc8260239ef2'),
	(194,'plugin:freeform','Install','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','8d0bf773-e9ac-4326-b60b-0722f0816c43'),
	(195,'plugin:freeform','m180120_140521_CraftUpgrade','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','c0475b92-1119-4c0d-9545-0a472878f211'),
	(196,'plugin:freeform','m180125_124339_UpdateForeignKeyNames','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','98b473c1-1ee7-402c-9b71-86fcd0179549'),
	(197,'plugin:freeform','m180214_094247_AddUniqueTokenToSubmissionsAndForms','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','5f9b4ae5-61c6-4398-a4b5-b218f6bc57dd'),
	(198,'plugin:freeform','m180220_072652_ChangeFileUploadFieldColumnType','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','b979d046-92a0-4466-b126-67d43cc95290'),
	(199,'plugin:freeform','m180326_094124_AddIsSpamToSubmissions','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','e88c4273-4015-42dd-bee7-2d9e090f1f8a'),
	(200,'plugin:freeform','m180405_101920_AddIpAddressToSubmissions','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','bc2135f7-6ebf-4a6e-9bcf-f01bc991ae26'),
	(201,'plugin:freeform','m180410_131206_CreateIntegrationsQueue','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','abefd476-66bd-4852-acdc-f7dcb290ec8d'),
	(202,'plugin:freeform','m180417_134527_AddMultipleSelectTypeToFields','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','77b6949f-7568-41a5-b280-3510081c846e'),
	(203,'plugin:freeform','m180430_151626_PaymentGateways','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','a37c5392-38e9-4888-bf2e-f399d686ad86'),
	(204,'plugin:freeform','m180508_095131_CreatePaymentGatewayFieldsTable','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','1c8f2546-862a-492a-9b59-bc0f7e286625'),
	(205,'plugin:freeform','m180606_141402_AddConnectionsToFormProperties','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','d19b2554-2925-485a-8b6c-943d5f61a944'),
	(206,'plugin:freeform','m180730_171628_AddCcDetailsFieldType','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','2af0bc71-99b5-4db0-b9f2-0c47b9f54160'),
	(207,'plugin:freeform','m180817_091801_AddRulesToFormProperties','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','21da069b-0f80-47a8-a3e1-fd5cd8bec1f3'),
	(208,'plugin:freeform','m181112_152751_ChangeTypeEnumColumnsToIndexedText','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','dc733152-c6b6-444d-a994-c3a36c49b6a0'),
	(209,'plugin:freeform','m181129_083939_ChangeIntegrationFieldTypeColumnTypeToString','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','7a86b86e-ad06-4cba-b46b-34bfef93499f'),
	(210,'plugin:freeform','m190501_124050_MergingEditionsMigration','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','627dd743-edb4-49bd-b0dd-143aa558f575'),
	(211,'plugin:freeform','m190502_155557_AddCCAndBCCToEmailNotifications','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','6229e44b-d6e0-42b1-9312-a83277a6f2d8'),
	(212,'plugin:freeform','m190516_085150_AddPresetAssetsToNotifications','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','aa8a8f7d-6660-4f91-9e73-522f586142b0'),
	(213,'plugin:freeform','m190529_135307_AddWebhookTables','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','cb9cf3a1-82db-4409-b975-c16ad26d86c8'),
	(214,'plugin:freeform','m190603_160423_UpgradeFreeformHoneypotEnhancement','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','0044cda2-1c82-42ef-9acf-7dde5d3d40bf'),
	(215,'plugin:freeform','m190604_125112_AddFormLimitSubmissionProperty','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','093e0e52-45b1-43c7-b45c-ed2f7f3286d7'),
	(216,'plugin:freeform','m190610_074840_MigrateScriptInsertLocation','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','30eee37c-c9e6-4ac6-841e-74e155fc553a'),
	(217,'plugin:freeform','m190614_103420_AddMissingMetaColumnsToProAndPaymentTables','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','a7d82dbf-b789-4d93-86f1-2d7b30d14bdf'),
	(218,'plugin:freeform','m190617_122427_RemoveBrokenForeignKeys','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','8e882d54-1d2b-4eda-9534-f26062f58ffe'),
	(219,'plugin:freeform','m190618_142759_AddFixedForeignKeys','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','04af1edf-5345-42e1-96c4-61321590c58e'),
	(220,'plugin:freeform','m190812_125059_AddNotesTable','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','2b27ffaf-ab1d-43b6-abb2-78eaf26b0bad'),
	(221,'plugin:freeform','m190905_113428_FixIntervalCountNotNullColumn','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','c0d2ebd2-aec3-4158-bb95-74354624fc84'),
	(222,'plugin:freeform','m191214_093453_AddExtraPostUrlColumnToForm','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','badf7c04-9e0e-4478-ae35-5913cd4ef2b4'),
	(223,'plugin:freeform','m200203_180318_AddSpamReasonTable','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','01435113-8a3b-4ee6-8e21-eb25858e2c1b'),
	(224,'plugin:freeform','m200214_083115_FixIntegrationQueueIndex','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','8bb60609-7d60-4657-a579-f0b2b0614b22'),
	(225,'plugin:freeform','m200616_143808_FormPermissionsUpdate','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','5ecab172-4378-46ae-ac73-c3d68c97ef91'),
	(226,'plugin:freeform','m200630_103347_IncreaseExportProfileSettingSize','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','6dcccacf-c844-4ec9-86a1-28ea422a559c'),
	(227,'plugin:freeform','m200825_124009_SplitPipedriveIntegrationIntoDealsAndLeads','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','ecfa65d7-308f-4bc8-aab3-b3bffd0733ff'),
	(228,'plugin:freeform','m200907_081059_AddValidationToFormProperties','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','d2eeaf9c-4702-4bf3-9d30-0649815ec369'),
	(229,'plugin:freeform','m200911_130215_AddReplyToNameToNotifications','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','74f1f3e9-9d8f-4a1f-b812-c7ac6180ce2f'),
	(230,'plugin:freeform','m201006_065315_AddFeedTables','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','4a6bc976-aba1-4aa1-82d7-c459d1ddb78a'),
	(231,'plugin:freeform','m201014_161213_AddFormSortOrder','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','651efdcb-5176-41b0-9a8f-0b8ddc1dcdd6'),
	(232,'plugin:freeform','m201027_103933_AddExportProfileDateRanges','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','ef55d115-fd5a-4c52-90fa-6625329cd668'),
	(233,'plugin:freeform','m201209_162655_AddAutoTextColumnToNotifications','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','b5ba2426-aae1-4cd6-abe0-674d02d2627e'),
	(234,'plugin:freeform','m210105_145259_AddGoogleTagManagerColumnsToForms','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','418f2499-69b0-42c8-81ed-07d2540fa697'),
	(235,'plugin:freeform','m210527_071651_AddDbSessionStorage','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','e5e23520-b8f9-4756-894f-d3291d7c2874'),
	(236,'plugin:freeform','m210609_183655_AddContextToUnfinalizedFiles','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','d80fbf8a-3d5a-4914-b3c7-50270dd4c0fe'),
	(237,'plugin:freeform','m210629_172132_AddDateIndexToLockTable','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','8197e9da-6b1f-44ce-ab29-7e75b32e2833'),
	(238,'plugin:freeform','m210923_110033_AddSavedFormsTable','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','1ab5868c-96d2-4073-86d6-2f387ff4824b'),
	(239,'plugin:freeform','m211109_144235_RemoveContextFromUnfinalizedAssets','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','0d9ec604-139c-4f35-841b-5b0da5462b31'),
	(240,'plugin:freeform','m211227_140312_AddFormTypes','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','c26a036e-ae04-41ed-b7c3-5961e9b785fe'),
	(241,'plugin:freeform','m220121_091429_AddUserIdToSubmissions','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','71f53575-15b4-49e9-a67d-9e96a6b35c65'),
	(242,'plugin:freeform','m220304_101448_ChangeAccessTokenColumnType','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','0f3b95e7-bf21-492c-aa89-4373783a15de'),
	(243,'plugin:freeform','m220422_065929_AddExportNotificationsTable','2022-08-11 16:52:04','2022-08-11 16:52:04','2022-08-11 16:52:04','7df270eb-7f2c-4ab6-8444-d58e3f39337b');

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table plugins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `plugins`;

CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ksqscxhabtxhhnxmvswfcxsaoanucshilzje` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;

INSERT INTO `plugins` (`id`, `handle`, `version`, `schemaVersion`, `licenseKeyStatus`, `licensedEdition`, `installDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'freeform','3.13.17','3.6.4','trial',NULL,'2022-08-11 16:52:03','2022-08-11 16:52:03','2022-08-15 20:32:55','c769c98b-6f0b-46db-8b7a-22d38e81a759'),
	(2,'sendgrid','1.3.1','1.0.0','unknown',NULL,'2022-08-11 20:08:41','2022-08-11 20:08:41','2022-08-15 20:32:55','cdaf9d9c-9c67-4186-9790-f102a3feed71'),
	(3,'twigpack','1.2.17','1.0.0','unknown',NULL,'2022-08-12 22:25:32','2022-08-12 22:25:32','2022-08-15 20:32:55','abe8128f-8161-4acd-8a11-d9877eee2787');

/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table projectconfig
# ------------------------------------------------------------

DROP TABLE IF EXISTS `projectconfig`;

CREATE TABLE `projectconfig` (
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;

INSERT INTO `projectconfig` (`path`, `value`)
VALUES
	('dateModified','1660437436'),
	('email.fromEmail','\"jvargas@conversionia.com\"'),
	('email.fromName','\"Conversion-assesment\"'),
	('email.replyToEmail','null'),
	('email.template','\"\"'),
	('email.transportSettings.apiKey','\"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\"'),
	('email.transportSettings.categories','\"\"'),
	('email.transportType','\"putyourlightson\\\\sendgrid\\\\mail\\\\SendgridAdapter\"'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.fieldLayouts.26e0e8d7-45c7-4ca0-9e43-d5073fdf403c.tabs.0.elements.0.autocapitalize','true'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.fieldLayouts.26e0e8d7-45c7-4ca0-9e43-d5073fdf403c.tabs.0.elements.0.autocomplete','false'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.fieldLayouts.26e0e8d7-45c7-4ca0-9e43-d5073fdf403c.tabs.0.elements.0.autocorrect','true'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.fieldLayouts.26e0e8d7-45c7-4ca0-9e43-d5073fdf403c.tabs.0.elements.0.class','null'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.fieldLayouts.26e0e8d7-45c7-4ca0-9e43-d5073fdf403c.tabs.0.elements.0.disabled','false'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.fieldLayouts.26e0e8d7-45c7-4ca0-9e43-d5073fdf403c.tabs.0.elements.0.id','null'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.fieldLayouts.26e0e8d7-45c7-4ca0-9e43-d5073fdf403c.tabs.0.elements.0.instructions','null'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.fieldLayouts.26e0e8d7-45c7-4ca0-9e43-d5073fdf403c.tabs.0.elements.0.label','null'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.fieldLayouts.26e0e8d7-45c7-4ca0-9e43-d5073fdf403c.tabs.0.elements.0.max','null'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.fieldLayouts.26e0e8d7-45c7-4ca0-9e43-d5073fdf403c.tabs.0.elements.0.min','null'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.fieldLayouts.26e0e8d7-45c7-4ca0-9e43-d5073fdf403c.tabs.0.elements.0.name','null'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.fieldLayouts.26e0e8d7-45c7-4ca0-9e43-d5073fdf403c.tabs.0.elements.0.orientation','null'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.fieldLayouts.26e0e8d7-45c7-4ca0-9e43-d5073fdf403c.tabs.0.elements.0.placeholder','null'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.fieldLayouts.26e0e8d7-45c7-4ca0-9e43-d5073fdf403c.tabs.0.elements.0.readonly','false'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.fieldLayouts.26e0e8d7-45c7-4ca0-9e43-d5073fdf403c.tabs.0.elements.0.requirable','false'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.fieldLayouts.26e0e8d7-45c7-4ca0-9e43-d5073fdf403c.tabs.0.elements.0.size','null'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.fieldLayouts.26e0e8d7-45c7-4ca0-9e43-d5073fdf403c.tabs.0.elements.0.step','null'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.fieldLayouts.26e0e8d7-45c7-4ca0-9e43-d5073fdf403c.tabs.0.elements.0.tip','null'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.fieldLayouts.26e0e8d7-45c7-4ca0-9e43-d5073fdf403c.tabs.0.elements.0.title','null'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.fieldLayouts.26e0e8d7-45c7-4ca0-9e43-d5073fdf403c.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.fieldLayouts.26e0e8d7-45c7-4ca0-9e43-d5073fdf403c.tabs.0.elements.0.warning','null'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.fieldLayouts.26e0e8d7-45c7-4ca0-9e43-d5073fdf403c.tabs.0.elements.0.width','100'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.fieldLayouts.26e0e8d7-45c7-4ca0-9e43-d5073fdf403c.tabs.0.elements.1.fieldUid','\"1efe2a80-8045-41dd-ae04-8e64b18f4f03\"'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.fieldLayouts.26e0e8d7-45c7-4ca0-9e43-d5073fdf403c.tabs.0.elements.1.instructions','null'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.fieldLayouts.26e0e8d7-45c7-4ca0-9e43-d5073fdf403c.tabs.0.elements.1.label','null'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.fieldLayouts.26e0e8d7-45c7-4ca0-9e43-d5073fdf403c.tabs.0.elements.1.required','false'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.fieldLayouts.26e0e8d7-45c7-4ca0-9e43-d5073fdf403c.tabs.0.elements.1.tip','null'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.fieldLayouts.26e0e8d7-45c7-4ca0-9e43-d5073fdf403c.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.fieldLayouts.26e0e8d7-45c7-4ca0-9e43-d5073fdf403c.tabs.0.elements.1.warning','null'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.fieldLayouts.26e0e8d7-45c7-4ca0-9e43-d5073fdf403c.tabs.0.elements.1.width','100'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.fieldLayouts.26e0e8d7-45c7-4ca0-9e43-d5073fdf403c.tabs.0.name','\"Content\"'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.fieldLayouts.26e0e8d7-45c7-4ca0-9e43-d5073fdf403c.tabs.0.sortOrder','1'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.handle','\"homepage\"'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.hasTitleField','false'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.name','\"Homepage\"'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.section','\"15fcc23c-612d-4709-bd3c-6736f6d76d1e\"'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.sortOrder','1'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.titleFormat','\"{section.name|raw}\"'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.titleTranslationKeyFormat','null'),
	('entryTypes.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae.titleTranslationMethod','\"site\"'),
	('fieldGroups.f57762b0-c0de-40bb-8373-43c2da606997.name','\"Common\"'),
	('fields.1efe2a80-8045-41dd-ae04-8e64b18f4f03.columnSuffix','null'),
	('fields.1efe2a80-8045-41dd-ae04-8e64b18f4f03.contentColumnType','\"string\"'),
	('fields.1efe2a80-8045-41dd-ae04-8e64b18f4f03.fieldGroup','\"f57762b0-c0de-40bb-8373-43c2da606997\"'),
	('fields.1efe2a80-8045-41dd-ae04-8e64b18f4f03.handle','\"slides\"'),
	('fields.1efe2a80-8045-41dd-ae04-8e64b18f4f03.instructions','\"\"'),
	('fields.1efe2a80-8045-41dd-ae04-8e64b18f4f03.name','\"Slides\"'),
	('fields.1efe2a80-8045-41dd-ae04-8e64b18f4f03.searchable','false'),
	('fields.1efe2a80-8045-41dd-ae04-8e64b18f4f03.settings.allowedKinds','null'),
	('fields.1efe2a80-8045-41dd-ae04-8e64b18f4f03.settings.allowSelfRelations','false'),
	('fields.1efe2a80-8045-41dd-ae04-8e64b18f4f03.settings.allowUploads','true'),
	('fields.1efe2a80-8045-41dd-ae04-8e64b18f4f03.settings.defaultUploadLocationSource','\"volume:274b5f37-481f-47df-8ece-a277e6d6a399\"'),
	('fields.1efe2a80-8045-41dd-ae04-8e64b18f4f03.settings.defaultUploadLocationSubpath','\"\"'),
	('fields.1efe2a80-8045-41dd-ae04-8e64b18f4f03.settings.limit','\"\"'),
	('fields.1efe2a80-8045-41dd-ae04-8e64b18f4f03.settings.localizeRelations','false'),
	('fields.1efe2a80-8045-41dd-ae04-8e64b18f4f03.settings.previewMode','\"full\"'),
	('fields.1efe2a80-8045-41dd-ae04-8e64b18f4f03.settings.restrictFiles','\"\"'),
	('fields.1efe2a80-8045-41dd-ae04-8e64b18f4f03.settings.selectionLabel','\"\"'),
	('fields.1efe2a80-8045-41dd-ae04-8e64b18f4f03.settings.showSiteMenu','true'),
	('fields.1efe2a80-8045-41dd-ae04-8e64b18f4f03.settings.showUnpermittedFiles','false'),
	('fields.1efe2a80-8045-41dd-ae04-8e64b18f4f03.settings.showUnpermittedVolumes','false'),
	('fields.1efe2a80-8045-41dd-ae04-8e64b18f4f03.settings.singleUploadLocationSource','\"volume:274b5f37-481f-47df-8ece-a277e6d6a399\"'),
	('fields.1efe2a80-8045-41dd-ae04-8e64b18f4f03.settings.singleUploadLocationSubpath','\"\"'),
	('fields.1efe2a80-8045-41dd-ae04-8e64b18f4f03.settings.source','null'),
	('fields.1efe2a80-8045-41dd-ae04-8e64b18f4f03.settings.sources','\"*\"'),
	('fields.1efe2a80-8045-41dd-ae04-8e64b18f4f03.settings.targetSiteId','null'),
	('fields.1efe2a80-8045-41dd-ae04-8e64b18f4f03.settings.useSingleFolder','false'),
	('fields.1efe2a80-8045-41dd-ae04-8e64b18f4f03.settings.validateRelatedElements','false'),
	('fields.1efe2a80-8045-41dd-ae04-8e64b18f4f03.settings.viewMode','\"list\"'),
	('fields.1efe2a80-8045-41dd-ae04-8e64b18f4f03.translationKeyFormat','null'),
	('fields.1efe2a80-8045-41dd-ae04-8e64b18f4f03.translationMethod','\"site\"'),
	('fields.1efe2a80-8045-41dd-ae04-8e64b18f4f03.type','\"craft\\\\fields\\\\Assets\"'),
	('fields.710c1936-f63d-4a3e-8ddd-1956d785b7ff.columnSuffix','\"ujcehzsb\"'),
	('fields.710c1936-f63d-4a3e-8ddd-1956d785b7ff.contentColumnType','\"text\"'),
	('fields.710c1936-f63d-4a3e-8ddd-1956d785b7ff.fieldGroup','\"f57762b0-c0de-40bb-8373-43c2da606997\"'),
	('fields.710c1936-f63d-4a3e-8ddd-1956d785b7ff.handle','\"text\"'),
	('fields.710c1936-f63d-4a3e-8ddd-1956d785b7ff.instructions','\"\"'),
	('fields.710c1936-f63d-4a3e-8ddd-1956d785b7ff.name','\"Text\"'),
	('fields.710c1936-f63d-4a3e-8ddd-1956d785b7ff.searchable','false'),
	('fields.710c1936-f63d-4a3e-8ddd-1956d785b7ff.settings.byteLimit','null'),
	('fields.710c1936-f63d-4a3e-8ddd-1956d785b7ff.settings.charLimit','null'),
	('fields.710c1936-f63d-4a3e-8ddd-1956d785b7ff.settings.code','\"\"'),
	('fields.710c1936-f63d-4a3e-8ddd-1956d785b7ff.settings.columnType','null'),
	('fields.710c1936-f63d-4a3e-8ddd-1956d785b7ff.settings.initialRows','\"4\"'),
	('fields.710c1936-f63d-4a3e-8ddd-1956d785b7ff.settings.multiline','\"\"'),
	('fields.710c1936-f63d-4a3e-8ddd-1956d785b7ff.settings.placeholder','null'),
	('fields.710c1936-f63d-4a3e-8ddd-1956d785b7ff.settings.uiMode','\"normal\"'),
	('fields.710c1936-f63d-4a3e-8ddd-1956d785b7ff.translationKeyFormat','null'),
	('fields.710c1936-f63d-4a3e-8ddd-1956d785b7ff.translationMethod','\"none\"'),
	('fields.710c1936-f63d-4a3e-8ddd-1956d785b7ff.type','\"craft\\\\fields\\\\PlainText\"'),
	('meta.__names__.15fcc23c-612d-4709-bd3c-6736f6d76d1e','\"Homepage\"'),
	('meta.__names__.1efe2a80-8045-41dd-ae04-8e64b18f4f03','\"Slides\"'),
	('meta.__names__.274b5f37-481f-47df-8ece-a277e6d6a399','\"Local\"'),
	('meta.__names__.4ce0c4e7-0ade-4470-9284-adfde6460ad0','\"Conversion-assesment\"'),
	('meta.__names__.710c1936-f63d-4a3e-8ddd-1956d785b7ff','\"Text\"'),
	('meta.__names__.dcaed4cd-b19b-4346-ae5d-ba0b781d29aa','\"Conversion-assesment\"'),
	('meta.__names__.e10d1e8b-f7b3-427c-9be7-0f5c2fa8daae','\"Homepage\"'),
	('meta.__names__.f57762b0-c0de-40bb-8373-43c2da606997','\"Common\"'),
	('plugins.freeform.edition','\"pro\"'),
	('plugins.freeform.enabled','true'),
	('plugins.freeform.licenseKey','\"OKR72XNQPV90FAC6AQA3UBL0\"'),
	('plugins.freeform.schemaVersion','\"3.6.4\"'),
	('plugins.freeform.settings.ajaxByDefault','true'),
	('plugins.freeform.settings.alertNotificationRecipients','null'),
	('plugins.freeform.settings.autoScroll','true'),
	('plugins.freeform.settings.autoScrollToErrors','true'),
	('plugins.freeform.settings.badgeType','\"all\"'),
	('plugins.freeform.settings.blockedEmails','null'),
	('plugins.freeform.settings.blockedEmailsError','\"Invalid Email Address\"'),
	('plugins.freeform.settings.blockedIpAddresses','null'),
	('plugins.freeform.settings.blockedKeywords','null'),
	('plugins.freeform.settings.blockedKeywordsError','\"Invalid Entry Data\"'),
	('plugins.freeform.settings.bypassSpamCheckOnLoggedInUsers','false'),
	('plugins.freeform.settings.clientDigestFrequency','1'),
	('plugins.freeform.settings.clientDigestRecipients','null'),
	('plugins.freeform.settings.customErrorMessage','null'),
	('plugins.freeform.settings.customHoneypotName','null'),
	('plugins.freeform.settings.defaultTemplates','true'),
	('plugins.freeform.settings.defaultView','\"dashboard\"'),
	('plugins.freeform.settings.digestFrequency','1'),
	('plugins.freeform.settings.digestOnlyOnProduction','false'),
	('plugins.freeform.settings.digestRecipients','null'),
	('plugins.freeform.settings.displayFeed','true'),
	('plugins.freeform.settings.emailTemplateDirectory','null'),
	('plugins.freeform.settings.emailTemplateStorage','\"db\"'),
	('plugins.freeform.settings.exportHandlesAsNames','false'),
	('plugins.freeform.settings.exportLabels','false'),
	('plugins.freeform.settings.fieldDisplayOrder','\"name\"'),
	('plugins.freeform.settings.fillWithGet','false'),
	('plugins.freeform.settings.footerScripts','false'),
	('plugins.freeform.settings.formattingTemplate','\"flexbox.html\"'),
	('plugins.freeform.settings.formFieldShowOnlyAllowedForms','false'),
	('plugins.freeform.settings.formSubmitDisable','true'),
	('plugins.freeform.settings.formSubmitExpiration','null'),
	('plugins.freeform.settings.formTemplateDirectory','null'),
	('plugins.freeform.settings.freeformHoneypot','true'),
	('plugins.freeform.settings.freeformHoneypotEnhancement','false'),
	('plugins.freeform.settings.hideBannerDemo','false'),
	('plugins.freeform.settings.hideBannerOldFreeform','false'),
	('plugins.freeform.settings.minimumSubmitTime','null'),
	('plugins.freeform.settings.pluginName','null'),
	('plugins.freeform.settings.purgableSpamAgeInDays','null'),
	('plugins.freeform.settings.purgableSubmissionAgeInDays','null'),
	('plugins.freeform.settings.purgableUnfinalizedAssetAgeInMinutes','180'),
	('plugins.freeform.settings.recaptchaBehaviour','\"display_error\"'),
	('plugins.freeform.settings.recaptchaEnabled','false'),
	('plugins.freeform.settings.recaptchaErrorMessage','\"Please verify that you are not a robot.\"'),
	('plugins.freeform.settings.recaptchaKey','null'),
	('plugins.freeform.settings.recaptchaLazyLoad','false'),
	('plugins.freeform.settings.recaptchaMinScore','0.5'),
	('plugins.freeform.settings.recaptchaSecret','null'),
	('plugins.freeform.settings.recaptchaSize','\"normal\"'),
	('plugins.freeform.settings.recaptchaTheme','\"light\"'),
	('plugins.freeform.settings.recaptchaType','\"v2_checkbox\"'),
	('plugins.freeform.settings.rememberPageSubmitOrder','true'),
	('plugins.freeform.settings.removeNewlines','false'),
	('plugins.freeform.settings.renderFormHtmlInCpViews','true'),
	('plugins.freeform.settings.salesforce_client_id','null'),
	('plugins.freeform.settings.salesforce_client_secret','null'),
	('plugins.freeform.settings.salesforce_password','null'),
	('plugins.freeform.settings.salesforce_username','null'),
	('plugins.freeform.settings.saveFormSessionLimit','10'),
	('plugins.freeform.settings.saveFormTtl','30'),
	('plugins.freeform.settings.scriptInsertLocation','\"footer\"'),
	('plugins.freeform.settings.scriptInsertType','\"pointers\"'),
	('plugins.freeform.settings.sessionContext','\"payload\"'),
	('plugins.freeform.settings.sessionContextCount','100'),
	('plugins.freeform.settings.sessionContextSecret','\"\"'),
	('plugins.freeform.settings.sessionContextTimeToLiveMinutes','180'),
	('plugins.freeform.settings.sessionEntryMaxCount','50'),
	('plugins.freeform.settings.sessionEntryTTL','10800'),
	('plugins.freeform.settings.showErrorsForBlockedEmails','false'),
	('plugins.freeform.settings.showErrorsForBlockedKeywords','false'),
	('plugins.freeform.settings.showTutorial','false'),
	('plugins.freeform.settings.spamFolderEnabled','true'),
	('plugins.freeform.settings.spamProtectionBehaviour','\"simulate_success\"'),
	('plugins.freeform.settings.submissionThrottlingCount','null'),
	('plugins.freeform.settings.submissionThrottlingTimeFrame','null'),
	('plugins.freeform.settings.successTemplateDirectory','null'),
	('plugins.freeform.settings.twigInHtml','true'),
	('plugins.freeform.settings.twigInHtmlIsolatedMode','true'),
	('plugins.freeform.settings.updateSearchIndexes','true'),
	('plugins.sendgrid.edition','\"standard\"'),
	('plugins.sendgrid.enabled','true'),
	('plugins.sendgrid.schemaVersion','\"1.0.0\"'),
	('plugins.twigpack.edition','\"standard\"'),
	('plugins.twigpack.enabled','true'),
	('plugins.twigpack.schemaVersion','\"1.0.0\"'),
	('sections.15fcc23c-612d-4709-bd3c-6736f6d76d1e.defaultPlacement','\"end\"'),
	('sections.15fcc23c-612d-4709-bd3c-6736f6d76d1e.enableVersioning','true'),
	('sections.15fcc23c-612d-4709-bd3c-6736f6d76d1e.handle','\"homepage\"'),
	('sections.15fcc23c-612d-4709-bd3c-6736f6d76d1e.name','\"Homepage\"'),
	('sections.15fcc23c-612d-4709-bd3c-6736f6d76d1e.previewTargets.0.__assoc__.0.0','\"label\"'),
	('sections.15fcc23c-612d-4709-bd3c-6736f6d76d1e.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),
	('sections.15fcc23c-612d-4709-bd3c-6736f6d76d1e.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),
	('sections.15fcc23c-612d-4709-bd3c-6736f6d76d1e.previewTargets.0.__assoc__.1.1','\"{url}\"'),
	('sections.15fcc23c-612d-4709-bd3c-6736f6d76d1e.previewTargets.0.__assoc__.2.0','\"refresh\"'),
	('sections.15fcc23c-612d-4709-bd3c-6736f6d76d1e.previewTargets.0.__assoc__.2.1','\"1\"'),
	('sections.15fcc23c-612d-4709-bd3c-6736f6d76d1e.propagationMethod','\"all\"'),
	('sections.15fcc23c-612d-4709-bd3c-6736f6d76d1e.siteSettings.dcaed4cd-b19b-4346-ae5d-ba0b781d29aa.enabledByDefault','true'),
	('sections.15fcc23c-612d-4709-bd3c-6736f6d76d1e.siteSettings.dcaed4cd-b19b-4346-ae5d-ba0b781d29aa.hasUrls','true'),
	('sections.15fcc23c-612d-4709-bd3c-6736f6d76d1e.siteSettings.dcaed4cd-b19b-4346-ae5d-ba0b781d29aa.template','\"index.twig\"'),
	('sections.15fcc23c-612d-4709-bd3c-6736f6d76d1e.siteSettings.dcaed4cd-b19b-4346-ae5d-ba0b781d29aa.uriFormat','\"__home__\"'),
	('sections.15fcc23c-612d-4709-bd3c-6736f6d76d1e.type','\"single\"'),
	('siteGroups.4ce0c4e7-0ade-4470-9284-adfde6460ad0.name','\"Conversion-assesment\"'),
	('sites.dcaed4cd-b19b-4346-ae5d-ba0b781d29aa.baseUrl','\"$PRIMARY_SITE_URL\"'),
	('sites.dcaed4cd-b19b-4346-ae5d-ba0b781d29aa.enabled','true'),
	('sites.dcaed4cd-b19b-4346-ae5d-ba0b781d29aa.handle','\"default\"'),
	('sites.dcaed4cd-b19b-4346-ae5d-ba0b781d29aa.hasUrls','true'),
	('sites.dcaed4cd-b19b-4346-ae5d-ba0b781d29aa.language','\"en-US\"'),
	('sites.dcaed4cd-b19b-4346-ae5d-ba0b781d29aa.name','\"Conversion-assesment\"'),
	('sites.dcaed4cd-b19b-4346-ae5d-ba0b781d29aa.primary','true'),
	('sites.dcaed4cd-b19b-4346-ae5d-ba0b781d29aa.siteGroup','\"4ce0c4e7-0ade-4470-9284-adfde6460ad0\"'),
	('sites.dcaed4cd-b19b-4346-ae5d-ba0b781d29aa.sortOrder','1'),
	('system.edition','\"pro\"'),
	('system.live','true'),
	('system.name','\"Conversion-assesment\"'),
	('system.schemaVersion','\"3.7.33\"'),
	('system.timeZone','\"America/Los_Angeles\"'),
	('users.allowPublicRegistration','false'),
	('users.defaultGroup','null'),
	('users.photoSubpath','null'),
	('users.photoVolumeUid','null'),
	('users.requireEmailVerification','true'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.fieldLayouts.b782024f-776f-4261-8400-ff9479d26a71.tabs.0.elements.0.autocapitalize','true'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.fieldLayouts.b782024f-776f-4261-8400-ff9479d26a71.tabs.0.elements.0.autocomplete','false'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.fieldLayouts.b782024f-776f-4261-8400-ff9479d26a71.tabs.0.elements.0.autocorrect','true'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.fieldLayouts.b782024f-776f-4261-8400-ff9479d26a71.tabs.0.elements.0.class','null'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.fieldLayouts.b782024f-776f-4261-8400-ff9479d26a71.tabs.0.elements.0.disabled','false'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.fieldLayouts.b782024f-776f-4261-8400-ff9479d26a71.tabs.0.elements.0.id','null'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.fieldLayouts.b782024f-776f-4261-8400-ff9479d26a71.tabs.0.elements.0.instructions','null'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.fieldLayouts.b782024f-776f-4261-8400-ff9479d26a71.tabs.0.elements.0.label','null'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.fieldLayouts.b782024f-776f-4261-8400-ff9479d26a71.tabs.0.elements.0.max','null'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.fieldLayouts.b782024f-776f-4261-8400-ff9479d26a71.tabs.0.elements.0.min','null'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.fieldLayouts.b782024f-776f-4261-8400-ff9479d26a71.tabs.0.elements.0.name','null'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.fieldLayouts.b782024f-776f-4261-8400-ff9479d26a71.tabs.0.elements.0.orientation','null'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.fieldLayouts.b782024f-776f-4261-8400-ff9479d26a71.tabs.0.elements.0.placeholder','null'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.fieldLayouts.b782024f-776f-4261-8400-ff9479d26a71.tabs.0.elements.0.readonly','false'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.fieldLayouts.b782024f-776f-4261-8400-ff9479d26a71.tabs.0.elements.0.requirable','false'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.fieldLayouts.b782024f-776f-4261-8400-ff9479d26a71.tabs.0.elements.0.size','null'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.fieldLayouts.b782024f-776f-4261-8400-ff9479d26a71.tabs.0.elements.0.step','null'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.fieldLayouts.b782024f-776f-4261-8400-ff9479d26a71.tabs.0.elements.0.tip','null'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.fieldLayouts.b782024f-776f-4261-8400-ff9479d26a71.tabs.0.elements.0.title','null'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.fieldLayouts.b782024f-776f-4261-8400-ff9479d26a71.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\AssetTitleField\"'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.fieldLayouts.b782024f-776f-4261-8400-ff9479d26a71.tabs.0.elements.0.warning','null'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.fieldLayouts.b782024f-776f-4261-8400-ff9479d26a71.tabs.0.elements.0.width','100'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.fieldLayouts.b782024f-776f-4261-8400-ff9479d26a71.tabs.0.elements.1.fieldUid','\"710c1936-f63d-4a3e-8ddd-1956d785b7ff\"'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.fieldLayouts.b782024f-776f-4261-8400-ff9479d26a71.tabs.0.elements.1.instructions','null'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.fieldLayouts.b782024f-776f-4261-8400-ff9479d26a71.tabs.0.elements.1.label','null'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.fieldLayouts.b782024f-776f-4261-8400-ff9479d26a71.tabs.0.elements.1.required','false'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.fieldLayouts.b782024f-776f-4261-8400-ff9479d26a71.tabs.0.elements.1.tip','null'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.fieldLayouts.b782024f-776f-4261-8400-ff9479d26a71.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.fieldLayouts.b782024f-776f-4261-8400-ff9479d26a71.tabs.0.elements.1.warning','null'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.fieldLayouts.b782024f-776f-4261-8400-ff9479d26a71.tabs.0.elements.1.width','100'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.fieldLayouts.b782024f-776f-4261-8400-ff9479d26a71.tabs.0.name','\"Content\"'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.fieldLayouts.b782024f-776f-4261-8400-ff9479d26a71.tabs.0.sortOrder','1'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.handle','\"local\"'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.hasUrls','true'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.name','\"Local\"'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.settings.path','\"$ASSET_DIRECTORY\"'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.sortOrder','1'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.titleTranslationKeyFormat','null'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.titleTranslationMethod','null'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.type','\"craft\\\\volumes\\\\Local\"'),
	('volumes.274b5f37-481f-47df-8ece-a277e6d6a399.url','\"/uploads\"');

/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table queue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `queue`;

CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_djuwxptfpdlyyzmsreipmzypfwuwzglabspk` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_nwmjehkwzcdukyjwugtujmhosxncujjcjout` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;

INSERT INTO `queue` (`id`, `channel`, `job`, `description`, `timePushed`, `ttr`, `delay`, `priority`, `dateReserved`, `timeUpdated`, `progress`, `progressLabel`, `attempt`, `fail`, `dateFailed`, `error`)
VALUES
	(5,'queue',X'4F3A33343A2263726166745C71756575655C6A6F62735C557064617465536561726368496E646578223A373A7B733A31313A22656C656D656E7454797065223B733A33373A22536F6C73706163655C46726565666F726D5C456C656D656E74735C5375626D697373696F6E223B733A393A22656C656D656E744964223B693A35333B733A363A22736974654964223B693A313B733A31323A226669656C6448616E646C6573223B613A303A7B7D733A31313A226465736372697074696F6E223B4E3B733A33303A220063726166745C71756575655C426173654A6F62005F70726F6772657373223B693A303B733A33353A220063726166745C71756575655C426173654A6F62005F70726F67726573734C6162656C223B4E3B7D','Updating search indexes',1660595681,300,0,2048,NULL,NULL,0,NULL,NULL,0,NULL,NULL);

/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table relations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `relations`;

CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_omhuchowecnjyuvvmbopbqkoqaerpjmfmjri` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_lqcclmvgidsyqcvktsqlzzpvklhbckkqnuhl` (`sourceId`),
  KEY `idx_xzzwljdlvynvweawqjoojbehslgeialjwfsj` (`targetId`),
  KEY `idx_udlkzmiawsyefbppnblwxlclesnwdmbvhfvx` (`sourceSiteId`),
  CONSTRAINT `fk_fmbmiqjhfjngqwlcssedfewomujoisjopgaf` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wyuzstftnaanbukshaxbthwtczfpwgqxgsey` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ygpthfmpidmictmdbffdxntrcqfkovxepofj` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ywqfcjvvgkgolctfpkefowwrqtbdqhbfudpr` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;

INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(5,1,14,NULL,12,1,'2022-08-14 00:12:07','2022-08-14 00:12:07','3cc16b4e-d641-4ef6-99f6-b9728c9ffd2c'),
	(6,1,14,NULL,11,2,'2022-08-14 00:12:07','2022-08-14 00:12:07','79228399-34cb-40c0-a1b5-d396e219516b'),
	(7,1,15,NULL,12,1,'2022-08-14 00:16:54','2022-08-14 00:16:54','a63ecf0a-272f-45c2-8f63-7517b6519405'),
	(8,1,15,NULL,11,2,'2022-08-14 00:16:54','2022-08-14 00:16:54','236828c0-e46d-46c1-bf59-7b57366677a0'),
	(11,1,6,NULL,17,1,'2022-08-14 00:44:04','2022-08-14 00:44:04','1e3be3d9-7c3f-4b33-89a1-7ddbb80f24dd'),
	(12,1,6,NULL,16,2,'2022-08-14 00:44:04','2022-08-14 00:44:04','1a57cbd2-c97c-468b-b3b1-708d889810d2'),
	(13,1,19,NULL,17,1,'2022-08-14 00:44:04','2022-08-14 00:44:04','cb1f2f51-7dd0-488d-974f-ee9fce688b11'),
	(14,1,19,NULL,16,2,'2022-08-14 00:44:04','2022-08-14 00:44:04','fa28a0bb-6885-4e26-bc17-80d433281ffc');

/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table resourcepaths
# ------------------------------------------------------------

DROP TABLE IF EXISTS `resourcepaths`;

CREATE TABLE `resourcepaths` (
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;

INSERT INTO `resourcepaths` (`hash`, `path`)
VALUES
	('12e8d4d3','@craft/web/assets/fileupload/dist'),
	('1960f7ba','@craft/web/assets/prismjs/dist'),
	('230b9233','@craft/web/assets/dashboard/dist'),
	('30811691','@craft/web/assets/routes/dist'),
	('34689b88','@modules/conversionmodule/assetbundles/conversionmodule/dist'),
	('3948d86','@craft/web/assets/elementresizedetector/dist'),
	('3ad5033','@craft/web/assets/editentry/dist'),
	('41351315','@craft/web/assets/editsection/dist'),
	('416de34a','@craft/web/assets/vue/dist'),
	('47ec4f07','@craft/web/assets/plugins/dist'),
	('5089e6c4','@craft/web/assets/jquerytouchevents/dist'),
	('50da39a6','@craft/web/assets/jquerypayment/dist'),
	('554d3b11','@craft/web/assets/velocity/dist'),
	('5a48b4f8','@craft/web/assets/feed/dist'),
	('5a517480','@craft/web/assets/clearcaches/dist'),
	('5ae7e1e5','@freeform/Resources'),
	('655d89bc','@craft/web/assets/craftsupport/dist'),
	('67395e78','@craft/web/assets/xregexp/dist'),
	('674926e','@bower/jquery/dist'),
	('6c81e378','@craft/web/assets/picturefill/dist'),
	('6d5b3e71','@craft/web/assets/login/dist'),
	('827d9eee','@craft/web/assets/utilities/dist'),
	('859e64ce','@craft/web/assets/queuemanager/dist'),
	('925708d0','@craft/web/assets/fabric/dist'),
	('9ca50ccd','@craft/web/assets/sites/dist'),
	('a24584ed','@craft/web/assets/fields/dist'),
	('ab6b7c38','@craft/web/assets/admintable/dist'),
	('bae53fc7','@craft/web/assets/garnish/dist'),
	('c2ba806d','@craft/web/assets/d3/dist'),
	('c2f17fb5','@craft/web/assets/updateswidget/dist'),
	('c930278','@craft/web/assets/jqueryui/dist'),
	('c9db89da','@craft/web/assets/iframeresizer/dist'),
	('cfb25cec','@craft/web/assets/fieldsettings/dist'),
	('d1f49659','@craft/web/assets/pluginstore/dist'),
	('d4c7046c','@craft/web/assets/selectize/dist'),
	('d88fa624','@craft/web/assets/cp/dist'),
	('da7415bf','@craft/web/assets/focusvisible/dist'),
	('e4bea882','@craft/web/assets/axios/dist'),
	('e79ba002','@Solspace/Freeform/Resources'),
	('fc4b3ddb','@craft/web/assets/recententries/dist');

/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table revisions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `revisions`;

CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hyfplubqmfypiwbmdbwoovxeozzelycceygs` (`sourceId`,`num`),
  KEY `fk_fcwgmipiehscprqpwztpacpjsmpfjktdsxrq` (`creatorId`),
  CONSTRAINT `fk_fcwgmipiehscprqpwztpacpjsmpfjktdsxrq` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_nkojnpxaevercemjexcewyjpcxyibbkcktwe` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;

INSERT INTO `revisions` (`id`, `sourceId`, `creatorId`, `num`, `notes`)
VALUES
	(1,6,1,1,NULL),
	(2,6,1,2,NULL),
	(3,6,1,3,'Applied “Draft 1”'),
	(4,6,1,4,''),
	(5,6,1,5,'Applied “Draft 1”');

/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table searchindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `searchindex`;

CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_fhuozzdhpgevhptjjlrjzfrjlhxnhpbmfidl` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`)
VALUES
	(1,'email',0,1,' jeff benusa gmail com '),
	(1,'fullname',0,1,''),
	(1,'lastname',0,1,''),
	(1,'firstname',0,1,''),
	(1,'username',0,1,' admin '),
	(2,'slug',0,1,''),
	(2,'title',0,1,' 2022 08 12 07 22 17 '),
	(3,'slug',0,1,''),
	(3,'title',0,1,' 2022 08 12 07 22 18 '),
	(4,'slug',0,1,''),
	(4,'title',0,1,' 2022 08 12 07 24 55 '),
	(5,'slug',0,1,''),
	(5,'title',0,1,' 2022 08 12 07 24 55 '),
	(1,'slug',0,1,''),
	(6,'title',0,1,' homepage '),
	(6,'slug',0,1,' homepage '),
	(11,'kind',0,1,' image '),
	(11,'extension',0,1,' jpg '),
	(11,'filename',0,1,' truck2 jpg '),
	(12,'kind',0,1,' image '),
	(12,'extension',0,1,' jpg '),
	(12,'filename',0,1,' truck1 jpg '),
	(11,'slug',0,1,''),
	(11,'title',0,1,' truck2 '),
	(12,'slug',0,1,''),
	(12,'title',0,1,' truck1 '),
	(16,'filename',0,1,' truck2 jpg '),
	(16,'extension',0,1,' jpg '),
	(16,'kind',0,1,' image '),
	(16,'slug',0,1,''),
	(16,'title',0,1,' truck2 '),
	(17,'filename',0,1,' truck1 jpg '),
	(17,'extension',0,1,' jpg '),
	(17,'kind',0,1,' image '),
	(17,'slug',0,1,''),
	(17,'title',0,1,' truck1 '),
	(20,'slug',0,1,''),
	(20,'title',0,1,' 2022 08 14 12 58 43 '),
	(21,'slug',0,1,''),
	(21,'title',0,1,' 2022 08 14 13 04 04 '),
	(22,'slug',0,1,''),
	(22,'title',0,1,' 2022 08 14 13 13 01 '),
	(23,'slug',0,1,''),
	(23,'title',0,1,' 2022 08 14 13 14 22 '),
	(42,'slug',0,1,''),
	(42,'title',0,1,' 2022 08 14 14 18 19 '),
	(43,'slug',0,1,''),
	(43,'title',0,1,' 2022 08 14 14 31 08 '),
	(44,'slug',0,1,''),
	(44,'title',0,1,' 2022 08 14 14 32 08 '),
	(45,'slug',0,1,''),
	(45,'title',0,1,' 2022 08 14 14 32 31 '),
	(46,'slug',0,1,''),
	(46,'title',0,1,' 2022 08 14 14 32 48 '),
	(47,'slug',0,1,''),
	(47,'title',0,1,' 2022 08 14 14 34 05 '),
	(48,'slug',0,1,''),
	(48,'title',0,1,' 2022 08 14 14 34 32 '),
	(49,'slug',0,1,''),
	(49,'title',0,1,' 2022 08 14 14 36 26 '),
	(50,'slug',0,1,''),
	(50,'title',0,1,' 2022 08 14 14 38 27 '),
	(51,'slug',0,1,''),
	(51,'title',0,1,' 2022 08 14 14 44 16 '),
	(52,'slug',0,1,''),
	(52,'title',0,1,' 2022 08 15 13 32 21 ');

/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sections`;

CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `previewTargets` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gknuihptvlimdmptevuaagvcqujmmunhpfcx` (`handle`),
  KEY `idx_litgoekogfwnieelusjueomjgfkihwjtrqmh` (`name`),
  KEY `idx_ebtgpawlpjdxwjwgbwtfyycdffiwndrkikhw` (`structureId`),
  KEY `idx_kpedzssvhbzapyfbyrdofzzbyxbsfkptbdet` (`dateDeleted`),
  CONSTRAINT `fk_syqrqfoncmlgwkqnylnekphfcbwgevrezamx` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;

INSERT INTO `sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagationMethod`, `defaultPlacement`, `previewTargets`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,NULL,'Homepage','homepage','single',1,'all','end','[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2022-08-12 21:29:14','2022-08-12 21:29:14',NULL,'15fcc23c-612d-4709-bd3c-6736f6d76d1e');

/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sections_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sections_sites`;

CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_oxkdivvbhhwtzfwewzjpwwexyczwjwucdkku` (`sectionId`,`siteId`),
  KEY `idx_hblpwnbcoxzhuomliynvqoftkjeslqfwapoe` (`siteId`),
  CONSTRAINT `fk_ajzloqkkapuhunrfwsqkixtynhoothzdlmdo` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xfwduvanpeuvjdlieqkfebbfrftadnmghbtu` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;

INSERT INTO `sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,1,1,'__home__','index.twig',1,'2022-08-12 21:29:14','2022-08-12 21:29:14','8086daed-abd1-46ca-bc7d-dfae4ac77236');

/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sequences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sequences`;

CREATE TABLE `sequences` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_oedicdwpjolauhfhxzjuhxnocpvyhdhvslwi` (`uid`),
  KEY `idx_qqcuzkexcqobjzzutfvqijxqshymqndkyrex` (`token`),
  KEY `idx_ettgiexnzspogaegykislomkarfpcmkflsii` (`dateUpdated`),
  KEY `idx_iiijjvqnnafnymahtshondiidsscwrjhzrdk` (`userId`),
  CONSTRAINT `fk_kijeyanhzpnxbshiwlrbstquflrrxdphwgyz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;

INSERT INTO `sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'HPWNCF-44lcn47WuVN5kvYp3M-GApu44xmdU1bqrhKeKNzBxXEM-9qG1SF6POJmnceX8i2k5X90kv5j2dkah6P-V8BtAkHCvSKFO','2022-08-13 23:59:18','2022-08-14 00:35:30','5800d774-bc5b-4669-93da-86a589df0b1d'),
	(2,1,'fshvo4BIgczZWEdH7CcdOzSxupo_SXpIdqkWAker6ShKIrmbMBG_ctCk7KGLDwC9xfUv3S7ptw72TeK-RdTFhjb3a7KAfQfFXGLf','2022-08-14 00:35:30','2022-08-14 00:36:11','cddd9203-8ac6-4657-988b-ccbe4885bbea'),
	(4,1,'mMOTh_ai3VTEImv2PB37KZ2RszfWKjKSRwd3ZtGD7wXd7AJ5klf1xqI4cspn1LUnYnA8cp_vG-FKCRZtr0frDaMxlGUmIeNGCx88','2022-08-14 19:18:17','2022-08-14 19:21:05','bf63edbd-f631-42db-8d08-1562ecbcc1fb'),
	(5,1,'X73aQTgA7lUx9RoPQSV7dUHjXHZQF_8Hq219c3b7axaOIA5d_eTqvDObVOfg0bQdstfydNPdt3apnZhPfgVJmeJ5-SDq8mN0ywR7','2022-08-14 19:21:05','2022-08-14 19:29:18','b29849af-215e-4955-8b7d-de726e5e7058'),
	(6,1,'DpVSxv4TNBKruddfWSqfGHJKxxcy1wEbMG2MIrHjG3DhNPjl2GpgEe6kd3y0kaEhMDpD5lfOmGxFjguh4pWWwh8EVgEPFiQ0wovG','2022-08-14 19:29:17','2022-08-14 19:29:17','6607dc1b-251e-4b3e-b175-222bf0e48448'),
	(7,1,'uHcPUr4EeK18pb-h6wXAXNXALJyROSp_PJzGim8qkRE24x1QGLevEAr_B2GzMel5ADjm1V7BNoKW1QBJ1-8AlgF60eeTyDoJ3Ews','2022-08-14 19:29:18','2022-08-14 21:18:01','d72097f3-3a61-4406-9659-abfbbb05a9da'),
	(8,1,'bJ92hIefM3Gp2r5GDUjQUELD61puDlFfXAmM44qhT7UbGP2r3mmsxJnzoBYEjBGXpN-qKSPeJPz-w47ghGO_SgJK_rixaDczpqc8','2022-08-14 21:18:01','2022-08-14 21:18:01','afb46347-d43f-459d-83b4-bf87565d1bd9'),
	(9,1,'NWiiZtFqEWIio02Ddb2kBYu5GmCF0TGNKnxHnx_Suj2izEST7uPjeaq-ZJ3a_fUz7Vm-cYjeSWLWT_JJk1aHRd9kCZndsnndRWDy','2022-08-14 21:18:01','2022-08-14 21:22:37','b048abe6-981a-434b-b2f1-242368a87d97'),
	(10,1,'tHCUXcflgj198j8H5KQpfLDxTb_ZANJWPA_GuHmmtKGALOdHIHgY7JQ6OtlJX2JLZn_GiqI0_iOttl59RoPaCBs0fdLo6nvnGLuu','2022-08-14 21:22:33','2022-08-14 21:22:33','fd5fd98a-ee04-4052-94cb-71a53dd6475b'),
	(11,1,'L7Dw04OV4CCDWIs2lYbgN4NRBM2i9XIiynRH-v7V6BtYHPvVGGDsavyH7yhCrLEiacbVTBVN2Pb2aTE65iCB62H7ImujQxQuxnCm','2022-08-14 21:22:37','2022-08-14 21:53:41','621556e2-2854-4243-ac31-356eb7787567'),
	(12,1,'XXgyZDEODW4802qKyDr4Q8f-3tGWsqW6dUilAGLeE22_gQwc9mmja0Fj1rE5jEOydV7PCU6_w1tIZRDG7kd238ChvMru3g5flWv8','2022-08-14 21:53:41','2022-08-14 21:59:04','cddf9d65-db3c-4961-ba3b-a2ccd1052d5f'),
	(13,1,'hUsDysawHGLJ6Y3GsM0n2wZJWIH_nl7ICNo-oLc80gUcOnbvB3v6d3J27O2pDSqJhyQSAKTkzLP5Il14pF-04wJc0yZnHnda1y-G','2022-08-14 21:53:41','2022-08-14 21:56:14','714950c4-8f46-40c0-a3c4-1f4a10a7b7a4'),
	(14,1,'XBw6MmohdLMMbdpgri_yKEnsiElx3jD-5NMwxCX3pt0BI4x7D6SLkwOpSwY1NUTR1gdXsUJMWpZdwCGfEfRB-9cqrY4hyaYS3imr','2022-08-14 21:59:03','2022-08-14 21:59:03','5cb75d35-a149-45ba-a498-c3c87f3c5d2e'),
	(15,1,'R1xDDV-IjfsDVVO-y5ULZ1r6Mf2RNKll_msowozKn3Ckajo7-2kz9cpTFnuUzm-qFkRj53--4Y0tlfzWOe30l4kwVDnRFcOY6C32','2022-08-14 21:59:04','2022-08-14 22:48:04','8b9c8b98-28d2-4a53-add0-1abd2f06184c'),
	(16,1,'O2-mFWhNCREqENSENJHhzYSzY9ctmx0Ie6YPPIYMx5OF3SFFXu24PI8yjhZBp1rQUrrLteuVS4XoxBAyRlWETgZ79_v95MT8IP9W','2022-08-15 20:32:51','2022-08-15 20:36:53','bc42557b-6e98-4c16-bea7-64853eb6caae');

/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shunnedmessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shunnedmessages`;

CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ibkzyffxdlbrcjwgwxgmubkyamcmmsygwval` (`userId`,`message`),
  CONSTRAINT `fk_iyywojetjlagodyxsztywghtohhuwyueqcyh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table sitegroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sitegroups`;

CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rnagqozirmtqfcrwrgdhvecqjxfeesmzjjpq` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,'Conversion-assesment','2022-08-11 16:15:38','2022-08-11 16:15:38',NULL,'4ce0c4e7-0ade-4470-9284-adfde6460ad0');

/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sites`;

CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_soxwffyayigjafcsmlbbrrrqjifzlumzdpnm` (`dateDeleted`),
  KEY `idx_ecybxyzdapmudbvsclazqdmwqziakpbxvlxp` (`handle`),
  KEY `idx_xifmbrsuuyxhruajnvgbuasodzyolvywmrda` (`sortOrder`),
  KEY `fk_dpzdffqlrbeeonohgkrajkvcxbtumcsqzjzd` (`groupId`),
  CONSTRAINT `fk_dpzdffqlrbeeonohgkrajkvcxbtumcsqzjzd` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;

INSERT INTO `sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,1,1,1,'Conversion-assesment','default','en-US',1,'$PRIMARY_SITE_URL',1,'2022-08-11 16:15:38','2022-08-11 16:15:38',NULL,'dcaed4cd-b19b-4346-ae5d-ba0b781d29aa');

/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table structureelements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `structureelements`;

CREATE TABLE `structureelements` (
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
  UNIQUE KEY `idx_bzitntivwnovgrqjuwyplkpiarqrbqyecfaj` (`structureId`,`elementId`),
  KEY `idx_gawgbzswczprdejulcpoacfdlmokmbcebibq` (`root`),
  KEY `idx_gklliutclkvznthrnpchgbjedtejhqcmxjyt` (`lft`),
  KEY `idx_lihkshugamekesgriyqgohcgitovewzpezzq` (`rgt`),
  KEY `idx_lzsqxingyerhbhclkhrxxvgvxgqaagopoyfi` (`level`),
  KEY `idx_pqcnldupyotuhuodsnqgtaadkdthrxmwqyfq` (`elementId`),
  CONSTRAINT `fk_vlslosisekfgrwutcenerpmlzyqolbtugmki` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yqalomqnwbxgwgzmxjfygrengpclepncxjux` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table structures
# ------------------------------------------------------------

DROP TABLE IF EXISTS `structures`;

CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fvwilhwpnckfpvfcapezktngxktmlxxgyjwy` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table systemmessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `systemmessages`;

CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ilavtqgwdjmkkayktbwbhmppqomyirdhtxxi` (`key`,`language`),
  KEY `idx_cxqnlciskkasogdpzceyrmwezhhowlcekhon` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table taggroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `taggroups`;

CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qprdspragzdyyesejdqwxeoccvrqupptaiwf` (`name`),
  KEY `idx_hiluthfdjmaexquylezxlveuscfrahpzkvrk` (`handle`),
  KEY `idx_orbxdykadcynkzmrarfmhomfwetfqtichpdt` (`dateDeleted`),
  KEY `fk_iwpcfwiiytxttqvfbqenwfbqvxbylgmfsajp` (`fieldLayoutId`),
  CONSTRAINT `fk_iwpcfwiiytxttqvfbqenwfbqvxbylgmfsajp` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vfosuvbbltromwjvprbnjnddffophtytwryp` (`groupId`),
  CONSTRAINT `fk_hjhaxwvcvvzykvqeraspqykpbawplxnuyiuv` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ydghkzdyaaqitswhnovaugsalbailjgimcib` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table templatecacheelements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `templatecacheelements`;

CREATE TABLE `templatecacheelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_twbofhiwyeylwamfaeuarfzgppghgmkzteaa` (`cacheId`),
  KEY `idx_mqdrgkvejjttshqbbweiewoqysjfwgzrpvlo` (`elementId`),
  CONSTRAINT `fk_lhygydgavvmoospgqnecdezphcrawlrpaiej` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zuzammzoenuqdzhosbopibrfuurtrgpynmku` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table templatecachequeries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `templatecachequeries`;

CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_fuwszoklzaieffdvrkksqtfyimhaizfaliow` (`cacheId`),
  KEY `idx_rrkefjparjotfdphtntgjtvxceniydfurwpi` (`type`),
  CONSTRAINT `fk_omnmkhxefukhqfjtrlojzwecancthhienvvc` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table templatecaches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `templatecaches`;

CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_iwfkgifkgovokzwrahpyjxqpfyzjbienfxnc` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `idx_tadtwhcrencgghbutjfrxwhocrngmhfulqbk` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `idx_lxobfjxxqehwqiybhuklybwirqshraggbjka` (`siteId`),
  CONSTRAINT `fk_niybxgsqgacmjkgfihttdyzsbvbcbngkwdwp` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tokens`;

CREATE TABLE `tokens` (
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
  UNIQUE KEY `idx_fkjvycfgxvcygcpcramlgxfumjtsofxowguu` (`token`),
  KEY `idx_yyshcngzfvvfqlumboiesuvyhwjwdrspxzkr` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table usergroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `usergroups`;

CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nyyswgcnzacuwulmsoyrrlrjhbiejtllkhcy` (`handle`),
  KEY `idx_btoockminmqgomlaqixxcficqlwizwahqgbz` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table usergroups_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `usergroups_users`;

CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mfwdfotbgvauzsdxeivnzqxmqrcnpiqwybyh` (`groupId`,`userId`),
  KEY `idx_cwcdfchbswktynnsxgsxabdwglswymwthsgm` (`userId`),
  CONSTRAINT `fk_sepbrffnjgfqkrpalpzcikzrkisolmjxloyj` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vzxanmvgzurwltiznuysjmtyeplzdcbvwyap` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table userpermissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userpermissions`;

CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ualztcakfethwgoyeoeuojudslcbjqkldqdd` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table userpermissions_usergroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userpermissions_usergroups`;

CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mzhksfbnqfoficekgkbwwweyoklziygakpus` (`permissionId`,`groupId`),
  KEY `idx_vsuwjgkvtjouhpmtbaaexfitbullesfthtks` (`groupId`),
  CONSTRAINT `fk_iyklwehdyxpdulsksdzrhnmdmlxqvzomlkab` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zdiaaewaaarfncmjjojgldahbnzdeiulqyur` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table userpermissions_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userpermissions_users`;

CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_szssinikbtjxckduphtdqnnowqdezqkleipb` (`permissionId`,`userId`),
  KEY `idx_ozxkjisxxsqjmzmiozydgotwzgavtnfjjnps` (`userId`),
  CONSTRAINT `fk_bcmdjvvzbonslxljwmmeewyyvoitpiacqsrz` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nkdupdjqyesffwgcouiuzccqssbupfjuenrq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table userpreferences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userpreferences`;

CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_nqlaahcahqlkvbekrdkcqehbhhitesafcnil` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;

INSERT INTO `userpreferences` (`userId`, `preferences`)
VALUES
	(1,'{\"language\":\"en-US\"}');

/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xxqolebtikabslrthbaywpvpyayqtdykirba` (`uid`),
  KEY `idx_kppxqrwzifdoyrnvtrivigcpocfazznyyfyr` (`verificationCode`),
  KEY `idx_oyagqxmwqrzuvgypuffmzbzxfdbwxzfqnumt` (`email`),
  KEY `idx_veqxgnlpoquesnzrudpjohwxngymmgvbopbg` (`username`),
  KEY `fk_qhnesrgakefvnlideiglpffxdkerghohizaz` (`photoId`),
  CONSTRAINT `fk_qhnesrgakefvnlideiglpffxdkerghohizaz` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zfqrgwkaprhegquozngzfndyupgzvyetiawd` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'admin',NULL,NULL,NULL,'jeff.benusa@gmail.com','$2y$13$M8DZgI0lQpgnDV69fMoJ2eLcc5Mpcu2oy/UDwq/jMAfBhZ07LKIUi',1,0,0,0,'2022-08-15 20:32:51',NULL,NULL,NULL,'2022-08-12 20:16:56',NULL,1,NULL,NULL,NULL,0,'2022-08-12 20:21:49','2022-08-11 16:15:39','2022-08-15 20:32:51','7acc971d-ef9d-46fd-8f94-a003d88032c0');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table volumefolders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `volumefolders`;

CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ftzquplhhdlekxkvgpqpdwwkmkcdrahedgnu` (`name`,`parentId`,`volumeId`),
  KEY `idx_ozxbpvbhwifjbluburyybtkcvbgezddgrasd` (`parentId`),
  KEY `idx_zfmmzqjkpyenyepmswqjfunqdtsfcnrensem` (`volumeId`),
  CONSTRAINT `fk_tgaiisdjqfiazgerrqtikxeothkebsddgxqx` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ybsbibhtahfgtnhsjfnsqaxtkesjxjwvfusr` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;

INSERT INTO `volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,1,'Local','','2022-08-14 00:03:29','2022-08-14 00:03:29','8072695d-b2c0-49c2-8bef-dfda3b8a4e8b'),
	(2,NULL,NULL,'Temporary source',NULL,'2022-08-14 00:04:54','2022-08-14 00:04:54','6b72615c-90ea-42b0-a99d-a4e7555b63fe'),
	(3,2,NULL,'user_1','user_1/','2022-08-14 00:04:54','2022-08-14 00:04:54','5b5aa70d-b049-45fe-a60c-9d4435177d27');

/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table volumes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `volumes`;

CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `settings` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dopssmhksxscnkezqbmegctqehastmclmuzv` (`name`),
  KEY `idx_cqgvflnzfubgkavowimlookpcefjcrgujzjf` (`handle`),
  KEY `idx_fyofwnfnpiwlkefojugekajcasnzafarbsbq` (`fieldLayoutId`),
  KEY `idx_nnuzycsyqxvtydrevunrnsursbhhgveaxtyk` (`dateDeleted`),
  CONSTRAINT `fk_bbatvfzolkygjtanttlxrmywffzldmfhvxiz` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;

INSERT INTO `volumes` (`id`, `fieldLayoutId`, `name`, `handle`, `type`, `hasUrls`, `url`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `settings`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,2,'Local','local','craft\\volumes\\Local',1,'/uploads','site',NULL,'{\"path\":\"$ASSET_DIRECTORY\"}',1,'2022-08-14 00:03:29','2022-08-14 00:37:16',NULL,'274b5f37-481f-47df-8ece-a277e6d6a399');

/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table widgets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `widgets`;

CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_oofezxwvdwbwamugppjeymvzwltokshmcucz` (`userId`),
  CONSTRAINT `fk_owccegmnjdwrxqbzhzwtrkwtruxpjyfuthif` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2022-08-11 16:48:41','2022-08-11 16:48:41','25df4c23-5f4a-484a-8da1-2a0aa33d665b'),
	(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2022-08-11 16:48:41','2022-08-11 16:48:41','8f35ca36-9046-4a58-b4af-0019d69992cd'),
	(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2022-08-11 16:48:41','2022-08-11 16:48:41','00d82684-3e23-4c19-bd25-b7918cc8fa04'),
	(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2022-08-11 16:48:41','2022-08-11 16:48:41','41829a02-74dc-44e1-82ec-1448e5a6de02');

/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
