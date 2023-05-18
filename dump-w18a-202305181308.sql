-- MariaDB dump 10.19  Distrib 10.11.3-MariaDB, for osx10.16 (x86_64)
--
-- Host: localhost    Database: w18a
-- ------------------------------------------------------
-- Server version	10.11.3-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blogger`
--

DROP TABLE IF EXISTS `blogger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogger` (
  `username` varchar(40) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UN` (`username`),
  UNIQUE KEY `email_UN` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogger`
--

LOCK TABLES `blogger` WRITE;
/*!40000 ALTER TABLE `blogger` DISABLE KEYS */;
INSERT INTO `blogger` VALUES
('savvyblogger','bad_password','Sarah Johnson','2015-05-18 17:27:55','savvyblogger@example.com',6),
('travelholic','globetrotter22','Jason Anderson','2018-05-18 17:27:55','travelholic@emailprovider.com',7),
('fashionista89','stylequeen123','Emily Davis','1999-05-18 17:27:55','fashionlover89@example.com',8),
('techgeek21','coding1234','Alex Turner','2023-05-18 17:27:55','techgeek21@domain.com',9),
('foodiegram','delicious1','Mia Thompson','2023-05-18 17:27:55','foodiegram@domain.com',10);
/*!40000 ALTER TABLE `blogger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `blogger_id` int(10) unsigned DEFAULT NULL,
  `post_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_FK` (`blogger_id`),
  KEY `comment_FK_1` (`post_id`),
  CONSTRAINT `comment_FK` FOREIGN KEY (`blogger_id`) REFERENCES `blogger` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_FK_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES
(1,'Great tips, Sarah! Finding your niche and staying true to yourself is so important. I love how you emphasize building a community and engaging with readers. It\'s what sets blogging apart from other platforms. Keep up the fantastic work!','2023-05-18 17:49:44',8,2),
(2,'Wow, Jason! Your post on Japan has me dreaming of my next travel adventure. The descriptions are vivid, and your passion for the country shines through. I\'m adding Japan to my bucket list right away. Thanks for the inspiration!','2023-05-18 17:49:47',9,3),
(3,'Emily, you nailed it! Fashion is all about expressing your unique style. I appreciate how you encourage us to be confident and embrace our creativity. Your posts always inspire me to experiment with my outfits. Keep the fabulous fashion advice coming','2023-05-18 17:49:50',10,4),
(4,'Alex, your take on virtual reality is fascinating! It\'s incredible to see how far VR has come and its potential in various fields. Your post has piqued my curiosity, and I can\'t wait to dive into the virtual world. Thanks for sharing your insights!','2023-05-18 17:49:52',6,5),
(5,'Mia, your post on exploring culinary delights around the world is making my taste buds dance! Your descriptions have me craving dishes from different cultures. I\'m ready to embark on a gastronomic adventure and try new flavors. Thanks for the mouthwatering inspiration!','2023-05-18 17:49:54',7,6),
(7,'Hello World! delete me','2023-05-18 18:39:56',7,6),
(8,'Hello World! delete me','2023-05-18 18:39:57',7,6),
(9,'Hello World! delete me','2023-05-18 18:39:58',7,6),
(10,'Hello World! delete me','2023-05-18 18:39:58',7,6),
(11,'Hello World! delete me','2023-05-18 18:39:59',7,6),
(12,'Hello World! delete me','2023-05-18 19:05:36',7,4),
(13,'Hello World! delete me','2023-05-18 19:05:36',7,4),
(14,'Hello World! delete me','2023-05-18 19:05:37',7,4),
(15,'Hello World! delete me','2023-05-18 19:05:37',7,4);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(5000) DEFAULT NULL,
  `title` varchar(80) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `blogger_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_FK` (`blogger_id`),
  CONSTRAINT `post_FK` FOREIGN KEY (`blogger_id`) REFERENCES `blogger` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES
(2,'Hey fellow bloggers! Today, I want to share some valuable tips that have helped me succeed in the blogging world. Firstly, find your niche and focus on topics you\'re passionate about. Authenticity is key! Secondly, consistency matters. Set a regular posting schedule and stick to it. Thirdly, engage with your readers by responding to comments and encouraging discussions. Building a community is vital. Fourthly, promote your blog on social media platforms to expand your reach. Lastly, remember to enjoy the journey! Blogging is a creative outlet, so have fun and be yourself. Happy blogging!','5 Essential Tips for Successful Blogging','2023-05-18 17:37:27',6),
(3,'Konnichiwa, travel enthusiasts! Join me on a virtual journey to Japan, a land of ancient traditions and modern marvels. From the bustling streets of Tokyo to the serene temples of Kyoto, Japan offers an array of unforgettable experiences. Discover the vibrant cherry blossom season, soak in the natural hot springs of Hakone, and immerse yourself in the rich history of Hiroshima. Don\'t miss the awe-inspiring Mount Fuji or the culinary delights of Osaka\'s street food. Japan is a country that will captivate your senses and leave you with memories that will last a lifetime. Arigatou gozaimasu!','Unforgettable Travel Experiences: Exploring the Wonders of Japan','2023-05-18 17:38:52',7),
(4,'Hello, fashionistas! Let\'s talk about embracing your unique style and staying on top of the latest trends. Remember, fashion is all about self-expression. Experiment with colors, patterns, and accessories that resonate with your personality. Mix high-end and affordable pieces to create a personalized look. Keep an eye on fashion weeks and magazines for inspiration, but don\'t be afraid to add your own twist. Confidence is the ultimate accessory! Don\'t follow trends blindly; choose what makes you feel fabulous. Fashion is a form of art, so let your creativity shine and be the trendsetter you were born to be.','Fashion Trends: Embrace Your Unique Style','2023-05-18 17:40:09',8),
(5,'Welcome, tech enthusiasts! Today, let\'s dive into the exciting world of virtual reality (VR). VR technology has come a long way, revolutionizing gaming, entertainment, and even education. Imagine exploring new worlds, interacting with lifelike characters, and immersing yourself in breathtaking experiences, all from the comfort of your home. From gaming headsets to VR arcades, the possibilities are endless. Whether you\'re an avid gamer or simply curious about cutting-edge technology, VR is worth exploring. Get ready to step into a new dimension and witness the future of digital entertainment!','Tech Talk: Exploring the Exciting World of Virtual Reality','2023-05-18 17:42:18',9),
(6,'Bon appétit, foodies! Today, let\'s embark on a delectable journey exploring culinary delights from around the world. Discover the exotic spices of Indian cuisine, the tantalizing street food of Thailand, and the mouthwatering pastries of France. From sushi in Japan to tacos in Mexico, each culture boasts its own unique flavors and cooking techniques. Expand your palate and try new dishes whenever you can. Whether you\'re a home cook or a restaurant aficionado, the world of food offers endless possibilities for delicious adventures. So grab your fork and let\'s savor the flavors of the world together!','The Art of Food: Exploring Culinary Delights Around the World','2023-05-18 17:42:20',10);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'w18a'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-18 13:08:35
