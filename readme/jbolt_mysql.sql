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

 Date: 15/05/2020 20:26:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for jb_application
-- ----------------------------
DROP TABLE IF EXISTS `jb_application`;
CREATE TABLE `jb_application`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '应用名称',
  `brief_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用简介',
  `app_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用ID',
  `app_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用密钥',
  `enable` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否启用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '创建用户ID',
  `update_user_id` int(11) NULL DEFAULT NULL COMMENT '更新用户ID',
  `type` int(11) NOT NULL COMMENT 'app类型',
  `need_check_sign` bit(1) NULL DEFAULT b'1' COMMENT '是否需要接口校验SIGN',
  `link_target_id` int(11) NULL DEFAULT NULL COMMENT '关联目标ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'API应用中心的应用APP' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jb_application
-- ----------------------------
INSERT INTO `jb_application` VALUES (24, 'JFinal 应用-JFinal学院', NULL, 'jb2h58i7idseolt', 'ejBhY3pmM3c1bTQ1cXczMWZtNW1saWszMXNqNzhlZ2c=', b'1', '2020-04-25 21:20:44', '2020-05-15 10:25:57', 1, 1, 4, b'1', 30);

-- ----------------------------
-- Table structure for jb_brand
-- ----------------------------
DROP TABLE IF EXISTS `jb_brand`;
CREATE TABLE `jb_brand`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `enable` bit(1) NULL DEFAULT NULL,
  `sort_rank` int(11) NULL DEFAULT NULL COMMENT '排序',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网址',
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'logo地址',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注描述',
  `english_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '英文名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '品牌' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jb_brand
-- ----------------------------
INSERT INTO `jb_brand` VALUES (3, '阿迪达斯', b'1', 3, NULL, 'upload/mall/brand/20200227/49e17663-d289-4d29-be41-824db0517d80.jpg', NULL, NULL);
INSERT INTO `jb_brand` VALUES (4, '乔丹', b'1', 4, NULL, 'upload/mall/brand/20200228/798001f4-692a-4693-bc89-20bc07829be2.png', NULL, 'johdy');
INSERT INTO `jb_brand` VALUES (6, '唐朝', b'1', 6, NULL, 'C:/dev/uploadImg/upload/mall/brand/20200228/a23d30ce-ea8a-4575-b812-c3e32a99eec1.png', NULL, 'tangcaosoft');
INSERT INTO `jb_brand` VALUES (7, '无与伦比', b'1', 7, NULL, 'upload/mall/brand/20190712/3e653be5-6f3d-423a-9d1a-50fb8ab8ff56.jpg', NULL, 'wylb');
INSERT INTO `jb_brand` VALUES (9, '324234', b'1', 9, NULL, NULL, NULL, '234');
INSERT INTO `jb_brand` VALUES (10, '2342324', b'1', 10, '234', NULL, '234', '234');
INSERT INTO `jb_brand` VALUES (11, 'asd', b'1', 9, 'asd', NULL, 'asd', 'asd');
INSERT INTO `jb_brand` VALUES (14, '111', b'1', 8, '11', NULL, '111', '111');
INSERT INTO `jb_brand` VALUES (17, 'sdas', b'1', 9, 'as', NULL, 'dasdasd', 'dassd');

-- ----------------------------
-- Table structure for jb_change_log
-- ----------------------------
DROP TABLE IF EXISTS `jb_change_log`;
CREATE TABLE `jb_change_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `jbolt_version_id` int(11) NULL DEFAULT NULL COMMENT 'jbolt版本ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'changeLog' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jb_change_log
-- ----------------------------
INSERT INTO `jb_change_log` VALUES (5, '<p>最新版本的内容</p>', '2019-03-16 00:18:12', 2);
INSERT INTO `jb_change_log` VALUES (6, '<p>测试厕撒大声地测试</p>', '2019-03-18 10:24:08', 3);
INSERT INTO `jb_change_log` VALUES (7, '<p><img><br></p>', '2019-06-20 03:00:55', 4);
INSERT INTO `jb_change_log` VALUES (8, '<p>1萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多</p><p><img src=\"/upload/jboltversion/20191110/ebe3f2f5-29a2-43c0-89d1-1ed5561d303f.jpeg\" style=\"width: 500px;\"><br></p>', '2019-09-11 00:42:55', 8);
INSERT INTO `jb_change_log` VALUES (9, '<p>wasdsad</p>', '2019-09-21 21:45:43', 5);
INSERT INTO `jb_change_log` VALUES (10, '<p>这是changelog内容</p><p><img src=\"/upload/jboltversion/20190922/0ba0f57d-b166-41ad-8935-7da865c66789.png\" style=\"width: 427px;\"><br></p>', '2019-09-22 00:18:05', 9);
INSERT INTO `jb_change_log` VALUES (11, '<p>萨达</p>', '2020-01-21 02:03:51', 55);
INSERT INTO `jb_change_log` VALUES (12, '<p>asdasdasdasd</p>', '2020-03-05 11:49:20', 610);
INSERT INTO `jb_change_log` VALUES (13, '<p>asdasd</p>', '2020-03-28 15:09:03', 657);
INSERT INTO `jb_change_log` VALUES (14, '<p>asdasdasd</p>\n<p>&lt;img src=\'http://www.jfinalxueyuan.com/img/jfinalxueyuanlogo.png\'/&gt;</p> \n<img src=\"http://www.jfinalxueyuan.com/img/jfinalxueyuanlogo.png\">', '2020-04-01 11:28:48', 611);

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
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jb_demotable
-- ----------------------------
INSERT INTO `jb_demotable` VALUES (1, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (2, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (3, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (4, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (5, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (6, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (7, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (8, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (9, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (10, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (11, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (12, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (13, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (14, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (15, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (16, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (17, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (18, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (19, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (20, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (21, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (22, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (23, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (24, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (25, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (26, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (27, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (28, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (29, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (30, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (31, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (32, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (33, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (34, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (35, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (36, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (37, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'1', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (38, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'0', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (39, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'0', 0, 1, '111', 1, '111', b'1');
INSERT INTO `jb_demotable` VALUES (40, '2020-01-29', '13:55:58', '2020-01-29 13:56:02', '1', '1', '13:56:08', b'0', 0, 1, '111', 1, '111', b'1');

-- ----------------------------
-- Table structure for jb_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `jb_dictionary`;
CREATE TABLE `jb_dictionary`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典ID主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '字典类型ID',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父类ID',
  `sort_rank` int(11) NULL DEFAULT NULL COMMENT '排序',
  `sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编号编码',
  `type_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典类型KEY',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 297 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jb_dictionary
-- ----------------------------
INSERT INTO `jb_dictionary` VALUES (153, 'PDF文件', 9, 0, 1, '为其 第三方', 'fileType');
INSERT INTO `jb_dictionary` VALUES (154, 'Zip压缩包', 9, 0, 2, NULL, 'fileType');
INSERT INTO `jb_dictionary` VALUES (156, 'Excel表格', 9, 0, 3, 'excel', 'fileType');
INSERT INTO `jb_dictionary` VALUES (157, 'PPT幻灯片', 9, 0, 5, NULL, 'fileType');
INSERT INTO `jb_dictionary` VALUES (158, '个', 11, 0, 1, NULL, 'goodsunit');
INSERT INTO `jb_dictionary` VALUES (159, '件', 11, 0, 2, NULL, 'goodsunit');
INSERT INTO `jb_dictionary` VALUES (160, '双', 11, 0, 3, NULL, 'goodsunit');
INSERT INTO `jb_dictionary` VALUES (161, '桶', 11, 0, 4, NULL, 'goodsunit');
INSERT INTO `jb_dictionary` VALUES (162, '只', 11, 0, 5, NULL, 'goodsunit');
INSERT INTO `jb_dictionary` VALUES (163, '支', 11, 0, 6, NULL, 'goodsunit');
INSERT INTO `jb_dictionary` VALUES (206, '1', 12, 0, 1, NULL, '2323');
INSERT INTO `jb_dictionary` VALUES (207, '2', 12, 0, 2, NULL, '2323');
INSERT INTO `jb_dictionary` VALUES (208, '3', 12, 0, 3, NULL, '2323');
INSERT INTO `jb_dictionary` VALUES (209, '4', 12, 0, 4, NULL, '2323');
INSERT INTO `jb_dictionary` VALUES (210, '5', 12, 0, 5, NULL, '2323');
INSERT INTO `jb_dictionary` VALUES (211, '6', 12, 0, 6, NULL, '2323');
INSERT INTO `jb_dictionary` VALUES (212, '7', 12, 0, 7, NULL, '2323');
INSERT INTO `jb_dictionary` VALUES (213, '8', 12, 0, 8, NULL, '2323');
INSERT INTO `jb_dictionary` VALUES (214, '9', 12, 0, 9, NULL, '2323');
INSERT INTO `jb_dictionary` VALUES (215, '0', 12, 0, 10, NULL, '2323');
INSERT INTO `jb_dictionary` VALUES (216, '11', 12, 0, 11, NULL, '2323');
INSERT INTO `jb_dictionary` VALUES (217, '13', 12, 0, 12, NULL, '2323');
INSERT INTO `jb_dictionary` VALUES (218, '45', 12, 0, 13, NULL, '2323');
INSERT INTO `jb_dictionary` VALUES (219, '5465', 12, 0, 14, NULL, '2323');
INSERT INTO `jb_dictionary` VALUES (220, '4324234', 12, 0, 15, NULL, '2323');
INSERT INTO `jb_dictionary` VALUES (227, '三级001', 8, 203, 1, NULL, 'group');
INSERT INTO `jb_dictionary` VALUES (229, '五级001', 8, 228, 1, NULL, 'group');
INSERT INTO `jb_dictionary` VALUES (230, '六级001', 8, 229, 1, '3', 'group');
INSERT INTO `jb_dictionary` VALUES (243, 'hava', 8, 0, 1, '暗色调', 'group');
INSERT INTO `jb_dictionary` VALUES (244, 'as', 8, 243, 1, '嗖嗖嗖', 'group');
INSERT INTO `jb_dictionary` VALUES (245, '暗色调', 8, 243, 2, '上升到', 'group');
INSERT INTO `jb_dictionary` VALUES (247, '大', 8, 244, 1, '地方', 'group');
INSERT INTO `jb_dictionary` VALUES (249, '爽肤水', 8, 244, 2, 'ad', 'group');
INSERT INTO `jb_dictionary` VALUES (251, '萨是达', 8, 243, 3, '都1是', 'group');
INSERT INTO `jb_dictionary` VALUES (252, 'ddd', 8, 0, 3, '萨是达', 'group');
INSERT INTO `jb_dictionary` VALUES (253, '大风刮过', 8, 252, 1, '大S二', 'group');
INSERT INTO `jb_dictionary` VALUES (265, 'w', 8, 251, 1, 'w', 'group');
INSERT INTO `jb_dictionary` VALUES (267, 'aa', 8, 0, 2, 'aa', 'group');
INSERT INTO `jb_dictionary` VALUES (268, '2232', 9, 0, 4, '123123', 'fileType');
INSERT INTO `jb_dictionary` VALUES (269, 'sad', 8, 243, 4, 'asdasd', 'group');
INSERT INTO `jb_dictionary` VALUES (272, '3333', 16, 271, 1, '3333', '4551');
INSERT INTO `jb_dictionary` VALUES (278, 'asd', 9, 0, 6, NULL, 'fileType');
INSERT INTO `jb_dictionary` VALUES (279, 'ass就打开拉近索拉卡极速降低', 9, 0, 7, NULL, 'fileType');
INSERT INTO `jb_dictionary` VALUES (280, '撒旦撒大', 9, 0, 8, NULL, 'fileType');
INSERT INTO `jb_dictionary` VALUES (281, '阿打算所所所所', 9, 0, 9, NULL, 'fileType');
INSERT INTO `jb_dictionary` VALUES (282, '萨达撒打算打算', 9, 0, 10, NULL, 'fileType');
INSERT INTO `jb_dictionary` VALUES (291, 'gggg', 8, 0, 4, 'gggfgg', 'group');
INSERT INTO `jb_dictionary` VALUES (292, 'gggh', 8, 0, 5, 'gggghh', 'group');
INSERT INTO `jb_dictionary` VALUES (293, '33', 8, 0, 6, NULL, 'group');
INSERT INTO `jb_dictionary` VALUES (294, '44', 8, 0, 7, NULL, 'group');
INSERT INTO `jb_dictionary` VALUES (295, '55', 8, 0, 8, NULL, 'group');
INSERT INTO `jb_dictionary` VALUES (296, '66', 8, 0, 9, NULL, 'group');

-- ----------------------------
-- Table structure for jb_dictionary_type
-- ----------------------------
DROP TABLE IF EXISTS `jb_dictionary_type`;
CREATE TABLE `jb_dictionary_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mode_level` int(11) NULL DEFAULT NULL COMMENT '模式层级',
  `type_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标识KEY',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jb_dictionary_type
