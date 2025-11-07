-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for kos_app
CREATE DATABASE IF NOT EXISTS `kos_app` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `kos_app`;

-- Dumping structure for table kos_app.boarding_houses
CREATE TABLE IF NOT EXISTS `boarding_houses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `city_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `description` text NOT NULL,
  `price` int NOT NULL,
  `address` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `boarding_houses_city_id_foreign` (`city_id`),
  KEY `boarding_houses_category_id_foreign` (`category_id`),
  CONSTRAINT `boarding_houses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `boarding_houses_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table kos_app.boarding_houses: ~1 rows (approximately)
INSERT INTO `boarding_houses` (`id`, `name`, `slug`, `thumbnail`, `city_id`, `category_id`, `description`, `price`, `address`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'Kos Sangar', 'kos-sangar', 'boarding_house/01K94F60BWZ50XTAVYJANQXBA1.webp', 1, 1, '<p>Wifi Kenceng</p>', 500000, 'Jalan Kenjeran', NULL, '2025-11-03 02:01:16', '2025-11-03 02:01:16');

-- Dumping structure for table kos_app.bonuses
CREATE TABLE IF NOT EXISTS `bonuses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `boarding_house_id` bigint unsigned NOT NULL,
  `image` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bonuses_boarding_house_id_foreign` (`boarding_house_id`),
  CONSTRAINT `bonuses_boarding_house_id_foreign` FOREIGN KEY (`boarding_house_id`) REFERENCES `boarding_houses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table kos_app.bonuses: ~2 rows (approximately)
INSERT INTO `bonuses` (`id`, `boarding_house_id`, `image`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 1, 'bonuses/01K94F60C2SK9MXJ76KZEANJ38.jpg', 'Maka', 'Bonus Makanan 2x Sehari', NULL, '2025-11-03 02:01:16', '2025-11-03 02:01:16'),
	(2, 1, 'bonuses/01K94F60CA5A82K9K4R0Z60XEK.webp', 'Laundry', 'Bonus Laundry 5kg 2x/Bulan', NULL, '2025-11-03 02:01:16', '2025-11-03 02:01:16');

-- Dumping structure for table kos_app.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table kos_app.cache: ~4 rows (approximately)
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
	('356a192b7913b04c54574d18c28d46e6395428ab', 'i:1;', 1762226594),
	('356a192b7913b04c54574d18c28d46e6395428ab:timer', 'i:1762226594;', 1762226594),
	('livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3', 'i:1;', 1762503844),
	('livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3:timer', 'i:1762503844;', 1762503844);

-- Dumping structure for table kos_app.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table kos_app.cache_locks: ~0 rows (approximately)

-- Dumping structure for table kos_app.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table kos_app.categories: ~0 rows (approximately)
INSERT INTO `categories` (`id`, `image`, `name`, `slug`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'cities/01K94F31BQZQX9S2MG5BCBMMYZ.webp', 'Hotel', 'hotel', NULL, '2025-11-03 01:59:39', '2025-11-03 01:59:39');

-- Dumping structure for table kos_app.cities
CREATE TABLE IF NOT EXISTS `cities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table kos_app.cities: ~2 rows (approximately)
INSERT INTO `cities` (`id`, `image`, `name`, `slug`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'cities/01K94F25VFCB8G5R1R2D5KABB1.jpg', 'Surabaya', 'surabaya', NULL, '2025-11-03 01:59:11', '2025-11-03 01:59:11'),
	(2, 'cities/01K94F2HMTFR7EVRKY5ACFZG1E.jpg', 'Jakarta', 'jakarta', NULL, '2025-11-03 01:59:23', '2025-11-03 01:59:23');

-- Dumping structure for table kos_app.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table kos_app.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table kos_app.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table kos_app.jobs: ~0 rows (approximately)

-- Dumping structure for table kos_app.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table kos_app.job_batches: ~0 rows (approximately)

-- Dumping structure for table kos_app.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table kos_app.migrations: ~0 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2025_10_29_090541_create_cities_table', 1),
	(5, '2025_10_29_090639_create_categories_table', 1),
	(6, '2025_10_29_090715_create_boarding_houses_table', 1),
	(7, '2025_10_29_090756_create_rooms_table', 1),
	(8, '2025_10_29_090830_create_room_images_table', 1),
	(9, '2025_10_29_090849_create_bonuses_table', 1),
	(10, '2025_10_29_090918_create_testimonials_table', 1),
	(11, '2025_10_29_090935_create_transactions_table', 1);

