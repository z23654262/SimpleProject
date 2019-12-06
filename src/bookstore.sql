/*
 Navicat Premium Data Transfer

 Source Server         : happy_red_yang
 Source Server Type    : MySQL
 Source Server Version : 50639
 Source Host           : localhost:3306
 Source Schema         : bookstore

 Target Server Type    : MySQL
 Target Server Version : 50639
 File Encoding         : 65001

 Date: 06/12/2019 09:19:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bookstore_cart
-- ----------------------------
DROP TABLE IF EXISTS `bookstore_cart`;
CREATE TABLE `bookstore_cart`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `available` int(10) DEFAULT NULL,
  `num` int(10) DEFAULT NULL,
  `create_date` datetime(0) DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bookstore_cart
-- ----------------------------
INSERT INTO `bookstore_cart` VALUES ('0951e475-6e5c-4e5b-87ce-f2a26e0f5fa6', 'f4953896-550a-472d-88e4-5d4230c53350', '56779b5e-f936-4822-a11b-c85c3404980d', 0, 5, '2019-11-18 21:18:01', '2019-11-18 21:18:10');
INSERT INTO `bookstore_cart` VALUES ('146b1356-32ed-4e80-ba36-1d2af51ffbc1', '40c8769f-8828-42cd-9a43-b853673b8a19', '56779b5e-f936-4822-a11b-c85c3404980d', 0, 20, '2019-11-17 13:44:06', '2019-11-17 13:44:14');
INSERT INTO `bookstore_cart` VALUES ('44f07446-f7c2-4b78-a485-cf3054cf6d0d', '91cfab0e-34a2-46f4-a112-a173d8533693', '56779b5e-f936-4822-a11b-c85c3404980d', 0, 159, '2019-11-17 14:07:09', '2019-11-17 14:07:13');
INSERT INTO `bookstore_cart` VALUES ('56a81920-e679-47ff-88db-0e278b23afc6', '40c8769f-8828-42cd-9a43-b853673b8a19', '56779b5e-f936-4822-a11b-c85c3404980d', 0, 1, '2019-11-15 18:48:26', '2019-11-17 12:11:31');
INSERT INTO `bookstore_cart` VALUES ('5efc43d6-7233-449a-9bda-3466ecf15dcf', '36066b22-c900-4c8b-8ffa-1e17f229eb5a', '56779b5e-f936-4822-a11b-c85c3404980d', 0, 6, '2019-11-20 09:23:29', '2019-11-20 09:46:43');
INSERT INTO `bookstore_cart` VALUES ('7e8f81a6-7eb9-41e0-ad8f-0e1807420187', '91cfab0e-34a2-46f4-a112-a173d85693', '56779b5e-f936-4822-a11b-c85c3404980d', 0, 1, '2019-11-18 11:02:39', '2019-11-18 11:03:05');
INSERT INTO `bookstore_cart` VALUES ('94e36532-1ef2-4492-8016-6e3a7bab5434', '91cfab0e-34a2-46f4-a112-a173d85693', '56779b5e-f936-4822-a11b-c85c3404980d', 0, 2, '2019-11-17 12:15:04', '2019-11-17 12:15:15');
INSERT INTO `bookstore_cart` VALUES ('9651db36-50ee-4c98-b500-e311e077102f', '7662b48e-fce7-4c84-ab79-2cbdcbfafd93', '56779b5e-f936-4822-a11b-c85c3404980d', 0, 3, '2019-11-18 21:10:29', '2019-11-18 21:10:32');
INSERT INTO `bookstore_cart` VALUES ('9a42ede2-a8c9-4a54-be96-092610c9534f', '40c8769f-8828-42cd-9a43-b853673b8a19', '56779b5e-f936-4822-a11b-c85c3404980d', 0, 2, '2019-11-17 12:15:10', '2019-11-17 12:15:15');
INSERT INTO `bookstore_cart` VALUES ('eaaebce3-65f8-42ff-9554-5d6be2afa156', '40c8769f-8828-42cd-9a43-b853673b8a19', '56779b5e-f936-4822-a11b-c85c3404980d', 0, 5, '2019-11-18 11:20:20', '2019-11-18 11:20:23');
INSERT INTO `bookstore_cart` VALUES ('efa497b0-9303-4a53-a07e-96c728117a8d', '91cfab0e-34a2-46f4-a112-a173d85693', '56779b5e-f936-4822-a11b-c85c3404980d', 0, 1, '2019-11-18 20:45:53', '2019-11-18 20:45:58');

-- ----------------------------
-- Table structure for bookstore_category
-- ----------------------------
DROP TABLE IF EXISTS `bookstore_category`;
CREATE TABLE `bookstore_category`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_date` datetime(0) DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bookstore_category
-- ----------------------------
INSERT INTO `bookstore_category` VALUES ('041c194a-5ae1-4eef-895c-2dd454d5a190', '小说', '2019-11-18 21:04:40', '2019-11-18 21:04:40');
INSERT INTO `bookstore_category` VALUES ('23608ef9-d4f7-4be6-b201-fc342157f920', '考试资料', '2019-11-18 21:04:32', '2019-11-18 21:04:37');
INSERT INTO `bookstore_category` VALUES ('73710031-358b-47bd-af13-a8a09c0b73c4', '前端', '2019-11-18 21:04:16', '2019-11-18 21:04:16');
INSERT INTO `bookstore_category` VALUES ('b839c9c1-a6ea-4b19-a907-881b98410974', '漫画', '2019-11-18 21:07:20', '2019-11-18 21:07:20');
INSERT INTO `bookstore_category` VALUES ('f67c4c22-7a2d-4e98-b808-40ea1ef3cd09', '后端', '2019-11-18 21:04:22', '2019-11-18 21:04:22');

-- ----------------------------
-- Table structure for bookstore_order
-- ----------------------------
DROP TABLE IF EXISTS `bookstore_order`;
CREATE TABLE `bookstore_order`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `money` double(10, 2) DEFAULT NULL,
  `receive_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `receive_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `receive_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pay_status` int(11) DEFAULT 0,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_date` datetime(0) DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKel9kyl84ego2otj2accfd8mr7`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bookstore_order
-- ----------------------------
INSERT INTO `bookstore_order` VALUES ('3721f243-154c-48bf-8eac-5a1e38018b70', 142.50, '河南省', '张帅飞', '18768897618', 1, '56779b5e-f936-4822-a11b-c85c3404980d', '2019-11-18 21:18:10', '2019-11-18 21:31:20');
INSERT INTO `bookstore_order` VALUES ('a3845e2a-2f28-4f0c-be18-49e54fa6958a', 204.00, '河南省', '张帅飞', '18768897618', 1, '56779b5e-f936-4822-a11b-c85c3404980d', '2019-11-20 09:46:43', '2019-11-20 09:47:42');
INSERT INTO `bookstore_order` VALUES ('b4a399b9-582a-4480-8c48-76437fb7d2e2', 113.40, '河南省', '张帅飞', '18768897618', 1, '56779b5e-f936-4822-a11b-c85c3404980d', '2019-11-18 21:10:32', '2019-11-18 21:10:44');

-- ----------------------------
-- Table structure for bookstore_order_item
-- ----------------------------
DROP TABLE IF EXISTS `bookstore_order_item`;
CREATE TABLE `bookstore_order_item`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `product_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `buy_num` int(10) DEFAULT NULL,
  `create_date` datetime(0) DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK551losx9j75ss5d6bfsqvijna`(`product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bookstore_order_item
-- ----------------------------
INSERT INTO `bookstore_order_item` VALUES ('23840174-d81f-4206-9ed0-46bf6eaa73e7', '7662b48e-fce7-4c84-ab79-2cbdcbfafd93', 'b4a399b9-582a-4480-8c48-76437fb7d2e2', 3, '2019-11-18 21:10:32', '2019-11-18 21:10:32');
INSERT INTO `bookstore_order_item` VALUES ('cdedccfc-af6c-470b-8a72-da9f5379c13f', '36066b22-c900-4c8b-8ffa-1e17f229eb5a', 'a3845e2a-2f28-4f0c-be18-49e54fa6958a', 6, '2019-11-20 09:46:43', '2019-11-20 09:46:43');
INSERT INTO `bookstore_order_item` VALUES ('dfd29c1c-0862-47e6-b67c-493e8ec80a5a', 'f4953896-550a-472d-88e4-5d4230c53350', '3721f243-154c-48bf-8eac-5a1e38018b70', 5, '2019-11-18 21:18:10', '2019-11-18 21:18:10');

-- ----------------------------
-- Table structure for bookstore_product
-- ----------------------------
DROP TABLE IF EXISTS `bookstore_product`;
CREATE TABLE `bookstore_product`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `writer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `price` double(10, 2) DEFAULT NULL,
  `category_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `store_num` int(11) DEFAULT NULL,
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_date` datetime(0) DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bookstore_product
-- ----------------------------
INSERT INTO `bookstore_product` VALUES ('0c4f6108-fa1c-4579-908b-6504da916ccd', '星火英语', '星火英语', 100.50, '23608ef9-d4f7-4be6-b201-fc342157f920', 2, '/productImg/1d286be4-06eb-4f10-aed8-eb8b0728a56b.jpg', '星火英语', '2019-11-18 21:14:33', '2019-11-18 21:14:33');
INSERT INTO `bookstore_product` VALUES ('21289f18-0a24-4630-a546-3c57403c09ab', 'Vue.js实战手册', '尤雨溪', 62.40, '73710031-358b-47bd-af13-a8a09c0b73c4', 50, '/productImg/43ed7886-470c-4735-9462-94ddbc92e64d.jpg', 'Vue.js作者尤雨溪作推荐序，业界前端大腕(TalkingData 研发副总裁,马骥;w3cplus.com站长,大漠;在线回声前端技术专家,justjavac（迷渡）;laravel-china.org站长,Summer)联袂推荐！ Vue社区iView组件贡献者，前端大神梁灏执笔', '2019-11-18 21:05:11', '2019-11-18 21:05:11');
INSERT INTO `bookstore_product` VALUES ('36066b22-c900-4c8b-8ffa-1e17f229eb5a', 'JavaWeb程序设计基础', '重庆大学出版社', 34.00, 'f67c4c22-7a2d-4e98-b808-40ea1ef3cd09', 123, '/productImg/2c678a8f-2172-4084-8567-4560b3f2c435.jpg', 'JavaWeb程序设计', '2019-11-18 21:06:18', '2019-11-18 21:06:18');
INSERT INTO `bookstore_product` VALUES ('4d4bffd9-5e39-4f67-9e55-74e81c14f883', '深入浅出node.js', '朴灵', 54.50, '73710031-358b-47bd-af13-a8a09c0b73c4', 50, '/productImg/973c1792-aefe-4f6a-9cee-746821550d36.jpg', '**本深度讲解Node的图书 源码级别探寻过Node的实现原理 *一线Node开发者*真实的经验', '2019-11-18 21:13:18', '2019-11-18 21:13:18');
INSERT INTO `bookstore_product` VALUES ('7662b48e-fce7-4c84-ab79-2cbdcbfafd93', '罗小黑战记', 'MTJJ', 37.80, 'b839c9c1-a6ea-4b19-a907-881b98410974', 123, '/productImg/d7cf9480-ce26-440d-a1cf-644e98d5f877.jpg', '划时代的国民级动画！亡命天涯，卖萌为生，中国独立动画制作人MTJJ诚意出品！网站众筹近三十万，动画视频点击过亿！读客熊猫君出品', '2019-11-18 21:08:13', '2019-11-18 21:08:13');
INSERT INTO `bookstore_product` VALUES ('f4953896-550a-472d-88e4-5d4230c53350', '边城', '沈从文', 28.50, '041c194a-5ae1-4eef-895c-2dd454d5a190', 2, '/productImg/6dc46f87-6a83-42d4-bc71-661ae66edd6c.jpg', '沈从文小说精粹（一曲爱与美的田园牧歌）', '2019-11-18 21:09:47', '2019-11-18 21:09:47');

-- ----------------------------
-- Table structure for bookstore_user
-- ----------------------------
DROP TABLE IF EXISTS `bookstore_user`;
CREATE TABLE `bookstore_user`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '普通用户',
  `create_date` datetime(0) DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bookstore_user
-- ----------------------------
INSERT INTO `bookstore_user` VALUES ('1', '1', '2', '888', '4', NULL, 'normal', '2019-11-13 16:22:57', '2019-11-14 10:21:12');
INSERT INTO `bookstore_user` VALUES ('50fa32dd-95ba-455c-9677-68cfe08dbd5c', 'z93478462', 'zsf12345', '1119716380@qq.com', '13592656805', NULL, 'normal', '2019-11-13 13:53:48', '2019-11-13 13:53:48');
INSERT INTO `bookstore_user` VALUES ('56779b5e-f936-4822-a11b-c85c3404980d', 'RainBow', 'zsf12345', '1119716380@qq.com', '18768897618', '/userImg/fafcf980-70fc-450c-95aa-dd59aa62a481.png', 'normal', '2019-11-06 12:30:29', '2019-11-14 17:11:15');
INSERT INTO `bookstore_user` VALUES ('admin', 'admin', 'admin', 'admin', 'admin', '/userImg/c1f242ac-cccb-424c-89a5-539d0c69defb.jpg', 'admin', '2019-11-06 12:29:05', '2019-11-15 18:34:23');
INSERT INTO `bookstore_user` VALUES ('d84a6a82-2dea-4318-8a40-74508eab5ad3', 'RainBow', 'zsf12345', '2913774719@qq.com', '1356666', '/userImg/95a17258-3e13-4fab-9d96-47fe012006f1.jpg', 'normal', '2019-11-14 13:59:51', '2019-11-14 17:11:48');

SET FOREIGN_KEY_CHECKS = 1;
