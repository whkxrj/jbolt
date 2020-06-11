/*
 Navicat Premium Data Transfer

 Source Server         : mysql8
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : jbolt

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 23/12/2019 11:26:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for jb_demotable
-- ----------------------------
DROP TABLE IF EXISTS `jb_demotable`;
CREATE TABLE `jb_demotable`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `demo_date` date NULL DEFAULT NULL COMMENT 'demo日期',
  `demo_time` time(0) NULL DEFAULT NULL COMMENT 'demo时间',
  `demo_date_time` datetime(0) NULL DEFAULT NULL COMMENT 'demo日期与时间',
  `demo_week` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'demo周',
  `demo_month` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'demo月',
  `time` time(0) NULL DEFAULT NULL COMMENT 'demo纯时间',
  `enable` bit(1) NULL DEFAULT NULL COMMENT '启用',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级ID',
  `sort_rank` int(1) NULL DEFAULT NULL COMMENT '序号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `breif_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简介',
  `is_system_admin` bit(1) NULL DEFAULT NULL COMMENT '是否为管理',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
