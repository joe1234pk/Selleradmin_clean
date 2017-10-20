-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2017 at 04:36 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `selleradmin2`
--

-- --------------------------------------------------------

--
-- Table structure for table `ozhaha_wm_admin_user`
--

CREATE TABLE `ozhaha_wm_admin_user` (
  `id` int(11) NOT NULL COMMENT '编号',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modify` datetime NOT NULL COMMENT '最后修改时间',
  `username` varchar(32) NOT NULL COMMENT '管理员账户名称',
  `password` varchar(32) NOT NULL COMMENT '登录密码 (MD5加密)',
  `ap_list` varchar(128) DEFAULT NULL COMMENT '权限列表',
  `session_id` varchar(255) DEFAULT NULL COMMENT '当前session_id值',
  `gmt_login` datetime NOT NULL COMMENT '最后登录时间',
  `login_ip` varchar(50) NOT NULL COMMENT '最后登录IP',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '账户状态标识 (1:正常,0:禁用)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台管理员';

--
-- Dumping data for table `ozhaha_wm_admin_user`
--

INSERT INTO `ozhaha_wm_admin_user` (`id`, `gmt_create`, `gmt_modify`, `username`, `password`, `ap_list`, `session_id`, `gmt_login`, `login_ip`, `status`) VALUES
(1000000, '2017-05-09 17:02:23', '2017-05-15 16:19:33', 'admin', '0fc2029d89e5533c38036b59241b453d', NULL, NULL, '2017-05-09 17:02:23', '127.0.0.1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ozhaha_wm_advertisement`
--

CREATE TABLE `ozhaha_wm_advertisement` (
  `id` int(11) NOT NULL COMMENT '编号',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modify` datetime NOT NULL COMMENT '最后修改时间',
  `type` tinyint(3) DEFAULT '0' COMMENT '广告分类 (1:Banner,2:优惠专区)',
  `name` varchar(128) DEFAULT NULL COMMENT '名称',
  `path` varchar(128) NOT NULL COMMENT '图片地址',
  `url` varchar(128) NOT NULL COMMENT '链接地址',
  `weight` int(11) NOT NULL DEFAULT '1' COMMENT '排序权重',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态标识 (1:正常,0:禁用)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告位管理';

-- --------------------------------------------------------

--
-- Table structure for table `ozhaha_wm_balance_log`
--

CREATE TABLE `ozhaha_wm_balance_log` (
  `id` int(11) NOT NULL COMMENT '编号',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modify` datetime NOT NULL COMMENT '最后修改时间',
  `buyer_id` int(11) NOT NULL COMMENT '顾客编号 (对应ozhaha_wm_buyer.id)',
  `seller_id` int(11) DEFAULT NULL COMMENT '商家编号 (对应ozhaha_wm_seller.id)',
  `admin_id` int(11) DEFAULT NULL COMMENT '管理员编号',
  `order_id` int(11) DEFAULT NULL COMMENT '订单编号 (对应ozhaha_wm_order.id)',
  `type` varchar(8) NOT NULL COMMENT '类型 (RECHARGE:充值,REFUND:退款,CONSUME:消费)',
  `price` decimal(8,2) NOT NULL COMMENT '金额 (充值和退款为正数,消费则为负数)',
  `note` varchar(255) DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资金流水';

-- --------------------------------------------------------

--
-- Table structure for table `ozhaha_wm_buyer`
--

CREATE TABLE `ozhaha_wm_buyer` (
  `id` int(11) NOT NULL COMMENT '编号',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modify` datetime NOT NULL COMMENT '最后修改时间',
  `name` varchar(32) NOT NULL COMMENT '名称',
  `phone` varchar(16) NOT NULL COMMENT '电话号码',
  `password` varchar(32) NOT NULL COMMENT '登陆密码 (MD5加密)',
  `log_url` varchar(128) DEFAULT NULL COMMENT 'logo图片地址',
  `background_url` varchar(128) DEFAULT NULL COMMENT '背景封面图片地址',
  `state` varchar(8) NOT NULL COMMENT '状态 (ENABLED:可用,DISABLED:不可用)',
  `balance` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '余额'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='顾客';

-- --------------------------------------------------------

--
-- Table structure for table `ozhaha_wm_item`
--

CREATE TABLE `ozhaha_wm_item` (
  `id` int(11) NOT NULL COMMENT '编号',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modify` datetime NOT NULL COMMENT '最后修改时间',
  `name` varchar(32) NOT NULL COMMENT '名称',
  `image_url` varchar(128) DEFAULT NULL COMMENT '主图片地址',
  `seller_id` int(11) NOT NULL COMMENT '所属商家编号 (对应ozhaha_wm_seller.id)',
  `category_id` int(11) NOT NULL COMMENT '类目编号 (对应ozhaha_wm_item_category.id)',
  `price` decimal(8,2) NOT NULL COMMENT '挂牌价',
  `number` int(11) NOT NULL COMMENT '剩余数量',
  `can_use_coupon` tinyint(1) NOT NULL COMMENT '能否使用优惠券',
  `content` varchar(128) DEFAULT NULL COMMENT '商品介绍',
  `weight` int(11) NOT NULL DEFAULT '1' COMMENT '排序权重',
  `is_removed` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'used in logical del'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品(菜品)';

-- --------------------------------------------------------

--
-- Table structure for table `ozhaha_wm_item_category`
--

CREATE TABLE `ozhaha_wm_item_category` (
  `id` int(11) NOT NULL COMMENT '编号',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modify` datetime NOT NULL COMMENT '最后修改时间',
  `name` varchar(32) NOT NULL COMMENT '类目名称',
  `seller_id` int(11) NOT NULL COMMENT '所属商家编号 (对应ozhaha_wm_seller.id)',
  `parent_id` int(11) DEFAULT NULL COMMENT '父类目编号 (如果为null则为默认类目)',
  `weight` int(11) NOT NULL DEFAULT '1' COMMENT 'THE ORDER OF ITEMS'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品类目';

--
-- Dumping data for table `ozhaha_wm_item_category`
--

INSERT INTO `ozhaha_wm_item_category` (`id`, `gmt_create`, `gmt_modify`, `name`, `seller_id`, `parent_id`, `weight`) VALUES
(1000008, '2017-10-20 16:34:41', '0000-00-00 00:00:00', 'Lunch Special', 1000248, NULL, 1),
(1000009, '2017-10-20 16:35:08', '0000-00-00 00:00:00', 'Chef Recommend', 1000248, 0, 1),
(1000010, '2017-10-20 16:35:21', '0000-00-00 00:00:00', 'Regular', 1000248, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ozhaha_wm_item_images`
--

CREATE TABLE `ozhaha_wm_item_images` (
  `id` int(11) NOT NULL COMMENT '编号',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modify` datetime NOT NULL COMMENT '最后修改时间',
  `item_id` int(11) NOT NULL COMMENT '商品编号 (对应ozhaha_wm_item.id)',
  `serial_number` int(11) NOT NULL COMMENT '序号 (用于排序)',
  `url` varchar(128) DEFAULT NULL COMMENT '图片地址'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品图片';

-- --------------------------------------------------------

--
-- Table structure for table `ozhaha_wm_item_specification`
--

CREATE TABLE `ozhaha_wm_item_specification` (
  `id` int(11) NOT NULL COMMENT '编号',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modify` datetime NOT NULL COMMENT '最后修改时间',
  `name` varchar(32) NOT NULL COMMENT '规格名称',
  `item_id` int(11) NOT NULL COMMENT '商品编号 (对应ozhaha_wm_item.id)',
  `price` decimal(8,2) DEFAULT NULL COMMENT '价格幅度',
  `parent_id` int(11) DEFAULT NULL COMMENT '父规格编号 (如果为null则为默认类目)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品规格';

-- --------------------------------------------------------

--
-- Table structure for table `ozhaha_wm_order`
--

CREATE TABLE `ozhaha_wm_order` (
  `id` int(11) NOT NULL COMMENT '编号',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modify` datetime NOT NULL COMMENT '最后修改时间',
  `name` varchar(32) NOT NULL COMMENT '名称',
  `buyer_id` int(11) NOT NULL COMMENT '顾客编号 (对应ozhaha_wm_buyer.id)',
  `seller_id` int(11) NOT NULL COMMENT '商家编号 (对应ozhaha_wm_seller.id)',
  `status` varchar(8) NOT NULL COMMENT '订单状态 (NEW:新订单,WAIT:待配送,DELIVERY:配送中,DONE:已完成,CANCEL:已取消)',
  `note` varchar(255) DEFAULT NULL COMMENT '订单备注',
  `pay_type` varchar(8) NOT NULL COMMENT '支付类型 (PAYPAL:PayPal,ALIPAY:支付宝,WECHAT:微信支付,BALANCE:余额支付,OFFLINE:线下支付,OTHER:其它支付方式)',
  `pay_code` varchar(64) DEFAULT NULL COMMENT '支付编码',
  `total_price` decimal(8,2) NOT NULL COMMENT '订单总价 (优惠后的价格,不包含配送费)',
  `discount_price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '总优惠金额',
  `refund_price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额 (仅取消订单并退款后此金额才可能有值)',
  `price_id` int(11) DEFAULT NULL COMMENT '价格计划编号 (对应ozhaha_wm_price.id)',
  `receiver_name` varchar(32) NOT NULL COMMENT '收件人姓名',
  `receiver_phone` varchar(16) DEFAULT NULL COMMENT '收件人电话',
  `receiver_address` varchar(128) NOT NULL COMMENT '收件地址',
  `receiver_address_detail` varchar(255) DEFAULT NULL COMMENT '收件地址详情',
  `receiver_address_lon` varchar(32) NOT NULL COMMENT '收件地址经度',
  `receiver_address_lat` varchar(32) NOT NULL COMMENT '收件地址纬度',
  `accept_order_time` datetime DEFAULT NULL COMMENT '接单时间',
  `done_order_time` datetime DEFAULT NULL COMMENT '完成时间 (订单状态不为DONE时,此值位空)',
  `delivery_time` datetime DEFAULT NULL COMMENT '预计配送出发时间',
  `delivery_note` varchar(128) DEFAULT NULL COMMENT '配送备注',
  `delivery_type` varchar(8) NOT NULL COMMENT '配送类型 (SELF:餐厅自己配送,PANDA:PandaDelivery配送)',
  `delivery_code` varchar(32) DEFAULT NULL COMMENT '对应的Panda订单编号 (如果非PandaDelivery配送,则此项为空)',
  `delivery_price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '配送费',
  `seller_done_min` varchar(16) DEFAULT NULL COMMENT '商家备餐时间范围 (单位为分钟)',
  `print` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否打印小票 (0:未打印,1:已打印)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单';

-- --------------------------------------------------------

--
-- Table structure for table `ozhaha_wm_order_log`
--

CREATE TABLE `ozhaha_wm_order_log` (
  `id` int(11) NOT NULL COMMENT '编号',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modify` datetime NOT NULL COMMENT '最后修改时间',
  `order_id` int(11) NOT NULL COMMENT '订单编号 (对应ozhaha_wm_order.id)',
  `operator_type` varchar(8) NOT NULL COMMENT '操作者类型 (SELLER:商家,BUYER:顾客,ADMIN:管理员,SYSTEM:系统)',
  `operator_id` int(11) NOT NULL COMMENT '操作者编号 (分别对应ozhaha_wm_seller.id,ozhaha_wm_buyer.id,ozhaha_wm_admin_user.id,0)',
  `operator_name` varchar(128) DEFAULT NULL COMMENT '操作者名称 (分别对应ozhaha_wm_seller.name,ozhaha_wm_buyer.name,ozhaha_wm_admin_user.username,null)',
  `operator` varchar(128) DEFAULT NULL COMMENT '操作详情 (如果是订单状态变化直接写ozhaha_wm_order.status的值,如果是支付操作就写PAY)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单操作日志';

-- --------------------------------------------------------

--
-- Table structure for table `ozhaha_wm_price`
--

CREATE TABLE `ozhaha_wm_price` (
  `id` int(11) NOT NULL COMMENT '编号',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modify` datetime NOT NULL COMMENT '最后修改时间',
  `name` varchar(32) NOT NULL COMMENT '价格计划名称',
  `details` varchar(255) NOT NULL COMMENT '价格计划描述',
  `condition_type` varchar(8) NOT NULL COMMENT '条件类型 (TOTAL:总价满减,DISCOUNT:折扣,PRICE:减价)',
  `condition_value` varchar(64) DEFAULT NULL COMMENT '条件',
  `value` varchar(128) DEFAULT NULL COMMENT '价格计划信息',
  `effective_date` datetime NOT NULL COMMENT '有效时间',
  `weight` int(11) NOT NULL DEFAULT '1' COMMENT '价格计划权重'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品价格计划';

-- --------------------------------------------------------

--
-- Table structure for table `ozhaha_wm_seller`
--

CREATE TABLE `ozhaha_wm_seller` (
  `id` int(11) NOT NULL COMMENT '编号',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modify` datetime NOT NULL COMMENT '最后修改时间',
  `name` varchar(32) NOT NULL COMMENT '名称',
  `phone` varchar(16) NOT NULL COMMENT '电话号码',
  `email` varchar(128) NOT NULL COMMENT '电子邮件',
  `password` varchar(32) NOT NULL COMMENT '登陆密码 (MD5加密)',
  `logo_url` varchar(128) DEFAULT NULL COMMENT 'logo图片地址',
  `background_url` varchar(128) DEFAULT NULL COMMENT '背景封面图片地址',
  `seller_region_id` int(11) NOT NULL COMMENT '区域ID (关联ozhaha_wm_seller_region.id)',
  `address` varchar(128) NOT NULL COMMENT '地址',
  `address_detail` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `address_lon` varchar(32) NOT NULL COMMENT '地址经度',
  `address_lat` varchar(32) NOT NULL COMMENT '地址纬度',
  `state` varchar(8) NOT NULL COMMENT '状态 (WORK:营业中, NO_WORK:非营业中)',
  `business_times` varchar(64) DEFAULT NULL COMMENT '营业开始时间',
  `notice` varchar(255) DEFAULT NULL COMMENT '商家公告',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '商家状态 (1:正常,0:禁用)',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为推荐商家 (1:是,0:否)',
  `recommend_time` datetime DEFAULT NULL COMMENT '推荐截至时间 (为NULL表示永不过期)',
  `delivery_type` varchar(8) NOT NULL COMMENT '默认配送类型 (SELF:餐厅自己配送,PANDA:PandaDelivery配送)',
  `lowest_price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '最低起送价格',
  `speed` int(11) NOT NULL DEFAULT '20' COMMENT '配送时间',
  `commission` int(11) NOT NULL DEFAULT '1' COMMENT '提成% (范围0-100)',
  `weight` int(11) NOT NULL DEFAULT '1' COMMENT '排序权重',
  `sunmi_session_id` varchar(64) DEFAULT NULL COMMENT '商米商家小票机SessionId'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家(餐厅)';

--
-- Dumping data for table `ozhaha_wm_seller`
--

INSERT INTO `ozhaha_wm_seller` (`id`, `gmt_create`, `gmt_modify`, `name`, `phone`, `email`, `password`, `logo_url`, `background_url`, `seller_region_id`, `address`, `address_detail`, `address_lon`, `address_lat`, `state`, `business_times`, `notice`, `status`, `is_recommend`, `recommend_time`, `delivery_type`, `lowest_price`, `speed`, `commission`, `weight`, `sunmi_session_id`) VALUES
(1000248, '2017-06-26 08:39:47', '2017-06-30 18:34:52', '山城火锅王', '0292676366', '', 'e10adc3949ba59abbe56e057f20f883e', 'logo/8s60fy4lnxtlbrk3g43dgzhdd2ldlck0.jpg', 'category/201706/26/af3d3353c578804c32158873db76ce66.jpg', 1000003, '164 Forest Rd Hurstville NSW 2220', NULL, '151.1071569', '-33.967068', 'WORK', '11:00-21:00', '', 1, 0, NULL, 'PANDA', '0.00', 20, 10, 2, NULL),
(1000914, '2017-06-29 10:21:20', '2017-06-30 19:20:25', '测试专用', '0412345678', '', 'e10adc3949ba59abbe56e057f20f883e', 'category/201706/26/2ee8339670456bc2dbf7456796619a56.jpg', 'cover/3e180d0f091b36fa351a4e0e394d2de0.jpg', 0, '630 George Street, Sydney, NSW, 2000, Australia', NULL, '151.2065622', '-33.8760766', 'WORK', '10:00-22:00', '', 1, 0, NULL, 'PANDA', '0.00', 20, 10, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ozhaha_wm_seller_category`
--

CREATE TABLE `ozhaha_wm_seller_category` (
  `id` int(11) NOT NULL COMMENT '编号',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modify` datetime NOT NULL COMMENT '最后修改时间',
  `name` varchar(32) NOT NULL COMMENT '类目名称',
  `background_urls` varchar(512) DEFAULT NULL COMMENT '类目默认封面 (如有多个图片地址以逗号分隔,随机获取一张封面图)',
  `parent_id` int(11) DEFAULT NULL COMMENT '父类目编号 (如果为null则为默认类目)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家类目';

--
-- Dumping data for table `ozhaha_wm_seller_category`
--

INSERT INTO `ozhaha_wm_seller_category` (`id`, `gmt_create`, `gmt_modify`, `name`, `background_urls`, `parent_id`) VALUES
(1000002, '2017-06-26 08:39:02', '2017-06-26 18:13:00', '粤菜及港澳台美食', 'category/201706/26/2ee8339670456bc2dbf7456796619a56.jpg,category/201706/26/e55dec3b4b2833aeb36a014637f3efe8.jpg,category/201706/26/472d724b457230670a9c5605a1c05cc8.jpg,category/201706/26/7319097fd7c066cea599ff4d7adc012a.jpg,category/201706/26/17b3488ba45d968967a88b34bfe713dc.jpg,category/201706/26/3f9860eb62f60c868d940bd3ac0d713f.jpg,category/201706/26/8da490700335d1228e8b8ce2d18e45c0.jpg,category/201706/26/2ee8339670456bc2dbf7456796619a56.jpg,category/201706/26/e55dec3b4b2833aeb36a014637f3efe8.jpg', NULL),
(1000003, '2017-06-26 08:39:02', '2017-06-26 18:13:16', '蛋糕甜品', 'category/201706/26/7dda92578a3dc8ffc00b4a2731a558c4.jpg,category/201706/26/c793203583934de6c83266767b070746.jpg,category/201706/26/018e5fd80fde70515b3c7d3a0a322dfb.jpg,category/201706/26/07823b79514ef61593883136b7327e36.jpg,category/201706/26/09a24e5d92ecc51ade41eb314941393e.jpg,category/201706/26/ee777211f0d5b18e0bdefe3c4e6eac12.jpg', NULL),
(1000004, '2017-06-26 08:39:02', '2017-06-26 18:13:35', '日、韩料理', 'category/201706/26/01bce09632817b78ff473160d5adcf4c.jpg,category/201706/26/27a467aa693b305c6086805b5b7fdd69.jpg,category/201706/26/27d99af444069c46cce3de91df83d84a.jpg,category/201706/26/8116a613c4311882aec2fda67ea1bca8.jpg', NULL),
(1000006, '2017-06-26 08:39:02', '2017-06-26 18:13:47', '川菜/湘菜', 'category/201706/26/f53661dd198a6bd22b7da99bb362b8cb.jpg,category/201706/26/e1a399d3759559734e3911fbc2591920.jpg,category/201706/26/50208759eae07d402770103112c06e6b.jpg', NULL),
(1000007, '2017-06-26 08:39:02', '2017-06-26 18:12:36', '咖啡奶茶', 'category/201706/26/87eae4e6befa16e3882665e6fbf1e961.jpg,category/201706/26/8df6b567a51e8fb66909a03bae9af05c.jpg,category/201706/26/37782b2b50e6ab7f537cfe2978164680.jpg,category/201706/26/30a75498bb72b3b43521ef8828da5e70.jpg,category/201706/26/7a45813b21b7dbadfb374359ca3f5d43.jpg', NULL),
(1000008, '2017-06-26 08:39:02', '2017-06-26 18:12:21', '典雅西餐', 'category/201706/26/65c873841479fd2636b14cdf0f6a9ba2.jpg,category/201706/26/ecc45753ba10988abee0f6e3a5d6f843.jpg,category/201706/26/e6c0f47e68c76f25ce707e7474039e5d.jpg,category/201706/26/b015afc558fb7b79f0ae82e764813ce1.jpg', NULL),
(1000010, '2017-06-26 08:39:02', '2017-06-26 18:12:05', '火锅/烧烤', 'category/201706/26/bbdf03b56a5be6f0b959310a22501d41.jpg,category/201706/26/af3d3353c578804c32158873db76ce66.jpg,category/201706/26/76dcde52f2f33445707dd73daf034338.jpg', NULL),
(1000014, '2017-06-26 08:39:02', '2017-06-26 18:11:51', '江浙菜系', 'category/201706/26/7b9ebf50a1d2c328c02bbd266e08b8e0.jpg,category/201706/26/8410cdaf9fd80bf6c25f0de69b21b203.jpg,category/201706/26/0980832d215f6b62b4e4385d98de9544.jpg', NULL),
(1000023, '2017-06-26 08:39:02', '2017-06-26 18:11:37', '马/泰/越 美食', 'category/201706/26/397be85d6fb5673c9be36509265c9fbe.jpg,category/201706/26/8418ef607b6fe1019769eb23f3d59597.jpg,category/201706/26/bc8c5ada916659323f121207d26fdd0b.jpg,category/201706/26/0fd3472694a147ce71d1947dd2b4dc7b.jpg', NULL),
(1000086, '2017-06-26 08:39:02', '2017-06-26 18:11:14', '北方菜（东北/西北/鲁菜/北京）', 'category/201706/26/d46459a5cb5c1cd19c4bc0f8a8f0285e.jpg,category/201706/26/2bdf2f37c73f5e36e253fecdd8d9d9e3.jpg,category/201706/26/68668d182d44ece96ce0c7b6d88b952f.jpg,category/201706/26/471cdc3ef1d12a443702b2ac61bdca64.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ozhaha_wm_seller_item_price`
--

CREATE TABLE `ozhaha_wm_seller_item_price` (
  `id` int(11) NOT NULL COMMENT '编号',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modify` datetime NOT NULL COMMENT '最后修改时间',
  `seller_id` int(11) NOT NULL COMMENT '所属商家编号 (对应ozhaha_wm_seller.id)',
  `item_id` int(11) DEFAULT NULL COMMENT '所属商品编号 (对应ozhaha_wm_item.id)',
  `price_id` int(11) DEFAULT NULL COMMENT '价格计划编号 (对应ozhaha_wm_price.id)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家商品价格关联';

-- --------------------------------------------------------

--
-- Table structure for table `ozhaha_wm_seller_region`
--

CREATE TABLE `ozhaha_wm_seller_region` (
  `id` int(11) NOT NULL COMMENT '编号',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modify` datetime NOT NULL COMMENT '最后修改时间',
  `name` varchar(32) NOT NULL COMMENT '区域名称',
  `parent_id` int(11) DEFAULT NULL COMMENT '父区域编号 (如果为null则为默认区域)',
  `time_zone` varchar(16) DEFAULT NULL COMMENT 'GMT时区',
  `weight` int(11) NOT NULL DEFAULT '1' COMMENT '排序权重'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家所在区域';

--
-- Dumping data for table `ozhaha_wm_seller_region`
--

INSERT INTO `ozhaha_wm_seller_region` (`id`, `gmt_create`, `gmt_modify`, `name`, `parent_id`, `time_zone`, `weight`) VALUES
(1000001, '2017-06-26 08:39:13', '0000-00-00 00:00:00', 'Sydney', NULL, NULL, 1),
(1000003, '2017-06-26 08:39:13', '0000-00-00 00:00:00', 'City Zetland Waterloo', 1000001, NULL, 1),
(1000005, '2017-06-26 08:39:13', '0000-00-00 00:00:00', 'SydU Glebe Forest Lodge', 1000001, NULL, 2),
(1000008, '2017-06-26 08:39:13', '0000-00-00 00:00:00', 'Kingsford Maroubra Zetland Masco', 1000001, NULL, 3),
(1000014, '2017-06-26 08:39:13', '0000-00-00 00:00:00', 'UNSW CSA', 1000001, NULL, 4),
(1000018, '2017-06-26 08:39:13', '0000-00-00 00:00:00', 'Adelaide地区', NULL, NULL, 2),
(1000019, '2017-06-26 08:39:13', '0000-00-00 00:00:00', 'Adelaide', 1000018, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ozhaha_wm_seller_restdate`
--

CREATE TABLE `ozhaha_wm_seller_restdate` (
  `id` int(11) NOT NULL COMMENT '编号',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modify` datetime NOT NULL COMMENT '最后修改时间',
  `seller_id` int(11) NOT NULL COMMENT '所属商家编号 (对应ozhaha_wm_seller.id)',
  `type` varchar(8) NOT NULL COMMENT '休息类型 (DEFAULT:单个日期,WEEK:星期)',
  `value` varchar(32) NOT NULL COMMENT '休息日描述 (如果休息类型为"DEFAULT"则此值为具体日期,如果休息类型为"WEEK"则此值为周几)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家休息日配置';

-- --------------------------------------------------------

--
-- Table structure for table `ozhaha_wm_seller_seller_category`
--

CREATE TABLE `ozhaha_wm_seller_seller_category` (
  `id` int(11) NOT NULL COMMENT '编号',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modify` datetime NOT NULL COMMENT '最后修改时间',
  `seller_id` int(11) NOT NULL COMMENT '商家编号 (对应ozhaha_wm_seller.id)',
  `category_id` int(11) NOT NULL COMMENT '类目ID (关联ozhaha_wm_seller_category.id)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家类目关联';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ozhaha_wm_admin_user`
--
ALTER TABLE `ozhaha_wm_admin_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ozhaha_wm_balance_log`
--
ALTER TABLE `ozhaha_wm_balance_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ozhaha_wm_item`
--
ALTER TABLE `ozhaha_wm_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_name` (`name`,`seller_id`,`category_id`);

--
-- Indexes for table `ozhaha_wm_item_category`
--
ALTER TABLE `ozhaha_wm_item_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_name` (`seller_id`);

--
-- Indexes for table `ozhaha_wm_item_images`
--
ALTER TABLE `ozhaha_wm_item_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ozhaha_wm_item_specification`
--
ALTER TABLE `ozhaha_wm_item_specification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ozhaha_wm_order`
--
ALTER TABLE `ozhaha_wm_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ozhaha_wm_order_log`
--
ALTER TABLE `ozhaha_wm_order_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_name` (`order_id`);

--
-- Indexes for table `ozhaha_wm_price`
--
ALTER TABLE `ozhaha_wm_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ozhaha_wm_seller`
--
ALTER TABLE `ozhaha_wm_seller`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_name` (`name`,`seller_region_id`);

--
-- Indexes for table `ozhaha_wm_seller_category`
--
ALTER TABLE `ozhaha_wm_seller_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ozhaha_wm_seller_item_price`
--
ALTER TABLE `ozhaha_wm_seller_item_price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_name` (`seller_id`,`item_id`,`price_id`);

--
-- Indexes for table `ozhaha_wm_seller_region`
--
ALTER TABLE `ozhaha_wm_seller_region`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ozhaha_wm_seller_restdate`
--
ALTER TABLE `ozhaha_wm_seller_restdate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ozhaha_wm_seller_seller_category`
--
ALTER TABLE `ozhaha_wm_seller_seller_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_name` (`seller_id`,`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ozhaha_wm_admin_user`
--
ALTER TABLE `ozhaha_wm_admin_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号', AUTO_INCREMENT=1000012;
--
-- AUTO_INCREMENT for table `ozhaha_wm_item`
--
ALTER TABLE `ozhaha_wm_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号', AUTO_INCREMENT=2408624;
--
-- AUTO_INCREMENT for table `ozhaha_wm_item_category`
--
ALTER TABLE `ozhaha_wm_item_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号', AUTO_INCREMENT=1000011;
--
-- AUTO_INCREMENT for table `ozhaha_wm_item_images`
--
ALTER TABLE `ozhaha_wm_item_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号', AUTO_INCREMENT=1000009;
--
-- AUTO_INCREMENT for table `ozhaha_wm_item_specification`
--
ALTER TABLE `ozhaha_wm_item_specification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号';
--
-- AUTO_INCREMENT for table `ozhaha_wm_order`
--
ALTER TABLE `ozhaha_wm_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号', AUTO_INCREMENT=1000259;
--
-- AUTO_INCREMENT for table `ozhaha_wm_order_log`
--
ALTER TABLE `ozhaha_wm_order_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号', AUTO_INCREMENT=1000204;
--
-- AUTO_INCREMENT for table `ozhaha_wm_price`
--
ALTER TABLE `ozhaha_wm_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号';
--
-- AUTO_INCREMENT for table `ozhaha_wm_seller`
--
ALTER TABLE `ozhaha_wm_seller`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号', AUTO_INCREMENT=1000915;
--
-- AUTO_INCREMENT for table `ozhaha_wm_seller_category`
--
ALTER TABLE `ozhaha_wm_seller_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号', AUTO_INCREMENT=1000087;
--
-- AUTO_INCREMENT for table `ozhaha_wm_seller_item_price`
--
ALTER TABLE `ozhaha_wm_seller_item_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号';
--
-- AUTO_INCREMENT for table `ozhaha_wm_seller_region`
--
ALTER TABLE `ozhaha_wm_seller_region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号', AUTO_INCREMENT=1000020;
--
-- AUTO_INCREMENT for table `ozhaha_wm_seller_restdate`
--
ALTER TABLE `ozhaha_wm_seller_restdate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号', AUTO_INCREMENT=1001944;
--
-- AUTO_INCREMENT for table `ozhaha_wm_seller_seller_category`
--
ALTER TABLE `ozhaha_wm_seller_seller_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号', AUTO_INCREMENT=1000567;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
