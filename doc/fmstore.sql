/*
Navicat MySQL Data Transfer

Source Server         : myxq
Source Server Version : 80016
Source Host           : localhost:3306
Source Database       : fmstore

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2019-09-03 22:39:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_address
-- ----------------------------
DROP TABLE IF EXISTS `tb_address`;
CREATE TABLE `tb_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `province_id` varchar(10) DEFAULT NULL COMMENT '省',
  `city_id` varchar(10) DEFAULT NULL COMMENT '市',
  `town_id` varchar(10) DEFAULT NULL COMMENT '县/区',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `contact` varchar(255) DEFAULT NULL COMMENT '联系人',
  `is_default` varchar(1) DEFAULT NULL COMMENT '是否是默认 1默认 0否',
  `notes` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `alias` varchar(50) DEFAULT NULL COMMENT '别名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_address
-- ----------------------------
INSERT INTO `tb_address` VALUES ('59', 'gaowei', '410000', '410500', null, '13900112222', '上海*****科技有限公司', 'gaowei', '0', null, null, null);
INSERT INTO `tb_address` VALUES ('60', 'gaowei', '410000', '410500', null, '13700221122', '南京大学', 'myxq', '1', null, null, null);

-- ----------------------------
-- Table structure for tb_brand
-- ----------------------------
DROP TABLE IF EXISTS `tb_brand`;
CREATE TABLE `tb_brand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '品牌名称',
  `first_char` varchar(1) DEFAULT NULL COMMENT '品牌首字母',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_brand
-- ----------------------------
INSERT INTO `tb_brand` VALUES ('1', '联想123456', 'L');
INSERT INTO `tb_brand` VALUES ('2', '华为', 'H');
INSERT INTO `tb_brand` VALUES ('3', '三星', 'S');
INSERT INTO `tb_brand` VALUES ('4', '小米', 'X');
INSERT INTO `tb_brand` VALUES ('5', 'OPPO', 'O');
INSERT INTO `tb_brand` VALUES ('6', '360', 'S');
INSERT INTO `tb_brand` VALUES ('7', '中兴', 'Z');
INSERT INTO `tb_brand` VALUES ('8', '魅族', 'M');
INSERT INTO `tb_brand` VALUES ('9', '苹果', 'P');
INSERT INTO `tb_brand` VALUES ('10', 'VIVO', 'V');
INSERT INTO `tb_brand` VALUES ('11', '诺基亚', 'N');
INSERT INTO `tb_brand` VALUES ('12', '锤子', 'C');
INSERT INTO `tb_brand` VALUES ('13', '长虹', 'C');
INSERT INTO `tb_brand` VALUES ('14', '海尔', 'H');
INSERT INTO `tb_brand` VALUES ('15', '飞利浦', 'F');
INSERT INTO `tb_brand` VALUES ('16', 'TCL', 'T');
INSERT INTO `tb_brand` VALUES ('17', '海信', 'H');
INSERT INTO `tb_brand` VALUES ('18', '夏普', 'X');
INSERT INTO `tb_brand` VALUES ('19', '创维', 'C');
INSERT INTO `tb_brand` VALUES ('20', '东芝', 'D');
INSERT INTO `tb_brand` VALUES ('21', '康佳', 'K');

-- ----------------------------
-- Table structure for tb_content
-- ----------------------------
DROP TABLE IF EXISTS `tb_content`;
CREATE TABLE `tb_content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NOT NULL COMMENT '内容类目ID',
  `title` varchar(200) DEFAULT NULL COMMENT '内容标题',
  `url` varchar(500) DEFAULT NULL COMMENT '链接',
  `pic` varchar(300) DEFAULT NULL COMMENT '图片绝对路径',
  `status` varchar(1) DEFAULT NULL COMMENT '状态',
  `sort_order` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_content
-- ----------------------------
INSERT INTO `tb_content` VALUES ('17', '1', 'newAdd1234', 'http://www.baidu.com', 'http://192.168.1.88/group1/M00/00/00/wKgBWF1ZUw-AdjI-AAEQrlUJcaE378.jpg', '0', '2');
INSERT INTO `tb_content` VALUES ('18', '1', 'aa', 'http://www.baidu.com', 'http://192.168.1.88/group1/M00/00/00/wKgBWF1ZVxaAN7GvAAFyVK2N7Ig991.jpg', null, '1');
INSERT INTO `tb_content` VALUES ('19', '1', 'bb', 'http://www.baidu.com', 'http://192.168.1.88/group1/M00/00/00/wKgBWF1ZV1SABmDeAAI9aEqEI3I858.png', null, '1');

-- ----------------------------
-- Table structure for tb_content_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_content_category`;
CREATE TABLE `tb_content_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '类目ID',
  `name` varchar(50) DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='内容分类';

-- ----------------------------
-- Records of tb_content_category
-- ----------------------------
INSERT INTO `tb_content_category` VALUES ('1', '首页轮播广告');
INSERT INTO `tb_content_category` VALUES ('2', '今日推荐');
INSERT INTO `tb_content_category` VALUES ('3', '活动专区');
INSERT INTO `tb_content_category` VALUES ('4', '发现好货');
INSERT INTO `tb_content_category` VALUES ('6', '生活百货');

-- ----------------------------
-- Table structure for tb_goods
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods`;
CREATE TABLE `tb_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `seller_id` varchar(20) DEFAULT NULL COMMENT '商家ID',
  `goods_name` varchar(100) DEFAULT NULL COMMENT 'SPU名',
  `default_item_id` bigint(20) DEFAULT NULL COMMENT '默认SKU',
  `audit_status` varchar(2) DEFAULT NULL COMMENT '状态',
  `is_marketable` varchar(1) DEFAULT NULL COMMENT '是否上架',
  `brand_id` bigint(10) DEFAULT NULL COMMENT '品牌',
  `caption` varchar(100) DEFAULT NULL COMMENT '副标题',
  `category1_id` bigint(20) DEFAULT NULL COMMENT '一级类目',
  `category2_id` bigint(10) DEFAULT NULL COMMENT '二级类目',
  `category3_id` bigint(10) DEFAULT NULL COMMENT '三级类目',
  `small_pic` varchar(150) DEFAULT NULL COMMENT '小图',
  `price` decimal(10,2) DEFAULT NULL COMMENT '商城价',
  `type_template_id` bigint(20) DEFAULT NULL COMMENT '分类模板ID',
  `is_enable_spec` varchar(1) DEFAULT NULL COMMENT '是否启用规格',
  `is_delete` varchar(1) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149187842867994 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_goods
-- ----------------------------
INSERT INTO `tb_goods` VALUES ('149187842867982', 'fmjava', 'new商品名称1234555', null, '2', null, '2', '副标题3232', '1', '2', '3', null, '23.00', '44', '1', '0');
INSERT INTO `tb_goods` VALUES ('149187842867983', 'myxq', '荣耀V20', null, '2', null, '2', 'aasdfa', '1', '2', '5', null, '1232.00', '45', '1', '0');
INSERT INTO `tb_goods` VALUES ('149187842867984', 'fmjava', 'fmjavaGoods', null, '2', null, '4', '副标题123', '1', '2', '3', null, '123.00', '44', '1', null);
INSERT INTO `tb_goods` VALUES ('149187842867985', 'fmjava', 'fmjavaGoods', null, '2', null, '4', '副标题123', '1', '2', '3', null, '123.00', '44', '1', null);
INSERT INTO `tb_goods` VALUES ('149187842867986', 'fmjava', 'fmjavaGoods', null, '2', null, '4', '副标题123', '1', '2', '3', null, '123.00', '44', '1', null);
INSERT INTO `tb_goods` VALUES ('149187842867987', 'fmjava', 'newGoodsName', null, '0', null, '2', 'newGoodsName副标题', '1', '2', '3', null, '121.00', '44', '1', '1');
INSERT INTO `tb_goods` VALUES ('149187842867988', 'fmjava', 'Redmi Note7', null, '2', null, '4', 'Redmi Note7 副标题', '558', '559', '560', null, '999.00', '44', '1', null);
INSERT INTO `tb_goods` VALUES ('149187842867989', 'fmjava', '小米6X', null, '2', null, '4', '移动联通电信4G手机', '558', '559', '560', null, '880.00', '44', '1', null);
INSERT INTO `tb_goods` VALUES ('149187842867990', 'fmjava', '小米手机', null, '2', null, '4', '小米CC9', '558', '559', '560', null, '2000.00', '44', '1', null);
INSERT INTO `tb_goods` VALUES ('149187842867991', 'fmjava', '红米Redmi', null, '2', null, '4', '红米Redmi', '558', '559', '560', null, '1111.00', '44', '1', null);
INSERT INTO `tb_goods` VALUES ('149187842867992', 'fmjava', '小米cc9手机', null, '0', null, '4', '小米cc9手机', '558', '559', '560', null, '1111.00', '44', '1', '1');
INSERT INTO `tb_goods` VALUES ('149187842867993', 'myxq', 'Spring', null, '2', null, '1', '1234', '1', '2', '5', null, '11.00', '45', '1', '0');

-- ----------------------------
-- Table structure for tb_goods_desc
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods_desc`;
CREATE TABLE `tb_goods_desc` (
  `goods_id` bigint(20) NOT NULL COMMENT 'SPU_ID',
  `introduction` varchar(3000) DEFAULT NULL COMMENT '描述',
  `specification_items` varchar(3000) DEFAULT NULL COMMENT '规格结果集，所有规格，包含isSelected',
  `custom_attribute_items` varchar(3000) DEFAULT NULL COMMENT '自定义属性（参数结果）',
  `item_images` varchar(3000) DEFAULT NULL,
  `package_list` varchar(3000) DEFAULT NULL COMMENT '包装列表',
  `sale_service` varchar(3000) DEFAULT NULL COMMENT '售后服务',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_goods_desc
-- ----------------------------
INSERT INTO `tb_goods_desc` VALUES ('149187842867982', '<h1 style=\"border-bottom-color:#cccccc;border-bottom-width:2px;border-bottom-style:solid;padding:0px 4px 0px 0px;margin:0px 0px 10px;\"><span style=\"color:#e36c09;\" class=\"ue_t\">[此处键入简历标题]</span></h1><p><span style=\"color:#e36c09;\"><br/></span></p><table width=\"100%\" border=\"1\" style=\"border-collapse:collapse;\"><tbody><tr class=\"firstRow\"><td width=\"200\" style=\"text-align:center;\" class=\"ue_t\">【此处插入照片】</td><td><p><br/></p><p>联系电话：<span class=\"ue_t\">[键入您的电话]</span></p><p><br/></p><p>电子邮件：<span class=\"ue_t\">[键入您的电子邮件地址]</span></p><p><br/></p><p>家庭住址：<span class=\"ue_t\">[键入您的地址]</span></p><p><br/></p></td></tr></tbody></table><h3><span style=\"color:#e36c09;font-size:20px;\">目标职位</span></h3><p style=\"text-indent:2em;\" class=\"ue_t\">[此处键入您的期望职位]</p><h3><span style=\"color:#e36c09;font-size:20px;\">学历</span></h3><p><span style=\"display:none;line-height:0px;\">﻿</span></p><ol style=\"list-style-type: decimal;\" class=\" list-paddingleft-2\"><li><p><span class=\"ue_t\">[键入起止时间]</span> <span class=\"ue_t\">[键入学校名称] </span> <span class=\"ue_t\">[键入所学专业]</span> <span class=\"ue_t\">[键入所获学位]</span></p></li><li><p><span class=\"ue_t\">[键入起止时间]</span> <span class=\"ue_t\">[键入学校名称]</span> <span class=\"ue_t\">[键入所学专业]</span> <span class=\"ue_t\">[键入所获学位]</span></p></li></ol><h3><span style=\"color:#e36c09;font-size:20px;\" class=\"ue_t\">工作经验</span></h3><ol style=\"list-style-type: decimal;\" class=\" list-paddingleft-2\"><li><p><span class=\"ue_t\">[键入起止时间]</span> <span class=\"ue_t\">[键入公司名称]</span> <span class=\"ue_t\">[键入职位名称]</span></p></li><ol style=\"list-style-type: lower-alpha;\" class=\" list-paddingleft-2\"><li><p><span class=\"ue_t\">[键入负责项目]</span> <span class=\"ue_t\">[键入项目简介]</span></p></li><li><p><span class=\"ue_t\">[键入负责项目]</span> <span class=\"ue_t\">[键入项目简介]</span></p></li></ol><li><p><span class=\"ue_t\">[键入起止时间]</span> <span class=\"ue_t\">[键入公司名称]</span> <span class=\"ue_t\">[键入职位名称]</span></p></li><ol style=\"list-style-type: lower-alpha;\" class=\" list-paddingleft-2\"><li><p><span class=\"ue_t\">[键入负责项目]</span> <span class=\"ue_t\">[键入项目简介]</span></p></li></ol></ol><p><span style=\"color:#e36c09;font-size:20px;\">掌握技能</span></p><p style=\"text-indent:2em;\">&nbsp;<span class=\"ue_t\">[这里可以键入您所掌握的技能]</span><br/></p><p><br/></p>', '[{\"specOptions\":[\"秘境黑\"],\"specName\":\"选择颜色\"},{\"specOptions\":[\"6G+64G\"],\"specName\":\"选择版本\"}]', null, '[{\"color\":\"red\",\"url\":\"http://img13.360buyimg.com/n1/s450x450_jfs/t1/16446/33/13283/339849/5c9eca5bE06fce1b2/500f99a976998161.jpg\"}]', null, null);
INSERT INTO `tb_goods_desc` VALUES ('149187842867983', '<p><img src=\"http://192.168.1.88/group1/M00/00/00/wKgBWF1VHeWAFSwZAALigPL0nQI443.jpg\" title=\"Mybatis详情介绍.jpg\" alt=\"Mybatis详情介绍.jpg\"/></p>', '[{\"specOptions\":[\"6G+64G\",\"8G+128G\"],\"specName\":\"选择版本\"},{\"specOptions\":[\"秘境黑\"],\"specName\":\"选择颜色\"}]', null, '[{\"color\":\"1212\",\"url\":\"http://192.168.1.88/group1/M00/00/00/wKgBWF1VHfSANHCvAAHbm_qO8Tc887.png\"}]', null, null);
INSERT INTO `tb_goods_desc` VALUES ('149187842867984', '<h1 style=\"border-bottom-color:#cccccc;border-bottom-width:2px;border-bottom-style:solid;padding:0px 4px 0px 0px;margin:0px 0px 10px;\"><span style=\"color:#e36c09;\" class=\"ue_t\">[此处键入简历标题]</span></h1><p><span style=\"color:#e36c09;\"><br/></span></p><table width=\"100%\" border=\"1\" style=\"border-collapse:collapse;\"><tbody><tr class=\"firstRow\"><td width=\"200\" style=\"text-align:center;\" class=\"ue_t\">【此处插入照片】</td><td><p><br/></p><p>联系电话：<span class=\"ue_t\">[键入您的电话]</span></p><p><br/></p><p>电子邮件：<span class=\"ue_t\">[键入您的电子邮件地址]</span></p><p><br/></p><p>家庭住址：<span class=\"ue_t\">[键入您的地址]</span></p><p><br/></p></td></tr></tbody></table><h3><span style=\"color:#e36c09;font-size:20px;\">目标职位</span></h3><p style=\"text-indent:2em;\" class=\"ue_t\">[此处键入您的期望职位]</p><h3><span style=\"color:#e36c09;font-size:20px;\">学历</span></h3><p><span style=\"display:none;line-height:0px;\">﻿</span></p><ol style=\"list-style-type: decimal;\" class=\" list-paddingleft-2\"><li><p><span class=\"ue_t\">[键入起止时间]</span> <span class=\"ue_t\">[键入学校名称] </span> <span class=\"ue_t\">[键入所学专业]</span> <span class=\"ue_t\">[键入所获学位]</span></p></li><li><p><span class=\"ue_t\">[键入起止时间]</span> <span class=\"ue_t\">[键入学校名称]</span> <span class=\"ue_t\">[键入所学专业]</span> <span class=\"ue_t\">[键入所获学位]</span></p></li></ol><h3><span style=\"color:#e36c09;font-size:20px;\" class=\"ue_t\">工作经验</span></h3><ol style=\"list-style-type: decimal;\" class=\" list-paddingleft-2\"><li><p><span class=\"ue_t\">[键入起止时间]</span> <span class=\"ue_t\">[键入公司名称]</span> <span class=\"ue_t\">[键入职位名称]</span></p></li><ol style=\"list-style-type: lower-alpha;\" class=\" list-paddingleft-2\"><li><p><span class=\"ue_t\">[键入负责项目]</span> <span class=\"ue_t\">[键入项目简介]</span></p></li><li><p><span class=\"ue_t\">[键入负责项目]</span> <span class=\"ue_t\">[键入项目简介]</span></p></li></ol><li><p><span class=\"ue_t\">[键入起止时间]</span> <span class=\"ue_t\">[键入公司名称]</span> <span class=\"ue_t\">[键入职位名称]</span></p></li><ol style=\"list-style-type: lower-alpha;\" class=\" list-paddingleft-2\"><li><p><span class=\"ue_t\">[键入负责项目]</span> <span class=\"ue_t\">[键入项目简介]</span></p></li></ol></ol><p><span style=\"color:#e36c09;font-size:20px;\">掌握技能</span></p><p style=\"text-indent:2em;\">&nbsp;<span class=\"ue_t\">[这里可以键入您所掌握的技能]</span><br/></p><p><br/></p>', '[{\"specName\":\"选择颜色\",\"specOptions\":[\"秘境黑\",\"星云紫\"]},{\"specName\":\"选择版本\",\"specOptions\":[\"6G+64G\"]},{\"specName\":\"套餐\",\"specOptions\":[\"优惠套餐1\"]}]', null, '[{\"color\":\"red\",\"url\":\"http://192.168.1.88/group1/M00/00/00/wKgBWF1VasKAIqs9AAEIiy6Nc04483.jpg\"},{\"color\":\"w\",\"url\":\"http://192.168.1.88/group1/M00/00/00/wKgBWF1VatCASuUYAAESHDHrMYs449.jpg\"}]', null, null);
INSERT INTO `tb_goods_desc` VALUES ('149187842867985', '<h1 style=\"border-bottom-color:#cccccc;border-bottom-width:2px;border-bottom-style:solid;padding:0px 4px 0px 0px;margin:0px 0px 10px;\"><span style=\"color:#e36c09;\" class=\"ue_t\">[此处键入简历标题]</span></h1><p><span style=\"color:#e36c09;\"><br/></span></p><table width=\"100%\" border=\"1\" style=\"border-collapse:collapse;\"><tbody><tr class=\"firstRow\"><td width=\"200\" style=\"text-align:center;\" class=\"ue_t\">【此处插入照片】</td><td><p><br/></p><p>联系电话：<span class=\"ue_t\">[键入您的电话]</span></p><p><br/></p><p>电子邮件：<span class=\"ue_t\">[键入您的电子邮件地址]</span></p><p><br/></p><p>家庭住址：<span class=\"ue_t\">[键入您的地址]</span></p><p><br/></p></td></tr></tbody></table><h3><span style=\"color:#e36c09;font-size:20px;\">目标职位</span></h3><p style=\"text-indent:2em;\" class=\"ue_t\">[此处键入您的期望职位]</p><h3><span style=\"color:#e36c09;font-size:20px;\">学历</span></h3><p><span style=\"display:none;line-height:0px;\">﻿</span></p><ol style=\"list-style-type: decimal;\" class=\" list-paddingleft-2\"><li><p><span class=\"ue_t\">[键入起止时间]</span> <span class=\"ue_t\">[键入学校名称] </span> <span class=\"ue_t\">[键入所学专业]</span> <span class=\"ue_t\">[键入所获学位]</span></p></li><li><p><span class=\"ue_t\">[键入起止时间]</span> <span class=\"ue_t\">[键入学校名称]</span> <span class=\"ue_t\">[键入所学专业]</span> <span class=\"ue_t\">[键入所获学位]</span></p></li></ol><h3><span style=\"color:#e36c09;font-size:20px;\" class=\"ue_t\">工作经验</span></h3><ol style=\"list-style-type: decimal;\" class=\" list-paddingleft-2\"><li><p><span class=\"ue_t\">[键入起止时间]</span> <span class=\"ue_t\">[键入公司名称]</span> <span class=\"ue_t\">[键入职位名称]</span></p></li><ol style=\"list-style-type: lower-alpha;\" class=\" list-paddingleft-2\"><li><p><span class=\"ue_t\">[键入负责项目]</span> <span class=\"ue_t\">[键入项目简介]</span></p></li><li><p><span class=\"ue_t\">[键入负责项目]</span> <span class=\"ue_t\">[键入项目简介]</span></p></li></ol><li><p><span class=\"ue_t\">[键入起止时间]</span> <span class=\"ue_t\">[键入公司名称]</span> <span class=\"ue_t\">[键入职位名称]</span></p></li><ol style=\"list-style-type: lower-alpha;\" class=\" list-paddingleft-2\"><li><p><span class=\"ue_t\">[键入负责项目]</span> <span class=\"ue_t\">[键入项目简介]</span></p></li></ol></ol><p><span style=\"color:#e36c09;font-size:20px;\">掌握技能</span></p><p style=\"text-indent:2em;\">&nbsp;<span class=\"ue_t\">[这里可以键入您所掌握的技能]</span><br/></p><p><br/></p>', '[{\"specName\":\"选择颜色\",\"specOptions\":[\"秘境黑\",\"星云紫\"]},{\"specName\":\"选择版本\",\"specOptions\":[\"6G+64G\"]},{\"specName\":\"套餐\",\"specOptions\":[\"优惠套餐1\"]}]', null, '[{\"color\":\"red\",\"url\":\"http://192.168.1.88/group1/M00/00/00/wKgBWF1VasKAIqs9AAEIiy6Nc04483.jpg\"},{\"color\":\"w\",\"url\":\"http://192.168.1.88/group1/M00/00/00/wKgBWF1VatCASuUYAAESHDHrMYs449.jpg\"}]', null, null);
INSERT INTO `tb_goods_desc` VALUES ('149187842867986', '<h1 style=\"border-bottom-color:#cccccc;border-bottom-width:2px;border-bottom-style:solid;padding:0px 4px 0px 0px;margin:0px 0px 10px;\"><span style=\"color:#e36c09;\" class=\"ue_t\">[此处键入简历标题]</span></h1><p><span style=\"color:#e36c09;\"><br/></span></p><table width=\"100%\" border=\"1\" style=\"border-collapse:collapse;\"><tbody><tr class=\"firstRow\"><td width=\"200\" style=\"text-align:center;\" class=\"ue_t\">【此处插入照片】</td><td><p><br/></p><p>联系电话：<span class=\"ue_t\">[键入您的电话]</span></p><p><br/></p><p>电子邮件：<span class=\"ue_t\">[键入您的电子邮件地址]</span></p><p><br/></p><p>家庭住址：<span class=\"ue_t\">[键入您的地址]</span></p><p><br/></p></td></tr></tbody></table><h3><span style=\"color:#e36c09;font-size:20px;\">目标职位</span></h3><p style=\"text-indent:2em;\" class=\"ue_t\">[此处键入您的期望职位]</p><h3><span style=\"color:#e36c09;font-size:20px;\">学历</span></h3><p><span style=\"display:none;line-height:0px;\">﻿</span></p><ol style=\"list-style-type: decimal;\" class=\" list-paddingleft-2\"><li><p><span class=\"ue_t\">[键入起止时间]</span> <span class=\"ue_t\">[键入学校名称] </span> <span class=\"ue_t\">[键入所学专业]</span> <span class=\"ue_t\">[键入所获学位]</span></p></li><li><p><span class=\"ue_t\">[键入起止时间]</span> <span class=\"ue_t\">[键入学校名称]</span> <span class=\"ue_t\">[键入所学专业]</span> <span class=\"ue_t\">[键入所获学位]</span></p></li></ol><h3><span style=\"color:#e36c09;font-size:20px;\" class=\"ue_t\">工作经验</span></h3><ol style=\"list-style-type: decimal;\" class=\" list-paddingleft-2\"><li><p><span class=\"ue_t\">[键入起止时间]</span> <span class=\"ue_t\">[键入公司名称]</span> <span class=\"ue_t\">[键入职位名称]</span></p></li><ol style=\"list-style-type: lower-alpha;\" class=\" list-paddingleft-2\"><li><p><span class=\"ue_t\">[键入负责项目]</span> <span class=\"ue_t\">[键入项目简介]</span></p></li><li><p><span class=\"ue_t\">[键入负责项目]</span> <span class=\"ue_t\">[键入项目简介]</span></p></li></ol><li><p><span class=\"ue_t\">[键入起止时间]</span> <span class=\"ue_t\">[键入公司名称]</span> <span class=\"ue_t\">[键入职位名称]</span></p></li><ol style=\"list-style-type: lower-alpha;\" class=\" list-paddingleft-2\"><li><p><span class=\"ue_t\">[键入负责项目]</span> <span class=\"ue_t\">[键入项目简介]</span></p></li></ol></ol><p><span style=\"color:#e36c09;font-size:20px;\">掌握技能</span></p><p style=\"text-indent:2em;\">&nbsp;<span class=\"ue_t\">[这里可以键入您所掌握的技能]</span><br/></p><p><br/></p>', '[{\"specName\":\"选择颜色\",\"specOptions\":[\"秘境黑\",\"星云紫\"]},{\"specName\":\"选择版本\",\"specOptions\":[\"6G+64G\"]},{\"specName\":\"套餐\",\"specOptions\":[\"优惠套餐1\"]}]', null, '[{\"color\":\"red\",\"url\":\"http://192.168.1.88/group1/M00/00/00/wKgBWF1VasKAIqs9AAEIiy6Nc04483.jpg\"},{\"color\":\"w\",\"url\":\"http://192.168.1.88/group1/M00/00/00/wKgBWF1VatCASuUYAAESHDHrMYs449.jpg\"}]', null, null);
INSERT INTO `tb_goods_desc` VALUES ('149187842867987', '<p><img src=\"http://192.168.1.88/group1/M00/00/00/wKgBWF1WnSKAGPjpAAI9aEqEI3I715.png\" title=\"ad1.png\" alt=\"ad1.png\"/></p><p>adfadsfasdf</p><p><br/></p>', '[{\"specName\":\"选择颜色\",\"specOption\":[\"秘境黑\",\"星云紫\"]},{\"specName\":\"选择版本\",\"specOption\":[\"6G+64G\",\"8G+128G\"]},{\"specName\":\"套　　餐\",\"specOption\":[\"优惠套餐1\"]}]', null, '[{\"color\":\"white\",\"url\":\"http://192.168.1.88/group1/M00/00/00/wKgBWF1WnUeAT24QAAI9aEqEI3I885.png\"}]', null, null);
INSERT INTO `tb_goods_desc` VALUES ('149187842867988', '<h1 class=\"ue_t\" style=\"border-bottom-color:#cccccc;border-bottom-width:2px;border-bottom-style:solid;padding:0px 4px 0px 0px;text-align:center;margin:0px 0px 20px;\"><span style=\"color:#c0504d;\">[键入文档标题]</span></h1><p style=\"text-align:center;\"><strong class=\"ue_t\">[键入文档副标题]</strong></p><h3><span class=\"ue_t\" style=\"font-family:幼圆\">[标题 1]</span></h3><p class=\"ue_t\" style=\"text-indent:2em;\">对于“插入”选项卡上的库，在设计时都充分考虑了其中的项与文档整体外观的协调性。 您可以使用这些库来插入表格、页眉、页脚、列表、封面以及其他文档构建基块。 您创建的图片、图表或关系图也将与当前的文档外观协调一致。</p><h3><span class=\"ue_t\" style=\"font-family:幼圆\">[标题 2]</span></h3><p class=\"ue_t\" style=\"text-indent:2em;\">在“开始”选项卡上，通过从快速样式库中为所选文本选择一种外观，您可以方便地更改文档中所选文本的格式。 您还可以使用“开始”选项卡上的其他控件来直接设置文本格式。大多数控件都允许您选择是使用当前主题外观，还是使用某种直接指定的格式。</p><h3><span class=\"ue_t\" style=\"font-family:幼圆\">[标题 3]</span></h3><p class=\"ue_t\">对于“插入”选项卡上的库，在设计时都充分考虑了其中的项与文档整体外观的协调性。 您可以使用这些库来插入表格、页眉、页脚、列表、封面以及其他文档构建基块。 您创建的图片、图表或关系图也将与当前的文档外观协调一致。</p><p class=\"ue_t\"><br/></p><p><br/></p>', '[{\"specOptions\":[\"秘境黑\",\"星云紫\",\"晨曦白\"],\"specName\":\"选择颜色\"},{\"specOptions\":[\"6G+64G\",\"8G+128G\",\"8G+256G\"],\"specName\":\"选择版本\"},{\"specOptions\":[\"优惠套餐1\"],\"specName\":\"套餐\"}]', null, '[{\"color\":\"white\",\"url\":\"http://192.168.1.88/group1/M00/00/01/wKgBWF1eK9yAa79NAAI9aEqEI3I759.png\"}]', null, null);
INSERT INTO `tb_goods_desc` VALUES ('149187842867989', '<p><img src=\"http://img.baidu.com/hi/jx2/j_0001.gif\"/></p>', '[{\"specOptions\":[\"晨曦白\",\"星云紫\",\"秘境黑\"],\"specName\":\"选择颜色\"},{\"specOptions\":[\"6G+64G\",\"8G+128G\"],\"specName\":\"选择版本\"},{\"specOptions\":[\"优惠套餐1\",\"优惠套餐2\"],\"specName\":\"套餐\"}}]', null, '[{\"color\":\"white\",\"url\":\"http://192.168.1.88/group1/M00/00/01/wKgBWF1eLkWACILrAAFyVK2N7Ig367.jpg\"}]', null, null);
INSERT INTO `tb_goods_desc` VALUES ('149187842867990', '<h1 style=\"border-bottom-color:#cccccc;border-bottom-width:2px;border-bottom-style:solid;padding:0px 4px 0px 0px;margin:0px 0px 10px;\"><span style=\"color:#e36c09;\" class=\"ue_t\">[此处键入简历标题]</span></h1><p><span style=\"color:#e36c09;\"><br/></span></p><table width=\"100%\" border=\"1\" style=\"border-collapse:collapse;\"><tbody><tr class=\"firstRow\"><td width=\"200\" style=\"text-align:center;\" class=\"ue_t\">【此处插入照片】</td><td><p><br/></p><p>联系电话：<span class=\"ue_t\">[键入您的电话]</span></p><p><br/></p><p>电子邮件：<span class=\"ue_t\">[键入您的电子邮件地址]</span></p><p><br/></p><p>家庭住址：<span class=\"ue_t\">[键入您的地址]</span></p><p><br/></p></td></tr></tbody></table><h3><span style=\"color:#e36c09;font-size:20px;\">目标职位</span></h3><p style=\"text-indent:2em;\" class=\"ue_t\">[此处键入您的期望职位]</p><h3><span style=\"color:#e36c09;font-size:20px;\">学历</span></h3><p><span style=\"display:none;line-height:0px;\">﻿</span></p><ol style=\"list-style-type: decimal;\" class=\" list-paddingleft-2\"><li><p><span class=\"ue_t\">[键入起止时间]</span> <span class=\"ue_t\">[键入学校名称] </span> <span class=\"ue_t\">[键入所学专业]</span> <span class=\"ue_t\">[键入所获学位]</span></p></li><li><p><span class=\"ue_t\">[键入起止时间]</span> <span class=\"ue_t\">[键入学校名称]</span> <span class=\"ue_t\">[键入所学专业]</span> <span class=\"ue_t\">[键入所获学位]</span></p></li></ol><h3><span style=\"color:#e36c09;font-size:20px;\" class=\"ue_t\">工作经验</span></h3><ol style=\"list-style-type: decimal;\" class=\" list-paddingleft-2\"><li><p><span class=\"ue_t\">[键入起止时间]</span> <span class=\"ue_t\">[键入公司名称]</span> <span class=\"ue_t\">[键入职位名称]</span></p></li><ol style=\"list-style-type: lower-alpha;\" class=\" list-paddingleft-2\"><li><p><span class=\"ue_t\">[键入负责项目]</span> <span class=\"ue_t\">[键入项目简介]</span></p></li><li><p><span class=\"ue_t\">[键入负责项目]</span> <span class=\"ue_t\">[键入项目简介]</span></p></li></ol><li><p><span class=\"ue_t\">[键入起止时间]</span> <span class=\"ue_t\">[键入公司名称]</span> <span class=\"ue_t\">[键入职位名称]</span></p></li><ol style=\"list-style-type: lower-alpha;\" class=\" list-paddingleft-2\"><li><p><span class=\"ue_t\">[键入负责项目]</span> <span class=\"ue_t\">[键入项目简介]</span></p></li></ol></ol><p><span style=\"color:#e36c09;font-size:20px;\">掌握技能</span></p><p style=\"text-indent:2em;\">&nbsp;<span class=\"ue_t\">[这里可以键入您所掌握的技能]</span><br/></p><p><br/></p>', '[{\"specOptions\":[\"秘境黑\",\"星云紫\",\"晨曦白\"],\"specName\":\"选择颜色\"},{\"specOptions\":[\"6G+64G\",\"8G+128G\",\"8G+256G\"],\"specName\":\"选择版本\"}]', null, '[{\"color\":\"aa\",\"url\":\"http://192.168.1.88/group1/M00/00/01/wKgBWF1eL0-AKncMAAI9aEqEI3I742.png\"}]', null, null);
INSERT INTO `tb_goods_desc` VALUES ('149187842867991', '<p>aaaaaa</p>', '[{\"specOptions\":[\"秘境黑\",\"星云紫\"],\"specName\":\"选择颜色\"},{\"specOptions\":[\"6G+64G\",\"8G+128G\"],\"specName\":\"选择版本\"},{\"specOptions\":[\"优惠套餐1\",\"优惠套餐2\"],\"specName\":\"套餐\"}]', null, '[{\"color\":\"aa\",\"url\":\"http://192.168.1.88/group1/M00/00/01/wKgBWF1eMWyAExjXAAFyVK2N7Ig385.jpg\"}]', null, null);
INSERT INTO `tb_goods_desc` VALUES ('149187842867992', '<p>adsfasdfa</p>', '[{\"specOptions\":[\"秘境黑\",\"星云紫\"],\"specName\":\"选择颜色\"},{\"specOptions\":[\"6G+64G\",\"8G+128G\"],\"specName\":\"选择版本\"},{\"specOptions\":[\"优惠套餐1\",\"优惠套餐2\"],\"specName\":\"套餐\"}]', null, '[{\"color\":\"aa\",\"url\":\"http://192.168.1.88/group1/M00/00/01/wKgBWF1eMo2AWE61AAEQrlUJcaE266.jpg\"}]', null, null);
INSERT INTO `tb_goods_desc` VALUES ('149187842867993', '<p>adfasfa</p>', '[{\"specOptions\":[\"6G+64G\",\"8G+128G\"],\"specName\":\"选择版本\"},{\"specOptions\":[\"秘境黑\",\"星云紫\"],\"specName\":\"选择颜色\"}]', null, '[{\"color\":\"rest\",\"url\":\"http://192.168.1.88/group1/M00/00/00/wKgBWF1WnUeAT24QAAI9aEqEI3I885.png\"}]', null, null);

-- ----------------------------
-- Table structure for tb_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_item`;
CREATE TABLE `tb_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品id，同时也是商品编号',
  `title` varchar(100) NOT NULL COMMENT '商品标题',
  `sell_point` varchar(500) DEFAULT NULL COMMENT '商品卖点',
  `price` decimal(20,2) NOT NULL COMMENT '商品价格，单位为：元',
  `stock_count` int(10) DEFAULT NULL,
  `num` int(10) NOT NULL COMMENT '库存数量',
  `barcode` varchar(30) DEFAULT NULL COMMENT '商品条形码',
  `image` varchar(2000) DEFAULT NULL COMMENT '商品图片',
  `categoryId` bigint(10) NOT NULL COMMENT '所属类目，叶子类目',
  `status` varchar(1) NOT NULL COMMENT '商品状态，1-正常，2-下架，3-删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `item_sn` varchar(30) DEFAULT NULL,
  `cost_pirce` decimal(10,2) DEFAULT NULL,
  `market_price` decimal(10,2) DEFAULT NULL,
  `is_default` varchar(1) DEFAULT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  `seller_id` varchar(30) DEFAULT NULL,
  `cart_thumbnail` varchar(150) DEFAULT NULL,
  `category` varchar(200) DEFAULT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `spec` varchar(200) DEFAULT NULL,
  `seller` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`categoryId`),
  KEY `status` (`status`),
  KEY `updated` (`update_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1369431 DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of tb_item
-- ----------------------------
INSERT INTO `tb_item` VALUES ('1369374', '荣耀V20 游戏手机 麒麟980芯片 魅眼全视屏 4800万深感相机 6GB+128GB 幻影蓝 移动联通电信4G全面屏手机', null, '2099.00', null, '9999', null, 'http://img13.360buyimg.com/n1/s450x450_jfs/t1/16446/33/13283/339849/5c9eca5bE06fce1b2/500f99a976998161.jpg', '5', '2', '2019-08-15 08:55:34', '2019-08-15 08:55:34', null, null, null, '0', '149187842867983', 'myxq', null, '数字杂志', '华为', '{\"选择颜色\":\"秘境黑\",\"选择版本\":\"6G+64G\"}', 'myxq');
INSERT INTO `tb_item` VALUES ('1369375', '荣耀10青春版 幻彩渐变 2400万AI自拍 全网通版6GB+64GB 渐变红 移动联通电信4G全面屏手机 双卡双待', null, '1199.00', null, '9999', null, 'http://img12.360buyimg.com/n1/s450x450_jfs/t1/24961/31/15129/171030/5caee71eE1de3edd7/2e5e07e00b0e3b75.jpg', '5', '2', '2019-08-15 08:55:34', '2019-08-15 08:55:34', null, null, null, '0', '149187842867983', 'myxq', null, '数字杂志', '华为', '{\"选择颜色\":\"秘境黑\",\"选择版本\":\"8G+128G\"}', 'myxq');
INSERT INTO `tb_item` VALUES ('1369376', 'fmjavaGoods 秘境黑 优惠套餐1 6G+64G', null, '2199.00', null, '9999', null, 'http://img10.360buyimg.com/n1/s450x450_jfs/t1/7757/6/16212/85710/5c77ab53Eed90536f/5fe95b5c4aba859a.jpg', '3', '2', '2019-08-15 14:23:43', '2019-08-15 14:23:43', null, null, null, '0', '149187842867984', 'fmjava', null, '电子书', '小米', '{\"选择颜色\":\"秘境黑\",\"套餐\":\"优惠套餐1\",\"选择版本\":\"6G+64G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369377', 'fmjavaGoods 星云紫 优惠套餐1 6G+64G', null, '3199.00', null, '9999', null, 'http://img11.360buyimg.com/n1/jfs/t1/65359/29/6670/189455/5d4d4484E882f4f4f/93d99649e15bdbaf.jpg', '3', '2', '2019-08-15 14:23:43', '2019-08-15 14:23:43', null, null, null, '0', '149187842867984', 'fmjava', null, '电子书', '小米', '{\"选择颜色\":\"星云紫\",\"套餐\":\"优惠套餐1\",\"选择版本\":\"6G+64G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369378', 'fmjavaGoods 秘境黑 优惠套餐1 6G+64G', null, '4199.00', null, '9999', null, 'http://img12.360buyimg.com/n1/s450x450_jfs/t30031/152/1332312785/300863/cdf3a03d/5cdd233eN69626d85.jpg', '3', '2', '2019-08-15 14:23:50', '2019-08-15 14:23:50', null, null, null, '0', '149187842867985', 'fmjava', null, '电子书', '小米', '{\"选择颜色\":\"秘境黑\",\"套餐\":\"优惠套餐1\",\"选择版本\":\"6G+64G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369379', 'fmjavaGoods 星云紫 优惠套餐1 6G+64G', null, '5199.00', null, '9999', null, 'http://img13.360buyimg.com/n1/s450x450_jfs/t1/19883/39/13305/185344/5c9eca88Ee1bfa73d/23314446540561dd.jpg', '3', '2', '2019-08-15 14:23:50', '2019-08-15 14:23:50', null, null, null, '0', '149187842867985', 'fmjava', null, '电子书', '小米', '{\"选择颜色\":\"星云紫\",\"套餐\":\"优惠套餐1\",\"选择版本\":\"6G+64G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369380', 'fmjavaGoods 秘境黑 优惠套餐1 6G+64G', null, '1099.00', null, '9999', null, 'http://img13.360buyimg.com/n1/s450x450_jfs/t1/21483/28/13292/135360/5c9eca88E2af33893/1f8964d2828a078a.jpg', '3', '2', '2019-08-15 14:24:21', '2019-08-15 14:24:21', null, null, null, '0', '149187842867986', 'fmjava', null, '电子书', '小米', '{\"选择颜色\":\"秘境黑\",\"套餐\":\"优惠套餐1\",\"选择版本\":\"6G+64G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369381', 'fmjavaGoods 星云紫 优惠套餐1 6G+64G', null, '1193.00', null, '9999', null, 'http://img10.360buyimg.com/n1/s450x450_jfs/t1/7757/6/16212/85710/5c77ab53Eed90536f/5fe95b5c4aba859a.jpg', '3', '2', '2019-08-15 14:24:21', '2019-08-15 14:24:21', null, null, null, '0', '149187842867986', 'fmjava', null, '电子书', '小米', '{\"选择颜色\":\"星云紫\",\"套餐\":\"优惠套餐1\",\"选择版本\":\"6G+64G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369382', 'newGoodsName 秘境黑 优惠套餐1 6G+64G', null, '1159.00', null, '9999', null, 'http://img13.360buyimg.com/n1/s450x450_jfs/t1/19883/39/13305/185344/5c9eca88Ee1bfa73d/23314446540561dd.jpg', '3', '2', '2019-08-16 12:11:06', '2019-08-16 12:11:06', null, null, null, '0', '149187842867987', 'fmjava', null, '电子书', '华为', '{\"选择颜色\":\"秘境黑\",\"套餐\":\"优惠套餐1\",\"选择版本\":\"6G+64G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369383', 'newGoodsName 秘境黑 优惠套餐1 8G+128G', null, '1190.00', null, '9999', null, 'http://img12.360buyimg.com/n1/s450x450_jfs/t1/24961/31/15129/171030/5caee71eE1de3edd7/2e5e07e00b0e3b75.jpg', '3', '2', '2019-08-16 12:11:06', '2019-08-16 12:11:06', null, null, null, '0', '149187842867987', 'fmjava', null, '电子书', '华为', '{\"选择颜色\":\"秘境黑\",\"套餐\":\"优惠套餐1\",\"选择版本\":\"8G+128G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369384', 'newGoodsName 星云紫 优惠套餐1 6G+64G', null, '1100.00', null, '9999', null, 'http://img13.360buyimg.com/n1/s450x450_jfs/t1/19883/39/13305/185344/5c9eca88Ee1bfa73d/23314446540561dd.jpg', '3', '2', '2019-08-16 12:11:06', '2019-08-16 12:11:06', null, null, null, '0', '149187842867987', 'fmjava', null, '电子书', '华为', '{\"选择颜色\":\"星云紫\",\"套餐\":\"优惠套餐1\",\"选择版本\":\"6G+64G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369385', 'newGoodsName 星云紫 优惠套餐1 8G+128G', null, '1199.00', null, '9999', null, 'http://img10.360buyimg.com/n1/s450x450_jfs/t1/7757/6/16212/85710/5c77ab53Eed90536f/5fe95b5c4aba859a.jpg', '3', '2', '2019-08-16 12:11:06', '2019-08-16 12:11:06', null, null, null, '0', '149187842867987', 'fmjava', null, '电子书', '华为', '{\"选择颜色\":\"星云紫\",\"套餐\":\"优惠套餐1\",\"选择版本\":\"8G+128G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369386', 'new商品名称1234555 秘境黑 6G+64G', null, '1999.00', null, '9999', null, 'http://img13.360buyimg.com/n1/s450x450_jfs/t1/19883/39/13305/185344/5c9eca88Ee1bfa73d/23314446540561dd.jpg', '3', '2', '2019-08-16 14:03:40', '2019-08-16 14:03:40', null, null, null, '0', '149187842867982', 'fmjava', null, '电子书', '华为', '{\"选择颜色\":\"秘境黑\",\"选择版本\":\"6G+64G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369387', 'Redmi Note7秘境黑优惠套餐16G+64G', null, '100.00', null, '9999', null, 'http://img10.360buyimg.com/n1/s450x450_jfs/t18946/116/1905361825/73754/a4e6caf5/5adfe5f6Nbe6097b7.jpg', '560', '2', '2019-08-22 05:53:13', '2019-08-22 05:53:13', null, null, null, '0', '149187842867988', 'fmjava', null, '手机', '小米', '{\"选择颜色\":\"秘境黑\",\"套餐\":\"优惠套餐1\",\"选择版本\":\"6G+64G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369388', 'Redmi Note7秘境黑优惠套餐18G+128G', null, '200.00', null, '9999', null, 'http://img10.360buyimg.com/n1/s450x450_jfs/t18946/116/1905361825/73754/a4e6caf5/5adfe5f6Nbe6097b7.jpg', '560', '2', '2019-08-22 05:53:13', '2019-08-22 05:53:13', null, null, null, '0', '149187842867988', 'fmjava', null, '手机', '小米', '{\"选择颜色\":\"秘境黑\",\"套餐\":\"优惠套餐1\",\"选择版本\":\"8G+128G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369389', 'Redmi Note7秘境黑优惠套餐18G+256G', null, '300.00', null, '9999', null, 'http://img10.360buyimg.com/n1/s450x450_jfs/t18946/116/1905361825/73754/a4e6caf5/5adfe5f6Nbe6097b7.jpg', '560', '2', '2019-08-22 05:53:13', '2019-08-22 05:53:13', null, null, null, '0', '149187842867988', 'fmjava', null, '手机', '小米', '{\"选择颜色\":\"秘境黑\",\"套餐\":\"优惠套餐1\",\"选择版本\":\"8G+256G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369390', 'Redmi Note7星云紫优惠套餐16G+64G', null, '400.00', null, '9999', null, 'http://img10.360buyimg.com/n1/s450x450_jfs/t18946/116/1905361825/73754/a4e6caf5/5adfe5f6Nbe6097b7.jpg', '560', '2', '2019-08-22 05:53:13', '2019-08-22 05:53:13', null, null, null, '0', '149187842867988', 'fmjava', null, '手机', '小米', '{\"选择颜色\":\"星云紫\",\"套餐\":\"优惠套餐1\",\"选择版本\":\"6G+64G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369391', 'Redmi Note7星云紫优惠套餐18G+128G', null, '500.00', null, '9999', null, 'http://img10.360buyimg.com/n1/s450x450_jfs/t18946/116/1905361825/73754/a4e6caf5/5adfe5f6Nbe6097b7.jpg', '560', '2', '2019-08-22 05:53:13', '2019-08-22 05:53:13', null, null, null, '0', '149187842867988', 'fmjava', null, '手机', '小米', '{\"选择颜色\":\"星云紫\",\"套餐\":\"优惠套餐1\",\"选择版本\":\"8G+128G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369392', 'Redmi Note7星云紫优惠套餐18G+256G', null, '600.00', null, '9999', null, 'http://img10.360buyimg.com/n1/s450x450_jfs/t18946/116/1905361825/73754/a4e6caf5/5adfe5f6Nbe6097b7.jpg', '560', '2', '2019-08-22 05:53:13', '2019-08-22 05:53:13', null, null, null, '0', '149187842867988', 'fmjava', null, '手机', '小米', '{\"选择颜色\":\"星云紫\",\"套餐\":\"优惠套餐1\",\"选择版本\":\"8G+256G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369393', 'Redmi Note7晨曦白优惠套餐16G+64G', null, '700.00', null, '9999', null, 'http://img10.360buyimg.com/n1/s450x450_jfs/t18946/116/1905361825/73754/a4e6caf5/5adfe5f6Nbe6097b7.jpg', '560', '2', '2019-08-22 05:53:13', '2019-08-22 05:53:13', null, null, null, '0', '149187842867988', 'fmjava', null, '手机', '小米', '{\"选择颜色\":\"晨曦白\",\"套餐\":\"优惠套餐1\",\"选择版本\":\"6G+64G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369394', 'Redmi Note7晨曦白优惠套餐18G+128G', null, '800.00', null, '9999', null, 'http://img10.360buyimg.com/n1/s450x450_jfs/t18946/116/1905361825/73754/a4e6caf5/5adfe5f6Nbe6097b7.jpg', '560', '2', '2019-08-22 05:53:13', '2019-08-22 05:53:13', null, null, null, '0', '149187842867988', 'fmjava', null, '手机', '小米', '{\"选择颜色\":\"晨曦白\",\"套餐\":\"优惠套餐1\",\"选择版本\":\"8G+128G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369395', 'Redmi Note7晨曦白优惠套餐18G+256G', null, '100.00', null, '9999', null, 'http://img10.360buyimg.com/n1/s450x450_jfs/t18946/116/1905361825/73754/a4e6caf5/5adfe5f6Nbe6097b7.jpg', '560', '2', '2019-08-22 05:53:13', '2019-08-22 05:53:13', null, null, null, '0', '149187842867988', 'fmjava', null, '手机', '小米', '{\"选择颜色\":\"晨曦白\",\"套餐\":\"优惠套餐1\",\"选择版本\":\"8G+256G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369396', '小米6X晨曦白优惠套餐16G+64G', null, '1100.00', null, '9999', null, 'http://img13.360buyimg.com//n0/jfs/t1/15767/33/5307/92363/5c3c0429E4490d584/6945442da40a809a.jpg', '560', '2', '2019-08-22 05:56:00', '2019-08-22 05:56:00', null, null, null, '0', '149187842867989', 'fmjava', null, '手机', '小米', '{\"选择颜色\":\"晨曦白\",\"套餐\":\"优惠套餐1\",\"选择版本\":\"6G+64G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369397', '小米6X晨曦白优惠套餐18G+128G', null, '2200.00', null, '9999', null, 'http://img13.360buyimg.com//n0/jfs/t1/15767/33/5307/92363/5c3c0429E4490d584/6945442da40a809a.jpg', '560', '2', '2019-08-22 05:56:00', '2019-08-22 05:56:00', null, null, null, '0', '149187842867989', 'fmjava', null, '手机', '小米', '{\"选择颜色\":\"晨曦白\",\"套餐\":\"优惠套餐1\",\"选择版本\":\"8G+128G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369398', '小米6X星云紫优惠套餐16G+64G', null, '3300.00', null, '9999', null, 'http://img13.360buyimg.com//n0/jfs/t1/15767/33/5307/92363/5c3c0429E4490d584/6945442da40a809a.jpg', '560', '2', '2019-08-22 05:56:00', '2019-08-22 05:56:00', null, null, null, '0', '149187842867989', 'fmjava', null, '手机', '小米', '{\"选择颜色\":\"星云紫\",\"套餐\":\"优惠套餐1\",\"选择版本\":\"6G+64G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369399', '小米6X星云紫优惠套餐18G+128G', null, '4400.00', null, '9999', null, 'http://img13.360buyimg.com//n0/jfs/t1/15767/33/5307/92363/5c3c0429E4490d584/6945442da40a809a.jpg', '560', '2', '2019-08-22 05:56:00', '2019-08-22 05:56:00', null, null, null, '0', '149187842867989', 'fmjava', null, '手机', '小米', '{\"选择颜色\":\"星云紫\",\"套餐\":\"优惠套餐1\",\"选择版本\":\"8G+128G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369400', '小米6X秘境黑优惠套餐16G+64G', null, '1100.00', null, '9999', null, 'http://img13.360buyimg.com//n0/jfs/t1/15767/33/5307/92363/5c3c0429E4490d584/6945442da40a809a.jpg', '560', '2', '2019-08-22 05:56:00', '2019-08-22 05:56:00', null, null, null, '0', '149187842867989', 'fmjava', null, '手机', '小米', '{\"选择颜色\":\"秘境黑\",\"套餐\":\"优惠套餐1\",\"选择版本\":\"6G+64G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369401', '小米6X秘境黑优惠套餐18G+128G', null, '2000.00', null, '9999', null, 'http://img13.360buyimg.com//n0/jfs/t1/15767/33/5307/92363/5c3c0429E4490d584/6945442da40a809a.jpg', '560', '2', '2019-08-22 05:56:00', '2019-08-22 05:56:00', null, null, null, '0', '149187842867989', 'fmjava', null, '手机', '小米', '{\"选择颜色\":\"秘境黑\",\"套餐\":\"优惠套餐1\",\"选择版本\":\"8G+128G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369402', '小米手机秘境黑6G+64G', null, '1000.00', null, '9999', null, 'http://img13.360buyimg.com/n1/s450x450_jfs/t1/59999/2/7728/257703/5d5a6f5cE5a544acc/04d909d25f598c46.jpg', '560', '2', '2019-08-22 06:00:35', '2019-08-22 06:00:35', null, null, null, '0', '149187842867990', 'fmjava', null, '手机', '小米', '{\"选择颜色\":\"秘境黑\",\"选择版本\":\"6G+64G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369403', '小米手机秘境黑8G+128G', null, '2000.00', null, '9999', null, 'http://img13.360buyimg.com/n1/s450x450_jfs/t1/59999/2/7728/257703/5d5a6f5cE5a544acc/04d909d25f598c46.jpg', '560', '2', '2019-08-22 06:00:35', '2019-08-22 06:00:35', null, null, null, '0', '149187842867990', 'fmjava', null, '手机', '小米', '{\"选择颜色\":\"秘境黑\",\"选择版本\":\"8G+128G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369404', '小米手机秘境黑8G+256G', null, '3000.00', null, '9999', null, 'http://img13.360buyimg.com/n1/s450x450_jfs/t1/59999/2/7728/257703/5d5a6f5cE5a544acc/04d909d25f598c46.jpg', '560', '2', '2019-08-22 06:00:35', '2019-08-22 06:00:35', null, null, null, '0', '149187842867990', 'fmjava', null, '手机', '小米', '{\"选择颜色\":\"秘境黑\",\"选择版本\":\"8G+256G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369405', '小米手机星云紫6G+64G', null, '4000.00', null, '9999', null, 'http://img13.360buyimg.com/n1/s450x450_jfs/t1/59999/2/7728/257703/5d5a6f5cE5a544acc/04d909d25f598c46.jpg', '560', '2', '2019-08-22 06:00:35', '2019-08-22 06:00:35', null, null, null, '0', '149187842867990', 'fmjava', null, '手机', '小米', '{\"选择颜色\":\"星云紫\",\"选择版本\":\"6G+64G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369406', '小米手机星云紫8G+128G', null, '2000.00', null, '9999', null, 'http://img13.360buyimg.com/n1/s450x450_jfs/t1/59999/2/7728/257703/5d5a6f5cE5a544acc/04d909d25f598c46.jpg', '560', '2', '2019-08-22 06:00:35', '2019-08-22 06:00:35', null, null, null, '0', '149187842867990', 'fmjava', null, '手机', '小米', '{\"选择颜色\":\"星云紫\",\"选择版本\":\"8G+128G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369407', '小米手机星云紫8G+256G', null, '1010.00', null, '9999', null, 'http://img13.360buyimg.com/n1/s450x450_jfs/t1/59999/2/7728/257703/5d5a6f5cE5a544acc/04d909d25f598c46.jpg', '560', '2', '2019-08-22 06:00:35', '2019-08-22 06:00:35', null, null, null, '0', '149187842867990', 'fmjava', null, '手机', '小米', '{\"选择颜色\":\"星云紫\",\"选择版本\":\"8G+256G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369408', '小米手机晨曦白6G+64G', null, '1011.00', null, '9999', null, 'http://img13.360buyimg.com/n1/s450x450_jfs/t1/59999/2/7728/257703/5d5a6f5cE5a544acc/04d909d25f598c46.jpg', '560', '2', '2019-08-22 06:00:35', '2019-08-22 06:00:35', null, null, null, '0', '149187842867990', 'fmjava', null, '手机', '小米', '{\"选择颜色\":\"晨曦白\",\"选择版本\":\"6G+64G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369409', '小米手机晨曦白8G+128G', null, '1021.00', null, '9999', null, 'http://img13.360buyimg.com/n1/s450x450_jfs/t1/59999/2/7728/257703/5d5a6f5cE5a544acc/04d909d25f598c46.jpg', '560', '2', '2019-08-22 06:00:35', '2019-08-22 06:00:35', null, null, null, '0', '149187842867990', 'fmjava', null, '手机', '小米', '{\"选择颜色\":\"晨曦白\",\"选择版本\":\"8G+128G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369410', '小米手机晨曦白8G+256G', null, '1100.00', null, '9999', null, 'http://img13.360buyimg.com/n1/s450x450_jfs/t1/59999/2/7728/257703/5d5a6f5cE5a544acc/04d909d25f598c46.jpg', '560', '2', '2019-08-22 06:00:35', '2019-08-22 06:00:35', null, null, null, '0', '149187842867990', null, null, '手机', '小米', '{\"选择颜色\":\"晨曦白\",\"选择版本\":\"8G+256G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369411', '红米Redmi秘境黑优惠套餐16G+64G', null, '1001.00', null, '9999', null, 'http://img11.360buyimg.com/n1/s450x450_jfs/t1/61684/4/4661/81708/5d2da5c4E00d2a400/0a900b5f1134354b.jpg', '560', '2', '2019-08-22 06:09:55', '2019-08-22 06:09:55', null, null, null, '0', '149187842867991', null, null, '手机', '小米', '{\"选择颜色\":\"秘境黑\",\"套餐\":\"优惠套餐1\",\"选择版本\":\"6G+64G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369412', '红米Redmi秘境黑优惠套餐26G+64G', null, '2001.00', null, '9999', null, 'http://img11.360buyimg.com/n1/s450x450_jfs/t1/61684/4/4661/81708/5d2da5c4E00d2a400/0a900b5f1134354b.jpg', '560', '2', '2019-08-22 06:09:55', '2019-08-22 06:09:55', null, null, null, '0', '149187842867991', null, null, '手机', '小米', '{\"选择颜色\":\"秘境黑\",\"套餐\":\"优惠套餐2\",\"选择版本\":\"6G+64G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369413', '红米Redmi秘境黑优惠套餐18G+128G', null, '1003.00', null, '9999', null, 'http://img11.360buyimg.com/n1/s450x450_jfs/t1/61684/4/4661/81708/5d2da5c4E00d2a400/0a900b5f1134354b.jpg', '560', '2', '2019-08-22 06:09:55', '2019-08-22 06:09:55', null, null, null, '0', '149187842867991', null, null, '手机', '小米', '{\"选择颜色\":\"秘境黑\",\"套餐\":\"优惠套餐1\",\"选择版本\":\"8G+128G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369414', '红米Redmi秘境黑优惠套餐28G+128G', null, '1006.00', null, '9999', null, 'http://img11.360buyimg.com/n1/s450x450_jfs/t1/61684/4/4661/81708/5d2da5c4E00d2a400/0a900b5f1134354b.jpg', '560', '2', '2019-08-22 06:09:55', '2019-08-22 06:09:55', null, null, null, '0', '149187842867991', null, null, '手机', '小米', '{\"选择颜色\":\"秘境黑\",\"套餐\":\"优惠套餐2\",\"选择版本\":\"8G+128G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369415', '红米Redmi星云紫优惠套餐16G+64G', null, '1009.00', null, '9999', null, 'http://img11.360buyimg.com/n1/s450x450_jfs/t1/61684/4/4661/81708/5d2da5c4E00d2a400/0a900b5f1134354b.jpg', '560', '2', '2019-08-22 06:09:55', '2019-08-22 06:09:55', null, null, null, '0', '149187842867991', null, null, '手机', '小米', '{\"选择颜色\":\"星云紫\",\"套餐\":\"优惠套餐1\",\"选择版本\":\"6G+64G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369416', '红米Redmi星云紫优惠套餐26G+64G', null, '1001.00', null, '9999', null, 'http://img11.360buyimg.com/n1/s450x450_jfs/t1/61684/4/4661/81708/5d2da5c4E00d2a400/0a900b5f1134354b.jpg', '560', '2', '2019-08-22 06:09:55', '2019-08-22 06:09:55', null, null, null, '0', '149187842867991', null, null, '手机', '小米', '{\"选择颜色\":\"星云紫\",\"套餐\":\"优惠套餐2\",\"选择版本\":\"6G+64G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369417', '红米Redmi星云紫优惠套餐18G+128G', null, '1005.00', null, '9999', null, 'http://img11.360buyimg.com/n1/s450x450_jfs/t1/61684/4/4661/81708/5d2da5c4E00d2a400/0a900b5f1134354b.jpg', '560', '2', '2019-08-22 06:09:55', '2019-08-22 06:09:55', null, null, null, '0', '149187842867991', null, null, '手机', '小米', '{\"选择颜色\":\"星云紫\",\"套餐\":\"优惠套餐1\",\"选择版本\":\"8G+128G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369418', '红米Redmi星云紫优惠套餐28G+128G', null, '1005.00', null, '9999', null, 'http://img11.360buyimg.com/n1/s450x450_jfs/t1/61684/4/4661/81708/5d2da5c4E00d2a400/0a900b5f1134354b.jpg', '560', '2', '2019-08-22 06:09:55', '2019-08-22 06:09:55', null, null, null, '0', '149187842867991', null, null, '手机', '小米', '{\"选择颜色\":\"星云紫\",\"套餐\":\"优惠套餐2\",\"选择版本\":\"8G+128G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369419', '小米cc9手机秘境黑优惠套餐16G+64G', null, '1001.00', null, '9999', null, 'http://img14.360buyimg.com//n0/jfs/t1/74925/10/7096/531126/5d525301E01e07993/3ad4b1cd1b1c4929.png', '560', '2', '2019-08-22 06:14:19', '2019-08-22 06:14:19', null, null, null, '0', '149187842867992', null, null, '手机', '小米', '{\"选择颜色\":\"秘境黑\",\"套餐\":\"优惠套餐1\",\"选择版本\":\"6G+64G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369420', '小米cc9手机秘境黑优惠套餐26G+64G', null, '1002.00', null, '9999', null, 'http://img14.360buyimg.com//n0/jfs/t1/74925/10/7096/531126/5d525301E01e07993/3ad4b1cd1b1c4929.png', '560', '2', '2019-08-22 06:14:19', '2019-08-22 06:14:19', null, null, null, '0', '149187842867992', null, null, '手机', '小米', '{\"选择颜色\":\"秘境黑\",\"套餐\":\"优惠套餐2\",\"选择版本\":\"6G+64G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369421', '小米cc9手机秘境黑优惠套餐18G+128G', null, '2001.00', null, '9999', null, 'http://img14.360buyimg.com//n0/jfs/t1/74925/10/7096/531126/5d525301E01e07993/3ad4b1cd1b1c4929.png', '560', '2', '2019-08-22 06:14:19', '2019-08-22 06:14:19', null, null, null, '0', '149187842867992', null, null, '手机', '小米', '{\"选择颜色\":\"秘境黑\",\"套餐\":\"优惠套餐1\",\"选择版本\":\"8G+128G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369422', '小米cc9手机秘境黑优惠套餐28G+128G', null, '2002.00', null, '9999', null, 'http://img14.360buyimg.com//n0/jfs/t1/74925/10/7096/531126/5d525301E01e07993/3ad4b1cd1b1c4929.png', '560', '2', '2019-08-22 06:14:19', '2019-08-22 06:14:19', null, null, null, '0', '149187842867992', null, null, '手机', '小米', '{\"选择颜色\":\"秘境黑\",\"套餐\":\"优惠套餐2\",\"选择版本\":\"8G+128G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369423', '小米cc9手机星云紫优惠套餐16G+64G', null, '2004.00', null, '9999', null, 'http://img14.360buyimg.com//n0/jfs/t1/74925/10/7096/531126/5d525301E01e07993/3ad4b1cd1b1c4929.png', '560', '2', '2019-08-22 06:14:19', '2019-08-22 06:14:19', null, null, null, '0', '149187842867992', null, null, '手机', '小米', '{\"选择颜色\":\"星云紫\",\"套餐\":\"优惠套餐1\",\"选择版本\":\"6G+64G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369424', '小米cc9手机星云紫优惠套餐26G+64G', null, '2006.00', null, '9999', null, 'http://img14.360buyimg.com//n0/jfs/t1/74925/10/7096/531126/5d525301E01e07993/3ad4b1cd1b1c4929.png', '560', '2', '2019-08-22 06:14:19', '2019-08-22 06:14:19', null, null, null, '0', '149187842867992', null, null, '手机', '小米', '{\"选择颜色\":\"星云紫\",\"套餐\":\"优惠套餐2\",\"选择版本\":\"6G+64G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369425', '小米cc9手机星云紫优惠套餐18G+128G', null, '2007.00', null, '9999', null, 'http://img14.360buyimg.com//n0/jfs/t1/74925/10/7096/531126/5d525301E01e07993/3ad4b1cd1b1c4929.png', '560', '2', '2019-08-22 06:14:19', '2019-08-22 06:14:19', null, null, null, '0', '149187842867992', null, null, '手机', '小米', '{\"选择颜色\":\"星云紫\",\"套餐\":\"优惠套餐1\",\"选择版本\":\"8G+128G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369426', '小米cc9手机星云紫优惠套餐28G+128G', null, '2008.00', null, '9999', null, 'http://img14.360buyimg.com//n0/jfs/t1/74925/10/7096/531126/5d525301E01e07993/3ad4b1cd1b1c4929.png', '560', '2', '2019-08-22 06:14:19', '2019-08-22 06:14:19', null, null, null, '0', '149187842867992', null, null, '手机', '小米', '{\"选择颜色\":\"星云紫\",\"套餐\":\"优惠套餐2\",\"选择版本\":\"8G+128G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369427', 'Spring秘境黑6G+64G', null, '10.00', null, '9999', null, 'http://192.168.1.88/group1/M00/00/01/wKgBWF1g4_KATylRAAFyVK2N7Ig849.jpg', '5', '2', '2019-08-24 07:15:27', '2019-08-24 07:15:27', null, null, null, '0', '149187842867993', 'myxq', null, '数字杂志', '联想123456', '{\"选择颜色\":\"秘境黑\",\"选择版本\":\"6G+64G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369428', 'Spring星云紫6G+64G', null, '10.00', null, '9999', null, 'http://192.168.1.88/group1/M00/00/01/wKgBWF1g4_KATylRAAFyVK2N7Ig849.jpg', '5', '2', '2019-08-24 07:15:27', '2019-08-24 07:15:27', null, null, null, '0', '149187842867993', 'myxq', null, '数字杂志', '联想123456', '{\"选择颜色\":\"星云紫\",\"选择版本\":\"6G+64G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369429', 'Spring秘境黑8G+128G', null, '10.00', null, '9999', null, 'http://192.168.1.88/group1/M00/00/01/wKgBWF1g4_KATylRAAFyVK2N7Ig849.jpg', '5', '2', '2019-08-24 07:15:27', '2019-08-24 07:15:27', null, null, null, '0', '149187842867993', 'myxq', null, '数字杂志', '联想123456', '{\"选择颜色\":\"秘境黑\",\"选择版本\":\"8G+128G\"}', '上海*******有限责任公司');
INSERT INTO `tb_item` VALUES ('1369430', 'Spring星云紫8G+128G', null, '10.00', null, '9999', null, 'http://192.168.1.88/group1/M00/00/01/wKgBWF1g4_KATylRAAFyVK2N7Ig849.jpg', '5', '2', '2019-08-24 07:15:27', '2019-08-24 07:15:27', null, null, null, '0', '149187842867993', 'myxq', null, '数字杂志', '联想123456', '{\"选择颜色\":\"星云紫\",\"选择版本\":\"8G+128G\"}', '上海*******有限责任公司');

-- ----------------------------
-- Table structure for tb_item_cat
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_cat`;
CREATE TABLE `tb_item_cat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '类目ID',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父类目ID=0时，代表的是一级的类目',
  `name` varchar(50) DEFAULT NULL COMMENT '类目名称',
  `type_id` bigint(11) DEFAULT NULL COMMENT '类型id',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1205 DEFAULT CHARSET=utf8 COMMENT='商品类目';

-- ----------------------------
-- Records of tb_item_cat
-- ----------------------------
INSERT INTO `tb_item_cat` VALUES ('1', '0', '图书、音像、电子书刊', '44');
INSERT INTO `tb_item_cat` VALUES ('2', '1', '电子书刊', '44');
INSERT INTO `tb_item_cat` VALUES ('3', '2', '电子书', '44');
INSERT INTO `tb_item_cat` VALUES ('4', '2', '网络原创', '35');
INSERT INTO `tb_item_cat` VALUES ('5', '2', '数字杂志', '45');
INSERT INTO `tb_item_cat` VALUES ('6', '2', '多媒体图书', '45');
INSERT INTO `tb_item_cat` VALUES ('7', '1', '音像', '46');
INSERT INTO `tb_item_cat` VALUES ('8', '7', '音乐', '46');
INSERT INTO `tb_item_cat` VALUES ('9', '7', '影视', '46');
INSERT INTO `tb_item_cat` VALUES ('10', '7', '教育音像', '35');
INSERT INTO `tb_item_cat` VALUES ('11', '1', '英文原版', '44');
INSERT INTO `tb_item_cat` VALUES ('13', '11', '商务投资', '44');
INSERT INTO `tb_item_cat` VALUES ('14', '11', '英语学习与考试', '35');
INSERT INTO `tb_item_cat` VALUES ('16', '11', '传记', '35');
INSERT INTO `tb_item_cat` VALUES ('18', '1', '文艺', '35');
INSERT INTO `tb_item_cat` VALUES ('19', '18', '小说', '35');
INSERT INTO `tb_item_cat` VALUES ('20', '18', '文学', '35');
INSERT INTO `tb_item_cat` VALUES ('21', '18', '青春文学', '35');
INSERT INTO `tb_item_cat` VALUES ('22', '18', '传记', '35');
INSERT INTO `tb_item_cat` VALUES ('23', '18', '艺术', '35');
INSERT INTO `tb_item_cat` VALUES ('24', '1', '少儿', '35');
INSERT INTO `tb_item_cat` VALUES ('25', '24', '少儿', '35');
INSERT INTO `tb_item_cat` VALUES ('26', '24', '0-2岁', '35');
INSERT INTO `tb_item_cat` VALUES ('27', '24', '3-6岁', '35');
INSERT INTO `tb_item_cat` VALUES ('28', '24', '7-10岁', '35');
INSERT INTO `tb_item_cat` VALUES ('29', '24', '11-14岁', '35');
INSERT INTO `tb_item_cat` VALUES ('30', '1', '人文社科', '35');
INSERT INTO `tb_item_cat` VALUES ('31', '30', '历史', '35');
INSERT INTO `tb_item_cat` VALUES ('32', '30', '哲学', '35');
INSERT INTO `tb_item_cat` VALUES ('33', '30', '国学', '35');
INSERT INTO `tb_item_cat` VALUES ('34', '30', '政治/军事', '35');
INSERT INTO `tb_item_cat` VALUES ('35', '30', '法律', '35');
INSERT INTO `tb_item_cat` VALUES ('36', '30', '宗教', '35');
INSERT INTO `tb_item_cat` VALUES ('37', '30', '心理学', '35');
INSERT INTO `tb_item_cat` VALUES ('38', '30', '文化', '35');
INSERT INTO `tb_item_cat` VALUES ('39', '30', '社会科学', '35');
INSERT INTO `tb_item_cat` VALUES ('40', '1', '经管励志', '35');
INSERT INTO `tb_item_cat` VALUES ('41', '40', '经济', '35');
INSERT INTO `tb_item_cat` VALUES ('42', '40', '金融与投资', '35');
INSERT INTO `tb_item_cat` VALUES ('43', '40', '管理', '35');
INSERT INTO `tb_item_cat` VALUES ('44', '40', '励志与成功', '35');
INSERT INTO `tb_item_cat` VALUES ('45', '1', '生活', '35');
INSERT INTO `tb_item_cat` VALUES ('46', '45', '生活', '35');
INSERT INTO `tb_item_cat` VALUES ('47', '45', '健身与保健', '35');
INSERT INTO `tb_item_cat` VALUES ('48', '45', '家庭与育儿', '35');
INSERT INTO `tb_item_cat` VALUES ('49', '45', '旅游', '35');
INSERT INTO `tb_item_cat` VALUES ('50', '45', '动漫/幽默', '35');
INSERT INTO `tb_item_cat` VALUES ('51', '1', '科技', '35');
INSERT INTO `tb_item_cat` VALUES ('52', '51', '科技', '35');
INSERT INTO `tb_item_cat` VALUES ('53', '51', '工程', '35');
INSERT INTO `tb_item_cat` VALUES ('54', '51', '建筑', '35');
INSERT INTO `tb_item_cat` VALUES ('55', '51', '医学', '35');
INSERT INTO `tb_item_cat` VALUES ('56', '51', '科学与自然', '35');
INSERT INTO `tb_item_cat` VALUES ('57', '51', '计算机与互联网', '35');
INSERT INTO `tb_item_cat` VALUES ('58', '51', '体育/运动', '35');
INSERT INTO `tb_item_cat` VALUES ('59', '1', '教育', '35');
INSERT INTO `tb_item_cat` VALUES ('60', '59', '教材教辅', '35');
INSERT INTO `tb_item_cat` VALUES ('61', '59', '教育与考试', '35');
INSERT INTO `tb_item_cat` VALUES ('62', '59', '外语学习', '35');
INSERT INTO `tb_item_cat` VALUES ('64', '59', '语言文字', '35');
INSERT INTO `tb_item_cat` VALUES ('65', '1', '港台图书', '35');
INSERT INTO `tb_item_cat` VALUES ('66', '65', '艺术/设计/收藏', '35');
INSERT INTO `tb_item_cat` VALUES ('67', '65', '经济管理', '35');
INSERT INTO `tb_item_cat` VALUES ('68', '65', '文化/学术', '35');
INSERT INTO `tb_item_cat` VALUES ('69', '65', '少儿文学/国学', '35');
INSERT INTO `tb_item_cat` VALUES ('70', '1', '其它', '35');
INSERT INTO `tb_item_cat` VALUES ('71', '70', '工具书', '35');
INSERT INTO `tb_item_cat` VALUES ('72', '70', '影印版', '35');
INSERT INTO `tb_item_cat` VALUES ('73', '70', '套装书', '35');
INSERT INTO `tb_item_cat` VALUES ('74', '0', '家用电器', '35');
INSERT INTO `tb_item_cat` VALUES ('75', '74', '大家电', '35');
INSERT INTO `tb_item_cat` VALUES ('76', '75', '平板电视', '37');
INSERT INTO `tb_item_cat` VALUES ('77', '75', '空调', '35');
INSERT INTO `tb_item_cat` VALUES ('78', '75', '冰箱', '35');
INSERT INTO `tb_item_cat` VALUES ('79', '75', '洗衣机', '35');
INSERT INTO `tb_item_cat` VALUES ('80', '75', '家庭影院', '35');
INSERT INTO `tb_item_cat` VALUES ('81', '75', 'DVD播放机', '35');
INSERT INTO `tb_item_cat` VALUES ('82', '75', '迷你音响', '35');
INSERT INTO `tb_item_cat` VALUES ('83', '75', '烟机/灶具', '35');
INSERT INTO `tb_item_cat` VALUES ('84', '75', '热水器', '35');
INSERT INTO `tb_item_cat` VALUES ('85', '75', '消毒柜/洗碗机', '35');
INSERT INTO `tb_item_cat` VALUES ('86', '75', '酒柜/冰吧/冷柜', '35');
INSERT INTO `tb_item_cat` VALUES ('87', '75', '家电配件', '35');
INSERT INTO `tb_item_cat` VALUES ('88', '75', '家电下乡', '35');
INSERT INTO `tb_item_cat` VALUES ('89', '74', '生活电器', '35');
INSERT INTO `tb_item_cat` VALUES ('90', '89', '电风扇', '35');
INSERT INTO `tb_item_cat` VALUES ('91', '89', '冷风扇', '35');
INSERT INTO `tb_item_cat` VALUES ('92', '89', '净化器', '35');
INSERT INTO `tb_item_cat` VALUES ('93', '89', '饮水机', '35');
INSERT INTO `tb_item_cat` VALUES ('94', '89', '净水设备', '35');
INSERT INTO `tb_item_cat` VALUES ('95', '89', '挂烫机/熨斗', '35');
INSERT INTO `tb_item_cat` VALUES ('96', '89', '吸尘器', '35');
INSERT INTO `tb_item_cat` VALUES ('97', '89', '电话机', '35');
INSERT INTO `tb_item_cat` VALUES ('98', '89', '插座', '35');
INSERT INTO `tb_item_cat` VALUES ('99', '89', '收录/音机', '35');
INSERT INTO `tb_item_cat` VALUES ('100', '89', '清洁机', '35');
INSERT INTO `tb_item_cat` VALUES ('101', '89', '加湿器', '35');
INSERT INTO `tb_item_cat` VALUES ('102', '89', '除湿机', '35');
INSERT INTO `tb_item_cat` VALUES ('103', '89', '取暖电器', '35');
INSERT INTO `tb_item_cat` VALUES ('104', '89', '其它生活电器', '35');
INSERT INTO `tb_item_cat` VALUES ('105', '89', '扫地机器人', '35');
INSERT INTO `tb_item_cat` VALUES ('106', '89', '干衣机', '35');
INSERT INTO `tb_item_cat` VALUES ('107', '89', '生活电器配件', '35');
INSERT INTO `tb_item_cat` VALUES ('108', '74', '厨房电器', '35');
INSERT INTO `tb_item_cat` VALUES ('109', '108', '料理/榨汁机', '35');
INSERT INTO `tb_item_cat` VALUES ('110', '108', '豆浆机', '35');
INSERT INTO `tb_item_cat` VALUES ('111', '108', '电饭煲', '35');
INSERT INTO `tb_item_cat` VALUES ('112', '108', '电压力锅', '35');
INSERT INTO `tb_item_cat` VALUES ('113', '108', '面包机', '35');
INSERT INTO `tb_item_cat` VALUES ('114', '108', '咖啡机', '35');
INSERT INTO `tb_item_cat` VALUES ('115', '108', '微波炉', '35');
INSERT INTO `tb_item_cat` VALUES ('116', '108', '电烤箱', '35');
INSERT INTO `tb_item_cat` VALUES ('117', '108', '电磁炉', '35');
INSERT INTO `tb_item_cat` VALUES ('118', '108', '电饼铛/烧烤盘', '35');
INSERT INTO `tb_item_cat` VALUES ('119', '108', '煮蛋器', '35');
INSERT INTO `tb_item_cat` VALUES ('120', '108', '酸奶机', '35');
INSERT INTO `tb_item_cat` VALUES ('121', '108', '电炖锅', '35');
INSERT INTO `tb_item_cat` VALUES ('122', '108', '电水壶/热水瓶', '35');
INSERT INTO `tb_item_cat` VALUES ('123', '108', '多用途锅', '35');
INSERT INTO `tb_item_cat` VALUES ('124', '108', '果蔬解毒机', '35');
INSERT INTO `tb_item_cat` VALUES ('125', '108', '其它厨房电器', '35');
INSERT INTO `tb_item_cat` VALUES ('126', '74', '个护健康', '35');
INSERT INTO `tb_item_cat` VALUES ('127', '126', '剃须刀', '35');
INSERT INTO `tb_item_cat` VALUES ('128', '126', '剃/脱毛器', '35');
INSERT INTO `tb_item_cat` VALUES ('129', '126', '口腔护理', '35');
INSERT INTO `tb_item_cat` VALUES ('130', '126', '电吹风', '35');
INSERT INTO `tb_item_cat` VALUES ('131', '126', '美容器', '35');
INSERT INTO `tb_item_cat` VALUES ('132', '126', '美发器', '35');
INSERT INTO `tb_item_cat` VALUES ('133', '126', '按摩椅', '35');
INSERT INTO `tb_item_cat` VALUES ('134', '126', '按摩器', '35');
INSERT INTO `tb_item_cat` VALUES ('135', '126', '足浴盆', '35');
INSERT INTO `tb_item_cat` VALUES ('136', '126', '血压计', '35');
INSERT INTO `tb_item_cat` VALUES ('137', '126', '健康秤/厨房秤', '35');
INSERT INTO `tb_item_cat` VALUES ('138', '126', '血糖仪', '35');
INSERT INTO `tb_item_cat` VALUES ('139', '126', '体温计', '35');
INSERT INTO `tb_item_cat` VALUES ('140', '126', '计步器/脂肪检测仪', '35');
INSERT INTO `tb_item_cat` VALUES ('141', '126', '其它健康电器', '35');
INSERT INTO `tb_item_cat` VALUES ('142', '74', '五金家装', '35');
INSERT INTO `tb_item_cat` VALUES ('143', '142', '电动工具', '35');
INSERT INTO `tb_item_cat` VALUES ('144', '142', '手动工具', '35');
INSERT INTO `tb_item_cat` VALUES ('145', '142', '仪器仪表', '35');
INSERT INTO `tb_item_cat` VALUES ('146', '142', '浴霸/排气扇', '35');
INSERT INTO `tb_item_cat` VALUES ('147', '142', '灯具', '35');
INSERT INTO `tb_item_cat` VALUES ('148', '142', 'LED灯', '35');
INSERT INTO `tb_item_cat` VALUES ('149', '142', '洁身器', '35');
INSERT INTO `tb_item_cat` VALUES ('150', '142', '水槽', '35');
INSERT INTO `tb_item_cat` VALUES ('151', '142', '龙头', '35');
INSERT INTO `tb_item_cat` VALUES ('152', '142', '淋浴花洒', '35');
INSERT INTO `tb_item_cat` VALUES ('153', '142', '厨卫五金', '35');
INSERT INTO `tb_item_cat` VALUES ('154', '142', '家具五金', '35');
INSERT INTO `tb_item_cat` VALUES ('155', '142', '门铃', '35');
INSERT INTO `tb_item_cat` VALUES ('156', '142', '电气开关', '35');
INSERT INTO `tb_item_cat` VALUES ('157', '142', '插座', '35');
INSERT INTO `tb_item_cat` VALUES ('158', '142', '电工电料', '35');
INSERT INTO `tb_item_cat` VALUES ('159', '142', '监控安防', '35');
INSERT INTO `tb_item_cat` VALUES ('160', '142', '电线线缆', '35');
INSERT INTO `tb_item_cat` VALUES ('161', '0', '电脑、办公', '35');
INSERT INTO `tb_item_cat` VALUES ('162', '161', '电脑整机', '35');
INSERT INTO `tb_item_cat` VALUES ('163', '162', '笔记本', '35');
INSERT INTO `tb_item_cat` VALUES ('164', '162', '超极本', '35');
INSERT INTO `tb_item_cat` VALUES ('165', '162', '游戏本', '35');
INSERT INTO `tb_item_cat` VALUES ('166', '162', '平板电脑', '35');
INSERT INTO `tb_item_cat` VALUES ('167', '162', '平板电脑配件', '35');
INSERT INTO `tb_item_cat` VALUES ('168', '162', '台式机', '35');
INSERT INTO `tb_item_cat` VALUES ('169', '162', '服务器/工作站', '35');
INSERT INTO `tb_item_cat` VALUES ('170', '162', '笔记本配件', '35');
INSERT INTO `tb_item_cat` VALUES ('171', '161', '电脑配件', '35');
INSERT INTO `tb_item_cat` VALUES ('172', '171', 'CPU', '35');
INSERT INTO `tb_item_cat` VALUES ('173', '171', '主板', '35');
INSERT INTO `tb_item_cat` VALUES ('174', '171', '显卡', '35');
INSERT INTO `tb_item_cat` VALUES ('175', '171', '硬盘', '35');
INSERT INTO `tb_item_cat` VALUES ('176', '171', 'SSD固态硬盘', '35');
INSERT INTO `tb_item_cat` VALUES ('177', '171', '内存', '35');
INSERT INTO `tb_item_cat` VALUES ('178', '171', '机箱', '35');
INSERT INTO `tb_item_cat` VALUES ('179', '171', '电源', '35');
INSERT INTO `tb_item_cat` VALUES ('180', '171', '显示器', '35');
INSERT INTO `tb_item_cat` VALUES ('181', '171', '刻录机/光驱', '35');
INSERT INTO `tb_item_cat` VALUES ('182', '171', '散热器', '35');
INSERT INTO `tb_item_cat` VALUES ('183', '171', '声卡/扩展卡', '35');
INSERT INTO `tb_item_cat` VALUES ('184', '171', '装机配件', '35');
INSERT INTO `tb_item_cat` VALUES ('185', '171', '组装电脑', '35');
INSERT INTO `tb_item_cat` VALUES ('186', '161', '外设产品', '35');
INSERT INTO `tb_item_cat` VALUES ('187', '186', '移动硬盘', '35');
INSERT INTO `tb_item_cat` VALUES ('188', '186', 'U盘', '35');
INSERT INTO `tb_item_cat` VALUES ('189', '186', '鼠标', '35');
INSERT INTO `tb_item_cat` VALUES ('190', '186', '键盘', '35');
INSERT INTO `tb_item_cat` VALUES ('191', '186', '鼠标垫', '35');
INSERT INTO `tb_item_cat` VALUES ('192', '186', '摄像头', '35');
INSERT INTO `tb_item_cat` VALUES ('193', '186', '手写板', '35');
INSERT INTO `tb_item_cat` VALUES ('194', '186', '外置盒', '35');
INSERT INTO `tb_item_cat` VALUES ('195', '186', '插座', '35');
INSERT INTO `tb_item_cat` VALUES ('196', '186', '线缆', '35');
INSERT INTO `tb_item_cat` VALUES ('197', '186', 'UPS电源', '35');
INSERT INTO `tb_item_cat` VALUES ('198', '186', '电脑工具', '35');
INSERT INTO `tb_item_cat` VALUES ('199', '186', '游戏设备', '35');
INSERT INTO `tb_item_cat` VALUES ('200', '186', '电玩', '35');
INSERT INTO `tb_item_cat` VALUES ('201', '186', '电脑清洁', '35');
INSERT INTO `tb_item_cat` VALUES ('202', '161', '网络产品', '35');
INSERT INTO `tb_item_cat` VALUES ('203', '202', '路由器', '35');
INSERT INTO `tb_item_cat` VALUES ('204', '202', '网卡', '35');
INSERT INTO `tb_item_cat` VALUES ('205', '202', '交换机', '35');
INSERT INTO `tb_item_cat` VALUES ('206', '202', '网络存储', '35');
INSERT INTO `tb_item_cat` VALUES ('207', '202', '4G/3G上网', '35');
INSERT INTO `tb_item_cat` VALUES ('208', '202', '网络盒子', '35');
INSERT INTO `tb_item_cat` VALUES ('209', '202', '网络配件', '35');
INSERT INTO `tb_item_cat` VALUES ('210', '161', '办公设备', '35');
INSERT INTO `tb_item_cat` VALUES ('211', '210', '投影机', '35');
INSERT INTO `tb_item_cat` VALUES ('212', '210', '投影配件', '35');
INSERT INTO `tb_item_cat` VALUES ('213', '210', '多功能一体机', '35');
INSERT INTO `tb_item_cat` VALUES ('214', '210', '打印机', '35');
INSERT INTO `tb_item_cat` VALUES ('215', '210', '传真设备', '35');
INSERT INTO `tb_item_cat` VALUES ('216', '210', '验钞/点钞机', '35');
INSERT INTO `tb_item_cat` VALUES ('217', '210', '扫描设备', '35');
INSERT INTO `tb_item_cat` VALUES ('218', '210', '复合机', '35');
INSERT INTO `tb_item_cat` VALUES ('219', '210', '碎纸机', '35');
INSERT INTO `tb_item_cat` VALUES ('220', '210', '考勤机', '35');
INSERT INTO `tb_item_cat` VALUES ('221', '210', '墨粉', '35');
INSERT INTO `tb_item_cat` VALUES ('222', '210', '收款/POS机', '35');
INSERT INTO `tb_item_cat` VALUES ('223', '210', '会议音频视频', '35');
INSERT INTO `tb_item_cat` VALUES ('224', '210', '保险柜', '35');
INSERT INTO `tb_item_cat` VALUES ('225', '210', '装订/封装机', '35');
INSERT INTO `tb_item_cat` VALUES ('226', '210', '安防监控', '35');
INSERT INTO `tb_item_cat` VALUES ('227', '210', '办公家具', '35');
INSERT INTO `tb_item_cat` VALUES ('228', '210', '白板', '35');
INSERT INTO `tb_item_cat` VALUES ('229', '161', '文具/耗材', '35');
INSERT INTO `tb_item_cat` VALUES ('230', '229', '硒鼓/墨粉', '35');
INSERT INTO `tb_item_cat` VALUES ('231', '229', '墨盒', '35');
INSERT INTO `tb_item_cat` VALUES ('232', '229', '色带', '35');
INSERT INTO `tb_item_cat` VALUES ('233', '229', '纸类', '35');
INSERT INTO `tb_item_cat` VALUES ('234', '229', '办公文具', '35');
INSERT INTO `tb_item_cat` VALUES ('235', '229', '学生文具', '35');
INSERT INTO `tb_item_cat` VALUES ('236', '229', '文件管理', '35');
INSERT INTO `tb_item_cat` VALUES ('237', '229', '财会用品', '35');
INSERT INTO `tb_item_cat` VALUES ('238', '229', '本册/便签', '35');
INSERT INTO `tb_item_cat` VALUES ('239', '229', '计算器', '35');
INSERT INTO `tb_item_cat` VALUES ('240', '229', '激光笔', '35');
INSERT INTO `tb_item_cat` VALUES ('241', '229', '笔类', '35');
INSERT INTO `tb_item_cat` VALUES ('242', '229', '画具画材', '35');
INSERT INTO `tb_item_cat` VALUES ('243', '229', '刻录碟片/附件', '35');
INSERT INTO `tb_item_cat` VALUES ('244', '161', '服务产品', '35');
INSERT INTO `tb_item_cat` VALUES ('245', '244', '上门服务', '35');
INSERT INTO `tb_item_cat` VALUES ('246', '244', '远程服务', '35');
INSERT INTO `tb_item_cat` VALUES ('247', '244', '电脑软件', '35');
INSERT INTO `tb_item_cat` VALUES ('248', '244', '京东服务', '35');
INSERT INTO `tb_item_cat` VALUES ('249', '0', '个护化妆', '35');
INSERT INTO `tb_item_cat` VALUES ('250', '249', '面部护肤', '35');
INSERT INTO `tb_item_cat` VALUES ('251', '250', '清洁', '35');
INSERT INTO `tb_item_cat` VALUES ('252', '250', '护肤', '35');
INSERT INTO `tb_item_cat` VALUES ('253', '250', '面膜', '35');
INSERT INTO `tb_item_cat` VALUES ('254', '250', '剃须', '35');
INSERT INTO `tb_item_cat` VALUES ('255', '250', '套装', '35');
INSERT INTO `tb_item_cat` VALUES ('256', '249', '身体护肤', '35');
INSERT INTO `tb_item_cat` VALUES ('257', '256', '沐浴', '35');
INSERT INTO `tb_item_cat` VALUES ('258', '256', '润肤', '35');
INSERT INTO `tb_item_cat` VALUES ('259', '256', '颈部', '35');
INSERT INTO `tb_item_cat` VALUES ('260', '256', '手足', '35');
INSERT INTO `tb_item_cat` VALUES ('261', '256', '纤体塑形', '35');
INSERT INTO `tb_item_cat` VALUES ('262', '256', '美胸', '35');
INSERT INTO `tb_item_cat` VALUES ('263', '256', '套装', '35');
INSERT INTO `tb_item_cat` VALUES ('264', '249', '口腔护理', '35');
INSERT INTO `tb_item_cat` VALUES ('265', '264', '牙膏/牙粉', '35');
INSERT INTO `tb_item_cat` VALUES ('266', '264', '牙刷/牙线', '35');
INSERT INTO `tb_item_cat` VALUES ('267', '264', '漱口水', '35');
INSERT INTO `tb_item_cat` VALUES ('268', '264', '套装', '35');
INSERT INTO `tb_item_cat` VALUES ('269', '249', '女性护理', '35');
INSERT INTO `tb_item_cat` VALUES ('270', '269', '卫生巾', '35');
INSERT INTO `tb_item_cat` VALUES ('271', '269', '卫生护垫', '35');
INSERT INTO `tb_item_cat` VALUES ('272', '269', '私密护理', '35');
INSERT INTO `tb_item_cat` VALUES ('273', '269', '脱毛膏', '35');
INSERT INTO `tb_item_cat` VALUES ('274', '249', '洗发护发', '35');
INSERT INTO `tb_item_cat` VALUES ('275', '274', '洗发', '35');
INSERT INTO `tb_item_cat` VALUES ('276', '274', '护发', '35');
INSERT INTO `tb_item_cat` VALUES ('277', '274', '染发', '35');
INSERT INTO `tb_item_cat` VALUES ('278', '274', '造型', '35');
INSERT INTO `tb_item_cat` VALUES ('279', '274', '假发', '35');
INSERT INTO `tb_item_cat` VALUES ('280', '274', '套装', '35');
INSERT INTO `tb_item_cat` VALUES ('281', '249', '香水彩妆', '35');
INSERT INTO `tb_item_cat` VALUES ('282', '281', '香水', '35');
INSERT INTO `tb_item_cat` VALUES ('283', '281', '底妆', '35');
INSERT INTO `tb_item_cat` VALUES ('284', '281', '腮红', '35');
INSERT INTO `tb_item_cat` VALUES ('285', '281', '眼部', '35');
INSERT INTO `tb_item_cat` VALUES ('286', '281', '唇部', '35');
INSERT INTO `tb_item_cat` VALUES ('287', '281', '美甲', '35');
INSERT INTO `tb_item_cat` VALUES ('288', '281', '美容工具', '35');
INSERT INTO `tb_item_cat` VALUES ('289', '281', '套装', '35');
INSERT INTO `tb_item_cat` VALUES ('290', '0', '钟表', '35');
INSERT INTO `tb_item_cat` VALUES ('291', '290', '钟表', '35');
INSERT INTO `tb_item_cat` VALUES ('292', '291', '男表', '35');
INSERT INTO `tb_item_cat` VALUES ('293', '291', '女表', '35');
INSERT INTO `tb_item_cat` VALUES ('294', '291', '儿童手表', '35');
INSERT INTO `tb_item_cat` VALUES ('295', '291', '座钟挂钟', '35');
INSERT INTO `tb_item_cat` VALUES ('296', '0', '母婴', '35');
INSERT INTO `tb_item_cat` VALUES ('297', '296', '奶粉', '35');
INSERT INTO `tb_item_cat` VALUES ('298', '297', '婴幼奶粉', '35');
INSERT INTO `tb_item_cat` VALUES ('299', '297', '成人奶粉', '35');
INSERT INTO `tb_item_cat` VALUES ('300', '296', '营养辅食', '35');
INSERT INTO `tb_item_cat` VALUES ('301', '300', '益生菌/初乳', '35');
INSERT INTO `tb_item_cat` VALUES ('302', '300', '米粉/菜粉', '35');
INSERT INTO `tb_item_cat` VALUES ('303', '300', '果泥/果汁', '35');
INSERT INTO `tb_item_cat` VALUES ('304', '300', 'DHA', '35');
INSERT INTO `tb_item_cat` VALUES ('305', '300', '宝宝零食', '35');
INSERT INTO `tb_item_cat` VALUES ('306', '300', '钙铁锌/维生素', '35');
INSERT INTO `tb_item_cat` VALUES ('307', '300', '清火/开胃', '35');
INSERT INTO `tb_item_cat` VALUES ('308', '300', '面条/粥', '35');
INSERT INTO `tb_item_cat` VALUES ('309', '296', '尿裤湿巾', '35');
INSERT INTO `tb_item_cat` VALUES ('310', '309', '婴儿尿裤', '35');
INSERT INTO `tb_item_cat` VALUES ('311', '309', '拉拉裤', '35');
INSERT INTO `tb_item_cat` VALUES ('312', '309', '湿巾', '35');
INSERT INTO `tb_item_cat` VALUES ('313', '309', '成人尿裤', '35');
INSERT INTO `tb_item_cat` VALUES ('314', '296', '喂养用品', '35');
INSERT INTO `tb_item_cat` VALUES ('315', '314', '奶瓶奶嘴', '35');
INSERT INTO `tb_item_cat` VALUES ('316', '314', '吸奶器', '35');
INSERT INTO `tb_item_cat` VALUES ('317', '314', '暖奶消毒', '35');
INSERT INTO `tb_item_cat` VALUES ('318', '314', '碗盘叉勺', '35');
INSERT INTO `tb_item_cat` VALUES ('319', '314', '水壶/水杯', '35');
INSERT INTO `tb_item_cat` VALUES ('320', '314', '牙胶安抚', '35');
INSERT INTO `tb_item_cat` VALUES ('321', '314', '辅食料理机', '35');
INSERT INTO `tb_item_cat` VALUES ('322', '296', '洗护用品', '35');
INSERT INTO `tb_item_cat` VALUES ('323', '322', '宝宝护肤', '35');
INSERT INTO `tb_item_cat` VALUES ('324', '322', '宝宝洗浴', '35');
INSERT INTO `tb_item_cat` VALUES ('325', '322', '奶瓶清洗', '35');
INSERT INTO `tb_item_cat` VALUES ('326', '322', '驱蚊防蚊', '35');
INSERT INTO `tb_item_cat` VALUES ('327', '322', '理发器', '35');
INSERT INTO `tb_item_cat` VALUES ('328', '322', '洗衣液/皂', '35');
INSERT INTO `tb_item_cat` VALUES ('329', '322', '日常护理', '35');
INSERT INTO `tb_item_cat` VALUES ('330', '322', '座便器', '35');
INSERT INTO `tb_item_cat` VALUES ('331', '296', '童车童床', '35');
INSERT INTO `tb_item_cat` VALUES ('332', '331', '婴儿推车', '35');
INSERT INTO `tb_item_cat` VALUES ('333', '331', '餐椅摇椅', '35');
INSERT INTO `tb_item_cat` VALUES ('334', '331', '婴儿床', '35');
INSERT INTO `tb_item_cat` VALUES ('335', '331', '学步车', '35');
INSERT INTO `tb_item_cat` VALUES ('336', '331', '三轮车', '35');
INSERT INTO `tb_item_cat` VALUES ('337', '331', '自行车', '35');
INSERT INTO `tb_item_cat` VALUES ('338', '331', '电动车', '35');
INSERT INTO `tb_item_cat` VALUES ('339', '331', '扭扭车', '35');
INSERT INTO `tb_item_cat` VALUES ('340', '331', '滑板车', '35');
INSERT INTO `tb_item_cat` VALUES ('341', '296', '寝居服饰', '35');
INSERT INTO `tb_item_cat` VALUES ('342', '341', '婴儿外出服', '35');
INSERT INTO `tb_item_cat` VALUES ('343', '341', '婴儿内衣', '35');
INSERT INTO `tb_item_cat` VALUES ('344', '341', '婴儿礼盒', '35');
INSERT INTO `tb_item_cat` VALUES ('345', '341', '婴儿鞋帽袜', '35');
INSERT INTO `tb_item_cat` VALUES ('346', '341', '安全防护', '35');
INSERT INTO `tb_item_cat` VALUES ('347', '341', '家居床品', '35');
INSERT INTO `tb_item_cat` VALUES ('348', '296', '妈妈专区', '35');
INSERT INTO `tb_item_cat` VALUES ('349', '348', '妈咪包/背婴带', '35');
INSERT INTO `tb_item_cat` VALUES ('350', '348', '产后塑身', '35');
INSERT INTO `tb_item_cat` VALUES ('351', '348', '文胸/内裤', '35');
INSERT INTO `tb_item_cat` VALUES ('352', '348', '防辐射服', '35');
INSERT INTO `tb_item_cat` VALUES ('353', '348', '孕妇装', '35');
INSERT INTO `tb_item_cat` VALUES ('354', '348', '孕期营养', '35');
INSERT INTO `tb_item_cat` VALUES ('355', '348', '孕妈美容', '35');
INSERT INTO `tb_item_cat` VALUES ('356', '348', '待产/新生', '35');
INSERT INTO `tb_item_cat` VALUES ('357', '348', '月子装', '35');
INSERT INTO `tb_item_cat` VALUES ('358', '296', '童装童鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('359', '358', '套装', '35');
INSERT INTO `tb_item_cat` VALUES ('360', '358', '上衣', '35');
INSERT INTO `tb_item_cat` VALUES ('361', '358', '裤子', '35');
INSERT INTO `tb_item_cat` VALUES ('362', '358', '裙子', '35');
INSERT INTO `tb_item_cat` VALUES ('363', '358', '内衣/家居服', '35');
INSERT INTO `tb_item_cat` VALUES ('364', '358', '羽绒服/棉服', '35');
INSERT INTO `tb_item_cat` VALUES ('365', '358', '亲子装', '35');
INSERT INTO `tb_item_cat` VALUES ('366', '358', '儿童配饰', '35');
INSERT INTO `tb_item_cat` VALUES ('367', '358', '礼服/演出服', '35');
INSERT INTO `tb_item_cat` VALUES ('368', '358', '运动鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('369', '358', '皮鞋/帆布鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('370', '358', '靴子', '35');
INSERT INTO `tb_item_cat` VALUES ('371', '358', '凉鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('372', '358', '功能鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('373', '358', '户外/运动服', '35');
INSERT INTO `tb_item_cat` VALUES ('374', '296', '安全座椅', '35');
INSERT INTO `tb_item_cat` VALUES ('375', '374', '提篮式', '35');
INSERT INTO `tb_item_cat` VALUES ('376', '374', '安全座椅', '35');
INSERT INTO `tb_item_cat` VALUES ('377', '374', '增高垫', '35');
INSERT INTO `tb_item_cat` VALUES ('378', '0', '食品饮料、保健食品', '35');
INSERT INTO `tb_item_cat` VALUES ('379', '378', '进口食品', '35');
INSERT INTO `tb_item_cat` VALUES ('380', '379', '饼干蛋糕', '35');
INSERT INTO `tb_item_cat` VALUES ('381', '379', '糖果/巧克力', '35');
INSERT INTO `tb_item_cat` VALUES ('382', '379', '休闲零食', '35');
INSERT INTO `tb_item_cat` VALUES ('383', '379', '冲调饮品', '35');
INSERT INTO `tb_item_cat` VALUES ('384', '379', '粮油调味', '35');
INSERT INTO `tb_item_cat` VALUES ('385', '379', '牛奶', '35');
INSERT INTO `tb_item_cat` VALUES ('386', '378', '地方特产', '35');
INSERT INTO `tb_item_cat` VALUES ('387', '386', '其他特产', '35');
INSERT INTO `tb_item_cat` VALUES ('388', '386', '新疆', '35');
INSERT INTO `tb_item_cat` VALUES ('389', '386', '北京', '35');
INSERT INTO `tb_item_cat` VALUES ('390', '386', '山西', '35');
INSERT INTO `tb_item_cat` VALUES ('391', '386', '内蒙古', '35');
INSERT INTO `tb_item_cat` VALUES ('392', '386', '福建', '35');
INSERT INTO `tb_item_cat` VALUES ('393', '386', '湖南', '35');
INSERT INTO `tb_item_cat` VALUES ('394', '386', '四川', '35');
INSERT INTO `tb_item_cat` VALUES ('395', '386', '云南', '35');
INSERT INTO `tb_item_cat` VALUES ('396', '386', '东北', '35');
INSERT INTO `tb_item_cat` VALUES ('397', '378', '休闲食品', '35');
INSERT INTO `tb_item_cat` VALUES ('398', '397', '休闲零食', '35');
INSERT INTO `tb_item_cat` VALUES ('399', '397', '坚果炒货', '35');
INSERT INTO `tb_item_cat` VALUES ('400', '397', '肉干肉脯', '35');
INSERT INTO `tb_item_cat` VALUES ('401', '397', '蜜饯果干', '35');
INSERT INTO `tb_item_cat` VALUES ('402', '397', '糖果/巧克力', '35');
INSERT INTO `tb_item_cat` VALUES ('403', '397', '饼干蛋糕', '35');
INSERT INTO `tb_item_cat` VALUES ('404', '397', '无糖食品', '35');
INSERT INTO `tb_item_cat` VALUES ('405', '378', '粮油调味', '35');
INSERT INTO `tb_item_cat` VALUES ('406', '405', '米面杂粮', '35');
INSERT INTO `tb_item_cat` VALUES ('407', '405', '食用油', '35');
INSERT INTO `tb_item_cat` VALUES ('408', '405', '调味品', '35');
INSERT INTO `tb_item_cat` VALUES ('409', '405', '南北干货', '35');
INSERT INTO `tb_item_cat` VALUES ('410', '405', '方便食品', '35');
INSERT INTO `tb_item_cat` VALUES ('411', '405', '有机食品', '35');
INSERT INTO `tb_item_cat` VALUES ('412', '378', '饮料冲调', '35');
INSERT INTO `tb_item_cat` VALUES ('413', '412', '饮用水', '35');
INSERT INTO `tb_item_cat` VALUES ('414', '412', '饮料', '35');
INSERT INTO `tb_item_cat` VALUES ('415', '412', '牛奶乳品', '35');
INSERT INTO `tb_item_cat` VALUES ('416', '412', '咖啡/奶茶', '35');
INSERT INTO `tb_item_cat` VALUES ('417', '412', '冲饮谷物', '35');
INSERT INTO `tb_item_cat` VALUES ('418', '412', '蜂蜜/柚子茶', '35');
INSERT INTO `tb_item_cat` VALUES ('419', '412', '成人奶粉', '35');
INSERT INTO `tb_item_cat` VALUES ('420', '378', '食品礼券', '35');
INSERT INTO `tb_item_cat` VALUES ('421', '420', '月饼', '35');
INSERT INTO `tb_item_cat` VALUES ('422', '420', '大闸蟹', '35');
INSERT INTO `tb_item_cat` VALUES ('423', '420', '粽子', '35');
INSERT INTO `tb_item_cat` VALUES ('424', '420', '卡券', '35');
INSERT INTO `tb_item_cat` VALUES ('425', '378', '茗茶', '35');
INSERT INTO `tb_item_cat` VALUES ('426', '425', '铁观音', '35');
INSERT INTO `tb_item_cat` VALUES ('427', '425', '普洱', '35');
INSERT INTO `tb_item_cat` VALUES ('428', '425', '龙井', '35');
INSERT INTO `tb_item_cat` VALUES ('429', '425', '绿茶', '35');
INSERT INTO `tb_item_cat` VALUES ('430', '425', '红茶', '35');
INSERT INTO `tb_item_cat` VALUES ('431', '425', '乌龙茶', '35');
INSERT INTO `tb_item_cat` VALUES ('432', '425', '花草茶', '35');
INSERT INTO `tb_item_cat` VALUES ('433', '425', '花果茶', '35');
INSERT INTO `tb_item_cat` VALUES ('434', '425', '养生茶', '35');
INSERT INTO `tb_item_cat` VALUES ('435', '425', '黑茶', '35');
INSERT INTO `tb_item_cat` VALUES ('436', '425', '白茶', '35');
INSERT INTO `tb_item_cat` VALUES ('437', '425', '其它茶', '35');
INSERT INTO `tb_item_cat` VALUES ('438', '0', '汽车用品', '35');
INSERT INTO `tb_item_cat` VALUES ('439', '438', '维修保养', '35');
INSERT INTO `tb_item_cat` VALUES ('440', '439', '润滑油', '35');
INSERT INTO `tb_item_cat` VALUES ('441', '439', '添加剂', '35');
INSERT INTO `tb_item_cat` VALUES ('442', '439', '防冻液', '35');
INSERT INTO `tb_item_cat` VALUES ('443', '439', '滤清器', '35');
INSERT INTO `tb_item_cat` VALUES ('444', '439', '火花塞', '35');
INSERT INTO `tb_item_cat` VALUES ('445', '439', '雨刷', '35');
INSERT INTO `tb_item_cat` VALUES ('446', '439', '车灯', '35');
INSERT INTO `tb_item_cat` VALUES ('447', '439', '后视镜', '35');
INSERT INTO `tb_item_cat` VALUES ('448', '439', '轮胎', '35');
INSERT INTO `tb_item_cat` VALUES ('449', '439', '轮毂', '35');
INSERT INTO `tb_item_cat` VALUES ('450', '439', '刹车片/盘', '35');
INSERT INTO `tb_item_cat` VALUES ('451', '439', '喇叭/皮带', '35');
INSERT INTO `tb_item_cat` VALUES ('452', '439', '蓄电池', '35');
INSERT INTO `tb_item_cat` VALUES ('453', '439', '底盘装甲/护板', '35');
INSERT INTO `tb_item_cat` VALUES ('454', '439', '贴膜', '35');
INSERT INTO `tb_item_cat` VALUES ('455', '439', '汽修工具', '35');
INSERT INTO `tb_item_cat` VALUES ('456', '438', '车载电器', '35');
INSERT INTO `tb_item_cat` VALUES ('457', '456', '导航仪', '35');
INSERT INTO `tb_item_cat` VALUES ('458', '456', '安全预警仪', '35');
INSERT INTO `tb_item_cat` VALUES ('459', '456', '行车记录仪', '35');
INSERT INTO `tb_item_cat` VALUES ('460', '456', '倒车雷达', '35');
INSERT INTO `tb_item_cat` VALUES ('461', '456', '蓝牙设备', '35');
INSERT INTO `tb_item_cat` VALUES ('462', '456', '时尚影音', '35');
INSERT INTO `tb_item_cat` VALUES ('463', '456', '净化器', '35');
INSERT INTO `tb_item_cat` VALUES ('464', '456', '电源', '35');
INSERT INTO `tb_item_cat` VALUES ('465', '456', '冰箱', '35');
INSERT INTO `tb_item_cat` VALUES ('466', '456', '吸尘器', '35');
INSERT INTO `tb_item_cat` VALUES ('467', '438', '美容清洗', '35');
INSERT INTO `tb_item_cat` VALUES ('468', '467', '车蜡', '35');
INSERT INTO `tb_item_cat` VALUES ('469', '467', '补漆笔', '35');
INSERT INTO `tb_item_cat` VALUES ('470', '467', '玻璃水', '35');
INSERT INTO `tb_item_cat` VALUES ('471', '467', '清洁剂', '35');
INSERT INTO `tb_item_cat` VALUES ('472', '467', '洗车工具', '35');
INSERT INTO `tb_item_cat` VALUES ('473', '467', '洗车配件', '35');
INSERT INTO `tb_item_cat` VALUES ('474', '438', '汽车装饰', '35');
INSERT INTO `tb_item_cat` VALUES ('475', '474', '脚垫', '35');
INSERT INTO `tb_item_cat` VALUES ('476', '474', '座垫', '35');
INSERT INTO `tb_item_cat` VALUES ('477', '474', '座套', '35');
INSERT INTO `tb_item_cat` VALUES ('478', '474', '后备箱垫', '35');
INSERT INTO `tb_item_cat` VALUES ('479', '474', '头枕腰靠', '35');
INSERT INTO `tb_item_cat` VALUES ('480', '474', '香水', '35');
INSERT INTO `tb_item_cat` VALUES ('481', '474', '空气净化', '35');
INSERT INTO `tb_item_cat` VALUES ('482', '474', '车内饰品', '35');
INSERT INTO `tb_item_cat` VALUES ('483', '474', '功能小件', '35');
INSERT INTO `tb_item_cat` VALUES ('484', '474', '车身装饰件', '35');
INSERT INTO `tb_item_cat` VALUES ('485', '474', '车衣', '35');
INSERT INTO `tb_item_cat` VALUES ('486', '438', '安全自驾', '35');
INSERT INTO `tb_item_cat` VALUES ('487', '486', '安全座椅', '35');
INSERT INTO `tb_item_cat` VALUES ('488', '486', '胎压充气', '35');
INSERT INTO `tb_item_cat` VALUES ('489', '486', '防盗设备', '35');
INSERT INTO `tb_item_cat` VALUES ('490', '486', '应急救援', '35');
INSERT INTO `tb_item_cat` VALUES ('491', '486', '保温箱', '35');
INSERT INTO `tb_item_cat` VALUES ('492', '486', '储物箱', '35');
INSERT INTO `tb_item_cat` VALUES ('493', '486', '自驾野营', '35');
INSERT INTO `tb_item_cat` VALUES ('494', '486', '摩托车装备', '35');
INSERT INTO `tb_item_cat` VALUES ('495', '0', '玩具乐器', '35');
INSERT INTO `tb_item_cat` VALUES ('496', '495', '适用年龄', '35');
INSERT INTO `tb_item_cat` VALUES ('497', '496', '0-6个月', '35');
INSERT INTO `tb_item_cat` VALUES ('498', '496', '6-12个月', '35');
INSERT INTO `tb_item_cat` VALUES ('499', '496', '1-3岁', '35');
INSERT INTO `tb_item_cat` VALUES ('500', '496', '3-6岁', '35');
INSERT INTO `tb_item_cat` VALUES ('501', '496', '6-14岁', '35');
INSERT INTO `tb_item_cat` VALUES ('502', '496', '14岁以上', '35');
INSERT INTO `tb_item_cat` VALUES ('503', '495', '遥控/电动', '35');
INSERT INTO `tb_item_cat` VALUES ('504', '503', '遥控车', '35');
INSERT INTO `tb_item_cat` VALUES ('505', '503', '遥控飞机', '35');
INSERT INTO `tb_item_cat` VALUES ('506', '503', '遥控船', '35');
INSERT INTO `tb_item_cat` VALUES ('507', '503', '机器人/电动', '35');
INSERT INTO `tb_item_cat` VALUES ('508', '503', '轨道/助力', '35');
INSERT INTO `tb_item_cat` VALUES ('509', '495', '毛绒布艺', '35');
INSERT INTO `tb_item_cat` VALUES ('510', '509', '毛绒/布艺', '35');
INSERT INTO `tb_item_cat` VALUES ('511', '509', '靠垫/抱枕', '35');
INSERT INTO `tb_item_cat` VALUES ('512', '495', '娃娃玩具', '35');
INSERT INTO `tb_item_cat` VALUES ('513', '512', '芭比娃娃', '35');
INSERT INTO `tb_item_cat` VALUES ('514', '512', '卡通娃娃', '35');
INSERT INTO `tb_item_cat` VALUES ('515', '512', '智能娃娃', '35');
INSERT INTO `tb_item_cat` VALUES ('516', '495', '模型玩具', '35');
INSERT INTO `tb_item_cat` VALUES ('517', '516', '仿真模型', '35');
INSERT INTO `tb_item_cat` VALUES ('518', '516', '拼插模型', '35');
INSERT INTO `tb_item_cat` VALUES ('519', '516', '收藏爱好', '35');
INSERT INTO `tb_item_cat` VALUES ('520', '495', '健身玩具', '35');
INSERT INTO `tb_item_cat` VALUES ('521', '520', '炫舞毯', '35');
INSERT INTO `tb_item_cat` VALUES ('522', '520', '爬行垫/毯', '35');
INSERT INTO `tb_item_cat` VALUES ('523', '520', '户外玩具', '35');
INSERT INTO `tb_item_cat` VALUES ('524', '520', '戏水玩具', '35');
INSERT INTO `tb_item_cat` VALUES ('525', '495', '动漫玩具', '35');
INSERT INTO `tb_item_cat` VALUES ('526', '525', '电影周边', '35');
INSERT INTO `tb_item_cat` VALUES ('527', '525', '卡通周边', '35');
INSERT INTO `tb_item_cat` VALUES ('528', '525', '网游周边', '35');
INSERT INTO `tb_item_cat` VALUES ('529', '495', '益智玩具', '35');
INSERT INTO `tb_item_cat` VALUES ('530', '529', '摇铃/床铃', '35');
INSERT INTO `tb_item_cat` VALUES ('531', '529', '健身架', '35');
INSERT INTO `tb_item_cat` VALUES ('532', '529', '早教启智', '35');
INSERT INTO `tb_item_cat` VALUES ('533', '529', '拖拉玩具', '35');
INSERT INTO `tb_item_cat` VALUES ('534', '495', '积木拼插', '35');
INSERT INTO `tb_item_cat` VALUES ('535', '534', '积木', '35');
INSERT INTO `tb_item_cat` VALUES ('536', '534', '拼图', '35');
INSERT INTO `tb_item_cat` VALUES ('537', '534', '磁力棒', '35');
INSERT INTO `tb_item_cat` VALUES ('538', '534', '立体拼插', '35');
INSERT INTO `tb_item_cat` VALUES ('539', '495', 'DIY玩具', '35');
INSERT INTO `tb_item_cat` VALUES ('540', '539', '手工彩泥', '35');
INSERT INTO `tb_item_cat` VALUES ('541', '539', '绘画工具', '35');
INSERT INTO `tb_item_cat` VALUES ('542', '539', '情景玩具', '35');
INSERT INTO `tb_item_cat` VALUES ('543', '495', '创意减压', '35');
INSERT INTO `tb_item_cat` VALUES ('544', '543', '减压玩具', '35');
INSERT INTO `tb_item_cat` VALUES ('545', '543', '创意玩具', '35');
INSERT INTO `tb_item_cat` VALUES ('546', '495', '乐器相关', '35');
INSERT INTO `tb_item_cat` VALUES ('547', '546', '钢琴', '35');
INSERT INTO `tb_item_cat` VALUES ('548', '546', '电子琴', '35');
INSERT INTO `tb_item_cat` VALUES ('549', '546', '手风琴', '35');
INSERT INTO `tb_item_cat` VALUES ('550', '546', '吉他/贝斯', '35');
INSERT INTO `tb_item_cat` VALUES ('551', '546', '民族管弦乐器', '35');
INSERT INTO `tb_item_cat` VALUES ('552', '546', '西洋管弦乐', '35');
INSERT INTO `tb_item_cat` VALUES ('553', '546', '口琴/口风琴/竖笛', '35');
INSERT INTO `tb_item_cat` VALUES ('554', '546', '西洋打击乐器', '35');
INSERT INTO `tb_item_cat` VALUES ('555', '546', '各式乐器配件', '35');
INSERT INTO `tb_item_cat` VALUES ('556', '546', '电脑音乐', '35');
INSERT INTO `tb_item_cat` VALUES ('557', '546', '工艺礼品乐器', '35');
INSERT INTO `tb_item_cat` VALUES ('558', '0', '手机', '44');
INSERT INTO `tb_item_cat` VALUES ('559', '558', '手机通讯', '35');
INSERT INTO `tb_item_cat` VALUES ('560', '559', '手机', '44');
INSERT INTO `tb_item_cat` VALUES ('561', '559', '对讲机', '35');
INSERT INTO `tb_item_cat` VALUES ('562', '558', '运营商', '35');
INSERT INTO `tb_item_cat` VALUES ('563', '562', '购机送费', '35');
INSERT INTO `tb_item_cat` VALUES ('564', '562', '“0”元购机', '35');
INSERT INTO `tb_item_cat` VALUES ('565', '562', '选号中心', '35');
INSERT INTO `tb_item_cat` VALUES ('566', '562', '选号入网', '35');
INSERT INTO `tb_item_cat` VALUES ('567', '558', '手机配件', '35');
INSERT INTO `tb_item_cat` VALUES ('568', '567', '手机电池', '35');
INSERT INTO `tb_item_cat` VALUES ('569', '567', '蓝牙耳机', '35');
INSERT INTO `tb_item_cat` VALUES ('570', '567', '充电器/数据线', '35');
INSERT INTO `tb_item_cat` VALUES ('571', '567', '手机耳机', '35');
INSERT INTO `tb_item_cat` VALUES ('572', '567', '手机贴膜', '35');
INSERT INTO `tb_item_cat` VALUES ('573', '567', '手机存储卡', '35');
INSERT INTO `tb_item_cat` VALUES ('574', '567', '手机保护套', '35');
INSERT INTO `tb_item_cat` VALUES ('575', '567', '车载配件', '35');
INSERT INTO `tb_item_cat` VALUES ('576', '567', 'iPhone 配件', '35');
INSERT INTO `tb_item_cat` VALUES ('577', '567', '创意配件', '35');
INSERT INTO `tb_item_cat` VALUES ('578', '567', '便携/无线音响', '35');
INSERT INTO `tb_item_cat` VALUES ('579', '567', '手机饰品', '35');
INSERT INTO `tb_item_cat` VALUES ('580', '0', '数码', '35');
INSERT INTO `tb_item_cat` VALUES ('581', '580', '摄影摄像', '35');
INSERT INTO `tb_item_cat` VALUES ('582', '581', '数码相机', '35');
INSERT INTO `tb_item_cat` VALUES ('583', '581', '单电/微单相机', '35');
INSERT INTO `tb_item_cat` VALUES ('584', '581', '单反相机', '35');
INSERT INTO `tb_item_cat` VALUES ('585', '581', '摄像机', '35');
INSERT INTO `tb_item_cat` VALUES ('586', '581', '拍立得', '35');
INSERT INTO `tb_item_cat` VALUES ('587', '581', '运动相机', '35');
INSERT INTO `tb_item_cat` VALUES ('588', '581', '镜头', '35');
INSERT INTO `tb_item_cat` VALUES ('589', '581', '户外器材', '35');
INSERT INTO `tb_item_cat` VALUES ('590', '581', '影棚器材', '35');
INSERT INTO `tb_item_cat` VALUES ('591', '580', '数码配件', '35');
INSERT INTO `tb_item_cat` VALUES ('592', '591', '存储卡', '35');
INSERT INTO `tb_item_cat` VALUES ('593', '591', '读卡器', '35');
INSERT INTO `tb_item_cat` VALUES ('594', '591', '滤镜', '35');
INSERT INTO `tb_item_cat` VALUES ('595', '591', '闪光灯/手柄', '35');
INSERT INTO `tb_item_cat` VALUES ('596', '591', '相机包', '35');
INSERT INTO `tb_item_cat` VALUES ('597', '591', '三脚架/云台', '35');
INSERT INTO `tb_item_cat` VALUES ('598', '591', '相机清洁', '35');
INSERT INTO `tb_item_cat` VALUES ('599', '591', '相机贴膜', '35');
INSERT INTO `tb_item_cat` VALUES ('600', '591', '机身附件', '35');
INSERT INTO `tb_item_cat` VALUES ('601', '591', '镜头附件', '35');
INSERT INTO `tb_item_cat` VALUES ('602', '591', '电池/充电器', '35');
INSERT INTO `tb_item_cat` VALUES ('603', '591', '移动电源', '35');
INSERT INTO `tb_item_cat` VALUES ('604', '580', '智能设备', '35');
INSERT INTO `tb_item_cat` VALUES ('605', '604', '智能手环', '35');
INSERT INTO `tb_item_cat` VALUES ('606', '604', '智能手表', '35');
INSERT INTO `tb_item_cat` VALUES ('607', '604', '智能眼镜', '35');
INSERT INTO `tb_item_cat` VALUES ('608', '604', '运动跟踪器', '35');
INSERT INTO `tb_item_cat` VALUES ('609', '604', '健康监测', '35');
INSERT INTO `tb_item_cat` VALUES ('610', '604', '智能配饰', '35');
INSERT INTO `tb_item_cat` VALUES ('611', '604', '智能家居', '35');
INSERT INTO `tb_item_cat` VALUES ('612', '604', '体感车', '35');
INSERT INTO `tb_item_cat` VALUES ('613', '604', '其他配件', '35');
INSERT INTO `tb_item_cat` VALUES ('614', '580', '时尚影音', '35');
INSERT INTO `tb_item_cat` VALUES ('615', '614', 'MP3/MP4', '35');
INSERT INTO `tb_item_cat` VALUES ('616', '614', '智能设备', '35');
INSERT INTO `tb_item_cat` VALUES ('617', '614', '耳机/耳麦', '35');
INSERT INTO `tb_item_cat` VALUES ('618', '614', '音箱', '35');
INSERT INTO `tb_item_cat` VALUES ('619', '614', '高清播放器', '35');
INSERT INTO `tb_item_cat` VALUES ('620', '614', 'MP3/MP4配件', '35');
INSERT INTO `tb_item_cat` VALUES ('621', '614', '麦克风', '35');
INSERT INTO `tb_item_cat` VALUES ('622', '614', '专业音频', '35');
INSERT INTO `tb_item_cat` VALUES ('623', '614', '数码相框', '35');
INSERT INTO `tb_item_cat` VALUES ('624', '614', '苹果配件', '35');
INSERT INTO `tb_item_cat` VALUES ('625', '580', '电子教育', '35');
INSERT INTO `tb_item_cat` VALUES ('626', '625', '电子词典', '35');
INSERT INTO `tb_item_cat` VALUES ('627', '625', '电纸书', '35');
INSERT INTO `tb_item_cat` VALUES ('628', '625', '录音笔', '35');
INSERT INTO `tb_item_cat` VALUES ('629', '625', '复读机', '35');
INSERT INTO `tb_item_cat` VALUES ('630', '625', '点读机/笔', '35');
INSERT INTO `tb_item_cat` VALUES ('631', '625', '学生平板', '35');
INSERT INTO `tb_item_cat` VALUES ('632', '625', '早教机', '35');
INSERT INTO `tb_item_cat` VALUES ('633', '0', '家居家装', '35');
INSERT INTO `tb_item_cat` VALUES ('634', '633', '家纺', '35');
INSERT INTO `tb_item_cat` VALUES ('635', '634', '床品套件', '35');
INSERT INTO `tb_item_cat` VALUES ('636', '634', '被子', '35');
INSERT INTO `tb_item_cat` VALUES ('637', '634', '枕芯', '35');
INSERT INTO `tb_item_cat` VALUES ('638', '634', '床单被罩', '35');
INSERT INTO `tb_item_cat` VALUES ('639', '634', '毯子', '35');
INSERT INTO `tb_item_cat` VALUES ('640', '634', '床垫/床褥', '35');
INSERT INTO `tb_item_cat` VALUES ('641', '634', '蚊帐', '35');
INSERT INTO `tb_item_cat` VALUES ('642', '634', '抱枕靠垫', '35');
INSERT INTO `tb_item_cat` VALUES ('643', '634', '毛巾浴巾', '35');
INSERT INTO `tb_item_cat` VALUES ('644', '634', '电热毯', '35');
INSERT INTO `tb_item_cat` VALUES ('645', '634', '窗帘/窗纱', '35');
INSERT INTO `tb_item_cat` VALUES ('646', '634', '布艺软饰', '35');
INSERT INTO `tb_item_cat` VALUES ('647', '634', '凉席', '35');
INSERT INTO `tb_item_cat` VALUES ('648', '633', '灯具', '35');
INSERT INTO `tb_item_cat` VALUES ('649', '648', '台灯', '35');
INSERT INTO `tb_item_cat` VALUES ('650', '648', '节能灯', '35');
INSERT INTO `tb_item_cat` VALUES ('651', '648', '装饰灯', '35');
INSERT INTO `tb_item_cat` VALUES ('652', '648', '落地灯', '35');
INSERT INTO `tb_item_cat` VALUES ('653', '648', '应急灯/手电', '35');
INSERT INTO `tb_item_cat` VALUES ('654', '648', 'LED灯', '35');
INSERT INTO `tb_item_cat` VALUES ('655', '648', '吸顶灯', '35');
INSERT INTO `tb_item_cat` VALUES ('656', '648', '五金电器', '35');
INSERT INTO `tb_item_cat` VALUES ('657', '648', '筒灯射灯', '35');
INSERT INTO `tb_item_cat` VALUES ('658', '648', '吊灯', '35');
INSERT INTO `tb_item_cat` VALUES ('659', '648', '氛围照明', '35');
INSERT INTO `tb_item_cat` VALUES ('660', '633', '生活日用', '35');
INSERT INTO `tb_item_cat` VALUES ('661', '660', '收纳用品', '35');
INSERT INTO `tb_item_cat` VALUES ('662', '660', '雨伞雨具', '35');
INSERT INTO `tb_item_cat` VALUES ('663', '660', '浴室用品', '35');
INSERT INTO `tb_item_cat` VALUES ('664', '660', '缝纫/针织用品', '35');
INSERT INTO `tb_item_cat` VALUES ('665', '660', '洗晒/熨烫', '35');
INSERT INTO `tb_item_cat` VALUES ('666', '660', '净化除味', '35');
INSERT INTO `tb_item_cat` VALUES ('667', '633', '家装软饰', '35');
INSERT INTO `tb_item_cat` VALUES ('668', '667', '桌布/罩件', '35');
INSERT INTO `tb_item_cat` VALUES ('669', '667', '地毯地垫', '35');
INSERT INTO `tb_item_cat` VALUES ('670', '667', '沙发垫套/椅垫', '35');
INSERT INTO `tb_item_cat` VALUES ('671', '667', '相框/照片墙', '35');
INSERT INTO `tb_item_cat` VALUES ('672', '667', '装饰字画', '35');
INSERT INTO `tb_item_cat` VALUES ('673', '667', '节庆饰品', '35');
INSERT INTO `tb_item_cat` VALUES ('674', '667', '手工/十字绣', '35');
INSERT INTO `tb_item_cat` VALUES ('675', '667', '装饰摆件', '35');
INSERT INTO `tb_item_cat` VALUES ('676', '667', '保暖防护', '35');
INSERT INTO `tb_item_cat` VALUES ('677', '667', '帘艺隔断', '35');
INSERT INTO `tb_item_cat` VALUES ('678', '667', '墙贴/装饰贴', '35');
INSERT INTO `tb_item_cat` VALUES ('679', '667', '钟饰', '35');
INSERT INTO `tb_item_cat` VALUES ('680', '667', '花瓶花艺', '35');
INSERT INTO `tb_item_cat` VALUES ('681', '667', '香薰蜡烛', '35');
INSERT INTO `tb_item_cat` VALUES ('682', '667', '创意家居', '35');
INSERT INTO `tb_item_cat` VALUES ('683', '633', '清洁用品', '35');
INSERT INTO `tb_item_cat` VALUES ('684', '683', '纸品湿巾', '35');
INSERT INTO `tb_item_cat` VALUES ('685', '683', '衣物清洁', '35');
INSERT INTO `tb_item_cat` VALUES ('686', '683', '清洁工具', '35');
INSERT INTO `tb_item_cat` VALUES ('687', '683', '驱虫用品', '35');
INSERT INTO `tb_item_cat` VALUES ('688', '683', '家庭清洁', '35');
INSERT INTO `tb_item_cat` VALUES ('689', '683', '皮具护理', '35');
INSERT INTO `tb_item_cat` VALUES ('690', '683', '一次性用品', '35');
INSERT INTO `tb_item_cat` VALUES ('691', '633', '宠物生活', '35');
INSERT INTO `tb_item_cat` VALUES ('692', '691', '宠物主粮', '35');
INSERT INTO `tb_item_cat` VALUES ('693', '691', '宠物零食', '35');
INSERT INTO `tb_item_cat` VALUES ('694', '691', '医疗保健', '35');
INSERT INTO `tb_item_cat` VALUES ('695', '691', '家居日用', '35');
INSERT INTO `tb_item_cat` VALUES ('696', '691', '宠物玩具', '35');
INSERT INTO `tb_item_cat` VALUES ('697', '691', '出行装备', '35');
INSERT INTO `tb_item_cat` VALUES ('698', '691', '洗护美容', '35');
INSERT INTO `tb_item_cat` VALUES ('699', '0', '厨具', '35');
INSERT INTO `tb_item_cat` VALUES ('700', '699', '烹饪锅具', '35');
INSERT INTO `tb_item_cat` VALUES ('701', '700', '炒锅', '35');
INSERT INTO `tb_item_cat` VALUES ('702', '700', '煎锅', '35');
INSERT INTO `tb_item_cat` VALUES ('703', '700', '压力锅', '35');
INSERT INTO `tb_item_cat` VALUES ('704', '700', '蒸锅', '35');
INSERT INTO `tb_item_cat` VALUES ('705', '700', '汤锅', '35');
INSERT INTO `tb_item_cat` VALUES ('706', '700', '奶锅', '35');
INSERT INTO `tb_item_cat` VALUES ('707', '700', '锅具套装', '35');
INSERT INTO `tb_item_cat` VALUES ('708', '700', '煲类', '35');
INSERT INTO `tb_item_cat` VALUES ('709', '700', '水壶', '35');
INSERT INTO `tb_item_cat` VALUES ('710', '700', '火锅', '35');
INSERT INTO `tb_item_cat` VALUES ('711', '699', '刀剪菜板', '35');
INSERT INTO `tb_item_cat` VALUES ('712', '711', '菜刀', '35');
INSERT INTO `tb_item_cat` VALUES ('713', '711', '剪刀', '35');
INSERT INTO `tb_item_cat` VALUES ('714', '711', '刀具套装', '35');
INSERT INTO `tb_item_cat` VALUES ('715', '711', '砧板', '35');
INSERT INTO `tb_item_cat` VALUES ('716', '711', '瓜果刀/刨', '35');
INSERT INTO `tb_item_cat` VALUES ('717', '711', '多功能刀', '35');
INSERT INTO `tb_item_cat` VALUES ('718', '699', '厨房配件', '35');
INSERT INTO `tb_item_cat` VALUES ('719', '718', '保鲜盒', '35');
INSERT INTO `tb_item_cat` VALUES ('720', '718', '烘焙/烧烤', '35');
INSERT INTO `tb_item_cat` VALUES ('721', '718', '饭盒/提锅', '35');
INSERT INTO `tb_item_cat` VALUES ('722', '718', '储物/置物架', '35');
INSERT INTO `tb_item_cat` VALUES ('723', '718', '厨房DIY/小工具', '35');
INSERT INTO `tb_item_cat` VALUES ('724', '699', '水具酒具', '35');
INSERT INTO `tb_item_cat` VALUES ('725', '724', '塑料杯', '35');
INSERT INTO `tb_item_cat` VALUES ('726', '724', '运动水壶', '35');
INSERT INTO `tb_item_cat` VALUES ('727', '724', '玻璃杯', '35');
INSERT INTO `tb_item_cat` VALUES ('728', '724', '陶瓷/马克杯', '35');
INSERT INTO `tb_item_cat` VALUES ('729', '724', '保温杯', '35');
INSERT INTO `tb_item_cat` VALUES ('730', '724', '保温壶', '35');
INSERT INTO `tb_item_cat` VALUES ('731', '724', '酒杯/酒具', '35');
INSERT INTO `tb_item_cat` VALUES ('732', '724', '杯具套装', '35');
INSERT INTO `tb_item_cat` VALUES ('733', '699', '餐具', '35');
INSERT INTO `tb_item_cat` VALUES ('734', '733', '餐具套装', '35');
INSERT INTO `tb_item_cat` VALUES ('735', '733', '碗/碟/盘', '35');
INSERT INTO `tb_item_cat` VALUES ('736', '733', '筷勺/刀叉', '35');
INSERT INTO `tb_item_cat` VALUES ('737', '733', '一次性用品', '35');
INSERT INTO `tb_item_cat` VALUES ('738', '733', '果盘/果篮', '35');
INSERT INTO `tb_item_cat` VALUES ('739', '699', '茶具/咖啡具', '35');
INSERT INTO `tb_item_cat` VALUES ('740', '739', '整套茶具', '35');
INSERT INTO `tb_item_cat` VALUES ('741', '739', '茶杯', '35');
INSERT INTO `tb_item_cat` VALUES ('742', '739', '茶壶', '35');
INSERT INTO `tb_item_cat` VALUES ('743', '739', '茶盘茶托', '35');
INSERT INTO `tb_item_cat` VALUES ('744', '739', '茶叶罐', '35');
INSERT INTO `tb_item_cat` VALUES ('745', '739', '茶具配件', '35');
INSERT INTO `tb_item_cat` VALUES ('746', '739', '茶宠摆件', '35');
INSERT INTO `tb_item_cat` VALUES ('747', '739', '咖啡具', '35');
INSERT INTO `tb_item_cat` VALUES ('748', '739', '其他', '35');
INSERT INTO `tb_item_cat` VALUES ('749', '0', '服饰内衣', '35');
INSERT INTO `tb_item_cat` VALUES ('750', '749', '女装', '35');
INSERT INTO `tb_item_cat` VALUES ('751', '750', 'T恤', '35');
INSERT INTO `tb_item_cat` VALUES ('752', '750', '衬衫', '35');
INSERT INTO `tb_item_cat` VALUES ('753', '750', '针织衫', '35');
INSERT INTO `tb_item_cat` VALUES ('754', '750', '雪纺衫', '35');
INSERT INTO `tb_item_cat` VALUES ('755', '750', '卫衣', '35');
INSERT INTO `tb_item_cat` VALUES ('756', '750', '马甲', '35');
INSERT INTO `tb_item_cat` VALUES ('757', '750', '连衣裙', '35');
INSERT INTO `tb_item_cat` VALUES ('758', '750', '半身裙', '35');
INSERT INTO `tb_item_cat` VALUES ('759', '750', '牛仔裤', '35');
INSERT INTO `tb_item_cat` VALUES ('760', '750', '休闲裤', '35');
INSERT INTO `tb_item_cat` VALUES ('761', '750', '打底裤', '35');
INSERT INTO `tb_item_cat` VALUES ('762', '750', '正装裤', '35');
INSERT INTO `tb_item_cat` VALUES ('763', '750', '小西装', '35');
INSERT INTO `tb_item_cat` VALUES ('764', '750', '短外套', '35');
INSERT INTO `tb_item_cat` VALUES ('765', '750', '风衣', '35');
INSERT INTO `tb_item_cat` VALUES ('766', '750', '毛呢大衣', '35');
INSERT INTO `tb_item_cat` VALUES ('767', '750', '真皮皮衣', '35');
INSERT INTO `tb_item_cat` VALUES ('768', '750', '棉服', '35');
INSERT INTO `tb_item_cat` VALUES ('769', '750', '羽绒服', '35');
INSERT INTO `tb_item_cat` VALUES ('770', '750', '大码女装', '35');
INSERT INTO `tb_item_cat` VALUES ('771', '750', '中老年女装', '35');
INSERT INTO `tb_item_cat` VALUES ('772', '750', '婚纱', '35');
INSERT INTO `tb_item_cat` VALUES ('773', '750', '打底衫', '35');
INSERT INTO `tb_item_cat` VALUES ('774', '750', '旗袍/唐装', '35');
INSERT INTO `tb_item_cat` VALUES ('775', '750', '加绒裤', '35');
INSERT INTO `tb_item_cat` VALUES ('776', '750', '吊带/背心', '35');
INSERT INTO `tb_item_cat` VALUES ('777', '750', '羊绒衫', '35');
INSERT INTO `tb_item_cat` VALUES ('778', '750', '短裤', '35');
INSERT INTO `tb_item_cat` VALUES ('779', '750', '皮草', '35');
INSERT INTO `tb_item_cat` VALUES ('780', '750', '礼服', '35');
INSERT INTO `tb_item_cat` VALUES ('781', '750', '仿皮皮衣', '35');
INSERT INTO `tb_item_cat` VALUES ('782', '750', '羊毛衫', '35');
INSERT INTO `tb_item_cat` VALUES ('783', '750', '设计师/潮牌', '35');
INSERT INTO `tb_item_cat` VALUES ('784', '749', '男装', '35');
INSERT INTO `tb_item_cat` VALUES ('785', '784', '衬衫', '35');
INSERT INTO `tb_item_cat` VALUES ('786', '784', 'T恤', '35');
INSERT INTO `tb_item_cat` VALUES ('787', '784', 'POLO衫', '35');
INSERT INTO `tb_item_cat` VALUES ('788', '784', '针织衫', '35');
INSERT INTO `tb_item_cat` VALUES ('789', '784', '羊绒衫', '35');
INSERT INTO `tb_item_cat` VALUES ('790', '784', '卫衣', '35');
INSERT INTO `tb_item_cat` VALUES ('791', '784', '马甲/背心', '35');
INSERT INTO `tb_item_cat` VALUES ('792', '784', '夹克', '35');
INSERT INTO `tb_item_cat` VALUES ('793', '784', '风衣', '35');
INSERT INTO `tb_item_cat` VALUES ('794', '784', '毛呢大衣', '35');
INSERT INTO `tb_item_cat` VALUES ('795', '784', '仿皮皮衣', '35');
INSERT INTO `tb_item_cat` VALUES ('796', '784', '西服', '35');
INSERT INTO `tb_item_cat` VALUES ('797', '784', '棉服', '35');
INSERT INTO `tb_item_cat` VALUES ('798', '784', '羽绒服', '35');
INSERT INTO `tb_item_cat` VALUES ('799', '784', '牛仔裤', '35');
INSERT INTO `tb_item_cat` VALUES ('800', '784', '休闲裤', '35');
INSERT INTO `tb_item_cat` VALUES ('801', '784', '西裤', '35');
INSERT INTO `tb_item_cat` VALUES ('802', '784', '西服套装', '35');
INSERT INTO `tb_item_cat` VALUES ('803', '784', '大码男装', '35');
INSERT INTO `tb_item_cat` VALUES ('804', '784', '中老年男装', '35');
INSERT INTO `tb_item_cat` VALUES ('805', '784', '唐装/中山装', '35');
INSERT INTO `tb_item_cat` VALUES ('806', '784', '工装', '35');
INSERT INTO `tb_item_cat` VALUES ('807', '784', '真皮皮衣', '35');
INSERT INTO `tb_item_cat` VALUES ('808', '784', '加绒裤', '35');
INSERT INTO `tb_item_cat` VALUES ('809', '784', '卫裤/运动裤', '35');
INSERT INTO `tb_item_cat` VALUES ('810', '784', '短裤', '35');
INSERT INTO `tb_item_cat` VALUES ('811', '784', '设计师/潮牌', '35');
INSERT INTO `tb_item_cat` VALUES ('812', '784', '羊毛衫', '35');
INSERT INTO `tb_item_cat` VALUES ('813', '749', '内衣', '35');
INSERT INTO `tb_item_cat` VALUES ('814', '813', '文胸', '35');
INSERT INTO `tb_item_cat` VALUES ('815', '813', '女式内裤', '35');
INSERT INTO `tb_item_cat` VALUES ('816', '813', '男式内裤', '35');
INSERT INTO `tb_item_cat` VALUES ('817', '813', '睡衣/家居服', '35');
INSERT INTO `tb_item_cat` VALUES ('818', '813', '塑身美体', '35');
INSERT INTO `tb_item_cat` VALUES ('819', '813', '泳衣', '35');
INSERT INTO `tb_item_cat` VALUES ('820', '813', '吊带/背心', '35');
INSERT INTO `tb_item_cat` VALUES ('821', '813', '抹胸', '35');
INSERT INTO `tb_item_cat` VALUES ('822', '813', '连裤袜/丝袜', '35');
INSERT INTO `tb_item_cat` VALUES ('823', '813', '美腿袜', '35');
INSERT INTO `tb_item_cat` VALUES ('824', '813', '商务男袜', '35');
INSERT INTO `tb_item_cat` VALUES ('825', '813', '保暖内衣', '35');
INSERT INTO `tb_item_cat` VALUES ('826', '813', '情侣睡衣', '35');
INSERT INTO `tb_item_cat` VALUES ('827', '813', '文胸套装', '35');
INSERT INTO `tb_item_cat` VALUES ('828', '813', '少女文胸', '35');
INSERT INTO `tb_item_cat` VALUES ('829', '813', '休闲棉袜', '35');
INSERT INTO `tb_item_cat` VALUES ('830', '813', '大码内衣', '35');
INSERT INTO `tb_item_cat` VALUES ('831', '813', '内衣配件', '35');
INSERT INTO `tb_item_cat` VALUES ('832', '813', '打底裤袜', '35');
INSERT INTO `tb_item_cat` VALUES ('833', '813', '打底衫', '35');
INSERT INTO `tb_item_cat` VALUES ('834', '813', '秋衣秋裤', '35');
INSERT INTO `tb_item_cat` VALUES ('835', '813', '情趣内衣', '35');
INSERT INTO `tb_item_cat` VALUES ('836', '749', '服饰配件', '35');
INSERT INTO `tb_item_cat` VALUES ('837', '836', '太阳镜', '35');
INSERT INTO `tb_item_cat` VALUES ('838', '836', '光学镜架/镜片', '35');
INSERT INTO `tb_item_cat` VALUES ('839', '836', '围巾/手套/帽子套装', '35');
INSERT INTO `tb_item_cat` VALUES ('840', '836', '袖扣', '35');
INSERT INTO `tb_item_cat` VALUES ('841', '836', '棒球帽', '35');
INSERT INTO `tb_item_cat` VALUES ('842', '836', '毛线帽', '35');
INSERT INTO `tb_item_cat` VALUES ('843', '836', '遮阳帽', '35');
INSERT INTO `tb_item_cat` VALUES ('844', '836', '老花镜', '35');
INSERT INTO `tb_item_cat` VALUES ('845', '836', '装饰眼镜', '35');
INSERT INTO `tb_item_cat` VALUES ('846', '836', '防辐射眼镜', '35');
INSERT INTO `tb_item_cat` VALUES ('847', '836', '游泳镜', '35');
INSERT INTO `tb_item_cat` VALUES ('848', '836', '女士丝巾/围巾/披肩', '35');
INSERT INTO `tb_item_cat` VALUES ('849', '836', '男士丝巾/围巾', '35');
INSERT INTO `tb_item_cat` VALUES ('850', '836', '鸭舌帽', '35');
INSERT INTO `tb_item_cat` VALUES ('851', '836', '贝雷帽', '35');
INSERT INTO `tb_item_cat` VALUES ('852', '836', '礼帽', '35');
INSERT INTO `tb_item_cat` VALUES ('853', '836', '真皮手套', '35');
INSERT INTO `tb_item_cat` VALUES ('854', '836', '毛线手套', '35');
INSERT INTO `tb_item_cat` VALUES ('855', '836', '防晒手套', '35');
INSERT INTO `tb_item_cat` VALUES ('856', '836', '男士腰带/礼盒', '35');
INSERT INTO `tb_item_cat` VALUES ('857', '836', '女士腰带/礼盒', '35');
INSERT INTO `tb_item_cat` VALUES ('858', '836', '钥匙扣', '35');
INSERT INTO `tb_item_cat` VALUES ('859', '836', '遮阳伞/雨伞', '35');
INSERT INTO `tb_item_cat` VALUES ('860', '836', '口罩', '35');
INSERT INTO `tb_item_cat` VALUES ('861', '836', '耳罩/耳包', '35');
INSERT INTO `tb_item_cat` VALUES ('862', '836', '假领', '35');
INSERT INTO `tb_item_cat` VALUES ('863', '836', '毛线/布面料', '35');
INSERT INTO `tb_item_cat` VALUES ('864', '836', '领带/领结/领带夹', '35');
INSERT INTO `tb_item_cat` VALUES ('865', '0', '鞋靴', '35');
INSERT INTO `tb_item_cat` VALUES ('866', '865', '流行男鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('867', '866', '商务休闲鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('868', '866', '正装鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('869', '866', '休闲鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('870', '866', '凉鞋/沙滩鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('871', '866', '男靴', '35');
INSERT INTO `tb_item_cat` VALUES ('872', '866', '功能鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('873', '866', '拖鞋/人字拖', '35');
INSERT INTO `tb_item_cat` VALUES ('874', '866', '雨鞋/雨靴', '35');
INSERT INTO `tb_item_cat` VALUES ('875', '866', '传统布鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('876', '866', '鞋配件', '35');
INSERT INTO `tb_item_cat` VALUES ('877', '866', '帆布鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('878', '866', '增高鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('879', '866', '工装鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('880', '866', '定制鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('881', '865', '时尚女鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('882', '881', '高跟鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('883', '881', '单鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('884', '881', '休闲鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('885', '881', '凉鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('886', '881', '女靴', '35');
INSERT INTO `tb_item_cat` VALUES ('887', '881', '雪地靴', '35');
INSERT INTO `tb_item_cat` VALUES ('888', '881', '拖鞋/人字拖', '35');
INSERT INTO `tb_item_cat` VALUES ('889', '881', '踝靴', '35');
INSERT INTO `tb_item_cat` VALUES ('890', '881', '筒靴', '35');
INSERT INTO `tb_item_cat` VALUES ('891', '881', '帆布鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('892', '881', '雨鞋/雨靴', '35');
INSERT INTO `tb_item_cat` VALUES ('893', '881', '妈妈鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('894', '881', '鞋配件', '35');
INSERT INTO `tb_item_cat` VALUES ('895', '881', '特色鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('896', '881', '鱼嘴鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('897', '881', '布鞋/绣花鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('898', '881', '马丁靴', '35');
INSERT INTO `tb_item_cat` VALUES ('899', '881', '坡跟鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('900', '881', '松糕鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('901', '881', '内增高', '35');
INSERT INTO `tb_item_cat` VALUES ('902', '881', '防水台', '35');
INSERT INTO `tb_item_cat` VALUES ('903', '0', '礼品箱包', '35');
INSERT INTO `tb_item_cat` VALUES ('904', '903', '潮流女包', '35');
INSERT INTO `tb_item_cat` VALUES ('905', '904', '钱包', '35');
INSERT INTO `tb_item_cat` VALUES ('906', '904', '手拿包/晚宴包', '35');
INSERT INTO `tb_item_cat` VALUES ('907', '904', '单肩包', '35');
INSERT INTO `tb_item_cat` VALUES ('908', '904', '双肩包', '35');
INSERT INTO `tb_item_cat` VALUES ('909', '904', '手提包', '35');
INSERT INTO `tb_item_cat` VALUES ('910', '904', '斜挎包', '35');
INSERT INTO `tb_item_cat` VALUES ('911', '904', '钥匙包', '35');
INSERT INTO `tb_item_cat` VALUES ('912', '904', '卡包/零钱包', '35');
INSERT INTO `tb_item_cat` VALUES ('913', '903', '精品男包', '35');
INSERT INTO `tb_item_cat` VALUES ('914', '913', '钱包/卡包', '35');
INSERT INTO `tb_item_cat` VALUES ('915', '913', '男士手包', '35');
INSERT INTO `tb_item_cat` VALUES ('916', '913', '商务公文包', '35');
INSERT INTO `tb_item_cat` VALUES ('917', '913', '双肩包', '35');
INSERT INTO `tb_item_cat` VALUES ('918', '913', '单肩/斜挎包', '35');
INSERT INTO `tb_item_cat` VALUES ('919', '913', '钥匙包', '35');
INSERT INTO `tb_item_cat` VALUES ('920', '903', '功能箱包', '35');
INSERT INTO `tb_item_cat` VALUES ('921', '920', '电脑包', '35');
INSERT INTO `tb_item_cat` VALUES ('922', '920', '拉杆箱/拉杆包', '35');
INSERT INTO `tb_item_cat` VALUES ('923', '920', '旅行包', '35');
INSERT INTO `tb_item_cat` VALUES ('924', '920', '旅行配件', '35');
INSERT INTO `tb_item_cat` VALUES ('925', '920', '休闲运动包', '35');
INSERT INTO `tb_item_cat` VALUES ('926', '920', '登山包', '35');
INSERT INTO `tb_item_cat` VALUES ('927', '920', '妈咪包', '35');
INSERT INTO `tb_item_cat` VALUES ('928', '920', '书包', '35');
INSERT INTO `tb_item_cat` VALUES ('929', '920', '相机包', '35');
INSERT INTO `tb_item_cat` VALUES ('930', '920', '腰包/胸包', '35');
INSERT INTO `tb_item_cat` VALUES ('931', '903', '礼品', '35');
INSERT INTO `tb_item_cat` VALUES ('932', '931', '火机烟具', '35');
INSERT INTO `tb_item_cat` VALUES ('933', '931', '礼品文具', '35');
INSERT INTO `tb_item_cat` VALUES ('934', '931', '军刀军具', '35');
INSERT INTO `tb_item_cat` VALUES ('935', '931', '收藏品', '35');
INSERT INTO `tb_item_cat` VALUES ('936', '931', '工艺礼品', '35');
INSERT INTO `tb_item_cat` VALUES ('937', '931', '创意礼品', '35');
INSERT INTO `tb_item_cat` VALUES ('938', '931', '礼盒礼券', '35');
INSERT INTO `tb_item_cat` VALUES ('939', '931', '鲜花绿植', '35');
INSERT INTO `tb_item_cat` VALUES ('940', '931', '婚庆用品', '35');
INSERT INTO `tb_item_cat` VALUES ('941', '931', '京东卡', '35');
INSERT INTO `tb_item_cat` VALUES ('942', '931', '美妆礼品', '35');
INSERT INTO `tb_item_cat` VALUES ('943', '931', '地方礼品', '35');
INSERT INTO `tb_item_cat` VALUES ('944', '931', '古董把玩', '35');
INSERT INTO `tb_item_cat` VALUES ('945', '903', '奢侈品', '35');
INSERT INTO `tb_item_cat` VALUES ('946', '945', '箱包', '35');
INSERT INTO `tb_item_cat` VALUES ('947', '945', '钱包', '35');
INSERT INTO `tb_item_cat` VALUES ('948', '945', '服饰', '35');
INSERT INTO `tb_item_cat` VALUES ('949', '945', '腰带', '35');
INSERT INTO `tb_item_cat` VALUES ('950', '945', '太阳镜/眼镜框', '35');
INSERT INTO `tb_item_cat` VALUES ('951', '945', '配件', '35');
INSERT INTO `tb_item_cat` VALUES ('952', '945', '鞋靴', '35');
INSERT INTO `tb_item_cat` VALUES ('953', '945', '饰品', '35');
INSERT INTO `tb_item_cat` VALUES ('954', '945', '名品腕表', '35');
INSERT INTO `tb_item_cat` VALUES ('955', '945', '高档化妆品', '35');
INSERT INTO `tb_item_cat` VALUES ('956', '903', '婚庆', '35');
INSERT INTO `tb_item_cat` VALUES ('957', '956', '婚嫁首饰', '35');
INSERT INTO `tb_item_cat` VALUES ('958', '956', '婚纱摄影', '35');
INSERT INTO `tb_item_cat` VALUES ('959', '956', '婚纱礼服', '35');
INSERT INTO `tb_item_cat` VALUES ('960', '956', '婚庆服务', '35');
INSERT INTO `tb_item_cat` VALUES ('961', '956', '婚庆礼品/用品', '35');
INSERT INTO `tb_item_cat` VALUES ('962', '956', '婚宴', '35');
INSERT INTO `tb_item_cat` VALUES ('963', '0', '珠宝', '35');
INSERT INTO `tb_item_cat` VALUES ('964', '963', '时尚饰品', '35');
INSERT INTO `tb_item_cat` VALUES ('965', '964', '项链', '35');
INSERT INTO `tb_item_cat` VALUES ('966', '964', '手链/脚链', '35');
INSERT INTO `tb_item_cat` VALUES ('967', '964', '戒指', '35');
INSERT INTO `tb_item_cat` VALUES ('968', '964', '耳饰', '35');
INSERT INTO `tb_item_cat` VALUES ('969', '964', '头饰', '35');
INSERT INTO `tb_item_cat` VALUES ('970', '964', '胸针', '35');
INSERT INTO `tb_item_cat` VALUES ('971', '964', '婚庆饰品', '35');
INSERT INTO `tb_item_cat` VALUES ('972', '964', '饰品配件', '35');
INSERT INTO `tb_item_cat` VALUES ('973', '963', '纯金K金饰品', '35');
INSERT INTO `tb_item_cat` VALUES ('974', '973', '吊坠/项链', '35');
INSERT INTO `tb_item_cat` VALUES ('975', '973', '手镯/手链/脚链', '35');
INSERT INTO `tb_item_cat` VALUES ('976', '973', '戒指', '35');
INSERT INTO `tb_item_cat` VALUES ('977', '973', '耳饰', '35');
INSERT INTO `tb_item_cat` VALUES ('978', '963', '金银投资', '35');
INSERT INTO `tb_item_cat` VALUES ('979', '978', '工艺金', '35');
INSERT INTO `tb_item_cat` VALUES ('980', '978', '工艺银', '35');
INSERT INTO `tb_item_cat` VALUES ('981', '963', '银饰', '35');
INSERT INTO `tb_item_cat` VALUES ('982', '981', '吊坠/项链', '35');
INSERT INTO `tb_item_cat` VALUES ('983', '981', '手镯/手链/脚链', '35');
INSERT INTO `tb_item_cat` VALUES ('984', '981', '戒指/耳饰', '35');
INSERT INTO `tb_item_cat` VALUES ('985', '981', '宝宝银饰', '35');
INSERT INTO `tb_item_cat` VALUES ('986', '981', '千足银手镯', '35');
INSERT INTO `tb_item_cat` VALUES ('987', '963', '钻石', '35');
INSERT INTO `tb_item_cat` VALUES ('988', '987', '裸钻', '35');
INSERT INTO `tb_item_cat` VALUES ('989', '987', '戒指', '35');
INSERT INTO `tb_item_cat` VALUES ('990', '987', '项链/吊坠', '35');
INSERT INTO `tb_item_cat` VALUES ('991', '987', '耳饰', '35');
INSERT INTO `tb_item_cat` VALUES ('992', '987', '手镯/手链', '35');
INSERT INTO `tb_item_cat` VALUES ('993', '963', '翡翠玉石', '35');
INSERT INTO `tb_item_cat` VALUES ('994', '993', '项链/吊坠', '35');
INSERT INTO `tb_item_cat` VALUES ('995', '993', '手镯/手串', '35');
INSERT INTO `tb_item_cat` VALUES ('996', '993', '戒指', '35');
INSERT INTO `tb_item_cat` VALUES ('997', '993', '耳饰', '35');
INSERT INTO `tb_item_cat` VALUES ('998', '993', '挂件/摆件/把件', '35');
INSERT INTO `tb_item_cat` VALUES ('999', '993', '高值收藏', '35');
INSERT INTO `tb_item_cat` VALUES ('1000', '963', '水晶玛瑙', '35');
INSERT INTO `tb_item_cat` VALUES ('1001', '1000', '项链/吊坠', '35');
INSERT INTO `tb_item_cat` VALUES ('1002', '1000', '耳饰', '35');
INSERT INTO `tb_item_cat` VALUES ('1003', '1000', '手镯/手链/脚链', '35');
INSERT INTO `tb_item_cat` VALUES ('1004', '1000', '戒指', '35');
INSERT INTO `tb_item_cat` VALUES ('1005', '1000', '头饰/胸针', '35');
INSERT INTO `tb_item_cat` VALUES ('1006', '1000', '摆件/挂件', '35');
INSERT INTO `tb_item_cat` VALUES ('1007', '963', '彩宝', '35');
INSERT INTO `tb_item_cat` VALUES ('1008', '1007', '项链/吊坠', '35');
INSERT INTO `tb_item_cat` VALUES ('1009', '1007', '耳饰', '35');
INSERT INTO `tb_item_cat` VALUES ('1010', '1007', '手镯/手链', '35');
INSERT INTO `tb_item_cat` VALUES ('1011', '1007', '戒指', '35');
INSERT INTO `tb_item_cat` VALUES ('1012', '963', '铂金', '35');
INSERT INTO `tb_item_cat` VALUES ('1013', '1012', '项链/吊坠', '35');
INSERT INTO `tb_item_cat` VALUES ('1014', '1012', '手镯/手链/脚链', '35');
INSERT INTO `tb_item_cat` VALUES ('1015', '1012', '戒指', '35');
INSERT INTO `tb_item_cat` VALUES ('1016', '1012', '耳饰', '35');
INSERT INTO `tb_item_cat` VALUES ('1017', '963', '天然木饰', '35');
INSERT INTO `tb_item_cat` VALUES ('1018', '1017', '小叶紫檀', '35');
INSERT INTO `tb_item_cat` VALUES ('1019', '1017', '黄花梨', '35');
INSERT INTO `tb_item_cat` VALUES ('1020', '1017', '沉香', '35');
INSERT INTO `tb_item_cat` VALUES ('1021', '1017', '金丝楠', '35');
INSERT INTO `tb_item_cat` VALUES ('1022', '1017', '菩提', '35');
INSERT INTO `tb_item_cat` VALUES ('1023', '1017', '其他', '35');
INSERT INTO `tb_item_cat` VALUES ('1024', '963', '珍珠', '35');
INSERT INTO `tb_item_cat` VALUES ('1025', '1024', '项链', '35');
INSERT INTO `tb_item_cat` VALUES ('1026', '1024', '吊坠', '35');
INSERT INTO `tb_item_cat` VALUES ('1027', '1024', '耳饰', '35');
INSERT INTO `tb_item_cat` VALUES ('1028', '1024', '手链', '35');
INSERT INTO `tb_item_cat` VALUES ('1029', '1024', '戒指', '35');
INSERT INTO `tb_item_cat` VALUES ('1030', '1024', '胸针', '35');
INSERT INTO `tb_item_cat` VALUES ('1031', '0', '运动健康', '35');
INSERT INTO `tb_item_cat` VALUES ('1032', '1031', '运动鞋包', '35');
INSERT INTO `tb_item_cat` VALUES ('1033', '1032', '休闲鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('1034', '1032', '板鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('1035', '1032', '帆布鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('1036', '1032', '专项运动鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('1037', '1032', '跑步鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('1038', '1032', '篮球鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('1039', '1032', '足球鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('1040', '1032', '训练鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('1041', '1032', '乒羽网鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('1042', '1032', '拖鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('1043', '1032', '运动包', '35');
INSERT INTO `tb_item_cat` VALUES ('1044', '1031', '运动服饰', '35');
INSERT INTO `tb_item_cat` VALUES ('1045', '1044', '运动配饰', '35');
INSERT INTO `tb_item_cat` VALUES ('1046', '1044', '羽绒服', '35');
INSERT INTO `tb_item_cat` VALUES ('1047', '1044', '毛衫/线衫', '35');
INSERT INTO `tb_item_cat` VALUES ('1048', '1044', '乒羽网服', '35');
INSERT INTO `tb_item_cat` VALUES ('1049', '1044', '训练服', '35');
INSERT INTO `tb_item_cat` VALUES ('1050', '1044', '运动背心', '35');
INSERT INTO `tb_item_cat` VALUES ('1051', '1044', '卫衣/套头衫', '35');
INSERT INTO `tb_item_cat` VALUES ('1052', '1044', '夹克/风衣', '35');
INSERT INTO `tb_item_cat` VALUES ('1053', '1044', 'T恤', '35');
INSERT INTO `tb_item_cat` VALUES ('1054', '1044', '棉服', '35');
INSERT INTO `tb_item_cat` VALUES ('1055', '1044', '运动裤', '35');
INSERT INTO `tb_item_cat` VALUES ('1056', '1044', '套装', '35');
INSERT INTO `tb_item_cat` VALUES ('1057', '1031', '骑行运动', '35');
INSERT INTO `tb_item_cat` VALUES ('1058', '1057', '折叠车', '35');
INSERT INTO `tb_item_cat` VALUES ('1059', '1057', '山地车/公路车', '35');
INSERT INTO `tb_item_cat` VALUES ('1060', '1057', '电动车', '35');
INSERT INTO `tb_item_cat` VALUES ('1061', '1057', '其他整车', '35');
INSERT INTO `tb_item_cat` VALUES ('1062', '1057', '骑行服', '35');
INSERT INTO `tb_item_cat` VALUES ('1063', '1057', '骑行装备', '35');
INSERT INTO `tb_item_cat` VALUES ('1064', '1031', '垂钓用品', '35');
INSERT INTO `tb_item_cat` VALUES ('1065', '1064', '鱼竿鱼线', '35');
INSERT INTO `tb_item_cat` VALUES ('1066', '1064', '浮漂鱼饵', '35');
INSERT INTO `tb_item_cat` VALUES ('1067', '1064', '钓鱼桌椅', '35');
INSERT INTO `tb_item_cat` VALUES ('1068', '1064', '钓鱼配件', '35');
INSERT INTO `tb_item_cat` VALUES ('1069', '1064', '钓箱鱼包', '35');
INSERT INTO `tb_item_cat` VALUES ('1070', '1064', '其它', '35');
INSERT INTO `tb_item_cat` VALUES ('1071', '1031', '游泳用品', '35');
INSERT INTO `tb_item_cat` VALUES ('1072', '1071', '泳镜', '35');
INSERT INTO `tb_item_cat` VALUES ('1073', '1071', '泳帽', '35');
INSERT INTO `tb_item_cat` VALUES ('1074', '1071', '游泳包防水包', '35');
INSERT INTO `tb_item_cat` VALUES ('1075', '1071', '女士泳衣', '35');
INSERT INTO `tb_item_cat` VALUES ('1076', '1071', '男士泳衣', '35');
INSERT INTO `tb_item_cat` VALUES ('1077', '1071', '比基尼', '35');
INSERT INTO `tb_item_cat` VALUES ('1078', '1071', '其它', '35');
INSERT INTO `tb_item_cat` VALUES ('1079', '1031', '户外鞋服', '35');
INSERT INTO `tb_item_cat` VALUES ('1080', '1079', '冲锋衣裤', '35');
INSERT INTO `tb_item_cat` VALUES ('1081', '1079', '速干衣裤', '35');
INSERT INTO `tb_item_cat` VALUES ('1082', '1079', '滑雪服', '35');
INSERT INTO `tb_item_cat` VALUES ('1083', '1079', '羽绒服/棉服', '35');
INSERT INTO `tb_item_cat` VALUES ('1084', '1079', '休闲衣裤', '35');
INSERT INTO `tb_item_cat` VALUES ('1085', '1079', '抓绒衣裤', '35');
INSERT INTO `tb_item_cat` VALUES ('1086', '1079', '软壳衣裤', '35');
INSERT INTO `tb_item_cat` VALUES ('1087', '1079', 'T恤', '35');
INSERT INTO `tb_item_cat` VALUES ('1088', '1079', '户外风衣', '35');
INSERT INTO `tb_item_cat` VALUES ('1089', '1079', '功能内衣', '35');
INSERT INTO `tb_item_cat` VALUES ('1090', '1079', '军迷服饰', '35');
INSERT INTO `tb_item_cat` VALUES ('1091', '1079', '登山鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('1092', '1079', '雪地靴', '35');
INSERT INTO `tb_item_cat` VALUES ('1093', '1079', '徒步鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('1094', '1079', '越野跑鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('1095', '1079', '休闲鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('1096', '1079', '工装鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('1097', '1079', '溯溪鞋', '35');
INSERT INTO `tb_item_cat` VALUES ('1098', '1079', '沙滩/凉拖', '35');
INSERT INTO `tb_item_cat` VALUES ('1099', '1079', '户外袜', '35');
INSERT INTO `tb_item_cat` VALUES ('1100', '1031', '户外装备', '35');
INSERT INTO `tb_item_cat` VALUES ('1101', '1100', '帐篷/垫子', '35');
INSERT INTO `tb_item_cat` VALUES ('1102', '1100', '睡袋/吊床', '35');
INSERT INTO `tb_item_cat` VALUES ('1103', '1100', '登山攀岩', '35');
INSERT INTO `tb_item_cat` VALUES ('1104', '1100', '背包', '35');
INSERT INTO `tb_item_cat` VALUES ('1105', '1100', '户外配饰', '35');
INSERT INTO `tb_item_cat` VALUES ('1106', '1100', '户外照明', '35');
INSERT INTO `tb_item_cat` VALUES ('1107', '1100', '户外仪表', '35');
INSERT INTO `tb_item_cat` VALUES ('1108', '1100', '户外工具', '35');
INSERT INTO `tb_item_cat` VALUES ('1109', '1100', '望远镜', '35');
INSERT INTO `tb_item_cat` VALUES ('1110', '1100', '旅游用品', '35');
INSERT INTO `tb_item_cat` VALUES ('1111', '1100', '便携桌椅床', '35');
INSERT INTO `tb_item_cat` VALUES ('1112', '1100', '野餐烧烤', '35');
INSERT INTO `tb_item_cat` VALUES ('1113', '1100', '军迷用品', '35');
INSERT INTO `tb_item_cat` VALUES ('1114', '1100', '救援装备', '35');
INSERT INTO `tb_item_cat` VALUES ('1115', '1100', '滑雪装备', '35');
INSERT INTO `tb_item_cat` VALUES ('1116', '1100', '极限户外', '35');
INSERT INTO `tb_item_cat` VALUES ('1117', '1100', '冲浪潜水', '35');
INSERT INTO `tb_item_cat` VALUES ('1118', '1031', '健身训练', '35');
INSERT INTO `tb_item_cat` VALUES ('1119', '1118', '综合训练器', '35');
INSERT INTO `tb_item_cat` VALUES ('1120', '1118', '其他大型器械', '35');
INSERT INTO `tb_item_cat` VALUES ('1121', '1118', '哑铃', '35');
INSERT INTO `tb_item_cat` VALUES ('1122', '1118', '仰卧板/收腹机', '35');
INSERT INTO `tb_item_cat` VALUES ('1123', '1118', '其他中小型器材', '35');
INSERT INTO `tb_item_cat` VALUES ('1124', '1118', '瑜伽舞蹈', '35');
INSERT INTO `tb_item_cat` VALUES ('1125', '1118', '武术搏击', '35');
INSERT INTO `tb_item_cat` VALUES ('1126', '1118', '健身车/动感单车', '35');
INSERT INTO `tb_item_cat` VALUES ('1127', '1118', '跑步机', '35');
INSERT INTO `tb_item_cat` VALUES ('1128', '1118', '运动护具', '35');
INSERT INTO `tb_item_cat` VALUES ('1129', '1031', '纤体瑜伽', '35');
INSERT INTO `tb_item_cat` VALUES ('1130', '1129', '瑜伽垫', '35');
INSERT INTO `tb_item_cat` VALUES ('1131', '1129', '瑜伽服', '35');
INSERT INTO `tb_item_cat` VALUES ('1132', '1129', '瑜伽配件', '35');
INSERT INTO `tb_item_cat` VALUES ('1133', '1129', '瑜伽套装', '35');
INSERT INTO `tb_item_cat` VALUES ('1134', '1129', '舞蹈鞋服', '35');
INSERT INTO `tb_item_cat` VALUES ('1135', '1031', '体育用品', '35');
INSERT INTO `tb_item_cat` VALUES ('1136', '1135', '羽毛球', '35');
INSERT INTO `tb_item_cat` VALUES ('1137', '1135', '乒乓球', '35');
INSERT INTO `tb_item_cat` VALUES ('1138', '1135', '篮球', '35');
INSERT INTO `tb_item_cat` VALUES ('1139', '1135', '足球', '35');
INSERT INTO `tb_item_cat` VALUES ('1140', '1135', '网球', '35');
INSERT INTO `tb_item_cat` VALUES ('1141', '1135', '排球', '35');
INSERT INTO `tb_item_cat` VALUES ('1142', '1135', '高尔夫', '35');
INSERT INTO `tb_item_cat` VALUES ('1143', '1135', '台球', '35');
INSERT INTO `tb_item_cat` VALUES ('1144', '1135', '棋牌麻将', '35');
INSERT INTO `tb_item_cat` VALUES ('1145', '1135', '轮滑滑板', '35');
INSERT INTO `tb_item_cat` VALUES ('1146', '1135', '其他', '35');
INSERT INTO `tb_item_cat` VALUES ('1147', '0', '彩票、旅行、充值、票务', '35');
INSERT INTO `tb_item_cat` VALUES ('1148', '1147', '彩票', '35');
INSERT INTO `tb_item_cat` VALUES ('1149', '1148', '双色球', '35');
INSERT INTO `tb_item_cat` VALUES ('1150', '1148', '大乐透', '35');
INSERT INTO `tb_item_cat` VALUES ('1151', '1148', '福彩3D', '35');
INSERT INTO `tb_item_cat` VALUES ('1152', '1148', '排列三', '35');
INSERT INTO `tb_item_cat` VALUES ('1153', '1148', '排列五', '35');
INSERT INTO `tb_item_cat` VALUES ('1154', '1148', '七星彩', '35');
INSERT INTO `tb_item_cat` VALUES ('1155', '1148', '七乐彩', '35');
INSERT INTO `tb_item_cat` VALUES ('1156', '1148', '竞彩足球', '35');
INSERT INTO `tb_item_cat` VALUES ('1157', '1148', '竞彩篮球', '35');
INSERT INTO `tb_item_cat` VALUES ('1158', '1148', '新时时彩', '35');
INSERT INTO `tb_item_cat` VALUES ('1159', '1147', '机票', '35');
INSERT INTO `tb_item_cat` VALUES ('1160', '1159', '国内机票', '35');
INSERT INTO `tb_item_cat` VALUES ('1161', '1147', '酒店', '35');
INSERT INTO `tb_item_cat` VALUES ('1162', '1161', '国内酒店', '35');
INSERT INTO `tb_item_cat` VALUES ('1163', '1161', '酒店团购', '35');
INSERT INTO `tb_item_cat` VALUES ('1164', '1147', '旅行', '35');
INSERT INTO `tb_item_cat` VALUES ('1165', '1164', '度假', '35');
INSERT INTO `tb_item_cat` VALUES ('1166', '1164', '景点', '35');
INSERT INTO `tb_item_cat` VALUES ('1167', '1164', '租车', '35');
INSERT INTO `tb_item_cat` VALUES ('1168', '1164', '火车票', '35');
INSERT INTO `tb_item_cat` VALUES ('1169', '1164', '旅游团购', '35');
INSERT INTO `tb_item_cat` VALUES ('1170', '1147', '充值', '35');
INSERT INTO `tb_item_cat` VALUES ('1171', '1170', '手机充值', '35');
INSERT INTO `tb_item_cat` VALUES ('1172', '1147', '游戏', '35');
INSERT INTO `tb_item_cat` VALUES ('1173', '1172', '游戏点卡', '35');
INSERT INTO `tb_item_cat` VALUES ('1174', '1172', 'QQ充值', '35');
INSERT INTO `tb_item_cat` VALUES ('1175', '1147', '票务', '35');
INSERT INTO `tb_item_cat` VALUES ('1176', '1175', '电影票', '35');
INSERT INTO `tb_item_cat` VALUES ('1177', '1175', '演唱会', '35');
INSERT INTO `tb_item_cat` VALUES ('1178', '1175', '话剧歌剧', '35');
INSERT INTO `tb_item_cat` VALUES ('1179', '1175', '音乐会', '35');
INSERT INTO `tb_item_cat` VALUES ('1180', '1175', '体育赛事', '35');
INSERT INTO `tb_item_cat` VALUES ('1181', '1175', '舞蹈芭蕾', '35');
INSERT INTO `tb_item_cat` VALUES ('1182', '1175', '戏曲综艺', '35');
INSERT INTO `tb_item_cat` VALUES ('1186', '0', '小白大数据', '35');
INSERT INTO `tb_item_cat` VALUES ('1187', '1186', '大数据学科', '35');
INSERT INTO `tb_item_cat` VALUES ('1188', '1187', 'hadoop', '35');
INSERT INTO `tb_item_cat` VALUES ('1189', '1187', 'storm', '35');
INSERT INTO `tb_item_cat` VALUES ('1190', '1187', 'kafka', '35');
INSERT INTO `tb_item_cat` VALUES ('1191', '18', '分类测试_毛祥溢', '35');
INSERT INTO `tb_item_cat` VALUES ('1192', '74', '小家电', '35');
INSERT INTO `tb_item_cat` VALUES ('1193', '11', '英文小说', '35');
INSERT INTO `tb_item_cat` VALUES ('1194', '718', '火锅涮锅', '35');
INSERT INTO `tb_item_cat` VALUES ('1195', '1192', '手电筒', '35');
INSERT INTO `tb_item_cat` VALUES ('1196', '1192', '照妖镜', '35');
INSERT INTO `tb_item_cat` VALUES ('1197', '274', 'AA', '35');
INSERT INTO `tb_item_cat` VALUES ('1198', '987', '蓝宝石', '35');
INSERT INTO `tb_item_cat` VALUES ('1199', '2', '电子小说', '35');
INSERT INTO `tb_item_cat` VALUES ('1200', '162', '上网本', '35');
INSERT INTO `tb_item_cat` VALUES ('1201', '341', '婴儿礼服', '35');
INSERT INTO `tb_item_cat` VALUES ('1202', '2', '电子漫画书', '35');
INSERT INTO `tb_item_cat` VALUES ('1203', '186', '不移动软盘', '35');
INSERT INTO `tb_item_cat` VALUES ('1204', '562', '购机送流量', '35');

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `order_id` bigint(20) NOT NULL COMMENT '订单id',
  `payment` decimal(20,2) DEFAULT NULL COMMENT '实付金额。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `payment_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '支付类型，1、在线支付，2、货到付款',
  `post_fee` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '邮费。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '状态：1、未付款，2、已付款，3、未发货，4、已发货，5、交易成功，6、交易关闭,7、待评价',
  `create_time` datetime DEFAULT NULL COMMENT '订单创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '订单更新时间',
  `payment_time` datetime DEFAULT NULL COMMENT '付款时间',
  `consign_time` datetime DEFAULT NULL COMMENT '发货时间',
  `end_time` datetime DEFAULT NULL COMMENT '交易完成时间',
  `close_time` datetime DEFAULT NULL COMMENT '交易关闭时间',
  `shipping_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '物流名称',
  `shipping_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '物流单号',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用户id',
  `buyer_message` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '买家留言',
  `buyer_nick` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '买家昵称',
  `buyer_rate` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '买家是否已经评价',
  `receiver_area_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '收货人地区名称(省，市，县)街道',
  `receiver_mobile` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '收货人手机',
  `receiver_zip_code` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '收货人邮编',
  `receiver` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '收货人',
  `expire` datetime DEFAULT NULL COMMENT '过期时间，定期清理',
  `invoice_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '发票类型(普通发票，电子发票，增值税发票)',
  `source_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '订单来源：1:app端，2：pc端，3：M端，4：微信端，5：手机qq端',
  `seller_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`order_id`),
  KEY `create_time` (`create_time`),
  KEY `buyer_nick` (`buyer_nick`),
  KEY `status` (`status`),
  KEY `payment_type` (`payment_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('1148532286879174656', '6666.00', '1', null, '2', '2019-07-09 10:00:11', '2019-07-09 10:00:11', null, null, null, null, null, null, 'gaowei', null, null, null, '上海*****科技有限公司', '13900112222', null, 'gaowei', null, null, null, 'gaowei');
INSERT INTO `tb_order` VALUES ('1148532287063724032', '3099.00', '1', null, '2', '2019-07-09 10:00:11', '2019-07-09 10:00:11', null, null, null, null, null, null, 'gaowei', null, null, null, '上海*****科技有限公司', '13900112222', null, 'gaowei', null, null, null, null);
INSERT INTO `tb_order` VALUES ('1168453780069421056', '7996.00', '1', null, '1', '2019-09-02 09:21:05', '2019-09-02 09:21:05', null, null, null, null, null, null, 'gaowei', null, null, null, '上海*****科技有限公司', '13900112222', null, 'gaowei', null, null, null, 'fmjava');
INSERT INTO `tb_order` VALUES ('1168453780325273600', '4198.00', '1', null, '1', '2019-09-02 09:21:05', '2019-09-02 09:21:05', null, null, null, null, null, null, 'gaowei', null, null, null, '上海*****科技有限公司', '13900112222', null, 'gaowei', null, null, null, 'myxq');
INSERT INTO `tb_order` VALUES ('1168454460721074176', '1999.00', '1', null, '1', '2019-09-02 09:23:47', '2019-09-02 09:23:47', null, null, null, null, null, null, 'gaowei', null, null, null, '上海*****科技有限公司', '13900112222', null, 'gaowei', null, null, null, 'fmjava');
INSERT INTO `tb_order` VALUES ('1168456212933513216', '1999.00', '1', null, '1', '2019-09-02 09:30:45', '2019-09-02 09:30:45', null, null, null, null, null, null, 'gaowei', null, null, null, '上海*****科技有限公司', '13900112222', null, 'gaowei', null, null, null, 'fmjava');
INSERT INTO `tb_order` VALUES ('1168456481096339456', '2398.00', '1', null, '1', '2019-09-02 09:31:49', '2019-09-02 09:31:49', null, null, null, null, null, null, 'gaowei', null, null, null, '上海*****科技有限公司', '13900112222', null, 'gaowei', null, null, null, 'myxq');
INSERT INTO `tb_order` VALUES ('1168457067350986752', '2099.00', '1', null, '1', '2019-09-02 09:34:08', '2019-09-02 09:34:08', null, null, null, null, null, null, 'gaowei', null, null, null, '上海*****科技有限公司', '13900112222', null, 'gaowei', null, null, null, 'myxq');
INSERT INTO `tb_order` VALUES ('1168457124871671808', '1999.00', '1', null, '1', '2019-09-02 09:34:22', '2019-09-02 09:34:22', null, null, null, null, null, null, 'gaowei', null, null, null, '上海*****科技有限公司', '13900112222', null, 'gaowei', null, null, null, 'fmjava');
INSERT INTO `tb_order` VALUES ('1168465887393484800', '3998.00', '1', null, '2', '2019-09-02 10:09:11', '2019-09-02 10:09:11', null, null, null, null, null, null, 'gaowei', null, null, null, '上海*****科技有限公司', '13900112222', null, 'gaowei', null, null, null, 'fmjava');
INSERT INTO `tb_order` VALUES ('1168466581869563904', '1999.00', '1', null, '1', '2019-09-02 10:11:57', '2019-09-02 10:11:57', null, null, null, null, null, null, 'gaowei', null, null, null, '上海*****科技有限公司', '13900112222', null, 'gaowei', null, null, null, 'fmjava');
INSERT INTO `tb_order` VALUES ('1168470127490895872', '1999.00', '1', null, '1', '2019-09-02 10:26:02', '2019-09-02 10:26:02', null, null, null, null, null, null, 'gaowei', null, null, null, '上海*****科技有限公司', '13900112222', null, 'gaowei', null, null, null, 'fmjava');
INSERT INTO `tb_order` VALUES ('1168471321059790848', '1999.00', '1', null, '1', '2019-09-02 10:30:47', '2019-09-02 10:30:47', null, null, null, null, null, null, 'gaowei', null, null, null, '上海*****科技有限公司', '13900112222', null, 'gaowei', null, null, null, 'fmjava');
INSERT INTO `tb_order` VALUES ('1168471321093345280', '2099.00', '1', null, '1', '2019-09-02 10:30:47', '2019-09-02 10:30:47', null, null, null, null, null, null, 'gaowei', null, null, null, '上海*****科技有限公司', '13900112222', null, 'gaowei', null, null, null, 'myxq');
INSERT INTO `tb_order` VALUES ('1168490856378798080', '2099.00', '1', null, '2', '2019-09-02 11:48:24', '2019-09-02 11:48:24', null, null, null, null, null, null, 'gaowei', null, null, null, '上海*****科技有限公司', '13900112222', null, 'gaowei', null, null, null, 'myxq');
INSERT INTO `tb_order` VALUES ('1168490856525598720', '3998.00', '1', null, '2', '2019-09-02 11:48:24', '2019-09-02 11:48:24', null, null, null, null, null, null, 'gaowei', null, null, null, '上海*****科技有限公司', '13900112222', null, 'gaowei', null, null, null, 'fmjava');
INSERT INTO `tb_order` VALUES ('1168506543109312512', '1999.00', '1', null, '2', '2019-09-02 12:50:44', '2019-09-02 12:50:44', null, null, null, null, null, null, 'gaowei', null, null, null, '南京大学', '13700221122', null, 'myxq', null, null, null, 'fmjava');
INSERT INTO `tb_order` VALUES ('1168506543159644160', '4198.00', '1', null, '2', '2019-09-02 12:50:44', '2019-09-02 12:50:44', null, null, null, null, null, null, 'gaowei', null, null, null, '南京大学', '13700221122', null, 'myxq', null, null, null, 'myxq');
INSERT INTO `tb_order` VALUES ('1168515554638565376', '1999.00', '1', null, '2', '2019-09-02 13:26:33', '2019-09-02 13:26:33', null, null, null, null, null, null, 'gaowei', null, null, null, '南京大学', '13700221122', null, 'myxq', null, null, null, 'fmjava');

-- ----------------------------
-- Table structure for tb_order_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_item`;
CREATE TABLE `tb_order_item` (
  `id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL COMMENT '商品id',
  `goods_id` bigint(20) DEFAULT NULL COMMENT 'SPU_ID',
  `order_id` bigint(20) NOT NULL COMMENT '订单id',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品标题',
  `price` decimal(20,2) DEFAULT NULL COMMENT '商品单价',
  `num` int(10) DEFAULT NULL COMMENT '商品购买数量',
  `total_fee` decimal(20,2) DEFAULT NULL COMMENT '商品总金额',
  `pic_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品图片地址',
  `seller_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tb_order_item
-- ----------------------------
INSERT INTO `tb_order_item` VALUES ('1148532286879174657', '1369314', '149187842867970', '1148532286879174656', 'aaaaa 移动4G 16G', '2222.00', '3', '6666.00', 'http://192.168.1.88/group1/M00/00/00/wKgBWF0Wx-uAEqVqAAHrkVWylhM078.jpg', 'gaowei');
INSERT INTO `tb_order_item` VALUES ('1148532287063724033', '1369345', '149187842867971', '1148532287063724032', '小米 Redmi K20Pro 秘境黑 优惠套餐2 8G+128G', '3099.00', '1', '3099.00', 'http://192.168.1.88/group1/M00/00/00/wKgBWF0kWPeAW7l_AAGdIQNNPvg647.jpg', null);
INSERT INTO `tb_order_item` VALUES ('1168453780069421057', '1369386', '149187842867982', '1168453780069421056', 'new商品名称1234555 秘境黑 6G+64G', '1999.00', '4', '7996.00', 'http://img13.360buyimg.com/n1/s450x450_jfs/t1/19883/39/13305/185344/5c9eca88Ee1bfa73d/23314446540561dd.jpg', 'fmjava');
INSERT INTO `tb_order_item` VALUES ('1168453780325273601', '1369374', '149187842867983', '1168453780325273600', '荣耀V20 游戏手机 麒麟980芯片 魅眼全视屏 4800万深感相机 6GB+128GB 幻影蓝 移动联通电信4G全面屏手机', '2099.00', '2', '4198.00', 'http://img13.360buyimg.com/n1/s450x450_jfs/t1/16446/33/13283/339849/5c9eca5bE06fce1b2/500f99a976998161.jpg', 'myxq');
INSERT INTO `tb_order_item` VALUES ('1168454571874324480', '1369386', '149187842867982', '1168454460721074176', 'new商品名称1234555 秘境黑 6G+64G', '1999.00', '1', '1999.00', 'http://img13.360buyimg.com/n1/s450x450_jfs/t1/19883/39/13305/185344/5c9eca88Ee1bfa73d/23314446540561dd.jpg', 'fmjava');
INSERT INTO `tb_order_item` VALUES ('1168456420337651712', '1369386', '149187842867982', '1168456212933513216', 'new商品名称1234555 秘境黑 6G+64G', '1999.00', '1', '1999.00', 'http://img13.360buyimg.com/n1/s450x450_jfs/t1/19883/39/13305/185344/5c9eca88Ee1bfa73d/23314446540561dd.jpg', 'fmjava');
INSERT INTO `tb_order_item` VALUES ('1168456608464769024', '1369375', '149187842867983', '1168456481096339456', '荣耀10青春版 幻彩渐变 2400万AI自拍 全网通版6GB+64GB 渐变红 移动联通电信4G全面屏手机 双卡双待', '1199.00', '2', '2398.00', 'http://img12.360buyimg.com/n1/s450x450_jfs/t1/24961/31/15129/171030/5caee71eE1de3edd7/2e5e07e00b0e3b75.jpg', 'myxq');
INSERT INTO `tb_order_item` VALUES ('1168457067350986753', '1369374', '149187842867983', '1168457067350986752', '荣耀V20 游戏手机 麒麟980芯片 魅眼全视屏 4800万深感相机 6GB+128GB 幻影蓝 移动联通电信4G全面屏手机', '2099.00', '1', '2099.00', 'http://img13.360buyimg.com/n1/s450x450_jfs/t1/16446/33/13283/339849/5c9eca5bE06fce1b2/500f99a976998161.jpg', 'myxq');
INSERT INTO `tb_order_item` VALUES ('1168457124871671809', '1369386', '149187842867982', '1168457124871671808', 'new商品名称1234555 秘境黑 6G+64G', '1999.00', '1', '1999.00', 'http://img13.360buyimg.com/n1/s450x450_jfs/t1/19883/39/13305/185344/5c9eca88Ee1bfa73d/23314446540561dd.jpg', 'fmjava');
INSERT INTO `tb_order_item` VALUES ('1168465887393484801', '1369386', '149187842867982', '1168465887393484800', 'new商品名称1234555 秘境黑 6G+64G', '1999.00', '2', '3998.00', 'http://img13.360buyimg.com/n1/s450x450_jfs/t1/19883/39/13305/185344/5c9eca88Ee1bfa73d/23314446540561dd.jpg', 'fmjava');
INSERT INTO `tb_order_item` VALUES ('1168466581869563905', '1369386', '149187842867982', '1168466581869563904', 'new商品名称1234555 秘境黑 6G+64G', '1999.00', '1', '1999.00', 'http://img13.360buyimg.com/n1/s450x450_jfs/t1/19883/39/13305/185344/5c9eca88Ee1bfa73d/23314446540561dd.jpg', 'fmjava');
INSERT INTO `tb_order_item` VALUES ('1168470127490895873', '1369386', '149187842867982', '1168470127490895872', 'new商品名称1234555 秘境黑 6G+64G', '1999.00', '1', '1999.00', 'http://img13.360buyimg.com/n1/s450x450_jfs/t1/19883/39/13305/185344/5c9eca88Ee1bfa73d/23314446540561dd.jpg', 'fmjava');
INSERT INTO `tb_order_item` VALUES ('1168471321059790849', '1369386', '149187842867982', '1168471321059790848', 'new商品名称1234555 秘境黑 6G+64G', '1999.00', '1', '1999.00', 'http://img13.360buyimg.com/n1/s450x450_jfs/t1/19883/39/13305/185344/5c9eca88Ee1bfa73d/23314446540561dd.jpg', 'fmjava');
INSERT INTO `tb_order_item` VALUES ('1168471321093345281', '1369374', '149187842867983', '1168471321093345280', '荣耀V20 游戏手机 麒麟980芯片 魅眼全视屏 4800万深感相机 6GB+128GB 幻影蓝 移动联通电信4G全面屏手机', '2099.00', '1', '2099.00', 'http://img13.360buyimg.com/n1/s450x450_jfs/t1/16446/33/13283/339849/5c9eca5bE06fce1b2/500f99a976998161.jpg', 'myxq');
INSERT INTO `tb_order_item` VALUES ('1168490856378798081', '1369374', '149187842867983', '1168490856378798080', '荣耀V20 游戏手机 麒麟980芯片 魅眼全视屏 4800万深感相机 6GB+128GB 幻影蓝 移动联通电信4G全面屏手机', '2099.00', '1', '2099.00', 'http://img13.360buyimg.com/n1/s450x450_jfs/t1/16446/33/13283/339849/5c9eca5bE06fce1b2/500f99a976998161.jpg', 'myxq');
INSERT INTO `tb_order_item` VALUES ('1168490856525598721', '1369386', '149187842867982', '1168490856525598720', 'new商品名称1234555 秘境黑 6G+64G', '1999.00', '2', '3998.00', 'http://img13.360buyimg.com/n1/s450x450_jfs/t1/19883/39/13305/185344/5c9eca88Ee1bfa73d/23314446540561dd.jpg', 'fmjava');
INSERT INTO `tb_order_item` VALUES ('1168506543109312513', '1369386', '149187842867982', '1168506543109312512', 'new商品名称1234555 秘境黑 6G+64G', '1999.00', '1', '1999.00', 'http://img13.360buyimg.com/n1/s450x450_jfs/t1/19883/39/13305/185344/5c9eca88Ee1bfa73d/23314446540561dd.jpg', 'fmjava');
INSERT INTO `tb_order_item` VALUES ('1168506543159644161', '1369374', '149187842867983', '1168506543159644160', '荣耀V20 游戏手机 麒麟980芯片 魅眼全视屏 4800万深感相机 6GB+128GB 幻影蓝 移动联通电信4G全面屏手机', '2099.00', '2', '4198.00', 'http://img13.360buyimg.com/n1/s450x450_jfs/t1/16446/33/13283/339849/5c9eca5bE06fce1b2/500f99a976998161.jpg', 'myxq');
INSERT INTO `tb_order_item` VALUES ('1168515554642759680', '1369386', '149187842867982', '1168515554638565376', 'new商品名称1234555 秘境黑 6G+64G', '1999.00', '1', '1999.00', 'http://img13.360buyimg.com/n1/s450x450_jfs/t1/19883/39/13305/185344/5c9eca88Ee1bfa73d/23314446540561dd.jpg', 'fmjava');

-- ----------------------------
-- Table structure for tb_pay_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_pay_log`;
CREATE TABLE `tb_pay_log` (
  `out_trade_no` varchar(30) NOT NULL COMMENT '支付订单号',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `pay_time` datetime DEFAULT NULL COMMENT '支付完成时间',
  `total_fee` bigint(20) DEFAULT NULL COMMENT '支付金额（分）',
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `transaction_id` varchar(30) DEFAULT NULL COMMENT '交易号码',
  `trade_state` varchar(1) DEFAULT NULL COMMENT '交易状态',
  `order_list` varchar(200) DEFAULT NULL COMMENT '订单编号列表',
  `pay_type` varchar(1) DEFAULT NULL COMMENT '支付类型',
  PRIMARY KEY (`out_trade_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_pay_log
-- ----------------------------
INSERT INTO `tb_pay_log` VALUES ('1148034234686902272', '2019-07-08 01:01:06', '2019-07-08 02:53:26', '222200', 'gaowei', null, '1', '1148034234649153536', '1');
INSERT INTO `tb_pay_log` VALUES ('1148063121550610432', '2019-07-08 02:55:53', '2019-07-08 02:53:26', '222200', 'gaowei', null, '0', '1148063121437364224', '1');
INSERT INTO `tb_pay_log` VALUES ('1148532287105667072', '2019-07-09 10:00:11', '2019-07-09 10:00:29', '976500', 'gaowei', null, '1', '1148532286879174656,1148532287063724032', '1');
INSERT INTO `tb_pay_log` VALUES ('1168453780354633728', '2019-09-02 09:21:05', null, '1219400', 'gaowei', null, '0', '1168453780069421056,1168453780325273600', '1');
INSERT INTO `tb_pay_log` VALUES ('1168454833422733312', '2019-09-02 09:25:47', null, '199900', 'gaowei', null, '0', '1168454460721074176', '1');
INSERT INTO `tb_pay_log` VALUES ('1168456625955016704', '2019-09-02 09:32:23', null, '439700', 'gaowei', null, '0', '1168456212933513216,1168456481096339456', '1');
INSERT INTO `tb_pay_log` VALUES ('1168456660360892416', '2019-09-02 09:32:31', null, '0', 'gaowei', null, '0', '', '1');
INSERT INTO `tb_pay_log` VALUES ('1168456795216154624', '2019-09-02 09:33:04', null, '0', 'gaowei', null, '0', '', '1');
INSERT INTO `tb_pay_log` VALUES ('1168457170765746176', '2019-09-02 09:34:33', null, '409800', 'gaowei', null, '0', '1168457067350986752,1168457124871671808', '1');
INSERT INTO `tb_pay_log` VALUES ('1168458594627096576', '2019-09-02 09:40:13', null, '0', 'gaowei', null, '0', '', '1');
INSERT INTO `tb_pay_log` VALUES ('1168459564157243392', '2019-09-02 09:44:04', null, '0', 'gaowei', null, '0', '', '1');
INSERT INTO `tb_pay_log` VALUES ('1168465900483907584', '2019-09-02 10:09:14', '2019-09-02 10:09:39', '399800', 'gaowei', null, '1', '1168465887393484800', '1');
INSERT INTO `tb_pay_log` VALUES ('1168466581903118336', '2019-09-02 10:11:57', null, '199900', 'gaowei', null, '0', '1168466581869563904', '1');
INSERT INTO `tb_pay_log` VALUES ('1168470127537033216', '2019-09-02 10:26:02', null, '199900', 'gaowei', null, '0', '1168470127490895872', '1');
INSERT INTO `tb_pay_log` VALUES ('1168471321185619968', '2019-09-02 10:30:47', null, '409800', 'gaowei', null, '0', '1168471321059790848,1168471321093345280', '1');
INSERT INTO `tb_pay_log` VALUES ('1168490856559153152', '2019-09-02 11:48:24', '2019-09-02 11:48:41', '609700', 'gaowei', null, '1', '1168490856378798080,1168490856525598720', '1');
INSERT INTO `tb_pay_log` VALUES ('1168506543193198592', '2019-09-02 12:50:44', '2019-09-02 13:25:54', '619700', 'gaowei', null, '1', '1168506543109312512,1168506543159644160', '1');
INSERT INTO `tb_pay_log` VALUES ('1168515554693091328', '2019-09-02 13:26:33', '2019-09-02 13:26:43', '199900', 'gaowei', null, '1', '1168515554638565376', '1');

-- ----------------------------
-- Table structure for tb_seller
-- ----------------------------
DROP TABLE IF EXISTS `tb_seller`;
CREATE TABLE `tb_seller` (
  `seller_id` varchar(100) NOT NULL COMMENT '用户ID',
  `name` varchar(80) DEFAULT NULL COMMENT '公司名',
  `nick_name` varchar(50) DEFAULT NULL COMMENT '店铺名称',
  `password` varchar(60) DEFAULT NULL COMMENT '密码',
  `email` varchar(40) DEFAULT NULL COMMENT 'EMAIL',
  `mobile` varchar(11) DEFAULT NULL COMMENT '公司手机',
  `telephone` varchar(50) DEFAULT NULL COMMENT '公司电话',
  `status` varchar(1) DEFAULT '0' COMMENT '状态',
  `address_detail` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `linkman_name` varchar(50) DEFAULT NULL COMMENT '联系人姓名',
  `linkman_qq` varchar(13) DEFAULT NULL COMMENT '联系人QQ',
  `linkman_mobile` varchar(11) DEFAULT NULL COMMENT '联系人电话',
  `linkman_email` varchar(40) DEFAULT NULL COMMENT '联系人EMAIL',
  `license_number` varchar(20) DEFAULT NULL COMMENT '营业执照号',
  `tax_number` varchar(20) DEFAULT NULL COMMENT '税务登记证号',
  `org_number` varchar(20) DEFAULT NULL COMMENT '组织机构代码',
  `address` bigint(20) DEFAULT NULL COMMENT '公司地址',
  `logo_pic` varchar(100) DEFAULT NULL COMMENT '公司LOGO图',
  `brief` varchar(2000) DEFAULT NULL COMMENT '简介',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `legal_person` varchar(40) DEFAULT NULL COMMENT '法定代表人',
  `legal_person_card_id` varchar(25) DEFAULT NULL COMMENT '法定代表人身份证',
  `bank_user` varchar(50) DEFAULT NULL COMMENT '开户行账号名称',
  `bank_name` varchar(100) DEFAULT NULL COMMENT '开户行',
  PRIMARY KEY (`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_seller
-- ----------------------------
INSERT INTO `tb_seller` VALUES ('022', '11', 'fasdf', 'asdf', 'asf', 'asdf', 'asdf', '0', 'asd', 'adsf', 'asdf', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `tb_seller` VALUES ('fmjava', '上海*******有限责任公司', 'FMJava', '$2a$10$tpbr05oDn5tLkwSVJsF.HONrr9p.qvhNcdwfNR.SK7P4dXTaWoCyq', null, null, '021-68******1212', '1', '上海闵行区*******356街道', 'FmJava', '644346732', '138****4567', null, null, null, null, null, null, null, '2019-07-09 08:55:05', null, null, null, null);
INSERT INTO `tb_seller` VALUES ('fmjava1', 'fmjava12342', 'fmjava1234', '1234', null, null, '1212121', '1', 'aaaa', 'fmjava1', null, null, null, null, null, null, null, null, null, '2019-08-07 12:21:03', null, null, null, null);
INSERT INTO `tb_seller` VALUES ('fmjava123', 'fmjava123', 'fmjava123', '$2a$10$rWeoND7nnASkajR1qoaPHOOGPN./wktFbjzyYmO5SEDe5wkUWVFCS', null, null, '19988772', '0', '123123', 'q2r3r2', '1312', null, null, null, null, null, null, null, null, '2019-08-07 09:01:30', null, null, null, null);
INSERT INTO `tb_seller` VALUES ('fmjava2', 'bbb', 'aaaa', '$2a$10$pzIIb/cogdtPlQGpEf5rkuvqKOKpB0PWfXXueT/AnkfpVnzdCYiCq', null, null, 'ccc', '1', null, null, null, null, null, null, null, null, null, null, null, '2019-08-09 12:30:03', null, null, null, null);
INSERT INTO `tb_seller` VALUES ('gxq', 'aa', 'aa', '1234', null, null, 'adsfa', '1', 'asdf', null, null, null, null, null, null, null, null, null, null, '2019-08-07 13:55:26', null, null, null, null);
INSERT INTO `tb_seller` VALUES ('myxq', 'myxq', 'myxq', '1234', null, null, '111', '1', '222', null, null, null, null, null, null, null, null, null, null, '2019-08-07 06:42:19', null, null, null, null);
INSERT INTO `tb_seller` VALUES ('newUser1', '11', '11', '$2a$10$SU0GEApihZApx4C5pbGUAOQjqrW9f7W1CNYWXl6/weDprc8i5tEni', null, null, '2', '1', null, null, null, null, null, null, null, null, null, null, null, '2019-08-09 12:27:30', null, null, null, null);

-- ----------------------------
-- Table structure for tb_specification
-- ----------------------------
DROP TABLE IF EXISTS `tb_specification`;
CREATE TABLE `tb_specification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `spec_name` varchar(255) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_specification
-- ----------------------------
INSERT INTO `tb_specification` VALUES ('42', '选择颜色');
INSERT INTO `tb_specification` VALUES ('43', '选择版本');
INSERT INTO `tb_specification` VALUES ('44', '套　　餐');

-- ----------------------------
-- Table structure for tb_specification_option
-- ----------------------------
DROP TABLE IF EXISTS `tb_specification_option`;
CREATE TABLE `tb_specification_option` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '规格项ID',
  `option_name` varchar(200) DEFAULT NULL COMMENT '规格项名称',
  `spec_id` bigint(30) DEFAULT NULL COMMENT '规格ID',
  `orders` int(11) DEFAULT NULL COMMENT '排序值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_specification_option
-- ----------------------------
INSERT INTO `tb_specification_option` VALUES ('144', '秘境黑', '42', '1');
INSERT INTO `tb_specification_option` VALUES ('145', '星云紫', '42', '2');
INSERT INTO `tb_specification_option` VALUES ('146', '晨曦白', '42', '3');
INSERT INTO `tb_specification_option` VALUES ('147', '6G+64G', '43', '1');
INSERT INTO `tb_specification_option` VALUES ('148', '8G+128G', '43', '2');
INSERT INTO `tb_specification_option` VALUES ('149', '8G+256G', '43', '3');
INSERT INTO `tb_specification_option` VALUES ('150', '优惠套餐1', '44', '1');
INSERT INTO `tb_specification_option` VALUES ('151', '优惠套餐2', '44', '2');
INSERT INTO `tb_specification_option` VALUES ('152', '优惠套餐3', '44', '3');

-- ----------------------------
-- Table structure for tb_type_template
-- ----------------------------
DROP TABLE IF EXISTS `tb_type_template`;
CREATE TABLE `tb_type_template` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL COMMENT '模板名称',
  `spec_ids` varchar(1000) DEFAULT NULL COMMENT '关联规格',
  `brand_ids` varchar(1000) DEFAULT NULL COMMENT '关联品牌',
  `custom_attribute_items` varchar(2000) DEFAULT NULL COMMENT '自定义属性',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_type_template
-- ----------------------------
INSERT INTO `tb_type_template` VALUES ('44', '手机', '[{\"id\":42,\"spec_name\":\"选择颜色\"},{\"id\":43,\"spec_name\":\"选择版本\"},{\"id\":44,\"spec_name\":\"套餐\"}]', '[{\"id\":4,\"name\":\"小米\"},{\"id\":2,\"name\":\"华为\"}]', '[]');
INSERT INTO `tb_type_template` VALUES ('45', '新手机', '[{\"id\":43,\"spec_name\":\"选择版本\"},{\"id\":42,\"spec_name\":\"选择颜色\"}]', '[{\"name\":\"联想\",\"id\":1},{\"name\":\"华为\",\"id\":2}]', null);
INSERT INTO `tb_type_template` VALUES ('46', '网络', '[{\"id\":43,\"spec_name\":\"选择版本\"},{\"id\":42,\"spec_name\":\"选择颜色\"}]', '[{\"name\":\"三星\",\"id\":3},{\"name\":\"小米\",\"id\":4}]', null);

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码，加密存储',
  `phone` varchar(20) DEFAULT NULL COMMENT '注册手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '注册邮箱',
  `created` datetime NOT NULL COMMENT '创建时间',
  `updated` datetime NOT NULL,
  `source_type` varchar(1) DEFAULT NULL COMMENT '会员来源：1:PC，2：H5，3：Android，4：IOS，5：WeChat',
  `nick_name` varchar(50) DEFAULT NULL COMMENT '昵称',
  `name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `status` varchar(1) DEFAULT NULL COMMENT '使用状态（Y正常 N非正常）',
  `head_pic` varchar(150) DEFAULT NULL COMMENT '头像地址',
  `qq` varchar(20) DEFAULT NULL COMMENT 'QQ号码',
  `account_balance` decimal(10,0) DEFAULT NULL COMMENT '账户余额',
  `is_mobile_check` varchar(1) DEFAULT '0' COMMENT '手机是否验证 （0否  1是）',
  `is_email_check` varchar(1) DEFAULT '0' COMMENT '邮箱是否检测（0否  1是）',
  `sex` varchar(1) DEFAULT '0' COMMENT '性别，1男，2女',
  `user_level` int(11) DEFAULT NULL COMMENT '会员等级',
  `points` int(11) DEFAULT NULL COMMENT '积分',
  `experience_value` int(11) DEFAULT NULL COMMENT '经验值',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('17', 'gaowei', '1234', '185****6732', '644346732@qq.com', '2019-06-29 13:31:02', '2019-06-29 13:31:02', '1', 'gaowei', null, 'Y', null, null, null, '0', '0', '0', null, null, null, null, null);
INSERT INTO `tb_user` VALUES ('18', 'myxq', '1234', '185****6732', '644346732@qq.com', '2019-06-29 14:15:46', '2019-06-29 14:15:46', '1', 'myxq', null, 'Y', null, null, null, '0', '0', '0', null, null, null, null, null);
