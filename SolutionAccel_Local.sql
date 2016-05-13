/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.6.27 : Database - solutionaccelerator
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`solutionaccelerator` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `solutionaccelerator`;

/*Table structure for table `AWSConfig` */

DROP TABLE IF EXISTS `AWSConfig`;

CREATE TABLE `AWSConfig` (
  `s3Location` varchar(255) DEFAULT NULL,
  `awsAccessKey` varchar(255) DEFAULT NULL,
  `awsSecretKey` varchar(255) DEFAULT NULL,
  `userId` int(10) DEFAULT NULL,
  `aliasName` varchar(255) DEFAULT NULL,
  `partitionColumn` varchar(255) DEFAULT NULL,
  KEY `userId_FK_AWS` (`userId`),
  CONSTRAINT `userId_FK_AWS` FOREIGN KEY (`userId`) REFERENCES `UserDetails` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `AWSConfig` */

insert  into `AWSConfig`(`s3Location`,`awsAccessKey`,`awsSecretKey`,`userId`,`aliasName`,`partitionColumn`) values ('s3n://localhost12','sdsdsd','hjhjhjj',1,'sushant','12');

/*Table structure for table `ClusterConfiguration` */

DROP TABLE IF EXISTS `ClusterConfiguration`;

CREATE TABLE `ClusterConfiguration` (
  `masterNodeUrl` varchar(255) DEFAULT NULL,
  `userId` int(10) DEFAULT NULL,
  `aliasName` varchar(255) DEFAULT NULL,
  KEY `clusterConfiguration_FK` (`userId`),
  CONSTRAINT `clusterConfiguration_FK` FOREIGN KEY (`userId`) REFERENCES `UserDetails` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ClusterConfiguration` */

insert  into `ClusterConfiguration`(`masterNodeUrl`,`userId`,`aliasName`) values ('ec2-54-92-156-66.compute-1.amazonaws.com',1,'sushant'),('ec2-54-92-156-66.compute-1.amazonaws.com',1,'sush_1');

/*Table structure for table `DbConfiguration` */

DROP TABLE IF EXISTS `DbConfiguration`;

CREATE TABLE `DbConfiguration` (
  `driverName` varchar(55) DEFAULT NULL,
  `hostIp` varchar(255) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `userId` int(10) DEFAULT NULL,
  `aliasName` varchar(255) NOT NULL,
  PRIMARY KEY (`aliasName`),
  KEY `DbConfiguration_FK` (`userId`),
  CONSTRAINT `DbConfiguration_FK` FOREIGN KEY (`userId`) REFERENCES `UserDetails` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `DbConfiguration` */

insert  into `DbConfiguration`(`driverName`,`hostIp`,`username`,`password`,`userId`,`aliasName`) values ('com.mysql.jdbc.Driver','localhost','root','root',1,'sushant'),('com.mysql.jdbc.Driver','localhost','root','root',1,'sush_1');

/*Table structure for table `EmailConfiguration` */

DROP TABLE IF EXISTS `EmailConfiguration`;

CREATE TABLE `EmailConfiguration` (
  `mailHost` varchar(255) DEFAULT NULL,
  `mailPort` varchar(100) DEFAULT NULL,
  `mailUsername` varchar(255) DEFAULT NULL,
  `mailPassword` varchar(255) DEFAULT NULL,
  `mailFolder` varchar(255) DEFAULT NULL,
  `isExchangeServer` varchar(50) DEFAULT NULL,
  `userId` int(10) DEFAULT NULL,
  `aliasName` varchar(100) DEFAULT NULL,
  KEY `EmailConfiguration_FK` (`userId`),
  CONSTRAINT `EmailConfiguration_FK` FOREIGN KEY (`userId`) REFERENCES `UserDetails` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `EmailConfiguration` */

/*Table structure for table `TwitterConfiguration` */

DROP TABLE IF EXISTS `TwitterConfiguration`;

CREATE TABLE `TwitterConfiguration` (
  `consumerKey` varchar(255) DEFAULT NULL,
  `consumerSecret` varchar(255) DEFAULT NULL,
  `accessToken` varchar(255) DEFAULT NULL,
  `accessTokenSecret` varchar(255) DEFAULT NULL,
  `batchingInterval` varchar(255) DEFAULT NULL,
  `userId` int(10) DEFAULT NULL,
  `aliasName` varchar(255) DEFAULT NULL,
  KEY `TwitterConfiguration_FK` (`userId`),
  CONSTRAINT `TwitterConfiguration_FK` FOREIGN KEY (`userId`) REFERENCES `UserDetails` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `TwitterConfiguration` */

/*Table structure for table `UserDetails` */

DROP TABLE IF EXISTS `UserDetails`;

CREATE TABLE `UserDetails` (
  `userId` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `emailId` varchar(255) DEFAULT NULL,
  `contactNumber` decimal(10,0) DEFAULT NULL,
  `companyName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `UserDetails` */

insert  into `UserDetails`(`userId`,`name`,`emailId`,`contactNumber`,`companyName`,`password`) values (1,'Sushant','sushant.varshney','9650655119','yash','sushant'),(2,'Dishant','dishant.mishra','9874563233','yash','dishant'),(3,'Harsh','harshvardhan','9179977892','yash','harshvardhan'),(4,'a','a','9806740467','a','a'),(5,'amit','amit@er.com','987654321','redme','qwerty'),(6,'sush','sushant@gmail.com','9650655119','Yash','indore');

/*Table structure for table `hdfsConfiguration` */

DROP TABLE IF EXISTS `hdfsConfiguration`;

CREATE TABLE `hdfsConfiguration` (
  `hdfsLocation` varchar(255) DEFAULT NULL,
  `userId` int(10) DEFAULT NULL,
  `aliasName` varchar(255) DEFAULT NULL,
  KEY `hdfsConfiguration_FK` (`userId`),
  CONSTRAINT `hdfsConfiguration_FK` FOREIGN KEY (`userId`) REFERENCES `UserDetails` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hdfsConfiguration` */

insert  into `hdfsConfiguration`(`hdfsLocation`,`userId`,`aliasName`) values ('/user/sushant',1,'sush_1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
