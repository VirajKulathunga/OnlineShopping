-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.52-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema onlineshopping
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ onlineshopping;
USE onlineshopping;

--
-- Table structure for table `onlineshopping`.`amount`
--

DROP TABLE IF EXISTS `amount`;
CREATE TABLE `amount` (
  `CUSTOMER_ID` varchar(40) DEFAULT NULL,
  `AMOUNT` int(10) DEFAULT NULL,
  `AMOUNT_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `onlineshopping`.`amount`
--

/*!40000 ALTER TABLE `amount` DISABLE KEYS */;
/*!40000 ALTER TABLE `amount` ENABLE KEYS */;


--
-- Table structure for table `onlineshopping`.`category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `VENDOR_CODE` varchar(40) NOT NULL DEFAULT '',
  `CATEGORY_CODE` varchar(40) NOT NULL DEFAULT '',
  `CATEGORY_NAME` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`VENDOR_CODE`,`CATEGORY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `onlineshopping`.`category`
--

/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`VENDOR_CODE`,`CATEGORY_CODE`,`CATEGORY_NAME`) VALUES 
 ('V01','C01','asa');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;


--
-- Table structure for table `onlineshopping`.`customerid`
--

DROP TABLE IF EXISTS `customerid`;
CREATE TABLE `customerid` (
  `CUSTOMER_ID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `onlineshopping`.`customerid`
--

/*!40000 ALTER TABLE `customerid` DISABLE KEYS */;
INSERT INTO `customerid` (`CUSTOMER_ID`) VALUES 
 (1);
/*!40000 ALTER TABLE `customerid` ENABLE KEYS */;


--
-- Table structure for table `onlineshopping`.`discount`
--

DROP TABLE IF EXISTS `discount`;
CREATE TABLE `discount` (
  `PRODUCT_CODE` varchar(40) DEFAULT NULL,
  `QUANTITY` int(10) DEFAULT NULL,
  `DISCOUNT` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `onlineshopping`.`discount`
--

/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
INSERT INTO `discount` (`PRODUCT_CODE`,`QUANTITY`,`DISCOUNT`) VALUES 
 ('P01',10,10);
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;


--
-- Table structure for table `onlineshopping`.`login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `USER_NAME` varchar(40) NOT NULL,
  `PASSWORD` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`USER_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `onlineshopping`.`login`
--

/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` (`USER_NAME`,`PASSWORD`) VALUES 
 ('testuser','testuser'),
 ('user','user');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;


--
-- Table structure for table `onlineshopping`.`order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `CUSTOMER_ID` varchar(40) DEFAULT NULL,
  `PRODUCT_CODE` varchar(40) DEFAULT NULL,
  `QUANTITY_ORDERED` int(10) DEFAULT NULL,
  `UNIT_COST` double(7,2) DEFAULT NULL,
  `NET_COST` double(9,2) DEFAULT NULL,
  `ORDER_DATE` date DEFAULT NULL,
  `PAYMENT_MODE` varchar(40) DEFAULT NULL,
  `cc_dd_cheque_no` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `onlineshopping`.`order`
--

/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` (`CUSTOMER_ID`,`PRODUCT_CODE`,`QUANTITY_ORDERED`,`UNIT_COST`,`NET_COST`,`ORDER_DATE`,`PAYMENT_MODE`,`cc_dd_cheque_no`) VALUES 
 ('AB2','P01',10,100.00,1000.00,'2018-01-10','cash','');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;


--
-- Table structure for table `onlineshopping`.`product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `VENDOR_CODE` varchar(40) DEFAULT NULL,
  `CATEGORY_CODE` varchar(40) DEFAULT NULL,
  `PRODUCT_CODE` varchar(40) NOT NULL,
  `PRODUCT_NAME` varchar(40) DEFAULT NULL,
  `UNIT_COST` int(10) DEFAULT NULL,
  `TAX` int(10) DEFAULT NULL,
  `DESCRIPTION` varchar(40) DEFAULT NULL,
  `DISCOUNT` double(8,2) DEFAULT NULL,
  `MIN_QUANTITY` int(10) DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `onlineshopping`.`product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`VENDOR_CODE`,`CATEGORY_CODE`,`PRODUCT_CODE`,`PRODUCT_NAME`,`UNIT_COST`,`TAX`,`DESCRIPTION`,`DISCOUNT`,`MIN_QUANTITY`) VALUES 
 ('V01','C01','P01','TestProduct',10000,4,' d',5.00,1),
 ('V01','C01','P02','Test Product 2',10000,4,'tesst',10.00,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;


--
-- Table structure for table `onlineshopping`.`registration`
--

DROP TABLE IF EXISTS `registration`;
CREATE TABLE `registration` (
  `CUSTOMER_ID` varchar(45) NOT NULL DEFAULT '',
  `USER_NAME` varchar(45) NOT NULL DEFAULT '',
  `PASSWORD` varchar(45) NOT NULL DEFAULT '',
  `DISTR_NAME` varchar(45) NOT NULL DEFAULT '',
  `ADDRESS` varchar(45) NOT NULL DEFAULT '',
  `CITY` varchar(45) NOT NULL DEFAULT '',
  `STATE` varchar(45) NOT NULL DEFAULT '',
  `COUNTRY` varchar(45) NOT NULL DEFAULT '',
  `REGION` varchar(45) NOT NULL DEFAULT '',
  `EMAIL` varchar(45) NOT NULL DEFAULT '',
  `PHONE` int(10) unsigned NOT NULL DEFAULT '0',
  `FAX` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `onlineshopping`.`registration`
--

/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` (`CUSTOMER_ID`,`USER_NAME`,`PASSWORD`,`DISTR_NAME`,`ADDRESS`,`CITY`,`STATE`,`COUNTRY`,`REGION`,`EMAIL`,`PHONE`,`FAX`) VALUES 
 ('AB1','testuser','testuser','Test','','','','a','a1','',717571655,717571655),
 ('AB2','user','user','Test','','','','a','a1','',717571655,717571655);
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;


--
-- Table structure for table `onlineshopping`.`stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `product_code` varchar(20) DEFAULT NULL,
  `product_name` varchar(20) DEFAULT NULL,
  `quantity` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `onlineshopping`.`stock`
--

/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` (`product_code`,`product_name`,`quantity`) VALUES 
 ('P01','Test Product','917'),
 ('P02','Test Product 2',' ');
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;


--
-- Table structure for table `onlineshopping`.`vendor`
--

DROP TABLE IF EXISTS `vendor`;
CREATE TABLE `vendor` (
  `VENDOR_CODE` varchar(40) NOT NULL,
  `VENDOR_NAME` varchar(40) DEFAULT NULL,
  `ADDRESS` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`VENDOR_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `onlineshopping`.`vendor`
--

/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` (`VENDOR_CODE`,`VENDOR_NAME`,`ADDRESS`) VALUES 
 ('V01','Test Vendor',' ');
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
