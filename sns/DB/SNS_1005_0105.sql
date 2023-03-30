-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: sns
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `boardtbl`
--

DROP TABLE IF EXISTS `boardtbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boardtbl` (
  `bid` int NOT NULL AUTO_INCREMENT COMMENT '게시글 번호',
  `title` varchar(50) NOT NULL COMMENT '게시글 제목',
  `content` varchar(500) NOT NULL COMMENT '게시글 내용',
  `birth` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성 날짜',
  `likecount` int NOT NULL DEFAULT '0' COMMENT '좋아요 수',
  `likeWho` varchar(2000) DEFAULT '' COMMENT '좋아요 누른 사람',
  `photo` varchar(200) DEFAULT NULL COMMENT '사진 주소',
  `id` varchar(20) NOT NULL COMMENT '작성자 아이디',
  PRIMARY KEY (`bid`),
  KEY `id` (`id`),
  CONSTRAINT `boardtbl_ibfk_1` FOREIGN KEY (`id`) REFERENCES `membertbl` (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boardtbl`
--

LOCK TABLES `boardtbl` WRITE;
/*!40000 ALTER TABLE `boardtbl` DISABLE KEYS */;
INSERT INTO `boardtbl` VALUES (2,'title1','content1','2022-10-04 23:38:09',1,'mid2','사진1','mid1'),(3,'title2','content2','2022-10-04 23:38:09',0,'','사진2','mid2'),(4,'title3','content3','2022-10-04 23:38:09',0,'','사진3','mid3'),(5,'title4','content4','2022-10-04 23:38:09',1,'mid2','사진4','mid4');
/*!40000 ALTER TABLE `boardtbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commenttbl`
--

DROP TABLE IF EXISTS `commenttbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commenttbl` (
  `cid` varchar(20) NOT NULL COMMENT '댓글 작성자 아이디',
  `content` varchar(100) NOT NULL COMMENT '댓글 내용',
  `birth` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '댓글 등록일',
  `id` int NOT NULL COMMENT '댓글 등록할 게시글 아이디',
  `likecount` int NOT NULL DEFAULT '0' COMMENT '좋아요 수',
  KEY `cid` (`cid`),
  KEY `id` (`id`),
  CONSTRAINT `commenttbl_FK` FOREIGN KEY (`cid`) REFERENCES `membertbl` (`mid`),
  CONSTRAINT `commenttbl_FK_1` FOREIGN KEY (`id`) REFERENCES `boardtbl` (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commenttbl`
--

LOCK TABLES `commenttbl` WRITE;
/*!40000 ALTER TABLE `commenttbl` DISABLE KEYS */;
INSERT INTO `commenttbl` VALUES ('mid1','comment1','2022-10-04 23:39:09',2,0),('mid2','comment2','2022-10-04 23:39:09',2,0),('mid3','comment3','2022-10-04 23:39:09',4,0),('mid4','comment4','2022-10-04 23:39:09',5,0);
/*!40000 ALTER TABLE `commenttbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membertbl`
--

DROP TABLE IF EXISTS `membertbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membertbl` (
  `mid` varchar(20) NOT NULL COMMENT '회원 아이디',
  `pw` varchar(20) NOT NULL COMMENT '비밀번호',
  `email` varchar(50) DEFAULT NULL COMMENT '이메일',
  `pfp` varchar(50) DEFAULT NULL COMMENT '프로필사진',
  `phone` varchar(15) NOT NULL COMMENT '전화번호',
  `name` varchar(15) NOT NULL COMMENT '회원 이름',
  `birth` date NOT NULL COMMENT '생년월일',
  `intro` varchar(100) DEFAULT NULL COMMENT '자기소개',
  `follower` varchar(500) DEFAULT NULL COMMENT '팔로워',
  PRIMARY KEY (`mid`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membertbl`
--

LOCK TABLES `membertbl` WRITE;
/*!40000 ALTER TABLE `membertbl` DISABLE KEYS */;
INSERT INTO `membertbl` VALUES ('mid1','pw1','email1','pfp1','phone1','name1','1993-11-24','intro1','follower1'),('mid2','pw2','email2','pfp1','phone1','name2','1993-11-24','intro2','follower2'),('mid3','pw3','email3','pfp3','phone3','name3','1993-11-24','intro3','follower3'),('mid4','pw4','email4','pfp4','phone4','name4','1993-11-24','intro4','follower4');
/*!40000 ALTER TABLE `membertbl` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-05  1:08:19
