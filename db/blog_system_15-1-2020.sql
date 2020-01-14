-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 14, 2020 at 07:03 PM
-- Server version: 5.7.24
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Md Ushaed', 'md-ushaed', '20200114_1579004923417.jpg', '2020-01-12 04:50:54', '2020-01-14 06:28:43'),
(2, 'Technology', 'technology', '20200114_1579004916168.jpg', '2020-01-14 04:43:06', '2020-01-14 06:28:36'),
(3, 'Cricket', 'cricket', '20200114_1579004908600.jpg', '2020-01-14 04:43:21', '2020-01-14 06:28:28'),
(4, 'Fashion', 'fashion', '20200114_1579004890631.jpg', '2020-01-14 04:43:42', '2020-01-14 06:28:11'),
(5, 'Westren', 'westren', '20200114_1579005139289.jpg', '2020-01-14 06:32:19', '2020-01-14 06:32:19');

-- --------------------------------------------------------

--
-- Table structure for table `category_post`
--

DROP TABLE IF EXISTS `category_post`;
CREATE TABLE IF NOT EXISTS `category_post` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_post`
--

INSERT INTO `category_post` (`id`, `category_id`, `post_id`, `created_at`, `updated_at`) VALUES
(26, 3, 9, '2020-01-14 05:47:02', '2020-01-14 05:47:02'),
(25, 2, 9, '2020-01-14 05:47:02', '2020-01-14 05:47:02'),
(24, 1, 9, '2020-01-14 05:47:02', '2020-01-14 05:47:02'),
(21, 4, 7, '2020-01-14 05:08:07', '2020-01-14 05:08:07'),
(20, 3, 7, '2020-01-14 05:08:07', '2020-01-14 05:08:07'),
(19, 2, 7, '2020-01-14 05:08:07', '2020-01-14 05:08:07'),
(17, 4, 8, '2020-01-14 04:45:12', '2020-01-14 04:45:12'),
(16, 3, 8, '2020-01-14 04:45:12', '2020-01-14 04:45:12'),
(15, 2, 8, '2020-01-14 04:45:12', '2020-01-14 04:45:12'),
(14, 1, 8, '2020-01-14 04:45:12', '2020-01-14 04:45:12'),
(13, 1, 7, '2020-01-14 04:42:05', '2020-01-14 04:42:05'),
(27, 4, 9, '2020-01-14 05:47:02', '2020-01-14 05:47:02'),
(28, 2, 10, '2020-01-14 05:47:59', '2020-01-14 05:47:59'),
(29, 4, 10, '2020-01-14 05:47:59', '2020-01-14 05:47:59'),
(30, 2, 11, '2020-01-14 05:49:15', '2020-01-14 05:49:15'),
(31, 1, 12, '2020-01-14 05:49:37', '2020-01-14 05:49:37'),
(32, 2, 12, '2020-01-14 05:49:37', '2020-01-14 05:49:37'),
(33, 3, 12, '2020-01-14 05:49:37', '2020-01-14 05:49:37'),
(34, 4, 12, '2020-01-14 05:49:37', '2020-01-14 05:49:37'),
(35, 5, 13, '2020-01-14 06:33:06', '2020-01-14 06:33:06'),
(40, 2, 17, '2020-01-14 11:56:47', '2020-01-14 11:56:47'),
(39, 2, 16, '2020-01-14 11:38:22', '2020-01-14 11:38:22'),
(38, 2, 15, '2020-01-14 11:29:51', '2020-01-14 11:29:51');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_post_id_foreign` (`post_id`),
  KEY `comments_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `comment`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 'dfasdfasdf', '2020-01-12 04:56:17', '2020-01-12 04:56:17'),
(2, 2, 2, 'fasdfasdf', '2020-01-12 04:56:21', '2020-01-12 04:56:21'),
(3, 2, 2, 'fasdfasdfas', '2020-01-12 04:56:25', '2020-01-12 04:56:25'),
(4, 2, 2, 'fadsfasdfas', '2020-01-12 04:56:30', '2020-01-12 04:56:30'),
(5, 2, 2, 'dfasdfasdf', '2020-01-12 04:56:38', '2020-01-12 04:56:38'),
(6, 12, 1, 'THIS IS MY COMMENT', '2020-01-14 06:12:57', '2020-01-14 06:12:57');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_04_23_222144_create_roles_table', 1),
(4, '2019_04_24_182553_create_tags_table', 1),
(5, '2019_04_25_085846_create_categories_table', 1),
(6, '2019_04_26_152814_create_posts_table', 1),
(7, '2019_04_26_153102_create_category_post_table', 1),
(8, '2019_04_26_153134_create_post_tag_table', 1),
(9, '2019_04_29_072657_create_subscribers_table', 1),
(10, '2019_04_29_232614_create_jobs_table', 1),
(11, '2019_05_01_161044_create_post_user_table', 1),
(12, '2019_05_07_192854_create_comments_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('admin@blog.com', '$2y$10$nrG6qa6XbHDs1IBN8l634enh5Ye4qQvhPAKk2OCcSrJg/.1BfsBL2', '2020-01-14 12:35:33');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `view_count` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_approved` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`),
  KEY `posts_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `slug`, `image`, `body`, `view_count`, `status`, `is_approved`, `created_at`, `updated_at`) VALUES
