-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Czas generowania: 19 Kwi 2020, 09:40
-- Wersja serwera: 5.7.26
-- Wersja PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `ekoforma`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_category`
--

DROP TABLE IF EXISTS `im_category`;
CREATE TABLE IF NOT EXISTS `im_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `label_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_polish_ci DEFAULT '',
  `content` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `position` int(11) DEFAULT '0',
  `status` varchar(3) COLLATE utf8_polish_ci DEFAULT 'on',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  KEY `label_id` (`label_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Wyzwalacze `im_category`
--
DROP TRIGGER IF EXISTS `im_category_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_category_insert_date_create` BEFORE INSERT ON `im_category` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_category_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_category_insert_date_modify` BEFORE INSERT ON `im_category` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_category_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_category_update_date_modify` BEFORE UPDATE ON `im_category` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_file`
--

DROP TABLE IF EXISTS `im_file`;
CREATE TABLE IF NOT EXISTS `im_file` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_polish_ci DEFAULT '',
  `content` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `url` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `status` varchar(3) COLLATE utf8_polish_ci DEFAULT 'on',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Wyzwalacze `im_file`
--
DROP TRIGGER IF EXISTS `im_file_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_file_insert_date_create` BEFORE INSERT ON `im_file` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_file_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_file_insert_date_modify` BEFORE INSERT ON `im_file` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_file_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_file_update_date_modify` BEFORE UPDATE ON `im_file` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_form`
--