-- Dumping structure for table kos_app.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table kos_app.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table kos_app.rooms
CREATE TABLE IF NOT EXISTS `rooms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `boarding_house_id` bigint unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `room_type` varchar(255) NOT NULL,
  `square_feet` int NOT NULL,
  `capacity` int NOT NULL,
  `price_per_month` int NOT NULL,
  `is_available` tinyint(1) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rooms_boarding_house_id_foreign` (`boarding_house_id`),
  CONSTRAINT `rooms_boarding_house_id_foreign` FOREIGN KEY (`boarding_house_id`) REFERENCES `boarding_houses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table kos_app.rooms: ~0 rows (approximately)
INSERT INTO `rooms` (`id`, `boarding_house_id`, `name`, `room_type`, `square_feet`, `capacity`, `price_per_month`, `is_available`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Kamar Biasa', 'A', 131, 1, 500000, 1, NULL, '2025-11-03 02:01:16', '2025-11-03 02:01:16');

-- Dumping structure for table kos_app.room_images
CREATE TABLE IF NOT EXISTS `room_images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `room_id` bigint unsigned NOT NULL,
  `image` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `room_images_room_id_foreign` (`room_id`),
  CONSTRAINT `room_images_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table kos_app.room_images: ~0 rows (approximately)
INSERT INTO `room_images` (`id`, `room_id`, `image`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 1, 'rooms/01K94F60CH9EPRGRANJXKRF8AR.jpg', NULL, '2025-11-03 02:01:16', '2025-11-03 02:01:16');

-- Dumping structure for table kos_app.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  `payload` longtext NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table kos_app.sessions: ~4 rows (approximately)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('SPjTXToJFKkxs6yk97EJREAItZ4RHrFPhhDMW6PA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoieE9EN2ROUWNWcFllMFFRejVqakRJZHR2dUJTUHdZY011dEQ1c0Z2ciI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MDoiaHR0cDovL2xvY2FsaG9zdDo4MDAwL2FkbWluL3Rlc3RpbW9uaWFscyI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQwOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYWRtaW4vdGVzdGltb25pYWxzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762502737),
	('yF7tOKjGWVW3R34f6MVHirvnyuydtAP0T9INm5zF', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiVXowdmVVZk1wZ2taWDFCS1lENmZvZ1R0Y1YxUjlGb2pUS3J4TzVXdCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQwOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYWRtaW4vdGVzdGltb25pYWxzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEyJERzZHczbmYvREdXNlY1M3VFWlo0eC54ZFltVFJTYlMwLmwzOW16bUE0RllGdmZXVjlLSE5lIjt9', 1762503811);

-- Dumping structure for table kos_app.testimonials
CREATE TABLE IF NOT EXISTS `testimonials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `boarding_house_id` bigint unsigned NOT NULL,
  `photo` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `rating` text NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `testimonials_boarding_house_id_foreign` (`boarding_house_id`),
  CONSTRAINT `testimonials_boarding_house_id_foreign` FOREIGN KEY (`boarding_house_id`) REFERENCES `boarding_houses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table kos_app.testimonials: ~0 rows (approximately)
INSERT INTO `testimonials` (`id`, `boarding_house_id`, `photo`, `name`, `content`, `rating`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 1, 'testimonials/01K96E6G8TEB30QKX0KBNTES7G.jpeg', 'Budi Speed', 'Josjis Sangar POLLL NYUENI', '5', NULL, '2025-11-03 20:22:33', '2025-11-03 20:22:33');

-- Dumping structure for table kos_app.transactions
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `boarding_house_id` bigint unsigned NOT NULL,
  `room_id` bigint unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `payment_method` enum('down_payment','full_payment') DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `start_date` date NOT NULL,
  `duration` int NOT NULL,
  `total_amount` int DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_boarding_house_id_foreign` (`boarding_house_id`),
  KEY `transactions_room_id_foreign` (`room_id`),
  CONSTRAINT `transactions_boarding_house_id_foreign` FOREIGN KEY (`boarding_house_id`) REFERENCES `boarding_houses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table kos_app.transactions: ~0 rows (approximately)
INSERT INTO `transactions` (`id`, `code`, `boarding_house_id`, `room_id`, `name`, `email`, `phone_number`, `payment_method`, `payment_status`, `start_date`, `duration`, `total_amount`, `transaction_date`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, '11611', 1, 1, 'Test', 'Test@gmail.com', '+6282132601411', 'full_payment', 'paid', '2025-11-03', 2, 500000, '2025-11-03', NULL, '2025-11-03 02:08:14', '2025-11-03 02:08:14');

-- Dumping structure for table kos_app.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table kos_app.users: ~0 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'admin@gmail.com', NULL, '$2y$12$Dsdw3nf/DGW6V53uEZZ4x.xdYmTRSbS0.l39mzmA4FYFvfWV9KHNe', NULL, '2025-11-03 01:57:03', '2025-11-03 01:57:03');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
