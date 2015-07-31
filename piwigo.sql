-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 31, 2015 at 10:56 AM
-- Server version: 5.5.44-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `piwigo`
--

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_caddie`
--

CREATE TABLE IF NOT EXISTS `piwigo_caddie` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `element_id` mediumint(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`element_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_categories`
--

CREATE TABLE IF NOT EXISTS `piwigo_categories` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `id_uppercat` smallint(5) unsigned DEFAULT NULL,
  `comment` text,
  `dir` varchar(255) DEFAULT NULL,
  `rank` smallint(5) unsigned DEFAULT NULL,
  `status` enum('public','private') NOT NULL DEFAULT 'public',
  `site_id` tinyint(4) unsigned DEFAULT NULL,
  `visible` enum('true','false') NOT NULL DEFAULT 'true',
  `representative_picture_id` mediumint(8) unsigned DEFAULT NULL,
  `uppercats` varchar(255) NOT NULL DEFAULT '',
  `commentable` enum('true','false') NOT NULL DEFAULT 'true',
  `global_rank` varchar(255) DEFAULT NULL,
  `image_order` varchar(128) DEFAULT NULL,
  `permalink` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_i3` (`permalink`),
  KEY `categories_i2` (`id_uppercat`),
  KEY `lastmodified` (`lastmodified`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `piwigo_categories`
--

INSERT INTO `piwigo_categories` (`id`, `name`, `id_uppercat`, `comment`, `dir`, `rank`, `status`, `site_id`, `visible`, `representative_picture_id`, `uppercats`, `commentable`, `global_rank`, `image_order`, `permalink`, `lastmodified`) VALUES
(1, 'avni', NULL, NULL, NULL, 1, 'public', NULL, 'true', 1, '1', 'true', '1', NULL, NULL, '2015-07-31 17:43:56');

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_comments`
--

CREATE TABLE IF NOT EXISTS `piwigo_comments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `image_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `author` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `author_id` mediumint(8) unsigned DEFAULT NULL,
  `anonymous_id` varchar(45) NOT NULL,
  `website_url` varchar(255) DEFAULT NULL,
  `content` longtext,
  `validated` enum('true','false') NOT NULL DEFAULT 'false',
  `validation_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_i2` (`validation_date`),
  KEY `comments_i1` (`image_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_config`
--

CREATE TABLE IF NOT EXISTS `piwigo_config` (
  `param` varchar(40) NOT NULL DEFAULT '',
  `value` text,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`param`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='configuration table';

--
-- Dumping data for table `piwigo_config`
--

INSERT INTO `piwigo_config` (`param`, `value`, `comment`) VALUES
('activate_comments', 'true', 'Global parameter for usage of comments system'),
('nb_comment_page', '10', 'number of comments to display on each page'),
('log', 'true', 'keep an history of visits on your website'),
('comments_validation', 'false', 'administrators validate users comments before becoming visible'),
('comments_forall', 'false', 'even guest not registered can post comments'),
('comments_order', 'ASC', 'comments order on picture page and cie'),
('comments_author_mandatory', 'false', 'Comment author is mandatory'),
('comments_email_mandatory', 'false', 'Comment email is mandatory'),
('comments_enable_website', 'true', 'Enable "website" field on add comment form'),
('user_can_delete_comment', 'false', 'administrators can allow user delete their own comments'),
('user_can_edit_comment', 'false', 'administrators can allow user edit their own comments'),
('email_admin_on_comment_edition', 'false', 'Send an email to the administrators when a comment is modified'),
('email_admin_on_comment_deletion', 'false', 'Send an email to the administrators when a comment is deleted'),
('gallery_locked', 'false', 'Lock your gallery temporary for non admin users'),
('gallery_title', 'Just another Piwigo gallery', 'Title at top of each page and for RSS feed'),
('rate', 'true', 'Rating pictures feature is enabled'),
('rate_anonymous', 'true', 'Rating pictures feature is also enabled for visitors'),
('page_banner', '<h1>%gallery_title%</h1>\n\n<p>Welcome to my photo gallery</p>', 'html displayed on the top each page of your gallery'),
('history_admin', 'false', 'keep a history of administrator visits on your website'),
('history_guest', 'true', 'keep a history of guest visits on your website'),
('allow_user_registration', 'true', 'allow visitors to register?'),
('allow_user_customization', 'true', 'allow users to customize their gallery?'),
('nb_categories_page', '12', 'Param for categories pagination'),
('nbm_send_html_mail', 'true', 'Send mail on HTML format for notification by mail'),
('nbm_send_mail_as', '', 'Send mail as param value for notification by mail'),
('nbm_send_detailed_content', 'true', 'Send detailed content for notification by mail'),
('nbm_complementary_mail_content', '', 'Complementary mail content for notification by mail'),
('nbm_send_recent_post_dates', 'true', 'Send recent post by dates for notification by mail'),
('email_admin_on_new_user', 'false', 'Send an email to theadministrators when a user registers'),
('email_admin_on_comment', 'false', 'Send an email to the administrators when a valid comment is entered'),
('email_admin_on_comment_validation', 'true', 'Send an email to the administrators when a comment requires validation'),
('obligatory_user_mail_address', 'false', 'Mail address is obligatory for users'),
('c13y_ignore', 'a:2:{s:7:"version";s:5:"2.7.4";s:4:"list";a:0:{}}', 'List of ignored anomalies'),
('extents_for_templates', 'a:0:{}', 'Actived template-extension(s)'),
('blk_menubar', '', 'Menubar options'),
('menubar_filter_icon', 'false', 'Display filter icon'),
('index_sort_order_input', 'true', 'Display image order selection list'),
('index_flat_icon', 'false', 'Display flat icon'),
('index_posted_date_icon', 'true', 'Display calendar by posted date'),
('index_created_date_icon', 'true', 'Display calendar by creation date icon'),
('index_slideshow_icon', 'true', 'Display slideshow icon'),
('index_new_icon', 'true', 'Display new icons next albums and pictures'),
('picture_metadata_icon', 'true', 'Display metadata icon on picture page'),
('picture_slideshow_icon', 'true', 'Display slideshow icon on picture page'),
('picture_favorite_icon', 'true', 'Display favorite icon on picture page'),
('picture_download_icon', 'true', 'Display download icon on picture page'),
('picture_navigation_icons', 'true', 'Display navigation icons on picture page'),
('picture_navigation_thumb', 'true', 'Display navigation thumbnails on picture page'),
('picture_menu', 'false', 'Show menubar on picture page'),
('picture_informations', 'a:11:{s:6:"author";b:1;s:10:"created_on";b:1;s:9:"posted_on";b:1;s:10:"dimensions";b:0;s:4:"file";b:0;s:8:"filesize";b:0;s:4:"tags";b:1;s:10:"categories";b:1;s:6:"visits";b:1;s:12:"rating_score";b:1;s:13:"privacy_level";b:1;}', 'Information displayed on picture page'),
('week_starts_on', 'monday', 'Monday may not be the first day of the week'),
('updates_ignored', 'a:3:{s:7:"plugins";a:0:{}s:6:"themes";a:0:{}s:9:"languages";a:0:{}}', 'Extensions ignored for update'),
('order_by', 'ORDER BY date_available DESC, file ASC, id ASC', 'default photo order'),
('order_by_inside_category', 'ORDER BY date_available DESC, file ASC, id ASC', 'default photo order inside category'),
('original_resize', 'false', NULL),
('original_resize_maxwidth', '2016', NULL),
('original_resize_maxheight', '2016', NULL),
('original_resize_quality', '95', NULL),
('mobile_theme', 'smartpocket', NULL),
('mail_theme', 'clear', NULL),
('secret_key', '8247c2b0d558cbabd17295401ca19179', 'a secret key specific to the gallery for internal use'),
('piwigo_db_version', '2.7', NULL),
('smartpocket', 'a:2:{s:4:"loop";b:1;s:8:"autohide";i:5000;}', 'loop#autohide'),
('data_dir_checked', '1', NULL),
('derivatives', 'a:4:{s:1:"d";a:9:{s:6:"square";O:16:"DerivativeParams":3:{s:13:"last_mod_time";i:1438363310;s:6:"sizing";O:12:"SizingParams":3:{s:10:"ideal_size";a:2:{i:0;i:120;i:1;i:120;}s:8:"max_crop";i:1;s:8:"min_size";a:2:{i:0;i:120;i:1;i:120;}}s:7:"sharpen";i:0;}s:5:"thumb";O:16:"DerivativeParams":3:{s:13:"last_mod_time";i:1438363310;s:6:"sizing";O:12:"SizingParams":3:{s:10:"ideal_size";a:2:{i:0;i:144;i:1;i:144;}s:8:"max_crop";i:0;s:8:"min_size";N;}s:7:"sharpen";i:0;}s:6:"2small";O:16:"DerivativeParams":3:{s:13:"last_mod_time";i:1438363310;s:6:"sizing";O:12:"SizingParams":3:{s:10:"ideal_size";a:2:{i:0;i:240;i:1;i:240;}s:8:"max_crop";i:0;s:8:"min_size";N;}s:7:"sharpen";i:0;}s:6:"xsmall";O:16:"DerivativeParams":3:{s:13:"last_mod_time";i:1438363310;s:6:"sizing";O:12:"SizingParams":3:{s:10:"ideal_size";a:2:{i:0;i:432;i:1;i:324;}s:8:"max_crop";i:0;s:8:"min_size";N;}s:7:"sharpen";i:0;}s:5:"small";O:16:"DerivativeParams":3:{s:13:"last_mod_time";i:1438363310;s:6:"sizing";O:12:"SizingParams":3:{s:10:"ideal_size";a:2:{i:0;i:576;i:1;i:432;}s:8:"max_crop";i:0;s:8:"min_size";N;}s:7:"sharpen";i:0;}s:6:"medium";O:16:"DerivativeParams":3:{s:13:"last_mod_time";i:1438363310;s:6:"sizing";O:12:"SizingParams":3:{s:10:"ideal_size";a:2:{i:0;i:792;i:1;i:594;}s:8:"max_crop";i:0;s:8:"min_size";N;}s:7:"sharpen";i:0;}s:5:"large";O:16:"DerivativeParams":3:{s:13:"last_mod_time";i:1438363310;s:6:"sizing";O:12:"SizingParams":3:{s:10:"ideal_size";a:2:{i:0;i:1008;i:1;i:756;}s:8:"max_crop";i:0;s:8:"min_size";N;}s:7:"sharpen";i:0;}s:6:"xlarge";O:16:"DerivativeParams":3:{s:13:"last_mod_time";i:1438363310;s:6:"sizing";O:12:"SizingParams":3:{s:10:"ideal_size";a:2:{i:0;i:1224;i:1;i:918;}s:8:"max_crop";i:0;s:8:"min_size";N;}s:7:"sharpen";i:0;}s:7:"xxlarge";O:16:"DerivativeParams":3:{s:13:"last_mod_time";i:1438363310;s:6:"sizing";O:12:"SizingParams":3:{s:10:"ideal_size";a:2:{i:0;i:1656;i:1;i:1242;}s:8:"max_crop";i:0;s:8:"min_size";N;}s:7:"sharpen";i:0;}}s:1:"q";i:95;s:1:"w";O:15:"WatermarkParams":6:{s:4:"file";s:0:"";s:8:"min_size";a:2:{i:0;i:500;i:1;i:500;}s:4:"xpos";i:50;s:4:"ypos";i:50;s:7:"xrepeat";i:0;s:7:"opacity";i:100;}s:1:"c";a:0:{}}', NULL),
('elegant', 'a:3:{s:11:"p_main_menu";s:2:"on";s:12:"p_pict_descr";s:2:"on";s:14:"p_pict_comment";s:3:"off";}', 'p_main_menu#'),
('AdminTools', 'a:3:{s:12:"default_open";b:1;s:15:"closed_position";s:4:"left";s:17:"public_quick_edit";b:1;}', NULL),
('no_photo_yet', 'false', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_favorites`
--

CREATE TABLE IF NOT EXISTS `piwigo_favorites` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `image_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`image_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_groups`
--

CREATE TABLE IF NOT EXISTS `piwigo_groups` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `is_default` enum('true','false') NOT NULL DEFAULT 'false',
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `groups_ui1` (`name`),
  KEY `lastmodified` (`lastmodified`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_group_access`
--

CREATE TABLE IF NOT EXISTS `piwigo_group_access` (
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`,`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_history`
--

CREATE TABLE IF NOT EXISTS `piwigo_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL DEFAULT '0000-00-00',
  `time` time NOT NULL DEFAULT '00:00:00',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `IP` varchar(15) NOT NULL DEFAULT '',
  `section` enum('categories','tags','search','list','favorites','most_visited','best_rated','recent_pics','recent_cats') DEFAULT NULL,
  `category_id` smallint(5) DEFAULT NULL,
  `tag_ids` varchar(50) DEFAULT NULL,
  `image_id` mediumint(8) DEFAULT NULL,
  `summarized` enum('true','false') DEFAULT 'false',
  `image_type` enum('picture','high','other') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `history_i1` (`summarized`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_history_summary`
--

CREATE TABLE IF NOT EXISTS `piwigo_history_summary` (
  `year` smallint(4) NOT NULL DEFAULT '0',
  `month` tinyint(2) DEFAULT NULL,
  `day` tinyint(2) DEFAULT NULL,
  `hour` tinyint(2) DEFAULT NULL,
  `nb_pages` int(11) DEFAULT NULL,
  UNIQUE KEY `history_summary_ymdh` (`year`,`month`,`day`,`hour`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_images`
--

CREATE TABLE IF NOT EXISTS `piwigo_images` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `date_available` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_creation` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `author` varchar(255) DEFAULT NULL,
  `hit` int(10) unsigned NOT NULL DEFAULT '0',
  `filesize` mediumint(9) unsigned DEFAULT NULL,
  `width` smallint(9) unsigned DEFAULT NULL,
  `height` smallint(9) unsigned DEFAULT NULL,
  `coi` char(4) DEFAULT NULL COMMENT 'center of interest',
  `representative_ext` varchar(4) DEFAULT NULL,
  `date_metadata_update` date DEFAULT NULL,
  `rating_score` float(5,2) unsigned DEFAULT NULL,
  `path` varchar(255) NOT NULL DEFAULT '',
  `storage_category_id` smallint(5) unsigned DEFAULT NULL,
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `md5sum` char(32) DEFAULT NULL,
  `added_by` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rotation` tinyint(3) unsigned DEFAULT NULL,
  `latitude` double(8,6) DEFAULT NULL,
  `longitude` double(9,6) DEFAULT NULL,
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `images_i2` (`date_available`),
  KEY `images_i3` (`rating_score`),
  KEY `images_i4` (`hit`),
  KEY `images_i5` (`date_creation`),
  KEY `images_i1` (`storage_category_id`),
  KEY `images_i6` (`latitude`),
  KEY `lastmodified` (`lastmodified`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `piwigo_images`
--

INSERT INTO `piwigo_images` (`id`, `file`, `date_available`, `date_creation`, `name`, `comment`, `author`, `hit`, `filesize`, `width`, `height`, `coi`, `representative_ext`, `date_metadata_update`, `rating_score`, `path`, `storage_category_id`, `level`, `md5sum`, `added_by`, `rotation`, `latitude`, `longitude`, `lastmodified`) VALUES
(1, '2000px-Cloud_computing.svg.png', '2015-07-31 10:43:56', NULL, '2000px-Cloud computing.svg', NULL, NULL, 0, 383, 2000, 1811, NULL, NULL, '2015-07-31', NULL, './upload/2015/07/31/20150731104356-d451da6f.png', NULL, 0, 'd451da6f05b9557bcf88b6b76b0e0fac', 1, 0, NULL, NULL, '2015-07-31 17:43:56'),
(2, 'bg-header.jpg', '2015-07-31 10:44:16', NULL, 'bg-header', NULL, NULL, 0, 1801, 1920, 830, NULL, NULL, '2015-07-31', NULL, './upload/2015/07/31/20150731104416-2429a470.jpg', NULL, 0, '2429a470c6071d9b6aefe919d860bd98', 1, 0, NULL, NULL, '2015-07-31 17:44:16'),
(3, 'biz_hand_shake.jpg', '2015-07-31 10:44:23', NULL, 'biz hand shake', NULL, NULL, 0, 153, 1200, 978, NULL, NULL, '2015-07-31', NULL, './upload/2015/07/31/20150731104423-0fa6d729.jpg', NULL, 0, '0fa6d729edac63603dffffa131826f6a', 1, 0, NULL, NULL, '2015-07-31 17:44:24'),
(4, 'Cloud-computing-concept_nobg.png', '2015-07-31 10:44:25', NULL, 'Cloud-computing-concept nobg', NULL, NULL, 0, 354, 920, 810, NULL, NULL, '2015-07-31', NULL, './upload/2015/07/31/20150731104425-f00907d5.png', NULL, 0, 'f00907d5d801d37e23c66a7ec6a1c774', 1, 0, NULL, NULL, '2015-07-31 17:44:25'),
(5, 'images.jpeg', '2015-07-31 10:44:26', NULL, 'images', NULL, NULL, 0, 6, 259, 194, NULL, NULL, '2015-07-31', NULL, './upload/2015/07/31/20150731104426-269a2f60.jpg', NULL, 0, '269a2f6012fbf3a3fbc34873b6406b6b', 1, 0, NULL, NULL, '2015-07-31 17:44:26'),
(6, '1c95089.jpg', '2015-07-31 10:44:27', NULL, '1c95089', NULL, NULL, 0, 34, 625, 400, NULL, NULL, '2015-07-31', NULL, './upload/2015/07/31/20150731104427-77383f7f.jpg', NULL, 0, '77383f7f4a8736fff18f00ad5afa89c4', 1, 0, NULL, NULL, '2015-07-31 17:44:27');

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_image_category`
--

CREATE TABLE IF NOT EXISTS `piwigo_image_category` (
  `image_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `category_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `rank` mediumint(8) unsigned DEFAULT NULL,
  PRIMARY KEY (`image_id`,`category_id`),
  KEY `image_category_i1` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `piwigo_image_category`
--

INSERT INTO `piwigo_image_category` (`image_id`, `category_id`, `rank`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_image_tag`
--

CREATE TABLE IF NOT EXISTS `piwigo_image_tag` (
  `image_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tag_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`image_id`,`tag_id`),
  KEY `image_tag_i1` (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_languages`
--

CREATE TABLE IF NOT EXISTS `piwigo_languages` (
  `id` varchar(64) NOT NULL DEFAULT '',
  `version` varchar(64) NOT NULL DEFAULT '0',
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `piwigo_languages`
--

INSERT INTO `piwigo_languages` (`id`, `version`, `name`) VALUES
('af_ZA', '2.7.0', 'Afrikaans [ZA]'),
('es_AR', '2.7.0', 'Argentina [AR]'),
('az_AZ', '2.5.0', 'Azərbaycanca [AZ]'),
('id_ID', '2.7.0', 'Bahasa Indonesia [ID]'),
('pt_BR', '2.7.1', 'Brasil [BR]'),
('br_FR', '2.7.1', 'Brezhoneg [FR]'),
('ca_ES', '2.7.0', 'Català [CA]'),
('da_DK', '2.7.1', 'Dansk [DK]'),
('de_DE', '2.7.2', 'Deutsch [DE]'),
('dv_MV', '2.5.0', 'Dhivehi [MV]'),
('en_GB', '2.7.0', 'English [GB]'),
('en_UK', '2.7.1', 'English [UK]'),
('en_US', '2.7.1', 'English [US]'),
('es_ES', '2.7.0', 'Español [ES]'),
('eo_EO', '2.7.1', 'Esperanto [EO]'),
('et_EE', '2.7.0', 'Estonian [EE]'),
('eu_ES', '2.7.0', 'Euskara [ES]'),
('fi_FI', '2.7.1', 'Finnish [FI]'),
('fr_FR', '2.7.0', 'Français [FR]'),
('fr_CA', '2.7.0', 'Français [QC]'),
('ga_IE', '2.5.0', 'Gaeilge [IE]'),
('gl_ES', '2.7.1', 'Galego [ES]'),
('hr_HR', '2.7.1', 'Hrvatski [HR]'),
('it_IT', '2.7.0', 'Italiano [IT]'),
('lv_LV', '2.7.0', 'Latviešu [LV]'),
('lt_LT', '2.7.0', 'Lietuviu [LT]'),
('lb_LU', '2.7.0', 'Lëtzebuergesch [LU]'),
('hu_HU', '2.7.1', 'Magyar [HU]'),
('ms_MY', '2.5.0', 'Malay [MY]'),
('es_MX', '2.7.1', 'México [MX]'),
('nl_NL', '2.7.1', 'Nederlands [NL]'),
('nb_NO', '2.7.2', 'Norsk bokmål [NO]'),
('nn_NO', '2.7.0', 'Norwegian nynorsk [NO]'),
('pl_PL', '2.7.0', 'Polski [PL]'),
('pt_PT', '2.7.1', 'Português [PT]'),
('ro_RO', '2.7.0', 'Română [RO]'),
('sk_SK', '2.7.0', 'Slovensky [SK]'),
('sl_SI', '2.7.0', 'Slovenšcina [SI]'),
('sh_RS', '2.7.0', 'Srpski [SR]'),
('sv_SE', '2.7.1', 'Svenska [SE]'),
('vi_VN', '2.7.0', 'Tiếng Việt [VN]'),
('tr_TR', '2.7.0', 'Türkçe [TR]'),
('wo_SN', '2.6.0', 'Wolof [SN]'),
('is_IS', '2.7.0', 'Íslenska [IS]'),
('cs_CZ', '2.7.1', 'Česky [CZ]'),
('el_GR', '2.7.0', 'Ελληνικά [GR]'),
('bg_BG', '2.7.1', 'Български [BG]'),
('mk_MK', '2.7.0', 'Македонски [MK]'),
('mn_MN', '2.7.2', 'Монгол [MN]'),
('ru_RU', '2.7.2', 'Русский [RU]'),
('sr_RS', '2.7.2', 'Српски [SR]'),
('uk_UA', '2.7.0', 'Українська [UA]'),
('he_IL', '2.7.0', 'עברית [IL]'),
('ar_SA', '2.7.0', 'العربية [AR]'),
('ar_MA', '2.5.0', 'العربية [MA]'),
('fa_IR', '2.7.1', 'پارسی [IR]'),
('kok_IN', '2.5.0', 'कोंकणी [IN]'),
('bn_IN', '2.5.0', 'বাংলা[IN]'),
('gu_IN', '2.6.0', 'ગુજરાતી[IN]'),
('ta_IN', '2.7.0', 'தமிழ் [IN]'),
('kn_IN', '2.7.0', 'ಕನ್ನಡ [IN]'),
('th_TH', '2.7.1', 'ภาษาไทย [TH]'),
('ka_GE', '2.7.0', 'ქართული [GE]'),
('km_KH', '2.7.0', 'ខ្មែរ [KH]'),
('zh_TW', '2.7.0', '中文 (繁體) [TW]'),
('zh_HK', '2.7.0', '中文 (香港) [HK]'),
('ja_JP', '2.7.2', '日本語 [JP]'),
('zh_CN', '2.7.0', '简体中文 [CN]'),
('ko_KR', '2.7.0', '한국어 [KR]');

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_old_permalinks`
--

CREATE TABLE IF NOT EXISTS `piwigo_old_permalinks` (
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `permalink` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `date_deleted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_hit` datetime DEFAULT NULL,
  `hit` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`permalink`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_plugins`
--

CREATE TABLE IF NOT EXISTS `piwigo_plugins` (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `state` enum('inactive','active') NOT NULL DEFAULT 'inactive',
  `version` varchar(64) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `piwigo_plugins`
--

INSERT INTO `piwigo_plugins` (`id`, `state`, `version`) VALUES
('TakeATour', 'active', '2.7.4'),
('AdminTools', 'active', '2.7.3'),
('language_switch', 'active', '2.7.1'),
('LocalFilesEditor', 'active', '2.7.1');

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_rate`
--

CREATE TABLE IF NOT EXISTS `piwigo_rate` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `element_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `anonymous_id` varchar(45) NOT NULL DEFAULT '',
  `rate` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`element_id`,`user_id`,`anonymous_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_search`
--

CREATE TABLE IF NOT EXISTS `piwigo_search` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `last_seen` date DEFAULT NULL,
  `rules` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_sessions`
--

CREATE TABLE IF NOT EXISTS `piwigo_sessions` (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `data` mediumtext NOT NULL,
  `expiration` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `piwigo_sessions`
--

INSERT INTO `piwigo_sessions` (`id`, `data`, `expiration`) VALUES
('7F00vlcsvr3hm8oeslvmm13kucbvl5', 'pwg_uid|i:1;pwg_device|s:7:"desktop";pwg_mobile_theme|b:0;pwg_tour_to_launch|s:19:"tours/first_contact";need_update|b:0;extensions_need_update|a:1:{s:7:"plugins";a:1:{s:15:"language_switch";s:5:"2.7.2";}}incompatible_plugins|a:1:{s:10:"~~expire~~";i:1438364980;}pwg_multiview|a:8:{s:7:"view_as";s:1:"1";s:5:"theme";s:7:"elegant";s:4:"lang";s:5:"en_US";s:12:"show_queries";b:0;s:10:"debug_l10n";b:0;s:14:"debug_template";b:0;s:22:"template_combine_files";b:1;s:10:"no_history";b:0;}selected_category|a:1:{i:0;s:1:"1";}', '2015-07-31 10:47:23');

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_sites`
--

CREATE TABLE IF NOT EXISTS `piwigo_sites` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `galleries_url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sites_ui1` (`galleries_url`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `piwigo_sites`
--

INSERT INTO `piwigo_sites` (`id`, `galleries_url`) VALUES
(1, './galleries/');

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_tags`
--

CREATE TABLE IF NOT EXISTS `piwigo_tags` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `url_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `tags_i1` (`url_name`),
  KEY `lastmodified` (`lastmodified`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_themes`
--

CREATE TABLE IF NOT EXISTS `piwigo_themes` (
  `id` varchar(64) NOT NULL DEFAULT '',
  `version` varchar(64) NOT NULL DEFAULT '0',
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `piwigo_themes`
--

INSERT INTO `piwigo_themes` (`id`, `version`, `name`) VALUES
('elegant', '2.7.2', 'elegant'),
('smartpocket', '2.7.2', 'Smart Pocket');

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_upgrade`
--

CREATE TABLE IF NOT EXISTS `piwigo_upgrade` (
  `id` varchar(20) NOT NULL DEFAULT '',
  `applied` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `piwigo_upgrade`
--

INSERT INTO `piwigo_upgrade` (`id`, `applied`, `description`) VALUES
('61', '2015-07-31 10:19:14', 'upgrade included in installation'),
('62', '2015-07-31 10:19:14', 'upgrade included in installation'),
('63', '2015-07-31 10:19:14', 'upgrade included in installation'),
('64', '2015-07-31 10:19:14', 'upgrade included in installation'),
('65', '2015-07-31 10:19:14', 'upgrade included in installation'),
('66', '2015-07-31 10:19:14', 'upgrade included in installation'),
('67', '2015-07-31 10:19:14', 'upgrade included in installation'),
('68', '2015-07-31 10:19:14', 'upgrade included in installation'),
('69', '2015-07-31 10:19:14', 'upgrade included in installation'),
('70', '2015-07-31 10:19:14', 'upgrade included in installation'),
('71', '2015-07-31 10:19:14', 'upgrade included in installation'),
('72', '2015-07-31 10:19:14', 'upgrade included in installation'),
('73', '2015-07-31 10:19:14', 'upgrade included in installation'),
('74', '2015-07-31 10:19:14', 'upgrade included in installation'),
('75', '2015-07-31 10:19:14', 'upgrade included in installation'),
('76', '2015-07-31 10:19:14', 'upgrade included in installation'),
('77', '2015-07-31 10:19:14', 'upgrade included in installation'),
('78', '2015-07-31 10:19:14', 'upgrade included in installation'),
('79', '2015-07-31 10:19:14', 'upgrade included in installation'),
('80', '2015-07-31 10:19:14', 'upgrade included in installation'),
('81', '2015-07-31 10:19:14', 'upgrade included in installation'),
('82', '2015-07-31 10:19:14', 'upgrade included in installation'),
('83', '2015-07-31 10:19:14', 'upgrade included in installation'),
('84', '2015-07-31 10:19:14', 'upgrade included in installation'),
('85', '2015-07-31 10:19:14', 'upgrade included in installation'),
('86', '2015-07-31 10:19:14', 'upgrade included in installation'),
('87', '2015-07-31 10:19:14', 'upgrade included in installation'),
('88', '2015-07-31 10:19:14', 'upgrade included in installation'),
('89', '2015-07-31 10:19:14', 'upgrade included in installation'),
('90', '2015-07-31 10:19:14', 'upgrade included in installation'),
('91', '2015-07-31 10:19:14', 'upgrade included in installation'),
('92', '2015-07-31 10:19:14', 'upgrade included in installation'),
('93', '2015-07-31 10:19:14', 'upgrade included in installation'),
('94', '2015-07-31 10:19:14', 'upgrade included in installation'),
('95', '2015-07-31 10:19:14', 'upgrade included in installation'),
('96', '2015-07-31 10:19:14', 'upgrade included in installation'),
('97', '2015-07-31 10:19:14', 'upgrade included in installation'),
('98', '2015-07-31 10:19:14', 'upgrade included in installation'),
('99', '2015-07-31 10:19:14', 'upgrade included in installation'),
('100', '2015-07-31 10:19:14', 'upgrade included in installation'),
('101', '2015-07-31 10:19:14', 'upgrade included in installation'),
('102', '2015-07-31 10:19:14', 'upgrade included in installation'),
('103', '2015-07-31 10:19:14', 'upgrade included in installation'),
('104', '2015-07-31 10:19:14', 'upgrade included in installation'),
('105', '2015-07-31 10:19:14', 'upgrade included in installation'),
('106', '2015-07-31 10:19:14', 'upgrade included in installation'),
('107', '2015-07-31 10:19:14', 'upgrade included in installation'),
('108', '2015-07-31 10:19:14', 'upgrade included in installation'),
('109', '2015-07-31 10:19:14', 'upgrade included in installation'),
('110', '2015-07-31 10:19:14', 'upgrade included in installation'),
('111', '2015-07-31 10:19:14', 'upgrade included in installation'),
('112', '2015-07-31 10:19:14', 'upgrade included in installation'),
('113', '2015-07-31 10:19:14', 'upgrade included in installation'),
('114', '2015-07-31 10:19:14', 'upgrade included in installation'),
('115', '2015-07-31 10:19:14', 'upgrade included in installation'),
('116', '2015-07-31 10:19:14', 'upgrade included in installation'),
('117', '2015-07-31 10:19:14', 'upgrade included in installation'),
('118', '2015-07-31 10:19:14', 'upgrade included in installation'),
('119', '2015-07-31 10:19:14', 'upgrade included in installation'),
('120', '2015-07-31 10:19:14', 'upgrade included in installation'),
('121', '2015-07-31 10:19:14', 'upgrade included in installation'),
('122', '2015-07-31 10:19:14', 'upgrade included in installation'),
('123', '2015-07-31 10:19:14', 'upgrade included in installation'),
('124', '2015-07-31 10:19:14', 'upgrade included in installation'),
('125', '2015-07-31 10:19:14', 'upgrade included in installation'),
('126', '2015-07-31 10:19:14', 'upgrade included in installation'),
('127', '2015-07-31 10:19:14', 'upgrade included in installation'),
('128', '2015-07-31 10:19:14', 'upgrade included in installation'),
('129', '2015-07-31 10:19:14', 'upgrade included in installation'),
('130', '2015-07-31 10:19:14', 'upgrade included in installation'),
('131', '2015-07-31 10:19:14', 'upgrade included in installation'),
('132', '2015-07-31 10:19:14', 'upgrade included in installation'),
('133', '2015-07-31 10:19:14', 'upgrade included in installation'),
('134', '2015-07-31 10:19:14', 'upgrade included in installation'),
('135', '2015-07-31 10:19:14', 'upgrade included in installation'),
('136', '2015-07-31 10:19:14', 'upgrade included in installation'),
('137', '2015-07-31 10:19:14', 'upgrade included in installation'),
('138', '2015-07-31 10:19:14', 'upgrade included in installation'),
('139', '2015-07-31 10:19:14', 'upgrade included in installation'),
('140', '2015-07-31 10:19:14', 'upgrade included in installation'),
('141', '2015-07-31 10:19:14', 'upgrade included in installation'),
('142', '2015-07-31 10:19:14', 'upgrade included in installation'),
('143', '2015-07-31 10:19:14', 'upgrade included in installation'),
('144', '2015-07-31 10:19:14', 'upgrade included in installation');

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_users`
--

CREATE TABLE IF NOT EXISTS `piwigo_users` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `password` varchar(255) DEFAULT NULL,
  `mail_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_ui1` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `piwigo_users`
--

INSERT INTO `piwigo_users` (`id`, `username`, `password`, `mail_address`) VALUES
(1, 'admin', '5f4dcc3b5aa765d61d8327deb882cf99', 'abhinay212@gmail.com'),
(2, 'guest', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_user_access`
--

CREATE TABLE IF NOT EXISTS `piwigo_user_access` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_user_cache`
--

CREATE TABLE IF NOT EXISTS `piwigo_user_cache` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `need_update` enum('true','false') NOT NULL DEFAULT 'true',
  `cache_update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `forbidden_categories` mediumtext,
  `nb_total_images` mediumint(8) unsigned DEFAULT NULL,
  `last_photo_date` datetime DEFAULT NULL,
  `nb_available_tags` int(5) DEFAULT NULL,
  `nb_available_comments` int(5) DEFAULT NULL,
  `image_access_type` enum('NOT IN','IN') NOT NULL DEFAULT 'NOT IN',
  `image_access_list` mediumtext,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `piwigo_user_cache`
--

INSERT INTO `piwigo_user_cache` (`user_id`, `need_update`, `cache_update_time`, `forbidden_categories`, `nb_total_images`, `last_photo_date`, `nb_available_tags`, `nb_available_comments`, `image_access_type`, `image_access_list`) VALUES
(1, 'false', 1438364772, '0', 6, '2015-07-31 10:44:27', 0, 0, 'NOT IN', '0');

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_user_cache_categories`
--

CREATE TABLE IF NOT EXISTS `piwigo_user_cache_categories` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `date_last` datetime DEFAULT NULL,
  `max_date_last` datetime DEFAULT NULL,
  `nb_images` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `count_images` mediumint(8) unsigned DEFAULT '0',
  `nb_categories` mediumint(8) unsigned DEFAULT '0',
  `count_categories` mediumint(8) unsigned DEFAULT '0',
  `user_representative_picture_id` mediumint(8) unsigned DEFAULT NULL,
  PRIMARY KEY (`user_id`,`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `piwigo_user_cache_categories`
--

INSERT INTO `piwigo_user_cache_categories` (`user_id`, `cat_id`, `date_last`, `max_date_last`, `nb_images`, `count_images`, `nb_categories`, `count_categories`, `user_representative_picture_id`) VALUES
(1, 1, '2015-07-31 10:44:27', '2015-07-31 10:44:27', 6, 6, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_user_feed`
--

CREATE TABLE IF NOT EXISTS `piwigo_user_feed` (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `last_check` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_user_group`
--

CREATE TABLE IF NOT EXISTS `piwigo_user_group` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_user_infos`
--

CREATE TABLE IF NOT EXISTS `piwigo_user_infos` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `nb_image_page` smallint(3) unsigned NOT NULL DEFAULT '15',
  `status` enum('webmaster','admin','normal','generic','guest') NOT NULL DEFAULT 'guest',
  `language` varchar(50) NOT NULL DEFAULT 'en_UK',
  `expand` enum('true','false') NOT NULL DEFAULT 'false',
  `show_nb_comments` enum('true','false') NOT NULL DEFAULT 'false',
  `show_nb_hits` enum('true','false') NOT NULL DEFAULT 'false',
  `recent_period` tinyint(3) unsigned NOT NULL DEFAULT '7',
  `theme` varchar(255) NOT NULL DEFAULT 'elegant',
  `registration_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `enabled_high` enum('true','false') NOT NULL DEFAULT 'true',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `activation_key` varchar(255) DEFAULT NULL,
  `activation_key_expire` datetime DEFAULT NULL,
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  KEY `lastmodified` (`lastmodified`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `piwigo_user_infos`
--

INSERT INTO `piwigo_user_infos` (`user_id`, `nb_image_page`, `status`, `language`, `expand`, `show_nb_comments`, `show_nb_hits`, `recent_period`, `theme`, `registration_date`, `enabled_high`, `level`, `activation_key`, `activation_key_expire`, `lastmodified`) VALUES
(1, 15, 'webmaster', 'en_US', 'false', 'false', 'false', 7, 'elegant', '2015-07-31 10:19:13', 'true', 8, NULL, NULL, '2015-07-31 17:19:14'),
(2, 15, 'guest', 'en_US', 'false', 'false', 'false', 7, 'elegant', '2015-07-31 10:19:13', 'true', 0, NULL, NULL, '2015-07-31 17:19:14');

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_user_mail_notification`
--

CREATE TABLE IF NOT EXISTS `piwigo_user_mail_notification` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `check_key` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `enabled` enum('true','false') NOT NULL DEFAULT 'false',
  `last_send` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_mail_notification_ui1` (`check_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
