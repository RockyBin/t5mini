/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : zerg

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 09/12/2020 15:21:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Banner名称，通常作为标识',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Banner描述',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'banner管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES (1, '首页置顶', '首页轮播图', NULL, NULL);

-- ----------------------------
-- Table structure for banner_item
-- ----------------------------
DROP TABLE IF EXISTS `banner_item`;
CREATE TABLE `banner_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_id` int(11) NOT NULL COMMENT '外键，关联image表',
  `key_word` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行关键字，根据不同的type含义不同',
  `type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '跳转类型，可能导向商品，可能导向专题，可能导向其他。0，无导向；1：导向商品;2:导向专题',
  `delete_time` int(11) DEFAULT NULL,
  `banner_id` int(11) NOT NULL COMMENT '外键，关联banner表',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'banner子项表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of banner_item
-- ----------------------------
INSERT INTO `banner_item` VALUES (1, 65, '6', 1, NULL, 1, NULL);
INSERT INTO `banner_item` VALUES (2, 2, '25', 1, NULL, 1, NULL);
INSERT INTO `banner_item` VALUES (3, 3, '11', 1, NULL, 1, NULL);
INSERT INTO `banner_item` VALUES (5, 1, '10', 1, NULL, 1, NULL);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `topic_img_id` int(11) DEFAULT NULL COMMENT '外键，关联image表',
  `delete_time` int(11) DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '描述',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品类目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (2, '果味', 6, NULL, NULL, NULL);
INSERT INTO `category` VALUES (3, '蔬菜', 5, NULL, NULL, NULL);
INSERT INTO `category` VALUES (4, '炒货', 7, NULL, NULL, NULL);
INSERT INTO `category` VALUES (5, '点心', 4, NULL, NULL, NULL);
INSERT INTO `category` VALUES (6, '粗茶', 8, NULL, NULL, NULL);
INSERT INTO `category` VALUES (7, '淡饭', 9, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图片路径',
  `from` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 来自本地，2 来自公网',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '图片总表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES (1, '/banner-1a.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (2, '/banner-2a.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (3, '/banner-3a.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (4, '/category-cake.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (5, '/category-vg.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (6, '/category-dryfruit.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (7, '/category-fry-a.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (8, '/category-tea.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (9, '/category-rice.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (10, '/product-dryfruit@1.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (13, '/product-vg@1.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (14, '/product-rice@6.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (16, '/1@theme.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (17, '/2@theme.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (18, '/3@theme.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (19, '/detail-1@1-dryfruit.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (20, '/detail-2@1-dryfruit.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (21, '/detail-3@1-dryfruit.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (22, '/detail-4@1-dryfruit.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (23, '/detail-5@1-dryfruit.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (24, '/detail-6@1-dryfruit.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (25, '/detail-7@1-dryfruit.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (26, '/detail-8@1-dryfruit.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (27, '/detail-9@1-dryfruit.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (28, '/detail-11@1-dryfruit.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (29, '/detail-10@1-dryfruit.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (31, '/product-rice@1.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (32, '/product-tea@1.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (33, '/product-dryfruit@2.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (36, '/product-dryfruit@3.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (37, '/product-dryfruit@4.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (38, '/product-dryfruit@5.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (39, '/product-dryfruit-a@6.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (40, '/product-dryfruit@7.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (41, '/product-rice@2.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (42, '/product-rice@3.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (43, '/product-rice@4.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (44, '/product-fry@1.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (45, '/product-fry@2.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (46, '/product-fry@3.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (47, '/product-tea@2.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (48, '/product-tea@3.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (49, '/1@theme-head.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (50, '/2@theme-head.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (51, '/3@theme-head.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (52, '/product-cake@1.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (53, '/product-cake@2.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (54, '/product-cake-a@3.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (55, '/product-cake-a@4.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (56, '/product-dryfruit@8.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (57, '/product-fry@4.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (58, '/product-fry@5.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (59, '/product-rice@5.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (60, '/product-rice@7.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (62, '/detail-12@1-dryfruit.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (63, '/detail-13@1-dryfruit.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (65, '/banner-4a.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (66, '/product-vg@4.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (67, '/product-vg@5.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (68, '/product-vg@2.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (69, '/product-vg@3.png', 1, NULL, NULL);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单号',
  `user_id` int(11) NOT NULL COMMENT '外键，用户id，注意并不是openid',
  `delete_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `total_price` decimal(6, 2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1:未支付， 2：已支付，3：已发货 , 4: 已支付，但库存不足',
  `snap_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '订单快照图片',
  `snap_name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '订单快照名称',
  `total_count` int(11) NOT NULL DEFAULT 0,
  `update_time` int(11) DEFAULT NULL,
  `snap_items` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '订单其他信息快照（json)',
  `snap_address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '地址快照',
  `prepay_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '订单微信支付的预订单id（用于发送模板消息）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_no`(`order_no`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 571 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (557, 'E16071397251748', 60, NULL, 1607139725, 0.09, 1, 'http://www.t5.com/public/product-dryfruit@1.png', '梨花带雨 3个', 9, 1607139725, '[{\"id\":19,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-dryfruit@1.png\",\"count\":3,\"totalPrice\":0.03},{\"id\":2,\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-rice@1.png\",\"count\":3,\"totalPrice\":0.03},{\"id\":3,\"name\":\"\\u78a7\\u6c34\\u8475\\u82b1\\u7c7d 128\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-fry@3.png\",\"count\":3,\"totalPrice\":0.03}]', '{\"id\":37,\"name\":\"rock\",\"mobile\":\"15017405329\",\"province\":null,\"city\":null,\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u6a21\\u538b\\u9876\\u6234\",\"delete_time\":null,\"user_id\":60,\"update_time\":\"1970-01-01 08:00:00\"}', NULL);
INSERT INTO `order` VALUES (558, 'E16071399883868', 60, NULL, 1607139988, 0.09, 1, 'http://www.t5.com/public/product-dryfruit@1.png', '梨花带雨 3个', 9, 1607139988, '[{\"id\":19,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-dryfruit@1.png\",\"count\":3,\"totalPrice\":0.03},{\"id\":2,\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-rice@1.png\",\"count\":3,\"totalPrice\":0.03},{\"id\":3,\"name\":\"\\u78a7\\u6c34\\u8475\\u82b1\\u7c7d 128\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-fry@3.png\",\"count\":3,\"totalPrice\":0.03}]', '{\"id\":37,\"name\":\"rock\",\"mobile\":\"15017405329\",\"province\":null,\"city\":null,\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u6a21\\u538b\\u9876\\u6234\",\"delete_time\":null,\"user_id\":60,\"update_time\":\"1970-01-01 08:00:00\"}', NULL);
INSERT INTO `order` VALUES (559, 'E16071401751777', 60, NULL, 1607140175, 0.09, 1, 'http://www.t5.com/public/product-dryfruit@1.png', '梨花带雨 3个', 9, 1607140175, '[{\"id\":19,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-dryfruit@1.png\",\"count\":3,\"totalPrice\":0.03},{\"id\":2,\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-rice@1.png\",\"count\":3,\"totalPrice\":0.03},{\"id\":3,\"name\":\"\\u78a7\\u6c34\\u8475\\u82b1\\u7c7d 128\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-fry@3.png\",\"count\":3,\"totalPrice\":0.03}]', '{\"id\":37,\"name\":\"rock\",\"mobile\":\"15017405329\",\"province\":null,\"city\":null,\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u6a21\\u538b\\u9876\\u6234\",\"delete_time\":null,\"user_id\":60,\"update_time\":\"1970-01-01 08:00:00\"}', NULL);
INSERT INTO `order` VALUES (560, 'E16071402444125', 60, NULL, 1607140244, 0.09, 1, 'http://www.t5.com/public/product-dryfruit@1.png', '梨花带雨 3个', 9, 1607140244, '[{\"id\":19,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-dryfruit@1.png\",\"count\":3,\"totalPrice\":0.03},{\"id\":2,\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-rice@1.png\",\"count\":3,\"totalPrice\":0.03},{\"id\":3,\"name\":\"\\u78a7\\u6c34\\u8475\\u82b1\\u7c7d 128\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-fry@3.png\",\"count\":3,\"totalPrice\":0.03}]', '{\"id\":37,\"name\":\"rock\",\"mobile\":\"15017405329\",\"province\":null,\"city\":null,\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u6a21\\u538b\\u9876\\u6234\",\"delete_time\":null,\"user_id\":60,\"update_time\":\"1970-01-01 08:00:00\"}', NULL);
INSERT INTO `order` VALUES (561, 'E16071403318643', 60, NULL, 1607140331, 0.09, 1, 'http://www.t5.com/public/product-dryfruit@1.png', '梨花带雨 3个', 9, 1607140331, '[{\"id\":19,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-dryfruit@1.png\",\"count\":3,\"totalPrice\":0.03},{\"id\":2,\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-rice@1.png\",\"count\":3,\"totalPrice\":0.03},{\"id\":3,\"name\":\"\\u78a7\\u6c34\\u8475\\u82b1\\u7c7d 128\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-fry@3.png\",\"count\":3,\"totalPrice\":0.03}]', '{\"id\":37,\"name\":\"rock\",\"mobile\":\"15017405329\",\"province\":null,\"city\":null,\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u6a21\\u538b\\u9876\\u6234\",\"delete_time\":null,\"user_id\":60,\"update_time\":\"1970-01-01 08:00:00\"}', NULL);
INSERT INTO `order` VALUES (562, 'E16071403617278', 60, NULL, 1607140361, 0.09, 1, 'http://www.t5.com/public/product-dryfruit@1.png', '梨花带雨 3个', 9, 1607140361, '[{\"id\":19,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-dryfruit@1.png\",\"count\":3,\"totalPrice\":0.03},{\"id\":2,\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-rice@1.png\",\"count\":3,\"totalPrice\":0.03},{\"id\":3,\"name\":\"\\u78a7\\u6c34\\u8475\\u82b1\\u7c7d 128\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-fry@3.png\",\"count\":3,\"totalPrice\":0.03}]', '{\"id\":37,\"name\":\"rock\",\"mobile\":\"15017405329\",\"province\":null,\"city\":null,\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u6a21\\u538b\\u9876\\u6234\",\"delete_time\":null,\"user_id\":60,\"update_time\":\"1970-01-01 08:00:00\"}', NULL);
INSERT INTO `order` VALUES (563, 'E16071404238405', 60, NULL, 1607140423, 0.09, 1, 'http://www.t5.com/public/product-dryfruit@1.png', '梨花带雨 3个', 9, 1607140423, '[{\"id\":19,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-dryfruit@1.png\",\"count\":3,\"totalPrice\":0.03},{\"id\":2,\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-rice@1.png\",\"count\":3,\"totalPrice\":0.03},{\"id\":3,\"name\":\"\\u78a7\\u6c34\\u8475\\u82b1\\u7c7d 128\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-fry@3.png\",\"count\":3,\"totalPrice\":0.03}]', '{\"id\":37,\"name\":\"rock\",\"mobile\":\"15017405329\",\"province\":null,\"city\":null,\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u6a21\\u538b\\u9876\\u6234\",\"delete_time\":null,\"user_id\":60,\"update_time\":\"1970-01-01 08:00:00\"}', NULL);
INSERT INTO `order` VALUES (564, 'E16071404803345', 60, NULL, 1607140480, 0.09, 1, 'http://www.t5.com/public/product-dryfruit@1.png', '梨花带雨 3个', 9, 1607140480, '[{\"id\":19,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-dryfruit@1.png\",\"count\":3,\"totalPrice\":0.03},{\"id\":2,\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-rice@1.png\",\"count\":3,\"totalPrice\":0.03},{\"id\":3,\"name\":\"\\u78a7\\u6c34\\u8475\\u82b1\\u7c7d 128\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-fry@3.png\",\"count\":3,\"totalPrice\":0.03}]', '{\"id\":37,\"name\":\"rock\",\"mobile\":\"15017405329\",\"province\":null,\"city\":null,\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u6a21\\u538b\\u9876\\u6234\",\"delete_time\":null,\"user_id\":60,\"update_time\":\"1970-01-01 08:00:00\"}', NULL);
INSERT INTO `order` VALUES (565, 'E16071405342666', 60, NULL, 1607140534, 0.09, 1, 'http://www.t5.com/public/product-dryfruit@1.png', '梨花带雨 3个', 9, 1607140534, '[{\"id\":19,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-dryfruit@1.png\",\"count\":3,\"totalPrice\":0.03},{\"id\":2,\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-rice@1.png\",\"count\":3,\"totalPrice\":0.03},{\"id\":3,\"name\":\"\\u78a7\\u6c34\\u8475\\u82b1\\u7c7d 128\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-fry@3.png\",\"count\":3,\"totalPrice\":0.03}]', '{\"id\":37,\"name\":\"rock\",\"mobile\":\"15017405329\",\"province\":null,\"city\":null,\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u6a21\\u538b\\u9876\\u6234\",\"delete_time\":null,\"user_id\":60,\"update_time\":\"1970-01-01 08:00:00\"}', NULL);
INSERT INTO `order` VALUES (566, 'E16071406127773', 60, NULL, 1607140612, 0.09, 1, 'http://www.t5.com/public/product-dryfruit@1.png', '梨花带雨 3个', 9, 1607140612, '[{\"id\":19,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-dryfruit@1.png\",\"count\":3,\"totalPrice\":0.03},{\"id\":2,\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-rice@1.png\",\"count\":3,\"totalPrice\":0.03},{\"id\":3,\"name\":\"\\u78a7\\u6c34\\u8475\\u82b1\\u7c7d 128\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-fry@3.png\",\"count\":3,\"totalPrice\":0.03}]', '{\"id\":37,\"name\":\"rock\",\"mobile\":\"15017405329\",\"province\":null,\"city\":null,\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u6a21\\u538b\\u9876\\u6234\",\"delete_time\":null,\"user_id\":60,\"update_time\":\"1970-01-01 08:00:00\"}', NULL);
INSERT INTO `order` VALUES (567, 'E16071406321149', 60, NULL, 1607140632, 0.09, 1, 'http://www.t5.com/public/product-dryfruit@1.png', '梨花带雨 3个', 9, 1607140632, '[{\"id\":19,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-dryfruit@1.png\",\"count\":3,\"totalPrice\":0.03},{\"id\":2,\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-rice@1.png\",\"count\":3,\"totalPrice\":0.03},{\"id\":3,\"name\":\"\\u78a7\\u6c34\\u8475\\u82b1\\u7c7d 128\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-fry@3.png\",\"count\":3,\"totalPrice\":0.03}]', '{\"id\":37,\"name\":\"rock\",\"mobile\":\"15017405329\",\"province\":null,\"city\":null,\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u6a21\\u538b\\u9876\\u6234\",\"delete_time\":null,\"user_id\":60,\"update_time\":\"1970-01-01 08:00:00\"}', NULL);
INSERT INTO `order` VALUES (568, 'E16071406972004', 60, NULL, 1607140697, 0.09, 1, 'http://www.t5.com/public/product-dryfruit@1.png', '梨花带雨 3个', 9, 1607140697, '[{\"id\":19,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-dryfruit@1.png\",\"count\":3,\"totalPrice\":0.03},{\"id\":2,\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-rice@1.png\",\"count\":3,\"totalPrice\":0.03},{\"id\":3,\"name\":\"\\u78a7\\u6c34\\u8475\\u82b1\\u7c7d 128\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-fry@3.png\",\"count\":3,\"totalPrice\":0.03}]', '{\"id\":37,\"name\":\"rock\",\"mobile\":\"15017405329\",\"province\":null,\"city\":null,\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u6a21\\u538b\\u9876\\u6234\",\"delete_time\":null,\"user_id\":60,\"update_time\":\"1970-01-01 08:00:00\"}', NULL);
INSERT INTO `order` VALUES (569, 'E16071407534338', 60, NULL, 1607140753, 0.09, 1, 'http://www.t5.com/public/product-dryfruit@1.png', '梨花带雨 3个', 9, 1607140753, '[{\"id\":19,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-dryfruit@1.png\",\"count\":3,\"totalPrice\":0.03},{\"id\":2,\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-rice@1.png\",\"count\":3,\"totalPrice\":0.03},{\"id\":3,\"name\":\"\\u78a7\\u6c34\\u8475\\u82b1\\u7c7d 128\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-fry@3.png\",\"count\":3,\"totalPrice\":0.03}]', '{\"id\":37,\"name\":\"rock\",\"mobile\":\"15017405329\",\"province\":null,\"city\":null,\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u6a21\\u538b\\u9876\\u6234\",\"delete_time\":null,\"user_id\":60,\"update_time\":\"1970-01-01 08:00:00\"}', 'wx051159205634094e1bec8d5ee52df50000');
INSERT INTO `order` VALUES (570, 'E16071409469556', 60, NULL, 1607140946, 0.09, 1, 'http://www.t5.com/public/product-dryfruit@1.png', '梨花带雨 3个', 9, 1607140946, '[{\"id\":19,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-dryfruit@1.png\",\"count\":3,\"totalPrice\":0.03},{\"id\":2,\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-rice@1.png\",\"count\":3,\"totalPrice\":0.03},{\"id\":3,\"name\":\"\\u78a7\\u6c34\\u8475\\u82b1\\u7c7d 128\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-fry@3.png\",\"count\":3,\"totalPrice\":0.03}]', '{\"id\":37,\"name\":\"rock\",\"mobile\":\"15017405329\",\"province\":null,\"city\":null,\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u6a21\\u538b\\u9876\\u6234\",\"delete_time\":null,\"user_id\":60,\"update_time\":\"1970-01-01 08:00:00\"}', 'wx05120232960844a5c836bb27c41a010000');
INSERT INTO `order` VALUES (571, 'E16071410241968', 60, NULL, 1607141024, 0.09, 1, 'http://www.t5.com/public/product-dryfruit@1.png', '梨花带雨 3个', 9, 1607141024, '[{\"id\":19,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-dryfruit@1.png\",\"count\":3,\"totalPrice\":0.03},{\"id\":2,\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-rice@1.png\",\"count\":3,\"totalPrice\":0.03},{\"id\":3,\"name\":\"\\u78a7\\u6c34\\u8475\\u82b1\\u7c7d 128\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/public\\/product-fry@3.png\",\"count\":3,\"totalPrice\":0.03}]', '{\"id\":37,\"name\":\"rock\",\"mobile\":\"15017405329\",\"province\":null,\"city\":null,\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u6a21\\u538b\\u9876\\u6234\",\"delete_time\":null,\"user_id\":60,\"update_time\":\"1970-01-01 08:00:00\"}', 'wx05120351281174b618718d8133ca840000');
INSERT INTO `order` VALUES (572, 'E16074765728380', 60, NULL, 1607476572, 0.09, 1, 'http://www.t5.com/images/product-dryfruit@1.png', '梨花带雨 3个', 9, 1607476572, '[{\"id\":19,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/images\\/product-dryfruit@1.png\",\"count\":3,\"totalPrice\":0.03},{\"id\":2,\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/images\\/product-rice@1.png\",\"count\":3,\"totalPrice\":0.03},{\"id\":3,\"name\":\"\\u78a7\\u6c34\\u8475\\u82b1\\u7c7d 128\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/images\\/product-fry@3.png\",\"count\":3,\"totalPrice\":0.03}]', '{\"id\":37,\"name\":\"rock\",\"mobile\":\"15017405329\",\"province\":null,\"city\":null,\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u6a21\\u538b\\u9876\\u6234\",\"delete_time\":null,\"user_id\":60,\"update_time\":\"1970-01-01 08:00:00\"}', NULL);
INSERT INTO `order` VALUES (573, 'E1607476689587', 60, NULL, 1607476689, 0.03, 1, 'http://www.t5.com/images/product-fry@3.png', '碧水葵花籽 128克', 3, 1607476689, '[{\"id\":19,\"name\":\"\\u78a7\\u6c34\\u8475\\u82b1\\u7c7d 128\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/images\\/product-fry@3.png\",\"count\":3,\"totalPrice\":0.03}]', '{\"id\":37,\"name\":\"rock\",\"mobile\":\"15017405329\",\"province\":null,\"city\":null,\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u6a21\\u538b\\u9876\\u6234\",\"delete_time\":null,\"user_id\":60,\"update_time\":\"1970-01-01 08:00:00\"}', 'wx09091823968011d6e147498ddfc8c50000');
INSERT INTO `order` VALUES (574, 'E16074778354279', 60, NULL, 1607477835, 0.01, 1, 'http://www.t5.com/images/product-fry@3.png', '碧水葵花籽 128克', 1, 1607477835, '[{\"id\":19,\"name\":\"\\u78a7\\u6c34\\u8475\\u82b1\\u7c7d 128\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/images\\/product-fry@3.png\",\"count\":1,\"totalPrice\":0.01}]', '{\"id\":37,\"name\":\"rock\",\"mobile\":\"15017405329\",\"province\":null,\"city\":null,\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u6a21\\u538b\\u9876\\u6234\",\"delete_time\":null,\"user_id\":60,\"update_time\":\"1970-01-01 08:00:00\"}', 'wx09093726901550b2f8e84a2ef068390000');
INSERT INTO `order` VALUES (575, 'E16074785836867', 60, NULL, 1607478583, 0.01, 1, 'http://www.t5.com/images/product-fry@3.png', '碧水葵花籽 128克', 1, 1607478583, '[{\"id\":19,\"name\":\"\\u78a7\\u6c34\\u8475\\u82b1\\u7c7d 128\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/images\\/product-fry@3.png\",\"count\":1,\"totalPrice\":0.01}]', '{\"id\":37,\"name\":\"rock\",\"mobile\":\"15017405329\",\"province\":null,\"city\":null,\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u6a21\\u538b\\u9876\\u6234\",\"delete_time\":null,\"user_id\":60,\"update_time\":\"1970-01-01 08:00:00\"}', 'wx09094954752253e7a1c6c0f62e57b00000');
INSERT INTO `order` VALUES (576, 'E16074804884990', 60, NULL, 1607480488, 0.01, 1, 'http://www.t5.com/images/product-fry@3.png', '碧水葵花籽 128克', 1, 1607480488, '[{\"id\":19,\"name\":\"\\u78a7\\u6c34\\u8475\\u82b1\\u7c7d 128\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/images\\/product-fry@3.png\",\"count\":1,\"totalPrice\":0.01}]', '{\"id\":37,\"name\":\"rock\",\"mobile\":\"15017405329\",\"province\":null,\"city\":null,\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u6a21\\u538b\\u9876\\u6234\",\"delete_time\":null,\"user_id\":60,\"update_time\":\"1970-01-01 08:00:00\"}', 'wx09102139879197b16a8afd0cbf2b0d0000');
INSERT INTO `order` VALUES (577, 'E16074948012629', 60, NULL, 1607494801, 0.01, 1, 'http://www.t5.com/images/product-fry@3.png', '碧水葵花籽 128克', 1, 1607494801, '[{\"id\":19,\"name\":\"\\u78a7\\u6c34\\u8475\\u82b1\\u7c7d 128\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/images\\/product-fry@3.png\",\"count\":1,\"totalPrice\":0.01}]', '{\"id\":37,\"name\":\"rock\",\"mobile\":\"15017405329\",\"province\":null,\"city\":null,\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u6a21\\u538b\\u9876\\u6234\",\"delete_time\":null,\"user_id\":60,\"update_time\":\"1970-01-01 08:00:00\"}', 'wx091420172306726cb3968f945add8b0000');
INSERT INTO `order` VALUES (578, 'E16074966319250', 60, NULL, 1607496631, 0.01, 1, 'http://www.t5.com/images/product-fry@3.png', '碧水葵花籽 128克', 1, 1607496631, '[{\"id\":19,\"name\":\"\\u78a7\\u6c34\\u8475\\u82b1\\u7c7d 128\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/images\\/product-fry@3.png\",\"count\":1,\"totalPrice\":0.01}]', '{\"id\":37,\"name\":\"rock\",\"mobile\":\"15017405329\",\"province\":null,\"city\":null,\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u6a21\\u538b\\u9876\\u6234\",\"delete_time\":null,\"user_id\":60,\"update_time\":\"1970-01-01 08:00:00\"}', 'wx09145048367831670d539db82f1a130000');
INSERT INTO `order` VALUES (579, 'E1607497313820', 60, NULL, 1607497313, 0.01, 1, 'http://www.t5.com/images/product-fry@3.png', '碧水葵花籽 128克', 1, 1607497313, '[{\"id\":19,\"name\":\"\\u78a7\\u6c34\\u8475\\u82b1\\u7c7d 128\\u514b\",\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/www.t5.com\\/images\\/product-fry@3.png\",\"count\":1,\"totalPrice\":0.01}]', '{\"id\":37,\"name\":\"rock\",\"mobile\":\"15017405329\",\"province\":null,\"city\":null,\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u6a21\\u538b\\u9876\\u6234\",\"delete_time\":null,\"user_id\":60,\"update_time\":\"1970-01-01 08:00:00\"}', 'wx091502034964540543feb68b0a0c2d0000');

-- ----------------------------
-- Table structure for order_product
-- ----------------------------
DROP TABLE IF EXISTS `order_product`;
CREATE TABLE `order_product`  (
  `order_id` int(11) NOT NULL COMMENT '联合主键，订单id',
  `product_id` int(11) NOT NULL COMMENT '联合主键，商品id',
  `count` int(11) NOT NULL COMMENT '商品数量',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`, `order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_product
-- ----------------------------
INSERT INTO `order_product` VALUES (557, 2, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (558, 2, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (559, 2, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (560, 2, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (561, 2, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (562, 2, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (563, 2, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (564, 2, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (565, 2, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (566, 2, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (567, 2, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (568, 2, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (569, 2, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (570, 2, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (571, 2, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (572, 2, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (557, 3, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (558, 3, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (559, 3, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (560, 3, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (561, 3, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (562, 3, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (563, 3, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (564, 3, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (565, 3, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (566, 3, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (567, 3, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (568, 3, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (569, 3, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (570, 3, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (571, 3, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (572, 3, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (557, 19, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (558, 19, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (559, 19, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (560, 19, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (561, 19, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (562, 19, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (563, 19, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (564, 19, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (565, 19, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (566, 19, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (567, 19, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (568, 19, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (569, 19, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (570, 19, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (571, 19, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (572, 19, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (573, 19, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (574, 19, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (575, 19, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (576, 19, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (577, 19, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (578, 19, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (579, 19, 1, NULL, NULL);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品名称',
  `price` decimal(6, 2) NOT NULL COMMENT '价格,单位：分',
  `stock` int(11) NOT NULL DEFAULT 0 COMMENT '库存量',
  `delete_time` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `main_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '主图ID号，这是一个反范式设计，有一定的冗余',
  `from` tinyint(4) NOT NULL DEFAULT 1 COMMENT '图片来自 1 本地 ，2公网',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL,
  `summary` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '摘要',
  `img_id` int(11) DEFAULT NULL COMMENT '图片外键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '芹菜 半斤', 0.01, 998, NULL, 3, '/product-vg@1.png', 1, NULL, NULL, NULL, 13);
INSERT INTO `product` VALUES (2, '梨花带雨 3个', 0.01, 984, NULL, 2, '/product-dryfruit@1.png', 1, NULL, NULL, NULL, 10);
INSERT INTO `product` VALUES (3, '素米 327克', 0.01, 996, NULL, 7, '/product-rice@1.png', 1, NULL, NULL, NULL, 31);
INSERT INTO `product` VALUES (4, '红袖枸杞 6克*3袋', 0.01, 998, NULL, 6, '/product-tea@1.png', 1, NULL, NULL, NULL, 32);
INSERT INTO `product` VALUES (5, '春生龙眼 500克', 0.01, 995, NULL, 2, '/product-dryfruit@2.png', 1, NULL, NULL, NULL, 33);
INSERT INTO `product` VALUES (6, '小红的猪耳朵 120克', 0.01, 997, NULL, 5, '/product-cake@2.png', 1, NULL, NULL, NULL, 53);
INSERT INTO `product` VALUES (7, '泥蒿 半斤', 0.01, 998, NULL, 3, '/product-vg@2.png', 1, NULL, NULL, NULL, 68);
INSERT INTO `product` VALUES (8, '夏日芒果 3个', 0.01, 995, NULL, 2, '/product-dryfruit@3.png', 1, NULL, NULL, NULL, 36);
INSERT INTO `product` VALUES (9, '冬木红枣 500克', 0.01, 996, NULL, 2, '/product-dryfruit@4.png', 1, NULL, NULL, NULL, 37);
INSERT INTO `product` VALUES (10, '万紫千凤梨 300克', 0.01, 996, NULL, 2, '/product-dryfruit@5.png', 1, NULL, NULL, NULL, 38);
INSERT INTO `product` VALUES (11, '贵妃笑 100克', 0.01, 994, NULL, 2, '/product-dryfruit-a@6.png', 1, NULL, NULL, NULL, 39);
INSERT INTO `product` VALUES (12, '珍奇异果 3个', 0.01, 999, NULL, 2, '/product-dryfruit@7.png', 1, NULL, NULL, NULL, 40);
INSERT INTO `product` VALUES (13, '绿豆 125克', 0.01, 999, NULL, 7, '/product-rice@2.png', 1, NULL, NULL, NULL, 41);
INSERT INTO `product` VALUES (14, '芝麻 50克', 0.01, 999, NULL, 7, '/product-rice@3.png', 1, NULL, NULL, NULL, 42);
INSERT INTO `product` VALUES (15, '猴头菇 370克', 0.01, 999, NULL, 7, '/product-rice@4.png', 1, NULL, NULL, NULL, 43);
INSERT INTO `product` VALUES (16, '西红柿 1斤', 0.01, 999, NULL, 3, '/product-vg@3.png', 1, NULL, NULL, NULL, 69);
INSERT INTO `product` VALUES (17, '油炸花生 300克', 0.01, 999, NULL, 4, '/product-fry@1.png', 1, NULL, NULL, NULL, 44);
INSERT INTO `product` VALUES (18, '春泥西瓜子 128克', 0.01, 997, NULL, 4, '/product-fry@2.png', 1, NULL, NULL, NULL, 45);
INSERT INTO `product` VALUES (19, '碧水葵花籽 128克', 0.01, 999, NULL, 4, '/product-fry@3.png', 1, NULL, NULL, NULL, 46);
INSERT INTO `product` VALUES (20, '碧螺春 12克*3袋', 0.01, 999, NULL, 6, '/product-tea@2.png', 1, NULL, NULL, NULL, 47);
INSERT INTO `product` VALUES (21, '西湖龙井 8克*3袋', 0.01, 998, NULL, 6, '/product-tea@3.png', 1, NULL, NULL, NULL, 48);
INSERT INTO `product` VALUES (22, '梅兰清花糕 1个', 0.01, 997, NULL, 5, '/product-cake-a@3.png', 1, NULL, NULL, NULL, 54);
INSERT INTO `product` VALUES (23, '清凉薄荷糕 1个', 0.01, 998, NULL, 5, '/product-cake-a@4.png', 1, NULL, NULL, NULL, 55);
INSERT INTO `product` VALUES (25, '小明的妙脆角 120克', 0.01, 999, NULL, 5, '/product-cake@1.png', 1, NULL, NULL, NULL, 52);
INSERT INTO `product` VALUES (26, '红衣青瓜 混搭160克', 0.01, 999, NULL, 2, '/product-dryfruit@8.png', 1, NULL, NULL, NULL, 56);
INSERT INTO `product` VALUES (27, '锈色瓜子 100克', 0.01, 998, NULL, 4, '/product-fry@4.png', 1, NULL, NULL, NULL, 57);
INSERT INTO `product` VALUES (28, '春泥花生 200克', 0.01, 999, NULL, 4, '/product-fry@5.png', 1, NULL, NULL, NULL, 58);
INSERT INTO `product` VALUES (29, '冰心鸡蛋 2个', 0.01, 999, NULL, 7, '/product-rice@5.png', 1, NULL, NULL, NULL, 59);
INSERT INTO `product` VALUES (30, '八宝莲子 200克', 0.01, 999, NULL, 7, '/product-rice@6.png', 1, NULL, NULL, NULL, 14);
INSERT INTO `product` VALUES (31, '深涧木耳 78克', 0.01, 999, NULL, 7, '/product-rice@7.png', 1, NULL, NULL, NULL, 60);
INSERT INTO `product` VALUES (32, '土豆 半斤', 0.01, 999, NULL, 3, '/product-vg@4.png', 1, NULL, NULL, NULL, 66);
INSERT INTO `product` VALUES (33, '青椒 半斤', 0.01, 999, NULL, 3, '/product-vg@5.png', 1, NULL, NULL, NULL, 67);

-- ----------------------------
-- Table structure for product_image
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_id` int(11) NOT NULL COMMENT '外键，关联图片表',
  `delete_time` int(11) DEFAULT NULL COMMENT '状态，主要表示是否删除，也可以扩展其他状态',
  `order` int(11) NOT NULL DEFAULT 0 COMMENT '图片排序序号',
  `product_id` int(11) NOT NULL COMMENT '商品id，外键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_image
-- ----------------------------
INSERT INTO `product_image` VALUES (4, 19, NULL, 1, 2);
INSERT INTO `product_image` VALUES (5, 20, NULL, 2, 2);
INSERT INTO `product_image` VALUES (6, 21, NULL, 3, 11);
INSERT INTO `product_image` VALUES (7, 22, NULL, 4, 11);
INSERT INTO `product_image` VALUES (8, 23, NULL, 5, 11);
INSERT INTO `product_image` VALUES (9, 24, NULL, 6, 11);
INSERT INTO `product_image` VALUES (10, 25, NULL, 7, 11);
INSERT INTO `product_image` VALUES (11, 26, NULL, 8, 11);
INSERT INTO `product_image` VALUES (12, 27, NULL, 9, 11);
INSERT INTO `product_image` VALUES (13, 28, NULL, 11, 11);
INSERT INTO `product_image` VALUES (14, 29, NULL, 10, 11);
INSERT INTO `product_image` VALUES (18, 62, NULL, 12, 11);
INSERT INTO `product_image` VALUES (19, 63, NULL, 13, 11);

-- ----------------------------
-- Table structure for product_property
-- ----------------------------
DROP TABLE IF EXISTS `product_property`;
CREATE TABLE `product_property`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '详情属性名称',
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '详情属性',
  `product_id` int(11) NOT NULL COMMENT '商品id，外键',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_property
-- ----------------------------
INSERT INTO `product_property` VALUES (1, '品名', '杨梅', 11, NULL, NULL);
INSERT INTO `product_property` VALUES (2, '口味', '青梅味 雪梨味 黄桃味 菠萝味', 11, NULL, NULL);
INSERT INTO `product_property` VALUES (3, '产地', '火星', 11, NULL, NULL);
INSERT INTO `product_property` VALUES (4, '保质期', '180天', 11, NULL, NULL);
INSERT INTO `product_property` VALUES (5, '品名', '梨子', 2, NULL, NULL);
INSERT INTO `product_property` VALUES (6, '产地', '金星', 2, NULL, NULL);
INSERT INTO `product_property` VALUES (7, '净含量', '100g', 2, NULL, NULL);
INSERT INTO `product_property` VALUES (8, '保质期', '10天', 2, NULL, NULL);

-- ----------------------------
-- Table structure for theme
-- ----------------------------
DROP TABLE IF EXISTS `theme`;
CREATE TABLE `theme`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '专题名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '专题描述',
  `topic_img_id` int(11) NOT NULL COMMENT '主题图，外键',
  `delete_time` int(11) DEFAULT NULL,
  `head_img_id` int(11) NOT NULL COMMENT '专题列表页，头图',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '主题信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of theme
-- ----------------------------
INSERT INTO `theme` VALUES (1, '专题栏位一', '美味水果世界', 16, NULL, 49, NULL);
INSERT INTO `theme` VALUES (2, '专题栏位二', '新品推荐', 17, NULL, 50, NULL);
INSERT INTO `theme` VALUES (3, '专题栏位三', '做个干物女', 18, NULL, 18, NULL);

-- ----------------------------
-- Table structure for theme_product
-- ----------------------------
DROP TABLE IF EXISTS `theme_product`;
CREATE TABLE `theme_product`  (
  `theme_id` int(11) NOT NULL COMMENT '主题外键',
  `product_id` int(11) NOT NULL COMMENT '商品外键',
  PRIMARY KEY (`theme_id`, `product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '主题所包含的商品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of theme_product
-- ----------------------------
INSERT INTO `theme_product` VALUES (1, 2);
INSERT INTO `theme_product` VALUES (1, 5);
INSERT INTO `theme_product` VALUES (1, 8);
INSERT INTO `theme_product` VALUES (1, 10);
INSERT INTO `theme_product` VALUES (1, 12);
INSERT INTO `theme_product` VALUES (2, 1);
INSERT INTO `theme_product` VALUES (2, 2);
INSERT INTO `theme_product` VALUES (2, 3);
INSERT INTO `theme_product` VALUES (2, 5);
INSERT INTO `theme_product` VALUES (2, 6);
INSERT INTO `theme_product` VALUES (2, 16);
INSERT INTO `theme_product` VALUES (2, 33);
INSERT INTO `theme_product` VALUES (3, 15);
INSERT INTO `theme_product` VALUES (3, 18);
INSERT INTO `theme_product` VALUES (3, 19);
INSERT INTO `theme_product` VALUES (3, 27);
INSERT INTO `theme_product` VALUES (3, 30);
INSERT INTO `theme_product` VALUES (3, 31);

-- ----------------------------
-- Table structure for third_app
-- ----------------------------
DROP TABLE IF EXISTS `third_app`;
CREATE TABLE `third_app`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '应用app_id',
  `app_secret` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '应用secret',
  `app_description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '应用程序描述',
  `scope` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '应用权限',
  `scope_description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '权限描述',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '访问API的各应用账号密码表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of third_app
-- ----------------------------
INSERT INTO `third_app` VALUES (1, 'starcraft', '777*777', 'CMS', '32', 'Super', NULL, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `extend` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL COMMENT '注册时间',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `openid`(`openid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (60, 'o5d665bRp6b6wEZsLgI1HyYae0q4', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收获人姓名',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号',
  `province` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '省',
  `city` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '市',
  `country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '区',
  `detail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '详细地址',
  `delete_time` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL COMMENT '外键',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_address
-- ----------------------------
INSERT INTO `user_address` VALUES (37, 'rock', '15017405329', NULL, NULL, '中国', '模压顶戴', NULL, 60, NULL);

SET FOREIGN_KEY_CHECKS = 1;
