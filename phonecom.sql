-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 24, 2022 at 07:04 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phonecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

DROP TABLE IF EXISTS `agents`;
CREATE TABLE IF NOT EXISTS `agents` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `agent_banks`
--

DROP TABLE IF EXISTS `agent_banks`;
CREATE TABLE IF NOT EXISTS `agent_banks` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) NOT NULL,
  `accountName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bankName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accountNumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `agent_histories`
--

DROP TABLE IF EXISTS `agent_histories`;
CREATE TABLE IF NOT EXISTS `agent_histories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cleared` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `agent_orders`
--

DROP TABLE IF EXISTS `agent_orders`;
CREATE TABLE IF NOT EXISTS `agent_orders` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `profit` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `agent_wallets`
--

DROP TABLE IF EXISTS `agent_wallets`;
CREATE TABLE IF NOT EXISTS `agent_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

DROP TABLE IF EXISTS `banks`;
CREATE TABLE IF NOT EXISTS `banks` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `name`, `created_at`, `updated_at`) VALUES
(10, 'Access Bank Plc', '2020-06-03 08:31:32', '2020-06-03 08:31:32'),
(11, 'Citibank Nigeria Limited', '2020-06-03 08:31:32', '2020-06-03 08:31:32'),
(12, 'Ecobank Nigeria Plc', '2020-06-03 08:31:32', '2020-06-03 08:31:32'),
(13, 'Fidelity Bank Plc', '2020-06-03 08:31:32', '2020-06-03 08:31:32'),
(14, 'First City Monument Bank Plc', '2020-06-03 08:31:32', '2020-06-03 08:31:32'),
(15, 'Guaranty Trust Bank Plc', '2020-06-03 08:31:32', '2020-06-03 08:31:32'),
(16, 'Key Stone Bank', '2020-06-03 08:31:32', '2020-06-03 08:31:32'),
(17, 'Polaris Bank', '2020-06-03 08:31:32', '2020-06-03 08:31:32'),
(18, 'Stanbic IBTC Bank Ltd', '2020-06-03 08:31:32', '2020-06-03 08:31:32'),
(19, 'Standard Chartered Bank Nigeria Ltd', '2020-06-03 08:31:32', '2020-06-03 08:31:32'),
(20, 'Sterling Bank Plc', '2020-06-03 08:31:32', '2020-06-03 08:31:32'),
(21, 'SunTrust Bank Nigeria Limited', '2020-06-03 08:31:32', '2020-06-03 08:31:32'),
(22, 'Union Bank of Nigeria Plc', '2020-06-03 08:31:32', '2020-06-03 08:31:32'),
(23, 'United Bank For Africa Plc', '2020-06-03 08:31:32', '2020-06-03 08:31:32'),
(24, 'Unity  Bank Plc', '2020-06-03 08:31:32', '2020-06-03 08:31:32'),
(25, 'Wema Bank Plc', '2020-06-03 08:31:32', '2020-06-03 08:31:32'),
(26, 'Zenith Bank Plc', '2020-06-03 08:31:32', '2020-06-03 08:31:32'),
(27, 'FIRST BANK NIGERIA LIMITED', '2020-06-03 08:31:32', '2020-06-03 08:31:32'),
(28, 'Providus Bank', '2020-06-03 08:31:32', '2020-06-03 08:31:32'),
(29, 'Titan Trust Bank Ltd', '2020-06-03 08:31:32', '2020-06-03 08:31:32'),
(30, 'Globus Bank Limited', '2020-06-03 08:31:32', '2020-06-03 08:31:32'),
(31, 'Heritage Banking Company Ltd', '2020-06-03 08:35:08', '2020-06-03 08:35:08');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
CREATE TABLE IF NOT EXISTS `banners` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `routes` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `image`, `routes`, `created_at`, `updated_at`) VALUES
(3, 'Electronics', 'banners\\February2022\\LZCilha0Z4jQsyJhU4Y8.jpg', '#', '2022-02-28 09:25:03', '2022-02-28 08:25:03'),
(4, 'Mobile Phones', 'banners\\February2022\\NZqM3pEGlWXcskksmI9x.png', '#', '2022-02-28 09:24:41', '2022-02-28 08:24:41'),
(8, 'Mobile Phones', 'banners\\February2022\\z6AkmbpITrzCgXtjYFvZ.jpg', '#', '2022-02-28 09:24:17', '2022-02-28 08:24:17');

-- --------------------------------------------------------

--
-- Table structure for table `blogcomments`
--

DROP TABLE IF EXISTS `blogcomments`;
CREATE TABLE IF NOT EXISTS `blogcomments` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
CREATE TABLE IF NOT EXISTS `brands` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2019-05-01 23:21:43', '2019-05-01 23:21:43'),
(2, NULL, 1, 'Category 2', 'category-2', '2019-05-01 23:21:43', '2019-05-01 23:21:43');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `icon` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_name_unique` (`name`),
  UNIQUE KEY `category_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `slug`, `image`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'Mobile Phones', 'mobile-phones', 'category\\February2022\\p7FsrsHMWOuINm5S2GM3.jpg', 'phone', '2022-02-27 18:19:16', '2022-02-27 18:19:16'),
(2, 'Tablets', 'tablets', 'category\\February2022\\l67nxuRcCbJzP05wNBzG.jpg', 'phone', '2022-02-27 18:19:43', '2022-02-27 18:19:43'),
(3, 'Mobile Accessories', 'mobile-accessories', 'category\\February2022\\LYY07lqlDGfEbJ1ysgBs.jpg', 'phone', '2022-02-27 18:20:24', '2022-02-27 18:20:24');

-- --------------------------------------------------------

--
-- Table structure for table `category_product`
--

DROP TABLE IF EXISTS `category_product`;
CREATE TABLE IF NOT EXISTS `category_product` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `categorySub_id` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_product_product_id_foreign` (`product_id`),
  KEY `category_product_category_id_foreign` (`category_id`),
  KEY `category_product_categorysub_id_foreign` (`categorySub_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category_product`
--

INSERT INTO `category_product` (`id`, `product_id`, `category_id`, `created_at`, `updated_at`, `categorySub_id`) VALUES
(1, 1, 1, '2022-02-28 08:05:40', '2022-02-28 08:05:40', 1),
(2, 2, 1, '2022-02-28 08:06:54', '2022-02-28 08:06:54', 1),
(3, 2, 1, '2022-02-28 08:06:54', '2022-02-28 08:06:54', 2),
(4, 2, 1, '2022-02-28 08:06:54', '2022-02-28 08:06:54', 3),
(5, 3, 1, '2022-02-28 08:09:26', '2022-02-28 08:09:26', 1),
(6, 3, 1, '2022-02-28 08:09:26', '2022-02-28 08:09:26', 4),
(7, 3, 1, '2022-02-28 08:09:26', '2022-02-28 08:09:26', 5),
(8, 3, 1, '2022-02-28 08:09:26', '2022-02-28 08:09:26', 6),
(9, 3, 2, '2022-02-28 08:09:26', '2022-02-28 08:09:26', 1),
(10, 3, 2, '2022-02-28 08:09:26', '2022-02-28 08:09:26', 4),
(11, 3, 2, '2022-02-28 08:09:26', '2022-02-28 08:09:26', 5),
(12, 3, 2, '2022-02-28 08:09:26', '2022-02-28 08:09:26', 6),
(13, 4, 2, '2022-02-28 08:10:38', '2022-02-28 08:10:38', 4),
(14, 4, 2, '2022-02-28 08:10:38', '2022-02-28 08:10:38', 6),
(28, 6, 1, '2022-03-17 17:58:40', '2022-03-17 17:58:40', 1),
(32, 11, 1, '2022-03-17 18:00:57', '2022-03-17 18:00:57', 1),
(33, 11, 1, '2022-03-17 18:00:57', '2022-03-17 18:00:57', 2),
(34, 10, 1, '2022-03-17 18:01:05', '2022-03-17 18:01:05', 1),
(35, 10, 1, '2022-03-17 18:01:05', '2022-03-17 18:01:05', 3),
(36, 9, 1, '2022-03-17 18:01:20', '2022-03-17 18:01:20', 1),
(37, 9, 1, '2022-03-17 18:01:20', '2022-03-17 18:01:20', 2),
(38, 8, 1, '2022-03-17 18:01:36', '2022-03-17 18:01:36', 1),
(39, 7, 1, '2022-03-17 18:01:47', '2022-03-17 18:01:47', 1),
(40, 5, 1, '2022-03-17 18:02:02', '2022-03-17 18:02:02', 1),
(41, 5, 1, '2022-03-17 18:02:02', '2022-03-17 18:02:02', 2),
(44, 12, 1, '2022-03-24 10:56:44', '2022-03-24 10:56:44', 1),
(45, 12, 1, '2022-03-24 10:56:44', '2022-03-24 10:56:44', 2);

-- --------------------------------------------------------

--
-- Table structure for table `category_subs`
--

DROP TABLE IF EXISTS `category_subs`;
CREATE TABLE IF NOT EXISTS `category_subs` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_subs_category_id_foreign` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category_subs`
--

INSERT INTO `category_subs` (`id`, `category_id`, `created_at`, `updated_at`, `name`) VALUES
(1, 1, '2022-02-27 18:21:44', '2022-02-27 18:21:44', 'Smart phones'),
(2, 1, '2022-02-27 18:22:00', '2022-02-27 18:22:00', 'Basic Phones'),
(3, 1, '2022-02-27 18:22:38', '2022-02-27 18:22:38', 'Refurbished Phones'),
(4, 2, '2022-02-27 18:22:57', '2022-02-27 18:22:57', 'iPads'),
(5, 2, '2022-02-27 18:23:13', '2022-02-27 18:23:13', 'Android Tablets'),
(6, 2, '2022-02-27 18:23:28', '2022-02-27 18:23:28', 'Educational Tablets'),
(7, 3, '2022-02-27 18:23:51', '2022-02-27 18:23:51', 'Battery'),
(8, 3, '2022-02-27 18:24:04', '2022-02-27 18:24:04', 'Cables'),
(9, 3, '2022-02-27 18:24:44', '2022-02-27 18:24:44', 'Screen Guard'),
(10, 3, '2022-02-27 18:25:36', '2022-02-27 18:25:36', 'Earphones & Headsets'),
(11, 3, '2022-03-24 10:58:56', '2022-03-24 11:00:49', 'Fake phones');

-- --------------------------------------------------------

--
-- Table structure for table `category_sub_product`
--

DROP TABLE IF EXISTS `category_sub_product`;
CREATE TABLE IF NOT EXISTS `category_sub_product` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_sub_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category_sub_product`
--

