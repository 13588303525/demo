/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : lib

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2017-05-18 03:27:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for w_users
-- ----------------------------
DROP TABLE IF EXISTS `w_users`;
CREATE TABLE `w_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `age` int(11) DEFAULT NULL,
  `nick_name` varchar(32) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `user_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of w_users
-- ----------------------------
INSERT INTO `w_users` VALUES ('1', null, '', '', 'ad');
INSERT INTO `w_users` VALUES ('2', '2', '', '', 'ad');
INSERT INTO `w_users` VALUES ('3', '2', '', '', 'ad');
INSERT INTO `w_users` VALUES ('4', '11', 'w111', '11111', 'ww');
