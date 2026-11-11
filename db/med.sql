CREATE DATABASE  IF NOT EXISTS `medicine` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `medicine`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: medicine
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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `eid` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'employee id',
  `name` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fname` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'father name',
  `dob` date NOT NULL,
  `doj` date NOT NULL COMMENT 'date of joining',
  `gender` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `mstatus` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'marital status',
  `phone` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `mail` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cadd` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'current address',
  `padd` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'permanent address',
  `qual` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('E00001','Snehasnigdha Rout','R Rout','2002-05-16','2026-02-10','Female','Single','9911223345','sneha@gmail.com','CTC','BALASORE','BTech');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `cid` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `mstatus` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'marital status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('C00001','Gourab Pattnaik','9178407005','2001-09-04','Male','Single'),('C00002','Dibesh Dash','8658857841','1998-10-06','Male','Single'),('C00003','Umesh Biswal','8658943841','1994-06-10','Male','Married'),('C00004','Aaron Sharma','9438743513','1993-05-31','Male','Single'),('C00005','Liza Patra','9876543210','2001-10-30','Female','Single'),('C00006','Asit Rout','0987654321','1996-11-30','Male','Single');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliverydet`
--

DROP TABLE IF EXISTS `deliverydet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliverydet` (
  `deid` int NOT NULL AUTO_INCREMENT,
  `orderid` int NOT NULL,
  `cid` varchar(10) DEFAULT NULL,
  `eid` varchar(10) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `dlvdate` date DEFAULT NULL,
  PRIMARY KEY (`deid`)
) ENGINE=InnoDB AUTO_INCREMENT=15002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliverydet`
--

LOCK TABLES `deliverydet` WRITE;
/*!40000 ALTER TABLE `deliverydet` DISABLE KEYS */;
INSERT INTO `deliverydet` VALUES (15000,5020,'C00003','E00003','DELIVERED','2026-05-12'),(15001,5021,'C00006','E00010','DELIVERED','2026-05-12');
/*!40000 ALTER TABLE `deliverydet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `eid` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'employee id',
  `name` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fname` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'father name',
  `dob` date NOT NULL,
  `doj` date NOT NULL COMMENT 'date of joining',
  `gender` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `mstatus` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'marital status',
  `phone` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `mail` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cadd` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'current address',
  `padd` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'permanent address',
  `qual` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('E00001','Snehasnigdha Rout','R Rout','2002-05-16','2026-02-10','Female','Single','9911223345','sneha@gmail.com','CTC','BALASORE','BTech'),('E00003','Pritichhanda Barika','Anam Barika','1996-02-05','2026-02-13','Female','Single','8658885351','priti@gmail.com','BBSR','Baleswar','+2 Arts'),('E00004','Jyotirmayee Pradhan','B Pradhan','2004-06-30','2026-02-14','Male','Married','8658885251','jyoti@gmail.com','Puri','Puri','BTech'),('E00002','Rojalin Pradhan','Sangram Pradhan','1999-03-10','2026-02-13','Female','Single','8658885251','roja@gmail.com','Talcher','Baleswar','BTech'),('E00006','Manoj  Maher','Manas  Maher','1996-06-06','2026-02-16','Male','Single','7749600265','samir@gmail.com','BBSR','Anugul','Hotel Mgmt'),('E00007','Suraja Jena','Siba Jena','1996-03-01','2026-02-17','Male','Married','9776065919','suraja@gmail.com','BBSR','BBSR','Bcom'),('E00005','Samir Pattnaik','sani Pattnaik','1996-03-06','2026-02-15','Male','Married','9777065919','samir@gmail.com','BBSR','BBSR','MCA'),('E00008','Rina Patra','R Patra','1983-12-31','2026-02-18','Male','Married','7712345676','rina@gmail.com','BBSR','BBSR','MBA'),('E00009','Hari Das','S das','1996-02-06','2026-02-19','Male','Single','8765423456','hari@gmail.com','BBSR','Puri','+2'),('E00010','Manas Rout','K M Rout','2003-05-27','2026-02-19','Male','Single','9438743513','manas@gmail.com','BBSR','PURI','B. A.'),('E00012','Benita Misha','J Mishra','1911-11-11','2026-02-20','female','single','9988776655','banita@gmail.com','CTC','JAJPUR','BTech'),('E00013','Rakesh Sahoo','M K Sahoo','2004-04-12','2026-04-15','Male','Single','9123456780','rakesh@gmail.com','BBSR','PURI','BTech'),('E00014','Bulbul Majhi','John Majhi','2002-02-20','2026-04-30','Female','Married','1234567890','bulu@gmail.com','CTC','BALASORE','BTech');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feid` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `mail` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `subj` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `mesg` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dof` date NOT NULL COMMENT 'feedback given date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES ('F00001','Gourab Pattnaik','gourab@gmail.com','Delivery','Delivery was late','2026-04-13');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `cid` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'customer id',
  `logname` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pwd` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `type` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `secques` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'security question',
  `secans` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'security answer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('E00001','sneha','123456','Admin','Y','Who is my favourite actor ?','Amitabh'),('E00002','roja','123456','Employee','Y','Where is my birth place ?','baleswar'),('E00004','jyoti','123456','Employee','Y','Who is my favourite actor ?','Salman khan'),('E00005','samir','123456','Employee','Y','Who is my favourite actor ?','Govinda'),('E00006','manoj','123456','Employee','Y','Who is my favourite actor ?','Rajin kanta'),('E00003','Priti','123456','Employee','Y','Who is my favourite actor ?','Alu arjun'),('E00008','rina','123456','Employee','Y','What is my pet name ?','jack'),('E00007','suraja','123456','Employee','Y','Where is my birth place ?','Puri'),('C00001','rahul@gmail.com','123456','Customer','Y','Who is your ideal person ?','Abdul kalam'),('C00002','dibesh@gmail.com','123456','Customer','Y','What is my fist school name ?','P.N High School'),('C00003','umesh@gmail.com','123456','Customer','Y','Who is my best friend ?','Manash'),('E00009','hari','123456','Employee','N','What is my pet name ?','jack'),('C00004','aaron@gmail.com','123456','Customer','Y','What is my pet name ?',''),('E00010','Manas','123456','Employee','Y','Who is my best friend ?','Tukuna'),('E00012','Banita','123456','Employee','Y','Where is my birth place ?','birth place'),('E00013','Rakesh','r123456','Employee','Y','Who is my favourite actor ?','Amitabh'),('E00014','Bulbul','med123','Employee','Y','Who is my favourite actor ?','vijay'),('C00005','liza@gmail.com','L@123456','Customer','Y','Where is my birth place ?','Chakradharpur'),('C00006','asit@gmail.com','a@123456','Customer','Y','What is my best friend ?','bulbul');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicines`