DROP TABLE IF EXISTS `im_form`;
CREATE TABLE IF NOT EXISTS `im_form` (
  `form_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `content` varchar(1024) COLLATE utf8_polish_ci DEFAULT '',
  `email_source` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `email_destination` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Wyzwalacze `im_form`
--
DROP TRIGGER IF EXISTS `im_form_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_form_insert_date_create` BEFORE INSERT ON `im_form` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_image`
--

DROP TABLE IF EXISTS `im_image`;
CREATE TABLE IF NOT EXISTS `im_image` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `section` int(11) DEFAULT '0',
  `name` varchar(64) COLLATE utf8_polish_ci DEFAULT '',
  `content` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `url` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `status` varchar(3) COLLATE utf8_polish_ci DEFAULT 'on',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_image`
--

INSERT INTO `im_image` (`image_id`, `section`, `name`, `content`, `url`, `status`, `description`, `date_create`, `date_modify`) VALUES
(1, 1, 'Logo', '', 'logo-164bde3d9fc6294e33601e4272b80534.png', 'on', NULL, '2020-03-17 22:16:21', '2020-03-17 22:16:21'),
(2, 0, 'Dietetyczne danie z rukolą', '', 'zdjecie-58e23689fe35d5eca1ebf89e0a977f93.jpg', 'on', '', '2020-03-18 18:18:52', '2020-03-18 20:18:01'),
(3, 0, 'Rzodkiewka, makaron', '', 'zdjecie2-434648259ac1e6dde1db440571e69f95.jpg', 'on', NULL, '2020-03-18 20:18:47', '2020-03-18 20:18:47'),
(4, 0, 'Kasza, grzyby', '', 'zdjecie3-e08e30ff748bb5f362e9a7b7e0123dfd.jpg', 'on', NULL, '2020-03-18 20:19:04', '2020-03-18 20:19:04'),
(5, 0, 'Zielono i dietetycznie', '', 'zdjecie4-d5c9475bd044cc700ce6e7ce20c17c0f.jpg', 'on', NULL, '2020-03-18 20:19:32', '2020-03-18 20:19:32'),
(6, 0, 'Zupa krem i sucharki', '', 'zdjecie5-5573224c14815c3043ee0ceb9293a7ca.jpg', 'on', NULL, '2020-03-18 20:20:07', '2020-03-18 20:20:07'),
(7, 0, 'Oto ja', '', 'face-women-d61530070734fc1c4c0330ba7677694b.jpg', 'on', 'Dla obiektu \"o mnie\", 626x417px', '2020-03-25 10:19:23', '2020-03-25 11:51:46'),
(8, 0, 'Gulasz dla Vegan', '', '1-5f7d78afc753495b511d5410b58b8e0e.jpg', 'on', NULL, '2020-03-30 10:11:47', '2020-03-30 10:11:47'),
(9, 0, 'Żywność wpływa na umysł', '', '2-8a348422c0196342b99cdab723c990b1.jpg', 'on', NULL, '2020-03-30 10:12:12', '2020-03-30 10:12:12'),
(10, 0, 'Świat a zdrowie', '', '3-64b36207fa5bdffe24a5dfef7ed49ccc.jpg', 'on', NULL, '2020-03-30 10:12:29', '2020-03-30 10:12:29'),
(11, 0, 'Most', '', '1-5dfda45dc1aa9026b3fe87d67c4abf0d.jpg', 'on', NULL, '2020-03-30 10:13:24', '2020-03-30 10:13:24'),
(12, 0, 'Łódź na spokojnym jeziorze', '', '2-ae76aea603de66755bd673c80eab8bce.jpg', 'on', NULL, '2020-03-30 10:13:43', '2020-03-30 10:13:43'),
(13, 0, 'Pierwszy i drugi plan', '', '3-698b23516753147fac443753998c8c81.jpg', 'on', NULL, '2020-03-30 10:14:21', '2020-03-30 10:14:21'),
(14, 0, 'Pietruszkowe spaghetti', '', 'pietruszkowe-spaghetti-52784d7586c708c980e3819adf0f578e.jpg', 'on', NULL, '2020-04-18 12:05:16', '2020-04-18 12:05:16'),
(15, 0, 'Pietruszkowe spaghetti 2', '', 'pietruszkowe-spaghetti-2-716255910bed40ba698dc452bd842eeb.jpg', 'on', NULL, '2020-04-18 12:14:17', '2020-04-18 12:14:17'),
(16, 0, 'Buraczane carpaccio', '', 'buraczane-carpaccio-0e7e04c696ac1164953fb9a3f30caae7.jpg', 'on', NULL, '2020-04-18 12:14:46', '2020-04-18 12:14:46'),
(17, 0, 'Buraczane carpaccio 2', '', 'buraczane-carpaccio-2-1b1db069845b895c4b667c9494e14de6.jpg', 'on', NULL, '2020-04-18 12:15:01', '2020-04-18 12:15:01'),
(18, 0, 'Makaron z cukinią', '', 'makaron-z-cukinia-8d37b86f06df70f65528a86a96830fa2.jpg', 'on', NULL, '2020-04-18 12:15:20', '2020-04-18 12:15:20'),
(19, 0, 'Makaron z cukinią 2', '', 'makaron-z-cukinia-2-197dca27bd56d06d82d36fb0e5274372.jpg', 'on', NULL, '2020-04-18 12:15:34', '2020-04-18 12:15:34'),
(20, 0, 'Mleczne ramen', '', 'mleczne-ramen-aed7ba09f4dc1802879d6b483ee545be.jpg', 'on', NULL, '2020-04-18 12:16:00', '2020-04-18 12:16:00'),
(21, 0, 'Mleczne ramen 2', '', 'mleczne-ramen-2-243589630dd92baecff4d3ba245d4da6.jpg', 'on', NULL, '2020-04-18 12:16:12', '2020-04-18 12:16:12'),
(22, 0, 'Mleczne ramen 3', '', 'mleczne-ramen-3-57fd6566e0b5c2d2900d6502733a3d53.jpg', 'on', NULL, '2020-04-18 12:16:23', '2020-04-18 12:16:23'),
(23, 0, 'Korfu', '', 'korfu-b985652906844eb78375bffa267a168d.jpg', 'on', NULL, '2020-04-19 10:03:12', '2020-04-19 10:03:12'),
(24, 0, 'Korfu 2', '', 'korfu-2-c9ca2a73621d430013d43a9f46658a5d.jpg', 'on', NULL, '2020-04-19 10:03:33', '2020-04-19 10:03:33'),
(25, 0, 'Korfu 3', '', 'korfu-3-0c58a9f5e47cd7e7253bca2de5156fb0.jpg', 'on', NULL, '2020-04-19 10:03:47', '2020-04-19 10:03:47'),
(26, 0, 'Turcja', '', 'turcja-3400184f3e9c159019f8412cf24e50f9.jpg', 'on', NULL, '2020-04-19 10:04:15', '2020-04-19 10:04:15'),
(27, 0, 'Turcja 2', '', 'turcja-2-bdf08343d454a95b5ca1f7200b3514e6.jpg', 'on', NULL, '2020-04-19 10:04:28', '2020-04-19 10:04:28'),
(28, 0, 'Turcja 3', '', 'turcja-3-b74d2cc0b57f0d73dfe92b84d83b4843.jpg', 'on', NULL, '2020-04-19 10:04:43', '2020-04-19 10:04:43'),
(29, 0, 'Turcja 4', '', 'turcja-4-f83acd3351ef97c4a95b78dcaeb1299d.jpg', 'on', NULL, '2020-04-19 10:04:59', '2020-04-19 10:04:59'),
(30, 0, 'Zakynthos', '', 'zakynthos-305988d120345058f7a2a09406aeb600.jpg', 'on', NULL, '2020-04-19 10:05:18', '2020-04-19 10:05:18'),
(31, 0, 'Zakynthos 2', '', 'zakynthos-2-31562ea736aa22e6e935c6a4667ea0db.jpg', 'on', NULL, '2020-04-19 10:05:33', '2020-04-19 10:05:33'),
(32, 0, 'Bajeczne drinki', '', 'teneryfa-c78ed3facb2ad6bc2a25100fc71e607a.jpg', 'on', '', '2020-04-19 10:05:46', '2020-04-19 10:58:17'),
(33, 0, 'Teneryfa 2', '', 'teneryfa-2-373d11b24dcf6f26a8f7bd46266fb3ca.jpg', 'on', NULL, '2020-04-19 10:06:00', '2020-04-19 10:06:00');

--
-- Wyzwalacze `im_image`
--
DROP TRIGGER IF EXISTS `im_image_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_image_insert_date_create` BEFORE INSERT ON `im_image` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_image_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_image_insert_date_modify` BEFORE INSERT ON `im_image` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_image_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_image_update_date_modify` BEFORE UPDATE ON `im_image` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_label`
--

DROP TABLE IF EXISTS `im_label`;
CREATE TABLE IF NOT EXISTS `im_label` (
  `label_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `system_name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `style` text COLLATE utf8_polish_ci,
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`label_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_label`
--

INSERT INTO `im_label` (`label_id`, `name`, `system_name`, `style`, `description`, `date_create`, `date_modify`) VALUES
(1, 'Menu', 'menu', NULL, NULL, '2020-03-17 21:55:36', '2020-03-17 21:55:36'),
(2, 'Logo', 'logo', NULL, NULL, '2020-03-17 22:16:51', '2020-03-17 22:16:51'),
(3, 'Zawartość sekcji', 'row-1', '', '', '2020-03-18 18:01:36', '2020-04-18 11:40:49'),
(4, 'Drugi rząd', 'row-2', '', '', '2020-03-18 18:01:53', '2020-04-19 11:28:58'),
(5, 'Trzeci rząd', 'row-3', '', '', '2020-03-18 18:02:07', '2020-04-19 11:29:22'),
(6, 'O mnie', 'about', NULL, NULL, '2020-03-25 10:05:39', '2020-03-25 10:05:39'),
(7, 'Stopka', 'footer', NULL, NULL, '2020-03-26 19:34:21', '2020-03-26 19:34:21'),
(8, 'Ciasteczka', 'cookie', NULL, NULL, '2020-03-26 19:47:50', '2020-03-26 19:47:50'),
(9, 'Autor', 'author', NULL, NULL, '2020-03-26 21:26:23', '2020-03-26 21:26:23'),
(10, 'Mapa strony w stopce', 'footer-sitemap', '', '', '2020-03-26 21:28:07', '2020-03-26 21:52:16'),
(11, 'Media społecznościowe', 'social-media', NULL, NULL, '2020-03-26 21:56:09', '2020-03-26 21:56:09'),
(12, 'Tytuły w rzędzie', 'title-row', 'display:none;', 'Tytuły są niewidoczne po załadowaniu strony - przejmuje je jQuery i wstrzykuje do pierwszego rzędu (siatka RWD)', '2020-03-28 18:47:28', '2020-03-30 10:16:15'),
(13, 'Tytuły w kolumnie', 'title-col', 'display:none;', 'Tytuły są niewidoczne po załadowaniu strony - przejmuje je jQuery i wstrzykuje do każdego rzędu (siatka RWD)', '2020-03-30 11:10:54', '2020-03-30 11:11:36');

--
-- Wyzwalacze `im_label`
--
DROP TRIGGER IF EXISTS `im_label_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_label_insert_date_create` BEFORE INSERT ON `im_label` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_label_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_label_insert_date_modify` BEFORE INSERT ON `im_label` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_label_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_label_update_date_modify` BEFORE UPDATE ON `im_label` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_label_section`
--

DROP TABLE IF EXISTS `im_label_section`;
CREATE TABLE IF NOT EXISTS `im_label_section` (
  `label_section_id` int(11) NOT NULL AUTO_INCREMENT,
  `label_id` int(11) NOT NULL,
  `section` int(11) NOT NULL,
  `class` varchar(256) COLLATE utf8_polish_ci DEFAULT '',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`label_section_id`),
  KEY `label_id` (`label_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Wyzwalacze `im_label_section`
--
DROP TRIGGER IF EXISTS `im_label_section_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_label_section_insert_date_create` BEFORE INSERT ON `im_label_section` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_label_section_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_label_section_insert_date_modify` BEFORE INSERT ON `im_label_section` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_label_section_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_label_section_update_date_modify` BEFORE UPDATE ON `im_label_section` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_language`
--

DROP TABLE IF EXISTS `im_language`;
CREATE TABLE IF NOT EXISTS `im_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `system_name` varchar(4) COLLATE utf8_polish_ci DEFAULT '',
  `url` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `position` int(11) DEFAULT '0',
  `status_default` varchar(3) COLLATE utf8_polish_ci DEFAULT 'off',
  `status` varchar(3) COLLATE utf8_polish_ci DEFAULT 'on',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_language`
--

INSERT INTO `im_language` (`language_id`, `name`, `system_name`, `url`, `position`, `status_default`, `status`, `description`, `date_create`, `date_modify`) VALUES
(1, 'Polish language', 'pl', 'pl.png', 1, 'on', 'on', '', '2020-03-17 21:08:09', '2020-03-17 21:08:09'),
(2, 'English language', 'en', 'en.png', 2, 'off', 'on', '', '2020-03-17 21:08:09', '2020-03-17 21:08:09');

--
-- Wyzwalacze `im_language`
--
DROP TRIGGER IF EXISTS `im_language_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_language_insert_date_create` BEFORE INSERT ON `im_language` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_language_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_language_insert_date_modify` BEFORE INSERT ON `im_language` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_language_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_language_update_date_modify` BEFORE UPDATE ON `im_language` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_object`
--

DROP TABLE IF EXISTS `im_object`;
CREATE TABLE IF NOT EXISTS `im_object` (
  `object_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  `section` int(11) DEFAULT '0',
  `section_name` varchar(256) COLLATE utf8_polish_ci DEFAULT '',
  `system_name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `name` varchar(256) COLLATE utf8_polish_ci DEFAULT '',
  `content` text COLLATE utf8_polish_ci,
  `link` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `link_name` varchar(256) COLLATE utf8_polish_ci DEFAULT '',
  `email` varchar(64) COLLATE utf8_polish_ci DEFAULT '',
  `form` varchar(64) COLLATE utf8_polish_ci DEFAULT '',
  `icon` varchar(64) COLLATE utf8_polish_ci DEFAULT '',
  `position` int(11) DEFAULT '0',
  `status` varchar(3) COLLATE utf8_polish_ci DEFAULT 'on',
  `status_copy` varchar(3) COLLATE utf8_polish_ci DEFAULT 'off',
  `description` text COLLATE utf8_polish_ci,
  `date` varchar(32) COLLATE utf8_polish_ci DEFAULT '',
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`object_id`),
  KEY `type_id` (`type_id`),
  KEY `label_id` (`label_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_object`
--

INSERT INTO `im_object` (`object_id`, `type_id`, `label_id`, `section`, `section_name`, `system_name`, `name`, `content`, `link`, `link_name`, `email`, `form`, `icon`, `position`, `status`, `status_copy`, `description`, `date`, `date_create`, `date_modify`) VALUES
(1, 1, 1, 0, '', 'Menu górne', '', NULL, '', '', '', '', '', 1, 'on', 'on', '', '2020-03-17', '2020-03-17 21:56:20', '2020-04-19 11:06:53'),
(2, 2, 2, 0, '', 'Logo', '', NULL, '', '', '', '', '', 1, 'on', 'on', '', '2020-03-17', '2020-03-17 22:17:31', '2020-04-19 11:06:42'),
(3, 3, 3, 4, 'Więcej...', 'Puszyste placuszki jogurtowe', 'Puszyste placuszki jogurtowe', '<p>Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach. Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach. Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach</p>', '', '', '', '', 'fal fa-tilde', 5, 'on', 'off', '', '2020-03-18', '2020-03-18 18:08:16', '2020-04-18 12:28:48'),
(4, 3, 3, 4, 'Więcej...', 'Inna nazwa', 'Inna nazwa', '<p>Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach. Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach. Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach</p>', '', '', '', '', 'fal fa-tilde', 6, 'off', 'off', '', '2020-03-18', '2020-03-18 18:23:47', '2020-04-18 12:29:32'),
(5, 3, 3, 4, 'Więcej...', 'Trzecia potrawa', 'Trzecia potrawa', '<p>Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach. Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach. Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach</p>', '', '', '', '', 'fal fa-tilde', 7, 'on', 'off', '', '2020-03-18', '2020-03-18 20:23:34', '2020-04-18 12:29:15'),
(6, 4, 6, 0, '', 'O mnie', '<i class=\"fal fa-tilde\"></i><span style=\"font-size:20px;margin:0 10px 0\">O mnie</span><i class=\"fal fa-tilde\"></i>', '<p>Tu będzie treść m&oacute;wiąca o tym kim jestem, itd. Tu będzie treść m&oacute;wiąca o tym kim jestem, itd. Tu będzie treść m&oacute;wiąca o tym kim jestem, itd.</p>', '', '', '', '', '', 1, 'on', 'on', '', '2020-03-25', '2020-03-25 10:10:04', '2020-04-19 11:06:25'),
(7, 5, 8, 0, '', 'Ciasteczka', '', '<div id=\"cookie\"><i class=\"fad fa-cookie fa-2x float-left m-1\"></i> Przeglądając niniejszy serwis internetowy, akceptujesz pliki cookies zgodnie z ustawieniami przeglądarki <button class=\"btn btn-dark\">OK</button></div>', '', '', '', '', '', 1, 'on', 'on', '', '2020-03-26', '2020-03-26 19:48:19', '2020-04-19 11:05:41'),
(8, 5, 7, 0, '', 'Stopka', '', '<div id=\"footer\" class=\"text-center pt-5 mt-5\"><i class=\"fal fa-tilde fa-2x text-secondary\"></i>\r\n<div style=\"border-top: 2px solid #28a745; width: 70%; margin: 10px auto;\"></div>\r\n<h5>Treść stopki</h5>\r\n<div>Wszelkie prawa zastrzeżone &amp; 2019</div>\r\n<div><a href=\"https://ekoforma.com\">www.ekoforma.com</a><br /><a href=\"#\" target=\"_blank\" class=\"btn btn-light\" rel=\"noopener\"><i class=\"fab fa-facebook-f\" style=\"font-size: 20px;\"></i></a> <a href=\"#\" target=\"_blank\" class=\"btn btn-light\" rel=\"noopener\"><i class=\"fab fa-instagram\" style=\"font-size: 20px;\"></i></a></div>\r\n</div>', '', '', '', '', '', 2, 'on', 'on', 'Pole w HTML, zawierające m.in. ikonę z fontawesome', '2020-03-26', '2020-03-26 19:58:04', '2020-04-19 11:05:48'),
(9, 5, 9, 0, '', 'Autor', '', '<div class=\"text-center\">Projekt i realizacja: <a href=\"https://internet.media.pl\" title=\"Strony internetowe, e-sklepy, serwisy WWW, projekty i wykonanie\" target=\"_blank\" rel=\"noopener\">www.internet.media.pl</a></div>', '', '', '', '', '', 3, 'on', 'on', '', '2020-03-26', '2020-03-26 21:26:40', '2020-04-19 11:05:56'),
(11, 1, 10, 0, '', 'Menu w stopce', '', NULL, '', '', '', '', '', 2, 'on', 'on', '', '2020-03-26', '2020-03-26 21:30:43', '2020-04-19 11:06:59'),
(12, 7, 11, 0, '', 'Facebook', '', NULL, 'facebook.com', '<i class=\"fab fa-facebook-f\"></i>', '', '', '<i class=\"fab fa-facebook-f\"></i>', 1, 'on', 'on', '', '2020-03-26', '2020-03-26 21:57:20', '2020-04-19 11:05:24'),
(13, 7, 11, 0, '', 'Instagram', '', NULL, 'instagram.com', '<i class=\"fab fa-instagram\"></i>', '', '', '', 2, 'on', 'on', '', '2020-03-26', '2020-03-26 21:58:01', '2020-04-19 11:05:30'),
(14, 8, 12, 0, '', 'Zwierzyna', 'Zwierzyna', NULL, '', '', '', '', '', 1, 'on', 'off', '', '2020-03-28', '2020-03-28 18:49:53', '2020-03-28 18:50:08'),
(15, 8, 12, 0, '', 'Myśliwy', 'Myśliwy', NULL, '', '', '', '', '', 2, 'on', 'off', '', '2020-03-28', '2020-03-28 19:19:58', '2020-03-28 19:20:45'),
(16, 8, 12, 0, '', 'Rybak', 'Rybak', NULL, '', '', '', '', '', 3, 'on', 'off', '', '2020-03-28', '2020-03-28 19:20:06', '2020-03-28 19:20:58'),
(17, 9, 4, 6, 'Więcej...', 'Gulasz dla wegan', 'Gulasz dla wegan', '<p>Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach. Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach. Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach</p>', '', '', '', '', 'fal fa-tilde', 1, 'on', 'off', '', '2020-03-30', '2020-03-30 10:20:48', '2020-04-19 10:40:04'),
(20, 9, 4, 6, 'Więcej...', 'Żywność a umysł', 'Żywność a umysł', '<p>Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach. Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach. Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach</p>', '', '', '', '', 'fal fa-tilde', 1, 'on', 'off', '', '2020-03-30', '2020-03-30 10:31:43', '2020-04-19 10:40:11'),
(21, 9, 4, 6, 'Więcej...', 'Świat a zdrowie', 'Świat a zdrowie', '<p>Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach. Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach. Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach</p>', '', '', '', '', 'fal fa-tilde', 1, 'on', 'off', '', '2020-03-30', '2020-03-30 10:32:41', '2020-04-19 10:40:19'),
(22, 10, 5, 7, 'Więcej...', 'Nasz most', 'Nasz most', '<p>Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach. Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach. Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach</p>', '', '', '', '', 'fal fa-tilde', 5, 'on', 'off', '', '2020-03-30', '2020-03-30 10:49:53', '2020-04-19 10:32:16'),
(23, 10, 5, 7, 'Więcej...', 'Na jeziorze łodzią', 'Na jeziorze łodzią', '<p>Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach. Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach. Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach</p>', '', '', '', '', 'fal fa-tilde', 6, 'on', 'off', '', '2020-03-30', '2020-03-30 10:53:28', '2020-04-19 10:32:37'),
(24, 10, 5, 7, 'Więcej...', 'Daleko...', 'Daleko...', '<p>Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach. Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach. Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach</p>', '', '', '', '', 'fal fa-tilde', 7, 'off', 'off', '', '2020-03-30', '2020-03-30 10:54:31', '2020-04-19 10:32:47'),
(25, 11, 13, 0, '', 'Ekopaśnik', 'Ekopaśnik', NULL, '', '', '', '', '', 1, 'on', 'off', '', '2020-03-30', '2020-03-30 11:13:04', '2020-03-30 11:43:37'),
(26, 11, 13, 0, '', 'Lifestyle', 'Lifestyle', NULL, '', '', '', '', '', 2, 'on', 'off', '', '2020-03-30', '2020-03-30 11:13:28', '2020-03-30 11:14:01'),
(27, 11, 13, 0, '', 'Podróże', 'Podróże', NULL, '', '', '', '', '', 2, 'on', 'off', '', '2020-03-30', '2020-03-30 11:14:06', '2020-03-30 11:14:23'),
(31, 3, 3, 9, 'Więcej...', 'Buraczane carpaccio', 'Buraczane carpaccio', '<p>Uwielbiam połączenie buraka z serem kozim, jest to świetna propozycja na kolacje w domu ale r&oacute;wnież wcześniej przygotowane drugie śniadanie na wynos. Na upieczenie buraka potrzebujesz godzinę, proponuję zrobić to wcześniej. Natomiast czas samego wykonania zależy od naszych umiejętności, jak szybko pokroimy składniki tak szybko będziemy jeść :)</p>', '', '', '', '', 'fal fa-tilde', 1, 'on', 'off', '', '2020-04-18', '2020-04-18 12:18:11', '2020-04-19 11:21:41'),
(32, 3, 3, 4, 'Więcej...', 'Makaron z cukinią', 'Fusilli z cukinią i suszonymi pomidorami', '<p>Pyszne, pożywne danie warzywne! Standardowo przedstawiam Wam pomysł na szybki posiłek zawierający odpowiednią porcję warzyw. Przyrządzanie makaron&oacute;w sprawia mi ogromna przyjemność. Robiąc je możemy improwizować dodawać składniki jakie aktualnie mamy w lod&oacute;wce. Ten przepis właśnie taki jest, szybki, prosty a jednakowo smaczny.</p>', '', '', '', '', 'fal fa-tilde', 2, 'on', 'off', '', '2020-04-18', '2020-04-18 12:20:46', '2020-04-18 12:28:29'),
(33, 3, 3, 4, 'Więcej...', 'Mleczne Ramen', 'Mleczne Ramen', '<p>To zupa, kt&oacute;rą zajadam się w ilości nadprogramowej. Połączenie świeżych dodatk&oacute;w z lekko zgrillowanymi warzywami i podpieczonym tufu to &bdquo;niebo w gębie&rdquo; warte każdego czasu przygotowania. Niestety wiem, że z racji tego, że wymaga tego czasu jest niechętnie przygotowywana a robienie jej na skr&oacute;ty nie daje efektu. Ta zupa powstaje z cierpliwości i miłości do gotowania. Często robię ją w leniwą niedzielę. Dzięki temu zajadam się orientalnym smakiem na początku tygodnia.</p>', '', '', '', '', 'fal fa-tilde', 4, 'on', 'off', '', '2020-04-18', '2020-04-18 12:22:57', '2020-04-18 12:27:50'),
(34, 3, 3, 4, 'Więcej...', 'Pietruszkowe spaghetti', 'Pietruszkowe spaghetti', '<p>Moje ulubione danie 5 składnikowe, kt&oacute;re zrobisz w czasie ugotowania makaronu. Doceniam takie dania szczeg&oacute;lnie dlatego, że nie wymagają poświęcania dużej ilości czasu. Składniki natomiast zawsze mam w lod&oacute;wce, ponieważ są często składową bardziej rozbudowanych dań.</p>', '', '', '', '', 'fal fa-tilde', 3, 'on', 'off', '', '2020-04-18', '2020-04-18 12:25:04', '2020-04-18 12:28:36'),
(35, 10, 5, 7, 'Więcej...', 'Korfu', 'Korfu', '<p>Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach. Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach. Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach</p>', '', '', '', '', 'fal fa-tilde', 2, 'on', 'off', '', '2020-04-19', '2020-04-19 10:06:51', '2020-04-19 10:16:28'),
(36, 10, 5, 7, 'Więcej...', 'Turcja', 'Turcja', '<p>Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach. Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach. Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach</p>', '', '', '', '', 'fal fa-tilde', 3, 'on', 'off', '', '2020-04-19', '2020-04-19 10:08:47', '2020-04-19 10:16:38'),
(37, 10, 5, 7, 'Więcej...', 'Zakynthos', 'Zakynthos', '<p>Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach. Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach. Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach</p>', '', '', '', '', 'fal fa-tilde', 4, 'on', 'off', '', '2020-04-19', '2020-04-19 10:10:11', '2020-04-19 10:31:55'),
(38, 10, 5, 7, 'Więcej...', 'Teneryfa', 'Teneryfa', '<p>Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach. Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach. Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach</p>', '', '', '', '', 'fal fa-tilde', 1, 'on', 'off', '', '2020-04-19', '2020-04-19 10:11:08', '2020-04-19 10:16:20'),
(39, 12, 3, 0, '', 'Składnik 1', 'Składnik 1', '<p>Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach. Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach. Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach. Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach. Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach. Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach. Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach. Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach. Tu będzie treść opisująca dany element. M&oacute;wiąca o jego szczeg&oacute;łach</p>', '', '', '', '', 'fal fa-tilde', 1, 'on', 'off', '', '2020-04-19', '2020-04-19 10:57:09', '2020-04-19 11:01:24'),
(40, 13, 3, 0, '', 'Buraczane carpaccio', 'Buraczane carpaccio', '<p>Uwielbiam połączenie buraka z serem kozim, jest to świetna propozycja na kolacje w domu ale r&oacute;wnież wcześniej przygotowane drugie śniadanie na wynos. Na upieczenie buraka potrzebujesz godzinę, proponuję zrobić to wcześniej. Natomiast czas samego wykonania zależy od naszych umiejętności, jak szybko pokroimy składniki tak szybko będziemy jeść :)</p>\r\n<p></p>\r\n<p style=\"margin-bottom: 0.35cm;\">Przepis na duży p&oacute;łmisek lub 2 porcję na wynos.</p>\r\n<p style=\"margin-bottom: 0.35cm;\"><strong>Składniki:</strong></p>\r\n<ul>\r\n<li>\r\n<p style=\"margin-bottom: 0.35cm;\">&nbsp;4 średnie buraki</p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0.35cm;\">&nbsp;2 garści rukoli</p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0.35cm;\">&nbsp;1 garść słoneczniku</p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0.35cm;\">&nbsp;rolada z sera koziego 180 g</p>\r\n</li>\r\n<li>\r\n<p style=\"margin-bottom: 0.35cm;\">&nbsp;oliwa z oliwek lub pomidor&oacute;w</p>\r\n</li>\r\n</ul>\r\n<p><strong>Dodatki:</strong></p>\r\n<ul>\r\n<li>pieprz i s&oacute;l</li>\r\n<li>\r\n<p style=\"margin-bottom: 0.35cm;\">ocet balsamiczny</p>\r\n</li>\r\n</ul>\r\n<p style=\"margin-bottom: 0.35cm;\"><strong>Spos&oacute;b przygotowania:</strong></p>\r\n<p style=\"margin-bottom: 0.35cm;\">1. Nastawiam piekarnik na 200&deg; obrotowy.</p>\r\n<p style=\"margin-bottom: 0.35cm;\">2.&nbsp;Czyszczę buraczki pod bieżącą wodą używam do tego szczoteczki drewnianej z naturalnego włosia, super się sprawdza. Natomiast Ty możesz umyć je jak chcesz, ważne aby były czyste i pozbawione piachu :)</p>\r\n<p style=\"margin-bottom: 0.35cm;\">3. Buraczki wrzucam do małego naczynia żaroodpornego z przykrywką. Jeżeli takiego nie masz i Ci to nie przeszkadzam możesz zawinąć je w cienką warstwę foli aluminiowej. Wrzucam do piekarnika na około 60 min. Sprawdzam delikatnie ich miękkość widelcem bo czas upieczenia zależy od ich wielości.</p>\r\n<p style=\"margin-bottom: 0.35cm;\">4. W czasie jak buraczki się pieką myję rukolę, prażę na patelni słonecznik. Ta chwila czasu pozwoli przeschnąć rukoli i wystygnąć słonecznikowi.</p>\r\n<p style=\"margin-bottom: 0.35cm;\">5. Upieczone buraki wyciągam z naczynia do szybkiego wystygnięcia, następnie zrywam z nich sk&oacute;rkę. Robię to jak są jeszcze delikatnie ciepłe, wtedy lepiej schodzi.</p>\r\n<p style=\"margin-bottom: 0.35cm;\">6. Następnie kroję ser w plasterki, łatwo to zrobisz jeżeli nuż będzie wystarczająco ostry.</p>\r\n<p style=\"margin-bottom: 0.35cm;\">7. Kolejno kroję też w cienkie 0,5cm plastry buraki i układam jak na załączonym obrazku.</p>\r\n<p style=\"margin-bottom: 0.35cm;\">8. Całość doprawiam oliwą, octem balsamicznym, pieprzem i solą.</p>\r\n<p style=\"margin-bottom: 0.35cm;\">9. Podaję z chrupiącym pieczywem.</p>\r\n<p style=\"margin-bottom: 0.35cm;\"><strong>Smacznego!</strong></p>\r\n<p></p>\r\n<p></p>\r\n<p></p>', '', '', '', '', 'fal fa-tilde', 1, 'on', 'off', '', '2020-04-19', '2020-04-19 11:14:53', '2020-04-19 11:21:13');

--
-- Wyzwalacze `im_object`
--
DROP TRIGGER IF EXISTS `im_object_insert_date`;
DELIMITER $$
CREATE TRIGGER `im_object_insert_date` BEFORE INSERT ON `im_object` FOR EACH ROW set new.date = current_date()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_object_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_object_insert_date_create` BEFORE INSERT ON `im_object` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_object_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_object_insert_date_modify` BEFORE INSERT ON `im_object` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_object_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_object_update_date_modify` BEFORE UPDATE ON `im_object` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_object_category`
--

DROP TABLE IF EXISTS `im_object_category`;
CREATE TABLE IF NOT EXISTS `im_object_category` (
  `object_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`object_category_id`),
  KEY `object_id` (`object_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_object_file`
--

DROP TABLE IF EXISTS `im_object_file`;
CREATE TABLE IF NOT EXISTS `im_object_file` (
  `object_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `position` int(11) DEFAULT '0',
  PRIMARY KEY (`object_file_id`),
  KEY `object_id` (`object_id`),
  KEY `file_id` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_object_image`
--

DROP TABLE IF EXISTS `im_object_image`;
CREATE TABLE IF NOT EXISTS `im_object_image` (
  `object_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `position` int(11) DEFAULT '0',
  PRIMARY KEY (`object_image_id`),
  KEY `object_id` (`object_id`),
  KEY `image_id` (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_object_image`
--

INSERT INTO `im_object_image` (`object_image_id`, `object_id`, `image_id`, `position`) VALUES
(51, 17, 8, 1),
(53, 20, 9, 1),
(55, 21, 10, 1),
(161, 33, 21, 1),
(162, 33, 20, 2),
(163, 33, 22, 3),
(173, 32, 18, 1),
(174, 32, 19, 2),
(175, 34, 14, 1),
(176, 34, 15, 2),
(177, 3, 2, 1),
(179, 5, 5, 1),
(181, 4, 6, 1),
(208, 38, 32, 1),
(209, 38, 33, 2),
(210, 35, 23, 1),
(211, 35, 24, 2),
(212, 35, 25, 3),
(213, 36, 27, 1),
(214, 36, 26, 2),
(215, 36, 28, 3),
(216, 36, 29, 4),
(217, 37, 31, 1),
(218, 37, 30, 2),
(219, 22, 11, 1),
(220, 23, 12, 1),
(221, 24, 13, 1),
(223, 39, 32, 1),
(224, 6, 7, 1),
(225, 2, 1, 1),
(226, 40, 17, 1),
(227, 40, 16, 2),
(228, 31, 17, 1),
(229, 31, 16, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_object_source`
--

DROP TABLE IF EXISTS `im_object_source`;
CREATE TABLE IF NOT EXISTS `im_object_source` (
  `object_source_id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `source_id` int(11) NOT NULL,
  `position` int(11) DEFAULT '0',
  PRIMARY KEY (`object_source_id`),
  KEY `object_id` (`object_id`),
  KEY `source_id` (`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_property`
--

DROP TABLE IF EXISTS `im_property`;
CREATE TABLE IF NOT EXISTS `im_property` (
  `property_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `system_name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_property`
--

INSERT INTO `im_property` (`property_id`, `name`, `system_name`, `description`, `date_create`, `date_modify`) VALUES
(1, 'Nazwa', 'name', '', '2020-03-17 21:08:08', '2020-03-17 21:08:08'),
(2, 'Tekst', 'content', '', '2020-03-17 21:08:08', '2020-03-17 21:08:08'),
(3, 'Data', 'date', '', '2020-03-17 21:08:08', '2020-03-17 21:08:08'),
(4, 'Zdjęcie', 'image', '', '2020-03-17 21:08:08', '2020-03-17 21:08:08'),
(5, 'Link wewnętrzny', 'section', '', '2020-03-17 21:08:08', '2020-03-17 21:08:08'),
(6, 'Plik', 'file', '', '2020-03-17 21:08:08', '2020-03-17 21:08:08'),
(7, 'Menu', 'menu', '', '2020-03-17 21:08:09', '2020-03-17 21:08:09'),
(8, 'Link zewnętrzny', 'link', '', '2020-03-17 21:08:09', '2020-03-17 21:08:09'),
(9, 'E-mail', 'email', '', '2020-03-17 21:08:09', '2020-03-17 21:08:09'),
(10, 'Formularz kontaktowy', 'form', '', '2020-03-17 21:08:09', '2020-03-17 21:08:09'),
(11, 'Źródło', 'source', '', '2020-03-17 21:08:09', '2020-03-17 21:08:09'),
(12, 'Ikona', 'icon', '', '2020-03-17 21:08:09', '2020-03-17 21:08:09'),
(13, 'Języki', 'language', '', '2020-03-17 21:08:09', '2020-03-17 21:08:09');

--
-- Wyzwalacze `im_property`
--
DROP TRIGGER IF EXISTS `im_property_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_property_insert_date_create` BEFORE INSERT ON `im_property` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_property_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_property_insert_date_modify` BEFORE INSERT ON `im_property` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_property_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_property_update_date_modify` BEFORE UPDATE ON `im_property` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_section`
--

DROP TABLE IF EXISTS `im_section`;
CREATE TABLE IF NOT EXISTS `im_section` (
  `section_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT '0',
  `name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `name_url` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `meta` varchar(512) COLLATE utf8_polish_ci DEFAULT '',
  `icon` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `class` varchar(128) COLLATE utf8_polish_ci DEFAULT 'container',
  `popup` text COLLATE utf8_polish_ci,
  `position` int(11) DEFAULT '0',
  `status` varchar(3) COLLATE utf8_polish_ci DEFAULT 'on',
  `status_copy` varchar(3) COLLATE utf8_polish_ci DEFAULT 'off',
  `status_popup` varchar(3) COLLATE utf8_polish_ci DEFAULT 'off',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_section`
--

INSERT INTO `im_section` (`section_id`, `parent`, `name`, `name_url`, `meta`, `icon`, `class`, `popup`, `position`, `status`, `status_copy`, `status_popup`, `description`, `date_create`, `date_modify`) VALUES
(1, 0, 'Home', 'home', 'Opis strony głownej', '', 'container', '', 1, 'on', 'on', 'off', '', '2020-03-17 21:08:33', '2020-03-25 10:09:40'),
(2, 0, 'O mnie', 'o-mnie', '', '', 'container', NULL, 2, 'on', 'on', 'off', NULL, '2020-03-17 21:59:10', '2020-03-25 10:09:41'),
(3, 0, 'Kontakt', 'kontakt', '', '', 'container', NULL, 3, 'on', 'on', 'off', NULL, '2020-03-17 21:59:19', '2020-03-25 10:09:42'),
(4, 0, 'Ekopaśnik', 'ekopasnik', '', '', 'container', '', 4, 'on', 'on', 'off', '', '2020-03-17 21:59:50', '2020-04-18 11:41:14'),
(5, 0, 'Składniki', 'skladniki', '', '', 'container', '', 5, 'on', 'on', 'off', '', '2020-03-17 22:00:12', '2020-03-25 10:09:43'),
(6, 0, 'Lifestyle', 'lifestyle', '', '', 'container', NULL, 6, 'on', 'on', 'off', NULL, '2020-03-17 22:00:24', '2020-03-25 10:09:45'),
(7, 0, 'Podróże', 'podroze', '', '', 'container', NULL, 7, 'on', 'on', 'off', NULL, '2020-03-30 10:52:40', '2020-03-30 10:52:47'),
(8, 0, 'Ekopaśnik - podstrony', 'ekopasnik-podstrony', '', '', 'container', '', 8, 'off', 'off', 'off', 'Sekcja nie używana w serwisie. Służy tylko zgrupowaniu podstron ekopaśnika', '2020-04-19 11:04:54', '2020-04-19 11:08:38'),
(9, 8, 'Buraczane carpaccio', 'buraczane-carpaccio', '', '', 'container', '', 1, 'on', 'off', 'off', '', '2020-04-19 11:09:10', '2020-04-19 11:09:27');

--
-- Wyzwalacze `im_section`
--
DROP TRIGGER IF EXISTS `im_section_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_section_insert_date_create` BEFORE INSERT ON `im_section` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_section_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_section_insert_date_modify` BEFORE INSERT ON `im_section` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_section_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_section_update_date_modify` BEFORE UPDATE ON `im_section` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_section_object`
--

DROP TABLE IF EXISTS `im_section_object`;
CREATE TABLE IF NOT EXISTS `im_section_object` (
  `section_object_id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  PRIMARY KEY (`section_object_id`),
  KEY `section_id` (`section_id`),
  KEY `object_id` (`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=657 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_section_object`
--

INSERT INTO `im_section_object` (`section_object_id`, `section_id`, `object_id`) VALUES
(388, 1, 14),
(425, 1, 15),
(426, 1, 16),
(452, 1, 26),
(454, 1, 27),
(456, 1, 25),
(523, 4, 33),
(531, 1, 32),
(532, 4, 32),
(533, 1, 34),
(534, 4, 34),
(535, 4, 3),
(537, 4, 5),
(538, 4, 4),
(555, 1, 38),
(556, 7, 38),
(557, 1, 35),
(558, 7, 35),
(559, 1, 36),
(560, 7, 36),
(561, 7, 37),
(562, 7, 22),
(563, 7, 23),
(564, 7, 24),
(565, 1, 17),
(566, 6, 17),
(567, 1, 20),
(568, 6, 20),
(569, 1, 21),
(570, 6, 21),
(572, 5, 39),
(582, 1, 12),
(583, 2, 12),
(584, 3, 12),
(585, 4, 12),
(586, 5, 12),
(587, 6, 12),
(588, 7, 12),
(589, 1, 13),
(590, 2, 13),
(591, 3, 13),
(592, 4, 13),
(593, 5, 13),
(594, 6, 13),
(595, 7, 13),
(596, 1, 7),
(597, 2, 7),
(598, 3, 7),
(599, 4, 7),
(600, 5, 7),
(601, 6, 7),
(602, 7, 7),
(603, 1, 8),
(604, 2, 8),
(605, 3, 8),
(606, 4, 8),
(607, 5, 8),
(608, 6, 8),
(609, 7, 8),
(610, 1, 9),
(611, 2, 9),
(612, 3, 9),
(613, 4, 9),
(614, 5, 9),
(615, 6, 9),
(616, 7, 9),
(617, 1, 6),
(618, 2, 6),
(619, 3, 6),
(620, 4, 6),
(621, 5, 6),
(622, 6, 6),
(623, 7, 6),
(624, 1, 2),
(625, 2, 2),
(626, 3, 2),
(627, 4, 2),
(628, 5, 2),
(629, 6, 2),
(630, 7, 2),
(631, 1, 1),
(632, 2, 1),
(633, 3, 1),
(634, 4, 1),
(635, 5, 1),
(636, 6, 1),
(637, 7, 1),
(638, 1, 11),
(639, 2, 11),
(640, 3, 11),
(641, 4, 11),
(642, 5, 11),
(643, 6, 11),
(644, 7, 11),
(645, 9, 1),
(646, 9, 2),
(647, 9, 6),
(648, 9, 7),
(649, 9, 8),
(650, 9, 9),
(651, 9, 11),
(652, 9, 12),
(653, 9, 13),
(654, 9, 40),
(655, 1, 31),
(656, 4, 31);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_setting`
--

DROP TABLE IF EXISTS `im_setting`;
CREATE TABLE IF NOT EXISTS `im_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `system_name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `content` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_setting`
--

INSERT INTO `im_setting` (`setting_id`, `name`, `system_name`, `content`, `description`, `date_create`, `date_modify`) VALUES
(1, 'System name', 'name', 'IM-CMS Engine', '', '2020-03-17 21:08:33', '2020-03-17 21:08:33'),
(2, 'Favicon', 'favicon', 'favicon.png', '', '2020-03-17 21:08:33', '2020-03-17 21:08:33'),
(3, 'Font', 'font', 'Baloo 2', '', '2020-03-17 21:08:33', '2020-03-18 17:51:40');

--
-- Wyzwalacze `im_setting`
--
DROP TRIGGER IF EXISTS `im_setting_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_setting_insert_date_create` BEFORE INSERT ON `im_setting` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_setting_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_setting_insert_date_modify` BEFORE INSERT ON `im_setting` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_setting_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_setting_update_date_modify` BEFORE UPDATE ON `im_setting` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_source`
--

DROP TABLE IF EXISTS `im_source`;
CREATE TABLE IF NOT EXISTS `im_source` (
  `source_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_polish_ci DEFAULT '',
  `content` text COLLATE utf8_polish_ci,
  `link` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `status` varchar(3) COLLATE utf8_polish_ci DEFAULT 'on',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Wyzwalacze `im_source`
--
DROP TRIGGER IF EXISTS `im_source_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_source_insert_date_create` BEFORE INSERT ON `im_source` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_source_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_source_insert_date_modify` BEFORE INSERT ON `im_source` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_source_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_source_update_date_modify` BEFORE UPDATE ON `im_source` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_translation`
--

DROP TABLE IF EXISTS `im_translation`;
CREATE TABLE IF NOT EXISTS `im_translation` (
  `translation_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `target_table` varchar(32) COLLATE utf8_polish_ci DEFAULT '',
  `target_column` varchar(32) COLLATE utf8_polish_ci DEFAULT '',
  `target_record` int(11) NOT NULL,
  `content` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`translation_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Wyzwalacze `im_translation`
--
DROP TRIGGER IF EXISTS `im_translation_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_translation_insert_date_create` BEFORE INSERT ON `im_translation` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_translation_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_translation_insert_date_modify` BEFORE INSERT ON `im_translation` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_translation_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_translation_update_date_modify` BEFORE UPDATE ON `im_translation` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_translation_system`
--

DROP TABLE IF EXISTS `im_translation_system`;
CREATE TABLE IF NOT EXISTS `im_translation_system` (
  `translation_system_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `system_name` varchar(32) COLLATE utf8_polish_ci DEFAULT '',
  `content` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`translation_system_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_translation_system`
--

INSERT INTO `im_translation_system` (`translation_system_id`, `language_id`, `name`, `system_name`, `content`, `description`, `date_create`, `date_modify`) VALUES
(1, 1, 'All', 'show-all', 'Pokaż wszystko', '', '2020-03-17 21:08:09', '2020-03-17 21:08:09'),
(2, 2, 'All', 'show-all', 'Show all', '', '2020-03-17 21:08:09', '2020-03-17 21:08:09'),
(3, 1, 'No data', 'no-data', 'Brak danych', '', '2020-03-17 21:08:09', '2020-03-17 21:08:09'),
(4, 2, 'No data', 'no-data', 'No data', '', '2020-03-17 21:08:09', '2020-03-17 21:08:09'),
(5, 1, 'Przycisk wyślij', 'send', 'Wyślij', '', '2020-03-17 21:08:09', '2020-03-17 21:08:09'),
(6, 1, 'Nazwa', 'name', 'Nazwa', '', '2020-03-17 21:08:09', '2020-03-17 21:08:09'),
(7, 1, 'Nadawca', 'source', 'Nadawca', '', '2020-03-17 21:08:09', '2020-03-17 21:08:09'),
(8, 2, 'Send button', 'send', 'Send now', '', '2020-03-17 21:08:09', '2020-03-17 21:08:09'),
(9, 2, 'Name', 'name', 'name', '', '2020-03-17 21:08:09', '2020-03-17 21:08:09'),
(10, 2, 'From', 'source', 'from', '', '2020-03-17 21:08:09', '2020-03-17 21:08:09'),
(11, 1, 'Formularz błąd', 'form-error', 'Błąd wysyłania wiadomości', '', '2020-03-17 21:08:09', '2020-03-17 21:08:09'),
(12, 1, 'Formularz poprawny', 'form-ok', 'Wiadomość wysłana', '', '2020-03-17 21:08:09', '2020-03-17 21:08:09'),
(13, 2, 'Form error', 'form-error', 'Error sending form', '', '2020-03-17 21:08:09', '2020-03-17 21:08:09'),
(14, 2, 'Form ok', 'form-ok', 'Form send', '', '2020-03-17 21:08:09', '2020-03-17 21:08:09'),
(15, 1, 'Błąd captcha', 'captcha-error', 'Błąd obrazka', '', '2020-03-17 21:08:09', '2020-03-17 21:08:09'),
(16, 2, 'Captcha error', 'captcha-error', 'Captcha error', '', '2020-03-17 21:08:09', '2020-03-17 21:08:09'),
(17, 1, 'Captcha', 'captcha-text', 'Wpisz znaki', '', '2020-03-17 21:08:09', '2020-03-17 21:08:09'),
(18, 2, 'Captcha', 'captcha-text', 'Insert captcha', '', '2020-03-17 21:08:09', '2020-03-17 21:08:09');

--
-- Wyzwalacze `im_translation_system`
--
DROP TRIGGER IF EXISTS `im_translation_system_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_translation_system_insert_date_create` BEFORE INSERT ON `im_translation_system` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_translation_system_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_translation_system_insert_date_modify` BEFORE INSERT ON `im_translation_system` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_translation_system_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_translation_system_update_date_modify` BEFORE UPDATE ON `im_translation_system` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_type`
--

DROP TABLE IF EXISTS `im_type`;
CREATE TABLE IF NOT EXISTS `im_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `class` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `status` varchar(3) COLLATE utf8_polish_ci NOT NULL DEFAULT 'on',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_type`
--

INSERT INTO `im_type` (`type_id`, `name`, `class`, `status`, `description`, `date_create`, `date_modify`) VALUES
(1, 'Menu', 'col-12 animated bounceInLeft', 'on', '', '2020-03-17 21:55:57', '2020-04-04 12:24:00'),
(2, 'Logo', 'col-12', 'on', '', '2020-03-17 22:17:00', '2020-04-04 12:24:01'),
(3, 'Ekopaśnik', 'col-12 col-lg-4', 'on', '', '2020-03-18 18:02:36', '2020-04-18 11:30:15'),
(4, 'O mnie', 'd-none d-xl-block col-12 bg-success p-3', 'on', 'Position: absolute or fixed', '2020-03-25 10:06:05', '2020-04-04 12:24:02'),
(5, 'Treść', 'col-12', 'on', 'Dozwolony format HTML', '2020-03-26 19:45:35', '2020-04-04 12:24:03'),
(7, 'Media społecznościowe', 'col-12', 'on', '', '2020-03-26 21:56:23', '2020-04-04 12:24:03'),
(8, 'Tytuły w rzędzie', 'col-12', 'on', '', '2020-03-28 18:48:29', '2020-04-04 12:24:04'),
(9, 'Lifestyle', 'col-12 col-lg-4', 'on', '', '2020-03-30 10:18:36', '2020-04-18 11:30:27'),
(10, 'Podróże', 'col-12 col-lg-4', 'on', '', '2020-03-30 10:45:54', '2020-04-18 11:30:34'),
(11, 'Tytuły w kolumnie', 'col-12', 'on', '', '2020-03-30 11:12:12', '2020-04-04 12:24:06'),
(12, 'Składniki', 'col-12', 'on', '', '2020-04-19 10:53:37', '2020-04-19 10:54:59'),
(13, 'Ekopaśnik - sekcja', 'col-12', 'on', '', '2020-04-19 11:11:38', '2020-04-19 11:11:46');

--
-- Wyzwalacze `im_type`
--
DROP TRIGGER IF EXISTS `im_type_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_type_insert_date_create` BEFORE INSERT ON `im_type` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_type_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_type_insert_date_modify` BEFORE INSERT ON `im_type` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_type_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_type_update_date_modify` BEFORE UPDATE ON `im_type` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_type_property`
--

DROP TABLE IF EXISTS `im_type_property`;
CREATE TABLE IF NOT EXISTS `im_type_property` (
  `type_property_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `class` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `class_field` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `position` int(11) DEFAULT '0',
  `status` varchar(3) COLLATE utf8_polish_ci NOT NULL DEFAULT 'on',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`type_property_id`),
  KEY `type_id` (`type_id`),
  KEY `property_id` (`property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_type_property`
--

INSERT INTO `im_type_property` (`type_property_id`, `type_id`, `property_id`, `class`, `class_field`, `position`, `status`, `description`, `date_create`, `date_modify`) VALUES
(1, 1, 7, 'col-12', 'navbar navbar-expand-lg navbar-light', 1, 'on', '', '2020-03-17 21:56:04', '2020-03-17 22:08:29'),
(2, 2, 4, 'col-12 text-center pt-5', '', 1, 'on', '', '2020-03-17 22:17:21', '2020-03-30 10:42:07'),
(3, 3, 4, 'col-12', '', 1, 'on', '', '2020-03-18 18:06:34', '2020-03-18 20:40:15'),
(4, 3, 1, 'col-12 text-center title p-3 text-success font-weight-bold', '', 2, 'on', '', '2020-03-18 18:06:53', '2020-03-18 20:46:00'),
(5, 3, 2, 'col-12 text text-justify', '', 4, 'on', '', '2020-03-18 18:07:06', '2020-03-18 20:52:36'),
(6, 3, 5, 'col-12 text-center', 'btn btn-success', 5, 'on', '', '2020-03-18 18:07:23', '2020-03-30 10:34:11'),
(7, 3, 12, 'col-12 text-center', '', 3, 'on', '', '2020-03-18 20:40:06', '2020-03-18 20:40:28'),
(8, 4, 4, 'col-12', '', 1, 'on', '', '2020-03-25 10:07:50', '2020-03-25 11:37:24'),
(9, 4, 1, 'col-12 text-white text-center p-1', '', 2, 'on', '', '2020-03-25 10:08:02', '2020-03-25 13:49:08'),
(10, 4, 2, 'col-12 text-white text-justify', '', 3, 'on', '', '2020-03-25 10:08:36', '2020-03-25 13:48:32'),
(11, 5, 2, 'col-12', '', 1, 'on', '', '2020-03-26 19:46:17', '2020-03-26 20:03:49'),
(13, 7, 8, 'col-12', '', 1, 'on', '', '2020-03-26 21:56:56', '2020-03-26 21:59:04'),
(14, 8, 1, 'col-12', '', 1, 'on', '', '2020-03-28 18:49:18', '2020-03-30 10:42:38'),
(16, 9, 1, 'col-12 text-center title p-3 text-success font-weight-bold', '', 2, 'on', '', '2020-03-30 10:19:54', '2020-03-30 10:29:42'),
(17, 9, 12, 'col-12 text-center', '', 3, 'on', '', '2020-03-30 10:20:09', '2020-03-30 10:29:42'),
(18, 9, 2, 'col-12 text text-justify', '', 4, 'on', '', '2020-03-30 10:20:15', '2020-03-30 10:29:42'),
(19, 9, 5, 'col-12 text-center', 'btn btn-success', 5, 'on', '', '2020-03-30 10:20:21', '2020-03-30 10:33:56'),
(20, 10, 4, 'col-12', '', 1, 'on', '', '2020-03-30 10:46:17', '2020-04-06 09:22:55'),
(21, 10, 1, 'col-12 text-center title p-3 text-success font-weight-bold', '', 2, 'on', '', '2020-03-30 10:46:23', '2020-03-30 10:47:05'),
(22, 10, 12, 'col-12 text-center', '', 3, 'on', '', '2020-03-30 10:46:29', '2020-03-30 10:47:14'),
(23, 10, 2, 'col-12 text text-justify', '', 4, 'on', '', '2020-03-30 10:46:38', '2020-03-30 10:47:23'),
(24, 10, 5, 'col-12 text-center', 'btn btn-success', 5, 'on', '', '2020-03-30 10:46:45', '2020-03-30 10:57:26'),
(25, 11, 1, '', '', 1, 'on', '', '2020-03-30 11:12:36', '2020-03-30 11:52:20'),
(26, 12, 4, 'col-12 col-lg-4', '', 3, 'on', '', '2020-04-19 10:54:05', '2020-04-19 10:58:33'),
(27, 12, 2, 'col-12 col-lg-8 text text-justify', '', 4, 'on', '', '2020-04-19 10:54:37', '2020-04-19 11:02:16'),
(28, 12, 1, 'col-12 text-center title p-3 text-success font-weight-bold', '', 1, 'on', '', '2020-04-19 10:55:31', '2020-04-19 11:00:43'),
(29, 12, 12, 'col-12 text-center', '', 2, 'on', '', '2020-04-19 10:56:24', '2020-04-19 10:56:38'),
(31, 13, 12, 'col-12 text-center', '', 2, 'on', '', '2020-04-19 11:12:53', '2020-04-19 11:12:59'),
(32, 13, 4, 'col-12 col-lg-4', '', 3, 'on', '', '2020-04-19 11:13:18', '2020-04-19 11:13:22'),
(33, 13, 2, 'col-12 col-lg-8 text text-justify', '', 4, 'on', '', '2020-04-19 11:13:56', '2020-04-19 11:13:59');

--
-- Wyzwalacze `im_type_property`
--
DROP TRIGGER IF EXISTS `im_type_property_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_type_property_insert_date_create` BEFORE INSERT ON `im_type_property` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_type_property_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_type_property_insert_date_modify` BEFORE INSERT ON `im_type_property` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_type_property_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_type_property_update_date_modify` BEFORE UPDATE ON `im_type_property` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `im_category`
--
ALTER TABLE `im_category`
  ADD CONSTRAINT `im_category_ibfk_1` FOREIGN KEY (`label_id`) REFERENCES `im_label` (`label_id`);

--
-- Ograniczenia dla tabeli `im_label_section`
--
ALTER TABLE `im_label_section`
  ADD CONSTRAINT `im_label_section_ibfk_1` FOREIGN KEY (`label_id`) REFERENCES `im_label` (`label_id`);

--
-- Ograniczenia dla tabeli `im_object`
--
ALTER TABLE `im_object`
  ADD CONSTRAINT `im_object_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `im_type` (`type_id`),
  ADD CONSTRAINT `im_object_ibfk_2` FOREIGN KEY (`label_id`) REFERENCES `im_label` (`label_id`);

--
-- Ograniczenia dla tabeli `im_object_category`
--
ALTER TABLE `im_object_category`
  ADD CONSTRAINT `im_object_category_ibfk_1` FOREIGN KEY (`object_id`) REFERENCES `im_object` (`object_id`),
  ADD CONSTRAINT `im_object_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `im_category` (`category_id`);

--
-- Ograniczenia dla tabeli `im_object_file`
--
ALTER TABLE `im_object_file`
  ADD CONSTRAINT `im_object_file_ibfk_1` FOREIGN KEY (`object_id`) REFERENCES `im_object` (`object_id`),
  ADD CONSTRAINT `im_object_file_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `im_file` (`file_id`);

--
-- Ograniczenia dla tabeli `im_object_image`
--
ALTER TABLE `im_object_image`
  ADD CONSTRAINT `im_object_image_ibfk_1` FOREIGN KEY (`object_id`) REFERENCES `im_object` (`object_id`),
  ADD CONSTRAINT `im_object_image_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `im_image` (`image_id`);

--
-- Ograniczenia dla tabeli `im_object_source`
--
ALTER TABLE `im_object_source`
  ADD CONSTRAINT `im_object_source_ibfk_1` FOREIGN KEY (`object_id`) REFERENCES `im_object` (`object_id`),
  ADD CONSTRAINT `im_object_source_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `im_source` (`source_id`);

--
-- Ograniczenia dla tabeli `im_section_object`
--
ALTER TABLE `im_section_object`
  ADD CONSTRAINT `im_section_object_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `im_section` (`section_id`),
  ADD CONSTRAINT `im_section_object_ibfk_2` FOREIGN KEY (`object_id`) REFERENCES `im_object` (`object_id`);

--
-- Ograniczenia dla tabeli `im_translation`
--
ALTER TABLE `im_translation`
  ADD CONSTRAINT `im_translation_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `im_language` (`language_id`);

--
-- Ograniczenia dla tabeli `im_translation_system`
--
ALTER TABLE `im_translation_system`
  ADD CONSTRAINT `im_translation_system_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `im_language` (`language_id`);

--
-- Ograniczenia dla tabeli `im_type_property`
--
ALTER TABLE `im_type_property`
  ADD CONSTRAINT `im_type_property_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `im_type` (`type_id`),
  ADD CONSTRAINT `im_type_property_ibfk_2` FOREIGN KEY (`property_id`) REFERENCES `im_property` (`property_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
