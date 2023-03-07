-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 07, 2023 at 09:59 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wsp_task`
--

-- --------------------------------------------------------

--
-- Table structure for table `client_infos`
--

CREATE TABLE `client_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(150) NOT NULL,
  `company_alias` varchar(50) DEFAULT NULL,
  `company_type` varchar(50) DEFAULT NULL,
  `company_logo` varchar(255) NOT NULL DEFAULT 'noimage.png',
  `company_description` varchar(250) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_infos`
--

INSERT INTO `client_infos` (`id`, `company_name`, `company_alias`, `company_type`, `company_logo`, `company_description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Ali Express', 'alix', 'Pvt Ltd', 'ali-exp.png', 'Online Shopping at AlịExpress for the best cell phones, electronics, toys & more products. AlịExpress Endless coupons, discounts, promotions and flash deals. AlịExpress Coupons. Check out all the deals. Big Saving. Satisfaction Guarantee. Promotions', 1, '2022-11-30 19:27:59', '2023-03-04 14:08:50'),
(2, 'Amazon', 'az', 'Pvt Ltd', 'amazon.png', 'Browse & discover millions of products. Read customer reviews and find best sellers. We ship to over 100 international destinations, right to your doorstep.', 1, '2022-10-31 19:27:59', NULL),
(3, 'TATA', 'tata', 'Pvt Ltd', 'tata.jpg', 'Tata Motors Limited is an Indian multinational automotive manufacturing company, headquartered in Mumbai, India, which is part of the Tata Group. The company produces passenger cars, trucks, vans, coaches, buses.', 1, '2022-10-31 19:27:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `company_addres`
--

CREATE TABLE `company_addres` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_info_id` int(11) NOT NULL,
  `company_address` varchar(255) NOT NULL,
  `company_city` varchar(150) NOT NULL,
  `company_contrary` varchar(150) NOT NULL,
  `company_email` varchar(150) DEFAULT NULL,
  `company_phone` varchar(30) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `company_addres`
--

INSERT INTO `company_addres` (`id`, `client_info_id`, `company_address`, `company_city`, `company_contrary`, `company_email`, `company_phone`, `created_at`, `updated_at`) VALUES
(1, 1, 'P-104, CP', 'Delhi', 'India', 'help@a2z.com', '98989898', '2022-11-09 19:26:21', NULL),
(2, 3, 'Plot  no-2, Gurgaon', 'Haryana', 'India', 'help@a2z.com', '98989899', '2022-11-30 19:26:21', NULL),
(3, 2, 'D-27, Noida', 'UP', 'India', 'help@amazon.com', '67676767', '2022-10-31 19:26:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `company_contact_person`
--

CREATE TABLE `company_contact_person` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_addres_id` int(11) NOT NULL,
  `contact_person` varchar(150) NOT NULL,
  `contact_person_post` varchar(100) NOT NULL,
  `contact_number` varchar(50) NOT NULL,
  `contact_email` varchar(150) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `company_contact_person`
--

INSERT INTO `company_contact_person` (`id`, `company_addres_id`, `contact_person`, `contact_person_post`, `contact_number`, `contact_email`, `created_at`, `updated_at`) VALUES
(1, 1, 'Nitish', 'Manager', '8978675455', 'nitish@a2z.com', '2023-01-03 19:30:42', '0000-00-00 00:00:00'),
(2, 2, 'Shalu', 'Senior Manager', '8978675455', 'shalu@a2z.com', '2023-01-03 19:30:42', '0000-00-00 00:00:00'),
(3, 3, 'shina', 'Contrary Manager', '8978675455', 'shina@a2z.com', '2023-01-03 19:30:42', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_03_07_065454_create_client_infos_table', 1),
(6, '2023_03_07_070712_company_addres', 1),
(7, '2023_03_07_070922_company_contact_person', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client_infos`
--
ALTER TABLE `client_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_addres`
--
ALTER TABLE `company_addres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_contact_person`
--
ALTER TABLE `company_contact_person`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client_infos`
--
ALTER TABLE `client_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `company_addres`
--
ALTER TABLE `company_addres`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `company_contact_person`
--
ALTER TABLE `company_contact_person`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