--

DROP TABLE IF EXISTS `medicines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicines` (
  `medicineid` int NOT NULL AUTO_INCREMENT,
  `medicinename` varchar(150) NOT NULL,
  `companyname` varchar(100) DEFAULT NULL,
  `medType` varchar(20) DEFAULT 'pill',
  `category` varchar(100) DEFAULT NULL,
  `description` text,
  `packSize` int DEFAULT '10',
  `pricePerPack` decimal(10,2) NOT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `expirydate` date DEFAULT NULL,
  PRIMARY KEY (`medicineid`)
) ENGINE=InnoDB AUTO_INCREMENT=3021 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicines`
--

LOCK TABLES `medicines` WRITE;
/*!40000 ALTER TABLE `medicines` DISABLE KEYS */;
INSERT INTO `medicines` VALUES (3000,'Paracetamol 500mg','Cipla','pill','Fever & Pain','Used to treat fever and mild body pain',10,40.00,2970,'2027-05-10'),(3001,'Amoxicillin 250mg','Sun Pharma','pill','Antibiotic','Used to treat bacterial infections',10,120.00,2970,'2026-12-15'),(3002,'Cetirizine 10mg','Dr. Reddy','pill','Allergy','Relieves allergy symptoms',10,45.00,2990,'2027-03-20'),(3003,'Ibuprofen 400mg','Abbott','pill','Pain Relief','Reduces inflammation and pain',10,60.00,1990,'2026-11-25'),(3004,'Azithromycin 500mg','Lupin','pill','Antibiotic','Treats respiratory infections',10,180.00,3000,'2026-10-30'),(3005,'Metformin 500mg','Glenmark','pill','Diabetes','Controls blood sugar levels',10,75.00,2500,'2027-08-12'),(3006,'Omeprazole 20mg','Ranbaxy','pill','Acidity','Reduces stomach acid',10,90.00,3000,'2027-06-18'),(3007,'Dolo 650','Micro Labs','pill','Fever & Pain','Used for fever and body pain',10,35.00,3000,'2027-09-05'),(3008,'Vitamin C Tablets','Himalaya','pill','Supplement','Boosts immunity',10,150.00,2480,'2028-01-01'),(3009,'Insulin Injection','Novo Nordisk','injection','Diabetes','Used for diabetes management',1,500.00,1500,'2026-07-22'),(3010,'Pantoprazole 40mg','Sun Pharma','pill','Acidity','Used to treat acid reflux and stomach ulcers',10,110.00,3980,'2027-12-01'),(3011,'Electral Powder','FDC Limited','powder','Rehydration','Used to prevent dehydration and restore electrolytes',1,20.00,3000,'2027-06-15'),(3012,'Electrolyte Drink 200ml','Biocruz','syrup','Dehydration','ORS Dehydration Solution',1,46.00,2000,'2028-12-31'),(3013,'Stopache','Pharas Pharm','pill','Headache','Ensures faster headache relief ',10,39.99,3000,'2028-11-16'),(3014,'Coldarin','Johnson & Johnson','pill','Cold','Common cold symptoms',10,38.00,2000,'2028-05-30'),(3015,'Vitamin D3','Origin Health Care','syrup','Supplementary ','Increases Bone Health',4,299.00,2000,'2028-02-18'),(3020,'Combiflam','Sanofi India Ltd','pill','Body Ache','Used for pain & fever',20,57.00,3000,'2028-10-18');
/*!40000 ALTER TABLE `medicines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitems` (
  `orderitemid` int NOT NULL AUTO_INCREMENT,
  `orderid` int NOT NULL,
  `medicineid` int NOT NULL,
  `quantity` int NOT NULL,
  `unitprice` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`orderitemid`),
  KEY `orderid` (`orderid`),
  KEY `medicineid` (`medicineid`),
  CONSTRAINT `orderitems_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`) ON DELETE CASCADE,
  CONSTRAINT `orderitems_ibfk_2` FOREIGN KEY (`medicineid`) REFERENCES `medicines` (`medicineid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6056 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitems`
--

LOCK TABLES `orderitems` WRITE;
/*!40000 ALTER TABLE `orderitems` DISABLE KEYS */;
INSERT INTO `orderitems` VALUES (6048,5020,3000,10,40.00,46.80),(6049,5020,3001,10,120.00,140.40),(6050,5020,3010,10,110.00,128.70),(6051,5020,3008,10,150.00,175.50),(6052,5021,3000,10,40.00,46.80),(6053,5021,3001,10,120.00,140.40),(6054,5021,3002,10,45.00,52.65),(6055,5021,3003,10,60.00,70.20);
/*!40000 ALTER TABLE `orderitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderid` int NOT NULL AUTO_INCREMENT,
  `cid` varchar(20) DEFAULT NULL,
  `orderdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(15) DEFAULT NULL,
  `totalamount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `deliveryaddress` text NOT NULL,
  `paymentstatus` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=5022 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (5020,'C00003','2026-05-12 10:27:36','DELIVERED',420.00,'plot no-26,crp,bbsr','PAID'),(5021,'C00006','2026-05-12 11:35:43','DELIVERED',265.00,'plot- 15, Sahid Nagar , BBSR ','PAID');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `pid` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'order id',
  `cid` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'customer id',
  `saleid` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ptype` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'payment type',
  `bname` varchar(30) DEFAULT NULL,
  `pdate` date NOT NULL COMMENT 'payment date',
  `cardno` varchar(25) DEFAULT NULL,
  `acno` varchar(25) DEFAULT NULL,
  `amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('P00001','C00003','5020','Credit Card','SBI','2026-05-12','1234567890123456','987654321012',420),('P00002','C00006','5021','Debit Card','ICICI','2026-05-12','123456789012345','56778904325',265);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photo` (
  `phid` int NOT NULL AUTO_INCREMENT,
  `medicineid` int DEFAULT NULL,
  `image` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`phid`)
) ENGINE=InnoDB AUTO_INCREMENT=518 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` VALUES (500,3000,'3000.jpg'),(501,3001,'3001.jpg'),(502,3002,'3002.jpg'),(503,3003,'3003.jpg'),(504,3004,'3004.jpg'),(505,3005,'3005.jpg'),(506,3006,'3006.jpg'),(507,3007,'3007.jpg'),(508,3008,'3008.jpg'),(509,3009,'3009.jpg'),(510,3010,'3010.jpg'),(511,3011,'3011.jpg'),(512,3012,'3012.jpg'),(513,3013,'3013.jpg'),(514,3014,'3014.jpg'),(515,3015,'3015.jpg'),(517,3020,'3020.jpg');
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-12 17:12:17