INSERT INTO `category_sub_product` (`id`, `category_sub_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2022-02-28 08:05:40', '2022-02-28 08:05:40'),
(2, 1, 2, '2022-02-28 08:06:54', '2022-02-28 08:06:54'),
(3, 2, 2, '2022-02-28 08:06:54', '2022-02-28 08:06:54'),
(4, 3, 2, '2022-02-28 08:06:54', '2022-02-28 08:06:54'),
(5, 1, 3, '2022-02-28 08:09:26', '2022-02-28 08:09:26'),
(6, 4, 3, '2022-02-28 08:09:26', '2022-02-28 08:09:26'),
(7, 5, 3, '2022-02-28 08:09:26', '2022-02-28 08:09:26'),
(8, 6, 3, '2022-02-28 08:09:26', '2022-02-28 08:09:26'),
(9, 4, 4, '2022-02-28 08:10:38', '2022-02-28 08:10:38'),
(10, 6, 4, '2022-02-28 08:10:38', '2022-02-28 08:10:38'),
(22, 1, 6, '2022-03-17 17:58:40', '2022-03-17 17:58:40'),
(26, 1, 11, '2022-03-17 18:00:57', '2022-03-17 18:00:57'),
(27, 2, 11, '2022-03-17 18:00:57', '2022-03-17 18:00:57'),
(28, 1, 10, '2022-03-17 18:01:05', '2022-03-17 18:01:05'),
(29, 3, 10, '2022-03-17 18:01:05', '2022-03-17 18:01:05'),
(30, 1, 9, '2022-03-17 18:01:20', '2022-03-17 18:01:20'),
(31, 2, 9, '2022-03-17 18:01:20', '2022-03-17 18:01:20'),
(32, 1, 8, '2022-03-17 18:01:36', '2022-03-17 18:01:36'),
(33, 1, 7, '2022-03-17 18:01:47', '2022-03-17 18:01:47'),
(34, 1, 5, '2022-03-17 18:02:02', '2022-03-17 18:02:02'),
(35, 2, 5, '2022-03-17 18:02:02', '2022-03-17 18:02:02'),
(38, 1, 12, '2022-03-24 10:56:44', '2022-03-24 10:56:44'),
(39, 2, 12, '2022-03-24 10:56:44', '2022-03-24 10:56:44');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `body` mediumtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `body`, `created_at`, `updated_at`) VALUES
(1, 'Chisom Onyemelukwe', 'chisomnzube@gmail.com', '7403138279', 'I want my order to be cancelled my order ID is #zs5', '2022-03-24 10:33:45', '2022-03-24 10:33:45'),
(2, 'Chisom Onyemelukwe', 'chisomnzube@gmail.com', '7403138279', 'hehehheh', '2022-03-24 10:34:23', '2022-03-24 10:34:23');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
CREATE TABLE IF NOT EXISTS `coupons` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `value` int(11) DEFAULT NULL,
  `percent_off` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupons_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `percent_off`, `created_at`, `updated_at`) VALUES
(1, 'jumianig', 'fixed', 2000, NULL, '2022-03-17 19:22:57', '2022-03-17 19:22:57');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 7, 'id', 'hidden', 'Id', 1, 1, 1, 1, 1, 1, '{}', 1),
(57, 7, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(58, 7, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:products,slug\"}}', 3),
(59, 7, 'details', 'text', 'Details', 0, 1, 1, 1, 1, 1, '{}', 4),
(60, 7, 'price', 'number', 'Price', 1, 1, 1, 1, 1, 1, '{}', 5),
(61, 7, 'description', 'rich_text_box', 'Description', 1, 1, 1, 1, 1, 1, '{}', 6),
(62, 7, 'keywords', 'text_area', 'Keywords', 1, 1, 1, 1, 1, 1, '{}', 7),
(64, 7, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, '{\"on\":\"Yes\",\"off\":\"No\"}', 9),
(65, 7, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"680\",\"height\":\"680\"}}', 10),
(66, 7, 'images', 'multiple_images', 'Images', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"680\",\"height\":\"680\"}}', 11),
(67, 7, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 12),
(68, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 13),
(69, 8, 'id', 'hidden', 'Id', 1, 1, 1, 1, 1, 1, '{}', 1),
(70, 8, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(71, 8, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:category,slug\"}}', 3),
(72, 8, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 4),
(73, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(79, 10, 'id', 'hidden', 'Id', 1, 1, 1, 1, 1, 1, '{}', 1),
(80, 10, 'code', 'text', 'Code', 1, 1, 1, 1, 1, 1, '{}', 2),
(81, 10, 'type', 'select_dropdown', 'Type', 1, 1, 1, 1, 1, 1, '{\"default\":\"fixed\",\"options\":{\"fixed\":\"Fixed\",\"percent\":\"Percent_off\"}}', 3),
(82, 10, 'value', 'text', 'Value', 0, 1, 1, 1, 1, 1, '{\"null\":\"\"}', 4),
(83, 10, 'percent_off', 'number', 'Percent Off', 0, 1, 1, 1, 1, 1, '{\"null\":\"\"}', 5),
(84, 10, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 6),
(85, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(86, 11, 'id', 'hidden', 'Id', 1, 1, 1, 1, 1, 1, '{}', 1),
(87, 11, 'user_id', 'text', 'User Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(88, 11, 'billing_email', 'text', 'Billing Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(89, 11, 'billing_name', 'text', 'Billing Name', 1, 1, 1, 1, 1, 1, '{}', 4),
(90, 11, 'billing_address', 'text', 'Billing Address', 1, 1, 1, 1, 1, 1, '{}', 5),
(91, 11, 'billing_phone', 'text', 'Billing Phone', 1, 1, 1, 1, 1, 1, '{}', 6),
(92, 11, 'delivery_fee', 'text', 'Delivery Fee', 1, 1, 1, 1, 1, 1, '{}', 7),
(93, 11, 'billing_discount', 'number', 'Billing Discount', 1, 1, 1, 1, 1, 1, '{}', 8),
(94, 11, 'billing_discount_code', 'text', 'Billing Discount Code', 0, 1, 1, 1, 1, 1, '{}', 9),
(95, 11, 'billing_subtotal', 'number', 'Billing Subtotal', 1, 1, 1, 1, 1, 1, '{}', 10),
(96, 11, 'billing_total', 'number', 'Billing Total', 1, 1, 1, 1, 1, 1, '{}', 11),
(97, 11, 'payment_gateway', 'text', 'Payment Gateway', 1, 1, 1, 1, 1, 1, '{}', 12),
(98, 11, 'shipped', 'checkbox', 'Shipped', 1, 1, 1, 1, 1, 1, '{\"on\":\"Yes\",\"off\":\"No\"}', 13),
(99, 11, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 14),
(100, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 15),
(101, 7, 'quantity', 'number', 'Quantity', 1, 1, 1, 1, 1, 1, '{}', 10),
(102, 12, 'id', 'hidden', 'Id', 1, 1, 1, 1, 1, 0, '{}', 1),
(103, 12, 'category_id', 'hidden', 'Category Id', 0, 1, 1, 1, 1, 0, '{}', 2),
(104, 12, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
(105, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(106, 12, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 5),
(107, 1, 'lname', 'text', 'Lname', 1, 1, 1, 1, 1, 1, '{}', 4),
(108, 1, 'phone', 'number', 'Phone', 1, 1, 1, 1, 1, 1, '{}', 6),
(109, 1, 'address', 'text', 'Address', 1, 1, 1, 1, 1, 1, '{}', 7),
(111, 13, 'id', 'hidden', 'Id', 1, 1, 1, 1, 1, 1, '{}', 1),
(112, 13, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 2),
(113, 13, 'review', 'rich_text_box', 'Review', 1, 1, 1, 1, 1, 1, '{}', 3),
(114, 13, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, '{\"on\":\"Yes\",\"off\":\"No\"}', 4),
(115, 13, 'user_name', 'text', 'User Name', 1, 1, 1, 1, 1, 1, '{}', 5),
(116, 13, 'product_id', 'number', 'Product Id', 1, 1, 1, 1, 1, 1, '{}', 6),
(117, 13, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 7),
(118, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(119, 14, 'id', 'hidden', 'Id', 1, 1, 1, 1, 1, 1, '{}', 1),
(120, 14, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 2),
(121, 14, 'image', 'image', 'Image', 1, 1, 1, 1, 1, 1, '{}', 3),
(122, 14, 'routes', 'text', 'Routes', 1, 1, 1, 1, 1, 1, '{}', 4),
(123, 14, 'created_at', 'timestamp', 'Created At', 1, 0, 0, 0, 0, 0, '{}', 5),
(124, 14, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 6),
(140, 17, 'id', 'hidden', 'Id', 1, 1, 1, 1, 1, 1, '{}', 1),
(141, 17, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(142, 17, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(143, 17, 'phone', 'text', 'Phone', 1, 1, 1, 1, 1, 1, '{}', 4),
(144, 17, 'body', 'rich_text_box', 'Body', 1, 1, 1, 1, 1, 1, '{}', 5),
(145, 17, 'created_at', 'timestamp', 'Created At', 1, 0, 0, 0, 0, 0, '{}', 6),
(146, 17, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 7),
(155, 8, 'image', 'image', 'Image', 1, 1, 1, 1, 1, 1, '{}', 4),
(156, 8, 'icon', 'text', 'Icon', 1, 1, 1, 1, 1, 1, '{}', 5),
(157, 7, 'delivery_info', 'text', 'Delivery Info', 1, 1, 1, 1, 1, 1, '{\"description\":\"This item Will be delivered In the next 48 Hours (Two days) Only Available to people in Awka\"}', 14),
(201, 7, 'boosted', 'checkbox', 'Boosted', 1, 1, 1, 1, 1, 1, '{\"on\":\"Yes\",\"off\":\"No\"}', 15),
(203, 25, 'id', 'hidden', 'Id', 1, 1, 1, 1, 1, 0, '{}', 1),
(204, 25, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 2),
(205, 25, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 3),
(206, 26, 'id', 'hidden', 'Id', 1, 1, 1, 1, 1, 0, '{}', 1),
(207, 26, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 2),
(208, 26, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 3),
(209, 26, 'invoice_id', 'text', 'Invoice Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(210, 26, 'user_name', 'text', 'User Name', 1, 1, 1, 1, 1, 1, '{}', 3),
(211, 26, 'product_id', 'text', 'Product Id', 1, 1, 1, 1, 1, 1, '{}', 4),
(212, 26, 'product_qty', 'text', 'Product Qty', 1, 1, 1, 1, 1, 1, '{}', 5),
(213, 26, 'status', 'text', 'Status', 1, 1, 1, 1, 1, 1, '{}', 6);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `display_name_singular` varchar(255) NOT NULL,
  `display_name_plural` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `policy_name` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2019-05-01 23:21:36', '2019-07-11 00:51:00'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2019-05-01 23:21:36', '2019-05-01 23:21:36'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2019-05-01 23:21:36', '2019-05-01 23:21:36'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2019-05-01 23:21:42', '2019-05-01 23:21:42'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2019-05-01 23:21:44', '2019-05-01 23:21:44'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2019-05-01 23:21:45', '2019-05-01 23:21:45'),
(7, 'products', 'products', 'Product', 'Products', 'voyager-bag', 'App\\Product', NULL, '\\App\\Http\\Controllers\\Voyager\\ProductsController', NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-05-01 23:25:54', '2022-02-28 08:01:47'),
(8, 'category', 'category', 'Category', 'Categories', 'voyager-categories', 'App\\Category', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-05-01 23:26:53', '2019-07-12 02:31:11'),
(10, 'coupons', 'coupons', 'Coupon', 'Coupons', 'voyager-dollar', 'App\\Coupon', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-05-01 23:30:51', '2019-05-01 23:30:51'),
(11, 'orders', 'orders', 'Order', 'Orders', 'voyager-documentation', 'App\\Order', NULL, '\\App\\Http\\Controllers\\Voyager\\OrdersController', NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-05-09 07:44:55', '2020-06-20 23:44:10'),
(12, 'category_subs', 'category-subs', 'Category Sub', 'Category Subs', 'voyager-window-list', 'App\\CategorySub', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-06-08 10:47:41', '2022-02-21 16:09:43'),
(13, 'reviews', 'reviews', 'Review', 'Reviews', 'voyager-bubble', 'App\\Review', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-06-19 23:02:03', '2019-06-19 23:02:03'),
(14, 'banners', 'banners', 'Banner', 'Banners', 'voyager-photos', 'App\\Banner', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-06-20 14:23:55', '2019-06-20 14:23:55'),
(17, 'contacts', 'contacts', 'Contact', 'Contacts', 'voyager-telephone', 'App\\Contact', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-07-09 10:34:02', '2019-09-30 13:29:07'),
(25, 'inventories', 'inventories', 'Inventory', 'Inventories', 'voyager-logbook', 'App\\Inventory', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-01-20 15:36:36', '2022-01-20 15:36:36'),
(26, 'invoices', 'invoices', 'Invoice', 'Invoices', 'voyager-receipt', 'App\\Invoice', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-01-20 15:48:41', '2022-01-21 12:13:05');

-- --------------------------------------------------------

--
-- Table structure for table `inventories`
--

DROP TABLE IF EXISTS `inventories`;
CREATE TABLE IF NOT EXISTS `inventories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `invoice_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_qty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'success',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_id`, `user_name`, `product_id`, `product_qty`, `status`, `created_at`, `updated_at`) VALUES
(1, '7660376212', 'Chisom Onyemelukwe', '77', '3', 'success', '2022-01-21 10:08:21', '2022-01-21 10:08:21'),
(2, '7660376212', 'Chisom Onyemelukwe', '72', '1', 'success', '2022-01-21 10:08:21', '2022-01-21 10:08:21'),
(3, '7660376212', 'Chisom Onyemelukwe', '74', '2', 'success', '2022-01-21 10:08:21', '2022-01-21 10:08:21'),
(4, '21361738', 'Chisom Onyemelukwe', '77', '3', 'success', '2022-01-21 10:08:56', '2022-01-21 10:08:56'),
(5, '21361738', 'Chisom Onyemelukwe', '72', '1', 'success', '2022-01-21 10:08:56', '2022-01-21 10:08:56'),
(6, '21361738', 'Chisom Onyemelukwe', '74', '2', 'success', '2022-01-21 10:08:56', '2022-01-21 10:08:56'),
(7, '97', 'Chisom Onyemelukwe', '77', '3', 'success', '2022-01-21 10:10:49', '2022-01-21 10:10:49'),
(8, '97', 'Chisom Onyemelukwe', '72', '1', 'success', '2022-01-21 10:10:49', '2022-01-21 10:10:49'),
(9, '97', 'Chisom Onyemelukwe', '74', '2', 'success', '2022-01-21 10:10:49', '2022-01-21 10:10:49'),
(10, '68', 'Chisom Onyemelukwe', '77', '3', 'success', '2022-01-21 10:11:28', '2022-01-21 10:11:28'),
(11, '68', 'Chisom Onyemelukwe', '72', '1', 'success', '2022-01-21 10:11:28', '2022-01-21 10:11:28'),
(12, '68', 'Chisom Onyemelukwe', '74', '2', 'success', '2022-01-21 10:11:28', '2022-01-21 10:11:28'),
(13, '9091853042', 'Chisom Onyemelukwe', '77', '3', 'success', '2022-01-21 10:12:10', '2022-01-21 10:12:10'),
(14, '9091853042', 'Chisom Onyemelukwe', '72', '1', 'success', '2022-01-21 10:12:10', '2022-01-21 10:12:10'),
(15, '9091853042', 'Chisom Onyemelukwe', '74', '2', 'success', '2022-01-21 10:12:10', '2022-01-21 10:12:10'),
(16, '2640550841', 'Chisom Onyemelukwe', '1444', '5', 'success', '2022-01-21 11:14:21', '2022-01-21 11:14:21'),
(17, '2640550841', 'Chisom Onyemelukwe', '590', '3', 'success', '2022-01-21 11:14:21', '2022-01-21 11:14:21'),
(18, '1495475359', 'Ebube ebuka', '599', '1', 'success', '2022-01-21 12:28:53', '2022-01-21 12:28:53'),
(19, '2090542532', 'Chisom Onyemelukwe', '599', '1', 'success', '2022-01-21 12:34:20', '2022-01-21 12:34:20'),
(20, '2090542532', 'Chisom Onyemelukwe', '1442', '4', 'success', '2022-01-21 12:34:20', '2022-01-21 12:34:20'),
(21, '1229969237', 'Chisom Onyemelukwe', '1', '1', 'success', '2022-03-24 10:23:37', '2022-03-24 10:23:37'),
(22, '1229969237', 'Chisom Onyemelukwe', '6', '2', 'success', '2022-03-24 10:23:37', '2022-03-24 10:23:37');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{\"displayName\":\"App\\\\Jobs\\\\OrderEmailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\OrderEmailJob\",\"command\":\"O:22:\\\"App\\\\Jobs\\\\OrderEmailJob\\\":8:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:9:\\\"App\\\\Order\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2022-03-21 16:49:12.699877\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1647881352, 1647881351),
(2, 'default', '{\"displayName\":\"App\\\\Jobs\\\\OrderEmailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\OrderEmailJob\",\"command\":\"O:22:\\\"App\\\\Jobs\\\\OrderEmailJob\\\":8:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:9:\\\"App\\\\Order\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2022-03-21 16:53:55.286044\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1647881635, 1647881633),
(3, 'default', '{\"displayName\":\"App\\\\Jobs\\\\OrderEmailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\OrderEmailJob\",\"command\":\"O:22:\\\"App\\\\Jobs\\\\OrderEmailJob\\\":8:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:9:\\\"App\\\\Order\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2022-03-21 18:00:09.158686\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1647885609, 1647885607),
(4, 'default', '{\"displayName\":\"App\\\\Jobs\\\\OrderEmailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\OrderEmailJob\",\"command\":\"O:22:\\\"App\\\\Jobs\\\\OrderEmailJob\\\":8:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:9:\\\"App\\\\Order\\\";s:2:\\\"id\\\";i:5;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2022-03-24 11:18:11.924514\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1648120691, 1648120689);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2019-05-01 23:21:37', '2019-05-01 23:21:37');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `parameters` text,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2019-05-01 23:21:38', '2019-05-01 23:21:38', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 15, '2019-05-01 23:21:38', '2022-01-20 15:49:04', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 10, '2019-05-01 23:21:38', '2022-01-20 15:49:09', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 9, '2019-05-01 23:21:38', '2022-01-20 15:49:09', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 18, '2019-05-01 23:21:38', '2022-01-20 15:49:00', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2019-05-01 23:21:38', '2020-05-01 18:41:52', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2019-05-01 23:21:38', '2020-06-03 07:57:56', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2019-05-01 23:21:38', '2020-06-03 07:57:57', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2019-05-01 23:21:38', '2020-06-03 07:57:57', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 19, '2019-05-01 23:21:38', '2022-01-20 15:49:00', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 17, '2019-05-01 23:21:42', '2022-01-20 15:49:04', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 11, '2019-05-01 23:21:45', '2022-01-20 15:49:04', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 16, '2019-05-01 23:21:46', '2022-01-20 15:49:04', 'voyager.pages.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2019-05-01 23:21:48', '2020-06-03 07:57:57', 'voyager.hooks', NULL),
(15, 1, 'Products', '', '_self', 'voyager-bag', NULL, NULL, 5, '2019-05-01 23:25:55', '2022-01-20 15:49:09', 'voyager.products.index', NULL),
(16, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 6, '2019-05-01 23:26:53', '2022-01-20 15:49:09', 'voyager.category.index', NULL),
(18, 1, 'Coupons', '', '_self', 'voyager-dollar', NULL, NULL, 8, '2019-05-01 23:30:52', '2022-01-20 15:49:09', 'voyager.coupons.index', NULL),
(19, 1, 'Orders', '', '_self', 'voyager-documentation', '#000000', NULL, 2, '2019-05-09 07:44:56', '2022-03-24 11:23:40', 'voyager.orders.index', 'null'),
(20, 1, 'Category Subs', '', '_self', 'voyager-window-list', NULL, NULL, 7, '2019-06-08 10:47:41', '2022-01-20 15:49:09', 'voyager.category-subs.index', NULL),
(21, 1, 'Reviews', '', '_self', 'voyager-bubble', NULL, NULL, 12, '2019-06-19 23:02:04', '2022-01-20 15:49:04', 'voyager.reviews.index', NULL),
(22, 1, 'Banners', '', '_self', 'voyager-photos', NULL, NULL, 13, '2019-06-20 14:23:56', '2022-01-20 15:49:04', 'voyager.banners.index', NULL),
(25, 1, 'Contacts', '', '_self', 'voyager-telephone', '#000000', NULL, 14, '2019-07-09 10:34:03', '2022-01-20 15:49:04', 'voyager.contacts.index', 'null'),
(33, 1, 'Inventories', '', '_self', 'voyager-logbook', NULL, NULL, 3, '2022-01-20 15:36:36', '2022-03-24 11:23:40', 'voyager.inventories.index', NULL),
(34, 1, 'Invoices', '', '_self', 'voyager-receipt', NULL, NULL, 4, '2022-01-20 15:48:41', '2022-03-24 11:23:40', 'voyager.invoices.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_01_01_000000_create_pages_table', 1),
(6, '2016_01_01_000000_create_posts_table', 1),
(7, '2016_02_15_204651_create_categories_table', 1),
(8, '2016_05_19_173453_create_menu_table', 1),
(9, '2016_10_21_190000_create_roles_table', 1),
(10, '2016_10_21_190000_create_settings_table', 1),
(11, '2016_11_30_135954_create_permission_table', 1),
(12, '2016_11_30_141208_create_permission_role_table', 1),
(13, '2016_12_26_201236_data_types__add__server_side', 1),
(14, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(15, '2017_01_14_005015_create_translations_table', 1),
(16, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(17, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(18, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
(19, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(20, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(21, '2017_08_05_000000_add_group_to_settings_table', 1),
(22, '2017_11_26_013050_add_user_role_relationship', 1),
(23, '2017_11_26_015000_create_user_roles_table', 1),
(24, '2018_03_11_000000_add_user_settings', 1),
(25, '2018_03_14_000000_add_details_to_data_types_table', 1),
(26, '2018_03_16_000000_make_settings_value_nullable', 1),
(27, '2019_03_31_013159_create_products_table', 1),
(28, '2019_04_20_162622_create_category_table', 1),
(29, '2019_04_20_163539_create_category_product_table', 1),
(30, '2019_04_21_222541_create_coupons_table', 1),
(31, '2019_04_25_014819_add_image_to_products_table', 1),
(32, '2019_05_01_234355_add_images_to_products_table', 1),
(33, '2019_05_08_212733_create_orders_table', 2),
(34, '2019_05_08_215028_create_order_product_table', 2),
(35, '2019_06_01_050753_add_quantity_to_products_table', 3),
(36, '2019_06_08_113559_create_category_subs_table', 4),
(39, '2019_06_09_181736_add_name_to_category_subs_table', 5),
(40, '2019_06_10_173748_add_delivery_fee_to_products_table', 6),
(41, '2019_06_14_191743_add_category_sub_id_to_category_product_table', 7),
(42, '2019_06_09_222942_create_category_sub_products_table', 8),
(43, '2019_06_19_232847_create_reviews_table', 9),
(44, '2019_06_20_150327_create_banners_table', 10),
(45, '2019_06_23_161704_create_sellers_table', 11),
(46, '2019_06_23_164116_create_seller_products_table', 11),
(47, '2019_07_03_000410_create_referrer_accounts_table', 11),
(48, '2019_07_09_111350_create_contacts_table', 11),
(49, '2019_07_09_115647_create_cash_outs_table', 11),
(50, '2019_07_26_190455_create_blogcomments_table', 12),
(51, '2020_04_29_234554_create_roboturls_table', 12),
(52, '2020_05_01_191048_create_robotproducts_table', 13),
(53, '2020_05_30_182537_create_agents_table', 14),
(54, '2020_06_01_230157_create_agent_orders_table', 15),
(55, '2020_06_01_231801_create_agent_wallets_table', 16),
(56, '2020_06_01_232333_create_agent_histories_table', 17),
(57, '2020_06_03_070811_create_agent_banks_table', 18),
(58, '2020_06_03_081851_create_banks_table', 19),
(59, '2020_06_03_234016_create_ratings_table', 20),
(60, '2020_06_04_235140_create_brands_table', 21),
(61, '2020_06_05_230947_create_jobs_table', 22),
(62, '2022_01_20_163259_create_inventories_table', 23),
(63, '2022_01_20_164701_create_invoices_table', 24),
(64, '2022_01_30_134712_create_ng_states_table', 25),
(65, '2022_01_30_140648_create_ng_lgas_table', 26);

-- --------------------------------------------------------

--
-- Table structure for table `ng_lgas`
--

DROP TABLE IF EXISTS `ng_lgas`;
CREATE TABLE IF NOT EXISTS `ng_lgas` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ng_state_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=775 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ng_lgas`
--

INSERT INTO `ng_lgas` (`id`, `ng_state_id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(1, '1', 'Aba North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(2, '1', 'Aba South', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(3, '1', 'Arochukwu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(4, '1', 'Bende', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(5, '1', 'Ikwuano', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(6, '1', 'Isiala Ngwa North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(7, '1', 'Isiala Ngwa South', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(8, '1', 'Isuikwuato', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(9, '1', 'Obi Ngwa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(10, '1', 'Ohafia', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(11, '1', 'Osisioma', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(12, '1', 'Ugwunagbo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(13, '1', 'Ukwa East', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(14, '1', 'Ukwa West', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(15, '1', 'Umuahia North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(16, '1', 'Umuahia South', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(17, '1', 'Umu Nneochi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(18, '2', 'Demsa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(19, '2', 'Fufure', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(20, '2', 'Ganye', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(21, '2', 'Gayuk', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(22, '2', 'Gombi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(23, '2', 'Grie', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(24, '2', 'Hong', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(25, '2', 'Jada', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(26, '2', 'Larmurde', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(27, '2', 'Madagali', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(28, '2', 'Maiha', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(29, '2', 'Mayo Belwa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(30, '2', 'Michika', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(31, '2', 'Mubi North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(32, '2', 'Mubi South', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(33, '2', 'Numan', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(34, '2', 'Shelleng', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(35, '2', 'Song', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(36, '2', 'Toungo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(37, '2', 'Yola North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(38, '2', 'Yola South', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(39, '3', 'Abak', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(40, '3', 'Eastern Obolo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(41, '3', 'Eket', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(42, '3', 'Esit Eket', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(43, '3', 'Essien Udim', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(44, '3', 'Etim Ekpo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(45, '3', 'Etinan', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(46, '3', 'Ibeno', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(47, '3', 'Ibesikpo Asutan', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(48, '3', 'Ibiono-Ibom', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(49, '3', 'Ika', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(50, '3', 'Ikono', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(51, '3', 'Ikot Abasi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(52, '3', 'Ikot Ekpene', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(53, '3', 'Ini', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(54, '3', 'Itu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(55, '3', 'Mbo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(56, '3', 'Mkpat-Enin', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(57, '3', 'Nsit-Atai', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(58, '3', 'Nsit-Ibom', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(59, '3', 'Nsit-Ubium', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(60, '3', 'Obot Akara', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(61, '3', 'Okobo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(62, '3', 'Onna', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(63, '3', 'Oron', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(64, '3', 'Oruk Anam', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(65, '3', 'Udung-Uko', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(66, '3', 'Ukanafun', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(67, '3', 'Uruan', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(68, '3', 'Urue-Offong/Oruko', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(69, '3', 'Uyo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(70, '4', 'Aguata', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(71, '4', 'Anambra East', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(72, '4', 'Anambra West', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(73, '4', 'Anaocha', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(74, '4', 'Awka North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(75, '4', 'Awka South', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(76, '4', 'Ayamelum', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(77, '4', 'Dunukofia', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(78, '4', 'Ekwusigo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(79, '4', 'Idemili North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(80, '4', 'Idemili South', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(81, '4', 'Ihiala', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(82, '4', 'Njikoka', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(83, '4', 'Nnewi North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(84, '4', 'Nnewi South', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(85, '4', 'Ogbaru', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(86, '4', 'Onitsha North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(87, '4', 'Onitsha South', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(88, '4', 'Orumba North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(89, '4', 'Orumba South', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(90, '4', 'Oyi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(91, '5', 'Alkaleri', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(92, '5', 'Bauchi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(93, '5', 'Bogoro', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(94, '5', 'Damban', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(95, '5', 'Darazo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(96, '5', 'Dass', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(97, '5', 'Gamawa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(98, '5', 'Ganjuwa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(99, '5', 'Giade', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(100, '5', 'Itas/Gadau', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(101, '5', 'Jama\'are', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(102, '5', 'Katagum', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(103, '5', 'Kirfi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(104, '5', 'Misau', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(105, '5', 'Ningi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(106, '5', 'Shira', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(107, '5', 'Tafawa Balewa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(108, '5', 'Toro', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(109, '5', 'Warji', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(110, '5', 'Zaki', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(111, '6', 'Brass', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(112, '6', 'Ekeremor', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(113, '6', 'Kolokuma/Opokuma', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(114, '6', 'Nembe', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(115, '6', 'Ogbia', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(116, '6', 'Sagbama', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(117, '6', 'Southern Ijaw', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(118, '6', 'Yenagoa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(119, '7', 'Agatu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(120, '7', 'Apa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(121, '7', 'Ado', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(122, '7', 'Buruku', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(123, '7', 'Gboko', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(124, '7', 'Guma', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(125, '7', 'Gwer East', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(126, '7', 'Gwer West', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(127, '7', 'Katsina-Ala', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(128, '7', 'Konshisha', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(129, '7', 'Kwande', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(130, '7', 'Logo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(131, '7', 'Makurdi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(132, '7', 'Obi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(133, '7', 'Ogbadibo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(134, '7', 'Ohimini', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(135, '7', 'Oju', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(136, '7', 'Okpokwu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(137, '7', 'Oturkpo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(138, '7', 'Tarka', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(139, '7', 'Ukum', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(140, '7', 'Ushongo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(141, '7', 'Vandeikya', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(142, '8', 'Abadam', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(143, '8', 'Askira/Uba', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(144, '8', 'Bama', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(145, '8', 'Bayo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(146, '8', 'Biu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(147, '8', 'Chibok', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(148, '8', 'Damboa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(149, '8', 'Dikwa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(150, '8', 'Gubio', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(151, '8', 'Guzamala', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(152, '8', 'Gwoza', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(153, '8', 'Hawul', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(154, '8', 'Jere', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(155, '8', 'Kaga', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(156, '8', 'Kala/Balge', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(157, '8', 'Konduga', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(158, '8', 'Kukawa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(159, '8', 'Kwaya Kusar', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(160, '8', 'Mafa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(161, '8', 'Magumeri', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(162, '8', 'Maiduguri', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(163, '8', 'Marte', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(164, '8', 'Mobbar', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(165, '8', 'Monguno', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(166, '8', 'Ngala', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(167, '8', 'Nganzai', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(168, '8', 'Shani', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(169, '9', 'Abi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(170, '9', 'Akamkpa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(171, '9', 'Akpabuyo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(172, '9', 'Bakassi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(173, '9', 'Bekwarra', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(174, '9', 'Biase', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(175, '9', 'Boki', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(176, '9', 'Calabar Municipal', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(177, '9', 'Calabar South', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(178, '9', 'Etung', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(179, '9', 'Ikom', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(180, '9', 'Obanliku', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(181, '9', 'Obubra', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(182, '9', 'Obudu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(183, '9', 'Odukpani', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(184, '9', 'Ogoja', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(185, '9', 'Yakuur', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(186, '9', 'Yala', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(187, '10', 'Aniocha North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(188, '10', 'Aniocha South', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(189, '10', 'Bomadi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(190, '10', 'Burutu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(191, '10', 'Ethiope East', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(192, '10', 'Ethiope West', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(193, '10', 'Ika North East', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(194, '10', 'Ika South', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(195, '10', 'Isoko North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(196, '10', 'Isoko South', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(197, '10', 'Ndokwa East', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(198, '10', 'Ndokwa West', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(199, '10', 'Okpe', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(200, '10', 'Oshimili North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(201, '10', 'Oshimili South', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(202, '10', 'Patani', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(203, '10', 'Sapele, Delta', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(204, '10', 'Udu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(205, '10', 'Ughelli North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(206, '10', 'Ughelli South', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(207, '10', 'Ukwuani', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(208, '10', 'Uvwie', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(209, '10', 'Warri North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(210, '10', 'Warri South', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(211, '10', 'Warri South West', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(212, '11', 'Abakaliki', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(213, '11', 'Afikpo North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(214, '11', 'Afikpo South', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(215, '11', 'Ebonyi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(216, '11', 'Ezza North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(217, '11', 'Ezza South', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(218, '11', 'Ikwo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(219, '11', 'Ishielu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(220, '11', 'Ivo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(221, '11', 'Izzi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(222, '11', 'Ohaozara', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(223, '11', 'Ohaukwu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(224, '11', 'Onicha', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(225, '12', 'Akoko-Edo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(226, '12', 'Egor', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(227, '12', 'Esan Central', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(228, '12', 'Esan North-East', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(229, '12', 'Esan South-East', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(230, '12', 'Esan West', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(231, '12', 'Etsako Central', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(232, '12', 'Etsako East', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(233, '12', 'Etsako West', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(234, '12', 'Igueben', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(235, '12', 'Ikpoba Okha', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(236, '12', 'Orhionmwon', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(237, '12', 'Oredo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(238, '12', 'Ovia North-East', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(239, '12', 'Ovia South-West', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(240, '12', 'Owan East', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(241, '12', 'Owan West', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(242, '12', 'Uhunmwonde', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(243, '13', 'Ado Ekiti', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(244, '13', 'Efon', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(245, '13', 'Ekiti East', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(246, '13', 'Ekiti South-West', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(247, '13', 'Ekiti West', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(248, '13', 'Emure', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(249, '13', 'Gbonyin', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(250, '13', 'Ido Osi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(251, '13', 'Ijero', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(252, '13', 'Ikere', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(253, '13', 'Ikole', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(254, '13', 'Ilejemeje', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(255, '13', 'Irepodun/Ifelodun', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(256, '13', 'Ise/Orun', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(257, '13', 'Moba', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(258, '13', 'Oye', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(259, '14', 'Aninri', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(260, '14', 'Awgu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(261, '14', 'Enugu East', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(262, '14', 'Enugu North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(263, '14', 'Enugu South', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(264, '14', 'Ezeagu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(265, '14', 'Igbo Etiti', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(266, '14', 'Igbo Eze North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(267, '14', 'Igbo Eze South', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(268, '14', 'Isi Uzo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(269, '14', 'Nkanu East', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(270, '14', 'Nkanu West', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(271, '14', 'Nsukka', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(272, '14', 'Oji River', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(273, '14', 'Udenu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(274, '14', 'Udi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(275, '14', 'Uzo Uwani', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(276, '15', 'Abaji', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(277, '15', 'Bwari', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(278, '15', 'Gwagwalada', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(279, '15', 'Kuje', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(280, '15', 'Kwali', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(281, '15', 'Municipal Area Council', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(282, '16', 'Akko', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(283, '16', 'Balanga', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(284, '16', 'Billiri', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(285, '16', 'Dukku', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(286, '16', 'Funakaye', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(287, '16', 'Gombe', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(288, '16', 'Kaltungo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(289, '16', 'Kwami', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(290, '16', 'Nafada', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(291, '16', 'Shongom', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(292, '16', 'Yamaltu/Deba', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(293, '17', 'Aboh Mbaise', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(294, '17', 'Ahiazu Mbaise', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(295, '17', 'Ehime Mbano', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(296, '17', 'Ezinihitte', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(297, '17', 'Ideato North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(298, '17', 'Ideato South', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(299, '17', 'Ihitte/Uboma', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(300, '17', 'Ikeduru', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(301, '17', 'Isiala Mbano', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(302, '17', 'Isu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(303, '17', 'Mbaitoli', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(304, '17', 'Ngor Okpala', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(305, '17', 'Njaba', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(306, '17', 'Nkwerre', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(307, '17', 'Nwangele', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(308, '17', 'Obowo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(309, '17', 'Oguta', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(310, '17', 'Ohaji/Egbema', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(311, '17', 'Okigwe', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(312, '17', 'Orlu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(313, '17', 'Orsu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(314, '17', 'Oru East', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(315, '17', 'Oru West', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(316, '17', 'Owerri Municipal', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(317, '17', 'Owerri North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(318, '17', 'Owerri West', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(319, '17', 'Unuimo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(320, '18', 'Auyo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(321, '18', 'Babura', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(322, '18', 'Biriniwa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(323, '18', 'Birnin Kudu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(324, '18', 'Buji', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(325, '18', 'Dutse', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(326, '18', 'Gagarawa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(327, '18', 'Garki', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(328, '18', 'Gumel', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(329, '18', 'Guri', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(330, '18', 'Gwaram', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(331, '18', 'Gwiwa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(332, '18', 'Hadejia', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(333, '18', 'Jahun', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(334, '18', 'Kafin Hausa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(335, '18', 'Kazaure', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(336, '18', 'Kiri Kasama', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(337, '18', 'Kiyawa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(338, '18', 'Kaugama', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(339, '18', 'Maigatari', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(340, '18', 'Malam Madori', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(341, '18', 'Miga', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(342, '18', 'Ringim', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(343, '18', 'Roni', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(344, '18', 'Sule Tankarkar', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(345, '18', 'Taura', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(346, '18', 'Yankwashi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(347, '19', 'Birnin Gwari', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(348, '19', 'Chikun', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(349, '19', 'Giwa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(350, '19', 'Igabi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(351, '19', 'Ikara', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(352, '19', 'Jaba', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(353, '19', 'Jema\'a', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(354, '19', 'Kachia', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(355, '19', 'Kaduna North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(356, '19', 'Kaduna South', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(357, '19', 'Kagarko', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(358, '19', 'Kajuru', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(359, '19', 'Kaura', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(360, '19', 'Kauru', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(361, '19', 'Kubau', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(362, '19', 'Kudan', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(363, '19', 'Lere', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(364, '19', 'Makarfi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(365, '19', 'Sabon Gari', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(366, '19', 'Sanga', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(367, '19', 'Soba', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(368, '19', 'Zangon Kataf', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(369, '19', 'Zaria', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(370, '20', 'Ajingi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(371, '20', 'Albasu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(372, '20', 'Bagwai', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(373, '20', 'Bebeji', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(374, '20', 'Bichi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(375, '20', 'Bunkure', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(376, '20', 'Dala', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(377, '20', 'Dambatta', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(378, '20', 'Dawakin Kudu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(379, '20', 'Dawakin Tofa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(380, '20', 'Doguwa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(381, '20', 'Fagge', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(382, '20', 'Gabasawa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(383, '20', 'Garko', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(384, '20', 'Garun Mallam', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(385, '20', 'Gaya', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(386, '20', 'Gezawa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(387, '20', 'Gwale', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(388, '20', 'Gwarzo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(389, '20', 'Kabo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(390, '20', 'Kano Municipal', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(391, '20', 'Karaye', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(392, '20', 'Kibiya', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(393, '20', 'Kiru', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(394, '20', 'Kumbotso', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(395, '20', 'Kunchi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(396, '20', 'Kura', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(397, '20', 'Madobi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(398, '20', 'Makoda', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(399, '20', 'Minjibir', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(400, '20', 'Nasarawa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(401, '20', 'Rano', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(402, '20', 'Rimin Gado', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(403, '20', 'Rogo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(404, '20', 'Shanono', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(405, '20', 'Sumaila', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(406, '20', 'Takai', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(407, '20', 'Tarauni', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(408, '20', 'Tofa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(409, '20', 'Tsanyawa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(410, '20', 'Tudun Wada', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(411, '20', 'Ungogo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(412, '20', 'Warawa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(413, '20', 'Wudil', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(414, '21', 'Bakori', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(415, '21', 'Batagarawa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(416, '21', 'Batsari', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(417, '21', 'Baure', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(418, '21', 'Bindawa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(419, '21', 'Charanchi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(420, '21', 'Dandume', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(421, '21', 'Danja', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(422, '21', 'Dan Musa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(423, '21', 'Daura', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(424, '21', 'Dutsi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(425, '21', 'Dutsin Ma', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(426, '21', 'Faskari', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(427, '21', 'Funtua', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(428, '21', 'Ingawa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(429, '21', 'Jibia', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(430, '21', 'Kafur', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(431, '21', 'Kaita', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(432, '21', 'Kankara', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(433, '21', 'Kankia', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(434, '21', 'Katsina', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(435, '21', 'Kurfi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(436, '21', 'Kusada', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(437, '21', 'Mai\'Adua', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(438, '21', 'Malumfashi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(439, '21', 'Mani', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(440, '21', 'Mashi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(441, '21', 'Matazu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(442, '21', 'Musawa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(443, '21', 'Rimi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(444, '21', 'Sabuwa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(445, '21', 'Safana', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(446, '21', 'Sandamu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(447, '21', 'Zango', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(448, '22', 'Aleiro', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(449, '22', 'Arewa Dandi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(450, '22', 'Argungu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(451, '22', 'Augie', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(452, '22', 'Bagudo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(453, '22', 'Birnin Kebbi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(454, '22', 'Bunza', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(455, '22', 'Dandi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(456, '22', 'Fakai', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(457, '22', 'Gwandu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(458, '22', 'Jega', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(459, '22', 'Kalgo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(460, '22', 'Koko/Besse', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(461, '22', 'Maiyama', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(462, '22', 'Ngaski', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(463, '22', 'Sakaba', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(464, '22', 'Shanga', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(465, '22', 'Suru', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(466, '22', 'Wasagu/Danko', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(467, '22', 'Yauri', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(468, '22', 'Zuru', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(469, '23', 'Adavi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(470, '23', 'Ajaokuta', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(471, '23', 'Ankpa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(472, '23', 'Bassa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(473, '23', 'Dekina', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(474, '23', 'Ibaji', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(475, '23', 'Idah', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(476, '23', 'Igalamela Odolu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(477, '23', 'Ijumu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(478, '23', 'Kabba/Bunu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(479, '23', 'Kogi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(480, '23', 'Lokoja', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(481, '23', 'Mopa Muro', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(482, '23', 'Ofu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(483, '23', 'Ogori/Magongo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(484, '23', 'Okehi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(485, '23', 'Okene', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(486, '23', 'Olamaboro', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(487, '23', 'Omala', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(488, '23', 'Yagba East', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(489, '23', 'Yagba West', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(490, '24', 'Asa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(491, '24', 'Baruten', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(492, '24', 'Edu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(493, '24', 'Ekiti, Kwara State', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(494, '24', 'Ifelodun', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(495, '24', 'Ilorin East', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(496, '24', 'Ilorin South', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(497, '24', 'Ilorin West', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(498, '24', 'Irepodun', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(499, '24', 'Isin', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(500, '24', 'Kaiama', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(501, '24', 'Moro', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(502, '24', 'Offa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(503, '24', 'Oke Ero', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(504, '24', 'Oyun', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(505, '24', 'Pategi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(506, '25', 'Agege', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(507, '25', 'Ajeromi-Ifelodun', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(508, '25', 'Alimosho', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(509, '25', 'Amuwo-Odofin', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(510, '25', 'Apapa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(511, '25', 'Badagry', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(512, '25', 'Epe', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(513, '25', 'Eti Osa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(514, '25', 'Ibeju-Lekki', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(515, '25', 'Ifako-Ijaiye', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(516, '25', 'Ikeja', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(517, '25', 'Ikorodu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(518, '25', 'Kosofe', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(519, '25', 'Lagos Island', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(520, '25', 'Lagos Mainland', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(521, '25', 'Mushin', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(522, '25', 'Ojo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(523, '25', 'Oshodi-Isolo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(524, '25', 'Shomolu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(525, '25', 'Surulere, Lagos State', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(526, '26', 'Akwanga', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(527, '26', 'Awe', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(528, '26', 'Doma', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(529, '26', 'Karu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(530, '26', 'Keana', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(531, '26', 'Keffi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(532, '26', 'Kokona', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(533, '26', 'Lafia', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(534, '26', 'Nasarawa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(535, '26', 'Nasarawa Egon', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(536, '26', 'Obi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(537, '26', 'Toto', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(538, '26', 'Wamba', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(539, '27', 'Agaie', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(540, '27', 'Agwara', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(541, '27', 'Bida', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(542, '27', 'Borgu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(543, '27', 'Bosso', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(544, '27', 'Chanchaga', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(545, '27', 'Edati', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(546, '27', 'Gbako', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(547, '27', 'Gurara', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(548, '27', 'Katcha', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(549, '27', 'Kontagora', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(550, '27', 'Lapai', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(551, '27', 'Lavun', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(552, '27', 'Magama', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(553, '27', 'Mariga', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(554, '27', 'Mashegu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(555, '27', 'Mokwa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(556, '27', 'Moya', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(557, '27', 'Paikoro', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(558, '27', 'Rafi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(559, '27', 'Rijau', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(560, '27', 'Shiroro', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(561, '27', 'Suleja', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(562, '27', 'Tafa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(563, '27', 'Wushishi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(564, '28', 'Abeokuta North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(565, '28', 'Abeokuta South', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(566, '28', 'Ado-Odo/Ota', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(567, '28', 'Egbado North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(568, '28', 'Egbado South', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(569, '28', 'Ewekoro', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(570, '28', 'Ifo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(571, '28', 'Ijebu East', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(572, '28', 'Ijebu North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(573, '28', 'Ijebu North East', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(574, '28', 'Ijebu Ode', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(575, '28', 'Ikenne', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(576, '28', 'Imeko Afon', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(577, '28', 'Ipokia', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(578, '28', 'Obafemi Owode', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(579, '28', 'Odeda', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(580, '28', 'Odogbolu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(581, '28', 'Ogun Waterside', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(582, '28', 'Remo North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(583, '28', 'Shagamu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(584, '29', 'Akoko North-East', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(585, '29', 'Akoko North-West', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(586, '29', 'Akoko South-West', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(587, '29', 'Akoko South-East', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(588, '29', 'Akure North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(589, '29', 'Akure South', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(590, '29', 'Ese Odo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(591, '29', 'Idanre', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(592, '29', 'Ifedore', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(593, '29', 'Ilaje', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(594, '29', 'Ile Oluji/Okeigbo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(595, '29', 'Irele', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(596, '29', 'Odigbo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(597, '29', 'Okitipupa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(598, '29', 'Ondo East', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(599, '29', 'Ondo West', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(600, '29', 'Ose', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(601, '29', 'Owo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(602, '30', 'Atakunmosa East', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(603, '30', 'Atakunmosa West', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(604, '30', 'Aiyedaade', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(605, '30', 'Aiyedire', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(606, '30', 'Boluwaduro', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(607, '30', 'Boripe', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(608, '30', 'Ede North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(609, '30', 'Ede South', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(610, '30', 'Ife Central', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(611, '30', 'Ife East', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(612, '30', 'Ife North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(613, '30', 'Ife South', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(614, '30', 'Egbedore', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(615, '30', 'Ejigbo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(616, '30', 'Ifedayo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(617, '30', 'Ifelodun', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(618, '30', 'Ila', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(619, '30', 'Ilesa East', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(620, '30', 'Ilesa West', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(621, '30', 'Irepodun', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(622, '30', 'Irewole', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(623, '30', 'Isokan', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(624, '30', 'Iwo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(625, '30', 'Obokun', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(626, '30', 'Odo Otin', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(627, '30', 'Ola Oluwa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(628, '30', 'Olorunda', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(629, '30', 'Oriade', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(630, '30', 'Orolu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(631, '30', 'Osogbo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(632, '31', 'Afijio', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(633, '31', 'Akinyele', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(634, '31', 'Atiba', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(635, '31', 'Atisbo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(636, '31', 'Egbeda', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(637, '31', 'Ibadan North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(638, '31', 'Ibadan North-East', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(639, '31', 'Ibadan North-West', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(640, '31', 'Ibadan South-East', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(641, '31', 'Ibadan South-West', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(642, '31', 'Ibarapa Central', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(643, '31', 'Ibarapa East', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(644, '31', 'Ibarapa North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(645, '31', 'Ido', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(646, '31', 'Irepo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(647, '31', 'Iseyin', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(648, '31', 'Itesiwaju', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(649, '31', 'Iwajowa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(650, '31', 'Kajola', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(651, '31', 'Lagelu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(652, '31', 'Ogbomosho North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(653, '31', 'Ogbomosho South', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(654, '31', 'Ogo Oluwa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(655, '31', 'Olorunsogo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(656, '31', 'Oluyole', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(657, '31', 'Ona Ara', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(658, '31', 'Orelope', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(659, '31', 'Ori Ire', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(660, '31', 'Oyo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(661, '31', 'Oyo East', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(662, '31', 'Saki East', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(663, '31', 'Saki West', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(664, '31', 'Surulere, Oyo State', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(665, '32', 'Bokkos', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(666, '32', 'Barkin Ladi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(667, '32', 'Bassa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(668, '32', 'Jos East', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(669, '32', 'Jos North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(670, '32', 'Jos South', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(671, '32', 'Kanam', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(672, '32', 'Kanke', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(673, '32', 'Langtang South', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(674, '32', 'Langtang North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(675, '32', 'Mangu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(676, '32', 'Mikang', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(677, '32', 'Pankshin', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(678, '32', 'Qua\'an Pan', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(679, '32', 'Riyom', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(680, '32', 'Shendam', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22');
INSERT INTO `ng_lgas` (`id`, `ng_state_id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(681, '32', 'Wase', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(682, '33', 'Abua/Odual', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(683, '33', 'Ahoada East', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(684, '33', 'Ahoada West', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(685, '33', 'Akuku-Toru', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(686, '33', 'Andoni', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(687, '33', 'Asari-Toru', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(688, '33', 'Bonny', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(689, '33', 'Degema', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(690, '33', 'Eleme', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(691, '33', 'Emuoha', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(692, '33', 'Etche', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(693, '33', 'Gokana', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(694, '33', 'Ikwerre', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(695, '33', 'Khana', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(696, '33', 'Obio/Akpor', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(697, '33', 'Ogba/Egbema/Ndoni', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(698, '33', 'Ogu/Bolo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(699, '33', 'Okrika', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(700, '33', 'Omuma', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(701, '33', 'Opobo/Nkoro', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(702, '33', 'Oyigbo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(703, '33', 'Port Harcourt', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(704, '33', 'Tai', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(705, '34', 'Binji', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(706, '34', 'Bodinga', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(707, '34', 'Dange Shuni', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(708, '34', 'Gada', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(709, '34', 'Goronyo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(710, '34', 'Gudu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(711, '34', 'Gwadabawa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(712, '34', 'Illela', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(713, '34', 'Isa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(714, '34', 'Kebbe', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(715, '34', 'Kware', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(716, '34', 'Rabah', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(717, '34', 'Sabon Birni', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(718, '34', 'Shagari', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(719, '34', 'Silame', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(720, '34', 'Sokoto North', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(721, '34', 'Sokoto South', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(722, '34', 'Tambuwal', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(723, '34', 'Tangaza', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(724, '34', 'Tureta', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(725, '34', 'Wamako', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(726, '34', 'Wurno', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(727, '34', 'Yabo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(728, '35', 'Ardo Kola', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(729, '35', 'Bali', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(730, '35', 'Donga', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(731, '35', 'Gashaka', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(732, '35', 'Gassol', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(733, '35', 'Ibi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(734, '35', 'Jalingo', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(735, '35', 'Karim Lamido', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(736, '35', 'Kumi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(737, '35', 'Lau', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(738, '35', 'Sardauna', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(739, '35', 'Takum', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(740, '35', 'Ussa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(741, '35', 'Wukari', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(742, '35', 'Yorro', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(743, '35', 'Zing', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(744, '36', 'Bade', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(745, '36', 'Bursari', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(746, '36', 'Damaturu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(747, '36', 'Fika', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(748, '36', 'Fune', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(749, '36', 'Geidam', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(750, '36', 'Gujba', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(751, '36', 'Gulani', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(752, '36', 'Jakusko', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(753, '36', 'Karasuwa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(754, '36', 'Machina', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(755, '36', 'Nangere', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(756, '36', 'Nguru', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(757, '36', 'Potiskum', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(758, '36', 'Tarmuwa', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(759, '36', 'Yunusari', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(760, '36', 'Yusufari', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(761, '37', 'Anka', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(762, '37', 'Bakura', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(763, '37', 'Birnin Magaji/Kiyaw', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(764, '37', 'Bukkuyum', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(765, '37', 'Bungudu', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(766, '37', 'Gummi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(767, '37', 'Gusau', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(768, '37', 'Kaura Namoda', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(769, '37', 'Maradun', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(770, '37', 'Maru', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(771, '37', 'Shinkafi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(772, '37', 'Talata Mafara', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(773, '37', 'Chafe', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22'),
(774, '37', 'Zurmi', '0', '2022-01-30 14:12:22', '2022-01-30 14:12:22');

-- --------------------------------------------------------

--
-- Table structure for table `ng_states`
--

DROP TABLE IF EXISTS `ng_states`;
CREATE TABLE IF NOT EXISTS `ng_states` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ng_states`
--

INSERT INTO `ng_states` (`id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Abia', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(2, 'Adamawa', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(3, 'Akwa Ibom', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(4, 'Anambra', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(5, 'Bauchi', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(6, 'Bayelsa', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(7, 'Benue', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(8, 'Borno', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(9, 'Cross River', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(10, 'Delta', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(11, 'Ebonyi', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(12, 'Edo', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(13, 'Ekiti', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(14, 'Enugu', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(15, 'FCT', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(16, 'Gombe', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(17, 'Imo', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(18, 'Jigawa', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(19, 'Kaduna', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(20, 'Kano', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(21, 'Katsina', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(22, 'Kebbi', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(23, 'Kogi', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(24, 'Kwara', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(25, 'Lagos', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(26, 'Nasarawa', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(27, 'Niger', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(28, 'Ogun', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(29, 'Ondo', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(30, 'Osun', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(31, 'Oyo', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(32, 'Plateau', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(33, 'Rivers', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(34, 'Sokoto', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(35, 'Taraba', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(36, 'Yobe', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17'),
(37, 'Zamfara', '3000', '2022-01-30 14:06:17', '2022-01-30 14:06:17');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `billing_email` varchar(255) NOT NULL,
  `billing_name` varchar(255) NOT NULL,
  `billing_address` varchar(255) NOT NULL,
  `billing_phone` varchar(255) NOT NULL,
  `delivery_fee` varchar(255) NOT NULL DEFAULT '0',
  `billing_discount` int(11) NOT NULL DEFAULT '0',
  `billing_discount_code` varchar(255) DEFAULT NULL,
  `billing_subtotal` int(11) NOT NULL,
  `billing_total` int(11) NOT NULL,
  `payment_gateway` varchar(255) NOT NULL DEFAULT 'pay_stack',
  `shipped` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `billing_email`, `billing_name`, `billing_address`, `billing_phone`, `delivery_fee`, `billing_discount`, `billing_discount_code`, `billing_subtotal`, `billing_total`, `payment_gateway`, `shipped`, `created_at`, `updated_at`) VALUES
(1, 22, 'chisomnzube@gmail.com', 'Chisom', 'Room A4 marshall lodge ifite awka, Anambra state.. LGA: Nnewi North STATE: Anambra', '07031382795', '3000', 0, NULL, 243600, 246600, 'pay_stack', 0, '2022-03-21 15:48:59', '2022-03-21 15:48:59'),
(2, 22, 'chisomnzube@gmail.com', 'Chisom', 'Room A4 marshall lodge ifite awka, Anambra state.. LGA: Nnewi North STATE: Anambra', '07031382795', '3000', 0, NULL, 243600, 246600, 'pay_stack', 0, '2022-03-21 15:49:10', '2022-03-21 15:49:10'),
(3, 22, 'chisomnzube@gmail.com', 'Chisom', 'Room A4 marshall lodge ifite awka, Anambra state.. LGA: Nnewi North STATE: Anambra', '07031382795', '3000', 0, NULL, 243600, 246600, 'Pay On Delivery', 0, '2022-03-21 15:53:53', '2022-03-21 15:53:53'),
(5, 22, 'chisomnzube@gmail.com', 'Chisom', 'Room A4 marshall lodge ifite awka, Anambra state.. LGA: Nnewi North STATE: Anambra', '07031382795', '3000', 0, 'ddd', 720650, 723650, 'Pay On Delivery', 1, '2022-03-24 10:18:09', '2022-03-24 10:27:20');

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

DROP TABLE IF EXISTS `order_product`;
CREATE TABLE IF NOT EXISTS `order_product` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_product_order_id_foreign` (`order_id`),
  KEY `order_product_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`id`, `order_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 2, 10, 1, '2022-03-21 15:49:10', '2022-03-21 15:49:10'),
(2, 3, 10, 1, '2022-03-21 15:53:53', '2022-03-21 15:53:53'),
(3, NULL, 11, 1, '2022-03-21 17:00:07', '2022-03-21 17:00:07'),
(4, 5, 10, 2, '2022-03-24 10:18:09', '2022-03-24 10:18:09'),
(5, 5, 9, 1, '2022-03-24 10:18:09', '2022-03-24 10:18:09');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `excerpt` text,
  `body` text,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `meta_description` text,
  `meta_keywords` text,
  `status` enum('ACTIVE','INACTIVE') NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2019-05-01 23:21:46', '2019-05-01 23:21:46');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('larneygifty@gmail.com', '$2y$10$KR.KRy0rn5PH4Ci6pQE67.la0k4GE3tiugLvfswAn6fe9XYjmNPem', '2020-10-02 20:57:49');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2019-05-01 23:21:38', '2019-05-01 23:21:38'),
(2, 'browse_bread', NULL, '2019-05-01 23:21:38', '2019-05-01 23:21:38'),
(3, 'browse_database', NULL, '2019-05-01 23:21:38', '2019-05-01 23:21:38'),
(4, 'browse_media', NULL, '2019-05-01 23:21:38', '2019-05-01 23:21:38'),
(5, 'browse_compass', NULL, '2019-05-01 23:21:38', '2019-05-01 23:21:38'),
(6, 'browse_menus', 'menus', '2019-05-01 23:21:38', '2019-05-01 23:21:38'),
(7, 'read_menus', 'menus', '2019-05-01 23:21:38', '2019-05-01 23:21:38'),
(8, 'edit_menus', 'menus', '2019-05-01 23:21:39', '2019-05-01 23:21:39'),
(9, 'add_menus', 'menus', '2019-05-01 23:21:39', '2019-05-01 23:21:39'),
(10, 'delete_menus', 'menus', '2019-05-01 23:21:39', '2019-05-01 23:21:39'),
(11, 'browse_roles', 'roles', '2019-05-01 23:21:39', '2019-05-01 23:21:39'),
(12, 'read_roles', 'roles', '2019-05-01 23:21:39', '2019-05-01 23:21:39'),
(13, 'edit_roles', 'roles', '2019-05-01 23:21:39', '2019-05-01 23:21:39'),
(14, 'add_roles', 'roles', '2019-05-01 23:21:39', '2019-05-01 23:21:39'),
(15, 'delete_roles', 'roles', '2019-05-01 23:21:39', '2019-05-01 23:21:39'),
(16, 'browse_users', 'users', '2019-05-01 23:21:39', '2019-05-01 23:21:39'),
(17, 'read_users', 'users', '2019-05-01 23:21:39', '2019-05-01 23:21:39'),
(18, 'edit_users', 'users', '2019-05-01 23:21:39', '2019-05-01 23:21:39'),
(19, 'add_users', 'users', '2019-05-01 23:21:39', '2019-05-01 23:21:39'),
(20, 'delete_users', 'users', '2019-05-01 23:21:39', '2019-05-01 23:21:39'),
(21, 'browse_settings', 'settings', '2019-05-01 23:21:39', '2019-05-01 23:21:39'),
(22, 'read_settings', 'settings', '2019-05-01 23:21:39', '2019-05-01 23:21:39'),
(23, 'edit_settings', 'settings', '2019-05-01 23:21:39', '2019-05-01 23:21:39'),
(24, 'add_settings', 'settings', '2019-05-01 23:21:39', '2019-05-01 23:21:39'),
(25, 'delete_settings', 'settings', '2019-05-01 23:21:40', '2019-05-01 23:21:40'),
(26, 'browse_categories', 'categories', '2019-05-01 23:21:42', '2019-05-01 23:21:42'),
(27, 'read_categories', 'categories', '2019-05-01 23:21:43', '2019-05-01 23:21:43'),
(28, 'edit_categories', 'categories', '2019-05-01 23:21:43', '2019-05-01 23:21:43'),
(29, 'add_categories', 'categories', '2019-05-01 23:21:43', '2019-05-01 23:21:43'),
(30, 'delete_categories', 'categories', '2019-05-01 23:21:43', '2019-05-01 23:21:43'),
(31, 'browse_posts', 'posts', '2019-05-01 23:21:45', '2019-05-01 23:21:45'),
(32, 'read_posts', 'posts', '2019-05-01 23:21:45', '2019-05-01 23:21:45'),
(33, 'edit_posts', 'posts', '2019-05-01 23:21:45', '2019-05-01 23:21:45'),
(34, 'add_posts', 'posts', '2019-05-01 23:21:45', '2019-05-01 23:21:45'),
(35, 'delete_posts', 'posts', '2019-05-01 23:21:45', '2019-05-01 23:21:45'),
(36, 'browse_pages', 'pages', '2019-05-01 23:21:46', '2019-05-01 23:21:46'),
(37, 'read_pages', 'pages', '2019-05-01 23:21:46', '2019-05-01 23:21:46'),
(38, 'edit_pages', 'pages', '2019-05-01 23:21:46', '2019-05-01 23:21:46'),
(39, 'add_pages', 'pages', '2019-05-01 23:21:46', '2019-05-01 23:21:46'),
(40, 'delete_pages', 'pages', '2019-05-01 23:21:46', '2019-05-01 23:21:46'),
(41, 'browse_hooks', NULL, '2019-05-01 23:21:48', '2019-05-01 23:21:48'),
(42, 'browse_products', 'products', '2019-05-01 23:25:54', '2019-05-01 23:25:54'),
(43, 'read_products', 'products', '2019-05-01 23:25:54', '2019-05-01 23:25:54'),
(44, 'edit_products', 'products', '2019-05-01 23:25:54', '2019-05-01 23:25:54'),
(45, 'add_products', 'products', '2019-05-01 23:25:54', '2019-05-01 23:25:54'),
(46, 'delete_products', 'products', '2019-05-01 23:25:54', '2019-05-01 23:25:54'),
(47, 'browse_category', 'category', '2019-05-01 23:26:53', '2019-05-01 23:26:53'),
(48, 'read_category', 'category', '2019-05-01 23:26:53', '2019-05-01 23:26:53'),
(49, 'edit_category', 'category', '2019-05-01 23:26:53', '2019-05-01 23:26:53'),
(50, 'add_category', 'category', '2019-05-01 23:26:53', '2019-05-01 23:26:53'),
(51, 'delete_category', 'category', '2019-05-01 23:26:53', '2019-05-01 23:26:53'),
(57, 'browse_coupons', 'coupons', '2019-05-01 23:30:51', '2019-05-01 23:30:51'),
(58, 'read_coupons', 'coupons', '2019-05-01 23:30:52', '2019-05-01 23:30:52'),
(59, 'edit_coupons', 'coupons', '2019-05-01 23:30:52', '2019-05-01 23:30:52'),
(60, 'add_coupons', 'coupons', '2019-05-01 23:30:52', '2019-05-01 23:30:52'),
(61, 'delete_coupons', 'coupons', '2019-05-01 23:30:52', '2019-05-01 23:30:52'),
(62, 'browse_orders', 'orders', '2019-05-09 07:44:55', '2019-05-09 07:44:55'),
(63, 'read_orders', 'orders', '2019-05-09 07:44:55', '2019-05-09 07:44:55'),
(64, 'edit_orders', 'orders', '2019-05-09 07:44:55', '2019-05-09 07:44:55'),
(65, 'add_orders', 'orders', '2019-05-09 07:44:55', '2019-05-09 07:44:55'),
(66, 'delete_orders', 'orders', '2019-05-09 07:44:55', '2019-05-09 07:44:55'),
(67, 'browse_category_subs', 'category_subs', '2019-06-08 10:47:41', '2019-06-08 10:47:41'),
(68, 'read_category_subs', 'category_subs', '2019-06-08 10:47:41', '2019-06-08 10:47:41'),
(69, 'edit_category_subs', 'category_subs', '2019-06-08 10:47:41', '2019-06-08 10:47:41'),
(70, 'add_category_subs', 'category_subs', '2019-06-08 10:47:41', '2019-06-08 10:47:41'),
(71, 'delete_category_subs', 'category_subs', '2019-06-08 10:47:41', '2019-06-08 10:47:41'),
(72, 'browse_reviews', 'reviews', '2019-06-19 23:02:03', '2019-06-19 23:02:03'),
(73, 'read_reviews', 'reviews', '2019-06-19 23:02:03', '2019-06-19 23:02:03'),
(74, 'edit_reviews', 'reviews', '2019-06-19 23:02:04', '2019-06-19 23:02:04'),
(75, 'add_reviews', 'reviews', '2019-06-19 23:02:04', '2019-06-19 23:02:04'),
(76, 'delete_reviews', 'reviews', '2019-06-19 23:02:04', '2019-06-19 23:02:04'),
(77, 'browse_banners', 'banners', '2019-06-20 14:23:55', '2019-06-20 14:23:55'),
(78, 'read_banners', 'banners', '2019-06-20 14:23:55', '2019-06-20 14:23:55'),
(79, 'edit_banners', 'banners', '2019-06-20 14:23:55', '2019-06-20 14:23:55'),
(80, 'add_banners', 'banners', '2019-06-20 14:23:55', '2019-06-20 14:23:55'),
(81, 'delete_banners', 'banners', '2019-06-20 14:23:55', '2019-06-20 14:23:55'),
(92, 'browse_contacts', 'contacts', '2019-07-09 10:34:02', '2019-07-09 10:34:02'),
(93, 'read_contacts', 'contacts', '2019-07-09 10:34:02', '2019-07-09 10:34:02'),
(94, 'edit_contacts', 'contacts', '2019-07-09 10:34:02', '2019-07-09 10:34:02'),
(95, 'add_contacts', 'contacts', '2019-07-09 10:34:02', '2019-07-09 10:34:02'),
(96, 'delete_contacts', 'contacts', '2019-07-09 10:34:02', '2019-07-09 10:34:02'),
(132, 'browse_inventories', 'inventories', '2022-01-20 15:36:36', '2022-01-20 15:36:36'),
(133, 'read_inventories', 'inventories', '2022-01-20 15:36:36', '2022-01-20 15:36:36'),
(134, 'edit_inventories', 'inventories', '2022-01-20 15:36:36', '2022-01-20 15:36:36'),
(135, 'add_inventories', 'inventories', '2022-01-20 15:36:36', '2022-01-20 15:36:36'),
(136, 'delete_inventories', 'inventories', '2022-01-20 15:36:36', '2022-01-20 15:36:36'),
(137, 'browse_invoices', 'invoices', '2022-01-20 15:48:41', '2022-01-20 15:48:41'),
(138, 'read_invoices', 'invoices', '2022-01-20 15:48:41', '2022-01-20 15:48:41'),
(139, 'edit_invoices', 'invoices', '2022-01-20 15:48:41', '2022-01-20 15:48:41'),
(140, 'add_invoices', 'invoices', '2022-01-20 15:48:41', '2022-01-20 15:48:41'),
(141, 'delete_invoices', 'invoices', '2022-01-20 15:48:41', '2022-01-20 15:48:41');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 3),
(2, 1),
(3, 1),
(4, 1),
(4, 3),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(16, 3),
(17, 1),
(17, 3),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(26, 3),
(27, 1),
(27, 3),
(28, 1),
(28, 3),
(29, 1),
(29, 3),
(30, 1),
(30, 3),
(31, 1),
(31, 3),
(32, 1),
(32, 3),
(33, 1),
(33, 3),
(34, 1),
(34, 3),
(35, 1),
(35, 3),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(42, 3),
(43, 1),
(43, 3),
(44, 1),
(44, 3),
(45, 1),
(45, 3),
(46, 1),
(46, 3),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(62, 3),
(63, 1),
(63, 3),
(64, 1),
(64, 3),
(65, 1),
(65, 3),
(66, 1),
(66, 3),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(72, 3),
(73, 1),
(73, 3),
(74, 1),
(74, 3),
(75, 1),
(75, 3),
(76, 1),
(76, 3),
(77, 1),
(77, 3),
(78, 1),
(78, 3),
(79, 1),
(79, 3),
(80, 1),
(80, 3),
(81, 1),
(81, 3),
(92, 1),
(92, 3),
(93, 1),
(93, 3),
(94, 1),
(94, 3),
(95, 1),
(95, 3),
(96, 1),
(96, 3),
(132, 1),
(133, 1),
(134, 1),
(135, 1),
(136, 1),
(137, 1),
(138, 1),
(139, 1),
(140, 1),
(141, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `excerpt` text,
  `body` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `meta_description` text,
  `meta_keywords` text,
  `status` enum('PUBLISHED','DRAFT','PENDING') NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `details` varchar(255) DEFAULT NULL,
  `price` bigint(20) NOT NULL,
  `description` text NOT NULL,
  `keywords` text NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `image` varchar(255) DEFAULT NULL,
  `images` text,
  `delivery_info` varchar(500) NOT NULL DEFAULT '2',
  `boosted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `details`, `price`, `description`, `keywords`, `featured`, `quantity`, `image`, `images`, `delivery_info`, `boosted`, `created_at`, `updated_at`) VALUES
(1, 'iPhone 13', 'iphone-13', 'Very strong and long lasting', 570000, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit essellum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit essellum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'key', 1, 9, 'products\\February2022\\l19fz38H8F9lulRxQR7O.jpg', '[\"products\\\\February2022\\\\VwNeU4auq5K11W22omfd.jpg\"]', '2', 1, '2022-02-28 08:05:40', '2022-03-24 10:23:37'),
(2, 'Samsung s20', 'samsung-s20', 'Very strong and long lasting', 450000, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit essellum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit essellum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'hete', 1, 10, 'products\\February2022\\03KJqx9BDsFfVSZ6zZOe.jpg', NULL, '2', 1, '2022-02-28 08:06:54', '2022-02-28 08:06:54'),
(3, 'Oppo A54', 'oppo-a54', 'Very strong and long lasting', 230000, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit essellum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit essellum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'hhdd', 1, 20, 'products\\February2022\\r4B7gBMtnTDlKz9UoG9U.jpg', NULL, '4', 0, '2022-02-28 08:09:26', '2022-02-28 08:09:26'),
(4, 'Nokia', 'nokia', 'color: black', 200000, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit essellum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit essellum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'heh', 1, 20, 'products\\February2022\\fMClQh755BOdCNKrFckr.jpg', NULL, '3', 1, '2022-02-28 08:10:38', '2022-02-28 08:10:38'),
(5, 'Huawei y7a', 'huawei-y7a', 'Very Interesting', 120000, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit essellum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit essellum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'hehe', 1, 200, 'products\\March2022\\UIr1xQAkIncdKzJ25tWP.jpg', NULL, '2', 0, '2022-02-28 08:12:16', '2022-03-17 17:59:54'),
(6, 'Nokia G20', 'nokia-g20', 'Very strong and long lasting', 23000, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit essellum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit essellum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'djd', 1, 20, 'products\\March2022\\erfaBEwOwzVvRN3Dm28L.jpg', NULL, '3', 1, '2022-02-28 08:13:39', '2022-03-24 10:23:37'),
(7, 'xiaomi redmi note 10', 'xiaomi-redmi-note-10', 'Very strong and long lasting', 700000, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit essellum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit essellum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'hhdh', 1, 45, 'products\\March2022\\zztBl2H6sDrTZlpZj2up.jpg', NULL, '3', 1, '2022-02-28 08:14:55', '2022-03-17 17:57:29'),
(8, 'Tecno Camon 17', 'tecno-camon-17', 'Very strong and long lasting', 400000, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit essellum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit essellum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'hdh', 1, 33, 'products\\March2022\\oSxeyILEEo0xQLPvCUD2.png', NULL, '4', 1, '2022-02-28 08:16:17', '2022-03-17 17:56:27'),
(9, 'Samsung galaxy s21', 'samsung-galaxy-s21', 'Very strong and long lasting', 230000, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit essellum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit essellum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'hhf', 1, 11, 'products\\March2022\\csaBkbv4RdTRuMOMP2QX.jpg', NULL, '4', 1, '2022-02-28 08:17:28', '2022-03-24 10:18:10'),
(10, 'iPhone 12 pro max', 'iphone-12-pro-max', 'Very strong and long lasting', 240000, '<p>subCategory</p>', 'hehe', 1, 6, 'products\\February2022\\xxBwNGBjessqxkl4SvKR.jpg', NULL, '5', 1, '2022-02-28 08:28:01', '2022-03-24 10:18:09'),
(11, 'Oppo reno 5', 'oppo-reno-5', 'Very strong and long lasting', 340500, '<p>subCategory</p>', 'ghdh', 1, 33, 'products\\February2022\\FEjuvNzb5bgAHuMbOtAq.jpeg', '[\"products\\\\February2022\\\\SfMD8MxYJBa5geSPJjKJ.jpg\",\"products\\\\February2022\\\\b6cnrckDXibed7NWzBEB.jpg\"]', '5', 1, '2022-02-28 08:29:46', '2022-03-21 17:00:07'),
(12, 'iphone 2683  439   39bda dshudshdshdsdh dhdssdsduidhnhdsdhdiewe', 'iphone-2683-439-39bda-dshudshdshdsdh-dhdssdsduidhnhdsdhdiewe', 'Very strong and long lasting', 4533830, '<p>dhjdbdkjbdsjdejdbskjd</p>', 'buy iphone', 0, 10, 'products\\March2022\\NPnfDdsoVbyOzALm1RDP.jpg', '[\"products\\\\March2022\\\\mIvG1X7JeXrew79ROMcy.jpg\",\"products\\\\March2022\\\\VRYbyI5UYIpHaGyBgHOd.jpg\"]', '2', 0, '2022-03-24 10:52:45', '2022-03-24 10:56:44');

-- --------------------------------------------------------

--
-- Table structure for table `product_seller`
--

DROP TABLE IF EXISTS `product_seller`;
CREATE TABLE IF NOT EXISTS `product_seller` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `seller_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
CREATE TABLE IF NOT EXISTS `ratings` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `order_id`, `user_id`, `user_email`, `product_id`, `token`, `sent`, `created_at`, `updated_at`) VALUES
(1, 2, 22, 'chisomnzube@gmail.com', 10, 'rating1647881350token10', 0, '2022-03-21 15:49:10', '2022-03-21 15:49:10'),
(2, 3, 22, 'chisomnzube@gmail.com', 10, 'rating1647881633token10', 0, '2022-03-21 15:53:53', '2022-03-21 15:53:53'),
(3, 4, 22, 'chisomnzube@gmail.com', 11, 'rating1647885607token11', 0, '2022-03-21 17:00:07', '2022-03-21 17:00:07'),
(4, 5, 22, 'chisomnzube@gmail.com', 10, 'rating1648120689token10', 0, '2022-03-24 10:18:09', '2022-03-24 10:18:09'),
(5, 5, 22, 'chisomnzube@gmail.com', 9, 'rating1648120689token9', 0, '2022-03-24 10:18:09', '2022-03-24 10:18:09');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rating` int(11) NOT NULL,
  `review` mediumtext NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `user_name` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `robotproducts`
--

DROP TABLE IF EXISTS `robotproducts`;
CREATE TABLE IF NOT EXISTS `robotproducts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roboturls`
--

DROP TABLE IF EXISTS `roboturls`;
CREATE TABLE IF NOT EXISTS `roboturls` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `theUrl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2019-05-01 23:21:38', '2019-05-01 23:21:38'),
(2, 'user', 'Normal User', '2019-05-01 23:21:38', '2019-05-01 23:21:38'),
(3, 'Sub Administrator', 'Sub Administrator', '2019-07-11 00:45:49', '2019-07-11 00:45:49');

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
CREATE TABLE IF NOT EXISTS `sellers` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` mediumtext NOT NULL,
  `specialize` mediumtext NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `value` text,
  `details` text,
  `type` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', 'UA-130773828-1', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings\\February2022\\UUCHhAlJO0Ldtk9sFt46.png', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Phonecom', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to The Admin Dashboard', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', 'settings\\February2022\\CaspaGLRKN5srQ4jWaCp.png', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings\\February2022\\i8B2RRFhCijVzsHdKfG9.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin'),
(11, 'site.stock_threshold', 'Stock Threshold', '5', NULL, 'text', 6, 'Site');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) NOT NULL,
  `column_name` varchar(255) NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2019-05-01 23:21:46', '2019-05-01 23:21:46'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2019-05-01 23:21:46', '2019-05-01 23:21:46'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2019-05-01 23:21:46', '2019-05-01 23:21:46'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2019-05-01 23:21:46', '2019-05-01 23:21:46'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2019-05-01 23:21:46', '2019-05-01 23:21:46'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2019-05-01 23:21:46', '2019-05-01 23:21:46'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2019-05-01 23:21:46', '2019-05-01 23:21:46'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2019-05-01 23:21:46', '2019-05-01 23:21:46'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2019-05-01 23:21:47', '2019-05-01 23:21:47'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2019-05-01 23:21:47', '2019-05-01 23:21:47'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2019-05-01 23:21:47', '2019-05-01 23:21:47'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2019-05-01 23:21:47', '2019-05-01 23:21:47'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2019-05-01 23:21:47', '2019-05-01 23:21:47'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2019-05-01 23:21:47', '2019-05-01 23:21:47'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2019-05-01 23:21:47', '2019-05-01 23:21:47'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2019-05-01 23:21:47', '2019-05-01 23:21:47'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2019-05-01 23:21:47', '2019-05-01 23:21:47'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2019-05-01 23:21:47', '2019-05-01 23:21:47'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2019-05-01 23:21:47', '2019-05-01 23:21:47'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2019-05-01 23:21:47', '2019-05-01 23:21:47'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2019-05-01 23:21:47', '2019-05-01 23:21:47'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2019-05-01 23:21:47', '2019-05-01 23:21:47'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2019-05-01 23:21:47', '2019-05-01 23:21:47'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2019-05-01 23:21:47', '2019-05-01 23:21:47'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2019-05-01 23:21:47', '2019-05-01 23:21:47'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2019-05-01 23:21:47', '2019-05-01 23:21:47'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2019-05-01 23:21:47', '2019-05-01 23:21:47'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2019-05-01 23:21:47', '2019-05-01 23:21:47'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2019-05-01 23:21:47', '2019-05-01 23:21:47'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2019-05-01 23:21:47', '2019-05-01 23:21:47');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `lga` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT 'users/default.png',
  `password` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `settings` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `lname`, `email`, `phone`, `address`, `state`, `lga`, `avatar`, `password`, `email_verified_at`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(22, 1, 'Chisom', 'Onyemelukwe', 'chisomnzube@gmail.com', '07031382795', 'Room A4 marshall lodge ifite awka, Anambra state.', 'Anambra', 'Nnewi North', 'users/default.png', '$2y$10$5pSHMx0s.M/QSEU7ubdFeuYHChx2OfQpX1gfeQQnVEXnnp/lixslm', NULL, 'fDiv1Fv37v5L50dyAeLU0tjVPBJOFKryuDmjYHQ5OlM2npDnI5PyygguFlhW', '{\"locale\":\"en\"}', '2019-07-14 04:16:08', '2022-02-28 09:08:23'),
(29, 1, 'Admin', 'mua', 'admin@admin.com', '09042657039', 'ELMADA HOSTEL NNAMDI AZIKIWE UNIVERSITY AWKA, ELMADA HOSTEL', NULL, NULL, 'users/default.png', '$2y$10$6DDEvKiFZZiSy6ezorNf5uqLu/lxUaMa0.cNUnDk90WZ4RUpvincO', NULL, NULL, '{\"locale\":\"en\"}', '2022-01-19 16:23:04', '2022-03-24 18:02:33'),
(30, 2, 'adam', 'hills', 'adamhills222@gmail.com', '090124283937', 'Lagos Nigeria', '25', 'Eti Osa', 'users/default.png', '$2y$10$q6J6sz3coTas9WE6Iq8XpOoskFh/eTSz0G0zGODufE9fSxzkxUHm2', NULL, NULL, NULL, '2022-01-30 13:42:47', '2022-01-30 13:42:47'),
(31, 2, 'ada', 'mma', 'adamma@gmail.com', '090123345667', 'Lagos Nigeria', '4', 'Awka South', 'users/default.png', '$2y$10$R8r0f6masWtG.c.ek6n3JeIVeswSqWT4Ga/ZjepDJ/ImygUPY5ZG6', NULL, NULL, NULL, '2022-01-30 13:45:22', '2022-01-30 13:53:41'),
(32, 2, 'boom', 'bom', 'boom@gmail.com', '09012345678', 'No 3 Ezeonyeikedi street Nnewichi Nnewi Anambra state Nigeria', 'Anambra', 'Eti Osa', 'users/default.png', '$2y$10$OECCFdboUm/fbBWuP3hdi.il3y7hTp4dUlstnFIECj/rb.YlLgjk6', NULL, NULL, NULL, '2022-01-30 14:10:39', '2022-01-30 14:14:06'),
(39, 2, 'Adams', 'ken', 'adamske22n@gmail.com', '07031382795', 'ELMADA HOSTEL NNAMDI AZIKIWE UNIVERSITY AWKA, ELMADA HOSTEL', 'Anambra', 'Ayamelum', 'users/default.png', '$2y$10$XqQP5/I42G74JLcw4VnJu.Nspn6o40aQyEtk2J3xltMUJcHpFXrwW', NULL, NULL, NULL, '2022-01-31 19:58:06', '2022-01-31 19:58:06'),
(40, 2, 'Chisom', 'Onyemelukwe', 'chisomnzube1997@gmail.com', '07031382795', 'No 3 Ezeonyeikedi street Nnewichi Nnewi Anambra state Nigeria', 'Anambra', 'Awka North', 'users/default.png', '$2y$10$S65AhPEkvd5vd3eldOG0POPKfOfurxlnFS2QE1Sz/C5065pAXGUzG', NULL, NULL, NULL, '2022-01-31 20:03:23', '2022-01-31 20:03:23');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `category_product`
--
ALTER TABLE `category_product`
  ADD CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_product_categorysub_id_foreign` FOREIGN KEY (`categorySub_id`) REFERENCES `category_subs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_subs`
--
ALTER TABLE `category_subs`
  ADD CONSTRAINT `category_subs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `order_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
