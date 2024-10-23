-- MySQL dump 10.13  Distrib 8.0.39, for Win64 (x86_64)
--
-- Host: localhost    Database: blogspot
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add blog',7,'add_blog'),(26,'Can change blog',7,'change_blog'),(27,'Can delete blog',7,'delete_blog'),(28,'Can view blog',7,'view_blog'),(29,'Can add profile',8,'add_profile'),(30,'Can change profile',8,'change_profile'),(31,'Can delete profile',8,'delete_profile'),(32,'Can view profile',8,'view_profile'),(33,'Can add notification',9,'add_notification'),(34,'Can change notification',9,'change_notification'),(35,'Can delete notification',9,'delete_notification'),(36,'Can view notification',9,'view_notification');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$y4zHDxYfPnKdkHNIzMOWVp$dmxIcJV2mtEKOvTXAA4Jn8pwiT9/i/p7qK6F9nfSXsw=','2024-10-22 19:55:30.233105',1,'niruddesh_jatra','Nasiful','Alam','nasifulalam1212@gmail.com',1,1,'2024-10-05 11:11:32.000000'),(2,'pbkdf2_sha256$870000$wKSl4VC7jr08dnPvtX3CfK$lVLi5X4l3NtUrtXiGUD3H01DBXS8ju5WH23oeIS82V8=','2024-10-08 03:32:48.094623',0,'lm10','Lionel','Messi','messi10@gmail.com',0,1,'2024-10-06 12:35:48.000000'),(3,'pbkdf2_sha256$870000$zoMiOdEfyJaXI6EfJtpTBQ$X/DIz+t6sqhxhWTHh6b2M66KZfIQZENaBfnJPOJ6XVo=','2024-10-08 08:35:28.424598',0,'cr7','Cristiano','Ronaldo','cr7@gmail.com',0,1,'2024-10-06 12:38:19.750812'),(4,'pbkdf2_sha256$870000$IcLRX9y6mp74kJbY6KMbyd$EpixkJHiGXB+HlLn0XNoKq6kYtjar4hfuX70gj2sAy0=','2024-10-14 04:48:01.334571',0,'humayun','Humayun','Ahmed','humayun1@gmail.com',0,1,'2024-10-07 18:19:18.455852'),(5,'pbkdf2_sha256$870000$xzGYa3hpdPCBxKHfCCFiOn$VQ0HxPaXUUhT+8g1Dc9AuAJ7hm/5xBdmDb2zgMP3IM0=','2024-10-15 14:55:17.503615',0,'sherlock','Sherlock','Holmes','holmes12@gmail.com',0,1,'2024-10-08 04:33:28.469025'),(6,'pbkdf2_sha256$870000$c2uywMwtd1S5Mlzgsgo6CJ$xOkAGeWTG1Q3fNqJzo3uqBPek4WJG1Nuk5Nhl+Zm7Dg=','2024-10-08 17:45:08.098447',0,'anonymous','Niruddesh','Jatra','odvutomanush15@gmail.com',0,1,'2024-10-08 17:45:05.924889'),(7,'pbkdf2_sha256$870000$Rikv9cOtKOKHWnZNrRP3tv$HQHu9s/muS4y830BGm40MOVljh9GKslURG4i0Gu8/X0=','2024-10-14 04:15:49.245054',0,'musky','Elon','Musk','elonmusk@gmail.com',0,1,'2024-10-14 04:15:47.471783'),(8,'pbkdf2_sha256$870000$vPxmmAeCJH1fzqC8zKTiLa$4E0YIYUO2EqvbohCAOdHusrYrVZ2tmhxwAJN4OEaRew=','2024-10-15 14:47:57.245596',0,'Aditya','Aditya','Chowdhury','adibhera2@gmail.com',0,1,'2024-10-15 14:47:55.514489');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogapp_blog`
--

DROP TABLE IF EXISTS `blogapp_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogapp_blog` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `last_edited` datetime(6) NOT NULL,
  `content` longtext NOT NULL,
  `status` varchar(10) NOT NULL,
  `author_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `Blogapp_blog_author_id_cd4d13f6` (`author_id`),
  CONSTRAINT `Blogapp_blog_author_id_cd4d13f6_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogapp_blog`
--