-- ----------------------------
INSERT INTO `jb_dictionary_type` VALUES (8, '数据分类', 2, 'group');
INSERT INTO `jb_dictionary_type` VALUES (9, '文件类型', 1, 'fileType');
INSERT INTO `jb_dictionary_type` VALUES (11, '商品单位', 1, 'goodsunit');
INSERT INTO `jb_dictionary_type` VALUES (12, '2323', 1, '2323');
INSERT INTO `jb_dictionary_type` VALUES (13, '12312', 1, '12');
INSERT INTO `jb_dictionary_type` VALUES (16, '4445677', 2, '4551');
INSERT INTO `jb_dictionary_type` VALUES (22, 'asdasd', 2, 'asdasdsss');
INSERT INTO `jb_dictionary_type` VALUES (23, 'asd', 1, 'asd');
INSERT INTO `jb_dictionary_type` VALUES (24, 'dfgdfg', 1, 'ewrwer');
INSERT INTO `jb_dictionary_type` VALUES (25, 'rtyrty', 1, '324234');
INSERT INTO `jb_dictionary_type` VALUES (28, 'asdqwe', 1, 'aaaqwe');
INSERT INTO `jb_dictionary_type` VALUES (29, 'wwwe', 1, 'qweqwe');
INSERT INTO `jb_dictionary_type` VALUES (30, '222', 1, '22234');
INSERT INTO `jb_dictionary_type` VALUES (31, 'qwere', 1, 'werr');
INSERT INTO `jb_dictionary_type` VALUES (32, 'qwe', 1, 'wrtet');
INSERT INTO `jb_dictionary_type` VALUES (33, 'qqqw', 1, 'eqrert');

-- ----------------------------
-- Table structure for jb_download_log
-- ----------------------------
DROP TABLE IF EXISTS `jb_download_log`;
CREATE TABLE `jb_download_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipaddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `download_type` int(11) NULL DEFAULT NULL COMMENT '下载类型',
  `download_time` datetime(0) NULL DEFAULT NULL COMMENT '下载时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '下载log' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jb_download_log
-- ----------------------------
INSERT INTO `jb_download_log` VALUES (66, 'localhost', 1, '2020-02-25 16:01:26');
INSERT INTO `jb_download_log` VALUES (67, 'localhost', 1, '2020-02-25 16:03:52');
INSERT INTO `jb_download_log` VALUES (68, 'localhost', 1, '2020-02-25 16:03:52');

-- ----------------------------
-- Table structure for jb_global_config
-- ----------------------------
DROP TABLE IF EXISTS `jb_global_config`;
CREATE TABLE `jb_global_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置KEY',
  `config_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '配置项值',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '创建用户ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user_id` int(11) NULL DEFAULT NULL COMMENT '更新用户ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `value_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '值类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '全局配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jb_global_config
