-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: social_networks
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
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idCommunity` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `genre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idCommunity` (`idCommunity`),
  CONSTRAINT `artists_ibfk_1` FOREIGN KEY (`idCommunity`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,1,'OG BUDA','Трэп'),(2,1,'FACE','Рэп');
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists_to_user`
--

DROP TABLE IF EXISTS `artists_to_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists_to_user` (
  `idArtist` int NOT NULL,
  `idUser` int NOT NULL,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`idArtist`,`idUser`),
  KEY `idUser` (`idUser`),
  CONSTRAINT `artists_to_user_ibfk_1` FOREIGN KEY (`idArtist`) REFERENCES `artists` (`id`),
  CONSTRAINT `artists_to_user_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists_to_user`
--

LOCK TABLES `artists_to_user` WRITE;
/*!40000 ALTER TABLE `artists_to_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `artists_to_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idCommunity` int DEFAULT NULL,
  `CommunityRole` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idCommunity` (`idCommunity`),
  CONSTRAINT `chats_ibfk_1` FOREIGN KEY (`idCommunity`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chats`
--

LOCK TABLES `chats` WRITE;
/*!40000 ALTER TABLE `chats` DISABLE KEYS */;
/*!40000 ALTER TABLE `chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `privacyStatus` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'Рифмы и панчи','Блог','Открытая группа'),(2,'Программирование','Программирование','Открытая группа');
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities_like_posts`
--

DROP TABLE IF EXISTS `communities_like_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities_like_posts` (
  `idPost` int NOT NULL,
  `idCommunity` int NOT NULL,
  PRIMARY KEY (`idPost`,`idCommunity`),
  KEY `idCommunity` (`idCommunity`),
  CONSTRAINT `communities_like_posts_ibfk_1` FOREIGN KEY (`idPost`) REFERENCES `posts` (`id`),
  CONSTRAINT `communities_like_posts_ibfk_2` FOREIGN KEY (`idCommunity`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities_like_posts`
--

LOCK TABLES `communities_like_posts` WRITE;
/*!40000 ALTER TABLE `communities_like_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `communities_like_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities_publicate_posts`
--

DROP TABLE IF EXISTS `communities_publicate_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities_publicate_posts` (
  `idPost` int NOT NULL,
  `idCommunity` int NOT NULL,
  `publicationDate` datetime NOT NULL,
  PRIMARY KEY (`idPost`,`idCommunity`),
  KEY `idCommunity` (`idCommunity`),
  CONSTRAINT `communities_publicate_posts_ibfk_1` FOREIGN KEY (`idPost`) REFERENCES `posts` (`id`),
  CONSTRAINT `communities_publicate_posts_ibfk_2` FOREIGN KEY (`idCommunity`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities_publicate_posts`
--

LOCK TABLES `communities_publicate_posts` WRITE;
/*!40000 ALTER TABLE `communities_publicate_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `communities_publicate_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community_to_message`
--

DROP TABLE IF EXISTS `community_to_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community_to_message` (
  `idMessage` int NOT NULL,
  `idCommunity` int NOT NULL,
  PRIMARY KEY (`idMessage`,`idCommunity`),
  KEY `idCommunity` (`idCommunity`),
  CONSTRAINT `community_to_message_ibfk_1` FOREIGN KEY (`idMessage`) REFERENCES `messages` (`id`),
  CONSTRAINT `community_to_message_ibfk_2` FOREIGN KEY (`idCommunity`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_to_message`
--

LOCK TABLES `community_to_message` WRITE;
/*!40000 ALTER TABLE `community_to_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `community_to_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idChat` int NOT NULL,
  `text` varchar(10000) DEFAULT NULL,
  `sendingDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idChat` (`idChat`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`idChat`) REFERENCES `chats` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music`
--

DROP TABLE IF EXISTS `music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `music` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idArtist` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `duration` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idArtist` (`idArtist`),
  CONSTRAINT `music_ibfk_1` FOREIGN KEY (`idArtist`) REFERENCES `artists` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music`
--

LOCK TABLES `music` WRITE;
/*!40000 ALTER TABLE `music` DISABLE KEYS */;
INSERT INTO `music` VALUES (1,1,'ХОТБОКС','Трэп','1:37'),(2,2,'Варвар','Рэп','3:27');
/*!40000 ALTER TABLE `music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music_to_playlists`
--

DROP TABLE IF EXISTS `music_to_playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `music_to_playlists` (
  `idAudio` int NOT NULL,
  `idPlaylist` int NOT NULL,
  PRIMARY KEY (`idAudio`,`idPlaylist`),
  KEY `idPlaylist` (`idPlaylist`),
  CONSTRAINT `music_to_playlists_ibfk_1` FOREIGN KEY (`idAudio`) REFERENCES `music` (`id`),
  CONSTRAINT `music_to_playlists_ibfk_2` FOREIGN KEY (`idPlaylist`) REFERENCES `playlists` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music_to_playlists`
--

LOCK TABLES `music_to_playlists` WRITE;
/*!40000 ALTER TABLE `music_to_playlists` DISABLE KEYS */;
INSERT INTO `music_to_playlists` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `music_to_playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_albums`
--

