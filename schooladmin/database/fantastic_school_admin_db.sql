-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2020 at 09:19 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fantastic_school_admin_db`
--
CREATE DATABASE IF NOT EXISTS `fantastic_school_admin_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `fantastic_school_admin_db`;

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
CREATE TABLE IF NOT EXISTS `branch` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) NOT NULL,
  `AccountNumber` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `branch`:
--

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`id`, `Name`, `AccountNumber`) VALUES(1, 'Equity Bank', '351672718822');
INSERT INTO `branch` (`id`, `Name`, `AccountNumber`) VALUES(2, 'KCB Bank', '98262891719');
INSERT INTO `branch` (`id`, `Name`, `AccountNumber`) VALUES(3, 'Bank of America', '00000132254545');

-- --------------------------------------------------------

--
-- Table structure for table `classattendance`
--

DROP TABLE IF EXISTS `classattendance`;
CREATE TABLE IF NOT EXISTS `classattendance` (
  `id` int(10) UNSIGNED NOT NULL,
  `Subject` int(10) UNSIGNED NOT NULL,
  `Student` int(10) UNSIGNED NOT NULL,
  `RegNo` int(10) UNSIGNED DEFAULT NULL,
  `Class` int(10) UNSIGNED DEFAULT NULL,
  `Stream` int(10) UNSIGNED DEFAULT NULL,
  `Attended` varchar(40) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Subject` (`Subject`),
  KEY `Student` (`Student`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `classattendance`:
--

--
-- Dumping data for table `classattendance`
--

INSERT INTO `classattendance` (`id`, `Subject`, `Student`, `RegNo`, `Class`, `Stream`, `Attended`, `Date`) VALUES(1, 1, 1, 1, 1, 1, '1', '2018-07-22');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
CREATE TABLE IF NOT EXISTS `classes` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `classes`:
--

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `Name`) VALUES(1, 'Class 1');
INSERT INTO `classes` (`id`, `Name`) VALUES(2, 'Class Two');
INSERT INTO `classes` (`id`, `Name`) VALUES(3, 'Class 3');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
  `id` int(10) UNSIGNED NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Date` date NOT NULL,
  `Details` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `events`:
--

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `Name`, `Date`, `Details`) VALUES(1, 'Annual Gathering', '2018-07-30', 'Greenwoods Global School, City celebrated its annual day with unprecedented fanfare on June 7, 2018 at the school premises. The school was decorated elegantly. A grand stage had been set up with professional sound system. Mr. Navjot Singh Sidhu,  the Minister of Local Government, Tourism, Cultural Affairs, and Museums of the State of Punjab had been invited as the chief guest. He was given a floral welcome before he inaugurated the programme.\r\n\r\nThe talented students presented mesmerizing cultural events such as dances, plays, magic show, etc. Mrs. Swati Sehgal, the Principal read the annual report of the school. She made the audience aware of the school’s achievements in academics and co-curricular arenas.');

-- --------------------------------------------------------

--
-- Table structure for table `examcategories`
--

DROP TABLE IF EXISTS `examcategories`;
CREATE TABLE IF NOT EXISTS `examcategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `Name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `examcategories`:
--

--
-- Dumping data for table `examcategories`
--

INSERT INTO `examcategories` (`id`, `Name`) VALUES(1, 'End Term');
INSERT INTO `examcategories` (`id`, `Name`) VALUES(2, 'Term test');

-- --------------------------------------------------------

--
-- Table structure for table `examresults`
--

