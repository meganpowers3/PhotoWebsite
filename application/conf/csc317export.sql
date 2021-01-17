-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: localhost    Database: csc317db
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int DEFAULT NULL,
  `comment` varchar(248) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (NULL,'a'),(NULL,'a'),(0,'test'),(0,'comment'),(0,'comment');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `description` varchar(4096) NOT NULL,
  `photopath` varchar(4096) NOT NULL,
  `thumbnail` varchar(4096) NOT NULL,
  `active` int NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `fk_userid` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `posts to users_idx` (`fk_userid`),
  CONSTRAINT `posts to users` FOREIGN KEY (`fk_userid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (2,'test title','test test title title 29129319924949','images/test.png','images/thumbnails/test.png',0,'2020-04-15 19:24:34',1),(3,'test title','test test title title 29129319924949','images/test.png','images/thumbnails/test.png',0,'2020-04-15 19:25:30',6),(4,'test title','test test title title 29129319924949','images/test.png','images/thumbnails/test.png',0,'2020-04-15 19:25:33',5),(5,'test title','test test title title 29129319924949','images/test.png','images/thumbnails/test.png',0,'2020-04-16 21:12:15',5),(6,'test title','test test title title 29129319924949','images/test.png','images/thumbnails/test.png',0,'2020-04-16 21:13:40',5),(7,'test title','test test title title 29129319924949','images/test.png','images/thumbnails/test.png',0,'2020-04-29 20:23:21',5),(8,'ewfef','wefe','images//thumbnails/[object Object]','images//thumbnails[object Object]',1,'2020-05-03 18:43:19',41),(9,'sad','asd','images//thumbnails/[object Object]','images//thumbnails[object Object]',1,'2020-05-18 20:44:18',41),(10,'ad','asd','images//thumbnails/[object Object]','images//thumbnails[object Object]',1,'2020-05-18 20:58:16',41),(11,'wad','wdaadw','images//thumbnails/[object Object]','images//thumbnails[object Object]',1,'2020-05-18 21:16:56',41),(12,'ewfwf','fwfe','images//thumbnails/[object Object]','images//thumbnails[object Object]',1,'2020-05-19 23:47:21',41),(13,'wf','wfwf','images//thumbnails/[object Object]','images//thumbnails[object Object]',1,'2020-05-20 12:16:54',41),(14,'effew','wwf','public/images/uploads/e0c9a52d2adbd4ab979d4098c448518173f8bcb448a6.jpeg','public/images/uploads/thumbnail-e0c9a52d2adbd4ab979d4098c448518173f8bcb448a6.jpeg',0,'2020-05-21 00:30:49',41),(15,'testpost','testpost','public/images/uploads/906155c08a3443b5588343974684f8a3fccac37ac640.jpeg','public/images/uploads/thumbnail-906155c08a3443b5588343974684f8a3fccac37ac640.jpeg',0,'2020-05-21 00:31:22',41),(16,'fddf','dffd','public/images/uploads/e05fbe1720043409a609af95131638ef4b9523fe4888.jpeg','public/images/uploads/thumbnail-e05fbe1720043409a609af95131638ef4b9523fe4888.jpeg',0,'2020-05-21 21:00:12',41);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `usertype` int NOT NULL DEFAULT '0',
  `active` int NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'mynewname','null@mail.com','gjjgjg',0,0,'2020-04-15 19:06:18'),(5,'testuse23rname324','null32234@mail.com','gjjgjg2aw3',0,0,'2020-04-15 19:25:12'),(6,'testrname324','null2@mail.com','gjgjg2aw3',0,0,'2020-04-15 19:25:20'),(7,'testsdrname324','nullsdf2@mail.com','gjgdfdfjg2aw3',0,0,'2020-04-15 21:57:29'),(9,'test','test@mail.com','test',0,0,'2020-04-16 01:20:07'),(12,'aaa','aaa','aaa',0,0,'2020-04-15 19:06:18'),(13,'aa','aa','aa',0,0,'2020-04-15 19:06:18'),(14,'aaaaaaa','aad','aaa',0,0,'2020-04-17 07:30:42'),(15,'test2','test2@gmail.com','test2',0,0,'2020-04-17 00:33:28'),(16,'ddddd','dddd','eeee',0,0,'2020-04-28 01:07:53'),(17,'eereee','ewrewwe','eeee',0,0,'2020-04-28 01:11:21'),(18,'test4','test4@test.com','test',0,0,'2020-04-28 01:18:16'),(19,'test5','test5@test.com','test5',0,0,'2020-04-28 01:21:08'),(20,'test6','test6@test.com','ff',0,0,'2020-04-28 01:23:57'),(21,'t2','t2','2t',0,0,'2020-04-28 01:25:59'),(22,'t2e','t2e','we',0,0,'2020-04-28 01:26:38'),(23,'weerw','weerw','we',0,0,'2020-04-28 14:15:14'),(24,'weerw3','weerw3','d',0,0,'2020-04-28 16:12:29'),(25,'weerw3fsc','weerw3fsc','s',0,0,'2020-04-28 17:27:27'),(26,'wdd','wd','sd',0,0,'2020-04-28 17:35:34'),(27,'wddss','wds','dd',0,0,'2020-04-28 17:40:48'),(28,'wddssf','fwds','f',0,0,'2020-04-28 17:41:41'),(29,'wfeef','wefwef','eff',0,0,'2020-04-28 17:44:05'),(30,'errwfeef','erwefwef','eee',0,0,'2020-04-28 17:44:47'),(31,'errwfeefd','erwefwefd','sd',0,0,'2020-04-28 17:46:29'),(32,'errwfeefde','erwefwefde','e',0,0,'2020-04-28 17:47:01'),(33,'ewef','ef','efef',0,0,'2020-04-28 17:48:32'),(34,'ewefs','efs','s',0,0,'2020-04-28 17:55:00'),(35,'qwqw','wqeq','ww',0,0,'2020-04-28 17:59:29'),(36,'hashedtest','hashed@gmail.com','hashed',0,0,'2020-04-29 20:21:13'),(37,'hashtest3','hashtest3@gmail.com','test',0,0,'2020-04-29 20:41:44'),(38,'hashtest4','hashtest4@gmail.com','aaa',0,0,'2020-04-29 20:58:54'),(39,'hashtest5','hashtest5@gmail.com','sffff',0,0,'2020-04-29 21:00:11'),(40,'hashtest6','hashtest6@gmail.com','$2b$10$XeXYzVKnKwtgIi9uv8zfI.2q7qBWq9MI5r9FOXkeDh9M3HO5yi4sG',0,0,'2020-04-29 21:07:29'),(41,'testlogin','test4@gmail.com','$2b$10$b0TwpTuikvYwJsa6YH5BDOhNvWNR4u42RIHDBuLe9phpUS3gGkJq6',0,0,'2020-04-29 21:36:52');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-21 22:01:59
