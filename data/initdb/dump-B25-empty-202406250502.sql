-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: DOCKER    Database: DATABASE_EMPTY
-- ------------------------------------------------------

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
CREATE DATABASE `DATABASE_EMPTY` CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `DATABASE_EMPTY`;


--
-- Table structure for table `TEST_DATA`
--

DROP TABLE IF EXISTS `TEST_DATA`;
CREATE TABLE `TEST_DATA` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