-- ----------------------------
INSERT INTO `jb_global_config` VALUES (6, 'WECHAT_MP_SERVER_DOMAIN', 'http://jbolt.cn/wx/msg', '2019-05-14 01:35:03', 1, '2020-04-02 02:10:39', 1, '微信公众号_服务器配置_根URL', 'string');
INSERT INTO `jb_global_config` VALUES (7, 'WECHAT_WXA_SERVER_DOMAIN', 'http://m2020.utools.club/wxa/msg', '2019-05-14 01:35:03', 1, '2020-05-15 10:19:16', 1, '微信小程序_客服消息推送配置_根URL', 'string');
INSERT INTO `jb_global_config` VALUES (12, 'SYSTEM_NAME', 'JBolt极速开发平台(演示版):#FFFFFF', '2019-05-16 15:15:03', 1, '2020-04-30 03:21:13', 1, '系统名称', 'string');
INSERT INTO `jb_global_config` VALUES (13, 'SYSTEM_ADMIN_LOGO', 'assets/img/logo.png:assets/img/logo_sm.png', '2019-05-16 15:15:03', 1, '2020-05-05 22:16:01', 1, '系统后台主页LOGO', 'string');
INSERT INTO `jb_global_config` VALUES (14, 'SYSTEM_COPYRIGHT_COMPANY', '©JBolt(JBOLT.CN)', '2019-05-16 15:15:03', 1, '2019-12-08 00:06:11', 1, '系统版权所有人', 'string');
INSERT INTO `jb_global_config` VALUES (15, 'SYSTEM_COPYRIGHT_LINK', 'http://jbolt.cn', '2019-05-16 15:15:03', 1, '2020-02-28 04:54:15', 1, '系统版权所有人的网址链接', 'string');
INSERT INTO `jb_global_config` VALUES (16, 'WECHAT_ASSETS_SERVER_DOMAIN', 'http://jbolt.cn', '2019-07-04 11:48:56', 1, '2020-02-21 14:45:42', 1, '微信_静态资源_根URL', 'string');
INSERT INTO `jb_global_config` VALUES (19, 'JBOLT_ADMIN_STYLE', 'default', '2019-07-14 22:25:13', 1, '2020-05-02 22:19:36', 1, '系统Admin后台样式', 'string');
INSERT INTO `jb_global_config` VALUES (20, 'JBOLT_ADMIN_WITH_TABS', 'true', '2019-08-04 13:21:25', 1, '2020-02-21 14:40:51', 1, '系统Admin后台是否启用多选项卡', 'boolean');
INSERT INTO `jb_global_config` VALUES (21, 'JBOLT_LOGIN_FORM_STYLE_GLASS', 'false', '2019-08-06 17:12:23', 1, '2020-05-02 22:17:19', 1, '系统登录页面是否启用透明玻璃风格', 'boolean');
INSERT INTO `jb_global_config` VALUES (22, 'JBOLT_LOGIN_USE_CAPTURE', 'true', '2019-09-07 20:57:26', 1, '2019-12-23 11:19:14', 1, '系统登录页面是否启用验证码', 'boolean');
INSERT INTO `jb_global_config` VALUES (23, 'JBOLT_LOGIN_BGIMG_BLUR', 'true', '2019-09-26 04:48:10', 1, '2019-12-08 00:11:20', 1, '系统登录页面背景图是否启用模糊风格', 'boolean');
INSERT INTO `jb_global_config` VALUES (24, 'JBOLT_LOGIN_CAPTURE_TYPE', 'bubble_png', '2019-09-27 10:52:45', 1, '2019-12-08 00:06:11', 1, '系统登录页验证码类型', 'string');
INSERT INTO `jb_global_config` VALUES (25, 'JBOLT_LOGIN_BGIMG', 'assets/css/img/loginbg/earth.jpg', '2019-09-30 00:48:04', 1, '2020-05-02 22:17:08', 1, '系统登录页背景图', 'string');
INSERT INTO `jb_global_config` VALUES (26, 'JBOLT_ACTION_REPORT_WRITER', 'sysout', '2019-12-08 10:50:18', 1, '2020-03-12 18:47:36', 1, 'JFinal Action Report输出方式', 'string');
INSERT INTO `jb_global_config` VALUES (27, 'JBOLT_AUTO_CACHE_LOG', 'false', '2019-12-08 10:50:18', 1, '2020-03-12 18:47:40', 1, 'JBolt自动缓存Debug日志', 'boolean');
INSERT INTO `jb_global_config` VALUES (28, 'JBOLT_LOGIN_NEST', 'false', '2019-12-18 14:11:16', 1, '2019-12-19 02:22:25', 1, '系统登录页是否开启线条特效', 'boolean');
INSERT INTO `jb_global_config` VALUES (29, 'ASSETS_VERSION', '20200515202459016', '2020-01-30 13:33:47', 8, '2020-05-15 20:24:59', 1, '系统静态资源版本号', 'string');
INSERT INTO `jb_global_config` VALUES (33, 'SYSTEM_ADMIN_H50', 'false', '2020-03-09 16:01:40', 1, '2020-05-13 04:58:00', 1, '系统后台整体样式高度使用H50', 'boolean');
INSERT INTO `jb_global_config` VALUES (34, 'SYSTEM_ADMIN_NAV_MENU_DEFAULT_ICON', '', '2020-03-09 16:01:40', 8, '2020-05-06 01:01:09', 1, '系统后台导航菜单默认图标', 'string');
INSERT INTO `jb_global_config` VALUES (35, 'SYSTEM_ADMIN_GLOBAL_SEARCH_SHOW', 'false', '2020-05-14 22:29:39', 1, '2020-05-14 22:33:05', 1, '系统后台全局搜索输入框是否启用', 'boolean');

-- ----------------------------
-- Table structure for jb_goods
-- ----------------------------
DROP TABLE IF EXISTS `jb_goods`;
CREATE TABLE `jb_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单价',
  `original_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '原价',
  `main_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主图',
  `extra_images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '附图',
  `content_type` int(11) NULL DEFAULT NULL COMMENT '商品描述类型',
  `groups` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品组ID',
  `stock_count` int(11) NULL DEFAULT NULL COMMENT '库存量',
  `sub_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二级标题',
  `is_multispec` bit(1) NULL DEFAULT b'0' COMMENT '是否是多规格',
  `limit_count` int(11) NULL DEFAULT 0 COMMENT '限购数量 0=不限制',
  `location_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在地',
  `is_provide_invoices` bit(1) NULL DEFAULT b'0' COMMENT '是否提供发票',
  `is_guarantee` bit(1) NULL DEFAULT b'0' COMMENT '是否保修',
  `on_sale` bit(1) NULL DEFAULT b'0' COMMENT '是否上架',
  `under_time` datetime(0) NULL DEFAULT NULL COMMENT '下架时间',
  `on_sale_user_id` int(11) NULL DEFAULT NULL COMMENT '上架处理人',
  `on_sale_time` datetime(0) NULL DEFAULT NULL COMMENT '上架时间',
  `create_user_id` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user_id` int(11) NULL DEFAULT NULL COMMENT '更新人',
  `goods_unit` int(11) NULL DEFAULT NULL COMMENT '商品单位',
  `real_sale_count` int(11) NULL DEFAULT 0 COMMENT '真实销量',
  `show_sale_count` int(11) NULL DEFAULT 0 COMMENT '展示营销销量',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '商品类型',
  `brand_id` int(11) NULL DEFAULT NULL COMMENT '商品品牌',
  `is_hot` bit(1) NULL DEFAULT b'0' COMMENT '热销',
  `is_recommend` bit(1) NULL DEFAULT b'0' COMMENT '推荐',
  `fcategory_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '前台分类KEY',
  `bcategory_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '后台分类KEY',
  `bcategory_id` int(11) NULL DEFAULT NULL COMMENT '后端分类ID',
  `fcategory_id` int(11) NULL DEFAULT NULL COMMENT '前端分类ID',
  `under_user_id` int(11) NULL DEFAULT NULL COMMENT '下架处理人',
  `is_delete` bit(1) NULL DEFAULT b'0' COMMENT '是否已删除',
  `goods_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 145 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jb_goods_attr
-- ----------------------------
DROP TABLE IF EXISTS `jb_goods_attr`;
CREATE TABLE `jb_goods_attr`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属性名',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属性值',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品自定义属性' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jb_goods_back_category
-- ----------------------------
DROP TABLE IF EXISTS `jb_goods_back_category`;
CREATE TABLE `jb_goods_back_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pid` int(11) NULL DEFAULT NULL,
  `type_id` int(11) NULL DEFAULT NULL COMMENT '商品类型',
  `enable` bit(1) NULL DEFAULT b'0' COMMENT '启用 禁用',
  `category_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所有上级和自身ID串联起来',
  `sort_rank` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品后台类目表 无限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jb_goods_element_content
-- ----------------------------
DROP TABLE IF EXISTS `jb_goods_element_content`;
CREATE TABLE `jb_goods_element_content`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关联商品ID',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品ID',
  `type` int(11) NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容',
  `sort_rank` int(11) NULL DEFAULT NULL COMMENT '排序',
  `sku_id` int(11) NULL DEFAULT NULL COMMENT 'SKUID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品关联的单条图片或者问题分类的content列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jb_goods_group
-- ----------------------------
DROP TABLE IF EXISTS `jb_goods_group`;
CREATE TABLE `jb_goods_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `sort_rank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '排序',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `goods_count` int(11) NULL DEFAULT NULL COMMENT '商品数量',
  `enable` bit(1) NULL DEFAULT b'0' COMMENT '是否启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品分组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jb_goods_html_content
-- ----------------------------
DROP TABLE IF EXISTS `jb_goods_html_content`;
CREATE TABLE `jb_goods_html_content`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品ID',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '详情内容',
  `sku_id` int(11) NULL DEFAULT NULL COMMENT 'SKUID',
  `update_user_id` int(11) NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品关联的html富文本详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jb_goods_type
-- ----------------------------
DROP TABLE IF EXISTS `jb_goods_type`;
CREATE TABLE `jb_goods_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `enable` bit(1) NULL DEFAULT NULL COMMENT '是否启用',
  `sort_rank` int(11) NULL DEFAULT NULL COMMENT '排序',
  `spec_count` int(11) NULL DEFAULT 0 COMMENT '规格数量',
  `attr_count` int(11) NULL DEFAULT 0 COMMENT '属性数量',
  `brand_count` int(11) NULL DEFAULT 0 COMMENT '品牌数量',
  `pinyin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拼音',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 158 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jb_goods_type_brand
-- ----------------------------
DROP TABLE IF EXISTS `jb_goods_type_brand`;
CREATE TABLE `jb_goods_type_brand`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_type_id` int(11) NULL DEFAULT NULL COMMENT '关联商品类型',
  `brand_id` int(11) NULL DEFAULT NULL COMMENT '关联商品品牌',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 129 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品类型-品牌中间表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jb_jbolt_file