DROP TABLE IF EXISTS `examresults`;
CREATE TABLE IF NOT EXISTS `examresults` (
  `id` int(10) UNSIGNED NOT NULL,
  `student` int(10) UNSIGNED NOT NULL,
  `RegNo` int(10) UNSIGNED DEFAULT NULL,
  `Class` int(10) UNSIGNED DEFAULT NULL,
  `Stream` int(10) UNSIGNED DEFAULT NULL,
  `Category` int(10) UNSIGNED DEFAULT NULL,
  `Subject` int(10) UNSIGNED DEFAULT NULL,
  `Marks` int(11) NOT NULL,
  `Term` int(10) UNSIGNED NOT NULL,
  `AcademicYear` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student` (`student`),
  KEY `Category` (`Category`),
  KEY `Subject` (`Subject`),
  KEY `Term` (`Term`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `examresults`:
--

-- --------------------------------------------------------

--
-- Table structure for table `feescollection`
--

DROP TABLE IF EXISTS `feescollection`;
CREATE TABLE IF NOT EXISTS `feescollection` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Student` int(10) UNSIGNED NOT NULL,
  `Class` int(10) UNSIGNED DEFAULT NULL,
  `Session` int(10) UNSIGNED NOT NULL,
  `PaidAmount` int(11) NOT NULL,
  `Balance` int(10) UNSIGNED DEFAULT NULL,
  `Branch` int(10) UNSIGNED NOT NULL,
  `Date` date DEFAULT NULL,
  `Remarks` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Student` (`Student`),
  KEY `Session` (`Session`),
  KEY `Branch` (`Branch`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `feescollection`:
--

--
-- Dumping data for table `feescollection`
--

INSERT INTO `feescollection` (`id`, `Student`, `Class`, `Session`, `PaidAmount`, `Balance`, `Branch`, `Date`, `Remarks`) VALUES(1, 1, 1, 1, 1000, 1, 1, '2018-05-02', 'Not-Paid');
INSERT INTO `feescollection` (`id`, `Student`, `Class`, `Session`, `PaidAmount`, `Balance`, `Branch`, `Date`, `Remarks`) VALUES(2, 1, 1, 1, 3000, 1, 2, '2018-05-03', 'Not-Paid');
INSERT INTO `feescollection` (`id`, `Student`, `Class`, `Session`, `PaidAmount`, `Balance`, `Branch`, `Date`, `Remarks`) VALUES(3, 0, 0, 1, 11000, 0, 1, '2018-07-30', 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `membership_grouppermissions`
--

DROP TABLE IF EXISTS `membership_grouppermissions`;
CREATE TABLE IF NOT EXISTS `membership_grouppermissions` (
  `permissionID` int(10) UNSIGNED NOT NULL,
  `groupID` int(11) DEFAULT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `allowInsert` tinyint(4) DEFAULT NULL,
  `allowView` tinyint(4) NOT NULL DEFAULT 0,
  `allowEdit` tinyint(4) NOT NULL DEFAULT 0,
  `allowDelete` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`permissionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `membership_grouppermissions`:
--

--
-- Dumping data for table `membership_grouppermissions`
--

INSERT INTO `membership_grouppermissions` (`permissionID`, `groupID`, `tableName`, `allowInsert`, `allowView`, `allowEdit`, `allowDelete`) VALUES(0, 3, 'students', 0, 3, 0, 0);
INSERT INTO `membership_grouppermissions` (`permissionID`, `groupID`, `tableName`, `allowInsert`, `allowView`, `allowEdit`, `allowDelete`) VALUES(1, 2, 'students', 1, 3, 3, 3);
INSERT INTO `membership_grouppermissions` (`permissionID`, `groupID`, `tableName`, `allowInsert`, `allowView`, `allowEdit`, `allowDelete`) VALUES(2, 2, 'feescollection', 1, 3, 3, 3);
INSERT INTO `membership_grouppermissions` (`permissionID`, `groupID`, `tableName`, `allowInsert`, `allowView`, `allowEdit`, `allowDelete`) VALUES(3, 2, 'branch', 1, 3, 3, 3);
INSERT INTO `membership_grouppermissions` (`permissionID`, `groupID`, `tableName`, `allowInsert`, `allowView`, `allowEdit`, `allowDelete`) VALUES(4, 2, 'teachers', 1, 3, 3, 3);
INSERT INTO `membership_grouppermissions` (`permissionID`, `groupID`, `tableName`, `allowInsert`, `allowView`, `allowEdit`, `allowDelete`) VALUES(5, 2, 'subjects', 1, 3, 3, 3);
INSERT INTO `membership_grouppermissions` (`permissionID`, `groupID`, `tableName`, `allowInsert`, `allowView`, `allowEdit`, `allowDelete`) VALUES(6, 2, 'classes', 1, 3, 3, 3);
INSERT INTO `membership_grouppermissions` (`permissionID`, `groupID`, `tableName`, `allowInsert`, `allowView`, `allowEdit`, `allowDelete`) VALUES(9, 2, 'timetable', 1, 3, 3, 3);
INSERT INTO `membership_grouppermissions` (`permissionID`, `groupID`, `tableName`, `allowInsert`, `allowView`, `allowEdit`, `allowDelete`) VALUES(10, 2, 'events', 1, 3, 3, 3);
INSERT INTO `membership_grouppermissions` (`permissionID`, `groupID`, `tableName`, `allowInsert`, `allowView`, `allowEdit`, `allowDelete`) VALUES(11, 2, 'notices', 1, 3, 3, 3);
INSERT INTO `membership_grouppermissions` (`permissionID`, `groupID`, `tableName`, `allowInsert`, `allowView`, `allowEdit`, `allowDelete`) VALUES(12, 2, 'examresults', 1, 3, 3, 3);
INSERT INTO `membership_grouppermissions` (`permissionID`, `groupID`, `tableName`, `allowInsert`, `allowView`, `allowEdit`, `allowDelete`) VALUES(13, 2, 'parents', 1, 3, 3, 3);
INSERT INTO `membership_grouppermissions` (`permissionID`, `groupID`, `tableName`, `allowInsert`, `allowView`, `allowEdit`, `allowDelete`) VALUES(14, 2, 'examcategories', 1, 3, 3, 3);
INSERT INTO `membership_grouppermissions` (`permissionID`, `groupID`, `tableName`, `allowInsert`, `allowView`, `allowEdit`, `allowDelete`) VALUES(15, 2, 'sessions', 1, 3, 3, 3);
INSERT INTO `membership_grouppermissions` (`permissionID`, `groupID`, `tableName`, `allowInsert`, `allowView`, `allowEdit`, `allowDelete`) VALUES(16, 2, 'studentcategories', 1, 3, 3, 3);
INSERT INTO `membership_grouppermissions` (`permissionID`, `groupID`, `tableName`, `allowInsert`, `allowView`, `allowEdit`, `allowDelete`) VALUES(17, 2, 'classattendance', 1, 3, 3, 3);
INSERT INTO `membership_grouppermissions` (`permissionID`, `groupID`, `tableName`, `allowInsert`, `allowView`, `allowEdit`, `allowDelete`) VALUES(18, 2, 'fee_structure', 1, 3, 3, 3);
INSERT INTO `membership_grouppermissions` (`permissionID`, `groupID`, `tableName`, `allowInsert`, `allowView`, `allowEdit`, `allowDelete`) VALUES(19, 2, 'fee_structure', 1, 3, 3, 3);
INSERT INTO `membership_grouppermissions` (`permissionID`, `groupID`, `tableName`, `allowInsert`, `allowView`, `allowEdit`, `allowDelete`) VALUES(20, 2, 'fee_structure', 1, 3, 3, 3);
INSERT INTO `membership_grouppermissions` (`permissionID`, `groupID`, `tableName`, `allowInsert`, `allowView`, `allowEdit`, `allowDelete`) VALUES(21, 2, 'schoolmoney', 1, 3, 3, 3);
INSERT INTO `membership_grouppermissions` (`permissionID`, `groupID`, `tableName`, `allowInsert`, `allowView`, `allowEdit`, `allowDelete`) VALUES(46, 3, 'streams', 0, 3, 0, 0);
INSERT INTO `membership_grouppermissions` (`permissionID`, `groupID`, `tableName`, `allowInsert`, `allowView`, `allowEdit`, `allowDelete`) VALUES(47, 3, 'hostels', 0, 3, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `membership_groups`
--

DROP TABLE IF EXISTS `membership_groups`;
CREATE TABLE IF NOT EXISTS `membership_groups` (
  `groupID` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `allowSignup` tinyint(4) DEFAULT NULL,
  `needsApproval` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`groupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `membership_groups`:
--

--
-- Dumping data for table `membership_groups`
--

INSERT INTO `membership_groups` (`groupID`, `name`, `description`, `allowSignup`, `needsApproval`) VALUES(1, 'anonymous', 'Anonymous group created automatically on 2018-05-02', 0, 0);
INSERT INTO `membership_groups` (`groupID`, `name`, `description`, `allowSignup`, `needsApproval`) VALUES(2, 'Admins', 'Admin group created automatically on 2018-05-02', 0, 1);
INSERT INTO `membership_groups` (`groupID`, `name`, `description`, `allowSignup`, `needsApproval`) VALUES(3, 'users', 'all test users', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `membership_userpermissions`
--

DROP TABLE IF EXISTS `membership_userpermissions`;
CREATE TABLE IF NOT EXISTS `membership_userpermissions` (
  `permissionID` int(10) UNSIGNED NOT NULL,
  `memberID` varchar(20) NOT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `allowInsert` tinyint(4) DEFAULT NULL,
  `allowView` tinyint(4) NOT NULL DEFAULT 0,
  `allowEdit` tinyint(4) NOT NULL DEFAULT 0,
  `allowDelete` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`permissionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `membership_userpermissions`:
--

-- --------------------------------------------------------

--
-- Table structure for table `membership_userrecords`
--

DROP TABLE IF EXISTS `membership_userrecords`;
CREATE TABLE IF NOT EXISTS `membership_userrecords` (
  `recID` bigint(20) UNSIGNED NOT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `pkValue` varchar(255) DEFAULT NULL,
  `memberID` varchar(20) DEFAULT NULL,
  `dateAdded` bigint(20) UNSIGNED DEFAULT NULL,
  `dateUpdated` bigint(20) UNSIGNED DEFAULT NULL,
  `groupID` int(11) DEFAULT NULL,
  UNIQUE KEY `tableName_pkValue` (`tableName`,`pkValue`),
  KEY `pkValue` (`pkValue`),
  KEY `tableName` (`tableName`),
  KEY `memberID` (`memberID`),
  KEY `groupID` (`groupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `membership_userrecords`:
--

--
-- Dumping data for table `membership_userrecords`
--

INSERT INTO `membership_userrecords` (`recID`, `tableName`, `pkValue`, `memberID`, `dateAdded`, `dateUpdated`, `groupID`) VALUES(1, 'classes', '1', 'admin', 1525280850, 1525280850, 2);
INSERT INTO `membership_userrecords` (`recID`, `tableName`, `pkValue`, `memberID`, `dateAdded`, `dateUpdated`, `groupID`) VALUES(2, 'classes', '2', 'admin', 1525280867, 1525280867, 2);
INSERT INTO `membership_userrecords` (`recID`, `tableName`, `pkValue`, `memberID`, `dateAdded`, `dateUpdated`, `groupID`) VALUES(5, 'branch', '1', 'admin', 1525280912, 1525280912, 2);
INSERT INTO `membership_userrecords` (`recID`, `tableName`, `pkValue`, `memberID`, `dateAdded`, `dateUpdated`, `groupID`) VALUES(6, 'branch', '2', 'admin', 1525280926, 1525280926, 2);
INSERT INTO `membership_userrecords` (`recID`, `tableName`, `pkValue`, `memberID`, `dateAdded`, `dateUpdated`, `groupID`) VALUES(7, 'sessions', '1', 'admin', 1525280952, 1525314825, 2);
INSERT INTO `membership_userrecords` (`recID`, `tableName`, `pkValue`, `memberID`, `dateAdded`, `dateUpdated`, `groupID`) VALUES(8, 'fee_structure', '1', 'admin', 1525281199, 1525281199, 2);
INSERT INTO `membership_userrecords` (`recID`, `tableName`, `pkValue`, `memberID`, `dateAdded`, `dateUpdated`, `groupID`) VALUES(9, 'students', '1', 'admin', 1525281461, 1525306816, 2);
INSERT INTO `membership_userrecords` (`recID`, `tableName`, `pkValue`, `memberID`, `dateAdded`, `dateUpdated`, `groupID`) VALUES(10, 'feescollection', '1', 'admin', 1525281522, 1525306950, 2);
INSERT INTO `membership_userrecords` (`recID`, `tableName`, `pkValue`, `memberID`, `dateAdded`, `dateUpdated`, `groupID`) VALUES(12, 'subjects', '1', 'admin', 1525294277, 1525294277, 2);
INSERT INTO `membership_userrecords` (`recID`, `tableName`, `pkValue`, `memberID`, `dateAdded`, `dateUpdated`, `groupID`) VALUES(13, 'schoolmoney', '1', 'admin', 1525306280, 1525306280, 2);
INSERT INTO `membership_userrecords` (`recID`, `tableName`, `pkValue`, `memberID`, `dateAdded`, `dateUpdated`, `groupID`) VALUES(14, 'examcategories', '1', 'admin', 1525310012, 1525310012, 2);
INSERT INTO `membership_userrecords` (`recID`, `tableName`, `pkValue`, `memberID`, `dateAdded`, `dateUpdated`, `groupID`) VALUES(15, 'feescollection', '2', 'admin', 1525314888, 1525314888, 2);
INSERT INTO `membership_userrecords` (`recID`, `tableName`, `pkValue`, `memberID`, `dateAdded`, `dateUpdated`, `groupID`) VALUES(0, 'classattendance', '0', 'admin', 1532241827, 1532241827, 2);
INSERT INTO `membership_userrecords` (`recID`, `tableName`, `pkValue`, `memberID`, `dateAdded`, `dateUpdated`, `groupID`) VALUES(0, 'schoolmoney', '0', 'admin', 1532945263, 1532945263, 2);
INSERT INTO `membership_userrecords` (`recID`, `tableName`, `pkValue`, `memberID`, `dateAdded`, `dateUpdated`, `groupID`) VALUES(0, 'classes', '0', 'admin', 1532945290, 1532945290, 2);
INSERT INTO `membership_userrecords` (`recID`, `tableName`, `pkValue`, `memberID`, `dateAdded`, `dateUpdated`, `groupID`) VALUES(0, 'studentcategories', '0', 'admin', 1532945324, 1532945324, 2);
INSERT INTO `membership_userrecords` (`recID`, `tableName`, `pkValue`, `memberID`, `dateAdded`, `dateUpdated`, `groupID`) VALUES(0, 'parents', '0', 'admin', 1532945398, 1532945398, 2);
INSERT INTO `membership_userrecords` (`recID`, `tableName`, `pkValue`, `memberID`, `dateAdded`, `dateUpdated`, `groupID`) VALUES(0, 'students', '0', 'admin', 1532945405, 1532945405, 2);
INSERT INTO `membership_userrecords` (`recID`, `tableName`, `pkValue`, `memberID`, `dateAdded`, `dateUpdated`, `groupID`) VALUES(0, 'teachers', '0', 'admin', 1532956950, 1532956950, 2);
INSERT INTO `membership_userrecords` (`recID`, `tableName`, `pkValue`, `memberID`, `dateAdded`, `dateUpdated`, `groupID`) VALUES(0, 'subjects', '0', 'admin', 1532956992, 1532956992, 2);
INSERT INTO `membership_userrecords` (`recID`, `tableName`, `pkValue`, `memberID`, `dateAdded`, `dateUpdated`, `groupID`) VALUES(0, 'notices', '0', 'admin', 1532957308, 1532957308, 2);
INSERT INTO `membership_userrecords` (`recID`, `tableName`, `pkValue`, `memberID`, `dateAdded`, `dateUpdated`, `groupID`) VALUES(0, 'feescollection', '0', 'admin', 1532957665, 1532957665, 2);
INSERT INTO `membership_userrecords` (`recID`, `tableName`, `pkValue`, `memberID`, `dateAdded`, `dateUpdated`, `groupID`) VALUES(0, 'branch', '0', 'admin', 1532957704, 1532957704, 2);
INSERT INTO `membership_userrecords` (`recID`, `tableName`, `pkValue`, `memberID`, `dateAdded`, `dateUpdated`, `groupID`) VALUES(0, 'events', '0', 'admin', 1532958930, 1532958930, 2);

-- --------------------------------------------------------

--
-- Table structure for table `membership_users`
--

DROP TABLE IF EXISTS `membership_users`;
CREATE TABLE IF NOT EXISTS `membership_users` (
  `memberID` varchar(20) NOT NULL,
  `passMD5` varchar(40) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `signupDate` date DEFAULT NULL,
  `groupID` int(10) UNSIGNED DEFAULT NULL,
  `isBanned` tinyint(4) DEFAULT NULL,
  `isApproved` tinyint(4) DEFAULT NULL,
  `custom1` text DEFAULT NULL,
  `custom2` text DEFAULT NULL,
  `custom3` text DEFAULT NULL,
  `custom4` text DEFAULT NULL,
  `comments` text DEFAULT NULL,
  `pass_reset_key` varchar(100) DEFAULT NULL,
  `pass_reset_expiry` int(10) UNSIGNED DEFAULT NULL,
  KEY `groupID` (`groupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `membership_users`:
--

--
-- Dumping data for table `membership_users`
--

INSERT INTO `membership_users` (`memberID`, `passMD5`, `email`, `signupDate`, `groupID`, `isBanned`, `isApproved`, `custom1`, `custom2`, `custom3`, `custom4`, `comments`, `pass_reset_key`, `pass_reset_expiry`) VALUES('admin', '9452f266332bbb5008b1321beff0ecf9', 'khandelwalsarvesh8@gmail.com', '2018-05-02', 2, 0, 1, '', '', '', '', 'Admin member created automatically on 2018-05-02\nRecord updated automatically on 2018-05-03\nmember updated his profile on 03/31/2020, 02:01 pm from IP address ::1\nRecord updated automatically on 2020-04-11\nRecord updated automatically on 2020-04-11', NULL, NULL);
INSERT INTO `membership_users` (`memberID`, `passMD5`, `email`, `signupDate`, `groupID`, `isBanned`, `isApproved`, `custom1`, `custom2`, `custom3`, `custom4`, `comments`, `pass_reset_key`, `pass_reset_expiry`) VALUES('guest', NULL, NULL, '2018-05-02', 1, 0, 1, NULL, NULL, NULL, NULL, 'Anonymous member created automatically on 2018-05-02', NULL, NULL);
INSERT INTO `membership_users` (`memberID`, `passMD5`, `email`, `signupDate`, `groupID`, `isBanned`, `isApproved`, `custom1`, `custom2`, `custom3`, `custom4`, `comments`, `pass_reset_key`, `pass_reset_expiry`) VALUES('sark', '1ebd97759d951209240305c9e9fd8fc3', 'sark@gmail.com', '2020-03-25', 3, 0, 1, '', '', '', '', 'member signed up through the registration form.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

DROP TABLE IF EXISTS `notices`;
CREATE TABLE IF NOT EXISTS `notices` (
  `id` int(10) UNSIGNED NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Date` date NOT NULL,
  `Details` text NOT NULL,
  `Posted_By` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `notices`:
--

--
-- Dumping data for table `notices`
--

INSERT INTO `notices` (`id`, `Name`, `Date`, `Details`, `Posted_By`) VALUES(0, 'Spirng Carnival', '2018-07-30', 'To inform all the students about the Spring Carnival Event which is going to be held on school premises. All the students are requested to take part in different activities. For more details contact RTE.', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `parents`
--

DROP TABLE IF EXISTS `parents`;
CREATE TABLE IF NOT EXISTS `parents` (
  `id` int(10) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Phone` varchar(40) NOT NULL,
  `Email` varchar(80) DEFAULT NULL,
  `HomeAddress` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `parents`:
--

--
-- Dumping data for table `parents`
--

INSERT INTO `parents` (`id`, `Name`, `Phone`, `Email`, `HomeAddress`) VALUES(1, 'Nitin', '9834944612', 'khandelwalsarvesh8@gmail.com', 'Thakur Village');
INSERT INTO `parents` (`id`, `Name`, `Phone`, `Email`, `HomeAddress`) VALUES(2, 'Rakesh', '9834944612', 'khandelwalsarvesh8@gmail.com', 'Oberoi Towers');

-- --------------------------------------------------------

--
-- Table structure for table `schoolmoney`
--

DROP TABLE IF EXISTS `schoolmoney`;
CREATE TABLE IF NOT EXISTS `schoolmoney` (
  `id` int(10) UNSIGNED NOT NULL,
  `Class` int(10) UNSIGNED NOT NULL,
  `Particulars` text NOT NULL,
  `Total` decimal(10,2) NOT NULL,
  KEY `Class` (`Class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `schoolmoney`:
--

--
-- Dumping data for table `schoolmoney`
--

INSERT INTO `schoolmoney` (`id`, `Class`, `Particulars`, `Total`) VALUES(1, 1, 'All fees-15000', '15000.00');
INSERT INTO `schoolmoney` (`id`, `Class`, `Particulars`, `Total`) VALUES(0, 2, 'demo', '15000.00');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` int(10) UNSIGNED NOT NULL,
  `Year` varchar(40) NOT NULL,
  `Term` varchar(40) NOT NULL,
  `status` varchar(40) DEFAULT NULL,
  `field4` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `sessions`:
--

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `Year`, `Term`, `status`, `field4`) VALUES(1, '2018', '2', 'active', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `studentcategories`
--

DROP TABLE IF EXISTS `studentcategories`;
CREATE TABLE IF NOT EXISTS `studentcategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `Name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `studentcategories`:
--

--
-- Dumping data for table `studentcategories`
--

INSERT INTO `studentcategories` (`id`, `Name`) VALUES(0, 'Demo');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Password` varchar(15) DEFAULT NULL,
  `FullName` varchar(40) NOT NULL,
  `Gender` varchar(40) NOT NULL,
  `DOB` date NOT NULL,
  `RegNo` varchar(40) NOT NULL,
  `Class` int(10) UNSIGNED NOT NULL,
  `Hobbies` varchar(255) DEFAULT NULL,
  `DOJ` date NOT NULL,
  `Category` varchar(10) DEFAULT NULL,
  `AcademicYear` int(10) UNSIGNED NOT NULL,
  `TotalFees` int(10) UNSIGNED NOT NULL,
  `AdvanceFees` int(11) NOT NULL,
  `Balance` int(11) DEFAULT NULL,
  `Parent` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `RegNo` (`RegNo`),
  UNIQUE KEY `RegNo_2` (`RegNo`),
  UNIQUE KEY `RegNo_3` (`RegNo`),
  UNIQUE KEY `RegNo_4` (`RegNo`),
  UNIQUE KEY `RegNo_5` (`RegNo`),
  UNIQUE KEY `RegNo_6` (`RegNo`),
  UNIQUE KEY `RegNo_7` (`RegNo`),
  UNIQUE KEY `RegNo_8` (`RegNo`),
  UNIQUE KEY `RegNo_9` (`RegNo`),
  UNIQUE KEY `RegNo_10` (`RegNo`),
  UNIQUE KEY `RegNo_11` (`RegNo`),
  UNIQUE KEY `RegNo_12` (`RegNo`),
  UNIQUE KEY `RegNo_13` (`RegNo`),
  UNIQUE KEY `RegNo_14` (`RegNo`),
  UNIQUE KEY `RegNo_15` (`RegNo`),
  UNIQUE KEY `RegNo_16` (`RegNo`),
  KEY `Parent` (`Parent`),
  KEY `Class` (`Class`),
  KEY `Category` (`Category`),
  KEY `AcademicYear` (`AcademicYear`),
  KEY `TotalFees` (`TotalFees`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `students`:
--   `Parent`
--       `parents` -> `id`
--

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `Password`, `FullName`, `Gender`, `DOB`, `RegNo`, `Class`, `Hobbies`, `DOJ`, `Category`, `AcademicYear`, `TotalFees`, `AdvanceFees`, `Balance`, `Parent`) VALUES(1, 'qwerty', 'Ram', 'Male', '2006-10-10', '2500', 1, 'Reading,Crafting', '2006-06-14', 'Open', 1, 4500, 2000, 8000, 1);
INSERT INTO `students` (`id`, `Password`, `FullName`, `Gender`, `DOB`, `RegNo`, `Class`, `Hobbies`, `DOJ`, `Category`, `AcademicYear`, `TotalFees`, `AdvanceFees`, `Balance`, `Parent`) VALUES(2, 'asdfgh', 'Reena', 'Female', '2006-04-07', '4502', 2, 'Cycling,Dancing,Travelling', '2008-06-15', 'Open', 5, 25630, 4542, 5452, 1);
INSERT INTO `students` (`id`, `Password`, `FullName`, `Gender`, `DOB`, `RegNo`, `Class`, `Hobbies`, `DOJ`, `Category`, `AcademicYear`, `TotalFees`, `AdvanceFees`, `Balance`, `Parent`) VALUES(3, 'zxcvbn', 'Yash', 'Male', '2004-04-17', '51125', 2, 'Cycling,Dancing,Reading', '2018-07-30', 'Open', 1, 5421, 442, 3500, 2);
INSERT INTO `students` (`id`, `Password`, `FullName`, `Gender`, `DOB`, `RegNo`, `Class`, `Hobbies`, `DOJ`, `Category`, `AcademicYear`, `TotalFees`, `AdvanceFees`, `Balance`, `Parent`) VALUES(5, 'wsxedc', 'Swati', 'Female', '2006-07-05', '4314', 1, 'Cycling,Dancing,Reading', '2008-07-16', 'Open', 5, 5454, 414, 441, 2);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
CREATE TABLE IF NOT EXISTS `subjects` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `subjects`:
--

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `Name`) VALUES(1, 'English');
INSERT INTO `subjects` (`id`, `Name`) VALUES(2, 'Hindi');
INSERT INTO `subjects` (`id`, `Name`) VALUES(3, 'Maths');
INSERT INTO `subjects` (`id`, `Name`) VALUES(4, 'Science');
INSERT INTO `subjects` (`id`, `Name`) VALUES(5, 'Arts');
INSERT INTO `subjects` (`id`, `Name`) VALUES(6, 'PT');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
CREATE TABLE IF NOT EXISTS `teachers` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) NOT NULL,
  `Gender` varchar(40) NOT NULL,
  `Age` int(11) NOT NULL,
  `Phone` varchar(40) NOT NULL,
  `Email` varchar(80) DEFAULT NULL,
  `StaffNumber` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `teachers`:
--

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `Name`, `Gender`, `Age`, `Phone`, `Email`, `StaffNumber`) VALUES(1, 'Vikas', 'Male', 29, '7531598522', 'vikas@gmail.com', 12);
INSERT INTO `teachers` (`id`, `Name`, `Gender`, `Age`, `Phone`, `Email`, `StaffNumber`) VALUES(2, 'Saurabh', 'Male', 33, '1597534560', 'saurabh@gmail.com', 13);
INSERT INTO `teachers` (`id`, `Name`, `Gender`, `Age`, `Phone`, `Email`, `StaffNumber`) VALUES(3, 'Kalpana', 'Female', 25, '123456789', 'kalpana23@gmail.com', 34);

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

DROP TABLE IF EXISTS `timetable`;
CREATE TABLE IF NOT EXISTS `timetable` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Time_Table` varchar(40) NOT NULL,
  `Class` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Class` (`Class`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `timetable`:
--

--
-- Dumping data for table `timetable`
--

INSERT INTO `timetable` (`id`, `Time_Table`, `Class`) VALUES(1, 'ENGLISH,HINDI,MATHS', 3);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`Parent`) REFERENCES `parents` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
