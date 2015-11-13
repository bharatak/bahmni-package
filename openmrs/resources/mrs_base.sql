-- MySQL dump 10.13  Distrib 5.6.27, for Linux (x86_64)
--
-- Host: localhost    Database: openmrs
-- ------------------------------------------------------
-- Server version	5.6.27

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
-- Table structure for table `active_list`
--

DROP TABLE IF EXISTS `active_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_list` (
  `active_list_id` int(11) NOT NULL AUTO_INCREMENT,
  `active_list_type_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `concept_id` int(11) NOT NULL,
  `start_obs_id` int(11) DEFAULT NULL,
  `stop_obs_id` int(11) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`active_list_id`),
  KEY `user_who_voided_active_list` (`voided_by`),
  KEY `user_who_created_active_list` (`creator`),
  KEY `active_list_type_of_active_list` (`active_list_type_id`),
  KEY `person_of_active_list` (`person_id`),
  KEY `concept_active_list` (`concept_id`),
  KEY `start_obs_active_list` (`start_obs_id`),
  KEY `stop_obs_active_list` (`stop_obs_id`),
  CONSTRAINT `active_list_type_of_active_list` FOREIGN KEY (`active_list_type_id`) REFERENCES `active_list_type` (`active_list_type_id`),
  CONSTRAINT `concept_active_list` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `person_of_active_list` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `start_obs_active_list` FOREIGN KEY (`start_obs_id`) REFERENCES `obs` (`obs_id`),
  CONSTRAINT `stop_obs_active_list` FOREIGN KEY (`stop_obs_id`) REFERENCES `obs` (`obs_id`),
  CONSTRAINT `user_who_created_active_list` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_active_list` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_list`
--

LOCK TABLES `active_list` WRITE;
/*!40000 ALTER TABLE `active_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_list_allergy`
--

DROP TABLE IF EXISTS `active_list_allergy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_list_allergy` (
  `active_list_id` int(11) NOT NULL AUTO_INCREMENT,
  `allergy_type` varchar(50) DEFAULT NULL,
  `reaction_concept_id` int(11) DEFAULT NULL,
  `severity` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`active_list_id`),
  KEY `reaction_allergy` (`reaction_concept_id`),
  CONSTRAINT `reaction_allergy` FOREIGN KEY (`reaction_concept_id`) REFERENCES `concept` (`concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_list_allergy`
--

LOCK TABLES `active_list_allergy` WRITE;
/*!40000 ALTER TABLE `active_list_allergy` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_list_allergy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_list_problem`
--

DROP TABLE IF EXISTS `active_list_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_list_problem` (
  `active_list_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(50) DEFAULT NULL,
  `sort_weight` double DEFAULT NULL,
  PRIMARY KEY (`active_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_list_problem`
--

LOCK TABLES `active_list_problem` WRITE;
/*!40000 ALTER TABLE `active_list_problem` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_list_problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_list_type`
--

DROP TABLE IF EXISTS `active_list_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_list_type` (
  `active_list_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`active_list_type_id`),
  KEY `user_who_retired_active_list_type` (`retired_by`),
  KEY `user_who_created_active_list_type` (`creator`),
  CONSTRAINT `user_who_created_active_list_type` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_active_list_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_list_type`
--

LOCK TABLES `active_list_type` WRITE;
/*!40000 ALTER TABLE `active_list_type` DISABLE KEYS */;
INSERT INTO `active_list_type` VALUES (1,'Allergy','An Allergy the Patient may have',1,'2010-05-28 00:00:00',0,NULL,NULL,NULL,'96f4f603-6a99-11df-a648-37a07f9c90fb'),(2,'Problem','A Problem the Patient may have',1,'2010-05-28 00:00:00',0,NULL,NULL,NULL,'a0c7422b-6a99-11df-a648-37a07f9c90fb');
/*!40000 ALTER TABLE `active_list_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_hierarchy_address_to_entry_map`
--

DROP TABLE IF EXISTS `address_hierarchy_address_to_entry_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_hierarchy_address_to_entry_map` (
  `address_to_entry_map_id` int(11) NOT NULL AUTO_INCREMENT,
  `address_id` int(11) NOT NULL,
  `entry_id` int(11) NOT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`address_to_entry_map_id`),
  KEY `address_id_to_person_address_table` (`address_id`),
  KEY `entry_id_to_address_hierarchy_table` (`entry_id`),
  CONSTRAINT `address_id_to_person_address_table` FOREIGN KEY (`address_id`) REFERENCES `person_address` (`person_address_id`),
  CONSTRAINT `entry_id_to_address_hierarchy_table` FOREIGN KEY (`entry_id`) REFERENCES `address_hierarchy_entry` (`address_hierarchy_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_hierarchy_address_to_entry_map`
--

LOCK TABLES `address_hierarchy_address_to_entry_map` WRITE;
/*!40000 ALTER TABLE `address_hierarchy_address_to_entry_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_hierarchy_address_to_entry_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_hierarchy_entry`
--

DROP TABLE IF EXISTS `address_hierarchy_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_hierarchy_entry` (
  `address_hierarchy_entry_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(160) DEFAULT NULL,
  `level_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `user_generated_id` varchar(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `elevation` double DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`address_hierarchy_entry_id`),
  KEY `parent_name` (`parent_id`,`name`(20)),
  KEY `level_name` (`level_id`,`name`(20)),
  KEY `address_hierarchy_entry_name_idx` (`name`(10)),
  CONSTRAINT `level_to_level` FOREIGN KEY (`level_id`) REFERENCES `address_hierarchy_level` (`address_hierarchy_level_id`),
  CONSTRAINT `parent-to-parent` FOREIGN KEY (`parent_id`) REFERENCES `address_hierarchy_entry` (`address_hierarchy_entry_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_hierarchy_entry`
--

LOCK TABLES `address_hierarchy_entry` WRITE;
/*!40000 ALTER TABLE `address_hierarchy_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_hierarchy_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_hierarchy_level`
--

DROP TABLE IF EXISTS `address_hierarchy_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_hierarchy_level` (
  `address_hierarchy_level_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(160) DEFAULT NULL,
  `parent_level_id` int(11) DEFAULT NULL,
  `address_field` varchar(50) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`address_hierarchy_level_id`),
  UNIQUE KEY `parent_level_id_unique` (`parent_level_id`),
  KEY `address_field_unique` (`address_field`),
  CONSTRAINT `parent_level` FOREIGN KEY (`parent_level_id`) REFERENCES `address_hierarchy_level` (`address_hierarchy_level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_hierarchy_level`
--

LOCK TABLES `address_hierarchy_level` WRITE;
/*!40000 ALTER TABLE `address_hierarchy_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_hierarchy_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appframework_component_state`
--

DROP TABLE IF EXISTS `appframework_component_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appframework_component_state` (
  `component_state_id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `component_id` varchar(255) NOT NULL,
  `component_type` varchar(50) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`component_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appframework_component_state`
--

LOCK TABLES `appframework_component_state` WRITE;
/*!40000 ALTER TABLE `appframework_component_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `appframework_component_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appframework_user_app`
--

DROP TABLE IF EXISTS `appframework_user_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appframework_user_app` (
  `app_id` varchar(50) NOT NULL,
  `json` mediumtext NOT NULL,
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appframework_user_app`
--

LOCK TABLES `appframework_user_app` WRITE;
/*!40000 ALTER TABLE `appframework_user_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `appframework_user_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bahmni_config`
--

DROP TABLE IF EXISTS `bahmni_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bahmni_config` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_name` varchar(255) NOT NULL,
  `app_name` varchar(255) NOT NULL,
  `config` longtext NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `bahmni_config_unique_app_config_name` (`config_name`,`app_name`),
  UNIQUE KEY `bahmni_config_unique_uuid` (`uuid`),
  KEY `bahmni_config_creator_fk` (`creator`),
  KEY `bahmni_config_changed_by_fk` (`changed_by`),
  CONSTRAINT `bahmni_config_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `bahmni_config_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bahmni_config`
--

LOCK TABLES `bahmni_config` WRITE;
/*!40000 ALTER TABLE `bahmni_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `bahmni_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bahmni_config_version`
--

DROP TABLE IF EXISTS `bahmni_config_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bahmni_config_version` (
  `config_version_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_uuid` char(38) NOT NULL,
  `config_diff` blob NOT NULL,
  `date_created` datetime NOT NULL,
  `version_name` varchar(255) NOT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`config_version_id`),
  UNIQUE KEY `bahmni_config_unique_version_name` (`version_name`),
  UNIQUE KEY `bahmni_config_version_unique_uuid` (`uuid`),
  KEY `bahmni_config_uuid_fk` (`config_uuid`),
  CONSTRAINT `bahmni_config_uuid_fk` FOREIGN KEY (`config_uuid`) REFERENCES `bahmni_config` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bahmni_config_version`
--

LOCK TABLES `bahmni_config_version` WRITE;
/*!40000 ALTER TABLE `bahmni_config_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `bahmni_config_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bed`
--

DROP TABLE IF EXISTS `bed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bed` (
  `bed_id` int(11) NOT NULL AUTO_INCREMENT,
  `bed_number` varchar(50) NOT NULL,
  `status` varchar(255) DEFAULT 'AVAILABLE',
  `bed_type_id` int(11) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  `creator` int(11) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bed_id`),
  UNIQUE KEY `bed_unique_uuid` (`uuid`),
  KEY `bed_bed_type_fk` (`bed_type_id`),
  KEY `bed_creator` (`creator`),
  KEY `bed_changed_by_fk` (`changed_by`),
  KEY `bed_voided_by_fk` (`voided_by`),
  CONSTRAINT `bed_bed_type_fk` FOREIGN KEY (`bed_type_id`) REFERENCES `bed_type` (`bed_type_id`),
  CONSTRAINT `bed_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `bed_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `bed_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bed`
--

LOCK TABLES `bed` WRITE;
/*!40000 ALTER TABLE `bed` DISABLE KEYS */;
/*!40000 ALTER TABLE `bed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bed_location_map`
--

DROP TABLE IF EXISTS `bed_location_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bed_location_map` (
  `bed_location_map_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `row_number` smallint(6) NOT NULL,
  `column_number` smallint(6) NOT NULL,
  `bed_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`bed_location_map_id`),
  KEY `bed_location_map_location_fk` (`location_id`),
  CONSTRAINT `bed_location_map_location_fk` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bed_location_map`
--

LOCK TABLES `bed_location_map` WRITE;
/*!40000 ALTER TABLE `bed_location_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `bed_location_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bed_patient_assignment_map`
--

DROP TABLE IF EXISTS `bed_patient_assignment_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bed_patient_assignment_map` (
  `bed_patient_assignment_map_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `bed_id` int(11) NOT NULL,
  `date_started` datetime NOT NULL,
  `date_stopped` datetime DEFAULT NULL,
  `encounter_id` int(11) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  `creator` int(11) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bed_patient_assignment_map_id`),
  UNIQUE KEY `bed_unique_uuid` (`uuid`),
  KEY `bed_id_fk` (`bed_id`),
  KEY `bed_patient_assignment_map_patient_fk` (`patient_id`),
  KEY `bed_patient_assignment_map_encounter_fk` (`encounter_id`),
  KEY `bed_patient_assignment_map_creator` (`creator`),
  KEY `bed_patient_assignment_map_changed_by_fk` (`changed_by`),
  KEY `bed_patient_assignment_map_voided_by_fk` (`voided_by`),
  CONSTRAINT `bed_id_fk` FOREIGN KEY (`bed_id`) REFERENCES `bed` (`bed_id`),
  CONSTRAINT `bed_patient_assignment_map_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `bed_patient_assignment_map_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `bed_patient_assignment_map_encounter_fk` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `bed_patient_assignment_map_patient_fk` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `bed_patient_assignment_map_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bed_patient_assignment_map`
--

LOCK TABLES `bed_patient_assignment_map` WRITE;
/*!40000 ALTER TABLE `bed_patient_assignment_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `bed_patient_assignment_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bed_type`
--

DROP TABLE IF EXISTS `bed_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bed_type` (
  `bed_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(10) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bed_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bed_type`
--

LOCK TABLES `bed_type` WRITE;
/*!40000 ALTER TABLE `bed_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `bed_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calculation_registration`
--

DROP TABLE IF EXISTS `calculation_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calculation_registration` (
  `calculation_registration_id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `provider_class_name` varchar(512) NOT NULL,
  `calculation_name` varchar(512) NOT NULL,
  `configuration` text,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`calculation_registration_id`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calculation_registration`
--

LOCK TABLES `calculation_registration` WRITE;
/*!40000 ALTER TABLE `calculation_registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `calculation_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `care_setting`
--

DROP TABLE IF EXISTS `care_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `care_setting` (
  `care_setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `care_setting_type` varchar(50) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`care_setting_id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `care_setting_creator` (`creator`),
  KEY `care_setting_retired_by` (`retired_by`),
  KEY `care_setting_changed_by` (`changed_by`),
  CONSTRAINT `care_setting_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `care_setting_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `care_setting_retired_by` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `care_setting`
--

LOCK TABLES `care_setting` WRITE;
/*!40000 ALTER TABLE `care_setting` DISABLE KEYS */;
INSERT INTO `care_setting` VALUES (1,'Outpatient','Out-patient care setting','OUTPATIENT',1,'2013-12-27 00:00:00',0,NULL,NULL,NULL,NULL,NULL,'6f0c9a92-6f24-11e3-af88-005056821db0'),(2,'Inpatient','In-patient care setting','INPATIENT',1,'2013-12-27 00:00:00',0,NULL,NULL,NULL,NULL,NULL,'c365e560-c3ec-11e3-9c1a-0800200c9a66');
/*!40000 ALTER TABLE `care_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chunking_history`
--

DROP TABLE IF EXISTS `chunking_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chunking_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chunk_length` bigint(20) DEFAULT NULL,
  `start` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chunking_history`
--

LOCK TABLES `chunking_history` WRITE;
/*!40000 ALTER TABLE `chunking_history` DISABLE KEYS */;
INSERT INTO `chunking_history` VALUES (1,5,1);
/*!40000 ALTER TABLE `chunking_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clob_datatype_storage`
--

DROP TABLE IF EXISTS `clob_datatype_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clob_datatype_storage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `clob_datatype_storage_uuid_index` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clob_datatype_storage`
--

LOCK TABLES `clob_datatype_storage` WRITE;
/*!40000 ALTER TABLE `clob_datatype_storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `clob_datatype_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cohort`
--

DROP TABLE IF EXISTS `cohort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cohort` (
  `cohort_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`cohort_id`),
  UNIQUE KEY `cohort_uuid_index` (`uuid`),
  KEY `user_who_changed_cohort` (`changed_by`),
  KEY `cohort_creator` (`creator`),
  KEY `user_who_voided_cohort` (`voided_by`),
  CONSTRAINT `cohort_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_changed_cohort` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_cohort` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cohort`
--

LOCK TABLES `cohort` WRITE;
/*!40000 ALTER TABLE `cohort` DISABLE KEYS */;
/*!40000 ALTER TABLE `cohort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cohort_member`
--

DROP TABLE IF EXISTS `cohort_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cohort_member` (
  `cohort_id` int(11) NOT NULL DEFAULT '0',
  `patient_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cohort_id`,`patient_id`),
  KEY `member_patient` (`patient_id`),
  CONSTRAINT `member_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON UPDATE CASCADE,
  CONSTRAINT `parent_cohort` FOREIGN KEY (`cohort_id`) REFERENCES `cohort` (`cohort_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cohort_member`
--

LOCK TABLES `cohort_member` WRITE;
/*!40000 ALTER TABLE `cohort_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `cohort_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept`
--

DROP TABLE IF EXISTS `concept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept` (
  `concept_id` int(11) NOT NULL AUTO_INCREMENT,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `short_name` varchar(255) DEFAULT NULL,
  `description` text,
  `form_text` text,
  `datatype_id` int(11) NOT NULL DEFAULT '0',
  `class_id` int(11) NOT NULL DEFAULT '0',
  `is_set` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`concept_id`),
  UNIQUE KEY `concept_uuid_index` (`uuid`),
  KEY `user_who_changed_concept` (`changed_by`),
  KEY `concept_classes` (`class_id`),
  KEY `concept_creator` (`creator`),
  KEY `concept_datatypes` (`datatype_id`),
  KEY `user_who_retired_concept` (`retired_by`),
  CONSTRAINT `concept_classes` FOREIGN KEY (`class_id`) REFERENCES `concept_class` (`concept_class_id`),
  CONSTRAINT `concept_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `concept_datatypes` FOREIGN KEY (`datatype_id`) REFERENCES `concept_datatype` (`concept_datatype_id`),
  CONSTRAINT `user_who_changed_concept` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_concept` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept`
--

LOCK TABLES `concept` WRITE;
/*!40000 ALTER TABLE `concept` DISABLE KEYS */;
INSERT INTO `concept` VALUES (1,0,'','',NULL,4,11,0,1,'2015-11-12 08:43:29',NULL,NULL,NULL,NULL,NULL,NULL,'9730b98a-0074-4fe7-a72a-6c7978be5805'),(2,0,'','',NULL,4,11,0,1,'2015-11-12 08:43:29',NULL,NULL,NULL,NULL,NULL,NULL,'5b62dd82-97b5-463f-92bb-b8e5e96c62df'),(3,0,NULL,NULL,NULL,4,10,1,1,'2013-07-23 11:26:35',NULL,1,'2013-07-23 11:26:35',NULL,NULL,NULL,'a914c562-8919-11e5-8b59-08002715d519'),(4,0,NULL,NULL,NULL,2,7,0,1,'2015-11-12 08:45:00',NULL,1,'2015-11-12 08:45:00',NULL,NULL,NULL,'a929110f-8919-11e5-8b59-08002715d519'),(5,0,NULL,NULL,NULL,3,11,0,1,'2015-11-12 08:45:00',NULL,1,'2015-11-12 08:45:00',NULL,NULL,NULL,'a92a2cbe-8919-11e5-8b59-08002715d519'),(6,0,NULL,NULL,NULL,3,11,0,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a92b18db-8919-11e5-8b59-08002715d519'),(7,0,NULL,NULL,NULL,3,11,0,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a92bee32-8919-11e5-8b59-08002715d519'),(8,0,NULL,NULL,NULL,3,11,0,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a92d4e95-8919-11e5-8b59-08002715d519'),(9,0,NULL,NULL,NULL,2,7,0,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a92e258e-8919-11e5-8b59-08002715d519'),(10,0,NULL,NULL,NULL,3,11,0,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a92f56ea-8919-11e5-8b59-08002715d519'),(11,0,NULL,NULL,NULL,3,11,0,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a9300a90-8919-11e5-8b59-08002715d519'),(12,0,NULL,NULL,NULL,3,11,0,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a93104c4-8919-11e5-8b59-08002715d519'),(13,0,NULL,NULL,NULL,4,10,1,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a9350949-8919-11e5-8b59-08002715d519'),(14,0,NULL,NULL,NULL,3,7,0,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a935c911-8919-11e5-8b59-08002715d519'),(15,0,NULL,NULL,NULL,2,7,0,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a936b5de-8919-11e5-8b59-08002715d519'),(16,0,NULL,NULL,NULL,2,7,0,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a93767d7-8919-11e5-8b59-08002715d519'),(17,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a9386858-8919-11e5-8b59-08002715d519'),(18,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a938f7ed-8919-11e5-8b59-08002715d519'),(19,0,NULL,NULL,NULL,2,7,0,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a939bc72-8919-11e5-8b59-08002715d519'),(20,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a93a8117-8919-11e5-8b59-08002715d519'),(21,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a93afff7-8919-11e5-8b59-08002715d519'),(22,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a93dbc90-8919-11e5-8b59-08002715d519'),(23,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a93e7a8c-8919-11e5-8b59-08002715d519'),(24,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a93f1682-8919-11e5-8b59-08002715d519'),(25,0,NULL,NULL,NULL,2,7,0,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a93fc4b9-8919-11e5-8b59-08002715d519'),(26,0,NULL,NULL,NULL,4,11,1,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a940b3aa-8919-11e5-8b59-08002715d519'),(27,0,NULL,NULL,NULL,3,11,0,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a94188dc-8919-11e5-8b59-08002715d519'),(28,0,NULL,NULL,NULL,3,11,0,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a943b379-8919-11e5-8b59-08002715d519'),(29,0,NULL,NULL,NULL,4,11,1,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a945ac13-8919-11e5-8b59-08002715d519'),(30,0,NULL,NULL,NULL,4,11,1,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a94862ca-8919-11e5-8b59-08002715d519'),(31,0,NULL,NULL,NULL,4,10,1,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a9513c12-8919-11e5-8b59-08002715d519'),(32,0,NULL,NULL,NULL,4,10,1,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a95225e9-8919-11e5-8b59-08002715d519'),(33,0,NULL,NULL,NULL,4,10,1,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a952d1d7-8919-11e5-8b59-08002715d519'),(34,0,'Adt Notes','Adt Notes',NULL,3,11,0,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a954dbe3-8919-11e5-8b59-08002715d519'),(35,0,'Document','Document',NULL,3,11,0,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a95be3ff-8919-11e5-8b59-08002715d519'),(36,0,NULL,NULL,NULL,4,5,1,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a96c402b-8919-11e5-8b59-08002715d519'),(37,0,NULL,NULL,NULL,3,5,0,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a96cafcc-8919-11e5-8b59-08002715d519'),(38,0,NULL,NULL,NULL,3,5,0,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a96d51ce-8919-11e5-8b59-08002715d519'),(39,0,NULL,NULL,NULL,1,5,0,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a96dee3f-8919-11e5-8b59-08002715d519'),(40,0,NULL,NULL,NULL,1,5,0,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a96e894d-8919-11e5-8b59-08002715d519'),(41,0,NULL,NULL,NULL,10,5,0,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a96f2f2f-8919-11e5-8b59-08002715d519'),(42,0,NULL,NULL,NULL,4,11,1,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a97ca322-8919-11e5-8b59-08002715d519'),(44,0,NULL,NULL,NULL,3,11,0,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a982e1a5-8919-11e5-8b59-08002715d519'),(45,0,NULL,NULL,NULL,4,10,1,1,'2015-11-12 08:45:01',NULL,NULL,NULL,NULL,NULL,NULL,'a984af61-8919-11e5-8b59-08002715d519'),(46,0,NULL,NULL,NULL,4,10,1,1,'2015-11-12 08:45:01',NULL,NULL,NULL,NULL,NULL,NULL,'a986272d-8919-11e5-8b59-08002715d519'),(47,0,NULL,NULL,NULL,10,5,0,1,'2015-11-12 08:45:01',NULL,NULL,NULL,NULL,NULL,NULL,'a9867e76-8919-11e5-8b59-08002715d519'),(48,0,NULL,NULL,NULL,4,11,1,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a98b2794-8919-11e5-8b59-08002715d519'),(49,0,NULL,NULL,NULL,2,11,1,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a9937907-8919-11e5-8b59-08002715d519'),(50,0,NULL,NULL,NULL,3,11,1,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a9944430-8919-11e5-8b59-08002715d519'),(51,0,NULL,NULL,NULL,10,11,1,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a994e357-8919-11e5-8b59-08002715d519'),(52,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a996feb2-8919-11e5-8b59-08002715d519'),(53,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:45:01',NULL,1,'2015-11-12 08:45:01',NULL,NULL,NULL,'a99aebcc-8919-11e5-8b59-08002715d519'),(55,0,NULL,NULL,NULL,1,10,1,1,'2015-11-12 08:45:11',NULL,1,'2015-11-12 08:45:11',NULL,NULL,NULL,'af7b41ea-8919-11e5-8b59-08002715d519'),(56,0,NULL,NULL,NULL,4,10,1,1,'2015-11-12 08:45:21',NULL,1,'2015-11-12 08:45:21',NULL,NULL,NULL,'b5a7f8c3-8919-11e5-8b59-08002715d519'),(57,0,NULL,NULL,NULL,4,10,1,1,'2015-11-12 08:47:12',NULL,1,'2015-11-12 08:47:12',NULL,NULL,NULL,'f751eb55-8919-11e5-8b59-08002715d519'),(58,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:47:12',NULL,1,'2015-11-12 08:47:12',NULL,NULL,NULL,'f752d52f-8919-11e5-8b59-08002715d519'),(59,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:47:12',NULL,1,'2015-11-12 08:47:12',NULL,NULL,NULL,'f75381a6-8919-11e5-8b59-08002715d519'),(60,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:47:12',NULL,1,'2015-11-12 08:47:12',NULL,NULL,NULL,'f7541259-8919-11e5-8b59-08002715d519'),(61,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:47:12',NULL,1,'2015-11-12 08:47:12',NULL,NULL,NULL,'f754be93-8919-11e5-8b59-08002715d519'),(62,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:47:12',NULL,1,'2015-11-12 08:47:12',NULL,NULL,NULL,'f755b51f-8919-11e5-8b59-08002715d519'),(63,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:47:12',NULL,1,'2015-11-12 08:47:12',NULL,NULL,NULL,'f75657a3-8919-11e5-8b59-08002715d519'),(64,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:47:12',NULL,1,'2015-11-12 08:47:12',NULL,NULL,NULL,'f756f02e-8919-11e5-8b59-08002715d519'),(65,0,NULL,NULL,NULL,4,10,1,1,'2015-11-12 08:47:12',NULL,1,'2015-11-12 08:47:12',NULL,NULL,NULL,'f75acc3d-8919-11e5-8b59-08002715d519'),(66,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:47:12',NULL,1,'2015-11-12 08:47:12',NULL,NULL,NULL,'f75bc2bc-8919-11e5-8b59-08002715d519'),(67,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:47:12',NULL,1,'2015-11-12 08:47:12',NULL,NULL,NULL,'f75c5d89-8919-11e5-8b59-08002715d519'),(68,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:47:12',NULL,1,'2015-11-12 08:47:12',NULL,NULL,NULL,'f75cf403-8919-11e5-8b59-08002715d519'),(69,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:47:12',NULL,1,'2015-11-12 08:47:12',NULL,NULL,NULL,'f75dd548-8919-11e5-8b59-08002715d519'),(70,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:47:12',NULL,1,'2015-11-12 08:47:12',NULL,NULL,NULL,'f75ebaae-8919-11e5-8b59-08002715d519'),(71,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:47:12',NULL,1,'2015-11-12 08:47:12',NULL,NULL,NULL,'f75f6bc8-8919-11e5-8b59-08002715d519'),(72,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:47:12',NULL,1,'2015-11-12 08:47:12',NULL,NULL,NULL,'f7601c05-8919-11e5-8b59-08002715d519'),(74,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:47:12',NULL,1,'2015-11-12 08:47:12',NULL,NULL,NULL,'f761a03c-8919-11e5-8b59-08002715d519'),(75,0,NULL,NULL,NULL,4,10,1,1,'2015-11-12 08:47:12',NULL,1,'2015-11-12 08:47:12',NULL,NULL,NULL,'f7645ca5-8919-11e5-8b59-08002715d519'),(76,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:47:12',NULL,1,'2015-11-12 08:47:12',NULL,NULL,NULL,'f7653b60-8919-11e5-8b59-08002715d519'),(77,0,NULL,NULL,NULL,4,20,0,1,'2015-11-12 08:47:12',NULL,1,'2015-11-12 08:47:12',NULL,NULL,NULL,'f7681433-8919-11e5-8b59-08002715d519'),(78,0,NULL,NULL,NULL,4,20,0,1,'2015-11-12 08:47:12',NULL,1,'2015-11-12 08:47:12',NULL,NULL,NULL,'f7692d36-8919-11e5-8b59-08002715d519'),(79,0,NULL,NULL,NULL,4,20,0,1,'2015-11-12 08:47:12',NULL,1,'2015-11-12 08:47:12',NULL,NULL,NULL,'f769dff6-8919-11e5-8b59-08002715d519'),(80,0,NULL,NULL,NULL,4,20,0,1,'2015-11-12 08:47:12',NULL,1,'2015-11-12 08:47:12',NULL,NULL,NULL,'f76aaf99-8919-11e5-8b59-08002715d519'),(81,0,NULL,NULL,NULL,4,10,1,1,'2015-11-12 08:47:12',NULL,1,'2015-11-12 08:47:12',NULL,NULL,NULL,'f76d2b7b-8919-11e5-8b59-08002715d519'),(82,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:47:12',NULL,1,'2015-11-12 08:47:12',NULL,NULL,NULL,'f76dfb96-8919-11e5-8b59-08002715d519'),(83,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:47:12',NULL,1,'2015-11-12 08:47:12',NULL,NULL,NULL,'f76eafab-8919-11e5-8b59-08002715d519'),(84,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:47:12',NULL,1,'2015-11-12 08:47:12',NULL,NULL,NULL,'f76f45dc-8919-11e5-8b59-08002715d519'),(85,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:47:12',NULL,1,'2015-11-12 08:47:12',NULL,NULL,NULL,'f77059a7-8919-11e5-8b59-08002715d519'),(86,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:47:12',NULL,1,'2015-11-12 08:47:12',NULL,NULL,NULL,'f770eb44-8919-11e5-8b59-08002715d519'),(87,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:47:12',NULL,1,'2015-11-12 08:47:12',NULL,NULL,NULL,'f7717d7a-8919-11e5-8b59-08002715d519'),(88,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:47:12',NULL,1,'2015-11-12 08:47:12',NULL,NULL,NULL,'f7720acb-8919-11e5-8b59-08002715d519'),(89,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:47:12',NULL,1,'2015-11-12 08:47:12',NULL,NULL,NULL,'f772988b-8919-11e5-8b59-08002715d519'),(90,0,NULL,NULL,NULL,4,10,1,1,'2015-11-12 08:47:12',NULL,1,'2015-11-12 08:47:12',NULL,NULL,NULL,'f774caaf-8919-11e5-8b59-08002715d519'),(91,0,NULL,NULL,NULL,3,23,1,1,'2015-11-12 08:48:17',NULL,1,'2015-11-12 08:48:17',NULL,NULL,NULL,'1e262234-891a-11e5-8b59-08002715d519'),(92,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:48:17',NULL,1,'2015-11-12 08:48:17',NULL,NULL,NULL,'1e3bd455-891a-11e5-8b59-08002715d519'),(93,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:48:17',NULL,1,'2015-11-12 08:48:17',NULL,NULL,NULL,'1e3d16ba-891a-11e5-8b59-08002715d519'),(94,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:48:17',NULL,1,'2015-11-12 08:48:17',NULL,NULL,NULL,'1e3e1bbd-891a-11e5-8b59-08002715d519'),(95,0,NULL,NULL,NULL,3,11,0,1,'2015-11-12 08:48:17',NULL,1,'2015-11-12 08:48:17',NULL,NULL,NULL,'1e5c8e88-891a-11e5-8b59-08002715d519'),(96,0,NULL,NULL,NULL,4,10,1,1,'2015-11-12 08:48:17',NULL,1,'2015-11-12 08:48:17',NULL,NULL,NULL,'1e73d1b8-891a-11e5-8b59-08002715d519'),(97,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:48:17',NULL,1,'2015-11-12 08:48:17',NULL,NULL,NULL,'1e7596ce-891a-11e5-8b59-08002715d519'),(98,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:48:17',NULL,1,'2015-11-12 08:48:17',NULL,NULL,NULL,'1e76441a-891a-11e5-8b59-08002715d519'),(99,0,NULL,NULL,NULL,4,20,0,1,'2015-11-12 08:48:17',NULL,1,'2015-11-12 08:48:17',NULL,NULL,NULL,'1e78798d-891a-11e5-8b59-08002715d519'),(100,0,NULL,NULL,NULL,4,20,0,1,'2015-11-12 08:48:17',NULL,1,'2015-11-12 08:48:17',NULL,NULL,NULL,'1e794cfd-891a-11e5-8b59-08002715d519'),(101,0,NULL,NULL,NULL,4,20,0,1,'2015-11-12 08:48:17',NULL,1,'2015-11-12 08:48:17',NULL,NULL,NULL,'1e7a698f-891a-11e5-8b59-08002715d519'),(102,0,NULL,NULL,NULL,4,20,0,1,'2015-11-12 08:48:17',NULL,1,'2015-11-12 08:48:17',NULL,NULL,NULL,'1e7bfb9c-891a-11e5-8b59-08002715d519'),(103,0,NULL,NULL,NULL,4,20,0,1,'2015-11-12 08:48:17',NULL,1,'2015-11-12 08:48:17',NULL,NULL,NULL,'1e7cc01b-891a-11e5-8b59-08002715d519'),(104,0,NULL,NULL,NULL,4,20,0,1,'2015-11-12 08:48:17',NULL,1,'2015-11-12 08:48:17',NULL,NULL,NULL,'1e7d616b-891a-11e5-8b59-08002715d519'),(105,0,NULL,NULL,NULL,4,20,0,1,'2015-11-12 08:48:17',NULL,1,'2015-11-12 08:48:17',NULL,NULL,NULL,'1e7e41e5-891a-11e5-8b59-08002715d519'),(106,0,NULL,NULL,NULL,4,20,0,1,'2015-11-12 08:48:17',NULL,1,'2015-11-12 08:48:17',NULL,NULL,NULL,'1e7eef72-891a-11e5-8b59-08002715d519'),(107,0,NULL,NULL,NULL,4,20,0,1,'2015-11-12 08:48:17',NULL,1,'2015-11-12 08:48:17',NULL,NULL,NULL,'1e7fbc93-891a-11e5-8b59-08002715d519'),(108,0,NULL,NULL,NULL,4,20,0,1,'2015-11-12 08:48:17',NULL,1,'2015-11-12 08:48:17',NULL,NULL,NULL,'1e808013-891a-11e5-8b59-08002715d519'),(109,0,NULL,NULL,NULL,4,20,0,1,'2015-11-12 08:48:17',NULL,1,'2015-11-12 08:48:17',NULL,NULL,NULL,'1e816b36-891a-11e5-8b59-08002715d519'),(110,0,NULL,NULL,NULL,4,20,0,1,'2015-11-12 08:48:17',NULL,1,'2015-11-12 08:48:17',NULL,NULL,NULL,'1e8204c8-891a-11e5-8b59-08002715d519'),(111,0,NULL,NULL,NULL,4,20,0,1,'2015-11-12 08:48:17',NULL,1,'2015-11-12 08:48:17',NULL,NULL,NULL,'1e82b4bc-891a-11e5-8b59-08002715d519'),(112,0,NULL,NULL,NULL,4,20,0,1,'2015-11-12 08:48:17',NULL,1,'2015-11-12 08:48:17',NULL,NULL,NULL,'1e8359f8-891a-11e5-8b59-08002715d519'),(113,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:48:17',NULL,1,'2015-11-12 08:48:17',NULL,NULL,NULL,'1e85d4b3-891a-11e5-8b59-08002715d519'),(114,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:48:17',NULL,1,'2015-11-12 08:48:17',NULL,NULL,NULL,'1e8671f1-891a-11e5-8b59-08002715d519'),(115,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:48:17',NULL,1,'2015-11-12 08:48:17',NULL,NULL,NULL,'1e870c1b-891a-11e5-8b59-08002715d519'),(116,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:48:17',NULL,1,'2015-11-12 08:48:17',NULL,NULL,NULL,'1e879bdb-891a-11e5-8b59-08002715d519'),(117,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:48:18',NULL,1,'2015-11-12 08:48:18',NULL,NULL,NULL,'1ec025ed-891a-11e5-8b59-08002715d519'),(118,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:48:18',NULL,1,'2015-11-12 08:48:18',NULL,NULL,NULL,'1ec07234-891a-11e5-8b59-08002715d519'),(119,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:48:18',NULL,1,'2015-11-12 08:48:18',NULL,NULL,NULL,'1ec0b918-891a-11e5-8b59-08002715d519'),(120,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:48:18',NULL,1,'2015-11-12 08:48:18',NULL,NULL,NULL,'1ec1075c-891a-11e5-8b59-08002715d519'),(121,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:48:18',NULL,1,'2015-11-12 08:48:18',NULL,NULL,NULL,'1ec153b5-891a-11e5-8b59-08002715d519'),(122,0,NULL,NULL,NULL,4,20,0,1,'2015-11-12 08:48:18',NULL,1,'2015-11-12 08:48:18',NULL,NULL,NULL,'1ec33b2f-891a-11e5-8b59-08002715d519'),(123,0,NULL,NULL,NULL,4,20,0,1,'2015-11-12 08:48:18',NULL,1,'2015-11-12 08:48:18',NULL,NULL,NULL,'1ec41d38-891a-11e5-8b59-08002715d519'),(124,0,NULL,NULL,NULL,4,20,0,1,'2015-11-12 08:48:18',NULL,1,'2015-11-12 08:48:18',NULL,NULL,NULL,'1ec4d115-891a-11e5-8b59-08002715d519'),(125,0,NULL,NULL,NULL,4,20,0,1,'2015-11-12 08:48:18',NULL,1,'2015-11-12 08:48:18',NULL,NULL,NULL,'1ec58036-891a-11e5-8b59-08002715d519'),(126,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:48:18',NULL,1,'2015-11-12 08:48:18',NULL,NULL,NULL,'1ecae7b4-891a-11e5-8b59-08002715d519'),(127,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:48:18',NULL,1,'2015-11-12 08:48:18',NULL,NULL,NULL,'1ed093ce-891a-11e5-8b59-08002715d519'),(128,0,NULL,NULL,NULL,4,11,1,1,'2015-11-12 08:48:18',NULL,1,'2015-11-12 08:48:18',NULL,NULL,NULL,'1ed52534-891a-11e5-8b59-08002715d519'),(129,0,NULL,NULL,NULL,4,11,0,1,'2015-11-12 08:48:18',NULL,1,'2015-11-12 08:48:18',NULL,NULL,NULL,'1edb1dbc-891a-11e5-8b59-08002715d519'),(130,0,NULL,NULL,NULL,10,11,0,1,'2015-11-12 08:48:18',NULL,1,'2015-11-12 08:48:18',NULL,NULL,NULL,'1ee0e49b-891a-11e5-8b59-08002715d519'),(131,0,NULL,NULL,NULL,4,10,1,1,'2015-11-12 08:48:18',NULL,1,'2015-11-12 08:48:18',NULL,NULL,NULL,'1ef028d4-891a-11e5-8b59-08002715d519');
/*!40000 ALTER TABLE `concept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_answer`
--

DROP TABLE IF EXISTS `concept_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_answer` (
  `concept_answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `answer_concept` int(11) DEFAULT NULL,
  `answer_drug` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `sort_weight` double DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`concept_answer_id`),
  UNIQUE KEY `concept_answer_uuid_index` (`uuid`),
  KEY `answer` (`answer_concept`),
  KEY `answers_for_concept` (`concept_id`),
  KEY `answer_creator` (`creator`),
  KEY `answer_answer_drug_fk` (`answer_drug`),
  CONSTRAINT `answer` FOREIGN KEY (`answer_concept`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `answer_answer_drug_fk` FOREIGN KEY (`answer_drug`) REFERENCES `drug` (`drug_id`),
  CONSTRAINT `answer_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `answers_for_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_answer`
--

LOCK TABLES `concept_answer` WRITE;
/*!40000 ALTER TABLE `concept_answer` DISABLE KEYS */;
INSERT INTO `concept_answer` VALUES (1,4,5,NULL,1,'2015-11-12 08:45:01',1,'a92ad6dd-8919-11e5-8b59-08002715d519'),(2,4,6,NULL,1,'2015-11-12 08:45:01',2,'a92b97c3-8919-11e5-8b59-08002715d519'),(3,4,7,NULL,1,'2015-11-12 08:45:01',3,'a92cfffc-8919-11e5-8b59-08002715d519'),(4,4,8,NULL,1,'2015-11-12 08:45:01',4,'a92dbb92-8919-11e5-8b59-08002715d519'),(5,9,10,NULL,1,'2015-11-12 08:45:01',1,'a92fbf6d-8919-11e5-8b59-08002715d519'),(6,9,11,NULL,1,'2015-11-12 08:45:01',2,'a93066bc-8919-11e5-8b59-08002715d519'),(7,9,12,NULL,1,'2015-11-12 08:45:01',3,'a9316ea3-8919-11e5-8b59-08002715d519'),(8,16,17,NULL,1,'2015-11-12 08:45:01',1,'a93978f1-8919-11e5-8b59-08002715d519'),(9,16,18,NULL,1,'2015-11-12 08:45:01',1,'a93996ec-8919-11e5-8b59-08002715d519'),(10,19,20,NULL,1,'2015-11-12 08:45:01',1,'a93b7de5-8919-11e5-8b59-08002715d519'),(11,19,21,NULL,1,'2015-11-12 08:45:01',1,'a93ba4d0-8919-11e5-8b59-08002715d519'),(12,25,22,NULL,1,'2015-11-12 08:45:01',10,'a9404e28-8919-11e5-8b59-08002715d519'),(13,25,23,NULL,1,'2015-11-12 08:45:01',100,'a9406ee3-8919-11e5-8b59-08002715d519'),(14,25,24,NULL,1,'2015-11-12 08:45:01',200,'a9408cb8-8919-11e5-8b59-08002715d519'),(15,25,129,NULL,1,'2015-11-12 08:48:18',3,'1edc1ebd-891a-11e5-8b59-08002715d519');
/*!40000 ALTER TABLE `concept_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_class`
--

DROP TABLE IF EXISTS `concept_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_class` (
  `concept_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`concept_class_id`),
  UNIQUE KEY `concept_class_uuid_index` (`uuid`),
  KEY `concept_class_retired_status` (`retired`),
  KEY `concept_class_creator` (`creator`),
  KEY `user_who_retired_concept_class` (`retired_by`),
  KEY `concept_class_name_index` (`name`),
  CONSTRAINT `concept_class_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_concept_class` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_class`
--

LOCK TABLES `concept_class` WRITE;
/*!40000 ALTER TABLE `concept_class` DISABLE KEYS */;
INSERT INTO `concept_class` VALUES (1,'Test','Acq. during patient encounter (vitals, labs, etc.)',1,'2004-02-02 00:00:00',0,NULL,NULL,NULL,'8d4907b2-c2cc-11de-8d13-0010c6dffd0f'),(2,'Procedure','Describes a clinical procedure',1,'2004-03-02 00:00:00',0,NULL,NULL,NULL,'8d490bf4-c2cc-11de-8d13-0010c6dffd0f'),(3,'Drug','Drug',1,'2004-02-02 00:00:00',0,NULL,NULL,NULL,'8d490dfc-c2cc-11de-8d13-0010c6dffd0f'),(4,'Diagnosis','Conclusion drawn through findings',1,'2004-02-02 00:00:00',0,NULL,NULL,NULL,'8d4918b0-c2cc-11de-8d13-0010c6dffd0f'),(5,'Finding','Practitioner observation/finding',1,'2004-03-02 00:00:00',0,NULL,NULL,NULL,'8d491a9a-c2cc-11de-8d13-0010c6dffd0f'),(6,'Anatomy','Anatomic sites / descriptors',1,'2004-03-02 00:00:00',0,NULL,NULL,NULL,'8d491c7a-c2cc-11de-8d13-0010c6dffd0f'),(7,'Question','Question (eg, patient history, SF36 items)',1,'2004-03-02 00:00:00',0,NULL,NULL,NULL,'8d491e50-c2cc-11de-8d13-0010c6dffd0f'),(8,'LabSet','Panels',1,'2004-03-02 00:00:00',0,NULL,NULL,NULL,'8d492026-c2cc-11de-8d13-0010c6dffd0f'),(9,'MedSet','Term to describe medication sets',1,'2004-02-02 00:00:00',0,NULL,NULL,NULL,'8d4923b4-c2cc-11de-8d13-0010c6dffd0f'),(10,'ConvSet','Term to describe convenience sets',1,'2004-03-02 00:00:00',0,NULL,NULL,NULL,'8d492594-c2cc-11de-8d13-0010c6dffd0f'),(11,'Misc','Terms which don\'t fit other categories',1,'2004-03-02 00:00:00',0,NULL,NULL,NULL,'8d492774-c2cc-11de-8d13-0010c6dffd0f'),(12,'Symptom','Patient-reported observation',1,'2004-10-04 00:00:00',0,NULL,NULL,NULL,'8d492954-c2cc-11de-8d13-0010c6dffd0f'),(13,'Symptom/Finding','Observation that can be reported from patient or found on exam',1,'2004-10-04 00:00:00',0,NULL,NULL,NULL,'8d492b2a-c2cc-11de-8d13-0010c6dffd0f'),(14,'Specimen','Body or fluid specimen',1,'2004-12-02 00:00:00',0,NULL,NULL,NULL,'8d492d0a-c2cc-11de-8d13-0010c6dffd0f'),(15,'Misc Order','Orderable items which aren\'t tests or drugs',1,'2005-02-17 00:00:00',0,NULL,NULL,NULL,'8d492ee0-c2cc-11de-8d13-0010c6dffd0f'),(16,'Concept Attribute','Concept Attribute class',1,'2015-11-12 00:00:00',0,NULL,NULL,NULL,'a99ec591-8919-11e5-8b59-08002715d519'),(17,'Abnormal','Abnormal class',1,'2015-11-12 00:00:00',0,NULL,NULL,NULL,'a9a1ee9c-8919-11e5-8b59-08002715d519'),(18,'Duration','Duration class',1,'2015-11-12 00:00:00',0,NULL,NULL,NULL,'a9a37daa-8919-11e5-8b59-08002715d519'),(19,'Concept Details','Concept Details class',1,'2015-11-12 00:00:00',0,NULL,NULL,NULL,'a9a62d7c-8919-11e5-8b59-08002715d519'),(20,'Frequency','A class for order frequencies',1,'2014-03-06 00:00:00',0,NULL,NULL,NULL,'8e071bfe-520c-44c0-a89b-538e9129b42a'),(21,'Image','Image class',1,'2015-11-12 00:00:00',0,NULL,NULL,NULL,'df26547c-8919-11e5-8b59-08002715d519'),(22,'Computed','Computed',1,'2015-11-12 00:00:00',0,NULL,NULL,NULL,'df2848ba-8919-11e5-8b59-08002715d519'),(23,'URL','URL',1,'2015-11-12 00:00:00',0,NULL,NULL,NULL,'1e2406cf-891a-11e5-8b59-08002715d519'),(24,'Sample','Lab Samples Concept Class',1,'2015-11-12 00:00:00',0,NULL,NULL,NULL,'1e6d23ac-891a-11e5-8b59-08002715d519'),(25,'Department','Lab Departments Concept Class',1,'2015-11-12 00:00:00',0,NULL,NULL,NULL,'1e6ecfe4-891a-11e5-8b59-08002715d519'),(26,'LabTest','Lab Tests',1,'2015-11-12 00:00:00',0,NULL,NULL,NULL,'1eb7486c-891a-11e5-8b59-08002715d519'),(27,'Radiology','Radiology Orders',1,'2015-11-12 00:00:00',0,NULL,NULL,NULL,'1eb8e646-891a-11e5-8b59-08002715d519'),(28,'Computed/Editable','Computed/Editable',1,'2015-11-12 00:00:00',0,NULL,NULL,NULL,'1ec8e13a-891a-11e5-8b59-08002715d519'),(29,'Case Intake','Case Intake class',1,'2015-11-12 00:00:00',0,NULL,NULL,NULL,'1ed6c9eb-891a-11e5-8b59-08002715d519');
/*!40000 ALTER TABLE `concept_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_complex`
--

DROP TABLE IF EXISTS `concept_complex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_complex` (
  `concept_id` int(11) NOT NULL,
  `handler` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`concept_id`),
  CONSTRAINT `concept_attributes` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_complex`
--

LOCK TABLES `concept_complex` WRITE;
/*!40000 ALTER TABLE `concept_complex` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_complex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_datatype`
--

DROP TABLE IF EXISTS `concept_datatype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_datatype` (
  `concept_datatype_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `hl7_abbreviation` varchar(3) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`concept_datatype_id`),
  UNIQUE KEY `concept_datatype_uuid_index` (`uuid`),
  KEY `concept_datatype_retired_status` (`retired`),
  KEY `concept_datatype_creator` (`creator`),
  KEY `user_who_retired_concept_datatype` (`retired_by`),
  KEY `concept_datatype_name_index` (`name`),
  CONSTRAINT `concept_datatype_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_concept_datatype` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_datatype`
--

LOCK TABLES `concept_datatype` WRITE;
/*!40000 ALTER TABLE `concept_datatype` DISABLE KEYS */;
INSERT INTO `concept_datatype` VALUES (1,'Numeric','NM','Numeric value, including integer or float (e.g., creatinine, weight)',1,'2004-02-02 00:00:00',0,NULL,NULL,NULL,'8d4a4488-c2cc-11de-8d13-0010c6dffd0f'),(2,'Coded','CWE','Value determined by term dictionary lookup (i.e., term identifier)',1,'2004-02-02 00:00:00',0,NULL,NULL,NULL,'8d4a48b6-c2cc-11de-8d13-0010c6dffd0f'),(3,'Text','ST','Free text',1,'2004-02-02 00:00:00',0,NULL,NULL,NULL,'8d4a4ab4-c2cc-11de-8d13-0010c6dffd0f'),(4,'N/A','ZZ','Not associated with a datatype (e.g., term answers, sets)',1,'2004-02-02 00:00:00',0,NULL,NULL,NULL,'8d4a4c94-c2cc-11de-8d13-0010c6dffd0f'),(5,'Document','RP','Pointer to a binary or text-based document (e.g., clinical document, RTF, XML, EKG, image, etc.) stored in complex_obs table',1,'2004-04-15 00:00:00',0,NULL,NULL,NULL,'8d4a4e74-c2cc-11de-8d13-0010c6dffd0f'),(6,'Date','DT','Absolute date',1,'2004-07-22 00:00:00',0,NULL,NULL,NULL,'8d4a505e-c2cc-11de-8d13-0010c6dffd0f'),(7,'Time','TM','Absolute time of day',1,'2004-07-22 00:00:00',0,NULL,NULL,NULL,'8d4a591e-c2cc-11de-8d13-0010c6dffd0f'),(8,'Datetime','TS','Absolute date and time',1,'2004-07-22 00:00:00',0,NULL,NULL,NULL,'8d4a5af4-c2cc-11de-8d13-0010c6dffd0f'),(10,'Boolean','BIT','Boolean value (yes/no, true/false)',1,'2004-08-26 00:00:00',0,NULL,NULL,NULL,'8d4a5cca-c2cc-11de-8d13-0010c6dffd0f'),(11,'Rule','ZZ','Value derived from other data',1,'2006-09-11 00:00:00',0,NULL,NULL,NULL,'8d4a5e96-c2cc-11de-8d13-0010c6dffd0f'),(12,'Structured Numeric','SN','Complex numeric values possible (ie, <5, 1-10, etc.)',1,'2005-08-06 00:00:00',0,NULL,NULL,NULL,'8d4a606c-c2cc-11de-8d13-0010c6dffd0f'),(13,'Complex','ED','Complex value.  Analogous to HL7 Embedded Datatype',1,'2008-05-28 12:25:34',0,NULL,NULL,NULL,'8d4a6242-c2cc-11de-8d13-0010c6dffd0f');
/*!40000 ALTER TABLE `concept_datatype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_description`
--

DROP TABLE IF EXISTS `concept_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_description` (
  `concept_description_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `locale` varchar(50) NOT NULL DEFAULT '',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`concept_description_id`),
  UNIQUE KEY `concept_description_uuid_index` (`uuid`),
  KEY `user_who_changed_description` (`changed_by`),
  KEY `description_for_concept` (`concept_id`),
  KEY `user_who_created_description` (`creator`),
  CONSTRAINT `description_for_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `user_who_changed_description` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_created_description` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_description`
--

LOCK TABLES `concept_description` WRITE;
/*!40000 ALTER TABLE `concept_description` DISABLE KEYS */;
INSERT INTO `concept_description` VALUES (1,5,'EVERY DAY','en',1,'2015-11-12 08:45:01',NULL,NULL,'a92af5d7-8919-11e5-8b59-08002715d519'),(2,6,'TWICE A DAY','en',1,'2015-11-12 08:45:01',NULL,NULL,'a92bad30-8919-11e5-8b59-08002715d519'),(3,7,'THREE A DAY','en',1,'2015-11-12 08:45:01',NULL,NULL,'a92d256a-8919-11e5-8b59-08002715d519'),(4,8,'FOUR A DAY','en',1,'2015-11-12 08:45:01',NULL,NULL,'a92e0755-8919-11e5-8b59-08002715d519'),(5,10,'BEFORE A MEAL','en',1,'2015-11-12 08:45:01',NULL,NULL,'a92fdeda-8919-11e5-8b59-08002715d519'),(6,11,'AFTER A MEAL','en',1,'2015-11-12 08:45:01',NULL,NULL,'a93095cc-8919-11e5-8b59-08002715d519'),(7,12,'AT BEDTIME','en',1,'2015-11-12 08:45:01',NULL,NULL,'a931907e-8919-11e5-8b59-08002715d519'),(8,28,'Consultation Note','en',1,'2015-11-12 08:45:01',NULL,NULL,'a9445e71-8919-11e5-8b59-08002715d519');
/*!40000 ALTER TABLE `concept_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_map_type`
--

DROP TABLE IF EXISTS `concept_map_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_map_type` (
  `concept_map_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_map_type_id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `mapped_user_creator_concept_map_type` (`creator`),
  KEY `mapped_user_changed_concept_map_type` (`changed_by`),
  KEY `mapped_user_retired_concept_map_type` (`retired_by`),
  CONSTRAINT `mapped_user_changed_concept_map_type` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `mapped_user_creator_concept_map_type` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `mapped_user_retired_concept_map_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_map_type`
--

LOCK TABLES `concept_map_type` WRITE;
/*!40000 ALTER TABLE `concept_map_type` DISABLE KEYS */;
INSERT INTO `concept_map_type` VALUES (1,'SAME-AS',NULL,1,'2015-11-12 00:00:00',NULL,NULL,0,0,NULL,NULL,NULL,'35543629-7d8c-11e1-909d-c80aa9edcf4e'),(2,'NARROWER-THAN',NULL,1,'2015-11-12 00:00:00',NULL,NULL,0,0,NULL,NULL,NULL,'43ac5109-7d8c-11e1-909d-c80aa9edcf4e'),(3,'BROADER-THAN',NULL,1,'2015-11-12 00:00:00',NULL,NULL,0,0,NULL,NULL,NULL,'4b9d9421-7d8c-11e1-909d-c80aa9edcf4e'),(4,'Associated finding',NULL,1,'2015-11-12 00:00:00',NULL,NULL,0,0,NULL,NULL,NULL,'55e02065-7d8c-11e1-909d-c80aa9edcf4e'),(5,'Associated morphology',NULL,1,'2015-11-12 00:00:00',NULL,NULL,0,0,NULL,NULL,NULL,'605f4a61-7d8c-11e1-909d-c80aa9edcf4e'),(6,'Associated procedure',NULL,1,'2015-11-12 00:00:00',NULL,NULL,0,0,NULL,NULL,NULL,'6eb1bfce-7d8c-11e1-909d-c80aa9edcf4e'),(7,'Associated with',NULL,1,'2015-11-12 00:00:00',NULL,NULL,0,0,NULL,NULL,NULL,'781bdc8f-7d8c-11e1-909d-c80aa9edcf4e'),(8,'Causative agent',NULL,1,'2015-11-12 00:00:00',NULL,NULL,0,0,NULL,NULL,NULL,'808f9e19-7d8c-11e1-909d-c80aa9edcf4e'),(9,'Finding site',NULL,1,'2015-11-12 00:00:00',NULL,NULL,0,0,NULL,NULL,NULL,'889c3013-7d8c-11e1-909d-c80aa9edcf4e'),(10,'Has specimen',NULL,1,'2015-11-12 00:00:00',NULL,NULL,0,0,NULL,NULL,NULL,'929600b9-7d8c-11e1-909d-c80aa9edcf4e'),(11,'Laterality',NULL,1,'2015-11-12 00:00:00',NULL,NULL,0,0,NULL,NULL,NULL,'999c6fc0-7d8c-11e1-909d-c80aa9edcf4e'),(12,'Severity',NULL,1,'2015-11-12 00:00:00',NULL,NULL,0,0,NULL,NULL,NULL,'a0e52281-7d8c-11e1-909d-c80aa9edcf4e'),(13,'Access',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'f9e90b29-7d8c-11e1-909d-c80aa9edcf4e'),(14,'After',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'01b60e29-7d8d-11e1-909d-c80aa9edcf4e'),(15,'Clinical course',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'5f7c3702-7d8d-11e1-909d-c80aa9edcf4e'),(16,'Component',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'67debecc-7d8d-11e1-909d-c80aa9edcf4e'),(17,'Direct device',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'718c00da-7d8d-11e1-909d-c80aa9edcf4e'),(18,'Direct morphology',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'7b9509cb-7d8d-11e1-909d-c80aa9edcf4e'),(19,'Direct substance',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'82bb495d-7d8d-11e1-909d-c80aa9edcf4e'),(20,'Due to',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'8b77f7d3-7d8d-11e1-909d-c80aa9edcf4e'),(21,'Episodicity',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'94a81179-7d8d-11e1-909d-c80aa9edcf4e'),(22,'Finding context',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'9d23c22e-7d8d-11e1-909d-c80aa9edcf4e'),(23,'Finding informer',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'a4524368-7d8d-11e1-909d-c80aa9edcf4e'),(24,'Finding method',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'af089254-7d8d-11e1-909d-c80aa9edcf4e'),(25,'Has active ingredient',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'b65aa605-7d8d-11e1-909d-c80aa9edcf4e'),(26,'Has definitional manifestation',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'c2b7b2fa-7d8d-11e1-909d-c80aa9edcf4'),(27,'Has dose form',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'cc3878e6-7d8d-11e1-909d-c80aa9edcf4e'),(28,'Has focus',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'d67c5840-7d8d-11e1-909d-c80aa9edcf4e'),(29,'Has intent',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'de2fb2c5-7d8d-11e1-909d-c80aa9edcf4e'),(30,'Has interpretation',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'e758838b-7d8d-11e1-909d-c80aa9edcf4e'),(31,'Indirect device',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'ee63c142-7d8d-11e1-909d-c80aa9edcf4e'),(32,'Indirect morphology',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'f4f36681-7d8d-11e1-909d-c80aa9edcf4e'),(33,'Interprets',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'fc7f5fed-7d8d-11e1-909d-c80aa9edcf4e'),(34,'Measurement method',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'06b11d79-7d8e-11e1-909d-c80aa9edcf4e'),(35,'Method',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'0efb4753-7d8e-11e1-909d-c80aa9edcf4e'),(36,'Occurrence',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'16e7b617-7d8e-11e1-909d-c80aa9edcf4e'),(37,'Part of',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'1e82007b-7d8e-11e1-909d-c80aa9edcf4e'),(38,'Pathological process',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'2969915e-7d8e-11e1-909d-c80aa9edcf4e'),(39,'Priority',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'32d57796-7d8e-11e1-909d-c80aa9edcf4e'),(40,'Procedure context',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'3f11904c-7d8e-11e1-909d-c80aa9edcf4e'),(41,'Procedure device',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'468c4aa3-7d8e-11e1-909d-c80aa9edcf4e'),(42,'Procedure morphology',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'5383e889-7d8e-11e1-909d-c80aa9edcf4e'),(43,'Procedure site',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'5ad2655d-7d8e-11e1-909d-c80aa9edcf4e'),(44,'Procedure site - Direct',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'66085196-7d8e-11e1-909d-c80aa9edcf4e'),(45,'Procedure site - Indirect',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'7080e843-7d8e-11e1-909d-c80aa9edcf4e'),(46,'Property',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'76bfb796-7d8e-11e1-909d-c80aa9edcf4e'),(47,'Recipient category',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'7e7d00e4-7d8e-11e1-909d-c80aa9edcf4e'),(48,'Revision status',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'851e14c1-7d8e-11e1-909d-c80aa9edcf4e'),(49,'Route of administration',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'8ee5b13d-7d8e-11e1-909d-c80aa9edcf4e'),(50,'Scale type',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'986acf48-7d8e-11e1-909d-c80aa9edcf4e'),(51,'Specimen procedure',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'a6937642-7d8e-11e1-909d-c80aa9edcf4e'),(52,'Specimen source identity',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'b1d6941e-7d8e-11e1-909d-c80aa9edcf4e'),(53,'Specimen source morphology',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'b7c793c1-7d8e-11e1-909d-c80aa9edcf4e'),(54,'Specimen source topography',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'be9f9eb8-7d8e-11e1-909d-c80aa9edcf4e'),(55,'Specimen substance',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'c8f2bacb-7d8e-11e1-909d-c80aa9edcf4e'),(56,'Subject of information',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'d0664c4f-7d8e-11e1-909d-c80aa9edcf4e'),(57,'Subject relationship context',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'dace9d13-7d8e-11e1-909d-c80aa9edcf4e'),(58,'Surgical approach',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'e3cd666d-7d8e-11e1-909d-c80aa9edcf4e'),(59,'Temporal context',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'ed96447d-7d8e-11e1-909d-c80aa9edcf4e'),(60,'Time aspect',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'f415bcce-7d8e-11e1-909d-c80aa9edcf4e'),(61,'Using access device',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'fa9538a9-7d8e-11e1-909d-c80aa9edcf4e'),(62,'Using device',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'06588655-7d8f-11e1-909d-c80aa9edcf4e'),(63,'Using energy',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'0c2ae0bc-7d8f-11e1-909d-c80aa9edcf4e'),(64,'Using substance',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'13d2c607-7d8f-11e1-909d-c80aa9edcf4e'),(65,'IS A',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'1ce7a784-7d8f-11e1-909d-c80aa9edcf4e'),(66,'MAY BE A',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'267812a3-7d8f-11e1-909d-c80aa9edcf4e'),(67,'MOVED FROM',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'2de3168e-7d8f-11e1-909d-c80aa9edcf4e'),(68,'MOVED TO',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'32f0fd99-7d8f-11e1-909d-c80aa9edcf4e'),(69,'REPLACED BY',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'3b3b9a7d-7d8f-11e1-909d-c80aa9edcf4e'),(70,'WAS A',NULL,1,'2015-11-12 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'41a034da-7d8f-11e1-909d-c80aa9edcf4e');
/*!40000 ALTER TABLE `concept_map_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_name`
--

DROP TABLE IF EXISTS `concept_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_name` (
  `concept_name_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `locale` varchar(50) NOT NULL DEFAULT '',
  `locale_preferred` tinyint(1) DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `concept_name_type` varchar(50) DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`concept_name_id`),
  UNIQUE KEY `concept_name_uuid_index` (`uuid`),
  KEY `name_of_concept` (`name`),
  KEY `name_for_concept` (`concept_id`),
  KEY `user_who_created_name` (`creator`),
  KEY `user_who_voided_this_name` (`voided_by`),
  CONSTRAINT `name_for_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `user_who_created_name` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_this_name` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_name`
--

LOCK TABLES `concept_name` WRITE;
/*!40000 ALTER TABLE `concept_name` DISABLE KEYS */;
INSERT INTO `concept_name` VALUES (1,1,'Vero','it',0,1,'2015-11-12 08:43:29',NULL,0,NULL,NULL,NULL,'65de75e2-92c6-4445-b053-1f82ee578f92'),(2,1,'Sì','it',0,1,'2015-11-12 08:43:29',NULL,0,NULL,NULL,NULL,'565bd09b-107b-4010-b41b-eea5b5b0ffca'),(3,1,'Verdadeiro','pt',0,1,'2015-11-12 08:43:29',NULL,0,NULL,NULL,NULL,'94551f99-bdf7-4675-979b-403ddddf6e54'),(4,1,'Sim','pt',0,1,'2015-11-12 08:43:29',NULL,0,NULL,NULL,NULL,'c28347b0-7616-468a-acf6-9a5b36397c8c'),(5,1,'Vrai','fr',0,1,'2015-11-12 08:43:29',NULL,0,NULL,NULL,NULL,'86a0c79e-c72b-434b-b691-558bd829c826'),(6,1,'Oui','fr',0,1,'2015-11-12 08:43:29',NULL,0,NULL,NULL,NULL,'118881d4-e063-4eee-8551-0d85e15df193'),(7,1,'True','en',1,1,'2015-11-12 08:43:29','FULLY_SPECIFIED',0,NULL,NULL,NULL,'8476f3f8-57d0-4cdf-9aa8-33e5578bbfc5'),(8,1,'Yes','en',0,1,'2015-11-12 08:43:29',NULL,0,NULL,NULL,NULL,'55e51f38-729e-457b-979a-0f4be4e1f3d8'),(9,1,'Verdadero','es',0,1,'2015-11-12 08:43:29',NULL,0,NULL,NULL,NULL,'7c508a26-c5f2-4a3e-b034-0f9f5b0ba110'),(10,1,'Sí','es',0,1,'2015-11-12 08:43:29',NULL,0,NULL,NULL,NULL,'3a6a6c76-fc10-430a-9ebf-636345b404d2'),(11,2,'Falso','it',0,1,'2015-11-12 08:43:29',NULL,0,NULL,NULL,NULL,'bed84962-9f9e-46c9-9500-7feb12cc8165'),(12,2,'No','it',0,1,'2015-11-12 08:43:29',NULL,0,NULL,NULL,NULL,'513e304b-cc41-47bf-b7ac-4c99abf3fa96'),(13,2,'Falso','pt',0,1,'2015-11-12 08:43:29',NULL,0,NULL,NULL,NULL,'ae3bb7d9-e236-4c82-9574-8e176afc2684'),(14,2,'Não','pt',0,1,'2015-11-12 08:43:29',NULL,0,NULL,NULL,NULL,'0ea225aa-3023-4908-8f97-80dc6afed43e'),(15,2,'Faux','fr',0,1,'2015-11-12 08:43:29',NULL,0,NULL,NULL,NULL,'d769f667-e573-4f1a-a6a0-ebb3609b1b7d'),(16,2,'Non','fr',0,1,'2015-11-12 08:43:29',NULL,0,NULL,NULL,NULL,'8fa10d4f-dfc2-4cca-a3ac-f28bf69c49a5'),(17,2,'False','en',1,1,'2015-11-12 08:43:29','FULLY_SPECIFIED',0,NULL,NULL,NULL,'da475146-2f77-4712-b0b4-78220c2c1ace'),(18,2,'No','en',0,1,'2015-11-12 08:43:29',NULL,0,NULL,NULL,NULL,'6bff24cb-861d-4570-943d-95e2f6ba3d0d'),(19,2,'Falso','es',0,1,'2015-11-12 08:43:29',NULL,0,NULL,NULL,NULL,'18558640-8216-47d7-a8c5-a9666380db33'),(20,2,'No','es',0,1,'2015-11-12 08:43:29',NULL,0,NULL,NULL,NULL,'1e5298d0-b8fb-4564-8b84-7179c9f051cd'),(21,3,'Lab Samples','en',1,1,'2013-07-23 11:26:35','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a9150c5e-8919-11e5-8b59-08002715d519'),(22,4,'dosagefrequency','en',0,1,'2015-11-12 08:45:00','SHORT',0,NULL,NULL,NULL,'a9291646-8919-11e5-8b59-08002715d519'),(23,4,'Dosage Frequency','en',1,1,'2015-11-12 08:45:00','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a9291933-8919-11e5-8b59-08002715d519'),(24,5,'qd','en',0,1,'2015-11-12 08:45:00','SHORT',0,NULL,NULL,NULL,'a92a2fcb-8919-11e5-8b59-08002715d519'),(25,5,'qD','en',1,1,'2015-11-12 08:45:00','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a92a363d-8919-11e5-8b59-08002715d519'),(26,6,'bid','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a92b1c22-8919-11e5-8b59-08002715d519'),(27,6,'BID','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a92b1fef-8919-11e5-8b59-08002715d519'),(28,7,'tid','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a92c2bbb-8919-11e5-8b59-08002715d519'),(29,7,'TID','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a92c2e89-8919-11e5-8b59-08002715d519'),(30,8,'qid','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a92d5203-8919-11e5-8b59-08002715d519'),(31,8,'QID','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a92d54af-8919-11e5-8b59-08002715d519'),(32,9,'dosage instructions','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a92e293b-8919-11e5-8b59-08002715d519'),(33,9,'Dosage Instructions','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a92e2f0d-8919-11e5-8b59-08002715d519'),(34,10,'ac','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a92f5a33-8919-11e5-8b59-08002715d519'),(35,10,'AC','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a92f5ce8-8919-11e5-8b59-08002715d519'),(36,11,'pc','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a9300dbc-8919-11e5-8b59-08002715d519'),(37,11,'PC','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a9301051-8919-11e5-8b59-08002715d519'),(38,12,'hs','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a931087b-8919-11e5-8b59-08002715d519'),(39,12,'HS','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a9310bbb-8919-11e5-8b59-08002715d519'),(40,13,'Visit Diagnoses','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a9350f70-8919-11e5-8b59-08002715d519'),(41,13,'Visit Diagnoses','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a93512da-8919-11e5-8b59-08002715d519'),(42,14,'Non-coded Diagnosis','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a935cc6b-8919-11e5-8b59-08002715d519'),(43,14,'Non-coded Diagnosis','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a935cf47-8919-11e5-8b59-08002715d519'),(44,15,'Coded Diagnosis','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a936b94e-8919-11e5-8b59-08002715d519'),(45,15,'Coded Diagnosis','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a936bcbb-8919-11e5-8b59-08002715d519'),(46,16,'Diagnosis Certainty','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a9376b0c-8919-11e5-8b59-08002715d519'),(47,16,'Diagnosis Certainty','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a9376d85-8919-11e5-8b59-08002715d519'),(48,17,'Presumed','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a9386c9c-8919-11e5-8b59-08002715d519'),(49,17,'Presumed','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a938724f-8919-11e5-8b59-08002715d519'),(50,18,'Confirmed','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a938fb29-8919-11e5-8b59-08002715d519'),(51,18,'Confirmed','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a938fda7-8919-11e5-8b59-08002715d519'),(52,19,'Diagnosis order','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a939bfce-8919-11e5-8b59-08002715d519'),(53,19,'Diagnosis order','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a939c25a-8919-11e5-8b59-08002715d519'),(54,20,'Secondary','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a93a8448-8919-11e5-8b59-08002715d519'),(55,20,'Secondary','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a93a86bd-8919-11e5-8b59-08002715d519'),(56,21,'Primary','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a93b0304-8919-11e5-8b59-08002715d519'),(57,21,'Primary','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a93b0583-8919-11e5-8b59-08002715d519'),(58,22,'Admit Patient','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a93dc1ba-8919-11e5-8b59-08002715d519'),(59,22,'Admit Patient','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a93dc4bd-8919-11e5-8b59-08002715d519'),(60,23,'Discharge Patient','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a93e7dc1-8919-11e5-8b59-08002715d519'),(61,23,'Discharge Patient','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a93e8054-8919-11e5-8b59-08002715d519'),(62,24,'Transfer Patient','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a93f19c6-8919-11e5-8b59-08002715d519'),(63,24,'Transfer Patient','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a93f1c43-8919-11e5-8b59-08002715d519'),(64,25,'Disposition','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a93fc816-8919-11e5-8b59-08002715d519'),(65,25,'Disposition','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a93fcabb-8919-11e5-8b59-08002715d519'),(66,26,'Disposition Set','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a940b6c7-8919-11e5-8b59-08002715d519'),(67,26,'Disposition Set','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a940b93f-8919-11e5-8b59-08002715d519'),(68,27,'Disposition Note','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a9418c3e-8919-11e5-8b59-08002715d519'),(69,27,'Disposition Note','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a941902f-8919-11e5-8b59-08002715d519'),(70,28,'consultation note','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a943b7f7-8919-11e5-8b59-08002715d519'),(71,28,'Consultation Note','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a943bc66-8919-11e5-8b59-08002715d519'),(72,29,'Admission','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a945b0d9-8919-11e5-8b59-08002715d519'),(73,29,'Admission','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a945b3c3-8919-11e5-8b59-08002715d519'),(74,30,'DISCHARGE','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a9486718-8919-11e5-8b59-08002715d519'),(75,30,'DISCHARGE','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a9486a0d-8919-11e5-8b59-08002715d519'),(76,31,'Lab departments','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a95140fb-8919-11e5-8b59-08002715d519'),(77,31,'Lab Departments','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a95143fe-8919-11e5-8b59-08002715d519'),(78,32,'Other Investigations','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a952293d-8919-11e5-8b59-08002715d519'),(79,32,'Other Investigations','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a9522c42-8919-11e5-8b59-08002715d519'),(80,33,'Other Investigations Categories','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a952d682-8919-11e5-8b59-08002715d519'),(81,33,'Other Investigations Categories','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a952d95f-8919-11e5-8b59-08002715d519'),(82,34,'Adt Notes','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a956692b-8919-11e5-8b59-08002715d519'),(83,35,'Document','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a95d163c-8919-11e5-8b59-08002715d519'),(84,36,'LABRESULTS_CONCEPT','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a96c44b6-8919-11e5-8b59-08002715d519'),(85,36,'LABRESULTS_CONCEPT','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a96c48f2-8919-11e5-8b59-08002715d519'),(86,37,'LAB_RESULT','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a96cb2ff-8919-11e5-8b59-08002715d519'),(87,37,'LAB_RESULT','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a96cb577-8919-11e5-8b59-08002715d519'),(88,38,'LAB_NOTES','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a96d54f5-8919-11e5-8b59-08002715d519'),(89,38,'LAB_NOTES','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a96d5772-8919-11e5-8b59-08002715d519'),(90,39,'LAB_MINNORMAL','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a96df156-8919-11e5-8b59-08002715d519'),(91,39,'LAB_MINNORMAL','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a96df3bd-8919-11e5-8b59-08002715d519'),(92,40,'LAB_MAXNORMAL','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a96e8c61-8919-11e5-8b59-08002715d519'),(93,40,'LAB_MAXNORMAL','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a96e8ec9-8919-11e5-8b59-08002715d519'),(94,41,'LAB_ABNORMAL','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a96f3272-8919-11e5-8b59-08002715d519'),(95,41,'LAB_ABNORMAL','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a96f3501-8919-11e5-8b59-08002715d519'),(96,42,'REFERRED_OUT','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a97ca7fc-8919-11e5-8b59-08002715d519'),(97,42,'REFERRED_OUT','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a97cab2e-8919-11e5-8b59-08002715d519'),(99,44,'Lab Order Notes','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a982e77d-8919-11e5-8b59-08002715d519'),(100,44,'Lab Order Notes','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a982eac8-8919-11e5-8b59-08002715d519'),(101,45,'All_Tests_and_Panels','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a984e78e-8919-11e5-8b59-08002715d519'),(102,45,'A_T_and_P','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a98509fe-8919-11e5-8b59-08002715d519'),(103,46,'XCompoundObservation','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a9865c40-8919-11e5-8b59-08002715d519'),(104,47,'IS_ABNORMAL','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a986b6d0-8919-11e5-8b59-08002715d519'),(105,48,'Ruled Out Diagnosis','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a98b2c55-8919-11e5-8b59-08002715d519'),(106,48,'Ruled Out Diagnosis','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a98b2f7e-8919-11e5-8b59-08002715d519'),(107,49,'Bahmni Diagnosis Status','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a9937d4f-8919-11e5-8b59-08002715d519'),(108,49,'Bahmni Diagnosis Status','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a99380e7-8919-11e5-8b59-08002715d519'),(109,50,'Bahmni Initial Diagnosis','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a9944762-8919-11e5-8b59-08002715d519'),(110,50,'Bahmni Initial Diagnosis','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a9944c29-8919-11e5-8b59-08002715d519'),(111,51,'Bahmni Diagnosis Revised','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a994e661-8919-11e5-8b59-08002715d519'),(112,51,'Bahmni Diagnosis Revised','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a994ea52-8919-11e5-8b59-08002715d519'),(113,52,'Lab Manager Notes','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a9970382-8919-11e5-8b59-08002715d519'),(114,52,'Lab Manager Notes','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a997067a-8919-11e5-8b59-08002715d519'),(115,53,'Accession Uuid','en',0,1,'2015-11-12 08:45:01','SHORT',0,NULL,NULL,NULL,'a99af00e-8919-11e5-8b59-08002715d519'),(116,53,'Accession Uuid','en',1,1,'2015-11-12 08:45:01','FULLY_SPECIFIED',0,NULL,NULL,NULL,'a99af2ec-8919-11e5-8b59-08002715d519'),(119,55,'REGISTRATION_CONCEPTS','en',1,1,'2015-11-12 08:45:11','FULLY_SPECIFIED',0,NULL,NULL,NULL,'af7b88ee-8919-11e5-8b59-08002715d519'),(120,56,'Dose\n            Quantity Units','en',0,1,'2015-11-12 08:45:21','SHORT',0,NULL,NULL,NULL,'b5a803cb-8919-11e5-8b59-08002715d519'),(121,56,'Dose Quantity Units','en',1,1,'2015-11-12 08:45:21','FULLY_SPECIFIED',0,NULL,NULL,NULL,'b5a80930-8919-11e5-8b59-08002715d519'),(122,57,'dosing  units','en',0,1,'2015-11-12 08:47:12','SHORT',0,NULL,NULL,NULL,'f751f03a-8919-11e5-8b59-08002715d519'),(123,57,'Dosing Units','en',1,1,'2015-11-12 08:47:12','FULLY_SPECIFIED',0,NULL,NULL,NULL,'f751f376-8919-11e5-8b59-08002715d519'),(124,58,'capsule(s)','en',0,1,'2015-11-12 08:47:12','SHORT',0,NULL,NULL,NULL,'f752d90e-8919-11e5-8b59-08002715d519'),(125,58,'Capsule(s)','en',1,1,'2015-11-12 08:47:12','FULLY_SPECIFIED',0,NULL,NULL,NULL,'f752dbcb-8919-11e5-8b59-08002715d519'),(126,59,'tablet(s)','en',0,1,'2015-11-12 08:47:12','SHORT',0,NULL,NULL,NULL,'f753865e-8919-11e5-8b59-08002715d519'),(127,59,'Tablet(s)','en',1,1,'2015-11-12 08:47:12','FULLY_SPECIFIED',0,NULL,NULL,NULL,'f7538939-8919-11e5-8b59-08002715d519'),(128,60,'teaspoon','en',0,1,'2015-11-12 08:47:12','SHORT',0,NULL,NULL,NULL,'f7541579-8919-11e5-8b59-08002715d519'),(129,60,'Teaspoon','en',1,1,'2015-11-12 08:47:12','FULLY_SPECIFIED',0,NULL,NULL,NULL,'f75417f5-8919-11e5-8b59-08002715d519'),(130,61,'tablespoon','en',0,1,'2015-11-12 08:47:12','SHORT',0,NULL,NULL,NULL,'f7550933-8919-11e5-8b59-08002715d519'),(131,61,'Tablespoon','en',1,1,'2015-11-12 08:47:12','FULLY_SPECIFIED',0,NULL,NULL,NULL,'f7550ce8-8919-11e5-8b59-08002715d519'),(132,62,'drop','en',0,1,'2015-11-12 08:47:12','SHORT',0,NULL,NULL,NULL,'f755b911-8919-11e5-8b59-08002715d519'),(133,62,'Drop','en',1,1,'2015-11-12 08:47:12','FULLY_SPECIFIED',0,NULL,NULL,NULL,'f755bbd0-8919-11e5-8b59-08002715d519'),(134,63,'ml','en',0,1,'2015-11-12 08:47:12','SHORT',0,NULL,NULL,NULL,'f7565c45-8919-11e5-8b59-08002715d519'),(135,63,'ml','en',1,1,'2015-11-12 08:47:12','FULLY_SPECIFIED',0,NULL,NULL,NULL,'f7565f7e-8919-11e5-8b59-08002715d519'),(136,64,'mg','en',0,1,'2015-11-12 08:47:12','SHORT',0,NULL,NULL,NULL,'f756f456-8919-11e5-8b59-08002715d519'),(137,64,'mg','en',1,1,'2015-11-12 08:47:12','FULLY_SPECIFIED',0,NULL,NULL,NULL,'f756f725-8919-11e5-8b59-08002715d519'),(138,65,'drug routes','en',0,1,'2015-11-12 08:47:12','SHORT',0,NULL,NULL,NULL,'f75ad136-8919-11e5-8b59-08002715d519'),(139,65,'Drug Routes','en',1,1,'2015-11-12 08:47:12','FULLY_SPECIFIED',0,NULL,NULL,NULL,'f75ad46f-8919-11e5-8b59-08002715d519'),(140,66,'IM','en',0,1,'2015-11-12 08:47:12','SHORT',0,NULL,NULL,NULL,'f75bc777-8919-11e5-8b59-08002715d519'),(141,66,'Intramuscular','en',1,1,'2015-11-12 08:47:12','FULLY_SPECIFIED',0,NULL,NULL,NULL,'f75bcb69-8919-11e5-8b59-08002715d519'),(142,67,'IV','en',0,1,'2015-11-12 08:47:12','SHORT',0,NULL,NULL,NULL,'f75c6188-8919-11e5-8b59-08002715d519'),(143,67,'Intravenous','en',1,1,'2015-11-12 08:47:12','FULLY_SPECIFIED',0,NULL,NULL,NULL,'f75c6406-8919-11e5-8b59-08002715d519'),(144,68,'PO','en',0,1,'2015-11-12 08:47:12','SHORT',0,NULL,NULL,NULL,'f75cf71b-8919-11e5-8b59-08002715d519'),(145,68,'Oral','en',1,1,'2015-11-12 08:47:12','FULLY_SPECIFIED',0,NULL,NULL,NULL,'f75cf9f8-8919-11e5-8b59-08002715d519'),(146,69,'PV','en',0,1,'2015-11-12 08:47:12','SHORT',0,NULL,NULL,NULL,'f75e02c4-8919-11e5-8b59-08002715d519'),(147,69,'Per Vaginal','en',1,1,'2015-11-12 08:47:12','FULLY_SPECIFIED',0,NULL,NULL,NULL,'f75e05fd-8919-11e5-8b59-08002715d519'),(148,70,'SC','en',0,1,'2015-11-12 08:47:12','SHORT',0,NULL,NULL,NULL,'f75ebe6c-8919-11e5-8b59-08002715d519'),(149,70,'Sub Cutaneous','en',1,1,'2015-11-12 08:47:12','FULLY_SPECIFIED',0,NULL,NULL,NULL,'f75ec157-8919-11e5-8b59-08002715d519'),(150,71,'PR','en',0,1,'2015-11-12 08:47:12','SHORT',0,NULL,NULL,NULL,'f75f6f94-8919-11e5-8b59-08002715d519'),(151,71,'Per Rectum','en',1,1,'2015-11-12 08:47:12','FULLY_SPECIFIED',0,NULL,NULL,NULL,'f75f724e-8919-11e5-8b59-08002715d519'),(152,72,'SL','en',0,1,'2015-11-12 08:47:12','SHORT',0,NULL,NULL,NULL,'f7601eeb-8919-11e5-8b59-08002715d519'),(153,72,'Sub Lingual','en',1,1,'2015-11-12 08:47:12','FULLY_SPECIFIED',0,NULL,NULL,NULL,'f760216e-8919-11e5-8b59-08002715d519'),(156,74,'NG','en',0,1,'2015-11-12 08:47:12','SHORT',0,NULL,NULL,NULL,'f761a3c5-8919-11e5-8b59-08002715d519'),(157,74,'Nasogastric','en',1,1,'2015-11-12 08:47:12','FULLY_SPECIFIED',0,NULL,NULL,NULL,'f761a696-8919-11e5-8b59-08002715d519'),(158,75,'duration units','en',0,1,'2015-11-12 08:47:12','SHORT',0,NULL,NULL,NULL,'f7646157-8919-11e5-8b59-08002715d519'),(159,75,'Duration Units','en',1,1,'2015-11-12 08:47:12','FULLY_SPECIFIED',0,NULL,NULL,NULL,'f7646464-8919-11e5-8b59-08002715d519'),(160,76,'day(s)','en',0,1,'2015-11-12 08:47:12','SHORT',0,NULL,NULL,NULL,'f7653ef0-8919-11e5-8b59-08002715d519'),(161,76,'Day(s)','en',1,1,'2015-11-12 08:47:12','FULLY_SPECIFIED',0,NULL,NULL,NULL,'f7654339-8919-11e5-8b59-08002715d519'),(162,77,'OD','en',0,1,'2015-11-12 08:47:12','SHORT',0,NULL,NULL,NULL,'f7681995-8919-11e5-8b59-08002715d519'),(163,77,'Once a day','en',1,1,'2015-11-12 08:47:12','FULLY_SPECIFIED',0,NULL,NULL,NULL,'f7681dd9-8919-11e5-8b59-08002715d519'),(164,78,'BD','en',0,1,'2015-11-12 08:47:12','SHORT',0,NULL,NULL,NULL,'f769312f-8919-11e5-8b59-08002715d519'),(165,78,'Twice a day','en',1,1,'2015-11-12 08:47:12','FULLY_SPECIFIED',0,NULL,NULL,NULL,'f76933f4-8919-11e5-8b59-08002715d519'),(166,79,'TDS','en',0,1,'2015-11-12 08:47:12','SHORT',0,NULL,NULL,NULL,'f769e335-8919-11e5-8b59-08002715d519'),(167,79,'Thrice a day','en',1,1,'2015-11-12 08:47:12','FULLY_SPECIFIED',0,NULL,NULL,NULL,'f769e5c7-8919-11e5-8b59-08002715d519'),(168,80,'QDS','en',0,1,'2015-11-12 08:47:12','SHORT',0,NULL,NULL,NULL,'f76ab2b1-8919-11e5-8b59-08002715d519'),(169,80,'Four times a day','en',1,1,'2015-11-12 08:47:12','FULLY_SPECIFIED',0,NULL,NULL,NULL,'f76ab539-8919-11e5-8b59-08002715d519'),(170,81,'Dosing Instructions','en',0,1,'2015-11-12 08:47:12','SHORT',0,NULL,NULL,NULL,'f76d30a8-8919-11e5-8b59-08002715d519'),(171,81,'Dosing Instructions','en',1,1,'2015-11-12 08:47:12','FULLY_SPECIFIED',0,NULL,NULL,NULL,'f76d33f7-8919-11e5-8b59-08002715d519'),(172,82,'ac','en',0,1,'2015-11-12 08:47:12','SHORT',0,NULL,NULL,NULL,'f76dfee2-8919-11e5-8b59-08002715d519'),(173,82,'Before meals','en',1,1,'2015-11-12 08:47:12','FULLY_SPECIFIED',0,NULL,NULL,NULL,'f76e017e-8919-11e5-8b59-08002715d519'),(174,83,'','en',0,1,'2015-11-12 08:47:12','SHORT',0,NULL,NULL,NULL,'f76eb3c5-8919-11e5-8b59-08002715d519'),(175,83,'Empty stomach','en',1,1,'2015-11-12 08:47:12','FULLY_SPECIFIED',0,NULL,NULL,NULL,'f76eb7ca-8919-11e5-8b59-08002715d519'),(176,84,'pc','en',0,1,'2015-11-12 08:47:12','SHORT',0,NULL,NULL,NULL,'f76f4908-8919-11e5-8b59-08002715d519'),(177,84,'After meals','en',1,1,'2015-11-12 08:47:12','FULLY_SPECIFIED',0,NULL,NULL,NULL,'f76f4c63-8919-11e5-8b59-08002715d519'),(178,85,'cm','en',0,1,'2015-11-12 08:47:12','SHORT',0,NULL,NULL,NULL,'f7705ce5-8919-11e5-8b59-08002715d519'),(179,85,'In the morning','en',1,1,'2015-11-12 08:47:12','FULLY_SPECIFIED',0,NULL,NULL,NULL,'f7705f7e-8919-11e5-8b59-08002715d519'),(180,86,'','en',0,1,'2015-11-12 08:47:12','SHORT',0,NULL,NULL,NULL,'f770ee52-8919-11e5-8b59-08002715d519'),(181,86,'In the evening','en',1,1,'2015-11-12 08:47:12','FULLY_SPECIFIED',0,NULL,NULL,NULL,'f770f211-8919-11e5-8b59-08002715d519'),(182,87,'hs','en',0,1,'2015-11-12 08:47:12','SHORT',0,NULL,NULL,NULL,'f7718055-8919-11e5-8b59-08002715d519'),(183,87,'At bedtime','en',1,1,'2015-11-12 08:47:12','FULLY_SPECIFIED',0,NULL,NULL,NULL,'f77182c5-8919-11e5-8b59-08002715d519'),(184,88,'STAT','en',0,1,'2015-11-12 08:47:12','SHORT',0,NULL,NULL,NULL,'f7720de2-8919-11e5-8b59-08002715d519'),(185,88,'Immediately','en',1,1,'2015-11-12 08:47:12','FULLY_SPECIFIED',0,NULL,NULL,NULL,'f772108f-8919-11e5-8b59-08002715d519'),(186,89,'','en',0,1,'2015-11-12 08:47:12','SHORT',0,NULL,NULL,NULL,'f7729b76-8919-11e5-8b59-08002715d519'),(187,89,'As directed','en',1,1,'2015-11-12 08:47:12','FULLY_SPECIFIED',0,NULL,NULL,NULL,'f7729de9-8919-11e5-8b59-08002715d519'),(188,90,'All Observation templates','en',0,1,'2015-11-12 08:47:12','SHORT',0,NULL,NULL,NULL,'f774cea4-8919-11e5-8b59-08002715d519'),(189,90,'All Observation Templates','en',1,1,'2015-11-12 08:47:12','FULLY_SPECIFIED',0,NULL,NULL,NULL,'f774d307-8919-11e5-8b59-08002715d519'),(190,91,'LAB_REPORT','en',0,1,'2015-11-12 08:48:17','SHORT',0,NULL,NULL,NULL,'1e2626a9-891a-11e5-8b59-08002715d519'),(191,91,'LAB_REPORT','en',1,1,'2015-11-12 08:48:17','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1e2629f9-891a-11e5-8b59-08002715d519'),(192,92,'hour(s)','en',0,1,'2015-11-12 08:48:17','SHORT',0,NULL,NULL,NULL,'1e3bdaec-891a-11e5-8b59-08002715d519'),(193,92,'Hour(s)','en',1,1,'2015-11-12 08:48:17','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1e3bdded-891a-11e5-8b59-08002715d519'),(194,93,'week(s)','en',0,1,'2015-11-12 08:48:17','SHORT',0,NULL,NULL,NULL,'1e3d19dd-891a-11e5-8b59-08002715d519'),(195,93,'Week(s)','en',1,1,'2015-11-12 08:48:17','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1e3d1c6b-891a-11e5-8b59-08002715d519'),(196,94,'month(s)','en',0,1,'2015-11-12 08:48:17','SHORT',0,NULL,NULL,NULL,'1e3e33a9-891a-11e5-8b59-08002715d519'),(197,94,'Month(s)','en',1,1,'2015-11-12 08:48:17','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1e3e3663-891a-11e5-8b59-08002715d519'),(198,95,'Impression','en',0,1,'2015-11-12 08:48:17','SHORT',0,NULL,NULL,NULL,'1e5c92b0-891a-11e5-8b59-08002715d519'),(199,95,'Impression','en',1,1,'2015-11-12 08:48:17','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1e5c9594-891a-11e5-8b59-08002715d519'),(200,96,'All Disease Templates','en',0,1,'2015-11-12 08:48:17','SHORT',0,NULL,NULL,NULL,'1e73d584-891a-11e5-8b59-08002715d519'),(201,96,'All Disease Templates','en',1,1,'2015-11-12 08:48:17','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1e73d9c7-891a-11e5-8b59-08002715d519'),(202,97,'','en',0,1,'2015-11-12 08:48:17','SHORT',0,NULL,NULL,NULL,'1e759a73-891a-11e5-8b59-08002715d519'),(203,97,'IU','en',1,1,'2015-11-12 08:48:17','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1e759d30-891a-11e5-8b59-08002715d519'),(204,98,'unit(s)','en',0,1,'2015-11-12 08:48:17','SHORT',0,NULL,NULL,NULL,'1e7648e4-891a-11e5-8b59-08002715d519'),(205,98,'Unit(s)','en',1,1,'2015-11-12 08:48:17','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1e764c28-891a-11e5-8b59-08002715d519'),(206,99,'QH','en',0,1,'2015-11-12 08:48:17','SHORT',0,NULL,NULL,NULL,'1e787d26-891a-11e5-8b59-08002715d519'),(207,99,'Every Hour','en',1,1,'2015-11-12 08:48:17','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1e787fd1-891a-11e5-8b59-08002715d519'),(208,100,'Q2H','en',0,1,'2015-11-12 08:48:17','SHORT',0,NULL,NULL,NULL,'1e79503e-891a-11e5-8b59-08002715d519'),(209,100,'Every 2 hours','en',1,1,'2015-11-12 08:48:17','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1e7952d9-891a-11e5-8b59-08002715d519'),(210,101,'Q3H','en',0,1,'2015-11-12 08:48:17','SHORT',0,NULL,NULL,NULL,'1e7a80e0-891a-11e5-8b59-08002715d519'),(211,101,'Every 3 hours','en',1,1,'2015-11-12 08:48:17','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1e7af311-891a-11e5-8b59-08002715d519'),(212,102,'Q4H','en',0,1,'2015-11-12 08:48:17','SHORT',0,NULL,NULL,NULL,'1e7bfecf-891a-11e5-8b59-08002715d519'),(213,102,'Every 4 hours','en',1,1,'2015-11-12 08:48:17','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1e7c0162-891a-11e5-8b59-08002715d519'),(214,103,'Q6H','en',0,1,'2015-11-12 08:48:17','SHORT',0,NULL,NULL,NULL,'1e7cc30e-891a-11e5-8b59-08002715d519'),(215,103,'Every 6 hours','en',1,1,'2015-11-12 08:48:17','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1e7cc58d-891a-11e5-8b59-08002715d519'),(216,104,'Q8H','en',0,1,'2015-11-12 08:48:17','SHORT',0,NULL,NULL,NULL,'1e7d643f-891a-11e5-8b59-08002715d519'),(217,104,'Every 8 hours','en',1,1,'2015-11-12 08:48:17','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1e7d66b5-891a-11e5-8b59-08002715d519'),(218,105,'Q12H','en',0,1,'2015-11-12 08:48:17','SHORT',0,NULL,NULL,NULL,'1e7e44f3-891a-11e5-8b59-08002715d519'),(219,105,'Every 12 hours','en',1,1,'2015-11-12 08:48:17','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1e7e47d3-891a-11e5-8b59-08002715d519'),(220,106,'A/D','en',0,1,'2015-11-12 08:48:17','SHORT',0,NULL,NULL,NULL,'1e7ef265-891a-11e5-8b59-08002715d519'),(221,106,'On alternate days','en',1,1,'2015-11-12 08:48:17','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1e7ef4ee-891a-11e5-8b59-08002715d519'),(222,107,'','en',0,1,'2015-11-12 08:48:17','SHORT',0,NULL,NULL,NULL,'1e7fc262-891a-11e5-8b59-08002715d519'),(223,107,'Once a week','en',1,1,'2015-11-12 08:48:17','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1e7fc56f-891a-11e5-8b59-08002715d519'),(224,108,'','en',0,1,'2015-11-12 08:48:17','SHORT',0,NULL,NULL,NULL,'1e80841c-891a-11e5-8b59-08002715d519'),(225,108,'Twice a week','en',1,1,'2015-11-12 08:48:17','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1e8086d8-891a-11e5-8b59-08002715d519'),(226,109,'','en',0,1,'2015-11-12 08:48:17','SHORT',0,NULL,NULL,NULL,'1e816f59-891a-11e5-8b59-08002715d519'),(227,109,'Thrice a week','en',1,1,'2015-11-12 08:48:17','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1e81720e-891a-11e5-8b59-08002715d519'),(228,110,'','en',0,1,'2015-11-12 08:48:17','SHORT',0,NULL,NULL,NULL,'1e8207d9-891a-11e5-8b59-08002715d519'),(229,110,'Every 2 weeks','en',1,1,'2015-11-12 08:48:17','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1e820a79-891a-11e5-8b59-08002715d519'),(230,111,'','en',0,1,'2015-11-12 08:48:17','SHORT',0,NULL,NULL,NULL,'1e82b7fa-891a-11e5-8b59-08002715d519'),(231,111,'Every 3 weeks','en',1,1,'2015-11-12 08:48:17','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1e82ba8e-891a-11e5-8b59-08002715d519'),(232,112,'','en',0,1,'2015-11-12 08:48:17','SHORT',0,NULL,NULL,NULL,'1e835d00-891a-11e5-8b59-08002715d519'),(233,112,'Once a month','en',1,1,'2015-11-12 08:48:17','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1e835f94-891a-11e5-8b59-08002715d519'),(234,113,'ID','en',0,1,'2015-11-12 08:48:17','SHORT',0,NULL,NULL,NULL,'1e85d91e-891a-11e5-8b59-08002715d519'),(235,113,'Intradermal','en',1,1,'2015-11-12 08:48:17','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1e85de8f-891a-11e5-8b59-08002715d519'),(236,114,'IP','en',0,1,'2015-11-12 08:48:17','SHORT',0,NULL,NULL,NULL,'1e867551-891a-11e5-8b59-08002715d519'),(237,114,'Intraperitoneal','en',1,1,'2015-11-12 08:48:17','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1e8678f7-891a-11e5-8b59-08002715d519'),(238,115,'IT','en',0,1,'2015-11-12 08:48:17','SHORT',0,NULL,NULL,NULL,'1e870f63-891a-11e5-8b59-08002715d519'),(239,115,'Intrathecal','en',1,1,'2015-11-12 08:48:17','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1e871205-891a-11e5-8b59-08002715d519'),(240,116,'IO','en',0,1,'2015-11-12 08:48:17','SHORT',0,NULL,NULL,NULL,'1e879f28-891a-11e5-8b59-08002715d519'),(241,116,'Intraosseous','en',1,1,'2015-11-12 08:48:17','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1e87a1cb-891a-11e5-8b59-08002715d519'),(242,117,'tablet','en',0,1,'2015-11-12 08:48:18','SHORT',0,NULL,NULL,NULL,NULL),(243,117,'Tablet','en',1,1,'2015-11-12 08:48:18','FULLY_SPECIFIED',0,NULL,NULL,NULL,NULL),(244,118,'capsule','en',0,1,'2015-11-12 08:48:18','SHORT',0,NULL,NULL,NULL,NULL),(245,118,'Capsule','en',1,1,'2015-11-12 08:48:18','FULLY_SPECIFIED',0,NULL,NULL,NULL,NULL),(246,119,'TOPIC','en',0,1,'2015-11-12 08:48:18','SHORT',0,NULL,NULL,NULL,NULL),(247,119,'Topical','en',1,1,'2015-11-12 08:48:18','FULLY_SPECIFIED',0,NULL,NULL,NULL,NULL),(248,120,'NASAL','en',0,1,'2015-11-12 08:48:18','SHORT',0,NULL,NULL,NULL,NULL),(249,120,'Nasal','en',1,1,'2015-11-12 08:48:18','FULLY_SPECIFIED',0,NULL,NULL,NULL,NULL),(250,121,'RESPIR','en',0,1,'2015-11-12 08:48:18','SHORT',0,NULL,NULL,NULL,NULL),(251,121,'Inhalation','en',1,1,'2015-11-12 08:48:18','FULLY_SPECIFIED',0,NULL,NULL,NULL,NULL),(252,122,'','en',0,1,'2015-11-12 08:48:18','SHORT',0,NULL,NULL,NULL,'1ec34026-891a-11e5-8b59-08002715d519'),(253,122,'Five times a day','en',1,1,'2015-11-12 08:48:18','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1ec343bd-891a-11e5-8b59-08002715d519'),(254,123,'','en',0,1,'2015-11-12 08:48:18','SHORT',0,NULL,NULL,NULL,'1ec421c8-891a-11e5-8b59-08002715d519'),(255,123,'Four days a week','en',1,1,'2015-11-12 08:48:18','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1ec425d5-891a-11e5-8b59-08002715d519'),(256,124,'','en',0,1,'2015-11-12 08:48:18','SHORT',0,NULL,NULL,NULL,'1ec4d627-891a-11e5-8b59-08002715d519'),(257,124,'Five days a week','en',1,1,'2015-11-12 08:48:18','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1ec4d9b3-891a-11e5-8b59-08002715d519'),(258,125,'','en',0,1,'2015-11-12 08:48:18','SHORT',0,NULL,NULL,NULL,'1ec58543-891a-11e5-8b59-08002715d519'),(259,125,'Six days a week','en',1,1,'2015-11-12 08:48:18','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1ec58852-891a-11e5-8b59-08002715d519'),(260,126,'minute(s)','en',0,1,'2015-11-12 08:48:18','SHORT',0,NULL,NULL,NULL,'1ecaec8d-891a-11e5-8b59-08002715d519'),(261,126,'Minute(s)','en',1,1,'2015-11-12 08:48:18','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1ecaeff5-891a-11e5-8b59-08002715d519'),(262,127,'Deny Admission','en',0,1,'2015-11-12 08:48:18','SHORT',0,NULL,NULL,NULL,'1ed0980a-891a-11e5-8b59-08002715d519'),(263,127,'Deny Admission','en',1,1,'2015-11-12 08:48:18','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1ed09b56-891a-11e5-8b59-08002715d519'),(264,128,'Order Attributes','en',0,1,'2015-11-12 08:48:18','SHORT',0,NULL,NULL,NULL,'1ed529af-891a-11e5-8b59-08002715d519'),(265,128,'Order Attributes','en',1,1,'2015-11-12 08:48:18','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1ed52d57-891a-11e5-8b59-08002715d519'),(266,129,'Undo Discharge','en',0,1,'2015-11-12 08:48:18','SHORT',0,NULL,NULL,NULL,'1edb2285-891a-11e5-8b59-08002715d519'),(267,129,'Undo Discharge','en',1,1,'2015-11-12 08:48:18','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1edb25d4-891a-11e5-8b59-08002715d519'),(268,130,'D','en',0,1,'2015-11-12 08:48:18','SHORT',0,NULL,NULL,NULL,'1ee0e96b-891a-11e5-8b59-08002715d519'),(269,130,'Dispensed','en',1,1,'2015-11-12 08:48:18','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1ee0ef22-891a-11e5-8b59-08002715d519'),(270,131,'All Orderables','en',0,1,'2015-11-12 08:48:18','SHORT',0,NULL,NULL,NULL,'1ef02d35-891a-11e5-8b59-08002715d519'),(271,131,'All Orderables','en',1,1,'2015-11-12 08:48:18','FULLY_SPECIFIED',0,NULL,NULL,NULL,'1ef0306e-891a-11e5-8b59-08002715d519'),(272,3,'Laboratory','en',0,1,'2015-11-12 08:48:18','SHORT',0,NULL,NULL,NULL,'1ef22e17-891a-11e5-8b59-08002715d519');
/*!40000 ALTER TABLE `concept_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_name_tag`
--

DROP TABLE IF EXISTS `concept_name_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_name_tag` (
  `concept_name_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(50) NOT NULL,
  `description` text,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`concept_name_tag_id`),
  UNIQUE KEY `concept_name_tag_unique_tags` (`tag`),
  UNIQUE KEY `concept_name_tag_uuid_index` (`uuid`),
  KEY `user_who_created_name_tag` (`creator`),
  KEY `user_who_voided_name_tag` (`voided_by`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_name_tag`
--

LOCK TABLES `concept_name_tag` WRITE;
/*!40000 ALTER TABLE `concept_name_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_name_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_name_tag_map`
--

DROP TABLE IF EXISTS `concept_name_tag_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_name_tag_map` (
  `concept_name_id` int(11) NOT NULL,
  `concept_name_tag_id` int(11) NOT NULL,
  KEY `mapped_concept_name` (`concept_name_id`),
  KEY `mapped_concept_name_tag` (`concept_name_tag_id`),
  CONSTRAINT `mapped_concept_name` FOREIGN KEY (`concept_name_id`) REFERENCES `concept_name` (`concept_name_id`),
  CONSTRAINT `mapped_concept_name_tag` FOREIGN KEY (`concept_name_tag_id`) REFERENCES `concept_name_tag` (`concept_name_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_name_tag_map`
--

LOCK TABLES `concept_name_tag_map` WRITE;
/*!40000 ALTER TABLE `concept_name_tag_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_name_tag_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_numeric`
--

DROP TABLE IF EXISTS `concept_numeric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_numeric` (
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `hi_absolute` double DEFAULT NULL,
  `hi_critical` double DEFAULT NULL,
  `hi_normal` double DEFAULT NULL,
  `low_absolute` double DEFAULT NULL,
  `low_critical` double DEFAULT NULL,
  `low_normal` double DEFAULT NULL,
  `units` varchar(50) DEFAULT NULL,
  `precise` tinyint(1) NOT NULL DEFAULT '0',
  `display_precision` int(11) DEFAULT NULL,
  PRIMARY KEY (`concept_id`),
  CONSTRAINT `numeric_attributes` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_numeric`
--

LOCK TABLES `concept_numeric` WRITE;
/*!40000 ALTER TABLE `concept_numeric` DISABLE KEYS */;
INSERT INTO `concept_numeric` VALUES (39,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(40,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `concept_numeric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_proposal`
--

DROP TABLE IF EXISTS `concept_proposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_proposal` (
  `concept_proposal_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) DEFAULT NULL,
  `encounter_id` int(11) DEFAULT NULL,
  `original_text` varchar(255) NOT NULL DEFAULT '',
  `final_text` varchar(255) DEFAULT NULL,
  `obs_id` int(11) DEFAULT NULL,
  `obs_concept_id` int(11) DEFAULT NULL,
  `state` varchar(32) NOT NULL DEFAULT 'UNMAPPED',
  `comments` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `locale` varchar(50) NOT NULL DEFAULT '',
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`concept_proposal_id`),
  UNIQUE KEY `concept_proposal_uuid_index` (`uuid`),
  KEY `user_who_changed_proposal` (`changed_by`),
  KEY `concept_for_proposal` (`concept_id`),
  KEY `user_who_created_proposal` (`creator`),
  KEY `encounter_for_proposal` (`encounter_id`),
  KEY `proposal_obs_concept_id` (`obs_concept_id`),
  KEY `proposal_obs_id` (`obs_id`),
  CONSTRAINT `concept_for_proposal` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `encounter_for_proposal` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `proposal_obs_concept_id` FOREIGN KEY (`obs_concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `proposal_obs_id` FOREIGN KEY (`obs_id`) REFERENCES `obs` (`obs_id`),
  CONSTRAINT `user_who_changed_proposal` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_created_proposal` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_proposal`
--

LOCK TABLES `concept_proposal` WRITE;
/*!40000 ALTER TABLE `concept_proposal` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_proposal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_proposal_tag_map`
--

DROP TABLE IF EXISTS `concept_proposal_tag_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_proposal_tag_map` (
  `concept_proposal_id` int(11) NOT NULL,
  `concept_name_tag_id` int(11) NOT NULL,
  KEY `mapped_concept_proposal_tag` (`concept_name_tag_id`),
  KEY `mapped_concept_proposal` (`concept_proposal_id`),
  CONSTRAINT `mapped_concept_proposal` FOREIGN KEY (`concept_proposal_id`) REFERENCES `concept_proposal` (`concept_proposal_id`),
  CONSTRAINT `mapped_concept_proposal_tag` FOREIGN KEY (`concept_name_tag_id`) REFERENCES `concept_name_tag` (`concept_name_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_proposal_tag_map`
--

LOCK TABLES `concept_proposal_tag_map` WRITE;
/*!40000 ALTER TABLE `concept_proposal_tag_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_proposal_tag_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_reference_map`
--

DROP TABLE IF EXISTS `concept_reference_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_reference_map` (
  `concept_map_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_reference_term_id` int(11) NOT NULL,
  `concept_map_type_id` int(11) NOT NULL DEFAULT '1',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`concept_map_id`),
  KEY `map_for_concept` (`concept_id`),
  KEY `map_creator` (`creator`),
  KEY `mapped_concept_map_type` (`concept_map_type_id`),
  KEY `mapped_user_changed_ref_term` (`changed_by`),
  KEY `mapped_concept_reference_term` (`concept_reference_term_id`),
  CONSTRAINT `map_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `map_for_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `mapped_concept_map_type` FOREIGN KEY (`concept_map_type_id`) REFERENCES `concept_map_type` (`concept_map_type_id`),
  CONSTRAINT `mapped_concept_reference_term` FOREIGN KEY (`concept_reference_term_id`) REFERENCES `concept_reference_term` (`concept_reference_term_id`),
  CONSTRAINT `mapped_user_changed_ref_term` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_reference_map`
--

LOCK TABLES `concept_reference_map` WRITE;
/*!40000 ALTER TABLE `concept_reference_map` DISABLE KEYS */;
INSERT INTO `concept_reference_map` VALUES (1,1,1,1,'2015-11-12 08:45:01',13,NULL,NULL,'a9358ec6-8919-11e5-8b59-08002715d519'),(2,2,1,1,'2015-11-12 08:45:01',14,NULL,NULL,'a9366c6a-8919-11e5-8b59-08002715d519'),(3,3,1,1,'2015-11-12 08:45:01',15,NULL,NULL,'a9371b69-8919-11e5-8b59-08002715d519'),(4,4,1,1,'2015-11-12 08:45:01',16,NULL,NULL,'a937d14a-8919-11e5-8b59-08002715d519'),(5,5,1,1,'2015-11-12 08:45:01',17,NULL,NULL,'a938c434-8919-11e5-8b59-08002715d519'),(6,6,1,1,'2015-11-12 08:45:01',18,NULL,NULL,'a93944ee-8919-11e5-8b59-08002715d519'),(7,7,1,1,'2015-11-12 08:45:01',19,NULL,NULL,'a93a2732-8919-11e5-8b59-08002715d519'),(8,8,1,1,'2015-11-12 08:45:01',20,NULL,NULL,'a93ac70a-8919-11e5-8b59-08002715d519'),(9,9,1,1,'2015-11-12 08:45:01',21,NULL,NULL,'a93b47e1-8919-11e5-8b59-08002715d519'),(10,10,1,1,'2015-11-12 08:45:01',22,NULL,NULL,'a93e2992-8919-11e5-8b59-08002715d519'),(11,11,1,1,'2015-11-12 08:45:01',23,NULL,NULL,'a93ee0f8-8919-11e5-8b59-08002715d519'),(12,12,1,1,'2015-11-12 08:45:01',24,NULL,NULL,'a93f87fd-8919-11e5-8b59-08002715d519'),(13,13,1,1,'2015-11-12 08:45:01',25,NULL,NULL,'a94014fd-8919-11e5-8b59-08002715d519'),(14,14,1,1,'2015-11-12 08:45:01',26,NULL,NULL,'a941272f-8919-11e5-8b59-08002715d519'),(15,15,1,1,'2015-11-12 08:45:01',27,NULL,NULL,'a942016a-8919-11e5-8b59-08002715d519'),(16,18,1,1,'2015-11-12 08:48:17',92,NULL,NULL,NULL),(17,19,1,1,'2015-11-12 08:48:17',76,NULL,NULL,NULL),(18,20,1,1,'2015-11-12 08:48:17',93,NULL,NULL,NULL),(19,21,1,1,'2015-11-12 08:48:17',94,NULL,NULL,NULL),(20,17,1,1,'2015-11-12 08:48:18',126,NULL,NULL,NULL),(21,24,1,1,'2015-11-12 08:48:18',29,NULL,NULL,NULL),(22,25,1,1,'2015-11-12 08:48:18',127,NULL,NULL,NULL),(23,26,1,1,'2015-11-12 08:48:18',129,NULL,NULL,'1edb9a64-891a-11e5-8b59-08002715d519');
/*!40000 ALTER TABLE `concept_reference_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_reference_source`
--

DROP TABLE IF EXISTS `concept_reference_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_reference_source` (
  `concept_source_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `hl7_code` varchar(50) DEFAULT '',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`concept_source_id`),
  UNIQUE KEY `concept_source_unique_hl7_codes` (`hl7_code`),
  KEY `unique_hl7_code` (`hl7_code`),
  KEY `concept_source_creator` (`creator`),
  KEY `user_who_retired_concept_source` (`retired_by`),
  CONSTRAINT `concept_source_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_concept_source` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_reference_source`
--

LOCK TABLES `concept_reference_source` WRITE;
/*!40000 ALTER TABLE `concept_reference_source` DISABLE KEYS */;
INSERT INTO `concept_reference_source` VALUES (1,'org.openmrs.module.emrapi','Source used to tag concepts used in the EMR API module','',1,'2015-11-12 08:43:50',0,NULL,NULL,NULL,'7eea953a-8919-11e5-8b59-08002715d519'),(2,'SNOMED','SNOMED Duration Source','SCT',1,'2015-11-12 08:48:17',0,NULL,NULL,NULL,'1e29bded-891a-11e5-8b59-08002715d519');
/*!40000 ALTER TABLE `concept_reference_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_reference_term`
--

DROP TABLE IF EXISTS `concept_reference_term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_reference_term` (
  `concept_reference_term_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_source_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `version` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_reference_term_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `mapped_user_creator` (`creator`),
  KEY `mapped_user_changed` (`changed_by`),
  KEY `mapped_user_retired` (`retired_by`),
  KEY `mapped_concept_source` (`concept_source_id`),
  KEY `idx_code_concept_reference_term` (`code`),
  CONSTRAINT `mapped_concept_source` FOREIGN KEY (`concept_source_id`) REFERENCES `concept_reference_source` (`concept_source_id`),
  CONSTRAINT `mapped_user_changed` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `mapped_user_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `mapped_user_retired` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_reference_term`
--

LOCK TABLES `concept_reference_term` WRITE;
/*!40000 ALTER TABLE `concept_reference_term` DISABLE KEYS */;
INSERT INTO `concept_reference_term` VALUES (1,1,NULL,'Diagnosis Concept Set',NULL,NULL,1,'2015-11-12 08:45:01',NULL,NULL,0,NULL,NULL,NULL,'a9358aed-8919-11e5-8b59-08002715d519'),(2,1,NULL,'Non-Coded Diagnosis',NULL,NULL,1,'2015-11-12 08:45:01',NULL,NULL,0,NULL,NULL,NULL,'a936678b-8919-11e5-8b59-08002715d519'),(3,1,NULL,'Coded Diagnosis',NULL,NULL,1,'2015-11-12 08:45:01',NULL,NULL,0,NULL,NULL,NULL,'a937182d-8919-11e5-8b59-08002715d519'),(4,1,NULL,'Diagnosis Certainty',NULL,NULL,1,'2015-11-12 08:45:01',NULL,NULL,0,NULL,NULL,NULL,'a937cd74-8919-11e5-8b59-08002715d519'),(5,1,NULL,'Presumed',NULL,NULL,1,'2015-11-12 08:45:01',NULL,NULL,0,NULL,NULL,NULL,'a938c07f-8919-11e5-8b59-08002715d519'),(6,1,NULL,'Confirmed',NULL,NULL,1,'2015-11-12 08:45:01',NULL,NULL,0,NULL,NULL,NULL,'a9394193-8919-11e5-8b59-08002715d519'),(7,1,NULL,'Diagnosis Order',NULL,NULL,1,'2015-11-12 08:45:01',NULL,NULL,0,NULL,NULL,NULL,'a93a23de-8919-11e5-8b59-08002715d519'),(8,1,NULL,'Secondary',NULL,NULL,1,'2015-11-12 08:45:01',NULL,NULL,0,NULL,NULL,NULL,'a93ac3c2-8919-11e5-8b59-08002715d519'),(9,1,NULL,'Primary',NULL,NULL,1,'2015-11-12 08:45:01',NULL,NULL,0,NULL,NULL,NULL,'a93b448a-8919-11e5-8b59-08002715d519'),(10,1,NULL,'ADMIT',NULL,NULL,1,'2015-11-12 08:45:01',NULL,NULL,0,NULL,NULL,NULL,'a93e25e1-8919-11e5-8b59-08002715d519'),(11,1,NULL,'DISCHARGE',NULL,NULL,1,'2015-11-12 08:45:01',NULL,NULL,0,NULL,NULL,NULL,'a93edd8e-8919-11e5-8b59-08002715d519'),(12,1,NULL,'TRANSFER',NULL,NULL,1,'2015-11-12 08:45:01',NULL,NULL,0,NULL,NULL,NULL,'a93f8444-8919-11e5-8b59-08002715d519'),(13,1,NULL,'Disposition',NULL,NULL,1,'2015-11-12 08:45:01',NULL,NULL,0,NULL,NULL,NULL,'a94011ac-8919-11e5-8b59-08002715d519'),(14,1,NULL,'Disposition Concept Set',NULL,NULL,1,'2015-11-12 08:45:01',NULL,NULL,0,NULL,NULL,NULL,'a94123a2-8919-11e5-8b59-08002715d519'),(15,1,NULL,'DispositionNote',NULL,NULL,1,'2015-11-12 08:45:01',NULL,NULL,0,NULL,NULL,NULL,'a941fd48-8919-11e5-8b59-08002715d519'),(16,2,'Second(s)','257997001',NULL,'Duration in Second(s)',1,'2015-11-12 08:48:17',NULL,NULL,0,NULL,NULL,NULL,'1e2baccb-891a-11e5-8b59-08002715d519'),(17,2,'Minute(s)','258701004',NULL,'Duration in Minute(s)',1,'2015-11-12 08:48:17',NULL,NULL,0,NULL,NULL,NULL,'1e2da8e2-891a-11e5-8b59-08002715d519'),(18,2,'Hour(s)','258702006',NULL,'Duration in Hour(s)',1,'2015-11-12 08:48:17',NULL,NULL,0,NULL,NULL,NULL,'1e2f98f1-891a-11e5-8b59-08002715d519'),(19,2,'Day(s)','258703001',NULL,'Duration in Day(s)',1,'2015-11-12 08:48:17',NULL,NULL,0,NULL,NULL,NULL,'1e3137fb-891a-11e5-8b59-08002715d519'),(20,2,'Week(s)','258705008',NULL,'Duration in Week(s)',1,'2015-11-12 08:48:17',NULL,NULL,0,NULL,NULL,NULL,'1e333923-891a-11e5-8b59-08002715d519'),(21,2,'Month(s)','258706009',NULL,'Duration in Week(s)',1,'2015-11-12 08:48:17',NULL,NULL,0,NULL,NULL,NULL,'1e351b0e-891a-11e5-8b59-08002715d519'),(22,2,'Year(s)','258707000',NULL,'Duration in Year(s)',1,'2015-11-12 08:48:17',NULL,NULL,0,NULL,NULL,NULL,'1e36f797-891a-11e5-8b59-08002715d519'),(23,2,'Time(s)','252109000',NULL,'Duration in Time(s)',1,'2015-11-12 08:48:17',NULL,NULL,0,NULL,NULL,NULL,'1e38d935-891a-11e5-8b59-08002715d519'),(24,1,'Admission Decision','Admission Decision',NULL,'',1,'2015-11-12 08:48:18',NULL,NULL,0,NULL,NULL,NULL,'1ecd66a9-891a-11e5-8b59-08002715d519'),(25,1,'Deny Admission','Deny Admission',NULL,'Deny Admission',1,'2015-11-12 08:48:18',NULL,NULL,0,NULL,NULL,NULL,'1ecff4d5-891a-11e5-8b59-08002715d519'),(26,1,NULL,'UNDO_DISCHARGE',NULL,NULL,1,'2015-11-12 08:48:18',NULL,NULL,0,NULL,NULL,NULL,'1edb96cb-891a-11e5-8b59-08002715d519');
/*!40000 ALTER TABLE `concept_reference_term` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_reference_term_map`
--

DROP TABLE IF EXISTS `concept_reference_term_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_reference_term_map` (
  `concept_reference_term_map_id` int(11) NOT NULL AUTO_INCREMENT,
  `term_a_id` int(11) NOT NULL,
  `term_b_id` int(11) NOT NULL,
  `a_is_to_b_id` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_reference_term_map_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `mapped_term_a` (`term_a_id`),
  KEY `mapped_term_b` (`term_b_id`),
  KEY `mapped_concept_map_type_ref_term_map` (`a_is_to_b_id`),
  KEY `mapped_user_creator_ref_term_map` (`creator`),
  KEY `mapped_user_changed_ref_term_map` (`changed_by`),
  CONSTRAINT `mapped_concept_map_type_ref_term_map` FOREIGN KEY (`a_is_to_b_id`) REFERENCES `concept_map_type` (`concept_map_type_id`),
  CONSTRAINT `mapped_term_a` FOREIGN KEY (`term_a_id`) REFERENCES `concept_reference_term` (`concept_reference_term_id`),
  CONSTRAINT `mapped_term_b` FOREIGN KEY (`term_b_id`) REFERENCES `concept_reference_term` (`concept_reference_term_id`),
  CONSTRAINT `mapped_user_changed_ref_term_map` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `mapped_user_creator_ref_term_map` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_reference_term_map`
--

LOCK TABLES `concept_reference_term_map` WRITE;
/*!40000 ALTER TABLE `concept_reference_term_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_reference_term_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_set`
--

DROP TABLE IF EXISTS `concept_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_set` (
  `concept_set_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `concept_set` int(11) NOT NULL DEFAULT '0',
  `sort_weight` double DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`concept_set_id`),
  UNIQUE KEY `concept_set_uuid_index` (`uuid`),
  KEY `idx_concept_set_concept` (`concept_id`),
  KEY `has_a` (`concept_set`),
  KEY `user_who_created` (`creator`),
  CONSTRAINT `has_a` FOREIGN KEY (`concept_set`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `user_who_created` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_set`
--

LOCK TABLES `concept_set` WRITE;
/*!40000 ALTER TABLE `concept_set` DISABLE KEYS */;
INSERT INTO `concept_set` VALUES (1,14,13,1,1,'2015-11-12 08:45:01','a9368c78-8919-11e5-8b59-08002715d519'),(2,15,13,1,1,'2015-11-12 08:45:01','a9374309-8919-11e5-8b59-08002715d519'),(3,16,13,1,1,'2015-11-12 08:45:01','a93809cd-8919-11e5-8b59-08002715d519'),(4,19,13,1,1,'2015-11-12 08:45:01','a93a471f-8919-11e5-8b59-08002715d519'),(5,25,26,1,1,'2015-11-12 08:45:01','a9415bab-8919-11e5-8b59-08002715d519'),(6,27,26,1,1,'2015-11-12 08:45:01','a9423de6-8919-11e5-8b59-08002715d519'),(7,37,36,1,1,'2015-11-12 08:45:01','a96d2859-8919-11e5-8b59-08002715d519'),(8,38,36,1,1,'2015-11-12 08:45:01','a96dc609-8919-11e5-8b59-08002715d519'),(9,39,36,1,1,'2015-11-12 08:45:01','a96e630b-8919-11e5-8b59-08002715d519'),(10,40,36,1,1,'2015-11-12 08:45:01','a96f08e4-8919-11e5-8b59-08002715d519'),(11,41,36,1,1,'2015-11-12 08:45:01','a96fb5d7-8919-11e5-8b59-08002715d519'),(12,42,36,1,1,'2015-11-12 08:45:01','a97d302a-8919-11e5-8b59-08002715d519'),(13,47,46,1,1,'2015-11-12 08:45:01','a9874028-8919-11e5-8b59-08002715d519'),(15,58,57,2,1,'2015-11-12 08:47:12','f7535500-8919-11e5-8b59-08002715d519'),(16,59,57,1,1,'2015-11-12 08:47:12','f753e80a-8919-11e5-8b59-08002715d519'),(17,60,57,8,1,'2015-11-12 08:47:12','f7548260-8919-11e5-8b59-08002715d519'),(18,61,57,7,1,'2015-11-12 08:47:12','f75583a0-8919-11e5-8b59-08002715d519'),(19,62,57,6,1,'2015-11-12 08:47:12','f7562b8b-8919-11e5-8b59-08002715d519'),(20,63,57,3,1,'2015-11-12 08:47:12','f756c75d-8919-11e5-8b59-08002715d519'),(21,64,57,4,1,'2015-11-12 08:47:12','f7581699-8919-11e5-8b59-08002715d519'),(22,66,65,1,1,'2015-11-12 08:47:12','f75c34b1-8919-11e5-8b59-08002715d519'),(23,67,65,1,1,'2015-11-12 08:47:12','f75cc864-8919-11e5-8b59-08002715d519'),(24,68,65,1,1,'2015-11-12 08:47:12','f75d8267-8919-11e5-8b59-08002715d519'),(25,69,65,1,1,'2015-11-12 08:47:12','f75e8ddb-8919-11e5-8b59-08002715d519'),(26,70,65,1,1,'2015-11-12 08:47:12','f75f461c-8919-11e5-8b59-08002715d519'),(27,71,65,1,1,'2015-11-12 08:47:12','f75ff7c8-8919-11e5-8b59-08002715d519'),(28,72,65,1,1,'2015-11-12 08:47:12','f760a65a-8919-11e5-8b59-08002715d519'),(30,74,65,1,1,'2015-11-12 08:47:12','f7621103-8919-11e5-8b59-08002715d519'),(31,76,75,1,1,'2015-11-12 08:47:12','f765affb-8919-11e5-8b59-08002715d519'),(32,82,81,1,1,'2015-11-12 08:47:12','f76e87d7-8919-11e5-8b59-08002715d519'),(33,83,81,2,1,'2015-11-12 08:47:12','f76f1dc7-8919-11e5-8b59-08002715d519'),(34,84,81,3,1,'2015-11-12 08:47:12','f770315d-8919-11e5-8b59-08002715d519'),(35,85,81,4,1,'2015-11-12 08:47:12','f770c3a2-8919-11e5-8b59-08002715d519'),(36,86,81,5,1,'2015-11-12 08:47:12','f7715703-8919-11e5-8b59-08002715d519'),(37,87,81,6,1,'2015-11-12 08:47:12','f771e3fd-8919-11e5-8b59-08002715d519'),(38,88,81,7,1,'2015-11-12 08:47:12','f772713c-8919-11e5-8b59-08002715d519'),(39,89,81,8,1,'2015-11-12 08:47:12','f772eae6-8919-11e5-8b59-08002715d519'),(40,91,36,1,1,'2015-11-12 08:48:17','1e26be45-891a-11e5-8b59-08002715d519'),(41,92,75,1,1,'2015-11-12 08:48:17','1e3c3d97-891a-11e5-8b59-08002715d519'),(42,93,75,1,1,'2015-11-12 08:48:17','1e3d778e-891a-11e5-8b59-08002715d519'),(43,94,75,1,1,'2015-11-12 08:48:17','1e3e9b56-891a-11e5-8b59-08002715d519'),(44,59,57,1,1,'2015-11-12 08:48:17','1e4307d0-891a-11e5-8b59-08002715d519'),(45,58,57,2,1,'2015-11-12 08:48:17','1e432b1e-891a-11e5-8b59-08002715d519'),(46,97,57,5,1,'2015-11-12 08:48:17','1e75d4a0-891a-11e5-8b59-08002715d519'),(47,98,57,9,1,'2015-11-12 08:48:17','1e76d2b4-891a-11e5-8b59-08002715d519'),(48,113,65,1,1,'2015-11-12 08:48:17','1e8642b9-891a-11e5-8b59-08002715d519'),(49,114,65,1,1,'2015-11-12 08:48:17','1e86dd7c-891a-11e5-8b59-08002715d519'),(50,115,65,1,1,'2015-11-12 08:48:17','1e876ff3-891a-11e5-8b59-08002715d519'),(51,116,65,1,1,'2015-11-12 08:48:17','1e88046f-891a-11e5-8b59-08002715d519'),(52,59,56,1,1,'2015-11-12 08:48:17','1e89c7aa-891a-11e5-8b59-08002715d519'),(53,58,56,2,1,'2015-11-12 08:48:17','1e8a0fc8-891a-11e5-8b59-08002715d519'),(54,63,56,3,1,'2015-11-12 08:48:17','1e8a79c5-891a-11e5-8b59-08002715d519'),(55,64,56,4,1,'2015-11-12 08:48:17','1e8ab1f0-891a-11e5-8b59-08002715d519'),(56,97,56,5,1,'2015-11-12 08:48:17','1e8aeab2-891a-11e5-8b59-08002715d519'),(57,98,56,9,1,'2015-11-12 08:48:17','1e8b22da-891a-11e5-8b59-08002715d519'),(58,119,65,1,1,'2015-11-12 08:48:18','1ebc6d46-891a-11e5-8b59-08002715d519'),(59,120,65,1,1,'2015-11-12 08:48:18','1ebd0562-891a-11e5-8b59-08002715d519'),(60,121,65,1,1,'2015-11-12 08:48:18','1ebd99b5-891a-11e5-8b59-08002715d519'),(61,126,75,1,1,'2015-11-12 08:48:18','1ecb5c0f-891a-11e5-8b59-08002715d519'),(62,130,128,1,1,'2015-11-12 08:48:18','1ee1431a-891a-11e5-8b59-08002715d519'),(63,3,131,1,1,'2015-11-12 08:48:18','1ef0abc8-891a-11e5-8b59-08002715d519'),(64,50,13,1,1,'2015-11-12 08:51:23','8cdbbe52-891a-11e5-8b59-08002715d519'),(65,51,13,1,1,'2015-11-12 08:51:23','8cdbe006-891a-11e5-8b59-08002715d519'),(66,49,13,1,1,'2015-11-12 08:51:23','8cdbfe4f-891a-11e5-8b59-08002715d519');
/*!40000 ALTER TABLE `concept_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_state_conversion`
--

DROP TABLE IF EXISTS `concept_state_conversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_state_conversion` (
  `concept_state_conversion_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) DEFAULT '0',
  `program_workflow_id` int(11) DEFAULT '0',
  `program_workflow_state_id` int(11) DEFAULT '0',
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`concept_state_conversion_id`),
  UNIQUE KEY `unique_workflow_concept_in_conversion` (`program_workflow_id`,`concept_id`),
  UNIQUE KEY `concept_state_conversion_uuid_index` (`uuid`),
  KEY `concept_triggers_conversion` (`concept_id`),
  KEY `conversion_to_state` (`program_workflow_state_id`),
  CONSTRAINT `concept_triggers_conversion` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `conversion_involves_workflow` FOREIGN KEY (`program_workflow_id`) REFERENCES `program_workflow` (`program_workflow_id`),
  CONSTRAINT `conversion_to_state` FOREIGN KEY (`program_workflow_state_id`) REFERENCES `program_workflow_state` (`program_workflow_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_state_conversion`
--

LOCK TABLES `concept_state_conversion` WRITE;
/*!40000 ALTER TABLE `concept_state_conversion` DISABLE KEYS */;
/*!40000 ALTER TABLE `concept_state_conversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept_stop_word`
--

DROP TABLE IF EXISTS `concept_stop_word`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_stop_word` (
  `concept_stop_word_id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(50) NOT NULL,
  `locale` varchar(50) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_stop_word_id`),
  UNIQUE KEY `Unique_StopWord_Key` (`word`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept_stop_word`
--

LOCK TABLES `concept_stop_word` WRITE;
/*!40000 ALTER TABLE `concept_stop_word` DISABLE KEYS */;
INSERT INTO `concept_stop_word` VALUES (1,'A','en','f5f45540-e2a7-11df-87ae-18a905e044dc'),(2,'AND','en','f5f469ae-e2a7-11df-87ae-18a905e044dc'),(3,'AT','en','f5f47070-e2a7-11df-87ae-18a905e044dc'),(4,'BUT','en','f5f476c4-e2a7-11df-87ae-18a905e044dc'),(5,'BY','en','f5f47d04-e2a7-11df-87ae-18a905e044dc'),(6,'FOR','en','f5f4834e-e2a7-11df-87ae-18a905e044dc'),(7,'HAS','en','f5f48a24-e2a7-11df-87ae-18a905e044dc'),(8,'OF','en','f5f49064-e2a7-11df-87ae-18a905e044dc'),(9,'THE','en','f5f496ae-e2a7-11df-87ae-18a905e044dc'),(10,'TO','en','f5f49cda-e2a7-11df-87ae-18a905e044dc');
/*!40000 ALTER TABLE `concept_stop_word` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conditions`
--

DROP TABLE IF EXISTS `conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conditions` (
  `condition_id` int(11) NOT NULL AUTO_INCREMENT,
  `previous_condition_id` int(11) DEFAULT NULL,
  `patient_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `concept_id` int(11) NOT NULL,
  `condition_non_coded` varchar(1024) DEFAULT NULL,
  `onset_date` datetime DEFAULT NULL,
  `additional_detail` varchar(1024) DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `end_reason` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL,
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`condition_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `condition_uuid_index` (`uuid`),
  KEY `conditions_previous_condition_id_fk` (`previous_condition_id`),
  KEY `conditions_patient_fk` (`patient_id`),
  KEY `conditions_concept_fk` (`concept_id`),
  KEY `conditions_end_reason_fk` (`end_reason`),
  KEY `conditions_created_by_fk` (`creator`),
  KEY `conditions_voided_by_fk` (`voided_by`),
  CONSTRAINT `conditions_concept_fk` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `conditions_created_by_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `conditions_end_reason_fk` FOREIGN KEY (`end_reason`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `conditions_patient_fk` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON UPDATE CASCADE,
  CONSTRAINT `conditions_previous_condition_id_fk` FOREIGN KEY (`previous_condition_id`) REFERENCES `conditions` (`condition_id`),
  CONSTRAINT `conditions_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conditions`
--

LOCK TABLES `conditions` WRITE;
/*!40000 ALTER TABLE `conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug`
--

DROP TABLE IF EXISTS `drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drug` (
  `drug_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `combination` tinyint(1) NOT NULL DEFAULT '0',
  `dosage_form` int(11) DEFAULT NULL,
  `maximum_daily_dose` double DEFAULT NULL,
  `minimum_daily_dose` double DEFAULT NULL,
  `route` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  `strength` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`drug_id`),
  UNIQUE KEY `drug_uuid_index` (`uuid`),
  KEY `primary_drug_concept` (`concept_id`),
  KEY `drug_creator` (`creator`),
  KEY `drug_changed_by` (`changed_by`),
  KEY `dosage_form_concept` (`dosage_form`),
  KEY `drug_retired_by` (`retired_by`),
  KEY `route_concept` (`route`),
  CONSTRAINT `dosage_form_concept` FOREIGN KEY (`dosage_form`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `drug_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `drug_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `drug_retired_by` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `primary_drug_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `route_concept` FOREIGN KEY (`route`) REFERENCES `concept` (`concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug`
--

LOCK TABLES `drug` WRITE;
/*!40000 ALTER TABLE `drug` DISABLE KEYS */;
/*!40000 ALTER TABLE `drug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug_ingredient`
--

DROP TABLE IF EXISTS `drug_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drug_ingredient` (
  `drug_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `uuid` char(38) NOT NULL,
  `strength` double DEFAULT NULL,
  `units` int(11) DEFAULT NULL,
  PRIMARY KEY (`drug_id`,`ingredient_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `drug_ingredient_units_fk` (`units`),
  KEY `drug_ingredient_ingredient_id_fk` (`ingredient_id`),
  CONSTRAINT `drug_ingredient_drug_id_fk` FOREIGN KEY (`drug_id`) REFERENCES `drug` (`drug_id`),
  CONSTRAINT `drug_ingredient_ingredient_id_fk` FOREIGN KEY (`ingredient_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `drug_ingredient_units_fk` FOREIGN KEY (`units`) REFERENCES `concept` (`concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug_ingredient`
--

LOCK TABLES `drug_ingredient` WRITE;
/*!40000 ALTER TABLE `drug_ingredient` DISABLE KEYS */;
/*!40000 ALTER TABLE `drug_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug_order`
--

DROP TABLE IF EXISTS `drug_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drug_order` (
  `order_id` int(11) NOT NULL DEFAULT '0',
  `drug_inventory_id` int(11),
  `dose` double DEFAULT NULL,
  `as_needed` smallint(6) NOT NULL,
  `dosing_type` varchar(255) DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `as_needed_condition` varchar(255) DEFAULT NULL,
  `num_refills` int(11) DEFAULT NULL,
  `dosing_instructions` text,
  `duration` int(11) DEFAULT NULL,
  `duration_units` int(11) DEFAULT NULL,
  `quantity_units` int(11) DEFAULT NULL,
  `route` int(11) DEFAULT NULL,
  `dose_units` int(11) DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  `brand_name` varchar(255) DEFAULT NULL,
  `dispense_as_written` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`),
  KEY `inventory_item` (`drug_inventory_id`),
  KEY `drug_order_duration_units_fk` (`duration_units`),
  KEY `drug_order_quantity_units` (`quantity_units`),
  KEY `drug_order_route_fk` (`route`),
  KEY `drug_order_dose_units` (`dose_units`),
  KEY `drug_order_frequency_fk` (`frequency`),
  CONSTRAINT `drug_order_dose_units` FOREIGN KEY (`dose_units`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `drug_order_duration_units_fk` FOREIGN KEY (`duration_units`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `drug_order_frequency_fk` FOREIGN KEY (`frequency`) REFERENCES `order_frequency` (`order_frequency_id`),
  CONSTRAINT `drug_order_quantity_units` FOREIGN KEY (`quantity_units`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `drug_order_route_fk` FOREIGN KEY (`route`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `extends_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `inventory_item` FOREIGN KEY (`drug_inventory_id`) REFERENCES `drug` (`drug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug_order`
--

LOCK TABLES `drug_order` WRITE;
/*!40000 ALTER TABLE `drug_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `drug_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug_reference_map`
--

DROP TABLE IF EXISTS `drug_reference_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drug_reference_map` (
  `drug_reference_map_id` int(11) NOT NULL AUTO_INCREMENT,
  `drug_id` int(11) NOT NULL,
  `term_id` int(11) NOT NULL,
  `concept_map_type` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`drug_reference_map_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `drug_for_drug_reference_map` (`drug_id`),
  KEY `concept_reference_term_for_drug_reference_map` (`term_id`),
  KEY `concept_map_type_for_drug_reference_map` (`concept_map_type`),
  KEY `user_who_changed_drug_reference_map` (`changed_by`),
  KEY `drug_reference_map_creator` (`creator`),
  KEY `user_who_retired_drug_reference_map` (`retired_by`),
  CONSTRAINT `concept_map_type_for_drug_reference_map` FOREIGN KEY (`concept_map_type`) REFERENCES `concept_map_type` (`concept_map_type_id`),
  CONSTRAINT `concept_reference_term_for_drug_reference_map` FOREIGN KEY (`term_id`) REFERENCES `concept_reference_term` (`concept_reference_term_id`),
  CONSTRAINT `drug_for_drug_reference_map` FOREIGN KEY (`drug_id`) REFERENCES `drug` (`drug_id`),
  CONSTRAINT `drug_reference_map_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_changed_drug_reference_map` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_drug_reference_map` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug_reference_map`
--

LOCK TABLES `drug_reference_map` WRITE;
/*!40000 ALTER TABLE `drug_reference_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `drug_reference_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encounter`
--

DROP TABLE IF EXISTS `encounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encounter` (
  `encounter_id` int(11) NOT NULL AUTO_INCREMENT,
  `encounter_type` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL DEFAULT '0',
  `location_id` int(11) DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL,
  `encounter_datetime` datetime NOT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `visit_id` int(11) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`encounter_id`),
  UNIQUE KEY `encounter_uuid_index` (`uuid`),
  KEY `encounter_datetime_idx` (`encounter_datetime`),
  KEY `encounter_ibfk_1` (`creator`),
  KEY `encounter_type_id` (`encounter_type`),
  KEY `encounter_form` (`form_id`),
  KEY `encounter_location` (`location_id`),
  KEY `encounter_patient` (`patient_id`),
  KEY `user_who_voided_encounter` (`voided_by`),
  KEY `encounter_changed_by` (`changed_by`),
  KEY `encounter_visit_id_fk` (`visit_id`),
  CONSTRAINT `encounter_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_form` FOREIGN KEY (`form_id`) REFERENCES `form` (`form_id`),
  CONSTRAINT `encounter_ibfk_1` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `encounter_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON UPDATE CASCADE,
  CONSTRAINT `encounter_type_id` FOREIGN KEY (`encounter_type`) REFERENCES `encounter_type` (`encounter_type_id`),
  CONSTRAINT `encounter_visit_id_fk` FOREIGN KEY (`visit_id`) REFERENCES `visit` (`visit_id`),
  CONSTRAINT `user_who_voided_encounter` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encounter`
--

LOCK TABLES `encounter` WRITE;
/*!40000 ALTER TABLE `encounter` DISABLE KEYS */;
/*!40000 ALTER TABLE `encounter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encounter_provider`
--

DROP TABLE IF EXISTS `encounter_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encounter_provider` (
  `encounter_provider_id` int(11) NOT NULL AUTO_INCREMENT,
  `encounter_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `encounter_role_id` int(11) NOT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `date_voided` datetime DEFAULT NULL,
  `voided_by` int(11) DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`encounter_provider_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `encounter_id_fk` (`encounter_id`),
  KEY `provider_id_fk` (`provider_id`),
  KEY `encounter_role_id_fk` (`encounter_role_id`),
  KEY `encounter_provider_creator` (`creator`),
  KEY `encounter_provider_changed_by` (`changed_by`),
  KEY `encounter_provider_voided_by` (`voided_by`),
  CONSTRAINT `encounter_id_fk` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `encounter_provider_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_provider_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_provider_voided_by` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_role_id_fk` FOREIGN KEY (`encounter_role_id`) REFERENCES `encounter_role` (`encounter_role_id`),
  CONSTRAINT `provider_id_fk` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encounter_provider`
--

LOCK TABLES `encounter_provider` WRITE;
/*!40000 ALTER TABLE `encounter_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `encounter_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encounter_role`
--

DROP TABLE IF EXISTS `encounter_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encounter_role` (
  `encounter_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`encounter_role_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `encounter_role_unique_name` (`name`),
  KEY `encounter_role_creator_fk` (`creator`),
  KEY `encounter_role_changed_by_fk` (`changed_by`),
  KEY `encounter_role_retired_by_fk` (`retired_by`),
  CONSTRAINT `encounter_role_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_role_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_role_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encounter_role`
--

LOCK TABLES `encounter_role` WRITE;
/*!40000 ALTER TABLE `encounter_role` DISABLE KEYS */;
INSERT INTO `encounter_role` VALUES (1,'Unknown','Unknown encounter role for legacy providers with no encounter role set',1,'2011-08-18 14:00:00',NULL,NULL,0,NULL,NULL,NULL,'a0b03050-c99b-11e0-9572-0800200c9a66');
/*!40000 ALTER TABLE `encounter_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encounter_type`
--

DROP TABLE IF EXISTS `encounter_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encounter_type` (
  `encounter_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  `view_privilege` varchar(255) DEFAULT NULL,
  `edit_privilege` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`encounter_type_id`),
  UNIQUE KEY `encounter_type_unique_name` (`name`),
  UNIQUE KEY `encounter_type_uuid_index` (`uuid`),
  KEY `encounter_type_retired_status` (`retired`),
  KEY `user_who_created_type` (`creator`),
  KEY `user_who_retired_encounter_type` (`retired_by`),
  KEY `privilege_which_can_view_encounter_type` (`view_privilege`),
  KEY `privilege_which_can_edit_encounter_type` (`edit_privilege`),
  CONSTRAINT `privilege_which_can_edit_encounter_type` FOREIGN KEY (`edit_privilege`) REFERENCES `privilege` (`privilege`),
  CONSTRAINT `privilege_which_can_view_encounter_type` FOREIGN KEY (`view_privilege`) REFERENCES `privilege` (`privilege`),
  CONSTRAINT `user_who_created_type` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_encounter_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encounter_type`
--

LOCK TABLES `encounter_type` WRITE;
/*!40000 ALTER TABLE `encounter_type` DISABLE KEYS */;
INSERT INTO `encounter_type` VALUES (1,'Consultation','Consultation encounter',1,'2015-11-12 00:00:00',0,NULL,NULL,NULL,'a922e512-8919-11e5-8b59-08002715d519',NULL,NULL),(2,'REG','Registration encounter',1,'2015-11-12 00:00:00',0,NULL,NULL,NULL,'a9240859-8919-11e5-8b59-08002715d519',NULL,NULL),(3,'ADMISSION','ADMISSION encounter',1,'2015-11-12 00:00:00',0,NULL,NULL,NULL,'a946e0a2-8919-11e5-8b59-08002715d519',NULL,NULL),(4,'DISCHARGE','DISCHARGE encounter',1,'2015-11-12 00:00:00',0,NULL,NULL,NULL,'a9498b80-8919-11e5-8b59-08002715d519',NULL,NULL),(5,'TRANSFER','TRANSFER encounter',1,'2015-11-12 00:00:00',0,NULL,NULL,NULL,'a94d4de1-8919-11e5-8b59-08002715d519',NULL,NULL),(6,'RADIOLOGY','RADIOLOGY encounter',1,'2015-11-12 00:00:00',0,NULL,NULL,NULL,'a95e95dc-8919-11e5-8b59-08002715d519',NULL,NULL),(7,'INVESTIGATION','Investigation encounter',1,'2015-11-12 00:00:00',0,NULL,NULL,NULL,'a9656cf8-8919-11e5-8b59-08002715d519',NULL,NULL),(8,'LAB_RESULT','Lab Result encounter',1,'2015-11-12 00:00:00',0,NULL,NULL,NULL,'a96a874c-8919-11e5-8b59-08002715d519',NULL,NULL),(9,'Patient Document','Patient Document Encounter Type',1,'2015-11-12 00:00:00',0,NULL,NULL,NULL,'a991dfaf-8919-11e5-8b59-08002715d519',NULL,NULL),(10,'VALIDATION NOTES','Validation Notes encounter',1,'2015-11-12 00:00:00',0,NULL,NULL,NULL,'a99cfcbf-8919-11e5-8b59-08002715d519',NULL,NULL);
/*!40000 ALTER TABLE `encounter_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_mapping`
--

DROP TABLE IF EXISTS `entity_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `entity_mapping_type_id` int(11) NOT NULL,
  `entity1_uuid` char(38) NOT NULL,
  `entity2_uuid` char(38) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entity_mapping_entity_mapping_type_fk` (`entity_mapping_type_id`),
  CONSTRAINT `entity_mapping_entity_mapping_type_fk` FOREIGN KEY (`entity_mapping_type_id`) REFERENCES `entity_mapping_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_mapping`
--

LOCK TABLES `entity_mapping` WRITE;
/*!40000 ALTER TABLE `entity_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_mapping_type`
--

DROP TABLE IF EXISTS `entity_mapping_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_mapping_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `uuid` char(38) NOT NULL,
  `entity1_type` text NOT NULL,
  `entity2_type` text NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_entity_mapping_type_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_mapping_type`
--

LOCK TABLES `entity_mapping_type` WRITE;
/*!40000 ALTER TABLE `entity_mapping_type` DISABLE KEYS */;
INSERT INTO `entity_mapping_type` VALUES (1,'program_obstemplate','8cbf15ef-891a-11e5-8b59-08002715d519','org.openmrs.Program','org.openmrs.Concept','2015-11-12 08:51:22'),(2,'program_encountertype','8cc38b5e-891a-11e5-8b59-08002715d519','org.openmrs.Program','org.openmrs.EncounterType','2015-11-12 08:51:22');
/*!40000 ALTER TABLE `entity_mapping_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_records`
--

DROP TABLE IF EXISTS `event_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(40) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uri` varchar(255) DEFAULT NULL,
  `object` varchar(1000) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `event_records_category_idx` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_records`
--

LOCK TABLES `event_records` WRITE;
/*!40000 ALTER TABLE `event_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_records_offset_marker`
--

DROP TABLE IF EXISTS `event_records_offset_marker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_records_offset_marker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT NULL,
  `event_count` int(11) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_records_offset_marker`
--

LOCK TABLES `event_records_offset_marker` WRITE;
/*!40000 ALTER TABLE `event_records_offset_marker` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_records_offset_marker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_records_queue`
--

DROP TABLE IF EXISTS `event_records_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_records_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(40) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uri` varchar(255) DEFAULT NULL,
  `object` varchar(1000) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_records_queue`
--

LOCK TABLES `event_records_queue` WRITE;
/*!40000 ALTER TABLE `event_records_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_records_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_events`
--

DROP TABLE IF EXISTS `failed_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_events` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `feed_uri` varchar(255) DEFAULT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `error_message` varchar(4000) DEFAULT NULL,
  `event_id` varchar(255) DEFAULT NULL,
  `event_content` varchar(4000) DEFAULT NULL,
  `error_hash_code` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_events`
--

LOCK TABLES `failed_events` WRITE;
/*!40000 ALTER TABLE `failed_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field`
--

DROP TABLE IF EXISTS `field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field` (
  `field_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `field_type` int(11) DEFAULT NULL,
  `concept_id` int(11) DEFAULT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  `attribute_name` varchar(50) DEFAULT NULL,
  `default_value` text,
  `select_multiple` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`field_id`),
  UNIQUE KEY `field_uuid_index` (`uuid`),
  KEY `field_retired_status` (`retired`),
  KEY `user_who_changed_field` (`changed_by`),
  KEY `concept_for_field` (`concept_id`),
  KEY `user_who_created_field` (`creator`),
  KEY `type_of_field` (`field_type`),
  KEY `user_who_retired_field` (`retired_by`),
  CONSTRAINT `concept_for_field` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `type_of_field` FOREIGN KEY (`field_type`) REFERENCES `field_type` (`field_type_id`),
  CONSTRAINT `user_who_changed_field` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_created_field` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_field` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field`
--

LOCK TABLES `field` WRITE;
/*!40000 ALTER TABLE `field` DISABLE KEYS */;
/*!40000 ALTER TABLE `field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_answer`
--

DROP TABLE IF EXISTS `field_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_answer` (
  `field_id` int(11) NOT NULL DEFAULT '0',
  `answer_id` int(11) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`field_id`,`answer_id`),
  UNIQUE KEY `field_answer_uuid_index` (`uuid`),
  KEY `field_answer_concept` (`answer_id`),
  KEY `user_who_created_field_answer` (`creator`),
  CONSTRAINT `answers_for_field` FOREIGN KEY (`field_id`) REFERENCES `field` (`field_id`),
  CONSTRAINT `field_answer_concept` FOREIGN KEY (`answer_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `user_who_created_field_answer` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_answer`
--

LOCK TABLES `field_answer` WRITE;
/*!40000 ALTER TABLE `field_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `field_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_type`
--

DROP TABLE IF EXISTS `field_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_type` (
  `field_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  `is_set` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`field_type_id`),
  UNIQUE KEY `field_type_uuid_index` (`uuid`),
  KEY `user_who_created_field_type` (`creator`),
  CONSTRAINT `user_who_created_field_type` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_type`
--

LOCK TABLES `field_type` WRITE;
/*!40000 ALTER TABLE `field_type` DISABLE KEYS */;
INSERT INTO `field_type` VALUES (1,'Concept','',0,1,'2005-02-22 00:00:00','8d5e7d7c-c2cc-11de-8d13-0010c6dffd0f'),(2,'Database element','',0,1,'2005-02-22 00:00:00','8d5e8196-c2cc-11de-8d13-0010c6dffd0f'),(3,'Set of Concepts','',1,1,'2005-02-22 00:00:00','8d5e836c-c2cc-11de-8d13-0010c6dffd0f'),(4,'Miscellaneous Set','',1,1,'2005-02-22 00:00:00','8d5e852e-c2cc-11de-8d13-0010c6dffd0f'),(5,'Section','',1,1,'2005-02-22 00:00:00','8d5e86fa-c2cc-11de-8d13-0010c6dffd0f');
/*!40000 ALTER TABLE `field_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form`
--

DROP TABLE IF EXISTS `form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form` (
  `form_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(50) NOT NULL DEFAULT '',
  `build` int(11) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `xslt` text,
  `template` text,
  `description` text,
  `encounter_type` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retired_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`form_id`),
  UNIQUE KEY `form_uuid_index` (`uuid`),
  KEY `form_published_index` (`published`),
  KEY `form_retired_index` (`retired`),
  KEY `form_published_and_retired_index` (`published`,`retired`),
  KEY `user_who_last_changed_form` (`changed_by`),
  KEY `user_who_created_form` (`creator`),
  KEY `form_encounter_type` (`encounter_type`),
  KEY `user_who_retired_form` (`retired_by`),
  CONSTRAINT `form_encounter_type` FOREIGN KEY (`encounter_type`) REFERENCES `encounter_type` (`encounter_type_id`),
  CONSTRAINT `user_who_created_form` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_last_changed_form` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_form` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form`
--

LOCK TABLES `form` WRITE;
/*!40000 ALTER TABLE `form` DISABLE KEYS */;
/*!40000 ALTER TABLE `form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_field`
--

DROP TABLE IF EXISTS `form_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_field` (
  `form_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL DEFAULT '0',
  `field_id` int(11) NOT NULL DEFAULT '0',
  `field_number` int(11) DEFAULT NULL,
  `field_part` varchar(5) DEFAULT NULL,
  `page_number` int(11) DEFAULT NULL,
  `parent_form_field` int(11) DEFAULT NULL,
  `min_occurs` int(11) DEFAULT NULL,
  `max_occurs` int(11) DEFAULT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `sort_weight` double DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`form_field_id`),
  UNIQUE KEY `form_field_uuid_index` (`uuid`),
  KEY `user_who_last_changed_form_field` (`changed_by`),
  KEY `user_who_created_form_field` (`creator`),
  KEY `field_within_form` (`field_id`),
  KEY `form_containing_field` (`form_id`),
  KEY `form_field_hierarchy` (`parent_form_field`),
  CONSTRAINT `field_within_form` FOREIGN KEY (`field_id`) REFERENCES `field` (`field_id`),
  CONSTRAINT `form_containing_field` FOREIGN KEY (`form_id`) REFERENCES `form` (`form_id`),
  CONSTRAINT `form_field_hierarchy` FOREIGN KEY (`parent_form_field`) REFERENCES `form_field` (`form_field_id`),
  CONSTRAINT `user_who_created_form_field` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_last_changed_form_field` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_field`
--

LOCK TABLES `form_field` WRITE;
/*!40000 ALTER TABLE `form_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_resource`
--

DROP TABLE IF EXISTS `form_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_resource` (
  `form_resource_id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value_reference` text NOT NULL,
  `datatype` varchar(255) DEFAULT NULL,
  `datatype_config` text,
  `preferred_handler` varchar(255) DEFAULT NULL,
  `handler_config` text,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`form_resource_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `unique_form_and_name` (`form_id`,`name`),
  CONSTRAINT `form_resource_form_fk` FOREIGN KEY (`form_id`) REFERENCES `form` (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_resource`
--

LOCK TABLES `form_resource` WRITE;
/*!40000 ALTER TABLE `form_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_property`
--

DROP TABLE IF EXISTS `global_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_property` (
  `property` varchar(255) NOT NULL DEFAULT '',
  `property_value` text,
  `description` text,
  `uuid` char(38) DEFAULT NULL,
  `datatype` varchar(255) DEFAULT NULL,
  `datatype_config` text,
  `preferred_handler` varchar(255) DEFAULT NULL,
  `handler_config` text,
  PRIMARY KEY (`property`),
  UNIQUE KEY `global_property_uuid_index` (`uuid`),
  KEY `global_property_property_index` (`property`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_property`
--

LOCK TABLES `global_property` WRITE;
/*!40000 ALTER TABLE `global_property` DISABLE KEYS */;
INSERT INTO `global_property` VALUES ('addresshierarchy.addressToEntryMapUpdaterLastStartTime',NULL,'The module uses this field to store when the AddressToEntryMapUpdater task was last started; DO NOT MODIFY','7ec2b181-8919-11e5-8b59-08002715d519',NULL,NULL,NULL,NULL),('addresshierarchy.allowFreetext','true','Valid values: true/false. When overriding the address portlet, allow the entry of free text for address fields associated with the address hierarchy by providing an \"Other\" option','7ec2d0bb-8919-11e5-8b59-08002715d519',NULL,NULL,NULL,NULL),('addresshierarchy.database_version','2.10.0','DO NOT MODIFY.  Current database version number for the addresshierarchy module.','7ec336ba-8919-11e5-8b59-08002715d519',NULL,NULL,NULL,NULL),('addresshierarchy.enableOverrideOfAddressPortlet','true','Valid values: true/false. When enabled, the existing \"edit\" component of the address portlet is overridden by the new functionality provided by the address hierarchy module','7ec355be-8919-11e5-8b59-08002715d519',NULL,NULL,NULL,NULL),('addresshierarchy.initializeAddressHierarchyCacheOnStartup','true','Sets whether to initialize the address hierarchy in-memory cache (which is used to speed up address hierarchy searches. Generally, you want to set this to \"true\", though developers may want to set it to false during development to speed module start-up.','7ec374f3-8919-11e5-8b59-08002715d519',NULL,NULL,NULL,NULL),('addresshierarchy.mandatory','false','true/false whether or not the addresshierarchy module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','7ec3910f-8919-11e5-8b59-08002715d519',NULL,NULL,NULL,NULL),('addresshierarchy.soundexProcessor',NULL,'If the Name Phonetics module is installed, this defines the name of a soundex algorithm used by the getPossibleFullAddresses service method.','7ec3a718-8919-11e5-8b59-08002715d519',NULL,NULL,NULL,NULL),('addresshierarchy.started','true','DO NOT MODIFY. true/false whether or not the addresshierarchy module has been started.  This is used to make sure modules that were running  prior to a restart are started again','bb76df57-2b60-4118-8213-f40daf673149',NULL,NULL,NULL,NULL),('allergy.allergen.ConceptClasses','Drug,MedSet','A comma-separated list of the allowed concept classes for the allergen field of the allergy dialog','97f3f7ac-9d9e-4f55-8ddd-c919f8595957',NULL,NULL,NULL,NULL),('allergy.reaction.ConceptClasses','Symptom','A comma-separated list of the allowed concept classes for the reaction field of the allergy dialog','8e82a35a-28c7-472a-8e6f-5bae3a80959f',NULL,NULL,NULL,NULL),('appframework.mandatory','false','true/false whether or not the appframework module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','18370971-91d7-40e8-9942-4f777d22ca81',NULL,NULL,NULL,NULL),('appframework.started','true','DO NOT MODIFY. true/false whether or not the appframework module has been started.  This is used to make sure modules that were running  prior to a restart are started again','54311031-8a44-4a40-ba8c-724360875c43',NULL,NULL,NULL,NULL),('application.name','OpenMRS','The name of this application, as presented to the user, for example on the login and welcome pages.','717cc0a3-fab1-4906-bb08-030b1d632aaa',NULL,NULL,NULL,NULL),('bahmni.cacheHeadersFilter.expiresDuration','0','Expires duration in minutes','672dc790-e0b6-11e3-8b68-0800200c9a66',NULL,NULL,NULL,NULL),('bahmni.encountersession.duration','60','Encountersession duration in minutes','a957da63-8919-11e5-8b59-08002715d519',NULL,NULL,NULL,NULL),('bahmni.encounterType.default','Consultation','Default Encounter Type','1f17a666-891a-11e5-8b59-08002715d519',NULL,NULL,NULL,NULL),('bahmni.relationshipTypeMap',NULL,'Relationship Type Map format Eg:{ \"patient\": [\"Sibling\", \"Parent\"],\"provider\": [\"Doctor\"]}.If no value is specified default is  patient relationship.','9ef4bbb5-d0bc-458c-8a5b-6f4c5fa24923',NULL,NULL,NULL,NULL),('bahmnicore.mandatory','false','true/false whether or not the bahmnicore module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','dfd710ca-ca7b-4bf1-8770-ebf709fe70c2',NULL,NULL,NULL,NULL),('bahmnicore.started','true','DO NOT MODIFY. true/false whether or not the bahmnicore module has been started.  This is used to make sure modules that were running  prior to a restart are started again','e55a1206-368c-4e8d-a9fe-97777029239c',NULL,NULL,NULL,NULL),('bedmanagement.mandatory','false','true/false whether or not the bedmanagement module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','867c1045-a503-4c1c-bd0d-74471a74690f',NULL,NULL,NULL,NULL),('bedmanagement.started','true','DO NOT MODIFY. true/false whether or not the bedmanagement module has been started.  This is used to make sure modules that were running  prior to a restart are started again','7445a2ed-8946-4a13-8189-328cd8465fe0',NULL,NULL,NULL,NULL),('calculation.mandatory','false','true/false whether or not the calculation module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','b103fea2-d147-4e86-aac6-4c966f1b5917',NULL,NULL,NULL,NULL),('calculation.started','true','DO NOT MODIFY. true/false whether or not the calculation module has been started.  This is used to make sure modules that were running  prior to a restart are started again','c9a9ee6a-3e07-4af4-bee4-8acb7474221d',NULL,NULL,NULL,NULL),('concept.causeOfDeath','5002','Concept id of the concept defining the CAUSE OF DEATH concept','cc151ddc-1af5-4ba6-bb41-61c3866460cb',NULL,NULL,NULL,NULL),('concept.defaultConceptMapType','NARROWER-THAN','Default concept map type which is used when no other is set','543ed138-3cd6-4443-843c-36c5b7924ba7',NULL,NULL,NULL,NULL),('concept.false','2','Concept id of the concept defining the FALSE boolean concept','fd55dcb9-1db1-4a55-b9ee-52ab0f46b60e',NULL,NULL,NULL,NULL),('concept.height','5090','Concept id of the concept defining the HEIGHT concept','ef616bbc-74d4-48c0-afcf-ec78c7ace1bd',NULL,NULL,NULL,NULL),('concept.medicalRecordObservations','1238','The concept id of the MEDICAL_RECORD_OBSERVATIONS concept.  This concept_id is presumed to be the generic grouping (obr) concept in hl7 messages.  An obs_group row is not created for this concept.','174c8c97-5ccf-47fa-a619-7fd85c3ba70e',NULL,NULL,NULL,NULL),('concept.none','1107','Concept id of the concept defining the NONE concept','bb045ac4-87db-4813-a416-12772669bdb6',NULL,NULL,NULL,NULL),('concept.otherNonCoded','5622','Concept id of the concept defining the OTHER NON-CODED concept','851309cf-1349-4af7-9f68-087ca1c4e4db',NULL,NULL,NULL,NULL),('concept.patientDied','1742','Concept id of the concept defining the PATIENT DIED concept','f8cec1d1-b5fe-4873-83ee-009e769ac2e3',NULL,NULL,NULL,NULL),('concept.problemList','1284','The concept id of the PROBLEM LIST concept.  This concept_id is presumed to be the generic grouping (obr) concept in hl7 messages.  An obs_group row is not created for this concept.','b686b430-d423-474b-a7a3-911e0d8d456b',NULL,NULL,NULL,NULL),('concept.reasonExitedCare',NULL,'Concept id of the concept defining the REASON EXITED CARE concept','c9ca2251-8528-4ffb-b64b-1c84fbc74c4d',NULL,NULL,NULL,NULL),('concept.reasonForDeath','','Concept id of the REASON FOR DEATH Concept Set','8cb1268a-891a-11e5-8b59-08002715d519',NULL,NULL,NULL,NULL),('concept.reasonOrderStopped','1812','Concept id of the concept defining the REASON ORDER STOPPED concept','16e6920e-e2b7-401c-9fec-59f02a02ee56',NULL,NULL,NULL,NULL),('concept.true','1','Concept id of the concept defining the TRUE boolean concept','107e0787-0ba8-4efd-97d0-bd9fb1e59762',NULL,NULL,NULL,NULL),('concept.weight','5089','Concept id of the concept defining the WEIGHT concept','80a019d0-d69a-4326-b7e7-0f4290b2d633',NULL,NULL,NULL,NULL),('conceptDrug.dosageForm.conceptClasses',NULL,'A comma-separated list of the allowed concept classes for the dosage form field of the concept drug management form.','63a8a937-d3c1-4e2d-9284-de122f7966cd',NULL,NULL,NULL,NULL),('conceptDrug.route.conceptClasses',NULL,'A comma-separated list of the allowed concept classes for the route field of the concept drug management form.','08c0ef31-46d9-4454-b27b-99682391addd',NULL,NULL,NULL,NULL),('concepts.locked','false','if true, do not allow editing concepts','d861d5c7-de7d-416f-a82e-fad2468acd36','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL),('concept_map_type_management.enable','false','Enables or disables management of concept map types','029eac9e-718a-4b6a-b868-cc437b805f3f','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL),('conditionList.endReasonConceptSetUuid',NULL,'UUID of end reason concept set','3425dd9d-192e-41eb-95f4-888243c11feb',NULL,NULL,NULL,NULL),('conditionList.nonCodedUuid',NULL,'UUID of non coded concept','60562151-ed79-4c12-a85a-0a94ab787c69',NULL,NULL,NULL,NULL),('dashboard.encounters.maximumNumberToShow','3','An integer which, if specified, would determine the maximum number of encounters to display on the encounter tab of the patient dashboard.','74fccb00-3787-4829-a130-ecba546de6bd',NULL,NULL,NULL,NULL),('dashboard.encounters.providerDisplayRoles',NULL,'A comma-separated list of encounter roles (by name or id). Providers with these roles in an encounter will be displayed on the encounter tab of the patient dashboard.','c42bf2fb-692a-478c-9936-405f63423239',NULL,NULL,NULL,NULL),('dashboard.encounters.showEditLink','true','true/false whether or not to show the \'Edit Encounter\' link on the patient dashboard','aea727e9-e6bb-48ff-adb4-975c845e13af','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL),('dashboard.encounters.showEmptyFields','true','true/false whether or not to show empty fields on the \'View Encounter\' window','5e240485-5b8f-4552-8bcb-7b133dc2211f','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL),('dashboard.encounters.showViewLink','true','true/false whether or not to show the \'View Encounter\' link on the patient dashboard','43f4f97f-a07e-4d28-85fa-fed17ab422a8','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL),('dashboard.encounters.usePages','smart','true/false/smart on how to show the pages on the \'View Encounter\' window.  \'smart\' means that if > 50% of the fields have page numbers defined, show data in pages','5e29c87e-aefc-4634-94e1-2d858c6b22df',NULL,NULL,NULL,NULL),('dashboard.header.programs_to_show',NULL,'List of programs to show Enrollment details of in the patient header. (Should be an ordered comma-separated list of program_ids or names.)','90ad42bd-dad0-4084-b4b4-0613b2f7caaa',NULL,NULL,NULL,NULL),('dashboard.header.showConcept','5497','Comma delimited list of concepts ids to show on the patient header overview','396f18ef-5f68-4fdd-867d-d8bf078c877c',NULL,NULL,NULL,NULL),('dashboard.header.workflows_to_show',NULL,'List of programs to show Enrollment details of in the patient header. List of workflows to show current status of in the patient header. These will only be displayed if they belong to a program listed above. (Should be a comma-separated list of program_workflow_ids.)','de95eb19-6c76-44e5-b23d-d864fa0709b8',NULL,NULL,NULL,NULL),('dashboard.metadata.caseConversion',NULL,'Indicates which type automatic case conversion is applied to program/workflow/state in the patient dashboard. Valid values: lowercase, uppercase, capitalize. If empty no conversion is applied.','f0762bf9-ce1a-445c-9fa1-44040101ad49',NULL,NULL,NULL,NULL),('dashboard.overview.showConcepts',NULL,'Comma delimited list of concepts ids to show on the patient dashboard overview tab','1d10ae14-4cb7-47c7-8026-05d2a166890c',NULL,NULL,NULL,NULL),('dashboard.regimen.displayDrugSetIds','ANTIRETROVIRAL DRUGS,TUBERCULOSIS TREATMENT DRUGS','Drug sets that appear on the Patient Dashboard Regimen tab. Comma separated list of name of concepts that are defined as drug sets.','b3fea3a1-420b-461f-945b-e42c1addc021',NULL,NULL,NULL,NULL),('dashboard.regimen.displayFrequencies','7 days/week,6 days/week,5 days/week,4 days/week,3 days/week,2 days/week,1 days/week','Frequency of a drug order that appear on the Patient Dashboard. Comma separated list of name of concepts that are defined as drug frequencies.','f2c9c219-ca6b-4697-b4c7-dc3026bc9a93',NULL,NULL,NULL,NULL),('dashboard.regimen.standardRegimens','<list>  <regimenSuggestion>    <drugComponents>      <drugSuggestion>        <drugId>2</drugId>        <dose>1</dose>        <units>tab(s)</units>        <frequency>2/day x 7 days/week</frequency>        <instructions></instructions>      </drugSuggestion>    </drugComponents>    <displayName>3TC + d4T(30) + NVP (Triomune-30)</displayName>    <codeName>standardTri30</codeName>    <canReplace>ANTIRETROVIRAL DRUGS</canReplace>  </regimenSuggestion>  <regimenSuggestion>    <drugComponents>      <drugSuggestion>        <drugId>3</drugId>        <dose>1</dose>        <units>tab(s)</units>        <frequency>2/day x 7 days/week</frequency>        <instructions></instructions>      </drugSuggestion>    </drugComponents>    <displayName>3TC + d4T(40) + NVP (Triomune-40)</displayName>    <codeName>standardTri40</codeName>    <canReplace>ANTIRETROVIRAL DRUGS</canReplace>  </regimenSuggestion>  <regimenSuggestion>    <drugComponents>      <drugSuggestion>        <drugId>39</drugId>        <dose>1</dose>        <units>tab(s)</units>        <frequency>2/day x 7 days/week</frequency>        <instructions></instructions>      </drugSuggestion>      <drugSuggestion>        <drugId>22</drugId>        <dose>200</dose>        <units>mg</units>        <frequency>2/day x 7 days/week</frequency>        <instructions></instructions>      </drugSuggestion>    </drugComponents>    <displayName>AZT + 3TC + NVP</displayName>    <codeName>standardAztNvp</codeName>    <canReplace>ANTIRETROVIRAL DRUGS</canReplace>  </regimenSuggestion>  <regimenSuggestion>    <drugComponents>      <drugSuggestion reference=\"../../../regimenSuggestion[3]/drugComponents/drugSuggestion\"/>      <drugSuggestion>        <drugId>11</drugId>        <dose>600</dose>        <units>mg</units>        <frequency>1/day x 7 days/week</frequency>        <instructions></instructions>      </drugSuggestion>    </drugComponents>    <displayName>AZT + 3TC + EFV(600)</displayName>    <codeName>standardAztEfv</codeName>    <canReplace>ANTIRETROVIRAL DRUGS</canReplace>  </regimenSuggestion>  <regimenSuggestion>    <drugComponents>      <drugSuggestion>        <drugId>5</drugId>        <dose>30</dose>        <units>mg</units>        <frequency>2/day x 7 days/week</frequency>        <instructions></instructions>      </drugSuggestion>      <drugSuggestion>        <drugId>42</drugId>        <dose>150</dose>        		<units>mg</units>        <frequency>2/day x 7 days/week</frequency>        <instructions></instructions>      </drugSuggestion>      <drugSuggestion reference=\"../../../regimenSuggestion[4]/drugComponents/drugSuggestion[2]\"/>    </drugComponents>    <displayName>d4T(30) + 3TC + EFV(600)</displayName>    <codeName>standardD4t30Efv</codeName>    <canReplace>ANTIRETROVIRAL DRUGS</canReplace>  </regimenSuggestion>  <regimenSuggestion>    <drugComponents>      <drugSuggestion>        <drugId>6</drugId>        <dose>40</dose>        <units>mg</units>        <frequency>2/day x 7 days/week</frequency>        <instructions></instructions>      </drugSuggestion>      <drugSuggestion reference=\"../../../regimenSuggestion[5]/drugComponents/drugSuggestion[2]\"/>      <drugSuggestion reference=\"../../../regimenSuggestion[4]/drugComponents/drugSuggestion[2]\"/>    </drugComponents>    <displayName>d4T(40) + 3TC + EFV(600)</displayName>    <codeName>standardD4t40Efv</codeName>    <canReplace>ANTIRETROVIRAL DRUGS</canReplace>  </regimenSuggestion></list>','XML description of standard drug regimens, to be shown as shortcuts on the dashboard regimen entry tab','e0f1f9b1-0f59-491b-ba86-dee2bb817c70',NULL,NULL,NULL,NULL),('dashboard.relationships.show_types',NULL,'Types of relationships separated by commas.  Doctor/Patient,Parent/Child','376cdd38-d1fc-4c49-85d3-e81ae8ac6c9c',NULL,NULL,NULL,NULL),('dashboard.showPatientName','false','Whether or not to display the patient name in the patient dashboard title. Note that enabling this could be security risk if multiple users operate on the same computer.','05ddab68-992f-4292-a241-d8270cf72b87','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL),('datePicker.weekStart','0','First day of the week in the date picker. Domingo/Dimanche/Sunday:0  Lunes/Lundi/Monday:1','e7defb55-7893-4053-b5dd-32190a986349',NULL,NULL,NULL,NULL),('default_locale','en','Specifies the default locale. You can specify both the language code(ISO-639) and the country code(ISO-3166), e.g. \'en_GB\' or just country: e.g. \'en\'','ffc74409-b8e1-48e7-a318-8810a2f452da',NULL,NULL,NULL,NULL),('default_location','Unknown Location','The name of the location to use as a system default','f8b4c0e5-8aeb-4c44-8086-510bc2752b23',NULL,NULL,NULL,NULL),('default_theme',NULL,'Default theme for users.  OpenMRS ships with themes of \'green\', \'orange\', \'purple\', and \'legacy\'','9095f8f3-6c12-4d19-839d-cdde33bf6304',NULL,NULL,NULL,NULL),('drugOrder.requireDrug','false','Set to value true if you need to specify a formulation(Drug) when creating a drug order.','366e62e9-3651-4753-9471-07e5f3d8c76d',NULL,NULL,NULL,NULL),('emr.admissionEncounterType','a946e0a2-8919-11e5-8b59-08002715d519','UUID of the encounter type for admitting a patient','c4b94bb1-97a8-4252-bec3-c8b17d72b4b5',NULL,NULL,NULL,NULL),('emr.admissionForm',NULL,'UUID of the Admission Form (not required)','f6ed972d-4b7e-40cb-891e-37e060e93f19',NULL,NULL,NULL,NULL),('emr.atFacilityVisitType',NULL,'UUID of the VisitType that we use for newly-created visits','0e47e1a3-2ca9-47e2-b4cb-9447941deff3',NULL,NULL,NULL,NULL),('emr.encounterMatcher','org.openmrs.module.bahmniemrapi.encountertransaction.matcher.EncounterSessionMatcher','custom encounter session matcher','a958f6c0-8919-11e5-8b59-08002715d519',NULL,NULL,NULL,NULL),('emr.exitFromInpatientEncounterType','a9498b80-8919-11e5-8b59-08002715d519','UUID of the encounter type for exiting a patient from inpatient care','fdb6b9ea-db33-44cb-b946-cc9e02baf50f',NULL,NULL,NULL,NULL),('emr.exitFromInpatientForm',NULL,'UUID of the Discharge Form (not required)','6b4bbd81-2615-44fb-933e-adc1b1198414',NULL,NULL,NULL,NULL),('emr.extraPatientIdentifierTypes',NULL,'A list of UUIDs indicating extra Patient Identifier Types that should be displayed','70e973dc-ba4a-4501-b655-eed4974088ae',NULL,NULL,NULL,NULL),('emr.primaryIdentifierType','a908dd78-8919-11e5-8b59-08002715d519','Primary identifier type for looking up patients, generating barcodes, etc','7ee8b4ba-8919-11e5-8b59-08002715d519',NULL,NULL,NULL,NULL),('emr.transferWithinHospitalEncounterType',NULL,'UUID of the encounter type for transferring a patient within the hospital','31f3a8f5-c9c5-4997-ab0c-316cd1480b1d',NULL,NULL,NULL,NULL),('emr.transferWithinHospitalForm',NULL,'UUID of the Transfer Form (not required)','f5bdc721-ba3b-4727-8ced-98ab643ef33e',NULL,NULL,NULL,NULL),('emr.unknownLocation',NULL,'UUID of the Location that represents an Unknown Location','d2e6d8a1-c827-4957-b7bc-a0ab20010bbe',NULL,NULL,NULL,NULL),('emr.unknownProvider',NULL,'UUID of the Provider that represents an Unknown Provider','c2141d39-1dca-405c-8d1e-8b45b4e4b682',NULL,NULL,NULL,NULL),('emr.visitNoteEncounterType',NULL,'UUID of the encounter type for a visit note','82379be3-43c8-46c0-bd47-c6b48911be52',NULL,NULL,NULL,NULL),('emrapi.lastViewedPatientSizeLimit','50','Specifies the system wide number of patients to store as last viewed for a single user,\n            defaults to 50 if not specified','6c62d19c-3780-4181-baff-e83da8babd81',NULL,NULL,NULL,NULL),('emrapi.mandatory','false','true/false whether or not the emrapi module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','4838ce92-98a1-439f-a05a-79159d3b9ab7',NULL,NULL,NULL,NULL),('emrapi.nonDiagnosisConceptSets',NULL,'UUIDs or mapping of non diagnosis concept sets','f39b5049-48ca-4bfe-8068-bd010a4b9fab',NULL,NULL,NULL,NULL),('emrapi.sqlGet.wardsListDetails','SELECT\n  b.bed_number                                                                  AS \'Bed\',\n  concat(pn.given_name,\' \',pn.family_name)                                      AS \'Name\',\n  pv.uuid                                                                       AS \'Patient Uuid\',\n  pi.identifier                                                                 AS \'Id\',\n  pv.gender                                                                     AS \'Gender\',\n  TIMESTAMPDIFF(YEAR, pv.birthdate, CURDATE())                                  AS \'Age\',\n  pa.county_district                                                            AS \'District\',\n  pa.city_village                                                               AS \'Village\',\n  admission_provider_name.given_name                                            AS \'Admission By\',\n  cast(DATE_FORMAT(ev.encounter_datetime, \'%d %b %y %h:%i %p\') AS CHAR)         AS \'Admission Time\',\n  diagnosis.diagnosisConcept                                                    AS \'Diagnosis\',\n  diagnosis.certainty                                                          AS \'Diagnosis Certainty\',\n  diagnosis.diagnosisOrder                                                      AS \'Diagnosis Order\',\n  diagnosis.status                                                              AS \'Diagnosis Status\',\n  diagnosis.diagnosis_provider                                                  AS \'Diagnosis Provider\',\n  cast(DATE_FORMAT(diagnosis.diagnosis_datetime, \'%d %b %y %h:%i %p\') AS CHAR)  AS \'Diagnosis Datetime\',\n  dispositionInfo.providerName                                                  AS \'Disposition By\',\n  cast(DATE_FORMAT(dispositionInfo.providerDate, \'%d %b %y %h:%i %p\') AS CHAR)  AS \'Disposition Time\',\n  adtNotes.value_text                                                           AS \'ADT Notes\',\n  v.uuid                                                                        AS \'Visit Uuid\'\nFROM bed_location_map blm\n    INNER JOIN bed b ON blm.bed_id = b.bed_id\n    INNER JOIN bed_patient_assignment_map bpam ON b.bed_id = bpam.bed_id AND date_stopped IS NULL\n    INNER JOIN person pv ON pv.person_id = bpam.patient_id\n    INNER JOIN person_name pn on pn.person_id = pv.person_id\n    INNER JOIN patient_identifier pi ON pv.person_id = pi.patient_id\n    INNER JOIN person_address pa ON pa.person_id = pv.person_id\n    INNER JOIN (SELECT patient_id, max(encounter_datetime) AS max_encounter_datetime FROM encounter_view WHERE encounter_type_name = \'Admission\' GROUP BY patient_id) latestAdmissionEncounter ON pv.person_id = latestAdmissionEncounter.patient_id\n    INNER JOIN encounter_view ev on ev.patient_id = latestAdmissionEncounter.patient_id and ev.encounter_datetime = latestAdmissionEncounter.max_encounter_datetime\n    INNER JOIN visit v on ev.visit_id = v.visit_id\n    LEFT OUTER JOIN obs adtNotes on adtNotes.encounter_id = ev.encounter_id and adtNotes.voided = 0 and adtNotes.concept_id = (SELECT concept_id from concept_name where name = \'Adt Notes\' and concept_name_type = \'FULLY_SPECIFIED\')\n    LEFT OUTER JOIN encounter_provider ep ON ep.encounter_id = ev.encounter_id\n    LEFT OUTER JOIN provider admission_provider ON admission_provider.provider_id = ep.provider_id\n    LEFT OUTER JOIN person_name admission_provider_name ON admission_provider_name.person_id = admission_provider.person_id\n    LEFT OUTER JOIN (\n        SELECT\n            bpam.patient_id as person_id,\n            concept_name.name as disposition,\n            latestDisposition.obs_datetime as providerDate,\n            person_name.given_name as providerName\n        FROM bed_patient_assignment_map bpam\n            INNER JOIN (SELECT person_id, max(obs_id) obs_id from obs where concept_id = (SELECT concept_id from concept_name where name = \'Disposition\' and concept_name_type = \'FULLY_SPECIFIED\') GROUP BY person_id) maxObsId on  maxObsId.person_id = bpam.patient_id\n            INNER JOIN obs latestDisposition on maxObsId.obs_id = latestDisposition.obs_id and latestDisposition.voided = 0\n            INNER JOIN concept_name on latestDisposition.value_coded = concept_name.concept_id and concept_name_type = \'FULLY_SPECIFIED\'\n            LEFT OUTER JOIN encounter_provider ep ON latestDisposition.encounter_id = ep.encounter_id\n            LEFT OUTER JOIN provider disp_provider ON disp_provider.provider_id = ep.provider_id\n            LEFT OUTER JOIN person_name ON person_name.person_id = disp_provider.person_id\n        where bpam.date_stopped is null\n    ) dispositionInfo on pv.person_id = dispositionInfo.person_id\n    LEFT OUTER JOIN (\n        select\n            diagnosis.person_id as person_id,\n            diagnosis.obs_id as obs_id,\n            diagnosis.obs_datetime as diagnosis_datetime,\n            if(diagnosisConceptName.name is not null, diagnosisConceptName.name, diagnosis.value_text) as diagnosisConcept,\n            certaintyConceptName.name as certainty,\n            diagnosisOrderConceptName.name as diagnosisOrder,\n            diagnosisStatusConceptName.name as status,\n            person_name.given_name as diagnosis_provider\n        from bed_patient_assignment_map bpam\n            INNER JOIN (SELECT patient_id, MAX(date_started) date_started FROM visit GROUP BY patient_id) visitStartDate on visitStartDate.patient_id = bpam.patient_id\n            INNER JOIN visit latestVisit on latestVisit.patient_id = bpam.patient_id and latestVisit.date_started = visitStartDate.date_started\n            INNER JOIN encounter on encounter.visit_id = latestVisit.visit_id\n            INNER JOIN obs diagnosis on bpam.patient_id = diagnosis.person_id and diagnosis.voided = 0 and diagnosis.encounter_id = encounter.encounter_id\n                LEFT OUTER JOIN concept_name diagnosisConceptName on diagnosis.value_coded is not null and diagnosis.value_coded = diagnosisConceptName.concept_id and diagnosisConceptName.concept_name_type=\'FULLY_SPECIFIED\'\n                LEFT OUTER JOIN encounter_provider ep ON diagnosis.encounter_id = ep.encounter_id\n                LEFT OUTER JOIN provider diagnosis_provider ON diagnosis_provider.provider_id = ep.provider_id\n                LEFT OUTER JOIN person_name ON person_name.person_id = diagnosis_provider.person_id\n            INNER JOIN obs certainty on diagnosis.obs_group_id = certainty.obs_group_id and certainty.voided = 0 and certainty.concept_id = (select concept_id from concept_name where name = \'Diagnosis Certainty\' and concept_name_type=\'FULLY_SPECIFIED\')\n                LEFT OUTER JOIN concept_name certaintyConceptName on certainty.value_coded is not null and certainty.value_coded = certaintyConceptName.concept_id and certaintyConceptName.concept_name_type=\'FULLY_SPECIFIED\'\n            INNER JOIN obs diagnosisOrder on diagnosis.obs_group_id = diagnosisOrder.obs_group_id and diagnosisOrder.voided = 0 and diagnosisOrder.concept_id = (select concept_id from concept_name where name = \'Diagnosis order\' and concept_name_type=\'FULLY_SPECIFIED\')\n                LEFT OUTER JOIN concept_name diagnosisOrderConceptName on diagnosisOrder.value_coded is not null and diagnosisOrder.value_coded = diagnosisOrderConceptName.concept_id and diagnosisOrderConceptName.concept_name_type=\'FULLY_SPECIFIED\'\n            LEFT JOIN obs diagnosisStatus on diagnosis.obs_group_id = diagnosisStatus.obs_group_id and diagnosisStatus.voided = 0 and diagnosisStatus.concept_id = (select concept_id from concept_name where name = \'Bahmni Diagnosis Status\' and concept_name_type=\'FULLY_SPECIFIED\')\n                LEFT OUTER JOIN concept_name diagnosisStatusConceptName on diagnosisStatus.value_coded is not null and diagnosisStatus.value_coded = diagnosisStatusConceptName.concept_id and diagnosisStatusConceptName.concept_name_type=\'FULLY_SPECIFIED\'\n        where bpam.date_stopped is null and diagnosis.concept_id in (select concept_id from concept_name where name in (\'Coded Diagnosis\', \'Non-Coded Diagnosis\') and concept_name_type=\'FULLY_SPECIFIED\')\n    ) diagnosis ON diagnosis.person_id = pv.person_id\nWHERE b.status = \'OCCUPIED\' AND ev.encounter_type_name = \'ADMISSION\' AND blm.location_id in (SELECT child_location.location_id FROM location child_location join location parent_location on parent_location.location_id = child_location.parent_location WHERE parent_location.name =${location_name})','Sql query to get list of wards','8caedd13-891a-11e5-8b59-08002715d519',NULL,NULL,NULL,NULL),('emrapi.sqlSearch.activePatients','select distinct\n          concat(pn.given_name,\' \', pn.family_name) as name,\n          pi.identifier as identifier,\n          concat(\"\",p.uuid) as uuid,\n          concat(\"\",v.uuid) as activeVisitUuid,\n          IF(va.value_reference = \"Admitted\", \"true\", \"false\") as hasBeenAdmitted\n        from visit v\n        join person_name pn on v.patient_id = pn.person_id and pn.voided = 0\n        join patient_identifier pi on v.patient_id = pi.patient_id\n        join person p on p.person_id = v.patient_id\n        left outer join visit_attribute va on va.visit_id = v.visit_id and va.attribute_type_id = (\n          select visit_attribute_type_id from visit_attribute_type where name=\"Admission Status\"\n        ) and va.voided = 0\n        where v.date_stopped is null AND v.voided = 0','Sql query to get list of active patients','1f1d52ee-891a-11e5-8b59-08002715d519',NULL,NULL,NULL,NULL),('emrapi.sqlSearch.activePatientsByProvider','\n  select distinct concat(pn.given_name,\" \", pn.family_name) as name,\n  pi.identifier as identifier,\n  concat(\"\",p.uuid) as uuid,\n  concat(\"\",v.uuid) as activeVisitUuid,\n  IF(va.value_reference = \"Admitted\", \"true\", \"false\") as hasBeenAdmitted\n  from\n    visit v join person_name pn on v.patient_id = pn.person_id and pn.voided = 0 and v.voided=0\n    join patient_identifier pi on v.patient_id = pi.patient_id and pi.voided=0\n    join person p on p.person_id = v.patient_id  and p.voided=0\n    join encounter en on en.visit_id = v.visit_id and en.voided=0\n    join encounter_provider ep on ep.encounter_id = en.encounter_id  and ep.voided=0\n    join provider pr on ep.provider_id=pr.provider_id and pr.retired=0\n    join person per on pr.person_id=per.person_id and per.voided=0\n    left outer join visit_attribute va on va.visit_id = v.visit_id and va.voided = 0 and va.attribute_type_id = (\n				select visit_attribute_type_id from visit_attribute_type where name=\"Admission Status\"\n			)\n  where\n    v.date_stopped is null and\n    pr.uuid=${provider_uuid}\n    order by en.encounter_datetime desc','Sql query to get list of active patients by provider uuid','1f1ef621-891a-11e5-8b59-08002715d519',NULL,NULL,NULL,NULL),('emrapi.sqlSearch.additionalSearchHandler',' cn.name = \'${testName}\'','Sql query to get list of admitted patients','1e0a98c0-891a-11e5-8b59-08002715d519',NULL,NULL,NULL,NULL),('emrapi.sqlSearch.admittedPatients','select distinct\n          concat(pn.given_name,\" \", pn.family_name) as name,\n          pi.identifier as identifier,\n          concat(\"\",p.uuid) as uuid,\n          concat(\"\",v.uuid) as activeVisitUuid,\n          IF(va.value_reference = \"Admitted\", \"true\", \"false\") as hasBeenAdmitted\n        from visit v\n        join person_name pn on v.patient_id = pn.person_id and pn.voided = 0\n        join patient_identifier pi on v.patient_id = pi.patient_id\n        join person p on v.patient_id = p.person_id\n        join visit_attribute va on v.visit_id = va.visit_id and va.value_reference = \"Admitted\" and va.voided = 0\n        join visit_attribute_type vat on vat.visit_attribute_type_id = va.attribute_type_id and vat.name = \"Admission Status\"\n        where v.date_stopped is null AND v.voided = 0','Sql query to get list of admitted patients','1f1eb0d8-891a-11e5-8b59-08002715d519',NULL,NULL,NULL,NULL),('emrapi.sqlSearch.highRiskPatients','SELECT DISTINCT\n  concat(pn.given_name, \" \", pn.family_name)           AS name,\n  pi.identifier                                        AS identifier,\n  concat(\"\", p.uuid)                                   AS uuid,\n  concat(\"\", v.uuid)                                   AS activeVisitUuid,\n  IF(va.value_reference = \"Admitted\", \"true\", \"false\") AS hasBeenAdmitted\nFROM person p\n  INNER JOIN person_name pn ON pn.person_id = p.person_id\n  INNER JOIN patient_identifier pi ON pn.person_id = pi.patient_id\n  INNER JOIN visit v ON v.patient_id = p.person_id AND v.date_stopped IS NULL AND v.voided = 0\n  INNER JOIN (SELECT\n                max(test_obs.obs_group_id) AS max_id,\n                test_obs.concept_id,\n                test_obs.person_id\n              FROM obs test_obs\n                INNER JOIN concept c ON c.concept_id = test_obs.concept_id AND test_obs.voided = 0\n                INNER JOIN concept_name cn\n                  ON c.concept_id = cn.concept_id AND cn.concept_name_type = \"FULLY_SPECIFIED\" AND\n                     cn.name IN (${testName})\n              GROUP BY test_obs.person_id, test_obs.concept_id) AS tests ON tests.person_id = v.patient_id\n  INNER JOIN obs abnormal_obs\n    ON abnormal_obs.obs_group_id = tests.max_id AND abnormal_obs.value_coded = 1 AND abnormal_obs.voided = 0\n  INNER JOIN concept abnormal_concept ON abnormal_concept.concept_id = abnormal_obs.concept_id\n  INNER JOIN concept_name abnormal_concept_name\n    ON abnormal_concept.concept_id = abnormal_concept_name.concept_id AND\n       abnormal_concept_name.concept_name_type = \"FULLY_SPECIFIED\" AND\n       abnormal_concept_name.name IN (\"LAB_ABNORMAL\")\n  LEFT OUTER JOIN visit_attribute va ON va.visit_id = v.visit_id AND va.attribute_type_id =\n                                                                     (SELECT visit_attribute_type_id\n                                                                      FROM visit_attribute_type\n                                                                      WHERE name = \"Admission Status\")','SQL QUERY TO get LIST of patients who has pending orders','1f28ca6b-891a-11e5-8b59-08002715d519',NULL,NULL,NULL,NULL),('emrapi.sqlSearch.patientsHasPendingOrders','select distinct\n          concat(pn.given_name, \" \", pn.family_name) as name,\n          pi.identifier as identifier,\n          concat(\"\",p.uuid) as uuid,\n          concat(\"\",v.uuid) as activeVisitUuid,\n          IF(va.value_reference = \"Admitted\", \"true\", \"false\") as hasBeenAdmitted\n        from visit v\n        join person_name pn on v.patient_id = pn.person_id and pn.voided = 0\n        join patient_identifier pi on v.patient_id = pi.patient_id\n        join person p on p.person_id = v.patient_id\n        join orders on orders.patient_id = v.patient_id\n        join order_type on orders.order_type_id = order_type.order_type_id and order_type.name != \"Order\" and order_type.name != \"Drug Order\"\n        left outer join visit_attribute va on va.visit_id = v.visit_id and va.voided = 0 and va.attribute_type_id =\n          (select visit_attribute_type_id from visit_attribute_type where name=\"Admission Status\")\n        where v.date_stopped is null AND v.voided = 0 and order_id not in\n          (select obs.order_id\n            from obs\n          where person_id = pn.person_id and order_id = orders.order_id)','Sql query to get list of patients who has pending orders','1f21ce43-891a-11e5-8b59-08002715d519',NULL,NULL,NULL,NULL),('emrapi.sqlSearch.patientsToAdmit','select distinct concat(pn.given_name,\' \', pn.family_name) as name, pi.identifier as identifier, concat(\"\",p.uuid) as uuid, concat(\"\",v.uuid) as activeVisitUuid from visit v join person_name pn on v.patient_id = pn.person_id and pn.voided = 0 AND v.voided = 0 join patient_identifier pi on v.patient_id = pi.patient_id join person p on v.patient_id = p.person_id join encounter e on v.visit_id = e.visit_id join obs o on e.encounter_id = o.encounter_id and o.voided = 0 join concept c on o.value_coded = c.concept_id join concept_name cn on c.concept_id = cn.concept_id where v.date_stopped is null and cn.name = \'Admit Patient\' and v.visit_id not in (select visit_id from encounter ie join encounter_type iet on iet.encounter_type_id = ie.encounter_type where iet.name = \'ADMISSION\')','Sql query to get list of patients to be admitted','1e08d000-891a-11e5-8b59-08002715d519',NULL,NULL,NULL,NULL),('emrapi.sqlSearch.patientsToDischarge','SELECT DISTINCT\n          concat(pn.given_name, \' \', pn.family_name) AS name,\n          pi.identifier AS identifier,\n          concat(\"\", p.uuid) AS uuid,\n          concat(\"\", v.uuid) AS activeVisitUuid,\n          IF(va.value_reference = \"Admitted\", \"true\", \"false\") as hasBeenAdmitted\n        FROM visit v\n        INNER JOIN person_name pn ON v.patient_id = pn.person_id and pn.voided is FALSE\n        INNER JOIN patient_identifier pi ON v.patient_id = pi.patient_id and pi.voided is FALSE\n        INNER JOIN person p ON v.patient_id = p.person_id\n        Inner Join (SELECT DISTINCT v.visit_id\n          FROM encounter en\n          INNER JOIN visit v ON v.visit_id = en.visit_id AND en.encounter_type =\n            (SELECT encounter_type_id\n              FROM encounter_type\n            WHERE name = \"ADMISSION\")) v1 on v1.visit_id = v.visit_id\n        INNER JOIN encounter e ON v.visit_id = e.visit_id\n        INNER JOIN obs o ON e.encounter_id = o.encounter_id\n        INNER JOIN concept_name cn ON o.value_coded = cn.concept_id AND cn.concept_name_type = \"FULLY_SPECIFIED\" AND cn.voided is FALSE\n        left outer join visit_attribute va on va.visit_id = v.visit_id and va.voided = 0 and va.attribute_type_id =\n          (select visit_attribute_type_id from visit_attribute_type where name=\"Admission Status\")\n        LEFT OUTER JOIN encounter e1 ON e1.visit_id = v.visit_id AND e1.encounter_type = (\n          SELECT encounter_type_id\n            FROM encounter_type\n          WHERE name = \"DISCHARGE\") AND e1.voided is FALSE\n        WHERE v.date_stopped IS NULL AND v.voided = 0 AND o.voided = 0 AND cn.name = \"Discharge Patient\" AND e1.encounter_id IS NULL','Sql query to get list of patients to discharge','1f1e6aca-891a-11e5-8b59-08002715d519',NULL,NULL,NULL,NULL),('emrapi.started','true','DO NOT MODIFY. true/false whether or not the emrapi module has been started.  This is used to make sure modules that were running  prior to a restart are started again','ec73302a-ed51-40a2-8d7f-fa2880df13af',NULL,NULL,NULL,NULL),('emrapi.suppressedDiagnosisConcepts',NULL,'UUIDs or mappings of suppressed diagnosis concepts','009b4f41-141b-47eb-a78d-456113e3563e',NULL,NULL,NULL,NULL),('encounter.feed.publish.url','/openmrs/ws/rest/v1/bahmnicore/bahmniencounter/%s?includeAll=true','Url to be published on encounter save.','61d40749-891a-11e5-8b59-08002715d519',NULL,NULL,NULL,NULL),('encounterForm.obsSortOrder','number','The sort order for the obs listed on the encounter edit form.  \'number\' sorts on the associated numbering from the form schema.  \'weight\' sorts on the order displayed in the form schema.','83810b08-ff9f-456e-81b9-d4f25cbe90f3',NULL,NULL,NULL,NULL),('encounterModifier.groovy.allowCaching','true','Allow Groovy Caching','e16605a1-266a-47cb-8385-d07742646640',NULL,NULL,NULL,NULL),('EncounterType.encounterTypes.locked','false','saving, retiring or deleting an Encounter Type is not permitted, if true','a49d3ba2-2262-4948-abad-e773695a20f3','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL),('event.mandatory','false','true/false whether or not the event module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','03e2208c-87c4-495b-bf06-6ef111c60079',NULL,NULL,NULL,NULL),('event.started','true','DO NOT MODIFY. true/false whether or not the event module has been started.  This is used to make sure modules that were running  prior to a restart are started again','a6b4927a-b060-4349-bd07-90ddd1054bcc',NULL,NULL,NULL,NULL),('Form.forms.locked','false','Set to a value of true if you do not want any changes to be made on forms, else set to false.','7b2cad5b-b799-49c2-a33e-a5f6329ee5ff',NULL,NULL,NULL,NULL),('FormEntry.enableDashboardTab','true','true/false whether or not to show a Form Entry tab on the patient dashboard','a42eedde-44fd-4ecd-8633-2a556f2146a1','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL),('FormEntry.enableOnEncounterTab','false','true/false whether or not to show a Enter Form button on the encounters tab of the patient dashboard','e042930e-1ddd-4eb3-83e9-c8aed39097e1','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL),('graph.color.absolute','rgb(20,20,20)','Color of the \'invalid\' section of numeric graphs on the patient dashboard.','f3612d01-ebf8-4068-ac73-933e84ca94bd',NULL,NULL,NULL,NULL),('graph.color.critical','rgb(200,0,0)','Color of the \'critical\' section of numeric graphs on the patient dashboard.','2fb9f489-c5a8-4eb3-8ad2-a3ae012d24e8',NULL,NULL,NULL,NULL),('graph.color.normal','rgb(255,126,0)','Color of the \'normal\' section of numeric graphs on the patient dashboard.','73f32c66-8dc8-4bfd-87de-61db4ab1d1e2',NULL,NULL,NULL,NULL),('gzip.enabled','false','Set to \'true\' to turn on OpenMRS\'s gzip filter, and have the webapp compress data before sending it to any client that supports it. Generally use this if you are running Tomcat standalone. If you are running Tomcat behind Apache, then you\'d want to use Apache to do gzip compression.','b4838fe0-86c5-456e-87c1-2b8628a18efb','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL),('hl7_archive.dir','hl7_archives','The default name or absolute path for the folder where to write the hl7_in_archives.','22735350-507a-4245-bc45-bab3c818228b',NULL,NULL,NULL,NULL),('hl7_processor.ignore_missing_patient_non_local','false','If true, hl7 messages for patients that are not found and are non-local will silently be dropped/ignored','b77d1ccc-b7aa-45da-8166-2b8556089f38','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL),('htmlwidgets.mandatory','false','true/false whether or not the htmlwidgets module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','b15b36bb-042d-456a-8400-5b1d4249444e',NULL,NULL,NULL,NULL),('htmlwidgets.started','true','DO NOT MODIFY. true/false whether or not the htmlwidgets module has been started.  This is used to make sure modules that were running  prior to a restart are started again','a715a870-7547-4662-83ee-b76b0c49309a',NULL,NULL,NULL,NULL),('idgen-webservices.mandatory','false','true/false whether or not the idgen-webservices module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','e2ab49b9-865f-4420-bf4c-327338a45afd',NULL,NULL,NULL,NULL),('idgen-webservices.started','true','DO NOT MODIFY. true/false whether or not the idgen-webservices module has been started.  This is used to make sure modules that were running  prior to a restart are started again','0a0319c0-f348-432b-972f-3dee72506705',NULL,NULL,NULL,NULL),('idgen.database_version','2.5.1','DO NOT MODIFY.  Current database version number for the idgen module.','7ee0c9d2-8919-11e5-8b59-08002715d519',NULL,NULL,NULL,NULL),('idgen.mandatory','false','true/false whether or not the idgen module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','04733ac0-2b6e-4eb2-a131-8f5fe2f63f68',NULL,NULL,NULL,NULL),('idgen.started','true','DO NOT MODIFY. true/false whether or not the idgen module has been started.  This is used to make sure modules that were running  prior to a restart are started again','17b4e2f9-c15e-4503-bd5b-3c459590561f',NULL,NULL,NULL,NULL),('layout.address.format','<org.openmrs.layout.web.address.AddressTemplate>\n    <nameMappings class=\"properties\">\n      <property name=\"postalCode\" value=\"Location.postalCode\"/>\n      <property name=\"address2\" value=\"Location.address2\"/>\n      <property name=\"address1\" value=\"Location.address1\"/>\n      <property name=\"country\" value=\"Location.country\"/>\n      <property name=\"stateProvince\" value=\"Location.stateProvince\"/>\n      <property name=\"cityVillage\" value=\"Location.cityVillage\"/>\n    </nameMappings>\n    <sizeMappings class=\"properties\">\n      <property name=\"postalCode\" value=\"10\"/>\n      <property name=\"address2\" value=\"40\"/>\n      <property name=\"address1\" value=\"40\"/>\n      <property name=\"country\" value=\"10\"/>\n      <property name=\"stateProvince\" value=\"10\"/>\n      <property name=\"cityVillage\" value=\"10\"/>\n    </sizeMappings>\n    <lineByLineFormat>\n      <string>address1</string>\n      <string>address2</string>\n      <string>cityVillage stateProvince country postalCode</string>\n    </lineByLineFormat>\n  </org.openmrs.layout.web.address.AddressTemplate>','XML description of address formats','0e019139-9376-40c5-84d1-376aa8e1a24c',NULL,NULL,NULL,NULL),('layout.name.format','short','Format in which to display the person names.  Valid values are short, long','4b883292-1624-4e68-ab58-2715d9e58ccd',NULL,NULL,NULL,NULL),('locale.allowed.list','en, es, fr, it, pt','Comma delimited list of locales allowed for use on system','a844e500-4952-493e-9882-498b8db7b8f6',NULL,NULL,NULL,NULL),('location.field.style','default','Type of widget to use for location fields','0852c979-bf33-4db7-9dfd-98d9e7a040d5',NULL,NULL,NULL,NULL),('log.layout','%p - %C{1}.%M(%L) |%d{ISO8601}| %m%n','A log layout pattern which is used by the OpenMRS file appender.','21c0538d-225f-4e92-8ea9-2b62daeabbca',NULL,NULL,NULL,NULL),('log.level','org.openmrs.api:info','Logging levels for log4j.xml. Valid format is class:level,class:level. If class not specified, \'org.openmrs.api\' presumed. Valid levels are trace, debug, info, warn, error or fatal','fc7b9930-a66b-4a9d-9209-3aa7defde351',NULL,NULL,NULL,NULL),('log.location',NULL,'A directory where the OpenMRS log file appender is stored. The log file name is \'openmrs.log\'.','5e499803-daf4-473e-abc3-19da3009ba80',NULL,NULL,NULL,NULL),('mail.debug','false','true/false whether to print debugging information during mailing','815703dd-9cfa-4c16-9a27-b49ed24260a6',NULL,NULL,NULL,NULL),('mail.default_content_type','text/plain','Content type to append to the mail messages','852e1278-84c9-4bce-9195-d0dc004af1a0',NULL,NULL,NULL,NULL),('mail.from','info@openmrs.org','Email address to use as the default from address','1116625a-f6e4-42fa-8558-f6d7d868a988',NULL,NULL,NULL,NULL),('mail.password','test','Password for the SMTP user (if smtp_auth is enabled)','3b5f1cef-179f-4f36-9322-afd52b8e97a6',NULL,NULL,NULL,NULL),('mail.smtp.starttls.enable','false','Set to true to enable TLS encryption, else set to false','f0084224-f8bd-4eba-9ed4-0866dd96f539',NULL,NULL,NULL,NULL),('mail.smtp_auth','false','true/false whether the smtp host requires authentication','c2157a64-8b2d-4091-8298-ae18c68deb97',NULL,NULL,NULL,NULL),('mail.smtp_host','localhost','SMTP host name','191bc0cd-9533-4a2e-8934-4e2d44b6dfe5',NULL,NULL,NULL,NULL),('mail.smtp_port','25','SMTP port','a1602ce6-cfa6-402c-a4f4-3fb2a610cdda',NULL,NULL,NULL,NULL),('mail.transport_protocol','smtp','Transport protocol for the messaging engine. Valid values: smtp','942356de-4e07-4001-95f2-658276574e1f',NULL,NULL,NULL,NULL),('mail.user','test','Username of the SMTP user (if smtp_auth is enabled)','3a5816dc-6ba3-40f1-a8d7-de8176920062',NULL,NULL,NULL,NULL),('metadatamapping.addLocalMappings',NULL,'Specifies whether the concept mappings to the local dictionary should be created when exporting concepts','354c6cba-f515-4992-a680-f951fa868d4c',NULL,NULL,NULL,NULL),('metadatamapping.mandatory','false','true/false whether or not the metadatamapping module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','3267858e-1843-4b07-862d-9324dc65fdfa',NULL,NULL,NULL,NULL),('metadatamapping.started','true','DO NOT MODIFY. true/false whether or not the metadatamapping module has been started.  This is used to make sure modules that were running  prior to a restart are started again','4828ec73-d87c-4d88-8370-e9e119729ce7',NULL,NULL,NULL,NULL),('metadatasharing.database_version','1.0','DO NOT MODIFY.  Current database version number for the metadatasharing module.','5c1e6cd0-d843-44fe-ae35-06a4cd7ae8b6',NULL,NULL,NULL,NULL),('metadatasharing.enableOnTheFlyPackages','false','Specifies whether metadata packages can be exported on the fly','ef38606e-c4d2-488f-9f14-870bf5e07afa',NULL,NULL,NULL,NULL),('metadatasharing.mandatory','false','true/false whether or not the metadatasharing module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','cfe6143f-b00e-4b18-87c6-29e6848bf0a9',NULL,NULL,NULL,NULL),('metadatasharing.persistIdsForClasses',NULL,'A comma separated list of class package/names that denotes classes to try and persist ids for. Common options: org.openmrs.Concept,org.openmrs.Form,org.openmrs.ConceptDatatype,org.openmrs.ConceptClass,org.openmrs.EncounterType,org.openmrs.IdentifierType,org.openmrs.RelationshipType,org.openmrs.Location','07b4fdcc-2521-4b6f-9edb-0cc570a3de9b',NULL,NULL,NULL,NULL),('metadatasharing.preferredConceptSourceIds',NULL,'Comma-separated list of concept source Ids for preferred sources, in case an incoming concept \nhas duplicate mappings to any of these sources, no confirmation will be required unless its \ndatatype or concept class differs from that of the existing concept','b1acb065-f8db-4dca-95e4-57d753738c0f',NULL,NULL,NULL,NULL),('metadatasharing.started','true','DO NOT MODIFY. true/false whether or not the metadatasharing module has been started.  This is used to make sure modules that were running  prior to a restart are started again','d7e07671-e8a6-4037-92dd-18933e9f9287',NULL,NULL,NULL,NULL),('metadatasharing.webservicesKey',NULL,'Key to grant access to remote systems to consume module webservices RESTfully','7ab8825a-af07-4a82-982a-f37b52222113',NULL,NULL,NULL,NULL),('minSearchCharacters','2','Number of characters user must input before searching is started.','fbfe06d4-9d9c-40c8-8650-4185ed75ea7a',NULL,NULL,NULL,NULL),('module_repository_folder','modules','Name of the folder in which to store the modules','1828bfd8-23fd-4593-813b-4de1861bb878',NULL,NULL,NULL,NULL),('mrs.genders','{\"M\":\"Male\", \"F\":\"Female\",\"O\":\"Other\"}','List of gender and gender codes used across MRS',NULL,NULL,NULL,NULL,NULL),('newPatientForm.relationships',NULL,'Comma separated list of the RelationshipTypes to show on the new/short patient form.  The list is defined like \'3a, 4b, 7a\'.  The number is the RelationshipTypeId and the \'a\' vs \'b\' part is which side of the relationship is filled in by the user.','cf31c1fd-3685-4df7-8d40-cd15727c9a23',NULL,NULL,NULL,NULL),('new_patient_form.showRelationships','false','true/false whether or not to show the relationship editor on the addPatient.htm screen','d5eba44f-c3f9-4d94-9376-adb31558eba0','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL),('obs.complex_obs_dir','complex_obs','Default directory for storing complex obs.','637bc8b3-10a2-4e68-b3ad-dbc7a7d20710',NULL,NULL,NULL,NULL),('openmrs-atomfeed.mandatory','false','true/false whether or not the openmrs-atomfeed module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','df28471f-7327-4e47-a306-2930cb43e3ae',NULL,NULL,NULL,NULL),('openmrs-atomfeed.started','true','DO NOT MODIFY. true/false whether or not the openmrs-atomfeed module has been started.  This is used to make sure modules that were running  prior to a restart are started again','5d5aa171-f7de-475e-884c-2bec3506e5ff',NULL,NULL,NULL,NULL),('order.dosingInstructionsConceptUuid','f76d2b7b-8919-11e5-8b59-08002715d519','Global property pointing to duration units concept set','f77314d1-8919-11e5-8b59-08002715d519',NULL,NULL,NULL,NULL),('order.drugDispensingUnitsConceptUuid','b5a7f8c3-8919-11e5-8b59-08002715d519','Dose Quantity Units UUID','b5a7c500-8919-11e5-8b59-08002715d519',NULL,NULL,NULL,NULL),('order.drugDosingUnitsConceptUuid','f751eb55-8919-11e5-8b59-08002715d519','Global property pointing to dosing units concept set','f7588658-8919-11e5-8b59-08002715d519',NULL,NULL,NULL,NULL),('order.drugRoutesConceptUuid','f75acc3d-8919-11e5-8b59-08002715d519','Global property pointing to drug routes concept set','f7623e0e-8919-11e5-8b59-08002715d519',NULL,NULL,NULL,NULL),('order.durationUnitsConceptUuid','f7645ca5-8919-11e5-8b59-08002715d519','Global property pointing to duration units concept set','f765de5b-8919-11e5-8b59-08002715d519',NULL,NULL,NULL,NULL),('order.nextOrderNumberSeed','1','The next order number available for assignment','60acb77c-3444-4e33-a93d-ab0bbcfa325b',NULL,NULL,NULL,NULL),('order.orderNumberGeneratorBeanId',NULL,'Specifies spring bean id of the order generator to use when assigning order numbers','cdfbffea-799e-4b4a-949b-c3061d2f276e',NULL,NULL,NULL,NULL),('order.testSpecimenSourcesConceptUuid',NULL,'Specifies the uuid of the concept set where its members represent the possible test specimen sources','2a09d845-511e-4815-87ea-8321211e9a19',NULL,NULL,NULL,NULL),('patient.defaultPatientIdentifierValidator','org.openmrs.patient.impl.LuhnIdentifierValidator','This property sets the default patient identifier validator.  The default validator is only used in a handful of (mostly legacy) instances.  For example, it\'s used to generate the isValidCheckDigit calculated column and to append the string \"(default)\" to the name of the default validator on the editPatientIdentifierType form.','94ec9fdf-412b-4d7d-8240-9ff6164d4c5c',NULL,NULL,NULL,NULL),('patient.headerAttributeTypes',NULL,'A comma delimited list of PersonAttributeType names that will be shown on the patient dashboard','e66440c1-bb1a-4d47-9a22-4b5c84d02220',NULL,NULL,NULL,NULL),('patient.identifierPrefix',NULL,'This property is only used if patient.identifierRegex is empty.  The string here is prepended to the sql indentifier search string.  The sql becomes \"... where identifier like \'<PREFIX><QUERY STRING><SUFFIX>\';\".  Typically this value is either a percent sign (%) or empty.','63f18e88-e3d4-4c47-a514-b0b4a406cf0f',NULL,NULL,NULL,NULL),('patient.identifierRegex',NULL,'WARNING: Using this search property can cause a drop in mysql performance with large patient sets.  A MySQL regular expression for the patient identifier search strings.  The @SEARCH@ string is replaced at runtime with the user\'s search string.  An empty regex will cause a simply \'like\' sql search to be used. Example: ^0*@SEARCH@([A-Z]+-[0-9])?$','67a8ee8d-e6cb-42ed-8c4d-d05fb9151426',NULL,NULL,NULL,NULL),('patient.identifierSearchPattern',NULL,'If this is empty, the regex or suffix/prefix search is used.  Comma separated list of identifiers to check.  Allows for faster searching of multiple options rather than the slow regex. e.g. @SEARCH@,0@SEARCH@,@SEARCH-1@-@CHECKDIGIT@,0@SEARCH-1@-@CHECKDIGIT@ would turn a request for \"4127\" into a search for \"in (\'4127\',\'04127\',\'412-7\',\'0412-7\')\"','4ccad229-5a15-484c-a47a-cf9f83002081',NULL,NULL,NULL,NULL),('patient.identifierSuffix',NULL,'This property is only used if patient.identifierRegex is empty.  The string here is prepended to the sql indentifier search string.  The sql becomes \"... where identifier like \'<PREFIX><QUERY STRING><SUFFIX>\';\".  Typically this value is either a percent sign (%) or empty.','7953b2a3-8c7d-4cfe-ace1-c2d7db8e9388',NULL,NULL,NULL,NULL),('patient.listingAttributeTypes',NULL,'A comma delimited list of PersonAttributeType names that should be displayed for patients in _lists_','c32cdd5e-88f1-4d47-8384-2352800eafa1',NULL,NULL,NULL,NULL),('patient.nameValidationRegex','^[a-zA-Z \\-]+$','Names of the patients must pass this regex. Eg : ^[a-zA-Z \\-]+$ contains only english alphabet letters, spaces, and hyphens. A value of .* or the empty string means no validation is done.','c11471e8-15b4-45a1-9eb1-fcc6a97b6517',NULL,NULL,NULL,NULL),('patient.viewingAttributeTypes',NULL,'A comma delimited list of PersonAttributeType names that should be displayed for patients when _viewing individually_','c279dad8-29f0-4517-b5c3-5d7975a47fbf',NULL,NULL,NULL,NULL),('PatientIdentifierType.locked','false','Set to a value of true if you do not want allow editing patient identifier types, else set to false.','a29c3a38-9ec6-4081-9856-6be3190242bc',NULL,NULL,NULL,NULL),('patientSearch.matchMode','START','Specifies how patient names are matched while searching patient. Valid values are \'ANYWHERE\' or \'START\'. Defaults to start if missing or invalid value is present.','eaf379c7-028b-4b0d-9cc0-67eb5f26665b',NULL,NULL,NULL,NULL),('patient_identifier.importantTypes',NULL,'A comma delimited list of PatientIdentifier names : PatientIdentifier locations that will be displayed on the patient dashboard.  E.g.: TRACnet ID:Rwanda,ELDID:Kenya','24ba30de-06d1-4f47-be99-51f8d2864ab3',NULL,NULL,NULL,NULL),('person.attributeSearchMatchMode','EXACT','Specifies how person attributes are matched while searching person. Valid values are \'ANYWHERE\' or \'EXACT\'. Defaults to exact if missing or invalid value is present.','8b4f5b40-e141-46d8-b8e9-257f96db1d85',NULL,NULL,NULL,NULL),('person.searchMaxResults','1000','The maximum number of results returned by patient searches','134c7c7e-5c98-4dd3-8a01-e39b16a70ed8',NULL,NULL,NULL,NULL),('PersonAttributeType.locked','false','Set to a value of true if you do not want allow editing person attribute types, else set to false.','96001b67-2ee5-4ae6-b6e5-4b957b80cc43',NULL,NULL,NULL,NULL),('provider.unknownProviderUuid',NULL,'Specifies the uuid of the Unknown Provider account','e2f563cd-b050-40d8-a035-1f2ec3f81912',NULL,NULL,NULL,NULL),('providermanagement.addressWidget','personAddress','Address widget to use throughout the module','8ebbf3b7-06c8-4fa1-82cc-cc6a359bd457',NULL,NULL,NULL,NULL),('providermanagement.advancedSearchPersonAttributeType',NULL,'Person attribute type, specified by uuid, to use as a search field on the advanced search page','faaeaa66-29f6-40f4-aa4c-e13ded9091d4',NULL,NULL,NULL,NULL),('providermanagement.database_version','1.0','DO NOT MODIFY.  Current database version number for the providermanagement module.','e7f6b715-49c4-49a5-8a13-e83cfebd97f3',NULL,NULL,NULL,NULL),('providermanagement.historicalPatientListDisplayFields','Identifier:patient.patientIdentifier.identifier|Given Name:patient.personName.givenName|Family Name:patient.personName.familyName|Age:patient.age|Gender:patient.gender|Start Date:relationship.startDate|End Date:relationship.endDate','Fields to display in the historical patient lists; specified as a pipe-delimited list of label/field pairs','ba7ec8c0-89d0-4bb0-ae94-e3b4ce85c6fb',NULL,NULL,NULL,NULL),('providermanagement.historicalProviderListDisplayFields','Identifier:provider.identifier|Given Name:provider.person.personName.givenName|Family Name:provider.person.personName.familyName|Role:provider.providerRole|Gender:provider.person.gender|Start Date:relationship.startDate|End Date:relationship.endDate','Fields to display in the historical provider lists; specified as a pipe-delimited list of label/field pairs','1b35cda6-c5c3-48eb-b222-c4fd0eea1d83',NULL,NULL,NULL,NULL),('providermanagement.mandatory','false','true/false whether or not the providermanagement module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','15ab627d-3b6e-4d92-b224-0f754dbae746',NULL,NULL,NULL,NULL),('providermanagement.patientListDisplayFields','Identifier:patient.patientIdentifier.identifier|Given Name:patient.personName.givenName|Family Name:patient.personName.familyName|Age:patient.age|Gender:patient.gender|Start Date:relationship.startDate','Fields to display in the patient lists; specified as a pipe-delimited list of label/field pairs','65ce2793-c1b4-4c16-9d1d-8506cfddcbf4',NULL,NULL,NULL,NULL),('providermanagement.patientSearchDisplayFields','Identifier:patient.patientIdentifier.identifier|Given Name:patient.personName.givenName|Family Name:patient.personName.familyName|Age:patient.age|Gender:patient.gender','Fields to display in the patient search results; specified as a pipe-delimited list of label/field pairs','568ca74c-8173-453c-876d-f8c132133df8',NULL,NULL,NULL,NULL),('providermanagement.personAttributeTypes',NULL,'Person attributes to display on the provider dashboard; specified as a pipe-delimited list of person attribute type uuids','00da180b-0fa4-46f4-831e-c96efc6c81c1',NULL,NULL,NULL,NULL),('providermanagement.personSearchDisplayFields','Given Name:person.personName.givenName|Family Name:person.personName.familyName|Age:person.age|Gender:person.gender','Fields to display in the person search results; specified as a pipe-delimited list of label/field pairs','52b2ab7c-c9e7-4e0c-b1ef-336d72af5d90',NULL,NULL,NULL,NULL),('providermanagement.providerListDisplayFields','Identifier:provider.identifier|Given Name:provider.person.personName.givenName|Family Name:provider.person.personName.familyName|Role:provider.providerRole|Gender:provider.person.gender|Start Date:relationship.startDate','Fields to display in the provider lists; specified as a pipe-delimited list of label/field pairs','bce918a6-464f-41e1-a45a-69a929ab63b3',NULL,NULL,NULL,NULL),('providermanagement.providerSearchDisplayFields','Identifier:provider.identifier|Given Name:provider.person.personName.givenName|Family Name:provider.person.personName.familyName|Role:provider.providerRole|Gender:provider.person.gender','Fields to display in the provider search results; specified as a pipe-delimited list of label/field pairs','efd15d90-69aa-4f7d-8989-617fb0d4eb63',NULL,NULL,NULL,NULL),('providermanagement.restrictSearchToProvidersWithProviderRoles','false','True/false whether to restrict providers to those with roles','f1edb515-1e95-4165-8e8d-b687f21ffc55',NULL,NULL,NULL,NULL),('providermanagement.started','true','DO NOT MODIFY. true/false whether or not the providermanagement module has been started.  This is used to make sure modules that were running  prior to a restart are started again','6d67d17f-c9e3-4666-8b6a-4a7f04431aa4',NULL,NULL,NULL,NULL),('providerSearch.matchMode','EXACT','Specifies how provider identifiers are matched while searching for providers. Valid values are START,EXACT, END or ANYWHERE','2470bad3-e778-4df5-bd16-351b2e999a3c',NULL,NULL,NULL,NULL),('reference-data.mandatory','false','true/false whether or not the reference-data module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','705e91c4-30be-4b13-b78c-da42836cf4ce',NULL,NULL,NULL,NULL),('reference-data.started','true','DO NOT MODIFY. true/false whether or not the reference-data module has been started.  This is used to make sure modules that were running  prior to a restart are started again','1b1268fe-b705-4142-b2ee-fe33443d7bde',NULL,NULL,NULL,NULL),('report.deleteReportsAgeInHours','72','Reports that are not explicitly saved are deleted automatically when they are this many hours old. (Values less than or equal to zero means do not delete automatically)','b3c8ea5e-2a03-4248-aa46-ed9ad16e86ec',NULL,NULL,NULL,NULL),('report.xmlMacros',NULL,'Macros that will be applied to Report Schema XMLs when they are interpreted. This should be java.util.properties format.','0a7c1f8e-8153-4d8c-bb6a-9f66e65a0843',NULL,NULL,NULL,NULL),('reporting.dataEvaluationBatchSize','-1','This determines whether to run evaluators for Data in batches and what the size of those batches should be.\nA value of less than or equal to 0 indicates that no batching is desired.','63d5d7d1-1c11-44bc-9a82-6377c907d877',NULL,NULL,NULL,NULL),('reporting.defaultDateFormat','dd/MMM/yyyy','Default date format to use when formatting report data','0e401f7e-b1a4-4238-b749-5da52868e81d',NULL,NULL,NULL,NULL),('reporting.defaultLocale','en','Default locale to use when formatting report data','c5f3a387-8cc7-4842-8b7a-93e075988a4c',NULL,NULL,NULL,NULL),('reporting.evaluationLoggerEnabled','false','If false, will disable the built in use of the evaluation logger to log evaluation information for performance diagnostics','7087444e-a955-405e-8116-c0250950f5d4',NULL,NULL,NULL,NULL),('reporting.includeDataExportsAsDataSetDefinitions','false','If reportingcompatibility is installed, this indicates whether data exports should be exposed as Dataset Definitions','a324c7b7-3e17-48db-854f-97d52394d8ec',NULL,NULL,NULL,NULL),('reporting.mandatory','false','true/false whether or not the reporting module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','b1c3731f-c34c-4a2f-ae3e-c7056303e0fb',NULL,NULL,NULL,NULL),('reporting.maxCachedReports','10','The maximum number of reports whose underlying data and output should be kept in the cache at any one time','add00c82-2320-41c5-a38e-de44e2c45576',NULL,NULL,NULL,NULL),('reporting.maxReportsToRun','1','The maximum number of reports that should be processed at any one time','1d754a79-4032-4353-aac4-47bac4c4b4f1',NULL,NULL,NULL,NULL),('reporting.preferredIdentifierTypes',NULL,'Pipe-separated list of patient identifier type names, which should be displayed on default patient datasets','04ffaff8-0f3e-4b75-a93c-1477161ad414',NULL,NULL,NULL,NULL),('reporting.runReportCohortFilterMode','showIfNull','Supports the values hide,showIfNull,show which determine whether the cohort selector should be available in the run report page','943e1ed2-8bdd-4aea-bdba-67228cc975ec',NULL,NULL,NULL,NULL),('reporting.started','true','DO NOT MODIFY. true/false whether or not the reporting module has been started.  This is used to make sure modules that were running  prior to a restart are started again','cefcc329-9864-4f64-aa38-abdfe5d8c321',NULL,NULL,NULL,NULL),('reporting.testPatientsCohortDefinition',NULL,'Points to a cohort definition representing all test/fake patients that you want to exclude from all queries and reports. You may set this to the UUID of a saved cohort definition, or to \"library:keyInADefinitionLibrary\"','e290e6a5-424d-49f7-8167-6bdb654f1fb7',NULL,NULL,NULL,NULL),('reportProblem.url','http://errors.openmrs.org/scrap','The openmrs url where to submit bug reports','fa8ab528-782b-442e-ba8e-0bf0c3e02d69',NULL,NULL,NULL,NULL),('scheduler.password','test','Password for the OpenMRS user that will perform the scheduler activities','f2912a03-7552-4e4e-92f9-6eb6e913f1cf',NULL,NULL,NULL,NULL),('scheduler.username','admin','Username for the OpenMRS user that will perform the scheduler activities','227e37c6-f953-41aa-a520-e53da438ea6f',NULL,NULL,NULL,NULL),('search.caseSensitiveDatabaseStringComparison','true','Indicates whether database string comparison is case sensitive or not. Setting this to false for MySQL with a case insensitive collation improves search performance.','a7cdee96-0ebb-430b-a774-08baa2c6a4cb',NULL,NULL,NULL,NULL),('search.indexVersion','3','Indicates the index version. If it is blank, the index needs to be rebuilt.','345c4ca6-171a-4db4-85b9-feae8de7d848',NULL,NULL,NULL,NULL),('searchWidget.batchSize','200','The maximum number of search results that are returned by an ajax call','7bf40d4f-e88a-4199-a942-0bcabc855b1e',NULL,NULL,NULL,NULL),('searchWidget.dateDisplayFormat',NULL,'Date display format to be used to display the date somewhere in the UI i.e the search widgets and autocompletes','9fb6fbc8-07e8-492b-94aa-33aa1747657a',NULL,NULL,NULL,NULL),('searchWidget.maximumResults','2000','Specifies the maximum number of results to return from a single search in the search widgets','0bd47216-02d9-479d-96fe-cd336516e2d4',NULL,NULL,NULL,NULL),('searchWidget.runInSerialMode','false','Specifies whether the search widgets should make ajax requests in serial or parallel order, a value of true is appropriate for implementations running on a slow network connection and vice versa','abe35471-e41a-4884-bcbe-08a0c42284e4','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL),('searchWidget.searchDelayInterval','300','Specifies time interval in milliseconds when searching, between keyboard keyup event and triggering the search off, should be higher if most users are slow when typing so as to minimise the load on the server','4eed0dbe-9d9b-44b2-83e4-fd6e29ea672c',NULL,NULL,NULL,NULL),('security.allowedFailedLoginsBeforeLockout','7','Maximum number of failed logins allowed after which username is locked out','3d631a0e-58e6-4a15-8397-19d41efe1fb8',NULL,NULL,NULL,NULL),('security.passwordCannotMatchUsername','true','Configure whether passwords must not match user\'s username or system id','1fbb4a0e-8843-4d05-9fc1-23c7822b9be2','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL),('security.passwordCustomRegex',NULL,'Configure a custom regular expression that a password must match','f140f9a2-bf0d-4c21-95fc-9cf97c7a9d53',NULL,NULL,NULL,NULL),('security.passwordMinimumLength','8','Configure the minimum length required of all passwords','450914af-f7e3-4e5a-9f45-ede414cd431a',NULL,NULL,NULL,NULL),('security.passwordRequiresDigit','true','Configure whether passwords must contain at least one digit','beebf7c3-368a-406b-97c2-503ead5af161','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL),('security.passwordRequiresNonDigit','true','Configure whether passwords must contain at least one non-digit','e3ce9f81-cf27-48ed-8d55-6c66407bf18d','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL),('security.passwordRequiresUpperAndLowerCase','true','Configure whether passwords must contain both upper and lower case characters','2046554f-8af9-4fcb-94f6-783b3fc2a369','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL),('serialization.xstream.mandatory','false','true/false whether or not the serialization.xstream module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','44b5427b-8ac9-41dc-91bb-c489c0e17a32',NULL,NULL,NULL,NULL),('serialization.xstream.started','true','DO NOT MODIFY. true/false whether or not the serialization.xstream module has been started.  This is used to make sure modules that were running  prior to a restart are started again','b5f6f5d7-cf52-42b6-b635-ef5c9539e3ff',NULL,NULL,NULL,NULL),('uicommons.mandatory','false','true/false whether or not the uicommons module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','a75254be-582b-46df-88af-f6688105b1a0',NULL,NULL,NULL,NULL),('uicommons.started','true','DO NOT MODIFY. true/false whether or not the uicommons module has been started.  This is used to make sure modules that were running  prior to a restart are started again','79afdd4a-9a8a-4c8d-8fd4-2f5579d6da06',NULL,NULL,NULL,NULL),('uiframework.formatter.dateAndTimeFormat','dd.MMM.yyyy, HH:mm:ss','Format used by UiUtils.format for dates that have a time component','4469ba14-bedd-4cbd-a097-4999b27bc306',NULL,NULL,NULL,NULL),('uiframework.formatter.dateFormat','dd.MMM.yyyy','Format used by UiUtils.format for dates that do not have a time component','a3967951-a71f-46c8-8e75-70b34c973ce6',NULL,NULL,NULL,NULL),('uiframework.mandatory','false','true/false whether or not the uiframework module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','8e2ac26a-be17-43d9-a02d-5e8e657d6fef',NULL,NULL,NULL,NULL),('uiframework.started','true','DO NOT MODIFY. true/false whether or not the uiframework module has been started.  This is used to make sure modules that were running  prior to a restart are started again','fa2197ac-c469-4e16-831a-b7b23613609e',NULL,NULL,NULL,NULL),('uilibrary.mandatory','false','true/false whether or not the uilibrary module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','85bcfca7-30ae-4e1a-a29a-f82502325697',NULL,NULL,NULL,NULL),('uilibrary.started','true','DO NOT MODIFY. true/false whether or not the uilibrary module has been started.  This is used to make sure modules that were running  prior to a restart are started again','c518cfff-b488-45d9-918b-d89320b61b23',NULL,NULL,NULL,NULL),('uploaded.files.directory','/home/bahmni/uploaded-files/mrs/','Directory where files uploaded to Bahmni are stored','1e13d164-891a-11e5-8b59-08002715d519',NULL,NULL,NULL,NULL),('user.headerAttributeTypes',NULL,'A comma delimited list of PersonAttributeType names that will be shown on the user dashboard. (not used in v1.5)','4004625e-f01b-43d5-a0aa-5ccfb6e5e0e5',NULL,NULL,NULL,NULL),('user.listingAttributeTypes',NULL,'A comma delimited list of PersonAttributeType names that should be displayed for users in _lists_','cde695bb-a195-476b-9c85-e0ec42b6247b',NULL,NULL,NULL,NULL),('user.requireEmailAsUsername','false','Indicates whether a username must be a valid e-mail or not.','4d04d0eb-71b8-420d-935a-c3ad40c9691c','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL),('user.viewingAttributeTypes',NULL,'A comma delimited list of PersonAttributeType names that should be displayed for users when _viewing individually_','05c46e77-091e-471c-ab53-63cd556e7433',NULL,NULL,NULL,NULL),('use_patient_attribute.healthCenter','false','Indicates whether or not the \'health center\' attribute is shown when viewing/searching for patients','c9ad0e38-4eec-42a5-8e3e-90971f3a6968','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL),('use_patient_attribute.mothersName','false','Indicates whether or not mother\'s name is able to be added/viewed for a patient','7e202531-f991-49c4-b631-ff4bf8c38176','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL),('visits.allowOverlappingVisits','true','true/false whether or not to allow visits of a given patient to overlap','60e4aad5-e980-4655-9933-3473a4974488','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL),('visits.assignmentHandler','org.openmrs.api.handler.ExistingVisitAssignmentHandler','Set to the name of the class responsible for assigning encounters to visits.','5c604545-4d1c-41e3-9db7-7bc33bf692e5',NULL,NULL,NULL,NULL),('visits.autoCloseVisitType',NULL,'comma-separated list of the visit type(s) to automatically close','2302b042-5f7d-42ab-a568-7730d0a8f80f',NULL,NULL,NULL,NULL),('visits.enabled','true','Set to true to enable the Visits feature. This will replace the \'Encounters\' tab with a \'Visits\' tab on the dashboard.','3c690b25-89cd-4115-bf2c-3629a5d948dd','org.openmrs.customdatatype.datatype.BooleanDatatype',NULL,NULL,NULL),('visits.encounterTypeToVisitTypeMapping',NULL,'Specifies how encounter types are mapped to visit types when automatically assigning encounters to visits. e.g 1:1, 2:1, 3:2 in the format encounterTypeId:visitTypeId or encounterTypeUuid:visitTypeUuid or a combination of encounter/visit type uuids and ids e.g 1:759799ab-c9a5-435e-b671-77773ada74e4','3136ddcf-6ff8-4bd0-b6eb-bc4eab9867f4',NULL,NULL,NULL,NULL),('webservices.rest.allowedips',NULL,'A comma-separate list of IP addresses that are allowed to access the web services. An empty string allows everyone to access all ws. \n        IPs can be declared with bit masks e.g. 10.0.0.0/30 matches 10.0.0.0 - 10.0.0.3 and 10.0.0.0/24 matches 10.0.0.0 - 10.0.0.255.','e4ad0190-8e28-41c2-8877-bfa8f95773f2',NULL,NULL,NULL,NULL),('webservices.rest.mandatory','false','true/false whether or not the webservices.rest module MUST start when openmrs starts.  This is used to make sure that mission critical modules are always running if openmrs is running.','5fcefc56-5271-4b9f-ba25-a9dd9847bce1',NULL,NULL,NULL,NULL),('webservices.rest.maxResultsAbsolute','1000','The absolute results limit. If the client requests a larger number of results, then will get an error','829347ef-1e0d-4368-8681-56f9544a0adc',NULL,NULL,NULL,NULL),('webservices.rest.maxResultsDefault','50','The default max results limit if the user does not provide a maximum when making the web service call.','0a75b68c-463b-49cc-9c84-d0ae1ae00895',NULL,NULL,NULL,NULL),('webservices.rest.started','true','DO NOT MODIFY. true/false whether or not the webservices.rest module has been started.  This is used to make sure modules that were running  prior to a restart are started again','df778bf5-6268-4a61-9b2b-742b5ed0a994',NULL,NULL,NULL,NULL),('webservices.rest.uriPrefix',NULL,'The URI prefix through which clients consuming web services will connect to the web application, should be of the form http://{ipAddress}:{port}/{contextPath}','03d8ccda-1989-447d-8880-1456f06018f3',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `global_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hl7_in_archive`
--

DROP TABLE IF EXISTS `hl7_in_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hl7_in_archive` (
  `hl7_in_archive_id` int(11) NOT NULL AUTO_INCREMENT,
  `hl7_source` int(11) NOT NULL DEFAULT '0',
  `hl7_source_key` varchar(255) DEFAULT NULL,
  `hl7_data` text NOT NULL,
  `date_created` datetime NOT NULL,
  `message_state` int(11) DEFAULT '2',
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`hl7_in_archive_id`),
  UNIQUE KEY `hl7_in_archive_uuid_index` (`uuid`),
  KEY `hl7_in_archive_message_state_idx` (`message_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hl7_in_archive`
--

LOCK TABLES `hl7_in_archive` WRITE;
/*!40000 ALTER TABLE `hl7_in_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `hl7_in_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hl7_in_error`
--

DROP TABLE IF EXISTS `hl7_in_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hl7_in_error` (
  `hl7_in_error_id` int(11) NOT NULL AUTO_INCREMENT,
  `hl7_source` int(11) NOT NULL DEFAULT '0',
  `hl7_source_key` text,
  `hl7_data` text NOT NULL,
  `error` varchar(255) NOT NULL DEFAULT '',
  `error_details` mediumtext,
  `date_created` datetime NOT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`hl7_in_error_id`),
  UNIQUE KEY `hl7_in_error_uuid_index` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hl7_in_error`
--

LOCK TABLES `hl7_in_error` WRITE;
/*!40000 ALTER TABLE `hl7_in_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `hl7_in_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hl7_in_queue`
--

DROP TABLE IF EXISTS `hl7_in_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hl7_in_queue` (
  `hl7_in_queue_id` int(11) NOT NULL AUTO_INCREMENT,
  `hl7_source` int(11) NOT NULL DEFAULT '0',
  `hl7_source_key` text,
  `hl7_data` text NOT NULL,
  `message_state` int(11) NOT NULL DEFAULT '0',
  `date_processed` datetime DEFAULT NULL,
  `error_msg` text,
  `date_created` datetime DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`hl7_in_queue_id`),
  UNIQUE KEY `hl7_in_queue_uuid_index` (`uuid`),
  KEY `hl7_source_with_queue` (`hl7_source`),
  CONSTRAINT `hl7_source_with_queue` FOREIGN KEY (`hl7_source`) REFERENCES `hl7_source` (`hl7_source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hl7_in_queue`
--

LOCK TABLES `hl7_in_queue` WRITE;
/*!40000 ALTER TABLE `hl7_in_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `hl7_in_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hl7_source`
--

DROP TABLE IF EXISTS `hl7_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hl7_source` (
  `hl7_source_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`hl7_source_id`),
  UNIQUE KEY `hl7_source_uuid_index` (`uuid`),
  KEY `user_who_created_hl7_source` (`creator`),
  CONSTRAINT `user_who_created_hl7_source` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hl7_source`
--

LOCK TABLES `hl7_source` WRITE;
/*!40000 ALTER TABLE `hl7_source` DISABLE KEYS */;
INSERT INTO `hl7_source` VALUES (1,'LOCAL','',1,'2006-09-01 00:00:00','8d6b8bb6-c2cc-11de-8d13-0010c6dffd0f');
/*!40000 ALTER TABLE `hl7_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idgen_auto_generation_option`
--

DROP TABLE IF EXISTS `idgen_auto_generation_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idgen_auto_generation_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier_type` int(11) NOT NULL,
  `source` int(11) NOT NULL,
  `manual_entry_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `automatic_generation_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `location` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `source for idgen_auto_generation_option` (`source`),
  KEY `location_for_auto_generation_option` (`location`),
  KEY `identifier_type for idgen_auto_generation_option` (`identifier_type`),
  CONSTRAINT `identifier_type for idgen_auto_generation_option` FOREIGN KEY (`identifier_type`) REFERENCES `patient_identifier_type` (`patient_identifier_type_id`),
  CONSTRAINT `location_for_auto_generation_option` FOREIGN KEY (`location`) REFERENCES `location` (`location_id`),
  CONSTRAINT `source for idgen_auto_generation_option` FOREIGN KEY (`source`) REFERENCES `idgen_identifier_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idgen_auto_generation_option`
--

LOCK TABLES `idgen_auto_generation_option` WRITE;
/*!40000 ALTER TABLE `idgen_auto_generation_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `idgen_auto_generation_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idgen_id_pool`
--

DROP TABLE IF EXISTS `idgen_id_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idgen_id_pool` (
  `id` int(11) NOT NULL,
  `source` int(11) DEFAULT NULL,
  `batch_size` int(11) DEFAULT NULL,
  `min_pool_size` int(11) DEFAULT NULL,
  `sequential` tinyint(1) NOT NULL DEFAULT '0',
  `refill_with_scheduled_task` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `source for idgen_id_pool` (`source`),
  CONSTRAINT `id for idgen_id_pool` FOREIGN KEY (`id`) REFERENCES `idgen_identifier_source` (`id`),
  CONSTRAINT `source for idgen_id_pool` FOREIGN KEY (`source`) REFERENCES `idgen_identifier_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idgen_id_pool`
--

LOCK TABLES `idgen_id_pool` WRITE;
/*!40000 ALTER TABLE `idgen_id_pool` DISABLE KEYS */;
/*!40000 ALTER TABLE `idgen_id_pool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idgen_identifier_source`
--

DROP TABLE IF EXISTS `idgen_identifier_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idgen_identifier_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `identifier_type` int(11) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id for idgen_identifier_source` (`id`),
  KEY `identifier_type for idgen_identifier_source` (`identifier_type`),
  KEY `creator for idgen_identifier_source` (`creator`),
  KEY `changed_by for idgen_identifier_source` (`changed_by`),
  KEY `retired_by for idgen_identifier_source` (`retired_by`),
  CONSTRAINT `changed_by for idgen_identifier_source` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `creator for idgen_identifier_source` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `identifier_type for idgen_identifier_source` FOREIGN KEY (`identifier_type`) REFERENCES `patient_identifier_type` (`patient_identifier_type_id`),
  CONSTRAINT `retired_by for idgen_identifier_source` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idgen_identifier_source`
--

LOCK TABLES `idgen_identifier_source` WRITE;
/*!40000 ALTER TABLE `idgen_identifier_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `idgen_identifier_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idgen_log_entry`
--

DROP TABLE IF EXISTS `idgen_log_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idgen_log_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `date_generated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `generated_by` int(11) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id for idgen_log` (`id`),
  KEY `source for idgen_log` (`source`),
  KEY `generated_by for idgen_log` (`generated_by`),
  CONSTRAINT `generated_by for idgen_log` FOREIGN KEY (`generated_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `source for idgen_log` FOREIGN KEY (`source`) REFERENCES `idgen_identifier_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idgen_log_entry`
--

LOCK TABLES `idgen_log_entry` WRITE;
/*!40000 ALTER TABLE `idgen_log_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `idgen_log_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idgen_pooled_identifier`
--

DROP TABLE IF EXISTS `idgen_pooled_identifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idgen_pooled_identifier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `pool_id` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `date_used` datetime DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pool_id for idgen_pooled_identifier` (`pool_id`),
  CONSTRAINT `pool_id for idgen_pooled_identifier` FOREIGN KEY (`pool_id`) REFERENCES `idgen_id_pool` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idgen_pooled_identifier`
--

LOCK TABLES `idgen_pooled_identifier` WRITE;
/*!40000 ALTER TABLE `idgen_pooled_identifier` DISABLE KEYS */;
/*!40000 ALTER TABLE `idgen_pooled_identifier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idgen_remote_source`
--

DROP TABLE IF EXISTS `idgen_remote_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idgen_remote_source` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `user` varchar(50) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `id for idgen_remote_source` FOREIGN KEY (`id`) REFERENCES `idgen_identifier_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idgen_remote_source`
--

LOCK TABLES `idgen_remote_source` WRITE;
/*!40000 ALTER TABLE `idgen_remote_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `idgen_remote_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idgen_reserved_identifier`
--

DROP TABLE IF EXISTS `idgen_reserved_identifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idgen_reserved_identifier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id for idgen_reserved_identifier` (`id`),
  KEY `source for idgen_reserved_identifier` (`source`),
  CONSTRAINT `source for idgen_reserved_identifier` FOREIGN KEY (`source`) REFERENCES `idgen_identifier_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idgen_reserved_identifier`
--

LOCK TABLES `idgen_reserved_identifier` WRITE;
/*!40000 ALTER TABLE `idgen_reserved_identifier` DISABLE KEYS */;
/*!40000 ALTER TABLE `idgen_reserved_identifier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idgen_seq_id_gen`
--

DROP TABLE IF EXISTS `idgen_seq_id_gen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idgen_seq_id_gen` (
  `id` int(11) NOT NULL,
  `next_sequence_value` int(11) NOT NULL DEFAULT '-1',
  `base_character_set` varchar(255) NOT NULL,
  `first_identifier_base` varchar(50) NOT NULL,
  `prefix` varchar(20) DEFAULT NULL,
  `suffix` varchar(20) DEFAULT NULL,
  `min_length` int(11) DEFAULT NULL,
  `max_length` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `id for idgen_seq_id_gen` FOREIGN KEY (`id`) REFERENCES `idgen_identifier_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idgen_seq_id_gen`
--

LOCK TABLES `idgen_seq_id_gen` WRITE;
/*!40000 ALTER TABLE `idgen_seq_id_gen` DISABLE KEYS */;
/*!40000 ALTER TABLE `idgen_seq_id_gen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_status`
--

DROP TABLE IF EXISTS `import_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_file_name` varchar(500) NOT NULL,
  `saved_file_name` varchar(500) NOT NULL,
  `error_file_name` varchar(500) DEFAULT NULL,
  `type` varchar(25) NOT NULL,
  `status` varchar(25) NOT NULL,
  `successful_records` decimal(6,0) DEFAULT NULL,
  `failed_records` decimal(6,0) DEFAULT NULL,
  `stage_name` varchar(30) DEFAULT NULL,
  `stack_trace` text,
  `uploaded_by` varchar(20) NOT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_status`
--

LOCK TABLES `import_status` WRITE;
/*!40000 ALTER TABLE `import_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liquibasechangelog`
--

DROP TABLE IF EXISTS `liquibasechangelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liquibasechangelog` (
  `ID` varchar(63) NOT NULL,
  `AUTHOR` varchar(63) NOT NULL,
  `FILENAME` varchar(200) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`,`AUTHOR`,`FILENAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liquibasechangelog`
--

LOCK TABLES `liquibasechangelog` WRITE;
/*!40000 ALTER TABLE `liquibasechangelog` DISABLE KEYS */;
INSERT INTO `liquibasechangelog` VALUES ('0','bwolfe','liquibase-update-to-latest.xml','2011-09-20 00:00:00',10016,'MARK_RAN','3:ccc4741ff492cb385f44e714053920af',NULL,NULL,NULL,NULL),('02232009-1141','nribeka','liquibase-update-to-latest.xml','2015-11-12 08:43:02',10061,'EXECUTED','3:b5921fb42deb90fe52e042838d0638a0','Modify Column','Modify the password column to fit the output of SHA-512 function',NULL,'2.0.5'),('050620141511','tw','migrations/dependent-modules/liquibase.xml','2015-11-12 08:46:21',10715,'MARK_RAN','3:6baa4b7cb099e86bb3e82caa8e4b41fd','Custom SQL','IDGEN - add column for user in idgen',NULL,'2.0.5'),('050620141512','tw','migrations/dependent-modules/liquibase.xml','2015-11-12 08:46:21',10716,'MARK_RAN','3:1648e921c09f67c097982d8304128620','Custom SQL','IDGEN - add column for password in idgen',NULL,'2.0.5'),('050620141513','tw','migrations/dependent-modules/liquibase.xml','2015-11-12 08:46:21',10717,'EXECUTED','3:cea30d0d56efdc274544b1e9fd04071b','Custom SQL','IDGEN - modify seq table to add min length and max length instead of length',NULL,'2.0.5'),('08102013_1','arathy','liquibase.xml','2015-11-12 08:50:31',10924,'EXECUTED','3:f408b259edf18c9ef5c76d8783cc9c0e','Create Table','Create bed table',NULL,'2.0.5'),('08102013_2','arathy','liquibase.xml','2015-11-12 08:50:31',10925,'EXECUTED','3:7e57afdf5ad9fd77cbe6701c5d5d3f0e','Create Table','Create bed_patient_assignment_map table',NULL,'2.0.5'),('08102013_3','arathy','liquibase.xml','2015-11-12 08:50:32',10926,'EXECUTED','3:01e806e25044b76540eebbf69cc794bc','Add Foreign Key Constraint','Added foreign key reference on bed_id in bed_patient_assignment_map table',NULL,'2.0.5'),('08102013_4','arathy','liquibase.xml','2015-11-12 08:50:32',10927,'EXECUTED','3:6971a96f0aa2566a2f65016ad1d8b4bb','Add Foreign Key Constraint','Added foreign key reference on patient_id in bed_patient_assignment_map table',NULL,'2.0.5'),('08102013_5','arathy','liquibase.xml','2015-11-12 08:50:32',10928,'EXECUTED','3:f646b539893f3579c97d3f0d51ecd716','Create Table','Create bed_location_map table',NULL,'2.0.5'),('08102013_6','arathy','liquibase.xml','2015-11-12 08:50:33',10929,'EXECUTED','3:26de39ba0e58e5790a27a73b350057c9','Add Foreign Key Constraint','Added foreign key reference on location_id in bed_location_map table',NULL,'2.0.5'),('08102013_7','arathy','liquibase.xml','2015-11-12 08:50:33',10930,'EXECUTED','3:759d512aea5b655dbc87c0663cb7e306','Add Column','',NULL,'2.0.5'),('08102013_8','arathy','liquibase.xml','2015-11-12 08:50:33',10931,'EXECUTED','3:94a3788122cc19dedd1b3d9eb11f78b5','Add Default Value','',NULL,'2.0.5'),('1','upul','liquibase-update-to-latest.xml','2015-11-12 08:43:00',10042,'MARK_RAN','3:7fbc03c45bb69cd497b096629d32c3f5','Add Column','Add the column to person_attribute type to connect each type to a privilege',NULL,'2.0.5'),('1-grant-new-dashboard-overview-tab-app-privileges','dkayiwa','liquibase-update-to-latest.xml','2015-11-12 08:49:24',10877,'EXECUTED','3:6af3c30685c99d96ad1cd577719b1600','Custom SQL','Granting the new patient overview tab application privileges',NULL,'2.0.5'),('1-increase-privilege-col-size-privilege','dkayiwa','liquibase-update-to-latest.xml','2015-11-12 08:49:24',10879,'EXECUTED','3:6ecff8787eca17532e310087cfd65a06','Drop Foreign Key Constraint (x2), Modify Column, Add Foreign Key Constraint (x2)','Increasing the size of the privilege column in the privilege table',NULL,'2.0.5'),('10-insert-new-app-privileges','dkayiwa','liquibase-update-to-latest.xml','2015-11-12 08:49:24',10875,'EXECUTED','3:6ca60c3d5202a79f2e43367215cb447b','Custom SQL','Inserting the new application privileges',NULL,'2.0.5'),('100','ict4h','sql/db_migrations.xml','2015-11-12 08:45:31',10612,'EXECUTED','3:8ee36a0313cda559247cbb2729fe6e76','Create Table (x2)','',NULL,'2.0.5'),('101','ict4h','sql/db_migrations.xml','2015-11-12 08:45:31',10613,'EXECUTED','3:29f59eb61eb39a9dee52d81f4026d642','Add Column','',NULL,'2.0.5'),('11-insert-new-api-privileges','dkayiwa','liquibase-update-to-latest.xml','2015-11-12 08:49:24',10876,'EXECUTED','3:fe15eb2a97dd397b15fb5c4174fabe05','Custom SQL','Inserting the new API privileges',NULL,'2.0.5'),('1226348923233-12','ben (generated)','liquibase-core-data.xml','2015-11-12 08:42:49',10022,'EXECUTED','3:7efb7ed5267126e1e44c9f344e35dd7d','Insert Row (x12)','',NULL,'2.0.5'),('1226348923233-13','ben (generated)','liquibase-core-data.xml','2015-11-12 08:42:49',10023,'EXECUTED','3:8b9e14aa00a4382aa2623b39400c9110','Insert Row (x2)','',NULL,'2.0.5'),('1226348923233-14','ben (generated)','liquibase-core-data.xml','2015-11-12 08:42:49',10027,'EXECUTED','3:8910082a3b369438f86025e4006b7538','Insert Row (x4)','',NULL,'2.0.5'),('1226348923233-15','ben (generated)','liquibase-core-data.xml','2015-11-12 08:42:49',10028,'EXECUTED','3:8485e0ebef4dc368ab6b87de939f8e82','Insert Row (x15)','',NULL,'2.0.5'),('1226348923233-16','ben (generated)','liquibase-core-data.xml','2015-11-12 08:42:49',10019,'EXECUTED','3:5778f109b607f882cc274750590d5004','Insert Row','',NULL,'2.0.5'),('1226348923233-17','ben (generated)','liquibase-core-data.xml','2015-11-12 08:42:49',10030,'EXECUTED','3:3c324233bf1f386dcc4a9be55401c260','Insert Row (x2)','',NULL,'2.0.5'),('1226348923233-18','ben (generated)','liquibase-core-data.xml','2015-11-12 08:42:49',10031,'EXECUTED','3:40ad1a506929811955f4d7d4753d576e','Insert Row (x2)','',NULL,'2.0.5'),('1226348923233-2','ben (generated)','liquibase-core-data.xml','2015-11-12 08:42:49',10020,'EXECUTED','3:35613fc962f41ed143c46e578fd64a70','Insert Row (x5)','',NULL,'2.0.5'),('1226348923233-20','ben (generated)','liquibase-core-data.xml','2015-11-12 08:42:49',10032,'EXECUTED','3:0ce5c5b83b4754b44f4bcda8eb866f3a','Insert Row','',NULL,'2.0.5'),('1226348923233-21','ben (generated)','liquibase-core-data.xml','2015-11-12 08:42:49',10033,'EXECUTED','3:51c90534135f429c1bcde82be0f6157d','Insert Row','',NULL,'2.0.5'),('1226348923233-22','ben (generated)','liquibase-core-data.xml','2015-11-12 08:42:49',10018,'EXECUTED','3:2d4897a84ce4408d8fcec69767a5c563','Insert Row','',NULL,'2.0.5'),('1226348923233-23','ben (generated)','liquibase-core-data.xml','2015-11-12 08:42:49',10034,'EXECUTED','3:19f78a07a33a5efc28b4712a07b02a29','Insert Row','',NULL,'2.0.5'),('1226348923233-6','ben (generated)','liquibase-core-data.xml','2015-11-12 08:42:49',10026,'EXECUTED','3:a947f43a1881ac56186039709a4a0ac8','Insert Row (x13)','',NULL,'2.0.5'),('1226348923233-8','ben (generated)','liquibase-core-data.xml','2015-11-12 08:42:49',10021,'EXECUTED','3:dceb0cc19be3545af8639db55785d66e','Insert Row (x7)','',NULL,'2.0.5'),('1226412230538-24','ben (generated)','liquibase-core-data.xml','2015-11-12 08:42:49',10024,'EXECUTED','3:0b77e92c0d1482c1bef7ca1add6b233b','Insert Row (x2)','',NULL,'2.0.5'),('1226412230538-7','ben (generated)','liquibase-core-data.xml','2015-11-12 08:42:49',10025,'EXECUTED','3:c189f41d824649ef72dc3cef74d3580b','Insert Row (x106)','',NULL,'2.0.5'),('1226412230538-9a','ben (generated)','liquibase-core-data.xml','2015-11-12 08:42:49',10035,'EXECUTED','3:73c2b426be208fb50f088ad4ee76c8d6','Insert Row (x4)','',NULL,'2.0.5'),('1227123456789-100','dkayiwa','liquibase-schema-only.xml','2015-11-12 08:42:31',178,'EXECUTED','3:24751e1218f5fff3d2abf8e281e557c5','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-1','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:27',1,'EXECUTED','3:a851046bb3eb5b0daccb6e69ef8a9a00','Create Table','',NULL,'2.0.5'),('1227303685425-10','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:27',8,'EXECUTED','3:3fb7e78555ddf8d8014ba336bb8b5402','Create Table','',NULL,'2.0.5'),('1227303685425-100','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:30',114,'EXECUTED','3:8d20fc37ce4266cba349eeef66951688','Create Index','',NULL,'2.0.5'),('1227303685425-101','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:30',115,'EXECUTED','3:cc9b2ad0c2ff9ad6fcfd2f56b52d795f','Create Index','',NULL,'2.0.5'),('1227303685425-102','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:30',116,'EXECUTED','3:97d1301e8ab7f35e109c733fdedde10f','Create Index','',NULL,'2.0.5'),('1227303685425-103','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:30',117,'EXECUTED','3:2447e4abc7501a18f401594e4c836fff','Create Index','',NULL,'2.0.5'),('1227303685425-104','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:30',118,'EXECUTED','3:8d6c644eaf9f696e3fee1362863c26ec','Create Index','',NULL,'2.0.5'),('1227303685425-105','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:30',119,'EXECUTED','3:fb3838f818387718d9b4cbf410d653cd','Create Index','',NULL,'2.0.5'),('1227303685425-106','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:30',120,'EXECUTED','3:a644de1082a85ab7a0fc520bb8fc23d7','Create Index','',NULL,'2.0.5'),('1227303685425-107','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:30',121,'EXECUTED','3:f11eb4e4bc4a5192b7e52622965aacb2','Create Index','',NULL,'2.0.5'),('1227303685425-108','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:30',135,'EXECUTED','3:07fc6fd2c0086f941aed0b2c95c89dc8','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-109','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:30',136,'EXECUTED','3:c2911be31587bbc868a55f13fcc3ba5e','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-11','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:27',9,'EXECUTED','3:1cef06ece4f56bfbe205ec03b75a129f','Create Table','',NULL,'2.0.5'),('1227303685425-110','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:30',137,'EXECUTED','3:32c42fa39fe81932aa02974bb19567ed','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-111','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:30',138,'EXECUTED','3:f35c8159ca7f84ae551bdb988b833760','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-112','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:30',139,'EXECUTED','3:df0a45bc276e7484f183e3190cff8394','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-115','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:30',140,'EXECUTED','3:d3b13502ef9794718d68bd0697fd7c2b','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-116','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:30',141,'EXECUTED','3:6014d91cadbbfc05bd364619d94a4f18','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-117','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:30',142,'EXECUTED','3:0841471be0ebff9aba768017b9a9717b','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-118','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:30',143,'EXECUTED','3:c73351f905761c3cee7235b526eff1a0','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-119','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:30',144,'EXECUTED','3:cd72c79bfd3c807ba5451d8ca5cb2612','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-12','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:27',10,'EXECUTED','3:b9726f1c78d0cba40d5ee61e721350f7','Create Table','',NULL,'2.0.5'),('1227303685425-120','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:30',145,'EXECUTED','3:b07d718d9d2b64060584d4c460ffc277','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-121','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:30',146,'EXECUTED','3:be141d71df248fba87a322b35f13b4db','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-122','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:30',147,'EXECUTED','3:7bcc45dda3aeea4ab3916701483443d3','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-123','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:30',148,'EXECUTED','3:031e4dcf20174b92bbbb07323b86d569','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-124','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:31',149,'EXECUTED','3:7d277181a4e9d5e14f9cb1220c6c4c57','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-125','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:31',150,'EXECUTED','3:7172ef61a904cd7ae765f0205d9e66dd','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-126','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:31',151,'EXECUTED','3:0d9a3ffc816c3e4e8649df3de01a8ff6','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-128','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:31',152,'EXECUTED','3:3a9357d6283b2bb97c1423825d6d57eb','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-129','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:31',153,'EXECUTED','3:e3923913d6f34e0e8bc7333834884419','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-13','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:27',11,'EXECUTED','3:982544aff0ae869f5ac9691d5c93a7e4','Create Table','',NULL,'2.0.5'),('1227303685425-130','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:31',154,'EXECUTED','3:dae7a98f3643acfe9db5c3b4b9e8f4ea','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-131','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:31',155,'EXECUTED','3:44a4e4791a0f727fffc96b9dab0a3fa8','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-132','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:31',156,'EXECUTED','3:16dcc5a95708dbdaff07ed27507d8e29','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-134','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:31',157,'EXECUTED','3:c37757ed38ace0bb94d8455a49e3049a','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-135','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:31',158,'EXECUTED','3:ab40ab94ab2f86a0013ecbf9dd034de4','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-136','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:31',159,'EXECUTED','3:3878ab735b369d778a7feb2b92746352','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-137','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:31',160,'EXECUTED','3:a7bf99f775c2f07b534a4df4e5c5c20b','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-139','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:31',161,'EXECUTED','3:f0a1690648292d939876bdeefa74792a','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-14','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:27',12,'EXECUTED','3:0132a13f3ff3c212ad7e11a9a0890bbb','Create Table','',NULL,'2.0.5'),('1227303685425-140','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:31',162,'EXECUTED','3:7ba4860a1e0a00ff49a93d4e86929691','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-141','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:31',163,'EXECUTED','3:5b176976d808cf8b1b8fae7d2b19e059','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-142','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:31',164,'EXECUTED','3:5538db250e63d70a79dce2c5a74ee528','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-143','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:31',165,'EXECUTED','3:a981ac9be845bf6c6098aa98cd4d8456','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-144','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:31',166,'EXECUTED','3:84428d9dce773758f73616129935d888','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-145','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:31',167,'EXECUTED','3:6b8af6c242f1d598591478897feed2d8','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-146','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:31',168,'EXECUTED','3:a8cddf3b63050686248e82a3b6de781f','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-147','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:31',169,'EXECUTED','3:e8b5350ad40fa006c088f08fae4d3141','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-149','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:31',170,'EXECUTED','3:b6c44ee5824ae261a9a87b8ac60fe23d','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-15','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:27',13,'EXECUTED','3:18dd3e507ecbe5212bcdf0a0a8012d88','Create Table','',NULL,'2.0.5'),('1227303685425-150','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:31',171,'EXECUTED','3:f8c495d78d68c9fc701271a8e5d1f102','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-151','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:31',172,'EXECUTED','3:94dc5b8d27f275fb06cc230eb313e430','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-153','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:31',173,'EXECUTED','3:2a04930665fe64516765263d1a9b0775','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-154','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:31',174,'EXECUTED','3:adfef8b8dd7b774b268b0968b7400f42','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-155','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:31',175,'EXECUTED','3:540b0422c733b464a33ca937348d8b4c','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-158','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:31',176,'EXECUTED','3:d1d73e19bab5821f256c01a83e2d945f','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-159','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:31',177,'EXECUTED','3:c23d0cd0eec5f20385b4182af18fc835','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-16','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:27',14,'EXECUTED','3:4c19b5c980b58e54af005e1fa50359ae','Create Table','',NULL,'2.0.5'),('1227303685425-160','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:31',179,'EXECUTED','3:cc64f6e676cb6a448f73599d8149490c','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-161','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:31',180,'EXECUTED','3:f48e300a3439d90fa2d518b3d6e145a5','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-162','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:32',181,'EXECUTED','3:467e31995c41be55426a5256d99312c4','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-163','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:32',182,'EXECUTED','3:45a4519c252f7e42d649292b022ec158','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-164','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:32',183,'EXECUTED','3:dfd51e701b716c07841c2e4ea6f59f3e','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-165','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:32',184,'EXECUTED','3:0d69b82ce833ea585e95a6887f800108','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-166','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:32',185,'EXECUTED','3:2070f44c444e1e6efdbe7dfb9f7b846d','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-167','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:32',186,'EXECUTED','3:9196c0f9792007c72233649cc7c2ac58','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-168','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:32',187,'EXECUTED','3:33d644a49e92a4bbd4cb653d6554c8d0','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-169','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:32',188,'EXECUTED','3:e75c37cbd9aa22cf95b2dc89fdb2c831','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-17','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:27',15,'EXECUTED','3:250e3f0d4bb139fa751d0875fd1d5b89','Create Table','',NULL,'2.0.5'),('1227303685425-170','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:32',189,'EXECUTED','3:ac31515d8822caa0c87705cb0706e52f','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-171','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:32',190,'EXECUTED','3:b40823e1322acea52497f43033e72e5e','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-173','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:32',191,'EXECUTED','3:b37c0b43a23ad3b072e34055875f7dcc','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-174','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:32',192,'EXECUTED','3:f8c5737a51f0f040e9fac3060c246e46','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-175','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:32',193,'EXECUTED','3:87cc15f9622b014d01d4df512a3f835e','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-176','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:32',194,'EXECUTED','3:f57273dfbaba02ea785a0e165994f74b','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-177','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:32',195,'EXECUTED','3:1555790e99827ded259d5ec7860eb1b1','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-178','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:32',196,'EXECUTED','3:757206752885a07d1eea5585ad9e2dce','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-179','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:32',197,'EXECUTED','3:018efd7d7a5e84f7c2c9cec7299d596e','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-18','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:27',16,'EXECUTED','3:2eb2063d3e1233e7ebc23f313da5bff6','Create Table','',NULL,'2.0.5'),('1227303685425-180','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:32',198,'EXECUTED','3:9ba52b3b7059674e881b7611a3428bde','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-181','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:32',199,'EXECUTED','3:ffee79a7426d7e41cf65889c2a5064f2','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-182','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:32',200,'EXECUTED','3:380743d4f027534180d818f5c507fae9','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-183','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:32',201,'EXECUTED','3:6882a4cf798e257af34753a8b5e7a157','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-184','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:32',202,'EXECUTED','3:93473623db4b6e7ca7813658da5b6771','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-185','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:32',203,'EXECUTED','3:f19a46800a4695266f3372aa709650b2','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-186','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:32',204,'EXECUTED','3:adfd7433de8d3b196d1166f62e497f8d','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-187','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:33',205,'EXECUTED','3:88b09239d29fbddd8bf4640df9f3e235','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-188','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:33',206,'EXECUTED','3:777e5970e09a3a1608bf7c40ef1ea1db','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-189','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:33',207,'EXECUTED','3:40dab4e434aa06340ba046fbd1382c6d','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-19','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:27',17,'EXECUTED','3:b5acf27abca6fec3533e081a6c57c415','Create Table','',NULL,'2.0.5'),('1227303685425-190','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:33',208,'EXECUTED','3:8766098ff9779a913d5642862955eaff','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-191','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:33',209,'EXECUTED','3:2a52afd1df6dcf64ec21f3c6ffe1d022','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-192','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:33',210,'EXECUTED','3:fa5de48b1490faa157e1977529034169','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-193','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:33',211,'EXECUTED','3:1213cb90fa9bd1561a371cc53c262d0f','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-194','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:33',212,'EXECUTED','3:2eb07e7388ff8d68d36cf2f3552c1a7c','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-195','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:33',213,'EXECUTED','3:d6ec9bb7b3bab333dcea4a3c18083616','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-196','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:33',214,'EXECUTED','3:df03afd5ef34e472fd6d43ef74a859e1','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-197','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:33',215,'EXECUTED','3:a0811395501a4423ca66de08fcf53895','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-198','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:33',216,'EXECUTED','3:e46a78b95280d9082557ed991af8dbe7','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-199','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:33',217,'EXECUTED','3:e57afffae0d6a439927e45cde4393363','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-2','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:27',2,'EXECUTED','3:d90246bb4d8342608e818a872d3335f1','Create Table','',NULL,'2.0.5'),('1227303685425-20','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:27',18,'EXECUTED','3:e0a8a4978c536423320f1ff44520169a','Create Table','',NULL,'2.0.5'),('1227303685425-200','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:33',218,'EXECUTED','3:667c2308fcf366f47fab8d9df3a3b2ae','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-201','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:33',219,'EXECUTED','3:104750a2b7779fa43e8457071e0bc33e','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-202','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:33',220,'EXECUTED','3:4b813b03362a54d89a28ed1b10bc9069','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-203','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:33',221,'EXECUTED','3:526893ceedd67d8a26747e314a15f501','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-204','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:33',222,'EXECUTED','3:d0dbb7cc972e73f6a429b273ef63132e','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-205','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:33',223,'EXECUTED','3:44244a3065d9a5531a081d176aa4e93d','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-207','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:33',224,'EXECUTED','3:77ade071c48615dbb39cbf9f01610c0e','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-208','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:33',225,'EXECUTED','3:04495bf48c23d0fe56133da87c4e9a66','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-209','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:33',226,'EXECUTED','3:ff99d75d98ce0428a57100aeb558a529','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-21','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:27',19,'EXECUTED','3:f2353036e6382f45f91af5d8024fb04c','Create Table','',NULL,'2.0.5'),('1227303685425-210','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:33',227,'EXECUTED','3:537b2e8f88277a6276bcdac5d1493e4e','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-211','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:33',228,'EXECUTED','3:3da39190692480b0a610b5c66fd056b8','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-212','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:33',229,'EXECUTED','3:347f20b32a463b73f0a93de13731a3a3','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-213','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:33',230,'EXECUTED','3:b89ee7f6dd678737268566b7e7d0d5d3','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-214','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:33',231,'EXECUTED','3:5f4b3400ecb50d46e04a18b6b57821c8','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-215','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:34',232,'EXECUTED','3:3dfa6664ca6b77eee492af73908f7312','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-216','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:34',233,'EXECUTED','3:7f7dbdcdaf3914e33458c0d67bc326db','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-217','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:34',234,'EXECUTED','3:1f03c97bd9b3ee1c2726656c6a0db795','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-218','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:34',235,'EXECUTED','3:e0a67bb4f3ea4b44de76fd73ca02ddb3','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-219','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:34',236,'EXECUTED','3:9a347c93be3356b84358ada2264ed201','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-22','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:27',20,'EXECUTED','3:5ff0caa8c8497fd681f111bf2842baca','Create Table','',NULL,'2.0.5'),('1227303685425-220','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:34',237,'EXECUTED','3:8a744c0020e6c6ae519ed0a04d79f82d','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-221','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:34',238,'EXECUTED','3:cc3f5b38ea88221efe32bc99be062edf','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-222','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:34',239,'EXECUTED','3:a90ffe3cbe9ddd1704e702e71ba5a216','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-223','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:34',240,'EXECUTED','3:ee4b79223897197c46c79d6ed2e68538','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-224','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:34',241,'EXECUTED','3:56d7625e53d13008ae7a31d09ba7dab8','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-225','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:34',242,'EXECUTED','3:b94477e4e6ecf22bc973408d2d01a868','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-226','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:34',243,'EXECUTED','3:d7a0cde832f1f557f0f42710645c1b50','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-227','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:34',244,'EXECUTED','3:6873a8454254a783dbcbe608828c0bd0','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-228','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:34',245,'EXECUTED','3:6ffcdbbe70b8f8e096785a3c2fe83318','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-229','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:34',246,'EXECUTED','3:ef5d7095407e0df6a1fcaf7c3c55872b','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-23','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:27',21,'EXECUTED','3:c3aa4ad35ead35e805a99083a95a1c86','Create Table','',NULL,'2.0.5'),('1227303685425-230','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:34',247,'EXECUTED','3:306710c2acba2e689bf1121d577f449b','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-231','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:34',248,'EXECUTED','3:71f320edc9221ce73876d80077b7b94d','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-232','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:34',249,'EXECUTED','3:8dfba47fb6719dc743b231cc645a8378','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-234','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:34',250,'EXECUTED','3:9b12808a0fe62d6951bcd61f9cbff3f8','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-235','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:34',251,'EXECUTED','3:a3e9822b106a9bb42f5b9d28dc70335c','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-236','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:34',252,'EXECUTED','3:388be0f658f8bf6df800fe3efd4dadb3','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-237','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:34',253,'EXECUTED','3:eee4cb65598835838fd6deb8e4043693','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-239','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:34',254,'EXECUTED','3:3b38e45410dd1d02530d012a12b6b03c','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-24','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:27',22,'EXECUTED','3:f4f4e3a5fa3d93bb50d2004c6976cc12','Create Table','',NULL,'2.0.5'),('1227303685425-240','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:34',255,'EXECUTED','3:095316f05dac21b4a33a141e5781d99d','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-241','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:34',256,'EXECUTED','3:2cffae7a53d76f19e5194778cff75a4f','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-242','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:34',257,'EXECUTED','3:828732619d67fa932631e18827d74463','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-243','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:34',258,'EXECUTED','3:730166a1b0c3162e8ce882e0c8f308c5','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-244','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:34',259,'EXECUTED','3:77c03c05576961f7efebdfa10ae68119','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-245','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:34',260,'EXECUTED','3:d7d8dcaceb9793b0801c87eb2c94cd11','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-246','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:35',261,'EXECUTED','3:d395ea3ef18817dc23e750a1048cb4e1','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-247','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:35',262,'EXECUTED','3:4546bff7866082946f19e5d82ffc4d2e','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-248','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:35',263,'EXECUTED','3:4e1071a7c1047f2d3b49778ce2f8bc40','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-249','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:35',264,'EXECUTED','3:fd6b7823929af9fded1f213d319eae13','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-25','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:27',23,'EXECUTED','3:2a720a7c4302c435c06c045abcce3b4d','Create Table','',NULL,'2.0.5'),('1227303685425-250','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:35',265,'EXECUTED','3:955129e5e6adf3723583c047eb33583d','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-251','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:35',266,'EXECUTED','3:7a12c926e69a3d1a7e31da2b8d7123e5','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-252','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:35',267,'EXECUTED','3:eb8c61b5b792346af3d3f8732278260b','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-253','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:35',268,'EXECUTED','3:761e6c7fb13a82c6ab671039e5dc5646','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-254','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:35',269,'EXECUTED','3:9a2401574c95120e1f90d18fde428d10','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-255','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:35',270,'EXECUTED','3:cda3d0c5c91b85d9f4610554eabb331e','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-256','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:35',271,'EXECUTED','3:ebf6243c66261bf0168e72ceccd0fdb8','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-257','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:35',272,'EXECUTED','3:8dc087b963a10a52a22312c3c995cec2','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-258','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:35',273,'EXECUTED','3:489d5e366070f6b2424b8e5a20d0118f','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-259','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:35',274,'EXECUTED','3:d8d2a1cfddf07123a8e6f52b1e71705d','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-26','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:27',24,'EXECUTED','3:8adbeeca3dce3d9befb7a02714d20fec','Create Table','',NULL,'2.0.5'),('1227303685425-260','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:35',275,'EXECUTED','3:741f0c9e309b8515b713decb56ed6cb2','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-261','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:35',276,'EXECUTED','3:7034f7db7864956b7ca13ceb70cc8a92','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-262','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:35',277,'EXECUTED','3:e3a5995253a29723231b0912b971fb5a','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-263','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:35',278,'EXECUTED','3:b1d3718c15765d4a3bf89cb61376d3af','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-264','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:35',279,'EXECUTED','3:973683323e2ce886f07ef53a6836ad1e','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-265','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:35',280,'EXECUTED','3:eff44c0cd530b852864042134ebccb47','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-266','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:35',281,'EXECUTED','3:2493248589e21293811c01cdb6c2fb87','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-267','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:35',282,'EXECUTED','3:ee636bdbc5839d7de0914648e1f07431','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-268','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:35',283,'EXECUTED','3:96710f10538b24f39e74ebc13eb6a3fc','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-269','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:35',284,'EXECUTED','3:5be60bacdaf2ab2d8a3103e36b32f6b9','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-27','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:27',25,'EXECUTED','3:6d359a7595e5b9a61ac1101aa7df59e7','Create Table','',NULL,'2.0.5'),('1227303685425-270','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:35',285,'EXECUTED','3:35a1f2d06c31af2f02df3e7aea4d05a5','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-271','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:35',286,'EXECUTED','3:64d94dfba329b70a842a09b01b952850','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-272','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:35',287,'EXECUTED','3:0e3787e31b95815106e7e051b9c4a79a','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-273','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:35',288,'EXECUTED','3:00949a7bd184ed4ee994eabf4b98a41f','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-274','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:35',289,'EXECUTED','3:b63e3786d661815d2b7c63b277796fc9','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-275','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:35',290,'EXECUTED','3:7e0ac267990b953ff9efe8fece53b4dd','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-276','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:36',291,'EXECUTED','3:d66f7691a19406c215b3b4b4c5330775','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-277','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:36',292,'EXECUTED','3:9b7c8b6ab0b9f8ffde5e7853efa40db5','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-278','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:36',293,'EXECUTED','3:e5f95724ac551e5905c604e59af444f9','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-279','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:36',294,'EXECUTED','3:6b4a4c9072a92897562aa595c27aaae4','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-28','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',26,'EXECUTED','3:7264098c8ccfa42b12ffb13056f77383','Create Table','',NULL,'2.0.5'),('1227303685425-280','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:36',295,'EXECUTED','3:8fb315815532eb73c13fac2dac763f69','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-281','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:36',296,'EXECUTED','3:1bed6131408c745505800d96130d3b30','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-282','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:36',297,'EXECUTED','3:ecf4138f4fd2d1e8be720381ac401623','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-283','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:36',298,'EXECUTED','3:00b414c29dcc3be9683f28ff3f2d9b20','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-284','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:36',299,'EXECUTED','3:b71dcc206a323ffa6ac4cd658de7b435','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-285','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:36',300,'EXECUTED','3:17423acbed3db4325d48d91e9f0e7147','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-286','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:36',301,'EXECUTED','3:2d8576bdbc9dd67137ba462b563022d8','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-287','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:36',302,'EXECUTED','3:6798c27ddf8ca72952030d6005422c1e','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-288','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:36',303,'EXECUTED','3:b28ec2579454fa7a13fd3896420ad1ff','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-289','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:36',304,'EXECUTED','3:cbfff99e22305c5570cdc8fdb33f3542','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-29','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',27,'EXECUTED','3:750f7e9a5f0898408626a11ce7f34ee4','Create Table','',NULL,'2.0.5'),('1227303685425-290','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:36',305,'EXECUTED','3:66957ec2b3211869a1ad777de33e7983','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-291','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:36',306,'EXECUTED','3:18b7da760f632dc6baf910fe5001212d','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-292','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:36',307,'EXECUTED','3:a1a914015e07b1637a9c655a9be3cfcd','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-293','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:36',308,'EXECUTED','3:5fedacb04729210c4a27bbfa2a3704f1','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-294','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:36',309,'EXECUTED','3:cf53101d520adb79fd1827819bcf0401','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-295','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:36',310,'EXECUTED','3:22b93c390cd6054f3dc8b62814d143cf','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-296','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:36',311,'EXECUTED','3:8b71fc2ae6be26a1ddc499cfc6e2cdba','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-297','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:36',312,'EXECUTED','3:d10fb06a37b1433a248b549ebae31e63','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-298','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:36',313,'EXECUTED','3:a3008458deed3c8c95f475395df6d788','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-299','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:36',314,'EXECUTED','3:b380ee7cce1b82a2f983d242b45c63b3','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-30','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',28,'EXECUTED','3:0951dbc13f8f4c6fd4ccc8a7ddb9d77c','Create Table','',NULL,'2.0.5'),('1227303685425-300','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:36',315,'EXECUTED','3:01f02c28d4f52e712aad87873aaa40f8','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-301','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:36',316,'EXECUTED','3:adf03ccc09e8f37f827b8ffbf3afff83','Add Foreign Key Constraint','',NULL,'2.0.5'),('1227303685425-31','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',29,'EXECUTED','3:5669760a2908489a63a69c3d34dd5c54','Create Table','',NULL,'2.0.5'),('1227303685425-32','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',30,'EXECUTED','3:c8b2b1bb1eb7b3885c89f436210cc2d5','Create Table','',NULL,'2.0.5'),('1227303685425-33','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',31,'EXECUTED','3:7b55b4b34bca59cf0d0b7271a2906568','Create Table','',NULL,'2.0.5'),('1227303685425-34','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',32,'EXECUTED','3:05a6b514927868471d71b334502d0e85','Create Table','',NULL,'2.0.5'),('1227303685425-35','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',33,'EXECUTED','3:528a3f364b7acce00fcc4d49153a5626','Create Table','',NULL,'2.0.5'),('1227303685425-36','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',34,'EXECUTED','3:2f8eb6548a5d935d7df6f68b329b7685','Create Table','',NULL,'2.0.5'),('1227303685425-37','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',35,'EXECUTED','3:fb11397b44997fe8fef33f8ae86d4044','Create Table','',NULL,'2.0.5'),('1227303685425-39','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',36,'EXECUTED','3:3efa037ecd0227f935b601f0bda28692','Create Table','',NULL,'2.0.5'),('1227303685425-4','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:27',3,'EXECUTED','3:27c254248b84b163e54161c6f14c2104','Create Table','',NULL,'2.0.5'),('1227303685425-40','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',37,'EXECUTED','3:934d8b580b8b3572b3795a92496783a2','Create Table','',NULL,'2.0.5'),('1227303685425-41','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',38,'EXECUTED','3:a65a25558c348c19863a0088ae031ad7','Create Table','',NULL,'2.0.5'),('1227303685425-42','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',39,'EXECUTED','3:1264d39b6cb1fa81263df8f7a0819a5e','Create Table','',NULL,'2.0.5'),('1227303685425-43','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',40,'EXECUTED','3:bbdbc4ae1631b83db687f4a92453ba3e','Create Table','',NULL,'2.0.5'),('1227303685425-44','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',41,'EXECUTED','3:98d047deb448c37f252eca7c035bf158','Create Table','',NULL,'2.0.5'),('1227303685425-45','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',42,'EXECUTED','3:a8a1d8af033a6e76c1e2060727bf4ebe','Create Table','',NULL,'2.0.5'),('1227303685425-46','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',43,'EXECUTED','3:95fa512a96ab3d1d070d11614c2b5fd5','Create Table','',NULL,'2.0.5'),('1227303685425-47','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',44,'EXECUTED','3:7ae5af2d7f0b3e0bfaf9f243f56851eb','Create Table','',NULL,'2.0.5'),('1227303685425-48','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',45,'EXECUTED','3:fdbf71c7035399d628225af885c63114','Create Table','',NULL,'2.0.5'),('1227303685425-49','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',46,'EXECUTED','3:0c00abd4429f2072f360915eb2eec3de','Create Table','',NULL,'2.0.5'),('1227303685425-5','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:27',4,'EXECUTED','3:63b45eb5e407f1aa4e6569392ca957ca','Create Table','',NULL,'2.0.5'),('1227303685425-50','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',47,'EXECUTED','3:0e2c0cecd82166846a869f8ecce32bc2','Create Table','',NULL,'2.0.5'),('1227303685425-51','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',48,'EXECUTED','3:308c259886e442254ca616d365db78a2','Create Table','',NULL,'2.0.5'),('1227303685425-52','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',49,'EXECUTED','3:c11b85565b591de38d518fe60411507d','Create Table','',NULL,'2.0.5'),('1227303685425-53','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',50,'EXECUTED','3:2860fbf54a18e959646882325eb4dd87','Create Table','',NULL,'2.0.5'),('1227303685425-54','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',51,'EXECUTED','3:350eb1d5e1f0a2db57a1487790e56769','Create Table','',NULL,'2.0.5'),('1227303685425-55','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',52,'EXECUTED','3:2318a41398b0583575e358aa79813cc6','Create Table','',NULL,'2.0.5'),('1227303685425-56','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',53,'EXECUTED','3:9fcb808d4c751b4d65850479558590d9','Create Table','',NULL,'2.0.5'),('1227303685425-57','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',54,'EXECUTED','3:401395592f65e4216b0b0e8a756ae9b8','Create Table','',NULL,'2.0.5'),('1227303685425-58','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',55,'EXECUTED','3:fcb459a88d234d6556ab5f5aff73a926','Create Table','',NULL,'2.0.5'),('1227303685425-59','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',56,'EXECUTED','3:ab774554467ea7818601acb495c57e5a','Create Table','',NULL,'2.0.5'),('1227303685425-6','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:27',5,'EXECUTED','3:570a29d5b7f6b945d80de91fce59c0f6','Create Table','',NULL,'2.0.5'),('1227303685425-60','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',57,'EXECUTED','3:54282635bb2bf4218be532ed940ac4b0','Create Table','',NULL,'2.0.5'),('1227303685425-61','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',58,'EXECUTED','3:920daa80f4f9db2cacee8dca6ca4f971','Create Table','',NULL,'2.0.5'),('1227303685425-62','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',59,'EXECUTED','3:55daf6d077eac0ef7e30e6395bc4bc68','Create Table','',NULL,'2.0.5'),('1227303685425-63','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',60,'EXECUTED','3:cdc470c39dadd7cb1a1527a82ff737d3','Create Table','',NULL,'2.0.5'),('1227303685425-64','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',61,'EXECUTED','3:e3eb66044ea03e417837e9c1668f28e3','Create Table','',NULL,'2.0.5'),('1227303685425-65','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',62,'EXECUTED','3:f3a2f7801224c3f3410bc9f7a1cfebff','Create Table','',NULL,'2.0.5'),('1227303685425-66','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',63,'EXECUTED','3:93e2d359d5f6c38b95dfd47dce687c9c','Create Table','',NULL,'2.0.5'),('1227303685425-67','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',64,'EXECUTED','3:ec491d9f71a9e334e005a4f85c9ffdc6','Create Table','',NULL,'2.0.5'),('1227303685425-68','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',65,'EXECUTED','3:40096bd3e62db8377ce4f0a1fcea444e','Create Table','',NULL,'2.0.5'),('1227303685425-7','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:27',6,'EXECUTED','3:13a412a8d9125f657594bc96f742dd1b','Create Table','',NULL,'2.0.5'),('1227303685425-70','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',66,'EXECUTED','3:0df5ce250df07062c43119d18fc2a85b','Create Table','',NULL,'2.0.5'),('1227303685425-71','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',67,'EXECUTED','3:06e7ba94af07838a3d2ebb98816412a3','Create Table','',NULL,'2.0.5'),('1227303685425-72','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:28',68,'EXECUTED','3:01610d6974df470c653bc34953a31335','Create Table','',NULL,'2.0.5'),('1227303685425-73','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:29',89,'EXECUTED','3:33d08000805c4b9d7db06556961553b1','Add Primary Key','',NULL,'2.0.5'),('1227303685425-75','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:29',90,'EXECUTED','3:f2b0a95b4015b54d38c721906abc1fdb','Add Primary Key','',NULL,'2.0.5'),('1227303685425-77','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:29',91,'EXECUTED','3:bdde9c0d7374a3468a94426199b0d930','Add Primary Key','',NULL,'2.0.5'),('1227303685425-78','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:29',92,'EXECUTED','3:6fb4014a9a3ecc6ed09a896936b8342d','Add Primary Key','',NULL,'2.0.5'),('1227303685425-79','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:29',93,'EXECUTED','3:77e1d7c49e104435d10d90cc70e006e3','Add Primary Key','',NULL,'2.0.5'),('1227303685425-81','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:29',94,'EXECUTED','3:a5871abe4cdc3d8d9390a9b4ab0d0776','Add Primary Key','',NULL,'2.0.5'),('1227303685425-82','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:29',95,'EXECUTED','3:2f7eab1e485fd5a653af8799a84383b4','Add Primary Key','',NULL,'2.0.5'),('1227303685425-83','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:29',96,'EXECUTED','3:60ca763d5ac940b3bc189e2f28270bd8','Add Primary Key','',NULL,'2.0.5'),('1227303685425-84','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:29',97,'EXECUTED','3:901f48ab4c9e3a702fc0b38c5e724a5e','Add Primary Key','',NULL,'2.0.5'),('1227303685425-85','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:29',99,'EXECUTED','3:5544801862c8f21461acf9a22283ccab','Create Index','',NULL,'2.0.5'),('1227303685425-86','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:29',100,'EXECUTED','3:70591fc2cd8ce2e7bda36b407bbcaa86','Create Index','',NULL,'2.0.5'),('1227303685425-87','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:29',101,'EXECUTED','3:35c206a147d28660ffee5f87208f1f6b','Create Index','',NULL,'2.0.5'),('1227303685425-88','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:29',102,'EXECUTED','3:d399797580e14e7d67c1c40637314476','Create Index','',NULL,'2.0.5'),('1227303685425-89','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:29',103,'EXECUTED','3:138fa4373fe05e63fe5f923cf3c17e69','Create Index','',NULL,'2.0.5'),('1227303685425-9','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:27',7,'EXECUTED','3:ac6886dbc0c811bda6909908fb2d30a2','Create Table','',NULL,'2.0.5'),('1227303685425-90','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:29',104,'EXECUTED','3:4b60e13b8e209c2b5b1f981f4c28fc1b','Create Index','',NULL,'2.0.5'),('1227303685425-91','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:29',105,'EXECUTED','3:f9c13df6f50d1e7c1fad36faa020d7a6','Create Index','',NULL,'2.0.5'),('1227303685425-92','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:29',106,'EXECUTED','3:c24d9e0d28b3a208dbe2fc1cfaf23720','Create Index','',NULL,'2.0.5'),('1227303685425-93','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:29',107,'EXECUTED','3:ae9beae273f9502bc01580754e0f2bdf','Create Index','',NULL,'2.0.5'),('1227303685425-94','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:29',108,'EXECUTED','3:39d98e23d1480b677bc8f2341711756b','Create Index','',NULL,'2.0.5'),('1227303685425-95','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:29',109,'EXECUTED','3:16ece63cd24c4c5048356cc2854235e1','Create Index','',NULL,'2.0.5'),('1227303685425-96','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:29',110,'EXECUTED','3:de9943f6a1500bd3f94cb7e0c1d3bde7','Create Index','',NULL,'2.0.5'),('1227303685425-97','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:29',111,'EXECUTED','3:c0fac38fa4928378abe6f47bd78926b1','Create Index','',NULL,'2.0.5'),('1227303685425-98','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:30',112,'EXECUTED','3:4c8938f3ea457f5f4f4936e9cbaf898b','Create Index','',NULL,'2.0.5'),('1227303685425-99','ben (generated)','liquibase-schema-only.xml','2015-11-12 08:42:30',113,'EXECUTED','3:d331ce5f04aca9071c5b897396d81098','Create Index','',NULL,'2.0.5'),('170620141122','mujir/vinay','migrations/dependent-modules/liquibase.xml','2015-11-12 08:46:21',10718,'EXECUTED','3:7a2f69232425dbd90a79e67618916ce5','Update Data','Update version for above change',NULL,'2.0.5'),('17092015053645','Hemanth','liquibase.xml','2015-11-12 08:50:10',10922,'EXECUTED','3:3a5649b540435525e947a2b595e20282','Create Table','',NULL,'2.0.5'),('2','upul','liquibase-update-to-latest.xml','2015-11-12 08:43:01',10043,'MARK_RAN','3:b1811e5e43321192b275d6e2fe2fa564','Add Foreign Key Constraint','Create the foreign key from the privilege required for to edit\n			a person attribute type and the privilege.privilege column',NULL,'2.0.5'),('2-increase-privilege-col-size-rol-privilege','dkayiwa','liquibase-update-to-latest.xml','2015-11-12 08:49:24',10880,'EXECUTED','3:6fc0247ae054fedeb32a4af3775046f4','Drop Foreign Key Constraint, Modify Column, Add Foreign Key Constraint','Increasing the size of the privilege column in the role_privilege table',NULL,'2.0.5'),('2-role-assign-new-api-privileges-to-renamed-ones','dkayiwa','liquibase-update-to-latest.xml','2015-11-12 08:49:24',10878,'EXECUTED','3:4eadbd161bf0f7e15eafb4a52b01b625','Custom SQL','Assigning the new API-level privileges to roles that used to have the renamed privileges',NULL,'2.0.5'),('200805281223','bmckown','liquibase-update-to-latest.xml','2015-11-12 08:43:01',10045,'MARK_RAN','3:b1fc37f9ec96eac9203f0808c2f4ac26','Create Table, Add Foreign Key Constraint','Create the concept_complex table',NULL,'2.0.5'),('200805281224','bmckown','liquibase-update-to-latest.xml','2015-11-12 08:43:01',10046,'MARK_RAN','3:ea32453830c2215bdb209770396002e7','Add Column','Adding the value_complex column to obs.  This may take a long time if you have a large number of observations.',NULL,'2.0.5'),('200805281225','bmckown','liquibase-update-to-latest.xml','2015-11-12 08:43:01',10047,'MARK_RAN','3:5281031bcc075df3b959e94da4adcaa9','Insert Row','Adding a \'complex\' Concept Datatype',NULL,'2.0.5'),('200805281226','bmckown','liquibase-update-to-latest.xml','2015-11-12 08:43:01',10048,'MARK_RAN','3:9a49a3d002485f3a77134d98fb7c8cd8','Drop Table (x2)','Dropping the mimetype and complex_obs tables as they aren\'t needed in the new complex obs setup',NULL,'2.0.5'),('200809191226','smbugua','liquibase-update-to-latest.xml','2015-11-12 08:43:01',10049,'MARK_RAN','3:eed0aa27b44ecf668c81e457d99fa7de','Add Column','Adding the hl7 archive message_state column so that archives can be tracked\n			(preCondition database_version check in place because this change was in the old format in trunk for a while)',NULL,'2.0.5'),('200809191927','smbugua','liquibase-update-to-latest.xml','2015-11-12 08:43:01',10050,'MARK_RAN','3:f0e4fab64749e42770e62e9330c2d288','Rename Column, Modify Column','Adding the hl7 archive message_state column so that archives can be tracked',NULL,'2.0.5'),('200811261102','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:01',10044,'EXECUTED','3:158dd028359ebfd4f1c9bf2e76a5e143','Update Data','Fix field property for new Tribe person attribute',NULL,'2.0.5'),('200901101524','Knoll_Frank','liquibase-update-to-latest.xml','2015-11-12 08:43:01',10051,'EXECUTED','3:feb4a087d13657164e5c3bc787b7f83f','Modify Column','Changing datatype of drug.retire_reason from DATETIME to varchar(255)',NULL,'2.0.5'),('200901130950','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:01',10052,'EXECUTED','3:f1e5e7124bdb4f7378866fdb691e2780','Delete Data (x2)','Remove Manage Tribes and View Tribes privileges from all roles',NULL,'2.0.5'),('200901130951','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:01',10053,'EXECUTED','3:54ac8683819837cc04f1a16b6311d668','Delete Data (x2)','Remove Manage Mime Types, View Mime Types, and Purge Mime Types privilege',NULL,'2.0.5'),('200901161126','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:01',10054,'EXECUTED','3:871b9364dd87b6bfcc0005f40b6eb399','Delete Data','Removed the database_version global property',NULL,'2.0.5'),('20090121-0949','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:01',10055,'EXECUTED','3:8639e35e0238019af2f9e326dd5cbc22','Custom SQL','Switched the default xslt to use PV1-19 instead of PV1-1',NULL,'2.0.5'),('20090122-0853','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:01',10056,'EXECUTED','3:4903c6f81f0309313013851f09a26b85','Custom SQL, Add Lookup Table, Drop Foreign Key Constraint, Delete Data (x2), Drop Table','Remove duplicate concept name tags',NULL,'2.0.5'),('20090123-0305','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:02',10057,'MARK_RAN','3:48cdf2b28fcad687072ac8133e46cba6','Add Unique Constraint','Add unique constraint to the tags table',NULL,'2.0.5'),('20090214-2246','isherman','liquibase-update-to-latest.xml','2015-11-12 08:43:02',10063,'EXECUTED','3:d16c607266238df425db61908e7c8745','Custom SQL','Add weight and cd4 to patientGraphConcepts user property (mysql specific)',NULL,'2.0.5'),('20090214-2247','isherman','liquibase-update-to-latest.xml','2015-11-12 08:43:02',10064,'MARK_RAN','3:e4eeb4a09c2ab695bbde832cd7b6047d','Custom SQL','Add weight and cd4 to patientGraphConcepts user property (using standard sql)',NULL,'2.0.5'),('200902142212','ewolodzko','liquibase-update-to-latest.xml','2015-11-12 08:43:26',10242,'MARK_RAN','3:df93fa2841295b29a0fcd4225c46d1a3','Add Column','Add a sortWeight field to PersonAttributeType',NULL,'2.0.5'),('200902142213','ewolodzko','liquibase-update-to-latest.xml','2015-11-12 08:43:26',10243,'EXECUTED','3:288804e42d575fe62c852ed9daa9d59d','Custom SQL','Add default sortWeights to all current PersonAttributeTypes',NULL,'2.0.5'),('20090224-1002-create-visit_type','dkayiwa','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10382,'MARK_RAN','3:ea3c0b323da2d51cf43e982177eace96','Create Table, Add Foreign Key Constraint (x3)','Create visit type table',NULL,'2.0.5'),('20090224-1229','Keelhaul+bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:02',10058,'MARK_RAN','3:f8433194bcb29073c17c7765ce61aab2','Create Table, Add Foreign Key Constraint (x2)','Add location tags table',NULL,'2.0.5'),('20090224-1250','Keelhaul+bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:02',10059,'MARK_RAN','3:8935a56fac2ad91275248d4675c2c090','Create Table, Add Foreign Key Constraint (x2), Add Primary Key','Add location tag map table',NULL,'2.0.5'),('20090224-1256','Keelhaul+bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:02',10060,'MARK_RAN','3:9c0e7238dd1daad9edff381ba22a3ada','Add Column, Add Foreign Key Constraint','Add parent_location column to location table',NULL,'2.0.5'),('20090225-1551','dthomas','liquibase-update-to-latest.xml','2011-09-15 00:00:00',10001,'MARK_RAN','3:a3aed1685bd1051a8c4fae0eab925954',NULL,NULL,NULL,NULL),('20090301-1259','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:02',10062,'EXECUTED','3:21f2ac06dee26613b73003cd1f247ea8','Update Data (x2)','Fixes the description for name layout global property',NULL,'2.0.5'),('20090316-1008','vanand','liquibase-update-to-latest.xml','2011-09-15 00:00:00',10000,'MARK_RAN','3:baa49982f1106c65ba33c845bba149b3',NULL,NULL,NULL,NULL),('20090316-1008-fix','sunbiz','liquibase-update-to-latest.xml','2015-11-12 08:43:36',10430,'EXECUTED','3:aeeb6c14cd22ffa121a2582e04025f5a','Modify Column (x36)','(Fixed)Changing from smallint to BOOLEAN type on BOOLEAN properties',NULL,'2.0.5'),('200903210905','mseaton','liquibase-update-to-latest.xml','2015-11-12 08:43:02',10065,'MARK_RAN','3:720bb7a3f71f0c0a911d3364e55dd72f','Create Table, Add Foreign Key Constraint (x3)','Add a table to enable generic storage of serialized objects',NULL,'2.0.5'),('200903210905-fix','sunbiz','liquibase-update-to-latest.xml','2015-11-12 08:43:02',10066,'EXECUTED','3:a11519f50deeece1f9760d3fc1ac3f05','Modify Column','(Fixed)Add a table to enable generic storage of serialized objects',NULL,'2.0.5'),('20090402-1515-38-cohort','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:02',10071,'MARK_RAN','3:5c65821ef168d9e8296466be5990ae08','Add Column','Adding \"uuid\" column to cohort table',NULL,'2.0.5'),('20090402-1515-38-concept','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10072,'MARK_RAN','3:8004d09d6e2a34623b8d0a13d6c38dc4','Add Column','Adding \"uuid\" column to concept table',NULL,'2.0.5'),('20090402-1515-38-concept_answer','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10073,'MARK_RAN','3:adf3f4ebf7e0eb55eb6927dea7ce2a49','Add Column','Adding \"uuid\" column to concept_answer table',NULL,'2.0.5'),('20090402-1515-38-concept_class','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10074,'MARK_RAN','3:f39e190a2e12c7a6163a0d8a82544228','Add Column','Adding \"uuid\" column to concept_class table',NULL,'2.0.5'),('20090402-1515-38-concept_datatype','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10075,'MARK_RAN','3:d68b3f2323626fee7b433f873a019412','Add Column','Adding \"uuid\" column to concept_datatype table',NULL,'2.0.5'),('20090402-1515-38-concept_description','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10076,'MARK_RAN','3:7d043672ede851c5dcd717171f953c75','Add Column','Adding \"uuid\" column to concept_description table',NULL,'2.0.5'),('20090402-1515-38-concept_map','bwolfe','liquibase-update-to-latest.xml','2011-09-15 00:00:00',10002,'MARK_RAN','3:c1884f56bd70a205b86e7c4038e6c6f9',NULL,NULL,NULL,NULL),('20090402-1515-38-concept_name','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10077,'MARK_RAN','3:822888c5ba1132f6783fbd032c21f238','Add Column','Adding \"uuid\" column to concept_name table',NULL,'2.0.5'),('20090402-1515-38-concept_name_tag','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10078,'MARK_RAN','3:dcb584d414ffd8133c97e42585bd34cd','Add Column','Adding \"uuid\" column to concept_name_tag table',NULL,'2.0.5'),('20090402-1515-38-concept_proposal','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10079,'MARK_RAN','3:fe19ecccb704331741c227aa72597789','Add Column','Adding \"uuid\" column to concept_proposal table',NULL,'2.0.5'),('20090402-1515-38-concept_set','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10080,'MARK_RAN','3:cdc72e16eaec2244c09e9e2fedf5806b','Add Column','Adding \"uuid\" column to concept_set table',NULL,'2.0.5'),('20090402-1515-38-concept_source','bwolfe','liquibase-update-to-latest.xml','2011-09-15 00:00:00',10003,'MARK_RAN','3:ad101415b93eaf653871eddd4fe4fc17',NULL,NULL,NULL,NULL),('20090402-1515-38-concept_state_conversion','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10081,'MARK_RAN','3:5ce8a6cdbfa8742b033b0b1c12e4cd42','Add Column','Adding \"uuid\" column to concept_state_conversion table',NULL,'2.0.5'),('20090402-1515-38-drug','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10082,'MARK_RAN','3:6869bd44f51cb7f63f758fbd8a7fe156','Add Column','Adding \"uuid\" column to drug table',NULL,'2.0.5'),('20090402-1515-38-encounter','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10083,'MARK_RAN','3:0808491f7ec59827a0415f2949b9d90e','Add Column','Adding \"uuid\" column to encounter table',NULL,'2.0.5'),('20090402-1515-38-encounter_type','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10084,'MARK_RAN','3:9aaac835f4d9579386990d4990ffb9d6','Add Column','Adding \"uuid\" column to encounter_type table',NULL,'2.0.5'),('20090402-1515-38-field','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10085,'MARK_RAN','3:dfee5fe509457ef12b14254bab9e6df5','Add Column','Adding \"uuid\" column to field table',NULL,'2.0.5'),('20090402-1515-38-field_answer','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10086,'MARK_RAN','3:c378494d6e9ae45b278c726256619cd7','Add Column','Adding \"uuid\" column to field_answer table',NULL,'2.0.5'),('20090402-1515-38-field_type','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10087,'MARK_RAN','3:dfb47f0b85d5bdad77f3a15cc4d180ec','Add Column','Adding \"uuid\" column to field_type table',NULL,'2.0.5'),('20090402-1515-38-form','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10088,'MARK_RAN','3:eb707ff99ed8ca2945a43175b904dea4','Add Column','Adding \"uuid\" column to form table',NULL,'2.0.5'),('20090402-1515-38-form_field','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10089,'MARK_RAN','3:635701ccda0484966f45f0e617119100','Add Column','Adding \"uuid\" column to form_field table',NULL,'2.0.5'),('20090402-1515-38-global_property','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10090,'MARK_RAN','3:1c62ba666b60eaa88ee3a90853f3bf59','Add Column','Adding \"uuid\" column to global_property table',NULL,'2.0.5'),('20090402-1515-38-hl7_in_archive','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10091,'MARK_RAN','3:9c5015280eff821924416112922fd94d','Add Column','Adding \"uuid\" column to hl7_in_archive table',NULL,'2.0.5'),('20090402-1515-38-hl7_in_error','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10092,'MARK_RAN','3:35b94fc079e6de9ada4329a7bbc55645','Add Column','Adding \"uuid\" column to hl7_in_error table',NULL,'2.0.5'),('20090402-1515-38-hl7_in_queue','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10093,'MARK_RAN','3:494d9eaaed055d0c5af4b4d85db2095d','Add Column','Adding \"uuid\" column to hl7_in_queue table',NULL,'2.0.5'),('20090402-1515-38-hl7_source','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10094,'MARK_RAN','3:8bc9839788ef5ab415ccf020eb04a1f7','Add Column','Adding \"uuid\" column to hl7_source table',NULL,'2.0.5'),('20090402-1515-38-location','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10095,'MARK_RAN','3:7e6b762f813310c72026677d540dee57','Add Column','Adding \"uuid\" column to location table',NULL,'2.0.5'),('20090402-1515-38-location_tag','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10096,'MARK_RAN','3:6a94a67e776662268d42f09cf7c66ac0','Add Column','Adding \"uuid\" column to location_tag table',NULL,'2.0.5'),('20090402-1515-38-note','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10097,'MARK_RAN','3:f0fd7b6750d07c973aad667b170cdfa8','Add Column','Adding \"uuid\" column to note table',NULL,'2.0.5'),('20090402-1515-38-notification_alert','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10098,'MARK_RAN','3:f2865558fb76c7584f6e86786b0ffdea','Add Column','Adding \"uuid\" column to notification_alert table',NULL,'2.0.5'),('20090402-1515-38-notification_template','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10099,'MARK_RAN','3:c05536d99eb2479211cb10010d48a2e9','Add Column','Adding \"uuid\" column to notification_template table',NULL,'2.0.5'),('20090402-1515-38-obs','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10100,'MARK_RAN','3:ba99d7eccba2185e9d5ebab98007e577','Add Column','Adding \"uuid\" column to obs table',NULL,'2.0.5'),('20090402-1515-38-orders','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10102,'MARK_RAN','3:732a2d4fd91690d544f0c63bdb65819f','Add Column','Adding \"uuid\" column to orders table',NULL,'2.0.5'),('20090402-1515-38-order_type','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10101,'MARK_RAN','3:137552884c5eb5af4c3f77c90df514cb','Add Column','Adding \"uuid\" column to order_type table',NULL,'2.0.5'),('20090402-1515-38-patient_identifier','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10103,'MARK_RAN','3:1a9ddcd8997bcf1a9668051d397e41c1','Add Column','Adding \"uuid\" column to patient_identifier table',NULL,'2.0.5'),('20090402-1515-38-patient_identifier_type','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10104,'MARK_RAN','3:6170d6caa73320fd2433fba0a16e8029','Add Column','Adding \"uuid\" column to patient_identifier_type table',NULL,'2.0.5'),('20090402-1515-38-patient_program','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10105,'MARK_RAN','3:8fb284b435669717f4b5aaa66e61fc10','Add Column','Adding \"uuid\" column to patient_program table',NULL,'2.0.5'),('20090402-1515-38-patient_state','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10106,'MARK_RAN','3:b67eb1bbd3e2912a646f56425c38631f','Add Column','Adding \"uuid\" column to patient_state table',NULL,'2.0.5'),('20090402-1515-38-person','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10107,'MARK_RAN','3:2b89eb77976b9159717e9d7b83c34cf1','Add Column','Adding \"uuid\" column to person table',NULL,'2.0.5'),('20090402-1515-38-person_address','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10108,'MARK_RAN','3:cfdb17b16b6d15477bc72d4d19ac3f29','Add Column','Adding \"uuid\" column to person_address table',NULL,'2.0.5'),('20090402-1515-38-person_attribute','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10109,'MARK_RAN','3:2f6b7fa688987b32d99cda348c6f6c46','Add Column','Adding \"uuid\" column to person_attribute table',NULL,'2.0.5'),('20090402-1515-38-person_attribute_type','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10110,'MARK_RAN','3:38d4dce320f2fc35db9dfcc2eafc093e','Add Column','Adding \"uuid\" column to person_attribute_type table',NULL,'2.0.5'),('20090402-1515-38-person_name','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10111,'MARK_RAN','3:339f02d6797870f9e7dd704f093b088c','Add Column','Adding \"uuid\" column to person_name table',NULL,'2.0.5'),('20090402-1515-38-privilege','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10112,'MARK_RAN','3:41f52c4340fdc9f0825ea9660edea8ec','Add Column','Adding \"uuid\" column to privilege table',NULL,'2.0.5'),('20090402-1515-38-program','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10113,'MARK_RAN','3:a72f80159cdbd576906cd3b9069d425b','Add Column','Adding \"uuid\" column to program table',NULL,'2.0.5'),('20090402-1515-38-program_workflow','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10114,'MARK_RAN','3:c69183f7e1614d5a338c0d0944f1e754','Add Column','Adding \"uuid\" column to program_workflow table',NULL,'2.0.5'),('20090402-1515-38-program_workflow_state','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10115,'MARK_RAN','3:e25b0fa351bb667af3ff562855f66bb6','Add Column','Adding \"uuid\" column to program_workflow_state table',NULL,'2.0.5'),('20090402-1515-38-relationship','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10116,'MARK_RAN','3:95407167e9f4984de1d710a83371ebd1','Add Column','Adding \"uuid\" column to relationship table',NULL,'2.0.5'),('20090402-1515-38-relationship_type','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10117,'MARK_RAN','3:f8755b127c004d11a43bfd6558be01b7','Add Column','Adding \"uuid\" column to relationship_type table',NULL,'2.0.5'),('20090402-1515-38-report_object','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10118,'MARK_RAN','3:b7ce0784e817be464370a3154fd4aa9c','Add Column','Adding \"uuid\" column to report_object table',NULL,'2.0.5'),('20090402-1515-38-report_schema_xml','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10119,'MARK_RAN','3:ce7ae79a3e3ce429a56fa658c48889b5','Add Column','Adding \"uuid\" column to report_schema_xml table',NULL,'2.0.5'),('20090402-1515-38-role','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10120,'MARK_RAN','3:f33887a0b51ab366d414e16202cf55db','Add Column','Adding \"uuid\" column to role table',NULL,'2.0.5'),('20090402-1515-38-serialized_object','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10121,'MARK_RAN','3:341cfbdff8ebf188d526bf3348619dcc','Add Column','Adding \"uuid\" column to serialized_object table',NULL,'2.0.5'),('20090402-1516-cohort','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10122,'EXECUTED','3:110084035197514c8d640b915230cf72','Update Data','Generating UUIDs for all rows in cohort table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-concept','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10123,'EXECUTED','3:a44bc743cb837d88f7371282f3a5871e','Update Data','Generating UUIDs for all rows in concept table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-concept_answer','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10124,'EXECUTED','3:f01d7278b153fa10a7d741607501ae1e','Update Data','Generating UUIDs for all rows in concept_answer table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-concept_class','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10125,'EXECUTED','3:786f0ec8beec453ea9487f2e77f9fb4d','Update Data','Generating UUIDs for all rows in concept_class table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-concept_datatype','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10126,'EXECUTED','3:b828e9851365ec70531dabd250374989','Update Data','Generating UUIDs for all rows in concept_datatype table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-concept_description','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10127,'EXECUTED','3:37dbfc43c73553c9c9ecf11206714cc4','Update Data','Generating UUIDs for all rows in concept_description table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-concept_map','bwolfe','liquibase-update-to-latest.xml','2011-09-15 00:00:00',10004,'MARK_RAN','3:e843f99c0371aabee21ca94fcef01f39',NULL,NULL,NULL,NULL),('20090402-1516-concept_name','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10128,'EXECUTED','3:dd414ae9367287c9c03342a79abd1d62','Update Data','Generating UUIDs for all rows in concept_name table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-concept_name_tag','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10129,'EXECUTED','3:cd7b5d0ceeb90b2254708b44c10d03e8','Update Data','Generating UUIDs for all rows in concept_name_tag table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-concept_proposal','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10130,'EXECUTED','3:fb1cfa9c5decbafc3293f3dd1d87ff2b','Update Data','Generating UUIDs for all rows in concept_proposal table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-concept_set','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10131,'EXECUTED','3:3b7f3851624014e740f89bc9a431feaa','Update Data','Generating UUIDs for all rows in concept_set table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-concept_source','bwolfe','liquibase-update-to-latest.xml','2011-09-15 00:00:00',10005,'MARK_RAN','3:53da91ae3e39d7fb7ebca91df3bfd9a6',NULL,NULL,NULL,NULL),('20090402-1516-concept_state_conversion','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10132,'EXECUTED','3:23197d24e498ad86d4e001b183cc0c6b','Update Data','Generating UUIDs for all rows in concept_state_conversion table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-drug','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10133,'EXECUTED','3:40b47df80bd425337b7bdd8b41497967','Update Data','Generating UUIDs for all rows in drug table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-encounter','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10134,'EXECUTED','3:40146708b71d86d4c8c5340767a98f5e','Update Data','Generating UUIDs for all rows in encounter table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-encounter_type','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10135,'EXECUTED','3:738c6b6244a84fc8e6d582bcd472ffe6','Update Data','Generating UUIDs for all rows in encounter_type table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-field','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10136,'EXECUTED','3:98d2a1550e867e4ef303a4cc47ed904d','Update Data','Generating UUIDs for all rows in field table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-field_answer','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10137,'EXECUTED','3:82bdfe361286d261724eef97dd89e358','Update Data','Generating UUIDs for all rows in field_answer table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-field_type','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10138,'EXECUTED','3:19a8d007f6147651240ebb9539d3303a','Update Data','Generating UUIDs for all rows in field_type table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-form','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10139,'EXECUTED','3:026ddf1c9050c7367d4eb57dd4105322','Update Data','Generating UUIDs for all rows in form table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-form_field','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10140,'EXECUTED','3:a8b0bcdb35830c2badfdcb9b1cfdd3b5','Update Data','Generating UUIDs for all rows in form_field table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-global_property','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10141,'EXECUTED','3:75a5b4a9473bc9c6bfbabf8e77b0cda7','Update Data','Generating UUIDs for all rows in global_property table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-hl7_in_archive','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10142,'EXECUTED','3:09891436d8ea0ad14f7b52fd05daa237','Update Data','Generating UUIDs for all rows in hl7_in_archive table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-hl7_in_error','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10143,'EXECUTED','3:8d276bbd8bf9d9d1c64756f37ef91ed3','Update Data','Generating UUIDs for all rows in hl7_in_error table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-hl7_in_queue','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10144,'EXECUTED','3:25e8f998171accd46860717f93690ccc','Update Data','Generating UUIDs for all rows in hl7_in_queue table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-hl7_source','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10145,'EXECUTED','3:45c06e034d7158a0d09afae60c4c83d6','Update Data','Generating UUIDs for all rows in hl7_source table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-location','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10146,'EXECUTED','3:fce0f7eaab989f2ff9664fc66d6b8419','Update Data','Generating UUIDs for all rows in location table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-location_tag','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10147,'EXECUTED','3:50f26d1376ea108bbb65fd4d0633e741','Update Data','Generating UUIDs for all rows in location_tag table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-note','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10148,'EXECUTED','3:f5a0eea2a7c59fffafa674de4356e621','Update Data','Generating UUIDs for all rows in note table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-notification_alert','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10149,'EXECUTED','3:481fbab9bd53449903ac193894adbc28','Update Data','Generating UUIDs for all rows in notification_alert table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-notification_template','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10150,'EXECUTED','3:a4a2990465c4c99747f83ea880cac46a','Update Data','Generating UUIDs for all rows in notification_template table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-obs','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10151,'EXECUTED','3:26d80fdd889922821244f84e3f8039e7','Update Data','Generating UUIDs for all rows in obs table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-orders','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10153,'EXECUTED','3:ec3bc80540d78f416e1d4eef62e8e15a','Update Data','Generating UUIDs for all rows in orders table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-order_type','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10152,'EXECUTED','3:cae66b98b889c7ee1c8d6ab270a8d0d5','Update Data','Generating UUIDs for all rows in order_type table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-patient_identifier','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10154,'EXECUTED','3:647906cc7cf1fde9b7644b8f2541664f','Update Data','Generating UUIDs for all rows in patient_identifier table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-patient_identifier_type','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10155,'EXECUTED','3:85f8db0310c15a74b17e968c7730ae12','Update Data','Generating UUIDs for all rows in patient_identifier_type table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-patient_program','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10156,'EXECUTED','3:576b7db39f0212f8e92b6f4e1844ea30','Update Data','Generating UUIDs for all rows in patient_program table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-patient_state','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10157,'EXECUTED','3:250eab0f97fc4eeb4f1a930fbccfcf08','Update Data','Generating UUIDs for all rows in patient_state table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-person','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10158,'EXECUTED','3:cedc8bcd77ade51558fb2d12916e31a4','Update Data','Generating UUIDs for all rows in person table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-person_address','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10159,'EXECUTED','3:0f817424ca41e5c5b459591d6e18b3c6','Update Data','Generating UUIDs for all rows in person_address table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-person_attribute','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10160,'EXECUTED','3:7f9e09b1267c4a787a9d3e37acfd5746','Update Data','Generating UUIDs for all rows in person_attribute table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-person_attribute_type','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10161,'EXECUTED','3:1e5f84054b7b7fdf59673e2260f48d9d','Update Data','Generating UUIDs for all rows in person_attribute_type table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-person_name','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10162,'EXECUTED','3:f827da2c097b01ca9073c258b19e9540','Update Data','Generating UUIDs for all rows in person_name table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-privilege','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10163,'EXECUTED','3:2ab150a53c91ded0c5b53fa99fde4ba2','Update Data','Generating UUIDs for all rows in privilege table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-program','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10164,'EXECUTED','3:132b63f2efcf781187602e043122e7ff','Update Data','Generating UUIDs for all rows in program table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-program_workflow','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10165,'EXECUTED','3:d945359ed4bb6cc6a21f4554a0c50a33','Update Data','Generating UUIDs for all rows in program_workflow table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-program_workflow_state','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10166,'EXECUTED','3:4bc093882ac096562d63562ac76a1ffa','Update Data','Generating UUIDs for all rows in program_workflow_state table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-relationship','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10167,'EXECUTED','3:25e22c04ada4808cc31fd48f23703333','Update Data','Generating UUIDs for all rows in relationship table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-relationship_type','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10168,'EXECUTED','3:562ad77e9453595c9cd22a2cdde3cc41','Update Data','Generating UUIDs for all rows in relationship_type table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-report_object','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10169,'EXECUTED','3:8531f740c64a0d1605225536c1be0860','Update Data','Generating UUIDs for all rows in report_object table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-report_schema_xml','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10170,'EXECUTED','3:cd9efe4d62f2754b057d2d409d6e826a','Update Data','Generating UUIDs for all rows in report_schema_xml table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-role','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10171,'EXECUTED','3:f75bfc36ad13cb9324b9520804a60141','Update Data','Generating UUIDs for all rows in role table via built in uuid function.',NULL,'2.0.5'),('20090402-1516-serialized_object','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:03',10172,'EXECUTED','3:c809b71d2444a8a8e2c5e5574d344c82','Update Data','Generating UUIDs for all rows in serialized_object table via built in uuid function.',NULL,'2.0.5'),('20090402-1517','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:05',10181,'MARK_RAN','3:4edd135921eb263d4811cf1c22ef4846','Custom Change','Adding UUIDs to all rows in all columns via a java class. (This will take a long time on large databases)',NULL,'2.0.5'),('20090402-1518','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:05',10182,'MARK_RAN','3:a9564fc8de85d37f4748a3fa1e69281c','Add Not-Null Constraint (x52)','Now that UUID generation is done, set the uuid columns to not \"NOT NULL\"',NULL,'2.0.5'),('20090402-1519-cohort','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:05',10183,'EXECUTED','3:260c435f1cf3e3f01d953d630c7a578b','Create Index','Creating unique index on cohort.uuid column',NULL,'2.0.5'),('20090402-1519-concept','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:06',10184,'EXECUTED','3:9e363ee4b39e7fdfb547e3a51ad187c7','Create Index','Creating unique index on concept.uuid column',NULL,'2.0.5'),('20090402-1519-concept_answer','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:06',10185,'EXECUTED','3:34b049a3fd545928760968beb1e98e00','Create Index','Creating unique index on concept_answer.uuid column',NULL,'2.0.5'),('20090402-1519-concept_class','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:07',10186,'EXECUTED','3:0fc95dccef2343850adb1fe49d60f3c3','Create Index','Creating unique index on concept_class.uuid column',NULL,'2.0.5'),('20090402-1519-concept_datatype','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:07',10187,'EXECUTED','3:0cf065b0f780dc2eeca994628af49a34','Create Index','Creating unique index on concept_datatype.uuid column',NULL,'2.0.5'),('20090402-1519-concept_description','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:07',10188,'EXECUTED','3:16ce0ad6c3e37071bbfcaad744693d0f','Create Index','Creating unique index on concept_description.uuid column',NULL,'2.0.5'),('20090402-1519-concept_map','bwolfe','liquibase-update-to-latest.xml','2011-09-15 00:00:00',10006,'MARK_RAN','3:b8a320c1d44ab94e785c9ae6c41378f3',NULL,NULL,NULL,NULL),('20090402-1519-concept_name','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:08',10189,'EXECUTED','3:0d5866c0d3eadc8df09b1a7c160508ca','Create Index','Creating unique index on concept_name.uuid column',NULL,'2.0.5'),('20090402-1519-concept_name_tag','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:08',10190,'EXECUTED','3:7ba597ec0fb5fbfba615ac97df642072','Create Index','Creating unique index on concept_name_tag.uuid column',NULL,'2.0.5'),('20090402-1519-concept_proposal','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:09',10191,'EXECUTED','3:79f9f4af9669c2b03511832a23db55e0','Create Index','Creating unique index on concept_proposal.uuid column',NULL,'2.0.5'),('20090402-1519-concept_set','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:09',10192,'EXECUTED','3:f5ba4e2d5ddd4ec66f43501b9749cf70','Create Index','Creating unique index on concept_set.uuid column',NULL,'2.0.5'),('20090402-1519-concept_source','bwolfe','liquibase-update-to-latest.xml','2011-09-15 00:00:00',10007,'MARK_RAN','3:c7c47d9c2876bfa53542885e304b21e7',NULL,NULL,NULL,NULL),('20090402-1519-concept_state_conversion','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:09',10193,'EXECUTED','3:cc9d9bb0d5eb9f6583cd538919b42b9a','Create Index','Creating unique index on concept_state_conversion.uuid column',NULL,'2.0.5'),('20090402-1519-drug','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:10',10194,'EXECUTED','3:8cac800e9f857e29698e1c80ab7e6a52','Create Index','Creating unique index on drug.uuid column',NULL,'2.0.5'),('20090402-1519-encounter','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:10',10195,'EXECUTED','3:8fd623411a44ffb0d4e3a4139e916585','Create Index','Creating unique index on encounter.uuid column',NULL,'2.0.5'),('20090402-1519-encounter_type','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:10',10196,'EXECUTED','3:71e0e1df8c290d8b6e81e281154661e0','Create Index','Creating unique index on encounter_type.uuid column',NULL,'2.0.5'),('20090402-1519-field','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:11',10197,'EXECUTED','3:36d9eba3e0a90061c6bf1c8aa483110e','Create Index','Creating unique index on field.uuid column',NULL,'2.0.5'),('20090402-1519-field_answer','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:11',10198,'EXECUTED','3:81572b572f758cac173b5d14516f600e','Create Index','Creating unique index on field_answer.uuid column',NULL,'2.0.5'),('20090402-1519-field_type','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:12',10199,'EXECUTED','3:a0c3927dfde900959131aeb1490a5f51','Create Index','Creating unique index on field_type.uuid column',NULL,'2.0.5'),('20090402-1519-form','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:12',10200,'EXECUTED','3:61147c780ce563776a1caed795661aca','Create Index','Creating unique index on form.uuid column',NULL,'2.0.5'),('20090402-1519-form_field','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:12',10201,'EXECUTED','3:bd9def4522865d181e42809f9dd5c116','Create Index','Creating unique index on form_field.uuid column',NULL,'2.0.5'),('20090402-1519-global_property','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:13',10202,'EXECUTED','3:0e6b84ad5fffa3fd49242b5475e8eb66','Create Index','Creating unique index on global_property.uuid column',NULL,'2.0.5'),('20090402-1519-hl7_in_archive','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:13',10203,'EXECUTED','3:d2f8921c170e416560c234aa74964346','Create Index','Creating unique index on hl7_in_archive.uuid column',NULL,'2.0.5'),('20090402-1519-hl7_in_error','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:14',10204,'EXECUTED','3:9ccec0729ea1b4eaa5068726f9045c25','Create Index','Creating unique index on hl7_in_error.uuid column',NULL,'2.0.5'),('20090402-1519-hl7_in_queue','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:14',10205,'EXECUTED','3:af537cb4134c3f2ed0357f3280ceb6fe','Create Index','Creating unique index on hl7_in_queue.uuid column',NULL,'2.0.5'),('20090402-1519-hl7_source','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:14',10206,'EXECUTED','3:a6d1847b6a590319206f65be9d1d3c9e','Create Index','Creating unique index on hl7_source.uuid column',NULL,'2.0.5'),('20090402-1519-location','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:15',10207,'EXECUTED','3:c435bd4b405d4f11d919777718aa055c','Create Index','Creating unique index on location.uuid column',NULL,'2.0.5'),('20090402-1519-location_tag','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:15',10208,'EXECUTED','3:33a8a54cde59b23a9cdb7740a9995e1a','Create Index','Creating unique index on location_tag.uuid column',NULL,'2.0.5'),('20090402-1519-note','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:15',10209,'EXECUTED','3:97279b2ce285e56613a10a77c5af32b2','Create Index','Creating unique index on note.uuid column',NULL,'2.0.5'),('20090402-1519-notification_alert','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:16',10210,'EXECUTED','3:a763255eddf8607f7d86afbb3099d4b5','Create Index','Creating unique index on notification_alert.uuid column',NULL,'2.0.5'),('20090402-1519-notification_template','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:16',10211,'EXECUTED','3:9a69bbb343077bc62acdf6a66498029a','Create Index','Creating unique index on notification_template.uuid column',NULL,'2.0.5'),('20090402-1519-obs','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:17',10212,'EXECUTED','3:de9a7a24e527542e6b4a73e2cd31a7f9','Create Index','Creating unique index on obs.uuid column',NULL,'2.0.5'),('20090402-1519-orders','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:17',10214,'EXECUTED','3:848c0a00a32c5eb25041ad058fd38263','Create Index','Creating unique index on orders.uuid column',NULL,'2.0.5'),('20090402-1519-order_type','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:17',10213,'EXECUTED','3:d938d263e0acf974d43ad81d2fbe05b0','Create Index','Creating unique index on order_type.uuid column',NULL,'2.0.5'),('20090402-1519-patient_identifier','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:18',10215,'EXECUTED','3:43389efa06408c8312d130654309d140','Create Index','Creating unique index on patient_identifier.uuid column',NULL,'2.0.5'),('20090402-1519-patient_identifier_type','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:18',10216,'EXECUTED','3:3ffe4f31a1c48d2545e8eed4127cc490','Create Index','Creating unique index on patient_identifier_type.uuid column',NULL,'2.0.5'),('20090402-1519-patient_program','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:19',10217,'EXECUTED','3:ce69defda5ba254914f2319f3a7aac02','Create Index','Creating unique index on patient_program.uuid column',NULL,'2.0.5'),('20090402-1519-patient_state','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:19',10218,'EXECUTED','3:a4ca15f62b3c8c43f7f47ef8b9e39cd3','Create Index','Creating unique index on patient_state.uuid column',NULL,'2.0.5'),('20090402-1519-person','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:19',10219,'EXECUTED','3:345a5d4e8dea4d56c1a0784e7b35a801','Create Index','Creating unique index on person.uuid column',NULL,'2.0.5'),('20090402-1519-person_address','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:20',10220,'EXECUTED','3:105ece744a45b624ea8990f152bb8300','Create Index','Creating unique index on person_address.uuid column',NULL,'2.0.5'),('20090402-1519-person_attribute','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:20',10221,'EXECUTED','3:67a8cdda8605c28f76314873d2606457','Create Index','Creating unique index on person_attribute.uuid column',NULL,'2.0.5'),('20090402-1519-person_attribute_type','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:20',10222,'EXECUTED','3:a234ad0ea13f32fc4529cf556151d611','Create Index','Creating unique index on person_attribute_type.uuid column',NULL,'2.0.5'),('20090402-1519-person_name','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:21',10223,'EXECUTED','3:d18e326ce221b4b1232ce2e355731338','Create Index','Creating unique index on person_name.uuid column',NULL,'2.0.5'),('20090402-1519-privilege','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:21',10224,'EXECUTED','3:47e7f70f34a213d870e2aeed795d5e3d','Create Index','Creating unique index on privilege.uuid column',NULL,'2.0.5'),('20090402-1519-program','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:22',10225,'EXECUTED','3:62f9d9ecd2325d5908237a769e9a8bc7','Create Index','Creating unique index on program.uuid column',NULL,'2.0.5'),('20090402-1519-program_workflow','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:22',10226,'EXECUTED','3:fabb3152f6055dc0071a2e5d6f573d2f','Create Index','Creating unique index on program_workflow.uuid column',NULL,'2.0.5'),('20090402-1519-program_workflow_state','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:22',10227,'EXECUTED','3:4fdf0c20aedcdc87b2c6058a1cc8fce7','Create Index','Creating unique index on program_workflow_state.uuid column',NULL,'2.0.5'),('20090402-1519-relationship','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:23',10228,'EXECUTED','3:c90617ca900b1aef3f29e71f693e8a25','Create Index','Creating unique index on relationship.uuid column',NULL,'2.0.5'),('20090402-1519-relationship_type','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:23',10229,'EXECUTED','3:c9f05aca70b6dad54af121b593587a29','Create Index','Creating unique index on relationship_type.uuid column',NULL,'2.0.5'),('20090402-1519-report_object','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:23',10230,'EXECUTED','3:6069b78580fd0d276f5dae9f3bdf21be','Create Index','Creating unique index on report_object.uuid column',NULL,'2.0.5'),('20090402-1519-report_schema_xml','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:24',10231,'EXECUTED','3:91499d332dda0577fd02b6a6b7b35e99','Create Index','Creating unique index on report_schema_xml.uuid column',NULL,'2.0.5'),('20090402-1519-role','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:24',10232,'EXECUTED','3:c535a800ceb006311bbb7a27e8bab6ea','Create Index','Creating unique index on role.uuid column',NULL,'2.0.5'),('20090402-1519-serialized_object','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:25',10233,'EXECUTED','3:e8f2b1c3a7a67aadc8499ebcb522c91a','Create Index','Creating unique index on serialized_object.uuid column',NULL,'2.0.5'),('20090408-1298','Cory McCarthy','liquibase-update-to-latest.xml','2015-11-12 08:43:02',10068,'EXECUTED','3:defbd13a058ba3563e232c2093cd2b37','Modify Column','Changed the datatype for encounter_type to \'text\' instead of just 50 chars',NULL,'2.0.5'),('200904091023','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:02',10067,'EXECUTED','3:48adc23e9c5d820a87f6c8d61dfb6b55','Delete Data (x4)','Remove Manage Tribes and View Tribes privileges from the privilege table and role_privilege table.\n			The privileges will be recreated by the Tribe module if it is installed.',NULL,'2.0.5'),('20090414-0804','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:04',10173,'EXECUTED','3:479b4df8e3c746b5b96eeea422799774','Drop Foreign Key Constraint','Dropping foreign key on concept_set.concept_id table',NULL,'2.0.5'),('20090414-0805','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:04',10174,'MARK_RAN','3:5017417439ff841eb036ceb94f3c5800','Drop Primary Key','Dropping primary key on concept set table',NULL,'2.0.5'),('20090414-0806','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:04',10175,'MARK_RAN','3:6b9cec59fd607569228bf87d4dffa1a5','Add Column','Adding new integer primary key to concept set table',NULL,'2.0.5'),('20090414-0807','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:04',10176,'MARK_RAN','3:57834f6c953f34035237e06a2dbed9c7','Create Index, Add Foreign Key Constraint','Adding index and foreign key to concept_set.concept_id column',NULL,'2.0.5'),('20090414-0808a','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:05',10177,'EXECUTED','3:6c9d9e6b85c1bf04fdbf9fdec316f2ea','Drop Foreign Key Constraint','Dropping foreign key on patient_identifier.patient_id column',NULL,'2.0.5'),('20090414-0808b','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:05',10178,'MARK_RAN','3:12e01363841135ed0dae46d71e7694cf','Drop Primary Key','Dropping non-integer primary key on patient identifier table before adding a new integer primary key',NULL,'2.0.5'),('20090414-0809','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:05',10179,'MARK_RAN','3:864765efa4cae1c8ffb1138d63f77017','Add Column','Adding new integer primary key to patient identifier table',NULL,'2.0.5'),('20090414-0810','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:05',10180,'MARK_RAN','3:4ca46ee358567e35c897a73c065e3367','Create Index, Add Foreign Key Constraint','Adding index and foreign key on patient_identifier.patient_id column',NULL,'2.0.5'),('20090414-0811a','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:25',10234,'EXECUTED','3:f027a0ad38c0f6302def391da78aaaee','Drop Foreign Key Constraint','Dropping foreign key on concept_word.concept_id column',NULL,'2.0.5'),('20090414-0811b','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:25',10236,'MARK_RAN','3:982d502e56854922542286cead4c09ce','Drop Primary Key','Dropping non-integer primary key on concept word table before adding new integer one',NULL,'2.0.5'),('20090414-0812','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:25',10237,'MARK_RAN','3:948e635fe3f63122856ca9b8a174352b','Add Column','Adding integer primary key to concept word table',NULL,'2.0.5'),('20090414-0812b','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:25',10238,'MARK_RAN','3:bd7731e58f3db9b944905597a08eb6cb','Add Foreign Key Constraint','Re-adding foreign key for concept_word.concept_name_id',NULL,'2.0.5'),('200904271042','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:26',10241,'MARK_RAN','3:db63ce704aff4741c52181d1c825ab62','Drop Column','Remove the now unused synonym column',NULL,'2.0.5'),('20090428-0811aa','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:25',10235,'MARK_RAN','3:58d8f3df1fe704714a7b4957a6c0e7f7','Drop Foreign Key Constraint','Removing concept_word.concept_name_id foreign key so that primary key can be changed to concept_word_id',NULL,'2.0.5'),('20090428-0854','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:26',10239,'EXECUTED','3:11086a37155507c0238c9532f66b172b','Add Foreign Key Constraint','Adding foreign key for concept_word.concept_id column',NULL,'2.0.5'),('200905071626','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:02',10070,'MARK_RAN','3:d29884c3ef8fd867c3c2ffbd557c14c2','Create Index','Add an index to the concept_word.concept_id column (This update may fail if it already exists)',NULL,'2.0.5'),('200905150814','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:02',10069,'EXECUTED','3:44c729b393232d702553e0768cf94994','Delete Data','Deleting invalid concept words',NULL,'2.0.5'),('200905150821','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:26',10240,'EXECUTED','3:c0b7abc7eb00f243325b4a3fb2afc614','Custom SQL','Deleting duplicate concept word keys',NULL,'2.0.5'),('200906301606','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:26',10244,'EXECUTED','3:de40c56c128997509d1d943ed047c5d2','Modify Column','Change person_attribute_type.sort_weight from an integer to a float',NULL,'2.0.5'),('200907161638-1','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:26',10245,'EXECUTED','3:dfd352bdc4c5e6c88cd040d03c782e31','Modify Column','Change obs.value_numeric from a double(22,0) to a double',NULL,'2.0.5'),('200907161638-2','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:26',10246,'EXECUTED','3:a8dc0bd1593e6c99a02db443bc4cb001','Modify Column','Change concept_numeric columns from a double(22,0) type to a double',NULL,'2.0.5'),('200907161638-3','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:26',10247,'EXECUTED','3:47b8adbcd480660765dd117020a1e085','Modify Column','Change concept_set.sort_weight from a double(22,0) to a double',NULL,'2.0.5'),('200907161638-4','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:26',10248,'EXECUTED','3:3ffccaa291298fea317eb7025c058492','Modify Column','Change concept_set_derived.sort_weight from a double(22,0) to a double',NULL,'2.0.5'),('200907161638-5','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:26',10249,'EXECUTED','3:3b31cf625830c7e37fa638dbf9625000','Modify Column','Change drug table columns from a double(22,0) to a double',NULL,'2.0.5'),('200907161638-6','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:26',10250,'EXECUTED','3:dc733faec1539038854c0b559b45da0e','Modify Column','Change drug_order.dose from a double(22,0) to a double',NULL,'2.0.5'),('200908291938-1','dthomas','liquibase-update-to-latest.xml','2011-09-15 00:00:00',10008,'MARK_RAN','3:b99a6d7349d367c30e8b404979e07b89',NULL,NULL,NULL,NULL),('200908291938-2a','dthomas','liquibase-update-to-latest.xml','2011-09-15 00:00:00',10009,'MARK_RAN','3:7e9e8d9bffcb6e602b155827f72a3856',NULL,NULL,NULL,NULL),('20090831-1039-38-scheduler_task_config','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:26',10254,'MARK_RAN','3:54e254379235d5c8b569a00ac7dc9c3f','Add Column','Adding \"uuid\" column to scheduler_task_config table',NULL,'2.0.5'),('20090831-1040-scheduler_task_config','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:26',10255,'EXECUTED','3:a9b26bdab35405050c052a9a3f763db0','Update Data','Generating UUIDs for all rows in scheduler_task_config table via built in uuid function.',NULL,'2.0.5'),('20090831-1041-scheduler_task_config','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:26',10256,'MARK_RAN','3:25127273b2d501664ce325922b0c7db2','Custom Change','Adding UUIDs to all rows in scheduler_task_config table via a java class for non mysql/oracle/mssql databases.',NULL,'2.0.5'),('20090831-1042-scheduler_task_config','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:26',10257,'EXECUTED','3:76d8a8b5d342fc4111034861537315cf','Add Not-Null Constraint','Now that UUID generation is done for scheduler_task_config, set the uuid column to not \"NOT NULL\"',NULL,'2.0.5'),('20090831-1043-scheduler_task_config','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:26',10258,'EXECUTED','3:5408ed04284c4f5d57f5160ca5393733','Create Index','Creating unique index on scheduler_task_config.uuid column',NULL,'2.0.5'),('20090907-1','Knoll_Frank','liquibase-update-to-latest.xml','2015-11-12 08:43:26',10259,'MARK_RAN','3:d6f3ed289cdbce6229b1414ec626a33c','Rename Column','Rename the concept_source.date_voided column to date_retired',NULL,'2.0.5'),('20090907-2a','Knoll_Frank','liquibase-update-to-latest.xml','2015-11-12 08:43:27',10260,'MARK_RAN','3:b71e307e4e782cc5a851f764aa7fc0d0','Drop Foreign Key Constraint','Remove the concept_source.voided_by foreign key constraint',NULL,'2.0.5'),('20090907-2b','Knoll_Frank','liquibase-update-to-latest.xml','2015-11-12 08:43:27',10261,'MARK_RAN','3:14e07ebc0a1138ee973bbb26b568d16e','Rename Column, Add Foreign Key Constraint','Rename the concept_source.voided_by column to retired_by',NULL,'2.0.5'),('20090907-3','Knoll_Frank','liquibase-update-to-latest.xml','2015-11-12 08:43:27',10262,'MARK_RAN','3:adee9ced82158f9a9f3d64245ad591c6','Rename Column','Rename the concept_source.voided column to retired',NULL,'2.0.5'),('20090907-4','Knoll_Frank','liquibase-update-to-latest.xml','2015-11-12 08:43:27',10263,'MARK_RAN','3:ad9b6ed4ef3ae43556d3e8c9e2ec0f5c','Rename Column','Rename the concept_source.void_reason column to retire_reason',NULL,'2.0.5'),('20091001-1023','rcrichton','liquibase-update-to-latest.xml','2015-11-12 08:43:28',10291,'MARK_RAN','3:2bf99392005da4e95178bd1e2c28a87b','Add Column','add retired column to relationship_type table',NULL,'2.0.5'),('20091001-1024','rcrichton','liquibase-update-to-latest.xml','2015-11-12 08:43:28',10292,'MARK_RAN','3:31b7b10f75047606406cea156bcc255f','Add Column','add retired_by column to relationship_type table',NULL,'2.0.5'),('20091001-1025','rcrichton','liquibase-update-to-latest.xml','2015-11-12 08:43:28',10293,'MARK_RAN','3:c6dd75893e5573baa0c7426ecccaa92d','Add Foreign Key Constraint','Create the foreign key from the relationship.retired_by to users.user_id.',NULL,'2.0.5'),('20091001-1026','rcrichton','liquibase-update-to-latest.xml','2015-11-12 08:43:28',10294,'MARK_RAN','3:47cfbab54a8049948784a165ffe830af','Add Column','add date_retired column to relationship_type table',NULL,'2.0.5'),('20091001-1027','rcrichton','liquibase-update-to-latest.xml','2015-11-12 08:43:28',10295,'MARK_RAN','3:2db32da70ac1e319909d692110b8654b','Add Column','add retire_reason column to relationship_type table',NULL,'2.0.5'),('200910271049-1','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:27',10264,'EXECUTED','3:2e54d97b9f1b9f35b77cee691c23b7a9','Update Data (x5)','Setting core field types to have standard UUIDs',NULL,'2.0.5'),('200910271049-10','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:27',10273,'EXECUTED','3:827070940f217296c11ce332dc8858ff','Update Data (x4)','Setting core roles to have standard UUIDs',NULL,'2.0.5'),('200910271049-2','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:27',10265,'EXECUTED','3:3132d4cbfaab0c0b612c3fe1c55bd0f1','Update Data (x7)','Setting core person attribute types to have standard UUIDs',NULL,'2.0.5'),('200910271049-3','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:27',10266,'EXECUTED','3:f4d1a9004f91b6885a86419bc02f9d0b','Update Data (x4)','Setting core encounter types to have standard UUIDs',NULL,'2.0.5'),('200910271049-4','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:27',10267,'EXECUTED','3:0d4f7503bf8f00cb73338bb34305333a','Update Data (x12)','Setting core concept datatypes to have standard UUIDs',NULL,'2.0.5'),('200910271049-5','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:27',10268,'EXECUTED','3:98d8ac75977e1b099a4e45d96c6b1d1a','Update Data (x4)','Setting core relationship types to have standard UUIDs',NULL,'2.0.5'),('200910271049-6','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:27',10269,'EXECUTED','3:19355a03794869edad3889ac0adbdedf','Update Data (x15)','Setting core concept classes to have standard UUIDs',NULL,'2.0.5'),('200910271049-7','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:27',10270,'EXECUTED','3:fe4c89654d02d74de6d8e4b265a33288','Update Data (x2)','Setting core patient identifier types to have standard UUIDs',NULL,'2.0.5'),('200910271049-8','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:27',10271,'EXECUTED','3:dc4462b5b4b13c2bc306506848127556','Update Data','Setting core location to have standard UUIDs',NULL,'2.0.5'),('200910271049-9','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:27',10272,'EXECUTED','3:de2a0ed2adafb53f025039e9e8c6719e','Update Data','Setting core hl7 source to have standard UUIDs',NULL,'2.0.5'),('200912031842','djazayeri','liquibase-update-to-latest.xml','2015-11-12 08:43:27',10277,'EXECUTED','3:b966745213bedaeeabab8a874084bb95','Drop Foreign Key Constraint, Add Foreign Key Constraint','Changing encounter.provider_id to reference person instead of users',NULL,'2.0.5'),('200912031846-1','djazayeri','liquibase-update-to-latest.xml','2015-11-12 08:43:27',10279,'MARK_RAN','3:23e728a7f214127cb91efd40ebbcc2d1','Add Column, Update Data','Adding person_id column to users table (if needed)',NULL,'2.0.5'),('200912031846-2','djazayeri','liquibase-update-to-latest.xml','2015-11-12 08:43:27',10280,'MARK_RAN','3:8d57907defa7e92e018038d57cfa78b4','Update Data, Add Not-Null Constraint','Populating users.person_id',NULL,'2.0.5'),('200912031846-3','djazayeri','liquibase-update-to-latest.xml','2015-11-12 08:43:28',10281,'EXECUTED','3:48a50742f2904682caa1bc469f5b87e3','Add Foreign Key Constraint, Set Column as Auto-Increment','Restoring foreign key constraint on users.person_id',NULL,'2.0.5'),('200912071501-1','arthurs','liquibase-update-to-latest.xml','2015-11-12 08:43:27',10274,'EXECUTED','3:d1158b8a42127d7b8a4d5ad64cc7c225','Update Data','Change name for patient.searchMaxResults global property to person.searchMaxResults',NULL,'2.0.5'),('200912091819','djazayeri','liquibase-update-to-latest.xml','2015-11-12 08:43:28',10282,'MARK_RAN','3:8c0b2b02a94b9c6c9529e1b29207464b','Add Column, Add Foreign Key Constraint','Adding retired metadata columns to users table',NULL,'2.0.5'),('200912091819-fix','sunbiz','liquibase-update-to-latest.xml','2015-11-12 08:43:28',10283,'EXECUTED','3:fd5fd1d2e6884662824bb78c8348fadf','Modify Column','(Fixed)users.retired to BOOLEAN',NULL,'2.0.5'),('200912091820','djazayeri','liquibase-update-to-latest.xml','2015-11-12 08:43:28',10284,'MARK_RAN','3:cba73499d1c4d09b0e4ae3b55ecc7d84','Update Data','Migrating voided metadata to retired metadata for users table',NULL,'2.0.5'),('200912091821','djazayeri','liquibase-update-to-latest.xml','2011-09-15 00:00:00',10012,'MARK_RAN','3:9b38d31ebfe427d1f8d6e8530687f29c',NULL,NULL,NULL,NULL),('200912140038','djazayeri','liquibase-update-to-latest.xml','2015-11-12 08:43:28',10285,'MARK_RAN','3:be3aaa8da16b8a8841509faaeff070b4','Add Column','Adding \"uuid\" column to users table',NULL,'2.0.5'),('200912140039','djazayeri','liquibase-update-to-latest.xml','2015-11-12 08:43:28',10286,'EXECUTED','3:5b2a81ac1efba5495962bfb86e51546d','Update Data','Generating UUIDs for all rows in users table via built in uuid function.',NULL,'2.0.5'),('200912140040','djazayeri','liquibase-update-to-latest.xml','2015-11-12 08:43:28',10287,'MARK_RAN','3:c422b96e5b88eeae4f343d4f988cc4b2','Custom Change','Adding UUIDs to users table via a java class. (This will take a long time on large databases)',NULL,'2.0.5'),('200912141000-drug-add-date-changed','dkayiwa','liquibase-update-to-latest.xml','2015-11-12 08:43:38',10467,'MARK_RAN','3:9c9a75e3a78104e72de078ac217b0972','Add Column','Add date_changed column to drug table',NULL,'2.0.5'),('200912141001-drug-add-changed-by','dkayiwa','liquibase-update-to-latest.xml','2015-11-12 08:43:38',10468,'MARK_RAN','3:196629c722f52df68b5040e5266ac20f','Add Column, Add Foreign Key Constraint','Add changed_by column to drug table',NULL,'2.0.5'),('200912141552','madanmohan','liquibase-update-to-latest.xml','2015-11-12 08:43:27',10275,'MARK_RAN','3:835b6b98a7a437d959255ac666c12759','Add Column, Add Foreign Key Constraint','Add changed_by column to encounter table',NULL,'2.0.5'),('200912141553','madanmohan','liquibase-update-to-latest.xml','2015-11-12 08:43:27',10276,'MARK_RAN','3:7f768aa879beac091501ac9bb47ece4d','Add Column','Add date_changed column to encounter table',NULL,'2.0.5'),('20091215-0208','sunbiz','liquibase-update-to-latest.xml','2015-11-12 08:43:28',10296,'EXECUTED','3:1c818a60d8ebc36f4b7911051c1f6764','Custom SQL','Prune concepts rows orphaned in concept_numeric tables',NULL,'2.0.5'),('20091215-0209','jmiranda','liquibase-update-to-latest.xml','2015-11-12 08:43:28',10297,'EXECUTED','3:adeadc55e4dd484b1d63cf123e299371','Custom SQL','Prune concepts rows orphaned in concept_complex tables',NULL,'2.0.5'),('20091215-0210','jmiranda','liquibase-update-to-latest.xml','2011-09-15 00:00:00',10011,'MARK_RAN','3:08e8550629e4d5938494500f61d10961',NULL,NULL,NULL,NULL),('200912151032','n.nehete','liquibase-update-to-latest.xml','2015-11-12 08:43:28',10289,'EXECUTED','3:d7d8fededde8a27384ca1eb3f87f7914','Add Not-Null Constraint','Encounter Type should not be null when saving an Encounter',NULL,'2.0.5'),('200912211118','nribeka','liquibase-update-to-latest.xml','2011-09-15 00:00:00',10010,'MARK_RAN','3:1f976b4eedf537d887451246d49db043',NULL,NULL,NULL,NULL),('201001072007','upul','liquibase-update-to-latest.xml','2015-11-12 08:43:28',10290,'MARK_RAN','3:d5d60060fae8e9c30843b16b23bed9db','Add Column','Add last execution time column to scheduler_task_config table',NULL,'2.0.5'),('20100111-0111-associating-daemon-user-with-person','dkayiwa','liquibase-update-to-latest.xml','2015-11-12 08:43:37',10460,'MARK_RAN','3:bebb5c508bb53e7d5be6fb3aa259bd2f','Custom SQL','Associating daemon user with a person',NULL,'2.0.5'),('20100128-1','djazayeri','liquibase-update-to-latest.xml','2015-11-12 08:43:26',10251,'MARK_RAN','3:eaa1b8e62aa32654480e7a476dc14a4a','Insert Row','Adding \'System Developer\' role again (see ticket #1499)',NULL,'2.0.5'),('20100128-2','djazayeri','liquibase-update-to-latest.xml','2015-11-12 08:43:26',10252,'MARK_RAN','3:3c486c2ea731dfad7905518cac8d6e70','Update Data','Switching users back from \'Administrator\' to \'System Developer\' (see ticket #1499)',NULL,'2.0.5'),('20100128-3','djazayeri','liquibase-update-to-latest.xml','2015-11-12 08:43:26',10253,'MARK_RAN','3:9acf8cae5d210f88006191e79b76532c','Delete Data','Deleting \'Administrator\' role (see ticket #1499)',NULL,'2.0.5'),('20100306-095513a','thilini.hg','liquibase-update-to-latest.xml','2015-11-12 08:43:28',10298,'MARK_RAN','3:b7a60c3c33a05a71dde5a26f35d85851','Drop Foreign Key Constraint','Dropping unused foreign key from notification alert table',NULL,'2.0.5'),('20100306-095513b','thilini.hg','liquibase-update-to-latest.xml','2015-11-12 08:43:28',10299,'MARK_RAN','3:8a6ebb6aefe04b470d5b3878485f9cc3','Drop Column','Dropping unused user_id column from notification alert table',NULL,'2.0.5'),('20100322-0908','syhaas','liquibase-update-to-latest.xml','2015-11-12 08:43:28',10300,'MARK_RAN','3:94a8aae1d463754d7125cd546b4c590c','Add Column, Update Data','Adding sort_weight column to concept_answers table and initially sets the sort_weight to the concept_answer_id',NULL,'2.0.5'),('20100323-192043','ricardosbarbosa','liquibase-update-to-latest.xml','2015-11-12 08:43:29',10317,'EXECUTED','3:c294c84ac7ff884d1e618f4eb74b0c52','Update Data, Delete Data (x2)','Removing the duplicate privilege \'Add Concept Proposal\' in favor of \'Add Concept Proposals\'',NULL,'2.0.5'),('20100330-190413','ricardosbarbosa','liquibase-update-to-latest.xml','2015-11-12 08:43:29',10318,'EXECUTED','3:d706294defdfb73af9b44db7d37069d0','Update Data, Delete Data (x2)','Removing the duplicate privilege \'Edit Concept Proposal\' in favor of \'Edit Concept Proposals\'',NULL,'2.0.5'),('20100412-2217','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:29',10301,'MARK_RAN','3:0c3a3ea15adefa620ab62145f412d0b6','Add Column','Adding \"uuid\" column to notification_alert_recipient table',NULL,'2.0.5'),('20100412-2218','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:29',10302,'EXECUTED','3:6fae383b5548c214d2ad2c76346e32e3','Update Data','Generating UUIDs for all rows in notification_alert_recipient table via built in uuid function.',NULL,'2.0.5'),('20100412-2219','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:29',10303,'MARK_RAN','3:1401fe5f2d0c6bc23afa70b162e15346','Custom Change','Adding UUIDs to notification_alert_recipient table via a java class (if needed).',NULL,'2.0.5'),('20100412-2220','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:29',10304,'EXECUTED','3:bf4474dd5700b570e158ddc8250c470b','Add Not-Null Constraint','Now that UUID generation is done, set the notification_alert_recipient.uuid column to not \"NOT NULL\"',NULL,'2.0.5'),('20100413-1509','djazayeri','liquibase-update-to-latest.xml','2015-11-12 08:43:29',10305,'MARK_RAN','3:7a3ee61077e4dee1ceb4fe127afc835f','Rename Column','Change location_tag.tag to location_tag.name',NULL,'2.0.5'),('20100415-forgotten-from-before','djazayeri','liquibase-update-to-latest.xml','2015-11-12 08:43:28',10288,'EXECUTED','3:d17699fbec80bd035ecb348ae5382754','Add Not-Null Constraint','Adding not null constraint to users.uuid',NULL,'2.0.5'),('20100419-1209','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10383,'MARK_RAN','3:f87b773f9a8e05892fdbe8740042abb5','Create Table, Add Foreign Key Constraint (x7), Create Index','Create the visit table and add the foreign key for visit_type',NULL,'2.0.5'),('20100419-1209-fix','sunbiz','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10384,'EXECUTED','3:cb5970216f918522df3a059e29506c27','Modify Column','(Fixed)Changed visit.voided to BOOLEAN',NULL,'2.0.5'),('20100423-1402','slorenz','liquibase-update-to-latest.xml','2015-11-12 08:43:29',10307,'MARK_RAN','3:3534020f1c68f70b0e9851d47a4874d6','Create Index','Add an index to the encounter.encounter_datetime column to speed up statistical\n			analysis.',NULL,'2.0.5'),('20100423-1406','slorenz','liquibase-update-to-latest.xml','2015-11-12 08:43:29',10308,'MARK_RAN','3:f058162398862f0bdebc12d7eb54551b','Create Index','Add an index to the obs.obs_datetime column to speed up statistical analysis.',NULL,'2.0.5'),('20100426-1111-add-not-null-personid-contraint','dkayiwa','liquibase-update-to-latest.xml','2015-11-12 08:43:37',10461,'EXECUTED','3:a0b90b98be85aabbdebd957744ab805a','Add Not-Null Constraint','Add the not null person id contraint',NULL,'2.0.5'),('20100426-1111-remove-not-null-personid-contraint','dkayiwa','liquibase-update-to-latest.xml','2015-11-12 08:43:29',10309,'EXECUTED','3:5bc2abe108ab2765e36294ff465c63a0','Drop Not-Null Constraint','Drop the not null person id contraint',NULL,'2.0.5'),('20100426-1947','syhaas','liquibase-update-to-latest.xml','2015-11-12 08:43:29',10310,'MARK_RAN','3:09adbdc9cb72dee82e67080b01d6578e','Insert Row','Adding daemon user to users table',NULL,'2.0.5'),('20100512-1400','djazayeri','liquibase-update-to-latest.xml','2015-11-12 08:43:29',10312,'MARK_RAN','3:0fbfb53e2e194543d7b3eaa59834e1e6','Insert Row','Create core order_type for drug orders',NULL,'2.0.5'),('20100513-1947','syhaas','liquibase-update-to-latest.xml','2015-11-12 08:43:29',10311,'EXECUTED','3:068c2bd55d9c731941fe9ef66f0011fb','Delete Data (x2)','Removing scheduler.username and scheduler.password global properties',NULL,'2.0.5'),('20100517-1545','wyclif and djazayeri','liquibase-update-to-latest.xml','2015-11-12 08:43:29',10313,'EXECUTED','3:39a68e6b1954a0954d0f8d0c660a7aff','Custom Change','Switch boolean concepts/observations to be stored as coded',NULL,'2.0.5'),('20100525-818-1','syhaas','liquibase-update-to-latest.xml','2015-11-12 08:43:29',10319,'MARK_RAN','3:ed9dcb5bd0d7312db3123825f9bb4347','Create Table, Add Foreign Key Constraint (x2)','Create active list type table.',NULL,'2.0.5'),('20100525-818-1-fix','sunbiz','liquibase-update-to-latest.xml','2015-11-12 08:43:29',10320,'EXECUTED','3:4a648a54797fef2222764a7ee0b5e05a','Modify Column','(Fixed)Change active_list_type.retired to BOOLEAN',NULL,'2.0.5'),('20100525-818-2','syhaas','liquibase-update-to-latest.xml','2015-11-12 08:43:29',10321,'MARK_RAN','3:bc5a86f0245f6f822a0d343b2fcf8dc6','Create Table, Add Foreign Key Constraint (x7)','Create active list table',NULL,'2.0.5'),('20100525-818-2-fix','sunbiz','liquibase-update-to-latest.xml','2015-11-12 08:43:29',10322,'EXECUTED','3:0a2879b368319f6d1e16d0d4417f4492','Modify Column','(Fixed)Change active_list_type.retired to BOOLEAN',NULL,'2.0.5'),('20100525-818-3','syhaas','liquibase-update-to-latest.xml','2015-11-12 08:43:29',10323,'MARK_RAN','3:d382e7b9e23cdcc33ccde2d3f0473c41','Create Table, Add Foreign Key Constraint','Create allergen table',NULL,'2.0.5'),('20100525-818-4','syhaas','liquibase-update-to-latest.xml','2015-11-12 08:43:29',10324,'MARK_RAN','3:1d6f1abd297c8da5a49d4885d0d34dfb','Create Table','Create problem table',NULL,'2.0.5'),('20100525-818-5','syhaas','liquibase-update-to-latest.xml','2015-11-12 08:43:29',10325,'MARK_RAN','3:2ac51b2e8813d61428367bad9fadaa33','Insert Row (x2)','Inserting default active list types',NULL,'2.0.5'),('20100526-1025','Harsha.cse','liquibase-update-to-latest.xml','2015-11-12 08:43:29',10314,'EXECUTED','3:66ec6553564d30fd63df7c2de41c674f','Drop Not-Null Constraint (x2)','Drop Not-Null constraint from location column in Encounter and Obs table',NULL,'2.0.5'),('20100603-1625-1-person_address','sapna','liquibase-update-to-latest.xml','2015-11-12 08:43:33',10364,'MARK_RAN','3:6048aa2c393c1349de55a5003199fb81','Add Column','Adding \"date_changed\" column to person_address table',NULL,'2.0.5'),('20100603-1625-2-person_address','sapna','liquibase-update-to-latest.xml','2015-11-12 08:43:33',10365,'MARK_RAN','3:5194e3b45b70b003e33d7ab0495f3015','Add Column, Add Foreign Key Constraint','Adding \"changed_by\" column to person_address table',NULL,'2.0.5'),('20100604-0933a','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:29',10315,'EXECUTED','3:9b51b236846a8940de581e199cd76cb2','Add Default Value','Changing the default value to 2 for \'message_state\' column in \'hl7_in_archive\' table',NULL,'2.0.5'),('20100604-0933b','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:29',10316,'EXECUTED','3:67fc4c12418b500aaf3723e8845429e3','Update Data','Converting 0 and 1 to 2 for \'message_state\' column in \'hl7_in_archive\' table',NULL,'2.0.5'),('20100607-1550a','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:29',10326,'MARK_RAN','3:bfb6250277efd8c81326fe8c3dbdfe35','Add Column','Adding \'concept_name_type\' column to concept_name table',NULL,'2.0.5'),('20100607-1550b','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:29',10327,'MARK_RAN','3:3d43124d8265fbf05f1ef4839f14bece','Add Column','Adding \'locale_preferred\' column to concept_name table',NULL,'2.0.5'),('20100607-1550b-fix','sunbiz','liquibase-update-to-latest.xml','2015-11-12 08:43:30',10328,'EXECUTED','3:d0dc8dfe3ac629aecee81ccc11dec9c2','Modify Column','(Fixed)Change concept_name.locale_preferred to BOOLEAN',NULL,'2.0.5'),('20100607-1550c','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:30',10329,'EXECUTED','3:b6573617d37609ae7195fd7a495e2776','Drop Foreign Key Constraint','Dropping foreign key constraint on concept_name_tag_map.concept_name_tag_id',NULL,'2.0.5'),('20100607-1550d','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:30',10330,'EXECUTED','3:f30fd17874ac8294389ee2a44ca7d6ab','Update Data, Delete Data (x2)','Setting the concept name type for short names',NULL,'2.0.5'),('20100607-1550f','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:30',10331,'EXECUTED','3:6a72bbb390155596e52da4e8d065d1a2','Update Data, Delete Data (x2)','Converting concept names with preferred concept name tags to preferred and fully specified names',NULL,'2.0.5'),('20100607-1550g','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:30',10332,'EXECUTED','3:c3c0a17e0a21d36f38bb2af8f0939da7','Delete Data (x2)','Deleting \'default\' and \'synonym\' concept name tags',NULL,'2.0.5'),('20100607-1550h','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:30',10333,'EXECUTED','3:be7b967ed0e7006373bb616b63726144','Custom Change','Validating and attempting to fix invalid concepts and ConceptNames',NULL,'2.0.5'),('20100607-1550i','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:30',10334,'EXECUTED','3:b6260c13bf055f7917c155596502a24b','Add Foreign Key Constraint','Restoring foreign key constraint on concept_name_tag_map.concept_name_tag_id',NULL,'2.0.5'),('20100621-1443','jkeiper','liquibase-update-to-latest.xml','2015-11-12 08:43:30',10335,'EXECUTED','3:16b4bc3512029cf8d3b3c6bee86ed712','Modify Column','Modify the error_details column of hl7_in_error to hold\n			stacktraces',NULL,'2.0.5'),('201008021047','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:31',10336,'MARK_RAN','3:8612ede2553aab53950fa43d2f8def32','Create Index','Add an index to the person_name.family_name2 to speed up patient and person searches',NULL,'2.0.5'),('201008201345','mseaton','liquibase-update-to-latest.xml','2015-11-12 08:43:31',10337,'EXECUTED','3:5fbbb6215e66847c86483ee7177c3682','Custom Change','Validates Program Workflow States for possible configuration problems and reports warnings',NULL,'2.0.5'),('201008242121','misha680','liquibase-update-to-latest.xml','2015-11-12 08:43:31',10338,'EXECUTED','3:2319aed08c4f6dcd43d4ace5cdf94650','Modify Column','Make person_name.person_id not NULLable',NULL,'2.0.5'),('20100924-1110','mseaton','liquibase-update-to-latest.xml','2015-11-12 08:43:31',10339,'MARK_RAN','3:05ea5f3b806ba47f4a749d3a348c59f7','Add Column, Add Foreign Key Constraint','Add location_id column to patient_program table',NULL,'2.0.5'),('201009281047','misha680','liquibase-update-to-latest.xml','2015-11-12 08:43:31',10340,'MARK_RAN','3:02b5b9a183729968cd4189798ca034bd','Drop Column','Remove the now unused default_charge column',NULL,'2.0.5'),('201010051745','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:31',10341,'EXECUTED','3:04ba6f526a71fc0a2b016fd77eaf9ff5','Update Data','Setting the global property \'patient.identifierRegex\' to an empty string',NULL,'2.0.5'),('201010051746','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:31',10342,'EXECUTED','3:cb12dfc563d82529de170ffedf948f90','Update Data','Setting the global property \'patient.identifierSuffix\' to an empty string',NULL,'2.0.5'),('201010151054','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:31',10343,'MARK_RAN','3:26c8ae0c53225f82d4c2a85c09ad9785','Create Index','Adding index to form.published column',NULL,'2.0.5'),('201010151055','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:32',10344,'MARK_RAN','3:1efabdfd082ff2b0a34f570831f74ce5','Create Index','Adding index to form.retired column',NULL,'2.0.5'),('201010151056','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:32',10345,'MARK_RAN','3:00273104184bb4d2bb7155befc77efc3','Create Index','Adding multi column index on form.published and form.retired columns',NULL,'2.0.5'),('201010261143','crecabarren','liquibase-update-to-latest.xml','2015-11-12 08:43:32',10346,'MARK_RAN','3:c02de7e2726893f80ecd1f3ae778cba5','Rename Column','Rename neighborhood_cell column to address3 and increase the size to 255 characters',NULL,'2.0.5'),('201010261145','crecabarren','liquibase-update-to-latest.xml','2015-11-12 08:43:32',10347,'MARK_RAN','3:2d053c2e9b604403df8a408a6bb4f3f8','Rename Column','Rename township_division column to address4 and increase the size to 255 characters',NULL,'2.0.5'),('201010261147','crecabarren','liquibase-update-to-latest.xml','2015-11-12 08:43:32',10348,'MARK_RAN','3:592eee2241fdb1039ba08be07b54a422','Rename Column','Rename subregion column to address5 and increase the size to 255 characters',NULL,'2.0.5'),('201010261149','crecabarren','liquibase-update-to-latest.xml','2015-11-12 08:43:32',10349,'MARK_RAN','3:059e5bf4092d930304f9f0fc305939d9','Rename Column','Rename region column to address6 and increase the size to 255 characters',NULL,'2.0.5'),('201010261151','crecabarren','liquibase-update-to-latest.xml','2015-11-12 08:43:32',10350,'MARK_RAN','3:8756b20f505f8981a43ece7233ce3e2f','Rename Column','Rename neighborhood_cell column to address3 and increase the size to 255 characters',NULL,'2.0.5'),('201010261153','crecabarren','liquibase-update-to-latest.xml','2015-11-12 08:43:32',10351,'MARK_RAN','3:9805b9a214fca5a3509a82864274678e','Rename Column','Rename township_division column to address4 and increase the size to 255 characters',NULL,'2.0.5'),('201010261156','crecabarren','liquibase-update-to-latest.xml','2015-11-12 08:43:32',10352,'MARK_RAN','3:894f4e47fbdc74be94e6ebc9d6fce91e','Rename Column','Rename subregion column to address5 and increase the size to 255 characters',NULL,'2.0.5'),('201010261159','crecabarren','liquibase-update-to-latest.xml','2015-11-12 08:43:32',10353,'MARK_RAN','3:b1827790c63813e6a73d83e2b2d36504','Rename Column','Rename region column to address6 and increase the size to 255 characters',NULL,'2.0.5'),('20101029-1016','gobi/prasann','liquibase-update-to-latest.xml','2015-11-12 08:43:33',10366,'MARK_RAN','3:714ad65f5d84bdcd4d944a4d5583e4d3','Create Table, Add Unique Constraint','Create table to store concept stop words to avoid in search key indexing',NULL,'2.0.5'),('20101029-1026','gobi/prasann','liquibase-update-to-latest.xml','2015-11-12 08:43:33',10367,'MARK_RAN','3:83534d43a9a9cc1ea3a80f1d5f5570af','Insert Row (x10)','Inserting the initial concept stop words',NULL,'2.0.5'),('201011011600','jkeiper','liquibase-update-to-latest.xml','2015-11-12 08:43:32',10355,'MARK_RAN','3:29b35d66dc4168e03e1844296e309327','Create Index','Adding index to message_state column in HL7 archive table',NULL,'2.0.5'),('201011011605','jkeiper','liquibase-update-to-latest.xml','2015-11-12 08:43:33',10356,'EXECUTED','3:c604bc0967765f50145f76e80a4bbc99','Custom Change','Moving \"deleted\" HL7s from HL7 archive table to queue table',NULL,'2.0.5'),('201011051300','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:33',10363,'MARK_RAN','3:fea4ad8ce44911eeaab8ac8c1cc9122d','Create Index','Adding index on notification_alert.date_to_expire column',NULL,'2.0.5'),('201012081716','nribeka','liquibase-update-to-latest.xml','2015-11-12 08:43:33',10361,'MARK_RAN','3:4a97a93f2632fc0c3b088b24535ee481','Delete Data','Removing concept that are concept derived and the datatype',NULL,'2.0.5'),('201012081717','nribeka','liquibase-update-to-latest.xml','2015-11-12 08:43:33',10362,'MARK_RAN','3:ad3d0a18bda7e4869d264c70b8cd8d1d','Drop Table','Removing concept derived tables',NULL,'2.0.5'),('20101209-10000-encounter-add-visit-id-column','dkayiwa','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10385,'MARK_RAN','3:7045a94731ef25e04724c77fc97494b4','Add Column, Add Foreign Key Constraint','Adding visit_id column to encounter table',NULL,'2.0.5'),('20101209-1353','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:49:24',10883,'EXECUTED','3:9d30d1435a6c10a4b135609dc8e925ca','Add Not-Null Constraint','Adding not-null constraint to orders.as_needed',NULL,'2.0.5'),('20101209-1721','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:33',10357,'MARK_RAN','3:351460e0f822555b77acff1a89bec267','Add Column','Add \'weight\' column to concept_word table',NULL,'2.0.5'),('20101209-1722','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:33',10358,'MARK_RAN','3:d63107017bdcef0e28d7ad5e4df21ae5','Create Index','Adding index to concept_word.weight column',NULL,'2.0.5'),('20101209-1723','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:33',10359,'MARK_RAN','3:25d45d7d5bbff4b24bcc8ff8d34d70d2','Insert Row','Insert a row into the schedule_task_config table for the ConceptIndexUpdateTask',NULL,'2.0.5'),('20101209-1731','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:33',10360,'MARK_RAN','3:6de3e859f77856fe939d3ae6a73b4752','Update Data','Setting the value of \'start_on_startup\' to trigger off conceptIndexUpdateTask on startup',NULL,'2.0.5'),('201012092009','djazayeri','liquibase-update-to-latest.xml','2015-11-12 08:43:32',10354,'EXECUTED','3:15a029c4ffe65710a56d402e608d319a','Modify Column (x10)','Increasing length of address fields in person_address and location to 255',NULL,'2.0.5'),('2011-07-12-1947-add-outcomesConcept-to-program','grwarren','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10396,'MARK_RAN','3:ea2bb0a2ddeade662f956ef113d020ab','Add Column, Add Foreign Key Constraint','Adding the outcomesConcept property to Program',NULL,'2.0.5'),('2011-07-12-2005-add-outcome-to-patientprogram','grwarren','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10397,'MARK_RAN','3:57baf47f9b09b3df649742d69be32015','Add Column, Add Foreign Key Constraint','Adding the outcome property to PatientProgram',NULL,'2.0.5'),('201101121434','gbalaji,gobi','liquibase-update-to-latest.xml','2015-11-12 08:43:33',10376,'MARK_RAN','3:96320c51e6e296e9dc65866a61268e45','Drop Column','Dropping unused date_started column from obs table',NULL,'2.0.5'),('201101221453','suho','liquibase-update-to-latest.xml','2015-11-12 08:43:33',10375,'EXECUTED','3:4088d4906026cc1430fa98e04d294b13','Modify Column','Increasing the serialized_data column of serialized_object to hold mediumtext',NULL,'2.0.5'),('20110124-1030','surangak','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10378,'MARK_RAN','3:e17eee5b8c4bb236a0ea6e6ade5abed7','Add Foreign Key Constraint','Adding correct foreign key for concept_answer.answer_drug',NULL,'2.0.5'),('20110125-1435','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:33',10369,'MARK_RAN','3:dadd9da1dad5f2863f8f6bb24b29d598','Add Column','Adding \'start_date\' column to person_address table',NULL,'2.0.5'),('20110125-1436','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:33',10370,'MARK_RAN','3:68cec89409d2419fe9439f4753a23036','Add Column','Adding \'end_date\' column to person_address table',NULL,'2.0.5'),('201101271456-add-enddate-to-relationship','misha680','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10387,'MARK_RAN','3:b593b864d4a870e3b7ba6b61fda57c8d','Add Column','Adding the end_date column to relationship.',NULL,'2.0.5'),('201101271456-add-startdate-to-relationship','misha680','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10386,'MARK_RAN','3:82020a9f33747f58274196619439781e','Add Column','Adding the start_date column to relationship.',NULL,'2.0.5'),('20110201-1625-1','arahulkmit','liquibase-update-to-latest.xml','2015-11-12 08:43:33',10371,'MARK_RAN','3:4f1b23efba67de1917e312942fe7e744','Add Column','Adding \"date_changed\" column to patient_identifier table',NULL,'2.0.5'),('20110201-1625-2','arahulkmit','liquibase-update-to-latest.xml','2015-11-12 08:43:33',10372,'MARK_RAN','3:01467a1db56ef3db87dc537d40ab22eb','Add Column, Add Foreign Key Constraint','Adding \"changed_by\" column to patient_identifier table',NULL,'2.0.5'),('20110201-1626-1','arahulkmit','liquibase-update-to-latest.xml','2015-11-12 08:43:33',10373,'MARK_RAN','3:63397ce933d1c78309648425fba66a17','Add Column','Adding \"date_changed\" column to relationship table',NULL,'2.0.5'),('20110201-1626-2','arahulkmit','liquibase-update-to-latest.xml','2015-11-12 08:43:33',10374,'MARK_RAN','3:21dae026e42d05b2ebc8fe51408c147f','Add Column, Add Foreign Key Constraint','Adding \"changed_by\" column to relationship table',NULL,'2.0.5'),('201102081800','gbalaji,gobi','liquibase-update-to-latest.xml','2015-11-12 08:43:33',10377,'MARK_RAN','3:779ca58f39b4e3a14a313f8fc416c242','Drop Column','Dropping unused date_stopped column from obs table',NULL,'2.0.5'),('20110218-1206','rubailly','liquibase-update-to-latest.xml','2011-09-15 00:00:00',10013,'MARK_RAN','3:8be61726cd3fed87215557efd284434f',NULL,NULL,NULL,NULL),('20110218-1210','rubailly','liquibase-update-to-latest.xml','2011-09-15 00:00:00',10013,'MARK_RAN','3:4f8818ba08f3a9ce2e2ededfdf5b6fcd',NULL,NULL,NULL,NULL),('201102280948','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:27',10278,'EXECUTED','3:98e1075808582c97377651d02faf8f46','Drop Foreign Key Constraint','Removing the foreign key from users.user_id to person.person_id if it still exists',NULL,'2.0.5'),('20110301-1030a','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10411,'MARK_RAN','3:5256e8010fb4c375e2a1ef502176cc2f','Rename Table','Renaming the concept_source table to concept_reference_source',NULL,'2.0.5'),('20110301-1030b','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10412,'MARK_RAN','3:6fc5f514cd9c2ee14481a7f0b10a0c7c','Create Table, Add Foreign Key Constraint (x4)','Adding concept_reference_term table',NULL,'2.0.5'),('20110301-1030b-fix','sunbiz','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10413,'EXECUTED','3:3cf3ba141e6571b900e695b49b6c48a9','Modify Column','(Fixed)Change concept_reference_term.retired to BOOLEAN',NULL,'2.0.5'),('20110301-1030c','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10414,'MARK_RAN','3:d8407baf728a1db5ad5db7c138cb59cb','Create Table, Add Foreign Key Constraint (x3)','Adding concept_map_type table',NULL,'2.0.5'),('20110301-1030c-fix','sunbiz','liquibase-update-to-latest.xml','2011-09-19 00:00:00',10014,'MARK_RAN','3:c02f2825633f1a43fc9303ac21ba2c02',NULL,NULL,NULL,NULL),('20110301-1030d','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10415,'MARK_RAN','3:222ef47c65625a17c268a8f68edaa16e','Rename Table','Renaming the concept_map table to concept_reference_map',NULL,'2.0.5'),('20110301-1030e','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10416,'MARK_RAN','3:50be921cf53ce4a357afc0bac8928495','Add Column','Adding concept_reference_term_id column to concept_reference_map table',NULL,'2.0.5'),('20110301-1030f','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10417,'MARK_RAN','3:5faead5506cbcde69490fef985711d66','Custom Change','Inserting core concept map types',NULL,'2.0.5'),('20110301-1030g','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10418,'MARK_RAN','3:affc4d2a4e3143046cfb75b583c7399a','Add Column, Add Foreign Key Constraint','Adding concept_map_type_id column and a foreign key constraint to concept_reference_map table',NULL,'2.0.5'),('20110301-1030h','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10419,'MARK_RAN','3:4bf584dc7b25a180cc82edb56e1b0e5b','Add Column, Add Foreign Key Constraint','Adding changed_by column and a foreign key constraint to concept_reference_map table',NULL,'2.0.5'),('20110301-1030i','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10420,'MARK_RAN','3:f4d0468db79007d0355f6f461603b2f7','Add Column','Adding date_changed column and a foreign key constraint to concept_reference_map table',NULL,'2.0.5'),('20110301-1030j','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10421,'MARK_RAN','3:a7dc8b89e37fe36263072b43670d7f11','Create Table, Add Foreign Key Constraint (x5)','Adding concept_reference_term_map table',NULL,'2.0.5'),('20110301-1030m','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10422,'MARK_RAN','3:b286407bfcdf3853512cb15009c816f1','Custom Change','Creating concept reference terms from existing rows in the concept_reference_map table',NULL,'2.0.5'),('20110301-1030n','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:35',10423,'MARK_RAN','3:01868c1383e5c9c409282b50e67e878c','Add Foreign Key Constraint','Adding foreign key constraint to concept_reference_map.concept_reference_term_id column',NULL,'2.0.5'),('20110301-1030o','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:35',10424,'MARK_RAN','3:eea9343959864edea569d5a2a2358469','Drop Foreign Key Constraint','Dropping foreign key constraint on concept_reference_map.source column',NULL,'2.0.5'),('20110301-1030p','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:35',10425,'MARK_RAN','3:01bf8c07a05f22df2286a4ee27a7acb4','Drop Column','Dropping concept_reference_map.source column',NULL,'2.0.5'),('20110301-1030q','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:35',10426,'MARK_RAN','3:f45caaf1c7daa7f2cb036f46a20aa4b1','Drop Column','Dropping concept_reference_map.source_code column',NULL,'2.0.5'),('20110301-1030r','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:35',10427,'MARK_RAN','3:23fd6bc96ee0a497cf330ed24ec0075b','Drop Column','Dropping concept_reference_map.comment column',NULL,'2.0.5'),('201103011751','abbas','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10379,'EXECUTED','3:4857dcbefa75784da912bca5caba21b5','Create Table, Add Foreign Key Constraint (x3)','Create the person_merge_log table',NULL,'2.0.5'),('20110326-1','Knoll_Frank','liquibase-update-to-latest.xml','2015-11-12 08:43:37',10454,'EXECUTED','3:3376a34edf88bf2868fd75ba2fb0f6c3','Add Column, Add Foreign Key Constraint','Add obs.previous_version column (TRUNK-420)',NULL,'2.0.5'),('20110326-2','Knoll_Frank','liquibase-update-to-latest.xml','2015-11-12 08:43:37',10457,'EXECUTED','3:7c068bfe918b9d87fefa9f8508e92f58','Custom SQL','Fix all the old void_reason content and add in the new previous_version to the matching obs row (POTENTIALLY VERY SLOW FOR LARGE OBS TABLES)',NULL,'2.0.5'),('20110329-2317','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10380,'EXECUTED','3:371be45e2a3616ce17b6f50862ca196d','Delete Data','Removing \'View Encounters\' privilege from Anonymous user',NULL,'2.0.5'),('20110329-2318','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10381,'EXECUTED','3:eb2ece117d8508e843d11eeed7676b21','Delete Data','Removing \'View Observations\' privilege from Anonymous user',NULL,'2.0.5'),('20110425-1600-create-visit-attribute-type-table','djazayeri','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10388,'MARK_RAN','3:3cf419ea9657f9a072881cafb2543d77','Create Table, Add Foreign Key Constraint (x3)','Creating visit_attribute_type table',NULL,'2.0.5'),('20110425-1600-create-visit-attribute-type-table-fix','sunbiz','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10389,'EXECUTED','3:e4b62b99750c9ee4c213a7bc3101f8a6','Modify Column','(Fixed)Change visit_attribute_type.retired to BOOLEAN',NULL,'2.0.5'),('20110425-1700-create-visit-attribute-table','djazayeri','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10391,'MARK_RAN','3:24e1e30a41f9f5d92f337444fb45402a','Create Table, Add Foreign Key Constraint (x5)','Creating visit_attribute table',NULL,'2.0.5'),('20110425-1700-create-visit-attribute-table-fix','sunbiz','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10392,'EXECUTED','3:8ab9102da66058c326c0a5089de053e8','Modify Column','(Fixed)Change visit_attribute.voided to BOOLEAN',NULL,'2.0.5'),('20110426-11701','zabil','liquibase-update-to-latest.xml','2015-11-12 08:43:36',10433,'MARK_RAN','3:56caae006a3af14242e2ea57627004c7','Create Table, Add Foreign Key Constraint (x4)','Create provider table',NULL,'2.0.5'),('20110426-11701-create-provider-table','dkayiwa','liquibase-schema-only.xml','2015-11-12 08:42:29',87,'EXECUTED','3:56caae006a3af14242e2ea57627004c7','Create Table, Add Foreign Key Constraint (x4)','Create provider table',NULL,'2.0.5'),('20110426-11701-fix','sunbiz','liquibase-update-to-latest.xml','2015-11-12 08:43:36',10434,'EXECUTED','3:f222ec7d41ce0255c667fd79b70bffd2','Modify Column','(Fixed)Change provider.retired to BOOLEAN',NULL,'2.0.5'),('20110510-11702-create-provider-attribute-type-table','zabil','liquibase-update-to-latest.xml','2015-11-12 08:43:36',10435,'EXECUTED','3:7478ac84804d46a4f2b3daa63efe99be','Create Table, Add Foreign Key Constraint (x3)','Creating provider_attribute_type table',NULL,'2.0.5'),('20110510-11702-create-provider-attribute-type-table-fix','sunbiz','liquibase-update-to-latest.xml','2015-11-12 08:43:36',10436,'EXECUTED','3:479636c7572a649889527f670eaff533','Modify Column','(Fixed)Change provider_attribute_type.retired to BOOLEAN',NULL,'2.0.5'),('20110628-1400-create-provider-attribute-table','kishoreyekkanti','liquibase-update-to-latest.xml','2015-11-12 08:43:36',10438,'EXECUTED','3:298aaacafd48547be294f4c9b7c40d35','Create Table, Add Foreign Key Constraint (x5)','Creating provider_attribute table',NULL,'2.0.5'),('20110628-1400-create-provider-attribute-table-fix','sunbiz','liquibase-update-to-latest.xml','2015-11-12 08:43:36',10439,'EXECUTED','3:14d85967e968d0bcd7a49ddeb6f3e540','Modify Column','(Fixed)Change provider_attribute.voided to BOOLEAN',NULL,'2.0.5'),('20110705-2300-create-encounter-role-table','kishoreyekkanti','liquibase-update-to-latest.xml','2015-11-12 08:43:36',10440,'MARK_RAN','3:a381ef81f10e4f7443b4d4c8d6231de8','Create Table, Add Foreign Key Constraint (x3)','Creating encounter_role table',NULL,'2.0.5'),('20110705-2300-create-encounter-role-table-fix','sunbiz','liquibase-update-to-latest.xml','2015-11-12 08:43:36',10441,'EXECUTED','3:bed2af9d6c3d49eacbdaf2174e682671','Modify Column','(Fixed)Change encounter_role.retired to BOOLEAN',NULL,'2.0.5'),('20110705-2311-create-encounter-role-table','dkayiwa','liquibase-schema-only.xml','2015-11-12 08:42:29',88,'EXECUTED','3:a381ef81f10e4f7443b4d4c8d6231de8','Create Table, Add Foreign Key Constraint (x3)','Creating encounter_role table',NULL,'2.0.5'),('20110708-2105','cta','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10395,'MARK_RAN','3:a20e9bb27a1aca73a646ad81ef2b9deb','Add Unique Constraint','Add unique constraint to the concept_source table',NULL,'2.0.5'),('201107192313-change-length-of-regex-column','jtellez','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10393,'EXECUTED','3:db001544cc0f5a1ff42524a9292b028b','Modify Column','Increasing maximum length of patient identifier type regex format',NULL,'2.0.5'),('20110811-1205-create-encounter-provider-table','sree/vishnu','liquibase-update-to-latest.xml','2015-11-12 08:43:37',10442,'EXECUTED','3:e20ca5412e37df98c58a39552aafb5ad','Create Table, Add Foreign Key Constraint (x3)','Creating encounter_provider table',NULL,'2.0.5'),('20110811-1205-create-encounter-provider-table-fix','sunbiz','liquibase-update-to-latest.xml','2015-11-12 08:43:37',10443,'EXECUTED','3:8decefa15168e68297f5f2782991c552','Modify Column','(Fixed)Change encounter_provider.voided to BOOLEAN',NULL,'2.0.5'),('20110817-1544-create-location-attribute-type-table','djazayeri','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10398,'MARK_RAN','3:41fa30c01ec2d1107beccb8126146464','Create Table, Add Foreign Key Constraint (x3)','Creating location_attribute_type table',NULL,'2.0.5'),('20110817-1544-create-location-attribute-type-table-fix','sunbiz','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10399,'EXECUTED','3:53aff6217c6a9a8f1ca414703b1a8720','Modify Column','(Fixed)Change visit_attribute.retired to BOOLEAN',NULL,'2.0.5'),('20110817-1601-create-location-attribute-table','djazayeri','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10401,'MARK_RAN','3:c7cb1b35d68451d10badeb445df599b9','Create Table, Add Foreign Key Constraint (x5)','Creating location_attribute table',NULL,'2.0.5'),('20110817-1601-create-location-attribute-table-fix','sunbiz','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10402,'EXECUTED','3:2450e230f3eda291203485bca6904377','Modify Column','(Fixed)Change visit_attribute.retired to BOOLEAN',NULL,'2.0.5'),('20110819-1455-insert-unknown-encounter-role','raff','liquibase-update-to-latest.xml','2015-11-12 08:43:37',10444,'EXECUTED','3:bfe0b994a3c0a62d0d4c8f7d941991c7','Insert Row','Inserting the unknown encounter role into the encounter_role table',NULL,'2.0.5'),('20110825-1000-creating-providers-for-persons-from-encounter','raff','liquibase-update-to-latest.xml','2015-11-12 08:43:37',10445,'EXECUTED','3:04bc8aa9859f6f8dda065e272ba12e0d','Custom SQL','Creating providers for persons from the encounter table',NULL,'2.0.5'),('20110825-1000-drop-provider-id-column-from-encounter-table','raff','liquibase-update-to-latest.xml','2015-11-12 08:43:37',10447,'EXECUTED','3:2137e4b5198aa5f12059ee0e8837fb04','Drop Foreign Key Constraint, Drop Column','Dropping the provider_id column from the encounter table',NULL,'2.0.5'),('20110825-1000-migrating-providers-to-encounter-provider','raff','liquibase-update-to-latest.xml','2015-11-12 08:43:37',10446,'EXECUTED','3:e7c39080453e862d5a4013c48c9225fc','Custom SQL','Migrating providers from the encounter table to the encounter_provider table',NULL,'2.0.5'),('2011091-0749','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:30',125,'EXECUTED','3:3534020f1c68f70b0e9851d47a4874d6','Create Index','',NULL,'2.0.5'),('2011091-0750','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:30',126,'EXECUTED','3:f058162398862f0bdebc12d7eb54551b','Create Index','',NULL,'2.0.5'),('20110913-0300','sunbiz','liquibase-update-to-latest.xml','2015-11-12 08:43:36',10428,'MARK_RAN','3:7ad8f362e4cc6df6e37135cc37546d0d','Drop Foreign Key Constraint, Add Foreign Key Constraint','Remove ON DELETE CASCADE from relationship table for person_a',NULL,'2.0.5'),('20110913-0300b','sunbiz','liquibase-update-to-latest.xml','2015-11-12 08:43:36',10429,'MARK_RAN','3:2486028ce670bdea2a5ced509a335170','Drop Foreign Key Constraint, Add Foreign Key Constraint','Remove ON DELETE CASCADE from relationship table for person_b',NULL,'2.0.5'),('20110914-0104','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:36',317,'EXECUTED','3:b1811e5e43321192b275d6e2fe2fa564','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110914-0114','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:28',69,'EXECUTED','3:dac2ff60a4f99315d68948e9582af011','Create Table','',NULL,'2.0.5'),('20110914-0117','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:36',318,'EXECUTED','3:5b7f746286a955da60c9fec8d663a0e3','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110914-0245','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:36',319,'EXECUTED','3:48cdf2b28fcad687072ac8133e46cba6','Add Unique Constraint','',NULL,'2.0.5'),('20110914-0306','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:28',70,'EXECUTED','3:037f98fda886cde764171990d168e97d','Create Table','',NULL,'2.0.5'),('20110914-0308','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:36',320,'EXECUTED','3:6309ad633777b0faf1d9fa394699a789','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110914-0310','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:36',321,'EXECUTED','3:8c53c44af44d75aadf6cedfc9d13ded1','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110914-0312','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:28',71,'EXECUTED','3:2a39901427c9e7b84c8578ff7b3099bb','Create Table','',NULL,'2.0.5'),('20110914-0314','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:36',322,'EXECUTED','3:9cbe2e14482f88864f94d5e630a88b62','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110914-0315','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:37',323,'EXECUTED','3:18cd917d56887ad924dad367470a8461','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110914-0317','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:29',98,'EXECUTED','3:cffbf258ca090d095401957df4168175','Add Primary Key','',NULL,'2.0.5'),('20110914-0321','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:37',324,'EXECUTED','3:67723ac8a4583366b78c9edc413f89eb','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110914-0434','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:37',326,'EXECUTED','3:081831e316a82683102f298a91116e92','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110914-0435','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:37',327,'EXECUTED','3:03fa6c6a37a61480c95d5b75e30d4846','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110914-0448','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:28',72,'EXECUTED','3:ffa1ef2b17d77f87dccbdea0c51249de','Create Table','',NULL,'2.0.5'),('20110914-0453','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:37',325,'EXECUTED','3:ea43c7690888a7fd47aa7ba39f8006e2','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110914-0509','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:30',122,'EXECUTED','3:d29884c3ef8fd867c3c2ffbd557c14c2','Create Index','',NULL,'2.0.5'),('20110914-0943','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:30',123,'EXECUTED','3:c48f2441d83f121db30399d9cd5f7f8b','Create Index','',NULL,'2.0.5'),('20110914-0945','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:37',328,'EXECUTED','3:ea1fbb819a84a853b4a97f93bd5b8600','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110914-0956','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:30',124,'EXECUTED','3:719aa7e4120c11889d91214196acfd4c','Create Index','',NULL,'2.0.5'),('20110914-0958','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:37',329,'EXECUTED','3:ad98b3c7ae60001d0e0a7b927177fb72','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-0258','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:37',330,'EXECUTED','3:bd7731e58f3db9b944905597a08eb6cb','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-0259','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:37',331,'EXECUTED','3:11086a37155507c0238c9532f66b172b','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-0357','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:37',332,'EXECUTED','3:05d531e66cbc42e1eb2d42c8bcf20bc8','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-0547','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:37',333,'EXECUTED','3:f3b0fc223476060082626b3849ee20ad','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-0552','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:37',334,'EXECUTED','3:46e5067fb13cefd224451b25abbd03ae','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-0603','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:37',335,'EXECUTED','3:ca4f567e4d75ede0553e8b32012e4141','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-0610','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:37',336,'EXECUTED','3:d6c6a22571e304640b2ff1be52c76977','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-0634','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:37',337,'EXECUTED','3:c6dd75893e5573baa0c7426ecccaa92d','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-0751','sunbiz','liquibase-core-data.xml','2015-11-12 08:42:49',10029,'EXECUTED','3:010949e257976520a6e8c87e419c9435','Insert Row','',NULL,'2.0.5'),('20110915-0803','sunbiz','liquibase-core-data.xml','2015-11-12 08:42:49',10036,'EXECUTED','3:4a09e1959df71d38fa77b249bf032edc','Insert Row','',NULL,'2.0.5'),('20110915-0823','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:37',338,'EXECUTED','3:beb831615b748a06a8b21dcaeba8c40d','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-0824','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:37',339,'EXECUTED','3:90f1a69f5cae1d2b3b3a2fa8cb1bace2','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-0825','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:28',74,'EXECUTED','3:17eab4b1c4c36b54d8cf8ca26083105c','Create Table','',NULL,'2.0.5'),('20110915-0836','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:37',340,'EXECUTED','3:53f76b5f2c20d5940518a1b14ebab33e','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-0837','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:37',341,'EXECUTED','3:936ecde7ac26efdd1a4c29260183609c','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-0838','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:37',342,'EXECUTED','3:fc1e68e753194b2f83e014daa0f7cb3e','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-0839','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:37',343,'EXECUTED','3:90bfb3d0edfcfc8091a2ffd943a54e88','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-0840','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:37',344,'EXECUTED','3:9af8eca0bc6b58c3816f871d9f6d5af8','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-0841','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:37',345,'EXECUTED','3:2ca812616a13bac6b0463bf26b9a0fe3','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-0842','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:37',346,'EXECUTED','3:4fd619ffdedac0cf141a7dd1b6e92f9b','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-0845','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:28',75,'EXECUTED','3:4e799d7e5a15e823116caa01ab7ed808','Create Table','',NULL,'2.0.5'),('20110915-0846','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:37',347,'EXECUTED','3:a41f6272aa79f3259ba24f0a31c51e72','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-0847','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:28',76,'EXECUTED','3:8c1e49cd3d6402648ee7732ba9948785','Create Table','',NULL,'2.0.5'),('20110915-0848','sunbiz','liquibase-core-data.xml','2015-11-12 08:42:49',10037,'EXECUTED','3:cf7989886ae2624508fdf64b7b656727','Insert Row (x2)','',NULL,'2.0.5'),('20110915-0848','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:28',77,'EXECUTED','3:071de39e44036bd8adb2b24b011b7369','Create Table','',NULL,'2.0.5'),('20110915-0903','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:37',348,'EXECUTED','3:b6260c13bf055f7917c155596502a24b','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1045','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:30',127,'EXECUTED','3:8612ede2553aab53950fa43d2f8def32','Create Index','',NULL,'2.0.5'),('20110915-1049','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:37',349,'EXECUTED','3:b71f1caa3d14aa6282ef58e2a002f999','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1051','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:30',128,'EXECUTED','3:26c8ae0c53225f82d4c2a85c09ad9785','Create Index','',NULL,'2.0.5'),('20110915-1052','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:30',129,'EXECUTED','3:1efabdfd082ff2b0a34f570831f74ce5','Create Index','',NULL,'2.0.5'),('20110915-1053','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:30',130,'EXECUTED','3:00273104184bb4d2bb7155befc77efc3','Create Index','',NULL,'2.0.5'),('20110915-1103','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:30',131,'EXECUTED','3:29b35d66dc4168e03e1844296e309327','Create Index','',NULL,'2.0.5'),('20110915-1104','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:30',132,'EXECUTED','3:d63107017bdcef0e28d7ad5e4df21ae5','Create Index','',NULL,'2.0.5'),('20110915-1107','sunbiz','liquibase-core-data.xml','2015-11-12 08:42:49',10038,'EXECUTED','3:18eb4edef88534b45b384e6bc3ccce75','Insert Row','',NULL,'2.0.5'),('20110915-1133','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:30',133,'EXECUTED','3:fea4ad8ce44911eeaab8ac8c1cc9122d','Create Index','',NULL,'2.0.5'),('20110915-1135','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:37',350,'EXECUTED','3:f0bc11508a871044f5a572b7f8103d52','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1148','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:37',351,'EXECUTED','3:a5ef601dc184a85e988eded2f1f82dcb','Add Unique Constraint','',NULL,'2.0.5'),('20110915-1149','sunbiz','liquibase-core-data.xml','2015-11-12 08:42:50',10039,'EXECUTED','3:83534d43a9a9cc1ea3a80f1d5f5570af','Insert Row (x10)','',NULL,'2.0.5'),('20110915-1202','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:37',352,'EXECUTED','3:2c58f7f1e2450c60898bffe6933c9b34','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1203','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:38',353,'EXECUTED','3:5bce62082a32d3624854a198d3fa35b7','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1210','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:38',354,'EXECUTED','3:e17eee5b8c4bb236a0ea6e6ade5abed7','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1215','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:28',73,'EXECUTED','3:d772a6a8adedbb1c012dac58ffb221c3','Create Table','',NULL,'2.0.5'),('20110915-1222','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:28',78,'EXECUTED','3:25ce4e3219f2b8c85e06d47dfc097382','Create Table','',NULL,'2.0.5'),('20110915-1225','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:38',355,'EXECUTED','3:2d4f77176fd59955ff719c46ae8b0cfc','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1226','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:38',356,'EXECUTED','3:66155de3997745548dbca510649cd09d','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1227','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:38',357,'EXECUTED','3:6700b07595d6060269b86903d08bb2a5','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1231','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:28',79,'EXECUTED','3:e9f6104a25d8b37146b27e568b6e3d3f','Create Table','',NULL,'2.0.5'),('20110915-1240','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:38',358,'EXECUTED','3:5a30b62738cf57a4804310add8f71b6a','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1241','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:38',359,'EXECUTED','3:a48aa09c19549e43fc538a70380ae61f','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1242','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:38',360,'EXECUTED','3:e0e23621fabe23f3f04c4d13105d528c','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1243','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:38',361,'EXECUTED','3:1d15d848cefc39090e90f3ea78f3cedc','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1244','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:38',362,'EXECUTED','3:6c5b2018afd741a3c7e39c563212df57','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1245','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:38',363,'EXECUTED','3:9b5b112797deb6eddc9f0fc01254e378','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1246','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:38',364,'EXECUTED','3:290a8c07c70dd6a5fe85be2d747ff0d8','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1247','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:30',134,'EXECUTED','3:0644f13c7f4bb764d3b17ad160bd8d41','Create Index','',NULL,'2.0.5'),('20110915-1248','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:38',365,'EXECUTED','3:5b42d27a7c7edfeb021e1dcfed0f33b3','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1258','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:28',80,'EXECUTED','3:07687ca4ba9b942a862a41dd9026bc9d','Create Table','',NULL,'2.0.5'),('20110915-1301','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:38',366,'EXECUTED','3:ef3a47a3fdd809ef4269e9643add2abd','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1302','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:38',367,'EXECUTED','3:e36c12350ebfbd624bdc6a6599410c85','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1303','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:38',368,'EXECUTED','3:5917c5e09a3f6077b728a576cd9bacb3','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1307','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:28',81,'EXECUTED','3:957d888738541ed76dda53e222079fa3','Create Table','',NULL,'2.0.5'),('20110915-1311','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:39',392,'EXECUTED','3:e88c86892fafb2f897f72a85c66954c0','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1312','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:38',369,'EXECUTED','3:fe2641c56b27b429c1c4a150e1b9af18','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1313','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:38',370,'EXECUTED','3:5c7ab96d3967d1ce4e00ebe23f4c4f6e','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1314','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:38',371,'EXECUTED','3:22902323fcd541f18ca0cb4f38299cb4','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1315','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:38',372,'EXECUTED','3:dd0d198da3d5d01f93d9acc23e89d51c','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1316','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:38',373,'EXECUTED','3:f22027f3fc0b1a3a826dc5d810fcd936','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1317','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:38',374,'EXECUTED','3:68aa00c9f2faa61031d0b4544f4cb31b','Add Unique Constraint','',NULL,'2.0.5'),('20110915-1320','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:38',375,'EXECUTED','3:5d6a55ee33c33414cccc8b46776a36a4','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1323','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:38',376,'EXECUTED','3:4c3b84570d45b23d363f6ee76acd966f','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1325','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:29',82,'EXECUTED','3:0813953451c461376a6ab5a13e4654dd','Create Table','',NULL,'2.0.5'),('20110915-1327','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:38',377,'EXECUTED','3:3c8aaca28033c8a01e4bceb7421f8e8e','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1328','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:38',378,'EXECUTED','3:05b6e994f2a09b23826264d31f275b5e','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1329','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:38',379,'EXECUTED','3:40729ae012b9ed8bd55439b233ec10cc','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1337','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:29',83,'EXECUTED','3:06fd47a34713fad9678463bba9675496','Create Table','',NULL,'2.0.5'),('20110915-1342','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:38',380,'EXECUTED','3:bb52caf0ec6e80e24d6fc0c7f2c95631','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1343','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:38',381,'EXECUTED','3:b36c3436facfe7c9371f7780ebb8701d','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1344','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:39',382,'EXECUTED','3:010fa7bc125bcb8caa320d38a38a7e3f','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1345','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:39',383,'EXECUTED','3:e3cdd84f2e6632a4dd8c526cf9ff476e','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1346','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:39',384,'EXECUTED','3:7f6420b23addd5b33320e04adbc134a3','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1435','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:29',84,'EXECUTED','3:511f99d7cb13e5fc1112ccb4633e0e45','Create Table','',NULL,'2.0.5'),('20110915-1440','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:39',385,'EXECUTED','3:2cb254be6daeeebb74fc0e1d64728a62','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1441','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:39',386,'EXECUTED','3:8bd11d5102eff3b52b1d925e44627a48','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1442','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:39',387,'EXECUTED','3:4cf7afc33839c19f830e996e8546ea72','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1443','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:39',388,'EXECUTED','3:cf41f73f64c11150062b2e2254a56908','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1450','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:29',85,'EXECUTED','3:f9348bf7337d32ebbf98545857b5c8cc','Create Table','',NULL,'2.0.5'),('20110915-1451','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:39',389,'EXECUTED','3:d98c8bdaacf99764ab3319db03b48542','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1452','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:39',390,'EXECUTED','3:3a2e67fd1f0215b49711e7e8dccd370d','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1453','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:39',391,'EXECUTED','3:6b1b7fb75fedc196cf833f04e216b9b2','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1459','sunbiz','liquibase-core-data.xml','2015-11-12 08:42:50',10040,'EXECUTED','3:5faead5506cbcde69490fef985711d66','Custom Change','Inserting core concept map types',NULL,'2.0.5'),('20110915-1524','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:39',393,'EXECUTED','3:8d609018e78b744ce30e8907ead0bec0','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1528','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:29',86,'EXECUTED','3:e8a5555a214d7bb6f17eb2466f59d12b','Create Table','',NULL,'2.0.5'),('20110915-1530','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:39',394,'EXECUTED','3:ddc26a0bb350b6c744ed6ff813b5c108','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1531','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:39',395,'EXECUTED','3:e9fa5722ba00d9b55d813f0fc8e5f9f9','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1532','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:39',396,'EXECUTED','3:72f0f61a12a3eead113be1fdcabadb6f','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1533','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:39',397,'EXECUTED','3:0430d8eecce280786a66713abd0b3439','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1534','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:39',398,'EXECUTED','3:21b6cde828dbe885059ea714cda4f470','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1536','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:39',399,'EXECUTED','3:01868c1383e5c9c409282b50e67e878c','Add Foreign Key Constraint','',NULL,'2.0.5'),('20110915-1700','sunbiz','liquibase-schema-only.xml','2015-11-12 08:42:39',400,'EXECUTED','3:ba5b74aeacacec55a49d31074b7e5023','Insert Row (x18)','',NULL,'2.0.5'),('201109152336','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:36',10431,'MARK_RAN','3:a84f855a1db7201e08900f8c7a3d7c5f','Update Data','Updating logging level global property',NULL,'2.0.5'),('20110919-0638','sunbiz','liquibase-update-to-latest.xml','2011-09-19 00:00:00',10015,'MARK_RAN','3:5e540b763c3a16e9d37aa6423b7f798f',NULL,NULL,NULL,NULL),('20110919-0639-void_empty_attributes','dkayiwa','liquibase-update-to-latest.xml','2015-11-12 08:43:36',10432,'EXECUTED','3:ccdbab987b09073fc146f3a4a5a9aee4','Custom SQL','Void all attributes that have empty string values.',NULL,'2.0.5'),('20110922-0551','sunbiz','liquibase-update-to-latest.xml','2015-11-12 08:43:29',10306,'MARK_RAN','3:ab9b55e5104645690a4e1c5e35124258','Modify Column','Changing global_property.property from varbinary to varchar',NULL,'2.0.5'),('20110926-1200','raff','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10394,'MARK_RAN','3:bf884233110a210b6ffcef826093cf9d','Custom SQL','Change all empty concept_source.hl7_code to NULL',NULL,'2.0.5'),('201109301703','suho','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10403,'MARK_RAN','3:11456d3e6867f3b521fb35e6f51ebe5a','Update Data','Converting general address format (if applicable)',NULL,'2.0.5'),('201109301704','suho','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10404,'MARK_RAN','3:d64afe121c9355f6bbe46258876ce759','Update Data','Converting Spain address format (if applicable)',NULL,'2.0.5'),('201109301705','suho','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10405,'MARK_RAN','3:d3b0c8265ee27456dc0491ff5fe8ca01','Update Data','Converting Rwanda address format (if applicable)',NULL,'2.0.5'),('201109301706','suho','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10406,'MARK_RAN','3:17d3a0900ca751d8ce775a12444c75bf','Update Data','Converting USA address format (if applicable)',NULL,'2.0.5'),('201109301707','suho','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10407,'MARK_RAN','3:afbd6428d0007325426f3c4446de2e38','Update Data','Converting Kenya address format (if applicable)',NULL,'2.0.5'),('201109301708','suho','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10408,'MARK_RAN','3:570c9234597b477e4feffbaac0469495','Update Data','Converting Lesotho address format (if applicable)',NULL,'2.0.5'),('201109301709','suho','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10409,'MARK_RAN','3:20c95ae336f437b4e0c91be5919b7a2b','Update Data','Converting Malawi address format (if applicable)',NULL,'2.0.5'),('201109301710','suho','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10410,'MARK_RAN','3:b06d71b4c220c7feed9c5a6459bea98a','Update Data','Converting Tanzania address format (if applicable)',NULL,'2.0.5'),('201110051353-fix-visit-attribute-type-columns','djazayeri','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10390,'MARK_RAN','3:d779b41ab27dca879d593aa606016bf6','Add Column (x2)','Refactoring visit_attribute_type table (devs only)',NULL,'2.0.5'),('201110072042-fix-location-attribute-type-columns','djazayeri','liquibase-update-to-latest.xml','2015-11-12 08:43:34',10400,'MARK_RAN','3:2e32ce0f25391341c8855604f4f40654','Add Column (x2)','Refactoring location_attribute_type table (devs only)',NULL,'2.0.5'),('201110072043-fix-provider-attribute-type-columns','djazayeri','liquibase-update-to-latest.xml','2015-11-12 08:43:36',10437,'MARK_RAN','3:31aa196adfe1689c1098c5f36d490902','Add Column (x2)','Refactoring provider_attribute_type table (devs only)',NULL,'2.0.5'),('20111008-0938-1','djazayeri','liquibase-update-to-latest.xml','2015-11-12 08:43:37',10448,'EXECUTED','3:fe6d462ba1a7bd81f4865e472cc223ce','Add Column','Allow Global Properties to be typed',NULL,'2.0.5'),('20111008-0938-2','djazayeri','liquibase-update-to-latest.xml','2015-11-12 08:43:37',10449,'EXECUTED','3:f831d92c11eb6cd6b334d86160db0b95','Add Column','Allow Global Properties to be typed',NULL,'2.0.5'),('20111008-0938-3','djazayeri','liquibase-update-to-latest.xml','2015-11-12 08:43:37',10450,'EXECUTED','3:f7bd79dfed90d56053dc376b6b8ee7e3','Add Column','Allow Global Properties to be typed',NULL,'2.0.5'),('20111008-0938-4','djazayeri','liquibase-update-to-latest.xml','2015-11-12 08:43:37',10451,'EXECUTED','3:65003bd1bf99ff0aa8e2947978c58053','Add Column','Allow Global Properties to be typed',NULL,'2.0.5'),('201110091820-a','jkeiper','liquibase-update-to-latest.xml','2015-11-12 08:43:37',10452,'MARK_RAN','3:364a0c70d2adbff31babab6f60ed72e7','Add Column','Add xslt column back to the form table',NULL,'2.0.5'),('201110091820-b','jkeiper','liquibase-update-to-latest.xml','2015-11-12 08:43:37',10453,'MARK_RAN','3:0b792bf39452f2e81e502a7a98f9f3df','Add Column','Add template column back to the form table',NULL,'2.0.5'),('201110091820-c','jkeiper','liquibase-update-to-latest.xml','2015-11-12 08:43:37',10455,'MARK_RAN','3:f71680d95ecf870619671fb7f416e457','Rename Table','Rename form_resource table to preserve data; 20111010-1515 reference is for bleeding-edge developers and can be generally ignored',NULL,'2.0.5'),('20111010-1515','jkeiper','liquibase-update-to-latest.xml','2015-11-12 08:43:37',10456,'EXECUTED','3:3ccdc9a3ecf811382a0c12825c0aeeb3','Create Table, Add Foreign Key Constraint, Add Unique Constraint','Creating form_resource table',NULL,'2.0.5'),('20111128-1601','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:37',10458,'EXECUTED','3:12fa4687d149a2f17251e546d47369d6','Insert Row','Inserting Auto Close Visits Task into \'schedule_task_config\' table',NULL,'2.0.5'),('20111209-1400-deleting-non-existing-roles-from-role-role-table','raff','liquibase-update-to-latest.xml','2015-11-12 08:43:37',10459,'EXECUTED','3:3d74c1dd987a12d916218d68032d726d','Custom SQL','Deleting non-existing roles from the role_role table',NULL,'2.0.5'),('20111214-1500-setting-super-user-gender','raff','liquibase-update-to-latest.xml','2015-11-12 08:43:37',10462,'EXECUTED','3:2c281abfe7beb51983db13c187c072f3','Custom SQL','Setting super user gender',NULL,'2.0.5'),('20111218-1830','abbas','liquibase-update-to-latest.xml','2015-11-12 08:43:38',10463,'EXECUTED','3:5f096b88988f19d9d3e596c03fba2b90','Add Unique Constraint, Add Column (x6), Add Foreign Key Constraint (x2)','Add unique uuid constraint and attributes inherited from BaseOpenmrsData to the person_merge_log table',NULL,'2.0.5'),('20111218-1830-fix','sunbiz','liquibase-update-to-latest.xml','2015-11-12 08:49:20',10866,'EXECUTED','3:a95b16d8762fef1076564611fb2115ac','Modify Column','(Fixed)Change person_merge_log.voided to BOOLEAN',NULL,'2.0.5'),('20111218-2274','gsluthra','liquibase-update-to-latest.xml','2015-11-12 08:49:20',10867,'MARK_RAN','3:6339df469a35f517ac6e86452aad0155','Update Data','Fix the description for RBC concept',NULL,'2.0.5'),('20111219-1404','bwolfe','liquibase-update-to-latest.xml','2015-11-12 08:43:38',10464,'EXECUTED','3:3f8cfa9c088a103788bcf70de3ffaa8b','Update Data','Fix empty descriptions on relationship types',NULL,'2.0.5'),('20111222-1659','djazayeri','liquibase-update-to-latest.xml','2015-11-12 08:43:38',10466,'EXECUTED','3:990b494647720b680efeefbab2c502de','Create Table, Create Index','Create clob_datatype_storage table',NULL,'2.0.5'),('201118012301','lkellett','liquibase-update-to-latest.xml','2015-11-12 08:43:33',10368,'MARK_RAN','3:0d96c10c52335339b1003e6dd933ccc2','Add Column','Adding the discontinued_reason_non_coded column to orders.',NULL,'2.0.5'),('201202020847','abbas','liquibase-update-to-latest.xml','2015-11-12 08:43:38',10465,'EXECUTED','3:35bf2f2481ee34975e57f08d933583be','Modify data type, Add Not-Null Constraint','Change merged_data column type to CLOB in person_merge_log table',NULL,'2.0.5'),('20120316-1300','mseaton','liquibase.xml','2015-11-12 08:44:19',10495,'EXECUTED','3:0cbaf0a89ef629563c90deccbd82429f','Create Table','Adding calculation_registration table',NULL,'2.0.5'),('20120322-1510','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:49:20',10868,'EXECUTED','3:7c5913c7091c2b20babb9e825774993c','Add Column','Adding uniqueness_behavior column to patient_identifier_type table',NULL,'2.0.5'),('20120330-0954','jkeiper','liquibase-update-to-latest.xml','2015-11-12 08:43:38',10470,'EXECUTED','3:9c6084b4407395205fa39b34630d3522','Modify data type','Increase size of drug name column to 255 characters',NULL,'2.0.5'),('20120503-djmod','dkayiwa and djazayeri','liquibase-update-to-latest.xml','2015-11-12 08:43:38',10473,'EXECUTED','3:d31ac18d3a40e45c0ebb399c5d116951','Create Table, Add Foreign Key Constraint (x2)','Create test_order table',NULL,'2.0.5'),('20120504-1000','raff','liquibase-update-to-latest.xml','2015-11-12 08:49:20',10869,'EXECUTED','3:eb6f5e2a2ef5ea111ff238ca1df013f4','Drop Table','Dropping the drug_ingredient table',NULL,'2.0.5'),('20120504-1010','raff','liquibase-update-to-latest.xml','2015-11-12 08:49:20',10870,'EXECUTED','3:4d9ece759a248fa385c3eae6b83995a1','Create Table','Creating the drug_ingredient table',NULL,'2.0.5'),('20120504-1020','raff','liquibase-update-to-latest.xml','2015-11-12 08:49:21',10871,'EXECUTED','3:fcbc8182e908b595ae338ba8402a589c','Add Primary Key','Adding a primary key to the drug_ingredient table',NULL,'2.0.5'),('20120504-1030','raff','liquibase-update-to-latest.xml','2015-11-12 08:49:22',10872,'EXECUTED','3:d802926fcf3eaf3649aca49a26a5f67d','Add Foreign Key Constraint','Adding a new foreign key from drug_ingredient.units to concept.concept_id',NULL,'2.0.5'),('20120504-1040','raff','liquibase-update-to-latest.xml','2015-11-12 08:49:23',10873,'EXECUTED','3:9786bfbb8133493b54ce9026424d5b99','Add Foreign Key Constraint','Adding a new foreign key from drug_ingredient.drug_id to drug.drug_id',NULL,'2.0.5'),('20120504-1050','raff','liquibase-update-to-latest.xml','2015-11-12 08:49:24',10874,'EXECUTED','3:7d43f25c9a3bde54112ddd65627b2c05','Add Foreign Key Constraint','Adding a new foreign key from drug_ingredient.ingredient_id to concept.concept_id',NULL,'2.0.5'),('201205241728-1','mvorobey','liquibase-update-to-latest.xml','2015-11-12 08:49:24',10881,'EXECUTED','3:70160c0af8222542fa668ac5f5cb99ed','Add Column, Add Foreign Key Constraint','Add optional property view_privilege to encounter_type table',NULL,'2.0.5'),('201205241728-2','mvorobey','liquibase-update-to-latest.xml','2015-11-12 08:49:24',10882,'EXECUTED','3:dd8de770c99e046ba05bc8348748c33c','Add Column, Add Foreign Key Constraint','Add optional property edit_privilege to encounter_type table',NULL,'2.0.5'),('20120613-0930','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:38',10471,'EXECUTED','3:fe6387773a70b574b106b37686a8e8d3','Drop Not-Null Constraint','Dropping not null constraint from provider.identifier column',NULL,'2.0.5'),('20121007-orders_urgency','djazayeri','liquibase-update-to-latest.xml','2015-11-12 08:43:38',10472,'EXECUTED','3:f8eb2228ea34f43ae21bedf4abc8736b','Add Column','Adding urgency column to orders table',NULL,'2.0.5'),('20121007-test_order_laterality','djazayeri','liquibase-update-to-latest.xml','2015-11-12 08:49:24',10884,'EXECUTED','3:1121924c349201e400e03feda110acc3','Modify data type','Changing test_order.laterality to be a varchar',NULL,'2.0.5'),('20121008-order_specimen_source_fk','djazayeri','liquibase-update-to-latest.xml','2015-11-12 08:49:25',10885,'MARK_RAN','3:99464e51d64e056a1e23b30c7aaaf47e','Add Foreign Key Constraint','Adding FK constraint for test_order.specimen_source if necessary',NULL,'2.0.5'),('20121016-1504','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:43:38',10474,'EXECUTED','3:88db1819c0e9da738ed9332b5de73609','Drop Foreign Key Constraint, Modify Column, Add Foreign Key Constraint','Removing auto increment from test_order.order_id column',NULL,'2.0.5'),('20121020-TRUNK-3610','lluismf','liquibase-update-to-latest.xml','2015-11-12 08:43:38',10475,'EXECUTED','3:a3159e65647f0ff1b667104012b5f4f0','Update Data (x2)','Rename global property autoCloseVisits.visitType to visits.autoCloseVisitType',NULL,'2.0.5'),('20121021-TRUNK-333','lluismf','liquibase-update-to-latest.xml','2015-11-12 08:49:25',10887,'EXECUTED','3:f885cb0eed2a8e2a5786675eeb0ccbc5','Drop Table','Removing concept set derived table',NULL,'2.0.5'),('20121025-TRUNK-213','lluismf','liquibase-update-to-latest.xml','2015-11-12 08:49:25',10886,'EXECUTED','3:65536ae335b0a6cb23619d6ef7ea3274','Modify Column (x2)','Normalize varchar length of locale columns',NULL,'2.0.5'),('20121109-TRUNK-3474','patandre','liquibase-update-to-latest.xml','2015-11-12 08:49:25',10888,'EXECUTED','3:02af0e39e210aeda861f92698ae974f6','Drop Not-Null Constraint','Dropping not null constraint from concept_class.description column',NULL,'2.0.5'),('20121112-TRUNK-3474','patandre','liquibase-update-to-latest.xml','2015-11-12 08:49:25',10889,'EXECUTED','3:30e023e5e3e98190470d951fbbbd9e87','Drop Not-Null Constraint','Dropping not null constraint from concept_datatype.description column',NULL,'2.0.5'),('20121113-TRUNK-3474','patandre','liquibase-update-to-latest.xml','2015-11-12 08:49:25',10890,'EXECUTED','3:76211ab053e8685a4d0b1345f166e965','Drop Not-Null Constraint','Dropping not null constraint from patient_identifier_type.description column',NULL,'2.0.5'),('20121113-TRUNK-3474-person-attribute-type','patandre','liquibase-update-to-latest.xml','2015-11-12 08:49:25',10891,'EXECUTED','3:7ad821b6167ff22a812a6c550d6deb53','Drop Not-Null Constraint','Dropping not null constraint from person_attribute_type.description column',NULL,'2.0.5'),('20121113-TRUNK-3474-privilege','patandre','liquibase-update-to-latest.xml','2015-11-12 08:49:25',10892,'EXECUTED','3:ecf38bb6fb29d96b0e2c75330a637245','Drop Not-Null Constraint','Dropping not null constraint from privilege.description column',NULL,'2.0.5'),('20121114-TRUNK-3474-encounter_type','patandre','liquibase-update-to-latest.xml','2015-11-12 08:49:25',10895,'EXECUTED','3:1cad8ad2c06b02915138dfb36c013770','Drop Not-Null Constraint','Dropping not null constraint from encounter_type.description column',NULL,'2.0.5'),('20121114-TRUNK-3474-relationship_type','patandre','liquibase-update-to-latest.xml','2015-11-12 08:49:25',10894,'EXECUTED','3:232499aa77be5583f87d6528c0c44768','Drop Not-Null Constraint','Dropping not null constraint from relationship_type.description column',NULL,'2.0.5'),('20121114-TRUNK-3474-role','patandre','liquibase-update-to-latest.xml','2015-11-12 08:49:25',10893,'EXECUTED','3:69a164a13e3520d5cdccbf977d07ce89','Drop Not-Null Constraint','Dropping not null constraint from role.description column',NULL,'2.0.5'),('20121212-TRUNK-2768','patandre','liquibase-update-to-latest.xml','2015-11-12 08:49:25',10896,'EXECUTED','3:351f7dba6eea4f007fa5d006219ede9e','Add Column','Adding deathdate_estimated column to person.',NULL,'2.0.5'),('201301031440-TRUNK-4135','rkorytkowski','liquibase-update-to-latest.xml','2015-11-12 08:46:07',10687,'EXECUTED','3:47e5686e3cb80484b2830afca679ec70','Custom Change','Creating coded order frequencies for drug order frequencies',NULL,'2.0.5'),('201301031448-TRUNK-4135','rkorytkowski','liquibase-update-to-latest.xml','2015-11-12 08:46:07',10688,'EXECUTED','3:00adfb72966810dd0c048f93b8edd523','Custom Change','Migrating drug order frequencies to coded order frequencies',NULL,'2.0.5'),('201301031455-TRUNK-4135','rkorytkowski','liquibase-update-to-latest.xml','2015-11-12 08:46:07',10689,'EXECUTED','3:04b95a27ccba87e597395670db081498','Drop Column','Dropping temporary column drug_order.frequency_text',NULL,'2.0.5'),('201306141103-TRUNK-3884','susantan','liquibase-update-to-latest.xml','2015-11-12 08:43:38',10476,'EXECUTED','3:9581f8d869e69d911f04e48591a297d0','Add Foreign Key Constraint (x3)','Adding 3 foreign key relationships (creator,created_by,voided_by) to encounter_provider table',NULL,'2.0.5'),('20130626-TRUNK-439','jthoenes','liquibase-update-to-latest.xml','2015-11-12 08:49:25',10897,'EXECUTED','3:6c0799599f35b4546dafa73968e3a229','Update Data','Adding configurability to Patient Header on Dashboard. Therefore the cd4_count property is dropped and\n            replaced with a header.showConcept property.',NULL,'2.0.5'),('20130809-TRUNK-4044-duplicateEncounterRoleChangeSet','surangak','liquibase-update-to-latest.xml','2015-11-12 08:49:25',10899,'EXECUTED','3:35b07ae88667be5a78002beacd3aa0ed','Custom Change','Custom changesets to identify and resolve duplicate EncounterRole names',NULL,'2.0.5'),('20130809-TRUNK-4044-duplicateEncounterTypeChangeSet','surangak','liquibase-update-to-latest.xml','2015-11-12 08:49:25',10900,'EXECUTED','3:01a7d7ae88b0280139178f1840d417bd','Custom Change','Custom changesets to identify and resolve duplicate EncounterType names',NULL,'2.0.5'),('20130809-TRUNK-4044-encounter_role_unique_name_constraint','surangak','liquibase-update-to-latest.xml','2015-11-12 08:49:26',10902,'EXECUTED','3:1a5a8ad5971977e0645a6fbc3744f8e2','Add Unique Constraint','Adding the unique constraint to the encounter_role.name column',NULL,'2.0.5'),('20130809-TRUNK-4044-encounter_type_unique_name_constraint','surangak','liquibase-update-to-latest.xml','2015-11-12 08:49:26',10901,'EXECUTED','3:823098007f6e299c0c6555dde6f12255','Add Unique Constraint','Adding the unique constraint to the encounter_type.name column',NULL,'2.0.5'),('20130925-TRUNK-4105','hannes','liquibase-update-to-latest.xml','2015-11-12 08:43:39',10477,'EXECUTED','3:e81f96e97c307c2d265bce32a046d0ca','Create Index','Adding index on concept_reference_term.code column',NULL,'2.0.5'),('20131023-TRUNK-3903','k-joseph','liquibase-update-to-latest.xml','2015-11-12 08:49:25',10898,'EXECUTED','3:88f8ec2c297875a03fd88ddd2b9f14b9','Add Column','Adding \"display_precision\" column to concept_numeric table',NULL,'2.0.5'),('201310281153-TRUNK-4123','mujir,sushmitharaos','liquibase-update-to-latest.xml','2015-11-12 08:46:03',10657,'EXECUTED','3:b2bffad4e841b61c6397465633cd1064','Add Column, Add Foreign Key Constraint','Adding previous_order_id to orders',NULL,'2.0.5'),('201310281153-TRUNK-4124','mujir,sushmitharaos','liquibase-update-to-latest.xml','2015-11-12 08:46:03',10658,'EXECUTED','3:eb9dec50fead4430dc07b8309e5840ac','Add Column, Update Data, Add Not-Null Constraint','Adding order_action to orders and setting order_actions as NEW for existing orders',NULL,'2.0.5'),('201311041510','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:46:03',10652,'EXECUTED','3:dfdc279ddc60b9751dc5d655b4c7fc9c','Rename Column','Renaming drug_order.prn column to drug_order.as_needed',NULL,'2.0.5'),('201311041511','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:46:03',10653,'EXECUTED','3:4a2ee902d6090959a49539d5bc907354','Add Column','Adding as_needed_condition column to drug_order table',NULL,'2.0.5'),('201311041512','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:46:03',10654,'EXECUTED','3:76a5c7a0b95e971bd540865917efed9c','Add Column','Adding order_number column to orders table',NULL,'2.0.5'),('201311041513','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:46:03',10655,'MARK_RAN','3:b41217397a18dbe18e07266a9be4a523','Update Data','Setting order numbers for existing orders',NULL,'2.0.5'),('201311041515-TRUNK-4122','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:46:03',10656,'EXECUTED','3:948975149e69b6862aab0012304d9a80','Add Not-Null Constraint','Making orders.order_number not nullable',NULL,'2.0.5'),('20131210-TRUNK-4130','k-joseph','liquibase-update-to-latest.xml','2015-11-12 08:46:03',10662,'EXECUTED','3:5a2bde236731862f2c6e3e4066705cdf','Add Column','Adding num_refills column to drug_order table',NULL,'2.0.5'),('201312141400-TRUNK-4126','arathy','liquibase-update-to-latest.xml','2015-11-12 08:46:03',10659,'EXECUTED','3:45d8c6ce32076c0fe11f75d1fea1c215','Modify data type, Rename Column','Renaming drug_order.complex to dosing_type',NULL,'2.0.5'),('201312141400-TRUNK-4127','arathy','liquibase-update-to-latest.xml','2015-11-12 08:46:03',10661,'MARK_RAN','3:26f381a2b8f112d98f36c1d0b6cceebd','Update Data (x2)','Converting values in drug_order.dosing_type column',NULL,'2.0.5'),('201312141401-TRUNK-4126','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:46:03',10660,'EXECUTED','3:cc77a94d57b78ac02e99ed4ca25f6272','Drop Not-Null Constraint','Making drug_order.dosing_type nullable',NULL,'2.0.5'),('20131216-1637','gitahi','liquibase-update-to-latest.xml','2015-11-12 08:46:08',10697,'EXECUTED','3:4b2a0abaf146a7d938b94009d9600eaf','Create Table, Add Foreign Key Constraint (x6)','Add drug_reference_map table',NULL,'2.0.5'),('201312161618-TRUNK-4129','rkorytkowski','liquibase-update-to-latest.xml','2015-11-12 08:46:05',10668,'EXECUTED','3:a7c821bc60c7410b387aa276540291a9','Add Column, Add Foreign Key Constraint','Adding quantity_units column to drug_order table',NULL,'2.0.5'),('201312161713-TRUNK-4129','rkorytkowski','liquibase-update-to-latest.xml','2015-11-12 08:46:05',10669,'EXECUTED','3:2e13513e97a1c372818bd9ad1f31c219','Modify data type','Changing quantity column of drug_order to double',NULL,'2.0.5'),('201312162044-TRUNK-4126','k-joseph','liquibase-update-to-latest.xml','2015-11-12 08:46:03',10666,'EXECUTED','3:31378c39bfdf55ec4ec6faff20c9dcf8','Add Column','Adding duration column to drug_order table',NULL,'2.0.5'),('201312162059-TRUNK-4126','k-joseph','liquibase-update-to-latest.xml','2015-11-12 08:46:03',10667,'EXECUTED','3:f6f21104c2e85bacbbe9af09fee348fd','Add Column, Add Foreign Key Constraint','Adding duration_units column to drug_order table',NULL,'2.0.5'),('20131217-TRUNK-4142','banka','liquibase-update-to-latest.xml','2015-11-12 08:46:03',10665,'EXECUTED','3:5c29916ae374ae0cb36ecbf4a9c80e8c','Add Column','Adding comment_to_fulfiller column to orders table',NULL,'2.0.5'),('20131217-TRUNK-4157','banka','liquibase-update-to-latest.xml','2015-11-12 08:46:03',10664,'EXECUTED','3:8553abd1173bf56dad911a11ec0924ce','Add Column','Adding dosing_instructions column to drug_order table',NULL,'2.0.5'),('201312171559-TRUNK-4159','k-joseph','liquibase-update-to-latest.xml','2015-11-12 08:46:03',10663,'EXECUTED','3:0735c719adcee97fbe967460d05bb474','Create Table, Add Foreign Key Constraint (x4)','Create the order_frequency table',NULL,'2.0.5'),('201312181649-TRUNK-4137','k-joseph','liquibase-update-to-latest.xml','2015-11-12 08:46:06',10676,'EXECUTED','3:278cff9c9abc7864dd71bf4cba04c885','Add Column, Add Foreign Key Constraint','Adding frequency column to test_order table',NULL,'2.0.5'),('201312181650-TRUNK-4137','k-joseph','liquibase-update-to-latest.xml','2015-11-12 08:46:06',10677,'EXECUTED','3:c28fa1a77bec305b4d8d23fda254f320','Add Column','Adding number_of_repeats column to test_order table',NULL,'2.0.5'),('201312182214-TRUNK-4136','k-joseph','liquibase-update-to-latest.xml','2015-11-12 08:46:05',10670,'EXECUTED','3:5091764b71670065672afcb69d18efae','Add Column, Add Foreign Key Constraint','Adding route column to drug_order table',NULL,'2.0.5'),('201312182223-TRUNK-4136','k-joseph','liquibase-update-to-latest.xml','2015-11-12 08:46:05',10671,'EXECUTED','3:aea033991dfc56954d1661fdf15c35f7','Drop Column','Dropping equivalent_daily_dose column from drug_order table',NULL,'2.0.5'),('201312191200-TRUNK-4167','banka','liquibase-update-to-latest.xml','2015-11-12 08:46:05',10672,'EXECUTED','3:b6a84072096cf71ca37dc160d0422a2d','Add Column','Adding dose_units column to drug_order table',NULL,'2.0.5'),('201312191300-TRUNK-4167','banka','liquibase-update-to-latest.xml','2015-11-12 08:46:05',10673,'EXECUTED','3:c1bb6f3394f9c391288f2d51384edd3e','Add Foreign Key Constraint','Adding foreignKey constraint on dose_units',NULL,'2.0.5'),('201312201200-TRUNK-4167','banka','liquibase-update-to-latest.xml','2015-11-12 08:46:05',10674,'MARK_RAN','3:c72cd1725e670ea735fc45e6f0f31001','Custom Change','Migrating old text units to coded dose_units in drug_order',NULL,'2.0.5'),('201312201425-TRUNK-4138','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:46:06',10680,'MARK_RAN','3:e6e37b7b995e2da28448f815211648fd','Update Data','Setting order.discontinued_reason to null for stopped orders',NULL,'2.0.5'),('201312201523-TRUNK-4138','banka','liquibase-update-to-latest.xml','2015-11-12 08:46:06',10679,'EXECUTED','3:8d48725ba6d40d8a19acec61c948a52f','Custom Change','Creating Discontinue Order for discontinued orders',NULL,'2.0.5'),('201312201525-TRUNK-4138','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:46:06',10681,'MARK_RAN','3:c751cbf452be8b2c05af6d6502ff5dc9','Update Data','Setting orders.discontinued_reason_non_coded to null for stopped orders',NULL,'2.0.5'),('201312201601-TRUNK-4138','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:46:06',10683,'EXECUTED','3:43505eb22756ea5ec6bee4f8ad750034','Drop Foreign Key Constraint','Dropping fk constraint on orders.discontinued_by column to users.user_id column',NULL,'2.0.5'),('201312201640-TRUNK-4138','banka','liquibase-update-to-latest.xml','2015-11-12 08:46:06',10678,'EXECUTED','3:174ed15d1066200fe48c3ed2b7a262ae','Rename Column','Rename orders.discontinued_date to date_stopped',NULL,'2.0.5'),('201312201651-TRUNK-4138','banka','liquibase-update-to-latest.xml','2015-11-12 08:46:06',10682,'EXECUTED','3:2ccbe6dad392099d9b6dc49e40736879','Drop Column','Removing discontinued from orders',NULL,'2.0.5'),('201312201700-TRUNK-4138','banka','liquibase-update-to-latest.xml','2015-11-12 08:46:06',10684,'EXECUTED','3:1c570e49534bf886108654c28a99bede','Drop Column','Removing discontinued_by from orders',NULL,'2.0.5'),('201312201800-TRUNK-4167','banka','liquibase-update-to-latest.xml','2015-11-12 08:46:05',10675,'EXECUTED','3:8ff2338c8a1df329476e9e60c8ddc7f6','Drop Column','Deleting units column',NULL,'2.0.5'),('201312271822-TRUNK-4156','vinay','liquibase-update-to-latest.xml','2015-11-12 08:46:07',10690,'EXECUTED','3:9e6ef6a4a036e5ff027a6c49557b2939','Create Table, Add Foreign Key Constraint (x3)','Adding care_setting table',NULL,'2.0.5'),('201312271823-TRUNK-4156','vinay','liquibase-update-to-latest.xml','2015-11-12 08:46:07',10691,'EXECUTED','3:036031e437f2baae976f103900455644','Insert Row','Adding OUTPATIENT care setting',NULL,'2.0.5'),('201312271824-TRUNK-4156','vinay','liquibase-update-to-latest.xml','2015-11-12 08:46:07',10692,'EXECUTED','3:b78e4eb1e63a9ca78a51c42f1e2edb00','Insert Row','Adding INPATIENT care setting',NULL,'2.0.5'),('201312271826-TRUNK-4156','vinay','liquibase-update-to-latest.xml','2015-11-12 08:46:07',10693,'EXECUTED','3:142266f644d20a834b2c687abf45f019','Add Column','Add care_setting column to orders table',NULL,'2.0.5'),('201312271827-TRUNK-4156','vinay','liquibase-update-to-latest.xml','2015-11-12 08:46:07',10694,'MARK_RAN','3:ba1d0716249a5f1bde5eec83c190400f','Custom SQL','Set default value for orders.care_setting column for existing rows',NULL,'2.0.5'),('201312271828-TRUNK-4156','vinay','liquibase-update-to-latest.xml','2015-11-12 08:46:07',10695,'EXECUTED','3:7c6fcd23f2fdbcc69ad06bcdd34cb56f','Add Not-Null Constraint','Make care_setting column non-nullable',NULL,'2.0.5'),('201312271829-TRUNK-4156','vinay','liquibase-update-to-latest.xml','2015-11-12 08:46:08',10696,'EXECUTED','3:dc55b130e1d56c8df00b06a5dedd2689','Add Foreign Key Constraint','Add foreign key constraint',NULL,'2.0.5'),('201401031433-TRUNK-4135','rkorytkowski','liquibase-update-to-latest.xml','2015-11-12 08:46:06',10685,'EXECUTED','3:1e90a9f5f6ffab47ac360dec7497d2f9','Rename Column','Temporarily renaming drug_order.frequency column to frequency_text',NULL,'2.0.5'),('201401031434-TRUNK-4135','rkorytkowski','liquibase-update-to-latest.xml','2015-11-12 08:46:07',10686,'EXECUTED','3:59eef75e78e64cdc999a6d25863c921d','Add Column, Add Foreign Key Constraint','Adding the frequency column to the drug_order table',NULL,'2.0.5'),('201401040436-TRUNK-3919','dkithmal','liquibase-update-to-latest.xml','2015-11-12 08:43:39',10480,'EXECUTED','3:2fde2a2c0d2a917cd7ec0dfc990b96ac','Add Column, Add Foreign Key Constraint','Add changed_by column to location_tag table',NULL,'2.0.5'),('201401040438-TRUNK-3919','dkithmal','liquibase-update-to-latest.xml','2015-11-12 08:43:39',10481,'EXECUTED','3:134b00185f7b61d7d6cccb66717dc4ae','Add Column','Add date_changed column to location_tag table',NULL,'2.0.5'),('201401040440-TRUNK-3919','dkithmal','liquibase-update-to-latest.xml','2015-11-12 08:43:39',10482,'EXECUTED','3:2f3b927e3554c31abebb064835da2efc','Add Column, Add Foreign Key Constraint','Add changed_by column to location table',NULL,'2.0.5'),('201401040442-TRUNK-3919','dkithmal','liquibase-update-to-latest.xml','2015-11-12 08:43:39',10483,'EXECUTED','3:6cf087a28acd99c02c00fd719a26e73b','Add Column','Add date_changed column to location table',NULL,'2.0.5'),('201401101647-TRUNK-4187','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:46:02',10634,'EXECUTED','3:d41d8cd98f00b204e9800998ecf8427e','Empty','Checks that all existing free text drug order dose units and frequencies have been mapped to\n            concepts, this will fail the upgrade process if any unmapped text is found',NULL,'2.0.5'),('201402041600-TRUNK-4138','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:46:09',10698,'EXECUTED','3:a09f49aa170ede88187564ce4834956e','Drop Foreign Key Constraint','Temporary dropping foreign key on orders.discontinued_reason column',NULL,'2.0.5'),('201402041601-TRUNK-4138','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:46:09',10699,'EXECUTED','3:09293693ccab9bd63f0bacbf1229e6b5','Rename Column','Renaming orders.discontinued_reason column to order_reason',NULL,'2.0.5'),('201402041602-TRUNK-4138','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:46:09',10700,'EXECUTED','3:b93897a56c7e2407d694bd47b9f3ff56','Add Foreign Key Constraint','Adding back foreign key on orders.discontinued_reason column',NULL,'2.0.5'),('201402041604-TRUNK-4138','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:46:09',10701,'EXECUTED','3:bf80640132c97067d42dabbebd10b7df','Rename Column','Renaming orders.discontinued_reason_non_coded column to order_reason_non_coded',NULL,'2.0.5'),('201402042238-TRUNK-4202','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:46:10',10703,'MARK_RAN','3:e74c6d63ac01908cc6fb6f3e9b15e2e0','Custom Change','Converting orders.orderer to reference provider.provider_id',NULL,'2.0.5'),('201402051638-TRUNK-4202','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:46:10',10702,'EXECUTED','3:ddff1dba0827858324336de9baeb93aa','Drop Foreign Key Constraint','Temporarily removing foreign key constraint from orders.orderer column',NULL,'2.0.5'),('201402051639-TRUNK-4202','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:46:10',10704,'EXECUTED','3:32f643ae7a3cafe84fc11208e116cbf0','Add Foreign Key Constraint','Adding foreign key constraint to orders.orderer column',NULL,'2.0.5'),('201402120720-TRUNK-3902','k-joseph','liquibase-update-to-latest.xml','2015-11-12 08:49:26',10903,'MARK_RAN','3:7ce90e7459b6b840b7d3f246b6ca697b','Rename Column','Rename concept_numeric.precise to concept_numeric.allow_decimal',NULL,'2.0.5'),('201402241055','Akshika','liquibase-update-to-latest.xml','2015-11-12 08:46:02',10649,'EXECUTED','3:10f872c80393f2cb4d1126ec59b54676','Modify Column','Making orders.start_date not nullable',NULL,'2.0.5'),('201402281648-TRUNK-4274','k-joseph','liquibase-update-to-latest.xml','2015-11-12 08:46:03',10650,'EXECUTED','3:1efc6af34de0b0e83ce217febe1c9fa7','Modify Column','Making order.encounter required',NULL,'2.0.5'),('201403011348','alexisduque','liquibase-update-to-latest.xml','2015-11-12 08:46:03',10651,'EXECUTED','3:117c4ea0b0cd79e21a59b5769d020c93','Modify Column','Make orders.orderer not NULLable',NULL,'2.0.5'),('20140304-TRUNK-4170-duplicateLocationAttributeTypeNameChangeSet','harsz89','liquibase-update-to-latest.xml','2015-11-12 08:49:26',10904,'MARK_RAN','3:b74878260cae25b9c209d1b6ea5ddb98','Custom Change','Custom changeset to identify and resolve duplicate Location Attribute Type names',NULL,'2.0.5'),('20140304-TRUNK-4170-location_attribute_type_unique_name','harsz89','liquibase-update-to-latest.xml','2015-11-12 08:49:27',10905,'EXECUTED','3:e11205616b3ee4ad727a2c5031dee884','Add Unique Constraint','Adding the unique constraint to the location_attribute_type.name column',NULL,'2.0.5'),('20140304816-TRUNK-4139','Akshika','liquibase-update-to-latest.xml','2015-11-12 08:46:10',10706,'EXECUTED','3:0d0ffd19df0598f644c863d931abccd2','Add Column','Adding scheduled_date column to orders table',NULL,'2.0.5'),('201403061758-TRUNK-4284','Banka, Vinay','liquibase-update-to-latest.xml','2015-11-12 08:46:10',10705,'EXECUTED','3:008c6f185b3c571b57031314beda2b8f','Insert Row','Inserting Frequency concept class',NULL,'2.0.5'),('201403070132-TRUNK-4286','andras-szell','liquibase-update-to-latest.xml','2015-11-12 08:46:02',10648,'MARK_RAN','3:292b7549e0ae96619a6e4fcc30383592','Insert Row','Insert order type for test orders',NULL,'2.0.5'),('20140313-TRUNK-4288','dszafranek','liquibase-update-to-latest.xml','2015-11-12 08:46:11',10707,'EXECUTED','3:3f2f0f3c1bcfe74253de58d32f811e11','Create Table, Add Foreign Key Constraint (x2), Add Primary Key','Add order_type_class_map table',NULL,'2.0.5'),('20140314-TRUNK-4283','dszafranek, wyclif','liquibase-update-to-latest.xml','2015-11-12 08:46:02',10635,'EXECUTED','3:d41d8cd98f00b204e9800998ecf8427e','Empty','Checking that all orders have start_date column set',NULL,'2.0.5'),('20140316-TRUNK-4283','dszafranek, wyclif','liquibase-update-to-latest.xml','2015-11-12 08:46:02',10637,'EXECUTED','3:d41d8cd98f00b204e9800998ecf8427e','Empty','Checking that all orders have encounter_id column set',NULL,'2.0.5'),('20140318-TRUNK-4265','jkondrat','liquibase-update-to-latest.xml','2015-11-12 08:46:11',10708,'EXECUTED','3:01f3e7e45562865ed7855cea0b7ccd30','Merge Column, Update Data','Concatenate dose_strength and units to form the value for the new strength field',NULL,'2.0.5'),('201403262140-TRUNK-4265','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:46:02',10638,'EXECUTED','3:d41d8cd98f00b204e9800998ecf8427e','Empty','Checking if there are any drugs with the dose_strength specified but no units',NULL,'2.0.5'),('20140331-1-TRUNK-4335','rkorytkowski','liquibase-update-to-latest.xml','2015-11-12 08:43:39',10478,'EXECUTED','3:abfcdbe1adf81de731e3997bd4a66818','Add Column','Adding uuid to concept_set_derived',NULL,'2.0.5'),('20140331-2-TRUNK-4335','rkorytkowski','liquibase-update-to-latest.xml','2015-11-12 08:43:39',10479,'EXECUTED','3:2e11785b7fb8a32248f56f7ba55fc143','Add Column','Adding uuid to drug_ingredient',NULL,'2.0.5'),('201404091110','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:46:02',10639,'EXECUTED','3:d41d8cd98f00b204e9800998ecf8427e','Empty','Checking if order_type table is already up to date or can be updated automatically',NULL,'2.0.5'),('201404091112','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:46:02',10643,'EXECUTED','3:2bf52dfa949ba06b05016ce4eb08034b','Add Unique Constraint','Adding unique key constraint to order_type.name column',NULL,'2.0.5'),('201404091128','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:46:02',10644,'MARK_RAN','3:f96fd12ecf53fb18143450f7a0b9c1d9','Add Column','Adding java_class_name column to order_type table',NULL,'2.0.5'),('201404091129','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:46:02',10645,'MARK_RAN','3:d018fdec6bcd0775032bd8df67f57a77','Add Column','Adding parent column to order_type table',NULL,'2.0.5'),('201404091131','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:46:02',10647,'EXECUTED','3:accf143fbe21963d2ea7fb211424ed4f','Add Not-Null Constraint','Add not-null constraint on order_type.java_class_name column',NULL,'2.0.5'),('201404091516','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:46:11',10709,'EXECUTED','3:8c5d2f8c49bf08514911c24f60c065e0','Add Column, Add Foreign Key Constraint','Add changed_by column to order_type table',NULL,'2.0.5'),('201404091517','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:46:11',10710,'EXECUTED','3:24b9f5757f0dec2a910daab2dd138ce1','Add Column','Add date_changed column to order_type table',NULL,'2.0.5'),('201404101130','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:46:02',10646,'MARK_RAN','3:0b986790bfacfc61e7ec851a4e4fbded','Update Data','Setting java_class_name column for drug order type row',NULL,'2.0.5'),('201406152043','harsz89','liquibase-update-to-latest.xml','2015-11-12 08:46:11',10711,'EXECUTED','3:e647ce05fe3d54352a085edc028d2a52','Add Foreign Key Constraint','Adding foreign key constraint from order_type.parent column to orders.order_id column',NULL,'2.0.5'),('201406201443','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:46:11',10712,'EXECUTED','3:c1cf2edbf71074e2740d975d89ca202d','Add Column','Add brand_name column to drug_order table',NULL,'2.0.5'),('201406201444','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:46:11',10713,'EXECUTED','3:da7c9042e009a4cbe61746bd8bf13d12','Add Column','Add dispense_as_written column to drug_order table',NULL,'2.0.5'),('201406211643-TRUNK-4401','harsz89','liquibase-update-to-latest.xml','2015-11-12 08:46:02',10641,'EXECUTED','3:d41d8cd98f00b204e9800998ecf8427e','Empty','Checking that all discontinued orders have the discontinued_date column set',NULL,'2.0.5'),('201406211703-TRUNK-4401','harsz89','liquibase-update-to-latest.xml','2015-11-12 08:46:02',10642,'EXECUTED','3:d41d8cd98f00b204e9800998ecf8427e','Empty','Checking that all discontinued orders have the discontinued_by column set',NULL,'2.0.5'),('201406262016','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:46:02',10640,'EXECUTED','3:d41d8cd98f00b204e9800998ecf8427e','Empty','Checking that all users that created orders have provider accounts',NULL,'2.0.5'),('20140635-TRUNK-4283','dszafranek, wyclif','liquibase-update-to-latest.xml','2015-11-12 08:46:02',10636,'EXECUTED','3:d41d8cd98f00b204e9800998ecf8427e','Empty','Checking that all orders have orderer column set',NULL,'2.0.5'),('20140715-TRUNK-2999-remove_concept_word','rkorytkowski','liquibase-update-to-latest.xml','2015-11-12 08:49:27',10906,'EXECUTED','3:4ff8bd1176165ac45c42809673d7d12d','Drop Table','Removing the concept_word table (replaced by Lucene)',NULL,'2.0.5'),('20140718-TRUNK-2999-remove_update_concept_index_task','rkorytkowski','liquibase-update-to-latest.xml','2015-11-12 08:49:27',10907,'EXECUTED','3:a0ca6ff43de07e00f6a494c5b2964de5','Delete Data','Deleting the update concept index task',NULL,'2.0.5'),('20140719-TRUNK-4445-update_dosing_type_to_varchar_255','mihir','liquibase-update-to-latest.xml','2015-11-12 08:47:01',10731,'EXECUTED','3:2948bf1441141d7f36e34cea1cdfb72a','Modify data type','Increase size of dosing type column to 255 characters',NULL,'2.0.5'),('20140724-1528','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:46:11',10714,'EXECUTED','3:ad5fee02995c649c4b87d5991f5f3723','Drop Default Value','Dropping default value for drug_order.drug_inventory_id',NULL,'2.0.5'),('20140801-TRUNK-4443-rename_order_start_date_to_date_activated','bharti','liquibase-update-to-latest.xml','2015-11-12 08:47:01',10730,'EXECUTED','3:fde9246d6d3b98ac8e64361818ece22c','Rename Column','Renaming the start_date in order table to date_activated',NULL,'2.0.5'),('201408200733-TRUNK-4446','Deepak','liquibase-update-to-latest.xml','2015-11-12 08:47:44',10741,'EXECUTED','3:95a533365792e76a4cd95f8f32c887db','Modify data type','Changing duration column of drug_order to int',NULL,'2.0.5'),('201409230113-TRUNK-3484','k-joseph','liquibase-update-to-latest.xml','2015-11-12 08:49:27',10908,'MARK_RAN','3:7a9c7aad5b657556b1103510f8bfc1d9','Update Data','Updating description for visits.encounterTypeToVisitTypeMapping GP to the value set in OpenmrsContants',NULL,'2.0.5'),('20141010-trunk-4492','alec','liquibase-update-to-latest.xml','2015-11-12 08:49:27',10910,'EXECUTED','3:fbe1f44dafa30068cd7c99a6713f8ee4','Drop Column','Dropping the tribe field from patient table because it has been moved to person_attribute.',NULL,'2.0.5'),('201410291606-TRUNK-3474','jbuczynski','liquibase-update-to-latest.xml','2015-11-12 08:49:27',10911,'EXECUTED','3:03757abe17abedb9ac1cf0b933a35139','Drop Not-Null Constraint','Dropping not null constraint from program.description column',NULL,'2.0.5'),('201410291613-TRUNK-3474','jbuczynski','liquibase-update-to-latest.xml','2015-11-12 08:49:27',10912,'EXECUTED','3:32fa9bee757a0ca295e1545662051b96','Drop Not-Null Constraint','Dropping not null constraint from order_type.description column',NULL,'2.0.5'),('201410291614-TRUNK-3474','jbuczynski','liquibase-update-to-latest.xml','2015-11-12 08:49:27',10913,'EXECUTED','3:8623cbc44ba289fa096e0b5ee4eeaf11','Drop Not-Null Constraint','Dropping not null constraint from concept_name_tag.description column',NULL,'2.0.5'),('201410291616-TRUNK-3474','jbuczynski','liquibase-update-to-latest.xml','2015-11-12 08:49:27',10914,'EXECUTED','3:4393a565e9dad85e69c1cfcd9836d957','Drop Not-Null Constraint','Dropping not null constraint from active_list_type.description column',NULL,'2.0.5'),('20141103-1030','wyclif','liquibase-update-to-latest.xml','2015-11-12 08:49:27',10915,'EXECUTED','3:2b1a52ce2e496ec391e63ce4d9758226','Add Column','Adding form_namespace_and_path column to obs table',NULL,'2.0.5'),('20141121-TRUNK-2193','raff','liquibase-update-to-latest.xml','2015-11-12 08:49:27',10916,'EXECUTED','3:5c3daa4f68e3e650f53b63496a831295','Rename Column','Renaming drug_ingredient.quantity to strength',NULL,'2.0.5'),('20150109-0505','Shruthi, Sravanthi','liquibase.xml','2015-11-12 08:51:11',10978,'EXECUTED','3:dac719171dae4edcff51cef778e34756','Create Table','',NULL,'2.0.5'),('20150109-0521','Shruthi, Sravanthi','liquibase.xml','2015-11-12 08:51:12',10980,'EXECUTED','3:7c55ee9f0149c0c645c0d8f566c42011','Create Index','Creating unique index on condition.uuid column',NULL,'2.0.5'),('20150109-0627','Shruthi, Sravanthi','liquibase.xml','2015-11-12 08:51:11',10979,'EXECUTED','3:643c49c1108fd96b387efa2b8b832252','Add Foreign Key Constraint (x6)','',NULL,'2.0.5'),('20150122-1414','rkorytkowski','liquibase-update-to-latest.xml','2015-11-12 08:47:44',10739,'MARK_RAN','3:b662cac19085b837d902916f20a27da9','Update Data','Reverting concept name type to NULL for concepts having names tagged as default',NULL,'2.0.5'),('20150122-1420','rkorytkowski','liquibase-update-to-latest.xml','2015-11-12 08:47:44',10740,'MARK_RAN','3:c75793ade72db0648a912f22f79cf461','Update Data, Delete Data (x2)','Setting concept name type to fully specified for names tagged as default',NULL,'2.0.5'),('20150428-TRUNK-4693-1','mseaton','liquibase-update-to-latest.xml','2015-11-12 08:47:45',10742,'EXECUTED','3:599624d822c5f7a0d9bc796c4e90a526','Drop Foreign Key Constraint','Removing invalid foreign key constraint from order_type.parent column to order.order_id column',NULL,'2.0.5'),('20150428-TRUNK-4693-2','mseaton','liquibase-update-to-latest.xml','2015-11-12 08:47:46',10743,'EXECUTED','3:706418216753f16ce1b5eb0c45c21e24','Add Foreign Key Constraint','Adding foreign key constraint from order_type.parent column to order_type.order_type_id column',NULL,'2.0.5'),('201506051103-TRUNK-4727','Chethan, Preethi','liquibase-update-to-latest.xml','2015-11-12 08:49:27',10917,'EXECUTED','3:91fd51bed950b30f1b0532b5bdc041cc','Add Column','Adding birthtime column to person',NULL,'2.0.5'),('201508111304','sns.recommind','liquibase-update-to-latest.xml','2015-11-12 08:49:28',10918,'EXECUTED','3:75a849aa0d9c54bb2e052e6a8875d443','Create Index','Add an index to the global_property.property column',NULL,'2.0.5'),('201508111412','sns.recommind','liquibase-update-to-latest.xml','2015-11-12 08:49:29',10919,'EXECUTED','3:226edcaabe81261347e3da63e5321b3f','Create Index','Add an index to the concept_class.name column',NULL,'2.0.5'),('201508111415','sns.recommind','liquibase-update-to-latest.xml','2015-11-12 08:49:29',10920,'EXECUTED','3:ee7859e5c5d801c0125fe02449c1c53b','Create Index','Add an index to the concept_datatype.name column',NULL,'2.0.5'),('27112013_1','tw','liquibase.xml','2015-11-12 08:50:34',10935,'EXECUTED','3:f748a92a8a51d282a218b24c0256b1c9','Add Column, Add Foreign Key Constraint','',NULL,'2.0.5'),('28112013_1','tw','liquibase.xml','2015-11-12 08:50:34',10936,'EXECUTED','3:fc6db60b0aec6e6499e681670e83294e','Add Column','',NULL,'2.0.5'),('28112013_10','tw','liquibase.xml','2015-11-12 08:50:34',10945,'EXECUTED','3:f0236cce1aee98a39a1ccad8d3c80fb8','Add Unique Constraint, Add Foreign Key Constraint (x3)','',NULL,'2.0.5'),('28112013_11','tw','liquibase.xml','2015-11-12 08:50:34',10946,'EXECUTED','3:a5a636212dc5badbbc2739440efb6579','Add Column','',NULL,'2.0.5'),('28112013_12','tw','liquibase.xml','2015-11-12 08:50:34',10947,'EXECUTED','3:1dadaa75f944e1b96d809e207a88b9d5','Add Column','',NULL,'2.0.5'),('28112013_13','tw','liquibase.xml','2015-11-12 08:50:34',10948,'EXECUTED','3:355af2bd4a801e1b74fdf8972df5d9f5','Add Column','',NULL,'2.0.5'),('28112013_14','tw','liquibase.xml','2015-11-12 08:50:35',10949,'EXECUTED','3:59a504947b790dccfc94c91867061bef','Add Column','',NULL,'2.0.5'),('28112013_15','tw','liquibase.xml','2015-11-12 08:50:35',10950,'EXECUTED','3:8503e2e68243a29ead81a4fa75085599','Add Column','',NULL,'2.0.5'),('28112013_16','tw','liquibase.xml','2015-11-12 08:50:35',10951,'EXECUTED','3:963de62ef5c72d0e26a1e83172e5a8c6','Add Column','',NULL,'2.0.5'),('28112013_17','tw','liquibase.xml','2015-11-12 08:50:35',10952,'EXECUTED','3:a43d20de3e4793fd696b0a4b42ba71c1','Add Column','',NULL,'2.0.5'),('28112013_18','tw','liquibase.xml','2015-11-12 08:50:35',10953,'EXECUTED','3:797d6dc5e563e8889991afec46013359','Add Column','',NULL,'2.0.5'),('28112013_19','tw','liquibase.xml','2015-11-12 08:50:35',10954,'EXECUTED','3:72b4a16431f23d84a38452899e006844','Add Column','',NULL,'2.0.5'),('28112013_2','tw','liquibase.xml','2015-11-12 08:50:34',10937,'EXECUTED','3:9667afd8ba177d1a0c8b7095db67bee0','Add Column','',NULL,'2.0.5'),('28112013_20','tw','liquibase.xml','2015-11-12 08:50:35',10955,'EXECUTED','3:b62edd5aad0e98106e2db03687bf28e3','Add Unique Constraint, Add Foreign Key Constraint (x3)','',NULL,'2.0.5'),('28112013_3','tw','liquibase.xml','2015-11-12 08:50:34',10938,'EXECUTED','3:3c7da130eff93427a563e2c87464e82a','Add Column','',NULL,'2.0.5'),('28112013_4','tw','liquibase.xml','2015-11-12 08:50:34',10939,'EXECUTED','3:801c3b23f47dd073edb009e0e1938877','Add Column','',NULL,'2.0.5'),('28112013_5','tw','liquibase.xml','2015-11-12 08:50:34',10940,'EXECUTED','3:98b6351c16b8ccd4493070d845f5b492','Add Column','',NULL,'2.0.5'),('28112013_6','tw','liquibase.xml','2015-11-12 08:50:34',10941,'EXECUTED','3:bac8dd40a71719501a27998d73b5d15c','Add Column','',NULL,'2.0.5'),('28112013_7','tw','liquibase.xml','2015-11-12 08:50:34',10942,'EXECUTED','3:df894febe79ae93215ba7fed49690912','Add Column','',NULL,'2.0.5'),('28112013_8','tw','liquibase.xml','2015-11-12 08:50:34',10943,'EXECUTED','3:f6a6cc311e0a08672fd7fe4cc940c244','Add Column','',NULL,'2.0.5'),('28112013_9','tw','liquibase.xml','2015-11-12 08:50:34',10944,'EXECUTED','3:12e78d20ae7b0ce95cfab7dac8444da7','Add Column','',NULL,'2.0.5'),('3-increase-privilege-col-size-person_attribute_type','dkayiwa','liquibase-update-to-latest.xml','2015-11-12 08:43:38',10469,'EXECUTED','3:c2465b2417463d93f1101c6683f41250','Drop Foreign Key Constraint, Modify Column, Add Foreign Key Constraint','Increasing the size of the edit_privilege column in the person_attribute_type table',NULL,'2.0.5'),('appframework-1','djazayeri','liquibase.xml','2015-11-12 08:44:09',10492,'EXECUTED','3:1fff60c3e3407f96174f63eb875e3dd3','Create Table, Add Foreign Key Constraint (x2)','Create table for AppEnabled',NULL,'2.0.5'),('appframework-2','djazayeri','liquibase.xml','2015-11-12 08:44:09',10493,'EXECUTED','3:964d11f2c8a482d315341c315b705101','Drop Table','Drop table for AppEnabled, since we\'ll be using privileges instead',NULL,'2.0.5'),('appframework-3','nutsiepully','liquibase.xml','2015-11-12 08:44:09',10494,'EXECUTED','3:fdc791492c3f51ed1d97890bc099d284','Create Table','Create table to track which AppFramework components are enabled',NULL,'2.0.5'),('appframework-4','Wyclif','liquibase.xml','2015-11-12 08:48:06',10744,'EXECUTED','3:9a5638b21b279ff5fb44a268876bc1d3','Create Table','Create table to store user defined apps',NULL,'2.0.5'),('bahmni-1','tw','liquibase.xml','2015-11-12 08:45:00',10499,'EXECUTED','3:1fa8ea475c7e35cd9bcb5040bd294622','SQL From File','rel2',NULL,'2.0.5'),('bahmni-10','tw','liquibase.xml','2015-11-12 08:45:00',10508,'EXECUTED','3:73863097e856ba046dab35b909890730','SQL From File','rel2',NULL,'2.0.5'),('bahmni-11','tw','liquibase.xml','2015-11-12 08:45:00',10509,'EXECUTED','3:4eb9fcc5ce17fbf0a38995357e206adf','SQL From File','rel2',NULL,'2.0.5'),('bahmni-12','tw','liquibase.xml','2015-11-12 08:45:00',10510,'EXECUTED','3:ccbf2af31c91354755b145585f1adf43','SQL From File','rel2',NULL,'2.0.5'),('bahmni-16','tw','liquibase.xml','2015-11-12 08:45:00',10512,'EXECUTED','3:1e70c5fa76cd1a8a9d0459ce437d009e','SQL From File','rel3',NULL,'2.0.5'),('bahmni-17','tw','liquibase.xml','2015-11-12 08:45:00',10513,'EXECUTED','3:2dced694dd0f4778a33490ab099ef756','SQL From File','rel3',NULL,'2.0.5'),('bahmni-19','tw','liquibase.xml','2015-11-12 08:45:01',10515,'EXECUTED','3:52d9923b31a58b0e2c1fb9c3d1d5aa25','SQL From File','rel3',NULL,'2.0.5'),('bahmni-2','tw','liquibase.xml','2015-11-12 08:45:00',10500,'EXECUTED','3:5b9223967ffc4864988813db4dc88be6','SQL From File','rel2',NULL,'2.0.5'),('bahmni-20','tw','liquibase.xml','2015-11-12 08:45:01',10516,'EXECUTED','3:51dff674d6df91159ea92847a3a9e970','SQL From File','rel3',NULL,'2.0.5'),('bahmni-25','tw','liquibase.xml','2015-11-12 08:45:01',10520,'EXECUTED','3:71856a1d7fe4bf6eb1bf99a81b853a82','SQL From File','rel3',NULL,'2.0.5'),('bahmni-26','tw','liquibase.xml','2015-11-12 08:45:01',10521,'EXECUTED','3:a2862e0129adc45ea27bcf46ba4a1698','SQL From File','rel3',NULL,'2.0.5'),('bahmni-27','tw','liquibase.xml','2015-11-12 08:45:01',10522,'EXECUTED','3:c7184166e3ec80668677966efa251b63','SQL From File','rel3',NULL,'2.0.5'),('bahmni-28','tw','liquibase.xml','2015-11-12 08:45:01',10523,'EXECUTED','3:23f221251e83aecc4dd7a7111e7bb726','SQL From File','rel3',NULL,'2.0.5'),('bahmni-29','tw','liquibase.xml','2015-11-12 08:45:01',10524,'EXECUTED','3:0998fdf1cb16d20ac72d500b4a4abcf0','SQL From File','rel3',NULL,'2.0.5'),('bahmni-3','tw','liquibase.xml','2015-11-12 08:45:00',10501,'EXECUTED','3:3d717ca9342fb21a14ec999b6773e78f','SQL From File','rel2',NULL,'2.0.5'),('bahmni-30','tw','liquibase.xml','2015-11-12 08:45:01',10525,'EXECUTED','3:6404f5bea3bc91a0168a723ce0a945f7','Update Data','rel3',NULL,'2.0.5'),('bahmni-31','tw','liquibase.xml','2015-11-12 08:45:00',10511,'EXECUTED','3:845a3fea37de2528ca3a25dd9e181490','SQL From File','rel2',NULL,'2.0.5'),('bahmni-32','tw','liquibase.xml','2015-11-12 08:45:01',10526,'EXECUTED','3:57fb9812295f1692f9b83a0bcdaf4c06','SQL From File','rel3',NULL,'2.0.5'),('bahmni-33','tw','liquibase.xml','2015-11-12 08:48:17',10745,'EXECUTED','3:104cdb183cea698b8be017762c81efaf','SQL From File','rel3',NULL,'2.0.5'),('bahmni-34','tw','liquibase.xml','2015-11-12 08:45:01',10527,'EXECUTED','3:2abb7d22b892ea22ed083df5a2978ba2','SQL From File','rel3',NULL,'2.0.5'),('bahmni-35','tw','liquibase.xml','2015-11-12 08:45:01',10528,'EXECUTED','3:33d81235022388bf9b5a3e4d251c49ec','SQL From File','rel3',NULL,'2.0.5'),('bahmni-36','tw','liquibase.xml','2015-11-12 08:45:01',10529,'EXECUTED','3:cdcea0ce4c1259fc2387a8014b817006','Custom SQL','Add investigations meta data',NULL,'2.0.5'),('bahmni-37','tw','liquibase.xml','2015-11-12 08:45:01',10542,'EXECUTED','3:f12d0201c6ad6833de572087e2d02b03','Custom SQL','Add job for processing reference data',NULL,'2.0.5'),('bahmni-38','tw','liquibase.xml','2015-11-12 08:45:01',10543,'EXECUTED','3:84c16b09199f9bf019ebac8755f6b778','Custom SQL','Add job for processing failed reference data',NULL,'2.0.5'),('bahmni-39','tw','liquibase.xml','2015-11-12 08:45:01',10544,'EXECUTED','3:390298a50c1fe5e8281e3763cde39f8a','Custom SQL','Update class name of reference data feed task and failed event task.',NULL,'2.0.5'),('bahmni-4','tw','liquibase.xml','2015-11-12 08:45:00',10502,'EXECUTED','3:86dabf0c08030df866a7bceaf0a5758e','SQL From File','rel2',NULL,'2.0.5'),('bahmni-5','tw','liquibase.xml','2015-11-12 08:45:00',10503,'EXECUTED','3:906a8aec030d1961ee3391a354cb6b68','SQL From File','rel2',NULL,'2.0.5'),('bahmni-6','tw','liquibase.xml','2015-11-12 08:45:00',10504,'EXECUTED','3:e62b63150ce704651dd128abb60690ae','SQL From File','rel2',NULL,'2.0.5'),('bahmni-7','tw','liquibase.xml','2015-11-12 08:45:00',10505,'EXECUTED','3:971ebef189662030a66c0763c0515aef','SQL From File','rel2',NULL,'2.0.5'),('bahmni-9','tw','liquibase.xml','2015-11-12 08:45:00',10507,'EXECUTED','3:44169eaebabb84c89214370224d47062','SQL From File','rel2',NULL,'2.0.5'),('bahmni-atomfeed-add-event-records-category-index','Achinta, Sudhakar','liquibase.xml','2015-11-12 08:51:23',11009,'EXECUTED','3:9e2b5cdf52eb8caa784986d0772e6cc8','Create Index','Add index to the category column in event_records table for performance (if it is not already present)',NULL,'2.0.5'),('bahmni-clinical-1','tw','liquibase.xml','2015-11-12 08:45:00',10506,'EXECUTED','3:34e384e76217b318152ac490e737311d','SQL From File','rel2',NULL,'2.0.5'),('bahmni-clinical-10','Vivek','liquibase.xml','2015-11-12 08:45:01',10534,'EXECUTED','3:df7f3657adbe5e363ef3cd223ea55b42','Custom SQL','Add concept words for adt notes',NULL,'2.0.5'),('bahmni-clinical-11','Arathy','liquibase.xml','2015-11-12 08:45:01',10535,'EXECUTED','3:96097718e2a28e38b1e9dec1493d16d6','Custom SQL','Add concept Document',NULL,'2.0.5'),('bahmni-clinical-12','Arathy','liquibase.xml','2015-11-12 08:45:01',10536,'EXECUTED','3:b295a4ca56c415a6768aa5f696b51a86','Custom SQL','Add concept-name Document',NULL,'2.0.5'),('bahmni-clinical-13','Arathy','liquibase.xml','2015-11-12 08:45:01',10537,'EXECUTED','3:8a417d9214f1ff5607ebcb99447bed6e','Custom SQL','Add Encounter Type Radiology',NULL,'2.0.5'),('bahmni-clinical-14','Praveen','liquibase.xml','2015-11-12 08:45:01',10541,'EXECUTED','3:38e8445cf5bc784f372cf5c8a8ce471d','Custom SQL','Add new encounter type for investigation',NULL,'2.0.5'),('bahmni-clinical-2','tw','liquibase.xml','2015-11-12 08:45:01',10514,'EXECUTED','3:b922d30c4067bcebeca2089b4ddaf899','SQL From File','rel3',NULL,'2.0.5'),('bahmni-clinical-201401171353','banka-tw','liquibase.xml','2015-11-12 08:45:01',10538,'EXECUTED','3:aff3053304cfb5176c57269c71739c7f','Insert Row','',NULL,'2.0.5'),('bahmni-clinical-201401171415','banka-tw','liquibase.xml','2015-11-12 08:45:01',10539,'EXECUTED','3:12b0753a2a241925fcc9ac763ad69f19','Insert Row','',NULL,'2.0.5'),('bahmni-clinical-201401171420','banka-tw','liquibase.xml','2015-11-12 08:45:01',10540,'EXECUTED','3:b2794090dfbbf4946f77e036915f64d2','Insert Row','',NULL,'2.0.5'),('bahmni-clinical-201401281730','Banka,RT','liquibase.xml','2015-11-12 08:45:01',10545,'EXECUTED','3:d97e8d388d129a0fa418f1c172f8fc7a','Custom SQL','Add new encounter type for Lab Result',NULL,'2.0.5'),('bahmni-clinical-201401311600','TW','liquibase.xml','2015-11-12 08:45:01',10546,'EXECUTED','3:b2f57e10b5c48c07ba67f00e3cbeafd4','Custom SQL','Add concept set for Lab results',NULL,'2.0.5'),('bahmni-clinical-201402061215','Angshu,RT','liquibase.xml','2015-11-12 08:45:01',10547,'EXECUTED','3:8f210ada3640cea55eba55a4e9eef202','Custom SQL','Add new visit type LAB_RESULTS_IN_ABSENTEE',NULL,'2.0.5'),('bahmni-clinical-201402101443','sush','liquibase.xml','2015-11-12 08:45:01',10548,'EXECUTED','3:4bf141e0bfa4a5876a3c372d6b18b47d','Insert Row','',NULL,'2.0.5'),('bahmni-clinical-201402111716','indraneel,neha','liquibase.xml','2015-11-12 08:45:01',10549,'EXECUTED','3:69ec0c78de56b715740f0df83f58bb07','Insert Row','',NULL,'2.0.5'),('bahmni-clinical-201402161951','Mujir,Vinay','liquibase.xml','2015-11-12 08:45:01',10550,'EXECUTED','3:ff1175a61a50b57bb0ec08bde9868699','Custom SQL','Creating new visit type DRUG_ORDER',NULL,'2.0.5'),('bahmni-clinical-201402201226','Neha,Indraneel','liquibase.xml','2015-11-12 08:45:01',10551,'EXECUTED','3:3f33243a98921ae1eb6ab592975fcb83','Custom SQL','deleting visit types DRUG_ORDER and LAB_RESULTS_IN_ABSENTEE',NULL,'2.0.5'),('bahmni-clinical-201402201520','Angshu','liquibase.xml','2015-11-12 08:45:01',10552,'MARK_RAN','3:3d3b3a36eb78c97c58b86a081891a3a6','Custom SQL','Add global property for emr primary identifier type',NULL,'2.0.5'),('bahmni-clinical-201402201530','Angshu','liquibase.xml','2015-11-12 08:45:01',10553,'EXECUTED','3:7732759315b8a6f9a80b2d9511e65df3','Custom SQL','set global property value for emr primary identifier type',NULL,'2.0.5'),('bahmni-clinical-201402201700','D3','liquibase.xml','2015-11-12 08:45:01',10554,'EXECUTED','3:f40a6708845094ce8ce63ae5f380d06a','Custom SQL','Remove unused app:documents privilege',NULL,'2.0.5'),('bahmni-clinical-201402251700','Mihir,Vinay','liquibase.xml','2015-11-12 08:45:01',10555,'EXECUTED','3:a5681ca224c60d3e061c25b44963810f','Custom SQL','Add new concept to mark referred out tests',NULL,'2.0.5'),('bahmni-clinical-201402281633','Indraneel,Neha','liquibase.xml','2015-11-12 08:45:01',10556,'EXECUTED','3:dcaba2c3fdfec0163dc655ad0afb1082','Custom SQL','Add concept Lab Order Notes',NULL,'2.0.5'),('bahmni-clinical-201402281635','Indraneel,Neha','liquibase.xml','2015-11-12 08:45:01',10557,'EXECUTED','3:2e73b0f164e55c909b6e691876865e84','Custom SQL','Add concept-name Lab Order Notes',NULL,'2.0.5'),('bahmni-clinical-201403051245','Neha','liquibase.xml','2015-11-12 08:45:01',10558,'EXECUTED','3:3939c112bbe0258754c497ab69af6e12','Custom SQL','Delete concept Lab Order Notes',NULL,'2.0.5'),('bahmni-clinical-201403051246','Neha','liquibase.xml','2015-11-12 08:45:01',10559,'EXECUTED','3:329689d0b840f0e9a3986929ec73b5ac','Custom SQL','Add new concept to lab order notes',NULL,'2.0.5'),('bahmni-clinical-201408251220','D3','liquibase.xml','2015-11-12 08:48:17',10751,'EXECUTED','3:2a9c6f8331661177cb6790e285489b8c','Insert Row','',NULL,'2.0.5'),('bahmni-clinical-201502091501','Charles, Banka','liquibase.xml','2015-11-12 08:48:18',10832,'EXECUTED','3:6dd4a68e60bb3739959d4de690495665','Custom SQL','Adding Undo Discharge disposition',NULL,'2.0.5'),('bahmni-clinical-201521091403','Banka,Sravanthi','liquibase.xml','2015-11-12 08:51:22',10992,'EXECUTED','3:f14611cff91cb2ec630ef19c35b44f7d','Custom SQL','Add Patient-Listing role',NULL,'2.0.5'),('bahmni-clinical-201521091410','Banka,Sravanthi','liquibase.xml','2015-11-12 08:51:22',10994,'EXECUTED','3:e120a391b33ebb51d07890188a82b68a','Custom SQL','Add clinical read only role',NULL,'2.0.5'),('bahmni-clinical-201522091112','Banka,Sravanthi','liquibase.xml','2015-11-12 08:51:22',10996,'EXECUTED','3:95e65ab8523e33c46449a27529761564','Custom SQL','Add consultation save',NULL,'2.0.5'),('bahmni-clinical-201522091116','Banka,Sravanthi','liquibase.xml','2015-11-12 08:51:22',10998,'EXECUTED','3:ef2005859396b956f5cfff0faf01e86f','Custom SQL','Add consultation observation role',NULL,'2.0.5'),('bahmni-clinical-201522091120','Banka,Sravanthi','liquibase.xml','2015-11-12 08:51:22',11000,'EXECUTED','3:7b515e042e6a396312c570a483c16fb3','Custom SQL','Add consultation diagnosis role',NULL,'2.0.5'),('bahmni-clinical-201522091124','Banka,Sravanthi','liquibase.xml','2015-11-12 08:51:22',11002,'EXECUTED','3:3fde96338a056cd7a799030fc65c46b3','Custom SQL','Add consultation disposition role',NULL,'2.0.5'),('bahmni-clinical-201522091128','Banka,Sravanthi','liquibase.xml','2015-11-12 08:51:22',11004,'EXECUTED','3:401edbbbb5d76e58c10775c85e932678','Custom SQL','Add consultation treatment role',NULL,'2.0.5'),('bahmni-clinical-201522091132','Banka,Sravanthi','liquibase.xml','2015-11-12 08:51:22',11006,'EXECUTED','3:02ff4f8d72d613a2b1e4df41c1f2f774','Custom SQL','Add consultation orders role',NULL,'2.0.5'),('bahmni-clinical-3','tw','liquibase.xml','2015-11-12 08:45:01',10517,'EXECUTED','3:ff0ea55df8dd84badce2237d4eb70a7a','SQL From File','rel3',NULL,'2.0.5'),('bahmni-clinical-4','tw','liquibase.xml','2015-11-12 08:45:01',10518,'EXECUTED','3:b22c6c767be128f3128c7ea800e8b47e','SQL From File','rel3',NULL,'2.0.5'),('bahmni-clinical-5','tw','liquibase.xml','2015-11-12 08:45:01',10519,'EXECUTED','3:227ebbe447bd5b3e764f4e0bcfdbe021','SQL From File','rel3',NULL,'2.0.5'),('bahmni-clinical-6','Hemanth','liquibase.xml','2015-11-12 08:45:01',10530,'EXECUTED','3:c75b673e4419804e8aca3be5790f4053','Custom SQL','Add concept Adt Notes',NULL,'2.0.5'),('bahmni-clinical-7','Hemanth','liquibase.xml','2015-11-12 08:45:01',10531,'EXECUTED','3:28f7f98a4a673080c65343436365b87b','Custom SQL','Add concept-name Adt Notes',NULL,'2.0.5'),('bahmni-clinical-8','Praveen','liquibase.xml','2015-11-12 08:45:01',10532,'EXECUTED','3:3c50596a2f2c5bebd3c31fd35d1d5d0c','Custom SQL','Add encounter session duration',NULL,'2.0.5'),('bahmni-clinical-9','Praveen','liquibase.xml','2015-11-12 08:45:01',10533,'EXECUTED','3:6eac241cb62addb4c395842f456321ee','Custom SQL','Add custom encounter session matcher',NULL,'2.0.5'),('bahmni-clinical-retrospective-201501221417','Vikash, Sravanthi','liquibase.xml','2015-11-12 08:48:18',10831,'EXECUTED','3:0fd170a3d78b9b44204644a55cb58954','Insert Row','',NULL,'2.0.5'),('bahmni-core-201403110603','Hemanth','liquibase.xml','2015-11-12 08:45:01',10560,'EXECUTED','3:a7cf75e89024bba1b6d31d494ca8ece3','Custom SQL','Add new concept for test and panel',NULL,'2.0.5'),('bahmni-core-201403181515','Hemanth,Vinay','liquibase.xml','2015-11-12 08:45:01',10561,'EXECUTED','3:8f918521411f7968ab79f5baed8c18ce','Custom SQL','Add new concept for observation group (XCompoundObservation)',NULL,'2.0.5'),('bahmni-core-201403191516','tw','liquibase.xml','2015-11-12 08:45:01',10562,'EXECUTED','3:07f97c3416649d2ac9968c1a844ecf9c','SQL From File','Changing admitted patient search query',NULL,'2.0.5'),('bahmni-core-201403191725','Hemanth,Vinay','liquibase.xml','2015-11-12 08:45:01',10563,'EXECUTED','3:b354caabf0905f5a23a2b0cebfacb267','Custom SQL','Add new concept for observation group (XCompoundObservation)',NULL,'2.0.5'),('bahmni-core-201403251424','Mujir','liquibase.xml','2015-11-12 08:45:01',10564,'EXECUTED','3:92ba70a6b6e3fd8fde0f6b3b32318118','Custom SQL','Add new concept for Ruled Out Diagnosis',NULL,'2.0.5'),('bahmni-core-201404021353','Hemanth, Mihir','liquibase.xml','2015-11-12 08:45:01',10565,'EXECUTED','3:db0b6d363a7afd98272a64f7ebfc31d5','Custom SQL','adding givenNameLocal person attribute type',NULL,'2.0.5'),('bahmni-core-201404021359','Hemanth, Mihir','liquibase.xml','2015-11-12 08:45:01',10566,'EXECUTED','3:0b72981ca7294dc56cb2e2ecf387b183','Custom SQL','adding familyNameLocal person attribute type',NULL,'2.0.5'),('bahmni-core-201404021400','Hemanth, Mihir','liquibase.xml','2015-11-12 08:45:01',10567,'EXECUTED','3:565049e112d458b650b2612891d99225','Custom SQL','adding middleNameLocal person attribute type',NULL,'2.0.5'),('bahmni-core-201404081612','Indraneel, Mihir','liquibase.xml','2015-11-12 08:45:01',10570,'EXECUTED','3:5f00e15d25fb33cdcccd6e6c9497a896','Custom SQL','Adding Lab Manager Notes Concept',NULL,'2.0.5'),('bahmni-core-201404081624','Vivek, Shruthi','liquibase.xml','2015-11-12 08:45:01',10569,'EXECUTED','3:de1eb764ca23267d6367b552f5bafeb6','Custom SQL','Adding diagnosis meta data concepts',NULL,'2.0.5'),('bahmni-core-201404081625','Indraneel, Mihir','liquibase.xml','2015-11-12 08:45:01',10571,'EXECUTED','3:358898ceba2ae7ab1809cbc287880fc4','Custom SQL','Adding Lab Manager Notes Provider',NULL,'2.0.5'),('bahmni-core-201404091217','sushmitharaos, arathyjan','liquibase.xml','2015-11-12 08:45:01',10568,'EXECUTED','3:a62e2c394c0a0078c09a9f0bd57840e7','Insert Row','add encounter type for patient document upload',NULL,'2.0.5'),('bahmni-core-201404101558','Indraneel, Neha','liquibase.xml','2015-11-12 08:45:01',10572,'EXECUTED','3:48b91f5f30aa317e99a9f68e28efa3c4','Custom SQL','Adding Accession Uuid Concept',NULL,'2.0.5'),('bahmni-core-201404101600','Neha,Indraneel','liquibase.xml','2015-11-12 08:45:01',10573,'EXECUTED','3:014366343276fba18ee961dc2bb7d4dc','Custom SQL','Add Encounter Type Validation Notes',NULL,'2.0.5'),('bahmni-core-201404211500','RT, Shruthi','liquibase.xml','2015-11-12 08:45:01',10574,'EXECUTED','3:64b838a26669076ebcb6024a9f379803','Insert Row','add concept class Concept Attribute',NULL,'2.0.5'),('bahmni-core-201404281212','RT, Neha','liquibase.xml','2015-11-12 08:45:01',10575,'EXECUTED','3:00fc3bb8433b82881f19e12948b2f167','Custom SQL','add concept numeric feild to all numeric concepts',NULL,'2.0.5'),('bahmni-core-201404281819','RT, Mujir','liquibase.xml','2015-11-12 08:45:01',10576,'EXECUTED','3:1aff18cfedb228e447bf32a4b2a1da09','Insert Row','add concept class Abnormal',NULL,'2.0.5'),('bahmni-core-201404281820','RT, Mujir','liquibase.xml','2015-11-12 08:45:01',10577,'EXECUTED','3:4387bcba34e892eef9cb011d9e173125','Insert Row','add concept class Duration',NULL,'2.0.5'),('bahmni-core-201404281823','RT, Mujir','liquibase.xml','2015-11-12 08:45:01',10578,'EXECUTED','3:7cae6e5965378823cfcd5c756e20b984','SQL From File','add concept numeric proc',NULL,'2.0.5'),('bahmni-core-201404281825','RT, Mujir','liquibase.xml','2015-11-12 08:45:01',10579,'EXECUTED','3:3b70950b84cfb887e120ba3703f03d8b','Insert Row','add concept class Concept Details',NULL,'2.0.5'),('bahmni-core-201404301204','RT, Mujir','liquibase.xml','2015-11-12 08:45:01',10580,'EXECUTED','3:92ca76185ae9466fa1d67996263439aa','SQL From File','delete Concept Proc',NULL,'2.0.5'),('bahmni-core-201404301520','D3','liquibase.xml','2015-11-12 08:45:01',10581,'EXECUTED','3:95dbc7a307cda404901615be33a3c95d','Custom SQL','Configure EMR API admit and discharge encounter type',NULL,'2.0.5'),('bahmni-core-201405041511','Mujir','liquibase.xml','2015-11-12 08:48:17',10746,'MARK_RAN','3:4387bcba34e892eef9cb011d9e173125','Insert Row','add concept class Duration',NULL,'2.0.5'),('bahmni-core-201405061428','vinay','liquibase.xml','2015-11-12 08:45:01',10582,'EXECUTED','3:d7d68a7375b05440ca8bda373b4ac5fa','Custom SQL (x2)','Fix delete_concept',NULL,'2.0.5'),('bahmni-core-201405061543','mujir','liquibase.xml','2015-11-12 08:45:01',10585,'EXECUTED','3:2877b9c25cad758126432088e665ce9e','Custom SQL (x2)','Fix delete_concept. deleting concept set membership for the concept to be deleted.',NULL,'2.0.5'),('bahmni-core-201405071329','mujir','liquibase.xml','2015-11-12 08:45:01',10583,'EXECUTED','3:ee64ac25598217cc8c573909029dc1b2','Custom SQL','add adt notes data concept set',NULL,'2.0.5'),('bahmni-core-201405081436','mujir','liquibase.xml','2015-11-12 08:45:01',10584,'EXECUTED','3:bddad684724dec5a676c650bb36ec6d9','Custom SQL','remove adt notes data concept set',NULL,'2.0.5'),('bahmni-core-201405091936','rohan','liquibase.xml','2015-11-12 08:45:01',10586,'EXECUTED','3:934b844aa6789e274c71a45a1d3a3435','Custom SQL','Change sort weight for Admit Patients.',NULL,'2.0.5'),('bahmni-core-201405110939','rohan','liquibase.xml','2015-11-12 08:45:01',10587,'EXECUTED','3:7b9cc2d4c1ae2effbad88539be46f414','Custom SQL','Change sort weight for Discharge Patients.',NULL,'2.0.5'),('bahmni-core-201405110940','rohan','liquibase.xml','2015-11-12 08:45:01',10588,'EXECUTED','3:a7a3f5ff1d8092f32fbe32494c20b0e8','Custom SQL','Change sort weight for Transfer Patients.',NULL,'2.0.5'),('bahmni-core-201405131905','Mihir','liquibase.xml','2015-11-12 08:45:01',10589,'EXECUTED','3:031ecd47733b03253600c0ab9b80147c','Custom SQL','Add check for voided visits when fetching patients with active visits',NULL,'2.0.5'),('bahmni-core-201405161709','d3','liquibase.xml','2015-11-12 08:45:01',10590,'EXECUTED','3:752289f5803016fad52abe864a8278c5','Custom SQL','Update webservices.rest.maxResultsAbsolute to 1000',NULL,'2.0.5'),('bahmni-core-201405211239','d3','liquibase.xml','2015-11-12 08:45:01',10591,'EXECUTED','3:7f794f2e97397f6e73645e03b39b96f3','Custom SQL','Add global property bahmni.cacheHeadersFilter.expiresDuration',NULL,'2.0.5'),('bahmni-core-201405231142','rt','liquibase.xml','2015-11-12 08:45:01',10592,'EXECUTED','3:1351e0c31a1f16f980bd011bc1efba9a','Custom SQL','Update global property emrapi.sqlSearch.admittedPatients',NULL,'2.0.5'),('bahmni-core-201406161343','Bharti, Rohan','liquibase.xml','2015-11-12 08:45:01',10593,'EXECUTED','3:92025c1da5b63875e8d8e1e6f75688bf','Custom SQL','Update the global property for sql to get To Admit patients',NULL,'2.0.5'),('bahmni-core-201406161345','Bharti, Rohan','liquibase.xml','2015-11-12 08:45:01',10594,'EXECUTED','3:4b8d405f8513920c92ed55e9e5608ef2','Custom SQL','Update the global property for sql to get To Discharge patients',NULL,'2.0.5'),('bahmni-core-201407011716','Crude Oil with our names','liquibase.xml','2015-11-12 08:46:31',10719,'EXECUTED','3:50f3e10d1298194444378351763b2cad','Custom SQL','Add person name for lab and billing system users',NULL,'2.0.5'),('bahmni-core-201407141716','vinay','liquibase.xml','2015-11-12 08:46:31',10720,'EXECUTED','3:1b7bdedea1809fa49e2357d93d77667e','Custom SQL','New privileges added',NULL,'2.0.5'),('bahmni-core-201407141717','vinay','liquibase.xml','2015-11-12 08:46:31',10721,'EXECUTED','3:cdc8c96250bdd912a4ddb651455b1626','Custom SQL','New privileges added',NULL,'2.0.5'),('bahmni-core-201407141718','vinay','liquibase.xml','2015-11-12 08:46:31',10722,'EXECUTED','3:35fb7afbad0ecf4121535a78d37d434d','Custom SQL','New privileges added',NULL,'2.0.5'),('bahmni-core-201407161230','Rohan,Indraneel','liquibase.xml','2015-11-12 08:46:31',10723,'EXECUTED','3:7bf3cd7d49ce7dafffe72f374be18ef7','Custom SQL','Global property pointing to the new encounter provider only session matcher',NULL,'2.0.5'),('bahmni-core-201407161630','Vinay','liquibase.xml','2015-11-12 08:46:31',10724,'EXECUTED','3:896c71a461a51901e495846d9568e544','Custom SQL','Set dosing type and dosing instructions',NULL,'2.0.5'),('bahmni-core-201407171215','Vinay,Indraneel','liquibase.xml','2015-11-12 08:47:12',10733,'EXECUTED','3:0275db96cf7766acc2e567c277f33764','Custom SQL','Adding concepts and concept set related to dosing units',NULL,'2.0.5'),('bahmni-core-201407171300','Vinay, Indraneel','liquibase.xml','2015-11-12 08:47:12',10734,'EXECUTED','3:54519e86ea15b431d784b19eff6067b7','Custom SQL','Add drug routes and set global property',NULL,'2.0.5'),('bahmni-core-201407171606','Rohan, D3','liquibase.xml','2015-11-12 08:46:31',10725,'EXECUTED','3:b556c13ad3d26a0f3c9eed4f1382a7ae','Insert Row','add concept class Image',NULL,'2.0.5'),('bahmni-core-201407171700','Vinay, Indraneel','liquibase.xml','2015-11-12 08:47:12',10735,'EXECUTED','3:de28ce73c4e41ade2f900d398d9753da','Custom SQL','Adding duration unit concepts and setting up associated global property',NULL,'2.0.5'),('bahmni-core-201407171715','Vinay, Indraneel','liquibase.xml','2015-11-12 08:47:12',10736,'EXECUTED','3:12d3502354c39fd991e9afc00acc3d47','Custom SQL','',NULL,'2.0.5'),('bahmni-core-201407180800','Shruthi','liquibase.xml','2015-11-12 08:46:31',10726,'EXECUTED','3:e0046ba1e9356e7aa14ccf0528d1ef29','Insert Row','add concept class Computed',NULL,'2.0.5'),('bahmni-core-201407221627','Rohan, Shruthi','liquibase.xml','2015-11-12 08:46:31',10727,'EXECUTED','3:ae9d9db98dd6afb973e032c3823a32c0','Custom SQL','Update custom encounter session matcher',NULL,'2.0.5'),('bahmni-core-201407221628','Rohan, Shruthi','liquibase.xml','2015-11-12 08:46:31',10728,'EXECUTED','3:fa1b0ddecdad7fb9ddf999b5d1400c73','Custom SQL','Update custom encounter session matcher',NULL,'2.0.5'),('bahmni-core-201407251510','D3','liquibase.xml','2015-11-12 08:46:31',10729,'EXECUTED','3:acf71b92965d81b21ef014bb4420423e','Custom SQL','Set quantity for drug orders without this data',NULL,'2.0.5'),('bahmni-core-201407251511','D3','liquibase.xml','2015-11-12 08:47:12',10732,'EXECUTED','3:605537996398b795b128d19a73a6861f','Custom SQL','Set num_refills for drug orders without this data',NULL,'2.0.5'),('bahmni-core-201407291254','Vinay, Deepak','liquibase.xml','2015-11-12 08:47:12',10737,'EXECUTED','3:c5fb8666de9d6276605c2967e0b63a07','Custom SQL','',NULL,'2.0.5'),('bahmni-core-201408111300','Indraneel','liquibase.xml','2015-11-12 08:47:12',10738,'EXECUTED','3:6eb4aee038ee589bf2e94b5849781993','Custom SQL','Adding all templates concept set of sets',NULL,'2.0.5'),('bahmni-core-201408130010','Mujir','liquibase.xml','2015-11-12 08:48:17',10748,'EXECUTED','3:4634c70a8714f77cc4f09f75a46c35cf','Create Table','',NULL,'2.0.5'),('bahmni-core-20140814132600','Rohan, Vinay','liquibase.xml','2015-11-12 08:48:17',10747,'EXECUTED','3:4b2d7c60345d83f405fc7d568782d974','Custom SQL','Update Dosing type from ENUM to Class Name',NULL,'2.0.5'),('bahmni-core-201408180936','Mujir, Mihir','liquibase.xml','2015-11-12 08:48:17',10749,'EXECUTED','3:8345ac4cbbbe7691f7d51bb463e05e33','Custom SQL','Add directory for imported files',NULL,'2.0.5'),('bahmni-core-201408251140','Sravanthi,Indraneel','liquibase.xml','2015-11-12 08:48:17',10750,'EXECUTED','3:a01a6c591d40a29a8d2e551529d9ea24','Custom SQL','Introducing Obs relationship type and obs relationship tables',NULL,'2.0.5'),('bahmni-core-201408251455','Rohan','liquibase.xml','2015-11-12 08:48:17',10752,'EXECUTED','3:bfb4ec1cd7176b82015430375f808ff7','Insert Row','add concept class URL',NULL,'2.0.5'),('bahmni-core-201408251456','Rohan','liquibase.xml','2015-11-12 08:48:17',10753,'EXECUTED','3:9270f8241c0bcc95aae7c60a990ab009','Custom SQL','Add new concept LAB REPORT for uploaded file',NULL,'2.0.5'),('bahmni-core-201409041224','Banka','liquibase.xml','2015-11-12 08:48:17',10754,'EXECUTED','3:5314334d0e48280727b45a8f22b34656','Insert Row','Add View Location privilege to Anonymous',NULL,'2.0.5'),('bahmni-core-201409041530','Rohan, Sravanthi','liquibase.xml','2015-11-12 08:48:17',10764,'EXECUTED','3:fe380da25273bd4b920df5637e4c9cb2','Custom SQL','Adding hours, weeks and months concepts for drug order duration units',NULL,'2.0.5'),('bahmni-core-201409081432','Rohan, Vinay','liquibase.xml','2015-11-12 08:48:17',10766,'EXECUTED','3:917f62fb045c3d4202989f959bfdf442','Custom SQL, SQL From File','rel2',NULL,'2.0.5'),('bahmni-core-20140908172845','Indraneel, Hemanth','liquibase.xml','2015-11-12 08:48:17',10769,'EXECUTED','3:e57f6102ea40940c68b275b88d642cfc','Custom SQL','Add Impression concept',NULL,'2.0.5'),('bahmni-core-201409091224','Mihir, Shruthi','liquibase.xml','2015-11-12 08:48:17',10765,'EXECUTED','3:70f412df64a299dbe9095f23e2210337','Custom SQL','Removing global property for encounter provider matcher',NULL,'2.0.5'),('bahmni-core-201409111200','Rohan, Vinay','liquibase.xml','2015-11-12 08:48:17',10767,'EXECUTED','3:f660b79706d6f01b191fb373ad9435b5','Custom SQL','Adding tablet and capsule concepts to dosing units',NULL,'2.0.5'),('bahmni-core-201409161415','Indraneel','liquibase.xml','2015-11-12 08:48:17',10770,'EXECUTED','3:282e2d5bec259d3eee586166f59dd687','Custom SQL','Adding obs relationship type : qualified-by',NULL,'2.0.5'),('bahmni-core-201409171047','Rohan, Hemanth','liquibase.xml','2015-11-12 08:48:17',10771,'EXECUTED','3:2e9fffc9eb0bec612e04cb7803c233a9','Custom SQL, SQL From File','Fix the new add_concept procedure',NULL,'2.0.5'),('bahmni-core-201409171530','D3','liquibase.xml','2015-11-12 08:48:17',10772,'EXECUTED','3:0c23ec6c66daaf133bd9ce23bcf7a7e8','Update Data','Rename OPD encounter type to Consultation',NULL,'2.0.5'),('bahmni-core-201409241028','Hemanth','liquibase.xml','2015-11-12 08:48:17',10755,'EXECUTED','3:a52883341c3b7bcefeb8689816098bf3','Custom SQL','Insert concept reference source for Duration units',NULL,'2.0.5'),('bahmni-core-201409241048','Hemanth','liquibase.xml','2015-11-12 08:48:17',10756,'EXECUTED','3:d755817db3f8a70bee6a7104446c82ea','Custom SQL','Insert concept reference term for Second(s)',NULL,'2.0.5'),('bahmni-core-201409241115','Hemanth','liquibase.xml','2015-11-12 08:48:17',10757,'EXECUTED','3:017e0e35c9599f0ad837e4fa5c4b944f','Custom SQL','Insert concept reference term for Minute(s)',NULL,'2.0.5'),('bahmni-core-201409241116','Hemanth','liquibase.xml','2015-11-12 08:48:17',10758,'EXECUTED','3:634ea355d327fac9b885f077f43e0a10','Custom SQL','Insert concept reference term for Hour(s)',NULL,'2.0.5'),('bahmni-core-201409241117','Hemanth','liquibase.xml','2015-11-12 08:48:17',10759,'EXECUTED','3:492b1d5c124c0eebf66b0f1d202ce6a7','Custom SQL','Insert concept reference term for Day(s)',NULL,'2.0.5'),('bahmni-core-201409241119','Hemanth','liquibase.xml','2015-11-12 08:48:17',10760,'EXECUTED','3:3bd0859c6ee97249a0b480340dd94157','Custom SQL','Insert concept reference term for Week(s)',NULL,'2.0.5'),('bahmni-core-201409241120','Hemanth','liquibase.xml','2015-11-12 08:48:17',10761,'EXECUTED','3:504e20ad4760ce186fe3c3bbc0ce72cf','Custom SQL','Insert concept reference term for Month(s)',NULL,'2.0.5'),('bahmni-core-201409241122','Hemanth','liquibase.xml','2015-11-12 08:48:17',10762,'EXECUTED','3:b3dd815d38fd788346eb1698e059e65b','Custom SQL','Insert concept reference term for Year(s)',NULL,'2.0.5'),('bahmni-core-201409241123','Hemanth','liquibase.xml','2015-11-12 08:48:17',10763,'EXECUTED','3:2200e99bc72d84b0d8943d6f5ed3f6c4','Custom SQL','Insert concept reference term for Time(s)',NULL,'2.0.5'),('bahmni-core-201409241126','Hemanth','liquibase.xml','2015-11-12 08:48:17',10773,'EXECUTED','3:3217972efe467098854e3c9aef041997','Custom SQL','Update hl7_code for concept reference source \'ISO 8601 Duration\'',NULL,'2.0.5'),('bahmni-core-201409241137','Hemanth','liquibase.xml','2015-11-12 08:48:17',10774,'EXECUTED','3:37817503da1a1c1ae344a405f4bac33a','Custom SQL','Update code for concept reference term \'Second(s)\'',NULL,'2.0.5'),('bahmni-core-201409241138','Hemanth','liquibase.xml','2015-11-12 08:48:17',10775,'EXECUTED','3:062aa018bb9de732d8a2931e7d318c65','Custom SQL','Update code for concept reference term \'Minute(s)\'',NULL,'2.0.5'),('bahmni-core-201409241139','Hemanth','liquibase.xml','2015-11-12 08:48:17',10776,'EXECUTED','3:43cc47425272c2a5c556822f09f71664','Custom SQL','Update code for concept reference term \'Hour(s)\'',NULL,'2.0.5'),('bahmni-core-201409241140','Hemanth','liquibase.xml','2015-11-12 08:48:17',10777,'EXECUTED','3:33a385e72bbc4c7fc51ca97c262c0ac6','Custom SQL','Update code for concept reference term \'Day(s)\'',NULL,'2.0.5'),('bahmni-core-201409241141','Hemanth','liquibase.xml','2015-11-12 08:48:17',10778,'EXECUTED','3:2285903234ce86b7ff5b0e85b8362ee3','Custom SQL','Update code for concept reference term \'Week(s)\'',NULL,'2.0.5'),('bahmni-core-201409241142','Hemanth','liquibase.xml','2015-11-12 08:48:17',10779,'EXECUTED','3:7318ad8dd850b67974c10ca515e9eee3','Custom SQL','Update code for concept reference term \'Month(s)\'',NULL,'2.0.5'),('bahmni-core-201409241143','Hemanth','liquibase.xml','2015-11-12 08:48:17',10780,'EXECUTED','3:4b36f0c93fa37c26f070f515bcf90f4f','Custom SQL','Update code for concept reference term \'Year(s)\'',NULL,'2.0.5'),('bahmni-core-201409241144','Hemanth','liquibase.xml','2015-11-12 08:48:17',10781,'EXECUTED','3:a31b734f90d0bdceb02eb121d545b12d','Custom SQL','Update code for concept reference term \'Time(s)\'',NULL,'2.0.5'),('bahmni-core-201409241241','Hemanth','liquibase.xml','2015-11-12 08:48:17',10782,'EXECUTED','3:a2fdf0b98ce6e647a67fcf72d1602c2a','Custom SQL','Update name for concept reference source \'ISO 8601 Duration\'',NULL,'2.0.5'),('bahmni-core-201409242241','Mihir','liquibase.xml','2015-11-12 08:48:17',10783,'EXECUTED','3:85f1c39ec6e637168365072e127ae614','Custom SQL','Add concept class for lab samples',NULL,'2.0.5'),('bahmni-core-201409242242','Mihir','liquibase.xml','2015-11-12 08:48:17',10784,'EXECUTED','3:92951fdf76763a1f103aab84039c954b','Custom SQL','Add concept class for lab samples',NULL,'2.0.5'),('bahmni-core-201409242248','Mihir','liquibase.xml','2015-11-12 08:48:17',10785,'EXECUTED','3:d47ca3bee89798ca0536a1f10ea4ef26','Custom SQL','Migrate sample concepts to concept class sample',NULL,'2.0.5'),('bahmni-core-201409242256','Mihir','liquibase.xml','2015-11-12 08:48:17',10786,'EXECUTED','3:32ad984ea5e58c269236f0749cf4e48b','Custom SQL','Migrate department concepts to concept class department',NULL,'2.0.5'),('bahmni-core-201409242259','Mihir','liquibase.xml','2015-11-12 08:48:17',10787,'EXECUTED','3:c0673760d0e658fe57e5f3ef6b33e4ee','Custom SQL','Rename Laboratory concept to Lab Samples',NULL,'2.0.5'),('bahmni-core-201409291027','Chethan,Banka','liquibase.xml','2015-11-12 08:48:17',10789,'EXECUTED','3:84a5e078a1a51d9660ccc15c22de28a5','Custom SQL','Adding concepts and concept set related to dosing units',NULL,'2.0.5'),('bahmni-core-201409291037','Chethan, Banka','liquibase.xml','2015-11-12 08:48:17',10790,'EXECUTED','3:19a7fca2175a4d086a1d287c1fc16a2e','Custom SQL','Adding order frequencies',NULL,'2.0.5'),('bahmni-core-201409291106','Chethan,Banka','liquibase.xml','2015-11-12 08:48:17',10791,'EXECUTED','3:639dc8eb7af443e834803df9f4d68640','Custom SQL','Add drug routes and delete Percutaneous Endoscopic Gastrostomy',NULL,'2.0.5'),('bahmni-core-201409291458','Chethan,Banka','liquibase.xml','2015-11-12 08:48:17',10792,'EXECUTED','3:79f42ff307a4f1e360b2bb662d857503','Custom SQL','Adding concepts and concept set related to quantity units',NULL,'2.0.5'),('bahmni-core-201409291704','Chethan,Banka','liquibase.xml','2015-11-12 08:48:17',10793,'EXECUTED','3:d2cf22581d5d4e27461e29922e989ad6','Custom SQL','Changing names for Duration Units, Dose Units',NULL,'2.0.5'),('bahmni-core-201409291720','Chethan,Banka','liquibase.xml','2015-11-12 08:48:17',10794,'EXECUTED','3:02b03571686d026827b06aeac801f33f','Custom SQL','Changing sort order for dose units',NULL,'2.0.5'),('bahmni-core-201409291830','Indraneel','liquibase.xml','2015-11-12 08:48:17',10788,'EXECUTED','3:cf2510d1515e0be6877365aa75e18dda','Custom SQL','Adding All Disease Templates Concept Set',NULL,'2.0.5'),('bahmni-core-201409301255','Chethan,Banka','liquibase.xml','2015-11-12 08:48:17',10795,'EXECUTED','3:5ece24df97ddfc91a7e0dac70970420a','Custom SQL','Changing sort order for dose quantity units',NULL,'2.0.5'),('bahmni-core-201410061440','Chethan, Banka','liquibase.xml','2015-11-12 08:51:22',10981,'EXECUTED','3:46d150e6535dce6a39468ede129b5971','Update Data','Updating GP encounter feed publish url to publish BahmniEncounterTransaction',NULL,'2.0.5'),('bahmni-core-201410071237','D3,Arun','liquibase.xml','2015-11-12 08:48:18',10796,'EXECUTED','3:f66d3924fa8cedc2bf684f3b63661df2','Custom SQL','Add index for orders date_activated',NULL,'2.0.5'),('bahmni-core-201410101048','Rohan, Chethan','liquibase.xml','2015-11-12 08:48:18',10797,'EXECUTED','3:e2ec1e578015fb9f9e57bf1a9d4c9f6c','Custom SQL','Remove class name of reference data feed task and failed event task.',NULL,'2.0.5'),('bahmni-core-201410101436','banka','liquibase.xml','2015-11-12 08:48:18',10798,'EXECUTED','3:49bcfd5ece7864cf1fea3ff911cac945','Custom SQL','Add role for clinical read only access',NULL,'2.0.5'),('bahmni-core-201410101440','banka','liquibase.xml','2015-11-12 08:48:18',10799,'EXECUTED','3:89820b864e5a6b5d8a78cec170a389f4','Custom SQL','Add role for clinical full access',NULL,'2.0.5'),('bahmni-core-201410101446','banka','liquibase.xml','2015-11-12 08:48:18',10805,'EXECUTED','3:08eb29e78b128ef927ef0b0bdc7ebdb3','Custom SQL','Add privileges for clinical read only',NULL,'2.0.5'),('bahmni-core-201410101530','banka','liquibase.xml','2015-11-12 08:48:18',10806,'EXECUTED','3:ec590bd2a83b0e5d853456ad298d9b51','Custom SQL','Add privileges for clinical full access',NULL,'2.0.5'),('bahmni-core-201410151040','Mihir, Bharti','liquibase.xml','2015-11-12 08:48:18',10807,'EXECUTED','3:9fb176d07517057d53d58fa041632507','Custom SQL','Rename Laboratory concept to Lab Samples',NULL,'2.0.5'),('bahmni-core-201410151525','Rohan, Hemanth','liquibase.xml','2015-11-12 08:48:18',10800,'EXECUTED','3:eaa11859b70513eb63c8d92bcf5ec93e','Custom SQL','',NULL,'2.0.5'),('bahmni-core-201410151526','Rohan, Hemanth','liquibase.xml','2015-11-12 08:48:18',10801,'EXECUTED','3:bf69c8d3b45b9b5afa53eb61b05dd9c9','Custom SQL','',NULL,'2.0.5'),('bahmni-core-201410151527','Rohan, Hemanth','liquibase.xml','2015-11-12 08:48:18',10802,'EXECUTED','3:c62611f7fde198bf9f8f313c8f45a152','Custom SQL','',NULL,'2.0.5'),('bahmni-core-201410151528','Rohan, Hemanth','liquibase.xml','2015-11-12 08:48:18',10803,'EXECUTED','3:e9f0181382af2500fca26a23a101b72c','Custom SQL','',NULL,'2.0.5'),('bahmni-core-201410151529','Rohan, Hemanth','liquibase.xml','2015-11-12 08:48:18',10804,'EXECUTED','3:5732866304d64c3c09b0f7d33bd4c597','Custom SQL','',NULL,'2.0.5'),('bahmni-core-201410211423','d3, rohan','liquibase.xml','2015-11-12 08:48:18',10808,'EXECUTED','3:8ae3539c536db5b1764383bf375b1b9e','Custom SQL','Set global property default_locale to en',NULL,'2.0.5'),('bahmni-core-201410301713','Vinay','liquibase.xml','2015-11-12 08:48:18',10809,'EXECUTED','3:57931e6b3ca38718868e5ab6816178d4','Custom SQL, SQL From File','Fix the new add_concept procedure',NULL,'2.0.5'),('bahmni-core-201411031108','Vinay, sravanthi','liquibase.xml','2015-11-12 08:48:18',10810,'EXECUTED','3:b776c63935051e50c3a6843e15385e29','Custom SQL','Adding new concept for Tablet as drug form',NULL,'2.0.5'),('bahmni-core-201411031129','Vinay, sravanthi','liquibase.xml','2015-11-12 08:48:18',10811,'EXECUTED','3:d7739d182bb0c0a5f6a33956a4603fba','Custom SQL','Adding new concept for Capsule as drug form',NULL,'2.0.5'),('bahmni-core-201411031131','Vinay, sravanthi','liquibase.xml','2015-11-12 08:48:18',10812,'EXECUTED','3:1cf139ef7639540526e88d252ce0af87','Custom SQL','Update drug table to use the new drug forms created',NULL,'2.0.5'),('bahmni-core-201411041237','Vinay','liquibase.xml','2015-11-12 08:48:18',10813,'EXECUTED','3:2c9da09899bc00752594c4e392c6c63c','Custom SQL','Ensure drug orders are always in units',NULL,'2.0.5'),('bahmni-core-201411041711','Vinay','liquibase.xml','2015-11-12 08:48:18',10814,'EXECUTED','3:0b73f2814a7c5ad62289161c95b219aa','Custom SQL','Make sure doseUnits and dosingInstructions for reverse synced drug orders are sane',NULL,'2.0.5'),('bahmni-core-201411051148','Rohan','liquibase.xml','2015-11-12 08:48:18',10815,'EXECUTED','3:4ee59ead112dd07062881f76eefa80cc','Custom SQL','Add concept class LabTest',NULL,'2.0.5'),('bahmni-core-201411051149','Rohan','liquibase.xml','2015-11-12 08:48:18',10816,'EXECUTED','3:2c9d283f4944a421b69b9f0525c56213','Custom SQL','Add concept class Radiology',NULL,'2.0.5'),('bahmni-core-201411061606','Vinay, Mihir','liquibase.xml','2015-11-12 08:48:18',10817,'EXECUTED','3:5db4ef15d594ec4dae9011474ae63e5d','Insert Row','Default chunking history entry if doesn\'t exist.',NULL,'2.0.5'),('bahmni-core-201411131512','D3','liquibase.xml','2015-11-12 08:48:18',10818,'EXECUTED','3:949668dcd8829d9c6afdf03fece00830','Custom SQL','Add drug routes Topical, Nasal, Inhalation',NULL,'2.0.5'),('bahmni-core-201411141310','D3','liquibase.xml','2015-11-12 08:48:18',10819,'EXECUTED','3:6188bf0917228defa2c058eb141f90df','Custom SQL, SQL From File','Fix the new add_concept procedure',NULL,'2.0.5'),('bahmni-core-201411141315','D3','liquibase.xml','2015-11-12 08:48:18',10820,'EXECUTED','3:809f03e798fc7bb172ed69ed2860d093','Custom SQL','Fix concepts created in liquibase without uuid',NULL,'2.0.5'),('bahmni-core-201412031050','Swathi','liquibase.xml','2015-11-12 08:48:18',10821,'EXECUTED','3:c114f261f1e82d4f5ac1b4329df5136c','Custom SQL','',NULL,'2.0.5'),('bahmni-core-201412051745','Rohan','liquibase.xml','2015-11-12 08:48:18',10823,'EXECUTED','3:8cdef3e773c916485e3e2971b3a94ac5','Custom SQL','Add concept class Computed/Editable',NULL,'2.0.5'),('bahmni-core-201412132014','Mihir','liquibase.xml','2015-11-12 08:48:18',10822,'EXECUTED','3:526c9878b1f0e2f406aec4938926498f','Custom SQL','Adding Immediately as Order Frequency',NULL,'2.0.5'),('bahmni-core-201412160932','Rohan, Shruthi','liquibase.xml','2015-11-12 08:48:18',10824,'EXECUTED','3:a1b4545142fc7e8ab6c7907e92e1edb5','Custom SQL','Adding minutes concept for drug order duration units',NULL,'2.0.5'),('bahmni-core-201412171832','Mujir, Mihir','liquibase.xml','2015-11-12 08:48:18',10825,'EXECUTED','3:1a1102e199808b8532cde54d8ffb449f','Custom SQL','Adding Admission Decision concept reference term and mapping for close visit task',NULL,'2.0.5'),('bahmni-core-201412171835','Mujir, Mihir','liquibase.xml','2015-11-12 08:48:18',10826,'EXECUTED','3:425fad3bde2745adc7912cddd74dfb31','Custom SQL','Adding Deny Admission concept reference term and mapping for close visit task',NULL,'2.0.5'),('bahmni-core-201412181423','Rohan','liquibase.xml','2015-11-12 08:48:18',10827,'EXECUTED','3:f3566ac13b2a0913110b3d0da179e99f','Custom SQL','Set global property allow_groovy_caching to true',NULL,'2.0.5'),('bahmni-core-201412311031','Mihir','liquibase.xml','2015-11-12 08:48:18',10828,'EXECUTED','3:4c2ab825426999b4037151677e9b7f77','Custom SQL','Add Login Location Tag if not already added.',NULL,'2.0.5'),('bahmni-core-201501071717','Vikash,Indraneel','liquibase.xml','2015-11-12 08:48:18',10829,'EXECUTED','3:f30ed61c34af7d08cc4e5c2aea4b4e87','Custom SQL','Adding Order Attributes concept set',NULL,'2.0.5'),('bahmni-core-201501192149','Sravanthi','liquibase.xml','2015-11-12 08:48:18',10830,'EXECUTED','3:503c09053a2a3e1db2ebf5d58e5d7c6e','Insert Row','add concept class Case Intake',NULL,'2.0.5'),('bahmni-core-201503101702','Sravanthi, Charles','liquibase.xml','2015-11-12 08:51:22',10833,'RERAN','3:6c2f4345e5d9a8569864b2eb93983ca5','SQL From File','Sql file for getting all wards, beds and related patients info',NULL,'2.0.5'),('bahmni-core-201503270552','Sandeep, Hemanth','liquibase.xml','2015-11-12 08:48:18',10834,'EXECUTED','3:36ad0e08bb219e07e218a3ea8947606a','Insert Row','Adding privilege for dispensing drug orders.',NULL,'2.0.5'),('bahmni-core-201503270603','Sandeep, Hemanth','liquibase.xml','2015-11-12 08:48:18',10835,'EXECUTED','3:fb5fbba932778a9b839c1eb43d979662','Custom SQL','Adding dispensed drug order attribute',NULL,'2.0.5'),('bahmni-core-201504031424','Banka, Preethi','liquibase.xml','2015-11-12 08:48:18',10836,'EXECUTED','3:0a41bb59bdbb834e36d86358e00fb605','Custom SQL','Chaning colume type of property_value in user_property to text',NULL,'2.0.5'),('bahmni-core-201504061124','Charles, Swathi','liquibase.xml','2015-11-12 08:48:18',10837,'EXECUTED','3:84d6a273c419907fd2f3c535505986d6','Insert Row','Adding privilege for bi-directional navigation between registration and consultation.',NULL,'2.0.5'),('bahmni-core-201504070220','Preethi, Hemanth','liquibase.xml','2015-11-12 08:48:18',10838,'EXECUTED','3:8a9b560ebf4e1ca0880ea48fa84139dd','Custom SQL','Creating Visit Status as visit attribute',NULL,'2.0.5'),('bahmni-core-201504131627','Soumya, Charles','liquibase.xml','2015-11-12 08:48:18',10839,'EXECUTED','3:6e5d87b1d718758aafcb26342c797e8d','Insert Row','Adding Close Visit Privilege',NULL,'2.0.5'),('bahmni-core-201504231857','Charles, JP','liquibase.xml','2015-11-12 08:48:18',10840,'EXECUTED','3:a0c246e51ee870f42ae871bbd02bf74d','Insert Row','',NULL,'2.0.5'),('bahmni-core-201505080200','Hemanth','liquibase.xml','2015-11-12 08:48:18',10842,'EXECUTED','3:454f2cf8f62168eb31935c8e6a40d30b','Custom SQL','Creating Admission Status as visit attribute',NULL,'2.0.5'),('bahmni-core-201505081250','JP','liquibase.xml','2015-11-12 08:48:18',10841,'EXECUTED','3:58927eb18fddf0c3eb0ee82cb8a7ef67','Insert Row','',NULL,'2.0.5'),('bahmni-core-201505121055','Vikash, Achinta','liquibase.xml','2015-11-12 08:48:18',10843,'EXECUTED','3:41a059203d80ce0edf170042ee1ca7a8','Insert Row','Adding privilege for provider.',NULL,'2.0.5'),('bahmni-core-201505171743','Bharat','liquibase.xml','2015-11-12 08:48:18',10844,'EXECUTED','3:6e83dcdbf780e43f18743669b7707e0c','Custom SQL','Associating LabSet and LabTest concept classes to Lab Order order type',NULL,'2.0.5'),('bahmni-core-201505171755','Bharat','liquibase.xml','2015-11-12 08:48:18',10845,'EXECUTED','3:599b7a19d01dcb35ddf52c9349b2574b','Custom SQL','Adding \'All Orderables\' concept set and associating Lab Samples to it.',NULL,'2.0.5'),('bahmni-core-201505171808','Bharat','liquibase.xml','2015-11-12 08:48:18',10846,'EXECUTED','3:ecb11a6c09e44e528e35b8ab0800d9cd','Custom SQL','Adding a display name for Lab Samples concept on UI',NULL,'2.0.5'),('bahmni-core-201505251642','Ranganathan','liquibase.xml','2015-11-12 08:48:18',10847,'EXECUTED','3:1c6fa1b0f1592a1f4b6688ffa3be3429','Custom SQL','Adding gender values and codes used across MRS',NULL,'2.0.5'),('bahmni-core-201506011729','Preethi, Gautam','liquibase.xml','2015-11-12 08:48:18',10850,'EXECUTED','3:3274243cd9e1b0e4bcec701cb1c1d2c4','Custom SQL','Changing short name for Lab Samples concept on UI',NULL,'2.0.5'),('bahmni-core-201506011804','Preethi, Gautam','liquibase.xml','2015-11-12 08:48:18',10851,'EXECUTED','3:ed61279e765ce09ce44f4cd5662da89c','Custom SQL','Changing description for LabSet concept class to Panels',NULL,'2.0.5'),('bahmni-core-201506180200','Chethan, Preethi','liquibase.xml','2015-11-12 08:48:18',10852,'EXECUTED','3:00f351b770b22396b03c7ee07634fbd6','Custom SQL','Global property for default encounter type.',NULL,'2.0.5'),('bahmni-core-201506221230','Hemanth, Preethi','liquibase.xml','2015-11-12 08:48:18',10853,'EXECUTED','3:718ce3df908ca849e243aad4facd45df','Custom SQL','Getting rid of the revese sync schedulers for Drug.',NULL,'2.0.5'),('bahmni-core-201506251230','Ranganathan, Charles','liquibase.xml','2015-11-12 08:48:18',10854,'EXECUTED','3:9a5d4e344ebd851e8b30992a1ecd031b','Custom SQL','Cleaning up relationships types for the relationships.',NULL,'2.0.5'),('bahmni-core-201507161455','Abishek','liquibase.xml','2015-11-12 08:48:18',10859,'EXECUTED','3:ed677e838d8e5f7d5e88cbad1a229b66','Custom SQL','Associating LabSet and LabTest concept classes to Order order type',NULL,'2.0.5'),('bahmni-core-201507161455','Abishek, Vikash','liquibase.xml','2015-11-12 08:48:18',10857,'EXECUTED','3:3d9af265aaa57522db48ae75c1ab9157','Custom SQL','Moving to order from test_order',NULL,'2.0.5'),('bahmni-core-201507271600','Swathi, Charles','liquibase.xml','2015-11-12 08:48:18',10860,'EXECUTED','3:de22b0233b080ebf960e63e64f260e00','Custom SQL','Adding Telephone Number person attribute type',NULL,'2.0.5'),('bahmni-core-201507271605','Swathi, Charles','liquibase.xml','2015-11-12 08:48:18',10861,'EXECUTED','3:61e9309e9bf001527e3a99a1adda56ef','Custom SQL','Adding Unknown patient person attribute type',NULL,'2.0.5'),('bahmni-core-201507311820','Hemanth','liquibase.xml','2015-11-12 08:48:18',10863,'EXECUTED','3:fa8e55f7de2fbf50f8412b7c210935ea','SQL From File','Optimised the high risk patient sql to consider latest test value',NULL,'2.0.5'),('bahmni-core-201508180000','Banka, Swathi','liquibase.xml','2015-11-12 08:51:22',10982,'EXECUTED','3:8b2a8442b05f979c678ff0dfe15ccb5f','Custom SQL','Changing the OrderType name for lab order from Order to Lab Order',NULL,'2.0.5'),('bahmni-core-201508181421','Padma, Shireesha','liquibase.xml','2015-11-12 08:51:22',10983,'EXECUTED','3:95360f885d7148080651c9a6877da677','Custom SQL','Adding global property for Reason for death',NULL,'2.0.5'),('bahmni-core-201508211600','Vikash, Abishek','liquibase.xml','2015-11-12 08:51:22',10984,'EXECUTED','3:5ed53ac922e9fc936397275aec6e60f6','Custom SQL','Updating column stage_name of import_status table',NULL,'2.0.5'),('bahmni-core-201508310334','Padma','liquibase.xml','2015-11-12 08:51:22',10985,'EXECUTED','3:20549d7d7804d2d89634ea9704ac5c04','Custom SQL','Deleting bahmnicore.relationshipTypeMap from global property',NULL,'2.0.5'),('bahmni-core-201509231746','Swathi, Jaswanth','liquibase.xml','2015-11-12 08:51:22',10990,'EXECUTED','3:6508854072b041e561e9f77cfc7d7597','Custom SQL','Deleting Telephone Number person attribute type',NULL,'2.0.5'),('bahmni-core-201509231749','Swathi, Jaswanth','liquibase.xml','2015-11-12 08:51:22',10991,'EXECUTED','3:569ad5cc3dd69532b314d4ded22b52fe','Custom SQL','Deleting Unknown patient person attribute type',NULL,'2.0.5'),('bahmni-core-201509301203','Chethan, Sourav','liquibase.xml','2015-11-12 08:51:23',11008,'EXECUTED','3:dcec039ea0c79d77e6664f3c4f866dd1','Custom SQL','',NULL,'2.0.5'),('bahmni-core-201521091408','Banka,Sravanthi','liquibase.xml','2015-11-12 08:51:22',10993,'EXECUTED','3:b9381f69cdc3cfe9b8733f423811f96a','Custom SQL','Add privileges for patient listing',NULL,'2.0.5'),('bahmni-core-201521091414','Banka,Sravanthi','liquibase.xml','2015-11-12 08:51:22',10995,'EXECUTED','3:bb18a788e846f3e1e79619a1bca94c4c','Custom SQL','Add privileges for clinical read only',NULL,'2.0.5'),('bahmni-core-201522091114','Banka,Sravanthi','liquibase.xml','2015-11-12 08:51:22',10997,'EXECUTED','3:73afdba961d6be7a0231f50a7b83071d','Custom SQL','Add privileges consultation save',NULL,'2.0.5'),('bahmni-core-201522091118','Banka,Sravanthi','liquibase.xml','2015-11-12 08:51:22',10999,'EXECUTED','3:cc7ecabfa61461b10acab4efcbc3793c','Custom SQL','Add privileges consultation observation',NULL,'2.0.5'),('bahmni-core-201522091122','Banka,Sravanthi','liquibase.xml','2015-11-12 08:51:22',11001,'EXECUTED','3:6bc51163744a97a1849bcab1e7969663','Custom SQL','Add privileges consultation diagnosis',NULL,'2.0.5'),('bahmni-core-201522091126','Banka,Sravanthi','liquibase.xml','2015-11-12 08:51:22',11003,'EXECUTED','3:4220c81f14d749b39464487fe038ddf3','Custom SQL','Add privileges consultation disposition',NULL,'2.0.5'),('bahmni-core-201522091130','Banka,Sravanthi','liquibase.xml','2015-11-12 08:51:22',11005,'EXECUTED','3:9592304d8b871d914851a5e57f0b3ba6','Custom SQL','Add privileges consultation treatment',NULL,'2.0.5'),('bahmni-core-201522091134','Banka,Sravanthi','liquibase.xml','2015-11-12 08:51:22',11007,'EXECUTED','3:d3f40e0d71d0a797079951edf3cfc65b','Custom SQL','Add privileges consultation orders',NULL,'2.0.5'),('bahmni-mapping-201508200613','Gautham, Sudhakar','liquibase.xml','2015-11-12 08:51:22',10986,'EXECUTED','3:3a9d87b0efe0b06c05c9caeb2f616599','Create Table (x2), Add Foreign Key Constraint','Entity mapping table',NULL,'2.0.5'),('bahmni-mapping-201508271719','Gautam, Shan','liquibase.xml','2015-11-12 08:51:22',10987,'EXECUTED','3:f38b607def006e48591497b8d427f7cc','Insert Row','Inserting Program Obstemplate Mapping type',NULL,'2.0.5'),('bahmni-mapping-201508271736','Shan, Gautam','liquibase.xml','2015-11-12 08:51:22',10988,'EXECUTED','3:65427f1edf5546ebc2284c98e17b31e7','Add Unique Constraint','Introducing constraint unique key to name column in the entity_mapping_type table',NULL,'2.0.5'),('bahmni-mapping-201509021719','Shruthi, Padma','liquibase.xml','2015-11-12 08:51:22',10989,'EXECUTED','3:b514a8c7b083b0c8fc3974bbc4fa10cb','Insert Row','Inserting Program EncounterType Mapping',NULL,'2.0.5'),('bahmni-PatientSearch-Update-201507031840','Vikash, Achinta','liquibase.xml','2015-11-12 08:48:18',10855,'EXECUTED','3:ddebe9600eef3a6f92e3ee4fb6fb6cad','SQL From File','rel3',NULL,'2.0.5'),('bahmni-PatientSearch-Update-201507071330','Vikash, Chethan','liquibase.xml','2015-11-12 08:48:18',10856,'EXECUTED','3:50e6998a7b95a8d302ba5daccb597ade','SQL From File','rel3',NULL,'2.0.5'),('bahmni-PatientSearch-Update-201507161455','Abishek','liquibase.xml','2015-11-12 08:48:18',10858,'EXECUTED','3:59c6870c2a2f8944cfe14b23f6e419a8','SQL From File','Updating sql to use order instead of lab order as order type name',NULL,'2.0.5'),('bahmni-PatientSearch-Update-201507271745','JP, Sravanthi','liquibase.xml','2015-11-12 08:48:18',10862,'EXECUTED','3:6543a9af9e42feee2b196e6b6412ef07','SQL From File','Updating high risk patient sql to consider latest test value',NULL,'2.0.5'),('bahmni-reg-1','tw','liquibase.xml','2015-11-12 08:45:11',10595,'EXECUTED','3:c0b629cdfcca83a11a418544618f5e64','SQL From File','rel2',NULL,'2.0.5'),('bahmni-reg-2','tw','liquibase.xml','2015-11-12 08:45:11',10596,'EXECUTED','3:80c20767b9864a9b3bf7f3ccc3b168b9','SQL From File','rel2',NULL,'2.0.5'),('bahmni-reg-201401171330','banka-tw','liquibase.xml','2015-11-12 08:45:11',10600,'EXECUTED','3:6fb4b3254235534a73f1286df1ccc85d','Insert Row','',NULL,'2.0.5'),('bahmni-reg-201402141455','neha','liquibase.xml','2015-11-12 08:45:11',10601,'EXECUTED','3:eb2a5670f3bf96f9638999447a9301a3','Custom SQL','Add emrgency app role',NULL,'2.0.5'),('bahmni-reg-3','tw','liquibase.xml','2015-11-12 08:45:11',10597,'EXECUTED','3:36a3c338cb6058407f036ef86ed67e0d','SQL From File','rel2',NULL,'2.0.5'),('bahmni-reg-4','tw','liquibase.xml','2015-11-12 08:45:11',10598,'EXECUTED','3:b5c470f1a44536c95da453df84770d9c','SQL From File','rel3',NULL,'2.0.5'),('bahmni-reg-5','vivek-tw','liquibase.xml','2015-11-12 08:45:11',10599,'EXECUTED','3:35c7ab7814c60020e0c161af7bf49a30','Custom SQL','rel3',NULL,'2.0.5'),('bahmni-setup-1','tw','migrations/dependent-modules/liquibase.xml','2015-11-12 08:43:49',10484,'EXECUTED','3:2f520c3b2915b7f96cd3bd232bd7ae7e','SQL From File','rel2',NULL,'2.0.5'),('bahmni-setup-2','tw','migrations/dependent-modules/liquibase.xml','2015-11-12 08:43:49',10485,'EXECUTED','3:65aed6199124c4b42c1a25ca7f5b3f8e','SQL From File','rel2',NULL,'2.0.5'),('bahmni-setup-3','tw','migrations/dependent-modules/liquibase.xml','2015-11-12 08:43:50',10486,'EXECUTED','3:2235014fa1c808b255eb10567c051d81','SQL From File','rel2',NULL,'2.0.5'),('bahmni-setup-4','tw','migrations/dependent-modules/liquibase.xml','2015-11-12 08:43:50',10487,'EXECUTED','3:2aacff86111151b15a842f2f88825d58','SQL From File','rel3',NULL,'2.0.5'),('bahmni-setup-5','tw','migrations/dependent-modules/liquibase.xml','2015-11-12 08:43:50',10488,'EXECUTED','3:f83c613315be0115f4d4a34be833aff3','Insert Row','rel3',NULL,'2.0.5'),('bahmni-setup-6','tw','migrations/dependent-modules/liquibase.xml','2015-11-12 08:43:50',10489,'EXECUTED','3:0c7cf008e177b5631a8f9554a729f52c','Insert Row','rel3',NULL,'2.0.5'),('bahmni-snapshot-1-upgrade-1','Vinay, Mihir, Ramesh','liquibase.xml','2015-11-12 08:45:21',10602,'EXECUTED','3:f96fd12ecf53fb18143450f7a0b9c1d9','Add Column','Add column java_class_name to order_type for OpenMRS 1.9 -> 1.10',NULL,'2.0.5'),('bahmni-snapshot-1-upgrade-10','Rohan, Bharti','liquibase.xml','2015-11-12 08:45:21',10611,'EXECUTED','3:49cb009d82f00927b3130b24bdd26902','Custom SQL','Update auto expire date of previous lab orders',NULL,'2.0.5'),('bahmni-snapshot-1-upgrade-2','Vinay, Mihir, Suresh','liquibase.xml','2015-11-12 08:45:21',10603,'EXECUTED','3:6ce3c635db658191a371f5242f04561a','Add Column','Add column parent to order_type for OpenMRS 1.9 -> 1.10',NULL,'2.0.5'),('bahmni-snapshot-1-upgrade-3','Vinay, Mihir, Mahesh','liquibase.xml','2015-11-12 08:45:21',10604,'MARK_RAN','3:6450b77ce5f621e0edad0550d756e17c','Drop Table','drop table visit_migration for OpenMRS 1.9 -> 1.10',NULL,'2.0.5'),('bahmni-snapshot-1-upgrade-4','Vinay, Mihir, Dinesh','liquibase.xml','2015-11-12 08:45:21',10605,'EXECUTED','3:06419c4e5d28bf115ee5c6c364be888a','Custom SQL','Update startdate in orders. Keep running until migrated to OpeMRS 1.10',NULL,'2.0.5'),('bahmni-snapshot-1-upgrade-5','Vinay, Mihir, Lokesh','liquibase.xml','2015-11-12 08:45:21',10606,'EXECUTED','3:cd74667edd93d315e910e9c8b42344f6','Custom SQL','Update providers in orders. Keep running until migrated to OpeMRS 1.10',NULL,'2.0.5'),('bahmni-snapshot-1-upgrade-6','Vinay, Mihir, Lokesh','liquibase.xml','2015-11-12 08:45:21',10607,'EXECUTED','3:d44c15b80437a7a0c4841d345efc59e7','Custom SQL','Set java class names for existing order types',NULL,'2.0.5'),('bahmni-snapshot-1-upgrade-7','Vinay, Mihir, Yogesh','liquibase.xml','2015-11-12 08:45:21',10608,'EXECUTED','3:6c0ce65e4ec715d97ca5d17834a14c16','Custom SQL','Set java class names for existing order types',NULL,'2.0.5'),('bahmni-snapshot-1-upgrade-8','Vinay, Mihir, Dinesh','liquibase.xml','2015-11-12 08:45:21',10609,'EXECUTED','3:74dc2c14d464739bc096134553a5d160','Custom SQL','Update startdate in orders for all orders',NULL,'2.0.5'),('bahmni-snapshot-1-upgrade-9','Vinay, Mihir, Dinesh','liquibase.xml','2015-11-12 08:45:21',10610,'EXECUTED','3:66c5c0498a128a5be1b74835f29a242f','Custom SQL','Insert concept set members for Dose Quantity Units',NULL,'2.0.5'),('bahmniconfig-201505252028','Mihir','liquibase.xml','2015-11-12 08:48:18',10848,'EXECUTED','3:f7b02e7c80d6e0f6fe2375f91b9005b1','Create Table, Add Foreign Key Constraint (x2), Add Unique Constraint (x2)','',NULL,'2.0.5'),('bahmniconfig-201505252128','Mihir','liquibase.xml','2015-11-12 08:48:18',10849,'EXECUTED','3:1688c33b1d8a9bff81f123cfabc88377','Create Table, Add Foreign Key Constraint, Add Unique Constraint (x2)','',NULL,'2.0.5'),('bahmnimapping-201409121125','Chethan, D3','liquibase.xml','2015-11-12 08:48:17',10768,'EXECUTED','3:7c85f09623317af6653cb48c89e27e00','Create Table, Add Foreign Key Constraint (x5)','',NULL,'2.0.5'),('bedmanagement-201401171410','banka-tw','liquibase.xml','2015-11-12 08:50:35',10956,'MARK_RAN','3:d5c049fddf766160573e47432866a7af','Insert Row','',NULL,'2.0.5'),('bedmanagement-201514101449','padma','liquibase.xml','2015-11-12 08:50:35',10957,'EXECUTED','3:ccb5b80fe5702396261645675bfe7668','Insert Row','',NULL,'2.0.5'),('bedmanagement-201514101455','padma','liquibase.xml','2015-11-12 08:50:35',10958,'EXECUTED','3:be88d1eab414a74e416a74fbaa804bc4','Insert Row','',NULL,'2.0.5'),('bedmanagement-20151410183','padma','liquibase.xml','2015-11-12 08:50:35',10960,'EXECUTED','3:2fd5f40c4d91726f0c431026d7fad17f','Insert Row','',NULL,'2.0.5'),('bedmanagement-201514101836','padma','liquibase.xml','2015-11-12 08:50:35',10959,'EXECUTED','3:7fa2b9c000288cb4afa7ac67a0e14bea','Insert Row','',NULL,'2.0.5'),('bed_management_module_18112013_1','Arathy,Banka','liquibase.xml','2015-11-12 08:50:33',10932,'EXECUTED','3:7f5aa1439a4889c6cf630b99e1887070','Create Table','Create bed_type table',NULL,'2.0.5'),('bed_management_module_18112013_2','Arathy,Banka','liquibase.xml','2015-11-12 08:50:33',10933,'EXECUTED','3:e9c545756efadfcd357658c59ba8ccbf','Add Column','',NULL,'2.0.5'),('bed_management_module_18112013_3','Arathy,Banka','liquibase.xml','2015-11-12 08:50:34',10934,'EXECUTED','3:7dc3e366326ab822d273659e86712932','Add Foreign Key Constraint','Added foreign key reference on bed_type_id in bed table',NULL,'2.0.5'),('disable-foreign-key-checks','ben','liquibase-core-data.xml','2015-11-12 08:49:09',10017,'RERAN','3:cc124077cda1cfb0c70c1ec823551223','Custom SQL','',NULL,'2.0.5'),('drop-tribe-foreign-key-TRUNK-4492','dkayiwa','liquibase-update-to-latest.xml','2015-11-12 08:49:27',10909,'MARK_RAN','3:6f02e3203c3fe5414a44106b8f16e3cd','Drop Foreign Key Constraint','Dropping foreign key on patient.tribe',NULL,'2.0.5'),('elis-atomfeed-1','tw','liquibase.xml','2015-11-12 08:45:42',10614,'EXECUTED','3:17d9c6c5ea8bbf64b2b4644346192e90','SQL From File','rel2',NULL,'2.0.5'),('elis-atomfeed-10','tw','liquibase.xml','2015-11-12 08:45:42',10622,'EXECUTED','3:feb206bf6784b0ce4dfc1e16a800226c','Custom SQL','',NULL,'2.0.5'),('elis-atomfeed-11','tw','liquibase.xml','2015-11-12 08:45:42',10623,'MARK_RAN','3:12105009de6f0575c46df9d670d68081','Custom SQL','',NULL,'2.0.5'),('elis-atomfeed-12','tw','liquibase.xml','2015-11-12 08:45:42',10624,'MARK_RAN','3:ae7a643b1262305c113ff297318e92aa','Custom SQL','',NULL,'2.0.5'),('elis-atomfeed-13','tw','liquibase.xml','2015-11-12 08:45:42',10625,'EXECUTED','3:b33b5942425ad6e69480e0919108b20c','Custom SQL','',NULL,'2.0.5'),('elis-atomfeed-14-201402041600','tw','liquibase.xml','2015-11-12 08:45:42',10626,'EXECUTED','3:b02e2f66d54d988351f184701ae6d619','Custom SQL','Remove scheduled job to process failed Openelis lab results',NULL,'2.0.5'),('elis-atomfeed-15-201402041605','tw','liquibase.xml','2015-11-12 08:45:42',10627,'EXECUTED','3:a61c1329e67b2732fa6c83d884926b65','Custom SQL','Remove scheduled job to process Openelis lab results, as this is now part of accession worker',NULL,'2.0.5'),('elis-atomfeed-16-201409101232','Chethan,D3','liquibase.xml','2015-11-12 08:48:38',10864,'EXECUTED','3:20732865c685712f4c1fe1e9cb489a9f','Custom SQL','Creating new visit type LAB VISIT',NULL,'2.0.5'),('elis-atomfeed-2','tw','liquibase.xml','2015-11-12 08:45:42',10615,'EXECUTED','3:cfd8f65af45913454ea557b1585bbb40','SQL From File','rel2',NULL,'2.0.5'),('elis-atomfeed-3','tw','liquibase.xml','2015-11-12 08:45:42',10616,'EXECUTED','3:279a6a1670eac12891f3a0437fadf730','SQL From File','rel2',NULL,'2.0.5'),('elis-atomfeed-4','tw','liquibase.xml','2015-11-12 08:45:42',10617,'EXECUTED','3:0eb646e57196970f3f4b1bcf875e091e','SQL From File','rel2',NULL,'2.0.5'),('elis-atomfeed-5','tw','liquibase.xml','2015-11-12 08:45:42',10618,'EXECUTED','3:4d3531ede6ef820436ac0ef886aab55b','SQL From File','rel3',NULL,'2.0.5'),('elis-atomfeed-6','tw','liquibase.xml','2015-11-12 08:45:42',10619,'EXECUTED','3:78a6e08fc15728ddd71c873931d0f512','Custom SQL','Add failed events job for Openelis lab result processing',NULL,'2.0.5'),('elis-atomfeed-7','tw','liquibase.xml','2015-11-12 08:45:42',10620,'EXECUTED','3:8877ce3b407b0d49bab09aa39239ee90','Custom SQL','Add failed events job for Openelis patient processing',NULL,'2.0.5'),('elis-atomfeed-8','tw','liquibase.xml','2015-11-12 08:45:42',10621,'EXECUTED','3:ca9db9bef47dedf3ad8a3a8914a58759','Custom SQL','Don\'t start the patient feed on startup',NULL,'2.0.5'),('enable-foreign-key-checks','ben','liquibase-core-data.xml','2015-11-12 08:49:09',10041,'RERAN','3:fcfe4902a8f3eda10332567a1a51cb49','Custom SQL','',NULL,'2.0.5'),('metadatamapping-2011-10-04-a','bwolfe','liquibase.xml','2015-11-12 08:44:30',10496,'EXECUTED','3:35034abcb1ed993cde7f33847ce0ce4c','Update Data','Move MDS property addLocalMappings to metadatamapping',NULL,'2.0.5'),('metadatamapping-2011-10-04-b','bwolfe','liquibase.xml','2015-11-12 08:44:30',10497,'EXECUTED','3:991431e585885ebeeaef03c760b5f6f8','Update Data','Move MDS property localConceptSourceUuid to metadatamapping',NULL,'2.0.5'),('openerp-atomfeed-client-201401061540','sush,banka','liquibase.xml','2015-11-12 08:45:52',10628,'EXECUTED','3:2d4b738b930a87d6cdad91babb422f33','Insert Row (x2)','',NULL,'2.0.5'),('openerp-atomfeed-client-201401091523','sush','liquibase.xml','2015-11-12 08:45:52',10629,'EXECUTED','3:1bd9aba3bb7fc5567c83a2323ba5de1c','Insert Row','',NULL,'2.0.5'),('openerp-atomfeed-client-201401281406','tw','liquibase.xml','2015-11-12 08:45:52',10630,'MARK_RAN','3:12105009de6f0575c46df9d670d68081','Custom SQL','',NULL,'2.0.5'),('openerp-atomfeed-client-201401281407','tw','liquibase.xml','2015-11-12 08:45:52',10631,'MARK_RAN','3:ae7a643b1262305c113ff297318e92aa','Custom SQL','',NULL,'2.0.5'),('openerp-atomfeed-client-201402131804','tw','liquibase.xml','2015-11-12 08:45:52',10632,'EXECUTED','3:e3f30919527e147f1f6966acec558bab','Delete Data','',NULL,'2.0.5'),('openerp-atomfeed-client-201402131819','tw','liquibase.xml','2015-11-12 08:45:52',10633,'EXECUTED','3:86318498bf39d7915d9453702ff1f902','Custom SQL','',NULL,'2.0.5'),('openerp-atomfeed-client-201409101233','Chethan, D3','liquibase.xml','2015-11-12 08:48:48',10865,'EXECUTED','3:d0e7aadc45b3a358151dce6ada996e3d','Custom SQL','Add new visit type PHARMACY VISIT',NULL,'2.0.5'),('openmrs-atomfeed-offset-marker-20150909122334','tw','liquibase.xml','2015-11-12 08:50:10',10923,'EXECUTED','3:4c78c5cce276151886c80a0c39001a2a','Insert Row','',NULL,'2.0.5'),('org.ict4h.openmrs-atomfeed-2013-03-01-18:30','ict4h','liquibase.xml','2015-11-12 08:43:59',10490,'EXECUTED','3:1a7eeaf0e4a024076bfee8d326904ece','Create Table (x2), Modify data type, Set Column as Auto-Increment, Modify data type, Set Column as Auto-Increment','',NULL,'2.0.5'),('org.ict4h.openmrs-atomfeed-2014-01-02-00:00','ict4h','liquibase.xml','2015-11-12 08:43:59',10491,'EXECUTED','3:e8c753c38cfb25c50c4249ec84429e4c','Create Table','',NULL,'2.0.5'),('org.ict4h.openmrs-atomfeed-2014-06-10-14:22','Chethan, Banka','liquibase.xml','2015-11-12 08:50:10',10921,'EXECUTED','3:7cc0b59c613e76b2975cfc814419c85f','Insert Row','Adding global property for encounter feed publish url',NULL,'2.0.5'),('reporting_id_set_cleanup','mseaton','liquibase.xml','2015-11-12 08:50:52',10977,'MARK_RAN','3:01cd3b88ed5e29b64b55d614d419cd2b','Drop Table','Removing reporting_idset table that is no longer used',NULL,'2.0.5'),('reporting_migration_1','mseaton','liquibase.xml','2015-11-12 08:50:52',10975,'EXECUTED','3:f6ea0df533cc324ea0d6275d72980c78','Custom SQL (x2)','Remove OpenMRS scheduled tasks produced by the reporting module',NULL,'2.0.5'),('reporting_migration_2','mseaton','liquibase.xml','2015-11-12 08:50:52',10976,'EXECUTED','3:4fb91f1875cf874314393aa47c71ca83','Custom SQL','Rename the default web renderer',NULL,'2.0.5'),('reporting_report_design_1','mseaton','liquibase.xml','2015-11-12 08:50:51',10961,'EXECUTED','3:482e8981e0dce9476eaf481167719579','Create Table, Add Foreign Key Constraint (x4)','Create table to persist report design specifications',NULL,'2.0.5'),('reporting_report_design_2','mseaton','liquibase.xml','2015-11-12 08:50:51',10962,'EXECUTED','3:027dbe5aeecbd08ecb7b5986a25307de','Add Column, Custom SQL','',NULL,'2.0.5'),('reporting_report_design_3','mseaton','liquibase.xml','2015-11-12 08:50:51',10963,'EXECUTED','3:8cac36c2cf24b842b8add2a5cfbb0df1','Custom SQL','',NULL,'2.0.5'),('reporting_report_design_4','mseaton','liquibase.xml','2015-11-12 08:50:51',10964,'EXECUTED','3:bddba97d81d6daa7fd6fbb478897fd84','Drop Foreign Key Constraint','',NULL,'2.0.5'),('reporting_report_design_5','mseaton','liquibase.xml','2015-11-12 08:50:52',10965,'EXECUTED','3:e7dbeb93443f14c60ed2e7cd6aa1e94f','Create Index','',NULL,'2.0.5'),('reporting_report_design_6','mseaton','liquibase.xml','2015-11-12 08:50:52',10966,'EXECUTED','3:e37eef4a9c8063b4abdb8481dd8fe5f8','Drop Column','Step 4 in changing reporting_report_design to reference report definition\n			by uuid rather than id, in order to not tie it directly to the serialized object table\n			Drop report_definition_id column',NULL,'2.0.5'),('reporting_report_design_resource_1','mseaton','liquibase.xml','2015-11-12 08:50:52',10967,'EXECUTED','3:9b1f111c165c213fa2cecc37d87ed843','Create Table, Add Foreign Key Constraint (x4)','Create table to persist report design resources',NULL,'2.0.5'),('reporting_report_processor_1','mseaton','liquibase.xml','2015-11-12 08:50:52',10971,'EXECUTED','3:bc9b147af791381ff5a98a7786f7d638','Create Table, Add Foreign Key Constraint (x3)','Create tables to persist report processors',NULL,'2.0.5'),('reporting_report_processor_2','mseaton','liquibase.xml','2015-11-12 08:50:52',10972,'MARK_RAN','3:9060cd2b9fc7c9a24155302d97123fc8','Drop Table','Drop the reporting_report_request_processor table (creation of this table was done\n			in the old sqldiff and not ported over to liquibase, as it is not needed.  this\n			changeset serves only to clean it up and delete it if is still exists',NULL,'2.0.5'),('reporting_report_processor_3','mseaton','liquibase.xml','2015-11-12 08:50:52',10973,'EXECUTED','3:2a2278e80933adb538d8c308eb812337','Add Column, Add Foreign Key Constraint','Update reporting_report_processor table to have report_design_id column',NULL,'2.0.5'),('reporting_report_processor_4','mseaton','liquibase.xml','2015-11-12 08:50:52',10974,'EXECUTED','3:3073b9e397f194eb5f16906f36e9c474','Add Column, Custom SQL','Update reporting_report_processor table to have processor_mode column\n			and set the value to automatic for all processors that were previously created',NULL,'2.0.5'),('reporting_report_request_1','mseaton','liquibase.xml','2015-11-12 08:50:52',10968,'EXECUTED','3:4d336ce27e1366ee39ea2b0c069e4491','Create Table, Add Foreign Key Constraint','Create tables to persist a report request and save reports',NULL,'2.0.5'),('reporting_report_request_2','mseaton','liquibase.xml','2015-11-12 08:50:52',10969,'EXECUTED','3:90834d1a3dc8b3c1f4109579c9a5b954','Add Column','Add a schedule property to ReportRequest',NULL,'2.0.5'),('reporting_report_request_3','mseaton','liquibase.xml','2015-11-12 08:50:52',10970,'EXECUTED','3:8e88f53150534221e9c32cd0e2c94706','Add Column','Add processAutomatically boolean to ReportRequest',NULL,'2.0.5'),('uiframework-20120913-2055','wyclif','liquibase.xml','2015-11-12 08:44:50',10498,'EXECUTED','3:af5797791243753415f969b558c9a917','Create Table','Adding uiframework_page_view table',NULL,'2.0.5');
/*!40000 ALTER TABLE `liquibasechangelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liquibasechangeloglock`
--

DROP TABLE IF EXISTS `liquibasechangeloglock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liquibasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` tinyint(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liquibasechangeloglock`
--

LOCK TABLES `liquibasechangeloglock` WRITE;
/*!40000 ALTER TABLE `liquibasechangeloglock` DISABLE KEYS */;
INSERT INTO `liquibasechangeloglock` VALUES (1,0,NULL,NULL);
/*!40000 ALTER TABLE `liquibasechangeloglock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city_village` varchar(255) DEFAULT NULL,
  `state_province` varchar(255) DEFAULT NULL,
  `postal_code` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `county_district` varchar(255) DEFAULT NULL,
  `address3` varchar(255) DEFAULT NULL,
  `address4` varchar(255) DEFAULT NULL,
  `address5` varchar(255) DEFAULT NULL,
  `address6` varchar(255) DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `parent_location` int(11) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  PRIMARY KEY (`location_id`),
  UNIQUE KEY `location_uuid_index` (`uuid`),
  KEY `name_of_location` (`name`),
  KEY `location_retired_status` (`retired`),
  KEY `user_who_created_location` (`creator`),
  KEY `user_who_retired_location` (`retired_by`),
  KEY `parent_location` (`parent_location`),
  KEY `location_changed_by` (`changed_by`),
  CONSTRAINT `location_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `parent_location` FOREIGN KEY (`parent_location`) REFERENCES `location` (`location_id`),
  CONSTRAINT `user_who_created_location` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_location` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Unknown Location',NULL,'','','','','','',NULL,NULL,1,'2005-09-22 00:00:00',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'8d6c993e-c2cc-11de-8d13-0010c6dffd0f',NULL,NULL);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_attribute`
--

DROP TABLE IF EXISTS `location_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_attribute` (
  `location_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `attribute_type_id` int(11) NOT NULL,
  `value_reference` text NOT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`location_attribute_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `location_attribute_location_fk` (`location_id`),
  KEY `location_attribute_attribute_type_id_fk` (`attribute_type_id`),
  KEY `location_attribute_creator_fk` (`creator`),
  KEY `location_attribute_changed_by_fk` (`changed_by`),
  KEY `location_attribute_voided_by_fk` (`voided_by`),
  CONSTRAINT `location_attribute_attribute_type_id_fk` FOREIGN KEY (`attribute_type_id`) REFERENCES `location_attribute_type` (`location_attribute_type_id`),
  CONSTRAINT `location_attribute_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_attribute_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_attribute_location_fk` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `location_attribute_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_attribute`
--

LOCK TABLES `location_attribute` WRITE;
/*!40000 ALTER TABLE `location_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `location_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_attribute_type`
--

DROP TABLE IF EXISTS `location_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_attribute_type` (
  `location_attribute_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `datatype` varchar(255) DEFAULT NULL,
  `datatype_config` text,
  `preferred_handler` varchar(255) DEFAULT NULL,
  `handler_config` text,
  `min_occurs` int(11) NOT NULL,
  `max_occurs` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`location_attribute_type_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `location_attribute_type_unique_name` (`name`),
  KEY `location_attribute_type_creator_fk` (`creator`),
  KEY `location_attribute_type_changed_by_fk` (`changed_by`),
  KEY `location_attribute_type_retired_by_fk` (`retired_by`),
  CONSTRAINT `location_attribute_type_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_attribute_type_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_attribute_type_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_attribute_type`
--

LOCK TABLES `location_attribute_type` WRITE;
/*!40000 ALTER TABLE `location_attribute_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `location_attribute_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_encounter_type_map`
--

DROP TABLE IF EXISTS `location_encounter_type_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_encounter_type_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `encounter_type_id` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `date_voided` datetime DEFAULT NULL,
  `voided_by` int(11) DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_encounter_type_map_location_id_fk` (`location_id`),
  KEY `location_encounter_type_map_encounter_type_id_fk` (`encounter_type_id`),
  KEY `location_encounter_type_map_creator_fk` (`creator`),
  KEY `location_encounter_type_map_changed_by_fk` (`changed_by`),
  KEY `location_encounter_type_map_voided_by_fk` (`voided_by`),
  CONSTRAINT `location_encounter_type_map_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_encounter_type_map_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_encounter_type_map_encounter_type_id_fk` FOREIGN KEY (`encounter_type_id`) REFERENCES `encounter_type` (`encounter_type_id`),
  CONSTRAINT `location_encounter_type_map_location_id_fk` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `location_encounter_type_map_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_encounter_type_map`
--

LOCK TABLES `location_encounter_type_map` WRITE;
/*!40000 ALTER TABLE `location_encounter_type_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `location_encounter_type_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_tag`
--

DROP TABLE IF EXISTS `location_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_tag` (
  `location_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  PRIMARY KEY (`location_tag_id`),
  UNIQUE KEY `location_tag_uuid_index` (`uuid`),
  KEY `location_tag_creator` (`creator`),
  KEY `location_tag_retired_by` (`retired_by`),
  KEY `location_tag_changed_by` (`changed_by`),
  CONSTRAINT `location_tag_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_tag_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_tag_retired_by` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_tag`
--

LOCK TABLES `location_tag` WRITE;
/*!40000 ALTER TABLE `location_tag` DISABLE KEYS */;
INSERT INTO `location_tag` VALUES (1,'Login Location','When a user logs in and chooses a session location, they may only choose one with this tag',1,'2015-11-12 08:48:18',0,NULL,NULL,NULL,'b8bbf83e-645f-451f-8efe-a0db56f09676',NULL,NULL);
/*!40000 ALTER TABLE `location_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_tag_map`
--

DROP TABLE IF EXISTS `location_tag_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_tag_map` (
  `location_id` int(11) NOT NULL,
  `location_tag_id` int(11) NOT NULL,
  PRIMARY KEY (`location_id`,`location_tag_id`),
  KEY `location_tag_map_tag` (`location_tag_id`),
  CONSTRAINT `location_tag_map_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `location_tag_map_tag` FOREIGN KEY (`location_tag_id`) REFERENCES `location_tag` (`location_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_tag_map`
--

LOCK TABLES `location_tag_map` WRITE;
/*!40000 ALTER TABLE `location_tag_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `location_tag_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `markers`
--

DROP TABLE IF EXISTS `markers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `markers` (
  `feed_uri` varchar(255) NOT NULL,
  `last_read_entry_id` varchar(255) DEFAULT NULL,
  `feed_uri_for_last_read_entry` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`feed_uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `markers`
--

LOCK TABLES `markers` WRITE;
/*!40000 ALTER TABLE `markers` DISABLE KEYS */;
/*!40000 ALTER TABLE `markers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadatasharing_exported_package`
--

DROP TABLE IF EXISTS `metadatasharing_exported_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadatasharing_exported_package` (
  `exported_package_id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `group_uuid` char(38) NOT NULL,
  `version` int(11) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `date_created` datetime NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(256) NOT NULL,
  `content` longblob,
  PRIMARY KEY (`exported_package_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `group_uuid` (`group_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadatasharing_exported_package`
--

LOCK TABLES `metadatasharing_exported_package` WRITE;
/*!40000 ALTER TABLE `metadatasharing_exported_package` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadatasharing_exported_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadatasharing_imported_item`
--

DROP TABLE IF EXISTS `metadatasharing_imported_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadatasharing_imported_item` (
  `imported_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `classname` varchar(256) NOT NULL,
  `existing_uuid` char(38) DEFAULT NULL,
  `date_imported` datetime DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `import_type` tinyint(4) DEFAULT '0',
  `assessed` tinyint(1) NOT NULL,
  PRIMARY KEY (`imported_item_id`),
  KEY `uuid` (`uuid`),
  KEY `existing_uuid` (`existing_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadatasharing_imported_item`
--

LOCK TABLES `metadatasharing_imported_item` WRITE;
/*!40000 ALTER TABLE `metadatasharing_imported_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadatasharing_imported_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadatasharing_imported_package`
--

DROP TABLE IF EXISTS `metadatasharing_imported_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadatasharing_imported_package` (
  `imported_package_id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `group_uuid` char(38) NOT NULL,
  `subscription_url` varchar(512) DEFAULT NULL,
  `subscription_status` tinyint(4) DEFAULT '0',
  `date_created` datetime NOT NULL,
  `date_imported` datetime DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `import_config` varchar(1024) DEFAULT NULL,
  `remote_version` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`imported_package_id`),
  KEY `uuid` (`uuid`),
  KEY `group_uuid` (`group_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadatasharing_imported_package`
--

LOCK TABLES `metadatasharing_imported_package` WRITE;
/*!40000 ALTER TABLE `metadatasharing_imported_package` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadatasharing_imported_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note` (
  `note_id` int(11) NOT NULL DEFAULT '0',
  `note_type` varchar(50) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `obs_id` int(11) DEFAULT NULL,
  `encounter_id` int(11) DEFAULT NULL,
  `text` text NOT NULL,
  `priority` int(11) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`note_id`),
  UNIQUE KEY `note_uuid_index` (`uuid`),
  KEY `user_who_changed_note` (`changed_by`),
  KEY `user_who_created_note` (`creator`),
  KEY `encounter_note` (`encounter_id`),
  KEY `obs_note` (`obs_id`),
  KEY `note_hierarchy` (`parent`),
  KEY `patient_note` (`patient_id`),
  CONSTRAINT `encounter_note` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `note_hierarchy` FOREIGN KEY (`parent`) REFERENCES `note` (`note_id`),
  CONSTRAINT `obs_note` FOREIGN KEY (`obs_id`) REFERENCES `obs` (`obs_id`),
  CONSTRAINT `patient_note` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON UPDATE CASCADE,
  CONSTRAINT `user_who_changed_note` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_created_note` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note`
--

LOCK TABLES `note` WRITE;
/*!40000 ALTER TABLE `note` DISABLE KEYS */;
/*!40000 ALTER TABLE `note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_alert`
--

DROP TABLE IF EXISTS `notification_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_alert` (
  `alert_id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(512) NOT NULL,
  `satisfied_by_any` tinyint(1) NOT NULL DEFAULT '0',
  `alert_read` tinyint(1) NOT NULL DEFAULT '0',
  `date_to_expire` datetime DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`alert_id`),
  UNIQUE KEY `notification_alert_uuid_index` (`uuid`),
  KEY `alert_date_to_expire_idx` (`date_to_expire`),
  KEY `user_who_changed_alert` (`changed_by`),
  KEY `alert_creator` (`creator`),
  CONSTRAINT `alert_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_changed_alert` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_alert`
--

LOCK TABLES `notification_alert` WRITE;
/*!40000 ALTER TABLE `notification_alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_alert_recipient`
--

DROP TABLE IF EXISTS `notification_alert_recipient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_alert_recipient` (
  `alert_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `alert_read` tinyint(1) NOT NULL DEFAULT '0',
  `date_changed` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`alert_id`,`user_id`),
  KEY `alert_read_by_user` (`user_id`),
  CONSTRAINT `alert_read_by_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `id_of_alert` FOREIGN KEY (`alert_id`) REFERENCES `notification_alert` (`alert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_alert_recipient`
--

LOCK TABLES `notification_alert_recipient` WRITE;
/*!40000 ALTER TABLE `notification_alert_recipient` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_alert_recipient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_template`
--

DROP TABLE IF EXISTS `notification_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_template` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `template` text,
  `subject` varchar(100) DEFAULT NULL,
  `sender` varchar(255) DEFAULT NULL,
  `recipients` varchar(512) DEFAULT NULL,
  `ordinal` int(11) DEFAULT '0',
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `notification_template_uuid_index` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_template`
--

LOCK TABLES `notification_template` WRITE;
/*!40000 ALTER TABLE `notification_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obs`
--

DROP TABLE IF EXISTS `obs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obs` (
  `obs_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `encounter_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `obs_datetime` datetime NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `obs_group_id` int(11) DEFAULT NULL,
  `accession_number` varchar(255) DEFAULT NULL,
  `value_group_id` int(11) DEFAULT NULL,
  `value_boolean` tinyint(1) DEFAULT NULL,
  `value_coded` int(11) DEFAULT NULL,
  `value_coded_name_id` int(11) DEFAULT NULL,
  `value_drug` int(11) DEFAULT NULL,
  `value_datetime` datetime DEFAULT NULL,
  `value_numeric` double DEFAULT NULL,
  `value_modifier` varchar(2) DEFAULT NULL,
  `value_text` text,
  `value_complex` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  `previous_version` int(11) DEFAULT NULL,
  `form_namespace_and_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`obs_id`),
  UNIQUE KEY `obs_uuid_index` (`uuid`),
  KEY `obs_datetime_idx` (`obs_datetime`),
  KEY `obs_concept` (`concept_id`),
  KEY `obs_enterer` (`creator`),
  KEY `encounter_observations` (`encounter_id`),
  KEY `obs_location` (`location_id`),
  KEY `obs_grouping_id` (`obs_group_id`),
  KEY `obs_order` (`order_id`),
  KEY `person_obs` (`person_id`),
  KEY `answer_concept` (`value_coded`),
  KEY `obs_name_of_coded_value` (`value_coded_name_id`),
  KEY `answer_concept_drug` (`value_drug`),
  KEY `user_who_voided_obs` (`voided_by`),
  KEY `previous_version` (`previous_version`),
  CONSTRAINT `answer_concept` FOREIGN KEY (`value_coded`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `answer_concept_drug` FOREIGN KEY (`value_drug`) REFERENCES `drug` (`drug_id`),
  CONSTRAINT `encounter_observations` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `obs_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `obs_enterer` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `obs_grouping_id` FOREIGN KEY (`obs_group_id`) REFERENCES `obs` (`obs_id`),
  CONSTRAINT `obs_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `obs_name_of_coded_value` FOREIGN KEY (`value_coded_name_id`) REFERENCES `concept_name` (`concept_name_id`),
  CONSTRAINT `obs_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `person_obs` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON UPDATE CASCADE,
  CONSTRAINT `previous_version` FOREIGN KEY (`previous_version`) REFERENCES `obs` (`obs_id`),
  CONSTRAINT `user_who_voided_obs` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obs`
--

LOCK TABLES `obs` WRITE;
/*!40000 ALTER TABLE `obs` DISABLE KEYS */;
/*!40000 ALTER TABLE `obs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obs_relationship`
--

DROP TABLE IF EXISTS `obs_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obs_relationship` (
  `obs_relationship_id` int(11) NOT NULL AUTO_INCREMENT,
  `obs_relationship_type_id` int(11) NOT NULL,
  `source_obs_id` int(11) NOT NULL,
  `target_obs_id` int(11) NOT NULL,
  `uuid` char(38) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` int(11) NOT NULL,
  PRIMARY KEY (`obs_relationship_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `obs_relationship_type_id` (`obs_relationship_type_id`),
  KEY `source_obs_id` (`source_obs_id`),
  KEY `target_obs_id` (`target_obs_id`),
  KEY `creator` (`creator`),
  CONSTRAINT `obs_relationship_ibfk_1` FOREIGN KEY (`obs_relationship_type_id`) REFERENCES `obs_relationship_type` (`obs_relationship_type_id`),
  CONSTRAINT `obs_relationship_ibfk_2` FOREIGN KEY (`source_obs_id`) REFERENCES `obs` (`obs_id`),
  CONSTRAINT `obs_relationship_ibfk_3` FOREIGN KEY (`target_obs_id`) REFERENCES `obs` (`obs_id`),
  CONSTRAINT `obs_relationship_ibfk_4` FOREIGN KEY (`creator`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obs_relationship`
--

LOCK TABLES `obs_relationship` WRITE;
/*!40000 ALTER TABLE `obs_relationship` DISABLE KEYS */;
/*!40000 ALTER TABLE `obs_relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obs_relationship_type`
--

DROP TABLE IF EXISTS `obs_relationship_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obs_relationship_type` (
  `obs_relationship_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `retired` tinyint(4) NOT NULL DEFAULT '0',
  `date_retired` datetime DEFAULT NULL,
  `retired_by` int(11) DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`obs_relationship_type_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `creator` (`creator`),
  KEY `changed_by` (`changed_by`),
  KEY `retired_by` (`retired_by`),
  CONSTRAINT `obs_relationship_type_ibfk_1` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `obs_relationship_type_ibfk_2` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `obs_relationship_type_ibfk_3` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obs_relationship_type`
--

LOCK TABLES `obs_relationship_type` WRITE;
/*!40000 ALTER TABLE `obs_relationship_type` DISABLE KEYS */;
INSERT INTO `obs_relationship_type` VALUES (1,'qualified-by','target is qualified by source','dbde17aa-3d7e-11e4-8782-164230d1df67',1,'2015-11-12 08:48:17',0,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `obs_relationship_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_frequency`
--

DROP TABLE IF EXISTS `order_frequency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_frequency` (
  `order_frequency_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) NOT NULL,
  `frequency_per_day` double DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`order_frequency_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `concept_id` (`concept_id`),
  KEY `order_frequency_creator_fk` (`creator`),
  KEY `order_frequency_retired_by_fk` (`retired_by`),
  KEY `order_frequency_changed_by_fk` (`changed_by`),
  CONSTRAINT `order_frequency_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_frequency_concept_id_fk` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `order_frequency_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_frequency_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_frequency`
--

LOCK TABLES `order_frequency` WRITE;
/*!40000 ALTER TABLE `order_frequency` DISABLE KEYS */;
INSERT INTO `order_frequency` VALUES (1,77,1,1,'2015-11-12 08:47:12',0,NULL,NULL,NULL,NULL,NULL,'f768f692-8919-11e5-8b59-08002715d519'),(2,78,2,1,'2015-11-12 08:47:12',0,NULL,NULL,NULL,NULL,NULL,'f769876d-8919-11e5-8b59-08002715d519'),(3,79,3,1,'2015-11-12 08:47:12',0,NULL,NULL,NULL,NULL,NULL,'f76a6100-8919-11e5-8b59-08002715d519'),(4,80,4,1,'2015-11-12 08:47:12',0,NULL,NULL,NULL,NULL,NULL,'f76b55a4-8919-11e5-8b59-08002715d519'),(5,99,24,1,'2015-11-12 08:48:17',0,NULL,NULL,NULL,NULL,NULL,'1e78f716-891a-11e5-8b59-08002715d519'),(6,100,12,1,'2015-11-12 08:48:17',0,NULL,NULL,NULL,NULL,NULL,'1e79d92e-891a-11e5-8b59-08002715d519'),(7,101,8,1,'2015-11-12 08:48:17',0,NULL,NULL,NULL,NULL,NULL,'1e7bb938-891a-11e5-8b59-08002715d519'),(8,102,6,1,'2015-11-12 08:48:17',0,NULL,NULL,NULL,NULL,NULL,'1e7c638b-891a-11e5-8b59-08002715d519'),(9,103,4,1,'2015-11-12 08:48:17',0,NULL,NULL,NULL,NULL,NULL,'1e7d2650-891a-11e5-8b59-08002715d519'),(10,104,3,1,'2015-11-12 08:48:17',0,NULL,NULL,NULL,NULL,NULL,'1e7df6a7-891a-11e5-8b59-08002715d519'),(11,105,2,1,'2015-11-12 08:48:17',0,NULL,NULL,NULL,NULL,NULL,'1e7eaece-891a-11e5-8b59-08002715d519'),(12,106,0.5,1,'2015-11-12 08:48:17',0,NULL,NULL,NULL,NULL,NULL,'1e7f712a-891a-11e5-8b59-08002715d519'),(13,107,0.142857142,1,'2015-11-12 08:48:17',0,NULL,NULL,NULL,NULL,NULL,'1e803646-891a-11e5-8b59-08002715d519'),(14,108,0.285714285,1,'2015-11-12 08:48:17',0,NULL,NULL,NULL,NULL,NULL,'1e812461-891a-11e5-8b59-08002715d519'),(15,109,0.428571428,1,'2015-11-12 08:48:17',0,NULL,NULL,NULL,NULL,NULL,'1e81c0ae-891a-11e5-8b59-08002715d519'),(16,110,0.071428571,1,'2015-11-12 08:48:17',0,NULL,NULL,NULL,NULL,NULL,'1e826572-891a-11e5-8b59-08002715d519'),(17,111,0.047619047,1,'2015-11-12 08:48:17',0,NULL,NULL,NULL,NULL,NULL,'1e83101f-891a-11e5-8b59-08002715d519'),(18,112,0.033333333,1,'2015-11-12 08:48:17',0,NULL,NULL,NULL,NULL,NULL,'1e83b7a2-891a-11e5-8b59-08002715d519'),(19,122,5,1,'2015-11-12 08:48:18',0,NULL,NULL,NULL,NULL,NULL,'1ec3cb6e-891a-11e5-8b59-08002715d519'),(20,123,0.571428571,1,'2015-11-12 08:48:18',0,NULL,NULL,NULL,NULL,NULL,'1ec4823d-891a-11e5-8b59-08002715d519'),(21,124,0.714285714,1,'2015-11-12 08:48:18',0,NULL,NULL,NULL,NULL,NULL,'1ec53468-891a-11e5-8b59-08002715d519'),(22,125,0.857142857,1,'2015-11-12 08:48:18',0,NULL,NULL,NULL,NULL,NULL,'1ec5e6ab-891a-11e5-8b59-08002715d519'),(23,88,1,1,'2015-11-12 08:48:18',0,NULL,NULL,NULL,NULL,NULL,'0');
/*!40000 ALTER TABLE `order_frequency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_type`
--

DROP TABLE IF EXISTS `order_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_type` (
  `order_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  `java_class_name` varchar(255) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  PRIMARY KEY (`order_type_id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `order_type_uuid_index` (`uuid`),
  KEY `order_type_retired_status` (`retired`),
  KEY `type_created_by` (`creator`),
  KEY `user_who_retired_order_type` (`retired_by`),
  KEY `order_type_changed_by` (`changed_by`),
  KEY `order_type_parent_order_type` (`parent`),
  CONSTRAINT `order_type_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_type_parent_order_type` FOREIGN KEY (`parent`) REFERENCES `order_type` (`order_type_id`),
  CONSTRAINT `type_created_by` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_order_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_type`
--

LOCK TABLES `order_type` WRITE;
/*!40000 ALTER TABLE `order_type` DISABLE KEYS */;
INSERT INTO `order_type` VALUES (2,'Drug Order','An order for a medication to be given to the patient',1,'2010-05-12 00:00:00',0,NULL,NULL,NULL,'131168f4-15f5-102d-96e4-000c29c2a5d7','org.openmrs.DrugOrder',NULL,NULL,NULL),(3,'Lab Order','An order for laboratory tests',1,'2015-11-12 08:45:00',0,NULL,NULL,NULL,'a925cbad-8919-11e5-8b59-08002715d519','org.openmrs.Order',NULL,NULL,NULL),(4,'Radiology Order','An order for radiology tests',1,'2015-11-12 08:45:00',0,NULL,NULL,NULL,'a925ebfc-8919-11e5-8b59-08002715d519','org.openmrs.Order',NULL,NULL,NULL);
/*!40000 ALTER TABLE `order_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_type_class_map`
--

DROP TABLE IF EXISTS `order_type_class_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_type_class_map` (
  `order_type_id` int(11) NOT NULL,
  `concept_class_id` int(11) NOT NULL,
  PRIMARY KEY (`order_type_id`,`concept_class_id`),
  UNIQUE KEY `concept_class_id` (`concept_class_id`),
  CONSTRAINT `fk_order_type_class_map_concept_class_concept_class_id` FOREIGN KEY (`concept_class_id`) REFERENCES `concept_class` (`concept_class_id`),
  CONSTRAINT `fk_order_type_order_type_id` FOREIGN KEY (`order_type_id`) REFERENCES `order_type` (`order_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_type_class_map`
--

LOCK TABLES `order_type_class_map` WRITE;
/*!40000 ALTER TABLE `order_type_class_map` DISABLE KEYS */;
INSERT INTO `order_type_class_map` VALUES (3,8),(3,26);
/*!40000 ALTER TABLE `order_type_class_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_type_id` int(11) DEFAULT NULL,
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `orderer` int(11) NOT NULL,
  `encounter_id` int(11) NOT NULL,
  `instructions` text,
  `date_activated` datetime DEFAULT NULL,
  `auto_expire_date` datetime DEFAULT NULL,
  `date_stopped` datetime DEFAULT NULL,
  `order_reason` int(11) DEFAULT NULL,
  `order_reason_non_coded` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `patient_id` int(11) NOT NULL,
  `accession_number` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  `urgency` varchar(50) NOT NULL DEFAULT 'ROUTINE',
  `order_number` varchar(50) NOT NULL,
  `previous_order_id` int(11) DEFAULT NULL,
  `order_action` varchar(50) NOT NULL,
  `comment_to_fulfiller` varchar(1024) DEFAULT NULL,
  `care_setting` int(11) NOT NULL,
  `scheduled_date` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `orders_uuid_index` (`uuid`),
  KEY `order_creator` (`creator`),
  KEY `orders_in_encounter` (`encounter_id`),
  KEY `type_of_order` (`order_type_id`),
  KEY `order_for_patient` (`patient_id`),
  KEY `user_who_voided_order` (`voided_by`),
  KEY `previous_order_id_order_id` (`previous_order_id`),
  KEY `orders_care_setting` (`care_setting`),
  KEY `discontinued_because` (`order_reason`),
  KEY `fk_orderer_provider` (`orderer`),
  KEY `bahmni_orders_date_activated` (`date_activated`),
  CONSTRAINT `discontinued_because` FOREIGN KEY (`order_reason`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `fk_orderer_provider` FOREIGN KEY (`orderer`) REFERENCES `provider` (`provider_id`),
  CONSTRAINT `order_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_for_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON UPDATE CASCADE,
  CONSTRAINT `orders_care_setting` FOREIGN KEY (`care_setting`) REFERENCES `care_setting` (`care_setting_id`),
  CONSTRAINT `orders_in_encounter` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `previous_order_id_order_id` FOREIGN KEY (`previous_order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `type_of_order` FOREIGN KEY (`order_type_id`) REFERENCES `order_type` (`order_type_id`),
  CONSTRAINT `user_who_voided_order` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `patient_id` int(11) NOT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`patient_id`),
  KEY `user_who_changed_pat` (`changed_by`),
  KEY `user_who_created_patient` (`creator`),
  KEY `user_who_voided_patient` (`voided_by`),
  CONSTRAINT `person_id_for_patient` FOREIGN KEY (`patient_id`) REFERENCES `person` (`person_id`) ON UPDATE CASCADE,
  CONSTRAINT `user_who_changed_pat` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_created_patient` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_patient` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_identifier`
--

DROP TABLE IF EXISTS `patient_identifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_identifier` (
  `patient_identifier_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL DEFAULT '0',
  `identifier` varchar(50) NOT NULL DEFAULT '',
  `identifier_type` int(11) NOT NULL DEFAULT '0',
  `preferred` tinyint(1) NOT NULL DEFAULT '0',
  `location_id` int(11) DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`patient_identifier_id`),
  UNIQUE KEY `unique_patient_identifier` (`identifier`),
  UNIQUE KEY `patient_identifier_uuid_index` (`uuid`),
  KEY `identifier_name` (`identifier`),
  KEY `idx_patient_identifier_patient` (`patient_id`),
  KEY `identifier_creator` (`creator`),
  KEY `defines_identifier_type` (`identifier_type`),
  KEY `patient_identifier_ibfk_2` (`location_id`),
  KEY `identifier_voider` (`voided_by`),
  KEY `patient_identifier_changed_by` (`changed_by`),
  CONSTRAINT `defines_identifier_type` FOREIGN KEY (`identifier_type`) REFERENCES `patient_identifier_type` (`patient_identifier_type_id`),
  CONSTRAINT `identifier_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `identifier_voider` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_identifier_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_identifier_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_identifier`
--

LOCK TABLES `patient_identifier` WRITE;
/*!40000 ALTER TABLE `patient_identifier` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_identifier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_identifier_type`
--

DROP TABLE IF EXISTS `patient_identifier_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_identifier_type` (
  `patient_identifier_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  `format` varchar(255) DEFAULT NULL,
  `check_digit` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `format_description` varchar(255) DEFAULT NULL,
  `validator` varchar(200) DEFAULT NULL,
  `location_behavior` varchar(50) DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  `uniqueness_behavior` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`patient_identifier_type_id`),
  UNIQUE KEY `patient_identifier_type_uuid_index` (`uuid`),
  KEY `patient_identifier_type_retired_status` (`retired`),
  KEY `type_creator` (`creator`),
  KEY `user_who_retired_patient_identifier_type` (`retired_by`),
  CONSTRAINT `type_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_patient_identifier_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_identifier_type`
--

LOCK TABLES `patient_identifier_type` WRITE;
/*!40000 ALTER TABLE `patient_identifier_type` DISABLE KEYS */;
INSERT INTO `patient_identifier_type` VALUES (1,'OpenMRS Identification Number','Unique number used in OpenMRS','',1,1,'2005-09-22 00:00:00',0,NULL,'org.openmrs.patient.impl.LuhnIdentifierValidator',NULL,0,NULL,NULL,NULL,'8d793bee-c2cc-11de-8d13-0010c6dffd0f',NULL),(2,'Old Identification Number','Number given out prior to the OpenMRS system (No check digit)','',0,1,'2005-09-22 00:00:00',0,NULL,NULL,NULL,0,NULL,NULL,NULL,'8d79403a-c2cc-11de-8d13-0010c6dffd0f',NULL),(3,'Bahmni Id','New patient identifier type created for use by the Bahmni Registration System',NULL,0,1,'2015-11-12 00:00:00',1,NULL,NULL,'NOT_USED',0,NULL,NULL,NULL,'a908dd78-8919-11e5-8b59-08002715d519',NULL);
/*!40000 ALTER TABLE `patient_identifier_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_program`
--

DROP TABLE IF EXISTS `patient_program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_program` (
  `patient_program_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL DEFAULT '0',
  `program_id` int(11) NOT NULL DEFAULT '0',
  `date_enrolled` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `outcome_concept_id` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`patient_program_id`),
  UNIQUE KEY `patient_program_uuid_index` (`uuid`),
  KEY `user_who_changed` (`changed_by`),
  KEY `patient_program_creator` (`creator`),
  KEY `patient_in_program` (`patient_id`),
  KEY `program_for_patient` (`program_id`),
  KEY `user_who_voided_patient_program` (`voided_by`),
  KEY `patient_program_location_id` (`location_id`),
  KEY `patient_program_outcome_concept_id_fk` (`outcome_concept_id`),
  CONSTRAINT `patient_in_program` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON UPDATE CASCADE,
  CONSTRAINT `patient_program_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_program_location_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `patient_program_outcome_concept_id_fk` FOREIGN KEY (`outcome_concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `program_for_patient` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`),
  CONSTRAINT `user_who_changed` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_patient_program` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_program`
--

LOCK TABLES `patient_program` WRITE;
/*!40000 ALTER TABLE `patient_program` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_state`
--

DROP TABLE IF EXISTS `patient_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_state` (
  `patient_state_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_program_id` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`patient_state_id`),
  UNIQUE KEY `patient_state_uuid_index` (`uuid`),
  KEY `patient_state_changer` (`changed_by`),
  KEY `patient_state_creator` (`creator`),
  KEY `patient_program_for_state` (`patient_program_id`),
  KEY `state_for_patient` (`state`),
  KEY `patient_state_voider` (`voided_by`),
  CONSTRAINT `patient_program_for_state` FOREIGN KEY (`patient_program_id`) REFERENCES `patient_program` (`patient_program_id`),
  CONSTRAINT `patient_state_changer` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_state_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_state_voider` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `state_for_patient` FOREIGN KEY (`state`) REFERENCES `program_workflow_state` (`program_workflow_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_state`
--

LOCK TABLES `patient_state` WRITE;
/*!40000 ALTER TABLE `patient_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `gender` varchar(50) DEFAULT '',
  `birthdate` date DEFAULT NULL,
  `birthdate_estimated` tinyint(1) NOT NULL DEFAULT '0',
  `dead` tinyint(1) NOT NULL DEFAULT '0',
  `death_date` datetime DEFAULT NULL,
  `cause_of_death` int(11) DEFAULT NULL,
  `creator` int(11) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  `deathdate_estimated` tinyint(1) NOT NULL DEFAULT '0',
  `birthtime` time DEFAULT NULL,
  PRIMARY KEY (`person_id`),
  UNIQUE KEY `person_uuid_index` (`uuid`),
  KEY `person_birthdate` (`birthdate`),
  KEY `person_death_date` (`death_date`),
  KEY `person_died_because` (`cause_of_death`),
  KEY `user_who_changed_person` (`changed_by`),
  KEY `user_who_created_person` (`creator`),
  KEY `user_who_voided_person` (`voided_by`),
  CONSTRAINT `person_died_because` FOREIGN KEY (`cause_of_death`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `user_who_changed_person` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_created_person` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_person` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'M',NULL,0,0,NULL,NULL,NULL,'2005-01-01 00:00:00',NULL,NULL,0,NULL,NULL,NULL,'6334f6a4-8919-11e5-8b59-08002715d519',0,NULL),(2,'',NULL,0,0,NULL,NULL,1,'2015-11-12 08:45:01',NULL,NULL,0,NULL,NULL,NULL,'a9990a9a-8919-11e5-8b59-08002715d519',0,NULL),(3,'',NULL,0,0,NULL,NULL,1,'2015-11-12 08:45:42',NULL,NULL,0,NULL,NULL,NULL,'c1abd87b-8919-11e5-8b59-08002715d519',0,NULL),(4,'',NULL,0,0,NULL,NULL,1,'2015-11-12 08:45:52',NULL,NULL,0,NULL,NULL,NULL,'c7be54d7-8919-11e5-8b59-08002715d519',0,NULL);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_address`
--

DROP TABLE IF EXISTS `person_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_address` (
  `person_address_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `preferred` tinyint(1) NOT NULL DEFAULT '0',
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city_village` varchar(255) DEFAULT NULL,
  `state_province` varchar(255) DEFAULT NULL,
  `postal_code` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `county_district` varchar(255) DEFAULT NULL,
  `address3` varchar(255) DEFAULT NULL,
  `address4` varchar(255) DEFAULT NULL,
  `address5` varchar(255) DEFAULT NULL,
  `address6` varchar(255) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`person_address_id`),
  UNIQUE KEY `person_address_uuid_index` (`uuid`),
  KEY `patient_address_creator` (`creator`),
  KEY `address_for_person` (`person_id`),
  KEY `patient_address_void` (`voided_by`),
  KEY `person_address_changed_by` (`changed_by`),
  KEY `person_address_city_village` (`city_village`),
  CONSTRAINT `address_for_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON UPDATE CASCADE,
  CONSTRAINT `patient_address_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_address_void` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `person_address_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_address`
--

LOCK TABLES `person_address` WRITE;
/*!40000 ALTER TABLE `person_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_attribute`
--

DROP TABLE IF EXISTS `person_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_attribute` (
  `person_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL DEFAULT '0',
  `value` varchar(50) NOT NULL DEFAULT '',
  `person_attribute_type_id` int(11) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`person_attribute_id`),
  UNIQUE KEY `person_attribute_uuid_index` (`uuid`),
  KEY `attribute_changer` (`changed_by`),
  KEY `attribute_creator` (`creator`),
  KEY `defines_attribute_type` (`person_attribute_type_id`),
  KEY `identifies_person` (`person_id`),
  KEY `attribute_voider` (`voided_by`),
  CONSTRAINT `attribute_changer` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `attribute_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `attribute_voider` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `defines_attribute_type` FOREIGN KEY (`person_attribute_type_id`) REFERENCES `person_attribute_type` (`person_attribute_type_id`),
  CONSTRAINT `identifies_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_attribute`
--

LOCK TABLES `person_attribute` WRITE;
/*!40000 ALTER TABLE `person_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_attribute_type`
--

DROP TABLE IF EXISTS `person_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_attribute_type` (
  `person_attribute_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  `format` varchar(50) DEFAULT NULL,
  `foreign_key` int(11) DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `edit_privilege` varchar(255) DEFAULT NULL,
  `sort_weight` double DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`person_attribute_type_id`),
  UNIQUE KEY `person_attribute_type_uuid_index` (`uuid`),
  KEY `attribute_is_searchable` (`searchable`),
  KEY `name_of_attribute` (`name`),
  KEY `person_attribute_type_retired_status` (`retired`),
  KEY `attribute_type_changer` (`changed_by`),
  KEY `attribute_type_creator` (`creator`),
  KEY `user_who_retired_person_attribute_type` (`retired_by`),
  KEY `privilege_which_can_edit` (`edit_privilege`),
  CONSTRAINT `attribute_type_changer` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `attribute_type_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `privilege_which_can_edit` FOREIGN KEY (`edit_privilege`) REFERENCES `privilege` (`privilege`),
  CONSTRAINT `user_who_retired_person_attribute_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_attribute_type`
--

LOCK TABLES `person_attribute_type` WRITE;
/*!40000 ALTER TABLE `person_attribute_type` DISABLE KEYS */;
INSERT INTO `person_attribute_type` VALUES (8,'givenNameLocal','givenNameLocal','java.lang.String',NULL,0,1,'2015-11-12 08:45:01',NULL,NULL,0,NULL,NULL,NULL,NULL,3,'a98d36e0-8919-11e5-8b59-08002715d519'),(9,'familyNameLocal','familyNameLocal','java.lang.String',NULL,0,1,'2015-11-12 08:45:01',NULL,NULL,0,NULL,NULL,NULL,NULL,3,'a98e879d-8919-11e5-8b59-08002715d519'),(10,'middleNameLocal','middleNameLocal','java.lang.String',NULL,0,1,'2015-11-12 08:45:01',NULL,NULL,0,NULL,NULL,NULL,NULL,3,'a98fe4a3-8919-11e5-8b59-08002715d519');
/*!40000 ALTER TABLE `person_attribute_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_merge_log`
--

DROP TABLE IF EXISTS `person_merge_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_merge_log` (
  `person_merge_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `winner_person_id` int(11) NOT NULL,
  `loser_person_id` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `merged_data` longtext NOT NULL,
  `uuid` char(38) NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`person_merge_log_id`),
  UNIQUE KEY `person_merge_log_unique_uuid` (`uuid`),
  KEY `person_merge_log_winner` (`winner_person_id`),
  KEY `person_merge_log_loser` (`loser_person_id`),
  KEY `person_merge_log_creator` (`creator`),
  KEY `person_merge_log_changed_by_fk` (`changed_by`),
  KEY `person_merge_log_voided_by_fk` (`voided_by`),
  CONSTRAINT `person_merge_log_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `person_merge_log_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `person_merge_log_loser` FOREIGN KEY (`loser_person_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `person_merge_log_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `person_merge_log_winner` FOREIGN KEY (`winner_person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_merge_log`
--

LOCK TABLES `person_merge_log` WRITE;
/*!40000 ALTER TABLE `person_merge_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_merge_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_name`
--

DROP TABLE IF EXISTS `person_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_name` (
  `person_name_id` int(11) NOT NULL AUTO_INCREMENT,
  `preferred` tinyint(1) NOT NULL DEFAULT '0',
  `person_id` int(11) NOT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  `given_name` varchar(50) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `family_name_prefix` varchar(50) DEFAULT NULL,
  `family_name` varchar(50) DEFAULT NULL,
  `family_name2` varchar(50) DEFAULT NULL,
  `family_name_suffix` varchar(50) DEFAULT NULL,
  `degree` varchar(50) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`person_name_id`),
  UNIQUE KEY `person_name_uuid_index` (`uuid`),
  KEY `first_name` (`given_name`),
  KEY `last_name` (`family_name`),
  KEY `middle_name` (`middle_name`),
  KEY `family_name2` (`family_name2`),
  KEY `user_who_made_name` (`creator`),
  KEY `name_for_person` (`person_id`),
  KEY `user_who_voided_name` (`voided_by`),
  CONSTRAINT `name_for_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON UPDATE CASCADE,
  CONSTRAINT `user_who_made_name` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_name` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_name`
--

LOCK TABLES `person_name` WRITE;
/*!40000 ALTER TABLE `person_name` DISABLE KEYS */;
INSERT INTO `person_name` VALUES (1,1,1,NULL,'Super','',NULL,'User',NULL,NULL,NULL,1,'2005-01-01 00:00:00',0,NULL,NULL,NULL,NULL,NULL,'63391ed0-8919-11e5-8b59-08002715d519'),(2,1,3,NULL,'Lab',NULL,NULL,'System',NULL,NULL,NULL,1,'2015-11-12 08:46:31',0,NULL,NULL,NULL,NULL,NULL,'df19d5aa-8919-11e5-8b59-08002715d519'),(3,1,4,NULL,'Billing',NULL,NULL,'System',NULL,NULL,NULL,1,'2015-11-12 08:46:31',0,NULL,NULL,NULL,NULL,NULL,'df1a04f9-8919-11e5-8b59-08002715d519');
/*!40000 ALTER TABLE `person_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilege`
--

DROP TABLE IF EXISTS `privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privilege` (
  `privilege` varchar(255) NOT NULL,
  `description` text,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`privilege`),
  UNIQUE KEY `privilege_uuid_index` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilege`
--

LOCK TABLES `privilege` WRITE;
/*!40000 ALTER TABLE `privilege` DISABLE KEYS */;
INSERT INTO `privilege` VALUES ('Add Allergies','Add allergies','7e40d25c-8919-11e5-8b59-08002715d519'),('Add Cohorts','Able to add a cohort to the system','633a367a-8919-11e5-8b59-08002715d519'),('Add Concept Proposals','Able to add concept proposals to the system','633a37b0-8919-11e5-8b59-08002715d519'),('Add Drug Groups','Ability to create Drug Groups','6693fec2-e298-4717-9e98-4907be392b64'),('Add Drug Info','Ability to create Drug Info','4b50562d-3b2a-402a-9c83-67ede439acda'),('Add Encounters','Able to add patient encounters','633a383a-8919-11e5-8b59-08002715d519'),('Add HL7 Inbound Archive','Able to add an HL7 archive item','7e41029e-8919-11e5-8b59-08002715d519'),('Add HL7 Inbound Exception','Able to add an HL7 error item','7e412d27-8919-11e5-8b59-08002715d519'),('Add HL7 Inbound Queue','Able to add an HL7 Queue item','7e4158b6-8919-11e5-8b59-08002715d519'),('Add HL7 Source','Able to add an HL7 Source','7e419f6d-8919-11e5-8b59-08002715d519'),('Add Observations','Able to add patient observations','633a38b8-8919-11e5-8b59-08002715d519'),('Add Orders','Able to add orders','633a392f-8919-11e5-8b59-08002715d519'),('Add Patient Identifiers','Able to add patient identifiers','633a39a6-8919-11e5-8b59-08002715d519'),('Add Patient Lists','Ability to create patient lists','d3b235dc-7ba1-4940-bb0b-b1af67e1f84e'),('Add Patient Programs','Able to add patients to programs','633a3a29-8919-11e5-8b59-08002715d519'),('Add Patients','Able to add patients','633a3aa5-8919-11e5-8b59-08002715d519'),('Add People','Able to add person objects','633a3b1b-8919-11e5-8b59-08002715d519'),('Add Problems','Add problems','7e41c177-8919-11e5-8b59-08002715d519'),('Add Relationships','Able to add relationships','633a3b83-8919-11e5-8b59-08002715d519'),('Add Report Objects','Able to add report objects','633a3beb-8919-11e5-8b59-08002715d519'),('Add Reports','Able to add reports','633a3c51-8919-11e5-8b59-08002715d519'),('Add Users','Able to add users to OpenMRS','633a3cb7-8919-11e5-8b59-08002715d519'),('Add Visits','Able to add visits','7e41e320-8919-11e5-8b59-08002715d519'),('app:admin','Bahmni admin app access privilege','1e2202b8-891a-11e5-8b59-08002715d519'),('app:adt','bahmni adt access privilege','a974404a-8919-11e5-8b59-08002715d519'),('app:clinical','Bahmni clinical app access privilege','a9612b60-8919-11e5-8b59-08002715d519'),('app:clinical:consultationTab','View Consultation tab','1ea2c527-891a-11e5-8b59-08002715d519'),('app:clinical:deleteDiagnosis','Bahmni delete diagnosis privilege','1eeae2a2-891a-11e5-8b59-08002715d519'),('app:clinical:diagnosisTab','View and Edit Diagnosis tab','1e9e7c50-891a-11e5-8b59-08002715d519'),('app:clinical:dispositionTab','View Disposition tab','1e9fe6ab-891a-11e5-8b59-08002715d519'),('app:clinical:grantProviderAccess','Bahmni clinical app grant access for other Provider','1eed2468-891a-11e5-8b59-08002715d519'),('app:clinical:history','Bahmni observation history view and edit','1e9d1969-891a-11e5-8b59-08002715d519'),('app:clinical:observationTab','View Observation tab','1ea14137-891a-11e5-8b59-08002715d519'),('app:clinical:retrospective','Bahmni clinical app retrospective access privilege','1ed90ef2-891a-11e5-8b59-08002715d519'),('app:common:closeVisit','Adding close visit privilege','1ee8736b-891a-11e5-8b59-08002715d519'),('app:common:registration_consultation_link','Adding Registration to/from Consultation Link','1ee63781-891a-11e5-8b59-08002715d519'),('app:document-upload','bahmni document upload access privilege','a972c05d-8919-11e5-8b59-08002715d519'),('app:emergency','bahmni emergency app access privilege','af86b76f-8919-11e5-8b59-08002715d519'),('app:orders','Bahmni Orders App Access Privilege','1ee9a9dd-891a-11e5-8b59-08002715d519'),('app:radiologyOrders','Bahmni radiology orders access privilege','a962bcb3-8919-11e5-8b59-08002715d519'),('app:registration','Bahmni registration app access privilege','af855a9d-8919-11e5-8b59-08002715d519'),('Assign Beds','Able to assign bed to patient','7070d07c-891a-11e5-8b59-08002715d519'),('Assign System Developer Role','Able to assign System Developer role','58554e9b-e543-413a-b448-aba04270cf8a'),('bahmni:clinical:dispense','Bahmni drug order dispensing privilege','1edefdce-891a-11e5-8b59-08002715d519'),('Configure Visits','Able to choose encounter visit handler and enable/disable encounter visits','7e42052f-8919-11e5-8b59-08002715d519'),('Delete Cohorts','Able to add a cohort to the system','633a3d20-8919-11e5-8b59-08002715d519'),('Delete Concept Proposals','Able to delete concept proposals from the system','633a3d86-8919-11e5-8b59-08002715d519'),('Delete Drug Groups','Ability to delete Drug Groups','b4029e56-e17b-4a88-8e39-6ad00d9b1f63'),('Delete Drug Info','Ability to delete Drug Info','d63de882-9c13-4948-aa9d-a313045766e7'),('Delete Encounters','Able to delete patient encounters','633a3df2-8919-11e5-8b59-08002715d519'),('Delete HL7 Inbound Archive','Able to delete/retire an HL7 archive item','7e421b44-8919-11e5-8b59-08002715d519'),('Delete HL7 Inbound Exception','Able to delete an HL7 archive item','7e42655e-8919-11e5-8b59-08002715d519'),('Delete HL7 Inbound Queue','Able to delete an HL7 Queue item','7e4284d3-8919-11e5-8b59-08002715d519'),('Delete Notes','Able to delete patient notes','7fb6bc91-3787-4610-b91e-72471c78ab3e'),('Delete Observations','Able to delete patient observations','633a3e59-8919-11e5-8b59-08002715d519'),('Delete Orders','Able to delete orders','633a3ec2-8919-11e5-8b59-08002715d519'),('Delete Patient Identifiers','Able to delete patient identifiers','633a3f29-8919-11e5-8b59-08002715d519'),('Delete Patient Lists','Ability to delete patient lists','8de90862-d05f-449c-bdc9-39e5f464f0ec'),('Delete Patient Programs','Able to delete patients from programs','633a3f91-8919-11e5-8b59-08002715d519'),('Delete Patients','Able to delete patients','633a3ff9-8919-11e5-8b59-08002715d519'),('Delete People','Able to delete objects','633a4060-8919-11e5-8b59-08002715d519'),('Delete Relationships','Able to delete relationships','633a40c6-8919-11e5-8b59-08002715d519'),('Delete Report Objects','Able to delete report objects','633a412d-8919-11e5-8b59-08002715d519'),('Delete Reports','Able to delete reports','633a4192-8919-11e5-8b59-08002715d519'),('Delete Users','Able to delete users in OpenMRS','633a41f9-8919-11e5-8b59-08002715d519'),('Delete Visits','Able to delete visits','7e42a4b9-8919-11e5-8b59-08002715d519'),('Edit Admission Locations','Able to Edit admission locations','70735072-891a-11e5-8b59-08002715d519'),('Edit Allergies','Able to edit allergies','7e42b4e4-8919-11e5-8b59-08002715d519'),('Edit Cohorts','Able to add a cohort to the system','633a425f-8919-11e5-8b59-08002715d519'),('Edit Concept Proposals','Able to edit concept proposals in the system','633a42c4-8919-11e5-8b59-08002715d519'),('Edit Drug Groups','Ability to edit Drug Groups','890f8b1f-1add-4ed4-917a-7640f3f60ee1'),('Edit Drug Info','Ability to edit Drug Info','c720a2e4-c768-446d-9dcb-c1992ff8a834'),('Edit Encounters','Able to edit patient encounters','633a432a-8919-11e5-8b59-08002715d519'),('Edit Notes','Able to edit patient notes','fbd7957b-1b8a-4416-8095-ac5e47c299ef'),('Edit Observations','Able to edit patient observations','633a438f-8919-11e5-8b59-08002715d519'),('Edit Orders','Able to edit orders','633a43f5-8919-11e5-8b59-08002715d519'),('Edit Patient Identifiers','Able to edit patient identifiers','633a4459-8919-11e5-8b59-08002715d519'),('Edit Patient Lists','Ability to edit patient lists','8d504b46-79d2-470a-a7e3-0dd1ba079162'),('Edit Patient Programs','Able to edit patients in programs','633a44c1-8919-11e5-8b59-08002715d519'),('Edit Patients','Able to edit patients','633a4528-8919-11e5-8b59-08002715d519'),('Edit People','Able to edit person objects','633a458d-8919-11e5-8b59-08002715d519'),('Edit Problems','Able to edit problems','7e42dc97-8919-11e5-8b59-08002715d519'),('Edit Relationships','Able to edit relationships','633a45f2-8919-11e5-8b59-08002715d519'),('Edit Report Objects','Able to edit report objects','633a4657-8919-11e5-8b59-08002715d519'),('Edit Reports','Able to edit reports','633a46bc-8919-11e5-8b59-08002715d519'),('Edit User Passwords','Able to change the passwords of users in OpenMRS','633a4723-8919-11e5-8b59-08002715d519'),('Edit Users','Able to edit users in OpenMRS','633a4789-8919-11e5-8b59-08002715d519'),('Edit Visits','Able to edit visits','7e436a02-8919-11e5-8b59-08002715d519'),('Form Entry','Allows user to access Form Entry pages/functions','633a47ef-8919-11e5-8b59-08002715d519'),('Generate Batch of Identifiers','Allows user to generate a batch of identifiers to a file for offline use','b1e447a4-f24f-4510-80c9-1e759a474311'),('Get Admission Locations','Able to view admission locations','7071c6e2-891a-11e5-8b59-08002715d519'),('Get Allergies','Able to get allergies','d05118c6-2490-4d78-a41a-390e3596a220'),('Get Beds','Able to view available beds','706fb807-891a-11e5-8b59-08002715d519'),('Get Care Settings','Able to get Care Settings','df21f3b7-8919-11e5-8b59-08002715d519'),('Get Concept Classes','Able to get concept classes','d05118c6-2490-4d78-a41a-390e3596a238'),('Get Concept Datatypes','Able to get concept datatypes','d05118c6-2490-4d78-a41a-390e3596a237'),('Get Concept Map Types','Able to get concept map types','d05118c6-2490-4d78-a41a-390e3596a230'),('Get Concept Proposals','Able to get concept proposals to the system','d05118c6-2490-4d78-a41a-390e3596a250'),('Get Concept Reference Terms','Able to get concept reference terms','d05118c6-2490-4d78-a41a-390e3596a229'),('Get Concept Sources','Able to get concept sources','d05118c6-2490-4d78-a41a-390e3596a231'),('Get Concepts','Able to get concept entries','d05118c6-2490-4d78-a41a-390e3596a251'),('Get Database Changes','Able to get database changes from the admin screen','d05118c6-2490-4d78-a41a-390e3596a222'),('Get Encounter Roles','Able to get encounter roles','d05118c6-2490-4d78-a41a-390e3596a210'),('Get Encounter Types','Able to get encounter types','d05118c6-2490-4d78-a41a-390e3596a247'),('Get Encounters','Able to get patient encounters','d05118c6-2490-4d78-a41a-390e3596a248'),('Get Field Types','Able to get field types','d05118c6-2490-4d78-a41a-390e3596a234'),('Get Forms','Able to get forms','d05118c6-2490-4d78-a41a-390e3596a240'),('Get Global Properties','Able to get global properties on the administration screen','d05118c6-2490-4d78-a41a-390e3596a226'),('Get HL7 Inbound Archive','Able to get an HL7 archive item','d05118c6-2490-4d78-a41a-390e3596a217'),('Get HL7 Inbound Exception','Able to get an HL7 error item','d05118c6-2490-4d78-a41a-390e3596a216'),('Get HL7 Inbound Queue','Able to get an HL7 Queue item','d05118c6-2490-4d78-a41a-390e3596a218'),('Get HL7 Source','Able to get an HL7 Source','d05118c6-2490-4d78-a41a-390e3596a219'),('Get Identifier Types','Able to get patient identifier types','d05118c6-2490-4d78-a41a-390e3596a239'),('Get Location Attribute Types','Able to get location attribute types','d05118c6-2490-4d78-a41a-390e3596a212'),('Get Locations','Able to get locations','d05118c6-2490-4d78-a41a-390e3596a246'),('Get Notes','Able to get patient notes','a86a1c52-bbb9-4221-9fa1-3dbd00483e53'),('Get Observations','Able to get patient observations','d05118c6-2490-4d78-a41a-390e3596a245'),('Get Order Frequencies','Able to get Order Frequencies','df1e6e88-8919-11e5-8b59-08002715d519'),('Get Order Types','Able to get order types','d05118c6-2490-4d78-a41a-390e3596a233'),('Get Orders','Able to get orders','d05118c6-2490-4d78-a41a-390e3596a241'),('Get Patient Cohorts','Able to get patient cohorts','d05118c6-2490-4d78-a41a-390e3596a242'),('Get Patient Identifiers','Able to get patient identifiers','d05118c6-2490-4d78-a41a-390e3596a243'),('Get Patient Programs','Able to get which programs that patients are in','d05118c6-2490-4d78-a41a-390e3596a227'),('Get Patients','Able to get patients','d05118c6-2490-4d78-a41a-390e3596a244'),('Get People','Able to get person objects','d05118c6-2490-4d78-a41a-390e3596a224'),('Get Person Attribute Types','Able to get person attribute types','d05118c6-2490-4d78-a41a-390e3596a225'),('Get Privileges','Able to get user privileges','d05118c6-2490-4d78-a41a-390e3596a236'),('Get Problems','Able to get problems','d05118c6-2490-4d78-a41a-390e3596a221'),('Get Programs','Able to get patient programs','d05118c6-2490-4d78-a41a-390e3596a228'),('Get Providers','Able to get Providers','d05118c6-2490-4d78-a41a-390e3596a211'),('Get Relationship Types','Able to get relationship types','d05118c6-2490-4d78-a41a-390e3596a232'),('Get Relationships','Able to get relationships','d05118c6-2490-4d78-a41a-390e3596a223'),('Get Roles','Able to get user roles','d05118c6-2490-4d78-a41a-390e3596a235'),('Get Users','Able to get users in OpenMRS','d05118c6-2490-4d78-a41a-390e3596a249'),('Get Visit Attribute Types','Able to get visit attribute types','d05118c6-2490-4d78-a41a-390e3596a213'),('Get Visit Types','Able to get visit types','d05118c6-2490-4d78-a41a-390e3596a215'),('Get Visits','Able to get visits','d05118c6-2490-4d78-a41a-390e3596a214'),('Manage Address Hierarchy','Able to add/edit/delete address hierarchies','7e43890f-8919-11e5-8b59-08002715d519'),('Manage Address Templates','Able to add/edit/delete address templates','7e43acd5-8919-11e5-8b59-08002715d519'),('Manage Alerts','Able to add/edit/delete user alerts','633a4854-8919-11e5-8b59-08002715d519'),('Manage Auto Generation Options','Allows user add, edit, and remove auto-generation options','7aeab834-2063-429d-bc0f-b5e37b7a78ee'),('Manage Cohort Definitions','Add/Edit/Remove Cohort Definitions','e86c7034-b2cc-4e23-814b-4e7163ba815c'),('Manage Concept Classes','Able to add/edit/retire concept classes','633a48b9-8919-11e5-8b59-08002715d519'),('Manage Concept Datatypes','Able to add/edit/retire concept datatypes','633a4920-8919-11e5-8b59-08002715d519'),('Manage Concept Map Types','Able to add/edit/retire concept map types','7e44cf04-8919-11e5-8b59-08002715d519'),('Manage Concept Name tags','Able to add/edit/delete concept name tags','7e44f24e-8919-11e5-8b59-08002715d519'),('Manage Concept Reference Terms','Able to add/edit/retire reference terms','7e450c9b-8919-11e5-8b59-08002715d519'),('Manage Concept Sources','Able to add/edit/delete concept sources','633a4986-8919-11e5-8b59-08002715d519'),('Manage Concept Stop Words','Able to view/add/remove the concept stop words','7e4518c1-8919-11e5-8b59-08002715d519'),('Manage Concepts','Able to add/edit/delete concept entries','633a49ed-8919-11e5-8b59-08002715d519'),('Manage Data Set Definitions','Add/Edit/Remove Data Set Definitions','3898c69a-c399-46e9-8ebb-cf3273b0a9dd'),('Manage Dimension Definitions','Add/Edit/Remove Dimension Definitions','0b1ed950-9399-4a23-8b2d-f012d27aac58'),('Manage Encounter Roles','Able to add/edit/retire encounter roles','7e4554ee-8919-11e5-8b59-08002715d519'),('Manage Encounter Types','Able to add/edit/delete encounter types','633a4a54-8919-11e5-8b59-08002715d519'),('Manage Field Types','Able to add/edit/retire field types','633a4aba-8919-11e5-8b59-08002715d519'),('Manage FormEntry XSN','Allows user to upload and edit the xsns stored on the server','633a4b20-8919-11e5-8b59-08002715d519'),('Manage Forms','Able to add/edit/delete forms','633a4b87-8919-11e5-8b59-08002715d519'),('Manage Global Properties','Able to add/edit global properties','633a4bee-8919-11e5-8b59-08002715d519'),('Manage HL7 Messages','Able to add/edit/delete HL7 messages','7e456fc0-8919-11e5-8b59-08002715d519'),('Manage Identifier Sequence','Allows user to update Identifier sequence','875b901a-5da7-4fdb-8ebe-154f3a4c995a'),('Manage Identifier Sources','Allows user add, edit, and remove identifier sources','b75576ac-eecb-46a1-b304-90bff9305e98'),('Manage Identifier Types','Able to add/edit/delete patient identifier types','633a4c54-8919-11e5-8b59-08002715d519'),('Manage Implementation Id','Able to view/add/edit the implementation id for the system','7e458d8e-8919-11e5-8b59-08002715d519'),('Manage Indicator Definitions','Add/Edit/Remove Indicator Definitions','6f9ed8fa-487e-4aa9-89e2-b2785837c995'),('Manage Location Attribute Types','Able to add/edit/retire location attribute types','7e45a931-8919-11e5-8b59-08002715d519'),('Manage Location Tags','Able to add/edit/delete location tags','7e45c7ea-8919-11e5-8b59-08002715d519'),('Manage Locations','Able to add/edit/delete locations','633a4cba-8919-11e5-8b59-08002715d519'),('Manage Modules','Able to add/remove modules to the system','633a4d1e-8919-11e5-8b59-08002715d519'),('Manage Order Frequencies','Able to add/edit/retire Order Frequencies','df2044b4-8919-11e5-8b59-08002715d519'),('Manage Order Types','Able to add/edit/retire order types','633a4d83-8919-11e5-8b59-08002715d519'),('Manage Person Attribute Types','Able to add/edit/delete person attribute types','633a4dea-8919-11e5-8b59-08002715d519'),('Manage Privileges','Able to add/edit/delete privileges','633a4e50-8919-11e5-8b59-08002715d519'),('Manage Programs','Able to add/view/delete patient programs','633a4eb6-8919-11e5-8b59-08002715d519'),('Manage Providers','Able to edit Provider','7e45e7f9-8919-11e5-8b59-08002715d519'),('Manage Relationship Types','Able to add/edit/retire relationship types','633a4f1d-8919-11e5-8b59-08002715d519'),('Manage Relationships','Able to add/edit/delete relationships','633a4f85-8919-11e5-8b59-08002715d519'),('Manage Report Definitions','Add/Edit/Remove Report Definitions','b7a1d376-9915-4d8a-8c4b-636afc2853e2'),('Manage Report Designs','Add/Edit/Remove Report Designs','8002a36c-ee9b-406f-a4ba-4f059c50fd99'),('Manage Reports','Base privilege for add/edit/delete reporting definitions. This gives access to the administrative menus, but you need to grant additional privileges to manage each specific type of reporting definition','8fd6f471-07ac-4911-a24c-4bfd9966e59b'),('Manage RESTWS','Allows to configure RESTWS module','5b23310a-636b-44cf-b5c0-75bedfa2fc96'),('Manage Roles','Able to add/edit/delete user roles','633a4feb-8919-11e5-8b59-08002715d519'),('Manage Rule Definitions','Allows creation and editing of user-defined rules','7e460647-8919-11e5-8b59-08002715d519'),('Manage Scheduled Report Tasks','Manage Task Scheduling in Reporting Module','421af22f-4a29-4b9f-9cad-39baa1fccd52'),('Manage Scheduler','Able to add/edit/remove scheduled tasks','633a504f-8919-11e5-8b59-08002715d519'),('Manage Search Index','Able to manage the search index','71082320-1bc5-4ea8-8446-0026d2b726d9'),('Manage Token Registrations','Allows to create/update/delete token registrations','4173a0a9-463f-4b28-b6bf-7ec698abdd41'),('Manage Tokens','Allows registering and removal of tokens','7e46255d-8919-11e5-8b59-08002715d519'),('Manage Visit Attribute Types','Able to add/edit/retire visit attribute types','7e463c36-8919-11e5-8b59-08002715d519'),('Manage Visit Types','Able to add/edit/delete visit types','7e465be8-8919-11e5-8b59-08002715d519'),('Metadata Mapping','Allows the user to prepare concepts for publishing/subscribing','da55e3d3-4f54-4775-aa30-09f6a91f8f04'),('Patient Dashboard - View Demographics Section','Able to view the \'Demographics\' tab on the patient dashboard','633a50b5-8919-11e5-8b59-08002715d519'),('Patient Dashboard - View Encounters Section','Able to view the \'Encounters\' tab on the patient dashboard','633a5131-8919-11e5-8b59-08002715d519'),('Patient Dashboard - View Forms Section','Allows user to view the Forms tab on the patient dashboard','633a519e-8919-11e5-8b59-08002715d519'),('Patient Dashboard - View Graphs Section','Able to view the \'Graphs\' tab on the patient dashboard','633a5208-8919-11e5-8b59-08002715d519'),('Patient Dashboard - View Overview Section','Able to view the \'Overview\' tab on the patient dashboard','633a5275-8919-11e5-8b59-08002715d519'),('Patient Dashboard - View Patient Summary','Able to view the \'Summary\' tab on the patient dashboard','633a52e1-8919-11e5-8b59-08002715d519'),('Patient Dashboard - View Regimen Section','Able to view the \'Regimen\' tab on the patient dashboard','633a534d-8919-11e5-8b59-08002715d519'),('Patient Dashboard - View Visits Section','Able to view the \'Visits\' tab on the patient dashboard','7e467f9d-8919-11e5-8b59-08002715d519'),('Patient Overview - View Allergies','Able to view the Allergies portlet on the patient overview tab','d05118c6-2490-4d78-a41a-390e3596a261'),('Patient Overview - View Patient Actions','Able to view the Patient Actions portlet on the patient overview tab','d05118c6-2490-4d78-a41a-390e3596a264'),('Patient Overview - View Patient Flags','Able to view the \'Patient Flags\' portlet on the patient dashboard\'s overview tab','be363354-9a66-4140-b777-68ddadb5191d'),('Patient Overview - View Problem List','Able to view the Problem List portlet on the patient overview tab','d05118c6-2490-4d78-a41a-390e3596a260'),('Patient Overview - View Programs','Able to view the Programs portlet on the patient overview tab','d05118c6-2490-4d78-a41a-390e3596a263'),('Patient Overview - View Relationships','Able to view the Relationships portlet on the patient overview tab','d05118c6-2490-4d78-a41a-390e3596a262'),('Provider Management - Admin','Allows access to admin pages of the provider management module','2a7b5be4-5ee0-4033-838d-266b80e8c2d4'),('Provider Management API','Allows access to all provider management service and provider suggestion service API method','34179d6a-d5c9-4dcc-8b52-9ea993e3903f'),('Provider Management API - Read-only','Allows access to all provider management service and provider suggestion service API methods that are read-only','9fea1671-8ed1-4ed1-ba62-ce9061cc26fa'),('Provider Management Dashboard - Edit Patients','Allows access to editing patient information on the provider management dashboard','f800b1e6-77de-47cf-991a-3c54f4ee4c29'),('Provider Management Dashboard - Edit Providers','Allows access to editing provider information on the provider management dashboard','13800823-f18a-4c7d-a6d9-c8bb2d23ca66'),('Provider Management Dashboard - View Historical','Allows access to viewing historical patient (if user has view patients right) and supervisee information on the provider management dashboard','c315f6a2-a40b-4102-b570-d6b1e23f1a65'),('Provider Management Dashboard - View Patients','Allows access to viewing patient information on the provider management dashboard','e8f5ae9a-016b-49e8-96a1-dd29bfd791c7'),('Provider Management Dashboard - View Providers','Allows access to viewing provider information on the provider management dashboard','adebd8ae-6760-4898-8771-9b6137729c60'),('Purge Field Types','Able to purge field types','633a53bd-8919-11e5-8b59-08002715d519'),('Remove Allergies','Remove allergies','7e46a45c-8919-11e5-8b59-08002715d519'),('Remove Problems','Remove problems','7e46cab1-8919-11e5-8b59-08002715d519'),('Run Reports','Schedule the running of a report','d751e0cc-4caa-4cde-aeff-8293749a2bfb'),('Share Metadata','Allows user to export and import metadata','6188d48b-779f-4f04-b8dc-e204940e1771'),('Update HL7 Inbound Archive','Able to update an HL7 archive item','7e46eec8-8919-11e5-8b59-08002715d519'),('Update HL7 Inbound Exception','Able to update an HL7 archive item','7e470e45-8919-11e5-8b59-08002715d519'),('Update HL7 Inbound Queue','Able to update an HL7 Queue item','7e472637-8919-11e5-8b59-08002715d519'),('Update HL7 Source','Able to update an HL7 Source','7e474907-8919-11e5-8b59-08002715d519'),('Upload Batch of Identifiers','Allows user to upload a batch of identifiers','d4bf7fd6-1036-459c-a3ff-cbba1fc8d7ef'),('Upload XSN','Allows user to upload/overwrite the XSNs defined for forms','633a5423-8919-11e5-8b59-08002715d519'),('View Administration Functions','Able to view the \'Administration\' link in the navigation bar','633a5489-8919-11e5-8b59-08002715d519'),('View Allergies','Able to view allergies in OpenMRS','633a54f4-8919-11e5-8b59-08002715d519'),('View Calculations','Allows to view Calculations','35cd1708-d290-499f-9d10-66665f095296'),('View Concept Classes','Able to view concept classes','633a562b-8919-11e5-8b59-08002715d519'),('View Concept Datatypes','Able to view concept datatypes','633a5696-8919-11e5-8b59-08002715d519'),('View Concept Map Types','Able to view concept map types','7e476c2c-8919-11e5-8b59-08002715d519'),('View Concept Proposals','Able to view concept proposals to the system','633a56fd-8919-11e5-8b59-08002715d519'),('View Concept Reference Terms','Able to view concept reference terms','7e478d95-8919-11e5-8b59-08002715d519'),('View Concept Sources','Able to view concept sources','633a58a3-8919-11e5-8b59-08002715d519'),('View Concepts','Able to view concept entries','633a5940-8919-11e5-8b59-08002715d519'),('View Data Entry Statistics','Able to view data entry statistics from the admin screen','633a59aa-8919-11e5-8b59-08002715d519'),('View Database Changes','Able to view database changes from the admin screen','7e47ae1a-8919-11e5-8b59-08002715d519'),('View Drug Groups','Ability to view Drug Groups','2429f246-182d-427d-87e3-8703cbe105ea'),('View Drug Info','Ability to view Drug Info','0730eb2e-89dd-4155-bd32-2780db62a8cd'),('View Encounter Roles','Able to view encounter roles','7e47cf03-8919-11e5-8b59-08002715d519'),('View Encounter Types','Able to view encounter types','633a5a14-8919-11e5-8b59-08002715d519'),('View Encounters','Able to view patient encounters','633a5a79-8919-11e5-8b59-08002715d519'),('View Field Types','Able to view field types','633a5adf-8919-11e5-8b59-08002715d519'),('View Forms','Able to view forms','633a5b47-8919-11e5-8b59-08002715d519'),('View Global Properties','Able to view global properties on the administration screen','633a5bad-8919-11e5-8b59-08002715d519'),('View HL7 Inbound Archive','Able to view an HL7 archive item','7e480ae1-8919-11e5-8b59-08002715d519'),('View HL7 Inbound Exception','Able to view an HL7 archive item','7e482c53-8919-11e5-8b59-08002715d519'),('View HL7 Inbound Queue','Able to view an HL7 Queue item','7e484ecc-8919-11e5-8b59-08002715d519'),('View HL7 Source','Able to view an HL7 Source','7e486e2f-8919-11e5-8b59-08002715d519'),('View Identifier Types','Able to view patient identifier types','633a5c15-8919-11e5-8b59-08002715d519'),('View Location Attribute Types','Able to view location attribute types','7e488657-8919-11e5-8b59-08002715d519'),('View Locations','Able to view locations','633a5c7d-8919-11e5-8b59-08002715d519'),('View Navigation Menu','Ability to see the navigation menu','633a5ce3-8919-11e5-8b59-08002715d519'),('View Observations','Able to view patient observations','633a5d48-8919-11e5-8b59-08002715d519'),('View Order Types','Able to view order types','633a5dae-8919-11e5-8b59-08002715d519'),('View Orders','Able to view orders','633a5e14-8919-11e5-8b59-08002715d519'),('View Patient Cohorts','Able to view patient cohorts','633a5e78-8919-11e5-8b59-08002715d519'),('View Patient Identifiers','Able to view patient identifiers','633a5ee0-8919-11e5-8b59-08002715d519'),('View Patient Lists','Ability to view patient lists','af1fd192-1208-48e6-af68-4f4918fb4c49'),('View Patient Programs','Able to see which programs that patients are in','633a5f47-8919-11e5-8b59-08002715d519'),('View Patients','Able to view patients','633a5fad-8919-11e5-8b59-08002715d519'),('View People','Able to view person objects','633a6014-8919-11e5-8b59-08002715d519'),('View Person Attribute Types','Able to view person attribute types','633a607a-8919-11e5-8b59-08002715d519'),('View Privileges','Able to view user privileges','633a60e2-8919-11e5-8b59-08002715d519'),('View Problems','Able to view problems in OpenMRS','633a6146-8919-11e5-8b59-08002715d519'),('View Programs','Able to view patient programs','633a61ac-8919-11e5-8b59-08002715d519'),('View Providers','Able to view Provider','7e48a77c-8919-11e5-8b59-08002715d519'),('View Relationship Types','Able to view relationship types','633a6211-8919-11e5-8b59-08002715d519'),('View Relationships','Able to view relationships','633a6277-8919-11e5-8b59-08002715d519'),('View Report Objects','Able to view report objects','633a62de-8919-11e5-8b59-08002715d519'),('View Reports','Able to view reports','633a6343-8919-11e5-8b59-08002715d519'),('View RESTWS','Gives access to RESTWS in administration','fd22afb9-2732-475a-83c3-1ce530acdc76'),('View Roles','Able to view user roles','633a63a9-8919-11e5-8b59-08002715d519'),('View Rule Definitions','Allows viewing of user-defined rules. (This privilege is not necessary to run rules under normal usage.)','7e48c720-8919-11e5-8b59-08002715d519'),('View Token Registrations','Allows to view token registrations','03ddcad5-ec2c-4a11-bf00-9f33dc51d21a'),('View Unpublished Forms','Able to view and fill out unpublished forms','633a6411-8919-11e5-8b59-08002715d519'),('View Users','Able to view users in OpenMRS','633a6478-8919-11e5-8b59-08002715d519'),('View Visit Attribute Types','Able to view visit attribute types','7e48eaea-8919-11e5-8b59-08002715d519'),('View Visit Types','Able to view visit types','7e490cad-8919-11e5-8b59-08002715d519'),('View Visits','Able to view visits','7e492b3a-8919-11e5-8b59-08002715d519');
/*!40000 ALTER TABLE `privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program` (
  `program_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `outcomes_concept_id` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `description` text,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`program_id`),
  UNIQUE KEY `program_uuid_index` (`uuid`),
  KEY `user_who_changed_program` (`changed_by`),
  KEY `program_concept` (`concept_id`),
  KEY `program_creator` (`creator`),
  KEY `program_outcomes_concept_id_fk` (`outcomes_concept_id`),
  CONSTRAINT `program_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `program_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `program_outcomes_concept_id_fk` FOREIGN KEY (`outcomes_concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `user_who_changed_program` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_workflow`
--

DROP TABLE IF EXISTS `program_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_workflow` (
  `program_workflow_id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL DEFAULT '0',
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`program_workflow_id`),
  UNIQUE KEY `program_workflow_uuid_index` (`uuid`),
  KEY `workflow_changed_by` (`changed_by`),
  KEY `workflow_concept` (`concept_id`),
  KEY `workflow_creator` (`creator`),
  KEY `program_for_workflow` (`program_id`),
  CONSTRAINT `program_for_workflow` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`),
  CONSTRAINT `workflow_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `workflow_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `workflow_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_workflow`
--

LOCK TABLES `program_workflow` WRITE;
/*!40000 ALTER TABLE `program_workflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `program_workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_workflow_state`
--

DROP TABLE IF EXISTS `program_workflow_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_workflow_state` (
  `program_workflow_state_id` int(11) NOT NULL AUTO_INCREMENT,
  `program_workflow_id` int(11) NOT NULL DEFAULT '0',
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `initial` tinyint(1) NOT NULL DEFAULT '0',
  `terminal` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`program_workflow_state_id`),
  UNIQUE KEY `program_workflow_state_uuid_index` (`uuid`),
  KEY `state_changed_by` (`changed_by`),
  KEY `state_concept` (`concept_id`),
  KEY `state_creator` (`creator`),
  KEY `workflow_for_state` (`program_workflow_id`),
  CONSTRAINT `state_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `state_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `state_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `workflow_for_state` FOREIGN KEY (`program_workflow_id`) REFERENCES `program_workflow` (`program_workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_workflow_state`
--

LOCK TABLES `program_workflow_state` WRITE;
/*!40000 ALTER TABLE `program_workflow_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `program_workflow_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider` (
  `provider_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `provider_role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`provider_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `provider_changed_by_fk` (`changed_by`),
  KEY `provider_person_id_fk` (`person_id`),
  KEY `provider_retired_by_fk` (`retired_by`),
  KEY `provider_creator_fk` (`creator`),
  KEY `provider_role_id` (`provider_role_id`),
  CONSTRAINT `provider_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `provider_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `provider_ibfk_1` FOREIGN KEY (`provider_role_id`) REFERENCES `providermanagement_provider_role` (`provider_role_id`),
  CONSTRAINT `provider_person_id_fk` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `provider_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES (1,2,'Lab Manager','LABMANAGER',1,'2015-11-12 08:45:01',NULL,NULL,0,NULL,NULL,NULL,'a9996f9a-8919-11e5-8b59-08002715d519',NULL),(2,3,'Lab System','LABSYSTEM',1,'2015-11-12 08:45:42',NULL,NULL,0,NULL,NULL,NULL,'c1acd4c7-8919-11e5-8b59-08002715d519',NULL),(4,4,'Billing System','BILLINGSYSTEM',1,'2015-11-12 08:45:52',NULL,NULL,0,NULL,NULL,NULL,'c7bec6d3-8919-11e5-8b59-08002715d519',NULL);
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider_attribute`
--

DROP TABLE IF EXISTS `provider_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider_attribute` (
  `provider_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_id` int(11) NOT NULL,
  `attribute_type_id` int(11) NOT NULL,
  `value_reference` text NOT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`provider_attribute_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `provider_attribute_provider_fk` (`provider_id`),
  KEY `provider_attribute_attribute_type_id_fk` (`attribute_type_id`),
  KEY `provider_attribute_creator_fk` (`creator`),
  KEY `provider_attribute_changed_by_fk` (`changed_by`),
  KEY `provider_attribute_voided_by_fk` (`voided_by`),
  CONSTRAINT `provider_attribute_attribute_type_id_fk` FOREIGN KEY (`attribute_type_id`) REFERENCES `provider_attribute_type` (`provider_attribute_type_id`),
  CONSTRAINT `provider_attribute_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `provider_attribute_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `provider_attribute_provider_fk` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`),
  CONSTRAINT `provider_attribute_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider_attribute`
--

LOCK TABLES `provider_attribute` WRITE;
/*!40000 ALTER TABLE `provider_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `provider_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider_attribute_type`
--

DROP TABLE IF EXISTS `provider_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider_attribute_type` (
  `provider_attribute_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `datatype` varchar(255) DEFAULT NULL,
  `datatype_config` text,
  `preferred_handler` varchar(255) DEFAULT NULL,
  `handler_config` text,
  `min_occurs` int(11) NOT NULL,
  `max_occurs` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`provider_attribute_type_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `provider_attribute_type_creator_fk` (`creator`),
  KEY `provider_attribute_type_changed_by_fk` (`changed_by`),
  KEY `provider_attribute_type_retired_by_fk` (`retired_by`),
  CONSTRAINT `provider_attribute_type_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `provider_attribute_type_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `provider_attribute_type_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider_attribute_type`
--

LOCK TABLES `provider_attribute_type` WRITE;
/*!40000 ALTER TABLE `provider_attribute_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `provider_attribute_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providermanagement_provider_role`
--

DROP TABLE IF EXISTS `providermanagement_provider_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providermanagement_provider_role` (
  `provider_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`provider_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providermanagement_provider_role`
--

LOCK TABLES `providermanagement_provider_role` WRITE;
/*!40000 ALTER TABLE `providermanagement_provider_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `providermanagement_provider_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providermanagement_provider_role_provider_attribute_type`
--

DROP TABLE IF EXISTS `providermanagement_provider_role_provider_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providermanagement_provider_role_provider_attribute_type` (
  `provider_role_id` int(11) NOT NULL,
  `provider_attribute_type_id` int(11) NOT NULL,
  KEY `provider_role_id` (`provider_role_id`),
  KEY `provider_attribute_type_id` (`provider_attribute_type_id`),
  CONSTRAINT `providermanagement_prpat_provider_attribute_type_fk` FOREIGN KEY (`provider_attribute_type_id`) REFERENCES `provider_attribute_type` (`provider_attribute_type_id`),
  CONSTRAINT `providermanagement_prpat_provider_role_fk` FOREIGN KEY (`provider_role_id`) REFERENCES `providermanagement_provider_role` (`provider_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providermanagement_provider_role_provider_attribute_type`
--

LOCK TABLES `providermanagement_provider_role_provider_attribute_type` WRITE;
/*!40000 ALTER TABLE `providermanagement_provider_role_provider_attribute_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `providermanagement_provider_role_provider_attribute_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providermanagement_provider_role_relationship_type`
--

DROP TABLE IF EXISTS `providermanagement_provider_role_relationship_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providermanagement_provider_role_relationship_type` (
  `provider_role_id` int(11) NOT NULL,
  `relationship_type_id` int(11) NOT NULL,
  KEY `provider_role_id` (`provider_role_id`),
  KEY `relationship_type_id` (`relationship_type_id`),
  CONSTRAINT `providermanagement_provider_role_relationship_type_ibfk_1` FOREIGN KEY (`provider_role_id`) REFERENCES `providermanagement_provider_role` (`provider_role_id`),
  CONSTRAINT `providermanagement_provider_role_relationship_type_ibfk_2` FOREIGN KEY (`relationship_type_id`) REFERENCES `relationship_type` (`relationship_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providermanagement_provider_role_relationship_type`
--

LOCK TABLES `providermanagement_provider_role_relationship_type` WRITE;
/*!40000 ALTER TABLE `providermanagement_provider_role_relationship_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `providermanagement_provider_role_relationship_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providermanagement_provider_role_supervisee_provider_role`
--

DROP TABLE IF EXISTS `providermanagement_provider_role_supervisee_provider_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providermanagement_provider_role_supervisee_provider_role` (
  `provider_role_id` int(11) NOT NULL,
  `supervisee_provider_role_id` int(11) NOT NULL,
  KEY `provider_role_id` (`provider_role_id`),
  KEY `supervisee_provider_role_id` (`supervisee_provider_role_id`),
  CONSTRAINT `providermanagement_prspr_provider_role_fk` FOREIGN KEY (`provider_role_id`) REFERENCES `providermanagement_provider_role` (`provider_role_id`),
  CONSTRAINT `providermanagement_prspr_supervisee_role_fk` FOREIGN KEY (`supervisee_provider_role_id`) REFERENCES `providermanagement_provider_role` (`provider_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providermanagement_provider_role_supervisee_provider_role`
--

LOCK TABLES `providermanagement_provider_role_supervisee_provider_role` WRITE;
/*!40000 ALTER TABLE `providermanagement_provider_role_supervisee_provider_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `providermanagement_provider_role_supervisee_provider_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providermanagement_provider_suggestion`
--

DROP TABLE IF EXISTS `providermanagement_provider_suggestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providermanagement_provider_suggestion` (
  `provider_suggestion_id` int(11) NOT NULL AUTO_INCREMENT,
  `criteria` varchar(5000) NOT NULL,
  `evaluator` varchar(255) NOT NULL,
  `relationship_type_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`provider_suggestion_id`),
  KEY `relationship_type_id` (`relationship_type_id`),
  CONSTRAINT `providermanagement_provider_suggestion_ibfk_1` FOREIGN KEY (`relationship_type_id`) REFERENCES `relationship_type` (`relationship_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providermanagement_provider_suggestion`
--

LOCK TABLES `providermanagement_provider_suggestion` WRITE;
/*!40000 ALTER TABLE `providermanagement_provider_suggestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `providermanagement_provider_suggestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providermanagement_supervision_suggestion`
--

DROP TABLE IF EXISTS `providermanagement_supervision_suggestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providermanagement_supervision_suggestion` (
  `supervision_suggestion_id` int(11) NOT NULL AUTO_INCREMENT,
  `criteria` varchar(5000) NOT NULL,
  `evaluator` varchar(255) NOT NULL,
  `provider_role_id` int(11) NOT NULL,
  `suggestion_type` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`supervision_suggestion_id`),
  KEY `provider_role_id` (`provider_role_id`),
  CONSTRAINT `providermanagement_supervision_suggestion_ibfk_1` FOREIGN KEY (`provider_role_id`) REFERENCES `providermanagement_provider_role` (`provider_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providermanagement_supervision_suggestion`
--

LOCK TABLES `providermanagement_supervision_suggestion` WRITE;
/*!40000 ALTER TABLE `providermanagement_supervision_suggestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `providermanagement_supervision_suggestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationship`
--

DROP TABLE IF EXISTS `relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relationship` (
  `relationship_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_a` int(11) NOT NULL,
  `relationship` int(11) NOT NULL DEFAULT '0',
  `person_b` int(11) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`relationship_id`),
  UNIQUE KEY `relationship_uuid_index` (`uuid`),
  KEY `relation_creator` (`creator`),
  KEY `person_a_is_person` (`person_a`),
  KEY `person_b_is_person` (`person_b`),
  KEY `relationship_type_id` (`relationship`),
  KEY `relation_voider` (`voided_by`),
  KEY `relationship_changed_by` (`changed_by`),
  CONSTRAINT `person_a_is_person` FOREIGN KEY (`person_a`) REFERENCES `person` (`person_id`),
  CONSTRAINT `person_b_is_person` FOREIGN KEY (`person_b`) REFERENCES `person` (`person_id`),
  CONSTRAINT `relation_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `relation_voider` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `relationship_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `relationship_type_id` FOREIGN KEY (`relationship`) REFERENCES `relationship_type` (`relationship_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationship`
--

LOCK TABLES `relationship` WRITE;
/*!40000 ALTER TABLE `relationship` DISABLE KEYS */;
/*!40000 ALTER TABLE `relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationship_type`
--

DROP TABLE IF EXISTS `relationship_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relationship_type` (
  `relationship_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_is_to_b` varchar(50) NOT NULL,
  `b_is_to_a` varchar(50) NOT NULL,
  `preferred` tinyint(1) NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`relationship_type_id`),
  UNIQUE KEY `relationship_type_uuid_index` (`uuid`),
  KEY `user_who_created_rel` (`creator`),
  KEY `user_who_retired_relationship_type` (`retired_by`),
  CONSTRAINT `user_who_created_rel` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_relationship_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationship_type`
--

LOCK TABLES `relationship_type` WRITE;
/*!40000 ALTER TABLE `relationship_type` DISABLE KEYS */;
INSERT INTO `relationship_type` VALUES (1,'Supervisor','Supervisee',0,0,'Provider supervisor to provider supervisee relationship',1,'2015-11-12 08:50:53',0,NULL,NULL,NULL,'2a5f4ff4-a179-4b8a-aa4c-40f71956ebbc');
/*!40000 ALTER TABLE `relationship_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_object`
--

DROP TABLE IF EXISTS `report_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_object` (
  `report_object_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `report_object_type` varchar(255) NOT NULL,
  `report_object_sub_type` varchar(255) NOT NULL,
  `xml_data` text,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`report_object_id`),
  UNIQUE KEY `report_object_uuid_index` (`uuid`),
  KEY `user_who_changed_report_object` (`changed_by`),
  KEY `report_object_creator` (`creator`),
  KEY `user_who_voided_report_object` (`voided_by`),
  CONSTRAINT `report_object_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_changed_report_object` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_report_object` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_object`
--

LOCK TABLES `report_object` WRITE;
/*!40000 ALTER TABLE `report_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_schema_xml`
--

DROP TABLE IF EXISTS `report_schema_xml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_schema_xml` (
  `report_schema_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `xml_data` text NOT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`report_schema_id`),
  UNIQUE KEY `report_schema_xml_uuid_index` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_schema_xml`
--

LOCK TABLES `report_schema_xml` WRITE;
/*!40000 ALTER TABLE `report_schema_xml` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_schema_xml` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporting_report_design`
--

DROP TABLE IF EXISTS `reporting_report_design`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporting_report_design` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `renderer_type` varchar(255) NOT NULL,
  `properties` text,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `report_definition_uuid` char(38) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `creator for reporting_report_design` (`creator`),
  KEY `changed_by for reporting_report_design` (`changed_by`),
  KEY `retired_by for reporting_report_design` (`retired_by`),
  KEY `report_definition_uuid for reporting_report_design` (`report_definition_uuid`),
  CONSTRAINT `changed_by for reporting_report_design` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `creator for reporting_report_design` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `retired_by for reporting_report_design` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_report_design`
--

LOCK TABLES `reporting_report_design` WRITE;
/*!40000 ALTER TABLE `reporting_report_design` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporting_report_design` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporting_report_design_resource`
--

DROP TABLE IF EXISTS `reporting_report_design_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporting_report_design_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `report_design_id` int(11) NOT NULL DEFAULT '0',
  `content_type` varchar(50) DEFAULT NULL,
  `extension` varchar(20) DEFAULT NULL,
  `contents` longblob,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `report_design_id for reporting_report_design_resource` (`report_design_id`),
  KEY `creator for reporting_report_design_resource` (`creator`),
  KEY `changed_by for reporting_report_design_resource` (`changed_by`),
  KEY `retired_by for reporting_report_design_resource` (`retired_by`),
  CONSTRAINT `changed_by for reporting_report_design_resource` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `creator for reporting_report_design_resource` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `report_design_id for reporting_report_design_resource` FOREIGN KEY (`report_design_id`) REFERENCES `reporting_report_design` (`id`),
  CONSTRAINT `retired_by for reporting_report_design_resource` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_report_design_resource`
--

LOCK TABLES `reporting_report_design_resource` WRITE;
/*!40000 ALTER TABLE `reporting_report_design_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporting_report_design_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporting_report_processor`
--

DROP TABLE IF EXISTS `reporting_report_processor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporting_report_processor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `processor_type` varchar(255) NOT NULL,
  `configuration` mediumtext,
  `run_on_success` tinyint(1) NOT NULL DEFAULT '1',
  `run_on_error` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `report_design_id` int(11) DEFAULT NULL,
  `processor_mode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `creator for reporting_report_processor` (`creator`),
  KEY `changed_by for reporting_report_processor` (`changed_by`),
  KEY `retired_by for reporting_report_processor` (`retired_by`),
  KEY `reporting_report_processor_report_design` (`report_design_id`),
  CONSTRAINT `changed_by for reporting_report_processor` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `creator for reporting_report_processor` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `reporting_report_processor_report_design` FOREIGN KEY (`report_design_id`) REFERENCES `reporting_report_design` (`id`),
  CONSTRAINT `retired_by for reporting_report_processor` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_report_processor`
--

LOCK TABLES `reporting_report_processor` WRITE;
/*!40000 ALTER TABLE `reporting_report_processor` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporting_report_processor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporting_report_request`
--

DROP TABLE IF EXISTS `reporting_report_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporting_report_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `base_cohort_uuid` char(38) DEFAULT NULL,
  `base_cohort_parameters` text,
  `report_definition_uuid` char(38) NOT NULL,
  `report_definition_parameters` text,
  `renderer_type` varchar(255) NOT NULL,
  `renderer_argument` varchar(255) DEFAULT NULL,
  `requested_by` int(11) NOT NULL DEFAULT '0',
  `request_datetime` datetime NOT NULL,
  `priority` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `evaluation_start_datetime` datetime DEFAULT NULL,
  `evaluation_complete_datetime` datetime DEFAULT NULL,
  `render_complete_datetime` datetime DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `schedule` varchar(100) DEFAULT NULL,
  `process_automatically` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `requested_by for reporting_report_request` (`requested_by`),
  CONSTRAINT `requested_by for reporting_report_request` FOREIGN KEY (`requested_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_report_request`
--

LOCK TABLES `reporting_report_request` WRITE;
/*!40000 ALTER TABLE `reporting_report_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporting_report_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`role`),
  UNIQUE KEY `role_uuid_index` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('Anonymous','Privileges for non-authenticated users.','774b2af3-6437-4e5a-a310-547554c7c65c'),('Authenticated','Privileges gained once authentication has been established.','f7fd42ef-880e-40c5-972d-e4ae7c990de2'),('Clinical-Read-Only','Will have read only access to all clinical',NULL),('Clinical:FullAccess','Will have full access to clinical app',NULL),('Clinical:ReadOnly','Will have read only access to clinical app',NULL),('Consultation-Diagnosis','Will have access to consultation diagnosis and save in both normal and retrospective mode',NULL),('Consultation-Disposition','Will have access to consultation disposition and save in both normal and retrospective mode',NULL),('Consultation-Observation','Will have access to consultation observation and save in both normal and retrospective mode',NULL),('Consultation-Orders','Will have access to consultation orders and save in both normal and retrospective mode',NULL),('Consultation-Save','Will have basic access to save consultation',NULL),('Consultation-Treatment','Will have access to consultation treatment and save in both normal and retrospective mode',NULL),('Patient-Listing','Will have access to all patient queues',NULL),('Provider','All users with the \'Provider\' role will appear as options in the default Infopath ','8d94f280-c2cc-11de-8d13-0010c6dffd0f'),('System Developer','Developers of the OpenMRS .. have additional access to change fundamental structure of the database model.','8d94f852-c2cc-11de-8d13-0010c6dffd0f');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_privilege`
--

DROP TABLE IF EXISTS `role_privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_privilege` (
  `role` varchar(50) NOT NULL DEFAULT '',
  `privilege` varchar(255) NOT NULL,
  PRIMARY KEY (`privilege`,`role`),
  KEY `role_privilege_to_role` (`role`),
  CONSTRAINT `privilege_definitions` FOREIGN KEY (`privilege`) REFERENCES `privilege` (`privilege`),
  CONSTRAINT `role_privilege_to_role` FOREIGN KEY (`role`) REFERENCES `role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_privilege`
--

LOCK TABLES `role_privilege` WRITE;
/*!40000 ALTER TABLE `role_privilege` DISABLE KEYS */;
INSERT INTO `role_privilege` VALUES ('Anonymous','Get Locations'),('Anonymous','View Locations'),('Authenticated','Get Concept Classes'),('Authenticated','Get Concept Datatypes'),('Authenticated','Get Encounter Types'),('Authenticated','Get Field Types'),('Authenticated','Get Global Properties'),('Authenticated','Get Identifier Types'),('Authenticated','Get Locations'),('Authenticated','Get Order Types'),('Authenticated','Get Person Attribute Types'),('Authenticated','Get Privileges'),('Authenticated','Get Relationship Types'),('Authenticated','Get Relationships'),('Authenticated','Get Roles'),('Authenticated','Patient Overview - View Relationships'),('Authenticated','View Concept Classes'),('Authenticated','View Concept Datatypes'),('Authenticated','View Encounter Types'),('Authenticated','View Field Types'),('Authenticated','View Global Properties'),('Authenticated','View Identifier Types'),('Authenticated','View Locations'),('Authenticated','View Order Types'),('Authenticated','View Person Attribute Types'),('Authenticated','View Privileges'),('Authenticated','View Relationship Types'),('Authenticated','View Relationships'),('Authenticated','View Roles'),('Clinical-Read-Only','Add Users'),('Clinical-Read-Only','Edit Users'),('Clinical-Read-Only','Get Care Settings'),('Clinical-Read-Only','Get Encounters'),('Clinical-Read-Only','Get Observations'),('Clinical-Read-Only','Get Orders'),('Clinical-Read-Only','Get Patient Programs'),('Clinical-Read-Only','Get Patients'),('Clinical-Read-Only','Get People'),('Clinical-Read-Only','Get Visits'),('Clinical:FullAccess','Add Encounters'),('Clinical:FullAccess','Add Observations'),('Clinical:FullAccess','Add Orders'),('Clinical:FullAccess','Add Visits'),('Clinical:FullAccess','Edit Encounters'),('Clinical:FullAccess','Edit Orders'),('Clinical:FullAccess','Edit Visits'),('Clinical:FullAccess','Get Care Settings'),('Clinical:FullAccess','Get Visit Attribute Types'),('Clinical:FullAccess','Manage Encounter Roles'),('Clinical:FullAccess','View Visit Attribute Types'),('Clinical:ReadOnly','app:clinical'),('Clinical:ReadOnly','app:clinical:consultationTab'),('Clinical:ReadOnly','app:clinical:diagnosisTab'),('Clinical:ReadOnly','app:clinical:dispositionTab'),('Clinical:ReadOnly','app:clinical:history'),('Clinical:ReadOnly','app:clinical:observationTab'),('Clinical:ReadOnly','Get Care Settings'),('Clinical:ReadOnly','Get Concepts'),('Clinical:ReadOnly','Get Encounters'),('Clinical:ReadOnly','Get Locations'),('Clinical:ReadOnly','Get Observations'),('Clinical:ReadOnly','Get Order Frequencies'),('Clinical:ReadOnly','Get Order Types'),('Clinical:ReadOnly','Get Orders'),('Clinical:ReadOnly','Get Patient Programs'),('Clinical:ReadOnly','Get Patients'),('Clinical:ReadOnly','Get Privileges'),('Clinical:ReadOnly','Get Providers'),('Clinical:ReadOnly','Get Users'),('Clinical:ReadOnly','Get Visit Types'),('Clinical:ReadOnly','Get Visits'),('Clinical:ReadOnly','Patient Dashboard - View Demographics Section'),('Clinical:ReadOnly','Patient Dashboard - View Encounters Section'),('Clinical:ReadOnly','Patient Dashboard - View Forms Section'),('Clinical:ReadOnly','Patient Dashboard - View Graphs Section'),('Clinical:ReadOnly','Patient Dashboard - View Overview Section'),('Clinical:ReadOnly','Patient Dashboard - View Patient Summary'),('Clinical:ReadOnly','Patient Dashboard - View Regimen Section'),('Clinical:ReadOnly','Patient Dashboard - View Visits Section'),('Clinical:ReadOnly','Patient Overview - View Patient Actions'),('Clinical:ReadOnly','Patient Overview - View Programs'),('Clinical:ReadOnly','View Concepts'),('Clinical:ReadOnly','View Encounters'),('Clinical:ReadOnly','View Locations'),('Clinical:ReadOnly','View Observations'),('Clinical:ReadOnly','View Order Types'),('Clinical:ReadOnly','View Orders'),('Clinical:ReadOnly','View Patient Programs'),('Clinical:ReadOnly','View Patients'),('Clinical:ReadOnly','View Privileges'),('Clinical:ReadOnly','View Providers'),('Clinical:ReadOnly','View Users'),('Clinical:ReadOnly','View Visit Types'),('Clinical:ReadOnly','View Visits'),('Consultation-Orders','Add Orders'),('Consultation-Orders','Edit Orders'),('Consultation-Save','Add Encounters'),('Consultation-Save','Add Visits'),('Consultation-Save','Edit Encounters'),('Consultation-Save','Edit Visits'),('Consultation-Save','Get Encounter Roles'),('Consultation-Save','Get Visit Attribute Types'),('Consultation-Treatment','Add Orders'),('Consultation-Treatment','Edit Orders'),('Patient-Listing','Get Concepts'),('Patient-Listing','Get Providers'),('Patient-Listing','Get Users'),('Patient-Listing','Get Visit Types');
/*!40000 ALTER TABLE `role_privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_role`
--

DROP TABLE IF EXISTS `role_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_role` (
  `parent_role` varchar(50) NOT NULL DEFAULT '',
  `child_role` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`parent_role`,`child_role`),
  KEY `inherited_role` (`child_role`),
  CONSTRAINT `inherited_role` FOREIGN KEY (`child_role`) REFERENCES `role` (`role`),
  CONSTRAINT `parent_role` FOREIGN KEY (`parent_role`) REFERENCES `role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_role`
--

LOCK TABLES `role_role` WRITE;
/*!40000 ALTER TABLE `role_role` DISABLE KEYS */;
INSERT INTO `role_role` VALUES ('Clinical:ReadOnly','Clinical:FullAccess'),('Consultation-Save','Consultation-Diagnosis'),('Consultation-Save','Consultation-Disposition'),('Consultation-Save','Consultation-Observation'),('Consultation-Save','Consultation-Orders'),('Clinical-Read-Only','Consultation-Save'),('Consultation-Save','Consultation-Treatment');
/*!40000 ALTER TABLE `role_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduler_task_config`
--

DROP TABLE IF EXISTS `scheduler_task_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduler_task_config` (
  `task_config_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `schedulable_class` text,
  `start_time` datetime DEFAULT NULL,
  `start_time_pattern` varchar(50) DEFAULT NULL,
  `repeat_interval` int(11) NOT NULL DEFAULT '0',
  `start_on_startup` tinyint(1) NOT NULL DEFAULT '0',
  `started` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(11) DEFAULT '0',
  `date_created` datetime DEFAULT '2005-01-01 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `last_execution_time` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`task_config_id`),
  UNIQUE KEY `scheduler_task_config_uuid_index` (`uuid`),
  KEY `scheduler_changer` (`changed_by`),
  KEY `scheduler_creator` (`created_by`),
  CONSTRAINT `scheduler_changer` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `scheduler_creator` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduler_task_config`
--

LOCK TABLES `scheduler_task_config` WRITE;
/*!40000 ALTER TABLE `scheduler_task_config` DISABLE KEYS */;
INSERT INTO `scheduler_task_config` VALUES (2,'Auto Close Visits Task','Stops all active visits that match the visit type(s) specified by the value of the global property \'visits.autoCloseVisitType\'','org.openmrs.scheduler.tasks.AutoCloseVisitsTask','2011-11-28 23:59:59','MM/dd/yyyy HH:mm:ss',86400,0,0,1,'2015-11-12 08:43:37',NULL,NULL,NULL,'8c17b376-1a2b-11e1-a51a-00248140a5eb'),(5,'OpenElis Patient Atom Feed Task',NULL,'org.bahmni.module.elisatomfeedclient.api.task.OpenElisPatientFeedTask','2015-11-12 08:45:42','MM/dd/yyyy HH:mm:ss',15,1,1,1,'2015-11-12 00:00:00',NULL,NULL,NULL,'c19fdc05-8919-11e5-8b59-08002715d519'),(8,'OpenElis Patient  Atom Feed Failed Event Task',NULL,'org.bahmni.module.elisatomfeedclient.api.task.OpenElisPatientFeedFailedEventsTask','2015-11-12 08:45:42','MM/dd/yyyy HH:mm:ss',15,1,0,1,'2015-11-12 00:00:00',NULL,NULL,NULL,'c1a91546-8919-11e5-8b59-08002715d519'),(11,'OpenMRS event publisher task',NULL,'org.openmrs.module.atomfeed.scheduler.tasks.EventPublisherTask','2015-11-12 08:50:10','MM/dd/yyyy HH:mm:ss',2,1,1,1,'2015-11-12 08:50:10',2,'2015-11-12 14:31:00','2015-11-12 14:31:00','61d9c21d-891a-11e5-8b59-08002715d519');
/*!40000 ALTER TABLE `scheduler_task_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduler_task_config_property`
--

DROP TABLE IF EXISTS `scheduler_task_config_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduler_task_config_property` (
  `task_config_property_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` text,
  `task_config_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`task_config_property_id`),
  KEY `task_config_for_property` (`task_config_id`),
  CONSTRAINT `task_config_for_property` FOREIGN KEY (`task_config_id`) REFERENCES `scheduler_task_config` (`task_config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduler_task_config_property`
--

LOCK TABLES `scheduler_task_config_property` WRITE;
/*!40000 ALTER TABLE `scheduler_task_config_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `scheduler_task_config_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serialized_object`
--

DROP TABLE IF EXISTS `serialized_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serialized_object` (
  `serialized_object_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `subtype` varchar(255) NOT NULL,
  `serialization_class` varchar(255) NOT NULL,
  `serialized_data` mediumtext NOT NULL,
  `date_created` datetime NOT NULL,
  `creator` int(11) NOT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `date_retired` datetime DEFAULT NULL,
  `retired_by` int(11) DEFAULT NULL,
  `retire_reason` varchar(1000) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  PRIMARY KEY (`serialized_object_id`),
  UNIQUE KEY `serialized_object_uuid_index` (`uuid`),
  KEY `serialized_object_creator` (`creator`),
  KEY `serialized_object_changed_by` (`changed_by`),
  KEY `serialized_object_retired_by` (`retired_by`),
  CONSTRAINT `serialized_object_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `serialized_object_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `serialized_object_retired_by` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serialized_object`
--

LOCK TABLES `serialized_object` WRITE;
/*!40000 ALTER TABLE `serialized_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `serialized_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_order`
--

DROP TABLE IF EXISTS `test_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_order` (
  `order_id` int(11) NOT NULL DEFAULT '0',
  `specimen_source` int(11) DEFAULT NULL,
  `laterality` varchar(20) DEFAULT NULL,
  `clinical_history` text,
  `frequency` int(11) DEFAULT NULL,
  `number_of_repeats` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `test_order_specimen_source_fk` (`specimen_source`),
  KEY `test_order_frequency_fk` (`frequency`),
  CONSTRAINT `test_order_frequency_fk` FOREIGN KEY (`frequency`) REFERENCES `order_frequency` (`order_frequency_id`),
  CONSTRAINT `test_order_order_id_fk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `test_order_specimen_source_fk` FOREIGN KEY (`specimen_source`) REFERENCES `concept` (`concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_order`
--

LOCK TABLES `test_order` WRITE;
/*!40000 ALTER TABLE `test_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uiframework_user_defined_page_view`
--

DROP TABLE IF EXISTS `uiframework_user_defined_page_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uiframework_user_defined_page_view` (
  `page_view_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `template_type` varchar(50) NOT NULL,
  `template_text` mediumtext NOT NULL,
  `uuid` varchar(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`page_view_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uiframework_user_defined_page_view`
--

LOCK TABLES `uiframework_user_defined_page_view` WRITE;
/*!40000 ALTER TABLE `uiframework_user_defined_page_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `uiframework_user_defined_page_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_property`
--

DROP TABLE IF EXISTS `user_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_property` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `property` varchar(100) NOT NULL DEFAULT '',
  `property_value` text,
  PRIMARY KEY (`user_id`,`property`),
  CONSTRAINT `user_property_to_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_property`
--

LOCK TABLES `user_property` WRITE;
/*!40000 ALTER TABLE `user_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `role` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`role`,`user_id`),
  KEY `user_role_to_users` (`user_id`),
  CONSTRAINT `role_definitions` FOREIGN KEY (`role`) REFERENCES `role` (`role`),
  CONSTRAINT `user_role_to_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'Provider'),(1,'System Developer');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `system_id` varchar(50) NOT NULL DEFAULT '',
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `salt` varchar(128) DEFAULT NULL,
  `secret_question` varchar(255) DEFAULT NULL,
  `secret_answer` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `person_id` int(11) NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_who_changed_user` (`changed_by`),
  KEY `user_creator` (`creator`),
  KEY `user_who_retired_this_user` (`retired_by`),
  KEY `person_id_for_user` (`person_id`),
  CONSTRAINT `person_id_for_user` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `user_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_changed_user` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_this_user` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','','4a1750c8607dfa237de36c6305715c223415189','c788c6ad82a157b712392ca695dfcf2eed193d7f',NULL,NULL,1,'2005-01-01 00:00:00',NULL,NULL,1,0,NULL,NULL,NULL,'71d4fdbf-8919-11e5-8b59-08002715d519'),(2,'daemon','daemon',NULL,NULL,NULL,NULL,1,'2010-04-26 13:25:00',NULL,NULL,1,0,NULL,NULL,NULL,'A4F30A1B-5EB9-11DF-A648-37A07F9C90FB'),(3,'Lab Manager','Lab Manager',NULL,NULL,NULL,NULL,1,'2015-11-12 08:45:01',NULL,NULL,2,0,NULL,NULL,NULL,'a9995127-8919-11e5-8b59-08002715d519'),(4,'Lab System','Lab System',NULL,NULL,NULL,NULL,1,'2015-11-12 08:45:42',NULL,NULL,3,0,NULL,NULL,NULL,'c1ac4af6-8919-11e5-8b59-08002715d519'),(5,'Billing System','Billing System',NULL,NULL,NULL,NULL,1,'2015-11-12 08:45:52',NULL,NULL,4,0,NULL,NULL,NULL,'c7be9fdc-8919-11e5-8b59-08002715d519');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit`
--

DROP TABLE IF EXISTS `visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit` (
  `visit_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `visit_type_id` int(11) NOT NULL,
  `date_started` datetime NOT NULL,
  `date_stopped` datetime DEFAULT NULL,
  `indication_concept_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`visit_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `visit_patient_index` (`patient_id`),
  KEY `visit_type_fk` (`visit_type_id`),
  KEY `visit_location_fk` (`location_id`),
  KEY `visit_creator_fk` (`creator`),
  KEY `visit_voided_by_fk` (`voided_by`),
  KEY `visit_changed_by_fk` (`changed_by`),
  KEY `visit_indication_concept_fk` (`indication_concept_id`),
  CONSTRAINT `visit_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_indication_concept_fk` FOREIGN KEY (`indication_concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `visit_location_fk` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `visit_patient_fk` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `visit_type_fk` FOREIGN KEY (`visit_type_id`) REFERENCES `visit_type` (`visit_type_id`),
  CONSTRAINT `visit_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit`
--

LOCK TABLES `visit` WRITE;
/*!40000 ALTER TABLE `visit` DISABLE KEYS */;
/*!40000 ALTER TABLE `visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_attribute`
--

DROP TABLE IF EXISTS `visit_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit_attribute` (
  `visit_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `visit_id` int(11) NOT NULL,
  `attribute_type_id` int(11) NOT NULL,
  `value_reference` text NOT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`visit_attribute_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `visit_attribute_visit_fk` (`visit_id`),
  KEY `visit_attribute_attribute_type_id_fk` (`attribute_type_id`),
  KEY `visit_attribute_creator_fk` (`creator`),
  KEY `visit_attribute_changed_by_fk` (`changed_by`),
  KEY `visit_attribute_voided_by_fk` (`voided_by`),
  CONSTRAINT `visit_attribute_attribute_type_id_fk` FOREIGN KEY (`attribute_type_id`) REFERENCES `visit_attribute_type` (`visit_attribute_type_id`),
  CONSTRAINT `visit_attribute_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_attribute_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_attribute_visit_fk` FOREIGN KEY (`visit_id`) REFERENCES `visit` (`visit_id`),
  CONSTRAINT `visit_attribute_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_attribute`
--

LOCK TABLES `visit_attribute` WRITE;
/*!40000 ALTER TABLE `visit_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `visit_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_attribute_type`
--

DROP TABLE IF EXISTS `visit_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit_attribute_type` (
  `visit_attribute_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `datatype` varchar(255) DEFAULT NULL,
  `datatype_config` text,
  `preferred_handler` varchar(255) DEFAULT NULL,
  `handler_config` text,
  `min_occurs` int(11) NOT NULL,
  `max_occurs` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`visit_attribute_type_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `visit_attribute_type_creator_fk` (`creator`),
  KEY `visit_attribute_type_changed_by_fk` (`changed_by`),
  KEY `visit_attribute_type_retired_by_fk` (`retired_by`),
  CONSTRAINT `visit_attribute_type_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_attribute_type_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_attribute_type_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_attribute_type`
--

LOCK TABLES `visit_attribute_type` WRITE;
/*!40000 ALTER TABLE `visit_attribute_type` DISABLE KEYS */;
INSERT INTO `visit_attribute_type` VALUES (1,'Visit Status',NULL,'org.openmrs.customdatatype.datatype.FreeTextDatatype',NULL,NULL,NULL,0,NULL,1,'2015-11-12 08:48:18',NULL,NULL,0,NULL,NULL,NULL,'1ee76986-891a-11e5-8b59-08002715d519'),(2,'Admission Status',NULL,'org.openmrs.customdatatype.datatype.FreeTextDatatype',NULL,NULL,NULL,0,NULL,1,'2015-11-12 08:48:18',NULL,NULL,0,NULL,NULL,NULL,'1eec0236-891a-11e5-8b59-08002715d519');
/*!40000 ALTER TABLE `visit_attribute_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_type`
--

DROP TABLE IF EXISTS `visit_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit_type` (
  `visit_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`visit_type_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `visit_type_creator` (`creator`),
  KEY `visit_type_changed_by` (`changed_by`),
  KEY `visit_type_retired_by` (`retired_by`),
  CONSTRAINT `visit_type_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_type_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_type_retired_by` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_type`
--

LOCK TABLES `visit_type` WRITE;
/*!40000 ALTER TABLE `visit_type` DISABLE KEYS */;
INSERT INTO `visit_type` VALUES (3,'LAB VISIT','Visits for lab visit by patient when the tests are not ordered through OpenMRS',1,'2015-11-12 00:00:00',NULL,NULL,0,NULL,NULL,NULL,'2aea9f32-891a-11e5-8b59-08002715d519'),(4,'PHARMACY VISIT','Visit for syncing sale orders from pharmacy',1,'2015-11-12 00:00:00',NULL,NULL,0,NULL,NULL,NULL,'30e0798b-891a-11e5-8b59-08002715d519');
/*!40000 ALTER TABLE `visit_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'openmrs'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_concept` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_concept`(INOUT new_concept_id INT,
                              INOUT concept_name_short_id INT,
                              INOUT concept_name_full_id INT,
                              name_of_concept VARCHAR(255),
                              concept_short_name VARCHAR(255),
                              data_type_name VARCHAR(255),
                              class_name VARCHAR(255),
                              is_set BOOLEAN)
BEGIN
  DECLARE data_type_id INT;
  DECLARE class_id INT;
  DECLARE is_set_val TINYINT(1);

  CASE
    WHEN is_set = TRUE THEN
       SET is_set_val = '1';
    WHEN is_set = FALSE THEN
       SET is_set_val = '0';
  END CASE;

  SELECT count(distinct concept_id) into @concept_count from concept_name where name = name_of_concept and concept_name_type='FULLY_SPECIFIED';
  IF @concept_count > 0 THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Concept Already Exists';
  ELSE
    SELECT concept_datatype_id INTO data_type_id FROM concept_datatype WHERE name = data_type_name;
    SELECT concept_class_id INTO class_id FROM concept_class WHERE name = class_name;

    SELECT uuid() into @uuid;
    INSERT INTO concept (datatype_id, class_id, is_set, creator, date_created, changed_by, date_changed, uuid)
      values (data_type_id, class_id, is_set_val, 1, now(), 1, now(), @uuid);
    SELECT MAX(concept_id) INTO new_concept_id FROM concept;

    SELECT uuid() into @uuid;
    INSERT INTO concept_name (concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, uuid)
      values (new_concept_id, concept_short_name, 'en', 0, 1, now(), 'SHORT', @uuid);
    SELECT MAX(concept_name_id) INTO concept_name_short_id FROM concept_name;

    SELECT uuid() into @uuid;
    INSERT INTO concept_name (concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, uuid)
      values (new_concept_id, name_of_concept, 'en', 1, 1, now(), 'FULLY_SPECIFIED', @uuid);
    SELECT MAX(concept_name_id) INTO concept_name_full_id FROM concept_name;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_concept_answer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_concept_answer`(concept_id INT,
                              answer_concept_id INT,
                              sort_weight DOUBLE)
BEGIN
	INSERT INTO concept_answer (concept_id, answer_concept, answer_drug, date_created, creator, uuid, sort_weight) values (concept_id, answer_concept_id, null, now(), 1, uuid(), sort_weight);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_concept_description` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_concept_description`(concept_id INT,
                              description VARCHAR(250))
BEGIN
	INSERT INTO concept_description(uuid, concept_id, description, locale, creator, date_created) values(uuid(), concept_id, description, 'en', 1, now());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_concept_numeric` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_concept_numeric`(concept_id INT,
							  low_normal DOUBLE,
							  hi_normal DOUBLE,
							  units VARCHAR(50))
BEGIN
  INSERT INTO concept_numeric (concept_id, low_normal, hi_normal, units) values (concept_id, low_normal, hi_normal, units);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_concept_reference_map` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_concept_reference_map`(concept_id INT,
							  concept_source_id INT,
							  reference_term VARCHAR(255),
                              reference_type_id INT)
BEGIN
  DECLARE reference_term_id INT;

    INSERT INTO concept_reference_term (concept_source_id,code,creator,date_created,uuid)
    VALUES (concept_source_id,reference_term,1,now(),uuid());
    SELECT MAX(concept_reference_term_id) INTO reference_term_id FROM concept_reference_term;

  INSERT INTO concept_reference_map(concept_reference_term_id,concept_map_type_id,creator,date_created,concept_id,uuid)
  VALUES(reference_term_id, reference_type_id, 1, now(), concept_id, uuid());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_concept_set_members` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_concept_set_members`(set_concept_id INT,
                              member_concept_id INT,weight INT)
BEGIN
	INSERT INTO concept_set (concept_id, concept_set,sort_weight,creator,date_created,uuid)
	values (member_concept_id, set_concept_id,weight,1, now(),uuid());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_concept_word` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_concept_word`(concept_id INT,
                              concept_name_id INT,
                              word VARCHAR(50),
                              weight DOUBLE)
BEGIN
	INSERT INTO concept_word (word, locale, weight, concept_id, concept_name_id) values (UPPER(word), 'en', weight, concept_id, concept_name_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_concept` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_concept`(name_concept VARCHAR(255))
BEGIN
            DECLARE conceptId INT default 0;
                select concept_id INTO conceptId from concept_name where name = name_concept and locale_preferred = 1;
                delete from concept_set where concept_set = conceptId;
                delete from concept_set where concept_id = conceptId;
                delete from concept_word where concept_id = conceptId;
                delete from concept_name where concept_id = conceptId;
                delete from concept_numeric where concept_id = conceptId;
                delete from concept_answer where concept_id = conceptId;
                delete from concept_answer where answer_concept = conceptId;
                delete from concept_reference_map where concept_id = conceptId;
                delete from concept where concept_id = conceptId;
            END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `introduce_new_address_level` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `introduce_new_address_level`(parent_field_name VARCHAR(160), new_field_name VARCHAR(160), new_field_address_field_name VARCHAR(160))
introduce_new_address_level_proc: BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE parent_field_level_id INT;
  DECLARE parent_field_entry_id INT;
  DECLARE new_field_level_id INT;
  DECLARE new_field_entry_id INT;
  DECLARE number_children_fields_for_parent_field INT;
  DECLARE parent_field_entries_cursor CURSOR FOR SELECT id from parent_field_ids;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  SELECT address_hierarchy_level_id INTO parent_field_level_id from address_hierarchy_level where name = parent_field_name;
  INSERT INTO address_hierarchy_level(name, address_field, uuid, required) values(new_field_name, new_field_address_field_name, UUID(), false);

  select COUNT(*) INTO number_children_fields_for_parent_field from address_hierarchy_level where parent_level_id = parent_field_level_id;

  SELECT address_hierarchy_level_id INTO new_field_level_id from address_hierarchy_level where name = new_field_name;
  UPDATE address_hierarchy_level set parent_level_id = new_field_level_id where parent_level_id = parent_field_level_id;
  UPDATE address_hierarchy_level set parent_level_id = parent_field_level_id where name = new_field_name;

  -- If parent field was leaf node no address entry migration required
  IF (number_children_fields_for_parent_field = 0)THEN
	LEAVE introduce_new_address_level_proc;
  END IF;

  -- Start address entry migration
  CREATE TEMPORARY TABLE parent_field_ids(id INT); 
  INSERT INTO parent_field_ids SELECT address_hierarchy_entry_id from address_hierarchy_entry where level_id = parent_field_level_id;
  
  OPEN parent_field_entries_cursor;
  read_loop: LOOP
    FETCH parent_field_entries_cursor INTO parent_field_entry_id;
	IF done THEN
      LEAVE read_loop;
    END IF;
    INSERT INTO address_hierarchy_entry (name, level_id, parent_id, uuid) VALUES (NULL, new_field_level_id, parent_field_entry_id, UUID());
	SET new_field_entry_id = LAST_INSERT_ID();
	UPDATE address_hierarchy_entry SET parent_id = new_field_entry_id where parent_id = parent_field_entry_id and level_id != new_field_level_id;
  END LOOP;
  CLOSE parent_field_entries_cursor;
  DROP TABLE parent_field_ids;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `set_value_as_concept_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_value_as_concept_id`(person_attribute_type_name VARCHAR(255))
BEGIN
  DECLARE c_id INT;
  DECLARE pa_id INT;
  DECLARE c_name VARCHAR(255);
  DECLARE val VARCHAR(255);
  DECLARE done INT DEFAULT FALSE;
  DECLARE cur1 CURSOR FOR SELECT person_attribute_id, value FROM person_attribute WHERE person_attribute_type_id IN
    (SELECT person_attribute_type_id from person_attribute_type where name = person_attribute_type_name) and value != '';

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  CREATE TEMPORARY TABLE answer_concept_ids (id INT); 

  INSERT INTO answer_concept_ids SELECT answer_concept FROM concept_answer
     WHERE concept_id IN (SELECT BINARY foreign_key FROM person_attribute_type WHERE name = person_attribute_type_name);
  
  OPEN cur1;
  REPEAT
    FETCH cur1 INTO pa_id, val;
      SELECT concept_id INTO c_id FROM concept_name 
           WHERE lower(name) = lower(val) AND concept_name_type = 'FULLY_SPECIFIED' 
           AND concept_id IN (SELECT id FROM answer_concept_ids);
      UPDATE person_attribute set value = c_id where person_attribute_id = pa_id;
  UNTIL done END REPEAT;
 CLOSE cur1;
 DROP TABLE answer_concept_ids;
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

-- Dump completed on 2015-11-12 14:40:39
