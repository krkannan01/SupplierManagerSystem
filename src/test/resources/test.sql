/*
Navicat MySQL Data Transfer

Source Server         : remote
Source Server Version : 50553
Source Host           : 120.77.155.173:3306
Source Database       : supplier_manager

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-07-25 09:48:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for table_contact
-- ----------------------------
DROP TABLE IF EXISTS `table_contact`;
CREATE TABLE `table_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name_master` varchar(20) NOT NULL COMMENT '主要联系人姓名',
  `name_slave` varchar(20) DEFAULT NULL COMMENT '次要联系人名称',
  `phone_number_master` varchar(50) DEFAULT NULL COMMENT '主要联系方式',
  `phone_number_slave` varchar(50) DEFAULT NULL COMMENT '次要联系方式',
  `comment` varchar(225) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=359 DEFAULT CHARSET=utf8 COMMENT='预留字段表';

-- ----------------------------
-- Records of table_contact
-- ----------------------------
INSERT INTO `table_contact` VALUES ('71', '周荣', null, '86-755', '82779090', '2');
INSERT INTO `table_contact` VALUES ('72', '李梦业', null, '0757-85862160', '18029360349', null);
INSERT INTO `table_contact` VALUES ('73', 'Charles Cheung', null, '86-755 89582566', '13975137373', null);
INSERT INTO `table_contact` VALUES ('74', '无', null, '0755-2778 3333', null, null);
INSERT INTO `table_contact` VALUES ('75', '鲍晓祎', null, '86', '15821983101', null);
INSERT INTO `table_contact` VALUES ('76', '刘泉香', null, '（86-755）33265559', '18675587580', null);
INSERT INTO `table_contact` VALUES ('77', '无', null, '020-85521717', '020-85521717-6666', null);
INSERT INTO `table_contact` VALUES ('78', '无', null, '020-82264825/26/27', null, null);
INSERT INTO `table_contact` VALUES ('79', '无', null, '0571－88390905', null, null);
INSERT INTO `table_contact` VALUES ('80', '无', null, '0571-28933188', '0571-28932955', null);
INSERT INTO `table_contact` VALUES ('81', '无', null, '0755-86135700', null, null);
INSERT INTO `table_contact` VALUES ('82', '卢少君', null, '0755-27678309', '13414478655', null);
INSERT INTO `table_contact` VALUES ('83', '谢海明', null, '010-82873698', '18501033492', null);
INSERT INTO `table_contact` VALUES ('84', '秦丹', null, '010-53563888', '13975191916', null);
INSERT INTO `table_contact` VALUES ('85', '赵满意', null, '0755-86026500', '13760404371', null);
INSERT INTO `table_contact` VALUES ('86', '李翠平', null, '86-755 84657541', '13922458391', null);
INSERT INTO `table_contact` VALUES ('87', '无', null, '0086-0755', '81781220', null);
INSERT INTO `table_contact` VALUES ('88', '无', null, '0086-531-68621533', null, null);
INSERT INTO `table_contact` VALUES ('89', '无', null, '0731-88738508', null, null);
INSERT INTO `table_contact` VALUES ('90', '无', null, ' 86-0755-83825909', null, null);
INSERT INTO `table_contact` VALUES ('91', '无', null, '010-62950616', null, null);
INSERT INTO `table_contact` VALUES ('92', '余先生', null, '18156508218', '13871557633', null);
INSERT INTO `table_contact` VALUES ('93', '无', null, '18718863421', '0755-3328382', null);
INSERT INTO `table_contact` VALUES ('94', '张冬', null, '13714560779', null, null);
INSERT INTO `table_contact` VALUES ('95', '无', null, '400 088 9280', '0571-28183999', null);
INSERT INTO `table_contact` VALUES ('96', '无', null, '022-58596000', null, null);
INSERT INTO `table_contact` VALUES ('235', '无', null, '4006-151500', '', null);
INSERT INTO `table_contact` VALUES ('236', '无', null, ' 010-82255855', '0731-89923171（长沙）', null);
INSERT INTO `table_contact` VALUES ('237', '无', null, '0591-28067333', '', null);
INSERT INTO `table_contact` VALUES ('238', '孙先生', null, '15888829019', '', null);
INSERT INTO `table_contact` VALUES ('239', '无', null, '15395829390', '23271188-6989', null);
INSERT INTO `table_contact` VALUES ('240', '无', null, '13775027446', '0519-86699912', null);
INSERT INTO `table_contact` VALUES ('241', '无', null, '010-82356641', '', null);
INSERT INTO `table_contact` VALUES ('242', '无', null, '4006-770-370', '0902-2564777', null);
INSERT INTO `table_contact` VALUES ('243', '无', null, '86-0755-28746736', '', null);
INSERT INTO `table_contact` VALUES ('244', '无', null, '0755-83866900', '', null);
INSERT INTO `table_contact` VALUES ('245', '无', null, '', '', null);
INSERT INTO `table_contact` VALUES ('246', '总裁办', null, '0571-28933188', '', null);
INSERT INTO `table_contact` VALUES ('247', '王晴晴', null, '13430703661', '0755-26607661', null);
INSERT INTO `table_contact` VALUES ('248', '无', null, '0731-84688501', '', null);
INSERT INTO `table_contact` VALUES ('249', '叶海钢', null, '0731-84434822', '18022382225', null);
INSERT INTO `table_contact` VALUES ('250', '无', null, '0731-89879178', '', null);
INSERT INTO `table_contact` VALUES ('251', '无', null, '0810-52281111', '0810-52281188', null);
INSERT INTO `table_contact` VALUES ('252', '无', null, '86-010-82861238', '', null);
INSERT INTO `table_contact` VALUES ('253', '无', null, '010-50961630', '', null);
INSERT INTO `table_contact` VALUES ('254', '无', null, '4009005986', '', null);
INSERT INTO `table_contact` VALUES ('255', '余先生', null, '137-2865-8003', '0755-83489801', null);
INSERT INTO `table_contact` VALUES ('256', '无', null, '0755-83112288', '400-700-5305', null);
INSERT INTO `table_contact` VALUES ('257', '无', null, '0591-88625060', '', null);
INSERT INTO `table_contact` VALUES ('258', '无', null, '0755-33022955', '', null);
INSERT INTO `table_contact` VALUES ('259', '无', null, '0576-3369555', '', null);
INSERT INTO `table_contact` VALUES ('260', '无', null, '021-51087009', '', null);
INSERT INTO `table_contact` VALUES ('261', '无', null, '0755-86027195', '', null);
INSERT INTO `table_contact` VALUES ('262', '无', null, '400-830-7655', '0755-86320666 ', null);
INSERT INTO `table_contact` VALUES ('263', '无', null, '0595-23868080', '', null);
INSERT INTO `table_contact` VALUES ('264', '无', null, '400-098-9498 转 3', '', null);
INSERT INTO `table_contact` VALUES ('265', '刘小姐', null, '18138281793', '0755-86368966', null);
INSERT INTO `table_contact` VALUES ('266', '无', null, '029-88151276', '18066635383', null);
INSERT INTO `table_contact` VALUES ('267', '王军', null, '0755-83210222', '18666202157', null);
INSERT INTO `table_contact` VALUES ('268', '张小琴', null, '0755-28542309', '13537725040', null);
INSERT INTO `table_contact` VALUES ('269', '无', null, '0769-86954033', '0769-86954089', null);
INSERT INTO `table_contact` VALUES ('270', '王振中', null, '010-83706297', '13331002622', null);
INSERT INTO `table_contact` VALUES ('271', '无', null, '0769-89775680', '13692164424', null);
INSERT INTO `table_contact` VALUES ('272', '无', null, '400-887-1897', '', null);
INSERT INTO `table_contact` VALUES ('273', '无', null, '0755-88305790', '', null);
INSERT INTO `table_contact` VALUES ('274', '无', null, '4006800310', '', null);
INSERT INTO `table_contact` VALUES ('275', '无', null, '0755-8287 3366', '400-666-2428（统一服务）', null);
INSERT INTO `table_contact` VALUES ('276', '无', null, '0591-38106666', '', null);
INSERT INTO `table_contact` VALUES ('277', '无', null, '0731-8222 1257(湖南办事处）', '', null);
INSERT INTO `table_contact` VALUES ('278', '无', null, '0592-5768680', '', null);
INSERT INTO `table_contact` VALUES ('279', '无', null, '0755-27981999', '', null);
INSERT INTO `table_contact` VALUES ('280', '黄瑞清', null, '0755-86096906', '', null);
INSERT INTO `table_contact` VALUES ('281', '黄小姐', null, '0755-88353190-106', '', null);
INSERT INTO `table_contact` VALUES ('282', '魏先生', null, '131 2898 3709', '0755-3310091', null);
INSERT INTO `table_contact` VALUES ('283', '无', null, '0755-86020987', '', null);
INSERT INTO `table_contact` VALUES ('284', '无', null, '网页可在线咨询', '', null);
INSERT INTO `table_contact` VALUES ('285', '段先生', null, '13612834260', '0755-23322809', null);
INSERT INTO `table_contact` VALUES ('286', '张海平', null, '26419190', '13530371926', null);
INSERT INTO `table_contact` VALUES ('287', '何伟平', null, '18719049142', '', null);
INSERT INTO `table_contact` VALUES ('288', '张女士', null, '755-21658316', '', null);
INSERT INTO `table_contact` VALUES ('289', '无', null, '28471626', '17097334565', null);
INSERT INTO `table_contact` VALUES ('290', '无', null, '在线联系', '', null);
INSERT INTO `table_contact` VALUES ('291', '无', null, '在线咨询', '', null);
INSERT INTO `table_contact` VALUES ('292', '无', null, '0755-83112288', '400-700-5305', null);
INSERT INTO `table_contact` VALUES ('293', '区佳琪', null, '13926108592', '020-83965551', null);
INSERT INTO `table_contact` VALUES ('294', '罗时江', null, '13397390688', '', null);
INSERT INTO `table_contact` VALUES ('295', '周德香', null, '18273137253', '', null);
INSERT INTO `table_contact` VALUES ('296', '郑攀', null, '15084755929', '', null);
INSERT INTO `table_contact` VALUES ('297', '龚晓春', null, '0731-85982270', '', null);
INSERT INTO `table_contact` VALUES ('298', '罗国华', null, '010-888506066', '18611811289', null);
INSERT INTO `table_contact` VALUES ('299', '无', null, '024-83993353', '13889297066', null);
INSERT INTO `table_contact` VALUES ('300', 'May Chan', null, '86-755 26014710', '13713907039', null);
INSERT INTO `table_contact` VALUES ('301', '张燕山', null, '0755-23358769', '15818506377', null);
INSERT INTO `table_contact` VALUES ('302', '无', null, '400 820 6015', '', null);
INSERT INTO `table_contact` VALUES ('303', '唐勃', null, '0755-83559869', '18098929256', null);
INSERT INTO `table_contact` VALUES ('304', '无', null, '0531-82373516', '', null);
INSERT INTO `table_contact` VALUES ('305', '', null, '', '', null);
INSERT INTO `table_contact` VALUES ('306', '', null, '', '', null);
INSERT INTO `table_contact` VALUES ('307', '', null, '', '', null);
INSERT INTO `table_contact` VALUES ('308', '', null, '', '', null);
INSERT INTO `table_contact` VALUES ('309', '', null, '', '', null);
INSERT INTO `table_contact` VALUES ('310', '', null, '', '', null);
INSERT INTO `table_contact` VALUES ('311', '', null, '', '', null);
INSERT INTO `table_contact` VALUES ('312', '', null, '', '', null);
INSERT INTO `table_contact` VALUES ('313', '', null, '', '', null);
INSERT INTO `table_contact` VALUES ('314', '', null, '', '', null);
INSERT INTO `table_contact` VALUES ('315', '', null, '', '', null);
INSERT INTO `table_contact` VALUES ('316', '', null, '', '', null);
INSERT INTO `table_contact` VALUES ('317', '', null, '', '', null);
INSERT INTO `table_contact` VALUES ('318', '', null, '', '', null);
INSERT INTO `table_contact` VALUES ('319', '', null, '', '', null);
INSERT INTO `table_contact` VALUES ('320', '', null, '', '', null);
INSERT INTO `table_contact` VALUES ('321', '', null, '', '', null);
INSERT INTO `table_contact` VALUES ('322', '', null, '', '', null);
INSERT INTO `table_contact` VALUES ('323', '许万霞', null, '0731-84728967', '0731-88885966', null);
INSERT INTO `table_contact` VALUES ('324', '陈若茵', null, '18680551196', '黄升起18664608860', null);
INSERT INTO `table_contact` VALUES ('325', '何承恩', null, '0735-8885500', '', null);
INSERT INTO `table_contact` VALUES ('326', '罗伟文', null, '18874229366', '0731-85464744', null);
INSERT INTO `table_contact` VALUES ('327', '何承恩', null, '0735-8885500', '', null);
INSERT INTO `table_contact` VALUES ('328', '周哲', null, '0731-88915780-821', '13874890252', null);
INSERT INTO `table_contact` VALUES ('329', '无', null, '0551-65898272', '', null);
INSERT INTO `table_contact` VALUES ('330', '无', null, '400-612-0119 ', '', null);
INSERT INTO `table_contact` VALUES ('331', '无', null, '0755-86226969', '', null);
INSERT INTO `table_contact` VALUES ('332', '林经理', null, '0512-62735888 ', '', null);
INSERT INTO `table_contact` VALUES ('333', '无', null, '', '', null);
INSERT INTO `table_contact` VALUES ('334', '熊惠波', null, '13755084074', '0731-88081658', null);
INSERT INTO `table_contact` VALUES ('335', '邵丰', null, '18229711045', '0731-84427712', null);
INSERT INTO `table_contact` VALUES ('336', '封锦文', null, '13308406158', '', null);
INSERT INTO `table_contact` VALUES ('337', '陈余芬', null, '13237354875', '0735-2187666', null);
INSERT INTO `table_contact` VALUES ('338', '帅兴隆', null, '18670787502', '', null);
INSERT INTO `table_contact` VALUES ('339', '无', null, '0755-29619900', null, null);
INSERT INTO `table_contact` VALUES ('340', '123', null, null, null, null);
INSERT INTO `table_contact` VALUES ('341', '1', null, null, null, null);
INSERT INTO `table_contact` VALUES ('342', '2', null, null, null, null);
INSERT INTO `table_contact` VALUES ('343', '马超', null, '13082053605', null, null);
INSERT INTO `table_contact` VALUES ('344', '无', null, '020-36470001', null, null);
INSERT INTO `table_contact` VALUES ('345', '无', null, '020-85521717', '020-85538988', null);
INSERT INTO `table_contact` VALUES ('346', '黄自贵', null, '13786144155', '0731-85454840', null);
INSERT INTO `table_contact` VALUES ('347', '张小龙（海康技师）', null, '18969181989', '0571-88075998（总公司）', null);
INSERT INTO `table_contact` VALUES ('348', '姜先生', null, '0592-5939517', null, null);
INSERT INTO `table_contact` VALUES ('349', '无', null, '020-82083888', null, null);
INSERT INTO `table_contact` VALUES ('350', '无', null, '0755-89602344（总部）', null, null);
INSERT INTO `table_contact` VALUES ('351', '无', null, '13397517390', null, null);
INSERT INTO `table_contact` VALUES ('352', '潘燕玉', null, '020-38770018', '18102255687', null);
INSERT INTO `table_contact` VALUES ('353', '无', null, '400-820-8980', null, null);
INSERT INTO `table_contact` VALUES ('354', '许万霞', null, '15874007685', null, null);
INSERT INTO `table_contact` VALUES ('355', '公司总机', null, '0512-81600811', null, null);
INSERT INTO `table_contact` VALUES ('356', '公司总机', null, '0769-81788290', null, null);
INSERT INTO `table_contact` VALUES ('357', '周凯伦 	', null, '189 6874 7960', '86-0577-88609861', '公司总机');
INSERT INTO `table_contact` VALUES ('358', '公司总机', null, '0592-6530699-805', null, null);

-- ----------------------------
-- Table structure for table_cooperation
-- ----------------------------
DROP TABLE IF EXISTS `table_cooperation`;
CREATE TABLE `table_cooperation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `project_name` varchar(255) DEFAULT NULL COMMENT '合作项目名称',
  `product_name` varchar(100) DEFAULT NULL COMMENT '产品名称',
  `contact_id` int(11) DEFAULT NULL COMMENT '项目联系人',
  `supplier_id` int(5) NOT NULL COMMENT '供应商ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='合作情况表';

-- ----------------------------
-- Records of table_cooperation
-- ----------------------------
INSERT INTO `table_cooperation` VALUES ('1', '指挥中心——会议系统设备', null, null, '242');
INSERT INTO `table_cooperation` VALUES ('2', '邵阳县视频会商系统采购', null, null, '243');
INSERT INTO `table_cooperation` VALUES ('3', '邵阳县交警大队 / 智慧政务一期', null, null, '244');
INSERT INTO `table_cooperation` VALUES ('4', '智慧政务一期', null, null, '245');
INSERT INTO `table_cooperation` VALUES ('5', '智慧政务一期', null, null, '246');
INSERT INTO `table_cooperation` VALUES ('6', '育英学校大礼堂舞台设备一批采购项目', null, null, '308');
INSERT INTO `table_cooperation` VALUES ('7', '育英学校大礼堂舞台设备一批采购项目', null, null, '311');
INSERT INTO `table_cooperation` VALUES ('8', '邵阳县交警大队指挥中心', null, null, '312');
INSERT INTO `table_cooperation` VALUES ('9', '智慧政务一期', null, null, '287');
INSERT INTO `table_cooperation` VALUES ('10', '智慧政务一期', null, null, '286');
INSERT INTO `table_cooperation` VALUES ('11', '智慧政务一期', null, null, '285');
INSERT INTO `table_cooperation` VALUES ('12', '智慧政务一期', null, null, '284');
INSERT INTO `table_cooperation` VALUES ('14', '智慧政务一期', null, null, '276');
INSERT INTO `table_cooperation` VALUES ('15', '智慧政务一期', null, null, '275');
INSERT INTO `table_cooperation` VALUES ('16', '智慧政务一期', null, null, '274');
INSERT INTO `table_cooperation` VALUES ('17', '育英学校大礼堂舞台设备一批采购项目', '音响、灯光', '354', '272');

-- ----------------------------
-- Table structure for table_document_type
-- ----------------------------
DROP TABLE IF EXISTS `table_document_type`;
CREATE TABLE `table_document_type` (
  `id` int(10) NOT NULL COMMENT 'ID',
  `name` varchar(40) NOT NULL COMMENT '类型名称',
  `description` varchar(225) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文档类型表';

-- ----------------------------
-- Records of table_document_type
-- ----------------------------
INSERT INTO `table_document_type` VALUES ('0', '组织机构代码/统一信用代码', '');
INSERT INTO `table_document_type` VALUES ('1', '税务登记证', '');
INSERT INTO `table_document_type` VALUES ('2', '营业执照', '');
INSERT INTO `table_document_type` VALUES ('3', '资质证书', '');
INSERT INTO `table_document_type` VALUES ('4', '安全生产许可证', '');
INSERT INTO `table_document_type` VALUES ('5', '质量管理体系认证', '');
INSERT INTO `table_document_type` VALUES ('6', '职业健康安全管理体系认证', '');
INSERT INTO `table_document_type` VALUES ('7', '环境管理体系认证', '');
INSERT INTO `table_document_type` VALUES ('8', '法人委托书', '');
INSERT INTO `table_document_type` VALUES ('9', '其他证书', '');

-- ----------------------------
-- Table structure for table_privilege
-- ----------------------------
DROP TABLE IF EXISTS `table_privilege`;
CREATE TABLE `table_privilege` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(20) NOT NULL COMMENT '权限名称',
  `url` varchar(30) DEFAULT NULL COMMENT '权限URL',
  `parent_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_privilege
-- ----------------------------
INSERT INTO `table_privilege` VALUES ('1', '查询供应商信息', 'searchSupplier', '9');
INSERT INTO `table_privilege` VALUES ('2', '添加供应商信息', 'insertSupplier', '9');
INSERT INTO `table_privilege` VALUES ('3', '修改供应商信息', 'updateSupplier', '9');
INSERT INTO `table_privilege` VALUES ('4', '删除供应商信息', 'deleteSupplier', '9');
INSERT INTO `table_privilege` VALUES ('5', '查询供应商分组信息', 'searchTradeGroup', '10');
INSERT INTO `table_privilege` VALUES ('6', '添加供应商分组信息', 'insertTradeGroup', '10');
INSERT INTO `table_privilege` VALUES ('7', '修改供应商分组信息', 'updateTradeGroup', '10');
INSERT INTO `table_privilege` VALUES ('8', '删除供应商分组信息', 'deleteTradeGroup', '10');
INSERT INTO `table_privilege` VALUES ('9', '供应商管理', null, null);
INSERT INTO `table_privilege` VALUES ('10', '供应商分组管理', null, null);
INSERT INTO `table_privilege` VALUES ('11', '用户管理', null, null);
INSERT INTO `table_privilege` VALUES ('12', '查询用户信息', 'searchUser', '11');
INSERT INTO `table_privilege` VALUES ('13', '添加用户信息', 'insertUser', '11');
INSERT INTO `table_privilege` VALUES ('14', '修改用户信息', 'updateUser', '11');
INSERT INTO `table_privilege` VALUES ('15', '删除用户信息', 'deleteUser', '11');
INSERT INTO `table_privilege` VALUES ('16', '材料管理', null, null);
INSERT INTO `table_privilege` VALUES ('17', '材料分组管理', null, null);
INSERT INTO `table_privilege` VALUES ('18', '查询材料信息', 'searchProduct', '16');
INSERT INTO `table_privilege` VALUES ('19', '添加材料信息', 'insertProduct', '16');
INSERT INTO `table_privilege` VALUES ('20', '修改材料信息', 'updateProduct', '16');
INSERT INTO `table_privilege` VALUES ('21', '删除材料信息', 'deleteProduct', '16');
INSERT INTO `table_privilege` VALUES ('22', '查询材料分组信息', 'searchProductGroup', '17');
INSERT INTO `table_privilege` VALUES ('23', '添加材料分组信息', 'insertProductGroup', '17');
INSERT INTO `table_privilege` VALUES ('24', '修改材料分组信息', 'updateProductGroup', '17');
INSERT INTO `table_privilege` VALUES ('25', '删除材料分组信息', 'deleteProductGroup', '17');

-- ----------------------------
-- Table structure for table_product
-- ----------------------------
DROP TABLE IF EXISTS `table_product`;
CREATE TABLE `table_product` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(20) NOT NULL COMMENT '产品名称',
  `brand_id` int(10) DEFAULT NULL COMMENT '品牌',
  `size` varchar(20) DEFAULT NULL COMMENT '规格型号',
  `technical_param` varchar(500) DEFAULT NULL COMMENT '技术参数',
  `unit` varchar(10) NOT NULL COMMENT '单位',
  `unitprice` decimal(7,2) NOT NULL COMMENT '单位价格',
  `comment` varchar(255) DEFAULT NULL COMMENT '备注',
  `group_id` int(5) NOT NULL COMMENT '材料分组ID',
  `supplier_id` int(5) NOT NULL COMMENT '供应商ID',
  `no` varchar(10) NOT NULL COMMENT '产品编号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uqe_no` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='材料信息表';

-- ----------------------------
-- Records of table_product
-- ----------------------------
INSERT INTO `table_product` VALUES ('1', '双门网络门禁控制器', '9', 'WG2002.net-c16', '双门双向控制,32位CPU,2万张卡管理权限,10万条脱机存储记录,TCP/IP局域网广域网联网控制', '台', '483.00', null, '19', '23', '2018000001');
INSERT INTO `table_product` VALUES ('2', '出门按钮 16A', '9', 'K001', '86mm*86mm，耐压250VDC，16A 出门按钮', '套', '112.00', null, '19', '23', '2018000002');
INSERT INTO `table_product` VALUES ('3', '读卡器', '9', 'WGACCESS1061', '86#标准，同时兼容ID和IC卡，国际标准wiegand 26bits-Unbuff 键盘格式输出(兼容Motorola Indala501 ，HID5355K，Star101A读卡器格式），传输距离可达100米，感应距离4-10CM，带声光控制，防错接保护，抗干扰，抗衰减设计，尺寸规格：113mm*75mm*16mm', '台', '1500.00', null, '19', '23', '2018000003');
INSERT INTO `table_product` VALUES ('4', '磁力锁（含门磁反馈）', '10', 'HC400GF', '开门方式，断电开门单门磁力锁，280公斤力，带门磁反馈信号，开门方式为断电开锁', '台', '922.00', null, '19', '23', '2018000004');
INSERT INTO `table_product` VALUES ('5', '发卡机', '9', 'WG1028', '1231v3，1*8GB', '套', '540.00', null, '19', '23', '2018000005');
INSERT INTO `table_product` VALUES ('6', '门禁管理平台服务器', '8', '1231v3，1*8GB', '', '套', '3518.00', null, '19', '23', '2018000006');
INSERT INTO `table_product` VALUES ('7', '门禁管理软件', '9', 'WG2000', '中文界面 可分区管理', '套', '2503.00', null, '19', '23', '2018000007');
INSERT INTO `table_product` VALUES ('8', '管理工作站', '8', '19.5英寸', '19.5英寸', '套', '3518.00', null, '19', '23', '2018000008');
INSERT INTO `table_product` VALUES ('9', '门禁控制箱', '9', 'DY12', '用于门禁后端控制设备，开关电源放置', '台', '191.00', null, '19', '23', '2018000009');

-- ----------------------------
-- Table structure for table_product_brand
-- ----------------------------
DROP TABLE IF EXISTS `table_product_brand`;
CREATE TABLE `table_product_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) NOT NULL COMMENT '品牌名称',
  `group_id` varchar(100) NOT NULL COMMENT '所属分组',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_product_brand
-- ----------------------------
INSERT INTO `table_product_brand` VALUES ('1', '华为', '9,12,13,14,15');
INSERT INTO `table_product_brand` VALUES ('5', '微软中国', '16');
INSERT INTO `table_product_brand` VALUES ('6', '海康威视', '9,17,18');
INSERT INTO `table_product_brand` VALUES ('8', '国产', '4,7,8,9,11,18,19,20');
INSERT INTO `table_product_brand` VALUES ('9', '微耕', '19,20');
INSERT INTO `table_product_brand` VALUES ('10', '宏大', '19,20');
INSERT INTO `table_product_brand` VALUES ('15', '泉州市科', '4,10');
INSERT INTO `table_product_brand` VALUES ('17', '联想', '5');
INSERT INTO `table_product_brand` VALUES ('18', '彩晨', '5');
INSERT INTO `table_product_brand` VALUES ('19', '洲明', '5');
INSERT INTO `table_product_brand` VALUES ('20', '蓝普', '5');
INSERT INTO `table_product_brand` VALUES ('21', '广州市保', '6');
INSERT INTO `table_product_brand` VALUES ('22', '科立讯通', '7');
INSERT INTO `table_product_brand` VALUES ('23', '深圳市金', '7');
INSERT INTO `table_product_brand` VALUES ('24', '武汉中原', '7');
INSERT INTO `table_product_brand` VALUES ('25', '湖南海思', '7');
INSERT INTO `table_product_brand` VALUES ('27', '广东健博', '7');
INSERT INTO `table_product_brand` VALUES ('28', '钻石', '7');
INSERT INTO `table_product_brand` VALUES ('29', '江苏亨鑫', '7');
INSERT INTO `table_product_brand` VALUES ('30', '科立讯电', '7');
INSERT INTO `table_product_brand` VALUES ('31', '沈阳唯实', '8');
INSERT INTO `table_product_brand` VALUES ('34', '罗技', '9');
INSERT INTO `table_product_brand` VALUES ('36', '爱普华顿', '9');
INSERT INTO `table_product_brand` VALUES ('37', '国标', '9');
INSERT INTO `table_product_brand` VALUES ('39', '订制', '9');
INSERT INTO `table_product_brand` VALUES ('40', '格力', '9');
INSERT INTO `table_product_brand` VALUES ('41', '人工', '9');
INSERT INTO `table_product_brand` VALUES ('44', '深圳市天', '11');
INSERT INTO `table_product_brand` VALUES ('45', '大连道盛', '11');
INSERT INTO `table_product_brand` VALUES ('46', '湖南普天', '11');

-- ----------------------------
-- Table structure for table_product_group
-- ----------------------------
DROP TABLE IF EXISTS `table_product_group`;
CREATE TABLE `table_product_group` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(20) NOT NULL COMMENT '分组名称',
  `parent_id` int(5) NOT NULL DEFAULT '0' COMMENT '父分组ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='材料分组表';

-- ----------------------------
-- Records of table_product_group
-- ----------------------------
INSERT INTO `table_product_group` VALUES ('1', '计算机网络系统', '0');
INSERT INTO `table_product_group` VALUES ('2', '视频监控系统', '0');
INSERT INTO `table_product_group` VALUES ('3', '门禁系统', '0');
INSERT INTO `table_product_group` VALUES ('4', '入侵报警系统', '0');
INSERT INTO `table_product_group` VALUES ('5', '多媒体信息发布系统', '0');
INSERT INTO `table_product_group` VALUES ('6', '公共广播系统', '0');
INSERT INTO `table_product_group` VALUES ('7', '无线对讲系统', '0');
INSERT INTO `table_product_group` VALUES ('8', '电子巡查系统', '0');
INSERT INTO `table_product_group` VALUES ('9', '停车场管理系统', '0');
INSERT INTO `table_product_group` VALUES ('10', '周界防范系统', '0');
INSERT INTO `table_product_group` VALUES ('11', '建筑能耗监测系统', '0');
INSERT INTO `table_product_group` VALUES ('12', '机要局智能网', '1');
INSERT INTO `table_product_group` VALUES ('13', '办公楼内网', '1');
INSERT INTO `table_product_group` VALUES ('14', '智能网', '1');
INSERT INTO `table_product_group` VALUES ('15', '外网', '1');
INSERT INTO `table_product_group` VALUES ('16', '机要局内网', '1');
INSERT INTO `table_product_group` VALUES ('17', '机要局视频监控系统', '2');
INSERT INTO `table_product_group` VALUES ('18', '视频监控系统', '2');
INSERT INTO `table_product_group` VALUES ('19', '机要局门禁系统', '3');
INSERT INTO `table_product_group` VALUES ('20', '门禁系统', '3');

-- ----------------------------
-- Table structure for table_supplier
-- ----------------------------
DROP TABLE IF EXISTS `table_supplier`;
CREATE TABLE `table_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `full_name` varchar(100) NOT NULL COMMENT '全称',
  `simple_name` varchar(36) DEFAULT NULL COMMENT '简称',
  `UCCcode` varchar(80) NOT NULL COMMENT '统一社会信用代码',
  `legal_representative` varchar(50) NOT NULL COMMENT '法定代表人',
  `website` varchar(100) DEFAULT NULL COMMENT '公司网站',
  `main_product` varchar(80) NOT NULL COMMENT '主营产品',
  `found_date` date NOT NULL COMMENT '成立日期',
  `type` varchar(60) NOT NULL COMMENT '企业类型',
  `registered_capital` varchar(80) DEFAULT NULL COMMENT '注册资本',
  `business_deadline_go` varchar(36) DEFAULT NULL COMMENT '营业期限自',
  `business_deadline_to` varchar(36) DEFAULT NULL COMMENT '营业期限至',
  `register_department` varchar(36) NOT NULL COMMENT '登记机关',
  `approval_date` date NOT NULL COMMENT '核准日期',
  `register_state` varchar(40) NOT NULL COMMENT '登记状态',
  `address` varchar(200) NOT NULL COMMENT '住所',
  `operate_range` varchar(1000) NOT NULL COMMENT '经营范围',
  `exception_info` varchar(255) DEFAULT NULL COMMENT '异常信息',
  `danger_info` varchar(100) DEFAULT NULL COMMENT '违法信息',
  `trade_group_id` int(11) NOT NULL COMMENT '行业',
  `comment` varchar(500) DEFAULT NULL COMMENT '备注',
  `user_defined_field_one` varchar(50) DEFAULT NULL COMMENT '自定义字段1',
  `user_defined_field_two` varchar(50) DEFAULT NULL COMMENT '自定义字段2',
  `user_defined_field_three` varchar(50) DEFAULT NULL COMMENT '自定义字段3',
  `user_defined_field_four` varchar(50) DEFAULT NULL COMMENT '自定义字段4',
  `user_defined_field_five` datetime DEFAULT NULL COMMENT '自定义字段5',
  `enter_date` date DEFAULT NULL COMMENT '录入日期',
  `contact_id` int(11) NOT NULL,
  `level` float(3,2) NOT NULL DEFAULT '3.00' COMMENT '企业信用度',
  `category_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '供应商归档种类',
  `no` varchar(8) NOT NULL COMMENT '供应商编号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uqe_no` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=323 DEFAULT CHARSET=utf8 COMMENT='企业表';

-- ----------------------------
-- Records of table_supplier
-- ----------------------------
INSERT INTO `table_supplier` VALUES ('23', '深圳市安盛线缆有限公司', '深圳安盛线缆', '914403006766625302', '秦成如', 'www.szasxl.com', '弱电安防线缆', '2008-06-10', '有限责任公司', '1100.000000万人民币', '2008年6月10日', '5000年1月1日', '深圳市市场监督管理局', '2016-07-11', '存续', '深圳市龙华新区观澜街道富坑社区华朗嘉工业园1#厂房5楼502', '电子线、电脑线、安防周边线的生产和销售；电线电缆、电子产品、通讯设备的技术开发和销售；国内商业、物资供销业、货物及技术进出口\n', null, null, '1', null, null, null, null, null, null, '2018-03-24', '71', '3.00', '0', '20180001');
INSERT INTO `table_supplier` VALUES ('24', '佛山市南海弘毅电线电缆实业有限公司', '佛山南海弘毅', '914406055723590196', '杨炳辉', 'www.gdhongyi.com', '网络电缆.光缆', '2011-03-29', '有限责任公司(自然人投资或控股)', '300.000000万人民币', '2011年3月29日', null, '佛山市南海区市场监督管理局', '2016-12-09', '在营（开业）企业', '佛山市南海区狮山镇官窑美泰精密压铸有限公司后二号厂房（土名：螺督）之二', '加工、生产、销售：监控视频线、同轴电缆、网络线、电话线、电源线、控制线、屏蔽线、通讯线缆设备及配件；公共广播工程设计；安防监控安装及维护。\n', null, null, '1', null, null, null, null, null, null, '2018-03-24', '72', '3.00', '0', '20180002');
INSERT INTO `table_supplier` VALUES ('25', '深圳市粤阳星电线电缆有限公司', '深圳粤阳星', '9144030067858859XN', '马保成', 'www.yyxcable.com', '电线电缆', '2008-07-31', '有限责任公司', '50.000000万人民币', '2008年7月31日', '2023年7月31日', '深圳市市场监督管理局', '2017-11-29', '存续（在营、开业、在册）', '深圳市龙华区观澜街道大和路80号嘉誉业产业园A栋2楼', '电子产品、通信产品、数码产品、光纤、电线电缆的科技开发；音频和视频电子线、电脑和数码通讯线、安防线、排线、端子线的生产销售；国内商业、物资供销业，货物及技术进出口\n', null, null, '1', null, null, null, null, null, null, '2018-03-24', '73', '3.00', '0', '20180003');
INSERT INTO `table_supplier` VALUES ('26', '深圳讯道实业股份有限公司', '深圳讯道实业', '91440300715254346F', '杨少波', 'http://www.cnaxd.com/', '弱电线缆', '1999-12-10', '股份有限公司(非上市)', '5000.000000万人民币', '1999年12月10日', '5000年1月1日', '深圳市市场监督管理局', '2015-11-27', '存续（在营、开业、在册）', '深圳市宝安区西乡街道黄麻布社区同和工业园2号', '兴办实业（具体项目另行申报），光纤光缆及电脑周边设备配件的销售（不含专营、专控、专卖商品）；电器开关、插座、视频监控器材的销售；国内贸易，货物及技术进出口；（法律、行政法规禁止的项目除外；法律、行政法规限制的项目取得许可后方可经营）；^数字通讯电缆、音频视频电缆、塑料绝缘控制电缆、额定电压1KV和3KV挤包绝缘电力电缆的生产；生产聚氯乙烯绝缘电线电缆\n', null, null, '1', null, null, null, null, null, null, '2018-03-24', '74', '3.00', '0', '20180004');
INSERT INTO `table_supplier` VALUES ('27', '韩华泰科（天津）有限公司', '韩华泰科', '91120116681879152M', '千斗焕', 'www.hanwha-security.cn', '安防综合管理平台', '2008-12-22', '有限责任公司(中外合资)', '1000.000000万美元', '2008年12月22日', '2038年12月21日', '天津市滨海新区市场和质量监督管理局', '2017-10-17', '存续（在营、开业、在册）', '天津经济技术开发区微电子工业区微六路11号', '研究、开发、设计、生产、销售手机摄像头、电子元器件及移动通讯、数码照相机及相关零部件，视频展示台、监控系统及零部件、光学仪器、精密电机及相关产品，并提供售后服务；安全技术防范系统的设计、维修、销售、安装；软件系统管理服务；上述同类产品的进出口及批发业务（以上商品进出口不涉及国营贸易、进出口配额许可证、出口配额招标、出口许可证等商品，其他专项规定管理的商品按照国家有关规定办理）。（依法须经批准的项目，经相关部门批准后方可开展经营活动）\n', null, null, '2', null, null, null, null, null, null, '2018-03-24', '75', '3.00', '0', '20180005');
INSERT INTO `table_supplier` VALUES ('28', '中安消物联传感（深圳）有限公司', '中安消物', '91440300755691882F', '吴志明', 'www.ihorn.com.cn', '防盗报警平台', '2003-11-25', '有限责任公司(中外合资)', '5000.000000万人民币', '2003年11月25日', '2033年11月24日', '深圳市市场监督管理局', '2017-11-06', '存续（在营、开业、在册）', '深圳市光明新区万代恒光明高新科技工业园厂房第4栋、第5栋第一层', '安全技术开发；塑胶件及模具的设计；生产经营电子产品、可视对讲、楼宇对讲、网络摄像机、CCTV监控系统、智能家居系统、生物识别系统、GPS、主动红外探测器、可燃气体探测器、可燃气体报警控制器、感烟火灾探测器、感温火灾探测器、火灾报警控制器、红外探头、智能化防盗报警系统、门磁、紧急按钮、闪灯、电子警号、塑胶件及模具；上述产品的批发、进出口（以上均需取得省公安部门颁发的许可证方可生产及销售，涉及配额许可证管理、专项规定管理的商品按国家有关规定办理）\n', null, null, '2', null, null, null, null, null, null, '2018-03-24', '76', '3.00', '0', '20180006');
INSERT INTO `table_supplier` VALUES ('29', '佳都新太科技股份有限公司', '佳都新太科技', '91440101731566630A', '刘伟', 'http://www.pcitech.com/', '智慧城市', '2001-09-30', '其他股份有限公司(上市)', '161733.992400万', '2001年9月30日', null, '广州市工商行政管理局', '2017-10-25', '在营（开业）企业', '广州市番禺区东环街迎宾路832号番禺节能科技园内番山创业中心1号楼2区306房', '计算机技术开发、技术服务;商品零售贸易（许可审批类商品除外）;商品批发贸易（许可审批类商品除外）;广播电视及信号设备的安装;通信线路和设备的安装;智能化安装工程服务;网络技术的研究、开发;计算机网络系统工程服务;信息系统集成服务;安全技术防范系统设计、施工、维修;技术进出口;货物进出口（专营专控商品除外）;跨地区增值电信服务（业务种类以《增值电信业务经营许可证》载明内容为准）\n', '通过登记的住所或者经营场所无法联系', null, '2', null, null, null, null, null, null, '2018-03-24', '77', '3.00', '0', '20180007');
INSERT INTO `table_supplier` VALUES ('30', '广州利凌电子有限公司 ', '广州利凌电子', '9144010172375579XG', '吴壁群', 'http://www.gzlilin.com.cn/', '综合安防', '2000-07-13', '有限责任公司(法人独资)', '1200.000000万港元', '2000年7月13日', '2022年7月13日', '广州市黄埔区市场和质量监督管理局', '2017-09-18', '在营（开业）企业', '广州市萝岗区云埔工业区云埔一路29号', '安全技术防范产品制造;安全技术防范产品批发;\n', null, null, '2', null, null, null, null, null, null, '2018-03-24', '78', '3.00', '0', '20180008');
INSERT INTO `table_supplier` VALUES ('31', '杭州中威电子股份有限公司', '杭州中威电子', '913300007161542753', '石旭刚', 'http://www.obtelecom.com/', '视频平台，智慧城市', '2000-03-14', '股份有限公司(上市、自然人投资或控股)', '27250.300000万人民币', '2000年3月14日', null, '浙江省工商行政管理局', '2017-08-04', '存续', '杭州市西湖区文三路20号浙江建工大楼17层', '应用软件的技术开发、技术服务、成果转让，计算机系统集成，安防工程的设计、施工，楼宇智能化工程的设计、施工，安防产品、通信产品、计算机软件的生产和销售，经营进出口业务，电子设备租赁。\n', null, null, '2', null, null, null, null, null, null, '2018-03-24', '79', '3.00', '0', '20180009');
INSERT INTO `table_supplier` VALUES ('32', '浙江大华技术股份有限公司', '浙江大华技术', '91330000727215176K', '傅利泉', 'http://www.dahuatech.com/', '智慧物联，摄像机视频会议', '2001-03-12', '其他股份有限公司(上市)', '289875.613000万人民币', '2001年3月12日', null, '浙江省工商行政管理局', '2018-02-09', '存续', '杭州市滨江区滨安路1187号', '计算机软件的开发、服务、销售，电子产品及通讯产品的设计、开发、生产、安装及销售，网络产品的开发、系统集成与销售，电子产品工程的设计、安装，经营进出口业务（范围详见《进出口企业资格证书》）。\n', null, null, '2', null, null, null, null, null, null, '2018-03-24', '80', '3.00', '0', '20180010');
INSERT INTO `table_supplier` VALUES ('33', '深圳光启超材料技术有限公司', '深圳光启', '9144030033507786XU', '刘若鹏', 'http://www.kuang-chi.org/', '军民融合', '2015-03-23', '有限责任公司（自然人投资或控股的法人独资）', '100000.000000万人民币', '2015年3月23日', '5000年1月1日', '深圳市市场监督管理局', '2018-01-03', '存续（在营、开业、在册）', '深圳市南山区粤海街道高新区中区一道9号软件大厦301-306室', '高端功能装备综合解决方案的技术开发、技术服务、咨询及销售；国内贸易和进出口业务。（以上均根据法律、行政法规、国务院决定等规定需要审批的，依法取得相关审批文件后方可经营）^汽车工业、轨道交通产品、设备的生产；汽车工业、轨道交通产品、设备的研发、技术咨询、生产及销售；智能化相关产品的技术开发、技术咨询、技术服务、生产及销售；电子产品的技术开发、技术咨询、技术服务、生产及购销，\n', '未按规定期限公示2015年年度报告', null, '2', null, null, null, null, null, null, '2018-03-24', '81', '3.00', '0', '20180011');
INSERT INTO `table_supplier` VALUES ('34', '深圳市贝斯得电子有限公司', '深圳贝斯得', '91440300668531143Y', '林益昌', 'www.bestech-cctv.com', '监控摄像机. 键盘', '2007-10-19', '有限责任公司', '1000.000000万人民币', '2007年10月19日', null, '深圳市市场监督管理局', '2018-01-09', '存续（在营、开业、在册）', '深圳市宝安区西乡街道朱坳第二工业区C5厂房4楼', '电子产品、元器件及周边产品、摄影器材的技术开发和销售（不含生产加工）；国内贸易，经营进出口业务（以上项目法律、行政法规、国务院决定禁止的项目除外，限制的项目须取得许可后方可经营）。^红外球、迷你球、激光球、高速球、高清摄像头、网络存储器的生产。\n', null, null, '3', null, null, null, null, null, null, '2018-03-24', '82', '3.00', '0', '20180012');
INSERT INTO `table_supplier` VALUES ('35', '北京和普威视科技股份有限公司', '北京和普威视', '911101085808516873', '刘豪', 'www.chinahpws.com', '监控摄像机', '2011-08-09', '股份有限公司(非上市、自然人投资或控股)', '1248.750000万人民币', '2011年8月9日', null, '北京市工商行政管理局海淀分局', '2016-05-24', '开业', '北京市海淀区苏州街18号院2号楼6层608室', '技术开发、技术推广、技术服务、技术咨询；软件开发；软件咨询；应用软件服务；计算机系统集成；销售自行开发后的产品；货物进出口、代理进出口、技术进出口；专业承包。（企业依法自主选择经营项目，开展经营活动；依法须经批准的项目，经相关部门批准后依批准的内容开展经营活动；不得从事本市产业政策禁止和限制类项目的经营活动。）\n', null, null, '3', null, null, null, null, null, null, '2018-03-24', '83', '3.00', '0', '20180013');
INSERT INTO `table_supplier` VALUES ('36', '北京淳中科技股份有限公司', '深圳景阳科技', '91110108575204274E', '何仕达', 'www.chinargb.com.cn', '图像处理器.音频视频监控', '2011-05-16', '股份有限公司(非上市、自然人投资或控股)', '7016.000000万人民币', '2011年5月16日', null, '北京市工商行政管理局海淀分局', '2017-01-19', '开业', '北京市海淀区上地信息产业基地三街1号楼二层A段216', '技术开发、技术推广、技术转让、技术咨询、技术服务；销售电子产品、计算机、软件及辅助设备；货物进出口、技术进出口、代理进出口。（企业依法自主选择经营项目，开展经营活动；依法须经批准的项目，经相关部门批准后依批准的内容开展经营活动；不得从事本市产业政策禁止和限制类项目的经营活动。）\n', null, null, '3', null, null, null, null, null, null, '2018-03-24', '84', '3.00', '0', '20180014');
INSERT INTO `table_supplier` VALUES ('37', '深圳市景阳科技股份有限公司', '深圳景阳科技', '914403007451538530', '吴玲', 'www.sunell.com.cm', '高清监控摄像机', '2002-11-04', '股份有限公司(非上市)', '5605.000000万人民币', '2002年11月4日', '5000年1月1日', '深圳市市场监督管理局', '2018-01-04', '存续（在营、开业、在册）', '深圳市南山区西丽街道北环路第五工业区航天微电机厂房科研楼厂房一楼C座104室', '开发、生产楼宇智能监控摄像机、图像处理器、数字硬盘控制主机、产品自产自销（不含限制项目）；国内贸易（不含专营、专控、专卖商品）；经营进出口业务（法律、行政法规、国务院决定禁止的项目除外，限制的项目须取得许可后方可经营）。\n', null, null, '3', null, null, null, null, null, null, '2018-03-24', '85', '3.00', '0', '20180015');
INSERT INTO `table_supplier` VALUES ('38', '深圳市仝行科技有限公司', '深圳仝行科技', '91440300MA5EKBC550', '仝小衡', null, 'WIFI智能监控', '2017-06-13', '有限责任公司(自然人独资)', '200.000000万人民币', '2017年6月13日', null, '深圳市市场监督管理局', '2017-06-13', '存续（在营、开业、在册）', '深圳市龙岗区园山街道保安乡坳背二村长光工业园内5号厂房4楼南半层', '电动自行车、自行车、车载电子产品、建筑智能化产品、智能家居产品研发与销售；电力电子产品、电气产品、机电一体化设备、家用电器电源、LED显示和照明专用电源、工业与通信电源、节能灯及高频镇流器、便携式设备电源、医疗设备电源、电机及变频驱动器和可编程逻辑控制器、触摸屏、工业自动化软件的研发、销售； 电子产品的销售；国内贸易；经营进出口业务。（法律、行政法规或者国务院决定禁止和规定在登记前须经批准的项目除外）^电子产品、电气产品、机电一体化设备、家用电器电源、LED显示和照明专用电源、工业与通信电源、节能灯及高频镇流器、便携式设备电源、医疗设备电源、电机及变频驱动器和可编程逻辑控制器、触摸屏、工业自动化软件的生产。\n', null, null, '3', null, null, null, null, null, null, '2018-03-24', '86', '3.00', '1', '20180016');
INSERT INTO `table_supplier` VALUES ('39', '深圳市安泰伟业科技有限公司', '深圳安泰伟业', '91440300692507223P', '李广杰', 'www.antaivision.com', '全景智能监控', '2009-08-10', '有限责任公司', '100.000000万人民币', '2009年8月10日', '2029年8月10日', '深圳市市场监督管理局', '2016-12-15', '存续（在营、开业、在册）', '深圳市宝安区福永街道桥头社区富桥一区吉安泰工业园第5幢第3层', '电子产品的技术开发、生产与销售；国内贸易，货物及技术进出口。(法律、行政法规、国务院决定规定在登记前须经批准的项目除外）\n', null, null, '3', null, null, null, null, null, null, '2018-03-24', '87', '3.00', '1', '20180017');
INSERT INTO `table_supplier` VALUES ('40', '济南中维世纪科技有限公司', '济南中维世纪', '913701007232692490', '邢新智', 'www.jovision.com/', '网络摄像机.硬盘录像机', '2000-04-25', '有限责任公司(自然人投资或控股)', '2405.263157万', '2003年3月19日', null, '济南高新技术产业开发区管委会市场监管局', '2017-09-20', '在营（开业）企业', '济南市高新区新泺大街2008号银荷大厦4-1101号', '集成电路设计、开发、销售；计算机软、硬件开发、销售；计算机系统集成；仪器仪表及检测设备的研开发、生产及销售；智能化系统、安防系统工程的设计、施工、安装及维护；网络设备及配件的生产、销售；电子元器件、电子产品、办公设备的加工、销售、维修；国内广告业务；图书、报纸、期刊、电子出版物、音像制品、预包装食品、药品、医疗器械、日用百货、家用电器、电动助力车、玩具的销售；增值电信业务；食品安全快速检测仪器的技术开发、技术推广、技术转让、技术咨询、技术服务；农业科学研究与试验发展；工程和技术研究与试验发展；生物试剂（不含危险品）、实验室设备、机械设备及配件、无人机、汽车、摩托车及零配件的销售；货物及技术进出口。(依法须经批准的项目，经相关部门批准后方可开展经营活动)\n', null, null, '3', null, null, null, null, null, null, '2018-03-24', '88', '3.00', '1', '20180018');
INSERT INTO `table_supplier` VALUES ('41', '浙江宇视科技有限公司（长沙）', '浙江宇视科技', '91330100580274795B', '张鹏国', 'http://cn.uniview.com/', '摄像机', '2011-09-02', '有限责任公司（自然人投资或控股的法人独资）', '65496.000000万人民币', '2011年9月2日', '2031年9月1日', '杭州市高新区（滨江）市场监督管理局', '2017-04-14', '存续', '杭州市滨江区西兴街道江陵路88号10幢南座1-11层、2幢A区1-3楼、2幢B区2楼', '技术开发、技术咨询、技术服务、成果转让、生产、销售：电子产品（安防设备、网络通信设备、智能化系统设备、计算机软硬件）；安防系统集成、电子设备安装及维修服务；货物及技术进出口（法律、行政法规禁止经营的项目除外，法律、行政法规限制经营的项目取得许可后方可经营）。\n', null, null, '3', null, null, null, null, null, null, '2018-03-24', '89', '3.00', '1', '20180019');
INSERT INTO `table_supplier` VALUES ('42', '深圳市智慧威视科技有限公司', '深圳智慧威视', '914403005571870013', '黄政', null, '安防监控产品', '2010-08-19', '有限责任公司(台港澳法人独资)', '160.000000万美元', '2010年8月19日', '2030年8月19日', '深圳市市场监督管理局', '2017-09-11', '存续（在营、开业、在册）', '深圳市福田区沙头街道泰然工业区深业泰然雪松大厦A座8e', '电子产品、光学产品的研发、设计；转让自行开发的技术成果并提供上述产品的相关咨询服务；电子产品、光学产品的批发、佣金代理（不含拍卖）、进出口及相关配套业务（不涉及国营贸易管理商品，涉及配额、许可证管理及其它专项规定管理的商品，按国家有关规定办理申请）。^电子产品、光学产品的研发、设计；转让自行开发的技术成果并提供上述产品的相关咨询服务；电子产品、光学产品的批发、佣金代理（不含拍卖）、进出口及相关配套业务（不涉及国营贸易管理商品，涉及配额、许可证管理及其它专项规定管理的商品，按国家有关规定办理申请）。\n', '未按规定期限公示2016年年度报告', null, '3', null, null, null, null, null, null, '2018-03-24', '90', '3.00', '1', '20180020');
INSERT INTO `table_supplier` VALUES ('43', '北京格灵深瞳信息技术有限公司', '北京格灵深瞳', '911101050741151774', '赵勇', 'http://www.deepglint.com/', '摄像头', '2013-08-16', '有限责任公司(台港澳与境内合资)', '1933.377900万美元', '2013年8月16日', '2043年8月15日', '北京市工商行政管理局朝阳分局', '2018-02-01', '开业', '北京市朝阳区宏昌路6号306室', '计算机软硬件及网络技术开发；技术咨询；技术服务；计算机技术培训；转让自有技术；应用软件服务；基础软件服务；计算机系统集成。集成电路设计，电子设备、新型电子元器件，图形图像识别和处理系统开发，销售自行开发的产品；批发机械设备、电子产品、五金交电、计算机、软件及辅助设备。（依法须经批准的项目，经相关部门批准后依批准的内容开展经营活动。）\n', null, null, '3', null, null, null, null, null, null, '2018-03-24', '91', '3.00', '1', '20180021');
INSERT INTO `table_supplier` VALUES ('44', '安徽清新互联信息科技有限公司', '安徽清新信息', '913401003950868800', '尼秀明', 'http://www.tsinglink.com/', '摄像机', '2014-07-22', '有限责任公司(自然人投资或控股)', '981.081100万', '2014年7月22日', '2064年7月21日', '合肥市高新开发区市场监督管理局', '2017-03-23', '存续（在营、开业、在册）', '合肥市高新区黄山路599号时代数码港1106-1107室', '网络、通信相关领域的软件、硬件产品的设计、开发、销售、咨询、服务；系统集成，自动化工程、网络工程、安防工程；企业信息化、电子商务、网站设计与开发；自营和代理各类商品和技术的进出口业务（国家限定或禁止经营的商品及技术除外）（依法须经批准的项目，经相关部门批准后方可开展经营活动）\n', null, null, '3', null, null, null, null, null, null, '2018-03-24', '92', '3.00', '1', '20180022');
INSERT INTO `table_supplier` VALUES ('45', '深圳市卡恩时代科技有限公司', '深圳卡恩科技', '91440300562779925X', '陈荣鑫', 'https://kaansky.cn.china.cn/', '监控设备', '2010-09-29', '有限责任公司', '50.000000万人民币', '2010年9月29日', '2020年9月29日', '深圳市市场监督管理局', '2017-06-07', '存续（在营、开业、在册）', '深圳市龙岗区坂田街道雪岗路2018号天安云谷产业园一期3栋B座25层2502A单元', '电子产品、安全技术防范产品的研发与购销；国内贸易（法律、行政法规、国务院决定规定在登记前须经批准的项目除外）；货物进出口、技术进出口（法律、行政法规禁止的项目除外；法律、行政法规限制的项目须取得许可后方可经营）。^电子产品、安全技术防范产品的研发与购销；国内贸易（法律、行政法规、国务院决定规定在登记前须经批准的项目除外）；货物进出口、技术进出口（法律、行政法规禁止的项目除外；法律、行政法规限制的项目须取得许可后方可经营）。\n', null, null, '3', null, null, null, null, null, null, '2018-03-24', '93', '3.00', '1', '20180023');
INSERT INTO `table_supplier` VALUES ('46', '北京汉邦高科数字技术股份有限公司', '北京汉邦高科', '91110000767525590U', '王立群', 'http://www.hbgk.net/cn/', '硬盘录像机', '2004-10-09', '股份有限公司(上市、自然人投资或控股)', '14328.580000万人民币', '2004年10月9日', null, '北京市工商行政管理局', '2017-12-27', '开业', '北京市海淀区长春桥路11号4号楼裙房四层南侧1-12号房间', '生产安全技术防范产品；销售经国家密码管理局审批并通过指定检测机构产品质量检测的商用密码产品（密码产品销售许可证有效期至2018年6月27日）；研究、开发安全技术防范产品；计算机及外围设备、软件、电子元器件、电讯器材、机电设备的技术开发；技术咨询、技术服务；货物进出口、技术进出口（不含分销业务）；销售自产产品。（企业依法自主选择经营项目，开展经营活动；依法须经批准的项目，经相关部门批准后依批准的内容开展经营活动；不得从事本市产业政策禁止和限制类项目的经营活动。）\n', null, null, '3', null, null, null, null, null, null, '2018-03-24', '94', '3.00', '1', '20180024');
INSERT INTO `table_supplier` VALUES ('47', '杭州智诺科技股份有限公司', '杭州智诺', '9133010069708360XT', '王增锹', 'http://www.zeno-tech.com/', '摄像机 智慧方案', '2009-12-14', '股份有限公司(非上市、外商投资企业投资)', '14300.000000万人民币', '2009年12月14日', '9999年9月9日', '杭州市市场监督管理局', '2017-12-21', '存续', '浙江省杭州市余杭区五常街道荆长路768号6幢3楼', '服务：计算机视觉技术开发，计算机软件、电子产品、通讯产品的技术开发、技术服务、技术咨询，电子设备安装；批发：计算机软件，电子产品，通讯产品；货物进出口（法律、行政法规禁止的项目除外，法律、行政法规限制的项目取得许可后方可经营）。（依法须经批准的项目，经相关部门批准后方可开展经营活动）\n', null, null, '3', null, null, null, null, null, null, '2018-03-24', '95', '3.00', '1', '20180025');
INSERT INTO `table_supplier` VALUES ('48', '天地伟业技术有限公司', '天地伟业', '91120116758104583N', '戴林', 'http://www.tiandy.com/', '监控，人脸识别', '2004-01-20', '有限责任公司', '100000.000000万人民币', '2004年1月20日', null, '天津市滨海新区市场和质量监督管理局', '2017-09-08', '存续（在营、开业、在册）', '华苑产业区（环外）海泰华科二路8号', '电子信息、光机电一体化的技术开发、服务、转让；音视频设备、安防监控器材设计、制造、销售、租赁；安全技术防范工程设计、安装；计算机系统集成；软件开发；计算机及外围设备批发兼零售、修理；建筑智能化工程、机电设备安装工程施工；自有房屋租赁；货物和技术进出口业务。（依法须经批准的项目，经相关部门批准后方可开展经营活动）\n', '未依照《企业信息公示暂行条例》第八条规定的期限公示年度报告的', null, '3', null, null, null, null, null, null, '2018-03-24', '96', '3.00', '1', '20180026');
INSERT INTO `table_supplier` VALUES ('184', ' 深圳市同为数码科技股份有限公司', ' 深圳市', '91440300770326146B', '郭立志', 'http://www.tvt.net.cn/', '摄像机，解决方案', '2004-12-22', '股份有限公司(上市、自然人投资或控股)', '21600.000000万人民币', '2004年12月22', '5000年01月01', '深圳市市场监督管理局', '2017-12-05', '存续（在营、开业、在册）', '深圳市南山区粤海街道深圳湾科技生态园9栋B4座23楼', '摄像机、电子产品及通讯产品的设计、开发、生产（分支机构经营）、上门安装、销售；计算机软件的开发与销售及上门维护；网络产品的开发、计算机系统集成及销售，电子产品工程的设计、安装（以上均不含法律、行政法规、国务院决定规定在登记前须经批准的项目）；经营进出口业务（法律、行政法规、国务院决定禁止的项目除外，限制的项目须取得许可后方可经营）', null, null, '3', null, null, null, null, null, null, '2018-03-25', '235', '3.00', '2', '20180027');
INSERT INTO `table_supplier` VALUES ('185', '北京蓝色星际科技股份有限公司', '北京蓝色', '91110108791600810D', '肖刚', 'http://www.bstar.com.cn/', '摄像机', '2006-08-22', '股份有限公司(中外合资、未上市)', '19252.941000万人民币', '2006年08月22', null, '北京市工商行政管理局海淀分局', '2018-02-06', '开业', '北京市海淀区西三旗昌临813号12号楼1层1012', '研究、开发数字视频、网络视频监控设备，系统集成，货物进出口，提供技术咨询、技术服务、技术转让、技术培训，销售自产产品。（不涉及国营贸易管理商品，涉及配额许可证管理商品的按国家有关规定办理申请手续）；生产数字硬盘录像机（仅限门头沟分公司经营)。（依法须经批准的项目，经相关部门批准后依批准的内容开展经营活动。）', null, null, '3', null, null, null, null, null, null, '2018-03-25', '236', '3.00', '2', '20180028');
INSERT INTO `table_supplier` VALUES ('186', '福建福光股份有限公司', '福建福光', '91350100757384472D', '何文波', 'http://www.forecam.com/', '光学镜头', '2004-02-03', '股份有限公司(非上市、自然人投资或控股)', '11478.194300万人民币', '2004年02月03', '2054年02月02', '福州市市场监督管理局', '2015-12-30', '存续（在营、开业、在册）', '福州市马尾区江滨东大道158号', '光学镜头、光学元器件、光电仪器、光学电子产品、通信设备、计算机及其他电子设备、环保设备的研究开发、生产、加工、销售；自营和代理各类商品和技术的进出口，但国家限定公司经营或禁止进出口的商品和技术除外；不从事任何法律、法规规定禁止或需经审批的项目，自主选择经营项目，开展经营活动。（依法须经批准的项目，经相关部门批准后方可开展经营活动）', null, null, '3', null, null, null, null, null, null, '2018-03-25', '237', '3.00', '2', '20180029');
INSERT INTO `table_supplier` VALUES ('187', '杭州巨峰科技有限公司', '杭州巨峰', '9133018368291591XJ', '陈小鄂', 'http://www.jufenginfo.com/', '摄像机', '2008-12-15', '有限责任公司(自然人投资或控股)', '3000.000000万人民币', '2008年12月15', '2028年12月14', '杭州市富阳区市场监督管理局', '2017-12-20', '存续', '浙江省杭州市富阳区银湖街道富闲路9号银湖创新中心9号8层', '技术开发、技术服务、技术咨询、成果转让、销售：计算机软件，电子产品，通讯产品，网络产品；货物进出口（法律、行政法规禁止经营的项目除外，法律、行政法规限制经营的项目取得许可后方可经营）；分支机构设在：杭州富阳区东洲街道东洲工业功能区东桥路2号第2幢，经营范围：生产：网络摄像机、硬盘录像机、开关电源。', null, null, '3', null, null, null, null, null, null, '2018-03-25', '238', '3.00', '2', '20180030');
INSERT INTO `table_supplier` VALUES ('188', '杭州雄迈信息技术有限公司', '杭州雄迈', '91330183685841477J', '陈小鄂', 'http://www.xiongmaitech.com/', '摄像机模组', '2009-04-17', '有限责任公司(自然人投资或控股)', '6000.000000万人民币', '2009年04月17', '2029年04月16', '杭州市富阳区市场监督管理局', '2017-02-17', '存续', '杭州富阳区银湖街道富闲路9号银湖创新中心9号九层', '技术开发、技术服务、技术咨询、成果转让、销售：计算机软件，电子产品，通讯产品，网络产品，监控产品；分支机构设在：杭州富阳区东洲街道东洲工业功能区东桥路2号第1幢，经营范围：生产：安防监控设备、家用视听设备、电工器材、智能家居产品。', null, null, '3', null, null, null, null, null, null, '2018-03-25', '239', '3.00', '0', '20180031');
INSERT INTO `table_supplier` VALUES ('189', '常州明景物联传感有限公司', '常州明景', '91320404MA1MRNDYX1', '景玉萍', 'http://www.minking.cc/', '摄像机', '2016-08-17', '有限责任公司（非自然人投资或控股的法人独资）', '999.000000万', '2016年08月17', null, '常州市钟楼区市场监督管理局', '2016-08-17', '存续（在营、开业、在册）', '常州市钟楼区星港路65-12号', '数字、无线网络高清安全防范产品、防爆安防工业产品、软件设计、开发；安防工程设计、施工；安防工程信息咨询服务；物联传感电子产品及专业设备制造、加工、销售；自营和代理各类商品及技术的进出口业务（国家限定企业经营或进出口的商品及技术除外）。（依法须经批准的项目，经相关部门批准后方可开展经营活动）', null, null, '3', null, null, null, null, null, null, '2018-03-25', '240', '3.00', '3', '20180032');
INSERT INTO `table_supplier` VALUES ('190', '北京深醒科技有限公司 ', '北京深醒', '91110108MA003G7T9K', '袁培江', 'http://www.sensingtech.com.cn/index.html', '人脸识别', '2016-02-02', '有限责任公司(自然人投资或控股)', '1190.476200万人民币', '2016年02月02', '2116年02月01', '北京市工商行政管理局海淀分局', '2017-11-30', '开业', '北京市海淀区大钟寺东路9号1幢318室', '技术开发、技术转让、技术咨询、技术服务；基础软件服务；应用软件服务；计算机系统服务；数据处理（数据处理中的银行卡中心、PUE值在1.5以上的云计算数据中心除外）；软件开发；软件咨询；产品设计；销售自行开发后的产品、计算机、软件及辅助设备、电子产品。（企业依法自主选择经营项目，开展经营活动；依法须经批准的项目，经相关部门批准后依批准的内容开展经营活动；不得从事本市产业政策禁止和限制类项目的经营活动。）', null, null, '3', null, null, null, null, null, null, '2018-03-25', '241', '3.00', '3', '20180033');
INSERT INTO `table_supplier` VALUES ('191', '新疆中安视通电子科技有限公司', '中安视通', '916522013133257890', '张与回', 'http://www.cvstec.com/', '智能视频监控系统', '2014-09-16', '有限责任公司(自然人投资或控股)', '500.000000万', '2014年09月16', null, '哈密市伊州区工商行政管理局', '2018-01-05', '开业', '新疆哈密市伊州区广东路建行办公大楼610号', '计算机领域及技术咨询服务、数据处理；智能交通项目咨询、规划、设计、施工及产品研发；计算机软硬件、网络技术与工程、通讯工程、电子技术信息、汽车技术、生物工程及生物制品的研制、开发、销售；传统产业中的高科技运用、印务科技；机电领域内的技术开发及技术咨询；安防工程设计、施工及维护；劳务分包；工业控制与自动化系统工程、智能楼宇及数据中心工程的设计、施工；生产、加工计算机软硬件；光机电一体化、航天海洋与运输装备、能源与环保产品、工业自动化控制设备、自主研发产品、计算机软硬件及辅助设备、电子产品、机械设备、通讯设备、五金交电、化工新材料及化工产品的销售；货物与进出口业务；消防设备的安装和销售；市政工程', null, null, '3', null, null, null, null, null, null, '2018-03-25', '242', '3.00', '3', '20180034');
INSERT INTO `table_supplier` VALUES ('192', '深圳富视安智能科技有限公司', '深圳富视', '914403007798635978', '张奕', 'http://www.fsan.cn/indexcn.html', '摄像机', '2006-03-29', '有限责任公司', '1000.000000万人民币', '2006年03月29', '2036年03月29', '深圳市市场监督管理局', '2018-02-05', '存续（在营、开业、在册）', '深圳市龙岗区吉华街道甘李社区甘李路中海信创新产业城19A栋1801～1804、14C栋101～103、3～4层', '软件及网络产品的开发、系统集成与销售（不含限制项目）；货物及技术进出口。^安防产品、电子通讯产品的设计、研发、生产、销售及技术咨询。', null, null, '3', null, null, null, null, null, null, '2018-03-25', '243', '3.00', '3', '20180035');
INSERT INTO `table_supplier` VALUES ('193', '深圳市德盟科技股份有限公司', '深圳市德', '9144030077412316XJ', '张震杰', 'http://www.domenor.cn/', '高清高速球', '2005-04-27', '股份有限公司(非上市)', '1500.000000万人民币', '2005年04月27', '5000年01月01', '深圳市市场监督管理局', '2016-09-30', '存续（在营、开业、在册）', '深圳市龙华新区观澜街道富坑社区泗黎路硅谷动力第三园区130号A3栋4楼', '安防产品、电子产品、视频会议系统、电视监控设备的技术开发、生产与销售；国内贸易，货物及技术进出口。（法律、行政法规、国务院决定规定在登记前须经批准的项目除外）', '通过登记的住所或经营场所无法联系', null, '3', null, null, null, null, null, null, '2018-03-25', '244', '3.00', '3', '20180036');
INSERT INTO `table_supplier` VALUES ('194', '珠海安联锐视科技股份有限公司', '安联锐视', '91440400665003767C', '徐进', 'http://www.raysharp.cn/index.html', '无', '2007-08-06', '其他股份有限公司(非上市)', '5160.000000万', '2007年08月06', null, '珠海市工商行政管理局', '2017-01-04', '在营（开业）企业', '珠海市国家高新区科技六路100号', '安防产品的生产、销售、安装、维修（凭资格证经营）；软件开发与销售；电子类产品的生产、销售；网络系统集成。', null, null, '3', null, null, null, null, null, null, '2018-03-25', '245', '3.00', '3', '20180037');
INSERT INTO `table_supplier` VALUES ('195', '浙江大华技术股份有限公司', '浙江大华', '91330000727215176K', '傅利泉', 'http://dahuatech.21csp.com.cn/ProductList.html', '硬盘录像机（DVR）', '2001-03-12', '其他股份有限公司(上市)', '289875.613000万人民币', '2001年03月12', null, '浙江省工商行政管理局', '2018-02-09', '存续', '杭州市滨江区滨安路1187号', '计算机软件的开发、服务、销售，电子产品及通讯产品的设计、开发、生产、安装及销售，网络产品的开发、系统集成与销售，电子产品工程的设计、安装，经营进出口业务（范围详见《进出口企业资格证书》）', null, null, '3', null, null, null, null, null, null, '2018-03-25', '246', '3.00', '3', '20180038');
INSERT INTO `table_supplier` VALUES ('196', '深圳前海华夏智信数据科技有限公司', '深圳前海', '91440300087852707H', '崔凯', 'http://hxzx2014.tpy888.cn/introduce/', '监控设备，智能交通， 智能交通 消防设备', '2014-01-09', '有限责任公司（自然人投资或控股的法人独资）', '500.000000万人民币', '2014年01月09', '5000年01月01', '深圳市市场监督管理局', '2017-02-13', '存续（在营、开业、在册）', '深圳市前海深港合作区前湾一路鲤鱼门街1号前海深港合作区管理局综合办公楼A栋201室（入驻深圳市前海商务秘书有限公司）', '计算机软件、信息系统软件的开发、销售；信息系统设计、集成、运行维护；信息技术咨询；集成电路设计、研发；计算机、软硬件及辅助设备的销售；通讯设备的销售；无线电及外部设备、网络游戏、多媒体产品的系统集成及无线电数据产品（不含限制项目）的销售；无线接入设备、GSM与CDMA无线直放站设备的销售；投资兴办实业（具体项目另行申报）；资产管理；投资管理；创业投资；投资咨询（不含限制项目）；股权投资；企业管理咨询（不含限制项目）；经济信息咨询（不含限制项目）；信息咨询（不含限制项目）；商务信息咨询；商业信息咨询；贸易咨询；供应链管理；国内贸易（不含专营、专控、专卖商品）；经营进出口业务（法律、行政法规、国务院决定禁止的项目除外，限制的项目须取得许可后方可经营）', null, null, '3', null, null, null, null, null, null, '2018-03-25', '247', '3.00', '3', '20180039');
INSERT INTO `table_supplier` VALUES ('197', '湖南源信光电科技股份有限公司', '湖南源信', '914301000622437298', '罗扬眉', 'http://www.visionsplend.com/', '摄像机', '2013-03-11', '其他股份有限公司(非上市)', '4207.500000万人民币', '2013年03月11', '2063年03月10', '长沙市工商行政管理局高新技术产业开发区分局', '2018-02-11', '存续（在营、开业、在册）', '长沙高新开发区岳麓西大道588号芯城科技园6栋3楼', '计算机技术开发、技术服务；光电探测器件制造；电子产品生产；电子产品服务；计算机科学技术研究服务；软件开发；软件技术转让；软件技术服务；通用机械设备销售；集成电路设计；安全技术防范系统设计、施工、维修；信息系统集成服务；光电惯导系统软件及产品的研发及制造；电子产品、网络技术、通信产品、通讯产品、智能化技术的研发；电子元器件、电子产品的批发。（依法须经批准的项目，经相关部门批准后方可开展经营活动）', null, null, '3', null, null, null, null, null, null, '2018-03-25', '248', '3.00', '3', '20180040');
INSERT INTO `table_supplier` VALUES ('198', '湖南美电贝尔科技有限公司', '湖南美电', '91430102338540995E', '郑孙满', 'www.aebell.com', '智慧系统集成', '2015-04-20', '有限责任公司（自然人投资或控股的法人独资）', '200.000000万人民币', '2015年04月20', '2025年04月19', '长沙市工商行政管理局芙蓉分局', '2018-01-23', '存续（在营、开业、在册）', '湖南省长沙市芙蓉区文艺路街道芙蓉中路259号华天新城汇华阁304房', '软件开发；信息系统集成服务；计算机整机制造（限分支机构）；计算机零部件制造（限分支机构）；音响设备制造（限分支机构）；计算机、软件、计算机零配件的销售。（依法须经批准的项目，经相关部门批准后方可开展经营活动）', null, null, '4', null, null, null, null, null, null, '2018-03-25', '249', '3.00', '3', '20180041');
INSERT INTO `table_supplier` VALUES ('199', '中星电子股份有限公司', '中星电子', '9112000068188738XM', '邓中翰', 'www.zxelec.com', '平安城市综合治理', '2008-12-29', '股份有限公司', '50000.000100万人民币', '2008年12月29', null, '天津市滨海新区市场和质量监督管理局', '2017-11-29', '存续（在营、开业、在册）', '天津经济技术开发区信环南街31号', '安全技术防范系统工程设计、施工；建筑智能化工程设计、施工；研究、开发、设计集成电路及软件、计算机软硬件、电子元器件、机械电器设备、通讯设备、移动通讯终端设备、医疗电子设备、终端设备；计算机系统集成；电子产品的研发、设计、生产和销售；电子设备安装；上述产品的技术咨询、技术服务；货物及技术的进出口；对高新技术产业、制造业、贸易业进行投资及咨询服务；自有房产租赁。（依法须经批准的项目，经相关部门批准后方可开展经营活动）', null, null, '4', null, null, null, null, null, null, '2018-03-25', '250', '3.00', '3', '20180042');
INSERT INTO `table_supplier` VALUES ('200', '北京易华录信息技术股份有限公司', '北京易华', '91110000802085421K', '韩建国', 'www.ehualu.com', '存储系统.公共安全', '2001-04-30', '其他股份有限公司(上市)', '36978.615700万人民币', '2008年09月28', null, '北京市工商行政管理局', '2017-11-21', '开业', '北京市石景山区阜石路165号院1号楼1001室', '施工总承包；专业承包；劳务分包；互联网信息服务；第二类增值电信业务中的信息服务业务（不含互联网信息服务）；技术开发、技术咨询、技术推广、技术转让、技术服务；计算机系统服务；计算机软件开发；数据处理；软件服务；智慧城市、智能交通项目咨询、规划、设计；交通智能化工程及产品研发；销售计算机软硬件及辅助设备、交通智能化设备、工业自动化控制设备；承接工业控制与自动化系统工程、计算机通讯工程、智能楼宇及数据中心计算机系统工程；通讯设备销售；安全技术防范工程的设计、维护；货物进出口；技术进出口；代理进出口。（领取本执照后，应到市住建委取得行政许可；企业依法自主选择经营项目，开展经营活动；依法须经批准的项目，经相关部门批准后依批准的内容开展经营活动；不得从事本市产业政策禁止和限制类项目的经营活动。）', null, null, '4', null, null, null, null, null, null, '2018-03-25', '251', '3.00', '3', '20180043');
INSERT INTO `table_supplier` VALUES ('201', '中安消技术有限公司', '中安消技', '911101081030134965', '葛琳', 'http://www.zhonganxiao.com/', '平安城市', '2001-07-02', '有限责任公司(法人独资)', '99398.999400万人民币', '2001年07月02', '2021年07月01', '北京市工商行政管理局海淀分局', '2018-01-12', '开业', '北京市海淀区西直门北大街52、54、56号7层南栋0101-706', '技术开发、技术转让、技术咨询、技术服务；计算机系统服务；数据处理；基础软件服务；应用软件服务；企业管理；物业管理；施工总承包；货物进出口、技术进出口；销售机械设备、五金交电、电子产品。（企业依法自主选择经营项目，开展经营活动；依法须经批准的项目，经相关部门批准后依批准的内容开展经营活动；不得从事本市产业政策禁止和限制类项目的经营活动。）', null, null, '4', null, null, null, null, null, null, '2018-03-25', '252', '3.00', '3', '20180044');
INSERT INTO `table_supplier` VALUES ('202', '北京文安智能技术股份有限公司', '北京文安', '911101087763518288', '陶海', 'http://www.vion-tech.com/###', '智能安防', '2005-06-20', '股份有限公司(中外合资、未上市)', '4632.786800万人民币', '2005年06月20', null, '北京市工商行政管理局海淀分局', '2018-01-26', '开业', '北京市海淀区上地东路1号院7号楼4层', '技术开发、技术转让、技术咨询、技术推广、技术服务、技术培训；计算机系统服务；数据处理；基础软件服务、应用软件服务；销售计算机、软件及辅助设备、机械设备、电子产品；技术进出口、货物进出口。（企业依法自主选择经营项目，开展经营活动；依法须经批准的项目，经相关部门批准后依批准的内容开展经营活动；不得从事本市产业政策禁止和限制类项目的经营活动。）', null, null, '4', null, null, null, null, null, null, '2018-03-25', '253', '3.00', '3', '20180045');
INSERT INTO `table_supplier` VALUES ('203', '北京市商汤科技开发有限公司', '北京市商', '911101083181538675', '徐冰', 'https://www.sensetime.com/', '智慧安防 人脸识别', '2014-11-14', '有限责任公司(台港澳法人独资)', '10800.000000万人民币', '2015年08月18', '2035年08月17', '北京市工商行政管理局海淀分局', '2017-02-04', '开业', '北京市海淀区中关村东路1号院3号楼7层710-712房间', '计算机软硬件技术开发、技术转让、技术咨询、技术服务、技术推广；计算机技术培训；技术进出口；批发计算机软件及辅助设备、电子产品（不涉及国营贸易管理商品；涉及配额许可证商品的按国家有关规定办理申请手续）；电脑动画设计；设计、制作、代理、发布广告。（依法须经批准的项目，经相关部门批准后依批准的内容开展经营活动。）', null, null, '4', null, null, null, null, null, null, '2018-03-25', '254', '3.00', '3', '20180046');
INSERT INTO `table_supplier` VALUES ('204', '深圳市意林电锁器材有限公司', '深圳市意', '914403007938684825', '岑福裕', 'https://yli123.cn.china.cn/', '电锁器材、安防产品', '2006-09-22', '有限责任公司', '1000.000000万人民币', '2006年09月22', '5000年01月01', '深圳市市场监督管理局', '2017-07-03', '存续（在营、开业、在册）', '深圳市福田区车公庙泰然九路海松大厦A-1605（仅限办公）', '电锁器材、安防产品的技术开发和销售及其他国内贸易（不含专营、专控、专卖商品）；经营进出口业务（法律、行政法规、国务院决定禁止的项目除外，限制的项目须取得许可后方可经营）', '通过登记的住所或经营场所无法联系', null, '4', null, null, null, null, null, null, '2018-03-25', '255', '3.00', '3', '20180047');
INSERT INTO `table_supplier` VALUES ('205', '深圳市捷顺科技实业股份有限公司', '深圳市捷', '914403002794141894', '唐健', 'http://www.jieshun.cn/', '安防只能系统、门禁管理系统、智能视频', '1992-06-17', '股份有限公司(上市)', '66694.260100万人民币', '1992年06月17', '5000年01月01', '深圳市市场监督管理局', '2017-10-26', '存续（在营、开业、在册）', '深圳市福田区梅林街道龙尾路10号捷顺科技', '自营进出口业务（按深管证字137号办）；国内商业、物资供销业（不含专营、专控、专卖商品），机电一体化产品、电控自动大门、交通管理设备设施及安防智能系统设备的安装、维修及产品的技术支持和保养服务（以上不含限制项目），经营进出口业务（法律、行政法规、国务院决定禁止的项目除外，限制的项目须取得许可后方可经营）。^智能卡、计算机软件的技术开发，机电一体化产品、电控自动大门、交通管理设备设施及安防智能系统设备的生产；依托互联网等技术手段，提供金融中介服务（根据国家规定需要审批的，获得审批后方可经营）', null, null, '4', null, null, null, null, null, null, '2018-03-25', '256', '3.00', '3', '20180048');
INSERT INTO `table_supplier` VALUES ('206', '福州米立科技有限公司', '福州米立', '91350105399663075G', '霍震', 'http://www.miligc.com/aboutus', '智慧家庭、智慧社区、社区智能化系统', '2014-05-30', '有限责任公司(自然人投资或控股)', '3000.000000万人民币', '2014年05月30', '2024年05月29', '福州经济技术开发区市场监督管理局', '2017-07-11', '存续（在营、开业、在册）', '福建省福州市马尾区江滨东大道108号福建留学人员创业园研究试验综合楼509（自贸试验区内）', '建筑智能化系统工程、楼宇设备自动控制工程、工业自动控制工程、计算机机房装修工程的设计、安装、维护和技术服务、生产研发销售对讲门禁系统、报警系统、停车场管理系统、远程抄表系统、建筑智能化产品；自营和代理各类商品和技术的进出口，但国家限定公司经营或禁止进出口的商品和技术除外。（依法须经批准的项目，经相关部门批准后方可开展经营活动）', null, null, '4', null, null, null, null, null, null, '2018-03-25', '257', '3.00', '3', '20180049');
INSERT INTO `table_supplier` VALUES ('207', '深圳深安阳光电子有限公司', '深圳深安', '91440300574751559U', '豆萌萌', 'http://netalarm.qianyan.biz/item.do?i=2&yid=10526392', '联网报警系统，视频联网报警系统、楼宇对讲', '2011-05-19', '有限责任公司', '100.000000万人民币', '2011年05月19', '2021年05月19', '深圳市市场监督管理局', '2015-10-09', '存续（在营、开业、在册）', '深圳市南山区西丽麻勘路18号第九栋四楼西面', '电子报警器、电子防盗设备、监控器材、计算机软硬件、电子产品、电子元器件的技术开发、销售；经营进出口业务（法律、行政法规、国务院决定禁止的项目除外，限制的项目须取得许可后方可经营）。^电子报警器、电子防盗设备的生产。', null, null, '4', null, null, null, null, null, null, '2018-03-25', '258', '3.00', '3', '20180050');
INSERT INTO `table_supplier` VALUES ('208', '珠海市竞争电子科技有限公司', '珠海市竞', '91440400754532521A', '陈昌言', 'http://www.competition.com.cn/', '智能家居，楼宇对讲，门禁系统', '2003-09-28', '有限责任公司(台港澳与境内合资)', '1000.000000万人民币', '2003年09月28', '2056年04月01', '珠海市工商行政管理局', '2015-11-17', '在营（开业）企业', '珠海市吉大园林路106号信海工业大厦九楼、十楼、十一楼东区', '研发、开发、生产及销售自产的新型电子元器件（包括片式元器件、敏感电子元器件、混合集成电路、新型机电元件）、数字摄录设备（包括楼宇智能对讲系统、生产登记批准书有效期至2015年5月26日）、集成电路卡读写机、监控系统产品、防盗报警系统产品、电器开关、电器插座、开关电源、家电产品、通讯产品、电子专用设备、测试仪器、数字放声设备、数字音频视频编码设备、智能家居系统（国家限制及禁止外商经营的产品及有专项规定的产品除外；安全技术防范产品凭生产登记批准书生产），并提供相关的技术支持与售后服务；计算机软件产品的研发及销售；集成电路卡、电机、电气设备及其零件的批发及进出口业务（不涉及国营贸易管理商品，涉及配额、许可证管理的，按照国家有关规定办理申请）。', null, null, '4', null, null, null, null, null, null, '2018-03-25', '259', '3.00', '3', '20180051');
INSERT INTO `table_supplier` VALUES ('209', '上海费浦智能科技有限公司', '上海费浦', '91310109563148797W', '方吟梅', 'http://www.adkfp.com/products/', '安防综合平台', '2010-11-02', '有限责任公司(自然人投资或控股)', '1001.000000万人民币', '2010年11月02', '2030年11月01', '松江区市场监管局', '2010-11-02', '存续（在营、开业、在册）', '上海市松江区荣乐中路89号', '智能科技、计算机领域内的技术开发、技术咨询、技术转让，计算机系统集成，空调安装，计算机网络工程，公共安全防范工程，建筑安装工程，楼宇智能化弱电系统工程，建筑智能化建设工程专业施工，机电设备安装建设工程专业施工，计算机软硬件及辅助设备、机电设备及配件、空调、建筑材料批发零售。 【依法须经批准的项目，经相关部门批准后方可开展经营活动】', null, null, '4', null, null, null, null, null, null, '2018-03-25', '260', '3.00', '3', '20180052');
INSERT INTO `table_supplier` VALUES ('210', '深圳市麦驰安防技术有限公司', '深圳市麦', '91440300693962412R', '沈卫民', 'http://maichi.e-eway.com/about.html', '可视对讲、智能家居', '2009-08-25', '有限责任公司（自然人投资或控股的法人独资）', '3000.000000万人民币', '2009年08月25', '2029年08月25', '深圳市市场监督管理局', '2018-01-17', '存续（在营、开业、在册）', '深圳市宝安区西乡街道107国道西乡段467号（固戍路口边）愉盛工业区第8栋3-4楼', '可视对讲产品、安防产品、智能家居系统的设计、技术开发、销售及技术咨询（法律法规、国务院决定规定登记前须审批的项目除外）；经营进出口业务（法律、行政法规、国务院决定禁止的项目除外，限制的项目须取得许可后方可经营）；自有物业租赁。^安防式可视对讲、智能家居型可视对讲、灯光控制及插座模块、别墅型可视对讲生产。', null, null, '4', null, null, null, null, null, null, '2018-03-25', '261', '3.00', '3', '20180053');
INSERT INTO `table_supplier` VALUES ('211', '君和睿通科技股份有限公司', '君和睿通', '91440300581581412X', '王荣福', 'http://www.gemvary.com/product/cpzx.html', '智能家居、室内机', '2011-08-10', '股份有限公司', '1847.222200万人民币', '2011年08月10', '5000年01月01', '深圳市市场监督管理局', '2017-01-11', '存续（在营、开业、在册）', '深圳市南山区粤海街道高新技术园中区科丰路2号特发信息港B栋1003', '计算机软件和互联网的技术开发和维护；国内贸易（不含专营、专控、专卖商品）；经营进出口业务（法律、行政法规、国务院决定禁止的项目除外，限制的项目须取得许可后方可经营）。^楼宇对讲、智能家居、智慧社区的设计、开发、生产、销售及技术咨询(不含限制项目)', null, null, '4', null, null, null, null, null, null, '2018-03-25', '262', '3.00', '3', '20180054');
INSERT INTO `table_supplier` VALUES ('212', '福建环宇通信息科技股份公司', '福建泉州', '91350503705200635R', '谢建华', 'http://13618593692798.gw.1688.com/?spm=a262gm.8761401.0.0.5fac4526n6jVdC', '智能社区、可视对讲系统、无线呼叫系统', '1999-04-03', '股份有限公司(非上市、自然人投资或控股)', '1561.000000万人民币', '1999年04月03', null, '福建省泉州市工商行政管理局', '2017-03-27', '存续（在营、开业、在册）', '泉州市丰泽区高新产业园区（原浔美工业区）科技路海西电子信息产业育成基地办公楼7层', '研发、生产、销售：防盗报警产品，楼宇可视对讲系统，音视频监控设备，网络通信设备，对讲机，智能保险柜、保管箱，执法仪，计算机软、硬件设备产品；信息传输、软件和信息技术服务、信息系统集成服务；自营和代理各类商品和技术的进出口，但国家限制经营或禁止经营的商品和技术除外。（依法须经批准的项目，经相关部门批准后方可开展经营活动）', null, null, '4', null, null, null, null, null, null, '2018-03-25', '263', '3.00', '3', '20180055');
INSERT INTO `table_supplier` VALUES ('213', '北京博力恒昌科技有限公司', '北京博力', '91110108562051483Y', '王宁宁', 'http://www.polyhome.com/about/brand', '智能安防监控、智能楼宇系统', '2010-10-08', '有限责任公司(自然人投资或控股)', '3000.000000万人民币', '2010年10月08', '2030年10月07', '北京市工商行政管理局海淀分局', '2017-12-14', '开业', '北京市海淀区学清路8号(科技财富中心)B座6层B608', '技术推广、技术开发、技术转让、技术咨询、技术服务；计算机系统服务；数据处理；应用软件服务；销售计算机、软件及辅助设备、电子产品、通讯设备、家用电器；货物进出口、代理进出口、技术进出口。（企业依法自主选择经营项目，开展经营活动；依法须经批准的项目，经相关部门批准后依批准的内容开展经营活动；不得从事本市产业政策禁止和限制类项目的经营活动。）', null, null, '4', null, null, null, null, null, null, '2018-03-25', '264', '3.00', '3', '20180056');
INSERT INTO `table_supplier` VALUES ('214', '深圳市新和创智能科技有限公司', '深圳市新', '91440300664187410J', '梁禹', 'http://bc2013.tpy888.cn/', '智能家居', '2007-07-24', '有限责任公司', '1866.666700万人民币', '2007年07月24', '2027年07月24', '深圳市市场监督管理局', '2017-12-18', '存续（在营、开业、在册）', '深圳市南山区高新区北区朗山路13号清华紫光科技园3层C311室', '家庭智能网关电子产品的生产（凭深南环水批【2012】51475号经营）；电子产品的技术开发、设计、购销（不含专营、专控、专卖商品）；计算机软、硬件系统集成的技术开发；经济信息咨询（不含限制项目）；经营进出口业务（按深贸管登证字第2003-0829号资格证书执行）；智能化工程、家居工程的设计、安装（限上门服务）', null, null, '4', null, null, null, null, null, null, '2018-03-25', '265', '3.00', '3', '20180057');
INSERT INTO `table_supplier` VALUES ('215', '西安翔迅科技有限责任公司', '西安翔迅', '916101317262694470', '张勇', 'www.631xiangxun.com', '移动警务系统', '1993-02-15', '其他有限责任公司', '3000.000000万', '1993年02月15', null, '西安市工商行政管理局高新分局', '2017-07-17', '开业', '西安市锦业二路15号中航工业西安计算技术研究所1号厂房112室', '计算机系统工程软件和硬件的开发、咨询、服务、生产、销售；与计算机类相关项目的工程承接；计算机系统软件、硬件、外部设备、数字控制设备的研发销售；机械加工；消防工程施工及产品的销售；高低压配电设备施工（不含承装、承修、承试供电设施）及销售；防盗报警、电视监控系统工程的设计、施工、维修；机载电子设备维修；货物和技术的进出口经营（国家限制和禁止进出口的货物和技术除外）；办公用品、办公家具、电子器件、仪器仪表、微机及其外围设备的销售；智能交通系统及道路交通安全设施、高速公路收费系统、监控器材、机电设施的生产、安装、施工与销售；市政工程的设计与施工；照明工程施工；空调设备及机电设备的销售及安装（不含汽车）；装饰装修工程施工；报靶系统的开发和研制；射击馆的设计；体育设施、体育器材的安装、销售；信息系统集成及运维服务；环境保护工程的技术研发、咨询、服务，环保设备的生产、销售；计量器具的研发、制造、销售。（依法须经批准的项目，经相关部门批准后方可开展经营活动）', null, null, '5', null, null, null, null, null, null, '2018-03-25', '266', '3.00', '3', '20180058');
INSERT INTO `table_supplier` VALUES ('216', '深圳市亮影科技有限公司', '深圳市亮', '91440300769152222D', '梁校', 'liangying-hp.com', '惠普高清执法记录仪', '2004-11-12', '有限责任公司', '1000.000000万人民币', '2004年11月12', '5000年01月01', '深圳市市场监督管理局', '2017-12-21', '存续（在营、开业、在册）', '深圳市龙华区福城街道福民人民路229号康脉科技工业园A栋二楼右侧', '电子产品、摄影器材、计算机软硬件的研发及销售；信息传输、软件和信息技术的开发；国内贸易；货物及技术进出口。（法律、行政法规禁止的项目除外；法律、行政法规限制的项目须取得许可后方可经营）；^电子产品、摄影器材、计算机软硬件的生产', null, null, '5', null, null, null, null, null, null, '2018-03-25', '267', '3.00', '3', '20180059');
INSERT INTO `table_supplier` VALUES ('217', '深圳市八方通达科技有限公司', '深圳市八', '91440300691156062C', '史国运', 'www.bftd8888.com', '执法音频记录仪.采集站', '2009-06-29', '有限责任公司(自然人独资)', '5000.000000万人民币', '2009年06月29', '2019年06月29', '深圳市市场监督管理局', '2018-01-25', '存续（在营、开业、在册）', '深圳市龙岗区园山街道龙岗大道8288号大运软件小镇66栋2层', '安防设备、交通设施、消防设备、单警执法视音频记录仪取证设备、警用数据采集设备、警用数据管理终端设备、警用移动终端及其系统的软件产品的技术开发与销售；摄录机、单警执法视音频记录仪的技术开发、技术转让、销售；软件的开发、销售与维护；计算机技术开发及相关的技术信息咨询；警用数据管理终端系统的研发、销售及上门安装；无人机及多功能飞行器的技术研发、技术咨询、上门安装与技术服务；无人机及相关设备与配件的销售及租赁；技术及货物进出口。（法律、行政法规、国务院决定规定在登记前须经批准的项目除外）^电子产品、五金产品、安防设备、交通设施、消防设备、摄录机、无人机及多功能飞行器设备与配件的生产；单警执法视音频记录仪、警用移动终端设备、警用数据采集设备、警用数据管理终端系统及设备的生产。（法律、行政法规、国务院决定规定在登记前须经批准的项目除外）', null, null, '5', null, null, null, null, null, null, '2018-03-25', '268', '3.00', '3', '20180060');
INSERT INTO `table_supplier` VALUES ('218', '照彰实业（东莞）有限公司', '照彰实业', '914419006177625157', '冯永楷', 'www.chiucheung.com', '控制台.机柜', '1993-12-30', '有限责任公司(台港澳法人独资)', '5000.000000万香港元', '1993年12月30', '2018年12月29', '广东省东莞市工商行政管理局', '2017-09-30', '在营（开业）企业', '东莞市塘厦镇石鼓村', '设计、生产和销售标准机柜及配件、控制台及其配套产品、屏幕墙及吊架、灯箱、指示牌、仪器箱、航空箱、咨询柜、计算机系统集成设备部件、非标数控机床及其部件、车箱、五金制品；从事自产产品的售后服务（涉限涉证及涉国家宏观调控行业除外，涉及配额许可证管理、专项规定管理的按有关规定办理）。', null, null, '6', null, null, null, null, null, null, '2018-03-25', '269', '3.00', '3', '20180061');
INSERT INTO `table_supplier` VALUES ('219', '北京卓奥世鹏科技有限公司', '北京卓奥', '911101066963235958', '周鹏', 'www.bjzasp.com', '升降柱.路障机识别一体机', '2009-11-11', '有限责任公司(自然人投资或控股)', '1010.000000万人民币', '2009年11月11', '2029年11月10', '北京市工商行政管理局丰台分局', '2017-08-24', '开业', '北京市丰台区富丰路4号20层20A06(园区)', '技术开发、技术转让、技术服务、技术推广、技术培训、技术咨询；机械设备安装、租赁；劳务服务；货物进出口、技术进出口、代理进出口；软件开发；计算机系统集成；专业承包；销售机械设备、仪器仪表、电器设备、交通设备、专用设备、社会公共安全设备及器材、办公用品、五金交电、计算机软硬件及辅助设备、工艺美术品；生产社会公共安全设备及器材、机械设备、仪器仪表、电器设备、交通设备、专用设备、路障、护栏（限在外埠从事生产活动）。（企业依法自主选择经营项目，开展经营活动；依法须经批准的项目，经相关部门批准后依批准的内容开展经营活动；不得从事本市产业政策禁止和限制类项目的经营活动。）', null, null, '6', null, null, null, null, null, null, '2018-03-25', '270', '3.00', '3', '20180062');
INSERT INTO `table_supplier` VALUES ('220', '东莞市盛熠数控科技有限公司', '东莞市盛', '91441900334768597G', '鲁理祥', '', '广告门一体机', '2014-12-12', '有限责任公司(自然人独资)', '100.000000万人民币', '2014年12月12', null, '广东省东莞市工商行政管理局', '2016-06-03', '在营（开业）企业', '东莞市企石镇新南第二工业区', '研发、产销：数控设备、电子产品、塑胶制品、五金制品。', null, null, '6', null, null, null, null, null, null, '2018-03-25', '271', '3.00', '3', '20180063');
INSERT INTO `table_supplier` VALUES ('221', '浙江大立科技股份有限公司', '浙江大立', '913300007308931541', '庞惠民', 'http://www.dali-tech.com/', '红外热像仪机芯组件', '2001-07-19', '其他股份有限公司(上市)', '45866.666600万人民币', '2001年07月19', null, '浙江省工商行政管理局', '2017-12-04', '存续', '杭州市滨江区滨康路639号', '机电设备、计算机、软件及网络工程、电子产品、集成电路、测试技术的投资开发及技术转让、技术咨询、技术服务；机电设备（不含汽车）、电子产品、集成电路、化工产品（不含危险品）、计算机及软件的生产、销售（凭环保审批意见生产）；计算机网络工程安装；机器人的设计、开发、生产、销售、租赁及技术服务；经营进出口业务（范围详见《中华人民共和国进出口企业资格证书》）', null, null, '6', null, null, null, null, null, null, '2018-03-25', '272', '3.00', '3', '20180064');
INSERT INTO `table_supplier` VALUES ('222', '珠海市竞争电子科技有限公司', '竞争电子', '91440400754532521A', '陈昌言', 'http://jingzheng.e-eway.com/', '门禁管理系统', '2003-09-28', '有限责任公司(台港澳与境内合资)', '1000.000000万人民币', '2003年09月28', '2056年04月01', '珠海市工商行政管理局', '2015-11-17', '在营（开业）企业', '珠海市吉大园林路106号信海工业大厦九楼、十楼、十一楼东区', '研发、开发、生产及销售自产的新型电子元器件（包括片式元器件、敏感电子元器件、混合集成电路、新型机电元件）、数字摄录设备（包括楼宇智能对讲系统、生产登记批准书有效期至2015年5月26日）、集成电路卡读写机、监控系统产品、防盗报警系统产品、电器开关、电器插座、开关电源、家电产品、通讯产品、电子专用设备、测试仪器、数字放声设备、数字音频视频编码设备、智能家居系统（国家限制及禁止外商经营的产品及有专项规定的产品除外；安全技术防范产品凭生产登记批准书生产），并提供相关的技术支持与售后服务；计算机软件产品的研发及销售；集成电路卡、电机、电气设备及其零件的批发及进出口业务（不涉及国营贸易管理商品，涉及配额、许可证管理的，按照国家有关规定办理申请）', null, null, '6', null, null, null, null, null, null, '2018-03-25', '273', '3.00', '3', '20180065');
INSERT INTO `table_supplier` VALUES ('223', '深圳市灵科科技有限公司 ', '深圳市灵', '91440300562763288J', '罗志红', 'http://www.linkyview.com/', '服务器 摄像机', '2010-09-29', '有限责任公司', '50.000000万人民币', '2010年09月29', '2030年09月29', '深圳市市场监督管理局', '2015-12-21', '存续（在营、开业、在册）', '深圳市龙华新区龙华街道清祥路清湖工业园宝能科技园7栋B座5楼I单位', '电子产品、计算机软硬件、网络产品、通讯产品的技术开发与销售（以上均不含限制项目及专营、专控、专卖商品）；经营进出口业务（法律、行政法规、国务院决定禁止的项目除外，限制的项目须取得许可后方可经营）。', null, null, '6', null, null, null, null, null, null, '2018-03-25', '274', '3.00', '3', '20180066');
INSERT INTO `table_supplier` VALUES ('224', '来邦科技股份公司', '来邦科技', '9134020058724277XJ', '潘晓亭', 'http://www.lonbon.com/', '对讲系统', '2011-12-16', '股份有限公司(非上市、自然人投资或控股)', '6928.000000万', '2011年12月16', null, '芜湖市工商行政管理局', '2017-10-20', '存续（在营、开业、在册）', '南陵经济开发区来邦科技园', '专用对讲产品、安全技术防范产品、自助终端设备、金融系统设备、网络通讯设备、网络系统集成以及计算机软硬件产品的研究、开发、生产、销售及技术服务，房屋租赁。（依法须经批准的项目，经相关部门批准后方可开展经营活动） ', null, null, '6', null, null, null, null, null, null, '2018-03-25', '275', '3.00', '3', '20180067');
INSERT INTO `table_supplier` VALUES ('225', '福建省冠林科技有限公司', '福建省冠', '91350105735677469F', 'Francesco Della Valentina', 'http://www.aurine.cn/category.aspx?NodeID=147', '对讲产品', '2002-02-28', '有限责任公司(外商合资)', '4490.000000万人民币', '2002年02月28', '2052年02月27', '福州经济技术开发区市场监督管理局', '2017-08-17', '存续（在营、开业、在册）', '福州市马尾区快安路6-1号（自贸试验区内）', '建筑智能化系统工程，楼宇设备自动控制工程，工业自动控制工程，计算机机房装修工程的设计、安装、维护和技术服务.生产门禁系统，报警系统，停车场管理系统，远程抄表系统等建筑智能化产品。（凡涉及审批许可项目的，只允许在审批许可的范围和有效期限内从事生产经营）', null, null, '6', null, null, null, null, null, null, '2018-03-25', '276', '3.00', '3', '20180068');
INSERT INTO `table_supplier` VALUES ('226', '东方网力科技股份有限公司', '东方网力', '91110000721497432T', '赵永军', 'http://www.netposa.com/', '视频图像联网，云储存/视频大数据应用，安防人工智能', '2000-09-05', '股份有限公司(上市、自然人投资或控股)', '85637.167200万人民币', '2000年09月05', null, '北京市工商行政管理局', '2017-11-20', '开业', '北京市海淀区学院路35号世宁大厦4层408室', '技术开发、技术推广、技术转让、技术咨询、技术服务；基础软件服务；应用软件服务；计算机系统服务；安防工程设计；制造电子计算机外部设备；销售计算机、软件及辅助设备、电子产品、通讯设备、安全技术防范产品；货物进出口、技术进出口、代理进出口。（企业依法自主选择经营项目，开展经营活动；依法须经批准的项目，经相关部门批准后依批准的内容开展经营活动；不得从事本市产业政策禁止和限制类项目的经营活动。）', null, null, '6', null, null, null, null, null, null, '2018-03-25', '277', '3.00', '3', '20180069');
INSERT INTO `table_supplier` VALUES ('227', '厦门狄耐克智能科技股份有限公司', '厦门狄耐', '9135020076928783XA', '缪国栋', 'http://www.dnake-intercom.com/', '数字对讲系统，传感器，智能开关面板', '2005-04-29', '股份有限公司(非上市、自然人投资或控股)', '9000.000000万人民币', '2005年04月29', '9999年12月31', '厦门市市场监督管理局', '2018-01-02', '存续（在营、开业、在册）', '中国（福建）自由贸易试验区厦门片区海景北路1号E栋', '计算机软件开发；计算机硬件的批发零售；组装生产电话、可视对讲、通讯产品；电子信息产品开发与设计、生产与安装；安防产品的开发与设计、生产与安装；IC卡读写机的生产制造；经营本企业自产产品的出口业务和本企业所需的机械设备、零配件、原辅材料的进口业务（不另附进出口商品目录），但国家限定公司经营或禁止进出口商品及技术除外。', null, null, '6', null, null, null, null, null, null, '2018-03-25', '278', '3.00', '3', '20180070');
INSERT INTO `table_supplier` VALUES ('228', '精华隆智慧感知科技（深圳）股份有限公司', '精华隆智', '91440300793883164K', '徐友华', 'http://www.innopro.cc/index.php?c=contact', '防盗报警主机、中心控制主机', '2006-10-11', '股份有限公司(非上市)', '1129.883900万人民币', '2006年10月11', '5000年01月01', '深圳市市场监督管理局', '2016-08-31', '存续（在营、开业、在册）', '深圳市龙华新区观澜大和社区大和工业区33号一楼101、2-4楼', '从事计算机软、硬件、互联网、物联网及信息技术与产品开发、服务、咨询、销售（法律、行政法规、国务院决定禁止的项目除外，限制的项目须取得许可后方可经营）；计算机与通讯系统集成；网络布线；弱电工程的技术开发；各类传感器、探测器、控制器、按钮、塑胶制品、五金模具、防盗报警器材及周边配套产品的销售；货物及技术进出口（法律、行政法规、国务院决定禁止的项目除外，限制的项目须取得许可后方可经营）；国内贸易（不含专营、专卖、专控商品）。^各类传感器、探测器、控制器、按钮、塑胶制品、五金模具、防盗报警器材及周边配套产品的生产。信息与数据提供、咨询、分发。', '未按规定期限公示2014年年度报告', null, '6', null, null, null, null, null, null, '2018-03-25', '279', '3.00', '3', '20180071');
INSERT INTO `table_supplier` VALUES ('229', '深圳市视得安罗格朗电子有限公司', '深圳市视', '91440300279350584T', 'Andrea LAMIERI', 'http://shideanlegrand.b2bvip.com/sell/', '可视对讲，液晶屏拼接', '1997-06-17', '有限责任公司(台港澳法人独资)', '3640.000000万人民币', '1997年06月17', '5000年01月01', '深圳市市场监督管理局', '2017-07-25', '存续（在营、开业、在册）', '深圳市南山区粤海街道科苑路六号科技园工业大厦西266A房', '从事智能型楼宇管理、监控系统产品、电器开关插座及相关配件、家电产品、通讯产品、电子专用设备、测试仪器、工模具、数字放声设备制造、数字音频、视频编解码设备的开发、生产、经营并提供相关的技术服务（国家限制及禁止类产品及有专项规定的产品除外）；软件产品开发；电机、电气设备及其零件的批发、佣金代理（拍卖除外）、进出口及其它相关配套业务（不涉及国营贸易管理商品，涉及配额、许可证管理及其它专项规定管理商品的，按国家有关规定办理申请）', null, null, '6', null, null, null, null, null, null, '2018-03-25', '280', '3.00', '3', '20180072');
INSERT INTO `table_supplier` VALUES ('230', '深圳安保迪科技（深圳）有限公司', '深圳安保', '914403007675911091', '赵建邦', 'http://anbaodi.safe10000.com/introduce/', '感应式读卡器及感应卡', '2005-03-23', '有限责任公司(台港澳法人独资)', '15.000000万美元', '2005年03月23', '2035年03月23', '深圳市市场监督管理局', '2017-11-06', '存续（在营、开业、在册）', '深圳市福田区沙头街道车公庙天祥大厦8D1', '从事智能卡、读卡器、安保产品及安保系统的批发、进出口及相关配套业务（不涉及国营贸易管理商品，涉及配额、许可证管理及其他专项规定管理商品的，按国家有关规定办理申请）；并提供相应的技术服务、技术咨询及售后服务。', null, null, '6', null, null, null, null, null, null, '2018-03-25', '281', '3.00', '3', '20180073');
INSERT INTO `table_supplier` VALUES ('231', '深圳英飞拓科技股份有限公司', '深圳英飞', '914403007230430398', '刘肇怀', 'https://infinova0755.cn.china.cn/', '安防产品，摄像机，球机', '2000-10-18', '股份有限公司(中外合资、上市)', '104130.451000万人民币', '2000年10月18', '5000年01月01', '深圳市市场监督管理局', '2017-10-27', '存续（在营、开业、在册）', '深圳市龙华新区观澜高新技术产业园英飞拓厂房', '开发、生产经营光端机、闭路电视系统产品、出入口控制系统产品，视频传输设备技术开发及计算机应用软件开发。从事货物、技术进出口业务（不含分销、国家专营专控商品）。开发、生产经营防爆视频监控产品、防爆工业通讯产品。从事自产产品租赁相关业务。系统集成、电子设备工程的设计、施工、维护业务；大数据分析及应用业务。以上经营范围不含增值电信业务、电子商务、其它在线数据处理与交易业务处理、数据库服务、数据库管理等国家规定实施准入特别管理措施的项目，涉及备案许可资质的需取得相关证件后方可经营。', null, null, '6', null, null, null, null, null, null, '2018-03-25', '282', '3.00', '3', '20180074');
INSERT INTO `table_supplier` VALUES ('232', '深圳市富士智能系统有限公司', '深圳市富', '914403007604814252', '徐建明', 'http://fujica.21csp.com.cn/atricle/1597.html', '智能停车场系统、智能门禁系统、智能考勤系统等', '2004-04-08', '有限责任公司', '1000.000000万人民币', '2004年04月08', '2024年04月08', '深圳市市场监督管理局', '2017-09-15', '存续（在营、开业、在册）', '深圳市南山区西丽街道九祥岭工业区第六栋1-5层', '智能卡、计算机软件、电子技术开发与销售；停车场内交通管理设备设施，智能卡读写管理设备、电控自动门，机电产品的销售、安装和维护保养服务；其它国内商业、物资供销业（以上不含专营、专控、专卖商品及限制项目）；停车场出入口控制器、门禁控制器、道闸、IC卡读写机、三辊闸、通道闸的组装生产、销售、安装、维修；经营进出口业务（法律、行政法规、国务院决定禁止的项目除外，限制的项目须取得许可后方可经营）', null, null, '6', null, null, null, null, null, null, '2018-03-25', '283', '3.00', '3', '20180075');
INSERT INTO `table_supplier` VALUES ('233', '厦门立林科技有限公司', '厦门立林', '91350211737872727E', '陈旭黎', 'https://xmllkj.cn.gongchang.com/product/', '对讲系统', '2002-11-29', '有限责任公司(自然人投资或控股)', '7000.000000万人民币', '2002年11月29', '2052年11月28', '厦门市集美区市场监督管理局', '2017-11-22', '存续（在营、开业、在册）', '厦门市集美区孙坂南路65号', '开发、生产、安装、销售安全监视报警器材、技防保安产品、电子产品、通讯设备、电子元器件；加工、制造注塑产品。经营本企业自产产品的出口业务和本企业所需的机械设备、零配件、原辅材料的进口业务（不另附进出口商品目录），但国家限定公司经营或禁止进出口的商品及技术除外。', null, null, '6', null, null, null, null, null, null, '2018-03-25', '284', '3.00', '3', '20180076');
INSERT INTO `table_supplier` VALUES ('234', '深圳市酷驼科技有限公司', '深圳市酷', '91440300311890952H', '吕杏军', 'http://www.eastsoo.com/u100392931/', '智能交通设备', '2014-08-07', '有限责任公司', '500.000000万人民币', '2014年08月07', '5000年01月01', '深圳市市场监督管理局', '2017-10-13', '存续（在营、开业、在册）', '深圳市宝安区石岩街道洲石路万大工业区F栋厂房五楼', '计算机软硬件、智能交通设备、交通信号控制系统、信号控制机、交通信号灯、LED光电产品、信号灯灯杆、标志杆、监控电警杆、塑胶五金产品的技术研发、生产销售与技术服务；智能交通系统集成技术开发销售；国内贸易（不含专营、专控、专卖商品）；经营进出口业务（法律、行政法规、国务院决定禁止的项目除外，限制的项目须取得许可后方可经营）。^计算机软硬件、智能交通设备、LED光电产品、塑胶五金产品的生产', null, null, '6', null, null, null, null, null, null, '2018-03-25', '285', '3.00', '3', '20180077');
INSERT INTO `table_supplier` VALUES ('235', '深圳市爱森斯信息技术有限公司', '深圳市爱', '914403007152448187', '张海平', 'http://ableress700.cn.b2b168.com/', '智能卡、电子门票', '1999-11-11', '有限责任公司', '600.000000万人民币', '1999年11月11', '2029年11月11', '深圳市市场监督管理局', '2017-12-07', '存续（在营、开业、在册）', '深圳市宝安区西乡街道西成工业区1号二楼东', '计算机应用设备、计算机软件的技术开发；数字化景区电子门票系统软硬件开发、设计、安装、技术维护（以上不含计算机信息系统集成及限制项目）；国内贸易，货物及技术进出口。(法律、行政法规、国务院决定规定在登记前须经批准的项目除外）^验票三棍闸机、机械三棍闸机的组装生产。', null, null, '6', null, null, null, null, null, null, '2018-03-25', '286', '3.00', '3', '20180078');
INSERT INTO `table_supplier` VALUES ('236', '深圳市刻锐智能科技有限公司', '深圳市刻', '914403003062936863', '杨建辉', 'http://shenzhen01127245.11467.com/', '消防设备、报警设备、防盗设备', '2014-06-13', '有限责任公司', '1000.000000万人民币', '2014年06月13', '5000年01月01', '深圳市市场监督管理局', '2016-06-06', '存续（在营、开业、在册）', '深圳市宝安区福永街道桥头永和路鑫豪盛工业园B1栋第二、三层', '无线门铃、火灾报警产品、防盗报警器、监控设备、电子产品、计算机软硬件、防盗设备、通讯产品、计算机周边产品、机械电器设备、智能家居产品及安防产品的技术开发及销售；楼宇智能化系统、智能门窗控制系统、小区智能化系统集成；国内贸易，货物及技术进出口。(法律、行政法规、国务院决定规定在登记前须经批准的项目除外，涉及行政许可的，须取得行政许可后方可经营）^无线门铃、火灾报警产品、防盗报警器、监控设备、电子产品、计算机软硬件、防盗设备、通讯产品、计算机周边产品、机械电器设备、智能家居产品及安防产品的生产。', '通过登记的住所或经营场所无法联系', null, '6', null, null, null, null, null, null, '2018-03-25', '287', '3.00', '3', '20180079');
INSERT INTO `table_supplier` VALUES ('237', '深圳市三旺通信技术有限公司', '深圳市三', '91440300732050644R', '熊伟', 'http://threeonedatazhy.sm160.com/Company/OfferList/1-000-0101-145.html', '服务器', '2001-09-06', '有限责任公司', '3597.222200万人民币', '2001年09月06', '5000年01月01', '深圳市市场监督管理局', '2017-12-22', '存续（在营、开业、在册）', '深圳市南山区西丽街道百旺信高科技工业园1区3栋', '计算机产品、数据通信产品、计算机软件的技术开发与购销；国内贸易；经营进出口业务。（法律、行政法规、国务院决定禁止的项目除外，限制的项目须取得许可后方可经营）^计算机产品、数据通信产品、计算机软件的生产。', null, null, '6', null, null, null, null, null, null, '2018-03-25', '288', '3.00', '3', '20180080');
INSERT INTO `table_supplier` VALUES ('238', '深圳捷视联实业有限公司', '深圳捷视', '914403003193630496', '谢道福', 'http://xuchanglu63004831.tpy888.cn/', '摄像头', '2014-10-08', '有限责任公司', '500.000000万人民币', '2014年10月08', '2064年10月08', '深圳市市场监督管理局', '2017-04-07', '存续（在营、开业、在册）', '深圳市龙华新区观澜桔塘社区桔岭新村金奥路磊泰石材003号2栋2楼A', '电子产品、生物技术、化工产品、建筑建材、机械设备领域内的技术开发、技术咨询、技术服务、技术转让；国内贸易（不含专营、专卖、专控商品）；经营进出口业务（不含限制项目）；^从事信息技术领域内技术开发、技术咨询、技术服务、技术转让；摇头机、摄像机、光端机、光纤收发器、IP同轴传输器、安防产品的技术开发、生产和销售。', null, null, '6', null, null, null, null, null, null, '2018-03-25', '289', '3.00', '3', '20180081');
INSERT INTO `table_supplier` VALUES ('239', '广东柔乐电器有限公司', '广东柔乐', '914404007278748927', '林周明', 'https://roule.cn.gongchang.com/', '感应机、报警器、对讲机、无线监视系统', '2001-04-05', '有限责任公司(台港澳与境内合资)', '7168.000000万人民币', '2001年04月05', '2023年09月25', '珠海市工商行政管理局', '2016-05-18', '在营（开业）企业', '珠海市南屏科技工业园屏东三路１２号', '根据《珠海经济特区商事登记条例》规定，经营范围由商事主体通过章程载明，不属商事主体登记事项。如需了解经营范围，可通过登录珠海市商事主体登记许可及信用信息公示平台查看商事主体章程。(依法须经批准的项目，经相关部门批准后方可开展经营活动)〓', null, null, '6', null, null, null, null, null, null, '2018-03-25', '290', '3.00', '3', '20180082');
INSERT INTO `table_supplier` VALUES ('240', '佛山市星光楼宇设备有限公司', '星光楼宇', '91440605730475366A', '张兵', 'http://www.csxgly.com/index.asp', '对讲机、智能锁', '2001-07-09', '有限责任公司(自然人投资或控股)', '2000.000000万人民币', '2001年07月09', null, '佛山市南海区市场监督管理局', '2017-09-05', '在营（开业）企业', '佛山市南海区狮山镇罗村广东新光源产业基地核心区内C区7座四层（1-11轴）', '组装生产、销售：楼宇对讲系统，智能仪表，塑料制品（不含农膜），金属制品（不含贵金属）；楼宇对讲系统安装及软件开发。', null, null, '6', null, null, null, null, null, null, '2018-03-25', '291', '3.00', '3', '20180083');
INSERT INTO `table_supplier` VALUES ('241', '深圳市捷顺科技实业股份有限公司', '深圳市捷', '914403002794141894', '唐健', 'http://www.jieshun.cn/index.html', '智能视频、门禁系统、停车场管理系统', '1992-06-17', '股份有限公司(上市)', '66694.260100万人民币', '1992年06月17', '5000年01月01', '深圳市市场监督管理局', '2017-10-26', '存续（在营、开业、在册）', '深圳市福田区梅林街道龙尾路10号捷顺科技', '自营进出口业务（按深管证字137号办）；国内商业、物资供销业（不含专营、专控、专卖商品），机电一体化产品、电控自动大门、交通管理设备设施及安防智能系统设备的安装、维修及产品的技术支持和保养服务（以上不含限制项目），经营进出口业务（法律、行政法规、国务院决定禁止的项目除外，限制的项目须取得许可后方可经营）。^智能卡、计算机软件的技术开发，机电一体化产品、电控自动大门、交通管理设备设施及安防智能系统设备的生产；依托互联网等技术手段，提供金融中介服务（根据国家规定需要审批的，获得审批后方可经营）。', null, null, '6', null, null, null, null, null, null, '2018-03-25', '292', '3.00', '3', '20180084');
INSERT INTO `table_supplier` VALUES ('242', '广州市保伦电子有限公司', '广州市保', '91440113677779116F', '王盛荣', 'http://www.itc-pa.cn/pro/index/fl/214.html', '可视对讲、广播、显示屏', '2008-07-25', '有限责任公司(自然人投资或控股)', '3105.000000万', '2008年07月25', null, '广州市番禺区工商行政管理局', '2016-11-01', '在营（开业）企业', '广州市番禺区钟村街钟村街工业B区1号楼', '计算机整机制造;通信系统设备制造;通信终端设备制造;广播电视节目制作及发射设备制造;广播电视接收设备及器材制造（不含卫星电视广播地面接收设施）;音响设备制造;影视录放设备制造;电子元件及组件制造;软件开发;货物进出口（专营专控商品除外）;技术进出口;电子、通信与自动控制技术研究、开发;安全技术防范产品制造;计算机应用电子设备制造;', null, null, '6', null, null, null, null, null, null, '2018-03-25', '293', '3.00', '3', '20180085');
INSERT INTO `table_supplier` VALUES ('243', '湖南华卓安防科技有限公司', '湖南华卓', '91430105MA4L5DFJ7R', '罗时江', 'http://www.71p.net/c7131942.html', '会议终端、摄像机', '2016-07-11', '有限责任公司(自然人投资或控股)', '1000.000000万人民币', '2016年07月11', '2066年07月10', '长沙市工商行政管理局开福分局', '2017-01-05', '存续（在营、开业、在册）', '长沙市开福区四方坪街道浏阳河路412号怡然·四方锦城A栋907号房', '安全技术防范系统设计、施工、维修；智能化安装工程服务；监控系统工程安装服务；多媒体设计服务；工程项目管理服务；信息系统集成服务；数据处理和存储服务；计算机技术开发、技术服务；城市及道路照明工程施工；计算机网络平台的建设与开发；水电安装；物联网技术、通讯产品的研发；通讯设备及配套设备批发；计算机辅助设备、计算机软件、教学仪器、办公用品、五金产品的销售。（依法须经批准的项目，经相关部门批准后方可开展经营活动）', null, null, '6', null, null, null, null, null, null, '2018-03-25', '294', '3.00', '3', '20180086');
INSERT INTO `table_supplier` VALUES ('244', '湖南融通光电科技有限公司', '湖南融通', '91430111MA4L6BP05D', '周德香', 'http://changsha0234434.11467.com/about.asp', '机柜、显示屏', '2016-09-09', '有限责任公司(自然人投资或控股)', '500.000000万人民币', '2016年09月09', '2066年09月08', '长沙市工商行政管理局雨花分局', '2016-09-09', '存续（在营、开业、在册）', '长沙市雨花区左家塘街道车站南路928号', '电子产品及配件的研究；电子技术转让；电子技术服务；信息系统集成服务；电力照明设备批发；销售标识牌、指示牌；电子产品及配件、机电产品、电子元件及组件、电子器材、公共标识灯箱、广告灯箱的销售。（依法须经批准的项目，经相关部门批准后方可开展经营活动）', null, null, '6', null, null, null, null, null, null, '2018-03-25', '295', '3.00', '3', '20180087');
INSERT INTO `table_supplier` VALUES ('245', '湖南海思达科技有限公司', '湖南海思', '914301020705887435', '蔡锦然', '', '无线对讲系统、周界防范系统、入侵报警系统、电子巡查系统', '2013-06-18', '有限责任公司(自然人独资)', '1000.000000万人民币', '2013年06月18', '2063年06月17', '长沙市工商行政管理局芙蓉分局', '2017-03-15', '存续（在营、开业、在册）', '湖南省长沙市芙蓉区湘湖街道车站北路70号万象新天公寓5号栋1809房', '电子、通信与自动控制技术研发；电气安装；园林绿化工程服务；电子商务平台的开发建设；计算机网络平台的建设与开发；通信系统设备制造（限分支机构）；架线和管道工程建筑；公路工程施工；自营和代理各类商品及技术的进出口，但国家限定公司经营或禁止进出口的商品和技术除外；软件开发；信息系统集成服务；警用装备器材、监控设备、机电产品的销售；电力照明设备、矿产品、建材及化工产品、消防设备及器材、通讯及广播电视设备的批发。（依法须经批准的项目，经相关部门批准后方可开展经营活动）', null, null, '6', null, null, null, null, null, null, '2018-03-25', '296', '3.00', '3', '20180088');
INSERT INTO `table_supplier` VALUES ('246', '长沙尚龙电子科技有限公司', '长沙尚龙', '91430111557625067B', '龚晓春', '', '门禁系统', '2010-06-25', '有限责任公司(自然人投资或控股)', '200.000000万人民币', '2010年06月25', '2040年06月24', '长沙市工商行政管理局雨花分局', '2018-01-09', '存续（在营、开业、在册）', '长沙市雨花区马王堆南路258号现代商贸城4栋904房', '电子产品、计算机及辅助设备、办公自动化设备、教学仪器、安防产品的研发、销售与维修；计算机软硬件开发；计算机系统集成；安防智能工程设计、施工与维护。（涉及行政许可的凭行政许可证经营）', null, null, '18', null, null, null, null, null, null, '2018-03-25', '297', '3.00', '3', '20180089');
INSERT INTO `table_supplier` VALUES ('247', '北京蛙视通信技术股份有限公司', '北京蛙视', '911101088020579148', '杨金枚', 'www.vorx.com.cn', '交换机.光端机.摄像机等', '2001-02-28', '股份有限公司(非上市、自然人投资或控股)', '5760.000000万人民币', '2001年02月28', '2021年02月27', '北京市工商行政管理局海淀分局', '2018-03-06', '开业', '北京市海淀区闵庄路3号清华科技园玉泉慧谷5号楼地上一层西侧101室', '通信技术、网络技术的开发、转让、咨询、服务、培训；销售开发后的产品、计算机及外围设备、通信设备、电讯器材；承接计算机网络工程；经营本企业自产产品及技术的出口业务和本企业所需的机械设备、零配件、原辅材料及技术的进口业务，但国家限定公司经营或禁止进出口的商品及技术除外；生产加工电子通信设备，视音频接入传输交换存储设备（限分支机构经营）（企业依法自主选择经营项目，开展经营活动；依法须经批准的项目，经相关部门批准后依批准的内容开展经营活动；不得从事本市产业政策禁止和限制类项目的经营活动。）', null, null, '7', null, null, null, null, null, null, '2018-03-25', '298', '3.00', '3', '20180090');
INSERT INTO `table_supplier` VALUES ('248', '沈阳海晨科技股份有限公司', '沈阳海晨', '91210100313277780Y', '王成海', 'www.haichentech.com', '交换机.摄像机.服务器', '2015-03-16', '股份有限公司(非上市、自然人投资或控股)', '500.000000万人民币', '2015年03月16', '2035年03月15', '沈阳市工商行政管理局', '2016-04-27', '存续（在营、开业、在册）', '沈阳市和平区三好街100号三层B106、107号', '电子原器件的研发，电子系统集成工程、楼宇对讲工程、弱电工程、监控设备安装及维修，装饰装修工程设计、施工，照明产品、电子产品、安防产品、计算机软硬件及辅助设备、电子原器件、汽车销售。（依法须经批准的项目，经相关部门批准后方可开展经营活动。）', null, null, '7', null, null, null, null, null, null, '2018-03-25', '299', '3.00', '3', '20180091');
INSERT INTO `table_supplier` VALUES ('249', '深圳市西迪特科技有限公司', '深圳市西', '91440300693988348L', '崔允良', 'www.cdatatec.com', '光纤接入', '2009-08-19', '有限责任公司', '659.898000万人民币', '2009年08月19', '2039年08月19', '深圳市市场监督管理局', '2018-02-09', '存续（在营、开业、在册）', '深圳市南山区桃源街道留仙大道1213号众冠红花岭工业南区2区4栋6楼西', '研发、生产、销售数据通信设备、无源光网络设备、视音频传输设备、宽带多媒体设备；计算机及配套设备、光电器材的销售；系统集成工程的设计及施工；终端设备及相关设备的维修；计算机软件技术开发、技术咨询服务；经营进出口业务（以上法律、行政法规、国务院决定禁止的项目除外，限制的项目须取得许可后方可经营）', null, null, '7', null, null, null, null, null, null, '2018-03-25', '300', '3.00', '3', '20180092');
INSERT INTO `table_supplier` VALUES ('250', '深圳市奕聪科技有限公司', '深圳市奕', '91440300070392871G', '刘钿', 'www.yicongkeji.com', '路由器.交换机.无线产品', '2013-05-31', '有限责任公司(自然人独资)', '100.000000万人民币', '2013年05月31', '5000年01月01', '深圳市市场监督管理局', '2017-08-29', '存续（在营、开业、在册）', '深圳市龙华新区龙华街道梅陇大道卫东龙科技大厦3楼314至317', '智能家居产品，智能门锁，电子产品的设计、销售；国内贸易；摄像电子产品，视频设备的研发、销售。^摄像电子产品、视频产品的生产。', null, null, '7', null, null, null, null, null, null, '2018-03-25', '301', '3.00', '3', '20180093');
INSERT INTO `table_supplier` VALUES ('251', '韩华泰科（天津）有限公司', '韩华泰科', '91120116681879152M', '千斗焕', 'http://www.te.com.cn/chn-zh/home.html', '传感器、连接器、电力系统等', '2008-12-22', '有限责任公司(中外合资)', '1000.000000万美元', '2008年12月22', '2038年12月21', '天津市滨海新区市场和质量监督管理局', '2017-10-17', '存续（在营、开业、在册）', '天津经济技术开发区微电子工业区微六路11号', '研究、开发、设计、生产、销售手机摄像头、电子元器件及移动通讯、数码照相机及相关零部件，视频展示台、监控系统及零部件、光学仪器、精密电机及相关产品，并提供售后服务；安全技术防范系统的设计、维修、销售、安装；软件系统管理服务；上述同类产品的进出口及批发业务（以上商品进出口不涉及国营贸易、进出口配额许可证、出口配额招标、出口许可证等商品，其他专项规定管理的商品按照国家有关规定办理）。（依法须经批准的项目，经相关部门批准后方可开展经营活动）', null, null, '7', null, null, null, null, null, null, '2018-03-25', '302', '3.00', '3', '20180094');
INSERT INTO `table_supplier` VALUES ('252', '深圳市科彤科技有限公司', '深圳市科', '91440300311937685K', '王晖', 'www.szktone.com', '液晶显示器', '2014-08-08', '有限责任公司', '1000.000000万人民币', '2014年08月08', '2034年08月08', '深圳市市场监督管理局', '2017-09-05', '存续（在营、开业、在册）', '深圳市福田区商报路7号天健创业大厦903室', '计算机数据库，计算机系统分析；提供计算机技术服务；从事信息技术、电子产品的技术开发、技术咨询、技术维护、技术转让；国内贸易（不含专营、专卖、专控商品）；经营进出口业务；投资兴办实业（具体项目另行申报）；电子元器件、集成电路、光电产品、半导体、太阳能产品、仪表配件、数字电视播放产品及通讯产品的技术开发及销售；智能交通产品的研发、道路交通设施的安装、研发与销售；测试设备的技术开发及销售；电子设备租赁；计算机软、硬件技术研发；计算机系统集成。（法律、行政法规、国务院决定禁止的项目除外，限制的项目须取得许可后方可经营）', null, null, '8', null, null, null, null, null, null, '2018-03-25', '303', '3.00', '3', '20180095');
INSERT INTO `table_supplier` VALUES ('253', '山东卓华光电科技有限公司', '山东卓华', '913701025537417577', '孙明存', 'www.voury.com', 'LED显示屏', '2010-07-01', '有限责任公司(自然人投资或控股)', '6000.000000万', '2010年07月01', null, '济南市历下区市场监督管理局', '2017-12-12', '在营（开业）企业', '济南市历下区华阳路69号留学人员创业园1号楼B410室', '计算机软硬件开发、技术咨询服务；显示屏、音响设备、电子产品、环保设备、监控设备、光电产品、节能产品、灯具、照明设备的生产、销售、安装、维修、租赁；计算机系统集成、综合布线；音视频系统集成；建筑智能化工程。（依法须经批准的项目，经相关部门批准后方可开展经营活动）', null, null, '8', null, null, null, null, null, null, '2018-03-25', '304', '3.00', '3', '20180096');
INSERT INTO `table_supplier` VALUES ('254', '深圳市思科瑞光电有限公司', '', '9144030058791541XP', '李成', '', '', '2011-12-21', '有限责任公司', '1000.000000万人民币', '2011年12月21', '2021年12月21', '深圳市市场监督管理局', '2017-03-27', '存续（在营、开业、在册）', '深圳市宝安区福永街道凤凰社区兴业一路2号（兴围第三工业区）第26栋第一、二、三层', 'LED显示屏、LED亮化工程的技术开发及销售；LED照明产品、光电产品、电子产品的销售；LED相关产品的租赁；国内贸易，货物及技术进出口。（法律、行政法规或者国务院决定禁止和规定在登记前须经批准的项目除外）^LED显示屏的生产。', null, null, '18', null, null, null, null, null, null, '2018-03-25', '305', '3.00', '3', '20180097');
INSERT INTO `table_supplier` VALUES ('255', '创维集团有限公司', '', '9144030071529193X1', '赖伟德', '', '', '2000-06-07', '有限责任公司(台港澳与境内合资)', '183000.000000万香港元', '2000年06月07', '2030年06月07', '深圳市市场监督管理局', '2017-11-20', '存续（在营、开业、在册）', '深圳市前海深港合作区前湾一路1号A栋201室（入驻深圳市前海商务秘书有限公司）实际经营场所：深圳市南山区粤海街道高新南四道18号创维半导体设计大厦东座22-24层', '（一）在中国政府鼓励和允许外商投资的领域依法进行投资。（二）受其所投资企业的书面委托（经董事会一致通过），向其所投资企业提供下列服务：1、协助或代理公司所投资企业从国内外采购该企业自用的机器设备、办公设备和生产所需的原材料、元器件、零部件和在国内外销售其所投资企业生产的产品，并提供售后服务；2、在外汇管理部门的同意和监督下，在其所投资企业之间平衡外汇；3、为公司所投资企业提供产品生产、销售和市场开发过程中的技术支持、员工培训、企业内部人事管理等服务；4、协助其所投资的企业寻求贷款及提供担保。（三）在中国境内设立科研开发中心或部门，从事新产品及高新技术的研究开发，转让其研究开发成果，并提供相应的技术服务。（四）为其投资者提供咨询服务，为其关联公司提供与其投资有关的市场信息、投资政策等咨询服务。（五）承接外国公司和其母公司之关联公司的服务外包业务，承接境外公司的服务外包业务。（六）从事母公司及其关联公司、子公司所生产产品的进出口、批发、佣金代理（拍卖除外），并提供相关配套服务（涉及配额许可证管理、专项规定管理的商品按照国家有关规定办理）。从事高清晰度电视、数字彩色电视机、大屏幕彩色投影电视、等离子电视、高画质激光视盘、数字音视频广播系统及产品、视听器材、通讯器材、新型电子元器件、电子商务、电子网络技术、上网终端设备等电子信息产品的技术开发、研究业务，并从事校园、社区网络化建设的研究业务。家用电器产品的批发、进出口及相关配套业务（不涉及国营贸易管理商品，涉及配额、许可证管理及其它专项规定管理的商品，按国家有关规定办理申请）；实业项目投资咨询，经济信息咨询，货物及技术进出口（不含分销），家用电器产品的技术咨询、技术服务。', null, null, '18', null, null, null, null, null, null, '2018-03-25', '306', '3.00', '3', '20180098');
INSERT INTO `table_supplier` VALUES ('256', '中星电子股份有限公司', '', '9112000068188738XM', '邓中翰', '', '', '2008-12-29', '股份有限公司', '50000.000100万人民币', '2008年12月29', null, '天津市滨海新区市场和质量监督管理局', '2017-11-29', '存续（在营、开业、在册）', '天津经济技术开发区信环南街31号', '安全技术防范系统工程设计、施工；建筑智能化工程设计、施工；研究、开发、设计集成电路及软件、计算机软硬件、电子元器件、机械电器设备、通讯设备、移动通讯终端设备、医疗电子设备、终端设备；计算机系统集成；电子产品的研发、设计、生产和销售；电子设备安装；上述产品的技术咨询、技术服务；货物及技术的进出口；对高新技术产业、制造业、贸易业进行投资及咨询服务；自有房产租赁。（依法须经批准的项目，经相关部门批准后方可开展经营活动）', null, null, '18', null, null, null, null, null, null, '2018-03-25', '307', '1.50', '3', '20180099');
INSERT INTO `table_supplier` VALUES ('257', '东芝电子（中国）有限公司', '', '913100006073512375', '岡本 成之', '', '', '1996-04-17', '有限责任公司(外商合资)', '705.000000万美元', '1996年04月17', '2026年04月16', '自由贸易试验区市场监管局', '1996-04-17', '存续（在营、开业、在册）', '中国（上海）自由贸易试验区意威路280号76#楼第二层B部位', '区内以电子产品为主的仓储（除危险品）、分拨业务；在区内从事有关电气、电子行业的技术咨询和售后服务；电子产品的研发；国际贸易及贸易咨询；区内企业间贸易及区内贸易代理；区内商业性简单加工。电子、电气产品及其零部件、关联软件的批发、进出口、佣金代理（拍卖除外）以及其他相关配套业务；企业管理咨询业务。（以上商品进出口不涉及国营贸易、进出口配额许可证、出口配额招标、出口许可证等专项管理的商品）。 【依法须经批准的项目，经相关部门批准后方可开展经营活动】', null, null, '18', null, null, null, null, null, null, '2018-03-25', '308', '3.00', '3', '20180100');
INSERT INTO `table_supplier` VALUES ('258', '杭州天夏科技集团有限公司', '', '913301087360154676', '夏建统', '', '', '2002-02-08', '有限责任公司（非自然人投资或控股的法人独资）', '7500.000000万人民币', '2002年02月08', '2022年02月07', '杭州市高新区（滨江）市场监督管理局', '2017-07-24', '存续', '杭州市滨江区六和路368号1幢北四楼A4068室', '技术开发、技术服务、技术咨询、成果转让：计算机网络系统安装，计算机系统集成，计算机软、硬件及外部设备；技术及货物进出口（法律、行政法规禁止经营的项目除外，法律、行政法规限制经营的项目取得许可后方可经营）；服务：经营测绘业务，成年人的非文化教育培训（涉及前置审批的项目除外）；设计、制作：国内广告；其他无需报经审批的一切合法项目。', null, null, '18', null, null, null, null, null, null, '2018-03-25', '309', '3.00', '3', '20180101');
INSERT INTO `table_supplier` VALUES ('259', '长沙晶旭光电科技有限公司', '', '9143011132942241XM', '苏万红', '', '', '2015-02-09', '有限责任公司(自然人投资或控股)', '100.000000万人民币', '2015年02月10', '2065年02月08', '长沙市工商行政管理局雨花分局', '2017-02-28', '存续（在营、开业、在册）', '长沙市雨花区雨花亭街道石马社区蒋家垅老屋组环宇广告城B3栋1-7号', '电力照明设备、电子产品的批发；电气机械设备、光电惯导系统软件及产品的销售。（依法须经批准的项目，经相关部门批准后方可开展经营活动）', null, null, '18', null, null, null, null, null, null, '2018-03-25', '310', '3.00', '3', '20180102');
INSERT INTO `table_supplier` VALUES ('260', '长沙辉联电子有限公司', '', '91430102MA4L2KF55Y', '李映辉', '', '', '2016-01-13', '有限责任公司(自然人独资)', '50.000000万人民币', '2016年01月13', '2066年01月12', '长沙市工商行政管理局芙蓉分局', '2016-08-12', '存续（在营、开业、在册）', '湖南省长沙市芙蓉区朝阳街街道车站中路193号1305房', '电子产品、计算机、计算机软件、计算机辅助设备、监控设备的销售；计算机零配件、办公设备耗材、软件的批发；计算机及通讯设备租赁；计算机、办公设备和专用设备维修；监控系统工程安装服务；信息系统集成服务；计算机网络系统工程服务；计算机技术开发、技术服务；信息技术咨询服务；数据处理和存储服务。（依法须经批准的项目，经相关部门批准后方可开展经营活动）', null, null, '18', null, null, null, null, null, null, '2018-03-25', '311', '3.00', '3', '20180103');
INSERT INTO `table_supplier` VALUES ('261', '湖南友利莱贸易有限公司', '', '91431300MA4L1N6L1N', '伍莉', '', '', '2015-11-13', '有限责任公司(自然人投资或控股)', '1000.000000万人民币', '2015年11月13', '2065年11月12', '娄底市工商行政管理局经济技术开发区分局', '2018-02-07', '存续（在营、开业、在册）', '湖南省娄底市经济开发区大汉路香茅街丹枫国际0004幢523号', '电器代理批发；文化办公用品、生活用品、日用百货、针纺织品、礼品、化妆品、洗涤用品、预包装食品、保健食品、家居护理用品、工艺品、床上用品、通讯设备器材、五金交电、建材、体育用品、化工原料、电脑软硬件、电脑耗材、酒店用品、消防设备、钢材、机电产品、冶金设备、环保产品、包装材料、工程机械设备、玻璃制品、电子元件、花卉苗木、家具销售；太阳能杀虫灯的销售及安装。（依法须经批准的项目，经相关部门批准后方可开展经营活动）', null, null, '18', null, null, null, null, null, null, '2018-03-25', '312', '3.00', '3', '20180104');
INSERT INTO `table_supplier` VALUES ('262', '北京尚易德科技有限公司', '', '91110111689242279Y', '谷桐宇', '', '', '2009-04-30', '其他有限责任公司', '5000.000000万人民币', '2009年04月30', '2029年04月29', '北京市工商行政管理局房山分局', '2017-08-08', '开业', '北京市房山区阎村镇阎富路环岛西210米', '技术开发、技术转让、技术咨询（中介除外）、技术服务；计算机技术培训（不得面向全国招生）；计算机系统服务；销售计算机、计算机软件及辅助设备、机械设备、电子产品、通讯设备（卫星接收设备除外）、仪器仪表；企业管理咨询（中介除外）；机械设备租赁；会议服务；技术进出口；代理进出口；货物进出口（国营贸易管理货物除外）；专业承包。（企业依法自主选择经营项目，开展经营活动；依法须经批准的项目，经相关部门批准后依批准的内容开展经营活动；不得从事本市产业政策禁止和限制类项目的经营活动。）', null, null, '18', null, null, null, null, null, null, '2018-03-25', '313', '3.00', '3', '20180105');
INSERT INTO `table_supplier` VALUES ('263', '重庆中科云丛科技有限公司', '', '91500000339540962G', '周曦', '', '', '2015-05-04', '有限责任公司', '6000.000000万', '2015年05月04', null, '重庆两江新区市场和质量监督管理局', '2016-11-02', '存续(在营、开业、在册)', '重庆市渝北区金开大道西段106号5幢5层', '计算机软硬件的开发、制造、销售；技术咨询、技术服务、技术外包、技术转让；计算机及配件、电子产品（不含电子出版物）、通讯器材（不含卫星广播电视接收设施）的安装及维修；网络技术服务及系统集成；从事建筑相关业务（凭资质执业）。（以上经营范围法律、法规禁止的不得经营；法律、法规限制的取得许可或审批后方可经营）**', null, null, '18', null, null, null, null, null, null, '2018-03-25', '314', '3.00', '3', '20180106');
INSERT INTO `table_supplier` VALUES ('264', '杭州立捷科技有限公司', '', '91330108MA28WCLA0C', '赵问道', '', '', '2017-07-31', '有限责任公司(自然人投资或控股)', '100.000000万人民币', '2017年07月31', '9999年09月09', '杭州市高新区（滨江）市场监督管理局', '2017-07-31', '存续', '浙江省杭州市西湖区文二路391号西湖国际科技大厦6号楼5层534室', '技术开发、技术咨询、技术服务、成果转让：通信技术、计算机软硬件、图像传输设备、工业自动化控制技术、计算机网络技术、无线遥控设备；销售：计算机软硬件、安防器材、电器机械、仪器仪表、电子产品；承接：安防工程（凭资质经营）。（依法须经批准的项目，经相关部门批准后方可开展经营活动）', null, null, '18', null, null, null, null, null, null, '2018-03-25', '315', '3.00', '3', '20180107');
INSERT INTO `table_supplier` VALUES ('265', '金鹏电子信息机器有限公司湖南分公司', '', '914301035827818547', '唐毅', '', '', '2011-09-29', '有限责任公司分公司(自然人投资或控股)', '', '2011年09月29', null, '长沙市工商行政管理局天心分局', '2016-04-14', '存续（在营、开业、在册）', '长沙市天心区芙蓉南路一段788号建工新城综合楼613房。', '增值电信服务（业务种类以《增值电信业务经营许可证》载明内容为准）;软件批发;软件服务;监控系统工程安装服务;软件开发;软件零售;计算机网络系统工程服务;计算机及通讯设备租赁;通信设施安装工程服务;信息系统集成服务;计算机技术开发、技术服务;信息技术咨询服务;计算机零售;计算机零配件零售;办公设备耗材零售;通信设备零售;安全技术防范产品零售;电子产品零售;计算机批发;计算机零配件批发;办公设备批发;电子产品批发;安全技术防范产品批发;通讯设备及配套设备批发;', null, null, '18', null, null, null, null, null, null, '2018-03-25', '316', '3.00', '3', '20180108');
INSERT INTO `table_supplier` VALUES ('266', '武汉烽火众智数字技术有限责任公司 ', '', '9142010058181997XW', '夏存海', '', '', '2011-09-12', '其他有限责任公司', '27930.000000万元人民币', '2011年09月12', null, '武汉东湖新技术开发区市场监督管理局', '2017-07-03', '存续（在营、开业、在册）', '武汉市洪山区邮科院路88号', '电子产品、网络通信产品的设计、开发、生产及销售；计算机软件的开发、服务、销售；电子工程及智能系统工程的设计、施工、系统集成及维护；安全技术防范工程设计、施工、维修；通信工程、设备安装工程施工；道路交通安全设施安装工程实施；防雷工程专业设计、施工；市政公用工程设计、施工；货物进出口、代理进出口、技术进出口（不含国家禁止进出口的货物及技术）。（依法须经审批的项目，经相关部门审批后方可开展经营活动）', null, null, '18', null, null, null, null, null, null, '2018-03-25', '317', '3.00', '3', '20180109');
INSERT INTO `table_supplier` VALUES ('267', '天津普泰国信科技有限公司', '', '91120116091562294H', '孙贞文', '', '', '2014-01-24', '有限责任公司', '1500.000000万人民币', '2014年01月24', '2034年01月23', '天津市滨海新区市场和质量监督管理局', '2018-01-15', '存续（在营、开业、在册）', '天津滨海高新区华苑产业区海泰发展六道6号海泰绿色产业基地K1座6门501-8室', '计算机软硬件技术的开发、咨询、服务、转让；计算机信息系统集成服务；建筑智能化安装工程服务；电子产品、文具用品、文化办公用机械、机械设备、五金、仪器仪表、电子元器件、装饰装修材料、计算机及辅助设备批发兼零售；商务信息咨询；安全防范系统设计和安装；工业自动化控制设备、通讯设备的制造。（依法须经批准的项目，经相关部门批准后方可开展经营活动）', '未依照《企业信息公示暂行条例》第八条规定的期限公示年度报告的', null, '18', null, null, null, null, null, null, '2018-03-25', '318', '3.00', '3', '20180110');
INSERT INTO `table_supplier` VALUES ('268', '深圳警翼智能科技股份有限公司', '', '91440300557165881T', '荣勤', '', '', '2010-06-18', '股份有限公司(非上市)', '6000.000000万人民币', '2010年06月18', '5000年01月01', '深圳市市场监督管理局', '2016-12-20', '存续（在营、开业、在册）', '深圳市南山区粤海街道滨海大道深圳市软件产业基地5栋E座1102', '电子产品、摄录机、视音频执法记录仪、特种计算机、执法数据采集设备的技术开发、技术转让、销售；软件的开发、销售与维护；计算机技术开发及相关的技术信息咨询；经营进出口业务；通讯产品、无线数据终端、手机的研发、销售。（以上法律、行政法规、国务院决定禁止的项目除外，限制的项目须取得许可后方可经营）^电子产品、摄录机、视音频执法记录仪、特种计算机、执法数据采集设备的生产；通讯产品、无线数据终端、手机的生产。', null, null, '18', null, null, null, null, null, null, '2018-03-25', '319', '3.00', '3', '20180111');
INSERT INTO `table_supplier` VALUES ('269', '深圳市法马新智能设备有限公司', '', '91440300062723765U', '杨朝友', '', '', '2013-02-01', '有限责任公司', '542.852212万人民币', '2013年02月01', null, '深圳市市场监督管理局', '2018-01-29', '存续（在营、开业、在册）', '深圳市宝安区西乡街道三围社区奋达高新科技园C栋4楼北', '计算机软硬件、智能交通控制系统、塑胶产品的技术开发与销售；交通工程施工；国内贸易；货物及技术进出口。^电子产品、智能交通设备、LED光电照明、交通设施、机电设备、五金材料的生产、销售及相关技术咨询。', null, null, '18', null, null, null, null, null, null, '2018-03-25', '320', '3.00', '3', '20180112');
INSERT INTO `table_supplier` VALUES ('270', '深圳市宏晟华业科技有限公司', '', '91440300564248108Q', '谢盛洪', '', '', '2010-10-26', '有限责任公司', '500.000000万人民币', '2010年10月26', '5000年01月01', '深圳市市场监督管理局', '2017-05-23', '存续（在营、开业、在册）', '深圳市龙华新区大浪街道华荣路506号日鑫科技园A2栋3栋', '安全技术防范产品、电子产品的技术开发、销售、上门安装维护；汽车租赁；加气站设备及配件的技术开发、销售、上门安装维护（不含易燃、易爆化学危险品）；国内贸易，从事货物及技术的进出口业务（法律、行政法规、国务院决定规定在登记前须经批准的除外）。（企业经营涉及前置性行政许可的，须取得前置性行政许可文件后方可经营）^安全技术防范产品、电子产品、加气站设备及配件的生产（不含易燃、易爆化学危险品）。', null, null, '18', null, null, null, null, null, null, '2018-03-25', '321', '3.00', '3', '20180113');
INSERT INTO `table_supplier` VALUES ('271', '广东佐都科技有限公司', '', '91440101MA59G2H724', '王宏业', '', '', '2016-11-16', '有限责任公司(自然人投资或控股)', '1000.000000万', '2016年11月16', null, '广州市白云区工商行政管理局', '2016-11-16', '在营（开业）企业', '广州市白云区松洲街槎龙村聚龙村47号203房', '计算机整机制造;计算机零部件制造;计算机应用电子设备制造;音响设备制造;其他办公设备维修;货物进出口（专营专控商品除外）;技术进出口;电子设备工程安装服务;舞台灯光、音响设备安装服务;通信系统设备制造;通信设施安装工程服务;计算机批发;计算机零配件批发;软件批发;办公设备耗材批发;通讯设备及配套设备批发;通讯终端设备批发;广播设备及其配件批发;计算机零售;计算机零配件零售;软件零售;办公设备耗材零售;通信设备零售;安全技术防范产品零售;电子元器件零售;电子产品零售;消防设备、器材的制造;消防设备、器材的批发;消防设备、器材的零售;商品批发贸易（许可审批类商品除外）;商品零售贸易（许可审批类商品除外）;贸易代理;通信终端设备制造;广播电视节目制作及发射设备制造;广播电视接收设备及器材制造（不含卫星电视广播地面接收设施）;影视录放设备制造;电子元件及组件制造;电子、通信与自动控制技术研究、开发;安全技术防范产品制造;', null, null, '18', null, null, null, null, null, null, '2018-03-25', '322', '3.00', '3', '20180114');
INSERT INTO `table_supplier` VALUES ('272', '长沙美科信息技术有限公司', '长沙美科', '91430111578633787Q', '廖步青', '', '音响、话筒', '2011-07-27', '有限责任公司(自然人投资或控股)', '2200.000000万人民币', '2011年07月27', '2061年07月26', '长沙市工商行政管理局雨花分局', '2017-10-25', '存续（在营、开业、在册）', '长沙市雨花区高桥火焰D区上河国际商业广场C8幢1710号', '信息技术咨询服务；信息系统集成服务；灯光设备租赁；软件开发；综合布线；展览器材租赁；会议及展览服务；空调设备安装；空调设备维护；电子商务平台的开发建设；水文服务；防盗系统的设计、安装；建筑工程后期装饰、装修和清理；舞台灯光、音响设备、电子设备工程的安装服务；机械设备、五金产品及电子产品、家用电器的批发；教学仪器、文化用品、建筑材料、空调设备、照相器材的销售；办公设备的零售；安防系统工程、展览陈列工程设计与的施工。（依法须经批准的项目，经相关部门批准后方可开展经营活动）', null, null, '10', null, null, null, null, null, null, '2018-03-25', '323', '4.00', '3', '20180115');
INSERT INTO `table_supplier` VALUES ('273', '广州雄音电子科技有限公司', '广州雄音', '91440113340165098G', '杨红', 'http://www.oniter.com/', 'http://www.oniter.com/', '2015-05-05', '有限责任公司(自然人独资)', '1008.000000万', '2015年05月05', '背景音乐公共广播系统、会议扩声系统、中控系统、无纸化系统的系列产品', '广州市番禺区工商行政管理局', '2016-12-23', '在营（开业）企业', '广州市番禺区洛浦街105国道上漖路段大新商务广场412', '电子、通信与自动控制技术研究、开发;电子元器件零售;电子产品零售;电子产品批发;广播设备及其配件批发;商品批发贸易（许可审批类商品除外）;商品零售贸易（许可审批类商品除外）;电子元器件批发;', null, null, '10', null, null, null, null, null, null, '2018-03-25', '324', '4.00', '3', '20180116');
INSERT INTO `table_supplier` VALUES ('274', '郴州市宏图网络科技有限公司', '郴州市宏', '91431002570257502C', '何承恩', '', '视频会议终端、摄像机', '2011-03-01', '有限责任公司(自然人投资或控股)', '300.000000万人民币', '2011年03月01', null, '郴州市工商行政管理局北湖分局', '2016-05-23', '存续（在营、开业、在册）', '郴州市北湖区火车站广场北侧湖南弘扬公司郴州电脑城二期1303', '计算机网络技术；智能电子产品的研发、技术咨询、技术服务；网络视频制作、推广服务；网络集成；安防监控；综合布线工程的设计、安装、维护；公共广播与视频会议系统安装、维护。（依法须经批准的项目，经相关部门批准后方可开展经营活动）', null, null, '10', null, null, null, null, null, null, '2018-03-25', '325', '3.00', '3', '20180117');
INSERT INTO `table_supplier` VALUES ('275', '长沙洲远科技智能科技有限公司', '长沙洲远', '91430102072640007U', '罗伟文', '', '音视频会议系统及相关配件', '2013-07-16', '有限责任公司(自然人投资或控股)', '100.000000万人民币', '2013年07月16', '2063年07月15', '长沙市工商行政管理局芙蓉分局', '2017-11-06', '存续（在营、开业、在册）', '湖南省长沙市芙蓉区东二环二段221号星典时代新寓7、8、9栋8-2103', '智能设备、电子产品、计算机软硬件及辅助设备的研发、销售；计算机网络技术的研发；计算机系统集成；音响设备、照明设备的设计、安装、技术咨询及技术服务。（不含前置审批和许可项目，涉及行政许可的凭许可证经营）', null, null, '10', null, null, null, null, null, null, '2018-03-25', '326', '3.00', '3', '20180118');
INSERT INTO `table_supplier` VALUES ('276', '长沙德湘信息技术有限公司', '长沙德湘', '914301000919999046', '邱正友', '', '视频会议，视频终端', '2014-02-12', '有限责任公司(自然人投资或控股)', '1080.000000万人民币', '2014年02月12', '2064年02月11', '长沙市工商行政管理局高新技术产业开发分局', '2017-01-22', '存续（在营、开业、在册）', '长沙高新开发区谷园路109号像素大厦2501房', '监控设备、办公用品、计算机软件的销售；电子产品批发；综合布线；软件开发；信息系统集成服务；信息技术咨询服务；集成电路设计；通信线路和设备的安装；监控系统工程安装服务；计算机网络系统工程服务；安全技术防范系统设计、施工、维修；人防工程防护设备的安装；工程机械维修服务；计算机、办公设备和专用设备维修；弱电工程总承包；通讯技术研发；通信工程设计服务；信息电子技术服务。（依法须经批准的项目，经相关部门批准后方可开展经营活动）', null, null, '10', null, null, null, null, null, null, '2018-03-25', '327', '3.00', '3', '20180119');
INSERT INTO `table_supplier` VALUES ('277', '长沙世邦通信技术有限公司', '长沙世邦', '91430100768015621G', '余求是', 'www.spon.com.cn', 'IP网络内部通信对讲系统', '2004-10-20', '有限责任公司(自然人投资或控股)', '6800.000000万人民币', '2004年10月20', '2054年10月19', '长沙市工商行政管理局高新技术产业开发分局', '2017-06-06', '存续（在营、开业、在册）', '长沙高新开发区麓谷街道南塘路70号', '通讯设备（不含卫星广播电视接发收设备）、计算机软件和硬件、科教设备、实验室设备、网络设备的研究、开发、生产和销售及其相关的技术服务，网络设计及其系统集成服务，计算机及其配件的销售；安防工程设备的设计、生产、施工与维护。（依法须经批准的项目，经相关部门批准后方可开展经营活动）', null, null, '11', null, null, null, null, null, null, '2018-03-25', '328', '3.00', '3', '20180120');
INSERT INTO `table_supplier` VALUES ('278', '安徽创世科技股份有限公司', '安徽创世', '91340100738932883G', '翁世华', 'http://www.crearo.com/', '执法记录仪', '2002-06-27', '股份有限公司(中外合资、未上市)', '3966.570600万人民币', '2002年06月27', null, '安徽省工商行政管理局', '2016-04-18', '存续（在营、开业、在册）', '合肥市高新区梦园路12号信息产业园2号楼', '网络、通信相关领域的软、硬件产品的开发、生产、销售、咨询与服务，以及系统集成和安防工程。（依法须经批准的项目，经相关部门批准后方可开展经营活动）', null, null, '11', null, null, null, null, null, null, '2018-03-25', '329', '3.00', '3', '20180121');
INSERT INTO `table_supplier` VALUES ('279', '海湾安全技术有限公司', '海湾安全', '911303001053734526', '潘叶青', 'http://www.gst.com.cn/', '火灾报警系统供应商', '2000-04-25', '有限责任公司(外国法人独资)', '3628.000000万美元', '2000年04月25', '2024年04月15', '秦皇岛市工商行政管理局', '2016-01-08', '存续（在营、开业、在册）', '河北省秦皇岛开发区长江东道80号', '电子专用设备（火灾自动报警设备及消防联动控制设备、建筑电气设备、自动灭火设备、楼宇自动化控制设备、住宅小区智能化设备、可视对讲设备、应急疏散设备、电气火灾设备、消防远程监控设备）、监测仪器（可燃气体探测报警设备）、工模具、软件产品的设计、生产、销售、服务。与上述自产产品同类商品和相关电线电缆的委托加工、批发及相关配套业务（涉及配额许可证管理的商品按国家有关规定办理）。消防设施维护保养、检测、消防安全评估、消防系统升级与改造。（依法须经批准的项目，经相关部门批准后方可开展经营活动）', null, null, '12', null, null, null, null, null, null, '2018-03-25', '330', '3.00', '3', '20180122');
INSERT INTO `table_supplier` VALUES ('280', '深圳市泛海三江电子股份有限公司', '深圳市泛', '91440300618915595E', '李明海', 'http://www.fhsjdz.com/', '消防报警', '1994-10-26', '股份有限公司(非上市)', '6000.000000万人民币', '1994年10月26', '5000年01月01', '深圳市市场监督管理局', '2016-12-22', '存续（在营、开业、在册）', '深圳市南山区南山大道光彩新天地公寓三层（仅作办公）', '消防设施工程专业承包壹级；消防设施专项工程设计乙级；进出口业务；楼宇智能系统的设计、安装；安全防范工程的设计、施工、维修（以上生产项目均由分公司经营，另行申办营业执照）。^研发、生产经营仪器、仪表、传感器、控制器（监控设备）；楼宇智能化系列产品的研发、生产、销售。', null, null, '12', null, null, null, null, null, null, '2018-03-25', '331', '3.00', '3', '20180123');
INSERT INTO `table_supplier` VALUES ('281', '希捷科技（苏州）有限公司 ', '希捷科技', '91320594745585189E', 'DAVID H MORTON JR', 'http://suzhou0209896.11467.com/', '网络硬盘', '2003-01-27', '有限责任公司(台港澳法人独资)', '28667.000000万美元', '2003年01月27', '2053年02月05', '苏州工业园区市场监督管理局', '2018-01-05', '存续（在营、开业、在册）', '苏州工业园区苏虹中路200号出口加工区吴巷路1号', '研究、开发、制造、加工各类光、磁盘驱动器、其他驱动器及其部件、各类计算机存储软件和系统及其部件、各类计算机周边产品及其部件，销售本公司所生产的产品并提供维修等售后服务及有关的技术及咨询服务。（依法须经批准的项目，经相关部门批准后方可开展经营活动）', null, null, '13', null, null, null, null, null, null, '2018-03-25', '332', '3.00', '3', '20180124');
INSERT INTO `table_supplier` VALUES ('282', '紫光西部数据有限公司', '西部数据', '91320100MA1MGWPF5C', '章雷', 'https://www.wdc.com/zh-cn/about-wd.html#', '存储设备、个人云', '2016-03-28', '有限责任公司(中外合资)', '15800.000000万美元', '2016年03月28', null, '南京市工商行政管理局', '2016-03-28', '存续（在营、开业、在册）', '南京市秦淮区永智路6号', '数据分析；存储装置、存储系统和计算机软、硬件系统研发、销售、进出口；相关技术咨询、技术服务。（依法须经批准的项目，经相关部门批准后方可开展经营活动）', null, null, '13', null, null, null, null, null, null, '2018-03-25', '333', '3.00', '3', '20180125');
INSERT INTO `table_supplier` VALUES ('283', '株洲蝶依斓布艺有限公司', '株洲蝶依', '914302117808875533', '周石旺', 'http://hxsfkbmyuibkjkt.shengyidi.com/', '布艺沙发，布艺窗帘，软体床', '2005-11-14', '有限责任公司(自然人投资或控股)', '200.000000万人民币', '2005年11月14', '2005年11月14', '株洲市工商行政管理局天元分局', '2017-10-30', '存续（在营、开业、在册）', '天元区家家乐路', '布艺沙发、布艺窗帘、布艺床及其它布艺用品生产、销售。', null, null, '15', null, null, null, null, null, null, '2018-03-25', '334', '3.00', '3', '20180126');
INSERT INTO `table_supplier` VALUES ('284', '湖南锐思信息技术有限公司', '湖南锐思', '914301025932550249', '余萍', '', '内网服务器、虚拟化系统软件，外网服务器，智能网交换机，内网路由器，内网光模块，内网网管等', '2012-03-27', '有限责任公司(自然人投资或控股)', '200.000000万', '2012年03月27', '2062年03月26', '长沙市工商行政管理局芙蓉分局', '2016-03-07', '存续（在营、开业、在册）', '长沙市芙蓉区车站中路21号鸿运凯旋国际A1308房', '信息技术开发；计算机软件开发、销售、维护及技术转让；办公自动化设备、数码产品、电子产品的销售；网络系统集成、综合布线；广播系统、安防系统、安全技术防范系统的设计、安装、维护。（涉及行政许可的凭许可证或资质证经营）', null, null, '18', null, null, null, null, null, null, '2018-03-25', '335', '3.00', '3', '20180127');
INSERT INTO `table_supplier` VALUES ('285', '湖南天普云网络有限公司', '湖南天普', '914301003384467208', '鲁忆明', 'http://www.tianpuyun.com/', '智能WIFI', '2015-05-05', '有限责任公司(自然人独资)', '621.951200万人民币', '2015年05月05', null, '长沙市工商行政管理局高新技术产业开发区分局', '2017-12-26', '存续（在营、开业、在册）', '长沙高新开发区麓谷大道662号软件中心大楼专业楼、孵化楼后栋4楼407房', '网络技术的研发；软件开发；数字动漫制作；信息技术咨询服务；游戏软件设计制作；集成电路设计；地理信息加工处理；移动通信转售业务；增值电信服务；药品、医疗器械互联网信息服务；信息系统集成服务；数据处理和存储服务；自营和代理各类商品及技术的进出口，但国家限定公司经营或禁止进出口的商品和技术除外；果蔬仓储管理信息系统集成；通信基站技术咨询；智能电网技术咨询；互联网接入及相关服务；软件、计算机、监控设备、办公设备耗材、计算机零配件的销售；通信设备、安全技术防范产品、自动售货机、售票机、柜员机及零配件的零售。（依法须经批准的项目，经相关部门批准后方可开展经营活动）', null, null, '16', null, null, null, null, null, null, '2018-03-25', '336', '3.00', '3', '20180128');
INSERT INTO `table_supplier` VALUES ('286', '郴州市瑞昌贸易有限公司', '郴州市瑞', '91431000687417645H', '游宇', '', '空调采购及线控器', '2009-04-09', '有限责任公司(自然人投资或控股)', '300.000000万人民币', '2009年04月09', null, '郴州市工商行政管理局北湖分局', '2017-11-21', '存续（在营、开业、在册）', '湖南省郴州市北湖区国庆北路29号海郴园8栋2楼274、275号', '中央空调、制冷设备、机电设备的销售、设计、安装及维修；家用电器的销售、安装及维修；办公用品、劳保用品、电力器材、五金、日杂用品销售；电梯销售及售后服务。（未经批准，不得以公开方式募集资金、不得吸收存款、不得发放贷款、不得向投资者承诺投资本金不受损失或承诺最低收益）（依法须经批准的项目，经相关部门批准后方可开展经营活动）', '未按照规定报送年度报告', null, '17', null, null, null, null, null, null, '2018-03-25', '337', '3.00', '3', '20180129');
INSERT INTO `table_supplier` VALUES ('287', '湖南海容科技有限公司', '湖南海容', '91430111670754848G', '夏苹', '', '机房建设', '2008-01-07', '有限责任公司(自然人投资或控股)', '10008.000000万人民币', '2008年01月07', '2058年01月06', '长沙市工商行政管理局雨花分局', '2017-08-07', '存续（在营、开业、在册）', '长沙市雨花区湘府东路二段99号汇艺文创中心11栋705房', '计算机技术开发、技术服务；智能化技术服务；工程技术；电气安装；管道和设备安装；建筑装饰；电力工程施工；城乡基础设施建设；房屋建筑工程施工；架线和管道工程建筑；其他土木工程建筑；建设工程施工；防雷工程专业施工；安全技术防范系统设计、施工、维修；承装（承修、承试）电力设施；建筑幕墙工程计算机技术开发、技术服务；智能化技术服务；专业承包；从事所有电压等级电力设施的安装、维修或者试验活动；机械设备、五金产品及电子产品批发；软件开发；软件技术服务；信息系统集成服务；电力信息系统的设计、开发、维护；信息技术咨询服务；电源设备服务；电子产品服务；家用电器及电子产品、文化、体育用品及器材、五金、家具及室内装饰材料的零售；机电设备、建筑钢结构、预制构件工程的安装服务；日用品、多媒体系统、中央空调系统、液晶显示屏、暖通设备、电源设备的销售；电气设备系统集成、服务。（依法须经批准的项目，经相关部门批准后方可开展经营活动）', null, null, '18', null, null, null, null, null, null, '2018-03-25', '338', '3.00', '3', '20180130');
INSERT INTO `table_supplier` VALUES ('288', '动力盈科实业（深圳）有限公司', '动力盈科', '92150902MA0N4J5T0B', '张磊', 'http://videotrec.tpy888.cn/', '数字监控系统', '2011-08-30', '个体工商户（个人经营）', null, null, null, '乌兰察布市工商行政管理局集宁分局', '2017-02-16', '存续（在营、开业、在册）', '内蒙古自治区乌兰察布市集宁新区兴和路南侧丰镇街西侧', '许可经营项目：三类【发动机、四轮定位检测调整】维修服务。 一般经营项目：无\n', null, null, '3', null, null, null, null, null, null, '2018-03-26', '339', '3.00', '3', '20180131');
INSERT INTO `table_supplier` VALUES ('291', '深圳市西骏科技有限公司 ', 'KOONTECH', '91440300676670346K', '谢特斌 ', 'http://www.koontech.com/', 'SIP工业广播通讯调度系统产品销售；不锈钢制品销售；通讯防水电话、电子探头的销售；国内商业、物资供销业', '2008-07-10', '有限责任公司(自然人独资)', '1千万人民币', '5000年01月01日', null, '深圳市市场监督管理局', '2017-02-27', '存续（在营、开业、在册）', '深圳市宝安区西乡固戍南昌工业区268号厂房第6层13区', '楼宇对讲,公共广播,视频会议 \n', null, null, '10', '\n', null, null, null, null, null, '2018-04-02', '342', '3.00', '3', '20180132');
INSERT INTO `table_supplier` VALUES ('292', '苏州科达科技股份有限公司长沙分公司', '苏州科达', '91430100593281003H', '陈晓华', 'http://kedacom.tpy888.cn/', '摄像机，网络摄像机，安防产品', '2012-04-06', '股份有限公司分公司(非上市、自然人投资或控股)', null, '2012年4月6日', null, '长沙市工商行政管理局', '2016-04-19', '存续（在营、开业、在册）', '长沙市开福区芙蓉中路1段119号标志房产1804房', '研发数字音、视频编解码器和视频会议、视频监控平台设备在内的网络通讯设备及软件（无线通讯终端产品除外）并提供相应的技术维护服务。（涉及行政许可的经营项目，凭许可证或者审批文件方可经营）\n', null, null, '3', null, null, null, null, null, null, '2018-04-02', '343', '3.00', '3', '20180133');
INSERT INTO `table_supplier` VALUES ('293', '宁波瑞奥物联技术股份有限公司 ', '瑞奥', '91330200799505578M', '史伟 ', 'http://www.rayonics.com.cn/cn/index.php', '民用商用门锁，工业行业柜锁，智能家居', '2007-03-07', '股份有限公司(非上市、自然人投资或控股)', '1千万人民币', '2007年03月07日 ', '2027年03月06日', '宁波市市场监督管理局 ', '2017-09-19', '存续', '浙江省宁波市高新区凌云路1177号6栋2层2区 ', '物联网技术的应用研发；智能门禁和安防系统、智能物流和仓储管理、智能家居的产品和软件的应用开发；无线传感产品、无线通讯装置和紧密机械部件生产、加工、销售和相关技术咨询服务；自营或代理各类货物和技术的进出口业务，但国家禁止或限定经营的货物和技术除外。 ', null, null, '14', null, null, null, null, null, null, '2018-04-03', '346', '3.00', '3', '20180134');
INSERT INTO `table_supplier` VALUES ('294', '深圳市翌日科技有限公司 ', 'IRITECH', '91440300683783875F ', '喻川', 'http://www.yiritech.com/index.asp', '智慧城市，智慧矿井，智慧矿山，三维仿真', '2009-02-04', '有限责任公司 ', '2500万人民币', '2009年02月04日 ', '2019年02月04日', '深圳市市场监督管理局', '2017-05-17', '存续', '深圳市南山区粤海街道高新技术产业园区高新南七道11号深圳软件园T3栋B区5楼', '计算机软硬件的技术开发；计算机信息系统集成；大数据应用相关研发及销售。（以上项目法律、行政法规、国务院决定禁止的除外，限制的项目须取得许可后方可经营） ^网络及无线通信产品的研发、生产、销售；物联网产品研发、生产、销售；矿用电器产品的生产、销售；矿用集成系统的研发及相关产品的生产、销售。 ', null, null, '4', null, null, null, null, null, null, '2018-04-03', '347', '3.00', '3', '20180135');
INSERT INTO `table_supplier` VALUES ('295', '福州凯和电子有限公司 ', '凯和', '913501026875492939 ', '崔继民', 'http://www.kai-he.com/', '电子巡更巡检产品', '2009-05-12', '有限责任公司', '50万人民币 ', '2009年05月12日', '无固定期限', '福州市鼓楼区市场监督管理局', '2017-07-10', '存续', '福建省福州市闽侯县高新区高新大道6号启迪之星3楼', '电子产品、机械设备、仪器仪表、通讯设备、办公设备、计算机软件的技术开发、安装、生产、批发、代购代销。（依法须经批准的项目，经相关部门批准后方可开展经营活动）', null, null, '4', null, null, null, null, null, null, '2018-04-04', '348', '3.00', '3', '20180136');
INSERT INTO `table_supplier` VALUES ('296', '杭州七友通信科技有限公司', '七友', '91330108699805047X ', '敬晓宇', 'http://www.7ucom.com/', '光缆接头盒，光纤产品，远程光纤检测系统，智能光纤网络管理', '2010-01-13', '有限责任公司(自然人投资或控股) ', '10100.000000万人民币', '2010年01月13日 ', '2030年01月12日 ', '杭州市高新区（滨江）市场监督管理局 ', '2016-05-10', '存续', '杭州市滨江区滨文路3号第6层', '生产通信设备光纤快速连接器、光器件、箱体、盒体、熔接设备、检测设备； 通信设备，计算机网络、计算机软硬件、电子设备的技术开发、技术服务；通信设备、计算机软硬件、电子设备的销售；自产产品出口及企业所需原材料的进口（法律、行政法规禁止经营的项目除外，法律、行政法规限制经营的项目取得许可后方可经营）；含下属分支机构经营范围。 ', null, null, '7', null, null, null, null, null, null, '2018-04-04', '349', '3.00', '3', '20180137');
INSERT INTO `table_supplier` VALUES ('297', '深圳市皇家金联电子科技有限公司 ', '金联', '91440300349733928D ', '李焕文 ', 'http://www.icash.wang/index.html', '医院挂号缴费机，停车场缴费机，点餐缴费机，3G环境门禁监控', '2015-07-30', '有限责任公司', '10.000000万人民币', '2015年07月30日', '5000年01月01日 ', '深圳市市场监督管理局 ', '2015-07-30', '存续', '深圳市龙华新区龙华街道建设路东百富汇工业区D栋202室 ', '电子产品的研发和销售、租赁；经营电子商务；国内贸易；货物及技术进出口。（法律、行政法规、国务院决定规定在登记前须批准的项目除外）^从事广告业务；电子产品的生产 ', null, null, '3', null, null, null, null, null, null, '2018-04-04', '350', '3.00', '3', '20180138');
INSERT INTO `table_supplier` VALUES ('298', '广州市澳意电子科技有限公司 ', '澳意', '914401016681469748 ', '王伟华 ', 'http://ao-yi.cn ', '一卡通,安防综合平台,智能交通', '2007-11-23', '有限责任公司(自然人投资或控股) ', '200.000000万', '2007-11-23', null, '广州市天河区工商行政管理局 ', '2016-08-18', '存续', '广州市天河区高科路32、34号B1栋南座501室 ', '电子、通信与自动控制技术研究、开发;电工机械专用设备制造;电子自动化工程安装服务;交通安全、管制及类似专用设备制造;货物进出口（专营专控商品除外）; ', null, null, '2', null, null, null, null, null, null, '2018-04-04', '351', '3.00', '3', '20180139');
INSERT INTO `table_supplier` VALUES ('299', '厦门云能信息科技有限公司', '云能', '91350205094312549L ', '林自林', 'http://www.yun-neng.com/', '车牌识别系统，户外LCD广告屏', '2014-04-10', '有限责任公司(自然人投资或控股) ', '500.000000万人民币 ', '2014年04月10日 ', '2064年04月09日 ', '厦门市海沧区市场监督管理局 ', '2016-04-19', '存续', '厦门市海沧区坪埕北路17号3F ', '软件开发；信息系统集成服务；信息技术咨询服务；数据处理和存储服务；集成电路设计；其他未列明信息技术服务业（不含需经许可审批的项目）；其他机械设备及电子产品批发；其他电子产品零售；计算机和辅助设备修理；其他办公设备维修；工程和技术研究和试验发展；其他未列明科技推广和应用服务业；管道和设备安装；安全系统监控服务；其他未列明商务服务业（不含需经许可审批的项目）；广告的设计、制作、代理、发布。 ', null, null, '4', null, null, null, null, null, null, '2018-04-04', '352', '3.00', '3', '20180140');
INSERT INTO `table_supplier` VALUES ('300', '深圳市威斯迪姆科技有限公司 ', '威斯迪姆', '91440300075192473R', '张建', 'http://www.wisdomtech.com.cn', '人行通道闸 ', '2013-07-31', '有限责任公司', '200.000000万人民币 ', '2013年07月31日', '5000年01月01日 ', '深圳市市场监督管理局', '2018-03-21', '存续', '深圳市龙岗区宝龙街道宝龙社区锦龙四路8号永源锦工业园二栋2楼 ', '计算机软件和智能卡的技术开发；道闸、通道闸、门禁系统、售检票系统、交通管理设施、开门机、IC卡读写设备、安防智能系统设备的研发、维护及技术支持和保养服务；国内贸易，货物及技术进出口^计算机软件和智能卡的生产；道闸、通道闸、门禁系统、售检票系统、交通管理设施、开门机、IC卡读写设备、安防智能系统设备的生产、安装。 ', null, null, '4', null, null, null, null, null, null, '2018-04-04', '353', '3.00', '3', '20180141');
INSERT INTO `table_supplier` VALUES ('301', '深圳市开拓者安防科技有限公司', '开拓者', '91440300349826788Q ', '刘建昌 ', 'http://www.secukey.com.cn', '门禁，读卡器，防水指纹机，键盘机，迷你控制器', '2015-08-05', '有限责任公司 ', '10.000000万人民币', '2015年08月05日 ', '5000年01月01日 ', '深圳市市场监督管理局', '2015-11-26', '存续', '深圳市龙岗区坂田街道大发路27号龙壁工业城24#楼5层 ', '智能卡设备、智能无线门禁设备、门禁机、控制器、考勤机、读卡器、电子产品的技术开发及销售，经营进出口业务。（法律、行政法规、国务院决定禁止的项目除外，限制的项目须取得许可后方可经营）', null, null, '4', null, null, null, null, null, null, '2018-04-04', '354', '3.00', '3', '20180142');
INSERT INTO `table_supplier` VALUES ('302', '深圳市安奇顺科技有限公司', '安奇顺', '9144030078276344XM', '曾峰', 'http://www.amtrue.com/', '安防电源，监控电源，门禁电源，后备电源', '2005-11-24', '有限责任公司(自然人独资) ', ' 50.000000万人民币', '2005-11-24', '5000年01月01日 ', '深圳市市场监督管理局 ', '2016-06-03', '存续', '深圳市龙岗区横岗街道龙岗大道5008号港信达大厦1207室 ', '电子产品的技术开发与销售（不含限制项目）；货物进出口、技术进出口（法律、行政法规禁止的项目除外；法律、行政法规限制的项目须取得许可后方可经营）。', null, null, '6', null, null, null, null, null, null, '2018-04-04', '355', '3.00', '3', '20180143');
INSERT INTO `table_supplier` VALUES ('303', '苏州斯奥克微电机制造有限公司', '斯奥克', '9132050613784444XJ ', '曹兆磊 ', 'http://www.sokmotor.cn', '安防通道闸电机控制一体 ', '2001-10-18', '有限责任公司(自然人投资或控股) ', '500.000000万人民币 ', '2001年10月18日 ', null, '苏州市吴中区市场监督管理局', '2016-06-17', '存续', '苏州市吴中区越溪北官渡路1号', '设计、制造：电机、风机、模具；机械加工；维修电机；经营本企业自产产品及技术的出口业务和本企业所需的机械设备、零配件、原辅材料及技术的进口业务，但国家限定公司经营或禁止进出口的商品及技术除外。（依法须经批准的项目，经相关部门批准后方可开展经营活动） ', null, null, '6', null, null, null, null, null, null, '2018-04-04', '356', '3.00', '3', '20180144');
INSERT INTO `table_supplier` VALUES ('304', '开尔瑞科技(深圳)有限公司', '开尔瑞', '91440300667055878J ', '王大鹏', 'http://www.carea.cn', '综合管理平台、工业级控制器、虹膜读卡器、掌纹掌静脉门禁读卡器 ', '2007-10-26', '有限责任公司(外国法人独资) ', '100.000000万人民币 ', '2007年10月26日 ', '2027年10月26日 ', '深圳市市场监督管理局', '2017-04-05', '存续', '深圳市龙华新区大浪街道华旺路华富工业园第4栋厂房第3楼 ', '经营门禁设备、一卡通管理设备、车牌识别设备、射频识别设备、生物识别设备、智慧疗区设备、博物馆管理系统、智能家居设备、楼宇智控设备、背景音乐设备、监控设备、报警设备、安检设备、智能锁、计算机集成及网络设备、弱电系统集成设备及相关软件；从事上述产品及计算机软硬件、电子产品、通信设备、数码产品、自动化设备、机械设备的研发、批发、技术咨询、进出口及相关配套业务（不涉及国营贸易管理商品，涉及配额、许可证管理及其他专项规定管理的商品，按照国家有关规定办理申请）', null, null, '4', null, null, null, null, null, null, '2018-04-04', '357', '3.00', '3', '20180145');
INSERT INTO `table_supplier` VALUES ('305', '深圳市皇家金联科技有限公司', '金联', '91440300349733928D ', '李焕文', 'http://www.icash.wang/index.html', '医院挂号缴费机，停车场缴费机，点餐缴费机，3G环境门禁监控', '2015-07-30', '有限责任公司 ', '10.000000万人民币', '2015-07-30', '5000年01月01日', '深圳市市场监督管理局 ', '2015-07-30', '存续', '深圳市龙华新区龙华街道建设路东百富汇工业区D栋202室 ', '电子产品的研发和销售、租赁；经营电子商务；国内贸易；货物及技术进出口。（法律、行政法规、国务院决定规定在登记前须批准的项目除外）^从事广告业务；电子产品的生产', null, null, '4', null, null, null, null, null, null, '2018-04-11', '358', '3.00', '3', '20180146');
INSERT INTO `table_supplier` VALUES ('306', '深圳市威富视界有限公司', '威富', '91440300555446137K ', '张少林 ', 'http://www.wavewisdom.com/', '人脸识别门禁/考勤终端/人脸识别锁/人脸识别储物柜深圳市宝安区西乡街道前进二路展丰工业园B2栋2楼', '2010-05-27', '有限责任公司', '2100.000000万人民币 ', '2010年05月27日 ', null, '深圳市市场监督管理局', '2018-03-06', '存续', '深圳市宝安区西乡街道前进二路展丰工业园B2栋2楼', '安防技术防范产品、电子产品、通讯产品、通讯设备、终端设备软件的技术开发、销售与上门安装；经营进出口业务。（法律、行政法规、国务院决定禁止的项目除外，限制的项目须取得许可后方可经营', null, null, '4', null, null, null, null, null, null, '2018-04-11', '359', '3.00', '3', '20180147');
INSERT INTO `table_supplier` VALUES ('307', '深圳科装智能电子技术有限公司', '科装', '91440300582740315N ', '谢高林 ', 'http://szkzzn.com', '通道闸，自助售票机，电子售检票系统', '2011-09-28', '有限责任公司 ', '100.000000万人民币', '2011年09月28日 ', '2021年09月28日 ', '深圳市市场监督管理局 ', '2016-03-09', '存续', '深圳市市场监督管理局', '安防设备、通讯设备、计算机、电子产品、网络产品、机械智能设备的软硬件技术开发与销售；国内贸易，货物及技术进出口。^安防设备、通讯设备、计算机、电子产品、网络产品、机械智能设备的生产', null, null, '4', null, null, null, null, null, null, '2018-04-11', '360', '3.00', '3', '20180148');
INSERT INTO `table_supplier` VALUES ('308', '霸州市霸州镇嘉琪家具销售部', '霸州市霸', '131081600349321', '赵亭亭', 'http://25396870.pe168.com/', '钢木家具、校用家具、办公家具', '2016-03-23', '个体工商户（个人经营）', null, '2016年3月23日', null, '廊坊市霸州市工商行政管理局', '2016-03-23', '存续（在营、开业、在册）', '河北省廊坊市霸州市霸州镇武平名郡住宅小区2号楼1单元1301室', '销售钢木家具、校用家具、办公家具、户外家具、五金冲压件、日用塑料制品、模具、家居用品、文化办公用品、汽车配件、展示展架\n', null, null, '14', null, null, null, null, null, null, '2018-04-12', '343', '3.00', '3', '20180149');
INSERT INTO `table_supplier` VALUES ('309', '广州市白云区凯韵电子设备厂', '中国凯韵', '914401117577727156', '潘洪强', 'http://www.kaiyundz.net/', '会议系统', '2003-12-30', '个人独资企业', null, null, null, '广州市白云区工商行政管理局', '2016-06-22', '在营（开业）企业', '广州市白云区松洲街槎龙村聚龙街47号', '计算机整机制造;计算机零部件制造;计算机应用电子设备制造;音响设备制造;其他办公设备维修;货物进出口（专营专控商品除外）;技术进出口;电子设备工程安装服务;舞台灯光、音响设备安装服务;通信系统设备制造;通信设施安装工程服务;计算机批发;计算机零配件批发;软件批发;办公设备耗材批发;通讯设备及配套设备批发;通讯终端设备批发;广播设备及其配件批发;计算机零售;计算机零配件零售;软件零售;办公设备耗材零售;通信设备零售;安全技术防范产品零售;电子元器件零售;电子产品零售;消防设备、器材的制造;消防设备、器材的批发;消防设备、器材的零售;商品批发贸易（许可审批类商品除外）;商品零售贸易（许可审批类商品除外）;贸易代理;\n', null, null, '10', null, null, null, null, null, null, '2018-04-12', '344', '3.00', '3', '20180150');
INSERT INTO `table_supplier` VALUES ('310', '佳都新太科技股份有限公司湖南分公司', '佳都新太', '91430100MA4L55L08L', '刘艳', 'http://www.pcitech.com/', '公安管理平台.智慧城市', '2014-05-28', '股份有限公司分公司(非上市、自然人投资或控股)', null, '2014年5月28日', null, '长沙市工商行政管理局', '2017-11-02', '存续（在营、开业、在册）', '湖南省长沙市雨花区劳动东路260号浪琴山花园一期3栋1705室', '计算机技术开发、技术服务;商品零售贸易（许可审批类商品除外）;商品批发贸易（许可审批类商品除外）;广播电视及信号设备的安装;通信线路和设备的安装;智能化安装工程服务;网络技术的研究、开发;计算机网络系统工程服务;信息系统集成服务;安全技术防范系统设计、施工、维修;技术进出口;货物进出口（专营专控商品除外）;跨地区增值电信服务（业务种类以《增值电信业务经营许可证》载明内容为准）;\n', '通过登记的住所或者经营场所无法联系的', null, '9', null, null, null, null, null, null, '2018-04-12', '345', '3.00', '3', '20180151');
INSERT INTO `table_supplier` VALUES ('311', '广州市白云区天玛舞台灯光设备厂', '广州市白', '91440111562269968A', '杨明军', null, '舞台灯具', '2010-09-14', '个人独资企业', null, null, null, '广州市白云区工商行政管理局', '2016-09-26', '在营（开业）企业', '广州市白云区江高镇流连路5号B栋二楼', '照明灯具制造;灯用电器附件及其他照明器具制造;照明器具生产专用设备制造;电光源制造;灯具、装饰物品批发;电子元器件批发;电子产品批发;\n', null, null, '8', null, null, null, null, null, null, '2018-04-12', '346', '3.00', '3', '20180152');
INSERT INTO `table_supplier` VALUES ('312', '杭州海康威视数字技术股份有限公司长沙分公司', '杭州海康', '91430100673592784J', '闵和军', 'http://www.hikvision.com/cn/index.html', '摄像机', '2008-04-30', '台、港、澳投资企业分公司', null, '2008年4月30日', null, '长沙市工商行政管理局', '2016-07-22', '存续（在营、开业、在册）', '长沙市天心区刘家冲北路238号中欣国际14楼1401室', '电子产品（含防爆电气产品、通信设备及其辅助设备、多媒体设备）、飞行器、机器人、智能装备、汽车零部件及配件、车用电气信号设备装置的研发、生产；销售自产产品；提供技术服务，电子技术咨询服务，培训服务（不含办班培训），电子设备安装，电子工程及智能系统工程的设计、施工及维护。（国家禁止和限制的项目除外，涉及许可证的凭证经营）（依法须经批准的项目，经相关部门批准后方可开展经营活动）\n', null, null, '8', null, null, null, null, null, null, '2018-04-12', '347', '3.00', '3', '20180153');
INSERT INTO `table_supplier` VALUES ('313', '郑州可瑞为信息技术有限公司湖南分公司', '瑞为信息', '91430100MA4LAQ5W2R', '李博', 'https://reconova.cn.china.cn/', '软件开发', '2017-01-12', '有限责任公司分公司(自然人投资或控股)', null, '2017年1月12日', null, '长沙市工商行政管理局高新技术产业开发分局', '2017-01-12', '存续（在营、开业、在册）', '长沙高新开发区麓枫路61号湘麓国际花园二期酒店、公寓621室', '计算机软硬件的技术开发、技术咨询、技术服务；计算机系统集成（涉密系统除外）；企业管理咨询\n', null, null, '6', null, null, null, null, null, null, '2018-04-12', '348', '3.00', '3', '20180154');
INSERT INTO `table_supplier` VALUES ('314', '广东安居宝数码科技股份有限公司长沙分公司', '广东安居', '9143010066856421XG', '钟树青', 'http://www.anjubao.com/about_us.html?getAboutUs=0&html_id=2&sed_no=0', '智能楼宇，智能停车场，安防系统专用线缆', '2007-11-08', '股份有限公司分公司(非上市、自然人投资或控股)', null, '2007年11月8日', null, '长沙市工商行政管理局', '2016-06-08', '存续（在营、开业、在册）', '长沙市雨花区城南中路23号荣安大厦208、209室', '自动控制设备、通讯设备的销售及技术咨询服务。（涉及许可审批的经营项目，凭许可证或审批文件方可经营）\n', null, null, '6', null, null, null, null, null, null, '2018-04-12', '349', '3.00', '3', '20180155');
INSERT INTO `table_supplier` VALUES ('315', '中控智慧科技股份有限公司湖南分公司', '中控智慧', '91430102MA4LQQ0E02', '贺冬冬', 'http://cn.zkteco.com/about/i=3&comContentId=3.html', '生物识别系统', '2017-06-07', '其他股份有限公司分公司(非上市)', null, '2017年6月7日', null, '长沙市工商行政管理局芙蓉分局', '2017-06-07', '存续（在营、开业、在册）', '湖南省长沙市芙蓉区火星街道万家丽中路一段3号建安大厦1103房', '在隶属企业经营范围内开展下列经营活动；集成电路设计；电子产品研发；软件开发；软件技术转让；软件技术服务；指纹采集器、电子产品、五金产品、行李传输设备、科学检测仪器、检测设备、软件的销售。（依法须经批准的项目，经相关部门批准后方可开展经营活动）\n', null, null, '4', null, null, null, null, null, null, '2018-04-12', '350', '3.00', '3', '20180156');
INSERT INTO `table_supplier` VALUES ('316', '高新兴科技集团股份有限公司湖南分公司', '高新兴科', '91430102MA4L63FG06', '赵冰心', 'http://www.gosuncn.com/', '智慧城市物联网', '2016-08-23', '股份有限公司分公司(上市、自然人投资或控股)', null, null, '2016年8月23日', '长沙市工商行政管理局芙蓉分局', '2016-08-23', '存续（在营、开业、在册）', '湖南省长沙市芙蓉区朝阳街街道五一路235号湘域中央1栋1615室', '通信网络运维信息系统、动力环境监控系统、数字图像监控系统、物联网技术开发及系统建设，计算机软件开发，系统集成及相关技术服务；研发、生产、销售：通信产品、无线通讯电子产品（手持终端、车载终端、行业手机、无线传输设备）、通信设备（不含卫星电视广播地面接收设备、发射设施）、监控设备、节能设备、低压配电设备、通信电源、仪器仪表、电子产品及传感器；通信工程、网络工程、安防工程的设计、安装、维护；通信技术服务、节能服务（以上不含电信增值业务等许可经营项目）；信息系统集成服务、信息技术咨询服务、信息电子技术服务、机电设备安装服务、通信设施安装工程服务、园林绿化工程服务；房屋建筑工程施工、市政公用工程施工；企业自有资金投资；房屋租赁、场地租赁（不含仓储）、机械设备租赁、计算机及通讯设备租赁、办公设备租赁服务；非许可类医疗器械经营；货物进出口、技术进出口。\n', null, null, '4', null, null, null, null, null, null, '2018-04-12', '351', '3.00', '3', '20180157');
INSERT INTO `table_supplier` VALUES ('317', '英特韦特安防科技（中山）有限公司广州分公司', '英特韦特', '91440101793476219B', '何韵盈', 'www.integrated.com.cn', '考勤.门禁等安防系统方案', '2006-09-05', '分公司', null, '2006年9月5日', '2020年5月13日', '广州市越秀区工商行政管理局', '2017-01-04', '在营（开业）企业', '广州市越秀区中山六路232号803房', '从事安全技术防范产品系统及相关电子产品的自主开发，生产及配套服务，包括计算机软件设计、嵌入式硬件和软件的设计、以及为客户提供软硬件项目定制服务（国家限制、禁止类除外）；教育咨询服务；安防设备和电子设备租赁；计算机信息系统集成。\n', '未依照《企业信息公示暂行条例》第八条规定的期限公示年度报告的', null, '4', null, null, null, null, null, null, '2018-04-12', '352', '3.00', '3', '20180158');
INSERT INTO `table_supplier` VALUES ('318', '上海天跃科技股份有限公司长沙分公司', '上海天跃', '91430100593281118P', '李元', 'http://www.tjty.com.cn/software.asp', '摄像机、录像机', '2012-04-11', '股份有限公司分公司(非上市、自然人投资或控股)', null, '2012年4月11日', null, '长沙市工商行政管理局', '2017-03-06', '存续（在营、开业、在册）', '长沙市岳麓区银杉路2号星蓝湾公寓ABC栋501房', '数字监控系统、计算机软硬件的技术开发、技术转让、技术咨询、技术服务以及销售；建筑智能化工程、公共安全防范工程设计、施工；计算机软硬件配件（除计算机信息系统安全产品）的研发、生产；上述产品、配套零部件以及相关技术的进出口。（不涉及国营贸易管理商品，涉及配额、许可证管理、专项管理规定的商品按照国家有关规定办理申请）。 【依法须经批准的项目，经相关部门批准后方可开展经营活动】', null, null, '3', null, null, null, null, null, null, '2018-04-12', '353', '3.00', '3', '20180159');
INSERT INTO `table_supplier` VALUES ('319', '苏州市富尔达科技股份有限公司', '富尔达', '91320500752028858L ', '朱力克 ', 'http://www.cnfrd.cn', '消防联动闭门器、安防闭门器、闭窗器', '2003-04-25', '股份有限公司(非上市、自然人投资或控股)', '3000.000000万人民币 ', '2003年04月25日 ', null, '苏州市工商行政管理局 ', '2018-04-08', '存续', '太仓市双凤镇温州工业园 ', '生产、加工、销售闭门器、导轨、五金配件、低压电器、电线电缆多孔水泥砖；经销建筑五金、装饰五金、消防器材；自营和代理各类商品及技术的进出口业务', null, null, '6', null, null, null, null, null, null, '2018-04-24', '355', '3.00', '3', '20180160');
INSERT INTO `table_supplier` VALUES ('320', '东莞市胜河电子有限公司', '胜河', '9144190031513672XM ', ' 梁璞', 'http://shenghedz.1688.com', '接线端子 配线器材 连接器', '2014-09-28', '有限责任公司', '100.000000万人民币 ', '2014年09月28日 ', '2016年05月17日 ', '广东省东莞市工商行政管理局 ', '2016-05-17', '存续', '东莞市樟木头镇官仓社区贤达一路3号A栋厂房三楼 ', '销售：电子连接器、接线端子、配线器材、灯饰配件、五金电子、塑胶制品、包装材料；生产：电子连接器、接线端子、配线器材、灯饰配件、五金电子、塑胶制品、包装材料', null, null, '6', null, null, null, null, null, null, '2018-04-24', '356', '3.00', '3', '20180161');
INSERT INTO `table_supplier` VALUES ('321', '温州市鹿城天和自动化元件厂 ', '天和', '91330302256422215T ', '周迎春 ', 'https://tianhemast.1688.com/', '气动升降杆、电动机械升降杆、手动升降杆、安防系统集成升降杆', '1997-08-06', '股份合作制', '68.000000万人民币 ', '1997年08月06日', '9999年09月09日 ', '温州市鹿城区市场监督管理局 ', '2016-11-11', '存续', '温州市德政工业区横塘路18号一楼', '仪器仪表元件、器件、照明灯具、液压和气压动力机械及元件制造、销售;货物进出口、技术进出口服务 ', null, null, '6', null, null, null, null, null, null, '2018-04-24', '357', '3.00', '3', '20180162');
INSERT INTO `table_supplier` VALUES ('322', '厦门同创兴科电子科技有限公司', '同创兴科', '913502056782832787 ', '林艳', 'http://www.unicreed.com ', '密封，EI ，环形和高频系列变压器', '2008-12-23', '有限责任公司', '1000.000000万人民币', '2008年12月23日 ', '2028年12月22日 ', '厦门市海沧区市场监督管理局 ', '2016-01-06', '存续', '厦门市海沧区新阳工业区阳和南路6号厂房二402单元 ', '研发、生产、销售：密封式变压器、电子变压器、电感器、线圈、液晶显示件及应用产品、电子部件组装、电子元器件；2、经营本企业自产产品的出口业务和本企业所需的机械设备、零配件、原辅材料的进口业务', null, null, '6', null, null, null, null, null, null, '2018-04-24', '358', '3.00', '3', '20180163');

-- ----------------------------
-- Table structure for table_supplier_category
-- ----------------------------
DROP TABLE IF EXISTS `table_supplier_category`;
CREATE TABLE `table_supplier_category` (
  `id` int(10) NOT NULL COMMENT 'ID',
  `name` varchar(20) NOT NULL COMMENT '供应商种类名称',
  `description` varchar(225) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uqe_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商种类表';

-- ----------------------------
-- Records of table_supplier_category
-- ----------------------------
INSERT INTO `table_supplier_category` VALUES ('0', '试用供应商', '初次添加的供应商');
INSERT INTO `table_supplier_category` VALUES ('1', '战略供应商', '正在合作的供应商');
INSERT INTO `table_supplier_category` VALUES ('2', '合格供应商', '有过合作关系的供应商');
INSERT INTO `table_supplier_category` VALUES ('3', '休眠供应商', '很久没有联系过的供应商');

-- ----------------------------
-- Table structure for table_supplier_document
-- ----------------------------
DROP TABLE IF EXISTS `table_supplier_document`;
CREATE TABLE `table_supplier_document` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(40) NOT NULL COMMENT '文件名称',
  `type` int(10) NOT NULL COMMENT '文件类型',
  `description` varchar(225) DEFAULT NULL COMMENT '文件描述',
  `appendix_name` varchar(50) DEFAULT NULL COMMENT '附件名称',
  `appendix` mediumblob COMMENT '附件',
  `supplier_id` int(10) NOT NULL COMMENT '所属供应商',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商文档表';

-- ----------------------------
-- Records of table_supplier_document
-- ----------------------------

-- ----------------------------
-- Table structure for table_trade_group
-- ----------------------------
DROP TABLE IF EXISTS `table_trade_group`;
CREATE TABLE `table_trade_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(20) NOT NULL COMMENT '分组名',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父分类',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='企业行业表';

-- ----------------------------
-- Records of table_trade_group
-- ----------------------------
INSERT INTO `table_trade_group` VALUES ('1', '安防线缆', '0', null);
INSERT INTO `table_trade_group` VALUES ('2', '安防综合平台', '0', null);
INSERT INTO `table_trade_group` VALUES ('3', '视频监控', '0', null);
INSERT INTO `table_trade_group` VALUES ('4', '安防系统集成', '0', null);
INSERT INTO `table_trade_group` VALUES ('5', '警用装备', '0', null);
INSERT INTO `table_trade_group` VALUES ('6', '安防配件', '0', null);
INSERT INTO `table_trade_group` VALUES ('7', '传输设备', '0', null);
INSERT INTO `table_trade_group` VALUES ('8', '显示设备', '0', null);
INSERT INTO `table_trade_group` VALUES ('9', '公安部门', '0', null);
INSERT INTO `table_trade_group` VALUES ('10', '视频会议', '0', null);
INSERT INTO `table_trade_group` VALUES ('11', '防盗报警', '0', null);
INSERT INTO `table_trade_group` VALUES ('12', '消防设备', '0', null);
INSERT INTO `table_trade_group` VALUES ('13', '存储设备', '0', null);
INSERT INTO `table_trade_group` VALUES ('14', '家具产品', '0', null);
INSERT INTO `table_trade_group` VALUES ('15', '窗帘', '0', null);
INSERT INTO `table_trade_group` VALUES ('16', '网络系统', '0', null);
INSERT INTO `table_trade_group` VALUES ('17', '空调', '0', null);
INSERT INTO `table_trade_group` VALUES ('18', '机房建设', '0', null);
INSERT INTO `table_trade_group` VALUES ('19', '其它', '0', null);

-- ----------------------------
-- Table structure for table_user
-- ----------------------------
DROP TABLE IF EXISTS `table_user`;
CREATE TABLE `table_user` (
  `id` int(6) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(40) NOT NULL DEFAULT '4QrcOUm6Wau+VuBX8g+IPg==' COMMENT '密码',
  `real_name` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `phone_number` varchar(20) DEFAULT NULL COMMENT '联系方式',
  `is_su` int(1) NOT NULL DEFAULT '0' COMMENT '是否为超级管理员，1:true 0:false',
  `level` varchar(20) NOT NULL DEFAULT '普通用户' COMMENT '用户级别',
  `last_online_time` datetime NOT NULL COMMENT '最后在线时间',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `location` varchar(50) DEFAULT NULL COMMENT '位置',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `state` int(1) DEFAULT '0' COMMENT '用户状态 0:停用 1:启用',
  `about_me` varchar(225) DEFAULT NULL COMMENT '关于我',
  `online` int(1) NOT NULL DEFAULT '0' COMMENT '是否在线 1:在线 0:不在线',
  `head_img` varchar(50) DEFAULT NULL COMMENT '头像路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_user
-- ----------------------------
INSERT INTO `table_user` VALUES ('1', 'admin', 'ISMvKXpXpadDiUoOSoAfww==', '超级管理员', '17608434605', '1', '普通用户', '2018-07-25 00:49:41', '2018-03-29 00:40:14', null, '1999-03-04', '1', null, '0', '1.jpg');
INSERT INTO `table_user` VALUES ('2', 'xietao', '5dne4Iksn0dKF007//t4EA==', '谢涛', '17608434605', '0', '开发员', '2018-05-11 08:41:28', '2018-03-29 00:40:27', '湖南,长沙', '1999-03-04', '1', null, '0', '2.jpg');
INSERT INTO `table_user` VALUES ('34', 'test', '4QrcOUm6Wau+VuBX8g+IPg==', null, null, '0', '普通用户', '2018-04-16 17:38:10', '2018-04-16 16:52:02', null, null, '1', null, '0', null);
INSERT INTO `table_user` VALUES ('35', 'yangbinhui', '4QrcOUm6Wau+VuBX8g+IPg==', null, '13367341483', '0', '开发员', '2018-07-04 09:46:03', '2018-07-03 10:14:08', null, null, '1', null, '0', null);

-- ----------------------------
-- Table structure for table_user_defined_field_name
-- ----------------------------
DROP TABLE IF EXISTS `table_user_defined_field_name`;
CREATE TABLE `table_user_defined_field_name` (
  `user_defined_field_one_name` varchar(50) DEFAULT NULL COMMENT '自定义字段1名称',
  `user_defined_field_two_name` varchar(50) DEFAULT NULL COMMENT '自定义字段2名称',
  `user_defined_field_three_name` varchar(50) DEFAULT NULL COMMENT '自定义字段3名称',
  `user_defined_field_four_name` varchar(50) DEFAULT NULL COMMENT '自定义字段4名称',
  `user_defined_field_five_name` varchar(50) DEFAULT NULL COMMENT '自定义字段5名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户自定义字段名称';

-- ----------------------------
-- Records of table_user_defined_field_name
-- ----------------------------
INSERT INTO `table_user_defined_field_name` VALUES ('其它1', '其它2', '其它3', '其它4', '其它5');

-- ----------------------------
-- Table structure for table_user_privilege
-- ----------------------------
DROP TABLE IF EXISTS `table_user_privilege`;
CREATE TABLE `table_user_privilege` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(5) NOT NULL COMMENT '用户ID',
  `privilege_id` int(5) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_user_privilege
-- ----------------------------
INSERT INTO `table_user_privilege` VALUES ('1', '1', '1');
INSERT INTO `table_user_privilege` VALUES ('3', '1', '3');
INSERT INTO `table_user_privilege` VALUES ('4', '1', '4');
INSERT INTO `table_user_privilege` VALUES ('5', '1', '5');
INSERT INTO `table_user_privilege` VALUES ('6', '1', '6');
INSERT INTO `table_user_privilege` VALUES ('7', '2', '1');
INSERT INTO `table_user_privilege` VALUES ('11', '2', '13');
INSERT INTO `table_user_privilege` VALUES ('12', '2', '14');
INSERT INTO `table_user_privilege` VALUES ('13', '2', '15');
INSERT INTO `table_user_privilege` VALUES ('16', '2', '12');
INSERT INTO `table_user_privilege` VALUES ('20', '34', '1');
INSERT INTO `table_user_privilege` VALUES ('21', '34', '5');
INSERT INTO `table_user_privilege` VALUES ('22', '34', '12');
INSERT INTO `table_user_privilege` VALUES ('23', '2', '18');
INSERT INTO `table_user_privilege` VALUES ('24', '2', '19');
INSERT INTO `table_user_privilege` VALUES ('25', '35', '1');
INSERT INTO `table_user_privilege` VALUES ('26', '35', '2');
INSERT INTO `table_user_privilege` VALUES ('27', '35', '3');
INSERT INTO `table_user_privilege` VALUES ('28', '35', '4');
INSERT INTO `table_user_privilege` VALUES ('29', '35', '5');
INSERT INTO `table_user_privilege` VALUES ('30', '35', '6');
INSERT INTO `table_user_privilege` VALUES ('31', '35', '7');
INSERT INTO `table_user_privilege` VALUES ('32', '35', '8');
INSERT INTO `table_user_privilege` VALUES ('33', '35', '12');
INSERT INTO `table_user_privilege` VALUES ('34', '35', '13');
INSERT INTO `table_user_privilege` VALUES ('35', '35', '14');
INSERT INTO `table_user_privilege` VALUES ('36', '35', '15');
INSERT INTO `table_user_privilege` VALUES ('37', '35', '18');
INSERT INTO `table_user_privilege` VALUES ('38', '35', '19');
INSERT INTO `table_user_privilege` VALUES ('39', '35', '20');
INSERT INTO `table_user_privilege` VALUES ('40', '35', '21');
INSERT INTO `table_user_privilege` VALUES ('41', '35', '22');
INSERT INTO `table_user_privilege` VALUES ('42', '35', '23');
INSERT INTO `table_user_privilege` VALUES ('43', '35', '24');
INSERT INTO `table_user_privilege` VALUES ('44', '35', '25');
INSERT INTO `table_user_privilege` VALUES ('45', '2', '2');
INSERT INTO `table_user_privilege` VALUES ('46', '2', '3');
INSERT INTO `table_user_privilege` VALUES ('47', '2', '4');
INSERT INTO `table_user_privilege` VALUES ('48', '2', '23');
INSERT INTO `table_user_privilege` VALUES ('49', '2', '24');

-- ----------------------------
-- Procedure structure for set_enterprise_no
-- ----------------------------
DROP PROCEDURE IF EXISTS `set_enterprise_no`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `set_enterprise_no`()
BEGIN 
	DECLARE id_ int DEFAULT null; -- 供应商Id
	DECLARE no_ int DEFAULT 0; -- 供应商编号
	DECLARE no_str_ varchar(10) DEFAULT ''; -- 供应商编号的格式值
  DECLARE s int DEFAULT 0; -- 标识游标状态
  DECLARE consume CURSOR FOR SELECT `id` FROM `table_enterprise`; -- 定义数据集
  DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET s=1; -- 设置游标状态为已结束
  OPEN consume;
    FETCH consume into id_;
    WHILE s <> 1 DO
			SET no_ = no_ + 1;
			SELECT concat(year(now()), lpad(no_, 4, '0')) INTO no_str_; -- 生成固定格式的编号
			update `table_enterprise` SET `no` = no_str_ WHERE `id` = id_;#根据id修改编号值
			FETCH consume INTO id_;
    end WHILE;
  CLOSE consume;
END
;;
DELIMITER ;
