-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 02, 2015 at 03:47 PM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `insya`
--

-- --------------------------------------------------------

--
-- Table structure for table `com_contect`
--

CREATE TABLE IF NOT EXISTS `com_contect` (
`id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `success_message` text COLLATE utf8_unicode_ci NOT NULL,
  `failure_message` text COLLATE utf8_unicode_ci NOT NULL,
  `emails` text COLLATE utf8_unicode_ci NOT NULL,
  `fileds_names` text COLLATE utf8_unicode_ci NOT NULL,
  `fileds_types` text COLLATE utf8_unicode_ci NOT NULL,
  `fileds_values` text COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `delete` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `com_contect_messages`
--

CREATE TABLE IF NOT EXISTS `com_contect_messages` (
`id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `com_content_article`
--

CREATE TABLE IF NOT EXISTS `com_content_article` (
`id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `des` text NOT NULL,
  `artbody` text NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  `cat_id` text NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `gal_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `author` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `modified` date NOT NULL,
  `created` date NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `hit` int(11) NOT NULL,
  `imagegallery` int(11) NOT NULL,
  `tags` text NOT NULL,
  `th_image` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `keywords` text NOT NULL,
  `header` text NOT NULL,
  `vediogallery` int(11) NOT NULL,
  `intro` text NOT NULL,
  `ex_link` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=248 ;

--
-- Dumping data for table `com_content_article`
--

INSERT INTO `com_content_article` (`id`, `title`, `des`, `artbody`, `hits`, `cat_id`, `start_date`, `end_date`, `gal_id`, `date`, `author`, `order`, `delete`, `modified`, `created`, `enabled`, `hit`, `imagegallery`, `tags`, `th_image`, `alias`, `description`, `keywords`, `header`, `vediogallery`, `intro`, `ex_link`) VALUES
(151, 'Holiday Package', '<p><span>To the Tour Operators &amp; Zaaereen Keraam Faiz E Haakimi and its Khidmat guzaar would like to convey Mubarakbadi to everyone ...</span></p>', '<h2>&nbsp;</h2>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n<div>&nbsp;</div>\r\n<ul>\r\n<li>Need to take a break from work?!</li>\r\n<li>Need to spend some quality time with your family away from the pressures of daily life?!</li>\r\n<li>Need your children to acquire the barakaat of Awliyaullah&nbsp;<sup>(AS)</sup>&nbsp;Ziyarat and masajid along with the holiday they have been dreaming of?!</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Look no further!&nbsp;Egypt&nbsp;is the Perfect destination for you!</p>\r\n<p>Stay at Faiz e Haakimi&rsquo;s Luxurious property at the heart of Cairo while you perform the Ziyarat of Imam Husain&nbsp;<sup>(AS)</sup>&nbsp;and other Ahle Bait&nbsp;<sup>(AS)</sup>&nbsp;and Pray namaz at Jame Anwar and other masajid before you set off to your holiday at the Red Sea Riviera or the historic cities of Luxor and Aswan in Upper Egypt.</p>\r\n<p>If you reside in the&nbsp;US&nbsp;or&nbsp;Europe, you might find very good deals on reputed websites like Lastminute.com&hellip;etc to various holiday destinations.</p>\r\n<p>Just contact&nbsp;<a href=\\"mailto:tours@faizehaakimi.com\\">tours@faizehaakimi.com</a>&nbsp;and we&rsquo;ll help you plan your trip.</p>\r\n<p>&nbsp;&nbsp; &nbsp;</p>', 0, '35', '0000-00-00', '0000-00-00', 0, '2013-04-16', '', 93, 1, '2015-03-20', '2013-04-16', 1, 33, 0, '', '', 'Holiday-Package', '', '', '', 0, '', ''),
(152, 'Holiday Package', '<p><span>To the Tour Operators &amp; Zaaereen Keraam Faiz E Haakimi and its Khidmat guzaar would like to convey Mubarakbadi to everyone ...</span></p>', '<h2>&nbsp;</h2>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n<div>&nbsp;</div>\r\n<ul>\r\n<li>Need to take a break from work?!</li>\r\n<li>Need to spend some quality time with your family away from the pressures of daily life?!</li>\r\n<li>Need your children to acquire the barakaat of Awliyaullah&nbsp;<sup>(AS)</sup>&nbsp;Ziyarat and masajid along with the holiday they have been dreaming of?!</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Look no further!&nbsp;Egypt&nbsp;is the Perfect destination for you!</p>\r\n<p>Stay at Faiz e Haakimi&rsquo;s Luxurious property at the heart of Cairo while you perform the Ziyarat of Imam Husain&nbsp;<sup>(AS)</sup>&nbsp;and other Ahle Bait&nbsp;<sup>(AS)</sup>&nbsp;and Pray namaz at Jame Anwar and other masajid before you set off to your holiday at the Red Sea Riviera or the historic cities of Luxor and Aswan in Upper Egypt.</p>\r\n<p>If you reside in the&nbsp;US&nbsp;or&nbsp;Europe, you might find very good deals on reputed websites like Lastminute.com&hellip;etc to various holiday destinations.</p>\r\n<p>Just contact&nbsp;<a href=\\"mailto:tours@faizehaakimi.com\\">tours@faizehaakimi.com</a>&nbsp;and we&rsquo;ll help you plan your trip.</p>\r\n<p>&nbsp;&nbsp; &nbsp;</p>', 0, '35', '0000-00-00', '0000-00-00', 0, '2013-04-16', '', 93, 1, '2015-03-20', '2013-04-16', 1, 0, 0, '', '', 'Holiday-Package', '', '', '', 0, '', ''),
(153, 'Holiday Package', '<p><span>To the Tour Operators &amp; Zaaereen Keraam Faiz E Haakimi and its Khidmat guzaar would like to convey Mubarakbadi to everyone ...</span></p>', '<h2>&nbsp;</h2>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n<div>&nbsp;</div>\r\n<ul>\r\n<li>Need to take a break from work?!</li>\r\n<li>Need to spend some quality time with your family away from the pressures of daily life?!</li>\r\n<li>Need your children to acquire the barakaat of Awliyaullah&nbsp;<sup>(AS)</sup>&nbsp;Ziyarat and masajid along with the holiday they have been dreaming of?!</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Look no further!&nbsp;Egypt&nbsp;is the Perfect destination for you!</p>\r\n<p>Stay at Faiz e Haakimi&rsquo;s Luxurious property at the heart of Cairo while you perform the Ziyarat of Imam Husain&nbsp;<sup>(AS)</sup>&nbsp;and other Ahle Bait&nbsp;<sup>(AS)</sup>&nbsp;and Pray namaz at Jame Anwar and other masajid before you set off to your holiday at the Red Sea Riviera or the historic cities of Luxor and Aswan in Upper Egypt.</p>\r\n<p>If you reside in the&nbsp;US&nbsp;or&nbsp;Europe, you might find very good deals on reputed websites like Lastminute.com&hellip;etc to various holiday destinations.</p>\r\n<p>Just contact&nbsp;<a href=\\"mailto:tours@faizehaakimi.com\\">tours@faizehaakimi.com</a>&nbsp;and we&rsquo;ll help you plan your trip.</p>\r\n<p>&nbsp;&nbsp; &nbsp;</p>', 0, '35', '0000-00-00', '0000-00-00', 0, '2013-04-16', '', 93, 1, '2015-03-20', '2013-04-16', 1, 0, 0, '', '', 'Holiday-Package', '', '', '', 0, '', ''),
(154, 'Holiday Package', '<p><span>To the Tour Operators &amp; Zaaereen Keraam Faiz E Haakimi and its Khidmat guzaar would like to convey Mubarakbadi to everyone ...</span></p>', '<h2>&nbsp;</h2>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n<div>&nbsp;</div>\r\n<ul>\r\n<li>Need to take a break from work?!</li>\r\n<li>Need to spend some quality time with your family away from the pressures of daily life?!</li>\r\n<li>Need your children to acquire the barakaat of Awliyaullah&nbsp;<sup>(AS)</sup>&nbsp;Ziyarat and masajid along with the holiday they have been dreaming of?!</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Look no further!&nbsp;Egypt&nbsp;is the Perfect destination for you!</p>\r\n<p>Stay at Faiz e Haakimi&rsquo;s Luxurious property at the heart of Cairo while you perform the Ziyarat of Imam Husain&nbsp;<sup>(AS)</sup>&nbsp;and other Ahle Bait&nbsp;<sup>(AS)</sup>&nbsp;and Pray namaz at Jame Anwar and other masajid before you set off to your holiday at the Red Sea Riviera or the historic cities of Luxor and Aswan in Upper Egypt.</p>\r\n<p>If you reside in the&nbsp;US&nbsp;or&nbsp;Europe, you might find very good deals on reputed websites like Lastminute.com&hellip;etc to various holiday destinations.</p>\r\n<p>Just contact&nbsp;<a href=\\"mailto:tours@faizehaakimi.com\\">tours@faizehaakimi.com</a>&nbsp;and we&rsquo;ll help you plan your trip.</p>\r\n<p>&nbsp;&nbsp; &nbsp;</p>', 0, '35', '0000-00-00', '0000-00-00', 0, '2013-04-16', '', 93, 1, '2015-03-20', '2013-04-16', 1, 0, 0, '', '', 'Holiday-Package', '', '', '', 0, '', ''),
(155, 'Holiday Package', '<p><span>To the Tour Operators &amp; Zaaereen Keraam Faiz E Haakimi and its Khidmat guzaar would like to convey Mubarakbadi to everyone ...</span></p>', '<h2>&nbsp;</h2>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n<div>&nbsp;</div>\r\n<ul>\r\n<li>Need to take a break from work?!</li>\r\n<li>Need to spend some quality time with your family away from the pressures of daily life?!</li>\r\n<li>Need your children to acquire the barakaat of Awliyaullah&nbsp;<sup>(AS)</sup>&nbsp;Ziyarat and masajid along with the holiday they have been dreaming of?!</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Look no further!&nbsp;Egypt&nbsp;is the Perfect destination for you!</p>\r\n<p>Stay at Faiz e Haakimi&rsquo;s Luxurious property at the heart of Cairo while you perform the Ziyarat of Imam Husain&nbsp;<sup>(AS)</sup>&nbsp;and other Ahle Bait&nbsp;<sup>(AS)</sup>&nbsp;and Pray namaz at Jame Anwar and other masajid before you set off to your holiday at the Red Sea Riviera or the historic cities of Luxor and Aswan in Upper Egypt.</p>\r\n<p>If you reside in the&nbsp;US&nbsp;or&nbsp;Europe, you might find very good deals on reputed websites like Lastminute.com&hellip;etc to various holiday destinations.</p>\r\n<p>Just contact&nbsp;<a href=\\"mailto:tours@faizehaakimi.com\\">tours@faizehaakimi.com</a>&nbsp;and we&rsquo;ll help you plan your trip.</p>\r\n<p>&nbsp;&nbsp; &nbsp;</p>', 0, '35', '0000-00-00', '0000-00-00', 0, '2013-04-16', '', 93, 1, '2015-03-20', '2013-04-16', 1, 0, 0, '', '', 'Holiday-Package', '', '', '', 0, '', ''),
(156, 'Holiday Package', '<p><span>To the Tour Operators &amp; Zaaereen Keraam Faiz E Haakimi and its Khidmat guzaar would like to convey Mubarakbadi to everyone ...</span></p>', '<h2>&nbsp;</h2>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n<div>&nbsp;</div>\r\n<ul>\r\n<li>Need to take a break from work?!</li>\r\n<li>Need to spend some quality time with your family away from the pressures of daily life?!</li>\r\n<li>Need your children to acquire the barakaat of Awliyaullah&nbsp;<sup>(AS)</sup>&nbsp;Ziyarat and masajid along with the holiday they have been dreaming of?!</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Look no further!&nbsp;Egypt&nbsp;is the Perfect destination for you!</p>\r\n<p>Stay at Faiz e Haakimi&rsquo;s Luxurious property at the heart of Cairo while you perform the Ziyarat of Imam Husain&nbsp;<sup>(AS)</sup>&nbsp;and other Ahle Bait&nbsp;<sup>(AS)</sup>&nbsp;and Pray namaz at Jame Anwar and other masajid before you set off to your holiday at the Red Sea Riviera or the historic cities of Luxor and Aswan in Upper Egypt.</p>\r\n<p>If you reside in the&nbsp;US&nbsp;or&nbsp;Europe, you might find very good deals on reputed websites like Lastminute.com&hellip;etc to various holiday destinations.</p>\r\n<p>Just contact&nbsp;<a href=\\"mailto:tours@faizehaakimi.com\\">tours@faizehaakimi.com</a>&nbsp;and we&rsquo;ll help you plan your trip.</p>\r\n<p>&nbsp;&nbsp; &nbsp;</p>', 0, '35', '0000-00-00', '0000-00-00', 0, '2013-04-16', '', 93, 1, '2015-03-20', '2013-04-16', 1, 0, 0, '', '', 'Holiday-Package', '', '', '', 0, '', ''),
(157, 'Holiday Package', '<p><span>To the Tour Operators &amp; Zaaereen Keraam Faiz E Haakimi and its Khidmat guzaar would like to convey Mubarakbadi to everyone ...</span></p>', '<h2>&nbsp;</h2>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n<div>&nbsp;</div>\r\n<ul>\r\n<li>Need to take a break from work?!</li>\r\n<li>Need to spend some quality time with your family away from the pressures of daily life?!</li>\r\n<li>Need your children to acquire the barakaat of Awliyaullah&nbsp;<sup>(AS)</sup>&nbsp;Ziyarat and masajid along with the holiday they have been dreaming of?!</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Look no further!&nbsp;Egypt&nbsp;is the Perfect destination for you!</p>\r\n<p>Stay at Faiz e Haakimi&rsquo;s Luxurious property at the heart of Cairo while you perform the Ziyarat of Imam Husain&nbsp;<sup>(AS)</sup>&nbsp;and other Ahle Bait&nbsp;<sup>(AS)</sup>&nbsp;and Pray namaz at Jame Anwar and other masajid before you set off to your holiday at the Red Sea Riviera or the historic cities of Luxor and Aswan in Upper Egypt.</p>\r\n<p>If you reside in the&nbsp;US&nbsp;or&nbsp;Europe, you might find very good deals on reputed websites like Lastminute.com&hellip;etc to various holiday destinations.</p>\r\n<p>Just contact&nbsp;<a href=\\"mailto:tours@faizehaakimi.com\\">tours@faizehaakimi.com</a>&nbsp;and we&rsquo;ll help you plan your trip.</p>\r\n<p>&nbsp;&nbsp; &nbsp;</p>', 0, '35', '0000-00-00', '0000-00-00', 0, '2013-04-16', '', 93, 1, '2015-03-20', '2013-04-16', 1, 0, 0, '', '', 'Holiday-Package', '', '', '', 0, '', ''),
(158, 'Holiday Package', '<p><span>To the Tour Operators &amp; Zaaereen Keraam Faiz E Haakimi and its Khidmat guzaar would like to convey Mubarakbadi to everyone ...</span></p>', '<h2>&nbsp;</h2>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n<div>&nbsp;</div>\r\n<ul>\r\n<li>Need to take a break from work?!</li>\r\n<li>Need to spend some quality time with your family away from the pressures of daily life?!</li>\r\n<li>Need your children to acquire the barakaat of Awliyaullah&nbsp;<sup>(AS)</sup>&nbsp;Ziyarat and masajid along with the holiday they have been dreaming of?!</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Look no further!&nbsp;Egypt&nbsp;is the Perfect destination for you!</p>\r\n<p>Stay at Faiz e Haakimi&rsquo;s Luxurious property at the heart of Cairo while you perform the Ziyarat of Imam Husain&nbsp;<sup>(AS)</sup>&nbsp;and other Ahle Bait&nbsp;<sup>(AS)</sup>&nbsp;and Pray namaz at Jame Anwar and other masajid before you set off to your holiday at the Red Sea Riviera or the historic cities of Luxor and Aswan in Upper Egypt.</p>\r\n<p>If you reside in the&nbsp;US&nbsp;or&nbsp;Europe, you might find very good deals on reputed websites like Lastminute.com&hellip;etc to various holiday destinations.</p>\r\n<p>Just contact&nbsp;<a href=mailto:tours@faizehaakimi.com>tours@faizehaakimi.com</a>&nbsp;and we&rsquo;ll help you plan your trip.</p>\r\n<p>&nbsp;&nbsp; &nbsp;</p>', 0, '35', '0000-00-00', '0000-00-00', 0, '2013-04-16', '', 93, 1, '2015-03-20', '2013-04-16', 1, 0, 0, '', '', 'Holiday-Package', '', '', '', 0, '', ''),
(160, 'Holiday Package', '<p>To the Tour Operators &amp; Zaaereen Keraam Faiz E Haakimi and its Khidmat guzaar would like to convey Mubarakbadi to everyone ...</p>', '<div id="all">\r\n<div id="myall">\r\n<h2>&nbsp;</h2>\r\n<table class="mytable">\r\n<tbody>\r\n<tr>\r\n<td class="on">Entrance fee</td>\r\n<td class="on">nil</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Visiting Hours</td>\r\n<td class="tw">Open throughout the day</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Traveling time</td>\r\n<td class="on">30-45 mins</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><strong><img src="/uploads/images/c18.jpg" alt="/" width="309" height="222" /></strong></p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong>City Stars</strong> is the latest commercial development in Egypt. The complex is located in between Nasr City and Heliopolis, in Cairo. It is considered to be the first, integrated urban development project, of its kind in the Middle East and Europe.</p>\r\n<p>Built with an Ancient Egyptian theme, it consists of 3 pyramids (partially glass), surrounded by 11 towers, that make up the complex, plus a separate building for the shopping mall in its 2 phases.</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong><img src="/uploads/images/c20.jpg" alt="/" /></strong></p>\r\n<p>The complex is equipped with some of the most advanced infrastructure and multi-media networks which complement the project&rsquo;s design elements and customer services, which include an easily accessible indoor parking facility for over 6,000 vehicles<sup>[1]</sup>. City Stars offers an unparalleled choice in retail and entertainment and brings together an unbeatable combination of leading brand names in a single destination.</p>\r\n<p>City Stars is the latest landmark in Cairo and consists of<sup>[1]</sup>:</p>\r\n<p><strong><img src="/uploads/images/c19.jpg" alt="/" /></strong></p>\r\n<ul>\r\n<li>Three international hotels that provides over 1,500 rooms and suites.</li>\r\n<li>Shopping and entertainment centre.</li>\r\n<li>Medical centre.</li>\r\n<li>Residential Towers; offering 266 apartments, duplexes and penthouses.</li>\r\n<li>Office Towers; offering 70,000 m<sup>2</sup> of office space.</li>\r\n<li>An International Exhibition Centre (20,000 m<sup>2</sup>)<sup>[2]</sup>.</li>\r\n</ul>\r\n<p><strong>&nbsp;</strong></p>\r\n<div id="myend"><img src="images/separetor.png" alt="/" /></div>\r\n</div>\r\n</div>', 0, ',38', '0000-00-00', '0000-00-00', 0, '2013-04-16', '', 93, 0, '2015-03-25', '2013-04-16', 1, 0, 0, '', '', 'Holiday-Package', '', '', '', 0, '', ''),
(172, 'Islamic Museum', '<p>Khan el-Khalili is for many the most entertaining part of Cairo. It is an ancient shopping area, nothing less, but some of the shops have also their own little factories or workshops.</p>', '<table class="mytable">\r\n<tbody>\r\n<tr>\r\n<td class="on">Entrance fee</td>\r\n<td class="on">50 LE</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Visiting Hours</td>\r\n<td class="tw">Sat.-Thurs. 9-4, Fri. 9-11 and 2-4.</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Traveling time</td>\r\n<td class="on">15 mins</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><img src="uploads/cairo36.jpg" alt="width=270" height="197" />&nbsp;</p>\r\n<p>The Museum of Islamic Art is considered one of the greatest in the world with its exceptional collection of rare woodwork and plaster, as well as metal, ceramic, glass, crystal, and textile objects of all periods, from all over the Islamic world. It houses more than 102,000 objects.&nbsp;</p>\r\n<p><br /><strong>Hall No 4</strong><br />The Fatimid Style, 3rd Islamic style, originated and developed in Egypt and Syria ( 969-1171 A.D.). On display a selection of ceramic objects decorated in luster glass according to the same technique, and rock crystals. A unique collection of Fatimid textiles rare in technique and decorations. The Fatimid woodworks richly decorated in sunk carved arabesque as well as molded and hammered metalwork are beautifully exhibited.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p><img src="uploads/islamicmuseum.jpg" alt="width=270" /></p>', 0, '36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 95, 1, '2015-03-20', '2013-05-28', 1, 0, 0, '', '51a5027fe7939.jpg', 'Islamic-Museum', '', '', '', 0, '', ''),
(173, 'Egyptian Museum', '<p>The Museum of Egyptian Antiquities, known commonly as the Egyptian Museum, is home to the most extensive collection of ancient Egyptian antiquities in the world. It has 136,000 items on display, with many more hundreds of thousands in its basement storerooms.</p>', '<p><img class="form_pic" src="uploads/images/Egypt_Cairo_EgyptianMuseum_01.jpg" alt="width=269" height="359" />The Museum of Egyptian Antiquities, known commonly as the Egyptian Museum, is home to the most extensive collection of ancient Egyptian antiquities in the world. It has 136,000 items on display, with many more hundreds of thousands in its basement storerooms.</p>\r\n<p>The Royal Mummy Room, containing 27 royal mummies from pharaonic times, was closed down on the orders of President Anwar Sadat in 1981. It was reopened, with a slightly curtailed display of New Kingdom kings and queens, in 1985.</p>\r\n<p>&nbsp;</p>\r\n<p><img src="uploads/images/image.jpg" alt="width=394" height="300" /></p>', 0, '36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 96, 1, '2015-03-25', '2013-05-28', 1, 10, 0, '', '51a50366b7c71.jpg', 'Egyptian-Museum', '', '', '', 0, '', ''),
(174, 'Nile Boating', '<p>Taking a Felucca down the Nile is something you must do when visiting Egypt. Feluccas are sail boats that have been used on the Nile since antiquity. You can take short sunset sails in Cairo or you can opt for longer cruises which usually depart from Aswan. A Felucca ride is ideal to enjoy the cook breeze of the nile.</p>', '<table class="mytable">\r\n<tbody>\r\n<tr>\r\n<td class="on">Entrance fee</td>\r\n<td class="on">150 LE / Boat</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Visiting Hours</td>\r\n<td class="tw">Open throughout the day</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Traveling time</td>\r\n<td class="on">30 mins</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><img class="form_pic" src="uploads/901_Felucca.JPG" alt="/" />Taking a Felucca down the Nile is something you must do when visiting Egypt. Feluccas are sail boats that have been used on the Nile since antiquity. You can take short sunset sails in Cairo or you can opt for longer cruises which usually depart from Aswan. A Felucca ride is ideal to enjoy the cook breeze of the nile.</p>', 0, '36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 97, 1, '2015-03-20', '2013-05-28', 1, 1, 0, '', '51a503a1d9569.JPG', 'Nile-Boating', '', '', '', 0, '', ''),
(175, 'Alexandria', '', '<p><img class="form_pic" src="uploads/The_Roman_Theatre_in_Alexandria.JPG" alt="/" /></p>\r\n<p>&nbsp;</p>\r\n<p>Alexandria was founded by&nbsp;Alexander the Great&nbsp;in April 331 BC as&nbsp;<span lang="grc" xml:lang="grc">?&lambda;&epsilon;&xi;?&nu;&delta;&rho;&epsilon;&iota;&alpha;</span>&nbsp;(<em>Alex&aacute;ndreia</em>). Alexander chief architect&nbsp;for the project was&nbsp;Dinocrates. Alexandria was intended to supersede&nbsp;Naucratis&nbsp;as a&nbsp;Hellenistic&nbsp;centre in Egypt, and to be the link between Greece and the rich&nbsp;Nile Valley. An Egyptian city,&nbsp;Rhakotis, already existed on the shore, and later gave its name to Alexandria in the&nbsp;Egyptian language&nbsp;(Egypt.&nbsp;<em>Ra qedyet</em>). It continued to exist as the Egyptian quarter of the city. A few months after the foundation, Alexander left Egypt for the East and never returned to his city. After Alexander departed, his viceroy,&nbsp;Cleomenes, continued the expansion. Following a struggle with the other successors of Alexander, his general&nbsp;Ptolemy&nbsp;succeeded in bringing Alexander body to Alexandria.</p>\r\n<p>Although Cleomenes was mainly in charge of seeing to Alexandria continuous development, the&nbsp;<em>Heptastadion</em>&nbsp;and the mainland quarters seem to have been primarily Ptolemaic work. Inheriting the trade of ruined&nbsp;Tyre&nbsp;and becoming the centre of the new commerce between Europe and the&nbsp;Arabian&nbsp;and Indian East, the city grew in less than a generation to be larger than&nbsp;Carthage. In a century, Alexandria had become the largest city in the world and for some centuries more, was second only to Rome. It became the main Greek city of Egypt, with an extraordinary mix of&nbsp;Greeks&nbsp;from many cities and backgrounds.</p>', 0, '37', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 98, 0, '2015-03-11', '2013-05-28', 1, 7, 0, '', '51a503e103fb3.JPG', 'Alexandria', '', '', '', 0, '', ''),
(176, 'Pharaonic Village', '<p>Imagine going to a place a few miles from the center of Cairo where Egypt entire history and art comes alive! Such a place exists in the Pharaonic Village, on Jacob Island in the Nile. The village is surrounded by trees which hide the bustle of the crowded city and provides the background for an ancient Egyptian village.</p>', '<table class="mytable">\r\n<tbody>\r\n<tr>\r\n<td class="on">Entrance fee</td>\r\n<td class="on">100 LE</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Visiting Hours</td>\r\n<td class="tw">10 am &ndash; 7 pm</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Traveling time</td>\r\n<td class="on">45 min</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><a href="../uploads/c990.jpg"><img src="uploads/c990.jpg" alt="width=300" height="197" /></a></p>\r\n<p><strong><span>&nbsp;</span></strong></p>\r\n<p>&nbsp;Imagine going to a place a few miles from the center of Cairo where Egypt entire <em>history and art</em> comes alive! Such a place exists in the Pharaonic Village, on Jacob Island in the Nile. The village is surrounded by trees which hide the bustle of the crowded city and provides the background for an ancient Egyptian village. In the village, you are transported by floating amphitheaters through a series of canals where the ancient Egyptian arts and crafts are brought to life by an incredible group of actors and actresses.</p>\r\n<p>The village began as papyrus plantation, and was thus transformed into a living museum. Scenes that you will see include the scene of Moses as a baby in the marches, agricultural life, boat-building, house - building, pottery, glass making, making of statues and alabaster, perfume making, manufacture of papyrus - and the making of beer &amp; wine.</p>\r\n<p>&nbsp; <strong>I</strong>n addition, the village contains a complete replica of the tomb of Tutankhamun - exactly as Howard Carter discovered it in November, 1922. (This is the only place in the world where the entire tomb &amp; its treasures can be seen). The village also contains 10 other museums - Four related to the Pharaonic period</p>\r\n<p>&nbsp;The village is located in the Nile, on Jacob island, about six miles from the center of Cairo, and not far from most of the hotels. The village is open from 9am to 6pm daily. In the summer months it remains open until 9pm. A guided tour of the village can last from one to three and half hours depending on what you wish to visit.</p>', 0, '36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 99, 1, '2015-03-20', '2013-05-28', 1, 0, 0, '', '51a50445b6caf.jpg', 'Pharaonic-Village', '', '', '', 0, '', ''),
(177, 'Magic Land', '<p>Magicland-Amusement park for family entertainment Entertaining dolphin show for kids and many more</p>', '<p><img src="uploads/c15.jpg" alt="width=283" height="174" /> Magicland-Amusement park for family entertainment Entertaining dolphin show for kids and many more</p>', 0, '36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 100, 1, '2015-03-20', '2013-05-28', 1, 0, 0, '', '51a504b115839.jpg', 'Magic-Land', '', '', '', 0, '', ''),
(178, 'Crystal Asfour', '<p>The Asfour Crystal Egypt is an enchanting blend of Ancient Egyptian craftsmanship and the most sophisticated modern technology. The Ancient Egyptians created glass 5000 years ago, and Asfour Crystal is proud to continue that heritage.</p>', '<table class="mytable">\r\n<tbody>\r\n<tr>\r\n<td class="on">Entrance fee</td>\r\n<td class="on">nil</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Visiting Hours</td>\r\n<td class="tw">8 am &ndash; 8 pm</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Traveling time</td>\r\n<td class="on">45 min</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><strong><img src="images/c22.jpg" alt="/" /></strong></p>\r\n<p>&nbsp;</p>\r\n<p>The <strong>Asfour Crystal</strong> Egypt is an enchanting blend of Ancient Egyptian craftsmanship and the most sophisticated modern technology. The Ancient Egyptians created glass 5000 years ago, and Asfour Crystal is proud to continue that heritage. The Asfour family has been creating these unique <strong>crystal figurines</strong> in their modern factory since 1961. Modern technology and the unique skills of Asfour s Egyptian artisans combine to create elegant crystal figurines and laser-cut crystal collectibles made with 30% sparkling lead crystal. Asfour Crystal is the 21st century technology answer to the original Pharonic glass bead invention, where glass beads had more value than natural precious stones. Asfour means &ldquo;Bird&ldquo; in Arabic and &ldquo;a bird with open wings logo&rdquo; is minutely engraved on most finished Asfour Products.</p>\r\n<p><strong><img src="images/c21.jpg" alt="/" width="216" height="179" /></strong></p>\r\n<p><br /> The devotion to excellence and love of perfection has helped Asfour Crystal grow from 200 to 5,000 of the most skilled workers in the industry. Asfour is one of the largest crystal manufacturing companies in the world, creating what we believe are the best crystal creations anywhere!</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong>&nbsp;</strong></p>', 0, '36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 101, 1, '2015-03-20', '2013-05-28', 1, 1, 0, '', '51a504e57bd92.jpg', 'Crystal-Asfour', '', '', '', 0, '', ''),
(179, 'Hurghada', '', '<p><strong><img src="images/c39.jpg" alt="/" /></strong></p>\r\n<p><strong>&nbsp;</strong>The city was founded in the early 20th century, and since the 1980s has been continually enlarged by Egyptian and foreign investors to become the leading seashore resort on the Red Sea. Holiday villages and hotels provide aquatic sport facilities for sailboarders, yachtsmen, scuba divers and snorklers.</p>\r\n<p>Hurghada stretches for about 40 km along the seashore, and it does not reach far into the surrounding desert. The resort is a destination for Egyptian tourists from Cairo, the Delta and Upper Egypt, as well as package holiday tourists from Europe, notably Russians, Czechs and Germans. Until a few years ago it was a small fishing village. Today Hurghada counts 40,000 inhabitants and is divided into three parts: Downtown (El Dahar) is the old part; Sekalla is the modern part, and El Korra Road is the most modern part. Sakkala is the relatively modest hotel quarter. Dahar is where the town largest bazaar, the post office and the long-distance bus station are situated.</p>\r\n<p><strong><img src="images/c38.jpg" alt="/" /></strong></p>\r\n<p>The city is served by the Hurghada International Airport with scheduled passenger traffic to and from Cairo and direct connections with several cities in Europe. The airport has undergone massive renovations to accommodate rising traffic. Hurghada is known for its watersports activities, nightlife and warm weather. Daily high temperature hovers round 30 degrees Celsius most of the year.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong>&nbsp;</strong></p>', 0, '37', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 102, 0, '2015-03-11', '2013-05-28', 1, 10, 0, '', '51a5054081ff7.jpg', 'Hurghada', '', '', '', 0, '', ''),
(180, 'Ain Sokhna', '', '<p><strong><img src="images/c36.jpg" alt="/" /></strong></p>\r\n<p><strong>&nbsp;</strong>Ain Sukhna, the Arabic for hot spring, was named after the nearby sulfur springs. The springs originate at Gebel Ataka, the northern most mountain in the Eastern Desert.&nbsp; Close enough to Cairo for a day-trip, this popular weekend resort has fine beaches, coral reefs, fishing and water sports. It is located about 55 kilometers (34 miles) south of Suez, and is the nearest bathing resort to Cairo. Some hotels in Ain Sukhna are the best on the Red Sea.</p>\r\n<p><strong>&nbsp;</strong></p>', 0, '37', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 103, 0, '2015-03-11', '2013-05-28', 1, 7, 0, '', '51a505a6ba493.jpg', 'Ain-Sokhna', '', '', '', 0, '', ''),
(181, 'Luxor', '', '<p><strong><img src="images/c35.jpg" alt="/" /></strong></p>\r\n<p>Luxor is unique among the world cities, originally built on the site of ancient Thebes over 4,000 years it is home to some of the most spectacular ancient sites in the world. Wherever you go, you cant afford to miss a thing. You will experience the past and the present, with a wealth of history and culture that spans centuries. There is hardly anywhere in the city that does not have a relic, offering you an impressive representation of the splendour of the ancient Egyptians several thousand years ago</p>\r\n<p><strong>&nbsp;</strong></p>', 0, '', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 104, 0, '0000-00-00', '2013-05-28', 1, 0, 0, '', '51a505d5dc610.jpg', 'Luxor', '', '', '', 0, '', ''),
(182, 'Aswan', '', '<p><strong><img src="images/c33.jpg" alt="/" /></strong></p>\r\n<p><strong>&nbsp;</strong><strong>&nbsp;</strong>Egypt southernmost city and one of her most beautiful&nbsp;Aswan is larger but much quieter than Luxor, it is Egypt&nbsp; southernmost city and one of her most beautiful, sitting alongside some of the best stretches of the Nile -- wide, green and dotted with pretty islands, with high desert hills topped with the Aga Khan Mausoleum as a dramatic backdrop</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong><img src="images/c34.jpg" alt="/" /></strong></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', 0, '37', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 105, 0, '2015-03-11', '2013-05-28', 1, 8, 0, '', '51a5064e60ea5.jpg', 'Aswan', '', '', '', 0, '', ''),
(183, 'AL-Azhar Park & Old Cairo', '<p>Al-Azhar Park is a major park in Cairo Darb al-Ahmar neighborhood in Egypt. It was inaugurated in May 2005. Among several honors, this park is listed as one of the world sixty great public spaces by Project for Public Spaces (PPS).[1] The Park was created by the Historic Cities Support Programme</p>', '<table class="mytable">\r\n<tbody>\r\n<tr>\r\n<td class="on">Entrance fee</td>\r\n<td class="on">5 LE</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Visiting Hours</td>\r\n<td class="tw">10 am - 10 pm</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Traveling time</td>\r\n<td class="on">15 mins</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><strong><img src="images/c26.jpg" alt="/" width="400" height="313" /></strong></p>\r\n<p>Al-Azhar Park is a major park in Cairo&nbsp; Darb al-Ahmar neighborhood in Egypt. It was inaugurated in May 2005.</p>\r\n<p>Among several honors, this park is listed as one of the world&nbsp; sixty great public spaces by Project for Public Spaces (PPS).<sup>[1]</sup> The Park was created by the Historic Cities Support Programme (HCSP) of the Aga Khan Trust for Culture (AKTC), an entity of the Aga Khan Development Network (AKDN). The park, developed at a cost in excess of USD $30 million, was a gift to Cairo from His Highness the Aga Khan. It is interesting to note that the city of Cairo was founded in the year 969 by the Fatimid Imam-Caliphs who were ancestors of the Aga Khan.</p>\r\n<p>The park project was not only the development of the park, but also included aspects of archeology (12th century Ayyubid wall), historic building rehabilitation (14th Century Umm Sultan Shaban Mosque, the 13th century Khayrbek complex, and the Darb Shoughlan School) and several quality of life improvement initiatives. Those initiatives included skills training, area rehabilitation, microfinance, and support in the areas of health and education among others.</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong><span>Old Cairo</span></strong></p>\r\n<p>&nbsp;</p>\r\n<p>Old Cairo is really compact, and you can with ease cover a great collection of important Cairo sights in half a day.The part of <strong>Cairo</strong> that contains</p>', 0, '36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 106, 1, '2015-04-02', '2013-05-28', 1, 4, 0, '', '51a5067d47d61.jpg', 'AL-Azhar-Park-Old-Cairo', '', '', '', 0, '', ''),
(184, 'Citadel', '<p>One of Cairo most popular tourist attractions is the Citadel, located on a spur of limestone that had been detached from its parent Moqattam Hills by quarrying. The Citadel is one of the world greatest monuments to medieval warfare,</p>', '<table class="mytable">\r\n<tbody>\r\n<tr>\r\n<td class="on">Entrance fee</td>\r\n<td class="on">50 LE</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Visiting Hours</td>\r\n<td class="tw">9 am to 4 pm</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Traveling time</td>\r\n<td class="on">20 mins</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><strong><img src="images/c23.jpg" alt="/" /></strong></p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p>One of Cairo most popular tourist attractions is the Citadel, located on a spur of limestone that had been detached from its parent Moqattam Hills by quarrying. The Citadel is one of the world greatest monuments to medieval warfare, as well as a highly visible landmark on Cairo&nbsp; eastern skyline.&nbsp;Particularly when viewed from the back side (from the north), the Citadel reveals a very medieval character.</p>\r\n<p><strong>&nbsp;</strong></p>', 0, '36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 107, 1, '2015-03-20', '2013-05-28', 1, 2, 0, '', '51a5069872162.jpg', 'Citadel', '', '', '', 0, '', ''),
(185, 'Giza Pyramids', '<p>You won t want to miss one of Egypt s top attractions, the last surviving member of the Seven Wonders of the World, the Great Pyramid of Giza. There are in fact three main pyramids in Giza; the Great Pyramid of Khufu (or Cheops), The Pyramid of Kafhre and the smaller Pyramid of Menkaura.</p>', '<table class="mytable">\r\n<tbody>\r\n<tr>\r\n<td class="on">Entrance fee</td>\r\n<td class="on">60 LE</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Visiting Hours</td>\r\n<td class="tw">9am &ndash; 3:30 pm</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Traveling time</td>\r\n<td class="on">45 min</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><strong><img src="images/c12.jpg" alt="/" /></strong></p>\r\n<p>&nbsp;</p>\r\n<p>You won t want to miss one of Egypt s top attractions, the last surviving member of the Seven Wonders of the World, the Great Pyramid of Giza. There are in fact three main pyramids in Giza; the Great Pyramid of Khufu (or Cheops), The Pyramid of Kafhre and the smaller Pyramid of Menkaura. Each Pyramid is a tomb to a different King of Egypt. In front of the pyramids lies the Sphinx, or Abu al-Hol in Arabic, Father of Terror. Carved out of a single block of stone, this enormous cat-like sculpture has mesmerized millions of visitors.</p>\r\n<p><strong><img src="images/c14.jpg" alt="/" /></strong></p>\r\n<p>Gizas three pyramids and the Sphinx were thought to have been constructed in the fourth dynasty of Egypt&nbsp; Old Kingdom, arguably the first great civilization on earth. For most of us that translates in to about 5000 years ago. Even though there is still debate about how the pyramids at Giza were built, most are in agreement it wasn t by aliens . It is believed about 20,000 laborers were used and approximately 2 million blocks of stone, each weighing 2.5 tons, just to build the Pyramid of Khufu.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong><span>Sound and light show at Giza</span></strong></p>\r\n<p><strong><img src="images/c37.jpg" alt="/" /></strong></p>\r\n<p>Have you ever wondered what life must have been like thousands of years ago? These thoughts of curiosity has inspired artists to take you there, for a brief period, through the creation of sound &amp; light shows. You can get a glimpse back in time to see, feel, and imagine how it was when the powerful ancient Egyptians ruled. The artists have masterfully created a spectacle show that draws you in as part of history.</p>\r\n<p><strong>&nbsp;</strong></p>', 0, '36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 108, 1, '2015-03-24', '2013-05-28', 1, 1, 0, '', '51a507037d9e9.jpg', 'Giza-Pyramids', '', '', '', 0, '', ''),
(186, 'Nile Cruise', '<p>Nile Cruises...the very words conjure up images of mystery, enchantment and unforgettable experiences of one of the most ancient civilisations. One of the best ways to do this is aboard a Nile dinner cruiser.</p>', '<table class="mytable">\r\n<tbody>\r\n<tr>\r\n<td class="on">Entrance fee</td>\r\n<td class="on">180 LE (For bookings contact Zuwwar Office)</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Visiting Hours</td>\r\n<td class="tw">Evenings after sunset</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Traveling time</td>\r\n<td class="on">45 mins</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><strong><img class="form_pic" src="uploads/guide_nilecruise.jpg" alt="/" /><br /></strong></p>\r\n<p>Nile Cruises...the very words conjure up images of mystery, enchantment and unforgettable experiences of one of the most ancient&nbsp;civilisations. One of the best ways to do this is aboard a Nile dinner cruiser. Some of these boats are, in fact, converted Nile passenger ships, which stay out usually for several hours and include good food, fine entertainment, and a romantic evening gazing at the lights along the the banks. Really, this is one form of entertainment that should not be missed on a visit to Egypt.</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p>&nbsp;</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong>&nbsp;</strong></p>', 0, '36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 109, 1, '2015-04-01', '2013-05-28', 1, 4, 0, '', '51a5072ff09f6.jpg', 'Nile-Cruise', '', '', '', 0, '', ''),
(187, '', '', '', 0, '', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 0, 0, '0000-00-00', '0000-00-00', 0, 36, 0, '', '', '', '', '', '', 0, '', ''),
(188, 'Khan Al Khalili', '<p>Khan el-Khalili is for many the most entertaining part of Cairo. It is an ancient shopping area, nothing less, but some of the shops have also their own little factories or workshops.</p>', '<p><strong><img src="images/c10.jpg" alt="/" /></strong>Khan el-Khalili is for many the most entertaining part of Cairo. It is an ancient shopping area, nothing less, but some of the shops have also their own little factories or workshops.</p>\r\n<p>The suq (which is the Arabic name for bazaar, or market) dates back to 1382, when Emir Djaharks el-Khalili built a big caravanserai (or khan) right here. A caravanserai was a sort of hotel for traders, and usually the focal point for economic activity for any surrounding area. This caravanserai is still there, you just ask for the narrow street of Sikka Khan el-Khalili and Badestan.</p>\r\n<p>Khan Khalili Bazaar, it stays open till late, and&nbsp; is a very interesting area for monuments as well as shopping.</p>', 0, '36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 111, 1, '2015-03-20', '2013-05-28', 1, 15, 0, '', '51a507eedcf22.jpg', 'Khan-Al-Khalili', '', '', '', 0, '', ''),
(189, 'Sharm al Sheikh', '', '<p><a href="../uploads/c31.jpg"><img src="uploads/c31.jpg" alt="/" /></a></p>\r\n<p><strong><span>&nbsp;</span></strong>The simplicity of sun, sea and sand. The luxury of five-star hotels, water sports, shopping and entertainment. This is Sharm el-Sheikh, one of the most accessible and developed tourist resort communities on the Sinai peninsula. All around are Bedouins, colorful tents, mountains and sea. There are small, intimate hotels with modern designs, as well as larger hotel complexes belonging to International chains, plus about all the amenities one could expect of a tourist center, including casinos, discos and nightclubs, golf courses and health facilities. In fact, with diving and snorkeling, windsurfing and other water sports, horses and camel riding, desert safaris, and great nearby antiquities attractions, it is almost impossible for a visitor to ever suffer from bored</p>\r\n<p><strong>&nbsp;</strong></p>', 0, '37', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 112, 0, '2015-03-11', '2013-05-28', 1, 34, 0, '', '51a5095b6857d.jpg', 'Sharm-al-Sheikh', '', '', '', 0, '', ''),
(190, 'Special Extra Night Lawazim', '<p>This is the intro for special extra night lawazim</p>', '<p>this is the description for special extra night lawazim</p>', 0, ',38', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 113, 0, '2015-03-25', '2013-05-28', 1, 4, 0, '', '', 'Special-Extra-Night-Lawazim', '', '', '', 0, '', ''),
(191, 'Standard Package', '<p>Standard package intro Standard package intro Standard package intro Standard package intro</p>', '<p>STANDARD PACKAGE DESCRIPTION</p>', 0, ',38', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 114, 0, '2015-03-25', '2013-05-28', 0, 1, 0, '', '', 'Standard-Package', '', '', '', 0, '', ''),
(192, 'Luxor', '', '<p><strong><img src="images/c35.jpg" alt="/" /></strong></p>\r\n<p>Luxor is unique among the world cities, originally built on the site of ancient Thebes over 4,000 years it is home to some of the most spectacular ancient sites in the world. Wherever you go, you cant afford to miss a thing. You will experience the past and the present, with a wealth of history and culture that spans centuries. There is hardly anywhere in the city that does not have a relic, offering you an impressive representation of the splendour of the ancient Egyptians several thousand years ago</p>\r\n<p><strong>&nbsp;</strong></p>', 0, '', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 104, 0, '0000-00-00', '2013-05-28', 1, 0, 0, '', '51a505d5dc610.jpg', 'Luxor', '', '', '', 0, '', ''),
(193, 'Ain Sokhna', '', '<p><strong><img src="images/c36.jpg" alt="/" /></strong></p>\r\n<p><strong>&nbsp;</strong>Ain Sukhna, the Arabic for hot spring, was named after the nearby sulfur springs. The springs originate at Gebel Ataka, the northern most mountain in the Eastern Desert.&nbsp; Close enough to Cairo for a day-trip, this popular weekend resort has fine beaches, coral reefs, fishing and water sports. It is located about 55 kilometers (34 miles) south of Suez, and is the nearest bathing resort to Cairo. Some hotels in Ain Sukhna are the best on the Red Sea.</p>\r\n<p><strong>&nbsp;</strong></p>', 0, '37', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 103, 0, '0000-00-00', '2013-05-28', 1, 0, 0, '', '51a505a6ba493.jpg', 'Ain-Sokhna', '', '', '', 0, '', ''),
(194, 'Hurghada', '', '<p><strong><img src="images/c39.jpg" alt="/" /></strong></p>\r\n<p><strong>&nbsp;</strong>The city was founded in the early 20th century, and since the 1980s has been continually enlarged by Egyptian and foreign investors to become the leading seashore resort on the Red Sea. Holiday villages and hotels provide aquatic sport facilities for sailboarders, yachtsmen, scuba divers and snorklers.</p>\r\n<p>Hurghada stretches for about 40 km along the seashore, and it does not reach far into the surrounding desert. The resort is a destination for Egyptian tourists from Cairo, the Delta and Upper Egypt, as well as package holiday tourists from Europe, notably Russians, Czechs and Germans. Until a few years ago it was a small fishing village. Today Hurghada counts 40,000 inhabitants and is divided into three parts: Downtown (El Dahar) is the old part; Sekalla is the modern part, and El Korra Road is the most modern part. Sakkala is the relatively modest hotel quarter. Dahar is where the town largest bazaar, the post office and the long-distance bus station are situated.</p>\r\n<p><strong><img src="images/c38.jpg" alt="/" /></strong></p>\r\n<p>The city is served by the Hurghada International Airport with scheduled passenger traffic to and from Cairo and direct connections with several cities in Europe. The airport has undergone massive renovations to accommodate rising traffic. Hurghada is known for its watersports activities, nightlife and warm weather. Daily high temperature hovers round 30 degrees Celsius most of the year.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong>&nbsp;</strong></p>', 0, '37', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 102, 0, '0000-00-00', '2013-05-28', 1, 0, 0, '', '51a5054081ff7.jpg', 'Hurghada', '', '', '', 0, '', ''),
(195, 'Crystal Asfour', '<p>The Asfour Crystal Egypt is an enchanting blend of Ancient Egyptian craftsmanship and the most sophisticated modern technology. The Ancient Egyptians created glass 5000 years ago, and Asfour Crystal is proud to continue that heritage.</p>', '<table class="mytable">\r\n<tbody>\r\n<tr>\r\n<td class="on">Entrance fee</td>\r\n<td class="on">nil</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Visiting Hours</td>\r\n<td class="tw">8 am &ndash; 8 pm</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Traveling time</td>\r\n<td class="on">45 min</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><strong><img src="images/c22.jpg" alt="/" /></strong></p>\r\n<p>&nbsp;</p>\r\n<p>The <strong>Asfour Crystal</strong> Egypt is an enchanting blend of Ancient Egyptian craftsmanship and the most sophisticated modern technology. The Ancient Egyptians created glass 5000 years ago, and Asfour Crystal is proud to continue that heritage. The Asfour family has been creating these unique <strong>crystal figurines</strong> in their modern factory since 1961. Modern technology and the unique skills of Asfour s Egyptian artisans combine to create elegant crystal figurines and laser-cut crystal collectibles made with 30% sparkling lead crystal. Asfour Crystal is the 21st century technology answer to the original Pharonic glass bead invention, where glass beads had more value than natural precious stones. Asfour means &ldquo;Bird&ldquo; in Arabic and &ldquo;a bird with open wings logo&rdquo; is minutely engraved on most finished Asfour Products.</p>\r\n<p><strong><img src="images/c21.jpg" alt="/" width="216" height="179" /></strong></p>\r\n<p><br /> The devotion to excellence and love of perfection has helped Asfour Crystal grow from 200 to 5,000 of the most skilled workers in the industry. Asfour is one of the largest crystal manufacturing companies in the world, creating what we believe are the best crystal creations anywhere!</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong>&nbsp;</strong></p>', 0, '36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 101, 1, '2015-03-20', '2013-05-28', 1, 1, 0, '', '51a504e57bd92.jpg', 'Crystal-Asfour', '', '', '', 0, '', ''),
(196, 'Magic Land', '<p>Magicland-Amusement park for family entertainment Entertaining dolphin show for kids and many more</p>', '<p><img src="uploads/c15.jpg" alt="width=283" height="174" /> Magicland-Amusement park for family entertainment Entertaining dolphin show for kids and many more</p>', 0, '36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 100, 1, '2015-03-20', '2013-05-28', 1, 0, 0, '', '51a504b115839.jpg', 'Magic-Land', '', '', '', 0, '', '');
INSERT INTO `com_content_article` (`id`, `title`, `des`, `artbody`, `hits`, `cat_id`, `start_date`, `end_date`, `gal_id`, `date`, `author`, `order`, `delete`, `modified`, `created`, `enabled`, `hit`, `imagegallery`, `tags`, `th_image`, `alias`, `description`, `keywords`, `header`, `vediogallery`, `intro`, `ex_link`) VALUES
(197, 'Pharaonic Village', '<p>Imagine going to a place a few miles from the center of Cairo where Egypt entire history and art comes alive! Such a place exists in the Pharaonic Village, on Jacob Island in the Nile. The village is surrounded by trees which hide the bustle of the crowded city and provides the background for an ancient Egyptian village.</p>', '<table class="mytable">\r\n<tbody>\r\n<tr>\r\n<td class="on">Entrance fee</td>\r\n<td class="on">100 LE</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Visiting Hours</td>\r\n<td class="tw">10 am &ndash; 7 pm</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Traveling time</td>\r\n<td class="on">45 min</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><a href="../uploads/c990.jpg"><img src="uploads/c990.jpg" alt="width=300" height="197" /></a></p>\r\n<p><strong><span>&nbsp;</span></strong></p>\r\n<p>&nbsp;Imagine going to a place a few miles from the center of Cairo where Egypt entire <em>history and art</em> comes alive! Such a place exists in the Pharaonic Village, on Jacob Island in the Nile. The village is surrounded by trees which hide the bustle of the crowded city and provides the background for an ancient Egyptian village. In the village, you are transported by floating amphitheaters through a series of canals where the ancient Egyptian arts and crafts are brought to life by an incredible group of actors and actresses.</p>\r\n<p>The village began as papyrus plantation, and was thus transformed into a living museum. Scenes that you will see include the scene of Moses as a baby in the marches, agricultural life, boat-building, house - building, pottery, glass making, making of statues and alabaster, perfume making, manufacture of papyrus - and the making of beer &amp; wine.</p>\r\n<p>&nbsp; <strong>I</strong>n addition, the village contains a complete replica of the tomb of Tutankhamun - exactly as Howard Carter discovered it in November, 1922. (This is the only place in the world where the entire tomb &amp; its treasures can be seen). The village also contains 10 other museums - Four related to the Pharaonic period</p>\r\n<p>&nbsp;The village is located in the Nile, on Jacob island, about six miles from the center of Cairo, and not far from most of the hotels. The village is open from 9am to 6pm daily. In the summer months it remains open until 9pm. A guided tour of the village can last from one to three and half hours depending on what you wish to visit.</p>', 0, '36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 99, 1, '2015-03-20', '2013-05-28', 1, 0, 0, '', '51a50445b6caf.jpg', 'Pharaonic-Village', '', '', '', 0, '', ''),
(198, 'Alexandria', '', '<p><img class="form_pic" src="uploads/The_Roman_Theatre_in_Alexandria.JPG" alt="/" /></p>\r\n<p>&nbsp;</p>\r\n<p>Alexandria was founded by&nbsp;Alexander the Great&nbsp;in April 331 BC as&nbsp;<span lang="grc" xml:lang="grc">?&lambda;&epsilon;&xi;?&nu;&delta;&rho;&epsilon;&iota;&alpha;</span>&nbsp;(<em>Alex&aacute;ndreia</em>). Alexander chief architect&nbsp;for the project was&nbsp;Dinocrates. Alexandria was intended to supersede&nbsp;Naucratis&nbsp;as a&nbsp;Hellenistic&nbsp;centre in Egypt, and to be the link between Greece and the rich&nbsp;Nile Valley. An Egyptian city,&nbsp;Rhakotis, already existed on the shore, and later gave its name to Alexandria in the&nbsp;Egyptian language&nbsp;(Egypt.&nbsp;<em>Ra qedyet</em>). It continued to exist as the Egyptian quarter of the city. A few months after the foundation, Alexander left Egypt for the East and never returned to his city. After Alexander departed, his viceroy,&nbsp;Cleomenes, continued the expansion. Following a struggle with the other successors of Alexander, his general&nbsp;Ptolemy&nbsp;succeeded in bringing Alexander body to Alexandria.</p>\r\n<p>Although Cleomenes was mainly in charge of seeing to Alexandria continuous development, the&nbsp;<em>Heptastadion</em>&nbsp;and the mainland quarters seem to have been primarily Ptolemaic work. Inheriting the trade of ruined&nbsp;Tyre&nbsp;and becoming the centre of the new commerce between Europe and the&nbsp;Arabian&nbsp;and Indian East, the city grew in less than a generation to be larger than&nbsp;Carthage. In a century, Alexandria had become the largest city in the world and for some centuries more, was second only to Rome. It became the main Greek city of Egypt, with an extraordinary mix of&nbsp;Greeks&nbsp;from many cities and backgrounds.</p>', 0, '37', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 98, 0, '0000-00-00', '2013-05-28', 1, 0, 0, '', '51a503e103fb3.JPG', 'Alexandria', '', '', '', 0, '', ''),
(199, 'Nile Boating', '<p>Taking a Felucca down the Nile is something you must do when visiting Egypt. Feluccas are sail boats that have been used on the Nile since antiquity. You can take short sunset sails in Cairo or you can opt for longer cruises which usually depart from Aswan. A Felucca ride is ideal to enjoy the cook breeze of the nile.</p>', '<table class="mytable">\r\n<tbody>\r\n<tr>\r\n<td class="on">Entrance fee</td>\r\n<td class="on">150 LE / Boat</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Visiting Hours</td>\r\n<td class="tw">Open throughout the day</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Traveling time</td>\r\n<td class="on">30 mins</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><img class="form_pic" src="uploads/901_Felucca.JPG" alt="/" />Taking a Felucca down the Nile is something you must do when visiting Egypt. Feluccas are sail boats that have been used on the Nile since antiquity. You can take short sunset sails in Cairo or you can opt for longer cruises which usually depart from Aswan. A Felucca ride is ideal to enjoy the cook breeze of the nile.</p>', 0, '36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 97, 1, '2015-03-20', '2013-05-28', 1, 1, 0, '', '51a503a1d9569.JPG', 'Nile-Boating', '', '', '', 0, '', ''),
(200, 'Egyptian Museum', '<p>The Museum of Egyptian Antiquities, known commonly as the Egyptian Museum, is home to the most extensive collection of ancient Egyptian antiquities in the world. It has 136,000 items on display, with many more hundreds of thousands in its basement storerooms.</p>', '<p><img class="form_pic" src="uploads/images/Egypt_Cairo_EgyptianMuseum_01.jpg" alt="width=269" height="359" />The Museum of Egyptian Antiquities, known commonly as the Egyptian Museum, is home to the most extensive collection of ancient Egyptian antiquities in the world. It has 136,000 items on display, with many more hundreds of thousands in its basement storerooms.</p>\r\n<p>The Royal Mummy Room, containing 27 royal mummies from pharaonic times, was closed down on the orders of President Anwar Sadat in 1981. It was reopened, with a slightly curtailed display of New Kingdom kings and queens, in 1985.</p>\r\n<p>&nbsp;</p>\r\n<p><img src="uploads/images/image.jpg" alt="width=394" height="300" /></p>', 0, '36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 96, 1, '2015-03-20', '2013-05-28', 1, 9, 0, '', '51a50366b7c71.jpg', 'Egyptian-Museum', '', '', '', 0, '', ''),
(201, 'Islamic Museum', '<p>Khan el-Khalili is for many the most entertaining part of Cairo. It is an ancient shopping area, nothing less, but some of the shops have also their own little factories or workshops.</p>', '<table class="mytable">\r\n<tbody>\r\n<tr>\r\n<td class="on">Entrance fee</td>\r\n<td class="on">50 LE</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Visiting Hours</td>\r\n<td class="tw">Sat.-Thurs. 9-4, Fri. 9-11 and 2-4.</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Traveling time</td>\r\n<td class="on">15 mins</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><img src="uploads/cairo36.jpg" alt="width=270" height="197" />&nbsp;</p>\r\n<p>The Museum of Islamic Art is considered one of the greatest in the world with its exceptional collection of rare woodwork and plaster, as well as metal, ceramic, glass, crystal, and textile objects of all periods, from all over the Islamic world. It houses more than 102,000 objects.&nbsp;</p>\r\n<p><br /><strong>Hall No 4</strong><br />The Fatimid Style, 3rd Islamic style, originated and developed in Egypt and Syria ( 969-1171 A.D.). On display a selection of ceramic objects decorated in luster glass according to the same technique, and rock crystals. A unique collection of Fatimid textiles rare in technique and decorations. The Fatimid woodworks richly decorated in sunk carved arabesque as well as molded and hammered metalwork are beautifully exhibited.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p><img src="uploads/islamicmuseum.jpg" alt="width=270" /></p>', 0, '36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 95, 1, '2015-03-20', '2013-05-28', 1, 0, 0, '', '51a5027fe7939.jpg', 'Islamic-Museum', '', '', '', 0, '', ''),
(202, 'Standard Package', '<p>Standard package intro Standard package intro Standard package intro Standard package intro</p>', '<p>STANDARD PACKAGE DESCRIPTION</p>', 0, ',38', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 114, 0, '2015-03-25', '2013-05-28', 0, 1, 0, '', '', 'Standard-Package', '', '', '', 0, '', ''),
(203, 'Special Extra Night Lawazim', '<p>This is the intro for special extra night lawazim</p>', '<p>this is the description for special extra night lawazim</p>', 0, ',38', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 113, 0, '2015-03-25', '2013-05-28', 1, 4, 0, '', '', 'Special-Extra-Night-Lawazim', '', '', '', 0, '', ''),
(204, 'Sharm al Sheikh', '', '<p><a href="../uploads/c31.jpg"><img src="uploads/c31.jpg" alt="/" /></a></p>\r\n<p><strong><span>&nbsp;</span></strong>The simplicity of sun, sea and sand. The luxury of five-star hotels, water sports, shopping and entertainment. This is Sharm el-Sheikh, one of the most accessible and developed tourist resort communities on the Sinai peninsula. All around are Bedouins, colorful tents, mountains and sea. There are small, intimate hotels with modern designs, as well as larger hotel complexes belonging to International chains, plus about all the amenities one could expect of a tourist center, including casinos, discos and nightclubs, golf courses and health facilities. In fact, with diving and snorkeling, windsurfing and other water sports, horses and camel riding, desert safaris, and great nearby antiquities attractions, it is almost impossible for a visitor to ever suffer from bored</p>\r\n<p><strong>&nbsp;</strong></p>', 0, '37', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 112, 0, '0000-00-00', '2013-05-28', 1, 24, 0, '', '51a5095b6857d.jpg', 'Sharm-al-Sheikh', '', '', '', 0, '', ''),
(205, 'Khan Al Khalili', '<p>Khan el-Khalili is for many the most entertaining part of Cairo. It is an ancient shopping area, nothing less, but some of the shops have also their own little factories or workshops.</p>', '<p><strong><img src="images/c10.jpg" alt="/" /></strong>Khan el-Khalili is for many the most entertaining part of Cairo. It is an ancient shopping area, nothing less, but some of the shops have also their own little factories or workshops.</p>\r\n<p>The suq (which is the Arabic name for bazaar, or market) dates back to 1382, when Emir Djaharks el-Khalili built a big caravanserai (or khan) right here. A caravanserai was a sort of hotel for traders, and usually the focal point for economic activity for any surrounding area. This caravanserai is still there, you just ask for the narrow street of Sikka Khan el-Khalili and Badestan.</p>\r\n<p>Khan Khalili Bazaar, it stays open till late, and&nbsp; is a very interesting area for monuments as well as shopping.</p>', 0, '36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 111, 1, '2015-03-20', '2013-05-28', 1, 15, 0, '', '51a507eedcf22.jpg', 'Khan-Al-Khalili', '', '', '', 0, '', ''),
(206, '', '', '', 0, '', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 0, 0, '0000-00-00', '0000-00-00', 0, 36, 0, '', '', '', '', '', '', 0, '', ''),
(207, 'Nile Cruise', '<p>Nile Cruises...the very words conjure up images of mystery, enchantment and unforgettable experiences of one of the most ancient civilisations. One of the best ways to do this is aboard a Nile dinner cruiser.</p>', '<table class="mytable">\r\n<tbody>\r\n<tr>\r\n<td class="on">Entrance fee</td>\r\n<td class="on">180 LE (For bookings contact Zuwwar Office)</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Visiting Hours</td>\r\n<td class="tw">Evenings after sunset</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Traveling time</td>\r\n<td class="on">45 mins</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><strong><img class="form_pic" src="uploads/guide_nilecruise.jpg" alt="/" /><br /></strong></p>\r\n<p>Nile Cruises...the very words conjure up images of mystery, enchantment and unforgettable experiences of one of the most ancient&nbsp;civilisations. One of the best ways to do this is aboard a Nile dinner cruiser. Some of these boats are, in fact, converted Nile passenger ships, which stay out usually for several hours and include good food, fine entertainment, and a romantic evening gazing at the lights along the the banks. Really, this is one form of entertainment that should not be missed on a visit to Egypt.</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p>&nbsp;</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong>&nbsp;</strong></p>', 0, '36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 109, 1, '2015-03-20', '2013-05-28', 1, 0, 0, '', '51a5072ff09f6.jpg', 'Nile-Cruise', '', '', '', 0, '', ''),
(208, 'Giza Pyramids', '<p>You won t want to miss one of Egypt s top attractions, the last surviving member of the Seven Wonders of the World, the Great Pyramid of Giza. There are in fact three main pyramids in Giza; the Great Pyramid of Khufu (or Cheops), The Pyramid of Kafhre and the smaller Pyramid of Menkaura.</p>', '<table class="mytable">\r\n<tbody>\r\n<tr>\r\n<td class="on">Entrance fee</td>\r\n<td class="on">60 LE</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Visiting Hours</td>\r\n<td class="tw">9am &ndash; 3:30 pm</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Traveling time</td>\r\n<td class="on">45 min</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><strong><img src="images/c12.jpg" alt="/" /></strong></p>\r\n<p>&nbsp;</p>\r\n<p>You won t want to miss one of Egypt s top attractions, the last surviving member of the Seven Wonders of the World, the Great Pyramid of Giza. There are in fact three main pyramids in Giza; the Great Pyramid of Khufu (or Cheops), The Pyramid of Kafhre and the smaller Pyramid of Menkaura. Each Pyramid is a tomb to a different King of Egypt. In front of the pyramids lies the Sphinx, or Abu al-Hol in Arabic, Father of Terror. Carved out of a single block of stone, this enormous cat-like sculpture has mesmerized millions of visitors.</p>\r\n<p><strong><img src="images/c14.jpg" alt="/" /></strong></p>\r\n<p>Gizas three pyramids and the Sphinx were thought to have been constructed in the fourth dynasty of Egypt&nbsp; Old Kingdom, arguably the first great civilization on earth. For most of us that translates in to about 5000 years ago. Even though there is still debate about how the pyramids at Giza were built, most are in agreement it wasn t by aliens . It is believed about 20,000 laborers were used and approximately 2 million blocks of stone, each weighing 2.5 tons, just to build the Pyramid of Khufu.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong><span>Sound and light show at Giza</span></strong></p>\r\n<p><strong><img src="images/c37.jpg" alt="/" /></strong></p>\r\n<p>Have you ever wondered what life must have been like thousands of years ago? These thoughts of curiosity has inspired artists to take you there, for a brief period, through the creation of sound &amp; light shows. You can get a glimpse back in time to see, feel, and imagine how it was when the powerful ancient Egyptians ruled. The artists have masterfully created a spectacle show that draws you in as part of history.</p>\r\n<p><strong>&nbsp;</strong></p>', 0, '36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 108, 1, '2015-03-20', '2013-05-28', 1, 0, 0, '', '51a507037d9e9.jpg', 'Giza-Pyramids', '', '', '', 0, '', ''),
(209, 'Citadel', '<p>One of Cairo most popular tourist attractions is the Citadel, located on a spur of limestone that had been detached from its parent Moqattam Hills by quarrying. The Citadel is one of the world greatest monuments to medieval warfare,</p>', '<table class="mytable">\r\n<tbody>\r\n<tr>\r\n<td class="on">Entrance fee</td>\r\n<td class="on">50 LE</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Visiting Hours</td>\r\n<td class="tw">9 am to 4 pm</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Traveling time</td>\r\n<td class="on">20 mins</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><strong><img src="images/c23.jpg" alt="/" /></strong></p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p>One of Cairo most popular tourist attractions is the Citadel, located on a spur of limestone that had been detached from its parent Moqattam Hills by quarrying. The Citadel is one of the world greatest monuments to medieval warfare, as well as a highly visible landmark on Cairo&nbsp; eastern skyline.&nbsp;Particularly when viewed from the back side (from the north), the Citadel reveals a very medieval character.</p>\r\n<p><strong>&nbsp;</strong></p>', 0, '36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 107, 1, '2015-03-20', '2013-05-28', 1, 2, 0, '', '51a5069872162.jpg', 'Citadel', '', '', '', 0, '', ''),
(210, 'AL-Azhar Park & Old Cairo', '<p>Al-Azhar Park is a major park in Cairo Darb al-Ahmar neighborhood in Egypt. It was inaugurated in May 2005. Among several honors, this park is listed as one of the world sixty great public spaces by Project for Public Spaces (PPS).[1] The Park was created by the Historic Cities Support Programme</p>', '<table class="mytable">\r\n<tbody>\r\n<tr>\r\n<td class="on">Entrance fee</td>\r\n<td class="on">5 LE</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Visiting Hours</td>\r\n<td class="tw">10 am - 10 pm</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Traveling time</td>\r\n<td class="on">15 mins</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><strong><img src="images/c26.jpg" alt="/" width="400" height="313" /></strong></p>\r\n<p>Al-Azhar Park is a major park in Cairo&nbsp; Darb al-Ahmar neighborhood in Egypt. It was inaugurated in May 2005.</p>\r\n<p>Among several honors, this park is listed as one of the world&nbsp; sixty great public spaces by Project for Public Spaces (PPS).<sup>[1]</sup> The Park was created by the Historic Cities Support Programme (HCSP) of the Aga Khan Trust for Culture (AKTC), an entity of the Aga Khan Development Network (AKDN). The park, developed at a cost in excess of USD $30 million, was a gift to Cairo from His Highness the Aga Khan. It is interesting to note that the city of Cairo was founded in the year 969 by the Fatimid Imam-Caliphs who were ancestors of the Aga Khan.</p>\r\n<p>The park project was not only the development of the park, but also included aspects of archeology (12th century Ayyubid wall), historic building rehabilitation (14th Century Umm Sultan Shaban Mosque, the 13th century Khayrbek complex, and the Darb Shoughlan School) and several quality of life improvement initiatives. Those initiatives included skills training, area rehabilitation, microfinance, and support in the areas of health and education among others.</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong><span>Old Cairo</span></strong></p>\r\n<p>&nbsp;</p>\r\n<p>Old Cairo is really compact, and you can with ease cover a great collection of important Cairo sights in half a day.The part of <strong>Cairo</strong> that contains</p>', 0, '36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 106, 1, '2015-03-20', '2013-05-28', 1, 1, 0, '', '51a5067d47d61.jpg', 'AL-Azhar-Park-Old-Cairo', '', '', '', 0, '', ''),
(211, 'Aswan', '', '<p><strong><img src="images/c33.jpg" alt="/" /></strong></p>\r\n<p><strong>&nbsp;</strong><strong>&nbsp;</strong>Egypt southernmost city and one of her most beautiful&nbsp;Aswan is larger but much quieter than Luxor, it is Egypt&nbsp; southernmost city and one of her most beautiful, sitting alongside some of the best stretches of the Nile -- wide, green and dotted with pretty islands, with high desert hills topped with the Aga Khan Mausoleum as a dramatic backdrop</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong><img src="images/c34.jpg" alt="/" /></strong></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', 0, '37', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 105, 0, '0000-00-00', '2013-05-28', 1, 0, 0, '', '51a5064e60ea5.jpg', 'Aswan', '', '', '', 0, '', ''),
(212, 'Islamic Museum', '<p>Khan el-Khalili is for many the most entertaining part of Cairo. It is an ancient shopping area, nothing less, but some of the shops have also their own little factories or workshops.</p>', '<table class="mytable">\r\n<tbody>\r\n<tr>\r\n<td class="on">Entrance fee</td>\r\n<td class="on">50 LE</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Visiting Hours</td>\r\n<td class="tw">Sat.-Thurs. 9-4, Fri. 9-11 and 2-4.</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Traveling time</td>\r\n<td class="on">15 mins</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><img src="uploads/cairo36.jpg" alt="width=270" height="197" />&nbsp;</p>\r\n<p>The Museum of Islamic Art is considered one of the greatest in the world with its exceptional collection of rare woodwork and plaster, as well as metal, ceramic, glass, crystal, and textile objects of all periods, from all over the Islamic world. It houses more than 102,000 objects.&nbsp;</p>\r\n<p><br /><strong>Hall No 4</strong><br />The Fatimid Style, 3rd Islamic style, originated and developed in Egypt and Syria ( 969-1171 A.D.). On display a selection of ceramic objects decorated in luster glass according to the same technique, and rock crystals. A unique collection of Fatimid textiles rare in technique and decorations. The Fatimid woodworks richly decorated in sunk carved arabesque as well as molded and hammered metalwork are beautifully exhibited.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p><img src="uploads/islamicmuseum.jpg" alt="width=270" /></p>', 0, '36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 95, 0, '2013-05-29', '2013-05-28', 1, 0, 0, '', '51a5027fe7939.jpg', 'Islamic-Museum', '', '', '', 0, '', ''),
(213, 'Egyptian Museum', '<p>The Museum of Egyptian Antiquities, known commonly as the Egyptian Museum, is home to the most extensive collection of ancient Egyptian antiquities in the world. It has 136,000 items on display, with many more hundreds of thousands in its basement storerooms.</p>', '<table class="mytable">\r\n<tbody>\r\n<tr>\r\n<td class="on">Entrance fee</td>\r\n<td class="on">180 LE per adult</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Visiting Hours</td>\r\n<td class="tw">9 am &ndash; 5 pm</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Traveling time</td>\r\n<td class="on">30 min</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><img class="form_pic" src="uploads/Egypt_Cairo_EgyptianMuseum_01.jpg" alt="width=269" height="359" />The Museum of Egyptian Antiquities, known commonly as the Egyptian Museum, is home to the most extensive collection of ancient Egyptian antiquities in the world. It has 136,000 items on display, with many more hundreds of thousands in its basement storerooms.</p>\r\n<p>The Royal Mummy Room, containing 27 royal mummies from pharaonic times, was closed down on the orders of President Anwar Sadat in 1981. It was reopened, with a slightly curtailed display of New Kingdom kings and queens, in 1985.</p>\r\n<p>&nbsp;</p>\r\n<p><img src="uploads/image.jpg" alt="width=394" height="300" /></p>', 0, ',36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 96, 0, '2015-03-20', '2013-05-28', 1, 9, 0, '', 'EgyptianMuseum.jpg', 'Egyptian-Museum', '', '', '', 0, '', ''),
(214, 'Nile Boating', '<p>Taking a Felucca down the Nile is something you must do when visiting Egypt. Feluccas are sail boats that have been used on the Nile since antiquity. You can take short sunset sails in Cairo or you can opt for longer cruises which usually depart from Aswan. A Felucca ride is ideal to enjoy the cook breeze of the nile.</p>', '<table class="mytable">\r\n<tbody>\r\n<tr>\r\n<td class="on">Entrance fee</td>\r\n<td class="on">150 LE / Boat</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Visiting Hours</td>\r\n<td class="tw">Open throughout the day</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Traveling time</td>\r\n<td class="on">30 mins</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><img class="form_pic" src="uploads/901_Felucca.JPG" alt="/" />Taking a Felucca down the Nile is something you must do when visiting Egypt. Feluccas are sail boats that have been used on the Nile since antiquity. You can take short sunset sails in Cairo or you can opt for longer cruises which usually depart from Aswan. A Felucca ride is ideal to enjoy the cool breeze of the nile.</p>', 0, ',36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 97, 0, '2015-03-20', '2013-05-28', 1, 1, 0, '', 'nile-boating.JPG', 'Nile-Boating', '', '', '', 0, '', ''),
(215, 'Alexandria', '', '<p><img class="form_pic" src="uploads/The_Roman_Theatre_in_Alexandria.JPG" alt="/" /></p>\r\n<p>&nbsp;</p>\r\n<p>Alexandria was founded by&nbsp;Alexander the Great&nbsp;in April 331 BC as&nbsp;<span lang="grc" xml:lang="grc">?&lambda;&epsilon;&xi;?&nu;&delta;&rho;&epsilon;&iota;&alpha;</span>&nbsp;(<em>Alex&aacute;ndreia</em>). Alexander chief architect&nbsp;for the project was&nbsp;Dinocrates. Alexandria was intended to supersede&nbsp;Naucratis&nbsp;as a&nbsp;Hellenistic&nbsp;centre in Egypt, and to be the link between Greece and the rich&nbsp;Nile Valley. An Egyptian city,&nbsp;Rhakotis, already existed on the shore, and later gave its name to Alexandria in the&nbsp;Egyptian language&nbsp;(Egypt.&nbsp;<em>Ra qedyet</em>). It continued to exist as the Egyptian quarter of the city. A few months after the foundation, Alexander left Egypt for the East and never returned to his city. After Alexander departed, his viceroy,&nbsp;Cleomenes, continued the expansion. Following a struggle with the other successors of Alexander, his general&nbsp;Ptolemy&nbsp;succeeded in bringing Alexander body to Alexandria.</p>\r\n<p>Although Cleomenes was mainly in charge of seeing to Alexandria continuous development, the&nbsp;<em>Heptastadion</em>&nbsp;and the mainland quarters seem to have been primarily Ptolemaic work. Inheriting the trade of ruined&nbsp;Tyre&nbsp;and becoming the centre of the new commerce between Europe and the&nbsp;Arabian&nbsp;and Indian East, the city grew in less than a generation to be larger than&nbsp;Carthage. In a century, Alexandria had become the largest city in the world and for some centuries more, was second only to Rome. It became the main Greek city of Egypt, with an extraordinary mix of&nbsp;Greeks&nbsp;from many cities and backgrounds.</p>', 0, '37', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 98, 0, '0000-00-00', '2013-05-28', 1, 0, 0, '', '51a503e103fb3.JPG', 'Alexandria', '', '', '', 0, '', ''),
(216, 'Pharaonic Village', '<p>Imagine going to a place a few miles from the center of Cairo where Egypt entire history and art comes alive! Such a place exists in the Pharaonic Village, on Jacob Island in the Nile. The village is surrounded by trees which hide the bustle of the crowded city and provides the background for an ancient Egyptian village.</p>', '<table class="mytable">\r\n<tbody>\r\n<tr>\r\n<td class="on">Entrance fee</td>\r\n<td class="on">100 LE per adult</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Visiting Hours</td>\r\n<td class="tw">10 am &ndash; 7 pm</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Traveling time</td>\r\n<td class="on">45 min</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><a href="../uploads/c990.jpg"><img src="uploads/c990.jpg" alt="width=300" height="197" /></a></p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p>&nbsp;Imagine going to a place a few miles from the center of Cairo where Egypt entire <em>history and art</em> comes alive! Such a place exists in the Pharaonic Village, on Jacob Island in the Nile. The village is surrounded by trees which hide the bustle of the crowded city and provides the background for an ancient Egyptian village. In the village, you are transported by floating amphitheaters through a series of canals where the ancient Egyptian arts and crafts are brought to life by an incredible group of actors and actresses.</p>\r\n<p>The village began as papyrus plantation, and was thus transformed into a living museum. Scenes that you will see include the scene of Moses as a baby in the marches, agricultural life, boat-building, house - building, pottery, glass making, making of statues and alabaster, perfume making, manufacture of papyrus - and the making of beer &amp; wine.</p>\r\n<p>&nbsp; <strong>I</strong>n addition, the village contains a complete replica of the tomb of Tutankhamun - exactly as Howard Carter discovered it in November, 1922. (This is the only place in the world where the entire tomb &amp; its treasures can be seen). The village also contains 10 other museums - Four related to the Pharaonic period</p>\r\n<p>&nbsp;The village is located in the Nile, on Jacob island, about six miles from the center of Cairo, and not far from most of the hotels. The village is open from 10am to 7pm daily. In the summer months it remains open until 9pm. A guided tour of the village can last from one to three and half hours depending on what you wish to visit.</p>', 0, ',36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 99, 0, '2015-03-20', '2013-05-28', 1, 0, 0, '', 'pharonic-village.jpg', 'Pharaonic-Village', '', '', '', 0, '', ''),
(217, 'Magic Land', '<p>Magicland-Amusement park for family entertainment Entertaining dolphin show for kids and many more</p>', '<p><img src="uploads/c15.jpg" alt="width=283" height="174" /> Magicland-Amusement park for family entertainment Entertaining dolphin show for kids and many more</p>', 0, '36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 100, 0, '2013-05-29', '2013-05-28', 1, 0, 0, '', '51a504b115839.jpg', 'Magic-Land', '', '', '', 0, '', ''),
(218, 'Crystal Asfour Factory Outlet', '<p>The Asfour Crystal Egypt is an enchanting blend of Ancient Egyptian craftsmanship and the most sophisticated modern technology. The Ancient Egyptians created glass 5000 years ago, and Asfour Crystal is proud to continue that heritage.</p>', '<table class="mytable">\r\n<tbody>\r\n<tr>\r\n<td class="on">Entrance fee</td>\r\n<td class="on">nil</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Visiting Hours</td>\r\n<td class="tw">8 am &ndash; 8 pm</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Traveling time</td>\r\n<td class="on">45 min</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><strong><img src="uploads/crystal_asfour.JPG" alt="/" /></strong></p>\r\n<p>&nbsp;</p>\r\n<p>The <strong>Asfour Crystal</strong> Egypt is an enchanting blend of Ancient Egyptian craftsmanship and the most sophisticated modern technology. The Ancient Egyptians created glass 5000 years ago, and Asfour Crystal is proud to continue that heritage. The Asfour family has been creating these unique <strong>crystal figurines</strong> in their modern factory since 1961. Modern technology and the unique skills of Asfour&rsquo;s Egyptian artisans combine to create elegant crystal figurines and laser-cut crystal collectibles made with 30% sparkling lead crystal. Asfour Crystal is the 21st century technology answer to the original Pharonic glass bead invention, where glass beads had more value than natural precious stones. Asfour means &ldquo;Bird&ldquo; in Arabic and &ldquo;a bird with open wings logo&rdquo; is minutely engraved on most finished Asfour Products.</p>\r\n<p><strong><img src="images/c21.jpg" alt="/" width="216" height="179" /></strong></p>\r\n<p><br /> The devotion to excellence and love of perfection has helped Asfour Crystal grow from 200 to 5,000 of the most skilled workers in the industry. Asfour is one of the largest crystal manufacturing companies in the world, creating what we believe are the best crystal creations anywhere!</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong>&nbsp;</strong></p>', 0, ',36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 101, 0, '2015-03-24', '2013-05-28', 1, 2, 0, '', 'crystal_asfour.JPG', 'Crystal-Asfour-Factory-Outlet', '', '', '', 0, '', ''),
(219, 'Hurghada', '', '<p><strong><img src="images/c39.jpg" alt="/" /></strong></p>\r\n<p><strong>&nbsp;</strong>The city was founded in the early 20th century, and since the 1980s has been continually enlarged by Egyptian and foreign investors to become the leading seashore resort on the Red Sea. Holiday villages and hotels provide aquatic sport facilities for sailboarders, yachtsmen, scuba divers and snorklers.</p>\r\n<p>Hurghada stretches for about 40 km along the seashore, and it does not reach far into the surrounding desert. The resort is a destination for Egyptian tourists from Cairo, the Delta and Upper Egypt, as well as package holiday tourists from Europe, notably Russians, Czechs and Germans. Until a few years ago it was a small fishing village. Today Hurghada counts 40,000 inhabitants and is divided into three parts: Downtown (El Dahar) is the old part; Sekalla is the modern part, and El Korra Road is the most modern part. Sakkala is the relatively modest hotel quarter. Dahar is where the town largest bazaar, the post office and the long-distance bus station are situated.</p>\r\n<p><strong><img src="images/c38.jpg" alt="/" /></strong></p>\r\n<p>The city is served by the Hurghada International Airport with scheduled passenger traffic to and from Cairo and direct connections with several cities in Europe. The airport has undergone massive renovations to accommodate rising traffic. Hurghada is known for its watersports activities, nightlife and warm weather. Daily high temperature hovers round 30 degrees Celsius most of the year.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong>&nbsp;</strong></p>', 0, '37', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 102, 0, '0000-00-00', '2013-05-28', 1, 0, 0, '', '51a5054081ff7.jpg', 'Hurghada', '', '', '', 0, '', ''),
(220, 'Ain Sokhna', '', '<p><strong><img src="images/c36.jpg" alt="/" /></strong></p>\r\n<p><strong>&nbsp;</strong>Ain Sukhna, the Arabic for hot spring, was named after the nearby sulfur springs. The springs originate at Gebel Ataka, the northern most mountain in the Eastern Desert.&nbsp; Close enough to Cairo for a day-trip, this popular weekend resort has fine beaches, coral reefs, fishing and water sports. It is located about 55 kilometers (34 miles) south of Suez, and is the nearest bathing resort to Cairo. Some hotels in Ain Sukhna are the best on the Red Sea.</p>\r\n<p><strong>&nbsp;</strong></p>', 0, '37', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 103, 0, '0000-00-00', '2013-05-28', 1, 0, 0, '', '51a505a6ba493.jpg', 'Ain-Sokhna', '', '', '', 0, '', ''),
(221, 'Luxor', '', '<p><strong><img src="images/c35.jpg" alt="/" /></strong></p>\r\n<p>Luxor is unique among the world cities, originally built on the site of ancient Thebes over 4,000 years it is home to some of the most spectacular ancient sites in the world. Wherever you go, you cant afford to miss a thing. You will experience the past and the present, with a wealth of history and culture that spans centuries. There is hardly anywhere in the city that does not have a relic, offering you an impressive representation of the splendour of the ancient Egyptians several thousand years ago</p>\r\n<p><strong>&nbsp;</strong></p>', 0, '', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 104, 0, '0000-00-00', '2013-05-28', 1, 0, 0, '', '51a505d5dc610.jpg', 'Luxor', '', '', '', 0, '', ''),
(222, 'Aswan', '', '<p><strong><img src="images/c33.jpg" alt="/" /></strong></p>\r\n<p><strong>&nbsp;</strong><strong>&nbsp;</strong>Egypt southernmost city and one of her most beautiful&nbsp;Aswan is larger but much quieter than Luxor, it is Egypt&nbsp; southernmost city and one of her most beautiful, sitting alongside some of the best stretches of the Nile -- wide, green and dotted with pretty islands, with high desert hills topped with the Aga Khan Mausoleum as a dramatic backdrop</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong><img src="images/c34.jpg" alt="/" /></strong></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', 0, '37', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 105, 0, '0000-00-00', '2013-05-28', 1, 0, 0, '', '51a5064e60ea5.jpg', 'Aswan', '', '', '', 0, '', ''),
(223, 'AL-Azhar Park & Old Cairo', '<p>Al-Azhar Park is a major park in Cairo Darb al-Ahmar neighborhood in Egypt. It was inaugurated in May 2005. Among several honors, this park is listed as one of the world sixty great public spaces by Project for Public Spaces (PPS).[1] The Park was created by the Historic Cities Support Programme</p>', '<table class="mytable">\r\n<tbody>\r\n<tr>\r\n<td class="on">Entrance fee</td>\r\n<td class="on">5 LE per person</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Visiting Hours</td>\r\n<td class="tw">10 am - 10 pm</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Traveling time</td>\r\n<td class="on">15 mins</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><strong><img src="images/c26.jpg" alt="/" width="400" height="313" /></strong></p>\r\n<p>Al-Azhar Park is a major park in Cairo&nbsp; Darb al-Ahmar neighborhood in Egypt. It was inaugurated in May 2005.</p>\r\n<p>Among several honors, this park is listed as one of the world&nbsp; sixty great public spaces by Project for Public Spaces (PPS).<sup>[1]</sup> The Park was created by the Historic Cities Support Programme (HCSP) of the Aga Khan Trust for Culture (AKTC), an entity of the Aga Khan Development Network (AKDN). The park, developed at a cost in excess of USD $30 million, was a gift to Cairo from His Highness the Aga Khan. It is interesting to note that the city of Cairo was founded in the year 969 by the Fatimid Imam-Caliphs who were ancestors of the Aga Khan.</p>\r\n<p>The park project was not only the development of the park, but also included aspects of archeology (12th century Ayyubid wall), historic building rehabilitation (14th Century Umm Sultan Shaban Mosque, the 13th century Khayrbek complex, and the Darb Shoughlan School) and several quality of life improvement initiatives. Those initiatives included skills training, area rehabilitation, microfinance, and support in the areas of health and education among others.</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong>Old Cairo</strong></p>\r\n<p>&nbsp;</p>\r\n<p>Old Cairo is really compact, and you can with ease cover a great collection of important Cairo sights in half a day.The part of <strong>Cairo</strong> that contains</p>', 0, ',36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 106, 0, '2015-03-20', '2013-05-28', 1, 1, 0, '', 'azhar-park-old-cairo.jpg', 'AL-Azhar-Park-Old-Cairo', '', '', '', 0, '', ''),
(224, 'Citadel', '<p>One of Cairo most popular tourist attractions is the Citadel, located on a spur of limestone that had been detached from its parent Moqattam Hills by quarrying. The Citadel is one of the world greatest monuments to medieval warfare,</p>', '<table class="mytable">\r\n<tbody>\r\n<tr>\r\n<td class="on">Entrance fee</td>\r\n<td class="on">50 LE per adult</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Visiting Hours</td>\r\n<td class="tw">9 am to 4 pm</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Traveling time</td>\r\n<td class="on">20 mins</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><strong><img src="images/c23.jpg" alt="/" /></strong></p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p>One of Cairo&rsquo;s most popular tourist attractions is the Citadel, located on a spur of limestone that had been detached from its parent Moqattam Hills by quarrying. The Citadel is one of the world&rsquo;s greatest monuments to medieval warfare, as well as a highly visible landmark on Cairo&nbsp; eastern skyline.&nbsp;Particularly when viewed from the back side (from the north), the Citadel reveals a very medieval character.</p>\r\n<p><strong>&nbsp;</strong></p>', 0, ',36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 107, 0, '2015-03-20', '2013-05-28', 1, 2, 0, '', 'citadel.jpg', 'Citadel', '', '', '', 0, '', ''),
(225, 'Giza Pyramids', '<p>You won t want to miss one of Egypt s top attractions, the last surviving member of the Seven Wonders of the World, the Great Pyramid of Giza. There are in fact three main pyramids in Giza; the Great Pyramid of Khufu (or Cheops), The Pyramid of Kafhre and the smaller Pyramid of Menkaura.</p>', '<table class="mytable">\r\n<tbody>\r\n<tr>\r\n<td class="on">Entrance fee</td>\r\n<td class="on">80 LE per adult</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Visiting Hours</td>\r\n<td class="tw">9am &ndash; 3:30 pm</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Traveling time</td>\r\n<td class="on">45 min</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><strong><img src="images/c12.jpg" alt="/" /></strong></p>\r\n<p>&nbsp;</p>\r\n<p>You won&rsquo;t want to miss one of Egypt s top attractions, the last surviving member of the Seven Wonders of the World, the Great Pyramid of Giza. There are in fact three main pyramids in Giza; the Great Pyramid of Khufu (or Cheops), The Pyramid of Kafhre and the smaller Pyramid of Menkaura. Each Pyramid is a tomb to a different King of Egypt. In front of the pyramids lies the Sphinx, or Abu al-Hol in Arabic, Father of Terror. Carved out of a single block of stone, this enormous cat-like sculpture has mesmerized millions of visitors.</p>\r\n<p><strong><img src="images/c14.jpg" alt="/" /></strong></p>\r\n<p>Gizas three pyramids and the Sphinx were thought to have been constructed in the fourth dynasty of Egypt&nbsp; Old Kingdom, arguably the first great civilization on earth. For most of us that translates in to about 5000 years ago. Even though there is still debate about how the pyramids at Giza were built, most are in agreement it wasn t by aliens . It is believed about 20,000 laborers were used and approximately 2 million blocks of stone, each weighing 2.5 tons, just to build the Pyramid of Khufu.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong>Sound and light show at Giza</strong></p>\r\n<p><strong><img src="images/c37.jpg" alt="/" /></strong></p>\r\n<p>Have you ever wondered what life must have been like thousands of years ago? These thoughts of curiosity has inspired artists to take you there, for a brief period, through the creation of sound &amp; light shows. You can get a glimpse back in time to see, feel, and imagine how it was when the powerful ancient Egyptians ruled. The artists have masterfully created a spectacle show that draws you in as part of history.</p>\r\n<p><strong>&nbsp;</strong></p>', 0, ',36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 108, 0, '2015-03-20', '2013-05-28', 1, 0, 0, '', 'giza-pyramids.jpg', 'Giza-Pyramids', '', '', '', 0, '', ''),
(226, 'Nile Cruise', '<p>Nile Cruises...the very words conjure up images of mystery, enchantment and unforgettable experiences of one of the most ancient civilisations. One of the best ways to do this is aboard a Nile dinner cruiser.</p>', '<table class="mytable">\r\n<tbody>\r\n<tr>\r\n<td class="on">Entrance fee</td>\r\n<td class="on">180 LE (For bookings contact Zuwwar Office)</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Visiting Hours</td>\r\n<td class="tw">Evenings after sunset</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Traveling time</td>\r\n<td class="on">45 mins</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><strong><img class="form_pic" src="uploads/guide_nilecruise.jpg" alt="/" /><br /></strong></p>\r\n<p>Nile Cruises...the very words conjure up images of mystery, enchantment and unforgettable experiences of one of the most ancient&nbsp;civilisations. One of the best ways to do this is aboard a Nile dinner cruiser. Some of these boats are, in fact, converted Nile passenger ships, which stay out usually for several hours and include good food, fine entertainment, and a romantic evening gazing at the lights along the river banks. Really, this is one form of entertainment that should not be missed on a visit to Egypt.</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p>&nbsp;</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong>&nbsp;</strong></p>', 0, ',36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 109, 0, '2015-03-20', '2013-05-28', 1, 0, 0, '', 'nile cruise.jpg', 'Nile-Cruise', '', '', '', 0, '', ''),
(227, '', '', '', 0, '', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 0, 0, '0000-00-00', '0000-00-00', 0, 36, 0, '', '', '', '', '', '', 0, '', ''),
(228, 'Khan Al Khalili', '<p>Khan el-Khalili is for many the most entertaining part of Cairo. It is an ancient shopping area, nothing less, but some of the shops have also their own little factories or workshops.</p>', '<p><strong><img src="images/c10.jpg" alt="/" /></strong>Khan el-Khalili is for many the most entertaining part of Cairo. It is an ancient shopping area, nothing less, but some of the shops have also their own little factories or workshops.</p>\r\n<p>The suq (which is the Arabic name for bazaar, or market) dates back to 1382, when Emir Djaharks el-Khalili built a big caravanserai (or khan) right here. A caravanserai was a sort of hotel for traders, and usually the focal point for economic activity for any surrounding area. This caravanserai is still there, you just ask for the narrow street of Sikka Khan el-Khalili and Badestan.</p>\r\n<p>Khan Khalili Bazaar, it stays open till late, and&nbsp; is a very interesting area for monuments as well as shopping.</p>', 0, '36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 111, 0, '2013-12-23', '2013-05-28', 1, 15, 0, '', '51a507eedcf22.jpg', 'Khan-Al-Khalili', '', '', '', 0, '', ''),
(229, 'Sharm al Sheikh', '', '<p><a href="../uploads/c31.jpg"><img src="uploads/c31.jpg" alt="/" /></a></p>\r\n<p><strong><span>&nbsp;</span></strong>The simplicity of sun, sea and sand. The luxury of five-star hotels, water sports, shopping and entertainment. This is Sharm el-Sheikh, one of the most accessible and developed tourist resort communities on the Sinai peninsula. All around are Bedouins, colorful tents, mountains and sea. There are small, intimate hotels with modern designs, as well as larger hotel complexes belonging to International chains, plus about all the amenities one could expect of a tourist center, including casinos, discos and nightclubs, golf courses and health facilities. In fact, with diving and snorkeling, windsurfing and other water sports, horses and camel riding, desert safaris, and great nearby antiquities attractions, it is almost impossible for a visitor to ever suffer from bored</p>\r\n<p><strong>&nbsp;</strong></p>', 0, '37', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 112, 0, '0000-00-00', '2013-05-28', 1, 24, 0, '', '51a5095b6857d.jpg', 'Sharm-al-Sheikh', '', '', '', 0, '', ''),
(230, 'Special Extra Night Lawazim', '<p>This is the intro for special extra night lawazim</p>', '<p>this is the description for special extra night lawazim</p>', 0, '35', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 113, 0, '0000-00-00', '2013-05-28', 1, 4, 0, '', '', 'Special-Extra-Night-Lawazim', '', '', '', 0, '', ''),
(231, 'Standard Package', '<p>Standard package intro Standard package intro Standard package intro Standard package intro</p>', '<p>STANDARD PACKAGE DESCRIPTION</p>', 0, ',38', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 114, 0, '2015-03-25', '2013-05-28', 0, 1, 0, '', '', 'Standard-Package', '', '', '', 0, '', '');
INSERT INTO `com_content_article` (`id`, `title`, `des`, `artbody`, `hits`, `cat_id`, `start_date`, `end_date`, `gal_id`, `date`, `author`, `order`, `delete`, `modified`, `created`, `enabled`, `hit`, `imagegallery`, `tags`, `th_image`, `alias`, `description`, `keywords`, `header`, `vediogallery`, `intro`, `ex_link`) VALUES
(232, 'Holiday Package', '<p>To the Tour Operators &amp; Zaaereen Keraam Faiz E Haakimi and its Khidmat guzaar would like to convey Mubarakbadi to everyone ...</p>', '<div id="all">\r\n<div id="myall">\r\n<h2>&nbsp;</h2>\r\n<table class="mytable">\r\n<tbody>\r\n<tr>\r\n<td class="on">Entrance fee</td>\r\n<td class="on">nil</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Visiting Hours</td>\r\n<td class="tw">Open throughout the day</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Traveling time</td>\r\n<td class="on">30-45 mins</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><strong><img src="/uploads/images/c18.jpg" alt="/" width="309" height="222" /></strong></p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong>City Stars</strong> is the latest commercial development in Egypt. The complex is located in between Nasr City and Heliopolis, in Cairo. It is considered to be the first, integrated urban development project, of its kind in the Middle East and Europe.</p>\r\n<p>Built with an Ancient Egyptian theme, it consists of 3 pyramids (partially glass), surrounded by 11 towers, that make up the complex, plus a separate building for the shopping mall in its 2 phases.</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong><img src="/uploads/images/c20.jpg" alt="/" /></strong></p>\r\n<p>The complex is equipped with some of the most advanced infrastructure and multi-media networks which complement the project&rsquo;s design elements and customer services, which include an easily accessible indoor parking facility for over 6,000 vehicles<sup>[1]</sup>. City Stars offers an unparalleled choice in retail and entertainment and brings together an unbeatable combination of leading brand names in a single destination.</p>\r\n<p>City Stars is the latest landmark in Cairo and consists of<sup>[1]</sup>:</p>\r\n<p><strong><img src="/uploads/images/c19.jpg" alt="/" /></strong></p>\r\n<ul>\r\n<li>Three international hotels that provides over 1,500 rooms and suites.</li>\r\n<li>Shopping and entertainment centre.</li>\r\n<li>Medical centre.</li>\r\n<li>Residential Towers; offering 266 apartments, duplexes and penthouses.</li>\r\n<li>Office Towers; offering 70,000 m<sup>2</sup> of office space.</li>\r\n<li>An International Exhibition Centre (20,000 m<sup>2</sup>)<sup>[2]</sup>.</li>\r\n</ul>\r\n<p><strong>&nbsp;</strong></p>\r\n<div id="myend"><img src="images/separetor.png" alt="/" /></div>\r\n</div>\r\n</div>', 0, ',38', '0000-00-00', '0000-00-00', 0, '2013-04-16', '', 93, 0, '2015-03-25', '2013-04-16', 1, 0, 0, '', '', 'Holiday-Package', '', '', '', 0, '', ''),
(233, 'Holiday Package', '<p><span>To the Tour Operators &amp; Zaaereen Keraam Faiz E Haakimi and its Khidmat guzaar would like to convey Mubarakbadi to everyone ...</span></p>', '<h2>&nbsp;</h2>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n<div>&nbsp;</div>\r\n<ul>\r\n<li>Need to take a break from work?!</li>\r\n<li>Need to spend some quality time with your family away from the pressures of daily life?!</li>\r\n<li>Need your children to acquire the barakaat of Awliyaullah&nbsp;<sup>(AS)</sup>&nbsp;Ziyarat and masajid along with the holiday they have been dreaming of?!</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Look no further!&nbsp;Egypt&nbsp;is the Perfect destination for you!</p>\r\n<p>Stay at Faiz e Haakimi&rsquo;s Luxurious property at the heart of Cairo while you perform the Ziyarat of Imam Husain&nbsp;<sup>(AS)</sup>&nbsp;and other Ahle Bait&nbsp;<sup>(AS)</sup>&nbsp;and Pray namaz at Jame Anwar and other masajid before you set off to your holiday at the Red Sea Riviera or the historic cities of Luxor and Aswan in Upper Egypt.</p>\r\n<p>If you reside in the&nbsp;US&nbsp;or&nbsp;Europe, you might find very good deals on reputed websites like Lastminute.com&hellip;etc to various holiday destinations.</p>\r\n<p>Just contact&nbsp;<a href=mailto:tours@faizehaakimi.com>tours@faizehaakimi.com</a>&nbsp;and we&rsquo;ll help you plan your trip.</p>\r\n<p>&nbsp;&nbsp; &nbsp;</p>', 0, '35', '0000-00-00', '0000-00-00', 0, '2013-04-16', '', 93, 1, '2015-03-20', '2013-04-16', 1, 0, 0, '', '', 'Holiday-Package', '', '', '', 0, '', ''),
(234, 'Holiday Package', '<p><span>To the Tour Operators &amp; Zaaereen Keraam Faiz E Haakimi and its Khidmat guzaar would like to convey Mubarakbadi to everyone ...</span></p>', '<h2>&nbsp;</h2>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n<div>&nbsp;</div>\r\n<ul>\r\n<li>Need to take a break from work?!</li>\r\n<li>Need to spend some quality time with your family away from the pressures of daily life?!</li>\r\n<li>Need your children to acquire the barakaat of Awliyaullah&nbsp;<sup>(AS)</sup>&nbsp;Ziyarat and masajid along with the holiday they have been dreaming of?!</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Look no further!&nbsp;Egypt&nbsp;is the Perfect destination for you!</p>\r\n<p>Stay at Faiz e Haakimi&rsquo;s Luxurious property at the heart of Cairo while you perform the Ziyarat of Imam Husain&nbsp;<sup>(AS)</sup>&nbsp;and other Ahle Bait&nbsp;<sup>(AS)</sup>&nbsp;and Pray namaz at Jame Anwar and other masajid before you set off to your holiday at the Red Sea Riviera or the historic cities of Luxor and Aswan in Upper Egypt.</p>\r\n<p>If you reside in the&nbsp;US&nbsp;or&nbsp;Europe, you might find very good deals on reputed websites like Lastminute.com&hellip;etc to various holiday destinations.</p>\r\n<p>Just contact&nbsp;<a href=mailto:tours@faizehaakimi.com>tours@faizehaakimi.com</a>&nbsp;and we&rsquo;ll help you plan your trip.</p>\r\n<p>&nbsp;&nbsp; &nbsp;</p>', 0, '35', '0000-00-00', '0000-00-00', 0, '2013-04-16', '', 93, 1, '2015-03-20', '2013-04-16', 1, 0, 0, '', '', 'Holiday-Package', '', '', '', 0, '', ''),
(235, 'Holiday Package', '<p><span>To the Tour Operators &amp; Zaaereen Keraam Faiz E Haakimi and its Khidmat guzaar would like to convey Mubarakbadi to everyone ...</span></p>', '<h2>&nbsp;</h2>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n<div>&nbsp;</div>\r\n<ul>\r\n<li>Need to take a break from work?!</li>\r\n<li>Need to spend some quality time with your family away from the pressures of daily life?!</li>\r\n<li>Need your children to acquire the barakaat of Awliyaullah&nbsp;<sup>(AS)</sup>&nbsp;Ziyarat and masajid along with the holiday they have been dreaming of?!</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Look no further!&nbsp;Egypt&nbsp;is the Perfect destination for you!</p>\r\n<p>Stay at Faiz e Haakimi&rsquo;s Luxurious property at the heart of Cairo while you perform the Ziyarat of Imam Husain&nbsp;<sup>(AS)</sup>&nbsp;and other Ahle Bait&nbsp;<sup>(AS)</sup>&nbsp;and Pray namaz at Jame Anwar and other masajid before you set off to your holiday at the Red Sea Riviera or the historic cities of Luxor and Aswan in Upper Egypt.</p>\r\n<p>If you reside in the&nbsp;US&nbsp;or&nbsp;Europe, you might find very good deals on reputed websites like Lastminute.com&hellip;etc to various holiday destinations.</p>\r\n<p>Just contact&nbsp;<a href=mailto:tours@faizehaakimi.com>tours@faizehaakimi.com</a>&nbsp;and we&rsquo;ll help you plan your trip.</p>\r\n<p>&nbsp;&nbsp; &nbsp;</p>', 0, '35', '0000-00-00', '0000-00-00', 0, '2013-04-16', '', 93, 1, '2015-03-20', '2013-04-16', 1, 0, 0, '', '', 'Holiday-Package', '', '', '', 0, '', ''),
(236, 'Holiday Package', '<p><span>To the Tour Operators &amp; Zaaereen Keraam Faiz E Haakimi and its Khidmat guzaar would like to convey Mubarakbadi to everyone ...</span></p>', '<h2>&nbsp;</h2>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n<div>&nbsp;</div>\r\n<ul>\r\n<li>Need to take a break from work?!</li>\r\n<li>Need to spend some quality time with your family away from the pressures of daily life?!</li>\r\n<li>Need your children to acquire the barakaat of Awliyaullah&nbsp;<sup>(AS)</sup>&nbsp;Ziyarat and masajid along with the holiday they have been dreaming of?!</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Look no further!&nbsp;Egypt&nbsp;is the Perfect destination for you!</p>\r\n<p>Stay at Faiz e Haakimi&rsquo;s Luxurious property at the heart of Cairo while you perform the Ziyarat of Imam Husain&nbsp;<sup>(AS)</sup>&nbsp;and other Ahle Bait&nbsp;<sup>(AS)</sup>&nbsp;and Pray namaz at Jame Anwar and other masajid before you set off to your holiday at the Red Sea Riviera or the historic cities of Luxor and Aswan in Upper Egypt.</p>\r\n<p>If you reside in the&nbsp;US&nbsp;or&nbsp;Europe, you might find very good deals on reputed websites like Lastminute.com&hellip;etc to various holiday destinations.</p>\r\n<p>Just contact&nbsp;<a href=mailto:tours@faizehaakimi.com>tours@faizehaakimi.com</a>&nbsp;and we&rsquo;ll help you plan your trip.</p>\r\n<p>&nbsp;&nbsp; &nbsp;</p>', 0, '35', '0000-00-00', '0000-00-00', 0, '2013-04-16', '', 93, 1, '2015-03-20', '2013-04-16', 1, 0, 0, '', '', 'Holiday-Package', '', '', '', 0, '', ''),
(237, 'Holiday Package', '<p><span>To the Tour Operators &amp; Zaaereen Keraam Faiz E Haakimi and its Khidmat guzaar would like to convey Mubarakbadi to everyone ...</span></p>', '<h2>&nbsp;</h2>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n<div>&nbsp;</div>\r\n<ul>\r\n<li>Need to take a break from work?!</li>\r\n<li>Need to spend some quality time with your family away from the pressures of daily life?!</li>\r\n<li>Need your children to acquire the barakaat of Awliyaullah&nbsp;<sup>(AS)</sup>&nbsp;Ziyarat and masajid along with the holiday they have been dreaming of?!</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Look no further!&nbsp;Egypt&nbsp;is the Perfect destination for you!</p>\r\n<p>Stay at Faiz e Haakimi&rsquo;s Luxurious property at the heart of Cairo while you perform the Ziyarat of Imam Husain&nbsp;<sup>(AS)</sup>&nbsp;and other Ahle Bait&nbsp;<sup>(AS)</sup>&nbsp;and Pray namaz at Jame Anwar and other masajid before you set off to your holiday at the Red Sea Riviera or the historic cities of Luxor and Aswan in Upper Egypt.</p>\r\n<p>If you reside in the&nbsp;US&nbsp;or&nbsp;Europe, you might find very good deals on reputed websites like Lastminute.com&hellip;etc to various holiday destinations.</p>\r\n<p>Just contact&nbsp;<a href=mailto:tours@faizehaakimi.com>tours@faizehaakimi.com</a>&nbsp;and we&rsquo;ll help you plan your trip.</p>\r\n<p>&nbsp;&nbsp; &nbsp;</p>', 0, '35', '0000-00-00', '0000-00-00', 0, '2013-04-16', '', 93, 1, '2015-03-20', '2013-04-16', 1, 0, 0, '', '', 'Holiday-Package', '', '', '', 0, '', ''),
(238, 'Holiday Package', '<p><span>To the Tour Operators &amp; Zaaereen Keraam Faiz E Haakimi and its Khidmat guzaar would like to convey Mubarakbadi to everyone ...</span></p>', '<h2>&nbsp;</h2>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n<div>&nbsp;</div>\r\n<ul>\r\n<li>Need to take a break from work?!</li>\r\n<li>Need to spend some quality time with your family away from the pressures of daily life?!</li>\r\n<li>Need your children to acquire the barakaat of Awliyaullah&nbsp;<sup>(AS)</sup>&nbsp;Ziyarat and masajid along with the holiday they have been dreaming of?!</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Look no further!&nbsp;Egypt&nbsp;is the Perfect destination for you!</p>\r\n<p>Stay at Faiz e Haakimi&rsquo;s Luxurious property at the heart of Cairo while you perform the Ziyarat of Imam Husain&nbsp;<sup>(AS)</sup>&nbsp;and other Ahle Bait&nbsp;<sup>(AS)</sup>&nbsp;and Pray namaz at Jame Anwar and other masajid before you set off to your holiday at the Red Sea Riviera or the historic cities of Luxor and Aswan in Upper Egypt.</p>\r\n<p>If you reside in the&nbsp;US&nbsp;or&nbsp;Europe, you might find very good deals on reputed websites like Lastminute.com&hellip;etc to various holiday destinations.</p>\r\n<p>Just contact&nbsp;<a href=mailto:tours@faizehaakimi.com>tours@faizehaakimi.com</a>&nbsp;and we&rsquo;ll help you plan your trip.</p>\r\n<p>&nbsp;&nbsp; &nbsp;</p>', 0, '35', '0000-00-00', '0000-00-00', 0, '2013-04-16', '', 93, 1, '2015-03-20', '2013-04-16', 1, 0, 0, '', '', 'Holiday-Package', '', '', '', 0, '', ''),
(239, 'Holiday Package', '<p><span>To the Tour Operators &amp; Zaaereen Keraam Faiz E Haakimi and its Khidmat guzaar would like to convey Mubarakbadi to everyone ...</span></p>', '<h2>&nbsp;</h2>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n<div>&nbsp;</div>\r\n<ul>\r\n<li>Need to take a break from work?!</li>\r\n<li>Need to spend some quality time with your family away from the pressures of daily life?!</li>\r\n<li>Need your children to acquire the barakaat of Awliyaullah&nbsp;<sup>(AS)</sup>&nbsp;Ziyarat and masajid along with the holiday they have been dreaming of?!</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Look no further!&nbsp;Egypt&nbsp;is the Perfect destination for you!</p>\r\n<p>Stay at Faiz e Haakimi&rsquo;s Luxurious property at the heart of Cairo while you perform the Ziyarat of Imam Husain&nbsp;<sup>(AS)</sup>&nbsp;and other Ahle Bait&nbsp;<sup>(AS)</sup>&nbsp;and Pray namaz at Jame Anwar and other masajid before you set off to your holiday at the Red Sea Riviera or the historic cities of Luxor and Aswan in Upper Egypt.</p>\r\n<p>If you reside in the&nbsp;US&nbsp;or&nbsp;Europe, you might find very good deals on reputed websites like Lastminute.com&hellip;etc to various holiday destinations.</p>\r\n<p>Just contact&nbsp;<a href=mailto:tours@faizehaakimi.com>tours@faizehaakimi.com</a>&nbsp;and we&rsquo;ll help you plan your trip.</p>\r\n<p>&nbsp;&nbsp; &nbsp;</p>', 0, '35', '0000-00-00', '0000-00-00', 0, '2013-04-16', '', 93, 1, '2015-03-20', '2013-04-16', 1, 0, 0, '', '', 'Holiday-Package', '', '', '', 0, '', ''),
(240, 'facebook', '<p>test</p>\r\n<div id="fb-root">&nbsp;</div>\r\n<script>// <![CDATA[\r\n(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));\r\n// ]]></script>\r\n<div class="fb-like" data-href="http://fiz.egzsport.com/Caironews/test/facebook/" data-layout="button_count" data-action="like" data-show-faces="true" data-share="true">&nbsp;</div>', '<h2>&nbsp;</h2>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n<div>&nbsp;</div>\r\n<ul>\r\n<li>Need to take a break from work?!</li>\r\n<li>Need to spend some quality time with your family away from the pressures of daily life?!</li>\r\n<li>Need your children to acquire the barakaat of Awliyaullah&nbsp;<sup>(AS)</sup>&nbsp;Ziyarat and masajid along with the holiday they have been dreaming of?!</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Look no further!&nbsp;Egypt&nbsp;is the Perfect destination for you!</p>\r\n<p>Stay at Faiz e Haakimi&rsquo;s Luxurious property at the heart of Cairo while you perform the Ziyarat of Imam Husain&nbsp;<sup>(AS)</sup>&nbsp;and other Ahle Bait&nbsp;<sup>(AS)</sup>&nbsp;and Pray namaz at Jame Anwar and other masajid before you set off to your holiday at the Red Sea Riviera or the historic cities of Luxor and Aswan in Upper Egypt.</p>\r\n<p>If you reside in the&nbsp;US&nbsp;or&nbsp;Europe, you might find very good deals on reputed websites like Lastminute.com&hellip;etc to various holiday destinations.</p>\r\n<p>Just contact&nbsp;<a href="mailto:tours@faizehaakimi.com">tours@faizehaakimi.com</a>&nbsp;and we&rsquo;ll help you plan your trip.</p>\r\n<p>&nbsp;&nbsp; &nbsp;</p>', 0, '35', '0000-00-00', '0000-00-00', 0, '2013-04-16', '', 93, 0, '2014-01-06', '2013-04-16', 1, 41, 0, '', '', 'facebook', '', '', '', 0, '', ''),
(241, 'City Star Shopping Center', '<p><strong>City Stars</strong>&nbsp;is the latest commercial development in Egypt. The complex is located in between Nasr City and Heliopolis, in Cairo. It is considered to be the first, integrated urban development project, of its kind in the Middle East and Europe.</p>', '<table class="mytable">\r\n<tbody>\r\n<tr>\r\n<td class="on">Entrance fee</td>\r\n<td class="on">nil</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Visiting Hours</td>\r\n<td class="tw">Open throughout the day</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Traveling time</td>\r\n<td class="on">30-45 mins</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><strong><img src="images/c18.jpg" alt="/" width="309" height="222" /></strong></p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong>City Stars</strong> is the latest commercial development in Egypt. The complex is located in between Nasr City and Heliopolis, in Cairo. It is considered to be the first, integrated urban development project, of its kind in the Middle East and Europe.</p>\r\n<p>Built with an Ancient Egyptian theme, it consists of 3 pyramids (partially glass), surrounded by 11 towers, that make up the complex, plus a separate building for the shopping mall in its 2 phases.</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong><img src="images/c20.jpg" alt="/" /></strong></p>\r\n<p>The complex is equipped with some of the most advanced infrastructure and multi-media networks which complement the project&rsquo;s design elements and customer services, which include an easily accessible indoor parking facility for over 6,000 vehicles<sup>[1]</sup>. City Stars offers an unparalleled choice in retail and entertainment and brings together an unbeatable combination of leading brand names in a single destination.</p>\r\n<p>City Stars is the latest landmark in Cairo and consists of<sup>[1]</sup>:</p>\r\n<p><strong><img src="images/c19.jpg" alt="/" /></strong></p>\r\n<ul>\r\n<li>Three international hotels that provides over 1,500 rooms and suites.</li>\r\n<li>Shopping and entertainment centre.</li>\r\n<li>Medical centre.</li>\r\n<li>Residential Towers; offering 266 apartments, duplexes and penthouses.</li>\r\n<li>Office Towers; offering 70,000 m<sup>2</sup> of office space.</li>\r\n<li>An International Exhibition Centre (20,000 m<sup>2</sup>)<sup>[2]</sup>.</li>\r\n</ul>\r\n<p><strong>&nbsp;</strong></p>', 0, ',36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 115, 0, '0000-00-00', '2015-03-20', 1, 0, 0, '', 'citistars.jpg', 'City-Star-Shopping-Center', '', '', '', 0, '', ''),
(242, 'Textile Museum', '<p>Long before Egypt was known worldwide for its cotton, Egyptians coveted linen and wool, using these textiles for everything from clothing and bedding to paying taxes with. To learn more than you thought there was to know about the history of Egyptian textiles, head to&nbsp;Muezz El Din Street&nbsp;and check out the Egyptian Textile Museum.</p>\r\n<p>&nbsp;</p>', '<table class="mytable">\r\n<tbody>\r\n<tr>\r\n<td class="on">Entrance fee</td>\r\n<td class="on">25LE per adult</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Visiting Hours</td>\r\n<td class="tw">12pm to 6pm</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Traveling time</td>\r\n<td class="on">10-15 mins walk from Jame Anwar</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><img src="uploads/textile-museum.jpg" alt="textile" />Long before Egypt was known worldwide for its cotton, Egyptians coveted linen and wool, using these textiles for everything from clothing and bedding to paying taxes with. To learn more than you thought there was to know about the history of Egyptian textiles, head to&nbsp;Muezz El Din Street&nbsp;and check out the Egyptian Textile Museum.</p>\r\n<p>Two floors&ndash; almost overwhelming in size&ndash; hold an immaculately maintained collection of textiles, tools and other artefacts. The lights are low to protect the pieces, and the whole museum is temperature- and humidity-controlled! The Egyptian Textile Museum may indeed be one of the best-cared-for museums in Cairo.</p>\r\n<p>Inspired by the floral and geometric embroidery of Coptic designs, the Umayids used many of the same techniques but changed all Christian imagery to Arabic calligraphy; a theme still popular to this day. As the exhibit continues, the beautiful collection of clothing and decorative textiles becomes more impressive and ornate with a brief step back to the politically volatile years of Mamluk rule. On the other hand, an increase in trade during this time also resulted in gorgeous silk work and European-inspired designs.</p>\r\n<p>A room towards the end of the museum features a massive Kiswab. From early on in Islamic history until the 20 century, the black cloth hanging over the Kaaba in Mecca were made right here in Egypt. With thick golden thread embellishing the calligraphy over a black backdrop, this is one of the most stunning pieces in the museum.</p>', 0, ',36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 116, 0, '0000-00-00', '2015-03-20', 1, 0, 0, '', 'textile-museum.jpg', 'Textile-Museum', '', '', '', 0, '', ''),
(243, 'Tannoura', '<p>El Tannoura dance performance is similar to the more commonly known whirling dervishes; however this version of the indigenous dance incorporates instruments and other additional elements.</p>', '<table class="mytable">\r\n<tbody>\r\n<tr>\r\n<td class="on">Entrance fee</td>\r\n<td class="on">30 LE per person</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Visiting Hours</td>\r\n<td class="tw">Show timings: Mondays, Wednesdays, Saturdays at 7pm</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Traveling time</td>\r\n<td class="on">15-20 mins walk from Faiz</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><img title="tannoura" src="uploads/tannoura1.jpg" alt="tannoura" width="300" height="200" />El Tannoura dance performance is similar to the more commonly known whirling dervishes; however this version of the indigenous dance incorporates instruments and other additional elements.<br /> <br /><img title="tannoura" src="uploads/tannour21.jpg" alt="tannoura" width="300" height="225" />A group of performers appear with an array of instruments ranging from the Daf (tambourine) to the Oud and Ney (flute). After a few solos by various singers, a vocalist appeared on a&nbsp;balcony. This specific vocalist, officially known as the Muezzin, sings of spirituality.&nbsp;The second part of the performance, the Sufi Tannoura Dance (El Darawish) is derived from the dance performed as part of a Sufi ritual.&nbsp;The third part of the performance incorporates a more spectacular dance, more based on the showing of skills and costume design.</p>', 0, ',36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 117, 0, '0000-00-00', '2015-03-20', 1, 0, 0, '', 'tannoura1.jpg', 'Tannoura', '', '', '', 0, '', ''),
(244, 'Kidzania', '<p>KidZania provides children and their parents a safe, unique, and very realistic educational environment that allows kids between the ages of four to fourteen to do what comes naturally to them: role-playing by mimicking traditionally adult activities.</p>', '<table class="mytable">\r\n<tbody>\r\n<tr>\r\n<td class="on">Ticket Prices:</td>\r\n<td class="on">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Infant (below 2 years old)</td>\r\n<td class="tw">Free of charge</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Infant (2-3 years old)</td>\r\n<td class="tw">EGP 110</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Children (4-14 years old)</td>\r\n<td class="tw">EGP 150</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Adults (15 and above)</td>\r\n<td class="tw">EGP 85</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Timings</td>\r\n<td class="on">From 12pm to 6pm</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Travelling Time</td>\r\n<td class="on">1 hr 15 mins</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><img title="kidzania" src="uploads/kidzania1.jpg" alt="kidzania" width="303" height="246" />KidZania provides children and their parents a safe, unique, and very realistic educational environment that allows kids between the ages of four to fourteen to do what comes naturally to them: role-playing by mimicking traditionally adult activities. As in the real world, children perform jobs and are either paid for their work (as a fireman, doctor, police officer, journalist, shopkeeper, etc.) or pay to shop or to be entertained. The indoor theme park is a city built to scale for children, complete with buildings, paved streets, vehicles, a functioning economy, and recognizable destinations in the form of establishments sponsored and branded by leading multi-national and local brands.</p>\r\n<p><strong><img title="kidzania" src="uploads/kidzania2.jpg" alt="kidzania" width="300" height="138" />Note:</strong> Advance reservation is compulsory.<br />For reservations contact zuwwar office at Faizehaakimi.</p>', 0, ',36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 118, 0, '0000-00-00', '2015-03-20', 1, 0, 0, '', 'kidzania.png', 'Kidzania', '', '', '', 0, '', ''),
(245, 'Great Sahara Desert Riding', '', '<table class="mytable">\r\n<tbody>\r\n<tr>\r\n<td class="on">Entrance fee</td>\r\n<td class="on">See below</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Visiting Hours</td>\r\n<td class="tw">Early in the morning (Direct After Fajar Namaz)</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Traveling time</td>\r\n<td class="on">45 Min</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><img src="uploads/Faiz1.jpg" alt="Horse" width="300" height="225" />&nbsp;</p>\r\n<p><strong>Horse Ride Price</strong>: 50 L.E. (50 Egyptian pounds) / Per Trip per Person</p>\r\n<p><strong>Camel Ride Price</strong>: 50 L.E. (50 Egyptian pounds) / Per Trip per Person</p>\r\n<p><strong>Quad biking Price</strong>: 120 L.E. (120 Egyptian pounds) / Per Trip per Person</p>\r\n<p><img src="uploads/Faiz2.jpg" alt="Buggy" width="300" height="220" /></p>', 0, ',36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 119, 0, '0000-00-00', '2015-03-20', 1, 0, 0, '', 'great-sahara-ride.jpg', 'Great-Sahara-Desert-Riding', '', '', '', 0, '', ''),
(246, 'Cairo Festival City', '<p>At the heart of Cairo Festival City lies a modern contemporary retail resort which is the focal point of the entire community. Cairo Festival City Mall, an architecturally striking masterpiece, will total 217,796 sqm upon completion and present an outstanding mix of retailers on a total GLA of 168,000 sqm.</p>', '<table class="mytable">\r\n<tbody>\r\n<tr>\r\n<td class="on">Entrance fee</td>\r\n<td class="on">No fees</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Visiting Hours</td>\r\n<td class="tw">12 pm to 6pm</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Traveling time</td>\r\n<td class="on">1 hr 15 mins</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><img src="uploads/cfc.jpg" alt="Cairo" />At the heart of Cairo Festival City lies a modern contemporary retail resort which is the focal point of the entire community. Cairo Festival City Mall, an architecturally striking masterpiece, will total 217,796 sqm upon completion and present an outstanding mix of retailers on a total GLA of 168,000 sqm.<br /> <br /> <img src="uploads/cfc2.jpg" alt="Cairo" width="300" height="226" />Cairo Festival City Mall contains three primary districts which are fashion, lifestyle and entertainment. Dramatic plazas and courts provide gateways between the free flowing passages, promenades and anchor tenants. Cairo Festival City Mall comprises:<br /><br />17 international flagship stores including IKEA, White House and Marks &amp; Spencer.Over 310 shops and services including 95 restaurants and caf&eacute;s Carrefour Hypermarket.</p>', 0, ',36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 120, 0, '0000-00-00', '2015-03-20', 1, 0, 0, '', 'cairo-festival-city.jpg', 'Cairo-Festival-City', '', '', '', 0, '', ''),
(247, 'Billy Beez', '<p>Located inside Mall of Arabia, Billy Beez is an indoor playground with lots of safe games and activities. The Play area has lots of big slides, wall climbing and games that even the older kids will enjoy.</p>', '<table class="mytable">\r\n<tbody>\r\n<tr>\r\n<td class="on">Entrance fee</td>\r\n<td class="on">100 LE per child</td>\r\n</tr>\r\n<tr>\r\n<td class="tw">Visiting Hours</td>\r\n<td class="tw">12 pm to 6pm</td>\r\n</tr>\r\n<tr>\r\n<td class="on">Traveling time</td>\r\n<td class="on">1 hour 15 mins</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><img src="uploads/bb1.jpg" alt="Billy" width="300" height="225" />Located inside Mall of Arabia, Billy Beez is an indoor playground with lots of safe games and activities. The Play area has lots of big slides, wall climbing and games that even the older kids will enjoy.</p>\r\n<p>The wait is finally over. Billy Beez is here and it&rsquo;s just the place you&rsquo;ve been looking for-a soft-<img src="uploads/bb2.jpg" alt="billy" width="300" height="225" />play adventure land of fun and fantasy for children ages three to twelve. Billy Beez is the ideal place for kids to burn off some energy after a hard day of school and homework. It&rsquo;s also the perfect place for celebrating a special occasion with friends and family.</p>\r\n<p>Whatever the reason for visiting Billy Beez, be prepared to have a blast!</p>\r\n<p>You can keep your kids playing in billy beez and start your shopping without any worries.</p>', 0, ',36', '0000-00-00', '0000-00-00', 0, '0000-00-00', '', 121, 0, '0000-00-00', '2015-03-20', 1, 0, 0, '', 'billy-beez.jpg', 'Billy-Beez', '', '', '', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `com_content_article_xref`
--

CREATE TABLE IF NOT EXISTS `com_content_article_xref` (
`id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=308 ;

--
-- Dumping data for table `com_content_article_xref`
--

INSERT INTO `com_content_article_xref` (`id`, `item_id`, `cat_id`, `delete`, `order`, `enabled`, `modified`, `created`) VALUES
(61, 58, 20, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 59, 20, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 46, 20, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 47, 19, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 47, 20, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 47, 21, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 38, 21, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 40, 20, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 48, 20, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 60, 20, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 39, 19, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 123, 23, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 41, 22, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 42, 22, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 43, 19, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 44, 24, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 61, 20, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 37, 19, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 45, 20, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 57, 20, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 50, 20, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 62, 24, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 63, 24, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 64, 24, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 65, 24, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 66, 24, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 67, 20, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 40, 22, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 71, 34, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 72, 19, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 73, 19, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 74, 19, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 75, 19, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 76, 19, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 77, 19, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 78, 19, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 79, 19, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 80, 19, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 81, 19, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 82, 19, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 83, 19, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 84, 19, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 85, 20, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 86, 20, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 87, 20, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 88, 20, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 89, 19, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 90, 19, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 91, 19, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 92, 20, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 92, 34, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 93, 20, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 94, 20, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 95, 20, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 96, 25, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 97, 25, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 98, 25, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 98, 34, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 97, 34, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 99, 25, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 99, 34, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 100, 25, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 100, 34, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 101, 25, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 101, 34, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, 102, 34, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, 102, 25, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 103, 34, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 104, 22, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 105, 22, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 106, 22, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 107, 22, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 108, 22, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, 109, 22, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 110, 22, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 111, 22, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 112, 22, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 113, 22, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, 114, 34, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 114, 26, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 115, 34, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, 115, 26, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, 116, 18, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, 117, 18, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, 118, 18, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, 119, 18, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(172, 120, 18, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, 121, 18, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, 122, 22, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, 125, 18, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, 126, 18, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, 128, 22, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, 129, 19, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, 130, 18, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, 131, 20, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, 132, 18, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, 133, 19, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, 134, 18, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, 135, 19, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, 136, 19, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, 137, 19, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, 138, 19, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, 139, 19, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, 140, 18, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, 141, 18, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, 142, 18, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, 143, 18, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, 144, 18, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, 145, 18, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, 146, 18, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, 147, 18, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, 148, 22, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, 149, 22, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(204, 150, 20, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(212, 151, 35, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(206, 157, 35, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(207, 156, 35, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, 155, 35, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(209, 154, 35, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(210, 153, 35, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(211, 152, 35, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(226, 159, 36, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(225, 161, 36, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(215, 171, 36, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(216, 170, 36, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(217, 169, 36, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(218, 168, 36, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(219, 167, 36, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(220, 166, 36, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(221, 165, 36, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(222, 164, 36, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(223, 163, 36, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(224, 162, 36, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(274, 172, 36, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(265, 173, 36, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(273, 174, 36, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(230, 175, 37, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(272, 176, 36, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(271, 177, 36, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(270, 178, 36, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(234, 179, 37, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(235, 180, 37, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(236, 182, 37, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(266, 183, 36, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(264, 184, 36, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(267, 185, 36, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(269, 186, 36, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(263, 187, 36, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(276, 188, 36, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(243, 189, 37, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(306, 190, 38, 0, 0, 1, '0000-00-00 00:00:00', '2015-03-25 15:15:15'),
(305, 191, 38, 0, 0, 1, '0000-00-00 00:00:00', '2015-03-25 15:15:02'),
(279, 240, 35, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(288, 226, 36, 0, 0, 1, '0000-00-00 00:00:00', '2015-03-20 18:00:54'),
(299, 2, 36, 0, 0, 1, '0000-00-00 00:00:00', '2015-03-20 18:11:52'),
(284, 224, 36, 0, 0, 1, '0000-00-00 00:00:00', '2015-03-20 17:52:50'),
(285, 213, 36, 0, 0, 1, '0000-00-00 00:00:00', '2015-03-20 17:54:39'),
(286, 223, 36, 0, 0, 1, '0000-00-00 00:00:00', '2015-03-20 17:55:56'),
(287, 225, 36, 0, 0, 1, '0000-00-00 00:00:00', '2015-03-20 17:57:21'),
(290, 218, 36, 0, 0, 1, '0000-00-00 00:00:00', '2015-03-20 18:02:34'),
(292, 216, 36, 0, 0, 1, '0000-00-00 00:00:00', '2015-03-20 18:04:54'),
(293, 214, 36, 0, 0, 1, '0000-00-00 00:00:00', '2015-03-20 18:05:48'),
(300, 232, 38, 0, 0, 1, '0000-00-00 00:00:00', '2015-03-25 15:13:59'),
(302, 231, 38, 0, 0, 1, '0000-00-00 00:00:00', '2015-03-25 15:14:13'),
(303, 202, 38, 0, 0, 1, '0000-00-00 00:00:00', '2015-03-25 15:14:41'),
(304, 203, 38, 0, 0, 1, '0000-00-00 00:00:00', '2015-03-25 15:14:51'),
(307, 160, 38, 0, 0, 1, '0000-00-00 00:00:00', '2015-03-25 15:15:37');

-- --------------------------------------------------------

--
-- Table structure for table `com_content_catgories`
--

CREATE TABLE IF NOT EXISTS `com_content_catgories` (
`id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `created` datetime NOT NULL,
  `order` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `des` text NOT NULL,
  `alias` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `com_content_catgories`
--

INSERT INTO `com_content_catgories` (`id`, `title`, `image`, `enabled`, `created`, `order`, `modified`, `delete`, `cat_id`, `des`, `alias`) VALUES
(35, 'test', '', 1, '2013-04-16 07:54:06', 1, '2013-04-16 00:00:00', 0, 0, '', 'test'),
(36, 'Cairo', '', 1, '2013-04-17 06:06:01', 2, '2015-04-02 12:08:39', 0, 39, '', 'Cairo'),
(37, 'Outside Cairo', '', 1, '2013-05-28 13:11:57', 3, '0000-00-00 00:00:00', 0, 0, '', 'Outside-Cairo'),
(38, 'Home Packages', '52c4766bf02e6.jpg', 1, '2014-01-01 13:11:24', 4, '2015-03-25 15:13:15', 0, 0, '', 'Home-Packages'),
(39, 'Egypt At A Glance', '', 1, '2015-04-02 12:08:20', 5, '0000-00-00 00:00:00', 0, 0, '', 'Egypt-At-A-Glance'),
(40, 'Outside Cairo', '', 1, '2015-04-02 12:08:59', 2, '2015-04-02 13:02:35', 0, 39, '', 'Outside-Cairo'),
(41, 'Ziarats', '', 1, '2015-04-02 12:09:06', 2, '2015-04-02 13:03:04', 0, 39, '', 'Ziarats');

-- --------------------------------------------------------

--
-- Table structure for table `com_data`
--

CREATE TABLE IF NOT EXISTS `com_data` (
`id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `des` text NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `data` text NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `com_dumpsters`
--

CREATE TABLE IF NOT EXISTS `com_dumpsters` (
`id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `value` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `com_events`
--

CREATE TABLE IF NOT EXISTS `com_events` (
`id` int(11) NOT NULL,
  `des` text NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `imagegallery` int(11) NOT NULL,
  `vediogallery` int(11) NOT NULL,
  `date` date NOT NULL,
  `cat_id` text NOT NULL,
  `time` time NOT NULL,
  `users` text NOT NULL,
  `th_image` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=ucs2 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `com_events`
--

INSERT INTO `com_events` (`id`, `des`, `title`, `enabled`, `delete`, `order`, `created`, `modified`, `imagegallery`, `vediogallery`, `date`, `cat_id`, `time`, `users`, `th_image`, `alias`) VALUES
(1, '<p>تناتن لالا تننمتنم البل عغع بيبليء</p>', 'بطولة كاس مصر', 1, 0, 14, '2013-04-01 14:11:55', '2013-04-13 00:00:00', 44, 28, '2013-04-10', '1', '10:50:00', ';1__نادى الاهلى;2__نادى الاسماعيلى', '5169499855974.gif', 'بطولة-كاس-مصر'),
(2, '', '', 1, 1, 15, '2013-04-01 16:42:12', '0000-00-00 00:00:00', 0, 0, '0000-00-00', '', '00:00:00', ';a__a;c__c;b__b', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `com_events_categories`
--

CREATE TABLE IF NOT EXISTS `com_events_categories` (
`id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `created` datetime NOT NULL,
  `order` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `des` text NOT NULL,
  `alias` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `com_events_categories`
--

INSERT INTO `com_events_categories` (`id`, `title`, `image`, `enabled`, `created`, `order`, `modified`, `delete`, `cat_id`, `des`, `alias`) VALUES
(1, 'football-events', '', 1, '2013-04-01 14:06:37', 1, '2013-04-06 00:00:00', 0, 0, '', 'football-events');

-- --------------------------------------------------------

--
-- Table structure for table `com_events_xref`
--

CREATE TABLE IF NOT EXISTS `com_events_xref` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL DEFAULT '0',
  `item_id` int(11) NOT NULL,
  `cat_id` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `com_events_xref`
--

INSERT INTO `com_events_xref` (`id`, `created`, `modified`, `enabled`, `order`, `delete`, `item_id`, `cat_id`) VALUES
(3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `com_faq`
--

CREATE TABLE IF NOT EXISTS `com_faq` (
`id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `cat_id` text NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=62 ;

--
-- Dumping data for table `com_faq`
--

INSERT INTO `com_faq` (`id`, `question`, `answer`, `enabled`, `delete`, `order`, `created`, `modified`, `cat_id`, `title`) VALUES
(42, 'Why was there no electricity in the room when I entered?', 'That is because you have to insert the plastic keychain in the slit on the left or right side wall of your room in order to activate electricity supply.', 1, 0, 22224, '2014-02-25 16:06:51', '2015-03-25 16:00:13', '2', 'Why was there no electricity in the room when I entered?'),
(41, 'What currency shall we bring to Cairo for Lawazimaat and other expenses?', 'US Dollars is best. Indian and Pakistani rupees are not accepted at all, so better to bring USD to avoid problems.', 1, 0, 22223, '2014-02-25 16:03:28', '2015-03-25 15:58:59', '2', 'What currency shall we bring to Cairo for Lawazimaat and other expenses?'),
(43, 'What shall I do if i have plan of having lunch or dinner outside Faiz?', 'Zuwwar office should be informed to avoid food wastage, or at least kitchen should be informed.', 1, 0, 22225, '2014-02-25 16:08:30', '2015-03-25 16:00:36', '2', 'What shall I do if i have plan of having lunch or dinner outside Faiz?'),
(44, 'What is the standard package of Faiz e Haakimi?', 'Four nights and 5th day departure for $320, which will include the following: a) Raas Al Imam Al Husain (AS). b) Moulatuna Zainab (AS). c) Moulatuna Ruqaiyyah (AS). d) Moulatuna Nafisa (AS). e) Moulana Mohammed bin Abibakr (RA). f) Moulana Malik ul Ashtar (RA). g) Syedi Muqaddas Yusuf BS Najmuddin (QR). h) Jame Anwar. i) Jame Azhar. j) Jame Aqmar. k) Jame Lulua. l) Jame Juyushi, (subject to permission). m) Jame Ateeq. n) Jame Ibn e Tuloon.', 1, 0, 22226, '2014-02-25 16:09:25', '2015-03-25 16:01:17', '2', 'What is the standard package of Faiz e Haakimi?'),
(45, 'Where can I get a local sim card for my mobile?', 'Zuwwar office can help you get a local sim.', 1, 0, 22227, '2014-02-25 16:10:02', '2015-03-25 16:02:12', '0', 'Where can I get a local sim card for my mobile?'),
(46, 'What should I do if I want to stay at Faiz in my trip to Cairo?', 'You must fill the reservation form at www.faizehaakimi.com. Prior information must be given to Faiz before your arrival.', 1, 0, 22228, '2014-03-17 11:25:28', '2015-03-25 16:02:45', '0', 'What should I do if I want to stay at Faiz in my trip to Cairo?'),
(47, 'Is there any route map available for convenience?', 'Mehman can get route map from the Faiz Reception.', 1, 0, 22229, '2014-03-17 11:25:47', '2015-03-25 16:03:16', '0', 'Is there any route map available for convenience?'),
(48, 'Can we get Salaam Hafti from Faiz?', 'Yes, you can get it from the Reception with the request to kindly return it before departing.', 1, 0, 22230, '2014-03-17 11:26:28', '2015-03-25 16:06:01', '0', 'Can we get Salaam Hafti from Faiz?'),
(49, 'How can we make arrangements to visit the tourist sites?', 'If you are interested in any program, Zuwwar office will assist you and will arrange a relaxing trip for you and your family.', 1, 0, 22231, '2014-03-17 11:26:53', '2015-03-25 16:08:56', '2', 'How can we make arrangements to visit the tourist sites?'),
(50, 'Are there any tourist sites around Cairo worth visiting?', 'Many resorts and beaches, Alexandria and Sharm e Shaikh are worth visiting, Zuwwar office will be ready to help for any further information.', 1, 0, 22232, '2014-03-17 11:27:15', '2015-03-25 16:08:15', '2', 'Are there any tourist sites around Cairo worth visiting?'),
(51, 'What are the recommended places for shopping?', 'Khan el khalili bazaar is good place for oriental and antiques, City Stars for shopping and entertainment like movies and restaurants.', 1, 0, 22233, '2014-03-17 11:28:09', '2015-03-25 16:12:55', '2', 'What are the recommended places for shopping?'),
(52, 'Is it allowed to take food from Mawaid to the rooms?', 'It is strictly prohibited.', 1, 0, 22234, '2014-03-17 11:28:40', '2015-03-25 16:13:25', '2', 'Is it allowed to take food from Mawaid to the rooms?'),
(53, 'Is tea available at all times in Mawaid?', 'Tea is available after every meal.', 1, 0, 22235, '2014-03-17 11:29:10', '2015-03-25 16:13:58', '2', 'Is tea available at all times in Mawaid?'),
(54, 'Can we pray Namaz by Imamat in Jame-ul-Anwar?', 'Fajr Namaz is prayed by imamat everyday, Mehmans can go walking for namaz.', 1, 0, 22236, '2014-03-17 11:29:38', '2015-03-25 16:15:31', '2', 'Can we pray Namaz by Imamat in Jame-ul-Anwar?'),
(55, 'What is the distance of Jame-ul-Anwar from Faiz?', 'Its a 15 min walk and a taxi will take LE 3 to 5. Its a nice walk early morning or at night.', 1, 0, 22237, '2014-03-17 11:30:03', '2015-03-25 16:31:30', '2', 'What is the distance of Jame-ul-Anwar from Faiz?'),
(56, 'What are the charges for Laundry service and does it wash all clothing?', 'Yes, all clothing are washed in laundry and the price list is kept in each room.', 1, 0, 22238, '2014-03-17 11:30:25', '2015-03-25 16:21:16', '0', 'What are the charges for Laundry service and does it wash all clothing?'),
(57, 'What is the climate in Cairo and what type of clothing is required?', 'It is really cold from December ', 1, 0, 22239, '2014-04-08 09:22:21', '2015-03-25 16:38:38', '2', 'What is the climate in Cairo and what type of clothing is required?'),
(58, 'What is the distance from the airport to faiz, and what are the average taxi charges?', 'It is a 15 min walk and a taxi will take LE 3 to 5. Its a nice walk early morning or at night.\r\n', 1, 0, 22240, '2014-04-08 09:22:40', '2015-03-25 16:38:33', '2', 'What is the distance from the airport to faiz, and what are the average taxi charges?'),
(59, 'How can we get visit visa for Cairo?', 'Please refer to the Intructions to Mumineen Page.', 1, 0, 22241, '2014-04-08 09:23:00', '2015-03-25 16:38:27', '2', 'How can we get visit visa for Cairo?'),
(60, 'Is there a money exchange facility available in Faiz?', 'Not yet, but you can get exchange from money exchange', 1, 0, 22242, '2015-03-25 16:39:01', '0000-00-00 00:00:00', '2', 'Is there a money exchange facility available in Faiz?'),
(61, 'How can we make international calls from Faiz?', 'International calling service is available at the reception @ LE 7/min to any destination.', 1, 0, 22243, '2015-03-25 16:39:23', '0000-00-00 00:00:00', '2', 'How can we make international calls from Faiz?');

-- --------------------------------------------------------

--
-- Table structure for table `com_faq_categories`
--

CREATE TABLE IF NOT EXISTS `com_faq_categories` (
`id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `des` text CHARACTER SET utf8 NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `com_faq_categories`
--

INSERT INTO `com_faq_categories` (`id`, `title`, `des`, `image`, `created`, `enabled`, `delete`, `order`, `modified`) VALUES
(2, 'Faiz FAQs', '', '532db2107f962.png', '2014-02-25 16:01:34', 1, 0, 1, '2015-03-25 15:59:17');

-- --------------------------------------------------------

--
-- Table structure for table `com_fiz_users`
--

CREATE TABLE IF NOT EXISTS `com_fiz_users` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `group` int(11) NOT NULL,
  `fb_id` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `mobile_confirm` tinyint(4) NOT NULL,
  `mobile_confirm_code` text NOT NULL,
  `Mumin_id` varchar(50) NOT NULL,
  `FullName` varchar(250) NOT NULL,
  `First_name` varchar(50) NOT NULL,
  `Middle_Prefix` varchar(50) NOT NULL,
  `Middle_Name` varchar(250) NOT NULL,
  `Surname` varchar(250) NOT NULL,
  `Age` varchar(10) NOT NULL,
  `MOBILE_NO` varchar(50) NOT NULL,
  `Age1` varchar(50) NOT NULL,
  `Jamaat` varchar(250) NOT NULL,
  `Jamiaat` varchar(250) NOT NULL,
  `dob` varchar(50) NOT NULL,
  `prefix` varchar(250) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=204 ;

--
-- Dumping data for table `com_fiz_users`
--

INSERT INTO `com_fiz_users` (`id`, `created`, `modified`, `enabled`, `delete`, `order`, `phone`, `image`, `group`, `fb_id`, `mobile`, `city`, `area`, `country`, `gender`, `mobile_confirm`, `mobile_confirm_code`, `Mumin_id`, `FullName`, `First_name`, `Middle_Prefix`, `Middle_Name`, `Surname`, `Age`, `MOBILE_NO`, `Age1`, `Jamaat`, `Jamiaat`, `dob`, `prefix`, `user_id`) VALUES
(3, '2012-03-21 00:00:00', '2015-03-20 16:27:54', 1, 0, 0, 'g', '52c03abbbd3a9.png', 0, '', '01010666917', '', '', '', '', 1, '19858', '', '', '', '', '', '', '', '', '', '', '', '', '0', 0),
(151, '2014-05-07 06:33:15', '0000-00-00 00:00:00', 1, 0, 0, NULL, '1399465995_', 0, '', '', '', '', '', 'male', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '0', 0),
(150, '2014-05-07 06:32:08', '0000-00-00 00:00:00', 1, 0, 0, NULL, '1399465928_', 0, '', '', '', '', '', 'female', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '0', 0),
(148, '2014-05-07 06:28:07', '0000-00-00 00:00:00', 1, 0, 0, NULL, '1399465687_', 0, '', '', '', '', '', 'male', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '0', 0),
(149, '2014-05-07 06:30:49', '0000-00-00 00:00:00', 1, 0, 0, NULL, '1399465849_', 0, '', '01010666918', '', '', '', 'male', 1, '89300', '', '', '', '', '', '', '', '', '', '', '', '', '0', 0),
(140, '2014-05-07 04:57:15', '0000-00-00 00:00:00', 0, 0, 0, NULL, NULL, 0, '690193676', '', '', '', '', 'male', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '0', 0),
(147, '2014-05-07 06:25:54', '0000-00-00 00:00:00', 1, 0, 0, NULL, '1399465554_', 0, '', '', '', '', '', 'male', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '0', 0),
(146, '2014-05-07 06:13:11', '0000-00-00 00:00:00', 1, 0, 0, NULL, '1399464791_', 0, '', '', '', '', '', 'male', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '0', 0),
(144, '2014-05-07 06:02:24', '0000-00-00 00:00:00', 1, 0, 0, NULL, '1399464144_', 0, '', '', '', '', '', 'male', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '0', 0),
(145, '2014-05-07 06:07:03', '0000-00-00 00:00:00', 1, 0, 0, NULL, '1399464423_', 0, '', '', '', '', '', 'male', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '0', 0),
(152, '2014-05-07 06:34:35', '0000-00-00 00:00:00', 0, 0, 0, NULL, NULL, 0, '100000467417166', '01222489051', '', '', '', 'male', 1, '78463', '', '', '', '', '', '', '', '', '', '', '', '', '0', 0),
(161, '2014-06-03 17:10:30', '2015-03-20 12:42:02', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30385155', 'Zainab bai Shaikh Hatim bhai Ghotawala', 'Zainab', 'Shaikh ', 'Hatim ', 'Ghotawala', '62', '918696160606', '62', 'Partabgarh_Jamaat', 'Rampura', '06 May 1952 ', '0', 0),
(160, '0000-00-00 00:00:00', '2015-04-02 10:33:17', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '30385154', '16dasdasd0', 'Aziz', 'Shaikh', 'Mohammed', 'Shakir ( vasi )', '32', '201222489051', '32', 'Cairo_Jamaat', 'Al-Khaleej', '23 Aug 1982 ', 'Mulla', 160),
(162, '0000-00-00 00:00:00', '2015-03-20 13:32:15', 0, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '30355789', 'Taha bhai  Mustafa bhai Wadia', 'Taha', '', 'Mustafa', 'Wadia', '18', '+201228799330', '18', 'Cairo_Jamaat', 'Al-Khaleej', '30 Sep 1996 ', '0', 0),
(163, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '30355993', 'Mufaddal bhai Mulla Aziz bhai Shakir ( vasi )', 'Mufaddal', 'Mulla', 'Aziz', 'Shakir ( vasi )', '4', '+20122489051', '4', 'Cairo_Jamaat', 'Al-Khaleej', '31 Aug 2009 ', '0', 0),
(164, '2014-06-29 06:56:16', '2014-06-29 06:57:55', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '78652180', 'Saleh bs Abilfazal bs Husami', 'Saleh', 'Shaikh', 'Abilfazal', 'Husami', '31', '', '31', 'Qa_Jamaat', 'Mumbai', '02 Jan 1983 ', '0', 0),
(165, '2014-07-22 14:29:30', '2015-03-20 14:41:09', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30385152', 'Tasneem bai  Moiz bhai Motiwala', 'Tasneem', ' ', 'Moiz ', 'Motiwala', '26', '+971503845472', '26', 'Dubai_Jamaat', 'Al-Khaleej', '08 Apr 1988 ', '0', 0),
(166, '2014-07-23 16:32:01', '0000-00-00 00:00:00', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30385153', 'Farida bai  Mustafa bhai Dalal', 'Farida', ' ', 'Mustafa ', 'Dalal', '47', '+971507650681', '47', 'Dubai_Jamaat', 'Al-Khaleej', '11 Jan 1967 ', '0', 0),
(167, '2014-07-23 16:34:12', '2015-03-20 13:50:52', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '30385150', 'Abbas bhai Shaikh Shabbirhusain bhai Sadriwala', 'Abbas', 'Shaikh', 'Shabbirhusain', 'Sadriwala', '28', '+971503504786', '28', 'Dubai_Jamaat', 'Al-Khaleej', '27 Oct 1986 ', '0', 0),
(168, '2014-07-23 20:13:57', '2015-03-20 13:50:03', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '20322202', 'Shaikh Mohammed bhai  Abid bhai Shakir ( vasi )', 'Mohammed', '', 'Abid', 'Shakir ( vasi )', '69', '+971506761525', '69', 'Dubai_Jamaat', 'Al-Khaleej', '07 Aug 1945 ', 'Shaikh', 0),
(169, '2014-07-23 20:20:03', '2014-07-25 06:05:37', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30387405', 'Mulla Rashida bai  Rashida bhai Shakir ( vasi )', 'Rashida', ' ', ' ', 'Shakir ( vasi )', '62', '+971503557882', '62', 'Dubai_Jamaat', 'Al-Khaleej', '08 Jun 1952 ', 'Mulla', 0),
(170, '2014-07-24 16:34:47', '2014-07-24 16:37:29', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '30385151', 'Mulla Abdulqadir bhai Shaikh Juzer bhai Hamidi', 'Abdulqadir', 'Shaikh', 'Juzer', 'Hamidi', '27', '+971551287652', '27', 'Dubai_Jamaat', 'Al-Khaleej', '14 Apr 1987 ', 'Mulla', 0),
(171, '2014-07-25 05:39:47', '2015-03-20 13:50:26', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '20322201', 'Saifuddin bhai  Mansoor bhai Tarwala', 'Saifuddin', '', 'Mansoor', 'Tarwala', '40', '+919377718873', '40', 'Jeddah_Jamaat', 'Al-Khaleej', '03 Sep 1974 ', '', 0),
(172, '2014-07-25 05:52:34', '0000-00-00 00:00:00', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '20322203', 'Saifuddin bhai  Asgarali bhai Diwan', 'Saifuddin', '', 'Asgarali', 'Diwan', '41', '', '41', 'Dubai_Jamaat', 'Al-Khaleej', '19 Sep 1972 ', '', 0),
(173, '2014-07-31 18:57:44', '2014-08-01 21:55:14', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '20322205', 'Mustafa bhai  Abbas bhai Hydrabad wala', 'Mustafa', '', 'Abbas', 'Hydrabad wala', '37', '+971506502095', '37', 'Dubai_Jamaat', 'Al-Khaleej', '10 Jul 1977 ', '', 0),
(174, '2014-07-31 18:58:48', '0000-00-00 00:00:00', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '20322206', 'Zohair bhai  Shiraz bhai Lokhandwala', 'Zohair', '', 'Shiraz', 'Lokhandwala', '67', '+971504581406', '67', 'Dubai_Hakimi', 'Al-Khaleej', '11 Apr 1947 ', '', 0),
(175, '2014-07-31 18:59:06', '0000-00-00 00:00:00', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '20322208', 'Mulla Abbas bhai  Yusuf bhai Hamid', 'Abbas', '', 'Yusuf', 'Hamid', '68', '+971506760251', '68', 'Dubai_Jamaat', 'Al-Khaleej', '14 Jun 1946 ', 'Mulla', 0),
(176, '2014-08-16 09:45:22', '2015-03-20 13:50:40', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30385156', 'Munira bai Shaikh Aliasgar bhai Jawadwala', 'Munira', 'Shaikh ', 'Aliasgar ', 'Jawadwala', '42', '+971506539150', '42', 'Dubai_Jamaat', 'Al-Khaleej', '25 Apr 1972 ', '', 0),
(177, '2014-08-16 09:46:52', '2015-03-20 13:50:47', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '30385158', 'Burhanuddin bhai Mulla Mustafa bhai Nasikwala', 'Burhanuddin', 'Mulla', 'Mustafa', 'Nasikwala', '14', '+971501914082', '14', 'Dubai_Jamaat', 'Al-Khaleej', '01 Aug 2000 ', '', 0),
(178, '2014-08-18 05:56:58', '2014-08-18 08:52:41', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '30355522', 'Mufaddal bhai Shaikh Ilyas bhai Shehabi', 'Mufaddal', 'Shaikh', 'Ilyas', 'Shehabi', '27', '+201224211510', '27', 'Cairo_Jamaat', 'Al-Khaleej', '10 May 1987 ', '', 0),
(179, '2014-08-18 06:00:27', '2014-08-18 06:36:08', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '30355523', 'Murtaza bhai Shaikh Ilyas bhai Shehabi', 'Murtaza', 'Shaikh', 'Ilyas', 'Shehabi', '22', '+201225285192', '22', 'Cairo_Jamaat', 'Al-Khaleej', '07 May 1992 ', '', 0),
(180, '2014-08-18 06:53:59', '2014-08-18 06:59:11', 0, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '30355786', 'Huzaifa bhai Shaikh Mustafa bhai Kasimji', 'Huzaifa', 'Shaikh', 'Mustafa', 'Kasimji', '18', '+201222148734', '18', 'Cairo_Jamaat', 'Al-Khaleej', '06 Dec 1995 ', '', 0),
(181, '2014-08-18 06:56:18', '0000-00-00 00:00:00', 0, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30355785', 'Fatema bai Shaikh Mustafa bhai Kasimji', 'Fatema', 'Shaikh', 'Mustafa', 'Kasimji', '20', '+201222148734', '20', 'Cairo_Jamaat', 'Al-Khaleej', '30 Jan 1994 ', '', 0),
(182, '2014-08-18 06:56:27', '0000-00-00 00:00:00', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30355784', 'Tasneem bai Shaikh Mustafa bhai Kasimji', 'Tasneem', 'Shaikh ', 'Mustafa ', 'Kasimji', '43', '+201222148734', '43', 'Cairo_Jamaat', 'Al-Khaleej', '20 Jul 1971 ', '', 0),
(183, '2014-08-19 05:35:15', '2014-08-19 05:35:57', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '30355667', 'Husain bhai Shaikh Shabbir bhai Vajihi', 'Husain', 'Shaikh', 'Shabbir', 'Vajihi', '26', '+201224261370', '26', 'Cairo_Jamaat', 'Al-Khaleej', '02 Nov 1987 ', '', 0),
(184, '2014-08-19 05:36:12', '0000-00-00 00:00:00', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30355669', 'Khadija bai Mulla Qusai bhai Hamidi (sunelwala)', 'Khadija', 'Mulla ', 'Qusai ', 'Hamidi (sunelwala)', '30', '+919167855766', '30', 'Dubai_Jamaat', 'Al-Khaleej', '11 Feb 1984 ', '', 0),
(185, '2014-08-19 05:36:46', '0000-00-00 00:00:00', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30355670', 'Ummehani bai Shaikh Shabbir bhai Vajihi', 'Ummehani', 'Shaikh', 'Shabbir', 'Vajihi', '21', '+201094521952', '21', 'Cairo_Jamaat', 'Al-Khaleej', '07 Dec 1992 ', '', 0),
(186, '2015-03-20 13:50:59', '2015-03-20 17:16:40', 0, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '30385160', 'Mustaali bhai Shaikh Aliasgar bhai Jawadwala', 'Mustaali', 'Shaikh', 'Aliasgar', 'Jawadwala', '18', '918238710669', '18', 'Surat_Jamea', 'Surat', '28 Sep 1996 ', '', 0),
(187, '2015-03-20 14:39:58', '0000-00-00 00:00:00', 0, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30385052', 'Fatema bai Mulla Zohair bhai Jawadwala', 'Fatema', 'Mulla', 'Zohair', 'Jawadwala', '12', '+971507780051', '12', 'Dubai_Jamaat', 'Al-Khaleej', '06 May 2002 ', '', 0),
(188, '2015-03-20 14:41:27', '0000-00-00 00:00:00', 0, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30375452', 'Tasneem bai  Qaidjohar bhai Burhani', 'Tasneem', ' ', 'Qaidjohar ', 'Burhani', '51', '+919850698887', '51', 'Pune_Burhani', 'Pune', '03 Oct 1963 ', '', 0),
(189, '2015-03-20 14:42:07', '2015-03-20 15:53:42', 0, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30375252', 'Zahra bai  Taher bhai Gheewala', 'Zahra', '', 'Fidahusain', 'Gheewala', '90', '', '90', 'Pune_Burhani', 'Pune', '23 Feb 1925 ', '', 0),
(190, '2015-03-20 14:52:47', '0000-00-00 00:00:00', 0, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '20321208', 'Rashida bai  Abidali bhai Ghadiyali', 'Rashida', ' ', 'Abidali ', 'Ghadiyali', '50', '+919928279269', '50', 'Banswara_Badri', 'Taherabad', '17 Aug 1964 ', '', 0),
(191, '2015-03-20 14:55:37', '0000-00-00 00:00:00', 0, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30315167', 'Nafisa bai  Hatim bhai Tajani', 'Nafisa', ' ', 'Hatim ', 'Tajani', '51', '+919664907864', '51', 'Bombay_Hashemi', 'Mumbai', '15 Sep 1963 ', '', 0),
(192, '2015-03-20 15:57:02', '0000-00-00 00:00:00', 0, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '30385161', 'Lamak bhai Shaikh Aliasgar bhai Jawadwala', 'Lamak', 'Shaikh', 'Aliasgar', 'Jawadwala', '20', '+971551878633', '20', 'Dubai_Jamaat', 'Al-Khaleej', '21 May 1994 ', '', 0),
(193, '2015-03-20 16:58:18', '0000-00-00 00:00:00', 0, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30387160', 'Sarrah bai Shaikh Mustafa bhai Saasa', 'Sarrah', 'Shaikh', 'Mustafa', 'Saasa', '19', '+971508579566', '19', 'Dubai_Jamaat', 'Al-Khaleej', '11 Nov 1995 ', '', 0),
(194, '2015-03-20 16:58:43', '2015-03-20 17:49:15', 0, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30385760', 'Rashida bai  Shabbirali bhai Lokhandwala', 'Rashida', ' ', 'Shabbirali ', 'Lokhandwala', '35', '+971506881869', '35', 'Dubai_Jamaat', 'Al-Khaleej', '08 Nov 1979 ', '', 0),
(195, '2015-03-20 17:04:50', '0000-00-00 00:00:00', 0, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30385177', 'Rashida bai  Shabbar bhai Mala', 'Rashida', ' ', 'Shabbar ', 'Mala', '44', '+971506500850', '44', 'Dubai_Hakimi', 'Al-Khaleej', '14 Dec 1970 ', '', 0),
(196, '2015-03-20 17:06:59', '0000-00-00 00:00:00', 0, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '30385192', 'Husain bhai Mulla Shabbir bhai Adenwala', 'Husain', 'Mulla', 'Shabbir', 'Adenwala', '33', '+971554525335', '33', 'Dubai_Jamaat', 'Al-Khaleej', '18 Jun 1981 ', '', 0),
(197, '2015-03-20 17:08:38', '2015-03-20 17:12:08', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30385195', 'Bilqis bai Shaikh Zainuddin bhai Shujaei', 'Bilqis', 'Shaikh ', 'Zainuddin ', 'Shujaei', '64', '+971501892597', '64', 'Dubai_Jamaat', 'Al-Khaleej', '24 Apr 1950 ', '', 0),
(198, '2015-03-20 17:11:07', '0000-00-00 00:00:00', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30385143', 'Maimuna bai  Yusuf bhai Contractor', 'Maimuna', '', 'Hasan', 'Contractor', '85', '+971508778010', '85', 'Houston_Jamaat', 'USA', '15 Mar 1930 ', '', 0),
(199, '2015-03-20 17:14:28', '0000-00-00 00:00:00', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '30384160', 'Mohammed bhai Shaikh Zohair bhai Mukadam', 'Mohammed', 'Shaikh', 'Zohair', 'Mukadam', '17', '+917767845753', '17', 'Abudhabi_Jamaat', 'Al-Khaleej', '12 Apr 1997 ', '', 0),
(200, '2015-03-20 17:14:47', '0000-00-00 00:00:00', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '30383160', 'Aziz bhai  Shabbir bhai Bootwala', 'Aziz', '', 'Shabbir', 'Bootwala', '18', '', '18', 'Ratlam_Burhani', 'Ujjain', '16 Aug 1996 ', '', 0),
(201, '2015-03-20 17:17:09', '2015-03-20 17:17:27', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30385197', 'Rashida bai Shaikh Juzer bhai Berberawala', 'Rashida', 'Shaikh ', 'Juzer ', 'Berberawala', '59', '+971504224148', '59', 'Dubai_Jamaat', 'Al-Khaleej', '19 Apr 1955 ', '', 0),
(202, '2015-03-20 17:17:34', '0000-00-00 00:00:00', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '30385198', 'Moiz bhai  Shabbir bhai Doodhwala', 'Moiz', '', 'Shabbir', 'Doodhwala', '32', '+447948289929', '32', 'Manchester_Jamaat', 'UK', '14 Apr 1982 ', '', 0),
(203, '2015-03-29 17:52:54', '2015-03-29 21:36:49', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', '', 0, '', '160', '16dasdasd0', '', '', '', '', '', '', '', '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `com_form`
--

CREATE TABLE IF NOT EXISTS `com_form` (
`id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `des` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `data` text NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `com_form`
--

INSERT INTO `com_form` (`id`, `title`, `des`, `modified`, `created`, `enabled`, `order`, `delete`, `data`) VALUES
(1, 'Madad-Checkout', 0, '2015-03-30 12:11:59', '2013-04-22 12:52:51', 1, 0, 0, 'stepid=>s1__steporder=>1__steptitle=>Setp-s1__|typeID=>T13__type=>label__name=>__class=>h3 bb toclear__title=>@%lang::payTitle%@__widthmode=>_100__moreAttra=>__;typeID=>T10__type=>hidden__name=>payTitle__class=>COLabel payTitle__widthmode=>_100__value=>@%lang::payTitle%@__moreAttra=>__;typeID=>T2__type=>form__name=>Madad-Checkout__class=>Madad-Checkout__class=>Madad-Checkout__saveType=>sesstion__saveTo=>Madad-Checkout__SMsg=>aaaaa__FMsg=>__javascript=>__css=>__php=>__phpAfterSave=>__moreAttra=>data-name%3D%22dddddd%22__;typeID=>T8__type=>div__name=>rightform__class=>rightform__moreactions=>-1__moreAttra=>__;typeID=>T3__type=>text__name=>name__class=>name__title=>@%lang::name%@__widthmode=>_100__required=>required__moreAttra=>value%3D%22%40%25session%3A%3AMadad-Checkout.name%25%40%22__;typeID=>T4__type=>email__name=>email__class=>email__title=>@%lang::email%@__widthmode=>_100__required=>required__moreAttra=>value%3D%22%40%25session%3A%3AMadad-Checkout.email%25%40%22%20readonly__;typeID=>T7__type=>select__name=>country__class=>country__title=>@%lang::country%@__widthmode=>_100__select_type=>data__select_data=>__select_text=>%D9%85%D8%B5%D8%B1__select_value=>egypt__value=>egypt__depend_on=>__depend_source=>__moreAttra=>__;typeID=>T5__type=>select__name=>city__class=>city__title=>@%lang::city%@__widthmode=>_100__required=>required__select_type=>XML__select_data=>http://fiz.qlegal.net/lib/xml/egstates_checkout_ar.xml__select_text=>egstates__select_value=>__value=>@%session::Madad-Checkout.city%@__depend_on=>__depend_source=>__moreAttra=>__;typeID=>T10__type=>select__name=>area__class=>area__title=>@%lang::area%@__widthmode=>_100__required=>required__select_type=>__select_data=>__select_text=>__select_value=>__value=>@%session::Madad-Checkout.area%@__depend_on=>city__depend_source=>xml__moreAttra=>__;typeID=>T8__type=>hidden__name=>donations__class=>donations__widthmode=>_100__value=>%@session::donations@%__moreAttra=>__;typeID=>T9__type=>endDiv__;||stepid=>s1__steporder=>2__steptitle=>payment-choices__|typeID=>T2__type=>div__name=>payment-choices__class=>payment-choices __moreactions=>-1__moreAttra=>__;typeID=>T8__type=>label__name=>__class=>COLabel choice-label toclear h3 bb__title=>@%lang::choice-label%@__widthmode=>_100__moreAttra=>__;typeID=>T7__type=>hidden__name=>choice-label__class=>COLabel choice-label__widthmode=>_100__value=>@%lang::choice-selected%@__moreAttra=>__;typeID=>T3__type=>radio__name=>pay-choice__class=>COD__title=>@%lang::pay-chioce-COD%@__widthmode=>_100__value=>COD__moreAttra=>__;typeID=>T8__type=>hidden__name=>COD__class=>COD__widthmode=>_100__value=>@%lang::pay-chioce-COD%@__moreAttra=>__;typeID=>T1__type=>radio__name=>pay-choice__class=>collection-point__title=>@%lang::pay-chioce-collection-point%@__widthmode=>_100__value=>collection-point__moreAttra=>__;typeID=>T9__type=>hidden__name=>pay-chioce-collection-point__class=>pay-chioce-collection-point__widthmode=>_100__value=>@%lang::pay-chioce-collection-point%@__moreAttra=>__;typeID=>T9__type=>label__name=>__class=>COD-msg h6 red RedLabel__title=>@%lang::COD-msg%@__widthmode=>_100__moreAttra=>__;typeID=>T4__type=>endDiv__;||stepid=>s1__steporder=>3__steptitle=>left-form__|typeID=>T4__type=>div__name=>leftform__class=>leftform__moreactions=>-1__moreAttra=>__;typeID=>T10__type=>label__name=>__class=>RequestLabel request-fill h4__title=>@%lang::request-fill%@__widthmode=>_100__moreAttra=>__;typeID=>T16__type=>hidden__name=>RequestLabel request-fill__class=>RequestLabel request-fill h4__widthmode=>_100__value=>@%lang::request-selected%@__moreAttra=>__;typeID=>T18__type=>label__name=>__class=>RequestLabel request-collection-fill h4__title=>@%lang::request-collection-fill%@__widthmode=>_100__moreAttra=>__;typeID=>T17__type=>hidden__name=>RequestLabel request-collection__class=>RequestLabel request-collection-fill h4__widthmode=>_100__value=>@%lang::request-collection-selected%@__moreAttra=>__;typeID=>T1__type=>date__name=>date__class=>__title=>@%lang::date%@__widthmode=>_100__required=>required__styleMode=>-1__dateToinput=>__minDate=>__maxDate=>__moreAttra=>value%3D%22%40%25session%3A%3AMadad-Checkout.date%25%40%22__;typeID=>T2__type=>time__name=>time__class=>__title=>@%lang::time%@__widthmode=>_100__required=>required__value=>@%session::Madad-Checkout.time%@__moreAttra=>__;typeID=>T3__type=>egphone__name=>mobile__class=>__title=>@%lang::mobile%@__widthmode=>_100__required=>required__value=>@%session::Madad-Checkout.mobile%@__moreAttra=>__;typeID=>T5__type=>endDiv__;typeID=>T11__type=>div__name=>cod-options__class=>cod-options__moreactions=>-1__moreAttra=>__;typeID=>T19__type=>label__name=>__class=>RequestLabel address-label h4__title=>@%lang::address-label%@__widthmode=>_100__moreAttra=>__;typeID=>T20__type=>hidden__name=>RequestLabel address-label__class=>RequestLabel address-label__widthmode=>_100__value=>@%lang::address-label%@__moreAttra=>__;typeID=>T15__type=>text__name=>street__class=>__title=>@%lang::street%@__widthmode=>_100__required=>required__moreAttra=>value%3D%22%40%25session%3A%3AMadad-Checkout.street%25%40%22__;typeID=>T7__type=>text__name=>building__class=>__title=>@%lang::building%@__widthmode=>_100__required=>required__moreAttra=>value%3D%22%40%25session%3A%3AMadad-Checkout.building%25%40%22__;typeID=>T8__type=>text__name=>floor__class=>__title=>@%lang::floor%@__widthmode=>_100__required=>required__moreAttra=>value%3D%22%40%25session%3A%3AMadad-Checkout.floor%25%40%22__;typeID=>T9__type=>text__name=>flat__class=>__title=>@%lang::flat%@__widthmode=>_100__required=>required__moreAttra=>value%3D%22%40%25session%3A%3AMadad-Checkout.flat%25%40%22__;typeID=>T15__type=>text__name=>shipping_note__class=>__title=>@%lang::shipping_note%@__widthmode=>_100__moreAttra=>value%3D%22%40%25session%3A%3AMadad-Checkout.shipping_note%25%40%22__;typeID=>T12__type=>endDiv__;||stepid=>s1__steporder=>4__steptitle=>Collection-point__|typeID=>T1__type=>div__name=>Collection-point-option__class=>Collection-point-option__moreactions=>-1__moreAttra=>__;typeID=>T7__type=>label__name=>collection-point-label__class=>RequestLabel address-label h4__title=>@%lang::Collection-Point%@__widthmode=>_100__moreAttra=>__;typeID=>T8__type=>hidden__name=>RequestLabel collection-point-label__class=>RequestLabel address-label h4__widthmode=>_100__value=>@%lang::Collection-Point%@__moreAttra=>__;typeID=>T5__type=>select__name=>Collection-Point__class=>__title=>__widthmode=>_100__required=>required__select_type=>data__select_data=>__select_text=>%D9%88%D8%B3%D8%B7%20%D8%A7%D9%84%D8%A8%D9%84%D8%AF__select_value=>downtown__value=>downtown__depend_on=>__depend_source=>__moreAttra=>__;typeID=>T6__type=>hidden__name=>Collection-Point-selected__class=>Collection-Point-selected__widthmode=>_100__value=>@%lang::Collection-Point-selected%@__moreAttra=>__;typeID=>T6__type=>label__name=>__class=>RedLabel collection-msg h6 red__title=>@%lang::collection-msg%@__widthmode=>_100__moreAttra=>__;typeID=>T6__type=>hidden__name=>RedLabel collection-msg__class=>RedLabel collection-msg h6 red__widthmode=>_100__value=>@%lang::collection-msg%@__moreAttra=>__;typeID=>T7__type=>endDiv__;||stepid=>s1__steporder=>5__steptitle=>checkboxes__|typeID=>T1__type=>check__name=>terms-conditions__class=>__title=>@%lang::terms-conditions%@__widthmode=>_100__moreAttra=>__;typeID=>T2__type=>check__name=>anonymous-donation__class=>__title=>@%lang::anonymous-donation%@__widthmode=>_100__moreAttra=>__;typeID=>T3__type=>label__name=>__class=>help-text h6 red RedLabel__title=>@%lang::help-text%@__widthmode=>_100__moreAttra=>__;typeID=>T8__type=>check__name=>project-updates__class=>__title=>@%lang::project-updates%@__widthmode=>_100__moreAttra=>__;typeID=>T7__type=>check__name=>newsletter__class=>__title=>@%lang::newsletter%@__widthmode=>_100__moreAttra=>__;typeID=>T9__type=>hidden__name=>collection-fee__class=>collection-fee__widthmode=>_100__value=>0__moreAttra=>__;typeID=>T10__type=>hidden__name=>go-to-save__class=>go-to-save__widthmode=>_100__value=>yes__moreAttra=>__;typeID=>T6__type=>submit__name=>__class=>disabled-for-terms__title=>@%lang::submitt%@__widthmode=>_100__moreAttra=>__;typeID=>T4__type=>endForm__;typeID=>T9__type=>hidden__name=>city-not-selectable __class=>city-not-selectable __widthmode=>_100__value=>@%lang::city-not-selectable%@__moreAttra=>__;typeID=>T11__type=>hidden__name=>alert-agree-terms__class=>alert-agree-terms__widthmode=>_100__value=>@%lang::alert-agree-terms%@__moreAttra=>__;||'),
(2, 'يا', 0, '2014-01-19 00:00:00', '2013-11-17 07:32:33', 1, 0, 1, 'stepid=>s1__steporder=>1__steptitle=>Setp-s1__|typeID=>T1__type=>picAdvanced__name=>sss__class=>sss__title=>sss__widthmode=>_100__moreAttra=>sss__;typeID=>T2__type=>radio__name=>__class=>__title=>%D8%A8%D8%B3%D9%8A%D8%A8%D8%B3%D9%8A%D8%A8sdfsdf__widthmode=>_100__value=>__moreAttra=>__;typeID=>T3__type=>radio__name=>aaaa__class=>a__title=>%D9%8A%D9%82%D8%A8%D9%84%20%D8%AB%D9%82%D9%84%20%D8%A4%D9%8A%D8%A8%D9%84%D9%8A%D8%A8%20__widthmode=>_100__value=>2__moreAttra=>a__;typeID=>T4__type=>date__name=>ddd__class=>dd__title=>__widthmode=>_100__styleMode=>inline__dateToinput=>.__minDate=>03%2F12%2F2013__maxDate=>09%2F12%2F2013__moreAttra=>__;typeID=>T5__type=>color__name=>Testing3333__class=>__title=>Testing3333__widthmode=>_100__moreAttra=>__;||'),
(3, 'users', 0, '2015-03-30 12:11:59', '2013-11-21 09:54:12', 1, 0, 0, 'stepid=>s1__steporder=>1__steptitle=>Setp-s1__|typeID=>T1__type=>form__name=>usersreg__class=>__class=>__saveType=>-1__saveTo=>__SMsg=>__FMsg=>__javascript=>__css=>__php=>__phpAfterSave=>__moreAttra=>__;typeID=>T2__type=>text__name=>name__class=>username__title=>الاسم__widthmode=>_100__required=>required__moreAttra=>__;typeID=>T3__type=>email__name=>email__class=>__title=>البريد الاكترونى__widthmode=>_100__required=>required__moreAttra=>__;typeID=>T4__type=>password__name=>password__class=>__title=>انشاء كلمة المرور__widthmode=>_100__required=>required__moreAttra=>__;typeID=>T5__type=>password__name=>repassword__class=>repassword__title=>إعادة ادخال كلمة المرور__widthmode=>_100__moreAttra=>__;typeID=>T9__type=>select__name=>gender__class=>__title=>الجنس__widthmode=>_100__required=>required__select_type=>data__select_data=>__select_text=>%D8%B0%D9%83%D8%B1%2C%D8%A3%D9%86%D8%AB%D9%89__select_value=>male%2Cfemale__value=>__depend_on=>__depend_source=>__moreAttra=>__;typeID=>T9__type=>submit__name=>send__class=>__title=>__widthmode=>_100__moreAttra=>value%3D%22%D8%AA%D8%B3%D8%AC%D9%8A%D9%84%22__;typeID=>T8__type=>endForm__;typeID=>T9__type=>label__name=>orlabel__class=>orlabel__title=>أو__widthmode=>_100__moreAttra=>__;||'),
(4, '', 0, '0000-00-00 00:00:00', '2013-11-21 09:57:13', 0, 0, 1, ''),
(5, '', 0, '0000-00-00 00:00:00', '2013-11-21 09:57:55', 0, 0, 1, ''),
(6, '', 0, '0000-00-00 00:00:00', '2013-11-21 10:12:17', 0, 0, 1, ''),
(7, '', 0, '0000-00-00 00:00:00', '2013-11-21 10:16:37', 0, 0, 1, ''),
(8, '', 0, '0000-00-00 00:00:00', '2013-11-21 10:17:19', 0, 0, 1, ''),
(9, '', 0, '0000-00-00 00:00:00', '2013-11-21 10:19:21', 0, 0, 1, ''),
(10, 'Checkout Form', 0, '2015-03-30 12:11:59', '2014-01-15 12:56:16', 1, 0, 0, 'stepid=>s1__steporder=>1__steptitle=>Delivery Address__|typeID=>T1__type=>hidden__name=>site__class=>__widthmode=>_100__value=>__moreAttra=>__;typeID=>T3__type=>label__name=>sh_address_label__class=>__title=>Delivery%20Address__widthmode=>_100__moreAttra=>__;typeID=>T2__type=>div__name=>sh_address_div__class=>__moreactions=>__moreAttra=>__;typeID=>T5__type=>text__name=>ship_name__class=>__title=>Full%20Name__widthmode=>_100__required=>required__moreAttra=>__;typeID=>T6__type=>text__name=>ship_street_address__class=>__title=>Address%201__widthmode=>_100__required=>required__moreAttra=>__;typeID=>T7__type=>text__name=>ship_street_address2__class=>__title=>Address%202__widthmode=>_100__moreAttra=>__;typeID=>T8__type=>text__name=>ship_city__class=>__title=>Town%20%2F%20City__widthmode=>_100__required=>required__moreAttra=>__;typeID=>T9__type=>text__name=>ship_state__class=>__title=>County__widthmode=>_100__required=>required__moreAttra=>__;typeID=>T10__type=>text__name=>ship_zip__class=>__title=>Postal%20Code__widthmode=>_100__required=>required__moreAttra=>__;typeID=>T11__type=>select__name=>ship_country__class=>__title=>Country__widthmode=>_100__required=>required__select_type=>countries2CO__select_data=>__select_text=>__select_value=>__value=>__moreAttra=>__;typeID=>T4__type=>endDiv__;||stepid=>s1__steporder=>2__steptitle=>billing address Show__|typeID=>T1__type=>check__name=>checkbox__class=>__title=>this%20is%20also%20my%20billing%20address__widthmode=>_100__moreAttra=>__;||stepid=>s2__steporder=>3__steptitle=>billing address__|typeID=>T10__type=>label__name=>sh_Baddress_label__class=>__title=>Billing%20Address__widthmode=>_100__moreAttra=>__;typeID=>T1__type=>div__name=>sh_Baddress_div__class=>__moreactions=>__moreAttra=>__;typeID=>T2__type=>text__name=>card_holder_name__class=>__title=>Full%20Name__widthmode=>_100__required=>required__moreAttra=>__;typeID=>T3__type=>text__name=>street_address__class=>__title=>Address%201__widthmode=>_100__required=>required__moreAttra=>__;typeID=>T4__type=>text__name=>street_address2__class=>__title=>Address%202__widthmode=>_100__moreAttra=>__;typeID=>T5__type=>text__name=>city__class=>__title=>Town%20%2F%20City__widthmode=>_100__required=>required__moreAttra=>__;typeID=>T6__type=>text__name=>state__class=>__title=>County__widthmode=>_100__required=>required__moreAttra=>__;typeID=>T7__type=>text__name=>zip__class=>__title=>Postal%20Code__widthmode=>_100__required=>required__moreAttra=>__;typeID=>T9__type=>select__name=>country__class=>__title=>Country__widthmode=>_100__required=>required__select_type=>countries2CO__select_data=>__select_text=>__select_value=>__value=>__moreAttra=>__;typeID=>T8__type=>endDiv__;||stepid=>s1__steporder=>4__steptitle=>Contact Details__|typeID=>T6__type=>label__name=>sh_contect_label__class=>__title=>Contact%20Details__widthmode=>_100__moreAttra=>__;typeID=>T1__type=>div__name=>sh_Contact_div__class=>__moreactions=>__moreAttra=>__;typeID=>T2__type=>email__name=>email__class=>__title=>Email__widthmode=>_100__required=>required__moreAttra=>__;typeID=>T3__type=>phone__name=>phone__class=>__title=>Phone__widthmode=>_100__required=>required__moreAttra=>__;typeID=>T4__type=>endDiv__;typeID=>T8__type=>hidden__name=>order_status__class=>__widthmode=>_100__value=>1__moreAttra=>__;typeID=>T5__type=>hidden__name=>demo__class=>__widthmode=>_100__value=>N__moreAttra=>__;typeID=>T9__type=>hidden__name=>currency__class=>__widthmode=>_100__value=>__moreAttra=>__;typeID=>T10__type=>hidden__name=>merchant_order_id__class=>__widthmode=>_100__value=>__moreAttra=>__;typeID=>T7__type=>submit__name=>send__class=>mbotton__widthmode=>_100__moreAttra=>__;||'),
(11, 'Madad Contact Form', 0, '2015-03-30 12:11:59', '2014-02-22 07:29:08', 1, 0, 0, 'stepid=>s1__steporder=>1__steptitle=>Contact-form__|typeID=>T1__type=>div__name=>contact-form__class=>contact-form__moreactions=>-1__moreAttra=>__;typeID=>T2__type=>form__name=>contact-us-form__class=>contact-us-form__class=>__saveType=>DBTabel__saveTo=>__SMsg=>__FMsg=>__moreAttra=>__;typeID=>T3__type=>text__name=>Name__class=>name__title=>الاسم بالكامل__widthmode=>_100__moreAttra=>__;typeID=>T4__type=>email__name=>Email__class=>email__title=> البريد الإلكتروني__widthmode=>_100__moreAttra=>__;typeID=>T5__type=>select__name=>topic__class=>topic__title=>الموضوع__widthmode=>_100__select_type=>__select_data=>__select_text=>%D8%A7%D8%B3%D8%AA%D9%81%D8%B3%D8%A7%D8%B1%20%D8%B9%D8%A7%D9%85%2C%D8%A7%D8%B3%D8%AA%D9%81%D8%B3%D8%A7%D8%B1%20%D8%B9%D9%86%20%D9%85%D8%B4%D8%B1%D9%88%D8%B9%2C%D9%85%D8%B4%D8%A7%D9%83%D9%84%20%D9%85%D8%B9%20%D8%A7%D9%84%D8%AA%D8%B3%D8%AC%D9%8A%D9%84%20%D9%83%D9%85%D8%B3%D8%AA%D8%AE%D8%AF%D9%85%2C%D9%85%D8%B4%D8%A7%D9%83%D9%84%20%D9%85%D8%B9%20%D8%A7%D9%84%D8%AA%D8%B3%D8%AC%D9%8A%D9%84%20%D9%83%D9%85%D9%86%D8%B8%D9%85%D8%A9%2C%D8%A7%D8%B3%D8%AA%D9%81%D8%B3%D8%A7%D8%B1%20%D8%B9%D9%85%20%D8%A7%D9%84%D9%8A%D8%A7%D8%AA%20%D8%A7%D9%84%D8%AA%D8%A8%D8%B1%D8%B9%2C%D8%A7%D8%B3%D8%AA%D9%81%D8%B3%D8%A7%D8%B1%20%D8%AD%D9%88%D9%84%20%D8%B7%D8%B1%D9%82%20%D8%A7%D9%84%D8%AF%D9%81%D8%B9%2C%D8%A3%D8%AE%D8%B1%D9%89__select_value=>General%2CInquiry%20about%20a%20project%2CProblems%20with%20personal%20registration%2CProblems%20with%20NGO%20registration%2CHow%20to%20make%20a%20donation%2CInquiry%20regarding%20method%20of%20payment%20or%20pick%20up%2COthers__value=>__depend_on=>__depend_source=>__moreAttra=>__;typeID=>T6__type=>text__name=>subject__class=>subject__title=>عنوان الرسالة__widthmode=>_100__moreAttra=>__;typeID=>T7__type=>textarea__name=>message__class=>message__title=>الرسالة__widthmode=>_100__value=>__moreAttra=>__;typeID=>T9__type=>submit__name=>ارسل__class=>submit-contact-form__widthmode=>_100__moreAttra=>__;typeID=>T8__type=>endForm__;typeID=>T10__type=>endDiv__;||'),
(12, 'faiz-reservation', 0, '2015-03-30 12:12:07', '2014-06-01 07:59:42', 1, 0, 1, 'stepid=>s1__steporder=>1__steptitle=>Step1__|typeID=>T1__type=>label__hmlid=>0__morecss=>__;typeID=>T2__type=>form__formid=>0__renderType=>0__morecss=>__;||stepid=>s1__steporder=>2__steptitle=>dates__|typeID=>T1__type=>div__hmlid=>0__morecss=>__;typeID=>T2__type=>__hmlid=>0__morecss=>__;typeID=>T3__type=>__hmlid=>0__morecss=>__;typeID=>T4__type=>number__hmlid=>0__morecss=>__;typeID=>T5__type=>endDiv__hmlid=>0__morecss=>__;typeID=>T6__type=>hidden__hmlid=>0__morecss=>__;typeID=>T7__type=>hidden__hmlid=>0__morecss=>__;||stepid=>s1__steporder=>3__steptitle=>arrivalDetails__|typeID=>T9__type=>line__hmlid=>0__morecss=>__;typeID=>T1__type=>div__hmlid=>0__morecss=>__;typeID=>T2__type=>text__hmlid=>0__morecss=>__;typeID=>T3__type=>text__hmlid=>0__morecss=>__;typeID=>T4__type=>text__hmlid=>0__morecss=>__;typeID=>T5__type=>__hmlid=>0__morecss=>__;typeID=>T6__type=>phone__hmlid=>0__morecss=>__;typeID=>T7__type=>email__hmlid=>0__morecss=>__;typeID=>T8__type=>endDiv__hmlid=>0__morecss=>__;||stepid=>s1__steporder=>4__steptitle=>addMorePax__|typeID=>T6__type=>line__hmlid=>0__morecss=>__;typeID=>T2__type=>label__hmlid=>0__morecss=>__;typeID=>T7__type=>div__hmlid=>0__morecss=>__;typeID=>T8__type=>endDiv__hmlid=>0__morecss=>__;typeID=>T1__type=>div__hmlid=>0__morecss=>__;typeID=>T4__type=>number__hmlid=>0__morecss=>__;typeID=>T3__type=>endDiv__hmlid=>0__morecss=>__;typeID=>T9__type=>hidden__hmlid=>0__morecss=>__;||stepid=>s1__steporder=>5__steptitle=>remarks__|typeID=>T1__type=>div__hmlid=>0__morecss=>__;typeID=>T2__type=>textarea__hmlid=>0__morecss=>__;typeID=>T3__type=>endDiv__hmlid=>0__morecss=>__;||stepid=>s2__steporder=>6__steptitle=>endOfForm__|typeID=>T2__type=>hidden__hmlid=>0__morecss=>__;typeID=>T3__type=>hidden__hmlid=>0__morecss=>__;typeID=>T1__type=>endForm__hmlid=>0__morecss=>__;||'),
(14, 'faiz-reservation', 0, '2015-03-30 12:11:59', '2015-03-30 12:12:45', 1, 0, 0, 'stepid=>s1__steporder=>1__steptitle=>Step1__|typeID=>T1__type=>label__name=>__class=>h2 bb__title=>Create New Reservation__widthmode=>_100__moreAttra=>__;typeID=>T2__type=>form__name=>faiz-new-reservation__class=>faiz-new-reservation__class=>faiz-new-reservation__saveType=>sesstion__saveTo=>faiz-new-reservation__SMsg=>__FMsg=>__javascript=>__css=>__php=>__phpAfterSave=>__moreAttra=>data-name%3D%22newfaiz%22__;||stepid=>s1__steporder=>2__steptitle=>dates__|typeID=>T1__type=>div__name=>dates-info__class=>dates-info__moreactions=>-1__moreAttra=>__;typeID=>T2__type=>date__name=>checkinDate__class=>checkin__title=>Checkin__widthmode=>_50__required=>required__styleMode=>inline__dateToinput=>__minDate=>__maxDate=>__moreAttra=>value%3D%22%40%25session%3A%3Afaiz-new-reservation.checkinDate%25%40%22__;typeID=>T3__type=>date__name=>checkoutDate__class=>checkout__title=>Checkout__widthmode=>_50__required=>required__styleMode=>inline__dateToinput=>__minDate=>__maxDate=>__moreAttra=>value%3D%22%40%25session%3A%3Afaiz-new-reservation.checkoutDate%25%40%22__;typeID=>T4__type=>number__name=>nights__class=>nights__title=>Nights__widthmode=>_30__moreAttra=>value%3D%22%40%25session%3A%3Afaiz-new-reservation.nights%25%40%22__;typeID=>T5__type=>endDiv__;typeID=>T6__type=>hidden__name=>checkin__class=>__widthmode=>_100__value=>@%session::faiz-new-reservation.checkin%@__moreAttra=>__;typeID=>T7__type=>hidden__name=>checkout__class=>__widthmode=>_100__value=>@%session::faiz-new-reservation.checkout%@__moreAttra=>__;||stepid=>s1__steporder=>3__steptitle=>arrivalDetails__|typeID=>T9__type=>line__;typeID=>T1__type=>div__name=>arrival-details__class=>arrival-details__moreactions=>-1__moreAttra=>__;typeID=>T2__type=>text__name=>airline__class=>airline__title=>Airline__widthmode=>_50__required=>required__moreAttra=>value%3D%22%40%25session%3A%3Afaiz-new-reservation.airline%25%40%22__;typeID=>T3__type=>text__name=>airline_code__class=>airline_code__title=>Airline Code__widthmode=>_50__required=>required__moreAttra=>value%3D%22%40%25session%3A%3Afaiz-new-reservation.airline_code%25%40%22__;typeID=>T4__type=>text__name=>arriving_from__class=>arriving_from__title=>Arriving from__widthmode=>_50__required=>required__moreAttra=>value%3D%22%40%25session%3A%3Afaiz-new-reservation.arriving_from%25%40%22__;typeID=>T5__type=>time__name=>arrival_time__class=>arrival_time__title=>Arrival Time__widthmode=>_50__required=>required__value=>__moreAttra=>value%3D%22%40%25session%3A%3Afaiz-new-reservation.arrival_time%25%40%22__;typeID=>T6__type=>phone__name=>mobile__class=>mobile__title=>Contact Number__widthmode=>_50__required=>required__moreAttra=>value%3D%22%40%25session%3A%3Afaiz-new-reservation.mobile%25%40%22__;typeID=>T7__type=>email__name=>email__class=>email__title=>Email__widthmode=>_50__required=>required__moreAttra=>value%3D%22%40%25session%3A%3Afaiz-new-reservation.email%25%40%22__;typeID=>T8__type=>endDiv__;||stepid=>s1__steporder=>4__steptitle=>addMorePax__|typeID=>T6__type=>line__;typeID=>T2__type=>label__name=>__class=>add-more-title__title=>Add more persons to this reservation__widthmode=>_100__moreAttra=>__;typeID=>T7__type=>div__name=>tabelRes__class=>tabelRes__moreactions=>-1__moreAttra=>__;typeID=>T8__type=>endDiv__;typeID=>T1__type=>div__name=>add-more-pax__class=>add-more-pax__moreactions=>addmore__moreAttra=>__;typeID=>T4__type=>number__name=>its_id__class=>its_id__title=>ITS ID__widthmode=>_50__required=>required__moreAttra=>__;typeID=>T5__type=>date__name=>dob__class=>dob__title=>Date of Birth__widthmode=>_50__required=>required__styleMode=>monthyear__dateToinput=>__minDate=>__maxDate=>__moreAttra=>__;typeID=>T3__type=>endDiv__;typeID=>T9__type=>hidden__name=>Mumin_ids__class=>__widthmode=>_100__value=>@%session::faiz-new-reservation.Mumin_ids%@__moreAttra=>__;||stepid=>s1__steporder=>5__steptitle=>remarks__|typeID=>T1__type=>div__name=>remarks__class=>remarks__moreactions=>-1__moreAttra=>__;typeID=>T2__type=>textarea__name=>remarks__class=>__title=>remarks__widthmode=>_100__value=>@%session::faiz-new-reservation.remarks%@__moreAttra=>__;typeID=>T3__type=>endDiv__;||stepid=>s2__steporder=>6__steptitle=>endOfForm__|typeID=>T2__type=>hidden__name=>city__class=>__widthmode=>_100__value=>cairo__moreAttra=>__;typeID=>T3__type=>hidden__name=>booking_owner__class=>__widthmode=>_100__value=>@%session::booking_owner%@__moreAttra=>__;typeID=>T1__type=>endForm__;||'),
(13, 'faiz-reservation', 0, '2015-03-30 15:30:01', '2015-03-30 12:03:14', 1, 0, 0, 'stepid=>s1__steporder=>1__steptitle=>Step1__|typeID=>T1__type=>label__name=>__class=>h2 bb__title=>Create New Reservation__widthmode=>_100__moreAttra=>__;typeID=>T2__type=>form__name=>faiz-new-reservation__class=>faiz-new-reservation__class=>faiz-new-reservation__saveType=>sesstion__saveTo=>faiz-new-reservation__SMsg=>__FMsg=>__javascript=>__css=>__php=>__phpAfterSave=>__moreAttra=>data-name%3D%22newfaiz%22__;||stepid=>s1__steporder=>2__steptitle=>dates__|typeID=>T1__type=>div__name=>dates-info__class=>dates-info__moreactions=>0__moreAttra=>__;typeID=>T2__type=>date__name=>checkinDate__class=>Checkin__title=>Checkin__widthmode=>_50__styleMode=>inline__dateToinput=>__55194f91c02f5=>__55194f91c0328=>__moreAttra=>value%3D%22%40%25session%3A%3Afaiz-new-reservation.checkinDate%25%40%22__;typeID=>T3__type=>date__name=>checkoutDate__class=>checkout__title=>checkout__widthmode=>_50__required=>required__styleMode=>inline__dateToinput=>__55194fa7dd0df=>__55194fa7dd12f=>__moreAttra=>value%3D%22%40%25session%3A%3Afaiz-new-reservation.checkoutDate%25%40%22__;typeID=>T4__type=>number__name=>nights__class=>nights__title=>Nights__widthmode=>_30__moreAttra=>value%3D%22%40%25session%3A%3Afaiz-new-reservation.nights%25%40%22__;typeID=>T5__type=>endDiv__;typeID=>T6__type=>hidden__name=>checkin__class=>__widthmode=>_100__value=>@%session::faiz-new-reservation.checkin%@__moreAttra=>__;typeID=>T7__type=>hidden__name=>checkout__class=>__widthmode=>_100__value=>@%session::faiz-new-reservation.checkout%@__moreAttra=>__;||stepid=>s1__steporder=>3__steptitle=>arrivalDetails__|typeID=>T9__type=>line__;typeID=>T1__type=>div__name=>arrival-details__class=>arrival-details__moreactions=>0__moreAttra=>__;typeID=>T2__type=>text__name=>airline__class=>airline__title=>Airline__widthmode=>_50__required=>required__moreAttra=>value%3D%22%40%25session%3A%3Afaiz-new-reservation.airline%25%40%22__;typeID=>T3__type=>text__name=>airline_code__class=>airline_code__title=>Airline Code__widthmode=>_50__required=>required__moreAttra=>value%3D%22%40%25session%3A%3Afaiz-new-reservation.airline_code%25%40%22__;typeID=>T4__type=>text__name=>arriving_from__class=>arriving_from__title=>Arriving from__widthmode=>_50__required=>required__moreAttra=>value%3D%22%40%25session%3A%3Afaiz-new-reservation.arriving_from%25%40%22__;typeID=>T5__type=>__name=>arrival_time__class=>arrival_time__title=>Arrival Time__widthmode=>_50__required=>required__moreAttra=>value%3D%22%40%25session%3A%3Afaiz-new-reservation.arrival_time%25%40%22__;typeID=>T6__type=>phone__name=>mobile__class=>mobile__title=>Contact Number__widthmode=>_50__required=>required__moreAttra=>value%3D%22%40%25session%3A%3Afaiz-new-reservation.mobile%25%40%22__;typeID=>T7__type=>email__name=>email__class=>email__title=>Email__widthmode=>_50__required=>required__moreAttra=>value%3D%22%40%25session%3A%3Afaiz-new-reservation.email%25%40%22__;typeID=>T8__type=>endDiv__;||stepid=>s1__steporder=>4__steptitle=>addMorePax__|typeID=>T6__type=>line__;typeID=>T2__type=>label__name=>__class=>add-more-title__title=>Add more persons to this reservation__widthmode=>_100__moreAttra=>__;typeID=>T7__type=>div__name=>tabelRes__class=>tabelRes__moreactions=>0__moreAttra=>__;typeID=>T8__type=>endDiv__;typeID=>T1__type=>div__name=>add-more-pax__class=>add-more-pax__moreactions=>addmore__moreAttra=>__;typeID=>T4__type=>number__name=>its_id__class=>its_id__title=>ITS ID__widthmode=>_50__required=>required__moreAttra=>__;typeID=>T3__type=>endDiv__;typeID=>T9__type=>hidden__name=>Mumin_ids__class=>__widthmode=>_100__value=>@%session::faiz-new-reservation.Mumin_ids%@__moreAttra=>__;||stepid=>s1__steporder=>5__steptitle=>remarks__|typeID=>T1__type=>div__name=>remarks__class=>remarks__moreactions=>0__moreAttra=>__;typeID=>T2__type=>textarea__name=>remarks__class=>__title=>remarks__widthmode=>_100__value=>@%session::faiz-new-reservation.remarks%@__moreAttra=>__;typeID=>T3__type=>endDiv__;||stepid=>s2__steporder=>6__steptitle=>endOfForm__|typeID=>T2__type=>hidden__name=>city__class=>__widthmode=>_100__value=>cairo__moreAttra=>__;typeID=>T3__type=>hidden__name=>booking_owner__class=>__widthmode=>_100__value=>@%session::booking_owner%@__moreAttra=>__;typeID=>T1__type=>endForm__;||');

-- --------------------------------------------------------

--
-- Table structure for table `com_google_adsense`
--

CREATE TABLE IF NOT EXISTS `com_google_adsense` (
`id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `code` text NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `delete` int(11) NOT NULL,
  `enabled` int(11) NOT NULL,
  `order` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `com_google_adsense`
--

INSERT INTO `com_google_adsense` (`id`, `title`, `code`, `modified`, `created`, `delete`, `enabled`, `order`) VALUES
(1, 'ads 280 * 265', '<script type="text/javascript"><!--\r\ngoogle_ad_client = "ca-pub-3605843046757478";\r\n/* test3 */\r\ngoogle_ad_slot = "7387238432";\r\ngoogle_ad_width = 280;\r\ngoogle_ad_height = 265\r\n//-->\r\n</script>\r\n<script type="text/javascript"\r\nsrc="http://pagead2.googlesyndication.com/pagead/show_ads.js">\r\n</script>', '2013-04-06 00:00:00', '2013-03-30 09:44:22', 0, 1, 0),
(2, 'ads 300 * 600', '<script type="text/javascript"><!--\r\ngoogle_ad_client = "ca-pub-3605843046757478";\r\n/* test */\r\ngoogle_ad_slot = "3236240430";\r\ngoogle_ad_width = 300;\r\ngoogle_ad_height = 600;\r\n//-->\r\n</script>\r\n<script type="text/javascript"\r\nsrc="http://pagead2.googlesyndication.com/pagead/show_ads.js">\r\n</script>', '2013-04-06 00:00:00', '2013-03-30 09:44:22', 0, 1, 0),
(3, 'ads 234 * 60', '<script type="text/javascript"><!--\r\ngoogle_ad_client = "ca-pub-3605843046757478";\r\n/* test1 */\r\ngoogle_ad_slot = "6189706837";\r\ngoogle_ad_width = 234;\r\ngoogle_ad_height = 60;\r\n//-->\r\n</script>\r\n', '2013-04-06 00:00:00', '2013-03-30 09:44:22', 0, 1, 0),
(4, 'ads 320 * 50', '<script type="text/javascript"><!--\r\ngoogle_ad_client = "ca-pub-3605843046757478";\r\n/* test4 */\r\ngoogle_ad_slot = "1340704836";\r\ngoogle_ad_width = 320;\r\ngoogle_ad_height = 50;\r\n//-->\r\n</script>\r\n<script type="text/javascript"\r\nsrc="http://pagead2.googlesyndication.com/pagead/show_ads.js">\r\n</script>', '2013-04-06 00:00:00', '2013-03-30 09:44:22', 0, 1, 0),
(5, 'ads 728 * 90', '<script type="text/javascript"><!--\r\ngoogle_ad_client = "ca-pub-3605843046757478";\r\n/* ads5 */\r\ngoogle_ad_slot = "4719646839";\r\ngoogle_ad_width = 728;\r\ngoogle_ad_height = 90;\r\n//-->\r\n</script>\r\n<script type="text/javascript"\r\nsrc="http://pagead2.googlesyndication.com/pagead/show_ads.js">\r\n</script>', '2013-03-31 00:00:00', '2013-03-30 09:44:22', 0, 1, 0),
(6, 'ads 234 * 60', '<script type="text/javascript"><!--\r\ngoogle_ad_client = "ca-pub-3605843046757478";\r\n/* test1 */\r\ngoogle_ad_slot = "6189706837";\r\ngoogle_ad_width = 234;\r\ngoogle_ad_height = 60;\r\n//-->\r\n</script>\r\n<script type="text/javascript"\r\nsrc="http://pagead2.googlesyndication.com/pagead/show_ads.js">\r\n</script>', '2013-04-06 00:00:00', '2013-03-30 09:44:22', 0, 1, 0),
(7, '300*250', '<script type="text/javascript"><!--\r\ngoogle_ad_client = "ca-pub-3605843046757478";\r\n/* 300 &#42; 250 */\r\ngoogle_ad_slot = "2183152838";\r\ngoogle_ad_width = 300;\r\ngoogle_ad_height = 250;\r\n//-->\r\n</script>\r\n<script type="text/javascript"\r\nsrc="http://pagead2.googlesyndication.com/pagead/show_ads.js">\r\n</script>', '0000-00-00 00:00:00', '2013-04-06 04:28:07', 0, 1, 0),
(8, '120 *240', '<script type="text/javascript"><!--\r\ngoogle_ad_client = "ca-pub-3605843046757478";\r\n/* 240 &#42;120 */\r\ngoogle_ad_slot = "7867929633";\r\ngoogle_ad_width = 120;\r\ngoogle_ad_height = 240;\r\n//-->\r\n</script>\r\n<script type="text/javascript"\r\nsrc="http://pagead2.googlesyndication.com/pagead/show_ads.js">\r\n</script>', '0000-00-00 00:00:00', '2013-04-06 04:30:46', 0, 1, 0),
(9, '250 * 300', '<script type="text/javascript"><!--\r\ngoogle_ad_client = "ca-pub-3605843046757478";\r\n/* 250 &#42; 300 */\r\ngoogle_ad_slot = "3437730032";\r\ngoogle_ad_width = 300;\r\ngoogle_ad_height = 250;\r\n//-->\r\n</script>\r\n<script type="text/javascript"\r\nsrc="http://pagead2.googlesyndication.com/pagead/show_ads.js">\r\n</script>', '0000-00-00 00:00:00', '2013-04-06 04:53:02', 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `com_google_map`
--

CREATE TABLE IF NOT EXISTS `com_google_map` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `order` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `des` text CHARACTER SET utf8 NOT NULL,
  `locationtitle` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `com_google_map`
--

INSERT INTO `com_google_map` (`id`, `created`, `modified`, `order`, `enabled`, `delete`, `title`, `des`, `locationtitle`, `location`) VALUES
(1, '2014-01-07 03:45:01', '2014-01-07 00:00:00', 0, 1, 0, 'Ashmoun ', '<p><strong>&#1571;&#1588;&#1605;&#1608;&#1606; Ashmoun</strong> &#1605;&#1583;&#1610;&#1606;&#1577; &#1602;&#1583;&#1610;&#1605;&#1577; &#1605;&#1606;&#1584; &#1575;&#1604;&#1593;&#1589;&#1608;&#1585; <a title="&#1605;&#1589;&#1585; &#1575;&#1604;&#1602;&#1583;&#1610;&#1605;&#1577;" href="http://ar.wikipedia.org/wiki/%D9%85%D8%B5%D8%B1_%D8%A7%D9%84%D9%82%D8%AF%D9%8A%D9%85%D8%A9">&#1575;&#1604;&#1601;&#1585;&#1593;&#1608;&#1606;&#1610;&#1577;</a> &#1608;&#1575;&#1587;&#1605;&#1607;&#1575; &#1575;&#1604;&#1601;&#1585;&#1593;&#1608;&#1606;&#1610; &#1605;&#1603;&#1608;&#1606; &#1605;&#1606; &#1571;&#1588; &#1576;&#1605;&#1593;&#1606;&#1609; &#1571;&#1585;&#1590; <a title="&#1570;&#1605;&#1608;&#1606;" href="http://ar.wikipedia.org/wiki/%D8%A2%D9%85%D9%88%D9%86">&#1608;&#1570;&#1605;&#1608;&#1606;</a> &#1575;&#1587;&#1605; &#1575;&#1604;&#1573;&#1604;&#1607; &#1575;&#1604;&#1582;&#1601;&#1610; &#1575;&#1604;&#1571;&#1593;&#1592;&#1605; &#1593;&#1606;&#1583; <a title="&#1605;&#1589;&#1585; &#1575;&#1604;&#1602;&#1583;&#1610;&#1605;&#1577;" href="http://ar.wikipedia.org/wiki/%D9%85%D8%B5%D8%B1_%D8%A7%D9%84%D9%82%D8%AF%D9%8A%D9%85%D8%A9">&#1575;&#1604;&#1605;&#1589;&#1585;&#1610;&#1610;&#1606; &#1575;&#1604;&#1602;&#1583;&#1605;&#1575;&#1569;</a> &#1608;&#1593;&#1604;&#1610;&#1607; &#1578;&#1603;&#1608;&#1606; &#1571;&#1585;&#1590; &#1575;&#1604;&#1604;&#1607; &#1571;&#1585;&#1590; &#1575;&#1604;&#1602;&#1605;&#1585; (&#1608; &#1610;&#1608;&#1580;&#1583; &#1576;&#1605;&#1583;&#1582;&#1604; &#1576;&#1604;&#1583;&#1577; &#1571;&#1588;&#1605;&#1608;&#1606; &#1575;&#1604;&#1570;&#1606; &#1610;&#1575;&#1601;&#1578;&#1577; &#1576;&#1582;&#1591; &#1603;&#1576;&#1610;&#1585; "&#1571;&#1585;&#1590; &#1575;&#1604;&#1602;&#1605;&#1585;"</p>', 'Ashmoun ', '30.288643,31.008224'),
(2, '2014-01-07 03:45:01', '2014-01-07 00:00:00', 0, 1, 0, 'القاهرة', '<p>test des</p>', '', '30.035514,31.202202'),
(3, '2014-01-07 03:45:01', '0000-00-00 00:00:00', 0, 1, 0, 'test title', '<p>test des</p>', '', ''),
(4, '2014-01-07 03:45:01', '0000-00-00 00:00:00', 0, 1, 0, 'test title', '<p>test des</p>', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `com_gustbook`
--

CREATE TABLE IF NOT EXISTS `com_gustbook` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `msg` text NOT NULL,
  `country` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `com_gustbook`
--

INSERT INTO `com_gustbook` (`id`, `created`, `modified`, `enabled`, `order`, `delete`, `title`, `msg`, `country`) VALUES
(1, '2013-04-17 11:27:37', '2013-04-17 00:00:00', 1, 1, 0, 'Hashim', 'Laundry staff was very good and helpful too, special thanks to them..see you soon!', 'Indore'),
(2, '2013-04-17 11:28:48', '2013-04-17 00:00:00', 1, 2, 0, 'Tasneem Motiwala ', 'The faiz was well organized.Good Job!Just please change the elevators\r\n', 'Mumbai'),
(3, '2013-04-17 11:29:18', '2013-04-17 00:00:00', 1, 3, 0, 'Zehra Aliakbar ', 'Our room Ac was repaired as soon as we complained about it.Our stay was a very satisfying experience.Inshallah we would like to come again', 'India'),
(4, '2013-04-17 11:27:37', '2013-04-17 00:00:00', 1, 1, 0, 'Hashim', 'Laundry staff was very good and helpful too, special thanks to them..see you soon!', 'India'),
(5, '2013-04-17 11:28:48', '2013-04-17 00:00:00', 1, 2, 0, 'Mumbai', 'The faiz was well organized.Good Job!Just please change the elevators\r\n', 'India'),
(6, '2013-04-17 11:29:18', '2013-04-17 00:00:00', 1, 3, 0, 'Zehra Aliakbar ', 'Our room Ac was repaired as soon as we complained about it.Our stay was a very satisfying experience.Inshallah we would like to come again', 'India'),
(7, '2013-04-17 11:27:37', '2013-04-17 00:00:00', 1, 1, 0, 'Hashim', 'Laundry staff was very good and helpful too, special thanks to them..see you soon!', 'Indore'),
(8, '2013-04-17 11:28:48', '2013-04-17 00:00:00', 1, 2, 0, 'Tasneem Motiwala ', 'The faiz was well organized.Good Job!Just please change the elevators\r\n', 'Mumbai'),
(9, '2013-04-17 11:29:18', '2013-04-17 00:00:00', 1, 3, 0, 'Zehra Aliakbar ', 'Our room Ac was repaired as soon as we complained about it.Our stay was a very satisfying experience.Inshallah we would like to come again', 'India'),
(10, '2013-04-17 11:27:37', '2013-04-17 00:00:00', 1, 1, 0, 'Hashim', 'Laundry staff was very good and helpful too, special thanks to them..see you soon!', 'India'),
(11, '2013-04-17 11:28:48', '2013-04-17 00:00:00', 1, 2, 0, 'Mumbai', 'The faiz was well organized.Good Job!Just please change the elevators\r\n', 'India'),
(12, '2013-04-17 11:29:18', '2013-04-17 00:00:00', 1, 3, 0, 'Zehra Aliakbar ', 'Our room Ac was repaired as soon as we complained about it.Our stay was a very satisfying experience.Inshallah we would like to come again', 'India'),
(13, '2013-04-17 11:27:37', '2013-04-17 00:00:00', 1, 1, 0, 'Hashim', 'Laundry staff was very good and helpful too, special thanks to them..see you soon!', 'Indore'),
(14, '2013-04-17 11:28:48', '2013-04-17 00:00:00', 1, 2, 0, 'Tasneem Motiwala ', 'The faiz was well organized.Good Job!Just please change the elevators\r\n', 'Mumbai'),
(15, '2013-04-17 11:29:18', '2013-04-17 00:00:00', 1, 3, 0, 'Zehra Aliakbar ', 'Our room Ac was repaired as soon as we complained about it.Our stay was a very satisfying experience.Inshallah we would like to come again', 'India'),
(16, '2013-04-17 11:27:37', '2013-04-17 00:00:00', 1, 1, 0, 'Hashim', 'Laundry staff was very good and helpful too, special thanks to them..see you soon!', 'India'),
(17, '2013-04-17 11:28:48', '2013-04-17 00:00:00', 1, 2, 0, 'Mumbai', 'The faiz was well organized.Good Job!Just please change the elevators\r\n', 'India'),
(18, '2013-04-17 11:29:18', '2013-04-17 00:00:00', 1, 3, 0, 'Zehra Aliakbar ', 'Our room Ac was repaired as soon as we complained about it.Our stay was a very satisfying experience.Inshallah we would like to come again', 'India'),
(19, '2013-04-17 11:27:37', '2013-04-17 00:00:00', 1, 1, 0, 'Hashim', 'Laundry staff was very good and helpful too, special thanks to them..see you soon!', 'Indore'),
(20, '2013-04-17 11:28:48', '2013-04-17 00:00:00', 1, 2, 0, 'Tasneem Motiwala ', 'The faiz was well organized.Good Job!Just please change the elevators\r\n', 'Mumbai'),
(21, '2013-04-17 11:29:18', '2013-04-17 00:00:00', 1, 3, 0, 'Zehra Aliakbar ', 'Our room Ac was repaired as soon as we complained about it.Our stay was a very satisfying experience.Inshallah we would like to come again', 'India'),
(22, '2013-04-17 11:27:37', '2013-04-17 00:00:00', 1, 1, 0, 'Hashim', 'Laundry staff was very good and helpful too, special thanks to them..see you soon!', 'India'),
(23, '2013-04-17 11:28:48', '2013-04-17 00:00:00', 1, 2, 0, 'Mumbai', 'The faiz was well organized.Good Job!Just please change the elevators\r\n', 'India'),
(24, '2013-04-17 11:29:18', '2013-04-17 00:00:00', 1, 3, 0, 'Zehra Aliakbar ', 'Our room Ac was repaired as soon as we complained about it.Our stay was a very satisfying experience.Inshallah we would like to come again', 'India'),
(25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0, 'aaaaa', 'ccccc', 'bbbbbb'),
(26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0, '', '', ''),
(27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0, 'sdsdW', 'WWEWWE', 'WEWE'),
(28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0, 'AZIZ', 'WWJWEKJE wdwwd', 'DUBAI'),
(29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 'Aziz', 'very pleasant', 'Dubai'),
(30, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 'Aziz', 'sswdd', 'aiaia'),
(31, '2015-03-30 20:22:42', '0000-00-00 00:00:00', 0, 0, 0, 'Aziz', 'v nice', 'Dubai'),
(32, '2015-03-30 20:23:52', '0000-00-00 00:00:00', 0, 0, 0, 'Mansoor', 'bbbb', 'Zambia');

-- --------------------------------------------------------

--
-- Table structure for table `com_gustbook_categories`
--

CREATE TABLE IF NOT EXISTS `com_gustbook_categories` (
`id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `des` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `com_html`
--

CREATE TABLE IF NOT EXISTS `com_html` (
`id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `my_body` text NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `delete` int(11) NOT NULL,
  `enabled` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `plugins_data` text NOT NULL,
  `cat_id` text NOT NULL,
  `history` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=388 ;

--
-- Dumping data for table `com_html`
--

INSERT INTO `com_html` (`id`, `title`, `my_body`, `modified`, `created`, `delete`, `enabled`, `order`, `plugins_data`, `cat_id`, `history`) VALUES
(350, 'test2', '<p>test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;</p>\r\n<p>test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;te</p>\r\n<p>st&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;t</p>\r\n<p>est&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;</p>\r\n<p>test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;</p>', '2014-05-25 09:00:24', '2014-05-25 09:01:21', 2, 1, 0, '', '', 348),
(349, 'test2', '<p>test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;</p>', '0000-00-00 00:00:00', '2014-05-25 09:00:24', 2, 1, 0, '', '', 348),
(348, 'test23', '<p>test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;</p>\r\n<p>test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;te</p>\r\n<p>st&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;t</p>\r\n<p>est&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;</p>\r\n<p>test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;</p>\r\n<p>test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;</p>\r\n<p>test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;te</p>\r\n<p>st&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;t</p>\r\n<p>est&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;</p>\r\n<p>test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;</p>\r\n<p>test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;</p>\r\n<p>test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;te</p>\r\n<p>st&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;t</p>\r\n<p>est&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;</p>\r\n<p>test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;</p>\r\n<p>test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;</p>\r\n<p>test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;te</p>\r\n<p>st&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;t</p>\r\n<p>est&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;</p>\r\n<p>test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;</p>', '2014-06-18 06:07:30', '2014-05-25 08:51:10', 0, 1, 0, '', '', 0),
(351, 'test2', '<p>test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;</p>\r\n<p>test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;te</p>\r\n<p>st&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;t</p>\r\n<p>est&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;</p>\r\n<p>test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;</p>\r\n<p>test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;</p>\r\n<p>test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;te</p>\r\n<p>st&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;t</p>\r\n<p>est&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;</p>\r\n<p>test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;</p>\r\n<p>test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;</p>\r\n<p>test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;te</p>\r\n<p>st&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;t</p>\r\n<p>est&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;</p>\r\n<p>test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;</p>\r\n<p>test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;</p>\r\n<p>test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test</p>\r\n<p>&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;te</p>\r\n<p>st&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;t</p>\r\n<p>est&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;</p>\r\n<p>test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;test&nbsp;</p>', '2014-05-25 09:01:21', '2014-06-18 06:07:30', 2, 1, 0, '', '', 348),
(352, 'ssss', '', '0000-00-00 00:00:00', '2014-07-06 17:36:04', 0, 1, 0, '', '', 0),
(353, 'aaa', '', '0000-00-00 00:00:00', '2014-07-06 17:36:53', 0, 0, 0, '', ',64', 0),
(354, 'fgdfgdf', '', '0000-00-00 00:00:00', '2014-07-06 19:35:32', 0, 1, 0, '', '', 0),
(355, 'gdfgdfg', '', '0000-00-00 00:00:00', '2014-07-06 19:36:31', 0, 1, 0, '', '', 0),
(356, 'rrrrrrrrrrrrrrrrrrrrr', '', '0000-00-00 00:00:00', '2014-07-06 19:37:53', 0, 1, 0, '', '', 0),
(357, 'gdfgdf', '', '0000-00-00 00:00:00', '2014-07-06 19:39:30', 0, 1, 0, '', '', 0),
(358, 'ffsdf', '', '0000-00-00 00:00:00', '2014-07-06 20:37:58', 0, 1, 0, '', '', 0),
(359, 'dfgdfg', '', '0000-00-00 00:00:00', '2014-07-06 20:42:55', 0, 1, 0, '', '', 0),
(360, 'Sdfsdfsdf', '', '0000-00-00 00:00:00', '2014-07-06 20:43:38', 0, 1, 0, '', '', 0),
(361, 'dfgdf', '', '0000-00-00 00:00:00', '2014-07-06 20:44:22', 0, 1, 0, '', '', 0),
(362, 'dfg', '', '0000-00-00 00:00:00', '2014-07-06 20:48:34', 0, 1, 0, '', '', 0),
(363, 'ghjghj', '', '0000-00-00 00:00:00', '2014-07-06 20:50:32', 0, 1, 0, '', '', 0),
(364, 'fghfg', '', '0000-00-00 00:00:00', '2014-07-06 20:51:17', 0, 1, 0, '', '', 0),
(365, 'uuyyyyy', '', '0000-00-00 00:00:00', '2014-07-06 20:52:01', 0, 1, 0, '', '', 0),
(366, 'hjk', '', '0000-00-00 00:00:00', '2014-07-06 20:52:32', 0, 1, 0, '', '', 0),
(367, 'tttttttttttttttttttttttttttttttttttttttttttttttttttt', '', '0000-00-00 00:00:00', '2014-07-08 18:11:06', 0, 1, 0, '', '', 0),
(368, 'ITS Link', '<a href="http://www.its52.com/ServiceLogin.aspx?domain=http://www.faiz.e-scapes.me&continue=http://www.faiz.e-scapes.me/FaizReservations">Click here to ITS Authentication</a>', '0000-00-00 00:00:00', '2014-07-08 18:13:12', 0, 1, 0, '', '', 0),
(369, 'Contact US', '', '2015-03-25 16:49:50', '2014-07-08 18:14:09', 0, 1, 0, '', '', 0),
(370, 'rrertertertert', '', '0000-00-00 00:00:00', '2015-03-25 16:47:17', 2, 1, 0, '', '', 369),
(371, 'Contact US', '', '2015-03-25 16:47:17', '2015-03-25 16:48:23', 2, 1, 0, '', '', 369),
(372, 'Contact US', '', '2015-03-25 16:48:23', '2015-03-25 16:49:12', 2, 1, 0, '', '', 369),
(373, 'Contact US', '', '2015-03-25 16:49:12', '2015-03-25 16:49:31', 2, 1, 0, '', '', 369),
(374, 'Contact US', '', '2015-03-25 16:49:31', '2015-03-25 16:49:42', 2, 1, 0, '', '', 369),
(375, 'Contact US', '', '2015-03-25 16:49:42', '2015-03-25 16:49:50', 2, 1, 0, '', '', 369),
(376, 'Hi', '', '0000-00-00 00:00:00', '2015-03-25 16:50:13', 0, 1, 0, '', ',64', 0),
(377, 'ph', '<h1>h1</h1>\r\n<h2>h2</h2>\r\n<h3>h3</h3>\r\n<h4>h4</h4>\r\n<h5>h5</h5>\r\n<h6>h6</h6>\r\n<div class="msg">Thanks for spending your valuable time and taking an effort in reaching to us.</div>\r\n<div class="msg info">Thanks for spending your valuable time and taking an effort in reaching to us.</div>\r\n<div class="msg error">Thanks for spending your<a> valuable time and taking </a>an effort in reaching to us.</div>\r\n<div class="msg worr">Thanks for spending your <a>valuable time and taking an</a> effort in reaching to us.</div>\r\n<p><button class="button">Button</button> <button class="button disable">Button</button></p>\r\n<h2 class="title">title</h2>\r\n<table class="mainTabel">\r\n<tbody>\r\n<tr><th>header</th><th>header</th><th>header</th><th>header</th><th>header</th><th>header</th></tr>\r\n<tr>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n</tr>\r\n<tr>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n</tr>\r\n</tbody>\r\n</table>', '2015-04-01 22:20:41', '2015-04-01 00:49:29', 0, 1, 0, '', '', 0),
(378, 'ph', '', '0000-00-00 00:00:00', '2015-04-01 00:52:51', 2, 1, 0, '', '', 377),
(379, 'ph', '', '2015-04-01 00:52:51', '2015-04-01 00:52:56', 2, 1, 0, '', '', 377),
(380, 'ph', '', '2015-04-01 00:52:56', '2015-04-01 00:53:38', 2, 1, 0, '', '', 377),
(381, 'ph', '<p>zxczxczxczxczxc</p>', '2015-04-01 00:53:38', '2015-04-01 00:56:39', 2, 1, 0, '', '', 377),
(382, 'ph', '<h1>h1</h1>\r\n<h2>h2</h2>\r\n<h3>h3</h3>\r\n<h4>h4</h4>\r\n<h5>h5</h5>\r\n<h6>h6</h6>\r\n<table>\r\n<tbody>\r\n<tr><th>header</th><th>header</th><th>header</th><th>header</th><th>header</th><th>header</th></tr>\r\n<tr>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n</tr>\r\n<tr>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n</tr>\r\n</tbody>\r\n</table>', '2015-04-01 00:56:39', '2015-04-01 10:45:59', 2, 1, 0, '', '', 377),
(383, 'ph', '<h1>h1</h1>\r\n<h2>h2</h2>\r\n<h3>h3</h3>\r\n<h4>h4</h4>\r\n<h5>h5</h5>\r\n<h6>h6</h6>\r\n<h2 class="title">title</h2>\r\n<table class="mainTabel">\r\n<tbody>\r\n<tr><th>header</th><th>header</th><th>header</th><th>header</th><th>header</th><th>header</th></tr>\r\n<tr>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n</tr>\r\n<tr>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n</tr>\r\n</tbody>\r\n</table>', '2015-04-01 10:45:59', '2015-04-01 10:48:38', 2, 1, 0, '', '', 377),
(384, 'ph', '<h1>h1</h1>\r\n<h2>h2</h2>\r\n<h3>h3</h3>\r\n<h4>h4</h4>\r\n<h5>h5</h5>\r\n<h6>h6</h6>\r\n<div class="msg">Thanks for spending your valuable time and taking an effort in reaching to us.</div>\r\n<div class="msg info">Thanks for spending your valuable time and taking an effort in reaching to us.</div>\r\n<div class="msg error">Thanks for spending your valuable time and taking an effort in reaching to us.</div>\r\n<div class="msg worr">Thanks for spending your valuable time and taking an effort in reaching to us.</div>\r\n<h2 class="title">title</h2>\r\n<table class="mainTabel">\r\n<tbody>\r\n<tr><th>header</th><th>header</th><th>header</th><th>header</th><th>header</th><th>header</th></tr>\r\n<tr>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n</tr>\r\n<tr>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n</tr>\r\n</tbody>\r\n</table>', '2015-04-01 10:48:38', '2015-04-01 11:36:24', 2, 1, 0, '', '', 377),
(385, 'ph', '<h1>h1</h1>\r\n<h2>h2</h2>\r\n<h3>h3</h3>\r\n<h4>h4</h4>\r\n<h5>h5</h5>\r\n<h6>h6</h6>\r\n<div class="msg">Thanks for spending your valuable time and taking an effort in reaching to us.</div>\r\n<div class="msg info">Thanks for spending your valuable time and taking an effort in reaching to us.</div>\r\n<div class="msg error">Thanks for spending your<a> valuable time and taking </a>an effort in reaching to us.</div>\r\n<div class="msg worr">Thanks for spending your <a>valuable time and taking an</a> effort in reaching to us.</div>\r\n<h2 class="title">title</h2>\r\n<table class="mainTabel">\r\n<tbody>\r\n<tr><th>header</th><th>header</th><th>header</th><th>header</th><th>header</th><th>header</th></tr>\r\n<tr>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n</tr>\r\n<tr>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n</tr>\r\n</tbody>\r\n</table>', '2015-04-01 11:36:24', '2015-04-01 22:17:08', 2, 1, 0, '', '', 377),
(386, 'ph', '<h1>h1</h1>\r\n<h2>h2</h2>\r\n<h3>h3</h3>\r\n<h4>h4</h4>\r\n<h5>h5</h5>\r\n<h6>h6</h6>\r\n<div class="msg">Thanks for spending your valuable time and taking an effort in reaching to us.</div>\r\n<div class="msg info">Thanks for spending your valuable time and taking an effort in reaching to us.</div>\r\n<div class="msg error">Thanks for spending your<a> valuable time and taking </a>an effort in reaching to us.</div>\r\n<div class="msg worr">Thanks for spending your <a>valuable time and taking an</a> effort in reaching to us.</div>\r\n<div class="button">Button</div>\r\n<div class="button disable">Button</div>\r\n<h2 class="title">title</h2>\r\n<table class="mainTabel">\r\n<tbody>\r\n<tr><th>header</th><th>header</th><th>header</th><th>header</th><th>header</th><th>header</th></tr>\r\n<tr>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n</tr>\r\n<tr>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n<td>body</td>\r\n</tr>\r\n</tbody>\r\n</table>', '2015-04-01 22:17:08', '2015-04-01 22:20:41', 2, 1, 0, '', '', 377),
(387, 'Mutah Reservation', '<p>For reservations please contact M. Murtaza bhai Rangwala on mutah@faizehaakimi.com or call +962-799-996-168</p>', '0000-00-00 00:00:00', '2015-04-02 14:57:36', 0, 1, 0, '', ',64', 0);

-- --------------------------------------------------------

--
-- Table structure for table `com_html_categories`
--

CREATE TABLE IF NOT EXISTS `com_html_categories` (
`id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `des` text COLLATE utf8_unicode_ci NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `cat_id` int(11) NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=81 ;

--
-- Dumping data for table `com_html_categories`
--

INSERT INTO `com_html_categories` (`id`, `title`, `image`, `des`, `delete`, `order`, `enabled`, `created`, `modified`, `cat_id`, `alias`) VALUES
(64, 'General', '', 'General', 0, 1, 1, '2013-04-15 15:46:02', '2014-02-12 00:00:00', 0, 'General'),
(66, 'Social Media', '', 'Social Media', 0, 3, 1, '2014-02-12 14:04:57', '0000-00-00 00:00:00', 0, 'Social-Media'),
(65, 'Others', '', '', 0, 2, 1, '2013-04-17 08:35:49', '2014-02-12 00:00:00', 0, 'Others'),
(67, 'asdasd', '', '', 1, 4, 1, '2014-02-17 13:09:06', '2014-07-09 16:47:02', 0, 'asdasd'),
(68, 'en', '', 'hfgh', 1, 0, 1, '2014-07-08 16:58:00', '2014-07-09 16:47:02', 0, 'ghhhhh'),
(69, 'ggggg', '', 'gggg', 1, 5, 1, '2014-07-08 17:10:54', '2014-07-09 16:47:02', 0, ''),
(70, 'rrrrr', '', 'rrrrr', 1, 6, 1, '2014-07-08 17:11:01', '2014-07-09 16:47:02', 0, ''),
(71, 'rtyrtyrtyrty', '', 'rtyrtyrty', 1, 7, 1, '2014-07-08 17:15:10', '2014-07-09 16:47:02', 0, ''),
(72, 'r77777777', '', '', 1, 8, 1, '2014-07-08 17:15:26', '2014-07-09 16:47:02', 0, ''),
(73, 'en', '', 'utyutyuytu', 1, 0, 1, '2014-07-08 17:15:59', '2014-07-09 16:47:02', 0, 'مشروع-بيت-البركة'),
(74, 'gggg', '', 'gggggg', 1, 0, 1, '2014-07-08 17:16:27', '2014-07-08 18:00:14', 0, 'gg'),
(75, 'sdfsdfsdf', '', 'dfsdfsdfsdsdfsdf', 1, 9, 1, '2014-07-08 17:53:23', '2014-07-08 18:00:14', 0, 'sdf'),
(76, 'fghfgh', '', 'ghfghfgh', 0, 10, 1, '2014-07-08 18:00:32', '0000-00-00 00:00:00', 0, 'fghfgh'),
(77, 'tertertertertertert', '', '', 1, 11, 1, '2014-07-08 18:12:29', '2014-07-08 18:14:53', 0, ''),
(78, 'tttttttttttttttttttttttttttttttttttttttttttttttttttttttt', '', 'tttttttttttttttttttttttttttttttttttt', 1, 12, 1, '2014-07-08 18:12:45', '2014-07-08 18:14:53', 0, ''),
(79, 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb', '', '', 1, 13, 1, '2014-07-08 18:13:27', '2014-07-08 18:14:53', 0, ''),
(80, '00000555555555', '', '', 1, 14, 1, '2014-07-08 18:14:23', '2014-07-08 18:14:53', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `com_html_categories_xref`
--

CREATE TABLE IF NOT EXISTS `com_html_categories_xref` (
`id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `com_html_categories_xref`
--

INSERT INTO `com_html_categories_xref` (`id`, `item_id`, `cat_id`, `delete`, `order`, `enabled`, `modified`, `created`) VALUES
(14, 229, 0, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `com_html_xref`
--

CREATE TABLE IF NOT EXISTS `com_html_xref` (
`id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=134 ;

--
-- Dumping data for table `com_html_xref`
--

INSERT INTO `com_html_xref` (`id`, `item_id`, `cat_id`, `delete`, `order`, `enabled`, `modified`, `created`) VALUES
(61, 230, 65, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 230, 66, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 230, 64, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 229, 65, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 229, 66, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 237, 64, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 264, 64, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 270, 64, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 280, 64, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 281, 64, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 305, 64, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 353, 64, 0, 0, 1, '0000-00-00 00:00:00', '2014-07-06 17:36:53'),
(133, 3, 64, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-02 14:57:36');

-- --------------------------------------------------------

--
-- Table structure for table `com_images_gallery`
--

CREATE TABLE IF NOT EXISTS `com_images_gallery` (
`id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `des` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `th_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `order` tinyint(4) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `cat_id` text COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tags` text COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  `header` text COLLATE utf8_unicode_ci NOT NULL,
  `intro` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=418 ;

--
-- Dumping data for table `com_images_gallery`
--

INSERT INTO `com_images_gallery` (`id`, `title`, `des`, `image`, `th_image`, `enabled`, `order`, `delete`, `created`, `modified`, `cat_id`, `link`, `tags`, `alias`, `description`, `keywords`, `header`, `intro`) VALUES
(417, 'Auditorium', 'State of the art auditorium', 'State of the art Auditorium.jpg', '', 1, 43, 0, '2015-03-20 16:31:12', '2015-03-24 14:52:52', ',64', '', '', 'Auditorium', '', '', '', ''),
(415, 'Terrace Cafeteria', 'Terrace Cafeteria', 'Terrace Cafeteria.jpg', '', 1, 41, 0, '2015-03-20 16:29:56', '2015-03-24 14:53:00', ',64', '', '', 'Terrace-Cafeteria', '', '', '', ''),
(416, 'Terrace Sitting Area', 'Terrace sitting area', 'Terrace Sitting Area.jpg', '', 1, 42, 0, '2015-03-20 16:30:29', '2015-03-24 14:52:55', ',64', '', '', 'Terrace-Sitting-Area', '', '', '', ''),
(414, 'Sahat', 'Sahat', 'Sahat.jpg', '', 1, 40, 0, '2015-03-20 16:29:07', '2015-03-24 14:53:03', ',64', '', '', 'Sahat', '', '', '', ''),
(413, 'Sahat Mawaid', 'Sahat Mawaid', 'Sahat-Mawaid.jpg', '', 1, 39, 0, '2015-03-20 16:28:45', '2015-03-24 14:53:09', ',64', '', '', 'Sahat-Mawaid', '', '', '', ''),
(411, 'Lounge 2', 'Lounge', 'Lounge-2.jpg', '', 1, 37, 0, '2015-03-20 16:27:55', '2015-03-24 14:53:20', ',64', '', '', 'Lounge-2', '', '', '', ''),
(412, 'Mawaid', 'Mawaid', 'Mawaid.jpg', '', 1, 38, 0, '2015-03-20 16:28:18', '2015-03-24 14:53:17', ',64', '', '', 'Mawaid', '', '', '', ''),
(410, 'Lounge 2', 'Lounge', 'Lounge-2.jpg', '', 1, 36, 0, '2015-03-20 16:27:55', '2015-03-24 14:53:25', ',64', '', '', 'Lounge-2', '', '', '', ''),
(409, 'Lounge 1', 'Lounge', 'Lounge-1.jpg', '', 1, 35, 0, '2015-03-20 16:27:34', '2015-03-24 14:54:11', ',64', '', '', 'Lounge-1', '', '', '', ''),
(408, 'Sitting room in suite', 'Sitting room in suite', 'Sitting Room in Suite.jpg', '', 1, 34, 0, '2015-03-20 16:27:07', '2015-03-24 14:54:16', ',64', '', '', 'Sitting-room-in-suite', '', '', '', ''),
(407, 'Deluxe Suite Room', 'Deluxe Suite Room', 'Deluxe Suite Room.jpg', '', 1, 33, 0, '2015-03-20 16:26:29', '0000-00-00 00:00:00', ',64', '', '', 'Deluxe-Suite-Room', '', '', '', ''),
(406, 'Deluxe Suite Room', 'Deluxe Suite Room', 'Deluxe-Suite Room.jpg', '', 1, 32, 0, '2015-03-20 16:25:57', '0000-00-00 00:00:00', ',64', '', '', 'Deluxe-Suite-Room', '', '', '', ''),
(405, 'Standard Room', 'Standard Room', 'Standard Room.jpg', '', 1, 31, 0, '2015-03-20 16:25:18', '0000-00-00 00:00:00', ',64', '', '', 'Standard-Room', '', '', '', ''),
(385, 'Jame Anwar Egypt_pyramids', '', 'egypt_pyramids-wide-home.jpg', '', 1, 19, 0, '2014-05-25 09:09:18', '2015-03-24 12:19:09', ',66', '', '', 'Jame-Anwar-Egypt-pyramids', '', '', '', ''),
(386, 'Faiz Front ', '', 'Faiz-Front-Elevation-home.jpg', '', 1, 20, 0, '2014-05-25 09:09:36', '2015-03-31 13:33:00', ',66', '', '', 'Faiz-Front', '', '', '', ''),
(387, 'Cairo-Home', '', 'cairo-home.jpg', '', 1, 21, 0, '2014-05-25 09:09:48', '2015-03-24 12:21:06', ',66', '', '', 'Cairo-Home', '', '', '', ''),
(388, 'Anwar-Home', '', 'anwar-home.jpg', '', 1, 22, 0, '2014-05-25 09:10:03', '2015-03-24 12:21:52', ',66', '', '', 'Anwar-Home', '', '', '', ''),
(404, 'Standard Twin Bed room', 'Standard Twin Bedroom', 'Standard Twin Bed Room.jpg', '', 1, 30, 0, '2015-03-20 16:24:44', '0000-00-00 00:00:00', ',64', '', '', 'Standard-Twin-Bed-room', '', '', '', ''),
(403, 'Standard Twin Bedroom', 'Standard Twin Bedroom', 'Standard Twin Bedroom.jpg', '', 1, 29, 0, '2015-03-20 16:24:17', '0000-00-00 00:00:00', ',64', '', '', 'Standard-Twin-Bedroom', '', '', '', ''),
(402, 'Entrance Back Lobby', 'Entrance back lobby', 'Entrance Back Lobby.jpg', '', 1, 28, 0, '2015-03-20 16:23:29', '0000-00-00 00:00:00', ',64', '', '', 'Entrance-Back-Lobby', '', '', '', ''),
(401, 'Entrance Lobby', 'Entrance Lobby', 'Entrance Lobby.jpg', '', 1, 27, 0, '2015-03-20 16:23:01', '0000-00-00 00:00:00', ',64', '', '', 'Entrance-Lobby', '', '', '', ''),
(400, 'Faiz main entrance', 'Faiz main entrance', 'Faiz Main Entrance.jpg', '', 1, 26, 0, '2015-03-20 16:22:29', '0000-00-00 00:00:00', ',64', '', '', 'Faiz-main-entrance', '', '', '', ''),
(397, 'Faiz front elevation', 'Faiz front elevation', 'Faiz Front Elevation.jpg', '', 1, 23, 0, '2015-03-20 16:15:30', '0000-00-00 00:00:00', ',64', '', '', 'Faiz-front-elevation', '', '', '', ''),
(398, 'Faiz night view with Jame Anwar in the  far background', 'Faiz night view with Jame Anwar in the  far background', 'Faiz Night view with Jame Anwar in the far background.jpg', '', 1, 24, 0, '2015-03-20 16:16:17', '0000-00-00 00:00:00', ',64', '', '', 'Faiz-night-view-with-Jame-Anwar-in-the--far-background', '', '', '', ''),
(399, 'Faiz Reception', 'Faiz reception', 'Faiz Reception.jpg', '', 1, 25, 0, '2015-03-20 16:21:44', '0000-00-00 00:00:00', ',64', '', '', 'Faiz-Reception', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `com_images_gallery_categories`
--

CREATE TABLE IF NOT EXISTS `com_images_gallery_categories` (
`id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `des` text COLLATE utf8_unicode_ci NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `cat_id` int(11) NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=68 ;

--
-- Dumping data for table `com_images_gallery_categories`
--

INSERT INTO `com_images_gallery_categories` (`id`, `title`, `image`, `des`, `delete`, `order`, `enabled`, `created`, `modified`, `cat_id`, `alias`) VALUES
(64, 'Faiz', '52a06a114b17b.JPG', '', 0, 1, 1, '2013-04-15 15:46:02', '2013-12-05 00:00:00', 0, 'Faiz'),
(65, 'Accomodation', '52a06a5c3b2ef.JPG', '', 0, 2, 1, '2013-04-17 08:35:49', '2013-12-05 00:00:00', 0, 'Accomodation'),
(66, 'Home Slideshow', '', '', 0, 3, 1, '2014-01-22 09:26:42', '2014-05-25 09:20:16', 0, 'Home-Slideshow'),
(67, 'Auditorium', '', '', 0, 4, 1, '2014-05-25 09:24:41', '0000-00-00 00:00:00', 0, 'Auditorium');

-- --------------------------------------------------------

--
-- Table structure for table `com_images_gallery_xref`
--

CREATE TABLE IF NOT EXISTS `com_images_gallery_xref` (
`id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=463 ;

--
-- Dumping data for table `com_images_gallery_xref`
--

INSERT INTO `com_images_gallery_xref` (`id`, `item_id`, `cat_id`, `delete`, `order`, `enabled`, `modified`, `created`) VALUES
(6, 149, 38, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 148, 38, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 150, 38, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 151, 38, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 152, 40, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(207, 153, 41, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(205, 155, 41, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, 156, 41, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, 157, 41, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 158, 44, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 159, 44, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 160, 45, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 152, 41, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 162, 46, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, 163, 46, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(333, 164, 46, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 165, 46, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, 166, 46, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 167, 46, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 168, 46, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, 169, 46, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 170, 46, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 171, 46, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 172, 46, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, 173, 46, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 174, 46, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 175, 46, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 176, 46, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 177, 46, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 178, 46, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 179, 46, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 180, 46, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 181, 46, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 182, 46, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 183, 46, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 184, 46, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 185, 46, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 186, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 187, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 188, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 189, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 190, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 191, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 192, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 193, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 194, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 195, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 196, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 197, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 198, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 199, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 200, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 201, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 202, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 203, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 204, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 205, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 206, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 207, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 208, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 209, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 210, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 211, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 212, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 213, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 214, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 215, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 216, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 217, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 218, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 219, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 220, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 221, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 222, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 223, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 224, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 225, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 226, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 227, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 228, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 229, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 230, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 231, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 232, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 233, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 234, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 235, 47, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(330, 236, 55, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(320, 237, 55, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(308, 238, 48, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(307, 239, 48, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(306, 240, 48, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(305, 241, 55, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(302, 242, 48, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(303, 243, 48, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(301, 244, 48, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(300, 245, 48, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(332, 246, 48, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(328, 247, 48, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(331, 248, 48, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(326, 249, 48, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(324, 250, 48, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(325, 251, 48, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(327, 252, 48, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(323, 253, 48, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(322, 254, 48, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(321, 255, 48, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(318, 256, 48, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(317, 257, 48, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(315, 258, 48, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(316, 259, 48, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(314, 260, 48, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(313, 261, 48, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(312, 262, 48, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(311, 263, 48, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(309, 264, 48, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 265, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 266, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, 267, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 268, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 269, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 270, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 271, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 272, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 273, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 274, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, 275, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 276, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 277, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 278, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 279, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 280, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 281, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, 282, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, 283, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, 284, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, 285, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, 286, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 287, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 288, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, 289, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, 290, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, 291, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, 292, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, 293, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, 294, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, 295, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, 296, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, 297, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, 298, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, 299, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, 300, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, 301, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, 302, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(299, 303, 50, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(287, 304, 50, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(279, 306, 50, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(277, 307, 50, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(274, 308, 50, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(276, 309, 50, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(272, 310, 50, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(270, 311, 50, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(298, 312, 50, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(297, 313, 50, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(295, 314, 50, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(294, 315, 50, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(293, 316, 50, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(291, 317, 50, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(290, 318, 50, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(288, 319, 50, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(286, 320, 50, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(285, 321, 50, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(278, 322, 50, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, 323, 51, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, 324, 57, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, 325, 57, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(183, 326, 57, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, 327, 57, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, 328, 57, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, 329, 57, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, 163, 55, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(190, 166, 55, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, 169, 55, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, 173, 55, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(319, 237, 48, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(329, 236, 48, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(304, 241, 48, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, 157, 54, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(204, 156, 54, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(206, 155, 54, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, 153, 54, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(292, 154, 41, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(222, 330, 58, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(223, 331, 58, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(224, 332, 58, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(225, 333, 58, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(226, 334, 58, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(227, 336, 58, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(228, 337, 58, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(229, 338, 19, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(230, 338, 38, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(231, 338, 40, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(232, 339, 19, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(233, 339, 38, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(234, 339, 40, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(235, 340, 19, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(236, 340, 38, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(237, 340, 40, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(239, 341, 60, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(240, 342, 61, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(241, 343, 61, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(242, 344, 19, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(243, 344, 38, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(244, 344, 61, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(245, 345, 61, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(246, 346, 62, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(247, 347, 62, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(248, 348, 62, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(250, 349, 54, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(251, 349, 63, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(252, 350, 54, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(253, 350, 63, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(254, 351, 54, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(255, 351, 63, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(256, 352, 54, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(257, 352, 63, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(258, 353, 54, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(259, 353, 63, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(260, 354, 54, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(261, 354, 63, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(262, 355, 54, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(263, 355, 63, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(264, 356, 54, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(265, 356, 63, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(266, 357, 54, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(267, 357, 63, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(268, 358, 54, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(269, 358, 63, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(271, 311, 55, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(273, 310, 55, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(275, 308, 55, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(296, 305, 50, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(289, 319, 55, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(385, 359, 66, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(375, 360, 65, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(350, 361, 65, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(347, 362, 65, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(349, 363, 64, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(358, 364, 65, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(390, 370, 65, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(354, 369, 65, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(355, 368, 65, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(356, 367, 65, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(344, 366, 65, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(357, 365, 65, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(389, 370, 64, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(387, 372, 66, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(388, 371, 66, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(391, 373, 65, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(392, 374, 65, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(393, 375, 65, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(395, 376, 64, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(396, 376, 65, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(397, 377, 65, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(398, 378, 65, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(399, 379, 65, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(400, 380, 65, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(401, 381, 65, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(402, 383, 65, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(403, 384, 65, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(441, 385, 66, 0, 0, 1, '0000-00-00 00:00:00', '2015-03-24 12:19:09'),
(462, 386, 66, 0, 0, 1, '0000-00-00 00:00:00', '2015-03-31 13:33:00'),
(445, 387, 66, 0, 0, 1, '0000-00-00 00:00:00', '2015-03-24 12:21:06'),
(447, 388, 66, 0, 0, 1, '0000-00-00 00:00:00', '2015-03-24 12:21:52'),
(408, 389, 67, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(409, 390, 67, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(410, 391, 67, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(416, 392, 67, 0, 0, 1, '0000-00-00 00:00:00', '2014-07-15 09:24:40'),
(412, 393, 64, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(413, 394, 64, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(414, 395, 64, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(415, 396, 64, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(419, 3, 64, 0, 0, 1, '0000-00-00 00:00:00', '2015-03-20 16:21:44'),
(437, 4, 64, 0, 0, 1, '0000-00-00 00:00:00', '2015-03-20 16:31:12'),
(452, 414, 64, 0, 0, 1, '0000-00-00 00:00:00', '2015-03-24 14:53:03'),
(449, 417, 64, 0, 0, 1, '0000-00-00 00:00:00', '2015-03-24 14:52:52'),
(450, 416, 64, 0, 0, 1, '0000-00-00 00:00:00', '2015-03-24 14:52:55'),
(451, 415, 64, 0, 0, 1, '0000-00-00 00:00:00', '2015-03-24 14:53:00'),
(453, 413, 64, 0, 0, 1, '0000-00-00 00:00:00', '2015-03-24 14:53:09'),
(455, 412, 64, 0, 0, 1, '0000-00-00 00:00:00', '2015-03-24 14:53:17'),
(456, 411, 64, 0, 0, 1, '0000-00-00 00:00:00', '2015-03-24 14:53:20'),
(457, 410, 64, 0, 0, 1, '0000-00-00 00:00:00', '2015-03-24 14:53:25'),
(460, 409, 64, 0, 0, 1, '0000-00-00 00:00:00', '2015-03-24 14:54:11'),
(461, 408, 64, 0, 0, 1, '0000-00-00 00:00:00', '2015-03-24 14:54:16');

-- --------------------------------------------------------

--
-- Table structure for table `com_install`
--

CREATE TABLE IF NOT EXISTS `com_install` (
`id` int(11) NOT NULL,
  `ins_title` varchar(255) DEFAULT NULL,
  `ins_alias` varchar(255) NOT NULL,
  `ins_type` varchar(255) DEFAULT NULL,
  `delete` tinyint(4) DEFAULT '0',
  `order` int(11) DEFAULT '0',
  `enabled` tinyint(4) DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `ins_for` varchar(255) DEFAULT NULL,
  `default` tinyint(4) NOT NULL,
  `properties` text NOT NULL,
  `com_id` text NOT NULL,
  `type` varchar(250) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=137 ;

--
-- Dumping data for table `com_install`
--

INSERT INTO `com_install` (`id`, `ins_title`, `ins_alias`, `ins_type`, `delete`, `order`, `enabled`, `created`, `modified`, `image`, `ins_for`, `default`, `properties`, `com_id`, `type`) VALUES
(47, 'html', 'com_html', 'component', 0, 0, 1, '2012-03-26 04:55:47', NULL, NULL, 'fornt', 0, '', '', ''),
(49, 'content', 'com_content_article', 'component', 0, 0, 1, '2012-03-26 04:56:47', NULL, NULL, 'fornt', 0, '', '', ''),
(50, 'code htmil', 'mod_htmlcode', 'module', 1, 0, 1, '2012-03-26 07:32:50', NULL, NULL, 'fornt', 0, '', '', ''),
(51, 'menu', 'mod_menu', 'module', 1, 0, 1, '2012-03-26 11:39:43', NULL, NULL, 'fornt', 0, '', '', ''),
(52, 'Contact', 'com_contect', 'component', 0, 2, 1, '2012-03-27 08:32:32', '2013-03-07 00:00:00', NULL, 'fornt', 0, '', '', ''),
(53, 'Images Gallery', 'com_images_gallery', 'component', 0, 0, 1, '2012-03-29 07:24:13', '2013-03-07 00:00:00', NULL, 'fornt', 0, '', '', ''),
(80, 'style55', 'style', 'template', 1, 0, 1, '2013-01-21 07:21:36', NULL, NULL, NULL, 0, 'color__a633a6;', '', ''),
(56, 'Iframe', 'mod_iframe', 'module', 1, 0, 1, '2012-04-02 06:05:24', NULL, NULL, 'fornt', 0, '', '', ''),
(57, 'iframe', 'mod_iframe', 'module', 1, 0, 1, '2012-04-02 08:49:03', NULL, NULL, 'fornt', 0, '', '', ''),
(58, 'slideShow', 'mod_slide_show', 'module', 1, 0, 1, '2012-04-02 16:28:16', NULL, NULL, 'fornt', 0, '', '', ''),
(61, 'Modules', 'com_modules', 'plugin', 1, 0, 1, '2012-04-19 05:47:32', NULL, NULL, 'fornt', 0, '', '', ''),
(79, 'sss', 'style', 'style', 0, 0, 1, '2013-01-21 07:17:14', NULL, NULL, NULL, 0, 'color__400c40;', '', ''),
(65, 'Products', 'com_products', 'component', 0, 0, 1, '2012-04-24 14:56:50', NULL, NULL, 'fornt', 0, '', '', ''),
(66, 'Trash', 'com_trash', 'plugin', 1, 0, 1, '2012-04-25 07:05:21', NULL, NULL, 'fornt', 0, '', '', ''),
(67, 'styleDark', 'style', 'template', 0, 0, 1, '2012-04-26 04:00:36', '2013-01-13 09:43:27', NULL, NULL, 0, 'color__525150;', '', ''),
(68, 'Groups', 'com_users_groups', 'plugin', 1, 0, 1, '2012-07-09 09:32:48', '2012-07-09 14:21:20', NULL, 'fornt', 0, '', '', ''),
(69, 'FAQ', 'com_faq', 'component', 0, 1, 1, '2012-10-07 05:54:05', NULL, NULL, 'fornt', 0, '', '', ''),
(70, 'Video  Gallery', 'com_video_gallery', 'component', 0, 3, 1, '2012-10-08 11:55:57', '2013-01-20 00:00:00', NULL, 'fornt', 0, '', '', ''),
(71, 'News Letter', 'com_newsLetter', 'plugin', 0, 0, 1, '2012-11-28 14:52:04', NULL, NULL, 'fornt', 0, '', '', ''),
(78, 'All menus Items', 'menu_itmes', 'plugin', 1, 0, 1, '2013-01-21 01:52:06', NULL, NULL, 'fornt', 0, '', '', ''),
(74, 'styleLight', 'style', 'template', 0, 0, 1, '2012-04-26 04:00:36', '2014-05-01 06:11:03', NULL, NULL, 1, 'color__fffaff;', '', ''),
(75, 'Test template', 'style', 'style', 0, 0, 1, '2013-01-17 02:23:33', NULL, NULL, NULL, 0, 'color__4fdbd6;', '', ''),
(76, 'Test template', 'style', 'style', 0, 0, 1, '2013-01-17 02:24:35', NULL, NULL, NULL, 0, 'color__15c4db;', '', ''),
(87, 'Wizard', 'com_wizard', 'component', 0, 6, 1, '2013-04-18 04:54:53', NULL, NULL, 'fornt', 0, '', '', ''),
(81, 'Cities', 'com_cities_categories', 'plugin', 0, 0, 1, '2013-03-18 07:32:24', '2013-05-02 00:00:00', NULL, 'fornt', 0, '', '', ''),
(82, 'google ADS', 'com_google_adsense', 'plugin', 0, 0, 1, '2013-03-30 09:43:08', NULL, NULL, 'fornt', 0, '', '', ''),
(83, 'Polling', 'com_poll_questions', 'plugin', 0, 0, 1, '2013-03-30 15:15:25', NULL, NULL, 'fornt', 0, '', '', ''),
(84, 'Events', 'com_events', 'component', 0, 0, 1, '2013-04-01 13:38:45', NULL, NULL, 'fornt', 0, '', '', ''),
(85, 'source', 'plg_rescores', '', 0, 4, 1, '2013-04-06 11:13:00', '2014-02-12 00:00:00', NULL, 'fornt', 0, '', '53,70', ''),
(86, 'Gustbook', 'com_gustbook', 'component', 0, 5, 1, '2013-04-17 10:39:37', '2013-04-17 00:00:00', NULL, 'fornt', 0, '', '', ''),
(88, 'Form', 'com_form', 'plugin', 0, 7, 1, '2013-04-22 12:50:10', NULL, NULL, 'fornt', 0, '', '', ''),
(89, 'paypal', 'plg_paypal', 'plugin', 0, 8, 1, '2013-05-02 11:10:58', NULL, NULL, 'fornt', 0, '', '65', ''),
(90, '2checkout', 'plg_2checkout', 'plugin', 0, 9, 1, '2013-05-02 11:15:56', NULL, NULL, 'fornt', 0, '', '', ''),
(91, 'Data', 'com_data', 'plugin', 0, 10, 1, '2013-05-28 10:42:58', NULL, NULL, 'fornt', 0, '', '', ''),
(92, 'Query', 'com_qery', 'plugin', 0, 11, 1, '2013-06-05 06:21:06', NULL, NULL, 'fornt', 0, '', '', ''),
(93, 'cquery', 'com_query', 'plugin', 0, 12, 1, '2013-06-06 05:09:38', NULL, NULL, 'fornt', 0, '', '', ''),
(94, 'dataBluder', 'sys_dataBluder', 'plugin', 0, 13, 1, '2013-08-21 12:26:17', NULL, NULL, 'fornt', 0, '', '', ''),
(95, 'query', 'sys_query', 'plugin', 0, 14, 1, '2013-08-21 12:50:49', NULL, NULL, 'fornt', 0, '', '', ''),
(96, 'Data', 'com_data', 'plugin', 0, 15, 1, '2013-08-25 07:24:14', NULL, NULL, 'fornt', 0, '', '', ''),
(97, 'PKGS', 'com_pkgs', 'plugin', 0, 16, 1, '2013-10-07 07:37:21', NULL, NULL, 'fornt', 0, '', '', ''),
(98, 'reservations', 'com_reservations', 'plugin', 0, 17, 1, '2013-10-07 12:17:33', NULL, NULL, 'fornt', 0, '', '', ''),
(99, 'mobile config', 'sys_mobile_setting', 'plugin', 0, 18, 1, '2013-10-21 09:32:02', NULL, NULL, 'fornt', 0, '', '', ''),
(100, 'APP', 'com_app', 'GET__type', 0, 19, 1, '2013-11-11 17:18:12', NULL, NULL, 'fornt', 0, '', '', ''),
(101, 'App', 'com_app', 'component', 0, 20, 1, '2013-11-11 17:19:08', NULL, NULL, 'fornt', 0, '', '', ''),
(102, 'ImageGallary', 'plg_imagegallery', '', 0, 21, 1, '2013-12-11 07:55:28', '2014-02-12 00:00:00', NULL, 'fornt', 0, '', '49,70', ''),
(103, 'videoGallery', 'plg_videosgallery', '', 0, 22, 1, '2013-12-11 16:16:10', '2014-02-12 00:00:00', NULL, 'fornt', 0, '', '49', ''),
(104, 'MoreData', 'plg_moreData', '', 0, 23, 1, '2013-12-18 14:18:40', '2014-02-12 00:00:00', NULL, 'fornt', 0, '', '49', ''),
(105, 'PageHtml', 'plg_PageData', 'plugin', 0, 24, 1, '2013-12-19 13:47:18', NULL, NULL, 'fornt', 0, '', '47', ''),
(106, 'PageHtml', 'plg_PageData', 'plugin', 0, 25, 1, '2013-12-19 13:47:22', NULL, NULL, 'fornt', 0, '', '47', ''),
(107, 'PageData', 'plg_PageData', 'plugin', 0, 26, 1, '2013-12-19 13:51:29', '2013-12-20 00:00:00', NULL, 'fornt', 0, '', '49', ''),
(108, 'getForm', 'plg_getForm', '', 0, 27, 1, '2013-12-19 14:50:35', '2014-02-12 00:00:00', NULL, 'fornt', 0, '', '49', ''),
(110, 'Admin Menu', 'sys_admin_menu', 'component', 0, 29, 1, '2013-12-29 07:05:39', NULL, NULL, 'fornt', 0, '', '', ''),
(111, 'Projects', 'com_project', 'component', 0, 30, 1, '2014-01-06 11:35:43', '2014-01-14 00:00:00', NULL, 'fornt', 0, '', '', ''),
(112, 'Google Map', 'com_google_map', 'component', 0, 31, 1, '2014-01-07 03:39:07', NULL, NULL, 'fornt', 0, '', '', ''),
(113, 'cart', 'plg_cart', 'plugin', 0, 32, 1, '2014-01-15 04:18:39', NULL, NULL, 'fornt', 0, '', '111', ''),
(114, 'Front User Setting', 'com_users_settings', 'component', 0, 33, 1, '2014-01-20 09:13:18', NULL, NULL, 'fornt', 0, '', '', ''),
(115, 'Comments', 'plg_comments', 'plugin', 0, 34, 1, '2014-03-05 07:04:37', NULL, NULL, 'fornt', 0, '', ',-1', ''),
(116, 'order', 'plugincart_order', 'plugin', 0, 35, 1, '2014-03-21 16:14:47', NULL, NULL, 'fornt', 0, '', '', ''),
(118, 'invitation', 'invitation', 'template', 0, 0, 1, '2014-05-01 05:07:21', '2014-05-01 10:59:45', NULL, NULL, 0, '', '', ''),
(119, 'invitation', 'com_invitation', 'component', 0, 36, 1, '2014-05-01 07:18:54', '2014-05-01 07:19:31', NULL, 'fornt', 0, '', '', ''),
(120, 'NGo Style', 'ngoStyle', 'template', 0, 0, 1, '2014-05-04 12:40:23', '2014-05-04 12:40:56', NULL, NULL, 0, '', '', ''),
(121, 'Faiz City', 'fiz_city', 'plugin', 0, 37, 1, '2014-06-02 14:37:56', NULL, NULL, 'fornt', 0, '', '', ''),
(122, 'fiz_lawazim_packages', 'fiz_lawazim_packages', 'plugin', 0, 38, 1, '2014-06-02 14:38:29', NULL, NULL, 'fornt', 0, '', '', ''),
(123, 'reservation settings', 'fiz_reservation_settings', 'plugin', 0, 39, 1, '2014-06-02 16:21:09', NULL, NULL, 'fornt', 0, '', '', ''),
(124, 'Extension', 'fiz_extension', 'component', 0, 40, 1, '2014-06-09 16:31:20', NULL, NULL, 'fornt', 0, '', '', ''),
(125, 'Extension Admin', 'extension', 'component', 0, 41, 1, '2014-06-10 05:19:03', NULL, NULL, 'fornt', 0, '', '', ''),
(126, 'Voucher', 'voucher', 'component', 0, 42, 1, '2014-06-15 10:05:36', NULL, NULL, 'fornt', 0, '', '', ''),
(127, 'Hotels', 'fiz_hotels', 'component', 0, 43, 1, '2014-06-15 10:05:59', NULL, NULL, 'fornt', 0, '', '', ''),
(128, 'Language', 'com_language', 'component', 0, 44, 1, '2014-06-15 16:51:57', NULL, NULL, 'fornt', 0, '', '', ''),
(129, 'cashier', 'fiz_extension_cashier', 'component', 0, 45, 1, '2014-07-14 15:20:54', NULL, NULL, 'fornt', 0, '', '', ''),
(130, 'cashier receipt print', 'fiz_cashier_receipt_print', 'component', 0, 46, 1, '2014-07-14 18:57:37', NULL, NULL, 'fornt', 0, '', '', ''),
(131, 'reservations', 'fiz_reservations', 'component', 0, 47, 1, '2014-07-20 15:31:26', NULL, NULL, 'fornt', 0, '', '', ''),
(132, 'raza Types', 'fiz_raza_types', 'component', 0, 48, 1, '2014-07-20 17:12:31', NULL, NULL, 'fornt', 0, '', '', ''),
(133, 'email Templates', 'com_mailsTemplates', 'component', 0, 49, 1, '2014-07-22 20:25:23', NULL, NULL, 'fornt', 0, '', '', ''),
(134, 'cashier refund', 'fiz_cashier_receipt_refund', 'component', 0, 50, 1, '2014-07-30 17:33:25', NULL, NULL, 'fornt', 0, '', '', ''),
(135, 'ejamaat', 'plg_ejamaat', 'plugin', 0, 51, 1, '2015-03-20 12:23:26', NULL, NULL, 'fornt', 0, '', '', 'typ_users'),
(136, 'SiteStatus', 'sys_site_status', 'component', 0, 52, 1, '2015-04-01 12:52:48', NULL, NULL, 'fornt', 0, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `com_invitation`
--

CREATE TABLE IF NOT EXISTS `com_invitation` (
`id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `code` text NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `delete` int(11) NOT NULL,
  `enabled` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `plugins_data` text NOT NULL,
  `cat_id` text NOT NULL,
  `history` int(11) NOT NULL,
  `openurl` text NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `com_invitation`
--

INSERT INTO `com_invitation` (`id`, `title`, `code`, `modified`, `created`, `delete`, `enabled`, `order`, `plugins_data`, `cat_id`, `history`, `openurl`) VALUES
(1, 'Dummy Code', '123456', '2014-05-02 14:16:10', '2014-05-01 10:36:48', 0, 1, 0, '', '', 0, ''),
(2, 'Madad Wedding Code', 'Wedding2014', '0000-00-00 00:00:00', '2014-05-02 14:16:40', 0, 1, 0, '', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `com_language`
--

CREATE TABLE IF NOT EXISTS `com_language` (
`id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `delete` int(11) NOT NULL,
  `enabled` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `l_image` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `com_language`
--

INSERT INTO `com_language` (`id`, `title`, `modified`, `created`, `delete`, `enabled`, `order`, `l_image`) VALUES
(1, 'en', '2014-06-15 17:05:33', '2014-06-15 16:56:16', 0, 1, 0, '539e26bd520f6.gif'),
(2, 'ar', '2014-06-15 17:05:11', '2014-06-15 16:56:32', 0, 1, 0, '539e26a777e3a.png'),
(3, 'ar', '2014-06-15 17:05:11', '2014-06-15 16:56:32', 0, 1, 0, '539e26a777e3a.png');

-- --------------------------------------------------------

--
-- Table structure for table `com_mailsTemplates`
--

CREATE TABLE IF NOT EXISTS `com_mailsTemplates` (
`id` int(11) NOT NULL,
  `recipients` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `delete` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `sender_name` varchar(255) NOT NULL,
  `sender_mail` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `com_mailsTemplates`
--

INSERT INTO `com_mailsTemplates` (`id`, `recipients`, `title`, `body`, `modified`, `created`, `delete`, `enabled`, `order`, `subject`, `sender_name`, `sender_mail`) VALUES
(1, '', 'sales@kwikheatpacks.com', '<div style="border: solid #e0e0e0 1.0pt; margin: auto; width: 736px;">\r\n<p><img src="http://kwikheatpacks.com/templates/style/css/images/logo.png" alt="Kwikheat Logo" /></p>\r\n<p>&nbsp;</p>\r\n<h1>Greetings!</h1>\r\n<p>Thank you for ordering from kwikheatpacks.com.</p>\r\n<p>We Wish you happy hours of relaxing heat therapy for you and your loved ones!</p>\r\n<p>For special offers and the latest on the Kwikheat Community, please follow us on <a href="http://www.facebook.com/kwikheatpacks">www.facebook.com/kwikheatpacks</a> or <a href="http://www.twitter.com/kwikheatpacks">www.twitter.com/kwikheatpacks</a>.</p>\r\n<p>This email contains important information regarding your recent purchase. Please save it for reference.</p>\r\n<p>If you have any questions about this order or the products/services you''ve purchased, please feel free to visit our <a href="http://kwikheatpacks.com/Contact/">Contact</a> page.<br /> <br /> Sincerely,<br /> <br /> The Kwikheat Team&nbsp;</p>\r\n</div>', '2013-05-21 00:00:00', '0000-00-00 00:00:00', 0, 1, 0, 'Your order details', 'Kwikheat Sales', 'sales@kwikheatpacks.com');

-- --------------------------------------------------------

--
-- Table structure for table `com_menus`
--

CREATE TABLE IF NOT EXISTS `com_menus` (
`id` int(11) NOT NULL,
  `men_title` varchar(250) NOT NULL,
  `men_alias` varchar(250) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `com_menus`
--

INSERT INTO `com_menus` (`id`, `men_title`, `men_alias`, `modified`, `created`, `enabled`, `order`, `delete`, `cat_id`) VALUES
(8, 'main menu', 'topmenu', '2015-04-01 22:46:30', '2012-04-26 04:23:48', 1, 0, 0, 0),
(10, 'Locations Menu ', 'ourmenu', '2015-04-01 22:46:30', '2012-12-03 08:32:52', 1, 0, 0, 0),
(13, 'Top Menu', 'TopMenu', '2015-04-01 22:46:30', '2013-04-13 06:19:37', 1, 0, 0, 0),
(14, 'faiz bottommenu', 'bottommenu', '2015-04-01 22:46:30', '2013-04-17 05:34:35', 1, 0, 0, 0),
(15, 'mobile', 'mobile', '2015-04-01 22:46:30', '2013-10-22 04:49:12', 1, 0, 0, 0),
(18, 'testing new', 'testing-new', '0000-00-00 00:00:00', '2013-12-04 18:46:39', 1, 0, 1, 0),
(19, 'Menu after header', 'Menu-after-header', '0000-00-00 00:00:00', '2015-04-01 22:47:13', 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `com_modules`
--

CREATE TABLE IF NOT EXISTS `com_modules` (
`id` int(11) NOT NULL,
  `mod_label` varchar(255) NOT NULL,
  `mod_viewall` tinyint(4) NOT NULL,
  `mod_title` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `created` datetime NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `modified` datetime NOT NULL,
  `view_title` tinyint(4) NOT NULL,
  `morecss` text NOT NULL,
  `properties` text NOT NULL,
  `position` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `class` varchar(255) DEFAULT NULL,
  `permission` text NOT NULL,
  `permission_all` tinyint(4) NOT NULL,
  `site` text NOT NULL,
  `all_site` tinyint(4) NOT NULL,
  `permission_gust` tinyint(4) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=294 ;

--
-- Dumping data for table `com_modules`
--

INSERT INTO `com_modules` (`id`, `mod_label`, `mod_viewall`, `mod_title`, `order`, `enabled`, `created`, `delete`, `modified`, `view_title`, `morecss`, `properties`, `position`, `type`, `class`, `permission`, `permission_all`, `site`, `all_site`, `permission_gust`) VALUES
(290, '', 0, 'Location Menu Other pages', 34, 1, '2014-05-21 13:34:58', 0, '2015-04-01 21:44:13', 0, '', '', 'left', 'mod_Menu', 'nostyle', '', 1, '', 1, 0),
(284, '', 1, 'SunsetSunrise', 31, 1, '2014-05-21 13:08:28', 0, '2015-03-24 13:00:05', 0, '', '', 'footer_left', 'mod_sunsetSunrise', 'nostyle', '', 1, '', 1, 0),
(285, '', 1, 'mwnu', 32, 1, '2014-05-21 13:10:54', 0, '2015-04-01 21:36:26', 0, '', '', 'mainmenu', 'mod_Menu', 'nostyle', '', 1, ',1', 1, 0),
(286, '', 1, 'BottomMenu', 32, 1, '2014-05-21 13:10:54', 0, '2015-03-24 13:00:05', 0, '', '', 'footer_right', 'mod_Menu', 'nostyle', '', 1, '', 1, 0),
(287, '', 0, 'Cairo', 33, 1, '2014-05-21 13:30:01', 0, '2015-04-01 15:55:13', 1, '', '', 'slideShow_right', 'mod_Slide_Show', 'nostyle', '', 1, ',1', 1, 0),
(288, '', 1, 'headermenu', 34, 1, '2014-05-21 13:34:58', 0, '2015-04-01 22:57:07', 1, '', '', 'our_menu', 'mod_Menu', 'nostyle', '', 1, ',0', 1, 0),
(289, '', 0, 'Location Menu Homepage', 34, 1, '2014-05-21 13:34:58', 0, '2015-04-01 22:43:50', 0, '', '', 'slideShow_left', 'mod_Menu', 'nostyle', '', 1, ',2', 1, 0),
(291, '', 0, 'newsTaker', 35, 1, '2015-03-25 16:24:47', 0, '2015-03-25 18:09:56', 1, '', '', 'main_top_left', 'mod_news_Ticker', 'nostyle', '', 1, '', 1, 0),
(292, '', 0, 'WeatherTime', 36, 1, '2015-03-25 16:30:04', 0, '2015-03-25 18:10:57', 0, '', '', 'main_top_right', 'mod_weatherTime', 'nostyle', '', 1, '', 1, 0),
(293, '', 0, 'news', 37, 1, '2015-04-02 12:00:44', 0, '2015-04-02 14:48:57', 1, '', '', 'left', 'mod_News_Data', 'CategoryMenu', '', 1, '', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `com_modules_permission_xref`
--

CREATE TABLE IF NOT EXISTS `com_modules_permission_xref` (
`id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `com_modules_permission_xref`
--

INSERT INTO `com_modules_permission_xref` (`id`, `item_id`, `cat_id`, `delete`, `order`, `enabled`, `modified`, `created`) VALUES
(28, 151, 38, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 178, 3, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 175, 4, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 175, 3, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 148, 38, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 149, 38, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 150, 38, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `com_modules_site_xref`
--

CREATE TABLE IF NOT EXISTS `com_modules_site_xref` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL DEFAULT '0',
  `item_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `com_modules_site_xref`
--

INSERT INTO `com_modules_site_xref` (`id`, `created`, `modified`, `enabled`, `order`, `delete`, `item_id`, `cat_id`) VALUES
(2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1, 1),
(6, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 174, 1),
(10, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 177, 1),
(20, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 239, 3);

-- --------------------------------------------------------

--
-- Table structure for table `com_newsLetter`
--

CREATE TABLE IF NOT EXISTS `com_newsLetter` (
`id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `delete` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `com_newsLetter`
--

INSERT INTO `com_newsLetter` (`id`, `email`, `group`, `status`, `modified`, `created`, `delete`, `enabled`, `order`) VALUES
(1, 'empcland@gmail.com', '1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0),
(2, 'fgdfgdfg', '1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0),
(3, 'ah.wakkad@gmail.com', '1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0),
(4, 'empcland@gmail.com', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(5, 'empcland@gmail.com', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(6, 'empcland@gmail.com', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(7, 'empcland@gmail.com', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(8, 'empcland@gmail.com', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(9, 'empcland@gmail.com', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `com_newsLetter_group`
--

CREATE TABLE IF NOT EXISTS `com_newsLetter_group` (
`id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `order` tinyint(4) NOT NULL,
  `enabled` int(11) NOT NULL DEFAULT '1',
  `delete` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `com_newsLetter_group`
--

INSERT INTO `com_newsLetter_group` (`id`, `title`, `order`, `enabled`, `delete`, `created`, `modified`) VALUES
(1, 'guest', 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'users', 0, 1, 0, '2013-04-02 05:14:20', '0000-00-00 00:00:00'),
(3, 'new', 0, 1, 0, '2013-12-16 13:47:38', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `com_order_status`
--

CREATE TABLE IF NOT EXISTS `com_order_status` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL DEFAULT '0',
  `pro_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `site` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `com_order_status`
--

INSERT INTO `com_order_status` (`id`, `created`, `modified`, `enabled`, `order`, `delete`, `pro_id`, `title`, `site`) VALUES
(1, '2013-05-01 07:18:33', '0000-00-00 00:00:00', 1, 0, 0, 0, 'Pending', 0),
(2, '2013-05-01 07:18:46', '0000-00-00 00:00:00', 1, 0, 0, 0, 'Paid & Processing', 0),
(3, '2013-05-01 07:18:53', '0000-00-00 00:00:00', 1, 0, 0, 0, 'Shipped', 0),
(4, '2013-05-01 07:18:59', '0000-00-00 00:00:00', 1, 0, 0, 0, 'Cancelled', 0),
(5, '2013-05-01 07:19:03', '0000-00-00 00:00:00', 1, 0, 0, 0, 'Declined', 0),
(6, '2013-05-01 07:19:10', '0000-00-00 00:00:00', 1, 0, 0, 0, 'Fraud', 0),
(7, '2013-05-01 07:19:16', '0000-00-00 00:00:00', 1, 0, 0, 0, 'Rejected', 0),
(8, '2013-05-01 07:19:21', '0000-00-00 00:00:00', 1, 0, 0, 0, 'Refund', 0),
(9, '2013-05-01 07:19:30', '0000-00-00 00:00:00', 1, 0, 0, 0, 'Not Shipped', 0),
(10, '2013-05-01 07:19:43', '0000-00-00 00:00:00', 1, 0, 0, 0, 'Cash on Delivery', 0);

-- --------------------------------------------------------

--
-- Table structure for table `com_pkgs`
--

CREATE TABLE IF NOT EXISTS `com_pkgs` (
`id` int(11) NOT NULL,
  `pric` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `html` int(11) NOT NULL,
  `imagesgallery` int(11) NOT NULL,
  `videogallery` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=62 ;

--
-- Dumping data for table `com_pkgs`
--

INSERT INTO `com_pkgs` (`id`, `pric`, `title`, `order`, `modified`, `created`, `enabled`, `delete`, `html`, `imagesgallery`, `videogallery`) VALUES
(1, '', 'gen', 0, '2013-10-07 00:00:00', '2013-10-07 07:39:06', 1, 1, 0, 0, 0),
(2, '', 'ddddddd', 0, '0000-00-00 00:00:00', '2013-12-05 15:16:00', 0, 1, 0, 0, 0),
(3, '', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyy', 0, '0000-00-00 00:00:00', '2013-12-05 15:29:22', 0, 1, 0, 0, 0),
(4, '', 'yyyyyyyyyyyyyyyyyyyy', 0, '0000-00-00 00:00:00', '2013-12-05 15:30:24', 0, 1, 0, 0, 0),
(5, '', 'yyyyyyyyyyyyyyyyyyyy', 0, '0000-00-00 00:00:00', '2013-12-05 15:32:36', 0, 1, 0, 0, 0),
(6, '', 'dfgdfgdfg', 0, '0000-00-00 00:00:00', '2013-12-05 15:40:52', 0, 1, 0, 0, 0),
(7, '', 'dfgdfgdfg', 0, '0000-00-00 00:00:00', '2013-12-05 15:53:39', 0, 1, 0, 0, 0),
(8, '', 'yyyyyyyyyyyyyyyyyy', 0, '0000-00-00 00:00:00', '2013-12-05 15:54:24', 0, 1, 0, 0, 0),
(9, '', '88888888888', 0, '0000-00-00 00:00:00', '2013-12-05 15:56:33', 0, 1, 0, 0, 0),
(10, '', '88888888888', 0, '0000-00-00 00:00:00', '2013-12-05 15:59:12', 0, 1, 0, 0, 0),
(11, '', '', 0, '0000-00-00 00:00:00', '2013-12-05 16:02:01', 0, 1, 0, 0, 0),
(12, '', '', 0, '0000-00-00 00:00:00', '2013-12-05 16:03:30', 0, 1, 0, 0, 0),
(13, '', '', 0, '0000-00-00 00:00:00', '2013-12-05 16:05:26', 0, 1, 0, 0, 0),
(14, '', '', 0, '0000-00-00 00:00:00', '2013-12-05 16:06:06', 0, 1, 0, 0, 0),
(15, '', '', 0, '0000-00-00 00:00:00', '2013-12-05 16:14:02', 0, 1, 0, 0, 0),
(16, '', '', 0, '0000-00-00 00:00:00', '2013-12-05 16:18:35', 0, 1, 0, 0, 0),
(17, '', '', 0, '0000-00-00 00:00:00', '2013-12-05 16:19:07', 0, 1, 0, 0, 0),
(18, '', '', 0, '0000-00-00 00:00:00', '2013-12-05 16:20:04', 0, 1, 0, 0, 0),
(19, '', '', 0, '0000-00-00 00:00:00', '2013-12-05 16:20:11', 0, 1, 0, 0, 0),
(20, '', '', 0, '0000-00-00 00:00:00', '2013-12-05 16:21:20', 0, 1, 0, 0, 0),
(21, '', '', 0, '0000-00-00 00:00:00', '2013-12-05 16:21:31', 0, 1, 0, 0, 0),
(22, '', '', 0, '0000-00-00 00:00:00', '2013-12-05 16:21:45', 0, 1, 0, 0, 0),
(23, '', '', 0, '0000-00-00 00:00:00', '2013-12-05 16:21:54', 0, 1, 0, 0, 0),
(24, '', '', 0, '0000-00-00 00:00:00', '2013-12-05 16:25:37', 0, 1, 0, 0, 0),
(25, '', '', 0, '0000-00-00 00:00:00', '2013-12-05 16:25:55', 0, 1, 0, 0, 0),
(26, '', '', 0, '0000-00-00 00:00:00', '2013-12-05 16:28:28', 0, 1, 0, 0, 0),
(27, '', '', 0, '0000-00-00 00:00:00', '2013-12-05 16:30:08', 0, 1, 0, 0, 0),
(28, '', '', 0, '0000-00-00 00:00:00', '2013-12-05 16:30:54', 0, 1, 0, 0, 0),
(29, '', '', 0, '0000-00-00 00:00:00', '2013-12-05 16:31:58', 0, 1, 0, 0, 0),
(30, '', '', 0, '0000-00-00 00:00:00', '2013-12-05 16:33:45', 0, 1, 0, 0, 0),
(31, '', '', 0, '0000-00-00 00:00:00', '2013-12-05 16:34:15', 0, 1, 0, 0, 0),
(32, '', '', 0, '0000-00-00 00:00:00', '2013-12-05 16:34:55', 0, 1, 0, 0, 0),
(33, '', '', 0, '0000-00-00 00:00:00', '2013-12-05 16:35:02', 0, 1, 0, 0, 0),
(34, '', '', 0, '0000-00-00 00:00:00', '2013-12-05 16:35:28', 0, 1, 0, 0, 0),
(35, '', '', 0, '0000-00-00 00:00:00', '2013-12-05 16:35:43', 0, 1, 0, 0, 0),
(36, '', '', 0, '0000-00-00 00:00:00', '2013-12-05 16:37:05', 0, 1, 0, 0, 0),
(37, '', '', 0, '0000-00-00 00:00:00', '2013-12-05 16:37:25', 0, 1, 0, 0, 0),
(38, '', 'ttttt', 0, '0000-00-00 00:00:00', '2013-12-06 04:45:50', 0, 1, 0, 0, 0),
(39, '', '7', 0, '0000-00-00 00:00:00', '2013-12-06 04:48:06', 0, 1, 0, 0, 0),
(40, '', '8', 0, '0000-00-00 00:00:00', '2013-12-06 04:48:47', 0, 1, 0, 0, 0),
(41, '', '8', 0, '0000-00-00 00:00:00', '2013-12-06 04:49:21', 0, 1, 0, 0, 0),
(42, '', '8', 0, '0000-00-00 00:00:00', '2013-12-06 04:49:40', 0, 1, 0, 0, 0),
(43, '', '8', 0, '0000-00-00 00:00:00', '2013-12-06 04:49:44', 0, 1, 0, 0, 0),
(44, '', '8', 0, '0000-00-00 00:00:00', '2013-12-06 04:51:02', 0, 1, 0, 0, 0),
(45, '', '8', 0, '0000-00-00 00:00:00', '2013-12-06 04:51:43', 0, 1, 0, 0, 0),
(46, '', '8', 0, '0000-00-00 00:00:00', '2013-12-06 04:52:18', 0, 1, 0, 0, 0),
(47, '', '8', 0, '0000-00-00 00:00:00', '2013-12-06 04:53:20', 0, 1, 0, 0, 0),
(48, '', '8', 0, '0000-00-00 00:00:00', '2013-12-06 04:53:27', 0, 1, 0, 0, 0),
(49, '', '8', 0, '0000-00-00 00:00:00', '2013-12-06 04:53:45', 0, 1, 0, 0, 0),
(50, '', '8', 0, '0000-00-00 00:00:00', '2013-12-06 04:53:52', 0, 1, 0, 0, 0),
(51, '', '8', 0, '0000-00-00 00:00:00', '2013-12-06 04:54:09', 0, 1, 0, 0, 0),
(52, '', '8', 0, '0000-00-00 00:00:00', '2013-12-06 04:55:20', 0, 1, 0, 0, 0),
(53, '', '8', 0, '0000-00-00 00:00:00', '2013-12-06 04:55:42', 0, 1, 0, 0, 0),
(54, '', '8', 0, '0000-00-00 00:00:00', '2013-12-06 04:57:04', 0, 1, 0, 0, 0),
(55, '', '8', 0, '0000-00-00 00:00:00', '2013-12-06 04:57:44', 0, 1, 0, 0, 0),
(56, '', '8', 0, '0000-00-00 00:00:00', '2013-12-06 05:00:25', 0, 1, 0, 0, 0),
(57, '', '8', 0, '0000-00-00 00:00:00', '2013-12-06 05:01:12', 0, 1, 0, 0, 0),
(58, '', 'rrrrrrrrrrrrr', 0, '0000-00-00 00:00:00', '2013-12-06 05:03:48', 0, 1, 0, 0, 0),
(59, '', 'rrrrrrrrrrrrr', 0, '0000-00-00 00:00:00', '2013-12-06 05:05:00', 0, 1, 0, 0, 0),
(60, '', 'ttttttttttttttttttttttttttt', 0, '2013-12-06 00:00:00', '2013-12-06 05:06:37', 0, 0, 0, 0, 0),
(61, '', '', 0, '0000-00-00 00:00:00', '2013-12-06 07:07:51', 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `com_pkgs_prising`
--

CREATE TABLE IF NOT EXISTS `com_pkgs_prising` (
`id` int(11) NOT NULL,
  `maxDays` int(11) NOT NULL,
  `minDays` int(11) NOT NULL,
  `item_id` int(255) NOT NULL,
  `pric_type` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `delete` tinyint(4) NOT NULL,
  `adultsPric` varchar(255) NOT NULL,
  `childPric` varchar(255) NOT NULL,
  `InfantsPric` varchar(255) NOT NULL,
  `plus` varchar(255) NOT NULL,
  `adults_pric_full` double NOT NULL,
  `child_pric_full` double NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=101 ;

--
-- Dumping data for table `com_pkgs_prising`
--

INSERT INTO `com_pkgs_prising` (`id`, `maxDays`, `minDays`, `item_id`, `pric_type`, `order`, `modified`, `created`, `enabled`, `delete`, `adultsPric`, `childPric`, `InfantsPric`, `plus`, `adults_pric_full`, `child_pric_full`) VALUES
(100, 5, 4, 60, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, '6', '7', '8', '', 9, 10),
(93, 0, 0, 61, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, '', '', '', '', 0, 0),
(99, 3, 3, 60, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, '3', '3', '3', '', 3, 3),
(98, 2, 2, 60, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, '2', '2', '2', '', 20000, 2),
(97, 77, 150, 60, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, '78', '79', '80', '', 1, 1),
(62, 3, 3, 59, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, '3', '3', '3', '', 3, 3),
(61, 2, 2, 59, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, '2', '2', '2', '', 2, 2),
(60, 1, 1, 59, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, '1', '1', '1', '', 1, 1),
(59, 3, 3, 58, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, '3', '3', '3', '', 3, 3),
(58, 2, 2, 58, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, '2', '2', '2', '', 2, 2),
(57, 1, 1, 58, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, '1', '1', '1', '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `com_poll_answers`
--

CREATE TABLE IF NOT EXISTS `com_poll_answers` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL DEFAULT '0',
  `q_id` int(11) NOT NULL,
  `answers` varchar(255) NOT NULL,
  `nums` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `com_poll_answers`
--

INSERT INTO `com_poll_answers` (`id`, `created`, `modified`, `enabled`, `order`, `delete`, `q_id`, `answers`, `nums`) VALUES
(1, '2013-03-30 15:31:19', '0000-00-00 00:00:00', 1, 0, 0, 1, 'محمد إبراهيم', 22),
(2, '2013-03-30 15:32:09', '0000-00-00 00:00:00', 1, 0, 0, 1, 'أحمد جعفر', 5),
(3, '2013-03-30 15:32:21', '0000-00-00 00:00:00', 1, 0, 0, 1, 'عمر جمال', 9),
(4, '2013-03-30 15:32:40', '0000-00-00 00:00:00', 1, 0, 0, 1, 'أحمد خيري', 4),
(5, '2013-03-30 15:33:03', '0000-00-00 00:00:00', 1, 0, 0, 1, 'أخر', 3),
(6, '2013-03-31 04:43:09', '0000-00-00 00:00:00', 1, 0, 0, 2, 'حسن شحاتة', 1),
(7, '2013-03-31 04:43:47', '0000-00-00 00:00:00', 1, 0, 0, 2, 'أبو تريكة ', 1),
(8, '2013-03-31 04:43:49', '0000-00-00 00:00:00', 1, 0, 0, 2, 'أبو تريكة ', 0);

-- --------------------------------------------------------

--
-- Table structure for table `com_poll_questions`
--

CREATE TABLE IF NOT EXISTS `com_poll_questions` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL DEFAULT '0',
  `questions` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `com_poll_questions`
--

INSERT INTO `com_poll_questions` (`id`, `created`, `modified`, `enabled`, `order`, `delete`, `questions`) VALUES
(1, '2013-03-30 15:29:38', '0000-00-00 00:00:00', 1, 0, 0, 'من نجم مباراة الزمالك والإسماعيلي؟'),
(2, '2013-03-30 15:29:38', '2013-03-31 00:00:00', 1, 0, 0, 'من نجم مباراة الزمالك؟');

-- --------------------------------------------------------

--
-- Table structure for table `com_price_plan`
--

CREATE TABLE IF NOT EXISTS `com_price_plan` (
`id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `des` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `com_pricing_items`
--

CREATE TABLE IF NOT EXISTS `com_pricing_items` (
`id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `des` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `com_products`
--

CREATE TABLE IF NOT EXISTS `com_products` (
`id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cat_id` text COLLATE utf8_unicode_ci NOT NULL,
  `offer` tinyint(4) NOT NULL,
  `itme_data` text COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `created` datetime NOT NULL,
  `order` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `des` text COLLATE utf8_unicode_ci NOT NULL,
  `th_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imagegallery` int(11) NOT NULL,
  `tags` text COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `wight` double NOT NULL,
  `standardprice` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `videogallery` int(11) NOT NULL,
  `plugins_data` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  `header` text COLLATE utf8_unicode_ci NOT NULL,
  `req_donations` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `map_position` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=75 ;

--
-- Dumping data for table `com_products`
--

INSERT INTO `com_products` (`id`, `title`, `image`, `cat_id`, `offer`, `itme_data`, `enabled`, `created`, `order`, `modified`, `delete`, `des`, `th_image`, `imagegallery`, `tags`, `alias`, `intro`, `wight`, `standardprice`, `videogallery`, `plugins_data`, `description`, `keywords`, `header`, `req_donations`, `map_position`) VALUES
(62, 'aaaa', '', '', 0, '', 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', '', 0, '', '', '', 0, '', 0, '', '', '', '', '', ''),
(54, '', '', '', 0, '', 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1, '', '', 0, '', '', '', 0, '', 0, '', '', '', '', '', ''),
(55, '', '', '', 0, '', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1, '', '', 0, '', '', '', 0, '', 0, '', '', '', '', '', ''),
(56, 'fsdfsdf', '', '', 0, '', 0, '0000-00-00 00:00:00', 0, '2013-12-24 00:00:00', 0, '', '', 0, '', 'fsdfsdf', '', 0, '', 0, '', '', '', '', '', ''),
(52, 'Neck Warmer Neck Warmer Neck Warmer Neck Warmer Neck  ', 'Neck Warmer Product Page.jpg', '32', 0, '', 1, '2013-01-31 08:25:25', 1, '2013-12-22 00:00:00', 0, '<div class="product_features">\r\n<h3>Features</h3>\r\n<ul>\r\n<li>Instant therapeutic heat (up to 54<sup>o</sup>C) in just 15 seconds &ndash; no microwave required</li>\r\n<li>Great for massage, pain relief, reducing muscle tension or just for staying warm</li>\r\n<li>Stays warm for up to 60 minutes, reusable again and again</li>\r\n<li>Fits snugly around neck or over shoulders</li>\r\n<li>Safe and non-toxic liquid, phthalate-free plastic, environmentally friendly</li>\r\n<li>Size: 15 x 6.5 x 0.5 inches, 2.2 lbs (38 x 16 x 1.5 cm, 1kg)</li>\r\n</ul>\r\n</div>\r\n<div class="product_benefits">\r\n<h3>Benefits</h3>\r\n<p>You just can&rsquo;t resist our Neck Warmer. It&rsquo;s like a big hug, or a gentle massage, a reassuring warmth around your shoulders. Move your head slightly &ndash; is your neck sore? Possibly from hunching over a laptop all day or nodding all through a flight or from an old injury. Now lift your shoulders &ndash; are they feeling stiff and tense?</p>\r\n<p>If so, our Neck Warmer is here to help. It sits on your shoulders and lightly caresses your neck, give you an hour of delicious warmth &ndash; you don&rsquo;t have to hold it in place, so you can just get on with things. You&rsquo;ll be able to sigh with relief and let your shoulders drop as all the tension melts away. Everyone who sees you will be jealous!</p>\r\n<p>A stiff neck and shoulders can really reduce your performance at work, your concentration when driving and your happiness at home. Get back to your usual relaxed and happy self with a Kwikheat Neck Warmer.</p>\r\n</div>\r\n<div class="product_more">\r\n<h3>More information about Kwikheat Warmers</h3>\r\n<p>Kwikheat instant reusable heat packs are the ultimate heating solution for relief from pain, stress, stiffness, cramps and the cold. With no microwave required, they&rsquo;re ideal for when you&rsquo;re on the move, in the office or at home.</p>\r\n<p>These incredible heat packs can be used over and over again. Just click the floating metal disc and watch as the liquid crystallises before your eyes. Within seconds the heat pack will heat up to around 54<sup>o</sup>C. Because it will always go to this temperature, you never have to worry about it getting too hot or not hot enough. It will stay warm for up to 60 minutes, which is around the recommended time for heat therapy anyway. Keeping it in the pouch or insulated under clothes will help it stay warmer for longer.</p>\r\n<p>The heat pack is &lsquo;recharged&rsquo; by boiling it in water for 2-10 minutes until all of the crystals melt back into a liquid again. You can use a pan or a rice cooker. The activation and recharging of the heat pack can be repeated for well over a hundred times.</p>\r\n<p>Medical studies show that heat therapy is effective for pain relief and helps to promote relaxation and reduce stress. It has been used for centuries as a natural remedy to enhance the natural recovery process. Heat therapy also increases blood flow, which relaxes stiff or sore muscles and provides soothing comfort. It is an ideal treatment for chronic pain, arthritis and cramps.</p>\r\n<p>Kwikheat heat packs are the next generation of heat therapy evolving from hot water bottles and traditional microwaveable heat packs. We offer several designs to soothe different parts of the body: neck &amp; shoulders, back, joints, abdomen, hands and feet.</p>\r\n<p>Treat yourself to the cosy warmth of our Kwikheat heat packs, because you deserve it!</p>\r\n</div>', 'Neck Warmer Kwikheat Products Carousel.png', 0, '', 'Neck-Warmer', '', 1, '', 0, 'paypalCode__ddddddddddddddddddddddddddddddddddddddddddd;', 'Neck Warmer Description\r\n', 'Neck Warmer Keywords\r\n', '', '', ''),
(53, '111', '', '', 0, '', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1, '', '', 0, '', '', '', 0, '', 0, '', '', '', '', '', ''),
(63, 'Back Warmer', '', '', 0, '', 1, '0000-00-00 00:00:00', 0, '2013-09-03 00:00:00', 0, '', '', 0, '', 'Back-Warmer', '', 0, '', 0, 'paypalCode__;', '', '', '', '', ''),
(64, '', '', '', 0, '', 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', '', 0, '', '', '', 0, '', 0, '', '', '', '', '', ''),
(65, '', '', '', 0, '', 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', '', 0, '', '', '', 0, '', 0, '', '', '', '', '', ''),
(66, '', '', '', 0, '', 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', '', 0, '', '', '', 0, '', 0, '', '', '', '', '', ''),
(67, '', '', '', 0, '', 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', '', 0, '', '', '', 0, '', 0, '', '', '', '', '', ''),
(68, '', '', '', 0, '', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', '', 0, '', '', '', 0, '', 0, '', '', '', '', '', ''),
(69, '', '', '', 0, '', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', '', 0, '', '', '', 0, '', 0, '', '', '', '', '', ''),
(70, '', '', '', 0, '', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', '', 0, '', '', '', 0, '', 0, '', '', '', '', '', ''),
(71, '', '', '', 0, '', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', '', 0, '', '', '', 0, '', 0, '', '', '', '', '', ''),
(72, '', '', '', 0, '', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', '', 0, '', '', '', 0, '', 0, '', '', '', '', '', ''),
(73, '', '', '', 0, '', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', '', 0, '', '', '', 0, '', 0, '', '', '', '', '', ''),
(74, '', '', '', 0, '', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', '', 0, '', '', '', 0, '', 0, '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `com_products_categories`
--

CREATE TABLE IF NOT EXISTS `com_products_categories` (
`id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cat_id` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `created` datetime NOT NULL,
  `order` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `des` text COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=37 ;

--
-- Dumping data for table `com_products_categories`
--

INSERT INTO `com_products_categories` (`id`, `name`, `image`, `cat_id`, `enabled`, `created`, `order`, `modified`, `delete`, `des`, `alias`) VALUES
(26, 'Blackberry ', 'blackberry.png', 20, 1, '2013-01-17 00:00:00', 7, '2013-01-21 00:00:00', 1, '<p>BB Text</p>', 'Blackberry'),
(25, 'Samsung ', 'samsung_logo.jpg', 20, 1, '2013-01-17 00:00:00', 10, '2013-01-21 00:00:00', 1, '<p>Saumsung text</p>', 'Samsung'),
(24, 'Apple', 'apple-logo1.jpg', 20, 0, '2013-01-17 00:00:00', 5, '0000-00-00 00:00:00', 1, '<p>Apple text</p>', ''),
(23, 'Nokia ', 'nokia-logo.jpg', 20, 1, '2013-01-17 00:00:00', 1, '2013-01-21 00:00:00', 1, '<p>Nokia</p>', 'Nokia'),
(22, 'Laptops', 'Dell-Updates-Studio-laptops-With-Core-i3-i5-and-i7-Chips-2.jpg', 0, 1, '2013-01-17 00:00:00', 2, '0000-00-00 00:00:00', 1, '<p>Laptops text area.</p>', ''),
(21, 'Laptops ', 'Dell-Updates-Studio-laptops-With-Core-i3-i5-and-i7-Chips-2.jpg', 0, 1, '2013-01-17 00:00:00', 2, '2013-01-21 00:00:00', 1, '<p>Laptops text area.</p>', 'Laptops'),
(20, 'Mobiles Phones ', 'the-latest-phones-on-the-market.png', 0, 1, '2013-01-17 00:00:00', 1, '2013-01-21 00:00:00', 1, '<p>About Mobile phones. This is the text area.</p>', 'Mobiles-Phones'),
(27, 'HP', '', 21, 1, '2013-01-22 06:47:26', 11, '0000-00-00 00:00:00', 1, '<p>hp laptop categpry text</p>', 'HP'),
(28, 'Apple', '', 21, 1, '2013-01-22 06:47:50', 12, '0000-00-00 00:00:00', 1, '<p>aple category</p>', 'Apple'),
(29, 'Lenovo', '', 21, 1, '2013-01-22 06:48:14', 13, '0000-00-00 00:00:00', 1, '<p>lenovo</p>', 'Lenovo'),
(30, 'Pavillion Series', '', 27, 1, '2013-01-22 06:52:55', 14, '0000-00-00 00:00:00', 1, '<p>pavillon series text</p>', 'Pavillion-Series'),
(31, '7000-8000 Pavillion', '', 30, 1, '2013-01-22 06:53:42', 15, '0000-00-00 00:00:00', 1, '<p>7000 to 8000 pavillion tex</p>', '7000-8000-Pavillion'),
(32, 'Body Warmers', '', 0, 1, '2013-02-27 04:39:00', 16, '0000-00-00 00:00:00', 0, '', 'Body-Warmers'),
(33, 'Lifestyle Warmers', '', 0, 1, '2013-02-27 04:39:14', 17, '0000-00-00 00:00:00', 0, '', 'Lifestyle-Warmers'),
(34, 'Coupons', '', 0, 1, '2013-02-27 04:39:28', 18, '0000-00-00 00:00:00', 0, '', 'Coupons'),
(35, 'Multipacks', '', 0, 1, '2013-02-27 14:59:34', 19, '0000-00-00 00:00:00', 0, '', 'Multipacks'),
(36, 'Boiling Bag', '', 0, 1, '2013-03-21 04:05:56', 20, '0000-00-00 00:00:00', 0, '', 'Boiling-Bag');

-- --------------------------------------------------------

--
-- Table structure for table `com_products_coupon_xref`
--

CREATE TABLE IF NOT EXISTS `com_products_coupon_xref` (
`id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=99 ;

--
-- Dumping data for table `com_products_coupon_xref`
--

INSERT INTO `com_products_coupon_xref` (`id`, `item_id`, `cat_id`, `delete`, `order`, `enabled`, `modified`, `created`) VALUES
(98, 1, 73, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 1, 72, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 1, 71, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 1, 70, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 1, 69, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 1, 68, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 1, 67, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 1, 66, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 1, 65, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 1, 64, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 1, 63, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 1, 53, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 1, 52, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 1, 56, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 1, 55, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 1, 54, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 1, 62, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `com_products_order`
--

CREATE TABLE IF NOT EXISTS `com_products_order` (
`id` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `order_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ship_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ship_street_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ship_street_address2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ship_city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ship_state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ship_zip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ship_country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `card_holder_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `street_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `street_address2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_processor_order_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `total_amount` double NOT NULL,
  `shipping_id` int(255) NOT NULL,
  `shipping_price` double NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `site` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `currency` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=171 ;

--
-- Dumping data for table `com_products_order`
--

INSERT INTO `com_products_order` (`id`, `order`, `delete`, `modified`, `created`, `enabled`, `order_id`, `ship_name`, `ship_street_address`, `ship_street_address2`, `ship_city`, `ship_state`, `ship_zip`, `ship_country`, `card_holder_name`, `street_address`, `street_address2`, `city`, `state`, `zip`, `country`, `email`, `phone`, `order_status`, `payment_processor_order_id`, `total_amount`, `shipping_id`, `shipping_price`, `coupon_id`, `status`, `site`, `currency`) VALUES
(55, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514c864d87e8e', 'Full Name', 'Address', 'Address', 'City', 'AZ', '0592', 'USA', '', '', '', '', '', '', 'USA', 'empcland@gmail.com', '011520250620', '', '', 0, 0, 0, 0, 0, '', ''),
(54, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514c81f06f00f', 'Aziz', 'Vasi', 'Address 2 shipping', 'Houston', 'KY', '95003', 'USA', 'Aziz name', 'address 1', 'address 2', 'Austin', 'TX', '75002', 'USA', 'azizms@gmail.com', '2121212', '', '', 0, 0, 0, 0, 0, '', ''),
(51, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514c162dcb0f7', '', '', '', '', '', 'BE', 'GBR', '', '', '', '', '', 'BE', 'GBR', '', '', '', '', 0, 0, 0, 0, 0, '', ''),
(52, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514c807d3e994', 'Aziz', '2340 barker oaks', '', 'Houston', 'TX', '77077', 'USA', 'Aziz', '2340 barker oaks', '', 'Houston', '', '77077', 'USA', 'azizms@gmail.com', '1020202', '', '', 0, 0, 0, 0, 0, '', ''),
(53, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514c8085f011a', 'Aziz', '2340 barker oaks', '', 'Houston', 'TX', '77077', 'USA', 'Aziz', '2340 barker oaks', '', 'Houston', '', '77077', 'USA', 'azizms@gmail.com', '1020202', '', '', 0, 0, 0, 0, 0, '', ''),
(50, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514ae4b85b8c6', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', 'Slough', '2323', 'GBR', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', 'Slough', '2323', 'GBR', 'azizms@gmail.com', '1150250620', '', '', 0, 0, 0, 0, 0, '', ''),
(47, 0, 1, '2013-05-20 00:00:00', '0000-00-00 00:00:00', 0, '514adf4b2cf1e', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'hfgh', '0592', 'GBR', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'hfgh', '0592', 'GBR', 'empcland@gmail.com', '01150250620', '', '', 0, 0, 0, 0, 0, '2', ''),
(48, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514ae0adb819f', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'hfgh', '0592', 'GBR', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'hfgh', '0592', 'GBR', 'empcland@gmail.com', '01150250620', '', '', 0, 0, 0, 0, 0, '', ''),
(49, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514ae2c99e247', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', 'empcland@gmail.com', '01150250620', '', '', 0, 0, 0, 0, 0, '', ''),
(56, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514c865750147', 'Full Name', 'Address', 'Address', 'City', 'AZ', '0592', 'USA', 'This field is required!', 'This field is required!', '', 'This field is required!', '', 'This field is required!', 'USA', 'empcland@gmail.com', '011520250620', '', '', 0, 0, 0, 0, 0, '', ''),
(57, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514c866d5271b', 'Full Name', 'Address', 'Address', 'City', 'AZ', '050000', 'USA', 'Full Name', 'Address', 'Address', 'City', '', '050000', 'USA', 'empcland@gmail.com', '011520250620', '', '', 0, 0, 0, 0, 0, '', ''),
(58, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514c867b773da', 'Aziz', 'Vasi', '', 'Abu Dhabi', 'Emirates', '', 'ARE', 'Aziz', 'Vasi', '', '', 'Emirates', '', 'ARE', '', '', '', '', 0, 0, 0, 0, 0, '', ''),
(59, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514c86ac8e5f5', 'Aziz', 'Vasi', '', 'Abu Dhabi', 'Emirates', '', 'ARE', 'Aziz', 'Vasi', '', '', 'Emirates', '', 'ARE', 'azizms@gmail.com', '09090909', '', '', 0, 0, 0, 0, 0, '', ''),
(60, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514c86b746614', 'Aziz', 'Vasi', '', 'Abu Dhabi', 'Emirates', 'This field is required!', 'ARE', 'Aziz', 'Vasi', '', '', 'Emirates', 'This field is required!', 'ARE', 'azizms@gmail.com', '09090909', '', '', 0, 0, 0, 0, 0, '', ''),
(61, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514c89d95256b', 'Full Name', 'Address', 'Address', 'City', 'CT', '05000', 'USA', '', '', '', '', '', '', 'USA', 'empcland@gmail.com', '011520250620', '', '', 0, 0, 0, 0, 0, '', ''),
(62, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514c89f092bc3', 'Full Name', 'Address', 'Address', 'City', 'CT', '050000', 'USA', 'Full Name', 'Address', 'Address', 'City', '', '050000', 'USA', 'empcland@gmail.com', '011520250620', '', '', 0, 0, 0, 0, 0, '', ''),
(63, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514c8a19f0922', 'Full Name', 'Address', 'Address', 'City', 'CT', '050000', 'USA', 'Full Name', 'Address', 'Address', 'City', '', '050000', 'USA', 'empcland@gmail.com', '011520250620', '1', '', 0, 0, 0, 0, 0, '', ''),
(64, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514c8fc69a6d7', 'Aziz', 'VAsi', 'qekjq', 'houston', 'CO', '78787', 'USA', 'Aziz', 'VAsi', 'qekjq', 'houston', '', '78787', 'USA', 'azizms@gmail.com', '498403894', '1', '', 0, 0, 0, 0, 0, '', ''),
(65, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514c9938eb32f', 'Aziz Vasi', 'ember road', 'langley', 'Slough', 'London', 'bt44', 'GBR', 'Aziz Vasi', 'ember road', 'langley', 'Slough', 'London', 'bt44', 'GBR', 'azizms@gmail.com', '232323322', '1', '', 0, 0, 0, 0, 0, '', ''),
(66, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514ca0503627d', 'Full Name', 'sdfsdf', 'Address', 'City', 'dfsf', 'DZ', 'AZE', 'Full Name', 'sdfsdf', 'Address', 'City', 'dfsf', 'DZ', '', 'empcland@gmail.com', '011520250620', '', '', 0, 0, 0, 0, 0, '', ''),
(67, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514ca06490fd1', 'Full Name', 'sdfsdf', 'Address', 'City', 'dfsf', 'DZ', 'AZE', 'Full Name', 'sdfsdf', 'Address', 'City', 'dfsf', 'DZ', '', 'empcland@gmail.com', '011520250620', '', '', 0, 0, 0, 0, 0, '', ''),
(68, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514ca0d881814', 'Full Name', 'sdfsdf', 'Address', 'City', 'dfsf', 'AF', 'AFG', 'Full Name', 'sdfsdf', 'Address', 'City', 'dfsf', 'AF', '', 'empcland@gmail.com', '011520250620', '', '', 0, 0, 0, 0, 0, '', ''),
(69, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514ca0f146362', 'Full Name', 'sdfsdf', 'Address', 'City', 'dfsf', 'AF', 'AFG', 'Full Name', 'sdfsdf', 'Address', 'City', 'dfsf', 'AF', '', 'empcland@gmail.com', '011520250620', '', '', 0, 0, 0, 0, 0, '', ''),
(70, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514ca27722621', 'Full Name', 'sdfsdf', 'Address', 'sf', 'dfsf', 'AL', 'AFG', 'Full Name', 'sdfsdf', 'Address', 'sf', 'dfsf', 'AL', '', 'empcland@gmail.com', '011520250620', '', '', 0, 0, 0, 0, 0, '', ''),
(71, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514ca2e043d18', 'Full Name', 'sdfsdf', 'sdfsdfs', 'sf', 'dfsf', 'DZ', 'ALB', 'Full Name', 'sdfsdf', 'sdfsdfs', 'sf', 'dfsf', 'DZ', '', 'empcland@gmail.com', '011520250620', '', '', 0, 0, 0, 0, 0, '', ''),
(72, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514ca2ff316b0', 'Full Name', 'sdfsdf', 'sdfsdfs', 'sf', 'dfsf', 'DZ', 'ALB', 'Full Name', 'sdfsdf', 'sdfsdfs', 'sf', 'dfsf', 'DZ', '', 'empcland@gmail.com', '011520250620', '', '', 0, 0, 0, 0, 0, '', ''),
(73, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514ca3debfaf5', 'Full Name', 'sdfsdf', 'Address', 'fghfgh', 'dfsf', 'AW', 'AGO', 'Full Name', 'sdfsdf', 'Address', 'fghfgh', 'dfsf', 'AW', '', 'empcland@gmail.com', '011520250620', '', '', 0, 0, 0, 0, 0, '', ''),
(74, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514ca44666b93', 'Full Name', 'sdfsdf', 'Address', 'sf', 'dfsf', 'BD', 'ALB', 'Full Name', 'sdfsdf', 'Address', 'sf', 'dfsf', 'BD', '', 'empcland@gmail.com', '011520250620', '', '', 0, 0, 0, 0, 0, '', ''),
(75, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514ca5c098832', 'Aziz', 'Adddress', '', 'City', 'County', 'IV28', 'GBR', 'Aziz', 'Adddress', '', 'City', 'County', 'IV28', 'GBR', 'azizms@gmail.com', '8989', '1', '', 0, 0, 0, 0, 0, '', ''),
(76, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514ca761157e4', 'Shipping Name', 'Shipping Address', 'Shipping Address 2', 'Shipping City', 'Shipping County', 'iv29', 'GBR', 'Billing Name', 'Billine Address 1', 'Billing Address 2', 'Billing City', 'Billing County', 'iv29 bill', 'GBR', 'azizms@gmail.com', '2039029302', '1', '', 0, 0, 0, 0, 0, '', ''),
(77, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514cab2e34d4d', 'Aziz', 'Address', 'Address ', 'city', 'CA', '77077', 'USA', 'Aziz', 'Address', 'Address ', 'city', '', '77077', 'USA', 'azizms@gmail.com', '2323092302', '1', '', 0, 0, 0, 0, 0, '', ''),
(78, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514cbc0541db1', 'Full Name', 'sdfsdf', 'Address', 'sf', 'AL', '050000', 'USA', 'sdfsdf', 'sdfsdf', '', 'sdfsdf', 'AZ', 'sdf', 'USA', 'empcland@gmail.com', '011520250620', '', '', 0, 0, 0, 0, 0, '', ''),
(79, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514cbd6510ee3', 'Aziz', 'Address1', '', 'City', 'AL', '77077', 'USA', 'Aziz', 'Address1', '', 'City', 'AL', '77077', 'USA', 'azizms@gmail.com', '23232323', '', '', 0, 0, 0, 0, 0, '', ''),
(80, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514cbdac49794', 'Aziz', 'Address1', '', 'City', 'AL', '77077', 'USA', 'Aziz', 'Address1', '', 'City', 'AL', '77077', 'USA', 'azizms@gmail.com', '23232323', '', '', 0, 0, 0, 0, 0, '', ''),
(81, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514cbdba30ba3', 'Aziz', 'Address1', '', 'City', 'AZ', '77077', 'USA', 'Aziz', 'Address1', '', 'City', 'AZ', '77077', 'USA', 'azizms@gmail.com', '23232323', '', '', 0, 0, 0, 0, 0, '', ''),
(82, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514cbdf9bb333', 'Aziz', 'Address1', '', 'City', 'AZ', '77077', 'USA', 'Aziz', 'bill address', 'bill adress 2', 'bill city', 'NE', '330933', 'USA', 'azizms@gmail.com', '23232323', '', '', 0, 0, 0, 0, 0, '', ''),
(83, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514cbe122b4c8', 'Aziz', 'Address1', '', 'City', 'AZ', '77077', 'USA', 'Aziz', 'bill address', 'bill adress 2', 'bill city', 'NE', '330933', 'USA', 'azizms@gmail.com', '23232323', '', '', 0, 0, 0, 0, 0, '', ''),
(84, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514cbe2024ebb', 'Aziz', 'Address1', '', 'City', 'AZ', '77077', 'USA', 'Aziz', 'bill address', 'bill adress 2', 'bill city', 'NE', '330933', 'USA', 'azizms@gmail.com', '23232323', '', '', 0, 0, 0, 0, 0, '', ''),
(85, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514cbe559acfb', 'Aziz', 'Address1', '', 'City', 'AZ', '77077', 'USA', 'Aziz', 'bill address', 'bill adress 2', 'bill city', 'NE', '330933', 'USA', 'azizms@gmail.com', '23232323', '', '', 0, 0, 0, 0, 0, '', ''),
(86, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514cbe684b0b1', 'Aziz', 'Address1', '', 'City', 'AZ', '77077', 'USA', 'Aziz', 'bill address', 'bill adress 2', 'bill city', 'NE', '330933', 'USA', 'azizms@gmail.com', '23232323', '', '', 0, 0, 0, 0, 0, '', ''),
(87, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514cbe9b030d9', 'Aziz', 'weweww', 'wee', 'Abu Dhabi', 'Emirates', '343434', 'ARE', 'Aziz', 'weweww', 'wee', 'Abu Dhabi', 'Emirates', '343434', 'ARE', 'azizms@gmail.com', '32322323', '', '', 0, 0, 0, 0, 0, '', ''),
(88, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514cbef2a183d', 'Aziz', '3', '', '3dfedf', 'fefef', '33334', 'BGD', 'Aziz', '3', '', '3dfedf', 'fefef', '33334', 'BGD', 'azizms@gmail.com', '23232', '', '', 0, 0, 0, 0, 0, '', ''),
(89, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514cbf19ed48e', 'Aziz', '3', '', '3dfedf', 'fefef', '33334', 'BGD', 'o', 'oiu', 'oiu', 'o98', '343434', '9898', 'BLR', 'azizms@gmail.com', '23232', '', '', 0, 0, 0, 0, 0, '', ''),
(90, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514cc02087e9c', '3443', '3434q', '', 'dfdf', 'dfdf', 'fd', 'BRB', '3443', '3434q', '', 'dfdf', 'dfdf', 'fd', 'BRB', 'azizms@gmail.com', '3343343', '1', '', 0, 0, 0, 0, 0, '', ''),
(91, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514cc47032d63', 'ioioi', 'owiowu', 'oioi', 'oioi', 'oioi', 'oioi', 'BHS', 'ioioi', 'owiowu', 'oioi', 'oioi', 'oioi', 'oioi', 'BHS', 'azizms@gmail.com', '232323', '1', '', 0, 0, 0, 0, 0, '', ''),
(92, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514cc67f612a0', 'aslkj', 'kjdflkj', '', 'jlkdflkfj', 'dlfkjfl', 'lkj98', 'FRO', 'aslkj', 'kjdflkj', '', 'jlkdflkfj', 'dlfkjfl', 'lkj98', 'FRO', 'azizms@gmail.com', '2322323', '1', '', 0, 0, 0, 0, 0, '', ''),
(93, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514cc8a673bac', '323', '2323', '2323', '2323', '3232', '330434', 'GBR', '323', '2323', '2323', '2323', '3232', '330434', 'GBR', 'azizms@gmail.com', '32232323', '1', '', 0, 0, 0, 0, 0, '', ''),
(94, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514ccb19d362e', 'oioi', 'oioi', 'oi', 'oi', 'oi', 'iv29', 'GBR', 'oioi', 'oioi', 'oi', 'oi', 'oi', 'iv29', 'GBR', 'azizms@gmail.com', '2323232', '1', '', 0, 0, 0, 0, 0, '', ''),
(95, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514cccba63d7e', 'Aziz', 'weoeiw', '', 'Dubai', 'Emirates', '02320', 'ARE', 'Aziz', 'weoeiw', '', 'Dubai', 'Emirates', '02320', 'ARE', 'azizms@gmail.com', '232323', '1', '', 0, 0, 0, 0, 0, '', ''),
(96, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514ccf506b73e', 'Aziz', 'iouoi', 'io', 'Dubai', 'Emirates', '23029', 'ARE', 'Aziz', 'iouoi', 'io', 'Dubai', 'Emirates', '23029', 'ARE', 'azizms@gmail.com', '2323232', '1', '', 0, 0, 0, 0, 0, '', ''),
(97, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514cd128536e8', '334', '334', '', 'Abu Dhabi', 'Emirates', '333', 'ARE', '334', '334', '', 'Abu Dhabi', 'Emirates', '333', 'ARE', 'azizms@gmail.com', '123444', '1', '', 0, 0, 0, 0, 0, '', ''),
(98, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514d346255075', 'M', 'PO', '', 'London', 'Middlesex', 'ub49rj', 'GBR', 'M', 'PO', '', 'London', 'Middlesex', 'ub49rj', 'GBR', 'mchampeli@gmail.com', '971559020527', '1', '', 0, 0, 0, 0, 0, '', ''),
(99, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514d7e1c9982f', 'Aziz Vasi', '29 Tahrir St', '', 'Sharjah', 'Emirates', '11021', 'ARE', 'Aziz Vasi', '29 Tahrir St', '', 'Sharjah', 'Emirates', '11021', 'ARE', 'azizms@gmail.com', '3232', '', '', 0, 0, 0, 0, 0, '', ''),
(100, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514eb17996d9b', 'Moiz', 'PO BOX 5915', '', 'Dubai', 'Emirates', '5915', 'ARE', 'Moiz', 'PO BOX 5915', '', 'Dubai', 'Emirates', '5915', 'ARE', 'mchampeli@gmail.com', '971559020527', '1', '', 0, 0, 0, 0, 0, '', ''),
(101, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514eb213e801e', 'Moiz', 'PO BOX 5915', '', 'Dubai', 'Emirates', '5915', 'ARE', 'Moiz', 'PO BOX 5915', '', 'Dubai', 'Emirates', '5915', 'ARE', 'mchampeli@gmail.com', '971559020527', '', '', 0, 0, 0, 0, 0, '', ''),
(102, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514eb94ee6e99', 'Moiz', 'PO BOX 5915', '', 'London', 'Middlesex', 'ub49rj', 'GBR', 'Moiz', 'PO BOX 5915', '', 'London', 'Middlesex', 'ub49rj', 'GBR', 'mchampeli@gmail.com', '971559020527', '1', '', 0, 0, 0, 0, 0, '', ''),
(103, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '514eba6525604', 'Moiz', 'PO BOX 5915', '', 'Bakersfield', 'CA', '93309', 'USA', 'Moiz', 'PO BOX 5915', '', 'Bakersfield', 'CA', '93309', 'USA', 'mchampeli@gmail.com', '971559020527', '1', '', 0, 0, 0, 0, 0, '', ''),
(104, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '5150d50b860f1', 'dfsd', 'sdfs', 'Address 2', 'sdf', 'County', '0592', 'GBR', 'dfsd', 'sdfs', 'Address 2', 'sdf', 'County', '0592', 'GBR', 'ismail@e-scapes.me', '141', '1', '', 0, 0, 0, 0, 0, '', ''),
(105, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '5150d6f178817', 'Namedfsd', 'Address', 'Address 2', 'City', 'County', '05920', 'GBR', 'Namedfsd', 'Address', 'Address 2', 'City', 'County', '05920', 'GBR', 'ismail@e-scapes.me', '1212', '1', '', 0, 0, 0, 0, 0, '', ''),
(106, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '5154463110872', 'ship  ismail mohmed ismail', 'ship menoufai', 'ship  ashmoun', 'Abu Dhabi', 'Emirates', '0592', 'ARE', 'ismail mohmed ismail 2', 'menoufai2', 'ashmoun2', ' Fujairah', '', '0592', 'ARE', 'empcland@gmail.com', '01150250720', '1', '', 0, 0, 0, 0, 0, '', ''),
(107, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '515456141d514', 'Namedfsd', 'Address', 'asda', 'Dubai', 'Emirates', '05920', 'ARE', 'Namedfsd', 'Address', 'asda', 'Dubai', 'Emirates', '05920', 'ARE', 'ismail@e-scapes.me', '1212', '1', '', 0, 27, 0, 0, 0, '', ''),
(108, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519513870bcfe', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, '', ''),
(109, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519513be52efb', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, '', ''),
(110, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519514cc561f3', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, '', ''),
(111, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '5198c39183986', 'wq', 'wew', 'ww', 'wew', 'wewe', 'wewe', 'GBR', 'wewe', 'wewe', 'wewe', 'wewe', 'wewe', 'qwewe', 'GBR', 'wew', 'wewe', '', '', 0, 0, 0, 0, 0, '', ''),
(112, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '5198d59be1c69', 'a', 'a', '', 'ghfg', 'egypt', '0592', 'GBR', 'ismail mohmed ismail', 'ashmoun', '', 'ghfg', 'egypt', '0592', 'GBR', 'empcland@gmail.com', '01150250620', '', '', 0, 0, 0, 0, 0, '', ''),
(113, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '5198d7e7a2c94', 'ismail mohmed ismail', 'ashmoun', 'Address 2', 'Town / City', 'egypt', '0592', 'GBR', 'ismail mohmed ismail', 'ashmoun', 'Address 2', 'c town', 'egypt', '0592', 'GBR', 'empcland@gmail.com', '01150250620', '', '', 0, 0, 0, 0, 0, '', ''),
(114, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '5198d84576555', 'ismail mohmed ismail', 'ashmoun', 'Address 2', 'Town / City', 'egypt', '0592', 'GBR', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', 'empcland@gmail.com', '01150250620', '', '', 0, 0, 0, 0, 0, '', ''),
(115, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '5198d8c04c227', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', 'ismail mohmed ismail', 'Address 1', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', 'empcland@gmail.com', '01150250620', '', '', 0, 0, 0, 0, 0, '', ''),
(116, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '5198d9d28effb', 'ismail mohmed ismail', 'ashmoun', '', 'ghfg', 'egypt', '0592', 'GBR', 'ismail mohmed ismail', 'ashmoun', '', 'ghfg', 'egypt', '0592', 'GBR', 'empcland@gmail.com', '01150250620', '', '', 0, 0, 0, 0, 0, '', ''),
(117, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '5198da4a64dc8', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', 'empcland@gmail.com', '01150250620', '', '', 0, 0, 0, 0, 0, '', ''),
(118, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '5198da7188dc7', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', 'empcland@gmail.com', '01150250620', '', '', 0, 0, 0, 0, 0, '', ''),
(119, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '5198dbcf4388f', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', 'empcland@gmail.com', '01150250620', '', '', 0, 0, 0, 0, 0, '', ''),
(120, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '5198dc64bc602', 'ismail mohmed ismail', 'Address 1', 'Address 2', 'Town / City', 'egypt', '0592', 'GBR', 'ismail mohmed ismail', 'Address 1', 'Address 2', 'Town / City', 'egypt', '0592', 'GBR', 'empcland@gmail.com', '01150250620', '', '', 0, 0, 0, 0, 0, '', ''),
(121, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '5198dc6aef056', 'ismail mohmed ismail', 'Address 1', 'Address 2', 'Town / City', 'egypt', '0592', 'GBR', 'ismail mohmed ismail', 'Address 1', 'Address 2', 'Town / City', 'egypt', '0592', 'GBR', 'empcland@gmail.com', '01150250620', '', '', 0, 0, 0, 0, 0, '', ''),
(122, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '5198e25d6394c', 'ismail mohmed ismail', 'ashmoun', 'Address 2', 'ghfg', 'egypt', '0592', 'GBR', 'ismail mohmed ismail', 'ashmoun', 'Address 2', 'ghfg', 'egypt', '0592', 'GBR', 'empcland@gmail.com', '01150250620', '1', '', 0, 0, 0, 0, 0, '', ''),
(123, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '5198efed7be8d', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', '---', '11021', 'GBR', 'full name', 'add 1', 'add 2', 'town 2', 'county ', 'postal code', 'GBR', 'azizms@gmail.com', '1233456789', '', '', 0, 0, 0, 0, 0, '', ''),
(124, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '5198f02bdc63d', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', '---', '11021', 'GBR', 'full name', 'add1', 'add2', 'town 2', 'county ', 'post ode 2', 'GBR', 'azizms@gmail.com', '121212121', '', '', 0, 0, 0, 0, 0, '', ''),
(125, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '5198f05c5f4a6', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', '---', '11021abc', 'GBR', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', '---', '11021abc', 'GBR', 'azizms@gmail.com', '2123', '', '', 0, 0, 0, 0, 0, '', ''),
(126, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '5198f0cc1c6c1', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', '---', '11021', 'GBR', 'full name', 'add 1', 'add 2', 'town1', 'county1', '12122abc', 'GBR', 'Azizms@gmail.com', '334434', '', '', 0, 0, 0, 0, 0, '', ''),
(127, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519957906e7e3', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', '---', '11021', 'GBR', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', '---', '11021', 'GBR', 'azizms@gmail.com', '223', '', '', 0, 0, 0, 0, 0, 'uk', ''),
(128, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519a954f39e59', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', '---', '11021', 'GBR', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', '---', '11021', 'GBR', 'azizms@gmail.com', '23223', '', '', 0, 0, 0, 0, 0, 'uk', ''),
(129, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519a95be87988', 'Aziz Vasi', '29 Tahrir St', '', '', 'Emirates', '11021', 'ARE', 'Aziz Vasi', '29 Tahrir St', '', '', 'Emirates', '11021', 'ARE', 'azizms@gmail.com', '1222', '1', '', 0, 0, 0, 0, 0, 'ae', ''),
(130, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519a95c836d23', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', 'empcland@gmail.com', '01150250620', '', '', 0, 0, 0, 0, 0, 'uk', ''),
(131, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519a95d527969', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', 'empcland@gmail.com', '01150250620', '', '', 0, 0, 0, 0, 0, 'uk', ''),
(132, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519a96b19a973', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', 'empcland@gmail.com', '01150250620', '1', '', 0, 0, 0, 0, 0, 'uk', ''),
(133, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519a96b8db0c0', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', 'empcland@gmail.com', '01150250620', '1', '', 0, 0, 0, 0, 0, 'uk', ''),
(134, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519a96e8b80e5', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', 'empcland@gmail.com', '01150250620', '1', '', 0, 0, 0, 0, 0, 'uk', ''),
(135, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519b25acbd051', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'AF', 'Emirates', '0592', 'ARE', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'AF', 'Emirates', '0592', 'ARE', 'empcland@gmail.com', '01150250620', '1', '', 0, 0, 0, 0, 0, '@%get->site%@', ''),
(136, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519b2beb62fd5', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', 'empcland@gmail.com', '01150250620', '1', '', 0, 0, 0, 0, 0, 'uk', ''),
(137, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519b46bf4e9c4', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'eeee', 'Emirates', '0592', 'ARE', 'ismail mohmed ismail', 'ashmoun', 'fghf', '', 'Emirates', '0592', 'ARE', 'empcland@gmail.com', '01150250620', '1', '', 0, 0, 0, 0, 0, '', ''),
(138, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519b4956bae81', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', 'empcland@gmail.com', '01150250620', '1', '', 0, 0, 0, 0, 0, 'uk', ''),
(139, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519b4a496374d', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', 'empcland@gmail.com', '01150250620', '10', '', 0, 0, 0, 0, 0, 'uk', ''),
(140, 0, 0, '2013-05-21 00:00:00', '0000-00-00 00:00:00', 0, '519b51b753550', 'Aziz Vasi', '29 Tahrir St', '', 'Dubai', 'Emirates', '11021', 'ARE', 'Aziz Vasi', '29 Tahrir St', '', 'Dubai', 'Emirates', '11021', 'ARE', 'tur@tur.com', '1211', '9', '', 0, 0, 0, 0, 0, '', ''),
(141, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519b58f186837', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', '---', '11021', 'GBR', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', '---', '11021', 'GBR', 'azizms@gmail.com', '12122', '2', '', 0, 0, 0, 0, 0, 'uk', ''),
(142, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519b5d5eb20cb', 'Aziz Vasi', '29 Tahrir St', '', 'Dubai', 'Emirates', '11021', 'ARE', 'Raj', 'raj2', 'raj3', 'Abu Dhabi', '', '2323', 'ARE', 'azizms@gmail.com', '233', '2', '', 0, 0, 0, 0, 0, '', ''),
(143, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519b5fb92f1f1', 'Aziz Vasi', '29 Tahrir St', '', 'Dubai', 'Emirates', '11021', 'ARE', 'Aziz Vasi', '29 Tahrir St', '', 'Dubai', 'Emirates', '11021', 'ARE', 'aziz@e-scapes.me', '222', '', '', 0, 0, 0, 0, 0, '@%get->site%@', ''),
(144, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519b61986783f', 'Aziz Vasi', '29 Tahrir St', '', 'Dubai', 'Emirates', '11021', 'ARE', 'Aziz Vasi', '29 Tahrir St', '', 'Dubai', 'Emirates', '11021', 'ARE', 'azizms@gmail.com', '223232', '2', '', 0, 0, 0, 0, 0, 'ae', ''),
(145, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519b69d3bd5e4', 'Aziz Vasi', '29 Tahrir St', '', 'Dubai', 'Emirates', '11021', 'ARE', 'Aziz Vasi', '29 Tahrir St', '', 'Dubai', 'Emirates', '11021', 'ARE', 'aziz@e-scapes.me', '121122', '', '', 0, 0, 0, 0, 0, 'ae', ''),
(146, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519b6c5000b1f', 'Aziz Vasi', '29 Tahrir St', '', 'Dubai', 'Emirates', '11021', 'ARE', 'Aziz Vasi', '29 Tahrir St', '', 'Dubai', 'Emirates', '11021', 'ARE', 'azizms@gmail.com', '111111', '2', '', 0, 0, 0, 0, 0, 'ae', ''),
(147, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519b71614a560', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', '---', '11021', 'GBR', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', '---', '11021', 'GBR', 'alaqmarllc@gmail.com', '232332', '1', '', 0, 0, 0, 0, 0, '@%get->site%@', ''),
(148, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519b7923bbe63', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', '---', '11021', 'EGY', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', '---', '11021', 'EGY', 'Azizms@gmail.com', 'azizms@gmail.com', '1', '', 0, 0, 0, 0, 0, 'global', ''),
(149, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519b83a0e1296', 'Aziz Vasi', '29 Tahrir St', '', 'Dubai', 'Emirates', '11021', 'ARE', 'Aziz Vasi', '29 Tahrir St', '', 'Dubai', 'Emirates', '11021', 'ARE', 'aziz@e-scapes.me', '11111', '2', '', 0, 0, 0, 0, 0, 'ae', ''),
(150, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519b842497450', 'Aziz Vasi', '29 Tahrir St', '', 'Dubai', 'Emirates', '11021', 'ARE', 'Aziz Vasi', '29 Tahrir St', '', 'Dubai', 'Emirates', '11021', 'ARE', 'azizms@gmail.com', '12122', '2', '', 0, 0, 0, 0, 0, 'ae', ''),
(151, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519b88e98ef06', 'Aziz Vasi', '29 Tahrir St', '', 'Dubai', 'Emirates', '11021', 'ARE', 'Aziz Vasi', '29 Tahrir St', '', 'Dubai', 'Emirates', '11021', 'ARE', 'escapesme@gmail.om', '3232', '2', '', 0, 0, 0, 0, 0, 'ae', ''),
(152, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519b8b327012c', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', 'AZ', '11021', 'USA', 'weewww', 'wewewe', 'wewe', 'giza', 'AL', 'edfsdfeer', 'USA', 'amztelcom@yahoo.com', '3232', '2', '', 0, 0, 0, 0, 0, 'us', ''),
(153, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519b8c522eb59', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', 'AK', '11021', 'USA', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', 'AK', '11021', 'USA', 'amztelcom@yahoo.com', '2323', '2', '', 0, 0, 0, 0, 0, 'us', ''),
(154, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519b8de34f5c3', 'E-Scapes IT Solutions', '29 Tahrir St', '', 'Dubai', 'Emirates', '11021', 'ARE', 'E-Scapes IT Solutions', '29 Tahrir St', '', 'Dubai', 'Emirates', '11021', 'ARE', 'amztelcom@yahoo.com', '2', '2', '', 0, 0, 0, 0, 0, 'ae', ''),
(155, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519b8e34e0641', 'Aziz Vasi', '29 Tahrir St', '', 'Dubai', 'Emirates', '11021', 'ARE', 'Aziz Vasi', '29 Tahrir St', '', 'Dubai', 'Emirates', '11021', 'ARE', 'amztelcom@yahoo.com', '3433', '2', '', 0, 0, 0, 0, 0, 'ae', ''),
(156, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519b8e7b638a2', 'Aziz Vasi', '29 Tahrir St', '', 'Dubai', 'Emirates', '11021', 'ARE', 'Aziz Vasi', '29 Tahrir St', '', 'Dubai', 'Emirates', '11021', 'ARE', 'amztelcom@yahoo.com', '2323', '2', '', 0, 0, 0, 0, 0, 'ae', ''),
(157, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519b902850c45', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'Dubai', 'Emirates', '0592', 'ARE', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'Dubai', 'Emirates', '0592', 'ARE', 'empcland@gmail.com', '4646', '2', '', 0, 0, 0, 0, 0, 'ae', ''),
(158, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519b91b7a8008', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', 'AL', '11021', 'USA', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', 'AL', '11021', 'USA', 'azizms@gmail.com', '2332', '2', '', 0, 0, 0, 0, 0, 'us', ''),
(159, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519b94be6d104', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', '---', '11021', 'EGY', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', '---', '11021', 'EGY', 'Azizms@gmail.com', '3232', '2', '', 0, 0, 0, 0, 0, 'global', ''),
(160, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519b95b441911', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', 'AZ', '11021', 'USA', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', 'AZ', '11021', 'USA', 'amztelcom@yahoo.com', '34', '2', '', 0, 0, 0, 0, 0, 'us', ''),
(161, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519b961d492bd', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', '---', '11021', 'EGY', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', '---', '11021', 'EGY', 'escapesme@gmail.om', 'we', '2', '', 0, 0, 0, 0, 0, 'global', ''),
(162, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519b967c8eb26', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', '---', '11021', 'EGY', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', '---', '11021', 'EGY', 'Azizms@gmail.com', '223232', '2', '', 0, 0, 0, 0, 0, 'global', ''),
(163, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519b9720f2d8f', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', '---', '11021', 'EGY', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', '---', '11021', 'EGY', 'Azizms@gmail.com', '2322', '2', '', 0, 0, 0, 0, 0, 'global', ''),
(164, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519b9fb679b28', 'Aziz Vasi', '29 Tahrir St', '', 'Dubai', 'Emirates', '11021', 'ARE', 'Aziz Vasi', '29 Tahrir St', '', 'Dubai', 'Emirates', '11021', 'ARE', 'amztelcom@yahoo.com', '223232', '2', '', 0, 0, 0, 0, 0, 'ae', ''),
(165, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519cc9d37ee0c', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', '---', '11021', 'GBR', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', '---', '11021', '', '', '1212', '1', '', 0, 0, 0, 0, 0, 'uk', ''),
(166, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519d1bc65814b', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', '---', '11021', 'GBR', 'Aziz Vasi', '29 Tahrir St', '', 'Cairo', '---', '11021', '', '', '23232', '2', '', 0, 0, 0, 0, 0, 'uk', ''),
(167, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519d1eafb8662', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', '', '01150250620', '1', '', 0, 0, 0, 0, 0, 'uk', ''),
(168, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519d1eb2f243e', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', '', '01150250620', '2', '4998956797', 0, 0, 0, 0, 0, 'uk', ''),
(169, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519d1f9e3ddef', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', '', '01150250620', '1', '', 0, 0, 0, 0, 0, 'uk', ''),
(170, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '519d1fd6ccdbf', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', 'ismail mohmed ismail', 'ashmoun', 'fghf', 'ghfg', 'egypt', '0592', 'GBR', '', '01150250620', '1', '', 0, 0, 0, 0, 0, 'uk', '£ ');

-- --------------------------------------------------------

--
-- Table structure for table `com_products_order_xref`
--

CREATE TABLE IF NOT EXISTS `com_products_order_xref` (
`id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `quantity` varchar(255) CHARACTER SET utf8 NOT NULL,
  `price` varchar(255) CHARACTER SET utf8 NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=678 ;

--
-- Dumping data for table `com_products_order_xref`
--

INSERT INTO `com_products_order_xref` (`id`, `pro_id`, `order_id`, `delete`, `order`, `enabled`, `modified`, `created`, `quantity`, `price`, `type`, `name`) VALUES
(397, 0, '514c8085f011a', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '9.99', 'shipping', 'Shipping'),
(395, 0, '514c807d3e994', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '9.99', 'shipping', 'Shipping'),
(396, 52, '514c8085f011a', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '27.99', 'product', 'Neck Warmer'),
(394, 52, '514c807d3e994', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '27.99', 'product', 'Neck Warmer'),
(392, 62, '514c162dcb0f7', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '4', '26.59', 'product', 'Feet Warmer'),
(393, 0, '514c162dcb0f7', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '60.00', 'shipping', 'Shipping'),
(391, 52, '514c162dcb0f7', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '26.59', 'product', 'Neck Warmer'),
(390, 0, '514ae4b85b8c6', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '6', 'shipping', 'Shipping'),
(389, 52, '514ae4b85b8c6', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '27.99', 'product', 'Neck Warmer'),
(388, 0, '514ae2c99e247', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '8.99', 'shipping', 'Shipping'),
(387, 52, '514ae2c99e247', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '27.99', 'product', 'Neck Warmer'),
(386, 53, '514ae2c99e247', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '27.99', 'product', 'Back Warmer'),
(381, 53, '514adf4b2cf1e', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '27.99', 'product', 'Back Warmer'),
(382, 0, '514adf4b2cf1e', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '8.99', 'shipping', 'Shipping'),
(383, 52, '514ae0adb819f', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '27.99', 'product', 'Neck Warmer'),
(384, 53, '514ae0adb819f', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '27.99', 'product', 'Back Warmer'),
(385, 0, '514ae0adb819f', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '8.99', 'shipping', 'Shipping'),
(380, 52, '514adf4b2cf1e', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '27.99', 'product', 'Neck Warmer'),
(398, 52, '514c81f06f00f', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '27.99', 'product', 'Neck Warmer'),
(399, 0, '514c81f06f00f', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '10.99', 'shipping', 'Shipping'),
(400, 52, '514c864d87e8e', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '27.99', 'product', 'Neck Warmer'),
(401, 0, '514c864d87e8e', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(402, 52, '514c865750147', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '27.99', 'product', 'Neck Warmer'),
(403, 0, '514c865750147', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(404, 52, '514c866d5271b', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '27.99', 'product', 'Neck Warmer'),
(405, 0, '514c866d5271b', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '9.99', 'shipping', 'Shipping'),
(406, 52, '514c867b773da', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '27.99', 'product', 'Neck Warmer'),
(407, 0, '514c867b773da', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '10.00', 'shipping', 'Shipping'),
(408, 52, '514c86ac8e5f5', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '27.99', 'product', 'Neck Warmer'),
(409, 0, '514c86ac8e5f5', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '10.00', 'shipping', 'Shipping'),
(410, 52, '514c86b746614', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '27.99', 'product', 'Neck Warmer'),
(411, 0, '514c86b746614', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '10.00', 'shipping', 'Shipping'),
(412, 52, '514c89d95256b', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '27.99', 'product', 'Neck Warmer'),
(413, 0, '514c89d95256b', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(414, 52, '514c89f092bc3', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '27.99', 'product', 'Neck Warmer'),
(415, 0, '514c89f092bc3', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '7.99', 'shipping', 'Shipping'),
(416, 52, '514c8a19f0922', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '27.99', 'product', 'Neck Warmer'),
(417, 0, '514c8a19f0922', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '7.99', 'shipping', 'Shipping'),
(418, 52, '514c8fc69a6d7', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '27.99', 'product', 'Neck Warmer'),
(419, 0, '514c8fc69a6d7', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '9.99', 'shipping', 'Shipping'),
(420, 52, '514c9938eb32f', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '16.99', 'product', 'Neck Warmer'),
(421, 55, '514c9938eb32f', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '4', '15.49', 'product', 'Menstrual Warmer'),
(422, 62, '514c9938eb32f', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', '15.49', 'product', 'Feet Warmer'),
(423, 0, '514c9938eb32f', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '6.49', 'shipping', 'Shipping'),
(424, 53, '514ca0503627d', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '24.99', 'product', 'Back Warmer'),
(425, 0, '514ca0503627d', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '20.00', 'shipping', 'Shipping'),
(426, 53, '514ca06490fd1', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '24.99', 'product', 'Back Warmer'),
(427, 0, '514ca06490fd1', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '20.00', 'shipping', 'Shipping'),
(428, 53, '514ca0d881814', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '24.99', 'product', 'Back Warmer'),
(429, 0, '514ca0d881814', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '20.00', 'shipping', 'Shipping'),
(430, 53, '514ca0f146362', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '24.99', 'product', 'Back Warmer'),
(431, 0, '514ca0f146362', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '20.00', 'shipping', 'Shipping'),
(432, 53, '514ca27722621', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '24.99', 'product', 'Back Warmer'),
(433, 0, '514ca27722621', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '20.00', 'shipping', 'Shipping'),
(434, 53, '514ca2e043d18', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '24.99', 'product', 'Back Warmer'),
(435, 0, '514ca2e043d18', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '20.00', 'shipping', 'Shipping'),
(436, 53, '514ca2ff316b0', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '24.99', 'product', 'Back Warmer'),
(437, 0, '514ca2ff316b0', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '20.00', 'shipping', 'Shipping'),
(438, 53, '514ca3debfaf5', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '24.99', 'product', 'Back Warmer'),
(439, 0, '514ca3debfaf5', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '20.00', 'shipping', 'Shipping'),
(440, 53, '514ca44666b93', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '24.99', 'product', 'Back Warmer'),
(441, 0, '514ca44666b93', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '20.00', 'shipping', 'Shipping'),
(442, 52, '514ca5c098832', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '16.99', 'product', 'Neck Warmer'),
(443, 0, '514ca5c098832', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '11.99', 'shipping', 'Shipping'),
(444, 52, '514ca761157e4', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '16.14', 'product', 'Neck Warmer'),
(445, 0, '514ca761157e4', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '6.49', 'shipping', 'Shipping'),
(446, 52, '514cab2e34d4d', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', ' 24.99', 'product', 'Neck Warmer'),
(447, 0, '514cab2e34d4d', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '9.99', 'shipping', 'Shipping'),
(448, 53, '514cbc0541db1', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '24.99', 'product', 'Back Warmer'),
(449, 0, '514cbc0541db1', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '9.99', 'shipping', 'Shipping'),
(450, 54, '514cbd6510ee3', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '11.99', 'product', 'Hand Warmer'),
(451, 0, '514cbd6510ee3', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '9.99', 'shipping', 'Shipping'),
(452, 54, '514cbdac49794', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '11.39', 'product', 'Hand Warmer'),
(453, 0, '514cbdac49794', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '9.99', 'shipping', 'Shipping'),
(454, 54, '514cbdba30ba3', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '11.39', 'product', 'Hand Warmer'),
(455, 0, '514cbdba30ba3', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '9.99', 'shipping', 'Shipping'),
(456, 54, '514cbdf9bb333', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '11.39', 'product', 'Hand Warmer'),
(457, 0, '514cbdf9bb333', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '9.99', 'shipping', 'Shipping'),
(458, 54, '514cbe122b4c8', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '11.39', 'product', 'Hand Warmer'),
(459, 0, '514cbe122b4c8', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '9.99', 'shipping', 'Shipping'),
(460, 54, '514cbe2024ebb', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '11.39', 'product', 'Hand Warmer'),
(461, 0, '514cbe2024ebb', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '9.99', 'shipping', 'Shipping'),
(462, 54, '514cbe559acfb', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '11.39', 'product', 'Hand Warmer'),
(463, 0, '514cbe559acfb', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '9.99', 'shipping', 'Shipping'),
(464, 54, '514cbe684b0b1', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '11.39', 'product', 'Hand Warmer'),
(465, 0, '514cbe684b0b1', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '9.99', 'shipping', 'Shipping'),
(466, 54, '514cbe9b030d9', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '49.00', 'product', 'Hand Warmer'),
(467, 0, '514cbe9b030d9', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '10.00', 'shipping', 'Shipping'),
(468, 54, '514cbef2a183d', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '11.99', 'product', 'Hand Warmer'),
(469, 0, '514cbef2a183d', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '40.00', 'shipping', 'Shipping'),
(470, 54, '514cbf19ed48e', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '11.99', 'product', 'Hand Warmer'),
(471, 0, '514cbf19ed48e', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '40.00', 'shipping', 'Shipping'),
(472, 54, '514cc02087e9c', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '11.99', 'product', 'Hand Warmer'),
(473, 0, '514cc02087e9c', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '20.00', 'shipping', 'Shipping'),
(474, 54, '514cc47032d63', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '11.99', 'product', 'Hand Warmer'),
(475, 53, '514cc47032d63', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '24.99', 'product', 'Back Warmer'),
(476, 0, '514cc47032d63', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '80.00', 'shipping', 'Shipping'),
(477, 55, '514cc67f612a0', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '4', '22.99', 'product', 'Menstrual Warmer'),
(478, 0, '514cc67f612a0', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '60.00', 'shipping', 'Shipping'),
(479, 52, '514cc8a673bac', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2', '16.99', 'product', 'Neck Warmer'),
(480, 56, '514cc8a673bac', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '15.49', 'product', 'Knee Warmer'),
(481, 0, '514cc8a673bac', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '6.49', 'shipping', 'Shipping'),
(482, 63, '514ccb19d362e', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '16.99', 'product', 'Seat Warmer'),
(483, 52, '514ccb19d362e', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '16.99', 'product', 'Neck Warmer'),
(484, 56, '514ccb19d362e', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '15.49', 'product', 'Knee Warmer'),
(485, 0, '514ccb19d362e', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '6.49', 'shipping', 'Shipping'),
(486, 53, '514cccba63d7e', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '99.00', 'product', 'Back Warmer'),
(487, 0, '514cccba63d7e', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '10.00', 'shipping', 'Shipping'),
(488, 52, '514ccf506b73e', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '99.00', 'product', 'Neck Warmer'),
(489, 0, '514ccf506b73e', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '10.00', 'shipping', 'Shipping'),
(490, 52, '514cd128536e8', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2', '99.00', 'product', 'Neck Warmer'),
(491, 0, '514cd128536e8', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '10.00', 'shipping', 'Shipping'),
(492, 55, '514d346255075', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '15.49', 'product', 'Menstrual Warmer'),
(493, 0, '514d346255075', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '3.00', 'shipping', 'Shipping'),
(494, 53, '514d7e1c9982f', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '99.00', 'product', 'Back Warmer'),
(495, 0, '514d7e1c9982f', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '10.00', 'shipping', 'Shipping'),
(496, 64, '514eb17996d9b', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '29.00', 'product', 'Pocket Warmer'),
(497, 0, '514eb17996d9b', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '10.00', 'shipping', 'Shipping'),
(498, 65, '514eb213e801e', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '', 'product', 'Family Multipack'),
(499, 0, '514eb213e801e', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '10.00', 'shipping', 'Shipping'),
(500, 65, '514eb94ee6e99', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '', 'product', 'Family Multipack'),
(501, 0, '514eb94ee6e99', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '6.49', 'shipping', 'Shipping'),
(502, 65, '514eba6525604', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '', 'product', 'Family Multipack'),
(503, 0, '514eba6525604', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '10.99', 'shipping', 'Shipping'),
(504, 53, '5150d50b860f1', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '16.99', 'product', 'Back Warmer'),
(505, 54, '5150d50b860f1', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '8.49', 'product', 'Hand Warmer'),
(506, 0, '5150d50b860f1', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '6.49', 'shipping', 'Shipping'),
(507, 53, '5150d6f178817', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '16.99', 'product', 'Back Warmer'),
(508, 54, '5150d6f178817', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '8.49', 'product', 'Hand Warmer'),
(509, 0, '5150d6f178817', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '6.49', 'shipping', 'Shipping'),
(510, 62, '5154463110872', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '84.55', 'product', 'Feet Warmer'),
(511, 56, '5154463110872', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '84.55', 'product', 'Knee Warmer'),
(512, 55, '5154463110872', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '84.55', 'product', 'Menstrual Warmer'),
(513, 53, '5154463110872', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '94.05', 'product', 'Back Warmer'),
(514, 54, '5154463110872', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '46.55', 'product', 'Hand Warmer'),
(515, 63, '5154463110872', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '94.05', 'product', 'Seat Warmer'),
(516, 52, '5154463110872', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '4', '94.05', 'product', 'Neck Warmer'),
(517, 0, '5154463110872', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '10.00', 'shipping', 'Shipping'),
(518, 62, '515456141d514', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '89.00', 'product', 'Feet Warmer'),
(519, 56, '515456141d514', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '89.00', 'product', 'Knee Warmer'),
(520, 55, '515456141d514', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '89.00', 'product', 'Menstrual Warmer'),
(521, 53, '515456141d514', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '99.00', 'product', 'Back Warmer'),
(522, 54, '515456141d514', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '49.00', 'product', 'Hand Warmer'),
(523, 63, '515456141d514', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '99.00', 'product', 'Seat Warmer'),
(524, 52, '515456141d514', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '4', '99.00', 'product', 'Neck Warmer'),
(525, 0, '515456141d514', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '10.00', 'shipping', 'Shipping'),
(526, 52, '519513870bcfe', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', ' 24.99', 'product', 'Neck Warmer'),
(527, 53, '519513870bcfe', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '24.99', 'product', 'Back Warmer'),
(528, 52, '519513be52efb', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', ' 24.99', 'product', 'Neck Warmer'),
(529, 53, '519513be52efb', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '24.99', 'product', 'Back Warmer'),
(530, 52, '519514cc561f3', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', ' 24.99', 'product', 'Neck Warmer'),
(531, 53, '519514cc561f3', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '24.99', 'product', 'Back Warmer'),
(532, 52, '5198c39183986', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '16.99', 'product', 'Neck Warmer'),
(533, 53, '5198d59be1c69', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '9', '16.99', 'product', 'Back Warmer'),
(534, 52, '5198d59be1c69', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '16.99', 'product', 'Neck Warmer'),
(535, 53, '5198d7e7a2c94', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '9', '16.99', 'product', 'Back Warmer'),
(536, 52, '5198d7e7a2c94', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '16.99', 'product', 'Neck Warmer'),
(537, 53, '5198d84576555', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '9', '16.99', 'product', 'Back Warmer'),
(538, 52, '5198d84576555', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '16.99', 'product', 'Neck Warmer'),
(539, 53, '5198d8c04c227', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '9', '16.99', 'product', 'Back Warmer'),
(540, 52, '5198d8c04c227', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '16.99', 'product', 'Neck Warmer'),
(541, 53, '5198d9d28effb', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '9', '16.99', 'product', 'Back Warmer'),
(542, 52, '5198d9d28effb', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '16.99', 'product', 'Neck Warmer'),
(543, 53, '5198da4a64dc8', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '9', '16.99', 'product', 'Back Warmer'),
(544, 52, '5198da4a64dc8', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '16.99', 'product', 'Neck Warmer'),
(545, 53, '5198da7188dc7', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '9', '16.99', 'product', 'Back Warmer'),
(546, 52, '5198da7188dc7', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '16.99', 'product', 'Neck Warmer'),
(547, 53, '5198dbcf4388f', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '9', '16.99', 'product', 'Back Warmer'),
(548, 52, '5198dbcf4388f', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '16.99', 'product', 'Neck Warmer'),
(549, 0, '5198dbcf4388f', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(550, 53, '5198dc64bc602', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '9', '16.99', 'product', 'Back Warmer'),
(551, 52, '5198dc64bc602', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '16.99', 'product', 'Neck Warmer'),
(552, 0, '5198dc64bc602', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(553, 53, '5198dc6aef056', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '9', '16.99', 'product', 'Back Warmer'),
(554, 52, '5198dc6aef056', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '16.99', 'product', 'Neck Warmer'),
(555, 0, '5198dc6aef056', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(556, 53, '5198e25d6394c', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '9', '16.99', 'product', 'Back Warmer'),
(557, 52, '5198e25d6394c', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '16.99', 'product', 'Neck Warmer'),
(558, 0, '5198e25d6394c', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(559, 52, '5198efed7be8d', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '16.99', 'product', 'Neck Warmer'),
(560, 0, '5198efed7be8d', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(561, 52, '5198f02bdc63d', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '16.99', 'product', 'Neck Warmer'),
(562, 0, '5198f02bdc63d', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(563, 52, '5198f05c5f4a6', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '16.99', 'product', 'Neck Warmer'),
(564, 0, '5198f05c5f4a6', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(565, 52, '5198f0cc1c6c1', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '16.99', 'product', 'Neck Warmer'),
(566, 0, '5198f0cc1c6c1', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(567, 69, '519957906e7e3', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '57.99', 'product', 'Super Gran Pack '),
(568, 52, '519957906e7e3', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '16.99', 'product', 'Neck Warmer'),
(569, 62, '519957906e7e3', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2', '15.49', 'product', 'Feet Warmer'),
(570, 68, '519957906e7e3', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '79.99', 'product', 'Superhero Pack'),
(571, 0, '519957906e7e3', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(572, 52, '519a954f39e59', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2', '16.14', 'product', 'Neck Warmer'),
(573, 0, '519a954f39e59', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(574, 52, '519a95be87988', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2', '99.00', 'product', 'Neck Warmer'),
(575, 0, '519a95be87988', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(576, 70, '519a95c836d23', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '56.99', 'product', 'Family Pack'),
(577, 52, '519a95c836d23', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', '16.99', 'product', 'Neck Warmer'),
(578, 0, '519a95c836d23', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(579, 70, '519a95d527969', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '56.99', 'product', 'Family Pack'),
(580, 52, '519a95d527969', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', '16.99', 'product', 'Neck Warmer'),
(581, 0, '519a95d527969', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(582, 70, '519a96b19a973', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '56.99', 'product', 'Family Pack'),
(583, 52, '519a96b19a973', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', '16.99', 'product', 'Neck Warmer'),
(584, 0, '519a96b19a973', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(585, 70, '519a96b8db0c0', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '56.99', 'product', 'Family Pack'),
(586, 52, '519a96b8db0c0', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', '16.99', 'product', 'Neck Warmer'),
(587, 0, '519a96b8db0c0', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(588, 70, '519a96e8b80e5', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '56.99', 'product', 'Family Pack'),
(589, 52, '519a96e8b80e5', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', '16.99', 'product', 'Neck Warmer'),
(590, 0, '519a96e8b80e5', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(591, 52, '519b25acbd051', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2', '99.00', 'product', 'Neck Warmer'),
(592, 0, '519b25acbd051', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(593, 52, '519b2beb62fd5', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2', '16.99', 'product', 'Neck Warmer'),
(594, 0, '519b2beb62fd5', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(595, 52, '519b46bf4e9c4', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2', '99.00', 'product', 'Neck Warmer'),
(596, 0, '519b46bf4e9c4', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(597, 52, '519b4956bae81', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2', '16.99', 'product', 'Neck Warmer'),
(598, 0, '519b4956bae81', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(599, 52, '519b4a496374d', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2', '16.99', 'product', 'Neck Warmer'),
(600, 0, '519b4a496374d', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(601, 52, '519b51b753550', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '4', '99.00', 'product', 'Neck Warmer'),
(602, 0, '519b51b753550', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(603, 52, '519b58f186837', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '4', '16.99', 'product', 'Neck Warmer'),
(604, 0, '519b58f186837', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(605, 52, '519b5d5eb20cb', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '4', '99.00', 'product', 'Neck Warmer'),
(606, 0, '519b5d5eb20cb', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(607, 68, '519b5fb92f1f1', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '', 'product', 'Superhero Pack'),
(608, 52, '519b5fb92f1f1', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '99.00', 'product', 'Neck Warmer'),
(609, 0, '519b5fb92f1f1', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(610, 68, '519b61986783f', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '', 'product', 'Superhero Pack'),
(611, 52, '519b61986783f', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '99.00', 'product', 'Neck Warmer'),
(612, 53, '519b61986783f', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', '99.00', 'product', 'Back Warmer'),
(613, 0, '519b61986783f', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(614, 68, '519b69d3bd5e4', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '', 'product', 'Superhero Pack'),
(615, 52, '519b69d3bd5e4', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '99.00', 'product', 'Neck Warmer'),
(616, 53, '519b69d3bd5e4', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', '99.00', 'product', 'Back Warmer'),
(617, 0, '519b69d3bd5e4', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(618, 68, '519b6c5000b1f', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '', 'product', 'Superhero Pack'),
(619, 52, '519b6c5000b1f', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', '99.00', 'product', 'Neck Warmer'),
(620, 53, '519b6c5000b1f', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', '99.00', 'product', 'Back Warmer'),
(621, 0, '519b6c5000b1f', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(622, 53, '519b71614a560', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', '16.99', 'product', 'Back Warmer'),
(623, 52, '519b71614a560', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '16.99', 'product', 'Neck Warmer'),
(624, 0, '519b71614a560', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(625, 53, '519b7923bbe63', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', '24.99', 'product', 'Back Warmer'),
(626, 52, '519b7923bbe63', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', ' 24.99', 'product', 'Neck Warmer'),
(627, 0, '519b7923bbe63', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(628, 53, '519b83a0e1296', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', '99.00', 'product', 'Back Warmer'),
(629, 52, '519b83a0e1296', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '99.00', 'product', 'Neck Warmer'),
(630, 0, '519b83a0e1296', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(631, 53, '519b842497450', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', '99.00', 'product', 'Back Warmer'),
(632, 52, '519b842497450', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '99.00', 'product', 'Neck Warmer'),
(633, 0, '519b842497450', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(634, 53, '519b88e98ef06', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', '99.00', 'product', 'Back Warmer'),
(635, 52, '519b88e98ef06', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '99.00', 'product', 'Neck Warmer'),
(636, 0, '519b88e98ef06', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(637, 53, '519b8b327012c', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2', '24.99', 'product', 'Back Warmer'),
(638, 63, '519b8b327012c', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '24.99', 'product', 'Seat Warmer'),
(639, 0, '519b8b327012c', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(640, 52, '519b8c522eb59', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', ' 24.99', 'product', 'Neck Warmer'),
(641, 0, '519b8c522eb59', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(642, 52, '519b8de34f5c3', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '99.00', 'product', 'Neck Warmer'),
(643, 0, '519b8de34f5c3', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(644, 62, '519b8e34e0641', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '89.00', 'product', 'Feet Warmer'),
(645, 0, '519b8e34e0641', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(646, 52, '519b8e7b638a2', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '99.00', 'product', 'Neck Warmer'),
(647, 0, '519b8e7b638a2', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(648, 52, '519b902850c45', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2', '99.00', 'product', 'Neck Warmer'),
(649, 0, '519b902850c45', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(650, 52, '519b91b7a8008', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '23.74', 'product', 'Neck Warmer'),
(651, 0, '519b91b7a8008', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(652, 52, '519b94be6d104', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', ' 24.99', 'product', 'Neck Warmer'),
(653, 0, '519b94be6d104', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(654, 52, '519b95b441911', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', ' 24.99', 'product', 'Neck Warmer'),
(655, 0, '519b95b441911', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(656, 52, '519b961d492bd', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', ' 24.99', 'product', 'Neck Warmer'),
(657, 0, '519b961d492bd', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(658, 52, '519b967c8eb26', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', ' 24.99', 'product', 'Neck Warmer'),
(659, 0, '519b967c8eb26', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(660, 52, '519b9720f2d8f', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', ' 24.99', 'product', 'Neck Warmer'),
(661, 53, '519b9720f2d8f', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '24.99', 'product', 'Back Warmer'),
(662, 0, '519b9720f2d8f', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(663, 53, '519b9fb679b28', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '99.00', 'product', 'Back Warmer'),
(664, 0, '519b9fb679b28', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(665, 52, '519cc9d37ee0c', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '16.99', 'product', 'Neck Warmer'),
(666, 0, '519cc9d37ee0c', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(667, 52, '519d1bc65814b', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '16.99', 'product', 'Neck Warmer'),
(668, 0, '519d1bc65814b', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(669, 52, '519d1eafb8662', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '16.99', 'product', 'Neck Warmer'),
(670, 0, '519d1eafb8662', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(671, 52, '519d1eb2f243e', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '16.99', 'product', 'Neck Warmer'),
(672, 0, '519d1eb2f243e', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(673, 52, '519d1f9e3ddef', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '16.99', 'product', 'Neck Warmer'),
(674, 0, '519d1f9e3ddef', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping'),
(675, 52, '519d1fd6ccdbf', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '16.99', 'product', 'Neck Warmer'),
(676, 64, '519d1fd6ccdbf', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '4.99', 'product', 'Pocket Warmer'),
(677, 0, '519d1fd6ccdbf', 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0', 'shipping', 'Shipping');

-- --------------------------------------------------------

--
-- Table structure for table `com_products_price`
--

CREATE TABLE IF NOT EXISTS `com_products_price` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL DEFAULT '0',
  `pro_id` int(11) NOT NULL,
  `price` varchar(255) NOT NULL,
  `site` int(11) NOT NULL,
  `valueprice` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `com_products_price`
--

INSERT INTO `com_products_price` (`id`, `created`, `modified`, `enabled`, `order`, `delete`, `pro_id`, `price`, `site`, `valueprice`) VALUES
(1, '2013-03-19 06:13:57', '2013-03-21 00:00:00', 1, 0, 0, 62, '15.49', 2, ''),
(2, '2013-03-19 08:20:25', '2013-03-21 00:00:00', 1, 0, 0, 54, '8.49', 2, ''),
(3, '2013-03-19 08:20:47', '2013-03-21 00:00:00', 1, 0, 0, 55, '15.49', 2, ''),
(4, '2013-03-19 08:21:39', '2013-03-21 00:00:00', 1, 0, 0, 56, '15.49', 2, ''),
(5, '2013-03-19 08:22:04', '2013-03-21 00:00:00', 1, 0, 0, 52, '16.99', 2, ''),
(6, '2013-03-19 08:22:32', '2013-03-21 00:00:00', 1, 0, 0, 53, '16.99', 2, ''),
(7, '2013-03-19 08:22:54', '2013-03-21 00:00:00', 1, 0, 0, 63, '16.99', 2, ''),
(8, '2013-03-19 08:23:08', '2013-03-21 00:00:00', 1, 0, 0, 64, '4.99', 2, ''),
(9, '2013-03-21 04:07:48', '0000-00-00 00:00:00', 1, 0, 0, 74, '1.49', 2, ''),
(10, '2013-03-19 06:13:57', '2013-03-21 00:00:00', 1, 0, 0, 62, '89.00', 1, ''),
(11, '2013-03-19 08:20:25', '2013-03-21 00:00:00', 1, 0, 0, 54, '49.00', 1, ''),
(12, '2013-03-19 08:20:47', '2013-03-21 00:00:00', 1, 0, 0, 55, '89.00', 1, ''),
(13, '2013-03-19 08:21:39', '2013-03-21 00:00:00', 1, 0, 0, 56, '89.00', 1, ''),
(14, '2013-03-19 08:22:04', '2013-03-21 00:00:00', 1, 0, 0, 52, '99.00', 1, ''),
(15, '2013-03-19 08:22:32', '2013-03-21 00:00:00', 1, 0, 0, 53, '99.00', 1, ''),
(16, '2013-03-19 08:22:54', '2013-03-21 00:00:00', 1, 0, 0, 63, '99.00', 1, ''),
(17, '2013-03-19 08:23:08', '2013-03-21 00:00:00', 1, 0, 0, 64, '29.00', 1, ''),
(18, '2013-03-21 04:07:48', '2013-03-21 00:00:00', 1, 0, 0, 74, '9.00', 1, ''),
(19, '2013-03-19 06:13:57', '2013-03-21 00:00:00', 1, 0, 0, 62, '22.99', 3, ''),
(20, '2013-03-19 08:20:25', '2013-03-21 00:00:00', 1, 0, 0, 54, '11.99', 3, ''),
(21, '2013-03-19 08:20:47', '2013-03-21 00:00:00', 1, 0, 0, 55, '22.99', 3, ''),
(22, '2013-03-19 08:21:39', '2013-03-21 00:00:00', 1, 0, 0, 56, ' 22.99 ', 3, ''),
(23, '2013-03-19 08:22:04', '2013-03-21 00:00:00', 1, 0, 0, 52, ' 24.99', 3, ''),
(24, '2013-03-19 08:22:32', '2013-03-21 00:00:00', 1, 0, 0, 53, '24.99', 3, ''),
(25, '2013-03-19 08:22:54', '2013-03-21 00:00:00', 1, 0, 0, 63, '24.99', 3, ''),
(26, '2013-03-19 08:23:08', '2013-03-22 00:00:00', 1, 0, 0, 64, '4.99', 3, ''),
(27, '2013-03-21 04:07:48', '2013-03-22 00:00:00', 1, 0, 0, 74, '1.49', 3, ''),
(28, '2013-03-19 06:13:57', '2013-03-22 00:00:00', 1, 0, 0, 62, '22.99', 4, ''),
(29, '2013-03-19 08:20:25', '2013-03-22 00:00:00', 1, 0, 0, 54, '11.99', 4, ''),
(30, '2013-03-19 08:20:47', '2013-03-22 00:00:00', 1, 0, 0, 55, '22.99', 4, ''),
(31, '2013-03-19 08:21:39', '2013-03-22 00:00:00', 1, 0, 0, 56, ' 22.99 ', 4, ''),
(32, '2013-03-19 08:22:04', '2013-03-22 00:00:00', 1, 0, 0, 52, ' 24.99', 4, ''),
(33, '2013-03-19 08:22:32', '2013-03-22 00:00:00', 1, 0, 0, 53, '24.99', 4, ''),
(34, '2013-03-19 08:22:54', '2013-03-22 00:00:00', 1, 0, 0, 63, '24.99', 4, ''),
(35, '2013-03-19 08:23:08', '2013-03-22 00:00:00', 1, 0, 0, 64, '4.99', 4, ''),
(36, '2013-03-21 04:07:48', '2013-03-22 00:00:00', 1, 0, 0, 74, '1.49', 4, ''),
(37, '2013-05-19 15:28:08', '2013-05-19 00:00:00', 1, 0, 0, 68, '79.99', 2, '112.99'),
(38, '2013-05-19 15:28:28', '2013-05-19 00:00:00', 1, 0, 0, 69, '57.99', 2, ' 74.99'),
(39, '2013-05-19 15:46:05', '2013-05-19 00:00:00', 1, 0, 0, 70, '56.99', 2, '72.99'),
(40, '2013-05-19 15:46:30', '2013-05-19 00:00:00', 1, 0, 0, 71, '53.99', 2, '69.99'),
(41, '2013-05-19 15:47:08', '2013-05-19 00:00:00', 1, 0, 0, 72, '39.99', 2, '45.99'),
(42, '2013-05-19 15:47:32', '2013-05-19 00:00:00', 1, 0, 0, 73, '33.99', 2, '37.99');

-- --------------------------------------------------------

--
-- Table structure for table `com_products_setting`
--

CREATE TABLE IF NOT EXISTS `com_products_setting` (
`id` int(11) NOT NULL,
  `cat_id` varchar(11) NOT NULL,
  `thwidth` int(11) NOT NULL,
  `thheight` int(11) NOT NULL,
  `requstcartFields` text NOT NULL,
  `requstproFields` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `title` varchar(255) NOT NULL,
  `site` int(11) NOT NULL,
  `PaymentType` varchar(255) NOT NULL,
  `coupon` tinyint(4) NOT NULL,
  `shipping` tinyint(4) NOT NULL,
  `freeGift` tinyint(4) NOT NULL,
  `ordermails` text NOT NULL,
  `mailtemplate` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `com_products_setting`
--

INSERT INTO `com_products_setting` (`id`, `cat_id`, `thwidth`, `thheight`, `requstcartFields`, `requstproFields`, `created`, `modified`, `delete`, `order`, `enabled`, `title`, `site`, `PaymentType`, `coupon`, `shipping`, `freeGift`, `ordermails`, `mailtemplate`) VALUES
(4, '33', 0, 0, 'stepid=>s1__steporder=>1__steptitle=>Delivery Address__|typeID=>T1__type=>hidden__name=>site__class=>__value=>@%get::site%@__;typeID=>T3__type=>label__name=>sh_address_label__class=>__title=>Delivery Address__value=>__;typeID=>T2__type=>div__name=>sh_address_div__class=>__;typeID=>T5__type=>text__name=>ship_name__class=>__title=>Full Name__value=>__required=>required__;typeID=>T6__type=>text__name=>ship_street_address__class=>__title=>Address 1__value=>__required=>required__;typeID=>T7__type=>text__name=>ship_street_address2__class=>__title=>Address 2__value=>__;typeID=>T8__type=>text__name=>ship_city__class=>__title=>Town / City__value=>__required=>required__;typeID=>T9__type=>text__name=>ship_state__class=>__title=>County__value=>__required=>required__;typeID=>T10__type=>text__name=>ship_zip__class=>__title=>Postal Code__value=>__required=>required__;typeID=>T11__type=>select__name=>ship_country__class=>__title=>Country__value=>__required=>required__select_type=>countries2CO__select_data=>__select_text=>__select_value=>__;typeID=>T4__type=>endDiv__;||stepid=>s1__steporder=>2__steptitle=>billing address Show__|typeID=>T1__type=>check__name=>checkbox__class=>__title=>this is also my billing address__value=>1__;||stepid=>s2__steporder=>3__steptitle=>billing address__|typeID=>T10__type=>label__name=>sh_Baddress_label__class=>__title=>Billing Address__value=>__;typeID=>T1__type=>div__name=>sh_Baddress_div__class=>__;typeID=>T2__type=>text__name=>card_holder_name__class=>__title=>Full Name__value=>__required=>required__;typeID=>T3__type=>text__name=>street_address__class=>__title=>Address 1__value=>__required=>required__;typeID=>T4__type=>text__name=>street_address2__class=>__title=>Address 2__value=>__;typeID=>T5__type=>text__name=>city__class=>__title=>Town / City__value=>__required=>required__;typeID=>T6__type=>text__name=>state__class=>__title=>County__value=>__required=>required__;typeID=>T7__type=>text__name=>zip__class=>__title=>Postal Code__value=>__required=>required__;typeID=>T9__type=>select__name=>country__class=>__title=>Country__value=>__required=>required__select_type=>countries2CO__select_data=>__select_text=>__select_value=>__;typeID=>T8__type=>endDiv__;||stepid=>s1__steporder=>4__steptitle=>Contact Details__|typeID=>T6__type=>label__name=>sh_contect_label__class=>__title=>Contact Details__value=>__;typeID=>T1__type=>div__name=>sh_Contact_div__class=>__;typeID=>T2__type=>email__name=>email__class=>__title=>Email__value=>__required=>required__;typeID=>T3__type=>phone__name=>phone__class=>__title=>Phone__value=>__required=>required__;typeID=>T4__type=>endDiv__;typeID=>T8__type=>hidden__name=>order_status__class=>__value=>1__;typeID=>T5__type=>hidden__name=>demo__class=>__value=>Y__;typeID=>T9__type=>hidden__name=>currency__class=>__value=>@%session::currency%@__;typeID=>T7__type=>submit__name=>send__class=>mbutton __value=>Proceed to payment__;||', '', '2013-02-27 14:12:00', '2013-05-22 00:00:00', 0, 0, 1, 'Global Cart Setting', 4, '2', 1, 0, 0, 'empcland@gmail.com;azizms@gmail.com', '1'),
(11, '33', 0, 0, 'stepid=>s1__steporder=>1__steptitle=>Delivery Address__|typeID=>T1__type=>hidden__name=>site__class=>__value=>@%get::site%@__;typeID=>T3__type=>label__name=>sh_address_label__class=>__title=>Delivery Address__value=>__;typeID=>T2__type=>div__name=>sh_address_div__class=>__;typeID=>T5__type=>text__name=>ship_name__class=>__title=>Full Name__value=>__required=>required__;typeID=>T6__type=>text__name=>ship_street_address__class=>__title=>Address 1__value=>__required=>required__;typeID=>T7__type=>text__name=>ship_street_address2__class=>__title=>Address 2__value=>__;typeID=>T8__type=>text__name=>ship_city__class=>__title=>City__value=>__required=>required__;typeID=>T9__type=>select__name=>ship_state__class=>__title=>State__value=>__required=>required__select_type=>usstates__select_data=>__select_text=>__select_value=>__;typeID=>T10__type=>text__name=>ship_zip__class=>__title=>Zip__value=>__required=>required__;typeID=>T11__type=>hidden__name=>ship_country__class=>__value=>USA__;typeID=>T4__type=>endDiv__;||stepid=>s1__steporder=>2__steptitle=>billing address Show__|typeID=>T1__type=>check__name=>checkbox__class=>__title=>this is also my billing address__value=>1__;||stepid=>s2__steporder=>3__steptitle=>billing address__|typeID=>T1__type=>div__name=>sh_Baddress_div__class=>__;typeID=>T2__type=>text__name=>card_holder_name__class=>__title=>Full Name__value=>__required=>required__;typeID=>T3__type=>text__name=>street_address__class=>__title=>Address 1__value=>__required=>required__;typeID=>T4__type=>text__name=>street_address2__class=>__title=>Address 2__value=>__;typeID=>T5__type=>text__name=>city__class=>__title=>Town / City__value=>__required=>required__;typeID=>T6__type=>select__name=>state__class=>__title=>State__value=>__select_type=>usstates__select_data=>__select_text=>__select_value=>__;typeID=>T7__type=>text__name=>zip__class=>__title=>Zip__value=>__required=>required__;typeID=>T8__type=>endDiv__;typeID=>T9__type=>hidden__name=>country__class=>__value=>USA__;typeID=>T10__type=>label__name=>sh_Baddress_label__class=>__title=>Billing Address__value=>__;||stepid=>s1__steporder=>4__steptitle=>Contact Details__|typeID=>T6__type=>label__name=>sh_contect_label__class=>__title=>Contact Details__value=>__;typeID=>T1__type=>div__name=>sh_Contact_div__class=>__;typeID=>T2__type=>email__name=>email__class=>__title=>Email__value=>__required=>required__;typeID=>T3__type=>phone__name=>phone__class=>__title=>Phone__value=>__required=>required__;typeID=>T4__type=>endDiv__;typeID=>T8__type=>hidden__name=>order_status__class=>__value=>1__;typeID=>T5__type=>hidden__name=>demo__class=>__value=>Y__;typeID=>T9__type=>hidden__name=>currency__class=>__value=>@%session::currency%@__;typeID=>T7__type=>submit__name=>send__class=>mbutton__value=>Proceed to payment__;||', '', '2013-02-27 14:12:00', '2013-05-22 00:00:00', 0, 0, 1, 'USA Cart Setting', 3, '2', 1, 0, 0, 'empcland@gmail.com;azizms@gmail.com', '1'),
(9, '33', 0, 0, 'stepid=>s1__steporder=>1__steptitle=>Delivery Address__|typeID=>T1__type=>hidden__name=>site__class=>__value=>@%get::site%@__;typeID=>T3__type=>label__name=>sh_address_label__class=>__title=>Delivery Address__value=>__;typeID=>T2__type=>div__name=>sh_address_div__class=>sh_address_div__;typeID=>T5__type=>text__name=>ship_name__class=>__title=>Full Name__value=>__required=>required__;typeID=>T6__type=>text__name=>ship_street_address__class=>__title=>Address 1__value=>__required=>required__;typeID=>T7__type=>text__name=>ship_street_address2__class=>__title=>Address 2__value=>__;typeID=>T8__type=>text__name=>ship_city__class=>__title=>Town / City__value=>__required=>required__;typeID=>T9__type=>text__name=>ship_state__class=>__title=>County__value=>__required=>required__;typeID=>T10__type=>text__name=>ship_zip__class=>__title=>Postal Code__value=>__required=>required__;typeID=>T11__type=>hidden__name=>ship_country__class=>__value=>GBR__;typeID=>T4__type=>endDiv__;||stepid=>s1__steporder=>2__steptitle=>billing address Show__|typeID=>T1__type=>check__name=>checkbox__class=>__title=>this is also my billing address__value=>1__;||stepid=>s2__steporder=>3__steptitle=>billing address__|typeID=>T10__type=>label__name=>sh_Baddress_label__class=>__title=>Billing Address__value=>__;typeID=>T1__type=>div__name=>sh_Baddress_div__class=>sh_Baddress_div__;typeID=>T2__type=>text__name=>card_holder_name__class=>__title=>Full Name__value=>__required=>required__;typeID=>T3__type=>text__name=>street_address__class=>__title=>Address 1__value=>__required=>required__;typeID=>T4__type=>text__name=>street_address2__class=>__title=>Address 2__value=>__;typeID=>T5__type=>text__name=>city__class=>__title=>Town / City__value=>__required=>required__;typeID=>T6__type=>text__name=>state__class=>__title=>County__value=>__required=>required__;typeID=>T7__type=>text__name=>zip__class=>__title=>Postal Code__value=>__required=>required__;typeID=>T8__type=>endDiv__;typeID=>T9__type=>hidden__name=>country__class=>__value=>GBR__;||stepid=>s1__steporder=>4__steptitle=>Contact Details__|typeID=>T6__type=>label__name=>sh_contect_label__class=>__title=>Contact Details__value=>__;typeID=>T1__type=>div__name=>sh_Contact_div__class=>__;typeID=>T2__type=>email__name=>Email__class=>__title=>Email__value=>__required=>required__;typeID=>T3__type=>phone__name=>phone__class=>__title=>Phone__value=>__required=>required__;typeID=>T4__type=>endDiv__;typeID=>T5__type=>hidden__name=>order_status__class=>__value=>1__;typeID=>T8__type=>hidden__name=>demo__class=>__value=>Y__;typeID=>T9__type=>hidden__name=>currency__class=>__value=>@%session::currency%@__;typeID=>T7__type=>submit__name=>send__class=>mbotton__value=>Proceed to Payment__;||', '', '2013-02-27 14:12:00', '2013-05-22 00:00:00', 0, 0, 1, 'UK Cart Setting', 2, '2', 1, 0, 0, 'empcland@gmail.com;', '1'),
(10, '33', 0, 0, 'stepid=>s1__steporder=>1__steptitle=>Delivery Address__|typeID=>T1__type=>hidden__name=>site__class=>__value=>@%get::site%@__;typeID=>T3__type=>label__name=>sh_address_label__class=>__title=>Delivery Address__value=>__;typeID=>T2__type=>div__name=>sh_address_div__class=>__;typeID=>T5__type=>text__name=>ship_name__class=>__title=>Full Name__value=>__required=>required__;typeID=>T6__type=>text__name=>ship_street_address__class=>__title=>Address 1__value=>__required=>required__;typeID=>T7__type=>text__name=>ship_street_address2__class=>__title=>Address 2__value=>__;typeID=>T8__type=>select__name=>ship_city__class=>__title=>Emirate__value=>Dubai__required=>required__select_type=>data__select_data=>__select_text=>Dubai,Abu Dhabi,Sharjah,Ajman,Umm Al Quwain,Ras Al Khaimah,Fujairah__select_value=>Dubai,Abu Dhabi,Sharjah,Ajman,Umm Al Quwain,Ras Al Khaimah,Fujairah__;typeID=>T9__type=>hidden__name=>ship_state__class=>__value=>Emirates__;typeID=>T10__type=>text__name=>ship_zip__class=>__title=>P.O. Box__value=>__required=>required__;typeID=>T11__type=>hidden__name=>ship_country__class=>__value=>ARE__;typeID=>T4__type=>endDiv__;||stepid=>s1__steporder=>2__steptitle=>billing address Show__|typeID=>T1__type=>check__name=>checkbox__class=>__title=>this is also my billing address__value=>1__;||stepid=>s2__steporder=>3__steptitle=>billing address__|typeID=>T1__type=>div__name=>sh_Baddress_div__class=>__;typeID=>T2__type=>text__name=>card_holder_name__class=>__title=>Name__value=>__required=>required__;typeID=>T3__type=>text__name=>street_address__class=>__title=>Address 1__value=>__required=>required__;typeID=>T4__type=>text__name=>street_address2__class=>__title=>Address 2__value=>__;typeID=>T5__type=>select__name=>city__class=>__title=>Emirate__value=>eee2__required=>required__select_type=>data__select_data=>__select_text=>Dubai,Abu Dhabi,Sharjah,Ajman,Umm Al Quwain,Ras Al Khaimah,Fujairah__select_value=>Dubai,Abu Dhabi,Sharjah,Ajman,Umm Al Quwain,Ras Al Khaimah,Fujairah__;typeID=>T6__type=>hidden__name=>state__class=>__value=>Emirates__;typeID=>T7__type=>text__name=>zip__class=>__title=>P.O. Box__value=>__required=>required__;typeID=>T8__type=>endDiv__;typeID=>T9__type=>hidden__name=>country__class=>__value=>ARE__;typeID=>T10__type=>label__name=>sh_Baddress_label__class=>__title=>Billing Address__value=>__;||stepid=>s1__steporder=>4__steptitle=>Contact Details__|typeID=>T6__type=>label__name=>sh_contect_label__class=>__title=>Contact Details__value=>__;typeID=>T1__type=>div__name=>sh_Contact_div__class=>__;typeID=>T2__type=>email__name=>email__class=>__title=>Email__value=>__required=>required__;typeID=>T3__type=>phone__name=>phone__class=>__title=>Phone__value=>__required=>required__;typeID=>T4__type=>endDiv__;typeID=>T8__type=>hidden__name=>order_status__class=>__value=>1__;typeID=>T5__type=>hidden__name=>demo__class=>__value=>Y__;typeID=>T9__type=>hidden__name=>currency__class=>__value=>@%session::currency%@__;typeID=>T7__type=>submit__name=>send__class=>mbutton__value=>Proceed to payment__;||', '', '2013-02-27 14:12:00', '2013-05-22 00:00:00', 0, 0, 1, 'UAE Cart Setting', 1, '2', 1, 0, 0, 'empcland@gmail.com', '1');

-- --------------------------------------------------------

--
-- Table structure for table `com_products_xref`
--

CREATE TABLE IF NOT EXISTS `com_products_xref` (
`id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=83 ;

--
-- Dumping data for table `com_products_xref`
--

INSERT INTO `com_products_xref` (`id`, `item_id`, `cat_id`, `delete`, `order`, `enabled`, `modified`, `created`) VALUES
(82, 52, 32, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 65, 32, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 64, 32, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 63, 32, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 62, 32, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 56, 32, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 55, 32, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 54, 32, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 53, 32, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 68, 35, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 69, 35, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 70, 35, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 71, 35, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 72, 35, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 73, 35, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 74, 36, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `com_project`
--

CREATE TABLE IF NOT EXISTS `com_project` (
`id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `des` text NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `data` text NOT NULL,
  `item_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `video` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `th_image` varchar(255) NOT NULL,
  `creation_date` date NOT NULL,
  `alias` varchar(255) NOT NULL,
  `cat_id` text NOT NULL,
  `main_cat` int(11) NOT NULL,
  `req_donations` varchar(255) NOT NULL,
  `end_data` date NOT NULL,
  `map_position` text NOT NULL,
  `zoom` int(11) NOT NULL,
  `project_status` int(11) NOT NULL,
  `location2` text NOT NULL,
  `short_des` text NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `com_project`
--

INSERT INTO `com_project` (`id`, `title`, `des`, `modified`, `created`, `enabled`, `order`, `delete`, `data`, `item_id`, `image`, `video`, `location`, `th_image`, `creation_date`, `alias`, `cat_id`, `main_cat`, `req_donations`, `end_data`, `map_position`, `zoom`, `project_status`, `location2`, `short_des`) VALUES
(13, '4مشروع بناء مصنع حديث', '<p>منذ عام 2002، قدمت الجهات المانحة 252.310 مثلك 61789996 $ إلى 5،303 مشروعا. منذ عام 2002، قدمت الجهات المانحة 252.310 مثلك 61789996 $ إلى 5،303 مشروعا.</p>', '2014-03-30 08:40:31', '2014-01-06 13:04:09', 0, 1, 0, '', 0, '52d5472838f76.png', '', 'Assiut', '', '2014-02-17', '4مشروع-بناء-مصنع-حديث', ',1,7', 7, '1000', '2014-02-17', '', 0, 2, '-1', ''),
(14, '3مشروع بناء مصنع حديث', '<p>منذ عام 2002، قدمت الجهات المانحة 252.310 مثلك 61789996 $ إلى 5،303 مشروعا. منذ عام 2002، قدمت الجهات المانحة 252.310 مثلك 61789996 $ إلى 5،303 مشروعا.</p>', '2014-03-30 08:42:32', '2014-01-06 13:04:09', 0, 1, 0, '', 0, '52d5472838f76.png', '', '-1', '', '2014-01-15', '3مشروع-بناء-مصنع-حديث', ',5', 5, '15000', '2014-02-18', '', 0, 2, '-1', ''),
(15, 'تنوير الحيز', '<p>الحيز هي قرية صغيرة جنوب الواحات البحرية وتعاني من مشكلة عدم توافر مصدر للتيار الكهربائي. هذه المشكلة تؤثر بشكل كبير على سكان القرية حيث إنهم غير قادرين على الاستمتاع بأبسط وسائل الراحة مثل القدرة على تخزين الطعام القابل للتف في ثلاجات أو حتى إضاءة مصباح أثناء ساعات الليل. ولهذا فسيقوم مشروع تنوير الحيز بتوفير أنظمة طاقة شمسية ستقوم بتوليد الكهرباء طوال الـ 24 ساعة وسيقوم أيضاً بإنشاء صندوق ائتمانات لسكان الحيز لضمان توافر المال لصيانة المعدات.</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong>خلفية عن المكان</strong></p>\r\n<p>تقع قرية الحيز جنوب الواحات البحرية ويسكنها حوالي 3300 مواطن موزعين على 550 منزل. حياة سكان الحيز تكاد تكون بدائية وتتمحور أساساً حول الزراعة وتكمن مشكلتهم الأساسية في عدم توافر التيار الكهربائي مما يؤدي إلى صعوبات عديدة. من ضمن تلك الصعوبات عدم القدرة على تخزين الطعام والتي يترتب عليها صرف مبالغ كبيرة على المواصلات لشراء المستلزمات بشكل يومي من الواحات البحرية على بعد 40 كم. وعدم قدرة الطلبة على المذاكرة أثناء ساعات الليل بعد انتهائهم من عملهم الصباحي في الزراعة.</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong>كيف سيساعد المشروع؟</strong></p>\r\n<ul>\r\n<li>سيوفر المشروع للقرية أنظمة طاقة شمسية ستقوم بتوليد الكهرباء طوال الـ 24 ساعة.</li>\r\n<li>سيقوم المشروع بتمويل شراء الألواح الشمسية والبطاريات وجميع الأجهزة اللازمة.</li>\r\n<li>سيتم إنشاء صندوق ائتمانات لسكان الحيز لضمان توافر المال لصيانة المعدات.</li>\r\n<li>سيتم اختيار وتدريب بعض السكان على تركيب وتشغيل وصيانة أنظمة الطاقة الشمسية.</li>\r\n</ul>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong><img src="/uploads/images/tanweer-al-haiz-solar.jpg" alt="" width="670" height="447" /></strong></p>\r\n<p>&nbsp;</p>\r\n<p><strong>النتائج</strong></p>\r\n<ul>\r\n<li>توافر الكهرباء سيسمح بتخزين المأكولات القابلة للتلف في ثلاجات صغيرة سيقوم المشروع بتوفيرها للسكان مما سيقوم بتحسين مستويات الصحة والتغذية في القرية.</li>\r\n<li>لن يحتاج سكان القرية إلى التنقل كل يوم للواحات البحرية للحصول على احتياجاتهم الأساسية مما يعني انخفاض تكاليف التنقل ومعدلات استخدام الوقود.</li>\r\n<li>إمكانية استغلال ساعات الليل في المذاكرة بالنسبة للشباب (بعد اتمامهم مهام الزراعة أثناء النهار) مما سيرفع من مستويات التعليم في القرية</li>\r\n<li>خلق فرص عمل جديدة من خلال تدريب بعض السكان على تركيب وتشغيل وصيانة أنظمة الطاقة الشمسية.</li>\r\n<li>تحسن عام في جودة حياة سكان قرية الحيز نتيجة لوجود الكهرباء وقدرتهم على استخدام لمبات الإضاءة والمراوح والتلفزيونات.</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p><img src="/uploads/images/tanweer-al-haiz-night.jpg" alt="" width="670" height="447" /></p>', '2014-05-04 14:35:17', '2014-01-06 13:04:09', 1, 1, 0, '', 0, 'tanweer-al-haiz-thumb_1.jpg', 'https://www.youtube.com/watch?v=jYOcYH0097g', 'Giza', 'tanweer-al-haiz-video_1.jpg', '2014-04-01', 'تنوير-الحيز', ',4', 4, '370000', '2014-07-01', '(28.31828444558785, 28.799285888671875);', 5, 2, '', '<p>الحيز هي قرية صغيرة جنوب الواحات البحرية وتعاني من مشكلة عدم توافر مصدر للتيار الكهربائي بعمل المشروع على توفير أنظمة طاقة شمسية تقوم بتوليد الكهرباء طوال الـ 24 ساعة&nbsp;</p>'),
(19, 'مشروع بيت البركة', '<p>تقع&nbsp;عزبة الهجانة&nbsp;على الطرف الشرقي من مدينة نصروتعاني معظم مناطقها من نقص في العديد من الخدمات مثل المياه الصالحة للشرب والصرف الصحيوالكهرباء والمواصلات والخدمات الطبية والتعليمية. وأهم ما تعاني منه المنطقة هو افتقارها للتخطيط الحضري (أي منازل آمنة وصحية توفر قدر من الخصوصية) مما أنتج لسكان العزبة ظروف صحية سيئة وتدهور في البيئة العمرانية ومشاكل في المرور والتنقل الداخلي. ولهذا فإن مشروع بيت البركة سيساعد على تحسين البيئة المعيشية والمجتمعية لسكان عزبة الهجانة عن طريق توفير سيولة مالية للأسرة لبناء مسكن ملائم وآمن وصحي والعمل مع السكان على خلق بيئة محيطة صحية ونظيفة.</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong>خلفية عن المكان</strong></p>\r\n<p>تقع&nbsp;عزبة الهجانة&nbsp;على الطرف الشرقي من مدينة نصر، وهي منطقة عشوائية يستوطنها أكثر من مليون مواطن من صعيد مصر يعمل اغلبهم كعمال تراحيل وحرفيين معماريين بالإضافة إلى حرفيين اقاموا ورش تصليح سيارات في المنطقة. تعاني معظم مناطق عزبة الهجانة من نقص في العديد من الخدمات مثل المياه الصالحة للشرب والصرف الصحيوالكهرباء والمواصلات والخدمات الطبية والتعليمية بخلاف مشاكل البطالة والتسرب من التعليم والأمية. بالإضافة إلى ذلك يعاني سكان المنطقة من عدم وجود مساكن ملائمة لأبسط المعايير الإنسانية حيث عادة ما تسكن الأسرة المكونة من 6 أفراد في غرفة مبنية بطريقة بدائية وغير آمنة بمساحة 10 متر مربع وبالطبع مجرد التفكير في وجود مطبخ أو حمام يضمن الخصوصية في تلك المساكن قد يعتبر من الأحلام بعيدة المنال. افتقار المنطقة للتخطيط الحضري أنتج لسكان العزبة ظروف صحية سيئة وتدهور في البيئة العمرانية ومشاكل في المرور والتنقل الداخلي.</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong>كيف سيساعد المشروع؟</strong></p>\r\n<ul class="arrows">\r\n<li>مساعدة الأسر مادياً على بناء مسكن آمن وصحي.<br /> يتم اختيار الاسرة وفقا لمعايير محددة والتي تشمل قدرتها على سداد جزء من التكاليف وشرط تملك للأرض ووجود عداد مياه وكهرباء والاتصال بشبكة الصرف الصحي. وبعد ذلك يقوم المشروع بالمشاركة في التصميم المعماري للبناء ليحقق احتياجات الأسرة ويراعي المواصفات الهندسية الآمنة. ويوفر المشروع قروض حسنة لبناء البيت، على ان ترد الى المؤسسة من خلال أقساط شهرية يتم الاتفاق على مدتها وفقا لدخل الاسرة.</li>\r\n<li>إنشاء مركز ثقافى لنشر وتنمية الوعي بين سكان المنطقة</li>\r\n<li>رفع كفاءة السكان ومساعدتهم على الحصول على العمل من خلال توفير تدريب مهني على الحرف والصناعات المختلفة</li>\r\n</ul>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong>النتائج</strong></p>\r\n<ul class="arrows">\r\n<li>تحسن الوضع النفسي والصحي للأسرة عن طريق الحد من التعرض للمخاطر نتيجة سوء نوعية السكن&nbsp;&nbsp;</li>\r\n<li>تملك المسكن يؤدي لتعزيز الثقة بالنفس وزيادة الشعور بالأمن والاستقرار</li>\r\n<li>عودة الشعور بالأمل فمن كان عاطلاً أصبح يجتهد ليعمل لأنه يأمل في أن يبني لنفسه مسكن يستطيع الزواج وبناء حياة جديدة فيه</li>\r\n<li>زيادة الوعي الثقافي يؤدي إلى اهتمام افراد الاسرة بالتعليم وتحسن النتائج الدراسية للأطفال</li>\r\n<li>العلاقة بالمجتمع المحيط اكتسبت صفات جديدة مثل رفض المساعدات المالية الا عند الحاجة الشديدة، وزيادة الشعور بالكرامة وعزة النفس</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p><img src="/uploads/images/beet-al-baraka-house-plan.png" alt="" width="469" height="507" /></p>', '2014-05-06 07:27:08', '2014-03-09 10:23:24', 1, 5, 0, '', 0, 'beet-el-baraka-thumb.jpg', 'https://www.youtube.com/watch?v=jYOcYH0097g', 'Cairo', 'beet-el-baraka-large.jpg', '2014-04-02', 'مشروع-بيت-البركة', ',7', 7, '470000', '2014-04-08', '(30.096425136715325, 31.768341064453125);', 5, 2, '', '<p>تقع&nbsp;عزبة الهجانة&nbsp;على الطرف الشرقي من مدينة نصروتعاني معظم مناطقها من نقص في العديد من الخدمات مثل المياه الصالحة للشرب والصرف الصحيوالكهرباء والمواصلات والخدمات الطبية والتعليمية.&nbsp;</p>\r\n<p>&nbsp;</p>');

-- --------------------------------------------------------

--
-- Table structure for table `com_project_catgories`
--

CREATE TABLE IF NOT EXISTS `com_project_catgories` (
`id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `created` datetime NOT NULL,
  `order` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `des` text NOT NULL,
  `alias` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `com_project_catgories`
--

INSERT INTO `com_project_catgories` (`id`, `title`, `image`, `enabled`, `created`, `order`, `modified`, `delete`, `cat_id`, `des`, `alias`) VALUES
(1, 'الأطفال', '532f51168abca.png', 1, '2014-01-06 11:42:32', 1, '2014-03-23 15:24:38', 0, 0, '', 'Child'),
(2, 'test1 child', '', 1, '2014-01-12 08:46:23', 2, '0000-00-00 00:00:00', 1, 1, '', 'test1-child'),
(3, 'المرأة', '532f513800162.png', 1, '2014-01-06 11:42:32', 1, '2014-03-23 15:25:11', 0, 0, '', 'Women'),
(4, 'البيئة', '532f51591890d.png', 1, '2014-01-06 11:42:32', 1, '2014-03-23 15:25:45', 0, 0, '', 'Environment'),
(5, 'الصحة', '532f519804c8f.png', 1, '2014-01-06 11:42:32', 1, '2014-03-23 15:26:48', 0, 0, '', 'Health'),
(6, 'التعليم', '532f51e00c551.png', 1, '2014-01-06 11:42:32', 1, '2014-03-23 15:28:00', 0, 0, '', 'Education'),
(7, 'الفقر', '532f51d3f2448.png', 1, '2014-01-06 11:42:32', 1, '2014-03-23 15:27:47', 0, 0, '', 'Poverty');

-- --------------------------------------------------------

--
-- Table structure for table `com_project_catgories_xref`
--

CREATE TABLE IF NOT EXISTS `com_project_catgories_xref` (
`id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=335 ;

--
-- Dumping data for table `com_project_catgories_xref`
--

INSERT INTO `com_project_catgories_xref` (`id`, `item_id`, `cat_id`, `delete`, `order`, `enabled`, `modified`, `created`) VALUES
(7, 1, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 6, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 5, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 4, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 3, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 2, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 7, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 8, 3, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 14, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 13, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 12, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 11, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 10, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 8, 4, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 15, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(334, 16, 4, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(333, 16, 3, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(332, 16, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `com_project_setting`
--

CREATE TABLE IF NOT EXISTS `com_project_setting` (
`id` int(11) NOT NULL,
  `messages` varchar(250) NOT NULL,
  `cart` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `data` text NOT NULL,
  `select_update_value` text NOT NULL,
  `select_update_text` text NOT NULL,
  `select_don_value` text NOT NULL,
  `select_don_text` text NOT NULL,
  `select_date_value` text NOT NULL,
  `select_date_text` text NOT NULL,
  `commet_enabled` tinyint(4) NOT NULL,
  `commet_users` tinyint(4) NOT NULL,
  `commet_type` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `com_project_setting`
--

INSERT INTO `com_project_setting` (`id`, `messages`, `cart`, `modified`, `created`, `enabled`, `order`, `delete`, `data`, `select_update_value`, `select_update_text`, `select_don_value`, `select_don_text`, `select_date_value`, `select_date_text`, `commet_enabled`, `commet_users`, `commet_type`) VALUES
(1, ',215', 1, '2014-04-27 09:02:45', '0000-00-00 00:00:00', 0, 0, 0, '', ',a,b,c', ',a,b,c', ',0to25,25to50,50to75,75to100', ',من ٠ إلى ٢٥%,من ٢٥ إلى ٥٠٪,من ٥٠ إلى ٧٥٪,من ٧٥ الى ١٠٠%', ',30,90', ',خلال الشهر الحالي,خلال الثلاث أشهر الماضية', 1, 1, 'in');

-- --------------------------------------------------------

--
-- Table structure for table `com_project_status`
--

CREATE TABLE IF NOT EXISTS `com_project_status` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL DEFAULT '0',
  `pro_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `site` int(11) NOT NULL,
  `color` varchar(255) NOT NULL,
  `msg` varchar(255) NOT NULL,
  `view_msg` tinyint(4) NOT NULL,
  `view_des` tinyint(4) NOT NULL,
  `view_more` tinyint(4) NOT NULL,
  `view_don_bar` tinyint(4) NOT NULL,
  `view_overlayer` tinyint(4) NOT NULL,
  `overlayer_color` varchar(255) NOT NULL,
  `msg_hover` tinyint(4) NOT NULL,
  `view_more_text` varchar(255) NOT NULL,
  `show_reflection` tinyint(4) NOT NULL,
  `is_link` tinyint(4) NOT NULL,
  `show_main_cat` tinyint(4) NOT NULL,
  `usermsg` text NOT NULL,
  `bg_effect` varchar(255) NOT NULL,
  `view_loction` tinyint(4) NOT NULL,
  `view_title` tinyint(4) NOT NULL,
  `view_loction_hover` tinyint(4) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `com_project_status`
--

INSERT INTO `com_project_status` (`id`, `created`, `modified`, `enabled`, `order`, `delete`, `pro_id`, `title`, `site`, `color`, `msg`, `view_msg`, `view_des`, `view_more`, `view_don_bar`, `view_overlayer`, `overlayer_color`, `msg_hover`, `view_more_text`, `show_reflection`, `is_link`, `show_main_cat`, `usermsg`, `bg_effect`, `view_loction`, `view_title`, `view_loction_hover`) VALUES
(1, '2014-01-22 00:00:00', '2014-03-16 14:16:53', 1, 0, 0, 0, 'Coming Soon', 0, '', 'يأتي قريباً', 1, 0, 0, 0, 1, '0000ff', 0, ' ', 0, 0, 0, '<p>يأتي قريباً 2</p><p> </p><p> </p>', 'blur', 1, 1, 1),
(2, '2014-02-13 04:24:11', '2014-05-07 12:00:12', 1, 0, 0, 0, 'Running Project', 0, '', '<p>تابع المشروع</p>', 1, 1, 1, 1, 0, '', 1, 'المزيد +', 1, 1, 1, '', 'noeffet', 1, 1, 0),
(3, '2014-02-13 04:28:07', '2014-03-16 14:53:39', 1, 0, 0, 0, 'Successful Project', 0, '', '<p>تم تمويله بنجاح</p>', 0, 1, 1, 1, 1, '29ba6d', 0, 'تابع مراحل المشروع', 0, 1, 0, '', 'noeffet', 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `com_project_xref`
--

CREATE TABLE IF NOT EXISTS `com_project_xref` (
`id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=454 ;

--
-- Dumping data for table `com_project_xref`
--

INSERT INTO `com_project_xref` (`id`, `item_id`, `cat_id`, `delete`, `order`, `enabled`, `modified`, `created`) VALUES
(7, 1, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 6, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 5, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 4, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 3, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 2, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 7, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(363, 8, 4, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(409, 14, 5, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(405, 13, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(411, 12, 6, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(412, 11, 6, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(358, 10, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(362, 8, 3, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(452, 15, 4, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(334, 16, 4, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(333, 16, 3, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(332, 16, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(453, 19, 7, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(406, 13, 7, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `com_qery`
--

CREATE TABLE IF NOT EXISTS `com_qery` (
`id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `des` text NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `com_qrecycle_qoute`
--

CREATE TABLE IF NOT EXISTS `com_qrecycle_qoute` (
`id` int(11) NOT NULL,
  `user_id` text NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `contact_person` text NOT NULL,
  `fax_no` text NOT NULL,
  `billing_address` text NOT NULL,
  `name` varchar(255) NOT NULL,
  `map_address` text NOT NULL,
  `map_coordinates` varchar(255) NOT NULL,
  `dumpsters` varchar(255) NOT NULL,
  `concrete` varchar(255) NOT NULL,
  `mailing_address` varchar(255) NOT NULL,
  `dumpsterCost` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `com_qrecycle_setting`
--

CREATE TABLE IF NOT EXISTS `com_qrecycle_setting` (
`id` int(11) NOT NULL,
  `postion` text NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `concrete_dumpsters` text NOT NULL,
  `concretemsg` text NOT NULL,
  `hazardousmsg` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `des` text NOT NULL,
  `qoute_save` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `com_reservations`
--

CREATE TABLE IF NOT EXISTS `com_reservations` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `status` varchar(255) NOT NULL,
  `res_id` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `com_reservations`
--

INSERT INTO `com_reservations` (`id`, `created`, `modified`, `order`, `delete`, `enabled`, `status`, `res_id`) VALUES
(1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 0, '', ''),
(2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 0, '', ''),
(3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 1, '', ''),
(4, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 1, '', ''),
(5, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 1, '', ''),
(6, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 1, '', ''),
(7, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 1, '', ''),
(8, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 1, '', ''),
(9, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 1, '', ''),
(10, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 1, '', ''),
(11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 1, '', ''),
(12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 1, '', ''),
(13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 1, '', ''),
(14, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 1, '', ''),
(15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 1, '', ''),
(16, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 1, '', ''),
(17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 1, '', ''),
(18, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 1, '', ''),
(19, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 1, '', ''),
(20, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 1, '', ''),
(21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 1, '', ''),
(22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 1, '', ''),
(23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 1, '', ''),
(24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 1, '', ''),
(25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 1, '', ''),
(26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 1, '', ''),
(27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 1, '', ''),
(28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 1, '', ''),
(29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 1, '', ''),
(30, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 1, '', ''),
(31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 1, '', ''),
(32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 1, '', ''),
(33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, '', ''),
(34, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, '', ''),
(35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, '', ''),
(36, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, '', '35'),
(37, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, '', '36'),
(38, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, '', '37'),
(39, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, '', '38'),
(40, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, '', '39'),
(41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, '', '40'),
(42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, '', '41');

-- --------------------------------------------------------

--
-- Table structure for table `com_reservations_data`
--

CREATE TABLE IF NOT EXISTS `com_reservations_data` (
`id` int(11) NOT NULL,
  `checkin` date NOT NULL,
  `checkout` date NOT NULL,
  `Nights` int(11) NOT NULL,
  `arrival` varchar(20) NOT NULL,
  `arrival_am` varchar(20) NOT NULL,
  `departure` varchar(20) NOT NULL,
  `departure_am` varchar(20) NOT NULL,
  `carriernumber` varchar(255) NOT NULL,
  `carrierdetails` varchar(255) NOT NULL,
  `arrivalfrom` varchar(255) NOT NULL,
  `touroperator` varchar(255) NOT NULL,
  `emailadd` varchar(255) NOT NULL,
  `mobile_number` varchar(255) NOT NULL,
  `moreinfo` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `status` varchar(255) NOT NULL,
  `res_id` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `com_reservations_data`
--

INSERT INTO `com_reservations_data` (`id`, `checkin`, `checkout`, `Nights`, `arrival`, `arrival_am`, `departure`, `departure_am`, `carriernumber`, `carrierdetails`, `arrivalfrom`, `touroperator`, `emailadd`, `mobile_number`, `moreinfo`, `created`, `modified`, `order`, `delete`, `enabled`, `status`, `res_id`) VALUES
(1, '0000-00-00', '0000-00-00', 0, '', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, '', '35'),
(2, '0000-00-00', '0000-00-00', 0, '', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, '', '36'),
(3, '0000-00-00', '0000-00-00', 0, '', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, '', '37'),
(4, '0000-00-00', '0000-00-00', 0, '', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, '', '38'),
(5, '0000-00-00', '0000-00-00', 0, '', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, '', '39'),
(6, '0000-00-00', '0000-00-00', 0, '', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, '', '40'),
(7, '0000-00-00', '0000-00-00', 0, '', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, '', '41'),
(8, '0000-00-00', '0000-00-00', 0, '', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, '', '42');

-- --------------------------------------------------------

--
-- Table structure for table `com_reservations_gustes`
--

CREATE TABLE IF NOT EXISTS `com_reservations_gustes` (
`id` int(11) NOT NULL,
  `r_id` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `ejamaat` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `data_id` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `com_reservations_gustes`
--

INSERT INTO `com_reservations_gustes` (`id`, `r_id`, `type`, `ejamaat`, `name`, `age`, `gender`, `order`, `modified`, `created`, `enabled`, `delete`, `data_id`) VALUES
(1, '', '', '', '', 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0),
(2, '', '', '', '', 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0),
(3, '', '', '', '', 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0),
(4, '', '', '', '', 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0),
(5, '', '', '', '', 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0),
(6, '', '', '', '', 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0),
(7, '31', 'adult', '1111', '111111', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0),
(8, '31', 'adult', '222', '22222', 22, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0),
(9, '32', 'adult', '1111', '111111', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0),
(10, '32', 'adult', '222', '22222', 22, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0),
(11, '32', 'child', '33333', '333333', 3, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0),
(12, '32', 'child', '44444', '444444', 4, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0),
(13, '32', 'child', '55555', '5555', 5, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0),
(14, '32', 'infant', '66666', '6666', 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0),
(15, '32', 'infant', '7777', '7777', 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0),
(16, '33', 'adult', '1111', '111111', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0),
(17, '33', 'adult', '222', '22222', 22, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0),
(18, '33', 'child', '33333', '333333', 3, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0),
(19, '33', 'child', '44444', '444444', 4, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0),
(20, '33', 'child', '55555', '5555', 5, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0),
(21, '33', 'infant', '66666', '6666', 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0),
(22, '33', 'infant', '7777', '7777', 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `com_reservations_status`
--

CREATE TABLE IF NOT EXISTS `com_reservations_status` (
`id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cat_id` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `created` datetime NOT NULL,
  `order` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `des` text COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `com_site_setting`
--

CREATE TABLE IF NOT EXISTS `com_site_setting` (
`id` int(11) NOT NULL,
  `title` int(11) NOT NULL,
  `link_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `admin_mail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `site_meta` text COLLATE utf8_unicode_ci NOT NULL,
  `site_keywords` text COLLATE utf8_unicode_ci NOT NULL,
  `addto_headre` text COLLATE utf8_unicode_ci NOT NULL,
  `offline` tinyint(4) NOT NULL,
  `offline_message` text COLLATE utf8_unicode_ci NOT NULL,
  `offline_background` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `offline_morecss` text COLLATE utf8_unicode_ci NOT NULL,
  `admin_list_limit` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `com_site_status`
--

CREATE TABLE IF NOT EXISTS `com_site_status` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `des` text NOT NULL,
  `cat_id` int(11) NOT NULL,
  `currency_code` varchar(255) NOT NULL,
  `currency_symbol` varchar(255) NOT NULL,
  `cities` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `alias` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `com_site_status_xref`
--

CREATE TABLE IF NOT EXISTS `com_site_status_xref` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL DEFAULT '0',
  `item_id` int(11) NOT NULL,
  `cat_id` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `com_users`
--

CREATE TABLE IF NOT EXISTS `com_users` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `g_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `group` int(11) NOT NULL,
  `fb_id` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=204 ;

--
-- Dumping data for table `com_users`
--

INSERT INTO `com_users` (`id`, `name`, `email`, `created`, `modified`, `enabled`, `delete`, `order`, `password`, `g_id`, `user_name`, `phone`, `image`, `group`, `fb_id`) VALUES
(3, 'ismasil2', 'empcland@gmail.com', '2012-03-21 00:00:00', '2015-03-20 16:27:54', 1, 0, 0, 'f3b32717d5322d7ba7c505c230785468', 3, 'ismail', 'g', '52c03abbbd3a9.png', 0, ''),
(151, 'aa', 'a@aa.com', '2014-05-07 06:33:15', '0000-00-00 00:00:00', 1, 0, 0, '6512bd43d9caa6e02c990b0a82652dca', 4, '', NULL, '1399465995_', 0, ''),
(150, 'aaaa', 'aa@aaaaa.com', '2014-05-07 06:32:08', '0000-00-00 00:00:00', 1, 0, 0, '698d51a19d8a121ce581499d7b701668', 4, '', NULL, '1399465928_', 0, ''),
(148, 'chekjjout', 'empcland@gjjjjmail.com', '2014-05-07 06:28:07', '0000-00-00 00:00:00', 1, 0, 0, '6512bd43d9caa6e02c990b0a82652dca', 4, '', NULL, '1399465687_', 0, ''),
(149, 'chekout', 'empclanggggd@gmail.com', '2014-05-07 06:30:49', '0000-00-00 00:00:00', 1, 0, 0, 'ba248c985ace94863880921d8900c53f', 4, '', NULL, '1399465849_', 0, ''),
(140, 'Amr Al Showhady', 'empcland@gmail.com', '2014-05-07 04:57:15', '0000-00-00 00:00:00', 0, 0, 0, 'VDdu20Ju', 4, 'amr.showhady', NULL, NULL, 0, '690193676'),
(147, 'chekout', 'ismai@sdfd11f.coml', '2014-05-07 06:25:54', '0000-00-00 00:00:00', 1, 0, 0, '6512bd43d9caa6e02c990b0a82652dca', 4, '', NULL, '1399465554_', 0, ''),
(146, 'chekout', 'emp77pp7777cland@gmail.com', '2014-05-07 06:13:11', '0000-00-00 00:00:00', 1, 0, 0, 'c483f6ce851c9ecd9fb835ff7551737c', 4, '', NULL, '1399464791_', 0, ''),
(144, '11536dfgdfg', 'empclafffffffnd@gmail.com', '2014-05-07 06:02:24', '0000-00-00 00:00:00', 1, 0, 0, '6512bd43d9caa6e02c990b0a82652dca', 4, '', NULL, '1399464144_', 0, ''),
(145, 'chekout', 'emp2222cland@gmail.com', '2014-05-07 06:07:03', '0000-00-00 00:00:00', 1, 0, 0, '934b535800b1cba8f96a5d72f72f1611', 4, '', NULL, '1399464423_', 0, ''),
(152, 'Aziz Mv', 'amztelcom@yahoo.com', '2014-05-07 06:34:35', '0000-00-00 00:00:00', 0, 0, 0, 'if62xcAn', 1, 'aziz.mv.9', NULL, NULL, 0, '100000467417166'),
(161, '', 'pratapgarhjamaat@gmail.com', '2014-06-03 17:10:30', '2015-03-20 12:42:02', 1, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(160, '', 'azizms@gmail.com', '0000-00-00 00:00:00', '2015-03-20 17:58:07', 1, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(162, '', 'mustafawadia@hotmail.com', '0000-00-00 00:00:00', '2015-03-20 13:32:15', 0, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(163, '', 'azizms@gmail.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(164, '', 'salehahh@gmail.com', '2014-06-29 06:56:16', '2014-06-29 06:57:55', 1, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(165, '', 'tid_88@hotmail.com', '2014-07-22 14:29:30', '2015-03-20 14:41:09', 1, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(166, '', 'ekbal63@gmail.com', '2014-07-23 16:32:01', '0000-00-00 00:00:00', 1, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(167, '', 'abbas.s.husain@gmail.com', '2014-07-23 16:34:12', '2015-03-20 13:50:52', 1, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(168, '', 'mshakirvasi@gmail.com', '2014-07-23 20:13:57', '2015-03-20 13:50:03', 1, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(169, '', 'azizms@gmail.com', '2014-07-23 20:20:03', '2014-07-25 06:05:37', 1, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(170, '', 'aqhamidi@gmail.com', '2014-07-24 16:34:47', '2014-07-24 16:37:29', 1, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(171, '', 'saifee.tarwala@gmail.com', '2014-07-25 05:39:47', '2015-03-20 13:50:26', 1, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(172, '', 'safdiwan@yahoo.com', '2014-07-25 05:52:34', '0000-00-00 00:00:00', 1, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(173, '', 'mustafa.batul@yahoo.com', '2014-07-31 18:57:44', '2014-08-01 21:55:14', 1, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(174, '', 'zoher@emirates.net.ae', '2014-07-31 18:58:48', '0000-00-00 00:00:00', 1, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(175, '', 'raju522000@yahoo.com', '2014-07-31 18:59:06', '0000-00-00 00:00:00', 1, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(176, '', 'alijawadubai@gmail.com', '2014-08-16 09:45:22', '2015-03-20 13:50:40', 1, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(177, '', 'mnasikwala2002@yahoo.com', '2014-08-16 09:46:52', '2015-03-20 13:50:47', 1, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(178, '', 'mufaddalshehabi@gmail.com', '2014-08-18 05:56:58', '2014-08-18 08:52:41', 1, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(179, '', 'murtaza.shehabi@gmail.com', '2014-08-18 06:00:27', '2014-08-18 06:36:08', 1, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(180, '', 'mustafaqasim@gmail.com', '2014-08-18 06:53:59', '2014-08-18 06:59:11', 0, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(181, '', 'mustafaqasim@gmail.com', '2014-08-18 06:56:18', '0000-00-00 00:00:00', 0, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(182, '', 'mustafaqasim@gmail.com', '2014-08-18 06:56:27', '0000-00-00 00:00:00', 1, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(183, '', 'hussainvajihi@gmail.com', '2014-08-19 05:35:15', '2014-08-19 05:35:57', 1, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(184, '', 'qusaih@hotmail.com', '2014-08-19 05:36:12', '0000-00-00 00:00:00', 1, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(185, '', 'ummehani.vajihi@gmail.com', '2014-08-19 05:36:46', '0000-00-00 00:00:00', 1, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(186, '', 'alijawadubai@gmail.com', '2015-03-20 13:50:59', '2015-03-20 17:16:40', 0, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(187, '', 'huzefa67@gmail.com', '2015-03-20 14:39:58', '0000-00-00 00:00:00', 0, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(188, '', 'munira.burhani@yahoo.com', '2015-03-20 14:41:27', '0000-00-00 00:00:00', 0, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(189, '', NULL, '2015-03-20 14:42:07', '2015-03-20 15:53:42', 0, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(190, '', 'shabbarghadiyali@gmail.com', '2015-03-20 14:52:47', '0000-00-00 00:00:00', 0, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(191, '', NULL, '2015-03-20 14:55:37', '0000-00-00 00:00:00', 0, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(192, '', 'lamtista@gmail.com', '2015-03-20 15:57:02', '0000-00-00 00:00:00', 0, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(193, '', 'sarrahsaasa@gmail.com', '2015-03-20 16:58:18', '0000-00-00 00:00:00', 0, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(194, '', 'shabbir@gficg.com', '2015-03-20 16:58:43', '2015-03-20 17:49:15', 0, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(195, '', 'shabbarm@gmail.com', '2015-03-20 17:04:50', '0000-00-00 00:00:00', 0, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(196, '', 'husainsfabbas@gmail.com', '2015-03-20 17:06:59', '0000-00-00 00:00:00', 0, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(197, '', 'aazain@hotmail.com', '2015-03-20 17:08:38', '2015-03-20 17:12:08', 1, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(198, '', 'ayc786@emirates.net.ae', '2015-03-20 17:11:07', '0000-00-00 00:00:00', 1, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(199, '', 'mohammad.mukadam@gmail.com', '2015-03-20 17:14:28', '0000-00-00 00:00:00', 1, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(200, '', 'anjumanekalimi@gmai.com', '2015-03-20 17:14:47', '0000-00-00 00:00:00', 1, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(201, '', 'almubaraktools@gmail.com', '2015-03-20 17:17:09', '2015-03-20 17:17:27', 1, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(202, '', 'moiz26@hotmail.com', '2015-03-20 17:17:34', '0000-00-00 00:00:00', 1, 0, 0, NULL, 0, '', NULL, NULL, 0, ''),
(203, '', NULL, '2015-03-29 17:52:54', '0000-00-00 00:00:00', 1, 0, 0, NULL, 0, '', NULL, NULL, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `com_users_fiz`
--

CREATE TABLE IF NOT EXISTS `com_users_fiz` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `group` int(11) NOT NULL,
  `fb_id` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `mobile_confirm` tinyint(4) NOT NULL,
  `mobile_confirm_code` text NOT NULL,
  `Mumin_id` varchar(50) NOT NULL,
  `FullName` varchar(250) NOT NULL,
  `First_name` varchar(50) NOT NULL,
  `Middle_Prefix` varchar(50) NOT NULL,
  `Middle_Name` varchar(250) NOT NULL,
  `Surname` varchar(250) NOT NULL,
  `Age` varchar(10) NOT NULL,
  `MOBILE_NO` varchar(50) NOT NULL,
  `Age1` varchar(50) NOT NULL,
  `Jamaat` varchar(250) NOT NULL,
  `Jamiaat` varchar(250) NOT NULL,
  `dob` varchar(50) NOT NULL,
  `prefix` varchar(250) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=204 ;

--
-- Dumping data for table `com_users_fiz`
--

INSERT INTO `com_users_fiz` (`id`, `created`, `modified`, `enabled`, `delete`, `order`, `phone`, `image`, `group`, `fb_id`, `mobile`, `city`, `area`, `country`, `gender`, `mobile_confirm`, `mobile_confirm_code`, `Mumin_id`, `FullName`, `First_name`, `Middle_Prefix`, `Middle_Name`, `Surname`, `Age`, `MOBILE_NO`, `Age1`, `Jamaat`, `Jamiaat`, `dob`, `prefix`, `user_id`) VALUES
(3, '2012-03-21 00:00:00', '2015-03-20 16:27:54', 1, 0, 0, 'g', '52c03abbbd3a9.png', 0, '', '01010666917', '', '', '', '', 1, '19858', '', '', '', '', '', '', '', '', '', '', '', '', '0', 0),
(151, '2014-05-07 06:33:15', '0000-00-00 00:00:00', 1, 0, 0, NULL, '1399465995_', 0, '', '', '', '', '', 'male', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '0', 0),
(150, '2014-05-07 06:32:08', '0000-00-00 00:00:00', 1, 0, 0, NULL, '1399465928_', 0, '', '', '', '', '', 'female', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '0', 0),
(148, '2014-05-07 06:28:07', '0000-00-00 00:00:00', 1, 0, 0, NULL, '1399465687_', 0, '', '', '', '', '', 'male', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '0', 0),
(149, '2014-05-07 06:30:49', '0000-00-00 00:00:00', 1, 0, 0, NULL, '1399465849_', 0, '', '01010666918', '', '', '', 'male', 1, '89300', '', '', '', '', '', '', '', '', '', '', '', '', '0', 0),
(140, '2014-05-07 04:57:15', '0000-00-00 00:00:00', 0, 0, 0, NULL, NULL, 0, '690193676', '', '', '', '', 'male', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '0', 0),
(147, '2014-05-07 06:25:54', '0000-00-00 00:00:00', 1, 0, 0, NULL, '1399465554_', 0, '', '', '', '', '', 'male', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '0', 0),
(146, '2014-05-07 06:13:11', '0000-00-00 00:00:00', 1, 0, 0, NULL, '1399464791_', 0, '', '', '', '', '', 'male', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '0', 0),
(144, '2014-05-07 06:02:24', '0000-00-00 00:00:00', 1, 0, 0, NULL, '1399464144_', 0, '', '', '', '', '', 'male', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '0', 0),
(145, '2014-05-07 06:07:03', '0000-00-00 00:00:00', 1, 0, 0, NULL, '1399464423_', 0, '', '', '', '', '', 'male', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '0', 0),
(152, '2014-05-07 06:34:35', '0000-00-00 00:00:00', 0, 0, 0, NULL, NULL, 0, '100000467417166', '01222489051', '', '', '', 'male', 1, '78463', '', '', '', '', '', '', '', '', '', '', '', '', '0', 0),
(161, '2014-06-03 17:10:30', '2015-03-20 12:42:02', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30385155', 'Zainab bai Shaikh Hatim bhai Ghotawala', 'Zainab', 'Shaikh ', 'Hatim ', 'Ghotawala', '62', '918696160606', '62', 'Partabgarh_Jamaat', 'Rampura', '06 May 1952 ', '0', 0),
(160, '0000-00-00 00:00:00', '2015-03-20 17:58:07', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '30385154', 'Mulla Aziz bhai Shaikh Mohammed bhai Shakir ( vasi )', 'Aziz', 'Shaikh', 'Mohammed', 'Shakir ( vasi )', '32', '201222489051', '32', 'Cairo_Jamaat', 'Al-Khaleej', '23 Aug 1982 ', 'Mulla', 160),
(162, '0000-00-00 00:00:00', '2015-03-20 13:32:15', 0, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '30355789', 'Taha bhai  Mustafa bhai Wadia', 'Taha', '', 'Mustafa', 'Wadia', '18', '+201228799330', '18', 'Cairo_Jamaat', 'Al-Khaleej', '30 Sep 1996 ', '0', 0),
(163, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '30355993', 'Mufaddal bhai Mulla Aziz bhai Shakir ( vasi )', 'Mufaddal', 'Mulla', 'Aziz', 'Shakir ( vasi )', '4', '+20122489051', '4', 'Cairo_Jamaat', 'Al-Khaleej', '31 Aug 2009 ', '0', 0),
(164, '2014-06-29 06:56:16', '2014-06-29 06:57:55', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '78652180', 'Saleh bs Abilfazal bs Husami', 'Saleh', 'Shaikh', 'Abilfazal', 'Husami', '31', '', '31', 'Qa_Jamaat', 'Mumbai', '02 Jan 1983 ', '0', 0),
(165, '2014-07-22 14:29:30', '2015-03-20 14:41:09', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30385152', 'Tasneem bai  Moiz bhai Motiwala', 'Tasneem', ' ', 'Moiz ', 'Motiwala', '26', '+971503845472', '26', 'Dubai_Jamaat', 'Al-Khaleej', '08 Apr 1988 ', '0', 0),
(166, '2014-07-23 16:32:01', '0000-00-00 00:00:00', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30385153', 'Farida bai  Mustafa bhai Dalal', 'Farida', ' ', 'Mustafa ', 'Dalal', '47', '+971507650681', '47', 'Dubai_Jamaat', 'Al-Khaleej', '11 Jan 1967 ', '0', 0),
(167, '2014-07-23 16:34:12', '2015-03-20 13:50:52', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '30385150', 'Abbas bhai Shaikh Shabbirhusain bhai Sadriwala', 'Abbas', 'Shaikh', 'Shabbirhusain', 'Sadriwala', '28', '+971503504786', '28', 'Dubai_Jamaat', 'Al-Khaleej', '27 Oct 1986 ', '0', 0),
(168, '2014-07-23 20:13:57', '2015-03-20 13:50:03', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '20322202', 'Shaikh Mohammed bhai  Abid bhai Shakir ( vasi )', 'Mohammed', '', 'Abid', 'Shakir ( vasi )', '69', '+971506761525', '69', 'Dubai_Jamaat', 'Al-Khaleej', '07 Aug 1945 ', 'Shaikh', 0),
(169, '2014-07-23 20:20:03', '2014-07-25 06:05:37', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30387405', 'Mulla Rashida bai  Rashida bhai Shakir ( vasi )', 'Rashida', ' ', ' ', 'Shakir ( vasi )', '62', '+971503557882', '62', 'Dubai_Jamaat', 'Al-Khaleej', '08 Jun 1952 ', 'Mulla', 0),
(170, '2014-07-24 16:34:47', '2014-07-24 16:37:29', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '30385151', 'Mulla Abdulqadir bhai Shaikh Juzer bhai Hamidi', 'Abdulqadir', 'Shaikh', 'Juzer', 'Hamidi', '27', '+971551287652', '27', 'Dubai_Jamaat', 'Al-Khaleej', '14 Apr 1987 ', 'Mulla', 0),
(171, '2014-07-25 05:39:47', '2015-03-20 13:50:26', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '20322201', 'Saifuddin bhai  Mansoor bhai Tarwala', 'Saifuddin', '', 'Mansoor', 'Tarwala', '40', '+919377718873', '40', 'Jeddah_Jamaat', 'Al-Khaleej', '03 Sep 1974 ', '', 0),
(172, '2014-07-25 05:52:34', '0000-00-00 00:00:00', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '20322203', 'Saifuddin bhai  Asgarali bhai Diwan', 'Saifuddin', '', 'Asgarali', 'Diwan', '41', '', '41', 'Dubai_Jamaat', 'Al-Khaleej', '19 Sep 1972 ', '', 0),
(173, '2014-07-31 18:57:44', '2014-08-01 21:55:14', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '20322205', 'Mustafa bhai  Abbas bhai Hydrabad wala', 'Mustafa', '', 'Abbas', 'Hydrabad wala', '37', '+971506502095', '37', 'Dubai_Jamaat', 'Al-Khaleej', '10 Jul 1977 ', '', 0),
(174, '2014-07-31 18:58:48', '0000-00-00 00:00:00', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '20322206', 'Zohair bhai  Shiraz bhai Lokhandwala', 'Zohair', '', 'Shiraz', 'Lokhandwala', '67', '+971504581406', '67', 'Dubai_Hakimi', 'Al-Khaleej', '11 Apr 1947 ', '', 0),
(175, '2014-07-31 18:59:06', '0000-00-00 00:00:00', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '20322208', 'Mulla Abbas bhai  Yusuf bhai Hamid', 'Abbas', '', 'Yusuf', 'Hamid', '68', '+971506760251', '68', 'Dubai_Jamaat', 'Al-Khaleej', '14 Jun 1946 ', 'Mulla', 0),
(176, '2014-08-16 09:45:22', '2015-03-20 13:50:40', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30385156', 'Munira bai Shaikh Aliasgar bhai Jawadwala', 'Munira', 'Shaikh ', 'Aliasgar ', 'Jawadwala', '42', '+971506539150', '42', 'Dubai_Jamaat', 'Al-Khaleej', '25 Apr 1972 ', '', 0),
(177, '2014-08-16 09:46:52', '2015-03-20 13:50:47', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '30385158', 'Burhanuddin bhai Mulla Mustafa bhai Nasikwala', 'Burhanuddin', 'Mulla', 'Mustafa', 'Nasikwala', '14', '+971501914082', '14', 'Dubai_Jamaat', 'Al-Khaleej', '01 Aug 2000 ', '', 0),
(178, '2014-08-18 05:56:58', '2014-08-18 08:52:41', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '30355522', 'Mufaddal bhai Shaikh Ilyas bhai Shehabi', 'Mufaddal', 'Shaikh', 'Ilyas', 'Shehabi', '27', '+201224211510', '27', 'Cairo_Jamaat', 'Al-Khaleej', '10 May 1987 ', '', 0),
(179, '2014-08-18 06:00:27', '2014-08-18 06:36:08', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '30355523', 'Murtaza bhai Shaikh Ilyas bhai Shehabi', 'Murtaza', 'Shaikh', 'Ilyas', 'Shehabi', '22', '+201225285192', '22', 'Cairo_Jamaat', 'Al-Khaleej', '07 May 1992 ', '', 0),
(180, '2014-08-18 06:53:59', '2014-08-18 06:59:11', 0, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '30355786', 'Huzaifa bhai Shaikh Mustafa bhai Kasimji', 'Huzaifa', 'Shaikh', 'Mustafa', 'Kasimji', '18', '+201222148734', '18', 'Cairo_Jamaat', 'Al-Khaleej', '06 Dec 1995 ', '', 0),
(181, '2014-08-18 06:56:18', '0000-00-00 00:00:00', 0, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30355785', 'Fatema bai Shaikh Mustafa bhai Kasimji', 'Fatema', 'Shaikh', 'Mustafa', 'Kasimji', '20', '+201222148734', '20', 'Cairo_Jamaat', 'Al-Khaleej', '30 Jan 1994 ', '', 0),
(182, '2014-08-18 06:56:27', '0000-00-00 00:00:00', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30355784', 'Tasneem bai Shaikh Mustafa bhai Kasimji', 'Tasneem', 'Shaikh ', 'Mustafa ', 'Kasimji', '43', '+201222148734', '43', 'Cairo_Jamaat', 'Al-Khaleej', '20 Jul 1971 ', '', 0),
(183, '2014-08-19 05:35:15', '2014-08-19 05:35:57', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '30355667', 'Husain bhai Shaikh Shabbir bhai Vajihi', 'Husain', 'Shaikh', 'Shabbir', 'Vajihi', '26', '+201224261370', '26', 'Cairo_Jamaat', 'Al-Khaleej', '02 Nov 1987 ', '', 0),
(184, '2014-08-19 05:36:12', '0000-00-00 00:00:00', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30355669', 'Khadija bai Mulla Qusai bhai Hamidi (sunelwala)', 'Khadija', 'Mulla ', 'Qusai ', 'Hamidi (sunelwala)', '30', '+919167855766', '30', 'Dubai_Jamaat', 'Al-Khaleej', '11 Feb 1984 ', '', 0),
(185, '2014-08-19 05:36:46', '0000-00-00 00:00:00', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30355670', 'Ummehani bai Shaikh Shabbir bhai Vajihi', 'Ummehani', 'Shaikh', 'Shabbir', 'Vajihi', '21', '+201094521952', '21', 'Cairo_Jamaat', 'Al-Khaleej', '07 Dec 1992 ', '', 0),
(186, '2015-03-20 13:50:59', '2015-03-20 17:16:40', 0, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '30385160', 'Mustaali bhai Shaikh Aliasgar bhai Jawadwala', 'Mustaali', 'Shaikh', 'Aliasgar', 'Jawadwala', '18', '918238710669', '18', 'Surat_Jamea', 'Surat', '28 Sep 1996 ', '', 0),
(187, '2015-03-20 14:39:58', '0000-00-00 00:00:00', 0, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30385052', 'Fatema bai Mulla Zohair bhai Jawadwala', 'Fatema', 'Mulla', 'Zohair', 'Jawadwala', '12', '+971507780051', '12', 'Dubai_Jamaat', 'Al-Khaleej', '06 May 2002 ', '', 0),
(188, '2015-03-20 14:41:27', '0000-00-00 00:00:00', 0, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30375452', 'Tasneem bai  Qaidjohar bhai Burhani', 'Tasneem', ' ', 'Qaidjohar ', 'Burhani', '51', '+919850698887', '51', 'Pune_Burhani', 'Pune', '03 Oct 1963 ', '', 0),
(189, '2015-03-20 14:42:07', '2015-03-20 15:53:42', 0, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30375252', 'Zahra bai  Taher bhai Gheewala', 'Zahra', '', 'Fidahusain', 'Gheewala', '90', '', '90', 'Pune_Burhani', 'Pune', '23 Feb 1925 ', '', 0),
(190, '2015-03-20 14:52:47', '0000-00-00 00:00:00', 0, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '20321208', 'Rashida bai  Abidali bhai Ghadiyali', 'Rashida', ' ', 'Abidali ', 'Ghadiyali', '50', '+919928279269', '50', 'Banswara_Badri', 'Taherabad', '17 Aug 1964 ', '', 0),
(191, '2015-03-20 14:55:37', '0000-00-00 00:00:00', 0, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30315167', 'Nafisa bai  Hatim bhai Tajani', 'Nafisa', ' ', 'Hatim ', 'Tajani', '51', '+919664907864', '51', 'Bombay_Hashemi', 'Mumbai', '15 Sep 1963 ', '', 0),
(192, '2015-03-20 15:57:02', '0000-00-00 00:00:00', 0, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '30385161', 'Lamak bhai Shaikh Aliasgar bhai Jawadwala', 'Lamak', 'Shaikh', 'Aliasgar', 'Jawadwala', '20', '+971551878633', '20', 'Dubai_Jamaat', 'Al-Khaleej', '21 May 1994 ', '', 0),
(193, '2015-03-20 16:58:18', '0000-00-00 00:00:00', 0, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30387160', 'Sarrah bai Shaikh Mustafa bhai Saasa', 'Sarrah', 'Shaikh', 'Mustafa', 'Saasa', '19', '+971508579566', '19', 'Dubai_Jamaat', 'Al-Khaleej', '11 Nov 1995 ', '', 0),
(194, '2015-03-20 16:58:43', '2015-03-20 17:49:15', 0, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30385760', 'Rashida bai  Shabbirali bhai Lokhandwala', 'Rashida', ' ', 'Shabbirali ', 'Lokhandwala', '35', '+971506881869', '35', 'Dubai_Jamaat', 'Al-Khaleej', '08 Nov 1979 ', '', 0),
(195, '2015-03-20 17:04:50', '0000-00-00 00:00:00', 0, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30385177', 'Rashida bai  Shabbar bhai Mala', 'Rashida', ' ', 'Shabbar ', 'Mala', '44', '+971506500850', '44', 'Dubai_Hakimi', 'Al-Khaleej', '14 Dec 1970 ', '', 0),
(196, '2015-03-20 17:06:59', '0000-00-00 00:00:00', 0, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '30385192', 'Husain bhai Mulla Shabbir bhai Adenwala', 'Husain', 'Mulla', 'Shabbir', 'Adenwala', '33', '+971554525335', '33', 'Dubai_Jamaat', 'Al-Khaleej', '18 Jun 1981 ', '', 0),
(197, '2015-03-20 17:08:38', '2015-03-20 17:12:08', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30385195', 'Bilqis bai Shaikh Zainuddin bhai Shujaei', 'Bilqis', 'Shaikh ', 'Zainuddin ', 'Shujaei', '64', '+971501892597', '64', 'Dubai_Jamaat', 'Al-Khaleej', '24 Apr 1950 ', '', 0),
(198, '2015-03-20 17:11:07', '0000-00-00 00:00:00', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30385143', 'Maimuna bai  Yusuf bhai Contractor', 'Maimuna', '', 'Hasan', 'Contractor', '85', '+971508778010', '85', 'Houston_Jamaat', 'USA', '15 Mar 1930 ', '', 0),
(199, '2015-03-20 17:14:28', '0000-00-00 00:00:00', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '30384160', 'Mohammed bhai Shaikh Zohair bhai Mukadam', 'Mohammed', 'Shaikh', 'Zohair', 'Mukadam', '17', '+917767845753', '17', 'Abudhabi_Jamaat', 'Al-Khaleej', '12 Apr 1997 ', '', 0),
(200, '2015-03-20 17:14:47', '0000-00-00 00:00:00', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '30383160', 'Aziz bhai  Shabbir bhai Bootwala', 'Aziz', '', 'Shabbir', 'Bootwala', '18', '', '18', 'Ratlam_Burhani', 'Ujjain', '16 Aug 1996 ', '', 0),
(201, '2015-03-20 17:17:09', '2015-03-20 17:17:27', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'F', 0, '', '30385197', 'Rashida bai Shaikh Juzer bhai Berberawala', 'Rashida', 'Shaikh ', 'Juzer ', 'Berberawala', '59', '+971504224148', '59', 'Dubai_Jamaat', 'Al-Khaleej', '19 Apr 1955 ', '', 0),
(202, '2015-03-20 17:17:34', '0000-00-00 00:00:00', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', 'M', 0, '', '30385198', 'Moiz bhai  Shabbir bhai Doodhwala', 'Moiz', '', 'Shabbir', 'Doodhwala', '32', '+447948289929', '32', 'Manchester_Jamaat', 'UK', '14 Apr 1982 ', '', 0),
(203, '2015-03-29 17:52:54', '0000-00-00 00:00:00', 1, 0, 0, NULL, NULL, 0, '', '', '', '', '', '', 0, '', '160', '16dasdasd0', '', '', '', '', '', '', '', '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `com_users_groups`
--

CREATE TABLE IF NOT EXISTS `com_users_groups` (
`id` int(11) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `leve` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinytext NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `def` tinyint(4) NOT NULL,
  `admin` tinyint(4) NOT NULL,
  `isadmin` tinyint(4) NOT NULL,
  `canadd` tinyint(4) NOT NULL,
  `canedit` tinyint(4) NOT NULL,
  `candelete` tinyint(4) NOT NULL,
  `components` text NOT NULL,
  `can_update_users` tinyint(4) NOT NULL,
  `can_management_components` tinyint(4) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `com_users_groups`
--

INSERT INTO `com_users_groups` (`id`, `group_name`, `leve`, `modified`, `created`, `enabled`, `delete`, `order`, `def`, `admin`, `isadmin`, `canadd`, `canedit`, `candelete`, `components`, `can_update_users`, `can_management_components`) VALUES
(3, 'admin', 4, '2015-04-01 12:53:19', '2012-03-26 00:00:00', '1', 0, 1, 0, 1, 1, 1, 1, 1, ',47,49,52,53,79,65,67,69,70,71,74,75,76,87,81,82,83,84,85,86,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,110,111,112,113,114,115,116,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136', 1, 1),
(4, 'user', 0, '0000-00-00 00:00:00', '2012-07-09 00:00:00', '1', 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `com_users_groups_xref`
--

CREATE TABLE IF NOT EXISTS `com_users_groups_xref` (
`id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2116 ;

--
-- Dumping data for table `com_users_groups_xref`
--

INSERT INTO `com_users_groups_xref` (`id`, `item_id`, `cat_id`, `delete`, `order`, `enabled`, `modified`, `created`) VALUES
(2113, 3, 134, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2112, 3, 133, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2111, 3, 132, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2110, 3, 131, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2109, 3, 130, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2108, 3, 129, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2107, 3, 128, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2106, 3, 127, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2105, 3, 126, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2104, 3, 125, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2103, 3, 124, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2102, 3, 123, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2101, 3, 122, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2100, 3, 121, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2099, 3, 120, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2098, 3, 119, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2097, 3, 118, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2096, 3, 116, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2095, 3, 115, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2094, 3, 114, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2093, 3, 113, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2092, 3, 112, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2091, 3, 111, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2090, 3, 110, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2089, 3, 108, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2088, 3, 107, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2087, 3, 106, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2086, 3, 105, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2085, 3, 104, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2084, 3, 103, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2083, 3, 102, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2082, 3, 101, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2081, 3, 100, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2080, 3, 99, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2079, 3, 98, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2078, 3, 97, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2077, 3, 96, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2076, 3, 95, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2075, 3, 94, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2074, 3, 93, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2073, 3, 92, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2072, 3, 91, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2071, 3, 90, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2070, 3, 89, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2069, 3, 88, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2068, 3, 86, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2067, 3, 85, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2066, 3, 84, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2065, 3, 83, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2064, 3, 82, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2063, 3, 81, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2062, 3, 87, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2061, 3, 76, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2060, 3, 75, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2059, 3, 74, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2058, 3, 71, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2057, 3, 70, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2056, 3, 69, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2055, 3, 67, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2054, 3, 65, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2053, 3, 79, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2052, 3, 53, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2051, 3, 52, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2050, 3, 49, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2049, 3, 47, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2114, 3, 135, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19'),
(2115, 3, 136, 0, 0, 1, '0000-00-00 00:00:00', '2015-04-01 12:53:19');

-- --------------------------------------------------------

--
-- Table structure for table `com_users_settings`
--

CREATE TABLE IF NOT EXISTS `com_users_settings` (
`id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `uenabled` tinyint(4) NOT NULL,
  `sendMessage` text NOT NULL,
  `errorMessage` text NOT NULL,
  `chkMessage` text NOT NULL,
  `regform` text NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `reppassword` text NOT NULL,
  `defgroup` varchar(255) NOT NULL,
  `updatemsg` text NOT NULL,
  `endreg` date NOT NULL,
  `startreg` date NOT NULL,
  `signupmail` int(11) NOT NULL,
  `mailfrom` varchar(255) NOT NULL,
  `mailto` text NOT NULL,
  `mailfrommail` varchar(255) NOT NULL,
  `mailsubject` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `com_users_settings`
--

INSERT INTO `com_users_settings` (`id`, `title`, `uenabled`, `sendMessage`, `errorMessage`, `chkMessage`, `regform`, `delete`, `enabled`, `order`, `created`, `modified`, `reppassword`, `defgroup`, `updatemsg`, `endreg`, `startreg`, `signupmail`, `mailfrom`, `mailto`, `mailfrommail`, `mailsubject`) VALUES
(1, 'newuser', 1, '@%lang::reg-success%@', 'hhhhhhh', '@%lang::user-exists%@', '3', 0, 1, 0, '2013-02-13 08:35:39', '2014-05-05 16:14:09', '@%lang::password-not-match%@', '4', '', '0000-00-00', '0000-00-00', 322, 'Madad', 'hazem.hassan@madad.com.eg;azizms@gmail.com', 'register-noreply@madad.com.eg', 'أهلاً بك في مدد!'),
(2, 'asda', 0, '', '', '', '', 1, 0, 0, '2013-02-13 09:03:41', '0000-00-00 00:00:00', '', '', '', '0000-00-00', '0000-00-00', 0, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `com_video_gallery`
--

CREATE TABLE IF NOT EXISTS `com_video_gallery` (
`id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `des` text COLLATE utf8_unicode_ci NOT NULL,
  `th_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `order` tinyint(4) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `cat_id` text COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` text COLLATE utf8_unicode_ci NOT NULL,
  `tags` text COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  `header` text COLLATE utf8_unicode_ci NOT NULL,
  `duration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `plugins_data` text COLLATE utf8_unicode_ci NOT NULL,
  `intro` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=178 ;

--
-- Dumping data for table `com_video_gallery`
--

INSERT INTO `com_video_gallery` (`id`, `title`, `des`, `th_image`, `file`, `enabled`, `order`, `delete`, `created`, `modified`, `cat_id`, `type`, `url`, `tags`, `alias`, `description`, `keywords`, `header`, `duration`, `plugins_data`, `intro`) VALUES
(122, 'Smosh (Show Page) ', '', 'showposter_thumb.jpg', '', 1, 8, 1, '2013-01-20 14:43:38', '2013-01-21 00:00:00', '19', '', 'http://www.youtube.com/channel/SWOCRQAEoG7Rg', '', 'Smosh-(Show-Page)', '', '', '', '', '', ''),
(117, 'dddd', '<p>fghfgh fghfgh</p>', 'Penguins.jpg', '', 1, 3, 1, '2013-01-15 06:57:24', '0000-00-00 00:00:00', '10', '', 'http://www.youtube.com/watch?v=ilwYeajPeLM', 'dd;dddj', '', '', '', '', '', '', ''),
(118, 'Jim Carrey - Stand Up Comedy ', '<p><span style="color: #333333; font-family: arial, sans-serif; font-size: 13px; line-height: 17px;">Jim Carrey - Jim Carreys Unnatural Act (1991) - Stand Up Comedy - from old VHS tape.</span></p>', 'mqdefault.jpg', '', 1, 4, 1, '2013-01-20 14:11:11', '2013-01-21 00:00:00', '19', '', 'http://www.youtube.com/watch?v=lx_wozKGbSc', 'comdy', 'Jim-Carrey---Stand-Up-Comedy', '', '', '', '', '', ''),
(119, 'Lauren Taveras -Just a Number- Official Music Video ', '', 'hqdefault.jpg', '', 1, 5, 1, '2013-01-20 14:12:38', '2013-01-21 00:00:00', '19', '', 'http://www.youtube.com/user/LaurenTaveras?v=ll7sHZQNdMU', 'comdy', 'Lauren-Taveras--Just-a-Number--Official-Music-Video', '', '', '', '', '', ''),
(120, 'Dungeon Bastard : GenCon', '<p><span style="color: #333333; font-family: arial, sans-serif; font-size: 13px; line-height: 17px;">Find out the DOs and DON''Ts for the industry''s biggest gaming convention.</span><br style="color: #333333; font-family: arial, sans-serif; font-size: 13px; line-height: 17px;" /><br style="color: #333333; font-family: arial, sans-serif; font-size: 13px; line-height: 17px;" /><span style="color: #333333; font-family: arial, sans-serif; font-size: 13px; line-height: 17px;">------------------------------</span><br style="color: #333333; font-family: arial, sans-serif; font-size: 13px; line-height: 17px;" /><br style="color: #333333; font-family: arial, sans-serif; font-size: 13px; line-height: 17px;" /><span style="color: #333333; font-family: arial, sans-serif; font-size: 13px; line-height: 17px;">FOR MORE KEEN GAMING ADVICE, GO TO:</span><br style="color: #333333; font-family: arial, sans-serif; font-size: 13px; line-height: 17px;" /><a class="yt-uix-redirect-link" style="margin: 0px; padding: 0px; border: 0px; font-size: 13px; cursor: pointer; color: #999999; text-decoration: initial; font-family: arial, sans-serif; line-height: 17px;" title="http://www.youtube.com/show/dungeonbastard" dir="ltr" href="http://www.youtube.com/show/dungeonbastard" rel="nofollow" target="_blank">http://www.youtube.com/show/dungeonbastard</a></p>', 'mqdefault (1).jpg', '', 1, 6, 1, '2013-01-20 14:18:47', '0000-00-00 00:00:00', '19', '', 'http://www.youtube.com/watch?v=kjBwr725DOU', 'comdy', '', '', '', '', '', '', ''),
(121, 'Holy Musical B@man! Act 1 Part 4 ', '<p><span style="color: #333333; font-family: arial, sans-serif; font-size: 13px; line-height: 17px;">WARNING: Holy Musical B@man! contains adult language (Yes, we mean swears).</span><br style="color: #333333; font-family: arial, sans-serif; font-size: 13px; line-height: 17px;" /><br style="color: #333333; font-family: arial, sans-serif; font-size: 13px; line-height: 17px;" /><span style="color: #333333; font-family: arial, sans-serif; font-size: 13px; line-height: 17px;">It''s not easy to be Superman. The guy''s the most powerful being on the planet, and he doesn''t even have as many Twitter followers as Batman. He IS Earth''s greatest hero, after all. Doesn''t that mean he should also be the most popular?</span><br style="color: #333333; font-family: arial, sans-serif; font-size: 13px; line-height: 17px;" /><br style="color: #333333; font-family: arial, sans-serif; font-size: 13px; line-height: 17px;" /><span style="color: #333333; font-family: arial, sans-serif; font-size: 13px; line-height: 17px;">Holy Musical B@man! is produced and performed solely for the enjoyment of ourselves and other comic book fans. It is in no way sponsored, approved, endorsed by or affiliated with DC Comics, Warner Bros. or any of their affiliates.</span><br style="color: #333333; font-family: arial, sans-serif; font-size: 13px; line-height: 17px;" /><br style="color: #333333; font-family: arial, sans-serif; font-size: 13px; line-height: 17px;" /><span style="color: #333333; font-family: arial, sans-serif; font-size: 13px; line-height: 17px;">Holy Musical B@man! was written and directed by Matt Lang &amp; Nick Lang and features music &amp; lyrics by Nick Gage, with additional music by Scott Lamps.</span><br style="color: #333333; font-family: arial, sans-serif; font-size: 13px; line-height: 17px;" /><br style="color: #333333; font-family: arial, sans-serif; font-size: 13px; line-height: 17px;" /><span style="color: #333333; font-family: arial, sans-serif; font-size: 13px; line-height: 17px;">Download the soundtrack to HOLY MUSICAL B@MAN on Bandcamp!</span></p>', 'mqdefault (2).jpg', '', 1, 7, 1, '2013-01-20 14:20:55', '2013-01-21 00:00:00', '19', '', 'http://www.youtube.com/watch?v=fxGohFWbZdc', 'comdy', 'Holy-Musical-B@man!-Act-1-Part-4', '', '', '', '', '', ''),
(115, 'اليسا', '<p>يبسي بيليب يبلب يبليبلبيل</p>', ' (1) (1).jpg', '', 0, 1, 1, '2013-01-14 07:27:01', '2013-01-17 00:00:00', '10', '', 'http://www.youtube.com/watch?v=_nA7artA9dw', 'ggg ;fsdf ;fgdf ;', '', '', '', '', '', '', ''),
(116, 'dd', '<p id="watch-uploader-info" style="margin: 0px; padding: 0px; border: 0px; font-size: 13px; color: #333333; font-family: arial, sans-serif; line-height: 17px;"><strong style="margin: 0px; padding: 0px; border: 0px; background-color: transparent;">Published on&nbsp;<span id="eow-date" class="watch-video-date" style="margin: 0px; padding: 0px; border: 0px; background-color: transparent;">Aug 8, 2012</span></strong></p>\r\n<div id="watch-description-text" style="margin: 0px; padding: 0px; border: 0px; font-size: 13px; color: #333333; font-family: arial, sans-serif; line-height: 17px;">\r\n<p id="eow-description" style="margin: 0px; padding: 0px; border: 0px; background-color: transparent;"><a class="yt-uix-redirect-link" style="margin: 0px; padding: 0px; border: 0px; background-color: transparent; cursor: pointer; color: #438bc5; text-decoration: initial;" title="https://www.facebook.com/NajwaALGERIA?ref=hl" dir="ltr" href="https://www.facebook.com/NajwaALGERIA?ref=hl" rel="nofollow" target="_blank">https://www.facebook.com/NajwaALGERIA?ref=hl</a><br />اليسا تتر مسلسل مع سبق الاصرار بطولة غادة عبد الرازق و ماجد المصري رمضان 2012<br />elissa ma3a sabq el israr intro ghada abdelrazek majed el masri ilissa ramadan2012</p>\r\n</div>\r\n<div id="watch-description-extras" style="margin: 10px 0px; padding: 0px; border: 0px; font-size: 13px; color: #333333; font-family: arial, sans-serif; line-height: 17px;">\r\n<ul class="watch-extras-section" style="list-style: none; margin: 0px; padding: 0px; border: 0px; background-color: transparent;">\r\n<li style="margin: 0px 0px 5px; padding: 0px; border: 0px; background-color: transparent; clear: both; line-height: 1.2;">\r\n<h4 class="title" style="margin: 0px 10px 0px 0px; padding: 0px; border: 0px; font-size: 11px; background-color: transparent; float: left; width: 80px; text-align: right;">Category</h4>\r\n<div class="content" style="margin: 0px 0px 0px 100px; padding: 0px; border: 0px; font-size: 11px; background-color: transparent; color: #999999; background-position: initial initial; background-repeat: initial initial;">\r\n<p id="eow-category" style="margin: 0px; padding: 0px; border: 0px; background-color: transparent;"><a style="margin: 0px; padding: 0px; border: 0px; background-color: transparent; cursor: pointer; color: #438bc5; text-decoration: initial;" href="http://www.youtube.com/music">Music</a></p>\r\n</div>\r\n</li>\r\n<li style="margin: 0px 0px 5px; padding: 0px; border: 0px; background-color: transparent; clear: both; line-height: 1.2;">\r\n<h4 class="title" style="margin: 0px 10px 0px 0px; padding: 0px; border: 0px; font-size: 11px; background-color: transparent; float: left; width: 80px; text-align: right;">License</h4>\r\n<div class="content" style="margin: 0px 0px 0px 100px; padding: 0px; border: 0px; font-size: 11px; background-color: transparent; color: #999999; background-position: initial initial; background-repeat: initial initial;">\r\n<p id="eow-reuse" style="margin: 0px; padding: 0px; border: 0px; background-color: transparent;">Standard YouTube License</p>\r\n</div>\r\n</li>\r\n</ul>\r\n</div>', 'Reference.jpg', '', 1, 2, 1, '2013-01-14 09:12:37', '0000-00-00 00:00:00', '10', '', 'http://www.youtube.com/watch?v=ABGtJrLF8pw', '', '', '', '', '', '', '', ''),
(123, 'Freestyle Swimming Technique', '', 'images (1).jpg', '', 1, 9, 1, '2013-03-02 05:53:53', '2013-04-01 00:00:00', '28,33', '', 'https://www.youtube.com/watch?v=-Wei4DGNYJM', '', 'Freestyle-Swimming-Technique', '', '', '', '', '', ''),
(124, 'كل أهداف (17) ليو ميسي في ريال مدريد [تعليق عربي] HD', '<p><span style="color: #333333; font-family: arial, sans-serif; font-size: 13px; line-height: 17px;">كل اهداف الأسطورة (ليو ميسي) في ريال مدريد || بتعليق: عربي</span></p>', 'mqdefault (1).jpg', '', 1, 10, 1, '2013-03-04 15:03:03', '2013-04-01 00:00:00', '25,27,35', '', 'http://www.youtube.com/watch?v=1Esmshs4_3o', '', 'كل-أهداف-(17)-ليو-ميسي-في-ريال-مدريد-[تعليق-عربي]-HD', '', '', '', '', '', ''),
(125, 'أهداف ميسى الـ 50 فى الدورى الأسبانى', '<div id="watch7-headline" class="clearfix yt-uix-expander" style="margin: 0px; padding: 15px 20px 9px; border-width: 0px 1px; border-style: solid; border-color: rgba(0, 0, 0, 0.0980392); font-size: 13px; position: relative; font-family: arial, sans-serif; line-height: 13px;">\r\n<h1 id="watch-headline-title" style="margin: 0px; padding: 0px; border: 0px; font-size: 19px; background-color: transparent; line-height: normal; overflow: hidden; background-position: initial initial; background-repeat: initial initial;"><span id="eow-title" class="watch-title long-title yt-uix-expander-head" style="margin: 0px; padding: 0px; border: 0px; font-size: 0.9em; background-color: transparent; cursor: pointer; -webkit-user-select: auto; letter-spacing: -0.05em;" title="أهداف ميسى الـ 50 فى الدورى الأسبانى" dir="rtl">أهداف ميسى الـ 50 فى الدورى الأسبانى</span></h1>\r\n</div>', 'mqdefault (2).jpg', '', 1, 11, 1, '2013-03-04 15:04:48', '2013-04-01 00:00:00', '25,27,35', '', 'http://www.youtube.com/watch?v=b4XahbGe0hI', '', 'أهداف-ميسى-الـ-50-فى-الدورى-الأسبانى', '', '', '', '', '', ''),
(126, 'تتويج ميسي بجائزة أفضل لاعب في العالم 2012 للمرة الرابعة', '<h3 class="yt-lockup2-title" style="margin: 5px 0px 0px; padding: 0px; border: 0px; font-size: 14px; background-color: #f6f6f6; font-family: arial, sans-serif;"><a class="yt-uix-sessionlink yt-uix-tile-link yt-uix-contextlink" style="margin: 0px; padding: 0px; border: 0px; background-color: transparent; cursor: pointer; color: #003366; text-decoration: none;" title="تتويج ميسي بجائزة أفضل لاعب في العالم 2012 للمرة الرابعة" dir="rtl" href="http://www.youtube.com/watch?v=PlQ23QY0VAg" data-sessionlink="ei=ZRc1UYL0JYLL_Qb7-IHYCA&amp;ved=CA8Qvxs" data-translation-src="ar">تتويج&nbsp;<strong style="margin: 0px; padding: 0px; border: 0px; background-color: transparent;">ميسي</strong>&nbsp;بجائزة أفضل لاعب في العالم 2012 للمرة الرابعة</a></h3>', 'mqdefault (4).jpg', '', 1, 12, 1, '2013-03-04 15:08:28', '2013-04-01 00:00:00', '25,26,27,35', '', 'http://www.youtube.com/watch?v=PlQ23QY0VAg', '', 'تتويج-ميسي-بجائزة-أفضل-لاعب-في-العالم-2012-للمرة-الرابعة', '', '', '', '', '', ''),
(127, ' 3:04   مقارنة بين ميسي ورونالدو [30/1/2013] H', '', 'mqdefault (5).jpg', '', 1, 13, 1, '2013-03-04 15:10:05', '2013-04-01 00:00:00', '25,27,35', '', '', '', '3:04---مقارنة-بين-ميسي-ورونالدو-[30/1/2013]-H', '', '', '', '', '', ''),
(128, 'مهارات ميسى 2012 بتعليق عصام الشوالى روعة', '', 'mqdefault (6).jpg', '', 1, 14, 1, '2013-03-04 15:10:59', '2013-04-01 00:00:00', '25,27,35', '', 'http://www.youtube.com/watch?v=Vmz03kbL_8Q', '', 'مهارات-ميسى-2012-بتعليق-عصام-الشوالى-روعة', '', '', '', '', '', ''),
(129, 'ميسي يتلاعب بالجميع في هجمة رهيبة', '', 'mqdefault (7).jpg', '', 1, 15, 1, '2013-03-04 15:14:27', '2013-03-04 00:00:00', '25,27', '', 'http://www.youtube.com/watch?v=G2nF4ascbXQ', '', 'ميسي-يتلاعب-بالجميع-في-هجمة-رهيبة', '', '', '', '', '', ''),
(130, 'Swimming - Freestyle - Vary Your Breathing', '', 'images (2).jpg', '', 1, 16, 1, '2013-03-08 11:32:31', '2013-04-01 00:00:00', '28,33', '', 'http://www.youtube.com/watch?v=5bSVVuTLVG8&list=PL637C508E88D187A9', '', 'Swimming---Freestyle---Vary-Your-Breathing', '', '', '', '', '', ''),
(131, 'Swimming - Freestyle ', '', 'images (3).jpg', '', 1, 18, 1, '2013-03-08 11:47:15', '2013-04-01 00:00:00', '28,33', '', 'http://www.youtube.com/watch?v=U0wQC0JswIw&list=PL637C508E88D187A9', '', 'Swimming---Freestyle', '', '', '', '', '', ''),
(132, 'Breaststroke - Pull Buoy Kick', '', 'images (5).jpg', '', 1, 19, 1, '2013-03-08 12:19:55', '2013-03-08 00:00:00', '29', '', 'http://www.youtube.com/watch?v=MD4Y-sjKlew', '', 'Breaststroke---Pull-Buoy-Kick', '', '', '', '', '', ''),
(133, 'Swimming - Breaststroke - Band Kick', '', 'images (6).jpg', '', 1, 20, 1, '2013-03-08 12:31:41', '0000-00-00 00:00:00', '29', '', 'http://www.youtube.com/watch?v=wYtPToREJUY&list=PL263D0C9531AE21E8&index=1', '', 'Swimming---Breaststroke---Band-Kick', '', '', '', '', '', ''),
(134, 'Swimming - Breaststroke - Wide Pull', '', 'c6c456fdac1980e3641b96cde2c09270.jpg', '', 1, 21, 1, '2013-03-10 00:25:35', '2013-04-01 00:00:00', '29,33', '', 'http://www.youtube.com/watch?v=Qww_QfNZ6eI&list=PL263D0C9531AE21E8', '', 'Swimming---Breaststroke---Wide-Pull', '', '', '', '', '', ''),
(135, 'Swimming - Freestyle - Shoulder Catch', '<p><span style="color: #333333; font-family: arial, sans-serif; font-size: 13px; line-height: 17px;">Developing</span><span style="color: #333333; font-family: arial, sans-serif; font-size: 13px; line-height: 17px;">&nbsp;an early catch in freestyle is extremely important for all swimmers, but it''s just not easy for all swimmers.<br />دخول الذراع فى وقت مبكر او (سحب او شد الماء فى وقت مبكر ) امر هام بالنسبه للسباحين , ولكن ليس سهل لجميعهم<br /><br /></span></p>', '3f0836842a302d573c96e15eba51abd6.', '', 1, 22, 1, '2013-03-10 00:30:25', '2013-03-10 00:00:00', '28', '', 'http://www.youtube.com/watch?v=ATHLg2yrmTI&list=PL05DDFC8117E0F798', '', 'Swimming---Freestyle---Shoulder-Catch', '', '', '', '', '', ''),
(136, 'Swimming - Freestyle - First Breath', '', '0d33042f1bc72bf5e61274a676168114.jpg', '', 1, 23, 1, '2013-03-10 01:07:36', '0000-00-00 00:00:00', '28', '', 'http://www.youtube.com/watch?v=7sMTtDeoxIU&list=PL05DDFC8117E0F798', '', 'Swimming---Freestyle---First-Breath', '', '', '', '', '', ''),
(137, 'Swimming - Butterfly - Lower-Back Dolphin Kick', '', '9515719a63e39fa769c9f454f14037d8.jpg', '', 1, 24, 1, '2013-03-11 09:19:28', '2013-04-01 00:00:00', '30,33', '', 'http://www.youtube.com/watch?v=9y41PNrqB3c&list=PLD115711BEA7B3E81', '', 'Swimming---Butterfly---Lower-Back-Dolphin-Kick', '', '', '', '', '', ''),
(138, 'Swimming - Butterfly - Second Kick', '', '3a109a9c1c6e0d0299e5c66002b18fb0.jpg', '', 1, 25, 1, '2013-03-11 09:40:35', '0000-00-00 00:00:00', '30', '', 'http://www.youtube.com/watch?v=fJeENNNK5Iw&list=PLD115711BEA7B3E81', '', 'Swimming---Butterfly---Second-Kick', '', '', '', '', '', ''),
(139, 'Swimming - Butterfly - Backwards Dolphin Kick', '', '546a81b924326705d1521b9263264b51.jpg', '', 1, 26, 1, '2013-03-11 10:32:15', '0000-00-00 00:00:00', '30', '', 'http://www.youtube.com/watch?v=tHNLGNnWKGo&list=PLD115711BEA7B3E81', '', 'Swimming---Butterfly---Backwards-Dolphin-Kick', '', '', '', '', '', ''),
(140, 'Swimming - Freestyle/Backstroke - Tempo-Trainer Kick', '', '0fbd1fbeb9f6b8307f518296134a2845.jpg', '', 1, 27, 1, '2013-03-11 10:42:27', '0000-00-00 00:00:00', '31', '', 'http://www.youtube.com/watch?v=5ewkQrxLBQE&list=PL53B5C0D22B4FA8EC', '', 'Swimming---Freestyle/Backstroke---Tempo-Trainer-Kick', '', '', '', '', '', ''),
(141, 'Swimming - Backstroke - Single Arm (Rouse-Style Execution)', '', '30744225017afe1ecda32b7c4519298b.jpg', '', 1, 28, 1, '2013-03-11 10:46:09', '0000-00-00 00:00:00', '31', '', 'http://www.youtube.com/watch?v=ooNM2YM_86Q&list=PL53B5C0D22B4FA8EC', '', 'Swimming---Backstroke---Single-Arm-(Rouse-Style-Execution)', '', '', '', '', '', ''),
(142, 'Swimming - Backstroke - 4 Back 3 Free Catch', '', '62c374c91a7c2f6d6da7acea65428834.jpg', '', 1, 29, 1, '2013-03-11 14:23:24', '0000-00-00 00:00:00', '31', '', 'http://www.youtube.com/watch?v=GiqKmjnxoU8&list=PL53B5C0D22B4FA8EC', '', 'Swimming---Backstroke---4-Back-3-Free-Catch', '', '', '', '', '', ''),
(143, 'Backstroke - Underwater Dolphin - Size', '', '1830bbfd922ac9860910b66aaa4fc74a.jpg', '', 1, 30, 1, '2013-03-11 14:34:45', '0000-00-00 00:00:00', '31', '', 'http://www.youtube.com/watch?v=41KPr1wQ1u0&list=PL53B5C0D22B4FA8EC', '', 'Backstroke---Underwater-Dolphin---Size', '', '', '', '', '', ''),
(144, 'Swimming - BUTTERFLY - Vertical Kick', '', '8a6b3779ad495aa12597b969b1de0537.jpg', '', 1, 31, 1, '2013-03-11 14:39:16', '0000-00-00 00:00:00', '30', '', 'http://www.youtube.com/watch?v=U5pj-zTrXuA&list=PLD115711BEA7B3E81', '', 'Swimming---BUTTERFLY---Vertical-Kick', '', '', '', '', '', ''),
(145, 'Swimming - Breaststroke - 1/2 Free - 1/2 Breast Pull', '', '0c2dfe56c23e36237d13eb46d6750341.jpg', '', 1, 32, 1, '2013-03-11 14:50:02', '0000-00-00 00:00:00', '29', '', 'http://www.youtube.com/watch?v=3AFIkARqPQA&list=PL263D0C9531AE21E8', '', 'Swimming---Breaststroke---1/2-Free---1/2-Breast-Pull', '', '', '', '', '', ''),
(146, 'Best Goals in History of Football', '', '5155a3767355d.jpg', '', 1, 33, 1, '2013-03-29 08:21:42', '0000-00-00 00:00:00', '25', '', 'http://www.youtube.com/watch?v=9foCJDVTbYg', '', 'Best-Goals-in-History-of-Football', '', '', '', '', '', ''),
(147, 'مصر 1-0 زيمبابوي "حسني عبد ربه "', '', '5155a796addb7.jpg', '', 1, 34, 1, '2013-03-29 08:39:18', '0000-00-00 00:00:00', '25', '', 'http://www.youtube.com/watch?v=FKs8FGbyNkU', '', 'مصر-1-0-زيمبابوي--حسني-عبد-ربه--', '', '', '', '', '', ''),
(148, 'مصر 1-1 زيمبابوي هف التعادل لــ زيمبابوي', '', '5155a8cc7895b.jpg', '', 1, 35, 1, '2013-03-29 08:44:28', '0000-00-00 00:00:00', '25', '', 'http://www.youtube.com/watch?v=S-DsNgqffqk', '', 'مصر-1-1-زيمبابوي-هف-التعادل-لــ-زيمبابوي', '', '', '', '', '', ''),
(149, 'وادى دجله 0-3 سموحه 28-3-2013', '', '5155aa1dbfbee.jpg', '', 1, 36, 1, '2013-03-29 08:50:05', '0000-00-00 00:00:00', '25', '', 'http://www.youtube.com/watch?v=v_MJ7V3NDTI', '', 'وادى-دجله-0-3-سموحه-28-3-2013', '', '', '', '', '', ''),
(150, 'Swimming - Freestyle - Open-Water Breathing', '', '5155abcae7f8f.jpg', '', 1, 37, 1, '2013-03-29 08:57:14', '0000-00-00 00:00:00', '28', '', 'http://www.youtube.com/watch?v=tB_-1sXrYeE', '', 'Swimming---Freestyle---Open-Water-Breathing', '', '', '', '', '', ''),
(151, 'Swimming - Butterfly - 3-3-3 Thumb Drag', '', '5155ad0013bd1.jpg', '', 1, 38, 1, '2013-03-29 09:02:24', '0000-00-00 00:00:00', '30', '', 'http://www.youtube.com/watch?v=vcXBaGI9pUE&list=PLD115711BEA7B3E81', '', 'Swimming---Butterfly---3-3-3-Thumb-Drag', '', '', '', '', '', ''),
(152, 'Swimming - Freestyle - Ultra-Fast Turns', '', '5157006640945.jpg', '', 1, 39, 1, '2013-03-30 09:10:30', '0000-00-00 00:00:00', '28', '', 'http://www.youtube.com/watch?v=lRNbiZPbKt8&list=PL05DDFC8117E0F798&index=5', '', 'Swimming---Freestyle---Ultra-Fast-Turns', '', '', '', '', '', ''),
(153, 'Swimming - Freestyle - 10-Kick Flutter Variation', '', '515700b7629be.jpg', '', 1, 40, 1, '2013-03-30 09:11:51', '0000-00-00 00:00:00', '28', '', 'http://www.youtube.com/watch?v=cXGev5TyTXM&list=PL05DDFC8117E0F798', '', 'Swimming---Freestyle---10-Kick-Flutter-Variation', '', '', '', '', '', ''),
(154, 'Swimming - Freestyle - Flutter-Kick Basics', '', '51570126d0a4e.jpg', '', 1, 41, 1, '2013-03-30 09:13:42', '0000-00-00 00:00:00', '28', '', 'http://www.youtube.com/watch?v=DgZ5-oatDg8&list=PL05DDFC8117E0F798', '', 'Swimming---Freestyle---Flutter-Kick-Basics', '', '', '', '', '', ''),
(155, 'Swimming - Breaststroke - Head-Lead Kick on Your Back', '', '515701d286200.jpg', '', 1, 42, 1, '2013-03-30 09:16:34', '0000-00-00 00:00:00', '28', '', 'http://www.youtube.com/watch?v=X3s4-EsVr8w&list=PL263D0C9531AE21E8&index=4', '', 'Swimming---Breaststroke---Head-Lead-Kick-on-Your-Back', '', '', '', '', '', ''),
(156, 'Swimming - Breaststroke - Head-Lead Kick on Your Back', '', '515703785cd69.jpg', '', 1, 43, 1, '2013-03-30 09:23:36', '0000-00-00 00:00:00', '29', '', 'http://www.youtube.com/watch?v=X3s4-EsVr8w&list=PL263D0C9531AE21E8&index=4', '', 'Swimming---Breaststroke---Head-Lead-Kick-on-Your-Back', '', '', '', '', '', ''),
(157, 'Swimming - Breaststroke - Pulling with Paddles', '', '515704d62c129.jpg', '', 1, 44, 1, '2013-03-30 09:29:26', '0000-00-00 00:00:00', '29', '', 'http://www.youtube.com/watch?v=mISYGOd2h40&list=PL263D0C9531AE21E8', '', 'Swimming---Breaststroke---Pulling-with-Paddles', '', '', '', '', '', ''),
(158, 'Swimming - Breaststroke - Head-Down Pull', '', '5157053ae8346.jpg', '', 1, 45, 1, '2013-03-30 09:31:06', '0000-00-00 00:00:00', '29', '', 'http://www.youtube.com/watch?v=_ABtwcySv-k&list=PL263D0C9531AE21E8', '', 'Swimming---Breaststroke---Head-Down-Pull', '', '', '', '', '', ''),
(159, 'Swimming - Breaststroke - Pullout Fine Tuning', '', '5157058c23b1d.jpg', '', 1, 46, 1, '2013-03-30 09:32:28', '0000-00-00 00:00:00', '29', '', 'http://www.youtube.com/watch?v=l05ed04MZuA&list=PL263D0C9531AE21E8', '', 'Swimming---Breaststroke---Pullout-Fine-Tuning', '', '', '', '', '', ''),
(160, 'Swimming - Butterfly - Breakout', '', '5157062a79126.jpg', '', 1, 47, 1, '2013-03-30 09:35:06', '0000-00-00 00:00:00', '30', '', 'http://www.youtube.com/watch?v=xXXQ3U758Ag&list=PLD115711BEA7B3E81&index=8', '', 'Swimming---Butterfly---Breakout', '', '', '', '', '', ''),
(161, 'Swimming - Butterfly - Dolphin Kick, Arms Up!', '', '515706c07ffbc.jpg', '', 1, 48, 1, '2013-03-30 09:37:36', '0000-00-00 00:00:00', '30', '', 'http://www.youtube.com/watch?v=uA3wI2M_xVs&list=PLD115711BEA7B3E81', '', 'Swimming---Butterfly---Dolphin-Kick,-Arms-Up!', '', '', '', '', '', ''),
(162, 'Backstroke - Underwater Dolphin - Size', '', '5157072c8e3dc.jpg', '', 1, 49, 1, '2013-03-30 09:39:24', '0000-00-00 00:00:00', '31', '', 'http://www.youtube.com/watch?v=41KPr1wQ1u0&list=PL53B5C0D22B4FA8EC&index=4', '', 'Backstroke---Underwater-Dolphin---Size', '', '', '', '', '', ''),
(163, 'Swimming - Backstroke - Steady Kick', '', '5157076b4a4c9.jpg', '', 1, 50, 1, '2013-03-30 09:40:27', '0000-00-00 00:00:00', '31', '', 'http://www.youtube.com/watch?v=LgVV8YoPzbU&list=PL53B5C0D22B4FA8EC', '', 'Swimming---Backstroke---Steady-Kick', '', '', '', '', '', ''),
(164, 'Swimming - Backstroke - Double Arm', '', '515707a091813.jpg', '', 1, 51, 1, '2013-03-30 09:41:20', '0000-00-00 00:00:00', '31', '', 'http://www.youtube.com/watch?v=TTHv84rmKcw&list=PL53B5C0D22B4FA8EC', '', 'Swimming---Backstroke---Double-Arm', '', '', '', '', '', ''),
(165, 'Swimming - Backstroke - Spin Drill', '', '515707cf6bab9.jpg', '', 1, 52, 1, '2013-03-30 09:42:07', '0000-00-00 00:00:00', '31', '', 'http://www.youtube.com/watch?v=h8iSwO6RKto&list=PL53B5C0D22B4FA8EC', '', 'Swimming---Backstroke---Spin-Drill', '', '', '', '', '', ''),
(166, 'حرس الحدود 3 - 1غزل المحلة 2-4-2013', '', '516009472abbb.jpg', '', 1, 53, 1, '2013-04-06 05:38:47', '0000-00-00 00:00:00', '25', '', 'http://www.youtube.com/watch?v=H2b9JS2iZGI', '', 'حرس-الحدود-3---1غزل-المحلة-2-4-2013', '', '', '', '', '', ''),
(167, 'كرة الماء بطولة الجمهورية هيليوبوليس امام الزهور', '', '51600a055b364.jpg', '', 1, 54, 1, '2013-04-06 05:41:57', '2013-04-07 00:00:00', '23,33', '', 'http://www.youtube.com/watch?v=LRXvLUGneqM', '', 'كرة-الماء-بطولة-الجمهورية-هيليوبوليس-امام-الزهور', '', '', '', '5:10', 'source__1;', ''),
(168, 'هدف تقدم مصر على غانا', '', '516b0b1e7574b.jpg', '', 1, 55, 1, '2013-04-14 14:01:34', '0000-00-00 00:00:00', '25,35', '', 'http://www.youtube.com/watch?v=DmsNd_SzTbY', '', 'هدف-تقدم-مصر-على-غانا', '', '', '', '', '', ''),
(169, 'الريشة الطائرة | بطولة الجمهورية | الزهور امام الجيش', '', '516b0bda1ca73.jpg', '', 1, 56, 1, '2013-04-14 14:04:42', '0000-00-00 00:00:00', '22,32', '', 'http://www.youtube.com/watch?v=kV0b3b4xwKg', '', 'الريشة-الطائرة---بطولة-الجمهورية---الزهور-امام-الجيش', '', '', '', '', '', ''),
(170, 'National Diving Championship - Seniors - Day 1', '', '516b0c79b3181.jpg', '', 1, 57, 1, '2013-04-14 14:07:21', '0000-00-00 00:00:00', '23,33', '', 'http://www.youtube.com/watch?v=tV4AqRtD3qQ', '', 'National-Diving-Championship---Seniors---Day-1', '', '', '', '', '', ''),
(171, 'National Diving Championship - Seniors - Day 2', '', '516b0cedab09c.jpg', '', 1, 58, 1, '2013-04-14 14:09:17', '0000-00-00 00:00:00', '23,33', '', 'http://www.youtube.com/watch?v=Qfsg-gWcJok', '', 'National-Diving-Championship---Seniors---Day-2', '', '', '', '', '', ''),
(172, 'National Diving Championship - Seniors - Day 3', '', '516b0d4060789.jpg', '', 1, 59, 1, '2013-04-14 14:10:40', '0000-00-00 00:00:00', '23,33', '', 'http://www.youtube.com/watch?v=mTFVpcXSi4Q', '', 'National-Diving-Championship---Seniors---Day-3', '', '', '', '', '', ''),
(173, 'كاس العالم لكرة اليد 2013.. تونس تفوزعلى المانيا 25-23', '', '516b0e2e8bb41.jpg', '', 1, 60, 1, '2013-04-14 14:14:38', '0000-00-00 00:00:00', '22,32', '', 'http://www.youtube.com/watch?v=f0Q_ZU1pw7Q', '', 'كاس-العالم-لكرة-اليد-2013---تونس-تفوزعلى-المانيا-25-23', '', '', '', '', '', ''),
(174, 'about2', '', '', '', 1, 61, 0, '2013-12-11 16:18:55', '2013-12-11 00:00:00', '1', '', 'http://www.youtube.com/watch?v=ogaoL1H4kYk', '', 'about2', '', '', '', '50', '||name1__plg_rescores;__cc;', ''),
(175, 'about2', '', '52a8f30ea8ac3.jpg', '', 1, 61, 0, '2013-12-11 16:18:55', '2013-12-11 00:00:00', '1', '', 'http://www.youtube.com/watch?v=ogaoL1H4kYk', '', 'about2', '', '', '', '50', '||name1__plg_rescores;__cc;', ''),
(176, 'about2', '', '', '', 1, 61, 0, '2013-12-11 16:18:55', '2013-12-11 00:00:00', '1', '', 'http://www.youtube.com/watch?v=ogaoL1H4kYk', '', 'about2', '', '', '', '50', '||name1__plg_rescores;__cc;', ''),
(177, 'about2', '', '', '', 1, 61, 0, '2013-12-11 16:18:55', '2013-12-11 00:00:00', '1', '', 'http://www.youtube.com/watch?v=ogaoL1H4kYk', '', 'about2', '', '', '', '50', '||name1__plg_rescores;__cc;', '');

-- --------------------------------------------------------

--
-- Table structure for table `com_video_gallery_categories`
--

CREATE TABLE IF NOT EXISTS `com_video_gallery_categories` (
`id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `des` text COLLATE utf8_unicode_ci NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `cat_id` int(11) NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `com_video_gallery_categories`
--

INSERT INTO `com_video_gallery_categories` (`id`, `title`, `image`, `des`, `delete`, `order`, `enabled`, `created`, `modified`, `cat_id`, `alias`) VALUES
(1, 'test', '', '', 0, 1, 1, '2013-12-11 16:17:54', '0000-00-00 00:00:00', 0, 'test');

-- --------------------------------------------------------

--
-- Table structure for table `com_video_gallery_xref`
--

CREATE TABLE IF NOT EXISTS `com_video_gallery_xref` (
`id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=129 ;

--
-- Dumping data for table `com_video_gallery_xref`
--

INSERT INTO `com_video_gallery_xref` (`id`, `item_id`, `cat_id`, `delete`, `order`, `enabled`, `modified`, `created`) VALUES
(82, 124, 27, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 125, 27, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 126, 27, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 127, 35, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 128, 27, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 129, 25, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 129, 27, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 128, 25, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 127, 27, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 126, 26, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 126, 25, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 125, 25, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 124, 25, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 132, 29, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 130, 28, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 131, 28, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 123, 28, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 133, 29, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 134, 29, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 135, 28, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 136, 28, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 137, 30, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 138, 30, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 139, 30, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 140, 31, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 141, 31, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 142, 31, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 143, 31, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 144, 30, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 145, 29, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 146, 25, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 147, 25, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 148, 25, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 149, 25, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 150, 28, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 151, 30, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 152, 28, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 153, 28, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 154, 28, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 155, 28, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 156, 29, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 157, 29, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 158, 29, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 159, 29, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 160, 30, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 161, 30, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 162, 31, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 163, 31, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 164, 31, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 165, 31, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 123, 33, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 130, 33, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 131, 33, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 134, 33, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 137, 33, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 124, 35, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 125, 35, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 126, 35, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 127, 25, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 128, 35, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 166, 25, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 167, 33, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 167, 23, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 168, 25, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 168, 35, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, 169, 22, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 169, 32, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 170, 23, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 170, 33, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 171, 23, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 171, 33, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 172, 23, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 172, 33, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 173, 22, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 173, 32, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 174, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, 176, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 175, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 177, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `com_wizard`
--

CREATE TABLE IF NOT EXISTS `com_wizard` (
`id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `cat_id` text NOT NULL,
  `data` text NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=ucs2 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `com_wizard`
--

INSERT INTO `com_wizard` (`id`, `title`, `enabled`, `delete`, `order`, `created`, `modified`, `cat_id`, `data`) VALUES
(13, 'Faiz-Wizard', 1, 0, 0, '2014-06-01 09:18:18', '2015-03-30 01:24:27', '', 'stepid=>s1__steporder=>1__steptitle=>Setp-s1__|typeID=>T1__type=>data__data1=>22__morecss=>__;||stepid=>s1__steporder=>2__steptitle=>Setp-s1__|typeID=>T1__type=>data__data1=>19__morecss=>__;||stepid=>s1__steporder=>3__steptitle=>Setp-s1__|typeID=>T1__type=>data__data1=>20__morecss=>__;||stepid=>s1__steporder=>4__steptitle=>Setp-s1__|typeID=>T1__type=>data__data1=>21__morecss=>__;||'),
(14, 'w1', 1, 0, 0, '2014-06-01 13:12:56', '2014-06-01 17:05:11', '', 'stepid=>s1__steporder=>1__steptitle=>Setp-s1__|typeID=>T1__type=>data__data1=>19__morecss=>__;typeID=>T2__type=>data__data1=>20__morecss=>__;||'),
(15, 'w1', 0, 1, 0, '2014-06-01 13:14:50', '0000-00-00 00:00:00', '', ''),
(16, 'w1', 0, 1, 0, '2014-06-01 13:15:45', '0000-00-00 00:00:00', '', ''),
(17, '', 0, 1, 0, '2014-06-01 13:17:12', '0000-00-00 00:00:00', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `com_wizard_xref`
--

CREATE TABLE IF NOT EXISTS `com_wizard_xref` (
`id` int(11) NOT NULL,
  `s_id` int(11) NOT NULL,
  `w_id` int(11) NOT NULL,
  `properties` text COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `delete` tinyint(4) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cat_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=227 ;

--
-- Dumping data for table `com_wizard_xref`
--

INSERT INTO `com_wizard_xref` (`id`, `s_id`, `w_id`, `properties`, `order`, `modified`, `created`, `enabled`, `delete`, `title`, `sid`, `cat_id`, `item_id`) VALUES
(225, 0, 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, '', '', 0, 16),
(226, 0, 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, '', '', 0, 17);

-- --------------------------------------------------------

--
-- Table structure for table `com_yards`
--

CREATE TABLE IF NOT EXISTS `com_yards` (
`id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `address` text NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `mapaddress` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `extension`
--

CREATE TABLE IF NOT EXISTS `extension` (
`id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `cat_id` text NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fiz_approved_status`
--

CREATE TABLE IF NOT EXISTS `fiz_approved_status` (
`id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `des` text COLLATE utf8_unicode_ci NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `cat_id` int(11) NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `fiz_approved_status`
--

INSERT INTO `fiz_approved_status` (`id`, `title`, `image`, `des`, `delete`, `order`, `enabled`, `created`, `modified`, `cat_id`, `alias`) VALUES
(1, 'Approved for House Stay', '', '', 0, 0, 1, '2014-07-23 20:09:42', '0000-00-00 00:00:00', 0, ''),
(2, 'Approved for Faiz Stay', '', '', 0, 0, 1, '2014-07-23 20:09:55', '0000-00-00 00:00:00', 0, ''),
(3, 'Without Raza', '', '', 0, 0, 1, '2014-07-23 20:10:08', '0000-00-00 00:00:00', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `fiz_cashier_receipt`
--

CREATE TABLE IF NOT EXISTS `fiz_cashier_receipt` (
`id` int(11) NOT NULL,
  `total` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remarks` text COLLATE utf8_unicode_ci NOT NULL,
  `received_by` text COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `paid_status` int(25) NOT NULL DEFAULT '0',
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Dumping data for table `fiz_cashier_receipt`
--

INSERT INTO `fiz_cashier_receipt` (`id`, `total`, `remarks`, `received_by`, `order`, `modified`, `created`, `enabled`, `delete`, `paid_status`, `status`) VALUES
(1, '', 'Remarks', 'Received_by', 0, '0000-00-00 00:00:00', '2014-07-14 16:58:44', 0, 0, 0, ''),
(2, '', 'Remarks', 'Received_by', 0, '0000-00-00 00:00:00', '2014-07-14 17:00:26', 0, 0, 0, ''),
(3, '', '', 'undefined', 0, '0000-00-00 00:00:00', '2014-07-14 17:29:52', 0, 0, 0, ''),
(4, '', '', 'undefined', 0, '0000-00-00 00:00:00', '2014-07-14 17:31:43', 0, 0, 0, ''),
(5, '', '', 'undefined', 0, '0000-00-00 00:00:00', '2014-07-14 17:32:35', 0, 0, 0, ''),
(6, '', '', 'undefined', 0, '0000-00-00 00:00:00', '2014-07-14 17:35:40', 0, 0, 0, ''),
(7, '', '', 'empcland@gmail.com', 0, '0000-00-00 00:00:00', '2014-07-14 17:50:31', 0, 0, 0, ''),
(8, '320', '', 'empcland@gmail.com', 0, '0000-00-00 00:00:00', '2014-07-14 17:53:03', 0, 0, 0, ''),
(9, '320', '', 'empcland@gmail.com', 0, '0000-00-00 00:00:00', '2014-07-14 17:54:18', 0, 0, 0, ''),
(10, '320', '', 'empcland@gmail.com', 0, '0000-00-00 00:00:00', '2014-07-14 17:56:19', 0, 0, 0, ''),
(11, '320', '', '-', 0, '0000-00-00 00:00:00', '2014-07-15 13:16:12', 0, 0, 0, ''),
(12, '0', 'ghjghj ghjghj', 'empcland@gmail.com', 0, '0000-00-00 00:00:00', '2014-07-31 15:48:41', 0, 0, 0, 'refund'),
(13, '0', 'ghjghj ghjghj', 'empcland@gmail.com', 0, '0000-00-00 00:00:00', '2014-07-31 15:55:23', 0, 0, 0, 'refund'),
(14, '0', 'ghjghj ghjghj', 'empcland@gmail.com', 0, '0000-00-00 00:00:00', '2014-07-31 15:55:25', 0, 0, 0, 'refund'),
(15, '0', 'ghjghj ghjghj', 'empcland@gmail.com', 0, '0000-00-00 00:00:00', '2014-07-31 15:55:28', 0, 0, 0, 'refund'),
(16, '0', 'ghjghj ghjghj', 'empcland@gmail.com', 0, '0000-00-00 00:00:00', '2014-07-31 16:41:21', 0, 0, 0, 'refund');

-- --------------------------------------------------------

--
-- Table structure for table `fiz_cashier_receipt_items`
--

CREATE TABLE IF NOT EXISTS `fiz_cashier_receipt_items` (
`id` int(11) NOT NULL,
  `receipt_id` int(11) NOT NULL,
  `remarks` text COLLATE utf8_unicode_ci NOT NULL,
  `extension_id` int(11) NOT NULL,
  `extension_amount` double NOT NULL,
  `paid_amount` double NOT NULL,
  `authorised_by` text COLLATE utf8_unicode_ci NOT NULL,
  `authorize_reason` text COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `delete` tinyint(4) NOT NULL,
  `def_amount` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=20 ;

--
-- Dumping data for table `fiz_cashier_receipt_items`
--

INSERT INTO `fiz_cashier_receipt_items` (`id`, `receipt_id`, `remarks`, `extension_id`, `extension_amount`, `paid_amount`, `authorised_by`, `authorize_reason`, `order`, `modified`, `created`, `enabled`, `delete`, `def_amount`, `status`, `user_id`) VALUES
(13, 10, '', 5, 320, 32, 'empcland@gmail.com', 'gdfgdfgdfgdgfg', 0, '0000-00-00 00:00:00', '2014-07-14 17:56:19', 1, 0, '', '', 0),
(14, 11, '', 5, 320, 32, '', 'gdfgdfgdfgdgfg', 0, '0000-00-00 00:00:00', '2014-07-15 13:16:12', 1, 0, '', '', 0),
(15, 12, 'ghjghj ghjghj', 5, 320, 32, 'empcland@gmail.com', 'ghjghj ghjgh', 0, '0000-00-00 00:00:00', '2014-07-31 15:48:41', 1, 0, '', 'refund', 0),
(19, 16, 'ghjghj ghjghj', 5, 320, 31, 'empcland@gmail.com', 'ghjghj ghjgh', 0, '0000-00-00 00:00:00', '2014-07-31 16:41:22', 1, 0, '', 'refund', 0),
(18, 15, 'ghjghj ghjghj', 5, 1, 1, 'empcland@gmail.com', 'ghjghj ghjgh', 0, '0000-00-00 00:00:00', '2014-07-31 15:55:28', 1, 0, '', 'refund', 0);

-- --------------------------------------------------------

--
-- Table structure for table `fiz_city`
--

CREATE TABLE IF NOT EXISTS `fiz_city` (
`id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `cat_id` text NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `fiz_city`
--

INSERT INTO `fiz_city` (`id`, `question`, `answer`, `enabled`, `delete`, `order`, `created`, `modified`, `cat_id`, `title`) VALUES
(1, '', '', 1, 0, 0, '2014-06-02 14:39:56', '2014-06-02 14:41:57', '', 'cairo');

-- --------------------------------------------------------

--
-- Table structure for table `fiz_extension`
--

CREATE TABLE IF NOT EXISTS `fiz_extension` (
`id` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `ex_status` varchar(50) NOT NULL,
  `ex_nights` int(11) NOT NULL,
  `ex_checkin` date NOT NULL,
  `ex_checkout` date NOT NULL,
  `ex_lawazim` int(11) NOT NULL,
  `ex_paid` tinyint(4) NOT NULL,
  `package_id` int(11) NOT NULL,
  `nights` int(11) NOT NULL,
  `reservation_id` int(50) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `pkg_cat_id` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=97 ;

--
-- Dumping data for table `fiz_extension`
--

INSERT INTO `fiz_extension` (`id`, `enabled`, `delete`, `order`, `created`, `modified`, `ex_status`, `ex_nights`, `ex_checkin`, `ex_checkout`, `ex_lawazim`, `ex_paid`, `package_id`, `nights`, `reservation_id`, `user_id`, `pkg_cat_id`) VALUES
(1, 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 2, '2014-06-01', '2014-06-07', 440, 1, 3, 6, 1, '162', 0),
(2, 1, 1, 0, '0000-00-00 00:00:00', '2014-08-02 04:33:36', '', 2, '2014-06-01', '2014-06-07', 440, 0, 3, 6, 2, '160', -1),
(3, 1, 0, 0, '0000-00-00 00:00:00', '2014-08-11 04:12:05', '', 0, '2014-06-12', '2014-06-16', 320, 0, 3, 4, 3, '160', -1),
(4, 1, 1, 0, '0000-00-00 00:00:00', '2014-08-02 09:04:55', '', 0, '2014-06-12', '2014-06-16', 200, 0, 3, 4, 4, '163', -1),
(5, 1, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, '2014-06-12', '2014-06-16', 320, 0, 3, 4, 5, '160', 0),
(6, 1, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, '2014-06-26', '2014-06-16', 200, 0, 3, 4, 6, '163', 0),
(7, 1, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, '2014-06-25', '2014-06-26', 85, 0, 2, 1, 7, '160', 0),
(8, 1, 0, 0, '0000-00-00 00:00:00', '2014-08-02 04:44:40', '', 0, '2014-06-25', '2014-06-26', 55, 0, 2, 1, 8, '163', -1),
(9, 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, '2014-06-25', '2014-06-26', 85, 0, 2, 1, 9, '162', 0),
(10, 1, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, '2014-06-25', '2014-06-26', 85, 0, 2, 1, 10, '160', 0),
(11, 1, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, '2014-06-25', '2014-06-26', 55, 0, 2, 1, 11, '163', 0),
(12, 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, '2014-06-25', '2014-06-26', 85, 0, 2, 1, 12, '162', 0),
(13, 1, 0, 0, '2014-06-11 08:42:30', '2014-07-31 15:55:28', '', 2, '2014-06-07', '2014-06-20', 505, 0, 3, 6, 1, '162', 0),
(14, 1, 1, 0, '2014-06-11 08:42:30', '2014-07-31 15:55:23', '', 0, '2014-06-16', '2014-06-20', 120, 0, 3, 4, 6, '163', 0),
(15, 1, 0, 0, '2014-06-11 08:42:30', '0000-00-00 00:00:00', '', 0, '0000-00-00', '2014-06-20', 0, 0, 0, 0, 0, '', 0),
(17, 1, 0, 0, '2014-06-11 09:00:12', '0000-00-00 00:00:00', '', 2, '2014-06-20', '2014-06-25', 275, 0, 3, 6, 1, '162', 0),
(18, 1, 0, 0, '2014-06-11 09:01:38', '0000-00-00 00:00:00', '', 2, '2014-06-25', '2014-06-18', -385, 0, 3, 6, 1, '162', 0),
(19, 1, 1, 0, '2014-06-11 09:01:38', '0000-00-00 00:00:00', '', 0, '2014-06-20', '2014-06-18', -60, 0, 3, 4, 6, '163', 0),
(20, 1, 0, 0, '2014-06-18 08:31:56', '0000-00-00 00:00:00', '', 0, '2014-06-26', '2014-06-20', -55, 0, 0, 1, 8, '163', 0),
(21, 1, 0, 0, '2014-06-18 08:32:32', '0000-00-00 00:00:00', '', 0, '2014-06-20', '2014-06-16', 200, 0, 3, 1, 8, '163', 0),
(22, 1, 0, 0, '2014-06-29 03:41:39', '0000-00-00 00:00:00', '', 0, '2014-06-09', '2014-06-12', 320, 0, 3, 3, 13, '160', 0),
(23, 1, 0, 0, '2014-06-29 06:56:16', '0000-00-00 00:00:00', '', 2, '2014-06-24', '2014-06-30', 440, 0, 3, 6, 14, '164', 0),
(24, 1, 0, 0, '2014-06-29 06:57:55', '2014-06-29 07:34:16', '', 2, '2014-06-24', '2014-06-30', 440, 1, 3, 6, 15, '164', 0),
(25, 1, 0, 0, '2014-06-29 07:21:57', '0000-00-00 00:00:00', '', 2, '2014-06-30', '2014-07-03', 180, 0, 3, 6, 15, '164', 0),
(28, 1, 0, 0, '2014-07-22 16:41:49', '0000-00-00 00:00:00', '', 5, '2014-07-01', '2014-06-04', 250, 0, 5, 0, 33, '160', 0),
(29, 1, 0, 0, '2014-07-22 16:41:49', '0000-00-00 00:00:00', '', 10, '2014-06-01', '2014-06-11', 500, 0, 5, 0, 34, '160', 0),
(30, 1, 0, 0, '2014-07-22 16:58:30', '0000-00-00 00:00:00', '', 5, '2014-07-01', '2014-06-04', 250, 0, 5, 0, 33, '160', 0),
(31, 1, 0, 0, '2014-07-22 16:58:30', '0000-00-00 00:00:00', '', 10, '2014-06-01', '2014-06-11', 500, 0, 5, 0, 34, '160', 0),
(32, 1, 0, 0, '2014-07-22 16:58:34', '0000-00-00 00:00:00', '', 5, '2014-07-01', '2014-06-04', 250, 0, 5, 0, 33, '160', 0),
(33, 1, 0, 0, '2014-07-22 16:58:34', '0000-00-00 00:00:00', '', 10, '2014-06-01', '2014-06-11', 500, 0, 5, 0, 34, '160', 0),
(34, 1, 0, 0, '2014-07-22 17:01:30', '0000-00-00 00:00:00', '', 5, '2014-07-01', '2014-06-04', 250, 0, 5, 0, 33, '160', 0),
(35, 1, 0, 0, '2014-07-22 17:01:30', '0000-00-00 00:00:00', '', 10, '2014-06-01', '2014-06-11', 500, 0, 5, 0, 34, '160', 0),
(39, 1, 1, 0, '2014-07-23 21:08:59', '0000-00-00 00:00:00', '', 24, '2014-07-01', '2014-07-25', 1200, 0, 5, 0, 39, '168', 0),
(40, 1, 1, 0, '2014-08-01 21:12:34', '0000-00-00 00:00:00', '', 0, '0000-00-00', '0000-00-00', 50, 0, 5, 1, 11, '163', 0),
(41, 1, 0, 0, '2014-08-01 21:13:04', '0000-00-00 00:00:00', '', 0, '0000-00-00', '0000-00-00', 50, 0, 5, 1, 11, '163', 0),
(42, 1, 1, 0, '2014-08-02 02:58:00', '2014-08-02 01:19:47', '', 2, '2014-06-07', '2014-06-10', 180, 0, 3, 6, 2, '160', -1),
(43, 1, 1, 0, '2014-08-02 02:59:58', '2014-08-02 01:19:47', '', 2, '2014-06-10', '2014-06-04', -300, 0, 3, 6, 2, '160', -1),
(44, 1, 1, 0, '2014-08-02 03:05:33', '2014-08-02 01:19:47', '', 2, '2014-06-04', '2014-06-18', 515, 0, 4, 6, 2, '160', -1),
(45, 1, 0, 0, '2014-08-02 03:05:33', '0000-00-00 00:00:00', '', 0, '2014-06-16', '2014-06-18', 0, 0, 0, 1, 8, '163', 0),
(46, 1, 1, 0, '2014-08-02 03:07:27', '2014-08-02 01:19:47', '', 2, '2014-06-18', '2014-06-28', 550, 0, 4, 6, 2, '160', -1),
(47, 1, 1, 0, '2014-08-02 03:07:52', '2014-08-02 01:19:47', '', 2, '2014-06-28', '2014-06-30', 110, 0, 4, 6, 2, '160', -1),
(48, 1, 0, 0, '2014-08-02 03:07:52', '0000-00-00 00:00:00', '', 0, '2014-06-18', '2014-06-30', 230, 0, 3, 1, 8, '163', 0),
(49, 1, 1, 0, '2014-08-02 03:10:46', '2014-08-02 01:19:47', '', 2, '2014-06-30', '2014-07-01', 55, 0, 4, 6, 2, '160', -1),
(50, 1, 0, 0, '2014-08-02 03:10:46', '0000-00-00 00:00:00', '', 0, '2014-06-30', '2014-07-01', 30, 0, 3, 1, 8, '163', 0),
(51, 1, 1, 0, '2014-08-02 03:16:15', '2014-08-02 01:19:47', '', 2, '2014-07-01', '2014-07-02', 55, 0, 4, 6, 2, '160', -1),
(52, 1, 0, 0, '2014-08-02 03:16:15', '0000-00-00 00:00:00', '', 0, '2014-07-01', '2014-07-02', 30, 0, 3, 1, 8, '163', 0),
(53, 1, 1, 0, '2014-08-02 03:30:06', '2014-08-02 01:19:47', '', 2, '2014-07-02', '2014-07-03', 55, 0, 4, 6, 2, '160', -1),
(54, 1, 0, 0, '2014-08-02 03:30:06', '0000-00-00 00:00:00', '', 0, '2014-07-02', '2014-07-03', 30, 0, 3, 1, 8, '163', 0),
(55, 1, 1, 0, '2014-08-02 03:47:44', '2014-08-02 01:19:47', '', 2, '2014-07-03', '2014-05-01', -1660, 0, 0, 6, 2, '160', -1),
(56, 1, 1, 0, '2014-08-02 03:48:03', '2014-08-02 01:19:47', '', 2, '2014-05-01', '2014-04-01', 0, 0, 0, 6, 2, '160', -1),
(57, 1, 1, 0, '2014-08-02 03:49:21', '2014-08-02 01:19:47', '', 2, '2014-04-01', '2014-06-04', 320, 0, 3, 6, 2, '160', -1),
(58, 1, 1, 0, '2014-08-02 03:55:05', '2014-08-02 01:19:47', '', 2, '2014-06-04', '2014-05-01', -320, 0, 0, 6, 2, '160', -1),
(59, 1, 1, 0, '2014-08-02 03:59:19', '2014-08-02 01:19:47', '', 2, '2014-05-01', '2014-06-02', 85, 0, 2, 6, 2, '160', -1),
(60, 1, 1, 0, '2014-08-02 04:00:57', '2014-08-02 01:19:47', '', 2, '2014-06-02', '2014-05-31', -85, 0, 5, 6, 2, '160', -1),
(61, 1, 1, 0, '2014-08-02 04:01:36', '2014-08-02 01:19:47', '', 2, '2014-05-31', '2014-05-31', 0, 0, 5, 6, 2, '160', -1),
(62, 1, 1, 0, '2014-08-02 04:01:51', '2014-08-02 01:19:47', '', 2, '2014-05-31', '2014-06-01', 0, 0, 5, 6, 2, '160', -1),
(63, 1, 1, 0, '2014-08-02 04:02:18', '2014-08-02 01:19:47', '', 2, '2014-06-01', '2014-06-01', 0, 0, 5, 6, 2, '160', -1),
(64, 1, 1, 0, '2014-08-02 04:02:31', '2014-08-02 01:19:47', '', 2, '2014-06-01', '2014-05-31', 0, 0, 5, 6, 2, '160', -1),
(65, 1, 1, 0, '2014-08-02 04:02:40', '2014-08-02 01:19:47', '', 2, '2014-05-31', '2014-06-02', 85, 0, 2, 6, 2, '160', -1),
(66, 1, 1, 0, '2014-08-02 04:02:47', '2014-08-02 01:19:47', '', 2, '2014-06-02', '2014-06-04', 235, 0, 3, 6, 2, '160', -1),
(67, 1, 1, 0, '2014-08-02 04:33:48', '2014-08-02 01:19:47', '', 2, '0000-00-00', '0000-00-00', 320, 0, 3, 6, 2, '160', -1),
(68, 1, 1, 0, '2014-08-02 04:35:15', '2014-08-02 01:19:47', '', 2, '2014-08-01', '2014-08-05', 320, 0, 3, 6, 2, '160', -1),
(69, 1, 1, 0, '2014-08-02 04:38:22', '2014-08-02 01:19:47', '', 2, '2014-08-01', '2014-08-05', 320, 0, 3, 6, 2, '160', -1),
(70, 1, 0, 0, '2014-08-02 04:38:42', '2014-08-02 04:45:58', '', 2, '2014-08-01', '2014-08-14', 615, 1, 4, 6, 2, '160', -1),
(71, 1, 1, 0, '2014-08-02 05:32:21', '0000-00-00 00:00:00', '', 0, '2014-08-01', '2014-08-15', 420, 0, 4, 4, 6, '163', 0),
(72, 1, 1, 0, '2014-08-02 05:33:02', '0000-00-00 00:00:00', '', 0, '2014-08-01', '2014-08-06', 230, 0, 3, 4, 6, '163', 0),
(73, 1, 1, 0, '2014-08-02 05:33:54', '0000-00-00 00:00:00', '', 0, '2014-08-01', '2014-08-06', 230, 0, 3, 4, 6, '163', 0),
(74, 1, 1, 0, '2014-08-02 05:39:21', '0000-00-00 00:00:00', '', 0, '2014-08-01', '2014-08-06', 380, 0, 3, 4, 5, '160', 0),
(75, 1, 1, 0, '2014-08-02 05:45:25', '0000-00-00 00:00:00', '', 0, '2014-08-01', '2014-08-06', 380, 0, 3, 4, 5, '160', 0),
(76, 1, 1, 0, '2014-08-02 05:47:15', '0000-00-00 00:00:00', '', 0, '2014-08-01', '2014-08-09', 560, 0, 3, 4, 5, '160', 0),
(77, 1, 0, 0, '2014-08-02 05:47:15', '0000-00-00 00:00:00', '', 0, '2014-08-01', '2014-08-09', 320, 0, 3, 4, 6, '163', 0),
(78, 1, 0, 0, '2014-08-02 05:47:15', '0000-00-00 00:00:00', '', 0, '2014-08-01', '2014-08-09', 560, 0, 3, 1, 7, '160', 0),
(79, 1, 0, 0, '2014-08-02 05:51:06', '0000-00-00 00:00:00', '', 0, '2014-08-15', '2014-08-05', 0, 0, 0, 4, 5, '160', 0),
(80, 1, 1, 0, '2014-08-02 09:01:13', '0000-00-00 00:00:00', '', 0, '2014-06-16', '2014-06-18', 50, 0, 5, 4, 4, '163', 0),
(81, 1, 0, 0, '2014-08-02 09:05:11', '0000-00-00 00:00:00', '', 0, '2014-08-01', '2014-08-05', 200, 0, 3, 4, 4, '163', 0),
(82, 1, 0, 0, '2014-08-02 09:54:21', '0000-00-00 00:00:00', '', 2, '2014-06-18', '2014-06-25', 350, 0, 5, 6, 1, '162', 0),
(84, 1, 0, 0, '2014-08-11 04:11:26', '0000-00-00 00:00:00', '', 0, '2014-06-16', '2014-06-18', 100, 0, 5, 4, 3, '160', 0),
(85, 1, 1, 0, '2014-08-16 09:59:48', '0000-00-00 00:00:00', '', 6, '2014-08-01', '2014-08-07', 440, 0, 3, 0, 49, '177', 0),
(86, 1, 0, 0, '2014-08-16 10:31:17', '2014-08-16 10:31:53', '', 6, '2014-08-08', '2014-08-15', 500, 1, 3, 0, 49, '177', -1),
(87, 1, 0, 0, '2014-08-16 10:32:57', '2014-08-16 10:31:53', '', 6, '2014-08-15', '2014-08-13', -120, 0, 3, 0, 49, '177', -1),
(90, 1, 1, 0, '2014-08-18 08:56:49', '0000-00-00 00:00:00', '', 6, '2014-08-01', '2014-08-07', 440, 0, 3, 0, 50, '178', 0),
(91, 1, 0, 0, '2014-08-18 08:56:49', '0000-00-00 00:00:00', '', 0, '2014-08-01', '2014-08-07', 0, 0, 0, 0, 51, '179', 0),
(92, 1, 0, 0, '2014-08-18 09:05:07', '2014-08-18 09:07:10', '', 6, '2014-08-02', '2014-08-06', 200, 1, 5, 0, 50, '178', -1),
(93, 1, 0, 0, '2014-08-18 09:09:33', '2014-08-18 09:07:10', '', 6, '2014-08-06', '2014-08-09', 180, 0, 3, 0, 50, '178', -1),
(94, 1, 0, 0, '2014-08-19 05:51:48', '0000-00-00 00:00:00', '', 5, '2014-08-01', '2014-08-06', 0, 0, 0, 0, 54, '183', 0),
(95, 1, 0, 0, '2014-08-19 05:51:48', '0000-00-00 00:00:00', '', 5, '2014-08-01', '2014-08-06', 0, 0, 0, 0, 55, '184', 0),
(96, 1, 0, 0, '2014-08-19 05:51:48', '0000-00-00 00:00:00', '', 5, '2014-08-01', '2014-08-06', 0, 0, 0, 0, 56, '185', 0);

-- --------------------------------------------------------

--
-- Table structure for table `fiz_hotels`
--

CREATE TABLE IF NOT EXISTS `fiz_hotels` (
`id` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `delete` int(11) NOT NULL,
  `enabled` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `number` int(11) NOT NULL,
  `room_type` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `fiz_hotels`
--

INSERT INTO `fiz_hotels` (`id`, `modified`, `created`, `delete`, `enabled`, `order`, `title`, `number`, `room_type`) VALUES
(2, '2014-06-18 06:04:49', '2014-06-18 06:01:13', 0, 1, 0, '1', 20, 1),
(3, '2014-06-18 07:46:12', '2014-06-18 06:01:25', 0, 1, 0, '1', 3, 2),
(4, '0000-00-00 00:00:00', '2014-06-29 07:15:36', 0, 1, 0, '2', 20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fiz_hotels_titles`
--

CREATE TABLE IF NOT EXISTS `fiz_hotels_titles` (
`id` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `delete` int(11) NOT NULL,
  `enabled` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `fiz_hotels_titles`
--

INSERT INTO `fiz_hotels_titles` (`id`, `modified`, `created`, `delete`, `enabled`, `order`, `title`) VALUES
(1, '0000-00-00 00:00:00', '2014-06-18 05:59:41', 0, 1, 0, 'faiz'),
(2, '0000-00-00 00:00:00', '2014-06-18 05:59:56', 0, 1, 0, 'sonesta'),
(3, '0000-00-00 00:00:00', '2014-06-18 06:24:17', 0, 1, 0, 'Hilton'),
(4, '0000-00-00 00:00:00', '2014-06-18 06:24:24', 0, 1, 0, 'Novotel'),
(5, '0000-00-00 00:00:00', '2014-06-18 06:24:33', 0, 1, 0, 'Semiramis');

-- --------------------------------------------------------

--
-- Table structure for table `fiz_hotel_rooms`
--

CREATE TABLE IF NOT EXISTS `fiz_hotel_rooms` (
`id` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `delete` int(11) NOT NULL,
  `enabled` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `fiz_hotel_rooms`
--

INSERT INTO `fiz_hotel_rooms` (`id`, `modified`, `created`, `delete`, `enabled`, `order`, `title`) VALUES
(1, '2014-06-18 05:39:14', '2014-06-15 10:27:16', 0, 1, 0, 'single'),
(2, '0000-00-00 00:00:00', '2014-06-18 05:39:34', 0, 1, 0, 'double'),
(3, '0000-00-00 00:00:00', '2014-06-18 06:23:37', 0, 1, 0, 'Triple'),
(4, '0000-00-00 00:00:00', '2014-06-18 06:23:48', 0, 1, 0, 'Quad'),
(5, '0000-00-00 00:00:00', '2014-06-18 06:23:59', 0, 1, 0, 'Room Share');

-- --------------------------------------------------------

--
-- Table structure for table `fiz_lawazim_packages`
--

CREATE TABLE IF NOT EXISTS `fiz_lawazim_packages` (
`id` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `cat_id` text NOT NULL,
  `city` varchar(50) NOT NULL,
  `days_from` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `adut_package_price` varchar(9) NOT NULL,
  `child_package_price` varchar(9) NOT NULL,
  `adult_extra_night` int(11) NOT NULL,
  `child_extra_night` int(11) NOT NULL,
  `adult_transport_per_night` int(11) NOT NULL,
  `child_transport_per_night` int(11) NOT NULL,
  `basic_package_days` int(11) NOT NULL,
  `days_to` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `fiz_lawazim_packages`
--

INSERT INTO `fiz_lawazim_packages` (`id`, `enabled`, `delete`, `order`, `created`, `modified`, `cat_id`, `city`, `days_from`, `title`, `adut_package_price`, `child_package_price`, `adult_extra_night`, `child_extra_night`, `adult_transport_per_night`, `child_transport_per_night`, `basic_package_days`, `days_to`) VALUES
(2, 1, 0, 0, '2014-06-02 14:46:52', '0000-00-00 00:00:00', '1', '1', 1, 'Transit Package', '85', '55', 85, 55, 0, 0, 1, 2),
(3, 1, 0, 0, '2014-06-02 14:47:44', '0000-00-00 00:00:00', '1', '1', 3, 'Standard Package', '320', '200', 60, 30, 0, 0, 4, 9),
(4, 1, 0, 0, '2014-06-02 14:49:22', '2014-06-02 15:34:39', '1', '1', 10, '10 Nights plus', '450', '320', 55, 25, 0, 0, 10, 1000),
(5, 1, 0, 0, '2014-06-02 16:44:36', '0000-00-00 00:00:00', '2', '1', 0, 'Safar Package', '0', '25', 50, 25, 0, 0, 0, 100);

-- --------------------------------------------------------

--
-- Table structure for table `fiz_lawazim_packages_cat`
--

CREATE TABLE IF NOT EXISTS `fiz_lawazim_packages_cat` (
`id` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `cat_id` text NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `fiz_lawazim_packages_cat`
--

INSERT INTO `fiz_lawazim_packages_cat` (`id`, `enabled`, `delete`, `order`, `created`, `modified`, `cat_id`, `title`) VALUES
(1, 1, 0, 0, '2014-06-02 14:42:47', '0000-00-00 00:00:00', '', 'Qahera Packages'),
(2, 1, 0, 0, '2014-06-02 16:43:18', '0000-00-00 00:00:00', '', 'Safar Packages');

-- --------------------------------------------------------

--
-- Table structure for table `fiz_raza_types`
--

CREATE TABLE IF NOT EXISTS `fiz_raza_types` (
`id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `des` text NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `pkgs` text NOT NULL,
  `views_modules` text NOT NULL,
  `safar_text` text NOT NULL,
  `save_text` text NOT NULL,
  `update_text` text NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `fiz_raza_types`
--

INSERT INTO `fiz_raza_types` (`id`, `title`, `des`, `modified`, `created`, `enabled`, `order`, `delete`, `pkgs`, `views_modules`, `safar_text`, `save_text`, `update_text`) VALUES
(1, 'House Stay', 'I would like to stay at someones place. The host ITS ID is', '2014-07-23 20:29:31', '2014-07-20 17:52:22', 1, 0, 0, ',-1', ',host_its_id', '', '<p>Your reservation booking has been created successfully. You will receive an email with your reservation details.</p>', 'Your reservation details have been updated successfully. You will receive an email with the updated details.'),
(2, 'Faiz ', 'I would like Faiz to handle my accomodation for me and my group', '2014-07-23 20:28:55', '2014-07-20 17:52:33', 1, 0, 0, ',1,2', ',lawazim', '', '<p>Your reservation booking has been created successfully. You will receive an email with your reservation details.</p>', 'Your reservation details have been updated successfully. You will receive an email with the updated details.');

-- --------------------------------------------------------

--
-- Table structure for table `fiz_reservation`
--

CREATE TABLE IF NOT EXISTS `fiz_reservation` (
`id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `booking_owner` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `remarks` text NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `planner_options` varchar(50) NOT NULL,
  `airport_pickup` tinyint(4) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=97 ;

--
-- Dumping data for table `fiz_reservation`
--

INSERT INTO `fiz_reservation` (`id`, `reservation_id`, `booking_owner`, `email`, `remarks`, `mobile`, `planner_options`, `airport_pickup`, `enabled`, `delete`, `order`, `created`, `modified`) VALUES
(90, 13, 160, 'mohammad.mukadam@gmail.com', '', '+917767845753', '', 0, 1, 0, 0, '2015-03-20 17:14:28', '0000-00-00 00:00:00'),
(91, 13, 186, 'anjumanekalimi@gmai.com', '', '', '', 0, 1, 0, 0, '2015-03-20 17:14:47', '0000-00-00 00:00:00'),
(3, 2, 0, 'azizms@gmail.com', 'sddsd', '2029029', '', 0, 1, 0, 0, '0000-00-00 00:00:00', '2015-03-20 15:17:55'),
(4, 2, 0, 'azizms@gmail.com', 'sddsd', '2029029', '', 0, 1, 0, 0, '0000-00-00 00:00:00', '2015-03-20 15:17:55'),
(5, 3, 0, 'azizms@gmail.com', 'sddsd', '2029029', '', 0, 1, 0, 0, '0000-00-00 00:00:00', '2015-03-20 15:17:55'),
(6, 3, 0, 'azizms@gmail.com', 'sddsd', '2029029', '', 0, 1, 0, 0, '0000-00-00 00:00:00', '2015-03-20 15:17:55'),
(7, 4, 0, 'azizms@gmail.com', 'sddsd', '2029029', '', 0, 1, 0, 0, '0000-00-00 00:00:00', '2015-03-20 15:17:55'),
(8, 4, 0, 'azizms@gmail.com', 'sddsd', '2029029', '', 0, 1, 0, 0, '0000-00-00 00:00:00', '2015-03-20 15:17:55'),
(9, 4, 0, 'azizms@gmail.com', 'sddsd', '2029029', '', 0, 1, 0, 0, '0000-00-00 00:00:00', '2015-03-20 15:17:55'),
(10, 5, 0, 'azizms@gmail.com', 'sddsd', '2029029', '', 0, 1, 0, 0, '0000-00-00 00:00:00', '2015-03-20 15:17:55'),
(11, 5, 0, 'azizms@gmail.com', 'sddsd', '2029029', '', 0, 1, 0, 0, '0000-00-00 00:00:00', '2015-03-20 15:17:55'),
(12, 5, 0, 'azizms@gmail.com', 'sddsd', '2029029', '', 0, 1, 0, 0, '0000-00-00 00:00:00', '2015-03-20 15:17:55'),
(68, 6, 173, '', '', '+919664907864', '', 0, 1, 0, 0, '2015-03-20 14:55:37', '2015-03-20 17:59:24'),
(14, 7, 0, 'azizms@gmail.com', '33434', '1212121', '', 0, 1, 0, 0, '2014-06-29 06:56:16', '2015-03-20 15:17:55'),
(15, 8, 0, 'azizms@gmail.com', '33434', '1212121', '', 0, 1, 0, 0, '2014-06-29 06:57:55', '2015-03-20 15:17:55'),
(66, 6, 173, '', '', '', '', 0, 1, 0, 0, '2015-03-20 14:51:06', '2015-03-20 17:59:24'),
(67, 6, 173, 'shabbarghadiyali@gmail.com', '', '+919928279269', '', 0, 1, 0, 0, '2015-03-20 14:52:47', '2015-03-20 17:59:24'),
(28, 2, 0, '', '', '', '', 0, 1, 0, 0, '2014-07-21 16:16:57', '2015-03-20 15:17:55'),
(29, 3, 0, '', '', '', '', 0, 1, 0, 0, '2014-07-21 16:17:00', '2015-03-20 15:17:55'),
(30, 4, 0, '', '', '', '', 0, 1, 0, 0, '2014-07-21 16:22:29', '2015-03-20 15:17:55'),
(31, 5, 160, 'azizms@gmail.com', '', '201222489051', '', 0, 1, 0, 0, '2014-07-21 16:25:41', '2015-03-20 14:58:01'),
(32, 6, 173, 'azizms@gmail.com', '', '201222489051', '', 0, 1, 0, 0, '2014-07-21 16:29:24', '2015-03-20 17:59:24'),
(33, 5, 160, 'undefined', '', '', '', 0, 1, 0, 0, '2014-07-21 16:45:42', '2015-03-20 14:58:01'),
(34, 5, 160, 'undefined', '', '', '', 0, 1, 0, 0, '2014-07-21 16:48:21', '2015-03-20 14:58:01'),
(35, 5, 160, 'azizms@gmail.com', '', '201222489051', '', 0, 1, 0, 0, '2014-07-21 16:48:43', '2015-03-20 14:58:01'),
(36, 5, 160, 'tid_88@hotmail.com', '', '+971503845472', '', 0, 1, 0, 0, '2014-07-22 14:29:30', '2015-03-20 14:58:01'),
(37, 5, 160, 'ekbal63@gmail.com', '', '+971507650681', '', 0, 1, 0, 0, '2014-07-23 16:32:01', '2015-03-20 14:58:01'),
(38, 5, 160, 'abbas.s.husain@gmail.com', '', '+971503504786', '', 0, 1, 0, 0, '2014-07-23 16:34:12', '2015-03-20 14:58:01'),
(39, 5, 168, 'mshakirvasi@gmail.com', 'THisi s new booking', '+971506761525', '', 0, 1, 0, 0, '2014-07-23 20:17:30', '2014-07-27 17:17:27'),
(40, 5, 168, 'azizms@gmail.com', '', '+971503557882', '', 0, 1, 0, 0, '2014-07-23 20:20:03', '2014-07-27 17:17:27'),
(41, 5, 168, 'pratapgarhjamaat@gmail.com', '', '918696160606', '', 0, 1, 0, 0, '2014-07-23 20:38:45', '2014-07-27 17:17:27'),
(42, 5, 160, 'aqhamidi@gmail.com', '', '+971551287652', '', 0, 1, 0, 0, '2014-07-24 16:34:47', '2015-03-20 14:58:01'),
(43, 5, 168, 'saifee.tarwala@gmail.com', '', '+919377718873', '', 0, 1, 0, 0, '2014-07-25 05:39:47', '2014-07-27 17:17:27'),
(44, 5, 168, 'safdiwan@yahoo.com', '', '', '', 0, 1, 0, 0, '2014-07-25 05:52:34', '2014-07-27 17:17:27'),
(45, 6, 173, 'mustafa.batul@yahoo.com', '', '+971506502095', '', 0, 1, 0, 0, '2014-07-31 18:58:41', '2015-03-20 17:59:24'),
(46, 6, 173, 'zoher@emirates.net.ae', '', '+971504581406', '', 0, 1, 0, 0, '2014-07-31 18:58:48', '2015-03-20 17:59:24'),
(47, 6, 173, 'raju522000@yahoo.com', '', '+971506760251', '', 0, 1, 0, 0, '2014-07-31 18:59:06', '2015-03-20 17:59:24'),
(48, 7, 176, 'alijawadubai@gmail.com', '', '+971506539150', '', 0, 1, 0, 0, '2014-08-16 09:46:35', '2014-08-16 09:53:18'),
(49, 7, 176, 'mnasikwala2002@yahoo.com', 'This is remarks', '+971501914082', '', 0, 1, 0, 0, '2014-08-16 09:46:52', '2014-08-16 09:53:18'),
(50, 8, 178, 'mufaddalshehabi@gmail.com', 'fgfg', '+201224211510', '', 0, 1, 0, 0, '2014-08-18 06:00:02', '2014-08-18 07:02:33'),
(51, 8, 178, 'murtaza.shehabi@gmail.com', 'fgfg', '+201225285192', '', 0, 1, 0, 0, '2014-08-18 06:00:28', '2014-08-18 07:02:33'),
(52, 9, 180, 'mustafaqasim@gmail.com', '', '+201222148734', '', 0, 1, 0, 0, '2014-08-18 06:56:18', '0000-00-00 00:00:00'),
(53, 9, 180, 'mustafaqasim@gmail.com', '', '+201222148734', '', 0, 1, 0, 0, '2014-08-18 06:56:27', '0000-00-00 00:00:00'),
(54, 10, 183, 'hussainvajihi@gmail.com', 'dfddf', '+201224261370', '', 0, 1, 0, 0, '2014-08-19 05:35:57', '2014-08-19 05:48:10'),
(55, 10, 183, 'qusaih@hotmail.com', 'dfddf', '+919167855766', '', 0, 1, 0, 0, '2014-08-19 05:36:12', '2014-08-19 05:48:10'),
(56, 10, 183, 'ummehani.vajihi@gmail.com', 'dfddf', '+201094521952', '', 0, 1, 0, 0, '2014-08-19 05:36:46', '2014-08-19 05:48:10'),
(95, 14, 186, 'moiz26@hotmail.com', '', '+447948289929', '', 0, 1, 0, 0, '2015-03-20 17:17:34', '2015-03-20 17:18:24'),
(92, 14, 186, 'alijawadubai@gmail.com', '', '918238710669', '', 0, 1, 0, 0, '2015-03-20 17:16:40', '2015-03-20 17:18:24'),
(80, 12, 186, 'sarrahsaasa@gmail.com', '', '+971508579566', '', 0, 1, 0, 0, '2015-03-20 16:58:18', '0000-00-00 00:00:00'),
(96, 15, 194, 'shabbir@gficg.com', '', '+971506881869', '', 0, 1, 0, 0, '2015-03-20 17:49:15', '2015-03-20 18:04:29');

-- --------------------------------------------------------

--
-- Table structure for table `fiz_reservation_settings`
--

CREATE TABLE IF NOT EXISTS `fiz_reservation_settings` (
`id` int(11) NOT NULL,
  `new_email_subject` varchar(255) NOT NULL,
  `email_from` text NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `cat_id` text NOT NULL,
  `package_category` varchar(255) NOT NULL,
  `email_from_name` varchar(255) NOT NULL,
  `email_copy` text NOT NULL,
  `edit_email_subject` varchar(255) NOT NULL,
  `delete_email_subject` varchar(255) NOT NULL,
  `email_new_template` int(11) NOT NULL,
  `email_edit_template` int(11) NOT NULL,
  `email_delete_template` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `des` text NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `fiz_reservation_settings`
--

INSERT INTO `fiz_reservation_settings` (`id`, `new_email_subject`, `email_from`, `enabled`, `delete`, `order`, `created`, `modified`, `cat_id`, `package_category`, `email_from_name`, `email_copy`, `edit_email_subject`, `delete_email_subject`, `email_new_template`, `email_edit_template`, `email_delete_template`, `title`, `des`) VALUES
(1, 'New Reservation', 'Faiz Reservations', 1, 0, 0, '2014-06-03 00:00:00', '2014-06-02 16:43:51', '', ',1,2', '0', 'azizms@gmail.com', 'Edit Reservation', 'Delete Reservation', 348, 348, 348, 'New', 'fsdfds sdfsdf sdfsd sdfsd sdfsdf');

-- --------------------------------------------------------

--
-- Table structure for table `fiz_reservation_users_xref`
--

CREATE TABLE IF NOT EXISTS `fiz_reservation_users_xref` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL DEFAULT '0',
  `reservation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `airline` varchar(255) NOT NULL,
  `airline_code` varchar(255) NOT NULL,
  `arriving_from` varchar(255) NOT NULL,
  `individual_id` varchar(255) NOT NULL,
  `its_id` varchar(255) NOT NULL,
  `arrived` tinyint(4) NOT NULL,
  `raza_type` varchar(255) NOT NULL,
  `approved` tinyint(4) NOT NULL,
  `host_its_id` text NOT NULL,
  `arrival_date` datetime NOT NULL,
  `departure_date` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `fiz_reservation_users_xref`
--

INSERT INTO `fiz_reservation_users_xref` (`id`, `created`, `modified`, `enabled`, `order`, `delete`, `reservation_id`, `user_id`, `airline`, `airline_code`, `arriving_from`, `individual_id`, `its_id`, `arrived`, `raza_type`, `approved`, `host_its_id`, `arrival_date`, `departure_date`) VALUES
(5, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 90, 186, '', '', '', '', '30385154', 0, '', 0, '', '2015-04-04 04:11:11', '2015-04-30 00:00:00'),
(4, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 90, 160, '', '', '', '', '30385154', 0, '', 0, '', '2015-04-04 04:11:11', '2015-04-30 00:00:00'),
(6, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 31, 160, '', '', '', '', '30385154', 0, '', 0, '', '2015-03-30 00:00:00', '2015-04-01 00:00:00'),
(7, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 35, 160, '', '', '', '', '30385154', 0, '', 0, '', '2015-03-17 00:00:00', '2015-04-01 00:00:00'),
(8, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 35, 162, '', '', '', '', '30385154', 0, '', 0, '', '2015-03-17 00:00:00', '2015-04-01 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `fiz_voucher`
--

CREATE TABLE IF NOT EXISTS `fiz_voucher` (
`id` int(11) NOT NULL,
  `user_id` int(255) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `delete` int(11) NOT NULL,
  `enabled` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `v_checkin` date NOT NULL,
  `v_checkout` date NOT NULL,
  `history` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `rooms_data` text NOT NULL,
  `remarks` text NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `fiz_voucher`
--

INSERT INTO `fiz_voucher` (`id`, `user_id`, `reservation_id`, `modified`, `created`, `delete`, `enabled`, `order`, `v_checkin`, `v_checkout`, `history`, `hotel_id`, `rooms_data`, `remarks`, `status`) VALUES
(1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0, '2014-06-16', '2014-06-18', 0, 1, 'room_single=>5__room_double=>6__', '', ''),
(2, 0, 0, '0000-00-00 00:00:00', '2014-07-23 16:12:31', 0, 0, 0, '2014-06-18', '0000-00-00', 0, 0, 'room_single=>5__room_double=>6__', '', ''),
(3, 0, 0, '0000-00-00 00:00:00', '2014-07-23 16:12:31', 0, 0, 0, '0000-00-00', '0000-00-00', 0, 0, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `fiz_voucher_xref`
--

CREATE TABLE IF NOT EXISTS `fiz_voucher_xref` (
`id` int(11) NOT NULL,
  `reservation_id` int(255) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `delete` int(11) NOT NULL,
  `enabled` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `fiz_voucher_xref`
--

INSERT INTO `fiz_voucher_xref` (`id`, `reservation_id`, `voucher_id`, `modified`, `created`, `delete`, `enabled`, `order`, `status`) VALUES
(1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0, ''),
(2, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0, ''),
(3, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0, ''),
(4, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0, ''),
(5, 0, 2, '0000-00-00 00:00:00', '2014-07-23 16:12:31', 0, 0, 0, 'cut'),
(6, 0, 3, '0000-00-00 00:00:00', '2014-07-23 16:12:31', 0, 0, 0, 'trns');

-- --------------------------------------------------------

--
-- Table structure for table `lawazim_packages`
--

CREATE TABLE IF NOT EXISTS `lawazim_packages` (
`id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `cat_id` text NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `menu_itmes`
--

CREATE TABLE IF NOT EXISTS `menu_itmes` (
`id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `mei_background` varchar(255) DEFAULT NULL,
  `mei_image` text,
  `mei_options` text,
  `mei_morecss` text,
  `mei_title` varchar(255) NOT NULL,
  `mei_alias` varchar(25) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `mei_home` tinyint(4) NOT NULL,
  `properties` text NOT NULL,
  `mei_main` text NOT NULL,
  `cat_id` int(11) NOT NULL DEFAULT '0',
  `mei_template` varchar(25) NOT NULL,
  `show` varchar(255) NOT NULL,
  `mei_comment` text NOT NULL,
  `openType` tinyint(4) NOT NULL,
  `main_link` tinyint(4) NOT NULL DEFAULT '0',
  `permission` text NOT NULL,
  `permission_all` tinyint(4) NOT NULL,
  `description` text NOT NULL,
  `keywords` text NOT NULL,
  `header` text NOT NULL,
  `site` text NOT NULL,
  `all_site` tinyint(4) NOT NULL,
  `color` varchar(255) NOT NULL,
  `permission_gust` tinyint(4) NOT NULL,
  `property__url` text NOT NULL,
  `addstatus` text NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=373 ;

--
-- Dumping data for table `menu_itmes`
--

INSERT INTO `menu_itmes` (`id`, `parent_id`, `mei_background`, `mei_image`, `mei_options`, `mei_morecss`, `mei_title`, `mei_alias`, `modified`, `created`, `enabled`, `order`, `delete`, `mei_home`, `properties`, `mei_main`, `cat_id`, `mei_template`, `show`, `mei_comment`, `openType`, `main_link`, `permission`, `permission_all`, `description`, `keywords`, `header`, `site`, `all_site`, `color`, `permission_gust`, `property__url`, `addstatus`) VALUES
(223, 14, NULL, NULL, NULL, NULL, 'Contact Us', 'Contact-Us-bottom', '2013-05-28 00:00:00', '2013-04-17 05:36:05', 1, 160, 0, 0, 'imagegallery__;selectcode__110;', 'com_html', 0, '', '1', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '', ''),
(225, 14, NULL, NULL, NULL, NULL, 'Business', 'Business', '2013-05-28 00:00:00', '2013-04-17 05:36:05', 1, 162, 0, 0, 'imagegallery__;selectcode__110;', 'com_html', 0, '', '1', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '', ''),
(226, 14, NULL, NULL, NULL, NULL, 'Edit Reservation', 'Edit-Reservation-down', '2013-05-28 00:00:00', '2013-04-17 05:36:05', 1, 163, 0, 0, 'imagegallery__;selectcode__110;', 'com_html', 0, '', '1', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '', ''),
(227, 14, NULL, NULL, NULL, NULL, 'FAQ', 'FAQ-down', '2013-05-28 00:00:00', '2013-04-17 05:36:05', 1, 164, 0, 0, 'imagegallery__;selectcode__110;', 'com_html', 0, '', '1', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '', ''),
(218, 0, NULL, NULL, NULL, '', 'F.A.Q', 'F.A.Q', '2013-12-10 00:00:00', '2013-04-16 05:17:16', 1, 157, 0, 0, 'faqtype__0;faqstyle__list;', 'com_faq', 0, '', '1', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '', ''),
(219, 14, NULL, NULL, NULL, '', 'Home', 'home', '2014-05-25 08:38:05', '2013-04-17 05:36:05', 1, 156, 0, 0, 'imagegallery__;selectcode__110;', 'com_html', -1, '', '1', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '', ''),
(220, 14, NULL, NULL, NULL, NULL, 'Cairo', 'Cairo', '2013-05-28 00:00:00', '2013-04-17 05:36:05', 1, 157, 0, 0, 'imagegallery__;selectcode__110;', 'com_html', 0, '', '1', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '', ''),
(221, 14, NULL, NULL, NULL, NULL, 'Standard', 'Standard', '2013-05-28 00:00:00', '2013-04-17 05:36:05', 1, 158, 0, 0, 'imagegallery__;selectcode__110;', 'com_html', 0, '', '1', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '', ''),
(222, 14, NULL, NULL, NULL, NULL, 'Reservation', 'Reservation', '2013-05-28 00:00:00', '2013-04-17 05:36:05', 1, 159, 0, 0, 'imagegallery__;selectcode__110;', 'com_html', 0, '', '1', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '', ''),
(199, 0, NULL, NULL, NULL, '', 'ABOUT2', 'ABOUT2', '2013-12-09 00:00:00', '2013-04-15 14:40:24', 1, 154, 0, 0, 'imagegallery__;selectcode__;', 'com_html', 0, '', '0', '', 1, 1, '', 1, '', '', '', '', 1, '', 0, '', ''),
(214, 0, NULL, NULL, NULL, '', 'HOME', 'home', '2013-12-11 00:00:00', '2013-04-15 14:49:04', 1, 156, 0, 0, 'imagegallery__;selectcode__128;', 'com_html', 0, '', '1', '', 1, 1, '', 1, '', '', '', '', 1, '', 0, '', ''),
(215, 0, NULL, NULL, NULL, '', 'Contact Us', 'Contact-Us', '2013-12-10 00:00:00', '2013-04-15 14:49:04', 1, 156, 0, 0, 'contect__5;title__cmail;formlabel__empcland@gmail.com;formmail__empcland@gmail.com;showmap__0;width__;height__;Lat__;Lng__;zoom__14;markerTitle__;intro__;markerData__;', 'com_contect', 0, '', '1', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '', ''),
(232, 14, NULL, NULL, NULL, NULL, 'Guestbook', 'Guestbook-down', '2013-05-28 00:00:00', '2013-04-17 05:36:05', 1, 168, 0, 0, 'imagegallery__;selectcode__110;', 'com_html', 0, '', '1', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '', ''),
(233, 14, NULL, NULL, NULL, '', '-', 'ph', '2015-04-01 10:43:57', '2013-04-17 05:36:05', 1, 169, 0, 0, 'imagegallery__;selectcode__110;', 'com_html', 0, '', '1', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '', ''),
(234, 14, NULL, NULL, NULL, NULL, '-', '#', '2013-05-28 00:00:00', '2013-04-17 05:36:05', 1, 170, 0, 0, 'imagegallery__;selectcode__110;', 'com_html', 0, '', '1', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '', ''),
(235, 14, NULL, NULL, NULL, NULL, 'Virtual Tours', 'Virtual-Tours-Down', '2013-05-28 00:00:00', '2013-04-17 05:36:05', 1, 171, 0, 0, 'imagegallery__;selectcode__110;', 'com_html', 0, '', '1', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '', ''),
(237, 8, NULL, NULL, NULL, NULL, 'Outside Faiz', 'Outside-Faiz', '0000-00-00 00:00:00', '2013-05-29 08:14:38', 1, 173, 0, 0, 'url__#;', 'GET__com', 236, '', '1', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '', ''),
(238, 0, '', '', '', '', 'DataTest', 'DataTest', '2013-09-02 00:00:00', '0000-00-00 00:00:00', 1, 174, 0, 0, 'data__12;', 'com_data', 0, '', '1', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '', ''),
(241, 15, NULL, NULL, NULL, '', 'Instructions for safar	', 'Instructions-for-safar', '0000-00-00 00:00:00', '2013-10-22 04:50:57', 1, 176, 0, 0, 'imagegallery__;selectcode__110;', 'com_html', 0, '', '1', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '', ''),
(242, 15, NULL, NULL, NULL, '', 'about1', 'about1', '2013-12-10 00:00:00', '2013-10-22 04:51:11', 1, 177, 0, 0, 'imagegallery__;selectcode__;', 'com_html', 0, '', '1', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '', ''),
(243, 15, NULL, NULL, NULL, '', 'Copyright', 'Copyright', '0000-00-00 00:00:00', '2013-10-22 04:51:24', 1, 178, 0, 0, 'imagegallery__;selectcode__124;', 'com_html', 0, '', '1', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '', ''),
(244, 15, NULL, NULL, NULL, '', 'Step 1', 'Step-1', '0000-00-00 00:00:00', '2013-10-22 04:51:36', 1, 179, 0, 0, 'imagegallery__;selectcode__125;', 'com_html', 0, '', '1', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '', ''),
(245, 15, '', '', '', '', 'Cairo222', 'Cairo222', '2013-11-04 00:00:00', '2013-04-17 06:24:57', 1, 159, 0, 0, 'cat_id__36;nums__3;catPageViewTitle__1;catPageViewImage__1;catPageViewDes__1;catPageViewHist__0;catPageViewAuthor__0;catPageViewDate__0;desLimit__20;shareView__0;introInBody__0;thimageinBody__0;comment__0;', 'com_content_article', 0, '', '1', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '', ''),
(246, 15, '', '', '', '', 'Accomodation', 'Accomodation', '2013-11-05 00:00:00', '2013-04-15 14:47:08', 1, 155, 0, 0, 'gallery__65;rowNumbers__10;catPageViewTitle__1;catPageViewImage__1;catPageViewDes__0;catPageViewHist__0;', 'com_images_gallery', 0, '', '1', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '', ''),
(249, 18, NULL, NULL, NULL, '', 'faiz', 'faizfaiz', '2013-12-04 00:00:00', '2013-12-04 18:35:12', 1, 182, 0, 0, 'url__#;', 'com_link', 0, '', '0', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '', ''),
(251, 8, NULL, NULL, NULL, '', 'app', 'app', '0000-00-00 00:00:00', '2013-12-09 17:29:45', 1, 184, 0, 0, 'url__;', '', 230, '', '1', '', 1, 1, '', 0, '', '', '', '', 0, '', 0, '', ''),
(372, 19, NULL, NULL, NULL, '', 'Test', 'Test', '0000-00-00 00:00:00', '2015-04-01 22:54:54', 1, 277, 0, 0, '', 'com_link', 0, '', '1', '', 0, 1, '', 1, '', '', '', '', 0, '', 0, '#', ''),
(352, 8, '', '532daeba2a36e.png', '', '', 'Egypt At A Glance', 'Egypt-At-A-Glance', '2015-03-30 18:37:13', '2014-01-22 07:56:58', 1, 219, 0, 0, '', 'com_content_article', 0, '', '1', '', 0, 1, '', 1, '', '', '', '', 1, '89bd3c', 0, '#', ''),
(353, 8, NULL, NULL, NULL, '', 'about', 'about', '2015-03-30 18:37:13', '2014-05-25 08:39:27', 0, 263, 0, 0, '', 'com_html', 0, '', '1', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '', ''),
(354, 14, NULL, NULL, NULL, '', 'Home', 'Home', '2014-05-25 08:54:02', '2014-05-25 08:53:10', 1, 264, 0, 0, '', 'com_html', 0, '', '1', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '', ''),
(355, 10, NULL, NULL, NULL, '', 'Cairo', 'Cairo', '2015-04-02 15:32:02', '2014-05-25 09:04:04', 1, 265, 0, 0, '', 'com_link', 0, '', '1', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '', ',1'),
(356, 10, NULL, NULL, NULL, '', 'Mutah', 'Mutah', '2015-04-02 15:32:02', '2014-05-25 09:04:16', 1, 266, 0, 0, '', 'com_link', 0, '', '1', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '', ',2'),
(357, 10, NULL, NULL, NULL, '', 'Shaam', 'Shaam', '2015-04-02 15:32:02', '2014-05-25 09:04:28', 0, 267, 0, 0, '', 'com_link', 0, '', '0', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '#', ''),
(358, 8, NULL, NULL, NULL, '', 'Virtual Tours', 'Virtual-Tours', '2015-03-30 18:37:13', '2014-05-25 09:17:25', 1, 268, 0, 0, '', 'com_link', 0, '', '1', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '#', ''),
(359, 8, NULL, NULL, NULL, '', 'Accommodation', 'Accommodation', '2015-03-30 18:37:13', '2014-05-25 09:20:36', 1, 269, 0, 0, '', 'com_images_gallery', 358, '', '1', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '', ''),
(360, 8, NULL, NULL, NULL, '', 'ciato', 'ciato', '2015-03-30 18:37:13', '2014-05-25 09:39:42', 0, 270, 0, 0, '', 'com_content_article', 0, '', '0', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '', ''),
(361, 8, NULL, NULL, NULL, '', 'Reservations', 'Reservations', '2015-03-30 18:37:13', '2014-05-29 05:44:16', 0, 271, 0, 0, '', 'fiz_reservations', 0, '', '0', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '', ''),
(362, 14, NULL, NULL, NULL, '', 'rex', 'rex', '2014-06-01 13:31:35', '2014-06-01 10:00:52', 1, 272, 0, 0, '', 'com_wizard', 0, '', '1', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '', ''),
(363, 8, NULL, NULL, NULL, '', 'Faiz Pics', 'Faiz-Pics', '2015-03-30 18:37:13', '2014-07-15 09:30:13', 1, 273, 0, 0, '', 'com_images_gallery', 358, '', '1', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '', ''),
(364, 8, NULL, NULL, NULL, '', 'Fiz Reservations', 'FizReservations', '2015-03-30 18:37:13', '2014-07-20 16:52:18', 1, 274, 0, 0, '', 'fiz_reservations', 0, '', '0', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '', ''),
(365, 13, NULL, NULL, NULL, '', 'home', 'home', '2015-04-01 22:52:40', '2015-03-24 21:42:05', 1, 275, 0, 1, '', 'com_content_article', 0, '', '1', '', 0, 1, '', 1, '', '', '', '', 0, '', 0, '/', ',0'),
(366, 13, '', '', '', '', 'countect us', 'countect-us', '2015-04-01 22:49:46', '2015-03-24 21:42:23', 0, 275, 0, 0, '', 'com_html', 0, '', '0', '', 0, 1, '', 1, '', '', '', '', 0, '', 0, '', ''),
(367, 13, '', '', '', '', 'Gust book', 'Gust-book', '2015-04-01 22:49:46', '2015-03-24 21:42:26', 0, 275, 0, 0, '', 'com_gustbook', 0, '', '0', '', 0, 1, '', 1, '', '', '', '', 0, '', 0, '/', ''),
(368, 13, '', '', '', '', 'F.A.Q', 'F.A.Q', '2015-04-01 22:54:29', '2015-03-24 21:42:32', 0, 275, 0, 0, '', 'com_faq', 0, '', '0', '', 0, 1, '', 1, '', '', '', '', 0, '', 0, '/', ''),
(369, 8, '', '', '', '', 'Reservations', 'Reservations', '2015-03-30 18:37:32', '2015-03-30 01:12:43', 1, 271, 0, 0, '', 'com_wizard', 0, '', '1', '', 0, 1, '', 1, '', '', '', '', 1, '', 0, '', ''),
(370, 13, NULL, NULL, NULL, '', 'New Test', 'New-Test', '2015-04-01 22:49:46', '2015-04-01 22:36:37', 1, 276, 0, 0, '', 'com_link', 0, '', '1', '', 0, 1, '', 1, '', '', '', '', 0, '', 0, '#', '');

-- --------------------------------------------------------

--
-- Table structure for table `menu_itmes_permission_xref`
--

CREATE TABLE IF NOT EXISTS `menu_itmes_permission_xref` (
`id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=93 ;

--
-- Dumping data for table `menu_itmes_permission_xref`
--

INSERT INTO `menu_itmes_permission_xref` (`id`, `item_id`, `cat_id`, `delete`, `order`, `enabled`, `modified`, `created`) VALUES
(31, 171, 4, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 171, 3, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 176, 3, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 178, 4, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 166, 4, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 178, 3, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 180, 3, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 182, 3, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 182, 4, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 240, 3, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 239, 3, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 250, 4, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 320, 4, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 320, 3, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 349, 4, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 349, 3, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `menu_itmes_site_xref`
--

CREATE TABLE IF NOT EXISTS `menu_itmes_site_xref` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL DEFAULT '0',
  `item_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `menu_itmes_site_xref`
--

INSERT INTO `menu_itmes_site_xref` (`id`, `created`, `modified`, `enabled`, `order`, `delete`, `item_id`, `cat_id`) VALUES
(2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `menu_xref_com`
--

CREATE TABLE IF NOT EXISTS `menu_xref_com` (
`id` int(11) NOT NULL,
  `mxc_menu_id` int(11) NOT NULL,
  `mxc_com_id` int(11) NOT NULL,
  `properties` text,
  `mxc_morecss` text,
  `order` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `delete` tinyint(4) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `menu_xref_mod`
--

CREATE TABLE IF NOT EXISTS `menu_xref_mod` (
`id` int(11) NOT NULL,
  `mxm_menu_id` int(11) NOT NULL,
  `mxm_mod_id` int(11) NOT NULL,
  `mxm_options` text,
  `mxm_morecss` text,
  `mxm_order` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `delete` tinyint(4) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=879 ;

--
-- Dumping data for table `menu_xref_mod`
--

INSERT INTO `menu_xref_mod` (`id`, `mxm_menu_id`, `mxm_mod_id`, `mxm_options`, `mxm_morecss`, `mxm_order`, `order`, `enabled`, `delete`, `modified`, `created`) VALUES
(333, 149, 150, NULL, NULL, 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(334, 149, 169, NULL, NULL, 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(340, 149, 168, NULL, NULL, 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(341, 149, 166, NULL, NULL, 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(337, 149, 154, NULL, NULL, 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(338, 149, 155, NULL, NULL, 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(339, 149, 148, NULL, NULL, 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(368, 149, 171, NULL, NULL, 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(369, 164, 177, NULL, NULL, 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(373, 164, 178, NULL, NULL, 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(374, 0, 0, NULL, NULL, 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(375, 0, 0, NULL, NULL, 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(376, 0, 0, NULL, NULL, 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(377, 0, 0, NULL, NULL, 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(378, 0, 0, NULL, NULL, 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(624, 164, 179, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(665, 164, 181, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(691, 164, 182, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(660, 164, 183, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(702, 164, 184, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(700, 164, 185, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(694, 164, 187, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(654, 164, 186, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(692, 164, 188, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(661, 164, 189, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(703, 164, 190, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(704, 164, 191, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(706, 164, 197, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(705, 164, 196, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(715, 164, 195, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(693, 164, 194, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(666, 164, 193, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(653, 164, 192, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(722, 164, 203, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(707, 164, 202, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(663, 164, 201, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(696, 164, 200, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(695, 164, 199, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(639, 164, 198, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(721, 164, 204, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(720, 164, 205, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(719, 164, 206, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(718, 164, 207, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(497, 178, 218, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(496, 177, 218, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(498, 166, 225, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(499, 167, 225, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(500, 164, 225, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(501, 174, 225, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(543, 165, 234, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(533, 169, 232, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(532, 170, 232, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(523, 169, 231, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(522, 170, 231, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(521, 171, 231, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(520, 172, 231, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(531, 171, 232, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(542, 168, 234, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(541, 169, 234, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(540, 170, 234, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(539, 171, 234, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(544, 166, 234, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(545, 167, 234, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(712, 164, 236, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(723, 164, 238, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(682, 164, 239, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(698, 164, 245, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(699, 164, 247, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(717, 164, 249, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(725, 164, 250, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(728, 214, 254, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(730, 214, 255, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(745, 214, 258, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(738, 214, 259, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(740, 214, 260, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(742, 214, 261, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(744, 214, 262, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(746, 201, 266, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(748, 303, 272, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(767, 303, 270, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(764, 303, 275, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(753, 303, 269, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(769, 303, 279, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(766, 303, 280, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(827, 219, 287, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '2015-04-01 15:55:13'),
(872, 219, 289, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '2015-04-01 22:43:50'),
(826, 365, 287, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '2015-04-01 15:55:13'),
(864, 359, 290, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '2015-04-01 21:44:13'),
(863, 358, 290, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '2015-04-01 21:44:13'),
(862, 352, 290, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '2015-04-01 21:44:13'),
(861, 251, 290, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '2015-04-01 21:44:13'),
(860, 237, 290, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '2015-04-01 21:44:13'),
(871, 365, 289, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '2015-04-01 22:43:50'),
(823, 365, 291, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '2015-03-25 18:09:56'),
(825, 365, 292, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '2015-03-25 18:10:57'),
(874, 369, 288, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '2015-04-01 22:57:07'),
(878, 352, 293, NULL, NULL, 0, 0, 1, 0, '0000-00-00 00:00:00', '2015-04-02 14:48:57');

-- --------------------------------------------------------

--
-- Table structure for table `menu_xref_tem`
--

CREATE TABLE IF NOT EXISTS `menu_xref_tem` (
`id` int(11) NOT NULL,
  `mxt_menu_id` int(11) NOT NULL,
  `mxt_tem_id` int(11) NOT NULL,
  `mxt_options` text,
  `mxt_morecss` text,
  `order` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `delete` tinyint(4) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `menu_xref_tem`
--

INSERT INTO `menu_xref_tem` (`id`, `mxt_menu_id`, `mxt_tem_id`, `mxt_options`, `mxt_morecss`, `order`, `enabled`, `delete`, `modified`, `created`) VALUES
(28, 351, 118, NULL, NULL, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 343, 74, NULL, NULL, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 345, 120, NULL, NULL, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `menu_xref_template`
--

CREATE TABLE IF NOT EXISTS `menu_xref_template` (
`id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mod_favorites`
--

CREATE TABLE IF NOT EXISTS `mod_favorites` (
`id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `linke` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=149 ;

--
-- Dumping data for table `mod_favorites`
--

INSERT INTO `mod_favorites` (`id`, `title`, `icon`, `linke`, `enabled`, `modified`, `created`, `delete`, `order`) VALUES
(146, 'Modlues_Management', 'images/page_edit.png', '?view=com_modules', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(86, '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(55, '', '', '?view=?parent=com_content_article', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(48, '', '', '?view=?parent=com_content_article', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(73, '', '', '?view=menu_itmes', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(45, '', '', '?view=?parent=com_content_article', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(74, '', '', '?view=menu_itmes', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(56, '', '', '?view=menu_itmes', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(84, '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(85, '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(47, '', '', '?view=?parent=com_content_article', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(38, '', '', '?view=?parent=com_content_article', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(82, '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(83, '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(81, '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(87, '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(88, '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(89, '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(90, '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(91, '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(92, '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(93, '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(94, '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(95, '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(96, '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(97, '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(98, '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(99, '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(124, '', '', '?view=com_contect&', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(121, '', '', '?view=com_contect&', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(122, '', '', '?view=com_contect&', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(123, '', '', '?view=com_contect&', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(110, '', '', '?view=menu_itmes', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(112, '', '', '?view=menu_itmes', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(113, '', '', '?view=menu_itmes', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(114, '', '', '?view=?parent=com_content_article', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(137, 'Top Menu', 'images/menu.png', '?view=menu_itmes&parent=com_menus&parent_id=8', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(126, '', '', '?view=com_contect&', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(127, '', '', '?view=com_contect&mode=edit', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(128, '', '', '?view=com_contect&mode=edit', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(129, '', '', '?view=com_contect&mode=edit', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(136, 'Top Menu', 'images/menu.png', '?view=menu_itmes&parent=com_menus&parent_id=8', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(145, 'Video  Gallery-', '', '?view=com_video_gallery', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(147, 'html', 'images/page_edit.png', '?view=com_html', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(143, '', '', '?parent=com_images_gallery&view=com_images_gallery_categories&mode=edit', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(148, 'images Gallery', 'images/page_edit.png', '?view=com_images_gallery', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `plg_2checkout`
--

CREATE TABLE IF NOT EXISTS `plg_2checkout` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL DEFAULT '0',
  `checkout_url` varchar(255) NOT NULL,
  `sid` varchar(255) NOT NULL,
  `purchase_step` varchar(255) NOT NULL,
  `x_receipt_link_url` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `plg_2checkout`
--

INSERT INTO `plg_2checkout` (`id`, `created`, `modified`, `enabled`, `order`, `delete`, `checkout_url`, `sid`, `purchase_step`, `x_receipt_link_url`) VALUES
(1, '2013-05-01 00:00:00', '2013-05-15 00:00:00', 1, 1, 0, 'https://www.2checkout.com/checkout/purchase', '1834638', 'review-cart', '2');

-- --------------------------------------------------------

--
-- Table structure for table `plg_cart`
--

CREATE TABLE IF NOT EXISTS `plg_cart` (
`id` int(11) NOT NULL,
  `multiItems` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `form` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `addMoreActions` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `com_message` text COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `created` datetime NOT NULL,
  `order` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `users` tinyint(4) NOT NULL,
  `users_settings` int(11) NOT NULL,
  `mobile_confirm` tinyint(4) NOT NULL,
  `collection-fee` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `price-limit` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `mail` int(11) NOT NULL,
  `signupmail` int(11) NOT NULL,
  `mailfrom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mailto` text COLLATE utf8_unicode_ci NOT NULL,
  `mailfrommail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mailsubject` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `plg_cart`
--

INSERT INTO `plg_cart` (`id`, `multiItems`, `form`, `title`, `addMoreActions`, `com_message`, `enabled`, `delete`, `created`, `order`, `modified`, `users`, `users_settings`, `mobile_confirm`, `collection-fee`, `price-limit`, `mail`, `signupmail`, `mailfrom`, `mailto`, `mailfrommail`, `mailsubject`) VALUES
(1, '0', '1', 'def', '0', '', 1, 0, '2014-01-15 12:37:59', 0, '2014-07-01 09:16:58', 1, 0, 1, '10', '1000', -1, -1, 'Madad', 'azizms@gmail.com;empcland@gmail.com', 'payment-noreply@madad.com.eg', ' تاكيد بيانات المساهمة لمشروع @%session::projcetData.title%@');

-- --------------------------------------------------------

--
-- Table structure for table `plg_cart_setting`
--

CREATE TABLE IF NOT EXISTS `plg_cart_setting` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL DEFAULT '0',
  `users` tinyint(4) NOT NULL,
  `mult` tinyint(4) NOT NULL,
  `site` text NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `plg_cart_setting`
--

INSERT INTO `plg_cart_setting` (`id`, `created`, `modified`, `enabled`, `order`, `delete`, `users`, `mult`, `site`, `title`) VALUES
(1, '2013-03-21 07:08:39', '2013-03-22 00:00:00', 1, 0, 0, 10, 0, '1', 'fixedprice'),
(2, '2013-03-21 07:09:59', '2013-03-22 00:00:00', 1, 0, 0, 0, 0, '2', 'ukpostcode'),
(3, '2013-03-21 23:51:13', '2013-03-22 00:00:00', 1, 0, 0, 0, 0, '4', 'country'),
(4, '2013-03-22 02:24:54', '2013-03-22 00:00:00', 1, 0, 0, 0, 0, '3', 'ziprange');

-- --------------------------------------------------------

--
-- Table structure for table `plg_comments`
--

CREATE TABLE IF NOT EXISTS `plg_comments` (
`id` int(11) NOT NULL,
  `ob_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ob_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `com_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `com_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `com_message` text COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `created` datetime NOT NULL,
  `order` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=49 ;

--
-- Dumping data for table `plg_comments`
--

INSERT INTO `plg_comments` (`id`, `ob_id`, `ob_type`, `com_name`, `com_title`, `com_message`, `enabled`, `delete`, `created`, `order`, `modified`, `user_id`) VALUES
(41, '15', 'com_project', '', 'عفوا المشروع جيد بالفعل ', 'عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل ', 1, 0, '2014-03-03 05:33:37', 0, '2014-03-03 05:33:37', 3),
(40, '15', 'com_project', '', 'عفوا المشروع جيد بالفعل ', 'عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل ', 1, 0, '2014-03-03 05:32:32', 0, '2014-03-03 05:32:32', 3),
(39, '15', 'com_project', '', 'عفوا المشروع جيد بالفعل ', 'عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل ', 1, 0, '2014-03-03 05:29:23', 0, '2014-03-03 05:29:23', 3),
(38, '15', 'com_project', '', 'عفوا المشروع جيد بالفعل ', 'عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل ', 1, 0, '2014-03-03 05:28:21', 0, '2014-03-03 05:28:21', 3),
(37, '15', 'com_project', '', 'عفوا المشروع جيد بالفعل ', 'عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل ', 1, 0, '2014-03-03 05:28:08', 0, '2014-03-03 05:28:08', 3),
(36, '15', 'com_project', '', 'عفوا المشروع جيد بالفعل ', 'عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل ', 1, 0, '2014-03-03 05:19:38', 0, '2014-03-03 05:19:38', 3),
(35, '15', 'com_project', '', 'عفوا المشروع جيد بالفعل ', 'عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل ', 1, 0, '2014-03-03 05:18:55', 0, '2014-03-03 05:18:55', 3),
(34, '15', 'com_project', '', 'عفوا المشروع جيد بالفعل ', 'عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل ', 1, 0, '2014-03-03 05:17:30', 0, '2014-03-03 05:17:30', 3),
(33, '15', 'com_project', '', '222222222عفوا المشروع جيد بالفعل ', '<p>عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل</p>', 0, 0, '2014-03-03 05:16:53', 0, '2014-03-05 07:22:13', 3),
(32, '15', 'com_project', '', 'عفوا المشروع جيد بالفعل ', 'عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل عفوا المشروع جيد بالفعل ', 1, 0, '2014-03-03 05:16:31', 0, '2014-03-03 05:16:31', 3),
(42, '11', 'com_project', '', '', '', 1, 0, '2014-03-17 09:31:59', 0, '2014-03-17 09:31:59', 3),
(43, '11', 'com_project', '', '', '', 1, 0, '2014-03-17 09:32:00', 0, '2014-03-17 09:32:00', 3),
(44, '15', 'com_project', '', '', '', 1, 0, '2014-04-02 11:03:15', 0, '2014-04-02 11:03:15', 3),
(45, '15', 'com_project', '', '', '', 1, 0, '2014-04-02 11:03:22', 0, '2014-04-02 11:03:22', 3),
(46, '19', 'com_project', '', 'Hello', 'this is testing the comments', 1, 0, '2014-04-03 01:33:41', 0, '2014-04-03 01:33:41', 3),
(47, '19', 'com_project', '', '', '', 1, 0, '2014-04-03 03:25:05', 0, '2014-04-03 03:25:05', 3),
(48, '19', 'com_project', '', 'this is secone comment', 'i would like to point out that this is a good project', 1, 0, '2014-04-03 03:25:51', 0, '2014-04-03 03:25:51', 3);

-- --------------------------------------------------------

--
-- Table structure for table `plg_coupon`
--

CREATE TABLE IF NOT EXISTS `plg_coupon` (
`id` int(11) NOT NULL,
  `code` varchar(255) CHARACTER SET latin1 NOT NULL,
  `edate` date NOT NULL,
  `savings` varchar(255) CHARACTER SET latin1 NOT NULL,
  `savings-type` varchar(255) CHARACTER SET latin1 NOT NULL,
  `minmum-purchase` int(11) NOT NULL,
  `usetype` varchar(255) CHARACTER SET latin1 NOT NULL,
  `products` text CHARACTER SET latin1 NOT NULL,
  `usenums` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL DEFAULT '0',
  `maxuse` int(11) NOT NULL,
  `cat_id` text NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `plg_coupon`
--

INSERT INTO `plg_coupon` (`id`, `code`, `edate`, `savings`, `savings-type`, `minmum-purchase`, `usetype`, `products`, `usenums`, `created`, `modified`, `enabled`, `order`, `delete`, `maxuse`, `cat_id`) VALUES
(1, '0952', '2013-02-07', '5', '     pric', 5, 'Coupon applied! You get 5% off all our products. Enjoy!', '63,64,65', 0, '2013-02-28 02:45:43', '2013-03-17 00:00:00', 1, 0, 0, 1, '62,54,55,56,52,53,63,64,65,66,67,68,69,70,71,72,73'),
(2, '0953', '0000-00-00', '', '', 0, '', '56,52,53', 0, '2013-03-12 04:40:46', '2013-03-12 00:00:00', 1, 0, 0, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `plg_cshow`
--

CREATE TABLE IF NOT EXISTS `plg_cshow` (
`id` int(11) NOT NULL,
  `data` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `delete` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `plg_cshow_categories`
--

CREATE TABLE IF NOT EXISTS `plg_cshow_categories` (
`id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `des` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `plg_hits`
--

CREATE TABLE IF NOT EXISTS `plg_hits` (
`id` int(11) NOT NULL,
  `ob_type` text NOT NULL,
  `ob_id` int(11) NOT NULL,
  `nums` double NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=120 ;

--
-- Dumping data for table `plg_hits`
--

INSERT INTO `plg_hits` (`id`, `ob_type`, `ob_id`, `nums`, `delete`, `enabled`, `order`, `created`, `modified`) VALUES
(43, 'com_video_gallery', 129, 5, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 'com_video_gallery', 124, 1, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 'com_video_gallery', 126, 7, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 'com_content_article', 37, 13, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 'com_video_gallery', 0, 20, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 'com_content_article', 44, 9, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 'com_content_article', 47, 8, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 'com_content_article', 42, 1, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 'com_content_article', 46, 5, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 'com_video_gallery', 136, 2, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 'com_content_article', 43, 8, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 'com_content_article', 39, 2, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 'com_video_gallery', 143, 2, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 'com_video_gallery', 144, 3, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 'com_video_gallery', 139, 1, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 'com_video_gallery', 138, 1, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 'com_content_article', 71, 2, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 'com_content_article', 72, 1, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 'com_content_article', 73, 1, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 'com_content_article', 74, 5, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 'com_content_article', 75, 1, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 'com_content_article', 76, 3, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 'com_content_article', 77, 1, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 'com_content_article', 91, 6, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 'com_content_article', 92, 3, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 'com_content_article', 84, 6, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 'com_content_article', 96, 1, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 'com_content_article', 102, 3, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 'com_video_gallery', 150, 1, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 'com_video_gallery', 153, 1, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 'com_video_gallery', 145, 1, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 'com_video_gallery', 154, 6, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 'com_video_gallery', 156, 1, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 'com_video_gallery', 151, 1, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 'com_video_gallery', 160, 1, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 'com_video_gallery', 165, 2, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 'com_content_article', 104, 1, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 'com_content_article', 34, 2, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 'com_content_article', 101, 4, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 'com_content_article', 83, 4, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 'com_video_gallery', 149, 15, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 'com_content_article', 99, 2, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 'com_content_article', 100, 2, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 'com_content_article', 98, 2, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 'com_content_article', 89, 2, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 'com_content_article', 94, 4, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 'com_content_article', 93, 2, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 'com_content_article', 109, 2, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 'com_content_article', 111, 2, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 'com_content_article', 90, 2, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 'com_content_article', 113, 2, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 'com_content_article', 88, 2, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 'com_content_article', 110, 2, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 'com_content_article', 112, 2, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 'com_video_gallery', 148, 5, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 'com_video_gallery', 159, 6, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 'com_content_article', 129, 8, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 'com_content_article', 128, 1, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 'com_content_article', 131, 6, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 'com_video_gallery', 161, 1, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 'com_video_gallery', 166, 1, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 'com_content_article', 103, 3, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 'com_content_article', 97, 2, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 'com_content_article', 87, 3, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 'com_content_article', 115, 3, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 'com_video_gallery', 147, 1, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 'com_video_gallery', 128, 5, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 'com_video_gallery', 146, 2, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 'com_content_article', 114, 1, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 'com_content_article', 122, 1, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 'com_content_article', 133, 2, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 'com_content_article', 135, 2, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 'com_content_article', 148, 3, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 'com_video_gallery', 167, 5, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 'com_content_article', 139, 4, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, 'com_content_article', 126, 1, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 'com_content_article', 150, 4, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 'com_video_gallery', 172, 2, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 'com_video_gallery', 168, 2, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 'com_video_gallery', 170, 2, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 'com_content_article', 137, 3, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, '', 0, 1, 0, 0, 0, '2015-03-24 20:15:45', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `plg_paypal`
--

CREATE TABLE IF NOT EXISTS `plg_paypal` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL DEFAULT '0',
  `checkout_url` varchar(255) NOT NULL,
  `business_id` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `plg_paypal`
--

INSERT INTO `plg_paypal` (`id`, `created`, `modified`, `enabled`, `order`, `delete`, `checkout_url`, `business_id`) VALUES
(1, '0000-00-00 00:00:00', '2013-05-01 00:00:00', 1, 0, 0, '3', '3'),
(2, '2013-05-01 00:00:00', '2013-05-01 00:00:00', 1, 1, 0, '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `plg_rescores`
--

CREATE TABLE IF NOT EXISTS `plg_rescores` (
`id` int(11) NOT NULL,
  `url` text NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `alias` varchar(255) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `cat_id` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `des` text NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=ucs2 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `plg_rescores`
--

INSERT INTO `plg_rescores` (`id`, `url`, `title`, `alias`, `enabled`, `delete`, `order`, `created`, `modified`, `cat_id`, `image`, `phone`, `number`, `address`, `des`) VALUES
(1, 'http://www.google.com', 'مؤسسة كنوز نوبية ', '', 1, 0, 0, '2013-04-06 11:15:22', '2014-05-04 13:46:55', '', 'Kenouz-Nobia-logo-1.png', '56456456', '45645654', '<div>2 شارع مصطفى ابو هيف، باب اللوق، القاهرة، مصر الدور الثاني، <br />شقة 7ع</div>', '<p>مؤسسة كنوز نوبية التنمية المجتمع</p>\r\n<p>مؤسسة كنوز نوبية التنمية المجتمع&nbsp;</p>\r\n<p>مؤسسة كنوز نوبية التنمية المجتمع&nbsp;</p>\r\n<p>مؤسسة كنوز نوبية التنمية المجتمع v</p>'),
(2, 'http://www.google.com', 'مصر الخير', '', 1, 0, 0, '2014-02-21 08:51:01', '0000-00-00 00:00:00', '', '530775e540235.jpg', '', '', '', ''),
(3, 'http://www.google.com', 'دار الارمان', '', 1, 0, 0, '2014-02-21 09:21:09', '0000-00-00 00:00:00', '', '53077cf54144e.png', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `plg_shipper`
--

CREATE TABLE IF NOT EXISTS `plg_shipper` (
`id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL DEFAULT '0',
  `delivery_time` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `plg_shipper`
--

INSERT INTO `plg_shipper` (`id`, `title`, `company`, `created`, `modified`, `enabled`, `order`, `delete`, `delivery_time`) VALUES
(1, 'Royal Mail 1st Class', '', '2013-03-19 06:38:48', '2013-03-19 00:00:00', 1, 0, 0, '1-2 Business Days'),
(2, 'Courier', '', '2013-03-19 08:32:50', '0000-00-00 00:00:00', 1, 0, 0, '2-3 Business Days'),
(3, 'UPS', '', '2013-03-21 06:25:54', '0000-00-00 00:00:00', 1, 0, 0, '2-3 Business Days'),
(4, 'Parzel UAE', '', '2013-03-21 23:35:03', '0000-00-00 00:00:00', 1, 0, 0, '3-4 Business Days');

-- --------------------------------------------------------

--
-- Table structure for table `plg_shipping`
--

CREATE TABLE IF NOT EXISTS `plg_shipping` (
`id` int(11) NOT NULL,
  `lowest_weight` varchar(255) NOT NULL,
  `hightest_weight` varchar(255) NOT NULL,
  `fee` varchar(255) NOT NULL,
  `locations` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `shipper` varchar(255) NOT NULL,
  `curreny` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL DEFAULT '0',
  `max_postcode` varchar(255) NOT NULL,
  `min_postcode` varchar(255) NOT NULL,
  `postcode_type` varchar(255) NOT NULL,
  `shipping_type` varchar(255) NOT NULL,
  `site` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

--
-- Dumping data for table `plg_shipping`
--

INSERT INTO `plg_shipping` (`id`, `lowest_weight`, `hightest_weight`, `fee`, `locations`, `title`, `shipper`, `curreny`, `created`, `modified`, `enabled`, `order`, `delete`, `max_postcode`, `min_postcode`, `postcode_type`, `shipping_type`, `site`) VALUES
(4, '1.26', '30', '9.99', '', 'Northern Ireland 1.26 to 30kgs', '2', '', '2013-03-12 10:55:19', '2013-03-21 00:00:00', 1, 0, 0, '99', '1', 'BT', '', '2'),
(5, '1.26', '30', '11.99', '', 'UK Highland 1.26 to 30kgs', '2', '', '2013-03-12 10:54:30', '2013-03-21 00:00:00', 1, 0, 0, '28,44,29,28', '1,19,20,27', 'IV,PH,PA,KA', '', '2'),
(7, '0', '0.75', '3.00', '', 'UK  750gms', '1', '', '2013-03-12 10:54:30', '2013-03-21 00:00:00', 1, 0, 0, ' ', ' ', 'ALL', '', '2'),
(8, '0.76', '1.25', '5.99', '', 'UK  750gms to 1.25kgs', '1', '', '2013-03-12 10:54:30', '2013-03-21 00:00:00', 1, 0, 0, ' ', ' ', 'ALL', '', '2'),
(9, '1.26', '30', '6.49', '', 'UK Mainland 1.26 to 30kgs', '2', '', '2013-03-21 06:34:05', '0000-00-00 00:00:00', 1, 0, 0, '', '', 'ALL', '', '2'),
(10, '0', '11.25', '7.99', '', 'UPS Zone 2 - 0 to 11.25 kgs', '3', '', '2013-03-21 14:57:29', '0000-00-00 00:00:00', 1, 0, 0, '05999,03899,02799,02999,06999', '05000,03000,01000,02800,06800', 'VT,NH, MA,RI,CT', '', '3'),
(11, '11.26', '17.7', '9.99', '', 'UPS Zone 2 - 11.26 to 17.7 kgs', '3', '', '2013-03-21 14:57:29', '2013-03-21 00:00:00', 1, 0, 0, '05999,03899,02799,02999,06999', '05000,03000,01000,02800,06800', 'VT,NH, MA,RI,CT', '', '3'),
(12, '0', '11.25', '7.99', '', 'UPS Zone 3 - 0 to 9 kgs', '3', '', '2013-03-21 15:09:39', '0000-00-00 00:00:00', 1, 0, 0, '14999,04999,08999', '10000,03000,07000', 'NY,ME,NJ', '', '3'),
(13, '9.1', '13.15', '7.99', '', 'UPS Zone 3 - 9.1 to 13.15 kgs', '3', '', '2013-03-21 15:09:39', '2013-03-21 00:00:00', 1, 0, 0, '14999,04999,08999', '10000,03000,07000', 'NY,ME,NJ', '', '3'),
(14, '0', '9.97', '8.99', '', 'UPS Zone 4 - 0 to 9.97 kgs', '3', '', '2013-03-21 15:43:33', '2013-03-22 00:00:00', 1, 0, 0, '16999,45899, 26886,24699,20599,28999,29999,19999', '15000,43000,24701,22000,20001,27000,29000,19700', 'PA,OH,WV,VA,DC,NC,SC,DE,', '', '3'),
(15, '0', '9.97', '8.99', '', 'UPS Zone 4 - 0 to 9.97 kgs', '3', '', '2013-03-21 15:43:33', '2013-03-21 00:00:00', 1, 0, 0, '16999,45899, 26886,24699,20599,28999,29999,19999', '15000,43000,24701,22000,20001,27000,29000,19700', 'PA,OH,WV,VA,DC,NC,SC,DE,', '', '3'),
(16, '9.98', '14.96', '11.99', '', 'UPS Zone 4 - 9.98 to 14.96 kgs', '3', '', '2013-03-21 15:43:33', '2013-03-21 00:00:00', 1, 0, 0, '16999,45899, 26886,24699,20599,28999,29999,19999', '15000,43000,24701,22000,20001,27000,29000,19700', 'PA,OH,WV,VA,DC,NC,SC,DE', '', '3'),
(17, '0', '9', '8.99', '', 'UPS Zone 5 - 0 to 9 kgs', '3', '', '2013-03-21 22:39:14', '0000-00-00 00:00:00', 1, 0, 0, '54990,49799,62999,47999,42799,35899,31999', '53001,48000,60000,46000,40000,37000,30000', 'WI,MI,IL,IN,KY,TN,GA', '', '3'),
(18, '9.1', '12.25', '11.99', '', 'UPS Zone 5 - 9.1 to 12.25 kgs', '3', '', '2013-03-21 22:39:14', '2013-03-21 00:00:00', 1, 0, 0, '54990,49799,62999,47999,42799,35899,31999', '53001,48000,60000,46000,40000,37000,30000', 'WI,MI,IL,IN,KY,TN,GA', '', '3'),
(19, '0', '7.25', '9.99', '', 'UPS Zone 6 - 0 to 7.25 kgs', '3', '', '2013-03-21 23:03:09', '2013-03-21 00:00:00', 1, 0, 0, '58899,56799,57799,69399,52899,67999,65899,72999,71499,39599,36999,34999', '58000,55000,57000,68000,50000,66000,63000,71600,70000,38600,35000,32100', 'ND,MN,SD,NE,IA,KS,MO,AR,LA,MS,AL,FL', '', '3'),
(20, '7.26', '9.5', '11.99', '', 'UPS Zone 6 -  7.26 to 9.5 kgs', '3', '', '2013-03-21 23:03:09', '2013-03-21 00:00:00', 1, 0, 0, '58899,56799,57799,69399,52899,67999,65899,72999,71499,39599,36999,34999', '58000,55000,57000,68000,50000,66000,63000,71600,70000,38600,35000,32100', 'ND,MN,SD,NE,IA,KS,MO,AR,LA,MS,AL,FL', '', '3'),
(21, '0', '5.44', '9.99', '', 'UPS Zone 7 - 0 to 5.44 kgs', '3', '', '2013-03-21 23:15:00', '0000-00-00 00:00:00', 1, 0, 0, '59999,83128,81699,88499,79999,74999', '59000,82000,80000,87000,75000,73000', 'MT,WY,CO,NM,TX,OK', '', '3'),
(22, '5.45', '7.25', '11.99', '', 'UPS Zone 7 -  5.45 to 7.25kgs', '3', '', '2013-03-21 23:15:00', '2013-03-21 00:00:00', 1, 0, 0, '59999,83128,81699,88499,79999,74999', '59000,82000,80000,87000,75000,73000', 'MT,WY,CO,NM,TX,OK', '', '3'),
(23, '7.26', '9.52', '13.99', '', 'UPS Zone 7 -  7.26 to 9.52kgs', '3', '', '2013-03-21 23:15:00', '2013-03-21 00:00:00', 1, 0, 0, '59999,83128,81699,88499,79999,74999', '59000,82000,80000,87000,75000,73000', 'MT,WY,CO,NM,TX,OK', '', '3'),
(24, '0', '5.89', '10.99', '', 'UPS Zone 8 -  0 to 5.89kgs', '3', '', '2013-03-21 23:25:13', '0000-00-00 00:00:00', 1, 0, 0, '99403,97999,83899,96199,89899,84799,86556', '98001,97000,83200,90000,89000,84000,85001', 'WA,OR,ID,CA,NV,UT,AZ', '', '3'),
(25, '5.9', '8.61', '13.99', '', 'UPS Zone 8 -  5.9 to 8.61 kgs', '3', '', '2013-03-21 23:25:13', '2013-03-21 00:00:00', 1, 0, 0, '99403,97999,83899,96199,89899,84799,86556', '98001,97000,83200,90000,89000,84000,85001', 'WA,OR,ID,CA,NV,UT,AZ', '', '3'),
(26, '8.62', '14', '19.99', '', 'UPS Zone 8 -   8.62 to 14 kgs', '3', '', '2013-03-21 23:25:13', '2013-03-21 00:00:00', 1, 0, 0, '99403,97999,83899,96199,89899,84799,86556', '98001,97000,83200,90000,89000,84000,85001', 'WA,OR,ID,CA,NV,UT,AZ', '', '3'),
(27, '0', '100', '10.00', '', 'UAE Parzel upto 100kgs', '4', '', '2013-03-21 23:34:19', '2013-03-21 00:00:00', 1, 0, 0, '', '', '', '', '1'),
(28, '0', '1', '20.00', '', 'Global 0-1 kgs', '2', '', '2013-03-21 23:51:25', '2013-03-22 00:00:00', 1, 0, 0, '', '', '', '', '4'),
(29, '1.1', '2', '40.00', '', 'Global 1-2 kgs', '2', '', '2013-03-21 23:51:52', '2013-03-22 00:00:00', 1, 0, 0, '', '', '', '', '4'),
(30, '2.1', '3', '60.00', '', 'Global 2-3 kgs', '2', '', '2013-03-21 23:52:15', '2013-03-22 00:00:00', 1, 0, 0, '', '', '', '', '4'),
(31, '3.1', '4', '80.00', '', 'Global 3-4 kgs', '2', '', '2013-03-21 23:52:39', '2013-03-22 00:00:00', 1, 0, 0, '', '', '', '', '4'),
(32, '4.1', '5', '100.00', '', 'Global 4-5 kgs', '2', '', '2013-03-21 23:53:09', '2013-03-22 00:00:00', 1, 0, 0, '', '', '', '', '4'),
(33, '5.1', '6', '120.00', '', 'Global 5-6 kgs', '2', '', '2013-03-21 23:53:33', '2013-03-22 00:00:00', 1, 0, 0, '', '', '', '', '4'),
(34, '6.1', '7', '140.00', '', 'Global 6-7 kgs', '2', '', '2013-03-21 23:53:57', '2013-03-22 00:00:00', 1, 0, 0, '', '', '', '', '4'),
(35, '7.1', '8', '160.00', '', 'Global 7-8 kgs', '2', '', '2013-03-21 23:54:24', '2013-03-22 00:00:00', 1, 0, 0, '', '', '', '', '4'),
(36, '8.1', '9', '180.00', '', 'Global 8-9 kgs', '2', '', '2013-03-21 23:54:48', '2013-03-22 00:00:00', 1, 0, 0, '', '', '', '', '4'),
(37, '9.1', '10', '200.00', '', 'Global 9-10 kgs', '2', '', '2013-03-21 23:55:14', '2013-03-22 00:00:00', 1, 0, 0, '', '', '', '', '4');

-- --------------------------------------------------------

--
-- Table structure for table `plg_shipping_setting`
--

CREATE TABLE IF NOT EXISTS `plg_shipping_setting` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL DEFAULT '0',
  `price` double NOT NULL,
  `des` text NOT NULL,
  `site` text NOT NULL,
  `inputType` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `plg_shipping_setting`
--

INSERT INTO `plg_shipping_setting` (`id`, `created`, `modified`, `enabled`, `order`, `delete`, `price`, `des`, `site`, `inputType`) VALUES
(1, '2013-03-21 07:08:39', '2013-03-22 00:00:00', 1, 0, 0, 10, 'xx', '1', 'fixedprice'),
(2, '2013-03-21 07:09:59', '2013-03-22 00:00:00', 1, 0, 0, 0, 'Enter Delivery Postcode in UK or Northern Ireland', '2', 'ukpostcode'),
(3, '2013-03-21 23:51:13', '2013-03-22 00:00:00', 1, 0, 0, 0, 'Please select country of delivery ', '4', 'country'),
(4, '2013-03-22 02:24:54', '2013-03-22 00:00:00', 1, 0, 0, 0, 'Please enter your ZIP code to get a shipping estimate', '3', 'ziprange');

-- --------------------------------------------------------

--
-- Table structure for table `plugincart_order`
--

CREATE TABLE IF NOT EXISTS `plugincart_order` (
`id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `donations` double NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_id` varchar(255) CHARACTER SET ucs2 NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) CHARACTER SET ucs2 NOT NULL,
  `city` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` varchar(255) CHARACTER SET ucs2 NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `building` varchar(255) NOT NULL,
  `floor` varchar(255) NOT NULL,
  `flat` varchar(255) NOT NULL,
  `shipping_note` varchar(255) NOT NULL,
  `Collection-Point` varchar(255) NOT NULL,
  `terms-conditions` tinyint(4) NOT NULL,
  `anonymous-donation` tinyint(4) NOT NULL,
  `project-updates` tinyint(4) NOT NULL,
  `newsletter` tinyint(4) NOT NULL,
  `address` text NOT NULL,
  `pay-choice` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=61 ;

--
-- Dumping data for table `plugincart_order`
--

INSERT INTO `plugincart_order` (`id`, `status`, `donations`, `enabled`, `delete`, `order`, `created`, `modified`, `user_id`, `name`, `email`, `city`, `area`, `country`, `date`, `time`, `mobile`, `street`, `building`, `floor`, `flat`, `shipping_note`, `Collection-Point`, `terms-conditions`, `anonymous-donation`, `project-updates`, `newsletter`, `address`, `pay-choice`) VALUES
(48, 1, 0, 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', 'ismasil2', 'empcland@gmail.com', 'Cairo', 'Elgamaleya', 'egypt', '0000-00-00', '', '0010666919', 'egypt', '45656', 'dfgdf', 'gdf', 'gfdg', 'downtown', 0, 0, 0, 0, '', 'COD'),
(49, 0, 0, 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '141', 'Aziz Vasi', 'azizms@gmail.com', 'Giza', 'Dokki', 'egypt', '0000-00-00', '16:30', '01222489051', 'شارع التحرير ', '29', '3', '6', 'شركة إي سكبيس ', 'downtown', 0, 0, 0, 0, '', 'COD'),
(50, 0, 0, 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '149', 'chekout', 'emp2222cland@gmail.com', 'Cairo', 'Elgamaleya', 'egypt', '0000-00-00', '02:15', '01010666918', '', '', '', '', '', 'downtown', 0, 0, 0, 0, '', 'collection-point'),
(51, 0, 0, 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '152', 'Aziz Mv', 'amztelcom@yahoo.com', 'Giza', 'Dokki', 'egypt', '0000-00-00', '', '01222489051', 'share', 'blgd', 'floor', 'room', 'shipping notes', 'downtown', 0, 0, 0, 0, '', 'COD'),
(52, 0, 0, 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', 'ismasil2', 'empcland@gmail.com', 'Giza', 'Giza', 'egypt', '0000-00-00', '', '01010666917', 'egypt', '45656', 'dfgdf', 'gdf', 'gfdg', 'downtown', 0, 0, 0, 0, '', 'COD'),
(53, 0, 0, 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', 'ismasil2', 'empcland@gmail.com', 'Cairo', 'Elazbakeya', 'egypt', '0000-00-00', '', '01010666917', 'شارع جدا   ', '5', 'الدور السادس ', '66', 'جنب بنك المركزي ', 'downtown', 0, 0, 0, 0, '', 'COD'),
(54, 0, 0, 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', 'ismasil2', 'empcland@gmail.com', 'Cairo', 'Elazbakeya', 'egypt', '0000-00-00', '', '01010666917', 'شارع جدا   ', '5', 'الدور السادس ', '66', 'جنب بنك المركزي ', 'downtown', 0, 0, 0, 0, '', 'COD'),
(55, 0, 0, 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', 'ismasil2', 'empcland@gmail.com', 'Giza', 'Giza', 'egypt', '0000-00-00', '', '01010666917', 'شارع جدا   ', '5', 'الدور السادس ', '66', 'جنب بنك المركزي ', 'downtown', 0, 0, 0, 0, '', 'COD'),
(56, 0, 0, 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', 'ismasil2', 'empcland@gmail.com', 'Cairo', 'Elazbakeya', 'egypt', '0000-00-00', '', '01010666917', 'شارع جدا   ', '5', 'الدور السادس ', '66', 'جنب بنك المركزي ', 'downtown', 0, 0, 0, 0, '', 'COD'),
(57, 0, 0, 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', 'ismasil2', 'empcland@gmail.com', 'Giza', 'Giza', 'egypt', '0000-00-00', '02:30', '01010666917', 'شارع جدا   ', '5', 'الدور السادس ', '66', 'جنب بنك المركزي ', 'downtown', 0, 0, 0, 0, '', 'COD'),
(58, 0, 0, 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', 'ismasil2', 'empcland@gmail.com', 'Giza', 'Dokki', 'egypt', '0000-00-00', '', '01010666917', 'شارع جدا   ', '5', 'الدور السادس ', '66', 'جنب بنك المركزي ', 'downtown', 0, 0, 0, 0, '', 'COD'),
(59, 0, 0, 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', 'ismasil2', 'empcland@gmail.com', 'Giza', 'Giza', 'egypt', '0000-00-00', '', '01010666917', 'شارع جدا   ', '5', 'الدور السادس ', '66', 'جنب بنك المركزي ', 'downtown', 0, 0, 0, 0, '', 'COD'),
(60, 0, 0, 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3', 'ismasil2', 'empcland@gmail.com', 'Cairo', 'Elazbakeya', 'egypt', '0000-00-00', '06:30', '01010666917', 'شارع جدا   ', '5', 'الدور السادس ', '66', 'جنب بنك المركزي ', 'downtown', 0, 0, 0, 0, '', 'COD');

-- --------------------------------------------------------

--
-- Table structure for table `plugincart_order_item`
--

CREATE TABLE IF NOT EXISTS `plugincart_order_item` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL DEFAULT '0',
  `item_id` int(11) NOT NULL,
  `cart_id` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;

--
-- Dumping data for table `plugincart_order_item`
--

INSERT INTO `plugincart_order_item` (`id`, `created`, `modified`, `enabled`, `order`, `delete`, `item_id`, `cart_id`, `price`, `user_id`) VALUES
(3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 16, '9', 30, 3),
(4, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 16, '10', 70, 3),
(5, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 16, '11', 0, 3),
(6, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 0, '12', 0, 3),
(7, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 16, '13', 0, 3),
(8, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 0, '14', 0, 3),
(9, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 16, '15', 30, 3),
(10, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 15, '16', 120000, 3),
(11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 15, '17', 200, 3),
(12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 15, '18', 200, 3),
(13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 15, '19', 300, 3),
(14, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 15, '20', 100, 3),
(15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 15, '21', 400, 3),
(16, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 15, '22', 100, 3),
(17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 15, '23', 200, 3),
(18, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 15, '24', 200, 3),
(19, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 15, '25', 200, 3),
(20, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 15, '26', 200, 3),
(21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 15, '27', 300, 3),
(22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 15, '28', 200, 3),
(23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 15, '29', 200, 3),
(24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 0, '30', 0, 3),
(25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 15, '31', 200, -1),
(26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 15, '32', 200, -1),
(27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 15, '33', 200, -1),
(28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 0, '34', 0, -1),
(29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 15, '35', 200, -1),
(30, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 15, '36', 300, -1),
(31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 0, '37', 0, -1),
(32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 15, '38', 300, 3),
(33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 0, '39', 0, 3),
(34, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 19, '40', 100, 3),
(35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 19, '41', 100, 3),
(36, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 0, '42', 0, 3),
(37, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 19, '43', 100, 3),
(38, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 19, '44', 100, 3),
(39, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 19, '45', 100, 3),
(40, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 19, '46', 100, 3),
(41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 19, '47', 100, 3),
(42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 19, '48', 50, 3),
(43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 0, '49', 0, 3),
(44, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 0, '50', 0, 3),
(45, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 0, '51', 0, 3),
(46, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 0, '52', 0, 3),
(47, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 19, '53', 100, 3),
(48, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 15, '54', 800, 3),
(49, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 19, '55', 100, 3),
(50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 15, '56', 800, 3),
(51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 15, '49', 800, 141),
(52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 19, '50', 100, 149),
(53, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 15, '51', 800, 152),
(54, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 15, '52', 800, 3),
(55, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 15, '53', 800, 3),
(56, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 15, '54', 800, 3),
(57, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 15, '55', 800, 3),
(58, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 15, '56', 800, 3),
(59, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 15, '57', 800, 3),
(60, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 15, '58', 800, 3),
(61, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 15, '59', 800, 3),
(62, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 15, '60', 800, 3);

-- --------------------------------------------------------

--
-- Table structure for table `plugins_xref`
--

CREATE TABLE IF NOT EXISTS `plugins_xref` (
`id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `plugins_xref`
--

INSERT INTO `plugins_xref` (`id`, `item_id`, `cat_id`, `delete`, `order`, `enabled`, `modified`, `created`) VALUES
(28, 85, 70, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 89, 65, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 85, 53, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 102, 70, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 104, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 107, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 108, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 103, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 102, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 109, 49, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 113, 111, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 115, -1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `plugin_pricing_xref`
--

CREATE TABLE IF NOT EXISTS `plugin_pricing_xref` (
`id` int(11) NOT NULL,
  `pluginData__site` text NOT NULL,
  `pluginData__price` text NOT NULL,
  `pluginData__wigth` text NOT NULL,
  `modified` int(11) NOT NULL,
  `created` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `pluginData__des` text NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE IF NOT EXISTS `reservation` (
  `id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `arrival_time` datetime NOT NULL,
  `airline` varchar(50) NOT NULL,
  `airline_code` varchar(50) NOT NULL,
  `arriving_from` varchar(50) NOT NULL,
  `booking_owner` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `remarks` text NOT NULL,
  `individual_id` varchar(50) NOT NULL,
  `its_id` int(11) NOT NULL,
  `arrived` tinyint(4) NOT NULL,
  `city` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `planner_options` varchar(50) NOT NULL,
  `airport_pickup` tinyint(4) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `site_setting`
--

CREATE TABLE IF NOT EXISTS `site_setting` (
`id` int(11) NOT NULL,
  `admin_lang` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `site_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `admin_mail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `site_meta` text COLLATE utf8_unicode_ci NOT NULL,
  `site_keywords` text COLLATE utf8_unicode_ci NOT NULL,
  `addto_headre` text COLLATE utf8_unicode_ci NOT NULL,
  `offline` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `offline_message` text COLLATE utf8_unicode_ci NOT NULL,
  `offline_background` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `offline_morecss` text COLLATE utf8_unicode_ci NOT NULL,
  `admin_list_limit` int(11) NOT NULL,
  `order` tinyint(4) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `facebookappid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `site_status` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `site_setting`
--

INSERT INTO `site_setting` (`id`, `admin_lang`, `lang`, `link_type`, `title`, `site_link`, `admin_mail`, `site_meta`, `site_keywords`, `addto_headre`, `offline`, `offline_message`, `offline_background`, `offline_morecss`, `admin_list_limit`, `order`, `enabled`, `created`, `modified`, `facebookappid`, `site_status`) VALUES
(3, 'en', 'en', '1', 'Faiz', 'http://cms.localhost/', 'empcland@gmail.com', 'faizehaakimi', 'faiz', ' ', '0', 'site under construction ', 'uc.png', '.center-msg{\r\nleft:50%\r\n}', 10, 0, 0, '2012-04-22 14:54:44', '2015-03-23 21:14:13', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `sys_admin_menu`
--

CREATE TABLE IF NOT EXISTS `sys_admin_menu` (
`id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tooltip` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `delete` tinyint(4) NOT NULL DEFAULT '0',
  `cat_id` int(11) NOT NULL,
  `url` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=39 ;

--
-- Dumping data for table `sys_admin_menu`
--

INSERT INTO `sys_admin_menu` (`id`, `title`, `icone`, `tooltip`, `locked`, `order`, `modified`, `created`, `enabled`, `delete`, `cat_id`, `url`) VALUES
(1, 'site Config', 'fa-key', '', 0, 0, '2014-01-08 00:00:00', '0000-00-00 00:00:00', 1, 0, 7, 'site_setting'),
(2, 'mobile Config', 'fa-mobile', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 7, 'sys_mobile_setting'),
(3, 'Users Management', 'fa-users', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 11, 'com_users'),
(4, 'templates', 'fa-leaf', '', 0, 1, '2014-01-08 00:00:00', '0000-00-00 00:00:00', 1, 0, 7, 'com_templates'),
(5, 'install', 'fa-download', '', 0, 2, '2014-01-08 00:00:00', '0000-00-00 00:00:00', 1, 0, 7, 'com_install'),
(6, 'modules', 'fa-th-large', '', 0, 1, '2014-01-08 00:00:00', '0000-00-00 00:00:00', 1, 0, 9, 'com_modules'),
(8, 'form', 'fa-asterisk', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 10, 'com_form'),
(9, 'Menu Manager', 'fa-list', 'Add / Edit Menus', 0, 3, '2014-01-08 00:00:00', '0000-00-00 00:00:00', 1, 0, 9, 'com_menus'),
(10, 'data Bluder', 'fa-pencil-square-o', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 10, 'sys_dataBluder'),
(11, 'images gallery', 'fa-picture-o', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 'com_images_gallery'),
(12, 'video gallery', 'fa-video-camera', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 10, 'com_video_gallery'),
(13, 'Html', 'fa-html5', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 10, 'com_html'),
(14, 'query', ' fa-coffee', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 10, ' sys_query'),
(15, 'admin Menu', 'fa-list-ol', 'sys_admin_menu', 1, 1, '2013-12-29 00:00:00', '2013-12-29 07:14:30', 1, 0, 7, 'sys_admin_menu'),
(16, 'separator', '', '', 0, 2, '2014-01-06 00:00:00', '0000-00-00 00:00:00', 1, 0, 9, ''),
(21, 'FAQ', 'fa-question-circle', 'FAQ', 0, 9, '0000-00-00 00:00:00', '2014-01-08 14:26:16', 1, 0, 8, 'com_faq'),
(22, 'Contact', 'fa-phone', '', 0, 10, '0000-00-00 00:00:00', '2014-01-08 14:29:10', 1, 0, 8, 'com_contect'),
(23, 'Products', 'fa-shopping-cart', '', 0, 11, '0000-00-00 00:00:00', '2014-01-08 14:31:20', 1, 0, 8, 'com_products'),
(24, 'Guest Book', 'fa-pencil-square', '', 0, 12, '0000-00-00 00:00:00', '2014-01-08 14:33:03', 1, 0, 8, 'com_gustbook'),
(25, 'Wizard Builder', 'fa-magic', '', 0, 13, '0000-00-00 00:00:00', '2014-01-08 14:41:08', 1, 0, 8, 'com_wizard'),
(26, 'Google Maps', 'fa-map-marker', '', 0, 14, '0000-00-00 00:00:00', '2014-01-08 14:43:17', 1, 0, 8, 'com_google_map'),
(27, 'Articles', 'fa-file-text', '', 0, 15, '0000-00-00 00:00:00', '2014-01-08 14:44:32', 1, 0, 8, 'com_content_article'),
(28, 'Events', 'fa-calendar', '', 0, 16, '0000-00-00 00:00:00', '2014-01-08 14:49:12', 1, 0, 8, 'com_events'),
(29, 'App ', ' fa-external-link-square', '', 0, 17, '0000-00-00 00:00:00', '2014-01-08 14:50:07', 1, 0, 8, 'com_app'),
(30, 'News Letter', 'fa-envelope', '', 0, 18, '0000-00-00 00:00:00', '2014-01-09 06:17:30', 1, 0, 13, 'com_newsLetter'),
(31, 'Mail Templates', 'fa-list-alt', '', 0, 19, '0000-00-00 00:00:00', '2014-01-09 06:18:47', 1, 0, 13, 'com_mailsTemplates'),
(32, 'Regions', 'fa-dot-circle-o', 'Manage your region settings', 0, 20, '0000-00-00 00:00:00', '2014-01-09 06:20:27', 1, 0, 13, 'com_cities_categories'),
(33, 'Google Adsense', 'fa-ticket', '', 0, 21, '0000-00-00 00:00:00', '2014-01-09 06:23:22', 1, 0, 13, 'com_google_adsense'),
(34, 'Polls', 'fa-bar-chart-o', '', 0, 22, '0000-00-00 00:00:00', '2014-01-09 06:24:31', 1, 0, 13, 'com_poll_questions'),
(35, 'Sources', 'fa-compass', '', 0, 23, '0000-00-00 00:00:00', '2014-01-09 06:25:58', 1, 0, 13, 'plg_rescores'),
(36, 'Images Gallery', 'fa-picture-o', '', 0, 24, '0000-00-00 00:00:00', '2014-01-22 04:29:55', 1, 0, 10, 'com_images_gallery'),
(38, 'Lawazim Packages', 'fa-money', '', 0, 25, '2014-06-02 15:47:13', '2014-06-02 15:43:04', 1, 0, 14, 'fiz_lawazim_packages');

-- --------------------------------------------------------

--
-- Table structure for table `sys_admin_pkg`
--

CREATE TABLE IF NOT EXISTS `sys_admin_pkg` (
`id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tooltip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `delete` tinyint(4) NOT NULL,
  `locked` tinyint(4) NOT NULL,
  `function` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Dumping data for table `sys_admin_pkg`
--

INSERT INTO `sys_admin_pkg` (`id`, `title`, `icone`, `tooltip`, `order`, `modified`, `created`, `enabled`, `delete`, `locked`, `function`) VALUES
(7, 'Settings', 'fa-wrench', 'site', 7, '2014-01-08 00:00:00', '0000-00-00 00:00:00', 1, 0, 1, ''),
(8, 'Components', 'fa-cogs', 'Components', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 1, 'getcompenentsData'),
(9, 'Menus &amp; Modules', 'fa-th-list', 'Menus', 3, '2014-01-08 00:00:00', '2013-12-25 00:00:00', 1, 0, 1, 'getMenusData'),
(10, 'Content', ' fa-pencil-square-o', '', 2, '2014-01-08 00:00:00', '0000-00-00 00:00:00', 1, 0, 1, ''),
(11, 'Users', 'fa-user', '', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 1, ''),
(12, 'Components Management', 'fa-cog', '', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 1, 1, ''),
(13, 'plugins', 'fa-puzzle-piece ', '', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 1, 'getPluginsData'),
(14, 'Faiz', 'fa-star', 'All things related to Madad ', 1, '2014-06-02 15:37:02', '2014-01-08 05:17:51', 1, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `sys_dataBluder`
--

CREATE TABLE IF NOT EXISTS `sys_dataBluder` (
`id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `des` text NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `data` text NOT NULL,
  `plugins_options` text NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `sys_dataBluder`
--

INSERT INTO `sys_dataBluder` (`id`, `title`, `des`, `modified`, `created`, `enabled`, `order`, `delete`, `data`, `plugins_options`) VALUES
(13, 'dataBluder Form Main report', 'ttt', '2013-09-16 00:00:00', '0000-00-00 00:00:00', 1, 0, 1, 'stepid=>s1__steporder=>1__steptitle=>Setp-s1__|typeID=>T1__type=>plugin__pluginTitle=>plg_clalawzim__returnType=>sesstion__returnTo=>pric__morecss=>__;||', 'days%3D%3E2__gustes%3D%3E4__%3B'),
(14, 'r1', '', '2013-09-22 00:00:00', '2013-09-15 11:36:56', 1, 0, 1, 'stepid=>s1__steporder=>1__steptitle=>Setp-s1__|typeID=>T2__type=>html__hmlid=>125__morecss=>__;||', ''),
(15, 'r2', '', '2013-10-06 00:00:00', '2013-09-15 11:38:32', 1, 0, 1, 'stepid=>s1__steporder=>1__steptitle=>Setp-s1__|typeID=>T1__type=>form__formid=>1__renderType=>form__morecss=>__;||', ''),
(16, 'r3', '1111', '2013-10-07 00:00:00', '2013-09-15 11:40:03', 1, 0, 1, 'stepid=>s1__steporder=>1__steptitle=>Setp-s1__|typeID=>T2__type=>plugin__pluginTitle=>plg_pkgs__returnType=>__returnTo=>__;typeID=>T4__type=>form__formid=>1__renderType=>results__morecss=>__;||', 'nights%3D%3E%40%25session%3A%3AAddress.Nights%25%40__Adults%3D%3E%40%25session.length%3A%3AAddress.adults_name%25%40__Childs%3D%3E%40%25session.length%3A%3AAddress.childs_name%25%40__Infants%3D%3E%40%25session.length%3A%3AAddress.infant_name%25%40__%3D%3Ethis%5B0%5D__%3B'),
(17, 'r4', '', '2013-10-07 00:00:00', '2013-09-15 11:40:03', 1, 0, 1, 'stepid=>s1__steporder=>1__steptitle=>Setp-s1__|typeID=>T1__type=>plugin__pluginTitle=>plg_rssave__returnType=>__returnTo=>11__;||', 'saveform%3D%3EAddress__%3D%3E__%3B'),
(18, 'testing form', '', '0000-00-00 00:00:00', '2013-11-17 08:32:01', 1, 0, 1, 'stepid=>s1__steporder=>1__steptitle=>Setp-s1__|typeID=>T1__type=>form__formid=>2__renderType=>form__morecss=>__;||', ''),
(19, 'faiz-new-reservation-step-1', 'Faiz new reservation step 1', '2015-03-30 12:12:20', '2014-06-01 08:39:52', 1, 0, 0, 'stepid=>s1__steporder=>1__steptitle=>Setp-s1__|typeID=>T1__type=>form__formid=>13__renderType=>form__morecss=>__;||', ''),
(20, 'faiz-new-reservation-step-2', 'Faiz new reservation step 2', '2015-03-30 19:56:43', '2014-06-01 10:08:00', 1, 0, 0, 'stepid=>s1__steporder=>1__steptitle=>Setp-s2__|typeID=>T2__type=>plugin__pluginTitle=>fiz_lawazim_table__returnType=>0__returnTo=>__morecss=>__;||', ''),
(21, 'aiz-New-ReservationSeave', '', '2015-03-30 01:23:29', '2014-06-03 09:25:25', 1, 0, 0, 'stepid=>s1__steporder=>1__steptitle=>Setp-s1__|typeID=>T1__type=>plugin__pluginTitle=>fiz_saveReservation__returnType=>-1__returnTo=>__morecss=>__;||', ''),
(22, 'Board', '', '2015-03-30 01:23:29', '2015-03-30 01:22:02', 1, 0, 0, 'stepid=>s1__steporder=>1__steptitle=>Setp-s1__|typeID=>T1__type=>plugin__pluginTitle=>faiz_res_board__returnType=>0__returnTo=>__morecss=>__;||', '<br />\r\n<b>Notice</b>:  Undefined variable: myurl in <b>/Users/eScapes/Documents/Work/www/insyaCMS/lib/libs.php</b> on line <b>13</b><br />\r\n<br />\r\n<b>Notice</b>:  Undefined index: parent in <b>/Users/eScapes/Documents/Work/www/insyaCMS/lib/utiles/utilClass.php</b> on line <b>113</b><br />\r\n<br />\r\n<b>Notice</b>:  Undefined index: parent in <b>/Users/eScapes/Documents/Work/www/insyaCMS/lib/utiles/utillibsClass.php</b> on line <b>24</b><br />\r\n<br />\r\n<b>Notice</b>:  Undefined index: parent in <b>/Users/eScapes/Documents/Work/www/insyaCMS/lib/utiles/utilPagClass.php</b> on line <b>32</b><br />\r\n<br />\r\n<b>Notice</b>:  Undefined index: parent in <b>/Users/eScapes/Documents/Work/www/insyaCMS/lib/utiles/utilDBClass.php</b> on line <b>28</b><br />\r\n<br />\r\n<b>Notice</b>:  Undefined index: parent in <b>/Users/eScapes/Documents/Work/www/insyaCMS/lib/utiles/utilForntClass.php</b> on line <b>26</b><br />\r\n<br />\r\n<b>Notice</b>:  Undefined index: parent in <b>/Users/eScapes/Documents/Work/www/insyaCMS/lib/engine/adminEngClass.php</b> on line <b>53</b><br />\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `sys_language`
--

CREATE TABLE IF NOT EXISTS `sys_language` (
`id` int(11) NOT NULL,
  `lang` varchar(255) NOT NULL,
  `obj_type` varchar(255) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `delete` int(11) NOT NULL,
  `enabled` int(11) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `obj_field` varchar(255) NOT NULL,
  `obj_id` int(11) NOT NULL,
  `obj_old_data` text NOT NULL,
  `obj_new_data` text NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=359 ;

--
-- Dumping data for table `sys_language`
--

INSERT INTO `sys_language` (`id`, `lang`, `obj_type`, `modified`, `created`, `delete`, `enabled`, `order`, `obj_field`, `obj_id`, `obj_old_data`, `obj_new_data`) VALUES
(357, '3', 'com_html', '2014-06-19 06:50:55', '2014-06-19 06:48:36', 0, 1, 0, 'cat_id[]', 348, '', 'ttt'),
(358, '3', 'com_html', '0000-00-00 00:00:00', '2014-06-19 06:52:58', 0, 1, 0, 'cat_id', 348, '', 'ttt22'),
(356, '3', 'com_html', '2014-06-19 06:48:04', '0000-00-00 00:00:00', 0, 1, 0, 'title', 348, '', 'ttt333');

-- --------------------------------------------------------

--
-- Table structure for table `sys_menu_status_xref`
--

CREATE TABLE IF NOT EXISTS `sys_menu_status_xref` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL DEFAULT '0',
  `item_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sys_mobile_application`
--

CREATE TABLE IF NOT EXISTS `sys_mobile_application` (
`id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `delete` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `cat_id` text NOT NULL,
  `data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=ucs2 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sys_mobile_setting`
--

CREATE TABLE IF NOT EXISTS `sys_mobile_setting` (
`id` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `right_menu` int(11) NOT NULL,
  `left_menu` int(11) NOT NULL,
  `header_bar` int(11) NOT NULL,
  `footer_bar` int(11) NOT NULL,
  `pages_transition` varchar(255) NOT NULL,
  `theme` varchar(20) NOT NULL,
  `homebt` tinyint(4) NOT NULL,
  `backbt` tinyint(4) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sys_mobile_setting`
--

INSERT INTO `sys_mobile_setting` (`id`, `modified`, `created`, `enabled`, `order`, `delete`, `right_menu`, `left_menu`, `header_bar`, `footer_bar`, `pages_transition`, `theme`, `homebt`, `backbt`) VALUES
(1, '2014-05-04 13:58:52', '2013-10-21 00:00:00', 0, 0, 0, 8, -1, 15, 15, 'rondome', 'a', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sys_modules_status_xref`
--

CREATE TABLE IF NOT EXISTS `sys_modules_status_xref` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL DEFAULT '0',
  `item_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `sys_modules_status_xref`
--

INSERT INTO `sys_modules_status_xref` (`id`, `created`, `modified`, `enabled`, `order`, `delete`, `item_id`, `cat_id`) VALUES
(18, '2015-04-01 21:36:26', '0000-00-00 00:00:00', 1, 0, 0, 285, 1),
(5, '2015-04-01 15:55:13', '0000-00-00 00:00:00', 1, 0, 0, 287, 1),
(44, '2015-04-01 22:43:50', '0000-00-00 00:00:00', 1, 0, 0, 289, 2),
(40, '2015-04-01 21:54:19', '0000-00-00 00:00:00', 1, 0, 0, 288, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sys_more_data`
--

CREATE TABLE IF NOT EXISTS `sys_more_data` (
  `title` varchar(255) NOT NULL,
  `com_type` varchar(255) NOT NULL,
  `com_id` int(11) NOT NULL,
  `data` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
`id` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=87 ;

--
-- Dumping data for table `sys_more_data`
--

INSERT INTO `sys_more_data` (`title`, `com_type`, `com_id`, `data`, `created`, `modified`, `enabled`, `order`, `delete`, `id`) VALUES
('', '', 123, 'a', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 3),
('', 'com_html', 123, '2;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 51),
('', 'com_html', 209, ';vidimageWidth__100px;vidimageHeight__auto;vidimagesNumber__4;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 44),
('', 'com_html', 196, ';formId__;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 48),
('', 'com_html', 220, ';imageWidth__100px;imageHeight__auto;imagesNumber__4;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 58),
('', 'com_html', 0, ';', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 67),
('', 'com_html', 222, ';', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 59),
('', 'com_html', 226, ';vidimageWidth__100px;vidimageHeight__auto;vidimagesNumber__4;moreData__;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 66),
('', 'com_content_article', 226, ';', '2015-03-20 18:00:53', '0000-00-00 00:00:00', 1, 0, 0, 75),
('', 'com_content_article', 241, ';', '2015-03-20 17:51:21', '0000-00-00 00:00:00', 1, 0, 0, 70),
('', 'com_content_article', 224, ';', '2015-03-20 17:52:50', '0000-00-00 00:00:00', 1, 0, 0, 71),
('', 'com_content_article', 213, ';', '2015-03-20 17:54:39', '0000-00-00 00:00:00', 1, 0, 0, 72),
('', 'com_content_article', 223, ';', '2015-03-20 17:55:56', '0000-00-00 00:00:00', 1, 0, 0, 73),
('', 'com_content_article', 225, ';', '2015-03-20 17:57:21', '0000-00-00 00:00:00', 1, 0, 0, 74),
('', 'com_content_article', 218, ';', '2015-03-20 18:02:34', '0000-00-00 00:00:00', 1, 0, 0, 76),
('', 'com_content_article', 216, ';', '2015-03-20 18:04:54', '0000-00-00 00:00:00', 1, 0, 0, 77),
('', 'com_content_article', 242, ';', '2015-03-20 18:07:04', '0000-00-00 00:00:00', 1, 0, 0, 78),
('', 'com_content_article', 243, ';', '2015-03-20 18:07:59', '0000-00-00 00:00:00', 1, 0, 0, 79),
('', 'com_content_article', 245, ';', '2015-03-20 18:09:52', '0000-00-00 00:00:00', 1, 0, 0, 80),
('', 'com_content_article', 246, ';', '2015-03-20 18:10:51', '0000-00-00 00:00:00', 1, 0, 0, 81),
('', 'com_content_article', 232, ';', '2015-03-25 15:13:59', '0000-00-00 00:00:00', 1, 0, 0, 82),
('', 'com_content_article', 202, ';', '2015-03-25 15:14:41', '0000-00-00 00:00:00', 1, 0, 0, 83),
('', 'com_content_article', 191, ';', '2015-03-25 15:15:02', '0000-00-00 00:00:00', 1, 0, 0, 84),
('', 'com_content_article', 190, ';', '2015-03-25 15:15:15', '0000-00-00 00:00:00', 1, 0, 0, 85),
('', 'com_content_article', 160, ';', '2015-03-25 15:15:37', '0000-00-00 00:00:00', 1, 0, 0, 86);

-- --------------------------------------------------------

--
-- Table structure for table `sys_properies_data`
--

CREATE TABLE IF NOT EXISTS `sys_properies_data` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `com_type` varchar(255) CHARACTER SET utf8 NOT NULL,
  `com_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8 NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sys_properies_data`
--

INSERT INTO `sys_properies_data` (`id`, `title`, `com_type`, `com_id`, `data`, `created`, `modified`, `enabled`, `order`, `delete`) VALUES
(0, '', 'menu_itmes', 247, 'imagegallery__;selectcode__123;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_html', 123, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', '', 247, 'imagegallery__;selectcode__123;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', '', 261, 'data__14;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 261, 'imagegallery__;selectcode__123;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 252, 'selecmenu__8;viewImage__0;viewComment__0;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 265, 'selecmenu__13;viewImage__0;viewComment__0;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 253, 'selecmenu__8;viewImage__0;viewComment__0;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 262, 'ptime__+1;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 263, 'selecmenu__14;viewImage__0;viewComment__0;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 257, 'selectcode__123;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 264, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 261, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 260, 'citycode__EGXX0004;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 259, 'cat_id__35;view__articles;Datatype__latest;dynamic__0;viewTitle__0;viewImage__0;viewDes__0;viewDesNum__;viewMViews__0;numberView__;firstMainStyle__0;tagmaxfont__;tagminfont__;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 258, 'viewtype__v;cat_id__36;view__;Datatype__;dynamic__0;viewTitle__0;viewImage__0;viewDes__0;viewDesNum__;viewMViews__0;numberView__;firstMainStyle__0;tagmaxfont__;tagminfont__;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 256, 'selecmenu__8;viewImage__0;viewComment__0;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 255, 'selecmenu__13;viewImage__0;viewComment__0;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_install', 107, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_products', 52, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_install', 103, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_install', 102, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_project', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 263, 'cat_id__;nums__5;catPageViewTitle__1;catPageViewImage__1;catPageViewDes__1;catPageViewHist__1;catPageViewAuthor__0;catPageViewDate__0;desLimit__;shareView__0;introInBody__0;thimageinBody__0;comment__0;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 231, 'cat_id__;nums__;catPageViewTitle__1;catPageViewImage__1;catPageViewDes__1;catPageViewHist__0;catPageViewAuthor__0;catPageViewDate__0;desLimit__;shareView__0;introInBody__0;thimageinBody__0;comment__0;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_content_article', 188, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_products', 56, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'site_setting', 3, '', '2015-03-23 21:14:13', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'sys_admin_pkg', 7, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'sys_admin_menu', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'sys_admin_menu', 15, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'sys_admin_menu', 7, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_users', 3, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_content_catgories', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_project', 6, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 280, 'subtitle__About me;selectcode__123;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_html', 209, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery_categories', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_content_article', 240, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 281, 'cat_id__35;nums__;catPageViewTitle__1;catPageViewImage__1;catPageViewDes__1;catPageViewHist__0;catPageViewAuthor__0;catPageViewDate__0;desLimit__;shareView__0;introInBody__0;thimageinBody__0;comment__0;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_project_catgories', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_project', 5, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_project', 4, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_project', 3, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_project', 2, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_project', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_project', 7, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_project', 8, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'sys_admin_menu', 16, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_google_map', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_google_map', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_google_map', 2, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 283, 'mapData__1;hieghtMap__300;widthMap__300;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 284, 'mapData__2;hieghtMap__300;widthMap__300;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_project', 9, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_html', 196, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 266, 'selectcode__214;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 267, 'height__450;width__600;lu__30.353916;lg__31.069336;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 268, 'height__300;width__800;lu__4.046464;lg__32.585449;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'sys_admin_pkg', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'sys_admin_pkg', 10, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'sys_admin_menu', 9, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_html_categories', 64, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'sys_admin_menu', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'sys_admin_pkg', 9, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'sys_admin_menu', 6, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'sys_admin_menu', 4, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'sys_admin_menu', 5, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_project_catgories', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 269, 'value__;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_install', 111, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_project', 16, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_project', 15, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_project', 14, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_project', 13, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_project', 12, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_project', 11, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_project', 10, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'plg_cart', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_form', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_form', 10, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_project_setting', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_form', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_form', 2, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 271, 'selecmenu__10;viewImage__0;viewComment__0;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 285, 'settings__1;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_users_settings', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_form', 3, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 273, 'selecmenu__8;viewImage__1;viewComment__0;colorbg__1;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery', 360, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 272, 'viwtype__images;seleccatnews__35;seleccat__66;seleccatvideo__;seleccatpro__;effect__random;style__theme-default;captionOpacity__1;Speed__800;pauseTime__6000;directionNav__true;directionNavHide__true;pauseOnHover__true;controlNavThumbs__false;morecss__;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery', 359, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_project_catgories', 3, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_project_catgories', 4, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_project_catgories', 5, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_project_catgories', 6, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_project_catgories', 7, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 270, 'pros__,15,19;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 287, 'subtitle__;selectcode__123;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_menus', 8, '', '2015-03-24 21:41:03', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 289, 'url__/search/cat=Child/;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 290, 'url__/search/cat=Women/;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 291, 'url__/search/cat=Education/;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 292, 'url__/search/cat=Poverty/;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 293, 'url__/search/cat=Health/;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery', 370, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery', 372, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery', 371, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_menus', 14, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_menus', 13, '', '2015-04-01 21:48:57', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 303, 'subtitle__;selectcode__270;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 306, 'subtitle__;selectcode__280;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 307, 'subtitle__;selectcode__283;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 308, 'subtitle__;selectcode__229;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 309, 'subtitle__;selectcode__283;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 312, 'url__#;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 274, 'selecmenu__13;viewImage__0;viewComment__0;colorbg__0;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 313, 'subtitle__;selectcode__123;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 314, 'subtitle__;selectcode__123;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 315, 'subtitle__;selectcode__123;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 320, 'settings__1;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 321, 'settings__1;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_html', 220, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_html', 222, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 275, 'selectcode__264;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_html', 226, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 322, 'settings__1;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 323, 'settings__1;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 324, 'settings__1;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 326, 'url__;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 304, 'url__;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 325, 'url__#;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 310, 'subtitle__;selectcode__228;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 319, 'subtitle__;selectcode__283;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_project', 17, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_html_categories', 65, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_html_categories', 0, '', '2014-07-08 18:14:23', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_install', 85, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_install', 104, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_install', 108, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_html', 224, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_html', 227, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_project_status', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_project_status', 2, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_project_status', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_html', 228, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_html', 229, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 276, 'fburl__https://www.facebook.com;tiwurl__https://twitter.com;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 343, '__;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_project_status', 3, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_html', 230, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'plg_rescores', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'plg_rescores', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 305, 'subtitle__;selectcode__237;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_html', 237, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 341, 'faqtype__0;faqstyle__accordian;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_faq_categories', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_faq', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_faq', 42, '', '2015-03-25 16:00:13', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_faq_categories', 2, '', '2015-03-25 15:59:17', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_faq_categories', 3, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_faq_categories', 4, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'plg_cart', 1, '', '2014-07-01 09:16:58', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'plg_comments', 33, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 344, 'subtitle__;selectcode__237;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_project', 19, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 277, 'follow__1;share__0;links__0;twitter__masrawy;facebook__JumiaEgypt;google__;shartwitter__1;sharfacebook__1;shargoogle__1;sharinlink__0;linkstwitter__;linksfacebook__;linksgoogle__;linksinlink__;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 279, 'pros__,15;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_html', 264, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 280, 'selectcode__226;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 345, 'subtitle__;selectcode__266;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_html', 266, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 289, 'selecmenu__10;viewImage__0;viewComment__0;colorbg__0;', '2015-04-01 22:43:50', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 281, 'selecmenu__8;viewImage__0;viewComment__0;colorbg__0;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 282, 'selectcode__270;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 347, 'url__/account/#login;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 346, 'url__/account/#register;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_menus', 10, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 327, 'url__/search/cat=Children/;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 328, 'url__/search/cat=Women/;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 329, 'url__/search/cat=Environment/;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 330, 'url__/search/cat=Health/;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 331, 'url__/search/cat=Education/;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 332, 'url__/search/cat=Poverty/;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 286, '__;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_faq', 57, '', '2015-03-25 16:38:38', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_faq_categories', 5, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 349, 'url__/users/logout/;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 350, 'url__/users/logout/;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 342, 'subtitle__;selectcode__283;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 338, 'subtitle__;selectcode__283;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 337, 'url__/account/#login;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_html', 280, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 335, 'subtitle__;selectcode__283;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 339, 'subtitle__;selectcode__283;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_html', 283, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_html', 305, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_html', 306, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_install', 119, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_install', 118, 'color__;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_install', 74, 'color__;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_invitation', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 351, 'subtitle__;selectcode__237;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_invitation', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 283, 'selectcode__316;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_faq', 54, '', '2015-03-25 16:15:31', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 278, 'follow__0;share__0;links__1;twitter__;facebook__;google__;shartwitter__1;sharfacebook__1;shargoogle__1;sharinlink__0;linksyoutube__channel/UC3CY-zmauPR59WtY4egrNYw;linkstwitter__MadadEG;linksfacebook__MadadEG;linksgoogle__u/0/105059430589511270317/posts;linksinlink__company/2595198?trk=tyah&trkInfo=tarId%3A1396189004125%2Ctas%3Amadad%2Cidx%3A1-1-1;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_install', 120, 'color__;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'sys_mobile_setting', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_html', 270, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_html', 318, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_html', 322, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 285, 'selecmenu__8;viewImage__0;viewComment__0;colorbg__0;', '2015-04-01 21:36:26', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 286, 'selecmenu__14;viewImage__0;viewComment__0;colorbg__0;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 0, 'selecmenu__10;viewImage__0;viewComment__0;colorbg__0;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 288, 'selecmenu__19;viewImage__0;viewComment__0;colorbg__0;', '2015-04-01 22:57:07', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 287, 'viwtype__images;seleccatnews__0;seleccat__66;seleccatvideo__0;seleccatpro__0;effect__random;style__theme-default;captionOpacity__1;Speed__800;pauseTime__4000;directionNav__true;directionNavHide__0;pauseOnHover__0;controlNavThumbs__0;morecss__;', '2015-04-01 15:55:13', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 219, 'subtitle__;selectcode__347;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 353, 'subtitle__;selectcode__348;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery', 376, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 354, 'subtitle__;selectcode__348;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 290, 'selecmenu__10;viewImage__0;viewComment__0;colorbg__0;', '2015-04-01 21:44:13', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_html', 348, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery_categories', 66, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 359, 'title__;alias__;link__;cat_id__,65;des__;order__;enabled__1;tags__;description__;keywords__;header__;', '2014-07-15 09:28:48', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 0, '', '2014-07-20 16:52:18', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'fiz_raza_types', 0, '', '2014-07-20 17:52:33', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'fiz_raza_types', 1, '', '2014-07-23 20:29:31', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 361, '', '2015-03-26 11:03:16', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 360, 'cat_id__37;nums__5;catPageViewTitle__1;catPageViewImage__1;catPageViewDes__1;catPageViewHist__0;catPageViewAuthor__0;catPageViewDate__0;desLimit__100;shareView__0;introInBody__1;thimageinBody__1;comment__1;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'sys_dataBluder', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_wizard', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_wizard', 13, '', '2015-03-30 01:24:27', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'sys_dataBluder', 19, '', '2015-03-30 12:12:20', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'sys_dataBluder', 20, '', '2015-03-30 19:56:43', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_wizard', 14, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 362, 'wizard__13;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'fiz_city', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'fiz_city', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'fiz_lawazim_packages_cat', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'fiz_lawazim_packages', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'fiz_lawazim_packages', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'fiz_lawazim_packages', 4, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'sys_admin_pkg', 14, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'sys_admin_menu', 38, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'fiz_reservation_settings', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'sys_dataBluder', 21, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_form', 12, '', '2015-03-30 12:06:24', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'fiz_extension', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'fiz_hotel_rooms', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'fiz_hotels', 0, '', '2014-06-29 07:15:36', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_language', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_language', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_language', 2, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'fiz_hotel_rooms', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'fiz_hotels_titles', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'fiz_hotels', 2, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'fiz_hotels', 3, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'fiz_extension', 24, '', '2014-06-29 07:34:16', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_html', 0, '', '2014-07-08 18:14:10', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_install', 0, '', '2014-07-30 17:33:25', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_users_groups', 3, '', '2015-04-01 12:53:19', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery', 392, '', '2014-07-15 09:24:40', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 363, 'gallery__64;rowNumbers__5;catPageViewTitle__0;catPageViewImage__0;catPageViewDes__0;catPageViewHist__0;', '2015-03-24 14:42:58', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'sys_site_status', 0, '', '2014-07-20 14:43:41', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'fiz_approved_status', 0, '', '2014-07-23 20:10:08', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'fiz_raza_types', 2, '', '2014-07-23 20:28:55', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'fiz_extension', 2, '', '2014-08-02 04:33:36', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'fiz_extension', 8, '', '2014-08-02 04:44:40', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'fiz_extension', 70, '', '2014-08-02 04:45:58', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'fiz_extension', 4, '', '2014-08-02 09:04:55', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'fiz_extension', 83, '', '2014-08-11 04:07:14', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'fiz_extension', 3, '', '2014-08-11 04:12:05', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'fiz_extension', 86, '', '2014-08-16 10:31:53', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'fiz_extension', 92, '', '2014-08-18 09:07:10', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_install', 135, '', '2015-03-20 12:23:26', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_content_article', 226, '', '2015-03-20 18:00:53', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery', 397, '', '2015-03-20 16:15:30', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery', 398, '', '2015-03-20 16:16:17', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery', 399, '', '2015-03-20 16:21:44', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery', 400, '', '2015-03-20 16:22:29', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery', 401, '', '2015-03-20 16:23:01', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery', 402, '', '2015-03-20 16:23:29', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery', 403, '', '2015-03-20 16:24:17', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery', 404, '', '2015-03-20 16:24:44', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery', 405, '', '2015-03-20 16:25:18', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery', 406, '', '2015-03-20 16:25:57', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery', 407, '', '2015-03-20 16:26:29', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery', 408, '', '2015-03-24 14:54:16', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery', 409, '', '2015-03-24 14:54:11', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery', 410, '', '2015-03-24 14:53:25', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery', 411, '', '2015-03-24 14:53:20', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery', 412, '', '2015-03-24 14:53:17', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery', 413, '', '2015-03-24 14:53:09', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery', 414, '', '2015-03-24 14:53:03', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery', 415, '', '2015-03-24 14:53:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery', 416, '', '2015-03-24 14:52:55', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery', 417, '', '2015-03-24 14:52:52', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_content_article', 241, '', '2015-03-20 17:51:21', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_content_article', 224, '', '2015-03-20 17:52:50', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_content_article', 213, '', '2015-03-20 17:54:39', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_content_article', 223, '', '2015-03-20 17:55:56', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_content_article', 225, '', '2015-03-20 17:57:21', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_content_article', 218, '', '2015-03-20 18:02:34', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_content_article', 216, '', '2015-03-20 18:04:54', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_content_article', 214, '', '2015-03-20 18:05:48', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_content_article', 242, '', '2015-03-20 18:07:04', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_content_article', 243, '', '2015-03-20 18:07:59', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_content_article', 244, '', '2015-03-20 18:08:59', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_content_article', 245, '', '2015-03-20 18:09:52', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_content_article', 246, '', '2015-03-20 18:10:51', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_content_article', 247, '', '2015-03-20 18:11:52', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery', 388, '', '2015-03-24 12:21:52', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery', 387, '', '2015-03-24 12:21:06', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery', 385, '', '2015-03-24 12:19:09', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_images_gallery', 386, '', '2015-03-31 13:33:00', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 358, 'url__#;', '2015-03-24 20:15:12', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 352, 'cat_id__36;nums__10;catPageViewTitle__1;catPageViewImage__1;catPageViewDes__1;catPageViewHist__0;catPageViewAuthor__0;catPageViewDate__0;desLimit__200;shareView__0;introInBody__0;thimageinBody__0;comment__0;', '2015-03-24 20:17:50', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 365, 'cat_id__38;nums__8;catPageViewTitle__1;catPageViewImage__1;catPageViewDes__1;catPageViewHist__0;catPageViewAuthor__0;catPageViewDate__0;desLimit__;shareView__0;introInBody__0;thimageinBody__0;comment__0;', '2015-04-01 22:52:40', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 368, 'faqtype__0;faqstyle__list;', '2015-04-01 22:54:29', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 366, 'subtitle__;selectcode__348;', '2015-03-24 21:43:31', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 367, 'addform__1;enabledMsgs__0;nums__10;', '2015-03-24 22:01:32', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_content_catgories', 38, '', '2015-03-25 15:13:15', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_content_article', 232, '', '2015-03-25 15:13:59', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_content_article', 231, '', '2015-03-25 15:14:13', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_content_article', 202, '', '2015-03-25 15:14:41', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_content_article', 203, '', '2015-03-25 15:14:51', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_content_article', 191, '', '2015-03-25 15:15:02', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_content_article', 190, '', '2015-03-25 15:15:15', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_content_article', 160, '', '2015-03-25 15:15:37', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_faq', 41, '', '2015-03-25 15:58:59', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_faq', 43, '', '2015-03-25 16:00:36', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_faq', 44, '', '2015-03-25 16:01:16', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_faq', 45, '', '2015-03-25 16:02:12', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_faq', 46, '', '2015-03-25 16:02:45', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_faq', 47, '', '2015-03-25 16:03:16', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_faq', 48, '', '2015-03-25 16:06:01', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_faq', 49, '', '2015-03-25 16:08:56', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_faq', 50, '', '2015-03-25 16:08:15', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_faq', 51, '', '2015-03-25 16:12:55', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_faq', 52, '', '2015-03-25 16:13:25', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_faq', 53, '', '2015-03-25 16:13:58', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_faq', 55, '', '2015-03-25 16:31:30', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_faq', 56, '', '2015-03-25 16:21:16', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_faq', 58, '', '2015-03-25 16:38:33', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 291, 'viewtype__h;cat_id__38;view__articles;Datatype__latest;dynamic__0;viewTitle__1;viewImage__0;viewDes__0;viewDesNum__;viewMViews__0;numberView__5;firstMainStyle__0;tagmaxfont__;tagminfont__;', '2015-03-25 18:09:56', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 292, 'citycode__EGXX0004;', '2015-03-25 18:10:57', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_faq', 59, '', '2015-03-25 16:38:27', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_faq', 60, '', '2015-03-25 16:39:01', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_faq', 61, '', '2015-03-25 16:39:23', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_html', 369, '', '2015-03-25 16:49:50', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_html', 376, '', '2015-03-25 16:50:13', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 369, 'wizard__13;', '2015-03-30 18:37:32', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'sys_dataBluder', 22, '', '2015-03-30 01:22:35', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_form', 13, '', '2015-03-30 15:30:01', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_html', 377, '', '2015-04-01 22:20:41', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 233, 'subtitle__;selectcode__377;', '2015-04-01 10:43:57', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_install', 136, '', '2015-04-01 12:52:48', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'sys_site_status', 1, '', '2015-04-01 21:34:46', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'sys_site_status', 2, '', '2015-04-01 14:46:15', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'sys_site_status', 3, '', '2015-04-01 16:28:32', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 355, 'url__;', '2015-04-01 16:42:43', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'sys_site_status', 4, '', '2015-04-01 16:38:03', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 370, 'url__#;', '2015-04-01 22:36:37', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_menus', 19, '', '2015-04-01 22:47:13', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 371, 'cat_id__38;nums__4;catPageViewTitle__1;catPageViewImage__1;catPageViewDes__1;catPageViewHist__0;catPageViewAuthor__0;catPageViewDate__0;desLimit__;shareView__0;introInBody__0;thimageinBody__0;comment__0;', '2015-04-01 22:48:51', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 372, 'url__#;', '2015-04-01 22:54:54', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_modules', 293, 'cat_id__39;view__categories;Datatype__0;dynamic__0;viewTitle__1;viewImage__0;viewDes__0;viewDesNum__100;viewMViews__0;numberView__10;firstMainStyle__0;tagmaxfont__;tagminfont__;', '2015-04-02 14:48:57', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_content_catgories', 39, '', '2015-04-02 12:08:20', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_content_catgories', 36, '', '2015-04-02 12:08:39', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_content_catgories', 40, '', '2015-04-02 13:02:35', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_content_catgories', 41, '', '2015-04-02 13:03:04', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'com_html', 387, '', '2015-04-02 14:57:36', '0000-00-00 00:00:00', 1, 0, 0),
(0, '', 'menu_itmes', 356, 'url__;', '2015-04-02 15:01:19', '0000-00-00 00:00:00', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sys_pugins_data`
--

CREATE TABLE IF NOT EXISTS `sys_pugins_data` (
  `title` varchar(255) NOT NULL,
  `com_type` varchar(255) NOT NULL,
  `com_id` int(11) NOT NULL,
  `data` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
`id` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3521 ;

--
-- Dumping data for table `sys_pugins_data`
--

INSERT INTO `sys_pugins_data` (`title`, `com_type`, `com_id`, `data`, `created`, `modified`, `enabled`, `order`, `delete`, `id`) VALUES
('', 'com_modules', 264, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 100),
('', 'com_modules', 261, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 103),
('', 'com_modules', 260, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 104),
('', 'com_modules', 257, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 98),
('', 'com_modules', 262, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 102),
('', 'com_modules', 263, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 101),
('', 'com_modules', 252, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 92),
('', 'com_modules', 265, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 99),
('', 'com_modules', 253, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 95),
('', 'menu_itmes', 261, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 109),
('', 'menu_itmes', 247, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 88),
('', 'com_html', 123, ';', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 996),
('plg_getForm', 'com_html', 123, 'name11__plg_getForm;formId__;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 997),
('', 'com_install', 107, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 329),
('', 'com_modules', 259, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 105),
('', 'com_modules', 258, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 106),
('', 'com_modules', 256, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 107),
('', 'com_modules', 255, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 108),
('plg_videosgallery', 'com_html', 123, 'name5__plg_videosgallery;imagegallery__65;imageWidth__100px;imageHeight__auto;imagesNumber__4;videogallery__1;vidimageWidth__100px;vidimageHeight__auto;vidimagesNumber__4;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 995),
('', 'com_install', 102, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1574),
('', 'com_products', 52, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 369),
('plg_paypal', 'com_products', 52, 'name13__plg_paypal;site__1,2,4,1;price__1,2,3,4;wigth__5,6,7,8;paypalCode__77777777777777fsdfsdfsdf;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 370),
('', 'com_install', 103, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1577),
('', 'menu_itmes', 0, '', '2014-07-20 16:52:18', '0000-00-00 00:00:00', 1, 0, 0, 3042),
('', 'menu_itmes', 263, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 376),
('', 'menu_itmes', 231, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 377),
('', 'com_products', 56, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 388),
('plg_videosgallery', 'com_content_article', 188, 'name10__plg_videosgallery;formId__2;videogallery__;vidimageWidth__100px;vidimageHeight__auto;vidimagesNumber__4;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 387),
('plg_PageData', 'com_content_article', 188, 'name9__plg_PageData;title__;url__;description__;keywords__;header__;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 386),
('plg_comments', 'com_content_article', 188, 'name5__plg_comments;imagegallery__64;imageWidth__100px;imageHeight__auto;imagesNumber__4;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 385),
('', 'com_content_article', 188, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 384),
('plg_priceing', 'com_products', 56, 'name7__plg_priceing;site__;price__0.0;wigth__0;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 389),
('plg_paypal', 'com_products', 56, 'name5__plg_paypal;paypalCode__;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 390),
('', 'site_setting', 3, '', '2015-03-23 21:14:13', '0000-00-00 00:00:00', 1, 0, 0, 3217),
('', 'sys_admin_pkg', 7, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 627),
('', 'sys_admin_menu', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2898),
('', 'sys_admin_menu', 15, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 410),
('', 'sys_admin_menu', 7, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 412),
('', 'com_users', 3, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 413),
('', 'com_content_catgories', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 421),
('', 'menu_itmes', 280, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 424),
('', 'com_html', 209, ';', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 480),
('plg_imagegallery', 'com_html', 209, 'name8__plg_imagegallery;imagegallery__;imageWidth__100px;imageHeight__auto;imagesNumber__4;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 478),
('plg_videosgallery', 'com_html', 209, 'name10__plg_videosgallery;videogallery__;vidimageWidth__100px;vidimageHeight__auto;vidimagesNumber__4;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 479),
('plg_getForm', 'com_html', 209, 'name5__plg_getForm;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 477),
('plg_rescores', 'com_html', 209, 'name12__plg_rescores;__cc;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 475),
('', 'menu_itmes', 281, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 492),
('plg_getForm', 'com_html', 209, 'name9__plg_getForm;formId__;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 476),
('', 'com_html', 209, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 474),
('plg_videosgallery', 'com_content_article', 240, 'name8__plg_videosgallery;videogallery__;vidimageWidth__100px;vidimageHeight__auto;vidimagesNumber__4;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 497),
('plg_getForm', 'com_content_article', 240, 'name6__plg_getForm;formId__;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 496),
('plg_imagegallery', 'com_content_article', 240, 'name7__plg_imagegallery;imagegallery__;imageWidth__100px;imageHeight__auto;imagesNumber__4;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 494),
('plg_PageData', 'com_content_article', 240, 'name14__plg_PageData;title__;url__;description__;keywords__;header__;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 495),
('', 'com_content_article', 240, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 493),
('plg_comments', 'com_content_article', 240, 'name5__plg_comments;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 498),
('', 'com_project_catgories', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 655),
('', 'com_project', 6, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 504),
('', 'com_project', 5, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 505),
('', 'com_project', 4, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 506),
('', 'com_project', 3, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 507),
('', 'com_project', 2, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 508),
('', 'com_project', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 509),
('', 'com_project', 7, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 510),
('', 'com_project_setting', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2512),
('', 'sys_admin_menu', 16, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 513),
('', 'com_google_map', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 516),
('', 'com_google_map', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 520),
('', 'com_google_map', 2, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 521),
('', 'menu_itmes', 283, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 527),
('', 'menu_itmes', 284, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 526),
('plg_rescores', 'com_project', 0, 'name7__plg_rescores;source__,1;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2047),
('plg_sponsor', 'com_project', 9, 'name5__plg_sponsor;sponsor_name__;sponsor_description__;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 661),
('plg_rescores', 'com_html', 123, 'name12__plg_rescores;source__1;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 994),
('', 'com_html', 123, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 993),
('plg_videosgallery', 'com_html', 196, 'name15__plg_videosgallery;videogallery__;vidimageWidth__100px;vidimageHeight__auto;vidimagesNumber__4;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 586),
('plg_imagegallery', 'com_html', 196, 'name8__plg_imagegallery;imagegallery__;imageWidth__100px;imageHeight__auto;imagesNumber__4;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 585),
('', 'com_html', 196, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 583),
('plg_getForm', 'com_html', 196, 'name7__plg_getForm;__cc;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 584),
('', 'com_modules', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2740),
('', 'com_modules', 266, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 601),
('', 'com_modules', 267, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 607),
('', 'com_modules', 268, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 606),
('', 'sys_admin_pkg', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 608),
('', 'sys_admin_pkg', 10, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 612),
('', 'sys_admin_menu', 9, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 635),
('', 'com_html_categories', 64, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1567),
('', 'sys_admin_menu', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 628),
('', 'sys_admin_pkg', 9, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 632),
('', 'sys_admin_menu', 6, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 634),
('', 'sys_admin_menu', 4, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 636),
('', 'sys_admin_menu', 5, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 643),
('', 'com_project', 9, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 659),
('plg_priceing', 'com_project', 9, 'name15__plg_priceing;price__52,62;des__fghfgh777777777879798,fghfgh798798;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 660),
('', 'com_modules', 269, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2037),
('', 'com_install', 111, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 669),
('', 'com_form', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2843),
('', 'com_form', 10, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 753),
('plg_cart', 'com_project', 14, 'name8__plg_cart;settings__-1;cart__-1;multiItems__0;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2288),
('plg_rescores', 'com_project', 14, 'name14__plg_rescores;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2287),
('', 'com_project', 10, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1681),
('plg_rescores', 'com_project', 11, 'name15__plg_rescores;settings__-1;cart__-1;multiItems__0;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2298),
('plg_rescores', 'com_project', 8, 'name10__plg_rescores;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1707),
('plg_othercatOptions', 'com_project_catgories', 1, 'name13__plg_othercatOptions;catcolor__abcede;pricingcolor__abcede;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2263),
('', 'plg_cart', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 748),
('', 'com_form', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2691),
('', 'com_form', 2, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 762),
('', 'com_modules', 271, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 781),
('', 'menu_itmes', 285, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2209),
('', 'com_users_settings', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2688),
('', 'com_form', 3, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2481),
('', 'com_modules', 272, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1023),
('plg_rescores', 'com_images_gallery', 359, 'name6__plg_rescores;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1017),
('', 'com_images_gallery', 359, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1016),
('', 'com_project_catgories', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2262),
('plg_othercatOptions', 'com_project_catgories', 3, 'name5__plg_othercatOptions;catcolor__e7842a;pricingcolor__e7842a;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2265),
('', 'com_project_catgories', 4, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2266),
('plg_othercatOptions', 'com_project_catgories', 4, 'name8__plg_othercatOptions;catcolor__89bd3c;pricingcolor__89bd3c;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2267),
('', 'com_project_catgories', 5, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2268),
('plg_othercatOptions', 'com_project_catgories', 5, 'name12__plg_othercatOptions;catcolor__e75239;pricingcolor__e75239;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2269),
('', 'com_project_catgories', 6, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2272),
('plg_othercatOptions', 'com_project_catgories', 6, 'name7__plg_othercatOptions;catcolor__d6de21;pricingcolor__d6de21;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2273),
('', 'com_project_catgories', 7, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2270),
('plg_othercatOptions', 'com_project_catgories', 7, 'name7__plg_othercatOptions;catcolor__f7d600;pricingcolor__f7d600;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2271),
('', 'com_modules', 270, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2567),
('', 'menu_itmes', 287, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2748),
('plg_cart', 'com_project', 8, 'name8__plg_cart;cart__-1;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1708),
('plg_cart', 'com_project', 10, 'name8__plg_cart;cart__-1;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1684),
('plg_rescores', 'com_project', 10, 'name7__plg_rescores;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1683),
('', 'com_modules', 273, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 922),
('plg_rescores', 'com_images_gallery', 360, 'name8__plg_rescores;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 917),
('', 'com_images_gallery', 360, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 916),
('', 'com_images_gallery_categories', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2813),
('', 'com_menus', 8, '', '2015-03-24 21:41:03', '0000-00-00 00:00:00', 1, 0, 0, 3283),
('', 'menu_itmes', 289, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2730),
('', 'menu_itmes', 290, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2731),
('', 'menu_itmes', 291, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2237),
('', 'menu_itmes', 292, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2238),
('', 'menu_itmes', 293, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2239),
('', 'com_project_catgories', 3, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2264),
('plg_rescores', 'com_images_gallery', 370, 'name10__plg_rescores;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2739),
('', 'com_images_gallery', 370, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2738),
('plg_priceing', 'com_project', 8, 'name5__plg_priceing;price__0.0;act__0;des__;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1706),
('', 'com_project', 8, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1705),
('plg_rescores', 'com_images_gallery', 372, 'name13__plg_rescores;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2556),
('', 'com_images_gallery', 372, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2555),
('plg_rescores', 'com_images_gallery', 371, 'name8__plg_rescores;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2558),
('', 'com_images_gallery', 371, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2557),
('', 'com_menus', 14, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 989),
('', 'com_menus', 13, '', '2015-04-01 21:48:57', '0000-00-00 00:00:00', 1, 0, 0, 3484),
('', 'menu_itmes', 303, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2640),
('', 'menu_itmes', 305, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2521),
('', 'menu_itmes', 306, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2519),
('', 'menu_itmes', 307, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2523),
('', 'menu_itmes', 308, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2461),
('', 'menu_itmes', 309, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2524),
('', 'menu_itmes', 312, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1040),
('', 'com_modules', 274, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2040),
('', 'menu_itmes', 313, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1044),
('', 'menu_itmes', 314, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1047),
('', 'menu_itmes', 315, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1049),
('', 'menu_itmes', 320, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2208),
('', 'menu_itmes', 321, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1192),
('plg_priceing', 'com_project', 14, 'name15__plg_priceing;price__,0.0;act__,0;des__,;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2286),
('', 'com_html', 228, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2590),
('', 'com_html', 229, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2591),
('', 'com_html', 220, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1125),
('plg_getForm', 'com_html', 220, 'name7__plg_getForm;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1126),
('plg_videosgallery', 'com_html', 220, 'name14__plg_videosgallery;videogallery__;vidimageWidth__100px;vidimageHeight__auto;vidimagesNumber__4;moreData__;formId__;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1127),
('', 'com_html', 222, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1128),
('plg_rescores', 'com_html', 222, 'name14__plg_rescores;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1129),
('plg_imagegallery', 'com_html', 222, 'name10__plg_imagegallery;imagegallery__;imageWidth__100px;imageHeight__auto;imagesNumber__4;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1130),
('plg_videosgallery', 'com_html', 222, 'name7__plg_videosgallery;videogallery__;vidimageWidth__100px;vidimageHeight__auto;vidimagesNumber__4;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1131),
('plg_getForm', 'com_html', 222, 'name15__plg_getForm;formId__;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1132),
('plg_cart', 'com_project', 16, 'name15__plg_cart;cart__1;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1517),
('', 'com_project_status', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2121),
('', 'com_modules', 275, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2115),
('plg_priceing', 'com_project', 16, 'name10__plg_priceing;price__10,20,30,40,50,60,70,,,,,,,,,,,,,,,,,,,,,,;act__0,0,0,1,0,0,0,,,,,,,,,,,,,,,,,,,,,,;des__This is description for 10 This is description for 10 This is description for 10,This is description for 20 This is description for 20 This is description for 20,This is description for 30 This is description for 30 This is description for 30,This is description for 40 This is description for 40 This is description for 40,This is description for 50 This is description for 50 This is description for 50,This is description for 60 This is description for 60 This is description for 60,This is description for 70 This is description for 70 This is description for 70,,,,,,,,,,,,,,,,,,,,,,;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1515),
('', 'com_html', 283, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2530),
('', 'com_html', 280, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2518),
('', 'menu_itmes', 335, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2526),
('', 'menu_itmes', 339, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2528),
('', 'com_html', 226, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2513),
('', 'menu_itmes', 322, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1193),
('', 'menu_itmes', 323, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1194),
('', 'menu_itmes', 324, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1195),
('', 'menu_itmes', 326, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1205),
('', 'menu_itmes', 304, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1231),
('', 'menu_itmes', 325, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2507),
('', 'menu_itmes', 310, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2460),
('', 'menu_itmes', 319, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2525),
('plg_rescores', 'com_project', 16, 'name13__plg_rescores;source__1;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1516),
('', 'com_project', 16, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1514),
('plg_cart', 'com_project', 17, 'name15__plg_cart;cart__;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1545),
('plg_rescores', 'com_project', 17, 'name10__plg_rescores;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1544),
('plg_priceing', 'com_project', 17, 'name7__plg_priceing;price__0.0;act__0;des__;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1543),
('', 'com_project', 17, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1542),
('', 'com_html_categories', 65, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1568),
('', 'com_html_categories', 0, '', '2014-07-08 18:14:23', '0000-00-00 00:00:00', 1, 0, 0, 3028),
('plg_cart', 'com_project', 11, 'name7__plg_cart;price__,0.0;act__,0;des__,;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2297),
('', 'com_install', 85, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1575),
('', 'com_install', 104, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1579),
('', 'com_install', 108, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1580),
('', 'com_html', 224, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1581),
('', 'com_html', 227, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1582),
('', 'com_project_status', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1628),
('', 'com_project_status', 2, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2701),
('', 'com_project', 11, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2296),
('', 'com_project', 14, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2285),
('plg_rescores', 'com_project', 13, 'name10__plg_rescores;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2276),
('plg_priceing', 'com_project', 10, 'name15__plg_priceing;price__0.0;act__0;des__;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1682),
('plg_cart', 'com_project', 12, 'name8__plg_cart;settings__-1;cart__-1;multiItems__0;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2295),
('', 'com_modules', 276, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1689),
('', 'com_modules', 277, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2200),
('', 'menu_itmes', 343, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1709),
('', 'com_project_status', 3, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2139),
('', 'com_html', 230, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1945),
('', 'com_modules', 278, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2654),
('', 'plg_rescores', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2661),
('', 'plg_rescores', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 1909),
('', 'com_html', 237, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2593),
('', 'menu_itmes', 341, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2508),
('', 'com_faq_categories', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2406),
('', 'com_faq', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2409),
('', 'com_faq', 42, '', '2015-03-25 16:00:13', '0000-00-00 00:00:00', 1, 0, 0, 3340),
('', 'com_faq_categories', 2, '', '2015-03-25 15:59:17', '0000-00-00 00:00:00', 1, 0, 0, 3339),
('', 'com_faq_categories', 3, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2242),
('', 'com_faq_categories', 4, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2414),
('', 'plg_cart', 1, '', '2014-07-01 09:16:58', '0000-00-00 00:00:00', 1, 0, 0, 2997),
('', 'plg_comments', 33, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2032),
('', 'menu_itmes', 344, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2035),
('', 'com_project', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2045),
('plg_priceing', 'com_project', 0, 'name9__plg_priceing;price__,100,200,300,350,400,450;act__,0,0,0,0,0,0;des__,this is 100,this is 200,this is 300,this is 350,this is 400,this is 450;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2046),
('plg_cart', 'com_project', 0, 'name5__plg_cart;settings__-1;cart__-1;multiItems__0;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2048),
('', 'com_modules', 279, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2569),
('', 'com_html', 264, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2575),
('', 'com_modules', 280, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2515),
('', 'com_project', 13, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2274),
('plg_priceing', 'com_project', 13, 'name15__plg_priceing;price__,0.0;act__,0;des__,;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2275),
('', 'menu_itmes', 345, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2186),
('', 'com_html', 266, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2185),
('', 'com_modules', 281, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2188),
('', 'com_modules', 282, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2199),
('', 'menu_itmes', 347, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2210),
('', 'menu_itmes', 346, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2213),
('', 'com_menus', 10, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2798),
('', 'menu_itmes', 327, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2459),
('', 'menu_itmes', 328, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2216),
('', 'menu_itmes', 329, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2217),
('', 'menu_itmes', 330, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2218),
('', 'menu_itmes', 331, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2219),
('', 'menu_itmes', 332, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2221),
('plg_cart', 'com_project', 13, 'name6__plg_cart;settings__-1;cart__-1;multiItems__0;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2277),
('', 'com_project', 12, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2293),
('plg_rescores', 'com_project', 12, 'name6__plg_rescores;price__,0.0;act__,0;des__,;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2294),
('', 'menu_itmes', 286, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2367),
('plg_rescores', 'com_project', 15, 'name12__plg_rescores;source__,1;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2669),
('plg_cart', 'com_project', 15, 'name15__plg_cart;title__rrrr sdfgs sdfsd ;url__ffffff;description__Description Description Description;keywords__Keywords Keywords Keywords Keywords Keywords Keywords Keywords Keywords Keywords;header__<ssss>tttt</ssss>;settings__1;cart__1;multiItems__0;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2670),
('', 'com_faq', 57, '', '2015-03-25 16:38:38', '0000-00-00 00:00:00', 1, 0, 0, 3384),
('', 'com_faq_categories', 5, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2535),
('', 'com_project', 15, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2667),
('plg_priceing', 'com_project', 15, 'name5__plg_priceing;price__,100,250,500,800,1200,1500;act__,0,0,0,1,0,0;des__,تساعد في توفير معدات الإضاءة للمنزل,تساعد في توفير الكابلات الكهربائية للمنزل,تساعد في توفير الهيكل الحامل للخلايا الشمسية,تساعد في توفير بطارية تخزين للطاقة المنتجة من الخلايا الشمسية,تساعد في توفير جهاز تحويل الطاقة المنتجة من الخلايا الشمسية,تساعد في توفير الخلايا الشمسية للمنزل;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2668),
('', 'com_project', 19, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2692),
('plg_priceing', 'com_project', 19, 'name7__plg_priceing;price__,100,250,500,800,1200,1500;act__,1,0,0,0,0,0;des__, تساعد في توفير معدات الإضاءة للمنزل,تساعد في توفير الكابلات الكهربائية للمنزل,تساعد في توفير الهيكل الحامل للخلايا الشمسية,تساعد في توفير بطارية تخزين للطاقة المنتجة من الخلايا الشمسية,تساعد في توفير جهاز تحويل الطاقة المنتجة من الخلايا الشمسية,تساعد في توفير الخلايا الشمسية للمنزل;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2693),
('', 'menu_itmes', 349, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2489),
('', 'menu_itmes', 350, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2488),
('', 'menu_itmes', 342, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2529),
('', 'menu_itmes', 338, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2527),
('', 'menu_itmes', 337, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2511),
('plg_rescores', 'com_project', 19, 'name10__plg_rescores;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2694),
('plg_PageData', 'com_project', 19, 'name13__plg_PageData;title__سهم في مشروع بيت البركة;url__fiz.qlegal.net;th_image__beet-el-baraka-thumb.jpg;description__This is great project;keywords__this s eywords, and more words;header__this is header;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2695),
('', 'com_html', 305, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2613),
('', 'com_html', 306, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2721),
('', 'com_install', 118, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2641),
('', 'com_install', 74, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2629),
('', 'com_install', 119, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2633),
('', 'com_invitation', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2643),
('', 'menu_itmes', 351, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2733),
('', 'com_invitation', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2642),
('', 'com_modules', 283, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2649),
('', 'com_faq', 54, '', '2015-03-25 16:15:31', '0000-00-00 00:00:00', 1, 0, 0, 3360),
('', 'com_install', 120, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2656),
('', 'sys_mobile_setting', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2662),
('', 'com_html', 270, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2671),
('', 'com_html', 318, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2677),
('', 'com_html', 322, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2687),
('plg_cart', 'com_project', 19, 'name14__plg_cart;settings__-1;cart__-1;multiItems__0;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2696),
('', 'com_modules', 285, '', '2015-04-01 21:36:26', '0000-00-00 00:00:00', 1, 0, 0, 3467),
('', 'com_modules', 286, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2728),
('', 'menu_itmes', 352, '', '2015-03-24 20:17:50', '0000-00-00 00:00:00', 1, 0, 0, 3282),
('', 'com_modules', 287, '', '2015-04-01 15:55:13', '0000-00-00 00:00:00', 1, 0, 0, 3445),
('', 'com_modules', 288, '', '2015-04-01 22:57:07', '0000-00-00 00:00:00', 1, 0, 0, 3508),
('', 'com_modules', 289, '', '2015-04-01 22:43:50', '0000-00-00 00:00:00', 1, 0, 0, 3498),
('', 'menu_itmes', 219, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2750),
('', 'com_images_gallery', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2831),
('plg_rescores', 'com_images_gallery', 0, 'name11__plg_rescores;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2832),
('', 'menu_itmes', 353, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2770),
('', 'com_images_gallery', 376, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2763),
('plg_rescores', 'com_images_gallery', 376, 'name8__plg_rescores;', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2764),
('', 'menu_itmes', 354, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2775),
('', 'com_modules', 290, '', '2015-04-01 21:44:13', '0000-00-00 00:00:00', 1, 0, 0, 3479),
('', 'com_html', 348, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2985),
('', 'com_images_gallery_categories', 66, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2811),
('', 'menu_itmes', 359, '', '2014-07-15 09:28:48', '0000-00-00 00:00:00', 1, 0, 0, 3035),
('', 'menu_itmes', 360, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2837),
('', 'menu_itmes', 361, '', '2015-03-26 11:03:16', '0000-00-00 00:00:00', 1, 0, 0, 3398),
('', 'sys_dataBluder', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2917),
('', 'com_wizard', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2861),
('', 'com_wizard', 13, '', '2015-03-30 01:24:27', '0000-00-00 00:00:00', 1, 0, 0, 3402),
('', 'sys_dataBluder', 19, '', '2015-03-30 12:12:20', '0000-00-00 00:00:00', 1, 0, 0, 3405),
('', 'sys_dataBluder', 20, '', '2015-03-30 19:56:43', '0000-00-00 00:00:00', 1, 0, 0, 3420),
('', 'com_wizard', 14, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2878),
('', 'menu_itmes', 362, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2866),
('', 'fiz_city', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2887),
('', 'fiz_city', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2888),
('', 'fiz_lawazim_packages_cat', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2906),
('', 'fiz_lawazim_packages', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2908),
('', 'fiz_lawazim_packages', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2892),
('', 'fiz_lawazim_packages', 4, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2896),
('', 'sys_admin_pkg', 14, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2897),
('', 'sys_admin_menu', 38, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2900),
('', 'fiz_reservation_settings', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2907),
('', 'sys_dataBluder', 21, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2947),
('', 'com_form', 12, '', '2015-03-30 12:06:24', '0000-00-00 00:00:00', 1, 0, 0, 3404),
('', 'fiz_extension', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2961),
('', 'fiz_hotel_rooms', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2988),
('', 'fiz_hotels', 0, '', '2014-06-29 07:15:36', '0000-00-00 00:00:00', 1, 0, 0, 2993),
('', 'com_language', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2970),
('', 'com_language', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2977),
('', 'com_language', 2, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2976),
('', 'fiz_hotel_rooms', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2978),
('', 'fiz_hotels_titles', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2991),
('', 'fiz_hotels', 2, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2984),
('', 'fiz_hotels', 3, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 2992),
('', 'fiz_extension', 24, '', '2014-06-29 07:34:16', '0000-00-00 00:00:00', 1, 0, 0, 2996),
('', 'com_html', 0, '', '2014-07-08 18:14:09', '0000-00-00 00:00:00', 1, 0, 0, 3027),
('', 'com_install', 0, '', '2014-07-30 17:33:25', '0000-00-00 00:00:00', 1, 0, 0, 3060),
('', 'com_users_groups', 3, '', '2015-04-01 12:53:19', '0000-00-00 00:00:00', 1, 0, 0, 3434),
('', 'com_images_gallery', 392, '', '2014-07-15 09:24:40', '0000-00-00 00:00:00', 1, 0, 0, 3033),
('plg_rescores', 'com_images_gallery', 392, 'name5__plg_rescores;', '2014-07-15 09:24:40', '0000-00-00 00:00:00', 1, 0, 0, 3034),
('', 'menu_itmes', 363, '', '2015-03-24 14:42:58', '0000-00-00 00:00:00', 1, 0, 0, 3248),
('', 'sys_site_status', 0, '', '2014-07-20 14:43:41', '0000-00-00 00:00:00', 1, 0, 0, 3038),
('', 'fiz_raza_types', 0, '', '2014-07-20 17:52:33', '0000-00-00 00:00:00', 1, 0, 0, 3046),
('', 'fiz_raza_types', 1, '', '2014-07-23 20:29:31', '0000-00-00 00:00:00', 1, 0, 0, 3059),
('', 'fiz_approved_status', 0, '', '2014-07-23 20:10:08', '0000-00-00 00:00:00', 1, 0, 0, 3056),
('', 'fiz_raza_types', 2, '', '2014-07-23 20:28:55', '0000-00-00 00:00:00', 1, 0, 0, 3058),
('', 'fiz_extension', 2, '', '2014-08-02 04:33:36', '0000-00-00 00:00:00', 1, 0, 0, 3067),
('', 'fiz_extension', 8, '', '2014-08-02 04:44:40', '0000-00-00 00:00:00', 1, 0, 0, 3069),
('', 'fiz_extension', 70, '', '2014-08-02 04:45:58', '0000-00-00 00:00:00', 1, 0, 0, 3070),
('', 'fiz_extension', 4, '', '2014-08-02 09:04:55', '0000-00-00 00:00:00', 1, 0, 0, 3071),
('', 'fiz_extension', 83, '', '2014-08-11 04:07:14', '0000-00-00 00:00:00', 1, 0, 0, 3072),
('', 'fiz_extension', 3, '', '2014-08-11 04:12:05', '0000-00-00 00:00:00', 1, 0, 0, 3073),
('', 'fiz_extension', 86, '', '2014-08-16 10:31:53', '0000-00-00 00:00:00', 1, 0, 0, 3074),
('', 'fiz_extension', 92, '', '2014-08-18 09:07:10', '0000-00-00 00:00:00', 1, 0, 0, 3076),
('', 'com_install', 135, '', '2015-03-20 12:23:26', '0000-00-00 00:00:00', 1, 0, 0, 3077),
('plg_imagegallery', 'com_content_article', 226, 'name8__plg_imagegallery;imagegallery__0;imageWidth__100px;imageHeight__auto;imagesNumber__4;', '2015-03-20 18:00:53', '0000-00-00 00:00:00', 1, 0, 0, 3164),
('plg_getForm', 'com_content_article', 226, 'name7__plg_getForm;formId__0;', '2015-03-20 18:00:53', '0000-00-00 00:00:00', 1, 0, 0, 3162),
('plg_videosgallery', 'com_content_article', 226, 'name11__plg_videosgallery;videogallery__0;vidimageWidth__100px;vidimageHeight__auto;vidimagesNumber__4;', '2015-03-20 18:00:53', '0000-00-00 00:00:00', 1, 0, 0, 3163),
('', 'com_content_article', 226, '', '2015-03-20 18:00:53', '0000-00-00 00:00:00', 1, 0, 0, 3159),
('', 'com_content_article', 226, ';', '2015-03-20 18:00:53', '0000-00-00 00:00:00', 1, 0, 0, 3160),
('plg_PageData', 'com_content_article', 226, 'name10__plg_PageData;title__;url__;th_image__;description__;keywords__;header__;', '2015-03-20 18:00:53', '0000-00-00 00:00:00', 1, 0, 0, 3161),
('', 'com_images_gallery', 397, '', '2015-03-20 16:15:30', '0000-00-00 00:00:00', 1, 0, 0, 3089),
('plg_rescores', 'com_images_gallery', 397, 'name9__plg_rescores;', '2015-03-20 16:15:30', '0000-00-00 00:00:00', 1, 0, 0, 3090),
('', 'com_images_gallery', 398, '', '2015-03-20 16:16:17', '0000-00-00 00:00:00', 1, 0, 0, 3091),
('plg_rescores', 'com_images_gallery', 398, 'name6__plg_rescores;', '2015-03-20 16:16:17', '0000-00-00 00:00:00', 1, 0, 0, 3092),
('', 'com_images_gallery', 399, '', '2015-03-20 16:21:44', '0000-00-00 00:00:00', 1, 0, 0, 3093),
('plg_rescores', 'com_images_gallery', 399, 'name7__plg_rescores;', '2015-03-20 16:21:44', '0000-00-00 00:00:00', 1, 0, 0, 3094),
('', 'com_images_gallery', 400, '', '2015-03-20 16:22:29', '0000-00-00 00:00:00', 1, 0, 0, 3095),
('plg_rescores', 'com_images_gallery', 400, 'name5__plg_rescores;', '2015-03-20 16:22:29', '0000-00-00 00:00:00', 1, 0, 0, 3096),
('', 'com_images_gallery', 401, '', '2015-03-20 16:23:01', '0000-00-00 00:00:00', 1, 0, 0, 3097),
('plg_rescores', 'com_images_gallery', 401, 'name14__plg_rescores;', '2015-03-20 16:23:01', '0000-00-00 00:00:00', 1, 0, 0, 3098),
('', 'com_images_gallery', 402, '', '2015-03-20 16:23:29', '0000-00-00 00:00:00', 1, 0, 0, 3099),
('plg_rescores', 'com_images_gallery', 402, 'name7__plg_rescores;', '2015-03-20 16:23:29', '0000-00-00 00:00:00', 1, 0, 0, 3100),
('', 'com_images_gallery', 403, '', '2015-03-20 16:24:17', '0000-00-00 00:00:00', 1, 0, 0, 3101),
('plg_rescores', 'com_images_gallery', 403, 'name14__plg_rescores;', '2015-03-20 16:24:17', '0000-00-00 00:00:00', 1, 0, 0, 3102),
('', 'com_images_gallery', 404, '', '2015-03-20 16:24:44', '0000-00-00 00:00:00', 1, 0, 0, 3103),
('plg_rescores', 'com_images_gallery', 404, 'name8__plg_rescores;', '2015-03-20 16:24:44', '0000-00-00 00:00:00', 1, 0, 0, 3104),
('', 'com_images_gallery', 405, '', '2015-03-20 16:25:18', '0000-00-00 00:00:00', 1, 0, 0, 3105),
('plg_rescores', 'com_images_gallery', 405, 'name10__plg_rescores;', '2015-03-20 16:25:18', '0000-00-00 00:00:00', 1, 0, 0, 3106),
('', 'com_images_gallery', 406, '', '2015-03-20 16:25:57', '0000-00-00 00:00:00', 1, 0, 0, 3107),
('plg_rescores', 'com_images_gallery', 406, 'name14__plg_rescores;', '2015-03-20 16:25:57', '0000-00-00 00:00:00', 1, 0, 0, 3108),
('', 'com_images_gallery', 407, '', '2015-03-20 16:26:29', '0000-00-00 00:00:00', 1, 0, 0, 3109),
('plg_rescores', 'com_images_gallery', 407, 'name14__plg_rescores;', '2015-03-20 16:26:29', '0000-00-00 00:00:00', 1, 0, 0, 3110),
('', 'com_images_gallery', 408, '', '2015-03-24 14:54:16', '0000-00-00 00:00:00', 1, 0, 0, 3275),
('', 'com_images_gallery', 409, '', '2015-03-24 14:54:11', '0000-00-00 00:00:00', 1, 0, 0, 3273),
('plg_rescores', 'com_images_gallery', 410, 'name12__plg_rescores;', '2015-03-24 14:53:25', '0000-00-00 00:00:00', 1, 0, 0, 3268),
('', 'com_images_gallery', 410, '', '2015-03-24 14:53:25', '0000-00-00 00:00:00', 1, 0, 0, 3267),
('plg_rescores', 'com_images_gallery', 411, 'name7__plg_rescores;', '2015-03-24 14:53:20', '0000-00-00 00:00:00', 1, 0, 0, 3266),
('', 'com_images_gallery', 411, '', '2015-03-24 14:53:20', '0000-00-00 00:00:00', 1, 0, 0, 3265),
('', 'com_images_gallery', 412, '', '2015-03-24 14:53:17', '0000-00-00 00:00:00', 1, 0, 0, 3263),
('plg_rescores', 'com_images_gallery', 413, 'name12__plg_rescores;', '2015-03-24 14:53:09', '0000-00-00 00:00:00', 1, 0, 0, 3260),
('', 'com_images_gallery', 413, '', '2015-03-24 14:53:09', '0000-00-00 00:00:00', 1, 0, 0, 3259),
('', 'com_images_gallery', 414, '', '2015-03-24 14:53:03', '0000-00-00 00:00:00', 1, 0, 0, 3257),
('plg_rescores', 'com_images_gallery', 415, 'name8__plg_rescores;', '2015-03-24 14:53:00', '0000-00-00 00:00:00', 1, 0, 0, 3256),
('', 'com_images_gallery', 415, '', '2015-03-24 14:53:00', '0000-00-00 00:00:00', 1, 0, 0, 3255),
('plg_rescores', 'com_images_gallery', 416, 'name11__plg_rescores;', '2015-03-24 14:52:55', '0000-00-00 00:00:00', 1, 0, 0, 3254),
('', 'com_images_gallery', 416, '', '2015-03-24 14:52:55', '0000-00-00 00:00:00', 1, 0, 0, 3253),
('plg_rescores', 'com_images_gallery', 417, 'name12__plg_rescores;', '2015-03-24 14:52:52', '0000-00-00 00:00:00', 1, 0, 0, 3252),
('', 'com_images_gallery', 417, '', '2015-03-24 14:52:52', '0000-00-00 00:00:00', 1, 0, 0, 3251),
('', 'com_content_article', 241, '', '2015-03-20 17:51:21', '0000-00-00 00:00:00', 1, 0, 0, 3131),
('plg_PageData', 'com_content_article', 241, 'name7__plg_PageData;title__;url__;th_image__;description__;keywords__;header__;', '2015-03-20 17:51:21', '0000-00-00 00:00:00', 1, 0, 0, 3132),
('plg_videosgallery', 'com_content_article', 241, 'name5__plg_videosgallery;formId__0;videogallery__0;vidimageWidth__100px;vidimageHeight__auto;vidimagesNumber__4;', '2015-03-20 17:51:21', '0000-00-00 00:00:00', 1, 0, 0, 3133),
('plg_imagegallery', 'com_content_article', 241, 'name8__plg_imagegallery;imagegallery__0;imageWidth__100px;imageHeight__auto;imagesNumber__4;', '2015-03-20 17:51:21', '0000-00-00 00:00:00', 1, 0, 0, 3134),
('plg_imagegallery', 'com_content_article', 224, 'name12__plg_imagegallery;imagegallery__0;imageWidth__100px;imageHeight__auto;imagesNumber__4;', '2015-03-20 17:52:50', '0000-00-00 00:00:00', 1, 0, 0, 3144),
('plg_videosgallery', 'com_content_article', 224, 'name11__plg_videosgallery;videogallery__0;vidimageWidth__100px;vidimageHeight__auto;vidimagesNumber__4;', '2015-03-20 17:52:50', '0000-00-00 00:00:00', 1, 0, 0, 3143),
('plg_getForm', 'com_content_article', 224, 'name13__plg_getForm;formId__0;', '2015-03-20 17:52:50', '0000-00-00 00:00:00', 1, 0, 0, 3142),
('', 'com_content_article', 224, '', '2015-03-20 17:52:50', '0000-00-00 00:00:00', 1, 0, 0, 3140),
('plg_PageData', 'com_content_article', 224, 'name8__plg_PageData;title__;url__;th_image__;description__;keywords__;header__;', '2015-03-20 17:52:50', '0000-00-00 00:00:00', 1, 0, 0, 3141),
('', 'com_content_article', 213, '', '2015-03-20 17:54:39', '0000-00-00 00:00:00', 1, 0, 0, 3145),
('plg_PageData', 'com_content_article', 213, 'name11__plg_PageData;title__;url__;th_image__;description__;keywords__;header__;', '2015-03-20 17:54:39', '0000-00-00 00:00:00', 1, 0, 0, 3146),
('plg_getForm', 'com_content_article', 213, 'name10__plg_getForm;formId__0;', '2015-03-20 17:54:39', '0000-00-00 00:00:00', 1, 0, 0, 3147),
('plg_videosgallery', 'com_content_article', 213, 'name14__plg_videosgallery;videogallery__0;vidimageWidth__100px;vidimageHeight__auto;vidimagesNumber__4;', '2015-03-20 17:54:39', '0000-00-00 00:00:00', 1, 0, 0, 3148),
('plg_imagegallery', 'com_content_article', 213, 'name9__plg_imagegallery;imagegallery__0;imageWidth__100px;imageHeight__auto;imagesNumber__4;', '2015-03-20 17:54:39', '0000-00-00 00:00:00', 1, 0, 0, 3149),
('', 'com_content_article', 223, '', '2015-03-20 17:55:56', '0000-00-00 00:00:00', 1, 0, 0, 3150),
('plg_PageData', 'com_content_article', 223, 'name12__plg_PageData;title__;url__;th_image__;description__;keywords__;header__;', '2015-03-20 17:55:56', '0000-00-00 00:00:00', 1, 0, 0, 3151),
('plg_imagegallery', 'com_content_article', 223, 'name5__plg_imagegallery;formId__0;', '2015-03-20 17:55:56', '0000-00-00 00:00:00', 1, 0, 0, 3152),
('plg_videosgallery', 'com_content_article', 223, 'name8__plg_videosgallery;videogallery__0;vidimageWidth__100px;vidimageHeight__auto;vidimagesNumber__4;imagegallery__0;imageWidth__100px;imageHeight__auto;imagesNumber__4;', '2015-03-20 17:55:56', '0000-00-00 00:00:00', 1, 0, 0, 3153),
('', 'com_content_article', 225, '', '2015-03-20 17:57:21', '0000-00-00 00:00:00', 1, 0, 0, 3154),
('plg_PageData', 'com_content_article', 225, 'name11__plg_PageData;title__;url__;th_image__;description__;keywords__;header__;', '2015-03-20 17:57:21', '0000-00-00 00:00:00', 1, 0, 0, 3155),
('plg_getForm', 'com_content_article', 225, 'name9__plg_getForm;formId__0;', '2015-03-20 17:57:21', '0000-00-00 00:00:00', 1, 0, 0, 3156),
('plg_videosgallery', 'com_content_article', 225, 'name6__plg_videosgallery;videogallery__0;vidimageWidth__100px;vidimageHeight__auto;vidimagesNumber__4;', '2015-03-20 17:57:21', '0000-00-00 00:00:00', 1, 0, 0, 3157),
('plg_imagegallery', 'com_content_article', 225, 'name15__plg_imagegallery;imagegallery__0;imageWidth__100px;imageHeight__auto;imagesNumber__4;', '2015-03-20 17:57:21', '0000-00-00 00:00:00', 1, 0, 0, 3158),
('plg_videosgallery', 'com_content_article', 218, 'name11__plg_videosgallery;videogallery__0;vidimageWidth__100px;vidimageHeight__auto;vidimagesNumber__4;imagegallery__0;imageWidth__100px;imageHeight__auto;imagesNumber__4;', '2015-03-20 18:02:34', '0000-00-00 00:00:00', 1, 0, 0, 3173),
('plg_imagegallery', 'com_content_article', 218, 'name14__plg_imagegallery;formId__0;', '2015-03-20 18:02:34', '0000-00-00 00:00:00', 1, 0, 0, 3172),
('', 'com_content_article', 218, '', '2015-03-20 18:02:34', '0000-00-00 00:00:00', 1, 0, 0, 3170),
('plg_PageData', 'com_content_article', 218, 'name10__plg_PageData;title__;url__;th_image__;description__;keywords__;header__;', '2015-03-20 18:02:34', '0000-00-00 00:00:00', 1, 0, 0, 3171),
('plg_videosgallery', 'com_content_article', 216, 'name10__plg_videosgallery;videogallery__0;vidimageWidth__100px;vidimageHeight__auto;vidimagesNumber__4;imagegallery__0;imageWidth__100px;imageHeight__auto;imagesNumber__4;', '2015-03-20 18:04:54', '0000-00-00 00:00:00', 1, 0, 0, 3182),
('plg_imagegallery', 'com_content_article', 216, 'name7__plg_imagegallery;formId__0;', '2015-03-20 18:04:54', '0000-00-00 00:00:00', 1, 0, 0, 3181),
('', 'com_content_article', 216, '', '2015-03-20 18:04:54', '0000-00-00 00:00:00', 1, 0, 0, 3179),
('plg_PageData', 'com_content_article', 216, 'name5__plg_PageData;title__;url__;th_image__;description__;keywords__;header__;', '2015-03-20 18:04:54', '0000-00-00 00:00:00', 1, 0, 0, 3180),
('', 'com_content_article', 214, '', '2015-03-20 18:05:48', '0000-00-00 00:00:00', 1, 0, 0, 3183),
('plg_videosgallery', 'com_content_article', 214, 'name11__plg_videosgallery;moreData__;', '2015-03-20 18:05:48', '0000-00-00 00:00:00', 1, 0, 0, 3184),
('plg_PageData', 'com_content_article', 214, 'name7__plg_PageData;title__;url__;th_image__;description__;keywords__;header__;', '2015-03-20 18:05:48', '0000-00-00 00:00:00', 1, 0, 0, 3185),
('plg_getForm', 'com_content_article', 214, 'name10__plg_getForm;formId__0;videogallery__0;vidimageWidth__100px;vidimageHeight__auto;vidimagesNumber__4;', '2015-03-20 18:05:48', '0000-00-00 00:00:00', 1, 0, 0, 3186);
INSERT INTO `sys_pugins_data` (`title`, `com_type`, `com_id`, `data`, `created`, `modified`, `enabled`, `order`, `delete`, `id`) VALUES
('plg_imagegallery', 'com_content_article', 214, 'name5__plg_imagegallery;imagegallery__0;imageWidth__100px;imageHeight__auto;imagesNumber__4;', '2015-03-20 18:05:48', '0000-00-00 00:00:00', 1, 0, 0, 3187),
('', 'com_content_article', 242, '', '2015-03-20 18:07:04', '0000-00-00 00:00:00', 1, 0, 0, 3188),
('plg_PageData', 'com_content_article', 242, 'name7__plg_PageData;title__;url__;th_image__;description__;keywords__;header__;', '2015-03-20 18:07:04', '0000-00-00 00:00:00', 1, 0, 0, 3189),
('plg_getForm', 'com_content_article', 242, 'name10__plg_getForm;formId__0;', '2015-03-20 18:07:04', '0000-00-00 00:00:00', 1, 0, 0, 3190),
('plg_videosgallery', 'com_content_article', 242, 'name5__plg_videosgallery;videogallery__0;vidimageWidth__100px;vidimageHeight__auto;vidimagesNumber__4;', '2015-03-20 18:07:04', '0000-00-00 00:00:00', 1, 0, 0, 3191),
('plg_imagegallery', 'com_content_article', 242, 'name6__plg_imagegallery;imagegallery__0;imageWidth__100px;imageHeight__auto;imagesNumber__4;', '2015-03-20 18:07:04', '0000-00-00 00:00:00', 1, 0, 0, 3192),
('', 'com_content_article', 243, '', '2015-03-20 18:07:59', '0000-00-00 00:00:00', 1, 0, 0, 3193),
('plg_PageData', 'com_content_article', 243, 'name10__plg_PageData;title__;url__;th_image__;description__;keywords__;header__;', '2015-03-20 18:07:59', '0000-00-00 00:00:00', 1, 0, 0, 3194),
('plg_getForm', 'com_content_article', 243, 'name6__plg_getForm;formId__0;', '2015-03-20 18:07:59', '0000-00-00 00:00:00', 1, 0, 0, 3195),
('plg_videosgallery', 'com_content_article', 243, 'name13__plg_videosgallery;videogallery__0;vidimageWidth__100px;vidimageHeight__auto;vidimagesNumber__4;', '2015-03-20 18:07:59', '0000-00-00 00:00:00', 1, 0, 0, 3196),
('plg_imagegallery', 'com_content_article', 243, 'name7__plg_imagegallery;imagegallery__0;imageWidth__100px;imageHeight__auto;imagesNumber__4;', '2015-03-20 18:07:59', '0000-00-00 00:00:00', 1, 0, 0, 3197),
('', 'com_content_article', 244, '', '2015-03-20 18:08:59', '0000-00-00 00:00:00', 1, 0, 0, 3198),
('plg_videosgallery', 'com_content_article', 244, 'name14__plg_videosgallery;moreData__;', '2015-03-20 18:08:59', '0000-00-00 00:00:00', 1, 0, 0, 3199),
('plg_PageData', 'com_content_article', 244, 'name8__plg_PageData;title__;url__;th_image__;description__;keywords__;header__;', '2015-03-20 18:08:59', '0000-00-00 00:00:00', 1, 0, 0, 3200),
('plg_getForm', 'com_content_article', 244, 'name11__plg_getForm;formId__0;videogallery__0;vidimageWidth__100px;vidimageHeight__auto;vidimagesNumber__4;', '2015-03-20 18:08:59', '0000-00-00 00:00:00', 1, 0, 0, 3201),
('plg_imagegallery', 'com_content_article', 244, 'name10__plg_imagegallery;imagegallery__0;imageWidth__100px;imageHeight__auto;imagesNumber__4;', '2015-03-20 18:08:59', '0000-00-00 00:00:00', 1, 0, 0, 3202),
('', 'com_content_article', 245, '', '2015-03-20 18:09:52', '0000-00-00 00:00:00', 1, 0, 0, 3203),
('plg_PageData', 'com_content_article', 245, 'name14__plg_PageData;title__;url__;th_image__;description__;keywords__;header__;', '2015-03-20 18:09:52', '0000-00-00 00:00:00', 1, 0, 0, 3204),
('plg_getForm', 'com_content_article', 245, 'name10__plg_getForm;formId__0;', '2015-03-20 18:09:52', '0000-00-00 00:00:00', 1, 0, 0, 3205),
('plg_videosgallery', 'com_content_article', 245, 'name11__plg_videosgallery;videogallery__0;vidimageWidth__100px;vidimageHeight__auto;vidimagesNumber__4;', '2015-03-20 18:09:52', '0000-00-00 00:00:00', 1, 0, 0, 3206),
('plg_imagegallery', 'com_content_article', 245, 'name9__plg_imagegallery;imagegallery__0;imageWidth__100px;imageHeight__auto;imagesNumber__4;', '2015-03-20 18:09:52', '0000-00-00 00:00:00', 1, 0, 0, 3207),
('', 'com_content_article', 246, '', '2015-03-20 18:10:51', '0000-00-00 00:00:00', 1, 0, 0, 3208),
('plg_PageData', 'com_content_article', 246, 'name11__plg_PageData;title__;url__;th_image__;description__;keywords__;header__;', '2015-03-20 18:10:51', '0000-00-00 00:00:00', 1, 0, 0, 3209),
('plg_imagegallery', 'com_content_article', 246, 'name15__plg_imagegallery;formId__0;videogallery__0;vidimageWidth__100px;vidimageHeight__auto;vidimagesNumber__4;imagegallery__0;imageWidth__100px;imageHeight__auto;imagesNumber__4;', '2015-03-20 18:10:51', '0000-00-00 00:00:00', 1, 0, 0, 3210),
('', 'com_content_article', 247, '', '2015-03-20 18:11:52', '0000-00-00 00:00:00', 1, 0, 0, 3211),
('plg_getForm', 'com_content_article', 247, 'name15__plg_getForm;moreData__;', '2015-03-20 18:11:52', '0000-00-00 00:00:00', 1, 0, 0, 3212),
('plg_PageData', 'com_content_article', 247, 'name9__plg_PageData;title__;url__;th_image__;description__;keywords__;header__;formId__0;', '2015-03-20 18:11:52', '0000-00-00 00:00:00', 1, 0, 0, 3213),
('plg_videosgallery', 'com_content_article', 247, 'name14__plg_videosgallery;videogallery__0;vidimageWidth__100px;vidimageHeight__auto;vidimagesNumber__4;', '2015-03-20 18:11:52', '0000-00-00 00:00:00', 1, 0, 0, 3214),
('plg_imagegallery', 'com_content_article', 247, 'name13__plg_imagegallery;imagegallery__0;imageWidth__100px;imageHeight__auto;imagesNumber__4;', '2015-03-20 18:11:52', '0000-00-00 00:00:00', 1, 0, 0, 3215),
('', 'com_images_gallery', 388, '', '2015-03-24 12:21:52', '0000-00-00 00:00:00', 1, 0, 0, 3246),
('', 'com_images_gallery', 387, '', '2015-03-24 12:21:06', '0000-00-00 00:00:00', 1, 0, 0, 3242),
('plg_rescores', 'com_images_gallery', 385, 'name9__plg_rescores;', '2015-03-24 12:19:09', '0000-00-00 00:00:00', 1, 0, 0, 3235),
('', 'com_images_gallery', 385, '', '2015-03-24 12:19:09', '0000-00-00 00:00:00', 1, 0, 0, 3234),
('', 'com_images_gallery', 386, '', '2015-03-31 13:33:00', '0000-00-00 00:00:00', 1, 0, 0, 3421),
('plg_rescores', 'com_images_gallery', 386, 'name11__plg_rescores;', '2015-03-31 13:33:00', '0000-00-00 00:00:00', 1, 0, 0, 3422),
('plg_rescores', 'com_images_gallery', 387, 'name5__plg_rescores;', '2015-03-24 12:21:06', '0000-00-00 00:00:00', 1, 0, 0, 3243),
('plg_rescores', 'com_images_gallery', 388, 'name5__plg_rescores;', '2015-03-24 12:21:52', '0000-00-00 00:00:00', 1, 0, 0, 3247),
('plg_rescores', 'com_images_gallery', 414, 'name11__plg_rescores;', '2015-03-24 14:53:03', '0000-00-00 00:00:00', 1, 0, 0, 3258),
('plg_rescores', 'com_images_gallery', 412, 'name11__plg_rescores;', '2015-03-24 14:53:17', '0000-00-00 00:00:00', 1, 0, 0, 3264),
('plg_rescores', 'com_images_gallery', 409, 'name8__plg_rescores;', '2015-03-24 14:54:11', '0000-00-00 00:00:00', 1, 0, 0, 3274),
('plg_rescores', 'com_images_gallery', 408, 'name14__plg_rescores;', '2015-03-24 14:54:16', '0000-00-00 00:00:00', 1, 0, 0, 3276),
('', 'menu_itmes', 358, '', '2015-03-24 20:15:12', '0000-00-00 00:00:00', 1, 0, 0, 3278),
('', 'menu_itmes', 365, '', '2015-04-01 22:52:40', '0000-00-00 00:00:00', 1, 0, 0, 3503),
('', 'menu_itmes', 366, '', '2015-03-24 21:43:31', '0000-00-00 00:00:00', 1, 0, 0, 3288),
('', 'menu_itmes', 368, '', '2015-04-01 22:54:29', '0000-00-00 00:00:00', 1, 0, 0, 3505),
('', 'menu_itmes', 367, '', '2015-03-24 22:01:32', '0000-00-00 00:00:00', 1, 0, 0, 3294),
('', 'com_content_catgories', 38, '', '2015-03-25 15:13:15', '0000-00-00 00:00:00', 1, 0, 0, 3298),
('', 'com_content_article', 232, '', '2015-03-25 15:13:59', '0000-00-00 00:00:00', 1, 0, 0, 3299),
('plg_videosgallery', 'com_content_article', 232, 'name7__plg_videosgallery;title__;url__;th_image__;description__;keywords__;header__;', '2015-03-25 15:13:59', '0000-00-00 00:00:00', 1, 0, 0, 3300),
('plg_getForm', 'com_content_article', 232, 'name8__plg_getForm;formId__0;videogallery__0;vidimageWidth__100px;vidimageHeight__auto;vidimagesNumber__4;', '2015-03-25 15:13:59', '0000-00-00 00:00:00', 1, 0, 0, 3301),
('plg_imagegallery', 'com_content_article', 232, 'name10__plg_imagegallery;imagegallery__0;imageWidth__100px;imageHeight__auto;imagesNumber__4;', '2015-03-25 15:13:59', '0000-00-00 00:00:00', 1, 0, 0, 3302),
('plg_imagegallery', 'com_content_article', 231, 'name10__plg_imagegallery;imagegallery__0;imageWidth__100px;imageHeight__auto;imagesNumber__4;', '2015-03-25 15:14:13', '0000-00-00 00:00:00', 1, 0, 0, 3312),
('plg_videosgallery', 'com_content_article', 231, 'name12__plg_videosgallery;videogallery__0;vidimageWidth__100px;vidimageHeight__auto;vidimagesNumber__4;', '2015-03-25 15:14:13', '0000-00-00 00:00:00', 1, 0, 0, 3311),
('plg_getForm', 'com_content_article', 231, 'name9__plg_getForm;formId__0;', '2015-03-25 15:14:13', '0000-00-00 00:00:00', 1, 0, 0, 3310),
('', 'com_content_article', 231, '', '2015-03-25 15:14:13', '0000-00-00 00:00:00', 1, 0, 0, 3308),
('plg_PageData', 'com_content_article', 231, 'name5__plg_PageData;moreData__;title__;url__;th_image__;description__;keywords__;header__;', '2015-03-25 15:14:13', '0000-00-00 00:00:00', 1, 0, 0, 3309),
('', 'com_content_article', 202, '', '2015-03-25 15:14:41', '0000-00-00 00:00:00', 1, 0, 0, 3313),
('plg_PageData', 'com_content_article', 202, 'name5__plg_PageData;title__;url__;th_image__;description__;keywords__;header__;', '2015-03-25 15:14:41', '0000-00-00 00:00:00', 1, 0, 0, 3314),
('plg_videosgallery', 'com_content_article', 202, 'name11__plg_videosgallery;formId__0;videogallery__0;vidimageWidth__100px;vidimageHeight__auto;vidimagesNumber__4;', '2015-03-25 15:14:41', '0000-00-00 00:00:00', 1, 0, 0, 3315),
('plg_imagegallery', 'com_content_article', 202, 'name13__plg_imagegallery;imagegallery__0;imageWidth__100px;imageHeight__auto;imagesNumber__4;', '2015-03-25 15:14:41', '0000-00-00 00:00:00', 1, 0, 0, 3316),
('', 'com_content_article', 203, '', '2015-03-25 15:14:51', '0000-00-00 00:00:00', 1, 0, 0, 3317),
('plg_imagegallery', 'com_content_article', 203, 'name10__plg_imagegallery;moreData__;', '2015-03-25 15:14:51', '0000-00-00 00:00:00', 1, 0, 0, 3318),
('plg_PageData', 'com_content_article', 203, 'name14__plg_PageData;title__;url__;th_image__;description__;keywords__;header__;', '2015-03-25 15:14:51', '0000-00-00 00:00:00', 1, 0, 0, 3319),
('plg_getForm', 'com_content_article', 203, 'name6__plg_getForm;formId__0;', '2015-03-25 15:14:51', '0000-00-00 00:00:00', 1, 0, 0, 3320),
('plg_videosgallery', 'com_content_article', 203, 'name15__plg_videosgallery;videogallery__0;vidimageWidth__100px;vidimageHeight__auto;vidimagesNumber__4;imagegallery__0;imageWidth__100px;imageHeight__auto;imagesNumber__4;', '2015-03-25 15:14:51', '0000-00-00 00:00:00', 1, 0, 0, 3321),
('', 'com_content_article', 191, '', '2015-03-25 15:15:02', '0000-00-00 00:00:00', 1, 0, 0, 3322),
('plg_getForm', 'com_content_article', 191, 'name7__plg_getForm;title__;url__;th_image__;description__;keywords__;header__;formId__0;', '2015-03-25 15:15:02', '0000-00-00 00:00:00', 1, 0, 0, 3323),
('plg_videosgallery', 'com_content_article', 191, 'name13__plg_videosgallery;videogallery__0;vidimageWidth__100px;vidimageHeight__auto;vidimagesNumber__4;', '2015-03-25 15:15:02', '0000-00-00 00:00:00', 1, 0, 0, 3324),
('plg_imagegallery', 'com_content_article', 191, 'name12__plg_imagegallery;imagegallery__0;imageWidth__100px;imageHeight__auto;imagesNumber__4;', '2015-03-25 15:15:02', '0000-00-00 00:00:00', 1, 0, 0, 3325),
('', 'com_content_article', 190, '', '2015-03-25 15:15:15', '0000-00-00 00:00:00', 1, 0, 0, 3326),
('plg_PageData', 'com_content_article', 190, 'name6__plg_PageData;title__;url__;th_image__;description__;keywords__;header__;', '2015-03-25 15:15:15', '0000-00-00 00:00:00', 1, 0, 0, 3327),
('plg_getForm', 'com_content_article', 190, 'name12__plg_getForm;formId__0;', '2015-03-25 15:15:15', '0000-00-00 00:00:00', 1, 0, 0, 3328),
('plg_videosgallery', 'com_content_article', 190, 'name15__plg_videosgallery;videogallery__0;vidimageWidth__100px;vidimageHeight__auto;vidimagesNumber__4;', '2015-03-25 15:15:15', '0000-00-00 00:00:00', 1, 0, 0, 3329),
('plg_imagegallery', 'com_content_article', 190, 'name7__plg_imagegallery;imagegallery__0;imageWidth__100px;imageHeight__auto;imagesNumber__4;', '2015-03-25 15:15:15', '0000-00-00 00:00:00', 1, 0, 0, 3330),
('', 'com_content_article', 160, '', '2015-03-25 15:15:37', '0000-00-00 00:00:00', 1, 0, 0, 3331),
('plg_getForm', 'com_content_article', 160, 'name10__plg_getForm;title__;url__;th_image__;description__;keywords__;header__;formId__0;', '2015-03-25 15:15:37', '0000-00-00 00:00:00', 1, 0, 0, 3332),
('plg_videosgallery', 'com_content_article', 160, 'name8__plg_videosgallery;videogallery__0;vidimageWidth__100px;vidimageHeight__auto;vidimagesNumber__4;', '2015-03-25 15:15:37', '0000-00-00 00:00:00', 1, 0, 0, 3333),
('plg_imagegallery', 'com_content_article', 160, 'name7__plg_imagegallery;imagegallery__0;imageWidth__100px;imageHeight__auto;imagesNumber__4;', '2015-03-25 15:15:37', '0000-00-00 00:00:00', 1, 0, 0, 3334),
('', 'com_faq', 41, '', '2015-03-25 15:58:59', '0000-00-00 00:00:00', 1, 0, 0, 3338),
('', 'com_faq', 43, '', '2015-03-25 16:00:36', '0000-00-00 00:00:00', 1, 0, 0, 3341),
('', 'com_faq', 44, '', '2015-03-25 16:01:16', '0000-00-00 00:00:00', 1, 0, 0, 3343),
('', 'com_faq', 45, '', '2015-03-25 16:02:12', '0000-00-00 00:00:00', 1, 0, 0, 3344),
('', 'com_faq', 46, '', '2015-03-25 16:02:45', '0000-00-00 00:00:00', 1, 0, 0, 3345),
('', 'com_faq', 47, '', '2015-03-25 16:03:16', '0000-00-00 00:00:00', 1, 0, 0, 3346),
('', 'com_faq', 48, '', '2015-03-25 16:06:01', '0000-00-00 00:00:00', 1, 0, 0, 3350),
('', 'com_faq', 49, '', '2015-03-25 16:08:56', '0000-00-00 00:00:00', 1, 0, 0, 3354),
('', 'com_faq', 50, '', '2015-03-25 16:08:15', '0000-00-00 00:00:00', 1, 0, 0, 3353),
('', 'com_faq', 51, '', '2015-03-25 16:12:55', '0000-00-00 00:00:00', 1, 0, 0, 3355),
('', 'com_faq', 52, '', '2015-03-25 16:13:25', '0000-00-00 00:00:00', 1, 0, 0, 3356),
('', 'com_faq', 53, '', '2015-03-25 16:13:58', '0000-00-00 00:00:00', 1, 0, 0, 3357),
('', 'com_faq', 55, '', '2015-03-25 16:31:30', '0000-00-00 00:00:00', 1, 0, 0, 3379),
('', 'com_faq', 56, '', '2015-03-25 16:21:16', '0000-00-00 00:00:00', 1, 0, 0, 3364),
('', 'com_faq', 58, '', '2015-03-25 16:38:33', '0000-00-00 00:00:00', 1, 0, 0, 3383),
('', 'com_modules', 291, '', '2015-03-25 18:09:56', '0000-00-00 00:00:00', 1, 0, 0, 3395),
('', 'com_modules', 292, '', '2015-03-25 18:10:57', '0000-00-00 00:00:00', 1, 0, 0, 3397),
('', 'com_faq', 59, '', '2015-03-25 16:38:27', '0000-00-00 00:00:00', 1, 0, 0, 3382),
('', 'com_faq', 60, '', '2015-03-25 16:39:01', '0000-00-00 00:00:00', 1, 0, 0, 3385),
('', 'com_faq', 61, '', '2015-03-25 16:39:23', '0000-00-00 00:00:00', 1, 0, 0, 3386),
('', 'com_html', 369, '', '2015-03-25 16:49:50', '0000-00-00 00:00:00', 1, 0, 0, 3392),
('', 'com_html', 376, '', '2015-03-25 16:50:13', '0000-00-00 00:00:00', 1, 0, 0, 3393),
('', 'menu_itmes', 369, '', '2015-03-30 18:37:32', '0000-00-00 00:00:00', 1, 0, 0, 3419),
('', 'sys_dataBluder', 22, '', '2015-03-30 01:22:35', '0000-00-00 00:00:00', 1, 0, 0, 3401),
('', 'com_form', 13, '', '2015-03-30 15:30:01', '0000-00-00 00:00:00', 1, 0, 0, 3418),
('', 'com_html', 377, '', '2015-04-01 22:20:41', '0000-00-00 00:00:00', 1, 0, 0, 3493),
('', 'menu_itmes', 233, '', '2015-04-01 10:43:57', '0000-00-00 00:00:00', 1, 0, 0, 3429),
('', 'com_install', 136, '', '2015-04-01 12:52:48', '0000-00-00 00:00:00', 1, 0, 0, 3433),
('', 'sys_site_status', 1, '', '2015-04-01 21:34:46', '0000-00-00 00:00:00', 1, 0, 0, 3465),
('', 'sys_site_status', 2, '', '2015-04-01 14:46:15', '0000-00-00 00:00:00', 1, 0, 0, 3438),
('', 'sys_site_status', 3, '', '2015-04-01 16:28:32', '0000-00-00 00:00:00', 1, 0, 0, 3451),
('', 'menu_itmes', 355, '', '2015-04-01 16:42:43', '0000-00-00 00:00:00', 1, 0, 0, 3453),
('', 'sys_site_status', 4, '', '2015-04-01 16:38:03', '0000-00-00 00:00:00', 1, 0, 0, 3452),
('', 'menu_itmes', 370, '', '2015-04-01 22:36:37', '0000-00-00 00:00:00', 1, 0, 0, 3494),
('', 'com_menus', 19, '', '2015-04-01 22:47:13', '0000-00-00 00:00:00', 1, 0, 0, 3499),
('', 'menu_itmes', 371, '', '2015-04-01 22:48:51', '0000-00-00 00:00:00', 1, 0, 0, 3500),
('', 'menu_itmes', 372, '', '2015-04-01 22:54:54', '0000-00-00 00:00:00', 1, 0, 0, 3506),
('', 'com_modules', 293, '', '2015-04-02 14:48:57', '0000-00-00 00:00:00', 1, 0, 0, 3518),
('', 'com_content_catgories', 39, '', '2015-04-02 12:08:20', '0000-00-00 00:00:00', 1, 0, 0, 3511),
('', 'com_content_catgories', 36, '', '2015-04-02 12:08:39', '0000-00-00 00:00:00', 1, 0, 0, 3512),
('', 'com_content_catgories', 40, '', '2015-04-02 13:02:35', '0000-00-00 00:00:00', 1, 0, 0, 3515),
('', 'com_content_catgories', 41, '', '2015-04-02 13:03:04', '0000-00-00 00:00:00', 1, 0, 0, 3516),
('', 'com_html', 387, '', '2015-04-02 14:57:36', '0000-00-00 00:00:00', 1, 0, 0, 3519),
('', 'menu_itmes', 356, '', '2015-04-02 15:01:19', '0000-00-00 00:00:00', 1, 0, 0, 3520);

-- --------------------------------------------------------

--
-- Table structure for table `sys_query`
--

CREATE TABLE IF NOT EXISTS `sys_query` (
`id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `des` text NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `data` text NOT NULL,
  `sql_type` varchar(255) NOT NULL,
  `sql_cdata` text NOT NULL,
  `sql_table` varchar(255) NOT NULL,
  `sql_joine` tinyint(4) NOT NULL,
  `sql_joinetable` varchar(255) NOT NULL,
  `sql_where` text,
  `sql_joinetype` varchar(255) NOT NULL,
  `sql_limit` varchar(255) DEFAULT NULL,
  `sql_order` varchar(255) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `sys_query`
--

INSERT INTO `sys_query` (`id`, `title`, `des`, `modified`, `created`, `enabled`, `order`, `delete`, `data`, `sql_type`, `sql_cdata`, `sql_table`, `sql_joine`, `sql_joinetable`, `sql_where`, `sql_joinetype`, `sql_limit`, `sql_order`) VALUES
(1, '', '', '0000-00-00 00:00:00', '2013-06-06 07:52:46', 0, 0, 1, '', '', '', '', 0, '', '', '', '', ''),
(2, '', '', '0000-00-00 00:00:00', '2013-06-06 07:54:17', 0, 0, 1, '', '', '', '', 0, '', '', '', '', ''),
(3, '', '', '0000-00-00 00:00:00', '2013-06-06 07:54:30', 0, 0, 1, '', '', '', '', 0, '', '', '', '', ''),
(4, '', '', '0000-00-00 00:00:00', '2013-06-06 07:56:09', 0, 0, 1, '', '', '', '', 0, '', '', '', '', ''),
(5, '', '', '0000-00-00 00:00:00', '2013-06-06 07:57:49', 0, 0, 1, '', '', '', '', 0, '', '', '', '', ''),
(6, '', '', '0000-00-00 00:00:00', '2013-06-06 07:58:40', 0, 0, 1, '', '', '', '', 0, '', '', '', '', ''),
(7, '', '', '0000-00-00 00:00:00', '2013-08-18 16:49:16', 0, 0, 1, '', '', '', '', 0, '', '', '', '', ''),
(8, '', '', '0000-00-00 00:00:00', '2013-08-18 16:52:20', 0, 0, 1, '', '', '', '', 0, '', '', '', '', ''),
(9, '', '', '0000-00-00 00:00:00', '2013-08-18 16:56:50', 0, 0, 1, '', '', '', '', 0, '', '', '', '', ''),
(10, '', '', '0000-00-00 00:00:00', '2013-08-18 16:57:31', 0, 0, 1, '', '', '', '', 0, '', '', '', '', ''),
(11, '', '', '0000-00-00 00:00:00', '2013-08-18 16:59:51', 0, 0, 1, '', '', '', '', 0, '', '', '', '', ''),
(14, 'subreport', 'ffff', '2013-09-11 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 'select com_products.title as "proTitle" , com_products.id as "hidden_com_products@id" , com_products.id as "catetitle" , com_products.delete as "del" , com_products.id as "Created" , com_products.image as "image" from com_products   JOIN com_products_price ON ( com_products.id="@%get::id%@") LIMIT 0,2', 'select', '__com_products.title__proTitle__1;__com_products.id__catetitle__0;__com_products.delete__del__0;__com_products.id__Created__0;__com_products.image__image__0;', 'com_products', 1, 'JOIN__com_products_price;', '__com_products.id__=__@%get::id%@__text;()@@', 'INNER JOIN', '0,2', ''),
(13, 'text2', 'vbnvbn', '2013-08-26 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 'select id as ID , title as MYTILTE , cat_id as MYID2 from com_products  ', 'select', '__id__ID;__title__MYTILTE;__cat_id__MYID2;', 'com_products', 0, 'com_events', '', 'INNER JOIN', '', ''),
(15, 'mian', 'ffff', '2013-09-10 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 'select com_products.title as "proTitle" , com_products.id as "hidden_com_products@id" , com_cities_categories.title as "catetitle" , com_cities_categories.id as "hidden_com_cities_categories@id" , com_products.delete as "del" , com_products.id as "id" , com_products.image as "image" from com_products   JOIN com_products_price ON ( com_products.id<>"@%get::proid%@" AND  com_products.id<>"54" AND  com_products.id<>"55" AND  com_products.id<>"56") JOIN com_cities_categories ON ( com_products.id=com_products_price.pro_id) ORDER BY com_products.id ASC LIMIT 0,30', 'select', '__com_products.title__proTitle__1;__com_cities_categories.title__catetitle__1;__com_products.delete__del__0;__com_products.id__id__0;__com_products.image__image__0;', 'com_products', 1, 'JOIN__com_products_price;JOIN__com_cities_categories;', '__com_products.id__<>__@%get::proid%@__text;AND__com_products.id__<>__54__text;AND__com_products.id__<>__55__text;AND__com_products.id__<>__56__text;()@@__com_products.id__=__com_products_price.pro_id__DBfield;()@@', 'INNER JOIN', '0,30', 'com_products.id ,ASC');

-- --------------------------------------------------------

--
-- Table structure for table ` sys_site_status`
--

CREATE TABLE IF NOT EXISTS ` sys_site_status` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `des` text NOT NULL,
  `cat_id` int(11) NOT NULL,
  `currency_code` varchar(255) NOT NULL,
  `currency_symbol` varchar(255) NOT NULL,
  `cities` text NOT NULL,
  `urlcode` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `alias` text NOT NULL,
  `language` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sys_site_status`
--

CREATE TABLE IF NOT EXISTS `sys_site_status` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `des` text NOT NULL,
  `cat_id` int(11) NOT NULL,
  `currency_code` varchar(255) NOT NULL,
  `currency_symbol` varchar(255) NOT NULL,
  `cities` text NOT NULL,
  `urlcode` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `alias` text NOT NULL,
  `language` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `sys_site_status`
--

INSERT INTO `sys_site_status` (`id`, `created`, `modified`, `enabled`, `order`, `delete`, `title`, `image`, `des`, `cat_id`, `currency_code`, `currency_symbol`, `cities`, `urlcode`, `type`, `alias`, `language`) VALUES
(1, '2015-04-01 13:05:58', '2015-04-01 21:34:46', 1, 1, 0, 'cairo', '', '', 0, '', '', '', '', 'get', 'cairo', '0'),
(2, '2015-04-01 13:06:09', '2015-04-01 14:46:15', 1, 1, 0, 'mutah', '', '', 0, '', '', '', '', 'get', 'mutah', ''),
(3, '2015-04-01 13:56:43', '2015-04-01 16:28:32', 1, 2, 0, 'saaaa', '', '', 0, '', '', '', '', 'normal', 'saaaa', ''),
(4, '2015-04-01 16:38:03', '0000-00-00 00:00:00', 0, 3, 0, 'fsdfsdf', '', '', 0, '', '', '', '', 'get', 'fsdfsdf', '');

-- --------------------------------------------------------

--
-- Table structure for table `sys_site_status_xxx`
--

CREATE TABLE IF NOT EXISTS `sys_site_status_xxx` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `des` text NOT NULL,
  `cat_id` int(11) NOT NULL,
  `currency_code` varchar(255) NOT NULL,
  `currency_symbol` varchar(255) NOT NULL,
  `cities` text NOT NULL,
  `urlcode` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `alias` text NOT NULL,
  `language` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sys_status_xref`
--

CREATE TABLE IF NOT EXISTS `sys_status_xref` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL DEFAULT '0',
  `item_id` int(11) NOT NULL,
  `cat_id` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sys_usertrack`
--

CREATE TABLE IF NOT EXISTS `sys_usertrack` (
`id` int(11) NOT NULL,
  `userid` varchar(250) NOT NULL,
  `des` text NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `data` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `statusBefor` text NOT NULL,
  `statusAfter` text NOT NULL,
  `dateTime` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `com_contect`
--
ALTER TABLE `com_contect`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_contect_messages`
--
ALTER TABLE `com_contect_messages`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_content_article`
--
ALTER TABLE `com_content_article`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_content_article_xref`
--
ALTER TABLE `com_content_article_xref`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_content_catgories`
--
ALTER TABLE `com_content_catgories`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_data`
--
ALTER TABLE `com_data`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_dumpsters`
--
ALTER TABLE `com_dumpsters`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_events`
--
ALTER TABLE `com_events`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_events_categories`
--
ALTER TABLE `com_events_categories`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_events_xref`
--
ALTER TABLE `com_events_xref`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_faq`
--
ALTER TABLE `com_faq`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_faq_categories`
--
ALTER TABLE `com_faq_categories`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_fiz_users`
--
ALTER TABLE `com_fiz_users`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_form`
--
ALTER TABLE `com_form`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_google_adsense`
--
ALTER TABLE `com_google_adsense`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_google_map`
--
ALTER TABLE `com_google_map`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_gustbook`
--
ALTER TABLE `com_gustbook`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_gustbook_categories`
--
ALTER TABLE `com_gustbook_categories`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_html`
--
ALTER TABLE `com_html`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_html_categories`
--
ALTER TABLE `com_html_categories`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_html_categories_xref`
--
ALTER TABLE `com_html_categories_xref`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_html_xref`
--
ALTER TABLE `com_html_xref`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_images_gallery`
--
ALTER TABLE `com_images_gallery`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_images_gallery_categories`
--
ALTER TABLE `com_images_gallery_categories`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_images_gallery_xref`
--
ALTER TABLE `com_images_gallery_xref`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_install`
--
ALTER TABLE `com_install`
 ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `com_invitation`
--
ALTER TABLE `com_invitation`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_language`
--
ALTER TABLE `com_language`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_mailsTemplates`
--
ALTER TABLE `com_mailsTemplates`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_menus`
--
ALTER TABLE `com_menus`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_modules`
--
ALTER TABLE `com_modules`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_modules_permission_xref`
--
ALTER TABLE `com_modules_permission_xref`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_modules_site_xref`
--
ALTER TABLE `com_modules_site_xref`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_newsLetter`
--
ALTER TABLE `com_newsLetter`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_newsLetter_group`
--
ALTER TABLE `com_newsLetter_group`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_order_status`
--
ALTER TABLE `com_order_status`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_pkgs`
--
ALTER TABLE `com_pkgs`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_pkgs_prising`
--
ALTER TABLE `com_pkgs_prising`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_poll_answers`
--
ALTER TABLE `com_poll_answers`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_poll_questions`
--
ALTER TABLE `com_poll_questions`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_price_plan`
--
ALTER TABLE `com_price_plan`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_pricing_items`
--
ALTER TABLE `com_pricing_items`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_products`
--
ALTER TABLE `com_products`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_products_categories`
--
ALTER TABLE `com_products_categories`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_products_coupon_xref`
--
ALTER TABLE `com_products_coupon_xref`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_products_order`
--
ALTER TABLE `com_products_order`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_products_order_xref`
--
ALTER TABLE `com_products_order_xref`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_products_price`
--
ALTER TABLE `com_products_price`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_products_setting`
--
ALTER TABLE `com_products_setting`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_products_xref`
--
ALTER TABLE `com_products_xref`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_project`
--
ALTER TABLE `com_project`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_project_catgories`
--
ALTER TABLE `com_project_catgories`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_project_catgories_xref`
--
ALTER TABLE `com_project_catgories_xref`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_project_setting`
--
ALTER TABLE `com_project_setting`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_project_status`
--
ALTER TABLE `com_project_status`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_project_xref`
--
ALTER TABLE `com_project_xref`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_qery`
--
ALTER TABLE `com_qery`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_qrecycle_qoute`
--
ALTER TABLE `com_qrecycle_qoute`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_qrecycle_setting`
--
ALTER TABLE `com_qrecycle_setting`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_reservations`
--
ALTER TABLE `com_reservations`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_reservations_data`
--
ALTER TABLE `com_reservations_data`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_reservations_gustes`
--
ALTER TABLE `com_reservations_gustes`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_reservations_status`
--
ALTER TABLE `com_reservations_status`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_site_setting`
--
ALTER TABLE `com_site_setting`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_site_status`
--
ALTER TABLE `com_site_status`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_site_status_xref`
--
ALTER TABLE `com_site_status_xref`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_users`
--
ALTER TABLE `com_users`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_users_fiz`
--
ALTER TABLE `com_users_fiz`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_users_groups`
--
ALTER TABLE `com_users_groups`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_users_groups_xref`
--
ALTER TABLE `com_users_groups_xref`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_users_settings`
--
ALTER TABLE `com_users_settings`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_video_gallery`
--
ALTER TABLE `com_video_gallery`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_video_gallery_categories`
--
ALTER TABLE `com_video_gallery_categories`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_video_gallery_xref`
--
ALTER TABLE `com_video_gallery_xref`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_wizard`
--
ALTER TABLE `com_wizard`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_wizard_xref`
--
ALTER TABLE `com_wizard_xref`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `com_yards`
--
ALTER TABLE `com_yards`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extension`
--
ALTER TABLE `extension`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fiz_approved_status`
--
ALTER TABLE `fiz_approved_status`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fiz_cashier_receipt`
--
ALTER TABLE `fiz_cashier_receipt`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fiz_cashier_receipt_items`
--
ALTER TABLE `fiz_cashier_receipt_items`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fiz_city`
--
ALTER TABLE `fiz_city`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fiz_extension`
--
ALTER TABLE `fiz_extension`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fiz_hotels`
--
ALTER TABLE `fiz_hotels`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fiz_hotels_titles`
--
ALTER TABLE `fiz_hotels_titles`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fiz_hotel_rooms`
--
ALTER TABLE `fiz_hotel_rooms`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fiz_lawazim_packages`
--
ALTER TABLE `fiz_lawazim_packages`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fiz_lawazim_packages_cat`
--
ALTER TABLE `fiz_lawazim_packages_cat`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fiz_raza_types`
--
ALTER TABLE `fiz_raza_types`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fiz_reservation`
--
ALTER TABLE `fiz_reservation`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fiz_reservation_settings`
--
ALTER TABLE `fiz_reservation_settings`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fiz_reservation_users_xref`
--
ALTER TABLE `fiz_reservation_users_xref`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fiz_voucher`
--
ALTER TABLE `fiz_voucher`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fiz_voucher_xref`
--
ALTER TABLE `fiz_voucher_xref`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lawazim_packages`
--
ALTER TABLE `lawazim_packages`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_itmes`
--
ALTER TABLE `menu_itmes`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_itmes_permission_xref`
--
ALTER TABLE `menu_itmes_permission_xref`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_itmes_site_xref`
--
ALTER TABLE `menu_itmes_site_xref`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_xref_com`
--
ALTER TABLE `menu_xref_com`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_xref_mod`
--
ALTER TABLE `menu_xref_mod`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_xref_tem`
--
ALTER TABLE `menu_xref_tem`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_xref_template`
--
ALTER TABLE `menu_xref_template`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mod_favorites`
--
ALTER TABLE `mod_favorites`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plg_2checkout`
--
ALTER TABLE `plg_2checkout`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plg_cart`
--
ALTER TABLE `plg_cart`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plg_cart_setting`
--
ALTER TABLE `plg_cart_setting`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plg_comments`
--
ALTER TABLE `plg_comments`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plg_coupon`
--
ALTER TABLE `plg_coupon`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plg_cshow`
--
ALTER TABLE `plg_cshow`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plg_cshow_categories`
--
ALTER TABLE `plg_cshow_categories`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plg_hits`
--
ALTER TABLE `plg_hits`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plg_paypal`
--
ALTER TABLE `plg_paypal`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plg_rescores`
--
ALTER TABLE `plg_rescores`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plg_shipper`
--
ALTER TABLE `plg_shipper`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plg_shipping`
--
ALTER TABLE `plg_shipping`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plg_shipping_setting`
--
ALTER TABLE `plg_shipping_setting`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plugincart_order`
--
ALTER TABLE `plugincart_order`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plugincart_order_item`
--
ALTER TABLE `plugincart_order_item`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plugins_xref`
--
ALTER TABLE `plugins_xref`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plugin_pricing_xref`
--
ALTER TABLE `plugin_pricing_xref`
 ADD PRIMARY KEY (`id`), ADD KEY `id` (`id`);

--
-- Indexes for table `site_setting`
--
ALTER TABLE `site_setting`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_admin_menu`
--
ALTER TABLE `sys_admin_menu`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_admin_pkg`
--
ALTER TABLE `sys_admin_pkg`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_dataBluder`
--
ALTER TABLE `sys_dataBluder`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_language`
--
ALTER TABLE `sys_language`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_menu_status_xref`
--
ALTER TABLE `sys_menu_status_xref`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_mobile_application`
--
ALTER TABLE `sys_mobile_application`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_mobile_setting`
--
ALTER TABLE `sys_mobile_setting`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_modules_status_xref`
--
ALTER TABLE `sys_modules_status_xref`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_more_data`
--
ALTER TABLE `sys_more_data`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_pugins_data`
--
ALTER TABLE `sys_pugins_data`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_query`
--
ALTER TABLE `sys_query`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table ` sys_site_status`
--
ALTER TABLE ` sys_site_status`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_site_status`
--
ALTER TABLE `sys_site_status`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_site_status_xxx`
--
ALTER TABLE `sys_site_status_xxx`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_status_xref`
--
ALTER TABLE `sys_status_xref`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_usertrack`
--
ALTER TABLE `sys_usertrack`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `com_contect`
--
ALTER TABLE `com_contect`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `com_contect_messages`
--
ALTER TABLE `com_contect_messages`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `com_content_article`
--
ALTER TABLE `com_content_article`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=248;
--
-- AUTO_INCREMENT for table `com_content_article_xref`
--
ALTER TABLE `com_content_article_xref`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=308;
--
-- AUTO_INCREMENT for table `com_content_catgories`
--
ALTER TABLE `com_content_catgories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `com_data`
--
ALTER TABLE `com_data`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `com_dumpsters`
--
ALTER TABLE `com_dumpsters`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `com_events`
--
ALTER TABLE `com_events`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `com_events_categories`
--
ALTER TABLE `com_events_categories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `com_events_xref`
--
ALTER TABLE `com_events_xref`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `com_faq`
--
ALTER TABLE `com_faq`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT for table `com_faq_categories`
--
ALTER TABLE `com_faq_categories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `com_fiz_users`
--
ALTER TABLE `com_fiz_users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=204;
--
-- AUTO_INCREMENT for table `com_form`
--
ALTER TABLE `com_form`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `com_google_adsense`
--
ALTER TABLE `com_google_adsense`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `com_google_map`
--
ALTER TABLE `com_google_map`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `com_gustbook`
--
ALTER TABLE `com_gustbook`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `com_gustbook_categories`
--
ALTER TABLE `com_gustbook_categories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `com_html`
--
ALTER TABLE `com_html`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=388;
--
-- AUTO_INCREMENT for table `com_html_categories`
--
ALTER TABLE `com_html_categories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `com_html_categories_xref`
--
ALTER TABLE `com_html_categories_xref`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `com_html_xref`
--
ALTER TABLE `com_html_xref`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=134;
--
-- AUTO_INCREMENT for table `com_images_gallery`
--
ALTER TABLE `com_images_gallery`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=418;
--
-- AUTO_INCREMENT for table `com_images_gallery_categories`
--
ALTER TABLE `com_images_gallery_categories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT for table `com_images_gallery_xref`
--
ALTER TABLE `com_images_gallery_xref`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=463;
--
-- AUTO_INCREMENT for table `com_install`
--
ALTER TABLE `com_install`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=137;
--
-- AUTO_INCREMENT for table `com_invitation`
--
ALTER TABLE `com_invitation`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `com_language`
--
ALTER TABLE `com_language`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `com_mailsTemplates`
--
ALTER TABLE `com_mailsTemplates`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `com_menus`
--
ALTER TABLE `com_menus`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `com_modules`
--
ALTER TABLE `com_modules`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=294;
--
-- AUTO_INCREMENT for table `com_modules_permission_xref`
--
ALTER TABLE `com_modules_permission_xref`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `com_modules_site_xref`
--
ALTER TABLE `com_modules_site_xref`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `com_newsLetter`
--
ALTER TABLE `com_newsLetter`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `com_newsLetter_group`
--
ALTER TABLE `com_newsLetter_group`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `com_order_status`
--
ALTER TABLE `com_order_status`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `com_pkgs`
--
ALTER TABLE `com_pkgs`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT for table `com_pkgs_prising`
--
ALTER TABLE `com_pkgs_prising`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT for table `com_poll_answers`
--
ALTER TABLE `com_poll_answers`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `com_poll_questions`
--
ALTER TABLE `com_poll_questions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `com_price_plan`
--
ALTER TABLE `com_price_plan`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `com_pricing_items`
--
ALTER TABLE `com_pricing_items`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `com_products`
--
ALTER TABLE `com_products`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=75;
--
-- AUTO_INCREMENT for table `com_products_categories`
--
ALTER TABLE `com_products_categories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `com_products_coupon_xref`
--
ALTER TABLE `com_products_coupon_xref`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=99;
--
-- AUTO_INCREMENT for table `com_products_order`
--
ALTER TABLE `com_products_order`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=171;
--
-- AUTO_INCREMENT for table `com_products_order_xref`
--
ALTER TABLE `com_products_order_xref`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=678;
--
-- AUTO_INCREMENT for table `com_products_price`
--
ALTER TABLE `com_products_price`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `com_products_setting`
--
ALTER TABLE `com_products_setting`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `com_products_xref`
--
ALTER TABLE `com_products_xref`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=83;
--
-- AUTO_INCREMENT for table `com_project`
--
ALTER TABLE `com_project`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `com_project_catgories`
--
ALTER TABLE `com_project_catgories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `com_project_catgories_xref`
--
ALTER TABLE `com_project_catgories_xref`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=335;
--
-- AUTO_INCREMENT for table `com_project_setting`
--
ALTER TABLE `com_project_setting`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `com_project_status`
--
ALTER TABLE `com_project_status`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `com_project_xref`
--
ALTER TABLE `com_project_xref`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=454;
--
-- AUTO_INCREMENT for table `com_qery`
--
ALTER TABLE `com_qery`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `com_qrecycle_qoute`
--
ALTER TABLE `com_qrecycle_qoute`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `com_qrecycle_setting`
--
ALTER TABLE `com_qrecycle_setting`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `com_reservations`
--
ALTER TABLE `com_reservations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `com_reservations_data`
--
ALTER TABLE `com_reservations_data`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `com_reservations_gustes`
--
ALTER TABLE `com_reservations_gustes`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `com_reservations_status`
--
ALTER TABLE `com_reservations_status`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `com_site_setting`
--
ALTER TABLE `com_site_setting`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `com_site_status`
--
ALTER TABLE `com_site_status`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `com_site_status_xref`
--
ALTER TABLE `com_site_status_xref`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `com_users`
--
ALTER TABLE `com_users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=204;
--
-- AUTO_INCREMENT for table `com_users_fiz`
--
ALTER TABLE `com_users_fiz`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=204;
--
-- AUTO_INCREMENT for table `com_users_groups`
--
ALTER TABLE `com_users_groups`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `com_users_groups_xref`
--
ALTER TABLE `com_users_groups_xref`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2116;
--
-- AUTO_INCREMENT for table `com_users_settings`
--
ALTER TABLE `com_users_settings`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `com_video_gallery`
--
ALTER TABLE `com_video_gallery`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=178;
--
-- AUTO_INCREMENT for table `com_video_gallery_categories`
--
ALTER TABLE `com_video_gallery_categories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `com_video_gallery_xref`
--
ALTER TABLE `com_video_gallery_xref`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=129;
--
-- AUTO_INCREMENT for table `com_wizard`
--
ALTER TABLE `com_wizard`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `com_wizard_xref`
--
ALTER TABLE `com_wizard_xref`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=227;
--
-- AUTO_INCREMENT for table `com_yards`
--
ALTER TABLE `com_yards`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `extension`
--
ALTER TABLE `extension`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fiz_approved_status`
--
ALTER TABLE `fiz_approved_status`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `fiz_cashier_receipt`
--
ALTER TABLE `fiz_cashier_receipt`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `fiz_cashier_receipt_items`
--
ALTER TABLE `fiz_cashier_receipt_items`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `fiz_city`
--
ALTER TABLE `fiz_city`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `fiz_extension`
--
ALTER TABLE `fiz_extension`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=97;
--
-- AUTO_INCREMENT for table `fiz_hotels`
--
ALTER TABLE `fiz_hotels`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `fiz_hotels_titles`
--
ALTER TABLE `fiz_hotels_titles`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `fiz_hotel_rooms`
--
ALTER TABLE `fiz_hotel_rooms`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `fiz_lawazim_packages`
--
ALTER TABLE `fiz_lawazim_packages`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `fiz_lawazim_packages_cat`
--
ALTER TABLE `fiz_lawazim_packages_cat`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `fiz_raza_types`
--
ALTER TABLE `fiz_raza_types`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `fiz_reservation`
--
ALTER TABLE `fiz_reservation`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=97;
--
-- AUTO_INCREMENT for table `fiz_reservation_settings`
--
ALTER TABLE `fiz_reservation_settings`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `fiz_reservation_users_xref`
--
ALTER TABLE `fiz_reservation_users_xref`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `fiz_voucher`
--
ALTER TABLE `fiz_voucher`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `fiz_voucher_xref`
--
ALTER TABLE `fiz_voucher_xref`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `lawazim_packages`
--
ALTER TABLE `lawazim_packages`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menu_itmes`
--
ALTER TABLE `menu_itmes`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=373;
--
-- AUTO_INCREMENT for table `menu_itmes_permission_xref`
--
ALTER TABLE `menu_itmes_permission_xref`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=93;
--
-- AUTO_INCREMENT for table `menu_itmes_site_xref`
--
ALTER TABLE `menu_itmes_site_xref`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `menu_xref_com`
--
ALTER TABLE `menu_xref_com`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menu_xref_mod`
--
ALTER TABLE `menu_xref_mod`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=879;
--
-- AUTO_INCREMENT for table `menu_xref_tem`
--
ALTER TABLE `menu_xref_tem`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `menu_xref_template`
--
ALTER TABLE `menu_xref_template`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mod_favorites`
--
ALTER TABLE `mod_favorites`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=149;
--
-- AUTO_INCREMENT for table `plg_2checkout`
--
ALTER TABLE `plg_2checkout`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `plg_cart`
--
ALTER TABLE `plg_cart`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `plg_cart_setting`
--
ALTER TABLE `plg_cart_setting`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `plg_comments`
--
ALTER TABLE `plg_comments`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `plg_coupon`
--
ALTER TABLE `plg_coupon`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `plg_cshow`
--
ALTER TABLE `plg_cshow`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `plg_cshow_categories`
--
ALTER TABLE `plg_cshow_categories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `plg_hits`
--
ALTER TABLE `plg_hits`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=120;
--
-- AUTO_INCREMENT for table `plg_paypal`
--
ALTER TABLE `plg_paypal`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `plg_rescores`
--
ALTER TABLE `plg_rescores`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `plg_shipper`
--
ALTER TABLE `plg_shipper`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `plg_shipping`
--
ALTER TABLE `plg_shipping`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `plg_shipping_setting`
--
ALTER TABLE `plg_shipping_setting`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `plugincart_order`
--
ALTER TABLE `plugincart_order`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `plugincart_order_item`
--
ALTER TABLE `plugincart_order_item`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `plugins_xref`
--
ALTER TABLE `plugins_xref`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `plugin_pricing_xref`
--
ALTER TABLE `plugin_pricing_xref`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `site_setting`
--
ALTER TABLE `site_setting`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sys_admin_menu`
--
ALTER TABLE `sys_admin_menu`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `sys_admin_pkg`
--
ALTER TABLE `sys_admin_pkg`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `sys_dataBluder`
--
ALTER TABLE `sys_dataBluder`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `sys_language`
--
ALTER TABLE `sys_language`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=359;
--
-- AUTO_INCREMENT for table `sys_menu_status_xref`
--
ALTER TABLE `sys_menu_status_xref`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sys_mobile_application`
--
ALTER TABLE `sys_mobile_application`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sys_mobile_setting`
--
ALTER TABLE `sys_mobile_setting`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sys_modules_status_xref`
--
ALTER TABLE `sys_modules_status_xref`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `sys_more_data`
--
ALTER TABLE `sys_more_data`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=87;
--
-- AUTO_INCREMENT for table `sys_pugins_data`
--
ALTER TABLE `sys_pugins_data`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3521;
--
-- AUTO_INCREMENT for table `sys_query`
--
ALTER TABLE `sys_query`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table ` sys_site_status`
--
ALTER TABLE ` sys_site_status`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sys_site_status`
--
ALTER TABLE `sys_site_status`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sys_site_status_xxx`
--
ALTER TABLE `sys_site_status_xxx`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sys_status_xref`
--
ALTER TABLE `sys_status_xref`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sys_usertrack`
--
ALTER TABLE `sys_usertrack`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
