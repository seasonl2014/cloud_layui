/*
Navicat MySQL Data Transfer

Source Server         : 虚拟机10
Source Server Version : 50731
Source Host           : 192.168.56.10:3306
Source Database       : moyu_cloud_layui

Target Server Type    : MYSQL
Target Server Version : 50731
File Encoding         : 65001

Date: 2020-09-28 09:31:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '请求类型',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '日志标题',
  `remote_addr` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '操作IP地址',
  `username` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '操作用户昵称',
  `request_uri` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '请求URI',
  `http_method` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '操作方式',
  `class_method` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '请求类型.方法',
  `params` text COLLATE utf8_bin COMMENT '操作提交的数据',
  `session_id` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'sessionId',
  `response` longtext COLLATE utf8_bin COMMENT '返回内容',
  `use_time` bigint(11) DEFAULT NULL COMMENT '方法执行时间',
  `browser` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '浏览器信息',
  `area` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '地区',
  `province` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '省',
  `city` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '市',
  `isp` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '网络服务提供商',
  `exception` text COLLATE utf8_bin COMMENT '异常信息',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `del_flag` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`) USING BTREE,
  KEY `sys_log_request_uri` (`request_uri`) USING BTREE,
  KEY `sys_log_type` (`type`) USING BTREE,
  KEY `sys_log_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=266 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('259', 'Ajax请求', '添加菜单', '127.0.0.1', 'admin', 'http://192.168.0.2:9000/system/menu/add', 'POST', 'cn.xueden.system.controller.MenuController.add', 0x5B7B2264656C466C6167223A66616C73652C2269636F6E223A2266612D616C69676E2D6A757374696679222C2269734D656E75223A2D312C226E616D65223A22E59586E59381E7AEA1E79086222C22736F7274223A327D5D, 'EDE6A135C91632A08CE00231A603E43D', 0x7B22636F6465223A302C2273756363657373223A747275652C226D657373616765223A22E68890E58A9F227D, '150', 'Windows-Chrome-80.0.3987.163', null, null, null, null, null, '1', '2020-09-27 21:13:20', '1', '2020-09-27 21:13:20', null, '\0');
INSERT INTO `sys_log` VALUES ('260', 'Ajax请求', '添加菜单', '127.0.0.1', 'admin', 'http://192.168.0.2:9000/system/menu/add', 'POST', 'cn.xueden.system.controller.MenuController.add', 0x5B7B2264656C466C6167223A66616C73652C2268726566223A22706167652F746573742F6C6973742E68746D6C222C2269636F6E223A2266612D616D62756C616E6365222C2269734D656E75223A302C226E616D65223A22E59586E59381E58897E8A1A8222C22706172656E744964223A36312C227065726D697373696F6E223A226D616C6C3A676F6F64733A6C697374222C22736F7274223A33307D5D, '135FC002EA57D98BEFB39653F337DB0D', 0x7B22636F6465223A302C2273756363657373223A747275652C226D657373616765223A22E68890E58A9F227D, '44', 'Windows-Chrome-80.0.3987.163', null, null, null, null, null, '1', '2020-09-27 21:14:33', '1', '2020-09-27 21:14:33', null, '\0');
INSERT INTO `sys_log` VALUES ('261', 'Ajax请求', '添加菜单', '127.0.0.1', 'admin', 'http://192.168.0.2:9000/system/menu/add', 'POST', 'cn.xueden.system.controller.MenuController.add', 0x5B7B2264656C466C6167223A66616C73652C2268726566223A22222C2269636F6E223A2266612D616D65726963616E2D7369676E2D6C616E67756167652D696E74657270726574696E67222C2269734D656E75223A312C226E616D65223A22E588A0E999A4E59586E59381222C22706172656E744964223A36322C227065726D697373696F6E223A226D616C6C3A676F6F64733A64656C657465222C22736F7274223A33307D5D, '67EDF05DCEF43D15E4335C6CCE7944CF', 0x7B22636F6465223A302C2273756363657373223A747275652C226D657373616765223A22E68890E58A9F227D, '34', 'Windows-Chrome-80.0.3987.163', null, null, null, null, null, '1', '2020-09-27 21:15:16', '1', '2020-09-27 21:15:16', null, '\0');
INSERT INTO `sys_log` VALUES ('262', 'Ajax请求', '编辑角色', '127.0.0.1', 'admin', 'http://192.168.0.2:9000/system/role/edit', 'POST', 'cn.xueden.system.controller.RoleController.edit', 0x5B7B2264656C466C6167223A66616C73652C226964223A322C226D656E75536574223A5B7B2264656C466C6167223A66616C73652C226964223A32312C22736F7274223A33307D2C7B2264656C466C6167223A66616C73652C226964223A36322C22736F7274223A33307D2C7B2264656C466C6167223A66616C73652C226964223A36332C22736F7274223A33307D2C7B2264656C466C6167223A66616C73652C226964223A332C22736F7274223A33307D2C7B2264656C466C6167223A66616C73652C226964223A32352C22736F7274223A33307D2C7B2264656C466C6167223A66616C73652C226964223A36312C22736F7274223A33307D2C7B2264656C466C6167223A66616C73652C226964223A362C22736F7274223A33307D2C7B2264656C466C6167223A66616C73652C226964223A312C22736F7274223A33307D2C7B2264656C466C6167223A66616C73652C226964223A32322C22736F7274223A33307D2C7B2264656C466C6167223A66616C73652C226964223A32362C22736F7274223A33307D2C7B2264656C466C6167223A66616C73652C226964223A342C22736F7274223A33307D2C7B2264656C466C6167223A66616C73652C226964223A35332C22736F7274223A33307D2C7B2264656C466C6167223A66616C73652C226964223A322C22736F7274223A33307D2C7B2264656C466C6167223A66616C73652C226964223A33362C22736F7274223A33307D2C7B2264656C466C6167223A66616C73652C226964223A35352C22736F7274223A33307D2C7B2264656C466C6167223A66616C73652C226964223A32302C22736F7274223A33307D2C7B2264656C466C6167223A66616C73652C226964223A33352C22736F7274223A33307D2C7B2264656C466C6167223A66616C73652C226964223A33372C22736F7274223A33307D2C7B2264656C466C6167223A66616C73652C226964223A32342C22736F7274223A33307D5D2C226E616D65223A22E8B685E7BAA7E7B3BBE7BB9FE7AEA1E79086E59198222C2272656D61726B73223A22E585B7E5A487E68980E69C89E69D83E99990227D5D, '3E49EA11B74E8D70B074AC781C079216', 0x7B22636F6465223A302C2273756363657373223A747275652C226D657373616765223A22E68890E58A9F227D, '73', 'Windows-Chrome-80.0.3987.163', null, null, null, null, null, '1', '2020-09-27 21:15:53', '1', '2020-09-27 21:15:53', null, '\0');
INSERT INTO `sys_log` VALUES ('263', '普通请求', '登录成功', '192.168.0.2', 'admin', 'http://192.168.0.2:9000/system/log', 'POST', 'cn.xueden.system.controller.LogController', 0x5B757365726E616D653A61646D696E2C6D6573736167653AE799BBE5BD95E68890E58A9F5D, '018296EE9F7B95037E0F75BEB6EC275E', null, '65', 'UnKnown, More-Info: Java/1.8.0_172-UnKnown, More-Info: Java/1.8.0_172', '内网IP0', '0', '内网IP', '内网IP', null, null, '2020-09-28 07:23:40', null, '2020-09-28 07:23:40', null, '\0');
INSERT INTO `sys_log` VALUES ('264', 'Ajax请求', '编辑角色', '127.0.0.1', 'admin', 'http://192.168.0.2:9000/system/role/edit', 'POST', 'cn.xueden.system.controller.RoleController.edit', 0x5B7B2264656C466C6167223A66616C73652C226964223A322C226D656E75536574223A5B7B2264656C466C6167223A66616C73652C226964223A33362C22736F7274223A33307D2C7B2264656C466C6167223A66616C73652C226964223A33352C22736F7274223A33307D2C7B2264656C466C6167223A66616C73652C226964223A322C22736F7274223A33307D2C7B2264656C466C6167223A66616C73652C226964223A32362C22736F7274223A33307D2C7B2264656C466C6167223A66616C73652C226964223A362C22736F7274223A33307D2C7B2264656C466C6167223A66616C73652C226964223A35332C22736F7274223A33307D2C7B2264656C466C6167223A66616C73652C226964223A342C22736F7274223A33307D2C7B2264656C466C6167223A66616C73652C226964223A32352C22736F7274223A33307D2C7B2264656C466C6167223A66616C73652C226964223A312C22736F7274223A33307D2C7B2264656C466C6167223A66616C73652C226964223A332C22736F7274223A33307D2C7B2264656C466C6167223A66616C73652C226964223A32322C22736F7274223A33307D2C7B2264656C466C6167223A66616C73652C226964223A32312C22736F7274223A33307D2C7B2264656C466C6167223A66616C73652C226964223A32342C22736F7274223A33307D2C7B2264656C466C6167223A66616C73652C226964223A33372C22736F7274223A33307D2C7B2264656C466C6167223A66616C73652C226964223A32302C22736F7274223A33307D2C7B2264656C466C6167223A66616C73652C226964223A35352C22736F7274223A33307D5D2C226E616D65223A22E8B685E7BAA7E7B3BBE7BB9FE7AEA1E79086E59198222C2272656D61726B73223A22E585B7E5A487E68980E69C89E69D83E99990227D5D, 'D3E72DAD9D0A27005159BBF8A3B66E6C', 0x7B22636F6465223A302C2273756363657373223A747275652C226D657373616765223A22E68890E58A9F227D, '86', 'Windows-Chrome-80.0.3987.163', null, null, null, null, null, '1', '2020-09-28 07:24:28', '1', '2020-09-28 07:24:28', null, '\0');
INSERT INTO `sys_log` VALUES ('265', '普通请求', '退出成功', '192.168.0.2', 'admin', 'http://192.168.0.2:9000/system/log', 'POST', 'cn.xueden.system.controller.LogController', 0x5B757365726E616D653A61646D696E2C6D6573736167653AE98080E587BAE68890E58A9F5D, 'A6D43E23ED48AF965E33F8F724116D91', null, '0', 'UnKnown, More-Info: Java/1.8.0_172-UnKnown, More-Info: Java/1.8.0_172', '内网IP0', '0', '内网IP', '内网IP', null, null, '2020-09-28 07:25:06', null, '2020-09-28 07:25:06', null, '\0');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单',
  `level` bigint(2) DEFAULT NULL COMMENT '菜单层级',
  `parent_ids` varchar(2000) DEFAULT NULL COMMENT '父菜单联集',
  `sort` smallint(6) DEFAULT NULL COMMENT '排序',
  `href` varchar(2000) DEFAULT NULL COMMENT '链接地址',
  `target` varchar(20) DEFAULT NULL COMMENT '打开方式',
  `icon` varchar(100) DEFAULT NULL COMMENT '菜单图标',
  `bg_color` varchar(255) DEFAULT NULL COMMENT '显示背景色',
  `is_show` tinyint(2) DEFAULT NULL COMMENT '是否显示',
  `is_menu` tinyint(2) DEFAULT '0' COMMENT '是否是菜单，0表示是菜单，1表示按钮，-1表示目录',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `create_by` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', null, '1', '1,', '20', '', null, 'fa fa-navicon', null, '1', '-1', '', '1', '2018-01-16 11:29:46', '1', '2020-02-10 06:10:33', null, '0');
INSERT INTO `sys_menu` VALUES ('2', '系统用户管理', '1', '2', '1,2,', '9', 'page/user/list.html', null, 'fa fa-user', '#47e69c', '1', '0', 'sys:user:list', '1', '2018-01-16 11:31:18', '1', '2018-01-20 05:59:20', null, '0');
INSERT INTO `sys_menu` VALUES ('3', '系统角色管理', '1', '2', '1,3,', '10', 'page/role/list.html', null, 'fa fa-trophy', '#c23ab9', '1', '0', 'sys:role:list', '1', '2018-01-16 11:32:33', '1', '2018-01-20 05:58:58', null, '0');
INSERT INTO `sys_menu` VALUES ('4', '系统权限管理', '1', '2', '1,4,', '20', 'page/menu/list.html', null, 'fa fa-motorcycle', '#d4573b', '1', '0', 'sys:menu:list', '1', '2018-01-16 11:33:19', '1', '2018-02-08 09:49:28', null, '0');
INSERT INTO `sys_menu` VALUES ('6', '系统日志管理', '1', '2', '1,6,', '40', 'page/log/list.html', null, 'fa fa-clock-o', '#b56c18', '1', '0', 'sys:log:list', '1', '2018-01-16 11:35:31', '1', '2018-01-20 05:12:17', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '新增系统权限', '4', '3', '1,4,20,', '0', '', null, null, null, '0', '1', 'sys:menu:add', '1', '2018-02-08 09:49:15', '1', '2018-02-08 09:49:38', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '编辑系统权限', '4', '3', '1,4,21,', '10', '', null, null, null, '0', '1', 'sys:menu:edit', '1', '2018-02-08 09:50:16', '1', '2018-02-08 09:50:25', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '删除系统权限', '4', '3', '1,4,22,', '20', '', null, null, null, '0', '1', 'sys:menu:delete', '1', '2018-02-08 09:51:53', '1', '2018-02-08 09:53:42', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '新增系统角色', '3', '3', '1,3,24,', '0', '', null, null, null, '0', '1', 'sys:role:add', '1', '2018-02-08 09:58:11', '1', '2018-02-08 09:58:11', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '编辑菜单权限', '3', '3', '1,3,25,', '10', '', null, null, null, '0', '1', 'sys:role:edit', '1', '2018-02-08 09:59:01', '1', '2018-02-08 09:59:01', null, '0');
INSERT INTO `sys_menu` VALUES ('26', '删除角色', '3', '3', '1,3,26,', '20', '', null, null, null, '0', '1', 'sys:role:delete', '1', '2018-02-08 09:59:56', '1', '2018-02-08 09:59:56', null, '0');
INSERT INTO `sys_menu` VALUES ('35', '新增系统用户', '2', '3', '1,2,35,', '0', '', null, null, null, '0', '1', 'sys:user:add', '1', '2018-02-08 10:10:32', '1', '2018-02-08 10:10:32', null, '0');
INSERT INTO `sys_menu` VALUES ('36', '编辑系统用户', '2', '3', '1,2,36,', '10', '', null, null, null, '0', '1', 'sys:user:edit', '1', '2018-02-08 10:11:49', '1', '2018-02-08 10:11:49', null, '0');
INSERT INTO `sys_menu` VALUES ('37', '删除系统用户', '2', '3', '1,2,37,', '20', '', null, null, null, '0', '1', 'sys:user:delete', '1', '2018-02-08 10:12:43', '1', '2018-02-08 10:12:43', null, '0');
INSERT INTO `sys_menu` VALUES ('53', '修改密码', '2', '3', '1,2,53,', '30', '', null, '', null, '0', '1', 'sys:user:changePassword', '1', '2018-03-15 10:14:06', '1', '2018-03-15 10:14:06', null, '0');
INSERT INTO `sys_menu` VALUES ('55', '删除日志权限', '6', '3', '1,6,55,', '0', '', null, null, null, '0', '1', 'sys:log:delete', '1', '2020-02-10 12:25:56', '1', '2020-02-10 12:25:56', null, '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL COMMENT '角色名称',
  `create_date` datetime DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '老司机', '2020-02-06 14:19:07', '1', '2020-02-08 13:01:19', '1', '阿斯蒂芬', '0');
INSERT INTO `sys_role` VALUES ('2', '超级系统管理员', '2020-02-06 19:36:37', '1', '2020-09-28 07:24:28', null, '具备所有权限', '0');
INSERT INTO `sys_role` VALUES ('4', '马王天地', '2020-02-08 05:22:35', '1', '2020-02-08 12:22:34', '1', '阿斯蒂芬', '0');
INSERT INTO `sys_role` VALUES ('5', '学灯网', '2020-02-08 09:56:45', '1', '2020-02-12 19:44:41', '1', 'asdf', '0');
INSERT INTO `sys_role` VALUES ('6', '苹果11', '2020-02-12 19:41:18', '5', '2020-02-12 19:41:18', '5', 'asdfsf', '0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '6');
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '6');
INSERT INTO `sys_role_menu` VALUES ('2', '20');
INSERT INTO `sys_role_menu` VALUES ('2', '21');
INSERT INTO `sys_role_menu` VALUES ('2', '22');
INSERT INTO `sys_role_menu` VALUES ('2', '24');
INSERT INTO `sys_role_menu` VALUES ('2', '25');
INSERT INTO `sys_role_menu` VALUES ('2', '26');
INSERT INTO `sys_role_menu` VALUES ('2', '35');
INSERT INTO `sys_role_menu` VALUES ('2', '36');
INSERT INTO `sys_role_menu` VALUES ('2', '37');
INSERT INTO `sys_role_menu` VALUES ('2', '53');
INSERT INTO `sys_role_menu` VALUES ('2', '55');
INSERT INTO `sys_role_menu` VALUES ('5', '1');
INSERT INTO `sys_role_menu` VALUES ('5', '2');
INSERT INTO `sys_role_menu` VALUES ('5', '3');
INSERT INTO `sys_role_menu` VALUES ('5', '4');
INSERT INTO `sys_role_menu` VALUES ('5', '6');
INSERT INTO `sys_role_menu` VALUES ('5', '24');
INSERT INTO `sys_role_menu` VALUES ('5', '35');
INSERT INTO `sys_role_menu` VALUES ('5', '36');
INSERT INTO `sys_role_menu` VALUES ('5', '37');
INSERT INTO `sys_role_menu` VALUES ('6', '1');
INSERT INTO `sys_role_menu` VALUES ('6', '6');
INSERT INTO `sys_role_menu` VALUES ('6', '55');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `login_name` varchar(36) DEFAULT NULL COMMENT '登录名',
  `nick_name` varchar(40) DEFAULT NULL COMMENT '昵称',
  `icon` varchar(2000) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `salt` varchar(40) DEFAULT NULL COMMENT 'shiro加密盐',
  `tel` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱地址',
  `locked` tinyint(2) DEFAULT NULL COMMENT '是否锁定',
  `create_date` datetime DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '梁老五', 'http://qiniu.goodym.cn/e5af9b7b-ffbf-4ecb-af53-059efe7e07fe.jpg', '$2a$10$BUhRXeAz1H1nGyBStDzZFe0ikAj5sFnpvAz/Z3XszI2YIqyHEkU5.', 'f79a4340ed671cd4', '15011975772', '11184629@qq.com', '0', '2020-02-08 22:19:39', '1', '2020-02-13 23:00:25', '1', '小码农一只,从事java后台开发', '0');
INSERT INTO `sys_user` VALUES ('5', 'test', '测试用户', null, '218058a9c196a9cce48af50498bb4d3691639765', '693a23d256083819', '13800138000', 'test@qq.com', '0', '2020-02-08 11:01:29', '1', '2020-02-12 19:37:45', '1', null, '0');
INSERT INTO `sys_user` VALUES ('6', 'employee', '老司机', null, 'cee7df55ca69ed161f102233615deff625a49a41', '9733a4a54e5f450c', '13800138001', '111846291@qq.com', '0', '2020-02-08 12:59:57', '1', '2020-02-09 11:51:04', '1', null, '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '2');
INSERT INTO `sys_user_role` VALUES ('4', '2');
INSERT INTO `sys_user_role` VALUES ('5', '5');
INSERT INTO `sys_user_role` VALUES ('6', '1');
INSERT INTO `sys_user_role` VALUES ('6', '5');
