-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.12-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema `c&um`
--

CREATE DATABASE IF NOT EXISTS `c&um`;
USE `c&um`;

--
-- Definition of table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `ID` char(36) NOT NULL,
  `NAME` varchar(30) NOT NULL,
  `ADDRESS` varchar(45) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `REVENUE` double NOT NULL,
  `EMPLOYEES` int(11) NOT NULL,
  `PRESENCE` varchar(30) NOT NULL,
  `CEO` varchar(30) NOT NULL,
  `CTO` varchar(30) NOT NULL,
  `STATUS` char(8) NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `CREATEDBY` char(36) DEFAULT NULL,
  `MODIFIED` datetime DEFAULT NULL,
  `MODIFIEDBY` char(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME_UNIQUE` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `client`
--

/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;


--
-- Definition of table `clientdomainlnk`
--

DROP TABLE IF EXISTS `clientdomainlnk`;
CREATE TABLE `clientdomainlnk` (
  `ID` char(36) NOT NULL,
  `DOMAINID` char(36) NOT NULL,
  `CLIENTID` char(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `DOMAINID_idx` (`DOMAINID`),
  KEY `CLIENTID_idx` (`CLIENTID`),
  CONSTRAINT `CLIENTID` FOREIGN KEY (`CLIENTID`) REFERENCES `client` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `DOMAINID` FOREIGN KEY (`DOMAINID`) REFERENCES `domain` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clientdomainlnk`
--

/*!40000 ALTER TABLE `clientdomainlnk` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientdomainlnk` ENABLE KEYS */;


--
-- Definition of table `domain`
--

DROP TABLE IF EXISTS `domain`;
CREATE TABLE `domain` (
  `ID` char(36) NOT NULL,
  `NAME` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME_UNIQUE` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `domain`
--

/*!40000 ALTER TABLE `domain` DISABLE KEYS */;
/*!40000 ALTER TABLE `domain` ENABLE KEYS */;


--
-- Definition of table `group`
--

DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `ID` char(36) NOT NULL,
  `NAME` varchar(30) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `STATUS` char(8) NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `CREATEDBY` char(36) DEFAULT NULL,
  `MODIFIED` datetime DEFAULT NULL,
  `MODIFIEDBY` char(36) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `group`
--

/*!40000 ALTER TABLE `group` DISABLE KEYS */;
/*!40000 ALTER TABLE `group` ENABLE KEYS */;


--
-- Definition of table `officeclientlnk`
--

DROP TABLE IF EXISTS `officeclientlnk`;
CREATE TABLE `officeclientlnk` (
  `ID` char(36) NOT NULL,
  `LOCATION` varchar(30) NOT NULL,
  `ADDRESS` varchar(45) NOT NULL,
  `CLIENTID` char(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `CLIENTID_4_idx` (`CLIENTID`),
  CONSTRAINT `CLIENTID_4` FOREIGN KEY (`CLIENTID`) REFERENCES `client` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `officeclientlnk`
--

/*!40000 ALTER TABLE `officeclientlnk` DISABLE KEYS */;
/*!40000 ALTER TABLE `officeclientlnk` ENABLE KEYS */;


--
-- Definition of table `permission`
--

DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `ID` char(36) NOT NULL,
  `NAME` varchar(30) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `STATUS` char(8) NOT NULL,
  `TYPECD` char(1) NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `CREATEDBY` char(36) DEFAULT NULL,
  `MODIFIED` datetime DEFAULT NULL,
  `MODIFIEDBY` char(36) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permission`
--

/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;


--
-- Definition of table `pocclientlnk`
--

DROP TABLE IF EXISTS `pocclientlnk`;
CREATE TABLE `pocclientlnk` (
  `ID` char(36) NOT NULL,
  `USERID` char(36) NOT NULL,
  `CLIENTID` char(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `USERID_3_idx` (`USERID`),
  KEY `CLIENTID_3_idx` (`CLIENTID`),
  CONSTRAINT `CLIENTID_3` FOREIGN KEY (`CLIENTID`) REFERENCES `client` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `USERID_3` FOREIGN KEY (`USERID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pocclientlnk`
--

/*!40000 ALTER TABLE `pocclientlnk` DISABLE KEYS */;
/*!40000 ALTER TABLE `pocclientlnk` ENABLE KEYS */;


--
-- Definition of table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `ID` char(36) NOT NULL,
  `NAME` varchar(30) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `STATUS` char(8) NOT NULL,
  `TYPE` char(7) NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `CREATEDBY` char(36) DEFAULT NULL,
  `MODIFIED` datetime DEFAULT NULL,
  `MODIFIEDBY` char(36) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `ID` char(36) NOT NULL,
  `USERNAME` varchar(30) NOT NULL,
  `PASSWORD` varchar(70) NOT NULL,
  `FNAME` varchar(30) NOT NULL,
  `MNAME` varchar(30) NOT NULL,
  `LNAME` varchar(30) NOT NULL,
  `GENDER` char(1) NOT NULL,
  `STATUS` char(8) NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `CREATEDBY` char(36) DEFAULT NULL,
  `MODIFIED` datetime DEFAULT NULL,
  `MODIFIEDBY` char(36) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


--
-- Definition of table `usergrouplnk`
--

DROP TABLE IF EXISTS `usergrouplnk`;
CREATE TABLE `usergrouplnk` (
  `ID` char(36) NOT NULL,
  `GROUPID` char(36) NOT NULL,
  `USERID` char(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `GROUPID_idx` (`GROUPID`),
  KEY `USERID_idx` (`USERID`),
  CONSTRAINT `GROUPID` FOREIGN KEY (`GROUPID`) REFERENCES `group` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `USERID` FOREIGN KEY (`USERID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usergrouplnk`
--

/*!40000 ALTER TABLE `usergrouplnk` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergrouplnk` ENABLE KEYS */;


--
-- Definition of table `userpermissionlnk`
--

DROP TABLE IF EXISTS `userpermissionlnk`;
CREATE TABLE `userpermissionlnk` (
  `ID` char(36) NOT NULL,
  `PERMISSIONID` char(36) NOT NULL,
  `USERID` char(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PERMISSIONID_idx` (`PERMISSIONID`),
  KEY `USERID_idx` (`USERID`),
  CONSTRAINT `PERMISSIONID_1` FOREIGN KEY (`PERMISSIONID`) REFERENCES `permission` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `USERID_1` FOREIGN KEY (`USERID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userpermissionlnk`
--

/*!40000 ALTER TABLE `userpermissionlnk` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissionlnk` ENABLE KEYS */;


--
-- Definition of table `userrolelnk`
--

DROP TABLE IF EXISTS `userrolelnk`;
CREATE TABLE `userrolelnk` (
  `ID` char(36) NOT NULL,
  `USERID` char(36) NOT NULL,
  `ROLEID` char(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `USERID_idx` (`USERID`),
  KEY `ROLEID_idx` (`ROLEID`),
  CONSTRAINT `ROLEID_2` FOREIGN KEY (`ROLEID`) REFERENCES `role` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `USERID_2` FOREIGN KEY (`USERID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userrolelnk`
--

/*!40000 ALTER TABLE `userrolelnk` DISABLE KEYS */;
/*!40000 ALTER TABLE `userrolelnk` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
