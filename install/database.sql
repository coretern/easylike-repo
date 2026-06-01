-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 12, 2024 at 01:54 PM
-- Server version: 10.3.39-MariaDB-cll-lve
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `socialbazar_demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `admin_type` enum('3','2') NOT NULL DEFAULT '2',
  `admin_name` varchar(255) DEFAULT NULL,
  `admin_email` text DEFAULT NULL,
  `username` varchar(225) DEFAULT NULL,
  `password` text NOT NULL,
  `telephone` varchar(50) DEFAULT NULL,
  `register_date` datetime NOT NULL,
  `login_date` datetime DEFAULT NULL,
  `login_ip` varchar(225) DEFAULT NULL,
  `client_type` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> ON, 1 -> OFF',
  `access` varchar(999) NOT NULL,
  `mode` varchar(225) NOT NULL,
  `two_factor` enum('0','1') NOT NULL DEFAULT '0',
  `two_factor_secret_key` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `admin_type`, `admin_name`, `admin_email`, `username`, `password`, `telephone`, `register_date`, `login_date`, `login_ip`, `client_type`, `access`, `mode`, `two_factor`, `two_factor_secret_key`) VALUES
(1, '3', 'Admin', 'ownsmmpanel@gmail.com', 'admin', '2c6816268483f426de7766fb9a024fb1', '918355965199', '2021-09-08 10:19:05', '2024-07-12 12:39:24', '103.215.225.78', '2', '{\"admin_access\":1,\"users\":1,\"services\":1,\"update-prices\":1,\"bulk\":1,\"synced-logs\":1,\"orders\":1,\"subscriptions\":1,\"dripfeed\":1,\"tasks\":1,\"payments\":1,\"tickets\":1,\"additionals\":1,\"referral\":1,\"broadcast\":1,\"logs\":1,\"reports\":1,\"videop\":1,\"coupon\":1,\"child-panels\":1,\"updates\":1,\"appearance\":1,\"themes\":1,\"new_year\":1,\"pages\":1,\"news\":1,\"meta\":1,\"blog\":1,\"menu\":1,\"inte\":1,\"language\":1,\"files\":1,\"settings\":1,\"general_settings\":1,\"providers\":1,\"payments_settings\":1,\"bank_accounts\":1,\"modules\":1,\"subject\":1,\"payments_bonus\":1,\"currency-manager\":1,\"alert_settings\":1,\"site_count\":1,\"manager\":1,\"super_admin\":1}', 'sun', '0', '');

-- --------------------------------------------------------

--
-- Table structure for table `admin_constants`
--

CREATE TABLE `admin_constants` (
  `id` int(11) NOT NULL,
  `brand_logo` varchar(255) DEFAULT NULL,
  `paidRent` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `admin_constants`
--

INSERT INTO `admin_constants` (`id`, `brand_logo`, `paidRent`) VALUES
(1, '{\"logo_url\":\"https://i.postimg.cc/BQJMjCXM/coollogo-com-4209128.gif\",\"width\":\"150\",\"height\":\"37\"}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `content` text NOT NULL,
  `published_at` datetime DEFAULT NULL,
  `image_file` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(11) NOT NULL,
  `bank_name` varchar(225) NOT NULL,
  `bank_sube` varchar(225) NOT NULL,
  `bank_hesap` varchar(225) NOT NULL,
  `bank_iban` text NOT NULL,
  `bank_alici` varchar(225) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `content` text NOT NULL,
  `published_at` datetime NOT NULL,
  `image_file` varchar(200) DEFAULT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1',
  `blog_get` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bulkedit`
--

CREATE TABLE `bulkedit` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` text NOT NULL,
  `category_name_lang` longtext DEFAULT NULL,
  `category_line` double NOT NULL,
  `category_type` enum('1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '2',
  `category_secret` enum('1','2') NOT NULL DEFAULT '2',
  `category_icon` text NOT NULL,
  `is_refill` enum('1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `category_deleted` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `childpanels`
--

CREATE TABLE `childpanels` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `domain` varchar(191) NOT NULL,
  `currency` varchar(191) NOT NULL,
  `child_username` varchar(191) NOT NULL,
  `child_password` varchar(191) NOT NULL,
  `charge` double NOT NULL,
  `status` enum('active','terminated','disabled') NOT NULL,
  `renewal_date` date NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `client_id` int(11) NOT NULL,
  `name` varchar(225) DEFAULT NULL,
  `email` varchar(225) NOT NULL,
  `username` varchar(225) DEFAULT NULL,
  `admin_type` enum('1','2') NOT NULL DEFAULT '2',
  `password` text NOT NULL,
  `telephone` varchar(225) DEFAULT NULL,
  `balance` decimal(21,4) NOT NULL DEFAULT 0.0000,
  `spent` decimal(21,4) NOT NULL DEFAULT 0.0000,
  `balance_type` enum('1','2') NOT NULL DEFAULT '2',
  `debit_limit` double DEFAULT NULL,
  `register_date` datetime NOT NULL,
  `login_date` datetime DEFAULT NULL,
  `login_ip` varchar(225) DEFAULT NULL,
  `apikey` text NOT NULL,
  `tel_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `email_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `client_type` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> ON, 1 -> OFF',
  `access` text DEFAULT NULL,
  `lang` varchar(255) NOT NULL DEFAULT 'tr',
  `timezone` double NOT NULL DEFAULT 0,
  `currency_type` varchar(10) DEFAULT NULL,
  `ref_code` text NOT NULL,
  `ref_by` text DEFAULT NULL,
  `change_email` enum('1','2') NOT NULL DEFAULT '2',
  `resend_max` int(11) NOT NULL DEFAULT 3,
  `currency` varchar(225) NOT NULL DEFAULT '1',
  `passwordreset_token` varchar(225) NOT NULL,
  `discount_percentage` int(11) NOT NULL,
  `broadcast_id` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients_category`
--

CREATE TABLE `clients_category` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients_price`
--

CREATE TABLE `clients_price` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `service_price` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients_service`
--

CREATE TABLE `clients_service` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_report`
--

CREATE TABLE `client_report` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `action` text NOT NULL,
  `report_ip` varchar(225) NOT NULL,
  `report_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(100) NOT NULL,
  `currency_name` varchar(50) NOT NULL,
  `currency_code` varchar(10) NOT NULL,
  `currency_symbol` varchar(10) DEFAULT NULL,
  `symbol_position` varchar(10) DEFAULT 'left',
  `currency_rate` double NOT NULL,
  `currency_inverse_rate` double NOT NULL,
  `is_enable` tinyint(1) NOT NULL DEFAULT 0,
  `currency_hash` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `currency_name`, `currency_code`, `currency_symbol`, `symbol_position`, `currency_rate`, `currency_inverse_rate`, `is_enable`, `currency_hash`) VALUES
(1, 'Indian Rupee', 'INR', '₹', 'left', 1, 1, 1, '6d905936a8e22f251644d6dcd706d003721bbfd0'),
(2, 'U.S. Dollar', 'USD', '$', 'left', 0.01197724746398, 83.491637206911, 1, 'd2bd965f89fa5eb39561289999e81103983bbbfe'),
(13, 'Pakistani Rupee', 'PKR', '₨', 'left', 3.3393163456888, 0.29946249366013, 1, 'f974bf89b33ea54f575700ce9b0e5b0623d6e102'),
(15, 'Bangladeshi taka', 'BDT', '৳', 'left', 1.4116492244578, 0.70839127927413, 1, 'c50366c2e3cfc46c3c0eb4008ea17864716244ed'),
(16, 'Euro', 'EUR', '€', 'left', 0.011057623739765, 90.43534339153, 1, 'db7ae0bc53f0f9b3dea17b24f9bf3b9633ce400c');

-- --------------------------------------------------------

--
-- Table structure for table `custom_settings`
--

