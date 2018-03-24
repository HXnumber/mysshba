# Host: localhost  (Version 5.0.37-community-nt)
# Date: 2018-03-24 18:10:40
# Generator: MySQL-Front 6.0  (Build 2.20)


#
# Structure for table "users"
#

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `Id` int(11) NOT NULL auto_increment,
  `username` varchar(255) default '',
  `password` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

#
# Data for table "users"
#

INSERT INTO `users` VALUES (1,'huangxin','123456','黄鑫');

