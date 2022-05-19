/*
 Navicat Premium Data Transfer

 Source Server         : Mr_Liu
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : bms

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 04/05/2022 10:29:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_barrage
-- ----------------------------
DROP TABLE IF EXISTS `tb_barrage`;
CREATE TABLE `tb_barrage`  (
  `barrage_id` int(11) NOT NULL AUTO_INCREMENT,
  `context` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `release_date` datetime NULL DEFAULT NULL,
  `pp_num` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `video_id` int(11) NOT NULL,
  PRIMARY KEY (`barrage_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `video_id`(`video_id`) USING BTREE,
  CONSTRAINT `tb_barrage_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_barrage_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `tb_video` (`video_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_barrage
-- ----------------------------

-- ----------------------------
-- Table structure for tb_collection
-- ----------------------------
DROP TABLE IF EXISTS `tb_collection`;
CREATE TABLE `tb_collection`  (
  `collection_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  PRIMARY KEY (`collection_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `video_id`(`video_id`) USING BTREE,
  CONSTRAINT `tb_collection_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_collection_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `tb_video` (`video_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_collection
-- ----------------------------

-- ----------------------------
-- Table structure for tb_commentedstar
-- ----------------------------
DROP TABLE IF EXISTS `tb_commentedstar`;
CREATE TABLE `tb_commentedstar`  (
  `commentedstar_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `star_num` int(11) NOT NULL,
  `comment_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`commentedstar_id`) USING BTREE,
  INDEX `tb_commentedstar_ibfk_1`(`user_id`) USING BTREE,
  INDEX `tb_commentedstar_ibfk_2`(`video_id`) USING BTREE,
  CONSTRAINT `tb_commentedstar_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_commentedstar_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `tb_video` (`video_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_commentedstar
-- ----------------------------

-- ----------------------------
-- Table structure for tb_focus
-- ----------------------------
DROP TABLE IF EXISTS `tb_focus`;
CREATE TABLE `tb_focus`  (
  `focus_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `focused_id` int(11) NOT NULL,
  PRIMARY KEY (`focus_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `focused_id`(`focused_id`) USING BTREE,
  CONSTRAINT `tb_focus_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_focus_ibfk_2` FOREIGN KEY (`focused_id`) REFERENCES `tb_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_focus
-- ----------------------------

-- ----------------------------
-- Table structure for tb_message
-- ----------------------------
DROP TABLE IF EXISTS `tb_message`;
CREATE TABLE `tb_message`  (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `msg_context` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `msg_send_date` datetime NULL DEFAULT NULL,
  `msg_send_user_id` int(11) NULL DEFAULT NULL,
  `msg_receive_user_id` int(11) NOT NULL,
  `msg_state_id` int(11) NOT NULL,
  `msgtype_id` int(11) NOT NULL,
  PRIMARY KEY (`msg_id`) USING BTREE,
  INDEX `msg_send_user_id`(`msg_send_user_id`) USING BTREE,
  INDEX `msg_receive_user_id`(`msg_receive_user_id`) USING BTREE,
  INDEX `msg_state_id`(`msg_state_id`) USING BTREE,
  INDEX `msgtype_id`(`msgtype_id`) USING BTREE,
  CONSTRAINT `tb_message_ibfk_1` FOREIGN KEY (`msg_send_user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_message_ibfk_2` FOREIGN KEY (`msg_receive_user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_message_ibfk_3` FOREIGN KEY (`msg_state_id`) REFERENCES `tb_state` (`state_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_message_ibfk_4` FOREIGN KEY (`msgtype_id`) REFERENCES `tb_msgtype` (`msgtype_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 86 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_message
-- ----------------------------

-- ----------------------------
-- Table structure for tb_msgtype
-- ----------------------------
DROP TABLE IF EXISTS `tb_msgtype`;
CREATE TABLE `tb_msgtype`  (
  `msgtype_id` int(11) NOT NULL AUTO_INCREMENT,
  `msgtype_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`msgtype_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_msgtype
-- ----------------------------
INSERT INTO `tb_msgtype` VALUES (1, 'PrivateMsg');
INSERT INTO `tb_msgtype` VALUES (2, 'SystemMsg');
INSERT INTO `tb_msgtype` VALUES (3, 'SuportNotice');
INSERT INTO `tb_msgtype` VALUES (4, 'EvaluateNotice');
INSERT INTO `tb_msgtype` VALUES (5, 'CollectionNotice');

-- ----------------------------
-- Table structure for tb_predict
-- ----------------------------
DROP TABLE IF EXISTS `tb_predict`;
CREATE TABLE `tb_predict`  (
  `pre_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `video_id` int(11) NULL DEFAULT NULL,
  `pre_star` float(255, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`pre_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `video_id`(`video_id`) USING BTREE,
  CONSTRAINT `tb_predict_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_predict_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `tb_video` (`video_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_predict
-- ----------------------------

-- ----------------------------
-- Table structure for tb_record
-- ----------------------------
DROP TABLE IF EXISTS `tb_record`;
CREATE TABLE `tb_record`  (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  PRIMARY KEY (`record_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `video_id`(`video_id`) USING BTREE,
  CONSTRAINT `tb_record_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_record_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `tb_video` (`video_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 95 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_record
-- ----------------------------

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES (1, 'admin');
INSERT INTO `tb_role` VALUES (2, 'public');
INSERT INTO `tb_role` VALUES (3, 'restrict');

-- ----------------------------
-- Table structure for tb_state
-- ----------------------------
DROP TABLE IF EXISTS `tb_state`;
CREATE TABLE `tb_state`  (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `state_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`state_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_state
-- ----------------------------
INSERT INTO `tb_state` VALUES (1, '认证中');
INSERT INTO `tb_state` VALUES (2, '已认证');
INSERT INTO `tb_state` VALUES (3, '认证失败');
INSERT INTO `tb_state` VALUES (4, '上架中');
INSERT INTO `tb_state` VALUES (5, '已下架');
INSERT INTO `tb_state` VALUES (6, '未读');
INSERT INTO `tb_state` VALUES (7, '已读');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_age` int(11) NULL DEFAULT NULL,
  `user_sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `register_date` datetime NULL DEFAULT NULL,
  `fan_num` int(11) NULL DEFAULT NULL,
  `icon_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`, `user_name`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  INDEX `state_id`(`state_id`) USING BTREE,
  CONSTRAINT `tb_user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `tb_role` (`role_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `tb_user_ibfk_2` FOREIGN KEY (`state_id`) REFERENCES `tb_state` (`state_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'admin', 15, '男', '1111111111@qq.com', '22222222222', '江西省鹰潭市', 'admin', 1, '2020-01-29 22:01:28', 100, '\\images\\1584794190176.jpg', 2);

-- ----------------------------
-- Table structure for tb_video
-- ----------------------------
DROP TABLE IF EXISTS `tb_video`;
CREATE TABLE `tb_video`  (
  `video_id` int(11) NOT NULL AUTO_INCREMENT,
  `video_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `video_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edit_date` datetime NULL DEFAULT NULL,
  `video_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `thumbnail_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `video_state_id` int(11) NULL DEFAULT NULL,
  `view_num` int(11) NULL DEFAULT NULL,
  `pp_num` int(11) NULL DEFAULT NULL,
  `videotype_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`video_id`) USING BTREE,
  INDEX `video_state_id`(`video_state_id`) USING BTREE,
  INDEX `videotype_id`(`videotype_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `tb_video_ibfk_1` FOREIGN KEY (`video_state_id`) REFERENCES `tb_state` (`state_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `tb_video_ibfk_2` FOREIGN KEY (`videotype_id`) REFERENCES `tb_videotype` (`videotype_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `tb_video_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11111170 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_video
-- ----------------------------

-- ----------------------------
-- Table structure for tb_videotype
-- ----------------------------
DROP TABLE IF EXISTS `tb_videotype`;
CREATE TABLE `tb_videotype`  (
  `videotype_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`videotype_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_videotype
-- ----------------------------
INSERT INTO `tb_videotype` VALUES (1, '影视');
INSERT INTO `tb_videotype` VALUES (2, '新闻');
INSERT INTO `tb_videotype` VALUES (3, '生活');
INSERT INTO `tb_videotype` VALUES (4, '美食');
INSERT INTO `tb_videotype` VALUES (5, '音乐');
INSERT INTO `tb_videotype` VALUES (7, '电视剧');
INSERT INTO `tb_videotype` VALUES (8, '舞蹈');
INSERT INTO `tb_videotype` VALUES (9, '动漫');
INSERT INTO `tb_videotype` VALUES (10, '娱乐');
INSERT INTO `tb_videotype` VALUES (11, '科技数码');
INSERT INTO `tb_videotype` VALUES (12, '体育');
INSERT INTO `tb_videotype` VALUES (13, '记录片');
INSERT INTO `tb_videotype` VALUES (14, '白嫖党');
INSERT INTO `tb_videotype` VALUES (17, '美妆');

SET FOREIGN_KEY_CHECKS = 1;
