-- phpMyAdmin SQL Dump
-- version 2.11.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 18, 2009 at 09:14 AM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `joomla`
--

-- --------------------------------------------------------

--
-- Table structure for table `jos_banner`
--

DROP TABLE IF EXISTS `jos_banner`;
CREATE TABLE IF NOT EXISTS `jos_banner` (
  `bid` int(11) NOT NULL auto_increment,
  `cid` int(11) NOT NULL default '0',
  `type` varchar(30) NOT NULL default 'banner',
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `imptotal` int(11) NOT NULL default '0',
  `impmade` int(11) NOT NULL default '0',
  `clicks` int(11) NOT NULL default '0',
  `imageurl` varchar(100) NOT NULL default '',
  `clickurl` varchar(200) NOT NULL default '',
  `date` datetime default NULL,
  `showBanner` tinyint(1) NOT NULL default '0',
  `checked_out` tinyint(1) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `editor` varchar(50) default NULL,
  `custombannercode` text,
  `catid` int(10) unsigned NOT NULL default '0',
  `description` text NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `publish_up` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL default '0000-00-00 00:00:00',
  `tags` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY  (`bid`),
  KEY `viewbanner` (`showBanner`),
  KEY `idx_banner_catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_banner`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_bannerclient`
--

DROP TABLE IF EXISTS `jos_bannerclient`;
CREATE TABLE IF NOT EXISTS `jos_bannerclient` (
  `cid` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `contact` varchar(255) NOT NULL default '',
  `email` varchar(255) NOT NULL default '',
  `extrainfo` text NOT NULL,
  `checked_out` tinyint(1) NOT NULL default '0',
  `checked_out_time` time default NULL,
  `editor` varchar(50) default NULL,
  PRIMARY KEY  (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_bannerclient`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_bannertrack`
--

DROP TABLE IF EXISTS `jos_bannertrack`;
CREATE TABLE IF NOT EXISTS `jos_bannertrack` (
  `track_date` date NOT NULL default '0000-00-00',
  `track_type` int(10) unsigned NOT NULL default '0',
  `banner_id` int(10) unsigned NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_bannertrack`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_categories`
--

DROP TABLE IF EXISTS `jos_categories`;
CREATE TABLE IF NOT EXISTS `jos_categories` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `image` varchar(255) NOT NULL default '',
  `section` varchar(50) NOT NULL default '',
  `image_position` varchar(30) NOT NULL default '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `editor` varchar(50) default NULL,
  `ordering` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `count` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  `contact_section` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `cat_idx` (`section`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=103 ;

--
-- Dumping data for table `jos_categories`
--

INSERT INTO `jos_categories` (`id`, `parent_id`, `title`, `name`, `alias`, `image`, `section`, `image_position`, `description`, `published`, `checked_out`, `checked_out_time`, `editor`, `ordering`, `access`, `count`, `params`, `contact_section`) VALUES
(1, 0, 'Division Information', '', 'division-information', '', '1', 'left', 'Information about the Southern Asia Division.', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, '', NULL),
(2, 0, 'SDA Information', '', 'sda-info', '', '1', 'left', 'General information about Seventh-day Adventists.', 1, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, '', NULL),
(3, 0, 'TestDirectory', '', 'testdirectory', '', 'com_qcontacts_details', 'left', 'None', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, '', NULL),
(4, 0, 'Communication', '', 'department-of-communication', '', 'com_contact_details', 'left', 'The department of communication serves to make contact with the world to tell them about Jesus.', 1, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, '', 1),
(5, 0, 'Education', '', 'department-of-education', '', 'com_contact_details', 'left', 'The Department of Education exists to educate others about Jesus.', 1, 0, '0000-00-00 00:00:00', NULL, 3, 0, 0, '', 1),
(7, 0, 'Administrators', '', 'administrators', '', 'com_contact_details', 'left', '', 1, 62, '2008-12-12 05:47:35', NULL, 1, 0, 0, '', 1),
(8, 0, 'Secretariat', '', 'secretariat', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 4, 0, 0, '', 1),
(13, 0, 'PARL', '', 'parl', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 9, 0, 0, '', 1),
(9, 0, 'Treasury', '', 'treasury', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 5, 0, 0, '', 1),
(10, 0, 'Children''s Ministries', '', 'child-ministries', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 6, 0, 0, '', 1),
(11, 0, 'Church Nurturing Ministries', '', 'church-nurturing-ministries', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 7, 0, 0, '', 1),
(12, 0, 'Chaplaincy', '', 'chaplaincy', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 8, 0, 0, '', 1),
(14, 0, 'Faith Development In Context', '', 'faith-development-in-context', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 10, 0, 0, '', 1),
(15, 0, 'Adventist Child India', '', 'adventist-child-india', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 11, 0, 0, '', 1),
(16, 0, 'Family', '', 'family', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 12, 0, 0, '', 1),
(17, 0, 'Youth', '', 'youth', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 13, 0, 0, '', 1),
(18, 0, 'Global Mission', '', 'global-mission', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 14, 0, 0, '', 1),
(19, 0, 'Health and Temperance', '', 'health-and-temperance', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 15, 0, 0, '', 1),
(20, 0, 'Stewardship', '', 'stewardship', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 16, 0, 0, '', 1),
(21, 0, 'Department of Legal Affairs', '', 'legal-affairs', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 17, 0, 0, '', 1),
(22, 0, 'Ministerial', '', 'ministerial', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 18, 0, 0, '', 1),
(23, 0, 'Publishing', '', 'publishing', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 19, 0, 0, '', 1),
(24, 0, 'Retirement Plan', '', 'retirement-plan', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 20, 0, 0, '', 1),
(25, 0, 'Sabbath School', '', 'sabbath-school', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 21, 0, 0, '', 1),
(26, 0, 'Personal Ministries', '', 'personal-ministries', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 22, 0, 0, '', 1),
(27, 0, 'Ministry to the Blind', '', 'ministry-to-the-blind', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 23, 0, 0, '', 1),
(28, 0, 'Special Ministries', '', 'special-ministries', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 24, 0, 0, '', 1),
(29, 0, 'TRUST Services', '', 'trust-services', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 25, 0, 0, '', 1),
(30, 0, 'Women''s Ministries', '', 'womens-ministries', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 26, 0, 0, '', 1),
(31, 0, 'Auditing Service', '', 'auditing-service', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 27, 0, 0, '', 1),
(32, 0, 'Southern Asia Tidings', '', 'southern-asia-tidings', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 28, 0, 0, '', 1),
(33, 0, 'Hinduism Study Center', '', 'hinduism-study-center', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 29, 0, 0, '', 1),
(34, 0, 'Spirit of Prophecy', '', 'spirit-of-prophecy', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 30, 0, 0, '', 1),
(35, 0, 'Satellite Evangelism', '', 'satellite-evangelism', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 31, 0, 0, '', 1),
(36, 0, 'Building', '', 'building', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 32, 0, 0, '', 1),
(37, 0, 'Adventist Risk Management', '', 'adventist-risk-management', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 33, 0, 0, '', 1),
(38, 0, 'Adventist Volunteer Service', '', 'adventist-volunteer-service', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 34, 0, 0, '', 1),
(39, 0, 'Adventist Media Centre', '', 'adventist-media-centre', '', 'com_contact_details', 'left', '<ul class="addressInformation">   <li>Post Box 1446, Marketyard</li>   <li>Pune 411 037,</li>   <li>Maharashtra</li>   <li><strong>Telephone</strong>:  (020) 2427 1483/24265450</li>   <li><strong>Fax</strong>:  (020) 2427 - 1483</li>   <li><strong>Email</strong>:<ul class="emails">            <li><a href="mailto:amc@pn2.vsnl.net.in">amc@pn2.vsnl.net.in</a></li>            <li><a href="mailto:amc3@vsnl.com">amc3@vsnl.com</a></li>            </ul>    </li>    </ul>', 1, 0, '0000-00-00 00:00:00', NULL, 35, 0, 0, '', 1),
(40, 0, 'Oriental Watchman Publishing House', '', 'oriental-watchman-publishing-house', '', 'com_contact_details', 'left', '<ul class="addressInformation">   <li>Post Box 1417, Salisbury Park</li>   <li>Pune 411 037</li>   <li><strong>Telephone</strong>: 91(020)242-614-41/242-730-17</li>   <li><strong>Fax</strong>: 91(020)242-616-38</li>   <li><strong>Email</strong>: <ul class="emails"><li>owph@pn2.vsnl.net.in</li></ul></li></ul>', 1, 0, '0000-00-00 00:00:00', NULL, 36, 0, 0, '', 1),
(41, 0, 'Intra Church Publications', '', 'intra-church-publications', '', 'com_contact_details', 'left', '<ul class="addressInformation"> <li>P O Box 1413</li> <li>Salisbury Park</li> <li>Pune 411 037</li> <li><strong>Telephone</strong>: 91(020)562-648-05</li> </ul>', 1, 0, '0000-00-00 00:00:00', NULL, 37, 0, 0, '', 1),
(42, 0, 'Legal Affairs', '', 'legal-affairs', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 38, 0, 0, '', 1),
(43, 0, 'Unions', '', 'unions', '', '2', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, '', NULL),
(45, 0, 'East - Central India Union', '', 'east-central-india-union', '', 'com_contact_details', 'left', '<ul class="addressInformation">\r\n  <li>2 Chapel Road</li>\r\n  <li>Hyderabad 500 001</li>\r\n  <li>Andhra Pradesh</li>\r\n  <li><strong>Telephone</strong>: 91(040)232-018-32/232-000-79</li>\r\n  <li><strong>Fax</strong>:  (040)232-027-04</li>\r\n  <li><strong>E-mail</strong>:   \r\n    <ul class="emails">\r\n      <li>ciusda1@sify.com</li>\r\n    </ul>\r\n  </li>\r\n</ul>', 1, 0, '0000-00-00 00:00:00', NULL, 39, 0, 0, '', 2),
(46, 0, 'Western India Union', '', 'western-india-union', '', 'com_contact_details', 'left', '<ul class="addressInformation">\r\n  <li>Post Box 1413, Market Yard</li>\r\n  <li>Pune 411 037</li>\r\n  <li>Maharashtra</li>\r\n  <li><strong>Telephone</strong>:  91(020)242-718-96, 242-718-9</li>\r\n  <li><strong>Fax</strong>:  91(020)242-730-20</li>\r\n</ul>', 1, 0, '0000-00-00 00:00:00', NULL, 40, 0, 0, '', 2),
(47, 0, 'Southwest India Union', '', 'southwest-india-union', '', 'com_contact_details', 'left', '<ul class="addressInformation">\r\n  <li>B. No. 753, Evergreen Lane</li>\r\n  <li>Moospet Road</li>\r\n  <li>Thrissur 680 005</li>\r\n  <li>Kerala</li>\r\n  <li><strong>Telephone</strong>:  91(0487)244-0341, 244-0343</li>\r\n  <li><strong>Fax</strong>:  91(0487)-2440-343</li>\r\n  <li><strong>E-mail</strong>:  \r\n    <ul class="emails"><li>keusda@sancharnet.in</li></ul>\r\n  </li>\r\n</ul>', 1, 0, '0000-00-00 00:00:00', NULL, 41, 0, 0, '', 2),
(48, 0, 'Southeast India Union', '', 'southeast-india-union', '', 'com_contact_details', 'left', '<ul class="addressInformation">\r\n  <li>197 GST Road, Vandalur</li>\r\n  <li>Chennai 600 048</li>\r\n  <li>Tamil Nadu</li>\r\n  <li><strong>Telephone</strong>:  91(044)223-995-95, 223-995-96</li>\r\n  <li><strong>Fax</strong>:  91(044)223-996-52</li>\r\n  <li><strong>E-mail</strong>:  <ul class="emails"><li>siu_sda@vsnl.net</li></ul></li>\r\n</ul>', 1, 0, '0000-00-00 00:00:00', NULL, 42, 0, 0, '', 2),
(49, 0, 'South - Central India Union', '', 'south-central-india-union', '', 'com_contact_details', 'left', '<ul class="addressInformation">\r\n  <li>Spencer Road</li>\r\n  <li>Frazer Town</li>\r\n  <li>Bangalore 560 005</li>\r\n  <li>Karnataka</li>\r\n  <li><strong>Telephone</strong>:  91(080)255-671-27, 255-698-378</li>\r\n  <li><strong>Fax</strong>:  91(080)253-027-21</li>\r\n</ul>', 1, 0, '0000-00-00 00:00:00', NULL, 43, 0, 0, '', 2),
(50, 0, 'Northern India Union', '', 'northern-india-union', '', 'com_contact_details', 'left', '<ul class="addressInformation">\r\n  <li>11 Hailey Road</li>\r\n  <li>New Delhi 110 001</li>\r\n  <li><strong>Telephone</strong>:  91(011)233-249-59, 233-296-81</li>\r\n  <li><strong>Fax</strong>:  91(011)233-249-59</li>\r\n  <li><strong>E-mail</strong>:  <ul class="emails"><li>niusda@vsnl.com</li></ul></li>\r\n</ul>', 1, 0, '0000-00-00 00:00:00', NULL, 44, 0, 0, '', 2),
(51, 0, 'Northeast India Union', '', 'northeast-india-union', '', 'com_contact_details', 'left', '<ul class="addressInformation">\r\n  <li>"Santana," Laitumkhrah</li>\r\n  <li>Shillong 793 003</li>\r\n  <li>Meghalaya</li>\r\n  <li><strong>Telephone</strong>:  91(0364)252-2471</li>\r\n  <li><strong>Fax</strong>:  91(0364)252-2471</li>\r\n  <li><strong>E-mail</strong>:  \r\n    <ul class="emails"><li>neiusda1@sancharnet.in</li></ul>\r\n  </li>\r\n</ul>', 1, 0, '0000-00-00 00:00:00', NULL, 45, 0, 0, '', 2),
(52, 0, 'The Developers', '', 'the-developers', '', 'com_contact_details', 'left', 'The illustrious people who work on this website.', 1, 0, '0000-00-00 00:00:00', NULL, 46, 0, 0, '', NULL),
(53, 0, 'Division News', '', 'division-news', '', '3', 'left', 'News from the Southern Asia Division of Seventh-day Adventists.', 1, 0, '0000-00-00 00:00:00', NULL, 3, 0, 0, '', 0),
(54, 0, 'Barn', '', 'barn', '', '4', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, '', 0),
(55, 0, 'India Financial Association', '', 'india-financial-association', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 47, 0, 0, '', NULL),
(56, 0, 'Communication', '', 'department-of-communication', '', 'com_directory', 'left', 'The department of communication serves to make contact with the world to tell them about Jesus.', 1, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, '', 1),
(57, 0, 'Education', '', 'department-of-education', '', 'com_directory', 'left', 'The Department of Education exists to educate others about Jesus.', 1, 0, '0000-00-00 00:00:00', NULL, 3, 0, 0, '', 1),
(58, 0, 'Administrators', '', 'administrators', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, '', 1),
(59, 0, 'Secretariat', '', 'secretariat', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 4, 0, 0, '', 1),
(60, 0, 'PARL', '', 'parl', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 9, 0, 0, '', 1),
(61, 0, 'Treasury', '', 'treasury', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 5, 0, 0, '', 1),
(62, 0, 'Children''s Ministries', '', 'child-ministries', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 6, 0, 0, '', 1),
(63, 0, 'Church Nurturing Ministries', '', 'church-nurturing-ministries', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 7, 0, 0, '', 1),
(64, 0, 'Chaplaincy', '', 'chaplaincy', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 8, 0, 0, '', 1),
(65, 0, 'Faith Development In Context', '', 'faith-development-in-context', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 10, 0, 0, '', 1),
(66, 0, 'Adventist Child India', '', 'adventist-child-india', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 11, 0, 0, '', 1),
(67, 0, 'Family', '', 'family', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 12, 0, 0, '', 1),
(68, 0, 'Youth', '', 'youth', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 13, 0, 0, '', 1),
(69, 0, 'Global Mission', '', 'global-mission', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 14, 0, 0, '', 1),
(70, 0, 'Health and Temperance', '', 'health-and-temperance', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 15, 0, 0, '', 1),
(71, 0, 'Stewardship', '', 'stewardship', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 16, 0, 0, '', 1),
(72, 0, 'Department of Legal Affairs', '', 'legal-affairs', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 17, 0, 0, '', 1),
(73, 0, 'Ministerial', '', 'ministerial', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 18, 0, 0, '', 1),
(74, 0, 'Publishing', '', 'publishing', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 19, 0, 0, '', 1),
(75, 0, 'Retirement Plan', '', 'retirement-plan', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 20, 0, 0, '', 1),
(76, 0, 'Sabbath School', '', 'sabbath-school', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 21, 0, 0, '', 1),
(77, 0, 'Personal Ministries', '', 'personal-ministries', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 22, 0, 0, '', 1),
(78, 0, 'Ministry to the Blind', '', 'ministry-to-the-blind', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 23, 0, 0, '', 1),
(79, 0, 'Special Ministries', '', 'special-ministries', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 24, 0, 0, '', 1),
(80, 0, 'TRUST Services', '', 'trust-services', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 25, 0, 0, '', 1),
(81, 0, 'Women''s Ministries', '', 'womens-ministries', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 26, 0, 0, '', 1),
(82, 0, 'Auditing Service', '', 'auditing-service', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 27, 0, 0, '', 1),
(83, 0, 'Southern Asia Tidings', '', 'southern-asia-tidings', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 28, 0, 0, '', 1),
(84, 0, 'Hinduism Study Center', '', 'hinduism-study-center', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 29, 0, 0, '', 1),
(85, 0, 'Spirit of Prophecy', '', 'spirit-of-prophecy', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 30, 0, 0, '', 1),
(86, 0, 'Satellite Evangelism', '', 'satellite-evangelism', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 31, 0, 0, '', 1),
(87, 0, 'Building', '', 'building', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 32, 0, 0, '', 1),
(88, 0, 'Adventist Risk Management', '', 'adventist-risk-management', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 33, 0, 0, '', 1),
(89, 0, 'Adventist Volunteer Service', '', 'adventist-volunteer-service', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 34, 0, 0, '', 1),
(90, 0, 'Adventist Media Centre', '', 'adventist-media-centre', '', 'com_directory', 'left', '<ul class="addressInformation">   <li>Post Box 1446, Marketyard</li>   <li>Pune 411 037,</li>   <li>Maharashtra</li>   <li><strong>Telephone</strong>:  (020) 2427 1483/24265450</li>   <li><strong>Fax</strong>:  (020) 2427 - 1483</li>   <li><strong>Email</strong>:<ul class="emails">            <li><a href="mailto:amc@pn2.vsnl.net.in">amc@pn2.vsnl.net.in</a></li>            <li><a href="mailto:amc3@vsnl.com">amc3@vsnl.com</a></li>            </ul>    </li>    </ul>', 1, 0, '0000-00-00 00:00:00', NULL, 35, 0, 0, '', 1),
(91, 0, 'Oriental Watchman Publishing House', '', 'oriental-watchman-publishing-house', '', 'com_directory', 'left', '<ul class="addressInformation">   <li>Post Box 1417, Salisbury Park</li>   <li>Pune 411 037</li>   <li><strong>Telephone</strong>: 91(020)242-614-41/242-730-17</li>   <li><strong>Fax</strong>: 91(020)242-616-38</li>   <li><strong>Email</strong>: <ul class="emails"><li>owph@pn2.vsnl.net.in</li></ul></li></ul>', 1, 0, '0000-00-00 00:00:00', NULL, 36, 0, 0, '', 1),
(92, 0, 'Intra Church Publications', '', 'intra-church-publications', '', 'com_directory', 'left', '<ul class="addressInformation"> <li>P O Box 1413</li> <li>Salisbury Park</li> <li>Pune 411 037</li> <li><strong>Telephone</strong>: 91(020)562-648-05</li> </ul>', 1, 0, '0000-00-00 00:00:00', NULL, 37, 0, 0, '', 1),
(93, 0, 'Legal Affairs', '', 'legal-affairs', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 38, 0, 0, '', 1),
(94, 0, 'East - Central India Union', '', 'east-central-india-union', '', 'com_directory', 'left', '<ul class="addressInformation">\r\n  <li>2 Chapel Road</li>\r\n  <li>Hyderabad 500 001</li>\r\n  <li>Andhra Pradesh</li>\r\n  <li><strong>Telephone</strong>: 91(040)232-018-32/232-000-79</li>\r\n  <li><strong>Fax</strong>:  (040)232-027-04</li>\r\n  <li><strong>E-mail</strong>:   \r\n    <ul class="emails">\r\n      <li>ciusda1@sify.com</li>\r\n    </ul>\r\n  </li>\r\n</ul>', 1, 0, '0000-00-00 00:00:00', NULL, 39, 0, 0, '', 2),
(95, 0, 'Western India Union', '', 'western-india-union', '', 'com_directory', 'left', '<ul class="addressInformation">\r\n  <li>Post Box 1413, Market Yard</li>\r\n  <li>Pune 411 037</li>\r\n  <li>Maharashtra</li>\r\n  <li><strong>Telephone</strong>:  91(020)242-718-96, 242-718-9</li>\r\n  <li><strong>Fax</strong>:  91(020)242-730-20</li>\r\n</ul>', 1, 0, '0000-00-00 00:00:00', NULL, 40, 0, 0, '', 2),
(96, 0, 'Southwest India Union', '', 'southwest-india-union', '', 'com_directory', 'left', '<ul class="addressInformation">\r\n  <li>B. No. 753, Evergreen Lane</li>\r\n  <li>Moospet Road</li>\r\n  <li>Thrissur 680 005</li>\r\n  <li>Kerala</li>\r\n  <li><strong>Telephone</strong>:  91(0487)244-0341, 244-0343</li>\r\n  <li><strong>Fax</strong>:  91(0487)-2440-343</li>\r\n  <li><strong>E-mail</strong>:  \r\n    <ul class="emails"><li>keusda@sancharnet.in</li></ul>\r\n  </li>\r\n</ul>', 1, 0, '0000-00-00 00:00:00', NULL, 41, 0, 0, '', 2),
(97, 0, 'Southeast India Union', '', 'southeast-india-union', '', 'com_directory', 'left', '<ul class="addressInformation">\r\n  <li>197 GST Road, Vandalur</li>\r\n  <li>Chennai 600 048</li>\r\n  <li>Tamil Nadu</li>\r\n  <li><strong>Telephone</strong>:  91(044)223-995-95, 223-995-96</li>\r\n  <li><strong>Fax</strong>:  91(044)223-996-52</li>\r\n  <li><strong>E-mail</strong>:  <ul class="emails"><li>siu_sda@vsnl.net</li></ul></li>\r\n</ul>', 1, 0, '0000-00-00 00:00:00', NULL, 42, 0, 0, '', 2),
(98, 0, 'South - Central India Union', '', 'south-central-india-union', '', 'com_directory', 'left', '<ul class="addressInformation">\r\n  <li>Spencer Road</li>\r\n  <li>Frazer Town</li>\r\n  <li>Bangalore 560 005</li>\r\n  <li>Karnataka</li>\r\n  <li><strong>Telephone</strong>:  91(080)255-671-27, 255-698-378</li>\r\n  <li><strong>Fax</strong>:  91(080)253-027-21</li>\r\n</ul>', 1, 0, '0000-00-00 00:00:00', NULL, 43, 0, 0, '', 2),
(99, 0, 'Northern India Union', '', 'northern-india-union', '', 'com_directory', 'left', '<ul class="addressInformation">\r\n  <li>11 Hailey Road</li>\r\n  <li>New Delhi 110 001</li>\r\n  <li><strong>Telephone</strong>:  91(011)233-249-59, 233-296-81</li>\r\n  <li><strong>Fax</strong>:  91(011)233-249-59</li>\r\n  <li><strong>E-mail</strong>:  <ul class="emails"><li>niusda@vsnl.com</li></ul></li>\r\n</ul>', 1, 0, '0000-00-00 00:00:00', NULL, 44, 0, 0, '', 2),
(100, 0, 'Northeast India Union', '', 'northeast-india-union', '', 'com_directory', 'left', '<ul class="addressInformation">\r\n  <li>"Santana," Laitumkhrah</li>\r\n  <li>Shillong 793 003</li>\r\n  <li>Meghalaya</li>\r\n  <li><strong>Telephone</strong>:  91(0364)252-2471</li>\r\n  <li><strong>Fax</strong>:  91(0364)252-2471</li>\r\n  <li><strong>E-mail</strong>:  \r\n    <ul class="emails"><li>neiusda1@sancharnet.in</li></ul>\r\n  </li>\r\n</ul>', 1, 0, '0000-00-00 00:00:00', NULL, 45, 0, 0, '', 2),
(101, 0, 'The Developers', '', 'the-developers', '', 'com_directory', 'left', 'The illustrious people who work on this website.', 1, 0, '0000-00-00 00:00:00', NULL, 46, 0, 0, '', 1),
(102, 0, 'India Financial Association', '', 'india-financial-association', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 47, 0, 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_churches`
--

DROP TABLE IF EXISTS `jos_churches`;
CREATE TABLE IF NOT EXISTS `jos_churches` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `street2` varchar(255) default NULL,
  `city` varchar(255) default NULL,
  `state_id` int(11) NOT NULL,
  `conference_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=804 ;

--
-- Dumping data for table `jos_churches`
--

INSERT INTO `jos_churches` (`id`, `name`, `street`, `street2`, `city`, `state_id`, `conference_id`) VALUES
(8, 'Dudaknal', 'S/o Gyanappa', 'Mustapur-Shembelli Post', 'Aurad Tq. Bidar Dist.', 12, 5),
(217, 'Tarung SDA Church', 'Langol Tarung', '', 'Imphal West - 795004', 16, 19),
(5, 'Sorahalli', 'Mustapur-Shembelli Post', '', 'Aurad Tq. Bidar Dist.', 12, 5),
(6, 'Nagmarpaly', 'c/o Gyanappa', 'Mustapur-Shembelli Post', 'Aurad Tq. Bidar Dist.', 12, 5),
(9, 'Yanagunda', 'S/o Gyanappa', 'Mustapur-Shembelli Post', 'Aurad Tq. Bidar Dist.', 12, 5),
(10, 'Hokarna', 'C/o Jayanthappa Khengi', 'Christian House, Yesu Nagar, Chitguppa', 'Humnabad, Tq. Bidar Dist.', 12, 5),
(11, 'Patrupalli', 'C/o Jayanthappa Khengi', 'Christian House, Yesu Nagar, Chitguppa', 'Humnabad, Tq. Bidar Dist.', 12, 5),
(12, 'Dharmapur', 'C/o Jayanthappa Khengi', 'Christian House, Yesu Nagar, Chitguppa', 'Humnabad, Tq. Bidar Dist.', 12, 5),
(13, 'Bompalli', 'Christian Galli', 'Hallikhed (B)', 'Humnabad, Tq. Bidar Dist.', 12, 5),
(14, 'Mustapur', 'Christian Galli', 'Hallikhed (B)', 'Humnabad, Tq. Bidar Dist.', 12, 5),
(15, 'Jojana', 'Christian Galli', 'Hallikhed (B)', 'Humnabad, Tq. Bidar Dist.', 12, 5),
(16, 'Dupathmahagaon', 'Christian Galli', 'Hallikhed (B)', 'Humnabad, Tq. Bidar Dist.', 12, 5),
(17, 'Nerkundram', 'No. 2 Perumal Koil Street', 'Ramesh House, Nerkundram', 'Chennai - 600 107', 24, 9),
(19, 'Nehru Park Back Side', 'c/o Mr. Immanuel''s House', '11th St, Sasthiri Nagar, Nehru Park Back Side', 'Chennai', 24, 9),
(20, 'Tambaram West', '249, GST Road, Kadaperi', 'Tambaram West', 'Chennai - 600 045', 24, 9),
(21, 'New Perungalathur', 'No. 18B VOC Street', 'New Perungalathur', 'Chennai - 600 013', 24, 9),
(22, 'Kodambakkam', 'No. 14, Zachariah Colony 4th Street', 'Kodambakkam', 'Chennai - 600 094', 24, 9),
(23, 'Veperi SDA Taml Church', '36, Ritherden Road', 'Veperi', 'Chennai - 600 007', 24, 9),
(24, 'Porur SDA Church', 'New no. 4/4, Buddhar Colony', '1st Street, Karambakkam, Porur', 'Chennai - 600 116', 24, 9),
(25, 'SDA Church (Mouliwakkam)', 'Bharathiyar Street', 'Paraniputhur, Mangadu', 'Kancheepuram Dt.', 24, 9),
(26, 'Ambathur SDA Church', 'No. 13/49 Kulakkarai St.', 'Kamaraja Puram, Ambathur', 'Chennai - 600 053', 24, 9),
(27, 'Annanagar SDA Church', '73/1 New Colony', '12th Main Road End, Annanagar', 'Chennai - 600 040', 24, 9),
(28, 'Avadi SDA Church', 'No. 7, Thilagar Street, Sridevi Nagar', 'Kamaraj Nagar (post), Avadi', 'Chennai - 600 071', 24, 9),
(29, 'Thiruvallur SDA Church', '27, Ramasamy Street (Near Railway gate)', 'Thirunintravur 602 024', 'Thiruvallur (Dt)', 24, 9),
(30, 'Perambur SDA Church', 'Krishnadass Road 2nd Street', 'Mangalapuram, Perambur', 'Chennai - 600 011', 24, 9),
(31, 'Vyasarpadi SDA Church', 'No. 15, New Magazine Road', 'Vyasarpadi', 'Chennai - 600 039', 24, 9),
(32, 'Thiruvottiyur SDA Church', 'No. 18, 19 IInd Street Extn., Settu Colony', 'Thirunagar, Thiruvottiyur', 'Chennai - 600 019', 24, 9),
(33, 'Madipakkam SDA Church', 'Murugappa Nagar', 'Puzhuthivakkam, Madipakkam (Po)', 'Chennai - 600 091', 24, 9),
(34, 'Adambakkam SDA Church', '158 - A Masthan Glori St.', 'Adambakkam', 'Chennai - 600 088', 24, 9),
(35, 'Moolakkadai SDA Church', 'No. 13, Krishnan Street', 'Gandhinagar, Moolakkadai', 'Chennai - 600 118', 24, 9),
(36, 'Krrukkencheri SDA Church', 'No. 359, Karunanithi Salai', '16th Street, Errukkencheri', 'Chennai - 600 039', 24, 9),
(37, 'Vepery SDA English Church', '16, Valliammal Road', '', 'Vepry - 600 007', 24, 9),
(38, 'Royapuram SDA Church', 'No. 1, Ramar 5th Lane', 'Royapuram', 'Chennai - 600 013', 24, 9),
(39, 'T. Nagar SDA Church', 'Vandikaran Street', 'T. Nagar', 'Chennai', 24, 9),
(40, 'TVK Nagar SDA Church', 'No. 19, First St, K. C. Garden', 'TVK Nagar', 'Chennai - 600 082', 24, 9),
(41, 'Kanningapuram SDA Church', 'M. S. Muthu Nagar', 'Brighten Salai Main Road, Kanningapuram', 'Chennai - 600 012', 24, 9),
(42, 'T. P. Chatram SDA Church', 'K. V. N. Puram, Jyothi Ammal Nagar', 'T. P. Chatram', 'Chennai - 600 030', 24, 9),
(43, 'Pozhichalur SDA Church', '4/359 MGR Street', 'Pozhichalur', 'Chennai - 600 074', 24, 9),
(44, 'Pallavaram', 'No. 28, Vembuliamman Ko, 2nd Street', 'Pallavaram (Near Railway Station)', 'Chennai - 600 043', 24, 9),
(45, 'Chetpet SDA Church', 'No. 8, Iyyapillai Street', 'Dobi Kanna Scholl Road, Chetpet', 'Chennai - 600 031', 24, 9),
(46, 'Tiruthani SDA Church', '450 D Karimedu, Near Railway Station', 'Tiruthani', 'Tiruvallur Dt.', 24, 9),
(47, 'Arumbakkam SDA Church', '28 B, Venkatesa Perumal', 'Nagar, Arumbakkam', 'Chennai - 600 106', 24, 9),
(48, 'Chindathiripet', '77, Samy Pandaram Street', 'Chindathiripet', 'Chennai - 600 002', 24, 9),
(49, 'Clive Factory SDA Church', '34, 4th Lane Beech', 'Clive Factory', 'Chennai', 24, 9),
(50, 'Old Washermenpet SDA Church', 'No. 16, East Ceetery', 'Old Washermenpet', 'Chennai - 600 021', 24, 9),
(51, 'Vadapalani SDA Church', '5/3, Bajanai Koil Street', 'Saidapet Road, Vadapalani', 'Chennai - 600 026', 24, 9),
(52, 'Athipattu SDA Church', '270 Indira Nagar, Athipattu', 'Ponneri Taluk', 'Tiruvallur Dt.', 24, 9),
(53, 'Ennore SDA Church', 'Ulakanathapuram 6th Street', 'Ennore', 'Chennai - 600 057', 24, 9),
(54, 'Chennai Malayalam Church', 'AA. 148, IIIrd Avenue', 'Annanagar', 'Chennai - 600 040', 24, 9),
(55, 'Kundrathur SDA Church', 'No. 77, Melamanagar', 'Poonamalle Near Aruldas Artist or Painter''s House', 'Kundrathur', 24, 9),
(56, 'Thirumazhiai SDA Church', 'Kundamedu', 'Ettaiyammam Koil Street', 'Thirumazhiai', 24, 9),
(57, 'Red Hills SDA Church', 'SDA Church', '', 'Red Hills', 24, 9),
(58, 'Pulianthope SDA Church', 'No. 13/25 Sundarapuram', '2nd St. Pulianthope', 'Chennai - 12', 24, 9),
(59, 'Puliyanthoppu SDA Telugu Church', 'No. 5, 5th Street', 'Gurusamy Nagar, Puliyanthoppu', 'Chennai - 600 012', 24, 9),
(60, 'Wimco Nagar SDA Church', 'SDA Church', '', 'Wimco Nagar', 24, 9),
(61, 'Velachery SDA Church', '10, Murphydhas Salai', 'Baby Nagar, Velachery', 'Chennai - 600 042', 24, 9),
(62, 'Thiruvanmiyur SDA Church', '19 ECR Road', 'Kottiwakkam, Thiruvanmiyur', 'Chennai - 600 041', 24, 9),
(63, 'Thozhur SDA Church', 'MTH Road, Thozhur', 'Thiruvallur Dist', 'Pincode - 602 025', 24, 9),
(64, 'Thanneerkulam SDA Church', 'Velankulam Road', 'Thanneerkulam', 'Thiruvallore Dt', 24, 9),
(65, 'Iyyanambakkam SDA Church', 'IInd Cross Street, Iyyanambakkam', 'Ph: 26534005', 'Chennai - 600 095', 24, 9),
(66, 'Kannadasan Nagar SDA Church', 'No. 58, Kannadasan Nagar', '', 'Thiruvallur - 602 001', 24, 9),
(67, 'Devandhawakkam SDA Church', 'Church Street End', 'Devandhawakkam (Post)', 'Thiruvallore (Dt)', 24, 9),
(68, 'Broadway SDA Church', 'No. 40, Broadway', 'New Police Station', 'Chennai - 600 108', 24, 9),
(69, 'Jowai SDA Church', 'Ladthalaboh', 'Dong Mihngi', 'Jowai - 793 150', 17, 16),
(70, 'Lyniong SDA Church', 'Thainthynroh', '', 'BPO Lyniong', 17, 17),
(71, 'Mawryngkneng SDA Church', 'BPO Mawryngkneng', '', 'Via Madanrting 793 021', 17, 17),
(72, 'Mukoh SDA Church', 'BPO Namdong', '', 'Jaintia Hills', 17, 16),
(73, 'Mowkaiaw SDA Church', 'BPO Mowkaiaw - 793 150', '', 'Via Jowai', 17, 16),
(74, 'Mukhla SDA Church', 'PO Thadlaskein', '', 'PO Thadlaskein 793 151', 17, 16),
(75, 'Mylliem SDA Church', 'Madan Iing Syiem', '', 'BPO Nonglyer 793 009', 17, 17),
(76, 'Mynska SDA Church', 'Via Jowai', '', 'BPO Shangpung', 17, 16),
(77, 'NAC SDA English Church', 'NAC', '', 'Thadlaskein 793 151', 17, 16),
(78, 'NAC SDA Khasi Church', 'NAC', '', 'PO Thadlaskein 793 151', 17, 16),
(79, 'Nongryngkoh SDA Church', 'Via Jowai', '', 'BPO Nongryngkoh', 17, 16),
(80, 'Rynjah Lapalang SDA Church', 'Church Elder', '', 'Shillong', 17, 16),
(81, 'Shillong SDA Church', 'Opposite Fire Brigade', 'Laitumkhrah', 'Shillong 793 014', 17, 17),
(82, 'Sohryngkham SDA Church', 'BPO Sohryngkham', '', 'Via Madanrting 793 021', 17, 17),
(83, 'Sohmynting SDA Church', 'BPO Sohmynting', '', 'Via Jowai', 17, 16),
(84, 'Thynroit SDA Church', 'PO Smit', '', 'Via Madanrting 793 021', 17, 17),
(85, 'Thangbuli SDA Church', 'BPO Jarain', '', 'Via Jowai', 17, 16),
(86, 'Thangshalai SDA Church', 'BPO Mawryngkneng', '', 'Via Madanrting 793 021', 17, 17),
(87, 'Umkyrpong SDA Church', 'Church Elder', '', 'BPO Pala', 17, 16),
(88, 'Aizâwl Central Adventists', 'c/o Tv. Zohmachhuana Khawlhring SDA', 'KCIT, Dr. N. Palai''s Building, Zârkawt', 'Aizâwl - 796 001', 18, 18),
(89, 'Chaltlâng Adventists', 'c/o Pu Sãngthanga SDA, Sâirãng Road', 'Near Hrângbãna Petrol Pump', 'SPO Bâwngkãwn - 796 012', 18, 18),
(90, 'Dinthar Adventists', 'c/o Pu Rosailova', 'Church Elder of SDA, Dínthar Vêng', 'Aizâwl', 17, 18),
(91, 'Khawbrihnîm Adventists', 'c/o Pu H. Zàkâmlova SDA', 'BPO Khawrìhnîm', 'SPO Rèiêk - 796 501', 17, 18),
(92, 'N. Lunglêng Adventists', 'c/o Pu Lâithangpuia SDA', 'BPO N. Lunglêng', 'SPO Kulikãwn - 796 005', 17, 18),
(93, 'Mâubâwk Adventists', 'c/o Pu Lalthankima Philips', 'Bûngkãwn, Nursery Vêng', 'Aizâwl', 17, 18),
(94, 'Ramhlun Adventists', 'c/o Pu K. Rohluna SDA', 'Industry Muâl', 'SPO Ramhlun - 796 012', 17, 18),
(95, 'Republic Adventists', 'c/o Pr PLThlenga, Circle Leader', 'Upper Republic', 'Aizâwl - 796 001', 17, 18),
(96, 'Sâmtlâng Vêngpui Adventists', 'c/o Pi Nunthari, Remnant Press', 'Mizo Conference, Seventh-day Tlâng', 'Aizâwl', 18, 18),
(97, 'Sâmtlâng Vêngthar Adventists', 'c/o Pu Biâktluânga SDA', 'BPO Sãmtlâng', 'SPO Kulikâwn - 796 005', 17, 18),
(98, 'Seling Adventists', 'c/o Pu Lalhlúta SDA', 'BPO Seling', 'SPO Zêmabâwk - 796 017', 18, 18),
(99, 'Seventh-day Tlâng Adventists', 'c/o Church Elder', 'Seventh-day Tlâng', 'Aizâwl', 18, 18),
(100, 'Thingsùlthliah Adventists', 'c/o Pu Hrângdãwla SDA', 'Camp Area', 'SPO Thingsùlthliah - 796 161', 17, 18),
(101, 'Zêmabâwk Adventists', 'c/o Pu Sabbaththanga, Teacher', '', 'Helen Lowry School', 17, 18),
(102, 'Zuângtui Adventists', 'c/o Pu K. Rozâra SDA', 'Zêmabâwk Kâwnvêng-II', 'SPO Zêmabâwk - 796 017', 17, 18),
(103, 'Dârzõ Adventists', 'Pu Chhãwnthuâma SDA', 'BPO Dârzõ', 'SPO Hnahthiâl - 796 571', 17, 18),
(104, 'Hâulawng Adventists', 'c/o Pu Dârkhûma SDA', 'BPO Hâulawng', 'SPO Zotlâng, Lunglei - 796 691', 17, 18),
(105, 'Hãuruâng Adventists', 'c/o Pu Lalâwia SDA', 'BPO Hãuruâng', 'SPO Lunglei - 796 701', 17, 18),
(106, 'Hnahthiâl Adventists', 'c/o Evan Rosânga Chawngthû SDA', 'Electric Vêng', 'SPO Hnahthiâ - 796 571', 17, 18),
(107, 'Lunglei Bazar Adventist Church', 'c/o Bazar SDA Pastor Quarters', 'Lunglei Bazar', 'SPO Lunglei - 796 701', 17, 18),
(108, 'Chandmari Adventist Church', 'c/o Southern Flower School', 'Chandmari-II', 'SPO Lunglei - 796 701', 17, 18),
(109, 'Pûkpui Adventists', 'c/o Pu Lalthathanga SDA', 'BPO Pûkpui', 'SPO Zotlâng Lunglei - 796 691', 17, 18),
(110, 'Thiltlâng Adventists', 'c/o Pu C. Rosiâma SDA', 'BPO Thiltlâng', 'SPO Hnahthiâl - 796 571', 17, 18),
(111, 'Bâktãwng Adventists', 'c/o Pu Kâptluânga SDA', 'BPO Bâktãwng', 'SPO Thingsŭlthliah - 796 161', 17, 18),
(112, 'Biãtĕ Adventists', 'c/o Pu R Laltlanthanga SDA', 'BPO Biãtĕ', 'SPO East Lungdâr - 796 370', 17, 18),
(113, 'V. Buàlpui Adventists', 'c/o Pu Ramchhana SDA', 'V. Buàlpui, BPO Chhîpphîr', 'SPO Sêrchhîp - 796 181', 17, 18),
(114, 'Châwilung Adventists', 'c/o Pu Kâpzâwna SDA', 'BPO Chhingchhîp', 'SPO Thingsûlthliah - 796 161', 17, 18),
(115, 'Chhiahtlâng Adventists', 'c/o Pu Thangkhûma SDA', 'BPO Chhiahlâng', 'SPO Sêrchhîp - 796 181', 17, 18),
(116, 'Chhingchhîp Adventists', 'c/o Pu Kâpzâwna SDA', 'BPO Chhingchhîp', 'SPO Thingsŭlthliah - 796 161', 17, 18),
(117, 'Chhîpphîr Adventists', 'c/o Pu Zomuãna SDA', 'BPO Chhîpphîr', 'SPO Sêrchhîp - 796 181', 17, 18),
(118, 'Huãltú Adventists', 'c/o Pu Lalhmingliana SDA', 'BPO Huãltu', 'SPO Thingsùlthliah - 796 161', 17, 18),
(119, 'Kânghmun South Adventists', 'c/o Pu R. Zirsângzuala SDA', 'BPO South Kãnghmun', 'SPO Serchhîp - 796 181', 17, 18),
(120, 'Khumtung Adventists', 'c/o Pu Sâpchhûnga SDA', 'BPO Khumtung', 'SPO Thingsùlthliah - 796 161', 17, 18),
(121, 'Serchhip Chandmary Adventists', 'c/o Pastor Saizîka Sailo SDA', 'Chandmary Vêng', 'SPO Serchhîp - 796 181', 17, 18),
(122, 'Serchhip Dinthar Adventists', 'c/o Pu Hrângsâta SDA', 'Serchhîp Dinthar Vêng', 'SPO Serchhîp - 796 181', 17, 18),
(123, 'Thênzâwl Adventists', 'c/o Pu Hmangaihzauva SDA', 'BPO Thênzâwl', 'SPO Sêrchhîp - 796 181', 17, 18),
(124, 'Graceland Adventists', 'c/o GAS Headmaster', 'Graceland, Keifâng', 'SPO Sâituâl - 796 261', 17, 18),
(125, 'Hliâppui Adventists', 'c/o Pu Hrângzîka SDA', 'BPO Hliâppui', 'SPO Sâituâl - 796 261', 17, 18),
(126, 'Keifâng Adventists', 'c/o Pu Seikûnga SDA', 'BPO Keifâng', 'SPO Sâituâl - 796 261', 17, 18),
(127, 'Sâituâl Adventists', 'c/o SDA Pastors Quarters', 'Near Sâituâl Bazar', 'SPO Sâituâl - 796 261', 17, 18),
(128, 'Sâiha Adventists', 'c/o Pu F. Aizâma SDA', 'Joe Medical Store', 'SPO Sâiha - 796 901', 17, 18),
(129, 'Suãngpuilãwn Adventists', 'c/o Pi Vânlalruâti SDA', 'BPO Suãngpuilâwn', 'SPO Sâituâl - 796 261', 17, 18),
(130, 'Vânbâwng Adventists', 'c/o Pu Biâktluânga SDA', 'BPO Vânbâwng', 'SPO Sâituâl - 796 261', 17, 18),
(131, 'Bîlkhawthlĭr Adventists', 'c/o PU C Lalrinzuãla SDA', 'SPO Bîlkhawthlĭr Adventists', 'N. Mizoram - 796091', 18, 18),
(132, 'Kolasib Vêngthar Adventists', 'c/o Pu Thankima SDA', 'A.G. Vêng, New Diâkkãwn', 'SPO Kolasib - 796 081', 18, 18),
(133, 'Kolasib Vênglâi Adventists', 'c/o Pastor Zirlãwma Râltê SDA', 'Vênglâi SDA Pastor Quarters', 'SPO Kolasib - 796 081', 18, 18),
(134, 'Thingthelh Adventists', 'c/o Pu Kâwlnikûnga SDA', 'BPO Thingthelh', 'SPO Chandmary - 796 007', 18, 18),
(135, 'West Phâilêng Adventists', 'c/o Evan. Zosângkima SDA', 'High School Vêng', 'SPO West Phâilêng - 796 431', 18, 18),
(136, 'Kânhmun Adventists', 'c/o Pu Rokhûma SDA', 'BPO Kânhmun', 'SPO Zâwlnuãm - 796 471', 18, 18),
(137, 'Bethel Adventists', 'c/o Adventists English School', 'Champhâi Electric Vêng', 'SPO Champhâi - 796 321', 18, 18),
(138, 'Zâwlnuãm Adventists', 'c/o Hmangaihzauva SDA', 'Thuâmpui Vêng', 'SPO Zâwlnuâm - 796 471', 18, 18),
(139, 'Champhâi Adventists', 'c/o Adventist English School', 'Champhâi Electric Vêng', 'SPO Champhâi - 796 321', 18, 18),
(140, 'Khawzâwl Adventists', 'c/o Pu Sãngkhûma SDA', 'Khawzâwl Vêngthar', 'SPO Khawzâwl - 796 310', 18, 18),
(141, 'Pisgah Adventists', 'c/o Pinehill Adventist Academy', 'Champhâi Seventh-day Tlâng', 'SPO Champhâi - 796 321', 18, 18),
(142, 'Hnàhlãn Adventists', 'c/o Pu Nangkhanthang SDA', 'BPO Hnàhlãn', 'SPO Champhâi - 796 321', 18, 18),
(143, 'Khawliãn Adventists', 'c/o Pu Tangkathanga SDA', 'BPO Khawliân', 'SPO Sâituâl - 796 261', 18, 18),
(144, 'Khawrùhlian Adventists', 'c/o Pu Ramhmasãwna SDA', 'BPO Khawrùhlian', 'SPO Zêmabâwk - 796 017', 18, 18),
(145, 'New Lungrâng Adventists', 'c/o Pu M. Biâknghînglova SDA', 'BPO Lungrâng South', 'Lungsen - 796 730', 18, 18),
(146, 'Tlângsâng Adventists', 'c/o Pu Liãnhmingthanga Elder SDA', 'BPO Tlângsâng, Jãmpui Hills', 'North Tripura', 25, 18),
(213, 'Lamshang SDA Church', 'Chingkhulong Village', '', 'P.O. Lamshang Bazar', 16, 19),
(214, 'Langthabal SDA Church', 'Langthabal Chingthak', '', 'P.O. Manipur University', 16, 19),
(215, 'Langthungching SDA Church', 'Langol Laimanai', '', 'Imphal West - 795004', 16, 19),
(216, 'Pudunamai SDA Church', 'Pudunamai Village', 'P.O. Mao - Gate', 'Senapati District', 16, 19),
(229, 'Nungba SDA Church', 'P.O. Nungba', '', 'Tamenglong District', 16, 19),
(228, 'Namkaolong SDA Church Part - II (Namthan - II)', 'B.P.O. Khoupum Valley', 'Nungba Sub-Division', 'Tamenglong District', 16, 19),
(227, 'Namdailong SDA Church', 'Namdailong', '', 'P.O. Jiribam', 16, 19),
(218, 'Wainem SDA Church', 'P.O. Keinou Bazar', '', 'Bishenpur District', 16, 19),
(219, 'Birukhudam SDA Church', 'P.O. Japhou Bazar', '', 'Chandel District', 16, 19),
(220, 'Charongching SDA Church', 'P.O. Chakpikarong', '', 'Chandel District', 16, 19),
(221, 'Churachandpur SDA Church', 'R.C. Road', '', 'P.O. Churachandpur', 16, 19),
(222, 'Tuiringphaisen SDA Church', 'Tuiringphaisen Village (Lainingkhul)', 'B.P.O. Sagang', 'P.O. Kumbi', 16, 19),
(223, 'New Laijang SDA Church', 'P.O. Singhat', '', 'Churachandpur District', 16, 19),
(224, 'Chandel Head Quarter SDA Church', 'Mahamani', 'P.O. Japhou Bazar', 'Chandel District', 16, 19),
(225, 'Charoi Tupul SDA Church', 'P.O. Lamphel', 'Nungba Sub-Division', 'Tamenglong District', 16, 19),
(226, 'Duithanjang SDA Church', 'B.P.O. Khoupum Valley', 'Nungba Sub-Division', 'Tamenglong District', 16, 19),
(268, 'Rajasimla SDA Church', 'P.O. Rajasimla', '', 'East Garo Hills', 17, 20),
(267, 'Puthimari SDA Church', 'P.O. Jira via Krishnai', '', 'Goalpara', 3, 20),
(266, 'New Tura SDA Church', 'P.O. Araimile', 'New Tura', 'West Garo Hills', 17, 20),
(265, 'Nengsa SDA Church', 'P.O. Raja-a-pal', '', 'East Garo Hills', 17, 20),
(264, 'Nengkhra SDA Church', 'P.O. Nongalbibra', '', 'East Garo Hills', 17, 20),
(263, 'Napak SDA Church', 'P.O. Songsak', '', 'East Garo Hills', 17, 20),
(262, 'Mangtu SDA Church', 'P.O. Thapa Bazaar', '', 'East Garo Hills', 17, 20),
(261, 'Mallangkona SDA Church', 'P.O. Mallangkona via Dhupdhara', '', 'Goalpara', 3, 20),
(260, 'Lower Rongbu SDA Church', 'P.O. Chibongga via Dudhnoi', '', 'Goalpara', 3, 20),
(259, 'Jelbongpara SDA Church', 'P.O. Betasing', '', 'West Garo Hills', 17, 20),
(258, 'Gol Datgre SDA Church', 'P.O. Ampati', '', 'West Garo Hills', 17, 20),
(257, 'Doldam SDA Church', 'P.O. Bajengdoba - 794 002', '', 'East Garo Hills', 17, 20),
(256, 'Darugre - Chika ma SDA Church', 'P.O. Songsak', '', 'East Garo Hills', 17, 20),
(255, 'Dadenggre SDA Church', 'P.O. Dadenggre', '', 'West Garo Hills', 17, 20),
(254, 'Bolpita SDA Church', 'P.O. Bolbola via Agia', '', 'Goalpara', 3, 20),
(253, 'Bolmedang SDA Church', 'P.O. Mendima via Damra', '', 'Goalpara', 3, 20),
(252, 'Bolkreth SDA Church', 'P.O. Rogjeng 494 100', '', 'East Garo Hills', 17, 20),
(251, 'Bakenang SDA Church', 'P.O. Bajengdoba - 794 002', '', 'East Garo Hills', 17, 20),
(250, 'Baghmara (Upper Kona Gittim)', 'SDA Church', 'P.O. Baghmara', 'South Garo Hills', 17, 20),
(249, 'Asna - Chisrigre SDA Church', 'P.O. Garobadha', '', 'West Garo Hills', 17, 20),
(248, 'A Bokgre SDA Church', 'P.O. Jangrapara via Tikrikilla', '', 'West Garo Hills', 17, 20),
(247, 'Abalgre SDA Church', 'P.O. Challang', '', 'West Khasi Hills', 17, 20),
(246, 'Changta SDA Church', 'B.P.O. Champhung', 'P.O. Ukhrul', 'Ukhrul District', 16, 19),
(245, 'Kamjong SDA Church', 'P.O. Phungyar', '', 'Ukhrul District', 16, 19),
(244, 'Shimtang SDA Church', 'B.P.O. Lamlang Gate', '', 'Ukhrul District', 16, 19),
(243, 'Ukhrul SDA Church', 'Awontang', 'P.O. Ukhrul', 'Ukhrul District', 16, 19),
(242, 'Phungreitang SDA Church', 'c/o M.M. School, Phungreitang', 'P.O. Ukhrul', 'Ukhrul District', 16, 19),
(241, 'Phungcham SDA Church', 'B.P.O. Phungcham', '', 'Ukhrul District', 16, 19),
(240, 'Lungshang SDA Church', 'B.P.O. Shangshak', '', 'Ukhrul District', 16, 19),
(239, 'Nongdam SDA Church (T)', 'B.P.O. Nongdam Via Lamlai', '', 'Ukhrul District', 16, 19),
(238, 'New Canaan SDA Church', 'New Canaan', '', 'P.O. Yaingangpokpi', 16, 19),
(237, 'Khararphung SDA Church', 'P.O. Ukhrul', '', 'Ukhrul District', 16, 19),
(236, 'Kumram SDA Church', 'P.O. Phungyar', '', 'Ukhrul District', 16, 19),
(235, 'Halang SDA Church', 'B.P.O. Halang', '', 'Ukhrul District', 16, 19),
(234, 'Aphung SDA Church', 'B.P.O. Champhung', 'P.O. Ukhrul', 'Ukhrul District', 16, 19),
(233, 'Old Nagaching SDA Church', 'B.P.O. Nagaching', 'P.O. Lamphel', 'Tamenglong District', 16, 19),
(232, 'Ramgaijang SDA Church', 'Ramgaijang', '', 'P.O. Jiribam', 16, 19),
(231, 'Taoshang SDA Church', 'B.P.O. Charoi Tupul', 'Nungba Sub-Division', 'Tamenglong District', 16, 19),
(230, 'Sibilong SDA Church', 'B.P.O. Sibilong', 'P.O. Nungba', 'Tamenglong District', 16, 19),
(269, 'Rakwapara SDA Church', 'P.O. Chenggapara', '', 'West Garo Hills', 17, 20),
(270, 'Resu Belpara SDA Church', 'P.O. Resu Belpara', '', 'East Garo Hills', 17, 20),
(271, 'Rong-Rikimgre SDA Church', 'P.O. Silkigre', '', 'South Garo Hills', 17, 20),
(272, 'Salmanpara SDA Church', 'P.O. Salmanpara', '', 'West Garo Hills', 17, 20),
(273, 'Sangsanggre SDA Church', 'P.O. Dobasipara', '', 'West Garo Hills', 17, 20),
(274, 'Sa-Rongkol SDA Church', 'P.O. Bajengdoba - 794 002', '', 'East Garo Hills', 17, 20),
(275, 'Sona Chiring SDA Church', 'P.O. Bajengdoba - 794 002', '', 'East Garo Hills', 17, 20),
(276, 'Tura Town SDA Church', 'P.O. Araimile', 'Modinagar', 'West Garo Hills', 17, 20),
(277, 'Simseng Aringga SDA Church', 'P.O. Wa-ge A-si', '', 'East Garo Hills', 17, 20),
(278, 'Upper Rongbu SDA Church', 'P.O. Chibongga via Dudhnoi', '', 'Goalpara', 3, 20),
(279, 'Williamnagar SDA Church', 'P.O. Williamnagar', '', 'East Garo Hills', 3, 20),
(280, 'Village Balagaon', 'P.O. Saraibil 783 350', '', 'Dist. Kokrajhar', 3, 21),
(281, 'Boruakhat SDA Church', 'P.O. Borhat', '', 'Dist. Sibsagar', 3, 21),
(282, 'Borigaon SDA Church', 'P.O. Borigaon', '', 'Dist. Darang', 3, 21),
(283, 'Doomni TE SDA Church', 'Dekadong Line No 5', 'P.O. Doomni 783 373', 'Dist. Nalbari', 3, 21),
(284, 'Village Harinagar', 'P.O. Saraibil 783 350', '', 'Dist Kokrajhar', 3, 21),
(285, 'Nagabat SDA Church', 'P.O. Raidangjuri 785 631', '', 'Dist. Jorhat', 3, 21),
(286, 'Phuhurabari SDA Church', 'P.O. Doplapota 784 114', '', 'Dist. Darrang', 3, 21),
(287, 'Village Sinaipathar', 'P.O. Amteka Bazar', 'Via Bijini 783 390', 'Dist. Bongaigaon', 3, 21),
(288, 'Village Solongpathar', 'P.O. Solongpathar 785 610', '', 'Dist. Golaghat', 3, 21),
(289, 'Sugunbari SDA Church', 'P.O. Kalikhola 784526', '', 'Dist. Darrang', 3, 21),
(290, 'Village Sompara', 'P.O. Gurufela 783 360', '', 'Dist. Kokrajhar', 3, 21),
(291, 'Dimapur SDA Church', 'Post Box 275', 'Walford', 'Dimapur 797 112', 19, 22),
(292, 'Samziuram SDA Church', 'P.O. Jalukie Town', 'Peren District', 'Nagaland 797 100', 19, 22),
(293, 'Shah Gunj', 'c/o SDA Office', 'Mangalpet Circle', 'Bidar - 585 401', 12, 5),
(294, 'Gornalli', 'c/o SDA Office', 'Mangalpet Circle', 'Bidar - 585 401', 12, 5),
(295, 'Bagdal', 'H. No. 11-2-29', 'Bethelehem Colony, Near Hanuman Colony', 'Mangalpet, Bidar - 585 401', 12, 5),
(296, 'Marjapur', 'H. No. 11-2-30', 'Bethelehem Colony, Near Hanuman Colony', 'Mangalpet, Bidar - 585 402', 12, 5),
(297, 'D. Kasampur', 'H. No. 11-2-31', 'Bethelehem Colony, Near Hanuman Colony', 'Mangalpet, Bidar - 585 403', 12, 5),
(298, 'Budera', 'H. No. 11-2-32', 'Bethelehem Colony, Near Hanuman Colony', 'Mangalpet, Bidar - 585 404', 12, 5),
(299, 'Sirsi (A)', 'H. No. 11-2-33', 'Bethelehem Colony, Near Hanuman Colony', 'Mangalpet, Bidar - 585 405', 12, 5),
(300, 'Kangakote', 'H. No. 11-2-34', 'Bethelehem Colony, Near Hanuman Colony', 'Mangalpet, Bidar - 585 406', 12, 5),
(301, 'Honadi', 'Christian House', 'Meenkera Post', 'Humnabad Tq. Bidar Dist.', 12, 5),
(302, 'Karpakpally', 'Christian House', 'Meenkera Post', 'Humnabad Tq. Bidar Dist.', 12, 5),
(303, 'Karknally', 'Christian House', 'Meenkera Post', 'Humnabad Tq. Bidar Dist.', 12, 5),
(304, 'Tumkunta', 'Christian House', 'Meenkera Post', 'Humnabad Tq. Bidar Dist.', 12, 5),
(305, 'Basanthpur', 'Christian House', 'Meenkera Post', 'Humnabad Tq. Bidar Dist.', 12, 5),
(306, 'Katti Tugaon', 'Christian House', 'Hudgi Post', 'Humnabad Tq. Bidar Dist.', 12, 5),
(307, 'Duballgundi', 'Christian House', 'Hudgi Post', 'Humnabad Tq. Bidar Dist.', 12, 5),
(308, 'Huchaknalli', 'Christian House', 'Hudgi Post', 'Humnabad Tq. Bidar Dist.', 12, 5),
(309, 'Kappergaon', 'Christian House', 'Hudgi Post', 'Humnabad Tq. Bidar Dist.', 12, 5),
(310, 'Bombalgi', 'Christian House', 'Hudgi Post', 'Humnabad Tq. Bidar Dist.', 12, 5),
(311, 'Bidar Central Church', 'c/o SDA School', '', 'Fathedarwaza, Bidar Dist.', 12, 5),
(312, 'Bhalki', 'c/o SDA School', 'Bhalki Main Road', 'Bhalki, Bidar Dist.', 12, 5),
(313, 'Halbarga', 'c/o SDA School', 'Bhalki Main Road', 'Bhalki, Bidar Dist.', 12, 5),
(314, 'Marur', 'c/o SDA School', 'Bhalki Main Road', 'Bhalki, Bidar Dist.', 12, 5),
(315, 'Dadgi base', 'c/o SDA School', 'Bhalki Main Road', 'Bhalki, Bidar Dist.', 12, 5),
(316, 'Jayagaon', 'c/o SDA School', 'Bhalki Main Road', 'Bhalki, Bidar Dist.', 12, 5),
(317, 'Kardiyal', 'c/o SDA School', 'Bhalki Main Road', 'Bhalki, Bidar Dist.', 12, 5),
(318, 'Sorahalli', 's/o Gyanappa', 'Mustapur-Shembelli Post', 'Aurad Tq. Bidar Dist.', 12, 5),
(319, 'Nagmarpally', 's/o Gyanappa', 'Mustapur-Shembelli Post', 'Aurad Tq. Bidar Dist.', 12, 5),
(320, 'Dudaknal', 's/o Gyanappa', 'Mustapur-Shembelli Post', 'Aurad Tq. Bidar Dist.', 12, 5),
(321, 'Yanagunda', 's/o Gyanappa', 'Mustapur-Shembelli Post', 'Aurad Tq. Bidar Dist.', 12, 5),
(322, 'Hokarna (B)', 'c/o Jayanthappa Khengi, Christian House', 'Yesu Nagar, Chitguppa', 'Humnabad Tq. Bidar Dist.', 12, 5),
(323, 'Patrupalli', 'c/o Jayanthappa Khengi, Christian House', 'Yesu Nagar, Chitguppa', 'Humnabad Tq. Bidar Dist.', 12, 5),
(324, 'Dharmapur', 'c/o Jayanthappa Khengi, Christian House', 'Yesu Nagar, Chitguppa', 'Humnabad Tq. Bidar Dist.', 12, 5),
(325, 'Bompalli', 'Christian Galli', 'Hallikhed (B)', 'Humnabad Tq. Bidar Dist.', 12, 5),
(326, 'Mustapur', 'Christian Galli', 'Hallikhed (B)', 'Humnabad Tq. Bidar Dist.', 12, 5),
(327, 'Jojana', 'Christian Galli', 'Hallikhed (B)', 'Humnabad Tq. Bidar Dist.', 12, 5),
(328, 'Dupathmahagaon', 'Christian Galli', 'Hallikhed (B)', 'Humnabad Tq. Bidar Dist.', 12, 5),
(329, 'Gournalli', 'c/o Sumanth Hosamani', 'Christian House', 'Gornalli, Halladkeri Post, Bidar', 12, 5),
(330, 'Gulbarga', 's/o Siddappa Bhadre', 'Christian House', 'Budhera Post, Kamthana H. P. Bidar', 12, 5),
(331, 'Katti Sanghavi', 's/o Siddappa Bhadre', 'Christian House', 'Budhera Post, Kamthana H. P. Bidar', 12, 5),
(332, 'Kolkur', 's/o Siddappa Bhadre', 'Christian House', 'Budhera Post, Kamthana H. P. Bidar', 12, 5),
(333, 'Yesgi', 'c/o SDA Church', '', 'Jojna (Post), Santhpur Tq.', 12, 5),
(334, 'Allapur', 'c/o SDA Church', '', 'Jojna (Post), Santhpur Tq.', 12, 5),
(335, 'Benkanalli', 'c/o Maharshi School', '', 'Bidar', 12, 5),
(336, 'Mirzapura', 'c/o Maharshi School', '', 'Bidar', 12, 5),
(337, 'Chimkode', 'c/o Maharshi School', '', 'Bidar', 12, 5),
(338, 'Kangti', 'c/o Maharshi School', '', 'Bidar', 12, 5),
(339, 'Rasalbad', 'c/o Maharshi School', '', 'Bidar', 12, 5),
(340, 'Hosalli', 's/o Gundappa, Christian House', 'Budhera Post, Kamathana H.P.', 'Bidar - 585 426', 12, 5),
(341, 'Workanalli', 's/o Gundappa, Christian House', 'Budhera Post, Kamathana H.P.', 'Bidar - 585 427', 12, 5),
(342, 'Hathikuni', 's/o Gundappa, Christian House', 'Budhera Post, Kamathana H.P.', 'Bidar - 585 428', 12, 5),
(343, 'Thumkunta', 's/o Gundappa, Christian House', 'Budhera Post, Kamathana H.P.', 'Bidar - 585 429', 12, 5),
(344, 'Nandyal', 's/o Devadas', 'Eden Colony, Mangalpet', 'Bidar - 585 401', 12, 5),
(345, 'Santhapur', 's/o Devadas', 'Eden Colony, Mangalpet', 'Bidar - 585 402', 12, 5),
(346, 'Shaktinagar', 's/o Devadas', 'Eden Colony, Mangalpet', 'Bidar - 585 403', 12, 5),
(347, 'Raipalli', 's/o Devadas', 'Eden Colony, Mangalpet', 'Bidar - 585 404', 12, 5),
(348, 'Mylar', 's/o Devadas', 'Eden Colony, Mangalpet', 'Bidar - 585 405', 12, 5),
(349, 'Dondgaon', 's/o Devadas', 'Eden Colony, Mangalpet', 'Bidar - 585 406', 12, 5),
(350, 'Kasampur', 'Christian House', 'Pan Kashempur', 'Tq. Dist. Bidar', 12, 5),
(351, 'Mustari', 'Christian House', 'Pan Kashempur', 'Tq. Dist. Bidar', 12, 5),
(352, 'Meenkera', 'Christian House', 'Pan Kashempur', 'Tq. Dist. Bidar', 12, 5),
(353, 'Nandgaon', 'Christian House', 'Pan Kashempur', 'Tq. Dist. Bidar', 12, 5),
(354, 'Hudgi', 'Christian House', 'Pan Kashempur', 'Tq. Dist. Bidar', 12, 5),
(355, 'Nehru Nagar', 'Christian House', 'Alhalli Post', 'Chittapur Tq. Gulbarga Dist.', 12, 5),
(356, 'Hilalpur', 'Christian House', 'Alhalli Post', 'Chittapur Tq. Gulbarga Dist.', 12, 5),
(357, 'S. Wadi', 'Christian House', 'Alhalli Post', 'Chittapur Tq. Gulbarga Dist.', 12, 5),
(358, 'Mugnoor', 'Christian House', 'Alhalli Post', 'Chittapur Tq. Gulbarga Dist.', 12, 5),
(359, 'Hesargundi', 'c/o Hulagappa Pujari', 'Ambedkar Nagar, 10th Block', 'Gangavathi Post', 12, 5),
(360, 'Kushrampalli', 'c/o Hulagappa Pujari', 'Ambedkar Nagar, 10th Block', 'Gangavathi Post', 12, 5),
(361, 'Mogha', 'c/o Hulagappa Pujari', 'Ambedkar Nagar, 10th Block', 'Gangavathi Post', 12, 5),
(362, 'Sasargaon', 'c/o Hulagappa Pujari', 'Ambedkar Nagar, 10th Block', 'Gangavathi Post', 12, 5),
(363, 'Grampalli', 'c/o Hulagappa Pujari', 'Ambedkar Nagar, 10th Block', 'Gangavathi Post', 12, 5),
(364, 'Holasamudra', 'Holasamudra c/o SDA Church', 'Holasamudra (Post)', 'Aurad Tq.', 12, 5),
(365, 'Chendeswari', 'Holasamudra c/o SDA Church', 'Holasamudra (Post)', 'Aurad Tq.', 12, 5),
(366, 'Tapsala', 'Holasamudra c/o SDA Church', 'Holasamudra (Post)', 'Aurad Tq.', 12, 5),
(367, 'Khed', 'Holasamudra c/o SDA Church', 'Holasamudra (Post)', 'Aurad Tq.', 12, 5),
(368, 'Athulathi Tanda', 'c/o SDA Church', 'Ram Nagar Road', 'Bijapur', 12, 5),
(369, 'Turvi Tanda', 'c/o SDA Church', 'Ram Nagar Road', 'Bijapur', 12, 5),
(370, 'Arkeri Doddi', 'c/o SDA Church', 'Ram Nagar Road', 'Bijapur', 12, 5),
(371, 'Bijapur', 'No. K-10, Koppa Building', 'Bhendikeri Galli, Near Shanmukha Swamy Matt', 'Bijapur - 586 104', 12, 5),
(372, 'Hadagali Thanda 1', 'No. K-10, Koppa Building', 'Bhendikeri Galli, Near Shanmukha Swamy Matt', 'Bijapur - 586 105', 12, 5),
(373, 'Hadagali Thanda 2', 'No. K-10, Koppa Building', 'Bhendikeri Galli, Near Shanmukha Swamy Matt', 'Bijapur - 586 106', 12, 5),
(374, 'Hadagali Thanda 3', 'No. K-10, Koppa Building', 'Bhendikeri Galli, Near Shanmukha Swamy Matt', 'Bijapur - 586 107', 12, 5),
(375, 'Jalageri LT 1', 'c/o SDA Church', 'Ram Nagar Area', 'Bijapur', 12, 5),
(376, 'Jalageri LT 6', 'c/o SDA Church', 'Ram Nagar Area', 'Bijapur', 12, 5),
(377, 'Takalki', 'c/o SDA Church', 'Ram Nagar Area', 'Bijapur', 12, 5),
(378, 'Hanuman Nagar', 'c/o SDA Church', 'Ram Nagar Area', 'Bijapur', 12, 5),
(379, 'Shivapura', 'c/o SDA Church', '', 'Vijay Nagar', 12, 5),
(380, 'Mylara', 'c/o SDA Church', '', 'Vijay Nagar', 12, 5),
(381, 'Srinagar', 'c/o SDA Church', '', 'Vijay Nagar', 12, 5),
(382, 'Vijay Nagar', 'c/o SDA Church', '', 'Vijay Nagar', 12, 5),
(383, 'Yorgole', 'c/o Yesumitra, Head Master', 'Yorgile Post', 'Yadgiri Tq.', 12, 5),
(384, 'Kardhal', 'c/o Yesumitra, Head Master', 'Yorgile Post', 'Yadgiri Tq.', 12, 5),
(385, 'Kumbarwada', 'c/o Yesumitra, Head Master', 'Yorgile Post', 'Yadgiri Tq.', 12, 5),
(386, 'Anderki', 'c/o SDA Church', 'Anderki Post', 'Yadgiri Tq.', 12, 5),
(387, 'Chimkunta', 'c/o SDA Church', 'Anderki Post', 'Yadgiri Tq.', 12, 5),
(388, 'Malkpalli', 'c/o SDA Church', 'Anderki Post', 'Yadgiri Tq.', 12, 5),
(389, 'Arasikere SDA Church', 'Hassan Road', 'Upperline 8th cross, Arasikere', 'Hassan Dist - 573 103', 12, 24),
(390, 'Hannur', 'c/o SDA Church of Kamagere', 'Kollegal Taluk', 'Chamrajnagar Dist - 572443', 12, 24),
(391, 'Gulya', 'c/o SDA Church of Kamagere', 'Kollegal Taluk', 'Chamrajnagar Dist - 572444', 12, 24),
(392, 'B. Gundapur', 'c/o SDA Church of Kamagere', 'Kollegal Taluk', 'Chamrajnagar Dist - 572445', 12, 24),
(393, 'Udunur', 'c/o SDA Church of Kamagere', 'Kollegal Taluk', 'Chamrajnagar Dist - 572446', 12, 24),
(394, 'Y. Doddi', 'c/o SDA Church of Kamagere', 'Kollegal Taluk', 'Chamrajnagar Dist - 572447', 12, 24),
(395, 'Manipal', '08-10, c/o 2, Archana House', 'Nehru Nagar Saralbettu', 'Manipal - 576119', 12, 24),
(396, 'Mudigere', 'c/o SDA English School', 'Basavanahalli Extension', 'Chickmagalur - 577101', 12, 24),
(397, 'Kaimara', 'c/o SDA English School', 'Basavanahalli Extension', 'Chickmagalur - 577102', 12, 24),
(398, 'Moodbidre', '5-4-26, Grace Cottage', 'Mission Compound', 'Near Police Parade Ground', 12, 24),
(399, 'Udupi', '5-4-26, Grace Cottage', 'Mission Compound', 'Near Police Parade Ground', 12, 24),
(400, 'T. Narsipur', 'c/o SDA School', 'Triveninagar', 'T. Narsipur - 571124', 12, 24),
(401, 'Chickmagalur', 'SDA Church', 'Basavanahalli Extension', 'Chickmagalur - 577101', 12, 24),
(402, 'Hassan', 'SDA Church', 'Basavanahalli Extension', 'Chickmagalur - 577102', 12, 24),
(403, 'Kaliyur', 'SDA Church, Kaliyur (Via)', 'T. Narsipur', 'Mysore Dist - 571481', 12, 24),
(404, 'Chamrajnagar', 'c/o SDA School', 'Gundlupet Road', 'Chamrajnagar - 571313', 12, 24),
(405, 'Kollegal', 'SDA Church', 'Peace Park Road', 'Kollegal - 571440', 12, 24),
(406, 'Mandya', 'c/o N. Dorairaj (Ex-Vice President)', 'No. 1/344, (A) Head P.O. Road', 'G P Mallappapuram, Kollegal', 12, 24),
(407, 'Doddihinwadi', 'c/o SDA Church of Kamagere', 'Kollegal Taluk', 'Chamrajnagar Dist - 572443', 12, 24),
(408, 'Kamagere', 'c/o SDA Church of Kamagere', 'Kollegal Taluk', 'Chamrajnagar Dist - 572444', 12, 24),
(409, 'Nallur', 'SDA Church', 'Nagavalli Post', 'Chamrajnagar Dist - 571342', 12, 24),
(410, 'Mukalli', 'SDA Church', 'Nagavalli Post', 'Chamrajnagar Dist - 571343', 12, 24),
(411, 'Nagavalli', 'SDA Church', 'Nagavalli Post', 'Chamrajnagar Dist - 571344', 12, 24),
(412, 'Dodda-Gajanoor', 'SDA Church, Doddagajanoor Main Road', 'Talvadi Post, Via Chamrajnagar', 'Sathya Taluk Erod Dist. - 638461', 24, 24),
(413, 'Bhadravathy', 'Lions club', 'New Town Near Girls School', 'J.G. Bhadravathy', 12, 24),
(414, 'Madikere', 'Box - 144, Head Post Office Coorg', '', 'Dist Karnataka State Madikere - 571201', 12, 24),
(415, 'Sagar', '3rd Cross', 'Analekoppa Kagodu', 'Thimmappa Nagara Sagar Shimoga Dist', 12, 24),
(416, 'Mangalore', 'c/o Grace Maria', 'Kinni Goli Post', 'Dakshina Kannada Dist - 574150', 12, 24),
(417, 'Arasikere SDA Church', 'Hassan Road', 'Upperline 8th cross, Arasikere', 'Hassan Dist - 573 103', 12, 25),
(418, 'Belgaum', 'Plot #3, 5th cross', 'Near SDA School', 'Azamnagar, Belgaum 590 010', 12, 25),
(419, 'Hubli Tamil', 'c/o SDA English School', 'Bhavaninagar, Keshwapur', 'Hubli - 23', 12, 25),
(420, 'Gurim/Birla', 'MA - 2, Housing board', 'Biana, Vascodagama', 'Goa 403 802', 12, 25),
(421, 'Mangoor Hill', 'MA - 2, Housing board', 'Biana, Vascodagama', 'Goa 403 803', 12, 25),
(422, 'Panjim', 'MA - 2, Housing board', 'Biana, Vascodagama', 'Goa 403 804', 12, 25),
(423, 'Vasco', 'MA - 2, Housing board', 'Biana, Vascodagama', 'Goa 403 805', 12, 25),
(424, 'J K Koppa', 'c/o Mudukappa, Madigar', 'Via Pularkoppa, Marakatti PO', 'Tq. Bailhongal, Belgaum Dist.', 12, 25),
(425, 'Alldhakatti', 'SDA Church, Yargatti Post', 'Soudatti Taluk', 'Belgaum Dist.', 12, 25),
(426, 'Bennkatti', 'SDA Church, Yargatti Post', 'Soudatti Taluk', 'Belgaum Dist.', 12, 25),
(427, 'Jeevapur', 'SDA Church, Yargatti Post', 'Soudatti Taluk', 'Belgaum Dist.', 12, 25),
(428, 'Madangeri', 'SDA Church, Yargatti Post', 'Soudatti Taluk', 'Belgaum Dist.', 12, 25),
(429, 'Gudamgeri', 'SDA Church, Yargatti Post', 'Soudatti Taluk', 'Belgaum Dist.', 12, 25),
(430, 'Kodliwad', 'SDA Church, Yargatti Post', 'Soudatti Taluk', 'Belgaum Dist.', 12, 25),
(431, 'Yargatti', 'SDA Church, Yargatti Post', 'Soudatti Taluk', 'Belgaum Dist.', 12, 25),
(432, 'Hagarathi', 'c/o Dundappa Yellappa', 'Nesargi Post, Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(433, 'Vonnur', 'c/o Dundappa Yellappa', 'Nesargi Post, Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(434, 'Hoskate', 'c/o Dundappa Yellappa', 'Nesargi Post, Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(435, 'Murkibhavi', 'c/o Dundappa Yellappa', 'Nesargi Post, Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(436, 'Muthwad', 'c/o Dundappa Yellappa', 'Nesargi Post, Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(437, 'Sutagatti', 'c/o Dundappa Yellappa', 'Nesargi Post, Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(438, 'Chacadi', 'c/o Dundappa Yellappa', 'Nesargi Post, Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(439, 'Mekalmardi', 'c/o Dundappa Yellappa', 'Nesargi Post, Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(440, 'Mathikop', 'c/o Dundappa Yellappa', 'Nesargi Post, Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(441, 'Melur', 'SDA Church, Shilthibhavi post', 'Kanagoan Via Gokak taluk', 'Belgaum Dist.', 12, 25),
(442, 'Chickbudnur', 'SDA Church, Shilthibhavi post', 'Kanagoan Via Gokak taluk', 'Belgaum Dist.', 12, 25),
(443, 'Goraguddi', 'SDA Church, Shilthibhavi post', 'Kanagoan Via Gokak taluk', 'Belgaum Dist.', 12, 25),
(444, 'Hirabuddnur', 'SDA Church, Shilthibhavi post', 'Kanagoan Via Gokak taluk', 'Belgaum Dist.', 12, 25),
(445, 'Rudrapur', 'SDA Church, Shilthibhavi post', 'Kanagoan Via Gokak taluk', 'Belgaum Dist.', 12, 25),
(446, 'Dundankop', 'SDA Church, Shilthibhavi post', 'Kanagoan Via Gokak taluk', 'Belgaum Dist.', 12, 25),
(447, 'Kadsalur', 'SDA Church, Shilthibhavi post', 'Kanagoan Via Gokak taluk', 'Belgaum Dist.', 12, 25),
(448, 'Markumbi', 'SDA Church, Shilthibhavi post', 'Kanagoan Via Gokak taluk', 'Belgaum Dist.', 12, 25),
(449, 'Shilthibhavi', 'SDA Church, Shilthibhavi post', 'Kanagoan Via Gokak taluk', 'Belgaum Dist.', 12, 25),
(450, 'Kandal', 'Kamaldinni post', 'Gokak Taluk, via Mudalgi', 'Belgaum Dist.', 12, 25),
(451, 'Rangapur', 'Kamaldinni post', 'Gokak Taluk, via Mudalgi', 'Belgaum Dist.', 12, 25),
(452, 'Darmatti', 'Kamaldinni post', 'Gokak Taluk, via Mudalgi', 'Belgaum Dist.', 12, 25),
(453, 'Hubli Kannada', 'c/o SDA English School', 'Bhavaninagar, Keshwapur', 'Hubli - 23', 12, 25),
(454, 'Auradhi', 'c/o Yellappa Vakkud, Kittur fort main road', 'Kittur post, Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(455, 'Basapura', 'c/o Yellappa Vakkud, Kittur fort main road', 'Kittur post, Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(456, 'Basarkod', 'c/o Yellappa Vakkud, Kittur fort main road', 'Kittur post, Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(457, 'Degulahalli', 'c/o Yellappa Vakkud, Kittur fort main road', 'Kittur post, Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(458, 'Devagoan', 'c/o Yellappa Vakkud, Kittur fort main road', 'Kittur post, Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(459, 'Dombarkoppa', 'c/o Yellappa Vakkud, Kittur fort main road', 'Kittur post, Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(460, 'Margeri', 'c/o Yellappa Vakkud, Kittur fort main road', 'Kittur post, Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(461, 'Thimapur', 'c/o Yellappa Vakkud, Kittur fort main road', 'Kittur post, Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(462, 'Tigadolli', 'c/o Yellappa Vakkud, Kittur fort main road', 'Kittur post, Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(463, 'Giriyal', 'c/o Yellappa Vakkud, Kittur fort main road', 'Kittur post, Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(464, 'Bevankop', 'Anil Hittalgaddi, At: Vakkund', 'Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(465, 'Nayanagar', 'Anil Hittalgaddi, At: Vakkund', 'Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(466, 'Vukkund', 'Anil Hittalgaddi, At: Vakkund', 'Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(467, 'Yadal', 'Anil Hittalgaddi, At: Vakkund', 'Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(468, 'Chivatgundi', 'Anil Hittalgaddi, At: Vakkund', 'Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(469, 'Ingaligi', 'Anil Hittalgaddi, At: Vakkund', 'Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(470, 'K K Kop', 'Anil Hittalgaddi, At: Vakkund', 'Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(471, 'Negnal', 'Anil Hittalgaddi, At: Vakkund', 'Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(472, 'Develapur', 'Anil Hittalgaddi, At: Vakkund', 'Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(473, 'Kanganur', 'Anil Hittalgaddi, At: Vakkund', 'Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(474, 'Garjur', 'Anil Hittalgaddi, At: Vakkund', 'Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(475, 'Amtur', 'Anil Hittalgaddi, At: Vakkund', 'Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(476, 'Guddur', 'Sunath Amgol SDA Church', 'Kadrolli new, Ittagi cross', 'Belgaum Dist.', 12, 25),
(477, 'Holinagalpur', 'Sunath Amgol SDA Church', 'Kadrolli new, Ittagi cross', 'Belgaum Dist.', 12, 25),
(478, 'Hoolikatti', 'Sunath Amgol SDA Church', 'Kadrolli new, Ittagi cross', 'Belgaum Dist.', 12, 25),
(479, 'Honnidhibha', 'Sunath Amgol SDA Church', 'Kadrolli new, Ittagi cross', 'Belgaum Dist.', 12, 25),
(480, 'Margankop', 'Sunath Amgol SDA Church', 'Kadrolli new, Ittagi cross', 'Belgaum Dist.', 12, 25),
(481, 'Savategi', 'Sunath Amgol SDA Church', 'Kadrolli new, Ittagi cross', 'Belgaum Dist.', 12, 25),
(482, 'Bachankeri', 'Sunath Amgol SDA Church', 'Kadrolli new, Ittagi cross', 'Belgaum Dist.', 12, 25),
(483, 'Kurgund', 'Sunath Amgol SDA Church', 'Kadrolli new, Ittagi cross', 'Belgaum Dist.', 12, 25),
(484, 'Holihosur', 'Sunath Amgol SDA Church', 'Kadrolli new, Ittagi cross', 'Belgaum Dist.', 12, 25),
(485, 'Tegur - old', 'Sunath Amgol SDA Church', 'Kadrolli new, Ittagi cross', 'Belgaum Dist.', 12, 25),
(486, 'Kulimnatti', 'Sunath Amgol SDA Church', 'Kadrolli new, Ittagi cross', 'Belgaum Dist.', 12, 25),
(487, 'Turmare', 'Sunath Amgol SDA Church', 'Kadrolli new, Ittagi cross', 'Belgaum Dist.', 12, 25),
(488, 'Sangolle', 'Sunath Amgol SDA Church', 'Kadrolli new, Ittagi cross', 'Belgaum Dist.', 12, 25),
(489, 'Bailur', 'SDA Church, Yaraguddi', 'Lakkundi Post, Bhailongal TK', 'Belgaum Dist.', 12, 25),
(490, 'Kasmalgi', 'SDA Church, Yaraguddi', 'Lakkundi Post, Bhailongal TK', 'Belgaum Dist.', 12, 25),
(491, 'Hunder', 'SDA Church, Yaraguddi', 'Lakkundi Post, Bhailongal TK', 'Belgaum Dist.', 12, 25),
(492, 'Chickangrolli', 'SDA Church, Yaraguddi', 'Lakkundi Post, Bhailongal TK', 'Belgaum Dist.', 12, 25),
(493, 'Hireangrolli', 'SDA Church, Yaraguddi', 'Lakkundi Post, Bhailongal TK', 'Belgaum Dist.', 12, 25),
(494, 'Gandhigwad - A', 'SDA Church, Yaraguddi', 'Lakkundi Post, Bhailongal TK', 'Belgaum Dist.', 12, 25),
(495, 'Gandhigwad - B', 'SDA Church, Yaraguddi', 'Lakkundi Post, Bhailongal TK', 'Belgaum Dist.', 12, 25),
(496, 'Budargatti', 'c/o Pakirappa Kallappa Madar at Budarkatti', 'Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(497, 'Hitanagi', 'c/o Pakirappa Kallappa Madar at Budarkatti', 'Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(498, 'Kadasgatti', 'c/o Pakirappa Kallappa Madar at Budarkatti', 'Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(499, 'Govenkop', 'c/o Pakirappa Kallappa Madar at Budarkatti', 'Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(500, 'Hoolikatti', 'c/o Pakirappa Kallappa Madar at Budarkatti', 'Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(501, 'Khodanpur', 'c/o Pakirappa Kallappa Madar at Budarkatti', 'Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(502, 'Yenagi', 'c/o Pakirappa Kallappa Madar at Budarkatti', 'Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(503, 'Siddhasamudra', 'c/o Pakirappa Kallappa Madar at Budarkatti', 'Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(504, 'Bellikatti', 'c/o Pakirappa Kallappa Madar at Budarkatti', 'Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(505, 'Kalle', 'c/o Pakirappa Kallappa Madar at Budarkatti', 'Bhailhongal Taluk', 'Belgaum Dist.', 12, 25),
(506, 'Dharward', 'c/o Balurao J Jadhav, Behind Police Quarters', 'Durganagar, Haliyal', 'Uttar Kannada', 12, 25),
(507, 'Hulikeri', 'c/o Balurao J Jadhav, Behind Police Quarters', 'Durganagar, Haliyal', 'Uttar Kannada', 12, 25),
(508, 'Linganamatta - O', 'c/o Balurao J Jadhav, Behind Police Quarters', 'Durganagar, Haliyal', 'Uttar Kannada', 12, 25),
(509, 'Linganamatta - N', 'c/o Balurao J Jadhav, Behind Police Quarters', 'Durganagar, Haliyal', 'Uttar Kannada', 12, 25),
(510, 'Dori Boranki', 'c/o Balurao J Jadhav, Behind Police Quarters', 'Durganagar, Haliyal', 'Uttar Kannada', 12, 25),
(511, 'Bedrahalli', 'c/o Balurao J Jadhav, Behind Police Quarters', 'Durganagar, Haliyal', 'Uttar Kannada', 12, 25),
(512, 'Bidrolli', 'c/o Balurao J Jadhav, Behind Police Quarters', 'Durganagar, Haliyal', 'Uttar Kannada', 12, 25),
(513, 'Kalkeri', 'c/o Balurao J Jadhav, Behind Police Quarters', 'Durganagar, Haliyal', 'Uttar Kannada', 12, 25),
(514, 'Ramapur', 'c/o Balurao J Jadhav, Behind Police Quarters', 'Durganagar, Haliyal', 'Uttar Kannada', 12, 25),
(515, 'Yadoga', 'c/o Balurao J Jadhav, Behind Police Quarters', 'Durganagar, Haliyal', 'Uttar Kannada', 12, 25),
(516, 'Kalginkopp', 'c/o Kirappa Ranna Torlaka', 'Kawalwada, Uttar Kannada', 'Uttar Kannada', 12, 25),
(517, 'Sangmeshwar', 'c/o Kirappa Ranna Torlaka', 'Kawalwada, Uttar Kannada', 'Uttar Kannada', 12, 25),
(518, 'Sulikatti', 'c/o Kirappa Ranna Torlaka', 'Kawalwada, Uttar Kannada', 'Uttar Kannada', 12, 25),
(519, 'Maslikatti', 'c/o Kirappa Ranna Torlaka', 'Kawalwada, Uttar Kannada', 'Uttar Kannada', 12, 25),
(520, 'Kandli', 'c/o Kirappa Ranna Torlaka', 'Kawalwada, Uttar Kannada', 'Uttar Kannada', 12, 25),
(521, 'Ammanakopa', 'Hanumanth L SDA Church', 'Tatwangi, Haliyal', 'Uttar Kannada', 12, 25),
(522, 'B K Halli', 'Hanumanth L SDA Church', 'Tatwangi, Haliyal', 'Uttar Kannada', 12, 25),
(523, 'Joganakop', 'Hanumanth L SDA Church', 'Tatwangi, Haliyal', 'Uttar Kannada', 12, 25),
(524, 'Gulidkop', 'Hanumanth L SDA Church', 'Tatwangi, Haliyal', 'Uttar Kannada', 12, 25),
(525, 'Shivapur', 'Hanumanth L SDA Church', 'Tatwangi, Haliyal', 'Uttar Kannada', 12, 25),
(526, 'Tatwangi', 'Hanumanth L SDA Church', 'Tatwangi, Haliyal', 'Uttar Kannada', 12, 25),
(527, 'Basawalli', 'Hanumanth L SDA Church', 'Tatwangi, Haliyal', 'Uttar Kannada', 12, 25),
(528, 'Tattigera', 'Hanumanth L SDA Church', 'Tatwangi, Haliyal', 'Uttar Kannada', 12, 25),
(529, 'Nagshettikop', 'Hanumanth L SDA Church', 'Tatwangi, Haliyal', 'Uttar Kannada', 12, 25),
(530, 'Doddakop', 'c/o Rozer Fransic Birji Wada', 'Sambrani Post, Haliyal Taluk', 'Uttar Kannada', 12, 25),
(531, 'Jathka Hosur', 'c/o Rozer Fransic Birji Wada', 'Sambrani Post, Haliyal Taluk', 'Uttar Kannada', 12, 25),
(532, 'Kamthikop', 'c/o Rozer Fransic Birji Wada', 'Sambrani Post, Haliyal Taluk', 'Uttar Kannada', 12, 25),
(533, 'Kegdal', 'c/o Rozer Fransic Birji Wada', 'Sambrani Post, Haliyal Taluk', 'Uttar Kannada', 12, 25),
(534, 'Manahalli', 'c/o Rozer Fransic Birji Wada', 'Sambrani Post, Haliyal Taluk', 'Uttar Kannada', 12, 25),
(535, 'Tawarakatta', 'c/o Rozer Fransic Birji Wada', 'Sambrani Post, Haliyal Taluk', 'Uttar Kannada', 12, 25),
(536, 'Gadgeri', 'c/o Rozer Fransic Birji Wada', 'Sambrani Post, Haliyal Taluk', 'Uttar Kannada', 12, 25),
(537, 'Gardolli', 'c/o Rozer Fransic Birji Wada', 'Sambrani Post, Haliyal Taluk', 'Uttar Kannada', 12, 25),
(538, 'Wada/Badkiranga', 'c/o Rozer Fransic Birji Wada', 'Sambrani Post, Haliyal Taluk', 'Uttar Kannada', 12, 25),
(539, 'Gowda Cresher SDA Church', 'Gowda Cresher Compound', 'Kogilu Extension', 'Bangalore 91', 12, 26),
(540, 'Lowry Kannada Chruch of SDA', 'Dooravaninagar Post', '', 'Bangalore 16', 0, 0),
(541, 'H B Colony Telugu Church', 'H B Colony', 'Zechariah Kere, Sheshadripura', 'Bangalore 5', 0, 0),
(542, 'K G Galli SDA Church', 'Opp. K G Galli Police Stn.', '', 'Bangalore', 0, 0),
(543, 'White Field SDA Church', 'White Field', '', 'Bangalore', 0, 0),
(544, 'Krishnainapalya Kannada Church', 'Iind Main, Iind Cross', 'Krishnainapalya', 'Bangalore 560 038', 0, 0),
(545, 'Binny pet Tamil Church', 'Bhakshi Garden', 'Near Cotton Post Police Station', 'Bangalore', 0, 0),
(546, 'SDA Prayer Hall', '12/2, 12th Cross', 'Maruthinagar, Mdiwala', 'Bangalore', 0, 0),
(547, 'Central English Church', 'No. 12 Cunningham Road', 'Next to Westminster', 'Bangalore 52', 0, 0),
(548, 'Central Kannada Church', '98, Spencer Road', 'Frazer Town', 'Bangalore 5', 0, 0),
(549, 'SDA Kannada church', 'Gadigenahalli, Nandagudi Hobli', 'Kemmadignahalli Post', 'Hoskote T K 562441', 0, 0),
(550, 'SDA Malayalam Church', 'Sevanagar', '', 'Bangalore', 0, 0),
(551, 'SDA Tamil Church', 'No. 4, Ist Main Road, IIIrd Stage', 'Pillanna garden', 'Bangalore 45', 0, 0),
(552, 'Tamil Central Church', 'K J Halli Jalahalli West', '', 'Bangalore 15', 0, 0),
(553, 'Central Kannada Church', 'No. 41 Annipura Main Road', 'Sudhamanagar', 'Bangalore 27', 0, 0),
(554, 'SDA Telugu Church', 'Bhakshi Garden Cottonpet', 'Near Market', 'Bangalore 18', 0, 0),
(555, 'Lowry Kannada Chruch of SDA', 'Dooravaninagar Post', '', 'Bangalore 16', 12, 26),
(556, 'H B Colony Telugu Church', 'H B Colony', 'Zechariah Kere, Sheshadripura', 'Bangalore 5', 12, 26),
(557, 'K G Galli SDA Church', 'Opp. K G Galli Police Stn.', '', 'Bangalore', 12, 26),
(558, 'White Field SDA Church', 'White Field', '', 'Bangalore', 12, 26),
(559, 'Krishnainapalya Kannada Church', 'Iind Main, Iind Cross', 'Krishnainapalya', 'Bangalore 560 038', 12, 26),
(560, 'Binny pet Tamil Church', 'Bhakshi Garden', 'Near Cotton Post Police Station', 'Bangalore', 12, 26),
(561, 'SDA Prayer Hall', '12/2, 12th Cross', 'Maruthinagar, Mdiwala', 'Bangalore', 12, 26),
(562, 'Central English Church', 'No. 12 Cunningham Road', 'Next to Westminster', 'Bangalore 52', 12, 26),
(563, 'Central Kannada Church', '98, Spencer Road', 'Frazer Town', 'Bangalore 5', 12, 26),
(564, 'SDA Kannada church', 'Gadigenahalli, Nandagudi Hobli', 'Kemmadignahalli Post', 'Hoskote T K 562441', 12, 26),
(565, 'SDA Malayalam Church', 'Sevanagar', '', 'Bangalore', 12, 26),
(566, 'SDA Tamil Church', 'No. 4, Ist Main Road, IIIrd Stage', 'Pillanna garden', 'Bangalore 45', 12, 26),
(567, 'Tamil Central Church', 'K J Halli Jalahalli West', '', 'Bangalore 15', 12, 26),
(568, 'Central Kannada Church', 'No. 41 Annipura Main Road', 'Sudhamanagar', 'Bangalore 27', 12, 26),
(569, 'SDA Telugu Church', 'Bhakshi Garden Cottonpet', 'Near Market', 'Bangalore 18', 12, 26),
(570, 'Ambedkar Nagar SDA Church', 'Ambedkar Nagar', 'Kannur Halli Road', 'Hoskote Taluk 562114', 12, 26),
(571, 'Austin SDA Tamil Church', '201, New Building', 'Austin Town Layout', 'Bangalore 560 047', 12, 26),
(572, 'Lowry Tamil Church', 'Dooravaninagar Post', '', 'Bangalore 560 016', 12, 26),
(573, 'Ramanagar SDA Telugu Church', 'HAL, Murugeshpalya', '', 'Bangalore', 12, 26),
(574, 'Handhrahalli SDA Telugu Church', 'Handhrahalli Gate', 'Boodigere Road', 'Bangalore', 12, 26),
(575, 'Jayanagar SDA Church', 'Jayanagar BTM Layout', '16th Main BTM I Stage', 'Bangalore', 12, 26),
(576, 'Central Tamil Church', '8, Spencer Road', 'Frazer Town', 'Bangalore 560 005', 12, 26),
(577, 'Suggaraju Nagar Telugu Church', 'Suggaraju Nagar', 'Near Milk Dairy Circle', 'Bangalore', 12, 26),
(578, 'Sunkadakatte Kannada Church', 'Sunkadakatte, Rajiv Gandhi Nagar', 'Viswanessdam Post', 'Bangalore 91', 12, 26),
(579, 'Kavalbyrasandra Tamil Church', 'Kavalbyrasandra, Frazer Town', 'Rajivnagar', 'Bangalore 5', 12, 26),
(580, 'Coffee Board Tamil Church', 'Coffee Board, No. 256', 'P & T Colony, Deverajeevanahalli', 'Bangalore 560 045', 12, 26),
(581, 'Vinayakalayout Kannada Church', 'No. 1069/6th Cross', 'Vinayakalayout, Manorayanapalya', 'Bangalore 32', 12, 26),
(582, 'Vinayakanagar Kannada Church', 'Iind Cross', 'Vinayakanagar, Ramnagar', 'Bangalore', 12, 26),
(583, 'SDA Malayalam Church', 'Kasturi Colony, 7th Cross', 'Rajgopal Nagar, Peenya II Stage', 'Bangalore 58', 12, 26),
(584, 'Ramnagari Telugu Church', 'Ramnagari', 'Murugeshpalya', 'Bangalore', 12, 26),
(585, 'Sunshine English Church', 'Kalkere', 'Horamavu Post', 'Bangalore 46', 12, 26);
INSERT INTO `jos_churches` (`id`, `name`, `street`, `street2`, `city`, `state_id`, `conference_id`) VALUES
(586, 'Raichur SDA Central Church', 'Ashapur Road Ganga Nagar', 'Vijayanagara Colony', 'Raichur 584 101', 12, 27),
(587, 'Devinagar', 'c/o Raichur SDA, Ashapur Road Ganga Nagar', 'Vijayanagara Colony', 'Raichur 584 101', 12, 27),
(588, 'Idupnur Church', 'c/o Raichur SDA, Ashapur Road Ganga Nagar', 'Vijayanagara Colony', 'Raichur 584 102', 12, 27),
(589, 'Banny Matti Church', 'Hire Banny Matti 583 216', '', 'Tq Hadagali Dist Bellary', 12, 27),
(590, 'Telugu Church', 'c/o Andral Rudrappa, Compound Behind Pavan', 'Hotel 2nd Cross Near Infant Jesus School', 'Bellary', 12, 27),
(591, 'Kannada Church Bellary', 'c/o Andral Rudrappa, Compound Behind Pavan', 'Hotel 2nd Cross Near Infant Jesus School', 'Bellary', 12, 27),
(592, 'Kulsumbi Colony', 'c/o Raichur Bellary Region, SDA Ashapur Road', 'Ganganagar Vijaya Nagar Colony', 'Raichur 584 101', 12, 27),
(593, 'Marchathall Church', 'c/o Raichur Bellary Region, SDA Ashapur Road', 'Ganganagar Vijaya Nagar Colony', 'Raichur 584 102', 12, 27),
(594, 'Vakkarani', 'c/o Raichur - Bellary Region of SDA Vijayanagar', 'Ashapur Road Ganganagar', 'Raichur - 584 101', 12, 27),
(595, 'Chikkotnekal Church', 'c/o Muukappa', 'Christian House Chikotnekal', 'Tq Manvi Raichur', 12, 27),
(596, 'Yddiwal Church', 'c/o Muukappa', 'Christian House Chikotnekal', 'Tq Manvi Raichur', 12, 27),
(597, 'Chitralli', 'c/o Muukappa', 'Christian House Chikotnekal', 'Tq Manvi Raichur', 12, 27),
(598, 'LBS Nagar', 'H. Muniswamy', 'Mohamod Begum', 'LBS Nagar Raichur', 12, 27),
(599, 'Sankanoor', 'H. Muniswamy', 'Mohamod Begum', 'LBS Nagar Raichur', 12, 27),
(600, 'Kudulur', 'H. Muniswamy', 'Mohamod Begum', 'LBS Nagar Raichur', 12, 27),
(601, 'Machlapur', 'H. Muniswamy', 'Mohamod Begum', 'LBS Nagar Raichur', 12, 27),
(602, 'Manjarla', 'c/o Vijay Kumar K, via Thuntapur', 'Manjarla - Post', 'Raichur - Dist', 12, 27),
(603, 'Uppral', 'c/o Vijay Kumar K, via Thuntapur', 'Manjarla - Post', 'Raichur - Dist', 12, 27),
(604, 'Mattimalkapur', 'c/o Vijay Kumar K, via Thuntapur', 'Manjarla - Post', 'Raichur - Dist', 12, 27),
(605, 'Eddala Doddi', 'c/o Raichur - Bellary Region of SDA Vijayanagar', 'Ashapur Road Ganganagar', 'Raichur', 12, 27),
(606, 'Hole Bellary - Company', 'c/o Raichur - Bellary Region of SDA Vijayanagar', 'Ashapur Road Ganganagar', 'Raichur', 12, 27),
(607, 'Gangavathi Church', 'c/o SDA Church Near Lakshmi', 'Camp Gowli Nagar Road, Gangavathi', 'Tq: Dist Koppal', 12, 27),
(608, 'Hosahalli', 'c/o SDA Church Near Lakshmi', 'Camp Gowli Nagar Road, Gangavathi', 'Tq: Dist Koppal', 12, 27),
(609, 'Biol Marched', 'Idapunur Post', 'Christian House Chikotnekal', 'Tq: Dist Raichur', 12, 27),
(610, 'BM Camp', 'Idapunur Post', 'Christian House Chikotnekal', 'Tq: Dist Raichur', 12, 27),
(611, 'Kere Budoru', 'c/o Christian house Gadar', '', 'Tq: Dist Raichur', 12, 27),
(612, 'Kthoddi', 'c/o Christian house Gadar', '', 'Tq: Dist Raichur', 12, 27),
(613, 'PurthiPalli', 'c/o Christian house Gadar', '', 'Tq: Dist Raichur', 12, 27),
(614, 'Devi nagar', 'Ashapur Road', 'Near Agape Church', 'Ragiman Gadda Raichur', 12, 27),
(615, 'Honattigi', 'Methodist Mission Campus', '', 'Raichur', 12, 27),
(616, 'Pooseari SDA Church', 'Periya Elai, Pooseari (Po)', 'Mudukulathur (Taluk)', 'Ramnad DT', 24, 8),
(617, 'Thiruppathur Church', 'Ashath Street, Mahibalan Pattiyar House', 'Thiruppathur', 'Sivagangai DT', 24, 8),
(618, 'Thengarai SDA Church', 'Karaikudi Mani Road', 'Thengarai', 'Sivagangai DT', 24, 8),
(619, 'Kuthalur SDA Church', 'Nadrar Street, Kuthalur', '', 'Sivagangai DT', 24, 8),
(620, 'Kalkurichi SDA Church', 'Kalkurichi', 'Manamadurai 630 606', 'Sivagangai DT', 24, 8),
(621, 'Theethanpettai SDA Church', 'Theethanpettai', 'Manamadurai 630 606', 'Sivagangai DT', 24, 8),
(622, 'SDA Prayer House', 'c/o P.S. Pitchai Muthu', '78, Jeeva Nagar, Manamadurai - 630 606', 'Sivagangai DT', 24, 8),
(623, 'Mudukulathur SDA Church', 'Deivendra Nagar', 'Mudukulathur (Taluk)', 'Ramnad DT', 24, 8),
(624, 'Paramakudi SDA Church', 'c/o SDA Primary School', '', 'Paramakudi, Ramnad District', 24, 8),
(625, 'Manjur SDA Church', 'Manjur', '', 'Ramnad District', 24, 8),
(626, 'Kumukottai SDA Church', 'Kumukottai', '', 'Ramnad District', 24, 8),
(627, 'Kammankottai SDA Church', 'Kammankottai', '', 'Ramnad District', 24, 8),
(628, 'Rameshwaram SDA Church', 'Akkal Madam', 'Rameshwaram', 'Ramnad District', 24, 8),
(629, 'Chinnamayakulam SDA Church', 'Bharathi Nagar', 'Chinnamayakulam', 'Ramnad District', 24, 8),
(630, 'Abiramam SDA Church', 'Abiramam (Po)', 'Kamuthi (Taluk)', 'Ramnad District', 24, 8),
(631, 'Vilathur SDA Church', 'Vilathur, Paramakudi Road', '', 'Ramnad District', 24, 8),
(632, 'Usilankulam SDA Church', 'Usilankulam, Veeracholan Taluk', 'Madurai Road', 'Ramnad District', 24, 8),
(633, 'Inesh Nivas SDA Church', 'Inesh Nivas', '59, Kurichipuram, Anantha Nagar', 'Karaikudi -3, Sivagangai District', 24, 8),
(634, 'Azhagapuri SDA Church', 'Azhagapuri, Alagappapuram', 'Kottaiyur, Karaikudi', 'Sivagangai District', 24, 8),
(635, 'Suthanthirapuram SDA Church', 'Kallur Colony, Kallur Post', '', 'Pudukkottai District', 24, 8),
(636, 'Pudumadam Church', 'West Street', 'Pudumadam Post', 'Ramnad District', 24, 8),
(637, 'Mandapam SDA Church', 'Near Railway Station', 'Mandapam Camp', 'Ramnad District', 24, 8),
(638, 'Perumapachery SDA Church', 'Saveriar Pattinam Post', 'Manamadurai Taluk', 'Sivagangai District', 24, 8),
(639, 'Vagudi SDA Church', 'Vagudi, Muthanenthal Post', 'Manamadurai Taluk', 'Sivagangai District', 24, 8),
(640, 'Malavarayanenthal SDA Church', 'Malavarayanenthal, Thiruppachetti Post', 'Thiruppuvanam Taluk', 'Sivagangai District', 24, 8),
(641, 'Gandhi Nagar SDA Church', 'Gandhi Nagar, Pacheri Post', 'Manamadurai Taluk', 'Sivagangai District', 24, 8),
(642, 'Papankulam SDA Church', 'Papankulam, Edaikkathur Post', 'Manamadurai Taluk', 'Sivagangai District', 24, 8),
(643, 'Sirugudi SDA Church', 'Sirugudi, Edaikkathur Post', 'Manamadurai Taluk', 'Sivagangai District', 24, 8),
(644, 'Alankulam SDA Church', 'Alankulam Colony, Papankulam Post', 'Thiruppuvanam Taluk', 'Sivagangai District', 24, 8),
(645, 'Thirupachetti SDA Church', 'Thirupachetti, Thirupachetti Post', 'Manamadurai Taluk', 'Sivagangai District', 24, 8),
(646, 'Muthanenthal SDA Church', 'Muthanenthal, Muthanenthal Post', 'Manamadurai Taluk', 'Sivagangai District', 24, 8),
(647, 'Sengapadai SDA Church', 'Sengapadai, Pudukottai - 623 603', 'Kamuthi (Taluk)', 'Ramnad District', 24, 8),
(648, 'Thoppadai Patti SDA Church', 'Thoppadai Patti', 'Pudukottai - 623 603', 'Kamuthi, Ramnad District', 24, 8),
(649, 'Chokkalingapuram SDA Church', 'Chokkalingapuram', 'Pudukottai - 623 603', 'Kamuthi, Ramnad District', 24, 8),
(650, 'Sangarappan Patti SDA Church', 'Sangarappan Patti, Periyoor', 'Mudukulathur Taluk', 'Ramnad District', 24, 8),
(651, 'Vellaiyapuram SDA Church', 'Vellaiyapuram', 'Kamuthi - 623 603', 'Ramnad District', 24, 8),
(652, 'Kalikulam SDA Church', 'Kalikulam', 'Abiramam Post', 'Ramnad District', 24, 8),
(653, 'Purasaloor SDA Church', 'Purasaloor, Paralachi Post', 'Mustakurichi (Via)', 'Virudhunagar District', 24, 8),
(654, 'Vangarupuram SDA Church', 'Vangarupuram, Punavasal Post', 'Vallakulam, Veeracholan', 'Ramnad District', 24, 8),
(655, 'N. Karishalkulam SDA Church', 'N. Karishalkulam, Neeravi Post', 'Kamuthi Taluk', 'Ramnad District', 24, 8),
(656, 'A. Pudur SDA Church', 'A. Pudur, Abiramam (Via)', 'Anaiyur Post - 623 601, Kamuthi Taluk', 'Ramnad District', 24, 8),
(657, 'Sevelthotam SDA Church', 'Sevelthotam, Abiramam Post', '', 'Ramnad District - 623 601', 24, 8),
(658, 'Railway SDA Church', '5/58 South St., Railway Colony', 'Rajagameeram', 'Sivagangai Dt. 630609', 24, 8),
(659, 'R. Pudur SDA Church', 'R. Pudur', 'Rajagambeeram Post', 'Sivagangai Dt. 630609', 24, 8),
(660, 'Madurai Mandapam SDA Church', 'Madurai Mandapam Road', 'Thirupuvanam', 'Sivagangai District', 24, 8),
(661, 'Contonment SDA Church', '20/2 Williams Road', 'Contonment', 'Trichy - 620 001', 24, 8),
(662, 'Subramaniapuram SDA Church', 'Panner Selvam Street', 'Subramaniapuram', 'Trichy - 620 020', 24, 8),
(663, 'KK Nagar SDA Church', 'Wireless Road', 'KK Nagar', 'Trichy - 620 021', 24, 8),
(664, 'South East SDA Church', 'South East Ramalinga Nagar, Extension', 'Vaylar Road, Kumaran Nagar', 'Puttur, Trichy - 620 017', 24, 8),
(665, 'Kambar Street SDA Church', 'Kambar Street', 'Kattur', 'Trichy - 620 019', 24, 8),
(666, 'BHEL SDA Church', 'E 397 F BHEL', '', 'Trichy - 620 014', 24, 8),
(667, 'Arasankudi SDA Church', 'Madhakoil Street', 'Arasankudi', 'Trichy - 620 019', 24, 8),
(668, 'Kovinthapuram SDA Church', 'Kovinthapuram, Kovanthakudi, Po', 'Manachanalur', 'Trichy', 24, 8),
(669, 'Edamalaipattiputhur SDA Church', 'Rajeev Gandhi Street', 'Edamalaipattiputhur', 'Trichy', 24, 8),
(670, 'Poovalur SDA Church', 'Ariyalaur Road', 'Pinnevasal Po, Poovalur', 'Trichy', 24, 8),
(671, 'Pinnavasal Road SDA Church', 'Pinnavasal Road', 'Kattur', 'Trichy', 24, 8),
(672, 'Ariyur SDA Church', 'Ariyur, Anbil PO', 'Lalkudi - 621 702', 'Trichy', 24, 8),
(673, 'Venkadeshapuram SDA Church', '9th Cross Street', 'Venkadeshapuram', 'Perambulur - 621 212', 24, 8),
(674, 'Veterinary Hospital Lane SDA Church', 'Veterinary Hospital Lane', '', 'Padalur', 24, 8),
(675, 'Market Ground SDA Church', 'Market Ground', 'Krishnapuram - 621 116', 'Vapamthatti, Perambulur', 24, 8),
(676, 'Suramangalam SDA Church', 'D. No. 470 Brajaji Street', 'Suramangalam', 'Salem - 636 005', 24, 8),
(677, 'Kalarampatti SDA Church', '464-5 Pookarathottam', 'Kalarampatti Main Road', 'Salem - 636 015', 24, 8),
(678, 'South Udaiyarpalayam SDA Church', '195, Anna Street', 'South Udaiyarpalayam', 'Athur - 636 102', 24, 8),
(679, 'Vellur Road SDA Church', '24/3 Vellur Road', '', 'Trichengodu - 637 211', 24, 8),
(680, 'Naripallam SDA Church', 'Naripallam', '', 'Tiruchengodu - 637 211', 24, 8),
(681, 'Preethi SDA Church', 'Preethi', '', 'Tiruchengodu - 637 211', 24, 8),
(682, 'Ammapettai SDA Church', 'Ammapettai', '', 'Salem', 24, 8),
(683, 'Nagarajapuram SDA Church', 'Nagarajapuram', 'Trichy Main Road', 'Namakkal', 24, 8),
(684, 'Thumbamkurichi SDA Church', 'Thumbamkurichi', '', 'Namakkal', 24, 8),
(685, 'Varadharajapuram Road SDA Church', 'Varadharajapuram Road', '', 'Kasthuripatti - 638 013', 24, 8),
(686, 'Palaiyapalayam SDA Church', 'Palaiyapalayam', '', 'Namakkal', 24, 8),
(687, 'Thuthikulam SDA Church', 'Rasipuram Mani Road', 'Thuthikulam, Kallapanaikampatti Po', 'Namakkal', 24, 8),
(688, 'Authukutty SDA Church', 'Authukutty', 'Kallapanaikampatti', 'Namakkal', 24, 8),
(689, 'Illur SDA Church', 'Illur', 'Puthan Santhai Po', 'Namakkal', 24, 8),
(690, 'Chellapan Gounder Street SDA Church', '114, Chellapan Gounder Street', 'Kattur', 'Coimbatore - 641 009', 24, 8),
(691, 'Feeder Road SDA Church', '16 Rly. Feeder Road', '', 'Tirupur - 638 601', 24, 8),
(692, 'Teachers Colony SDA Church', 'Udumalaipet Road', 'Teachers Colony', 'Pollachi - 642 001', 24, 8),
(693, 'Devanurputhur SDA Church', 'Devanurputhur', '', 'Pollachi', 24, 8),
(694, 'Valaithottam SDA Church', 'Valaithottam', '', 'Valparai - 642 127', 24, 8),
(695, 'Kadathur SDA Church', 'Kadathur', 'Kanniyur Po - 642 241', 'Karathulu, Udumalaipet', 24, 8),
(696, 'Varatharajpuram SDA Church', 'Paladam Main Road', 'Varatharajpuram - 642 201', 'Udumalaipet', 24, 8),
(697, 'Bharathinagar SDA Church', 'Bharathinagar, Pulavadi Po', 'Kudimangalam', 'Udumalaipet', 24, 8),
(698, 'Natchipalayam SDA Church', 'Kangayam Main Road', 'Natchipalayam', 'Thiruppur', 24, 8),
(699, 'Pullakalaiplayam SDA Church', 'Pullakalipalayam Village', '', 'Tirupur', 24, 8),
(700, 'Angalakurichi SDA Church', 'Kottur Road', 'Angalakurichi', 'Pollachi', 24, 8),
(701, 'Kottamangalam SDA Church', 'Kumarapalayam Village', 'Kottamangalam 642 201', 'Udumalaipet', 24, 8),
(702, 'Periar Nagar SDA Church', '452 Periar Nagar', '', 'Palladam - 641 664', 24, 8),
(703, 'Kanniyur SDA Church', 'AN Palayam, Kanniyur', '', 'Udumalaipet - 642 203', 24, 8),
(704, 'Vadaku Raja Street SDA Church', 'Vadaku Raja Street', '', 'Madathukulam', 24, 8),
(705, 'Dhali SDA Church', 'Dhali', '', 'Pollachi', 24, 8),
(706, 'Karathozhu SDA Church', 'Valluvar Street', 'Karathozhu', 'Udumalaipet', 24, 8),
(707, 'Pulliampatti SDA Church', 'Pulliampatti', '', 'Pollachi', 24, 8),
(708, 'Madhukulam SDA Church', 'South Kanadiputhur', 'Madhukulam', 'Udumalaipet', 24, 8),
(709, 'Pappankulam Colony SDA Church', 'Pappankulam Colony', '', 'Udumalaipet', 24, 8),
(710, 'Victor Simonal Street SDA Church', '18 Victor Simonal Street', '', 'Pondicherry - 605 001', 24, 8),
(711, 'Gorimadu SDA Church', 'Thattamchavadi Road', 'Gandhi Nagar', 'Gorimadu, Pondicherry - 605 009', 24, 8),
(712, 'JJ Nagar SDA Church', 'JJ Nagar, 3rd Cross Street', '', 'Pondicherry - 605 010', 24, 8),
(713, 'Shanmugapuram SDA Church', 'Valudhapuram Road', 'Shanmugapuram', 'Pondicherry - 605 009', 24, 8),
(714, 'Marapalayam SDA Church', '100 Feet Road', 'Marapalayam', 'Pondicherry', 24, 8),
(715, 'Ambedkar Street SDA Church', '9 Dr. Ambedkar Street', '', 'Thiruvanamalai', 24, 8),
(716, 'Kaunthuvampadi SDA Church', 'Kaunthuvampadi Village', '', 'Thiruvanamalai', 24, 8),
(717, 'Mallavadi SDA Church', 'Mallavadi Village', '', 'Thiruvanamalai', 24, 8),
(718, 'Thayanur SDA Church', 'Thayanur Village', '', 'Thiruvanamalai', 24, 8),
(719, 'Link Road SDA Church', '83 Link Road', '', 'Panruti - 607 106', 24, 8),
(720, 'Lapoliar Street SDA Church', '7 Lapoliar Street', 'Sorakalpet Road', 'Cuddalore - 1', 24, 8),
(721, 'Dr. Ambedkar Road SDA Church', 'Block 13, Dr. Ambedkar Road', '', 'Neyveli 607 803', 24, 8),
(722, 'Mantharakuppam SDA Church', 'Marchant Street', 'Mantharakuppam', 'Neyveli - 607 802', 24, 8),
(723, 'Vandigate SDA Church', '404 A. Kamaraj Nagar', 'Vandigate', 'Chittambaram - 1', 24, 8),
(724, 'Sedapalayam SDA Church', 'Sedapalayam', '', 'Cuddalore', 24, 8),
(725, 'Bagayam English & Tamil SDA Church', 'Otteri Road', 'Bagayam', 'Vellore 632 002', 24, 8),
(726, 'Poikai SDA Church', 'Ambedkar Nagar', 'Salem Main Road', 'Poikai, Vellore', 24, 8),
(727, 'Mullipalayam SDA Church', 'Ambedkar Nagar', 'Mullipalayam', 'Vellore', 24, 8),
(728, 'Alumalumagapuram SDA Church', 'PK Ammankoil Street', 'Alumalumagapuram', 'Vellore - 632 009', 24, 8),
(729, 'New Bethlehem SDA Church', 'Asanampet Road', 'New Bethlehem', 'Ambur - 635 802', 24, 8),
(730, 'Vaniyampadi Road SDA Church', 'Vaniyampadi Road', '', 'Marapattu', 24, 8),
(731, 'Santrorkuppam SDA Church', 'Salem Main Road', 'Santrorkuppam', 'Ambur - 635 814', 24, 8),
(732, 'Kannadikuppam SDA Church', 'Kannadikuppam', 'Vanniampadi TK', 'Ambur', 24, 8),
(733, 'Chinnavarigam SDA Church', 'Pernampet Road', 'Chinnavarigam', 'Ambur', 24, 8),
(734, 'Salem Main Road SDA Church', 'Salem Main Road', '', 'Thirupattur - 635 001', 24, 8),
(735, 'Periyakaram SDA Church', 'Periyakaram', '', 'Thirupattur - 635 004', 24, 8),
(736, 'Pinji SDA Church', 'Pinji', '', 'Ranipet - 632 401', 24, 8),
(737, 'Circus Ground SDA Church', 'Circus Ground', 'Salem Main Road', 'Thirupathur', 24, 8),
(738, 'Marakkalam Patti SDA Church', 'Marakkalam Patti', '', 'Harur TK', 24, 8),
(739, 'Rly Station Road SDA Church', 'Rly Station Road', '', 'Gudiyatham - 632 602', 24, 8),
(740, 'Ambur Main Road SDA Church', 'Ambur Main Road', '', 'Pernampet', 24, 8),
(741, 'V. Kotta Road SDA Church', 'V. Kotta Road', '', 'Paathalapalli', 24, 8),
(742, 'Thirupattur Road SDA Church', 'Thirupattur Road', '', 'Agramcherri', 24, 8),
(743, 'Venkatasamuthram SDA Church', 'Venkatasamuthram', '', 'Ambur', 24, 8),
(744, 'Bharathipuram SDA Church', '66 Feet Road', 'Bharathipuram', 'Dharmapuri - 636 705', 24, 8),
(745, 'Bypass Road SDA Church', 'Bypass Road', '', 'Palacode - 633 808', 24, 8),
(746, 'Ragamed Colony SDA Church', 'Ragamed Colony', '', 'Rayakottai - 635 116', 24, 8),
(747, 'Karimangalam Road SDA Church', 'Karimangalam Road', '', 'Vellichandai - 633 808', 24, 8),
(748, 'A. Mallapuram SDA Church', 'A. Mallapuram', '', 'Palacode TK', 24, 8),
(749, 'Gobinathampatti SDA Church', 'Gobinathampatti', 'Harur TK', 'Dharmapuri', 24, 8),
(750, 'Agram SDA Church', 'Agarm Colony, Agram', 'Marandattalli Po', 'Palacode TK', 24, 8),
(751, 'Marakkalanpatti SDA Church', 'Marakkalanpatti', '', 'Harur TK', 24, 8),
(752, 'Katpadi SDA Church', 'Thurthamalai Road', '', 'Katpadi, Harur TK', 24, 8),
(753, 'Jeevan Joythi SDA English Church', 'Jeevan Joythi Campus', 'Denkanikottai Road', 'Hosur - 635 110', 24, 8),
(754, 'Jeevan Joythi SDA Tamil Church', 'Jeevan Joythi Campus', 'Denkanikottai Road', 'Hosur - 635 110', 24, 8),
(755, 'Anandha Ashram SDA Church', 'Anandha Ashram', 'Denkanikottai Road', 'Hosur - 635 110', 24, 8),
(756, 'Podar SDA Church', 'Podar, Mathur', '', 'Krishnagiri', 24, 8),
(757, 'Sundrampalli SDA Church', 'Sundrampalli Po', '', 'Krishnagiri District', 24, 8),
(758, 'Nagampalli SDA Church', 'Nagampalli Colony', 'Nagampalli Post - 639 109', 'Karur Dt', 24, 8),
(759, 'Moolapatti SDA Church', 'Moolapatti Colony', 'Moolapatti Post - 639 109', 'Karur Dt', 24, 8),
(760, 'Viswanathapuri SDA Church', 'Anna Nagar', 'Viswanathapuri PO - 639002', 'Karur Dt', 24, 8),
(761, 'Deethapati SDA Church', 'Seethapati Colony', 'Moolapatti Post - 639 109', 'Karur Dt', 24, 8),
(762, 'New Street SDA Church', 'No. 84 A 1/2 New Street', 'Aravakurichi Post', 'Karur Dt 639 201', 24, 8),
(763, 'Anna Nagar SDA Church', 'Anna Nagar, Moalapalayam', 'K. Paramathi PO, Noyal VIA', 'Karur Dt', 24, 8),
(764, 'Munoor SDA Church', 'Munoor, Gandhipuram Colony', 'Noyal VIA, K. Paramathi PO', 'Karur Dt', 24, 8),
(765, 'Punnam SDA Church', 'Punnam', 'Punnam Chatram PO', 'Karur Dt - 639 006', 24, 8),
(766, 'Chellipalayam SDA Church', 'Chellipalayam', 'Somur VIA', 'Karur Dt', 24, 8),
(767, 'Old Bus Stand SDA Church', 'Old Bus Stand', '', 'Karur - 639 001', 24, 8),
(768, 'Pavithram SDA Church', 'Pavithram', 'Pavithram PO - 639 201', 'Karur Dt Aravukuruchi TK', 24, 8),
(769, 'Pitchampatti SDA Church', 'Pitchampatti, Pitchampatti PO', 'Aravakurichi TK 639 001', 'Karur Dt', 24, 8),
(770, 'Chinna Dharapuram SDA Church', 'Chinna Dharapuram, Chinna Dharapuram PO', 'Aravakurichi TK', 'Karur Dt', 24, 8),
(771, 'Nenjukkali Palayam SDA Church', 'Nenjukkali Palayam, Chinna Dharapuram PO', 'Aravakurichi TK', 'Karur Dt', 24, 8),
(772, 'Sundamedu SDA Church', 'Sundamedu, Thennilai PO', 'Aravakurichi TK', 'Karur Dt', 24, 8),
(773, 'Kathasamipalayam SDA Church', 'Kathasamipalayam, Chinna Dharapuram PO', 'Kannivadi VIA', 'Karur Dt', 24, 8),
(774, 'Pasupathipalayam SDA Church', 'Pasupathipalayam, Anjur PO', 'Karur TK', 'Karur Dt', 24, 8),
(775, 'Christian Street SDA Church', 'Christian Street', '', 'Kannivadi', 24, 8),
(776, 'Thevaram SDA Church', 'Main Road', 'Thevaram', 'Theni District', 24, 28),
(777, 'E. Pudukkottai SDA Church', 'E. Pudukkottai', 'Periyakulam - Taluk - 625601', 'Theni District', 24, 28),
(778, 'J K Nagar SDA Church', 'Palamalai Road', 'J K Nagar, Periyakulam Taluk - 625601', 'Theni District', 24, 28),
(779, 'Aathipatti SDA Church', 'Aathipatti Post', '', 'Theni District', 24, 28),
(780, 'Uppukkottai SDA Church', 'Kuchanur Road', 'Uppukkottai', 'Theni District', 24, 28),
(781, 'Gudulur SDA Church', 'Kannagi Nagar, Kumuli Main Road', 'Gudulur', 'Theni District', 24, 28),
(782, 'Periyakulam SDA Church', 'Cumbum Road, T. Kallipatti', 'Periyakulam - 625602', 'Theni District', 24, 28),
(783, 'Sarathupatty SDA Church', 'Sarathupatty, Periyakulam Taluk', 'Periyakulam - 625602', 'Theni District', 24, 28),
(784, 'AlagarsamiPuram SDA Church', 'Kaliamman Kovil Street, AlagarsamiPuram', 'Periyakulam - 625602', 'Theni District', 24, 28),
(785, 'Ammapatty SDA Church', 'JJ Colony', 'Ammapatty, Vadaputhupatti Post', 'Theni District', 24, 28),
(786, 'Kombai SDA Church', 'Bodi Main Road', 'Kombai', 'Theni District', 24, 28),
(787, 'Thirukoilur Main Road SDA Church', 'Thirukoilur Main Road, Periasevalai Post', 'Ulundurpettai Taluk', 'Villupuram District', 24, 29),
(788, 'Parrikal SDA Church', 'Via Parrikal, Periasevalai Post', 'Kuvagam, Ulundurpettai Taluk', 'Villupuram District', 24, 29),
(789, 'Siruvanoor SDA Church', 'Yammapoor Post, Siruvanoor', 'Thirukoilurnallur', 'Villupuram District', 24, 29),
(790, 'Melmalaganoor SDA Church', 'Via Melmalaganoor, Thayanoor Post', 'Thiruvannamallai Taluk', 'Villupuram District', 24, 29),
(791, 'Shalom Main Road SDA Church', 'Shalom Main Road', 'Tiruloilur 605757', 'Villupuram District', 24, 29),
(792, 'Saleyampalayam SDA Church', 'Saleyampalayam', 'Valavanoor', 'Villupuram District', 24, 29),
(793, 'K K Nagar SDA Church', '4/282 E Silver Sand', 'K K Nagar', 'Villupuram District', 24, 29),
(794, 'Arasur SDA Church', 'Trichy Main Road, Near VRS College', 'Arasur Post, Ulundurpettai Taluk', 'Villupuram District', 24, 29),
(795, 'Valavanoor SDA Church', '54 F West Pondy Road', 'Valavanoor', 'Villupuram District', 24, 29),
(796, 'Valayampattu SDA Church', 'Valayampattu Post', 'Thirukoilurnallur', 'Villupuram District', 24, 29),
(797, 'Gandhikuppam SDA Church', 'Gandhikuppam', 'Thirukoilurnallur', 'Villupuram District', 24, 29),
(798, 'Melamangalam SDA Church', 'Melamangalam', 'Thirukoilurnallur', 'Villupuram District', 24, 29),
(799, 'Eduthupottan SDA Church', 'Eduthupottan Colony', 'Valavanoor', 'Villupuram District', 24, 29),
(800, 'Vaniampalayam SDA Church', 'Vaniampalayam', 'Valavanoor', 'Villupuram District', 24, 29),
(801, 'Gingee SDA Church', 'Gingee', '', 'Villupuram District', 24, 29),
(802, 'Vikravandi SDA Church', 'Chennai Main Road', 'Vikravandi', 'Villupuram District', 24, 29),
(803, 'Suraipattu SDA Church', 'Thiruloilur Main Road', 'Suraipattu, Thirukoilur Taluk', 'Villupuram District', 24, 29);

-- --------------------------------------------------------

--
-- Table structure for table `jos_components`
--

DROP TABLE IF EXISTS `jos_components`;
CREATE TABLE IF NOT EXISTS `jos_components` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL default '',
  `link` varchar(255) NOT NULL default '',
  `menuid` int(11) unsigned NOT NULL default '0',
  `parent` int(11) unsigned NOT NULL default '0',
  `admin_menu_link` varchar(255) NOT NULL default '',
  `admin_menu_alt` varchar(255) NOT NULL default '',
  `option` varchar(50) NOT NULL default '',
  `ordering` int(11) NOT NULL default '0',
  `admin_menu_img` varchar(255) NOT NULL default '',
  `iscore` tinyint(4) NOT NULL default '0',
  `params` text NOT NULL,
  `enabled` tinyint(4) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `parent_option` (`parent`,`option`(32))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=75 ;

--
-- Dumping data for table `jos_components`
--

INSERT INTO `jos_components` (`id`, `name`, `link`, `menuid`, `parent`, `admin_menu_link`, `admin_menu_alt`, `option`, `ordering`, `admin_menu_img`, `iscore`, `params`, `enabled`) VALUES
(1, 'Banners', '', 0, 0, '', 'Banner Management', 'com_banners', 0, 'js/ThemeOffice/component.png', 0, 'track_impressions=0\ntrack_clicks=0\ntag_prefix=\n\n', 1),
(2, 'Banners', '', 0, 1, 'option=com_banners', 'Active Banners', 'com_banners', 1, 'js/ThemeOffice/edit.png', 0, '', 1),
(3, 'Clients', '', 0, 1, 'option=com_banners&c=client', 'Manage Clients', 'com_banners', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(4, 'Web Links', 'option=com_weblinks', 0, 0, '', 'Manage Weblinks', 'com_weblinks', 0, 'js/ThemeOffice/component.png', 0, 'show_comp_description=1\ncomp_description=\nshow_link_hits=1\nshow_link_description=1\nshow_other_cats=1\nshow_headings=1\nshow_page_title=1\nlink_target=0\nlink_icons=\n\n', 1),
(5, 'Links', '', 0, 4, 'option=com_weblinks', 'View existing weblinks', 'com_weblinks', 1, 'js/ThemeOffice/edit.png', 0, '', 1),
(6, 'Categories', '', 0, 4, 'option=com_categories&section=com_weblinks', 'Manage weblink categories', '', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(7, 'Contacts', 'option=com_contact', 0, 0, '', 'Edit contact details', 'com_contact', 0, 'js/ThemeOffice/component.png', 1, 'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=1\nshow_telephone=1\nshow_mobile=0\nshow_fax=0\nallow_vcard=0\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=1\ncustom_reply=0\n\n', 1),
(8, 'Contacts', '', 0, 7, 'option=com_contact', 'Edit contact details', 'com_contact', 0, 'js/ThemeOffice/edit.png', 1, '', 1),
(9, 'Categories', '', 0, 7, 'option=com_categories&section=com_contact_details', 'Manage contact categories', '', 2, 'js/ThemeOffice/categories.png', 1, 'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n', 1),
(10, 'Polls', 'option=com_poll', 0, 0, 'option=com_poll', 'Manage Polls', 'com_poll', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(11, 'News Feeds', 'option=com_newsfeeds', 0, 0, '', 'News Feeds Management', 'com_newsfeeds', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(12, 'Feeds', '', 0, 11, 'option=com_newsfeeds', 'Manage News Feeds', 'com_newsfeeds', 1, 'js/ThemeOffice/edit.png', 0, 'show_headings=1\nshow_name=1\nshow_articles=1\nshow_link=1\nshow_cat_description=1\nshow_cat_items=1\nshow_feed_image=1\nshow_feed_description=1\nshow_item_description=1\nfeed_word_count=0\n\n', 1),
(13, 'Categories', '', 0, 11, 'option=com_categories&section=com_newsfeeds', 'Manage Categories', '', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(14, 'User', 'option=com_user', 0, 0, '', '', 'com_user', 0, '', 1, '', 1),
(15, 'Search', 'option=com_search', 0, 0, 'option=com_search', 'Search Statistics', 'com_search', 0, 'js/ThemeOffice/component.png', 1, 'enabled=0\n\n', 1),
(16, 'Categories', '', 0, 1, 'option=com_categories&section=com_banner', 'Categories', '', 3, '', 1, '', 1),
(17, 'Wrapper', 'option=com_wrapper', 0, 0, '', 'Wrapper', 'com_wrapper', 0, '', 1, '', 1),
(18, 'Mail To', '', 0, 0, '', '', 'com_mailto', 0, '', 1, '', 1),
(19, 'Media Manager', '', 0, 0, 'option=com_media', 'Media Manager', 'com_media', 0, '', 1, 'upload_extensions=bmp,csv,doc,epg,gif,ico,jpg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,EPG,GIF,ICO,JPG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS\nupload_maxsize=10000000\nfile_path=images\nimage_path=images/stories\nrestrict_uploads=1\ncheck_mime=1\nimage_extensions=bmp,gif,jpg,png\nignore_extensions=\nupload_mime=image/jpeg,image/gif,image/png,image/bmp,application/x-shockwave-flash,application/msword,application/excel,application/pdf,application/powerpoint,text/plain,application/x-zip\nupload_mime_illegal=text/html\nenable_flash=1\n\n', 1),
(20, 'Articles', 'option=com_content', 0, 0, '', '', 'com_content', 0, '', 1, 'show_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=0\nshow_create_date=1\nshow_modify_date=0\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=0\nshow_hits=0\nfeed_summary=0\nfilter_tags=\nfilter_attritbutes=\n\n', 1),
(21, 'Configuration Manager', '', 0, 0, '', 'Configuration', 'com_config', 0, '', 1, '', 1),
(22, 'Installation Manager', '', 0, 0, '', 'Installer', 'com_installer', 0, '', 1, '', 1),
(23, 'Language Manager', '', 0, 0, '', 'Languages', 'com_languages', 0, '', 1, '', 1),
(24, 'Mass mail', '', 0, 0, '', 'Mass Mail', 'com_massmail', 0, '', 1, 'mailSubjectPrefix=\nmailBodySuffix=\n\n', 1),
(25, 'Menu Editor', '', 0, 0, '', 'Menu Editor', 'com_menus', 0, '', 1, '', 1),
(27, 'Messaging', '', 0, 0, '', 'Messages', 'com_messages', 0, '', 1, '', 1),
(28, 'Modules Manager', '', 0, 0, '', 'Modules', 'com_modules', 0, '', 1, '', 1),
(29, 'Plugin Manager', '', 0, 0, '', 'Plugins', 'com_plugins', 0, '', 1, '', 1),
(30, 'Template Manager', '', 0, 0, '', 'Templates', 'com_templates', 0, '', 1, '', 1),
(31, 'User Manager', '', 0, 0, '', 'Users', 'com_users', 0, '', 1, 'allowUserRegistration=1\nnew_usertype=Registered\nuseractivation=1\nfrontend_userparams=1\n\n', 1),
(32, 'Cache Manager', '', 0, 0, '', 'Cache', 'com_cache', 0, '', 1, '', 1),
(33, 'Control Panel', '', 0, 0, '', 'Control Panel', 'com_cpanel', 0, '', 1, '', 1),
(74, 'Conferences', '', 0, 59, 'option=com_directory&controller=conference&task=conferencelist', 'Edit conferences', 'com_directory', 3, '', 0, '', 1),
(73, 'Churches', '', 0, 59, 'option=com_directory&controller=churches&task=viewchurches', 'Edit the churches in the directory', 'com_directory', 3, '', 0, '', 1),
(52, 'Plugins', '', 0, 48, 'option=com_jce&type=plugin', 'Plugins', 'com_jce', 3, 'templates/khepri/images/menu/icon-16-plugin.png', 0, '', 1),
(49, 'Control Panel', '', 0, 48, 'option=com_jce', 'Control Panel', 'com_jce', 0, 'templates/khepri/images/menu/icon-16-cpanel.png', 0, '', 1),
(50, 'Configuration', '', 0, 48, 'option=com_jce&type=config', 'Configuration', 'com_jce', 1, 'templates/khepri/images/menu/icon-16-config.png', 0, '', 1),
(51, 'Groups', '', 0, 48, 'option=com_jce&type=group', 'Groups', 'com_jce', 2, 'templates/khepri/images/menu/icon-16-user.png', 0, '', 1),
(48, 'JCE Administration', 'option=com_jce', 0, 0, 'option=com_jce', 'JCE Administration', 'com_jce', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(53, 'Install', '', 0, 48, 'option=com_jce&type=install', 'Install', 'com_jce', 4, 'templates/khepri/images/menu/icon-16-install.png', 0, '', 1),
(58, 'Sections', '', 0, 7, 'option=com_contact&task=showsections', 'Manage contact sections', 'com_contact', 3, 'js/ThemeOffice/edit.png', 1, '', 1),
(55, 'Xmap', 'option=com_xmap', 0, 0, 'option=com_xmap', 'Xmap', 'com_xmap', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(59, 'Directory', 'option=com_directory', 0, 0, 'option=com_directory', 'Edit the directory', 'com_directory', 0, 'js/ThemeOffice/component.png', 0, 'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=0\nshow_email=1\nshow_telephone=1\nshow_mobile=0\nshow_fax=0\nallow_vcard=0\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=1\ncustom_reply=0\n\n', 1),
(61, 'Contacts', '', 0, 59, 'option=com_directory', 'Edit directory contacts', 'com_directory', 0, '', 0, '', 1),
(62, 'Categories', '', 0, 59, 'option=com_directory_categories&section=com_directory', 'Edit the directory categories', 'com_directory_categories', 2, '', 0, '', 1),
(63, 'Sections', '', 0, 59, 'option=com_directory&task=showsections', 'Edit the directory sections', 'com_directory', 1, '', 0, '', 1),
(64, 'Phoca Gallery', 'option=com_phocagallery', 0, 0, 'option=com_phocagallery', 'Phoca Gallery', 'com_phocagallery', 0, 'components/com_phocagallery/assets/images/icon-16-menu.png', 0, '', 1),
(65, 'Control Panel', '', 0, 64, 'option=com_phocagallery', 'Control Panel', 'com_phocagallery', 0, 'components/com_phocagallery/assets/images/icon-16-control-panel.png', 0, '', 1),
(66, 'Images', '', 0, 64, 'option=com_phocagallery&view=phocagallerys', 'Images', 'com_phocagallery', 1, 'components/com_phocagallery/assets/images/icon-16-menu-gal.png', 0, '', 1),
(67, 'Categories', '', 0, 64, 'option=com_phocagallery&view=phocagallerycs', 'Categories', 'com_phocagallery', 2, 'components/com_phocagallery/assets/images/icon-16-menu-cat.png', 0, '', 1),
(68, 'Themes', '', 0, 64, 'option=com_phocagallery&view=phocagalleryt', 'Themes', 'com_phocagallery', 3, 'components/com_phocagallery/assets/images/icon-16-menu-theme.png', 0, '', 1),
(69, 'Rating', '', 0, 64, 'option=com_phocagallery&view=phocagalleryra', 'Rating', 'com_phocagallery', 4, 'components/com_phocagallery/assets/images/icon-16-menu-vote.png', 0, '', 1),
(70, 'Comments', '', 0, 64, 'option=com_phocagallery&view=phocagallerycos', 'Comments', 'com_phocagallery', 5, 'components/com_phocagallery/assets/images/icon-16-menu-comment.png', 0, '', 1),
(71, 'Info', '', 0, 64, 'option=com_phocagallery&view=phocagalleryin', 'Info', 'com_phocagallery', 6, 'components/com_phocagallery/assets/images/icon-16-menu-info.png', 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_conferences`
--

DROP TABLE IF EXISTS `jos_conferences`;
CREATE TABLE IF NOT EXISTS `jos_conferences` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `category_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `jos_conferences`
--

INSERT INTO `jos_conferences` (`id`, `name`, `category_id`) VALUES
(19, 'Manipur Section', 0),
(5, 'North Karnataka Section', 0),
(9, 'Chennai Metro Section', 0),
(8, 'North Tamil Conference', 0),
(18, 'Mizo Conference', 0),
(17, 'East Khasi Hills', 0),
(16, 'Jaintia Hills', 0),
(20, 'Garo Section', 0),
(21, 'Assam Region', 100),
(22, 'Nagaland Region', 100),
(23, 'Kolar Chinthamani Region', 98),
(24, 'South Karnataka Section', 98),
(25, 'West Karnataka Section', 98),
(26, 'Bangalore Metro Section', 98),
(27, 'Bellary Region', 98),
(28, 'Theni - Periyakulam Region', 98),
(29, 'Villupuram - Thindivanam Region', 98);

-- --------------------------------------------------------

--
-- Table structure for table `jos_contact_details`
--

DROP TABLE IF EXISTS `jos_contact_details`;
CREATE TABLE IF NOT EXISTS `jos_contact_details` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `con_position` varchar(255) default NULL,
  `address` text,
  `suburb` varchar(100) default NULL,
  `state` varchar(100) default NULL,
  `country` varchar(100) default NULL,
  `postcode` varchar(100) default NULL,
  `telephone` varchar(255) default NULL,
  `fax` varchar(255) default NULL,
  `misc` mediumtext,
  `image` varchar(255) default NULL,
  `imagepos` varchar(20) default NULL,
  `email_to` varchar(255) default NULL,
  `default_con` tinyint(1) unsigned NOT NULL default '0',
  `published` tinyint(1) unsigned NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL default '0',
  `catid` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `mobile` varchar(255) NOT NULL default '',
  `webpage` varchar(255) NOT NULL default '',
  `first_name` varchar(128) NOT NULL default '',
  `last_name` varchar(128) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=126 ;

--
-- Dumping data for table `jos_contact_details`
--

INSERT INTO `jos_contact_details` (`id`, `name`, `alias`, `con_position`, `address`, `suburb`, `state`, `country`, `postcode`, `telephone`, `fax`, `misc`, `image`, `imagepos`, `email_to`, `default_con`, `published`, `checked_out`, `checked_out_time`, `ordering`, `params`, `user_id`, `catid`, `access`, `mobile`, `webpage`, `first_name`, `last_name`) VALUES
(2, 'Gordon Christo', 'dr-gordon-christo', 'Director', '', '', '', '', '', '91-(0)4344-263835', '', '', '', NULL, 'gechristo@sud-adventist.org', 0, 1, 62, '2008-12-01 08:59:14', 2, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=0\nshow_suburb=0\nshow_state=0\nshow_postcode=0\nshow_country=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=0\nshow_webpage=0\nshow_misc=0\nshow_image=0\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 4, 0, '91(0)944-3375-251', '', 'Gordon', 'Christo'),
(3, 'G Nageshwara  Rao', 'dr-gollakoti-nageshwar-rao-phd', 'Director', '', '', '', '', '', '91-(0)4344-263842', '', '', '', NULL, 'gnageshwarrao@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=0\nshow_suburb=0\nshow_state=0\nshow_postcode=0\nshow_country=0\nshow_telephone=1\nshow_mobile=0\nshow_fax=0\nshow_webpage=0\nshow_misc=0\nshow_image=0\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 5, 0, '91-(0)944-2645-345', '', 'G Nageshwara', 'Rao'),
(6, 'R John', 'r-john', NULL, '', '', '', '', '', '91-(0)4344-263827', '', '', '', NULL, 'rjohn@sud-adventist.org', 0, 1, 62, '2008-12-04 06:40:45', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 7, 0, '91-(0)944-3375-234', '', 'R', 'John'),
(15, 'Le Roy  Samuel', 'le-roy-samuel', NULL, '', '', '', '', '', '91-(0)944-2602-170', '', '', '', NULL, 'leroysamuel@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 2, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 9, 0, '', '', 'Le Roy', 'Samuel'),
(7, 'G S Robert Clive', 'g-s-robert-clive', NULL, '', '', '', '', '', '91-(0)4344-263811', '', '', '', NULL, 'gsrobertclive@sud-adventist.org', 0, 1, 62, '2009-02-13 05:25:05', 2, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 7, 0, '', '', 'G S Robert', 'Clive'),
(8, 'M C John', 'm-c-john', NULL, '', '', '', '', '', '91-(0)4344-263802', '', '', '', NULL, 'mcjohn@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 3, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 7, 0, '91-(0)944-2621-345', '', 'M C', 'John'),
(9, 'R L Robinson', 'r-l-robinson', NULL, '', '', '', '', '', '91-(0)4344-263820', '', '', '', NULL, 'robertr@sud-adventist.org', 0, 1, 62, '2009-02-13 06:44:27', 4, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 7, 0, '91-(0)944-3375-238', '', 'R L', 'Robinson'),
(10, 'Candy Zook', 'candy-zook', NULL, '', '', '', '', '', '91-(0)4344-263853', '', '', '', NULL, 'cdzook52@yahoo.com', 0, 1, 0, '0000-00-00 00:00:00', 5, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 7, 0, '91-(0)944-2631-345', '', 'Candy', 'Zook'),
(11, 'Cyril Monthero', 'cyril-monthero', NULL, '', '', '', '', '', '91(0)944-8904-983', '', '', '', NULL, 'cyrilmonthero@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 8, 0, '', '', 'Cyril', 'Monthero'),
(12, 'G R Mohan Roy', 'g-r-mohan-roy', NULL, '', '', '', '', '', '', '', '', '', NULL, 'mohanroy@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 6, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 7, 0, '91-(0)4344-263819', '', 'G R Mohan', 'Roy'),
(13, 'Shamgar Prasada Rao', 'shamgar-prasada-rao', NULL, '', '', '', '', '', '91-(0)4344-263828', '', '', '', NULL, 'shamgarprao@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 2, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 8, 0, '91-(0)995-240-4943', '', 'Shamgar Prasada', 'Rao'),
(14, 'P E Selvin  Moorthy', 'p-e-selvin-moorthy', NULL, '', '', '', '', '', '91-(0)4344-263801', '', '', '', NULL, 'selvindmoorthy@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 9, 0, '91-(0)944-3375-229', '', 'P E Selvin', 'Moorthy'),
(16, 'Jothi J Anbiah', 'jothi-j-anbiah', NULL, '', '', '', '', '', '91-(0)4344-263891', '', '', '', NULL, 'jothianbiah@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 3, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 9, 0, '91-(0)944-3375-240', '', 'Jothi J', 'Anbiah'),
(17, 'Brenda Robinson', 'brenda-robinson', NULL, '', '', '', '', '', '91-(0)4344-263822', '', '', '', NULL, 'brendar@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 4, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 9, 0, '91-(0)944-3375-239', '', 'Brenda', 'Robinson'),
(18, 'V P  Singh', 'v-p-singh', NULL, '', '', '', '', '', '91-(0)4344-263875', '', '', '', NULL, 'vpsingh@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 5, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 9, 0, '91-(0)944-2641-345', '', 'V P', 'Singh'),
(19, 'Paulraj Isaiah', 'paulraj-isaiah', NULL, '', '', '', '', '', '91-(0)4344-263848', '', '', '', NULL, 'paulrajisaiah@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 11, 0, '91-(0)944-3375-260', '', 'Paulraj', 'Isaiah'),
(20, 'Ramani Kurian', 'ramani-kurian', NULL, '', '', '', '', '', '91-(0)4344-263846', '', '', '', NULL, 'ramanikurian@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 2, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 5, 0, '', '', 'Ramani', 'Kurian'),
(21, 'T P Kurian', 't-p-kurian', NULL, '', '', '', '', '', '91-(0)4344-263831', '', '', '', NULL, 'tpkurian@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 14, 0, '91-(0)944-2647-234', '', 'T P', 'Kurian'),
(22, 'Lionel F Lyngdoh', 'lionel-f-lyngdoh', NULL, '', '', '', '', '', '91-(0)4344-263862', '', '', '', NULL, 'lyngdoh@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 16, 0, '91-(0)944-3375-228', '', 'Lionel F', 'Lyngdoh'),
(23, 'Ramesh Y Jadhav', 'ramesh-y-jadhav', NULL, '', '', '', '', '', '91-(0)4344-263865', '', '', '', NULL, 'jadhavry@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 18, 0, '91-(0)944-3375-236', '', 'Ramesh Y', 'Jadhav'),
(24, 'M D Joseph', 'm-d-joseph', NULL, '', '', '', '', '', '91-(0)4344-263857', '', '', '', NULL, 'mdjoseph@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 19, 0, '91-(0)948-666-5831', '', 'M D', 'Joseph'),
(25, 'Jayawant  Peter', 'jayawant-peter', NULL, '', '', '', '', '', '91-(0)4344-263879', '', '', '', NULL, 'jayawanthpeter@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 7, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 42, 0, '91-(0)944-3375-225', '', 'Jayawant', 'Peter'),
(26, 'Anita Livingston', 'anita-livingston', NULL, '', '', '', '', '', '91-(0)4344-263829', '', '', '', NULL, 'anital@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 8, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 42, 0, '91-(0)995-2639-017', '', 'Anita', 'Livingston'),
(27, 'M Wilson', 'm-wilson', NULL, '', '', '', '', '', '91-(0)4344-263845', '', '', '', NULL, 'mwilson@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 22, 0, '91-(0)944-2644-234', '', 'M', 'Wilson'),
(28, 'A J  Tito', 'a-j-tito', NULL, '', '', '', '', '', '91-(0)4344-263861', '', '', '', NULL, 'tito@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 23, 0, '91-(0)944-3377-439', '', 'A J', 'Tito'),
(31, 'William  George', 'william-george', NULL, '', '', '', '', '', '91-(0)944-3375-233', '', '', '', NULL, 'williamgeorge@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 28, 0, '', '', 'William', 'George'),
(30, 'Ganaraj W Kore', 'ganaraj-w-kore', NULL, '', '', '', '', '', '91-(0)4344-263856', '', '', '', NULL, 'gnanarajkore@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 25, 0, '91-(0)944-3375-241', '', 'Ganaraj W', 'Kore'),
(32, 'Ch Victor  Sam', 'ch-victor-sam', NULL, '', '', '', '', '', '91-(0)944-3375-246', '', '', '', NULL, 'victorsam@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 2, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 28, 0, '', '', 'Ch Victor', 'Sam'),
(46, 'Edison Samraj', 'edison-samraj', NULL, '', '', '', '', '', '91-(0)985-0426-704', '', '', '', NULL, 'e_samraj@vsnl.net', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 41, 0, '', '', 'Edison', 'Samraj'),
(34, 'Hepzibah Kore', 'hepzibah-kore', NULL, '', '', '', '', '', '91-(0)4344-263832', '', '', '', NULL, 'hepzibahkore@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 30, 0, '91-(0)944-3375-241', '', 'Hepzibah', 'Kore'),
(35, 'Michael Prasada  Rao', 'michael-prasada-rao', NULL, '', '', '', '', '', '91-(0)4344-263815', '', '', '', NULL, 'michaelprao@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 31, 0, '91-(0)944-3377-592', '', 'Michael Prasada', 'Rao'),
(36, 'Jayaraj  Thangavelu', 'jayaraj-thangavelu', NULL, '', '', '', '', '', '91-(0)4344-263812', '', '', '', NULL, 'jayarajt@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 2, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 31, 0, '91-(0)944-3375-231', '', 'Jayaraj', 'Thangavelu'),
(37, 'Mathew  Devasahayam', 'mathew-devasahayam', NULL, '', '', '', '', '', '91(0)944-3375-232', '', '', '', NULL, 'mathewdevasahayam@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 3, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 31, 0, '', '', 'Mathew', 'Devasahayam'),
(38, 'Rosenita Christo', 'rosenita-christo', NULL, '', '', '', '', '', '91-(0)4344-263854', '', '', '', NULL, 'rosechristo@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 32, 0, '91-(0)944-3375-253', '', 'Rosenita', 'Christo'),
(39, 'Margaret  Tito', 'margaret-tito', NULL, '', '', '', '', '', '', '', '', '', NULL, 'margaret@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 24, 0, '', '', 'Margaret', 'Tito'),
(40, 'John Masefield', 'john-masefield', NULL, '', '', '', '', '', '91-(0)4344-263805', '', '', '', NULL, 'johnmasefield@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 36, 0, '91-(0)944-3375-227', '', 'John', 'Masefield'),
(41, 'John  Mathew', 'john-mathew', NULL, '', '', '', '', '', '91-(0)944-3375-243', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 2, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 36, 0, '', '', 'John', 'Mathew'),
(42, 'Flora John', 'flora-john', NULL, '', '', '', '', '', '91-(0)4344-263860', '', '', '', NULL, 'childcare@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 15, 0, '', '', 'Flora', 'John'),
(43, 'Rachel John', 'rachel-john', NULL, '', '', '', '', '', '91-(0)4344-263880', '', '', '', NULL, 'acioffice@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 2, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 15, 0, '', '', 'Rachel', 'John'),
(44, 'Edwin  Charles', 'edwin-charles', NULL, '', '', '', '', '', '91-(0)94-225-036-02', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 39, 0, '', '', 'Edwin', 'Charles'),
(45, 'Edwin B Matthews', 'edwin-b-matthews', NULL, '', '', '', '', '', '91-(0)942-2305-808/91(020)242-650-70', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 40, 0, '', '', 'Edwin B', 'Matthews'),
(47, 'Ch John', 'ch-john', NULL, '', '', '', '', '', '91-(0)984-8129-551/232-018-32', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 45, 0, '', '', 'Ch', 'John'),
(48, 'M D Edward', 'm-d-edward', NULL, '', '', '', '', '', '91-(0)984-8751-781', '', '', '', NULL, '', 0, 1, 62, '2008-11-26 09:27:39', 2, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 45, 0, '', '', 'M D', 'Edward'),
(49, 'D Alfred  Raju', 'd-alfred-raju', NULL, '', '', '', '', '', '91-(0)984-811-0006', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 3, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 45, 0, '', '', 'D Alfred', 'Raju'),
(50, 'Pilli Edward Prasad', 'pilli-edward-prasad', NULL, '', '', '', '', '', '', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 4, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 45, 0, '', '', 'Pilli Edward', 'Prasad'),
(51, 'Davy Sudhakar', 'davy-sudhakar', NULL, '', '', '', '', '', '91-(0)988-5499-825', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 5, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 45, 0, '', '', 'Davy', 'Sudhakar'),
(107, 'Sosamma Varghese', 'sosamma-varghese', NULL, '', '', '', '', '', '', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 4, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 47, 0, '', '', 'Sosamma', 'Varghese'),
(53, 'Ch Prabhakar  Rao', 'ch-prabhakar-rao', NULL, '', '', '', '', '', '', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 7, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 45, 0, '', '', 'Ch Prabhakar', 'Rao'),
(54, 'Ch Samuel Paul', 'ch-samuel-paul', NULL, '', '', '', '', '', '91-(0)944-0169-053', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 8, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 45, 0, '', '', 'Ch Samuel', 'Paul'),
(55, 'T Robinson Bob', 't-robinson-bob', NULL, '', '', '', '', '', '91-(0)986-6161-356', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 9, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 45, 0, '', '', 'T Robinson', 'Bob'),
(56, 'Ch Vinodhini  John', 'ch-vinodhini-john', NULL, '', '', '', '', '', '', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 10, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 45, 0, '', '', 'Ch Vinodhini', 'John'),
(57, 'Madhuramani Wilbert', 'madhuramani-wilbert', NULL, '', '', '', '', '', '', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 11, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 45, 0, '', '', 'Madhuramani', 'Wilbert'),
(58, 'K R Jones', 'k-r-jones', NULL, '', '', '', '', '', '91-(0)998-926-5077', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 12, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 45, 0, '', '', 'K R', 'Jones'),
(59, 'J G Paulson', 'j-g-paulson', NULL, '', '', '', '', '', '91-(0)984-814-4278', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 13, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 45, 0, '', '', 'J G', 'Paulson'),
(60, 'L C Colney', 'l-c-colney', NULL, '', '', '', '', '', '91-(0)943-6117-829/ 252-1337', '', '', '', NULL, 'neiupre@sancharnet.in', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 51, 0, '', '', 'L C', 'Colney'),
(61, 'C C Dkhar', 'c-c-dkhar', NULL, '', '', '', '', '', '91-(0)943-6105-626/252-1975', '', '', '', NULL, 'neiusecretary@yahoo.com', 0, 1, 0, '0000-00-00 00:00:00', 2, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 51, 0, '', '', 'C C', 'Dkhar'),
(62, 'S K Archete', 's-k-archete', NULL, '', '', '', '', '', '91-(0)943-6116-752/ 252-0547', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 3, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 51, 0, '', '', 'S K', 'Archete'),
(63, 'Mabel V Dkhar', 'mabel-v-dkhar', NULL, '', '', '', '', '', '91-(0)986-3023-109', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 4, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 51, 0, '', '', 'Mabel V', 'Dkhar'),
(64, 'Barnabas Zimik', 'barnabas-zimik', NULL, '', '', '', '', '', '91-(0)986-311-517', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 5, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 51, 0, '', '', 'Barnabas', 'Zimik'),
(65, 'Zohruaia Renthlei', 'zohruaia-renthlei', NULL, '', '', '', '', '', '91-(0)943-6111-188/250-1405', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 6, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 51, 0, '', '', 'Zohruaia', 'Renthlei'),
(66, 'Ramsangpuii Colney', 'ramsangpuii-colney', NULL, '', '', '', '', '', '91-(0)943-630-4193/252-1337', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 7, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 51, 0, '', '', 'Ramsangpuii', 'Colney'),
(67, 'R Rabha', 'r-rabha', NULL, '', '', '', '', '', '91-(0)986-214-4744', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 8, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 51, 0, '', '', 'R', 'Rabha'),
(105, 'P H Paulson', 'p-h-paulson', NULL, '', '', '', '', '', '91-(0)989-5691-844', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 2, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 47, 0, '', '', 'P H', 'Paulson'),
(69, 'Hidayat Masih', 'hidayat-masih', NULL, '', '', '', '', '', '91-(0)981-1382-966', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 50, 0, '', '', 'Hidayat', 'Masih'),
(70, 'Ezras Lakra', 'ezras-lakra', NULL, '', '', '', '', '', '91-(0)981-1387-344', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 2, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 50, 0, '', '', 'Ezras', 'Lakra'),
(71, 'Alamgir Khan', 'alamgir-khan', NULL, '', '', '', '', '', '91-(0)981-1313-558', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 3, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 50, 0, '', '', 'Alamgir', 'Khan'),
(72, 'Veena Gayen', 'veena-gayen', NULL, '', '', '', '', '', '', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 4, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 50, 0, '', '', 'Veena', 'Gayen'),
(73, 'S B Bairagi', 's-b-bairagi', NULL, '', '', '', '', '', '', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 5, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 50, 0, '', '', 'S B', 'Bairagi'),
(74, 'Benedict Biswas', 'benedict-biswas', NULL, '', '', '', '', '', '', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 6, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 50, 0, '', '', 'Benedict', 'Biswas'),
(75, 'Premila Masih', 'premila-masih', NULL, '', '', '', '', '', '', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 7, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 50, 0, '', '', 'Premila', 'Masih'),
(104, 'S Stanley', 's-stanley', NULL, '', '', '', '', '', '91-(0)944-6141-822/244-6523', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 47, 0, '', '', 'S', 'Stanley'),
(77, 'S R Bhatti', 's-r-bhatti', NULL, '', '', '', '', '', '', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 9, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 50, 0, '', '', 'S R', 'Bhatti'),
(78, 'Daniel Padmaraj', 'daniel-padmaraj', NULL, '', '', '', '', '', '91-(0)984-5003-077/253-650-92', '', '', '', NULL, 'sciu_president@yahoo.co.in', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 49, 0, '', '', 'Daniel', 'Padmaraj'),
(79, 'D Jeyadev', 'd-jeyadev', NULL, '', '', '', '', '', '91-(0)998-6459-183/254-912-52', '', '', '', NULL, 'sciu_execsecretary@yahoo.co.in', 0, 1, 0, '0000-00-00 00:00:00', 2, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 49, 0, '', '', 'D', 'Jeyadev'),
(80, 'Edwin Stanley', 'edwin-stanley', NULL, '', '', '', '', '', '91-(0)944-8356-527/253-027-21/256-527-431', '', '', '', NULL, 'sciu_treasurer@yahoo.co.in', 0, 1, 0, '0000-00-00 00:00:00', 3, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 49, 0, '', '', 'Edwin', 'Stanley'),
(81, 'Johnson Abraham', 'johnson-abraham', NULL, '', '', '', '', '', '91-(0)984-4068-766', '', '', '', NULL, 'sciu_assoctre@vsnl.net', 0, 1, 0, '0000-00-00 00:00:00', 4, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 49, 0, '', '', 'Johnson', 'Abraham'),
(82, 'Ranjan D', 'ranjan-d', NULL, '', '', '', '', '', '91-(0)944-8055-890', '', '', '', NULL, 'sciu_asstreasurer@yahoo.co.in', 0, 1, 0, '0000-00-00 00:00:00', 5, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 49, 0, '', '', 'Ranjan', 'D');
INSERT INTO `jos_contact_details` (`id`, `name`, `alias`, `con_position`, `address`, `suburb`, `state`, `country`, `postcode`, `telephone`, `fax`, `misc`, `image`, `imagepos`, `email_to`, `default_con`, `published`, `checked_out`, `checked_out_time`, `ordering`, `params`, `user_id`, `catid`, `access`, `mobile`, `webpage`, `first_name`, `last_name`) VALUES
(83, 'Ravindra Shankar', 'ravindra-shankar', NULL, '', '', '', '', '', '91-(0)944-8355-255', '', '', '', NULL, 'sciu_ravindrashankar@yahoo.co.in', 0, 1, 0, '0000-00-00 00:00:00', 6, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 49, 0, '', '', 'Ravindra', 'Shankar'),
(84, 'Swamidas David', 'swamidas-david', NULL, '', '', '', '', '', '91-(0)990-0161-692', '', '', '', NULL, 'sciu_swamidas@yahoo.co.in', 0, 1, 0, '0000-00-00 00:00:00', 7, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 49, 0, '', '', 'Swamidas', 'David'),
(85, 'Robert Donald', 'robert-donald', NULL, '', '', '', '', '', '(080)255-415-22; 91(0)944-9764-408', '', '', '', NULL, 'sciu_robertdonald@yahoo.co.in', 0, 1, 0, '0000-00-00 00:00:00', 8, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 49, 0, '', '', 'Robert', 'Donald'),
(87, 'Philip Shekar', 'philip-shekar', NULL, '', '', '', '', '', '91(0)988-6990-647', '', '', '', NULL, 'sciu_philipshekar@yahoo.co.in', 0, 1, 0, '0000-00-00 00:00:00', 9, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 49, 0, '', '', 'Philip', 'Shekar'),
(88, 'D Jayadev', 'd-jayadev', NULL, '', '', '', '', '', '91(0)998-6459-183/254-912-52', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 10, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 49, 0, '', '', 'D', 'Jayadev'),
(89, 'S Shantha Kumar', 's-shantha-kumar', NULL, '', '', '', '', '', '91(0)988-0697-691', '', '', '', NULL, 'sciu_shanthapdd@yahoo.co.in', 0, 1, 0, '0000-00-00 00:00:00', 11, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 49, 0, '', '', 'S Shantha', 'Kumar'),
(90, 'Eileen Padmaraj', 'eileen-padmaraj', NULL, '', '', '', '', '', '91(080)253-650-92; 0988-0545-279', '', '', '', NULL, 'sciu_eileen08@yahoo.co.in', 0, 1, 0, '0000-00-00 00:00:00', 12, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 49, 0, '', '', 'Eileen', 'Padmaraj'),
(91, 'S Sundaram', 's-sundaram', NULL, '', '', '', '', '', '91-(0) 944-4059-532/044-223-996-51/223-919-09', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 48, 0, '', '', 'S', 'Sundaram'),
(92, 'Daniel Devadhas', 'daniel-devadhas', NULL, '', '', '', '', '', '91-(0)944-4044-302/044-223-996-52/223-943-02', '', '', '', NULL, 'pr-daniel@sify.com', 0, 1, 0, '0000-00-00 00:00:00', 2, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 48, 0, '', '', 'Daniel', 'Devadhas'),
(93, 'Enoch Manickam', 'enoch-manickam', NULL, '', '', '', '', '', '91-(0)944-4064-433/044-223-996-53/223-82961', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 3, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 48, 0, '', '', 'Enoch', 'Manickam'),
(94, 'S Antony Das', 's-antony-das', NULL, '', '', '', '', '', '91-(0)984-2115-54', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 4, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 48, 0, '', '', 'S Antony', 'Das'),
(95, 'Manthri Moses', 'manthri-moses', NULL, '', '', '', '', '', '91-(0)944-4212-870/044-224-115-13', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 5, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 48, 0, '', '', 'Manthri', 'Moses'),
(96, 'Premila Jayachandran', 'premila-jayachandran', NULL, '', '', '', '', '', '91-(0)994-4317-835/0413-222-3248', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 6, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 48, 0, '', '', 'Premila', 'Jayachandran'),
(97, 'R Rajamani Muthu', 'r-rajamani-muthu', NULL, '', '', '', '', '', '044-994-0253-761', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 7, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 48, 0, '', '', 'R Rajamani', 'Muthu'),
(98, ' Anothindhas', '-anothindhas', NULL, '', '', '', '', '', '', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 8, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 48, 0, '', '', '', 'Anothindhas'),
(99, 'V M Arokiasamy', 'v-m-arokiasamy', NULL, '', '', '', '', '', '', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 9, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 48, 0, '', '', 'V M', 'Arokiasamy'),
(100, 'Jones Rajarathinam', 'jones-rajarathinam', NULL, '', '', '', '', '', '91-(0)944-3194-573', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 10, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 48, 0, '', '', 'Jones', 'Rajarathinam'),
(106, 'P T Johnkutty', 'p-t-johnkutty', NULL, '', '', '', '', '', '91-(0)944-7836-637', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 3, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 47, 0, '', '', 'P T', 'Johnkutty'),
(102, 'M Anbalagan', 'm-anbalagan', NULL, '', '', '', '', '', '91-(0)938-260-7567', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 12, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 48, 0, '', '', 'M', 'Anbalagan'),
(103, 'D Lingan', 'd-lingan', NULL, '', '', '', '', '', '91(0)944-4405-850/262-118-10', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 13, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 48, 0, '', '', 'D', 'Lingan'),
(108, 'K J Varghese', 'k-j-varghese', NULL, '', '', '', '', '', '', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 5, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 47, 0, '', '', 'K J', 'Varghese'),
(109, 'Mary Thomas', 'mary-thomas', NULL, '', '', '', '', '', '', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 6, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 47, 0, '', '', 'Mary', 'Thomas'),
(110, 'V K Baby', 'v-k-baby', NULL, '', '', '', '', '', '91-(0)989-5164-020', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 7, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 47, 0, '', '', 'V K', 'Baby'),
(111, 'K N Varghese', 'k-n-varghese', NULL, '', '', '', '', '', '91-(0)989-5434-303', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 8, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 47, 0, '', '', 'K N', 'Varghese'),
(112, 'Philip S Jacob', 'philip-s-jacob', NULL, '', '', '', '', '', '91-(0487)-2254-294', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 9, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 47, 0, '', '', 'Philip S', 'Jacob'),
(113, 'Raju Abraham', 'raju-abraham', NULL, '', '', '', '', '', '91-(0)944-7068-641', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 10, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 47, 0, '', '', 'Raju', 'Abraham'),
(114, 'Gibeon E Sharon', 'gibeon-e-sharon', NULL, '', '', '', '', '', '91-(0)989-0112-637', '', '', '', NULL, 'prewiu@vsnl.net', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 46, 0, '', '', 'Gibeon E', 'Sharon'),
(115, 'Pratap Gaikwad', 'pratap-gaikwad', NULL, '', '', '', '', '', '91-(0)989-0116-902', '', '', '', NULL, 'secwiu@vsnl.net', 0, 1, 0, '0000-00-00 00:00:00', 2, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 46, 0, '', '', 'Pratap', 'Gaikwad'),
(116, 'Sukendu K Sircar', 'sukendu-k-sircar', NULL, '', '', '', '', '', '91-(0)989-0183-637', '', '', '', NULL, 'trewiu@vsnl.net', 0, 1, 0, '0000-00-00 00:00:00', 3, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 46, 0, '', '', 'Sukendu K', 'Sircar'),
(117, 'Rakesh Chavan', 'rakesh-chavan', NULL, '', '', '', '', '', '91-(0)982-2815-118', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 4, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 46, 0, '', '', 'Rakesh', 'Chavan'),
(119, 'Chandrakanth R Shinge', 'chandrakanth-r-shinge', NULL, '', '', '', '', '', '91-(0)989-0113-478', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 5, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 46, 0, '', '', 'Chandrakanth R', 'Shinge'),
(120, 'Prakash Sharma', 'prakash-sharma', NULL, '', '', '', '', '', '91-(0)989-0116-710', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 6, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 46, 0, '', '', 'Prakash', 'Sharma'),
(121, 'Ashirwad Pandey', 'ashirwad-pandey', NULL, '', '', '', '', '', '91-(0)986-0342-605', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 7, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 46, 0, '', '', 'Ashirwad', 'Pandey'),
(122, 'Zarin G Sharon', 'zarin-g-sharon', NULL, '', '', '', '', '', '', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 8, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 46, 0, '', '', 'Zarin G', 'Sharon'),
(123, 'Rajan Kedas', 'rajan-kedas', NULL, '', '', '', '', '', '91-(0)982-2271-214', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 9, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 46, 0, '', '', 'Rajan', 'Kedas'),
(124, 'Steven Oxley', 'steven-oxley', NULL, '', '', '', '', '', '', '', '', '', NULL, 'xonev@hotmail.com', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 62, 52, 0, '', '', 'Steven', 'Oxley'),
(125, 'Kantharaj George', 'kantharaj-george', NULL, '', '', '', '', '', '91-(0)4344-263823', '', '', '', NULL, 'kantharajgeorge@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 55, 0, '91-(0)944-2562-800', '', 'Kantharaj', 'George');

-- --------------------------------------------------------

--
-- Table structure for table `jos_contact_positions`
--

DROP TABLE IF EXISTS `jos_contact_positions`;
CREATE TABLE IF NOT EXISTS `jos_contact_positions` (
  `id` int(11) NOT NULL auto_increment,
  `contact_id` int(11) NOT NULL default '0',
  `department_id` int(11) NOT NULL default '0',
  `position` varchar(255) NOT NULL default '',
  `ordering` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=153 ;

--
-- Dumping data for table `jos_contact_positions`
--

INSERT INTO `jos_contact_positions` (`id`, `contact_id`, `department_id`, `position`, `ordering`) VALUES
(1, 1, 4, 'Volunteer', NULL),
(2, 2, 4, 'Director', NULL),
(3, 3, 5, 'Director', NULL),
(8, 6, 7, 'President', 1),
(5, 0, 4, 'Editor', NULL),
(9, 7, 7, 'Treasurer', 9),
(10, 8, 7, 'General Vice President', 2),
(11, 2, 7, 'General Vice President', 3),
(12, 9, 7, 'Administrative Assistant to the President for Development', 5),
(13, 10, 7, 'Administrative Assistant to the President for Development', 6),
(14, 11, 8, 'Associate Secretary', NULL),
(15, 12, 7, 'Administrative Assistant to the President', 4),
(16, 13, 8, 'Associate Secretary', NULL),
(17, 14, 9, 'Under-treasurer', NULL),
(18, 10, 15, 'Director', NULL),
(19, 15, 9, 'Associate Treasurer', NULL),
(20, 16, 9, 'Associate Treasurer', NULL),
(21, 17, 9, 'Associate Treasurer', NULL),
(22, 18, 9, 'Associate Treasurer', NULL),
(23, 8, 10, 'Director', NULL),
(24, 19, 11, 'Director', NULL),
(25, 19, 12, 'Director', NULL),
(26, 2, 13, 'Director', NULL),
(27, 20, 5, 'Assistant', NULL),
(28, 21, 14, 'Director', NULL),
(29, 21, 15, 'Field Representative', NULL),
(30, 22, 16, 'Director', NULL),
(31, 22, 17, 'Director', NULL),
(32, 23, 18, 'Director', NULL),
(33, 24, 19, 'Director', NULL),
(34, 24, 20, 'Director', NULL),
(35, 25, 42, 'Director', NULL),
(36, 26, 42, 'Director', NULL),
(37, 27, 22, 'Director', NULL),
(38, 28, 23, 'Director', NULL),
(39, 29, 24, 'Director', NULL),
(40, 30, 25, 'Director', NULL),
(41, 30, 26, 'Director', NULL),
(42, 30, 27, 'Director', NULL),
(43, 16, 24, 'Director', NULL),
(44, 31, 28, 'Director', NULL),
(45, 32, 28, 'Director', NULL),
(46, 33, 29, 'Director', NULL),
(47, 34, 30, 'Director', NULL),
(48, 34, 22, 'Coordinator', NULL),
(49, 35, 31, 'Director', NULL),
(50, 36, 31, 'Associate Director', NULL),
(51, 37, 31, 'Assistant Director', NULL),
(52, 38, 32, 'Editor', NULL),
(53, 12, 33, 'Director', NULL),
(54, 19, 34, 'Director', NULL),
(55, 39, 24, 'Assistant Director', NULL),
(56, 2, 35, 'Coordinator', NULL),
(57, 40, 36, 'Engineer', NULL),
(58, 41, 36, 'Assistant Engineer', NULL),
(59, 15, 37, 'Director', NULL),
(60, 42, 15, 'Correspondent', NULL),
(61, 43, 15, 'Administrative Assistant to Candy Zook', NULL),
(62, 38, 38, 'Coordinator', NULL),
(63, 44, 39, 'Director', NULL),
(64, 45, 40, 'General Manager', NULL),
(65, 13, 29, 'Director', NULL),
(66, 46, 41, 'Manager', NULL),
(67, 11, 7, 'Associate Secretary', 7),
(68, 13, 7, 'Associate Secretary', 8),
(69, 14, 7, 'Under-treasurer', 10),
(70, 18, 7, 'Associate Treasurer', 11),
(71, 16, 7, 'Associate Treasurer', 12),
(72, 17, 7, 'Associate Treasurer', 13),
(73, 47, 45, 'President', NULL),
(74, 48, 45, 'Secretary', NULL),
(75, 49, 45, 'Treasurer', NULL),
(76, 50, 45, 'Associate Treasurer', NULL),
(77, 51, 45, 'Assistant Secretary', NULL),
(78, 52, 45, 'Comm/PARL/Spirit of Prophecy', NULL),
(79, 53, 45, 'Deaf Ministry', NULL),
(80, 54, 45, 'Education', NULL),
(81, 55, 45, 'Publishing', NULL),
(82, 56, 45, 'Shepherdess/ Women’s Min./Chm/Fly Ministries', NULL),
(83, 57, 45, 'Assoc. Director', NULL),
(84, 58, 45, 'WM/Stewardship/Nurturing  & Health', NULL),
(85, 59, 45, 'SS & PM/ Youth', NULL),
(86, 60, 51, 'President', NULL),
(87, 61, 51, 'Secretary', NULL),
(88, 62, 51, 'Treasurer', NULL),
(89, 63, 51, 'Edn Assoc. / Chm & W Min.', NULL),
(90, 64, 51, 'Fly /G M/ Pub. / Youth', NULL),
(91, 65, 51, 'Heath/ Stew/SS & PM', NULL),
(92, 66, 51, 'Shepherdess Intl Co-coordinator', NULL),
(93, 67, 51, 'Statistical Reports', NULL),
(94, 68, 51, 'Trust Services/ IFA', NULL),
(95, 69, 50, 'President', NULL),
(96, 70, 50, 'Secretary', NULL),
(97, 71, 50, 'Treasurer', NULL),
(98, 72, 50, 'Chm / Family/ W Min.', NULL),
(99, 73, 50, 'Ministerial Association', NULL),
(100, 74, 50, 'Publishing/ SS / PM', NULL),
(101, 75, 50, 'Shepherdess International', NULL),
(102, 76, 50, 'Spl Min./SOP/Youth', NULL),
(103, 77, 50, 'Stewardship/ Health Ministries', NULL),
(104, 78, 49, 'President', NULL),
(105, 79, 49, 'Secretary', NULL),
(106, 80, 49, 'Treasurer', NULL),
(107, 81, 49, 'Associate Treasurer', NULL),
(108, 82, 49, 'Asst. Treasurer/Church Audit', NULL),
(109, 83, 49, 'Comm/Youth/S S & P M/Health & Temp.', NULL),
(110, 84, 49, 'Education', NULL),
(111, 85, 49, 'Field Secretary & Nurturing/SOP/Trust Services', NULL),
(112, 86, 49, 'IFA &  Risk Management', NULL),
(113, 87, 49, 'Minl/ GM/ Stw/Home Fly/ Children Ministries', NULL),
(114, 88, 49, 'PARL/ADRA/Legal', NULL),
(115, 89, 49, 'Publishing', NULL),
(116, 90, 49, 'Women’s/ Shepherdess Intl', NULL),
(117, 91, 48, 'President', NULL),
(118, 92, 48, 'Secretary', NULL),
(119, 93, 48, 'Treasurer', NULL),
(120, 94, 48, 'Assoc. Secretary', NULL),
(121, 95, 48, 'Assoc. Treasurer', NULL),
(122, 96, 48, 'Chm/Home/Family', NULL),
(123, 97, 48, 'Communication/SS/PM', NULL),
(124, 98, 48, 'Health Ministries', NULL),
(125, 99, 48, 'Min./SOP/Nurt &Spl Min.', NULL),
(126, 100, 48, 'Music Ministries', NULL),
(127, 101, 48, 'PARL', NULL),
(128, 102, 48, 'President', NULL),
(129, 103, 48, 'Secretary', NULL),
(130, 104, 47, 'President', NULL),
(131, 105, 47, 'Secretary', NULL),
(132, 106, 47, 'Treasurer', NULL),
(133, 107, 47, 'ChM & Communication', NULL),
(134, 108, 47, 'Field Secretary/SS/PM/Youth', NULL),
(135, 109, 47, 'Family & WM', NULL),
(136, 110, 47, 'Ministerial, Stw. Publishing & Spl Min./Deaf & Dumb', NULL),
(137, 111, 47, 'Zonal Education Officer I', NULL),
(138, 112, 47, 'Zonal Education Officer II', NULL),
(139, 113, 47, 'Zonal Education Officer III', NULL),
(140, 114, 46, 'President', NULL),
(141, 115, 46, 'Secretary', NULL),
(142, 116, 46, 'Treasurer', NULL),
(143, 117, 46, 'Asst. Treasurer', NULL),
(144, 118, 46, 'Education', NULL),
(145, 119, 46, 'Ministerial Association', NULL),
(146, 120, 46, 'Publishing/Health/Comm', NULL),
(147, 121, 46, 'S S &  Personal Ministries', NULL),
(148, 122, 46, 'Women’s/ Shep. & ChMin', NULL),
(149, 123, 46, 'Stewardship', NULL),
(150, 124, 52, 'Lead (Only) Developer', NULL),
(152, 125, 55, 'Associate Secretary', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jos_contact_sections`
--

DROP TABLE IF EXISTS `jos_contact_sections`;
CREATE TABLE IF NOT EXISTS `jos_contact_sections` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `jos_contact_sections`
--

INSERT INTO `jos_contact_sections` (`id`, `name`) VALUES
(1, 'Southern Asia Division'),
(2, 'Unions'),
(3, 'Developers');

-- --------------------------------------------------------

--
-- Table structure for table `jos_content`
--

DROP TABLE IF EXISTS `jos_content`;
CREATE TABLE IF NOT EXISTS `jos_content` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `title_alias` varchar(255) NOT NULL default '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL default '0',
  `sectionid` int(11) unsigned NOT NULL default '0',
  `mask` int(11) unsigned NOT NULL default '0',
  `catid` int(11) unsigned NOT NULL default '0',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL default '0',
  `created_by_alias` varchar(255) NOT NULL default '',
  `modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL default '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` text NOT NULL,
  `version` int(11) unsigned NOT NULL default '1',
  `parentid` int(11) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(11) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '0',
  `metadata` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_section` (`sectionid`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=70 ;

--
-- Dumping data for table `jos_content`
--

INSERT INTO `jos_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(1, 'Welcome', 'welcome', '', '<font color="#777777">Welcome to the Southern Asia Division of Seventh-day Adventists home page! It is a delight to have you visit us. We hope that this website will give you helpful information, answer your questions, and provide you with an overview of who we are and what we are about.  We are a family of committed believers in Jesus Christ, living expectantly in the light of His love and His coming, and seeking to serve the world around us. We would be delighted to have you visit us in person! May God bless you this day and every day.</font>', '', 1, 1, 0, 1, '2008-10-06 22:57:20', 62, '', '2008-10-31 06:28:56', 62, 62, '2008-12-12 05:43:36', '2008-10-06 22:57:20', '0000-00-00 00:00:00', '', '', 'show_title=1\nlink_titles=0\nshow_intro=0\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_vote=0\nshow_author=0\nshow_create_date=0\nshow_modify_date=0\nshow_pdf_icon=0\nshow_print_icon=0\nshow_email_icon=0\nlanguage=\nkeyref=\nreadmore=', 4, 0, 1, '', '', 0, 4, 'robots=\nauthor='),
(2, 'Contact Us', 'contact-us', '', '<h2>Postal Address:</h2>\r\n<ul class="addressInformation">\r\n<li>P.O. Box 2, Jeevan Jyothi Campus</li>\r\n<li>Hosur – 635110</li>\r\n<li>Tamil Nadu, India</li>\r\n<li><strong>Telephone</strong>: +91-4344-263800, +91-4344-263871</li>\r\n<li><strong>Fax</strong>: +91-4344-262090</li>\r\n</ul>\r\n<p>For inquiries, comments, and suggestions about the website, please contact:  <a href="index.php?option=com_contact&amp;view=contact&amp;id=124:steven-oxley&amp;catid=52:the-developers">Steven Oxley</a></p>\r\n<h2>Directions:</h2>\r\n<p>Southern Asia Division can be easily reached by automobile and by public transportation from bus, train, and air. It is located in Hosur which is on the NH-7.</p>\r\n<h3>Distance from Key Towns:</h3>\r\n<ul>\r\n<li>Bangalore - 40 kms</li>\r\n<li>Tiruchirapalli  - 350 kms</li>\r\n<li>Chennai  - 350 kms</li>\r\n</ul>\r\n<h3>By Car:</h3>\r\n<p><strong>From Bangalore</strong>: Follow the NH-7 on the Hosur Road. Turn right at Attibele and follow the signs for TVS factory. Keep going, following the main road past the Seventh-day Adventist School. Make a left at the next crossing. The Division Office is almost immediately on the right.</p>\r\n<p><strong>From Chennai</strong>: Drive on the NH-46 through this route, Sriperumbudur, Kanchi (Outskirts), Ranipet, Vellore, Ambur, Vaniyambadi. Near Krishnagiri, join the NH-7 to Hosur. Turn left just before the Hosur bus stand and proceed through the city past the Hosur Railway Station and further 3 kms. The Division Office is on the left, just past the temple.</p>\r\n<h3>By Bus:</h3>\r\n<p><strong>From Bangalore</strong>: Majestic Bus Stand also known as the Kempegowda bus stand near Gandhi Nagar is close to the railway station and is quite neatly organized and is easily navigable. There is an inquiry office near platform number 1 on ‘Majestic’ where you can ask the bus number and platform for your desired destination. You can find a large map on display, which you can use to find the bus number you need to take if you know the area you are going to. You can of course always ask the conductor or other passengers. Route maps are also sold on the platforms. Take any bus going to the any of the following places Hosur, Salem, Krishnagiri, Vellore or Chennai. Get down at the Hosur Bus Stand.  Take an auto (Rs. 35-40) to the Seventh-day Adventist Campus, or take a local bus (Rs. 3) that goes towards Mathigiri or Denkanikottai and get down at the ITI stop. Walk straight down, the Division Office is on the right, left past the temple.</p>\r\n<p><strong>From Chennai</strong>: The inter city bus station called called Chennai Mofussil Bus Terminus (CMBT) has the distinction of being the largest in the whole South Asian region. Take any bus to Hosur or Bangalore. Get down at the Hosur Bus Stand.  Take an auto (Rs. 35-40) to the Seventh-day Adventist Campus, or take a local bus (Rs. 3) that goes towards Mathigiri or Denkanikottai and get down at the ITI stop. Walk straight down, the Division Office is past the temple.</p>\r\n<h3>By Train:</h3>\r\n<p>There are local and express trains from Bangalore everyday. You can ask the enquiry at the station to find out train timings and routes. Alternatively you can check Southern Railways website.</p>\r\n<h4>Nearest Major Railway Station:</h4>\r\n<ul>\r\n<li>Hosur Junction - 3 kms</li>\r\n</ul>\r\n<h3>By Air:</h3>\r\n<p>There are local flights to Bangalore from anywhere in India. Also you can take an international flight to Bangalore or Chennai. Ask your local travel agent for more information on flight details.  Take a train, bus, or taxi from the airport to Hosur.</p>\r\n<h4>Nearest Airports:</h4>\r\n<ul>\r\n<li>Bangalore Airport (BLR) - 35 kms</li>\r\n<li>Anna International Airport, Chennai - 340 kms</li>\r\n</ul>', '', 1, 1, 0, 1, '2008-10-06 22:59:36', 62, '', '2009-01-19 11:08:57', 62, 0, '0000-00-00 00:00:00', '2008-10-06 22:59:36', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=0\nshow_author=0\nshow_create_date=0\nshow_modify_date=0\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 9, 0, 2, '', '', 0, 131, 'robots=\nauthor='),
(44, 'Blessed Year 2009', 'blessed-year-2009', '', '<em><strong>When we live according to the plan and purpose of God, we will enjoy the blessings of the Lord and will be a blessing to others.</strong></em>\r\n<p>Then Isaac sowed in that land, and reaped in the same year a hundred fold; and the LORD blessed him.”  “And he moved from there and dug another well, and they did not quarrel over it.  So he called its name Rehoboth, because he said, ‘For the LORD has made room for us, and we shall be fruitful in the land.’ (Gen. 26:12,22 NKJV)</p>\r\n<h3>“Happy New Year!” “Blessed New Year!”</h3>\r\n<p>These words are still ringing in our minds.  We have entered another New Year.  The world around us in a turbulent situation.  War in Iraq has killed thousands of people of various nationalities.  Around the globe everyday we hear about terrorist attacks or encounter deaths.  There is a lot of political uncertainty in many nations (including India). Planned opposition for the Gospel comes in a systematic way in various societies.  In Such a situation we have  entered 2009. \r\n', '\r\n</p>\r\n<h3>Bumper Harvest</h3>\r\n<p>In Genesis 26, we see Isaac in a troubled situation.  Following his father Abraham, Isaac sojourns in the land.  He plants crops in the land and the Lord blesses it.  He gets hundred-fold harvest (v. 12).  This Year 2009 can become a year in which the LORD can bless our efforts for Him with a hundred-fold result.  But, we have to do the sowing part. The harvest will not come automatically.  We have to do the hard work of preparing the ground, selecting the seeds and sowing them at the right time.  Then, God will bless it and will give us a hundred-fold yield.  We are called to sow good deeds in this world (Gal. 6:8-10).  We are also called to sow the seeds of the Gospel in the society where the Lord has kept us (Rom. 10:14, 15).When we do our part, the LORD will bring the yield (1 Cor. 3:6,7).</p>\r\n<h3>To Resist Or to Avoid the Evil</h3>\r\n<p>When the LORD blessed Isaac, we see the reaction of his neighbors.  They were not happy with his success.  They envied him (v 14).  Instead of working competitively and trying to excel him, they chose to spoil the water resources of Isaac (v 15).  Yes, they chose to destroy the results of his father’s hard labor. The enemy despised his good works.  His hard work seems to become useless.  But, Isaac was conscious of the Lord’s plans and responds in a magnanimous manner. Next, they tell him to go away from them, because he is mightier than they are is mightier than they are (v. 16).  Isaac at that time was a very prosperous man (vv. 13, 14).  But, instead of asserting his position by the strength of his wealth, Isaac chose to depart from them (v. 17).  The Lord Jesus told His disciples to flee to the next city when they face persecution (Matt. 10:23).  Paul and Barnabas also followed the same example (Acts 13:50, 51).  We see Isaac just moving away from that situation.  We have to use the Lord’s discernment in deciding to stay on in the problem and to bear the cost or to move away from that situation(Acts 5:40-42; 9:24, 25, 29, 30).</p>\r\n<h3>Giving Up Rights</h3>\r\n<p>Instead of blaming the opposition and non-cooperation of the Philistines, Isaac begins to find new water resources (vv. 18, 19).  Here again he faces trouble from the enemy.  They come and claim that the water is theirs (vv. 20,21).  From two such situations.  He moves away giving up his right (v. 22).  We do not see Isaac as one who quarrels with his enemies.  He silently gives up the fruit of his labor to his enemies and moves away (Matt. 5:39-41)</p>\r\n<h3>Rehoboth</h3>\r\n<p>When Isaac dug the third well, the enemies did not quarrel about it (v. 22).  So, he decides that the Lord’s time has come to settle him in the land and to prosper him.  He did not take the credit for having dug the well.  He fully acknowledges that it is the LORD who has made room for them.  Isaac calls the name of that well ‘Rehoboth.’ Which means ‘room.’  When we strive with our own strength for possessions, positions, promotions, and powers, we may see some results.  But, they will lead to restlessness and confusion for us and when the LORD leads us into all these, the peace of GOD will be within us (Prov. 10:22; 21:31).  There will be joy and peace in our surroundings.  We will be blessed and we will be channels of God’s blessings to others (Gen. 12:2,3; 22:17,18).</p>\r\n<h3>Abiding Fruit</h3>\r\n<p>Isaac is now sure that by the blessings of the LORD, they will be fruitful in the land.  He acknowledges that fruitfulness is essentially of the LORD. Jesus Christ taught this in detail in John 15.  When we live according to the plan and purpose of God, we will enjoy be a blessing to others.  The Lord is waiting to lead us in such a life in this New Year 2006.</p>\r\n<p>-<i>P. Jebaraj</i></p>', 1, 4, 0, 54, '2009-01-05 12:54:27', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2009-01-05 12:54:27', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 16, '', '', 0, 9, 'robots=\nauthor='),
(3, 'About Us', 'about-us', '', '<p>We are a family of committed believers in Jesus Christ, living expectantly in the light of his love and his coming, and seeking to serve the world around us.</p><p style="margin-top: 0pt; margin-bottom: 0pt" class="text" align="justify"><strong>Additional Information:</strong></p> 				<p style="margin-top: 0pt; margin-bottom: 0pt" align="justify"> 				<a href="http://www.adventist.org.in/About%20Us/mission.html">Mission & Vision</a></p><p style="margin-top: 0pt; margin-bottom: 0pt" align="justify"> 				<a href="http://www.adventist.org.in/About%20Us/logo.html">Logo</a></p><ul><li> 					<p style="margin-top: 0pt; margin-bottom: 0pt" align="justify"> 					<a href="http://www.adventist.org.in/About%20Us/churchname.html">Use of the Church Name</a> 					</p></li><li> 					<p style="margin-top: 0pt; margin-bottom: 0pt" align="justify"> 					<a href="http://www.adventist.org.in/About%20Us/churchname.html">Guidelines for Seventh-day  					Adventist Church Websites</a> 					</p></li><li> 					<p style="margin-top: 0pt; margin-bottom: 0pt" align="justify"> 					<a href="http://www.adventist.org.in/About%20Us/trademark.html">Seventh-day Adventist Trademark  					Guidelines</a> 				</p></li></ul> 				<p style="margin-top: 0pt; margin-bottom: 0pt" align="justify"> 				<a href="http://www.adventist.org.in/About%20Us/quicklook.html">A Quick Look at the Seventh-day  				Adventist Church</a></p> 				<p style="margin-top: 0pt; margin-bottom: 0pt" align="justify"> 				<a href="http://www.adventist.org.in/About%20Us/briefhistory.html">A Brief History of the Seventh-day  				Adventist Church</a></p><p style="margin-top: 0pt; margin-bottom: 0pt" align="justify"> 				<a href="http://www.adventist.org.in/About%20Us/assortedfacts.htm">Assorted Facts about Adventists and  				their Church</a></p><p style="margin-top: 0pt; margin-bottom: 0pt" align="justify"> 				<a href="http://www.adventist.org.in/About%20Us/history.html">History</a></p><p style="margin-top: 0pt; margin-bottom: 0pt" align="justify"> 				<a href="http://www.adventist.org.in/About%20Us/whatwebelieve.html">What We Believe</a></p><p style="margin-top: 0pt; margin-bottom: 0pt" align="justify"> 				<a href="http://www.adventist.org.in/About%20Us/fundamentalbeliefs.html">Fundamental Beliefs</a></p><p style="margin-top: 0pt; margin-bottom: 0pt" align="justify"> 				<a href="http://www.adventist.org.in/About%20Us/neighbour.html">Your Seventh-day Adventist Neighbour</a></p><p style="margin-top: 0pt; margin-bottom: 0pt" align="justify"> 				<a href="http://www.adventist.org.in/About%20Us/org.html">Organizational Structure</a></p><p>&nbsp;</p>', '', -2, 1, 0, 1, '2008-10-07 00:01:31', 62, '', '2008-10-07 00:04:57', 62, 0, '0000-00-00 00:00:00', '2008-10-07 00:01:31', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 0, '', '', 0, 3, 'robots=\nauthor='),
(4, 'Mission Statement of the Seventh-day Adventist Church', 'mission', '', '<p><strong>Our Mission</strong>: The mission of the Seventh-day Adventist Church is to proclaim to all peoples the everlasting gospel in the context of the three angels’ messages of Revelation 14:6-12, leading them to accept Jesus as personal Saviour and to unite with His church, and nurturing them in preparation for His soon return. </p> <p> <strong>Our Method</strong>: We pursue this mission under the guidance of the Holy Spirit through: </p><ol>   <li><em>Preaching </em>– Accepting Christ’s commission (Matt 28:18-20), we proclaim to all the world the message of a loving God, most fully revealed in His Son’s reconciling ministry and atoning death. Recognizing the Bible to be God’s infallible revelation of His will, we present its full message, including the second advent of Christ and the continuing authority of His Ten Commandment law with its reminder of the seventh-day Sabbath.   </li>   <li><em>Teaching </em>– Acknowledging that development of mind and character is essential to God’s redemptive plan, we promote the growth of a mature understanding of and relationship to God, His Word, and the created universe.</li><li><em>Healing </em>– Affirming the biblical emphasis on the well-being of the whole person, we make the preservation of health and the healing of the sick a priority and through our ministry to the poor and oppressed, cooperate with the Creator in His compassionate work of restoration.   Our Vision: In harmony with the great prophecies of the Scriptures, we see as the climax of God’s plan the restoration of all His creation to full harmony with His perfect will and righteousness.   </li> </ol>', '', 1, 1, 0, 2, '2008-10-07 00:17:04', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-10-07 00:17:04', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 5, '', '', 0, 23, 'robots=\nauthor='),
(5, 'The Seventh-day Adventist Logo', 'sda-logo', '', '<img src="images/sda-logo1.gif" border="0" alt="SDA Logo" title="The Logo of the Seventh-day Adventist Church" width="400" height="132" /><p>The choice of the Church''s logo reflects the core values that Seventh-day Adventists are committed to. The foundation is the Bible, the Word of God, shown open since its message must necessarily be read and put into practice. Central to that Biblical message is the Cross, and is also central in the logo. Above the Cross and the open Bible is the burning flame of the Holy Spirit, the messenger of Truth. </p> <p> It is our hope and prayer that though this logo is a very simple picture of the foundation of Adventist beliefs and values it may be a recognizable symbol of the Adventist message to the world. </p> <h3>Who May Use The Logo</h3> <p> The registered trademark may be used by the Seventh-day Adventist Church, its entities, institutions, and churches, as authorized by the General Conference of Seventh-day Adventists, its divisions, unions, and conferences.</p><p><img src="images/logowithglobe.gif" border="0" title="Description of SDA Logo" width="450" height="465" /> </p>', '', 1, 1, 0, 2, '2008-10-07 00:49:20', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-10-07 00:49:20', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 7, '', '', 0, 25, 'robots=\nauthor='),
(6, 'History of the SDA Church in India', 'history-sda-india', '', '<p> Though Stephen Haskell and Percy Magan crossed India on their mission survey around the world in 1890, it was not till 1893 that William Lenker and A. T. Stroup started selling Adventist literature in Madras. </p> <p> Shortly before their arrival Anna Gordon passed away. She had begun to observe the Sabbath in London and went to India as a self-supporting missionary. Lenker described her as a “faithful worker for God and a teacher of Adventist doctrines.” It is also recorded that before any Adventist work was opened in India, Dr. John Harvey Kellogg supported B.N. Mitter in his work. Mitter joined the regular Adventist work force when they arrived in 1895. </p> <p> The first regular Adventist worker to reach India was Georgia Burrus who arrived in Kolkata on Jan 23, 1895. Elder D. A. Robinson had intended to travel with her, but was delayed till Nov 8 of that year at which time he arrived with Martha May Taylor. Captain Masters and his wife who returned to India from New Zealand after becoming Adventists met Georgia Burrus on her arrival. </p> <p> Georgia Burrus worked in the zenanas of Baliaghatta and Dores Robinson opened the first Adventist schools (1896, 1897) for girls. An orphanage for boys opened in 1897 but moved to Karmatar, Jharkhand (1898) for vocational training. Dr O. G. Place and nurses Samantha Whiteis and Maggie Green opened the first treatment rooms in 1896. The Adventists moved their headquarters to Lucknow in 1909 and opened several Urdu schools (1910) and an English school at Mussoorie (1911). </p> <p> Meanwhile, in the south, a group of Tamil merchants through personal Bible study had begun to observe Saturday as the Sabbath. J. S. James worked among them from 1906. Suvisesha Muthu became an Adventist through reading literature and took to selling the same literature in and around Trivandrum, converting practically an entire community that today is renamed Adventpuram. H. G. Woodward worked there in 1918. </p> <p> A group of Telegus became Seventh-day Adventists in Rangoon and returned to Andhra. J.S. James visited them in 1915, and in 1918 T. R. Flaiz settled at Narsapur. Georgia Burrus and her husband L. J. Burgess retired in Meghalaya in the 1930s. W. G. Lowry pioneered the work among the Mizos around 1950. Dr S. G. Sturgess moved to Nepal in 1957. Following government approval a hospital financed by the Scheers opened on May 18, 1960 at Banepa. Today nursing and medical training is conducted there. </p> <p> Till 1909 the work in British India was operated as a detached Mission of the General Conference. The India Union Mission was organized in 1910 with J. L. Shaw as the first superintendent. It was joined to the Asiatic Division in 1915. </p> <p> The Southern Asia Division was organized under president J. E. Fulton in 1919 with 26 churches and 978 members. </p>', '', 1, 1, 0, 2, '2008-10-07 17:06:06', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-10-07 17:06:06', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 6, '', '', 0, 28, 'robots=\nauthor='),
(7, 'What Adventists Believe', 'what-sda-believe', '', '<p> As a Christian church, Seventh-day Adventists are a faith community rooted in the beliefs described by the Holy Scriptures. Adventists describe these beliefs in the following ways: </p> <h3> God''s greatest desire is for you to see a clear picture of His character. When you see Him clearly, you will find His love irresistible. </h3> <p> For many, "seeing God clearly" requires that they see God''s face. However, how He looks is not the issue. Seeing and understanding His character is what''s most important. The more clearly we understand Him, the more we will find His love irresistible. As we begin to experience His love, our own lives will begin to make more sense. </p> <p> God most clearly reveals His character in three great events. The first is His creation of man and woman--and His giving them the freedom of choice. He created humans with the ability to choose to love Him or to hate Him! The death of Jesus Christ, God''s only Son, on the cross as our substitute is the second great event. In that act He paid the penalty we deserve for our hateful choices toward God and His ways. Jesus'' death guarantees forgiveness for those choices and allows us to spend eternity with Him. The third event confirms the first two and fills every heart with hope: Christ''s tomb is empty! He is alive, living to fill us with His love! </p> <p> Jesus'' disciple John wrote that if everyone wrote all the stories they knew about Jesus, the whole world could not contain them. Our knowledge of God helps us understand His love, character, and grace. Experiencing that love begins a lifelong adventure in growth and service. This knowledge and experience powers our mission to tell the world about His love and His offer of salvation. </p> <h3> Scripture is a road map. The Bible is God''s voice, speaking His love personally to you today. </h3> <p> The Bible speaks the Creator''s directions to us, like a detailed road map that clearly shows the exit ramp directly into heaven. It is also much like an owner''s manual for a life ready to be lived on the cutting edge of liberty. </p> <p> Sometimes His voice speaks through stories, such as those of David and Goliath, Ruth and Boaz, Naaman''s little servant girl, Christ on the cross, and fisherman Peter learning how to tend sheep. Some of these stories teach us how to handle the troubles we face each day. Others fill us with hope and peace. Each of them is like a personal letter from God to you. </p> <p> Portions of Scripture are direct instructions and laws from God such as the Ten Commandments, recorded in Exodus 20. These tell us more about God and His expectations for us. When people asked Jesus to summarize these commands, He focused on the way God''s love affects the way we live. "Love the Lord your God with all your heart, mind, and soul," He said. "And love your neighbour as you love yourself." </p> <p> On other pages the Bible gives God''s practical advice and encouragement through parables, lists, promises, and warnings. Amazingly, though many different writers throughout thousands of years wrote the Bible, each page describes the same God in ways we can understand and apply in our lives today. This book is always His voice talking personally to anyone who is willing to read and hear. </p> <p> God loves us even when we choose to reject His love. In those times He allows us to walk away into the life of our own choices. Yet He is still there, always ready to redeem us from the results of our decisions. </p> <h3> Jesus is the one who never changes in a universe that always does. Jesus is Creator, Sustainer, Saviour, Friend, God''s Son, and God Himself! </h3> <p> Everything in this world is always changing, even our desires, interests, skills, and body shapes. But Jesus? He''s consistent. He''s always the same. Sure, He''s always surprising us and touching our lives in thousands of new and different ways, but His character is unchanging. He''s God''s Son, the Creator, our Saviour, and Friend. </p> <p> Jesus has promised to be all of that, and more, for each of us. We can trust His promises because He is God. When the words of Colossians say "in Him all things hold together" (1:17, NIV) that includes everything in our lives. He keeps us whole when the enemy is trying to make us fall apart. </p> <p> Seventh-day Adventists believe that Jesus is one of the three persons, called the Trinity, who make up our one God. The Bible describes Jesus, the Father, and the Holy Spirit as each being committed to our growth as Christians and to our salvation as their children. They made this salvation possible when Jesus came to Bethlehem as a human baby. He lived a life perfectly in accord with God''s will and then died innocently for all of our sins. He was placed in a borrowed tomb, but He came back to life three days later. Now he is in heaven interceding with the Father for us, preparing for our deliverance from sin and death. </p> <p> When everything may be falling apart, when you feel totally alone in the universe, Jesus is right there in the center of it all, offering personal peace and hope. Allow Him into your life. He immediately begins "remodelling" who you are and how you live. Jesus, in fact, is busily transforming His followers into accurate representatives of God''s character. </p> <p> Look to Jesus, and you''ll be looking into the understanding and loving face of God. </p> <h3> God''s vision for you is life as He lives it! God loves you, and wants to give you the highest quality of life imaginable. </h3> <p> No, not a second-rate existence somewhere on earth, but the highest quality of life imaginable, here and in eternity with Him! That''s what God wants us to have. The best! </p> <p> This is why He provides church families where we can belong. This is why He gives each of us special gifts and talents, so we can live life fully. Amazingly, this is why He''s concerned about what you''re doing, when you''re doing it, and how you relate to Him. God doesn''t want anything to get in the way of our friendship. He especially doesn''t want us to get involved in anything damaging or hurtful. He''s like a loving father or a good big brother. He''s someone who loves you so much that He''s always looking out for you. </p> <p> When God designed you, He included special talents and skills that will help you become a uniquely valuable individual. These may be your ability to teach, your love for others, or your leadership skills. Still, whatever special gifts you have received, God has also provided all of the energy and wisdom necessary for you to use them well. </p> <p> By the way, how God feels about death is part of the quality life He offers. For followers of Christ, death holds no fear. Remember, Jesus defeated death on Calvary and has given us freedom from death. Cemeteries, then, are filled with followers of God who are in the "peaceful pause before the resurrection." Yes, they are dead, but that death holds no power over their future. Jesus is coming to take them (and those of us who are still living) HOME! Death is almost like a wintery promise of spring. </p> <p> The Seventh-day Adventist faith in today and in the future comes from seeing this life "overflowing" with hope! </p> <p> Because love is the key aspect of His character, God is also deeply into gratitude. Before we even finish saying thank you, He''s already busy sending more blessings. </p> <h3> In the heart of God is a place you can experience as home. God loves you, and wants to spend time with you personally, one on one, as two close friends. </h3> <p> Because you and God are friends, you will spend time together as friends do. Each morning you''ll share a hello and a hug and discuss how you can face the day''s events together. Throughout the day you''ll talk with Him about how you feel. You''ll laugh with Him at funny things and ache with Him over sadness and hurts. It''s pleasant being God''s friend, able to snuggle comfortably into the safety of your relationship. You can always trust Him to treat you well, because He loves you. </p> <p> The seventh day (Saturday) is an extra-special part of the relationship. The Bible, from Genesis through Revelation, describes the seventh day as the one day God has set aside for focused fellowship with His people. God has named that day "Sabbath" and asked us to spend it with Him. "Remember the Sabbath day," He says, "to keep it holy." The Sabbath is a whole day to deepen our friendship with the Creator of the universe! A day when we''re together, Jesus with us and us with Jesus. </p> <p> There''s another great truth about friendship with God. It doesn''t end in a cemetery, for God is planning a homecoming better than anything we can dream. A homecoming filled with angels, trumpets, Jesus, and resurrections! He''s promised to bring His followers, those who have accepted the offer of His life-changing love, from this earth to His home, a place He calls heaven. A place where our friendship can go on growing forever, endlessly, joyfully! </p> <ul>   <li>     God keeps a family album-and your picture is in it. God loves you and has a plan for your life.    </li> </ul> <p> God''s love is about you. Personally. </p> <p> God made you and has a very special plan for your life. It''s a plan that will fill you with hope, love, peace, and activity. In fact, when Christ paid the penalty for sin on the cross, that gave Him the right to claim you as His own. As a result, you can experience His love and priceless salvation freely and fully without limit. </p> <p> By the way, pictures of everyone fill that album: Nepalese, Brazilians, Nigerians, Yupiks, Germans, people of every nation, culture, background, gender, hair colour, and foot size. In God''s eyes all are equally "children of the King"! </p> <p> Salvation? God cleans away all our sins and replaces them with His goodness. We don''t have to be "good" for Him to accept us. Nevertheless, we must accept His promise and allow Him to clean out everything the enemy has left in us. Then we begin to experience the transforming power of His love. It''s like a giant war: one side pulling us toward empty pleasure and destruction, and God urging us to accept His offer of peace and purpose. </p> <p> Remember, Jesus has already won the war. He is victorious! We celebrate His victory in our lives when we participate in the Lord''s Supper. This meal includes three symbols: </p> <ul>   <li>     Foot washing (which symbolizes our commitment to love others as Jesus loves us),   </li>   <li>     bread ("This bread is my flesh," Jesus said, "which I will give for the life of the world," John 6:51, NIV), and   </li>   <li>     wine or grape juice ("Whoever eats my flesh and drinks my blood has eternal life." John 6:54, NIV)   </li>  </ul> <p> To help us understand how God can transform us into His children, Jesus modelled the process of baptism for us. Baptism symbolized dying to self and coming alive in Jesus. Seventh-day Adventists practice full immersion baptism because by being fully buried beneath the water we symbolize that God''s grace fully fills us with His new life for the future. Through baptism we are truly born again in Jesus. </p> <p> Eternal life, peace, purpose, forgiveness, transforming grace, hope: Everything He promises is ours, because He''s offering it and He''s shown we can trust Him to do exactly as He promises. Accept His gifts, and you immediately become an active part of His family, and He joyfully becomes part of yours. </p>', '', 1, 1, 0, 2, '2008-10-07 17:14:12', 62, '', '2008-10-07 18:07:50', 62, 0, '0000-00-00 00:00:00', '2008-10-07 17:14:12', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 4, '', '', 0, 30, 'robots=\nauthor='),
(8, 'Brief Overview of Seventh-day Adventists', 'sda-info-brief', '', '<h3>Name</h3> <p> Seventh-day Adventists: the name highlights two beliefs that reflect two core Christian values important to the Church The second coming (or “advent”) of Jesus expresses the vital hope of the Church; the seventh-day Sabbath (Saturday) emphasizes the Biblical day of worship of the Creator and Savior of the world. </p>  <h3>Belief in Action</h3> <p> The most important truth Adventists want to share is belief in the trustworthy and gracious God of the Bible. Adventists believe in God as Creator, as Savior, but most of all as both Friend and Lord; the God who values most highly the freedom of His created beings, to whom He offers salvation in the present and eternal life in the soon-coming future. </p> <p> As a result, Adventists place great emphasis on different aspects of human freedom and responsibility, including: </p> <ul>   <li>religious liberty and human rights</li>   <li>humanitarian aid and development</li>   <li>better lifestyles</li>   <li>health and wholeness</li>   <li>education and personal growth</li>   <li>social issues and community involvement</li> </ul> <p> Adventists see their adherence to these values as a way of illustrating both faith in the God who cares intimately about every one of Earth’s inhabitants, and the church’s commitment to the betterment of fellow human beings. </p>  <h3>A World-wide People</h3> <p> The Adventist Church is active in 205 of the 230 countries recognized by the United Nations. High concentrations of Adventists are found in Central and South America, East and West Africa, the Philippines and many other areas. In composition, 39 percent of Adventists are African, 30 percent Hispanic, 14 percent East Asian and 11 percent Caucasian. </p>  <h3>A Growing People</h3> <p> Adventist Church membership is growing at the rate of almost one million every year, with new members joining the Church at the rate of one every 35 seconds. Globally the church is doubling every twelve years, with a current baptized membership of 11 million. </p>  <h3>People with a Global Mission</h3> <p> Adventists believe in sharing beliefs and values, and recognize the importance of telling others of the gospel message of Jesus Christ. The church’s “Global Mission” initiative attempts to communicate this message through seminars and outreach programs, the church’s medical mission and education system, and through pastors and members who dedicate their lives service to others. </p>  <h3>Aid to Humanity</h3> <p> Through organizations like the Adventist Development and Relief Agency International and other programs, the Adventist Church reaches out to provide practical help to those affected by disaster and requiring development assistance. This aid is provided without discrimination to all those in need, and includes food aid, medical supplies, equipment, and building materials, as well as educational programs and facilities, drug-awareness, social action, and agricultural development. </p>  <h3>Educating and individual development</h3> <p> The Adventist Church is committed to making education accessible in as many areas of the world as possible. Education, the church, believes, results in a better trained society and helps individuals reach their full potential. At the heart of the Adventist world-wide educational system is the conviction that every individual needs to have the opportunity to study and to grow. The Adventist education program now has more than one million students in over 5,500 schools, colleges, and universities-making it the largest Protestant education system in the world. </p>  <h3>Using Technology</h3> <p> Recognizing the benefits of modem technology, the Adventist Church has a wide network of satellite downlinks and regular satellite broadcasts; a highly-developed radio ministry broadcasting in more than 40 languages; and an extensive range of Web sites on the Internet. The church’s official Web site www.adventist.org receives over 500,000 unique visitors per year. </p>  <h3>Healthy Living</h3> <p> Not only concerned with spiritual health, Adventists promote a vegetarian lifestyle free from alcohol, smoking, and the use of illegal drugs. The world-renown “Stop Smoking” programs operated by the Church have allowed hundreds of thousands of people to quit the habit, while many others have been helped to a healthier lifestyle through seminars and nutrition programs. </p>  <h3>Medical Contributions</h3> <p> The Adventist Church has made many contributions to health and wholeness through its extensive medical ministry, operating 162 hospitals and sanitariums and more than 300 clinics worldwide. The Church’s Loma Linda University Medical Center is world-famous for its heart transplant program and the newly-developed but already highly-effective Proton Treatment Center which uses high-speed protons to attack a number of cancers with greater precision than traditional treatments. </p>  <h3>Love in Action</h3> <p> Adventists value the opportunity to share their faith through actions in the service of others, recognizing the Bible’s words: “Let us not love with words or tongue but with actions and in truth.” (1 John 3:18 NIV). </p>', '', 1, 1, 0, 2, '2008-10-07 18:17:41', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-10-07 18:17:41', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 3, '', '', 0, 109, 'robots=\nauthor='),
(9, 'Brief Overview of Adventist History', 'history-sda', '', '<p>Organized in 1863, the Seventh-day Adventist Church has its doctrinal roots in the “Advent Awakening” movement of the 1840s. Hundreds of thousands of Christians became convinced from their study of Bible prophecy that Christ would soon return. This re-awakening of a neglected Biblical belief occurred in many countries, with a major focus in North America. </p> <p> After the “great disappointment” of their hopes in 1844, these “advent believers” broke up into a number of different groups. One group, studying their Bibles for increased understanding, recognized the seventh-day Sabbath (Saturday) as the day of worship. This group, which included Ellen and James White and Joseph Bates, became the nucleus of the church congregations that chose the name “Seventh-day Adventist Church” and organized in Battle Creek, Michigan, with 125 churches and 3,500 members. </p> <p> Ellen White‘s ministry under God’s special guidance greatly influenced the development of the Adventist Church. Her counsels and messages to believers and church leaders shaped the form and progress of the church, while its beliefs have remained totally Bible-based. </p> <p> Other early Adventists of note include John Harvey Kellogg, inventor of the “cornflake” developed by his brother Will and pioneer of the Battle Creek Sanitarium; Joseph Bates, retired sea captain and first leader of an Adventist administration; Uriah Smith, prolific author and inventor, and editor of the church’s paper for almost 50 years. </p> <p> Adventist missionaries began work outside of North America in 1864, and ten years later J. N. Andrews was sent to Switzerland as the denomination’s first official missionary. In 1890, an Adventist minister began working in Russia, while in 1894 church operations commenced in Africa (Ghana and South Africa). Missionaries also arrived in South America in 1894, and in Japan in 1896. The church now operates in 205 countries worldwide. </p> <p> Growth from the early days has been dramatic. From the small group meeting in 1846 and the organization of the church with 3,500 believers, Seventh-day Adventists now number 11 million worldwide. </p>', '', 1, 1, 0, 2, '2008-10-07 18:26:25', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-10-07 18:26:25', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 2, '', '', 0, 32, 'robots=\nauthor=');
INSERT INTO `jos_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(10, 'Your Adventist Neighbour', 'adventist-neighbour', '', '<h3>What to expect from your Seventh-day Adventist neighbour, or, a few answers to frequently asked questions</h3>  <p> It''s 9:00 Saturday morning and your neighbours have just come out of their front door dressed as though they''re going to a symphony concert. But two of them are carrying Bibles! Chances are your neighbours are Seventh-day Adventists on their way to Sabbath morning worship services at their church. That means you''re in for a very special relationship, a friendship marked by kindness, openness, and honesty--one that could well enrich your life. </p> <p> You will find your Adventist friends committed to some very specific beliefs about God and about God''s relationships with people. They will be genuinely concerned about the needs of others and interested in bettering your community. If you observe them at their workplace, within their families, and at their church, they will be busily involved in many activities. </p> <p> Watch your neighbours closely, and you''ll probably notice (at least) the following: </p> <ul>   <li>Their love for God supersedes everything else in their lives</li>   <li>They worship on Saturday instead of Friday or Sunday</li>   <li>No beer cans or wine bottles dot their trash</li>   <li>They value their health</li>   <li>They appear upbeat and friendly</li>   <li>They work hard to make the community look great</li>   <li>They want to hear what makes you and your family happy</li> </ul> <p> You will soon discover that your neighbours genuinely like you and accept you as you are. They share their friendship across the back fence, in the marketplace, and at the bus stop. You''ll see smiles that come from a depth of peace--in the midst of chaos. That''s right, "chaos." Your Adventist neighbours are just like you. They experience the same stresses and disasters that strike everyone else in the neighbourhood. Yet you''ll notice a difference in how they respond to the challenges. They have a deep inner peace that allows them to look the enemy in the eye and smile. They are looking far beyond today''s troubles to the certainties of the future. Because they already know the outcome, they are comfortable with final victory! </p> <p> Peace, strong inner contentment, is a personal trait of committed Seventh-day Adventists. Many Allied pilots saw that peace in the lives of the Adventist Fiji Islanders who rescued them from the jungles during World War II. Residents of Florida, Iran, the Philippines, Somalia, and thousands of other places have seen that peace. It showed up in the lives of Adventist aid workers who helped them "dig out and start over" after earthquakes, tornadoes, fires, floods and other disasters. </p> <p> Your neighbourhood will see this peace in the lives of your Adventist friends, even when the well runs dry, a tree falls on the house, or the car is stolen from the parking lot. No, this peace is not a cavalier, "Oh, whatever!" attitude. It is the intense peace that comes from knowing God and that whatever happens here in this world is as "nothing" when compared to the joys of living forever in heaven with God. </p> <p> Sadness? Yes, that''s an Adventist emotion, but they believe God''s love comforts the sorrowing. </p> <p> Pain? Yes, Adventists experience pain. Their healthy lifestyle does allow them to live longer than others--as studies done on Adventists in the United States have shown. But Adventists still break limbs, contract cancer, fall off their bikes, and lose loved ones. Yet pain, even at its worst, is always accompanied by the healing love of God. </p> <p> Anger? Yes. Even anger shows up in the lives of Adventists. Remember, they''re normal people trying to live with God on a chaotic earth! But God is good enough to bring the calming power of His love into each angry situation. Even there the result is peace. </p> <p> Praise, an intense eagerness to thank God for all He is doing in our lives, is another visible trait of Seventh-day Adventists. If you stop by your neighbours'' home at breakfast time, you''ll probably find someone praying and reading a thought for the day from a book or the Bible while the others eat their meal. Evenings often include a time of thankfulness to God for a good day, Bible reading, and prayer. Many Friday and Wednesday nights your neighbours will participate in Bible study classes, public lectures on religion, or special activities for youth and children at their church. Saturday morning the whole family will join other church members for Sabbath School and a corporate worship service. Don''t be surprised if your neighbours invite you to join them at one or more of these activities. </p> <p> Sabbath school is like Sunday school. It is a one-hour time praising God through music, prayers, mission stories, and small group Bible study. During the time there are separate classes for children grouped according to their ages and for adults with varied interests and understanding of the Bible. Music and fellowship are central to each Sabbath school program. You will find Sabbath school to be a "good time" with each other and with God. </p> <p> The corporate worship service, or "church," is a more formal time of worship and praise. During this hour you will hear a practical, Bible-based sermon designed to help you see God more clearly and to provide you with strength to live as a Christian during the week. Church also includes worship music, public and personal prayers, and an opportunity to give tithe (10 percent of one''s income) and thank offerings to God. During the prayer time, worship leaders will give you an opportunity to share your personal needs or requests so these can be included in the congregational prayer. </p> <p> Seventh-day Adventist worship styles differ greatly. Some congregations conduct public worship very formally, often singing hymns and anthems accompanied by a pipe organ and piano. Worship in some other congregations is much more laid-back and features praise music led by guitars or even a small band. Still others reflect the cultural heritage of the congregation and may feature exuberant expressions of praise. Ask your neighbours to describe how their congregation worships so you''ll know what to expect when you accept their invitation to join them. Whatever the worship style, all Adventist congregations are worshiping the same eternal God who gives us cause for praise! </p> <p> Purpose, a deep commitment to accomplishing specific goals, is also a personal trait of Seventh-day Adventists. We are not here just to get up, go to work, and come home. We have accepted the challenge of Christ and so function as ambassadors of the Creator. Our purpose is to represent God so clearly that you will find His love irresistible! </p> <p> You''ll see that purpose when your Adventist friend talks about his son who is going abroad as a student missionary to help build a church. You''ll see it on the many evenings your neighbours go to church rather than stay home and watch TV. You''ll see it in their visible commitment to healthful living, to protecting life, to caring for the earth, and to building friendships with their neighbours. Adventists are a purposeful group of people, busy following a lifelong mission. That mission comes from the words of Jesus Christ Himself. "Therefore go and make disciples of all nations, baptizing them in the name of the Father and of the Son and of the Holy Spirit, and teaching them to obey everything I have commanded you" (Matthew 28:19, 20 NIV). </p> <p> Adventists believe that Jesus Christ is coming soon to take all of His followers home to an eternal heaven. Because Jesus has asked His followers to "go and teach," Adventists purposefully share the good news of Christ with everyone they can find--especially their neighbours! </p> <p> Peace, praise, and purpose. All of these result in a unique power for living, an internal energy that comes from having yielded to Christ. You will see this as a power that flows from God through your Adventist neighbour to you. That is our greatest hope as Adventists. </p> <p> We also hope that you will see in us the power, purpose, and peace that God offers to each human being. Even more, we hope you will find these to be so attractive that you will choose to accept Jesus Christ as your personal Saviour. Won''t you join us in this lifetime adventure called Christianity? </p>', '', 1, 1, 0, 2, '2008-10-07 18:39:11', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-10-07 18:39:11', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 1, '', '', 0, 34, 'robots=\nauthor='),
(11, 'East - Central India Union', 'east-central-india-union', '', '<ul class="addressInformation">\r\n  <li>2 Chapel Road</li>\r\n  <li>Hyderabad 500 001</li>\r\n  <li>Andhra Pradesh</li>\r\n  <li><strong>Telephone</strong>: 91(040)232-018-32/232-000-79</li>\r\n  <li><strong>Fax</strong>:  (040)232-027-04</li>\r\n  <li><strong>E-mail</strong>:   \r\n    <ul class="emails">\r\n      <li>ciusda1@sify.com</li>\r\n    </ul>\r\n  </li>\r\n</ul>', '', 1, 2, 0, 43, '2008-10-28 18:01:52', 62, '', '2008-10-28 18:31:08', 62, 0, '0000-00-00 00:00:00', '2008-10-28 18:01:52', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 7, '', '', 0, 3, 'robots=\nauthor='),
(12, 'Northeast India Union', 'northeast-india-union', '', '<ul class="addressInformation">\r\n  <li>"Santana," Laitumkhrah</li>\r\n  <li>Shillong 793 003</li>\r\n  <li>Meghalaya</li>\r\n  <li><strong>Telephone</strong>:  91(0364)252-2471</li>\r\n  <li><strong>Fax</strong>:  91(0364)252-2471</li>\r\n  <li><strong>E-mail</strong>:  \r\n    <ul class="emails"><li>neiusda1@sancharnet.in</li></ul>\r\n  </li>\r\n</ul>', '', 1, 2, 0, 43, '2008-10-28 18:20:07', 62, '', '2008-10-28 18:31:38', 62, 0, '0000-00-00 00:00:00', '2008-10-28 18:20:07', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 6, '', '', 0, 2, 'robots=\nauthor='),
(13, 'Northern India Union', 'northern-india-union', '', '<ul class="addressInformation">\r\n  <li>11 Hailey Road</li>\r\n  <li>New Delhi 110 001</li>\r\n  <li><strong>Telephone</strong>:  91(011)233-249-59, 233-296-81</li>\r\n  <li><strong>Fax</strong>:  91(011)233-249-59</li>\r\n  <li><strong>E-mail</strong>:  <ul class="emails"><li>niusda@vsnl.com</li></ul></li>\r\n</ul>', '', 1, 2, 0, 43, '2008-10-28 18:25:07', 62, '', '2008-10-28 18:30:26', 62, 0, '0000-00-00 00:00:00', '2008-10-28 18:25:07', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 5, '', '', 0, 1, 'robots=\nauthor='),
(14, 'South - Central India Union', 'south-central-india-union', '', '<ul class="addressInformation">\r\n  <li>Spencer Road</li>\r\n  <li>Frazer Town</li>\r\n  <li>Bangalore 560 005</li>\r\n  <li>Karnataka</li>\r\n  <li><strong>Telephone</strong>:  91(080)255-671-27, 255-698-378</li>\r\n  <li><strong>Fax</strong>:  91(080)253-027-21</li>\r\n</ul>', '', 1, 2, 0, 43, '2008-10-28 18:33:16', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-10-28 18:33:16', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 4, '', '', 0, 1, 'robots=\nauthor='),
(15, 'Southeast India Union', 'southeast-india-union', '', '<ul class="addressInformation">\r\n  <li>197 GST Road, Vandalur</li>\r\n  <li>Chennai 600 048</li>\r\n  <li>Tamil Nadu</li>\r\n  <li><strong>Telephone</strong>:  91(044)223-995-95, 223-995-96</li>\r\n  <li><strong>Fax</strong>:  91(044)223-996-52</li>\r\n  <li><strong>E-mail</strong>:  <ul class="emails"><li>siu_sda@vsnl.net</li></ul></li>\r\n</ul>', '', 1, 2, 0, 43, '2008-10-28 18:36:36', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-10-28 18:36:36', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 3, '', '', 0, 1, 'robots=\nauthor='),
(16, 'Southwest India Union', 'southwest-india-union', '', '<ul class="addressInformation">\r\n  <li>B. No. 753, Evergreen Lane</li>\r\n  <li>Moospet Road</li>\r\n  <li>Thrissur 680 005</li>\r\n  <li>Kerala</li>\r\n  <li><strong>Telephone</strong>:  91(0487)244-0341, 244-0343</li>\r\n  <li><strong>Fax</strong>:  91(0487)-2440-343</li>\r\n  <li><strong>E-mail</strong>:  \r\n    <ul class="emails"><li>keusda@sancharnet.in</li></ul>\r\n  </li>\r\n</ul>', '', 1, 2, 0, 43, '2008-10-28 18:40:51', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-10-28 18:40:51', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 2, '', '', 0, 1, 'robots=\nauthor='),
(17, 'Western India Union', 'western-india-union', '', '<ul class="addressInformation">\r\n  <li>Post Box 1413, Market Yard</li>\r\n  <li>Pune 411 037</li>\r\n  <li>Maharashtra</li>\r\n  <li><strong>Telephone</strong>:  91(020)242-718-96, 242-718-9</li>\r\n  <li><strong>Fax</strong>:  91(020)242-730-20</li>\r\n</ul>', '', 1, 2, 0, 43, '2008-10-28 20:38:15', 62, '', '2008-10-28 20:52:51', 62, 0, '0000-00-00 00:00:00', '2008-10-28 20:38:15', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 1, '', '', 0, 4, 'robots=\nauthor='),
(18, 'Pastor R John Elected  to Succeed Pastor D R Watts as SUD President', 'pastor-r-john-elected-to-succeed-pastor-d-r-watts-as-sud-president', '', '<p><a href="images/stories/pastor-r-john.jpg"><img style="margin: 1px; float: left;" alt="pastor-r-john" src="images/stories/pastor-r-john.jpg" width="200" height="251" /></a><cite>Pastor D R Watts, who has been the president of Southern Asia Division (SUD) for more than ten years, decided to leave his office and move back to North America in order to be able to facilitate the treatment that Mrs. Dorothy Watts needed.</cite></p>\r\n<p><cite>Due to the vacancy that was being created, the General Conference (GC) decided to hold an election for a nominee to succeed Pastor Watts. Pastor L C Cooper, vice president for the General Conference, conducted the proceedings at the Northern India Union office. Pastor R John, secretary of the Southern Asia Division, was elected as the SUD nominee for the division presidency. At the GC Autumn Council in Manila in October, 2008, Pastor R John was elected as president of the Southern Asia Division. </cite></p>\r\n', '\r\n<p>–<em>Editor</em></p>\r\n<h3>Pastor R John—a brief background</h3>\r\n<p>Rathinaraj John was born in Kanyakumari at the southern tip of India on March 3, 1949. He attended a government school but moved to Spicer College where he worked his way through a degree in Religious Philosophy and a minor in Religious History, graduating in 1973. The South Tamil Section appointed him pastor of a high tithe-paying congregation and at the same time principal of a small boarding school. During the seven years he was there Pastor John established another two new churches and a day school.</p>\r\n<p>The South Tamil Section ordained him to the gospel ministry in 1979 and posted him to one of the church’s largest day schools in Madurai where he again served as church pastor in addition to his responsibility as principal. Pastor John moved to Pondichery as principal of our largest school in 1983 but only for a year since he was elected president of the South Tamil Section in 1984, a position he held till 1993. After three years he responded to a call to serve as principal of the James Memorial Higher Secondary School in the pioneer Adventist community of Prakasapuram. During this time he completed an MA in History and a B.Ed., but his school administration days were over.</p>\r\n<p>From 1996-1997 he served as president of the Karnataka Section and just a year later was elected president of the South India Union, which at that time included all of Andhra Pradesh, Tamilnad, and Karnataka. The membership grew under his leadership exceeding 80,000 members in over 1,000 churches, so in the year 2000 the Union was divided into three unions—East Central India, South Central India, and South East India. Pastor John moved from Bangalore to Chennai to the headquarters of the South East India Union serving as the president till 2005. At the General Conference Session in St Louis that year he was elected Secretary of the Southern Asia Division. Upon the resignation of Ron Watts this year, R John was nominated by an overwhelming majority to replace Elder Watts as Division President. Elder John’s wife Flora John coordinates the work of the Adventist Child India at the Division office. He has two married children, his son has a master’s degree in physiotherapy and is principal of a school; his daughter works at the Division Office. He has one grandchild.</p>\r\n<p>—<em>SUD Communication</em></p>', 1, 3, 0, 53, '2008-11-07 16:45:15', 62, '', '2008-12-12 05:43:25', 62, 0, '0000-00-00 00:00:00', '2008-11-05 16:45:15', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 11, 0, 33, 'President Southern Asia Division Pastor John', 'Pastor Rathinaraj John is elected to be Southern Division of Seventh-day Adventist President.', 0, 69, 'robots=\nauthor=Gordon Christo'),
(19, 'Bangalore Metro Section Becomes a Conference', 'bangalore-metro-section-becomes-a-conference', '', '<p>The Bangalore Metro Section (BMS) held its second Constituency Session on February 10, 2008 at the Seventh-day Adventist Pre-university College.</p>\r\n<p>It was on this particular day that the Section became a Conference.  Pastor D R Watts, president of Southern Asia Division (SUD), declared and inaugurated the new Conference.  Pastor Ramesh Jadhav, acting president of BMS, challenged the 287 delegates of the session during his keynote address entitled, “Lengthen Thy Cords and Strengthen Thy Stakes.”  Officers and department directors from the Division, East Central India Union (ECIU), and South Central India Union (SCIU) graced the occasion.</p>\r\n', '\r\n<p>Statistical, financial, and departmental reports were presented by the officers and departmental directors.  The nomination committee, under the chairmanship of Pastor D Padmaraj, president of SCIU, elected the following officers and departmental directors:</p>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td>President</td>\r\n<td>Pastor V R Sukumaran</td>\r\n</tr>\r\n<tr>\r\n<td>Secretary</td>\r\n<td>Pastor Stanley Daniel</td>\r\n</tr>\r\n<tr>\r\n<td>Treasurer</td>\r\n<td>Mr. Mikkili Paul</td>\r\n</tr>\r\n<tr>\r\n<td>Ministerial &amp; Global Mission</td>\r\n<td>Pastor Edward Robinson</td>\r\n</tr>\r\n<tr>\r\n<td>SS &amp; PM and Stewardship</td>\r\n<td>Pastor I Thavasekaran</td>\r\n</tr>\r\n<tr>\r\n<td>Youth &amp; Communication</td>\r\n<td>Mr. Sharath John</td>\r\n</tr>\r\n<tr>\r\n<td>Health &amp; Children’s Ministries</td>\r\n<td>Pastor S Pushparaj</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>Pastor R John, secretary of the Division, strengthened the delegates spiritually through a Bible study.  Plans and recommendations were presented for the growth of the Conference under the chairmanship of Mr. Ravindra Shankar.  The deliberations of the day concluded with the consecration of the newly appointed officers and departmental directors along with all the delegates and invitees of the session to be faithful to Jesus until He comes again.</p>\r\n<p>The Bangalore Metro Conference thanked the Lord for His leading and also SUD and SCIU for their support.  Greater challenges are ahead.  Please remember this newly formed conference in your prayers so that we could effectively and successfully complete God’s commission.</p>\r\n<p>–<em>Sharath John, Comm.  Director</em></p>', 1, 3, 0, 53, '2008-11-07 17:06:55', 62, '', '2008-11-07 07:43:59', 62, 0, '0000-00-00 00:00:00', '2008-11-05 17:06:55', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 32, 'bangalore metro section conference southern asia division', 'Bangalore Metro Section is now a Conference in the Southern Asia Division of Seventh-day Adventists.', 0, 47, 'robots=\nauthor='),
(20, 'New Church Building', 'new-church-building', '', '<p>On August 3, 2008, Vengal of Thiruvallur district, under the Chennai Metro Section (CMS), inaugurated a new church building through the generous contribution of the Gospel Outreach and other well wishers from the United States and the United Kingdom.  About 200 villagers including 60 church members gathered at the church premises.  The plaques were opened by Dr. S Johnson, TV Ministry director, and Pastor M Anbalagan, president of Chennai Metro Section.  Pastor William George, Gospel Outreach and Special Ministries director for the Southern Asia Division, inaugurated the church by cutting the ribbon and also delivered the inaugural message.  Mr. G Christopher, treasurer of CMS, led out in the responsive reading while Pastor M Anbalagan offered the dedicatory prayer.</p>\r\n<p>\r\n	This village was entered in 2006 by Pastor D Swaminathan and the Adult Literacy Programme was started by Mrs. Sumanthi Anbalagan, Women’s Ministries director for CMS.\r\n</p>\r\n<p>\r\n–<i>M Anbalagan, President</i>\r\n</p>', '', 1, 3, 0, 53, '2008-11-11 03:39:03', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-11-11 03:39:03', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 31, '', '', 0, 9, 'robots=\nauthor='),
(21, 'Madurai Adventist Higher Secondary School', 'madurai-adventist-higher-secondary-school', '', '<p>\r\nA week of prayer was conducted on August 18, 2008.  Pastor S Sundaram, president of South East India Union, spoke on the topic “What Seekest Thou?”  Mrs. Jean Sundaram on the other hand was the speaker for the primary section.  Her messages centered on the topic “For God So Loved.” \r\n</p>\r\n<p>\r\n	The school also celebrated the Independence Day with Pastor Jeeva Ponnappa as the guest speaker.  A variety of items were presented during the programme.\r\n</p>\r\n<p>\r\n–<i>Johnson Kinsley, Principal</i>\r\n</p>', '', 1, 3, 0, 53, '2008-11-11 03:41:42', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-11-11 03:41:42', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 30, '', '', 0, 15, 'robots=\nauthor='),
(22, 'Usilampatti', 'usilampatti', '', '<p>\r\nThe school conducted their week of prayer with Pastor Kalaiselvan, principal of Madurai North School, speaking on the “Power of Living.”  The children also learned many new songs during the week. \r\n</p>\r\n<p>\r\n–<i>Arul Koil, Principal</i>\r\n</p>', '', 1, 3, 0, 53, '2008-11-11 03:42:56', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-11-11 03:42:56', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 29, '', '', 0, 7, 'robots=\nauthor='),
(23, 'Neyveli, Cuddalore', 'neyveli-cuddalore', '', '<p>The theme for the school’s week of prayer was "Hand in Hand with Jesus."  Pastor Immanuel, from Kodambakkam Church, presented his messages with the help of a laptop computer and a projector.\r\n</p>\r\n<p>\r\n–<i>K. Boominathan, Principal</i>\r\n</p>', '', 1, 3, 0, 53, '2008-11-11 03:44:23', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-11-11 03:44:23', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 28, '', '', 0, 8, 'robots=\nauthor='),
(24, 'A Bible Seminary in Gujarat Conference', 'a-bible-seminary-in-gujarat-conference', '', '<p>The Gujarat Conference at Ahmedabad started a Bible Seminary at Lawchali, Songhad.  At present there are about 10 students from Vyara, Songhad, and Navpur areas.  Another 5 students are expected from the Saurashtra Region.  This course of study is for two years (four semesters).  We hope and pray that this Bible Seminary will continue for many years.  Please remember us in your prayers. \r\n</p>\r\n<p>\r\n–<i>Pastor Ramesh Rathod, Secretary</i>\r\n</p>', '', -2, 3, 0, 53, '2008-11-11 03:46:14', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-11-11 03:46:14', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 0, '', '', 0, 0, 'robots=\nauthor='),
(25, 'A Bible Seminary in Gujarat Conference', 'a-bible-seminary-in-gujarat-conference', '', '<p>The Gujarat Conference at Ahmedabad started a Bible Seminary at Lawchali, Songhad.  At present there are about 10 students from Vyara, Songhad, and Navpur areas.  Another 5 students are expected from the Saurashtra Region.  This course of study is for two years (four semesters).  We hope and pray that this Bible Seminary will continue for many years.  Please remember us in your prayers.</p>\r\n<p>\r\n–<i>Pastor Ramesh Rathod, Secretary</i>\r\n</p>', '', 1, 3, 0, 53, '2008-11-11 03:54:12', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-11-11 03:54:12', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 27, '', '', 0, 9, 'robots=\nauthor='),
(26, 'LE Recruitment in Madurai', 'le-recruitment-in-madurai', '', '<p>The South East India Union (SEIU) organized a union-wide LE recruitment  programme on August 17-20, 2008 in Madurai.  The South Tamil Conference (STC) made the necessary arrangements for the meeting.  Twenty-five dedicated volunteers attended the institute.  Besides the morning and evening devotionals, the methods and other techniques in sales were taught and promoted by Pastor N C Vincent, PDD, SEIU; Pastor Lincoln, Secretary, CMS; Elder Sam Selvaraj, PDD, STC; and Pastor Wilson, PDD, NTC.\r\n</p>\r\n<p> \r\n–<i>Pastor T Mohan, Comm. Dir.</i>\r\n</p>', '', 1, 3, 0, 53, '2008-11-11 03:54:51', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-11-11 03:54:51', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 26, '', '', 0, 13, 'robots=\nauthor='),
(27, 'James Memorial', 'james-memorial', '', '<p>Pastor John Wesley from Tanjore main church was the speaker for the week of prayer at Prakasapuram.  His messages focused on “For God So Loved You” in the morning and “Living the Life of the Life Giver” in the evening.  One precious soul was baptized by Pastor Ambrose  S.\r\n</p>\r\n<p>\r\n–<i>Mr. Arulanandan, Teacher</i>\r\n</p>', '', 1, 3, 0, 53, '2008-11-11 03:57:00', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-11-11 03:57:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 25, '', '', 0, 7, 'robots=\nauthor='),
(28, 'Vadavathoor Seventh-day Adventist High School', 'vadavathoor-seventh-day-adventist-high-school-', '', '<p>Vadavathoor Seventh-day Adventist High School is getting a 100% result every year with high marks in the ICSE examination.  There are many other ICSE schools around so there is great competition in getting students to attend each of these schools.  They still have various needs but God has been gracious to the school family.  Do remember them in your prayers.\r\n</p>\r\n<p>\r\n–<i>Mr. E John Varghese, Teacher/Librarian</i>\r\n</p>', '', 1, 3, 0, 53, '2008-11-11 03:58:10', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-11-11 03:58:10', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 24, '', '', 0, 12, 'robots=\nauthor='),
(29, 'First Naga Woman Doctor is the first Adventist in Nagaland', 'first-naga-woman-doctor-is-the-first-adventist-in-nagaland-', '', '<p>Dr. K K Angami was born in 1918 but she cannot remember the date.  She passed her matriculation from the West Mission’s School in Shillong in 1940 after which she pursued an IMS from Ludhiana, Punjab.  It was during that time that the Civil Hospital was bombed and things had to be transferred to a makeshift hospital at the boys’ hostel in the mission compound.  She then moved on to work at the Guwahati Civil Hospital for a year.  A certain dentist from the hospital went on maternity leave and so she applied for the job and was employed.  She was, however, transferred to Ganesh Das Hospital for Women and Children in Shillong around 1949-50.  It was at this time that an Assamese superintendent encouraged her to go for an MBBS, which was a condensed two-year course.  She went to Dibrugarh to pursue her MBBS, thus becoming the first Naga woman doctor.</p>\r\n', '\r\n<p>During one of those days while in Shillong, she attended an evangelistic meeting conducted by Pastor D K Dawn from Australia.  Touched by the message the lady became a Seventh-day Adventist in January 1956 and became the first Adventist from Nagaland.</p>\r\n<p>\r\nDr. Angami returned to Nagaland in 1957 and served at the Naga Hospital where her first posting was that of a medical officer at Tuenseng.  She then became the civil surgeon at Naga Hospital and later became its director.  She retired serving as the director of Medical Services in 1978.\r\n</p>\r\n<p>\r\nOne vivid image that remained with her of her childhood was that of her mother standing upon the freshly dug grave of her sister, who passed away, with outstretched arms asking the men to give her the body of her dearest departed daughter to bury.  That was to her an embodiment of a mother’s affection.\r\n</p>\r\n<p>\r\nWhen asked about her opinion about the present generation, she expressed that the youth of today are becoming more brilliant and they have more opportunities to explore the world.  Then she added that they (we) should not forget the fact that as Christians we have to follow principles and our lives should reflect our faith. We should not be just namesake Christians.\r\n</p>\r\n<p>\r\nDr. Khrielie-u Kire Angami has no regrets and does not wish to be remembered in any way when she is gone.  She is now in her 90’s and lives a peaceful single life.  She assisted with the missionary work in the state and founded the Lay Evangelistic Band of Seventh-day Adventists Nagaland starting with T D Chiru as the leader in 1982.  The group celebrated their silver anniversary on Dr. Angami’s birthday in January, 2008.  Besides her contribution to the state health services she supports the church at various levels as a dignitary.\r\n</p>\r\n<p>\r\n–<i>Angam Palmei, Teacher in charge, Nagaland Adventist School</i>\r\n</p>', 1, 3, 0, 53, '2008-11-11 04:01:48', 62, '', '2008-11-11 04:06:50', 62, 0, '0000-00-00 00:00:00', '2008-11-11 04:01:48', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 23, '', '', 0, 36, 'robots=\nauthor='),
(30, 'Dr. Srikakolli Eliah Awarded a Ph. D', 'dr-srikakolli-eliah-awarded-a-ph-d-', '', '<p>Dr. Srikakolli Eliah commenced his professional career in 1989 as a teacher at the SDA school in Maninagar, Ahmedabad.  His academic journey reached an apex when he was awarded a Ph. D by Tilak University, Pune for his doctoral thesis on the “Causes and Consequences of Environmental Degradation.”   In addition to this doctoral degree, he has also completed an M. Phil, MBA (HRM), MA (Eco.), MA (Political Science), and a B. Ed.\r\n</p>\r\n<p>\r\nDr. Eliah has made contributions to the field of education and he has been recognized in numerous ways.  Apart from being a committed administrator, he is also an excellent teacher.  He received “The Best Teacher Award” twice (1994, 1997).  Students praise him for his amiable and caring manner, the clarity of his lectures, and his thorough and total preparedness.\r\n</p>\r\n<p>\r\nHe was appointed as the principal of the SDA boarding school at Vyara for two years.  His innovative methods saw the school change from a declining one to a leading school of the area.  Some of the outstanding achievements of Dr. Eliah are:\r\n</p>\r\n<p>\r\n<ol>\r\n<li>Best Registrar Award from Southern Adventist University (Tennessee, USA) while he was the registrar of METAS Adventist College, 2000—2002.</li>\r\n<li>Best Principal Award from the National Science Olympiad, New Delhi, 2005.</li>\r\n<li>Featured in the 4th edition of Asian/American “Who’s Who Almanac.”</li>\r\n<li>Recognized by the International Publishing House as a noteworthy citizen of the country.</li>\r\n</ol>\r\n<p>\r\nEach step in his career has always been a new challenge that he has embraced with energy, commitment, and vision.  We are blessed to have such a young, dynamic, and intellectual educator here in Southern Asia.</p>\r\n<p>\r\n–<i>Mr. Suresh Prasad, Registrar, METAS</i>\r\n</p>', '', 1, 3, 0, 53, '2008-11-11 04:08:50', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-11-11 04:08:50', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 22, '', '', 0, 9, 'robots=\nauthor='),
(31, 'Adventist Student Ranked Well In All India Level IIT Entrance Exam', 'adventist-student-ranked-well-in-all-india-level-iit-entrance-exam', '', '<p>\r\nMaster Kalla Rajendra Kumar is the eldest son of Mr. K John Prasad who is a teacher at the Asian Aid School for the Blind in Bobbili, Andhra Pradesh.\r\n</p>\r\n<p>\r\nRajendra studied at the Seventh-day Adventist School at Baljepeta under the guidance of its principal, Mrs. Mary V Rathnam.  He secured an A grade in the 10th level and he joined the Corporate College for the plus two program.  \r\n</p>\r\n<p>\r\nThe total number of candidates that appeared for the IIT entrance exam was ten lakh fifty thousand from all over India.  Rajendra ranked 242 in his category and 1893 in the common merit list.  He said that he totally depended on God because he did not have intensive coaching.  We join the family in their rejoicing and they would like us to remember them in our prayers.\r\n</p>\r\n<p>\r\n–<i>G Gopala Rao, Headmaster, Bobbili</i>\r\n</p>', '', 1, 3, 0, 53, '2008-11-11 04:11:37', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-11-11 04:11:37', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 21, '', '', 0, 7, 'robots=\nauthor='),
(32, 'Southwest India Union Children’s Ministries First Quarter, 2008', 'southwest-india-union-childrens-ministries-first-quarter-2008-', '', '<h3>South Kerala</h3>\r\n<p>The Children’s Ministries Department conducted three Junior Sabbath School Training Programs in three places—Manthottam , 22 members attended; Kowdiar, 60 members attended; and Punnakari, 110 members attended.  Vacation Bible School (VBS) was conducted in 38 places.</p>\r\n', '\r\n<h4>Highlights:</h4>\r\n<p>Mylam is a remote place where there is no church school.  Members of the Karickom Malayalam church along with the director from South Kerala Section (SKS), Mrs. Annamma Jacob, started a VBS there.  Thirty children attended the VBS which was conducted in the house of a non-Adventist family.  Certificates were given to the children on the last day of the program.</p>\r\n<p>Kattakada East had a VBS in the church.  Forty five certificates were awarded to the children who attended the VBS and gifts were given to the winners of various competitions.</p>\r\n<p>Perappincode conducted a Vacation Bible School for 10 days.  On the closing day, the children had a rally where various programs were presented and several prizes were given. Forty-eight certificates were distributed among those who attended the VBS classes.</p>\r\n<h3>North Kerala</h3>\r\n<p>In this Section the VBS and Junior Sabbath School Training program was conducted in all four districts.  More than 50 people attended each training program.  One thousand kits were distributed for VBS.  The training classes wee conducted by Mrs. Sosamma Varghese, Southwest India Union (SWIU) director; and Mrs. Soosanna Mathew, North Kerala Section (NKS) director.  The program helped the church members in conducting Vacation Bible Schools in their respective places.</p>\r\n<p>Thrissur church has started a Branch Sabbath School in a place called Ayyamkunnu, near Nadathara.  Most of the children in this place are non-Adventists.  A VBS was also held here.</p>\r\n<p>The Section also had a retreat for the Kindergarten and Power Point children at Peechi Dam.  Thirty-eight children and ten adults attended the retreat and North Kerala Section provided the food.</p>\r\n<h3>Alappuzha-Pathanamthitta Section</h3>\r\n<p>This Section had VBS training program and a Junior Sabbath School training program.  Thirty members attended the classes, VBS was conducted in twelve places, and four hundred kits were distributed.</p>\r\n<h3>Idukki Section</h3>\r\n<p>Mrs. Saramma Stephenson, director of Idukki Section, conducted the Junior Sabbath School training program at Nirmala city in January, 2008.  Twenty eight members attended the class.</p>\r\n<p>In Pallikunnu, Pastor John Philip and Pastor Stephenson had a training program on child care on March 15, 2008 and seventy people were present.  The following day, a VBS training program was conducted at Nirmala city and seventy-three people attended the training classes.  The resource personnel were Mrs. Sosamma Varghese, director of Children’s Ministries for SWIU; and Pastor R Stephenson, president of the Idukki Section.  They started a VBS program in six new places and also continued the VBS in the regular places such as the schools and churches.</p>\r\n<p>–<em>Sosamma Varghese</em></p>', 1, 3, 0, 53, '2008-11-11 04:13:26', 62, '', '2008-11-11 04:18:39', 62, 0, '0000-00-00 00:00:00', '2008-11-11 04:13:26', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 20, '', '', 0, 15, 'robots=\nauthor='),
(33, 'East Central India', 'east-central-india', '', '<h3>Elders’ Training</h3>\r\n<p>In February, 2008 the East Central India Union (ECIU) SS/PM Department conducted a training program in Ibrahimpatnam for elders.  More than 50 attended.  Pastor Ch John inaugurated the program with a timely message.  Pastor G W Kore, SS/PM Director; and Dr. M Wilson, Ministerial Secretary, from the Division gave valuable instructions to the elders.</p>\r\n', '\r\n<p>This training was the first of its kind in the union and it helped the elders realize their importance and their responsibilities in the development of their individual churches.  During the closing ceremony, the elders pledged to share their light to their neighbouring villages and neighbours by lighting the candle.  Many of them expressed that the training gave them a lot of inspiration to go and strengthen their church.</p>\r\n<p>In June, 2008, the <strong>South East Andhra</strong> Section, in Ongole organized an elders’ training for their church elders.  The Section is divided into 11 circles and under the leadership of Pastor Ch John Victor, Pastor M V Sathyam, and Mr. Y Subhakar Rao, a one-day elders’ and lay people’s training program was conducted.  More than 150 lay persons and elders from various circles attended and were enriched by the valuable instructions given by the Union SS/PM Director.  They were taught to understand their role in the strengthening of their local churches as well as their duties and responsibilities as elders of the church.  They all expressed that they understood the role of an elder in the church and their responsibilities in the growth and expansion of the Church.</p>\r\n<h3>Youth Convention</h3>\r\n<p>The Youth Convention for ECIU was held in Ibrahimpatnam, Andhra Pradesh, in June 2008.  The convention was inaugurated by Dr. Lionel Lyngdoh, who is the youth director for the Division; and addressed by Pastor Ch John, president of ECIU.  More than 200 young people gathered along with the youth directors of all the Sections to encourage the youth.</p>\r\n<p>The theme of the convention was “It’s Time to Love, Care and Serve, and Tell the World.”  Pastor J G Paulson, Union director, dedicated the young people to love, care, and serve the dying world.  The young people pledged to strengthen their local churches by their active participation.</p>\r\n<h3>Europe for Jesus (E4J)</h3>\r\n<p>A team of young people have come from Europe to witness for Christ.  They spent two weeks in Khammam district and conducted health lectures and revival meetings in 20 villages.  I was one of the interpreters for 20 teams.  Chinna Manugala village is 35 km from Kahammam town.  We visited every house in this village to pray for the sick and needy.  We presented the health message and preached Jesus to these villagers.</p>\r\n<p>The resource persons were Miss Sarah and her brother, Samuel, and Miss Nina from Germany.  They enjoyed witnessing for Christ.  Europe for Jesus was successful under the guidance of the Holy Spirit. –<em>J G Paulson, Director SS/PM &amp; Youth, ECIU</em></p>\r\n<h3>Sabbath School Workshop</h3>\r\n<p>At Nandyala, the North Rayalaseema Region (NRR) organized a Sabbath School workshop in June, 2008.  More than 125 Sabbath School officers and elders were present.  Pastor G W Kore inaugurated the workshop and Pastor Paulson translated the sessions.</p>\r\n<p>Pastor Kore spoke about the organization of the Adventist Church and the importance of Sabbath School Services in every church.  Pastor Paulson demonstrated how Sabbath School is conducted. The members learned the importance and the method of conducting Sabbath School services in every church and promised to conduct Sabbath School regularly in their churches. –<em>P Uttam Kumar, Sec/Treasurer, NRR</em></p>', 1, 3, 0, 53, '2008-11-11 04:39:01', 62, '', '2008-11-11 04:47:06', 62, 0, '0000-00-00 00:00:00', '2008-11-11 04:39:01', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 19, '', '', 0, 12, 'robots=\nauthor='),
(34, 'Raymond Memorial Inaugurates  New Wing of School building', 'raymond-memorial-inaugurates-new-wing-of-school-building-', '', '<p>The Higher Secondary School at Falakata inaugurated eight classrooms and two halls on May 20, 2008.  The inauguration commenced with addresses given by the officers of the Northern India Union president, Pastor Hidayat Masih; the secretary, Pastor Ezras Lakra; and the treasurer, Mr. Alamgir Khan.  The plaque was also unveiled by the officers.\r\n</p>\r\n<p>\r\n	The school faced a scarcity in classrooms and makeshift classrooms were put up at the four corners of the chapel, the Bachelors’ Quarters, and the cafeteria.  The administration, with the approval of the Division and the Union, took up the project of adding the rooms and the halls.  \r\n</p>\r\n<p>\r\n	Mr. S N Agarwal, a well-wisher and a friend of the school family for more than 30 years, opened the new wing of the school building.  The school family, section officers, retirees, church members, parents, students, former students, friends, and well wishers attended the occasion.  \r\n</p>\r\n<p>\r\n	The school administration honoured the Union officers and the principal thanked everyone for gracing the occasion.  We also thank the Division and Union officers for supporting this project.\r\n</p>\r\n<p>\r\n–<i>Johnny Murumu, Teacher</i>\r\n</p>', '', 1, 3, 0, 53, '2008-11-11 05:03:45', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-11-11 05:03:45', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 18, '', '', 0, 12, 'robots=\nauthor=');
INSERT INTO `jos_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(35, 'Nagaland Region', 'nagaland-region', '', '<h3>Prophetic Crusade at Peren</h3>\r\n<p>Peren is one of the eleven district headquarters in Nagaland.  The believers in Peren suggested that a crusade be held in December so that more people could attend.  The believers were not impressed when the meetings were scheduled for February, 2008 because the Nagaland Assembly election was about to be held and the people were busy preparing for it.  It is not easy to win souls in Nagaland.</p>\r\n', '\r\n<p>It was drizzling and chilly the day the Prophetic Crusade started in the Town Hall so only around 60 people turned up for the meeting that night.  Dr. L C Colney, president of the Northeast India Union, delivered the prophetic messages every night after Mr. Dharmo Kamei, lecturer at the Adventist Bible Seminary, shared the health message.  Since it was rainy and cold in the nights, it was expected that people would not turn up but to everyone’s amazement more and more people turned up every night until the hall was filled to capacity.  During the mornings, a special session of workers’ training program was held.</p>\r\n<p>When the message about the Sabbath and the mark of the beast was presented, it was expected that the people would not turn up the following night.  The next night more people came and they kept coming every night until some had to stand outside in order to listen to the message.  The people commented that the messages were new to them and the 16 days seemed just a few days.  About 10 people were expected to commit their lives through baptism but in the end 18 precious souls decided to follow Jesus.</p>\r\n<h3>Leadership Training Seminar at Samziuram</h3>\r\n<p>Samziuram is situated 50 km south of Simapur.  Samziuram church hosted again the Region Leadership Training Seminar under the Go Five Million in June 2008.  Pastor Z Renthlei, SS/PM director of Northeast India Union, was the resource person.  There were 36 registered delegates and study kits were provided but it was limited so some of the delegates did not receive a kit.  It was one of the most interesting seminars and the delegates pledged to try and win one soul each for Christ.</p>\r\n<p>–<em>Moses Shimray, Director</em></p>', 1, 3, 0, 53, '2008-11-11 05:05:19', 62, '', '2008-11-11 06:11:12', 62, 0, '0000-00-00 00:00:00', '2008-11-11 05:05:19', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 17, '', '', 0, 20, 'robots=\nauthor='),
(36, 'Hyderabad Visited', 'hyderabad-visited', '', '<p>The Southern Asia Division office workers were eager to go on a trip to visit Hyderabad.  It has been many years since the office staff went for such a trip and so this excursion was a welcome break.</p>\r\n', '\r\n<p>The group left the campus on Sunday evening, September 21, for Bangalore where they were boarding the train for Hyderabad.  On Thursday morning, September 25, they boarded the same train to come back home.</p>\r\n<p>The staff spent three days in Hyderabad and enjoyed visiting different places.  On the first day they climbed Golconda Fort where they were greatly entertained by the stories that the guide related.  Later in the afternoon the group visited the Safdarjung Museum.   In the evening they went to the waterfront   where some went for a boat ride while others played in the water and got wet.  When it got darker the group moved next door to where the dancing fountains are for a very remarkable laser show.  The second day saw the group rising early to get ready for a long ride to Ramoji Film City.  Everyone enjoyed the programs and the shows as well as the rides.  Then in the evening the group walked around the NTR Gardens.  On the third day the group stopped by Charminar before leaving for Snow World where many enjoyed the frozen experience in spite of the rock-hard, slippery ice.  After lunch one group went to the water park while the others went shopping.  Everyone came back later in the afternoon to get ready for the return home.</p>\r\n<p>The Union office and the school hosted lunch for the first and the last days respectively.  The division staff is very grateful to the Social Committee for this opportunity.  We are also grateful to the Division for making the excursion possible this time.</p>\r\n<p>–<em>rmc</em></p>', 1, 3, 0, 53, '2008-11-11 06:02:59', 62, '', '2008-11-11 06:06:18', 62, 0, '0000-00-00 00:00:00', '2008-11-11 06:02:59', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 16, '', '', 0, 20, 'robots=\nauthor='),
(37, 'New Headquarters Theni-Periyakulam Region', 'new-headquarters-theni-periyakulam-region-', '', '<p>Theni-Periyakulam Region was bifurcated from South Tamil Conference in April 2002.  The region had its very humble beginning with only three churches and a company.  Now, by God’s grace, the Region has twenty-four congregations and 13 new churches.</p>\r\n', '\r\n<p>The headquarters of the region was functioning in a rented building for the past five years. Now a beautiful building with residential quarters was constructed at the State Bank colony, Periyakulam.  Twenty-five years after its establishment by Pastor P V Jesudass, an attractive church building was constructed in 2007 on the same premises.  The members had been worshipping in a small classroom in the school campus.  The believers are overwhelmed with joy that the Lord has provided them a church.</p>\r\n<p>The Region headquarters was inaugurated and dedicated by Pastor S Sundaram, President of Southeast India Union (SEIU); and Pastor Enoch Manickam, Treasurer, SEIU on May 11, 2008.  A full fledged region office is now functioning at Periyakulam.  Our sincere thanks to the Division and the Union officers for their financial and moral support in having our own headquarters built.  Please pray for the development of the region.</p>\r\n<p>–<em>D Arthur Devasingh, Director</em></p>', 1, 3, 0, 53, '2008-11-11 06:07:06', 62, '', '2008-11-11 06:10:05', 62, 0, '0000-00-00 00:00:00', '2008-11-11 06:07:06', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 15, '', '', 0, 12, 'robots=\nauthor='),
(38, 'Children from School for the Blind Featured on Radio', 'children-from-school-for-the-blind-featured-on-radio-', '', '<p>\r\nIt was a proud moment for the children at the Asian Aid School for the Blind, Bobbili, to participate in the All India Radio Programme at Visakhapatnam and sing patriotic songs with an orchestra in connection with the Independence Day on August 15, 2008.\r\n</p>\r\n<p>\r\n	At 4 p.m. on August 13, 2008, the children went to the radio station with high spirits and a lot of enthusiasm.  They were accompanied by their teachers to the recording studio where the children recorded for the All India Radio broadcast.  The children were given 25 minutes and they did their best.  The program was appreciated by the radio directors and it was aired the next day.  The children gathered in the main hall back at the school to listen to the program.\r\n</p>\r\n<p>\r\n	A participation certificate was given by the Central Government of India in appreciation of the program that was presented.</p>\r\n<p>\r\n–<i>Pastor J Paulson, Principal</i>\r\n</p>', '', 1, 3, 0, 53, '2008-11-11 06:11:29', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-11-11 06:11:29', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 14, '', '', 0, 15, 'robots=\nauthor='),
(39, 'SSLC Student Given Special Day Exam  Instead of Sabbath Exam', 'sslc-student-given-special-day-exam-instead-of-sabbath-exam-', '', '<p>\r\nThe government in Kerala gave Cibin Mathew son of Pastor V M John Mathew, who is the secretary-treasurer of Idukki Section, a Special Day Examination when he refused to write one SSLC examination which fell on Sabbath.  Two other children, Jincy Monachan and Remya Raju, went to the High Court and they got a Court Order to write the examination after 6 p.m. on Sabbath.\r\n</p>\r\n<p>\r\n	There was a lot of media coverage about Sabbath keeping and the Adventist church.  Many were supportive of the boy’s stand and even gave him, and the other two students, cash awards for being firm.  He later wrote the examination and passed.  He is now studying in the higher secondary school at Kottarakkara in Kerala.\r\n</p>\r\n–<i>V M John Mathew, Section Secretary/Treasurer</i>\r\n</p>', '', 1, 3, 0, 53, '2008-11-11 06:13:42', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-11-11 06:13:42', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 13, '', '', 0, 22, 'robots=\nauthor='),
(40, 'Leadership Training for Presidents', 'leadership-training-for-presidents', '', '<p>For the 2008 leadership training seminar, the presidents of the Division units and institutions met at the Kufri Holiday Resort 9000 ft in the Himalayan foothills above Shimla amidst pine trees and cloud-draped hills.  The Seminar began without the Division president Pastor Watts who had requested an extension of his leave to care for his wife.  The delegates keenly felt his absence as a ship without a captain but vice presidents Dr. M C John and Dr. Gordon Christo sailed the ship smoothly in his absence.  The sessions regularly included prayers for healing on behalf of Mrs. Watts.  Due to the floods, the Orissa delegates were unable to attend. This year’s training session was funded by the General Conference.  Dr. Raj Attiken, alumnus of Spicer (BLA,’71. BTh, ’72), president of the Ohio Conference in the North American Division for more than ten years accepted the invitation to be the main resource person.  Dr. Attiken is a native of Sri Lanka and co-brother of Dr. Wilmott and Pastor Johnson Koilpillai.</p>\r\n', '\r\n<h3>July 8 Inaugural Session</h3>\r\n<p>Pastor Hidayat Masih and Pastor Robin Ram, Northern Union and North India Section presidents respectively, welcomed all the delegates in a unique fashion.  They placed Himachali embroidered caps on each head. Dr. John delivered the keynote address and Dr. Raj Attiken introduced his topics.  A prayer session after the inaugural session set off the seminar on a spiritual track.</p>\r\n<h3>Wednesday, July 9</h3>\r\n<p>\r\n 	Dr. Christo and Dr. John presented papers based on material prepared by the General Conference and Dr. Attiken presented stimulating material.  For some years now, Dr. Attiken has been trying to innovate in his conference with creative approaches on leadership.  The topics for this day were “The One Thing that Changes Everything,” and “Surviving and Thriving Amidst the Perils of Leadership.” In the evening the delegates walked down to the Himalayan animals’ zoo.  Dr. Colney had a really close look at the snow leopard practically shaking hands with it.   \r\n</p>\r\n<h3>Thursday, July 10</h3>\r\n<p>  	Dr. Colney opened the day’s proceedings with an inspiring devotion on God’s leading in his personal life.  Dr. Christo conducted the open session fielding questions from delegates on issues in the field and guiding the discussion.  The Union presidents formed the panel which responded to the questions.  Dr Attiken presented further talks on “Who’s Keeping Score,” and “It’s Not a One-man Show.” In the afternoon Mohan Roy took the delegates on a tour of Shimla and in the evening he arranged for a cultural show of Himachali dances. The troupe invited the delegates to try the steps.\r\n</p>\r\n<h3>Friday, July 11</h3>\r\n<p>\r\n 	After the final session from Dr. Attiken on “Meetings that Kill,” Dr John wound up the training session with his closing remarks.  The delegates felt that it was one of the best of such training programs that they had attended.  They identified easily with Dr. Attiken, and he adapted quickly to the delegates. With a good rapport, it was easy to exchange ideas. Having a background in south Asia gave Dr. Attiken an advantage in preparing for these meetings.\r\n</p>\r\n<p>  	The Kufri Holiday Resort did a wonderful job of arranging the meeting places and preparing delicious food for each meal.  They even prepared several south Indian dishes for breakfast.  Many thanks to Pastor Mohan Roy who arranged for the hotel.  He negotiated a very good off-season rate for the seminar.   Most of all the delegates appreciated the opportunity to be in a popular resort and to enjoy the ambience of the Shimla hills.   The setting was very conducive to meditation and contemplation of the business.\r\n</p>\r\n<p>\r\n-<i>SUD Communication</i>\r\n</p>', 1, 3, 0, 53, '2008-11-11 06:16:21', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-11-11 06:16:21', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 12, '', '', 0, 34, 'robots=\nauthor='),
(41, 'Northeast Adventist College Acquires and Dedicates New Sound System', 'northeast-adventist-college-acquires-and-dedicates-new-sound-system-', '', '<p>Northeast Adventist College (NAC), located in Thadlaskein, Meghalaya, is very colourful with young people coming from the different nooks and corners of northeast India.  The people of this region are naturally gifted with melodious voices and musical talent.  Over the years the church at NAC has been blessed, especially in church music, by these beautiful young people.  Their musical talents, however, have not been used effectively and extensively due to a poor church sound system.</p>\r\n', '\r\n<p>In November, 2007, a few of the staff members of the college, during a casual conversation, came up with the idea of raising funds for a modern sound system for the church, which was later shared with the Church Board.  The Board accepted the proposal and set up a fund-raising committee comprising of Mr. Prosperity Lamare, chairman; Mr. Koberson Langhu, secretary-treasurer; Mr. Daniel Thaimei; Mr. Aibor Sohklet; and Mrs. C Partei.  The committee actively planned and successfully implemented the entire fund-raising program such as printing and sale of college calendar, sale of spirit of prophecy books, sale of gospel CDs and cassettes, food sale, as well as donations from individuals and organizations.</p>\r\n<p>Group students under the guidance of staff members went to villages and towns to sell the calendars, books, etc, in the open streets and markets often in the heat of the day.  A variety of delicious food items were also sold on campus by the staff members towards this project.  Within a span of six months that was filled with toil, sweat, and determination, a total amount of Rs.3,21,000 was raised.</p>\r\n<p>An attractive and precious set of modern sound system (16 channel peavey mixer, 2 power amplifiers, 2 mid-high speakers; 2 bass bins, equalizer, crossover, mikes with stands, a Yamaha keyboard, snake cable, stabilizer, speaker stands, etc.) was purchased in June, 2008 and dedicated in July 2008 by Pastor (Dr.) K B Kharbteng, president of the Khasi-Jaintia Conference in Shillong.  The new sound system will be used solely for religious purposes to encourage and motivate the young people in developing their musical talents and using their talents more effectively for the glory of God.</p>\r\n<p>This has been a dream come true for the church, made possible by the generous contributions from various individuals and corporate bodies besides the untiring help rendered by the students of the college.  The Church would like to especially thank every church member, student, individual, and corporate body that has been a part of this noble project.</p>\r\n<p>–<em>Koberson Langhu</em></p>', 1, 3, 0, 53, '2008-11-11 06:21:32', 62, '', '2008-11-11 06:27:55', 62, 0, '0000-00-00 00:00:00', '2008-11-11 06:21:32', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 11, '', '', 0, 18, 'robots=\nauthor='),
(42, 'Top of the World', 'top-of-the-world', '', '<p>Recently I travelled to Kathmandu, Nepal, with my husband and our church pastor.  We went there for some work but we came away from Nepal doubly blessed.</p>\r\n', '\r\n<p>We visited companies and churches in Nepal.  The special feature of the companies and churches in Nepal is the average age of their members.  Most of them are between 16 to 20 years old but they are taking a very active part in the church meetings.  They are helping out in organizing their respective groups and leading out in their church services.  These are not AY programs, these are worship services.  They sing songs, study the Bible, and listen to messages.  It is a blessed experience to meet young people who are so enthusiastic for the Lord.</p>\r\n<p>But that’s not the end of our blessed experience.  While in Nepal, we learned about the bomb blasts in Delhi.  We did not panic but we wondered whether it might be safe to travel back to Delhi the day after the blasts.  We also needed to do some work there before going back home.</p>\r\n<p>We prayed for God’s protection.  While sitting inside the vehicle that was taking us to the airport, I silently talked to the Lord not just for protection but also for the opportunity to see at least one of the Himalayan Mountains.  Many people go to Nepal to see the Himalayas but this was during the rainy season and, although we had a glimpse of one of the mountains on Sabbath morning, the clouds constantly covered the mountain range.  We did not see the mountains from the plane as we flew into Kathmandu because of the dense clouds.</p>\r\n<p>My tongue and my mind pushed me to ask God to use this opportunity as an assurance, a sign that we will not be in danger in Delhi and we can move around if we are careful.  I was a little hesitant.  What if God doesn’t let us see the mountain from the plane?  Does that mean that we will not be safe in Delhi?</p>\r\n<p>We flew into the Kathmandu sky and were enveloped by clouds in no time but I felt that we will be able to see some of the Himalayan range.  Anyway, I left it to the Lord and after a little while we had the first glimpse of one of the mountains.  Then another came into view until we could see a whole range sticking above the clouds from a little distance away.  The mountains were covered with snow but bathed in sunshine and looked magnificent just below eye level through the plane’s windows.</p>\r\n<p>I asked to see a mountain and was given to see a mountain range.  That was assurance a thousand times over!  A little while later, our pastor pointed out below us a rainbow— a sign of God’s promise.  I was elated.  What more could we ask?  We were actually watching God’s special wonders unfolding before us.  This was indeed a literal top of the world experience!</p>\r\n<p>-<em>Rosenita Christo</em></p>', 1, 3, 0, 53, '2008-11-11 06:25:28', 62, '', '2008-11-11 06:27:24', 62, 0, '0000-00-00 00:00:00', '2008-11-11 06:25:28', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 10, '', '', 0, 34, 'robots=\nauthor='),
(43, '404', '404', '', '<h1>404: Not Found</h1>\r\n<h4>Sorry, but the content you requested could not be found</h4>', '', 1, 0, 0, 0, '2004-11-11 12:44:38', 62, '', '2008-11-12 12:12:17', 0, 62, '2004-11-11 12:45:09', '2004-10-17 00:00:00', '0000-00-00 00:00:00', '', '', 'menu_image=-1\nitem_title=0\npageclass_sfx=\nback_button=\nrating=0\nauthor=0\ncreatedate=0\nmodifydate=0\npdf=0\nprint=0\nemail=0', 1, 0, 0, '', '', 0, 752, ''),
(45, 'Christians and Dowry', 'christians-and-dowry', '', '<p>We see in the Bible that the family share was given to the girls and also to the boys by the father.  Caleb gave a share of his property to his daughter.  I agree that dowry is misused by money-mongers and greedy people.  But the subject must be rightly presented.\r\n', '\r\n</p>\r\n<p>I believe that dowry must be given in justice.  That means, if a father has property worth Rs. 5 lakh and three children, each child is eligible for a portion of it equally divided for the three and also parents.  It means each child is eligible for property or its value of Rs. 1. Lakh.</p>\r\n<p>The family can decide whether they want to give the family share at a later stage or Rs. 1 Lakh as her share at the time of marriage.  For example, if a family in Chennai is arranging the marriage for the daughter in Hyderabad, the boy will be happy to have the value in cash rather than getting one fifth of an apartment after the father and mother will die.</p>\r\n<p>So I strongly believe that this must be discussed with an open mind as the marriage relationship is discussed and settled before the marriage, so that there will not be any misunderstanding or fight or court cases after years, which will strain the relationships.</p>\r\n<p>Is it not true that there are many cases of injustice done to the daughters by the parents by giving only a meager amount or a land that produces nothing, to the daughters?</p>\r\n<p>So, there must be justice from the boy and the girl as well as parents of both.  If a father will say that he has property or cash worth Rs. 5 lakh with three kids, it is pagan and cruel for the boy’s parents to demand more than Rs. 1 Lakh.  It is barbaric and pagan to give only Rs. 25, 000/-.  Let there be justice.</p>\r\n<ol>\r\n<li> A father must give the equal share either at the time of marriage or on a date determined on mutual understanding. </li>\r\n<li> It is ironic for the boy to demand from the girl more than what she deserves from her family.  It is better for such people to sit by the road side and beg. </li>\r\n<li> It is also ironic for the boy’s family to demand marriage expense from the girl’s family.  The girl’s family must meet the girl’s marriage expenses and the boy’s family must meet their marriage expenses. </li>\r\n<li> The boy’s family has no right to use the girl’s dowry for their personal or family use.  The girl’s family is giving her share-like the boy will get his family share-and both must be a joint investment for the boy and girl who have become one. It must not be my share or your share, but our share. </li>\r\n<li> If a family is forced to use the money that the girl’s family has given to the girl, to acquire more land or other family needs like the marriage of a girl in the boy’s home-the boy must be given extra property by his family so that the loss incurred by the daughter-in-law is replenished. </li>\r\n<li> What is given, whether it is cash, gold or property, the boy must be willing to give a proper receipt so that there will not be any argument over the same at a later stage. It must be in writing. </li>\r\n</ol> Years back, I made the following statement through my magazines:- <ol>\r\n<li> I will talk against people bargaining for more money from the girl-more than the girl actually has as her family share. </li>\r\n<li> I will also talk against people who do injustice to girls by giving less family share so that their boys can have more. </li>\r\n<li> I will not attend a wedding where dowry is bargained. I have arranged marriages of my three children-two boys and a girl.  I did not give any dowry to my daughter because I did not still do not-have any property or money in the bank. I did not take any dowry for my two boys. </li>\r\n</ol>\r\n<p>The Bible says that the first son is eligible for double portion of family inheritance. In most of the families, the first son contributes much.  but why is it that no one talks about it.  The parents must give double portion to those who contributed much for the family-whether it is first or second child.  And finally, they have the right to leave their portion to those who took care of them in their old age.</p>\r\n<p>-<em>P G Vargis</em></p>', 1, 4, 0, 54, '2009-01-06 04:15:30', 62, '', '2009-01-06 04:24:49', 62, 0, '0000-00-00 00:00:00', '2009-01-06 04:15:30', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 15, '', '', 0, 11, 'robots=\nauthor='),
(46, 'Christians and Dowry', 'christians-and-dowry', '', '<p>We see in the Bible that the family share was given to the girls and also to the boys by the father.  Caleb gave a share of his property to his daughter.  I agree that dowry is misused by money-mongers and greedy people.  But the subject must be rightly presented. \r\n', '\r\n</p>\r\n<p>I believe that dowry must be given in justice.  That means, if a father has property worth Rs. 5 lakh and three children, each child is eligible for a portion of it equally divided for the three and also parents.  It means each child is eligible for property or its value of Rs. 1. Lakh.</p>\r\n<p>The family can decide whether they want to give the family share at a later stage or Rs. 1 Lakh as her share at the time of marriage.  For example, if a family in Chennai is arranging the marriage for the daughter in Hyderabad, the boy will be happy to have the value in cash rather than getting one fifth of an apartment after the father and mother will die.</p>\r\n<p>So I strongly believe that this must be discussed with an open mind as the marriage relationship is discussed and settled before the marriage, so that there will not be any misunderstanding or fight or court cases after years, which will strain the relationships.</p>\r\n<p>Is it not true that there are many cases of injustice done to the daughters by the parents by giving only a meager amount or a land that produces nothing, to the daughters?</p>\r\n<p>So, there must be justice from the boy and the girl as well as parents of both.  If a father will say that he has property or cash worth Rs. 5 lakh with three kids, it is pagan and cruel for the boy’s parents to demand more than Rs. 1 Lakh.  It is barbaric and pagan to give only Rs. 25, 000/-.  Let there be justice.</p>\r\n<ol>\r\n<li> A father must give the equal share either at the time of marriage or on a date determined on mutual understanding. </li>\r\n<li> It is ironic for the boy to demand from the girl more than what she deserves from her family.  It is better for such people to sit by the road side and beg. </li>\r\n<li> It is also ironic for the boy’s family to demand marriage expense from the girl’s family.  The girl’s family must meet the girl’s marriage expenses and the boy’s family must meet their marriage expenses. </li>\r\n<li> The boy’s family has no right to use the girl’s dowry for their personal or family use.  The girl’s family is giving her share-like the boy will get his family share-and both must be a joint investment for the boy and girl who have become one. It must not be my share or your share, but our share. </li>\r\n<li> If a family is forced to use the money that the girl’s family has given to the girl, to acquire more land or other family needs like the marriage of a girl in the boy’s home-the boy must be given extra property by his family so that the loss incurred by the daughter-in-law is replenished. </li>\r\n<li> What is given, whether it is cash, gold or property, the boy must be willing to give a proper receipt so that there will not be any argument over the same at a later stage. It must be in writing. </li>\r\n</ol> Years back, I made the following statement through my magazines:- <ol>\r\n<li> I will talk against people bargaining for more money from the girl-more than the girl actually has as her family share. </li>\r\n<li> I will also talk against people who do injustice to girls by giving less family share so that their boys can have more. </li>\r\n<li> I will not attend a wedding where dowry is bargained. I have arranged marriages of my three children-two boys and a girl.  I did not give any dowry to my daughter because I did not still do not-have any property or money in the bank. I did not take any dowry for my two boys. </li>\r\n</ol>\r\n<p>The Bible says that the first son is eligible for double portion of family inheritance. In most of the families, the first son contributes much.  but why is it that no one talks about it.  The parents must give double portion to those who contributed much for the family-whether it is first or second child.  And finally, they have the right to leave their portion to those who took care of them in their old age.</p>\r\n<p>-<em>P G Vargis</em></p>', -2, 4, 0, 54, '2009-01-06 04:15:30', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2009-01-06 04:15:30', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 0, '', '', 0, 0, 'robots=\nauthor='),
(47, 'Christmas News:  Good News?', 'christmas-news-good-news', '', '<p><em><strong>If God is for us, who can ever be against us?</strong></em></p>\r\n<p>Everyone loves to get good news.  No one likes getting bad news.  A long time ago when people used to write letters, no one liked getting telegrams.  A message received in quick time was regarded as unlikely to be good news.  When the delivery man called out, “Telegram,” the faces of the receivers always showed shock and fear.  In biblical times when God sent angels as messengers there was a similar shock and fear.\r\n', '\r\n</p>\r\n<p>When the angels as messengers there was a similar reaction of shock and fear.</p>\r\n<p>When the angels came to announce the birth of Christ, they said, “Greetings!...good news?</p>\r\n<ul>\r\n<li>A young girl was told that she was going to be an unwed mother.</li>\r\n<li>A young man was told that his betrothed was already pregnant and that the first child she bore would not be his.</li>\r\n<li>Poor shepherds were told that one more baby was born in poverty.</li>\r\n</ul>\r\n<p>In reality, only bad news is news.  News reports are never about the millions who did not experience danger and distress.  No one reports that countless millions have enjoyed good health, safety and security.  But the hundreds or thousands who have suffered heat wave, floods, cold wave, road accidents, robberies, murders, dowry deaths…are bad news.</p>\r\n<h3>Bad News &amp; Good</h3>\r\n<p>In the midst of all this, our world has had some good news:</p>\r\n<ul>\r\n<li>Small pox has been eradicated</li>\r\n<li>Fewer babies die soon after birth.</li>\r\n<li>Some progress is being made in discovering new energy sources.</li>\r\n</ul>\r\n<p>However, even this good news is mixed with bad news:</p>\r\n<ul>\r\n<li>Sure we have go rid of small pox, but AIDS  is here.</li>\r\n<li>Fewer babies are dying, but the population is exploding.</li>\r\n<li>Humans are discovering new energy sources; on the other hand, one mad man can blow the entire world away with just one press of his finger on a switch that launches nuclear weapons.</li>\r\n</ul>\r\n<p>These new developments have made some scientists and sociologists say tht humankind is environmentally bad news.  But there are also some who do argue that humans are good news and that they are getting better.  If humans are getting better, how do we explain, for instance, that wars are on the increase and getting worse? Ancients engaged only in tribal warfare.  During the last century, when the nations of the so called civilized world were signing treaties to end wars, the First World War broke out.  At the end of the ear, it was felt that there needed to be a treaty binding several nations together so that the world would never again have to suffer a world war, and so the League of  Nations was formed.  However, it was not able to prevent the Second World War-a worse war, with more destructive weapons, more casualties and a greater toll.  Again at the end of the war, statesmen felt that there was a need for an organization that was bigger and better than the League.  Thus was born the United Nations Organization. But ever since the UN was formed, the world has teetered on the verge of more world wars several times, and though they have not been classified as ‘world wars.’ Some have spanned several decades, been bloodier, and more devastating.  This is just one example of the deterioration of human society.</p>\r\n<p>This is similar to the experience of one man who everyday was told by the hospital doctor that his ailing wife was better. Then one day, when he got to the hospital, he was told that his wife had died.  He asked the doctor, “How did my wife die getting better”? And we could ask, how did the world get bloodier while getting better? If we are honest with ourselves, we will admit that there is something fundamentally wrong with humankind.</p>\r\n<p>The Bible says that the frustrations, pains and sorrows of life on the earthly plane are the fruit of one act of disobeying God.  This rebellion against God resulted in the Fall of Human kind.  All the evil and trouble that has followed are simply the fallout of that revolt against divine sovereignty.  The hardships and sorrows are consequential and therefore it was predetermined that violating God’s law would mess up life for as long as God confirmed the consequences of falling into temptation and falling into temptation and failing the test, He announced some good news.  He said that a Savior was coming, who would crush the head of the Tempter (Gen.3:15).  In the end, after centuries, that earliest good news announcement was fulfilled when the good news came in the person of our Lord Jesus.</p>\r\n<h3>Good News From God</h3>\r\n<p>First of all, the good news is that God has taken note of our bad news.  When Israel was in Egypt as a slave nation, and was oppressed by cruel taskmasters, God told Moses that he had heard the cry of His suffering people and that He was going to intervene and rescue them from their horrible plight of slavery.  Late on,  when God settled them in the Promised Land, and the leaders of the Exodus had all died, Israel broke God’s commandments and paid for it. When they were without God’s protection, their enemies were able to conquer them and abuse them.  When their troubles became unbearable, they would  cry out to God and again and again God’s Word says that God had seen their misery and decided to rescue them by sending them judges-leaders who would administer justice and lead them back to God’s ways.</p>\r\n<p>Not only has God taken cognizance of the bad news in our lives, but our Lord’s Gospel or Good News, is about God having entered our world of bad news in the person of our Lord.  Earlier, God has sent prophets to bring His people relief and to recall them to the truth.  But in Jesus, we see God getting involved in such a way that He Himself is affected by the bad news of human revolt and sinfulness.</p>\r\n<p>One remarkable aspect of this news about God entering our world is the fact that God broke in, not as a power broker, but as a powerless baby, who grew up to be a daily wage earner and later on, an itinerant preacher.  God chose not to come as one o the oppressors, but as one of the oppressed.  God sided with the downtrodden, the underdogs of human society.  He did not believe in practicing neutrality.  God came as one like us, and He is on our side.</p>\r\n<h3>God Feels For Us</h3>\r\n<p>It is because He is like us, that He feels for the fact that we are caught in the coils of our bad news.  We never seem to escape completely from the bad news.  Wealth, education, family connections, power and position-not one of these positive aspects of our lives can keep the bad news from getting to us.  Sooner or later it comes to all of us.</p>\r\n<p>The writer Of Hebrews says it well. Our God is a vulnerable God.  He has gone through what we go through.  He understands our feelings, reactions and responses.   He feels what we feel.</p>\r\n<p>Jesus, who makes people holy, and all those who are made holy have the same Father.  That is why Jesus is not ashamed to call them brothers and sisters…since all these sons and daughters have flesh and blood, Jesus took on flesh and blood to be like them.</p>\r\n<p><cite> He did this so by dying He would destroy the one who had power over death (that is, the devil).  In this way, He would free those who were slaves all their lives because they wre afraid of dying…Therefore, He had to become like His brothers and sisters so that He could be merciful.  He became like one of them so that He could serve as a faithful chief priest in God’s presence and make peace with God for their sins.  Because Jesus experienced temptation when He suffered, He is able to help others when they are tempted (Heb.2:11, 14-15, 17-18, God’s Word). </cite></p>\r\n<p><cite> This High Priest of our understands our weaknesses, for He faced al of the same temptations we do, yet He did not sin.  So let us come boldly to the throne of our gracious God.  Ther we will receive His mercy, and we will find grace to help us when we need it (4:15-16, NLT). </cite></p>\r\n<p><cite> Jesus remains a priest forever; His priesthood will never end.  Therefore He is able, once and forever, to save everyone who comes to God through Him.  He lives forever  to plead with God on their behalf.  He is the kind of high priest we need because He is holy and blameless, unstained by sin (7:24-26, NLT) </cite></p>\r\n<p>Yes, the good news is that our God feels with us and is for us.  Whatever we go through, He’s been there before us.  And He cares enough to hurt with us when we hurt.</p>\r\n<h3>God With Us</h3>\r\n<p>The Good News is that God got involved with us in our bad news.  When Jesus came, God identified Himself as “Emmanuel,” meaning “God with us.”  He is not distant and aloof in heaven, untouched by the human condition.  He embraced our condition and wrestled with it in just the same way as we go through our struggles.</p>\r\n<p>The Apostle Paul said, “God causes all things to work together for good to those who love God, to those who are called according to His purpose” (Rom. 8:28, NASV). While the New International Version paraphrases the wording, it does bring out an aspect ofo how God accomplishes His purpose: “We know that in all things God works for the good of those who love Him.”</p>\r\n<p>One of my favourite stories from the Bible is the story of the three young friends of Daniel facing a king’s anger and the threat of being thrown into a fiery furnace.  The king wanted them to bow down to the idol that he had made (of himself, no doubt) and warned them of the dire consequences of disobedience.  They answer the king categorically: “Our God is able to save us from this fire.  But even if He will not, we want you to know, O king, that we will not bow to your gods or this idol.” The king was furious and ordered that they should be thrown into the furnace.  As the king looked into the fire to observe them burning, he was startled to see that not only did the young men not burn to death, but they were walking in the fire and they had a divine companion for  their walk in the fire. Yes, in all things God works for our good.</p>\r\n<h3>God Will Do Something</h3>\r\n<p>God is not merely with us in all our bad news situations, but He comes to find to save us from our fallen-ness and also from the consequences of the Fall that plague our lives.</p>\r\n<p>Often we imagine that God must mount a rescue operation that will get us out of our troubles.  But like Daniel’s friends we may well discover that we may not be immediately taken out of our troubles, but He will definitely help us face them and overcome them.  That is precisely what Paul discovered.  He had a thorn in the flesh.  A thorn is such a little thing, but when it gets in under the skin it causes soreness and festering, and so one returns to it again and again trying to somehow get it out either by pressing the flesh around it or using a pin to poke at it and push it out.  There was a troubling factor, small as a thorn in the flesh, in Paul’s life. It was a sore trouble and he kept going back to God again and again asking that it be removed.  The answer he expected and wanted was its removal. But instead, God’s answer was: “My grace is all you need, for My power is greatest when you are weak.” As a result, Paul’s attitude toward his problem changed and his view of himself was transformed.  “I am most happy, then, to be proud of my weaknesses, in order to feel the protection of Christ’s power over me.  I am content with weaknesses, insults, hardships, persecutions, and difficulties for Christ’s sake.  For when I am weak, then I am strong” (2 Cor. 12:9-10, GNB).</p>\r\n<h3>Christmas brings us Good News:</h3>\r\n<ul>\r\n<li>God has come to our world.</li>\r\n<li>God is with us in the midst of our troubles and empathizes with us.</li>\r\n<li>God will not leave us alone to cope with our problems.</li>\r\n<li>God will walk with us in all our experiences.</li>\r\n<li>God will give us the strength for our particular situations of needs, troubles, longings and aspirations.</li>\r\n<li>That is the Good News we have because Jesus came. That is the Good News of Christmas.</li>\r\n<h3>God Will Be With You</h3>\r\n<p>As we come to the end of an year, we have this good news: a new year is coming.  But let’s face it, there’s bad news too: it is going to be an year like this one that is ending.  There may be no escape from sickness, trial, trouble and sorrow.  But here is more good news: God is with you…God will be with you.</p>\r\n<p><cite> If God is for us, who can ever be against us?...Can anything ever separate us from Christ’s love? Does it mean He no longer loves us if we have trouble or calamity, or are persecuted, or are hungry or cold or in danger or threatened with death? No, despite all these things, overwhelming victory is ours through Christ, who loved us, And I am convinced that nothing can ever separate us from His love.  Death can’t, and life can’t. the angels can’t, and the demons can’t.  our fears for today, our worries about tomorrow, and even the powers of hell can’t keep God’s love away. Whether we are high above the sky or in the deepest ocean, nothing in all creation will ever be able to separate us from the love of God that is revealed in Christ Jesus our Lord (Rom. 8:31, 35, 37-39, NLT). </cite></p>\r\n</ul>\r\n<p>-<em>Kuruvilla Chandy</em></p>', 1, 4, 0, 54, '2009-01-06 04:26:08', 62, '', '2009-01-06 04:40:23', 62, 0, '0000-00-00 00:00:00', '2009-01-06 04:26:08', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 14, '', '', 0, 16, 'robots=\nauthor=');
INSERT INTO `jos_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(48, 'Christmas Treasures', 'christmas-treasures', '', '<p><em><strong>What have you treasured about the birth of Jesus Christ?</strong></em></p>\r\n<p>Christmas and New Year come and go.  We all have pleasant festive time with friends and relatives.  Many have new dresses added to their already full wardrobe.  This is also a time for get together and parties, with lots of cakes and a variety of ‘goodies’ being baked at home or received from others.  Then, in between, there are church carol service and may be a few weddings.  Suddenly there is an end to all this and we are back to our normal routine work,.  Some of us even wonder, “Why Christmas comes so late-at the end of the year and ends so soon?”  Why do we look forward to Christmas and what does it mean to us?\r\n', '\r\n</p>\r\n<p>This year I received Christmas Treasures from Luke 2:19 and 21 – <strong>“But Mary treasured up all these things and pondered them in her heart.”</strong> And then, <strong>“But his mother treasured all these things in her heart.”</strong> Mary had received treasures during the birth of Jesus Christ and also when Jesus started His ministry.  I wonder, “What have I treasured about the birth of Jesus Christ?” And also, “What have I treasured about the ministry of Jesus Christ?”</p>\r\n<p>I would like to share the thoughts that came to me while I was analyzing some of the incidents and the people involved during the first Christmas.  At the same time, I also wonder to which group I belong and what would have been my role and involvement in the birth of Jesus Christ.</p>\r\n<p>Like <strong>Joseph and Mary</strong>, am I obedient to God’s command to the extent of being absolutely faithful to my spouse and dear ones? Do I honor my promises made to them? Or, do I desert them in a crisis, being worried about what others might say? Like Joseph and Mary, am I prepared to risk social humiliation for His sake?</p>\r\n<p>Even though they had received God’s command, they did not consider it proper to make extraordinary demands and impose themselves on others.  May be, if I were in their position, having received God’s command, I would have gone straight to Herod’s palace and demanded the best suite for our stay and also asked for the royal physician’s help!</p>\r\n<p>Next, may be like the <strong>Innkeeper</strong>, I would have been more concerned about the best commercial use of a particular situation and not bothered about whether someone has brought Jesus Christ to me, to my ‘premises.’ In my busy schedule, while caring for others, I have probably missed Jesus Christ by not knowing that He had come to me and I could not provide Him a proper place in my ‘inn.’</p>\r\n<p>The <strong>Three Wise Men</strong>-yes, many a times I am elated because of my wisdom and more so when I receive heavenly guidance about a special event.  Then I make efforts to go there, but at some stage, use my own wisdom to be misguided in reaching the wrong place (Jerusalem, instead of Bethlehem) and meet the wrong people (Kind Herod, instead of the Kind of kings).</p>\r\n<p>Then, just like the three wise men, when I realize my mistake, I quietly slip away causing misery to many innocent lives.  The three wise men were responsible for the unnecessary death of so many children and the agony it must have brought to their parents.</p>\r\n<p>Like the three wise men, some times my worship end only by bringing gifts for the Lord.  There is nothing wrong in bringing expensive gifts; but is that al? Don’t I have any other responsibility?</p>\r\n<p><strong>King Herod</strong> is typical – many of us, like him, when we have power and authority, we do not wan to leave our ‘throne’. At times, we are scheming in our thoughts and words, “Go and make a careful search for the child.  As soon as you find Him, report to me, so that I too may go and worship Him”; we all know what was his real intention.</p>\r\n<p>Like Herod, who was so keen to keep his position safe, did not spare the lives of innocent babies, we too at times are so selfish, that we try to stick to our position ‘by hook or by crook’ – even to the point of being cruel and ruthless.  Some of us are like the <strong>Chief Priests and the Teachers of The Law</strong>.  We studied the Scriptures and know what is mentioned where.  We are regarded as authority on all religious matters and are also teaching others.  Then, at times called upon to explain the deeper meaning like the then Chief Priests and Teachers of the Law were called by King Herod.  Yet, we are not concerned and serious about  what we have been ‘reading,’ ‘studying.’ ‘explaining’ and are expected to be ‘practicing’? it appears that we are not interested in Jesus Christ.</p>\r\n<p>The Word of God is only head and book knowledge for us.  There are no practical applications in our lives, nor do we use this knowledge for others’ benefit.</p>\r\n<p><strong>The Shepherds</strong> were simple and hardworking people, who in those days were not accepted in polite society.  They were not considered to be religious and least expected a heavenly visitation. However, when they heard the Good News, they immediately accepted what was said to them, went out to see Jesus Christ. Their visit did not end being mere spectators.  Anyone who has received the Message cannot keep quiet. “When they had seen Him, they spread the word concerning what had been told them about this child, and all who heard it were amazed at what the shepherds said to them”…”The shepherds returned, glorifying and praising God for all the things they had heard and seen, which were just as they had been told” (Lk. 2:17, 18 &amp; 20).</p>\r\n<p>It is just possible that most of the time I am lost with a important group who were conspicuous by their absence-the <strong>Normal Ordinary People like Most of Us</strong>.  They were all there, but they were not involved and hence there is no mention about any one of them.</p>\r\n<p>Most of the time, I am there with the ‘crowd,’ yet do not know what is happening around me.  I am neither bothered nor do I take any interest in important matters.  I feel it is meant for others.</p>\r\n<p>In my ‘serious,’ ‘sincere’ and deliberate absence year after year, I have probably missed the REAL CHRISTMAS and its significance.</p>\r\n<p>In this context, I am reminded of a story I read in a magazine.  The story I read in a magazine.  The story is about three trainee devils that were coming to this earth to complete their training and were talking to Satan, the chief of the devils, about their plans to tempt and ruin people.</p>\r\n<p>The first trainee devil said, “I will tell people that there is no God,” Satan said that would not delude many.</p>\r\n<p>The second said, “I will tell them there is no hell.” Satan answered, “You will deceive no one by that way, people know even now that there is hell.”</p>\r\n<p>The third said, “I will tell people there is “<strong>NO HURRY</strong>.’ “Go,” said Satan, “and you will ruin a great crowd.”</p>\r\n<p>It is dangerous to postpone and think that there is plenty of time.  The salvation that Jesus offers is at hand and now is the time for repentance and acceptance.  Let us not allow the trainee devils, not even their chief to harden our hearts in not learning lessons from the groups that were present or absent during the first Christmas.</p>\r\n<p>-<em>Pradip Mahanty</em></p>', 1, 4, 0, 54, '2009-01-06 04:44:15', 62, '', '2009-01-06 05:03:01', 62, 0, '0000-00-00 00:00:00', '2009-01-06 04:44:15', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 5, 0, 13, '', '', 0, 8, 'robots=\nauthor='),
(49, 'Divine Healing of the Body', 'divine-healing-of-the-body', '', '<ol>\r\n<li> God’s View of Healing 			 \r\n<ul>\r\n<li>Healing the sick is God’s work - Joh 9:1-4</li>\r\n<li>Healing the sick is for the glory of God - Joh 11:4</li>\r\n<li>It is good to heal the sick - Mt 12:10-12</li>\r\n<li>Jesus was willing to heal the sick - Mt 8:3,7</li>\r\n<li>Jesus gave the power to heal to the disciples - Mt 10:1</li>\r\n<li>The Righteous die, some of sicknesses - 2Ki 13:14 					 \r\n<ul>\r\n<li>so don’t lose faith if some are not healed</li>\r\n</ul>\r\n</li>\r\n</ul>\r\n</li>\r\n<li> Promised By God 		 \r\n<ul>\r\n<li>Protection provided by obedience to God - Ex 15:26</li>\r\n<li>Wisdom from God is health to the whole body - Pr. 4:20-22 			 \r\n<ul>\r\n<li>especially guard your heart - Pr 4:23</li>\r\n</ul>\r\n</li>\r\n<li>Through Jesus (by His stripes we are healed) - Isa 53:5; 1Pe 2:24\r\n', '\r\n</li>\r\n</ul>\r\n</li>\r\n<li> Causes of Sickness 		 \r\n<ul>\r\n<li>Problems on earth because of Adam’s sin - Ge 3:16-19 				 \r\n<ul>\r\n<li>all creation groans because of the curse - Ro 8:22</li>\r\n<li>people also are waiting for redeemed bodies - Ro 8:23</li>\r\n</ul>\r\n</li>\r\n<li>Sickness as Judgment of God 				 \r\n<ul>\r\n<li>caused by disobedience - Le 26:15-16</li>\r\n<li>caused by rebellion - Ps 107:17-18</li>\r\n</ul>\r\n</li>\r\n<li> Sickness as a Trial from God at the hand of Satan 				 \r\n<ul>\r\n<li>Job’s body is afflicted - Job 2:6-7</li>\r\n<li>God is proving Job’s love and loyalty - Job 2:3-5</li>\r\n<li>Paul was sick due to messenger of Satan	- 2Co 12:7</li>\r\n<li>the righteous suffer 						 \r\n<ul>\r\n<li>Old Testament - 2Ki 20:1-3; Da 8:27</li>\r\n<li>New Testament - Ac 9:37; Php 2:27</li>\r\n</ul>\r\n</li>\r\n</ul>\r\n</li>\r\n</ul>\r\n</li>\r\n<li> Conditions For Healing 			 \r\n<ul>\r\n<li>Do you want to get well? - Joh 5:6</li>\r\n<li>Forgiveness of sins - Mt 9:5-6 					 \r\n<ul>\r\n<li>forgive others so we will be forgiven - Mt 6:14; Mk 11:25</li>\r\n<li>confess your sins - Jas 5:15-16; 1Jo 1:9</li>\r\n<li>repentance leads to healing - Ps 107:19-20</li>\r\n</ul>\r\n</li>\r\n<li>Faith is necessary - Ac 14:9;Mt 9:28-29</li>\r\n<li>Authority from Jesus is necessary - Lu 9:1</li>\r\n<li>Prayer and fasting may be necessary - Mt. 17:21</li>\r\n</ul>\r\n</li>\r\n<li> Why Some Are Not Healed 		 \r\n<ul>\r\n<li>God’s choice is not man’s choice - Lu 4:27 				 \r\n<ul>\r\n<li>Jesus heals only one man at Bethesda - Joh 5:2-10</li>\r\n<li>God Chooses whom He wishes - Joh 5:21</li>\r\n</ul>\r\n</li>\r\n<li>Unbelief or lack of Faith - Mt 13:58, 17:20; Mk 6:5-6</li>\r\n<li>Miracle lost because of doubt (Peter on water) - Mt 14:31</li>\r\n<li>Don’t ask; don’t receive - Jas 4:2; Mt 21:22; Joh 16:23-24 				 \r\n<ul>\r\n<li>some ask for selfish reasons - Jas 4:3</li>\r\n</ul>\r\n</li>\r\n</ul>\r\n</li>\r\n<li> Anointing With Oil (2 New Testament Scriptures) 		 \r\n<ul>\r\n<li>Before the coming of Holy Spirit - Mk 6:13</li>\r\n<li>James to Jewish believers - Jas 1:1; 5:14</li>\r\n</ul>\r\n</li>\r\n</ol>\r\n<p>No reference to Jesus and the disciples (in the Book of Acts) using oil.  Oil is a  symbol of healing.  Some are helped by being anointed with oil when a healing prayer is offered.</p>', 1, 4, 0, 54, '2009-01-06 05:14:17', 62, '', '2009-01-06 05:43:04', 62, 0, '0000-00-00 00:00:00', '2009-01-06 05:14:17', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 12, '', '', 0, 13, 'robots=\nauthor='),
(50, 'Is Killing Murder?', 'is-killing-murder', '', '<p>Is killing what the sixth commandment prohibits?  Or does it prohibit murder?</p>\r\n<p>This question generates great interest, probably because of its ethical implications.  Answering the question is not as difficult as dealing with the ethical significance.  Allow me to discuss the meaning of the terminology used in the commandment and make some general remarks concerning its significance.\r\n', '\r\n</p>\r\n<ol>\r\n<li> <strong><em>Premeditated Killing:</em></strong>\r\n<p>The Hebrew verb translated “killing/murder” in Exodus 20:13 (ratsach) designates the premeditated and intentional taking of a human life.  In the Old Testament the verb is used in cases in which a person intentionally strikes another with an instrument of iron, stone, or wood, causing the death of the individual (Num. 35:16-18).  There is always an evil motivation, like enmity (verse 21) or ego gratification (I Kings 21:2, 3, 19).  It is usually performed by the morally corrupt or by those takes place it is a case of culpable homicide, murder.  Jesus explicitly reaffirmed the commandment and traced murder back to human anger and lack of love (Matt. 5:21, 22).  The prohibition is based on the doctrine of creation and redemption: Human life is to be respected because God Brought it into existence and Christ redeemed it through His blood.</p>\r\n</li>\r\n<li> <strong><em>Unintentional Killing:</em></strong>\r\n<p>The Hebrew very ratsach can also designate the unintentional, accidental killing of another human being.  The fundamental difference between killing and murder is located in the motivation and the absence of premeditation.  In this case we are dealing with the accidental death of a person, the best example being found in Numbers 35:22, 23: “But if without hostility someone suddenly shoves another or throws something at him unintentionally or, without seeing him, drops a stone on him that could kill him, and he dies” (NIV), that person had the right to find safety in one of the cities of refuge.</p>\r\n<p>The purpose of the law of unintentional killing was to bring the practice of  blood revenge under social legal control.  Apparently accidental killing was not considered legally excusable.  The life of the killer was in jeopardy as long as he lived, unless during the lifetime the high priest died (Verse 25).  It implies that the death of the high priest was counted as the death of the slayer, allowing him to leave the city of refuge as a free citizen.</p>\r\n</li>\r\n<li> <strong><em>Justifiable Exceptions:</em></strong>\r\n<p>The use of the verb ratsach (to kill, murder) in the sixth commandment appears to be restricted to illegal killing.  It is never used to refer to the death penalty or to killing in war.  With respect to the death penalty we often find the Hebrew very mot, “to put to death” (e.g., Lev. 20:10; Num. 35:31).  In the context of war the verb harag, “to kill, slay” (e.g., 2 Sam. 10:18), is commonly used.  Therefore the commandment itself should not be used exclusively to determine whether war and capital punishment are right or wrong.  In those areas there will be difference opinions.</p>\r\n<p>However, we should keep in mind that the fact that defensive warfare was practiced among the Israelites does not mean that such killings was necessarily justifiable.  David was involved in war and that disqualified him in the Lord’s eyes from building the Temple (1 Chron. 22:8).  This suggests that there is something intrinsically wrong with killing in war.  Personal self-defense has traditionally been upheld by the Christian church, but self-defense should not be equated with the taking of life.  Self-defense requires the use of the minimal force to neutralize the intruder or assailant.  Of course, that action could result in the death of the individual, but that is not the intention.</p>\r\n<p>Capital punishment is perceived in the Old Testament theocratic system as justifiable, even required, in the case of murder (Num. 35:30).</p>\r\n<p>Whether that law should be normative in modern society is something that theologians, ethicists, and sociologists have to debate (cf. Rom. 13:1-5).</p>\r\n<p>Perhaps I should point out that murder is not limited to the act of taking a human life.  Through our words and attitudes we can destroy lives and bring almost to an end the aspirations of children, young people, and those around us.  Love preserves life and its quality in all its expressions and ramifications.  We should always seek to preserve life.</p>\r\n</li>\r\n</ol>', 1, 4, 0, 54, '2009-01-06 05:44:26', 62, '', '2009-01-06 05:52:59', 62, 0, '0000-00-00 00:00:00', '2009-01-06 05:44:26', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 11, '', '', 0, 8, 'robots=\nauthor='),
(51, 'Lord''s Palm Top', 'lords-palm-top', '', '<p><strong><em>Rejoice in the hope, security and peace that we enjoy in Christ.</em></strong></p>\r\n<p>The world wakes up to a new technological innovation almost every day.  There is no end for new gadgets and consumer durables that floods the market.  One of the new gadgets seems to be a combination of a mobile phone, camera and palm top computer. A proud owner uses it as his phone, stores a pack of photographs and innumerable files with important documents, power point presentations and film songs and games.  There were hundreds of photos stored in his palm top handy tool.</p>\r\n<p>But, it is amazing to know that Isaiah could foresee such a palm top, may be two thousand and seven hundred ears ago.\r\n', '\r\nGod says, “see, I have engraved you on the palms of my hands” (Isa. 49:16) How could God engrave in his palms so many millions of people.  If my friend could  pack hundreds of photos in his palm top computer, why can’t God who created the whole universe?  Is there anything impossible for Him?</p>\r\n<p>Paul warned us that the last days would be terrible days. “But mark this:  there will be terrible times in that last days.  (2 Tim. 3:1) In these terrible days, the only hope that sustains a Christian is the Lord’s promise of being engraved in His palms.</p>\r\n<h3>Times of Danger</h3>\r\n<p>This modern generation is living in times of danger.  Global terrorism has made its horrible impact in all nations.  Some nations believed “nuclear bombs” are their ultimate security.  But, these nuclear bombs did not serve any purpose against ‘suicide bombers.’ These suicide bombers have terrorized the whole world population.  Stepping out of home itself seems to be great risk around the world.  Natural calamities like tsunami, that devastated Asia, are another example that today people are living in danger times.  Mumbai city say torrential rains that could bring the city to a standstill.  Debris all over, missing people, stinking corpses, deserted homes, immobile cars, non-functional railways stunned the whole nations.  The daily dosage of kid-nap, rape, murder, suicide (and the list goes on) shows that the world is in the last days and in the times of danger.</p>\r\n<h3>Times of Changes</h3>\r\n<p>Change seems to be the only consistent thing.  World political scenario suddenly changed and the ‘cold war’ came to an abrupt end.  But terrorism became a global crisis.  Political leaders have become bankrupt for ideas.  Social upheaval brings violent encounter between people groups of the same nation. Communal virus engineers ‘ethnic cleansing’ of minorities and promotes hatred.  New economy makes some people rich and many a pauper. Environment is so polluted that the global climate has drastically changed and the meteorological prediction becomes unreliable.</p>\r\n<h3>Times of Hopefulness</h3>\r\n<p>The man on the street is as hopeless as the politician who rules the nations around the world.  There seems to be no ray of hope.  Al efforts seem futile,  all events confusing.  Political leaders do not inspire hope; industrialists speak of ‘downsizing;’ economists talk of ‘growth’ and  ‘recession’ in the same breath; media has gained expertise in fishing out ad projecting depressing news; young people are directionless and the whole world seems to be in chaos.</p>\r\n<h3>Times of Uncertainty</h3>\r\n<p>Uncertainty has enveloped the whole world. Nothing is predictable.  People who thought they had permanent jobs are receiving pink slips.  Businesses people suddenly are out of business.  Digital photography is chasing traditional photographers and studios out of job.  Electronic communication has sent postal services into sick bed.  May be all post boxes would reach museum shortly. Nobody has an assurance about economic security.  In these circumstances, the promise of God through Isaiah is an encouraging affirmation.</p>\r\n<p>When the Lord says that He has engraved us in His palms it means:</p>\r\n<h3>In The World of Danger, You Are Not In Danger</h3>\r\n<p>The world is a dangerous place to love, but Christians have an assurance that they are not in danger  “The eternal God is your refuge, and underneath are the everlasting arms” (Deut. 33:27).  The eternal, unfailing hands of God uphold us.</p>\r\n<h3>Amidst Changes, You Are In The Custody Of Unchanging God</h3>\r\n<p>All things around us are fast changing.  These changes could shock and terrify any human being.  Our almighty God does not change.  “Jesus Christ is the same yesterday and today and forever” (Heb. 13:8).  The sovereign God who reigns is in control ofo all happenings in the history of the world.  That God who is in total control promises us saying: “I will uphold you with my righteous right hand” (Isa. 41:10)</p>\r\n<h3>In This Hopeless World, You Have Eternal Hope</h3>\r\n<p>The stress, shock, sudden change of events makes a person to be devoid of any hope.  But, there is eternal hope for Christians.  This hope is ‘in Christ’ who has all authority over heaven and earth.  Christians could rejoice in the Lord as there is experience of deliverance and promise of continuous deliverance. “He has delivered us from such a deadly peril, and He will deliver us.  On Him we have set our hope that He will continue to deliver us” (2 Cor. 1:10-11).  Paul writes, “I pray also that the eyes of your heat may be enlightened in order that you may know the hope to which He has called you, the riches of His glorious inheritance in the saints” (Eph. 1:18).  There is hope of rich inheritance with the saints.</p>\r\n<h3>In Times of Uncertainty, You Are Anchored In The Rock Of Salvation</h3>\r\n<p>“Command those who are rich in this present world not to be arrogant nor too put their hope in wealth, which is so uncertain, but to put their hope in God, who richly provides us with everything for our enjoyment” (I Tim. 6:17-18).  God is the provider in the times of uncertainty and also helps us to rejoice and enjoy what God provides.  Godliness added to contentment is a great gain (I Tim. 6:6). “The blessing of the LORD brings wealth, and He adds no trouble to it” (Prov. 10:22).  The winds and waves could harass Christians, but could never harm them.</p>\r\n<h3>Challenge</h3>\r\n<p>Let us rejoice in the security, hope, peace we enjoy in Christ in spite of dangers, uncertainty, terror and hopelessness that dominate the minds of people.  Indeed, it is a privilege to be engraved in His palms.</p>\r\n<p>-<em>J. N. Manokaran</em></p>', 1, 4, 0, 54, '2009-01-06 05:58:57', 62, '', '2009-01-06 06:07:13', 62, 0, '0000-00-00 00:00:00', '2009-01-06 05:58:57', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 10, '', '', 0, 9, 'robots=\nauthor='),
(52, 'Persecution and Bible', 'persecution-and-bible', '', '<h3>Biblical Responses to Persecution</h3>\r\n<p><strong>PSALMS 31:16:</strong><br /> But as for me, I trust in You, O Lord: I say, “ You are my God.”<br /> My times are in Your hand:<br /> Deliver me from the hand of my enemies,<br /> And from those who persecute me.<br /> Make your face shine upon Your servant;<br /> Save me for Your mercies’ sake.”</p>\r\n<p><strong>MATTHEW 5:43-45:</strong> “You have heard that it was said, “You shall love your neighbor and hate your enemy.” “But I say to you, love your enemies, bless those who curse you, do good to those who hate you, and pray for those who spitefully use you and persecute you…”\r\n', '\r\n</p>\r\n<p><strong>MARK 8:34-36:</strong> “Whoever desires to come after Me, let him deny himself, and take up his cross, and follow Me. For whoever desire to save his life will lost it, but whoever loses his life for My sake and the gospel’s will save it. Fro what will it profit a man if he gains the whole world, and loses his own soul?”</p>\r\n<p><strong>MARK 13:11:</strong> “But when they arrest you and deliver you up, do not worry beforehand, or premeditate what you will speak.  But whatever is given you in that hour, speak that; for it is not you who speak, but the Holy Spirit.”</p>\r\n<p><strong>ACTS 4:18-20:</strong> “Then they…commanded them not to speak or teach at all in the name of Jesus.  But Peter and John replied, “Judge for yourselves whether it is right in God’s sight to obey you rather than God.  For we cannot help speaking about what we have seen and heard.”</p>\r\n<p><strong>ACTS 5:28-29:</strong> “Did we not strictly command you not to teach in this name?  And look, you have filled Jerusalem with your doctrine, and intend to brig this Man’s blood on us!” But Peter and the other apostles answered and said: ‘We ought to obey God rather than men.”</p>\r\n<p><strong>ACTS 5:40-42:</strong> “They called the apostles in and had them flogged. Then they ordered them not to speak in the name of Jesus, and let them go.  The apostles left… rejoicing because they had been counted worthy of suffering disgrace for the Name. Day after day, in the temple courts and from house to house, they never stopped teaching and proclaiming the good news that Jesus is the Christ.”</p>\r\n<p><strong>ACTS 7:54-57:</strong> “When they heard these things they were cut to the heart, and they gnashed at him with their teeth.  But he, being full of the Holy Spirit, gazed into heaven and saw the glory of God, and Jesus standing at the right hand of God, and said, ‘Look! I see the heavens opened and the Son of Man standing at the right hand of God!” Then they cried out with a loud voice, stopped their ears, and ran at him with one accord….”</p>\r\n<p><strong>ROMANS 12:14:</strong> “Bless those who persecute you;  bless and do not curse.”</p>\r\n<p><strong>2 THESSALONIANS 1:3-6:</strong> “…we ourselves boast of you among the churches of God for your patience and faith in all your persecutions and tribulations that you endure, which is manifest evidence or the righteous judgment of God, that you may be counted worthy of the kingdom of God, for which you also suffer….”</p>\r\n<p><strong>2 TIMOTHY 2:10-12:</strong> “Therefore I endure all things for the sake of the elect, that they also may obtain the salvation which is in Christ Jesus with eternal glory.  This is a faithful saying:  For if we died with Him, we shall also live with Him.  If we endure, we shall also reign with Him.  If we deny Him, He also will deny us.”</p>\r\n<p><strong>HEBREWS 13:12-15:</strong> “Therefore Jesus also, that He might sanctify the people with His own blood, suffered outside the gate.  Therefore let us go forth to Him.  Outside the camp, bearing His reproach.  For here we have no continuing city, but we seek the one to come.  Therefore by Him let us continually offer the sacrifice of praise to God, that is, the fruit of our lips, giving thanks to His name.”</p>\r\n<p><strong>1 Peter 2:20-24:</strong> “…if you suffer for doing good and you endure it, this is commendable before God.  To this you were called, because Christ suffered for you, leaving you an example, that you should follow in his steps.  He committed no sin, and no deceit was found in his mouth.”  When they hurled their insults at him, he did not retaliate; when he suffered, he made no threats.  Instead, he entrusted himself to him who judges justly.”</p>\r\n<p><strong>1 PETER 3:14-15:</strong> “But even if you should suffer for righteousness’ sake, you are blessed. “And do not be afraid of their threats, nor be troubled.”  But sanctify the Lord God in your hearts, and always be ready to give a defense to everyone who asks you a reason for the hope that is in you, with meekness and fear.”</p>\r\n<p><strong>1 PETER 4:12-13:</strong> “Beloved, do not think it strange concerning the fiery trial which is to try you, as though some strange things happened to you; but rejoice to the extent that you partake of Christ’s sufferings, that when His glory is revealed, you may also be glad with exceeding joy.”</p>\r\n<p><strong>I JOHN 3:13:</strong> “Do not marvel, my brethren, if the world hates you.”</p>\r\n<p><strong>REVELATION 2:10-11:</strong> “Do not fear any of those things which you are about to suffer.  Indeed, the devil is about to throw some of you into prison, that you may be tested, and you will have tribulation ten days.  Be faithful until death, &amp; I will give you the crown of life.”</p>', 1, 4, 0, 54, '2009-01-06 06:10:30', 62, '', '2009-01-06 06:21:40', 62, 0, '0000-00-00 00:00:00', '2009-01-06 06:10:30', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 9, '', '', 0, 21, 'robots=\nauthor='),
(53, 'Hymn Story', 'hymn-story', '', '<p><cite> Silent night! Holy night! All is calm, all is bright<br /> Round yon virgin mother and Child, Holy Infant, so tender and mild<br /> Sloop in heavenly peace, Sleep in heavenly peace</cite>\r\n', '\r\n</p>\r\n<p><cite> Silent night! Holy night! Shepherds quake at the sight<br /> Glories stream from heaven afar, Heav’nly hosts sing alleluia<br /> Christ the Savior is born! Christ the Savior is born!<br /> </cite></p>\r\n<p><cite> Silent night! Holy night! Son of God, love’s pure light<br /> Radiant beams from Thy holy face With the dawn of redeeming grace<br /> Jesus, Lord at Thy birth, Jesus, Lord at Thy birth.<br /> </cite></p>\r\n<p><cite> Author – Joseph Mohr, 1792-1848<br /> English Translation – John F. Young, 1820 – 1885<br /> Composer – Franz Gruber, 1787 – 1863<br /> Tune Name  “Stille Nacht”<br /> Meter – Irregular<br /> </cite></p>\r\n<p>For unto you is born this day in the city of David a Savior, which is Christ the Lord. – Luke 2:11</p>\r\n<p>Joseph Mohr was born in the lovely city of Salzburg, Austria, in 1792. as a boy he was an active chorister in the Cathedral of Salzburg.  In 1815 Mohr was ordained to the priesthood of the Roman Catholic Church.  Following his ordination, he served various parishes in the Salzburg area.  It was while serving as an assistant priest in 1818, a the newly erected Church of St. Nicholas in Obernorf in the region of Tyrol, high in the beautiful Alps, that Mohr wrote the text for this favorite of all Christmas carols.</p>\r\n<p>Father Mohr and Franz Gruber, the village schoolmaster and church organist, had often talked about the fact that the perfect Christmas hymn had never been written.  With this goal in mind, and after he had received word that his own church organ would not function, Father Mohr decided that he must write his own Christmas hymn,  immediately, in order to have music for the special Christmas Eve Mass and to avoid disappointing his faithful congregation.  Upon completing the text, he took his words to Franz Gruber, who exclaimed when he saw them, “Friend Mohr, you have found it-the right song-God be praised!”</p>\r\n<p>Soon Gruber completed his task of writing the right tune for the new text.  His simple but beautiful music blended perfectly with the spirit of Father Mohr’s words.  The hymn was completed in time for the Christmas Eve Mass, and Father Mohr and Franz Gruber sang their hymn to the accompaniment of Gruber’s guitar.  The hymn made a deep impact upon the parishioners, even as it has on succeeding generations.  The passing of time seems only to add to its appeal.</p>\r\n<p>Neither Mohr nor Gruber intended that their hymn would be used outside of their little mountain village area.  However, it is reported that within a few days after the Christmas Eve Mass, the organ repairman, Karl Maurachen of Zillerthal, a well-known organ builder of that area, came to the church and obtained a copy of the new hymn.  Through his influence the carol spread throughout the entire Tyrol region, where it became popular as a Tyrolean Folk Song.  Soon various performing groups such as the well-known Strasser Chrildren’s Quartet began using the hymn in concert throughout Austria and Germany.  In 1838 when a  family of Tyrolean Singers, the Rainers, used the music during their concert tour.  Soon it was translated into English translations are known today.  The carol is presently sung in all of the major languages of the world and is a universal favorite wherever songs of the Christmas message are sung.</p>\r\n<p>The translation by John F. Young  was born at Pittston, Kennebec County, Maryland, on October 30, 1820.  He was ordained to the Episcopal Church and served a number of years as a bishop in the State of Florida.  Throughout his church ministry he had a keen interest in sacred music.  This translation of Mohr’s German text first appeared in 1863 in Clark Hollister’s <em>Service and Tune Book</em>. In addition to this translation of this text, Young is also known as the editor of two published hymnals, <em>Hymns and Music for the Young</em>, 1861, and <em>Great Hymns of the Church</em>, published posthumously by John Hopkins, 1887.</p>', 1, 4, 0, 54, '2009-01-06 06:32:17', 62, '', '2009-01-06 06:35:46', 62, 0, '0000-00-00 00:00:00', '2009-01-06 06:32:17', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 8, '', '', 0, 32, 'robots=\nauthor='),
(54, 'Ten Ways to Thank Your Pastor', 'ten-ways-to-thank-your-pastor', '', '<p>Because of the unique organizational structure of the Adventist Church, in which pastors are assigned by the conference committee and paid directly from the conference treasury, it is easy to forget that our local congregations have a significant role in the job satisfaction of their pastors.</p>\r\n<p>Accepting God’s call to ministry means accepting the high stress that accompanies any helping profession.  You can personally increase your pastor’s ministry motivation by supporting his or her ministry and expressing your appreciation.  Below are ten ways you can support and encourage your pastor.\r\n', '\r\n</p>\r\n<ol>\r\n<li>\r\n<p>Volunteer. Most congregations have more work to be done that there are workers to accomplish the tasks.  Some pastors try to do everything themselves and then burn out.  Others see the enormity of the task and wish they could give up. 		If you volunteer to do something, try to select a specific job you are willing to perform and then persist in volunteering until you are put to work.</p>\r\n</li>\r\n<li>\r\n<p>Share in ministry.  Offer to go with your pastor! Jesus sent His own disciples out two-by-two so they could encourage one another.  You could life your pastor’s load by joining with him in pastoral visitation, giving Bible studies, conducting Revelation seminars and evangelistic meetings, or even in the myriad of minutia that must be accomplished.  The work load is lighter when two people share the burden to see it done.</p>\r\n</li>\r\n<li>\r\n<p>Provide for a pastoral resource fund.  Most pastors are severely limited in the books, visual aids, and study resources they can afford to purchase.  Growing numbers of congregations give a monthly amount (you might aim for 25 cents a month per member) into a pastoral resource fund, which is then used by the pastor to purchase a self-development and study materials that directly improve pastoral ministry to the congregation through better preaching and increased satisfaction.</p>\r\n</li>\r\n<li>\r\n<p>Minister to the pastor’s family.  Pastoral families are often deprived of time with their pastor-spouse or parent because the pastor’s time is being given to the members.  Why not insist that your pastor take an evening with his or her spouse while you baby-sit and fix dinner for their children?</p>\r\n<p>Get together  with several other members and sponsor your pastor to a continuing education seminar, and make it a special bonus by sending the spouse along. “Anyone who receives instruction in the word must share all good things with his instructor” (Galatians 6:6, NIV).</p>\r\n</li>\r\n<li>\r\n<p>Celebrate pastoral anniversaries.  Rather than decrying the short pastoral tenture of most Adventist ministers, celebrate the annual anniversary of your pastor’s arrival in your church with a special worship service of a fellowship dinner celebration.</p>\r\n<p>I know one congregation which gives a gift certificate to the pastor on each pastoral anniversary, while another plans a getaway vacation of one day per year of service to a nearby resort area.  Our own congregation hosted a day-long Sabbath commemoration of our pastor’s first anniversary in our midst.</p>\r\n<p>Any pastor would be very reluctant to transfer from a congregation whose members express their appreciation.  Affirmed pastors know the grass is greener right where they live!</p>\r\n</li>\r\n<li>\r\n<p>Become a positive force in your congregation.  Don’t wait around for the pastor to come up with all the ideas.  You will express appreciation to your pastor if you initiate some positive ideas and projects.</p>\r\n<p>How about offering to coordinate a seminar for your church that will enable you and your fellow members to become better disciples as well as beginning to be disciple-makers.  You might lead the plan for a new ministry for your community or organize a special event to draw guests to your church facilities.</p>\r\n</li>\r\n<li>\r\n<p>Respect pastors.  Most pastors are far busier than their members imagine. Moreover, pastors are on 24-hour call in one of the most highly-stressed environments possible.  At the same time that their schedule is overloaded, they need creative time for study, reflection, and sermon preparation.</p>\r\n<p>Always avoid denigrating comments such as “I wish I had the pastor’s job—working only one day a week.”  Pastors will not always be perfect and may sometimes overlook a detail, but respect how much they do accomplish with the limited resources available.</p>\r\n</li>\r\n<li>\r\n<p>Become a pastoral advocate. Speak up for your pastor to other members and, if you have an opportunity, affirm your pastor to conference leadership.  Express written appreciation to conference administration for the pastoral care you receive and send your pastor a copy.</p>\r\n</li>\r\n<li>\r\n<p>Verbally express your appreciation.  Words cost nothing but mean so very much! a card or note of appreciation could make the gloomiest day seem bright.</p>\r\n<p>Acknowledging an extraordinary sermon or a meaningful pastoral service will encourage your pastor to ongoing excellence.  Make it your goal to express three affirmations for every complaint that comes to mind.  You can be a modern Aaron or Hur, holding up the leader’s hands.</p>\r\n</li>\r\n<li>\r\n<p>Pray for your pastor and family. Much less faultfinding would occur if members were consistently praying for their pastors.  If you have a problem with your pastor, that is the essential time to pray.  And remember, when I pray for someone, it is not in order to change God’s attitude toward that individual, but rather God changes my attitude toward the one for whom I am praying.</p>\r\n<p>As well as praying for your pastor, also pray with your pastor.  What an encouragement for pastors to actually hear a member praying aloud for them by name!</p>\r\n<p>Nothing brings greater reward than providing encouragement and opportunities for pastors and their families which enhance their happiness in ministry and increase their effectiveness.  Your entire church family will experience the positive consequences.</p>\r\n</li>\r\n</ol> <strong><em>Stop right now and find a way to thank your pastor.</em></strong>', 1, 4, 0, 54, '2009-01-06 06:42:42', 62, '', '2009-01-06 06:44:14', 62, 0, '0000-00-00 00:00:00', '2009-01-06 06:42:42', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 7, '', '', 0, 67, 'robots=\nauthor='),
(55, 'The Day of Small Beginnings', 'the-day-of-small-beginnings', '', '<h3>The Importance of Small Decisions</h3>\r\n<p>Even small decisions that we take in our younger days are important, because some of those decisions can take us completely out of God’s will for our lives.  And so we must never be in a hurry when taking a decision, but always wait on the Lord and seek His will in patience, before deciding. \r\n', '\r\n</p>\r\n<p>After I left the Navy, I did not know how to start doing the Lord’s work.  I did not know where to begin or even where to stay.  Then and elder brother (whom I knew) invited me to come and stay with him in his church for a short while, to wait on the Lord.  So  I went to his assembly and spent about a month there in prayer, with some periods of fasting.  At the end of that period of prayer, I was still not sure what to do.  But my heart was at peace, assured that the Lord would show me His plan for my life, in due course.  So I continued to live from day to day,  without being anxious about the morrow.  I realize now that God allows such periods of uncertainty to test our motives and to teach us patience.  So my time of prayer and fasting was most profitable and God protected me from making mistakes in the decisions that I took in the following weeks and years.</p>\r\n<h3>Teach Me His Word</h3>\r\n<p>Someone suggested to me at that time that  I should join a Bible College first of all and get a degree, because that would be a good preparation for my ministry and would also give me many openings for ministry.  I had nothing against Bible Schools.  But I knew that:</p>\r\n<ol>\r\n<li> <strong><em>In the Old Testament:</em></strong> No prophet ever came out of a Bible Schools, even though there were such schools In Israel. </li>\r\n<li> <strong><em>In the New Testament:</em></strong> Jesus never sent any of His disciples to a Bible School, even though Gamaliel was running such a school in Jerusalem at that time. </li>\r\n<li> <strong><em>Today:</em></strong> 99% of God’s people are in secular employment and can never go to a Bible School.  So I felt I should be an example to these 99% of God’s people by demonstrating to them that one could serve the Lord effectively without attending a Bible School.  So I decided never to go to a Bible School, but to trust the Holy Spirit to teach me His Word and His ways, just as He taught the disciples in the first century.  A top evangelical Bible College in Canada then offered me a seat in their college, with full scholarship and airfare fully paid, to study there.  This would have been a tempting offer for many Christians, but it was not for me.  So I rejected their offer.  Another friend of mine took that seat in my place, and ended up settling down in Canada!! God saved me from that fate and from missing His will thereby! I am thankful that I never went to any Bible School – for God has given me such amazing revelations from His Word that I could never have received, if my mind had been trained to think students to think.  The men and women whose lives and writings have influenced me the most, have also been those who never went to a Bible School themselves-Madam Guyon, Charles Finney, D.L. Moody, Jessie Penn Lewis, Watchman Nee, A. W. Tozer, Sadhu Sundar Singh, Bakht Singh etc. </li>\r\n</ol>\r\n<h3>Provide For My Earthly Needs</h3>\r\n<p>Another truth that I saw in God’s Word was that Jesus and His apostles never made their earthly needs known to any Human being-either their personal needs or their ministry needs.  They trusted their heavenly Father alone to meet all their needs.  I had given away all my earnings (in the 8 years that I worked in the Navy) for the Lord’s work and to poor believers.  So I had left the Navy with an empty bank account and no savings.  But I believed that if any Indian Navy had been faithful to take care of all my earthly needs when I served  them, my heavenly Father would be even more faithful when I served Him.  So I decided never to make my financial needs know to anyone but my heavenly Father, who knew exactly how and when to meet my needs.  I used to receive occasional gifts from some believers, but that came to only about 15% of what I was earning in the Navy.  But I learnt to live simply and so I never suffered any lack.  One day, the Chairman of a large Western organization that  was involved in Christian radio ministry in India invited me to become the Director of their organization.  I was offered a large salary plus house-rent, car, telephone and other perquisites.  I greatly appreciated the work of this organization.  But if I joined it, I would be engaged primarily in administrative work.  God had, however, called me to preach His Word, and not to sit behind a desk doing administration.  Here was another tempting offer.  But I rejected it and continued to trust the Lord for my needs.  For nearly 40 years now, the Lord has taken care of all my needs and the needs of my family as well and I have proved His faithfulness time and again.</p>\r\n<p>Young people are often tempted to compromise on the principles of God’s Word-especially when they see older servants of God doing so.  But if you trust in the Lord and stick to the principles of His Word, you will find that God will do many miracles for you.  you will know God better thereby and your ministry too will be enriched.  So, let me encourage every young person never to compromise on the principles of God’s Word, at any cost.</p>\r\n\r\n<p>\r\n-<i>Zac Poonen</i>\r\n</p>', 1, 4, 0, 54, '2009-01-06 09:39:22', 62, '', '2009-01-06 09:43:58', 62, 0, '0000-00-00 00:00:00', '2009-01-06 09:39:22', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 6, '', '', 0, 28, 'robots=\nauthor=');
INSERT INTO `jos_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(56, 'The Prayer of Jabez', 'the-prayer-of-jabez', '', '<p>Tucked away in the pages of the long history of the people of Israel, there is a short biography of a rare and unique person.  His name was Jabez.  Jabez means, “pain”.  His mother called his name Jabez, saying, “Because I bore him in pain”.  We do not know why she named him Jabez.  May be the pregnancy and the delivery of the boy may have been traumatic.  Perhaps his mother’s pain was emotional – may be his father had abandoned here during the pregnancy, may be had died; may be the family was very poor ad the prospect of feeding another mouth was difficult.  Only God knows what caused the pain of his anguished mother.\r\n', '\r\n</p>\r\n<p>He grew up with a name any boy would love to hate.  A person’s name is his or her identity.  In Bible times, a man and his name were so intimately related that “to cut off the name” of a person amounted to the same thing as killing him.  A name was taken as a wish for or prophecy about the child’s future.  If a boy is known as “pain” and people keep calling him “pain” day in and day out al the time, it would be terrible.  Imagine if you had to go through childhood enduring the teasing and abusing.  How did Jabez handle this dilemma?</p>\r\n<p>Every computer printer shipped by a Colorado Company was first frozen, then heated to 130 degree Fahrenheit, and finally shaken violently for 15 minutes.  This testing is the final step in a process called “ruggedization” which prepares an ordinary printer for us by the military.  With its circuit boards secured and all components enclosed in a metal case, the printer is thoroughly tested to make sure it will work on the battle field.</p>\r\n<p>Jabez went through this process of spiritual ruggedization.  Despite his dismal prospects.  Jabez found a way out.  He had heard about his God who had delivered his forefather from slavery and bondage in Egypt rescued them from powerful enemies and established them in a land of plenty.  By the time he grew up, he believed and fervently hoped in this God of miracles and new beginnings.  If God could do this great miracle for his forefathers, He could do it for him also.  So, I faith and expectation, he prays.  When we feel hedged in, we find ourselves in difficult situations, the best thing to do is to cry out to God and ask for help.  So Jabez prays a one sentence effective prayer.</p>\r\n<h3>“Bless Me”</h3>\r\n<p>The first thing he asks God is “Bless Me.” Weighed down by the sorrow of his past and the dreariness of his present, he sees before him only impossibility, a future shut off.  But raising his hands to heaven, he cries out, “Father, oh, Father please bless me and what I really mean is, bless me a lot”. With that petition, transformation begins.</p>\r\n<p>What is the meaning of blessing?  In the Biblical sense, to bless means to ask for supernatural favor.  When we ask for God’s blessing, we are not asking for more of what we could get for ourselves.  We are crying out for the wonderful, unlimited goodness that only God has the power to know about or give to us. Proverbs tells us, “The Lord’s blessing is our greatest wealth; all our work adds nothing to it” (Prov. 10:22 TLB)</p>\r\n<p>Notice that Jabez left it entirely up to God to decide what the blessings would be and where, when and how Jabez would receive them. This is not like asking for a Cadillac or six figure salary and some other material blessing.  Jabez asked for a blessing that was nothing less or nothing more than what God wanted for him.  Do not tell or direct God what blessing He has to give you. God knows what is best for us and He will give accordingly.  When we seek God’s blessings as the ultimate value in life, we are throwing ourselves entirely into the river of His will and power and purposes for us.  All our other needs become secondary to what we really want, which is to become wholly immersed in what God is trying to do for us, in us, through us, and around us for His glory.</p>\r\n<p>What is the purpose of receiving blessing?  God blesses us to bless others. It is not for selfish purposes but for unselfish purpose.  Jesus love multiplication more than addition.  E.g. He multiplied the five loaves and two fish.</p>\r\n<p>It is God’s nature to bless us.  For example, the first thing God did after creating Adam and Eve was to bless them. Ask for God’s blessing with confidence.  Ask God, “bless me”.  Many people do not receive blessings because they do not ask for blessings and they do not receive blessings.  Only we limit God’s bounty, not by His resources or willingness to give.  Jabez was blessed simply because he refused to let any obstacle, person or opinion look larger than God’s nature.  And God’s nature is to bless us.</p>\r\n<h3>“Enlarge My Territory”</h3>\r\n<p>The next part of the Jabez prays is a plea for more territory, that is, where you ask God to enlarge your life so you can make a greater impact for Him.  He wanted more influence, more responsibility, and more opportunity to make a mark for the God of Israel.  He looked at his circumstances and concluded, “Surely I was born for more than this”</p>\r\n<p>The word “territory” can also be translated as “coast” or “boarders”.  For Jabez and his contemporaries this word carried the same emotional power, as did the words homestead or frontier did for generations of America pioneers.  It spoke of a place of one’s own with plenty of room to grow.  For Jabez it meant, everything you have put under my care O Lord, take it, and enlarge it.</p>\r\n<p>The implication of this prayer for us would be something like this: “O God and King, please expand my opportunities and my impact in such a way that I touch more lives for Your glory.  Let me do more for You.”</p>\r\n<p>God causes problems in your life to enlarge your heart.</p>\r\n<ul>\r\n<li><em>To enlarge your life.</em></li>\r\n<li><em>To enlarge your compassion</em></li>\r\n<li><em>To enlarge you love</em></li>\r\n<li><em>To enlarge your strength and nourishment</em></li>\r\n<li><em>To enlarge your ability to face life and its challenges.</em></li>\r\n</ul>\r\n<p> </p>\r\n<p>Ask God for more ministries, more blessing, more opportunities.  Do not be satisfied with what you have done or what you have.  Pour your life into somebody’s life.</p>\r\n<h3>“Let Your Hand be with Me”</h3>\r\n<p>Notice that Jabez did not begin his prayer by asking for God’s hand to be with him.  At that point, things were manageable for him but when God granted his request to enlarge his territory and God’s agenda started coming at Him, he knew he needed a divine hand and fast.  He could have tried to go ahead in his own strength and struggled.  But he prayed, Oh, that your hand would be with me”.</p>\r\n<p>The “hand of God” is a biblical term for God’s power and presence I  the lives of His people (Josh. 4:24; Isa. 59:11).  The success of the early Chruch in Acts was attributed to, “The hand of the Lord was with them, and a great number believed and turned to the Lord” (Acts 11:21).</p>\r\n<p>God’s Hand symbolizes His power.  Heb 10:9: Dan. 4:35.  His hand is powerful.  His hands have authority and power. Ps. 102:25.  we are His handiwork.  Some Christians have been blessed and may have not asked for an enlarged ministry.</p>\r\n<p>If seeking God’s blessings is our ultimate act of worship, and asking God to do more for Him is our utmost ambition, then asking for God’s hand upon us is our strategic choice to sustain and continue the great thing that God has begun in our lives.  You could call God’s hand on you “the touch of greatness.”  You do not become great, He becomes great through you.</p>\r\n<p>It is like, realizing and acknowledging, “Dear heavenly Father, please let your hand be with me because the task is too big for me and I need your help.”  We then step out in faith and start doing things for God.  Afterwards.  We begin testifying, “God did that, nobody else.  God carried me, gave me the words, gave me the power, and it is wonderful.”</p>\r\n<p>God’s fingerprint must be all over our life, not the enemy’s fingerprint.</p>\r\n<ul>\r\n<li><em>God’s hand is loving hand:</em></li>\r\n<li><em>God’s hand is forgiving hand:</em></li>\r\n<li><em>God’s hand is encouraging hand:</em></li>\r\n<li><em>God’s hand is hand of blessing.</em></li>\r\n<li><em>Nobody can pluck us from His hand.</em></li>\r\n<li><em>God is watching and waiting for us to ask.</em></li>\r\n</ul>\r\n<p> </p>\r\n<p>The last part of his prayer was, “Oh, that You would Keep me from evil, that it may not grieve me!”</p>\r\n<p>His last request is a brilliant strategy for sustaining a blessed life.  We need God’s supernatural power to protect us from Satan’s ability to defeats us in our success.  Where there is success, there is a possibility of failure, backsliding and defeat.  Many successful Christian leaders have fallen into sin and dropped out of ministry and left in their wake untold numbers of shaken, disillusioned and inured people.  The greater our success in ministry.  The greater will be the enemy’s attack on us and our family.</p>\r\n<p>The most effective was against sin is to pray that we will not have to fight.  Ask God to keep us away from temptation and keep the devil away at bay in our lives.  Jesus taught us to pray in the Lord’s Prayer. “And do not lead us into temptation, but deliver us from the evil one” (Matt. 6:13).  Here Jesus is not talking about our confrontation with the evil or spiritual insight or special powers.  When was the last time you asked God to keep you away fro temptation?  In the same way that God wants us to ask for more blessing, more territory and more powers, He longs to hear us plead for safekeeping from evil.</p>\r\n<p>Without temptation, we would not sin. Most of us face too many temptations and therefore sin too often.  Because we do not ask God to lead us away from temptation.  We can make progress in our spiritual life when we begin to focus less on beating temptation and more on avoiding it.  God offers us His supernatural power to fight temptation.</p>\r\n<p>“So God granted him what he requested”. It is only what you believe will happen and what you pray will be answered.</p>', 1, 4, 0, 54, '2009-01-06 09:54:57', 62, '', '2009-01-06 09:56:19', 62, 0, '0000-00-00 00:00:00', '2009-01-06 09:54:57', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 5, '', '', 0, 27, 'robots=\nauthor='),
(57, 'What is Eating You?', 'what-is-eating-you', '', '<p>There are various factors that lead to workplace anger. It is not only potentially harmful to the organization, but it can also cause serious health problems.</p>\r\n<p>Mad that you were passed over for a  big promotion again? Livid that the bootlickers always seem to get ahead in your organization?  Perhaps it’s time to consider whether the anger itself, however legitimate, is holding you back.  Evidence suggests many of us are walking around the office feeling resentful, though we may be unaware of the cumulative toll bitter actions take on our careers and coworkers. \r\n', '\r\n</p>\r\n<p>According to a report by Donald Gibson of Fairfield University and Sigal Barsade of Yale University, one out of four employees is substantially angry at work. The study, “The Experience of Anger at Work: Lessons from the Chronically Angry.” Indicates most workers are not so angry that they’re ready to cause the boss physical harm, but they’re ready to cause the boss physical harm, but they are angry enough to sabotage him.</p>\r\n<p><strong><em>Workplace anger is not only potentially harmful to the organization, but it can also cause serious health problems, including chronic anxiety, depression, high blood pressure and heart disease.</em></strong> Learning to deal with your anger constructively will improve your well-being and make you a more desirable and promotable employee.</p>\r\n<h4>Why are so many employees angry?</h4>\r\n<p>According to Gibson’s survey, workplace anger is most often directed at an employee’s supervisor or the organization is general.  “Feelings of anger at the individual level are a signal that a wring has been committed or that goals are being blocked, “Gibson says.</p>\r\n<p>I spoke with twelve employees from a variety of businesses about their anger at work.  Each felt that one or more of the following caused the anger:</p>\r\n<ul>\r\n<li>Employee was promised a raise, promotion or important project, and it did not happen.</li>\r\n<li>Employee was told to do something he felt was wrong or incorrect.</li>\r\n<li>Employee could not live up to a supervisor’s expectations, because the expectations were too high or continuously changing.</li>\r\n<li>Supervisor was a micromanager and criticized employee frequently.</li>\r\n<li>Employee felt better qualified and skilled than his supervisor.</li>\r\n<li>Another employee doing the same job made more money.</li>\r\n</ul>\r\n<p>Sometimes the anger may stem from outside sources.  Many times, employees are dealing with stressful events in their own lives, and the resulting anger can carry over to the workplace.  Divorce, a death in the family, financial pressure, and serious illnesses can all cause an individual to become overwhelmed and irritated.  Rarely are we taught to deal with loss and stressful situations, so we tend to bury those feelings, which can turn to anger or rage over time.</p>\r\n<h4>Steps to control anger constructively</h4>\r\n<p>We all become irritated or angry every now and then.  What can we do to control that anger and be more constructive?  Gibson, who cowrote “Managing Anger in the Workplace” as a follow-up to the survey, offers the following strategies for controlling anger:</p>\r\n<p>Avoid anger as much as possible.  This doesn’t mean suppress your feelings, but rather improve your outlook on yourself and life so there are fewer situations in which you would become angry.</p>\r\n<p>Think about your anger and determine if it really makes sense given the situation.</p>\r\n<p>Control your physical response to anger by doing constructive things, such as exercising, getting enough sleep and avoiding alcohol.  The healthier you are, the more likely you are to respond appropriately to situations.</p>\r\n<p>Let go of unmanageable anger.  May situations will be out of your control, so it is important to let go of this type of anger.  Ask yourself, “Can I resolve whatever it is that’s causing this anger?” If you can’t, then you need to let it go.</p>\r\n<p>If you feel anger and are having a difficult time dealing with it,  see if your company has an Employee Assistance Program (EAP).  EAP providers typically allow employees to see therapists in these circumstances.  You don’t have to live in a state of bitterness, anger or rage.  If you deal effectively with your anger, you will increase your chances of being promoted at some point – and of being an effective leader when the time comes.</p>\r\n<h3>When Anger Strikes:</h3>\r\n<ul>\r\n<li><strong>Take several deep breaths.</strong><br /> Repeat a claming work or phrase in your mind, such as “relax” or “stay calm.” </li>\r\n<li> <strong>Slowly count to ten.</strong><br /> Ask yourself, “How would my favorite leader handle this situation?” 	Avoid tensing up your muscles.  As soon as you can, close your eyes and consciously think to unclench your jaw and loosen your muscles. </li>\r\n<li> <strong>Listen to your favorite music.</strong><br /> When you’re feeling angry after you leave work, change clothes as soon as you get home.  This simple gesture will help you change your state of mind. </li>\r\n</ul>', 1, 4, 0, 54, '2009-01-06 10:04:30', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2009-01-06 10:04:30', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 4, '', '', 0, 25, 'robots=\nauthor='),
(58, 'When the Going Gets Tough', 'when-the-going-gets-tough', '', '<h4><strong><em>James 1:1-12</em></strong></h4>\r\n<p>The primary concern of James is not creed, but conduct; not belief, but behavior; not doctrine, but deeds.  He addresses how a believer responds “when the going gets tough”.  When the going gets tough believers should have…\r\n', '\r\n</p>\r\n<ol>\r\n<li>\r\n<h3>THE PROPER ATTITUDE TOWARD TRIALS</h3>\r\nVerses 2-4 		<ol>\r\n<li>\r\n<h4>The Association Confirmed</h4>\r\n“My brethren…”<br /> Paul identifies with their suffering.  He was not an “armchair quarterback”.  He was sharing out of the testimony of his own victories. </li>\r\n<li>\r\n<h4>The Attitude Commanded</h4>\r\n“Count it all joy…”, vs. 2.<br /> This aorist infinitive conveys a sense of urgency.  It is extremely important that we make up our mind to face the trials of like in faith and with an attitude of joy, i.e., a settled peace, confidence, and delight in the Lord. </li>\r\n<li>\r\n<h4>The Application Considered</h4>\r\nVerse 2.  “When you fall into divers temptations (trials),” i.e., multifaceted trials, unexpected hardships of all kinds.  Christians face trials of every nature.  We are not immune from suffering, tests, and difficulties. </li>\r\n<li>\r\n<h4>The Affirmation Conveyed</h4>\r\nVerses 3-4, “Knowing this….” Abiding, staying true, remaining faithful under pressure, i.e., as a weight-lifter, produces strength for steadfast endurance.  There is no way to know the quality of something without testing it.<br /> “Perfect”; mature, as contrasted to babes in Christ.<br /> “Entire”; Complete, acceptable for sacrifice.<br /> “Lacking in nothing”; Victorious<br /> </li>\r\n</ol> </li>\r\n<li>\r\n<h3>A PRAYERFUL ACKNOWLEDGEMENT AMID TRIALS</h3>\r\nVerses 5-7 		<ol>\r\n<li>\r\n<h4>The Requirement For Wisdom</h4>\r\n“Since you lack wisdom…”<br /> It is OK to ask God “why?” or “what should I do?”  The first thing we must do is acknowledgement must make… </li>\r\n<li>\r\n<h4>A Request For Wisdom</h4>\r\n“Let him ask of God…”, v. 5.<br /> This is a present tense imperative, i.e., a command, not a suggestion.  When the going gets tough don’t try to go it alone.  When you ask for help prepare for… </li>\r\n<li>\r\n<h4>The Response of God</h4>\r\n“Who giveth to all men liberally…”<br /> God wants to give you wisdom and strength in your trials.  He will not “fuss at you” (“and upbraideth not”) for asking.  “Just when I need Him most, Jesus is there to comfort and cheer, just when I need Him most.” </li>\r\n<li>\r\n<h4>The Responsibility Of Man</h4>\r\n“But let him ask in faith…”<br /> This is the wholehearted attitude of a full and unquestioned committal to and a dependence on God. </li>\r\n</ol> </li>\r\n<li>\r\n<h3>THE POSITIVE ASPECTS OF ENDURING TRIALS</h3>\r\nVerses 8-12. 		<ol>\r\n<li>\r\n<h4>Trials Produce A Balanced Life</h4>\r\nVerse 9-11<br /> Those who waver with every trial are unstable in all their ways.  A balance life keeps an eternal perspective “A tent or a cottage, why should I care, He is building a palace for me over there”. </li>\r\n<li>\r\n<h4>Trials Produce A Blessed Life</h4>\r\nVerse 12, “Blessed is the man…”<br /> “Though exiled from home yet still I can sing, all glory to God, I’m a child of the King”.  Real happiness is found in trusting God through the trials of life. </li>\r\n<li>\r\n<h4>Trials Produce A Bountiful Life</h4>\r\n“…a crown of life…”, v. 12.<br /> This is both life and life abundantly here and life eternally hereafter.  This could be interpreted as “the crown which consists of life. </li>\r\n<li>\r\n<h4>Trials Produce A Beautiful Life</h4>\r\nRobert Browning Hamilton wrote…<br /> “I walked a mile with Pleasure.<br /> She chatted all the way. <br /> She left me none the wiser,<br /> For all she had to say.<br /> I walked a mile with sorrow,<br /> And never a word said she:<br /> But, oh, the things I learned from her<br /> When sorrow walked with me.”<br /> </li>\r\n</ol> </li>\r\n<li>\r\n<h3>CONCLUSION</h3>\r\nIt was C.S. Lewis who said, “God whispers to us in our pleasure, speaks to us in our conscience, but shouts to us in our pain. It is His megaphone to raise a deaf world”.  When the going gets tough remember there is a God wise enough, strong enough, and loving enough to see you through.  Trust Him, love Him, and serve Him no matter how tough life becomes. </li>\r\n</ol>\r\n<p>-<em>Jackie Kay</em></p>', 1, 4, 0, 54, '2009-01-06 10:17:08', 62, '', '2009-01-06 10:23:13', 62, 0, '0000-00-00 00:00:00', '2009-01-06 10:17:08', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 3, '', '', 0, 29, 'robots=\nauthor='),
(59, 'Why is the Virgin Birth of Jesus an Essential Doctrine of the Christian Faith?', 'why-is-the-virgin-birth-of-jesus-an-essential-doctrine-of-the-chirstian-faith', '', '<p>"I do not believe in the Virgin Birth and hope that none of you do.” Those words were spoken from the pulpit of the magnificent Riverside Church in New York City, a half century or more ago by the Rev. Harry Emerson Fosdick, leader and populariser of the liberal theological movement in America; they have echoed and reechoed since then throughout the liberal churches.</p>\r\n<p>More than a quarter of the Church of England clergy do not believe in the Virgin birth of Christ.  A poll of 500 clerics found that 27% privately reject the traditional story of Jesus’ birth, which forms a key part of the Nativity. \r\n', '\r\n</p>\r\n<p>The view of one Hampshire vicar was typical. “There was no things special about His birth or His childhood-it was His adult life that was extraordinary,” he said.</p>\r\n<p>The Rev. Dr. Keith Archer, of Salford, said: “It is not particularly important because it is a debatable translation of a Hebrew prophecy which first appeared in Isaiah.”</p>\r\n<p>Another vicar added: “Writers at the time used to stress a person’s at the time used to stress a person’s importance by making up stories about their early life.  I think that is exactly what has happened here.”</p>\r\n<p>Would a survey among churches in India fare any better?  This assault on the doctrine of the Virgin Birth is, however, but one phase of a great battle to evacuate the supernatural from Christianity and to reduce it to the plane of natural religion. These naturalists in religion are out to destroy supernatural Christianity.  They go through the Bible and tell us there is no supernatural revelation there; they go through the Birth of Christ and tell us there is no supper natural incarnation there; they go through the Person of Christ and tell us there is no supernatural deity there…they go through the Works of Christ and tell us there are no supernatural miracles there; they go through the Words of Christ and tell us there are no supernatural wisdom there; they go through the Death of Christ and tell us there is no supernatural atonement there; they go through the Blood of Christ and tell us there is no supernatural cleansing there; and they go through the Tomb of Christ and tell us there is no supernatural resurrection there.</p>\r\n<h3>Why is the Virgin Birth so Important?</h3>\r\n<ol>\r\n<li>\r\n<h4>The doctrine of the Virgin Birth affirms that the Bible is true.</h4>\r\n<p>In Genesis 3:15 we read, “And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.”</p>\r\n<p>The reference here is to the woman’s seed, not to the seed of the man.  This isi unique because the common reference is always to the seed of the man..”the seed of Abraham” (Isa. 41:8), not the seed of Sarah, “the seed of David” (Rom. 1:3), not the seed of Bathsheba, and so on.</p>\r\n<p>Something extraordinary is referred to, for only a unique seed, a special seed, a supernatural triumph “the bruising of the serpent’s head.” Every effect must have an adequate cause and no son by ordinary generation of Adam’s ruined race could accomplish the effect here spoken of.  The adequate cause is found in the woman’s seed, a Virgin-born Savior</p>\r\n<p>Also in Isaiah 7:14 we read: “Therefore the Lord Himself shall give you a sign; Behold, a virgin shall conceive, and bear a Son, and shall cal His name Immanuel.”</p>\r\n<p>This verse has become the principal battleground of the whole controversy regarding the Virgin Birth.  The first line of assault of the critics is upon the Hebrew word almah, here translated “virgin.” It is urged that the proper Hebrew word for virgin is bethulah, and that if a virgin was what the prophet wished to signify he would have used that word. Almah, it is contended, simply means “a young woman of marriageable age.”</p>\r\n<p>The word almah occurs in seven other Old Testament verses and Professor J. Gresham Machen in his scholarly work The Virgin Birth of Christ comments: “As a matter of fact, there is no place among the seven occurrences of almah in the Old Testament where the world is clearly used of a woman who was not a virgin.”</p>\r\n<p>Four hundred years ago, Martin Luther issued a challenge:</p>\r\n<p>“If a Jew or Christian can prove to me that in any passage of Scripture almah means ‘a married woman’ I will give him one hundred florins, although God alone knows where I will find them.”</p>\r\n<p>Luther’s challenge still stands impregnable today.</p>\r\n</li>\r\n<li>\r\n<h4>The doctrine of the Virgin Birth affirms the deity of Jesus.</h4>\r\n<p>The Virgin Birth is as crucial as the resurrection in substantiating His deity.  It is not an optional truth.</p>\r\n<p>Those who deny the Virgin Birth of Christ must also deny the pre-existence of Christ and those who deny the pre-existence of Christ must further deny the coequality of Christ in the Godhead. By maintaining that the birth of Christ was by natural generation, the origin of Christ is fixed.  His conception ad birth mark the date of His origin.  He had a beginning like all other creatures.  His eternity therefore must be rejected.  Such is the logical outcome of the denial of the supernatural birth.</p>\r\n<p>Apostasy in this vital doctrine leads to total apostasy in all vital doctrines leads to total apostasy in all vital doctrines.</p>\r\n<p>To deny the Virgin Birth is to reduce Christ to the level of an ordinary individual.  In doing so His pre-existence and hence, His place in the Godhead, are repudiate.  He cannot, therefore, by this reasoning, be the Son of God.  If He is not, as the Father from the heavens twice declared Him to be, the Son of God, then the God of Truth is a liar, heaven in reality is hell and the whole revelation one colossal sham.</p>\r\n<p>There is, in fact, no middle ground logically between denial of the Virgin Birth and the pestiferous bogs of open infidelity.  Those who maintain that the Virgin Birth is not essential, only display their own abysmal ignorance.</p>\r\n<p>If, on the other hand, it can be established that our Lord Jesus Christ was the eternal Son of God incarnate in the flesh, the possibility. If any other birth but Virgin Birth is finally ruled out.</p>\r\n</li>\r\n<li>\r\n<h4>The doctrine of the Virgin Birth affirms the substitutionary work of Christ on the Cross.</h4>\r\n<p>In order that Jesus could die a substitutionary death, and thus become the Savior of sinners, He had to offer up an absolutely sinless life.  Even the slightest taint of sin would have disqualified Him from being our Substitute.  If He had been born a sinner, He himself would have deserved the divine wrath.  It was therefore necessary for Him to enter the world in such a way that He would not possess inherited depravity.  This was accomplished through the Virgin Birth.</p>\r\n<p>The Virgin Birth of Jesus takes the crucifixion of Christ out of the category of human sacrifice and puts it in the category of God’s justice and mercy.  In His death, Christ was carrying out the purpose for which He entered the world, that justice might be executed through Him.  He was God, voluntarily paying the penalty He had imposed upon sinful man.</p>\r\n<p>Paul explains that God has set forth Christ to be a propitiation “that he might be just, and the justifier of him which beleiveth in Jesus” (Rom. 3:25-26).  Such a death could be considered just only if it were inflicted upon the one prepared for that purpose.  And that is exactly what Jesus claimed to be.  Hebrews 10:5 says, “Wherefore when he cometh into the world, he saith, Sacrifice and offering thou wouldest not, but a body hast thou prepared me.” The Virgin Birth is the means by which the Son of God could enter the stream of human life to effect the justice required by a righteous, merciful God.</p>\r\n<p>To provide such a sacrifice, it was necessary that the innocent victim, the Lamb of God, enter into the world from outside the realm of man.  Thus Jesus Christ was conceived of the Holy Ghost.  What a cause for rejoicing! God, in the person of Christ, has come into our world, taken our flesh, and died in our place, “God was in Christ, reconciling the world unto himself: (2 Cor. 5:19).</p>\r\n<p>Why is the Virgin Birth essential to our belief? Dr. Howard Kelly, late professor of gynecological surgery at Johns Hopkins University, a very learned man, one of the great scientists of the past generation, and a devout Christian, said, “The Virgin Birth is the great key to the Bible storehouse.  If I reject the Virgin Birth, the New Testament becomes a dead, man-made letter recounting the well-intentioned imaginings of honest, but misguided men.” Dr. Kelly recognized that the belief in the Virgin Birth is essential.</p>\r\n<p>In the rivers of the logging country, oftentimes log jams occur.  Sometimes hundreds of logs will be backed up in a single jam.  It is not at all unusual for just one log to be responsible for a massive jam .  If that one key log can be dislodged, all the other logs will flow freely down the river.  The Virgin Birth is exactly like that.  It is the key log, an essential doctrine that will allow the other doctrines of the Word of God to flow gently down the stream of truth.</p>\r\n<p>Make no mistake about it, when Jesus was born, the eternal Logos, broke through eternity into time.  Blending the writings of John and Luke it is right to conclude that Jesus, the eternal logos, was born of a virgin.  And He was fully God.</p>\r\n<p>Jesus Christ was born of a virgin, lived without sin, and died on the cross that He might redeem us.  On the third day, He rose from the grave and today is alive and it seated at the right hand of the Father on high.</p>\r\n</li>\r\n</ol>\r\n\r\n<p>Do you know Him? Have you accepted Him as your Lord and Savior? If not, you can today.</p>\r\n\r\n<p>\r\n-<i>Vijay Thangiah</i>\r\n</p>', 1, 4, 0, 54, '2009-01-06 10:34:13', 62, '', '2009-01-06 10:37:06', 62, 0, '0000-00-00 00:00:00', '2009-01-06 10:34:13', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 2, '', '', 0, 36, 'robots=\nauthor='),
(60, 'Why Should I Look Forward with Anticipation for the New Year', 'why-should-i-look-forward-with-anticipation-for-the-new-year', '', '<p>Its hard to begin a new year without some sense of anticipation or curiosity about what it will bring.  In Isaiah 60:1 the prophet calls to his people, <em>“Arise, shine: for your light has come, for the glory of the Lord has risen upon you.”</em> Can there be a more hopeful wake-up call?</p>\r\n<p>Humanly speaking, even the brightest and best minds cannot predict what 2006 holds for us. But spiritually speaking, we can anticipate our immediate future.  In Matthew Chapter Sixteen, Jesus chides the Pharisees and Sadducees for not discerning the times in which they lived.  They were better at weather prediction that Bible study.  Likewise, many Christians today live in ignorance of God’s mighty workings because of Bible neglect. What are some things we can anticipate God doing in 2009?\r\n', '\r\n</p>\r\n<ol>\r\n<li>\r\n<h4>We should anticipate God’s grace in saving the lost.</h4>\r\n<p>God is still convicting! He is still drawing! He is still saving! One preacher put it this way.  “God always looks to save.  God is an Exodus God, a wilderness God, a God of the manger and cross and resurrection and Pentecost.  God’s saving goodness is like Lebanese lumber.  It’s God’s specially and God glories in it.”</p>\r\n<p>Do you have a loved one-a husband or a wife, a son or a daughter, or a close friend for whom you have been praying for that they would know the Lord in a personal way?</p>\r\n<p>Anticipate God’s working in their lives and believe the promise in 2 Peter 3:9. “The Lord is not slack concerning His promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.”</p>\r\n</li>\r\n<li>\r\n<h4>We should anticipate God’s goodness to bless those who trust in Him.</h4>\r\n<p>We should anticipate the spiritual blessings that God has promised us.  In Ephesians 1:3 we read, “Blessed be the God and Father of or Lord Jesus Christ, who hath blessed us with all spiritual blessings in heavenly places in Christ.</p>\r\n<p>As Major Ian Thomas has said, “We say ‘Ebenezer, hitherto hath the Lord helped me,’ or ‘Maranatha, the Lord cometh.’ But what we need to discover is the glory of the forgotten tense, the present tense, that God is the eternal ‘I am,’ the eternal present tense, and that He is adequate for every human need right now.”</p>\r\n</li>\r\n<li>\r\n<h4>We should anticipate God’s guidance to lead us each day of the new year.</h4>\r\n<p>So many people today don’t know what to do or where to turn.  Christians, too, seem to have trouble finding their way.  But the believer has full confidence to say, “He maketh me toile down in green pastures: He leadeth me beside the still waters. He restoreth my soul:  He leadeth me in the path of righteousness for His name’s sake.”</p>\r\n<p>We can be assured that the God who led Moses, Joshua, Gideon, Samuel, David, Daniel and the countless others who put their trust in Him will lead us as well.</p>\r\n<p>The promise of Psalm 48:14, “For this God is or God for ever and ever: He will be our guide even unto death,” should take us safely through the new year.</p>\r\n</li>\r\n<li>\r\n<h4>We should anticipate God’s glory to be revealed as He comes to take us to be with Him.</h4>\r\n<p>Charles Spurgeon, when asked if he thought Christ might return soon, said, “I think not!” After repeating this answer numerous times, someone finally go up enough nerve to ask him, “Doesn’t the Bible command that we anticipate Christ’s coming? Why then do you say, ‘I think not!’?” Spurgeon answered, “Because the Bible says, ‘in such an hour as ye think not the Son of Man cometh.’</p>\r\n<p>Jesus gave us the assurance in John 14:3, “And if I go and prepare a place for you, I will come again, and receive you unto Myself; that where I am, there ye may be also.” Also in John 14:18, Jesus said, “I will not leave you comfortless: I will come to you.”</p>\r\n<p>John closes the book of Revelation with these words, “He which testifieth these words, “He which testifieth these things saith,  Surely I come quickly.  Amen.  Even so, come, Lord Jesus.” Like generations before us, we anticipate the coming of our Lord Jesus Christ! It could be in 2009!</p>\r\n</li>\r\n</ol>\r\n<p>What would you like to do in the coming year?  Here is the apostle Paul’s exhortation on how to think about the future:</p>\r\n<p>“Not that I have already attained, or am already perfected; but I press on, that I may lay hold of that for which Christ Jesus has also laid hold of me. Brethren, I do not count myself to have apprehended; but one thing I do, forgetting those things which are behind and reaching forward to those things which are ahead, I press toward the goal for the prize of the upward call of God in Christ Jesus” (Phil. 3:12-14).</p>\r\n<p>-<em>Vijay Thangiah</em></p>', 1, 4, 0, 54, '2009-01-06 10:45:16', 62, '', '2009-01-06 10:46:45', 62, 0, '0000-00-00 00:00:00', '2009-01-06 10:45:16', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 1, '', '', 0, 37, 'robots=\nauthor='),
(61, 'Pathfinder Camporee 2009', 'pathfinder-camporee-2009', '', '<p><a href="images/stories/pathfinder_camporee_2009/DSCN4525.JPG"><img style="margin: 3px; float: left;" alt="The pathfinders from Jeevan Jyothi Seventh-day Adventist English Church" src="images/stories/pathfinder_camporee_2009/DSCN4525.JPG" height="214" width="285" /></a>The division wide pathfinder camporee in southern Asia Division was held between January 14 to 18, 2009 in Besant Park, Doddaballapur, Karnataka. This is one of the largest camporee held so far in Southern Asia Division with 900 delegates attending from the various pathfinder clubs across the country. About 42 clubs participated. The five day camporee began with colourful inaugural ceremony led by eminent church leaders from the General Conference, the Division, the Union and the conference and other church units. Pr.Jonathan Tejal (The General Conference Pathfinder Director), Pr. R. John (The Division President), Pr. Lionel Lyngdoh (The Division Youth Director) were present along with a host of directors.   \r\n</p>\r\n', '\r\n<p>The camporee was conducted on a pre-planned schedule consisting of a wide range of activities. Beginning with flag raising and devotion every morning, followed by a delicious breakfast. The pathfinders had camp duties to perform which includes camp cleaning, helping in the kitchen, help in arranging the fire wood and other duties of like manner. At the later part of the day there was large number of games, events, exhibition and cultural programs organized, in which the pathfinders took an active part. This enriched their social life as they made friends with one another.</p>\r\n<p>The day ended with flag lowering and devotion around the camp fire. The children as well as the adults were spiritually blessed by the messages rendered. The Sabbath was the most blessed time in the camporee with the vesper meeting, Sabbath school discussion, divine service and A.Y meeting. There were many visitors from the nearby churches fellowshipping with the pathfinders. The pathfinders presented inspiring special songs and programs.</p>\r\n<p>The Sabbath night was the closing night with the closing ceremony which included cultural program and talent show. The pathfinders tremendously enjoyed themselves in the camporee and also the hospitality provided. The pathfinder clubs bid farewell and departed to their homes on January 18<sup>th</sup> as the camporee came to a close.</p>\r\n<p>--<em>Eben Anbiah</em></p>\r\n<p>To see more pictures from the camporee, go <a href="index.php?option=com_phocagallery&amp;view=category&amp;id=1:pathfinder_camporee_2009&amp;Itemid=68">here</a>.</p>', 1, 3, 0, 53, '2009-02-04 09:00:17', 62, '', '2009-02-08 12:30:08', 62, 62, '2009-02-08 12:30:10', '2009-02-04 09:00:17', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 6, 0, 9, 'pathfinders, camporee, Karnataka, Lyngdoh, President R. John', 'The division wide pathfinder camporee in southern Asia Division was held between January 14 to 18, 2009 in Besant Park, Doddaballapur, Karnataka.', 0, 62, 'robots=\nauthor=Eben Anbiah'),
(62, 'Follow the Bible Report', 'follow-the-bible-report', '', '<span style="font-size: 10pt;"><span style="font-size: 10pt;"><span> </span>Details of the world traveling Bible: this Bible is designed to travel around the world. It has 66 languages and out of which 13 are Indian languages.<span> </span>Exodus in Marathi, Leviticus in Punjabi, Joshua in Nepali, I Kings in Telugu, II Kings in Tamil, I Chronicales in Urudu, Ecclesiastes in Bengali, Isaiah in English, Jeremiah in Hindi, Jonah in Gujarathi, Nahum in Malayalam,<span> </span>Zechriah in Kannada. The Bible weighs nearly 9 kgs and it has started its journey from the Philippines on 11th October, 2008 and it continues to visit different world divisions, touching the hearts of the people to come back to the Bible. </span></span> \r\n', '\r\n<p><span style="font-size: 10pt; font-family: Times New Roman;"><span style="font-size: 10pt;"><br /> In Southern Asia the World travelling bible has visited following places: <br /> On December 14, 2008 Chennai (SEIU), 16 Madurai (SEIU),<span> </span>17 Trivandrum (SWIU),<span> </span>18<span> </span>Thrissur (SWIU), 19 Bangalore (SCIU),<span> </span>21 Hydrabad (ECIU),<span> </span>23 Pune: Salisbury Park (WIU) and Spicer Memorial College,<span> </span>25 Surat – Metas Adventist College, 27 New Delhi (NIU), 28 Nepal (Kathmandu), </span></span></p>\r\n<p><span style="font-size: 10pt; font-family: Times New Roman;"><span style="font-size: 10pt;">30 Vijayawada (ECIU), On January 3, 2009 Shillong (NEIU),<span> </span>7 Hosur (Division office). The same night, it left to Germany, the next division (Euro-Africa Division).</span></span></p>\r\n<p><span style="font-size: 10pt; font-family: Times New Roman;"><span style="font-size: 10pt;"> </span></span></p>\r\n<p><span style="font-size: 10pt; font-family: Times New Roman;"><span style="font-size: 10pt;">At each point, nice spiritual programs were organized and there was spiritual revival, a commitment to read Bible and make it part of<span> </span>one’s life. </span></span></p>\r\n<p>-<em>T. P. Kurian, Department of Communication</em></p>', 1, 3, 0, 53, '2009-02-04 10:45:38', 62, '', '2009-02-04 10:48:50', 62, 0, '0000-00-00 00:00:00', '2009-02-04 10:45:38', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 8, 'Bible, world traveling, languages, Indian, schedule', 'Details of the world traveling Bible: this Bible is designed to travel around the world. It has 66 languages and out of which 13 are Indian languages.', 0, 34, 'robots=\nauthor=T. P. Kurian'),
(63, 'Church Growth Forum - Southern Asia Division', 'church-growth-forum-southern-asia-division', '', '<p>The new leadership, having its focus on church  growth in the New Year organized an open forum under the ministerial association of the division for two days (January 7 &amp; 8, 2009) at Hosur. The unique thing about the forum was that eminent people from the field were invited and they opened to new ideas and new methods for the growth of the church. Some of the topics presented were: church growth strategies by Dr. Albert Vasanthraj from Chennai, cell group/small group strategy by Dr. C. Vijayan, Prayer ministry by Dr. John Wilmott, Media evangelism by Pr. Shadrack Samuel and Dr. S. Johnson, health evangelism by Dr. John Stephen Sunderaj. There were discussions on advantages and disadvantages of public evangelism and city church growth and also on how to reach the affluent. It was a time of intense learning and reflection. Leaders from the field who attended the program, went back with a determination to use the strategies discussed to bring about growth in the local churches.</p>\r\n<p>--<em>T. P. Kurian</em></p>', '', 1, 3, 0, 53, '2009-02-04 10:51:07', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2009-02-04 10:51:07', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 7, 'forum, church growth, new year, ministerial association, evangelism', 'The new leadership, having its focus on church growth in the New Year organized an open forum under the ministerial association of the division for two days (January 7 & 8, 2009) at Hosur.', 0, 8, 'robots=\nauthor=T. P. Kurian'),
(64, 'Division Children’s Ministry Planning Session', 'division-childrens-ministry-planning-session', '', '<p>The union CHM directors met at the college in Surat on January 12 and 13 for two days for consultations and planning. The planning of activities centered around the Year of the Child-2009. A number of events and emphases have been scheduled. Some of these events are children’s congresses, music festivals, craft weekends, singing competitions, and Bible and nature camps. It is anticipated that this year will see greater effort in providing spiritual nurturing for the thousands of children in the Division.</p>\r\n<p>--<em>T. P. Kurian</em></p>', '', 1, 3, 0, 53, '2009-02-04 10:56:21', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2009-02-04 10:56:21', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 6, 'Children''s ministry, planning, year of the child 2009', 'The union CHM directors met at the college in Surat on January 12 and 13 for two days for consultations and planning. The planning of activities centered around the Year of the Child-2009.', 0, 11, 'robots=\nauthor=T. P. Kurian'),
(65, 'Education Summit', 'education-summit', '', '<p>The education department conducted a Principals’ conference in Surat, Gujarat State from Janaury 13 to 17. The Venue was Metas Adventist College with the theme, “Adventist Education – Building for the Future”. There were 265 delegates consisting Principals of schools and colleges, education directors and officers of the unions from all over the Division who attended the meeting. \r\n', '\r\nDr. Garland Dulan, Dr. John M Fowler, Dr. Jeannette Roders Dulan from General Conference were the main resource personnel. Papers were presented on various topics such as: Adventist Education: Planning for a changing world, Adventist Education: When faith informs learning, Adventist Education:  Schools of Prophets or Centers of learning, Basic Virtues Amidst Changing trends in Modern Education etc. The meeting ended on the Sabbath with commitment to provide utmost to their wards as they join the world community in achieving the scope of Adventist education with the view  “educate for eternity”.</p>\r\n<p>--<em>T. P. Kurian</em></p>', 1, 3, 0, 53, '2009-02-04 11:01:02', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2009-02-04 11:01:02', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 5, 'education, summit, conference', 'The education department conducted a Principals’ conference in Surat, Gujarat State from Janaury 13 to 17.', 0, 15, 'robots=\nauthor=T. P. Kurian');
INSERT INTO `jos_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(66, 'Division Wide Treasurers’  Council', 'division-wide-treasurers-council', '', '<p>A division wide treasurers’ council was held in Coimbatore, Tamil Nadu from January 27- 31. The venue was Hotel Aswini Delux. All the treasurers from different levels of Division,  Schools, Colleges and Hospitals were present. A multitude of 186 delegates attended this Council. Due to health reasons Pr. Robert E Lemon could not  make it for the meeting. Mr. James Trude and Dr. John Stanley and other leaders of the Division enlightened the treasurers regarding how to handle the treasury of the Lord. Papers were present on various topics, the main thrust was  “self reliance by 2015”. Days were packed with presentations and lively discussions and brain storming  as how to achieve the goal.</p>\r\n<p>--<em>T. P. Kurian</em></p>', '', 1, 3, 0, 53, '2009-02-04 11:03:57', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2009-02-04 11:03:57', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 4, 'treasurers council, Robert E. Lemon, James Trude, John Stanley', 'A division wide treasurers’ council was held in Coimbatore, Tamil Nadu from January 27- 31.', 0, 11, 'robots=\nauthor=T. P. Kurian'),
(67, 'General Conference Presents Award of Excellence to Dr. M. S. Jeremiah', 'general-conference-presents-award-of-excellence-to-dr-m-s-jeremiah', '', '<p><img style="margin-right: 2px; float: left;" alt="dsc_0266" src="images/stories/february_news/dsc_0266.jpg" height="215" width="320" />In the history of Southern Asia Division, only two people were given “Award of Excellence” by General Conference.  During the year 1982, Dr. M E Cherian and in the year 2009, Dr. M S Jeremiah.  This award of excellence was conferred on Dr. M S Jeremiah during the Education Summit for leaders in the education field in SUD, which was held at Surat in the month of January, 2009.  \r\n', '\r\n</p>\r\n<p>The Education Department of the General Conference of Seventh-day Adventists, upon the recommendation of the Board of Education of Southern Asia Division, honored Dr. M. S. Jeremiah, the President  &amp; CEO of Metas Adventist College in Surat with the Award of Excellence. The Excellence Award is the highest form of recognition an individual could receive because it comes from its own peers and is in recognition of exceptional and outstanding performance in a specific area of Education.</p>\r\n<p>The award was presented by Dr. Garland Dulan, Director of Education, General Conference and Dr. John M. Fowler, Associate Director of Education, General Conference. This award was given to Dr. Jeremiah for his exceptionally distinguished achievements and outstanding contributions to the Adventist society of Southern Asia Division that illustrate and sustain the ideals and beliefs of the Seventh-day Adventist church and contribute greatly to its goals. Dr. Jeremiah had given Adventist education in Southern Asia a new meaning of academic excellence, country-wide service, personal, professional and spiritual commitment, self-reliance and upward mobility.  Dr. M S Jeremiah was commended for envisaging and establishing New Colleges at Ranchi and Nuzvid also.</p>\r\n<p>--<em>T. P. Kurian</em></p>', 1, 3, 0, 53, '2009-03-06 06:43:50', 63, '', '2009-03-09 04:30:23', 62, 0, '0000-00-00 00:00:00', '2009-03-06 06:43:50', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 3, 'excellence, award, southern asia division, m s jeremiah, education summit', 'In the history of Southern Asia Division, only two people were given “Award of Excellence” by General Conference.  During the year 1982, Dr. M E Cherian and in the year 2009, Dr. M S Jeremiah.  This award of excellence was conferred on Dr. M S Jeremiah during the Education Summit for leaders in the education field in SUD, which was held at Surat in the month of January, 2009.', 0, 12, 'robots=\nauthor=T. P. Kurian'),
(68, 'International Risk Management Seminar in Malaysia Feb 8-12.', 'international-risk-management-seminar-in-malaysia-feb-8-12', '', '<p><img style="margin-right: 2px; float: left;" alt="dsc_0616" src="images/stories/february_news/dsc_0616.jpg" height="214" width="322" />A historic Seminar of the Risk management was held in Hotel Hydro Majestic at Penang, Malayasia from Feb. 8-12. Delegates from four Divisions (NSD, SUD, SAD and SPD) attended these meetings. From Southern Asia 22 delegates were present.  Spiritual guidelines were given through the devotionals. Practical usefulness of the risk management in the Adventist organization was presented by various eminent  presenters on the topic such as: Roaring Tigers in the Risk management; The Ministry of Risk Management: Doesn’t God provide, Life safety issues; Vision and mission of health care etc.  They were enriched by many information regarding the function of the risk management in the Adventist organization. Feb 12 the meetings were concluded and delegates departed to their home countries. Penang Adventist Hospital had given full support  for this esteemed program.</p>\r\n<p>--<em>T. P. Kurian</em></p>', '', 1, 3, 0, 53, '2009-03-09 04:33:00', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2009-03-09 04:33:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 2, 'risk, management, seminar, Malaysia', 'A historic Seminar of the Risk management was held in Hotel Hydro Majestic at Penang, Malayasia from Feb. 8-12.', 0, 1, 'robots=\nauthor=T. P. Kurian'),
(69, '‘Pastors in Conversation’ and ‘Let’s talk’ programs held in SUD by Elder Jan Paulson, Feb 24.', 'pastors-in-conversation-and-lets-talk-programs-held-in-sud-by-elder-jan-paulson-feb-24', '', '<img style="margin-right: 2px; float: left;" alt="dsci0058" src="images/stories/february_news/dsci0058.jpg" height="240" width="180" />\r\n<p>Seven city pastors representing 7 Unions in SUD attended the “Pastors in Conversation” program conducted by the Hope channel in Marwah Studio, near New Delhi the capital of India, on February 24.  Pastor R John the SUD president welcomed Elder Jan Paulson, the G C President and introduced the pastors. The Pastors put forth different questions on various issues that they encounter at work such as: Evangelism in this radical thinking world; Administration and Evangelism; Keeping the young people in the church; Job opportunity for the young people; Casteism and its impact on the church. Elder Jan Paulsen explained the issues to their satisfaction. The Pastors were happy to have a direct talk with the world leader who provided them guidance.</p>\r\n', '\r\n<p>The same venue was used for ‘Let’s talk’ program.  27 young people, including professionals and students were the participants. Pastor Frederic Paul was the moderator.  The youngsters raised various issues such as: Opportunity for working in the organization; Family and work co-ordination in the life of Elder Paulson; Arranged marriage which is common in Indian culture; Mission investment in the stock market etc.  Elder Paulson tried to provide them proper guidelines relating to his own experience at times and to their satisfaction. Elder Jan Paulson concluded the program by advising the youngsters: to care for their spiritual needs and to share with others their experience. Over whole it was satisfactory to the young people and they were happy that they had a chance to talk to the world President of the Church.</p>\r\n<p>--<em>T. P. Kurian</em></p>', 1, 3, 0, 53, '2009-03-09 04:49:32', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2009-03-09 04:49:32', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 1, 'Jan Paulsen, Pastor R John, New Delhi, Pastors in Conversation, Let''s talk', 'Seven city pastors representing 7 Unions in SUD attended the “Pastors in Conversation” program conducted by the Hope channel in Marwah Studio, near New Delhi the capital of India, on February 24.  Pastor R John the SUD president welcomed Elder Jan Paulson, the G C President and introduced the pastors.', 0, 2, 'robots=\nauthor=T. P. Kurian');

-- --------------------------------------------------------

--
-- Table structure for table `jos_content_frontpage`
--

DROP TABLE IF EXISTS `jos_content_frontpage`;
CREATE TABLE IF NOT EXISTS `jos_content_frontpage` (
  `content_id` int(11) NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  PRIMARY KEY  (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_content_frontpage`
--

INSERT INTO `jos_content_frontpage` (`content_id`, `ordering`) VALUES
(1, 1),
(68, 3),
(69, 2),
(67, 4);

-- --------------------------------------------------------

--
-- Table structure for table `jos_content_rating`
--

DROP TABLE IF EXISTS `jos_content_rating`;
CREATE TABLE IF NOT EXISTS `jos_content_rating` (
  `content_id` int(11) NOT NULL default '0',
  `rating_sum` int(11) unsigned NOT NULL default '0',
  `rating_count` int(11) unsigned NOT NULL default '0',
  `lastip` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_content_rating`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro`
--

DROP TABLE IF EXISTS `jos_core_acl_aro`;
CREATE TABLE IF NOT EXISTS `jos_core_acl_aro` (
  `id` int(11) NOT NULL auto_increment,
  `section_value` varchar(240) NOT NULL default '0',
  `value` varchar(240) NOT NULL default '',
  `order_value` int(11) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `hidden` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `jos_section_value_value_aro` (`section_value`(100),`value`(100)),
  KEY `jos_gacl_hidden_aro` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `jos_core_acl_aro`
--

INSERT INTO `jos_core_acl_aro` (`id`, `section_value`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', '62', 0, 'Administrator', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro_groups`
--

DROP TABLE IF EXISTS `jos_core_acl_aro_groups`;
CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_groups` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `lft` int(11) NOT NULL default '0',
  `rgt` int(11) NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `jos_gacl_parent_id_aro_groups` (`parent_id`),
  KEY `jos_gacl_lft_rgt_aro_groups` (`lft`,`rgt`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `jos_core_acl_aro_groups`
--

INSERT INTO `jos_core_acl_aro_groups` (`id`, `parent_id`, `name`, `lft`, `rgt`, `value`) VALUES
(17, 0, 'ROOT', 1, 22, 'ROOT'),
(28, 17, 'USERS', 2, 21, 'USERS'),
(29, 28, 'Public Frontend', 3, 12, 'Public Frontend'),
(18, 29, 'Registered', 4, 11, 'Registered'),
(19, 18, 'Author', 5, 10, 'Author'),
(20, 19, 'Editor', 6, 9, 'Editor'),
(21, 20, 'Publisher', 7, 8, 'Publisher'),
(30, 28, 'Public Backend', 13, 20, 'Public Backend'),
(23, 30, 'Manager', 14, 19, 'Manager'),
(24, 23, 'Administrator', 15, 18, 'Administrator'),
(25, 24, 'Super Administrator', 16, 17, 'Super Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro_map`
--

DROP TABLE IF EXISTS `jos_core_acl_aro_map`;
CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_map` (
  `acl_id` int(11) NOT NULL default '0',
  `section_value` varchar(230) NOT NULL default '0',
  `value` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`acl_id`,`section_value`,`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_core_acl_aro_map`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro_sections`
--

DROP TABLE IF EXISTS `jos_core_acl_aro_sections`;
CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_sections` (
  `id` int(11) NOT NULL auto_increment,
  `value` varchar(230) NOT NULL default '',
  `order_value` int(11) NOT NULL default '0',
  `name` varchar(230) NOT NULL default '',
  `hidden` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `jos_gacl_value_aro_sections` (`value`),
  KEY `jos_gacl_hidden_aro_sections` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `jos_core_acl_aro_sections`
--

INSERT INTO `jos_core_acl_aro_sections` (`id`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', 1, 'Users', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_groups_aro_map`
--

DROP TABLE IF EXISTS `jos_core_acl_groups_aro_map`;
CREATE TABLE IF NOT EXISTS `jos_core_acl_groups_aro_map` (
  `group_id` int(11) NOT NULL default '0',
  `section_value` varchar(240) NOT NULL default '',
  `aro_id` int(11) NOT NULL default '0',
  UNIQUE KEY `group_id_aro_id_groups_aro_map` (`group_id`,`section_value`,`aro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_core_acl_groups_aro_map`
--

INSERT INTO `jos_core_acl_groups_aro_map` (`group_id`, `section_value`, `aro_id`) VALUES
(25, '', 10);

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_log_items`
--

DROP TABLE IF EXISTS `jos_core_log_items`;
CREATE TABLE IF NOT EXISTS `jos_core_log_items` (
  `time_stamp` date NOT NULL default '0000-00-00',
  `item_table` varchar(50) NOT NULL default '',
  `item_id` int(11) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_core_log_items`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_core_log_searches`
--

DROP TABLE IF EXISTS `jos_core_log_searches`;
CREATE TABLE IF NOT EXISTS `jos_core_log_searches` (
  `search_term` varchar(128) NOT NULL default '',
  `hits` int(11) unsigned NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_core_log_searches`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_directory_categories`
--

DROP TABLE IF EXISTS `jos_directory_categories`;
CREATE TABLE IF NOT EXISTS `jos_directory_categories` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `image` varchar(255) NOT NULL default '',
  `section` varchar(50) NOT NULL default '',
  `image_position` varchar(30) NOT NULL default '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `editor` varchar(50) default NULL,
  `ordering` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `count` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  `contact_section` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `cat_idx` (`section`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=103 ;

--
-- Dumping data for table `jos_directory_categories`
--

INSERT INTO `jos_directory_categories` (`id`, `parent_id`, `title`, `name`, `alias`, `image`, `section`, `image_position`, `description`, `published`, `checked_out`, `checked_out_time`, `editor`, `ordering`, `access`, `count`, `params`, `contact_section`) VALUES
(56, 0, 'Communication', '', 'department-of-communication', '', 'com_directory', 'left', 'The department of communication serves to make contact with the world to tell them about Jesus.', 1, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, '', 1),
(57, 0, 'Education', '', 'department-of-education', '', 'com_directory', 'left', 'The Department of Education exists to educate others about Jesus.', 1, 0, '0000-00-00 00:00:00', NULL, 3, 0, 0, '', 1),
(58, 0, 'Administrators', '', 'administrators', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, '', 1),
(59, 0, 'Secretariat', '', 'secretariat', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 4, 0, 0, '', 1),
(60, 0, 'PARL', '', 'parl', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 9, 0, 0, '', 1),
(61, 0, 'Treasury', '', 'treasury', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 5, 0, 0, '', 1),
(62, 0, 'Children''s Ministries', '', 'child-ministries', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 6, 0, 0, '', 1),
(63, 0, 'Church Nurturing Ministries', '', 'church-nurturing-ministries', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 7, 0, 0, '', 1),
(64, 0, 'Chaplaincy', '', 'chaplaincy', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 8, 0, 0, '', 1),
(65, 0, 'Faith Development In Context', '', 'faith-development-in-context', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 10, 0, 0, '', 1),
(66, 0, 'Adventist Child India', '', 'adventist-child-india', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 11, 0, 0, '', 1),
(67, 0, 'Family', '', 'family', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 12, 0, 0, '', 1),
(68, 0, 'Youth', '', 'youth', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 13, 0, 0, '', 1),
(69, 0, 'Global Mission', '', 'global-mission', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 14, 0, 0, '', 1),
(70, 0, 'Health and Temperance', '', 'health-and-temperance', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 15, 0, 0, '', 1),
(71, 0, 'Stewardship', '', 'stewardship', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 16, 0, 0, '', 1),
(72, 0, 'Department of Legal Affairs', '', 'legal-affairs', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 17, 0, 0, '', 1),
(73, 0, 'Ministerial', '', 'ministerial', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 18, 0, 0, '', 1),
(74, 0, 'Publishing', '', 'publishing', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 19, 0, 0, '', 1),
(75, 0, 'Retirement Plan', '', 'retirement-plan', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 20, 0, 0, '', 1),
(76, 0, 'Sabbath School', '', 'sabbath-school', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 21, 0, 0, '', 1),
(77, 0, 'Personal Ministries', '', 'personal-ministries', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 22, 0, 0, '', 1),
(78, 0, 'Ministry to the Blind', '', 'ministry-to-the-blind', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 23, 0, 0, '', 1),
(79, 0, 'Special Ministries', '', 'special-ministries', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 24, 0, 0, '', 1),
(80, 0, 'TRUST Services', '', 'trust-services', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 25, 0, 0, '', 1),
(81, 0, 'Women''s Ministries', '', 'womens-ministries', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 26, 0, 0, '', 1),
(82, 0, 'Auditing Service', '', 'auditing-service', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 27, 0, 0, '', 1),
(83, 0, 'Southern Asia Tidings', '', 'southern-asia-tidings', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 28, 0, 0, '', 1),
(84, 0, 'Hinduism Study Center', '', 'hinduism-study-center', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 29, 0, 0, '', 1),
(85, 0, 'Spirit of Prophecy', '', 'spirit-of-prophecy', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 30, 0, 0, '', 1),
(86, 0, 'Satellite Evangelism', '', 'satellite-evangelism', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 31, 0, 0, '', 1),
(87, 0, 'Building', '', 'building', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 32, 0, 0, '', 1),
(88, 0, 'Adventist Risk Management', '', 'adventist-risk-management', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 33, 0, 0, '', 1),
(89, 0, 'Adventist Volunteer Service', '', 'adventist-volunteer-service', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 34, 0, 0, '', 1),
(90, 0, 'Adventist Media Centre', '', 'adventist-media-centre', '', 'com_directory', 'left', '<ul class="addressInformation">   <li>Post Box 1446, Marketyard</li>   <li>Pune 411 037,</li>   <li>Maharashtra</li>   <li><strong>Telephone</strong>:  (020) 2427 1483/24265450</li>   <li><strong>Fax</strong>:  (020) 2427 - 1483</li>   <li><strong>Email</strong>:<ul class="emails">            <li><a href="mailto:amc@pn2.vsnl.net.in">amc@pn2.vsnl.net.in</a></li>            <li><a href="mailto:amc3@vsnl.com">amc3@vsnl.com</a></li>            </ul>    </li>    </ul>', 1, 0, '0000-00-00 00:00:00', NULL, 35, 0, 0, '', 1),
(91, 0, 'Oriental Watchman Publishing House', '', 'oriental-watchman-publishing-house', '', 'com_directory', 'left', '<ul class="addressInformation">   <li>Post Box 1417, Salisbury Park</li>   <li>Pune 411 037</li>   <li><strong>Telephone</strong>: 91(020)242-614-41/242-730-17</li>   <li><strong>Fax</strong>: 91(020)242-616-38</li>   <li><strong>Email</strong>: <ul class="emails"><li>owph@pn2.vsnl.net.in</li></ul></li></ul>', 1, 0, '0000-00-00 00:00:00', NULL, 36, 0, 0, '', 1),
(92, 0, 'Intra Church Publications', '', 'intra-church-publications', '', 'com_directory', 'left', '<ul class="addressInformation"> <li>P O Box 1413</li> <li>Salisbury Park</li> <li>Pune 411 037</li> <li><strong>Telephone</strong>: 91(020)562-648-05</li> </ul>', 1, 0, '0000-00-00 00:00:00', NULL, 37, 0, 0, '', 1),
(93, 0, 'Legal Affairs', '', 'legal-affairs', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 38, 0, 0, '', 1),
(94, 0, 'East - Central India Union', '', 'east-central-india-union', '', 'com_directory', 'left', '<ul class="addressInformation">\r\n  <li>2 Chapel Road</li>\r\n  <li>Hyderabad 500 001</li>\r\n  <li>Andhra Pradesh</li>\r\n  <li><strong>Telephone</strong>: 91(040)232-018-32/232-000-79</li>\r\n  <li><strong>Fax</strong>:  (040)232-027-04</li>\r\n  <li><strong>E-mail</strong>:   \r\n    <ul class="emails">\r\n      <li>ciusda1@sify.com</li>\r\n    </ul>\r\n  </li>\r\n</ul>', 1, 0, '0000-00-00 00:00:00', NULL, 39, 0, 0, '', 2),
(95, 0, 'Western India Union', '', 'western-india-union', '', 'com_directory', 'left', '<ul class="addressInformation">\r\n  <li>Post Box 1413, Market Yard</li>\r\n  <li>Pune 411 037</li>\r\n  <li>Maharashtra</li>\r\n  <li><strong>Telephone</strong>:  91(020)242-718-96, 242-718-9</li>\r\n  <li><strong>Fax</strong>:  91(020)242-730-20</li>\r\n</ul>', 1, 0, '0000-00-00 00:00:00', NULL, 40, 0, 0, '', 2),
(96, 0, 'Southwest India Union', '', 'southwest-india-union', '', 'com_directory', 'left', '<ul class="addressInformation">\r\n  <li>B. No. 753, Evergreen Lane</li>\r\n  <li>Moospet Road</li>\r\n  <li>Thrissur 680 005</li>\r\n  <li>Kerala</li>\r\n  <li><strong>Telephone</strong>:  91(0487)244-0341, 244-0343</li>\r\n  <li><strong>Fax</strong>:  91(0487)-2440-343</li>\r\n  <li><strong>E-mail</strong>:  \r\n    <ul class="emails"><li>keusda@sancharnet.in</li></ul>\r\n  </li>\r\n</ul>', 1, 0, '0000-00-00 00:00:00', NULL, 41, 0, 0, '', 2),
(97, 0, 'Southeast India Union', '', 'southeast-india-union', '', 'com_directory', 'left', '<ul class="addressInformation">\r\n  <li>197 GST Road, Vandalur</li>\r\n  <li>Chennai 600 048</li>\r\n  <li>Tamil Nadu</li>\r\n  <li><strong>Telephone</strong>:  91(044)223-995-95, 223-995-96</li>\r\n  <li><strong>Fax</strong>:  91(044)223-996-52</li>\r\n  <li><strong>E-mail</strong>:  <ul class="emails"><li>siu_sda@vsnl.net</li></ul></li>\r\n</ul>', 1, 0, '0000-00-00 00:00:00', NULL, 42, 0, 0, '', 2),
(98, 0, 'South - Central India Union', '', 'south-central-india-union', '', 'com_directory', 'left', '<ul class="addressInformation">\r\n  <li>Spencer Road</li>\r\n  <li>Frazer Town</li>\r\n  <li>Bangalore 560 005</li>\r\n  <li>Karnataka</li>\r\n  <li><strong>Telephone</strong>:  91(080)255-671-27, 255-698-378</li>\r\n  <li><strong>Fax</strong>:  91(080)253-027-21</li>\r\n</ul>', 1, 0, '0000-00-00 00:00:00', NULL, 43, 0, 0, '', 2),
(99, 0, 'Northern India Union', '', 'northern-india-union', '', 'com_directory', 'left', '<ul class="addressInformation">\r\n  <li>11 Hailey Road</li>\r\n  <li>New Delhi 110 001</li>\r\n  <li><strong>Telephone</strong>:  91(011)233-249-59, 233-296-81</li>\r\n  <li><strong>Fax</strong>:  91(011)233-249-59</li>\r\n  <li><strong>E-mail</strong>:  <ul class="emails"><li>niusda@vsnl.com</li></ul></li>\r\n</ul>', 1, 0, '0000-00-00 00:00:00', NULL, 44, 0, 0, '', 2),
(100, 0, 'Northeast India Union', '', 'northeast-india-union', '', 'com_directory', 'left', '<ul class="addressInformation">\r\n  <li>"Santana," Laitumkhrah</li>\r\n  <li>Shillong 793 003</li>\r\n  <li>Meghalaya</li>\r\n  <li><strong>Telephone</strong>:  91(0364)252-2471</li>\r\n  <li><strong>Fax</strong>:  91(0364)252-2471</li>\r\n  <li><strong>E-mail</strong>:  \r\n    <ul class="emails"><li>neiusda1@sancharnet.in</li></ul>\r\n  </li>\r\n</ul>', 1, 0, '0000-00-00 00:00:00', NULL, 45, 0, 0, '', 2),
(101, 0, 'The Developers', '', 'the-developers', '', 'com_directory', 'left', 'The illustrious people who work on this website.', 1, 0, '0000-00-00 00:00:00', NULL, 46, 0, 0, '', 1),
(102, 0, 'India Financial Association', '', 'india-financial-association', '', 'com_directory', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 47, 0, 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_directory_contacts`
--

DROP TABLE IF EXISTS `jos_directory_contacts`;
CREATE TABLE IF NOT EXISTS `jos_directory_contacts` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) character set utf8 NOT NULL default '',
  `alias` varchar(255) character set utf8 NOT NULL default '',
  `con_position` varchar(255) character set utf8 default NULL,
  `address` text character set utf8,
  `suburb` varchar(100) character set utf8 default NULL,
  `state` varchar(100) character set utf8 default NULL,
  `country` varchar(100) character set utf8 default NULL,
  `postcode` varchar(100) character set utf8 default NULL,
  `telephone` varchar(255) character set utf8 default NULL,
  `fax` varchar(255) character set utf8 default NULL,
  `misc` mediumtext character set utf8,
  `image` varchar(255) character set utf8 default NULL,
  `imagepos` varchar(20) character set utf8 default NULL,
  `email_to` varchar(255) character set utf8 default NULL,
  `default_con` tinyint(1) unsigned NOT NULL default '0',
  `published` tinyint(1) unsigned NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `params` text character set utf8 NOT NULL,
  `user_id` int(11) NOT NULL default '0',
  `catid` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `mobile` varchar(255) character set utf8 NOT NULL default '',
  `webpage` varchar(255) character set utf8 NOT NULL default '',
  `first_name` varchar(128) character set utf8 NOT NULL default '',
  `last_name` varchar(128) character set utf8 NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=127 ;

--
-- Dumping data for table `jos_directory_contacts`
--

INSERT INTO `jos_directory_contacts` (`id`, `name`, `alias`, `con_position`, `address`, `suburb`, `state`, `country`, `postcode`, `telephone`, `fax`, `misc`, `image`, `imagepos`, `email_to`, `default_con`, `published`, `checked_out`, `checked_out_time`, `ordering`, `params`, `user_id`, `catid`, `access`, `mobile`, `webpage`, `first_name`, `last_name`) VALUES
(2, 'Gordon Christo', 'dr-gordon-christo', 'Director', '', '', '', '', '', '91-(0)4344-263835', '', '', '', NULL, 'gechristo@sud-adventist.org', 0, 1, 62, '2008-12-01 08:59:14', 2, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=0\nshow_suburb=0\nshow_state=0\nshow_postcode=0\nshow_country=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=0\nshow_webpage=0\nshow_misc=0\nshow_image=0\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 56, 0, '91(0)944-3375-251', '', 'Gordon', 'Christo'),
(3, 'G Nageshwara  Rao', 'dr-gollakoti-nageshwar-rao-phd', 'Director', '', '', '', '', '', '91-(0)4344-263842', '', '', '', NULL, 'gnageshwarrao@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=0\nshow_suburb=0\nshow_state=0\nshow_postcode=0\nshow_country=0\nshow_telephone=1\nshow_mobile=0\nshow_fax=0\nshow_webpage=0\nshow_misc=0\nshow_image=0\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 57, 0, '91-(0)944-2645-345', '', 'G Nageshwara', 'Rao'),
(6, 'R John', 'r-john', NULL, '', '', '', '', '', '91-(0)4344-263827', '', '', '', NULL, 'rjohn@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 58, 0, '91-(0)944-3375-234', '', 'R', 'John'),
(15, 'Le Roy  Samuel', 'le-roy-samuel', NULL, '', '', '', '', '', '91-(0)944-2602-170', '', '', '', NULL, 'leroysamuel@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 2, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 61, 0, '', '', 'Le Roy', 'Samuel'),
(7, 'G S Robert Clive', 'g-s-robert-clive', NULL, '', '', '', '', '', '91-(0)4344-263811', '', '', '', NULL, 'gsrobertclive@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 2, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 58, 0, '', '', 'G S Robert', 'Clive'),
(8, 'M C John', 'm-c-john', NULL, '', '', '', '', '', '91-(0)4344-263802', '', '', '', NULL, 'mcjohn@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 3, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 58, 0, '91-(0)944-2621-345', '', 'M C', 'John'),
(9, 'R L Robinson', 'r-l-robinson', NULL, '', '', '', '', '', '91-(0)4344-263820', '', '', '', NULL, 'robertr@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 4, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 58, 0, '91-(0)944-3375-238', '', 'R L', 'Robinson'),
(10, 'Candy Zook', 'candy-zook', NULL, '', '', '', '', '', '91-(0)4344-263853', '', '', '', NULL, 'cdzook52@yahoo.com', 0, 1, 0, '0000-00-00 00:00:00', 5, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 58, 0, '91-(0)944-2631-345', '', 'Candy', 'Zook'),
(11, 'Cyril Monthero', 'cyril-monthero', NULL, '', '', '', '', '', '91(0)944-8904-983', '', '', '', NULL, 'cyrilmonthero@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 59, 0, '', '', 'Cyril', 'Monthero'),
(12, 'G R Mohan Roy', 'g-r-mohan-roy', NULL, '', '', '', '', '', '', '', '', '', NULL, 'mohanroy@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 6, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 58, 0, '91-(0)4344-263819', '', 'G R Mohan', 'Roy'),
(13, 'Shamgar Prasada Rao', 'shamgar-prasada-rao', NULL, '', '', '', '', '', '91-(0)4344-263828', '', '', '', NULL, 'shamgarprao@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 2, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 59, 0, '91-(0)995-240-4943', '', 'Shamgar Prasada', 'Rao'),
(14, 'P E Selvin  Moorthy', 'p-e-selvin-moorthy', NULL, '', '', '', '', '', '91-(0)4344-263801', '', '', '', NULL, 'selvindmoorthy@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 61, 0, '91-(0)944-3375-229', '', 'P E Selvin', 'Moorthy'),
(16, 'Jothi J Anbiah', 'jothi-j-anbiah', NULL, '', '', '', '', '', '91-(0)4344-263891', '', '', '', NULL, 'jothianbiah@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 3, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 61, 0, '91-(0)944-3375-240', '', 'Jothi J', 'Anbiah'),
(17, 'Brenda Robinson', 'brenda-robinson', NULL, '', '', '', '', '', '91-(0)4344-263822', '', '', '', NULL, 'brendar@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 4, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 61, 0, '91-(0)944-3375-239', '', 'Brenda', 'Robinson'),
(18, 'V P  Singh', 'v-p-singh', NULL, '', '', '', '', '', '91-(0)4344-263875', '', '', '', NULL, 'vpsingh@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 5, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 61, 0, '91-(0)944-2641-345', '', 'V P', 'Singh'),
(19, 'Paulraj Isaiah', 'paulraj-isaiah', NULL, '', '', '', '', '', '91-(0)4344-263848', '', '', '', NULL, 'paulrajisaiah@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 63, 0, '91-(0)944-3375-260', '', 'Paulraj', 'Isaiah'),
(20, 'Ramani Kurian', 'ramani-kurian', NULL, '', '', '', '', '', '91-(0)4344-263846', '', '', '', NULL, 'ramanikurian@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 2, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 57, 0, '', '', 'Ramani', 'Kurian'),
(21, 'T P Kurian', 't-p-kurian', NULL, '', '', '', '', '', '91-(0)4344-263831', '', '', '', NULL, 'tpkurian@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 65, 0, '91-(0)944-2647-234', '', 'T P', 'Kurian'),
(22, 'Lionel F Lyngdoh', 'lionel-f-lyngdoh', NULL, '', '', '', '', '', '91-(0)4344-263862', '', '', '', NULL, 'lyngdoh@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 67, 0, '91-(0)944-3375-228', '', 'Lionel F', 'Lyngdoh'),
(23, 'Ramesh Y Jadhav', 'ramesh-y-jadhav', NULL, '', '', '', '', '', '91-(0)4344-263865', '', '', '', NULL, 'jadhavry@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 69, 0, '91-(0)944-3375-236', '', 'Ramesh Y', 'Jadhav'),
(24, 'M D Joseph', 'm-d-joseph', NULL, '', '', '', '', '', '91-(0)4344-263857', '', '', '', NULL, 'mdjoseph@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 70, 0, '91-(0)948-666-5831', '', 'M D', 'Joseph'),
(25, 'Jayawant  Peter', 'jayawant-peter', NULL, '', '', '', '', '', '91-(0)4344-263879', '', '', '', NULL, 'jayawanthpeter@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 7, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 93, 0, '91-(0)944-3375-225', '', 'Jayawant', 'Peter'),
(26, 'Anita Livingston', 'anita-livingston', NULL, '', '', '', '', '', '91-(0)4344-263829', '', '', '', NULL, 'anital@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 8, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 93, 0, '91-(0)995-2639-017', '', 'Anita', 'Livingston'),
(27, 'M Wilson', 'm-wilson', NULL, '', '', '', '', '', '91-(0)4344-263845', '', '', '', NULL, 'mwilson@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 73, 0, '91-(0)944-2644-234', '', 'M', 'Wilson'),
(28, 'A J  Tito', 'a-j-tito', NULL, '', '', '', '', '', '91-(0)4344-263861', '', '', '', NULL, 'tito@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 74, 0, '91-(0)944-3377-439', '', 'A J', 'Tito'),
(31, 'William  George', 'william-george', NULL, '', '', '', '', '', '91-(0)944-3375-233', '', '', '', NULL, 'williamgeorge@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 79, 0, '', '', 'William', 'George'),
(30, 'Ganaraj W Kore', 'ganaraj-w-kore', NULL, '', '', '', '', '', '91-(0)4344-263856', '', '', '', NULL, 'gnanarajkore@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 76, 0, '91-(0)944-3375-241', '', 'Ganaraj W', 'Kore'),
(32, 'Ch Victor  Sam', 'ch-victor-sam', NULL, '', '', '', '', '', '91-(0)944-3375-246', '', '', '', NULL, 'victorsam@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 2, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 79, 0, '', '', 'Ch Victor', 'Sam'),
(46, 'Edison Samraj', 'edison-samraj', NULL, '', '', '', '', '', '91-(0)985-0426-704', '', '', '', NULL, 'e_samraj@vsnl.net', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 92, 0, '', '', 'Edison', 'Samraj'),
(34, 'Hepzibah Kore', 'hepzibah-kore', NULL, '', '', '', '', '', '91-(0)4344-263832', '', '', '', NULL, 'hepzibahkore@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 81, 0, '91-(0)944-3375-241', '', 'Hepzibah', 'Kore'),
(35, 'Michael Prasada  Rao', 'michael-prasada-rao', NULL, '', '', '', '', '', '91-(0)4344-263815', '', '', '', NULL, 'michaelprao@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 82, 0, '91-(0)944-3377-592', '', 'Michael Prasada', 'Rao'),
(36, 'Jayaraj  Thangavelu', 'jayaraj-thangavelu', NULL, '', '', '', '', '', '91-(0)4344-263812', '', '', '', NULL, 'jayarajt@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 2, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 82, 0, '91-(0)944-3375-231', '', 'Jayaraj', 'Thangavelu'),
(37, 'Mathew  Devasahayam', 'mathew-devasahayam', NULL, '', '', '', '', '', '91(0)944-3375-232', '', '', '', NULL, 'mathewdevasahayam@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 3, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 82, 0, '', '', 'Mathew', 'Devasahayam'),
(38, 'Rosenita Christo', 'rosenita-christo', NULL, '', '', '', '', '', '91-(0)4344-263854', '', '', '', NULL, 'rosechristo@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 83, 0, '91-(0)944-3375-253', '', 'Rosenita', 'Christo'),
(39, 'Margaret  Tito', 'margaret-tito', NULL, '', '', '', '', '', '', '', '', '', NULL, 'margaret@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 75, 0, '', '', 'Margaret', 'Tito'),
(40, 'John Masefield', 'john-masefield', NULL, '', '', '', '', '', '91-(0)4344-263805', '', '', '', NULL, 'johnmasefield@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 87, 0, '91-(0)944-3375-227', '', 'John', 'Masefield'),
(41, 'John  Mathew', 'john-mathew', NULL, '', '', '', '', '', '91-(0)944-3375-243', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 2, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 87, 0, '', '', 'John', 'Mathew'),
(42, 'Flora John', 'flora-john', NULL, '', '', '', '', '', '91-(0)4344-263860', '', '', '', NULL, 'childcare@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 66, 0, '', '', 'Flora', 'John'),
(43, 'Rachel John', 'rachel-john', NULL, '', '', '', '', '', '91-(0)4344-263880', '', '', '', NULL, 'acioffice@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 2, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 66, 0, '', '', 'Rachel', 'John'),
(44, 'Edwin  Charles', 'edwin-charles', NULL, '', '', '', '', '', '91-(0)94-225-036-02', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 90, 0, '', '', 'Edwin', 'Charles'),
(45, 'Edwin B Matthews', 'edwin-b-matthews', NULL, '', '', '', '', '', '91-(0)942-2305-808/91(020)242-650-70', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 91, 0, '', '', 'Edwin B', 'Matthews'),
(47, 'Ch John', 'ch-john', NULL, '', '', '', '', '', '91-(0)984-8129-551/232-018-32', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 94, 0, '', '', 'Ch', 'John'),
(48, 'M D Edward', 'm-d-edward', NULL, '', '', '', '', '', '91-(0)984-8751-781', '', '', '', NULL, '', 0, 1, 62, '2008-11-26 09:27:39', 2, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 94, 0, '', '', 'M D', 'Edward'),
(49, 'D Alfred  Raju', 'd-alfred-raju', NULL, '', '', '', '', '', '91-(0)984-811-0006', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 3, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 94, 0, '', '', 'D Alfred', 'Raju'),
(50, 'Pilli Edward Prasad', 'pilli-edward-prasad', NULL, '', '', '', '', '', '', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 4, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 94, 0, '', '', 'Pilli Edward', 'Prasad'),
(51, 'Davy Sudhakar', 'davy-sudhakar', NULL, '', '', '', '', '', '91-(0)988-5499-825', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 5, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 94, 0, '', '', 'Davy', 'Sudhakar'),
(107, 'Sosamma Varghese', 'sosamma-varghese', NULL, '', '', '', '', '', '', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 4, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 96, 0, '', '', 'Sosamma', 'Varghese'),
(53, 'Ch Prabhakar  Rao', 'ch-prabhakar-rao', NULL, '', '', '', '', '', '', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 7, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 94, 0, '', '', 'Ch Prabhakar', 'Rao'),
(54, 'Ch Samuel Paul', 'ch-samuel-paul', NULL, '', '', '', '', '', '91-(0)944-0169-053', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 8, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 94, 0, '', '', 'Ch Samuel', 'Paul'),
(55, 'T Robinson Bob', 't-robinson-bob', NULL, '', '', '', '', '', '91-(0)986-6161-356', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 9, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 94, 0, '', '', 'T Robinson', 'Bob'),
(56, 'Ch Vinodhini  John', 'ch-vinodhini-john', NULL, '', '', '', '', '', '', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 10, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 94, 0, '', '', 'Ch Vinodhini', 'John'),
(57, 'Madhuramani Wilbert', 'madhuramani-wilbert', NULL, '', '', '', '', '', '', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 11, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 94, 0, '', '', 'Madhuramani', 'Wilbert'),
(58, 'K R Jones', 'k-r-jones', NULL, '', '', '', '', '', '91-(0)998-926-5077', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 12, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 94, 0, '', '', 'K R', 'Jones'),
(59, 'J G Paulson', 'j-g-paulson', NULL, '', '', '', '', '', '91-(0)984-814-4278', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 13, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 94, 0, '', '', 'J G', 'Paulson'),
(60, 'L C Colney', 'l-c-colney', NULL, '', '', '', '', '', '91-(0)943-6117-829/ 252-1337', '', '', '', NULL, 'neiupre@sancharnet.in', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 100, 0, '', '', 'L C', 'Colney'),
(61, 'C C Dkhar', 'c-c-dkhar', NULL, '', '', '', '', '', '91-(0)943-6105-626/252-1975', '', '', '', NULL, 'neiusecretary@yahoo.com', 0, 1, 0, '0000-00-00 00:00:00', 2, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 100, 0, '', '', 'C C', 'Dkhar'),
(62, 'S K Archete', 's-k-archete', NULL, '', '', '', '', '', '91-(0)943-6116-752/ 252-0547', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 3, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 100, 0, '', '', 'S K', 'Archete'),
(63, 'Mabel V Dkhar', 'mabel-v-dkhar', NULL, '', '', '', '', '', '91-(0)986-3023-109', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 4, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 100, 0, '', '', 'Mabel V', 'Dkhar'),
(64, 'Barnabas Zimik', 'barnabas-zimik', NULL, '', '', '', '', '', '91-(0)986-311-517', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 5, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 100, 0, '', '', 'Barnabas', 'Zimik'),
(65, 'Zohruaia Renthlei', 'zohruaia-renthlei', NULL, '', '', '', '', '', '91-(0)943-6111-188/250-1405', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 6, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 100, 0, '', '', 'Zohruaia', 'Renthlei'),
(66, 'Ramsangpuii Colney', 'ramsangpuii-colney', NULL, '', '', '', '', '', '91-(0)943-630-4193/252-1337', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 7, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 100, 0, '', '', 'Ramsangpuii', 'Colney'),
(67, 'R Rabha', 'r-rabha', NULL, '', '', '', '', '', '91-(0)986-214-4744', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 8, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 100, 0, '', '', 'R', 'Rabha'),
(105, 'P H Paulson', 'p-h-paulson', NULL, '', '', '', '', '', '91-(0)989-5691-844', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 2, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 96, 0, '', '', 'P H', 'Paulson'),
(69, 'Hidayat Masih', 'hidayat-masih', NULL, '', '', '', '', '', '91-(0)981-1382-966', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 99, 0, '', '', 'Hidayat', 'Masih'),
(70, 'Ezras Lakra', 'ezras-lakra', NULL, '', '', '', '', '', '91-(0)981-1387-344', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 2, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 99, 0, '', '', 'Ezras', 'Lakra'),
(71, 'Alamgir Khan', 'alamgir-khan', NULL, '', '', '', '', '', '91-(0)981-1313-558', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 3, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 99, 0, '', '', 'Alamgir', 'Khan'),
(72, 'Veena Gayen', 'veena-gayen', NULL, '', '', '', '', '', '', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 4, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 99, 0, '', '', 'Veena', 'Gayen'),
(73, 'S B Bairagi', 's-b-bairagi', NULL, '', '', '', '', '', '', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 5, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 99, 0, '', '', 'S B', 'Bairagi'),
(74, 'Benedict Biswas', 'benedict-biswas', NULL, '', '', '', '', '', '', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 6, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 99, 0, '', '', 'Benedict', 'Biswas'),
(75, 'Premila Masih', 'premila-masih', NULL, '', '', '', '', '', '', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 7, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 99, 0, '', '', 'Premila', 'Masih'),
(104, 'S Stanley', 's-stanley', NULL, '', '', '', '', '', '91-(0)944-6141-822/244-6523', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 96, 0, '', '', 'S', 'Stanley'),
(77, 'S R Bhatti', 's-r-bhatti', NULL, '', '', '', '', '', '', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 9, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 99, 0, '', '', 'S R', 'Bhatti'),
(78, 'Daniel Padmaraj', 'daniel-padmaraj', NULL, '', '', '', '', '', '91-(0)984-5003-077/253-650-92', '', '', '', NULL, 'sciu_president@yahoo.co.in', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 98, 0, '', '', 'Daniel', 'Padmaraj'),
(79, 'D Jeyadev', 'd-jeyadev', NULL, '', '', '', '', '', '91-(0)998-6459-183/254-912-52', '', '', '', NULL, 'sciu_execsecretary@yahoo.co.in', 0, 1, 0, '0000-00-00 00:00:00', 2, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 98, 0, '', '', 'D', 'Jeyadev'),
(80, 'Edwin Stanley', 'edwin-stanley', NULL, '', '', '', '', '', '91-(0)944-8356-527/253-027-21/256-527-431', '', '', '', NULL, 'sciu_treasurer@yahoo.co.in', 0, 1, 0, '0000-00-00 00:00:00', 3, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 98, 0, '', '', 'Edwin', 'Stanley'),
(81, 'Johnson Abraham', 'johnson-abraham', NULL, '', '', '', '', '', '91-(0)984-4068-766', '', '', '', NULL, 'sciu_assoctre@vsnl.net', 0, 1, 0, '0000-00-00 00:00:00', 4, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 98, 0, '', '', 'Johnson', 'Abraham'),
(82, 'Ranjan D', 'ranjan-d', NULL, '', '', '', '', '', '91-(0)944-8055-890', '', '', '', NULL, 'sciu_asstreasurer@yahoo.co.in', 0, 1, 0, '0000-00-00 00:00:00', 5, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 98, 0, '', '', 'Ranjan', 'D');
INSERT INTO `jos_directory_contacts` (`id`, `name`, `alias`, `con_position`, `address`, `suburb`, `state`, `country`, `postcode`, `telephone`, `fax`, `misc`, `image`, `imagepos`, `email_to`, `default_con`, `published`, `checked_out`, `checked_out_time`, `ordering`, `params`, `user_id`, `catid`, `access`, `mobile`, `webpage`, `first_name`, `last_name`) VALUES
(83, 'Ravindra Shankar', 'ravindra-shankar', NULL, '', '', '', '', '', '91-(0)944-8355-255', '', '', '', NULL, 'sciu_ravindrashankar@yahoo.co.in', 0, 1, 0, '0000-00-00 00:00:00', 6, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 98, 0, '', '', 'Ravindra', 'Shankar'),
(84, 'Swamidas David', 'swamidas-david', NULL, '', '', '', '', '', '91-(0)990-0161-692', '', '', '', NULL, 'sciu_swamidas@yahoo.co.in', 0, 1, 0, '0000-00-00 00:00:00', 7, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 98, 0, '', '', 'Swamidas', 'David'),
(85, 'Robert Donald', 'robert-donald', NULL, '', '', '', '', '', '(080)255-415-22; 91(0)944-9764-408', '', '', '', NULL, 'sciu_robertdonald@yahoo.co.in', 0, 1, 0, '0000-00-00 00:00:00', 8, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 98, 0, '', '', 'Robert', 'Donald'),
(87, 'Philip Shekar', 'philip-shekar', NULL, '', '', '', '', '', '91(0)988-6990-647', '', '', '', NULL, 'sciu_philipshekar@yahoo.co.in', 0, 1, 0, '0000-00-00 00:00:00', 9, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 98, 0, '', '', 'Philip', 'Shekar'),
(88, 'D Jayadev', 'd-jayadev', NULL, '', '', '', '', '', '91(0)998-6459-183/254-912-52', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 10, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 98, 0, '', '', 'D', 'Jayadev'),
(89, 'S Shantha Kumar', 's-shantha-kumar', NULL, '', '', '', '', '', '91(0)988-0697-691', '', '', '', NULL, 'sciu_shanthapdd@yahoo.co.in', 0, 1, 0, '0000-00-00 00:00:00', 11, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 98, 0, '', '', 'S Shantha', 'Kumar'),
(90, 'Eileen Padmaraj', 'eileen-padmaraj', NULL, '', '', '', '', '', '91(080)253-650-92; 0988-0545-279', '', '', '', NULL, 'sciu_eileen08@yahoo.co.in', 0, 1, 0, '0000-00-00 00:00:00', 12, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 98, 0, '', '', 'Eileen', 'Padmaraj'),
(91, 'S Sundaram', 's-sundaram', NULL, '', '', '', '', '', '91-(0) 944-4059-532/044-223-996-51/223-919-09', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 97, 0, '', '', 'S', 'Sundaram'),
(92, 'Daniel Devadhas', 'daniel-devadhas', NULL, '', '', '', '', '', '91-(0)944-4044-302/044-223-996-52/223-943-02', '', '', '', NULL, 'pr-daniel@sify.com', 0, 1, 0, '0000-00-00 00:00:00', 2, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 97, 0, '', '', 'Daniel', 'Devadhas'),
(93, 'Enoch Manickam', 'enoch-manickam', NULL, '', '', '', '', '', '91-(0)944-4064-433/044-223-996-53/223-82961', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 3, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 97, 0, '', '', 'Enoch', 'Manickam'),
(94, 'S Antony Das', 's-antony-das', NULL, '', '', '', '', '', '91-(0)984-2115-54', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 4, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 97, 0, '', '', 'S Antony', 'Das'),
(95, 'Manthri Moses', 'manthri-moses', NULL, '', '', '', '', '', '91-(0)944-4212-870/044-224-115-13', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 5, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 97, 0, '', '', 'Manthri', 'Moses'),
(96, 'Premila Jayachandran', 'premila-jayachandran', NULL, '', '', '', '', '', '91-(0)994-4317-835/0413-222-3248', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 6, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 97, 0, '', '', 'Premila', 'Jayachandran'),
(97, 'R Rajamani Muthu', 'r-rajamani-muthu', NULL, '', '', '', '', '', '044-994-0253-761', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 7, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 97, 0, '', '', 'R Rajamani', 'Muthu'),
(98, ' Anothindhas', '-anothindhas', NULL, '', '', '', '', '', '', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 8, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 97, 0, '', '', '', 'Anothindhas'),
(99, 'V M Arokiasamy', 'v-m-arokiasamy', NULL, '', '', '', '', '', '', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 9, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 97, 0, '', '', 'V M', 'Arokiasamy'),
(100, 'Jones Rajarathinam', 'jones-rajarathinam', NULL, '', '', '', '', '', '91-(0)944-3194-573', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 10, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 97, 0, '', '', 'Jones', 'Rajarathinam'),
(106, 'P T Johnkutty', 'p-t-johnkutty', NULL, '', '', '', '', '', '91-(0)944-7836-637', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 3, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 96, 0, '', '', 'P T', 'Johnkutty'),
(102, 'M Anbalagan', 'm-anbalagan', NULL, '', '', '', '', '', '91-(0)938-260-7567', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 12, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 97, 0, '', '', 'M', 'Anbalagan'),
(103, 'D Lingan', 'd-lingan', NULL, '', '', '', '', '', '91(0)944-4405-850/262-118-10', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 13, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 97, 0, '', '', 'D', 'Lingan'),
(108, 'K J Varghese', 'k-j-varghese', NULL, '', '', '', '', '', '', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 5, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 96, 0, '', '', 'K J', 'Varghese'),
(109, 'Mary Thomas', 'mary-thomas', NULL, '', '', '', '', '', '', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 6, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 96, 0, '', '', 'Mary', 'Thomas'),
(110, 'V K Baby', 'v-k-baby', NULL, '', '', '', '', '', '91-(0)989-5164-020', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 7, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 96, 0, '', '', 'V K', 'Baby'),
(111, 'K N Varghese', 'k-n-varghese', NULL, '', '', '', '', '', '91-(0)989-5434-303', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 8, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 96, 0, '', '', 'K N', 'Varghese'),
(112, 'Philip S Jacob', 'philip-s-jacob', NULL, '', '', '', '', '', '91-(0487)-2254-294', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 9, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 96, 0, '', '', 'Philip S', 'Jacob'),
(113, 'Raju Abraham', 'raju-abraham', NULL, '', '', '', '', '', '91-(0)944-7068-641', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 10, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 96, 0, '', '', 'Raju', 'Abraham'),
(114, 'Gibeon E Sharon', 'gibeon-e-sharon', NULL, '', '', '', '', '', '91-(0)989-0112-637', '', '', '', NULL, 'prewiu@vsnl.net', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 95, 0, '', '', 'Gibeon E', 'Sharon'),
(115, 'Pratap Gaikwad', 'pratap-gaikwad', NULL, '', '', '', '', '', '91-(0)989-0116-902', '', '', '', NULL, 'secwiu@vsnl.net', 0, 1, 0, '0000-00-00 00:00:00', 2, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 95, 0, '', '', 'Pratap', 'Gaikwad'),
(116, 'Sukendu K Sircar', 'sukendu-k-sircar', NULL, '', '', '', '', '', '91-(0)989-0183-637', '', '', '', NULL, 'trewiu@vsnl.net', 0, 1, 0, '0000-00-00 00:00:00', 3, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 95, 0, '', '', 'Sukendu K', 'Sircar'),
(117, 'Rakesh Chavan', 'rakesh-chavan', NULL, '', '', '', '', '', '91-(0)982-2815-118', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 4, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 95, 0, '', '', 'Rakesh', 'Chavan'),
(119, 'Chandrakanth R Shinge', 'chandrakanth-r-shinge', NULL, '', '', '', '', '', '91-(0)989-0113-478', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 5, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 95, 0, '', '', 'Chandrakanth R', 'Shinge'),
(120, 'Prakash Sharma', 'prakash-sharma', NULL, '', '', '', '', '', '91-(0)989-0116-710', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 6, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 95, 0, '', '', 'Prakash', 'Sharma'),
(121, 'Ashirwad Pandey', 'ashirwad-pandey', NULL, '', '', '', '', '', '91-(0)986-0342-605', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 7, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 95, 0, '', '', 'Ashirwad', 'Pandey'),
(122, 'Zarin G Sharon', 'zarin-g-sharon', NULL, '', '', '', '', '', '', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 8, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 95, 0, '', '', 'Zarin G', 'Sharon'),
(123, 'Rajan Kedas', 'rajan-kedas', NULL, '', '', '', '', '', '91-(0)982-2271-214', '', '', '', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 9, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 95, 0, '', '', 'Rajan', 'Kedas'),
(124, 'Steven Oxley', 'steven-oxley', NULL, '', '', '', '', '', '', '', '', '', NULL, 'xonev@hotmail.com', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 62, 101, 0, '', '', 'Steven', 'Oxley'),
(125, 'Kantharaj George', 'kantharaj-george', NULL, '', '', '', '', '', '91-(0)4344-263823', '', '', '', NULL, 'kantharajgeorge@sud-adventist.org', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=0\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 102, 0, '91-(0)944-2562-800', '', 'Kantharaj', 'George');

-- --------------------------------------------------------

--
-- Table structure for table `jos_directory_contact_positions`
--

DROP TABLE IF EXISTS `jos_directory_contact_positions`;
CREATE TABLE IF NOT EXISTS `jos_directory_contact_positions` (
  `id` int(11) NOT NULL auto_increment,
  `contact_id` int(11) NOT NULL default '0',
  `department_id` int(11) NOT NULL default '0',
  `position` varchar(255) character set utf8 NOT NULL default '',
  `ordering` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=157 ;

--
-- Dumping data for table `jos_directory_contact_positions`
--

INSERT INTO `jos_directory_contact_positions` (`id`, `contact_id`, `department_id`, `position`, `ordering`) VALUES
(1, 1, 56, 'Volunteer', NULL),
(2, 2, 56, 'Director', NULL),
(3, 3, 57, 'Director', NULL),
(8, 6, 58, 'President', 1),
(5, 0, 56, 'Editor', NULL),
(9, 7, 58, 'Treasurer', 9),
(10, 8, 58, 'General Vice President', 2),
(11, 2, 58, 'General Vice President', 3),
(12, 9, 58, 'Administrative Assistant to the President for Development', 5),
(13, 10, 58, 'Administrative Assistant to the President for Development', 6),
(14, 11, 59, 'Associate Secretary', NULL),
(15, 12, 58, 'Administrative Assistant to the President', 4),
(16, 13, 59, 'Associate Secretary', NULL),
(17, 14, 61, 'Under-treasurer', NULL),
(18, 10, 66, 'Director', NULL),
(19, 15, 61, 'Associate Treasurer', NULL),
(20, 16, 61, 'Associate Treasurer', NULL),
(21, 17, 61, 'Associate Treasurer', NULL),
(22, 18, 61, 'Associate Treasurer', NULL),
(23, 8, 62, 'Director', NULL),
(24, 19, 63, 'Director', NULL),
(25, 19, 64, 'Director', NULL),
(26, 2, 60, 'Director', NULL),
(27, 20, 57, 'Assistant', NULL),
(28, 21, 65, 'Director', NULL),
(29, 21, 66, 'Field Representative', NULL),
(30, 22, 67, 'Director', NULL),
(31, 22, 68, 'Director', NULL),
(32, 23, 69, 'Director', NULL),
(33, 24, 70, 'Director', NULL),
(34, 24, 71, 'Director', NULL),
(35, 25, 93, 'Director', NULL),
(36, 26, 93, 'Director', NULL),
(37, 27, 73, 'Director', NULL),
(38, 28, 74, 'Director', NULL),
(39, 29, 75, 'Director', NULL),
(40, 30, 76, 'Director', NULL),
(41, 30, 77, 'Director', NULL),
(42, 30, 78, 'Director', NULL),
(43, 16, 75, 'Director', NULL),
(44, 31, 79, 'Director', NULL),
(45, 32, 79, 'Director', NULL),
(46, 33, 80, 'Director', NULL),
(47, 34, 81, 'Director', NULL),
(48, 34, 73, 'Coordinator', NULL),
(49, 35, 82, 'Director', NULL),
(50, 36, 82, 'Associate Director', NULL),
(51, 37, 82, 'Assistant Director', NULL),
(52, 38, 83, 'Editor', NULL),
(53, 12, 84, 'Director', NULL),
(54, 19, 85, 'Director', NULL),
(55, 39, 75, 'Assistant Director', NULL),
(56, 2, 86, 'Coordinator', NULL),
(57, 40, 87, 'Engineer', NULL),
(58, 41, 87, 'Assistant Engineer', NULL),
(59, 15, 88, 'Director', NULL),
(60, 42, 66, 'Correspondent', NULL),
(61, 43, 66, 'Administrative Assistant to Candy Zook', NULL),
(62, 38, 89, 'Coordinator', NULL),
(63, 44, 90, 'Director', NULL),
(64, 45, 91, 'General Manager', NULL),
(65, 13, 80, 'Director', NULL),
(66, 46, 92, 'Manager', NULL),
(67, 11, 58, 'Associate Secretary', 7),
(68, 13, 58, 'Associate Secretary', 8),
(69, 14, 58, 'Under-treasurer', 10),
(70, 18, 58, 'Associate Treasurer', 11),
(71, 16, 58, 'Associate Treasurer', 12),
(72, 17, 58, 'Associate Treasurer', 13),
(73, 47, 94, 'President', NULL),
(74, 48, 94, 'Secretary', NULL),
(75, 49, 94, 'Treasurer', NULL),
(76, 50, 94, 'Associate Treasurer', NULL),
(77, 51, 94, 'Assistant Secretary', NULL),
(78, 52, 94, 'Comm/PARL/Spirit of Prophecy', NULL),
(79, 53, 94, 'Deaf Ministry', NULL),
(80, 54, 94, 'Education', NULL),
(81, 55, 94, 'Publishing', NULL),
(82, 56, 94, 'Shepherdess/ Women’s Min./Chm/Fly Ministries', NULL),
(83, 57, 94, 'Assoc. Director', NULL),
(84, 58, 94, 'WM/Stewardship/Nurturing  & Health', NULL),
(85, 59, 94, 'SS & PM/ Youth', NULL),
(86, 60, 100, 'President', NULL),
(87, 61, 100, 'Secretary', NULL),
(88, 62, 100, 'Treasurer', NULL),
(89, 63, 100, 'Edn Assoc. / Chm & W Min.', NULL),
(90, 64, 100, 'Fly /G M/ Pub. / Youth', NULL),
(91, 65, 100, 'Heath/ Stew/SS & PM', NULL),
(92, 66, 100, 'Shepherdess Intl Co-coordinator', NULL),
(93, 67, 100, 'Statistical Reports', NULL),
(94, 68, 100, 'Trust Services/ IFA', NULL),
(95, 69, 99, 'President', NULL),
(96, 70, 99, 'Secretary', NULL),
(97, 71, 99, 'Treasurer', NULL),
(98, 72, 99, 'Chm / Family/ W Min.', NULL),
(99, 73, 99, 'Ministerial Association', NULL),
(100, 74, 99, 'Publishing/ SS / PM', NULL),
(101, 75, 99, 'Shepherdess International', NULL),
(102, 76, 99, 'Spl Min./SOP/Youth', NULL),
(103, 77, 99, 'Stewardship/ Health Ministries', NULL),
(104, 78, 98, 'President', NULL),
(105, 79, 98, 'Secretary', NULL),
(106, 80, 98, 'Treasurer', NULL),
(107, 81, 98, 'Associate Treasurer', NULL),
(108, 82, 98, 'Asst. Treasurer/Church Audit', NULL),
(109, 83, 98, 'Comm/Youth/S S & P M/Health & Temp.', NULL),
(110, 84, 98, 'Education', NULL),
(111, 85, 98, 'Field Secretary & Nurturing/SOP/Trust Services', NULL),
(112, 86, 98, 'IFA &  Risk Management', NULL),
(113, 87, 98, 'Minl/ GM/ Stw/Home Fly/ Children Ministries', NULL),
(114, 88, 98, 'PARL/ADRA/Legal', NULL),
(115, 89, 98, 'Publishing', NULL),
(116, 90, 98, 'Women’s/ Shepherdess Intl', NULL),
(117, 91, 97, 'President', NULL),
(118, 92, 97, 'Secretary', NULL),
(119, 93, 97, 'Treasurer', NULL),
(120, 94, 97, 'Assoc. Secretary', NULL),
(121, 95, 97, 'Assoc. Treasurer', NULL),
(122, 96, 97, 'Chm/Home/Family', NULL),
(123, 97, 97, 'Communication/SS/PM', NULL),
(124, 98, 97, 'Health Ministries', NULL),
(125, 99, 97, 'Min./SOP/Nurt &Spl Min.', NULL),
(126, 100, 97, 'Music Ministries', NULL),
(127, 101, 97, 'PARL', NULL),
(128, 102, 97, 'President', NULL),
(129, 103, 97, 'Secretary', NULL),
(130, 104, 96, 'President', NULL),
(131, 105, 96, 'Secretary', NULL),
(132, 106, 96, 'Treasurer', NULL),
(133, 107, 96, 'ChM & Communication', NULL),
(134, 108, 96, 'Field Secretary/SS/PM/Youth', NULL),
(135, 109, 96, 'Family & WM', NULL),
(136, 110, 96, 'Ministerial, Stw. Publishing & Spl Min./Deaf & Dumb', NULL),
(137, 111, 96, 'Zonal Education Officer I', NULL),
(138, 112, 96, 'Zonal Education Officer II', NULL),
(139, 113, 96, 'Zonal Education Officer III', NULL),
(140, 114, 95, 'President', NULL),
(141, 115, 95, 'Secretary', NULL),
(142, 116, 95, 'Treasurer', NULL),
(143, 117, 95, 'Asst. Treasurer', NULL),
(144, 118, 95, 'Education', NULL),
(145, 119, 95, 'Ministerial Association', NULL),
(146, 120, 95, 'Publishing/Health/Comm', NULL),
(147, 121, 95, 'S S &  Personal Ministries', NULL),
(148, 122, 95, 'Women’s/ Shep. & ChMin', NULL),
(149, 123, 95, 'Stewardship', NULL),
(150, 124, 101, 'Lead (Only) Developer', NULL),
(152, 125, 102, 'Associate Secretary', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jos_directory_sections`
--

DROP TABLE IF EXISTS `jos_directory_sections`;
CREATE TABLE IF NOT EXISTS `jos_directory_sections` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) character set utf8 default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `jos_directory_sections`
--

INSERT INTO `jos_directory_sections` (`id`, `name`) VALUES
(1, 'Southern Asia Division'),
(2, 'Unions'),
(3, 'Developers');

-- --------------------------------------------------------

--
-- Table structure for table `jos_groups`
--

DROP TABLE IF EXISTS `jos_groups`;
CREATE TABLE IF NOT EXISTS `jos_groups` (
  `id` tinyint(3) unsigned NOT NULL default '0',
  `name` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_groups`
--

INSERT INTO `jos_groups` (`id`, `name`) VALUES
(0, 'Public'),
(1, 'Registered'),
(2, 'Special');

-- --------------------------------------------------------

--
-- Table structure for table `jos_jce_extensions`
--

DROP TABLE IF EXISTS `jos_jce_extensions`;
CREATE TABLE IF NOT EXISTS `jos_jce_extensions` (
  `id` int(11) NOT NULL auto_increment,
  `pid` int(11) NOT NULL default '0',
  `name` varchar(100) NOT NULL default '',
  `extension` varchar(255) NOT NULL default '',
  `folder` varchar(255) NOT NULL default '',
  `published` tinyint(3) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_jce_extensions`
--

INSERT INTO `jos_jce_extensions` (`id`, `pid`, `name`, `extension`, `folder`, `published`) VALUES
(1, 15, 'Joomla Links for Advanced Link', 'joomlalinks', 'links', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_jce_groups`
--

DROP TABLE IF EXISTS `jos_jce_groups`;
CREATE TABLE IF NOT EXISTS `jos_jce_groups` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `description` varchar(255) NOT NULL default '',
  `users` text NOT NULL,
  `types` varchar(255) NOT NULL default '',
  `components` text NOT NULL,
  `rows` text NOT NULL,
  `plugins` varchar(255) NOT NULL default '',
  `published` tinyint(3) NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `checked_out` tinyint(3) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_jce_groups`
--

INSERT INTO `jos_jce_groups` (`id`, `name`, `description`, `users`, `types`, `components`, `rows`, `plugins`, `published`, `ordering`, `checked_out`, `checked_out_time`, `params`) VALUES
(1, 'Default', 'Default group for all users with edit access', '', '19,20,21,23,24,25', '', '28,27,32,33,19,20,21,29,45,44,43,46,26,49,36,37,30,31,39,40;56,47,38,5,9,48,42,24,25,22,18,2;7,17,13,10,3;23,15,14,59,16,4,6,8,12,54,34,41,11', '1,52,53,55,57,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,28,54,59', 1, 1, 0, '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_jce_plugins`
--

DROP TABLE IF EXISTS `jos_jce_plugins`;
CREATE TABLE IF NOT EXISTS `jos_jce_plugins` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(100) NOT NULL default '',
  `name` varchar(100) NOT NULL default '',
  `type` varchar(100) NOT NULL default 'plugin',
  `icon` varchar(255) NOT NULL default '',
  `layout` varchar(255) NOT NULL default '',
  `row` int(11) NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `published` tinyint(3) NOT NULL default '0',
  `editable` tinyint(3) NOT NULL default '0',
  `elements` varchar(255) NOT NULL default '',
  `params` text NOT NULL,
  `iscore` tinyint(3) NOT NULL default '0',
  `checked_out` int(11) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `plugin` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=60 ;

--
-- Dumping data for table `jos_jce_plugins`
--

INSERT INTO `jos_jce_plugins` (`id`, `title`, `name`, `type`, `icon`, `layout`, `row`, `ordering`, `published`, `editable`, `elements`, `params`, `iscore`, `checked_out`, `checked_out_time`) VALUES
(1, 'Context Menu', 'contextmenu', 'plugin', '', '', 0, 19, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(2, 'Directionality', 'directionality', 'plugin', 'ltr,rtl', 'directionality', 3, 26, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(3, 'Emotions', 'emotions', 'plugin', 'emotions', 'emotions', 3, 24, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(4, 'Fullscreen', 'fullscreen', 'plugin', 'fullscreen', 'fullscreen', 3, 27, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(5, 'Paste', 'paste', 'plugin', 'pasteword,pastetext', 'paste', 2, 15, 1, 1, '', '', 1, 0, '0000-00-00 00:00:00'),
(6, 'Preview', 'preview', 'plugin', 'preview', 'preview', 3, 29, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(7, 'Tables', 'table', 'plugin', 'tablecontrols', 'buttons', 3, 11, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(8, 'Print', 'print', 'plugin', 'print', 'print', 3, 25, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(9, 'Search Replace', 'searchreplace', 'plugin', 'search,replace', 'searchreplace', 2, 18, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(10, 'Styles', 'style', 'plugin', 'styleprops', 'style', 4, 16, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(11, 'Non-Breaking', 'nonbreaking', 'plugin', 'nonbreaking', 'nonbreaking', 4, 21, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(12, 'Visual Characters', 'visualchars', 'plugin', 'visualchars', 'visualchars', 4, 20, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(13, 'XHTML Xtras', 'xhtmlxtras', 'plugin', 'cite,abbr,acronym,del,ins,attribs', 'xhtmlxtras', 4, 17, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(14, 'Image Manager', 'imgmanager', 'plugin', 'imgmanager', 'imgmanager', 4, 30, 1, 1, '', '', 1, 0, '0000-00-00 00:00:00'),
(15, 'Advanced Link', 'advlink', 'plugin', 'advlink', 'advlink', 4, 31, 1, 1, '', '', 1, 0, '0000-00-00 00:00:00'),
(16, 'Spell Checker', 'spellchecker', 'plugin', 'spellchecker', 'spellchecker', 4, 22, 1, 1, '', '', 1, 0, '0000-00-00 00:00:00'),
(17, 'Layers', 'layer', 'plugin', 'insertlayer,moveforward,movebackward,absolute', 'layer', 4, 10, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(18, 'Font ForeColour', 'forecolor', 'command', 'forecolor', 'forecolor', 2, 17, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(19, 'Bold', 'bold', 'command', 'bold', 'bold', 1, 2, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(20, 'Italic', 'italic', 'command', 'italic', 'italic', 1, 3, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(21, 'Underline', 'underline', 'command', 'underline', 'underline', 1, 4, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(22, 'Font BackColour', 'backcolor', 'command', 'backcolor', 'backcolor', 2, 18, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(23, 'Unlink', 'unlink', 'command', 'unlink', 'unlink', 2, 11, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(24, 'Font Select', 'fontselect', 'command', 'fontselect', 'fontselect', 1, 12, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(25, 'Font Size Select', 'fontsizeselect', 'command', 'fontsizeselect', 'fontsizeselect', 1, 13, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(26, 'Style Select', 'styleselect', 'command', 'styleselect', 'styleselect', 1, 10, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(27, 'New Document', 'newdocument', 'command', 'newdocument', 'newdocument', 1, 1, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(28, 'Help', 'help', 'plugin', 'help', 'help', 1, 6, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(29, 'StrikeThrough', 'strikethrough', 'command', 'strikethrough', 'strikethrough', 1, 5, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(30, 'Indent', 'indent', 'command', 'indent', 'indent', 2, 7, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(31, 'Outdent', 'outdent', 'command', 'outdent', 'outdent', 2, 6, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(32, 'Undo', 'undo', 'command', 'undo', 'undo', 2, 8, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(33, 'Redo', 'redo', 'command', 'redo', 'redo', 2, 9, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(34, 'Horizontal Rule', 'hr', 'command', 'hr', 'hr', 3, 2, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(35, 'HTML', 'html', 'command', 'code', 'code', 2, 16, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(36, 'Numbered List', 'numlist', 'command', 'numlist', 'numlist', 2, 5, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(37, 'Bullet List', 'bullist', 'command', 'bullist', 'bullist', 2, 4, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(38, 'Clipboard Actions', 'clipboard', 'command', 'cut,copy,paste', 'clipboard', 2, 1, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(39, 'Subscript', 'sub', 'command', 'sub', 'sub', 3, 5, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(40, 'Superscript', 'sup', 'command', 'sup', 'sup', 3, 6, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(41, 'Visual Aid', 'visualaid', 'command', 'visualaid', 'visualaid', 3, 4, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(42, 'Character Map', 'charmap', 'command', 'charmap', 'charmap', 3, 7, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(43, 'Justify Full', 'full', 'command', 'justifyfull', 'justifyfull', 1, 8, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(44, 'Justify Center', 'center', 'command', 'justifycenter', 'justifycenter', 1, 7, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(45, 'Justify Left', 'left', 'command', 'justifyleft', 'justifyleft', 1, 6, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(46, 'Justify Right', 'right', 'command', 'justifyright', 'justifyright', 1, 9, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(47, 'Remove Format', 'removeformat', 'command', 'removeformat', 'removeformat', 3, 3, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(48, 'Anchor', 'anchor', 'command', 'anchor', 'anchor', 2, 12, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(49, 'Format Select', 'formatselect', 'command', 'formatselect', 'formatselect', 1, 11, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(50, 'Image', 'image', 'command', 'image', 'image', 2, 13, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(51, 'Link', 'link', 'command', 'link', 'link', 2, 10, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(52, 'File Browser', 'browser', 'plugin', '', '', 0, 28, 1, 1, '', '', 1, 0, '0000-00-00 00:00:00'),
(53, 'Inline Popups', 'inlinepopups', 'plugin', '', '', 0, 12, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(54, 'Read More', 'readmore', 'plugin', 'readmore', 'readmore', 4, 23, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(55, 'Media Support', 'media', 'plugin', '', '', 0, 9, 1, 1, '', '', 1, 0, '0000-00-00 00:00:00'),
(56, 'Code Cleanup', 'cleanup', 'command', 'cleanup', 'cleanup', 2, 14, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(57, 'Safari Browser Support', 'safari', 'plugin', '', '', 0, 13, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00'),
(59, 'Advanced Code Editor', 'advcode', 'plugin', 'advcode', 'advcode', 4, 8, 1, 0, '', '', 1, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `jos_menu`
--

DROP TABLE IF EXISTS `jos_menu`;
CREATE TABLE IF NOT EXISTS `jos_menu` (
  `id` int(11) NOT NULL auto_increment,
  `menutype` varchar(75) default NULL,
  `name` varchar(255) default NULL,
  `alias` varchar(255) NOT NULL default '',
  `link` text,
  `type` varchar(50) NOT NULL default '',
  `published` tinyint(1) NOT NULL default '0',
  `parent` int(11) unsigned NOT NULL default '0',
  `componentid` int(11) unsigned NOT NULL default '0',
  `sublevel` int(11) default '0',
  `ordering` int(11) default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `pollid` int(11) NOT NULL default '0',
  `browserNav` tinyint(4) default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `utaccess` tinyint(3) unsigned NOT NULL default '0',
  `params` text NOT NULL,
  `lft` int(11) unsigned NOT NULL default '0',
  `rgt` int(11) unsigned NOT NULL default '0',
  `home` int(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `componentid` (`componentid`,`menutype`,`published`,`access`),
  KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=71 ;

--
-- Dumping data for table `jos_menu`
--

INSERT INTO `jos_menu` (`id`, `menutype`, `name`, `alias`, `link`, `type`, `published`, `parent`, `componentid`, `sublevel`, `ordering`, `checked_out`, `checked_out_time`, `pollid`, `browserNav`, `access`, `utaccess`, `params`, `lft`, `rgt`, `home`) VALUES
(1, 'mainmenu', 'Home', 'home', 'index.php?option=com_content&view=frontpage', 'component', 1, 0, 20, 0, 52, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'num_leading_articles=1\nnum_intro_articles=4\nnum_columns=1\nnum_links=4\norderby_pri=\norderby_sec=front\nmulti_column_order=1\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=1\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=0\nshow_print_icon=0\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=Southern Asia Division of Seventh-day Adventists\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 1),
(2, 'generalinfo', 'Contact Us', 'contact-us', 'index.php?option=com_content&view=article&id=2', 'component', 1, 0, 20, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(3, 'generalinfo', 'About Us', 'about-us', 'index.php?option=com_content&view=article&id=3', 'component', -2, 0, 20, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(4, 'generalinfo', 'About Adventists', 'about-sda', 'index.php?option=com_content&view=article&id=8', 'component', 1, 0, 20, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(9, 'generalinfo', 'Adventist History', 'history-sda', 'index.php?option=com_content&view=article&id=9', 'component', 1, 4, 20, 1, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(5, 'generalinfo', 'What Adventists Believe', 'what-sda-believe', 'index.php?option=com_content&view=article&id=7', 'component', 1, 4, 20, 1, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(6, 'generalinfo', 'Mission Statement', 'mission', 'index.php?option=com_content&view=article&id=4', 'component', 1, 4, 20, 1, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(7, 'generalinfo', 'History in India', 'history-sda-india', 'index.php?option=com_content&view=article&id=6', 'component', 1, 9, 20, 2, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(8, 'generalinfo', 'The Adventist Logo', 'sda-logo', 'index.php?option=com_content&view=article&id=5', 'component', 1, 4, 20, 1, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(10, 'generalinfo', 'Adventists as People', 'adventist-neighbour', 'index.php?option=com_content&view=article&id=10', 'component', 1, 4, 20, 1, 5, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(11, 'mainmenu', 'Gallery', 'image-gallery', 'index.php?option=com_expose', 'component', -2, 0, 34, 0, 50, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'page_title=Southern Asia Division Picture Tour\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(12, 'mainmenu', 'Southern Asia Division Tour', 'Southern-Asia-Division-Tour', 'index.php?option=com_morfeoshow&amp;task=view&amp;gallery=1', 'component', -2, 0, 39, 0, 51, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, '', 0, 0, 0),
(13, 'mainmenu', 'Photo Gallery', 'photo-gallery', 'index.php?option=com_morfeoshow', 'component', -2, 0, 39, 0, 49, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'page_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(14, 'mainmenu', 'Photo Gallery', 'Photo-Gallery', 'index.php?option=com_morfeoshow&amp;task=view&amp;gallery=2', 'component', -2, 0, 39, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, '', 0, 0, 0),
(15, 'mainmenu', 'The Layout', 'the-layout', 'index.php?option=com_qcontacts&view=category&catid=3', 'component', -2, 0, 43, 0, 47, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'image=-1\nimage_align=right\nshow_headings=1\nshow_col_name=1\nord_col_name=0\nwidth_col_name=\nshow_col_position=1\nord_col_position=1\nwidth_col_position=\nshow_col_email=0\nord_col_email=2\nwidth_col_email=\nshow_col_telephone=1\nord_col_telephone=3\nwidth_col_telephone=\nshow_col_mobile=0\nord_col_mobile=4\nwidth_col_mobile=\nshow_col_fax=0\nord_col_fax=5\nwidth_col_fax=\nshow_col_street=0\nord_col_street=6\nwidth_col_street=\nshow_col_suburb=0\nord_col_suburb=7\nwidth_col_suburb=\nshow_col_state=0\nord_col_state=8\nwidth_col_state=\nshow_col_postcode=0\nord_col_postcode=9\nwidth_col_postcode=\nshow_col_country=0\nord_col_country=10\nwidth_col_country=\ncontacts_per_page=\nshow_limit=0\nshow_feed_link=1\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(16, 'mainmenu', 'custom!', 'custom', 'index.php?option=com_qcontacts&view=categories', 'component', -2, 0, 43, 0, 48, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'page_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(17, 'mainmenu', 'Communication', 'communication', 'index.php?option=com_contact&view=category&catid=4', 'component', -2, 0, 7, 2, 33, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(18, 'mainmenu', 'Mail', 'mail', 'index.php?option=com_contact&view=category&catid=6', 'component', -2, 0, 7, 0, 46, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(19, 'mainmenu', 'Departments', 'departments', 'index.php?option=com_contact&view=categories&contact_section=1', 'component', -2, 0, 7, 1, 5, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'contact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Departments\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(20, 'mainmenu', 'Directory', 'directory', 'index.php?option=com_contact&view=category&catid=0&contact_section=1', 'component', -2, 0, 7, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Directory\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(21, 'mainmenu', 'Education', 'education', 'index.php?option=com_contact&view=category&catid=5', 'component', -2, 0, 7, 2, 34, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Department of Education\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(22, 'mainmenu', 'Administrators', 'administrators', 'index.php?option=com_contact&view=category&catid=7', 'component', -2, 0, 7, 2, 35, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Administrators\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(58, 'mainmenu', 'Unions', 'unions', 'index.php?option=com_content&view=category&id=43', 'component', -2, 0, 20, 1, 7, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=10\nshow_headings=0\nshow_date=0\ndate_format=\nfilter=0\nfilter_type=title\norderby_sec=\nshow_pagination=1\nshow_pagination_limit=0\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(23, 'mainmenu', 'ACI', 'aci', 'index.php?option=com_contact&view=category&catid=15', 'component', -2, 0, 7, 2, 36, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Adventist Child India\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(24, 'mainmenu', 'Adventist Media', 'adventist-media', 'index.php?option=com_contact&view=category&catid=39', 'component', -2, 0, 7, 2, 37, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Adventist Media Centre\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(25, 'mainmenu', 'ARM', 'arm', 'index.php?option=com_contact&view=category&catid=37', 'component', -2, 0, 7, 2, 38, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Adventist Risk Management\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(26, 'mainmenu', 'AVS', 'avs', 'index.php?option=com_contact&view=category&catid=38', 'component', -2, 0, 7, 2, 39, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Adventist Volunteer Service\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(27, 'mainmenu', 'Auditing', 'auditing', 'index.php?option=com_contact&view=category&catid=31', 'component', -2, 0, 7, 2, 44, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Auditing Service\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(28, 'mainmenu', 'Building', 'building', 'index.php?option=com_contact&view=category&catid=36', 'component', -2, 0, 7, 2, 43, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Building Department\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(29, 'mainmenu', 'Chaplaincy', 'chaplaincy', 'index.php?option=com_contact&view=category&catid=12', 'component', -2, 0, 7, 2, 42, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Chaplaincy\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(30, 'mainmenu', 'Children''s Ministries', 'childrens-ministries', 'index.php?option=com_contact&view=category&catid=10', 'component', -2, 0, 7, 2, 41, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Children''s Ministries Department\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(31, 'mainmenu', 'Church Nurturing', 'church-nurturing', 'index.php?option=com_contact&view=category&catid=11', 'component', -2, 0, 7, 2, 40, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Church Nurturing Ministries\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(32, 'mainmenu', 'Legal Affairs', 'legal-affairs', 'index.php?option=com_contact&view=category&catid=21', 'component', -2, 0, 7, 2, 31, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Department of Legal Affairs\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(33, 'mainmenu', 'FDIC', 'fdic', 'index.php?option=com_contact&view=category&catid=14', 'component', -2, 0, 7, 2, 30, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Faith Development in Context\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(34, 'mainmenu', 'Family', 'family', 'index.php?option=com_contact&view=category&catid=16', 'component', -2, 0, 7, 2, 17, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Family Ministries\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(35, 'mainmenu', 'Global Mission', 'global-mission', 'index.php?option=com_contact&view=category&catid=18', 'component', -2, 0, 7, 2, 16, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Global Missions Department\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(36, 'mainmenu', 'Health & Temperance', 'health-a-temperance', 'index.php?option=com_contact&view=category&catid=19', 'component', -2, 0, 7, 2, 15, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Health and Temperance Department\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(37, 'mainmenu', 'Hinduism Study', 'hinduism-study', 'index.php?option=com_contact&view=category&catid=33', 'component', -2, 0, 7, 2, 14, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Hinduism Study Centre\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(38, 'mainmenu', 'Intra Church Pub.', 'intra-church-pub', 'index.php?option=com_contact&view=category&catid=41', 'component', -2, 0, 7, 2, 13, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Intra Church Publications\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(39, 'mainmenu', 'Ministerial', 'ministerial', 'index.php?option=com_contact&view=category&catid=22', 'component', -2, 0, 7, 2, 12, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Ministerial Department\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(40, 'mainmenu', 'Blind Ministries', 'blind-ministries', 'index.php?option=com_contact&view=category&catid=27', 'component', -2, 0, 7, 2, 11, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Ministry to the Blind\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(41, 'mainmenu', 'Oriental Watchman', 'oriental-watchman', 'index.php?option=com_contact&view=category&catid=40', 'component', -2, 0, 7, 2, 10, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Oriental Watchman Publishing House\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(42, 'mainmenu', 'PARL', 'parl', 'index.php?option=com_contact&view=category&catid=13', 'component', -2, 0, 7, 2, 9, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=PARL\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(43, 'mainmenu', 'Personal Ministries', 'personal-ministries', 'index.php?option=com_contact&view=category&catid=26', 'component', -2, 0, 7, 2, 18, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Personal Ministries Department\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(44, 'mainmenu', 'Publishing', 'publishing', 'index.php?option=com_contact&view=category&catid=23', 'component', -2, 0, 7, 2, 19, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Publishing Department\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(45, 'mainmenu', 'Retirement', 'retirement', 'index.php?option=com_contact&view=category&catid=24', 'component', -2, 0, 7, 2, 20, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Retirement Plan Department\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(46, 'mainmenu', 'Sabbath School', 'sabbath-school', 'index.php?option=com_contact&view=category&catid=25', 'component', -2, 0, 7, 2, 29, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Sabbath School Department\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(47, 'mainmenu', 'Satellite Evangelism', 'satellite-evangelism', 'index.php?option=com_contact&view=category&catid=35', 'component', -2, 0, 7, 2, 28, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Satellite Evangelism\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(48, 'mainmenu', 'Secretariat', 'secretariat', 'index.php?option=com_contact&view=category&catid=8', 'component', -2, 0, 7, 0, 45, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Secretariat Department\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(49, 'mainmenu', 'Secretariat', 'secretariat', 'index.php?option=com_contact&view=category&catid=8', 'component', -2, 0, 7, 2, 27, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Secretariat Department\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(50, 'mainmenu', 'Tidings', 'tidings', 'index.php?option=com_contact&view=category&catid=32', 'component', -2, 0, 7, 2, 26, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Southern Asia Tidings\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(51, 'mainmenu', 'Special Ministries', 'special-ministries', 'index.php?option=com_contact&view=category&catid=28', 'component', -2, 0, 7, 2, 32, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Special Ministries Department\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(52, 'mainmenu', 'Spirit of Prophecy', 'spirit-of-prophecy', 'index.php?option=com_contact&view=category&catid=34', 'component', -2, 0, 7, 2, 25, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Spirit of Prophecy Department\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(53, 'mainmenu', 'Stewardship', 'stewardship', 'index.php?option=com_contact&view=category&catid=20', 'component', -2, 0, 7, 2, 24, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Stewardship Department\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(54, 'mainmenu', 'Treasury', 'treasury', 'index.php?option=com_contact&view=category&catid=9', 'component', -2, 0, 7, 2, 23, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Treasury Department\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(55, 'mainmenu', 'TRUST Services', 'trust-services', 'index.php?option=com_contact&view=category&catid=29', 'component', -2, 0, 7, 2, 22, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=TRUST Services Department\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(56, 'mainmenu', 'Women''s Ministries', 'womens-ministries', 'index.php?option=com_contact&view=category&catid=30', 'component', -2, 0, 7, 2, 21, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Women''s Ministries Department\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(57, 'mainmenu', 'Youth', 'youth', 'index.php?option=com_contact&view=category&catid=17', 'component', -2, 0, 7, 2, 8, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=Youth Ministries Department\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(59, 'mainmenu', 'Unions', 'unions', 'index.php?option=com_contact&view=categories&contact_section=2', 'component', -2, 0, 7, 1, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'contact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(60, 'mainmenu', 'Division News', 'division-news', 'index.php?option=com_content&view=category&layout=blog&id=53', 'component', 1, 0, 20, 0, 53, 62, '2008-11-07 08:24:26', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=1\nnum_links=4\norderby_pri=\norderby_sec=\nmulti_column_order=0\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=1\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(61, 'mainmenu', 'Barn', 'barn', 'index.php?option=com_content&view=category&layout=blog&id=54', 'component', 1, 0, 20, 0, 55, 62, '2009-01-05 13:02:29', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=1\nnum_links=4\norderby_pri=\norderby_sec=\nmulti_column_order=0\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=1\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(62, 'sister-sites', 'Adventist Child India', 'adventist-child-india', 'http://adventistchildindia.org/', 'url', 1, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(63, 'sister-sites', 'Adventist Church India', 'adventist-church-india', 'http://adventistchurchindia.org/', 'url', 1, 0, 0, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(64, 'mainmenu', 'New Directory', 'new-directory', 'index.php?option=com_directory&view=category&catid=0&contact_section=0', 'component', -2, 0, 59, 0, 6, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(65, 'mainmenu', 'Directory', 'new-directory', 'index.php?option=com_directory&view=category&catid=0&contact_section=1', 'component', 1, 0, 59, 0, 54, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=-1\nimage_align=right\nshow_limit=0\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(66, 'mainmenu', 'Departments', 'departments', 'index.php?option=com_directory&view=categories&contact_section=1', 'component', 1, 65, 59, 1, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'contact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(67, 'mainmenu', 'Unions', 'unions', 'index.php?option=com_directory&view=categories&contact_section=2', 'component', 1, 65, 59, 1, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'contact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(68, 'mainmenu', 'Photo Gallery', 'photo-gallery', 'index.php?option=com_phocagallery&view=categories', 'component', 1, 0, 64, 0, 56, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'image=-1\nimage_align=right\nshow_pagination=0\nshow_pagination_limit=1\nshow_feed_link=1\ndisplay_cat_name_title=1\nfont_color=\nbackground_color=\nbackground_color_hover=\nimage_background_color=\nimage_background_shadow=\nborder_color=\nborder_color_hover=\nmargin_box=\npadding_box=\ndisplay_name=\ndisplay_icon_detail=\ndisplay_icon_download=\ndisplay_icon_folder=\ndisplay_icon_random_image=\ndisplay_back_button=\ndisplay_categories_back_button=\ndisplay_subcat_page=\nfont_size_name=\nchar_length_name=\ncategory_box_space=\ncategories_columns=\ndisplay_image_categories=\nimage_categories_size=\ndisplay_subcategories=\ndisplay_empty_categories=\nhide_categories=\ndisplay_access_category=\ndetail_window=\ndetail_window_background_color=\nmodal_box_overlay_color=\nmodal_box_overlay_opacity=\nmodal_box_border_color=\nmodal_box_border_width=\nsb_slideshow_delay=\nsb_lang=\ndisplay_description_detail=\ndisplay_title_description=\nfont_size_desc=\nfont_color_desc=\ndescription_detail_height=\ndescription_lightbox_font_size=\ndescription_lightbox_font_color=\ndescription_lightbox_bg_color=\nslideshow_delay=\nslideshow_pause=\nslideshow_random=\ndetail_buttons=\nphocagallery_width=\ndisplay_phoca_info=\ndefault_pagination=\npagination=\nenable_piclens=\nstart_piclens=\npiclens_image=\nswitch_image=\nswitch_width=\nswitch_height=\nenable_overlib=\nol_bg_color=\nol_fg_color=\nol_tf_color=\nol_cf_color=\noverlib_overlay_opacity=\ncreate_watermark=\nwatermark_position_x=\nwatermark_position_y=\ndisplay_icon_vm=\nenable_user_cp=\nmax_create_cat_char=\ndisplay_rating=\ndisplay_comment=\ncomment_width=\nmax_comment_char=\ndisplay_category_statistics=\ndisplay_main_cat_stat=\ndisplay_lastadded_cat_stat=\ncount_lastadded_cat_stat=\ndisplay_mostviewed_cat_stat=\ncount_mostviewed_cat_stat=\ngoogle_maps_api_key=\ndisplay_categories_geotagging=\ncategories_lng=\ncategories_lat=\ncategories_zoom=\ncategories_map_width=\ncategories_map_height=\ndisplay_icon_geotagging=\ndisplay_category_geotagging=\ncategory_map_width=\ncategory_map_height=\ndisplay_title_upload=\ndisplay_description_upload=\nmax_upload_char=\nupload_maxsize=\ncat_folder_maxsize=\nenable_flash=\npagination_thumbnail_creation=\nclean_thumbnails=\nenable_thumb_creation=\ncrop_thumbnail=\nicon_format=\nlarge_image_width=\nlarge_image_height=\nmedium_image_width=\nmedium_image_height=\nsmall_image_width=\nsmall_image_height=\nadmin_modal_box_width=\nadmin_modal_box_height=\nfront_modal_box_width=\nfront_modal_box_height=\nfront_popup_window_width=\nfront_popup_window_height=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(69, 'mainmenu', 'Conference', 'conference', 'index.php?option=com_directory&view=conference', 'component', -2, 0, 59, 1, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'contact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(70, 'mainmenu', 'Church Sections', 'conferences', 'index.php?option=com_directory&view=conferences', 'component', 1, 65, 59, 1, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'contact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_menu_types`
--

DROP TABLE IF EXISTS `jos_menu_types`;
CREATE TABLE IF NOT EXISTS `jos_menu_types` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `menutype` varchar(75) NOT NULL default '',
  `title` varchar(255) NOT NULL default '',
  `description` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `jos_menu_types`
--

INSERT INTO `jos_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Main Menu', 'The main menu for the site'),
(2, 'generalinfo', 'General Information', 'Information about the Southern Asia Division and SDA'),
(3, 'sister-sites', 'Sister Sites', 'Websites affiliated with the Southern Asia Divison of Seventh-day Adventists.');

-- --------------------------------------------------------

--
-- Table structure for table `jos_messages`
--

DROP TABLE IF EXISTS `jos_messages`;
CREATE TABLE IF NOT EXISTS `jos_messages` (
  `message_id` int(10) unsigned NOT NULL auto_increment,
  `user_id_from` int(10) unsigned NOT NULL default '0',
  `user_id_to` int(10) unsigned NOT NULL default '0',
  `folder_id` int(10) unsigned NOT NULL default '0',
  `date_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `state` int(11) NOT NULL default '0',
  `priority` int(1) unsigned NOT NULL default '0',
  `subject` text NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY  (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_messages`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_messages_cfg`
--

DROP TABLE IF EXISTS `jos_messages_cfg`;
CREATE TABLE IF NOT EXISTS `jos_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL default '0',
  `cfg_name` varchar(100) NOT NULL default '',
  `cfg_value` varchar(255) NOT NULL default '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_messages_cfg`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_migration_backlinks`
--

DROP TABLE IF EXISTS `jos_migration_backlinks`;
CREATE TABLE IF NOT EXISTS `jos_migration_backlinks` (
  `itemid` int(11) NOT NULL default '0',
  `name` varchar(100) NOT NULL default '',
  `url` text NOT NULL,
  `sefurl` text NOT NULL,
  `newurl` text NOT NULL,
  PRIMARY KEY  (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_migration_backlinks`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_modules`
--

DROP TABLE IF EXISTS `jos_modules`;
CREATE TABLE IF NOT EXISTS `jos_modules` (
  `id` int(11) NOT NULL auto_increment,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL default '0',
  `position` varchar(50) default NULL,
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL default '0',
  `module` varchar(50) default NULL,
  `numnews` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `showtitle` tinyint(3) unsigned NOT NULL default '1',
  `params` text NOT NULL,
  `iscore` tinyint(4) NOT NULL default '0',
  `client_id` tinyint(4) NOT NULL default '0',
  `control` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `jos_modules`
--

INSERT INTO `jos_modules` (`id`, `title`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `published`, `module`, `numnews`, `access`, `showtitle`, `params`, `iscore`, `client_id`, `control`) VALUES
(1, 'Main Menu', '', 1, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 0, 1, 'menutype=mainmenu\nmoduleclass_sfx=_menu\n', 1, 0, ''),
(2, 'Login', '', 1, 'login', 0, '0000-00-00 00:00:00', 1, 'mod_login', 0, 0, 1, '', 1, 1, ''),
(3, 'Popular', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_popular', 0, 2, 1, '', 0, 1, ''),
(4, 'Recent added Articles', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_latest', 0, 2, 1, 'ordering=c_dsc\nuser_id=0\ncache=0\n\n', 0, 1, ''),
(5, 'Menu Stats', '', 5, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_stats', 0, 2, 1, '', 0, 1, ''),
(6, 'Unread Messages', '', 1, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_unread', 0, 2, 1, '', 1, 1, ''),
(7, 'Online Users', '', 2, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_online', 0, 2, 1, '', 1, 1, ''),
(8, 'Toolbar', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', 1, 'mod_toolbar', 0, 2, 1, '', 1, 1, ''),
(9, 'Quick Icons', '', 1, 'icon', 0, '0000-00-00 00:00:00', 1, 'mod_quickicon', 0, 2, 1, '', 1, 1, ''),
(10, 'Logged in Users', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_logged', 0, 2, 1, '', 0, 1, ''),
(11, 'Footer', '', 0, 'footer', 0, '0000-00-00 00:00:00', 1, 'mod_footer', 0, 0, 1, '', 1, 1, ''),
(12, 'Admin Menu', '', 1, 'menu', 0, '0000-00-00 00:00:00', 1, 'mod_menu', 0, 2, 1, '', 0, 1, ''),
(13, 'Admin SubMenu', '', 1, 'submenu', 0, '0000-00-00 00:00:00', 1, 'mod_submenu', 0, 2, 1, '', 0, 1, ''),
(14, 'User Status', '', 1, 'status', 0, '0000-00-00 00:00:00', 1, 'mod_status', 0, 2, 1, '', 0, 1, ''),
(15, 'Title', '', 1, 'title', 0, '0000-00-00 00:00:00', 1, 'mod_title', 0, 2, 1, '', 0, 1, ''),
(16, 'General Information', '', 2, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 0, 1, 'menutype=generalinfo\nmenu_style=list\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=1\ntag_id=\nclass_sfx=\nmoduleclass_sfx=\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\\|\nend_spacer=\\|\n\n', 0, 0, ''),
(17, 'generalInfo', '', 4, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 0, 1, 'menutype=generalinfo', 0, 0, ''),
(18, 'Search', '', 0, 'user4', 0, '0000-00-00 00:00:00', 1, 'mod_search', 0, 0, 0, 'moduleclass_sfx=\nwidth=20\ntext=Click here to search...\nbutton=1\nbutton_pos=right\nimagebutton=\nbutton_text=Search\ncache=1\ncache_time=900\n\n', 0, 0, ''),
(19, 'Breadcrumbs', '', 0, 'breadcrumbs', 0, '0000-00-00 00:00:00', 1, 'mod_breadcrumbs', 0, 0, 0, 'showHome=1\nhomeText=Home\nshowLast=1\nseparator=\nmoduleclass_sfx=\ncache=0\n\n', 0, 0, ''),
(20, 'JCE Latest News', '', 1, 'jce_cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_feed', 0, 0, 1, 'cache=1\r\n	cache_time=15\r\n	moduleclass_sfx=\r\n	rssurl=http://www.joomlacontenteditor.net/index.php?option=com_rss&feed=RSS2.0&type=com_frontpage&Itemid=1\r\n	rssrtl=0\r\n	rsstitle=0\r\n	rssdesc=0\r\n	rssimage=0\r\n	rssitems=3\r\n	rssitemdesc=1\r\n	word_count=100', 0, 1, ''),
(21, 'JCE Control Panel Icons', '', 1, 'jce_icon', 0, '0000-00-00 00:00:00', 1, 'mod_jcequickicon', 0, 0, 0, '', 0, 1, ''),
(22, 'Sister Sites', '', 3, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 0, 1, 'menutype=sister-sites', 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_modules_menu`
--

DROP TABLE IF EXISTS `jos_modules_menu`;
CREATE TABLE IF NOT EXISTS `jos_modules_menu` (
  `moduleid` int(11) NOT NULL default '0',
  `menuid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`moduleid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_modules_menu`
--

INSERT INTO `jos_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(16, 0),
(17, 0),
(18, 0),
(19, 0),
(22, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_newsfeeds`
--

DROP TABLE IF EXISTS `jos_newsfeeds`;
CREATE TABLE IF NOT EXISTS `jos_newsfeeds` (
  `catid` int(11) NOT NULL default '0',
  `id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `alias` varchar(255) NOT NULL default '',
  `link` text NOT NULL,
  `filename` varchar(200) default NULL,
  `published` tinyint(1) NOT NULL default '0',
  `numarticles` int(11) unsigned NOT NULL default '1',
  `cache_time` int(11) unsigned NOT NULL default '3600',
  `checked_out` tinyint(3) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `rtl` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `published` (`published`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_newsfeeds`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_phocagallery`
--

DROP TABLE IF EXISTS `jos_phocagallery`;
CREATE TABLE IF NOT EXISTS `jos_phocagallery` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `catid` int(11) NOT NULL default '0',
  `sid` int(11) NOT NULL default '0',
  `title` varchar(250) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `filename` varchar(250) NOT NULL default '',
  `description` text NOT NULL,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL default '0',
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `catid` (`catid`,`published`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `jos_phocagallery`
--

INSERT INTO `jos_phocagallery` (`id`, `catid`, `sid`, `title`, `alias`, `filename`, `description`, `date`, `hits`, `published`, `checked_out`, `checked_out_time`, `ordering`, `params`) VALUES
(1, 1, 0, 'DSCN4423', 'dscn4423', '/pathfinder_camporee_2009/DSCN4423.JPG', '', '2009-02-04 12:21:51', 0, 1, 0, '0000-00-00 00:00:00', 1, ''),
(2, 1, 0, 'DSCN4429', 'dscn4429', '/pathfinder_camporee_2009/DSCN4429.JPG', '', '2009-02-04 12:21:52', 0, 1, 0, '0000-00-00 00:00:00', 2, ''),
(3, 1, 0, 'DSCN4433', 'dscn4433', '/pathfinder_camporee_2009/DSCN4433.JPG', '', '2009-02-04 12:21:52', 0, 1, 0, '0000-00-00 00:00:00', 3, ''),
(4, 1, 0, 'DSCN4456', 'dscn4456', '/pathfinder_camporee_2009/DSCN4456.JPG', '', '2009-02-04 12:21:52', 0, 1, 0, '0000-00-00 00:00:00', 4, ''),
(5, 1, 0, 'DSCN4525', 'dscn4525', '/pathfinder_camporee_2009/DSCN4525.JPG', '', '2009-02-04 12:21:52', 0, 1, 0, '0000-00-00 00:00:00', 5, ''),
(6, 1, 0, 'DSCN4618', 'dscn4618', '/pathfinder_camporee_2009/DSCN4618.JPG', '', '2009-02-04 12:21:52', 0, 1, 0, '0000-00-00 00:00:00', 6, ''),
(7, 1, 0, 'DSCN4619', 'dscn4619', '/pathfinder_camporee_2009/DSCN4619.JPG', '', '2009-02-04 12:21:52', 0, 1, 0, '0000-00-00 00:00:00', 7, ''),
(8, 2, 0, 'DSCF9211', 'dscf9211', '/sud_office/DSCF9211.JPG', '', '2009-02-04 12:21:52', 0, 1, 0, '0000-00-00 00:00:00', 1, ''),
(9, 2, 0, 'DSCF9212', 'dscf9212', '/sud_office/DSCF9212.JPG', '', '2009-02-04 12:21:52', 0, 1, 0, '0000-00-00 00:00:00', 2, ''),
(10, 2, 0, 'DSCF9213', 'dscf9213', '/sud_office/DSCF9213.JPG', '', '2009-02-04 12:21:52', 0, 1, 0, '0000-00-00 00:00:00', 3, ''),
(11, 2, 0, 'DSCF9221', 'dscf9221', '/sud_office/DSCF9221.JPG', '', '2009-02-04 12:21:52', 0, 1, 0, '0000-00-00 00:00:00', 4, ''),
(12, 2, 0, 'DSCF9222', 'dscf9222', '/sud_office/DSCF9222.JPG', '', '2009-02-04 12:21:52', 0, 1, 0, '0000-00-00 00:00:00', 5, ''),
(13, 2, 0, 'DSCF9223', 'dscf9223', '/sud_office/DSCF9223.JPG', '', '2009-02-04 12:21:52', 0, 1, 0, '0000-00-00 00:00:00', 6, ''),
(14, 2, 0, 'DSCF9229', 'dscf9229', '/sud_office/DSCF9229.JPG', '', '2009-02-04 12:21:52', 0, 1, 0, '0000-00-00 00:00:00', 7, ''),
(15, 2, 0, 'DSCF9237', 'dscf9237', '/sud_office/DSCF9237.JPG', '', '2009-02-04 12:21:52', 0, 1, 0, '0000-00-00 00:00:00', 8, ''),
(16, 2, 0, 'DSCF9242', 'dscf9242', '/sud_office/DSCF9242.JPG', '', '2009-02-04 12:21:52', 0, 1, 0, '0000-00-00 00:00:00', 9, '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_phocagallery_categories`
--

DROP TABLE IF EXISTS `jos_phocagallery_categories`;
CREATE TABLE IF NOT EXISTS `jos_phocagallery_categories` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `image` varchar(255) NOT NULL default '',
  `section` varchar(50) NOT NULL default '',
  `image_position` varchar(30) NOT NULL default '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `editor` varchar(50) default NULL,
  `ordering` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `count` int(11) NOT NULL default '0',
  `hits` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `cat_idx` (`section`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `jos_phocagallery_categories`
--

INSERT INTO `jos_phocagallery_categories` (`id`, `parent_id`, `title`, `name`, `alias`, `image`, `section`, `image_position`, `description`, `published`, `checked_out`, `checked_out_time`, `editor`, `ordering`, `access`, `count`, `hits`, `params`) VALUES
(1, 0, 'Pathfinder Camporee 2009', '', 'pathfinder_camporee_2009', '', '', 'left', 'Pictures from the Southern Asia Division Pathfinder Camporee in January 2009.', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, 2, 'accessuserid=0,;uploaduserid=-2,;deleteuserid=-2,;zoom=2;'),
(2, 0, 'Southern Asia Division Office', '', 'sud_office', '', '', 'left', 'A brief tour of the Southern Asia Division of Seventh-day Adventists office located in Hosur, India.', 1, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, 1, 'accessuserid=0,;uploaduserid=-2,;deleteuserid=-2,;zoom=2;');

-- --------------------------------------------------------

--
-- Table structure for table `jos_phocagallery_comments`
--

DROP TABLE IF EXISTS `jos_phocagallery_comments`;
CREATE TABLE IF NOT EXISTS `jos_phocagallery_comments` (
  `id` int(11) NOT NULL auto_increment,
  `catid` int(11) NOT NULL default '0',
  `userid` int(11) NOT NULL default '0',
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `title` varchar(255) NOT NULL default '',
  `comment` text NOT NULL,
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_phocagallery_comments`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_phocagallery_user_category`
--

DROP TABLE IF EXISTS `jos_phocagallery_user_category`;
CREATE TABLE IF NOT EXISTS `jos_phocagallery_user_category` (
  `id` int(11) NOT NULL auto_increment,
  `catid` int(11) NOT NULL default '0',
  `userid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `catid` (`catid`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_phocagallery_user_category`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_phocagallery_votes`
--

DROP TABLE IF EXISTS `jos_phocagallery_votes`;
CREATE TABLE IF NOT EXISTS `jos_phocagallery_votes` (
  `id` int(11) NOT NULL auto_increment,
  `catid` int(11) NOT NULL default '0',
  `userid` int(11) NOT NULL default '0',
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `rating` tinyint(1) NOT NULL default '0',
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_phocagallery_votes`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_phocagallery_votes_statistics`
--

DROP TABLE IF EXISTS `jos_phocagallery_votes_statistics`;
CREATE TABLE IF NOT EXISTS `jos_phocagallery_votes_statistics` (
  `id` int(11) NOT NULL auto_increment,
  `catid` int(11) NOT NULL default '0',
  `count` tinyint(11) NOT NULL default '0',
  `average` float(8,6) NOT NULL default '0.000000',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_phocagallery_votes_statistics`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_plugins`
--

DROP TABLE IF EXISTS `jos_plugins`;
CREATE TABLE IF NOT EXISTS `jos_plugins` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `element` varchar(100) NOT NULL default '',
  `folder` varchar(100) NOT NULL default '',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `published` tinyint(3) NOT NULL default '0',
  `iscore` tinyint(3) NOT NULL default '0',
  `client_id` tinyint(3) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_folder` (`published`,`client_id`,`access`,`folder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `jos_plugins`
--

INSERT INTO `jos_plugins` (`id`, `name`, `element`, `folder`, `access`, `ordering`, `published`, `iscore`, `client_id`, `checked_out`, `checked_out_time`, `params`) VALUES
(1, 'Authentication - Joomla', 'joomla', 'authentication', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(2, 'Authentication - LDAP', 'ldap', 'authentication', 0, 2, 0, 1, 0, 0, '0000-00-00 00:00:00', 'host=\nport=389\nuse_ldapV3=0\nnegotiate_tls=0\nno_referrals=0\nauth_method=bind\nbase_dn=\nsearch_string=\nusers_dn=\nusername=\npassword=\nldap_fullname=fullName\nldap_email=mail\nldap_uid=uid\n\n'),
(3, 'Authentication - GMail', 'gmail', 'authentication', 0, 4, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(4, 'Authentication - OpenID', 'openid', 'authentication', 0, 3, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(5, 'User - Joomla!', 'joomla', 'user', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', 'autoregister=1\n\n'),
(6, 'Search - Content', 'content', 'search', 0, 1, 1, 1, 0, 62, '2009-03-17 10:41:05', 'search_limit=50\nsearch_content=1\nsearch_uncategorised=1\nsearch_archived=1\n\n'),
(7, 'Search - Contacts', 'contacts', 'search', 0, 3, 0, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(8, 'Search - Categories', 'categories', 'search', 0, 4, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(9, 'Search - Sections', 'sections', 'search', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(10, 'Search - Newsfeeds', 'newsfeeds', 'search', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(11, 'Search - Weblinks', 'weblinks', 'search', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(12, 'Content - Pagebreak', 'pagebreak', 'content', 0, 10000, 1, 1, 0, 0, '0000-00-00 00:00:00', 'enabled=1\ntitle=1\nmultipage_toc=1\nshowall=1\n\n'),
(13, 'Content - Rating', 'vote', 'content', 0, 4, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(14, 'Content - Email Cloaking', 'emailcloak', 'content', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', 'mode=1\n\n'),
(15, 'Content - Code Hightlighter (GeSHi)', 'geshi', 'content', 0, 5, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(16, 'Content - Load Module', 'loadmodule', 'content', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', 'enabled=1\nstyle=0\n\n'),
(17, 'Content - Page Navigation', 'pagenavigation', 'content', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', 'position=1\n\n'),
(18, 'Editor - No Editor', 'none', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(19, 'Editor - TinyMCE 2.0', 'tinymce', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', 'theme=advanced\ncleanup=1\ncleanup_startup=0\nautosave=0\ncompressed=0\nrelative_urls=1\ntext_direction=ltr\nlang_mode=0\nlang_code=en\ninvalid_elements=applet\ncontent_css=1\ncontent_css_custom=\nnewlines=0\ntoolbar=top\nhr=1\nsmilies=1\ntable=1\nstyle=1\nlayer=1\nxhtmlxtras=0\ntemplate=0\ndirectionality=1\nfullscreen=1\nhtml_height=550\nhtml_width=750\npreview=1\ninsertdate=1\nformat_date=%Y-%m-%d\ninserttime=1\nformat_time=%H:%M:%S\n\n'),
(20, 'Editor - XStandard Lite 2.0', 'xstandard', 'editors', 0, 0, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(21, 'Editor Button - Image', 'image', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(22, 'Editor Button - Pagebreak', 'pagebreak', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(23, 'Editor Button - Readmore', 'readmore', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(24, 'XML-RPC - Joomla', 'joomla', 'xmlrpc', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(25, 'XML-RPC - Blogger API', 'blogger', 'xmlrpc', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', 'catid=1\nsectionid=0\n\n'),
(27, 'System - SEF', 'sef', 'system', 0, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(28, 'System - Debug', 'debug', 'system', 0, 2, 1, 0, 0, 0, '0000-00-00 00:00:00', 'queries=1\nmemory=1\nlangauge=1\n\n'),
(29, 'System - Legacy', 'legacy', 'system', 0, 3, 0, 1, 0, 0, '0000-00-00 00:00:00', 'route=0\n\n'),
(30, 'System - Cache', 'cache', 'system', 0, 4, 0, 1, 0, 0, '0000-00-00 00:00:00', 'browsercache=0\ncachetime=15\n\n'),
(31, 'System - Log', 'log', 'system', 0, 5, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(32, 'System - Remember Me', 'remember', 'system', 0, 6, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(33, 'System - Backlink', 'backlink', 'system', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(34, 'Content - MorfeoShow', 'morfeoshow', 'content', 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(35, 'Editor - JCE 1.5.1', 'jce', 'editors', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', 'editor_state=mceEditor\neditor_toggle_text=[show/hide]\neditor_layout_rows=5\n'),
(40, 'System - JoomSEO', 'JoomSEO', 'system', 0, 0, 0, 0, 0, 62, '2008-12-12 07:13:19', '@spacer=Title Options\ntitleLength=127\ntitleOrder=1\n@spacer=Title Site Name\nshowTitleSiteName=1\n@spacer=Title Content Heading\nshowContentHeading=1\n@spacer=Title First Paragraph\nparagraphMinLength=20\nparagraphLength=50\n@spacer=Title Keywords\nkeywordMinCharacters=3\ntitleKeywordCount=5\n@spacer=Meta Tags\nmetaKeywordsCount=25\nmetaDescriptionMinLength=80\nmetaDescriptionMaxLength=150\nshowGenerator=1\n@spacer=Keyword Filter\nbadWords=0 1 2 3 4 5 6 7 8 9 A B C D E F G H I J K L M N O P Q R S T U V W X Y Z about an are as at be by com de en for from how in is it its la of on or that the this to was what when where who will with und the www and all has been your us up youll can if youve do know we not many you our but there they then more\nbadCharacters=0 1 2 3 4 5 6 7 8 9 > < & - , . ; : ) ( ? ! { } [ ] / '' " %\n@spacer=Front Page\nfrontpageEnabled=1\n@spacer=Frontpage Specific Activation\n@spacer=Frontpage Overrides\n@spacer=SEO / Accessability\n'),
(41, 'Search - Churches', 'churches', 'search', 0, 0, 1, 0, 0, 62, '2009-03-17 11:05:38', 'search_limit=50\n\n'),
(42, 'Search - Contacts in Directory', 'directory_contacts', 'search', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n');

-- --------------------------------------------------------

--
-- Table structure for table `jos_polls`
--

DROP TABLE IF EXISTS `jos_polls`;
CREATE TABLE IF NOT EXISTS `jos_polls` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `voters` int(9) NOT NULL default '0',
  `checked_out` int(11) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL default '0',
  `access` int(11) NOT NULL default '0',
  `lag` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_polls`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_poll_data`
--

DROP TABLE IF EXISTS `jos_poll_data`;
CREATE TABLE IF NOT EXISTS `jos_poll_data` (
  `id` int(11) NOT NULL auto_increment,
  `pollid` int(11) NOT NULL default '0',
  `text` text NOT NULL,
  `hits` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `pollid` (`pollid`,`text`(1))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_poll_data`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_poll_date`
--

DROP TABLE IF EXISTS `jos_poll_date`;
CREATE TABLE IF NOT EXISTS `jos_poll_date` (
  `id` bigint(20) NOT NULL auto_increment,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `vote_id` int(11) NOT NULL default '0',
  `poll_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `poll_id` (`poll_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_poll_date`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_poll_menu`
--

DROP TABLE IF EXISTS `jos_poll_menu`;
CREATE TABLE IF NOT EXISTS `jos_poll_menu` (
  `pollid` int(11) NOT NULL default '0',
  `menuid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`pollid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_poll_menu`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_sections`
--

DROP TABLE IF EXISTS `jos_sections`;
CREATE TABLE IF NOT EXISTS `jos_sections` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `image` text NOT NULL,
  `scope` varchar(50) NOT NULL default '',
  `image_position` varchar(30) NOT NULL default '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `count` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_scope` (`scope`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `jos_sections`
--

INSERT INTO `jos_sections` (`id`, `title`, `name`, `alias`, `image`, `scope`, `image_position`, `description`, `published`, `checked_out`, `checked_out_time`, `ordering`, `access`, `count`, `params`) VALUES
(1, 'General Information', '', 'general-information', '', 'content', 'left', 'Information about the Southern Asia Division and Seventh-day Adventists in general.', 1, 0, '0000-00-00 00:00:00', 1, 0, 3, ''),
(2, 'Lists', '', 'lists', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 2, 0, 1, ''),
(3, 'News', '', 'news', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 3, 0, 1, ''),
(4, 'Articles', '', 'articles', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 4, 0, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_sefexts`
--

DROP TABLE IF EXISTS `jos_sefexts`;
CREATE TABLE IF NOT EXISTS `jos_sefexts` (
  `id` int(11) NOT NULL auto_increment,
  `file` varchar(100) NOT NULL default '',
  `title` varchar(100) default NULL,
  `params` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `jos_sefexts`
--

INSERT INTO `jos_sefexts` (`id`, `file`, `title`, `params`) VALUES
(1, 'com_wrapper.xml', NULL, 'ignoreSource=0\nitemid=1\noverrideId='),
(2, 'com_contact.xml', '', NULL),
(3, 'com_content.xml', '', NULL),
(4, 'com_jce.xml', '', NULL),
(5, 'com_morfeoshow.xml', '', NULL),
(6, 'com_poll.xml', '', NULL),
(7, 'com_search.xml', '', NULL),
(8, 'com_user.xml', '', NULL),
(9, 'com_xmap.xml', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jos_sefexttexts`
--

DROP TABLE IF EXISTS `jos_sefexttexts`;
CREATE TABLE IF NOT EXISTS `jos_sefexttexts` (
  `id` int(11) NOT NULL auto_increment,
  `extension` varchar(100) NOT NULL default '',
  `name` varchar(100) NOT NULL default '',
  `value` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_sefexttexts`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_sefmoved`
--

DROP TABLE IF EXISTS `jos_sefmoved`;
CREATE TABLE IF NOT EXISTS `jos_sefmoved` (
  `id` int(11) NOT NULL auto_increment,
  `old` varchar(255) NOT NULL default '',
  `new` varchar(255) NOT NULL default '',
  `lastHit` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`),
  KEY `old` (`old`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_sefmoved`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_session`
--

DROP TABLE IF EXISTS `jos_session`;
CREATE TABLE IF NOT EXISTS `jos_session` (
  `username` varchar(150) default '',
  `time` varchar(14) default '',
  `session_id` varchar(200) NOT NULL default '0',
  `guest` tinyint(4) default '1',
  `userid` int(11) default '0',
  `usertype` varchar(50) default '',
  `gid` tinyint(3) unsigned NOT NULL default '0',
  `client_id` tinyint(3) unsigned NOT NULL default '0',
  `data` longtext,
  PRIMARY KEY  (`session_id`(64)),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_session`
--

INSERT INTO `jos_session` (`username`, `time`, `session_id`, `guest`, `userid`, `usertype`, `gid`, `client_id`, `data`) VALUES
('', '1237367476', '278faef13a9ac659fd4d510a9c48c0be', 1, 0, '', 0, 0, '__default|a:8:{s:15:"session.counter";i:13;s:19:"session.timer.start";i:1237367342;s:18:"session.timer.last";i:1237367471;s:17:"session.timer.now";i:1237367476;s:22:"session.client.browser";s:111:"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.7) Gecko/2009021910 Firefox/3.0.7 (.NET CLR 3.5.21022)";s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:1:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":19:{s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:3:"gid";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:3:"aid";i:0;s:5:"guest";i:1;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:90:"C:\\Documents and Settings\\sajo\\workspace\\SUDJoomla\\libraries\\joomla\\html\\parameter\\element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}}s:13:"session.token";s:32:"c84ae4099c02c2ace84fd741f99bdbc8";}'),
('sajo', '1237367450', '96153113ce66bc59ec27a923e31d8698', 0, 62, 'Super Administrator', 25, 1, '__default|a:8:{s:15:"session.counter";i:17;s:19:"session.timer.start";i:1237366818;s:18:"session.timer.last";i:1237367449;s:17:"session.timer.now";i:1237367450;s:22:"session.client.browser";s:111:"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.7) Gecko/2009021910 Firefox/3.0.7 (.NET CLR 3.5.21022)";s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:5:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":0:{}}s:11:"application";a:1:{s:4:"data";O:8:"stdClass":1:{s:4:"lang";s:0:"";}}s:24:"com_directory_categories";a:1:{s:4:"data";O:8:"stdClass":5:{s:12:"filter_order";s:10:"c.ordering";s:16:"filter_order_Dir";s:0:"";s:13:"com_directory";O:8:"stdClass":1:{s:12:"filter_state";s:0:"";}s:6:"search";s:0:"";s:10:"limitstart";s:2:"20";}}s:6:"global";a:1:{s:4:"data";O:8:"stdClass":1:{s:4:"list";O:8:"stdClass":1:{s:5:"limit";s:2:"20";}}}s:11:"com_plugins";a:1:{s:4:"data";O:8:"stdClass":2:{s:4:"site";O:8:"stdClass":5:{s:12:"filter_order";s:8:"p.folder";s:16:"filter_order_Dir";s:0:"";s:12:"filter_state";s:0:"";s:11:"filter_type";s:1:"1";s:6:"search";s:0:"";}s:10:"limitstart";s:2:"20";}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":19:{s:2:"id";s:2:"62";s:4:"name";s:12:"Steven Oxley";s:8:"username";s:4:"sajo";s:5:"email";s:16:"sajo@andrews.edu";s:8:"password";s:65:"83d31b119f30d89ed2895f473f6bd3ed:c8Yn9F5029loAA3dhhBkOojuwEqHCXZR";s:14:"password_clear";s:0:"";s:8:"usertype";s:19:"Super Administrator";s:5:"block";s:1:"0";s:9:"sendEmail";s:1:"1";s:3:"gid";s:2:"25";s:12:"registerDate";s:19:"2008-10-06 15:30:04";s:13:"lastvisitDate";s:19:"2009-03-17 11:48:02";s:10:"activation";s:0:"";s:6:"params";s:58:"admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=5.5\n\n";s:3:"aid";i:2;s:5:"guest";i:0;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:90:"C:\\Documents and Settings\\sajo\\workspace\\SUDJoomla\\libraries\\joomla\\html\\parameter\\element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":5:{s:14:"admin_language";s:0:"";s:8:"language";s:0:"";s:6:"editor";s:0:"";s:8:"helpsite";s:0:"";s:8:"timezone";s:3:"5.5";}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}}s:13:"session.token";s:32:"f606a4fda684b744fb1ed32f4a1f8e56";}');

-- --------------------------------------------------------

--
-- Table structure for table `jos_states`
--

DROP TABLE IF EXISTS `jos_states`;
CREATE TABLE IF NOT EXISTS `jos_states` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `jos_states`
--

INSERT INTO `jos_states` (`id`, `name`) VALUES
(1, 'Andhra Pradesh'),
(2, 'Arunachal Pradesh'),
(3, 'Assam'),
(4, 'Bihar'),
(5, 'Chhattisgarh'),
(6, 'Goa'),
(7, 'Gujarat'),
(8, 'Haryana'),
(9, 'Himachal Pradesh'),
(10, 'Jammu and Kashmir'),
(11, 'Jharkhand'),
(12, 'Karnataka'),
(13, 'Kerala'),
(14, 'Madhya Pradesh'),
(15, 'Maharashtra'),
(16, 'Manipur'),
(17, 'Meghalaya'),
(18, 'Mizoram'),
(19, 'Nagaland'),
(20, 'Orissa'),
(21, 'Punjab'),
(22, 'Rajasthan'),
(23, 'Sikkim'),
(24, 'Tamil Nadu'),
(25, 'Tripura'),
(26, 'Uttar Pradesh'),
(27, 'Uttarakhand'),
(28, 'West Bengal');

-- --------------------------------------------------------

--
-- Table structure for table `jos_stats_agents`
--

DROP TABLE IF EXISTS `jos_stats_agents`;
CREATE TABLE IF NOT EXISTS `jos_stats_agents` (
  `agent` varchar(255) NOT NULL default '',
  `type` tinyint(1) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_stats_agents`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_templates_menu`
--

DROP TABLE IF EXISTS `jos_templates_menu`;
CREATE TABLE IF NOT EXISTS `jos_templates_menu` (
  `template` varchar(255) NOT NULL default '',
  `menuid` int(11) NOT NULL default '0',
  `client_id` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`menuid`,`client_id`,`template`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_templates_menu`
--

INSERT INTO `jos_templates_menu` (`template`, `menuid`, `client_id`) VALUES
('ja_purity', 0, 0),
('khepri', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_users`
--

DROP TABLE IF EXISTS `jos_users`;
CREATE TABLE IF NOT EXISTS `jos_users` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `username` varchar(150) NOT NULL default '',
  `email` varchar(100) NOT NULL default '',
  `password` varchar(100) NOT NULL default '',
  `usertype` varchar(25) NOT NULL default '',
  `block` tinyint(4) NOT NULL default '0',
  `sendEmail` tinyint(4) default '0',
  `gid` tinyint(3) unsigned NOT NULL default '1',
  `registerDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL default '',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`),
  KEY `gid_block` (`gid`,`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;

--
-- Dumping data for table `jos_users`
--

INSERT INTO `jos_users` (`id`, `name`, `username`, `email`, `password`, `usertype`, `block`, `sendEmail`, `gid`, `registerDate`, `lastvisitDate`, `activation`, `params`) VALUES
(62, 'Steven Oxley', 'sajo', 'sajo@andrews.edu', '83d31b119f30d89ed2895f473f6bd3ed:c8Yn9F5029loAA3dhhBkOojuwEqHCXZR', 'Super Administrator', 0, 1, 25, '2008-10-06 15:30:04', '2009-03-18 09:00:34', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=5.5\n\n');

-- --------------------------------------------------------

--
-- Table structure for table `jos_weblinks`
--

DROP TABLE IF EXISTS `jos_weblinks`;
CREATE TABLE IF NOT EXISTS `jos_weblinks` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `catid` int(11) NOT NULL default '0',
  `sid` int(11) NOT NULL default '0',
  `title` varchar(250) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `url` varchar(250) NOT NULL default '',
  `description` text NOT NULL,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL default '0',
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `archived` tinyint(1) NOT NULL default '0',
  `approved` tinyint(1) NOT NULL default '1',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `catid` (`catid`,`published`,`archived`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_weblinks`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_xmap`
--

DROP TABLE IF EXISTS `jos_xmap`;
CREATE TABLE IF NOT EXISTS `jos_xmap` (
  `name` varchar(30) NOT NULL default '',
  `value` varchar(100) default NULL,
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_xmap`
--

INSERT INTO `jos_xmap` (`name`, `value`) VALUES
('version', '1.1'),
('classname', 'sitemap'),
('expand_category', '1'),
('expand_section', '1'),
('show_menutitle', '1'),
('columns', '1'),
('exlinks', '1'),
('ext_image', 'img_grey.gif'),
('exclmenus', ''),
('includelink', '1'),
('sitemap_default', '1'),
('exclude_css', '0'),
('exclude_xsl', '0');

-- --------------------------------------------------------

--
-- Table structure for table `jos_xmap_ext`
--

DROP TABLE IF EXISTS `jos_xmap_ext`;
CREATE TABLE IF NOT EXISTS `jos_xmap_ext` (
  `id` int(11) NOT NULL auto_increment,
  `extension` varchar(100) NOT NULL default '',
  `published` int(1) default '0',
  `params` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_xmap_ext`
--

INSERT INTO `jos_xmap_ext` (`id`, `extension`, `published`, `params`) VALUES
(1, 'com_content', 1, '-1{expand_categories=1\nexpand_sections=1\nshow_unauth=0\nmax_art=0\nmax_art_age=0\ncat_priority=-1\ncat_changefreq=-1\nart_priority=-1\nart_changefreq=-1\n}');

-- --------------------------------------------------------

--
-- Table structure for table `jos_xmap_sitemap`
--

DROP TABLE IF EXISTS `jos_xmap_sitemap`;
CREATE TABLE IF NOT EXISTS `jos_xmap_sitemap` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `expand_category` int(11) default NULL,
  `expand_section` int(11) default NULL,
  `show_menutitle` int(11) default NULL,
  `columns` int(11) default NULL,
  `exlinks` int(11) default NULL,
  `ext_image` varchar(255) default NULL,
  `menus` text,
  `exclmenus` varchar(255) default NULL,
  `includelink` int(11) default NULL,
  `usecache` int(11) default NULL,
  `cachelifetime` int(11) default NULL,
  `classname` varchar(255) default NULL,
  `count_xml` int(11) default NULL,
  `count_html` int(11) default NULL,
  `views_xml` int(11) default NULL,
  `views_html` int(11) default NULL,
  `lastvisit_xml` int(11) default NULL,
  `lastvisit_html` int(11) default NULL,
  `excluded_items` varchar(255) default NULL,
  `compress_xml` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_xmap_sitemap`
--

INSERT INTO `jos_xmap_sitemap` (`id`, `name`, `expand_category`, `expand_section`, `show_menutitle`, `columns`, `exlinks`, `ext_image`, `menus`, `exclmenus`, `includelink`, `usecache`, `cachelifetime`, `classname`, `count_xml`, `count_html`, `views_xml`, `views_html`, `lastvisit_xml`, `lastvisit_html`, `excluded_items`, `compress_xml`) VALUES
(1, 'New Sitemap', 1, 1, 1, 1, 1, 'img_grey.gif', 'mainmenu,0,1,1,0.7,daily\ngeneralinfo,1,1,1,0.5,monthly', '', 1, 0, 15, 'xmap', 55, 13, 71, 1, 1233740527, 1225915829, '', 0);
