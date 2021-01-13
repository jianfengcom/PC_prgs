CREATE TABLE `ti_ladder` (
  `ladder_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '天梯图ID',
  `ladder_title` varchar(200) DEFAULT NULL COMMENT '天梯图标题',
  `category_id` bigint(20) unsigned NOT NULL COMMENT '小类ID',
  `relevant_cid` bigint(20) unsigned NOT NULL COMMENT '关联小类ID',
  `param_item_key` varchar(50) DEFAULT NULL COMMENT '参数项名称',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态 -1：禁用 1：正常',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(45) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(45) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`ladder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='天梯图表';

CREATE TABLE `ti_ladder_product` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `ladder_id` bigint(20) unsigned NOT NULL COMMENT '天梯图ID',
  `product_id` bigint(20) unsigned NOT NULL COMMENT '产品ID',
  `option_id` bigint(20) unsigned NOT NULL COMMENT '筛选项ID',
  `brand_id` bigint(20) NOT NULL COMMENT '品牌ID - 冗余字段',
  `brand_name` varchar(255) DEFAULT NULL COMMENT '品牌名称 - 冗余字段',
  `score` int(11) unsigned DEFAULT NULL COMMENT '分值',
  `param_item_value` varchar(100) DEFAULT NULL COMMENT '参数项值',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态 0：隐藏 1：显示',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(45) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(45) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='天梯图-产品表';

CREATE TABLE `ti_ladder_option` (
  `option_id` bigint(20) unsigned NOT NULL COMMENT '筛选项ID',
  `option_name` varchar(100) DEFAULT NULL COMMENT '筛选项名称',
  `ladder_id` bigint(20) unsigned NOT NULL COMMENT '天梯图ID',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态 -1：禁用 1：正常',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(45) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(45) DEFAULT NULL COMMENT '更新人'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='天梯图-筛选项表';