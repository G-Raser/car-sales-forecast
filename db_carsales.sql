/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : db_carsales

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 10/03/2023 10:06:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_brands
-- ----------------------------
DROP TABLE IF EXISTS `t_brands`;
CREATE TABLE `t_brands`  (
  `ID` int(11) NOT NULL,
  `brand_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `brand_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_brands
-- ----------------------------
INSERT INTO `t_brands` VALUES (1, '比亚迪', 'BYD');
INSERT INTO `t_brands` VALUES (2, '理想', 'LX');
INSERT INTO `t_brands` VALUES (3, '特斯拉', 'T');
INSERT INTO `t_brands` VALUES (4, '蔚来', 'NIO');
INSERT INTO `t_brands` VALUES (5, '小鹏', 'XP');

-- ----------------------------
-- Table structure for t_cars
-- ----------------------------
DROP TABLE IF EXISTS `t_cars`;
CREATE TABLE `t_cars`  (
  `ID` int(11) NOT NULL,
  `car_brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `car_introduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `car_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `car_brand_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_cars
-- ----------------------------
INSERT INTO `t_cars` VALUES (1, '比亚迪', NULL, NULL, 'BYD');
INSERT INTO `t_cars` VALUES (2, '理想', NULL, NULL, 'LX');
INSERT INTO `t_cars` VALUES (3, '特斯拉', NULL, NULL, 'T');
INSERT INTO `t_cars` VALUES (4, '蔚来', NULL, NULL, 'NIO');
INSERT INTO `t_cars` VALUES (5, '小鹏', NULL, NULL, 'XP');

-- ----------------------------
-- Table structure for t_carsales
-- ----------------------------
DROP TABLE IF EXISTS `t_carsales`;
CREATE TABLE `t_carsales`  (
  `ID` int(11) NOT NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sales` int(255) NULL DEFAULT NULL,
  `sale_brand_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_carsales
-- ----------------------------
INSERT INTO `t_carsales` VALUES (1, '2021/1/3', 12680, 'BYD');
INSERT INTO `t_carsales` VALUES (2, '2021/1/10', 10940, 'BYD');
INSERT INTO `t_carsales` VALUES (3, '2021/1/17', 10350, 'BYD');
INSERT INTO `t_carsales` VALUES (4, '2021/1/24', 10920, 'BYD');
INSERT INTO `t_carsales` VALUES (5, '2021/1/31', 11810, 'BYD');
INSERT INTO `t_carsales` VALUES (6, '2021/2/7', 10220, 'BYD');
INSERT INTO `t_carsales` VALUES (7, '2021/2/14', 2810, 'BYD');
INSERT INTO `t_carsales` VALUES (8, '2021/2/21', 4350, 'BYD');
INSERT INTO `t_carsales` VALUES (9, '2021/2/28', 6930, 'BYD');
INSERT INTO `t_carsales` VALUES (10, '2021/3/7', 6360, 'BYD');
INSERT INTO `t_carsales` VALUES (11, '2021/3/14', 7040, 'BYD');
INSERT INTO `t_carsales` VALUES (12, '2021/3/21', 7140, 'BYD');
INSERT INTO `t_carsales` VALUES (13, '2021/3/28', 7970, 'BYD');
INSERT INTO `t_carsales` VALUES (14, '2021/4/4', 7160, 'BYD');
INSERT INTO `t_carsales` VALUES (15, '2021/4/11', 7390, 'BYD');
INSERT INTO `t_carsales` VALUES (16, '2021/4/18', 8290, 'BYD');
INSERT INTO `t_carsales` VALUES (17, '2021/4/25', 9770, 'BYD');
INSERT INTO `t_carsales` VALUES (18, '2021/5/2', 9530, 'BYD');
INSERT INTO `t_carsales` VALUES (19, '2021/5/9', 9460, 'BYD');
INSERT INTO `t_carsales` VALUES (20, '2021/5/16', 9390, 'BYD');
INSERT INTO `t_carsales` VALUES (21, '2021/5/23', 9170, 'BYD');
INSERT INTO `t_carsales` VALUES (22, '2021/5/30', 11500, 'BYD');
INSERT INTO `t_carsales` VALUES (23, '2021/6/6', 10310, 'BYD');
INSERT INTO `t_carsales` VALUES (24, '2021/6/13', 9780, 'BYD');
INSERT INTO `t_carsales` VALUES (25, '2021/6/20', 11750, 'BYD');
INSERT INTO `t_carsales` VALUES (26, '2021/6/27', 12140, 'BYD');
INSERT INTO `t_carsales` VALUES (27, '2021/7/4', 12730, 'BYD');
INSERT INTO `t_carsales` VALUES (28, '2021/7/11', 12020, 'BYD');
INSERT INTO `t_carsales` VALUES (29, '2021/7/18', 13010, 'BYD');
INSERT INTO `t_carsales` VALUES (30, '2021/7/25', 12210, 'BYD');
INSERT INTO `t_carsales` VALUES (31, '2021/8/1', 14370, 'BYD');
INSERT INTO `t_carsales` VALUES (32, '2021/8/8', 13460, 'BYD');
INSERT INTO `t_carsales` VALUES (33, '2021/8/15', 13420, 'BYD');
INSERT INTO `t_carsales` VALUES (34, '2021/8/22', 14350, 'BYD');
INSERT INTO `t_carsales` VALUES (35, '2021/8/29', 17430, 'BYD');
INSERT INTO `t_carsales` VALUES (36, '2021/9/5', 16300, 'BYD');
INSERT INTO `t_carsales` VALUES (37, '2021/9/12', 15910, 'BYD');
INSERT INTO `t_carsales` VALUES (38, '2021/9/19', 16260, 'BYD');
INSERT INTO `t_carsales` VALUES (39, '2021/9/26', 18900, 'BYD');
INSERT INTO `t_carsales` VALUES (40, '2021/10/3', 16860, 'BYD');
INSERT INTO `t_carsales` VALUES (41, '2021/10/10', 17210, 'BYD');
INSERT INTO `t_carsales` VALUES (42, '2021/10/17', 18170, 'BYD');
INSERT INTO `t_carsales` VALUES (43, '2021/10/24', 19620, 'BYD');
INSERT INTO `t_carsales` VALUES (44, '2021/10/31', 23820, 'BYD');
INSERT INTO `t_carsales` VALUES (45, '2021/11/7', 17190, 'BYD');
INSERT INTO `t_carsales` VALUES (46, '2021/11/14', 20750, 'BYD');
INSERT INTO `t_carsales` VALUES (47, '2021/11/21', 21640, 'BYD');
INSERT INTO `t_carsales` VALUES (48, '2021/11/28', 22850, 'BYD');
INSERT INTO `t_carsales` VALUES (49, '2021/12/5', 19750, 'BYD');
INSERT INTO `t_carsales` VALUES (50, '2021/12/12', 22240, 'BYD');
INSERT INTO `t_carsales` VALUES (51, '2021/12/19', 23490, 'BYD');
INSERT INTO `t_carsales` VALUES (52, '2021/12/26', 24530, 'BYD');
INSERT INTO `t_carsales` VALUES (53, '2022/1/2', 18830, 'BYD');
INSERT INTO `t_carsales` VALUES (54, '2022/1/9', 14570, 'BYD');
INSERT INTO `t_carsales` VALUES (55, '2022/1/16', 16530, 'BYD');
INSERT INTO `t_carsales` VALUES (56, '2022/1/23', 20690, 'BYD');
INSERT INTO `t_carsales` VALUES (57, '2022/1/30', 21870, 'BYD');
INSERT INTO `t_carsales` VALUES (58, '2022/2/6', 20286, 'BYD');
INSERT INTO `t_carsales` VALUES (59, '2022/2/13', 17620, 'BYD');
INSERT INTO `t_carsales` VALUES (60, '2022/2/20', 22430, 'BYD');
INSERT INTO `t_carsales` VALUES (61, '2022/2/27', 26490, 'BYD');
INSERT INTO `t_carsales` VALUES (62, '2022/3/6', 20310, 'BYD');
INSERT INTO `t_carsales` VALUES (63, '2022/3/13', 21480, 'BYD');
INSERT INTO `t_carsales` VALUES (64, '2022/3/20', 20680, 'BYD');
INSERT INTO `t_carsales` VALUES (65, '2022/3/27', 21940, 'BYD');
INSERT INTO `t_carsales` VALUES (66, '2022/4/3', 21940, 'BYD');
INSERT INTO `t_carsales` VALUES (67, '2022/4/10', 14180, 'BYD');
INSERT INTO `t_carsales` VALUES (68, '2022/4/17', 18540, 'BYD');
INSERT INTO `t_carsales` VALUES (69, '2022/4/24', 19430, 'BYD');
INSERT INTO `t_carsales` VALUES (70, '2022/5/1', 21680, 'BYD');
INSERT INTO `t_carsales` VALUES (71, '2022/5/8', 15860, 'BYD');
INSERT INTO `t_carsales` VALUES (72, '2022/5/15', 17690, 'BYD');
INSERT INTO `t_carsales` VALUES (73, '2022/5/22', 21680, 'BYD');
INSERT INTO `t_carsales` VALUES (74, '2022/5/29', 25680, 'BYD');
INSERT INTO `t_carsales` VALUES (75, '2022/6/5', 20840, 'BYD');
INSERT INTO `t_carsales` VALUES (76, '2022/6/12', 24470, 'BYD');
INSERT INTO `t_carsales` VALUES (77, '2022/6/19', 25450, 'BYD');
INSERT INTO `t_carsales` VALUES (78, '2022/6/26', 31400, 'BYD');
INSERT INTO `t_carsales` VALUES (79, '2022/7/3', 30720, 'BYD');
INSERT INTO `t_carsales` VALUES (80, '2022/7/10', 22790, 'BYD');
INSERT INTO `t_carsales` VALUES (81, '2022/7/17', 26530, 'BYD');
INSERT INTO `t_carsales` VALUES (82, '2022/7/24', 28760, 'BYD');
INSERT INTO `t_carsales` VALUES (83, '2022/7/31', 34600, 'BYD');
INSERT INTO `t_carsales` VALUES (84, '2022/8/7', 22610, 'BYD');
INSERT INTO `t_carsales` VALUES (85, '2022/8/14', 24360, 'BYD');
INSERT INTO `t_carsales` VALUES (86, '2022/8/21', 27410, 'BYD');
INSERT INTO `t_carsales` VALUES (87, '2022/8/28', 30400, 'BYD');
INSERT INTO `t_carsales` VALUES (88, '2022/9/4', 23690, 'BYD');
INSERT INTO `t_carsales` VALUES (89, '2022/9/11', 22790, 'BYD');
INSERT INTO `t_carsales` VALUES (90, '2022/9/18', 28410, 'BYD');
INSERT INTO `t_carsales` VALUES (91, '2022/9/25', 27770, 'BYD');
INSERT INTO `t_carsales` VALUES (92, '2022/10/2', 23390, 'BYD');
INSERT INTO `t_carsales` VALUES (93, '2022/10/9', 16360, 'BYD');
INSERT INTO `t_carsales` VALUES (94, '2022/10/16', 24150, 'BYD');
INSERT INTO `t_carsales` VALUES (95, '2022/10/23', 22240, 'BYD');
INSERT INTO `t_carsales` VALUES (96, '2022/10/30', 24690, 'BYD');
INSERT INTO `t_carsales` VALUES (97, '2022/11/6', 18950, 'BYD');
INSERT INTO `t_carsales` VALUES (98, '2022/11/13', 23860, 'BYD');
INSERT INTO `t_carsales` VALUES (99, '2022/11/20', 25060, 'BYD');
INSERT INTO `t_carsales` VALUES (100, '2022/11/27', 18640, 'BYD');
INSERT INTO `t_carsales` VALUES (101, '2022/12/4', 19930, 'BYD');
INSERT INTO `t_carsales` VALUES (102, '2022/12/11', 25130, 'BYD');
INSERT INTO `t_carsales` VALUES (103, '2022/12/18', 25100, 'BYD');
INSERT INTO `t_carsales` VALUES (104, '2022/12/25', 22920, 'BYD');
INSERT INTO `t_carsales` VALUES (105, '2023/1/1', 24280, 'BYD');
INSERT INTO `t_carsales` VALUES (106, '2023/1/8', 19320, 'BYD');
INSERT INTO `t_carsales` VALUES (107, '2023/1/15', 20520, 'BYD');
INSERT INTO `t_carsales` VALUES (108, '2023/1/22', 8500, 'BYD');
INSERT INTO `t_carsales` VALUES (109, '2021/1/3', 400, 'LX');
INSERT INTO `t_carsales` VALUES (110, '2021/1/10', 740, 'LX');
INSERT INTO `t_carsales` VALUES (111, '2021/1/17', 540, 'LX');
INSERT INTO `t_carsales` VALUES (112, '2021/1/24', 610, 'LX');
INSERT INTO `t_carsales` VALUES (113, '2021/1/31', 580, 'LX');
INSERT INTO `t_carsales` VALUES (114, '2021/2/7', 450, 'LX');
INSERT INTO `t_carsales` VALUES (115, '2021/2/14', 240, 'LX');
INSERT INTO `t_carsales` VALUES (116, '2021/2/21', 260, 'LX');
INSERT INTO `t_carsales` VALUES (117, '2021/2/28', 550, 'LX');
INSERT INTO `t_carsales` VALUES (118, '2021/3/7', 440, 'LX');
INSERT INTO `t_carsales` VALUES (119, '2021/3/14', 550, 'LX');
INSERT INTO `t_carsales` VALUES (120, '2021/3/21', 590, 'LX');
INSERT INTO `t_carsales` VALUES (121, '2021/3/28', 690, 'LX');
INSERT INTO `t_carsales` VALUES (122, '2021/4/4', 750, 'LX');
INSERT INTO `t_carsales` VALUES (123, '2021/4/11', 610, 'LX');
INSERT INTO `t_carsales` VALUES (124, '2021/4/18', 660, 'LX');
INSERT INTO `t_carsales` VALUES (125, '2021/4/25', 860, 'LX');
INSERT INTO `t_carsales` VALUES (126, '2021/5/2', 800, 'LX');
INSERT INTO `t_carsales` VALUES (127, '2021/5/9', 610, 'LX');
INSERT INTO `t_carsales` VALUES (128, '2021/5/16', 540, 'LX');
INSERT INTO `t_carsales` VALUES (129, '2021/5/23', 480, 'LX');
INSERT INTO `t_carsales` VALUES (130, '2021/5/30', 440, 'LX');
INSERT INTO `t_carsales` VALUES (131, '2021/6/6', 540, 'LX');
INSERT INTO `t_carsales` VALUES (132, '2021/6/13', 840, 'LX');
INSERT INTO `t_carsales` VALUES (133, '2021/6/20', 1020, 'LX');
INSERT INTO `t_carsales` VALUES (134, '2021/6/27', 1140, 'LX');
INSERT INTO `t_carsales` VALUES (135, '2021/7/4', 690, 'LX');
INSERT INTO `t_carsales` VALUES (136, '2021/7/11', 970, 'LX');
INSERT INTO `t_carsales` VALUES (137, '2021/7/18', 1340, 'LX');
INSERT INTO `t_carsales` VALUES (138, '2021/7/25', 1160, 'LX');
INSERT INTO `t_carsales` VALUES (139, '2021/8/1', 910, 'LX');
INSERT INTO `t_carsales` VALUES (140, '2021/8/8', 890, 'LX');
INSERT INTO `t_carsales` VALUES (141, '2021/8/15', 1340, 'LX');
INSERT INTO `t_carsales` VALUES (142, '2021/8/22', 1250, 'LX');
INSERT INTO `t_carsales` VALUES (143, '2021/8/29', 1550, 'LX');
INSERT INTO `t_carsales` VALUES (144, '2021/9/5', 980, 'LX');
INSERT INTO `t_carsales` VALUES (145, '2021/9/12', 1240, 'LX');
INSERT INTO `t_carsales` VALUES (146, '2021/9/19', 1600, 'LX');
INSERT INTO `t_carsales` VALUES (147, '2021/9/26', 630, 'LX');
INSERT INTO `t_carsales` VALUES (148, '2021/10/3', 380, 'LX');
INSERT INTO `t_carsales` VALUES (149, '2021/10/10', 550, 'LX');
INSERT INTO `t_carsales` VALUES (150, '2021/10/17', 790, 'LX');
INSERT INTO `t_carsales` VALUES (151, '2021/10/24', 1600, 'LX');
INSERT INTO `t_carsales` VALUES (152, '2021/10/31', 1400, 'LX');
INSERT INTO `t_carsales` VALUES (153, '2021/11/7', 1100, 'LX');
INSERT INTO `t_carsales` VALUES (154, '2021/11/14', 1690, 'LX');
INSERT INTO `t_carsales` VALUES (155, '2021/11/21', 1480, 'LX');
INSERT INTO `t_carsales` VALUES (156, '2021/11/28', 1570, 'LX');
INSERT INTO `t_carsales` VALUES (157, '2021/12/5', 1410, 'LX');
INSERT INTO `t_carsales` VALUES (158, '2021/12/12', 1480, 'LX');
INSERT INTO `t_carsales` VALUES (159, '2021/12/19', 1330, 'LX');
INSERT INTO `t_carsales` VALUES (160, '2021/12/26', 1580, 'LX');
INSERT INTO `t_carsales` VALUES (161, '2022/1/2', 1050, 'LX');
INSERT INTO `t_carsales` VALUES (162, '2022/1/9', 570, 'LX');
INSERT INTO `t_carsales` VALUES (163, '2022/1/16', 1200, 'LX');
INSERT INTO `t_carsales` VALUES (164, '2022/1/23', 1050, 'LX');
INSERT INTO `t_carsales` VALUES (165, '2022/1/30', 1000, 'LX');
INSERT INTO `t_carsales` VALUES (166, '2022/2/6', 1000, 'LX');
INSERT INTO `t_carsales` VALUES (167, '2022/2/13', 570, 'LX');
INSERT INTO `t_carsales` VALUES (168, '2022/2/20', 1560, 'LX');
INSERT INTO `t_carsales` VALUES (169, '2022/2/27', 1370, 'LX');
INSERT INTO `t_carsales` VALUES (170, '2022/3/6', 390, 'LX');
INSERT INTO `t_carsales` VALUES (171, '2022/3/13', 1200, 'LX');
INSERT INTO `t_carsales` VALUES (172, '2022/3/20', 1140, 'LX');
INSERT INTO `t_carsales` VALUES (173, '2022/3/27', 900, 'LX');
INSERT INTO `t_carsales` VALUES (174, '2022/4/3', 890, 'LX');
INSERT INTO `t_carsales` VALUES (175, '2022/4/10', 350, 'LX');
INSERT INTO `t_carsales` VALUES (176, '2022/4/17', 210, 'LX');
INSERT INTO `t_carsales` VALUES (177, '2022/4/24', 200, 'LX');
INSERT INTO `t_carsales` VALUES (178, '2022/5/1', 1000, 'LX');
INSERT INTO `t_carsales` VALUES (179, '2022/5/8', 960, 'LX');
INSERT INTO `t_carsales` VALUES (180, '2022/5/15', 1500, 'LX');
INSERT INTO `t_carsales` VALUES (181, '2022/5/22', 1000, 'LX');
INSERT INTO `t_carsales` VALUES (182, '2022/5/29', 1790, 'LX');
INSERT INTO `t_carsales` VALUES (183, '2022/6/5', 1320, 'LX');
INSERT INTO `t_carsales` VALUES (184, '2022/6/12', 1640, 'LX');
INSERT INTO `t_carsales` VALUES (185, '2022/6/19', 1800, 'LX');
INSERT INTO `t_carsales` VALUES (186, '2022/6/26', 1820, 'LX');
INSERT INTO `t_carsales` VALUES (187, '2022/7/3', 1860, 'LX');
INSERT INTO `t_carsales` VALUES (188, '2022/7/10', 1240, 'LX');
INSERT INTO `t_carsales` VALUES (189, '2022/7/17', 1420, 'LX');
INSERT INTO `t_carsales` VALUES (190, '2022/7/24', 1770, 'LX');
INSERT INTO `t_carsales` VALUES (191, '2022/7/31', 2210, 'LX');
INSERT INTO `t_carsales` VALUES (192, '2022/8/7', 720, 'LX');
INSERT INTO `t_carsales` VALUES (193, '2022/8/14', 910, 'LX');
INSERT INTO `t_carsales` VALUES (194, '2022/8/21', 940, 'LX');
INSERT INTO `t_carsales` VALUES (195, '2022/8/28', 1130, 'LX');
INSERT INTO `t_carsales` VALUES (196, '2022/9/4', 1180, 'LX');
INSERT INTO `t_carsales` VALUES (197, '2022/9/11', 990, 'LX');
INSERT INTO `t_carsales` VALUES (198, '2022/9/18', 1420, 'LX');
INSERT INTO `t_carsales` VALUES (199, '2022/9/25', 1310, 'LX');
INSERT INTO `t_carsales` VALUES (200, '2022/10/2', 1670, 'LX');
INSERT INTO `t_carsales` VALUES (201, '2022/10/9', 230, 'LX');
INSERT INTO `t_carsales` VALUES (202, '2022/10/16', 800, 'LX');
INSERT INTO `t_carsales` VALUES (203, '2022/10/23', 1040, 'LX');
INSERT INTO `t_carsales` VALUES (204, '2022/10/30', 2730, 'LX');
INSERT INTO `t_carsales` VALUES (205, '2022/11/6', 810, 'LX');
INSERT INTO `t_carsales` VALUES (206, '2022/11/13', 1810, 'LX');
INSERT INTO `t_carsales` VALUES (207, '2022/11/20', 1680, 'LX');
INSERT INTO `t_carsales` VALUES (208, '2022/11/27', 2410, 'LX');
INSERT INTO `t_carsales` VALUES (209, '2022/12/4', 2520, 'LX');
INSERT INTO `t_carsales` VALUES (210, '2022/12/11', 1760, 'LX');
INSERT INTO `t_carsales` VALUES (211, '2022/12/18', 2650, 'LX');
INSERT INTO `t_carsales` VALUES (212, '2022/12/25', 3410, 'LX');
INSERT INTO `t_carsales` VALUES (213, '2023/1/1', 5000, 'LX');
INSERT INTO `t_carsales` VALUES (214, '2023/1/8', 2450, 'LX');
INSERT INTO `t_carsales` VALUES (215, '2023/1/15', 3160, 'LX');
INSERT INTO `t_carsales` VALUES (216, '2023/1/22', 3010, 'LX');
INSERT INTO `t_carsales` VALUES (325, '2021/1/3', 910, 'NIO');
INSERT INTO `t_carsales` VALUES (326, '2021/1/10', 770, 'NIO');
INSERT INTO `t_carsales` VALUES (327, '2021/1/17', 1150, 'NIO');
INSERT INTO `t_carsales` VALUES (328, '2021/1/24', 1180, 'NIO');
INSERT INTO `t_carsales` VALUES (329, '2021/1/31', 1220, 'NIO');
INSERT INTO `t_carsales` VALUES (330, '2021/2/7', 1040, 'NIO');
INSERT INTO `t_carsales` VALUES (331, '2021/2/14', 630, 'NIO');
INSERT INTO `t_carsales` VALUES (332, '2021/2/21', 550, 'NIO');
INSERT INTO `t_carsales` VALUES (333, '2021/2/28', 1290, 'NIO');
INSERT INTO `t_carsales` VALUES (334, '2021/3/7', 650, 'NIO');
INSERT INTO `t_carsales` VALUES (335, '2021/3/14', 820, 'NIO');
INSERT INTO `t_carsales` VALUES (336, '2021/3/21', 830, 'NIO');
INSERT INTO `t_carsales` VALUES (337, '2021/3/28', 1040, 'NIO');
INSERT INTO `t_carsales` VALUES (338, '2021/4/4', 870, 'NIO');
INSERT INTO `t_carsales` VALUES (339, '2021/4/11', 360, 'NIO');
INSERT INTO `t_carsales` VALUES (340, '2021/4/18', 960, 'NIO');
INSERT INTO `t_carsales` VALUES (341, '2021/4/25', 1220, 'NIO');
INSERT INTO `t_carsales` VALUES (342, '2021/5/2', 1060, 'NIO');
INSERT INTO `t_carsales` VALUES (343, '2021/5/9', 370, 'NIO');
INSERT INTO `t_carsales` VALUES (344, '2021/5/16', 740, 'NIO');
INSERT INTO `t_carsales` VALUES (345, '2021/5/23', 1090, 'NIO');
INSERT INTO `t_carsales` VALUES (346, '2021/5/30', 1340, 'NIO');
INSERT INTO `t_carsales` VALUES (347, '2021/6/6', 590, 'NIO');
INSERT INTO `t_carsales` VALUES (348, '2021/6/13', 830, 'NIO');
INSERT INTO `t_carsales` VALUES (349, '2021/6/20', 900, 'NIO');
INSERT INTO `t_carsales` VALUES (350, '2021/6/27', 1490, 'NIO');
INSERT INTO `t_carsales` VALUES (351, '2021/7/4', 1020, 'NIO');
INSERT INTO `t_carsales` VALUES (352, '2021/7/11', 620, 'NIO');
INSERT INTO `t_carsales` VALUES (353, '2021/7/18', 810, 'NIO');
INSERT INTO `t_carsales` VALUES (354, '2021/7/25', 930, 'NIO');
INSERT INTO `t_carsales` VALUES (355, '2021/8/1', 1160, 'NIO');
INSERT INTO `t_carsales` VALUES (356, '2021/8/8', 360, 'NIO');
INSERT INTO `t_carsales` VALUES (357, '2021/8/15', 440, 'NIO');
INSERT INTO `t_carsales` VALUES (358, '2021/8/22', 480, 'NIO');
INSERT INTO `t_carsales` VALUES (359, '2021/8/29', 790, 'NIO');
INSERT INTO `t_carsales` VALUES (360, '2021/9/5', 580, 'NIO');
INSERT INTO `t_carsales` VALUES (361, '2021/9/12', 790, 'NIO');
INSERT INTO `t_carsales` VALUES (362, '2021/9/19', 880, 'NIO');
INSERT INTO `t_carsales` VALUES (363, '2021/9/26', 920, 'NIO');
INSERT INTO `t_carsales` VALUES (364, '2021/10/3', 730, 'NIO');
INSERT INTO `t_carsales` VALUES (365, '2021/10/10', 140, 'NIO');
INSERT INTO `t_carsales` VALUES (366, '2021/10/17', 170, 'NIO');
INSERT INTO `t_carsales` VALUES (367, '2021/10/24', 440, 'NIO');
INSERT INTO `t_carsales` VALUES (368, '2021/10/31', 1020, 'NIO');
INSERT INTO `t_carsales` VALUES (369, '2021/11/7', 960, 'NIO');
INSERT INTO `t_carsales` VALUES (370, '2021/11/14', 960, 'NIO');
INSERT INTO `t_carsales` VALUES (371, '2021/11/21', 1050, 'NIO');
INSERT INTO `t_carsales` VALUES (372, '2021/11/28', 1230, 'NIO');
INSERT INTO `t_carsales` VALUES (373, '2021/12/5', 920, 'NIO');
INSERT INTO `t_carsales` VALUES (374, '2021/12/12', 980, 'NIO');
INSERT INTO `t_carsales` VALUES (375, '2021/12/19', 980, 'NIO');
INSERT INTO `t_carsales` VALUES (376, '2021/12/26', 1250, 'NIO');
INSERT INTO `t_carsales` VALUES (377, '2022/1/2', 1170, 'NIO');
INSERT INTO `t_carsales` VALUES (378, '2022/1/9', 680, 'NIO');
INSERT INTO `t_carsales` VALUES (379, '2022/1/16', 1130, 'NIO');
INSERT INTO `t_carsales` VALUES (380, '2022/1/23', 1020, 'NIO');
INSERT INTO `t_carsales` VALUES (381, '2022/1/30', 1370, 'NIO');
INSERT INTO `t_carsales` VALUES (382, '2022/2/6', 983, 'NIO');
INSERT INTO `t_carsales` VALUES (383, '2022/2/13', 440, 'NIO');
INSERT INTO `t_carsales` VALUES (384, '2022/2/20', 1090, 'NIO');
INSERT INTO `t_carsales` VALUES (385, '2022/2/27', 1190, 'NIO');
INSERT INTO `t_carsales` VALUES (386, '2022/3/6', 670, 'NIO');
INSERT INTO `t_carsales` VALUES (387, '2022/3/13', 870, 'NIO');
INSERT INTO `t_carsales` VALUES (388, '2022/3/20', 860, 'NIO');
INSERT INTO `t_carsales` VALUES (389, '2022/3/27', 1310, 'NIO');
INSERT INTO `t_carsales` VALUES (390, '2022/4/3', 920, 'NIO');
INSERT INTO `t_carsales` VALUES (391, '2022/4/10', 340, 'NIO');
INSERT INTO `t_carsales` VALUES (392, '2022/4/17', 490, 'NIO');
INSERT INTO `t_carsales` VALUES (393, '2022/4/24', 720, 'NIO');
INSERT INTO `t_carsales` VALUES (394, '2022/5/1', 650, 'NIO');
INSERT INTO `t_carsales` VALUES (395, '2022/5/8', 430, 'NIO');
INSERT INTO `t_carsales` VALUES (396, '2022/5/15', 570, 'NIO');
INSERT INTO `t_carsales` VALUES (397, '2022/5/22', 650, 'NIO');
INSERT INTO `t_carsales` VALUES (398, '2022/5/29', 1000, 'NIO');
INSERT INTO `t_carsales` VALUES (399, '2022/6/5', 1120, 'NIO');
INSERT INTO `t_carsales` VALUES (400, '2022/6/12', 1110, 'NIO');
INSERT INTO `t_carsales` VALUES (401, '2022/6/19', 1220, 'NIO');
INSERT INTO `t_carsales` VALUES (402, '2022/6/26', 1990, 'NIO');
INSERT INTO `t_carsales` VALUES (403, '2022/7/3', 1860, 'NIO');
INSERT INTO `t_carsales` VALUES (404, '2022/7/10', 1170, 'NIO');
INSERT INTO `t_carsales` VALUES (405, '2022/7/17', 1230, 'NIO');
INSERT INTO `t_carsales` VALUES (406, '2022/7/24', 1180, 'NIO');
INSERT INTO `t_carsales` VALUES (407, '2022/7/31', 2060, 'NIO');
INSERT INTO `t_carsales` VALUES (408, '2022/8/7', 800, 'NIO');
INSERT INTO `t_carsales` VALUES (409, '2022/8/14', 1050, 'NIO');
INSERT INTO `t_carsales` VALUES (410, '2022/8/21', 1210, 'NIO');
INSERT INTO `t_carsales` VALUES (411, '2022/8/28', 1600, 'NIO');
INSERT INTO `t_carsales` VALUES (412, '2022/9/4', 1410, 'NIO');
INSERT INTO `t_carsales` VALUES (413, '2022/9/11', 920, 'NIO');
INSERT INTO `t_carsales` VALUES (414, '2022/9/18', 1240, 'NIO');
INSERT INTO `t_carsales` VALUES (415, '2022/9/25', 1520, 'NIO');
INSERT INTO `t_carsales` VALUES (416, '2022/10/2', 2000, 'NIO');
INSERT INTO `t_carsales` VALUES (417, '2022/10/9', 640, 'NIO');
INSERT INTO `t_carsales` VALUES (418, '2022/10/16', 1330, 'NIO');
INSERT INTO `t_carsales` VALUES (419, '2022/10/23', 1270, 'NIO');
INSERT INTO `t_carsales` VALUES (420, '2022/10/30', 1720, 'NIO');
INSERT INTO `t_carsales` VALUES (421, '2022/11/6', 1700, 'NIO');
INSERT INTO `t_carsales` VALUES (422, '2022/11/13', 2880, 'NIO');
INSERT INTO `t_carsales` VALUES (423, '2022/11/20', 2190, 'NIO');
INSERT INTO `t_carsales` VALUES (424, '2022/11/27', 2070, 'NIO');
INSERT INTO `t_carsales` VALUES (425, '2022/12/4', 1360, 'NIO');
INSERT INTO `t_carsales` VALUES (426, '2022/12/11', 1680, 'NIO');
INSERT INTO `t_carsales` VALUES (427, '2022/12/18', 2070, 'NIO');
INSERT INTO `t_carsales` VALUES (428, '2022/12/25', 1580, 'NIO');
INSERT INTO `t_carsales` VALUES (429, '2023/1/1', 2660, 'NIO');
INSERT INTO `t_carsales` VALUES (430, '2023/1/8', 1080, 'NIO');
INSERT INTO `t_carsales` VALUES (431, '2023/1/15', 1490, 'NIO');
INSERT INTO `t_carsales` VALUES (432, '2023/1/22', 950, 'NIO');
INSERT INTO `t_carsales` VALUES (217, '2021/1/3', 2190, 'T');
INSERT INTO `t_carsales` VALUES (218, '2021/1/10', 3270, 'T');
INSERT INTO `t_carsales` VALUES (219, '2021/1/17', 4560, 'T');
INSERT INTO `t_carsales` VALUES (220, '2021/1/24', 3130, 'T');
INSERT INTO `t_carsales` VALUES (221, '2021/1/31', 2430, 'T');
INSERT INTO `t_carsales` VALUES (222, '2021/2/7', 2420, 'T');
INSERT INTO `t_carsales` VALUES (223, '2021/2/14', 2350, 'T');
INSERT INTO `t_carsales` VALUES (224, '2021/2/21', 4200, 'T');
INSERT INTO `t_carsales` VALUES (225, '2021/2/28', 4830, 'T');
INSERT INTO `t_carsales` VALUES (226, '2021/3/7', 5680, 'T');
INSERT INTO `t_carsales` VALUES (227, '2021/3/14', 6500, 'T');
INSERT INTO `t_carsales` VALUES (228, '2021/3/21', 5260, 'T');
INSERT INTO `t_carsales` VALUES (229, '2021/3/28', 4120, 'T');
INSERT INTO `t_carsales` VALUES (230, '2021/4/4', 4060, 'T');
INSERT INTO `t_carsales` VALUES (231, '2021/4/11', 3370, 'T');
INSERT INTO `t_carsales` VALUES (232, '2021/4/18', 3240, 'T');
INSERT INTO `t_carsales` VALUES (233, '2021/4/25', 1900, 'T');
INSERT INTO `t_carsales` VALUES (234, '2021/5/2', 1700, 'T');
INSERT INTO `t_carsales` VALUES (235, '2021/5/9', 3280, 'T');
INSERT INTO `t_carsales` VALUES (236, '2021/5/16', 3260, 'T');
INSERT INTO `t_carsales` VALUES (237, '2021/5/23', 4980, 'T');
INSERT INTO `t_carsales` VALUES (238, '2021/5/30', 5090, 'T');
INSERT INTO `t_carsales` VALUES (239, '2021/6/6', 4320, 'T');
INSERT INTO `t_carsales` VALUES (240, '2021/6/13', 2610, 'T');
INSERT INTO `t_carsales` VALUES (241, '2021/6/20', 3370, 'T');
INSERT INTO `t_carsales` VALUES (242, '2021/6/27', 3940, 'T');
INSERT INTO `t_carsales` VALUES (243, '2021/7/4', 2750, 'T');
INSERT INTO `t_carsales` VALUES (244, '2021/7/11', 810, 'T');
INSERT INTO `t_carsales` VALUES (245, '2021/7/18', 1540, 'T');
INSERT INTO `t_carsales` VALUES (246, '2021/7/25', 1130, 'T');
INSERT INTO `t_carsales` VALUES (247, '2021/8/1', 840, 'T');
INSERT INTO `t_carsales` VALUES (248, '2021/8/8', 540, 'T');
INSERT INTO `t_carsales` VALUES (249, '2021/8/15', 520, 'T');
INSERT INTO `t_carsales` VALUES (250, '2021/8/22', 2600, 'T');
INSERT INTO `t_carsales` VALUES (251, '2021/8/29', 4260, 'T');
INSERT INTO `t_carsales` VALUES (252, '2021/9/5', 5470, 'T');
INSERT INTO `t_carsales` VALUES (253, '2021/9/12', 6170, 'T');
INSERT INTO `t_carsales` VALUES (254, '2021/9/19', 5050, 'T');
INSERT INTO `t_carsales` VALUES (255, '2021/9/26', 8030, 'T');
INSERT INTO `t_carsales` VALUES (256, '2021/10/3', 6050, 'T');
INSERT INTO `t_carsales` VALUES (257, '2021/10/10', 1380, 'T');
INSERT INTO `t_carsales` VALUES (258, '2021/10/17', 980, 'T');
INSERT INTO `t_carsales` VALUES (259, '2021/10/24', 3350, 'T');
INSERT INTO `t_carsales` VALUES (260, '2021/10/31', 3150, 'T');
INSERT INTO `t_carsales` VALUES (261, '2021/11/7', 3470, 'T');
INSERT INTO `t_carsales` VALUES (262, '2021/11/14', 1380, 'T');
INSERT INTO `t_carsales` VALUES (263, '2021/11/21', 3600, 'T');
INSERT INTO `t_carsales` VALUES (264, '2021/11/28', 6750, 'T');
INSERT INTO `t_carsales` VALUES (265, '2021/12/5', 4840, 'T');
INSERT INTO `t_carsales` VALUES (266, '2021/12/12', 5680, 'T');
INSERT INTO `t_carsales` VALUES (267, '2021/12/19', 5830, 'T');
INSERT INTO `t_carsales` VALUES (268, '2021/12/26', 7860, 'T');
INSERT INTO `t_carsales` VALUES (269, '2022/1/2', 6330, 'T');
INSERT INTO `t_carsales` VALUES (270, '2022/1/9', 1440, 'T');
INSERT INTO `t_carsales` VALUES (271, '2022/1/16', 2880, 'T');
INSERT INTO `t_carsales` VALUES (272, '2022/1/23', 1580, 'T');
INSERT INTO `t_carsales` VALUES (273, '2022/1/30', 1730, 'T');
INSERT INTO `t_carsales` VALUES (274, '2022/2/6', 4269, 'T');
INSERT INTO `t_carsales` VALUES (275, '2022/2/13', 1180, 'T');
INSERT INTO `t_carsales` VALUES (276, '2022/2/20', 2680, 'T');
INSERT INTO `t_carsales` VALUES (277, '2022/2/27', 6110, 'T');
INSERT INTO `t_carsales` VALUES (278, '2022/3/6', 4990, 'T');
INSERT INTO `t_carsales` VALUES (279, '2022/3/13', 6990, 'T');
INSERT INTO `t_carsales` VALUES (280, '2022/3/20', 7080, 'T');
INSERT INTO `t_carsales` VALUES (281, '2022/3/27', 8240, 'T');
INSERT INTO `t_carsales` VALUES (282, '2022/4/3', 3560, 'T');
INSERT INTO `t_carsales` VALUES (283, '2022/4/10', 70, 'T');
INSERT INTO `t_carsales` VALUES (284, '2022/4/17', 60, 'T');
INSERT INTO `t_carsales` VALUES (285, '2022/4/24', 50, 'T');
INSERT INTO `t_carsales` VALUES (286, '2022/5/1', 730, 'T');
INSERT INTO `t_carsales` VALUES (287, '2022/5/8', 1680, 'T');
INSERT INTO `t_carsales` VALUES (288, '2022/5/15', 760, 'T');
INSERT INTO `t_carsales` VALUES (289, '2022/5/22', 730, 'T');
INSERT INTO `t_carsales` VALUES (290, '2022/5/29', 1320, 'T');
INSERT INTO `t_carsales` VALUES (291, '2022/6/5', 8680, 'T');
INSERT INTO `t_carsales` VALUES (292, '2022/6/12', 12730, 'T');
INSERT INTO `t_carsales` VALUES (293, '2022/6/19', 14050, 'T');
INSERT INTO `t_carsales` VALUES (294, '2022/6/26', 15180, 'T');
INSERT INTO `t_carsales` VALUES (295, '2022/7/3', 7420, 'T');
INSERT INTO `t_carsales` VALUES (296, '2022/7/10', 650, 'T');
INSERT INTO `t_carsales` VALUES (297, '2022/7/17', 470, 'T');
INSERT INTO `t_carsales` VALUES (298, '2022/7/24', 4580, 'T');
INSERT INTO `t_carsales` VALUES (299, '2022/7/31', 3360, 'T');
INSERT INTO `t_carsales` VALUES (300, '2022/8/7', 4950, 'T');
INSERT INTO `t_carsales` VALUES (301, '2022/8/14', 4790, 'T');
INSERT INTO `t_carsales` VALUES (302, '2022/8/21', 3400, 'T');
INSERT INTO `t_carsales` VALUES (303, '2022/8/28', 10690, 'T');
INSERT INTO `t_carsales` VALUES (304, '2022/9/4', 11700, 'T');
INSERT INTO `t_carsales` VALUES (305, '2022/9/11', 14140, 'T');
INSERT INTO `t_carsales` VALUES (306, '2022/9/18', 13340, 'T');
INSERT INTO `t_carsales` VALUES (307, '2022/9/25', 14310, 'T');
INSERT INTO `t_carsales` VALUES (308, '2022/10/2', 3530, 'T');
INSERT INTO `t_carsales` VALUES (309, '2022/10/9', 2150, 'T');
INSERT INTO `t_carsales` VALUES (310, '2022/10/16', 1720, 'T');
INSERT INTO `t_carsales` VALUES (311, '2022/10/23', 2990, 'T');
INSERT INTO `t_carsales` VALUES (312, '2022/10/30', 6180, 'T');
INSERT INTO `t_carsales` VALUES (313, '2022/11/6', 8350, 'T');
INSERT INTO `t_carsales` VALUES (314, '2022/11/13', 18700, 'T');
INSERT INTO `t_carsales` VALUES (315, '2022/11/20', 11550, 'T');
INSERT INTO `t_carsales` VALUES (316, '2022/11/27', 11780, 'T');
INSERT INTO `t_carsales` VALUES (317, '2022/12/4', 7340, 'T');
INSERT INTO `t_carsales` VALUES (318, '2022/12/11', 8710, 'T');
INSERT INTO `t_carsales` VALUES (319, '2022/12/18', 7200, 'T');
INSERT INTO `t_carsales` VALUES (320, '2022/12/25', 5540, 'T');
INSERT INTO `t_carsales` VALUES (321, '2023/1/1', 3170, 'T');
INSERT INTO `t_carsales` VALUES (322, '2023/1/8', 2320, 'T');
INSERT INTO `t_carsales` VALUES (323, '2023/1/15', 8950, 'T');
INSERT INTO `t_carsales` VALUES (324, '2023/1/22', 3780, 'T');
INSERT INTO `t_carsales` VALUES (433, '2021/1/3', 360, 'XP');
INSERT INTO `t_carsales` VALUES (434, '2021/1/10', 640, 'XP');
INSERT INTO `t_carsales` VALUES (435, '2021/1/17', 510, 'XP');
INSERT INTO `t_carsales` VALUES (436, '2021/1/24', 790, 'XP');
INSERT INTO `t_carsales` VALUES (437, '2021/1/31', 780, 'XP');
INSERT INTO `t_carsales` VALUES (438, '2021/2/7', 390, 'XP');
INSERT INTO `t_carsales` VALUES (439, '2021/2/14', 170, 'XP');
INSERT INTO `t_carsales` VALUES (440, '2021/2/21', 180, 'XP');
INSERT INTO `t_carsales` VALUES (441, '2021/2/28', 430, 'XP');
INSERT INTO `t_carsales` VALUES (442, '2021/3/7', 450, 'XP');
INSERT INTO `t_carsales` VALUES (443, '2021/3/14', 410, 'XP');
INSERT INTO `t_carsales` VALUES (444, '2021/3/21', 360, 'XP');
INSERT INTO `t_carsales` VALUES (445, '2021/3/28', 330, 'XP');
INSERT INTO `t_carsales` VALUES (446, '2021/4/4', 330, 'XP');
INSERT INTO `t_carsales` VALUES (447, '2021/4/11', 340, 'XP');
INSERT INTO `t_carsales` VALUES (448, '2021/4/18', 360, 'XP');
INSERT INTO `t_carsales` VALUES (449, '2021/4/25', 510, 'XP');
INSERT INTO `t_carsales` VALUES (450, '2021/5/2', 460, 'XP');
INSERT INTO `t_carsales` VALUES (451, '2021/5/9', 250, 'XP');
INSERT INTO `t_carsales` VALUES (452, '2021/5/16', 470, 'XP');
INSERT INTO `t_carsales` VALUES (453, '2021/5/23', 450, 'XP');
INSERT INTO `t_carsales` VALUES (454, '2021/5/30', 1060, 'XP');
INSERT INTO `t_carsales` VALUES (455, '2021/6/6', 580, 'XP');
INSERT INTO `t_carsales` VALUES (456, '2021/6/13', 460, 'XP');
INSERT INTO `t_carsales` VALUES (457, '2021/6/20', 490, 'XP');
INSERT INTO `t_carsales` VALUES (458, '2021/6/27', 750, 'XP');
INSERT INTO `t_carsales` VALUES (459, '2021/7/4', 740, 'XP');
INSERT INTO `t_carsales` VALUES (460, '2021/7/11', 640, 'XP');
INSERT INTO `t_carsales` VALUES (461, '2021/7/18', 810, 'XP');
INSERT INTO `t_carsales` VALUES (462, '2021/7/25', 770, 'XP');
INSERT INTO `t_carsales` VALUES (463, '2021/8/1', 700, 'XP');
INSERT INTO `t_carsales` VALUES (464, '2021/8/8', 610, 'XP');
INSERT INTO `t_carsales` VALUES (465, '2021/8/15', 590, 'XP');
INSERT INTO `t_carsales` VALUES (466, '2021/8/22', 600, 'XP');
INSERT INTO `t_carsales` VALUES (467, '2021/8/29', 780, 'XP');
INSERT INTO `t_carsales` VALUES (468, '2021/9/5', 650, 'XP');
INSERT INTO `t_carsales` VALUES (469, '2021/9/12', 710, 'XP');
INSERT INTO `t_carsales` VALUES (470, '2021/9/19', 870, 'XP');
INSERT INTO `t_carsales` VALUES (471, '2021/9/26', 740, 'XP');
INSERT INTO `t_carsales` VALUES (472, '2021/10/3', 780, 'XP');
INSERT INTO `t_carsales` VALUES (473, '2021/10/10', 390, 'XP');
INSERT INTO `t_carsales` VALUES (474, '2021/10/17', 810, 'XP');
INSERT INTO `t_carsales` VALUES (475, '2021/10/24', 890, 'XP');
INSERT INTO `t_carsales` VALUES (476, '2021/10/31', 1090, 'XP');
INSERT INTO `t_carsales` VALUES (477, '2021/11/7', 930, 'XP');
INSERT INTO `t_carsales` VALUES (478, '2021/11/14', 1030, 'XP');
INSERT INTO `t_carsales` VALUES (479, '2021/11/21', 1000, 'XP');
INSERT INTO `t_carsales` VALUES (480, '2021/11/28', 1660, 'XP');
INSERT INTO `t_carsales` VALUES (481, '2021/12/5', 1240, 'XP');
INSERT INTO `t_carsales` VALUES (482, '2021/12/12', 1210, 'XP');
INSERT INTO `t_carsales` VALUES (483, '2021/12/19', 1770, 'XP');
INSERT INTO `t_carsales` VALUES (484, '2021/12/26', 2350, 'XP');
INSERT INTO `t_carsales` VALUES (485, '2022/1/2', 2110, 'XP');
INSERT INTO `t_carsales` VALUES (486, '2022/1/9', 690, 'XP');
INSERT INTO `t_carsales` VALUES (487, '2022/1/16', 1480, 'XP');
INSERT INTO `t_carsales` VALUES (488, '2022/1/23', 1970, 'XP');
INSERT INTO `t_carsales` VALUES (489, '2022/1/30', 2640, 'XP');
INSERT INTO `t_carsales` VALUES (490, '2022/2/6', 1660, 'XP');
INSERT INTO `t_carsales` VALUES (491, '2022/2/13', 460, 'XP');
INSERT INTO `t_carsales` VALUES (492, '2022/2/20', 750, 'XP');
INSERT INTO `t_carsales` VALUES (493, '2022/2/27', 1950, 'XP');
INSERT INTO `t_carsales` VALUES (494, '2022/3/6', 1770, 'XP');
INSERT INTO `t_carsales` VALUES (495, '2022/3/13', 2110, 'XP');
INSERT INTO `t_carsales` VALUES (496, '2022/3/20', 1770, 'XP');
INSERT INTO `t_carsales` VALUES (497, '2022/3/27', 2230, 'XP');
INSERT INTO `t_carsales` VALUES (498, '2022/4/3', 1770, 'XP');
INSERT INTO `t_carsales` VALUES (499, '2022/4/10', 1100, 'XP');
INSERT INTO `t_carsales` VALUES (500, '2022/4/17', 1500, 'XP');
INSERT INTO `t_carsales` VALUES (501, '2022/4/24', 1020, 'XP');
INSERT INTO `t_carsales` VALUES (502, '2022/5/1', 950, 'XP');
INSERT INTO `t_carsales` VALUES (503, '2022/5/8', 550, 'XP');
INSERT INTO `t_carsales` VALUES (504, '2022/5/15', 840, 'XP');
INSERT INTO `t_carsales` VALUES (505, '2022/5/22', 950, 'XP');
INSERT INTO `t_carsales` VALUES (506, '2022/5/29', 2280, 'XP');
INSERT INTO `t_carsales` VALUES (507, '2022/6/5', 1370, 'XP');
INSERT INTO `t_carsales` VALUES (508, '2022/6/12', 2110, 'XP');
INSERT INTO `t_carsales` VALUES (509, '2022/6/19', 2360, 'XP');
INSERT INTO `t_carsales` VALUES (510, '2022/6/26', 3100, 'XP');
INSERT INTO `t_carsales` VALUES (511, '2022/7/3', 2810, 'XP');
INSERT INTO `t_carsales` VALUES (512, '2022/7/10', 1320, 'XP');
INSERT INTO `t_carsales` VALUES (513, '2022/7/17', 1660, 'XP');
INSERT INTO `t_carsales` VALUES (514, '2022/7/24', 1510, 'XP');
INSERT INTO `t_carsales` VALUES (515, '2022/7/31', 2330, 'XP');
INSERT INTO `t_carsales` VALUES (516, '2022/8/7', 1230, 'XP');
INSERT INTO `t_carsales` VALUES (517, '2022/8/14', 1210, 'XP');
INSERT INTO `t_carsales` VALUES (518, '2022/8/21', 1120, 'XP');
INSERT INTO `t_carsales` VALUES (519, '2022/8/28', 1400, 'XP');
INSERT INTO `t_carsales` VALUES (520, '2022/9/4', 1020, 'XP');
INSERT INTO `t_carsales` VALUES (521, '2022/9/11', 1010, 'XP');
INSERT INTO `t_carsales` VALUES (522, '2022/9/18', 1040, 'XP');
INSERT INTO `t_carsales` VALUES (523, '2022/9/25', 1190, 'XP');
INSERT INTO `t_carsales` VALUES (524, '2022/10/2', 940, 'XP');
INSERT INTO `t_carsales` VALUES (525, '2022/10/9', 330, 'XP');
INSERT INTO `t_carsales` VALUES (526, '2022/10/16', 660, 'XP');
INSERT INTO `t_carsales` VALUES (527, '2022/10/23', 590, 'XP');
INSERT INTO `t_carsales` VALUES (528, '2022/10/30', 670, 'XP');
INSERT INTO `t_carsales` VALUES (529, '2022/11/6', 490, 'XP');
INSERT INTO `t_carsales` VALUES (530, '2022/11/13', 960, 'XP');
INSERT INTO `t_carsales` VALUES (531, '2022/11/20', 710, 'XP');
INSERT INTO `t_carsales` VALUES (532, '2022/11/27', 790, 'XP');
INSERT INTO `t_carsales` VALUES (533, '2022/12/4', 1280, 'XP');
INSERT INTO `t_carsales` VALUES (534, '2022/12/11', 1230, 'XP');
INSERT INTO `t_carsales` VALUES (535, '2022/12/18', 1490, 'XP');
INSERT INTO `t_carsales` VALUES (536, '2022/12/25', 1280, 'XP');
INSERT INTO `t_carsales` VALUES (537, '2023/1/1', 1770, 'XP');
INSERT INTO `t_carsales` VALUES (538, '2023/1/8', 870, 'XP');
INSERT INTO `t_carsales` VALUES (539, '2023/1/15', 1050, 'XP');
INSERT INTO `t_carsales` VALUES (540, '2023/1/22', 630, 'XP');

-- ----------------------------
-- Table structure for t_carsinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_carsinfo`;
CREATE TABLE `t_carsinfo`  (
  `ID` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hyperlink` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_carsinfo
-- ----------------------------
INSERT INTO `t_carsinfo` VALUES (1, '2023款比亚迪海豚到店实拍：18项升级！实车体验效果超赞\r\n在A0级轿车市场中，比亚迪海豚', 'https://www.sohu.com/a/645747236_120790662', '在A0级轿车市场中，比亚迪海豚已成为连续13个月销量...');
INSERT INTO `t_carsinfo` VALUES (2, '扔掉补贴“拐杖” 2月新能源汽车预计基本实现开门红', 'http://www.ce.cn/cysc/newmain/yc/jsxw/202303/08/t20230308_38430604.shtml', '近日，乘联会和多家新能源车企发布了2月份销量数据...');
INSERT INTO `t_carsinfo` VALUES (3, '今年新能源汽车产业将保持良好发展态势', 'http://www.cinic.org.cn/hy/yw/1412863.html?from=singlemessage', '2022年，我国新能源汽车迎来了暴发性增长，全年产...');
INSERT INTO `t_carsinfo` VALUES (4, '特斯拉再度降价，新能源汽车市场竞争日趋激烈', 'https://baijiahao.baidu.com/s?id=1759702430110619240&wfr=spider&for=pc', '特斯拉再度降价，新能源汽车市场竞争日趋激烈\r\n近日，特斯拉宣布下调旗下两款电动汽车model s和...');

-- ----------------------------
-- Table structure for t_results
-- ----------------------------
DROP TABLE IF EXISTS `t_results`;
CREATE TABLE `t_results`  (
  `ID` int(11) NOT NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sales` int(255) NULL DEFAULT NULL,
  `sale_brand_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_results
-- ----------------------------

-- ----------------------------
-- Table structure for t_stations
-- ----------------------------
DROP TABLE IF EXISTS `t_stations`;
CREATE TABLE `t_stations`  (
  `ID` int(11) NOT NULL,
  `station_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `count` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_stations
-- ----------------------------
INSERT INTO `t_stations` VALUES (1, '公共类充电桩', '全国', '台', 1797488);
INSERT INTO `t_stations` VALUES (2, '公共类充电桩', '北京', '台', 110145);
INSERT INTO `t_stations` VALUES (3, '公共类充电桩', '广东', '台', 382960);
INSERT INTO `t_stations` VALUES (4, '公共类充电桩', '上海', '台', 122235);
INSERT INTO `t_stations` VALUES (5, '公共类充电桩', '江苏', '台', 129677);
INSERT INTO `t_stations` VALUES (6, '公共类充电桩', '山东', '台', 89965);
INSERT INTO `t_stations` VALUES (7, '公共类充电桩', '安徽', '台', 84129);
INSERT INTO `t_stations` VALUES (8, '公共类充电桩', '浙江', '台', 125918);
INSERT INTO `t_stations` VALUES (9, '公共类充电桩', '湖北', '台', 101163);
INSERT INTO `t_stations` VALUES (10, '公共类充电桩', '福建', '台', 67299);
INSERT INTO `t_stations` VALUES (11, '公共类充电桩', '河南', '台', 68016);
INSERT INTO `t_stations` VALUES (12, '公共充电站', '北京', '座', 7296);
INSERT INTO `t_stations` VALUES (13, '公共充电站', '广东', '座', 21705);
INSERT INTO `t_stations` VALUES (14, '公共充电站', '江苏', '座', 9172);
INSERT INTO `t_stations` VALUES (15, '公共充电站', '浙江', '座', 8796);
INSERT INTO `t_stations` VALUES (16, '公共充电站', '上海', '座', 7036);
INSERT INTO `t_stations` VALUES (17, '公共充电站', '山东', '座', 6507);
INSERT INTO `t_stations` VALUES (18, '公共充电站', '河北', '座', 4201);
INSERT INTO `t_stations` VALUES (19, '公共充电站', '四川', '座', 4340);
INSERT INTO `t_stations` VALUES (20, '公共充电站', '天津', '座', 4005);
INSERT INTO `t_stations` VALUES (21, '公共充电站', '河南', '座', 3688);
INSERT INTO `t_stations` VALUES (22, '共享私桩', '北京', '台', 10328);
INSERT INTO `t_stations` VALUES (23, '共享私桩', '浙江', '台', 6771);
INSERT INTO `t_stations` VALUES (24, '共享私桩', '上海', '台', 7606);
INSERT INTO `t_stations` VALUES (25, '共享私桩', '江苏', '台', 6855);
INSERT INTO `t_stations` VALUES (26, '共享私桩', '广东', '台', 7701);
INSERT INTO `t_stations` VALUES (27, '共享私桩', '河北', '台', 3825);
INSERT INTO `t_stations` VALUES (28, '共享私桩', '天津', '台', 3740);
INSERT INTO `t_stations` VALUES (29, '共享私桩', '河南', '台', 4994);
INSERT INTO `t_stations` VALUES (30, '共享私桩', '山东', '台', 5220);
INSERT INTO `t_stations` VALUES (31, '共享私桩', '四川', '台', 2279);
INSERT INTO `t_stations` VALUES (32, '换电站保有', '总计', '座', 1973);
INSERT INTO `t_stations` VALUES (33, '换电站保有', '北京', '座', 289);
INSERT INTO `t_stations` VALUES (34, '换电站保有', '广东', '座', 248);
INSERT INTO `t_stations` VALUES (35, '换电站保有', '江苏', '座', 170);
INSERT INTO `t_stations` VALUES (36, '换电站保有', '浙江', '座', 239);
INSERT INTO `t_stations` VALUES (37, '换电站保有', '上海', '座', 132);
INSERT INTO `t_stations` VALUES (38, '换电站保有', '四川', '座', 71);
INSERT INTO `t_stations` VALUES (39, '换电站保有', '河北', '座', 62);
INSERT INTO `t_stations` VALUES (40, '换电站保有', '吉林', '座', 103);
INSERT INTO `t_stations` VALUES (41, '换电站保有', '山东', '座', 76);
INSERT INTO `t_stations` VALUES (42, '换电站保有', '湖北', '座', 66);

-- ----------------------------
-- Table structure for t_users
-- ----------------------------
DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `isManager` int(11) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_users
-- ----------------------------
INSERT INTO `t_users` VALUES (3, '张三', 'pbkdf2:sha256:260000$kzaR3jReZbW6Vgri$40ed71c7fe4c9beac758f714bdeea1c3f42ad6e6b80f02de8bc148296e424d73', '123@qq.com', 0);
INSERT INTO `t_users` VALUES (1, 'G-raser', 'pbkdf2:sha256:260000$vH5pG028tNZCGPOj$eeb6b21c130cee0f42713f5b17e7933e0f3c6f15ad4e81270627e2093c7e1699', 'g.raser0001@gmail.com', 0);

SET FOREIGN_KEY_CHECKS = 1;