CREATE TABLE `custom_settings` (
  `id` int(11) NOT NULL,
  `snow_data` text NOT NULL,
  `snow_data_array` text NOT NULL,
  `snow_status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1 - inactive , 2 - active',
  `start_count_parser` text NOT NULL,
  `orders_count_increase` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `custom_settings`
--

INSERT INTO `custom_settings` (`id`, `snow_data`, `snow_data_array`, `snow_status`, `start_count_parser`, `orders_count_increase`) VALUES
(1, '\"snow\":{\"init\":false,\"options\":{\"particles\":{\"move\":{\"speed\":,\"bounce\":false,\"enable\":true,\"random\":false,\"attract\":{\"enable\":false,\"rotateX\":600,\"rotateY\":1200},\"out_mode\":\"out\",\"straight\":false,\"direction\":\"bottom\"},\"size\":{\"anim\":{\"sync\":false,\"speed\":40,\"enable\":false,\"size_min\":0.1},\"value\":10,\"random\":true},\"color\":{\"value\":\"#fff\"},\"number\":{\"value\":,\"density\":{\"enable\":true,\"value_area\":650}},\"opacity\":{\"anim\":{\"sync\":false,\"speed\":1,\"enable\":true,\"opacity_min\":0.9},\"value\":0.9,\"random\":true},\"line_linked\":{\"color\":\"#ffffff\",\"width\":1,\"enable\":false,\"opacity\":0.8,\"distance\":500}},\"interactivity\":{\"modes\":{\"bubble\":{\"size\":4,\"speed\":3,\"opacity\":1,\"distance\":400,\"duration\":0.3},\"repulse\":{\"speed\":3,\"distance\":200,\"duration\":0.4}},\"events\":{\"resize\":true,\"onclick\":{\"mode\":\"repulse\",\"enable\":true},\"onhover\":{\"mode\":\"bubble\",\"enable\":false}},\"detect_on\":\"window\"},\"retina_detect\":true}},\"toys\":{\"init\":false,\"options\":{\"count\":100,\"speed\":1,\"images\":[],\"maxSize\":30,\"launches\":\"1\"}},\"garland\":{\"init\":false,\"options\":{\"type\":\"\",\"style\":\"\"}},\"fireworks\":{\"init\":false,\"options\":{\"delay\":{\"max\":30,\"min\":30},\"friction\":,\"launches\":1,}}', '{\"snow_fall\":\"true\",\"snowflakes\":\"20\",\"snow_speed\":\"3\",\"garlands\":\"true\",\"gar_shape\":\"apple\",\"gar_style\":\"style1\",\"fire_works\":\"true\",\"fire_size\":\"0.95\",\"fire_speed\":\"slow\",\"toy_size\":\"80\",\"toy_quantity\":\"100\",\"toy_speed\":\"6\",\"toy_launch\":\"infinite\"}', '1', '{\"none\":\"Catch from supplier\",\"instagram_follower\":\"Instagram followers\",\"instagram_photo\":\"Instagram likes\",\"instagram_comments\":\"Instagram comments\",\"youtube_views\":\"Youtube views\",\"youtube_likes\":\"Youtube likes\",\"youtube_comments\":\"Youtube comments\",\"youtube_subscribers\":\"Youtube subscribers\"}', '0:0');

-- --------------------------------------------------------

--
-- Table structure for table `decoration`
--

CREATE TABLE `decoration` (
  `id` int(11) NOT NULL,
  `snow_effect` int(11) NOT NULL,
  `snow_colour` text NOT NULL,
  `diwali_lights` int(11) NOT NULL,
  `video_link` text NOT NULL,
  `christmas_deco` varchar(5000) NOT NULL,
  `action_link` text NOT NULL,
  `pop_noti` int(11) NOT NULL,
  `pop_title` text NOT NULL,
  `pop_desc` text NOT NULL,
  `action_text` varchar(10) NOT NULL,
  `action_button` int(11) NOT NULL,
  `snow_fall` varchar(500) DEFAULT NULL,
  `garlands` text DEFAULT NULL,
  `fire_works` text DEFAULT NULL,
  `toys` text DEFAULT NULL,
  `snowflakes` int(11) NOT NULL,
  `snow_speed` int(11) NOT NULL,
  `gar_shape` text NOT NULL,
  `gar_style` text NOT NULL,
  `fire_size` varchar(100) NOT NULL,
  `fire_speed` text NOT NULL,
  `toy_size` int(11) NOT NULL,
  `toy_quantity` int(11) NOT NULL,
  `toy_speed` int(11) NOT NULL,
  `toy_launch` varchar(100) NOT NULL,
  `toy_a` varchar(50) NOT NULL,
  `toy_b` varchar(50) NOT NULL,
  `toy_c` varchar(50) NOT NULL,
  `toy_d` varchar(50) NOT NULL,
  `toy_e` varchar(50) NOT NULL,
  `toy_f` varchar(50) NOT NULL,
  `toy_g` varchar(50) NOT NULL,
  `toy_h` varchar(50) NOT NULL,
  `toy_i` varchar(50) NOT NULL,
  `toy_j` varchar(50) NOT NULL,
  `toy_k` varchar(50) NOT NULL,
  `psw_license` text NOT NULL,
  `toy_l` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `decoration`
--

INSERT INTO `decoration` (`id`, `snow_effect`, `snow_colour`, `diwali_lights`, `video_link`, `christmas_deco`, `action_link`, `pop_noti`, `pop_title`, `pop_desc`, `action_text`, `action_button`, `snow_fall`, `garlands`, `fire_works`, `toys`, `snowflakes`, `snow_speed`, `gar_shape`, `gar_style`, `fire_size`, `fire_speed`, `toy_size`, `toy_quantity`, `toy_speed`, `toy_launch`, `toy_a`, `toy_b`, `toy_c`, `toy_d`, `toy_e`, `toy_f`, `toy_g`, `toy_h`, `toy_i`, `toy_j`, `toy_k`, `psw_license`, `toy_l`) VALUES
(1, 0, '#ffffff', 0, '', '\n<style>.particle-snow{position:fixed;top:0;left:0;width:100%;height:100%;z-index:1;pointer-events:none}.particle-snow canvas{position:fixed;top:0;left:0;width:100%;height:100%;pointer-events:none}.christmas-garland{text-align:center;white-space:nowrap;overflow:hidden;position:absolute;z-index:1;padding:0;pointer-events:none;width:100%;height:85px}.christmas-garland .christmas-garland__item{position:relative;width:28px;height:28px;border-radius:50%;display:inline-block;margin-left:20px}.christmas-garland .christmas-garland__item .shape{-webkit-animation-fill-mode:both;animation-fill-mode:both;-webkit-animation-iteration-count:infinite;animation-iteration-count:infinite;-webkit-animation-name:flash-1;animation-name:flash-1;-webkit-animation-duration:2s;animation-duration:2s}.christmas-garland .christmas-garland__item .apple{width:22px;height:22px;border-radius:50%;margin-left:auto;margin-right:auto;margin-top:8px}.christmas-garland .christmas-garland__item .pear{width:12px;height:28px;border-radius:50%;margin-left:auto;margin-right:auto;margin-top:6px}.christmas-garland .christmas-garland__item:nth-child(2n+1) .shape{-webkit-animation-name:flash-2;animation-name:flash-2;-webkit-animation-duration:.4s;animation-duration:.4s}.christmas-garland .christmas-garland__item:nth-child(4n+2) .shape{-webkit-animation-name:flash-3;animation-name:flash-3;-webkit-animation-duration:1.1s;animation-duration:1.1s}.christmas-garland .christmas-garland__item:nth-child(odd) .shape{-webkit-animation-duration:1.8s;animation-duration:1.8s}.christmas-garland .christmas-garland__item:nth-child(3n+1) .shape{-webkit-animation-duration:1.4s;animation-duration:1.4s}.christmas-garland .christmas-garland__item:before{content:\"\";position:absolute;background:#222;width:10px;height:10px;border-radius:3px;top:-1px;left:9px}.christmas-garland .christmas-garland__item:after{content:\"\";top:-9px;left:14px;position:absolute;width:52px;height:18px;border-bottom:solid #222 2px;border-radius:50%}.christmas-garland .christmas-garland__item:last-child:after{content:none}.christmas-garland .christmas-garland__item:first-child{margin-left:-40px}</style>\n<!-- developed by Raj Patel-->\n      \n<!-- developed by Raj Patel-->  \n    <script type=\"text/javascript\" src=\"https://cdn.mypanel.link/libs/jquery/1.12.4/jquery.min.js\">\n          </script>\n    \n<!-- developed by Raj Patel-->\n        \n    <script type=\"text/javascript\" src=\"https://cdn.mypanel.link/global/flpbonhmkq9tsp29.js\">\n          </script>\n    \n        \n<!-- developed by Raj Patel-->\n    <script type=\"text/javascript\" src=\"https://cdn.mypanel.link/global/a4kdpfesx15uh7ae.js\">\n          </script>\n    \n<!-- developed by Raj Patel-->\n        \n    <script type=\"text/javascript\" src=\"https://cdn.mypanel.link/global/596z6ya3isgxcipy.js\">\n          </script>\n    \n        \n    <script type=\"text/javascript\" src=\"https://cdn.mypanel.link/global/39j8e9yrxs283d1x.js\">\n          </script>\n    \n        \n    <script type=\"text/javascript\" src=\"https://cdn.mypanel.link/global/33srijdbqcgk6lsz.js\">\n          </script>\n    \n<!-- developed by Raj Patel-->\n<!-- developed by Raj Patel-->\n        \n    <script type=\"text/javascript\" src=\"https://cdn.mypanel.link/52pp7z/wxbh27w4jdzpslxn.js\">\n          </script>\n    \n<!-- developed by Raj Patel-->\n<!-- developed by Raj Patel-->\n        \n    <script type=\"text/javascript\" src=\"https://cdn.mypanel.link/52pp7z/angedasgma230hxr.js\">\n          </script>\n    \n        \n<!-- developed by Raj Patel-->\n<!-- developed by Raj Patel-->\n    <script type=\"text/javascript\" >\n       window.modules.layouts = {\"theme_id\":1,\"auth\":0,\"live\":true};     </script>\n    \n        \n    <script type=\"text/javascript\" >\n       window.modules.signin = [];     </script>\n    \n<!-- developed by Raj Patel-->\n<!-- developed by Raj Patel-->\n<!-- developed by Raj Patel-->\n        \n    <script type=\"text/javascript\" >\n       document.addEventListener(\'DOMContentLoaded\', function() { \nvar newYearEvent = new window.NewYearEvent({\"snow\":{\"init\":true,\"options\":{\"particles\":{\"move\":{\"speed\":3,\"bounce\":false,\"enable\":true,\"random\":false,\"attract\":{\"enable\":false,\"rotateX\":600,\"rotateY\":1200},\"out_mode\":\"out\",\"straight\":false,\"direction\":\"bottom\"},\"size\":{\"anim\":{\"sync\":false,\"speed\":40,\"enable\":false,\"size_min\":0.1},\"value\":5,\"random\":true},\"color\":{\"value\":\"#fff\"},\"number\":{\"value\":100,\"density\":{\"enable\":true,\"value_area\":650}},\"opacity\":{\"anim\":{\"sync\":false,\"speed\":1,\"enable\":true,\"opacity_min\":0.9},\"value\":0.9,\"random\":true},\"line_linked\":{\"color\":\"#ffffff\",\"width\":1,\"enable\":false,\"opacity\":0.8,\"distance\":500}},\"interactivity\":{\"modes\":{\"bubble\":{\"size\":4,\"speed\":3,\"opacity\":1,\"distance\":400,\"duration\":0.3},\"repulse\":{\"speed\":3,\"distance\":200,\"duration\":0.4}},\"events\":{\"resize\":true,\"onclick\":{\"mode\":\"repulse\",\"enable\":true},\"onhover\":{\"mode\":\"bubble\",\"enable\":false}},\"detect_on\":\"window\"},\"retina_detect\":true}},\"toys\"', '', 0, '', '', '', 0, NULL, NULL, NULL, NULL, 20, 3, 'apple', 'style2', '0.95', 'slow', 80, 100, 6, 'infinite', '', '', '', '', '', '1', '', '', '', '1', '1', 'dukesmm.com', '1');

-- --------------------------------------------------------

--
-- Table structure for table `earn`
--

CREATE TABLE `earn` (
  `earn_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `link` text NOT NULL,
  `earn_note` text NOT NULL,
  `status` enum('Pending','Under Review','Funds Granted','Rejected','Not Eligible') NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `link` text DEFAULT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `name`, `link`, `date`) VALUES
