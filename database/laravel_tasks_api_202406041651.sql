﻿--
-- Script was generated by Devart dbForge Studio for MySQL, Version 9.2.105.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 2024.06.04 16:51:16
-- Server version: 10.4.28
-- Client version: 4.1
--

-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set SQL mode
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

DROP DATABASE IF EXISTS laravel_tasks_api;

CREATE DATABASE laravel_tasks_api
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

--
-- Set default database
--
USE laravel_tasks_api;

--
-- Create table `users`
--
CREATE TABLE users (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  email_verified_at timestamp NULL DEFAULT NULL,
  password varchar(255) NOT NULL,
  remember_token varchar(100) DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 11,
AVG_ROW_LENGTH = 1638,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci,
ROW_FORMAT = DYNAMIC;

--
-- Create index `users_email_unique` on table `users`
--
ALTER TABLE users
ADD UNIQUE INDEX users_email_unique (email);

--
-- Create table `tasks`
--
CREATE TABLE tasks (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id bigint(20) UNSIGNED NOT NULL,
  name varchar(255) NOT NULL,
  description varchar(255) NOT NULL,
  priority varchar(255) NOT NULL DEFAULT 'Normal',
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 51,
AVG_ROW_LENGTH = 327,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci,
ROW_FORMAT = DYNAMIC;

--
-- Create foreign key
--
ALTER TABLE tasks
ADD CONSTRAINT tasks_user_id_foreign FOREIGN KEY (user_id)
REFERENCES users (id) ON DELETE CASCADE;

--
-- Create table `personal_access_tokens`
--
CREATE TABLE personal_access_tokens (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  tokenable_type varchar(255) NOT NULL,
  tokenable_id bigint(20) UNSIGNED NOT NULL,
  name varchar(255) NOT NULL,
  token varchar(64) NOT NULL,
  abilities text DEFAULT NULL,
  last_used_at timestamp NULL DEFAULT NULL,
  expires_at timestamp NULL DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci,
ROW_FORMAT = DYNAMIC;

--
-- Create index `personal_access_tokens_token_unique` on table `personal_access_tokens`
--
ALTER TABLE personal_access_tokens
ADD UNIQUE INDEX personal_access_tokens_token_unique (token);

--
-- Create index `personal_access_tokens_tokenable_type_tokenable_id_index` on table `personal_access_tokens`
--
ALTER TABLE personal_access_tokens
ADD INDEX personal_access_tokens_tokenable_type_tokenable_id_index (tokenable_type, tokenable_id);

--
-- Create table `password_reset_tokens`
--
CREATE TABLE password_reset_tokens (
  email varchar(255) NOT NULL,
  token varchar(255) NOT NULL,
  created_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (email)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci,
ROW_FORMAT = DYNAMIC;

--
-- Create table `migrations`
--
CREATE TABLE migrations (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  migration varchar(255) NOT NULL,
  batch int(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 6,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci,
ROW_FORMAT = DYNAMIC;

--
-- Create table `failed_jobs`
--
CREATE TABLE failed_jobs (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  uuid varchar(255) NOT NULL,
  `connection` text NOT NULL,
  queue text NOT NULL,
  payload longtext NOT NULL,
  exception longtext NOT NULL,
  failed_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci,
ROW_FORMAT = DYNAMIC;

--
-- Create index `failed_jobs_uuid_unique` on table `failed_jobs`
--
ALTER TABLE failed_jobs
ADD UNIQUE INDEX failed_jobs_uuid_unique (uuid);

-- 
-- Dumping data for table users
--
INSERT INTO users VALUES
(1, 'Dr. Bailey Kunze', 'anderson.lehner@example.org', '2024-05-07 13:21:14', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'wnQb93YNpZ', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(2, 'Colten Pacocha', 'bernardo.pouros@example.com', '2024-05-07 13:21:14', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'GGGHsHl7ff', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(3, 'Leda Kassulke DVM', 'marcellus.considine@example.net', '2024-05-07 13:21:14', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'IuNTa4sLHb', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(4, 'Bernita Ferry Jr.', 'awuckert@example.net', '2024-05-07 13:21:14', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'qBZxQaFoET', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(5, 'Mr. Arely Ernser I', 'natalie.franecki@example.net', '2024-05-07 13:21:14', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ioMLJvDFw8', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(6, 'Ludwig Watsica', 'giles33@example.net', '2024-05-07 13:21:14', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'iFkz7exZ5c', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(7, 'Dr. Adah Rice', 'marcia10@example.com', '2024-05-07 13:21:14', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'IsgEFnzCYX', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(8, 'Ivah O''Connell I', 'bernhard.rosalia@example.org', '2024-05-07 13:21:14', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'gSxieKyi9f', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(9, 'Dr. Lowell Stark', 'crooks.jammie@example.com', '2024-05-07 13:21:14', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'PxJ749y494', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(10, 'Corrine Hagenes', 'sanford91@example.net', '2024-05-07 13:21:14', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Q3ATAkn02a', '2024-05-07 13:21:14', '2024-05-07 13:21:14');

-- 
-- Dumping data for table tasks
--
INSERT INTO tasks VALUES
(1, 4, 'Laudantium velit deleniti doloremque.', 'Consequuntur earum nostrum neque maxime eligendi aut ea esse voluptatibus iusto et placeat.', 'High', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(2, 3, 'Omnis et voluptatem.', 'Provident sunt aut occaecati ut illum at facere facilis velit sit animi.', 'Low', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(3, 6, 'Tenetur voluptatem.', 'Voluptatum dolorum ut sit commodi possimus odio totam illo.', 'High', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(4, 6, 'Quisquam aut consectetur qui.', 'Fuga non aliquid voluptatem qui porro aperiam et ut.', 'Low', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(5, 9, 'Nihil velit consequatur.', 'Qui sit adipisci repudiandae ea id sapiente soluta odit.', 'Normal', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(6, 3, 'Velit adipisci sit nulla.', 'Repellendus ut fugiat quasi quae aspernatur amet et occaecati et ratione nobis est.', 'Normal', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(7, 9, 'Atque sed in sapiente.', 'Cum ducimus vero ducimus nesciunt ipsa libero voluptas quas.', 'Normal', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(8, 3, 'Est sint ea.', 'Deserunt tenetur quo quidem aut possimus illo dolore libero nemo excepturi.', 'Low', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(9, 5, 'Omnis dolorem corrupti repellendus consequuntur.', 'Nulla voluptatem quidem voluptas quos aut deserunt ut veritatis provident accusamus.', 'Normal', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(10, 9, 'Minima nostrum eveniet.', 'Hic explicabo ipsa modi ut minima voluptatem voluptas vero et harum et esse.', 'Normal', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(11, 8, 'Voluptate facilis.', 'Illum doloribus voluptate sunt eius suscipit hic aperiam quia dolorum perspiciatis.', 'High', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(12, 1, 'A eos illo.', 'Qui harum illo non ullam totam asperiores tenetur ex laboriosam quia et aliquam.', 'Low', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(13, 5, 'Ea libero temporibus.', 'Saepe velit ab minima ratione voluptatem sed ut et.', 'High', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(14, 9, 'Tempore voluptas consequatur.', 'Est esse consequuntur voluptatibus excepturi aliquid mollitia aspernatur repellendus unde quia laudantium.', 'Normal', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(15, 9, 'Eius eius qui.', 'Rerum a odit quam fuga eaque qui tenetur inventore consequatur inventore.', 'Normal', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(16, 3, 'Vitae adipisci perspiciatis.', 'Recusandae iste velit iste ut commodi et sunt ea sint rerum ut voluptatibus officiis.', 'Normal', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(17, 6, 'Quo maxime dignissimos aut.', 'Dolorem nesciunt quis excepturi dolore quam quas quia qui.', 'Normal', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(18, 4, 'Quasi aliquam suscipit quis.', 'Quis asperiores amet omnis ut recusandae itaque ratione quia.', 'High', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(19, 1, 'Debitis a voluptatum consequatur.', 'Placeat at est id aut aliquid consequatur quibusdam.', 'Normal', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(20, 10, 'Sequi impedit ipsam.', 'Alias eos cupiditate sed natus unde ut quo aut consectetur itaque et ut.', 'High', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(21, 6, 'Voluptas et aut.', 'Voluptatem numquam velit ipsum est unde quam dolor pariatur et consequuntur itaque.', 'High', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(22, 8, 'Nam provident id.', 'Explicabo voluptas occaecati quia sed voluptas impedit voluptas ut magnam.', 'Low', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(23, 1, 'Aut provident deleniti velit itaque.', 'Aperiam velit eius iure iusto non quia.', 'High', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(24, 2, 'Est et ipsum consectetur.', 'Quis repellat et eveniet est est nesciunt ut blanditiis quidem.', 'High', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(25, 5, 'Voluptas quos corrupti fugit.', 'Deleniti repudiandae voluptas sint dolor dicta labore.', 'Low', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(26, 6, 'Ipsa quia deleniti ut.', 'Enim et omnis qui officiis aut harum ea vitae distinctio nesciunt atque doloribus corporis.', 'High', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(27, 10, 'Aut quo vel.', 'Eius nihil pariatur incidunt in perferendis enim accusamus reiciendis adipisci vel voluptatem nemo non.', 'Low', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(28, 6, 'Hic aut.', 'Id possimus commodi ex molestias accusamus et dolores qui a consequatur dolorem.', 'High', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(29, 9, 'Enim architecto officiis.', 'Possimus esse hic minima autem voluptatum placeat iste.', 'Normal', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(30, 1, 'Sequi quia ut.', 'Eos officiis alias magni qui aut sint ut maiores minus tempore possimus.', 'High', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(31, 2, 'Aliquam molestias.', 'Rem dolore et quaerat odio commodi modi est quis ullam animi tenetur eos et.', 'Normal', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(32, 7, 'Quo aut dolore sint.', 'Tempore ut animi maxime est vero illum cupiditate aperiam quas reprehenderit optio adipisci exercitationem sunt.', 'Low', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(33, 2, 'Velit voluptate fuga.', 'Aut a quam tempore enim molestiae eum.', 'Low', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(34, 10, 'Nobis ea doloribus dolorum.', 'Error maiores eum vero et sint laborum iure nobis quam autem architecto quo ratione.', 'Normal', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(35, 4, 'Error incidunt blanditiis sequi.', 'Illum a neque soluta quia voluptas accusantium accusamus voluptates ut accusamus et suscipit.', 'Normal', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(36, 3, 'Aliquid architecto dicta.', 'Suscipit qui labore nisi voluptatum aut rerum placeat illo in est sit.', 'High', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(37, 6, 'Rem et quis quaerat.', 'Ducimus temporibus rerum sequi mollitia temporibus numquam exercitationem eos voluptas provident porro omnis.', 'High', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(38, 6, 'Nam sint corporis.', 'Beatae aut molestiae delectus et dolores saepe corrupti doloremque error.', 'Low', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(39, 4, 'Aut ad nihil placeat.', 'Qui ducimus consequatur non mollitia tenetur totam impedit voluptates earum dolores eum fugiat quaerat.', 'High', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(40, 6, 'Dolores cupiditate velit dolore.', 'Architecto suscipit dicta sed repudiandae aspernatur distinctio magni perspiciatis.', 'Low', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(41, 2, 'Reprehenderit sapiente voluptatem labore.', 'Ex qui non et iste ullam labore sint occaecati sit ut sunt.', 'High', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(42, 3, 'Nulla hic explicabo.', 'Esse aliquam veritatis laborum commodi possimus velit id.', 'Normal', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(43, 4, 'Necessitatibus id.', 'Vero eum pariatur eaque sunt dolorem perferendis vero.', 'Low', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(44, 2, 'Nihil maiores qui iure.', 'Voluptatem eveniet totam numquam occaecati voluptas voluptatem vero.', 'Low', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(45, 10, 'Natus libero id voluptatem et.', 'Sint qui iure magnam placeat magnam commodi.', 'Normal', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(46, 3, 'Enim recusandae possimus tempora.', 'Repudiandae ea fugiat et quia reiciendis laborum cum dolores corrupti recusandae et.', 'High', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(47, 1, 'Amet molestiae consectetur similique illo.', 'Provident aut ex cupiditate eum et ut quam.', 'Normal', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(48, 6, 'Totam aliquam amet.', 'Quasi minima hic impedit voluptas aut et et est totam.', 'High', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(49, 6, 'Similique blanditiis possimus dignissimos.', 'Nesciunt consectetur eveniet quasi incidunt omnis quas qui rerum.', 'High', '2024-05-07 13:21:14', '2024-05-07 13:21:14'),
(50, 5, 'Nam at illum.', 'Omnis eos autem quas eligendi autem debitis enim est aut.', 'Normal', '2024-05-07 13:21:14', '2024-05-07 13:21:14');

-- 
-- Dumping data for table personal_access_tokens
--
-- Table laravel_tasks_api.personal_access_tokens does not contain any data (it is empty)

-- 
-- Dumping data for table password_reset_tokens
--
-- Table laravel_tasks_api.password_reset_tokens does not contain any data (it is empty)

-- 
-- Dumping data for table migrations
--
INSERT INTO migrations VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_04_30_135615_create_tasks_table', 1);

-- 
-- Dumping data for table failed_jobs
--
-- Table laravel_tasks_api.failed_jobs does not contain any data (it is empty)

-- 
-- Restore previous SQL mode
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;