LOCK TABLES `blogapp_blog` WRITE;
/*!40000 ALTER TABLE `blogapp_blog` DISABLE KEYS */;
INSERT INTO `blogapp_blog` VALUES (2,'Being Alone','blog2','2024-10-06 19:14:55.127515','2024-10-06 19:14:55.139460','If you want to stand apart, be silent, be alone. Some walks you have to walk alone. If you want to reach somewhere in life, it’s foolish to wait for others. You have to find your own path. That’s how the great persons we remember curved the path for others. Being alone doesn’t mean being lonely. It’s a power few people have. If you want to be a torchbearer, you have to be in the front, alone. Enjoy your own path, own company. Magic will happen.','published',2),(3,'Focus on Yourself','blog3','2024-10-07 09:35:38.633831','2024-10-07 09:35:38.640989','অন্যের জীবনের দিকে তাকালে কেবল হতাশাই বাড়বে, তাতে নিজের উন্নতি হওয়ার চেয়ে অবনতির আশঙ্কা বেশি। এজন্য ফোকাসটা নিজের দিকেই হওয়া উচিত। আমি আগে যা ছিলাম, তা থেকে কি কি ইমপ্রুভ করতে পেরেছি সেদিকে ফোকাস করা উচিত। আরেকজনের এচিভমেন্ট দেখতে গিয়ে নিজে হতাশায় পরে গিয়ে নিজের যা করার তাই যদি করতে না পারি, তাতে তো আমার নিজেরই ক্ষতি। তখন তো এটলিস্ট আমার যে লেভেলে যাওয়ার পটেনশিয়াল ছিল সে লেভেলেও যেতে পারবো না। যারা গ্রেট কিছু এচিভ করে, মানে বড় বড় ব্যক্তিত্ব যাদের কথা আমরা জানি তারা ম্যাক্সিমামই নিজের দিকেই ফোকাসড থাকে। মানে তারা যেটা করে সেটাতে ইমপ্রুভ করার জন্য হাই লেভেলের এফোর্ট দেয়, বাকিরা কি করতেসে না করতেসে ওইটাতে অত ফোকাস করে না। \r\n\r\nকয়েকদিন আগে ভিরাট কোহলির একটা ইন্টারভিউ শুনতেসিলাম। ওরে জিজ্ঞেস করসিলো যে, আপনি যে এত রান করেন, প্রতি ম্যাচেই ৫০+ রান করার এক্সপেকটেশন থাকে আপনার উপর, এছাড়া সবাই আপনার থেকে বেস্ট পারফরম্যান্স আশা করে, বা অন্য প্লেয়াররা আপনাকে টপকিয়ে যেতে পারে, এত প্রেশার সামলান কিভাবে। তো কোহলী উত্তর দিসে যে, এত কিছু তো এখন আর চিন্তা করিনা, ওসব যখন খেলায় নতুন ছিলাম তখন ৩-৪ বছর করতাম, ওইটাই আমার ভুল ছিল। এখন প্র‍্যাক্টিসের সময় যাস্ট আমার ব্যাটিং টেকনিকগুলো ইমপ্রুভের চেষ্টা করি, যেখানে সমস্যা আছে সেটা নিয়ে বারবার কাজ করি, আর সবসময় নিজেকে ফিট রাখার ট্রাই করি৷ আর মাঠে নামলে যখন ব্যাটিং করি তখন আমার ফোকাস থাকে ৫০ বা ১০০ করার দিকে না, শুধু স্কোরবোর্ডের দিকে। ৪-৫ রান করে কিভাবে বাড়িয়ে নেওয়া যায়, স্কোরবোর্ডকে এগিয়ে নেওয়া যায় সেদিকেই যাস্ট লক্ষ্য রাখি, ৫০ বা ১০০ এগুলা চিন্তা করা তো বোকার কাজ৷ ওগুলা হলে হবে। আমার দায়িত্ব রান করা, সেঞ্চুরি তো আউটকাম, ওইটাতে কেন ফোকাস করতে যাব!','published',1),(4,'মুগ্ধতা ও শূন্যতা','blog4','2024-10-07 09:37:08.858998','2024-10-10 07:13:15.844853','মাঝেমাঝে কোনো কোনো গান শুনে এত মুগ্ধতা সৃষ্টি হয় নিজের মাঝে যে সবাইকে ধরে ধরে শুনাতে ইচ্ছা করে সেই গান, ইচ্ছা করে ছাদে উঠে বড় বড় লাউডস্পিকার এ বাজিয়ে দিই, যাতে সারা পৃথিবী এর সুধা পান করতে পারে, অংশীদার হতে পারে আমার আনন্দের, যে আনন্দের জন্ম হয়তো এই পৃথিবীতে নয়। \r\n\r\nমাঝে মাঝে বলতে ইচ্ছা হয়, পৃথিবী এত সুন্দর কেন? কিন্তু এসব কথা বলবো কাকে? আমায় যারা বুঝে তারা আমার ধরাছোঁয়ার বাইরে, আবার আমি যাদের সান্নিধ্য কামনা করি, তারাও আমার ধরাছোঁয়ার বাইরে। একজন কবি বা লেখক যার সাথে আমার কখনো দেখা হয়নি, অথচ কত অকপটে তিনি আমার প্রতিচ্ছবি এঁকে ফেললেন, ব্যাপারটা কত সুন্দর না? \r\n\r\nআমার আশেপাশে সুন্দর মনের, বড় মনের মানুষের এত অভাব কেন? মাঝেমাঝে তাদের ছুঁয়ে দেখতেও তো ইচ্ছা হয়। দিনশেষে বলি, এটাই তো জীবন, এসব আনন্দের রহস্য না বোঝা পর্যন্ত হেঁটে যাওয়া, চেষ্টা চালিয়ে যাওয়া অসীমকে ছোঁয়ার।','published',1),(5,'Unboxing Love','blog5','2024-10-07 09:56:32.892035','2024-10-07 09:56:32.898090','একদম সোজাসাপ্টা ভাষায় যদি বলি, যাদের জীবনের পূর্বের বা বর্তমান অবস্থা যাচ্ছেতাই, বা যারা খুবই খারাপ সময়ের মধ্য দিয়ে যাচ্ছে, তাদের জন্য রোমান্টিক রিলেশনশিপ ক্যান বি এ গুড থিং। But people who highly ambitious in life, can work their way throughout life and is in a content or good environment or situation now, shouldn\'t dare to come close to such kind of relationships. Love will be a downfall for them. Love is chaotic in nature, It will be unhealthy to welcome such chaos. এ ধরনের মানুষদের আসলে এমনে সাধারণ কথাবার্তার খাতিরেও কারো অতি নিকটে যাওয়া, বা কাউকে নিজের অতি আপন বা নিজের কাছে আসতে দেওয়া উচিত নয়। ওভারঅল লাইফ চিন্তা করতে গেলে Love will be a suffering for them. অনেকে বলে যে মন ভালো থাকে, শান্তি পাই, কিন্তু আসলে \"ভালোবাসার আনন্দের\" আনন্দের চেয়ে \"ভালোবাসার কষ্টের\" কষ্টটা বহুগুণ বেশি হয়। সো দিজ ডাসন্ট ম্যাটার ইন বিগ পিকচার।','published',3),(6,'Repeated Toxicity','blog6','2024-10-07 09:58:05.411667','2024-10-09 18:03:45.820090','একটা মানুষকে নিজের আপন মনে হলো, প্রথম দায়িত্ব তার এরকম কিছু থাকলে তা বুঝিয়ে হোক যেভাবে হোক চেইঞ্জ করার চেষ্টা করা। বাট যখন দেখা যায় যে, চেষ্টার পরও মানুষটা সেইম বিহেভয়রগুলো বারবার শো করতেসে, তাহলে এটা ইন্ডিকেশন যে এই মানুষটা তোমার জীবনের জন্য ক্ষতিকর। তখন নিজের ভালো থাকার জন্যই তার থেকে সরে আসতে হবে, যতই কষ্ট হোক। নাহলে একটু মানিয়ে নেওয়াটাই পরে দীর্ঘস্থায়ী দুঃখের কারণ হবে। \r\n\r\nএরকম অনেকে আছে, খুব রাগ উঠলে বউকে মারে। বাট আসলে ও বউকে অনেক ভালোবাসে। বাট হঠাৎ রাগ উঠলে কি যে হয়ে যায় বলতেও পারে না। এজন্য সে অনেকবার বউয়ের কাছে পা ধরে পর্যন্ত মাফ চাইসে। বউ মেনেও নিসে। পরে দেখা গেসে, আবার এরকম হইসে। বউও তাকে প্রচন্ড ভালোবাসে। বাট খেয়াল করলে দেখা যায়, এই ভালোবাসাই তো তার জীবন নষ্টের কারণ হচ্ছে।\r\n\r\nকাউকে ভালোবাসলেই তার সাথে আজীবন লেগে থাকতে হবে এটা ঠিক না। ভালোবাসা বা এরকম যেকোনোকিছুর ক্ষেত্রে খাটে।','published',3),(7,'ক্ষোভ','blog7','2024-10-07 12:59:11.590169','2024-10-08 15:45:58.141523','২০-৩০ বছরকে বলা হয় জীবনের peak time. জীবনে যা যা করার প্যাশন থাকে, চোখ বন্ধ করে সব শুরু করার বয়স নাকি এটা। অথচ এই সময়টাতেই আমরা বেশিরভাগই লাইফের ঘানি টানার জন্য ইঁদুর দৌড়ে নেমে পড়ি। মাঝখান থেকে হুট করে কখন যে সময় চলে যায়, খবর থাকে না। সময়ের সাথে সাথে জীবনের আগ্রহ, শক্তি, আনন্দ সবই কমতে থাকে। অনেক বেকুব আবার স্বপ্ন দেখে যে, এখন ভালোমতো দৌড়াই, পরে থেমে জীবনটাকে দেখব শান্তিমতো। কিন্তু একসময় যে সুযোগ ইচ্ছা সবই নিস্তেজ হয়ে পরে, সে খেয়াল থাকে না। Eat-Sleep-Job এটাই হয়ে যায় লাইফের সংজ্ঞা। আমার আশেপাশের মানুষগুলো এত ক্ষুদ্র মানসিকতার কেন ফালতু! \"পড়ব-চাকরি করব-টাকা কামাবো-বাড়ি বানাব-বিয়ে করব-পেট মোটা করব খেয়ে খেয়ে-বাচ্চা দিব-মরে যাব\" এর বাইরে চিন্তা করতে একটা বান্দাকেও দেখলাম না। শালার জীবনে একটা মানুষের সাথেও পরিচয় হলো না যে বড় স্বপ্ন দেখতে পারে, গণ্ডির বাইরে পা রাখার সাহস করতে পারে, \"লোকে কি বলবে, ভাববে\" বাদ দিয়ে নিজের মতো নিজে চেষ্টা চালিয়ে যেতে পারে। আল্লাহ একটা মানুষও কেন এরকম মিলাই দিল না আশেপাশে! আশেপাশের প্রত্যেকটা মানুষ অসুস্থ, আর আমারে বলে পাগল!','published',3),(8,'Expressing Yourself','blog8','2024-10-07 13:03:45.681493','2024-10-07 13:03:45.684792','Sometimes I wonder, why are we losing capability to empathize with another person as a human being? Emotion is an integral part of human nature. It is okay to express what you feel, no matter what others think of it. But in reality, we make fun of it. মানে বিষয়টা এরকম যে, নিজেরা যখন নিজেদের অনুভূতিগুলো কাউকে বলি, বা সোশ্যাল প্ল্যাটফর্মে প্রকাশ করি, তখন এটা আশা করি যে মানুষ আমারে বুঝবে, অথচ অন্য কেউ যখন এসব আমাদের বলে বা স্পেশ্যালি, সোশ্যাল মাধ্যমগুলোতে লিখে প্রকাশ করতে চায়, তখন ওই আমরাই তাকে নিয়ে মজা করি, তাকে তুচ্ছ মনে করি, সে তখন আমাদের কাছে \"বহুত বড় সেন্টি\"। \r\nI think, expressing *emotions* should be normalized in society for better mental health.','published',2),(9,'জ্ঞানার্জন ও বেঁচে থাকা','blog9','2024-10-07 17:50:37.031372','2024-10-07 17:50:37.039781','২০১৪ সালে, যখন কলেজে উঠে সদ্য মা-বাবার ঠিক করে দেওয়া গণ্ডি থেকে বের হয়ে নতুন চোখ ফুটেছে, জগৎ দেখতে শিখছি, তখন আমার রুমে অনেক পোস্টার লাগাইসিলাম, বাণী, সূত্র, নিজের ভাবনা এসব নিয়ে। তারমধ্যে কেবল একটা পোস্টার ১০ বছর পর এখনো তুলিনি। সেটাতে লেখা ছিলো: \r\n\r\n\"বিদ্যা অর্জন বা পড়াশোনা করা উচিত জ্ঞানার্জনের জন্য,\r\n\r\nআনন্দের জন্য, মনের আর আত্মার প্রশান্তির জন্য; পরীক্ষায় পাশ\r\n\r\nকরার, কোথাও টিকার বা চাকরি করে বাঁচার জন্য নয়।\" অনেকে হেসেছিলো এই চিন্তাধারা দেখে। যারা ভালো বলেছিলো, তারাও এখন হাসে, কারণ তারাও সেই গতানুগতিক জীবনের গ্যাঁড়াকলে আটকা পরে গেছে। আমার বয়সীগুলো চাকরি বলতেই লালা ফেলে, \"এত পড়ে কি হলো, কি হবে! এটা কি চাকরির পরীক্ষায় কাজ দিবে! অমুক এত টাকা কামিয়ে ফেলছে!\"\r\n\r\nআর আমার ছোটগুলো, ক্লাসের পর ক্লাস পার করতে পারলেই হলো, যা শিখতেসে তা শুধু সাময়িক বাধাগুলো কাটাতে, তাদের পড়াতে কোনো আনন্দ নেই, জানার তেমন কোনো কৌতুহল নেই। ইভেন নতুন কারিকুলামে প্রাতিষ্ঠানিক চাপ প্রায় নেই বললেই চলে। আমি হলে খুশিতে আটখানা হয়ে কিভাবে আমার কৌতুহলের বিষয়গুলো নিয়ে আরও গভীরভাবে ঘাঁটাঘাটি করা যায় সে চেষ্টা করতাম। এভাবে বিরক্তি নিয়ে পড়াশোনা না, জীবনে যাই করা হোক, সুখে থাকা যাবে বলে মনে হয় না। দিনশেষে বাকি কোটিকোটি তেলাপোকার মাঝে আমিও একটা তেলাপোকার মতো খেয়েপরে জীবন কাটিয়ে দিচ্ছি, বা জীবনকে ওইদিকে নিয়ে যাচ্ছি, এটাও কি কাউকে ভাবায় না?\r\n\r\nযাই হোক, আমরা নিজেরাই ঠুনকোভাবে জীবনযাপন করছি, কোনোভাবে বেঁচে থাকার চেষ্টা করছি, আর আবার আমরাই বলছি, বাঙালিদের দ্বারা কিছু হবে না। হাস্যকর না? সৃষ্টিকর্তার কাছে কৃতজ্ঞতা, আমার সেই দশ বছর আগের মানসিকতা এখনো পরিবর্তন হয়নি। \"টাকা কামানোর জন্য পড়াশুনা এবং বেঁচে থাকার জন্য টাকা কামানো এবং মরে যাওয়ার জন্য বেঁচে থাকা\" - এই মানসিকতা এখনো আসেনি আমার মধ্যে, কৌতুহলী মন মরে যায়নি। যেদিন লড়াই করার মানসিকতা, এক্সপ্লোরার মানসিকতা, এক্সিলেন্সের প্রতি ক্ষিদা মরে যাবে, বাকিদের মতো সম্মানের চাকরি-ব্যবসা বা কিছু একটা করে বাড়ি-গাড়ি করে জীবনে আরাম করার মানসিকতা এসে যাবে, সেদিনই আমার মৃত্যু হোক।','published',1),(10,'Inside the Mind of a Sociopath','blog10','2024-10-08 07:07:29.908394','2024-10-12 15:09:55.404825','The term <strong>\"sociopath\"</strong> often evokes images of cold-hearted criminals or manipulative masterminds, but the reality of living with antisocial personality disorder (ASPD) is far more complex and nuanced. Sociopathy, as a subset of ASPD, represents a constellation of traits that include a lack of empathy, manipulativeness, and impulsivity. But what exactly goes on inside the mind of a sociopath? What drives their behavior, and how do they see the world?\r\n<h3>1. Lack of Empathy: A Life Without Emotional Connection</h3>\r\nOne of the hallmark traits of sociopathy is an inability to empathize with others. Sociopaths struggle to feel compassion or concern for the suffering of others. For most people, empathy acts as an emotional bridge, allowing them to understand and respond to the feelings of others. In a sociopath\'s mind, this bridge is either missing or severely compromised.\r\n\r\nWithout empathy, the world can become a cold, transactional space. Sociopaths are often adept at mimicking emotions, using charm and charisma to manipulate others, but these displays are typically superficial. They know how to “read” people, but only to use their vulnerabilities for personal gain.\r\n<h3>2. Egocentric Worldview: The Universe Revolves Around Them</h3>\r\nSociopaths tend to view the world through a highly self-centered lens. Everything and everyone around them is assessed based on how it serves or hinders their personal desires. They have a tendency to see people as tools, rather than as individuals with their own rights and emotions.</p>\r\n<p>This egocentric worldview often leads to the violation of social norms and the exploitation of others. Sociopaths frequently disregard laws, rules, and boundaries because they don\'t believe these structures apply to them. They might engage in theft, deception, or even violence without feeling remorse or guilt.\r\n<h3>3. Impulsivity and Risk-Taking: Living in the Moment</h3>\r\nAnother defining feature of sociopathy is a high level of impulsivity. Sociopaths tend to act on immediate desires without considering the long-term consequences of their actions. This impulsiveness can manifest in reckless behaviors like substance abuse, criminal activities, or dangerous driving.\r\n\r\nThe sociopath\'s brain craves stimulation and is often bored with routine or mundane tasks. Because of this, they are more likely to seek out thrills or engage in risky behavior, even if it puts themselves or others in danger. The lack of regard for consequences also means they often don\'t learn from past mistakes.\r\n<h3>4. Superficial Charm: Master Manipulators</h3>\r\nWhile sociopaths may lack deep emotional bonds, they are often excellent at presenting themselves as charming, likable, and persuasive. This is because they can quickly assess what people want or need and use that knowledge to their advantage.\r\nSociopaths may tell you what you want to hear, ingratiating themselves to gain your trust and cooperation. Behind this charm, however, is a calculated strategy. Whether it\'s manipulating a colleague at work, a friend, or even a romantic partner, sociopaths often view relationships as power dynamics rather than genuine connections. Their goal is to control or dominate, not to build mutual understanding.\r\n<h3>5. Absence of Guilt or Remorse</h3>\r\nOne of the most chilling aspects of sociopathy is the absence of guilt or remorse. While most people feel shame after hurting someone, a sociopath typically does not. If their actions lead to harm, they are unlikely to feel any moral responsibility for it. This emotional detachment from their actions makes it difficult for sociopaths to acknowledge or even care about the damage they cause.\r\n<h3>6. Deception as a Way of Life</h3>\r\nLying comes naturally to sociopaths. Whether it’s small white lies or elaborate deceptions, they can lie effortlessly to get what they want. Because they don\'t feel guilt or anxiety about deceiving others, they are often highly skilled at it. This ability to manipulate the truth is one of the reasons why sociopaths can be so dangerous, particularly in relationships or positions of power.\r\n<h3>7. Limited Long-Term Goals: Living for Short-Term Gratification</h3>\r\nWhile sociopaths can be ambitious, their goals are often focused on short-term gratification rather than long-term achievements. Their impulsive nature and lack of foresight make it difficult for them to commit to a sustained effort toward a goal. They may switch jobs frequently, leave relationships abruptly, or abandon projects once they lose interest or when obstacles arise.\r\n\r\nThis lack of perseverance can be a source of frustration for those around them, particularly when sociopaths initially present themselves as motivated and driven, only to falter once the work gets difficult or less exciting.\r\n<h3>8. The Sociopath’s Inner Void</h3>\r\nPerhaps the most tragic aspect of sociopathy is the sense of emptiness that often pervades the sociopath\'s inner life. Sociopaths may lack deep emotional connections, leaving them feeling unfulfilled or disconnected from the world around them. This void can fuel their constant need for stimulation, excitement, and control over others.\r\n\r\nDespite their outward confidence and charm, some sociopaths may feel an undercurrent of dissatisfaction or boredom. Their inability to form meaningful connections or experience a full range of emotions can leave them trapped in a cycle of superficial relationships and unfulfilled desires.\r\n<h2>Conclusion: The Enigma of the Sociopathic Mind</h2>\r\nThe mind of a sociopath is a puzzle of contradictions: highly perceptive but emotionally disconnected, charming yet manipulative, impulsive yet calculating. While sociopaths may seem confident and in control, their world is often a hollow one, built on manipulation, deception, and self-interest.\r\n\r\nUnderstanding the mind of a sociopath doesn\'t necessarily lead to sympathy, but it does provide insight into the forces that drive their behavior. Sociopathy is a mental disorder that strips away the fundamental aspects of human connection, leaving behind a complex but deeply flawed way of navigating the world.','published',5),(13,'The Robin Theory','blog11','2024-10-08 17:23:59.630546','2024-10-12 15:10:54.676160','Everyone has their own Robin, the person that you love so much but can’t be with. The person that stole your heart but left you wondering what did you do wrong…\r\n\r\nWhen Ted met Robin and started to get to know her, she was nothing like the girl of his dreams, she fears commitment, hate kids, doesn’t share the same interests as Ted’s. But when he met Tracy the perfect girl for him that has it all, she wasn’t enough, because Robin was always the right one for Ted no matter how different they are.\r\n\r\nBecause love doesn’t make sense! You cannot rationalize your way into or out of it. Just don’t try to search for the person who shares the same interests as you. Whoever you meet whatever you do, you’ll always find your way back to the person who stole your heart, the person that gives you butterflies when you’re around. The person that will drive you crazy enough to steal a blue French horn or to travel the world just to get a locket…\r\n\r\nAt the end, you’ll always find yourself going back to your Robin…','published',1),(14,'Love & Acceptance','blog12','2024-10-08 17:26:01.576139','2024-10-08 17:26:01.576139','Those I love, I love anyway, whether they love me or not. And wherever I am, there will always be a soft corner in my heart for them, cause I love them. Do they love me or not, it doesn\'t matter. I don\'t want to spoil the beauty of love by thinking about this matter. The ability of loving, it is beautiful itself. I can love and they can love. If their love is for someone else, it\'s also ok. Because they can love someone and it\'s beautiful. I love a bird, that doesn\'t mean I have to keep it in a cage to keep it close to me. I can\'t even expect that I would not keep it in the cage and still it will not fly away from me, it will stay with me forever. It\'s a bird, it will fly, nevertheless. Still, it is my bird, my love will never fade for it. If it remains happy in the jungle, I will be happy. If it sometimes comes to visit me, I will be the happiest person.','published',4),(15,'ছোটবেলার স্বপ্ন ও বড়বেলার বাস্তবতা','blog13','2024-10-08 17:26:54.783097','2024-10-08 17:26:54.783097',': ছোটবেলায় আমাদের কিছু স্বপ্ন থাকে, কিছু দৃঢ় প্রতিজ্ঞা থাকে। যেমন, কেউ চায় নিজে খুব বড় কিছু বা দশজনের চেয়ে আলাদা কিছু একটা অর্জন করতে, অনেকে চায় সমাজে বড় পরিবর্তন আনতে। বড় হতে হতে দেখা যায়, মানুষ এসব আর করে উঠে না। আবার যারা সমাজ পরিবর্তনের মতো এমন কোনো পদমর্যাদায় উঠে, তারাও দেখা যায় নিজের জীবন নিয়ে ব্যস্ত, ছোটবেলার সেই প্রতিজ্ঞাগুলো আর খেয়াল নেই, খেয়াল থাকলেও সেই গুরুত্ব আর নেই। এমনটা কেন হয়? \r\n\r\n: সাধারণ মানুষের এটাই তো সহজাত প্রবৃত্তি। এরা ভীরু প্রকৃতির হয়, জীবনে শর্টকাট খুঁজে এবং কোনোভাবে দশজনের চোখে সম্মানের অবস্থানে থেকে, হতে পারে সে সম্মান মেকি, নিজেরা আরাম-আয়েশ করে মরতে পারলেই বাঁচে। স্বপ্নপূরণ করতে হলে শিশুসুলভ মনকে বাঁচিয়ে রাখতে হয়, সাহসী হতে হয়, দশজনকে অতিক্রম করে আলাদা উচ্চতায় নিজেকে নিয়ে যাওয়ার তীব্র ইচ্ছা ও সেই পরিশ্রম করার মতো স্পৃহা থাকতে হয়। সেটা কয়জনেরই বা থাকে!\r\n\r\n: কিন্তু আমার তো মনে হয় ছোটকালে সবার মানসিকতাটা ঠিক এমনই থাকে। কেবল সে ভাবে আমি এখনো ছোট, যেদিন বড় হবো, বা বড় হতো হতে জীবনে যখন সু্যোগ আসবে, আমি এসব পূরণ করবো। বড় হতে হতে এমন কি হয় যে এ ধরনের মানসিকতা হারিয়ে যায়?\r\n\r\n: যখন আমরা ছোট থাকি, আমাদের সামনে একটাই বাধা আছে বলে মনে হয়, সেটা হলো আমরা ছোট, আমাদের সুযোগ আর ক্ষমতা কম। তখন আমাদের চিন্তাগুলো খুব সরল প্রকৃতির হয়। জীবনে বেঁচে থাকা বা সমাজে টিকে থাকার জন্য যে জটিল প্রক্রিয়ার মধ্য দিয়ে যেতে হয়, তখন সেটা আমাদের জানা থাকে না, বা বুঝার সেই বয়স তখনও হয় না। তখনও আমাদের চিন্তাভাবনা সামাজিক বেড়াজালে বন্দী হয় না, আমরা নিজের জন্য বেঁচে থাকার স্বপ্ন দেখি, বাকি দশজনের চোখে ভালো থাকার চিন্তা আমাদের মনকে তখনও কলুষিত করে না। মূল কথা, ছোট বয়সে যা-ই চিন্তা করি, সবই সহজ সরল প্রকৃতির হয়। এসব অর্জন করতে যেসব বাধা আসলে আসবে, সেগুলো নিয়ে আমাদের কোনো ধারণাই থাকে না। যখন ধারণা আসতে শুরু করে, তখনও আমরা সেই স্বপ্ন ধরে রাখতে পারছি কিনা সেটা আমাদের মনোবল আর নৈতিকতার উপর নির্ভর করে। কিছু মানুষই ছোটবেলার আদর্শ ধরে রাখতে পারে, বাকিদের মরচে ধরে, অনেকের একেবারেই বিকৃত হয়ে যায়।\r\n\r\n: বুঝলাম। এখন আমার যদি কোনো পরিবর্তন আনার সত্যিই ইচ্ছা থাকে, তাহলে কি করা উচিত? আমার কি চেষ্টা করা উচিত এমন একটা পজিশনে যাওয়ার জন্য, যেখান থেকে আসলেই পরিবর্তন আনা সম্ভব?\r\n\r\n: হ্যাঁ এবং না। আমাদের অবশ্যই এমন অবস্থানে যাওয়া চেষ্টা চালিয়ে যাওয়া উচিত, কিন্তু তার পাশাপশি এখনই নিজের জীবনে বা আশেপাশে ছোটোখাটো হলেও কিছু পরিবর্তন আনার চেষ্টা করা উচিত। অনভ্যাসে বিদ্যা হ্রাস বলে একটা কথা আছে। সেটা এক্ষেত্রেও খাটে। হুট করে একদিন গিয়ে সবকিছু করবো, এটা আসলে অবাস্তব চিন্তা। কারণ চর্চা না থাকতে থাকতে একসময় এ চিন্তাতেই মরচে পরে যাবে, আর ওসব করতে ইচ্ছা হবে না তখন। এজন্যই শুধু পরিবর্তন আনার ক্ষেত্রে না, যার যেটা যেটা করার ইচ্ছা থাকে জীবনে, সেটা এখন থেকে হলেও ছোট পরিসরে করা শুরু করা উচিত, অন্তত যাতে প্রাত্যাহিক জীবনে এটার চর্চা থাকে এবং চর্চার মাধ্যমে আমরা আমাদের স্বপ্নটা বাঁচিয়ে রাখতে পারি। সেই সাথে এটার আরেকটা সুবিধাও আছে যে, ছোট পদক্ষেপ, বাধাও ছোট। বড় পরিসরে যদি একসাথে কিছু শুরু করতে যায়, একসাথে অনেক বাধা চোখে পরবে, যেসব অতিক্রমের মানসিক প্রস্তুতি আমাদের থাকবে না। ছোট থেকে শুরু করলে সেসব বাধা ছোট ছোট করে হলেও আমাদের চোখে পরবে, আমরা সেগুলো নিয়ে সজাগ থাকবো। তখন বড় পরিসরে আসলেও আমরা ঘাবড়ে যাবো না, হাল ছেড়ে দিবো না।\r\n\r\n: তো এভাবে এখন থেকে চেষ্টা করলে তো আমাদের অনেক ভুল হতে পারে, অনেক ভুল ডিরেকশনে চেষ্টা চালিয়ে সময় অপচয়ও করতে পারি। তার চেয়ে কি এটাই ভালো নয় যে, পরিপূর্ণ জ্ঞানার্জন করে, নিজেকে সম্পূর্ণ গড়ে তোলে, তারপর এসবের দিকে নজর দেয়া?\r\n\r\n: Remember, perfect moment doesn’t exist. And progress is better than perfection.','published',4),(16,'জ্ঞানের একপেশে প্রয়োগ','blog14','2024-10-08 17:30:02.764448','2024-10-08 17:30:02.764448','জ্ঞানী মানুষদের জ্ঞানটাই অনেকসময় বড় অভিশাপ হয়ে দাঁড়ায়। তারা তাদের ওই জ্ঞানের ভারে জ্ঞানকে অতিক্রম করে নতুন জ্ঞান সহজে অর্জন করতে পারে না। এমন কয়েকটা উদাহরণ দিচ্ছি, একজন বিজ্ঞানী মনে করতে পারে সব বিজ্ঞান দিয়ে ব্যাখ্যা দেওয়া সম্ভব, গণতন্ত্রে বিশ্বাসী একজন মনে করতে পারে, মানুষের বাকস্বাধীনতার অধিকার দেওয়াটাই সবচেয়ে বড় অধিকার, তাই সবখানে সব আলোচনাতেই সে কোনোভাবে এটাকে ইঞ্জেক্ট করবেই, একজন ধর্মপ্রাণ ব্যক্তি মনে করতে পারে, জীবনে যাই করি, সবকিছুই ধর্মীয় দৃষ্টিকোণ থেকে যাচাই করে নিতেই হবে। এগুলো হলো এক্সট্রিম কেইস, যখন ইনারা ইনাদের জ্ঞানের ভারে নিজেরাই আটকা পরে গেসেন, এর বাইরে আর দেখতে পারতেসেন না, এমনকি যেটা তার স্পেশালাইজড টপিক দিয়ে ব্যাখ্যা করা যাবে না, সেখানেও সেটা আনার চেষ্টা করেন। এমন না যে উনারা ভুল, কিন্তু উনারা সবকিছুতেই জ্ঞান প্রতিষ্ঠা করতে গিয়ে নিজেকেই চুপসে ফেলেন।\r\n\r\nধর, একজন ব্যক্তির এটা বিশ্বাস যে, ইশ্বরকে পেতে হলে তাকে রাতদিন ইবাদত বা প্রার্থনা করতে হবে। তখন থেকে সে খাওয়া ঘুম এসব অপরিহার্য বিষয় বাদে শুধু একটা কাজই করে, রাতদিন প্রার্থনা করে, স্রষ্টাকে স্মরণ করে। আমি মনে করি এমনটা হতে পারে: স্রষ্টা বলবে, হায়রে বোকা, আমাকে চাস বলে সারাদিন আমাকেই যে জপলি, কিছুক্ষণ তো পারতি বাইরে বের হয়ে আমার সৃষ্টি করা দুনিয়াটা দেখতে, পারতি তোর ছেলেটার সাথে একটু খেলা করতে, পারতি একটু আজকের খবরের কাগজটা পড়ে দেখতে, পারতি একটু যেখানে স্রষ্টার কোনো চর্চা হয় না, সেখানে আসলে কি হয় সেটা একটু ঘুরে দেখতে। হয়তো এসবে আমাকে অন্যভাবেও তুই আবিষ্কার করতে পারতি। \r\n\r\nএইসব আলোচনার সারবস্তু হলো, জ্ঞানার্জনের সময়ও নিজের মনকে উন্মুক্ত রাখা, জীবনের প্রতি নম্র দৃষ্টিভঙ্গি রাখা। সবকিছুর প্রতি খুবই সিরিয়াস, কাঠখোট্টা, বাক্সবন্দী দৃষ্টিভঙ্গি না রেখে, বা আদর্শের বেড়াজালে কড়াভাবে বন্দী না থেকে, একটু ঢিলেঢালা পোশাকে থেকে জগতকে দেখতে হবে, বুঝতে হবে।','published',4),(17,'অনুভূতি, ইশ্বর ও প্রেম','blog15','2024-10-08 17:30:39.822987','2024-10-08 17:30:39.822987','যে জিনিস অনুভব করে বুঝতে হয়, সে জিনিস হিসাব কষে, বিশ্লেষন করে, গাদাগাদা বই পড়ে, দেখে, বুঝা মোটেও সম্ভব না। আমার মতে এরকম দুইটা বিষয়ের একটা হলো ইশ্বর, আরেকটা হলো প্রেম। এগুলো আগে অনুভব না করে ব্যাখ্যা বিশ্লেষণে যাওয়াটা বোকামি।','published',4),(18,'স্বার্থপরতা, সাদাকালো ও পোষা প্রাণী','blog16','2024-10-08 17:35:23.114336','2024-10-08 17:35:23.114336','আমরা স্বার্থ শব্দটা বেশিরভাগ ক্ষেত্রেই নেগেটিভ ভাবেই ভেবে নিই। \r\n\r\n যেমন ধর, আমি মাঝেমাঝে তোর সাথে বিভিন্ন বিষয়ে কথা বলি বা তোর কোনো সমস্যা হলে সেগুলো দেখি। কেন কথা বলি? বা এসব যোগাযোগের প্রয়োজনই বা কি? সিম্পল উত্তর হলো, তোর সাথে কথা বলে আমার ভালো লাগে। এখানে উত্তরটা খেয়াল কর, \"আমার\", মানে স্বার্থ জড়িত। এখন আমি তো আমার স্বার্থ পূরণের জন্যই তোর সাথে কথা বলছি। তারমানে কি এটা দাঁড়ায়, তোর সাথে কথা বলতে আমার আরাম বা ভালো না লাগলে আমি কথা বলতাম না বা হেল্প করতাম না? হ্যাঁ করতাম, কিন্তু করার ভঙ্গিতেই তুই বুঝতি যে আমি অনিচ্ছাসত্ত্বে করছি। তারমানে তোর সাথে আমি যোগাযোগের বিষয়টা বেশিরভাগই নির্ভর করতেসে \"আমার\" তোকে কতটুকু ভালো লাগে তার উপর। \r\n\r\nএভাবে যে কারও সাথে সম্পর্ক রাখার ক্ষেত্রে আমি আমার ভালো লাগা ধর্তব্যে নিচ্ছি, তারমানে কি আমার উদ্দেশ্য খারাপ? বা এটা খারাপ কিছু? মোটেও না। অথবা খারাপ কিনা নির্ভর করতেসে আমার যোগাযোগ রাখার বিষয়টা তোর কেমন লাগতেসে তার উপর। তোর দিক থেকেও যদি চিন্তা করি, তোর ক্ষেত্রেও আমার সাথে যোগাযোগ রাখার কারণ মোটামুটি একই। তারমানে দুইজনের ক্ষেত্রেই কমবেশি যোগাযোগ রাখার ক্ষেত্রে নিজ নিজ ভালো লাগাটাই মানে স্বার্থটাই প্রাধান্য পাচ্ছে। \r\n\r\n তো আমি যদি এই মেন্টালিটিতেই থাকি যে, আমি যার সাথেই সম্পর্ক করছি, সবখানেই গুরুত্ব দিচ্ছি নিজেকে। এভাবে স্বার্থপরের মতো \"আমার ভালো লাগছে বলে সম্পর্ক রাখছি\" এটা ভাবাটা একপেশে। যদি এটা নাই হতো, দেখা যেতো রাস্তাঘাটের যাকেই পরার্থপরতা দেখানো যায় সবার সাথেই আমার সম্পর্ক থাকতো, তাকে আমার ব্যক্তিগতভাবে ভালো লাগুক আর না লাগুক।\r\n\r\nআমরা যখন কারো প্রেমে পরি, প্রেমে পরার কারণটা (যদিও বেশিরভাগ ক্ষেত্রে অস্পষ্ট বা অজানা থাকে) ঘুরেফিরে তাকে আমাদের কোনো না কোনোভাবে ভালো লেগে যায়, তাই থাকে। এভাবে একটা ভালো সম্পর্ক গড়ে উঠার পর ওই মানুষটাও আমাদের যত্ন নেয়, আমাদের ভালোবাসে, ঠিক তখন গিয়ে আমরা তার সাথে যাচ্ছেতাই আচরণ করতে পারি বা অবহেলা করতে পারি, এর আগে না। কারণ এর আগে যদি তাকে অবহেলা করিও, তার সেটা বুঝারই কথা নয়।\r\n\r\nএবার যদি বিড়াল-কুকুরের দিকে যাই, প্রাণীরা কিন্তু ওদের কেয়ার করলেই আমাদের দিকে আকৃষ্ট হয়, হুদাই হুদাই কোনো প্রাণী তোমাকে এসে ভালোবাসা দেখাবে, এমনটা হয়না। তুই বিড়াল-কুকুরকে মায়া-মমতা দেখানোর পরই ওরা তোমার অন্ধভক্ত হবে, এর আগে না। তবে ওরা তোমার অন্ধভক্ত হওয়ার পর তুমি যদি ওদের থেকে মায়া-মমতা কেড়ে নাও, তবে সেটা অবশ্যই খারাপ। বাট প্রথমটা তোমার থেকেই আসছে।\r\n\r\nএখন আমি যদি বলি যে, ভাই, আমি একা হয়ে গেছি তাই আমার খারাপ লাগছে, এখানেও আমি নিজের চিন্তা করতেসি, আমি কত খারাপ - এডা কিসু হইলো?\r\n\r\nতাহলে তো কারো সাথে সম্পর্ক করাটা যেমন স্বার্থপরতা, না করটাও স্বার্থপরতা।\r\nএখন এটার মাপ কাঠি কি?\r\n\r\nআমার মাপকাঠি হলো কোনো কিছুর শুরুতে নিজের স্বার্থ থাকাটাই স্বাভাবিক, কিন্তু পরবর্তীতে যাতে অন্যের দিকটাও আমি ভাবনায় রাখি। আমি যদি নিজের স্বার্থে কারো সাথে কিছু করি, তাহলে যাতে আমি তার স্বার্থেও তার জন্য কিছু করার মন-মানসিকতা রাখি। এটাই।','published',5),(19,'Relationships: Wrong?','blog17','2024-10-08 17:37:17.563957','2024-10-08 17:37:17.563957','Study tells us that we need human connection to live a happy and healthy life. For this, we need to cultivate our relationships and try to stay connected and take care of the people we want or need in our life. সহজ কথায়, সম্পর্ককে for granted না নিয়ে nurture করতে হবে, আমরা যাদের কেয়ার করি তাদের খবরাখবর রাখতে হবে, পাশে থাকতে হবে। \r\n\r\nThat leads to another question. What if the people we care so much don’t care about us much? What if they turn out toxic? কারণ একদিক থেকে চেষ্টা করতে করতে যদি আরেকদিক থেকে সেইম এফোর্ট না দেখি তাহলে সেটা উলটো বড় কষ্টের কারণ হয়ে দাঁড়াতে পারে। এবং এ ধরনের ঘটনা জীবনে একবার ঘটলে পরবর্তীকালেও এর ছাপ রেখে যায়, তখন মানুষ নতুন করে কারও সাথে কানেক্টেড হতে ভয় পায়। \r\n\r\nআমরা বুঝলাম যে সম্পর্ক লাইফে লাগবে, কিন্তু সম্পর্ক যদি কষ্টের কারণ হয়ে দাঁড়ায়? এক্ষেত্রে অবশ্য বলতে হবে, we chose the wrong persons, still it’s an issue.','published',5),(20,'গান, গল্প, কাব্য ও সঙ্গী','blog18','2024-10-08 17:45:27.762081','2024-10-09 19:58:57.119079','দিনশেষে, মাসশেষে, বছরশেষে ঘুরেফিরে আশ্রয় নিই গানের কাছে। মানুষের কাছে নিজেকে প্রকাশ করা বৃথা মনে হয়। যেসব কথা একান্ত ব্যক্তিগত, যেসব কথা নিজের ক্ষত হৃদয়ের, বাঁধভাঙা উচ্ছাসের, স্বপ্নের - সেসব কথা বলি আমি গানের কাছে, কবিতার কাছে, গল্পের কাছে। এজন্য আমাকে বোঝার কেউ নেই - এসব ভেবে কখনো একা অনুভব হয়নি। আমি যা বলতে চাইছি, কোনো না কোনো গান তা যেন আমার হয়ে বলে দেয়, লেখক তার লেখনীর মাধ্যমে প্রকাশ করে শৈল্পিকভাবে। এজন্য মানববিহীন জীবন আমার কাছে স্বাচ্ছন্দ্যের জীবন। শুনেছি গাছেরা নাকি মানুষের কথা, মানুষের অনুভূতি বুঝতে পারে। হয়তো এমন এক দিন আসবে, যখন আমি বাস করব প্রকৃতির খুব কাছাকাছি। আমার কথা বোঝার জন্য অনেক গাছ থাকবে, যারা আমায় বুঝবে, তা প্রকাশ করবে তাদের নীরবতার মাধ্যমে, রহস্যের মাধ্যমে, যে রহস্য আমার আর তাদের মধ্যেই সীমাবদ্ধ থাকবে।','published',6),(21,'Rangamati','none','2024-10-15 14:51:19.925843','2024-10-15 14:52:09.233464','Rangamati is a beautiful town located in the Chittagong Hill Tracts of Bangladesh1\r\n. Known as the \"Lake City\" of Bangladesh, it is the administrative headquarters of Rangamati District1\r\n. Here are some highlights about Rangamati:\r\n\r\nNatural Beauty: Rangamati is surrounded by lush green hills and is home to the largest man-made lake in Bangladesh, Kaptai Lake2\r\n. The lake offers stunning views and various water activities like boating2\r\n.\r\n\r\nCultural Heritage: The town has a rich cultural heritage, being the former capital of the Chakma kingdom during British rule1\r\n. The indigenous communities in the area have unique traditions and customs.\r\n\r\nTourist Attractions: Apart from Kaptai Lake, Rangamati is known for its picturesque landscapes, including the Sajek Valley, which is often referred to as the \"Misty Valley\" due to its foggy and serene environment3\r\n2\r\n.\r\n\r\nAdventure and Exploration: The region offers numerous trekking and hiking trails, providing adventure enthusiasts with opportunities to explore the natural beauty of the area.\r\n\r\nRangamati is a perfect destination for those looking to experience the natural beauty and cultural richness of Bangladesh. Have you ever visited or considered visiting Rangamati?','published',8);
/*!40000 ALTER TABLE `blogapp_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogapp_notification`
--

DROP TABLE IF EXISTS `blogapp_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogapp_notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `notification_type` varchar(20) NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `blog_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Blogapp_notification_blog_id_793441d3_fk_Blogapp_blog_id` (`blog_id`),
  KEY `Blogapp_notification_user_id_02212cf5_fk_auth_user_id` (`user_id`),
  CONSTRAINT `Blogapp_notification_blog_id_793441d3_fk_Blogapp_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `blogapp_blog` (`id`),
  CONSTRAINT `Blogapp_notification_user_id_02212cf5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogapp_notification`
--

LOCK TABLES `blogapp_notification` WRITE;
/*!40000 ALTER TABLE `blogapp_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `blogapp_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogapp_profile`
--

DROP TABLE IF EXISTS `blogapp_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogapp_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `slug` varchar(30) NOT NULL,
  `birthdate` date NOT NULL,
  `about` longtext NOT NULL,
  `profilePic` varchar(100) NOT NULL,
  `author_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  UNIQUE KEY `author_id` (`author_id`),
  CONSTRAINT `Blogapp_profile_author_id_12415c00_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogapp_profile`
--

LOCK TABLES `blogapp_profile` WRITE;
/*!40000 ALTER TABLE `blogapp_profile` DISABLE KEYS */;
INSERT INTO `blogapp_profile` VALUES (1,'niruddesh_jatra','1999-03-06','Explorer','profiles/IMG_20220724_134736_B0SFbYX.jpg',1),(2,'messi','1975-08-28','G.O.A.T','profiles/Alone_in_DARK27479_rectangle.jpg',2),(3,'cr7','1975-08-28','Siuuuuu','profiles/blacksharetemp.jpg',3),(4,'humayun','1943-02-28','Writer, Chemist, Teacher','profiles/images_6.jpeg',4),(5,'sherlock','1965-05-05','A High-functioning Sociopath','profiles/Sherlock_BBC_Series-14.jpg',5),(6,'anonymous','1999-03-06','Still a puzzle','profiles/IMG_20221006_112042_1.jpg',6),(7,'musky','1964-05-08','Founder of SpaceX, Tesla and many more','',7),(8,'aditya','2002-02-11','Human being','',8);
/*!40000 ALTER TABLE `blogapp_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-10-05 15:45:44.780284','1','niruddesh_jatra',2,'[{\"changed\": {\"fields\": [\"Username\", \"First name\", \"Last name\"]}}, {\"added\": {\"name\": \"profile\", \"object\": \"niruddesh_jatra\"}}]',4,1),(2,'2024-10-06 12:49:50.315906','2','lm10',2,'[{\"changed\": {\"fields\": [\"Username\", \"First name\", \"Last name\"]}}]',4,1),(3,'2024-10-07 19:56:54.503970','1','niruddesh_jatra',2,'[{\"changed\": {\"fields\": [\"ProfilePic\"]}}]',8,1),(4,'2024-10-08 07:13:25.390386','10','Inside the Mind of a Sociopath by sherlock',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',7,1),(5,'2024-10-09 18:03:45.827105','6','Repeated Toxicity by cr7',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',7,1),(6,'2024-10-09 19:58:49.177280','20','গান, গল্প, কাব্য ও সঙ্গী by anonymous',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'Blogapp','blog'),(9,'Blogapp','notification'),(8,'Blogapp','profile'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-10-05 11:10:29.875962'),(2,'auth','0001_initial','2024-10-05 11:10:30.720783'),(3,'Blogapp','0001_initial','2024-10-05 11:10:31.049872'),(4,'admin','0001_initial','2024-10-05 11:10:31.276290'),(5,'admin','0002_logentry_remove_auto_add','2024-10-05 11:10:31.284298'),(6,'admin','0003_logentry_add_action_flag_choices','2024-10-05 11:10:31.296846'),(7,'contenttypes','0002_remove_content_type_name','2024-10-05 11:10:31.398617'),(8,'auth','0002_alter_permission_name_max_length','2024-10-05 11:10:31.491387'),(9,'auth','0003_alter_user_email_max_length','2024-10-05 11:10:31.520899'),(10,'auth','0004_alter_user_username_opts','2024-10-05 11:10:31.530568'),(11,'auth','0005_alter_user_last_login_null','2024-10-05 11:10:31.615053'),(12,'auth','0006_require_contenttypes_0002','2024-10-05 11:10:31.615053'),(13,'auth','0007_alter_validators_add_error_messages','2024-10-05 11:10:31.624658'),(14,'auth','0008_alter_user_username_max_length','2024-10-05 11:10:31.724530'),(15,'auth','0009_alter_user_last_name_max_length','2024-10-05 11:10:31.814523'),(16,'auth','0010_alter_group_name_max_length','2024-10-05 11:10:31.840432'),(17,'auth','0011_update_proxy_permissions','2024-10-05 11:10:31.846969'),(18,'auth','0012_alter_user_first_name_max_length','2024-10-05 11:10:31.941456'),(19,'sessions','0001_initial','2024-10-05 11:10:31.989644'),(20,'Blogapp','0002_alter_profile_slug','2024-10-05 15:45:31.054178'),(21,'Blogapp','0003_alter_blog_author','2024-10-06 06:49:28.717965'),(22,'Blogapp','0004_notification','2024-10-22 19:56:23.612736');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('84b7s8bxuhnax61btroi29sf6uk7ghie','.eJxVjEEOwiAQRe_C2hCgBVqX7nsGMsMMUjWQlHZlvLtt0oVu_3vvv0WAbc1ha7yEmcRVaHH53RDik8sB6AHlXmWsZV1mlIciT9rkVIlft9P9O8jQ8l6nyE4DkxsNJt-hYkW6G9CqREDIrut7gxETGLVzP1pr2A-gmC25hOLzBRQ1ORg:1syuvU:CFJFRUf22W1rnVVZbl9ex86DJ0x5cSBiYHdaVL5p-rg','2024-10-24 15:18:04.900471'),('8wnnsc2zf9nec8j7dl7j05gvmb6kg8kl','.eJxVjEEOwiAQRe_C2hCgBVqX7nsGMsMMUjWQlHZlvLtt0oVu_3vvv0WAbc1ha7yEmcRVaHH53RDik8sB6AHlXmWsZV1mlIciT9rkVIlft9P9O8jQ8l6nyE4DkxsNJt-hYkW6G9CqREDIrut7gxETGLVzP1pr2A-gmC25hOLzBRQ1ORg:1sz7BI:x1p8dvH_NO7_EEaOOKXqsAbvUaw-rCCQ_oWVWxo1-xA','2024-10-25 04:23:12.820341'),('9whsg785enssvnpmowzgkfk44bgtzvrk','.eJxVjEEOwiAQRe_C2hCgBVqX7nsGMsMMUjWQlHZlvLtt0oVu_3vvv0WAbc1ha7yEmcRVaHH53RDik8sB6AHlXmWsZV1mlIciT9rkVIlft9P9O8jQ8l6nyE4DkxsNJt-hYkW6G9CqREDIrut7gxETGLVzP1pr2A-gmC25hOLzBRQ1ORg:1syT6g:OrF3fuJ0CvTNRnt8XeqRA5iLv450sxgc4nQ2AhPqqKA','2024-10-23 09:35:46.770514'),('ic50optv32lzfq35rw77r8ydptjkkbum','.eJxVjEEOwiAQRe_C2hCgBVqX7nsGMsMMUjWQlHZlvLtt0oVu_3vvv0WAbc1ha7yEmcRVaHH53RDik8sB6AHlXmWsZV1mlIciT9rkVIlft9P9O8jQ8l6nyE4DkxsNJt-hYkW6G9CqREDIrut7gxETGLVzP1pr2A-gmC25hOLzBRQ1ORg:1sySX0:-AfH0sjiq133h5kn6-4ZZzJvY38VUPLfGnzZTiBlUSA','2024-10-23 08:58:54.797225'),('ura77tc3qkyjjer43mihzb0psd0mhufd','.eJxVjEEOwiAQAP_C2RBol0I9evcNZJddpWogKe3J-HdD0oNeZybzVhH3Lce9yRoXVmfl1OmXEaanlC74geVedaplWxfSPdGHbfpaWV6Xo_0bZGy5bwVmHpOE22SGAIzOAIlDNwKhI59oJvIEKY0DTQJBrBUbiIy3wgbV5wv83Tiv:1t0ixB:7BiHxm6on7qOeqI9yRm-kr98PkXSVUqzLcKBMi-he-4','2024-10-29 14:55:17.511122');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-23  8:34:59
