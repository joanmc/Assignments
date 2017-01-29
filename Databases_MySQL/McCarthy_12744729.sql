-- MySQL dump 10.13  Distrib 5.6.24, for osx10.8 (x86_64)
--
-- Host: 127.0.0.1    Database: McCarthy_12744729
-- ------------------------------------------------------
-- Server version	5.6.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `CandidateDetails`
--

DROP TABLE IF EXISTS `CandidateDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CandidateDetails` (
  `CandidateID` int(11) NOT NULL COMMENT 'Candidate’s Unique Identification Number',
  `CandidateName` varchar(40) NOT NULL COMMENT 'Candidate’s Name',
  `Address` varchar(45) DEFAULT NULL COMMENT 'Address of Candidate',
  `PhoneNumber` int(11) NOT NULL COMMENT 'Candidate’s Phone Number',
  `Email` varchar(40) DEFAULT NULL COMMENT 'Candidate’s Phone Number',
  PRIMARY KEY (`CandidateID`),
  UNIQUE KEY `PhoneNumber_UNIQUE` (`PhoneNumber`),
  UNIQUE KEY `Name_UNIQUE` (`CandidateName`),
  UNIQUE KEY `CandidateID_UNIQUE` (`CandidateID`),
  UNIQUE KEY `Address_UNIQUE` (`Address`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CandidateDetails`
--

LOCK TABLES `CandidateDetails` WRITE;
/*!40000 ALTER TABLE `CandidateDetails` DISABLE KEYS */;
INSERT INTO `CandidateDetails` VALUES (12345,'Jack Smith','3 Long Road, Dublin',4539876,'Jack.smith@employme.ie'),(12346,'Rose McNally','38 Fitzwilliam row, Dublin',4328765,'rose.mcnally@employme.ie'),(12347,'Steven Farren ','4 St. Catherines Avenue, Cork',4386562,'steven.farren@employme.ie'),(12348,'Jane Cousins','7 Raymond Street, Dublin',4531212,'jane.cousins@employme.ie'),(12349,'Ross Pearson','4 Parnell Road, Leitrim',4522112,'ross.pearson@employme.ie'),(12350,'Therese Kelly','33 Oscar Square, Galway',4563322,'therese.kelly@employme.ie'),(12351,'Frank Doyle','54 Castledawson, Matnooth, Co Kildare',4538877,'frank.doyle@employme.ie'),(12352,'Hannah Greene','65 South Circular Road, Waterford',4337788,'hannah.greene@employme.ie'),(12353,'Karl Halpin','4A  Georges Court, Limerick',4665789,'karl.halpin@employme.ie'),(12354,'Rachael Barry','54 South Circular Road, Longford',4326789,'rachael.barry@employme.ie'),(12355,'Harry Bell','9 Washington Street, Dublin',4562323,'harry.bell@employme.ie'),(12356,'Grace Whelan','89 St Patricks, Dublin',4321567,'grace.whelan@employme.ie'),(12357,'Pat Walsh','7 Templemore Road, Sligo',4563421,'pat.walch@employme.ie'),(12358,'Jill Heaney','5 Sandford Avenue, Dublin',4532567,'jill.heaney@employme.ie'),(12359,'Robert Silk','3 Greenly Hill, Louth',4376677,'robert.silk@employme.ie'),(12360,'Katie Cusack','43 Dufferin Avenue, Kildare',4325677,'katie.cusack@employme.ie'),(12361,'Greg Nugent','45 Exchequer Street, Roscommon',4527764,'greg.nugent@employme.ie'),(12362,'Eve Young','32 St Margarets Avenue, Carlow',4563328,'eve.young@employme.ie'),(12363,'Joseph Brown','3 Cork Street, Dublin',4352211,'joseph.brown@employme.ie'),(12364,'Niamh Duffy','1 Donore Avenue, Dublin',4218989,'niamh.duffy@employme.ie'),(12365,'Jack Doyle','4 St Albans Road, Dublin',4532599,'jack.doyle@employme.ie');
/*!40000 ALTER TABLE `CandidateDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CandidateSkills`
--

DROP TABLE IF EXISTS `CandidateSkills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CandidateSkills` (
  `Candidate_ID` int(11) NOT NULL COMMENT 'Candidate’s Unique Identification Number',
  `Skill` varchar(20) NOT NULL,
  KEY `FK_CandidateID_idx` (`Candidate_ID`),
  CONSTRAINT `FK_CandidateIDENT` FOREIGN KEY (`Candidate_ID`) REFERENCES `CandidateDetails` (`CandidateID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CandidateSkills`
--

LOCK TABLES `CandidateSkills` WRITE;
/*!40000 ALTER TABLE `CandidateSkills` DISABLE KEYS */;
INSERT INTO `CandidateSkills` VALUES (12346,'Research'),(12346,'Organisation'),(12347,'Managerial'),(12347,'Problem Solving'),(12348,'Team Work'),(12348,'IT (Tecnical)'),(12349,'Managerial'),(12349,'Communication'),(12350,'Administration'),(12350,'Organisation'),(12351,'IT (Tecnical)'),(12351,'IT (Tecnical)'),(12352,'Time Management'),(12352,'Adaptability'),(12353,'Administration'),(12353,'Organisation'),(12353,'Communication'),(12354,'Administration'),(12354,'Administration'),(12355,'Research'),(12355,'Organisation'),(12356,'Managerial'),(12356,'Organisation'),(12357,'Communication'),(12358,'Communication'),(12358,'Problem Solving'),(12357,'Communication'),(12359,'Managerial'),(12359,'Organisation'),(12360,'Time Management'),(12360,'Adaptability'),(12361,'Research'),(12361,'Communication'),(12362,'Organisation'),(12362,'Problem Solving'),(12363,'Managerial'),(12364,'Administration'),(12364,'Research'),(12365,'Communication'),(12365,'Communication'),(12365,'Communication');
/*!40000 ALTER TABLE `CandidateSkills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CompanyDetails`
--

DROP TABLE IF EXISTS `CompanyDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompanyDetails` (
  `CompanyID` int(11) NOT NULL COMMENT 'Unique Identification Number of the Company',
  `CompanyName` varchar(45) NOT NULL COMMENT 'Name of Company',
  `ReferenceName` varchar(35) NOT NULL COMMENT 'Name of person to reference in company',
  `ReferenceAddress` varchar(45) NOT NULL COMMENT 'Address of person to reference in company',
  `ReferencePhoneNumber` int(11) NOT NULL COMMENT 'Phone number of person to reference in company',
  PRIMARY KEY (`CompanyID`),
  UNIQUE KEY `ReferenceName_UNIQUE` (`ReferenceName`),
  UNIQUE KEY `PositionID_UNIQUE` (`CompanyID`),
  UNIQUE KEY `CompanyName_UNIQUE` (`CompanyName`),
  UNIQUE KEY `ReferenceAddress_UNIQUE` (`ReferenceAddress`),
  UNIQUE KEY `ReferencePhoneNumber_UNIQUE` (`ReferencePhoneNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CompanyDetails`
--

LOCK TABLES `CompanyDetails` WRITE;
/*!40000 ALTER TABLE `CompanyDetails` DISABLE KEYS */;
INSERT INTO `CompanyDetails` VALUES (145,'Star Inc','Geraldine Duffy','Dungarvan Industrial Estate, Laois',4352678),(165,'Fitzgerald & Sons','Fred Perry','Maynooth Business Park, Kildare',4567382),(231,'SED Corporation','Emma Hegarty','403 Aliquam Avenue, Dublin',4234783),(271,'West Valley Networks','Yvonne Grey','Interdum Road, Wexford',4325819),(349,'Golden Valley Computers','Conor Lynch','Nullam Street, Wicklow',4538275),(546,'Dunne and Co.','Gerard Dunne','St Margarets, Co. Dublin',6374565),(789,'Smart Inc.','John Kelly','Walkinstown Industrial Estate, Dublin',6342542),(870,'MARS Industries','Therese Fitzpatrick','St Johns Street, Kildare',4563254),(943,'Roche Enterprises','Simon Roche','Neque Street, Dublin',4398275),(945,'Libero Foundation','Paula Hayes','94 Lobortis Rd.',4356788);
/*!40000 ALTER TABLE `CompanyDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hired`
--

DROP TABLE IF EXISTS `Hired`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Hired` (
  `CandidateID` int(11) NOT NULL COMMENT 'Candidates Identification Number',
  `PositionID` int(11) NOT NULL COMMENT 'Position Identification Number',
  `CompanyID` int(11) NOT NULL COMMENT 'Identification Number of Company',
  PRIMARY KEY (`CandidateID`),
  UNIQUE KEY `CandidateID_UNIQUE` (`CandidateID`),
  KEY `FK_PosID_idx` (`PositionID`),
  KEY `FK_CompID_idx` (`CompanyID`),
  CONSTRAINT `FK_CandID` FOREIGN KEY (`CandidateID`) REFERENCES `CandidateDetails` (`CandidateID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CompID` FOREIGN KEY (`CompanyID`) REFERENCES `CompanyDetails` (`CompanyID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_PosID` FOREIGN KEY (`PositionID`) REFERENCES `PositionDetails` (`PositionID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hired`
--

LOCK TABLES `Hired` WRITE;
/*!40000 ALTER TABLE `Hired` DISABLE KEYS */;
INSERT INTO `Hired` VALUES (12348,8,945),(12351,10,145),(12352,5,271),(12353,1,789),(12355,4,349),(12356,2,870),(12360,10,145),(12362,5,271),(12363,9,165),(12365,2,870);
/*!40000 ALTER TABLE `Hired` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InterviewDetails`
--

DROP TABLE IF EXISTS `InterviewDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InterviewDetails` (
  `InterviewID` int(11) NOT NULL COMMENT 'Interview Identification Number',
  `PositionID` int(11) NOT NULL COMMENT 'Position Identification Number',
  `CompanyID` int(11) NOT NULL COMMENT 'Company Identification Number',
  `CandidateID` int(11) NOT NULL COMMENT 'Candidate Identification Number',
  `InterviewRound` int(11) NOT NULL DEFAULT '1' COMMENT 'Interview Round',
  `InterviewDate` date NOT NULL COMMENT 'Date of Interviewer\nFormat: YYYY-MM-DD',
  `InterviewTime` time NOT NULL COMMENT 'Time of Interview \nFormat: HH:MM:SS',
  `Interviewer` varchar(45) NOT NULL COMMENT 'Name of Person Interviewing',
  `Progress` enum('Hired','NextR','Eliminated') DEFAULT NULL COMMENT 'Progress Status of Candidate - Hired, Next Round or Eliminated',
  PRIMARY KEY (`InterviewID`),
  KEY `FK_PositionID_idx` (`PositionID`),
  KEY `FK_CandidateID_idx` (`CandidateID`),
  KEY `FK_CompanyID_idx` (`CompanyID`),
  KEY `FK_interviewer_idx` (`Interviewer`),
  CONSTRAINT `FK_CandidateID` FOREIGN KEY (`CandidateID`) REFERENCES `CandidateDetails` (`CandidateID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CompanyID` FOREIGN KEY (`CompanyID`) REFERENCES `CompanyDetails` (`CompanyID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_PositionID` FOREIGN KEY (`PositionID`) REFERENCES `PositionDetails` (`PositionID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InterviewDetails`
--

LOCK TABLES `InterviewDetails` WRITE;
/*!40000 ALTER TABLE `InterviewDetails` DISABLE KEYS */;
INSERT INTO `InterviewDetails` VALUES (1,1,789,12353,1,'2015-11-01','09:00:00','John Dunne','NextR'),(2,1,789,12350,1,'2015-11-02','10:00:00','Frank Hall','Eliminated'),(3,1,789,12354,1,'2015-11-03','11:00:00','Jessie Henshaw','NextR'),(4,2,870,12356,1,'2015-11-04','12:00:00','Tim Grey','Hired'),(5,2,870,12365,1,'2015-11-05','13:00:00','Leah Kilbride','Hired'),(6,3,546,12357,1,'2015-11-06','14:00:00','Harry Deveney','NextR'),(7,4,349,12358,1,'2015-11-07','15:00:00','Grace Browne','Eliminated'),(8,4,349,12355,1,'2015-11-08','16:00:00','Hilary Dunphy','NextR'),(9,4,349,12346,1,'2015-11-09','17:00:00','Sean Twomey','NextR'),(10,5,271,12352,1,'2015-11-10','09:30:00','Rachael Perry','NextR'),(11,5,271,12362,1,'2015-11-11','10:30:00','Helen Keane','Hired'),(12,6,943,12361,1,'2015-11-12','11:30:00','Alan Stevenson','Eliminated'),(13,7,231,12349,1,'2015-11-01','12:30:00','Jean Cousins','NextR'),(14,7,231,12347,1,'2015-11-02','13:30:00','Sam Long','NextR'),(15,8,945,12356,1,'2015-11-03','14:30:00','Tim Rogan','Eliminated'),(16,8,945,12348,1,'2015-11-04','15:30:00','Frank Dunne','NextR'),(17,9,165,12363,1,'2015-11-05','16:30:00','Sophie MacNamara','NextR'),(18,10,145,12360,1,'2015-11-06','17:30:00','Terry Hunt','Hired'),(19,10,145,12351,1,'2015-11-07','09:15:00','Sophie Lee','NextR'),(20,1,789,12353,2,'2015-11-06','13:15:00','Fred Pierce','NextR'),(21,1,789,12353,3,'2015-11-10','14:15:00','Fred Pierce','Hired'),(22,1,789,12354,2,'2015-11-08','15:15:00','Fred Pierce','Eliminated'),(23,3,546,12357,2,'2015-11-20','16:15:00','Reece Pearson',NULL),(24,4,349,12346,2,'2015-11-10','17:15:00','Harry Hogan','Eliminated'),(25,4,349,12355,2,'2015-11-11','10:15:00','Harry Hogan','NextR'),(26,4,349,12355,3,'2015-11-13','11:15:00','Harry Hogan','Hired'),(27,5,271,12352,2,'2015-11-12','12:15:00','Penelope Long','Hired'),(28,7,271,12349,2,'2015-11-25','09:45:00','Leanne Spray',NULL),(29,7,271,12347,2,'2015-11-06','10:45:00','Leanne Spray','NextR'),(30,7,271,12347,3,'2015-11-22','11:45:00','Leanne Spray',NULL),(31,8,945,12348,2,'2015-11-11','12:45:00','Harris Fors','Hired'),(32,9,165,12363,2,'2015-11-10','13:45:00','Greta Black','Hired'),(33,10,145,12351,2,'2015-11-12','14:45:00','Freda Hit','Hired');
/*!40000 ALTER TABLE `InterviewDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PositionDetails`
--

DROP TABLE IF EXISTS `PositionDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PositionDetails` (
  `PositionID` int(11) NOT NULL COMMENT 'Position Identification Number',
  `Company` varchar(45) NOT NULL COMMENT 'Company Name',
  `TypeOfPosition` varchar(45) NOT NULL COMMENT 'Position Title',
  PRIMARY KEY (`PositionID`),
  KEY `FK_CompanyName_idx` (`Company`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PositionDetails`
--

LOCK TABLES `PositionDetails` WRITE;
/*!40000 ALTER TABLE `PositionDetails` DISABLE KEYS */;
INSERT INTO `PositionDetails` VALUES (1,'Smart Inc.','Supervisor'),(2,'MARS Industries','Secretary'),(3,'Dunne and Co.','Customer Service'),(4,'Golden Valley Computers','Researcher'),(5,'West Valley Networks','Accountant'),(6,'Roche Enterprises','Developer'),(7,'SED Corporation','Sales'),(8,'Libero Foundation','HR'),(9,'Fitzgerald & Sons','Assistant Manager'),(10,'Star Inc.','Personal Assistanct');
/*!40000 ALTER TABLE `PositionDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PositionSkills`
--

DROP TABLE IF EXISTS `PositionSkills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PositionSkills` (
  `Position_ID` int(11) NOT NULL COMMENT 'Identification number of position',
  `Skill` varchar(20) NOT NULL COMMENT 'Skill associated with position',
  KEY `FK_PositionIDENT_idx` (`Position_ID`),
  CONSTRAINT `FK_PositionIDENT` FOREIGN KEY (`Position_ID`) REFERENCES `PositionDetails` (`PositionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PositionSkills`
--

LOCK TABLES `PositionSkills` WRITE;
/*!40000 ALTER TABLE `PositionSkills` DISABLE KEYS */;
INSERT INTO `PositionSkills` VALUES (2,'Administration'),(2,'Organisation'),(3,'Communication'),(3,'Administration'),(4,'Research'),(4,'Problem Solving'),(5,'Problem Solving'),(5,'Time Management'),(6,'Research'),(6,'Communication'),(7,'Communication'),(7,'Problem Solving'),(8,'Organisation'),(8,'Administration'),(9,'Managerial'),(9,'Communication'),(10,'Organisation'),(10,'Communication'),(1,'Administration');
/*!40000 ALTER TABLE `PositionSkills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'McCarthy_12744729'
--

--
-- Dumping routines for database 'McCarthy_12744729'
--
/*!50003 DROP PROCEDURE IF EXISTS `CandidateDetails_NewRow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CandidateDetails_NewRow`(IN p_CandidateID INT, p_Name varchar(20), p_Address varchar(40), p_TelNo INT, p_Email varchar(40))
BEGIN
INSERT INTO CandidateDetails(CandidateID, CandidateName, Address, PhoneNumber, Email) 
			VALUES (p_CandidateID, p_Name, p_Address, p_TelNo, p_Email);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CandidateSkills_NewRow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CandidateSkills_NewRow`(IN p_CandidateID INT, p_skill varchar(30))
BEGIN
INSERT INTO CandidateSkills(Candidate_ID, Skill) 
			VALUES (p_CandidateID, p_skill);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CandidateSkill_PositionID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CandidateSkill_PositionID`(IN p_PositionID INT)
BEGIN
SELECT DISTINCT C.*
FROM CandidateDetails C, CandidateSkills CS, PositionSkills PS
WHERE PS.Position_ID = p_PositionID AND PS.Skill=CS.Skill AND C.CandidateID=CS.Candidate_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Candidate_CandidateID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Candidate_CandidateID`(IN p_CandidateID INT)
BEGIN
SELECT *
FROM CandidateDetails
WHERE CandidateID=p_CandidateID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Candidate_Name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Candidate_Name`(IN p_Name varchar(20))
BEGIN
SELECT *
FROM CandidateDetails
WHERE CandidateName=p_Name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CompanyDetails_NewRow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CompanyDetails_NewRow`(IN p_CompanyID INT, p_Company varchar(30), p_RefName varchar(30), p_RefAddress varchar(40), p_RefPhoneNumber INT)
BEGIN
INSERT INTO CompanyDetails(CompanyID, CompanyName, ReferenceName, ReferenceAddress, ReferencePhoneNumber)
	VALUES (p_CompanyID, p_Company, p_RefName, p_refAddress, p_RefPhoneNumber);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Company_CompanyID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Company_CompanyID`(IN p_CompanyID INT)
BEGIN
SELECT *
FROM CompanyDetails
WHERE CompanyID=p_CompanyID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Company_Name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Company_Name`(IN p_CompanyName varchar(30))
BEGIN
SELECT *
FROM CompanyDetails
WHERE CompanyName=p_CompanyName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Hired_NewRow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Hired_NewRow`(IN p_CandidateID INT, p_PositionID INT, p_CompanyID INT)
BEGIN
INSERT INTO Hired(CandidateID, PositionID, CompanyID)
		VALUES (p_CandidateID, p_PositionID, p_CompanyID);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InterviewDetails_NewRow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InterviewDetails_NewRow`(IN p_InterviewID INT, p_PositionID INT, p_CompanyID INT, p_CandidateID INT, p_InterviewRound INT, p_Date DATE, p_Time TIME, p_Interviewer varchar(20), p_Progress enum('NextR','Eliminated', 'Hired', ''))
BEGIN
INSERT INTO InterviewDetails(InterviewID, PositionID, CompanyID, CandidateID, InterviewRound, InterviewDate, InterviewTime, Interviewer, Progress)
	VALUES (p_InterviewID, p_PositionId, p_CompanyID, p_CandidateID, p_InterviewRound, p_Date, p_Time, p_Interviewer, p_Progress);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Interviews_Date` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Interviews_Date`(IN p_Date Date)
BEGIN
SELECT *
FROM InterviewDetails
WHERE InterviewDate=p_Date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Name_CandidateID_InterviewTwice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Name_CandidateID_InterviewTwice`()
BEGIN
SELECT distinct C.CandidateName, C.CandidateID
FROM CandidateDetails C, InterviewDetails ID
WHERE ID.InterviewRound>1 AND ID.CandidateID=C.CandidateID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NumAdministrativeSkills` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `NumAdministrativeSkills`()
BEGIN
SELECT COUNT(*)
FROM PositionSkills
WHERE Skill='Administration';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PositionDetails_NewRow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PositionDetails_NewRow`(IN p_PositionID INT, p_Company varchar(20), p_TypeofPosition varchar(40))
BEGIN
INSERT INTO PositionDetails(PositionId, Company, TypeOfPosition)
	VALUES (p_PositionId, p_Company, p_TypeOfPosition);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PositionsByCompanies` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PositionsByCompanies`()
BEGIN
SELECT *
FROM PositionDetails
ORDER BY Company;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PositionSkills_NewRow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PositionSkills_NewRow`(IN p_PositionID INT, p_skill varchar(30))
BEGIN
INSERT INTO PositionSkills(Position_ID, skill)
	VALUES (p_PositionID, p_skill);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Position_PositionID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Position_PositionID`(IN p_PositionID INT)
BEGIN
SELECT *
FROM PositionDetails
WHERE PositionID=p_PositionID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Position_Skill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Position_Skill`(IN p_Skill varchar(40))
BEGIN
SELECT P.*
	FROM PositionDetails P, PositionSkills PS
	WHERE PS.Skill=p_Skill AND P.PositionID=PS.Position_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-14 12:55:37
