-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: vk
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `catalog`
--

DROP TABLE IF EXISTS `catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `community`
--

DROP TABLE IF EXISTS `community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `admin_id` int unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_community_user1_idx` (`admin_id`),
  CONSTRAINT `fk_community_user1` FOREIGN KEY (`admin_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emoticons`
--

DROP TABLE IF EXISTS `emoticons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emoticons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `file` blob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flights`
--

DROP TABLE IF EXISTS `flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flights` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `from` varchar(45) NOT NULL,
  `to` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `friend_request`
--

DROP TABLE IF EXISTS `friend_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_request` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` int unsigned NOT NULL,
  `to_user_id` int unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1 - отклонен\\n0 - запрос\\n1 - дружба',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_friend_request_user1_idx` (`from_user_id`),
  KEY `fk_friend_request_user2_idx` (`to_user_id`),
  CONSTRAINT `fk_friend_request_user1` FOREIGN KEY (`from_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_friend_request_user2` FOREIGN KEY (`to_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `from_user_id` int unsigned NOT NULL,
  `to_user_id` int unsigned DEFAULT NULL,
  `to_post_id` int unsigned DEFAULT NULL,
  `to_media_id` int unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_Likes_user1_idx` (`from_user_id`),
  KEY `fk_Likes_user2_idx` (`to_user_id`),
  KEY `fk_Likes_post1_idx` (`to_post_id`),
  KEY `fk_Likes_media1_idx` (`to_media_id`),
  CONSTRAINT `fk_Likes_media1` FOREIGN KEY (`to_media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_Likes_post1` FOREIGN KEY (`to_post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `fk_Likes_user1` FOREIGN KEY (`from_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_Likes_user2` FOREIGN KEY (`to_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` int unsigned NOT NULL,
  `from_user_id` int unsigned NOT NULL,
  `url` varchar(145) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '/files/img/2020-01-01/img.png',
  `file` blob,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_media_media_type1_idx` (`media_type_id`),
  KEY `fk_media_user1_idx` (`from_user_id`),
  CONSTRAINT `fk_media_media_type1` FOREIGN KEY (`media_type_id`) REFERENCES `media_type` (`id`),
  CONSTRAINT `fk_media_user1` FOREIGN KEY (`from_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `media_type`
--

DROP TABLE IF EXISTS `media_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` int unsigned NOT NULL,
  `to_user_id` int unsigned NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `emoticons_id` int unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `read_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `media_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_message_user1_idx` (`from_user_id`),
  KEY `fk_message_user2_idx` (`to_user_id`),
  KEY `fk_message_media1_idx` (`media_id`) /*!80000 INVISIBLE */,
  KEY `fk_message_emoticons1_idx` (`emoticons_id`),
  CONSTRAINT `fk_message_emoticons1` FOREIGN KEY (`emoticons_id`) REFERENCES `emoticons` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_message_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_message_user1` FOREIGN KEY (`from_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_message_user2` FOREIGN KEY (`to_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) NOT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `community_id` int unsigned DEFAULT NULL,
  `from_user_id` int unsigned NOT NULL,
  `text` varchar(145) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_id` int unsigned DEFAULT NULL,
  `post_id` int unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_post_community1_idx` (`community_id`),
  KEY `fk_post_user1_idx` (`from_user_id`),
  KEY `fk_post_media1_idx` (`media_id`),
  KEY `fk_post_post1_idx` (`post_id`),
  CONSTRAINT `fk_post_community1` FOREIGN KEY (`community_id`) REFERENCES `community` (`id`),
  CONSTRAINT `fk_post_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_post_post1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `fk_post_user1` FOREIGN KEY (`from_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `catalog_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `user_id` int unsigned NOT NULL,
  `firstname` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `gender` enum('m','f','x') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_profile_media1_idx` (`media_id`),
  CONSTRAINT `fk_profile_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_profile_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purchase_archive`
--

DROP TABLE IF EXISTS `purchase_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_archive` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_p.a_product_idx` (`product_id`),
  KEY `fk_p.a_user_idx` (`user_id`),
  CONSTRAINT `fk_p.a_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_p.a_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='shop';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(145) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` bigint NOT NULL COMMENT '79009009090',
  `password_hash` char(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2023 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `user_active`
--

DROP TABLE IF EXISTS `user_active`;
/*!50001 DROP VIEW IF EXISTS `user_active`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_active` AS SELECT 
 1 AS `user_id`,
 1 AS `friend_request`,
 1 AS `likes`,
 1 AS `media`,
 1 AS `message`,
 1 AS `post`,
 1 AS `sum`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user_community`
--

DROP TABLE IF EXISTS `user_community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_community` (
  `community_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  PRIMARY KEY (`community_id`,`user_id`),
  KEY `fk_user_community_community1_idx` (`community_id`),
  KEY `fk_user_community_user1_idx` (`user_id`),
  CONSTRAINT `fk_user_community_community1` FOREIGN KEY (`community_id`) REFERENCES `community` (`id`),
  CONSTRAINT `fk_user_community_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `user_popular`
--

DROP TABLE IF EXISTS `user_popular`;
/*!50001 DROP VIEW IF EXISTS `user_popular`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_popular` AS SELECT 
 1 AS `user_id`,
 1 AS `friend_request`,
 1 AS `likes`,
 1 AS `media`,
 1 AS `message`,
 1 AS `sum`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `user_active`
--

/*!50001 DROP VIEW IF EXISTS `user_active`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_active` AS select `profile`.`user_id` AS `user_id`,(select count(`friend_request`.`from_user_id`) from `friend_request` where (`friend_request`.`from_user_id` = `profile`.`user_id`)) AS `friend_request`,(select count(`likes`.`from_user_id`) from `likes` where (`likes`.`from_user_id` = `profile`.`user_id`)) AS `likes`,(select count(`media`.`from_user_id`) from `media` where (`media`.`from_user_id` = `profile`.`user_id`)) AS `media`,(select count(`message`.`from_user_id`) from `message` where (`message`.`from_user_id` = `profile`.`user_id`)) AS `message`,(select count(`post`.`from_user_id`) from `post` where (`post`.`from_user_id` = `profile`.`user_id`)) AS `post`,(select sum((((`friend_request` + `media`) + `message`) + `post`))) AS `sum` from `profile` group by `profile`.`user_id` order by `sum` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_popular`
--

/*!50001 DROP VIEW IF EXISTS `user_popular`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_popular` AS select `profile`.`user_id` AS `user_id`,(select count(`friend_request`.`to_user_id`) from `friend_request` where (`friend_request`.`to_user_id` = `profile`.`user_id`)) AS `friend_request`,(select count(`likes`.`to_user_id`) from `likes` where ((`likes`.`to_user_id` = `profile`.`user_id`) and (`likes`.`to_user_id` is not null))) AS `likes`,(select count(`m`.`from_user_id`) from (`likes` `l` join `media` `m` on((`l`.`id` = `m`.`from_user_id`))) where ((`l`.`to_media_id` is not null) and (`m`.`from_user_id` = `profile`.`user_id`)) group by `m`.`from_user_id`) AS `media`,(select count(`message`.`to_user_id`) from `message` where (`message`.`to_user_id` = `profile`.`user_id`)) AS `message`,(select sum(((`friend_request` + `media`) + `message`))) AS `sum` from `profile` group by `profile`.`user_id` order by `sum` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-03  9:13:09
