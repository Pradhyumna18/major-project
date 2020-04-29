-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 24, 2000 at 04:01 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `currencydetection`
--
CREATE DATABASE IF NOT EXISTS `currencydetection` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `currencydetection`;

-- --------------------------------------------------------

--
-- Table structure for table `admins_traincurrencies`
--

CREATE TABLE IF NOT EXISTS `admins_traincurrencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currencyValue` int(11) NOT NULL,
  `country` varchar(200) NOT NULL,
  `imagesCurrency` varchar(100) NOT NULL,
  `currencyName` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `admins_traincurrencies`
--

INSERT INTO `admins_traincurrencies` (`id`, `currencyValue`, `country`, `imagesCurrency`, `currencyName`) VALUES
(1, 500, 'India', 'train/500rs.jpg', 'Rupees'),
(2, 1, 'china', 'train/1yen.jpg', 'yen'),
(3, 2000, 'India', 'train/download_3.jpg', 'rupee'),
(4, 50, 'India', 'train/download.jpg', 'rupee'),
(5, 100, 'Pakistan', 'train/1pakrupee.jpg', 'rupee');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add train currencies', 7, 'add_traincurrencies'),
(20, 'Can change train currencies', 7, 'change_traincurrencies'),
(21, 'Can delete train currencies', 7, 'delete_traincurrencies'),
(22, 'Can add user registration', 8, 'add_userregistration'),
(23, 'Can change user registration', 8, 'change_userregistration'),
(24, 'Can delete user registration', 8, 'delete_userregistration'),
(25, 'Can add curency check', 9, 'add_curencycheck'),
(26, 'Can change curency check', 9, 'change_curencycheck'),
(27, 'Can delete curency check', 9, 'delete_curencycheck');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(7, 'admins', 'traincurrencies'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(9, 'user', 'curencycheck'),
(8, 'user', 'userregistration');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2018-09-25 14:23:02.743164'),
(2, 'auth', '0001_initial', '2018-09-25 14:23:16.819335'),
(3, 'admin', '0001_initial', '2018-09-25 14:23:19.160156'),
(4, 'admin', '0002_logentry_remove_auto_add', '2018-09-25 14:23:19.222656'),
(5, 'admins', '0001_initial', '2018-09-25 14:23:19.566406'),
(6, 'contenttypes', '0002_remove_content_type_name', '2018-09-25 14:23:20.945312'),
(7, 'auth', '0002_alter_permission_name_max_length', '2018-09-25 14:23:21.723632'),
(8, 'auth', '0003_alter_user_email_max_length', '2018-09-25 14:23:22.691406'),
(9, 'auth', '0004_alter_user_username_opts', '2018-09-25 14:23:22.753906'),
(10, 'auth', '0005_alter_user_last_login_null', '2018-09-25 14:23:23.442382'),
(11, 'auth', '0006_require_contenttypes_0002', '2018-09-25 14:23:23.504882'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2018-09-25 14:23:23.536132'),
(13, 'auth', '0008_alter_user_username_max_length', '2018-09-25 14:23:24.460937'),
(14, 'sessions', '0001_initial', '2018-09-25 14:23:25.868164'),
(15, 'admins', '0002_auto_20180926_1124', '2018-09-26 05:54:37.910156'),
(16, 'user', '0001_initial', '2018-10-24 05:27:50.300501'),
(17, 'user', '0002_curencycheck', '2018-10-24 05:27:51.330103'),
(18, 'user', '0003_auto_20181024_1100', '2018-10-24 05:30:19.978367'),
(19, 'user', '0004_curencycheck_file_path', '2018-10-24 07:20:04.474230');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('pt84r0dt898i3c00s3i67ejhi4n28lu4', 'NTZhMWI2ZTM0MDhmODY1OWFjYTI3YWIxZDgwODljMzU4YmFhYjNhMTp7InVzZXJpZCI6MiwidXNlcm5hbWUiOiJnb2t1bCJ9', '2018-11-07 15:57:34.760854');

-- --------------------------------------------------------

--
-- Table structure for table `user_curencycheck`
--

CREATE TABLE IF NOT EXISTS `user_curencycheck` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `curency` varchar(200) NOT NULL,
  `country` varchar(200) NOT NULL,
  `currencyValue` varchar(200) NOT NULL,
  `curobj_id` int(11) NOT NULL,
  `file_path` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_curencycheck_curobj_id_66161911_fk_admins_tr` (`curobj_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `user_curencycheck`
--

INSERT INTO `user_curencycheck` (`id`, `curency`, `country`, `currencyValue`, `curobj_id`, `file_path`) VALUES
(1, 'rupee', 'India', '2000', 3, ''),
(2, 'rupee', 'India', '2000', 3, ''),
(3, 'rupee', 'India', '2000', 3, ''),
(4, 'rupee', 'India', '50', 4, ''),
(5, 'rupee', 'India', '2000', 3, ''),
(6, 'rupee', 'India', '2000', 3, ''),
(7, 'rupee', 'India', '2000', 3, ''),
(8, 'rupee', 'India', '2000', 3, '3'),
(9, 'rupee', 'India', '50', 4, 'download_vsyOUhq.jpg'),
(10, 'rupee', 'India', '2000', 3, 'download (3)_ESwCj7u.jpg'),
(11, 'rupee', 'India', '50', 4, 'download_Ejz2fAQ.jpg'),
(12, 'rupee', 'India', '50', 4, 'download_jH5Sgfe.jpg'),
(13, 'rupee', 'India', '2000', 3, 'D:\\python project path\\currencydetection\\assets/media/download (3)_EJ1INqX.jpg'),
(14, 'rupee', 'India', '2000', 3, 'D:\\python project path\\currencydetection\\assets/media/download (3)_BTljoXZ.jpg'),
(15, 'rupee', 'India', '2000', 3, 'D:\\python project path\\currencydetection\\assets/media/download (3)_nDMfzwT.jpg'),
(16, 'rupee', 'India', '50', 4, 'D:\\python project path\\currencydetection\\assets/media/download_0ifIazR.jpg'),
(17, 'rupee', 'India', '50', 4, 'D:\\python project path\\currencydetection\\assets/media/download_Yv1E2IU.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user_userregistration`
--

CREATE TABLE IF NOT EXISTS `user_userregistration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `password` varchar(50) NOT NULL,
  `mobilenum` int(11) NOT NULL,
  `emailId` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user_userregistration`
--

INSERT INTO `user_userregistration` (`id`, `username`, `password`, `mobilenum`, `emailId`, `location`) VALUES
(1, 'santhosh', '6789', 2147483647, '9789672189', 'chennai'),
(2, 'gokul', '123', 2147483647, '9685741230', 'chennai');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `user_curencycheck`
--
ALTER TABLE `user_curencycheck`
  ADD CONSTRAINT `user_curencycheck_curobj_id_66161911_fk_admins_tr` FOREIGN KEY (`curobj_id`) REFERENCES `admins_traincurrencies` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
