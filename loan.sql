-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: db
-- Tiempo de generación: 16-02-2019 a las 05:14:32
-- Versión del servidor: 10.3.12-MariaDB-1:10.3.12+maria~bionic
-- Versión de PHP: 7.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `loan`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activations`
--

CREATE TABLE `activations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `activations`
--

INSERT INTO `activations` (`id`, `user_id`, `code`, `completed`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Y2hF31pge2dqloBkzvQzV9fPFJVn9IeX', 1, '2019-01-18 21:23:49', '2019-01-18 21:23:49', '2019-01-18 21:23:49'),
(2, 2, 'omBvKLN63JAdb3TUHQeZOsWrh1yGX1Zw', 1, '2019-02-16 06:45:24', '2019-02-16 06:45:24', '2019-02-16 06:45:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `assets`
--

CREATE TABLE `assets` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `asset_type_id` int(11) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_price` decimal(65,4) DEFAULT NULL,
  `replacement_value` decimal(65,4) DEFAULT NULL,
  `serial_number` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `bought_from` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `files` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asset_types`
--

CREATE TABLE `asset_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` enum('current','fixed','intangible','investment','other') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asset_valuations`
--

CREATE TABLE `asset_valuations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `asset_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(65,4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `audit_trail`
--

CREATE TABLE `audit_trail` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `module` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `audit_trail`
--

INSERT INTO `audit_trail` (`id`, `user_id`, `user`, `module`, `notes`, `created_at`, `updated_at`, `branch_id`) VALUES
(1, 1, 'Admin Admin', NULL, 'Logged in to system', '2019-01-18 21:24:13', '2019-01-18 21:24:13', NULL),
(2, 1, 'Admin Admin', NULL, 'Updated Settings', '2019-01-19 00:08:03', '2019-01-19 00:08:03', 1),
(3, 1, 'Admin Admin', NULL, 'Logged out of system', '2019-01-19 00:34:51', '2019-01-19 00:34:51', 1),
(4, 1, 'Admin Admin', NULL, 'Logged in to system', '2019-01-19 02:02:40', '2019-01-19 02:02:40', 1),
(5, 1, 'Admin Admin', NULL, 'Logged in to system', '2019-01-19 02:03:15', '2019-01-19 02:03:15', 1),
(6, 1, 'Admin Admin', NULL, 'Logged in to system', '2019-01-19 02:03:24', '2019-01-19 02:03:24', 1),
(7, 1, 'Admin Admin', NULL, 'Added borrower  with id:2', '2019-01-19 02:06:53', '2019-01-19 02:06:53', 1),
(8, 1, 'Admin Admin', NULL, 'Added product with id:1', '2019-01-19 02:09:45', '2019-01-19 02:09:45', 1),
(9, 1, 'Admin Admin', NULL, 'Logged in to system', '2019-01-19 05:14:42', '2019-01-19 05:14:42', NULL),
(10, 1, 'Admin Admin', NULL, 'Logged in to system', '2019-01-19 06:17:09', '2019-01-19 06:17:09', NULL),
(11, 1, 'Admin Admin', NULL, 'Updated Settings', '2019-01-19 08:11:52', '2019-01-19 08:11:52', 1),
(12, 1, 'Admin Admin', NULL, 'Logged in to system', '2019-02-14 17:52:32', '2019-02-14 17:52:32', NULL),
(13, 1, 'Admin Admin', NULL, 'Logged in to system', '2019-02-14 23:23:12', '2019-02-14 23:23:12', NULL),
(14, 1, 'Admin Admin', NULL, 'Logged in to system', '2019-02-15 19:26:23', '2019-02-15 19:26:23', NULL),
(15, 1, 'Admin Admin', NULL, 'Logged in to system', '2019-02-15 19:33:08', '2019-02-15 19:33:08', NULL),
(16, 1, 'Admin Admin', NULL, 'Updated Settings', '2019-02-15 20:15:40', '2019-02-15 20:15:40', 1),
(17, 1, 'Admin Admin', NULL, 'Logged out of system', '2019-02-15 20:33:56', '2019-02-15 20:33:56', 1),
(18, 1, 'Admin Admin', NULL, 'Logged in to system', '2019-02-16 06:43:11', '2019-02-16 06:43:11', NULL),
(19, 1, 'Admin Admin', NULL, 'Added user with id:2', '2019-02-16 06:45:24', '2019-02-16 06:45:24', 1),
(20, 1, 'Admin Admin', NULL, 'Logged out of system', '2019-02-16 06:46:38', '2019-02-16 06:46:38', 1),
(21, 2, 'Kevin Zepeda', NULL, 'Logged in to system', '2019-02-16 06:47:25', '2019-02-16 06:47:25', 1),
(22, 2, 'Kevin Zepeda', NULL, 'Logged out of system', '2019-02-16 06:48:02', '2019-02-16 06:48:02', 2),
(23, 2, 'Kevin Zepeda', NULL, 'Logged in to system', '2019-02-16 06:48:26', '2019-02-16 06:48:26', 2),
(24, 2, 'Kevin Zepeda', NULL, 'Logged in to system', '2019-02-16 07:01:01', '2019-02-16 07:01:01', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `borrowers`
--

CREATE TABLE `borrowers` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` enum('Male','Female') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Male',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unique_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `business_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `working_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `files` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `loan_officers` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source` enum('online','admin') COLLATE utf8_unicode_ci DEFAULT 'admin',
  `active` tinyint(4) DEFAULT 1,
  `blacklisted` tinyint(4) DEFAULT 0,
  `branch_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `borrowers`
--

INSERT INTO `borrowers` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `title`, `mobile`, `email`, `unique_number`, `dob`, `address`, `city`, `state`, `zip`, `phone`, `business_name`, `working_status`, `photo`, `notes`, `files`, `loan_officers`, `created_at`, `updated_at`, `deleted_at`, `username`, `password`, `month`, `year`, `source`, `active`, `blacklisted`, `branch_id`, `country_id`) VALUES
(1, NULL, 'sdfsdf', 'sdfsdf', 'Male', NULL, '55555555', 'fdsfsdf@fsdfsdf.sdf', NULL, '2019-01-25', NULL, NULL, NULL, NULL, NULL, NULL, 'Employee', NULL, NULL, 'a:0:{}', NULL, '2019-01-18 23:13:29', '2019-01-18 23:13:29', NULL, 'fdsfdsf', 'e1996e71732d2ba7db7f2b462ac44e3e', '01', '2019', 'online', 0, 0, NULL, NULL),
(2, 1, 'kevin', 'Zepeda', 'Male', 'Mr', '5560478121', 'ke@vin.cc', '86368113', '1996-03-23', 'asdasd', 'CDMX', 'Cuautècmoc', '06200', '458636813', 'Fabela', 'Employee', NULL, NULL, 'a:0:{}', 'a:1:{i:0;s:1:\"1\";}', '2019-01-19 02:06:53', '2019-01-19 02:06:53', NULL, NULL, NULL, '01', '2019', 'admin', 1, 0, 1, 142),
(3, NULL, 'klgsd', 'klfgk', 'Male', NULL, '5656566', 'admin@example.com', NULL, '2019-02-28', NULL, NULL, NULL, NULL, NULL, NULL, 'Employee', NULL, NULL, 'a:0:{}', NULL, '2019-02-15 20:35:48', '2019-02-15 20:35:48', NULL, 'jhjhkjhjkh', '66860f679f1b7a00b202d77b4fc91f7b', '02', '2019', 'online', 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `borrower_groups`
--

CREATE TABLE `borrower_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assigned_borrowers` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `borrower_group_members`
--

CREATE TABLE `borrower_group_members` (
  `id` int(10) UNSIGNED NOT NULL,
  `borrower_group_id` int(11) DEFAULT NULL,
  `borrower_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `branches`
--

CREATE TABLE `branches` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assigned_users` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_branch` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `branches`
--

INSERT INTO `branches` (`id`, `name`, `assigned_users`, `notes`, `default_branch`) VALUES
(1, 'Default', NULL, NULL, 1),
(2, 'Principal', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `branch_users`
--

CREATE TABLE `branch_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `branch_users`
--

INSERT INTO `branch_users` (`id`, `branch_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2019-01-18 21:23:50', '2019-01-18 21:23:50'),
(2, 2, 2, '2019-02-16 06:46:18', '2019-02-16 06:46:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capital`
--

CREATE TABLE `capital` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `bank_account_id` int(11) DEFAULT NULL,
  `type` enum('withdrawal','deposit') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'deposit',
  `loan_id` int(11) DEFAULT NULL,
  `expense_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `credit_account_id` int(11) DEFAULT NULL,
  `debit_account_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `charges`
--

CREATE TABLE `charges` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product` enum('loan','savings') COLLATE utf8_unicode_ci NOT NULL,
  `charge_type` enum('disbursement','specified_due_date','installment_fee','overdue_installment_fee','loan_rescheduling_fee','overdue_maturity','savings_activation','withdrawal_fee','annual_fee','monthly_fee') COLLATE utf8_unicode_ci NOT NULL,
  `charge_option` enum('fixed','percentage','principal_due','principal_interest','interest_due','total_due','original_principal') COLLATE utf8_unicode_ci NOT NULL,
  `charge_frequency` tinyint(4) NOT NULL DEFAULT 0,
  `charge_frequency_type` enum('days','weeks','months','years') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'days',
  `charge_frequency_amount` int(11) NOT NULL DEFAULT 0,
  `amount` decimal(65,2) DEFAULT NULL,
  `charge_payment_mode` enum('regular','account_transfer') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'regular',
  `currency_id` int(11) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `penalty` tinyint(4) NOT NULL DEFAULT 0,
  `override` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chart_of_accounts`
--

CREATE TABLE `chart_of_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `gl_code` int(11) DEFAULT NULL,
  `account_type` enum('asset','expense','equity','liability','income') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'asset',
  `allow_manual` tinyint(4) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `collateral`
--

CREATE TABLE `collateral` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `loan_id` int(10) UNSIGNED DEFAULT NULL,
  `borrower_id` int(10) UNSIGNED DEFAULT NULL,
  `collateral_type_id` int(10) UNSIGNED DEFAULT NULL,
  `value` decimal(65,4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('returned_to_borrower','repossessed','repossession_initiated','sold','lost','collateral_with_borrower','deposited_into_branch') COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `files` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `serial_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufacture_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `collateral_types`
--

CREATE TABLE `collateral_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `sortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `countries`
--

INSERT INTO `countries` (`id`, `sortname`, `name`) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'AL', 'Albania'),
(3, 'DZ', 'Algeria'),
(4, 'AS', 'American Samoa'),
(5, 'AD', 'Andorra'),
(6, 'AO', 'Angola'),
(7, 'AI', 'Anguilla'),
(8, 'AQ', 'Antarctica'),
(9, 'AG', 'Antigua And Barbuda'),
(10, 'AR', 'Argentina'),
(11, 'AM', 'Armenia'),
(12, 'AW', 'Aruba'),
(13, 'AU', 'Australia'),
(14, 'AT', 'Austria'),
(15, 'AZ', 'Azerbaijan'),
(16, 'BS', 'Bahamas The'),
(17, 'BH', 'Bahrain'),
(18, 'BD', 'Bangladesh'),
(19, 'BB', 'Barbados'),
(20, 'BY', 'Belarus'),
(21, 'BE', 'Belgium'),
(22, 'BZ', 'Belize'),
(23, 'BJ', 'Benin'),
(24, 'BM', 'Bermuda'),
(25, 'BT', 'Bhutan'),
(26, 'BO', 'Bolivia'),
(27, 'BA', 'Bosnia and Herzegovina'),
(28, 'BW', 'Botswana'),
(29, 'BV', 'Bouvet Island'),
(30, 'BR', 'Brazil'),
(31, 'IO', 'British Indian Ocean Territory'),
(32, 'BN', 'Brunei'),
(33, 'BG', 'Bulgaria'),
(34, 'BF', 'Burkina Faso'),
(35, 'BI', 'Burundi'),
(36, 'KH', 'Cambodia'),
(37, 'CM', 'Cameroon'),
(38, 'CA', 'Canada'),
(39, 'CV', 'Cape Verde'),
(40, 'KY', 'Cayman Islands'),
(41, 'CF', 'Central African Republic'),
(42, 'TD', 'Chad'),
(43, 'CL', 'Chile'),
(44, 'CN', 'China'),
(45, 'CX', 'Christmas Island'),
(46, 'CC', 'Cocos (Keeling) Islands'),
(47, 'CO', 'Colombia'),
(48, 'KM', 'Comoros'),
(49, 'CG', 'Congo'),
(50, 'CD', 'Congo The Democratic Republic Of The'),
(51, 'CK', 'Cook Islands'),
(52, 'CR', 'Costa Rica'),
(53, 'CI', 'Cote D\'Ivoire (Ivory Coast)'),
(54, 'HR', 'Croatia (Hrvatska)'),
(55, 'CU', 'Cuba'),
(56, 'CY', 'Cyprus'),
(57, 'CZ', 'Czech Republic'),
(58, 'DK', 'Denmark'),
(59, 'DJ', 'Djibouti'),
(60, 'DM', 'Dominica'),
(61, 'DO', 'Dominican Republic'),
(62, 'TP', 'East Timor'),
(63, 'EC', 'Ecuador'),
(64, 'EG', 'Egypt'),
(65, 'SV', 'El Salvador'),
(66, 'GQ', 'Equatorial Guinea'),
(67, 'ER', 'Eritrea'),
(68, 'EE', 'Estonia'),
(69, 'ET', 'Ethiopia'),
(70, 'XA', 'External Territories of Australia'),
(71, 'FK', 'Falkland Islands'),
(72, 'FO', 'Faroe Islands'),
(73, 'FJ', 'Fiji Islands'),
(74, 'FI', 'Finland'),
(75, 'FR', 'France'),
(76, 'GF', 'French Guiana'),
(77, 'PF', 'French Polynesia'),
(78, 'TF', 'French Southern Territories'),
(79, 'GA', 'Gabon'),
(80, 'GM', 'Gambia The'),
(81, 'GE', 'Georgia'),
(82, 'DE', 'Germany'),
(83, 'GH', 'Ghana'),
(84, 'GI', 'Gibraltar'),
(85, 'GR', 'Greece'),
(86, 'GL', 'Greenland'),
(87, 'GD', 'Grenada'),
(88, 'GP', 'Guadeloupe'),
(89, 'GU', 'Guam'),
(90, 'GT', 'Guatemala'),
(91, 'XU', 'Guernsey and Alderney'),
(92, 'GN', 'Guinea'),
(93, 'GW', 'Guinea-Bissau'),
(94, 'GY', 'Guyana'),
(95, 'HT', 'Haiti'),
(96, 'HM', 'Heard and McDonald Islands'),
(97, 'HN', 'Honduras'),
(98, 'HK', 'Hong Kong S.A.R.'),
(99, 'HU', 'Hungary'),
(100, 'IS', 'Iceland'),
(101, 'IN', 'India'),
(102, 'ID', 'Indonesia'),
(103, 'IR', 'Iran'),
(104, 'IQ', 'Iraq'),
(105, 'IE', 'Ireland'),
(106, 'IL', 'Israel'),
(107, 'IT', 'Italy'),
(108, 'JM', 'Jamaica'),
(109, 'JP', 'Japan'),
(110, 'XJ', 'Jersey'),
(111, 'JO', 'Jordan'),
(112, 'KZ', 'Kazakhstan'),
(113, 'KE', 'Kenya'),
(114, 'KI', 'Kiribati'),
(115, 'KP', 'Korea North'),
(116, 'KR', 'Korea South'),
(117, 'KW', 'Kuwait'),
(118, 'KG', 'Kyrgyzstan'),
(119, 'LA', 'Laos'),
(120, 'LV', 'Latvia'),
(121, 'LB', 'Lebanon'),
(122, 'LS', 'Lesotho'),
(123, 'LR', 'Liberia'),
(124, 'LY', 'Libya'),
(125, 'LI', 'Liechtenstein'),
(126, 'LT', 'Lithuania'),
(127, 'LU', 'Luxembourg'),
(128, 'MO', 'Macau S.A.R.'),
(129, 'MK', 'Macedonia'),
(130, 'MG', 'Madagascar'),
(131, 'MW', 'Malawi'),
(132, 'MY', 'Malaysia'),
(133, 'MV', 'Maldives'),
(134, 'ML', 'Mali'),
(135, 'MT', 'Malta'),
(136, 'XM', 'Man (Isle of)'),
(137, 'MH', 'Marshall Islands'),
(138, 'MQ', 'Martinique'),
(139, 'MR', 'Mauritania'),
(140, 'MU', 'Mauritius'),
(141, 'YT', 'Mayotte'),
(142, 'MX', 'Mexico'),
(143, 'FM', 'Micronesia'),
(144, 'MD', 'Moldova'),
(145, 'MC', 'Monaco'),
(146, 'MN', 'Mongolia'),
(147, 'MS', 'Montserrat'),
(148, 'MA', 'Morocco'),
(149, 'MZ', 'Mozambique'),
(150, 'MM', 'Myanmar'),
(151, 'NA', 'Namibia'),
(152, 'NR', 'Nauru'),
(153, 'NP', 'Nepal'),
(154, 'AN', 'Netherlands Antilles'),
(155, 'NL', 'Netherlands The'),
(156, 'NC', 'New Caledonia'),
(157, 'NZ', 'New Zealand'),
(158, 'NI', 'Nicaragua'),
(159, 'NE', 'Niger'),
(160, 'NG', 'Nigeria'),
(161, 'NU', 'Niue'),
(162, 'NF', 'Norfolk Island'),
(163, 'MP', 'Northern Mariana Islands'),
(164, 'NO', 'Norway'),
(165, 'OM', 'Oman'),
(166, 'PK', 'Pakistan'),
(167, 'PW', 'Palau'),
(168, 'PS', 'Palestinian Territory Occupied'),
(169, 'PA', 'Panama'),
(170, 'PG', 'Papua new Guinea'),
(171, 'PY', 'Paraguay'),
(172, 'PE', 'Peru'),
(173, 'PH', 'Philippines'),
(174, 'PN', 'Pitcairn Island'),
(175, 'PL', 'Poland'),
(176, 'PT', 'Portugal'),
(177, 'PR', 'Puerto Rico'),
(178, 'QA', 'Qatar'),
(179, 'RE', 'Reunion'),
(180, 'RO', 'Romania'),
(181, 'RU', 'Russia'),
(182, 'RW', 'Rwanda'),
(183, 'SH', 'Saint Helena'),
(184, 'KN', 'Saint Kitts And Nevis'),
(185, 'LC', 'Saint Lucia'),
(186, 'PM', 'Saint Pierre and Miquelon'),
(187, 'VC', 'Saint Vincent And The Grenadines'),
(188, 'WS', 'Samoa'),
(189, 'SM', 'San Marino'),
(190, 'ST', 'Sao Tome and Principe'),
(191, 'SA', 'Saudi Arabia'),
(192, 'SN', 'Senegal'),
(193, 'RS', 'Serbia'),
(194, 'SC', 'Seychelles'),
(195, 'SL', 'Sierra Leone'),
(196, 'SG', 'Singapore'),
(197, 'SK', 'Slovakia'),
(198, 'SI', 'Slovenia'),
(199, 'XG', 'Smaller Territories of the UK'),
(200, 'SB', 'Solomon Islands'),
(201, 'SO', 'Somalia'),
(202, 'ZA', 'South Africa'),
(203, 'GS', 'South Georgia'),
(204, 'SS', 'South Sudan'),
(205, 'ES', 'Spain'),
(206, 'LK', 'Sri Lanka'),
(207, 'SD', 'Sudan'),
(208, 'SR', 'Suriname'),
(209, 'SJ', 'Svalbard And Jan Mayen Islands'),
(210, 'SZ', 'Swaziland'),
(211, 'SE', 'Sweden'),
(212, 'CH', 'Switzerland'),
(213, 'SY', 'Syria'),
(214, 'TW', 'Taiwan'),
(215, 'TJ', 'Tajikistan'),
(216, 'TZ', 'Tanzania'),
(217, 'TH', 'Thailand'),
(218, 'TG', 'Togo'),
(219, 'TK', 'Tokelau'),
(220, 'TO', 'Tonga'),
(221, 'TT', 'Trinidad And Tobago'),
(222, 'TN', 'Tunisia'),
(223, 'TR', 'Turkey'),
(224, 'TM', 'Turkmenistan'),
(225, 'TC', 'Turks And Caicos Islands'),
(226, 'TV', 'Tuvalu'),
(227, 'UG', 'Uganda'),
(228, 'UA', 'Ukraine'),
(229, 'AE', 'United Arab Emirates'),
(230, 'GB', 'United Kingdom'),
(231, 'US', 'United States'),
(232, 'UM', 'United States Minor Outlying Islands'),
(233, 'UY', 'Uruguay'),
(234, 'UZ', 'Uzbekistan'),
(235, 'VU', 'Vanuatu'),
(236, 'VA', 'Vatican City State (Holy See)'),
(237, 'VE', 'Venezuela'),
(238, 'VN', 'Vietnam'),
(239, 'VG', 'Virgin Islands (British)'),
(240, 'VI', 'Virgin Islands (US)'),
(241, 'WF', 'Wallis And Futuna Islands'),
(242, 'EH', 'Western Sahara'),
(243, 'YE', 'Yemen'),
(244, 'YU', 'Yugoslavia'),
(245, 'ZM', 'Zambia'),
(246, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `rate` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `symbol` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` enum('left','right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'left'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `currencies`
--

INSERT INTO `currencies` (`id`, `user_id`, `rate`, `code`, `name`, `symbol`, `position`) VALUES
(1, NULL, '1.00', 'USD', 'United States dollar', '$', 'left');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_type` enum('number','textfield','date','decimal','textarea') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'textfield',
  `required` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `custom_fields_meta`
--

CREATE TABLE `custom_fields_meta` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `custom_field_id` int(11) DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `emails`
--

CREATE TABLE `emails` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `recipients` int(10) UNSIGNED NOT NULL,
  `send_to` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expenses`
--

CREATE TABLE `expenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `expense_type_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` decimal(65,4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recurring` tinyint(4) NOT NULL DEFAULT 0,
  `recur_frequency` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '31',
  `recur_start_date` date DEFAULT NULL,
  `recur_end_date` date DEFAULT NULL,
  `recur_next_date` date DEFAULT NULL,
  `recur_type` enum('day','week','month','year') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'month',
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `files` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `chart_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expense_types`
--

CREATE TABLE `expense_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guarantor`
--

CREATE TABLE `guarantor` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `loan_application_id` int(11) DEFAULT NULL,
  `loan_id` int(11) DEFAULT NULL,
  `borrower_id` int(11) DEFAULT NULL,
  `guarantor_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `saving_amount` decimal(10,2) DEFAULT NULL,
  `accepted_amount` decimal(10,2) DEFAULT NULL,
  `status` enum('pending','accepted','declined') COLLATE utf8_unicode_ci DEFAULT 'pending',
  `saving_status` enum('pending','hold','restored') COLLATE utf8_unicode_ci DEFAULT 'pending',
  `saving_restored` tinyint(4) NOT NULL DEFAULT 0,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(10) UNSIGNED DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` enum('Male','Female') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Male',
  `country_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unique_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `business_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `working_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `files` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `journal_entries`
--

CREATE TABLE `journal_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `transaction_type` enum('repayment','disbursement','accrual','deposit','withdrawal','manual_entry','pay_charge','transfer_fund','expense','payroll','income','fee','penalty','interest','dividend','guarantee','close_write_off','repayment_disbursement','repayment_recovery','interest_accrual','fee_accrual') COLLATE utf8_unicode_ci DEFAULT 'repayment',
  `name` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `gl_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reference` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `borrower_id` int(11) DEFAULT NULL,
  `loan_id` int(11) DEFAULT NULL,
  `expense_id` int(11) DEFAULT NULL,
  `capital_id` int(11) DEFAULT NULL,
  `income_id` int(11) DEFAULT NULL,
  `payroll_id` int(11) DEFAULT NULL,
  `savings_id` int(11) DEFAULT NULL,
  `loan_repayment_id` int(11) DEFAULT NULL,
  `debit` decimal(65,4) DEFAULT NULL,
  `credit` decimal(65,4) DEFAULT NULL,
  `balance` decimal(65,4) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `loan_transaction_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `transaction_sub_type` enum('overpayment','repayment_interest','repayment_principal','repayment_fees','repayment_penalty') COLLATE utf8_unicode_ci DEFAULT NULL,
  `reversed` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loans`
--

CREATE TABLE `loans` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `borrower_id` int(11) NOT NULL,
  `loan_product_id` int(11) NOT NULL,
  `reference` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `maturity_date` date DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interest_start_date` date DEFAULT NULL,
  `first_payment_date` date DEFAULT NULL,
  `loan_disbursed_by_id` int(11) DEFAULT NULL,
  `principal` decimal(65,4) DEFAULT NULL,
  `interest_method` enum('flat_rate','declining_balance_equal_installments','declining_balance_equal_principal','interest_only','compound_interest') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'flat_rate',
  `interest_rate` decimal(10,4) DEFAULT NULL,
  `interest_period` enum('day','week','month','year') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'day',
  `override_interest` tinyint(4) NOT NULL DEFAULT 0,
  `override_interest_amount` decimal(10,4) DEFAULT 0.0000,
  `loan_duration` int(11) DEFAULT NULL,
  `loan_duration_type` enum('day','week','month','year') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'year',
  `repayment_cycle` enum('daily','weekly','monthly','bi_monthly','quarterly','semi_annually','annually') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'monthly',
  `decimal_places` enum('round_off_to_two_decimal','round_off_to_integer') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'round_off_to_two_decimal',
  `repayment_order` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `loan_fees_schedule` enum('dont_include','distribute_fees_evenly','charge_fees_on_released_date','charge_fees_on_first_payment','charge_fees_on_last_payment') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'distribute_fees_evenly',
  `grace_on_interest_charged` int(11) DEFAULT NULL,
  `loan_status_id` int(11) DEFAULT NULL,
  `files` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `loan_status` enum('open','fully_paid','defaulted','restructured','processing') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `balance` decimal(65,4) DEFAULT NULL,
  `override` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` enum('pending','approved','disbursed','declined','withdrawn','written_off','closed','pending_reschedule','rescheduled') COLLATE utf8_unicode_ci DEFAULT 'pending',
  `applied_amount` decimal(65,4) DEFAULT NULL,
  `approved_amount` decimal(65,4) DEFAULT NULL,
  `approved_notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `disbursed_notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `withdrawn_notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `closed_notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rescheduled_notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `declined_notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `written_off_notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `approved_date` date DEFAULT NULL,
  `disbursed_date` date DEFAULT NULL,
  `withdrawn_date` date DEFAULT NULL,
  `closed_date` date DEFAULT NULL,
  `rescheduled_date` date DEFAULT NULL,
  `declined_date` date DEFAULT NULL,
  `written_off_date` date DEFAULT NULL,
  `approved_by_id` int(11) DEFAULT NULL,
  `disbursed_by_id` int(11) DEFAULT NULL,
  `withdrawn_by_id` int(11) DEFAULT NULL,
  `declined_by_id` int(11) DEFAULT NULL,
  `written_off_by_id` int(11) DEFAULT NULL,
  `rescheduled_by_id` int(11) DEFAULT NULL,
  `closed_by_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `processing_fee` decimal(65,4) DEFAULT NULL,
  `product_check_out_id` int(11) DEFAULT NULL,
  `loan_officer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loan_applications`
--

CREATE TABLE `loan_applications` (
  `id` int(10) UNSIGNED NOT NULL,
  `borrower_id` int(10) UNSIGNED DEFAULT NULL,
  `loan_product_id` int(11) NOT NULL,
  `amount` decimal(65,4) DEFAULT NULL,
  `status` enum('approved','pending','declined') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loan_charges`
--

CREATE TABLE `loan_charges` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `charge_id` int(11) DEFAULT NULL,
  `loan_id` int(11) DEFAULT NULL,
  `amount` decimal(65,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `grace_period` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loan_comments`
--

CREATE TABLE `loan_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `loan_id` int(10) UNSIGNED NOT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loan_disbursed_by`
--

CREATE TABLE `loan_disbursed_by` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `loan_disbursed_by`
--

INSERT INTO `loan_disbursed_by` (`id`, `name`) VALUES
(1, 'TELMEX');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loan_fees`
--

CREATE TABLE `loan_fees` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `loan_fee_type` enum('fixed','percentage') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loan_fees_meta`
--

CREATE TABLE `loan_fees_meta` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `loan_fees_id` int(11) DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `loan_fees_schedule` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loan_guarantors`
--

CREATE TABLE `loan_guarantors` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `loan_id` int(10) UNSIGNED DEFAULT NULL,
  `borrower_id` int(10) UNSIGNED DEFAULT NULL,
  `guarantor_id` int(10) UNSIGNED DEFAULT NULL,
  `loan_application_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loan_overdue_penalties`
--

CREATE TABLE `loan_overdue_penalties` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` enum('fixed','percentage') COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(65,2) DEFAULT NULL,
  `days` int(11) NOT NULL DEFAULT 10,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loan_products`
--

CREATE TABLE `loan_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `loan_disbursed_by_id` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `minimum_principal` decimal(65,4) DEFAULT NULL,
  `default_principal` decimal(65,4) DEFAULT NULL,
  `maximum_principal` decimal(65,4) DEFAULT NULL,
  `interest_method` enum('flat_rate','declining_balance_equal_installments','declining_balance_equal_principal','interest_only','compound_interest') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'flat_rate',
  `interest_rate` decimal(10,4) DEFAULT NULL,
  `interest_period` enum('day','week','month','year') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'year',
  `minimum_interest_rate` decimal(10,4) DEFAULT NULL,
  `default_interest_rate` decimal(10,4) DEFAULT NULL,
  `maximum_interest_rate` decimal(10,4) DEFAULT NULL,
  `override_interest` tinyint(4) NOT NULL DEFAULT 0,
  `override_interest_amount` decimal(10,4) NOT NULL DEFAULT 0.0000,
  `default_loan_duration` int(11) DEFAULT NULL,
  `default_loan_duration_type` enum('day','week','month','year') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'year',
  `repayment_cycle` enum('daily','weekly','monthly','bi_monthly','quarterly','semi_annually','annually') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'monthly',
  `decimal_places` enum('round_off_to_two_decimal','round_off_to_integer') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'round_off_to_two_decimal',
  `repayment_order` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `loan_fees_schedule` enum('dont_include','distribute_fees_evenly','charge_fees_on_released_date','charge_fees_on_first_payment','charge_fees_on_last_payment') COLLATE utf8_unicode_ci DEFAULT 'distribute_fees_evenly',
  `branch_access` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grace_on_interest_charged` int(11) DEFAULT NULL,
  `advanced_enabled` tinyint(4) DEFAULT 0,
  `enable_late_repayment_penalty` tinyint(4) DEFAULT 0,
  `enable_after_maturity_date_penalty` tinyint(4) DEFAULT 0,
  `after_maturity_date_penalty_type` enum('percentage','fixed') COLLATE utf8_unicode_ci DEFAULT 'percentage',
  `late_repayment_penalty_type` enum('percentage','fixed') COLLATE utf8_unicode_ci DEFAULT 'percentage',
  `late_repayment_penalty_calculate` enum('overdue_principal','overdue_principal_interest','overdue_principal_interest_fees','total_overdue') COLLATE utf8_unicode_ci DEFAULT 'overdue_principal',
  `after_maturity_date_penalty_calculate` enum('overdue_principal','overdue_principal_interest','overdue_principal_interest_fees','total_overdue') COLLATE utf8_unicode_ci DEFAULT 'overdue_principal',
  `late_repayment_penalty_amount` decimal(10,4) DEFAULT NULL,
  `after_maturity_date_penalty_amount` decimal(10,4) DEFAULT NULL,
  `late_repayment_penalty_grace_period` int(11) DEFAULT NULL,
  `after_maturity_date_penalty_grace_period` int(11) DEFAULT NULL,
  `late_repayment_penalty_recurring` int(11) DEFAULT NULL,
  `after_maturity_date_penalty_recurring` int(11) DEFAULT NULL,
  `accounting_rule` enum('cash_based','accrual_periodic','accrual_upfront') COLLATE utf8_unicode_ci DEFAULT 'cash_based',
  `chart_fund_source_id` int(11) DEFAULT NULL,
  `chart_loan_portfolio_id` int(11) DEFAULT NULL,
  `chart_receivable_interest_id` int(11) DEFAULT NULL,
  `chart_receivable_fee_id` int(11) DEFAULT NULL,
  `chart_receivable_penalty_id` int(11) DEFAULT NULL,
  `chart_loan_over_payments_id` int(11) DEFAULT NULL,
  `chart_income_interest_id` int(11) DEFAULT NULL,
  `chart_income_fee_id` int(11) DEFAULT NULL,
  `chart_income_penalty_id` int(11) DEFAULT NULL,
  `chart_income_recovery_id` int(11) DEFAULT NULL,
  `chart_loans_written_off_id` int(11) DEFAULT NULL,
  `after_maturity_date_penalty_system_type` enum('system','user') COLLATE utf8_unicode_ci DEFAULT 'system',
  `after_maturity_date_penalties` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loan_product_charges`
--

CREATE TABLE `loan_product_charges` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `charge_id` int(11) DEFAULT NULL,
  `loan_product_id` int(11) DEFAULT NULL,
  `amount` decimal(65,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `grace_period` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loan_repayments`
--

CREATE TABLE `loan_repayments` (
  `id` int(10) UNSIGNED NOT NULL,
  `loan_id` int(10) UNSIGNED NOT NULL,
  `borrower_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `repayment_method_id` int(10) UNSIGNED NOT NULL,
  `collection_date` date DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `receipt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loan_repayment_methods`
--

CREATE TABLE `loan_repayment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loan_schedules`
--

CREATE TABLE `loan_schedules` (
  `id` int(10) UNSIGNED NOT NULL,
  `loan_id` int(11) NOT NULL,
  `borrower_id` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `principal` decimal(10,4) DEFAULT NULL,
  `principal_balance` decimal(10,4) DEFAULT NULL,
  `interest` decimal(10,4) DEFAULT NULL,
  `fees` decimal(10,4) DEFAULT NULL,
  `penalty` decimal(10,4) DEFAULT NULL,
  `due` decimal(10,4) DEFAULT NULL,
  `system_generated` tinyint(4) NOT NULL DEFAULT 0,
  `closed` tinyint(4) NOT NULL DEFAULT 0,
  `missed` tinyint(4) NOT NULL DEFAULT 0,
  `missed_penalty_applied` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `fees_waived` decimal(65,4) DEFAULT NULL,
  `penalty_waived` decimal(65,4) DEFAULT NULL,
  `interest_waived` decimal(65,4) DEFAULT NULL,
  `principal_waived` decimal(65,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loan_status`
--

CREATE TABLE `loan_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `background_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loan_transactions`
--

CREATE TABLE `loan_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `modified_by_id` int(11) DEFAULT NULL,
  `loan_id` int(11) DEFAULT NULL,
  `borrower_id` int(11) DEFAULT NULL,
  `loan_schedule_id` int(11) DEFAULT NULL,
  `repayment_method_id` int(11) DEFAULT NULL,
  `transaction_type` enum('repayment','repayment_disbursement','write_off','write_off_recovery','disbursement','interest_accrual','fee_accrual','penalty_accrual','deposit','withdrawal','manual_entry','pay_charge','transfer_fund','interest','income','fee','disbursement_fee','installment_fee','specified_due_date_fee','overdue_maturity','overdue_installment_fee','loan_rescheduling_fee','penalty','interest_waiver','charge_waiver') COLLATE utf8_unicode_ci DEFAULT 'repayment',
  `name` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `debit` decimal(65,4) DEFAULT NULL,
  `credit` decimal(65,4) DEFAULT NULL,
  `balance` decimal(65,4) DEFAULT NULL,
  `reversible` tinyint(4) NOT NULL DEFAULT 0,
  `reversed` tinyint(4) NOT NULL DEFAULT 0,
  `reversal_type` enum('system','user','none') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `payment_type` enum('interest','principal','regular') COLLATE utf8_unicode_ci DEFAULT 'regular',
  `date` date DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `receipt` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `message_id` int(10) UNSIGNED DEFAULT NULL,
  `title` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `attach_file` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `read` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_07_02_230147_migration_cartalyst_sentinel', 1),
(2, '2016_07_23_173157_create_messages_table', 1),
(3, '2016_07_23_173226_create_sms_table', 1),
(4, '2016_07_23_173242_create_settings_table', 1),
(5, '2016_11_05_062734_create_permissions_table', 1),
(6, '2017_02_23_000640_create_borrowers_table', 1),
(7, '2017_02_23_002300_create_custom_fields_table', 1),
(8, '2017_02_23_003720_create_custom_fields_meta_table', 1),
(9, '2017_03_05_131103_create_loans_table', 1),
(10, '2017_03_05_132848_create_loans_products_table', 1),
(11, '2017_03_05_145851_create_loan_disbursed_by_table', 1),
(12, '2017_03_05_150107_create_loan_repayment_methods_table', 1),
(13, '2017_03_05_151538_create_loan_status_table', 1),
(14, '2017_03_08_182936_create_loan_schedules_table', 1),
(15, '2017_03_19_080840_create_loan_repayments_table', 1),
(16, '2017_04_02_142753_create_loan_comments_table', 1),
(17, '2017_04_11_091435_create_payroll_templates_table', 1),
(18, '2017_04_11_094729_create_payroll_template_meta_table', 1),
(19, '2017_04_12_004631_create_payroll_table', 1),
(20, '2017_04_12_004829_create_payroll_meta_table', 1),
(21, '2017_04_14_083438_create_expenses_table', 1),
(22, '2017_04_14_083535_create_expense_types_table', 1),
(23, '2017_04_16_084016_create_other_income_table', 1),
(24, '2017_04_16_084118_create_other_income_types_table', 1),
(25, '2017_04_16_094025_create_collateral_types_table', 1),
(26, '2017_04_16_094131_create_collateral_table', 1),
(27, '2017_04_18_083800_create_emails_table', 1),
(28, '2017_04_23_072100_create_loan_fees_table', 1),
(29, '2017_04_23_073118_create_loan_fees_meta_table', 1),
(30, '2017_05_04_103559_create_countries_table', 1),
(31, '2017_07_17_123811_add_login_fields_to_borrowers_table', 1),
(32, '2017_07_17_124138_add_month_year_to_borrowers_table', 1),
(33, '2017_07_17_124357_add_fields_to_borrowers_table', 1),
(34, '2017_07_17_130228_add_v1_1_settings_table', 1),
(35, '2017_07_23_061641_create_loan_applications_table', 1),
(36, '2017_07_23_064420_create_audit_trail_table', 1),
(37, '2017_07_23_120222_add_payment_to_v1_1_settings_table', 1),
(38, '2017_07_24_063824_create_savings_product_table', 1),
(39, '2017_07_24_070639_create_savings_table', 1),
(40, '2017_07_24_071756_create_savings_transactions_table', 1),
(41, '2017_07_24_073802_create_savings_fees_table', 1),
(42, '2017_07_27_071556_create_asset_types_table', 1),
(43, '2017_07_27_071814_create_assets_table', 1),
(44, '2017_07_27_074421_create_asset_valuations_table', 1),
(45, '2017_07_27_174045_create_capital_table', 1),
(46, '2017_08_01_064016_add_status_to_loans_table', 1),
(47, '2017_08_01_081424_create_guarantor_table', 1),
(48, '2017_08_07_083717_update_from_v1_0_to_1_1', 1),
(49, '2017_08_23_205719_add_blacklist_to_borrowers_table', 1),
(50, '2017_09_02_092303_create_borrower_groups', 1),
(51, '2017_09_02_092551_create_branches', 1),
(52, '2017_09_02_094025_add_branches_to_all_tables', 1),
(53, '2017_09_02_154128_create_borrower_group_members_table', 1),
(54, '2017_09_02_171328_update_from_v1_1_to_1_2', 1),
(55, '2017_09_05_075257_add_v12_settings', 1),
(56, '2017_09_05_082513_add_v12_permissions', 1),
(57, '2017_09_20_093729_add_client_background_settings', 1),
(58, '2017_09_20_094221_change_update_url', 1),
(59, '2017_09_23_133042_create_provision_rates_table', 1),
(60, '2017_09_23_133535_insert_data_to_provision_rates_table', 1),
(61, '2017_09_24_091220_create_bank_accounts_table', 1),
(62, '2017_09_24_091340_add_bank_accounts_to_capital_table', 1),
(63, '2017_10_13_113742_create_branch_users_table', 1),
(64, '2017_10_13_121839_add_application_fee_to_loans_table', 1),
(65, '2017_10_13_161720_add_default_branch', 1),
(66, '2017_10_13_161930_create_default_branch_and_assign_user', 1),
(67, '2017_10_13_173431_add_branch_to_schedules', 1),
(68, '2017_10_13_184930_set_default_branch_for_current_loans', 1),
(69, '2017_10_14_062601_add_v_1_3_permissions', 1),
(70, '2017_10_14_063504_update_v_1_3_update_url', 1),
(71, '2017_10_14_074553_update_to_v_1_3', 1),
(72, '2017_10_21_203340_create_product_categories_meta_table', 1),
(73, '2017_11_03_102928_add_type_to_capital_table', 1),
(74, '2017_11_03_105326_create_sms_gateways_table', 1),
(75, '2017_11_03_163022_add_name_to_guarantors_table', 1),
(76, '2017_11_03_164012_add_country_id_to_borrowers_table', 1),
(77, '2017_11_03_164336_add_currencies_table', 1),
(78, '2017_11_03_165413_add_ver_1_4_settings_table', 1),
(79, '2017_11_03_203227_add_loan_guarantors_table', 1),
(80, '2017_11_04_085909_update_to_ver_1_4_table', 1),
(81, '2017_11_05_232841_create_products_table', 1),
(82, '2017_11_05_233251_create_product_categories_table', 1),
(83, '2017_11_06_072921_create_products_check_in_table', 1),
(84, '2017_11_06_073248_create_products_check_out_table', 1),
(85, '2017_11_06_073316_create_products_warehouse_table', 1),
(86, '2017_11_06_082547_create_purchase_orders_table', 1),
(87, '2017_11_06_100343_create_suppliers_table', 1),
(88, '2017_11_06_164523_create_brands_table', 1),
(89, '2017_11_06_210217_create_products_check_out_items_table', 1),
(90, '2017_11_06_210317_create_products_payments_table', 1),
(91, '2017_11_06_210706_create_products_check_in_items_table', 1),
(92, '2017_11_07_035537_create_purchase_order_items_table', 1),
(93, '2017_11_07_090146_add_checkout_to_loan_table_table', 1),
(94, '2017_11_07_091944_add_warehouses_table', 1),
(95, '2017_11_08_151744_add_overdraw_settings', 1),
(96, '2017_11_11_071409_create_chart_of_accounts_table', 1),
(97, '2017_11_11_080928_add_accounting_to_loan_products_table', 1),
(98, '2017_11_11_094902_create_loan_overdue_penalties_table', 1),
(99, '2017_11_11_095510_add_accounting_to_savings_products', 1),
(100, '2017_11_11_100235_add_accounting_to_expenses_table', 1),
(101, '2017_11_11_100255_add_accounting_to_income_table', 1),
(102, '2017_11_11_100318_add_accounting_to_payroll_table', 1),
(103, '2017_11_11_131440_add_v_1_5_permissions', 1),
(104, '2017_11_11_174146_add_accounting_to_settings_table', 1),
(105, '2017_11_11_225159_create_journal_entries_table', 1),
(106, '2017_11_14_082223_add_account_to_expense_and_income_categories', 1),
(107, '2017_11_18_172024_add_current_theme_to_settings_table', 1),
(108, '2017_12_02_095438_add_receipt_tp_payments_table', 1),
(109, '2017_12_03_094335_add_loan_officer_to_loans_table', 1),
(110, '2017_12_03_185018_add_debit_and_credit_to_capital_table', 1),
(111, '2017_12_10_161628_add_index_to_all_tables', 1),
(112, '2017_12_12_144725_create_loan_transactions_table', 1),
(113, '2017_12_16_202252_create_charges_table', 1),
(114, '2017_12_16_214117_create_loan_charges_table', 1),
(115, '2017_12_16_214117_create_savings_charges_table', 1),
(116, '2017_12_16_214236_create_loan_products_charges_table', 1),
(117, '2017_12_27_101540_update_journal_entries_table', 1),
(118, '2018_01_10_104604_add_waive_to_loan_schedules_table', 1),
(119, '2018_01_14_215823_create_savings_products_charge_table', 1),
(120, '2018_01_15_000219_add_status_to_savings_table', 1),
(121, '2018_01_15_083204_add_debit_credit_to_savings_transactions_table', 1),
(122, '2018_01_26_193838_add_transfer_type_to_saving_transactions', 1),
(123, '2018_02_01_145506_add_mpesa_to_settings_table', 1),
(124, '2018_02_01_194418_add_2_0_settings', 1),
(125, '2018_02_01_201034_increase_decimal_length', 1),
(126, '2018_02_02_002812_update_system_to_version_2_0', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `other_income`
--

CREATE TABLE `other_income` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `other_income_type_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` decimal(65,4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `files` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `chart_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `other_income_types`
--

CREATE TABLE `other_income_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payroll`
--

CREATE TABLE `payroll` (
  `id` int(10) UNSIGNED NOT NULL,
  `payroll_template_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `employee_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `business_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `paid_amount` decimal(65,4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recurring` tinyint(4) NOT NULL DEFAULT 0,
  `recur_frequency` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '31',
  `recur_start_date` date DEFAULT NULL,
  `recur_end_date` date DEFAULT NULL,
  `recur_next_date` date DEFAULT NULL,
  `recur_type` enum('day','week','month','year') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'month',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `chart_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payroll_meta`
--

CREATE TABLE `payroll_meta` (
  `id` int(10) UNSIGNED NOT NULL,
  `payroll_id` int(10) UNSIGNED NOT NULL,
  `payroll_template_meta_id` int(10) UNSIGNED DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` enum('top_left','top_right','bottom_left','bottom_right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'bottom_left'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payroll_templates`
--

CREATE TABLE `payroll_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `payroll_templates`
--

INSERT INTO `payroll_templates` (`id`, `name`, `notes`, `picture`) VALUES
(1, 'Default', 'Default Payroll Template', 'default_payroll_template');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payroll_template_meta`
--

CREATE TABLE `payroll_template_meta` (
  `id` int(10) UNSIGNED NOT NULL,
  `payroll_template_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` enum('top_left','top_right','bottom_left','bottom_right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'bottom_left',
  `is_default` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `parent_id`, `name`, `slug`, `description`) VALUES
(1, 0, 'Borrowers', 'borrowers', 'Access Borrowers Module'),
(2, 1, 'View borrowers', 'borrowers.view', 'View borrowers'),
(3, 1, 'Update borrowers', 'borrowers.update', 'Update Borrowers'),
(4, 1, 'Delete borrowers', 'borrowers.delete', 'Delete borrowers'),
(5, 1, 'Create borrowers', 'borrowers.create', 'Add new borrower'),
(6, 0, 'Loans', 'loans', 'Access Loans Module'),
(7, 6, 'Create Loans', 'loans.create', 'Create Loans'),
(9, 6, 'Update Loans', 'loans.update', 'Update Loans'),
(10, 6, 'Delete Loans', 'loans.delete', 'Delete Loans'),
(11, 6, 'View Loans', 'loans.view', 'View Loans'),
(12, 6, 'Loan Products', 'loans.products', 'Manage Loan Products'),
(13, 6, 'Loan Fees', 'loans.fees', 'Manage Loan Fees'),
(14, 6, 'Loan Schedule', 'loans.schedule', 'Manage loan schedule, including sending loan schedule emails'),
(15, 0, 'Repayments', 'repayments', 'View Repayments Module'),
(16, 15, 'View Repayments', 'repayments.view', 'View All repayments'),
(17, 15, 'Create Repayments', 'repayments.create', 'Add Repayments'),
(18, 15, 'Delete Repayments', 'repayments.delete', 'Delete Repayments'),
(19, 15, 'Update Repayments', 'repayments.update', 'Update Repayments'),
(20, 0, 'Payroll', 'payroll', 'Access Payroll Module'),
(21, 20, 'View Payroll', 'payroll.view', 'View Payroll'),
(22, 20, 'Update Payroll', 'payroll.update', 'Update Payroll'),
(23, 20, 'Delete Payroll', 'payroll.delete', 'Delete Payroll'),
(24, 20, 'Create Payroll', 'payroll.create', 'Create Payroll'),
(25, 0, 'Expenses', 'expenses', 'Access Expenses Module'),
(26, 25, 'View Expenses', 'expenses.view', 'View Expenses'),
(27, 25, 'Create Expenses', 'expenses.create', 'Create Expenses'),
(28, 25, 'Update Expenses', 'expenses.update', 'Update Expenses'),
(29, 25, 'Delete Expenses', 'expenses.delete', 'Delete Expenses'),
(30, 0, 'Other Income', 'other_income', 'Access Other Income Module'),
(31, 30, 'View Other Income', 'other_income.view', 'View Other income'),
(32, 30, 'Create Other Income', 'other_income.create', 'Create other income'),
(33, 30, 'Update Other Income', 'other_income.update', 'Update Other Incom'),
(34, 30, 'Delete Other Income', 'other_income.delete', 'Delete other income'),
(35, 0, 'Collateral', 'collateral', 'Access Collateral Module'),
(36, 35, 'View collateral', 'collateral.view', 'View Collateral'),
(37, 35, 'Update Collateral', 'collateral.update', 'Update Collateral'),
(38, 35, 'Create Collateral', 'collateral.create', 'Create Collateral'),
(39, 35, 'Delete Collateral', 'collateral.delete', 'Delete Collateral'),
(40, 0, 'Reports', 'reports', 'Access Reports Module'),
(41, 0, 'Communication', 'communication', 'Access Communication Module'),
(42, 41, 'Create Communication', 'communication.create', 'Send Emails & SMS'),
(43, 41, 'Delete Communication', 'communication.delete', 'Delete Communication'),
(44, 0, 'Custom Fields', 'custom_fields', 'Access Custom Fields Module'),
(45, 44, 'View Custom Fields', 'custom_fields.view', 'View Custom fields'),
(46, 44, 'Create Custom Fields', 'custom_fields.create', 'Create Custom Fields'),
(47, 44, 'Custom Fields', 'custom_fields.update', 'Update Custom Fields'),
(48, 44, 'Delete Custom Fields', 'custom_fields.delete', 'Delete Custom Fields'),
(49, 0, 'Users', 'users', 'Access Users Module'),
(50, 49, 'View Users', 'users.view', 'View Users '),
(51, 49, 'Create Users', 'users.create', 'Create users'),
(52, 49, 'Update Users', 'users.update', 'Update Users'),
(53, 49, 'Delete Users', 'users.delete', 'Delete Users'),
(54, 49, 'Manage Roles', 'users.roles', 'Manage user roles'),
(55, 0, 'Settings', 'settings', 'Manage Settings'),
(56, 0, 'Audit Trail', 'audit_trail', 'Access Audit Trail'),
(57, 0, 'Savings', 'savings', 'Access Savings Menu'),
(58, 57, 'Create Savings', 'savings.create', ''),
(59, 57, 'Update Savings', 'savings.update', ''),
(60, 57, 'Delete Savings', 'savings.delete', ''),
(61, 57, 'Create Savings Transaction', 'savings.transactions.create', ''),
(62, 57, 'Update Savings Transaction', 'savings.transactions.update', ''),
(63, 57, 'Delete Savings Transaction', 'savings.transactions.delete', ''),
(64, 57, 'View Savings', 'savings.view', ''),
(65, 57, 'View Savings Transaction', 'savings.transactions.view', ''),
(66, 57, 'Manage Savings Products', 'savings.products', 'Manage Savings Products'),
(67, 57, 'Manage Savings Fees', 'savings.fees', ''),
(68, 6, 'Approve Loans', 'loans.approve', 'Approve Loans'),
(69, 6, 'Disburse Loans', 'loans.disburse', 'Disburse Loans'),
(70, 1, 'Approve Borrowers', 'borrowers.approve', 'Approve Borrowers'),
(71, 6, 'Withdraw Loans', 'loans.withdraw', 'Withdraw Loans'),
(72, 6, 'Write Off Loans', 'loans.writeoff', 'Write off Loans'),
(73, 6, 'Reschedule Loans', 'loans.reschedule', 'Reschedule Loans'),
(74, 0, 'Dashboard', 'dashboard', 'Access Dashboard'),
(75, 74, 'Loans Released Monthly Graph', 'dashboard.loans_released_monthly_graph', 'Access Loans Released Monthly Graph'),
(76, 74, 'Loans Collected Monthly Graph', 'dashboard.loans_collected_monthly_graph', 'Access Loans Collected Monthly Graph'),
(77, 74, 'Registered Borrowers', 'dashboard.registered_borrowers', 'Access Registered Borrowers Statistics'),
(78, 74, 'Total Loans Released', 'dashboard.total_loans_released', 'Access Total Loans Released'),
(79, 74, 'Total Collections', 'dashboard.total_collections', 'Access Total Collections Statistics'),
(80, 74, 'Total Disbursed Loans', 'dashboard.loans_disbursed', 'Access Total Disbursed Loans Statistics'),
(81, 74, 'Total Loans Pending', 'dashboard.loans_pending', ''),
(82, 74, 'Loans Approved', 'dashboard.loans_approved', ''),
(83, 74, 'Loans Declined', 'dashboard.loans_declined', ''),
(84, 74, 'Loans Closed', 'dashboard.loans_closed', ''),
(85, 74, 'Loans Withdrawn', 'dashboard.loans_withdrawn', ''),
(86, 74, 'Loans Written Off', 'dashboard.loans_written_off', ''),
(87, 74, 'Loans Rescheduled', 'dashboard.loans_rescheduled', ''),
(88, 6, 'Create Guarantor', 'loans.guarantor.create', ''),
(89, 6, 'Update Guarantor', 'loans.guarantor.update', ''),
(90, 6, 'Delete Guarantor', 'loans.guarantor.delete', ''),
(91, 6, 'Guarantor Savings', 'loans.guarantor.savings', ''),
(92, 0, 'Capital', 'capital', 'Access Capital'),
(93, 92, 'View  Capital', 'capital.view', ''),
(94, 92, 'Create Capital', 'capital.create', ''),
(95, 92, 'Update Capital', 'capital.update', ''),
(96, 92, 'Delete Capital', 'capital.delete', ''),
(97, 0, 'Assets', 'assets', 'Access Assets Menu'),
(98, 97, 'Create Assets', 'assets.create', ''),
(99, 97, 'View Assets', 'assets.view', ''),
(100, 97, 'Update Assets', 'assets.update', ''),
(101, 97, 'Delete Assets', 'assets.delete', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persistences`
--

CREATE TABLE `persistences` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `persistences`
--

INSERT INTO `persistences` (`id`, `user_id`, `code`, `created_at`, `updated_at`) VALUES
(12, 2, 'jQqvoad5PHjgHe1XLzPHot4KabOBsytY', '2019-02-16 06:48:25', '2019-02-16 06:48:25'),
(13, 2, 'vwmpz3CPftPfPShmmzQphwkKtm1Hr68G', '2019-02-16 07:01:01', '2019-02-16 07:01:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost_price` decimal(65,2) DEFAULT NULL,
  `selling_price` decimal(65,2) DEFAULT NULL,
  `qty` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `alert_qty` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `user_id`, `name`, `brand_id`, `category_id`, `code`, `cost_price`, `selling_price`, `qty`, `alert_qty`, `description`, `notes`, `picture`, `slug`, `active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Cuentas', NULL, NULL, '123', '69.95', '12.33', 0, 1, NULL, '<p>gsdsdgsgsdgsdgsdgsdgsdgsdg</p>', NULL, 'cuentas', 1, '2019-01-19 02:09:45', '2019-01-19 02:09:45', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `product_categories`
--

INSERT INTO `product_categories` (`id`, `user_id`, `parent_id`, `name`, `slug`, `active`, `notes`) VALUES
(1, NULL, 0, 'Principal', 'principal', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_categories_meta`
--

CREATE TABLE `product_categories_meta` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_check_ins`
--

CREATE TABLE `product_check_ins` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `amount` decimal(65,2) NOT NULL DEFAULT 0.00,
  `unit_cost` decimal(65,2) NOT NULL DEFAULT 0.00,
  `qty` decimal(65,2) NOT NULL DEFAULT 0.00,
  `total_cost` decimal(65,2) NOT NULL DEFAULT 0.00,
  `tax_rate` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tax_total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `date` date DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_check_in_items`
--

CREATE TABLE `product_check_in_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_check_in_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_rate` decimal(65,2) NOT NULL DEFAULT 0.00,
  `qty` decimal(65,2) NOT NULL DEFAULT 0.00,
  `unit_cost` decimal(65,2) NOT NULL DEFAULT 0.00,
  `tax_total` decimal(65,2) NOT NULL DEFAULT 0.00,
  `total_cost` decimal(65,2) NOT NULL DEFAULT 0.00,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_check_outs`
--

CREATE TABLE `product_check_outs` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` enum('cash','loan') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'cash',
  `loan_id` int(10) UNSIGNED DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `borrower_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `unit_cost` decimal(65,2) NOT NULL DEFAULT 0.00,
  `amount` decimal(65,2) NOT NULL DEFAULT 0.00,
  `qty` decimal(65,2) NOT NULL DEFAULT 0.00,
  `total_cost` decimal(65,2) NOT NULL DEFAULT 0.00,
  `tax_rate` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tax_total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `date` date DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_check_out_items`
--

CREATE TABLE `product_check_out_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `product_check_out_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_rate` decimal(65,2) NOT NULL DEFAULT 0.00,
  `qty` decimal(65,2) NOT NULL DEFAULT 0.00,
  `unit_cost` decimal(65,2) NOT NULL DEFAULT 0.00,
  `tax_total` decimal(65,2) NOT NULL DEFAULT 0.00,
  `total_cost` decimal(65,2) NOT NULL DEFAULT 0.00,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_payments`
--

CREATE TABLE `product_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `bank_id` int(10) UNSIGNED DEFAULT NULL,
  `product_check_in_id` int(10) UNSIGNED DEFAULT NULL,
  `product_check_out_id` int(10) UNSIGNED DEFAULT NULL,
  `type` enum('debit','credit') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'credit',
  `payment_method_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `receipt` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_slip` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(65,2) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_warehouses`
--

CREATE TABLE `product_warehouses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provision_rates`
--

CREATE TABLE `provision_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `rate` double(10,2) NOT NULL DEFAULT 0.00,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `provision_rates`
--

INSERT INTO `provision_rates` (`id`, `name`, `days`, `rate`, `notes`) VALUES
(1, 'Current', 0, 0.00, NULL),
(2, 'Especially Mentioned', 31, 5.00, NULL),
(3, 'Substandard', 61, 10.00, NULL),
(4, 'Doubtful', 91, 50.00, NULL),
(5, 'Loss', 181, 100.00, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `amount` decimal(65,2) NOT NULL DEFAULT 0.00,
  `unit_cost` decimal(65,2) NOT NULL DEFAULT 0.00,
  `qty` decimal(65,2) NOT NULL DEFAULT 0.00,
  `total_cost` decimal(65,2) NOT NULL DEFAULT 0.00,
  `tax_rate` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tax_total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `delivery_date` date DEFAULT NULL,
  `date` date DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `purchase_order_items`
--

CREATE TABLE `purchase_order_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `purchase_order_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_rate` decimal(65,2) NOT NULL DEFAULT 0.00,
  `qty` decimal(65,2) NOT NULL DEFAULT 0.00,
  `qty_received` decimal(65,2) NOT NULL DEFAULT 0.00,
  `unit_cost` decimal(65,2) NOT NULL DEFAULT 0.00,
  `tax_total` decimal(65,2) NOT NULL DEFAULT 0.00,
  `total_cost` decimal(65,2) NOT NULL DEFAULT 0.00,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reminders`
--

CREATE TABLE `reminders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `slug`, `name`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', '{\"borrowers\":true,\"borrowers.view\":true,\"borrowers.update\":true,\"borrowers.delete\":true,\"borrowers.create\":true,\"borrowers.approve\":true,\"borrowers.blacklist\":true,\"borrowers.groups\":true,\"loans\":true,\"loans.create\":true,\"loans.update\":true,\"loans.delete\":true,\"loans.view\":true,\"loans.products\":true,\"loans.fees\":true,\"loans.schedule\":true,\"loans.approve\":true,\"loans.disburse\":true,\"loans.withdraw\":true,\"loans.writeoff\":true,\"loans.reschedule\":true,\"loans.guarantor.create\":true,\"loans.guarantor.update\":true,\"loans.guarantor.delete\":true,\"loans.guarantor.savings\":true,\"loans.loan_calculator\":true,\"repayments\":true,\"repayments.view\":true,\"repayments.create\":true,\"repayments.delete\":true,\"repayments.update\":true,\"payroll\":true,\"payroll.view\":true,\"payroll.update\":true,\"payroll.delete\":true,\"payroll.create\":true,\"expenses\":true,\"expenses.view\":true,\"expenses.create\":true,\"expenses.update\":true,\"expenses.delete\":true,\"other_income\":true,\"other_income.view\":true,\"other_income.create\":true,\"other_income.update\":true,\"other_income.delete\":true,\"collateral\":true,\"collateral.view\":true,\"collateral.update\":true,\"collateral.create\":true,\"collateral.delete\":true,\"reports\":true,\"communication\":true,\"communication.create\":true,\"communication.delete\":true,\"custom_fields\":true,\"custom_fields.view\":true,\"custom_fields.create\":true,\"custom_fields.update\":true,\"custom_fields.delete\":true,\"users\":true,\"users.view\":true,\"users.create\":true,\"users.update\":true,\"users.delete\":true,\"users.roles\":true,\"settings\":true,\"audit_trail\":true,\"savings\":true,\"savings.create\":true,\"savings.update\":true,\"savings.delete\":true,\"savings.transactions.create\":true,\"savings.transactions.update\":true,\"savings.transactions.delete\":true,\"savings.view\":true,\"savings.transactions.view\":true,\"savings.products\":true,\"savings.fees\":true,\"dashboard\":true,\"dashboard.loans_released_monthly_graph\":true,\"dashboard.loans_collected_monthly_graph\":true,\"dashboard.registered_borrowers\":true,\"dashboard.total_loans_released\":true,\"dashboard.total_collections\":true,\"dashboard.loans_disbursed\":true,\"dashboard.loans_pending\":true,\"dashboard.loans_approved\":true,\"dashboard.loans_declined\":true,\"dashboard.loans_closed\":true,\"dashboard.loans_withdrawn\":true,\"dashboard.loans_written_off\":true,\"dashboard.loans_rescheduled\":true,\"capital\":true,\"capital.view\":true,\"capital.create\":true,\"capital.update\":true,\"capital.delete\":true,\"assets\":true,\"assets.create\":true,\"assets.view\":true,\"assets.update\":true,\"assets.delete\":true,\"branches\":true,\"branches.view\":true,\"branches.create\":true,\"branches.update\":true,\"branches.delete\":true,\"branches.assign\":true,\"stock\":true,\"stock.view\":true,\"stock.create\":true,\"stock.update\":true,\"stock.delete\":true}', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_users`
--

CREATE TABLE `role_users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `role_users`
--

INSERT INTO `role_users` (`user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-01-18 21:23:50', '2019-01-18 21:23:50'),
(2, 1, '2019-02-16 06:45:24', '2019-02-16 06:45:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `savings`
--

CREATE TABLE `savings` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `borrower_id` int(10) UNSIGNED DEFAULT NULL,
  `savings_product_id` int(10) UNSIGNED DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `status` enum('active','closed','pending','declined','withdrawn') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `loan_officer_id` int(11) DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `overdraft_limit` decimal(65,4) DEFAULT NULL,
  `approved_date` date DEFAULT NULL,
  `declined_date` date DEFAULT NULL,
  `closed_date` date DEFAULT NULL,
  `approved_notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `declined_notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `closed_notes` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `savings_charges`
--

CREATE TABLE `savings_charges` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `charge_id` int(11) DEFAULT NULL,
  `savings_id` int(11) DEFAULT NULL,
  `amount` decimal(65,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `savings_fees`
--

CREATE TABLE `savings_fees` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `savings_products` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT 0.00,
  `fees_posting` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fees_adding` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new_fee_type` enum('full','pro_rata') COLLATE utf8_unicode_ci DEFAULT 'full',
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `savings_products`
--

CREATE TABLE `savings_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `allow_overdraw` tinyint(4) NOT NULL DEFAULT 0,
  `interest_rate` decimal(10,2) DEFAULT NULL,
  `minimum_balance` int(11) DEFAULT 0,
  `interest_posting` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interest_adding` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `accounting_rule` enum('none','cash_based') COLLATE utf8_unicode_ci DEFAULT 'none',
  `chart_reference_id` int(11) DEFAULT NULL,
  `chart_overdraft_portfolio_id` int(11) DEFAULT NULL,
  `chart_savings_control_id` int(11) DEFAULT NULL,
  `chart_income_interest_id` int(11) DEFAULT NULL,
  `chart_income_fee_id` int(11) DEFAULT NULL,
  `chart_income_penalty_id` int(11) DEFAULT NULL,
  `chart_payable_interest_id` int(11) DEFAULT NULL,
  `chart_receivable_fee_id` int(11) DEFAULT NULL,
  `chart_receivable_penalty_id` int(11) DEFAULT NULL,
  `chart_expense_interest_id` int(11) DEFAULT NULL,
  `chart_expense_written_off_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `savings_product_charges`
--

CREATE TABLE `savings_product_charges` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `charge_id` int(11) DEFAULT NULL,
  `savings_product_id` int(11) DEFAULT NULL,
  `amount` decimal(65,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `grace_period` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `savings_transactions`
--

CREATE TABLE `savings_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `borrower_id` int(10) UNSIGNED DEFAULT NULL,
  `savings_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT 0.00,
  `type` enum('deposit','withdrawal','bank_fees','interest','dividend','guarantee','guarantee_restored','fees_payment','transfer_loan','transfer_savings') COLLATE utf8_unicode_ci DEFAULT NULL,
  `system_interest` tinyint(4) NOT NULL DEFAULT 0,
  `date` date DEFAULT NULL,
  `time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `receipt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_method_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `debit` decimal(65,4) DEFAULT NULL,
  `credit` decimal(65,4) DEFAULT NULL,
  `balance` decimal(65,4) DEFAULT NULL,
  `reversible` tinyint(4) NOT NULL DEFAULT 0,
  `reversed` tinyint(4) NOT NULL DEFAULT 0,
  `reversal_type` enum('system','user','none') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `reference` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `setting_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `setting_value` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`id`, `setting_key`, `setting_value`) VALUES
(1, 'allow_self_registration', '1'),
(2, 'allow_client_login', '1'),
(3, 'welcome_note', 'Welcome to our company. You can login with your username and password'),
(4, 'allow_client_apply', '1'),
(5, 'enable_online_payment', '0'),
(6, 'paynow_key', NULL),
(7, 'paynow_id', NULL),
(8, 'paypal_enabled', '0'),
(9, 'paynow_enabled', '0'),
(10, 'client_registration_required_fields', ''),
(11, 'client_auto_activate_account', '1'),
(12, 'client_request_guarantor', '0'),
(13, 'auto_post_savings_interest', '1'),
(14, 'update_url', 'http://webstudio.co.zw/ulm/update'),
(15, 'client_login_background', ''),
(16, 'stripe_secret_key', NULL),
(17, 'stripe_publishable_key', NULL),
(18, 'stripe_enabled', '0'),
(19, 'allow_bank_overdraw', '1'),
(20, 'expenses_chart_id', ''),
(21, 'income_chart_id', ''),
(22, 'payroll_chart_id', NULL),
(23, 'active_theme', 'limitless'),
(24, 'mpesa_consumer_key', NULL),
(25, 'mpesa_consumer_secret', NULL),
(26, 'mpesa_shortcode', NULL),
(27, 'mpesa_endpoint', 'https://sandbox.safaricom.co.ke'),
(28, 'mpesa_initiator', NULL),
(29, 'mpesa_enabled', '0'),
(30, 'default_online_payment_method', ''),
(31, 'timezone', 'Africa/Blantyre'),
(32, 'auto_download_update', '0'),
(33, 'update_notification', ''),
(34, 'update_last_checked', ''),
(35, 'header_javascript', ''),
(36, 'footer_javascript', ''),
(37, 'company_name', 'Loan'),
(38, 'company_address', 'Suite 608'),
(39, 'company_currency', 'MXN'),
(40, 'company_website', 'http://www.webstudio.co.zw'),
(41, 'company_country', '142'),
(42, 'system_version', '1.0'),
(43, 'sms_enabled', '1'),
(44, 'active_sms', '1'),
(45, 'portal_address', 'http://www.'),
(46, 'company_email', 'info@webstudio.co.zw'),
(47, 'currency_symbol', '$'),
(48, 'currency_position', 'left'),
(49, 'company_logo', 'logo.jpg'),
(50, 'twilio_sid', ''),
(51, 'twilio_token', ''),
(52, 'twilio_phone_number', ''),
(53, 'routesms_host', ''),
(54, 'routesms_username', ''),
(55, 'routesms_password', ''),
(56, 'routesms_port', ''),
(57, 'sms_sender', ''),
(58, 'clickatell_username', ''),
(59, 'clickatell_password', ''),
(60, 'clickatell_api_id', ''),
(61, 'paypal_email', NULL),
(62, 'currency', 'USD'),
(63, 'password_reset_subject', 'Password reset instructions'),
(64, 'password_reset_template', 'Password reset instructions'),
(65, 'payment_received_sms_template', 'Dear {borrowerFirstName}, we have received your payment of ${paymentAmount} for loan {loanNumber}. New loan balance:${loanBalance}. Thank you'),
(66, 'payment_received_email_template', '<p>Dear {borrowerFirstName}, we have received your payment of ${paymentAmount} for loan {loanNumber}. New loan balance:${loanBalance}. Thank you</p>'),
(67, 'payment_received_email_subject', 'Payment Received'),
(68, 'payment_email_subject', 'Payment Receipt'),
(69, 'payment_email_template', '<p>Dear {borrowerFirstName}, find attached receipt of your payment of ${paymentAmount} for loan {loanNumber} on {paymentDate}. New loan balance:${loanBalance}. Thank you</p>'),
(70, 'borrower_statement_email_subject', 'Client Statement'),
(71, 'borrower_statement_email_template', '<p>Dear {borrowerFirstName}, find attached statement of your loans with us. Thank you</p>'),
(72, 'loan_statement_email_subject', 'Loan Statement'),
(73, 'loan_statement_email_template', '<p>Dear {borrowerFirstName}, find attached loan statement for loan {loanNumber}. Thank you</p>'),
(74, 'loan_schedule_email_subject', 'Loan Schedule'),
(75, 'loan_schedule_email_template', '<p>Dear {borrowerFirstName}, find attached loan schedule for loan {loanNumber}. Thank you</p>'),
(76, 'cron_last_run', ''),
(77, 'auto_apply_penalty', '0'),
(78, 'auto_payment_receipt_sms', '1'),
(79, 'auto_payment_receipt_email', '1'),
(80, 'auto_repayment_sms_reminder', '1'),
(81, 'auto_repayment_email_reminder', '1'),
(82, 'auto_repayment_days', '4'),
(83, 'auto_overdue_repayment_sms_reminder', '1'),
(84, 'auto_overdue_repayment_email_reminder', '1'),
(85, 'auto_overdue_repayment_days', '2'),
(86, 'auto_overdue_loan_sms_reminder', '1'),
(87, 'auto_overdue_loan_email_reminder', '1'),
(88, 'auto_overdue_loan_days', '2'),
(89, 'loan_overdue_email_subject', 'Loan Overdue'),
(90, 'loan_overdue_email_template', '<p>Dear {borrowerFirstName}, Your loan {loanNumber} is overdue. Please make your payment. Thank you</p>'),
(91, 'loan_overdue_sms_template', 'Dear {borrowerFirstName}, Your loan {loanNumber} is overdue. Please make your payment. Thank you'),
(92, 'loan_payment_reminder_subject', 'Upcoming Payment Reminder'),
(93, 'loan_payment_reminder_email_template', '<p>Dear {borrowerFirstName},You have an upcoming payment of {paymentAmount} due on {paymentDate} for loan {loanNumber}. Please make your payment. Thank you</p>'),
(94, 'loan_payment_reminder_sms_template', 'Dear {borrowerFirstName},You have an upcoming payment of {paymentAmount} due on {paymentDate} for loan {loanNumber}. Please make your payment. Thank you'),
(95, 'missed_payment_email_subject', 'Missed Payment'),
(96, 'missed_payment_email_template', '<p>Dear {borrowerFirstName},You missed payment of {paymentAmount} which was due on {paymentDate} for loan {loanNumber}. Please make your payment. Thank you</p>'),
(97, 'missed_payment_sms_template', 'Dear {borrowerFirstName},You missed  payment of {paymentAmount} which was due on {paymentDate} for loan {loanNumber}. Please make your payment. Thank you'),
(98, 'enable_cron', '1'),
(99, 'infobip_username', ''),
(100, 'infobip_password', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sms`
--

CREATE TABLE `sms` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `recipients` int(10) UNSIGNED NOT NULL,
  `send_to` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `gateway` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sms_gateways`
--

CREATE TABLE `sms_gateways` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_name` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_name` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `msg_name` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `sms_gateways`
--

INSERT INTO `sms_gateways` (`id`, `user_id`, `name`, `from_name`, `to_name`, `url`, `msg_name`, `notes`) VALUES
(1, NULL, 'San Franco', NULL, 'loan', 'http://ldf.df', 'mensaje', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `work_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `suppliers`
--

INSERT INTO `suppliers` (`id`, `user_id`, `name`, `mobile_phone`, `work_phone`, `email`, `address`, `notes`) VALUES
(1, NULL, 'franco', '45454544', '45454554', 'adas@fsdfsd.sdf', 'fdsfsdfsdf', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `throttle`
--

CREATE TABLE `throttle` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `throttle`
--

INSERT INTO `throttle` (`id`, `user_id`, `type`, `ip`, `created_at`, `updated_at`) VALUES
(1, NULL, 'global', NULL, '2019-01-19 05:12:59', '2019-01-19 05:12:59'),
(2, NULL, 'ip', '192.168.15.220', '2019-01-19 05:12:59', '2019-01-19 05:12:59'),
(3, 1, 'user', NULL, '2019-01-19 05:12:59', '2019-01-19 05:12:59'),
(4, NULL, 'global', NULL, '2019-01-19 05:13:50', '2019-01-19 05:13:50'),
(5, NULL, 'ip', '192.168.15.220', '2019-01-19 05:13:50', '2019-01-19 05:13:50'),
(6, 1, 'user', NULL, '2019-01-19 05:13:50', '2019-01-19 05:13:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `permissions`, `last_login`, `first_name`, `last_name`, `address`, `phone`, `city`, `gender`, `notes`, `created_at`, `updated_at`) VALUES
(1, 'admin@webstudio.co.zw', '$2y$10$sAzhhXAm8m4BhFTc.x1Yn.Le/XrCoUMqZd21pW5iEwgFUwEaQO9Ie', NULL, '2019-02-16 06:43:11', 'Admin', 'Admin', NULL, NULL, NULL, NULL, NULL, '2019-01-18 21:23:49', '2019-02-16 06:43:11'),
(2, 'ke@vin.cc', '$2y$10$Ls5QHlUw7hnpOh0T9XT2Huh6WZtNje6N4TtRqLJqyye.fvlpQNxXK', NULL, '2019-02-16 07:01:01', 'Kevin', 'Zepeda', NULL, NULL, NULL, 'Male', NULL, '2019-02-16 06:45:24', '2019-02-16 07:01:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `warehouses`
--

CREATE TABLE `warehouses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `activations`
--
ALTER TABLE `activations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assets_id_index` (`id`),
  ADD KEY `assets_purchase_date_index` (`purchase_date`);

--
-- Indices de la tabla `asset_types`
--
ALTER TABLE `asset_types`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `asset_valuations`
--
ALTER TABLE `asset_valuations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `audit_trail`
--
ALTER TABLE `audit_trail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audit_trail_id_index` (`id`);

--
-- Indices de la tabla `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `borrowers`
--
ALTER TABLE `borrowers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `borrowers_id_index` (`id`),
  ADD KEY `borrowers_unique_number_index` (`unique_number`),
  ADD KEY `borrowers_month_index` (`month`),
  ADD KEY `borrowers_year_index` (`year`);

--
-- Indices de la tabla `borrower_groups`
--
ALTER TABLE `borrower_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `borrower_group_members`
--
ALTER TABLE `borrower_group_members`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `branch_users`
--
ALTER TABLE `branch_users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `capital`
--
ALTER TABLE `capital`
  ADD PRIMARY KEY (`id`),
  ADD KEY `capital_id_index` (`id`),
  ADD KEY `capital_month_index` (`month`),
  ADD KEY `capital_year_index` (`year`);

--
-- Indices de la tabla `charges`
--
ALTER TABLE `charges`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chart_of_accounts_id_index` (`id`);

--
-- Indices de la tabla `collateral`
--
ALTER TABLE `collateral`
  ADD PRIMARY KEY (`id`),
  ADD KEY `collateral_id_index` (`id`);

--
-- Indices de la tabla `collateral_types`
--
ALTER TABLE `collateral_types`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `custom_fields_meta`
--
ALTER TABLE `custom_fields_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emails_id_index` (`id`);

--
-- Indices de la tabla `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_id_index` (`id`),
  ADD KEY `expenses_month_index` (`month`),
  ADD KEY `expenses_year_index` (`year`);

--
-- Indices de la tabla `expense_types`
--
ALTER TABLE `expense_types`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `guarantor`
--
ALTER TABLE `guarantor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guarantor_id_index` (`id`),
  ADD KEY `guarantor_unique_number_index` (`unique_number`);

--
-- Indices de la tabla `journal_entries`
--
ALTER TABLE `journal_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `journal_entries_id_index` (`id`),
  ADD KEY `journal_entries_month_index` (`month`),
  ADD KEY `journal_entries_year_index` (`year`);

--
-- Indices de la tabla `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loans_id_index` (`id`),
  ADD KEY `loans_month_index` (`month`),
  ADD KEY `loans_year_index` (`year`),
  ADD KEY `loans_release_date_index` (`release_date`),
  ADD KEY `loans_maturity_date_index` (`maturity_date`);

--
-- Indices de la tabla `loan_applications`
--
ALTER TABLE `loan_applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loan_applications_id_index` (`id`);

--
-- Indices de la tabla `loan_charges`
--
ALTER TABLE `loan_charges`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `loan_comments`
--
ALTER TABLE `loan_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `loan_disbursed_by`
--
ALTER TABLE `loan_disbursed_by`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `loan_fees`
--
ALTER TABLE `loan_fees`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `loan_fees_meta`
--
ALTER TABLE `loan_fees_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `loan_guarantors`
--
ALTER TABLE `loan_guarantors`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `loan_overdue_penalties`
--
ALTER TABLE `loan_overdue_penalties`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `loan_products`
--
ALTER TABLE `loan_products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `loan_product_charges`
--
ALTER TABLE `loan_product_charges`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `loan_repayments`
--
ALTER TABLE `loan_repayments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loan_repayments_id_index` (`id`),
  ADD KEY `loan_repayments_borrower_id_index` (`borrower_id`),
  ADD KEY `loan_repayments_loan_id_index` (`loan_id`),
  ADD KEY `loan_repayments_year_index` (`year`),
  ADD KEY `loan_repayments_month_index` (`month`),
  ADD KEY `loan_repayments_due_date_index` (`due_date`),
  ADD KEY `loan_repayments_collection_date_index` (`collection_date`);

--
-- Indices de la tabla `loan_repayment_methods`
--
ALTER TABLE `loan_repayment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `loan_schedules`
--
ALTER TABLE `loan_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loan_schedules_id_index` (`id`),
  ADD KEY `loan_schedules_borrower_id_index` (`borrower_id`),
  ADD KEY `loan_schedules_loan_id_index` (`loan_id`),
  ADD KEY `loan_schedules_year_index` (`year`),
  ADD KEY `loan_schedules_month_index` (`month`),
  ADD KEY `loan_schedules_due_date_index` (`due_date`);

--
-- Indices de la tabla `loan_status`
--
ALTER TABLE `loan_status`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `loan_transactions`
--
ALTER TABLE `loan_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `other_income`
--
ALTER TABLE `other_income`
  ADD PRIMARY KEY (`id`),
  ADD KEY `other_income_id_index` (`id`),
  ADD KEY `other_income_year_index` (`year`),
  ADD KEY `other_income_month_index` (`month`);

--
-- Indices de la tabla `other_income_types`
--
ALTER TABLE `other_income_types`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `payroll`
--
ALTER TABLE `payroll`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_id_index` (`id`),
  ADD KEY `payroll_user_id_index` (`user_id`),
  ADD KEY `payroll_year_index` (`year`),
  ADD KEY `payroll_month_index` (`month`);

--
-- Indices de la tabla `payroll_meta`
--
ALTER TABLE `payroll_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `payroll_templates`
--
ALTER TABLE `payroll_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `payroll_template_meta`
--
ALTER TABLE `payroll_template_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `persistences`
--
ALTER TABLE `persistences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `persistences_code_unique` (`code`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id_index` (`id`);

--
-- Indices de la tabla `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `product_categories_meta`
--
ALTER TABLE `product_categories_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `product_check_ins`
--
ALTER TABLE `product_check_ins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_check_ins_id_index` (`id`),
  ADD KEY `product_check_ins_supplier_id_index` (`supplier_id`),
  ADD KEY `product_check_ins_warehouse_id_index` (`warehouse_id`);

--
-- Indices de la tabla `product_check_in_items`
--
ALTER TABLE `product_check_in_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_check_in_items_id_index` (`id`),
  ADD KEY `product_check_in_items_product_check_in_id_index` (`product_check_in_id`),
  ADD KEY `product_check_in_items_product_id_index` (`product_id`);

--
-- Indices de la tabla `product_check_outs`
--
ALTER TABLE `product_check_outs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_check_outs_id_index` (`id`),
  ADD KEY `product_check_outs_loan_id_index` (`loan_id`),
  ADD KEY `product_check_outs_borrower_id_index` (`borrower_id`),
  ADD KEY `product_check_outs_year_index` (`year`),
  ADD KEY `product_check_outs_month_index` (`month`);

--
-- Indices de la tabla `product_check_out_items`
--
ALTER TABLE `product_check_out_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_check_out_items_id_index` (`id`),
  ADD KEY `product_check_out_items_product_check_out_id_index` (`product_check_out_id`),
  ADD KEY `product_check_out_items_product_id_index` (`product_id`);

--
-- Indices de la tabla `product_payments`
--
ALTER TABLE `product_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_payments_id_index` (`id`),
  ADD KEY `product_payments_year_index` (`year`),
  ADD KEY `product_payments_month_index` (`month`);

--
-- Indices de la tabla `product_warehouses`
--
ALTER TABLE `product_warehouses`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `provision_rates`
--
ALTER TABLE `provision_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`);

--
-- Indices de la tabla `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`user_id`,`role_id`);

--
-- Indices de la tabla `savings`
--
ALTER TABLE `savings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `savings_id_index` (`id`),
  ADD KEY `savings_borrower_id_index` (`borrower_id`),
  ADD KEY `savings_savings_product_id_index` (`savings_product_id`);

--
-- Indices de la tabla `savings_charges`
--
ALTER TABLE `savings_charges`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `savings_fees`
--
ALTER TABLE `savings_fees`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `savings_products`
--
ALTER TABLE `savings_products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `savings_product_charges`
--
ALTER TABLE `savings_product_charges`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `savings_transactions`
--
ALTER TABLE `savings_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `savings_transactions_id_index` (`id`),
  ADD KEY `savings_transactions_borrower_id_index` (`borrower_id`),
  ADD KEY `savings_transactions_savings_id_index` (`savings_id`),
  ADD KEY `savings_transactions_date_index` (`date`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_setting_key_unique` (`setting_key`);

--
-- Indices de la tabla `sms`
--
ALTER TABLE `sms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_id_index` (`id`);

--
-- Indices de la tabla `sms_gateways`
--
ALTER TABLE `sms_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `throttle`
--
ALTER TABLE `throttle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `throttle_user_id_index` (`user_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `activations`
--
ALTER TABLE `activations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `assets`
--
ALTER TABLE `assets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `asset_types`
--
ALTER TABLE `asset_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `asset_valuations`
--
ALTER TABLE `asset_valuations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `audit_trail`
--
ALTER TABLE `audit_trail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `borrowers`
--
ALTER TABLE `borrowers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `borrower_groups`
--
ALTER TABLE `borrower_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `borrower_group_members`
--
ALTER TABLE `borrower_group_members`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `branch_users`
--
ALTER TABLE `branch_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `capital`
--
ALTER TABLE `capital`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `charges`
--
ALTER TABLE `charges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `collateral`
--
ALTER TABLE `collateral`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `collateral_types`
--
ALTER TABLE `collateral_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT de la tabla `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `custom_fields_meta`
--
ALTER TABLE `custom_fields_meta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `expense_types`
--
ALTER TABLE `expense_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `guarantor`
--
ALTER TABLE `guarantor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `journal_entries`
--
ALTER TABLE `journal_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `loans`
--
ALTER TABLE `loans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `loan_applications`
--
ALTER TABLE `loan_applications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `loan_charges`
--
ALTER TABLE `loan_charges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `loan_comments`
--
ALTER TABLE `loan_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `loan_disbursed_by`
--
ALTER TABLE `loan_disbursed_by`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `loan_fees`
--
ALTER TABLE `loan_fees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `loan_fees_meta`
--
ALTER TABLE `loan_fees_meta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `loan_guarantors`
--
ALTER TABLE `loan_guarantors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `loan_overdue_penalties`
--
ALTER TABLE `loan_overdue_penalties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `loan_products`
--
ALTER TABLE `loan_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `loan_product_charges`
--
ALTER TABLE `loan_product_charges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `loan_repayments`
--
ALTER TABLE `loan_repayments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `loan_repayment_methods`
--
ALTER TABLE `loan_repayment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `loan_schedules`
--
ALTER TABLE `loan_schedules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `loan_status`
--
ALTER TABLE `loan_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `loan_transactions`
--
ALTER TABLE `loan_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT de la tabla `other_income`
--
ALTER TABLE `other_income`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `other_income_types`
--
ALTER TABLE `other_income_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `payroll`
--
ALTER TABLE `payroll`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `payroll_meta`
--
ALTER TABLE `payroll_meta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `payroll_templates`
--
ALTER TABLE `payroll_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `payroll_template_meta`
--
ALTER TABLE `payroll_template_meta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT de la tabla `persistences`
--
ALTER TABLE `persistences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `product_categories_meta`
--
ALTER TABLE `product_categories_meta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `product_check_ins`
--
ALTER TABLE `product_check_ins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `product_check_in_items`
--
ALTER TABLE `product_check_in_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `product_check_outs`
--
ALTER TABLE `product_check_outs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `product_check_out_items`
--
ALTER TABLE `product_check_out_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `product_payments`
--
ALTER TABLE `product_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `product_warehouses`
--
ALTER TABLE `product_warehouses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `provision_rates`
--
ALTER TABLE `provision_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reminders`
--
ALTER TABLE `reminders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `savings`
--
ALTER TABLE `savings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `savings_charges`
--
ALTER TABLE `savings_charges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `savings_fees`
--
ALTER TABLE `savings_fees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `savings_products`
--
ALTER TABLE `savings_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `savings_product_charges`
--
ALTER TABLE `savings_product_charges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `savings_transactions`
--
ALTER TABLE `savings_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `sms`
--
ALTER TABLE `sms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sms_gateways`
--
ALTER TABLE `sms_gateways`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `throttle`
--
ALTER TABLE `throttle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
