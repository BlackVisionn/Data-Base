-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: human_resources_department
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
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract` (
  `idcontract` int NOT NULL AUTO_INCREMENT,
  `employment_contract_number` int NOT NULL,
  `date_of_receipt` date NOT NULL,
  `rate` int NOT NULL,
  `grounds_for_admission` varchar(45) NOT NULL,
  `idemployee` int NOT NULL,
  `iddepartment` int NOT NULL,
  `idposition_to_organization` int NOT NULL,
  PRIMARY KEY (`idcontract`),
  KEY `fk_contract_employee_idx` (`idemployee`),
  KEY `fk_contract_department_idx` (`iddepartment`),
  KEY `fk_contract_position_to_organization_idx` (`idposition_to_organization`),
  CONSTRAINT `fk_contract_department` FOREIGN KEY (`iddepartment`) REFERENCES `department` (`iddepartment`),
  CONSTRAINT `fk_contract_employee` FOREIGN KEY (`idemployee`) REFERENCES `employees` (`idemployees`),
  CONSTRAINT `fk_contract_position_to_organization` FOREIGN KEY (`idposition_to_organization`) REFERENCES `position_to_organization` (`idposition_to_organization`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract`
--

LOCK TABLES `contract` WRITE;
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `iddepartment` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(45) NOT NULL,
  `department_phone_number` varchar(45) NOT NULL,
  `idorganization` int NOT NULL,
  PRIMARY KEY (`iddepartment`),
  KEY `fk_department_organiztion_idx` (`idorganization`),
  CONSTRAINT `fk_department_organiztion` FOREIGN KEY (`idorganization`) REFERENCES `organization` (`idorganization`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diploma_of_education`
--

DROP TABLE IF EXISTS `diploma_of_education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diploma_of_education` (
  `iddiploma_of_education` int NOT NULL AUTO_INCREMENT,
  `education` varchar(45) NOT NULL,
  `speciality` varchar(45) NOT NULL,
  `series_and_number` varchar(45) NOT NULL,
  `qualification` varchar(45) NOT NULL,
  `registration_number` int NOT NULL,
  `date_of_issue` date NOT NULL,
  `idemployees` int NOT NULL,
  PRIMARY KEY (`iddiploma_of_education`),
  KEY `fk_diploma_of_education_employee_idx` (`idemployees`),
  CONSTRAINT `fk_diploma_of_education_employee` FOREIGN KEY (`idemployees`) REFERENCES `employees` (`idemployees`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diploma_of_education`
--

LOCK TABLES `diploma_of_education` WRITE;
/*!40000 ALTER TABLE `diploma_of_education` DISABLE KEYS */;
/*!40000 ALTER TABLE `diploma_of_education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dismissal`
--

DROP TABLE IF EXISTS `dismissal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dismissal` (
  `iddismissal` int NOT NULL AUTO_INCREMENT,
  `reason_for_dismissal` varchar(100) NOT NULL,
  `date_of_dismissal` date NOT NULL,
  `article` varchar(100) NOT NULL,
  PRIMARY KEY (`iddismissal`),
  CONSTRAINT `fk_dismissal_contract` FOREIGN KEY (`iddismissal`) REFERENCES `contract` (`idcontract`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dismissal`
--

LOCK TABLES `dismissal` WRITE;
/*!40000 ALTER TABLE `dismissal` DISABLE KEYS */;
/*!40000 ALTER TABLE `dismissal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `idemployees` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `work_experience` varchar(45) NOT NULL,
  `home_address` varchar(100) NOT NULL,
  `phone_number` varchar(12) NOT NULL,
  `personnel_number` int NOT NULL,
  PRIMARY KEY (`idemployees`),
  CONSTRAINT `fk_employees_position_to_organization` FOREIGN KEY (`idemployees`) REFERENCES `position_to_organization` (`idposition_to_organization`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informatio_about_professional_development`
--

DROP TABLE IF EXISTS `informatio_about_professional_development`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `informatio_about_professional_development` (
  `idinformatio_about_professional_development` int NOT NULL AUTO_INCREMENT,
  `date_of_increase` date NOT NULL,
  `type_of_increase` varchar(45) NOT NULL,
  `institution_name` varchar(45) NOT NULL,
  `idemployees` int NOT NULL,
  PRIMARY KEY (`idinformatio_about_professional_development`),
  KEY `fk_information_about_professional_development_employee_idx` (`idemployees`),
  CONSTRAINT `fk_information_about_professional_development_employee` FOREIGN KEY (`idemployees`) REFERENCES `employees` (`idemployees`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informatio_about_professional_development`
--

LOCK TABLES `informatio_about_professional_development` WRITE;
/*!40000 ALTER TABLE `informatio_about_professional_development` DISABLE KEYS */;
/*!40000 ALTER TABLE `informatio_about_professional_development` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organization` (
  `idorganization` int NOT NULL AUTO_INCREMENT,
  `name_of_organization` varchar(100) NOT NULL,
  PRIMARY KEY (`idorganization`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_data`
--

DROP TABLE IF EXISTS `personal_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_data` (
  `idpersonal_data` int NOT NULL AUTO_INCREMENT,
  `birthday` date NOT NULL,
  `series_and_number_of_passport` int NOT NULL,
  `passport_issued_by` varchar(100) NOT NULL,
  `when_the_passport_was_issued` varchar(100) NOT NULL,
  `INN` int NOT NULL,
  `SNILS` int NOT NULL,
  PRIMARY KEY (`idpersonal_data`),
  CONSTRAINT `fk_personal_data_employee` FOREIGN KEY (`idpersonal_data`) REFERENCES `employees` (`idemployees`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_data`
--

LOCK TABLES `personal_data` WRITE;
/*!40000 ALTER TABLE `personal_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `idposition` int NOT NULL AUTO_INCREMENT,
  `job_title` varchar(45) NOT NULL,
  PRIMARY KEY (`idposition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position_to_organization`
--

DROP TABLE IF EXISTS `position_to_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position_to_organization` (
  `idposition_to_organization` int NOT NULL AUTO_INCREMENT,
  `idposition` int NOT NULL,
  `idorganization` int NOT NULL,
  `salary` int NOT NULL,
  PRIMARY KEY (`idposition_to_organization`),
  KEY `fk_position_to_organization_position_idx` (`idposition`),
  KEY `fk_position_to_organization_organization_idx` (`idorganization`),
  CONSTRAINT `fk_position_to_organization_organization` FOREIGN KEY (`idorganization`) REFERENCES `organization` (`idorganization`),
  CONSTRAINT `fk_position_to_organization_position` FOREIGN KEY (`idposition`) REFERENCES `position` (`idposition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position_to_organization`
--

LOCK TABLES `position_to_organization` WRITE;
/*!40000 ALTER TABLE `position_to_organization` DISABLE KEYS */;
/*!40000 ALTER TABLE `position_to_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_benefits`
--

DROP TABLE IF EXISTS `social_benefits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_benefits` (
  `idsocial_benefits` int NOT NULL AUTO_INCREMENT,
  `name_of_benefits` varchar(45) NOT NULL,
  `document_number` int NOT NULL,
  `date_of_issue_of_the_document` date NOT NULL,
  `idemployees` int NOT NULL,
  PRIMARY KEY (`idsocial_benefits`),
  KEY `fk_social_benefits_employee_idx` (`idemployees`),
  CONSTRAINT `fk_social_benefits_employee` FOREIGN KEY (`idemployees`) REFERENCES `employees` (`idemployees`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_benefits`
--

LOCK TABLES `social_benefits` WRITE;
/*!40000 ALTER TABLE `social_benefits` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_benefits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacation`
--

DROP TABLE IF EXISTS `vacation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacation` (
  `idvacation` int NOT NULL AUTO_INCREMENT,
  `type_of_vacation` varchar(100) NOT NULL,
  `vacation_start_date` date NOT NULL,
  `number_of_vacation_days` int NOT NULL,
  `basis_of_vacation` varchar(100) NOT NULL,
  `idemployees` int NOT NULL,
  PRIMARY KEY (`idvacation`),
  KEY `fk_vacation_employee_idx` (`idemployees`),
  CONSTRAINT `fk_vacation_employee` FOREIGN KEY (`idemployees`) REFERENCES `employees` (`idemployees`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacation`
--

LOCK TABLES `vacation` WRITE;
/*!40000 ALTER TABLE `vacation` DISABLE KEYS */;
/*!40000 ALTER TABLE `vacation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-12 23:25:08
