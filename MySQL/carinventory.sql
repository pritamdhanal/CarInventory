-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 27, 2017 at 10:01 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `carinventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE IF NOT EXISTS `car` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vin` char(17) NOT NULL,
  `make` varchar(25) NOT NULL,
  `model` varchar(25) NOT NULL,
  `color` varchar(25) NOT NULL,
  `year` smallint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vin` (`vin`),
  KEY `year` (`year`),
  KEY `make` (`make`),
  KEY `make_2` (`make`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`id`, `vin`, `make`, `model`, `color`, `year`) VALUES
(1, 'q2q2q24rt56yhgt5r', 'Nissan', 'Murano', 'Black', 2016),
(2, 'K0i98u6yhnd0olpkd', 'Honda', 'Accord', 'White', 2015);

-- --------------------------------------------------------

--
-- Table structure for table `carinvoice`
--

CREATE TABLE IF NOT EXISTS `carinvoice` (
  `carinvoiceid` bigint(11) NOT NULL AUTO_INCREMENT,
  `invoiceid` bigint(11) NOT NULL,
  `carid` bigint(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`carinvoiceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `carinvoice`
--

INSERT INTO `carinvoice` (`carinvoiceid`, `invoiceid`, `carid`, `description`) VALUES
(1, 1, 1, 'Service, oil change and Tyre Rotation '),
(2, 2, 2, 'Break repair');

-- --------------------------------------------------------

--
-- Table structure for table `carowner`
--

CREATE TABLE IF NOT EXISTS `carowner` (
  `carownerid` bigint(20) NOT NULL AUTO_INCREMENT,
  `carid` bigint(20) NOT NULL,
  `ownerid` bigint(20) NOT NULL,
  `dateofregister` datetime NOT NULL,
  PRIMARY KEY (`carownerid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `carowner`
--

INSERT INTO `carowner` (`carownerid`, `carid`, `ownerid`, `dateofregister`) VALUES
(1, 1, 1, '2017-01-02 00:00:00'),
(2, 1, 2, '2017-01-02 00:00:00'),
(3, 2, 2, '2017-01-03 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `carrepairdetails`
--

CREATE TABLE IF NOT EXISTS `carrepairdetails` (
  `carrepairdetailid` bigint(20) NOT NULL AUTO_INCREMENT,
  `carinvoiceid` bigint(20) NOT NULL,
  `operations` text NOT NULL,
  `amount` float NOT NULL,
  PRIMARY KEY (`carrepairdetailid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `carrepairdetails`
--

INSERT INTO `carrepairdetails` (`carrepairdetailid`, `carinvoiceid`, `operations`, `amount`) VALUES
(1, 1, 'service', 30),
(2, 1, 'Oil change', 30),
(3, 1, 'Tyre rotation', 40),
(4, 2, 'Break fail repair', 50);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE IF NOT EXISTS `invoice` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `servicestartdate` datetime NOT NULL,
  `serviceenddate` datetime NOT NULL,
  `billingdate` datetime NOT NULL,
  `amount` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`, `servicestartdate`, `serviceenddate`, `billingdate`, `amount`) VALUES
(1, '2017-01-04 00:00:00', '2017-01-05 00:00:00', '2017-01-05 00:00:00', 100),
(2, '2017-01-10 00:00:00', '2017-01-11 00:00:00', '2017-01-11 00:00:00', 50);

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE IF NOT EXISTS `owner` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`id`, `firstname`, `lastname`, `phone`, `email`) VALUES
(1, 'sachin', 'verma', '6589541235', 'sachin@xxxx.com'),
(2, 'test', 'user', '1234567890', 'test@user.com');

-- --------------------------------------------------------

--
-- Table structure for table `ownerinvoice`
--

CREATE TABLE IF NOT EXISTS `ownerinvoice` (
  `ownerinvoiceid` bigint(20) NOT NULL AUTO_INCREMENT,
  `invoiceid` bigint(11) NOT NULL,
  `ownerid` bigint(11) NOT NULL,
  PRIMARY KEY (`ownerinvoiceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ownerinvoice`
--

INSERT INTO `ownerinvoice` (`ownerinvoiceid`, `invoiceid`, `ownerid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
