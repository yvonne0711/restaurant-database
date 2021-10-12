-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: restaurant
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `booking_id` int NOT NULL,
  `booking_cust_id` int NOT NULL,
  `booking_date` date NOT NULL,
  `booking_table` int NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `fk_booking_customer_idx` (`booking_cust_id`),
  CONSTRAINT `fk_booking_customer` FOREIGN KEY (`booking_cust_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,12,'2021-09-07',1),(2,18,'2021-09-05',2),(3,19,'2021-09-04',3),(4,3,'2021-09-10',4),(5,13,'2021-09-15',5);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` int NOT NULL,
  `email_address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Martin Hobbs',1482649133,'barjam@live.com'),(2,'Allan Shea',2084419502,'syrinx@me.com'),(3,'Garfield Soto',1271444124,'sjava@aol.com'),(4,'Eshan Schwartz',1772750000,'smcnabb@me.com'),(5,'Rhiannon Chandler',1190521247,'aaribaud@mac.com'),(6,'Kalem Matthews',1306740158,'thaljef@yahoo.com'),(7,'Alister Schneider',1206735065,'erynf@me.com'),(8,'Shanice Beil',1594841333,'adamk@yahoo.com'),(9,'Mahamed Pierce',1827818216,'dgriffith@msn.com'),(10,'Jamie-Lee Bryant',1513292353,'adamk@gmail.com'),(11,'Janelle Wall',1463783417,'dkrishna@aol.com'),(12,'Emil Kenny',1582705044,'jusdisgi@comcast.net'),(13,'Mohamad Meyer',1324473707,'ngedmond@me.com'),(14,'Brenden Goff',1512631112,'mobileip@me.com'),(15,'Nina Cook',2077208630,'scitext@hotmail.com'),(16,'Salma Dickinson',2087959400,'isorashi@optonline.net'),(17,'Loui Montes',1591140738,'arachne@me.com'),(18,'Hadley Mcdonald',1608683022,'bahwi@aol.com'),(19,'Tasnim Melton',1214657850,'dalamb@comcast.net'),(20,'Zackary Herman',1752269632,'ylchang@msn.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customerorderdate`
--

DROP TABLE IF EXISTS `customerorderdate`;
/*!50001 DROP VIEW IF EXISTS `customerorderdate`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customerorderdate` AS SELECT 
 1 AS `name`,
 1 AS `orders_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `customerreserved`
--

DROP TABLE IF EXISTS `customerreserved`;
/*!50001 DROP VIEW IF EXISTS `customerreserved`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customerreserved` AS SELECT 
 1 AS `date`,
 1 AS `booking_table`,
 1 AS `name`,
 1 AS `phone_number`,
 1 AS `email_address`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `food_id` int NOT NULL,
  `food_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Roasted Stuffed Mushrooms','starter',5.00),(2,'Smoked Salmon','starter',7.00),(3,'Chicken Salad','starter',4.00),(4,'Fish Cake with Salad','starter',5.00),(5,'Beef Steak','main',12.00),(6,'Cod Fillet with Salad','main',10.00),(7,'Lamb Shank','main',15.00),(8,'Roast Duck with Casserole','main',11.00),(9,'Key Lime Pie','dessert',5.00),(10,'Strawberry Sundae','dessert',6.00),(11,'Chocolate Lava Cake','dessert',8.00),(12,'Passion Fruit Tart','dessert',7.00);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orders_id` int NOT NULL,
  `orders_cust_id` int NOT NULL,
  `food_order_id` int NOT NULL,
  `orders_staff_id` int DEFAULT NULL,
  `orders_date` date NOT NULL,
  PRIMARY KEY (`orders_id`),
  KEY `fk_food_order_id_idx` (`food_order_id`),
  KEY `fk_order_id_idx` (`orders_cust_id`),
  KEY `fk_staff_order_id_idx` (`orders_staff_id`),
  CONSTRAINT `fk_cust_order_id` FOREIGN KEY (`orders_cust_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `fk_food_order_id` FOREIGN KEY (`food_order_id`) REFERENCES `menu` (`food_id`),
  CONSTRAINT `fk_staff_order_id` FOREIGN KEY (`orders_staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,18,2,7,'2021-09-05'),(2,13,12,5,'2021-09-13'),(3,2,2,3,'2021-09-05'),(4,14,10,3,'2021-09-15'),(5,7,6,4,'2021-09-05'),(6,15,11,9,'2021-09-15'),(7,9,9,3,'2021-09-09'),(8,1,5,7,'2021-09-05'),(9,10,4,6,'2021-09-10'),(10,19,3,5,'2021-09-14'),(11,16,10,6,'2021-09-01'),(12,8,10,10,'2021-09-09'),(13,20,4,8,'2021-09-10'),(14,3,6,10,'2021-09-07'),(15,11,12,5,'2021-09-08'),(16,5,10,7,'2021-09-01'),(17,6,12,4,'2021-09-12'),(18,12,2,4,'2021-09-12'),(19,17,5,3,'2021-09-12'),(20,4,4,7,'2021-09-09');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int NOT NULL,
  `staff_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `staff_hours` int DEFAULT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Emeli Mccall',14),(2,'Usama Shaw',15),(3,'Elisa Spears',12),(4,'Reanna Colon',9),(5,'Faisal Villegas',10),(6,'Glenda Cummings',9),(7,'Yasmin Alexander',16),(8,'Aqsa Craft',12),(9,'Winnie Lowry',11),(10,'Kasey May',12);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `staffshift`
--

DROP TABLE IF EXISTS `staffshift`;
/*!50001 DROP VIEW IF EXISTS `staffshift`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `staffshift` AS SELECT 
 1 AS `orders_date`,
 1 AS `staff_name`,
 1 AS `staff_hours`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `customerorderdate`
--

/*!50001 DROP VIEW IF EXISTS `customerorderdate`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customerorderdate` AS select `c`.`name` AS `name`,`o`.`orders_date` AS `orders_date` from (`customer` `c` left join `orders` `o` on((`c`.`customer_id` = `o`.`orders_cust_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customerreserved`
--

/*!50001 DROP VIEW IF EXISTS `customerreserved`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customerreserved` AS select `b`.`booking_date` AS `date`,`b`.`booking_table` AS `booking_table`,`c`.`name` AS `name`,`c`.`phone_number` AS `phone_number`,`c`.`email_address` AS `email_address` from (`customer` `c` join `bookings` `b` on((`c`.`customer_id` = `b`.`booking_cust_id`))) order by `b`.`booking_date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `staffshift`
--

/*!50001 DROP VIEW IF EXISTS `staffshift`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `staffshift` AS select `o`.`orders_date` AS `orders_date`,`s`.`staff_name` AS `staff_name`,`s`.`staff_hours` AS `staff_hours` from (`staff` `s` left join `orders` `o` on((`o`.`orders_staff_id` = `s`.`staff_id`))) group by `s`.`staff_hours`,`s`.`staff_name` order by `o`.`orders_date` */;
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

-- Dump completed on 2021-09-19 13:09:29
