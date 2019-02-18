/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50544
Source Host           : localhost:3306
Source Database       : docker

Target Server Type    : MYSQL
Target Server Version : 50544
File Encoding         : 65001

Date: 2018-11-22 11:23:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(100) NOT NULL COMMENT 'id',
  `ip` varchar(50) NOT NULL COMMENT 'ip地址',
  `loginTime` int(11) NOT NULL DEFAULT '0' COMMENT '登陆次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('ba5273f9-9366-43a4-8f9b-edacff46ca30', '0:0:0:0:0:0:0:1', '30');