-- ----------------------------
DROP TABLE IF EXISTS `jb_jbolt_file`;
CREATE TABLE `jb_jbolt_file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `local_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '保存物理地址',
  `local_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '本地可访问URL地址',
  `cdn_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外部CDN地址',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `file_type` int(11) NULL DEFAULT NULL COMMENT '文件类型 图片 附件 视频 音频',
  `file_size` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '文件大小',
  `file_suffix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '后缀名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1282 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件库' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for jb_jbolt_version
-- ----------------------------
DROP TABLE IF EXISTS `jb_jbolt_version`;
CREATE TABLE `jb_jbolt_version`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本号',
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `is_new` bit(1) NULL DEFAULT b'0' COMMENT '是否最新版',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 794 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'jbolt版本升级' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jb_jbolt_version
-- ----------------------------
INSERT INTO `jb_jbolt_version` VALUES (786, '1.0.0', '2020-05-14 18:21:36', b'0', '2020-05-14 18:21:43', 1);
INSERT INTO `jb_jbolt_version` VALUES (787, '1.0.1', '2020-05-14 18:21:36', b'1', '2020-05-14 18:21:43', 1);
INSERT INTO `jb_jbolt_version` VALUES (788, '1.0.0', '2020-05-14 18:21:36', b'0', '2020-05-14 18:21:43', 1);
INSERT INTO `jb_jbolt_version` VALUES (789, '1.0.1', '2020-05-14 18:21:36', b'1', '2020-05-14 18:21:43', 1);
INSERT INTO `jb_jbolt_version` VALUES (790, '1.0.0', '2020-05-14 18:21:36', b'0', '2020-05-14 18:21:43', 1);
INSERT INTO `jb_jbolt_version` VALUES (791, '1.0.1', '2020-05-14 18:21:36', b'1', '2020-05-14 18:21:43', 1);
INSERT INTO `jb_jbolt_version` VALUES (792, '1.0.0', '2020-05-14 18:21:36', b'0', '2020-05-14 18:21:43', 1);
INSERT INTO `jb_jbolt_version` VALUES (793, '1.0.1', '2020-05-14 18:21:36', b'1', '2020-05-14 18:21:43', 1);

-- ----------------------------
-- Table structure for jb_jbolt_version_file
-- ----------------------------
DROP TABLE IF EXISTS `jb_jbolt_version_file`;
CREATE TABLE `jb_jbolt_version_file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jbolt_version_id` int(11) NULL DEFAULT NULL COMMENT 'jbolt版本ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 216 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'JBolt下载版本管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jb_login_log
-- ----------------------------
DROP TABLE IF EXISTS `jb_login_log`;
CREATE TABLE `jb_login_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `username` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `login_ip` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `login_time` datetime(0) NOT NULL COMMENT '登录时间',
  `login_state` int(11) NOT NULL COMMENT '登录状态',
  `is_browser` bit(1) NULL DEFAULT b'0' COMMENT '是否是浏览器访问',
  `browser_version` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器版本号',
  `browser_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器',
  `os_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `login_city` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录城市',
  `login_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录位置详情',
  `login_city_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录城市代码',
  `login_province` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录省份',
  `is_mobile` bit(1) NULL DEFAULT b'0' COMMENT '是否移动端',
  `os_platform_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台名称',
  `browser_engine_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器引擎名',
  `browser_engine_version` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器引擎版本',
  `login_address_latitude` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录地横坐标',
  `login_address_longitude` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录地纵坐标',
  `is_remote_login` bit(1) NULL DEFAULT b'0' COMMENT '是否为异地异常登录',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '记录创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 137 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '登录日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jb_login_log
-- ----------------------------
INSERT INTO `jb_login_log` VALUES (138, 1, 'admin', '127.0.0.1', '2020-05-15 20:25:07', 1, b'1', '80.0.3987.149', 'Chrome', 'Windows 10 or Windows Server 2016', NULL, 'XXXX', NULL, NULL, b'0', 'Windows', 'Webkit', '537.36', NULL, NULL, b'0', '2020-05-15 20:25:07');

-- ----------------------------
-- Table structure for jb_mall
-- ----------------------------
DROP TABLE IF EXISTS `jb_mall`;
CREATE TABLE `jb_mall`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商城名称',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_user_id` int(11) NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user_id` int(11) NULL DEFAULT NULL COMMENT '更新操作人',
  `state` int(11) NOT NULL COMMENT '状态 1筹备中 2 已上线 3 关闭',
  `leader_id` int(11) NULL DEFAULT NULL COMMENT '负责人',
  `first_publish_time` datetime(0) NULL DEFAULT NULL COMMENT '首次上线发布时间',
  `last_publish_time` datetime(0) NULL DEFAULT NULL COMMENT '最近一次上线发布操作时间',
  `first_close_time` datetime(0) NULL DEFAULT NULL COMMENT '首次关闭时间',
  `last_close_time` datetime(0) NULL DEFAULT NULL COMMENT '最近一次关闭时间',
  `first_publish_user_id` int(11) NULL DEFAULT NULL COMMENT '首次发布人',
  `last_publish_user_id` int(11) NULL DEFAULT NULL COMMENT '最近一次发布人',
  `first_close_user_id` int(11) NULL DEFAULT NULL COMMENT '首次关闭商城操作人',
  `last_close_user_id` int(11) NULL DEFAULT NULL COMMENT '最近一次关闭操作人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商城表一条数据代表一个商城' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jb_order
-- ----------------------------
DROP TABLE IF EXISTS `jb_order`;
CREATE TABLE `jb_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '下单时间',
  `buyer_id` int(11) NULL DEFAULT NULL COMMENT '买家ID',
  `buyer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '冗余买家名字',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '付款时间',
  `consign_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `finish_time` datetime(0) NULL DEFAULT NULL COMMENT '交易完成时间',
  `close_time` datetime(0) NULL DEFAULT NULL COMMENT '订单关闭时间',
  `buyer_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家留言',
  `buyer_rate` bit(1) NULL DEFAULT NULL COMMENT '买家是否已经评价',
  `state` int(11) NULL DEFAULT NULL COMMENT '订单状态 待付款 已付款 已发货 订单完成 订单关闭',
  `goods_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '总额',
  `post_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费',
  `payment_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付总额',
  `payment_type` int(11) NULL DEFAULT NULL COMMENT '支付类型 在线支付 货到付款',
  `online_payment_type` int(11) NULL DEFAULT NULL COMMENT '在线支付选择了谁',
  `close_type` int(11) NULL DEFAULT NULL COMMENT '通过什么方式关闭 后台管理 or 客户自身',
  `close_uesr_id` int(11) NULL DEFAULT NULL COMMENT '关闭订单用户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商城订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jb_order_item
-- ----------------------------
DROP TABLE IF EXISTS `jb_order_item`;
CREATE TABLE `jb_order_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goods_sub_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二级促销标题',
  `price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '单价',
  `goods_count` int(11) NULL DEFAULT 0 COMMENT '商品数量',
  `goods_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '总额',
  `goods_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品图',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单编号',
  `original_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '原价',
  `save_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '单个节省价格',
  `save_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '一共节省多少钱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jb_order_shipping
-- ----------------------------
DROP TABLE IF EXISTS `jb_order_shipping`;
CREATE TABLE `jb_order_shipping`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人姓名',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人固话',
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '移动电话',
  `buyer_nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买方昵称',
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市',
  `county` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区县',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件具体地址',
  `zipcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user_id` int(11) NULL DEFAULT NULL COMMENT '更新人ID',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单编号',
  `buyer_id` int(1) NOT NULL COMMENT '买方用户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单物流信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jb_permission
-- ----------------------------
DROP TABLE IF EXISTS `jb_permission`;
CREATE TABLE `jb_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pid` int(11) NULL DEFAULT 0,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `icons` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `sort_rank` int(11) NULL DEFAULT NULL COMMENT '排序',
  `permission_level` int(11) NULL DEFAULT NULL COMMENT '层级',
  `permission_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限资源KEY',
  `is_menu` bit(1) NULL DEFAULT NULL COMMENT '是否是菜单',
  `is_target_blank` bit(1) NULL DEFAULT NULL COMMENT '是否新窗口打开',
  `is_system_admin_default` bit(1) NULL DEFAULT b'0' COMMENT '是否系统超级管理员默认拥有的权限',
  `open_type` int(11) NULL DEFAULT 1 COMMENT '打开类型 1 默认 2 iframe 3 dialog',
  `open_option` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件属性json',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 370 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'function定义' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jb_permission