(20, NULL, 'https://socialbazar.in/assets/img/files/b29af2ec9afbeeb87298fee120f555e4.png', '2024-07-08 11:05:56');

-- --------------------------------------------------------

--
-- Table structure for table `General_options`
--

CREATE TABLE `General_options` (
  `id` int(11) NOT NULL,
  `coupon_status` enum('1','2') NOT NULL DEFAULT '1',
  `updates_show` enum('1','2') NOT NULL DEFAULT '1',
  `panel_status` enum('Pending','Active','Frozen','Suspended') NOT NULL,
  `panel_orders` int(11) NOT NULL,
  `panel_thismonthorders` int(11) NOT NULL,
  `massorder` enum('1','2') NOT NULL DEFAULT '2',
  `balance_format` enum('0.0','0.00','0.000','0.0000') NOT NULL DEFAULT '0.0',
  `currency_format` enum('0','2','3','4') NOT NULL DEFAULT '3',
  `ticket_system` enum('1','2') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `General_options`
--

INSERT INTO `General_options` (`id`, `coupon_status`, `updates_show`, `panel_status`, `panel_orders`, `panel_thismonthorders`, `massorder`, `balance_format`, `currency_format`, `ticket_system`) VALUES
(1, '', '2', 'Active', 1024, 20, '1', '', '', '2');

-- --------------------------------------------------------

--
-- Table structure for table `integrations`
--

CREATE TABLE `integrations` (
  `id` int(11) NOT NULL,
  `name` varchar(225) NOT NULL,
  `description` varchar(225) NOT NULL,
  `icon_url` varchar(225) NOT NULL,
  `code` text NOT NULL,
  `visibility` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `integrations`
--

INSERT INTO `integrations` (`id`, `name`, `description`, `icon_url`, `code`, `visibility`, `status`) VALUES
(1, 'Beamer', 'Announce updates and get feedback with in-app notification center, widgets and changelog', '/assets/img/integrations/Beamer.svg', '', 1, 1),
(2, 'Getsitecontrol', 'It helps you prevent website visitors from leaving your website without taking any action.', '/assets/img/integrations/Getsitecontrol.svg', '<html>\r\n<body style=\'background-color:black\'>\r\n<canvas id=\'myCanvas\' width=\'800\' height=\'800\'></canvas>\r\n<script>\r\nconst max_fireworks = 5,\r\n  max_sparks = 50;\r\nlet canvas = document.getElementById(\'myCanvas\');\r\nlet context = canvas.getContext(\'2d\');\r\nlet fireworks = [];\r\n \r\nfor (let i = 0; i < max_fireworks; i++) {\r\n  let firework = {\r\n    sparks: []\r\n  };\r\n  for (let n = 0; n < max_sparks; n++) {\r\n    let spark = {\r\n      vx: Math.random() * 5 + .5,\r\n      vy: Math.random() * 5 + .5,\r\n      weight: Math.random() * .3 + .03,\r\n      red: Math.floor(Math.random() * 2),\r\n      green: Math.floor(Math.random() * 2),\r\n      blue: Math.floor(Math.random() * 2)\r\n    };\r\n    if (Math.random() > .5) spark.vx = -spark.vx;\r\n    if (Math.random() > .5) spark.vy = -spark.vy;\r\n    firework.sparks.push(spark);\r\n  }\r\n  fireworks.push(firework);\r\n  resetFirework(firework);\r\n}\r\nwindow.requestAnimationFrame(explode);\r\n \r\nfunction resetFirework(firework) {\r\n  firework.x = Math.floor(Math.random() * canvas.width);\r\n  firework.y = canvas.height;\r\n  firework.age = 0;\r\n  firework.phase = \'fly\';\r\n}\r\n \r\nfunction explode() {\r\n  context.clearRect(0, 0, canvas.width, canvas.height);\r\n  fireworks.forEach((firework,index) => {\r\n    if (firework.phase == \'explode\') {\r\n        firework.sparks.forEach((spark) => {\r\n        for (let i = 0; i < 10; i++) {\r\n          let trailAge = firework.age + i;\r\n          let x = firework.x + spark.vx * trailAge;\r\n          let y = firework.y + spark.vy * trailAge + spark.weight * trailAge * spark.weight * trailAge;\r\n          let fade = i * 20 - firework.age * 2;\r\n          let r = Math.floor(spark.red * fade);\r\n          let g = Math.floor(spark.green * fade);\r\n          let b = Math.floor(spark.blue * fade);\r\n          context.beginPath();\r\n          context.fillStyle = \'rgba(\' + r + \',\' + g + \',\' + b + \',1)\';\r\n          context.rect(x, y, 4, 4);\r\n          context.fill();\r\n        }\r\n      });\r\n      firework.age++;\r\n      if (firework.age > 100 && Math.random() < .05) {\r\n        resetFirework(firework);\r\n      }\r\n    } else {\r\n      firework.y = firework.y - 10;\r\n      for (let spark = 0; spark < 15; spark++) {\r\n        context.beginPath();\r\n        context.fillStyle = \'rgba(\' + index * 50 + \',\' + spark * 17 + \',0,1)\';\r\n        context.rect(firework.x + Math.random() * spark - spark / 2, firework.y + spark * 4, 4, 4);\r\n        context.fill();\r\n      }\r\n      if (Math.random() < .001 || firework.y < 200) firework.phase = \'explode\';\r\n    }\r\n  });\r\n  window.requestAnimationFrame(explode);\r\n}\r\n</script>\r\n</body>\r\n</html>', 1, 1),
(3, 'Google Analytics', 'Statistics and basic analytical tools for search engine optimization (SEO) and marketing purposes', '/assets/img/integrations/Google%20Analytics.svg', '', 1, 1),
(4, 'Google Tag manager', 'Manage all your website tags without editing the code using simple tag management solutions', '/assets/img/integrations/Google%20Tag%20manager.svg', '', 1, 1),
(5, 'JivoChat', 'All-in-one business messenger to talk to customers: live chat, phone, email and social', '/assets/img/integrations/JivoChat.svg', '', 1, 1),
(6, 'Onesignal', 'Leader in customer engagement, empowers mobile push, web push, email, in-app messages', '/assets/img/integrations/Onesignal.svg', '', 1, 1),
(7, 'Push alert', 'Increase reach, revenue, retarget users with Push Notifications on desktop and mobile', '/assets/img/integrations/Push%20alert.svg', '', 1, 1),
(8, 'Smartsupp', 'Live chat, email inbox and Facebook Messenger in one customer messaging platform', '/assets/img/integrations/Smartsupp.svg', '', 1, 1),
(9, 'Tawk.to', 'Track and chat with visitors on your website, mobile app or a free customizable page', '/assets/img/integrations/Tawk.to.svg', '', 1, 1),
(10, 'Tidio', 'Communicator for businesses that keep live chat, chatbots, Messenger and email in one place', '/assets/img/integrations/Tidio.svg', '', 1, 1),
(11, 'Zendesk Chat', 'Helps respond quickly to customer questions, reduce wait times and increase sales', '/assets/img/integrations/Zendesk%20Chat.svg', '', 1, 1),
(12, 'Getbutton.io', 'Chat with website visitors through popular messaging apps. Whatsapp, messenger etc. contact button.', '/assets/img/integrations/Getbutton.svg', '', 1, 1),
(13, 'Google reCAPTCHA v2', 'It uses an advanced risk analysis engine and adaptive challenges to prevent malware from engaging in abusive activities on your website.', '/assets/img/integrations/reCAPTCHA.svg', '', 1, 1),
(14, 'Whatsapp', 'Whatsapp is for Personal Support of your Users', '/assets/img/integrations/whatsapp.svg', '<div class=\"integration-fixed integration-fixed__bottom-right\">\r\n    <div class=\"whatsapp-container\">\r\n        <a href=\"https://wa.me/910000000000\" target=\"_blank\" class=\"whatsapp-button\">\r\n            <i class=\"fab fa-whatsapp\"></i>\r\n        </a>\r\n    </div>\r\n</div>\r\n<style>\r\n.integration-fixed{position:fixed;z-index:10000000}\r\n.integration-fixed__top-left{top:0;left:0}\r\n.integration-fixed__top-right{top:0;right:0}\r\n.integration-fixed__bottom-left{bottom:0;left:0}\r\n.integration-fixed__bottom-right{bottom:0;right:0}\r\n.whatsapp-container{padding:25px}\r\n.whatsapp-button{width:60px;height:60px;bottom:100px;right:40px;background-color:#25d366;color:#FFF!important;border-radius:50px;text-align:center;font-size:30px;box-shadow:2px 2px 3px #999;display:flex;align-items:center;justify-content:center;text-decoration:none!important;-webkit-transition:all 0.3s ease;-moz-transition:all 0.3s ease;-o-transition:all 0.3s ease;-ms-transition:all 0.3s ease;transition:all 0.3s ease;transform:scale(0.9)}\r\n.whatsapp-button:hover{transform:scale(1);background-color:#1fcc5f}\r\n</style>', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `kuponlar`
--

CREATE TABLE `kuponlar` (
  `id` int(11) NOT NULL,
  `kuponadi` varchar(255) NOT NULL,
  `adet` int(11) NOT NULL,
  `tutar` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kupon_kullananlar`
--

CREATE TABLE `kupon_kullananlar` (
  `id` int(11) NOT NULL,
  `uye_id` int(11) NOT NULL,
  `kuponadi` varchar(255) NOT NULL,
  `tutar` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `language_name` varchar(225) NOT NULL,
  `language_code` varchar(225) NOT NULL,
  `language_type` enum('2','1') NOT NULL DEFAULT '2',
  `default_language` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language_name`, `language_code`, `language_type`, `default_language`) VALUES
(1, 'English', 'en', '2', '1'),
(2, 'Arabic', 'ar', '1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `Mailforms`
--

CREATE TABLE `Mailforms` (
  `id` int(11) NOT NULL,
  `subject` varchar(225) NOT NULL,
  `message` varchar(225) NOT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1',
  `header` varchar(225) NOT NULL,
  `footer` varchar(225) NOT NULL,
  `type` enum('Admins','Users') NOT NULL DEFAULT 'Users'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `menu_name_lang` longtext DEFAULT NULL,
  `menu_line` double NOT NULL,
  `type` enum('1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '2',
  `slug` varchar(225) NOT NULL DEFAULT '2',
  `icon` varchar(225) DEFAULT NULL,
  `menu_status` enum('1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `visible` enum('Internal','External') NOT NULL DEFAULT 'Internal',
  `active` varchar(225) NOT NULL,
  `tiptext` varchar(225) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `menu_name_lang`, `menu_line`, `type`, `slug`, `icon`, `menu_status`, `visible`, `active`, `tiptext`) VALUES
(1, 'NEW ORDER', '{\"en\": \"New Order\"}', 2, '2', '/', 'fa fa-shopping-bag', '1', 'Internal', 'neworder', ''),
(3, 'ORDERS', '{\"en\": \"Orders \"}', 3, '2', '/orders', 'fas fa-server', '1', 'Internal', 'orders', ''),
(6, 'SERVICES', '{\"en\": \"Services\"}', 5, '2', '/services', 'fas fa-file-alt', '1', 'Internal', 'services', ''),
(7, 'ADD FUNDS', '{\"en\": \"Add Funds\"}', 6, '2', '/addfunds', 'fab fa-cc-amazon-pay', '1', 'Internal', 'addfunds', ''),
(8, 'API DOCS', '{\"en\": \"Api\"}', 9, '2', '/api', 'fal fa-plug', '1', 'Internal', 'api', ''),
(9, 'TICKETS', '{\"en\": \"Tickets \"}', 8, '2', '/tickets', 'fas fa-headset', '1', 'Internal', 'tickets', ''),
(10, 'CHILD PANEL', '{\"en\": \"Child Panels\"}', 10, '2', '/child-panels', 'fas fa-child', '1', 'Internal', 'child-panels', 'Shown only if child panels selling enabled'),
(11, 'REFER & EARN', '{\"en\": \"Refer & Earn\"}', 11, '2', '/refer', 'fas fa-bezier-curve', '1', 'Internal', 'refer', 'Shown only if affiliate system enabled for use'),
(13, 'TERMS', '{\"en\": \"Terms\"}', 12, '2', '/terms', 'fas fa-exclamation-triangle', '1', 'Internal', 'terms', ''),
(14, 'SIGNUP', '{\"en\": \"Signup\"}', 2, '2', '/signup', 'fas fa-arrow-right', '1', 'External', 'signup', 'Shown only if Signup system enabled for use'),
(17, 'DAILY UPDATES!', '{\"en\": \"Daily Updates\"}', 13, '2', '/updates', 'fas fa-bell', '1', 'Internal', '', 'Shown only if Updates System enabled'),
(18, 'TERMS', '{\"en\": \"Terms\"}', 3, '2', '/terms', 'fas fa-exclamation-triangle', '1', 'External', 'terms', ''),
(32, 'BLOGS\r\n', '{\"en\": \"blogs\"}', 16, '2', '/blog', 'fab fa-500px', '1', 'Internal', 'blog', ''),
(24, 'SERVICES', '{\"en\": \"Services\"}', 14, '2', '/services', 'fas fa-file-alt', '1', 'External', 'services', ''),
(31, 'BLOGS', '{\"en\": \"blogs\"}', 15, '2', '/blog', 'fab fa-500px', '1', 'External', 'blog', ''),
(36, 'DASHBOARD', '{\"en\":\"Dashboard\",\"ar\":\"\"}', 1, '2', '/dashboard', 'far fa-address-card', '1', 'Internal', 'dashboard', '');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `news_icon` varchar(225) NOT NULL,
  `news_title` varchar(225) NOT NULL,
  `news_title_lang` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `news_content` varchar(225) NOT NULL,
  `news_content_lang` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `news_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications_popup`
--

CREATE TABLE `notifications_popup` (
  `id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `type` text DEFAULT NULL,
  `action_link` text DEFAULT NULL,
  `isAllUser` enum('1','0') NOT NULL DEFAULT '0',
  `expiry_date` date NOT NULL,
  `status` enum('1','2','0') NOT NULL DEFAULT '1',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `action_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `api_orderid` int(11) NOT NULL DEFAULT 0,
  `order_error` text NOT NULL,
  `order_detail` text DEFAULT NULL,
  `order_api` int(11) NOT NULL DEFAULT 0,
  `api_serviceid` int(11) NOT NULL DEFAULT 0,
  `api_charge` double NOT NULL DEFAULT 0,
  `api_currencycharge` double DEFAULT 1,
  `order_profit` double NOT NULL,
  `order_quantity` double NOT NULL,
  `order_extras` text NOT NULL,
  `order_charge` double NOT NULL,
  `dripfeed` enum('1','2','3') DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `dripfeed_id` double NOT NULL DEFAULT 0,
  `subscriptions_id` double NOT NULL DEFAULT 0,
  `subscriptions_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `dripfeed_totalcharges` double DEFAULT NULL,
  `dripfeed_runs` double DEFAULT NULL,
  `dripfeed_delivery` double NOT NULL DEFAULT 0,
  `dripfeed_interval` double DEFAULT NULL,
  `dripfeed_totalquantity` double DEFAULT NULL,
  `dripfeed_status` enum('active','completed','canceled') NOT NULL DEFAULT 'active',
  `order_url` text NOT NULL,
  `order_start` double NOT NULL DEFAULT 0,
  `order_finish` double NOT NULL DEFAULT 0,
  `order_remains` double NOT NULL DEFAULT 0,
  `order_create` datetime NOT NULL,
  `order_status` enum('pending','inprogress','completed','partial','processing','canceled') NOT NULL DEFAULT 'pending',
  `subscriptions_status` enum('active','paused','completed','canceled','expired','limit') NOT NULL DEFAULT 'active',
  `subscriptions_username` text DEFAULT NULL,
  `subscriptions_posts` double DEFAULT NULL,
  `subscriptions_delivery` double NOT NULL DEFAULT 0,
  `subscriptions_delay` double DEFAULT NULL,
  `subscriptions_min` double DEFAULT NULL,
  `subscriptions_max` double DEFAULT NULL,
  `subscriptions_expiry` date DEFAULT NULL,
  `last_check` datetime NOT NULL,
  `order_where` enum('site','api') NOT NULL DEFAULT 'site',
  `refill_status` enum('Pending','Refilling','Completed','Rejected','Error') NOT NULL DEFAULT 'Pending',
  `is_refill` enum('1','2') NOT NULL DEFAULT '1',
  `refill` varchar(225) NOT NULL DEFAULT '1',
  `cancelbutton` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1 -> ON, 2 -> OFF',
  `show_refill` enum('true','false') NOT NULL DEFAULT 'true',
  `api_refillid` double NOT NULL DEFAULT 0,
  `avg_done` enum('0','1') NOT NULL DEFAULT '1',
  `order_increase` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `page_id` int(11) NOT NULL,
  `page_name` varchar(225) NOT NULL,
  `page_get` varchar(225) NOT NULL,
  `page_content` text NOT NULL,
  `page_status` enum('1','2') NOT NULL DEFAULT '1',
  `active` enum('1','2') NOT NULL DEFAULT '1',
  `seo_title` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `seo_keywords` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `seo_description` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `last_modified` datetime NOT NULL,
  `del` varchar(255) NOT NULL DEFAULT '1',
  `page_content2` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`page_id`, `page_name`, `page_get`, `page_content`, `page_status`, `active`, `seo_title`, `seo_keywords`, `seo_description`, `last_modified`, `del`, `page_content2`) VALUES
(2, 'Add funds', 'addfunds', '', '1', '1', 'AddFunds', 'smm panel', 'smm panel', '2023-07-27 09:55:56', '2', ''),
(787, 'Login', 'auth', '<h1>Buy Cheap Social Media Followers, Likes, Views, Shares Instantly.</h1>\r\n\r\n<div class=\"features\">\r\n  <span><i class=\"fas fa-chevron-right\"></i> Fully Automated Instant Trusted Panel.</span><br>\r\n  <span><i class=\"fas fa-chevron-right\"></i> Orders are completed fully automatically and quickly.</span><br>\r\n  <span><i class=\"fas fa-chevron-right\"></i> We provide instant support for your questions and problems 24 hours a day, 7 days a week.</span><br>\r\n  <span><i class=\"fas fa-chevron-right\"></i> SMM Panel meaning is Cheapest SMM and SEO Services Reseller Panel Script or website, where People Buy-Sell Social Media Marketing Services such as Facebook Fans, Twitter followers, Instagram Followers, YouTube watch time Views, Website Traffic, TikTok Likes, and more significant associations.</span><br>\r\n  <span><i class=\"fas fa-chevron-right\"></i> For more information, visit our <a href=\"https://ownsmmpanel.in\" target=\"_blank\">website</a>.</span>\r\n</div>\r\n', '1', '1', 'SMMPanel - Best & Super Fast SMM Panel', 'SMMPanel - #1 SMM Reseller Panel - Best SMM Panel for Resellers. Also well known for TOP SMM Panel and Cheap SMM Panel for all kind of Social Media Marketing Services. SMM Panel for Facebook, Instagram, YouTube and more servi', 'smm panel, smm reseller panel, smm provider panel, reseller panel, instagram panel, resellerpanel, social media reseller panel, smmpanel, panelsmm, smm, panel, socialmedia, instagram reseller panel, smm panel india, best smm ', '2024-07-08 09:40:26', '2', ''),
(9, 'New Order', 'neworder', '', '1', '1', 'New Order', 'smm panel', 'smm panel', '2023-08-02 11:58:29', '2', ''),
(14, 'Terms', 'terms', '', '1', '1', 'Terms', 'smm panel', 'smm panel', '2022-02-07 08:41:16', '2', '<h2 class=\"mb-5\">Terms & Conditions of SMMPanel</h2> 																				 <p>The use of services provided by SMMPanel (<b> SMM Panel  </b>) Established the agreement to these terms. By registering or using our services you agree that you have read and fully understood the following terms of Service and SMMPanel will not be help liable for loss in any way for users who have not read the below terms of service.</p>           <b>Delivery Policy</b>            <p> ● By placing an order with <b>SMMPanel</b>, you automatically accept all the below-listed term of services whether you read them or not.</p>            <p> ● We reserve the right to change these terms of service without notice. You are expected to read all terms of service before placing every order to ensure you are up to date with any changes or any future changes. </p> <p> ● You will only use the <b>SMMPanel</b> website in a manner which follows all agreements made with <b>Soundcloud/Vine/Pinterest/Youtube/other social media site</b> on their individual Terms of Service page.</p> <p> ● <b>SMMPanel</b> rates are subject to change at any time without notice. The terms stay in effect in the case of rate changes.</p> <p> ● <b>SMMPanel</b>( Digital SMMPanel ) does not guarantee a delivery time for any services as its depend on the services order quantity. We offer our best estimation for when the order will be delivered. This is only an estimation and <b>SMMPanel</b> will not refund orders that are processing if you feel they are taking too long. </p> <p> ● <b>SMMPanel</b> tries hard to deliver exactly what is expected of us by our resellers. In this case, we reserve the right to change a service type if we deem it necessary to complete an order. </p> <p> ● <b>SMMPanel</b> Always provide the amount mentioned in Service Descriptions , But Remember , If Incase there is Any Update in Any Social Media Platforms then the Drop Ratios of NON DROP or any Guarantee can be Changed , And SMMPanel cant be Responsible for this.  </p>             <b>Disclaimer:</b>           <p><b>SMMPanel</b> will not be responsible for any damages you or your business may suffer.</p>           <b>Liabilities:</b>           <p><b>SMMPanel</b> is in no way liable for any account suspension or picture deletion done by Instagram or Twitter or Facebook or YouTube or Other Social Media.</p>           <br> 	<h2 class=\"mb-5\">Privacy Policy</h2> 	<p> ● This policy covers how we use your personal information. We take your privacy seriously and will take all measures to protect your personal information.  Any personal information received will only be used to fill your order. We will not sell or redistribute your personal information to anyone. All personal information is encrypted and saved in secure servers. </p> 			  <h2 class=\"mb-5\">Refund Policy</h2> 			 													<p>No refunds will be made to your payment method. After a deposit has been completed, there is no way to reverse it. You must use your balance on orders from SMMPanel</p>           <p>You agree that once you complete a payment, you will not file a dispute or a chargeback against us for any reason.</p>           <p>If you file a dispute or charge-back against us after a deposit, we reserve the right to terminate all future orders, ban you from our site. We also reserve the right to take away any followers or likes we delivered to your or your clients Instagram/Facebook/Twitter or other social media account.</p>           <p>Orders placed in SMMPanel will not be refunded or canceled after they are placed.You will receive a refund credit to your SMMPanel account if the order is non deliverable</p>           <p>Misplaced or Private account orders will not qualify for a refund. Be sure to confirm each and every order before placing it.</p>           <p>Wrong Links Orders cant be Refunded , Once Order is Placed !!</p>           <p>Fraudulent activity such as using unauthorized or stolen credit cards will lead to termination of your account. There are no exceptions.</p>           <p>Please do not use more than one server at the same time for the same page. We cannot give you correct followers/likes number in that case. We will not refund for these orders.</p> 										 								 											<h2 class=\"mb-5\">About Services</h2> 											<div class=\"read-text\"> 												 																	<p> ● <b>SMMPanel</b> will only be used to promote your YouTube or Instagram or Telegram or Pinterest or Social account and help boost your \"Appearance\" only. </p>  <p> ● We <b>DO NOT</b> guarantee your new followers will interact with you, we simply <b>guarantee</b> you to get the followers you pay for. </p>  <p> ● We <b>DO NOT</b> guarantee 100% of our accounts will have a profile picture, full bio and uploaded pictures, although we strive to make this the reality for all accounts. </p>  <p> ● We <b>DO NOT</b> guarantee 100% of our accounts will have a profile picture, full bio and uploaded pictures, although we strive to make this the reality for all accounts. </p>  <p> ● You will not upload anything into the <b>SMM Panel</b> site including nudity or any material that is not accepted or suitable for the YouTube or Instagram or Telegram or Pinterest or Social Media community. </p>  <b> ●</b> If your page had 100k+ followers/likes/views already before you order us, it will not cover refill protection, even if you order for refill server from us, as its not possible to understand from where you lost the followers/likes/views.   			</div>'),
(789, 'Mass Order', 'massorder', '', '1', '1', 'Mass Order', 'smm panel', 'smm panel', '2022-02-07 08:43:06', '2', ''),
(790, 'Orders', 'orders', '', '1', '1', 'Orders', 'smm panel', 'smm panel', '2022-02-07 08:53:20', '2', ''),
(791, 'Services', 'services', '', '1', '1', 'Services', 'smm panel', 'smm panel', '2022-01-26 07:22:09', '2', ''),
(792, 'Tickets', 'tickets', '', '1', '1', 'Tickets', 'smm panel', 'smm panel', '2022-01-26 07:22:09', '2', ''),
(793, 'API', 'api', '', '1', '1', 'API', 'smm panel', 'smm panel', '2022-01-24 07:21:07', '2', ''),
(794, 'Signup', 'signup', '', '1', '1', 'Signup', 'smm panel', 'smm panel', '2022-01-24 07:21:07', '2', ''),
(795, 'Blog', 'blog', '', '1', '1', 'Blog', 'smm panel', 'smm panel', '2022-01-24 07:21:07', '2', '');

-- --------------------------------------------------------

--
-- Table structure for table `panel_categories`
--

CREATE TABLE `panel_categories` (
  `id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '1 -> ENABLE, 0 -> DISABLE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `panel_info`
--

CREATE TABLE `panel_info` (
  `panel_id` int(11) NOT NULL,
  `panel_domain` text NOT NULL,
  `panel_plan` text NOT NULL,
  `panel_status` enum('Pending','Active','Frozen','Suspended') NOT NULL,
  `panel_orders` int(11) NOT NULL,
  `panel_thismonthorders` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `api_key` varchar(225) NOT NULL,
  `renewal_date` datetime NOT NULL,
  `panel_type` enum('Child','Main') NOT NULL DEFAULT 'Main'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `panel_info`
--

INSERT INTO `panel_info` (`panel_id`, `panel_domain`, `panel_plan`, `panel_status`, `panel_orders`, `panel_thismonthorders`, `date_created`, `api_key`, `renewal_date`, `panel_type`) VALUES
(1, 'yourpanel.com', 'A', 'Active', 0, 0, '2022-01-24 10:58:08', 'b1fbedd6f1266a8990bf648919068680', '2025-02-23 10:58:08', 'Main');

-- --------------------------------------------------------

--
-- Table structure for table `paymentmethods`
--

CREATE TABLE `paymentmethods` (
  `methodId` int(11) NOT NULL,
  `methodName` varchar(300) DEFAULT NULL,
  `methodLogo` varchar(200) DEFAULT NULL,
  `methodVisibleName` varchar(300) DEFAULT NULL,
  `methodCallback` varchar(100) DEFAULT NULL,
  `methodMin` int(11) NOT NULL DEFAULT 1,
  `methodMax` int(11) NOT NULL DEFAULT 1,
  `methodFee` float NOT NULL DEFAULT 0,
  `methodBonusPercentage` float NOT NULL DEFAULT 0,
  `methodBonusStartAmount` int(11) NOT NULL DEFAULT 0,
  `methodCurrency` varchar(3) DEFAULT NULL,
  `methodStatus` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 -> off, 1 -> on',
  `methodExtras` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `methodPosition` int(11) DEFAULT NULL,
  `methodInstructions` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `paymentmethods`
--

INSERT INTO `paymentmethods` (`methodId`, `methodName`, `methodLogo`, `methodVisibleName`, `methodCallback`, `methodMin`, `methodMax`, `methodFee`, `methodBonusPercentage`, `methodBonusStartAmount`, `methodCurrency`, `methodStatus`, `methodExtras`, `methodPosition`, `methodInstructions`) VALUES
(1, 'PayTM Checkout', 'img/payments/paytm.svg', 'PayTM Checkout', 'payTMCheckout', 1, 100000, 0, 0, 0, 'INR', '0', '{\"merchantId\":\"\",\"merchantKey\":\"\"}', 2, ''),
(2, 'PayTM Merchant', 'img/payments/paytmqr.svg', 'PayTm QR', 'payTMMerchant', 10, 75000, 0, 2, 100, 'INR', '0', '{\"merchantId\":\"\"}', 1, ''),
(3, 'Perfect Money', 'img/payments/perfect_money.svg', 'Perfect Money', 'perfectMoney', 10, 1000, 3, 0, 0, 'USD', '0', '{\"accountNumber\":\"\",\"alternatePassPhrase\":\"\"}', 3, ''),
(4, 'Coinbase Commerce', 'img/payments/coinbase.svg', 'Coinbase Commerce', 'coinbaseCommerce', 1, 1000, 0, 0, 0, 'USD', '0', '{\"APIKey\":\"\"}', 4, NULL),
(5, 'Kashier', 'img/payments/kashier.svg', 'Kashier', 'kashier', 1, 1000, 0, 0, 0, 'USD', '0', '{\"MID\":\"\",\"APIKey\":\"\",\"mode\":\"live\"}', 5, NULL),
(6, 'Razorpay', 'img/payments/razorpay.svg', 'Razorpay', 'razorPay', 1, 10000, 0, 0, 0, 'INR', '0', '{\"APIPublicKey\":\"\",\"APISecretKey\":\"\",\"gatewayThemeColour\":\"\"}', 6, NULL),
(7, 'PhonePe (Automatic)', 'img/payments/phonepe.svg', 'PhonePe (Automatic)', 'phonepe', 1, 10000, 0, 0, 0, 'INR', '0', '{\"email\":false,\"password\":\"\"}', 7, ''),
(8, 'Easypaisa (Automatic)', 'img/payments/easypaisa.svg', 'Easypaisa (Automatic)', 'easypaisa', 1, 50000, 0, 0, 0, 'PKR', '0', '{\"email\":\"\",\"password\":\"\",\"senderEmail\":\"\",\"emailSubject\":\"easypaisa\"}', 8, NULL),
(9, 'Jazzcash (Automatic)', 'img/payments/jazzcash.svg', 'Jazzcash (Automatic)', 'jazzcash', 1, 50000, 0, 0, 0, 'PKR', '0', '{\"email\":\"\",\"password\":\"\",\"senderEmail\":\"\",\"emailSubject\":\"jazzcash\"}', 9, NULL),
(10, 'Instamojo', 'img/payments/instamogo.svg', 'Instamojo', 'instamojo', 1, 1000, 0, 0, 0, 'INR', '0', '{\"APIKey\":\"\",\"authToken\":\"\"}', 10, NULL),
(11, 'Cashmaal', 'img/payments/cashmaal.svg', 'Cashmaal', 'cashmaal', 1, 50000, 0, 0, 0, 'PKR', '0', '{\"webId\":\"\"}', 11, NULL),
(12, 'Alipay', 'img/payments/alipay.svg', 'Alipay', 'alipay', 1, 10000, 0, 0, 0, 'USD', '0', '{\"partnerId\":\"\",\"privateKey\":\"\"}', 12, NULL),
(13, 'PayU', 'img/payments/payu.svg', 'PayU', 'payU', 1, 10000, 0, 0, 0, 'INR', '0', '{\"merchantKey\":\"\",\"merchantSalt\":\"\"}', 13, NULL),
(14, 'UpiApi', 'img/payments/upiapi.svg', 'UpiApi', 'upiapi', 1, 10000, 0, 0, 0, 'INR', '0', '{\"productionAPIToken\":\"\",\"productionAPISecretKey\":\"\"}', 2, ''),
(15, 'Opay Express Checkout', 'img/payments/opay.svg', 'Opay Express Checkout', 'opay', 1, 10000, 0, 0, 0, 'USD', '0', '{\"merchantId\":\"\",\"publicKey\":\"\",\"secretKey\":\"\"}', 3, ''),
(16, 'Flutterwave', 'img/payments/Flutterwave.svg', 'Flutterwave', 'flutterwave', 1, 1000, 0, 0, 0, 'USD', '0', '{\"secretKey\":\"\"}', 3, ''),
(17, 'Stripe', 'img/payments/stripe.svg', 'Stripe', 'stripe', 1, 1000, 0, 0, 0, 'USD', '0', '{\"publishableKey\":\"\",\"secretKey\":\"\"}', 2, ''),
(18, 'Payeer', 'img/payments/payeer.svg', 'Payeer', 'payeer', 1, 1000, 0, 0, 0, 'USD', '0', '{\"shopId\":\"\",\"secretKey\":\"\"}', 3, '');
INSERT INTO `paymentmethods` (`methodId`, `methodName`, `methodLogo`, `methodVisibleName`, `methodCallback`, `methodMin`, `methodMax`, `methodFee`, `methodBonusPercentage`, `methodBonusStartAmount`, `methodCurrency`, `methodStatus`, `methodExtras`, `methodPosition`, `methodInstructions`) VALUES
(19, 'bharatpe', NULL, 'BharatPe QR', 'bharatpe', 1, 10000, 0, 50, 50, 'INR', '1', '{\"merchantId\":\"000000\",\"token\":\"0000000000000000000000000\"}', 1, '&lt;p&gt;&lt;img src=&quot;data:image/jpeg;base64,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&quot;&gt;&lt;/p&gt;');
INSERT INTO `paymentmethods` (`methodId`, `methodName`, `methodLogo`, `methodVisibleName`, `methodCallback`, `methodMin`, `methodMax`, `methodFee`, `methodBonusPercentage`, `methodBonusStartAmount`, `methodCurrency`, `methodStatus`, `methodExtras`, `methodPosition`, `methodInstructions`) VALUES
(100, 'Manual One', 'img/payments/manual.svg', 'Manual One', NULL, 1, 1, 0, 0, 0, NULL, '0', NULL, 2, NULL),
(101, 'Manual Two', 'img/payments/manual.svg', 'Manual Two', NULL, 1, 1, 0, 0, 0, NULL, '0', NULL, 3, NULL),
(102, 'Manual Three', 'img/payments/manual.svg', 'Manual Three', NULL, 1, 1, 0, 0, 0, NULL, '0', NULL, 4, NULL),
(103, 'Manual Four', 'img/payments/manual.svg', 'Manual Four', NULL, 1, 1, 0, 0, 0, NULL, '0', NULL, 2, NULL),
(104, 'Manual Five', 'img/payments/manual.svg', 'Manual Five', NULL, 1, 1, 0, 0, 0, NULL, '0', NULL, 18, NULL),
(105, 'Manual Six', 'img/payments/manual.svg', 'Manual Six', NULL, 1, 1, 0, 0, 0, NULL, '0', NULL, 19, NULL),
(106, 'Manual Seven', 'img/payments/manual.svg', 'Manual Seven', NULL, 1, 1, 0, 0, 0, NULL, '0', NULL, 20, NULL),
(107, 'Manual Eight', 'img/payments/manual.svg', 'Manual Eight', NULL, 1, 1, 0, 0, 0, NULL, '0', NULL, 21, NULL),
(108, 'Manual Nine', 'img/payments/manual.svg', 'Manual Nine', NULL, 1, 1, 0, 0, 0, NULL, '0', NULL, 22, NULL),
(109, 'Manual Ten', 'img/payments/manual.svg', 'Manual Ten', NULL, 1, 1, 0, 0, 0, NULL, '0', NULL, 23, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `client_balance` decimal(15,2) NOT NULL DEFAULT 0.00,
  `payment_amount` decimal(15,4) NOT NULL,
  `payment_privatecode` double DEFAULT NULL,
  `payment_method` int(11) NOT NULL,
  `payment_status` enum('1','2','3') NOT NULL DEFAULT '1',
  `payment_delivery` enum('1','2') NOT NULL DEFAULT '1',
  `payment_note` varchar(255) NOT NULL DEFAULT 'No',
  `payment_mode` enum('Manual','Automatic') NOT NULL DEFAULT 'Automatic',
  `payment_create_date` datetime NOT NULL,
  `payment_update_date` datetime NOT NULL,
  `payment_ip` varchar(225) NOT NULL,
  `payment_extra` text NOT NULL,
  `payment_bank` int(11) NOT NULL,
  `t_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referral`
--

CREATE TABLE `referral` (
  `referral_id` int(11) NOT NULL,
  `referral_client_id` int(11) NOT NULL,
  `referral_clicks` double NOT NULL DEFAULT 0,
  `referral_sign_up` double NOT NULL DEFAULT 0,
  `referral_totalFunds_byReffered` double NOT NULL DEFAULT 0,
  `referral_earned_commision` double DEFAULT 0,
  `referral_requested_commision` varchar(225) DEFAULT '0',
  `referral_total_commision` double DEFAULT 0,
  `referral_status` enum('1','2') NOT NULL DEFAULT '1',
  `referral_code` text NOT NULL,
  `referral_rejected_commision` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referral_payouts`
--

CREATE TABLE `referral_payouts` (
  `r_p_id` int(11) NOT NULL,
  `r_p_code` text NOT NULL,
  `r_p_status` enum('1','2','3','4','0') NOT NULL DEFAULT '0',
  `r_p_amount_requested` double NOT NULL,
  `r_p_requested_at` datetime NOT NULL,
  `r_p_updated_at` datetime NOT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `serviceapi_alert`
--

CREATE TABLE `serviceapi_alert` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `serviceapi_alert` text NOT NULL,
  `servicealert_extra` text NOT NULL,
  `servicealert_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL,
  `service_api` int(11) NOT NULL DEFAULT 0,
  `api_service` int(11) NOT NULL DEFAULT 0,
  `api_servicetype` enum('1','2') NOT NULL DEFAULT '2',
  `api_detail` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `service_line` double NOT NULL,
  `service_type` enum('1','2') NOT NULL DEFAULT '2',
  `service_package` enum('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17') NOT NULL,
  `service_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `service_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `service_price` varchar(225) NOT NULL,
  `service_min` double NOT NULL,
  `service_max` double NOT NULL,
  `service_dripfeed` enum('1','2') NOT NULL DEFAULT '1',
  `service_autotime` double NOT NULL DEFAULT 0,
  `service_autopost` double NOT NULL DEFAULT 0,
  `service_speed` enum('1','2','3','4') NOT NULL,
  `want_username` enum('1','2') NOT NULL DEFAULT '1',
  `service_secret` enum('1','2') NOT NULL DEFAULT '2',
  `price_type` enum('normal','percent','amount') NOT NULL DEFAULT 'normal',
  `price_cal` text DEFAULT NULL,
  `instagram_second` enum('1','2') NOT NULL DEFAULT '2',
  `start_count` enum('none','instagram_follower','instagram_photo','') NOT NULL,
  `instagram_private` enum('1','2') NOT NULL,
  `name_lang` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `description_lang` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `time_lang` varchar(225) NOT NULL DEFAULT 'Not enough data',
  `time` varchar(225) NOT NULL DEFAULT 'Not enough data',
  `cancelbutton` enum('1','2') NOT NULL DEFAULT '2' COMMENT '1 -> ON, 2 -> OFF',
  `show_refill` enum('true','false') NOT NULL DEFAULT 'false',
  `service_profit` varchar(225) NOT NULL,
  `refill_days` varchar(225) NOT NULL DEFAULT '30',
  `refill_hours` varchar(225) NOT NULL DEFAULT '24',
  `avg_days` int(11) NOT NULL,
  `avg_hours` int(11) NOT NULL,
  `avg_minutes` int(11) NOT NULL,
  `avg_many` int(11) NOT NULL,
  `price_profit` int(11) NOT NULL,
  `service_overflow` int(11) NOT NULL DEFAULT 0,
  `service_sync` enum('0','1') NOT NULL DEFAULT '1',
  `service_deleted` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_api`
--

CREATE TABLE `service_api` (
  `id` int(11) NOT NULL,
  `api_name` varchar(225) NOT NULL,
  `api_url` text NOT NULL,
  `api_key` varchar(225) NOT NULL,
  `api_type` int(11) NOT NULL,
  `api_limit` double NOT NULL DEFAULT 0,
  `currency` varchar(200) DEFAULT NULL,
  `api_alert` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> Gönder, 1 -> Gönderildi',
  `status` enum('1','2') NOT NULL DEFAULT '2',
  `api_sync` enum('0','1') NOT NULL DEFAULT '1',
  `api_login_credentials` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `service_api`
--

INSERT INTO `service_api` (`id`, `api_name`, `api_url`, `api_key`, `api_type`, `api_limit`, `currency`, `api_alert`, `status`, `api_sync`, `api_login_credentials`) VALUES
(12, 'FollowersKart', 'https://followerskart.in/api/v2', '82c89734646f370fcd347461e4698ec2', 1, 0, 'INR', '1', '1', '1', '{\"username\":\"\",\"password\":\"\"}');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `site_seo` text NOT NULL,
  `site_title` text DEFAULT NULL,
  `site_description` text DEFAULT NULL,
  `site_keywords` text DEFAULT NULL,
  `site_logo` text DEFAULT NULL,
  `site_name` text DEFAULT NULL,
  `site_currency` varchar(2555) NOT NULL DEFAULT 'try',
  `site_base_currency` varchar(20) DEFAULT NULL,
  `site_currency_converter` tinyint(1) NOT NULL DEFAULT 0,
  `site_update_rates_automatically` int(11) NOT NULL DEFAULT 0,
  `last_updated_currency_rates` datetime DEFAULT NULL,
  `favicon` text DEFAULT NULL,
  `site_language` varchar(225) NOT NULL DEFAULT 'tr',
  `site_theme` text NOT NULL,
  `site_theme_alt` text DEFAULT NULL,
  `recaptcha` enum('1','2') NOT NULL DEFAULT '1',
  `recaptcha_key` text DEFAULT NULL,
  `recaptcha_secret` text DEFAULT NULL,
  `custom_header` text DEFAULT NULL,
  `custom_footer` text DEFAULT NULL,
  `ticket_system` enum('1','2') NOT NULL DEFAULT '2',
  `register_page` enum('1','2') NOT NULL DEFAULT '2',
  `service_speed` enum('1','2') NOT NULL,
  `service_list` enum('1','2') NOT NULL,
  `dolar_charge` double NOT NULL,
  `euro_charge` double NOT NULL,
  `smtp_user` text NOT NULL,
  `smtp_pass` text NOT NULL,
  `smtp_server` text NOT NULL,
  `smtp_port` varchar(225) NOT NULL,
  `smtp_protocol` enum('0','ssl','tls') NOT NULL,
  `alert_type` enum('1','2','3') NOT NULL,
  `alert_apimail` enum('1','2') NOT NULL,
  `alert_newmanuelservice` enum('1','2') NOT NULL,
  `alert_newticket` enum('1','2') NOT NULL,
  `alert_apibalance` enum('1','2') NOT NULL,
  `alert_serviceapialert` enum('1','2') NOT NULL,
  `sms_provider` varchar(225) NOT NULL,
  `sms_title` varchar(225) NOT NULL,
  `sms_user` varchar(225) NOT NULL,
  `sms_pass` varchar(225) NOT NULL,
  `sms_validate` enum('0','1') NOT NULL DEFAULT '0' COMMENT '1 -> OK, 0 -> NO',
  `admin_mail` varchar(225) NOT NULL,
  `admin_telephone` varchar(225) NOT NULL,
  `resetpass_page` enum('1','2') NOT NULL,
  `resetpass_sms` enum('1','2') NOT NULL,
  `resetpass_email` enum('1','2') NOT NULL,
  `site_maintenance` enum('1','2') NOT NULL DEFAULT '2',
  `servis_siralama` varchar(255) NOT NULL,
  `bronz_statu` int(11) NOT NULL,
  `silver_statu` int(11) NOT NULL,
  `gold_statu` int(11) NOT NULL,
  `bayi_statu` int(11) NOT NULL,
  `child_panel_nameservers` varchar(255) NOT NULL DEFAULT '{"ns1":"ns1.scriptlux.com","ns2":"ns2.scriptlux.com"}',
  `childpanel_price` double DEFAULT NULL,
  `snow_effect` enum('1','2') NOT NULL DEFAULT '2',
  `snow_colour` text NOT NULL,
  `promotion` enum('1','2') DEFAULT '2',
  `referral_commision` double NOT NULL,
  `referral_payout` double NOT NULL,
  `referral_status` enum('1','2') NOT NULL DEFAULT '1',
  `childpanel_selling` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1 -> OFF , 2 -> ON',
  `tickets_per_user` double NOT NULL DEFAULT 5,
  `name_fileds` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1 -> ON, 2 -> NO',
  `skype_feilds` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1 -> ON, 2 -> NO',
  `otp_login` enum('1','2','0') NOT NULL DEFAULT '0',
  `auto_deactivate_payment` enum('1','2') NOT NULL DEFAULT '1',
  `service_avg_time` enum('1','0') NOT NULL DEFAULT '0',
  `alert_orderfail` enum('1','2') NOT NULL DEFAULT '2',
  `alert_welcomemail` enum('1','2') NOT NULL DEFAULT '2',
  `freebalance` enum('1','2') NOT NULL DEFAULT '1',
  `freeamount` double DEFAULT 0,
  `alert_newmessage` enum('1','2') NOT NULL DEFAULT '1',
  `email_confirmation` enum('1','2') NOT NULL DEFAULT '2',
  `resend_max` int(11) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT '1',
  `fundstransfer_fees` varchar(10) NOT NULL,
  `permissions` text DEFAULT NULL,
  `fake_order_service_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `fake_order_min` int(11) DEFAULT NULL,
  `fake_order_max` int(11) DEFAULT NULL,
  `panel_orders` int(11) DEFAULT NULL,
  `panel_orders_pattern` varchar(255) NOT NULL DEFAULT '{"panel_orders_prefix":"","panel_orders_suffix":""}',
  `downloaded_category_icons` tinyint(1) NOT NULL DEFAULT 0,
  `summary_card_background_color` varchar(100) DEFAULT 'theme_colour',
  `google_login` varchar(100) NOT NULL DEFAULT '{"purchased":"1","status":"1"}',
  `services_average_time` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `site_seo`, `site_title`, `site_description`, `site_keywords`, `site_logo`, `site_name`, `site_currency`, `site_base_currency`, `site_currency_converter`, `site_update_rates_automatically`, `last_updated_currency_rates`, `favicon`, `site_language`, `site_theme`, `site_theme_alt`, `recaptcha`, `recaptcha_key`, `recaptcha_secret`, `custom_header`, `custom_footer`, `ticket_system`, `register_page`, `service_speed`, `service_list`, `dolar_charge`, `euro_charge`, `smtp_user`, `smtp_pass`, `smtp_server`, `smtp_port`, `smtp_protocol`, `alert_type`, `alert_apimail`, `alert_newmanuelservice`, `alert_newticket`, `alert_apibalance`, `alert_serviceapialert`, `sms_provider`, `sms_title`, `sms_user`, `sms_pass`, `sms_validate`, `admin_mail`, `admin_telephone`, `resetpass_page`, `resetpass_sms`, `resetpass_email`, `site_maintenance`, `servis_siralama`, `bronz_statu`, `silver_statu`, `gold_statu`, `bayi_statu`, `child_panel_nameservers`, `childpanel_price`, `snow_effect`, `snow_colour`, `promotion`, `referral_commision`, `referral_payout`, `referral_status`, `childpanel_selling`, `tickets_per_user`, `name_fileds`, `skype_feilds`, `otp_login`, `auto_deactivate_payment`, `service_avg_time`, `alert_orderfail`, `alert_welcomemail`, `freebalance`, `freeamount`, `alert_newmessage`, `email_confirmation`, `resend_max`, `status`, `fundstransfer_fees`, `permissions`, `fake_order_service_enabled`, `fake_order_min`, `fake_order_max`, `panel_orders`, `panel_orders_pattern`, `downloaded_category_icons`, `summary_card_background_color`, `google_login`, `services_average_time`) VALUES
(1, 'SMMPanel', 'SMMPanel', 'SMMPanel', 'SMMPanel', 'assets/img/panel/85fc37b18c57097425b52fc7afbb6969.png', 'SMM Panel Script', '', 'INR', 1, 1, '2024-07-07 11:02:05', 'assets/img/panel/22ab0e4326f1e9096ffc3217cd20a17829a5c486.png', 'en', 'Simplify', 'Grapes', '1', '', '', '', '', '1', '2', '1', '2', 0, 0, '', '', '', '465', 'ssl', '2', '2', '1', '2', '1', '1', 'bizimsms', '', '', '', '1', 'ownsmmpanel@gmail.com', '', '2', '1', '2', '2', 'asc', 10, 1000, 10000, 100000, '{\"ns1\":\"ns1.ownwebhost.in\",\"ns2\":\"ns2.ownwebhost.in\"}', 499, '', '', '1', 10, 100, '2', '2', 2, '2', '2', '0', '1', '1', '1', '1', '1', 0, '2', '2', 2, '0', '3', '{\"admin access\":{\"admin_access\":{\"name\":\"Admin Access\",\"value\":\"admin_access\"}},\"pages\":{\"users\":{\"name\":\"Users\",\"value\":\"users\"},\"services\":{\"name\":\"Services\",\"value\":\"services\"},\"update-prices\":{\"name\":\"Update Prices\",\"value\":\"update-prices\"},\"bulk\":{\"name\":\"Bulk Services Editor\",\"value\":\"bulk\"},\"bulkc\":{\"name\":\"Bulk Category Editor\",\"value\":\"services\"},\"synced-logs\":{\"name\":\"Seller Sync Logs\",\"value\":\"synced-logs\"},\"orders\":{\"name\":\"Orders\",\"value\":\"orders\"},\"subscriptions\":{\"name\":\"Subscriptions\",\"value\":\"subscriptions\"},\"dripfeed\":{\"name\":\"Dripfeed\",\"value\":\"dripfeed\"},\"tasks\":{\"name\":\"Order Refill and Cancel Tasks\",\"value\":\"tasks\"},\"payments\":{\"name\":\"Payments\",\"value\":\"payments\"},\"tickets\":{\"name\":\"Tickets\",\"value\":\"tickets\"}},\"additionals\":{\"additionals\":{\"name\":\"Additionals\",\"value\":\"additionals\"},\"referral\":{\"name\":\"Affiliates\",\"value\":\"referral\"},\"broadcast\":{\"name\":\"Broadcasts\",\"value\":\"broadcast\"},\"logs\":{\"name\":\"Panel Logs\",\"value\":\"logs\"},\"reports\":{\"name\":\"Reports\",\"value\":\"reports\"},\"videop\":{\"name\":\"Promotion\",\"value\":\"videop\"},\"coupon\":{\"name\":\"Coupons\",\"value\":\"coupon\"},\"child-panels\":{\"name\":\"Child Panels\",\"value\":\"child-panels\"},\"updates\":{\"name\":\"Updates\",\"value\":\"updates\"}},\"appearance\":{\"appearance\":{\"name\":\"Appearance\",\"value\":\"appearance\"},\"themes\":{\"name\":\"Themes\",\"value\":\"themes\"},\"new_year\":{\"name\":\"New Year\",\"value\":\"new_year\"},\"pages\":{\"name\":\"Pages\",\"value\":\"pages\"},\"news\":{\"name\":\"Announcements\",\"value\":\"news\"},\"meta\":{\"name\":\"Meta (SEO) Settings\",\"value\":\"meta\"},\"blog\":{\"name\":\"Blogs\",\"value\":\"blog\"},\"menu\":{\"name\":\"Menu\",\"value\":\"menu\"},\"inte\":{\"name\":\"Integrations\",\"value\":\"inte\"},\"language\":{\"name\":\"Languages\",\"value\":\"language\"},\"files\":{\"name\":\"Uploaded Images\",\"value\":\"files\"}},\"settings\":{\"settings\":{\"name\":\"Settings\",\"value\":\"settings\"},\"general_settings\":{\"name\":\"General Settings\",\"value\":\"general_settings\"},\"providers\":{\"name\":\"Sellers\",\"value\":\"providers\"},\"payments_settings\":{\"name\":\"Payment Methods\",\"value\":\"payments_settings\"},\"bank_accounts\":{\"name\":\"Bank Accounts\",\"value\":\"bank_accounts\"},\"modules\":{\"name\":\"Modules\",\"value\":\"modules\"},\"subject\":{\"name\":\"Support Settings\",\"value\":\"subject\"},\"payments_bonus\":{\"name\":\"Payment Bonuses\",\"value\":\"payments_bonus\"},\"currency-manager\":{\"name\":\"Site Currency Manager\",\"value\":\"currency-manager\"},\"alert_settings\":{\"name\":\"Notification Settings\",\"value\":\"alert_settings\"},\"site_count\":{\"name\":\"Fake Orders\",\"value\":\"site_count\"},\"manager\":{\"name\":\"Manager\",\"value\":\"manager\"}}}', 0, 1, 3, 1, '{\"panel_orders_prefix\":\"\",\"panel_orders_suffix\":\"\"}', 1, 'theme_colour', '{\"purchased\":\"1\",\"status\":\"1\"}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sync_logs`
--

CREATE TABLE `sync_logs` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `action` varchar(225) NOT NULL,
  `date` datetime NOT NULL,
  `description` varchar(225) NOT NULL,
  `api_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `task_id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `task_api` int(11) DEFAULT NULL,
  `task_type` varchar(225) DEFAULT NULL,
  `task_status` varchar(225) DEFAULT 'pending',
  `task_response` text DEFAULT NULL,
  `task_created_at` datetime DEFAULT NULL,
  `task_updated_at` datetime DEFAULT NULL,
  `task_by` text DEFAULT NULL,
  `check_refill_status` int(11) DEFAULT NULL,
  `refill_orderid` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` int(11) NOT NULL,
  `theme_name` text NOT NULL,
  `theme_dirname` text NOT NULL,
  `theme_extras` text NOT NULL,
  `last_modified` datetime NOT NULL,
  `newpage` text NOT NULL,
  `colour` enum('1','2') NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `theme_name`, `theme_dirname`, `theme_extras`, `last_modified`, `newpage`, `colour`) VALUES
(1, 'QuickPanel', 'Simplify', '{\"stylesheets\":[\"assets/public/Simplify/bootstrap.css\",\"assets/public/Simplify/red.css\"]}', '2024-07-06 03:16:55', '{% include \'header.twig\' %}\r\n	<br><br><br>\r\n	\r\n	<div class=\"container-fluid container-fluid-spacious\">\r\n		<div class=\"row\">\r\n			<div class=\"col-md-12\">\r\n			{% if contentText %}\r\n{{ contentText }}\r\n{% endif %}\r\n				{% if contentText2 %}\r\n{{ contentText2 }}\r\n{% endif %}\r\n				\r\n			</div>\r\n		</div>\r\n	</div>\r\n   \r\n      \r\n        \r\n   ', '2');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `subject` varchar(225) NOT NULL,
  `time` datetime NOT NULL,
  `lastupdate_time` datetime NOT NULL,
  `client_new` enum('1','2') NOT NULL DEFAULT '2',
  `status` enum('pending','answered','closed') NOT NULL DEFAULT 'pending',
  `support_new` enum('1','2') NOT NULL DEFAULT '1',
  `canmessage` enum('1','2') NOT NULL DEFAULT '2'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_reply`
--

CREATE TABLE `ticket_reply` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `support` enum('1','2') NOT NULL DEFAULT '1',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `readed` enum('1','2') NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_subjects`
--

CREATE TABLE `ticket_subjects` (
  `subject_id` int(11) NOT NULL,
  `subject` varchar(225) NOT NULL,
  `content` text DEFAULT NULL,
  `auto_reply` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ticket_subjects`
--

INSERT INTO `ticket_subjects` (`subject_id`, `subject`, `content`, `auto_reply`) VALUES
(1, 'Order', '', '0'),
(2, 'Payment', '', '0'),
(4, 'Complaint & Suggestion', '', '0'),
(6, 'Others', '', '0');

-- --------------------------------------------------------

--
-- Table structure for table `units_per_page`
--

CREATE TABLE `units_per_page` (
  `id` int(11) NOT NULL,
  `unit` int(11) NOT NULL,
  `page` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `units_per_page`
--

INSERT INTO `units_per_page` (`id`, `unit`, `page`) VALUES
(1, 50, 'clients'),
(2, 50, 'orders'),
(3, 50, 'payments'),
(4, 50, 'refill'),
(5, 50, 'bulk'),
(6, 8, 'services');

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `u_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `action` varchar(225) NOT NULL,
  `date` datetime NOT NULL,
  `description` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'Not enough data'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `admin_constants`
--
ALTER TABLE `admin_constants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bulkedit`
--
ALTER TABLE `bulkedit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `childpanels`
--
ALTER TABLE `childpanels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `clients_category`
--
ALTER TABLE `clients_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients_price`
--
ALTER TABLE `clients_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients_service`
--
ALTER TABLE `clients_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_report`
--
ALTER TABLE `client_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `decoration`
--
ALTER TABLE `decoration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `earn`
--
ALTER TABLE `earn`
  ADD PRIMARY KEY (`earn_id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `General_options`
--
ALTER TABLE `General_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `integrations`
--
ALTER TABLE `integrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kuponlar`
--
ALTER TABLE `kuponlar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kupon_kullananlar`
--
ALTER TABLE `kupon_kullananlar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Mailforms`
--
ALTER TABLE `Mailforms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications_popup`
--
ALTER TABLE `notifications_popup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `panel_categories`
--
ALTER TABLE `panel_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `panel_info`
--
ALTER TABLE `panel_info`
  ADD PRIMARY KEY (`panel_id`);

--
-- Indexes for table `paymentmethods`
--
ALTER TABLE `paymentmethods`
  ADD PRIMARY KEY (`methodId`),
  ADD KEY `methodId` (`methodId`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `referral`
--
ALTER TABLE `referral`
  ADD PRIMARY KEY (`referral_id`);

--
-- Indexes for table `referral_payouts`
--
ALTER TABLE `referral_payouts`
  ADD PRIMARY KEY (`r_p_id`);

--
-- Indexes for table `serviceapi_alert`
--
ALTER TABLE `serviceapi_alert`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `service_api`
--
ALTER TABLE `service_api`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sync_logs`
--
ALTER TABLE `sync_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Indexes for table `ticket_reply`
--
ALTER TABLE `ticket_reply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_subjects`
--
ALTER TABLE `ticket_subjects`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `units_per_page`
--
ALTER TABLE `units_per_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`u_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bulkedit`
--
ALTER TABLE `bulkedit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `childpanels`
--
ALTER TABLE `childpanels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients_category`
--
ALTER TABLE `clients_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients_price`
--
ALTER TABLE `clients_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients_service`
--
ALTER TABLE `clients_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_report`
--
ALTER TABLE `client_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT for table `earn`
--
ALTER TABLE `earn`
  MODIFY `earn_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `General_options`
--
ALTER TABLE `General_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `integrations`
--
ALTER TABLE `integrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `kuponlar`
--
ALTER TABLE `kuponlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kupon_kullananlar`
--
ALTER TABLE `kupon_kullananlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Mailforms`
--
ALTER TABLE `Mailforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications_popup`
--
ALTER TABLE `notifications_popup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=913;

--
-- AUTO_INCREMENT for table `panel_categories`
--
ALTER TABLE `panel_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `panel_info`
--
ALTER TABLE `panel_info`
  MODIFY `panel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `paymentmethods`
--
ALTER TABLE `paymentmethods`
  MODIFY `methodId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referral`
--
ALTER TABLE `referral`
  MODIFY `referral_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referral_payouts`
--
ALTER TABLE `referral_payouts`
  MODIFY `r_p_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `serviceapi_alert`
--
ALTER TABLE `serviceapi_alert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53367;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_api`
--
ALTER TABLE `service_api`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sync_logs`
--
ALTER TABLE `sync_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_reply`
--
ALTER TABLE `ticket_reply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_subjects`
--
ALTER TABLE `ticket_subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `units_per_page`
--
ALTER TABLE `units_per_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
