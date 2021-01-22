/*
 Navicat Premium Data Transfer

 Source Server         : mall
 Source Server Type    : MySQL
 Source Server Version : 50509
 Source Host           : 192.168.75.99:3307
 Source Schema         : pc_baidu_mall

 Target Server Type    : MySQL
 Target Server Version : 50509
 File Encoding         : 65001

 Date: 22/01/2021 15:21:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ti_ladder
-- ----------------------------
DROP TABLE IF EXISTS `ti_ladder`;
CREATE TABLE `ti_ladder`  (
  `ladder_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '天梯图ID',
  `ladder_title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '天梯图标题',
  `category_id` bigint(20) UNSIGNED NOT NULL COMMENT '小类ID',
  `relevant_cid` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '关联小类ID',
  `param_item_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数项名称',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '状态 -1：禁用 1：正常',
  `create_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ladder_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '天梯图表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ti_ladder_brand
-- ----------------------------
DROP TABLE IF EXISTS `ti_ladder_brand`;
CREATE TABLE `ti_ladder_brand`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `brand_id` bigint(20) UNSIGNED NOT NULL COMMENT '品牌ID',
  `brand_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `brand_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '品牌LOGO',
  `ladder_id` bigint(20) UNSIGNED NOT NULL COMMENT '天梯图ID',
  `sort` int(11) NULL DEFAULT 99 COMMENT '排序',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '状态 -1：禁用 1：正常',
  `create_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '天梯图-品牌表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ti_ladder_option
-- ----------------------------
DROP TABLE IF EXISTS `ti_ladder_option`;
CREATE TABLE `ti_ladder_option`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `option_id` bigint(20) UNSIGNED NOT NULL COMMENT '筛选项ID',
  `option_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '筛选项名称',
  `ladder_id` bigint(20) UNSIGNED NOT NULL COMMENT '天梯图ID',
  `sort` int(11) NULL DEFAULT 99 COMMENT '排序',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '状态 -1：禁用 1：正常',
  `create_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '天梯图-筛选项表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ti_ladder_product
-- ----------------------------
DROP TABLE IF EXISTS `ti_ladder_product`;
CREATE TABLE `ti_ladder_product`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ladder_id` bigint(20) UNSIGNED NOT NULL COMMENT '天梯图ID',
  `product_id` bigint(20) UNSIGNED NOT NULL COMMENT '产品ID',
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `option_id` bigint(20) UNSIGNED NOT NULL COMMENT '筛选项ID',
  `brand_id` bigint(20) NOT NULL COMMENT '品牌ID',
  `brand_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '品牌名称 - 冗余字段',
  `score` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '分值',
  `param_item_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数项值',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '状态 -1：隐藏 1：显示',
  `create_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '天梯图-产品表' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
