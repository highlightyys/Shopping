/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : shopping

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-08-24 08:45:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `addressid` int(30) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `consignee` varchar(20) DEFAULT NULL,
  `conphone` varchar(20) DEFAULT NULL,
  `detailaddr` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`addressid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('2', '7', '李四', '13088411234', '河北省秦皇岛市海港区');
INSERT INTO `address` VALUES ('3', '7', '王五', '15025621417', '河北省秦皇岛市海港区泰山路');
INSERT INTO `address` VALUES ('4', '7', '赵六', '154896532154875', '马达加斯加');
INSERT INTO `address` VALUES ('8', '15', '王思聪', '18888888888', '万达广场');
INSERT INTO `address` VALUES ('9', '15', '赵六', '18888888888', '手动阀手动阀手动阀');
INSERT INTO `address` VALUES ('10', '7', '王思聪', '18888888888', '万达广场');
INSERT INTO `address` VALUES ('11', '17', '王小明', '1589654753', '秦皇岛');
INSERT INTO `address` VALUES ('12', '18', '王小明', '15894563215', '马尔代夫');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cartid` int(5) NOT NULL AUTO_INCREMENT,
  `userid` int(5) DEFAULT NULL,
  `proid` int(5) DEFAULT NULL,
  `count` int(5) DEFAULT NULL,
  PRIMARY KEY (`cartid`),
  KEY `cart_user` (`userid`),
  KEY `cart_product` (`proid`),
  CONSTRAINT `cart_product` FOREIGN KEY (`proid`) REFERENCES `product` (`proid`),
  CONSTRAINT `cart_user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('45', null, '37', '8');
INSERT INTO `cart` VALUES ('46', null, '37', '8');
INSERT INTO `cart` VALUES ('47', null, '37', '8');
INSERT INTO `cart` VALUES ('48', null, '6', '1');
INSERT INTO `cart` VALUES ('49', '11', '36', '1');
INSERT INTO `cart` VALUES ('50', '13', '28', '1');
INSERT INTO `cart` VALUES ('53', '15', '7', '1');
INSERT INTO `cart` VALUES ('54', '16', '22', '1');
INSERT INTO `cart` VALUES ('58', '7', '17', '1');
INSERT INTO `cart` VALUES ('59', '7', '6', '1');
INSERT INTO `cart` VALUES ('60', '7', '23', '1');

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `collectionid` int(5) NOT NULL AUTO_INCREMENT,
  `userid` int(5) DEFAULT NULL,
  `proid` int(5) DEFAULT NULL,
  PRIMARY KEY (`collectionid`),
  KEY `userid` (`userid`),
  KEY `proid` (`proid`),
  CONSTRAINT `proid` FOREIGN KEY (`proid`) REFERENCES `product` (`proid`),
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES ('2', '7', '7');
INSERT INTO `collection` VALUES ('4', null, '28');
INSERT INTO `collection` VALUES ('5', '11', '36');
INSERT INTO `collection` VALUES ('6', null, '37');
INSERT INTO `collection` VALUES ('7', null, '37');
INSERT INTO `collection` VALUES ('8', null, '37');
INSERT INTO `collection` VALUES ('9', null, '7');
INSERT INTO `collection` VALUES ('10', null, '7');
INSERT INTO `collection` VALUES ('11', null, '7');
INSERT INTO `collection` VALUES ('12', null, '7');
INSERT INTO `collection` VALUES ('13', '14', '29');
INSERT INTO `collection` VALUES ('14', '15', '26');
INSERT INTO `collection` VALUES ('15', '15', '28');
INSERT INTO `collection` VALUES ('17', '7', '18');
INSERT INTO `collection` VALUES ('18', '7', '28');
INSERT INTO `collection` VALUES ('19', '17', '17');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('admin', 'admin');

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail` (
  `detailid` int(5) NOT NULL AUTO_INCREMENT,
  `proid` int(5) DEFAULT NULL,
  `orderid` int(5) DEFAULT NULL,
  `count` int(5) DEFAULT NULL,
  `total` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`detailid`),
  KEY `detail_product` (`proid`),
  KEY `detail_order` (`orderid`),
  CONSTRAINT `detail_order` FOREIGN KEY (`orderid`) REFERENCES `ordertable` (`orderid`),
  CONSTRAINT `detail_product` FOREIGN KEY (`proid`) REFERENCES `product` (`proid`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
INSERT INTO `orderdetail` VALUES ('11', '27', '7', '1', '9999.00');
INSERT INTO `orderdetail` VALUES ('13', '30', '9', '1', '350000.00');
INSERT INTO `orderdetail` VALUES ('16', '30', '12', '6', '2100000.00');
INSERT INTO `orderdetail` VALUES ('17', '30', '13', '9', '3150000.00');
INSERT INTO `orderdetail` VALUES ('18', '16', '14', '1', '79.90');
INSERT INTO `orderdetail` VALUES ('19', '19', '14', '4', '91.20');
INSERT INTO `orderdetail` VALUES ('20', '20', '14', '18', '340.20');
INSERT INTO `orderdetail` VALUES ('21', '28', '15', '1', '69999.00');
INSERT INTO `orderdetail` VALUES ('22', '33', '15', '1', '1099.00');
INSERT INTO `orderdetail` VALUES ('23', '31', '15', '1', '610000.00');
INSERT INTO `orderdetail` VALUES ('24', '8', '16', '1', '49.96');
INSERT INTO `orderdetail` VALUES ('25', '27', '17', '1', '9999.00');
INSERT INTO `orderdetail` VALUES ('26', '27', '18', '1', '9999.00');
INSERT INTO `orderdetail` VALUES ('27', '27', '18', '1', '9999.00');
INSERT INTO `orderdetail` VALUES ('28', '7', '19', '1', '17.90');
INSERT INTO `orderdetail` VALUES ('29', '6', '20', '1', '38.50');
INSERT INTO `orderdetail` VALUES ('30', '6', '21', '1', '38.50');
INSERT INTO `orderdetail` VALUES ('31', '28', '22', '1', '69999.00');
INSERT INTO `orderdetail` VALUES ('32', '28', '23', '1', '69999.00');
INSERT INTO `orderdetail` VALUES ('33', '7', '24', '1', '17.90');
INSERT INTO `orderdetail` VALUES ('34', '5', '25', '1', '29.90');
INSERT INTO `orderdetail` VALUES ('35', '7', '26', '1', '17.90');
INSERT INTO `orderdetail` VALUES ('36', '6', '27', '8', '308.00');
INSERT INTO `orderdetail` VALUES ('37', '28', '28', '9', '629991.00');
INSERT INTO `orderdetail` VALUES ('38', '28', '29', '1', '69999.00');
INSERT INTO `orderdetail` VALUES ('39', '28', '30', '1', '69999.00');
INSERT INTO `orderdetail` VALUES ('40', '6', '31', '1', '38.50');
INSERT INTO `orderdetail` VALUES ('41', '6', '32', '1', '38.50');
INSERT INTO `orderdetail` VALUES ('42', '16', '33', '1', '79.90');
INSERT INTO `orderdetail` VALUES ('43', '18', '34', '12', '834.00');
INSERT INTO `orderdetail` VALUES ('44', '19', '34', '16', '364.80');
INSERT INTO `orderdetail` VALUES ('45', '17', '35', '10', '630.00');
INSERT INTO `orderdetail` VALUES ('46', '23', '35', '5', '750.00');
INSERT INTO `orderdetail` VALUES ('47', '17', '36', '1', '63.00');
INSERT INTO `orderdetail` VALUES ('48', '8', '37', '1', '49.96');
INSERT INTO `orderdetail` VALUES ('49', '17', '38', '6', '378.00');
INSERT INTO `orderdetail` VALUES ('50', '23', '38', '3', '450.00');
INSERT INTO `orderdetail` VALUES ('51', '28', '38', '1', '69999.00');

-- ----------------------------
-- Table structure for ordertable
-- ----------------------------
DROP TABLE IF EXISTS `ordertable`;
CREATE TABLE `ordertable` (
  `orderid` int(5) NOT NULL AUTO_INCREMENT,
  `time` date DEFAULT NULL,
  `totalprice` double(10,2) DEFAULT NULL,
  `orderstatus` varchar(10) DEFAULT '0',
  `orderaddressid` int(10) DEFAULT NULL,
  `userid` int(5) DEFAULT NULL,
  `ordernum` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  KEY `order_user` (`userid`),
  CONSTRAINT `order_user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ordertable
-- ----------------------------
INSERT INTO `ordertable` VALUES ('7', '2018-08-22', '9999.00', '3', '3', '7', '20180822114108290000');
INSERT INTO `ordertable` VALUES ('9', '2018-08-22', '350000.00', '0', null, '7', '20180822114438344000');
INSERT INTO `ordertable` VALUES ('12', '2018-08-22', '2100000.00', '0', null, '7', '20180822142313929001');
INSERT INTO `ordertable` VALUES ('13', '2018-08-22', '3150000.00', '0', null, '7', '20180822142327650002');
INSERT INTO `ordertable` VALUES ('14', '2018-08-22', '511.30', '3', null, '7', '20180822142757145000');
INSERT INTO `ordertable` VALUES ('15', '2018-08-22', '681098.00', '3', null, '7', '20180822143119041000');
INSERT INTO `ordertable` VALUES ('16', '2018-08-22', '49.96', '2', null, '7', '20180822143624807000');
INSERT INTO `ordertable` VALUES ('17', '2018-08-22', '9999.00', '1', '10', '7', '20180822143829850001');
INSERT INTO `ordertable` VALUES ('18', '2018-08-22', '19998.00', '0', null, '7', '20180822143953541002');
INSERT INTO `ordertable` VALUES ('19', '2018-08-22', '17.90', '1', null, '7', '20180822144300948003');
INSERT INTO `ordertable` VALUES ('20', '2018-08-22', '38.50', '1', null, '7', '20180822151506219004');
INSERT INTO `ordertable` VALUES ('21', '2018-08-22', '38.50', '0', null, '7', '20180822152022464000');
INSERT INTO `ordertable` VALUES ('22', '2018-08-22', '69999.00', '0', null, '7', '20180822152145103000');
INSERT INTO `ordertable` VALUES ('23', '2018-08-22', '69999.00', '0', null, '7', '20180822152414778000');
INSERT INTO `ordertable` VALUES ('24', '2018-08-22', '17.90', '1', null, '7', '20180822153342383001');
INSERT INTO `ordertable` VALUES ('25', '2018-08-22', '29.90', '1', null, '7', '20180822171656989000');
INSERT INTO `ordertable` VALUES ('26', '2018-08-23', '17.90', '1', null, '15', '20180823090107144000');
INSERT INTO `ordertable` VALUES ('27', '2018-08-23', '308.00', '1', null, '15', '20180823090306709001');
INSERT INTO `ordertable` VALUES ('28', '2018-08-23', '629991.00', '0', null, '15', '20180823090405654002');
INSERT INTO `ordertable` VALUES ('29', '2018-08-23', '69999.00', '0', null, '7', '20180823095016034000');
INSERT INTO `ordertable` VALUES ('30', '2018-08-23', '69999.00', '0', null, '7', '20180823095047248001');
INSERT INTO `ordertable` VALUES ('31', '2018-08-23', '38.50', '0', null, '7', '20180823102048686000');
INSERT INTO `ordertable` VALUES ('32', '2018-08-23', '38.50', '0', null, '7', '20180823102243090001');
INSERT INTO `ordertable` VALUES ('33', '2018-08-23', '79.90', '1', '2', '7', '20180823114224906000');
INSERT INTO `ordertable` VALUES ('34', '2018-08-23', '1198.80', '3', '3', '7', '20180823143126254000');
INSERT INTO `ordertable` VALUES ('35', '2018-08-23', '1380.00', '3', '11', '17', '20180823164327239000');
INSERT INTO `ordertable` VALUES ('36', '2018-08-23', '63.00', '0', null, '7', '20180823165813119001');
INSERT INTO `ordertable` VALUES ('37', '2018-08-23', '49.96', '0', null, '7', '20180823170047727002');
INSERT INTO `ordertable` VALUES ('38', '2018-08-24', '70827.00', '3', '12', '18', '20180824083438053000');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `proid` int(5) NOT NULL AUTO_INCREMENT,
  `proname` varchar(200) DEFAULT NULL,
  `price_sale` double(10,2) DEFAULT NULL,
  `price_avg` double(10,2) DEFAULT NULL,
  `descript` varchar(500) DEFAULT NULL,
  `picurl` varchar(200) DEFAULT NULL,
  `typeid` int(5) DEFAULT NULL,
  `stock` int(10) DEFAULT NULL,
  `salecount` int(10) DEFAULT NULL,
  PRIMARY KEY (`proid`),
  KEY `product_type` (`typeid`),
  CONSTRAINT `product_type` FOREIGN KEY (`typeid`) REFERENCES `producttype` (`typeid`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('5', '刺猬阿甘口袋面包夹心菠萝包吐司早餐食品营养整箱糕点点心零食', '29.90', '35.00', '阿甘努力的为岛主制作美食，就是想让岛主吃的美味，可口，健康。岛主，美食是需要分享的噢~您可以把美食分享给您的好朋友呢~您下次再来阿甘岛的时候，一定要带着您的好朋友一起来噢~阿甘岛的小刺猬可是非常好客的呢~会为大家准备足够多的美食哦（づ￣3￣）づ╭～~', 'ZB[2K[TFZEU1F]26~`HC7G7.png', '11', '6231', '100');
INSERT INTO `product` VALUES ('6', '友臣肉松饼2.5斤整箱早餐食品糕点面包批发散装60个零食小吃特产', '38.50', '50.00', '肉松饼是用肉松、小麦粉、绿豆、鸡蛋、白糖作为主要原料制作的一道小吃。具有入口即溶 酥脆香口的特色。小麦面粉富含蛋白质、碳水化合物、维生素和钙、铁、磷、钾、镁等矿物质，有养心益肾、健睥厚肠、除热止渴的功效，主治脏躁、烦热、消渴、泄痢、痈肿、外伤出血及烫伤等。', 'TB2tTW1inXYBeNkHFrdXXciuVXa_!!1103606647.jpg', '11', '9999', '90');
INSERT INTO `product` VALUES ('7', '【百草味-精制猪肉脯200g】肉类美食休闲零食靖江熟食肉干小吃', '17.90', '20.00', '猪肉脯是猪肉经腌制、烘烤的片状肉制品。猪肉脯是一种食用方便、制作考究、美味可口、耐贮藏和便于运输的中式传统风味肉制品。猪肉脯色泽呈鲜艳的棕红色，具有口感丰富，咸中微甜，芳香浓郁，余味无穷。', 'bd315c6034a85edf73845ea543540923dd547528.jpg', '11', '9999', '23');
INSERT INTO `product` VALUES ('8', '百草味零食大礼包芒果干草莓干水果干组合果脯蜜饯一箱整箱混合装', '49.96', '60.00', '芒果干是用芒果制作的一道小吃。芒果干有益胃、止呕、止晕的功效。因此，芒果对于眩晕症、梅尼埃综合症、高血压晕眩、恶心呕吐等均有疗效。在中医理论中，芒果核具有补肾、祛肾寒的功效。有学者对芒果核中的功能性成分进行了研究，Yean　Soong等的研究表明果核的乙醇萃取物中含有的没食子酸和鞣花酸为我们提供了一个天然抗氧化剂的新来源。', 'TB2lieIeaAoBKNjSZSyXXaHAVXa_!!2128793927.jpg', '11', '6666', '56');
INSERT INTO `product` VALUES ('9', '新货【葡记咸蛋黄味方块酥1000g】粗粮纤维饼干 早餐茶点心零食品', '29.80', '89.00', '小麦、黄油、蛋黄，配料有白砂糖、水、黄豆、豆沙、咸鸭蛋等，做法与苏式月饼有很多共通之处。传统的蛋黄酥用的是猪油，现在多用的黄油，就除去了熬猪油的麻烦，并且增强了口感。', 'TB2xzgxH7SWBuNjSszdXXbeSpXa_!!904133368.jpg', '11', '7777', '999');
INSERT INTO `product` VALUES ('16', '中秋礼盒月饼咸亨酒店咸亨月饼品悦秋韵400g广式中秋送礼传统糕点', '79.90', '189.00', '中秋礼盒月饼咸亨酒店咸亨月饼品悦秋韵400g广式中秋送礼传统糕点\r\n中秋礼盒月饼咸亨酒店咸亨月饼品悦秋韵400g广式中秋送礼传统糕点\r\n中秋礼盒月饼咸亨酒店咸亨月饼品悦秋韵400g广式中秋送礼传统糕点', '/F/4/EE93E8E300B3432B8DFA941CB2C79895.jpg', '10', '8291', null);
INSERT INTO `product` VALUES ('17', '包邮北京特产正宗三禾北京稻香村糕点礼盒京八件传统点心手工零食', '63.00', '90.00', '包邮北京特产正宗三禾北京稻香村糕点礼盒京八件传统点心手工零食\r\n包邮北京特产正宗三禾北京稻香村糕点礼盒京八件传统点心手工零食\r\n包邮北京特产正宗三禾北京稻香村糕点礼盒京八件传统点心手工零食\r\n', '/E/5/AD4A65FC16324AF49362EED8D2F1A327.jpg', '10', '5684', null);
INSERT INTO `product` VALUES ('18', '沙琪玛5斤包邮黑糖老式手工糕点点心零食早餐散装整箱萨其马', '69.50', '90.00', '沙琪玛5斤包邮黑糖老式手工糕点点心零食早餐散装整箱萨其马\r\n沙琪玛5斤包邮黑糖老式手工糕点点心零食早餐散装整箱萨其马\r\n沙琪玛5斤包邮黑糖老式手工糕点点心零食早餐散装整箱萨其马', '/B/3/C7AA6B4A3BA44AADA491BEEB73655216.jpg', '10', '8965', null);
INSERT INTO `product` VALUES ('19', '一品蛋酥鸡蛋酥120g*4盒手工饼干糕点孕妇零食小吃点心黄金蛋黄酥', '22.80', '51.60', '一品蛋酥鸡蛋酥120g*4盒手工饼干糕点孕妇零食小吃点心黄金蛋黄酥\r\n一品蛋酥鸡蛋酥120g*4盒手工饼干糕点孕妇零食小吃点心黄金蛋黄酥一品蛋酥鸡蛋酥120g*4盒手工饼干糕点孕妇零食小吃点心黄金蛋黄酥', '/2/5/D67EE937182440859C6EB651DC5088F6.jpg', '10', '1236', null);
INSERT INTO `product` VALUES ('20', '黄山烧饼60个正宗安徽特产网红梅干菜肉饼金华酥饼糕点心零食小吃', '18.90', '60.00', '黄山烧饼60个正宗安徽特产网红梅干菜肉饼金华酥饼糕点心零食小吃\r\n黄山烧饼60个正宗安徽特产网红梅干菜肉饼金华酥饼糕点心零食小吃\r\n黄山烧饼60个正宗安徽特产网红梅干菜肉饼金华酥饼糕点心零食小吃', '/2/3/9B05ECFEDE0F4144B373D6751700266F.jpg', '10', '8854', null);
INSERT INTO `product` VALUES ('21', '全聚德旗舰店北京烤鸭全聚德烤鸭北京特产送礼熟食肉类老字号', '138.00', '148.00', '全聚德旗舰店北京烤鸭全聚德烤鸭北京特产送礼熟食肉类老字号全聚德旗舰店北京烤鸭全聚德烤鸭北京特产送礼熟食肉类老字号全聚德旗舰店北京烤鸭全聚德烤鸭北京特产送礼熟食肉类老字号', '/B/D/2AD20159367A4DB495849CD6BE06E1C0.jpg', '12', '6952', null);
INSERT INTO `product` VALUES ('22', '桂发祥正宗十八街麻花礼盒天津手工多味香酥麻花传统特产零食', '86.40', '150.00', '桂发祥正宗十八街麻花礼盒天津手工多味香酥麻花传统特产零食桂发祥正宗十八街麻花礼盒天津手工多味香酥麻花传统特产零食桂发祥正宗十八街麻花礼盒天津手工多味香酥麻花传统特产零食', '/4/E/D6E4353929D349C8BF0C8AA3902A9FD7.jpg', '12', '8967', null);
INSERT INTO `product` VALUES ('23', '正宗驴肉火烧当天现做10个火烧饼1斤驴肉送焖子河北河间特产包邮', '150.00', '180.00', '正宗驴肉火烧当天现做10个火烧饼1斤驴肉送焖子河北河间特产包邮正宗驴肉火烧当天现做10个火烧饼1斤驴肉送焖子河北河间特产包邮正宗驴肉火烧当天现做10个火烧饼1斤驴肉送焖子河北河间特产包邮', '/F/D/9958D6605FDF4073A6B16F08F677E0FD.jpg', '12', '7958', '999');
INSERT INTO `product` VALUES ('24', '陕西西安腊汁肉夹馍饼速食特产早餐真空即食食品小吃美食网红早点', '38.00', '43.00', '陕西西安腊汁肉夹馍饼速食特产早餐真空即食食品小吃美食网红早点陕西西安腊汁肉夹馍饼速食特产早餐真空即食食品小吃美食网红早点陕西西安腊汁肉夹馍饼速食特产早餐真空即食食品小吃美食网红早点', '/8/A/09E68EF9547F43C6BE3222814FC698DA.jpg', '12', '3698', null);
INSERT INTO `product` VALUES ('25', '【新疆直发】新疆哈密瓜甜瓜新鲜水果吐鲁番西州蜜瓜8斤左右包邮', '68.00', '98.00', '【新疆直发】新疆哈密瓜甜瓜新鲜水果吐鲁番西州蜜瓜8斤左右包邮【新疆直发】新疆哈密瓜甜瓜新鲜水果吐鲁番西州蜜瓜8斤左右包邮【新疆直发】新疆哈密瓜甜瓜新鲜水果吐鲁番西州蜜瓜8斤左右包邮', '/8/F/285272E557E04BEE9F05A45788FC0836.jpg', '12', '5478', null);
INSERT INTO `product` VALUES ('26', '有机汇 有机宅配套餐体验装1次6种蔬菜6斤以上', '135.00', '150.00', '有机汇 有机宅配套餐体验装1次6种蔬菜6斤以上\r\n有机汇 有机宅配套餐体验装1次6种蔬菜6斤以上\r\n有机汇 有机宅配套餐体验装1次6种蔬菜6斤以上', '/C/2/D6AC1062B64C4CA680F34279587C6827.jpg', '13', '5597', null);
INSERT INTO `product` VALUES ('27', '现货 冬季限定！日本北海道ROYCE 山崎威士忌金盒生巧克力02.12', '9999.00', '0.10', '现货 冬季限定！日本北海道ROYCE 山崎威士忌金盒生巧克力02.12\r\n现货 冬季限定！日本北海道ROYCE 山崎威士忌金盒生巧克力02.12\r\n现货 冬季限定！日本北海道ROYCE 山崎威士忌金盒生巧克力02.12', '/A/B/1FDEFFD5188C41959016739AD890840E.jpg', '14', '6952', null);
INSERT INTO `product` VALUES ('28', 'REPUBLIC OF GAMERS/玩家国度 GX800VH GX800VH双显卡游戏笔记本', '69999.00', '0.10', 'REPUBLIC OF GAMERS/玩家国度 GX800VH GX800VH双显卡游戏笔记本\r\nREPUBLIC OF GAMERS/玩家国度 GX800VH GX800VH双显卡游戏笔记本\r\nREPUBLIC OF GAMERS/玩家国度 GX800VH GX800VH双显卡游戏笔记本', '/A/7/5010E7E707A7453BB35D89EBE2C1761C.jpg', '16', '6952', null);
INSERT INTO `product` VALUES ('29', '8848钛金手机M3巅峰版鳄鱼皮智能钛金手机双卡双待全网', '19999.00', '0.10', '8848钛金手机M3巅峰版鳄鱼皮智能钛金手机双卡双待全网\r\n8848钛金手机M3巅峰版鳄鱼皮智能钛金手机双卡双待全网\r\n8848钛金手机M3巅峰版鳄鱼皮智能钛金手机双卡双待全网', '/A/5/BFB0E7898EBD4F00BAEE2B782EB0F697.jpg', '17', '22156', null);
INSERT INTO `product` VALUES ('30', 'LG 105UC9-CA 105吋IPS硬屏5K高清不闪式3D液晶电视机 100寸', '350000.00', '0.10', 'LG 105UC9-CA 105吋IPS硬屏5K高清不闪式3D液晶电视机 100寸\r\nLG 105UC9-CA 105吋IPS硬屏5K高清不闪式3D液晶电视机 100寸\r\nLG 105UC9-CA 105吋IPS硬屏5K高清不闪式3D液晶电视机 100寸', '/C/1/4BF7D776489E4F53A02B3179DDD86640.jpg', '18', '1234', null);
INSERT INTO `product` VALUES ('31', '实体 leica/徕卡 MP 建国60周年限量版相机 带50/1.4镜头', '610000.00', '0.10', '实体 leica/徕卡 MP 建国60周年限量版相机 带50/1.4镜头\r\n实体 leica/徕卡 MP 建国60周年限量版相机 带50/1.4镜头\r\n实体 leica/徕卡 MP 建国60周年限量版相机 带50/1.4镜头', '/C/B/79CA7532D07D428199CC84EED68AE566.jpg', '19', '400', null);
INSERT INTO `product` VALUES ('32', 'Nike 耐克官方 NIKE TANJUN 男子运动休闲鞋 812654', '499.00', '500.00', 'Nike 耐克官方 NIKE TANJUN 男子运动休闲鞋 812654\r\nNike 耐克官方 NIKE TANJUN 男子运动休闲鞋 812654\r\nNike 耐克官方 NIKE TANJUN 男子运动休闲鞋 812654', '/9/B/3CACFA848FB442C9A5DB840DEC702E5B.jpg', '20', '6952', null);
INSERT INTO `product` VALUES ('33', '阿迪达斯官方adidas 三叶草 POD-S3.1 男子 经典鞋 B37366', '1099.00', '1500.00', '阿迪达斯官方adidas 三叶草 POD-S3.1 男子 经典鞋 B37366\r\n阿迪达斯官方adidas 三叶草 POD-S3.1 男子 经典鞋 B37366阿迪达斯官方adidas 三叶草 POD-S3.1 男子 经典鞋 B37366', '/8/5/C6784E0DB1334FCF8B9D88068322B7EB.jpg', '21', '3443', null);
INSERT INTO `product` VALUES ('34', '李宁韦德之道 悟道2 ACE 灰绿纽约时装周走秀款休闲鞋AGWN024-3', '999.00', '1220.00', '李宁韦德之道 悟道2 ACE 灰绿纽约时装周走秀款休闲鞋AGWN024-3\r\n李宁韦德之道 悟道2 ACE 灰绿纽约时装周走秀款休闲鞋AGWN024-3\r\n李宁韦德之道 悟道2 ACE 灰绿纽约时装周走秀款休闲鞋AGWN024-3', '/F/B/C25C0B7B9539449E9B4123337B0B6C7A.jpg', '22', '3425', null);
INSERT INTO `product` VALUES ('35', '【买一送三】夏季短袖t恤男士潮流圆领印花体恤韩版潮牌衣服男装', '79.90', '198.00', '【买一送三】夏季短袖t恤男士潮流圆领印花体恤韩版潮牌衣服男装\r\n【买一送三】夏季短袖t恤男士潮流圆领印花体恤韩版潮牌衣服男装\r\n【买一送三】夏季短袖t恤男士潮流圆领印花体恤韩版潮牌衣服男装', '/9/7/4F2949C5105447109CAAC37890ADB29C.jpg', '23', '265', null);
INSERT INTO `product` VALUES ('36', '云思木想2018秋装新款女装原创印花丝绒套头圆领长袖卫衣女75512', '149.00', '262.00', '云思木想2018秋装新款女装原创印花丝绒套头圆领长袖卫衣女75512\r\n云思木想2018秋装新款女装原创印花丝绒套头圆领长袖卫衣女75512\r\n云思木想2018秋装新款女装原创印花丝绒套头圆领长袖卫衣女75512', '/8/1/7C9044934F0249EB8925F910EC0E7888.jpg', '24', '8493', null);
INSERT INTO `product` VALUES ('37', '一套]男短袖t恤夏季韩版潮流休闲2018新款男士套装青少年男装衣服', '79.00', '138.00', '一套]男短袖t恤夏季韩版潮流休闲2018新款男士套装青少年男装衣服\r\n一套]男短袖t恤夏季韩版潮流休闲2018新款男士套装青少年男装衣服一套]男短袖t恤夏季韩版潮流休闲2018新款男士套装青少年男装衣服', '/A/5/46CBCAEBD63A4466BF5068EA6DC0E769.jpg', '25', '8523', null);
INSERT INTO `product` VALUES ('38', '特斯拉 Model S', '825800.00', '1000000.00', '特斯拉(Tesla)，是一家美国电动车及能源公司，产销电动车、太阳能板、及储能设备。 [1]  总部位于美国加利福尼亚州硅谷的帕罗奥多（Palo Alto） [2]  ，2003年最早由马丁·艾伯哈德（Martin Eberhard）和马克·塔彭宁（Marc Tarpenning）共同创立，2004年埃隆·马斯克（Elon Musk）进入公司并领导了A轮融资。 [3-5]  创始人将公司命名为“特斯拉汽车（Tesla Motors）”，以纪念物理学家尼古拉·特斯拉（Nikola Tesla）', '/2/B/1C94DCA2367D4060BBF75D74BA44B4D2.jpg', '26', '200', null);
INSERT INTO `product` VALUES ('39', '【整车定金】永达汽车 上海大众 桑塔纳浩纳', '500.00', '200000.00', '【整车定金】永达汽车 上海大众 桑塔纳浩纳\r\n【整车定金】永达汽车 上海大众 桑塔纳浩纳\r\n【整车定金】永达汽车 上海大众 桑塔纳浩纳', '/3/F/0890C91DBD6144CC80C0898F5992626F.jpg', '27', '500', null);
INSERT INTO `product` VALUES ('40', '宝马x3', '390000.00', '399900.00', '宝马X3独具个性，引入了新SUV运动型多功能车的概念，并且装备了宝马的专利xDrive智能全轮驱动系统。宝马X3将运动型多用途车特有的外形比例与经典和创新的设计融为一体，外形清新年轻，同时也强调了宝马品牌的设计特征，结实有力。目前，宝马X3为其所属系列下的最新车系。', '/F/8/AC3E799EAF1D487190BA504D32DB8F68.png', '28', '20', null);
INSERT INTO `product` VALUES ('41', '丰田凯美瑞', '200000.00', '210000.00', '改款后的凯美瑞除了换上一副更为年轻的脸孔外，还针对销售主力的2.0L车型作出动力上的更新。不难看出，凯美瑞是丰田开始向年轻转变的风向标，新款加了的D-4S双喷射系统的凯美瑞在动力方面有着一定的提升，对于最多人关注的2.0L入门级车型，竞争力方面确实有不小的提升，加上再次提高的燃油经济性，想要追求兼顾实用和动力的消费者，新凯美瑞 2.0L D-4S确实是一款非常值得考虑的车型', '/5/B/B01E9A532FF546748E77A0E44A0D45EA.jpg', '10', '30', null);
INSERT INTO `product` VALUES ('42', '玛莎拉蒂Levante SUV', '868800.00', '890000.00', '瞬间爆发，风驰电掣 \r\nLevante以风为名，宛如源自地中海的一股疾风，势不可挡，轻松征服各种路况。 \r\nLevante集奢华气质与冒险精神于一身，可提供无与伦比的舒适驾乘体验，即使面对最极端的恶劣环境，仍然保持卓越性能。无论空间布局或性能表现，皆无可挑剔。Levante所有车型均配备八速变速箱、玛莎拉蒂精密Q4智能四驱系统和扭矩控制系统，轻松实现酣畅淋漓的驾驭快感。 ', '/6/2/FCC5C4256AFB4EF4B9DCD7F2E71A7D99.jpg', '30', '5', null);
INSERT INTO `product` VALUES ('43', '温碧泉泉面膜补水保湿清洁收缩毛孔男女提亮肤色黑面膜贴正品学生 ', '79.00', '90.00', '温碧泉泉面膜补水保湿清洁收缩毛孔男女提亮肤色黑面膜贴正品学生 温碧泉泉面膜补水保湿清洁收缩毛孔男女提亮肤色黑面膜贴正品学生 温碧泉泉面膜补水保湿清洁收缩毛孔男女提亮肤色黑面膜贴正品学生 ', '/1/0/350F8BB0426C4D319BEF94D7B19BA5D1.jpg', '10', '5000', null);
INSERT INTO `product` VALUES ('44', '温碧泉洗面奶女男收缩毛孔学生补水保湿清洁泡沫洁面乳不紧绷正品', '29.90', '40.00', '温碧泉洗面奶女男收缩毛孔学生补水保湿清洁泡沫洁面乳不紧绷正品\r\n温碧泉洗面奶女男收缩毛孔学生补水保湿清洁泡沫洁面乳不紧绷正品\r\n温碧泉洗面奶女男收缩毛孔学生补水保湿清洁泡沫洁面乳不紧绷正品', '/B/3/F46A741F16024974997F15C07C994269.jpg', '32', '6000', null);
INSERT INTO `product` VALUES ('45', '资生堂防晒隔离蓝胖子 新艳阳夏水动力防护乳 范丞丞同款', '380.00', '400.00', '清爽隔离 高倍防晒 防水防汗 遇水加乘\r\n清爽隔离 高倍防晒 防水防汗 遇水加乘\r\n清爽隔离 高倍防晒 防水防汗 遇水加乘', '/6/F/F66A508E065B4C579E41EC63B159ED8F.jpg', '33', '6000', null);
INSERT INTO `product` VALUES ('46', 'ZEESEA滋色按压口红持久保湿不易脱色韩国防水正品珊瑚豆沙色学生 ', '49.90', '60.00', '上色饱满 持久滋润 不易脱色 \r\n上色饱满 持久滋润 不易脱色 \r\n上色饱满 持久滋润 不易脱色 ', '/B/5/A7C02F0BC83C47A88C54F0CFCE17D011.jpg', '34', '5000', null);
INSERT INTO `product` VALUES ('47', '欧莱雅男士洗面奶水能保湿补水控油护理爽肤水洗护化妆护肤品套装', '179.00', '200.00', '保湿补水 深层控油 \r\n保湿补水 深层控油 \r\n保湿补水 深层控油 ', '/6/4/7BC63F6AA9064699A3F6CCE0E6D22BB1.jpg', '35', '6000', null);
INSERT INTO `product` VALUES ('48', '法颂男士香水持久淡香清新古龙水50ml男人味香体香氛喷雾学生自然', '69.00', '80.00', '正品小样 精美礼品袋 代写贺卡\r\n正品小样 精美礼品袋 代写贺卡\r\n正品小样 精美礼品袋 代写贺卡', '/7/A/DEF40A9A9369421E8E68BFE83411C4CA.jpg', '36', '500', null);
INSERT INTO `product` VALUES ('49', '佳能mg2580s彩色喷墨打印机家用小型复印件扫描一体机家庭学生多功能电脑打字a4照片相片办公黑白三合一 ', '298.00', '400.00', '彩色打印复印扫描 操作简单成本省\r\n彩色打印复印扫描 操作简单成本省\r\n彩色打印复印扫描 操作简单成本省', '/0/9/6275450D360B40658F466064608BDE56.jpg', '37', '20', null);
INSERT INTO `product` VALUES ('50', '包邮得力夹子文具长尾夹燕尾夹 文件夹子票夹办公用品金属小夹子铁夹子固定铁夹子强力不锈钢夹 ', '9.00', '10.00', '多支装 炫彩色 多规格 夹力强劲 可夹多页\r\n多支装 炫彩色 多规格 夹力强劲 可夹多页\r\n多支装 炫彩色 多规格 夹力强劲 可夹多页', '/E/3/8D2FED5AA06841BFB6235E8D548E948A.jpg', '38', '10000', null);
INSERT INTO `product` VALUES ('51', '电脑椅家用办公椅弓形椅子会议椅麻将椅皮椅职员椅棋牌室椅学生椅 ', '108.00', '120.00', '极简舒适主义，您的艺术、家、办公\r\n极简舒适主义，您的艺术、家、办公\r\n极简舒适主义，您的艺术、家、办公', '/F/8/1E58E70147F04A27A59D93F6349BE93F.jpg', '39', '6000', null);
INSERT INTO `product` VALUES ('52', '电脑台式桌家用简易写字书桌学生学习桌办公桌桌子简约宜家经济型 ', '80.00', '100.00', '电脑台式桌家用简易写字书桌学生学习桌办公桌桌子简约宜家经济型 \r\n电脑台式桌家用简易写字书桌学生学习桌办公桌桌子简约宜家经济型 \r\n电脑台式桌家用简易写字书桌学生学习桌办公桌桌子简约宜家经济型 ', '/0/9/64CE023DAC8D4E8691F76D091F61391D.jpg', '40', '500', null);
INSERT INTO `product` VALUES ('53', '包邮得力计算器语音计算机财务用语音型大按键大屏幕 学生用考试大学办公用品 大号计算器多功能可弹奏音乐', '22.90', '30.00', '包邮送7号电池 大按键 真人发音 结实耐用款 \r\n包邮送7号电池 大按键 真人发音 结实耐用款 \r\n包邮送7号电池 大按键 真人发音 结实耐用款 ', '/4/3/1B43AD29E1884DB8AF8A0DC4E2BDF3B4.jpg', '41', '6000', null);
INSERT INTO `product` VALUES ('54', '抚顺琥珀血珀绿毛变化多彩变色龙 ', '200000.00', '200000.00', '天然抚顺顶级血珀绿毛，纯净水，收藏级别\r\n天然抚顺顶级血珀绿毛，纯净水，收藏级别\r\n天然抚顺顶级血珀绿毛，纯净水，收藏级别', '/7/1/089717F031EC4EC6BB19C2EAF9F08123.jpg', '42', '1', null);
INSERT INTO `product` VALUES ('55', '满绿冰种翡翠手镯圆条半阳绿缅甸天然老坑a货帝王绿翡翠玉镯女款 ', '1099.00', '1200.00', '满绿冰种翡翠手镯圆条半阳绿缅甸天然老坑a货帝王绿翡翠玉镯女款 \r\n满绿冰种翡翠手镯圆条半阳绿缅甸天然老坑a货帝王绿翡翠玉镯女款 \r\n满绿冰种翡翠手镯圆条半阳绿缅甸天然老坑a货帝王绿翡翠玉镯女款 ', '/F/1/162557435DEF40E387CFAA3340ADB2C8.jpg', '43', '20', null);
INSERT INTO `product` VALUES ('56', 'iicc专柜正品钻戒女50分结婚钻石戒指一克拉效果新款求婚订婚戒指', '10000.00', '20000.00', '爱闪耀30分G色以上带GIA证书 显钻大\r\n爱闪耀30分G色以上带GIA证书 显钻大\r\n爱闪耀30分G色以上带GIA证书 显钻大', '/3/0/87E0535D6DB14F9CA66AC6815ADC0B0C.jpg', '44', '5', null);
INSERT INTO `product` VALUES ('57', '周生生Pt950Promessa结婚白金戒指铂金戒指对戒 33577R计价 ', '1500.00', '1700.00', '始于1934，周而复始 生生不息\r\n始于1934，周而复始 生生不息\r\n始于1934，周而复始 生生不息', '/C/A/E4D5408CCBB649CE88F376E325614C43.jpg', '45', '5', null);
INSERT INTO `product` VALUES ('58', '周生生黄金足金精工款戒指结婚送礼自用戒指对戒78208R计价', '1300.00', '1500.00', '意式黄金风格车花设计，订制范围6-26\r\n意式黄金风格车花设计，订制范围6-26\r\n意式黄金风格车花设计，订制范围6-26', '/0/7/BFBF711002E445939696BEEF99139DBD.jpg', '46', '20', null);
INSERT INTO `product` VALUES ('59', '欧美新款BERTA风格优雅复古深V性感钉珠露背直垂开叉小拖尾礼服 ', '2000.00', '2000.00', '欧美新款BERTA风格优雅复古深V性感钉珠露背直垂开叉小拖尾礼服 \r\n欧美新款BERTA风格优雅复古深V性感钉珠露背直垂开叉小拖尾礼服 \r\n欧美新款BERTA风格优雅复古深V性感钉珠露背直垂开叉小拖尾礼服 ', '/8/8/0E1D6283914944DDAAAE72871EFD31B5.jpg', '47', '5', null);

-- ----------------------------
-- Table structure for producttype
-- ----------------------------
DROP TABLE IF EXISTS `producttype`;
CREATE TABLE `producttype` (
  `typeid` int(5) NOT NULL AUTO_INCREMENT,
  `typename` varchar(10) DEFAULT NULL,
  `selection` int(5) DEFAULT NULL,
  PRIMARY KEY (`typeid`),
  KEY `first_second` (`selection`),
  CONSTRAINT `first_second` FOREIGN KEY (`selection`) REFERENCES `producttype` (`typeid`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of producttype
-- ----------------------------
INSERT INTO `producttype` VALUES ('2', '食品', null);
INSERT INTO `producttype` VALUES ('3', '数码', null);
INSERT INTO `producttype` VALUES ('4', '服饰', null);
INSERT INTO `producttype` VALUES ('6', '汽车', null);
INSERT INTO `producttype` VALUES ('7', '美妆', null);
INSERT INTO `producttype` VALUES ('8', '办公', null);
INSERT INTO `producttype` VALUES ('9', '珠宝', null);
INSERT INTO `producttype` VALUES ('10', '糕点', '2');
INSERT INTO `producttype` VALUES ('11', '零食', '2');
INSERT INTO `producttype` VALUES ('12', '各地名吃', '2');
INSERT INTO `producttype` VALUES ('13', '水果蔬菜', '2');
INSERT INTO `producttype` VALUES ('14', '糖果巧克力', '2');
INSERT INTO `producttype` VALUES ('16', '电脑笔记本', '3');
INSERT INTO `producttype` VALUES ('17', '手机', '3');
INSERT INTO `producttype` VALUES ('18', '电视', '3');
INSERT INTO `producttype` VALUES ('19', '数码相机', '3');
INSERT INTO `producttype` VALUES ('20', 'NIKE', '4');
INSERT INTO `producttype` VALUES ('21', 'Adidas', '4');
INSERT INTO `producttype` VALUES ('22', '李宁', '4');
INSERT INTO `producttype` VALUES ('23', '夏装', '4');
INSERT INTO `producttype` VALUES ('24', '女装', '4');
INSERT INTO `producttype` VALUES ('25', '男装', '4');
INSERT INTO `producttype` VALUES ('26', '新能源车', '6');
INSERT INTO `producttype` VALUES ('27', '大众', '6');
INSERT INTO `producttype` VALUES ('28', '宝马', '6');
INSERT INTO `producttype` VALUES ('29', '丰田', '6');
INSERT INTO `producttype` VALUES ('30', '玛莎拉蒂', '6');
INSERT INTO `producttype` VALUES ('31', '面膜', '7');
INSERT INTO `producttype` VALUES ('32', '洁面', '7');
INSERT INTO `producttype` VALUES ('33', '防晒', '7');
INSERT INTO `producttype` VALUES ('34', '口红', '7');
INSERT INTO `producttype` VALUES ('35', '男士护肤', '7');
INSERT INTO `producttype` VALUES ('36', '香水', '8');
INSERT INTO `producttype` VALUES ('37', '打印机', '8');
INSERT INTO `producttype` VALUES ('38', '文具', '8');
INSERT INTO `producttype` VALUES ('39', '办公椅', '8');
INSERT INTO `producttype` VALUES ('40', '电脑桌', '8');
INSERT INTO `producttype` VALUES ('41', '计算器', '8');
INSERT INTO `producttype` VALUES ('42', '琥珀蜜蜡', '9');
INSERT INTO `producttype` VALUES ('43', '翡翠手镯', '9');
INSERT INTO `producttype` VALUES ('44', '钻戒', '9');
INSERT INTO `producttype` VALUES ('45', '铂金', '9');
INSERT INTO `producttype` VALUES ('46', '黄金首饰', '9');
INSERT INTO `producttype` VALUES ('47', '高端定制', '9');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `truename` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `userstatus` int(1) DEFAULT NULL,
  `activationcode` varchar(20) DEFAULT NULL,
  `userpicurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('7', 'wangxiaoming', '123456789', '王小明', 'xiaoming@163.com', '马达加斯加', '15236489562', null, null, '/F/7/F4002317FA134B579C16774E42319C2F.jpg');
INSERT INTO `user` VALUES ('9', 'jiaoxingbo', '123456789', null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('10', 'zhaotiezhu', '123456789', null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('11', 'zhaotiezhu123', '123456789', null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('12', 'wangxiaoming1', '123456789', null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('13', 'wangxiaoming2', '123456789', '王小明2', 'xiaoming2@163.com', '马达加斯加', '123456789534', null, null, '/2/8/C70BE427317A42BDADB18BFB963E8AA3.jpg');
INSERT INTO `user` VALUES ('14', 'wangxiaoming3', '123456789', '王小明3', 'xiaoming@163.com', '马达加斯加', '15236489562', null, null, '/5/3/6D56BF27C728415990DBABF4768C50EE.jpg');
INSERT INTO `user` VALUES ('15', 'wangxiaoming4', '123456789', '王小明4', 'xiaoming@163.com', '马达加斯加', '15236489562', null, null, '/2/1/892B4420EBBA4F9EA85D3BF26ED9EB48.jpg');
INSERT INTO `user` VALUES ('16', 'wangxiaoming5', '123456789', '王小明', '123@qq.com', '马达加斯加', '15236489562', null, null, '/A/4/D687E2BAD8FF467EBFA123AB3F738772.jpg');
INSERT INTO `user` VALUES ('17', 'wangxiaoming6', '123456789', '王小明', 'xiaoming@163.com', '马达加斯加', '18255554684', null, null, '/6/4/43DC2752E3564AEEA2DE6F6793033695.jpg');
INSERT INTO `user` VALUES ('18', 'wangxiaoming7', '123456789', '王小明', '123@qq.com', '马尔代夫', '18245678945', null, null, '/B/6/B03BE5DBE6074A6C86175D8E1917A299.jpg');