DROP TABLE IF EXISTS `photo_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photo_albums` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idOwnerUser` int NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idOwnerUser` (`idOwnerUser`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`idOwnerUser`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_albums`
--

LOCK TABLES `photo_albums` WRITE;
/*!40000 ALTER TABLE `photo_albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `photo_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idAlbum` int NOT NULL,
  `PublicationDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idAlbum` (`idAlbum`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`idAlbum`) REFERENCES `photo_albums` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idOwnerUser` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `isPrivate` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idOwnerUser` (`idOwnerUser`),
  CONSTRAINT `playlists_ibfk_1` FOREIGN KEY (`idOwnerUser`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists`
--

LOCK TABLES `playlists` WRITE;
/*!40000 ALTER TABLE `playlists` DISABLE KEYS */;
INSERT INTO `playlists` VALUES (1,1,'Любимые треки',1),(2,2,'Новые треки',0);
/*!40000 ALTER TABLE `playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists_to_users`
--

DROP TABLE IF EXISTS `playlists_to_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists_to_users` (
  `idPlaylist` int NOT NULL,
  `idUser` int NOT NULL,
  PRIMARY KEY (`idPlaylist`,`idUser`),
  KEY `idUser` (`idUser`),
  CONSTRAINT `playlists_to_users_ibfk_1` FOREIGN KEY (`idPlaylist`) REFERENCES `playlists` (`id`),
  CONSTRAINT `playlists_to_users_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists_to_users`
--

LOCK TABLES `playlists_to_users` WRITE;
/*!40000 ALTER TABLE `playlists_to_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlists_to_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` varchar(10000) NOT NULL,
  `publicationDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Привет это мой первый пост','2021-04-17 13:31:30'),(2,'Всем привет','2021-04-18 13:32:30');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_to_message`
--

DROP TABLE IF EXISTS `user_to_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_to_message` (
  `idMessage` int NOT NULL,
  `idUser` int NOT NULL,
  PRIMARY KEY (`idMessage`,`idUser`),
  KEY `idUser` (`idUser`),
  CONSTRAINT `user_to_message_ibfk_1` FOREIGN KEY (`idMessage`) REFERENCES `messages` (`id`),
  CONSTRAINT `user_to_message_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_to_message`
--

LOCK TABLES `user_to_message` WRITE;
/*!40000 ALTER TABLE `user_to_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_to_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullName` varchar(50) NOT NULL,
  `country` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `phoneNumber` varchar(12) DEFAULT NULL,
  `gender` varchar(4) DEFAULT NULL,
  `birthday` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Иванов Иван Иванович','Россия','Москва','ivanov@mail.ru','89275444267','муж','1999-08-20'),(2,'Матвеев Никита Андреевич','Россия','Волгоград','matv.nik@mail.ru','89174324326','муж','2000-04-02');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_follow_communities`
--

DROP TABLE IF EXISTS `users_follow_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_follow_communities` (
  `idUser` int NOT NULL,
  `idCommunity` int NOT NULL,
  `role` varchar(10) NOT NULL,
  PRIMARY KEY (`idUser`,`idCommunity`),
  KEY `idCommunity` (`idCommunity`),
  CONSTRAINT `users_follow_communities_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`),
  CONSTRAINT `users_follow_communities_ibfk_2` FOREIGN KEY (`idCommunity`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_follow_communities`
--

LOCK TABLES `users_follow_communities` WRITE;
/*!40000 ALTER TABLE `users_follow_communities` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_follow_communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_like_posts`
--

DROP TABLE IF EXISTS `users_like_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_like_posts` (
  `idUser` int NOT NULL,
  `idPost` int NOT NULL,
  PRIMARY KEY (`idUser`,`idPost`),
  KEY `idPost` (`idPost`),
  CONSTRAINT `users_like_posts_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`),
  CONSTRAINT `users_like_posts_ibfk_2` FOREIGN KEY (`idPost`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_like_posts`
--

LOCK TABLES `users_like_posts` WRITE;
/*!40000 ALTER TABLE `users_like_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_like_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_publicate_posts`
--

DROP TABLE IF EXISTS `users_publicate_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_publicate_posts` (
  `idUser` int NOT NULL,
  `idPost` int NOT NULL,
  PRIMARY KEY (`idUser`,`idPost`),
  KEY `idPost` (`idPost`),
  CONSTRAINT `users_publicate_posts_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`),
  CONSTRAINT `users_publicate_posts_ibfk_2` FOREIGN KEY (`idPost`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_publicate_posts`
--

LOCK TABLES `users_publicate_posts` WRITE;
/*!40000 ALTER TABLE `users_publicate_posts` DISABLE KEYS */;
INSERT INTO `users_publicate_posts` VALUES (2,1),(1,2);
/*!40000 ALTER TABLE `users_publicate_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_to_chats`
--

DROP TABLE IF EXISTS `users_to_chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_to_chats` (
  `idUser` int NOT NULL,
  `idChat` int NOT NULL,
  `role` varchar(10) NOT NULL,
  PRIMARY KEY (`idUser`,`idChat`),
  KEY `idChat` (`idChat`),
  CONSTRAINT `users_to_chats_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`),
  CONSTRAINT `users_to_chats_ibfk_2` FOREIGN KEY (`idChat`) REFERENCES `chats` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_to_chats`
--

LOCK TABLES `users_to_chats` WRITE;
/*!40000 ALTER TABLE `users_to_chats` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_to_chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_albums`
--

DROP TABLE IF EXISTS `video_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video_albums` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idOwnerUser` int NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idOwnerUser` (`idOwnerUser`),
  CONSTRAINT `video_albums_ibfk_1` FOREIGN KEY (`idOwnerUser`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_albums`
--

LOCK TABLES `video_albums` WRITE;
/*!40000 ALTER TABLE `video_albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `duration` varchar(10) DEFAULT NULL,
  `publicationDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
INSERT INTO `videos` VALUES (1,'Строки в C++','17:05','2020-05-20 13:05:30'),(2,'Прикольные животные','5:20','2021-03-10 20:12:45'),(3,'SQL основы','25:53','2021-01-18 09:45:55');
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos_to_videoalbums`
--

DROP TABLE IF EXISTS `videos_to_videoalbums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videos_to_videoalbums` (
  `idVideo` int NOT NULL,
  `idVideoAlbum` int NOT NULL,
  PRIMARY KEY (`idVideo`,`idVideoAlbum`),
  KEY `idVideoAlbum` (`idVideoAlbum`),
  CONSTRAINT `videos_to_videoalbums_ibfk_1` FOREIGN KEY (`idVideo`) REFERENCES `videos` (`id`),
  CONSTRAINT `videos_to_videoalbums_ibfk_2` FOREIGN KEY (`idVideoAlbum`) REFERENCES `video_albums` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos_to_videoalbums`
--

LOCK TABLES `videos_to_videoalbums` WRITE;
/*!40000 ALTER TABLE `videos_to_videoalbums` DISABLE KEYS */;
/*!40000 ALTER TABLE `videos_to_videoalbums` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-19  3:00:41
