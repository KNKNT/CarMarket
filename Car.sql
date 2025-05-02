-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: car
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
-- Table structure for table `arrival`
--

DROP TABLE IF EXISTS `arrival`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arrival` (
  `arrival_id` int NOT NULL AUTO_INCREMENT,
  `car_id` int NOT NULL,
  `driver_id` int NOT NULL,
  `arrival_date` date NOT NULL,
  PRIMARY KEY (`arrival_id`),
  KEY `car_id` (`car_id`),
  KEY `driver_id` (`driver_id`),
  CONSTRAINT `arrival_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`),
  CONSTRAINT `arrival_ibfk_2` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arrival`
--

LOCK TABLES `arrival` WRITE;
/*!40000 ALTER TABLE `arrival` DISABLE KEYS */;
INSERT INTO `arrival` VALUES (1,1,1,'2023-01-10'),(2,2,2,'2023-01-15'),(3,3,3,'2023-02-05'),(4,4,1,'2023-02-20'),(5,5,2,'2023-03-01'),(6,6,3,'2023-03-15'),(7,7,1,'2023-04-01'),(8,8,2,'2023-04-10'),(9,9,3,'2023-05-05'),(10,10,2,'2023-05-20');
/*!40000 ALTER TABLE `arrival` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars` (
  `car_id` int NOT NULL AUTO_INCREMENT,
  `mark_id` int NOT NULL,
  `model` varchar(100) NOT NULL,
  `year` int DEFAULT NULL,
  `fuel_type` varchar(20) DEFAULT NULL,
  `transmission_type` varchar(30) DEFAULT NULL,
  `engine` varchar(30) DEFAULT NULL,
  `power` varchar(45) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`car_id`),
  KEY `mark_id` (`mark_id`),
  CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`mark_id`) REFERENCES `mark` (`Mark_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (1,1,'Camry',2020,'Бензин','Автомат','2.5 л','249 л.с.',2500000,'https://images.summitmedia-digital.com/topgear/images/2018/12/18/2019-toyota-camry-main-1545122899.jpg'),(2,1,'RAV4',2021,'Бензин','Автомат','2.0 л','150 л.с.',2200000,'https://i.pinimg.com/originals/af/c6/b5/afc6b51df622e8846bed422b10f242f3.png'),(3,2,'X5',2022,'Дизель','Автомат','3.0 л','249 л.с.',5500000,'https://golf-tuning.ru/static/catalog/image/4139-x3-g01.jpg'),(4,3,'E-Class',2021,'Бензин','Автомат','2.0 л','197 л.с.',4800000,'https://mozpk.ru/images/1/image%20(35).png'),(5,4,'A6',2020,'Бензин','Автомат','2.0 л','190 л.с.',3500000,'https://www.dsrv.ru/upload/iblock/294/ui7lq7pekbudo57t8m7atkccpqbp6t59.png'),(6,5,'Focus',2019,'Бензин','Механика','1.6 л','125 л.с.',1200000,'https://i.pinimg.com/originals/79/56/9c/79569cfab1cfa82fdecab6164a22371b.png'),(7,6,'Tiguan',2021,'Бензин','Автомат','1.4 л','150 л.с.',2100000,'https://avatars.mds.yandex.net/get-autoru-vos/2161408/aa8f0fe1b70ed7bcb64e8fe0cb3da0a2/1200x900'),(8,7,'Solaris',2020,'Бензин','Автомат','1.6 л','123 л.с.',1100000,'https://avatars.mds.yandex.net/get-autoru-vos/1867911/72d707f7e74c73f98868a7209d46a563/1200x900'),(9,8,'Rio',2022,'Бензин','Автомат','1.6 л','123 л.с.',1300000,'https://s.auto.drom.ru/photo/v2/x7Gj2vN1yGfF2s8otNNVYbEO3g7Em2nUpOH1mQ-v_1b-V5nNLThKfHv6LvOMfZkQWumhu43d_bXUgb5BFvz2aNrL9UnkDZbsg4U/default.jpg'),(10,10,'Vesta',2021,'Бензин','Механика','1.6 л','106 л.с.',900000,'https://teyes-krasnoyarsk.ru/upload/iblock/3c3/emcnjfc6npot8ke4xb6erckrfcrvlzgh.jpg'),(11,4,'A8',2016,'Бензин','Автомат','2.5 л','249 л.с.',3500000,'https://avatars.mds.yandex.net/i?id=3c7dd16e0c90b79c68914563ed6d262cb3f659cb-9128286-images-thumbs&n=13'),(12,4,'A5',2019,'Бензин','Автомат','2.1 л','180 л.с.',2100000,'https://avatars.mds.yandex.net/i?id=3c7dd16e0c90b79c68914563ed6d262cb3f659cb-9128286-images-thumbs&n=13'),(13,2,'АУЕ',2007,'Электричество','Робот','да','1400 л.с.',19999999,'https://i.ytimg.com/vi/g8TQYteptYo/maxresdefault.jpg'),(14,4,'A 999',2025,'Электричество','Автомат','2.5 л.','199 л.с.',12000000,'https://avatars.mds.yandex.net/i?id=0f16be2457c5a62462d1e18d7dbf913f42a14eb9-5334229-images-thumbs&n=13');
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deal`
--

DROP TABLE IF EXISTS `deal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deal` (
  `deal_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `arrival_id` int NOT NULL,
  `price` int NOT NULL,
  `date_end` date NOT NULL,
  PRIMARY KEY (`deal_id`),
  KEY `user_id_idx` (`user_id`),
  KEY `arrival_id_idx` (`arrival_id`),
  CONSTRAINT `arrival_id` FOREIGN KEY (`arrival_id`) REFERENCES `arrival` (`arrival_id`),
  CONSTRAINT `Ussr_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deal`
--

LOCK TABLES `deal` WRITE;
/*!40000 ALTER TABLE `deal` DISABLE KEYS */;
INSERT INTO `deal` VALUES (1,1,1,2700000,'2023-02-15'),(2,2,2,2400000,'2023-02-20'),(3,1,3,6000000,'2023-03-10'),(4,2,4,5200000,'2023-03-25'),(5,1,5,3800000,'2023-04-05'),(6,2,6,1300000,'2023-04-20'),(7,1,7,2300000,'2023-05-05'),(8,2,8,1200000,'2023-05-15'),(9,1,9,1400000,'2023-06-10'),(10,2,10,950000,'2023-06-25'),(11,1,1,1,'2025-04-23'),(12,14,5,3500000,'2025-04-23'),(16,17,10,900000,'2025-04-24');
/*!40000 ALTER TABLE `deal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drivers` (
  `driver_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  PRIMARY KEY (`driver_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
INSERT INTO `drivers` VALUES (1,3,'2020-01-15'),(2,4,'2020-03-20'),(3,10,'2021-05-20');
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mark`
--

DROP TABLE IF EXISTS `mark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mark` (
  `Mark_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `country` varchar(50) DEFAULT NULL,
  `year` int DEFAULT NULL,
  PRIMARY KEY (`Mark_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mark`
--

LOCK TABLES `mark` WRITE;
/*!40000 ALTER TABLE `mark` DISABLE KEYS */;
INSERT INTO `mark` VALUES (1,'Toyota','Япония',1937),(2,'BMW','Германия',1916),(3,'Mercedes-Benz','Германия',1926),(4,'Audi','Германия',1909),(5,'Ford','США',1903),(6,'Volkswagen','Германия',1937),(7,'Hyundai','Южная Корея',1967),(8,'Kia','Южная Корея',1944),(9,'Renault','Франция',1899),(10,'Lada','Россия',1966),(11,'ВАЗ','Россия',1954),(12,'Chevrolet','ОМЕРИКА',1886);
/*!40000 ALTER TABLE `mark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `showcars`
--

DROP TABLE IF EXISTS `showcars`;
/*!50001 DROP VIEW IF EXISTS `showcars`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `showcars` AS SELECT 
 1 AS `car_id`,
 1 AS `name`,
 1 AS `model`,
 1 AS `year`,
 1 AS `fuel_type`,
 1 AS `transmission_type`,
 1 AS `engine`,
 1 AS `power`,
 1 AS `price`,
 1 AS `image`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `showcarsnew`
--

DROP TABLE IF EXISTS `showcarsnew`;
/*!50001 DROP VIEW IF EXISTS `showcarsnew`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `showcarsnew` AS SELECT 
 1 AS `car_id`,
 1 AS `name`,
 1 AS `model`,
 1 AS `year`,
 1 AS `fuel_type`,
 1 AS `transmission_type`,
 1 AS `engine`,
 1 AS `power`,
 1 AS `price`,
 1 AS `image`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `showdeals`
--

DROP TABLE IF EXISTS `showdeals`;
/*!50001 DROP VIEW IF EXISTS `showdeals`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `showdeals` AS SELECT 
 1 AS `deal_id`,
 1 AS `user_id`,
 1 AS `fio`,
 1 AS `car`,
 1 AS `price`,
 1 AS `date_end`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `showdrivers`
--

DROP TABLE IF EXISTS `showdrivers`;
/*!50001 DROP VIEW IF EXISTS `showdrivers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `showdrivers` AS SELECT 
 1 AS `driver_id`,
 1 AS `user_id`,
 1 AS `first_name`,
 1 AS `mid_name`,
 1 AS `last_name`,
 1 AS `phone`,
 1 AS `hire_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `mid_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `pass` varchar(45) DEFAULT NULL,
  `rules` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Иван','Иванович','Иванов','+79161234567','ivanov','qwerty123','Водитель'),(2,'Петр','Петрович','Петров','+79162345678','petrov','asdfgh456','Водитель'),(3,'Сергей','Сергеевич','Сергеев','+79163456789','sergeev','zxcvbn789','Водитель'),(4,'Анна','Андреевна','Сидорова','+79164567890','sidorova','password1','Пользователь'),(5,'Мария','Владимировна','Кузнецова','+79165678901','kuznetsova','pass1234','Пользователь'),(6,'Алексей','Дмитриевич','Смирнов','+79166789012','smirnov','alex123','Пользователь'),(7,'Дмитрий','Алексеевич','Попов','+79167890123','popov','dima456','Пользователь'),(8,'Ольга','Сергеевна','Васильева','+79168901234','vasilieva','olga789','Пользователь'),(9,'Елена','Николаевна','Павлова','+79169012345','pavlova','elena123','Пользователь'),(10,'Николай','Викторович','Семенов','+79160123456','semenov','kolya456','Пользователь'),(12,'1',NULL,'1','1','Уже зарегистрировались? Войти','1','Пользователь'),(13,'2',NULL,'2','2','2','2','Пользователь'),(14,'Никита','Андреевич','Кизилов','+79780000001','1','qwe','Администратор'),(16,'Валерий',NULL,'Карпов','+79780666777','test','test','Пользователь'),(17,'Дмитрий','Степанович','Леонтьев','+79780111222','user','user','Пользователь');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'car'
--

--
-- Dumping routines for database 'car'
--
/*!50003 DROP PROCEDURE IF EXISTS `insert_showcars` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_showcars`(
    IN p_name VARCHAR(100),
    IN p_model VARCHAR(100),
    IN p_year INT,
    IN p_fuel_type VARCHAR(30),
    IN p_transmission_type VARCHAR(30),
    IN p_engine VARCHAR(30),
    IN p_power VARCHAR(45),
    IN p_price INT,
    IN p_image VARCHAR(255)
)
BEGIN
    DECLARE v_mark_id INT;
    
    -- Проверяем существование марки
    SELECT Mark_id INTO v_mark_id FROM `car`.`mark` WHERE `name` = p_name LIMIT 1;
    
    -- Если марки нет, создаем ее
    IF v_mark_id IS NULL THEN
        INSERT INTO `car`.`mark` (`name`) VALUES (p_name);
        SET v_mark_id = LAST_INSERT_ID();
    END IF;
    
    -- Вставляем данные в cars
    INSERT INTO `car`.`cars` (
        `mark_id`, `model`, `year`, `fuel_type`, 
        `transmission_type`, `engine`, `power`, `price`, `image`
    ) VALUES (
        v_mark_id, p_model, p_year, p_fuel_type, 
        p_transmission_type, p_engine, p_power, p_price, p_image
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_showcars` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_showcars`(
    IN p_car_id INT,
    IN p_name VARCHAR(100),
    IN p_model VARCHAR(100),
    IN p_year INT,
    IN p_fuel_type VARCHAR(20),
    IN p_transmission_type VARCHAR(30),
    IN p_engine VARCHAR(30),
    IN p_power VARCHAR(45),
    IN p_price INT,
    IN p_image VARCHAR(255)
)
BEGIN
    DECLARE v_mark_id INT;
    DECLARE v_current_mark_id INT;
    
    -- Получаем текущий mark_id
    SELECT mark_id INTO v_current_mark_id FROM `car`.`cars` WHERE car_id = p_car_id;
    
    -- Проверяем существование новой марки
    SELECT Mark_id INTO v_mark_id FROM `car`.`mark` WHERE `name` = p_name LIMIT 1;
    
    -- Если марки нет, создаем ее
    IF v_mark_id IS NULL THEN
        INSERT INTO `car`.`mark` (`name`) VALUES (p_name);
        SET v_mark_id = LAST_INSERT_ID();
    END IF;
    
    -- Обновляем данные автомобиля
    UPDATE `car`.`cars` SET
        `mark_id` = v_mark_id,
        `model` = p_model,
        `year` = p_year,
        `fuel_type` = p_fuel_type,
        `transmission_type` = p_transmission_type,
        `engine` = p_engine,
        `power` = p_power,
        `price` = p_price,
        `image` = p_image
    WHERE `car_id` = p_car_id;
    
    -- Можно добавить удаление старой марки, если она больше не используется
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `showcars`
--

/*!50001 DROP VIEW IF EXISTS `showcars`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `showcars` AS select `cars`.`car_id` AS `car_id`,`mark`.`name` AS `name`,`cars`.`model` AS `model`,`cars`.`year` AS `year`,`cars`.`fuel_type` AS `fuel_type`,`cars`.`transmission_type` AS `transmission_type`,`cars`.`engine` AS `engine`,`cars`.`power` AS `power`,`cars`.`price` AS `price`,`cars`.`image` AS `image` from (`cars` join `mark` on((`cars`.`car_id` = `mark`.`Mark_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `showcarsnew`
--

/*!50001 DROP VIEW IF EXISTS `showcarsnew`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `showcarsnew` AS select `c`.`car_id` AS `car_id`,`m`.`name` AS `name`,`c`.`model` AS `model`,`c`.`year` AS `year`,`c`.`fuel_type` AS `fuel_type`,`c`.`transmission_type` AS `transmission_type`,`c`.`engine` AS `engine`,`c`.`power` AS `power`,`c`.`price` AS `price`,`c`.`image` AS `image` from (`cars` `c` join `mark` `m` on((`c`.`mark_id` = `m`.`Mark_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `showdeals`
--

/*!50001 DROP VIEW IF EXISTS `showdeals`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `showdeals` AS select `d`.`deal_id` AS `deal_id`,`d`.`user_id` AS `user_id`,concat(`u`.`last_name`,' ',`u`.`first_name`,' ',`u`.`mid_name`) AS `fio`,concat(`m`.`name`,' ',`c`.`model`) AS `car`,`d`.`price` AS `price`,`d`.`date_end` AS `date_end` from ((((`deal` `d` left join `arrival` `a` on((`d`.`arrival_id` = `a`.`arrival_id`))) left join `cars` `c` on((`a`.`car_id` = `c`.`car_id`))) left join `mark` `m` on((`c`.`mark_id` = `m`.`Mark_id`))) left join `users` `u` on((`d`.`user_id` = `u`.`user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `showdrivers`
--

/*!50001 DROP VIEW IF EXISTS `showdrivers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `showdrivers` AS select `drivers`.`driver_id` AS `driver_id`,`users`.`user_id` AS `user_id`,`users`.`first_name` AS `first_name`,`users`.`mid_name` AS `mid_name`,`users`.`last_name` AS `last_name`,`users`.`phone` AS `phone`,`drivers`.`hire_date` AS `hire_date` from (`drivers` join `users` on((`drivers`.`driver_id` = `users`.`user_id`))) */;
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

-- Dump completed on 2025-05-02 14:00:19
