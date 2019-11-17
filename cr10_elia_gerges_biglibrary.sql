-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2019 at 09:13 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr10_elia_gerges_biglibrary`
--
CREATE DATABASE IF NOT EXISTS `cr10_elia_gerges_biglibrary` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cr10_elia_gerges_biglibrary`;

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `author_id` int(11) NOT NULL,
  `author_firstName` varchar(15) NOT NULL,
  `author_lastName` varchar(15) NOT NULL,
  `author_media` varchar(20) NOT NULL,
  `genre` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`author_id`, `author_firstName`, `author_lastName`, `author_media`, `genre`) VALUES
(1, 'Mark', 'Twain', 'Book', 1),
(2, 'Stephen', 'King', 'Acadimc Journal', 2),
(3, 'J.K.', 'Rowlling', 'Book', 2),
(4, 'John', 'Doe', 'DVD', 4),
(5, 'Elia', 'Gerges', ' Research', 3);

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `genre_nr` int(11) NOT NULL,
  `genre` enum('Novel','Fiction','Biography','SF','Horror','Children','Fantasy') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`genre_nr`, `genre`) VALUES
(1, 'Novel'),
(2, 'Fantasy'),
(3, 'SF'),
(4, 'Horror'),
(5, 'Biography'),
(6, 'Children'),
(7, 'Fiction');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `ISBN` int(11) NOT NULL,
  `media_description` varchar(255) NOT NULL,
  `media_type` enum('CD','Book','DVD') DEFAULT NULL,
  `media_status` enum('available','not available') DEFAULT NULL,
  `publisher_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `genre_nr` int(11) DEFAULT NULL,
  `media_name` varchar(25) NOT NULL,
  `active` int(1) NOT NULL DEFAULT 0,
  `publish_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`ISBN`, `media_description`, `media_type`, `media_status`, `publisher_id`, `author_id`, `genre_nr`, `media_name`, `active`, `publish_date`) VALUES
(4, 'lorem ipusm', 'Book', 'available', 1, 1, 2, 'test', 0, '2016-04-01'),
(5, 'cd1 description', 'CD', 'not available', 2, 3, 5, 'media_name', 0, '2012-12-05'),
(6, 'it is a nice movie', 'DVD', 'available', 1, 3, 6, 'media_name', 0, '2018-01-03'),
(7, 'horror ', 'Book', 'not available', 3, 4, 4, 'media_name', 0, '2000-12-21');

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `publisher_id` int(11) NOT NULL,
  `publisher_name` varchar(15) NOT NULL,
  `publisher_address` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`publisher_id`, `publisher_name`, `publisher_address`) VALUES
(1, 'Piper', 'Müncher'),
(2, 'Audible', 'New Jersey'),
(3, 'Klett-Cotta', 'Stuttgart'),
(4, 'DVD-Publisher', 'Vienna');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`genre_nr`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`ISBN`),
  ADD KEY `publisher_id` (`publisher_id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `genre_nr` (`genre_nr`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisher_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `genre_nr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `ISBN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `publisher`
--
ALTER TABLE `publisher`
  MODIFY `publisher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`publisher_id`),
  ADD CONSTRAINT `media_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`),
  ADD CONSTRAINT `media_ibfk_3` FOREIGN KEY (`genre_nr`) REFERENCES `genre` (`genre_nr`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
