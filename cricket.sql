-- MySQL dump 10.13  Distrib 8.0.24, for Linux (x86_64)
--
-- Host: localhost    Database: cricket
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `username` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('amit','201951021'),('dummy','password'),('shreyansh','201951147'),('suryansh','201951158'),('vishal','201951170'),('yatharth','201952241');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cricket_boards`
--

DROP TABLE IF EXISTS `cricket_boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cricket_boards` (
  `board_name` varchar(20) NOT NULL,
  `chairman` varchar(20) NOT NULL,
  `team` varchar(10) NOT NULL,
  `DOA` date NOT NULL,
  PRIMARY KEY (`board_name`,`team`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cricket_boards`
--

LOCK TABLES `cricket_boards` WRITE;
/*!40000 ALTER TABLE `cricket_boards` DISABLE KEYS */;
INSERT INTO `cricket_boards` VALUES ('BCCI','Saurav','IND','1989-05-03'),('CA','Eddings','SA','1997-09-19'),('CSA','Smith','AUS','2003-11-23'),('WICB','Brancker','WI','2007-12-05');
/*!40000 ALTER TABLE `cricket_boards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `username` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('amit','201951021'),('shreyansh','201951147'),('suryansh','201951158'),('user','password'),('vishal','201951170'),('yatharth','201952241');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `played_in`
--

DROP TABLE IF EXISTS `played_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `played_in` (
  `stadium_name` varchar(50) NOT NULL,
  `board_name` varchar(20) NOT NULL,
  `team` varchar(10) NOT NULL,
  `team1` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `team2` varchar(20) NOT NULL,
  PRIMARY KEY (`stadium_name`,`board_name`,`team`,`team1`,`date`,`team2`),
  KEY `team1` (`team1`,`date`,`team2`),
  CONSTRAINT `played_in_ibfk_1` FOREIGN KEY (`stadium_name`, `board_name`, `team`) REFERENCES `stadiums` (`stadium_name`, `board_name`, `team`),
  CONSTRAINT `played_in_ibfk_2` FOREIGN KEY (`team1`, `date`, `team2`) REFERENCES `schedules` (`team1`, `date`, `team2`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `played_in`
--

LOCK TABLES `played_in` WRITE;
/*!40000 ALTER TABLE `played_in` DISABLE KEYS */;
INSERT INTO `played_in` VALUES ('Melbourne','CSA','AUS','AUS','2018-12-27','SA'),('Narendra Modi','BCCI','IND','IND','2018-12-28','WI'),('Johanessberg','CA','SA','SA','2018-12-20','IND'),('George town','WICB','WI','WI','2018-12-26','AUS');
/*!40000 ALTER TABLE `played_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `cap_no` decimal(4,0) NOT NULL,
  `age` decimal(2,0) NOT NULL,
  `dob` date NOT NULL,
  `runs` decimal(5,0) NOT NULL,
  `wickets` decimal(3,0) NOT NULL,
  `type` varchar(20) NOT NULL,
  `no_of_matches` decimal(3,0) NOT NULL,
  `rank` decimal(3,0) NOT NULL,
  `batting_best` varchar(10) NOT NULL,
  `bowling_best` varchar(10) NOT NULL,
  `playername` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`cap_no`,`name`),
  KEY `name` (`name`),
  CONSTRAINT `player_ibfk_1` FOREIGN KEY (`name`) REFERENCES `team` (`name`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,28,'1992-08-07',18,2,'Bowler',3,89,'12','37/1','Deepak Chahar','IND'),(3,25,'1995-05-25',273,119,'Bowler',77,6,'31','16/6','Kagiso Rabada','SA'),(4,30,'1990-09-03',161,148,'Bowler',79,26,'25','69/5','Mohammed Shami','IND'),(5,31,'1989-06-02',4378,28,'Batsman',128,15,'164','16/3','Steven Smith','AUS'),(5,48,'1973-04-24',18426,154,'Batsman',463,1,'200','32/5','Sachin Tendulkar','IND'),(6,33,'1987-04-30',468,48,'Allrounder',42,60,'62','31/4','Chris Morris','SA'),(7,47,'1974-12-19',13704,3,'Batsman',375,1,'164','12/1','Ricky Ponting','AUS'),(8,41,'1979-09-21',5926,167,'Batsman',301,63,'215','46/5','Chris Gayle','WI'),(9,37,'1983-06-27',365,196,'Bowler',125,2,'60','39/6','Dale Steyn','SA'),(11,39,'1981-12-12',8701,111,'Allrounder',304,37,'150','31/5','Yuvraj Singh','IND'),(12,39,'1981-07-07',10773,1,'WK-Batsmen',350,15,'183','14/1','M S Dhoni','IND'),(13,27,'1994-01-20',181,45,'Allrounder',38,8,'38','34/3','Axar Patel','IND'),(14,45,'1975-10-16',11579,273,'Allrounder',328,19,'139','30/5','Jacques Kallis','SA'),(15,27,'1993-12-06',19,108,'Bowler',67,4,'10','27/5','Jasprit Bumrah','IND'),(16,35,'1985-12-05',5977,0,'Batsman',142,17,'143','0/0','Shikhar Dhawan','IND'),(17,37,'1984-02-17',9577,7,'WK-Batsman',228,12,'176','15/2','AB De Villiers','SA'),(18,36,'1984-07-13',5507,2,'Batsman',143,8,'185','8/1','Faf du Plesis','SA'),(19,33,'1987-04-30',9205,8,'Batsman',227,3,'264','27/2','Rohit Sharma','IND'),(20,28,'1992-12-17',5235,0,'Bowler',123,11,'178','0/0','Quinton de Kock','SA'),(25,24,'1996-12-26',1430,0,'batsman',45,31,'139','0/0','Shimron Hetmyer','WI'),(26,29,'1991-11-05',1837,139,'Allrounder',118,58,'99','27/5','Jason Holder','WI'),(28,31,'1989-08-19',84,49,'bowler',35,30,'17','46/5','Sheldon Cottrell','WI'),(29,99,'1995-08-02',982,0,'batsman',28,34,'118','0/0','Nicholas Pooran','WI'),(34,33,'1987-05-12',2564,54,'Allrounder',116,50,'119','27/3','kieren Pollard','WI'),(45,37,'1983-08-07',2968,199,'allrounder',164,33,'112','43/6','Dwayne Bravo','WI'),(55,33,'1987-08-11',252,52,'bowler',32,56,'92','48/4','N Coulter-Nile','AUS'),(58,29,'1991-08-27',1091,0,'batsman',42,29,'106','0/0','Alex Carey','AUS'),(63,32,'1988-11-05',12169,4,'batsman',254,2,'183','15/1','Virat Kohli','IND'),(64,31,'1990-02-18',0,27,'bolwer',24,55,'0','33/4','Tabraiz Shamsi','SA'),(65,33,'1987-12-26',1777,0,'batsman',94,58,'100','0/0','Matthew Wade','AUS'),(66,30,'1991-02-12',75,39,'bowler',25,76,'24','68/5','Kane Richardson','AUS'),(68,26,'1994-10-04',197,5,'batsman',29,82,'67','18/2','Aiden Markram','SA'),(75,31,'1990-02-07',46,10,'bowler',8,89,'19','25/3','Keshav Maharaj','SA'),(81,29,'1992-04-18',1509,0,'batsman',38,28,'112','0/0','K L Rahul','IND'),(82,32,'1989-03-29',135,29,'Allrounder',22,36,'50','5/3','Dwaine Pretorius','SA'),(85,33,'1987-11-20',77,29,'bowler',29,61,'30','44/4','Nathan Lyon','AUS'),(86,30,'1990-07-23',53,92,'bowler',54,24,'18','42/6','Yuzi Chahal','IND'),(87,37,'1984-04-14',5117,69,'allrounder',199,13,'150','16/4','JP Duminy','SA'),(90,31,'1989-12-29',8,1,'bowler',2,98,'5','57/1','Junior Dala','SA'),(92,42,'1979-03-27',157,173,'bowler',107,18,'29','23/5','Imran Tahir','SA'),(95,29,'1992-03-31',128,92,'bowler',61,15,'22','43/4','Adam Zampa','AUS'),(96,25,'1996-03-29',47,54,'bowler',28,20,'19','58/6','Lungi Ngidi','SA'),(97,31,'1989-06-10',3331,0,'batsman',134,30,'139','0/0','David Milller','SA'),(98,31,'1989-10-16',1106,33,'allrounder',45,56,'146','27/2','Marcus Stoinis','AUS'),(99,42,'1978-10-20',8273,96,'batsman',251,2,'219','6/4','Virender Sehwag','IND');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedules` (
  `team1` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `match_no` decimal(3,0) NOT NULL,
  `team2` varchar(20) NOT NULL,
  PRIMARY KEY (`team1`,`date`,`team2`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules`
--

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
INSERT INTO `schedules` VALUES ('AUS','2018-12-27',3,'SA'),('IND','2018-12-28',4,'WI'),('SA','2018-12-20',1,'IND'),('WI','2018-12-26',2,'AUS'),('WI','2019-01-01',5,'AUS');
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selected_for`
--

DROP TABLE IF EXISTS `selected_for`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `selected_for` (
  `position` varchar(20) NOT NULL,
  `cap_no` decimal(4,0) NOT NULL,
  `name` varchar(30) NOT NULL,
  `team1` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `team2` varchar(20) NOT NULL,
  PRIMARY KEY (`cap_no`,`name`,`team1`,`date`,`team2`),
  KEY `team1` (`team1`,`date`,`team2`),
  CONSTRAINT `selected_for_ibfk_1` FOREIGN KEY (`cap_no`, `name`) REFERENCES `player` (`cap_no`, `name`),
  CONSTRAINT `selected_for_ibfk_2` FOREIGN KEY (`team1`, `date`, `team2`) REFERENCES `schedules` (`team1`, `date`, `team2`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selected_for`
--

LOCK TABLES `selected_for` WRITE;
/*!40000 ALTER TABLE `selected_for` DISABLE KEYS */;
INSERT INTO `selected_for` VALUES ('CAPTAIN',17,'SA','SA','2018-12-20','IND'),('VICE-CAPTAIN',18,'SA','SA','2018-12-20','IND');
/*!40000 ALTER TABLE `selected_for` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stadiums`
--

DROP TABLE IF EXISTS `stadiums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stadiums` (
  `stadium_name` varchar(50) NOT NULL,
  `capacity` decimal(6,0) NOT NULL,
  `DOI` date NOT NULL,
  `board_name` varchar(20) NOT NULL,
  `team` varchar(10) NOT NULL,
  PRIMARY KEY (`stadium_name`,`board_name`,`team`),
  KEY `board_name` (`board_name`,`team`),
  CONSTRAINT `stadiums_ibfk_1` FOREIGN KEY (`board_name`, `team`) REFERENCES `cricket_boards` (`board_name`, `team`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadiums`
--

LOCK TABLES `stadiums` WRITE;
/*!40000 ALTER TABLE `stadiums` DISABLE KEYS */;
INSERT INTO `stadiums` VALUES ('George town',30000,'1976-11-25','WICB','WI'),('Johanessberg',40000,'1996-11-20','CA','SA'),('Melbourne',50000,'1985-05-11','CSA','AUS'),('Narendra Modi',110000,'1974-12-28','BCCI','IND');
/*!40000 ALTER TABLE `stadiums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `rank` decimal(5,0) NOT NULL,
  `rating` int NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (3,119,'AUS'),(1,122,'IND'),(2,120,'SA'),(4,116,'WI');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-24 23:45:29