(9, 1, 'Inventory with REST', 'inventory-with-rest', '20200114_1579002422912.jpg', '<h2>Where does it come from?</h2>\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 1, 1, '2020-01-14 05:47:02', '2020-01-14 05:49:53'),
(7, 1, 'Sales Management System using PHP and Mysql', 'sales-management-system-using-php-and-mysql', '20200114_1579000558442.jpg', '<p>dsfasdfasdf</p>', 0, 1, 1, '2020-01-14 04:42:05', '2020-01-14 05:15:58'),
(8, 1, 'Sample Blog', 'sample-blog', '20200114_1578998712906.jpg', '<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 1, 1, 1, '2020-01-14 04:45:12', '2020-01-14 06:33:54'),
(10, 1, 'SQL', 'sql', '20200114_1579002478545.jpg', '<h2>Where does it come from?</h2>\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 0, 1, 1, '2020-01-14 05:47:59', '2020-01-14 05:47:59'),
(11, 1, 'Database', 'database', '20200114_1579002554273.jpg', '<h2>Where does it come from?</h2>\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 0, 1, 1, '2020-01-14 05:49:15', '2020-01-14 05:49:15'),
(12, 1, 'Inventory with REST API', 'inventory-with-rest-api', '20200114_1579002577993.jpg', '<h2>Where does it come from?</h2>\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 2, 1, 1, '2020-01-14 05:49:37', '2020-01-14 12:27:04'),
(13, 1, 'Western Post', 'western-post', '20200114_1579005185838.jpg', '<h2>Where does it come from?</h2>\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 0, 1, 1, '2020-01-14 06:33:06', '2020-01-14 06:33:06'),
(16, 2, 'Author SQL', 'author-sql', '20200114_1579023501519.jpg', '<h2>Where does it come from?</h2>\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 0, 1, 1, '2020-01-14 11:38:22', '2020-01-14 11:38:39'),
(15, 2, 'Second Type Post', 'second-type-post', '20200114_1579022990787.png', '<h2>Where does it come from?</h2>\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 1, 1, '2020-01-14 11:29:51', '2020-01-14 11:32:16'),
(17, 2, 'Check POST', 'check-post', '20200114_1579024607760.jpg', '<h3>Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3>\r\n<p>\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p>\r\n<h3>1914 translation by H. Rackham</h3>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>\r\n<h3>Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3>\r\n<p>\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p>\r\n<h3>1914 translation by H. Rackham</h3>\r\n<p>\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>', 1, 1, 1, '2020-01-14 11:56:47', '2020-01-14 11:58:25');

-- --------------------------------------------------------

--
-- Table structure for table `post_tag`
--

DROP TABLE IF EXISTS `post_tag`;
CREATE TABLE IF NOT EXISTS `post_tag` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tag`
--

INSERT INTO `post_tag` (`id`, `post_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 7, 1, '2020-01-14 04:42:05', '2020-01-14 04:42:05'),
(2, 8, 1, '2020-01-14 04:45:12', '2020-01-14 04:45:12'),
(3, 8, 2, '2020-01-14 04:45:12', '2020-01-14 04:45:12'),
(4, 8, 3, '2020-01-14 04:45:12', '2020-01-14 04:45:12'),
(5, 8, 4, '2020-01-14 04:45:12', '2020-01-14 04:45:12'),
(6, 8, 5, '2020-01-14 04:45:12', '2020-01-14 04:45:12'),
(7, 7, 2, '2020-01-14 05:14:41', '2020-01-14 05:14:41'),
(8, 7, 3, '2020-01-14 05:14:41', '2020-01-14 05:14:41'),
(9, 7, 4, '2020-01-14 05:14:41', '2020-01-14 05:14:41'),
(10, 7, 5, '2020-01-14 05:14:41', '2020-01-14 05:14:41'),
(11, 9, 1, '2020-01-14 05:47:02', '2020-01-14 05:47:02'),
(12, 9, 2, '2020-01-14 05:47:02', '2020-01-14 05:47:02'),
(13, 9, 3, '2020-01-14 05:47:02', '2020-01-14 05:47:02'),
(14, 9, 4, '2020-01-14 05:47:02', '2020-01-14 05:47:02'),
(15, 9, 5, '2020-01-14 05:47:02', '2020-01-14 05:47:02'),
(16, 10, 2, '2020-01-14 05:47:59', '2020-01-14 05:47:59'),
(17, 10, 5, '2020-01-14 05:47:59', '2020-01-14 05:47:59'),
(18, 11, 3, '2020-01-14 05:49:15', '2020-01-14 05:49:15'),
(19, 12, 1, '2020-01-14 05:49:37', '2020-01-14 05:49:37'),
(20, 12, 2, '2020-01-14 05:49:37', '2020-01-14 05:49:37'),
(21, 12, 3, '2020-01-14 05:49:37', '2020-01-14 05:49:37'),
(22, 13, 1, '2020-01-14 06:33:06', '2020-01-14 06:33:06'),
(23, 13, 2, '2020-01-14 06:33:06', '2020-01-14 06:33:06'),
(24, 13, 3, '2020-01-14 06:33:06', '2020-01-14 06:33:06'),
(25, 15, 3, '2020-01-14 11:29:51', '2020-01-14 11:29:51'),
(26, 16, 3, '2020-01-14 11:38:22', '2020-01-14 11:38:22'),
(27, 17, 2, '2020-01-14 11:56:47', '2020-01-14 11:56:47');

-- --------------------------------------------------------

--
-- Table structure for table `post_user`
--

DROP TABLE IF EXISTS `post_user`;
CREATE TABLE IF NOT EXISTS `post_user` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_user_post_id_foreign` (`post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_user`
--

INSERT INTO `post_user` (`id`, `post_id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 2, 2, '2020-01-12 04:56:08', '2020-01-12 04:56:08'),
(3, 12, 1, '2020-01-14 06:15:52', '2020-01-14 06:15:52'),
(4, 11, 1, '2020-01-14 06:16:14', '2020-01-14 06:16:14'),
(5, 10, 1, '2020-01-14 06:16:18', '2020-01-14 06:16:18'),
(6, 15, 2, '2020-01-14 11:32:40', '2020-01-14 11:32:40'),
(7, 17, 2, '2020-01-14 11:58:29', '2020-01-14 11:58:29');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', NULL, NULL),
(2, 'Author', 'author', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

DROP TABLE IF EXISTS `subscribers`;
CREATE TABLE IF NOT EXISTS `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'mdushaed299@gmail.com', '2020-01-14 10:55:59', '2020-01-14 10:55:59');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Dhaka', 'dhaka', '2020-01-12 04:46:50', '2020-01-12 04:46:50'),
(2, 'World', 'world', '2020-01-14 04:44:00', '2020-01-14 04:44:00'),
(3, 'Bangladesh', 'bangladesh', '2020-01-14 04:44:11', '2020-01-14 04:44:11'),
(4, 'Mirpur', 'mirpur', '2020-01-14 04:44:19', '2020-01-14 04:44:19'),
(5, 'Technology', 'technology', '2020-01-14 04:44:26', '2020-01-14 04:44:26');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT '2',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `about` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `username`, `email`, `password`, `image`, `about`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'MD.Admin', 'admin', 'admin@blog.com', '$2y$10$yzfLQEpvt2ZPecIEnHatEORrrJUaF3wBZG/YSfn.7yNw4jbxqIPT.', '20200114_1579003271928.jpg', 'Where does it come from?\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', NULL, NULL, '2020-01-14 06:06:24'),
(2, 2, 'MD.Author', 'author', 'author@blog.com', '$2y$10$/rvwc8d8CR.WRaTTXfTsFeY8DjqlnprKPZOKwzTCYHSocZff1x/M6', '20200114_157902264277.jpg', 'Where does it come from?\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', NULL, NULL, '2020-01-14 11:24:02');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
