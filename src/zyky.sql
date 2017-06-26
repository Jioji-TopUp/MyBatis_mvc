/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50544
Source Host           : localhost:3306
Source Database       : zyky

Target Server Type    : MYSQL
Target Server Version : 50544
File Encoding         : 65001

Date: 2016-11-11 15:24:59
*/
SET FOREIGN_KEY_CHECKS=0;
 create database zyky;
  use zyky;
  


-- ----------------------------
-- Table structure for t_kecheng
-- ----------------------------
DROP TABLE IF EXISTS `t_kecheng`;
CREATE TABLE `t_kecheng` (
  `kcid` varchar(20) NOT NULL,
  `kcname` varchar(10) NOT NULL,
  `kc_type` int(2) NOT NULL,
  `user_id` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`kcid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_kecheng
-- ----------------------------
INSERT INTO `t_kecheng` VALUES ('1', 'English', '0', '');
INSERT INTO `t_kecheng` VALUES ('2', '语文', '1', 'admin');
INSERT INTO `t_kecheng` VALUES ('3', '古文', '1', 'admin');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(30) NOT NULL,
  `PWD` varchar(100) NOT NULL,
  PRIMARY KEY (`rec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', 'admin123');
INSERT INTO `t_user` VALUES ('38', 'u0', '0');
INSERT INTO `t_user` VALUES ('39', 'u1', '1');
INSERT INTO `t_user` VALUES ('40', 'u2', '2');
INSERT INTO `t_user` VALUES ('41', 'u3', '3');
INSERT INTO `t_user` VALUES ('42', 'u4', '4');
INSERT INTO `t_user` VALUES ('43', 'u5', '5');
INSERT INTO `t_user` VALUES ('44', 'u6', '6');
INSERT INTO `t_user` VALUES ('45', 'u7', '7');
INSERT INTO `t_user` VALUES ('46', 'u8', '8');
INSERT INTO `t_user` VALUES ('47', 'u9', '9');
INSERT INTO `t_user` VALUES ('48', 'u10', '10');
INSERT INTO `t_user` VALUES ('49', 'u11', '11');
INSERT INTO `t_user` VALUES ('50', 'u0', '0');
INSERT INTO `t_user` VALUES ('51', 'u1', '1');
INSERT INTO `t_user` VALUES ('52', 'u2', '2');
INSERT INTO `t_user` VALUES ('53', 'u3', '3');
INSERT INTO `t_user` VALUES ('54', 'u4', '4');
INSERT INTO `t_user` VALUES ('55', 'u5', '5');
INSERT INTO `t_user` VALUES ('56', 'u6', '6');
INSERT INTO `t_user` VALUES ('57', 'u7', '7');
INSERT INTO `t_user` VALUES ('58', 'u8', '8');
INSERT INTO `t_user` VALUES ('59', 'u9', '9');
INSERT INTO `t_user` VALUES ('60', 'u10', '10');
INSERT INTO `t_user` VALUES ('61', 'u11', '11');