-- ----------------------------
INSERT INTO `jb_permission` VALUES (143, '操作台', 0, '/admin/dashboard', 'jbicon jb-gongzuotai1', 1, 1, 'dashboard', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (172, '个人设置', 0, NULL, 'jbicon jb-gerenxinxi', 2, 1, 'userinfomgr', b'1', b'0', b'1', 2, NULL);
INSERT INTO `jb_permission` VALUES (173, '修改密码', 172, '/admin/user/pwd', NULL, 1, 2, 'userpwd', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (174, '系统管理', 0, NULL, 'jbicon jb-shezhi3', 3, 1, 'systemmgr', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (175, '角色权限管理', 174, '/admin/role', NULL, 1, 2, 'role', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (176, '内部人员管理', 174, '/admin/user', NULL, 2, 2, 'user', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (177, '权限设置', 174, '/admin/permission', NULL, 3, 2, 'permission', b'1', NULL, b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (184, '操作日志', 366, '/admin/systemlog', NULL, 4, 3, 'systemlog', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (194, '字典管理', 174, '/admin/dictionary', NULL, 5, 2, 'dictionary', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (197, '参数配置', 174, '/admin/globalconfig', NULL, 6, 2, 'globalconfig', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (198, '更新管理', 0, NULL, 'jbicon jb-shuaxin', 5, 1, 'jboltupdatemgr', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (199, '版本管理', 198, '/admin/jboltversion', NULL, 1, 2, 'jboltversion', b'1', NULL, b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (201, '更新下载资源管理', 198, '/admin/updatelibs', NULL, 2, 2, 'updatelibs', b'1', NULL, b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (202, '更新日志记录', 198, '/admin/downloadlog', NULL, 3, 2, 'downloadlog', b'1', NULL, b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (208, 'Demo教程', 0, NULL, 'jbicon jb-kechengdingzhi', 10, 1, 'demoshow', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (209, 'JBolt组件列表', 208, NULL, NULL, 1, 2, 'demo', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (210, '电商平台', 0, NULL, 'jbicon jb-shopping', 6, 1, 'mall', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (211, '商品管理', 210, '/admin/mall/goods', NULL, 1, 2, 'mall_goods', b'1', NULL, b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (212, '商品类目_后端', 210, '/admin/mall/goodsbackcategory', NULL, 2, 2, 'mall_goods_back_category', b'1', NULL, b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (213, '商品类目_前端', 210, '/admin/mall/goodsfrontcategory', NULL, 3, 2, 'mall_goods_front_category', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (214, '物流配送', 210, 'shipping', NULL, 4, 2, 'shipping', b'1', NULL, b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (215, '系统规格管理', 210, '/admin/mall/spec', NULL, 5, 2, 'mall_spec', b'1', NULL, b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (216, '商品类型', 210, '/admin/mall/goodstype', NULL, 6, 2, 'mall_goodstype', b'1', NULL, b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (217, '品牌库', 210, '/admin/mall/brand', NULL, 7, 2, 'mall_brand', b'1', NULL, b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (218, '微信模块', 0, NULL, 'jbicon jb-weixin', 8, 1, 'wechat', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (219, '公众平台管理', 218, '/admin/wechat/mpinfo', NULL, 1, 2, 'wechat_mpinfo', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (225, '基础配置', 219, NULL, NULL, 1, 3, 'wechat_config_basemgr', b'0', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (226, '菜单配置', 219, NULL, NULL, 2, 3, 'wechat_menu', b'0', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (227, '支付配置', 219, NULL, NULL, 3, 3, 'wechat_config_paymgr', b'0', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (228, '关注回复', 219, NULL, NULL, 4, 3, 'wechat_autoreply_subscribe', b'0', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (229, '关键词回复', 219, NULL, NULL, 5, 3, 'wechat_autoreply_keywords', b'0', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (230, '默认回复', 219, NULL, NULL, 6, 3, 'wechat_autoreply_default', b'0', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (231, '素材库', 219, NULL, NULL, 7, 3, 'wechat_media', b'0', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (232, '用户管理', 219, NULL, NULL, 8, 3, 'wechat_user', b'0', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (233, '其它配置', 219, NULL, NULL, 9, 3, 'wechat_config_extramgr', b'0', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (238, '二级模块', 208, NULL, NULL, 2, 2, 'level_2', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (239, '三级菜单', 238, '/demo/level3menu', NULL, 1, 3, 'level_3', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (243, 'Druid数据库监控', 365, 'admin/druid/monitor', NULL, 7, 2, 'druid_monitor', b'1', b'0', b'1', 2, NULL);
INSERT INTO `jb_permission` VALUES (250, '主从表DEMO', 269, '/demo/masterslave', NULL, 1, 3, 'demo_masterslave', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (251, '应用中心', 0, NULL, 'jbicon jb-yingyong01', 7, 1, 'app_dev_center', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (252, 'API应用管理', 251, '/admin/app', NULL, 1, 2, 'application', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (254, '微信客服网页版', 218, 'https://mpkf.weixin.qq.com/', NULL, 2, 2, 'wechat_mpkf', b'1', b'1', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (255, 'AutoSelect组件', 209, '/demo/autoselect', NULL, 1, 3, 'demo_autoselect', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (256, 'Autocomplete组件', 209, '/demo/autocomplete', NULL, 2, 3, 'demo_autocomplete', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (257, 'PhotoBtn组件', 209, '/demo/photobtn', NULL, 3, 3, 'demo_photobtn', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (258, 'ImageViewer组件', 209, '/demo/imgviewer', NULL, 4, 3, 'demo_imgviewer', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (259, 'Radio组件', 209, '/demo/radio', NULL, 5, 3, 'demo_radio', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (260, 'Checkbox组件1', 209, '/demo/checkbox', NULL, 6, 3, 'demo_checkbox', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (261, 'SwitchBtn组件', 209, '/demo/switchbtn', NULL, 7, 3, 'demo_switchbtn', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (262, 'AjaxBtn组件', 209, '/demo/ajaxbtn', NULL, 8, 3, 'demo_ajaxbtn', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (263, 'TabTrigger组件', 209, '/demo/tabtrigger', NULL, 9, 3, 'demo_trigger', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (264, 'JBoltLayer组件', 209, '/demo/jboltlayer', NULL, 10, 3, 'demo_jboltlayer', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (265, 'DialogBtn组件', 209, '/demo/dialogbtn', NULL, 11, 3, 'demo_dialogbtn', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (266, '富文本编辑器', 209, '/demo/htmleditor', NULL, 12, 3, 'demo_htmleditor', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (267, 'Laydate组件1', 209, '/demo/laydate', NULL, 13, 3, 'demo_laydate', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (268, 'Html5原生Date组件', 209, '/demo/html5date', NULL, 14, 3, 'demo_html5date', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (269, 'JBolt几种布局样式', 208, NULL, NULL, 3, 2, 'demo_layout', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (270, 'CURD_带分页', 269, '/demo/curdwithpage', NULL, 2, 3, 'demo_curd_withpage', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (271, 'CURD_不带分页', 269, '/demo/curdwithoutpage', NULL, 3, 3, 'demo_curd_withouut_page', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (272, 'webcam组件', 209, '/demo/webcam', NULL, 15, 3, 'web_cam', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (273, 'ImgUploader组件', 209, '/demo/imguploader', NULL, 16, 3, 'demo_imguploader', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (274, 'FileUploader组件', 209, '/demo/fileuploader', NULL, 17, 3, 'demo_fileuploader', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (277, '多文件上传组件', 209, '/demo/multiplefileuploader', NULL, 18, 3, 'demo_multiple_file_upload', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (279, '表单校验(内置)', 209, '/demo/formcheck', NULL, 19, 3, 'demo_formcheck', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (280, '多文件同步上传', 209, '/demo/multiplefilesyncuploader', NULL, 20, 3, 'demo_multiple_file_sunc_upload', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (282, '修改头像', 172, '/admin/user/avatar', NULL, 2, 2, 'useravatar', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (283, 'JBoltTable组件', 209, '/demo/jbolttable', NULL, 21, 3, 'demo_jbolttable', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (284, '定制菜单', 0, NULL, 'jbicon jb-caidan', 9, 1, 'level4_menu_demo', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (285, '打开Dialog', 288, 'http://jbolt.cn/lvyou.html', NULL, 1, 3, 'level4_open_dialog', b'1', b'0', b'1', 3, '{\"width\":\"980\",\"height\":\"600\",\"title\":\" dialog自定义标题\",\"btn\":\"\"}');
INSERT INTO `jb_permission` VALUES (286, 'Dialog 百分比', 288, 'http://www.jfinalxueyuan.com', NULL, 2, 3, 'level4_open_dialog_pre', b'1', b'0', b'1', 3, '{\"width\":\"80%\",\"height\":\"80%\",\"title\":\"Dialog 百分比\",\"btn\":\"\"}');
INSERT INTO `jb_permission` VALUES (287, 'Dialog 带按钮', 288, 'http://jbolt.cn', NULL, 3, 3, 'level4_open_dialog_withbtn', b'1', b'0', b'1', 3, '{\"width\":\"980\",\"height\":\"600\",\"title\":\" 显示右下角按钮\",\"btn\":\"true\"}');
INSERT INTO `jb_permission` VALUES (288, '弹出Dialog', 284, NULL, NULL, 1, 2, 'level4_dialog', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (289, '能弹出JBoltLayer', 284, NULL, NULL, 3, 2, 'level4_jboltlayer', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (290, 'JBoltLayer右侧滑出', 289, '/demo/jboltlayer/content', NULL, 1, 3, 'level4_jboltlayer_right', b'1', b'0', b'1', 4, '{\"width\":\"600\",\"height\":\"\",\"dir\":\"right\",\"resize\":\"true\",\"close\":\"true\",\"nomask\":\"false\",\"confirm\":\"\",\"top\":\"\"}');
INSERT INTO `jb_permission` VALUES (291, 'JBoltLayer 百分比', 289, '/demo/jboltlayer/content', NULL, 2, 3, 'level4_jboltlayer_pre', b'1', b'0', b'1', 4, '{\"width\":\"40%\",\"height\":\"80%\",\"dir\":\"right\",\"close\":\"true\",\"nomask\":\"false\",\"confirm\":\"\",\"top\":\"\"}');
INSERT INTO `jb_permission` VALUES (292, 'IFrame加载', 284, NULL, NULL, 2, 2, 'level4_iframe', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (293, 'IFrame加载1', 292, 'http://www.jfinalxueyuan.com', NULL, 2, 3, 'level4_iframe_1', b'1', b'0', b'1', 2, NULL);
INSERT INTO `jb_permission` VALUES (294, 'Iframe加载2', 292, 'http://jbolt.cn', NULL, 1, 3, 'level4_iframe_2', b'1', b'0', b'1', 2, NULL);
INSERT INTO `jb_permission` VALUES (295, 'Druid监控', 292, '/admin/druid/monitor', NULL, 3, 3, 'level4_druid', b'1', b'0', b'1', 2, NULL);
INSERT INTO `jb_permission` VALUES (330, 'JBoltInput组件', 209, '/demo/jboltinput', NULL, 22, 3, 'demo_jboltinput', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (364, 'JBoltTable主从', 269, 'demo/masterslave/jbolttable', NULL, 4, 3, 'demo_ms_jbolttable', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (365, '系统监控', 0, NULL, 'jbicon jb-ITjiankong', 4, 1, 'jbolt_monitor', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (366, '日志监控', 365, NULL, NULL, 1, 2, 'jbolt_log_monitor', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (367, '登录日志', 366, 'admin/loginlog', NULL, 2, 3, 'jbolt_login_log', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (368, '服务器监控', 365, 'admin/servermonitor', NULL, 3, 2, 'jbolt_server_monitor', b'1', b'0', b'1', 1, NULL);
INSERT INTO `jb_permission` VALUES (369, 'JBolt平台图标库', 208, 'assets/plugins/font/alifont/icons.html', NULL, 4, 2, 'jbolt_font', b'1', b'0', b'1', 2, NULL);

-- ----------------------------
-- Table structure for jb_remote_login_log
-- ----------------------------
DROP TABLE IF EXISTS `jb_remote_login_log`;
CREATE TABLE `jb_remote_login_log`  (
  `id` int(11) NOT NULL COMMENT '主键ID',
  `last_login_province` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最近一次登录省份',
  `last_login_city` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最近一次登录城市',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最近一次登录时间',
  `login_province` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '新登录省份',
  `login_city` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '新登录城市',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '新登录时间',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '登录用户ID',
  `username` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录用户名',
  `is_new` bit(1) NULL DEFAULT b'1' COMMENT '是否为最新一次',
  `last_login_ip` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最近一次登录IP',
  `login_ip` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '新登录IP',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '记录创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '异地登录日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jb_role
-- ----------------------------
DROP TABLE IF EXISTS `jb_role`;
CREATE TABLE `jb_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `pid` int(11) NULL DEFAULT 0 COMMENT '父级角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jb_role
-- ----------------------------
INSERT INTO `jb_role` VALUES (1, '系统总管理', 0);
INSERT INTO `jb_role` VALUES (2, '数据录入员', 0);
INSERT INTO `jb_role` VALUES (18, '客服', 0);
INSERT INTO `jb_role` VALUES (25, '二级角色', 1);
INSERT INTO `jb_role` VALUES (30, '三级角色', 25);
INSERT INTO `jb_role` VALUES (32, '四级角色', 30);

-- ----------------------------
-- Table structure for jb_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `jb_role_permission`;
CREATE TABLE `jb_role_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `permission_id` int(11) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6270 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色功能列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jb_role_permission
-- ----------------------------
INSERT INTO `jb_role_permission` VALUES (6270, 1, 143);
INSERT INTO `jb_role_permission` VALUES (6271, 1, 172);
INSERT INTO `jb_role_permission` VALUES (6272, 1, 173);
INSERT INTO `jb_role_permission` VALUES (6273, 1, 282);
INSERT INTO `jb_role_permission` VALUES (6274, 1, 174);
INSERT INTO `jb_role_permission` VALUES (6275, 1, 175);
INSERT INTO `jb_role_permission` VALUES (6276, 1, 176);
INSERT INTO `jb_role_permission` VALUES (6277, 1, 177);
INSERT INTO `jb_role_permission` VALUES (6278, 1, 194);
INSERT INTO `jb_role_permission` VALUES (6279, 1, 197);
INSERT INTO `jb_role_permission` VALUES (6280, 1, 365);
INSERT INTO `jb_role_permission` VALUES (6281, 1, 366);
INSERT INTO `jb_role_permission` VALUES (6282, 1, 367);
INSERT INTO `jb_role_permission` VALUES (6283, 1, 184);
INSERT INTO `jb_role_permission` VALUES (6284, 1, 368);
INSERT INTO `jb_role_permission` VALUES (6285, 1, 243);
INSERT INTO `jb_role_permission` VALUES (6286, 1, 198);
INSERT INTO `jb_role_permission` VALUES (6287, 1, 199);
INSERT INTO `jb_role_permission` VALUES (6288, 1, 201);
INSERT INTO `jb_role_permission` VALUES (6289, 1, 202);
INSERT INTO `jb_role_permission` VALUES (6290, 1, 210);
INSERT INTO `jb_role_permission` VALUES (6291, 1, 211);
INSERT INTO `jb_role_permission` VALUES (6292, 1, 212);
INSERT INTO `jb_role_permission` VALUES (6293, 1, 213);
INSERT INTO `jb_role_permission` VALUES (6294, 1, 214);
INSERT INTO `jb_role_permission` VALUES (6295, 1, 215);
INSERT INTO `jb_role_permission` VALUES (6296, 1, 216);
INSERT INTO `jb_role_permission` VALUES (6297, 1, 217);
INSERT INTO `jb_role_permission` VALUES (6298, 1, 251);
INSERT INTO `jb_role_permission` VALUES (6299, 1, 252);
INSERT INTO `jb_role_permission` VALUES (6300, 1, 218);
INSERT INTO `jb_role_permission` VALUES (6301, 1, 219);
INSERT INTO `jb_role_permission` VALUES (6302, 1, 225);
INSERT INTO `jb_role_permission` VALUES (6303, 1, 226);
INSERT INTO `jb_role_permission` VALUES (6304, 1, 227);
INSERT INTO `jb_role_permission` VALUES (6305, 1, 228);
INSERT INTO `jb_role_permission` VALUES (6306, 1, 229);
INSERT INTO `jb_role_permission` VALUES (6307, 1, 230);
INSERT INTO `jb_role_permission` VALUES (6308, 1, 231);
INSERT INTO `jb_role_permission` VALUES (6309, 1, 232);
INSERT INTO `jb_role_permission` VALUES (6310, 1, 233);
INSERT INTO `jb_role_permission` VALUES (6311, 1, 254);
INSERT INTO `jb_role_permission` VALUES (6312, 1, 284);
INSERT INTO `jb_role_permission` VALUES (6313, 1, 288);
INSERT INTO `jb_role_permission` VALUES (6314, 1, 285);
INSERT INTO `jb_role_permission` VALUES (6315, 1, 286);
INSERT INTO `jb_role_permission` VALUES (6316, 1, 287);
INSERT INTO `jb_role_permission` VALUES (6317, 1, 292);
INSERT INTO `jb_role_permission` VALUES (6318, 1, 294);
INSERT INTO `jb_role_permission` VALUES (6319, 1, 293);
INSERT INTO `jb_role_permission` VALUES (6320, 1, 295);
INSERT INTO `jb_role_permission` VALUES (6321, 1, 289);
INSERT INTO `jb_role_permission` VALUES (6322, 1, 290);
INSERT INTO `jb_role_permission` VALUES (6323, 1, 291);
INSERT INTO `jb_role_permission` VALUES (6324, 1, 208);
INSERT INTO `jb_role_permission` VALUES (6325, 1, 209);
INSERT INTO `jb_role_permission` VALUES (6326, 1, 255);
INSERT INTO `jb_role_permission` VALUES (6327, 1, 256);
INSERT INTO `jb_role_permission` VALUES (6328, 1, 257);
INSERT INTO `jb_role_permission` VALUES (6329, 1, 258);
INSERT INTO `jb_role_permission` VALUES (6330, 1, 259);
INSERT INTO `jb_role_permission` VALUES (6331, 1, 260);
INSERT INTO `jb_role_permission` VALUES (6332, 1, 261);
INSERT INTO `jb_role_permission` VALUES (6333, 1, 262);
INSERT INTO `jb_role_permission` VALUES (6334, 1, 263);
INSERT INTO `jb_role_permission` VALUES (6335, 1, 264);
INSERT INTO `jb_role_permission` VALUES (6336, 1, 265);
INSERT INTO `jb_role_permission` VALUES (6337, 1, 266);
INSERT INTO `jb_role_permission` VALUES (6338, 1, 267);
INSERT INTO `jb_role_permission` VALUES (6339, 1, 268);
INSERT INTO `jb_role_permission` VALUES (6340, 1, 272);
INSERT INTO `jb_role_permission` VALUES (6341, 1, 273);
INSERT INTO `jb_role_permission` VALUES (6342, 1, 274);
INSERT INTO `jb_role_permission` VALUES (6343, 1, 277);
INSERT INTO `jb_role_permission` VALUES (6344, 1, 279);
INSERT INTO `jb_role_permission` VALUES (6345, 1, 280);
INSERT INTO `jb_role_permission` VALUES (6346, 1, 283);
INSERT INTO `jb_role_permission` VALUES (6347, 1, 330);
INSERT INTO `jb_role_permission` VALUES (6348, 1, 238);
INSERT INTO `jb_role_permission` VALUES (6349, 1, 239);
INSERT INTO `jb_role_permission` VALUES (6350, 1, 269);
INSERT INTO `jb_role_permission` VALUES (6351, 1, 250);
INSERT INTO `jb_role_permission` VALUES (6352, 1, 270);
INSERT INTO `jb_role_permission` VALUES (6353, 1, 271);
INSERT INTO `jb_role_permission` VALUES (6354, 1, 364);
INSERT INTO `jb_role_permission` VALUES (6355, 1, 369);

-- ----------------------------
-- Table structure for jb_shelf
-- ----------------------------
DROP TABLE IF EXISTS `jb_shelf`;
CREATE TABLE `jb_shelf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `enable` bit(1) NULL DEFAULT b'0',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `publish_user_id` int(11) NULL DEFAULT NULL COMMENT '上线发布人',
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `share_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分享图',
  `share_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分享标题',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user_id` int(11) NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '电商货架-小程序首页风格' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jb_shelf_activity
-- ----------------------------
DROP TABLE IF EXISTS `jb_shelf_activity`;
CREATE TABLE `jb_shelf_activity`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `poster_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '海报地址',
  `open_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '打开地址',
  `open_type` int(11) NOT NULL COMMENT '打开方式 网页还是商品内页 还是分类 还是',
  `shelf_element_id` int(11) NOT NULL COMMENT '货架元素ID',
  `shelf_id` int(11) NOT NULL COMMENT '货架ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '货架元素_活动' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jb_shelf_carousel
-- ----------------------------
DROP TABLE IF EXISTS `jb_shelf_carousel`;
CREATE TABLE `jb_shelf_carousel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `imgurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `openType` int(11) NULL DEFAULT NULL COMMENT '打开模式 内置资源地址，网页地址',
  `open_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '打开地址',
  `shelf_id` int(11) NOT NULL COMMENT '货架ID',
  `shelf_element_id` int(11) NOT NULL COMMENT '货架元素ID',
  `sort_rank` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '货架元素_轮播图' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jb_shelf_element
-- ----------------------------
DROP TABLE IF EXISTS `jb_shelf_element`;
CREATE TABLE `jb_shelf_element`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型 轮播 楼层 分类 活动等',
  `width` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '宽度',
  `height` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '高度',
  `sort_rank` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '货架从上到下的元素' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jb_shelf_goods_floor
-- ----------------------------
DROP TABLE IF EXISTS `jb_shelf_goods_floor`;
CREATE TABLE `jb_shelf_goods_floor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` int(11) NOT NULL COMMENT '商品分组ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示标题 默认是商品组的 可以改',
  `open_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '打开地址',
  `goods_count` int(11) NOT NULL COMMENT '显示商品数量',
  `column_count` int(11) NOT NULL COMMENT '显示几列布局',
  `sort_rank` int(11) NULL DEFAULT NULL COMMENT '排序',
  `shelf_id` int(11) NOT NULL COMMENT '货架ID',
  `shelf_element_id` int(11) NOT NULL COMMENT '货架元素ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '货架元素_商品楼层' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jb_shelf_goods_group
-- ----------------------------
DROP TABLE IF EXISTS `jb_shelf_goods_group`;
CREATE TABLE `jb_shelf_goods_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `imgurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类下的顶部修饰图',
  `sub_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二级标题',
  `sort_rank` int(11) NULL DEFAULT NULL COMMENT '排序',
  `shelf_id` int(11) NOT NULL COMMENT '货架ID',
  `shelf_element_id` int(11) NOT NULL COMMENT '货架元素ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '货架元素_商品组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jb_sku
-- ----------------------------
DROP TABLE IF EXISTS `jb_sku`;
CREATE TABLE `jb_sku`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sku_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格编码',
  `sku_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格名称',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品ID',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '类型ID',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单价',
  `original_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '原价',
  `stock_count` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '库存量',
  `sub_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '营销语',
  `on_sale` bit(1) NULL DEFAULT b'0' COMMENT '是否上架',
  `sellout` bit(1) NULL DEFAULT b'0' COMMENT '售罄',
  `real_sale_count` int(11) NULL DEFAULT NULL COMMENT '真实销量',
  `show_sale_count` int(11) NULL DEFAULT NULL COMMENT '展示营销销量',
  `main_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主图',
  `extra_images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '附图',
  `is_hot` bit(1) NULL DEFAULT b'0' COMMENT '热销',
  `is_recommend` bit(1) NULL DEFAULT b'0' COMMENT '推荐',
  `need_content` bit(1) NULL DEFAULT b'0' COMMENT '是否需要详情描述',
  `content_type` int(11) NULL DEFAULT NULL COMMENT '描述类型 是富文本还是分开的图片 文本段数据',
  `under_time` datetime(0) NULL DEFAULT NULL COMMENT '下架时间',
  `onSale_time` datetime(0) NULL DEFAULT NULL COMMENT '上架时间',
  `create_user_id` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `update_user_id` int(11) NULL DEFAULT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'SKU' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jb_sku_item
-- ----------------------------
DROP TABLE IF EXISTS `jb_sku_item`;
CREATE TABLE `jb_sku_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sku_id` int(11) NOT NULL COMMENT 'SKU ID',
  `goods_id` int(11) NOT NULL COMMENT '商品 ID',
  `type_id` int(11) NOT NULL COMMENT '商品分类',
  `spec_id` int(11) NOT NULL COMMENT '规格 ID',
  `spec_item_id` int(11) NOT NULL COMMENT '规格项 ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'sku详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jb_spec
-- ----------------------------
DROP TABLE IF EXISTS `jb_spec`;
CREATE TABLE `jb_spec`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统规格表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jb_spec_item
-- ----------------------------
DROP TABLE IF EXISTS `jb_spec_item`;
CREATE TABLE `jb_spec_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '选项名',
  `spec_id` int(11) NULL DEFAULT NULL COMMENT '所属规格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '规格选项表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jb_system_log
-- ----------------------------
DROP TABLE IF EXISTS `jb_system_log`;
CREATE TABLE `jb_system_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `type` int(11) NULL DEFAULT NULL COMMENT '操作类型 删除 更新 新增',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '连接对象详情地址',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '操作人ID',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人姓名',
  `target_type` int(11) NULL DEFAULT NULL COMMENT '操作对象类型',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '记录创建时间',
  `target_id` int(11) NULL DEFAULT NULL COMMENT '操作对象ID',
  `open_type` int(11) NULL DEFAULT NULL COMMENT '打开类型URL还是Dialog',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14201 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jb_system_log
-- ----------------------------
INSERT INTO `jb_system_log` VALUES (14231, '<span class=\'text-danger\'>[总管理(admin)]</span>更新全局配置<span class=\'text-danger\'>[系统静态资源版本号]</span>', 2, 'admin/globalconfig/show/29', 1, '总管理', 6, '2020-05-15 20:24:59', 29, 1);

-- ----------------------------
-- Table structure for jb_update_libs
-- ----------------------------
DROP TABLE IF EXISTS `jb_update_libs`;
CREATE TABLE `jb_update_libs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `delete_all` bit(1) NULL DEFAULT b'1' COMMENT '清空文件夹',
  `is_must` bit(1) NULL DEFAULT b'0' COMMENT '强制',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '下载的libs' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jb_update_libs
-- ----------------------------
INSERT INTO `jb_update_libs` VALUES (7, 'http://file.jbolt.cn/postgresql-9.4.1212.jar', 'db/postgresql/postgresql-9.4.1212.jar', b'1', b'0');
INSERT INTO `jb_update_libs` VALUES (15, 'http://file.jbolt.cn/asweqw.jar', 'db/mysql/asdas.jar', b'1', b'1');

-- ----------------------------
-- Table structure for jb_user
-- ----------------------------
DROP TABLE IF EXISTS `jb_user`;
CREATE TABLE `jb_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '记录创建时间',
  `phone` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `enable` bit(1) NULL DEFAULT b'1' COMMENT '启用',
  `sex` int(11) NULL DEFAULT 0 COMMENT '性别',
  `pinyin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拼音码',
  `roles` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色 一对多',
  `is_system_admin` bit(1) NULL DEFAULT b'0' COMMENT '是否系统超级管理员',
  `create_user_id` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `pwd_salt` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码盐值',
  `login_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后登录IP',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `login_city` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后登录城市',
  `login_province` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后登录省份',
  `is_remote_login` bit(1) NULL DEFAULT b'0' COMMENT '是否异地登录',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户登录账户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jb_user
-- ----------------------------
INSERT INTO `jb_user` VALUES (1, 'admin', '431365df1f462a7f56e93eee2163caac8a86a90e5daa1a0626c06dc66c3c8965', '总管理', 'upload/user/avatar/20200305/80efe1c9-f448-4a03-8b63-b66316d77d61.png', '2018-06-06 10:30:02', '187667356321', b'1', 1, 'zgl,zongguanli', '1', b'1', NULL, 'GbJSmW4m5PzINnwU9X_Tm-_Yzf82a8BH', '127.0.0.1', '2020-05-15 20:25:07', NULL, NULL, b'0');

-- ----------------------------
-- Table structure for jb_user_config
-- ----------------------------
DROP TABLE IF EXISTS `jb_user_config`;
CREATE TABLE `jb_user_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置名',
  `config_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置KEY',
  `config_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置值',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `value_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '取值类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户系统样式自定义设置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jb_wechat_article
-- ----------------------------
DROP TABLE IF EXISTS `jb_wechat_article`;
CREATE TABLE `jb_wechat_article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户 ID',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user_id` int(11) NULL DEFAULT NULL COMMENT '更新用户 ID',
  `brief_info` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章摘要',
  `poster` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `view_count` int(11) NULL DEFAULT NULL COMMENT '阅读数',
  `media_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信素材 ID',
  `mp_id` int(11) NULL DEFAULT NULL COMMENT '微信 ID',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图文链接地址',
  `type` int(11) NULL DEFAULT NULL COMMENT '本地图文 公众号图文素材 外部图文',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信图文信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jb_wechat_autoreply
-- ----------------------------
DROP TABLE IF EXISTS `jb_wechat_autoreply`;
CREATE TABLE `jb_wechat_autoreply`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mp_id` int(11) NULL DEFAULT NULL COMMENT '微信 ID',
  `type` int(11) NULL DEFAULT 0 COMMENT '类型 关注回复 无内容时回复 关键词回复',
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则名称',
  `reply_type` int(11) NULL DEFAULT NULL COMMENT '回复类型 全部还是随机一条',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '记录创建时间',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户 ID',
  `enable` bit(1) NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信公众号自动回复规则' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jb_wechat_config
-- ----------------------------
DROP TABLE IF EXISTS `jb_wechat_config`;
CREATE TABLE `jb_wechat_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mp_id` int(11) NULL DEFAULT NULL COMMENT '微信 ID',
  `config_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配置key',
  `config_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配置值',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配置项名称',
  `type` int(11) NULL DEFAULT NULL COMMENT '配置类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 282 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信公众号配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jb_wechat_keywords
-- ----------------------------
DROP TABLE IF EXISTS `jb_wechat_keywords`;
CREATE TABLE `jb_wechat_keywords`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mp_id` int(11) NULL DEFAULT NULL COMMENT '微信 ID',
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT 0 COMMENT '模糊 全匹配',
  `auto_reply_id` int(11) NULL DEFAULT NULL COMMENT '回复规则ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信关键词回复中的关键词定义' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jb_wechat_media
-- ----------------------------
DROP TABLE IF EXISTS `jb_wechat_media`;
CREATE TABLE `jb_wechat_media`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `digest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型 image video voice news',
  `mp_id` int(11) NULL DEFAULT NULL COMMENT '微信 ID',
  `media_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信素材ID',
  `thumb_media_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面图ID',
  `content_source_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原文地址',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问地址',
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图文作者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `server_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '存服务器URL',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2324 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信公众平台素材库同步管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jb_wechat_menu
-- ----------------------------
DROP TABLE IF EXISTS `jb_wechat_menu`;
CREATE TABLE `jb_wechat_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mp_id` int(11) NULL DEFAULT NULL COMMENT '微信 ID',
  `type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pid` int(11) NULL DEFAULT 0,
  `sort_rank` int(11) NULL DEFAULT NULL COMMENT '排序',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `app_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信小程序APPID',
  `page_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信小程序页面地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 148 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jb_wechat_mpinfo
-- ----------------------------
DROP TABLE IF EXISTS `jb_wechat_mpinfo`;
CREATE TABLE `jb_wechat_mpinfo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台名称',
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像LOGO',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `enable` bit(1) NULL DEFAULT b'0' COMMENT '是否启用',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user_id` int(11) NULL DEFAULT NULL COMMENT '更新人ID',
  `brief_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简介',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型 订阅号、服务号、小程序、企业号',
  `is_authenticated` bit(1) NULL DEFAULT NULL COMMENT '是否已认证',
  `subject_type` int(11) NULL DEFAULT NULL COMMENT '申请认证主体的类型 个人还是企业',
  `wechat_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信号',
  `qrcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二维码',
  `link_app_id` int(11) NULL DEFAULT NULL COMMENT '关联应用ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信公众号与小程序' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jb_wechat_reply_content
-- ----------------------------
DROP TABLE IF EXISTS `jb_wechat_reply_content`;
CREATE TABLE `jb_wechat_reply_content`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '类型 图文 文字 图片 音频 视频',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `poster` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `auto_reply_id` int(11) NULL DEFAULT NULL COMMENT '回复规则ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户 ID',
  `media_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联数据',
  `mp_id` int(11) NULL DEFAULT NULL COMMENT '微信 ID',
  `sort_rank` int(11) NULL DEFAULT NULL COMMENT '排序',
  `enable` bit(1) NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '自动回复内容' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jb_wechat_user
-- ----------------------------
DROP TABLE IF EXISTS `jb_wechat_user`;
CREATE TABLE `jb_wechat_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'openId',
  `union_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'unionID',
  `sex` int(11) NULL DEFAULT 0 COMMENT '性别 1男 2女 0 未知',
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '语言',
  `subscibe` bit(1) NULL DEFAULT NULL COMMENT '是否已关注',
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家',
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市',
  `head_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `subscribe_time` datetime(0) NULL DEFAULT NULL COMMENT '关注时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `group_id` int(11) NULL DEFAULT NULL COMMENT '分组',
  `tag_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签',
  `subscribe_scene` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关注渠道',
  `qr_scene` int(11) NULL DEFAULT NULL COMMENT '二维码场景-开发者自定义',
  `qr_scene_str` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二维码扫码场景描述-开发者自定义',
  `realname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `phone_country_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号国家代码',
  `check_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机验证码',
  `is_checked` bit(1) NULL DEFAULT b'0' COMMENT '是否已验证',
  `source` int(11) NULL DEFAULT NULL COMMENT '来源 小程序还是公众平台',
  `session_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '小程序登录SessionKey',
  `enable` bit(1) NULL DEFAULT NULL COMMENT '禁用访问',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `checked_time` datetime(0) NULL DEFAULT NULL COMMENT '验证绑定手机号时间',
  `mp_id` int(11) NULL DEFAULT NULL COMMENT '所属公众平台ID',
  `weixin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信号',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `first_auth_time` datetime(0) NULL DEFAULT NULL COMMENT '首次授权时间',
  `last_auth_time` datetime(0) NULL DEFAULT NULL COMMENT '最后一次更新授权时间',
  `first_login_time` datetime(0) NULL DEFAULT NULL COMMENT '首次登录时间',
  `bind_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '绑定其他用户信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1744 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信用户信息_模板表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
