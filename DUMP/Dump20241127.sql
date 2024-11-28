-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: healthub-schema
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `activitylog`
--

DROP TABLE IF EXISTS `activitylog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activitylog` (
  `LogID` varchar(50) NOT NULL,
  `UserID` varchar(50) NOT NULL,
  `ActivityType` varchar(50) NOT NULL,
  `CaloriesBurned` int DEFAULT NULL,
  `DateOfActivity` date DEFAULT NULL,
  `DistanceTraveled` float DEFAULT NULL,
  `Duration` int DEFAULT NULL,
  PRIMARY KEY (`LogID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `activitylog_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activitylog`
--

LOCK TABLES `activitylog` WRITE;
/*!40000 ALTER TABLE `activitylog` DISABLE KEYS */;
INSERT INTO `activitylog` VALUES ('AL694','U97','PM',1288,'2024-03-11',3.64,1558),('U2496','U97','PM',1288,'2024-03-11',3.64,1558);
/*!40000 ALTER TABLE `activitylog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientprofile`
--

DROP TABLE IF EXISTS `clientprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientprofile` (
  `ClientID` varchar(50) NOT NULL,
  `TrainerID` varchar(50) NOT NULL,
  `ProgressReports` text,
  `WorkoutPlans` text,
  `Goals` text,
  `NutritionalPlans` text,
  `VirtualSessionHistory` text,
  PRIMARY KEY (`ClientID`),
  KEY `TrainerID` (`TrainerID`),
  CONSTRAINT `clientprofile_ibfk_1` FOREIGN KEY (`TrainerID`) REFERENCES `trainer` (`TrainerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientprofile`
--

LOCK TABLES `clientprofile` WRITE;
/*!40000 ALTER TABLE `clientprofile` DISABLE KEYS */;
INSERT INTO `clientprofile` VALUES ('HM834','T47','report','1414','Good','25.22','Especially task important wait audience current.'),('VS570','T47','report','1414','Good','25.22','1823');
/*!40000 ALTER TABLE `clientprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `healthmetrics`
--

DROP TABLE IF EXISTS `healthmetrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `healthmetrics` (
  `HealthMetricID` varchar(50) NOT NULL,
  `UserID` varchar(50) NOT NULL,
  `BMI` float DEFAULT NULL,
  `HeartRate` int DEFAULT NULL,
  `SleepQuality` varchar(100) DEFAULT NULL,
  `BodyFat` float DEFAULT NULL,
  `CaloriesBurnedPerDay` int DEFAULT NULL,
  PRIMARY KEY (`HealthMetricID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `healthmetrics_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `healthmetrics`
--

LOCK TABLES `healthmetrics` WRITE;
/*!40000 ALTER TABLE `healthmetrics` DISABLE KEYS */;
/*!40000 ALTER TABLE `healthmetrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutritionlog`
--

DROP TABLE IF EXISTS `nutritionlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nutritionlog` (
  `LogID` varchar(50) NOT NULL,
  `UserID` varchar(50) NOT NULL,
  `MealName` varchar(100) NOT NULL,
  `CalorieCount` int DEFAULT NULL,
  `Macronutrients` text,
  `MealCategory` varchar(50) DEFAULT NULL,
  `DateLogged` date DEFAULT NULL,
  PRIMARY KEY (`LogID`),
  UNIQUE KEY `MealName` (`MealName`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `nutritionlog_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutritionlog`
--

LOCK TABLES `nutritionlog` WRITE;
/*!40000 ALTER TABLE `nutritionlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `nutritionlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `PersonID` varchar(50) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `DateOfBirth` date NOT NULL,
  PRIMARY KEY (`PersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES ('P1','Brittany Ross','1953-10-26'),('P10','Chase Hodges','2004-09-07'),('P100','Benjamin Smith','1959-10-25'),('P101','Michael Wallace','1999-11-02'),('P102','Samantha May','1965-09-03'),('P103','Tim White','1993-05-19'),('P104','Frances English','1957-01-23'),('P105','Elizabeth Jones','1962-03-23'),('P106','Crystal Maldonado','1948-05-28'),('P107','Herbert Pierce','1981-05-14'),('P108','Michael Ford','1970-02-04'),('P109','Robert Johnson','2004-05-09'),('P11','Brooke Fitzgerald','1990-08-11'),('P110','Jeffrey Powers','1959-01-23'),('P111','Brooke Nelson','1997-05-13'),('P112','Larry Petty','1978-12-18'),('P113','Joshua Richardson','1950-02-08'),('P114','Jon Page','1976-02-12'),('P115','Christine Davis','1981-06-16'),('P116','Kelly Jones','2005-02-23'),('P117','Kyle Ray','2005-06-23'),('P118','David Bailey','1946-04-30'),('P119','Tracy Gomez','1980-11-26'),('P12','Stacy Barron','1968-06-08'),('P120','Emily Baxter','1993-10-26'),('P121','Walter Glover','1954-03-28'),('P122','Vincent Garcia','1988-07-12'),('P123','Kristin Castro','1983-06-23'),('P124','Jerome Gonzalez','2005-12-01'),('P125','Tricia Baker','1985-02-01'),('P126','Vickie Palmer','1956-12-22'),('P127','Brian Nguyen','1955-03-07'),('P128','Sierra Roberts','1979-01-15'),('P129','Michael Williams','2004-07-27'),('P13','Erin White','1945-08-25'),('P130','Stephanie Rojas','1950-08-03'),('P131','James Morgan','2005-04-15'),('P132','Michael Roberts','1961-05-13'),('P133','Jacqueline Mcknight','1962-11-08'),('P134','Angela Crosby','1985-12-20'),('P135','Sarah Shah','1978-05-18'),('P136','Maria Lane','1970-01-12'),('P137','Marcus Bush','1989-12-18'),('P138','Erika Olsen','1948-02-07'),('P139','Stephen Baldwin','1964-04-10'),('P14','Billy Michael','1989-03-28'),('P140','Natalie Rodriguez','2000-08-03'),('P141','Robert Nelson','1977-11-02'),('P142','Grace Briggs','1996-06-24'),('P143','Henry Schmidt','1982-02-15'),('P144','Kevin Acosta','1967-05-20'),('P145','Nathaniel Collins','1997-10-20'),('P146','Mark Lewis','1953-11-13'),('P147','Angela Rodriguez','1976-11-25'),('P148','Christina Smith','1945-06-22'),('P149','Robin Holmes','1960-04-19'),('P15','Warren Hall','1997-06-19'),('P150','Wendy Anderson','1952-03-11'),('P151','Lisa Morrison','1997-06-09'),('P152','Luis Brown','2005-11-08'),('P153','Brett Mcpherson','1949-08-13'),('P154','Sean Pierce','1970-05-31'),('P155','Lisa Harris','1971-04-16'),('P156','Kent Green','1984-07-13'),('P157','Lauren Richardson','2000-08-21'),('P158','Steven Wood','1983-03-07'),('P159','Linda Graves','1992-09-19'),('P16','Christine Graves','1961-08-02'),('P160','Christopher Johnson','1970-03-09'),('P161','Kelly Vaughan','1951-02-19'),('P162','Mrs. Allison Hunt','1945-10-15'),('P163','Melissa Williams','1997-01-23'),('P164','Carolyn Chavez','1965-03-09'),('P165','Kristin Fitzgerald MD','1976-04-13'),('P166','Kyle Flynn','1979-08-03'),('P167','Krystal Reed','1961-12-17'),('P168','Kimberly George','1983-07-26'),('P169','Elizabeth Owens','1970-09-04'),('P17','Eric Harris','1964-01-21'),('P170','Kelly Schaefer','1968-10-29'),('P171','Anthony White','1984-06-26'),('P172','Natalie Miller','1986-10-14'),('P173','Mason Martin','1976-09-05'),('P174','Andrew Kelly','1976-08-01'),('P175','Elizabeth Gillespie','1980-02-06'),('P176','Clinton Wilson','1956-05-12'),('P177','Anthony Rodriguez','1982-05-06'),('P178','Brenda Mitchell','1977-11-20'),('P179','Frank Lynch','1962-03-11'),('P18','Sarah Dominguez','1946-06-03'),('P180','Raymond Duke','1971-10-09'),('P181','Carolyn Jefferson','1979-07-25'),('P182','Justin Cummings','1999-08-26'),('P183','Paul Harrison','2003-10-20'),('P184','Shawn Booth','1947-09-02'),('P185','Tracy Taylor','1945-12-23'),('P186','Anna Vargas','2005-02-19'),('P187','John Shea','1975-05-05'),('P188','Shawn Scott','1967-03-30'),('P189','Stephanie Sampson','1972-02-17'),('P19','Kenneth Newton','1949-05-25'),('P190','Jerome Turner','1973-06-04'),('P191','Chloe Campbell','1944-02-21'),('P192','Michelle Bray','1977-09-22'),('P193','Theresa Morgan','2002-10-02'),('P194','Brenda Williams','1975-02-26'),('P195','Beverly Ramirez','1996-08-25'),('P196','Hunter Anderson','1967-05-02'),('P197','Anna Bennett','1946-04-01'),('P198','Jonathan Gray','2004-03-31'),('P199','Christopher Young','1990-09-22'),('P2','Sara Quinn','1963-06-07'),('P20','Jacob Ramirez','1990-01-29'),('P200','Jeanette Gonzalez','1983-09-14'),('P201','Lauren Cuevas','1951-06-03'),('P202','Justin Pittman PhD','2005-09-20'),('P203','Nancy Davis','1981-05-19'),('P204','Victoria Sampson','1974-02-18'),('P205','Scott Walter','1973-07-13'),('P206','Anthony Cruz','1962-01-29'),('P207','Scott Lopez','1987-11-22'),('P208','Matthew Page','1976-10-27'),('P209','Nancy Randolph','1966-01-03'),('P21','Sue Turner','1994-08-28'),('P210','Carrie Smith','1989-11-26'),('P211','Dawn Anderson','1966-03-25'),('P212','Catherine Carpenter','1980-03-16'),('P213','Marissa Morton','1992-06-10'),('P214','Carlos Davis','1998-10-20'),('P215','Mr. Logan Johnson','1951-09-12'),('P216','Alejandro Ewing','1970-04-24'),('P217','Zachary Parker','1997-06-08'),('P218','Christie Hester','1958-10-07'),('P219','Jim Wilson','1984-12-21'),('P22','Rachel Martin','1959-12-21'),('P220','Peter Meadows','1944-11-01'),('P221','Jennifer Mitchell','1967-05-30'),('P222','Jerry Jones','1968-09-26'),('P223','Benjamin Adkins DVM','1981-01-23'),('P224','James Schneider','1983-11-03'),('P225','Misty Walton','1997-03-08'),('P226','Terri Soto','1978-10-16'),('P227','Stephanie Graham','1959-10-28'),('P228','David Johnston','1972-12-05'),('P229','Kimberly Briggs','2004-01-21'),('P23','Timothy Taylor','1959-09-15'),('P230','Kevin Moreno','1990-07-25'),('P231','Sandra Hill','1982-03-24'),('P232','David Robertson','2004-07-10'),('P233','Clinton Allen','1945-09-02'),('P234','Sandra Allen','1986-09-24'),('P235','Courtney Rivera','1978-05-11'),('P236','Derek Thomas','1997-12-09'),('P237','Ryan Castro','1976-06-24'),('P238','Robert Chase','1948-11-05'),('P239','Zachary Bridges','1985-01-24'),('P24','Kelly Ponce','1967-01-01'),('P240','John Perry','1961-06-30'),('P241','Cindy Thompson','1996-11-04'),('P242','Kent Jacobson PhD','1996-01-16'),('P243','Jon Johnston','1956-04-10'),('P244','Shannon Flores','1963-06-23'),('P245','Joseph Adams','1949-05-12'),('P246','Jose Gross','1969-02-09'),('P247','Kristen Hall','1979-09-04'),('P248','Lori Singleton','1999-11-05'),('P249','Alexander White','1955-04-04'),('P25','Joseph Krueger','1979-09-05'),('P250','Shawn Fisher','1968-07-01'),('P251','Tony Bell','1989-04-27'),('P252','Jeff Martin','1956-10-12'),('P253','Katrina White','1995-05-31'),('P254','Chad Day','1982-09-28'),('P255','Stephanie Lane','1996-06-03'),('P256','Timothy Smith','1955-05-30'),('P257','Laurie Reed','1982-09-02'),('P258','Daniel Kelly','1944-05-18'),('P259','Tanya Lynch','1945-08-15'),('P26','Laura Benson','1995-04-07'),('P260','Kristen Robles','1956-08-03'),('P261','Brenda Butler','1996-01-14'),('P262','Ryan Walker','1967-08-02'),('P263','Jeffrey Gutierrez','1982-12-26'),('P264','Jeffery Sanchez','1964-08-08'),('P265','Angelica Santos','1999-08-07'),('P266','Deborah Riley','1993-05-03'),('P267','Miss Nicole Rivera','1950-08-29'),('P268','Paul Thompson','1945-05-24'),('P269','Charles Key','1968-07-20'),('P27','Tracy Buchanan','1980-10-18'),('P270','Stacey Hale','1990-11-06'),('P271','Leon Martin','1955-09-07'),('P272','Dennis Bowen','1980-07-05'),('P273','Emily Smith','1975-02-21'),('P274','Shawn Smith','1993-10-30'),('P275','Patrick Estes','1980-08-25'),('P276','William Walker','1951-03-19'),('P277','Cristian Stevens','1971-02-26'),('P278','Christopher Obrien','1973-04-25'),('P279','Scott Mcguire','1959-02-10'),('P28','Adrian Johnston','1958-03-31'),('P280','Peter Jackson','1997-06-30'),('P281','Misty Luna','1955-06-13'),('P282','Stephanie Miller','1964-10-26'),('P283','Briana Jones','1989-03-07'),('P284','Rebecca Butler','1952-08-01'),('P285','Alicia Fisher','1977-03-21'),('P286','Teresa Chavez','1982-05-16'),('P287','Melanie Douglas','1997-07-21'),('P288','Susan Thomas','1962-03-16'),('P289','Martha Porter','1976-01-15'),('P29','Christopher Chase','1993-04-05'),('P290','Joy Costa','1961-03-17'),('P291','Lucas Kelley','1946-07-31'),('P292','Sandra Williams','1984-04-15'),('P293','Diamond Luna','1954-06-16'),('P294','Billy Douglas','1973-10-06'),('P295','Maria Copeland','1945-10-11'),('P296','Cheryl Johnson','1971-04-08'),('P297','James Chan II','1985-06-15'),('P298','Mercedes Gonzales','1946-03-05'),('P299','Gabriel George','1974-07-04'),('P3','Melanie Floyd','2004-11-09'),('P30','Brittany Martin','1970-03-11'),('P300','Shannon Harrington','1976-04-04'),('P301','Robert Johnson','1974-04-16'),('P302','Brittany Lopez','1964-12-09'),('P303','Tyler Johnson','1962-11-20'),('P304','Aaron Joyce','1944-01-14'),('P305','David Estes','1994-10-29'),('P306','Melissa Simmons','2002-11-15'),('P307','Dr. Katelyn Morris','1993-06-10'),('P308','Mark Reese','1945-12-20'),('P309','Sara Payne','1975-02-08'),('P31','Jason Macias','1988-07-11'),('P310','Sandra Mathis','1972-02-24'),('P311','Travis Kelly','1992-07-29'),('P312','Andre Jones','1957-09-29'),('P313','Robert Anderson','1996-04-27'),('P314','Joshua Montgomery','1951-10-03'),('P315','Melanie Ross','1949-10-15'),('P316','Julie Jones','1994-02-02'),('P317','Kevin Reed','1966-12-21'),('P318','Ashley Snyder','1961-07-31'),('P319','Dr. Dawn Alexander','1947-10-30'),('P32','Anthony King','1964-10-05'),('P320','Daniel Garcia','1973-01-23'),('P321','Donald Camacho','1970-11-08'),('P322','Tyler Lowery','2006-08-27'),('P323','Shannon Williams','1982-09-14'),('P324','Richard Watson','1989-06-20'),('P325','Justin Hester','1984-07-06'),('P326','Mandy Crawford','1964-04-20'),('P327','Rebecca Fry','2003-05-16'),('P328','Ryan Miller','1998-09-27'),('P329','Christina Washington','1974-03-26'),('P33','Walter Johnston','1969-12-22'),('P330','Allison Wallace','2001-07-16'),('P331','Alicia Ballard','1996-07-19'),('P332','William Smith','1946-06-05'),('P333','Mr. Donald Walker','1960-12-07'),('P334','Mr. John Wright','1950-04-13'),('P335','Laura Foster','2004-12-05'),('P336','Anthony Holmes','1955-03-28'),('P337','Matthew Sanders','1946-04-23'),('P338','Gerald Smith','1982-11-02'),('P339','Charles Jones','1966-02-03'),('P34','Daniel Nelson','1964-11-29'),('P340','Dalton Dominguez','2004-12-01'),('P341','Stephanie Jones','1950-10-09'),('P342','John Parker','1984-04-25'),('P343','Mr. Anthony Delgado','1998-08-08'),('P344','Albert Simmons','1955-05-18'),('P345','Christopher Watson','1990-03-08'),('P346','Deborah Payne','1952-02-07'),('P347','Diane Wise','1971-05-18'),('P348','Drew Dunlap','1963-06-14'),('P349','Sabrina Jones','1979-04-19'),('P35','Chelsea Roth','1968-03-26'),('P350','Amber Daugherty','1961-04-03'),('P351','Alexander Harris','1996-06-20'),('P352','Carrie Robbins','1951-05-13'),('P353','Marilyn Bradford','1979-03-22'),('P354','Kathy Wagner','1965-02-15'),('P355','Kenneth Rogers','1963-11-19'),('P356','Jennifer Smith','1974-03-06'),('P357','Dr. Zachary Contreras','1972-06-06'),('P358','Robert Castillo','1957-10-11'),('P359','Andrea Conley','1949-06-07'),('P36','Phillip Edwards','2005-01-07'),('P360','Lucas Hodges','1999-03-14'),('P361','Gary Gonzalez','1961-05-30'),('P362','Jacob Miller','1977-05-13'),('P363','Leslie Stone','1970-03-21'),('P364','Crystal Hall','1946-05-09'),('P365','Joann Allen','1971-09-27'),('P366','Laura Thompson','1999-09-16'),('P367','Joseph Wilkins','1969-05-30'),('P368','Gary Harrison','1975-05-19'),('P369','Shannon Jackson','1971-11-20'),('P37','James Vaughn','1981-12-22'),('P370','Isabella Cooper','1986-01-01'),('P371','Jacob Lee DDS','1999-10-14'),('P372','Pamela Thomas','1988-02-17'),('P373','Leslie Evans','1968-03-19'),('P374','Mrs. Kaitlin Sims','1972-08-11'),('P375','Rebecca Ball','1953-07-27'),('P376','Jose Hughes','1968-12-17'),('P377','Amy Becker','1993-12-13'),('P378','Gloria Cabrera','1973-05-25'),('P379','David Lewis','1999-08-29'),('P38','Monica Ray','1976-10-29'),('P380','Valerie Rodriguez','1967-10-22'),('P381','Martha Maddox','1965-06-25'),('P382','Cory Johnson','1967-11-05'),('P383','Christopher Silva','1972-09-17'),('P384','Christina Martin','1959-07-31'),('P385','Dominique Glenn','1984-12-25'),('P386','Brett Ruiz','1978-11-10'),('P387','Kathy Thompson','1987-05-16'),('P388','Phillip Riley','1950-07-02'),('P389','Ricky Walker','1963-11-09'),('P39','Joanne Nelson','1965-10-11'),('P390','Wendy Williams','1945-01-12'),('P391','Hailey Stewart','2006-01-30'),('P392','Melissa Clark','1981-12-08'),('P393','Ashley Parker','1968-03-30'),('P394','Tara Lozano','2003-09-22'),('P395','Brittany Johnson','1990-05-21'),('P396','Tim Bowers','1995-01-28'),('P397','Emily Newman','1961-05-20'),('P398','Haley Smith','1996-05-23'),('P399','Jeffery Robinson','1972-09-19'),('P4','Kathleen Moore','1952-08-09'),('P40','Angela Powell','1972-06-08'),('P400','Christina Snyder','1961-11-13'),('P401','Emily Smith','1947-06-09'),('P402','Dave Thomas','1995-01-11'),('P403','Jeffrey Wilson','1968-06-20'),('P404','Jason Miller','1972-05-31'),('P405','James Rivera','1971-11-08'),('P406','Krystal Summers','1993-08-14'),('P407','Lindsay Norman','1970-04-07'),('P408','Joseph Robbins','1973-06-29'),('P409','Aaron Jones','1989-11-04'),('P41','Amber Austin','1985-05-14'),('P410','Adam Shaw','1997-08-20'),('P411','Melissa Ryan','2001-08-13'),('P412','John Mcmahon','1963-04-07'),('P413','Michael Brown','2000-09-02'),('P414','Tony Ewing','1997-06-08'),('P415','James Lindsey','2001-05-31'),('P416','Derrick Jacobs','1969-10-30'),('P417','John Gamble','1994-12-02'),('P418','Ashley Callahan','1960-11-06'),('P419','Denise Horn','1966-10-03'),('P42','Melanie Baker','1949-04-15'),('P420','Catherine Foster','1959-05-01'),('P421','Taylor Ortega','1993-01-28'),('P422','Kimberly Turner','1955-06-18'),('P423','James Brown','1983-09-21'),('P424','James Carlson','1990-10-11'),('P425','Jamie Wright','1975-12-09'),('P426','Hayden Wright','1987-01-29'),('P427','Chris Walsh','1963-03-09'),('P428','Rodney Stewart','1959-01-27'),('P429','Jason Chandler','2004-11-08'),('P43','Pamela Melendez','1955-02-06'),('P430','Ricky Howard','1975-06-07'),('P431','Ernest David','1958-04-16'),('P432','Tina Jarvis','1989-09-19'),('P433','Tamara Miller DVM','1947-07-22'),('P434','David Mahoney','1988-07-16'),('P435','Jeffrey Hall','1948-05-08'),('P436','Kelly Parker','1945-02-05'),('P437','Mr. Donald Monroe','1968-08-07'),('P438','Jason Sanchez','1945-08-21'),('P439','Laura Bell','1973-11-24'),('P44','Elizabeth Harrington','1945-03-30'),('P440','Tony Sanchez','1994-11-09'),('P441','William Park','1969-02-18'),('P442','Peter Butler','1986-01-19'),('P443','Patricia Nielsen','1971-03-24'),('P444','Timothy Garcia','1944-04-10'),('P445','Todd Walker','1991-04-25'),('P446','Nicholas Murphy MD','1986-07-28'),('P447','Charles Marshall','1969-05-23'),('P448','Katie Stuart','1967-03-07'),('P449','Brenda Pope','1950-11-27'),('P45','Renee Charles','1952-01-10'),('P450','Manuel Martinez','2004-04-21'),('P451','Connie Booth','1976-11-04'),('P452','Corey Schwartz','1992-11-14'),('P453','Frank Kent','1998-09-01'),('P454','Michelle Valencia','1998-04-14'),('P455','Sherry Diaz','1956-09-06'),('P456','Joshua Smith','2003-08-11'),('P457','Ashley Deleon','1993-12-08'),('P458','Tamara Choi','1956-08-17'),('P459','Shawn Washington','1945-07-10'),('P46','Crystal Hill','1970-04-07'),('P460','Kaitlyn Holt','1978-06-25'),('P461','Amber Spence','1961-12-22'),('P462','Chelsea Rowland','1980-01-20'),('P463','Laura Jackson','1951-01-16'),('P464','Mason Walter','1962-04-24'),('P465','Jason Costa','1971-12-30'),('P466','Lisa Bailey','1985-11-30'),('P467','Justin Schneider','1990-12-01'),('P468','Shannon Sherman','1989-01-01'),('P469','Timothy Cortez','1993-06-21'),('P47','Keith Berger','1956-12-29'),('P470','Nathan Jones','1977-12-09'),('P471','Jeffrey Cook','1963-05-24'),('P472','Cheryl Martinez','1989-06-01'),('P473','Anthony Mitchell','2003-02-03'),('P474','Courtney Mccoy','1960-11-16'),('P475','Craig Adams','1993-03-14'),('P476','Sarah Conner','1950-05-27'),('P477','Holly Allison','1952-04-11'),('P478','Andrea Wells','1968-03-04'),('P479','Amber Gordon','1979-10-04'),('P48','Deborah Watson','1982-05-19'),('P480','James Smith','1978-02-06'),('P481','Annette Sherman','1955-06-05'),('P482','Latoya Mckinney','1973-11-26'),('P483','Michelle Curry','1990-01-07'),('P484','Kathleen Marshall','1993-02-25'),('P485','Penny Dougherty','1971-12-29'),('P486','Katrina Cabrera','1968-01-15'),('P487','George Simon','1964-09-13'),('P488','Suzanne Pope','1976-09-08'),('P489','Matthew Deleon','1974-08-24'),('P49','Samantha Little','1999-07-01'),('P490','Jermaine Young','1970-07-19'),('P491','Jill Copeland','1946-07-30'),('P492','Christina Neal','1963-01-04'),('P493','Jacqueline Briggs','1959-10-09'),('P494','Brian Moore','2005-09-28'),('P495','Timothy Pham','1957-05-27'),('P496','Joshua Sellers','1956-03-21'),('P497','Kevin Mills','1945-07-25'),('P498','Samantha Rich','1954-12-20'),('P499','Stacey Wilson','1997-08-01'),('P5','Amanda Mcfarland','2005-12-08'),('P50','Alex Hudson','1995-07-06'),('P500','Rebekah Williams','1974-02-07'),('P501','Lori Lee','2000-05-04'),('P502','Andrew Franklin','1990-11-30'),('P503','Mariah Chandler','1984-01-31'),('P504','Tiffany Lopez','2000-08-17'),('P505','Jeffrey Stevens','1952-11-08'),('P506','Alyssa Harrington','1953-09-17'),('P507','Jamie Smith','1966-02-25'),('P508','Jason Anderson','2002-06-04'),('P509','James Roman','1979-12-15'),('P51','Joanna Wilson','1987-05-14'),('P510','Karen Moran','2003-07-07'),('P511','Daisy Pope','2000-05-30'),('P512','Natalie Garza','1995-01-08'),('P513','Cynthia Dixon','2002-01-01'),('P514','Randy Williams','1996-01-24'),('P515','Peggy Lopez','1983-05-30'),('P516','Benjamin Johnson','1984-03-06'),('P517','Jason Rogers','1982-01-14'),('P518','Ashley Elliott','1957-11-07'),('P519','Alyssa Adams','1943-12-21'),('P52','Adam Moon','1947-08-04'),('P520','Nicole Hooper','1955-02-23'),('P521','Christopher Kelly','1949-06-03'),('P522','Heather Kemp','1998-11-25'),('P523','Kathryn Whitney','1998-05-05'),('P524','Mario James','1978-07-25'),('P525','Levi Cooke','2000-10-21'),('P526','Jonathan Walker','1955-08-12'),('P527','Kimberly Walker','1969-01-02'),('P528','Stephen Weaver','1972-12-31'),('P529','Lisa Cooper','1951-01-26'),('P53','Dr. James Sampson','1965-08-28'),('P530','Amanda Robbins','1946-06-18'),('P531','Tabitha Grant','1995-06-07'),('P532','Veronica Thomas','1959-04-30'),('P533','Amanda Evans','2002-11-04'),('P534','Joel Garza','1973-01-10'),('P535','Ryan Barker','1993-08-03'),('P536','Brian Rodriguez','1984-06-06'),('P537','John Bentley','1986-12-30'),('P538','Gene Rios','1979-10-12'),('P539','Christopher Baxter','1998-11-06'),('P54','Gail Stewart','1953-07-14'),('P540','Renee Yang','1973-06-06'),('P541','Mariah Montoya','1952-05-07'),('P542','Michael Logan','1955-08-02'),('P543','Raymond Austin','1951-05-20'),('P544','Joel Li','1992-04-26'),('P545','Paul Marsh','1999-12-28'),('P546','Stephanie Harvey DDS','1952-04-11'),('P547','Lisa Meyer','1947-03-17'),('P548','Jennifer Ross','1988-04-15'),('P549','Brenda Thompson','1961-06-28'),('P55','Crystal Levine','1980-02-26'),('P550','Luis Lee','1975-12-09'),('P551','Emily Pace','1963-08-30'),('P552','Stephanie Ware','1997-07-28'),('P553','Xavier Jones','2005-11-20'),('P554','Danielle Lozano','1944-02-25'),('P555','Dana Ramirez','1979-09-11'),('P556','Taylor Allen','2005-07-18'),('P557','Daniel Potts','1970-12-04'),('P558','Phillip Rojas','1948-06-09'),('P559','Samantha Morrison','1985-06-18'),('P56','Reginald Cardenas','1970-03-24'),('P560','Lisa Wood','1977-03-28'),('P561','Krystal Mitchell','1945-06-24'),('P562','Megan Harris','1986-04-26'),('P563','Leslie Harris','1977-08-31'),('P564','Russell Torres','1967-07-27'),('P565','Juan Rangel','1990-03-03'),('P566','Stephanie Dixon','1949-03-17'),('P567','Victoria Payne','1991-07-20'),('P568','Christy Morgan','1979-08-14'),('P569','Stephen Cochran','1998-08-21'),('P57','William Nguyen','2001-04-24'),('P570','Christopher Allen','1987-08-15'),('P571','Hunter Hanna','1999-03-27'),('P572','Tiffany Oliver','1996-11-01'),('P573','Isaac Ross','1993-12-14'),('P574','Amy Mcgrath','2001-12-17'),('P575','Alan Lam','1984-09-19'),('P576','Dawn Sims','1997-06-17'),('P577','Tony Wilson','1945-08-20'),('P578','Karen Wolfe','1951-11-25'),('P579','Justin Moore','1961-05-23'),('P58','Cameron Nichols','1970-03-23'),('P580','Joseph Blackwell','1979-07-13'),('P581','Ashley Reyes','1952-06-08'),('P582','Dawn Figueroa','1995-08-21'),('P583','Michael Lopez','2003-09-29'),('P584','Kimberly Hall','1991-02-14'),('P585','Bonnie Conley DDS','1978-03-31'),('P586','Bryan Allison','1981-07-19'),('P587','Kathleen Gardner','1985-12-12'),('P588','Johnny Wheeler','1986-11-03'),('P589','Julie Roth','2003-05-20'),('P59','Benjamin Pace','1973-06-23'),('P590','Nancy Jones','1957-04-25'),('P591','Terry Skinner','1949-03-11'),('P592','Laura Davis','1990-07-08'),('P593','Michael Villanueva','1962-07-02'),('P594','Katie Marshall','1957-07-14'),('P595','Christopher Robertson','1984-12-06'),('P596','Earl Alvarez','1993-06-18'),('P597','Angel Jones','1988-09-22'),('P598','Nicholas Castro','1985-04-07'),('P599','Wayne Wade','1944-12-06'),('P6','Christopher Gonzalez','1969-05-21'),('P60','Bailey Ramirez','1977-09-11'),('P600','Kimberly Davis','1968-12-02'),('P601','Natalie Rice','1968-12-20'),('P602','Sara Myers','1980-04-08'),('P603','Gregory Roberts','1968-03-30'),('P604','John Thompson','1979-02-02'),('P605','Amber Park','1966-01-30'),('P606','Sue Owens','1961-04-02'),('P607','Hannah Mckee','1972-05-29'),('P608','Mr. Cameron Cunningham','1974-03-22'),('P609','Victor Robinson','1998-08-01'),('P61','Kevin Greene','1994-09-10'),('P610','Tracy Watts','1963-07-13'),('P611','Megan Chan','1946-10-14'),('P612','Taylor Sanchez','1977-05-13'),('P613','Kathleen Austin','1988-04-16'),('P614','Marc Baker','1987-10-05'),('P615','Michael Casey','1970-12-08'),('P616','Mark Taylor','1969-12-09'),('P617','John Johnson','1983-03-15'),('P618','Maurice Ryan','1988-10-24'),('P619','Michelle Miller','1958-12-01'),('P62','Craig Flores','1950-01-21'),('P620','Kenneth Roberts','1963-10-31'),('P621','Brandon Campbell','1992-10-31'),('P622','Samantha Walker','1962-04-30'),('P623','David Collins','1961-01-27'),('P624','David Bell','2003-04-30'),('P625','Steven Silva','1983-05-29'),('P626','Christine Cummings','1968-12-23'),('P627','Janet Gill','1995-11-05'),('P628','Andrea Scott','1985-09-15'),('P629','Teresa Sanders','1946-03-15'),('P63','Alexis Cline','1965-02-01'),('P630','David Parks','1981-12-20'),('P631','Dawn Jones','1985-09-29'),('P632','Carlos Brown','1983-07-06'),('P633','Brianna Williams','1957-06-27'),('P634','Vincent Richardson','1998-07-22'),('P635','Anthony Rodriguez','1972-02-06'),('P636','Desiree Chavez','1946-01-22'),('P637','Zachary Hawkins','1945-10-17'),('P638','Joseph Smith','1947-03-01'),('P639','Charles Williams','1951-11-18'),('P64','William Welch','1994-07-13'),('P640','Gary Day','1958-06-22'),('P641','Jonathan Brady','1979-12-19'),('P642','Michelle Ford','1989-04-03'),('P643','Melissa Copeland','1996-11-17'),('P644','Kathleen Carrillo','1995-09-10'),('P645','Richard Clark','2005-02-02'),('P65','April Eaton','1978-04-08'),('P66','Alexander Bullock','1996-06-11'),('P67','Amanda Williams','1945-04-05'),('P68','Todd Ramirez','1958-02-25'),('P69','Robin Berg','1968-05-31'),('P7','Rhonda Jackson','1953-11-02'),('P70','Philip Douglas','1948-10-19'),('P71','Philip Bender','2006-07-22'),('P72','Danielle Knapp','2002-07-16'),('P73','Kelly Gregory','1966-01-17'),('P74','Julie Schmidt','2001-05-14'),('P75','Charles Evans','1952-08-20'),('P76','Victoria Kelly','2001-01-05'),('P77','Jacob Rodriguez','1957-07-28'),('P78','Justin Stewart','1988-04-30'),('P79','Kathleen Hunt','1950-01-09'),('P8','Brandon Murphy','1978-01-08'),('P80','Cheryl Horn','1972-04-28'),('P81','Tara Li','1992-05-13'),('P82','Ryan Klein','1952-12-29'),('P83','Tonya Smith','1968-12-20'),('P84','Gina Gillespie','1965-04-25'),('P85','Matthew Thomas','1963-09-02'),('P86','Robin Thomas','1970-09-29'),('P87','Donald Mason','1959-02-09'),('P88','Clifford Brown','1981-10-08'),('P89','Lauren Wilkins','1995-07-28'),('P9','Mrs. Brittney Rivas','1950-02-20'),('P90','Angela Costa','1985-01-02'),('P91','Laurie Ortiz','1991-04-17'),('P92','Sheri Holder','1987-08-15'),('P93','Emma Cruz','1997-11-25'),('P94','Richard Johnston','1951-08-01'),('P95','Felicia Aguilar','1949-11-30'),('P96','Alexandra Anderson','1988-05-04'),('P97','Daniel Davis','1946-12-27'),('P98','Nicholas Cabrera','1961-06-02'),('P99','James Brown','1950-10-17');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer`
--

DROP TABLE IF EXISTS `trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainer` (
  `TrainerID` varchar(50) NOT NULL,
  `PersonID` varchar(50) NOT NULL,
  `Specialization` varchar(100) NOT NULL,
  `TrainerRating` float DEFAULT NULL,
  PRIMARY KEY (`TrainerID`),
  UNIQUE KEY `Specialization` (`Specialization`),
  KEY `PersonID` (`PersonID`),
  CONSTRAINT `trainer_ibfk_1` FOREIGN KEY (`PersonID`) REFERENCES `person` (`PersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer`
--

LOCK TABLES `trainer` WRITE;
/*!40000 ALTER TABLE `trainer` DISABLE KEYS */;
INSERT INTO `trainer` VALUES ('P421','P104','cindy20@example.com',3.4),('P427','P107','michael79@example.org',3.5),('P451','P119','turnerdawn@example.net',4),('P460','P124','Hospital pharmacist',4.1),('P463','P125','velazquezbrian@example.org',3.7),('P475','P219','Data processing manager',4.1),('P476','P131','kathrynhogan@example.net',3.3),('P487','P151','Bookseller',3.8),('P495','P317','Records manager',3.8),('P504','P380','Chemist, analytical',3.6),('P508','P281','Oncologist',3.3),('P509','P527','Consulting civil engineer',3.8),('P520','P154','opaul@example.com',4),('P541','P382','Horticulturist, amenity',4.1),('T47','P475','Environmental consultant',3.1),('T94','P304','Information systems manager',4.1),('U115','P115','Presenter, broadcasting',3.3),('U116','P116','Field seismologist',3.8),('U118','P118','1950-11-27',4.2),('U121','P135','Public relations account executive',5),('U134','P134','1978-02-06',3.6),('U137','P137','Holiday representative',4),('U138','P138','Theatre stage manager',4.5),('U143','P120','Health and safety adviser',3.9),('U144','P144','jasonbanks@example.org',3.1),('U159','P159','1969-01-02',4.8);
/*!40000 ALTER TABLE `trainer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` varchar(50) NOT NULL,
  `PersonID` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Height` int DEFAULT NULL,
  `Weight` int DEFAULT NULL,
  `FitnessGoals` text,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Email` (`Email`),
  KEY `PersonID` (`PersonID`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`PersonID`) REFERENCES `person` (`PersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('P233','P3','robert49@example.net','$e$1CXAfUt','F',152,75,'Top my relationship strong behavior establish.'),('P334','P56','erin04@example.com','K+130K!k8i','M',183,104,'Night citizen someone deal everyone test.'),('U60','P60','1966-02-03','f_9!fF6nQc','F',157,87,'Foreign two relationship million.'),('U61','P61','jojones@example.net','4_1yA@)h)T','Other',181,119,'Consumer benefit policy.'),('U62','P62','fgonzalez@example.org','7_h3+T4s33','Other',194,50,'Create get without provide listen mean.'),('U97','P97','warnermonica@example.org','1$xOgR!T$y','Other',151,64,'Eye later one over phone allow.');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtualsession`
--

DROP TABLE IF EXISTS `virtualsession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `virtualsession` (
  `SessionID` varchar(50) NOT NULL,
  `TrainerID` varchar(50) NOT NULL,
  `ClientID` varchar(50) NOT NULL,
  `Duration` int DEFAULT NULL,
  `DateOfSession` date DEFAULT NULL,
  `SessionSummary` text,
  `Feedback` text,
  PRIMARY KEY (`SessionID`),
  UNIQUE KEY `SessionSummary` (`SessionSummary`(255)),
  KEY `TrainerID` (`TrainerID`),
  KEY `ClientID` (`ClientID`),
  CONSTRAINT `virtualsession_ibfk_1` FOREIGN KEY (`TrainerID`) REFERENCES `trainer` (`TrainerID`),
  CONSTRAINT `virtualsession_ibfk_2` FOREIGN KEY (`ClientID`) REFERENCES `clientprofile` (`ClientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtualsession`
--

LOCK TABLES `virtualsession` WRITE;
/*!40000 ALTER TABLE `virtualsession` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtualsession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workoutplans`
--

DROP TABLE IF EXISTS `workoutplans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workoutplans` (
  `WorkoutPlanID` varchar(50) NOT NULL,
  `ClientID` varchar(50) NOT NULL,
  `TrainerID` varchar(50) NOT NULL,
  `WorkoutPlan` text,
  `Frequency` varchar(50) DEFAULT NULL,
  `ProgressLogs` text,
  PRIMARY KEY (`WorkoutPlanID`),
  UNIQUE KEY `WorkoutPlan` (`WorkoutPlan`(255)),
  KEY `ClientID` (`ClientID`),
  KEY `TrainerID` (`TrainerID`),
  CONSTRAINT `workoutplans_ibfk_1` FOREIGN KEY (`ClientID`) REFERENCES `clientprofile` (`ClientID`),
  CONSTRAINT `workoutplans_ibfk_2` FOREIGN KEY (`TrainerID`) REFERENCES `trainer` (`TrainerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workoutplans`
--

LOCK TABLES `workoutplans` WRITE;
/*!40000 ALTER TABLE `workoutplans` DISABLE KEYS */;
/*!40000 ALTER TABLE `workoutplans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'healthub-schema'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-27 21:58:19
