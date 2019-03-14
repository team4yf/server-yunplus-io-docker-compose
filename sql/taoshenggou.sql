-- phpMyAdmin SQL Dump
-- version 4.4.15.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2019-02-28 11:26:20
-- 服务器版本： 5.5.48-log
-- PHP Version: 5.6.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taoshenggou`
--

-- --------------------------------------------------------

--
-- 表的结构 `tsg_action`
--

CREATE TABLE IF NOT EXISTS `tsg_action` (
  `id` int(11) unsigned NOT NULL COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间'
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

--
-- 转存表中的数据 `tsg_action`
--

INSERT INTO `tsg_action` (`id`, `name`, `title`, `remark`, `rule`, `log`, `type`, `status`, `update_time`) VALUES
(1, 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', 1, 1, 1387181220),
(2, 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', 2, 0, 1380173180),
(3, 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', 2, 1, 1383285646),
(4, 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', 2, 0, 1386139726),
(5, 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', 2, 0, 1383285551),
(6, 'update_config', '更新配置', '新增或修改或删除配置', '', '', 1, 1, 1383294988),
(7, 'update_model', '更新模型', '新增或修改模型', '', '', 1, 1, 1383295057),
(8, 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', 1, 1, 1383295963),
(9, 'update_channel', '更新导航', '新增或修改或删除导航', '', '', 1, 1, 1383296301),
(10, 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', 1, 1, 1383296392),
(11, 'update_category', '更新分类', '新增或修改或删除分类', '', '', 1, 1, 1383296765);

-- --------------------------------------------------------

--
-- 表的结构 `tsg_action_log`
--

CREATE TABLE IF NOT EXISTS `tsg_action_log` (
  `id` int(10) unsigned NOT NULL COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间'
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

--
-- 转存表中的数据 `tsg_action_log`
--

INSERT INTO `tsg_action_log` (`id`, `action_id`, `user_id`, `action_ip`, `model`, `record_id`, `remark`, `status`, `create_time`) VALUES
(1, 1, 1, 1968933735, 'member', 1, 'admin在2017-09-22 08:47登录了后台', 1, 1506041278),
(2, 11, 1, 1968933735, 'category', 39, '操作url：/taoshenggou/wwwroot/index.php?s=/admin/category/add.html', 1, 1506041579),
(3, 1, 1, 1879363954, 'member', 1, 'admin在2017-10-08 12:35登录了后台', 1, 1507437309),
(4, 1, 1, 1968898611, 'member', 1, 'admin在2017-10-18 09:33登录了后台', 1, 1508290417),
(5, 1, 1, 1968900020, 'member', 1, 'admin在2017-10-19 10:35登录了后台', 1, 1508380550),
(6, 1, 1, 1968900020, 'member', 1, 'admin在2017-10-19 18:13登录了后台', 1, 1508408002),
(7, 1, 1, 1968900020, 'member', 1, 'admin在2017-10-20 10:42登录了后台', 1, 1508467336),
(8, 1, 1, 1968900020, 'member', 1, 'admin在2017-10-20 10:51登录了后台', 1, 1508467877),
(9, 1, 1, 3730679885, 'member', 1, 'admin在2017-10-20 11:08登录了后台', 1, 1508468913),
(10, 1, 1, 3730699179, 'member', 1, 'admin在2017-10-27 19:20登录了后台', 1, 1509103203),
(11, 1, 1, 1968898838, 'member', 1, 'admin在2017-11-13 17:03登录了后台', 1, 1510563839),
(12, 1, 1, 1968898838, 'member', 1, 'admin在2017-11-14 09:06登录了后台', 1, 1510621608),
(13, 1, 1, 1968898226, 'member', 1, 'admin在2017-11-15 15:07登录了后台', 1, 1510729626),
(14, 10, 1, 1968898226, 'Menu', 122, '操作url：/taoshenggou/wwwroot/index.php?s=/admin/menu/add.html', 1, 1510729728),
(15, 10, 1, 1968898226, 'Menu', 122, '操作url：/taoshenggou/wwwroot/index.php?s=/admin/menu/edit.html', 1, 1510729894),
(16, 10, 1, 1968898226, 'Menu', 123, '操作url：/taoshenggou/wwwroot/index.php?s=/admin/menu/add.html', 1, 1510740193),
(17, 10, 1, 1968898226, 'Menu', 124, '操作url：/taoshenggou/wwwroot/index.php?s=/admin/menu/add.html', 1, 1510740203),
(18, 10, 1, 1968898226, 'Menu', 125, '操作url：/taoshenggou/wwwroot/index.php?s=/admin/menu/add.html', 1, 1510740212),
(19, 10, 1, 1968898226, 'Menu', 126, '操作url：/taoshenggou/wwwroot/index.php?s=/admin/menu/add.html', 1, 1510740220),
(20, 10, 1, 1968898226, 'Menu', 127, '操作url：/taoshenggou/wwwroot/index.php?s=/admin/menu/add.html', 1, 1510740228),
(21, 10, 1, 1968898226, 'Menu', 128, '操作url：/taoshenggou/wwwroot/index.php?s=/admin/menu/add.html', 1, 1510740237),
(22, 1, 1, 1968898226, 'member', 1, 'admin在2017-11-15 18:14登录了后台', 1, 1510740894),
(23, 1, 1, 1968258457, 'member', 1, 'admin在2017-11-16 10:02登录了后台', 1, 1510797762),
(24, 1, 1, 1968258457, 'member', 1, 'admin在2017-11-16 10:03登录了后台', 1, 1510797806),
(25, 1, 1, 1968900078, 'member', 1, 'admin在2017-11-16 11:14登录了后台', 1, 1510802081),
(26, 1, 1, 1968899391, 'member', 1, 'admin在2017-11-21 09:55登录了后台', 1, 1511229347),
(27, 10, 1, 1968899391, 'Menu', 129, '操作url：/taoshenggou/wwwroot/index.php?s=/admin/menu/add.html', 1, 1511229380),
(28, 1, 1, 1968898310, 'member', 1, 'admin在2017-11-27 10:29登录了后台', 1, 1511749787),
(29, 1, 1, 1968899024, 'member', 1, 'admin在2017-11-28 09:34登录了后台', 1, 1511832863),
(30, 1, 1, 1968899024, 'member', 1, 'admin在2017-11-28 09:45登录了后台', 1, 1511833518),
(31, 1, 1, 1967018389, 'member', 1, 'admin在2017-12-05 23:09登录了后台', 1, 1512486580),
(32, 1, 1, 1967018347, 'member', 1, 'admin在2017-12-07 13:57登录了后台', 1, 1512626240),
(33, 1, 1, 1968898433, 'member', 1, 'admin在2017-12-08 10:49登录了后台', 1, 1512701384),
(34, 1, 1, 3719685322, 'member', 1, 'admin在2017-12-10 09:36登录了后台', 1, 1512869798),
(35, 11, 1, 3719685337, 'category', 2, '操作url：/taoshenggou/wwwroot/index.php?s=/admin/category/remove/id/2.html', 1, 1512870070),
(36, 11, 1, 3719685361, 'category', 1, '操作url：/taoshenggou/wwwroot/index.php?s=/admin/category/remove/id/1.html', 1, 1512870078),
(37, 11, 1, 3719685322, 'category', 40, '操作url：/taoshenggou/wwwroot/index.php?s=/admin/category/add.html', 1, 1512870182),
(38, 11, 1, 3719685322, 'category', 40, '操作url：/taoshenggou/wwwroot/index.php?s=/admin/category/edit.html', 1, 1512870336),
(39, 1, 1, 1968899145, 'member', 1, 'admin在2017-12-11 09:25登录了后台', 1, 1512955515),
(40, 1, 1, 3084219566, 'member', 1, 'admin在2017-12-13 17:36登录了后台', 1, 1513157775),
(41, 1, 1, 1968898551, 'member', 1, 'admin在2017-12-18 09:58登录了后台', 1, 1513562291),
(42, 1, 1, 1966998070, 'member', 1, 'admin在2017-12-19 13:49登录了后台', 1, 1513662562),
(43, 1, 1, 1967018332, 'member', 1, 'admin在2017-12-20 19:20登录了后台', 1, 1513768824),
(44, 1, 1, 1967018332, 'member', 1, 'admin在2017-12-20 19:22登录了后台', 1, 1513768944),
(45, 1, 1, 1967018332, 'member', 1, 'admin在2017-12-21 13:06登录了后台', 1, 1513832812),
(46, 1, 1, 1968278572, 'member', 1, 'admin在2017-12-25 15:25登录了后台', 1, 1514186750),
(47, 1, 1, 1968898957, 'member', 1, 'admin在2017-12-25 15:56登录了后台', 1, 1514188611),
(48, 1, 1, 1968898957, 'member', 1, 'admin在2017-12-26 18:39登录了后台', 1, 1514284775),
(49, 1, 1, 3730688757, 'member', 1, 'admin在2017-12-27 20:29登录了后台', 1, 1514377782),
(50, 1, 1, 3730696746, 'member', 1, 'admin在2018-01-06 15:41登录了后台', 1, 1515224489),
(51, 1, 1, 3730696808, 'member', 1, 'admin在2018-01-08 11:37登录了后台', 1, 1515382676),
(52, 1, 1, 1968899381, 'member', 1, 'admin在2018-01-08 13:32登录了后台', 1, 1515389559),
(53, 1, 1, 2059537891, 'member', 1, 'admin在2018-01-09 22:45登录了后台', 1, 1515509131),
(54, 1, 1, 3730699195, 'member', 1, 'admin在2018-01-10 15:01登录了后台', 1, 1515567678),
(55, 1, 1, 1968899666, 'member', 1, 'admin在2018-01-10 15:01登录了后台', 1, 1515567717),
(56, 1, 1, 3730699195, 'member', 1, 'admin在2018-01-10 16:26登录了后台', 1, 1515572771),
(57, 1, 1, 3730699195, 'member', 1, 'admin在2018-01-10 17:15登录了后台', 1, 1515575742),
(58, 1, 1, 3719685333, 'member', 1, 'admin在2018-01-10 17:54登录了后台', 1, 1515578059),
(59, 1, 1, 3730679829, 'member', 1, 'admin在2018-01-13 15:48登录了后台', 1, 1515829684),
(60, 1, 1, 1967022525, 'member', 1, 'admin在2018-01-17 19:03登录了后台', 1, 1516186987),
(61, 1, 1, 1968258494, 'member', 1, 'admin在2018-01-20 13:31登录了后台', 1, 1516426291),
(62, 1, 1, 1968898858, 'member', 1, 'admin在2018-01-20 15:09登录了后台', 1, 1516432164),
(63, 1, 1, 1968899771, 'member', 1, 'admin在2018-01-22 12:55登录了后台', 1, 1516596941),
(64, 1, 1, 1968299583, 'member', 1, 'admin在2018-01-30 15:58登录了后台', 1, 1517299126),
(65, 1, 1, 2044767153, 'member', 1, 'admin在2018-03-26 13:39登录了后台', 1, 1522042762),
(66, 1, 1, 986770109, 'member', 1, 'admin在2018-05-04 14:03登录了后台', 1, 1525413807),
(67, 1, 1, 3026977651, 'member', 1, 'admin在2018-05-08 12:17登录了后台', 1, 1525753036),
(68, 1, 1, 1968192761, 'member', 1, 'admin在2018-05-09 13:23登录了后台', 1, 1525843380),
(69, 1, 1, 1968192761, 'member', 1, 'admin在2018-05-09 14:07登录了后台', 1, 1525846026),
(70, 1, 1, 1926867748, 'member', 1, 'admin在2018-05-21 10:33登录了后台', 1, 1526870023),
(71, 1, 1, 1926867748, 'member', 1, 'admin在2018-05-21 17:12登录了后台', 1, 1526893947),
(72, 1, 1, 1926867748, 'member', 1, 'admin在2018-05-22 13:55登录了后台', 1, 1526968541),
(73, 1, 1, 2045730757, 'member', 1, 'admin在2018-06-09 14:31登录了后台', 1, 1528525919),
(74, 1, 1, 2045730757, 'member', 1, 'admin在2018-06-10 09:57登录了后台', 1, 1528595834),
(75, 1, 1, 3026886784, 'member', 1, 'admin在2018-06-11 09:54登录了后台', 1, 1528682051),
(76, 1, 1, 3026886784, 'member', 1, 'admin在2018-06-11 09:56登录了后台', 1, 1528682162),
(77, 1, 1, 2045541021, 'member', 1, 'admin在2018-06-13 10:14登录了后台', 1, 1528856081),
(78, 1, 1, 827043320, 'member', 1, 'admin在2018-06-15 09:06登录了后台', 1, 1529024788),
(79, 1, 1, 2044984430, 'member', 1, 'admin在2018-06-28 08:27登录了后台', 1, 1530145661),
(80, 1, 1, 1968396636, 'member', 1, 'admin在2018-11-06 14:18登录了后台', 1, 1541485119),
(81, 1, 1, 1968396636, 'member', 1, 'admin在2018-11-08 14:43登录了后台', 1, 1541659439),
(82, 1, 1, 2045038010, 'member', 1, 'admin在2018-12-08 13:16登录了后台', 1, 1544246193),
(83, 1, 1, 1968397070, 'member', 1, 'admin在2019-02-25 14:25登录了后台', 1, 1551075945),
(84, 1, 1, 1968397070, 'member', 1, 'admin在2019-02-25 14:29登录了后台', 1, 1551076192);

-- --------------------------------------------------------

--
-- 表的结构 `tsg_addons`
--

CREATE TABLE IF NOT EXISTS `tsg_addons` (
  `id` int(10) unsigned NOT NULL COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表'
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='插件表';

--
-- 转存表中的数据 `tsg_addons`
--

INSERT INTO `tsg_addons` (`id`, `name`, `title`, `description`, `status`, `config`, `author`, `version`, `create_time`, `has_adminlist`) VALUES
(15, 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"500px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1383126253, 0),
(2, 'SiteStat', '站点统计信息', '统计站点的基础信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"1","display":"1","status":"0"}', 'thinkphp', '0.1', 1379512015, 0),
(4, 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"2","display":"1"}', 'thinkphp', '0.1', 1379512036, 0),
(5, 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"300px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1379830910, 0),
(6, 'Attachment', '附件', '用于文档模型上传附件', 1, 'null', 'thinkphp', '0.1', 1379842319, 1),
(9, 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', 1, '{"comment_type":"1","comment_uid_youyan":"","comment_short_name_duoshuo":"","comment_data_list_duoshuo":""}', 'thinkphp', '0.1', 1380273962, 0);

-- --------------------------------------------------------

--
-- 表的结构 `tsg_attachment`
--

CREATE TABLE IF NOT EXISTS `tsg_attachment` (
  `id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- --------------------------------------------------------

--
-- 表的结构 `tsg_attribute`
--

CREATE TABLE IF NOT EXISTS `tsg_attribute` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL,
  `validate_time` tinyint(1) unsigned NOT NULL,
  `error_info` varchar(100) NOT NULL,
  `validate_type` varchar(25) NOT NULL,
  `auto_rule` varchar(100) NOT NULL,
  `auto_time` tinyint(1) unsigned NOT NULL,
  `auto_type` varchar(25) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='模型属性表';

--
-- 转存表中的数据 `tsg_attribute`
--

INSERT INTO `tsg_attribute` (`id`, `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES
(1, 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1384508362, 1383891233, '', 0, '', '', '', 0, ''),
(2, 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', 1, '', 1, 0, 1, 1383894743, 1383891233, '', 0, '', '', '', 0, ''),
(3, 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', 1, '', 1, 0, 1, 1383894778, 1383891233, '', 0, '', '', '', 0, ''),
(4, 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', 0, '', 1, 0, 1, 1384508336, 1383891233, '', 0, '', '', '', 0, ''),
(5, 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', 1, '', 1, 0, 1, 1383894927, 1383891233, '', 0, '', '', '', 0, ''),
(6, 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', 0, '', 1, 0, 1, 1384508323, 1383891233, '', 0, '', '', '', 0, ''),
(7, 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', 0, '', 1, 0, 1, 1384508543, 1383891233, '', 0, '', '', '', 0, ''),
(8, 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', 0, '', 1, 0, 1, 1384508350, 1383891233, '', 0, '', '', '', 0, ''),
(9, 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', 1, '1:目录\r\n2:主题\r\n3:段落', 1, 0, 1, 1384511157, 1383891233, '', 0, '', '', '', 0, ''),
(10, 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', 1, '1:列表推荐\r\n2:频道页推荐\r\n4:首页推荐', 1, 0, 1, 1383895640, 1383891233, '', 0, '', '', '', 0, ''),
(11, 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', 1, '', 1, 0, 1, 1383895757, 1383891233, '', 0, '', '', '', 0, ''),
(12, 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', 1, '', 1, 0, 1, 1384147827, 1383891233, '', 0, '', '', '', 0, ''),
(13, 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', 1, '0:不可见\r\n1:所有人可见', 1, 0, 1, 1386662271, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(14, 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', 1, '', 1, 0, 1, 1387163248, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(15, 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1387260355, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(16, 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895835, 1383891233, '', 0, '', '', '', 0, ''),
(17, 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895846, 1383891233, '', 0, '', '', '', 0, ''),
(18, 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', 0, '', 1, 0, 1, 1384508264, 1383891233, '', 0, '', '', '', 0, ''),
(19, 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', 1, '', 1, 0, 1, 1383895894, 1383891233, '', 0, '', '', '', 0, ''),
(20, 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 1, '', 1, 0, 1, 1383895903, 1383891233, '', 0, '', '', '', 0, ''),
(21, 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 0, '', 1, 0, 1, 1384508277, 1383891233, '', 0, '', '', '', 0, ''),
(22, 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', 0, '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', 1, 0, 1, 1384508496, 1383891233, '', 0, '', '', '', 0, ''),
(23, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', 0, '0:html\r\n1:ubb\r\n2:markdown', 2, 0, 1, 1384511049, 1383891243, '', 0, '', '', '', 0, ''),
(24, 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', 1, '', 2, 0, 1, 1383896225, 1383891243, '', 0, '', '', '', 0, ''),
(25, 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', 1, '', 2, 0, 1, 1383896190, 1383891243, '', 0, '', '', '', 0, ''),
(26, 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 2, 0, 1, 1383896103, 1383891243, '', 0, '', '', '', 0, ''),
(27, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', 0, '0:html\r\n1:ubb\r\n2:markdown', 3, 0, 1, 1387260461, 1383891252, '', 0, '', 'regex', '', 0, 'function'),
(28, 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', 1, '', 3, 0, 1, 1383896438, 1383891252, '', 0, '', '', '', 0, ''),
(29, 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', 1, '', 3, 0, 1, 1383896429, 1383891252, '', 0, '', '', '', 0, ''),
(30, 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', 1, '', 3, 0, 1, 1383896415, 1383891252, '', 0, '', '', '', 0, ''),
(31, 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 3, 0, 1, 1383896380, 1383891252, '', 0, '', '', '', 0, ''),
(32, 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', 1, '', 3, 0, 1, 1383896371, 1383891252, '', 0, '', '', '', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `tsg_auth_extend`
--

CREATE TABLE IF NOT EXISTS `tsg_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

--
-- 转存表中的数据 `tsg_auth_extend`
--

INSERT INTO `tsg_auth_extend` (`group_id`, `extend_id`, `type`) VALUES
(1, 1, 1),
(1, 1, 2),
(1, 2, 1),
(1, 2, 2),
(1, 3, 1),
(1, 3, 2),
(1, 4, 1),
(1, 37, 1);

-- --------------------------------------------------------

--
-- 表的结构 `tsg_auth_group`
--

CREATE TABLE IF NOT EXISTS `tsg_auth_group` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tsg_auth_group`
--

INSERT INTO `tsg_auth_group` (`id`, `module`, `type`, `title`, `description`, `status`, `rules`) VALUES
(1, 'admin', 1, '默认用户组', '', 1, '1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106'),
(2, 'admin', 1, '测试用户', '测试用户', 1, '1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,96,97,100,102,103,195');

-- --------------------------------------------------------

--
-- 表的结构 `tsg_auth_group_access`
--

CREATE TABLE IF NOT EXISTS `tsg_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tsg_auth_rule`
--

CREATE TABLE IF NOT EXISTS `tsg_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件'
) ENGINE=MyISAM AUTO_INCREMENT=217 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tsg_auth_rule`
--

INSERT INTO `tsg_auth_rule` (`id`, `module`, `type`, `name`, `title`, `status`, `condition`) VALUES
(1, 'admin', 2, 'Admin/Index/index', '首页', 1, ''),
(2, 'admin', 2, 'Admin/Article/mydocument', '内容', 1, ''),
(3, 'admin', 2, 'Admin/User/index', '用户', 1, ''),
(4, 'admin', 2, 'Admin/Addons/index', '扩展', 1, ''),
(5, 'admin', 2, 'Admin/Config/group', '系统', 1, ''),
(7, 'admin', 1, 'Admin/article/add', '新增', 1, ''),
(8, 'admin', 1, 'Admin/article/edit', '编辑', 1, ''),
(9, 'admin', 1, 'Admin/article/setStatus', '改变状态', 1, ''),
(10, 'admin', 1, 'Admin/article/update', '保存', 1, ''),
(11, 'admin', 1, 'Admin/article/autoSave', '保存草稿', 1, ''),
(12, 'admin', 1, 'Admin/article/move', '移动', 1, ''),
(13, 'admin', 1, 'Admin/article/copy', '复制', 1, ''),
(14, 'admin', 1, 'Admin/article/paste', '粘贴', 1, ''),
(15, 'admin', 1, 'Admin/article/permit', '还原', 1, ''),
(16, 'admin', 1, 'Admin/article/clear', '清空', 1, ''),
(17, 'admin', 1, 'Admin/article/index', '文档列表', 1, ''),
(18, 'admin', 1, 'Admin/article/recycle', '回收站', 1, ''),
(19, 'admin', 1, 'Admin/User/addaction', '新增用户行为', 1, ''),
(20, 'admin', 1, 'Admin/User/editaction', '编辑用户行为', 1, ''),
(21, 'admin', 1, 'Admin/User/saveAction', '保存用户行为', 1, ''),
(22, 'admin', 1, 'Admin/User/setStatus', '变更行为状态', 1, ''),
(23, 'admin', 1, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', 1, ''),
(24, 'admin', 1, 'Admin/User/changeStatus?method=resumeUser', '启用会员', 1, ''),
(25, 'admin', 1, 'Admin/User/changeStatus?method=deleteUser', '删除会员', 1, ''),
(26, 'admin', 1, 'Admin/User/index', '用户信息', 1, ''),
(27, 'admin', 1, 'Admin/User/action', '用户行为', 1, ''),
(28, 'admin', 1, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', 1, ''),
(29, 'admin', 1, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', 1, ''),
(30, 'admin', 1, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', 1, ''),
(31, 'admin', 1, 'Admin/AuthManager/createGroup', '新增', 1, ''),
(32, 'admin', 1, 'Admin/AuthManager/editGroup', '编辑', 1, ''),
(33, 'admin', 1, 'Admin/AuthManager/writeGroup', '保存用户组', 1, ''),
(34, 'admin', 1, 'Admin/AuthManager/group', '授权', 1, ''),
(35, 'admin', 1, 'Admin/AuthManager/access', '访问授权', 1, ''),
(36, 'admin', 1, 'Admin/AuthManager/user', '成员授权', 1, ''),
(37, 'admin', 1, 'Admin/AuthManager/removeFromGroup', '解除授权', 1, ''),
(38, 'admin', 1, 'Admin/AuthManager/addToGroup', '保存成员授权', 1, ''),
(39, 'admin', 1, 'Admin/AuthManager/category', '分类授权', 1, ''),
(40, 'admin', 1, 'Admin/AuthManager/addToCategory', '保存分类授权', 1, ''),
(41, 'admin', 1, 'Admin/AuthManager/index', '权限管理', 1, ''),
(42, 'admin', 1, 'Admin/Addons/create', '创建', 1, ''),
(43, 'admin', 1, 'Admin/Addons/checkForm', '检测创建', 1, ''),
(44, 'admin', 1, 'Admin/Addons/preview', '预览', 1, ''),
(45, 'admin', 1, 'Admin/Addons/build', '快速生成插件', 1, ''),
(46, 'admin', 1, 'Admin/Addons/config', '设置', 1, ''),
(47, 'admin', 1, 'Admin/Addons/disable', '禁用', 1, ''),
(48, 'admin', 1, 'Admin/Addons/enable', '启用', 1, ''),
(49, 'admin', 1, 'Admin/Addons/install', '安装', 1, ''),
(50, 'admin', 1, 'Admin/Addons/uninstall', '卸载', 1, ''),
(51, 'admin', 1, 'Admin/Addons/saveconfig', '更新配置', 1, ''),
(52, 'admin', 1, 'Admin/Addons/adminList', '插件后台列表', 1, ''),
(53, 'admin', 1, 'Admin/Addons/execute', 'URL方式访问插件', 1, ''),
(54, 'admin', 1, 'Admin/Addons/index', '插件管理', 1, ''),
(55, 'admin', 1, 'Admin/Addons/hooks', '钩子管理', 1, ''),
(56, 'admin', 1, 'Admin/model/add', '新增', 1, ''),
(57, 'admin', 1, 'Admin/model/edit', '编辑', 1, ''),
(58, 'admin', 1, 'Admin/model/setStatus', '改变状态', 1, ''),
(59, 'admin', 1, 'Admin/model/update', '保存数据', 1, ''),
(60, 'admin', 1, 'Admin/Model/index', '模型管理', 1, ''),
(61, 'admin', 1, 'Admin/Config/edit', '编辑', 1, ''),
(62, 'admin', 1, 'Admin/Config/del', '删除', 1, ''),
(63, 'admin', 1, 'Admin/Config/add', '新增', 1, ''),
(64, 'admin', 1, 'Admin/Config/save', '保存', 1, ''),
(65, 'admin', 1, 'Admin/Config/group', '网站设置', 1, ''),
(66, 'admin', 1, 'Admin/Config/index', '配置管理', 1, ''),
(67, 'admin', 1, 'Admin/Channel/add', '新增', 1, ''),
(68, 'admin', 1, 'Admin/Channel/edit', '编辑', 1, ''),
(69, 'admin', 1, 'Admin/Channel/del', '删除', 1, ''),
(70, 'admin', 1, 'Admin/Channel/index', '导航管理', 1, ''),
(71, 'admin', 1, 'Admin/Category/edit', '编辑', 1, ''),
(72, 'admin', 1, 'Admin/Category/add', '新增', 1, ''),
(73, 'admin', 1, 'Admin/Category/remove', '删除', 1, ''),
(74, 'admin', 1, 'Admin/Category/index', '分类管理', 1, ''),
(75, 'admin', 1, 'Admin/file/upload', '上传控件', -1, ''),
(76, 'admin', 1, 'Admin/file/uploadPicture', '上传图片', -1, ''),
(77, 'admin', 1, 'Admin/file/download', '下载', -1, ''),
(94, 'admin', 1, 'Admin/AuthManager/modelauth', '模型授权', 1, ''),
(79, 'admin', 1, 'Admin/article/batchOperate', '导入', 1, ''),
(80, 'admin', 1, 'Admin/Database/index?type=export', '备份数据库', 1, ''),
(81, 'admin', 1, 'Admin/Database/index?type=import', '还原数据库', 1, ''),
(82, 'admin', 1, 'Admin/Database/export', '备份', 1, ''),
(83, 'admin', 1, 'Admin/Database/optimize', '优化表', 1, ''),
(84, 'admin', 1, 'Admin/Database/repair', '修复表', 1, ''),
(86, 'admin', 1, 'Admin/Database/import', '恢复', 1, ''),
(87, 'admin', 1, 'Admin/Database/del', '删除', 1, ''),
(88, 'admin', 1, 'Admin/User/add', '新增用户', 1, ''),
(89, 'admin', 1, 'Admin/Attribute/index', '属性管理', 1, ''),
(90, 'admin', 1, 'Admin/Attribute/add', '新增', 1, ''),
(91, 'admin', 1, 'Admin/Attribute/edit', '编辑', 1, ''),
(92, 'admin', 1, 'Admin/Attribute/setStatus', '改变状态', 1, ''),
(93, 'admin', 1, 'Admin/Attribute/update', '保存数据', 1, ''),
(95, 'admin', 1, 'Admin/AuthManager/addToModel', '保存模型授权', 1, ''),
(96, 'admin', 1, 'Admin/Category/move', '移动', -1, ''),
(97, 'admin', 1, 'Admin/Category/merge', '合并', -1, ''),
(98, 'admin', 1, 'Admin/Config/menu', '后台菜单管理', -1, ''),
(99, 'admin', 1, 'Admin/Article/mydocument', '内容', -1, ''),
(100, 'admin', 1, 'Admin/Menu/index', '菜单管理', 1, ''),
(101, 'admin', 1, 'Admin/other', '其他', -1, ''),
(102, 'admin', 1, 'Admin/Menu/add', '新增', 1, ''),
(103, 'admin', 1, 'Admin/Menu/edit', '编辑', 1, ''),
(104, 'admin', 1, 'Admin/Think/lists?model=article', '文章管理', -1, ''),
(105, 'admin', 1, 'Admin/Think/lists?model=download', '下载管理', 1, ''),
(106, 'admin', 1, 'Admin/Think/lists?model=config', '配置管理', 1, ''),
(107, 'admin', 1, 'Admin/Action/actionlog', '行为日志', 1, ''),
(108, 'admin', 1, 'Admin/User/updatePassword', '修改密码', 1, ''),
(109, 'admin', 1, 'Admin/User/updateNickname', '修改昵称', 1, ''),
(110, 'admin', 1, 'Admin/action/edit', '查看行为日志', 1, ''),
(205, 'admin', 1, 'Admin/think/add', '新增数据', 1, ''),
(111, 'admin', 2, 'Admin/article/index', '文档列表', -1, ''),
(112, 'admin', 2, 'Admin/article/add', '新增', -1, ''),
(113, 'admin', 2, 'Admin/article/edit', '编辑', -1, ''),
(114, 'admin', 2, 'Admin/article/setStatus', '改变状态', -1, ''),
(115, 'admin', 2, 'Admin/article/update', '保存', -1, ''),
(116, 'admin', 2, 'Admin/article/autoSave', '保存草稿', -1, ''),
(117, 'admin', 2, 'Admin/article/move', '移动', -1, ''),
(118, 'admin', 2, 'Admin/article/copy', '复制', -1, ''),
(119, 'admin', 2, 'Admin/article/paste', '粘贴', -1, ''),
(120, 'admin', 2, 'Admin/article/batchOperate', '导入', -1, ''),
(121, 'admin', 2, 'Admin/article/recycle', '回收站', -1, ''),
(122, 'admin', 2, 'Admin/article/permit', '还原', -1, ''),
(123, 'admin', 2, 'Admin/article/clear', '清空', -1, ''),
(124, 'admin', 2, 'Admin/User/add', '新增用户', -1, ''),
(125, 'admin', 2, 'Admin/User/action', '用户行为', -1, ''),
(126, 'admin', 2, 'Admin/User/addAction', '新增用户行为', -1, ''),
(127, 'admin', 2, 'Admin/User/editAction', '编辑用户行为', -1, ''),
(128, 'admin', 2, 'Admin/User/saveAction', '保存用户行为', -1, ''),
(129, 'admin', 2, 'Admin/User/setStatus', '变更行为状态', -1, ''),
(130, 'admin', 2, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', -1, ''),
(131, 'admin', 2, 'Admin/User/changeStatus?method=resumeUser', '启用会员', -1, ''),
(132, 'admin', 2, 'Admin/User/changeStatus?method=deleteUser', '删除会员', -1, ''),
(133, 'admin', 2, 'Admin/AuthManager/index', '权限管理', -1, ''),
(134, 'admin', 2, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', -1, ''),
(135, 'admin', 2, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', -1, ''),
(136, 'admin', 2, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', -1, ''),
(137, 'admin', 2, 'Admin/AuthManager/createGroup', '新增', -1, ''),
(138, 'admin', 2, 'Admin/AuthManager/editGroup', '编辑', -1, ''),
(139, 'admin', 2, 'Admin/AuthManager/writeGroup', '保存用户组', -1, ''),
(140, 'admin', 2, 'Admin/AuthManager/group', '授权', -1, ''),
(141, 'admin', 2, 'Admin/AuthManager/access', '访问授权', -1, ''),
(142, 'admin', 2, 'Admin/AuthManager/user', '成员授权', -1, ''),
(143, 'admin', 2, 'Admin/AuthManager/removeFromGroup', '解除授权', -1, ''),
(144, 'admin', 2, 'Admin/AuthManager/addToGroup', '保存成员授权', -1, ''),
(145, 'admin', 2, 'Admin/AuthManager/category', '分类授权', -1, ''),
(146, 'admin', 2, 'Admin/AuthManager/addToCategory', '保存分类授权', -1, ''),
(147, 'admin', 2, 'Admin/AuthManager/modelauth', '模型授权', -1, ''),
(148, 'admin', 2, 'Admin/AuthManager/addToModel', '保存模型授权', -1, ''),
(149, 'admin', 2, 'Admin/Addons/create', '创建', -1, ''),
(150, 'admin', 2, 'Admin/Addons/checkForm', '检测创建', -1, ''),
(151, 'admin', 2, 'Admin/Addons/preview', '预览', -1, ''),
(152, 'admin', 2, 'Admin/Addons/build', '快速生成插件', -1, ''),
(153, 'admin', 2, 'Admin/Addons/config', '设置', -1, ''),
(154, 'admin', 2, 'Admin/Addons/disable', '禁用', -1, ''),
(155, 'admin', 2, 'Admin/Addons/enable', '启用', -1, ''),
(156, 'admin', 2, 'Admin/Addons/install', '安装', -1, ''),
(157, 'admin', 2, 'Admin/Addons/uninstall', '卸载', -1, ''),
(158, 'admin', 2, 'Admin/Addons/saveconfig', '更新配置', -1, ''),
(159, 'admin', 2, 'Admin/Addons/adminList', '插件后台列表', -1, ''),
(160, 'admin', 2, 'Admin/Addons/execute', 'URL方式访问插件', -1, ''),
(161, 'admin', 2, 'Admin/Addons/hooks', '钩子管理', -1, ''),
(162, 'admin', 2, 'Admin/Model/index', '模型管理', -1, ''),
(163, 'admin', 2, 'Admin/model/add', '新增', -1, ''),
(164, 'admin', 2, 'Admin/model/edit', '编辑', -1, ''),
(165, 'admin', 2, 'Admin/model/setStatus', '改变状态', -1, ''),
(166, 'admin', 2, 'Admin/model/update', '保存数据', -1, ''),
(167, 'admin', 2, 'Admin/Attribute/index', '属性管理', -1, ''),
(168, 'admin', 2, 'Admin/Attribute/add', '新增', -1, ''),
(169, 'admin', 2, 'Admin/Attribute/edit', '编辑', -1, ''),
(170, 'admin', 2, 'Admin/Attribute/setStatus', '改变状态', -1, ''),
(171, 'admin', 2, 'Admin/Attribute/update', '保存数据', -1, ''),
(172, 'admin', 2, 'Admin/Config/index', '配置管理', -1, ''),
(173, 'admin', 2, 'Admin/Config/edit', '编辑', -1, ''),
(174, 'admin', 2, 'Admin/Config/del', '删除', -1, ''),
(175, 'admin', 2, 'Admin/Config/add', '新增', -1, ''),
(176, 'admin', 2, 'Admin/Config/save', '保存', -1, ''),
(177, 'admin', 2, 'Admin/Menu/index', '菜单管理', -1, ''),
(178, 'admin', 2, 'Admin/Channel/index', '导航管理', -1, ''),
(179, 'admin', 2, 'Admin/Channel/add', '新增', -1, ''),
(180, 'admin', 2, 'Admin/Channel/edit', '编辑', -1, ''),
(181, 'admin', 2, 'Admin/Channel/del', '删除', -1, ''),
(182, 'admin', 2, 'Admin/Category/index', '分类管理', -1, ''),
(183, 'admin', 2, 'Admin/Category/edit', '编辑', -1, ''),
(184, 'admin', 2, 'Admin/Category/add', '新增', -1, ''),
(185, 'admin', 2, 'Admin/Category/remove', '删除', -1, ''),
(186, 'admin', 2, 'Admin/Category/move', '移动', -1, ''),
(187, 'admin', 2, 'Admin/Category/merge', '合并', -1, ''),
(188, 'admin', 2, 'Admin/Database/index?type=export', '备份数据库', -1, ''),
(189, 'admin', 2, 'Admin/Database/export', '备份', -1, ''),
(190, 'admin', 2, 'Admin/Database/optimize', '优化表', -1, ''),
(191, 'admin', 2, 'Admin/Database/repair', '修复表', -1, ''),
(192, 'admin', 2, 'Admin/Database/index?type=import', '还原数据库', -1, ''),
(193, 'admin', 2, 'Admin/Database/import', '恢复', -1, ''),
(194, 'admin', 2, 'Admin/Database/del', '删除', -1, ''),
(195, 'admin', 2, 'Admin/other', '其他', 1, ''),
(196, 'admin', 2, 'Admin/Menu/add', '新增', -1, ''),
(197, 'admin', 2, 'Admin/Menu/edit', '编辑', -1, ''),
(198, 'admin', 2, 'Admin/Think/lists?model=article', '应用', -1, ''),
(199, 'admin', 2, 'Admin/Think/lists?model=download', '下载管理', -1, ''),
(200, 'admin', 2, 'Admin/Think/lists?model=config', '应用', -1, ''),
(201, 'admin', 2, 'Admin/Action/actionlog', '行为日志', -1, ''),
(202, 'admin', 2, 'Admin/User/updatePassword', '修改密码', -1, ''),
(203, 'admin', 2, 'Admin/User/updateNickname', '修改昵称', -1, ''),
(204, 'admin', 2, 'Admin/action/edit', '查看行为日志', -1, ''),
(206, 'admin', 1, 'Admin/think/edit', '编辑数据', 1, ''),
(207, 'admin', 1, 'Admin/Menu/import', '导入', 1, ''),
(208, 'admin', 1, 'Admin/Model/generate', '生成', 1, ''),
(209, 'admin', 1, 'Admin/Addons/addHook', '新增钩子', 1, ''),
(210, 'admin', 1, 'Admin/Addons/edithook', '编辑钩子', 1, ''),
(211, 'admin', 1, 'Admin/Article/sort', '文档排序', 1, ''),
(212, 'admin', 1, 'Admin/Config/sort', '排序', 1, ''),
(213, 'admin', 1, 'Admin/Menu/sort', '排序', 1, ''),
(214, 'admin', 1, 'Admin/Channel/sort', '排序', 1, ''),
(215, 'admin', 1, 'Admin/Category/operate/type/move', '移动', 1, ''),
(216, 'admin', 1, 'Admin/Category/operate/type/merge', '合并', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `tsg_category`
--

CREATE TABLE IF NOT EXISTS `tsg_category` (
  `id` int(10) unsigned NOT NULL COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '关联模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text NOT NULL COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标'
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='分类表';

--
-- 转存表中的数据 `tsg_category`
--

INSERT INTO `tsg_category` (`id`, `name`, `title`, `pid`, `sort`, `list_row`, `meta_title`, `keywords`, `description`, `template_index`, `template_lists`, `template_detail`, `template_edit`, `model`, `type`, `link_id`, `allow_publish`, `display`, `reply`, `check`, `reply_model`, `extend`, `create_time`, `update_time`, `status`, `icon`) VALUES
(40, 'app', 'App系统文章', 0, 0, 10, '', '', '', '', '', '', '', '2', '3', 0, 1, 1, 1, 1, '', '', 1512870182, 1512870336, 1, 0),
(39, 'tsggl', '淘省购攻略', 0, 0, 10, '', '', '', '', '', '', '', '2', '2,1,3', 0, 1, 1, 1, 1, '', '', 1506041579, 1506041579, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `tsg_channel`
--

CREATE TABLE IF NOT EXISTS `tsg_channel` (
  `id` int(10) unsigned NOT NULL COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开'
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tsg_channel`
--

INSERT INTO `tsg_channel` (`id`, `pid`, `title`, `url`, `sort`, `create_time`, `update_time`, `status`, `target`) VALUES
(1, 0, '首页', 'Index/index', 1, 1379475111, 1379923177, 1, 0),
(2, 0, '博客', 'Article/index?category=blog', 2, 1379475131, 1379483713, 1, 0),
(3, 0, '官网', 'http://www.onethink.cn', 3, 1379475154, 1387163458, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `tsg_client`
--

CREATE TABLE IF NOT EXISTS `tsg_client` (
  `id` int(11) NOT NULL,
  `nickname` varchar(200) NOT NULL,
  `userid` varchar(200) DEFAULT NULL,
  `activeAt` bigint(20) NOT NULL,
  `createAt` bigint(20) NOT NULL,
  `updateAt` bigint(20) NOT NULL,
  `delflag` tinyint(4) NOT NULL DEFAULT '0',
  `lastLoginAt` bigint(20) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `isDistributor` tinyint(4) NOT NULL DEFAULT '0',
  `parentDistributor` int(11) NOT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `alipay` varchar(200) DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tsg_client`
--

INSERT INTO `tsg_client` (`id`, `nickname`, `userid`, `activeAt`, `createAt`, `updateAt`, `delflag`, `lastLoginAt`, `phone`, `isDistributor`, `parentDistributor`, `avatar`, `alipay`, `balance`) VALUES
(1, 'yfsoftcom', '827063647', 1510728904843, 1510728904843, 1510728904843, 0, 1550485699505, '', 0, 2, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=827063647&width=160&height=160&type=sns', NULL, 78),
(2, 'uujuna', '903554655', 1510736935748, 1510736935748, 1510736935748, 0, 1521164859266, '', 0, 2, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=903554655&width=160&height=160&type=sns', NULL, 0),
(3, 'xia760636204', '205890607', 1510740776971, 1510740776971, 1510740776971, 0, 1529121373304, '', 1, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=2058906070&width=160&height=160&type=sns', NULL, 139),
(4, 't_1502626528309_0764', '210203648', 1510740838323, 1510740838323, 1510740838323, 0, 1529572735201, '', 1, 3, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=2102036480&width=160&height=160&type=sns', NULL, 217),
(5, 'xia760636204', '2058906070', 1510796777256, 1510796777256, 1510796777256, 0, 1514615279535, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=2058906070&width=160&height=160&type=sns', NULL, 0),
(6, 'zhuqing81020', '1075056528', 1511016990382, 1511016990382, 1511016990382, 0, 1511016990382, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=1075056528&width=160&height=160&type=sns', NULL, 0),
(7, '蓝焰炫舞', '335388716', 1511101160165, 1511101160165, 1511101160165, 0, 1513000669565, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=335388716&width=160&height=160&type=sns', NULL, 0),
(8, 't_1504892925588_0898', '2493707164', 1512309273135, 1512309273135, 1512309273135, 0, 1513736060058, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=2493707164&width=160&height=160&type=sns', NULL, 0),
(9, 'wujunfan2009', '257583455', 1515060694407, 1515060694407, 1515060694407, 0, 1515060694407, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=257583455&width=160&height=160&type=sns', NULL, 0),
(10, 'tb808896_22', '1102898574', 1515118761716, 1515118761716, 1515118761716, 0, 1515118761716, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=1102898574&width=160&height=160&type=sns', NULL, 0),
(11, '毛毛52061', '1842086017', 1515575646759, 1515575646759, 1515575646759, 0, 1517299550840, '', 0, 3, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=1842086017&width=160&height=160&type=sns', NULL, 0),
(13, 'dadadadda0288', '3511976663', 1516187693347, 1516187693347, 1516187693347, 0, 1517877413950, '', 0, 4, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=3511976663&width=160&height=160&type=sns', NULL, 13),
(14, 'qasdcxz1', '836783046', 1516272362888, 1516272362888, 1516272362888, 0, 1530266382500, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=836783046&width=160&height=160&type=sns', NULL, 0),
(15, '沫沫or小玉', '1111287766', 1516286908873, 1516286908873, 1516286908873, 0, 1516286908873, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=1111287766&width=160&height=160&type=sns', NULL, 0),
(16, 'zhuqing81020', '1075056528', 1516582572538, 1516582572538, 1516582572538, 0, 1516794569966, '', 0, 2, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=1075056528&width=160&height=160&type=sns', NULL, 0),
(17, 'ritawu9', '877998282', 1517490863182, 1517490863182, 1517490863182, 0, 1517490863182, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=877998282&width=160&height=160&type=sns', NULL, 0),
(18, 'tb105131_00', '1027178560', 1517879387155, 1517879387155, 1517879387155, 0, 1522583816613, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=1027178560&width=160&height=160&type=sns', NULL, 0),
(19, 'tb745930947', '3683767448', 1519694065639, 1519694065639, 1519694065639, 0, 1519694065639, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=3683767448&width=160&height=160&type=sns', NULL, 0),
(20, 'tb312873418', '2371402258', 1521990861598, 1521990861598, 1521990861598, 0, 1521990861598, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=2371402258&width=160&height=160&type=sns', NULL, 0),
(21, 'lihuanxuhai', '1109650590', 1522375270944, 1522375270944, 1522375270944, 0, 1523157524116, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=1109650590&width=160&height=160&type=sns', NULL, 0),
(22, '傲世瑞雪', '2343114664', 1522508318540, 1522508318540, 1522508318540, 0, 1522508318540, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=2343114664&width=160&height=160&type=sns', NULL, 0),
(23, 'ghvffgg', '2274048182', 1522584760477, 1522584760477, 1522584760477, 0, 1522584770934, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=2274048182&width=160&height=160&type=sns', NULL, 0),
(24, 't_1482722698775_3118', '3079640392', 1522652113382, 1522652113382, 1522652113382, 0, 1522652113382, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=3079640392&width=160&height=160&type=sns', NULL, 0),
(25, '李炳达学霜', '2629280994', 1522708798447, 1522708798447, 1522708798447, 0, 1522708798447, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=2629280994&width=160&height=160&type=sns', NULL, 0),
(26, 'nrzys', '1895958126', 1522720452919, 1522720452919, 1522720452919, 0, 1522913349610, '', 0, 3, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=1895958126&width=160&height=160&type=sns', NULL, 0),
(27, 'tb81924954', '3389055571', 1522843524347, 1522843524347, 1522843524347, 0, 1522843524347, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=3389055571&width=160&height=160&type=sns', NULL, 0),
(28, '浅安时光1133', '3888435225', 1522896612444, 1522896612444, 1522896612444, 0, 1522896612444, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=3888435225&width=160&height=160&type=sns', NULL, 0),
(29, 'tb23667812', '1640381465', 1523339232795, 1523339232795, 1523339232795, 0, 1524617188513, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=1640381465&width=160&height=160&type=sns', NULL, 0),
(30, 'nayuehure那些年儿', '2982574679', 1524605441726, 1524605441726, 1524605441726, 0, 1524605441726, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=2982574679&width=160&height=160&type=sns', NULL, 0),
(31, 'dcm082051368361', '2939575601', 1524985737457, 1524985737457, 1524985737457, 0, 1524985765100, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=2939575601&width=160&height=160&type=sns', NULL, 0),
(32, '梦飞tcw', '2959124521', 1525003569227, 1525003569227, 1525003569227, 0, 1525003569227, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=2959124521&width=160&height=160&type=sns', NULL, 0),
(33, 'tb93792699', '2056401070', 1525789591601, 1525789591601, 1525789591601, 0, 1525789591601, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=2056401070&width=160&height=160&type=sns', NULL, 0),
(34, '睿70729494', '3021629121', 1525799930290, 1525799930290, 1525799930290, 0, 1525799930290, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=3021629121&width=160&height=160&type=sns', NULL, 0),
(35, '伤心的伊诺', '2560633900', 1525855763498, 1525855763498, 1525855763498, 0, 1525855763498, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=2560633900&width=160&height=160&type=sns', NULL, 0),
(36, 'm1丁丁', '2222995486', 1525874657598, 1525874657598, 1525874657598, 0, 1525874657598, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=2222995486&width=160&height=160&type=sns', NULL, 0),
(37, '娜娜520131420120103', '2824840635', 1525914903430, 1525914903430, 1525914903430, 0, 1525914903430, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=2824840635&width=160&height=160&type=sns', NULL, 0),
(38, '罗兰英杰', '2326597914', 1526019942659, 1526019942659, 1526019942659, 0, 1526019942659, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=2326597914&width=160&height=160&type=sns', NULL, 0),
(39, 'zcc年少无知不知人心险恶', '3261990629', 1526219564066, 1526219564066, 1526219564066, 0, 1526219564066, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=3261990629&width=160&height=160&type=sns', NULL, 0),
(40, 'tb069413129', '3859340039', 1526354849401, 1526354849401, 1526354849401, 0, 1526354849401, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=3859340039&width=160&height=160&type=sns', NULL, 0),
(41, 't_1480589275542_0103', '2643645883', 1526460860662, 1526460860662, 1526460860662, 0, 1526460860662, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=2643645883&width=160&height=160&type=sns', NULL, 0),
(42, 'y65092901', '366644946', 1526467672343, 1526467672343, 1526467672343, 0, 1527325595987, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=366644946&width=160&height=160&type=sns', NULL, 0),
(43, '愤怒的驱魔', '1743543488', 1526544308188, 1526544308188, 1526544308188, 0, 1526544308188, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=1743543488&width=160&height=160&type=sns', NULL, 0),
(44, '探索者海风', '1827472876', 1526780919678, 1526780919678, 1526780919678, 0, 1526780919678, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=1827472876&width=160&height=160&type=sns', NULL, 0),
(45, '今生注定是富婆', '2507980535', 1526790088152, 1526790088152, 1526790088152, 0, 1526790088152, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=2507980535&width=160&height=160&type=sns', NULL, 0),
(46, 'dgw每时每刻', '2670623707', 1526982846001, 1526982846001, 1526982846001, 0, 1526982884890, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=2670623707&width=160&height=160&type=sns', NULL, 0),
(47, '一个人就好ann', '1090293733', 1527144014410, 1527144014410, 1527144014410, 0, 1527144014410, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=1090293733&width=160&height=160&type=sns', NULL, 0),
(48, '许喜寿你好', '2253595118', 1527235066093, 1527235066093, 1527235066093, 0, 1527235066093, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=2253595118&width=160&height=160&type=sns', NULL, 0),
(49, '以微笑交友', '2663474064', 1527323314826, 1527323314826, 1527323314826, 0, 1527323314826, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=2663474064&width=160&height=160&type=sns', NULL, 0),
(50, '漫步一条路', '2667242893', 1527813875513, 1527813875513, 1527813875513, 0, 1527817429350, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=2667242893&width=160&height=160&type=sns', NULL, 0),
(51, '张艳960623', '1819505484', 1527848879939, 1527848879939, 1527848879939, 0, 1534070709824, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=1819505484&width=160&height=160&type=sns', NULL, 585),
(52, '任平陈兵', '2465514246', 1528115638742, 1528115638742, 1528115638742, 0, 1533284702677, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=2465514246&width=160&height=160&type=sns', NULL, 0),
(53, 'ztjjqh', '2965452156', 1528206805403, 1528206805403, 1528206805403, 0, 1528206805403, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=2965452156&width=160&height=160&type=sns', NULL, 0),
(54, 'tb41966132', '3573192026', 1528207344213, 1528207344213, 1528207344213, 0, 1528207344213, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=3573192026&width=160&height=160&type=sns', NULL, 0),
(55, '老钱爱美食', '1885648179', 1528212214687, 1528212214687, 1528212214687, 0, 1528212214687, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=1885648179&width=160&height=160&type=sns', NULL, 0),
(56, '沐梓123123123', '3367904957', 1528261121837, 1528261121837, 1528261121837, 0, 1528261121837, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=3367904957&width=160&height=160&type=sns', NULL, 0),
(57, '大家好我叫吉好～时尚男孩', '3173337245', 1528266271934, 1528266271934, 1528266271934, 0, 1528266271934, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=3173337245&width=160&height=160&type=sns', NULL, 0),
(58, '奋斗的小雨2015', '2548815778', 1528293175107, 1528293175107, 1528293175107, 0, 1528293175107, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=2548815778&width=160&height=160&type=sns', NULL, 0),
(59, '大森林898898', '1606225158', 1528293786078, 1528293786078, 1528293786078, 0, 1528293803280, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=1606225158&width=160&height=160&type=sns', NULL, 0),
(60, 'tb551146465', '3705063572', 1528542432608, 1528542432608, 1528542432608, 0, 1540810603043, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=3705063572&width=160&height=160&type=sns', NULL, 0),
(61, '为你好072621089', '2863697246', 1528614405219, 1528614405219, 1528614405219, 0, 1528614608756, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=2863697246&width=160&height=160&type=sns', NULL, 0),
(62, 't_1501044357849_0942', '3358212712', 1528870741220, 1528870741220, 1528870741220, 0, 1528870741220, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=3358212712&width=160&height=160&type=sns', NULL, 0),
(63, '0315127x', '1889071507', 1529236142057, 1529236142057, 1529236142057, 0, 1529236142057, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=1889071507&width=160&height=160&type=sns', NULL, 0),
(64, 'i钱多多0', '2482448128', 1529691110812, 1529691110812, 1529691110812, 0, 1529691110812, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=2482448128&width=160&height=160&type=sns', NULL, 0),
(65, 'tb98683449', '3853574896', 1529723035106, 1529723035106, 1529723035106, 0, 1529723056493, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=3853574896&width=160&height=160&type=sns', NULL, 0),
(66, '小海大米', '926821738', 1529991967626, 1529991967626, 1529991967626, 0, 1529991967626, '', 0, 3, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=926821738&width=160&height=160&type=sns', NULL, 0),
(67, '张子祺2017117', '3522413907', 1530100630064, 1530100630064, 1530100630064, 0, 1530100630064, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=3522413907&width=160&height=160&type=sns', NULL, 0),
(68, '1993瑶yao', '2258973310', 1530271688797, 1530271688797, 1530271688797, 0, 1531997096531, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=2258973310&width=160&height=160&type=sns', NULL, 0),
(69, '追梦人z1982', '788517477', 1530351629293, 1530351629293, 1530351629293, 0, 1530351629293, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=788517477&width=160&height=160&type=sns', NULL, 0),
(70, '王海艳_1981', '1724023571', 1530530940033, 1530530940033, 1530530940033, 0, 1530530940033, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=1724023571&width=160&height=160&type=sns', NULL, 0),
(71, '艾艾个左左右', '2788717570', 1530696819881, 1530696819881, 1530696819881, 0, 1532663893541, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=2788717570&width=160&height=160&type=sns', NULL, 0),
(72, 't_1507184965522_0131', '3433014605', 1530939739341, 1530939739341, 1530939739341, 0, 1530939739341, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=3433014605&width=160&height=160&type=sns', NULL, 0),
(73, '哈哈的魔法小屋', '61555335', 1531169500925, 1531169500925, 1531169500925, 0, 1531169500925, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=61555335&width=160&height=160&type=sns', NULL, 0),
(74, 'aaaaa我佛', '3433067725', 1531437001606, 1531437001606, 1531437001606, 0, 1531437001606, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=3433067725&width=160&height=160&type=sns', NULL, 0),
(75, '寒冷与炎热23722690', '2703699797', 1531521666966, 1531521666966, 1531521666966, 0, 1531951243099, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=2703699797&width=160&height=160&type=sns', NULL, 0),
(76, 'zlj玖伍', '3382680119', 1531654399150, 1531654399150, 1531654399150, 0, 1531654412640, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=3382680119&width=160&height=160&type=sns', NULL, 0),
(77, 'tb03739816', '3512209381', 1532123461728, 1532123461728, 1532123461728, 0, 1532125011824, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=3512209381&width=160&height=160&type=sns', NULL, 0),
(78, '瞬间永恒1203', '354491345', 1532400477019, 1532400477019, 1532400477019, 0, 1532400477019, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=354491345&width=160&height=160&type=sns', NULL, 0),
(79, '倾月西西', '2244914333', 1533078774705, 1533078774705, 1533078774705, 0, 1533078774705, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=MH7-O8cGPHg0OHQSvmguMF7-MCgbXFvuPFlhMHQWMF8T&width=160&height=160&type=sns', NULL, 0),
(80, '天天乐想淘', '1857122331', 1533705643020, 1533705643020, 1533705643020, 0, 1533705643020, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=vCHSO8kLvCQSOHg4vGIuvkZIvG-ev07IPmgSvm*HPFcT&width=160&height=160&type=sns', NULL, 0),
(81, 'tb52586325', '3574489360', 1534018177017, 1534018177017, 1534018177017, 0, 1534018217110, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=Pk84PFvuOm*zv8QuPHkYX8gSOm--X8xuXF8uMF7-PGgT&width=160&height=160&type=sns', NULL, 0),
(82, '爱靖勇莹', '2890396264', 1534084863568, 1534084863568, 1534084863568, 0, 1534084863568, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=PGQYO8guOHPeXHP-PFMhvm-hP0xYvmP-P8x0vCNLM0cT&width=160&height=160&type=sns', NULL, 0),
(83, '太易动情c', '1631366071', 1534210825200, 1534210825200, 1534210825200, 0, 1534210836538, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=XFvSvGcLM0PzP8RHMGZhM0gWPm7hP0cbvFc0Xm*IP0kT&width=160&height=160&type=sns', NULL, 0),
(84, '星星的笑语', '1937506065', 1534389359565, 1534389359565, 1534389359565, 0, 1534389359565, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=Pk*eP8RHMCNLMGgyMk*hMmxGvG*hMCQYXFkGPmMzv8kT&width=160&height=160&type=sns', NULL, 0),
(85, 'tb5654597_2011', '690379893', 1534687062300, 1534687062300, 1534687062300, 0, 1534687062300, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=PCQuMkPIXmx4vCv4vkZzOFMIMm7ePCHWPGR-PHx4MF8T&width=160&height=160&type=sns', NULL, 0),
(86, 'q50011307', '735223058', 1535119651504, 1535119651504, 1535119651504, 0, 1535119651504, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=P8cYPG*IXmkLPk7zPCNLPC8GvGcyvFl-MGvuXH8SM8QT&width=160&height=160&type=sns', NULL, 0),
(87, 't_1493559850416_0792', '2806286428', 1535196553827, 1535196553827, 1535196553827, 0, 1535196553827, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=OmNuMm9evkgGvkkGvkk0PklzPm-HXmNGPmHSvCx4XFxT&width=160&height=160&type=sns', NULL, 0),
(88, '忆苦思甜05944828', '2891929177', 1535207210221, 1535207210221, 1535207210221, 0, 1535207219497, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=vH8LMGQyOH80OmxSvGNGMC7eMF-ePCkSvCvYvmg0MFvT&width=160&height=160&type=sns', NULL, 0),
(89, '小三得酷比', '2235402558', 1535340612888, 1535340612888, 1535340612888, 0, 1535340612888, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=vCxGvGHWPmZ-v8xbPH8WPCv4MG-Hv8QbXFHSPmkWXmHT&width=160&height=160&type=sns', NULL, 0),
(90, '卑微的爱与承诺', '2146005525', 1536507467134, 1536507467134, 1536507467134, 0, 1536507467134, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=PmQuv0*HMFP-P884OFk4PCILvGlzvHl-MkP-MmkyPGHT&width=160&height=160&type=sns', NULL, 0),
(91, '爷的狂野飙车', '2711937964', 1536564688127, 1536564688127, 1536564688127, 0, 1536564688127, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=PGQYO8guOHPeXHP-PFMhvHlePFkLPHRzOmvSMmHGOFcT&width=160&height=160&type=sns', NULL, 0),
(92, 'lanjing19900105', '1134632464', 1536705778828, 1536705778828, 1536705778828, 0, 1536705778828, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=PGQYO8guOHPeXHP-PFMhvmk0P8kbPCl-PC--vkxSv8kT&width=160&height=160&type=sns', NULL, 0),
(93, '樱懿月颜', '3009053521', 1536845462133, 1536845462133, 1536845462133, 0, 1536845462133, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=PFZIvCcYPC7hOmIWOmx0PFZ-Mkg0vFMzPHcYPCR-XmIT&width=160&height=160&type=sns', NULL, 0),
(94, 'tb017477161', '3980228693', 1537056040939, 1537056040939, 1537056040939, 0, 1537056040939, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=vGZhv8*-vkk0MGZHMmvbvCvSvGQLPFI4PFNSXFNuMGkT&width=160&height=160&type=sns', NULL, 0),
(95, 'qwertyuiop354183118', '3364765314', 1537266695547, 1537266695547, 1537266695547, 0, 1537266695547, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=MG9zPmHGMCgYOmg4XH7-XHRIMmN4v0cSvCQYvkQSOmkT&width=160&height=160&type=sns', NULL, 0),
(96, '无情的伤感呀', '2823048187', 1537673635585, 1537673635585, 1537673635585, 0, 1537931325592, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=MCkSPC9hP884PCxLvCxSvmMIXHgLM08GvCZIv8*IvHQT&width=160&height=160&type=sns', NULL, 0),
(97, 'tb99353807', '4017537501', 1537849835626, 1537849835626, 1537849835626, 0, 1537849835626, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=Mmk4XmkYv8g0MH7HOmxWPmkWPklhXH*-MG-IPC8yPmIT&width=160&height=160&type=sns', NULL, 0),
(98, '来时的路withyou', '2755392792', 1538034371277, 1538034371277, 1538034371277, 0, 1538034371277, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=MCMHXHk0MCgLMC7-v87HPCMIvm-HMH7eMCv0v0*-v8QT&width=160&height=160&type=sns', NULL, 0),
(99, '我是一米阳光519038299', '2692388167', 1538492758799, 1538492758799, 1538492758799, 0, 1538492758799, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=XFRHPCg0XmkWOmP-vk*zvm9evHPHPHgLPm8uvmIuvkkT&width=160&height=160&type=sns', NULL, 0),
(100, 'zhangwenyan594433097', '2074255397', 1539041901959, 1539041901959, 1539041901959, 0, 1539041901959, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=OFhhPCIYMFleO8*IXHQbvGNbPmMIOml-XFkYvkxyPHkT&width=160&height=160&type=sns', NULL, 0),
(101, '郭祥生晓芝', '2303924067', 1539500486822, 1539500486822, 1539500486822, 0, 1539500486822, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=XFRHPCg0XmkWOmP-vk*zvmkyMFHGvmRIPm9zMk7evmNT&width=160&height=160&type=sns', NULL, 0),
(102, 't_1502606128093_0729', '3389631159', 1540000629196, 1540000629196, 1540000629196, 0, 1540000629196, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=MHkyP8xYvm8LOFc0MmPHMCPHv0R-Mkx0XHcbM8kSMGgT&width=160&height=160&type=sns', NULL, 0),
(103, '声生漫w', '2589510000', 1540052364607, 1540052364607, 1540052364607, 0, 1540052364607, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=vGQSMCMHvGQbMCxyO8k0XFNyPm9-PClePGNbvF9hPCcT&width=160&height=160&type=sns', NULL, 0),
(104, '宇宙剑侠168', '1974929881', 1540169133710, 1540169133710, 1540169133710, 0, 1540279208840, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=vCgbPkx0MHg0XHgSOmIWMmHyPCHSvmcLvk*HPCHuvCNT&width=160&height=160&type=sns', NULL, 0),
(105, 'tb571642155', '3957668092', 1540217275089, 1540217275089, 1540217275089, 0, 1540217275089, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=MCMHXHk0MCgLMC7-v87HPkQSPkQyv8xWvG-HMkl-vk8T&width=160&height=160&type=sns', NULL, 0),
(106, '飞天花板', '4238577262', 1540997255645, 1540997255645, 1540997255645, 0, 1542030287802, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=MGgyPF*HXmlePmQ4PCHuvmHbvmkSvkZePFk0OH7-v0cT&width=160&height=160&type=sns', NULL, 0),
(107, '123456张小楠', '2227220397', 1541862945516, 1541862945516, 1541862945516, 0, 1541862945516, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=2227220397&width=160&height=160&type=sns', NULL, 0),
(108, 'fulin985648062', '1048967522', 1541948890614, 1541948890614, 1541948890614, 0, 1541948890614, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=1048967522&width=160&height=160&type=sns', NULL, 0),
(109, 't_1507165264191_0937', '3371132595', 1542273124088, 1542273124088, 1542273124088, 0, 1542273162601, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=P0gYXHgLXFcYv08yMCHSP08LOHkLM08GPF9hOHQ4MCkT&width=160&height=160&type=sns', NULL, 0),
(110, '5200卢莹', '2256790985', 1542537460474, 1542537460474, 1542537460474, 0, 1542537460474, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=MFkSM88LP88WM8kSvFPhX8x0vkkuPHxLPmQSMkk4MHQT&width=160&height=160&type=sns', NULL, 0),
(111, '一个执着滴男人', '2411353215', 1542772624610, 1542772624610, 1542772624610, 0, 1545118081366, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=vG7-vkcyP87IvHkyPFQLXHkLMGIyOm8yvG9IM07hXmHT&width=160&height=160&type=sns', NULL, 0),
(112, 't_1500134358066_0213', '3359259812', 1542899872626, 1542899872626, 1542899872626, 0, 1542899872626, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=vCHbvkcyMGIuOHPePmHGP88bOFkSPF7eOHPIvCNyXmkT&width=160&height=160&type=sns', NULL, 0),
(113, '一秒钟的记忆32', '1681691942', 1543014316785, 1543014316785, 1543014316785, 0, 1543014316785, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=MkxGPFl-MCIbP0*eM8xyvH84XFc0vCheMCvSMkRIvGkT&width=160&height=160&type=sns', NULL, 0),
(114, 'lwang198699', '1096770638', 1543398844799, 1543398844799, 1543398844799, 0, 1543398844799, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=Mmlev8QWOFHbX87hPmxbOFNuX8cSvkPIP8cyPF8yXHgT&width=160&height=160&type=sns', NULL, 0),
(115, '俊哥哥轩姐姐', '2902881610', 1543560606654, 1543560606654, 1543560606654, 0, 1543560606654, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=vGlevFcWPGxuXFvGOmIyPHlhvGH4XFQbvHQLXHcbMG8T&width=160&height=160&type=sns', NULL, 0),
(116, '17399244499yzh', '2200552458826', 1543917554487, 1543917554487, 1543917554487, 0, 1543917554487, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=v0xGM0*zXHlHXFNSPH7zPF8SMkgyPFc4PGkGXFH4PHgT&width=160&height=160&type=sns', NULL, 0),
(117, '贫困中农1', '1926215639', 1543917578980, 1543917578980, 1543917578980, 0, 1543917578980, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=P0gYv8QuPCRHMmN4OFZeMm-hvk8uPGZIv8QuO8cWO8gT&width=160&height=160&type=sns', NULL, 0),
(118, '婷爷99', '2807154405', 1544135864213, 1544135864213, 1544135864213, 0, 1544135864213, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=XFIyX88yMk7hMH8SXmPzvGP-PHcLXH7IXFkLvGkYMGNT&width=160&height=160&type=sns', NULL, 0),
(119, '龙煞小马哥', '2363047665', 1544323197924, 1544323197924, 1544323197924, 0, 1544763835586, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=Pk*eP8RHMCNLMGgyMk*hMH7HM07-vHPHvCP-P0lhM8gT&width=160&height=160&type=sns', NULL, 0),
(120, 'tb5281170_2012', '1112921852', 1544434129884, 1544434129884, 1544434129884, 0, 1544434129884, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=Mmk4vCQSvm7IOHRHPHcLv0gyv8RePFHWXF7evGPzP8kT&width=160&height=160&type=sns', NULL, 0),
(121, 'zhuyonglan1979', '2475032364', 1544493906680, 1544493906680, 1544493906680, 0, 1544493906680, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=2475032364&width=160&height=160&type=sns', NULL, 0),
(122, 'tb477747_90', '1053383807', 1544577771372, 1544577771372, 1544577771372, 0, 1544577771372, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=1053383807&width=160&height=160&type=sns', NULL, 0),
(123, '天天460868', '2773624246', 1544579881793, 1544579881793, 1544579881793, 0, 1544579881793, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userId=2773624246&width=160&height=160&type=sns', NULL, 0),
(124, 'tb079794460', '2200577679256', 1544712993557, 1544712993557, 1544712993557, 0, 1544712993557, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=MFl-vCcSvCxbvkxWMGIYPCvyMm84MG*IvC7zvCMhOFkT&width=160&height=160&type=sns', NULL, 0),
(125, '胡柏然1214', '2681828188', 1545483924508, 1545483924508, 1545483924508, 0, 1545483942777, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=MFxLPCNLOmxGPG7IXFZHv0PzM0kWv8kYMmkSPCxSvFHT&width=160&height=160&type=sns', NULL, 0),
(126, '峰丹之一生', '2332213756', 1545713079430, 1545713079430, 1545713079430, 0, 1545713079430, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=P8lIM8lHMG7-v07Ivm*hOFZ-MG7zvmhHvGH4PGPhOmxT&width=160&height=160&type=sns', NULL, 0),
(127, '沉香香境', '2381801268', 1545980764197, 1545980764197, 1545980764197, 0, 1545980764197, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=MmvLOmgSXmkYMmNuv8RIPkQ4vHgyvH8YMm9HPmgLX8kT&width=160&height=160&type=sns', NULL, 0),
(128, '事情没那么简单', '701673132', 1546564928590, 1546564928590, 1546564928590, 0, 1546564928590, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=O8xbXm84vHkuOHRIvmIGvC8LMHQuOHQbM8xWvGHuXFQT&width=160&height=160&type=sns', NULL, 0),
(129, 'erghsnjdnj', '2626428068', 1547371870763, 1547371870763, 1547371870763, 0, 1547371870763, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=MmvLOmgSXmkYMmNuv8RIPk8WvCxSOm7zPCHLP0QSPFIT&width=160&height=160&type=sns', NULL, 0),
(130, 'zhangyongjie856', '2658534595', 1547389274128, 1547389274128, 1547389274128, 0, 1547389274128, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=P0gYXHgLXFcYv08yMCHSPG9HOHZ-PG8SPC8YMCQbvGkT&width=160&height=160&type=sns', NULL, 0),
(131, '孙doubie婷', '2516075432', 1547556081847, 1547556081847, 1547556081847, 0, 1547556081847, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=v8xYXHZzvkPePmHbMmk4v88GPGgGMmvLPFh-vFkGXmkT&width=160&height=160&type=sns', NULL, 0),
(132, 'tb340832399', '3573838651', 1548175488437, 1548175488437, 1548175488437, 0, 1548175488437, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=PCPIXH7evC7ePm9hMG*IP0k0OHPIM0cYPmlzMmQSPCIT&width=160&height=160&type=sns', NULL, 0),
(133, '小邢爱网购', '2471311555', 1549763134669, 1549763134669, 1549763134669, 0, 1549763134669, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=XFILvG8GXFkyMmguO8g4v87eO8*hPF-ePmHbXFHSXm8T&width=160&height=160&type=sns', NULL, 0),
(134, '依然萍水相逢', '1063768315', 1550333171896, 1550333171896, 1550333171896, 0, 1550333171896, '', 0, -1, 'https://wwc.alicdn.com/avatar/getAvatar.do?userIdStr=vG7-vkcyP87IvHkyPFQLXHgYvCIYMkkWPFIGMmNLPkgT&width=160&height=160&type=sns', NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `tsg_config`
--

CREATE TABLE IF NOT EXISTS `tsg_config` (
  `id` int(10) unsigned NOT NULL COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序'
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tsg_config`
--

INSERT INTO `tsg_config` (`id`, `name`, `type`, `title`, `group`, `extra`, `remark`, `create_time`, `update_time`, `status`, `value`, `sort`) VALUES
(1, 'WEB_SITE_TITLE', 1, '网站标题', 1, '', '网站标题前台显示标题', 1378898976, 1379235274, 1, '淘省购', 0),
(2, 'WEB_SITE_DESCRIPTION', 2, '网站描述', 1, '', '网站搜索引擎描述', 1378898976, 1379235841, 1, '淘省购', 1),
(3, 'WEB_SITE_KEYWORD', 2, '网站关键字', 1, '', '网站搜索引擎关键字', 1378898976, 1381390100, 1, 'ThinkPHP,OneThink', 8),
(4, 'WEB_SITE_CLOSE', 4, '关闭站点', 1, '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', 1378898976, 1379235296, 1, '1', 1),
(9, 'CONFIG_TYPE_LIST', 3, '配置类型列表', 4, '', '主要用于数据解析和页面表单的生成', 1378898976, 1379235348, 1, '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', 2),
(10, 'WEB_SITE_ICP', 1, '网站备案号', 1, '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', 1378900335, 1379235859, 1, '', 9),
(11, 'DOCUMENT_POSITION', 3, '文档推荐位', 2, '', '文档推荐位，推荐到多个位置KEY值相加即可', 1379053380, 1379235329, 1, '1:列表页推荐\r\n2:频道页推荐\r\n4:网站首页推荐', 3),
(12, 'DOCUMENT_DISPLAY', 3, '文档可见性', 2, '', '文章可见性仅影响前台显示，后台不收影响', 1379056370, 1379235322, 1, '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', 4),
(13, 'COLOR_STYLE', 4, '后台色系', 1, 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', 1379122533, 1379235904, 1, 'blue_color', 10),
(20, 'CONFIG_GROUP_LIST', 3, '配置分组', 4, '', '配置分组', 1379228036, 1384418383, 1, '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', 4),
(21, 'HOOKS_TYPE', 3, '钩子的类型', 4, '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', 1379313397, 1379313407, 1, '1:视图\r\n2:控制器', 6),
(22, 'AUTH_CONFIG', 3, 'Auth配置', 4, '', '自定义Auth.class.php类配置', 1379409310, 1379409564, 1, 'AUTH_ON:1\r\nAUTH_TYPE:2', 8),
(23, 'OPEN_DRAFTBOX', 4, '是否开启草稿功能', 2, '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', 1379484332, 1379484591, 1, '1', 1),
(24, 'DRAFT_AOTOSAVE_INTERVAL', 0, '自动保存草稿时间', 2, '', '自动保存草稿的时间间隔，单位：秒', 1379484574, 1386143323, 1, '60', 2),
(25, 'LIST_ROWS', 0, '后台每页记录数', 2, '', '后台数据每页显示记录数', 1379503896, 1380427745, 1, '10', 10),
(26, 'USER_ALLOW_REGISTER', 4, '是否允许用户注册', 3, '0:关闭注册\r\n1:允许注册', '是否开放用户注册', 1379504487, 1379504580, 1, '1', 3),
(27, 'CODEMIRROR_THEME', 4, '预览插件的CodeMirror主题', 4, '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', 1379814385, 1384740813, 1, 'ambiance', 3),
(28, 'DATA_BACKUP_PATH', 1, '数据库备份根路径', 4, '', '路径必须以 / 结尾', 1381482411, 1381482411, 1, './Data/', 5),
(29, 'DATA_BACKUP_PART_SIZE', 0, '数据库备份卷大小', 4, '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', 1381482488, 1381729564, 1, '20971520', 7),
(30, 'DATA_BACKUP_COMPRESS', 4, '数据库备份文件是否启用压缩', 4, '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', 1381713345, 1381729544, 1, '1', 9),
(31, 'DATA_BACKUP_COMPRESS_LEVEL', 4, '数据库备份文件压缩级别', 4, '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', 1381713408, 1381713408, 1, '9', 10),
(32, 'DEVELOP_MODE', 4, '开启开发者模式', 4, '0:关闭\r\n1:开启', '是否开启开发者模式', 1383105995, 1383291877, 1, '0', 11),
(33, 'ALLOW_VISIT', 3, '不受限控制器方法', 0, '', '', 1386644047, 1386644741, 1, '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', 0),
(34, 'DENY_VISIT', 3, '超管专限控制器方法', 0, '', '仅超级管理员可访问的控制器方法', 1386644141, 1386644659, 1, '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', 0),
(35, 'REPLY_LIST_ROWS', 0, '回复列表每页条数', 2, '', '', 1386645376, 1387178083, 1, '10', 0),
(36, 'ADMIN_ALLOW_IP', 2, '后台允许访问IP', 4, '', '多个用逗号分隔，如果不配置表示不限制IP访问', 1387165454, 1387165553, 1, '', 12),
(37, 'SHOW_PAGE_TRACE', 4, '是否显示页面Trace', 4, '0:关闭\r\n1:开启', '是否显示页面Trace信息', 1387165685, 1387165685, 1, '0', 1);

-- --------------------------------------------------------

--
-- 表的结构 `tsg_document`
--

CREATE TABLE IF NOT EXISTS `tsg_document` (
  `id` int(10) unsigned NOT NULL COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态'
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';

--
-- 转存表中的数据 `tsg_document`
--

INSERT INTO `tsg_document` (`id`, `uid`, `name`, `title`, `category_id`, `description`, `root`, `pid`, `model_id`, `type`, `position`, `link_id`, `cover_id`, `display`, `deadline`, `attach`, `view`, `comment`, `extend`, `level`, `create_time`, `update_time`, `status`) VALUES
(6, 1, 'sybd', '使用宝典', 40, '使用宝典', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1512870420, 1528685540, 1),
(2, 1, 'a11', 'iphone8  新一代的iphone', 39, '一款让你抑制不住冲动的手机', 0, 0, 2, 3, 4, 1, 4, 1, 0, 0, 32521, 2234, 0, 0, 1514779200, 1515384287, 1),
(3, 1, '', '再见，前任', 39, '真相就在这里', 0, 0, 2, 3, 0, 0, 3, 1, 0, 0, 235345, 2344, 0, 0, 1508408040, 1515384322, 1),
(5, 1, 'gywm', '关于我们', 40, '关于我们', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1512870360, 1513663067, 1),
(7, 1, '', '再见，前任', 40, '', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1515383220, 1515383220, 3);

-- --------------------------------------------------------

--
-- 表的结构 `tsg_document_article`
--

CREATE TABLE IF NOT EXISTS `tsg_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

--
-- 转存表中的数据 `tsg_document_article`
--

INSERT INTO `tsg_document_article` (`id`, `parse`, `content`, `template`, `bookmark`) VALUES
(2, 0, '<div class="article-top-box clearfix">\r\n</div>\r\n<p>\r\n	<a target="_blank" href="https://baike.baidu.com/item/iPhone">iPhone</a><span style="color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;">&nbsp;8是</span><a target="_blank" href="https://baike.baidu.com/item/Apple/3860362">Apple</a><span style="color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;">（</span><a target="_blank" href="https://baike.baidu.com/item/%E8%8B%B9%E6%9E%9C%E5%85%AC%E5%8F%B8">苹果公司</a><span style="color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;">）第11代手机，北京时间2017年9月13日凌晨1点，在</span><a target="_blank" href="https://baike.baidu.com/item/Apple%20Park">Apple Park</a><span style="color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;">新总部的</span><a target="_blank" href="https://baike.baidu.com/item/%E5%8F%B2%E8%92%82%E5%A4%AB%C2%B7%E4%B9%94%E5%B8%83%E6%96%AF%E5%89%A7%E9%99%A2">史蒂夫·乔布斯剧院</a><span style="color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;">举行苹果新品发布会上发布的年度旗舰手机。</span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img src="/taoshenggou/wwwroot/Uploads/Editor/2018-01-06/5a50813c57e36.jpg" alt="" /> \r\n</p>\r\n<p>\r\n	<img src="/taoshenggou/wwwroot/Uploads/Editor/2018-01-06/5a50813cf30b9.jpg" alt="" /><img src="/taoshenggou/wwwroot/Uploads/Editor/2018-01-06/5a50813dac329.jpg" alt="" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span style="color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;">2017年9月13日，</span><a target="_blank" href="https://baike.baidu.com/item/2017%E8%8B%B9%E6%9E%9C%E7%A7%8B%E5%AD%A3%E6%96%B0%E5%93%81%E5%8F%91%E5%B8%83%E4%BC%9A">2017苹果秋季新品发布会</a><span style="color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;">发布了iPhone 8，支持无线充电，分为64GB、256GB两个版本，699美元起售。</span> \r\n</p>\r\n<p>\r\n	<span style="color:#000000;font-family:" font-size:12px;font-weight:600;background-color:#fceee3;"=""><br />\r\n</span> \r\n</p>\r\n<p>\r\n	<span style="color:#000000;font-family:" font-size:12px;font-weight:600;background-color:#fceee3;"="">iPhone&nbsp;8 采用了全新的双面全玻璃设计，还让备受喜爱的相机变得倍加出色，它不仅配备了 iPhone 有史以来最强大、最智能的芯片。还带来了简单便捷的无线充电，并将增强现实体验推进到更深层次。这就是 iPhone&nbsp;8，新一代的 iPhone。</span><span style="color:#000000;font-size:12px;"></span> \r\n</p>\r\n<p>\r\n	<span style="color:#000000;font-size:12px;"><br />\r\n</span> \r\n</p>\r\n<p>\r\n	<span style="color:#000000;font-size:12px;"><br />\r\n</span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span style="color:#000000;font-size:12px;"><span style="color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;">Phone 8搭载两个性能芯片，两个性能核心，四个高性能核心。采用A11处理器，支持无线充电。配置了新一代A11 Bionic处理器，运行速度比上一代A10处理器快30%，还集成了神经网络引擎。支持</span><a target="_blank" href="https://baike.baidu.com/item/Touch%20ID">Touch ID</a><span style="color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;">，还有一个特点是其图形传感器加入了对AR技术的支持。</span><br />\r\n</span> \r\n</p>\r\n<div class="column typography-tout large-2 small-12 " style="margin:0px;padding:0px;font-size:19px;font-weight:600;font-family:" color:#111111;background-color:#ffffff;"="">\r\n<div class="tout-headline">\r\n	<br />\r\n</div>\r\n	</div>\r\n<span style="background-color:#000000;"></span><br />', '', 232434),
(5, 0, '<p>\r\n	&nbsp; &nbsp; 淘省呗是一款帮助用户购物省钱、购物返利的一款移动客户端，淘省呗用户可以随时用过手机来进行领券购物，并且可以在客户端进行返利查询以及来自淘宝、天猫各大商家的各类信息。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp; &nbsp; 淘省呗励志向广大用户给出最完美的服务，欢迎大家来给出意见和反馈。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp; &nbsp;&nbsp;反馈邮箱：760636204@qq.com\r\n</p>\r\n<p>\r\n	&nbsp; &nbsp; 客户QQ：760636204 &nbsp; &nbsp; &nbsp; 2395968456\r\n</p>', '', 0),
(6, 0, '<p>\r\n	<img src="/taoshenggou/wwwroot/Uploads/Editor/2018-06-11/5b1de3d4a0b61.png" alt="" /><img src="/taoshenggou/wwwroot/Uploads/Editor/2018-06-11/5b1de377144cb.png" alt="" /><img src="/taoshenggou/wwwroot/Uploads/Editor/2018-06-11/5b1de377f2f57.png" alt="" /><img src="/taoshenggou/wwwroot/Uploads/Editor/2018-06-11/5b1de37a3ef99.png" alt="" /><img src="/taoshenggou/wwwroot/Uploads/Editor/2018-06-11/5b1de37a948f1.png" alt="" />\r\n</p>\r\n<p style="font-size:11px;font-family:''PingFang SC'';">\r\n	<br />\r\n</p>', '', 0),
(7, 0, '', '', 0),
(3, 0, '<p style="color:#333333;font-size:16px;font-family:Helvetica, " background-color:#ffffff;"=""><br />\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""> <span style="font-size:14px;color:#595959;">最近朋友去看了一场电影，回来之后一直抹眼泪，我偏不信这个邪，特地跑去电影院看了一遍，确实感触很深。</span> \r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""> <span style="font-size:14px;color:#595959;">&nbsp;</span> \r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""> <span style="font-size:14px;color:#595959;">所以，今天，想和大家聊聊它——《前任3：再见前任》。</span> \r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""> <span style="font-size:14px;color:#595959;">&nbsp;</span> \r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""> <span style="font-size:14px;color:#595959;"></span> \r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;"=""><br />\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;"=""><img src="/taoshenggou/wwwroot/Uploads/Editor/2018-01-08/5a52ebec429c7.jpg" alt="" /> \r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""> <br />\r\n<span style="font-size:14px;color:#595959;"></span> \r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:center;"=""> <strong><span style="color:#621066;">01</span></strong> \r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:center;"=""> <strong><span style="color:#621066;">一个以为会留，一个以为不会走</span></strong><strong><span style="color:#621066;"></span></strong> \r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""> <span style="font-size:14px;color:#595959;">一对好基友孟云和余飞跟女友都因为一点小事宣告分手，并且「拒绝挽回，死不认错」。两人在夜店、派对与交友软件上放飞人生第二春，大肆庆祝「黄金单身期」，从而引发了一系列好笑的故事。</span> \r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""> <span style="color:#111111;font-family:Helvetica, Arial, sans-serif;font-size:13px;"><br />\r\n</span> \r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""> <span style="font-size:14px;color:#595959;">电影的前半段搞笑，没想到结局却愣是把我煽情了一把，电影院也陆陆续续传出了小声啜泣的声音。</span> \r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""> <span style="font-size:14px;color:#595959;"></span> \r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	我在想，那一刻，他们一定是想起了<strong>某个让她们对明天充满期待，却再也没有出现在明天里的人。</strong> \r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	每个人都曾是电影里的林佳和孟云。\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;"=""><br />\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	一个需要陪伴，需要被关心，所以在最后才会哭着说：<strong>我需要他陪我来证明他爱我，我需要他在我身上花心思来证明他爱我，那种不怕受伤的支持，我做不到了。</strong> \r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	而另一个，则是习惯了对方对自己的好，并把这种好当做了理所当然。两个人的认知渐渐错位，却什么也不说，自然，也就渐行渐远。\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	直到最后，林佳选择跟孟云分手，赌气的她来来回回的从客厅到卧室，拿了三遍行李箱，却没有一丁点要收拾的意思。\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;"=""><img src="/taoshenggou/wwwroot/Uploads/Editor/2018-01-08/5a52ec01f238e.jpg" alt="" /> \r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""> <strong>爱情里最心酸的，就是心虚的试探。脸上满不在乎，心里却在哭着回头。</strong> \r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	孟云呢，来来回回想知道房间里的她在干什么，却抽了好几遍烟，假装不在意。熬过一晚上的冷战她终于放弃了，也是妥协这一段感情，拖着行李箱就出门而去。\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	这段感情，终于耗不动了，就在林佳轻轻关门的那一刻，我知道，她是再也回不来了。\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:center;"=""><img src="/taoshenggou/wwwroot/Uploads/Editor/2018-01-08/5a52ec11d0db8.jpg" alt="" /> \r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	直到现在，我还记得那一句话：\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""> <strong>所有大张旗鼓的离开其实都是试探。真正的离开是没有告别的，真正想要离开的人，只是挑了一个风和日丽的早晨。裹了件最常穿的大衣，悄悄关上们，然后再也没有回来。</strong> \r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	感情里最怕的是什么，出现冷战的时候，一个以为他会挽留，一个以为她不会走。拖到最后，就真的分开了。\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:center;"=""> <strong>02</strong> \r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:center;"=""> <strong>爱情里最怕的，就是金口难开</strong><strong></strong> \r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	和林佳分手后，孟云遇到了一个很喜欢自己的女孩。\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	女孩说，你真好，和你在一起很舒服。\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	成熟后的孟云变得温柔，懂得爱的分寸，也学会了照顾对方。\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	而林佳也和老同学结了婚。\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	电影没有团团圆圆开开心心的大结局，主角走出大荧幕过上了普通人的生活。\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><img src="/taoshenggou/wwwroot/Uploads/Editor/2018-01-08/5a52ec242c275.jpg" alt="" /> \r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	很多人都认为是无数个林佳才换来一个温柔体贴的孟云，但我觉得，更多的是，不爱。不爱才会使人周全。\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	八月长安说的：「<strong>如果我能少爱你一点，你一定会发现我是一个特别好的人，有时候爱会让人面目可憎。</strong>」\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	是啊，爱情，真不是个好东西，它使人疯狂，使人歇斯底里。<strong>一切乖张只是因为爱，不爱的话，人人都是理性成熟又乖巧的好妻子好丈夫。</strong> \r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:center;"=""><br />\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	现实生活中，我们不都是这样吗？在潦倒时相遇，<strong>在落魄中相爱，在苦难里互相慰藉，又在一切好起来时分开，最后哭瞎了眼睛用来缅怀。</strong> \r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	大概所有成年的人爱情，都是这个路数吧。\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	姑娘一上车就开始化妆，完全无视别人的眼光。化好妆把工具放回包内，拿着请柬哭了起来。\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	当初你义无反顾地选择了我，但为何却又在我们苦尽甘来时放弃了呢。\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	以为会永远爱下去的，谁知走着走着就散了。\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""> <strong>多年以后你和谁情深似海，会不会想起还欠我一个未来。</strong> \r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	年轻时，我们骄傲又敏感，我们不愿意放低姿态，总觉得谁先低头谁就输了，到后来，只能缅怀。\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;"=""><br />\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	多想回到那个能轻易说出「我们和好吧」的少年时代啊。\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	如果孟云或林佳能够放下感情中的一点自尊，坦白对对方的爱，也许故事的结局就不会是再见。\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	而现实中，因为骄傲而失去对方的案例比比皆是，曾经看到很多粉丝的留言，很多都已成为过去式，但不乏一些还爱着的。\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	@小小\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	如果你能回来，我会紧紧抱住你。\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;"=""><br />\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	@Riging\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	如果他回头，抱住我，我会跟他走的吧\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""> <strong>希望所有的爱情，都没有金口难开。</strong> \r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;"=""><br />\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:center;"=""> <strong>03</strong> \r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:center;"=""> <strong>与其遗憾，不如好好珍惜现在&nbsp;</strong> \r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	真的很羡慕余飞和丁点的感情。\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	即使前一秒红着眼睛说再也不会找她，但下一秒就认怂求饶求和好。\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	他们吵架也热闹，在向对方传递需求和爱。<strong>会吵架多好啊，会吵架就证明感情还可以自愈还可以修复。</strong> \r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;"=""><br />\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	他们用吵架来消解误会和不快，用<strong>吵架来达到双方某种程度上的和解</strong>。而不是林佳和孟云悄无声息的就散了，在<strong>如粥如沸的人群里永失所爱</strong>。\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	电影有一段让人看得很心酸：\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;"=""><br />\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	林佳：你不要我了怎么办？\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	孟云：那我就像至尊宝一样，去最繁华的街道喊一百遍林佳我爱你。\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	孟云：那你不要我了怎么办？\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	林佳：那我就吃芒果吃到死为止。\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""> <strong>最后他们像两只殉情的狼，孟云穿着至尊宝在繁华街道的咆哮被保安制止，林佳应诺「吃一箱芒果过敏而死」。</strong> \r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	然后爱情最后的呼啸，戛然而止。\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	曾经看过这样一个故事：\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	每次逛街买衣服，下馆子点餐，一眼扫过去我总能知道她想要哪个，可每次我都只说是巧合。\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:center;"=""><img src="/taoshenggou/wwwroot/Uploads/Editor/2018-01-08/5a52ec4ec9980.jpg" alt="" /> \r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	分手好久之后，同学会又碰上了，买刨冰那会儿她正在看样品，刚要点有被我选中了，她一直追问，我只是笑，后来她坐在对面发短信过来问。\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	「<strong>我只是能认出你喜欢的那个眼神，因为我在里面住过几年。</strong>」\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:center;"=""><br />\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	我们都太不会表达爱了，如果你现在还和那个爱的人在一起，请你一定不要吝啬跟他说「我爱你」。有些话不说，可能就晚了。\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	小时候我们词不达意，长大了我们言不由衷。\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	最后真心希望每个人在爱情面前，在争吵以后，舍不得放不下一定要说出口，都别端着。\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:center;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	如果你觉得回不去了，那就放手。\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	毕竟前路还很长，我会越来越好，你也不会差，我们各自珍重。\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""> <strong>但如果你还舍不得，你就告诉她。</strong>去他妈的面子不面子，去他妈的自尊，去他妈的先低头的人就输了。\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"="">\r\n	我只想抱着你，轻轻地说一句：嘿，你知道吗，我还爱你。\r\n	</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;"=""><br />\r\n</p>\r\n<p style="color:#3E3E3E;font-family:" font-size:16px;background-color:#ffffff;text-align:justify;"=""><br />\r\n	</p>\r\n	<p>\r\n		<br />\r\n	</p>\r\n<p style="color:#333333;font-size:16px;font-family:Helvetica, " background-color:#ffffff;"=""><br />\r\n</p>', '', 324324);

-- --------------------------------------------------------

--
-- 表的结构 `tsg_document_download`
--

CREATE TABLE IF NOT EXISTS `tsg_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- --------------------------------------------------------

--
-- 表的结构 `tsg_fanli_apply`
--

CREATE TABLE IF NOT EXISTS `tsg_fanli_apply` (
  `id` int(11) NOT NULL,
  `delflag` tinyint(4) NOT NULL DEFAULT '0',
  `createAt` bigint(20) NOT NULL,
  `updateAt` bigint(20) NOT NULL,
  `applyAt` bigint(20) NOT NULL,
  `status` varchar(200) NOT NULL,
  `client` int(11) NOT NULL,
  `orders` varchar(200) NOT NULL,
  `dealAt` bigint(20) NOT NULL,
  `products` varchar(500) DEFAULT '',
  `commissionAmount` varchar(50) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tsg_fanli_apply`
--

INSERT INTO `tsg_fanli_apply` (`id`, `delflag`, `createAt`, `updateAt`, `applyAt`, `status`, `client`, `orders`, `dealAt`, `products`, `commissionAmount`) VALUES
(4, 0, 1510740398, 1510740411, 1510740398, 'DEAL', 1, '82568081760', 1510740411, '植护原木抽纸24包餐巾纸抽纸批发纸巾整箱家庭装卫生纸家用面巾纸 + ', '0.78'),
(5, 0, 1510801980, 1510807207, 1510801980, 'DEAL', 3, '0045784630', 1510807207, '加量装清风原木纯品3层120抽中规30包抽取面纸巾整箱 + ', '0.38'),
(6, 0, 1512626335, 1515577819, 1512626335, 'DEAL', 4, '038064', 1515577819, '植护原木抽纸6包面巾纸家庭装餐巾纸家用卫生纸纸巾纸抽整箱批发 + ', '0.23'),
(7, 0, 1512626488, 1512627114, 1512626488, 'DEAL', 3, '907060', 1512627114, '那芙宠物消毒液狗狗除臭剂杀菌消毒环境除臭猫去尿味香水除味用品 + ', '1.48'),
(8, 0, 1515576598, 1516426927, 1515576598, 'REJECT', 4, '112957275112038064', 1516426927, '', '0'),
(9, 0, 1515724644, 1515733575, 1515724644, 'DEAL', 4, '112957275112038064', 1515733575, '帽子男冬天加绒毛线帽加厚针织帽秋冬季户外骑车保暖潮流青年韩版 + ', '1.75'),
(10, 0, 1516072719, 1516072719, 1516072719, 'WAITING', 3, '103933180955907060', 0, '', '0'),
(11, 0, 1516072719, 1516187104, 1516072719, 'DEAL', 3, '106665589540907060', 1516187104, '中老年冬装男棉衣中长款加绒加厚棉服中年冬季外套爸爸装PU皮棉袄 + ', '3.33'),
(12, 0, 1516072719, 1516187091, 1516072719, 'DEAL', 3, '107012287261907060', 1516187091, '中年休闲裤男士加绒加厚款秋冬季中老年人宽松爸爸西裤子40-50岁 + ', '2.25'),
(13, 0, 1516072771, 1516187068, 1516072771, 'DEAL', 3, '107012763532907060', 1516187068, 'PU皮裤女2017新款高腰秋冬季外穿加绒加厚保暖小脚裤修身打底裤子 + ', '0.6'),
(14, 0, 1516417606, 1516426429, 1516417606, 'DEAL', 13, '115693014599976366', 1516426429, '汽车用竹炭包吸卡通去公仔狗除车用味甲醛异味臭车内摆件碳包车载 + ', '0.11'),
(15, 0, 1516429759, 1516429813, 1516429759, 'DEAL', 4, '116182482559038064', 1516429813, '妙高可爱卡通牙刷盒便携式牙膏牙刷收纳盒出差旅行洗漱杯塑料杯 + ', '0.18'),
(16, 0, 1517294761, 1517299255, 1517294761, 'DEAL', 13, '118547138354976366', 1517299255, '新手上路汽车实习车贴纸反光吸盘磁性交管局正规统一标志示装饰牌 + ', '0.02'),
(17, 0, 1527849071, 1529025007, 1527849071, 'DEAL', 51, '153572418303508454', 1529025007, '滚筒洗衣机罩防水防晒海尔美的小天鹅创维波轮上开盖防护套粉色 + ', '5.85'),
(18, 0, 1527849071, 1529025071, 1527849071, 'REJECT', 51, '153572418303508454', 1529025071, '', '0'),
(19, 0, 1527849071, 1529025082, 1527849071, 'REJECT', 51, '153572418303508454', 1529025082, '', '0'),
(20, 0, 1528531413, 1528531413, 1528531413, 'WAITING', 52, '156150264062514642', 0, '', '0'),
(21, 0, 1528638863, 1528638863, 1528638863, 'WAITING', 52, '157458985975514642', 0, '', '0'),
(22, 0, 1528639008, 1528639008, 1528639008, 'WAITING', 52, '155576575936514642', 0, '', '0'),
(23, 0, 1528639022, 1528639022, 1528639022, 'WAITING', 52, '155576575936514642', 0, '', '0'),
(24, 0, 1528639132, 1528639132, 1528639132, 'WAITING', 52, '156868831767514642', 0, '', '0'),
(25, 0, 1528895362, 1528895362, 1528895362, 'WAITING', 52, '159002569207514642', 0, '', '0'),
(26, 0, 1531805686, 1531805686, 1531805686, 'WAITING', 75, '183176316230699797', 0, '', '0'),
(27, 0, 1531805686, 1531805686, 1531805686, 'WAITING', 75, '183411827145699797', 0, '', '0'),
(28, 0, 1531805686, 1531805686, 1531805686, 'WAITING', 75, '183407344757699797', 0, '', '0'),
(29, 0, 1537675526, 1537675526, 1537675526, 'WAITING', 96, '225345824623048781', 0, '', '0'),
(30, 0, 1537931385, 1537931385, 1537931385, 'WAITING', 96, '225345824623048781', 0, '', '0'),
(31, 0, 1544463737, 1544463737, 1544463737, 'WAITING', 119, '289263232225046576', 0, '', '0'),
(32, 0, 1544463767, 1544463767, 1544463767, 'WAITING', 119, '289436321401046576', 0, '', '0'),
(33, 0, 1547556187, 1547556187, 1547556187, 'WAITING', 131, '274922659172073254', 0, '', '0'),
(34, 0, 1547556187, 1547556187, 1547556187, 'WAITING', 131, '274922659172073254', 0, '', '0'),
(35, 0, 1547556187, 1547556187, 1547556187, 'WAITING', 131, '274922659172073254', 0, '', '0');

-- --------------------------------------------------------

--
-- 表的结构 `tsg_feedback`
--

CREATE TABLE IF NOT EXISTS `tsg_feedback` (
  `id` int(11) NOT NULL,
  `delflag` tinyint(4) NOT NULL DEFAULT '0',
  `createAt` bigint(20) NOT NULL,
  `updateAt` bigint(20) NOT NULL,
  `deal_flag` tinyint(4) NOT NULL DEFAULT '0',
  `dealAt` bigint(20) NOT NULL,
  `content` varchar(500) NOT NULL,
  `poster` varchar(100) NOT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tsg_feedback`
--

INSERT INTO `tsg_feedback` (`id`, `delflag`, `createAt`, `updateAt`, `deal_flag`, `dealAt`, `content`, `poster`, `contact`, `phone`) VALUES
(6, 0, 1512703563, 0, 0, 0, '5555658', '123123223112', NULL, NULL),
(7, 0, 1521007585, 0, 0, 0, '', '', NULL, NULL),
(8, 0, 1521007591, 0, 0, 0, '', '', NULL, NULL),
(9, 0, 1521009094, 0, 0, 0, 'MaKit10', 'MaKit9', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `tsg_file`
--

CREATE TABLE IF NOT EXISTS `tsg_file` (
  `id` int(10) unsigned NOT NULL COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表';

-- --------------------------------------------------------

--
-- 表的结构 `tsg_hooks`
--

CREATE TABLE IF NOT EXISTS `tsg_hooks` (
  `id` int(10) unsigned NOT NULL COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割'
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tsg_hooks`
--

INSERT INTO `tsg_hooks` (`id`, `name`, `description`, `type`, `update_time`, `addons`) VALUES
(1, 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', 1, 0, ''),
(2, 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', 1, 0, 'ReturnTop'),
(3, 'documentEditForm', '添加编辑表单的 扩展内容钩子', 1, 0, 'Attachment'),
(4, 'documentDetailAfter', '文档末尾显示', 1, 0, 'Attachment,SocialComment'),
(5, 'documentDetailBefore', '页面内容前显示用钩子', 1, 0, ''),
(6, 'documentSaveComplete', '保存文档数据后的扩展钩子', 2, 0, 'Attachment'),
(7, 'documentEditFormContent', '添加编辑表单的内容显示钩子', 1, 0, 'Editor'),
(8, 'adminArticleEdit', '后台内容编辑页编辑器', 1, 1378982734, 'EditorForAdmin'),
(13, 'AdminIndex', '首页小格子个性化显示', 1, 1382596073, 'SiteStat,SystemInfo'),
(14, 'topicComment', '评论提交方式扩展钩子。', 1, 1380163518, 'Editor'),
(16, 'app_begin', '应用开始', 2, 1384481614, '');

-- --------------------------------------------------------

--
-- 表的结构 `tsg_images`
--

CREATE TABLE IF NOT EXISTS `tsg_images` (
  `id` int(11) NOT NULL,
  `delflag` tinyint(4) NOT NULL DEFAULT '0',
  `createAt` bigint(20) NOT NULL,
  `updateAt` bigint(20) NOT NULL,
  `displayOrder` int(11) NOT NULL,
  `imageName` varchar(50) NOT NULL,
  `imageURL` varchar(200) NOT NULL,
  `imagepath` varchar(200) NOT NULL,
  `imageType` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tsg_images`
--

INSERT INTO `tsg_images` (`id`, `delflag`, `createAt`, `updateAt`, `displayOrder`, `imageName`, `imageURL`, `imagepath`, `imageType`) VALUES
(84, 0, 1525414596, 0, 2, 'h2', 'http://m.tb.cn/h.Wyb6c7F', 'tupian/2018-05-04/5aebfac4e5de3.PNG', 1),
(85, 0, 1525414603, 0, 3, 'h3', 'http://m.tb.cn/h.WydWPGJ', 'tupian/2018-05-04/5aebfacb3d59f.PNG', 1),
(88, 0, 1525415053, 0, 7, 'g3', '14511273,14479568', 'tupian/2018-05-04/5aebfc8e01183.PNG', 3),
(89, 0, 1525415058, 0, 8, 'g4', '557421612262', 'tupian/2018-05-04/5aebfc92d6737.PNG', 2),
(90, 0, 1525844434, 0, 5, 'g1', 'http://temai.m.taobao.com/index.html?pid=mm_126185375_34888164_122784330&scm=20140618.1.01010001.s101c6&spm&un=e41e35a9c35d03ec7a811649f8da3e26&share_crt_v=1&ut_sk=1.utdid_21683432_1514382508473.TaoPa', 'tupian/2018-05-09/5af289d302903.png', 1),
(92, 0, 1525846364, 0, 6, 'g2', 'http://temai.m.taobao.com/index.html?pid=mm_126185375_34888164_122784330&scm=20140618.1.01010001.s101c6&spm&un=e41e35a9c35d03ec7a811649f8da3e26&share_crt_v=1&ut_sk=1.utdid_21683432_1514382508473.TaoPa', 'tupian/2018-05-09/5af2915cd6bee.jpg', 1),
(94, 0, 1528525944, 0, 10, 'qd', '', 'tupian/2018-06-09/5b1b7478f1bcd.png', 4),
(95, 0, 1528595860, 0, 1, 'h1', 'http://m.tb.cn/h.3ZE74Fi', 'tupian/2018-06-10/5b1c859523264.jpg', 3);

-- --------------------------------------------------------

--
-- 表的结构 `tsg_member`
--

CREATE TABLE IF NOT EXISTS `tsg_member` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员表';

--
-- 转存表中的数据 `tsg_member`
--

INSERT INTO `tsg_member` (`uid`, `nickname`, `sex`, `birthday`, `qq`, `score`, `login`, `reg_ip`, `reg_time`, `last_login_ip`, `last_login_time`, `status`) VALUES
(1, 'sherry', 0, '0000-00-00', '', 400, 71, 0, 1506041264, 1968397070, 1551076192, 1);

-- --------------------------------------------------------

--
-- 表的结构 `tsg_menu`
--

CREATE TABLE IF NOT EXISTS `tsg_menu` (
  `id` int(10) unsigned NOT NULL COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见'
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tsg_menu`
--

INSERT INTO `tsg_menu` (`id`, `title`, `pid`, `sort`, `url`, `hide`, `tip`, `group`, `is_dev`) VALUES
(1, '首页', 0, 1, 'Index/index', 0, '', '', 0),
(2, '内容', 0, 2, 'Article/mydocument', 0, '', '', 0),
(3, '文档列表', 2, 0, 'article/index', 1, '', '内容', 0),
(4, '新增', 3, 0, 'article/add', 0, '', '', 0),
(5, '编辑', 3, 0, 'article/edit', 0, '', '', 0),
(6, '改变状态', 3, 0, 'article/setStatus', 0, '', '', 0),
(7, '保存', 3, 0, 'article/update', 0, '', '', 0),
(8, '保存草稿', 3, 0, 'article/autoSave', 0, '', '', 0),
(9, '移动', 3, 0, 'article/move', 0, '', '', 0),
(10, '复制', 3, 0, 'article/copy', 0, '', '', 0),
(11, '粘贴', 3, 0, 'article/paste', 0, '', '', 0),
(12, '导入', 3, 0, 'article/batchOperate', 0, '', '', 0),
(13, '回收站', 2, 0, 'article/recycle', 1, '', '内容', 0),
(14, '还原', 13, 0, 'article/permit', 0, '', '', 0),
(15, '清空', 13, 0, 'article/clear', 0, '', '', 0),
(16, '用户', 0, 3, 'User/index', 0, '', '', 0),
(17, '用户信息', 16, 0, 'User/index', 0, '', '用户管理', 0),
(18, '新增用户', 17, 0, 'User/add', 0, '添加新用户', '', 0),
(19, '用户行为', 16, 0, 'User/action', 0, '', '行为管理', 0),
(20, '新增用户行为', 19, 0, 'User/addaction', 0, '', '', 0),
(21, '编辑用户行为', 19, 0, 'User/editaction', 0, '', '', 0),
(22, '保存用户行为', 19, 0, 'User/saveAction', 0, '"用户->用户行为"保存编辑和新增的用户行为', '', 0),
(23, '变更行为状态', 19, 0, 'User/setStatus', 0, '"用户->用户行为"中的启用,禁用和删除权限', '', 0),
(24, '禁用会员', 19, 0, 'User/changeStatus?method=forbidUser', 0, '"用户->用户信息"中的禁用', '', 0),
(25, '启用会员', 19, 0, 'User/changeStatus?method=resumeUser', 0, '"用户->用户信息"中的启用', '', 0),
(26, '删除会员', 19, 0, 'User/changeStatus?method=deleteUser', 0, '"用户->用户信息"中的删除', '', 0),
(27, '权限管理', 16, 0, 'AuthManager/index', 0, '', '用户管理', 0),
(28, '删除', 27, 0, 'AuthManager/changeStatus?method=deleteGroup', 0, '删除用户组', '', 0),
(29, '禁用', 27, 0, 'AuthManager/changeStatus?method=forbidGroup', 0, '禁用用户组', '', 0),
(30, '恢复', 27, 0, 'AuthManager/changeStatus?method=resumeGroup', 0, '恢复已禁用的用户组', '', 0),
(31, '新增', 27, 0, 'AuthManager/createGroup', 0, '创建新的用户组', '', 0),
(32, '编辑', 27, 0, 'AuthManager/editGroup', 0, '编辑用户组名称和描述', '', 0),
(33, '保存用户组', 27, 0, 'AuthManager/writeGroup', 0, '新增和编辑用户组的"保存"按钮', '', 0),
(34, '授权', 27, 0, 'AuthManager/group', 0, '"后台 \\ 用户 \\ 用户信息"列表页的"授权"操作按钮,用于设置用户所属用户组', '', 0),
(35, '访问授权', 27, 0, 'AuthManager/access', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"访问授权"操作按钮', '', 0),
(36, '成员授权', 27, 0, 'AuthManager/user', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"成员授权"操作按钮', '', 0),
(37, '解除授权', 27, 0, 'AuthManager/removeFromGroup', 0, '"成员授权"列表页内的解除授权操作按钮', '', 0),
(38, '保存成员授权', 27, 0, 'AuthManager/addToGroup', 0, '"用户信息"列表页"授权"时的"保存"按钮和"成员授权"里右上角的"添加"按钮)', '', 0),
(39, '分类授权', 27, 0, 'AuthManager/category', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"分类授权"操作按钮', '', 0),
(40, '保存分类授权', 27, 0, 'AuthManager/addToCategory', 0, '"分类授权"页面的"保存"按钮', '', 0),
(41, '模型授权', 27, 0, 'AuthManager/modelauth', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"模型授权"操作按钮', '', 0),
(42, '保存模型授权', 27, 0, 'AuthManager/addToModel', 0, '"分类授权"页面的"保存"按钮', '', 0),
(43, '扩展', 0, 7, 'Addons/index', 0, '', '', 0),
(44, '插件管理', 43, 1, 'Addons/index', 0, '', '扩展', 0),
(45, '创建', 44, 0, 'Addons/create', 0, '服务器上创建插件结构向导', '', 0),
(46, '检测创建', 44, 0, 'Addons/checkForm', 0, '检测插件是否可以创建', '', 0),
(47, '预览', 44, 0, 'Addons/preview', 0, '预览插件定义类文件', '', 0),
(48, '快速生成插件', 44, 0, 'Addons/build', 0, '开始生成插件结构', '', 0),
(49, '设置', 44, 0, 'Addons/config', 0, '设置插件配置', '', 0),
(50, '禁用', 44, 0, 'Addons/disable', 0, '禁用插件', '', 0),
(51, '启用', 44, 0, 'Addons/enable', 0, '启用插件', '', 0),
(52, '安装', 44, 0, 'Addons/install', 0, '安装插件', '', 0),
(53, '卸载', 44, 0, 'Addons/uninstall', 0, '卸载插件', '', 0),
(54, '更新配置', 44, 0, 'Addons/saveconfig', 0, '更新插件配置处理', '', 0),
(55, '插件后台列表', 44, 0, 'Addons/adminList', 0, '', '', 0),
(56, 'URL方式访问插件', 44, 0, 'Addons/execute', 0, '控制是否有权限通过url访问插件控制器方法', '', 0),
(57, '钩子管理', 43, 2, 'Addons/hooks', 0, '', '扩展', 0),
(58, '模型管理', 68, 3, 'Model/index', 0, '', '系统设置', 0),
(59, '新增', 58, 0, 'model/add', 0, '', '', 0),
(60, '编辑', 58, 0, 'model/edit', 0, '', '', 0),
(61, '改变状态', 58, 0, 'model/setStatus', 0, '', '', 0),
(62, '保存数据', 58, 0, 'model/update', 0, '', '', 0),
(63, '属性管理', 68, 0, 'Attribute/index', 1, '网站属性配置。', '', 0),
(64, '新增', 63, 0, 'Attribute/add', 0, '', '', 0),
(65, '编辑', 63, 0, 'Attribute/edit', 0, '', '', 0),
(66, '改变状态', 63, 0, 'Attribute/setStatus', 0, '', '', 0),
(67, '保存数据', 63, 0, 'Attribute/update', 0, '', '', 0),
(68, '系统', 0, 4, 'Config/group', 0, '', '', 0),
(69, '网站设置', 68, 1, 'Config/group', 0, '', '系统设置', 0),
(70, '配置管理', 68, 4, 'Config/index', 0, '', '系统设置', 0),
(71, '编辑', 70, 0, 'Config/edit', 0, '新增编辑和保存配置', '', 0),
(72, '删除', 70, 0, 'Config/del', 0, '删除配置', '', 0),
(73, '新增', 70, 0, 'Config/add', 0, '新增配置', '', 0),
(74, '保存', 70, 0, 'Config/save', 0, '保存配置', '', 0),
(75, '菜单管理', 68, 5, 'Menu/index', 0, '', '系统设置', 0),
(76, '导航管理', 68, 6, 'Channel/index', 0, '', '系统设置', 0),
(77, '新增', 76, 0, 'Channel/add', 0, '', '', 0),
(78, '编辑', 76, 0, 'Channel/edit', 0, '', '', 0),
(79, '删除', 76, 0, 'Channel/del', 0, '', '', 0),
(80, '分类管理', 68, 2, 'Category/index', 0, '', '系统设置', 0),
(81, '编辑', 80, 0, 'Category/edit', 0, '编辑和保存栏目分类', '', 0),
(82, '新增', 80, 0, 'Category/add', 0, '新增栏目分类', '', 0),
(83, '删除', 80, 0, 'Category/remove', 0, '删除栏目分类', '', 0),
(84, '移动', 80, 0, 'Category/operate/type/move', 0, '移动栏目分类', '', 0),
(85, '合并', 80, 0, 'Category/operate/type/merge', 0, '合并栏目分类', '', 0),
(86, '备份数据库', 68, 0, 'Database/index?type=export', 0, '', '数据备份', 0),
(87, '备份', 86, 0, 'Database/export', 0, '备份数据库', '', 0),
(88, '优化表', 86, 0, 'Database/optimize', 0, '优化数据表', '', 0),
(89, '修复表', 86, 0, 'Database/repair', 0, '修复数据表', '', 0),
(90, '还原数据库', 68, 0, 'Database/index?type=import', 0, '', '数据备份', 0),
(91, '恢复', 90, 0, 'Database/import', 0, '数据库恢复', '', 0),
(92, '删除', 90, 0, 'Database/del', 0, '删除备份文件', '', 0),
(93, '其他', 0, 5, 'other', 1, '', '', 0),
(96, '新增', 75, 0, 'Menu/add', 0, '', '系统设置', 0),
(98, '编辑', 75, 0, 'Menu/edit', 0, '', '', 0),
(104, '下载管理', 102, 0, 'Think/lists?model=download', 0, '', '', 0),
(105, '配置管理', 102, 0, 'Think/lists?model=config', 0, '', '', 0),
(106, '行为日志', 16, 0, 'Action/actionlog', 0, '', '行为管理', 0),
(108, '修改密码', 16, 0, 'User/updatePassword', 1, '', '', 0),
(109, '修改昵称', 16, 0, 'User/updateNickname', 1, '', '', 0),
(110, '查看行为日志', 106, 0, 'action/edit', 1, '', '', 0),
(112, '新增数据', 58, 0, 'think/add', 1, '', '', 0),
(113, '编辑数据', 58, 0, 'think/edit', 1, '', '', 0),
(114, '导入', 75, 0, 'Menu/import', 0, '', '', 0),
(115, '生成', 58, 0, 'Model/generate', 0, '', '', 0),
(116, '新增钩子', 57, 0, 'Addons/addHook', 0, '', '', 0),
(117, '编辑钩子', 57, 0, 'Addons/edithook', 0, '', '', 0),
(118, '文档排序', 3, 0, 'Article/sort', 1, '', '', 0),
(119, '排序', 70, 0, 'Config/sort', 1, '', '', 0),
(120, '排序', 75, 0, 'Menu/sort', 1, '', '', 0),
(121, '排序', 76, 0, 'Channel/sort', 1, '', '', 0),
(122, 'App管理', 0, 0, 'Console/index', 0, 'App管理', '', 0),
(123, '客户信息', 122, 0, 'Client/index', 0, '', '', 0),
(124, '返利申请', 122, 0, 'Order/apply', 0, '', '', 0),
(125, '	用户反馈', 122, 0, 'Feedback/index', 0, '', '', 0),
(126, '联盟订单', 122, 0, 'Order/index', 0, '', '', 0),
(127, '提现申请', 122, 0, 'Withdrawal/index', 0, '', '', 0),
(128, '订单导入', 122, 0, 'Order/upload', 1, '', '', 0),
(129, '首页图片', 122, 0, 'Images/index', 0, '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `tsg_model`
--

CREATE TABLE IF NOT EXISTS `tsg_model` (
  `id` int(10) unsigned NOT NULL COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text NOT NULL COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text NOT NULL COMMENT '属性列表（表的字段）',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text NOT NULL COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎'
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='文档模型表';

--
-- 转存表中的数据 `tsg_model`
--

INSERT INTO `tsg_model` (`id`, `name`, `title`, `extend`, `relation`, `need_pk`, `field_sort`, `field_group`, `attribute_list`, `template_list`, `template_add`, `template_edit`, `list_grid`, `list_row`, `search_key`, `search_list`, `create_time`, `update_time`, `status`, `engine_type`) VALUES
(1, 'document', '基础文档', 0, '', 1, '{"1":["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:标题:article/index?cate_id=[category_id]&pid=[id]\r\ntype|get_document_type:类型\r\nlevel:优先级\r\nupdate_time|time_format:最后更新\r\nstatus_text:状态\r\nview:浏览\r\nid:操作:[EDIT]&cate_id=[category_id]|编辑,article/setstatus?status=-1&ids=[id]|删除', 0, '', '', 1383891233, 1384507827, 1, 'MyISAM'),
(2, 'article', '文章', 1, '', 1, '{"1":["3","24","2","5"],"2":["9","13","19","10","12","16","17","26","20","14","11","25"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题:article/edit?cate_id=[category_id]&id=[id]\r\ncontent:内容', 0, '', '', 1383891243, 1387260622, 1, 'MyISAM'),
(3, 'download', '下载', 1, '', 1, '{"1":["3","28","30","32","2","5","31"],"2":["13","10","27","9","12","16","17","19","11","20","14","29"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题', 0, '', '', 1383891252, 1387260449, 1, 'MyISAM');

-- --------------------------------------------------------

--
-- 表的结构 `tsg_oauth`
--

CREATE TABLE IF NOT EXISTS `tsg_oauth` (
  `id` int(11) NOT NULL,
  `createAt` bigint(20) NOT NULL,
  `updateAt` bigint(20) NOT NULL,
  `delflag` tinyint(4) NOT NULL DEFAULT '0',
  `appkey` varchar(50) NOT NULL DEFAULT 'tsg',
  `openid` varchar(200) NOT NULL,
  `device` varchar(20) NOT NULL,
  `clientid` int(11) NOT NULL,
  `userid` varchar(200) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tsg_oauth`
--

INSERT INTO `tsg_oauth` (`id`, `createAt`, `updateAt`, `delflag`, `appkey`, `openid`, `device`, `clientid`, `userid`) VALUES
(1, 1510728904843, 1510728904843, 0, 'tsg', 'AAHJI72hAFegsZiTOVkIebnv', 'android', 1, NULL),
(2, 1510736935748, 1510736935748, 0, 'tsg', 'AAHV8auGAFjyoa8HkiG60eXR', 'ios', 2, NULL),
(3, 1510740776971, 1510740776971, 0, 'tsg', 'AAE98auGAFjyoa8HkiH1sqpY', 'ios', 3, NULL),
(4, 1510740838323, 1510740838323, 0, 'tsg', 'AAGf8auGAFjyoa8HkiHyQEuO', 'ios', 4, NULL),
(5, 1510741152744, 1510741152744, 0, 'tsg', 'AAEi8auGAFjyoa8HkiG-QT7R', 'ios', 1, NULL),
(6, 1510796777256, 1510796777256, 0, 'tsg', 'AAEAI72hAFegsZiTOVlDii1m', 'android', 5, NULL),
(7, 1511016990382, 1511016990382, 0, 'tsg', 'AAEqI72hAFegsZiTOVl5Jksg', 'android', 6, NULL),
(8, 1511101160165, 1511101160165, 0, 'tsg', 'AAGs8auGAFjyoa8HkiGc92Oi', 'ios', 7, NULL),
(9, 1512309273135, 1512309273135, 0, 'tsg', 'AAEZ8auGAFjyoa8HkiEbqDAS', 'ios', 8, NULL),
(10, 1515060694407, 1515060694407, 0, 'tsg', 'AAHf8auGAFjyoa8HkiGAUKrR', 'ios', 9, NULL),
(11, 1515118761716, 1515118761716, 0, 'tsg', 'AAEFI72hAFegsZiTOVl4jqE-', 'android', 10, NULL),
(12, 1515575646759, 1515575646759, 0, 'tsg', 'AAFnI72hAFegsZiTOVlU_kQx', 'android', 11, NULL),
(13, 1516074140256, 1516074140256, 0, 'tsg', 'AAEO8auGAFjyoa8HkiHixsMP', 'ios', 11, NULL),
(14, 1516187693347, 1516187693347, 0, 'tsg', 'AAFq8auGAFjyoa8HkiFeXkFZ', 'ios', 13, NULL),
(15, 1516272362888, 1516272362888, 0, 'tsg', 'AAEM8auGAFjyoa8HkiG-6ohI', 'ios', 14, NULL),
(16, 1516286908873, 1516286908873, 0, 'tsg', 'AAET8auGAFjyoa8HkiHNNiRY', 'ios', 15, NULL),
(17, 1516582572538, 1516582572538, 0, 'tsg', 'AAHr8auGAFjyoa8HkiHPHswe', 'ios', 16, NULL),
(18, 1517490863182, 1517490863182, 0, 'tsg', 'AAFl8auGAFjyoa8HkiG7X_NE', 'ios', 17, NULL),
(19, 1517879387155, 1517879387155, 0, 'tsg', 'AAHjI72hAFegsZiTOVkEC8Tw', 'android', 18, NULL),
(20, 1519694065639, 1519694065639, 0, 'tsg', 'AAHdI72hAFegsZiTOVnio5Ao', 'android', 19, NULL),
(21, 1521990861598, 1521990861598, 0, 'tsg', 'AAH98auGAFjyoa8HkiECUnmc', 'ios', 20, NULL),
(22, 1521990861964, 1521990861964, 0, 'tsg', 'AAH98auGAFjyoa8HkiECUnmc', 'ios', 20, NULL),
(23, 1521990861965, 1521990861965, 0, 'tsg', 'AAH98auGAFjyoa8HkiECUnmc', 'ios', 20, NULL),
(24, 1521990861966, 1521990861966, 0, 'tsg', 'AAH98auGAFjyoa8HkiECUnmc', 'ios', 20, NULL),
(25, 1522375270944, 1522375270944, 0, 'tsg', 'AAECI72hAFegsZiTOVl7Eagu', 'android', 21, NULL),
(26, 1522508318540, 1522508318540, 0, 'tsg', 'AAFYI72hAFegsZiTOVmym1MY', 'android', 22, NULL),
(27, 1522584760477, 1522584760477, 0, 'tsg', 'AAEZI72hAFegsZiTOVm-uXwG', 'android', 23, NULL),
(28, 1522652113382, 1522652113382, 0, 'tsg', 'AAG0I72hAFegsZiTOVmOvdH4', 'android', 24, NULL),
(29, 1522708798447, 1522708798447, 0, 'tsg', 'AAH8I72hAFegsZiTOVmlheBS', 'android', 25, NULL),
(30, 1522720452919, 1522720452919, 0, 'tsg', 'AAE4I72hAFegsZiTOVlIMELe', 'android', 26, NULL),
(31, 1522843524347, 1522843524347, 0, 'tsg', 'AAHOI72hAFegsZiTOVnzMqbj', 'android', 27, NULL),
(32, 1522896612444, 1522896612444, 0, 'tsg', 'AAGxI72hAFegsZiTOVne9pSp', 'android', 28, NULL),
(33, 1523339232795, 1523339232795, 0, 'tsg', 'AAENI72hAFegsZiTOVlY9Hip', 'android', 29, NULL),
(34, 1524605441726, 1524605441726, 0, 'tsg', 'AAHBI72hAFegsZiTOVmI9D7n', 'android', 30, NULL),
(35, 1524985737457, 1524985737457, 0, 'tsg', 'AAHUI72hAFegsZiTOVmWBBmB', 'android', 31, NULL),
(36, 1525003569227, 1525003569227, 0, 'tsg', 'AAEAI72hAFegsZiTOVmJUuyZ', 'android', 32, NULL),
(37, 1525789591601, 1525789591601, 0, 'tsg', 'AAEVI72hAFegsZiTOVlDoHQe', 'android', 33, NULL),
(38, 1525799930290, 1525799930290, 0, 'tsg', 'AAEqFLMvAF1bYfYQp7tbsmLs', 'android', 34, NULL),
(39, 1525855763498, 1525855763498, 0, 'tsg', 'AAHXI72hAFegsZiTOVmhkmic', 'android', 35, NULL),
(40, 1525874657598, 1525874657598, 0, 'tsg', 'AAG5I72hAFegsZiTOVm9snyu', 'android', 36, NULL),
(41, 1525914903430, 1525914903430, 0, 'tsg', 'AAEKI72hAFegsZiTOVmRbeEL', 'android', 37, NULL),
(42, 1526019942659, 1526019942659, 0, 'tsg', 'AAHxI72hAFegsZiTOVmzn1Wq', 'android', 38, NULL),
(43, 1526219564066, 1526219564066, 0, 'tsg', 'AAEOI72hAFegsZiTOVn7XEJV', 'android', 39, NULL),
(44, 1526354849401, 1526354849401, 0, 'tsg', 'AAGPI72hAFegsZiTOVnfOp-3', 'android', 40, NULL),
(45, 1526460860662, 1526460860662, 0, 'tsg', 'AAEAI72hAFegsZiTOVmkoJEL', 'android', 41, NULL),
(46, 1526467672343, 1526467672343, 0, 'tsg', 'AAFgI72hAFegsZiTOVks6Mpi', 'android', 42, NULL),
(47, 1526544308188, 1526544308188, 0, 'tsg', 'AAFkI72hAFegsZiTOVle3hhw', 'android', 43, NULL),
(48, 1526780919678, 1526780919678, 0, 'tsg', 'AAFxI72hAFegsZiTOVlV30Fc', 'android', 44, NULL),
(49, 1526790088152, 1526790088152, 0, 'tsg', 'AAFbI72hAFegsZiTOVmsTvpH', 'android', 45, NULL),
(50, 1526982846001, 1526982846001, 0, 'tsg', 'AAEMI72hAFegsZiTOVmmHD9r', 'android', 46, NULL),
(51, 1527144014410, 1527144014410, 0, 'tsg', 'AAEHI72hAFegsZiTOVl5zstV', 'android', 47, NULL),
(52, 1527235066093, 1527235066093, 0, 'tsg', 'AAEDI72hAFegsZiTOVm_YWVe', 'android', 48, NULL),
(53, 1527323314826, 1527323314826, 0, 'tsg', 'AAEBI72hAFegsZiTOVmn8ycg', 'android', 49, NULL),
(54, 1527813875513, 1527813875513, 0, 'tsg', 'AAE-8auGAFjyoa8HkiER8CYD', 'ios', 50, NULL),
(55, 1527848879939, 1527848879939, 0, 'tsg', 'AAFpI72hAFegsZiTOVlVQTf8', 'android', 51, NULL),
(56, 1528115638742, 1528115638742, 0, 'tsg', 'AAHOI72hAFegsZiTOVmrxoe2', 'android', 52, NULL),
(57, 1528206805403, 1528206805403, 0, 'tsg', 'AAHZI72hAFegsZiTOVmJ83HM', 'android', 53, NULL),
(58, 1528207344213, 1528207344213, 0, 'tsg', 'AAGQI72hAFegsZiTOVntyNHq', 'android', 54, NULL),
(59, 1528212214687, 1528212214687, 0, 'tsg', 'AAGzI72hAFegsZiTOVlJVvGD', 'android', 55, NULL),
(60, 1528261121837, 1528261121837, 0, 'tsg', 'AAEMI72hAFegsZiTOVnxjGIN', 'android', 56, NULL),
(61, 1528266271934, 1528266271934, 0, 'tsg', 'AAH0I72hAFegsZiTOVmEFwwt', 'android', 57, NULL),
(62, 1528293175107, 1528293175107, 0, 'tsg', 'AAHMI72hAFegsZiTOVmu2ZMS', 'android', 58, NULL),
(63, 1528293786078, 1528293786078, 0, 'tsg', 'AAGUI72hAFegsZiTOVlmj0m2', 'android', 59, NULL),
(64, 1528542432608, 1528542432608, 0, 'tsg', 'AAEZI72hAFegsZiTOVnl5Iwk', 'android', 60, NULL),
(65, 1528614405219, 1528614405219, 0, 'tsg', 'AAHsI72hAFegsZiTOVmTgsnu', 'android', 61, NULL),
(66, 1528870741220, 1528870741220, 0, 'tsg', 'AAEHI72hAFegsZiTOVnxGAbY', 'android', 62, NULL),
(67, 1529236142057, 1529236142057, 0, 'tsg', 'AAHrI72hAFegsZiTOVlJqrUj', 'android', 63, NULL),
(68, 1529691110812, 1529691110812, 0, 'tsg', 'AAGf8auGAFjyoa8HkiEc_eSO', 'ios', 64, NULL),
(69, 1529723035106, 1529723035106, 0, 'tsg', 'AAHkI72hAFegsZiTOVncgqZA', 'android', 65, NULL),
(70, 1529991967626, 1529991967626, 0, 'tsg', 'AAHS8auGAFjyoa8HkiG4NO7k', 'ios', 66, NULL),
(71, 1530100630064, 1530100630064, 0, 'tsg', 'AAGtI72hAFegsZiTOVnowYHj', 'android', 67, NULL),
(72, 1530271688797, 1530271688797, 0, 'tsg', 'AAGt8auGAFjyoa8HkiEJr_Hw', 'ios', 68, NULL),
(73, 1530351629293, 1530351629293, 0, 'tsg', 'AAHvI72hAFegsZiTOVkXzZbV', 'android', 69, NULL),
(74, 1530530940033, 1530530940033, 0, 'tsg', 'AAHZI72hAFegsZiTOVlf8Mej', 'android', 70, NULL),
(75, 1530696819881, 1530696819881, 0, 'tsg', 'AAGrI72hAFegsZiTOVmfCjCy', 'android', 71, NULL),
(76, 1530939739341, 1530939739341, 0, 'tsg', 'AAGgI72hAFegsZiTOVn1reH9', 'android', 72, NULL),
(77, 1531169500925, 1531169500925, 0, 'tsg', 'AAEwI72hAFegsZiTOVk6mQY3', 'android', 73, NULL),
(78, 1531437001606, 1531437001606, 0, 'tsg', 'AAFUI72hAFegsZiTOVn1kjB9', 'android', 74, NULL),
(79, 1531521666966, 1531521666966, 0, 'tsg', 'AAEdI72hAFegsZiTOVmYFWvl', 'android', 75, NULL),
(80, 1531654399150, 1531654399150, 0, 'tsg', 'AAGiI72hAFegsZiTOVnwrd6H', 'android', 76, NULL),
(81, 1532123461728, 1532123461728, 0, 'tsg', 'AAESI72hAFegsZiTOVnoaktV', 'android', 77, NULL),
(82, 1532400477019, 1532400477019, 0, 'tsg', 'AAEfI72hAFegsZiTOVksE19h', 'android', 78, NULL),
(83, 1533078774705, 1533078774705, 0, 'tsg', 'AAHtI72hAFegsZiTOVm8_Ogt', 'android', 79, NULL),
(84, 1533705643020, 1533705643020, 0, 'tsg', 'AAHZI72hAFegsZiTOVlXgzSr', 'android', 80, NULL),
(85, 1534018177017, 1534018177017, 0, 'tsg', 'AAENI72hAFegsZiTOVnsPCWg', 'android', 81, NULL),
(86, 1534084863568, 1534084863568, 0, 'tsg', 'AAG4I72hAFegsZiTOVmVdbbY', 'android', 82, NULL),
(87, 1534210825200, 1534210825200, 0, 'tsg', 'AAH8I72hAFegsZiTOVlYDu8H', 'android', 83, NULL),
(88, 1534389359565, 1534389359565, 0, 'tsg', 'AAGPI72hAFegsZiTOVlKSbuh', 'android', 84, NULL),
(89, 1534687062300, 1534687062300, 0, 'tsg', 'AAEhI72hAFegsZiTOVkQFBjF', 'android', 85, NULL),
(90, 1535119651504, 1535119651504, 0, 'tsg', 'AAGNI72hAFegsZiTOVkS4Nmi', 'android', 86, NULL),
(91, 1535196553827, 1535196553827, 0, 'tsg', 'AAHsI72hAFegsZiTOVmedszs', 'android', 87, NULL),
(92, 1535207210221, 1535207210221, 0, 'tsg', 'AAEdI72hAFegsZiTOVmVbRLp', 'android', 88, NULL),
(93, 1535340612888, 1535340612888, 0, 'tsg', 'AAHGI72hAFegsZiTOVm8D82O', 'android', 89, NULL),
(94, 1536507467134, 1536507467134, 0, 'tsg', 'AAEcI72hAFegsZiTOVlG2zal', 'android', 90, NULL),
(95, 1536564688127, 1536564688127, 0, 'tsg', 'AAERI72hAFegsZiTOVmYlqcc', 'android', 91, NULL),
(96, 1536705778828, 1536705778828, 0, 'tsg', 'AAGnI72hAFegsZiTOVl6k1qg', 'android', 92, NULL),
(97, 1536845462133, 1536845462133, 0, 'tsg', 'AAG6I72hAFegsZiTOVmKaMfh', 'android', 93, NULL),
(98, 1537056040939, 1537056040939, 0, 'tsg', 'AAEkI72hAFegsZiTOVnUDzzl', 'android', 94, NULL),
(99, 1537266695547, 1537266695547, 0, 'tsg', 'AAF5I72hAFegsZiTOVnxvHoy', 'android', 95, NULL),
(100, 1537673635585, 1537673635585, 0, 'tsg', 'AAEBI72hAFegsZiTOVmRdg9L', 'android', 96, NULL),
(101, 1537849835626, 1537849835626, 0, 'tsg', 'AAEsI72hAFegsZiTOVnWRIVt', 'android', 97, NULL),
(102, 1538034371277, 1538034371277, 0, 'tsg', 'AAGfI72hAFegsZiTOVmdCbGo', 'android', 98, NULL),
(103, 1538492758799, 1538492758799, 0, 'tsg', 'AAHJI72hAFegsZiTOVmZSNH3', 'android', 99, NULL),
(104, 1539041901959, 1539041901959, 0, 'tsg', 'AAHrI72hAFegsZiTOVlCkOSV', 'android', 100, NULL),
(105, 1539500486822, 1539500486822, 0, 'tsg', 'AAHXI72hAFegsZiTOVmwYVPT', 'android', 101, NULL),
(106, 1540000629196, 1540000629196, 0, 'tsg', 'AAFDI72hAFegsZiTOVnzO-4H', 'android', 102, NULL),
(107, 1540052364607, 1540052364607, 0, 'tsg', 'AAH6I72hAFegsZiTOVmjao3A', 'android', 103, NULL),
(108, 1540169133710, 1540169133710, 0, 'tsg', 'AAEnI72hAFegsZiTOVlMhU1p', 'android', 104, NULL),
(109, 1540217275089, 1540217275089, 0, 'tsg', 'AAERI72hAFegsZiTOVnS13xM', 'android', 105, NULL),
(110, 1540997255645, 1540997255645, 0, 'tsg', 'AAGeI72hAFegsZiTOVnFkcre', 'android', 106, NULL),
(111, 1541862945516, 1541862945516, 0, 'tsg', 'AAF48auGAFjyoa8HkiELymwj', 'ios', 107, NULL),
(112, 1541948890614, 1541948890614, 0, 'tsg', 'AAHtI72hAFegsZiTOVkHt73S', 'android', 108, NULL),
(113, 1542273124088, 1542273124088, 0, 'tsg', 'AAETI72hAFegsZiTOVnx3SID', 'android', 109, NULL),
(114, 1542537460474, 1542537460474, 0, 'tsg', 'AAEqI72hAFegsZiTOVm_saF5', 'android', 110, NULL),
(115, 1542772624610, 1542772624610, 0, 'tsg', 'AAG9I72hAFegsZiTOVm2iBDP', 'android', 111, NULL),
(116, 1542899872626, 1542899872626, 0, 'tsg', 'AAElI72hAFegsZiTOVnxCHgU', 'android', 112, NULL),
(117, 1543014316785, 1543014316785, 0, 'tsg', 'AAHyI72hAFegsZiTOVldDtGW', 'android', 113, NULL),
(118, 1543398844799, 1543398844799, 0, 'tsg', 'AAEjI72hAFegsZiTOVl4bSD-', 'android', 114, NULL),
(119, 1543560606654, 1543560606654, 0, 'tsg', 'AAETI72hAFegsZiTOVmUNDH6', 'android', 115, NULL),
(120, 1543917554487, 1543917554487, 0, 'tsg', 'AAGjI72hAFegsZqTOVliF476', 'android', 116, NULL),
(121, 1543917578980, 1543917578980, 0, 'tsg', 'AAFCI72hAFegsZiTOVlL_fNn', 'android', 117, NULL),
(122, 1544135864213, 1544135864213, 0, 'tsg', 'AAH4I72hAFegsZiTOVmeY4JV', 'android', 118, NULL),
(123, 1544323197924, 1544323197924, 0, 'tsg', 'AAF7I72hAFegsZiTOVm163pB', 'android', 119, NULL),
(124, 1544434129884, 1544434129884, 0, 'tsg', 'AAHgI72hAFegsZiTOVl7Z5JM', 'android', 120, NULL),
(125, 1544493906680, 1544493906680, 0, 'tsg', 'AAHYI72hAFegsZiTOVmqt7uc', 'android', 121, NULL),
(126, 1544577771372, 1544577771372, 0, 'tsg', 'AAGY8auGAFjyoa8HkiGxw5_x', 'ios', 122, NULL),
(127, 1544579881793, 1544579881793, 0, 'tsg', 'AAEDI72hAFegsZiTOVmcYGEG', 'android', 123, NULL),
(128, 1544712993557, 1544712993557, 0, 'tsg', 'AAEeI72hAFegsZqTOVlllNso', 'android', 124, NULL),
(129, 1545483924508, 1545483924508, 0, 'tsg', 'AAHUI72hAFegsZiTOVmm6zfs', 'android', 125, NULL),
(130, 1545713079430, 1545713079430, 0, 'tsg', 'AAHTI72hAFegsZiTOVmyMIVM', 'android', 126, NULL),
(131, 1545980764197, 1545980764197, 0, 'tsg', 'AAHAI72hAFegsZiTOVm0xSOE', 'android', 127, NULL),
(132, 1546564928590, 1546564928590, 0, 'tsg', 'AAEWI72hAFegsZiTOVkQ4Ooc', 'android', 128, NULL),
(133, 1547371870763, 1547371870763, 0, 'tsg', 'AAHvI72hAFegsZiTOVmlvlgU', 'android', 129, NULL),
(134, 1547389274128, 1547389274128, 0, 'tsg', 'AAE-I72hAFegsZiTOVmnREBz', 'android', 130, NULL),
(135, 1547556081847, 1547556081847, 0, 'tsg', 'AAG1I72hAFegsZiTOVmsygcY', 'android', 131, NULL),
(136, 1548175488437, 1548175488437, 0, 'tsg', 'AAEEI72hAFegsZiTOVnsNjeL', 'android', 132, NULL),
(137, 1549763134669, 1549763134669, 0, 'tsg', 'AAE4I72hAFegsZiTOVmqf3xz', 'android', 133, NULL),
(138, 1550333171896, 1550333171896, 0, 'tsg', 'AAFaI72hAFegsZiTOVkGVZRL', 'android', 134, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `tsg_order`
--

CREATE TABLE IF NOT EXISTS `tsg_order` (
  `id` int(11) NOT NULL,
  `delflag` tinyint(4) NOT NULL DEFAULT '0',
  `createAt` bigint(20) NOT NULL DEFAULT '0',
  `updateAt` bigint(20) NOT NULL DEFAULT '0',
  `status` varchar(100) DEFAULT NULL,
  `amount` varchar(100) DEFAULT NULL,
  `dealTime` varchar(100) NOT NULL,
  `commissionAmount` varchar(100) NOT NULL,
  `subsidyAmount` varchar(100) NOT NULL,
  `productId` varchar(100) NOT NULL,
  `productName` varchar(500) NOT NULL,
  `productCount` varchar(200) NOT NULL,
  `productPrice` varchar(200) NOT NULL,
  `shopName` varchar(200) NOT NULL,
  `createTime` varchar(100) NOT NULL,
  `oid` varchar(100) DEFAULT NULL,
  `withdrawalAt` bigint(20) DEFAULT NULL,
  `isWithdrawal` tinyint(4) NOT NULL DEFAULT '0',
  `fanli_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=782 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tsg_order`
--

INSERT INTO `tsg_order` (`id`, `delflag`, `createAt`, `updateAt`, `status`, `amount`, `dealTime`, `commissionAmount`, `subsidyAmount`, `productId`, `productName`, `productCount`, `productPrice`, `shopName`, `createTime`, `oid`, `withdrawalAt`, `isWithdrawal`, `fanli_id`) VALUES
(1, 0, 0, 0, '订单结算', '37', '2017-11-13 01:27:13', '1.11', '0.37', '37659730958', '墨西哥原装进口 Corona/科罗娜啤酒 330ml*6瓶 整箱', '1', '94', '天猫超市', '2017-11-11 01:24:33', '83562492734784630', NULL, 0, NULL),
(2, 0, 0, 0, '订单结算', '39', '2017-11-13 01:27:13', '1.17', '0.39', '35649750981', '西班牙进口红酒爱之湾桃红起泡酒甜气泡葡萄酒750ml', '1', '210', '天猫超市', '2017-11-11 01:24:32', '83562492734784630', NULL, 0, NULL),
(3, 0, 0, 0, '订单结算', '49.81', '2017-11-12 21:27:02', '2.49', '0', '537544065273', '加绒打底裤外穿薄绒九分裤小脚裤铅笔裤黑色裤子女秋季加厚长裤', '1', '199', '7小天', '2017-11-11 01:23:55', '87900517923081760', NULL, 0, NULL),
(4, 0, 0, 0, '订单结算', '43.47', '2017-11-12 21:59:21', '0.65', '0', '530391295323', '拜耳药粉宠物狗狗杀除跳蚤去虱子驱虫防蚊虫项圈防皮肤病脖圈颈圈', '1', '96', 'hello帽 宠物用品城', '2017-11-11 01:22:28', '87900517921081760', NULL, 0, NULL),
(5, 0, 0, 0, '订单结算', '25.41', '2017-11-12 12:40:30', '4.57', '0.13', '553601477429', '【双11狂欢价】浪莎春秋季中厚款丝袜连裤袜女防勾丝天鹅绒打底黑色肉色显瘦腿袜', '1', '76', '浪莎高事达专卖店', '2017-11-11 01:21:53', '87850564440081760', NULL, 0, NULL),
(6, 0, 0, 0, '订单结算', '85.96', '2017-11-12 12:41:12', '18.05', '0.43', '526085566037', '【双11狂欢价】2017秋冬季新款加厚加绒宽松卫衣女装套头学生中长款bf韩版外套潮', '1', '218', 'jcoolstory旗舰店', '2017-11-11 01:21:53', '87850564446081760', NULL, 0, NULL),
(7, 0, 0, 0, '订单结算', '433.76', '2017-11-12 12:40:43', '26.03', '2.17', '529066909319', '【双11狂欢价】皇家狗粮 中型犬幼犬粮MEJ32 4KG*4萨摩耶哈士奇柯基狗粮', '1', '956', '皇家宠物食品旗舰店', '2017-11-11 01:21:52', '87850564441081760', NULL, 0, NULL),
(8, 0, 0, 0, '订单结算', '49.9', '2017-11-13 01:27:33', '0.75', '0.25', '558522622317', '加量装清风原木纯品3层120抽中规30包抽取面纸巾整箱', '1', '127.9', '天猫超市', '2017-11-11 01:18:57', '83490310045784630', 1510807207, 1, 5),
(9, 0, 0, 0, '订单结算', '62.8', '2017-11-13 09:09:21', '0.94', '0.31', '41122330248', '【双11狂欢价】遇见香芬COCO香水洗发水护发素沐浴露三件套装持久留香男女家庭装', '1', '444', 'cocoessence旗舰店', '2017-11-11 00:52:35', '82836599292386514', NULL, 0, NULL),
(10, 0, 0, 0, '订单结算', '116', '2017-11-12 19:23:20', '5.8', '0.58', '525650887454', '【双11狂欢价】乐扣乐扣 娜姆马克保温杯 时尚简约情侣男女黑白红 500ml LHC4125', '1', '258', '乐扣乐扣旗舰店', '2017-11-11 00:12:06', '88922187122952681', NULL, 0, NULL),
(11, 0, 0, 0, '订单结算', '29.01', '2017-11-11 19:02:06', '0.44', '0', '524630951876', '口罩一次性透气男女秋冬季时尚韩版可爱个性女神黑潮款批发50只装', '2', '29.15', '当当阁 时尚网购享当当', '2017-11-10 13:04:47', '86329662125081760', NULL, 0, NULL),
(12, 0, 0, 0, '订单结算', '35.8', '2017-11-10 21:56:42', '0.57', '0', '550939007695', '特价2碗2盘2勺2筷家用套装 情侣2人清新碗盘勺筷组合餐具 可微波', '1', '71.6', '玲珑餐具', '2017-11-08 22:21:19', '85752189593081760', NULL, 0, NULL),
(13, 0, 0, 0, '订单结算', '32.86', '2017-11-10 21:59:46', '1.31', '0.16', '540421207446', '【2件5折】炊大皇全钢柄不锈钢切菜刀切肉刀砍骨刀切片刀多刀', '1', '69.9', '天猫超市', '2017-11-08 22:11:15', '85781927748081760', NULL, 0, NULL),
(14, 0, 0, 0, '订单结算', '55.84', '2017-11-10 21:59:46', '1.68', '0.28', '40659152717', '【日用百货】百富帝加厚保暖被子冬被 2米双人加厚保暖棉被 被褥', '1', '269', '天猫超市', '2017-11-08 22:11:15', '85781927748081760', NULL, 0, NULL),
(15, 0, 0, 0, '订单结算', '30.99', '2017-11-12 21:59:01', '1.55', '0.15', '521422451240', '植护原木抽纸24包餐巾纸抽纸批发纸巾整箱家庭装卫生纸家用面巾纸', '1', '150', '植护旗舰店', '2017-11-08 15:18:18', '85597182568081760', 1510740411, 1, 4),
(16, 0, 0, 0, '订单结算', '5.9', '2017-11-10 08:54:44', '0.09', '0.03', '41385219786', '【买2包邮】挤酱瓶挤压瓶酱汁樽挤瓶沙拉番茄酱瓶寿司挤酱瓶油壶', '1', '10.8', '谷色食品专营店', '2017-11-08 15:11:34', '85593514648081760', NULL, 0, NULL),
(17, 0, 0, 0, '订单结算', '5.9', '2017-11-10 08:54:44', '0.09', '0.03', '41385219786', '【买2包邮】挤酱瓶挤压瓶酱汁樽挤瓶沙拉番茄酱瓶寿司挤酱瓶油壶', '1', '10.8', '谷色食品专营店', '2017-11-08 15:11:34', '85593514648081760', NULL, 0, NULL),
(18, 0, 0, 0, '订单结算', '13.6', '2017-11-10 08:54:44', '0.2', '0.07', '36636107471', '寿司工具套装全套材料食材紫菜包饭套餐酸萝卜条大根条金大根400g', '2', '7.8', '谷色食品专营店', '2017-11-08 15:11:34', '85593514648081760', NULL, 0, NULL),
(19, 0, 0, 0, '订单结算', '16.8', '2017-11-10 22:29:57', '2.54', '0', '552735157264', '陶瓷小花瓶小清新水培花器玻璃透明客厅插花现代干花家居装饰摆件', '1', '33.6', '曦尚工厂店', '2017-11-08 12:51:23', '80914035398386514', NULL, 0, NULL),
(20, 0, 0, 0, '订单结算', '14.9', '2017-11-13 01:27:24', '4.5', '0.04', '535386917387', 'AA充电电池充电器套装 通用5号7号共8节 电池可充遥控玩具鼠标ktv', '1', '46', '百乐士数码专营店', '2017-11-07 21:46:20', '80538997548784630', NULL, 0, NULL),
(21, 0, 0, 0, '订单结算', '359', '2017-12-05 21:41:57', '5.39', '1.08', '528626631173', 'Midea/美的 M1-L213C 微波炉智能21L迷你转盘式多功能家用正品', '1', '599', 'midea楚鹰专卖店', '2017-12-02 18:51:36', '101672139475907060', NULL, 0, NULL),
(22, 0, 0, 0, '订单结算', '148', '2017-12-06 19:24:55', '7.4', '0.74', '561754673558', '外套男士冬季棉衣2017新款个性潮棉袄精神小伙冬装韩版面包服棉服', '1', '230', '法宾鄂旗舰店', '2017-11-30 19:37:36', '98198754232774396', NULL, 0, NULL),
(23, 0, 0, 0, '订单结算', '9.9', '2017-12-05 09:59:40', '2.97', '0.05', '18189361007', '明爵 平底锅不粘锅无油烟锅牛排煎锅 单身小炒锅电磁炉用锅具煎蛋', '1', '124.5', '明爵旗舰店', '2017-11-30 11:03:32', '99040584246081760', NULL, 0, NULL),
(24, 0, 0, 0, '订单结算', '26.07', '2017-12-05 09:59:53', '1.3', '0', '559794642527', '衡阳特产鸡蛋豆腐鲜蛋豆腐日本豆腐蛋制玉子豆腐铁板红烧麻辣烫', '1', '38.8', '物美价廉乡村味', '2017-11-30 10:58:05', '99129683700081760', NULL, 0, NULL),
(25, 0, 0, 0, '订单结算', '147', '2017-12-05 10:00:08', '7.35', '0', '41414580474', '天天特价青岛大虾鲜活海鲜水产新鲜野生海捕对虾海虾基围虾大活虾', '2', '99', '青岛卖鱼郎', '2017-11-30 10:48:54', '99121339445081760', NULL, 0, NULL),
(26, 0, 0, 0, '订单结算', '58.41', '2017-12-05 10:00:08', '2.92', '0', '520591382461', '青岛特产野生红岛蛤蜊肉新鲜鲜活蛤蜊现剥250g冷冻发货干净无沙', '4', '29.8', '青岛卖鱼郎', '2017-11-30 10:48:54', '99121339445081760', NULL, 0, NULL),
(27, 0, 0, 0, '订单结算', '58', '2017-12-05 10:00:23', '1.16', '0.29', '553764287328', '测犬瘟细小试纸狗瘟病毒狗狗测试纸cpv宠物小狗cdv检测犬瘟热套装', '3', '58', '迪曼宠物用品专营店', '2017-11-29 14:45:04', '98458048057081760', NULL, 0, NULL),
(28, 0, 0, 0, '订单结算', '48', '2017-11-30 10:59:55', '14.4', '0.24', '555552099146', '法芙乐 生巧克力礼盒装送女朋友手工抹茶松露零食圣诞节生日礼物', '1', '149', '法芙乐旗舰店', '2017-11-29 12:17:47', '98344508113081760', NULL, 0, NULL),
(29, 0, 0, 0, '订单结算', '55.86', '2017-12-05 10:00:36', '1.68', '0', '559174764665', '泰迪比熊博美金毛拉布拉多萨摩哈士奇阿拉边牧宠物秋冬狗狗衣服厚', '1', '66', 'My萌宠物用品', '2017-11-28 12:33:53', '97671643088081760', NULL, 0, NULL),
(30, 0, 0, 0, '订单结算', '11.6', '2017-12-03 14:32:50', '0.58', '0.06', '42689678191', 'NEWLINKER 围嘴 纯棉婴儿儿童口水兜吸水宝宝口水巾 围兜全棉饭兜', '1', '39', 'newlinker旗舰店', '2017-11-23 12:28:59', '93694271189081760', NULL, 0, NULL),
(31, 0, 0, 0, '订单结算', '17.4', '2017-12-03 14:32:50', '0.87', '0.09', '555800542569', '婴儿袜子春秋季初生男女宝宝彩棉松口袜护脚套0-1岁新生儿用品', '3', '19', 'newlinker旗舰店', '2017-11-23 12:28:59', '93694271189081760', NULL, 0, NULL),
(32, 0, 0, 0, '订单结算', '66.7', '2017-12-03 14:32:50', '3.34', '0.33', '523764811571', '初生婴儿棉衣服秋冬季连体衣加厚新生儿满月保暖哈衣爬服加厚棉袄', '1', '588', 'newlinker旗舰店', '2017-11-23 12:28:59', '93694271189081760', NULL, 0, NULL),
(33, 0, 0, 0, '订单结算', '54.14', '2017-12-03 14:32:50', '2.71', '0.27', '44281423132', '2017春秋婴幼儿衣服宝宝爬服纯棉婴儿连体衣新生儿哈衣0到3个月', '1', '199', 'newlinker旗舰店', '2017-11-23 12:28:59', '93694271189081760', NULL, 0, NULL),
(34, 0, 0, 0, '订单结算', '7.73', '2017-12-03 14:32:50', '0.39', '0.04', '42720737220', 'newlinker有机棉 婴儿保暖鞋套新生儿宝宝脚套加厚护脚秋冬季', '1', '29', 'newlinker旗舰店', '2017-11-23 12:28:59', '93694271189081760', NULL, 0, NULL),
(35, 0, 0, 0, '订单结算', '11.6', '2017-12-03 14:32:51', '0.58', '0.06', '42736420470', '有机彩棉婴儿棉帽子新生儿宝宝胎帽婴儿帽子春秋满月帽男女宝宝', '1', '49', 'newlinker旗舰店', '2017-11-23 12:28:59', '93694271189081760', NULL, 0, NULL),
(36, 0, 0, 0, '订单结算', '120.83', '2017-12-03 14:32:50', '6.04', '0.6', '554271996668', '彩棉袄婴儿连体衣服加厚春秋冬季0岁3个月宝宝新生儿棉衣外出服', '1', '599', 'newlinker旗舰店', '2017-11-23 12:28:59', '93694271189081760', NULL, 0, NULL),
(37, 0, 0, 0, '订单结算', '33.5', '2017-11-25 18:06:28', '7.04', '0', '557907568180', '靴下物580D中压天鹅绒连裤袜秋冬中厚显瘦婴儿绒打底袜美腿袜子女', '1', '58', '靴下物', '2017-11-23 10:47:48', '93497540869386514', NULL, 0, NULL),
(38, 0, 0, 0, '订单结算', '33.5', '2017-11-25 18:06:27', '7.04', '0', '557907568180', '靴下物580D中压天鹅绒连裤袜秋冬中厚显瘦婴儿绒打底袜美腿袜子女', '1', '58', '靴下物', '2017-11-23 10:47:48', '93497540869386514', NULL, 0, NULL),
(39, 0, 0, 0, '订单结算', '108', '2017-11-24 20:10:50', '5.4', '0.32', '557952753814', '落地遥控小太阳取暖器家用烤火炉节能电暖气立式暖风机速热电热扇', '1', '128', '骆驼望晓源专卖店', '2017-11-22 16:01:03', '96482719905774396', NULL, 0, NULL),
(40, 0, 0, 0, '订单结算', '108', '2017-12-02 18:36:30', '5.4', '0.32', '557952753814', '落地遥控小太阳取暖器家用烤火炉节能电暖气立式暖风机速热电热扇', '1', '128', '骆驼望晓源专卖店', '2017-11-22 16:00:56', '93166669752837370', NULL, 0, NULL),
(41, 0, 0, 0, '订单结算', '150', '2017-12-02 13:29:49', '3.75', '0', '548522197697', '洁云平板卫生纸400张42包整箱家用厕纸手纸草纸江浙沪皖包邮', '1', '158', '优梵家居', '2017-11-22 13:20:20', '92843656870081760', NULL, 0, NULL),
(42, 0, 0, 0, '订单结算', '67.62', '2017-12-01 19:25:38', '13.52', '0', '560542647477', '羽绒棉马甲女短款原宿韩版2017秋冬加厚学生面包服百搭坎肩马夹潮', '1', '109', '大浪家 潮流休闲女装', '2017-11-21 10:43:07', '92000719969081760', NULL, 0, NULL),
(43, 0, 0, 0, '订单结算', '25.29', '2017-12-01 13:20:04', '0.76', '0', '557579894118', '洁柔手帕纸 餐巾纸小包纸巾 可湿水面巾纸古龙水香面纸超迷你72包', '1', '33.9', '双福百货批发', '2017-11-20 23:22:45', '91728670166081760', NULL, 0, NULL),
(44, 0, 0, 0, '订单结算', '14.8', '2017-12-01 08:41:33', '2.96', '0.07', '524843804501', '那芙宠物消毒液狗狗除臭剂杀菌消毒环境除臭猫去尿味香水除味用品', '2', '50', '缘宠宠物用品专营店', '2017-11-20 23:03:47', '91712738410907060', 1512627114, 1, 7),
(45, 0, 0, 0, '订单结算', '49.9', '2017-12-01 17:22:54', '5.49', '0.25', '558542523051', '清沐纯子餐厅纸巾批发抽纸家庭装整箱特价50包抽取式家用无香面纸', '1', '199', '清沐纯子旗舰店', '2017-11-20 22:51:35', '91662224924081760', NULL, 0, NULL),
(46, 0, 0, 0, '订单结算', '99', '2017-11-30 13:41:24', '3.47', '0', '559632985712', '【主播定制】简约1.8m1.5米2.0床单被套双人北欧4件套ins', '1', '498', '浅时光布艺家纺', '2017-11-20 10:46:31', '91158927189081760', NULL, 0, NULL),
(47, 0, 0, 0, '订单结算', '109', '2017-11-30 13:06:36', '2.18', '0.55', '541898027792', '抗菌 加厚夹棉床笠单件床垫保护套防滑加棉床罩床套子1.5米1.8m米', '1', '218', '金贝壳家纺旗舰店', '2017-11-20 10:43:05', '90942233788081760', NULL, 0, NULL),
(48, 0, 0, 0, '订单结算', '43', '2017-11-29 09:27:38', '3.44', '0', '18170331035', '阳台客厅壁挂式吊篮花架 挂墙上垂吊吊兰花盆架 挂壁悬挂花篮架', '1', '43', '顶峰铁制饰品工艺厂', '2017-11-19 00:00:04', '90304507160081760', NULL, 0, NULL),
(49, 0, 0, 0, '订单结算', '12.8', '2017-11-22 01:53:56', '0.26', '0.06', '16612740369', '宠物毯子毛毯狗狗被子狗垫子床垫猫棉垫泰迪窝垫狗垫用品冬季保暖', '1', '21.5', '华元宠物用品专营店', '2017-11-18 14:01:22', '95691240621952681', NULL, 0, NULL),
(50, 0, 0, 0, '订单结算', '8.8', '2017-11-22 01:53:55', '0.18', '0.04', '10649162395', '狗狗指甲剪刀猫咪指甲剪宠物指甲钳泰迪金毛中小型犬专用剪指甲刀', '1', '36', '华元宠物用品专营店', '2017-11-18 14:01:22', '95691240621952681', NULL, 0, NULL),
(51, 0, 0, 0, '订单结算', '23.9', '2017-11-22 01:53:55', '0.48', '0.12', '15472733204', '誉丰 狗狗零食除臭狗饼干幼犬磨牙棒洁齿除口臭泰迪比熊宠物补钙', '1', '30', '华元宠物用品专营店', '2017-11-18 14:01:22', '95691240621952681', NULL, 0, NULL),
(52, 0, 0, 0, '订单结算', '5.1', '2017-11-22 01:53:55', '0.1', '0.03', '538157066663', '泰迪狗狗衣服秋冬装比熊博美雪纳瑞法斗小狗小型幼犬宠物四脚棉衣', '1', '49.8', '华元宠物用品专营店', '2017-11-18 14:01:22', '95691240621952681', NULL, 0, NULL),
(53, 0, 0, 0, '订单结算', '16.8', '2017-11-22 01:53:55', '0.34', '0.08', '17882270303', '狗狗毛巾仿鹿皮强力吸水宠物大号擦泰迪金毛浴巾猫咪洗澡沐浴用品', '1', '16.8', '华元宠物用品专营店', '2017-11-18 14:01:22', '95691240621952681', NULL, 0, NULL),
(54, 0, 0, 0, '订单结算', '5', '2017-11-22 01:53:56', '0.1', '0.03', '547158618492', '雪貂宠物消毒液泰迪祛味猫砂除臭剂狗狗杀菌喷雾猫咪去尿味除狗味', '1', '39', '华元宠物用品专营店', '2017-11-18 14:01:22', '95691240621952681', NULL, 0, NULL),
(55, 0, 0, 0, '订单结算', '19', '2017-11-22 01:53:56', '0.38', '0.1', '536898042608', '狗狗猫咪毛毯狗窝狗垫毯子冬天被子猫用泰迪保暖宠物用品四季通用', '1', '19', '华元宠物用品专营店', '2017-11-18 14:01:22', '95691240621952681', NULL, 0, NULL),
(56, 0, 0, 0, '订单结算', '44.8', '2017-11-22 01:53:56', '0.9', '0.22', '15221146230', '狗狗沐浴露雪貂泰迪金毛萨摩耶专用杀菌除臭猫洗澡液香波宠物用品', '1', '96', '华元宠物用品专营店', '2017-11-18 14:01:22', '95691240621952681', NULL, 0, NULL),
(57, 0, 0, 0, '订单结算', '145.61', '2017-11-18 20:23:01', '2.18', '0.73', '545907561297', 'K9黄金美毛海藻粉升级配方 宠物狗护肤增色亮黑鼻头泰迪法牛金毛', '1', '230', 'k9superhealth旗舰', '2017-11-16 13:07:12', '88570690185081760', NULL, 0, NULL),
(58, 0, 0, 0, '订单结算', '82.39', '2017-11-18 20:23:01', '1.24', '0.41', '545994252572', 'K9活性益生菌整肠除口臭配方 宠物狗调理肠胃助消化改善拉稀软便', '1', '130', 'k9superhealth旗舰', '2017-11-16 13:07:12', '88570690185081760', NULL, 0, NULL),
(59, 0, 0, 0, '订单结算', '94', '2017-11-18 20:23:19', '1.41', '0.47', '546026895208', 'K9宠物羊奶粉 进口奶源低敏 宠物幼犬狗猫通用 替代母乳增强免疫', '1', '150', 'k9superhealth旗舰', '2017-11-16 13:06:45', '88452669108081760', NULL, 0, NULL),
(60, 0, 0, 0, '订单结算', '68', '2017-11-20 08:49:25', '1.36', '0.34', '546727820934', '一纸花约松露抹茶零食巧克力礼盒装送女友情人节礼物（代可可脂）', '1', '208', '一纸花约旗舰店', '2017-11-16 11:47:30', '88610535801386514', NULL, 0, NULL),
(61, 0, 0, 0, '订单结算', '68', '2017-11-20 12:28:14', '1.36', '0.34', '546727820934', '一纸花约松露抹茶零食巧克力礼盒装送女友情人节礼物（代可可脂）', '1', '208', '一纸花约旗舰店', '2017-11-16 10:35:42', '88424976733907060', NULL, 0, NULL),
(62, 0, 0, 0, '订单结算', '79.9', '2017-11-30 10:59:27', '23.97', '0.4', '35690502177', '泰迪博美狗窝猫咪窝小狗房子宠物窝可拆洗可拆卸别墅四季狗屋猫窝', '1', '339', '麦德豪宠物用品旗舰店', '2017-11-15 09:22:22', '87902163831081760', NULL, 0, NULL),
(63, 0, 0, 0, '订单结算', '111.57', '2017-11-18 13:44:42', '5.58', '0', '559496430611', '狗围栏泰迪小型犬中型犬金毛大型犬狗狗笼子小狗栅栏兔子宠物围栏', '1', '118', '宠而美宠物用品生活馆', '2017-11-15 09:01:38', '95009947841952681', NULL, 0, NULL),
(64, 0, 0, 0, '订单结算', '9.36', '2017-11-18 13:44:42', '0.47', '0', '558551415979', '狗梳子狗毛梳泰迪金毛小型犬针梳刷子猫咪梳子开结梳宠物狗狗用品', '1', '9.9', '宠而美宠物用品生活馆', '2017-11-15 09:01:38', '95009947841952681', NULL, 0, NULL),
(65, 0, 0, 0, '订单结算', '14.61', '2017-11-18 12:41:11', '0.73', '0', '18834789147', '狗狗牵引绳一体训狗绳泰迪金毛小中大型犬p链狗链尼龙绳加粗用品', '1', '29', '环球宝贝宠物店', '2017-11-14 23:26:35', '95036209698952681', NULL, 0, NULL),
(66, 0, 0, 0, '订单结算', '4.81', '2017-11-18 12:41:11', '0.24', '0', '550404176579', '宠物狗狗玩具耐咬磨牙发声尖叫惨叫鸡泰迪金毛咬绳飞盘训练狗用品', '1', '4.9', '环球宝贝宠物店', '2017-11-14 23:26:35', '95036209698952681', NULL, 0, NULL),
(67, 0, 0, 0, '订单结算', '4.41', '2017-11-18 12:41:11', '0.22', '0', '550487779000', '宠物狗狗玩具铃铛球天然橡胶安全无毒铃铛弹力球泰迪金毛发声玩具', '1', '4.5', '环球宝贝宠物店', '2017-11-14 23:26:35', '95036209698952681', NULL, 0, NULL),
(68, 0, 0, 0, '订单结算', '4.81', '2017-11-18 12:41:11', '0.24', '0', '550404176579', '宠物狗狗玩具耐咬磨牙发声尖叫惨叫鸡泰迪金毛咬绳飞盘训练狗用品', '1', '4.9', '环球宝贝宠物店', '2017-11-14 23:26:35', '95036209698952681', NULL, 0, NULL),
(69, 0, 0, 0, '订单结算', '86.4', '2017-11-17 19:53:54', '1.3', '0', '552879084275', '北欧led护眼立式钓鱼遥控落地灯创意客厅书房卧室床头喂奶台灯', '1', '216', '浩丞灯饰', '2017-11-14 23:10:33', '87799039551784630', NULL, 0, NULL),
(70, 0, 0, 0, '订单结算', '21.37', '2017-11-18 12:41:22', '0.32', '0', '543207816838', '宠物尿垫100片包邮狗尿片猫狗尿不湿狗尿垫宠物尿片兔尿片狗尿布', '1', '21.8', '狗博士宠物之家', '2017-11-14 23:04:33', '94977607696952681', NULL, 0, NULL),
(71, 0, 0, 0, '订单结算', '29', '2017-11-17 22:06:59', '0.87', '0.15', '537566265542', '爱丽丝狗狗厕所便便器狗便盆尿尿盆小狗小型犬大小号泰迪拉屎用品', '1', '159', '怡宠宠物用品专营店', '2017-11-14 23:03:07', '95075130930952681', NULL, 0, NULL),
(72, 0, 0, 0, '订单结算', '141', '2017-11-21 12:30:14', '8.46', '0.71', '38608562104', '皇家小型幼犬狗粮MIJ31 0.8KG*3 博美狗茶杯腊肠犬 28省包邮', '1', '171', '皇家宠物食品旗舰店', '2017-11-14 23:00:08', '95077762033952681', NULL, 0, NULL),
(73, 0, 0, 0, '订单结算', '29', '2017-11-17 17:35:23', '0.87', '0.15', '537566265542', '爱丽丝狗狗厕所便便器狗便盆尿尿盆小狗小型犬大小号泰迪拉屎用品', '1', '159', '怡宠宠物用品专营店', '2017-11-14 22:56:09', '87579489677081760', NULL, 0, NULL),
(74, 0, 0, 0, '订单结算', '64.1', '2017-11-18 20:23:42', '0.96', '0', '543207816838', '宠物尿垫100片包邮狗尿片猫狗尿不湿狗尿垫宠物尿片兔尿片狗尿布', '3', '21.8', '狗博士宠物之家', '2017-11-14 22:56:09', '87579489681081760', NULL, 0, NULL),
(75, 0, 0, 0, '订单结算', '139', '2017-11-26 16:09:54', '2.09', '0.42', '521826135548', '苏泊尔电锅韩式多功能家用电火火锅电热锅宿舍学生锅电煮锅不粘锅', '1', '529', 'supor苏泊尔兆洪专卖店', '2017-11-12 17:49:34', '91594188854191855', NULL, 0, NULL),
(76, 0, 0, 0, '订单结算', '49.9', '2017-11-15 00:19:46', '0.75', '0.25', '558522622317', '加量装清风原木纯品3层120抽中规30包抽取面纸巾整箱', '1', '127.9', '天猫超市', '2017-11-11 22:38:09', '86062813472784630', NULL, 0, NULL),
(77, 0, 0, 0, '订单结算', '249', '2017-11-18 10:39:28', '62.25', '0.75', '549175385097', '【双11狂欢价】Dibea/地贝无线吸尘器家用车载强力手持式小型静音大功率LW-200', '1', '629', 'dibea地贝祺骏专卖店', '2017-11-11 21:22:51', '90629677658081760', NULL, 0, NULL),
(78, 0, 0, 0, '订单结算', '99', '2017-11-28 04:39:17', '2.97', '0.5', '546838344135', '卓诗尼2017夏季新款坡跟碎花凉鞋高跟一字扣带休闲女鞋144713712', '1', '369', 'josiny卓诗尼淘淘专卖店', '2017-11-11 14:36:27', '92528164352793274', NULL, 0, NULL),
(79, 0, 0, 0, '订单结算', '38.43', '2017-11-19 15:34:12', '1.15', '0.38', '543934122915', '【双11狂欢价】【双11】安美四色散粉定妆粉蜜粉控油持久遮瑕防水修容四宫格正品', '1', '99', 'amy安美化妆品旗舰店', '2017-11-11 11:53:59', '89523088350868747', NULL, 0, NULL),
(80, 0, 0, 0, '订单结算', '39.3', '2017-11-19 15:34:27', '1.18', '0.39', '13704110999', '【双11狂欢价】【双11】土家硒泥坊绿豆泥浆面膜保湿深层清洁控油去黑头收缩毛孔', '1', '109', '土家硒泥坊旗舰店', '2017-11-11 11:53:59', '89523088354868747', NULL, 0, NULL),
(81, 0, 0, 0, '订单结算', '103.29', '2017-11-19 15:34:37', '4.13', '1.03', '539339147058', '【双11狂欢价】[双11]自然堂喜马拉雅面膜21片清洁保湿收毛孔紧致补水面膜女正品', '2', '204', '自然堂旗舰店', '2017-11-11 11:53:59', '89523088355868747', NULL, 0, NULL),
(82, 0, 0, 0, '订单结算', '125.98', '2017-12-05 16:42:21', '6.3', '0', '560356080276', '林珊珊 2017秋冬新款韩版宽松套头打底衫高领加厚情侣毛衣外套女', '1', '179', '林珊珊 Sunny33小超人', '2017-11-11 09:37:49', '84792817345199021', NULL, 0, NULL),
(83, 0, 0, 0, '订单结算', '158', '2017-11-16 07:07:53', '31.6', '0.79', '522747329360', '【双11狂欢价】西服套装男士秋季修身商务正装职业西装三件套新郎伴郎服结婚礼服', '1', '899', '潮男衣柜服饰专营店', '2017-11-11 09:31:33', '91726776188952681', NULL, 0, NULL),
(84, 0, 0, 0, '订单结算', '35.6', '2017-11-16 17:19:52', '3.56', '0.18', '557492630781', '【双11狂欢价】车载手机支架创意多功能车内通用汽车导航车上出风口卡扣式支撑座', '1', '78', '先马车品专营店', '2017-11-11 01:43:26', '90955437435296788', NULL, 0, NULL),
(85, 0, 0, 0, '订单结算', '47.4', '2017-11-19 03:08:30', '0.71', '0.24', '524859421424', '【双11狂欢价】良品铺子零食大礼包组合一整箱好吃的混合装吃货膨化食品小吃批发', '1', '108', '良品铺子旗舰店', '2017-11-11 01:31:37', '83970956208784630', NULL, 0, NULL),
(86, 0, 0, 0, '订单结算', '47.4', '2017-11-19 03:08:30', '0.71', '0.24', '539154561492', '【双11狂欢价】良品铺子辣味零食大礼包组合卤味肉类鸭脖鸭舌麻辣味整箱混装小吃', '1', '129', '良品铺子旗舰店', '2017-11-11 01:31:37', '83970956208784630', NULL, 0, NULL),
(87, 0, 0, 0, '订单结算', '35.8', '2017-11-17 01:50:37', '10.92', '0.18', '536094999307', '【双11狂欢价】南极人暖足贴保暖暖脚贴暖贴自发热鞋垫贴100片关节膝盖贴宝宝贴', '1', '149', '南极人法斯特专卖店', '2017-11-11 01:26:19', '83889255470784630', NULL, 0, NULL),
(88, 0, 0, 0, '订单结算', '36', '2017-11-15 22:02:26', '3.6', '0.18', '40994417517', '生活良品橄榄精油保湿弹力素250ml 定型专用正品持久护发卷发造型', '2', '29.9', '生活良品旗舰店', '2017-11-11 01:24:55', '90434608868297586', NULL, 0, NULL),
(89, 0, 0, 0, '订单结算', '37', '2017-11-13 01:27:13', '1.11', '0.37', '37659730958', '墨西哥原装进口 Corona/科罗娜啤酒 330ml*6瓶 整箱', '1', '94', '天猫超市', '2017-11-11 01:24:33', '83562492734784630', NULL, 0, NULL),
(90, 0, 0, 0, '订单结算', '39', '2017-11-13 01:27:13', '1.17', '0.39', '35649750981', '西班牙进口红酒爱之湾桃红起泡酒甜气泡葡萄酒750ml', '1', '210', '天猫超市', '2017-11-11 01:24:32', '83562492734784630', NULL, 0, NULL),
(91, 0, 0, 0, '订单结算', '49.81', '2017-11-12 21:27:02', '2.49', '0', '537544065273', '加绒打底裤外穿薄绒九分裤小脚裤铅笔裤黑色裤子女秋季加厚长裤', '1', '199', '7小天', '2017-11-11 01:23:55', '87900517923081760', NULL, 0, NULL),
(92, 0, 0, 0, '订单结算', '43.47', '2017-11-12 21:59:21', '0.65', '0', '530391295323', '拜耳药粉宠物狗狗杀除跳蚤去虱子驱虫防蚊虫项圈防皮肤病脖圈颈圈', '1', '96', 'hello帽 宠物用品城', '2017-11-11 01:22:28', '87900517921081760', NULL, 0, NULL),
(93, 0, 0, 0, '订单结算', '96.75', '2017-11-14 10:17:34', '1.45', '0', '543207816838', '宠物尿垫100片包邮狗尿片猫狗尿不湿狗尿垫宠物尿片兔尿片狗尿布', '5', '22.8', '狗博士宠物之家', '2017-11-11 01:22:23', '87900517922081760', NULL, 0, NULL),
(94, 0, 0, 0, '订单结算', '47.24', '2017-11-18 20:23:56', '0.71', '0.24', '560618507139', '【双11狂欢价】2017冬季低帮雪地靴男加绒保暖男士靴子防水防滑棉鞋男学生棉短靴', '1', '236', '爵朗夫旗舰店', '2017-11-11 01:21:53', '87850564437081760', NULL, 0, NULL),
(95, 0, 0, 0, '订单结算', '38.47', '2017-11-18 20:23:56', '3.85', '0.19', '558811578280', '【双11狂欢价】2017冬季长毛绒豆豆鞋男加绒保暖鞋子男韩版潮流百搭休闲男生棉鞋', '1', '176', '爵朗夫旗舰店', '2017-11-11 01:21:53', '87850564437081760', NULL, 0, NULL),
(96, 0, 0, 0, '订单结算', '25.41', '2017-11-12 12:40:30', '4.57', '0.13', '553601477429', '【双11狂欢价】浪莎春秋季中厚款丝袜连裤袜女防勾丝天鹅绒打底黑色肉色显瘦腿袜', '1', '76', '浪莎高事达专卖店', '2017-11-11 01:21:53', '87850564440081760', NULL, 0, NULL),
(97, 0, 0, 0, '订单结算', '92.01', '2017-11-16 10:21:04', '2.76', '0.92', '13903451152', '【双11狂欢价】美宝莲紫胖子密扇睫毛膏 防水纤长浓密不易晕染卷翘持久定型正品', '1', '109', '美宝莲旗舰店', '2017-11-11 01:21:53', '87850564443081760', NULL, 0, NULL),
(98, 0, 0, 0, '订单结算', '85.96', '2017-11-12 12:41:12', '18.05', '0.43', '526085566037', '【双11狂欢价】2017秋冬季新款加厚加绒宽松卫衣女装套头学生中长款bf韩版外套潮', '1', '218', 'jcoolstory旗舰店', '2017-11-11 01:21:53', '87850564446081760', NULL, 0, NULL),
(99, 0, 0, 0, '订单结算', '433.76', '2017-11-12 12:40:43', '26.03', '2.17', '529066909319', '【双11狂欢价】皇家狗粮 中型犬幼犬粮MEJ32 4KG*4萨摩耶哈士奇柯基狗粮', '1', '956', '皇家宠物食品旗舰店', '2017-11-11 01:21:52', '87850564441081760', NULL, 0, NULL),
(100, 0, 0, 0, '订单结算', '85.44', '2017-11-15 17:01:24', '2.56', '0.85', '555905357154', '【双11狂欢价】【双11聚】ETUDEHOUSE伊蒂之屋101双头修容棒高光笔鼻影PONY同款', '2', '98', 'ETUDE HOUSE伊蒂之屋官方旗舰店', '2017-11-11 01:21:52', '87850564444081760', NULL, 0, NULL),
(101, 0, 0, 0, '订单结算', '49.9', '2017-11-13 01:27:33', '0.75', '0.25', '558522622317', '加量装清风原木纯品3层120抽中规30包抽取面纸巾整箱', '1', '127.9', '天猫超市', '2017-11-11 01:18:57', '83490310045784630', NULL, 0, NULL),
(102, 0, 0, 0, '订单结算', '264', '2017-12-05 09:27:27', '13.2', '0', '560746890290', 'BANGBOY 自制冬款麂皮绒长款棕黄色大牌感腰带毛呢大衣韩版男外套', '1', '999', 'BANGBOY X IZTION', '2017-11-11 01:13:24', '83217506044784630', NULL, 0, NULL),
(103, 0, 0, 0, '订单结算', '105.04', '2017-11-14 10:18:13', '5.25', '0.53', '556447850508', '【双11狂欢价】唐狮2017秋冬新款毛衣男圆领韩版复古休闲提花图案套头毛衫针织衫', '1', '369', '唐狮官方旗舰店', '2017-11-11 01:08:09', '87592351292081760', NULL, 0, NULL),
(104, 0, 0, 0, '订单结算', '14.82', '2017-11-30 09:31:37', '2.22', '0.15', '559974405743', '【双11狂欢价】三个装！送收纳架子葫芦水滴美妆蛋海绵粉扑彩妆化妆工具气垫rt', '1', '49.9', '丽亚斯旗舰店', '2017-11-11 01:07:34', '83191807046263610', NULL, 0, NULL),
(105, 0, 0, 0, '订单结算', '333.25', '2017-11-23 21:51:38', '6.67', '1.67', '522564716142', '【双11狂欢价】镁多力伸缩梯子人字梯铝合金加厚折叠梯家用多功能升降梯工程楼梯', '1', '2098', 'midoli旗舰店', '2017-11-11 01:05:29', '83191807044263610', NULL, 0, NULL),
(106, 0, 0, 0, '订单结算', '8.33', '2017-11-29 10:38:49', '1.25', '0.08', '522981802843', '【双11狂欢价】美丽工匠 化妆棉卸妆棉脸部双面双效纯棉软洗脸厚款补水化妆工具', '1', '25.9', '美丽工匠化妆品旗舰店', '2017-11-11 01:05:23', '83191807045263610', NULL, 0, NULL),
(107, 0, 0, 0, '订单结算', '279', '2017-11-27 09:36:23', '4.19', '0.84', '538661026488', '【双11狂欢价】飞利浦电动牙刷头6支装HX6016适用于HX6721/HX6730/HX3216等型号', '1', '379', '飞利浦官方旗舰店', '2017-11-11 00:54:59', '89671272988297586', NULL, 0, NULL),
(108, 0, 0, 0, '订单结算', '101', '2017-11-14 12:33:57', '15.15', '0', '556114298917', '西西里男装 吴亦凡同款牛仔裤男小脚黑色裤子男韩版潮流九分裤男', '1', '999', '西西里男装 CHIC ERRO', '2017-11-11 00:52:52', '82801150024199021', NULL, 0, NULL),
(109, 0, 0, 0, '订单结算', '83', '2017-11-13 19:15:13', '16.6', '0', '558576129425', '大赖自制秋冬新款高领毛衣男韩版外穿针织衫小清新百搭长袖毛线衣', '1', '288', '大赖 studios', '2017-11-11 00:52:47', '82801150025199021', NULL, 0, NULL),
(110, 0, 0, 0, '订单结算', '308', '2017-11-16 09:10:50', '30.8', '1.54', '557369504333', '【双11狂欢价】大毛领轻薄羽绒服女短款2017冬装新款潮韩版修身显瘦学生冬季外套', '1', '699', '侨西尼旗舰店', '2017-11-11 00:52:44', '82836599291386514', NULL, 0, NULL),
(111, 0, 0, 0, '订单结算', '41.87', '2017-11-16 09:11:00', '0.84', '0', '558761097353', '小米MIX2原装快速充电器高通QC3.0快充小米NOTE3红米PRO充电头', '1', '79', '扬帆精品数码', '2017-11-11 00:52:41', '82836599293386514', NULL, 0, NULL),
(112, 0, 0, 0, '订单结算', '62.8', '2017-11-13 09:09:21', '0.94', '0.31', '41122330248', '【双11狂欢价】遇见香芬COCO香水洗发水护发素沐浴露三件套装持久留香男女家庭装', '1', '444', 'cocoessence旗舰店', '2017-11-11 00:52:35', '82836599292386514', NULL, 0, NULL),
(113, 0, 0, 0, '订单结算', '25.82', '2017-11-26 23:45:56', '0.39', '0.13', '37062325253', '【特价秒杀】B365果蔬酵素粉10g*5袋 综合复合 水果酵素 红糖姜茶', '1', '78', 'b365旗舰店', '2017-11-11 00:51:10', '82782726205263610', NULL, 0, NULL),
(114, 0, 0, 0, '订单结算', '417.08', '2017-11-26 23:45:56', '41.71', '2.09', '14303032737', '【双11狂欢价】【官方直营】B365果蔬酵素粉enzyme非果冻综合水果孝素粉b365酵素', '7', '198', 'b365旗舰店', '2017-11-11 00:51:10', '82782726205263610', NULL, 0, NULL),
(115, 0, 0, 0, '订单结算', '61.36', '2017-11-21 10:51:55', '0.92', '0.31', '558382982629', '【双11狂欢价】【直营】韩国进口 爱茉莉美妆仙护发精油 韩国人手一件*2瓶', '1', '118', '天猫国际官方直营', '2017-11-11 00:48:36', '89548297162297586', NULL, 0, NULL),
(116, 0, 0, 0, '订单结算', '388', '2017-11-18 20:52:34', '19.4', '1.94', '560602471834', '塞尔伯恩中老年羽绒服男士中长款加厚中年男装毛领爸爸装冬装外套', '1', '1580', '塞尔伯恩旗舰店', '2017-11-11 00:47:36', '82597196433386514', NULL, 0, NULL),
(117, 0, 0, 0, '订单结算', '118', '2017-11-16 09:11:24', '37.76', '0.59', '557647894772', '【双11狂欢价】妈妈靴子女冬季中筒靴加绒保暖粗跟中跟防滑马丁靴皮棉鞋中年女靴', '1', '278', '母泰旗舰店', '2017-11-11 00:47:32', '82597196434386514', NULL, 0, NULL),
(118, 0, 0, 0, '订单结算', '24.79', '2017-11-14 12:40:36', '1.24', '0.12', '540462162389', '【双11狂欢价】薄暮花冬季棉拖鞋女包跟月子鞋室内保暖厚底可爱韩版加绒情侣棉拖', '1', '108', '薄暮花旗舰店', '2017-11-11 00:45:26', '87189626908899946', NULL, 0, NULL),
(119, 0, 0, 0, '订单结算', '27.59', '2017-11-14 12:40:36', '1.38', '0.14', '556974030983', '【双11狂欢价】棉拖鞋女厚底冬季韩版可爱保暖月子鞋室内防滑软底情侣家居拖鞋', '1', '98', '薄暮花旗舰店', '2017-11-11 00:45:26', '87189626908899946', NULL, 0, NULL),
(120, 0, 0, 0, '订单结算', '124.56', '2017-11-15 20:54:50', '9.96', '0.62', '557146710260', '【双11狂欢价】热风2017冬新款学院风淑女饰扣雪地靴加绒女士平底短靴H89W7405', '1', '249', '热风旗舰店', '2017-11-11 00:45:20', '87189626912899946', NULL, 0, NULL),
(121, 0, 0, 0, '订单结算', '232.11', '2017-11-15 20:54:50', '18.57', '1.16', '557334318974', '【双11狂欢价】热风2017冬新款潮流时尚橡筋女士粗跟休闲鞋圆头短筒短靴H82W7409', '1', '449', '热风旗舰店', '2017-11-11 00:45:20', '87189626912899946', NULL, 0, NULL),
(122, 0, 0, 0, '订单结算', '107.95', '2017-11-26 01:00:32', '6.48', '0.54', '538874017620', '【双11狂欢价】夏季新品女装中长款吊带裙无袖雪纺连衣裙波西米亚海边度假沙滩裙', '1', '257', '西子美丽心情旗舰店', '2017-11-11 00:45:18', '89502402396793274', NULL, 0, NULL),
(123, 0, 0, 0, '订单结算', '125.94', '2017-11-26 13:00:56', '3.78', '0.63', '559825849115', '【双11狂欢价】小红人磨砂皮短靴女秋冬2017新款粗跟马丁靴女英伦风女鞋高跟靴子', '1', '288', '小红人旗舰店', '2017-11-11 00:45:18', '89502402402793274', NULL, 0, NULL),
(124, 0, 0, 0, '订单结算', '178.01', '2017-11-26 11:56:28', '35.6', '0.89', '560081915992', '【双11狂欢价】小个子毛呢外套女韩版2017秋冬中长款新款修身加厚短款矮呢子大衣', '1', '319', '雅丽岚旗舰店', '2017-11-11 00:45:14', '89502402401793274', NULL, 0, NULL),
(125, 0, 0, 0, '订单结算', '24.37', '2017-11-13 11:38:06', '1.22', '0', '22060331325', '正品暖贴宝宝贴自发热宫暖贴暖身贴热帖足贴保暖贴包邮100片全身', '1', '57.6', 'E时尚百货一温暖售卖', '2017-11-11 00:42:02', '87134298184899946', NULL, 0, NULL),
(126, 0, 0, 0, '订单结算', '27.58', '2017-11-13 11:37:43', '2.76', '0', '557607251885', '全自动雨伞男女折叠加固防风太阳伞自开收晴雨两用防晒黑胶遮阳伞', '1', '188', '惟夕', '2017-11-11 00:41:50', '87134298185899946', NULL, 0, NULL),
(127, 0, 0, 0, '订单结算', '203.84', '2017-11-13 19:02:57', '40.97', '0', '537453365578', '2017秋冬新款韩版休闲风衣毛呢外套男宽松中长款学生翻领男士大衣', '1', '608', '韩宜嘉男装', '2017-11-11 00:39:53', '82467781474199021', NULL, 0, NULL),
(128, 0, 0, 0, '订单结算', '165.91', '2017-11-20 19:49:08', '8.3', '0.83', '559652868421', '【双11狂欢价】毛呢大衣女学生中长款韩国2017新款秋冬宽松焦糖色矮小个子呢外套', '1', '398', '戴乐思旗舰店', '2017-11-11 00:38:04', '89319171151267166', NULL, 0, NULL),
(129, 0, 0, 0, '订单结算', '95', '2017-11-30 02:42:17', '2.85', '0.95', '18616903560', '【双11狂欢价】美宝莲飞箭睫毛膏防水纤长卷翘浓密不结块不晕染持久防水官方正品', '1', '109', '美宝莲旗舰店', '2017-11-11 00:35:31', '82453248344263610', NULL, 0, NULL),
(130, 0, 0, 0, '订单结算', '89', '2017-11-30 02:42:17', '2.67', '0.89', '522647007234', '【双11狂欢价】美宝莲绝色持久丝绒雾感唇釉唇膏唇彩 口红滋润持久保湿M500 M400', '1', '99', '美宝莲旗舰店', '2017-11-11 00:35:31', '82453248344263610', NULL, 0, NULL),
(131, 0, 0, 0, '订单结算', '59', '2017-11-30 02:42:17', '1.77', '0.59', '546686906286', '【双11狂欢价】美宝莲 双头三角眉笔眉粉防水防汗防晕染持久多用初学者染眉膏', '1', '89', '美宝莲旗舰店', '2017-11-11 00:35:31', '82453248344263610', NULL, 0, NULL),
(132, 0, 0, 0, '订单结算', '53', '2017-11-30 02:42:17', '1.59', '0.53', '12727688676', '【双11狂欢价】美宝莲眼唇卸妆液 脸部眼部及唇部卸妆油卸妆水温和无刺激清洁', '1', '59', '美宝莲旗舰店', '2017-11-11 00:35:31', '82453248344263610', NULL, 0, NULL),
(133, 0, 0, 0, '订单结算', '77', '2017-11-15 06:26:49', '3.85', '0.39', '558657687001', '【双11狂欢价】乐扣乐扣 圈圈保温杯 运动便携时尚水杯可拎不锈钢男女 LHC4153/4', '1', '158', '乐扣乐扣旗舰店', '2017-11-11 00:13:18', '88933303536952681', NULL, 0, NULL),
(134, 0, 0, 0, '订单结算', '116', '2017-11-12 19:23:20', '5.8', '0.58', '525650887454', '【双11狂欢价】乐扣乐扣 娜姆马克保温杯 时尚简约情侣男女黑白红 500ml LHC4125', '1', '258', '乐扣乐扣旗舰店', '2017-11-11 00:12:06', '88922187122952681', NULL, 0, NULL),
(135, 0, 0, 0, '订单结算', '56', '2017-11-14 06:44:19', '2.8', '0.28', '41384025967', '【双11狂欢价】乐扣乐扣 缤纷马克杯保温杯 时尚水杯便携男女 390ml LHC4021', '1', '125', '乐扣乐扣旗舰店', '2017-11-11 00:10:24', '88906225593952681', NULL, 0, NULL),
(136, 0, 0, 0, '订单结算', '14.8', '2017-11-20 17:42:11', '4.45', '0.07', '558031483936', '0-6-12个月婴儿鞋子软底学步冬季宝宝棉鞋1岁男女新生幼儿雪地靴', '1', '69', '波特豆旗舰店', '2017-11-10 21:20:32', '88760657559766089', NULL, 0, NULL),
(137, 0, 0, 0, '订单结算', '20', '2017-11-28 18:28:01', '47.7', '1.59', '546740418664', '【双11预售】美宝莲超然无瑕轻垫霜黑金气垫bb霜巨遮瑕轻薄裸妆', '1', '179', '美宝莲旗舰店', '2017-11-10 21:13:28', '81815409971263610', NULL, 0, NULL),
(138, 0, 0, 0, '订单结算', '13', '2017-11-16 21:36:47', '0.39', '0.07', '557539943165', '婴儿帽子秋冬0-3-6-12个月宝宝帽子1-2岁男女儿童帽子冬帽线帽', '1', '42', '悠铭母婴专营店', '2017-11-10 21:09:51', '88733637434766089', NULL, 0, NULL),
(139, 0, 0, 0, '订单结算', '29.01', '2017-11-11 19:02:06', '0.44', '0', '524630951876', '口罩一次性透气男女秋冬季时尚韩版可爱个性女神黑潮款批发50只装', '2', '29.15', '当当阁 时尚网购享当当', '2017-11-10 13:04:47', '86329662125081760', NULL, 0, NULL),
(140, 0, 0, 0, '订单结算', '26.9', '2017-11-15 00:21:51', '9.42', '0.08', '40111047312', '再也不用换电池 可充电无线鼠标 静音无声笔记本台式游戏苹果女生', '1', '69', '众乐乐数码专营店', '2017-11-09 15:43:21', '81327588463784630', NULL, 0, NULL),
(141, 0, 0, 0, '订单结算', '35.8', '2017-11-10 21:56:42', '0.57', '0', '550939007695', '特价2碗2盘2勺2筷家用套装 情侣2人清新碗盘勺筷组合餐具 可微波', '1', '71.6', '玲珑餐具', '2017-11-08 22:21:19', '85752189593081760', NULL, 0, NULL),
(142, 0, 0, 0, '订单结算', '32.86', '2017-11-10 21:59:46', '1.31', '0.16', '540421207446', '【2件5折】炊大皇全钢柄不锈钢切菜刀切肉刀砍骨刀切片刀多刀', '1', '69.9', '天猫超市', '2017-11-08 22:11:15', '85781927748081760', NULL, 0, NULL),
(143, 0, 0, 0, '订单结算', '55.84', '2017-11-10 21:59:46', '1.68', '0.28', '40659152717', '【日用百货】百富帝加厚保暖被子冬被 2米双人加厚保暖棉被 被褥', '1', '269', '天猫超市', '2017-11-08 22:11:15', '85781927748081760', NULL, 0, NULL),
(144, 0, 0, 0, '订单结算', '13.8', '2017-11-19 09:28:04', '4.14', '0.04', '546509871715', '玛尚可充电无线鼠标 静音无声电脑笔记本办公游戏男女生 无限鼠标', '1', '89', '巨途数码专营店', '2017-11-08 20:32:02', '85698401360907060', NULL, 0, NULL),
(145, 0, 0, 0, '订单结算', '30.99', '2017-11-12 21:59:01', '1.55', '0.15', '521422451240', '植护原木抽纸24包餐巾纸抽纸批发纸巾整箱家庭装卫生纸家用面巾纸', '1', '150', '植护旗舰店', '2017-11-08 15:18:18', '85597182568081760', NULL, 0, NULL),
(146, 0, 0, 0, '订单结算', '5.9', '2017-11-10 08:54:44', '0.09', '0.03', '41385219786', '【买2包邮】挤酱瓶挤压瓶酱汁樽挤瓶沙拉番茄酱瓶寿司挤酱瓶油壶', '1', '10.8', '谷色食品专营店', '2017-11-08 15:11:34', '85593514648081760', NULL, 0, NULL),
(147, 0, 0, 0, '订单结算', '5.9', '2017-11-10 08:54:44', '0.09', '0.03', '41385219786', '【买2包邮】挤酱瓶挤压瓶酱汁樽挤瓶沙拉番茄酱瓶寿司挤酱瓶油壶', '1', '10.8', '谷色食品专营店', '2017-11-08 15:11:34', '85593514648081760', NULL, 0, NULL),
(148, 0, 0, 0, '订单结算', '13.6', '2017-11-10 08:54:44', '0.2', '0.07', '36636107471', '寿司工具套装全套材料食材紫菜包饭套餐酸萝卜条大根条金大根400g', '2', '7.8', '谷色食品专营店', '2017-11-08 15:11:34', '85593514648081760', NULL, 0, NULL),
(149, 0, 0, 0, '订单结算', '16.8', '2017-11-10 22:29:57', '2.54', '0', '552735157264', '陶瓷小花瓶小清新水培花器玻璃透明客厅插花现代干花家居装饰摆件', '1', '33.6', '曦尚工厂店', '2017-11-08 12:51:23', '80914035398386514', NULL, 0, NULL),
(150, 0, 0, 0, '订单结算', '14.9', '2017-11-13 01:27:24', '4.5', '0.04', '535386917387', 'AA充电电池充电器套装 通用5号7号共8节 电池可充遥控玩具鼠标ktv', '1', '46', '百乐士数码专营店', '2017-11-07 21:46:20', '80538997548784630', NULL, 0, NULL),
(151, 0, 0, 0, '订单结算', '6.9', '2017-11-08 22:31:23', '0.1', '0.03', '12424933809', '黑人牙膏透心爽柠檬120g去牙菌斑护牙龈防蛀清新口气', '1', '22', '天猫超市', '2017-11-03 21:20:18', '83477554324081760', NULL, 0, NULL),
(152, 0, 0, 0, '订单结算', '9.91', '2017-11-08 22:31:23', '0.15', '0.05', '22250308893', '黑人牙刷炭丝深洁双支成人家用旅行套装细丝软毛洁净', '1', '21.5', '天猫超市', '2017-11-03 21:20:18', '83477554324081760', NULL, 0, NULL),
(153, 0, 0, 0, '订单结算', '7.9', '2017-11-08 22:31:23', '0.12', '0.04', '534465003021', '【天猫超市】顺清柔抽纸 橙A系列3层120抽3包软抽取式面巾纸巾', '1', '22.9', '天猫超市', '2017-11-03 21:20:18', '83477554324081760', NULL, 0, NULL),
(154, 0, 0, 0, '订单结算', '1', '2017-11-08 22:31:23', '0.02', '0.01', '560007635957', '【天猫超市】印尼进口Tango奥朗探戈乳酪威化夹心饼干52g零食品', '1', '19.9', '天猫超市', '2017-11-03 21:20:18', '83477554324081760', NULL, 0, NULL),
(155, 0, 0, 0, '订单结算', '9.9', '2017-11-08 22:31:23', '0.15', '0.05', '560072136297', '碧浪洗衣液 机洗超净 亮白去油污渍700g快洗无残留', '1', '19.9', '天猫超市', '2017-11-03 21:20:18', '83477554324081760', NULL, 0, NULL),
(156, 0, 0, 0, '订单结算', '23.8', '2017-11-08 22:31:23', '0.36', '0.12', '530400465447', '【天猫超市】纳美源生净白花香薄荷双重去渍小苏打牙膏120G', '1', '24.9', '天猫超市', '2017-11-03 21:20:18', '83477554324081760', NULL, 0, NULL),
(157, 0, 0, 0, '订单结算', '32.8', '2017-11-08 22:31:23', '0.49', '0.16', '18037078376', '汰渍洗衣粉 持久清洁净白去渍专用柠檬清新型5kg袋装', '1', '54.9', '天猫超市', '2017-11-03 21:20:18', '83477554324081760', NULL, 0, NULL),
(158, 0, 0, 0, '订单结算', '44.33', '2017-11-08 22:31:57', '7.09', '0', '36813419929', '乐巢加厚 可水洗 不掉色 丝毛地毯地垫客厅茶几卧室床边地毯', '1', '153', '乐巢地毯', '2017-11-03 20:48:49', '83422421410081760', NULL, 0, NULL),
(159, 0, 0, 0, '订单结算', '42.9', '2017-11-08 20:42:46', '2.15', '0', '520425651308', '天方香酥米方便面干吃面 香酥米零食 整箱30g*120包点心面碎碎面', '1', '49.9', '色彩生活馆', '2017-11-01 23:59:38', '82394453148907060', NULL, 0, NULL),
(160, 0, 0, 0, '订单结算', '34.24', '2018-01-10 11:35:28', '2.05', '0', '540453796133', '得牌实木家具修补膏1000g填缝剂木器缝隙填充膏地板裂缝修补腻子', '1', '49.9', '得牌水性腻子 汉研化工', '2018-01-05 23:26:06', '111223822952081760', NULL, 0, NULL),
(161, 0, 0, 0, '订单结算', '163.4', '2018-01-10 11:33:19', '14.71', '0.82', '35976777299', '波奇网宠物狗狗用品吸水垫宠物尿片除臭兔子尿垫狗尿不湿猫垫尿片', '6', '60', '波奇网旗舰店', '2018-01-05 23:11:54', '111221470542081760', NULL, 0, NULL),
(162, 0, 0, 0, '订单结算', '34.24', '2018-01-10 11:35:28', '2.05', '0', '540453796133', '得牌实木家具修补膏1000g填缝剂木器缝隙填充膏地板裂缝修补腻子', '1', '49.9', '得牌水性腻子 汉研化工', '2018-01-05 23:26:06', '111223822952081760', NULL, 0, NULL),
(163, 0, 0, 0, '订单结算', '163.4', '2018-01-10 11:33:19', '14.71', '0.82', '35976777299', '波奇网宠物狗狗用品吸水垫宠物尿片除臭兔子尿垫狗尿不湿猫垫尿片', '6', '60', '波奇网旗舰店', '2018-01-05 23:11:54', '111221470542081760', NULL, 0, NULL),
(164, 0, 0, 0, '订单结算', '37.9', '2018-01-10 11:35:15', '0.57', '0', '36562841817', '电动车挡风被冬季加绒加厚加大电瓶车摩托车挡风罩护膝电车保暖冬', '1', '180', '暖途旗舰店', '2018-01-03 20:40:13', '110309789693081760', NULL, 0, NULL),
(165, 0, 0, 0, '订单结算', '129', '2018-01-10 11:34:30', '3.23', '1.29', '561465578745', '虾鲜活海鲜水产活虾青岛大虾鲜活超大基围虾冻虾新鲜海虾青虾4斤', '1', '179', '缤鲜旗舰店', '2018-01-03 16:55:58', '110156967027081760', NULL, 0, NULL),
(166, 0, 0, 0, '订单结算', '121', '2018-01-10 11:35:00', '14.64', '0.61', '551759596621', '尾戒女日韩简约925纯银戒指个性礼物刻字莫比乌斯食指环情侣对戒', '1', '218', '初典饰品旗舰店', '2017-12-31 13:06:14', '108886968733081760', NULL, 0, NULL),
(167, 0, 0, 0, '订单结算', '26.8', '2018-01-05 17:38:05', '0.4', '0.13', '545985626295', '车载手机支架出风口吸盘卡扣式磁性汽车内用导航多功能通用支撑架', '1', '120', '飙韵邦容专卖店', '2017-12-26 14:21:27', '101658425752784630', NULL, 0, NULL),
(168, 0, 0, 0, '订单结算', '23.8', '2018-01-05 16:52:51', '1.19', '0.12', '563258207437', 'PU皮裤女2017新款高腰秋冬季外穿加绒加厚保暖小脚裤修身打底裤子', '1', '89', '久蕾旗舰店', '2017-12-26 14:09:56', '107012763532907060', NULL, 0, NULL),
(169, 0, 0, 0, '订单结算', '69', '2018-01-05 15:35:53', '4.49', '0', '558172952313', '中年休闲裤男士加绒加厚款秋冬季中老年人宽松爸爸西裤子40-50岁', '2', '218', '古月传说店', '2017-12-26 14:06:30', '107012287261907060', NULL, 0, NULL),
(170, 0, 0, 0, '订单结算', '413.98', '2018-01-05 13:32:29', '43.47', '2.07', '45761058363', '蓝豚宠物吹水机宠物专用狗狗吹风机大功率静音大小型犬吹毛机臭氧', '1', '780', '蓝豚旗舰店', '2017-12-26 11:28:48', '107018529020081760', NULL, 0, NULL),
(171, 0, 0, 0, '订单结算', '17.02', '2018-01-05 13:32:31', '3.4', '0.09', '551087481869', '蓝豚狗狗沐浴露泰迪金毛萨摩耶宠物用品猫咪幼犬洗澡香波杀菌除臭', '1', '49', '蓝豚旗舰店', '2017-12-26 11:28:48', '107018529020081760', NULL, 0, NULL),
(172, 0, 0, 0, '订单结算', '9.71', '2017-12-29 13:19:29', '0.49', '0', '556784067834', '后跟贴防磨脚神器半码垫不跟脚后跟帖防掉加厚鞋贴高跟鞋垫鞋跟贴', '1', '9.9', '蓝韵家', '2017-12-26 10:22:43', '115948920258386514', NULL, 0, NULL),
(173, 0, 0, 0, '订单结算', '25.2', '2017-12-27 08:12:53', '1.26', '0', '561765957330', '小米6耳机入耳式mix2原装正品note3手机专用六重低音type-c版降噪', '1', '76', '夏至未至 原创持续上新', '2017-12-25 13:16:15', '115703528626386514', NULL, 0, NULL),
(174, 0, 0, 0, '订单结算', '133', '2018-01-04 14:08:06', '6.65', '0', '557275692864', '中老年冬装男棉衣中长款加绒加厚棉服中年冬季外套爸爸装PU皮棉袄', '1', '309', '齐霸男装', '2017-12-25 12:31:41', '106665589540907060', 1516187104, 1, 11),
(175, 0, 0, 0, '订单结算', '20.9', '2018-01-03 16:37:39', '0.42', '0.1', '12844739262', '伊丽莎白圈 狗狗项圈狗头套猫项圈宠物狗脖套猫头套防咬圈狗用品', '1', '26.8', '迪曼宠物用品专营店', '2017-12-25 11:38:10', '106657216123081760', NULL, 0, NULL),
(176, 0, 0, 0, '订单结算', '40', '2018-01-03 16:37:41', '6', '0.2', '18783840336', '金盾皮特芬喷剂狗狗皮肤病真菌螨虫泰迪皮特分宠物除螨猫癣猫藓', '1', '59.8', '迪曼宠物用品专营店', '2017-12-25 11:38:10', '106657216123081760', NULL, 0, NULL),
(177, 0, 0, 0, '订单结算', '150', '2017-12-28 19:02:05', '22.5', '0', '560192080654', '2017秋冬季新款韩版甜美学生刺绣呢子大衣女中长款加厚毛呢外套潮', '1', '155', '艾米恋美衣', '2017-12-22 16:37:40', '105697910851687464', NULL, 0, NULL),
(178, 0, 0, 0, '订单结算', '58.41', '2017-12-31 13:17:36', '2.92', '0', '538015971104', '秋冬新款韩版简约半高圆领长袖套头毛衣宽松纯色针织衫打底衫女潮', '1', '59', 'TEMEET遇见 STUDIO', '2017-12-20 22:57:05', '105039208713687464', NULL, 0, NULL),
(179, 0, 0, 0, '订单结算', '64.35', '2017-12-31 13:17:38', '3.22', '0', '541615294579', '秋冬中长款针织裙纯色松紧腰高腰百褶裙显瘦大码A字半身裙', '1', '78', 'TEMEET遇见 STUDIO', '2017-12-20 22:57:05', '105039208713687464', NULL, 0, NULL),
(180, 0, 0, 0, '订单结算', '64.68', '2017-12-31 09:02:44', '3.88', '0', '522582189521', '黑色外穿一体踩脚打底裤秋冬款女士瘦腿加薄绒加厚中高腰弹力百搭', '1', '95', 'Fox zebra 独立设计', '2017-12-20 19:57:08', '104952773154081760', NULL, 0, NULL),
(181, 0, 0, 0, '订单结算', '55', '2017-12-24 00:08:03', '8.25', '0', '40296598435', '大人的科学LED四季投影星空灯12星座旋转满天星星灯圣诞生日礼物', '1', '98', '爱尚创意924', '2017-12-19 14:37:41', '99630666990784630', NULL, 0, NULL),
(182, 0, 0, 0, '订单结算', '14.5', '2017-12-21 08:08:23', '4.35', '0', '520347331442', '冬季一次性口罩印花女男透气防尘个性时尚可爱女神韩版黑色防雾霾', '1', '38', '向天歌口罩品牌店', '2017-12-19 11:47:42', '99484505102386514', NULL, 0, NULL),
(183, 0, 0, 0, '订单结算', '20.9', '2018-01-03 08:46:19', '0.31', '0.1', '549122106774', '狗链子 中型大型犬狗狗牵引绳金毛拉布拉多遛狗绳项圈P链狗狗用品', '1', '32.5', '疯狂的小狗旗舰店', '2017-12-18 20:38:47', '104037257598081760', NULL, 0, NULL),
(184, 0, 0, 0, '订单结算', '35.8', '2017-12-21 23:50:35', '10.74', '0.18', '558413427349', '圣诞节气球装饰幼儿园教室背景墙酒店商场店铺场景布置铝膜气球', '1', '39.8', '串串喜旗舰店', '2017-12-18 16:22:27', '99087996111784630', NULL, 0, NULL),
(185, 0, 0, 0, '订单结算', '123', '2017-12-20 00:40:32', '36.9', '0', '560680137316', '圣诞树1.8米圣诞节装饰品豪华加密圣诞树套餐1.5米装饰套装2.1米', '1', '347', '加福圣诞', '2017-12-18 16:08:47', '99080268293784630', NULL, 0, NULL),
(186, 0, 0, 0, '订单结算', '29.9', '2018-01-02 22:12:02', '7.48', '0', '560771052447', '圣诞节装饰品加密1.5米圣诞树套餐1.8米装饰树2.1米3米松针树套装', '1', '49.9', '凯乐圣诞用品', '2017-12-18 13:21:31', '103778791511774396', NULL, 0, NULL),
(187, 0, 0, 0, '订单结算', '279', '2017-12-23 14:42:06', '13.95', '1.4', '544437065296', 'CHARLES＆KEITH 马鞍包 CK2-80780293 欧美复古风单肩包斜挎包', '1', '369', 'Charles Keith官方旗舰店', '2017-12-16 13:03:47', '102834909244824093', NULL, 0, NULL),
(188, 0, 0, 0, '订单结算', '194.88', '2017-12-21 23:50:49', '2.92', '0', '531159294442', '星巴克桌椅复古吧台高脚椅高吧凳实木桌椅铁艺椅酒吧桌椅小圆桌方', '2', '170', '三居室铁艺家具', '2017-12-15 22:29:25', '97749459540784630', NULL, 0, NULL),
(189, 0, 0, 0, '订单结算', '46', '2017-12-23 21:41:05', '1.38', '0.23', '543621497527', '情侣戒指男 女一对925纯银日韩简约单身开口素圈活口食指刻字对戒', '1', '148', '欧莱帝饰品旗舰店', '2017-12-13 22:01:11', '101730786530952681', NULL, 0, NULL),
(190, 0, 0, 0, '订单结算', '49', '2017-12-18 21:33:23', '1.47', '0.25', '561545275951', '925银莫比乌斯情侣戒指玫瑰金食指素戒尾戒日韩简约一对男女对戒', '1', '138', '欧莱帝饰品旗舰店', '2017-12-13 21:59:41', '101683353894952681', NULL, 0, NULL),
(191, 0, 0, 0, '订单结算', '37.24', '2017-12-18 21:33:12', '3.72', '0', '559100993155', '变形戒指男士潮版个性潮人钛钢创意食指环尾戒简约刻字指环手饰品', '1', '38', 'e饰潮人', '2017-12-13 21:58:10', '101640739450952681', NULL, 0, NULL),
(192, 0, 0, 0, '订单结算', '35.28', '2017-12-29 09:42:45', '1.76', '0', '524466355198', 'Barpa泰国white芦荟胶鼻贴去黑头水粉刺清洁毛孔 温和撕拉 送棉签', '2', '18', '巴巴爸爸 Barpa 护肤美妆', '2017-12-13 16:46:49', '101567657402081760', NULL, 0, NULL),
(193, 0, 0, 0, '订单结算', '11.57', '2017-12-28 16:58:22', '4.51', '0', '542706853454', '新款【1200贴】网状蕾丝双眼皮贴隐形 自然双眼皮 美目贴神器包邮', '1', '12', '珍珠美妆 专注双眼皮贴', '2017-12-13 16:44:28', '101568217053081760', NULL, 0, NULL),
(194, 0, 0, 0, '订单结算', '19.11', '2017-12-28 16:58:25', '7.62', '0', '533793693331', '日本Lucky Trendy单面自然隐形素肌双眼皮贴无痕网纹肉色透气30对', '1', '25', '珍珠美妆 专注双眼皮贴', '2017-12-13 16:44:28', '101568217053081760', NULL, 0, NULL),
(195, 0, 0, 0, '订单结算', '69.58', '2017-12-31 01:01:46', '3.48', '0', '560432540751', '冬季新款毛呢休闲裤男士修身直筒韩版青少年学生加厚小脚哈伦裤子', '1', '139', '子俊男装', '2017-12-12 12:06:08', '111779133065081760', NULL, 0, NULL),
(196, 0, 0, 0, '订单结算', '50.81', '2017-12-16 10:45:26', '5.08', '0', '559968103889', '全棉加厚磨毛双人床单单件单人学生纯棉保暖欧式圆角被单品秋冬季', '1', '116', '安丽娜家纺 专注品质与生活', '2017-12-12 09:01:35', '111375374909386514', NULL, 0, NULL),
(197, 0, 0, 0, '订单结算', '26.8', '2017-12-22 13:20:16', '0.8', '0.13', '554842308398', '南极人袜子女纯棉中筒袜女士短袜浅口棉袜秋冬款防臭韩国可爱女袜', '1', '99', '嘉士内衣专营店', '2017-12-11 16:07:21', '109065455935081760', NULL, 0, NULL),
(198, 0, 0, 0, '订单结算', '26.8', '2017-12-22 10:16:36', '0.8', '0.13', '555349171469', '南极人袜子男士棉袜秋冬季中筒商务袜防臭吸汗纯棉短袜加厚款船袜', '1', '98', '嘉士内衣专营店', '2017-12-11 16:06:12', '109039079675081760', NULL, 0, NULL),
(199, 0, 0, 0, '订单结算', '23.5', '2017-12-13 17:13:26', '1.18', '0', '546840506413', '不锈钢加厚KTV酒吧欧式香槟桶冰块粒桶大号虎头啤酒冰桶红酒冰桶', '1', '35', '星上奕酒吧KTV用品批发', '2017-12-10 14:59:03', '108004677555784630', NULL, 0, NULL),
(200, 0, 0, 0, '订单结算', '21.9', '2017-12-11 15:49:54', '2.19', '0.11', '557051311675', '棉鞋女秋冬季2017新款学生保暖加绒韩版女鞋毛毛鞋平底百搭豆豆鞋', '1', '88', 'oiu旗舰店', '2017-12-10 12:19:15', '107995126806081760', NULL, 0, NULL),
(201, 0, 0, 0, '订单结算', '16.9', '2017-12-10 20:39:27', '0.51', '0.08', '547716437718', 'kdv俄罗斯紫皮糖kpokaht巧克力糖进口糖果零食喜糖批发散装食品', '1', '88', '秋和食品专营店', '2017-12-06 22:48:40', '105344844198708212', NULL, 0, NULL),
(202, 0, 0, 0, '订单结算', '13.8', '2017-12-16 14:25:01', '4.25', '0.07', '40170473899', '净得丽 粘毛器10cm可撕式滚筒衣服粘尘纸去毛刷卷纸补充装刷毛器', '1', '92', '尚知语家居专营店', '2017-12-06 13:27:11', '99242315992824093', NULL, 0, NULL),
(203, 0, 0, 0, '订单结算', '8.99', '2017-12-08 19:48:17', '0.45', '0.04', '537613646506', '植护原木抽纸6包面巾纸家庭装餐巾纸家用卫生纸纸巾纸抽整箱批发', '1', '45', '植护优真专卖店', '2017-12-06 07:30:32', '104733771330038064', 1515577819, 1, 6),
(204, 0, 0, 0, '订单结算', '12.9', '2017-12-11 15:48:54', '2.58', '0.04', '534133526314', '苹果电脑12寸macbook Air13 11键盘膜Mac保护膜pro15笔记本快捷键', '1', '68', '卡美琪数码专营店', '2017-12-05 22:52:53', '104528446788081760', NULL, 0, NULL),
(205, 0, 0, 0, '订单结算', '17', '2017-12-11 15:48:10', '0.85', '0', '561868930290', '持久双插手热水袋充电防爆暖手宝毛绒暖宝宝随身可爱保温已注水', '1', '35', '缘起小屋', '2017-12-05 21:37:17', '104548187039081760', NULL, 0, NULL),
(206, 0, 0, 0, '订单结算', '169', '2017-12-16 11:32:03', '50.7', '0.51', '548898264843', 'Saky/舒客舒克成人声波电动牙刷 美白去渍充电电动牙刷G231X', '1', '399', 'saky舒客薇美姿专卖店', '2017-12-05 19:07:40', '99120095659824093', NULL, 0, NULL),
(207, 0, 0, 0, '订单结算', '169', '2017-12-07 21:58:21', '50.7', '0.51', '548898264843', 'Saky/舒客舒克成人声波电动牙刷 美白去渍充电电动牙刷G231X', '1', '399', 'saky舒客薇美姿专卖店', '2017-12-05 19:06:12', '99170381949748595', NULL, 0, NULL),
(208, 0, 0, 0, '订单结算', '359', '2017-12-05 21:41:57', '5.39', '1.08', '528626631173', 'Midea/美的 M1-L213C 微波炉智能21L迷你转盘式多功能家用正品', '1', '599', 'midea楚鹰专卖店', '2017-12-02 18:51:36', '101672139475907060', NULL, 0, NULL),
(209, 0, 0, 0, '订单结算', '139', '2017-12-11 16:18:52', '2.09', '0', '557600469314', '滑雪镜成人近视雪地护目镜装备户外登山双层防雾雪镜儿童滑雪眼镜', '1', '312', 'RAMBO兰博户外官方店', '2017-11-30 21:27:50', '99681567821784630', NULL, 0, NULL),
(210, 0, 0, 0, '订单结算', '139', '2017-12-11 16:18:51', '2.09', '0', '557600469314', '滑雪镜成人近视雪地护目镜装备户外登山双层防雾雪镜儿童滑雪眼镜', '1', '312', 'RAMBO兰博户外官方店', '2017-11-30 21:27:50', '99681567821784630', NULL, 0, NULL),
(211, 0, 0, 0, '订单结算', '148', '2017-12-06 19:24:55', '7.4', '0.74', '561754673558', '外套男士冬季棉衣2017新款个性潮棉袄精神小伙冬装韩版面包服棉服', '1', '230', '法宾鄂旗舰店', '2017-11-30 19:37:36', '98198754232774396', NULL, 0, NULL),
(212, 0, 0, 0, '订单结算', '16.8', '2017-12-12 09:12:45', '2.57', '0', '551312527511', '联想华硕戴尔通用无线鼠标 笔记本台式电脑 家用办公苹果女生无限', '1', '178', '夭猫连锁店丨金牌店铺', '2017-11-30 15:22:29', '99274080462451029', NULL, 0, NULL),
(213, 0, 0, 0, '订单结算', '9.9', '2017-12-05 09:59:40', '2.97', '0.05', '18189361007', '明爵 平底锅不粘锅无油烟锅牛排煎锅 单身小炒锅电磁炉用锅具煎蛋', '1', '124.5', '明爵旗舰店', '2017-11-30 11:03:32', '99040584246081760', NULL, 0, NULL),
(214, 0, 0, 0, '订单结算', '26.07', '2017-12-05 09:59:53', '1.3', '0', '559794642527', '衡阳特产鸡蛋豆腐鲜蛋豆腐日本豆腐蛋制玉子豆腐铁板红烧麻辣烫', '1', '38.8', '物美价廉乡村味', '2017-11-30 10:58:05', '99129683700081760', NULL, 0, NULL),
(215, 0, 0, 0, '订单结算', '147', '2017-12-05 10:00:08', '7.35', '0', '41414580474', '天天特价青岛大虾鲜活海鲜水产新鲜野生海捕对虾海虾基围虾大活虾', '2', '99', '青岛卖鱼郎', '2017-11-30 10:48:54', '99121339445081760', NULL, 0, NULL),
(216, 0, 0, 0, '订单结算', '58.41', '2017-12-05 10:00:08', '2.92', '0', '520591382461', '青岛特产野生红岛蛤蜊肉新鲜鲜活蛤蜊现剥250g冷冻发货干净无沙', '4', '29.8', '青岛卖鱼郎', '2017-11-30 10:48:54', '99121339445081760', NULL, 0, NULL),
(217, 0, 0, 0, '订单结算', '58', '2017-12-05 10:00:23', '1.16', '0.29', '553764287328', '测犬瘟细小试纸狗瘟病毒狗狗测试纸cpv宠物小狗cdv检测犬瘟热套装', '3', '58', '迪曼宠物用品专营店', '2017-11-29 14:45:04', '98458048057081760', NULL, 0, NULL),
(218, 0, 0, 0, '订单结算', '48', '2017-11-30 10:59:55', '14.4', '0.24', '555552099146', '法芙乐 生巧克力礼盒装送女朋友手工抹茶松露零食圣诞节生日礼物', '1', '149', '法芙乐旗舰店', '2017-11-29 12:17:47', '98344508113081760', NULL, 0, NULL),
(219, 0, 0, 0, '订单结算', '55.86', '2017-12-05 10:00:36', '1.68', '0', '559174764665', '泰迪比熊博美金毛拉布拉多萨摩哈士奇阿拉边牧宠物秋冬狗狗衣服厚', '1', '66', 'My萌宠物用品', '2017-11-28 12:33:53', '97671643088081760', NULL, 0, NULL),
(220, 0, 0, 0, '订单结算', '11.6', '2017-12-03 14:32:50', '0.58', '0.06', '42689678191', 'NEWLINKER 围嘴 纯棉婴儿儿童口水兜吸水宝宝口水巾 围兜全棉饭兜', '1', '39', 'newlinker旗舰店', '2017-11-23 12:28:59', '93694271189081760', NULL, 0, NULL),
(221, 0, 0, 0, '订单结算', '17.4', '2017-12-03 14:32:50', '0.87', '0.09', '555800542569', '婴儿袜子春秋季初生男女宝宝彩棉松口袜护脚套0-1岁新生儿用品', '3', '19', 'newlinker旗舰店', '2017-11-23 12:28:59', '93694271189081760', NULL, 0, NULL),
(222, 0, 0, 0, '订单结算', '66.7', '2017-12-03 14:32:50', '3.34', '0.33', '523764811571', '初生婴儿棉衣服秋冬季连体衣加厚新生儿满月保暖哈衣爬服加厚棉袄', '1', '588', 'newlinker旗舰店', '2017-11-23 12:28:59', '93694271189081760', NULL, 0, NULL),
(223, 0, 0, 0, '订单结算', '54.14', '2017-12-03 14:32:50', '2.71', '0.27', '44281423132', '2017春秋婴幼儿衣服宝宝爬服纯棉婴儿连体衣新生儿哈衣0到3个月', '1', '199', 'newlinker旗舰店', '2017-11-23 12:28:59', '93694271189081760', NULL, 0, NULL),
(224, 0, 0, 0, '订单结算', '7.73', '2017-12-03 14:32:50', '0.39', '0.04', '42720737220', 'newlinker有机棉 婴儿保暖鞋套新生儿宝宝脚套加厚护脚秋冬季', '1', '29', 'newlinker旗舰店', '2017-11-23 12:28:59', '93694271189081760', NULL, 0, NULL),
(225, 0, 0, 0, '订单结算', '11.6', '2017-12-03 14:32:51', '0.58', '0.06', '42736420470', '有机彩棉婴儿棉帽子新生儿宝宝胎帽婴儿帽子春秋满月帽男女宝宝', '1', '49', 'newlinker旗舰店', '2017-11-23 12:28:59', '93694271189081760', NULL, 0, NULL),
(226, 0, 0, 0, '订单结算', '120.83', '2017-12-03 14:32:50', '6.04', '0.6', '554271996668', '彩棉袄婴儿连体衣服加厚春秋冬季0岁3个月宝宝新生儿棉衣外出服', '1', '599', 'newlinker旗舰店', '2017-11-23 12:28:59', '93694271189081760', NULL, 0, NULL),
(227, 0, 0, 0, '订单结算', '33.5', '2017-11-25 18:06:28', '7.04', '0', '557907568180', '靴下物580D中压天鹅绒连裤袜秋冬中厚显瘦婴儿绒打底袜美腿袜子女', '1', '58', '靴下物', '2017-11-23 10:47:48', '93497540869386514', NULL, 0, NULL),
(228, 0, 0, 0, '订单结算', '33.5', '2017-11-25 18:06:27', '7.04', '0', '557907568180', '靴下物580D中压天鹅绒连裤袜秋冬中厚显瘦婴儿绒打底袜美腿袜子女', '1', '58', '靴下物', '2017-11-23 10:47:48', '93497540869386514', NULL, 0, NULL),
(229, 0, 0, 0, '订单结算', '108', '2017-11-24 20:10:50', '5.4', '0.32', '557952753814', '落地遥控小太阳取暖器家用烤火炉节能电暖气立式暖风机速热电热扇', '1', '128', '骆驼望晓源专卖店', '2017-11-22 16:01:03', '96482719905774396', NULL, 0, NULL),
(230, 0, 0, 0, '订单结算', '108', '2017-12-02 18:36:30', '5.4', '0.32', '557952753814', '落地遥控小太阳取暖器家用烤火炉节能电暖气立式暖风机速热电热扇', '1', '128', '骆驼望晓源专卖店', '2017-11-22 16:00:56', '93166669752837370', NULL, 0, NULL),
(231, 0, 0, 0, '订单结算', '150', '2017-12-02 13:29:49', '3.75', '0', '548522197697', '洁云平板卫生纸400张42包整箱家用厕纸手纸草纸江浙沪皖包邮', '1', '158', '优梵家居', '2017-11-22 13:20:20', '92843656870081760', NULL, 0, NULL),
(232, 0, 0, 0, '订单结算', '67.62', '2017-12-01 19:25:38', '13.52', '0', '560542647477', '羽绒棉马甲女短款原宿韩版2017秋冬加厚学生面包服百搭坎肩马夹潮', '1', '109', '大浪家 潮流休闲女装', '2017-11-21 10:43:07', '92000719969081760', NULL, 0, NULL),
(233, 0, 0, 0, '订单结算', '25.29', '2017-12-01 13:20:04', '0.76', '0', '557579894118', '洁柔手帕纸 餐巾纸小包纸巾 可湿水面巾纸古龙水香面纸超迷你72包', '1', '33.9', '双福百货批发', '2017-11-20 23:22:45', '91728670166081760', NULL, 0, NULL),
(234, 0, 0, 0, '订单结算', '14.8', '2017-12-01 08:41:33', '2.96', '0.07', '524843804501', '那芙宠物消毒液狗狗除臭剂杀菌消毒环境除臭猫去尿味香水除味用品', '2', '50', '缘宠宠物用品专营店', '2017-11-20 23:03:47', '91712738410907060', NULL, 0, NULL),
(235, 0, 0, 0, '订单结算', '49.9', '2017-12-01 17:22:54', '5.49', '0.25', '558542523051', '清沐纯子餐厅纸巾批发抽纸家庭装整箱特价50包抽取式家用无香面纸', '1', '199', '清沐纯子旗舰店', '2017-11-20 22:51:35', '91662224924081760', NULL, 0, NULL),
(236, 0, 0, 0, '订单结算', '99', '2017-11-30 13:41:24', '3.47', '0', '559632985712', '【主播定制】简约1.8m1.5米2.0床单被套双人北欧4件套ins', '1', '498', '浅时光布艺家纺', '2017-11-20 10:46:31', '91158927189081760', NULL, 0, NULL),
(237, 0, 0, 0, '订单结算', '109', '2017-11-30 13:06:36', '2.18', '0.55', '541898027792', '抗菌 加厚夹棉床笠单件床垫保护套防滑加棉床罩床套子1.5米1.8m米', '1', '218', '金贝壳家纺旗舰店', '2017-11-20 10:43:05', '90942233788081760', NULL, 0, NULL),
(238, 0, 0, 0, '订单结算', '43', '2017-11-29 09:27:38', '3.44', '0', '18170331035', '阳台客厅壁挂式吊篮花架 挂墙上垂吊吊兰花盆架 挂壁悬挂花篮架', '1', '43', '顶峰铁制饰品工艺厂', '2017-11-19 00:00:04', '90304507160081760', NULL, 0, NULL),
(239, 0, 0, 0, '订单结算', '12.8', '2017-11-22 01:53:56', '0.26', '0.06', '16612740369', '宠物毯子毛毯狗狗被子狗垫子床垫猫棉垫泰迪窝垫狗垫用品冬季保暖', '1', '21.5', '华元宠物用品专营店', '2017-11-18 14:01:22', '95691240621952681', NULL, 0, NULL),
(240, 0, 0, 0, '订单结算', '8.8', '2017-11-22 01:53:55', '0.18', '0.04', '10649162395', '狗狗指甲剪刀猫咪指甲剪宠物指甲钳泰迪金毛中小型犬专用剪指甲刀', '1', '36', '华元宠物用品专营店', '2017-11-18 14:01:22', '95691240621952681', NULL, 0, NULL),
(241, 0, 0, 0, '订单结算', '23.9', '2017-11-22 01:53:55', '0.48', '0.12', '15472733204', '誉丰 狗狗零食除臭狗饼干幼犬磨牙棒洁齿除口臭泰迪比熊宠物补钙', '1', '30', '华元宠物用品专营店', '2017-11-18 14:01:22', '95691240621952681', NULL, 0, NULL),
(242, 0, 0, 0, '订单结算', '5.1', '2017-11-22 01:53:55', '0.1', '0.03', '538157066663', '泰迪狗狗衣服秋冬装比熊博美雪纳瑞法斗小狗小型幼犬宠物四脚棉衣', '1', '49.8', '华元宠物用品专营店', '2017-11-18 14:01:22', '95691240621952681', NULL, 0, NULL),
(243, 0, 0, 0, '订单结算', '16.8', '2017-11-22 01:53:55', '0.34', '0.08', '17882270303', '狗狗毛巾仿鹿皮强力吸水宠物大号擦泰迪金毛浴巾猫咪洗澡沐浴用品', '1', '16.8', '华元宠物用品专营店', '2017-11-18 14:01:22', '95691240621952681', NULL, 0, NULL),
(244, 0, 0, 0, '订单结算', '5', '2017-11-22 01:53:56', '0.1', '0.03', '547158618492', '雪貂宠物消毒液泰迪祛味猫砂除臭剂狗狗杀菌喷雾猫咪去尿味除狗味', '1', '39', '华元宠物用品专营店', '2017-11-18 14:01:22', '95691240621952681', NULL, 0, NULL);
INSERT INTO `tsg_order` (`id`, `delflag`, `createAt`, `updateAt`, `status`, `amount`, `dealTime`, `commissionAmount`, `subsidyAmount`, `productId`, `productName`, `productCount`, `productPrice`, `shopName`, `createTime`, `oid`, `withdrawalAt`, `isWithdrawal`, `fanli_id`) VALUES
(245, 0, 0, 0, '订单结算', '19', '2017-11-22 01:53:56', '0.38', '0.1', '536898042608', '狗狗猫咪毛毯狗窝狗垫毯子冬天被子猫用泰迪保暖宠物用品四季通用', '1', '19', '华元宠物用品专营店', '2017-11-18 14:01:22', '95691240621952681', NULL, 0, NULL),
(246, 0, 0, 0, '订单结算', '44.8', '2017-11-22 01:53:56', '0.9', '0.22', '15221146230', '狗狗沐浴露雪貂泰迪金毛萨摩耶专用杀菌除臭猫洗澡液香波宠物用品', '1', '96', '华元宠物用品专营店', '2017-11-18 14:01:22', '95691240621952681', NULL, 0, NULL),
(247, 0, 0, 0, '订单结算', '145.61', '2017-11-18 20:23:01', '2.18', '0.73', '545907561297', 'K9黄金美毛海藻粉升级配方 宠物狗护肤增色亮黑鼻头泰迪法牛金毛', '1', '230', 'k9superhealth旗舰', '2017-11-16 13:07:12', '88570690185081760', NULL, 0, NULL),
(248, 0, 0, 0, '订单结算', '82.39', '2017-11-18 20:23:01', '1.24', '0.41', '545994252572', 'K9活性益生菌整肠除口臭配方 宠物狗调理肠胃助消化改善拉稀软便', '1', '130', 'k9superhealth旗舰', '2017-11-16 13:07:12', '88570690185081760', NULL, 0, NULL),
(249, 0, 0, 0, '订单结算', '94', '2017-11-18 20:23:19', '1.41', '0.47', '546026895208', 'K9宠物羊奶粉 进口奶源低敏 宠物幼犬狗猫通用 替代母乳增强免疫', '1', '150', 'k9superhealth旗舰', '2017-11-16 13:06:45', '88452669108081760', NULL, 0, NULL),
(250, 0, 0, 0, '订单结算', '68', '2017-11-20 08:49:25', '1.36', '0.34', '546727820934', '一纸花约松露抹茶零食巧克力礼盒装送女友情人节礼物（代可可脂）', '1', '208', '一纸花约旗舰店', '2017-11-16 11:47:30', '88610535801386514', NULL, 0, NULL),
(251, 0, 0, 0, '订单结算', '68', '2017-11-20 12:28:14', '1.36', '0.34', '546727820934', '一纸花约松露抹茶零食巧克力礼盒装送女友情人节礼物（代可可脂）', '1', '208', '一纸花约旗舰店', '2017-11-16 10:35:42', '88424976733907060', NULL, 0, NULL),
(252, 0, 0, 0, '订单结算', '79.9', '2017-11-30 10:59:27', '23.97', '0.4', '35690502177', '泰迪博美狗窝猫咪窝小狗房子宠物窝可拆洗可拆卸别墅四季狗屋猫窝', '1', '339', '麦德豪宠物用品旗舰店', '2017-11-15 09:22:22', '87902163831081760', NULL, 0, NULL),
(253, 0, 0, 0, '订单结算', '111.57', '2017-11-18 13:44:42', '5.58', '0', '559496430611', '狗围栏泰迪小型犬中型犬金毛大型犬狗狗笼子小狗栅栏兔子宠物围栏', '1', '118', '宠而美宠物用品生活馆', '2017-11-15 09:01:38', '95009947841952681', NULL, 0, NULL),
(254, 0, 0, 0, '订单结算', '9.36', '2017-11-18 13:44:42', '0.47', '0', '558551415979', '狗梳子狗毛梳泰迪金毛小型犬针梳刷子猫咪梳子开结梳宠物狗狗用品', '1', '9.9', '宠而美宠物用品生活馆', '2017-11-15 09:01:38', '95009947841952681', NULL, 0, NULL),
(255, 0, 0, 0, '订单结算', '14.61', '2017-11-18 12:41:11', '0.73', '0', '18834789147', '狗狗牵引绳一体训狗绳泰迪金毛小中大型犬p链狗链尼龙绳加粗用品', '1', '29', '环球宝贝宠物店', '2017-11-14 23:26:35', '95036209698952681', NULL, 0, NULL),
(256, 0, 0, 0, '订单结算', '4.81', '2017-11-18 12:41:11', '0.24', '0', '550404176579', '宠物狗狗玩具耐咬磨牙发声尖叫惨叫鸡泰迪金毛咬绳飞盘训练狗用品', '1', '4.9', '环球宝贝宠物店', '2017-11-14 23:26:35', '95036209698952681', NULL, 0, NULL),
(257, 0, 0, 0, '订单结算', '4.41', '2017-11-18 12:41:11', '0.22', '0', '550487779000', '宠物狗狗玩具铃铛球天然橡胶安全无毒铃铛弹力球泰迪金毛发声玩具', '1', '4.5', '环球宝贝宠物店', '2017-11-14 23:26:35', '95036209698952681', NULL, 0, NULL),
(258, 0, 0, 0, '订单结算', '4.81', '2017-11-18 12:41:11', '0.24', '0', '550404176579', '宠物狗狗玩具耐咬磨牙发声尖叫惨叫鸡泰迪金毛咬绳飞盘训练狗用品', '1', '4.9', '环球宝贝宠物店', '2017-11-14 23:26:35', '95036209698952681', NULL, 0, NULL),
(259, 0, 0, 0, '订单结算', '86.4', '2017-11-17 19:53:54', '1.3', '0', '552879084275', '北欧led护眼立式钓鱼遥控落地灯创意客厅书房卧室床头喂奶台灯', '1', '216', '浩丞灯饰', '2017-11-14 23:10:33', '87799039551784630', NULL, 0, NULL),
(260, 0, 0, 0, '订单结算', '21.37', '2017-11-18 12:41:22', '0.32', '0', '543207816838', '宠物尿垫100片包邮狗尿片猫狗尿不湿狗尿垫宠物尿片兔尿片狗尿布', '1', '21.8', '狗博士宠物之家', '2017-11-14 23:04:33', '94977607696952681', NULL, 0, NULL),
(261, 0, 0, 0, '订单结算', '29', '2017-11-17 22:06:59', '0.87', '0.15', '537566265542', '爱丽丝狗狗厕所便便器狗便盆尿尿盆小狗小型犬大小号泰迪拉屎用品', '1', '159', '怡宠宠物用品专营店', '2017-11-14 23:03:07', '95075130930952681', NULL, 0, NULL),
(262, 0, 0, 0, '订单结算', '141', '2017-11-21 12:30:14', '8.46', '0.71', '38608562104', '皇家小型幼犬狗粮MIJ31 0.8KG*3 博美狗茶杯腊肠犬 28省包邮', '1', '171', '皇家宠物食品旗舰店', '2017-11-14 23:00:08', '95077762033952681', NULL, 0, NULL),
(263, 0, 0, 0, '订单结算', '29', '2017-11-17 17:35:23', '0.87', '0.15', '537566265542', '爱丽丝狗狗厕所便便器狗便盆尿尿盆小狗小型犬大小号泰迪拉屎用品', '1', '159', '怡宠宠物用品专营店', '2017-11-14 22:56:09', '87579489677081760', NULL, 0, NULL),
(264, 0, 0, 0, '订单结算', '64.1', '2017-11-18 20:23:42', '0.96', '0', '543207816838', '宠物尿垫100片包邮狗尿片猫狗尿不湿狗尿垫宠物尿片兔尿片狗尿布', '3', '21.8', '狗博士宠物之家', '2017-11-14 22:56:09', '87579489681081760', NULL, 0, NULL),
(265, 0, 0, 0, '订单结算', '139', '2017-11-26 16:09:54', '2.09', '0.42', '521826135548', '苏泊尔电锅韩式多功能家用电火火锅电热锅宿舍学生锅电煮锅不粘锅', '1', '529', 'supor苏泊尔兆洪专卖店', '2017-11-12 17:49:34', '91594188854191855', NULL, 0, NULL),
(266, 0, 0, 0, '订单结算', '49.9', '2017-11-15 00:19:46', '0.75', '0.25', '558522622317', '加量装清风原木纯品3层120抽中规30包抽取面纸巾整箱', '1', '127.9', '天猫超市', '2017-11-11 22:38:09', '86062813472784630', NULL, 0, NULL),
(267, 0, 0, 0, '订单结算', '249', '2017-11-18 10:39:28', '62.25', '0.75', '549175385097', '【双11狂欢价】Dibea/地贝无线吸尘器家用车载强力手持式小型静音大功率LW-200', '1', '629', 'dibea地贝祺骏专卖店', '2017-11-11 21:22:51', '90629677658081760', NULL, 0, NULL),
(268, 0, 0, 0, '订单结算', '99', '2017-11-28 04:39:17', '2.97', '0.5', '546838344135', '卓诗尼2017夏季新款坡跟碎花凉鞋高跟一字扣带休闲女鞋144713712', '1', '369', 'josiny卓诗尼淘淘专卖店', '2017-11-11 14:36:27', '92528164352793274', NULL, 0, NULL),
(269, 0, 0, 0, '订单结算', '38.43', '2017-11-19 15:34:12', '1.15', '0.38', '543934122915', '【双11狂欢价】【双11】安美四色散粉定妆粉蜜粉控油持久遮瑕防水修容四宫格正品', '1', '99', 'amy安美化妆品旗舰店', '2017-11-11 11:53:59', '89523088350868747', NULL, 0, NULL),
(270, 0, 0, 0, '订单结算', '39.3', '2017-11-19 15:34:27', '1.18', '0.39', '13704110999', '【双11狂欢价】【双11】土家硒泥坊绿豆泥浆面膜保湿深层清洁控油去黑头收缩毛孔', '1', '109', '土家硒泥坊旗舰店', '2017-11-11 11:53:59', '89523088354868747', NULL, 0, NULL),
(271, 0, 0, 0, '订单结算', '103.29', '2017-11-19 15:34:37', '4.13', '1.03', '539339147058', '【双11狂欢价】[双11]自然堂喜马拉雅面膜21片清洁保湿收毛孔紧致补水面膜女正品', '2', '204', '自然堂旗舰店', '2017-11-11 11:53:59', '89523088355868747', NULL, 0, NULL),
(272, 0, 0, 0, '订单结算', '125.98', '2017-12-05 16:42:21', '6.3', '0', '560356080276', '林珊珊 2017秋冬新款韩版宽松套头打底衫高领加厚情侣毛衣外套女', '1', '179', '林珊珊 Sunny33小超人', '2017-11-11 09:37:49', '84792817345199021', NULL, 0, NULL),
(273, 0, 0, 0, '订单结算', '158', '2017-11-16 07:07:53', '31.6', '0.79', '522747329360', '【双11狂欢价】西服套装男士秋季修身商务正装职业西装三件套新郎伴郎服结婚礼服', '1', '899', '潮男衣柜服饰专营店', '2017-11-11 09:31:33', '91726776188952681', NULL, 0, NULL),
(274, 0, 0, 0, '订单结算', '35.6', '2017-11-16 17:19:52', '3.56', '0.18', '557492630781', '【双11狂欢价】车载手机支架创意多功能车内通用汽车导航车上出风口卡扣式支撑座', '1', '78', '先马车品专营店', '2017-11-11 01:43:26', '90955437435296788', NULL, 0, NULL),
(275, 0, 0, 0, '订单结算', '47.4', '2017-11-19 03:08:30', '0.71', '0.24', '524859421424', '【双11狂欢价】良品铺子零食大礼包组合一整箱好吃的混合装吃货膨化食品小吃批发', '1', '108', '良品铺子旗舰店', '2017-11-11 01:31:37', '83970956208784630', NULL, 0, NULL),
(276, 0, 0, 0, '订单结算', '47.4', '2017-11-19 03:08:30', '0.71', '0.24', '539154561492', '【双11狂欢价】良品铺子辣味零食大礼包组合卤味肉类鸭脖鸭舌麻辣味整箱混装小吃', '1', '129', '良品铺子旗舰店', '2017-11-11 01:31:37', '83970956208784630', NULL, 0, NULL),
(277, 0, 0, 0, '订单结算', '35.8', '2017-11-17 01:50:37', '10.92', '0.18', '536094999307', '【双11狂欢价】南极人暖足贴保暖暖脚贴暖贴自发热鞋垫贴100片关节膝盖贴宝宝贴', '1', '149', '南极人法斯特专卖店', '2017-11-11 01:26:19', '83889255470784630', NULL, 0, NULL),
(278, 0, 0, 0, '订单结算', '36', '2017-11-15 22:02:26', '3.6', '0.18', '40994417517', '生活良品橄榄精油保湿弹力素250ml 定型专用正品持久护发卷发造型', '2', '29.9', '生活良品旗舰店', '2017-11-11 01:24:55', '90434608868297586', NULL, 0, NULL),
(279, 0, 0, 0, '订单结算', '37', '2017-11-13 01:27:13', '1.11', '0.37', '37659730958', '墨西哥原装进口 Corona/科罗娜啤酒 330ml*6瓶 整箱', '1', '94', '天猫超市', '2017-11-11 01:24:33', '83562492734784630', NULL, 0, NULL),
(280, 0, 0, 0, '订单结算', '39', '2017-11-13 01:27:13', '1.17', '0.39', '35649750981', '西班牙进口红酒爱之湾桃红起泡酒甜气泡葡萄酒750ml', '1', '210', '天猫超市', '2017-11-11 01:24:32', '83562492734784630', NULL, 0, NULL),
(281, 0, 0, 0, '订单结算', '49.81', '2017-11-12 21:27:02', '2.49', '0', '537544065273', '加绒打底裤外穿薄绒九分裤小脚裤铅笔裤黑色裤子女秋季加厚长裤', '1', '199', '7小天', '2017-11-11 01:23:55', '87900517923081760', NULL, 0, NULL),
(282, 0, 0, 0, '订单结算', '43.47', '2017-11-12 21:59:21', '0.65', '0', '530391295323', '拜耳药粉宠物狗狗杀除跳蚤去虱子驱虫防蚊虫项圈防皮肤病脖圈颈圈', '1', '96', 'hello帽 宠物用品城', '2017-11-11 01:22:28', '87900517921081760', NULL, 0, NULL),
(283, 0, 0, 0, '订单结算', '96.75', '2017-11-14 10:17:34', '1.45', '0', '543207816838', '宠物尿垫100片包邮狗尿片猫狗尿不湿狗尿垫宠物尿片兔尿片狗尿布', '5', '22.8', '狗博士宠物之家', '2017-11-11 01:22:23', '87900517922081760', NULL, 0, NULL),
(284, 0, 0, 0, '订单结算', '47.24', '2017-11-18 20:23:56', '0.71', '0.24', '560618507139', '【双11狂欢价】2017冬季低帮雪地靴男加绒保暖男士靴子防水防滑棉鞋男学生棉短靴', '1', '236', '爵朗夫旗舰店', '2017-11-11 01:21:53', '87850564437081760', NULL, 0, NULL),
(285, 0, 0, 0, '订单结算', '38.47', '2017-11-18 20:23:56', '3.85', '0.19', '558811578280', '【双11狂欢价】2017冬季长毛绒豆豆鞋男加绒保暖鞋子男韩版潮流百搭休闲男生棉鞋', '1', '176', '爵朗夫旗舰店', '2017-11-11 01:21:53', '87850564437081760', NULL, 0, NULL),
(286, 0, 0, 0, '订单结算', '25.41', '2017-11-12 12:40:30', '4.57', '0.13', '553601477429', '【双11狂欢价】浪莎春秋季中厚款丝袜连裤袜女防勾丝天鹅绒打底黑色肉色显瘦腿袜', '1', '76', '浪莎高事达专卖店', '2017-11-11 01:21:53', '87850564440081760', NULL, 0, NULL),
(287, 0, 0, 0, '订单结算', '92.01', '2017-11-16 10:21:04', '2.76', '0.92', '13903451152', '【双11狂欢价】美宝莲紫胖子密扇睫毛膏 防水纤长浓密不易晕染卷翘持久定型正品', '1', '109', '美宝莲旗舰店', '2017-11-11 01:21:53', '87850564443081760', NULL, 0, NULL),
(288, 0, 0, 0, '订单结算', '85.96', '2017-11-12 12:41:12', '18.05', '0.43', '526085566037', '【双11狂欢价】2017秋冬季新款加厚加绒宽松卫衣女装套头学生中长款bf韩版外套潮', '1', '218', 'jcoolstory旗舰店', '2017-11-11 01:21:53', '87850564446081760', NULL, 0, NULL),
(289, 0, 0, 0, '订单结算', '433.76', '2017-11-12 12:40:43', '26.03', '2.17', '529066909319', '【双11狂欢价】皇家狗粮 中型犬幼犬粮MEJ32 4KG*4萨摩耶哈士奇柯基狗粮', '1', '956', '皇家宠物食品旗舰店', '2017-11-11 01:21:52', '87850564441081760', NULL, 0, NULL),
(290, 0, 0, 0, '订单结算', '85.44', '2017-11-15 17:01:24', '2.56', '0.85', '555905357154', '【双11狂欢价】【双11聚】ETUDEHOUSE伊蒂之屋101双头修容棒高光笔鼻影PONY同款', '2', '98', 'ETUDE HOUSE伊蒂之屋官方旗舰店', '2017-11-11 01:21:52', '87850564444081760', NULL, 0, NULL),
(291, 0, 0, 0, '订单结算', '49.9', '2017-11-13 01:27:33', '0.75', '0.25', '558522622317', '加量装清风原木纯品3层120抽中规30包抽取面纸巾整箱', '1', '127.9', '天猫超市', '2017-11-11 01:18:57', '83490310045784630', NULL, 0, NULL),
(292, 0, 0, 0, '订单结算', '264', '2017-12-05 09:27:27', '13.2', '0', '560746890290', 'BANGBOY 自制冬款麂皮绒长款棕黄色大牌感腰带毛呢大衣韩版男外套', '1', '999', 'BANGBOY X IZTION', '2017-11-11 01:13:24', '83217506044784630', NULL, 0, NULL),
(293, 0, 0, 0, '订单结算', '105.04', '2017-11-14 10:18:13', '5.25', '0.53', '556447850508', '【双11狂欢价】唐狮2017秋冬新款毛衣男圆领韩版复古休闲提花图案套头毛衫针织衫', '1', '369', '唐狮官方旗舰店', '2017-11-11 01:08:09', '87592351292081760', NULL, 0, NULL),
(294, 0, 0, 0, '订单结算', '14.82', '2017-11-30 09:31:37', '2.22', '0.15', '559974405743', '【双11狂欢价】三个装！送收纳架子葫芦水滴美妆蛋海绵粉扑彩妆化妆工具气垫rt', '1', '49.9', '丽亚斯旗舰店', '2017-11-11 01:07:34', '83191807046263610', NULL, 0, NULL),
(295, 0, 0, 0, '订单结算', '333.25', '2017-11-23 21:51:38', '6.67', '1.67', '522564716142', '【双11狂欢价】镁多力伸缩梯子人字梯铝合金加厚折叠梯家用多功能升降梯工程楼梯', '1', '2098', 'midoli旗舰店', '2017-11-11 01:05:29', '83191807044263610', NULL, 0, NULL),
(296, 0, 0, 0, '订单结算', '8.33', '2017-11-29 10:38:49', '1.25', '0.08', '522981802843', '【双11狂欢价】美丽工匠 化妆棉卸妆棉脸部双面双效纯棉软洗脸厚款补水化妆工具', '1', '25.9', '美丽工匠化妆品旗舰店', '2017-11-11 01:05:23', '83191807045263610', NULL, 0, NULL),
(297, 0, 0, 0, '订单结算', '279', '2017-11-27 09:36:23', '4.19', '0.84', '538661026488', '【双11狂欢价】飞利浦电动牙刷头6支装HX6016适用于HX6721/HX6730/HX3216等型号', '1', '379', '飞利浦官方旗舰店', '2017-11-11 00:54:59', '89671272988297586', NULL, 0, NULL),
(298, 0, 0, 0, '订单结算', '101', '2017-11-14 12:33:57', '15.15', '0', '556114298917', '西西里男装 吴亦凡同款牛仔裤男小脚黑色裤子男韩版潮流九分裤男', '1', '999', '西西里男装 CHIC ERRO', '2017-11-11 00:52:52', '82801150024199021', NULL, 0, NULL),
(299, 0, 0, 0, '订单结算', '83', '2017-11-13 19:15:13', '16.6', '0', '558576129425', '大赖自制秋冬新款高领毛衣男韩版外穿针织衫小清新百搭长袖毛线衣', '1', '288', '大赖 studios', '2017-11-11 00:52:47', '82801150025199021', NULL, 0, NULL),
(300, 0, 0, 0, '订单结算', '308', '2017-11-16 09:10:50', '30.8', '1.54', '557369504333', '【双11狂欢价】大毛领轻薄羽绒服女短款2017冬装新款潮韩版修身显瘦学生冬季外套', '1', '699', '侨西尼旗舰店', '2017-11-11 00:52:44', '82836599291386514', NULL, 0, NULL),
(301, 0, 0, 0, '订单结算', '41.87', '2017-11-16 09:11:00', '0.84', '0', '558761097353', '小米MIX2原装快速充电器高通QC3.0快充小米NOTE3红米PRO充电头', '1', '79', '扬帆精品数码', '2017-11-11 00:52:41', '82836599293386514', NULL, 0, NULL),
(302, 0, 0, 0, '订单结算', '62.8', '2017-11-13 09:09:21', '0.94', '0.31', '41122330248', '【双11狂欢价】遇见香芬COCO香水洗发水护发素沐浴露三件套装持久留香男女家庭装', '1', '444', 'cocoessence旗舰店', '2017-11-11 00:52:35', '82836599292386514', NULL, 0, NULL),
(303, 0, 0, 0, '订单结算', '25.82', '2017-11-26 23:45:56', '0.39', '0.13', '37062325253', '【特价秒杀】B365果蔬酵素粉10g*5袋 综合复合 水果酵素 红糖姜茶', '1', '78', 'b365旗舰店', '2017-11-11 00:51:10', '82782726205263610', NULL, 0, NULL),
(304, 0, 0, 0, '订单结算', '417.08', '2017-11-26 23:45:56', '41.71', '2.09', '14303032737', '【双11狂欢价】【官方直营】B365果蔬酵素粉enzyme非果冻综合水果孝素粉b365酵素', '7', '198', 'b365旗舰店', '2017-11-11 00:51:10', '82782726205263610', NULL, 0, NULL),
(305, 0, 0, 0, '订单结算', '61.36', '2017-11-21 10:51:55', '0.92', '0.31', '558382982629', '【双11狂欢价】【直营】韩国进口 爱茉莉美妆仙护发精油 韩国人手一件*2瓶', '1', '118', '天猫国际官方直营', '2017-11-11 00:48:36', '89548297162297586', NULL, 0, NULL),
(306, 0, 0, 0, '订单结算', '388', '2017-11-18 20:52:34', '19.4', '1.94', '560602471834', '塞尔伯恩中老年羽绒服男士中长款加厚中年男装毛领爸爸装冬装外套', '1', '1580', '塞尔伯恩旗舰店', '2017-11-11 00:47:36', '82597196433386514', NULL, 0, NULL),
(307, 0, 0, 0, '订单结算', '118', '2017-11-16 09:11:24', '37.76', '0.59', '557647894772', '【双11狂欢价】妈妈靴子女冬季中筒靴加绒保暖粗跟中跟防滑马丁靴皮棉鞋中年女靴', '1', '278', '母泰旗舰店', '2017-11-11 00:47:32', '82597196434386514', NULL, 0, NULL),
(308, 0, 0, 0, '订单结算', '24.79', '2017-11-14 12:40:36', '1.24', '0.12', '540462162389', '【双11狂欢价】薄暮花冬季棉拖鞋女包跟月子鞋室内保暖厚底可爱韩版加绒情侣棉拖', '1', '108', '薄暮花旗舰店', '2017-11-11 00:45:26', '87189626908899946', NULL, 0, NULL),
(309, 0, 0, 0, '订单结算', '27.59', '2017-11-14 12:40:36', '1.38', '0.14', '556974030983', '【双11狂欢价】棉拖鞋女厚底冬季韩版可爱保暖月子鞋室内防滑软底情侣家居拖鞋', '1', '98', '薄暮花旗舰店', '2017-11-11 00:45:26', '87189626908899946', NULL, 0, NULL),
(310, 0, 0, 0, '订单结算', '124.56', '2017-11-15 20:54:50', '9.96', '0.62', '557146710260', '【双11狂欢价】热风2017冬新款学院风淑女饰扣雪地靴加绒女士平底短靴H89W7405', '1', '249', '热风旗舰店', '2017-11-11 00:45:20', '87189626912899946', NULL, 0, NULL),
(311, 0, 0, 0, '订单结算', '232.11', '2017-11-15 20:54:50', '18.57', '1.16', '557334318974', '【双11狂欢价】热风2017冬新款潮流时尚橡筋女士粗跟休闲鞋圆头短筒短靴H82W7409', '1', '449', '热风旗舰店', '2017-11-11 00:45:20', '87189626912899946', NULL, 0, NULL),
(312, 0, 0, 0, '订单结算', '107.95', '2017-11-26 01:00:32', '6.48', '0.54', '538874017620', '【双11狂欢价】夏季新品女装中长款吊带裙无袖雪纺连衣裙波西米亚海边度假沙滩裙', '1', '257', '西子美丽心情旗舰店', '2017-11-11 00:45:18', '89502402396793274', NULL, 0, NULL),
(313, 0, 0, 0, '订单结算', '125.94', '2017-11-26 13:00:56', '3.78', '0.63', '559825849115', '【双11狂欢价】小红人磨砂皮短靴女秋冬2017新款粗跟马丁靴女英伦风女鞋高跟靴子', '1', '288', '小红人旗舰店', '2017-11-11 00:45:18', '89502402402793274', NULL, 0, NULL),
(314, 0, 0, 0, '订单结算', '178.01', '2017-11-26 11:56:28', '35.6', '0.89', '560081915992', '【双11狂欢价】小个子毛呢外套女韩版2017秋冬中长款新款修身加厚短款矮呢子大衣', '1', '319', '雅丽岚旗舰店', '2017-11-11 00:45:14', '89502402401793274', NULL, 0, NULL),
(315, 0, 0, 0, '订单结算', '24.37', '2017-11-13 11:38:06', '1.22', '0', '22060331325', '正品暖贴宝宝贴自发热宫暖贴暖身贴热帖足贴保暖贴包邮100片全身', '1', '57.6', 'E时尚百货一温暖售卖', '2017-11-11 00:42:02', '87134298184899946', NULL, 0, NULL),
(316, 0, 0, 0, '订单结算', '27.58', '2017-11-13 11:37:43', '2.76', '0', '557607251885', '全自动雨伞男女折叠加固防风太阳伞自开收晴雨两用防晒黑胶遮阳伞', '1', '188', '惟夕', '2017-11-11 00:41:50', '87134298185899946', NULL, 0, NULL),
(317, 0, 0, 0, '订单结算', '203.84', '2017-11-13 19:02:57', '40.97', '0', '537453365578', '2017秋冬新款韩版休闲风衣毛呢外套男宽松中长款学生翻领男士大衣', '1', '608', '韩宜嘉男装', '2017-11-11 00:39:53', '82467781474199021', NULL, 0, NULL),
(318, 0, 0, 0, '订单结算', '165.91', '2017-11-20 19:49:08', '8.3', '0.83', '559652868421', '【双11狂欢价】毛呢大衣女学生中长款韩国2017新款秋冬宽松焦糖色矮小个子呢外套', '1', '398', '戴乐思旗舰店', '2017-11-11 00:38:04', '89319171151267166', NULL, 0, NULL),
(319, 0, 0, 0, '订单结算', '95', '2017-11-30 02:42:17', '2.85', '0.95', '18616903560', '【双11狂欢价】美宝莲飞箭睫毛膏防水纤长卷翘浓密不结块不晕染持久防水官方正品', '1', '109', '美宝莲旗舰店', '2017-11-11 00:35:31', '82453248344263610', NULL, 0, NULL),
(320, 0, 0, 0, '订单结算', '89', '2017-11-30 02:42:17', '2.67', '0.89', '522647007234', '【双11狂欢价】美宝莲绝色持久丝绒雾感唇釉唇膏唇彩 口红滋润持久保湿M500 M400', '1', '99', '美宝莲旗舰店', '2017-11-11 00:35:31', '82453248344263610', NULL, 0, NULL),
(321, 0, 0, 0, '订单结算', '59', '2017-11-30 02:42:17', '1.77', '0.59', '546686906286', '【双11狂欢价】美宝莲 双头三角眉笔眉粉防水防汗防晕染持久多用初学者染眉膏', '1', '89', '美宝莲旗舰店', '2017-11-11 00:35:31', '82453248344263610', NULL, 0, NULL),
(322, 0, 0, 0, '订单结算', '53', '2017-11-30 02:42:17', '1.59', '0.53', '12727688676', '【双11狂欢价】美宝莲眼唇卸妆液 脸部眼部及唇部卸妆油卸妆水温和无刺激清洁', '1', '59', '美宝莲旗舰店', '2017-11-11 00:35:31', '82453248344263610', NULL, 0, NULL),
(323, 0, 0, 0, '订单结算', '46.5', '2017-12-12 16:36:44', '4.65', '0.47', '559414638622', '【双11狂欢价】The Face Shop/菲诗小铺隔离霜遮瑕裸妆妆前乳防辐射紫色绿色2支', '1', '118', 'realls海外专营店', '2017-11-11 00:35:31', '82453248349263610', NULL, 0, NULL),
(324, 0, 0, 0, '订单结算', '77', '2017-11-15 06:26:49', '3.85', '0.39', '558657687001', '【双11狂欢价】乐扣乐扣 圈圈保温杯 运动便携时尚水杯可拎不锈钢男女 LHC4153/4', '1', '158', '乐扣乐扣旗舰店', '2017-11-11 00:13:18', '88933303536952681', NULL, 0, NULL),
(325, 0, 0, 0, '订单结算', '116', '2017-11-12 19:23:20', '5.8', '0.58', '525650887454', '【双11狂欢价】乐扣乐扣 娜姆马克保温杯 时尚简约情侣男女黑白红 500ml LHC4125', '1', '258', '乐扣乐扣旗舰店', '2017-11-11 00:12:06', '88922187122952681', NULL, 0, NULL),
(326, 0, 0, 0, '订单结算', '56', '2017-11-14 06:44:19', '2.8', '0.28', '41384025967', '【双11狂欢价】乐扣乐扣 缤纷马克杯保温杯 时尚水杯便携男女 390ml LHC4021', '1', '125', '乐扣乐扣旗舰店', '2017-11-11 00:10:24', '88906225593952681', NULL, 0, NULL),
(327, 0, 0, 0, '订单结算', '14.8', '2017-11-20 17:42:11', '4.45', '0.07', '558031483936', '0-6-12个月婴儿鞋子软底学步冬季宝宝棉鞋1岁男女新生幼儿雪地靴', '1', '69', '波特豆旗舰店', '2017-11-10 21:20:32', '88760657559766089', NULL, 0, NULL),
(328, 0, 0, 0, '订单结算', '20', '2017-11-28 18:28:01', '47.7', '1.59', '546740418664', '【双11预售】美宝莲超然无瑕轻垫霜黑金气垫bb霜巨遮瑕轻薄裸妆', '1', '179', '美宝莲旗舰店', '2017-11-10 21:13:28', '81815409971263610', NULL, 0, NULL),
(329, 0, 0, 0, '订单结算', '13', '2017-11-16 21:36:47', '0.39', '0.07', '557539943165', '婴儿帽子秋冬0-3-6-12个月宝宝帽子1-2岁男女儿童帽子冬帽线帽', '1', '42', '悠铭母婴专营店', '2017-11-10 21:09:51', '88733637434766089', NULL, 0, NULL),
(330, 0, 0, 0, '订单结算', '29.01', '2017-11-11 19:02:06', '0.44', '0', '524630951876', '口罩一次性透气男女秋冬季时尚韩版可爱个性女神黑潮款批发50只装', '2', '29.15', '当当阁 时尚网购享当当', '2017-11-10 13:04:47', '86329662125081760', NULL, 0, NULL),
(331, 0, 0, 0, '订单结算', '26.9', '2017-11-15 00:21:51', '9.42', '0.08', '40111047312', '再也不用换电池 可充电无线鼠标 静音无声笔记本台式游戏苹果女生', '1', '69', '众乐乐数码专营店', '2017-11-09 15:43:21', '81327588463784630', NULL, 0, NULL),
(332, 0, 0, 0, '订单结算', '35.8', '2017-11-10 21:56:42', '0.57', '0', '550939007695', '特价2碗2盘2勺2筷家用套装 情侣2人清新碗盘勺筷组合餐具 可微波', '1', '71.6', '玲珑餐具', '2017-11-08 22:21:19', '85752189593081760', NULL, 0, NULL),
(333, 0, 0, 0, '订单结算', '32.86', '2017-11-10 21:59:46', '1.31', '0.16', '540421207446', '【2件5折】炊大皇全钢柄不锈钢切菜刀切肉刀砍骨刀切片刀多刀', '1', '69.9', '天猫超市', '2017-11-08 22:11:15', '85781927748081760', NULL, 0, NULL),
(334, 0, 0, 0, '订单结算', '55.84', '2017-11-10 21:59:46', '1.68', '0.28', '40659152717', '【日用百货】百富帝加厚保暖被子冬被 2米双人加厚保暖棉被 被褥', '1', '269', '天猫超市', '2017-11-08 22:11:15', '85781927748081760', NULL, 0, NULL),
(335, 0, 0, 0, '订单结算', '13.8', '2017-11-19 09:28:04', '4.14', '0.04', '546509871715', '玛尚可充电无线鼠标 静音无声电脑笔记本办公游戏男女生 无限鼠标', '1', '89', '巨途数码专营店', '2017-11-08 20:32:02', '85698401360907060', NULL, 0, NULL),
(336, 0, 0, 0, '订单结算', '30.99', '2017-11-12 21:59:01', '1.55', '0.15', '521422451240', '植护原木抽纸24包餐巾纸抽纸批发纸巾整箱家庭装卫生纸家用面巾纸', '1', '150', '植护旗舰店', '2017-11-08 15:18:18', '85597182568081760', NULL, 0, NULL),
(337, 0, 0, 0, '订单结算', '5.9', '2017-11-10 08:54:44', '0.09', '0.03', '41385219786', '【买2包邮】挤酱瓶挤压瓶酱汁樽挤瓶沙拉番茄酱瓶寿司挤酱瓶油壶', '1', '10.8', '谷色食品专营店', '2017-11-08 15:11:34', '85593514648081760', NULL, 0, NULL),
(338, 0, 0, 0, '订单结算', '5.9', '2017-11-10 08:54:44', '0.09', '0.03', '41385219786', '【买2包邮】挤酱瓶挤压瓶酱汁樽挤瓶沙拉番茄酱瓶寿司挤酱瓶油壶', '1', '10.8', '谷色食品专营店', '2017-11-08 15:11:34', '85593514648081760', NULL, 0, NULL),
(339, 0, 0, 0, '订单结算', '13.6', '2017-11-10 08:54:44', '0.2', '0.07', '36636107471', '寿司工具套装全套材料食材紫菜包饭套餐酸萝卜条大根条金大根400g', '2', '7.8', '谷色食品专营店', '2017-11-08 15:11:34', '85593514648081760', NULL, 0, NULL),
(340, 0, 0, 0, '订单结算', '16.8', '2017-11-10 22:29:57', '2.54', '0', '552735157264', '陶瓷小花瓶小清新水培花器玻璃透明客厅插花现代干花家居装饰摆件', '1', '33.6', '曦尚工厂店', '2017-11-08 12:51:23', '80914035398386514', NULL, 0, NULL),
(341, 0, 0, 0, '订单结算', '14.9', '2017-11-13 01:27:24', '4.5', '0.04', '535386917387', 'AA充电电池充电器套装 通用5号7号共8节 电池可充遥控玩具鼠标ktv', '1', '46', '百乐士数码专营店', '2017-11-07 21:46:20', '80538997548784630', NULL, 0, NULL),
(342, 0, 0, 0, '订单结算', '6.9', '2017-11-08 22:31:23', '0.1', '0.03', '12424933809', '黑人牙膏透心爽柠檬120g去牙菌斑护牙龈防蛀清新口气', '1', '22', '天猫超市', '2017-11-03 21:20:18', '83477554324081760', NULL, 0, NULL),
(343, 0, 0, 0, '订单结算', '9.91', '2017-11-08 22:31:23', '0.15', '0.05', '22250308893', '黑人牙刷炭丝深洁双支成人家用旅行套装细丝软毛洁净', '1', '21.5', '天猫超市', '2017-11-03 21:20:18', '83477554324081760', NULL, 0, NULL),
(344, 0, 0, 0, '订单结算', '7.9', '2017-11-08 22:31:23', '0.12', '0.04', '534465003021', '【天猫超市】顺清柔抽纸 橙A系列3层120抽3包软抽取式面巾纸巾', '1', '22.9', '天猫超市', '2017-11-03 21:20:18', '83477554324081760', NULL, 0, NULL),
(345, 0, 0, 0, '订单结算', '1', '2017-11-08 22:31:23', '0.02', '0.01', '560007635957', '【天猫超市】印尼进口Tango奥朗探戈乳酪威化夹心饼干52g零食品', '1', '19.9', '天猫超市', '2017-11-03 21:20:18', '83477554324081760', NULL, 0, NULL),
(346, 0, 0, 0, '订单结算', '9.9', '2017-11-08 22:31:23', '0.15', '0.05', '560072136297', '碧浪洗衣液 机洗超净 亮白去油污渍700g快洗无残留', '1', '19.9', '天猫超市', '2017-11-03 21:20:18', '83477554324081760', NULL, 0, NULL),
(347, 0, 0, 0, '订单结算', '23.8', '2017-11-08 22:31:23', '0.36', '0.12', '530400465447', '【天猫超市】纳美源生净白花香薄荷双重去渍小苏打牙膏120G', '1', '24.9', '天猫超市', '2017-11-03 21:20:18', '83477554324081760', NULL, 0, NULL),
(348, 0, 0, 0, '订单结算', '32.8', '2017-11-08 22:31:23', '0.49', '0.16', '18037078376', '汰渍洗衣粉 持久清洁净白去渍专用柠檬清新型5kg袋装', '1', '54.9', '天猫超市', '2017-11-03 21:20:18', '83477554324081760', NULL, 0, NULL),
(349, 0, 0, 0, '订单结算', '44.33', '2017-11-08 22:31:57', '7.09', '0', '36813419929', '乐巢加厚 可水洗 不掉色 丝毛地毯地垫客厅茶几卧室床边地毯', '1', '153', '乐巢地毯', '2017-11-03 20:48:49', '83422421410081760', NULL, 0, NULL),
(350, 0, 0, 0, '订单结算', '42.9', '2017-11-08 20:42:46', '2.15', '0', '520425651308', '天方香酥米方便面干吃面 香酥米零食 整箱30g*120包点心面碎碎面', '1', '49.9', '色彩生活馆', '2017-11-01 23:59:38', '82394453148907060', NULL, 0, NULL),
(351, 0, 0, 0, '订单结算', '39', '2017-11-08 20:42:54', '3.9', '0.2', '556015405855', '夫尼保罗男士秋衣秋裤套装纯棉青年打底棉毛衫全棉薄款保暖内衣男', '1', '118', '夫尼保罗旗舰店', '2017-10-31 16:27:05', '81590884101907060', NULL, 0, NULL),
(352, 0, 0, 0, '订单结算', '39', '2017-11-08 22:32:11', '3.9', '0.2', '556015405855', '夫尼保罗男士秋衣秋裤套装纯棉青年打底棉毛衫全棉薄款保暖内衣男', '1', '118', '夫尼保罗旗舰店', '2017-10-31 16:22:04', '81650303860081760', NULL, 0, NULL),
(353, 0, 0, 0, '订单结算', '59', '2017-10-31 11:59:55', '5.9', '0.59', '529490016681', 'theSAEM得鲜持久保湿不脱色口红韩国豆沙姨妈色哑光玻璃唇膏正品', '1', '128', 'thesaem得鲜旗舰店', '2017-10-28 09:43:25', '75270744250386514', NULL, 0, NULL),
(354, 0, 0, 0, '订单结算', '189', '2017-10-31 11:53:16', '0.95', '0.57', '528001221625', '联想G480 Y480 B480 N480 M490 B490 G490笔记本 4G 1600内存条', '1', '299', 'kingred金力得旗舰店', '2017-10-27 10:55:05', '79569287854907060', NULL, 0, NULL),
(355, 0, 0, 0, '订单结算', '4.59', '2017-11-06 08:07:10', '0.37', '0', '39003506378', '迷你园艺大三件套工具铁铲锹耙子铲耙园艺小铲子室内花卉盆栽松土', '1', '7.8', '大学生创业园艺梦之店', '2017-10-26 21:45:25', '79397395414081760', NULL, 0, NULL),
(356, 0, 0, 0, '订单结算', '17.25', '2017-11-06 08:07:10', '1.38', '0', '560428484000', '新款室内加仑盆清仓多肉塑料花盆简约树脂圆形大号绿萝盆栽种植盆', '2', '8.8', '大学生创业园艺梦之店', '2017-10-26 21:45:25', '79397395414081760', NULL, 0, NULL),
(357, 0, 0, 0, '订单结算', '16.8', '2017-11-04 10:35:27', '1.68', '0.05', '558964636624', 'RNX iPhone6Plus手机壳6s苹果翻盖式皮套i6保护套6p防摔六男女款', '1', '49', 'RNX旗舰店', '2017-10-24 20:17:55', '78407593895907060', NULL, 0, NULL),
(358, 0, 0, 0, '订单结算', '658', '2017-11-02 16:07:38', '32.9', '0', '547512225750', 'TRENDY 自制 新品 重磅复古时髦常青款 穿一辈子 经典米驼色风衣', '1', '688', 'TRENDYWU', '2017-10-24 10:37:00', '73319899113784630', NULL, 0, NULL),
(359, 0, 0, 0, '订单结算', '19.9', '2017-11-03 09:33:30', '5.97', '0.1', '555237358569', '幸福妈咪 厨房多功能土豆丝切丝器擦丝刨丝切片器插菜板切菜神器', '1', '158', 'smilemom幸福妈咪旗舰店', '2017-10-23 16:31:01', '77811615654081760', NULL, 0, NULL),
(360, 0, 0, 0, '订单结算', '39.99', '2017-11-02 16:58:11', '8', '0.12', '524089043984', '小熊煮蛋器蒸蛋器家用双层迷你小型早餐机煮蛋机自动断电煮鸡蛋器', '1', '139', '小熊宜家宜居专卖店', '2017-10-23 11:13:39', '77691886271081760', NULL, 0, NULL),
(361, 0, 0, 0, '订单结算', '29.9', '2017-10-26 08:30:04', '0.45', '0.15', '544846887793', '正品金纺柔顺剂樱花淡雅衣物护理剂液柔软剂防静电持久留香包邮', '1', '79.9', '邦航家居专营店', '2017-10-23 10:05:44', '72653053464386514', NULL, 0, NULL),
(362, 0, 0, 0, '订单结算', '32.9', '2017-10-25 08:29:24', '9.87', '0', '554268532126', '亲爽原木抽纸30包纸巾整箱批发面纸家用纸抽卫生纸餐巾纸特惠套装', '1', '35.9', '淘の乐购', '2017-10-23 10:00:53', '72651401193386514', NULL, 0, NULL),
(363, 0, 0, 0, '订单结算', '18.8', '2017-11-01 16:14:57', '1.88', '0.06', '41047193981', '奢姿iPhone6钢化膜苹果6s全屏覆盖水凝plus蓝光手机防摔6p玻璃4.7', '1', '19', '趣乐数码专营店', '2017-10-23 09:49:24', '77616285809943757', NULL, 0, NULL),
(364, 0, 0, 0, '订单结算', '19.11', '2017-10-23 10:59:01', '4.4', '0', '558758640688', '居家家 冬季马桶套马桶圈坐便套三件套 通用马桶坐垫座便套马桶垫', '1', '35', '居家家 您身边的居家伴侣', '2017-10-21 14:44:27', '76776705908081760', NULL, 0, NULL),
(365, 0, 0, 0, '订单结算', '11.27', '2017-10-23 10:59:02', '0.56', '0', '542471574210', '居家家 简易拖鞋鞋架浴室置物架 宿舍铁艺架子客厅家用鞋子收纳架', '1', '12', '居家家 您身边的居家伴侣', '2017-10-21 14:44:27', '76776705908081760', NULL, 0, NULL),
(366, 0, 0, 0, '订单结算', '14.7', '2017-10-23 10:59:01', '0.74', '0', '551966282629', '居家家煤气灶铝箔挡油板隔热板厨房炒菜隔油板家用灶台防溅油挡板', '2', '8.6', '居家家 您身边的居家伴侣', '2017-10-21 14:44:27', '76776705908081760', NULL, 0, NULL),
(367, 0, 0, 0, '订单结算', '3.75', '2017-10-23 10:59:01', '0.19', '0', '544190447838', '居家家 吸盘冰箱除臭竹炭包家用除味盒 活性炭去异味除臭剂除味剂', '1', '3.9', '居家家 您身边的居家伴侣', '2017-10-21 14:44:27', '76776705908081760', NULL, 0, NULL),
(368, 0, 0, 0, '订单结算', '11.33', '2017-10-23 10:59:01', '0.57', '0', '546810445881', '居家家 素色双层洗菜盆厨房沥水盆 塑料水果篮沥水篮洗菜篮子漏盆', '1', '11.8', '居家家 您身边的居家伴侣', '2017-10-21 14:44:27', '76776705908081760', NULL, 0, NULL),
(369, 0, 0, 0, '订单结算', '7.65', '2017-10-23 10:59:01', '0.38', '0', '557209781424', '居家家 多功能升降纸巾盒茶几抽纸盒 客厅桌面带牙签盒纸巾收纳盒', '1', '7.8', '居家家 您身边的居家伴侣', '2017-10-21 14:44:27', '76776705908081760', NULL, 0, NULL),
(370, 0, 0, 0, '订单结算', '19.11', '2017-10-23 10:59:01', '0.96', '0', '546664101413', '居家家木芒果防虫香包衣柜衣物玫瑰香囊室内房间卧室除味香薰香袋', '5', '3.9', '居家家 您身边的居家伴侣', '2017-10-21 14:44:27', '76776705908081760', NULL, 0, NULL),
(371, 0, 0, 0, '订单结算', '6.77', '2017-10-23 10:59:01', '0.34', '0', '520677250603', '居家家 定角磨刀器创意厨房小用品工具 家用神器磨菜刀用具磨刀石', '1', '7.8', '居家家 您身边的居家伴侣', '2017-10-21 14:44:27', '76776705908081760', NULL, 0, NULL),
(372, 0, 0, 0, '订单结算', '4.71', '2017-10-23 10:59:01', '0.24', '0', '558360143769', '居家家 亚克力圆形无痕透明双面胶70支 创意超粘强力防水小胶片贴', '1', '4.8', '居家家 您身边的居家伴侣', '2017-10-21 14:44:27', '76776705908081760', NULL, 0, NULL),
(373, 0, 0, 0, '订单结算', '13.23', '2017-10-23 10:59:01', '0.66', '0', '545947396522', '室内空气清新剂厕所除臭剂芳香剂家用卫生间除臭香薰卧室用清香剂', '1', '15.8', '居家家 您身边的居家伴侣', '2017-10-21 14:44:27', '76776705908081760', NULL, 0, NULL),
(374, 0, 0, 0, '订单结算', '23.03', '2017-10-23 10:59:02', '1.15', '0', '543907551165', '居家家 铁艺调料架调味品厨具收纳架 厨房落地架子双层收纳置物架', '1', '26.6', '居家家 您身边的居家伴侣', '2017-10-21 14:44:27', '76776705908081760', NULL, 0, NULL),
(375, 0, 0, 0, '订单结算', '7.55', '2017-10-23 10:59:02', '0.38', '0', '545473187381', '居家家鱼骨夏季凉拖鞋室内浴室地板防滑洗澡拖鞋男女情侣塑料托鞋', '1', '8.6', '居家家 您身边的居家伴侣', '2017-10-21 14:44:27', '76776705908081760', NULL, 0, NULL),
(376, 0, 0, 0, '订单结算', '10.59', '2017-10-23 10:59:01', '0.53', '0', '559529834045', '居家家 环保竹纤维本色纸杯 办公室一次性茶杯咖啡杯加厚奶茶杯子', '1', '10.8', '居家家 您身边的居家伴侣', '2017-10-21 14:44:27', '76776705908081760', NULL, 0, NULL),
(377, 0, 0, 0, '订单结算', '3.43', '2017-10-23 10:59:01', '0.17', '0', '558922876382', '居家家透明自粘贴纸灶台耐高温防油贴厨房瓷砖防油防水贴油烟墙贴', '1', '3.5', '居家家 您身边的居家伴侣', '2017-10-21 14:44:27', '76776705908081760', NULL, 0, NULL),
(378, 0, 0, 0, '订单结算', '29.4', '2017-10-21 14:23:35', '7.35', '0.15', '556881756530', '圆桌垫子pvc欧式防水防烫台布家用圆形茶几桌布客厅塑料胶垫圆形', '1', '64.8', '金雕家居用品旗舰店', '2017-10-16 22:12:41', '74374388869081760', NULL, 0, NULL),
(379, 0, 0, 0, '订单结算', '115', '2017-10-23 10:59:19', '4.03', '0', '559871289235', '全棉简约超柔水洗棉四件套纯棉床单被套床上用品1.5米1.8m床双人', '1', '699', '浅时光布艺家纺', '2017-10-16 16:02:44', '74308926298081760', NULL, 0, NULL),
(380, 0, 0, 0, '订单结算', '96', '2017-10-21 14:23:56', '9.6', '0.48', '557717663123', '南极人被子水洗棉被冬双人加厚保暖被芯被褥单人学生宿舍秋冬被子', '1', '399', '南极人岚惜专卖店', '2017-10-16 15:30:50', '74288094549081760', NULL, 0, NULL),
(381, 0, 0, 0, '订单结算', '29.8', '2017-10-21 14:24:15', '1.49', '0.15', '557855440788', '买一送一冬季棉拖鞋女卡通可爱室内家居家用防滑保暖厚底拖鞋男', '1', '88', '润柔旗舰店', '2017-10-16 14:59:21', '74218905199081760', NULL, 0, NULL),
(382, 0, 0, 0, '订单结算', '198', '2017-10-20 10:41:14', '19.8', '0.99', '539461934714', '风衣女中长款2017秋装新款韩版宽松红色大衣外套女装春秋季潮', '1', '360', '谜秀旗舰店', '2017-10-15 17:14:09', '68687161273386514', NULL, 0, NULL),
(383, 0, 0, 0, '订单结算', '74.9', '2017-10-26 16:20:42', '7.49', '0.75', '5031835628', '曼秀雷敦男士能量爽肤水120ml 保湿补水须后水舒缓肌肤 护肤品男', '1', '79.9', '曼秀雷敦旗舰店', '2017-10-15 17:05:31', '68763318534784630', NULL, 0, NULL),
(384, 0, 0, 0, '订单结算', '35.29', '2017-10-21 19:31:47', '0.53', '0.18', '521323204137', '地垫门垫进门脚垫门厅垫子家用卧室厨房浴室吸水防滑垫门口卫生间', '1', '74', '蓝海棠旗舰店', '2017-10-15 09:08:35', '68418469969017630', NULL, 0, NULL),
(385, 0, 0, 0, '订单结算', '24.8', '2017-10-21 19:31:47', '0.74', '0.12', '553962178530', '厨房地垫防滑防油厕所浴室门厅进门脚垫吸水门垫长条卧室床边垫子', '1', '52', '蓝海棠旗舰店', '2017-10-15 09:08:35', '68418469969017630', NULL, 0, NULL),
(386, 0, 0, 0, '订单结算', '42.91', '2017-10-21 19:31:47', '0.64', '0.21', '536427833509', '简约现代加厚圆形地毯客厅茶几卧室床边毯吊篮电脑椅子防滑毯定制', '1', '90', '蓝海棠旗舰店', '2017-10-15 09:08:35', '68418469969017630', NULL, 0, NULL),
(387, 0, 0, 0, '订单结算', '79', '2017-10-18 09:24:28', '4.74', '0.4', '556074094759', '儿童运动鞋女童鞋春秋季2017新款中大童休闲鞋女童小白鞋板鞋真皮', '1', '156', '乐飞虎旗舰店', '2017-10-13 17:23:34', '67732026291386514', NULL, 0, NULL),
(388, 0, 0, 0, '订单结算', '1280', '2017-10-24 14:02:58', '38.4', '0', '555198677362', '简约现代多功能烤漆茶几创意家具 北欧小户型客厅方形茶桌茶台', '1', '2560', '卓品家具', '2017-10-12 13:15:12', '67083064467017630', NULL, 0, NULL),
(389, 0, 0, 0, '订单结算', '34.24', '2018-01-10 11:35:28', '2.05', '0', '540453796133', '得牌实木家具修补膏1000g填缝剂木器缝隙填充膏地板裂缝修补腻子', '1', '49.9', '得牌水性腻子 汉研化工', '2018-01-05 23:26:06', '111223822952081760', NULL, 0, NULL),
(390, 0, 0, 0, '订单结算', '163.4', '2018-01-10 11:33:19', '14.71', '0.82', '35976777299', '波奇网宠物狗狗用品吸水垫宠物尿片除臭兔子尿垫狗尿不湿猫垫尿片', '6', '60', '波奇网旗舰店', '2018-01-05 23:11:54', '111221470542081760', NULL, 0, NULL),
(391, 0, 0, 0, '订单结算', '37.9', '2018-01-10 11:35:15', '0.57', '0', '36562841817', '电动车挡风被冬季加绒加厚加大电瓶车摩托车挡风罩护膝电车保暖冬', '1', '180', '暖途旗舰店', '2018-01-03 20:40:13', '110309789693081760', NULL, 0, NULL),
(392, 0, 0, 0, '订单结算', '129', '2018-01-10 11:34:30', '3.23', '1.29', '561465578745', '虾鲜活海鲜水产活虾青岛大虾鲜活超大基围虾冻虾新鲜海虾青虾4斤', '1', '179', '缤鲜旗舰店', '2018-01-03 16:55:58', '110156967027081760', NULL, 0, NULL),
(393, 0, 0, 0, '订单结算', '121', '2018-01-10 11:35:00', '14.64', '0.61', '551759596621', '尾戒女日韩简约925纯银戒指个性礼物刻字莫比乌斯食指环情侣对戒', '1', '218', '初典饰品旗舰店', '2017-12-31 13:06:14', '108886968733081760', NULL, 0, NULL),
(394, 0, 0, 0, '订单结算', '26.8', '2018-01-05 17:38:05', '0.4', '0.13', '545985626295', '车载手机支架出风口吸盘卡扣式磁性汽车内用导航多功能通用支撑架', '1', '120', '飙韵邦容专卖店', '2017-12-26 14:21:27', '101658425752784630', NULL, 0, NULL),
(395, 0, 0, 0, '订单结算', '23.8', '2018-01-05 16:52:51', '1.19', '0.12', '563258207437', 'PU皮裤女2017新款高腰秋冬季外穿加绒加厚保暖小脚裤修身打底裤子', '1', '89', '久蕾旗舰店', '2017-12-26 14:09:56', '107012763532907060', 1516187068, 1, 13),
(396, 0, 0, 0, '订单结算', '69', '2018-01-05 15:35:53', '4.49', '0', '558172952313', '中年休闲裤男士加绒加厚款秋冬季中老年人宽松爸爸西裤子40-50岁', '2', '218', '古月传说店', '2017-12-26 14:06:30', '107012287261907060', 1516187091, 1, 12),
(397, 0, 0, 0, '订单结算', '413.98', '2018-01-05 13:32:29', '43.47', '2.07', '45761058363', '蓝豚宠物吹水机宠物专用狗狗吹风机大功率静音大小型犬吹毛机臭氧', '1', '780', '蓝豚旗舰店', '2017-12-26 11:28:48', '107018529020081760', NULL, 0, NULL),
(398, 0, 0, 0, '订单结算', '17.02', '2018-01-05 13:32:31', '3.4', '0.09', '551087481869', '蓝豚狗狗沐浴露泰迪金毛萨摩耶宠物用品猫咪幼犬洗澡香波杀菌除臭', '1', '49', '蓝豚旗舰店', '2017-12-26 11:28:48', '107018529020081760', NULL, 0, NULL),
(399, 0, 0, 0, '订单结算', '9.71', '2017-12-29 13:19:29', '0.49', '0', '556784067834', '后跟贴防磨脚神器半码垫不跟脚后跟帖防掉加厚鞋贴高跟鞋垫鞋跟贴', '1', '9.9', '蓝韵家', '2017-12-26 10:22:43', '115948920258386514', NULL, 0, NULL),
(400, 0, 0, 0, '订单结算', '25.2', '2017-12-27 08:12:53', '1.26', '0', '561765957330', '小米6耳机入耳式mix2原装正品note3手机专用六重低音type-c版降噪', '1', '76', '夏至未至 原创持续上新', '2017-12-25 13:16:15', '115703528626386514', NULL, 0, NULL),
(401, 0, 0, 0, '订单结算', '133', '2018-01-04 14:08:06', '6.65', '0', '557275692864', '中老年冬装男棉衣中长款加绒加厚棉服中年冬季外套爸爸装PU皮棉袄', '1', '309', '齐霸男装', '2017-12-25 12:31:41', '106665589540907060', NULL, 0, NULL),
(402, 0, 0, 0, '订单结算', '20.9', '2018-01-03 16:37:39', '0.42', '0.1', '12844739262', '伊丽莎白圈 狗狗项圈狗头套猫项圈宠物狗脖套猫头套防咬圈狗用品', '1', '26.8', '迪曼宠物用品专营店', '2017-12-25 11:38:10', '106657216123081760', NULL, 0, NULL),
(403, 0, 0, 0, '订单结算', '40', '2018-01-03 16:37:41', '6', '0.2', '18783840336', '金盾皮特芬喷剂狗狗皮肤病真菌螨虫泰迪皮特分宠物除螨猫癣猫藓', '1', '59.8', '迪曼宠物用品专营店', '2017-12-25 11:38:10', '106657216123081760', NULL, 0, NULL),
(404, 0, 0, 0, '订单结算', '150', '2017-12-28 19:02:05', '22.5', '0', '560192080654', '2017秋冬季新款韩版甜美学生刺绣呢子大衣女中长款加厚毛呢外套潮', '1', '155', '艾米恋美衣', '2017-12-22 16:37:40', '105697910851687464', NULL, 0, NULL),
(405, 0, 0, 0, '订单结算', '58.41', '2017-12-31 13:17:36', '2.92', '0', '538015971104', '秋冬新款韩版简约半高圆领长袖套头毛衣宽松纯色针织衫打底衫女潮', '1', '59', 'TEMEET遇见 STUDIO', '2017-12-20 22:57:05', '105039208713687464', NULL, 0, NULL),
(406, 0, 0, 0, '订单结算', '64.35', '2017-12-31 13:17:38', '3.22', '0', '541615294579', '秋冬中长款针织裙纯色松紧腰高腰百褶裙显瘦大码A字半身裙', '1', '78', 'TEMEET遇见 STUDIO', '2017-12-20 22:57:05', '105039208713687464', NULL, 0, NULL),
(407, 0, 0, 0, '订单结算', '64.68', '2017-12-31 09:02:44', '3.88', '0', '522582189521', '黑色外穿一体踩脚打底裤秋冬款女士瘦腿加薄绒加厚中高腰弹力百搭', '1', '95', 'Fox zebra 独立设计', '2017-12-20 19:57:08', '104952773154081760', NULL, 0, NULL),
(408, 0, 0, 0, '订单结算', '55', '2017-12-24 00:08:03', '8.25', '0', '40296598435', '大人的科学LED四季投影星空灯12星座旋转满天星星灯圣诞生日礼物', '1', '98', '爱尚创意924', '2017-12-19 14:37:41', '99630666990784630', NULL, 0, NULL),
(409, 0, 0, 0, '订单结算', '14.5', '2017-12-21 08:08:23', '4.35', '0', '520347331442', '冬季一次性口罩印花女男透气防尘个性时尚可爱女神韩版黑色防雾霾', '1', '38', '向天歌口罩品牌店', '2017-12-19 11:47:42', '99484505102386514', NULL, 0, NULL),
(410, 0, 0, 0, '订单结算', '20.9', '2018-01-03 08:46:19', '0.31', '0.1', '549122106774', '狗链子 中型大型犬狗狗牵引绳金毛拉布拉多遛狗绳项圈P链狗狗用品', '1', '32.5', '疯狂的小狗旗舰店', '2017-12-18 20:38:47', '104037257598081760', NULL, 0, NULL),
(411, 0, 0, 0, '订单结算', '35.8', '2017-12-21 23:50:35', '10.74', '0.18', '558413427349', '圣诞节气球装饰幼儿园教室背景墙酒店商场店铺场景布置铝膜气球', '1', '39.8', '串串喜旗舰店', '2017-12-18 16:22:27', '99087996111784630', NULL, 0, NULL),
(412, 0, 0, 0, '订单结算', '123', '2017-12-20 00:40:32', '36.9', '0', '560680137316', '圣诞树1.8米圣诞节装饰品豪华加密圣诞树套餐1.5米装饰套装2.1米', '1', '347', '加福圣诞', '2017-12-18 16:08:47', '99080268293784630', NULL, 0, NULL),
(413, 0, 0, 0, '订单结算', '29.9', '2018-01-02 22:12:02', '7.48', '0', '560771052447', '圣诞节装饰品加密1.5米圣诞树套餐1.8米装饰树2.1米3米松针树套装', '1', '49.9', '凯乐圣诞用品', '2017-12-18 13:21:31', '103778791511774396', NULL, 0, NULL),
(414, 0, 0, 0, '订单结算', '279', '2017-12-23 14:42:06', '13.95', '1.4', '544437065296', 'CHARLES＆KEITH 马鞍包 CK2-80780293 欧美复古风单肩包斜挎包', '1', '369', 'Charles Keith官方旗舰店', '2017-12-16 13:03:47', '102834909244824093', NULL, 0, NULL),
(415, 0, 0, 0, '订单结算', '194.88', '2017-12-21 23:50:49', '2.92', '0', '531159294442', '星巴克桌椅复古吧台高脚椅高吧凳实木桌椅铁艺椅酒吧桌椅小圆桌方', '2', '170', '三居室铁艺家具', '2017-12-15 22:29:25', '97749459540784630', NULL, 0, NULL),
(416, 0, 0, 0, '订单结算', '46', '2017-12-23 21:41:05', '1.38', '0.23', '543621497527', '情侣戒指男 女一对925纯银日韩简约单身开口素圈活口食指刻字对戒', '1', '148', '欧莱帝饰品旗舰店', '2017-12-13 22:01:11', '101730786530952681', NULL, 0, NULL),
(417, 0, 0, 0, '订单结算', '49', '2017-12-18 21:33:23', '1.47', '0.25', '561545275951', '925银莫比乌斯情侣戒指玫瑰金食指素戒尾戒日韩简约一对男女对戒', '1', '138', '欧莱帝饰品旗舰店', '2017-12-13 21:59:41', '101683353894952681', NULL, 0, NULL),
(418, 0, 0, 0, '订单结算', '37.24', '2017-12-18 21:33:12', '3.72', '0', '559100993155', '变形戒指男士潮版个性潮人钛钢创意食指环尾戒简约刻字指环手饰品', '1', '38', 'e饰潮人', '2017-12-13 21:58:10', '101640739450952681', NULL, 0, NULL),
(419, 0, 0, 0, '订单结算', '35.28', '2017-12-29 09:42:45', '1.76', '0', '524466355198', 'Barpa泰国white芦荟胶鼻贴去黑头水粉刺清洁毛孔 温和撕拉 送棉签', '2', '18', '巴巴爸爸 Barpa 护肤美妆', '2017-12-13 16:46:49', '101567657402081760', NULL, 0, NULL),
(420, 0, 0, 0, '订单结算', '11.57', '2017-12-28 16:58:22', '4.51', '0', '542706853454', '新款【1200贴】网状蕾丝双眼皮贴隐形 自然双眼皮 美目贴神器包邮', '1', '12', '珍珠美妆 专注双眼皮贴', '2017-12-13 16:44:28', '101568217053081760', NULL, 0, NULL),
(421, 0, 0, 0, '订单结算', '19.11', '2017-12-28 16:58:25', '7.62', '0', '533793693331', '日本Lucky Trendy单面自然隐形素肌双眼皮贴无痕网纹肉色透气30对', '1', '25', '珍珠美妆 专注双眼皮贴', '2017-12-13 16:44:28', '101568217053081760', NULL, 0, NULL),
(422, 0, 0, 0, '订单结算', '69.58', '2017-12-31 01:01:46', '3.48', '0', '560432540751', '冬季新款毛呢休闲裤男士修身直筒韩版青少年学生加厚小脚哈伦裤子', '1', '139', '子俊男装', '2017-12-12 12:06:08', '111779133065081760', NULL, 0, NULL),
(423, 0, 0, 0, '订单结算', '50.81', '2017-12-16 10:45:26', '5.08', '0', '559968103889', '全棉加厚磨毛双人床单单件单人学生纯棉保暖欧式圆角被单品秋冬季', '1', '116', '安丽娜家纺 专注品质与生活', '2017-12-12 09:01:35', '111375374909386514', NULL, 0, NULL),
(424, 0, 0, 0, '订单结算', '26.8', '2017-12-22 13:20:16', '0.8', '0.13', '554842308398', '南极人袜子女纯棉中筒袜女士短袜浅口棉袜秋冬款防臭韩国可爱女袜', '1', '99', '嘉士内衣专营店', '2017-12-11 16:07:21', '109065455935081760', NULL, 0, NULL),
(425, 0, 0, 0, '订单结算', '26.8', '2017-12-22 10:16:36', '0.8', '0.13', '555349171469', '南极人袜子男士棉袜秋冬季中筒商务袜防臭吸汗纯棉短袜加厚款船袜', '1', '98', '嘉士内衣专营店', '2017-12-11 16:06:12', '109039079675081760', NULL, 0, NULL),
(426, 0, 0, 0, '订单结算', '23.5', '2017-12-13 17:13:26', '1.18', '0', '546840506413', '不锈钢加厚KTV酒吧欧式香槟桶冰块粒桶大号虎头啤酒冰桶红酒冰桶', '1', '35', '星上奕酒吧KTV用品批发', '2017-12-10 14:59:03', '108004677555784630', NULL, 0, NULL),
(427, 0, 0, 0, '订单结算', '21.9', '2017-12-11 15:49:54', '2.19', '0.11', '557051311675', '棉鞋女秋冬季2017新款学生保暖加绒韩版女鞋毛毛鞋平底百搭豆豆鞋', '1', '88', 'oiu旗舰店', '2017-12-10 12:19:15', '107995126806081760', NULL, 0, NULL),
(428, 0, 0, 0, '订单结算', '16.9', '2017-12-10 20:39:27', '0.51', '0.08', '547716437718', 'kdv俄罗斯紫皮糖kpokaht巧克力糖进口糖果零食喜糖批发散装食品', '1', '88', '秋和食品专营店', '2017-12-06 22:48:40', '105344844198708212', NULL, 0, NULL),
(429, 0, 0, 0, '订单结算', '13.8', '2017-12-16 14:25:01', '4.25', '0.07', '40170473899', '净得丽 粘毛器10cm可撕式滚筒衣服粘尘纸去毛刷卷纸补充装刷毛器', '1', '92', '尚知语家居专营店', '2017-12-06 13:27:11', '99242315992824093', NULL, 0, NULL),
(430, 0, 0, 0, '订单结算', '8.99', '2017-12-08 19:48:17', '0.45', '0.04', '537613646506', '植护原木抽纸6包面巾纸家庭装餐巾纸家用卫生纸纸巾纸抽整箱批发', '1', '45', '植护优真专卖店', '2017-12-06 07:30:32', '104733771330038064', NULL, 0, NULL),
(431, 0, 0, 0, '订单结算', '12.9', '2017-12-11 15:48:54', '2.58', '0.04', '534133526314', '苹果电脑12寸macbook Air13 11键盘膜Mac保护膜pro15笔记本快捷键', '1', '68', '卡美琪数码专营店', '2017-12-05 22:52:53', '104528446788081760', NULL, 0, NULL),
(432, 0, 0, 0, '订单结算', '17', '2017-12-11 15:48:10', '0.85', '0', '561868930290', '持久双插手热水袋充电防爆暖手宝毛绒暖宝宝随身可爱保温已注水', '1', '35', '缘起小屋', '2017-12-05 21:37:17', '104548187039081760', NULL, 0, NULL),
(433, 0, 0, 0, '订单结算', '169', '2017-12-16 11:32:03', '50.7', '0.51', '548898264843', 'Saky/舒客舒克成人声波电动牙刷 美白去渍充电电动牙刷G231X', '1', '399', 'saky舒客薇美姿专卖店', '2017-12-05 19:07:40', '99120095659824093', NULL, 0, NULL),
(434, 0, 0, 0, '订单结算', '169', '2017-12-07 21:58:21', '50.7', '0.51', '548898264843', 'Saky/舒客舒克成人声波电动牙刷 美白去渍充电电动牙刷G231X', '1', '399', 'saky舒客薇美姿专卖店', '2017-12-05 19:06:12', '99170381949748595', NULL, 0, NULL),
(435, 0, 0, 0, '订单结算', '359', '2017-12-05 21:41:57', '5.39', '1.08', '528626631173', 'Midea/美的 M1-L213C 微波炉智能21L迷你转盘式多功能家用正品', '1', '599', 'midea楚鹰专卖店', '2017-12-02 18:51:36', '101672139475907060', NULL, 0, NULL),
(436, 0, 0, 0, '订单结算', '139', '2017-12-11 16:18:52', '2.09', '0', '557600469314', '滑雪镜成人近视雪地护目镜装备户外登山双层防雾雪镜儿童滑雪眼镜', '1', '312', 'RAMBO兰博户外官方店', '2017-11-30 21:27:50', '99681567821784630', NULL, 0, NULL),
(437, 0, 0, 0, '订单结算', '139', '2017-12-11 16:18:51', '2.09', '0', '557600469314', '滑雪镜成人近视雪地护目镜装备户外登山双层防雾雪镜儿童滑雪眼镜', '1', '312', 'RAMBO兰博户外官方店', '2017-11-30 21:27:50', '99681567821784630', NULL, 0, NULL),
(438, 0, 0, 0, '订单结算', '148', '2017-12-06 19:24:55', '7.4', '0.74', '561754673558', '外套男士冬季棉衣2017新款个性潮棉袄精神小伙冬装韩版面包服棉服', '1', '230', '法宾鄂旗舰店', '2017-11-30 19:37:36', '98198754232774396', NULL, 0, NULL),
(439, 0, 0, 0, '订单结算', '16.8', '2017-12-12 09:12:45', '2.57', '0', '551312527511', '联想华硕戴尔通用无线鼠标 笔记本台式电脑 家用办公苹果女生无限', '1', '178', '夭猫连锁店丨金牌店铺', '2017-11-30 15:22:29', '99274080462451029', NULL, 0, NULL),
(440, 0, 0, 0, '订单结算', '9.9', '2017-12-05 09:59:40', '2.97', '0.05', '18189361007', '明爵 平底锅不粘锅无油烟锅牛排煎锅 单身小炒锅电磁炉用锅具煎蛋', '1', '124.5', '明爵旗舰店', '2017-11-30 11:03:32', '99040584246081760', NULL, 0, NULL),
(441, 0, 0, 0, '订单结算', '26.07', '2017-12-05 09:59:53', '1.3', '0', '559794642527', '衡阳特产鸡蛋豆腐鲜蛋豆腐日本豆腐蛋制玉子豆腐铁板红烧麻辣烫', '1', '38.8', '物美价廉乡村味', '2017-11-30 10:58:05', '99129683700081760', NULL, 0, NULL),
(442, 0, 0, 0, '订单结算', '147', '2017-12-05 10:00:08', '7.35', '0', '41414580474', '天天特价青岛大虾鲜活海鲜水产新鲜野生海捕对虾海虾基围虾大活虾', '2', '99', '青岛卖鱼郎', '2017-11-30 10:48:54', '99121339445081760', NULL, 0, NULL),
(443, 0, 0, 0, '订单结算', '58.41', '2017-12-05 10:00:08', '2.92', '0', '520591382461', '青岛特产野生红岛蛤蜊肉新鲜鲜活蛤蜊现剥250g冷冻发货干净无沙', '4', '29.8', '青岛卖鱼郎', '2017-11-30 10:48:54', '99121339445081760', NULL, 0, NULL),
(444, 0, 0, 0, '订单结算', '58', '2017-12-05 10:00:23', '1.16', '0.29', '553764287328', '测犬瘟细小试纸狗瘟病毒狗狗测试纸cpv宠物小狗cdv检测犬瘟热套装', '3', '58', '迪曼宠物用品专营店', '2017-11-29 14:45:04', '98458048057081760', NULL, 0, NULL),
(445, 0, 0, 0, '订单结算', '48', '2017-11-30 10:59:55', '14.4', '0.24', '555552099146', '法芙乐 生巧克力礼盒装送女朋友手工抹茶松露零食圣诞节生日礼物', '1', '149', '法芙乐旗舰店', '2017-11-29 12:17:47', '98344508113081760', NULL, 0, NULL),
(446, 0, 0, 0, '订单结算', '55.86', '2017-12-05 10:00:36', '1.68', '0', '559174764665', '泰迪比熊博美金毛拉布拉多萨摩哈士奇阿拉边牧宠物秋冬狗狗衣服厚', '1', '66', 'My萌宠物用品', '2017-11-28 12:33:53', '97671643088081760', NULL, 0, NULL),
(447, 0, 0, 0, '订单结算', '11.6', '2017-12-03 14:32:50', '0.58', '0.06', '42689678191', 'NEWLINKER 围嘴 纯棉婴儿儿童口水兜吸水宝宝口水巾 围兜全棉饭兜', '1', '39', 'newlinker旗舰店', '2017-11-23 12:28:59', '93694271189081760', NULL, 0, NULL),
(448, 0, 0, 0, '订单结算', '17.4', '2017-12-03 14:32:50', '0.87', '0.09', '555800542569', '婴儿袜子春秋季初生男女宝宝彩棉松口袜护脚套0-1岁新生儿用品', '3', '19', 'newlinker旗舰店', '2017-11-23 12:28:59', '93694271189081760', NULL, 0, NULL),
(449, 0, 0, 0, '订单结算', '66.7', '2017-12-03 14:32:50', '3.34', '0.33', '523764811571', '初生婴儿棉衣服秋冬季连体衣加厚新生儿满月保暖哈衣爬服加厚棉袄', '1', '588', 'newlinker旗舰店', '2017-11-23 12:28:59', '93694271189081760', NULL, 0, NULL),
(450, 0, 0, 0, '订单结算', '54.14', '2017-12-03 14:32:50', '2.71', '0.27', '44281423132', '2017春秋婴幼儿衣服宝宝爬服纯棉婴儿连体衣新生儿哈衣0到3个月', '1', '199', 'newlinker旗舰店', '2017-11-23 12:28:59', '93694271189081760', NULL, 0, NULL),
(451, 0, 0, 0, '订单结算', '7.73', '2017-12-03 14:32:50', '0.39', '0.04', '42720737220', 'newlinker有机棉 婴儿保暖鞋套新生儿宝宝脚套加厚护脚秋冬季', '1', '29', 'newlinker旗舰店', '2017-11-23 12:28:59', '93694271189081760', NULL, 0, NULL),
(452, 0, 0, 0, '订单结算', '11.6', '2017-12-03 14:32:51', '0.58', '0.06', '42736420470', '有机彩棉婴儿棉帽子新生儿宝宝胎帽婴儿帽子春秋满月帽男女宝宝', '1', '49', 'newlinker旗舰店', '2017-11-23 12:28:59', '93694271189081760', NULL, 0, NULL),
(453, 0, 0, 0, '订单结算', '120.83', '2017-12-03 14:32:50', '6.04', '0.6', '554271996668', '彩棉袄婴儿连体衣服加厚春秋冬季0岁3个月宝宝新生儿棉衣外出服', '1', '599', 'newlinker旗舰店', '2017-11-23 12:28:59', '93694271189081760', NULL, 0, NULL),
(454, 0, 0, 0, '订单结算', '33.5', '2017-11-25 18:06:28', '7.04', '0', '557907568180', '靴下物580D中压天鹅绒连裤袜秋冬中厚显瘦婴儿绒打底袜美腿袜子女', '1', '58', '靴下物', '2017-11-23 10:47:48', '93497540869386514', NULL, 0, NULL),
(455, 0, 0, 0, '订单结算', '33.5', '2017-11-25 18:06:27', '7.04', '0', '557907568180', '靴下物580D中压天鹅绒连裤袜秋冬中厚显瘦婴儿绒打底袜美腿袜子女', '1', '58', '靴下物', '2017-11-23 10:47:48', '93497540869386514', NULL, 0, NULL),
(456, 0, 0, 0, '订单结算', '108', '2017-11-24 20:10:50', '5.4', '0.32', '557952753814', '落地遥控小太阳取暖器家用烤火炉节能电暖气立式暖风机速热电热扇', '1', '128', '骆驼望晓源专卖店', '2017-11-22 16:01:03', '96482719905774396', NULL, 0, NULL),
(457, 0, 0, 0, '订单结算', '108', '2017-12-02 18:36:30', '5.4', '0.32', '557952753814', '落地遥控小太阳取暖器家用烤火炉节能电暖气立式暖风机速热电热扇', '1', '128', '骆驼望晓源专卖店', '2017-11-22 16:00:56', '93166669752837370', NULL, 0, NULL),
(458, 0, 0, 0, '订单结算', '150', '2017-12-02 13:29:49', '3.75', '0', '548522197697', '洁云平板卫生纸400张42包整箱家用厕纸手纸草纸江浙沪皖包邮', '1', '158', '优梵家居', '2017-11-22 13:20:20', '92843656870081760', NULL, 0, NULL),
(459, 0, 0, 0, '订单结算', '67.62', '2017-12-01 19:25:38', '13.52', '0', '560542647477', '羽绒棉马甲女短款原宿韩版2017秋冬加厚学生面包服百搭坎肩马夹潮', '1', '109', '大浪家 潮流休闲女装', '2017-11-21 10:43:07', '92000719969081760', NULL, 0, NULL),
(460, 0, 0, 0, '订单结算', '25.29', '2017-12-01 13:20:04', '0.76', '0', '557579894118', '洁柔手帕纸 餐巾纸小包纸巾 可湿水面巾纸古龙水香面纸超迷你72包', '1', '33.9', '双福百货批发', '2017-11-20 23:22:45', '91728670166081760', NULL, 0, NULL),
(461, 0, 0, 0, '订单结算', '14.8', '2017-12-01 08:41:33', '2.96', '0.07', '524843804501', '那芙宠物消毒液狗狗除臭剂杀菌消毒环境除臭猫去尿味香水除味用品', '2', '50', '缘宠宠物用品专营店', '2017-11-20 23:03:47', '91712738410907060', NULL, 0, NULL),
(462, 0, 0, 0, '订单结算', '49.9', '2017-12-01 17:22:54', '5.49', '0.25', '558542523051', '清沐纯子餐厅纸巾批发抽纸家庭装整箱特价50包抽取式家用无香面纸', '1', '199', '清沐纯子旗舰店', '2017-11-20 22:51:35', '91662224924081760', NULL, 0, NULL),
(463, 0, 0, 0, '订单结算', '99', '2017-11-30 13:41:24', '3.47', '0', '559632985712', '【主播定制】简约1.8m1.5米2.0床单被套双人北欧4件套ins', '1', '498', '浅时光布艺家纺', '2017-11-20 10:46:31', '91158927189081760', NULL, 0, NULL),
(464, 0, 0, 0, '订单结算', '109', '2017-11-30 13:06:36', '2.18', '0.55', '541898027792', '抗菌 加厚夹棉床笠单件床垫保护套防滑加棉床罩床套子1.5米1.8m米', '1', '218', '金贝壳家纺旗舰店', '2017-11-20 10:43:05', '90942233788081760', NULL, 0, NULL),
(465, 0, 0, 0, '订单结算', '43', '2017-11-29 09:27:38', '3.44', '0', '18170331035', '阳台客厅壁挂式吊篮花架 挂墙上垂吊吊兰花盆架 挂壁悬挂花篮架', '1', '43', '顶峰铁制饰品工艺厂', '2017-11-19 00:00:04', '90304507160081760', NULL, 0, NULL),
(466, 0, 0, 0, '订单结算', '12.8', '2017-11-22 01:53:56', '0.26', '0.06', '16612740369', '宠物毯子毛毯狗狗被子狗垫子床垫猫棉垫泰迪窝垫狗垫用品冬季保暖', '1', '21.5', '华元宠物用品专营店', '2017-11-18 14:01:22', '95691240621952681', NULL, 0, NULL),
(467, 0, 0, 0, '订单结算', '8.8', '2017-11-22 01:53:55', '0.18', '0.04', '10649162395', '狗狗指甲剪刀猫咪指甲剪宠物指甲钳泰迪金毛中小型犬专用剪指甲刀', '1', '36', '华元宠物用品专营店', '2017-11-18 14:01:22', '95691240621952681', NULL, 0, NULL),
(468, 0, 0, 0, '订单结算', '23.9', '2017-11-22 01:53:55', '0.48', '0.12', '15472733204', '誉丰 狗狗零食除臭狗饼干幼犬磨牙棒洁齿除口臭泰迪比熊宠物补钙', '1', '30', '华元宠物用品专营店', '2017-11-18 14:01:22', '95691240621952681', NULL, 0, NULL),
(469, 0, 0, 0, '订单结算', '5.1', '2017-11-22 01:53:55', '0.1', '0.03', '538157066663', '泰迪狗狗衣服秋冬装比熊博美雪纳瑞法斗小狗小型幼犬宠物四脚棉衣', '1', '49.8', '华元宠物用品专营店', '2017-11-18 14:01:22', '95691240621952681', NULL, 0, NULL),
(470, 0, 0, 0, '订单结算', '16.8', '2017-11-22 01:53:55', '0.34', '0.08', '17882270303', '狗狗毛巾仿鹿皮强力吸水宠物大号擦泰迪金毛浴巾猫咪洗澡沐浴用品', '1', '16.8', '华元宠物用品专营店', '2017-11-18 14:01:22', '95691240621952681', NULL, 0, NULL),
(471, 0, 0, 0, '订单结算', '5', '2017-11-22 01:53:56', '0.1', '0.03', '547158618492', '雪貂宠物消毒液泰迪祛味猫砂除臭剂狗狗杀菌喷雾猫咪去尿味除狗味', '1', '39', '华元宠物用品专营店', '2017-11-18 14:01:22', '95691240621952681', NULL, 0, NULL),
(472, 0, 0, 0, '订单结算', '19', '2017-11-22 01:53:56', '0.38', '0.1', '536898042608', '狗狗猫咪毛毯狗窝狗垫毯子冬天被子猫用泰迪保暖宠物用品四季通用', '1', '19', '华元宠物用品专营店', '2017-11-18 14:01:22', '95691240621952681', NULL, 0, NULL),
(473, 0, 0, 0, '订单结算', '44.8', '2017-11-22 01:53:56', '0.9', '0.22', '15221146230', '狗狗沐浴露雪貂泰迪金毛萨摩耶专用杀菌除臭猫洗澡液香波宠物用品', '1', '96', '华元宠物用品专营店', '2017-11-18 14:01:22', '95691240621952681', NULL, 0, NULL),
(474, 0, 0, 0, '订单结算', '145.61', '2017-11-18 20:23:01', '2.18', '0.73', '545907561297', 'K9黄金美毛海藻粉升级配方 宠物狗护肤增色亮黑鼻头泰迪法牛金毛', '1', '230', 'k9superhealth旗舰', '2017-11-16 13:07:12', '88570690185081760', NULL, 0, NULL),
(475, 0, 0, 0, '订单结算', '82.39', '2017-11-18 20:23:01', '1.24', '0.41', '545994252572', 'K9活性益生菌整肠除口臭配方 宠物狗调理肠胃助消化改善拉稀软便', '1', '130', 'k9superhealth旗舰', '2017-11-16 13:07:12', '88570690185081760', NULL, 0, NULL),
(476, 0, 0, 0, '订单结算', '94', '2017-11-18 20:23:19', '1.41', '0.47', '546026895208', 'K9宠物羊奶粉 进口奶源低敏 宠物幼犬狗猫通用 替代母乳增强免疫', '1', '150', 'k9superhealth旗舰', '2017-11-16 13:06:45', '88452669108081760', NULL, 0, NULL),
(477, 0, 0, 0, '订单结算', '68', '2017-11-20 08:49:25', '1.36', '0.34', '546727820934', '一纸花约松露抹茶零食巧克力礼盒装送女友情人节礼物（代可可脂）', '1', '208', '一纸花约旗舰店', '2017-11-16 11:47:30', '88610535801386514', NULL, 0, NULL),
(478, 0, 0, 0, '订单结算', '68', '2017-11-20 12:28:14', '1.36', '0.34', '546727820934', '一纸花约松露抹茶零食巧克力礼盒装送女友情人节礼物（代可可脂）', '1', '208', '一纸花约旗舰店', '2017-11-16 10:35:42', '88424976733907060', NULL, 0, NULL),
(479, 0, 0, 0, '订单结算', '79.9', '2017-11-30 10:59:27', '23.97', '0.4', '35690502177', '泰迪博美狗窝猫咪窝小狗房子宠物窝可拆洗可拆卸别墅四季狗屋猫窝', '1', '339', '麦德豪宠物用品旗舰店', '2017-11-15 09:22:22', '87902163831081760', NULL, 0, NULL),
(480, 0, 0, 0, '订单结算', '111.57', '2017-11-18 13:44:42', '5.58', '0', '559496430611', '狗围栏泰迪小型犬中型犬金毛大型犬狗狗笼子小狗栅栏兔子宠物围栏', '1', '118', '宠而美宠物用品生活馆', '2017-11-15 09:01:38', '95009947841952681', NULL, 0, NULL),
(481, 0, 0, 0, '订单结算', '9.36', '2017-11-18 13:44:42', '0.47', '0', '558551415979', '狗梳子狗毛梳泰迪金毛小型犬针梳刷子猫咪梳子开结梳宠物狗狗用品', '1', '9.9', '宠而美宠物用品生活馆', '2017-11-15 09:01:38', '95009947841952681', NULL, 0, NULL),
(482, 0, 0, 0, '订单结算', '14.61', '2017-11-18 12:41:11', '0.73', '0', '18834789147', '狗狗牵引绳一体训狗绳泰迪金毛小中大型犬p链狗链尼龙绳加粗用品', '1', '29', '环球宝贝宠物店', '2017-11-14 23:26:35', '95036209698952681', NULL, 0, NULL),
(483, 0, 0, 0, '订单结算', '4.81', '2017-11-18 12:41:11', '0.24', '0', '550404176579', '宠物狗狗玩具耐咬磨牙发声尖叫惨叫鸡泰迪金毛咬绳飞盘训练狗用品', '1', '4.9', '环球宝贝宠物店', '2017-11-14 23:26:35', '95036209698952681', NULL, 0, NULL),
(484, 0, 0, 0, '订单结算', '4.41', '2017-11-18 12:41:11', '0.22', '0', '550487779000', '宠物狗狗玩具铃铛球天然橡胶安全无毒铃铛弹力球泰迪金毛发声玩具', '1', '4.5', '环球宝贝宠物店', '2017-11-14 23:26:35', '95036209698952681', NULL, 0, NULL),
(485, 0, 0, 0, '订单结算', '4.81', '2017-11-18 12:41:11', '0.24', '0', '550404176579', '宠物狗狗玩具耐咬磨牙发声尖叫惨叫鸡泰迪金毛咬绳飞盘训练狗用品', '1', '4.9', '环球宝贝宠物店', '2017-11-14 23:26:35', '95036209698952681', NULL, 0, NULL),
(486, 0, 0, 0, '订单结算', '86.4', '2017-11-17 19:53:54', '1.3', '0', '552879084275', '北欧led护眼立式钓鱼遥控落地灯创意客厅书房卧室床头喂奶台灯', '1', '216', '浩丞灯饰', '2017-11-14 23:10:33', '87799039551784630', NULL, 0, NULL),
(487, 0, 0, 0, '订单结算', '21.37', '2017-11-18 12:41:22', '0.32', '0', '543207816838', '宠物尿垫100片包邮狗尿片猫狗尿不湿狗尿垫宠物尿片兔尿片狗尿布', '1', '21.8', '狗博士宠物之家', '2017-11-14 23:04:33', '94977607696952681', NULL, 0, NULL),
(488, 0, 0, 0, '订单结算', '29', '2017-11-17 22:06:59', '0.87', '0.15', '537566265542', '爱丽丝狗狗厕所便便器狗便盆尿尿盆小狗小型犬大小号泰迪拉屎用品', '1', '159', '怡宠宠物用品专营店', '2017-11-14 23:03:07', '95075130930952681', NULL, 0, NULL);
INSERT INTO `tsg_order` (`id`, `delflag`, `createAt`, `updateAt`, `status`, `amount`, `dealTime`, `commissionAmount`, `subsidyAmount`, `productId`, `productName`, `productCount`, `productPrice`, `shopName`, `createTime`, `oid`, `withdrawalAt`, `isWithdrawal`, `fanli_id`) VALUES
(489, 0, 0, 0, '订单结算', '141', '2017-11-21 12:30:14', '8.46', '0.71', '38608562104', '皇家小型幼犬狗粮MIJ31 0.8KG*3 博美狗茶杯腊肠犬 28省包邮', '1', '171', '皇家宠物食品旗舰店', '2017-11-14 23:00:08', '95077762033952681', NULL, 0, NULL),
(490, 0, 0, 0, '订单结算', '29', '2017-11-17 17:35:23', '0.87', '0.15', '537566265542', '爱丽丝狗狗厕所便便器狗便盆尿尿盆小狗小型犬大小号泰迪拉屎用品', '1', '159', '怡宠宠物用品专营店', '2017-11-14 22:56:09', '87579489677081760', NULL, 0, NULL),
(491, 0, 0, 0, '订单结算', '64.1', '2017-11-18 20:23:42', '0.96', '0', '543207816838', '宠物尿垫100片包邮狗尿片猫狗尿不湿狗尿垫宠物尿片兔尿片狗尿布', '3', '21.8', '狗博士宠物之家', '2017-11-14 22:56:09', '87579489681081760', NULL, 0, NULL),
(492, 0, 0, 0, '订单结算', '139', '2017-11-26 16:09:54', '2.09', '0.42', '521826135548', '苏泊尔电锅韩式多功能家用电火火锅电热锅宿舍学生锅电煮锅不粘锅', '1', '529', 'supor苏泊尔兆洪专卖店', '2017-11-12 17:49:34', '91594188854191855', NULL, 0, NULL),
(493, 0, 0, 0, '订单结算', '49.9', '2017-11-15 00:19:46', '0.75', '0.25', '558522622317', '加量装清风原木纯品3层120抽中规30包抽取面纸巾整箱', '1', '127.9', '天猫超市', '2017-11-11 22:38:09', '86062813472784630', NULL, 0, NULL),
(494, 0, 0, 0, '订单结算', '249', '2017-11-18 10:39:28', '62.25', '0.75', '549175385097', '【双11狂欢价】Dibea/地贝无线吸尘器家用车载强力手持式小型静音大功率LW-200', '1', '629', 'dibea地贝祺骏专卖店', '2017-11-11 21:22:51', '90629677658081760', NULL, 0, NULL),
(495, 0, 0, 0, '订单结算', '99', '2017-11-28 04:39:17', '2.97', '0.5', '546838344135', '卓诗尼2017夏季新款坡跟碎花凉鞋高跟一字扣带休闲女鞋144713712', '1', '369', 'josiny卓诗尼淘淘专卖店', '2017-11-11 14:36:27', '92528164352793274', NULL, 0, NULL),
(496, 0, 0, 0, '订单结算', '38.43', '2017-11-19 15:34:12', '1.15', '0.38', '543934122915', '【双11狂欢价】【双11】安美四色散粉定妆粉蜜粉控油持久遮瑕防水修容四宫格正品', '1', '99', 'amy安美化妆品旗舰店', '2017-11-11 11:53:59', '89523088350868747', NULL, 0, NULL),
(497, 0, 0, 0, '订单结算', '39.3', '2017-11-19 15:34:27', '1.18', '0.39', '13704110999', '【双11狂欢价】【双11】土家硒泥坊绿豆泥浆面膜保湿深层清洁控油去黑头收缩毛孔', '1', '109', '土家硒泥坊旗舰店', '2017-11-11 11:53:59', '89523088354868747', NULL, 0, NULL),
(498, 0, 0, 0, '订单结算', '103.29', '2017-11-19 15:34:37', '4.13', '1.03', '539339147058', '【双11狂欢价】[双11]自然堂喜马拉雅面膜21片清洁保湿收毛孔紧致补水面膜女正品', '2', '204', '自然堂旗舰店', '2017-11-11 11:53:59', '89523088355868747', NULL, 0, NULL),
(499, 0, 0, 0, '订单结算', '125.98', '2017-12-05 16:42:21', '6.3', '0', '560356080276', '林珊珊 2017秋冬新款韩版宽松套头打底衫高领加厚情侣毛衣外套女', '1', '179', '林珊珊 Sunny33小超人', '2017-11-11 09:37:49', '84792817345199021', NULL, 0, NULL),
(500, 0, 0, 0, '订单结算', '158', '2017-11-16 07:07:53', '31.6', '0.79', '522747329360', '【双11狂欢价】西服套装男士秋季修身商务正装职业西装三件套新郎伴郎服结婚礼服', '1', '899', '潮男衣柜服饰专营店', '2017-11-11 09:31:33', '91726776188952681', NULL, 0, NULL),
(501, 0, 0, 0, '订单结算', '35.6', '2017-11-16 17:19:52', '3.56', '0.18', '557492630781', '【双11狂欢价】车载手机支架创意多功能车内通用汽车导航车上出风口卡扣式支撑座', '1', '78', '先马车品专营店', '2017-11-11 01:43:26', '90955437435296788', NULL, 0, NULL),
(502, 0, 0, 0, '订单结算', '47.4', '2017-11-19 03:08:30', '0.71', '0.24', '524859421424', '【双11狂欢价】良品铺子零食大礼包组合一整箱好吃的混合装吃货膨化食品小吃批发', '1', '108', '良品铺子旗舰店', '2017-11-11 01:31:37', '83970956208784630', NULL, 0, NULL),
(503, 0, 0, 0, '订单结算', '47.4', '2017-11-19 03:08:30', '0.71', '0.24', '539154561492', '【双11狂欢价】良品铺子辣味零食大礼包组合卤味肉类鸭脖鸭舌麻辣味整箱混装小吃', '1', '129', '良品铺子旗舰店', '2017-11-11 01:31:37', '83970956208784630', NULL, 0, NULL),
(504, 0, 0, 0, '订单结算', '35.8', '2017-11-17 01:50:37', '10.92', '0.18', '536094999307', '【双11狂欢价】南极人暖足贴保暖暖脚贴暖贴自发热鞋垫贴100片关节膝盖贴宝宝贴', '1', '149', '南极人法斯特专卖店', '2017-11-11 01:26:19', '83889255470784630', NULL, 0, NULL),
(505, 0, 0, 0, '订单结算', '36', '2017-11-15 22:02:26', '3.6', '0.18', '40994417517', '生活良品橄榄精油保湿弹力素250ml 定型专用正品持久护发卷发造型', '2', '29.9', '生活良品旗舰店', '2017-11-11 01:24:55', '90434608868297586', NULL, 0, NULL),
(506, 0, 0, 0, '订单结算', '37', '2017-11-13 01:27:13', '1.11', '0.37', '37659730958', '墨西哥原装进口 Corona/科罗娜啤酒 330ml*6瓶 整箱', '1', '94', '天猫超市', '2017-11-11 01:24:33', '83562492734784630', NULL, 0, NULL),
(507, 0, 0, 0, '订单结算', '39', '2017-11-13 01:27:13', '1.17', '0.39', '35649750981', '西班牙进口红酒爱之湾桃红起泡酒甜气泡葡萄酒750ml', '1', '210', '天猫超市', '2017-11-11 01:24:32', '83562492734784630', NULL, 0, NULL),
(508, 0, 0, 0, '订单结算', '49.81', '2017-11-12 21:27:02', '2.49', '0', '537544065273', '加绒打底裤外穿薄绒九分裤小脚裤铅笔裤黑色裤子女秋季加厚长裤', '1', '199', '7小天', '2017-11-11 01:23:55', '87900517923081760', NULL, 0, NULL),
(509, 0, 0, 0, '订单结算', '43.47', '2017-11-12 21:59:21', '0.65', '0', '530391295323', '拜耳药粉宠物狗狗杀除跳蚤去虱子驱虫防蚊虫项圈防皮肤病脖圈颈圈', '1', '96', 'hello帽 宠物用品城', '2017-11-11 01:22:28', '87900517921081760', NULL, 0, NULL),
(510, 0, 0, 0, '订单结算', '96.75', '2017-11-14 10:17:34', '1.45', '0', '543207816838', '宠物尿垫100片包邮狗尿片猫狗尿不湿狗尿垫宠物尿片兔尿片狗尿布', '5', '22.8', '狗博士宠物之家', '2017-11-11 01:22:23', '87900517922081760', NULL, 0, NULL),
(511, 0, 0, 0, '订单结算', '47.24', '2017-11-18 20:23:56', '0.71', '0.24', '560618507139', '【双11狂欢价】2017冬季低帮雪地靴男加绒保暖男士靴子防水防滑棉鞋男学生棉短靴', '1', '236', '爵朗夫旗舰店', '2017-11-11 01:21:53', '87850564437081760', NULL, 0, NULL),
(512, 0, 0, 0, '订单结算', '38.47', '2017-11-18 20:23:56', '3.85', '0.19', '558811578280', '【双11狂欢价】2017冬季长毛绒豆豆鞋男加绒保暖鞋子男韩版潮流百搭休闲男生棉鞋', '1', '176', '爵朗夫旗舰店', '2017-11-11 01:21:53', '87850564437081760', NULL, 0, NULL),
(513, 0, 0, 0, '订单结算', '25.41', '2017-11-12 12:40:30', '4.57', '0.13', '553601477429', '【双11狂欢价】浪莎春秋季中厚款丝袜连裤袜女防勾丝天鹅绒打底黑色肉色显瘦腿袜', '1', '76', '浪莎高事达专卖店', '2017-11-11 01:21:53', '87850564440081760', NULL, 0, NULL),
(514, 0, 0, 0, '订单结算', '92.01', '2017-11-16 10:21:04', '2.76', '0.92', '13903451152', '【双11狂欢价】美宝莲紫胖子密扇睫毛膏 防水纤长浓密不易晕染卷翘持久定型正品', '1', '109', '美宝莲旗舰店', '2017-11-11 01:21:53', '87850564443081760', NULL, 0, NULL),
(515, 0, 0, 0, '订单结算', '85.96', '2017-11-12 12:41:12', '18.05', '0.43', '526085566037', '【双11狂欢价】2017秋冬季新款加厚加绒宽松卫衣女装套头学生中长款bf韩版外套潮', '1', '218', 'jcoolstory旗舰店', '2017-11-11 01:21:53', '87850564446081760', NULL, 0, NULL),
(516, 0, 0, 0, '订单结算', '433.76', '2017-11-12 12:40:43', '26.03', '2.17', '529066909319', '【双11狂欢价】皇家狗粮 中型犬幼犬粮MEJ32 4KG*4萨摩耶哈士奇柯基狗粮', '1', '956', '皇家宠物食品旗舰店', '2017-11-11 01:21:52', '87850564441081760', NULL, 0, NULL),
(517, 0, 0, 0, '订单结算', '85.44', '2017-11-15 17:01:24', '2.56', '0.85', '555905357154', '【双11狂欢价】【双11聚】ETUDEHOUSE伊蒂之屋101双头修容棒高光笔鼻影PONY同款', '2', '98', 'ETUDE HOUSE伊蒂之屋官方旗舰店', '2017-11-11 01:21:52', '87850564444081760', NULL, 0, NULL),
(518, 0, 0, 0, '订单结算', '49.9', '2017-11-13 01:27:33', '0.75', '0.25', '558522622317', '加量装清风原木纯品3层120抽中规30包抽取面纸巾整箱', '1', '127.9', '天猫超市', '2017-11-11 01:18:57', '83490310045784630', NULL, 0, NULL),
(519, 0, 0, 0, '订单结算', '264', '2017-12-05 09:27:27', '13.2', '0', '560746890290', 'BANGBOY 自制冬款麂皮绒长款棕黄色大牌感腰带毛呢大衣韩版男外套', '1', '999', 'BANGBOY X IZTION', '2017-11-11 01:13:24', '83217506044784630', NULL, 0, NULL),
(520, 0, 0, 0, '订单结算', '105.04', '2017-11-14 10:18:13', '5.25', '0.53', '556447850508', '【双11狂欢价】唐狮2017秋冬新款毛衣男圆领韩版复古休闲提花图案套头毛衫针织衫', '1', '369', '唐狮官方旗舰店', '2017-11-11 01:08:09', '87592351292081760', NULL, 0, NULL),
(521, 0, 0, 0, '订单结算', '14.82', '2017-11-30 09:31:37', '2.22', '0.15', '559974405743', '【双11狂欢价】三个装！送收纳架子葫芦水滴美妆蛋海绵粉扑彩妆化妆工具气垫rt', '1', '49.9', '丽亚斯旗舰店', '2017-11-11 01:07:34', '83191807046263610', NULL, 0, NULL),
(522, 0, 0, 0, '订单结算', '333.25', '2017-11-23 21:51:38', '6.67', '1.67', '522564716142', '【双11狂欢价】镁多力伸缩梯子人字梯铝合金加厚折叠梯家用多功能升降梯工程楼梯', '1', '2098', 'midoli旗舰店', '2017-11-11 01:05:29', '83191807044263610', NULL, 0, NULL),
(523, 0, 0, 0, '订单结算', '8.33', '2017-11-29 10:38:49', '1.25', '0.08', '522981802843', '【双11狂欢价】美丽工匠 化妆棉卸妆棉脸部双面双效纯棉软洗脸厚款补水化妆工具', '1', '25.9', '美丽工匠化妆品旗舰店', '2017-11-11 01:05:23', '83191807045263610', NULL, 0, NULL),
(524, 0, 0, 0, '订单结算', '279', '2017-11-27 09:36:23', '4.19', '0.84', '538661026488', '【双11狂欢价】飞利浦电动牙刷头6支装HX6016适用于HX6721/HX6730/HX3216等型号', '1', '379', '飞利浦官方旗舰店', '2017-11-11 00:54:59', '89671272988297586', NULL, 0, NULL),
(525, 0, 0, 0, '订单结算', '101', '2017-11-14 12:33:57', '15.15', '0', '556114298917', '西西里男装 吴亦凡同款牛仔裤男小脚黑色裤子男韩版潮流九分裤男', '1', '999', '西西里男装 CHIC ERRO', '2017-11-11 00:52:52', '82801150024199021', NULL, 0, NULL),
(526, 0, 0, 0, '订单结算', '83', '2017-11-13 19:15:13', '16.6', '0', '558576129425', '大赖自制秋冬新款高领毛衣男韩版外穿针织衫小清新百搭长袖毛线衣', '1', '288', '大赖 studios', '2017-11-11 00:52:47', '82801150025199021', NULL, 0, NULL),
(527, 0, 0, 0, '订单结算', '308', '2017-11-16 09:10:50', '30.8', '1.54', '557369504333', '【双11狂欢价】大毛领轻薄羽绒服女短款2017冬装新款潮韩版修身显瘦学生冬季外套', '1', '699', '侨西尼旗舰店', '2017-11-11 00:52:44', '82836599291386514', NULL, 0, NULL),
(528, 0, 0, 0, '订单结算', '41.87', '2017-11-16 09:11:00', '0.84', '0', '558761097353', '小米MIX2原装快速充电器高通QC3.0快充小米NOTE3红米PRO充电头', '1', '79', '扬帆精品数码', '2017-11-11 00:52:41', '82836599293386514', NULL, 0, NULL),
(529, 0, 0, 0, '订单结算', '62.8', '2017-11-13 09:09:21', '0.94', '0.31', '41122330248', '【双11狂欢价】遇见香芬COCO香水洗发水护发素沐浴露三件套装持久留香男女家庭装', '1', '444', 'cocoessence旗舰店', '2017-11-11 00:52:35', '82836599292386514', NULL, 0, NULL),
(530, 0, 0, 0, '订单结算', '25.82', '2017-11-26 23:45:56', '0.39', '0.13', '37062325253', '【特价秒杀】B365果蔬酵素粉10g*5袋 综合复合 水果酵素 红糖姜茶', '1', '78', 'b365旗舰店', '2017-11-11 00:51:10', '82782726205263610', NULL, 0, NULL),
(531, 0, 0, 0, '订单结算', '417.08', '2017-11-26 23:45:56', '41.71', '2.09', '14303032737', '【双11狂欢价】【官方直营】B365果蔬酵素粉enzyme非果冻综合水果孝素粉b365酵素', '7', '198', 'b365旗舰店', '2017-11-11 00:51:10', '82782726205263610', NULL, 0, NULL),
(532, 0, 0, 0, '订单结算', '61.36', '2017-11-21 10:51:55', '0.92', '0.31', '558382982629', '【双11狂欢价】【直营】韩国进口 爱茉莉美妆仙护发精油 韩国人手一件*2瓶', '1', '118', '天猫国际官方直营', '2017-11-11 00:48:36', '89548297162297586', NULL, 0, NULL),
(533, 0, 0, 0, '订单结算', '388', '2017-11-18 20:52:34', '19.4', '1.94', '560602471834', '塞尔伯恩中老年羽绒服男士中长款加厚中年男装毛领爸爸装冬装外套', '1', '1580', '塞尔伯恩旗舰店', '2017-11-11 00:47:36', '82597196433386514', NULL, 0, NULL),
(534, 0, 0, 0, '订单结算', '118', '2017-11-16 09:11:24', '37.76', '0.59', '557647894772', '【双11狂欢价】妈妈靴子女冬季中筒靴加绒保暖粗跟中跟防滑马丁靴皮棉鞋中年女靴', '1', '278', '母泰旗舰店', '2017-11-11 00:47:32', '82597196434386514', NULL, 0, NULL),
(535, 0, 0, 0, '订单结算', '24.79', '2017-11-14 12:40:36', '1.24', '0.12', '540462162389', '【双11狂欢价】薄暮花冬季棉拖鞋女包跟月子鞋室内保暖厚底可爱韩版加绒情侣棉拖', '1', '108', '薄暮花旗舰店', '2017-11-11 00:45:26', '87189626908899946', NULL, 0, NULL),
(536, 0, 0, 0, '订单结算', '27.59', '2017-11-14 12:40:36', '1.38', '0.14', '556974030983', '【双11狂欢价】棉拖鞋女厚底冬季韩版可爱保暖月子鞋室内防滑软底情侣家居拖鞋', '1', '98', '薄暮花旗舰店', '2017-11-11 00:45:26', '87189626908899946', NULL, 0, NULL),
(537, 0, 0, 0, '订单结算', '124.56', '2017-11-15 20:54:50', '9.96', '0.62', '557146710260', '【双11狂欢价】热风2017冬新款学院风淑女饰扣雪地靴加绒女士平底短靴H89W7405', '1', '249', '热风旗舰店', '2017-11-11 00:45:20', '87189626912899946', NULL, 0, NULL),
(538, 0, 0, 0, '订单结算', '232.11', '2017-11-15 20:54:50', '18.57', '1.16', '557334318974', '【双11狂欢价】热风2017冬新款潮流时尚橡筋女士粗跟休闲鞋圆头短筒短靴H82W7409', '1', '449', '热风旗舰店', '2017-11-11 00:45:20', '87189626912899946', NULL, 0, NULL),
(539, 0, 0, 0, '订单结算', '107.95', '2017-11-26 01:00:32', '6.48', '0.54', '538874017620', '【双11狂欢价】夏季新品女装中长款吊带裙无袖雪纺连衣裙波西米亚海边度假沙滩裙', '1', '257', '西子美丽心情旗舰店', '2017-11-11 00:45:18', '89502402396793274', NULL, 0, NULL),
(540, 0, 0, 0, '订单结算', '125.94', '2017-11-26 13:00:56', '3.78', '0.63', '559825849115', '【双11狂欢价】小红人磨砂皮短靴女秋冬2017新款粗跟马丁靴女英伦风女鞋高跟靴子', '1', '288', '小红人旗舰店', '2017-11-11 00:45:18', '89502402402793274', NULL, 0, NULL),
(541, 0, 0, 0, '订单结算', '178.01', '2017-11-26 11:56:28', '35.6', '0.89', '560081915992', '【双11狂欢价】小个子毛呢外套女韩版2017秋冬中长款新款修身加厚短款矮呢子大衣', '1', '319', '雅丽岚旗舰店', '2017-11-11 00:45:14', '89502402401793274', NULL, 0, NULL),
(542, 0, 0, 0, '订单结算', '24.37', '2017-11-13 11:38:06', '1.22', '0', '22060331325', '正品暖贴宝宝贴自发热宫暖贴暖身贴热帖足贴保暖贴包邮100片全身', '1', '57.6', 'E时尚百货一温暖售卖', '2017-11-11 00:42:02', '87134298184899946', NULL, 0, NULL),
(543, 0, 0, 0, '订单结算', '27.58', '2017-11-13 11:37:43', '2.76', '0', '557607251885', '全自动雨伞男女折叠加固防风太阳伞自开收晴雨两用防晒黑胶遮阳伞', '1', '188', '惟夕', '2017-11-11 00:41:50', '87134298185899946', NULL, 0, NULL),
(544, 0, 0, 0, '订单结算', '203.84', '2017-11-13 19:02:57', '40.97', '0', '537453365578', '2017秋冬新款韩版休闲风衣毛呢外套男宽松中长款学生翻领男士大衣', '1', '608', '韩宜嘉男装', '2017-11-11 00:39:53', '82467781474199021', NULL, 0, NULL),
(545, 0, 0, 0, '订单结算', '165.91', '2017-11-20 19:49:08', '8.3', '0.83', '559652868421', '【双11狂欢价】毛呢大衣女学生中长款韩国2017新款秋冬宽松焦糖色矮小个子呢外套', '1', '398', '戴乐思旗舰店', '2017-11-11 00:38:04', '89319171151267166', NULL, 0, NULL),
(546, 0, 0, 0, '订单结算', '95', '2017-11-30 02:42:17', '2.85', '0.95', '18616903560', '【双11狂欢价】美宝莲飞箭睫毛膏防水纤长卷翘浓密不结块不晕染持久防水官方正品', '1', '109', '美宝莲旗舰店', '2017-11-11 00:35:31', '82453248344263610', NULL, 0, NULL),
(547, 0, 0, 0, '订单结算', '89', '2017-11-30 02:42:17', '2.67', '0.89', '522647007234', '【双11狂欢价】美宝莲绝色持久丝绒雾感唇釉唇膏唇彩 口红滋润持久保湿M500 M400', '1', '99', '美宝莲旗舰店', '2017-11-11 00:35:31', '82453248344263610', NULL, 0, NULL),
(548, 0, 0, 0, '订单结算', '59', '2017-11-30 02:42:17', '1.77', '0.59', '546686906286', '【双11狂欢价】美宝莲 双头三角眉笔眉粉防水防汗防晕染持久多用初学者染眉膏', '1', '89', '美宝莲旗舰店', '2017-11-11 00:35:31', '82453248344263610', NULL, 0, NULL),
(549, 0, 0, 0, '订单结算', '53', '2017-11-30 02:42:17', '1.59', '0.53', '12727688676', '【双11狂欢价】美宝莲眼唇卸妆液 脸部眼部及唇部卸妆油卸妆水温和无刺激清洁', '1', '59', '美宝莲旗舰店', '2017-11-11 00:35:31', '82453248344263610', NULL, 0, NULL),
(550, 0, 0, 0, '订单结算', '46.5', '2017-12-12 16:36:44', '4.65', '0.47', '559414638622', '【双11狂欢价】The Face Shop/菲诗小铺隔离霜遮瑕裸妆妆前乳防辐射紫色绿色2支', '1', '118', 'realls海外专营店', '2017-11-11 00:35:31', '82453248349263610', NULL, 0, NULL),
(551, 0, 0, 0, '订单结算', '77', '2017-11-15 06:26:49', '3.85', '0.39', '558657687001', '【双11狂欢价】乐扣乐扣 圈圈保温杯 运动便携时尚水杯可拎不锈钢男女 LHC4153/4', '1', '158', '乐扣乐扣旗舰店', '2017-11-11 00:13:18', '88933303536952681', NULL, 0, NULL),
(552, 0, 0, 0, '订单结算', '116', '2017-11-12 19:23:20', '5.8', '0.58', '525650887454', '【双11狂欢价】乐扣乐扣 娜姆马克保温杯 时尚简约情侣男女黑白红 500ml LHC4125', '1', '258', '乐扣乐扣旗舰店', '2017-11-11 00:12:06', '88922187122952681', NULL, 0, NULL),
(553, 0, 0, 0, '订单结算', '56', '2017-11-14 06:44:19', '2.8', '0.28', '41384025967', '【双11狂欢价】乐扣乐扣 缤纷马克杯保温杯 时尚水杯便携男女 390ml LHC4021', '1', '125', '乐扣乐扣旗舰店', '2017-11-11 00:10:24', '88906225593952681', NULL, 0, NULL),
(554, 0, 0, 0, '订单结算', '14.8', '2017-11-20 17:42:11', '4.45', '0.07', '558031483936', '0-6-12个月婴儿鞋子软底学步冬季宝宝棉鞋1岁男女新生幼儿雪地靴', '1', '69', '波特豆旗舰店', '2017-11-10 21:20:32', '88760657559766089', NULL, 0, NULL),
(555, 0, 0, 0, '订单结算', '20', '2017-11-28 18:28:01', '47.7', '1.59', '546740418664', '【双11预售】美宝莲超然无瑕轻垫霜黑金气垫bb霜巨遮瑕轻薄裸妆', '1', '179', '美宝莲旗舰店', '2017-11-10 21:13:28', '81815409971263610', NULL, 0, NULL),
(556, 0, 0, 0, '订单结算', '13', '2017-11-16 21:36:47', '0.39', '0.07', '557539943165', '婴儿帽子秋冬0-3-6-12个月宝宝帽子1-2岁男女儿童帽子冬帽线帽', '1', '42', '悠铭母婴专营店', '2017-11-10 21:09:51', '88733637434766089', NULL, 0, NULL),
(557, 0, 0, 0, '订单结算', '29.01', '2017-11-11 19:02:06', '0.44', '0', '524630951876', '口罩一次性透气男女秋冬季时尚韩版可爱个性女神黑潮款批发50只装', '2', '29.15', '当当阁 时尚网购享当当', '2017-11-10 13:04:47', '86329662125081760', NULL, 0, NULL),
(558, 0, 0, 0, '订单结算', '26.9', '2017-11-15 00:21:51', '9.42', '0.08', '40111047312', '再也不用换电池 可充电无线鼠标 静音无声笔记本台式游戏苹果女生', '1', '69', '众乐乐数码专营店', '2017-11-09 15:43:21', '81327588463784630', NULL, 0, NULL),
(559, 0, 0, 0, '订单结算', '35.8', '2017-11-10 21:56:42', '0.57', '0', '550939007695', '特价2碗2盘2勺2筷家用套装 情侣2人清新碗盘勺筷组合餐具 可微波', '1', '71.6', '玲珑餐具', '2017-11-08 22:21:19', '85752189593081760', NULL, 0, NULL),
(560, 0, 0, 0, '订单结算', '32.86', '2017-11-10 21:59:46', '1.31', '0.16', '540421207446', '【2件5折】炊大皇全钢柄不锈钢切菜刀切肉刀砍骨刀切片刀多刀', '1', '69.9', '天猫超市', '2017-11-08 22:11:15', '85781927748081760', NULL, 0, NULL),
(561, 0, 0, 0, '订单结算', '55.84', '2017-11-10 21:59:46', '1.68', '0.28', '40659152717', '【日用百货】百富帝加厚保暖被子冬被 2米双人加厚保暖棉被 被褥', '1', '269', '天猫超市', '2017-11-08 22:11:15', '85781927748081760', NULL, 0, NULL),
(562, 0, 0, 0, '订单结算', '13.8', '2017-11-19 09:28:04', '4.14', '0.04', '546509871715', '玛尚可充电无线鼠标 静音无声电脑笔记本办公游戏男女生 无限鼠标', '1', '89', '巨途数码专营店', '2017-11-08 20:32:02', '85698401360907060', NULL, 0, NULL),
(563, 0, 0, 0, '订单结算', '30.99', '2017-11-12 21:59:01', '1.55', '0.15', '521422451240', '植护原木抽纸24包餐巾纸抽纸批发纸巾整箱家庭装卫生纸家用面巾纸', '1', '150', '植护旗舰店', '2017-11-08 15:18:18', '85597182568081760', NULL, 0, NULL),
(564, 0, 0, 0, '订单结算', '5.9', '2017-11-10 08:54:44', '0.09', '0.03', '41385219786', '【买2包邮】挤酱瓶挤压瓶酱汁樽挤瓶沙拉番茄酱瓶寿司挤酱瓶油壶', '1', '10.8', '谷色食品专营店', '2017-11-08 15:11:34', '85593514648081760', NULL, 0, NULL),
(565, 0, 0, 0, '订单结算', '5.9', '2017-11-10 08:54:44', '0.09', '0.03', '41385219786', '【买2包邮】挤酱瓶挤压瓶酱汁樽挤瓶沙拉番茄酱瓶寿司挤酱瓶油壶', '1', '10.8', '谷色食品专营店', '2017-11-08 15:11:34', '85593514648081760', NULL, 0, NULL),
(566, 0, 0, 0, '订单结算', '13.6', '2017-11-10 08:54:44', '0.2', '0.07', '36636107471', '寿司工具套装全套材料食材紫菜包饭套餐酸萝卜条大根条金大根400g', '2', '7.8', '谷色食品专营店', '2017-11-08 15:11:34', '85593514648081760', NULL, 0, NULL),
(567, 0, 0, 0, '订单结算', '16.8', '2017-11-10 22:29:57', '2.54', '0', '552735157264', '陶瓷小花瓶小清新水培花器玻璃透明客厅插花现代干花家居装饰摆件', '1', '33.6', '曦尚工厂店', '2017-11-08 12:51:23', '80914035398386514', NULL, 0, NULL),
(568, 0, 0, 0, '订单结算', '14.9', '2017-11-13 01:27:24', '4.5', '0.04', '535386917387', 'AA充电电池充电器套装 通用5号7号共8节 电池可充遥控玩具鼠标ktv', '1', '46', '百乐士数码专营店', '2017-11-07 21:46:20', '80538997548784630', NULL, 0, NULL),
(569, 0, 0, 0, '订单结算', '6.9', '2017-11-08 22:31:23', '0.1', '0.03', '12424933809', '黑人牙膏透心爽柠檬120g去牙菌斑护牙龈防蛀清新口气', '1', '22', '天猫超市', '2017-11-03 21:20:18', '83477554324081760', NULL, 0, NULL),
(570, 0, 0, 0, '订单结算', '9.91', '2017-11-08 22:31:23', '0.15', '0.05', '22250308893', '黑人牙刷炭丝深洁双支成人家用旅行套装细丝软毛洁净', '1', '21.5', '天猫超市', '2017-11-03 21:20:18', '83477554324081760', NULL, 0, NULL),
(571, 0, 0, 0, '订单结算', '7.9', '2017-11-08 22:31:23', '0.12', '0.04', '534465003021', '【天猫超市】顺清柔抽纸 橙A系列3层120抽3包软抽取式面巾纸巾', '1', '22.9', '天猫超市', '2017-11-03 21:20:18', '83477554324081760', NULL, 0, NULL),
(572, 0, 0, 0, '订单结算', '1', '2017-11-08 22:31:23', '0.02', '0.01', '560007635957', '【天猫超市】印尼进口Tango奥朗探戈乳酪威化夹心饼干52g零食品', '1', '19.9', '天猫超市', '2017-11-03 21:20:18', '83477554324081760', NULL, 0, NULL),
(573, 0, 0, 0, '订单结算', '9.9', '2017-11-08 22:31:23', '0.15', '0.05', '560072136297', '碧浪洗衣液 机洗超净 亮白去油污渍700g快洗无残留', '1', '19.9', '天猫超市', '2017-11-03 21:20:18', '83477554324081760', NULL, 0, NULL),
(574, 0, 0, 0, '订单结算', '23.8', '2017-11-08 22:31:23', '0.36', '0.12', '530400465447', '【天猫超市】纳美源生净白花香薄荷双重去渍小苏打牙膏120G', '1', '24.9', '天猫超市', '2017-11-03 21:20:18', '83477554324081760', NULL, 0, NULL),
(575, 0, 0, 0, '订单结算', '32.8', '2017-11-08 22:31:23', '0.49', '0.16', '18037078376', '汰渍洗衣粉 持久清洁净白去渍专用柠檬清新型5kg袋装', '1', '54.9', '天猫超市', '2017-11-03 21:20:18', '83477554324081760', NULL, 0, NULL),
(576, 0, 0, 0, '订单结算', '44.33', '2017-11-08 22:31:57', '7.09', '0', '36813419929', '乐巢加厚 可水洗 不掉色 丝毛地毯地垫客厅茶几卧室床边地毯', '1', '153', '乐巢地毯', '2017-11-03 20:48:49', '83422421410081760', NULL, 0, NULL),
(577, 0, 0, 0, '订单结算', '42.9', '2017-11-08 20:42:46', '2.15', '0', '520425651308', '天方香酥米方便面干吃面 香酥米零食 整箱30g*120包点心面碎碎面', '1', '49.9', '色彩生活馆', '2017-11-01 23:59:38', '82394453148907060', NULL, 0, NULL),
(578, 0, 0, 0, '订单结算', '39', '2017-11-08 20:42:54', '3.9', '0.2', '556015405855', '夫尼保罗男士秋衣秋裤套装纯棉青年打底棉毛衫全棉薄款保暖内衣男', '1', '118', '夫尼保罗旗舰店', '2017-10-31 16:27:05', '81590884101907060', NULL, 0, NULL),
(579, 0, 0, 0, '订单结算', '39', '2017-11-08 22:32:11', '3.9', '0.2', '556015405855', '夫尼保罗男士秋衣秋裤套装纯棉青年打底棉毛衫全棉薄款保暖内衣男', '1', '118', '夫尼保罗旗舰店', '2017-10-31 16:22:04', '81650303860081760', NULL, 0, NULL),
(580, 0, 0, 0, '订单结算', '59', '2017-10-31 11:59:55', '5.9', '0.59', '529490016681', 'theSAEM得鲜持久保湿不脱色口红韩国豆沙姨妈色哑光玻璃唇膏正品', '1', '128', 'thesaem得鲜旗舰店', '2017-10-28 09:43:25', '75270744250386514', NULL, 0, NULL),
(581, 0, 0, 0, '订单结算', '189', '2017-10-31 11:53:16', '0.95', '0.57', '528001221625', '联想G480 Y480 B480 N480 M490 B490 G490笔记本 4G 1600内存条', '1', '299', 'kingred金力得旗舰店', '2017-10-27 10:55:05', '79569287854907060', NULL, 0, NULL),
(582, 0, 0, 0, '订单结算', '4.59', '2017-11-06 08:07:10', '0.37', '0', '39003506378', '迷你园艺大三件套工具铁铲锹耙子铲耙园艺小铲子室内花卉盆栽松土', '1', '7.8', '大学生创业园艺梦之店', '2017-10-26 21:45:25', '79397395414081760', NULL, 0, NULL),
(583, 0, 0, 0, '订单结算', '17.25', '2017-11-06 08:07:10', '1.38', '0', '560428484000', '新款室内加仑盆清仓多肉塑料花盆简约树脂圆形大号绿萝盆栽种植盆', '2', '8.8', '大学生创业园艺梦之店', '2017-10-26 21:45:25', '79397395414081760', NULL, 0, NULL),
(584, 0, 0, 0, '订单结算', '16.8', '2017-11-04 10:35:27', '1.68', '0.05', '558964636624', 'RNX iPhone6Plus手机壳6s苹果翻盖式皮套i6保护套6p防摔六男女款', '1', '49', 'RNX旗舰店', '2017-10-24 20:17:55', '78407593895907060', NULL, 0, NULL),
(585, 0, 0, 0, '订单结算', '658', '2017-11-02 16:07:38', '32.9', '0', '547512225750', 'TRENDY 自制 新品 重磅复古时髦常青款 穿一辈子 经典米驼色风衣', '1', '688', 'TRENDYWU', '2017-10-24 10:37:00', '73319899113784630', NULL, 0, NULL),
(586, 0, 0, 0, '订单结算', '19.9', '2017-11-03 09:33:30', '5.97', '0.1', '555237358569', '幸福妈咪 厨房多功能土豆丝切丝器擦丝刨丝切片器插菜板切菜神器', '1', '158', 'smilemom幸福妈咪旗舰店', '2017-10-23 16:31:01', '77811615654081760', NULL, 0, NULL),
(587, 0, 0, 0, '订单结算', '39.99', '2017-11-02 16:58:11', '8', '0.12', '524089043984', '小熊煮蛋器蒸蛋器家用双层迷你小型早餐机煮蛋机自动断电煮鸡蛋器', '1', '139', '小熊宜家宜居专卖店', '2017-10-23 11:13:39', '77691886271081760', NULL, 0, NULL),
(588, 0, 0, 0, '订单结算', '29.9', '2017-10-26 08:30:04', '0.45', '0.15', '544846887793', '正品金纺柔顺剂樱花淡雅衣物护理剂液柔软剂防静电持久留香包邮', '1', '79.9', '邦航家居专营店', '2017-10-23 10:05:44', '72653053464386514', NULL, 0, NULL),
(589, 0, 0, 0, '订单结算', '32.9', '2017-10-25 08:29:24', '9.87', '0', '554268532126', '亲爽原木抽纸30包纸巾整箱批发面纸家用纸抽卫生纸餐巾纸特惠套装', '1', '35.9', '淘の乐购', '2017-10-23 10:00:53', '72651401193386514', NULL, 0, NULL),
(590, 0, 0, 0, '订单结算', '18.8', '2017-11-01 16:14:57', '1.88', '0.06', '41047193981', '奢姿iPhone6钢化膜苹果6s全屏覆盖水凝plus蓝光手机防摔6p玻璃4.7', '1', '19', '趣乐数码专营店', '2017-10-23 09:49:24', '77616285809943757', NULL, 0, NULL),
(591, 0, 0, 0, '订单结算', '19.11', '2017-10-23 10:59:01', '4.4', '0', '558758640688', '居家家 冬季马桶套马桶圈坐便套三件套 通用马桶坐垫座便套马桶垫', '1', '35', '居家家 您身边的居家伴侣', '2017-10-21 14:44:27', '76776705908081760', NULL, 0, NULL),
(592, 0, 0, 0, '订单结算', '11.27', '2017-10-23 10:59:02', '0.56', '0', '542471574210', '居家家 简易拖鞋鞋架浴室置物架 宿舍铁艺架子客厅家用鞋子收纳架', '1', '12', '居家家 您身边的居家伴侣', '2017-10-21 14:44:27', '76776705908081760', NULL, 0, NULL),
(593, 0, 0, 0, '订单结算', '14.7', '2017-10-23 10:59:01', '0.74', '0', '551966282629', '居家家煤气灶铝箔挡油板隔热板厨房炒菜隔油板家用灶台防溅油挡板', '2', '8.6', '居家家 您身边的居家伴侣', '2017-10-21 14:44:27', '76776705908081760', NULL, 0, NULL),
(594, 0, 0, 0, '订单结算', '3.75', '2017-10-23 10:59:01', '0.19', '0', '544190447838', '居家家 吸盘冰箱除臭竹炭包家用除味盒 活性炭去异味除臭剂除味剂', '1', '3.9', '居家家 您身边的居家伴侣', '2017-10-21 14:44:27', '76776705908081760', NULL, 0, NULL),
(595, 0, 0, 0, '订单结算', '11.33', '2017-10-23 10:59:01', '0.57', '0', '546810445881', '居家家 素色双层洗菜盆厨房沥水盆 塑料水果篮沥水篮洗菜篮子漏盆', '1', '11.8', '居家家 您身边的居家伴侣', '2017-10-21 14:44:27', '76776705908081760', NULL, 0, NULL),
(596, 0, 0, 0, '订单结算', '7.65', '2017-10-23 10:59:01', '0.38', '0', '557209781424', '居家家 多功能升降纸巾盒茶几抽纸盒 客厅桌面带牙签盒纸巾收纳盒', '1', '7.8', '居家家 您身边的居家伴侣', '2017-10-21 14:44:27', '76776705908081760', NULL, 0, NULL),
(597, 0, 0, 0, '订单结算', '19.11', '2017-10-23 10:59:01', '0.96', '0', '546664101413', '居家家木芒果防虫香包衣柜衣物玫瑰香囊室内房间卧室除味香薰香袋', '5', '3.9', '居家家 您身边的居家伴侣', '2017-10-21 14:44:27', '76776705908081760', NULL, 0, NULL),
(598, 0, 0, 0, '订单结算', '6.77', '2017-10-23 10:59:01', '0.34', '0', '520677250603', '居家家 定角磨刀器创意厨房小用品工具 家用神器磨菜刀用具磨刀石', '1', '7.8', '居家家 您身边的居家伴侣', '2017-10-21 14:44:27', '76776705908081760', NULL, 0, NULL),
(599, 0, 0, 0, '订单结算', '4.71', '2017-10-23 10:59:01', '0.24', '0', '558360143769', '居家家 亚克力圆形无痕透明双面胶70支 创意超粘强力防水小胶片贴', '1', '4.8', '居家家 您身边的居家伴侣', '2017-10-21 14:44:27', '76776705908081760', NULL, 0, NULL),
(600, 0, 0, 0, '订单结算', '13.23', '2017-10-23 10:59:01', '0.66', '0', '545947396522', '室内空气清新剂厕所除臭剂芳香剂家用卫生间除臭香薰卧室用清香剂', '1', '15.8', '居家家 您身边的居家伴侣', '2017-10-21 14:44:27', '76776705908081760', NULL, 0, NULL),
(601, 0, 0, 0, '订单结算', '23.03', '2017-10-23 10:59:02', '1.15', '0', '543907551165', '居家家 铁艺调料架调味品厨具收纳架 厨房落地架子双层收纳置物架', '1', '26.6', '居家家 您身边的居家伴侣', '2017-10-21 14:44:27', '76776705908081760', NULL, 0, NULL),
(602, 0, 0, 0, '订单结算', '7.55', '2017-10-23 10:59:02', '0.38', '0', '545473187381', '居家家鱼骨夏季凉拖鞋室内浴室地板防滑洗澡拖鞋男女情侣塑料托鞋', '1', '8.6', '居家家 您身边的居家伴侣', '2017-10-21 14:44:27', '76776705908081760', NULL, 0, NULL),
(603, 0, 0, 0, '订单结算', '10.59', '2017-10-23 10:59:01', '0.53', '0', '559529834045', '居家家 环保竹纤维本色纸杯 办公室一次性茶杯咖啡杯加厚奶茶杯子', '1', '10.8', '居家家 您身边的居家伴侣', '2017-10-21 14:44:27', '76776705908081760', NULL, 0, NULL),
(604, 0, 0, 0, '订单结算', '3.43', '2017-10-23 10:59:01', '0.17', '0', '558922876382', '居家家透明自粘贴纸灶台耐高温防油贴厨房瓷砖防油防水贴油烟墙贴', '1', '3.5', '居家家 您身边的居家伴侣', '2017-10-21 14:44:27', '76776705908081760', NULL, 0, NULL),
(605, 0, 0, 0, '订单结算', '29.4', '2017-10-21 14:23:35', '7.35', '0.15', '556881756530', '圆桌垫子pvc欧式防水防烫台布家用圆形茶几桌布客厅塑料胶垫圆形', '1', '64.8', '金雕家居用品旗舰店', '2017-10-16 22:12:41', '74374388869081760', NULL, 0, NULL),
(606, 0, 0, 0, '订单结算', '115', '2017-10-23 10:59:19', '4.03', '0', '559871289235', '全棉简约超柔水洗棉四件套纯棉床单被套床上用品1.5米1.8m床双人', '1', '699', '浅时光布艺家纺', '2017-10-16 16:02:44', '74308926298081760', NULL, 0, NULL),
(607, 0, 0, 0, '订单结算', '96', '2017-10-21 14:23:56', '9.6', '0.48', '557717663123', '南极人被子水洗棉被冬双人加厚保暖被芯被褥单人学生宿舍秋冬被子', '1', '399', '南极人岚惜专卖店', '2017-10-16 15:30:50', '74288094549081760', NULL, 0, NULL),
(608, 0, 0, 0, '订单结算', '29.8', '2017-10-21 14:24:15', '1.49', '0.15', '557855440788', '买一送一冬季棉拖鞋女卡通可爱室内家居家用防滑保暖厚底拖鞋男', '1', '88', '润柔旗舰店', '2017-10-16 14:59:21', '74218905199081760', NULL, 0, NULL),
(609, 0, 0, 0, '订单结算', '198', '2017-10-20 10:41:14', '19.8', '0.99', '539461934714', '风衣女中长款2017秋装新款韩版宽松红色大衣外套女装春秋季潮', '1', '360', '谜秀旗舰店', '2017-10-15 17:14:09', '68687161273386514', NULL, 0, NULL),
(610, 0, 0, 0, '订单结算', '74.9', '2017-10-26 16:20:42', '7.49', '0.75', '5031835628', '曼秀雷敦男士能量爽肤水120ml 保湿补水须后水舒缓肌肤 护肤品男', '1', '79.9', '曼秀雷敦旗舰店', '2017-10-15 17:05:31', '68763318534784630', NULL, 0, NULL),
(611, 0, 0, 0, '订单结算', '35.29', '2017-10-21 19:31:47', '0.53', '0.18', '521323204137', '地垫门垫进门脚垫门厅垫子家用卧室厨房浴室吸水防滑垫门口卫生间', '1', '74', '蓝海棠旗舰店', '2017-10-15 09:08:35', '68418469969017630', NULL, 0, NULL),
(612, 0, 0, 0, '订单结算', '24.8', '2017-10-21 19:31:47', '0.74', '0.12', '553962178530', '厨房地垫防滑防油厕所浴室门厅进门脚垫吸水门垫长条卧室床边垫子', '1', '52', '蓝海棠旗舰店', '2017-10-15 09:08:35', '68418469969017630', NULL, 0, NULL),
(613, 0, 0, 0, '订单结算', '42.91', '2017-10-21 19:31:47', '0.64', '0.21', '536427833509', '简约现代加厚圆形地毯客厅茶几卧室床边毯吊篮电脑椅子防滑毯定制', '1', '90', '蓝海棠旗舰店', '2017-10-15 09:08:35', '68418469969017630', NULL, 0, NULL),
(614, 0, 0, 0, '订单结算', '79', '2017-10-18 09:24:28', '4.74', '0.4', '556074094759', '儿童运动鞋女童鞋春秋季2017新款中大童休闲鞋女童小白鞋板鞋真皮', '1', '156', '乐飞虎旗舰店', '2017-10-13 17:23:34', '67732026291386514', NULL, 0, NULL),
(615, 0, 0, 0, '订单结算', '1280', '2017-10-24 14:02:58', '38.4', '0', '555198677362', '简约现代多功能烤漆茶几创意家具 北欧小户型客厅方形茶桌茶台', '1', '2560', '卓品家具', '2017-10-12 13:15:12', '67083064467017630', NULL, 0, NULL),
(616, 0, 0, 0, '订单结算', '21.8', '2018-01-12 10:36:54', '3.49', '0', '561876823732', '帽子男冬天加绒毛线帽加厚针织帽秋冬季户外骑车保暖潮流青年韩版', '1', '39', '小杨原创精品专柜', '2018-01-10 17:27:55', '112957275112038064', 1515733575, 1, 9),
(617, 0, 0, 0, '订单结算', '9.9', '2018-01-20 10:41:00', '0.35', '0.05', '557613601316', '妙高可爱卡通牙刷盒便携式牙膏牙刷收纳盒出差旅行洗漱杯塑料杯', '1', '19.8', '妙高旗舰店', '2018-01-18 23:57:18', '116182482559038064', 1516429813, 1, 15),
(618, 0, 0, 0, '订单结算', '14.8', '2018-01-20 11:03:59', '0.22', '0.07', '550011033421', '汽车用竹炭包吸卡通去公仔狗除车用味甲醛异味臭车内摆件碳包车载', '1', '39.6', '龟派车品专营店', '2018-01-17 19:23:20', '115693014599976366', 1516426429, 1, 14),
(619, 0, 0, 0, '订单结算', '18.8', '2018-01-20 12:39:31', '5.64', '0.09', '541633931673', '折叠创意小清新黑胶防紫外线太阳伞防晒遮阳伞男女晴雨两用雨伞', '1', '68', '升旺金明专卖店', '2018-01-17 09:31:14', '122501762615386514', NULL, 0, NULL),
(620, 0, 0, 0, '订单结算', '29.53', '2018-01-20 10:41:47', '0.89', '0.3', '541054035945', 'nekur日本药妆祛痘洗面奶控油淡化痘印清洁毛孔学生男女洁面乳', '1', '229', 'Reau海外旗舰店', '2018-01-14 19:05:18', '114504608471038064', NULL, 0, NULL),
(621, 0, 0, 0, '订单结算', '779', '2018-01-20 02:10:38', '38.95', '2.34', '525603388997', 'Midea/美的 F60-15WA1电热水器60升家用速热储水式即热式洗澡80L', '1', '1999', '美的海泰专卖店', '2018-01-14 17:07:05', '107643004369196359', NULL, 0, NULL),
(622, 0, 0, 0, '订单结算', '279', '2018-01-20 02:10:51', '4.19', '0.84', '534296322191', 'Haier/海尔 MZC-2070M1 微波炉家用小型迷你机械式转盘多功能正品', '1', '799', 'haier海尔清诺专卖店', '2018-01-14 13:40:26', '107619990279196359', NULL, 0, NULL),
(623, 0, 0, 0, '订单结算', '2.99', '2018-01-30 12:08:42', '0.04', '0', '561324150038', '新手上路汽车实习车贴纸反光吸盘磁性交管局正规统一标志示装饰牌', '1', '2.99', 'SOTKEO舒克品牌店', '2018-01-24 19:52:05', '118547138354976366', 1517299255, 1, 16),
(624, 0, 0, 0, '订单结算', '55', '2018-05-19 22:55:13', '2.75', '0', '568520635118', '迷彩短裤男夏季新款运动工装短裤子大码五分裤军装宽松牛仔中裤潮', '1', '55', 'HOO自营店', '2018-05-17 17:47:04', '161018450468548834', NULL, 0, NULL),
(625, 0, 0, 0, '订单结算', '55', '2018-05-19 22:55:13', '2.75', '0', '568520635118', '迷彩短裤男夏季新款运动工装短裤子大码五分裤军装宽松牛仔中裤潮', '1', '55', 'HOO自营店', '2018-05-17 17:47:04', '161018450468548834', NULL, 0, NULL),
(626, 0, 0, 0, '订单结算', '49', '2018-05-22 10:43:14', '1.47', '0.25', '565553506962', '2018春夏新款绸缎女鞋休闲平底单鞋尖头水钻淑女鞋浅口软底懒人鞋', '1', '888', '天蓝依梦旗舰店', '2018-05-11 14:28:58', '159714304988591479', NULL, 0, NULL),
(627, 0, 0, 0, '订单结算', '99.8', '2018-05-21 09:42:20', '5.99', '0.5', '569139548145', '裂帛2018夏新款休闲圆领落肩短袖上衣韩版宽松印花T恤女51180151', '1', '169', '裂帛博世专卖店', '2018-05-10 18:33:54', '144134511592492353', NULL, 0, NULL),
(628, 0, 0, 0, '订单结算', '69', '2018-05-16 13:37:31', '2.07', '0.35', '538585379380', '亿家达电脑桌台式家用电脑桌子简约现代书桌经济型写字台办公桌子', '1', '184', '亿家达旗舰店', '2018-05-08 10:38:53', '143198777251699756', NULL, 0, NULL),
(629, 0, 0, 0, '订单结算', '25.8', '2018-05-18 18:19:21', '5.16', '0', '562487352297', '电影票车票收藏册火车飞机旅行门票纪念收集拍立得相册票据收纳本', '1', '60', '千禧良缘旗舰店', '2018-05-06 19:24:06', '157562841961081760', NULL, 0, NULL),
(630, 0, 0, 0, '订单结算', '118', '2018-05-14 20:34:31', '3.54', '1.18', '538925105830', '资生堂 Za/姬芮新能美白隔离霜2支装 防晒隔离 轻遮瑕学生 正品聚', '1', '156', 'Za姬芮官方旗舰店', '2018-05-03 21:58:27', '156314322406081760', NULL, 0, NULL),
(631, 0, 0, 0, '订单结算', '35', '2018-05-14 11:47:34', '1.05', '0.35', '560203735051', '德国进口*妮维雅夹芯润唇膏修护夹心口红保湿滋润补水', '1', '35', 'nivea妮维雅官方旗舰店', '2018-05-03 21:29:32', '156302142422081760', NULL, 0, NULL),
(632, 0, 0, 0, '订单结算', '8.92', '2018-05-13 23:56:43', '0.45', '0', '566039224349', '居家家夏季浴室洗澡漏水防滑凉拖鞋家居室内情侣男女塑料厚底拖鞋', '1', '9.6', '居家家 您身边的居家伴侣', '2018-05-03 18:09:26', '156289400905081760', NULL, 0, NULL),
(633, 0, 0, 0, '订单结算', '3.63', '2018-05-13 23:55:03', '0.18', '0', '526923541285', '居家家不锈钢豆浆过滤网小漏勺超细捞油渣滤油网筛厨房用漏网笊篱', '1', '5.2', '居家家 您身边的居家伴侣', '2018-05-03 18:09:26', '156289400905081760', NULL, 0, NULL),
(634, 0, 0, 0, '订单结算', '4.55', '2018-05-13 23:56:11', '0.23', '0', '547490892454', '卡通雪糕模具冰棍冰块制冰盒家用冰箱做冻冰棒冰淇淋的磨具冰格', '1', '5.9', '居家家 您身边的居家伴侣', '2018-05-03 18:09:26', '156289400905081760', NULL, 0, NULL),
(635, 0, 0, 0, '订单结算', '3.63', '2018-05-13 23:53:41', '0.18', '0', '567673188549', '居家家拖把替换拖布家用吸水拖把布平板拖把头配件平拖墩布拖地布', '1', '3.9', '居家家 您身边的居家伴侣', '2018-05-03 18:09:26', '156289400905081760', NULL, 0, NULL),
(636, 0, 0, 0, '订单结算', '1.49', '2018-05-13 23:55:11', '0.07', '0', '40938054624', '居家家垃圾桶夹子垃圾袋固定夹固定器创意垃圾袋防滑夹桶边夹卡子', '4', '0.68', '居家家 您身边的居家伴侣', '2018-05-03 18:09:26', '156289400905081760', NULL, 0, NULL),
(637, 0, 0, 0, '订单结算', '24.17', '2018-05-13 23:54:52', '1.21', '0', '547571548664', '居家家 大号加厚银钢袋卷装垃圾袋 家用厨房垃圾桶袋子钢袋塑料袋', '10', '2.8', '居家家 您身边的居家伴侣', '2018-05-03 18:09:26', '156289400905081760', NULL, 0, NULL),
(638, 0, 0, 0, '订单结算', '10.48', '2018-05-13 23:53:52', '0.52', '0', '539143597743', '日本进口防水创可贴透气创口贴100片 家用包扎伤口小号创伤贴ok绷', '1', '11.5', '居家家 您身边的居家伴侣', '2018-05-03 18:09:26', '156289400905081760', NULL, 0, NULL),
(639, 0, 0, 0, '订单结算', '9.2', '2018-05-13 23:56:52', '0.46', '0', '567175983937', '居家家 夏天卡通冰垫办公室坐垫凉垫 学生散热冰凉水垫汽车冰坐垫', '1', '9.9', '居家家 您身边的居家伴侣', '2018-05-03 18:09:26', '156289400905081760', NULL, 0, NULL),
(640, 0, 0, 0, '订单结算', '15', '2018-05-13 18:47:34', '0.75', '0', '44791570488', '简约软皮中年妇女包单肩斜跨包中老年人手机零钱妈妈包女包小包包', '1', '75', '诺曼蒂克包铺', '2018-05-03 14:38:27', '156120786308907060', NULL, 0, NULL),
(641, 0, 0, 0, '订单结算', '29.9', '2018-05-06 17:20:06', '0.75', '0.15', '554431912402', '佳琪保温杯儿童水壶带吸管宝宝男女幼儿园学生不锈钢防摔两用水杯', '1', '218', '佳琪家居旗舰店', '2018-05-03 09:40:26', '155959590323056072', NULL, 0, NULL),
(642, 0, 0, 0, '订单结算', '28', '2018-05-13 11:45:35', '0.59', '0.08', '528463522655', '数美 sh09四级听力耳机四六级考试收音机4级大学英语听力耳机调频', '1', '36', '师禾数码专营店', '2018-05-03 09:12:34', '154573747616451029', NULL, 0, NULL),
(643, 0, 0, 0, '订单结算', '89', '2018-05-12 09:05:52', '1.34', '0.27', '39017001861', '【狂欢价】ROMOSS/罗马仕 sense6 20000M毫安充电宝 正品手机通用移动电源', '1', '99', 'romoss旗舰店', '2018-05-01 21:00:14', '155276755119030992', NULL, 0, NULL),
(644, 0, 0, 0, '订单结算', '38.8', '2018-05-11 11:34:43', '0.58', '0.19', '562394585721', '【狂欢价】多功能usb插座面板排插智能创意插线拖线板带线插板多孔多用插排', '1', '87.48', '督牌旗舰店', '2018-04-30 22:21:39', '154821223204081760', NULL, 0, NULL),
(645, 0, 0, 0, '订单结算', '28.5', '2018-05-05 18:54:51', '2.85', '0', '525753986651', '【狂欢价】魔术贴防蚊门帘磁性纱门夏季纱窗防蝇通风家用卧室隔断帘子免打孔', '1', '100', '德奇力旗舰店', '2018-04-29 20:08:14', '140272973116122145', NULL, 0, NULL),
(646, 0, 0, 0, '订单结算', '3299', '2018-05-02 08:10:21', '131.96', '0', '557292840664', '绝地求生大逃杀i5/1060吃鸡游戏电脑主机DIY组装台式电脑全套整机', '1', '4799', '阿玛塔官方形象店', '2018-04-29 12:59:15', '154254444348907060', NULL, 0, NULL),
(647, 0, 0, 0, '订单结算', '173', '2018-05-02 08:12:02', '5.19', '0.87', '538585379380', '亿家达电脑桌台式家用电脑桌子简约现代书桌经济型写字台办公桌子', '1', '368', '亿家达旗舰店', '2018-04-29 12:59:15', '154254444349907060', NULL, 0, NULL),
(648, 0, 0, 0, '订单结算', '7.6', '2018-05-04 09:14:03', '0.61', '0', '545736609001', '粘胶挂钩厨房浴室承重创意吸盘粘贴壁挂钩子无痕免钉门后粘钩', '1', '39', '梦格雅家居生活馆', '2018-04-28 20:30:15', '153982063248907060', NULL, 0, NULL),
(649, 0, 0, 0, '订单结算', '74', '2018-05-01 19:15:02', '1.11', '0.37', '557103683985', '裸睡水洗棉四件套床单被套1.8m床上用品单人床学生被子宿舍三件套', '1', '158', '沃尔梦旗舰店', '2018-04-27 23:04:54', '153647183328081760', NULL, 0, NULL),
(650, 0, 0, 0, '订单结算', '16.9', '2018-05-07 17:34:51', '8.45', '0', '527578153755', '绿之源竹炭包汽车家用除味除甲醛活性炭包新车内去异味车载竹炭包', '1', '89', '绿之源旗舰店', '2018-04-27 11:58:30', '152497575428451029', NULL, 0, NULL),
(651, 0, 0, 0, '订单结算', '155', '2018-04-30 21:04:54', '5.58', '0.78', '560801004751', '一周耳钉女纯银韩国气质简约个性创意耳环坠送女友情人节礼物套装', '1', '266', '顺吉祥利旗舰店', '2018-04-27 00:01:39', '152085776659386514', NULL, 0, NULL),
(652, 0, 0, 0, '订单结算', '69', '2018-05-01 19:13:23', '3.45', '0', '566529597762', '防晒衣外套女 2018新款装蝴蝶结学生连帽长袖宽松百搭薄款短外套', '1', '138', '妞妞旺铺快时尚潮流女装', '2018-04-26 18:58:42', '139159749463081760', NULL, 0, NULL),
(653, 0, 0, 0, '订单结算', '9.6', '2018-04-27 07:39:11', '0.36', '0.05', '548752458988', '【天猫男人节】乐彼针线盒套装家用便携迷你缝补阵线针线包收纳工具整理箱包邮大', '1', '26', '乐彼家居专营店', '2018-04-25 08:46:18', '151956951003386514', NULL, 0, NULL),
(654, 0, 0, 0, '订单结算', '16.9', '2018-04-27 11:30:01', '3.38', '0', '549225953295', '品胜iPhone6数据线6s苹果X5手机6Plus六7五ipad短充电器8原装正品', '1', '28', '辰耀数码专营店', '2018-04-24 15:00:00', '152652900639943380', NULL, 0, NULL),
(655, 0, 0, 0, '订单结算', '126', '2018-04-27 07:39:11', '0.63', '0.38', '544862750300', '【天猫男人节】耳机入耳式重低音炮挂耳式手机通用耳塞有线控DZAT/渡哲特 DT-05', '1', '298', '义吉隆数码专营店', '2018-04-24 08:53:15', '151302756767386514', NULL, 0, NULL),
(656, 0, 0, 0, '订单结算', '14.9', '2018-05-03 11:08:13', '2.98', '0', '559163155834', '倍量冲电电池镍氢可充电电池五号七号通用电池充电器套装配6节5号', '1', '76', '倍量厂家直销', '2018-04-23 00:59:47', '137528611819577946', NULL, 0, NULL),
(657, 0, 0, 0, '订单结算', '27.84', '2018-04-27 21:15:53', '2.78', '0', '544871458128', '潮男士休闲七分裤学生短裤沙滩裤运动睡裤哈伦裤篮球裤双层低腰裤', '1', '199', '艾菲儿家居服', '2018-04-22 22:01:28', '151872905941883991', NULL, 0, NULL),
(658, 0, 0, 0, '订单结算', '27.84', '2018-04-27 21:16:02', '2.78', '0', '544871458128', '潮男士休闲七分裤学生短裤沙滩裤运动睡裤哈伦裤篮球裤双层低腰裤', '1', '199', '艾菲儿家居服', '2018-04-22 22:01:28', '151872905941883991', NULL, 0, NULL),
(659, 0, 0, 0, '订单结算', '22.6', '2018-04-23 08:39:28', '5.65', '0', '551822673005', '老管家洗衣机槽清洗剂清洁剂滚筒全自动波轮内筒除垢剂非杀菌消毒', '2', '28', '靓婷家居专营店', '2018-04-21 10:04:36', '150288485728386514', NULL, 0, NULL),
(660, 0, 0, 0, '订单结算', '17.5', '2018-04-21 16:57:02', '0.18', '0', '566812637181', '绝地求生刺激战场手游升级辅助安卓苹果游戏手柄吃鸡按键射击神器', '1', '38', '全民吃鸡大作战', '2018-04-19 13:48:31', '150440119682907060', NULL, 0, NULL),
(661, 0, 0, 0, '订单结算', '15', '2018-04-26 20:09:42', '0.75', '0', '565855738117', '2018新款短袖女T恤情侣装夏装学生宽松百搭韩版白色体恤打底衫潮', '1', '199', '河北丽阳服装服饰', '2018-04-19 10:24:46', '150354382950081760', NULL, 0, NULL),
(662, 0, 0, 0, '订单结算', '15', '2018-04-26 20:08:41', '0.75', '0', '565855738117', '2018新款短袖女T恤情侣装夏装学生宽松百搭韩版白色体恤打底衫潮', '1', '199', '河北丽阳服装服饰', '2018-04-19 10:24:46', '150354382950081760', NULL, 0, NULL),
(663, 0, 0, 0, '订单结算', '15', '2018-04-26 20:10:03', '0.75', '0', '565855738117', '2018新款短袖女T恤情侣装夏装学生宽松百搭韩版白色体恤打底衫潮', '1', '199', '河北丽阳服装服饰', '2018-04-19 10:24:46', '150354382950081760', NULL, 0, NULL),
(664, 0, 0, 0, '订单结算', '15', '2018-04-26 20:10:12', '0.75', '0', '565855738117', '2018新款短袖女T恤情侣装夏装学生宽松百搭韩版白色体恤打底衫潮', '1', '199', '河北丽阳服装服饰', '2018-04-19 10:24:46', '150354382950081760', NULL, 0, NULL),
(665, 0, 0, 0, '订单结算', '144', '2018-04-29 08:01:41', '4.32', '1.44', '540788108689', 'HomeFacialPro 烟酰胺原液 补水保湿改善暗哑提亮肤色面部精华', '1', '229', 'HomeFacial旗舰店', '2018-04-18 19:06:31', '150141107230769199', NULL, 0, NULL),
(666, 0, 0, 0, '订单结算', '5.9', '2018-04-26 18:17:03', '2.36', '0', '547417748532', '买2件送3件新会小青柑陈皮普洱茶十年宫廷熟茶叶柑普云南橘桔普茶', '1', '280', '天观地音旗舰店', '2018-04-16 15:19:56', '149224890781952681', NULL, 0, NULL),
(667, 0, 0, 0, '订单结算', '29.8', '2018-04-25 16:56:32', '0.6', '0', '562920716063', '婴儿鞋子0-6-12个月1岁春秋冬季女宝宝软底学步鞋男不掉鞋袜新生', '1', '90', '考咪婴童鞋', '2018-04-16 13:55:47', '149173735226176085', NULL, 0, NULL),
(668, 0, 0, 0, '订单结算', '29', '2018-04-26 14:30:23', '2.32', '0.15', '565265482676', '可爱猫午睡枕办公室趴睡枕学生趴趴枕午休靠垫抱枕被子两用小枕头', '1', '58', '亿美嘉家纺专营店', '2018-04-16 12:28:09', '149185436019081760', NULL, 0, NULL),
(669, 0, 0, 0, '订单结算', '69', '2018-04-23 12:27:03', '6.97', '0', '562128550491', 'ins超火的男鞋韩版潮流板鞋运动休闲跑步潮鞋ulzzang百搭老爹夏季', '1', '218', '丛林狮子旗舰店', '2018-04-12 17:33:16', '147678728142048281', NULL, 0, NULL),
(670, 0, 0, 0, '订单结算', '25.6', '2018-04-17 11:42:57', '2.56', '0', '551463425075', '手提式垃圾袋加厚批发 自动收口家用抽穿绳厨房加厚塑料袋中大号', '2', '35', '汉世刘家旗舰店', '2018-04-11 12:45:21', '147003916656386514', NULL, 0, NULL),
(671, 0, 0, 0, '订单结算', '164.64', '2018-04-13 08:36:15', '8.23', '0', '565310795721', '欧洲站2018春装新款女装长袖卫衣阔腿裤两件套宽松休闲运动套装女', '1', '399', '索妃伊阁', '2018-04-10 14:17:42', '146786275954386514', NULL, 0, NULL),
(672, 0, 0, 0, '订单结算', '9.9', '2018-04-20 13:32:55', '4.95', '0.05', '565089402887', '新款棉男女士情侣个性法斗牛印花圆领小清新t恤短袖学生团体班服', '1', '138', '柒度旗舰店', '2018-04-10 13:02:38', '133412189201081760', NULL, 0, NULL),
(673, 0, 0, 0, '订单结算', '9.9', '2018-04-20 13:34:12', '4.95', '0.05', '565089402887', '新款棉男女士情侣个性法斗牛印花圆领小清新t恤短袖学生团体班服', '1', '138', '柒度旗舰店', '2018-04-10 13:02:38', '133412189201081760', NULL, 0, NULL),
(674, 0, 0, 0, '订单结算', '9.8', '2018-04-20 11:19:30', '1.96', '0.03', '525694095950', 'WRZ X6重低音手机苹果电脑通用男女耳塞挂耳式运动入耳式耳机耳麦', '1', '88', '华胜天齐数码专营店', '2018-04-09 20:26:47', '133143474926361544', NULL, 0, NULL),
(675, 0, 0, 0, '订单结算', '9.9', '2018-04-15 11:07:22', '0.3', '0.1', '564754068556', '军医生亲肤丝滑脱毛膏 脱腋下腿毛私处去全身毛男女士学生不永久', '1', '129', '军医生旗舰店', '2018-04-07 15:31:07', '132453806899338142', NULL, 0, NULL),
(676, 0, 0, 0, '订单结算', '119', '2018-04-15 11:34:14', '0.6', '0.36', '562161593312', 'Amoi/夏新 F9无线双耳超小迷你隐形蓝牙耳机耳塞式入耳式运动跑步', '1', '399', 'amoi夏新安凯欣专卖店', '2018-04-04 18:26:11', '144785405405952681', NULL, 0, NULL),
(677, 0, 0, 0, '订单结算', '420', '2018-04-09 13:56:09', '6.3', '0', '565122473163', '婴儿童电动车四轮可坐遥控汽车1-3岁4-5摇摆童车宝宝玩具车可坐人', '1', '2190', '平湖童车城联盟猫咪铺', '2018-03-30 13:02:51', '142430719849483464', NULL, 0, NULL),
(678, 0, 0, 0, '订单结算', '268', '2018-04-02 12:05:26', '26.8', '0', '45719976291', '正品ERGO CHEF MY JUICER2家用榨汁机迷你果蔬多功能便携式果汁机', '1', '629', 'MY JUICER 品牌店', '2018-03-30 12:46:13', '142731342268386514', NULL, 0, NULL),
(679, 0, 0, 0, '订单结算', '41.9', '2018-04-08 13:31:29', '8.42', '0.21', '564209529498', '名流玻尿酸避孕套超薄0.01安全套情趣男用持久带刺阴蒂刺激狼牙棒', '1', '198', '盛信隆医疗器械专营店', '2018-03-29 10:31:48', '141950601826907060', NULL, 0, NULL),
(680, 0, 0, 0, '订单结算', '19.8', '2018-04-03 16:50:41', '5.94', '0.2', '558178811554', '双眼皮定型霜持久自然无痕隐形非永久胶水韩国双眼皮贴大眼神器', '1', '98', '瑜尊旗舰店', '2018-03-27 20:20:55', '141364392406081760', NULL, 0, NULL),
(681, 0, 0, 0, '订单结算', '268', '2018-04-06 17:24:50', '26.8', '0', '45719976291', '正品ERGO CHEF MY JUICER2家用榨汁机迷你果蔬多功能便携式果汁机', '1', '629', 'MY JUICER 品牌店', '2018-03-27 09:48:17', '141084224302008779', NULL, 0, NULL),
(682, 0, 0, 0, '订单结算', '52', '2018-04-03 16:52:03', '5.2', '0.52', '551450181906', 'Miss Candy牛油果护甲油指甲营养油指缘防干裂防倒刺修复滋润MC09', '1', '56.25', 'misscandy糖果小姐旗舰店', '2018-03-26 21:29:53', '140866581903081760', NULL, 0, NULL),
(683, 0, 0, 0, '订单结算', '39.9', '2018-04-03 16:52:05', '3.19', '0.2', '563615173767', '丝蕴洗发水深层修护洗发露修复适用烫染受损发质750ml*2洗发套装', '1', '79.9', '同鼎居家日用专营店', '2018-03-24 10:23:33', '139759938415081760', NULL, 0, NULL),
(684, 0, 0, 0, '订单结算', '29.8', '2018-04-01 11:35:52', '0.45', '0', '561328700348', '紫米面包紫米奶酪面包4层早餐黑米夹心整箱手撕紫薯面包散装食品', '1', '56', '馋嘴零食部', '2018-03-21 20:48:04', '138841677960081760', NULL, 0, NULL),
(685, 0, 0, 0, '订单结算', '152', '2018-03-29 13:26:21', '7.6', '0.76', '556565027916', '韩都衣舍2018新款女装春装韩版中长款显瘦针织衫开衫外套GW8446阨', '1', '338', '韩都衣舍旗舰店', '2018-03-19 11:15:29', '137807162906081760', NULL, 0, NULL),
(686, 0, 0, 0, '订单结算', '125', '2018-03-28 09:43:48', '6.25', '0.63', '39143908081', '正品欧莱雅发膜倒膜营养修复 干枯烫染受损补水护发素焗油膏免蒸', '2', '98', 'loreal芝曼专卖店', '2018-03-17 21:41:54', '137200907375081760', NULL, 0, NULL),
(687, 0, 0, 0, '订单结算', '139', '2018-03-25 10:08:31', '4.17', '0', '544761131177', '韩国 爱敬age20''s气垫bb霜水光精华水粉霜遮瑕持久保湿彩妆粉底膏', '1', '228', '欧欧韩国美妆 十年老店', '2018-03-15 08:04:30', '136009227312483464', NULL, 0, NULL),
(688, 0, 0, 0, '订单结算', '78', '2018-03-25 09:43:54', '31.2', '0.39', '564683610210', '脚气膏治脚氣喷剂止痒真菌感染去脱皮糜爤特傚泡脚脚痒脚臭烂脚丫', '2', '88', '葆顺堂旗舰店', '2018-03-14 17:55:11', '135856428158483464', NULL, 0, NULL),
(689, 0, 0, 0, '订单结算', '20', '2018-03-23 13:38:32', '6', '0.2', '554946626487', '雪玲妃手膜手蜡嫩白保湿去死皮角质淡化细纹脚膜护手霜手部护理', '1', '59', '雪玲妃旗舰店', '2018-03-13 12:23:31', '135240009281081760', NULL, 0, NULL),
(690, 0, 0, 0, '订单结算', '14.99', '2018-03-16 09:23:51', '0.45', '0.15', '557875802255', '香馜香水黑裙护手霜小支迷你秋冬季防干裂滋润保湿补水嫩肤男女', '1', '59', '香馜旗舰店', '2018-03-13 11:43:38', '135236538380081760', NULL, 0, NULL),
(691, 0, 0, 0, '订单结算', '26.8', '2018-03-16 09:23:13', '0.8', '0', '38594403959', '美甲工具套装全套 指甲油护理打磨抛光条 初学者基础修剪修甲用品', '1', '30.6', '甲如想美丽', '2018-03-13 11:06:20', '135201481432081760', NULL, 0, NULL),
(692, 0, 0, 0, '订单结算', '155', '2018-04-13 18:00:24', '0', '0', '563421561805', 'La Nikar 休闲外套女拉链连帽卫衣撞色拼接运动健身跑步训练上衣', '1', '218', 'La Nikar', '2018-03-12 12:41:56', '134826700656483464', NULL, 0, NULL),
(693, 0, 0, 0, '订单结算', '49.9', '2018-03-23 11:11:38', '1.5', '0.25', '558542523051', '清沐纯子餐厅纸巾批发抽纸家庭装整箱婴儿50包抽取式家用无香面纸', '1', '199', '清沐纯子旗舰店', '2018-03-12 12:33:07', '134824180076081760', NULL, 0, NULL),
(694, 0, 0, 0, '订单结算', '34.5', '2018-03-22 13:31:33', '1.73', '0', '564041513282', '染发剂植物蜂蜜黑茶色焦糖纯黑冷棕色亚麻染发膏天然不伤发无刺激', '1', '88', '寸草生化妆品', '2018-03-12 12:30:01', '134784367130081760', NULL, 0, NULL),
(695, 0, 0, 0, '订单结算', '45', '2018-03-16 09:23:39', '4.5', '0', '561147226247', '宠物剪刀美容剪修毛剪泰迪剪毛宠物美容工具套装双向弯剪宠物用品', '1', '60', '集派宠物用品', '2018-03-12 10:56:35', '134768630128081760', NULL, 0, NULL),
(696, 0, 0, 0, '订单结算', '55', '2018-03-22 11:29:11', '11', '0', '529076506410', '抽屉式收纳柜子塑料衣柜收纳盒衣服收纳箱多层加厚儿童储物柜鞋柜', '1', '130', '互动空间家居', '2018-03-12 08:12:08', '134713552867907060', NULL, 0, NULL),
(697, 0, 0, 0, '订单结算', '9.9', '2018-03-22 09:55:33', '0.15', '0.05', '45845116667', '南林竹炭包活性炭除甲醛活性炭包新房装修急入住吸味碳家用去甲醛', '1', '248', '南林旗舰店', '2018-03-12 07:44:33', '134701626929764874', NULL, 0, NULL),
(698, 0, 0, 0, '订单结算', '53.9', '2018-03-25 10:04:32', '10.78', '0', '529076506410', '抽屉式收纳柜子塑料衣柜收纳盒衣服收纳箱多层加厚儿童储物柜鞋柜', '1', '130', '互动空间家居', '2018-03-11 13:54:25', '134422100776952681', NULL, 0, NULL),
(699, 0, 0, 0, '订单结算', '40.28', '2018-03-21 15:09:06', '2.82', '0', '542091525365', '全新办公桌面收纳盒塑料多层小抽屉式文件化妆品收纳柜整理柜', '1', '88.2', '万福家居收纳馆', '2018-03-11 13:50:01', '134421288413952681', NULL, 0, NULL),
(700, 0, 0, 0, '订单结算', '14.9', '2018-03-13 11:23:03', '2.98', '0.07', '531666254048', '净佰俐84消毒液家用漂白衣物地板卫生间餐具杀菌消毒八四水批发', '1', '18', '净佰俐旗舰店', '2018-03-10 17:43:03', '134104806379738971', NULL, 0, NULL),
(701, 0, 0, 0, '订单结算', '128', '2018-03-19 20:33:47', '12.8', '0.64', '564043693254', '男士外套春季2018新款韩版潮流修身帅气春秋薄款学生休闲运动夹克', '1', '256', '乐舒服饰专营店', '2018-03-09 18:03:28', '133664282262483464', NULL, 0, NULL),
(702, 0, 0, 0, '订单结算', '204', '2018-03-20 22:13:43', '10.2', '1.02', '15395570012', '蓝月亮深层洁净亮白增艳洗衣液3kg 自然清香大瓶装机洗手洗温和', '5', '56.8', '蓝月亮官方旗舰店', '2018-03-09 09:44:16', '135732937130037701', NULL, 0, NULL),
(703, 0, 0, 0, '订单结算', '44.8', '2018-03-16 15:40:56', '2.24', '0.22', '15395570012', '蓝月亮深层洁净亮白增艳洗衣液3kg 自然清香大瓶装机洗手洗温和', '1', '56.8', '蓝月亮官方旗舰店', '2018-03-09 09:44:08', '123376795957800734', NULL, 0, NULL),
(704, 0, 0, 0, '订单结算', '74', '2018-03-15 14:24:43', '2.22', '0.37', '544077242899', '第九城双肩包男韩版时尚潮流大学生校园休闲书包男士高中旅行背包', '1', '399', '第九城旗舰店', '2018-03-05 08:27:57', '131136301453738971', NULL, 0, NULL),
(705, 0, 0, 0, '订单结算', '139', '2018-03-18 10:54:12', '27.8', '0.42', '562490459056', '利仁LR-D1805养生壶全自动加厚玻璃多功能电热烧水壶花茶壶煮茶器', '1', '499', '利仁电器旗舰店', '2018-03-04 13:07:46', '130825024387952681', NULL, 0, NULL),
(706, 0, 0, 0, '订单结算', '85', '2018-03-14 14:27:55', '25.5', '0.43', '45588248610', '阿道夫洗发水护发素正品套装轻柔丝滑洗发露膏洗护套装旗舰店官网', '1', '158', '阿道夫胜玉露专卖店', '2018-03-04 09:37:13', '130719102711869798', NULL, 0, NULL),
(707, 0, 0, 0, '订单结算', '35.8', '2018-03-12 10:08:56', '0.54', '0.18', '526328377395', '三根萝卜修手修脚指甲刀套装指甲剪套装指甲钳15件套不锈钢修甲刀', '1', '89', '三根萝卜旗舰店', '2018-03-02 08:32:54', '129738291328081760', NULL, 0, NULL),
(708, 0, 0, 0, '订单结算', '363.3', '2018-03-03 20:33:59', '5.45', '1.82', '554726565379', 'New Balance/NB 220系列 女鞋复古鞋跑步鞋休闲运动鞋WL220OG', '1', '519', 'New Balance旗舰店', '2018-03-01 19:30:45', '129618645778778082', NULL, 0, NULL),
(709, 0, 0, 0, '订单结算', '69.8', '2018-03-12 15:40:53', '1.05', '0', '558772487506', '防腐实木质花架子阳台多层地面组装花盆架客厅室内多肉绿萝盆景架', '1', '130', '小哥木制工艺品', '2018-02-21 13:00:08', '126244254486081760', NULL, 0, NULL),
(710, 0, 0, 0, '订单结算', '29.9', '2018-03-16 10:44:28', '7.48', '0', '555937893922', '鞋迷SNEAKER纳米防水喷雾剂鞋翻皮毛雪地靴麂皮球鞋防尘防污神器', '1', '39.9', 'Where''s the real me', '2018-02-21 10:27:52', '118320357631784630', NULL, 0, NULL),
(711, 0, 0, 0, '订单结算', '14', '2018-06-09 20:11:10', '0.84', '0', '45455095858', '晴雨伞女折叠两用遮阳伞太阳伞大号防晒防紫外线广告定制印字logo', '1', '123', '外带伞业', '2018-06-03 09:49:52', '154491933454552772', NULL, 0, NULL),
(712, 0, 0, 0, '订单结算', '18.12', '2018-06-06 12:59:16', '2.72', '0', '539423915976', '【狂欢价】美丽工匠 双眼皮贴蕾丝双眼皮隐形自然无痕网状仙女贴网红送胶水', '1', '49', '美丽工匠化妆品旗舰店', '2018-06-02 15:00:15', '154124886889081760', NULL, 0, NULL),
(713, 0, 0, 0, '订单结算', '25.93', '2018-06-06 13:00:35', '3.89', '0', '558290365767', '【狂欢价】美丽工匠 假睫毛轻柔自然裸妆浓密卷翘款透明梗素颜款3对装送胶水', '1', '39', '美丽工匠化妆品旗舰店', '2018-06-02 15:00:15', '154124886889081760', NULL, 0, NULL),
(714, 0, 0, 0, '订单结算', '12.54', '2018-06-06 12:59:37', '0.38', '0.13', '543791512706', '【狂欢价】美丽工匠  修眉剪刀带眉梳小梳子化妆剪眉毛初学者新手修眉刀工具', '1', '29', '美丽工匠化妆品旗舰店', '2018-06-02 15:00:15', '154124886889081760', NULL, 0, NULL),
(715, 0, 0, 0, '订单结算', '9.11', '2018-06-06 13:00:57', '1.37', '0', '565120562205', '【狂欢价】美丽工匠 网红便携式睫毛夹塑料小初学者卷翘持久迷你款送胶条', '1', '19.9', '美丽工匠化妆品旗舰店', '2018-06-02 15:00:15', '154124886889081760', NULL, 0, NULL),
(716, 0, 0, 0, '订单结算', '14', '2018-06-09 20:11:10', '0.84', '0', '45455095858', '晴雨伞女折叠两用遮阳伞太阳伞大号防晒防紫外线广告定制印字logo', '1', '123', '外带伞业', '2018-06-03 09:49:52', '154491933454552772', NULL, 0, NULL),
(717, 0, 0, 0, '订单结算', '18.12', '2018-06-06 12:59:16', '2.72', '0', '539423915976', '【狂欢价】美丽工匠 双眼皮贴蕾丝双眼皮隐形自然无痕网状仙女贴网红送胶水', '1', '49', '美丽工匠化妆品旗舰店', '2018-06-02 15:00:15', '154124886889081760', NULL, 0, NULL),
(718, 0, 0, 0, '订单结算', '25.93', '2018-06-06 13:00:35', '3.89', '0', '558290365767', '【狂欢价】美丽工匠 假睫毛轻柔自然裸妆浓密卷翘款透明梗素颜款3对装送胶水', '1', '39', '美丽工匠化妆品旗舰店', '2018-06-02 15:00:15', '154124886889081760', NULL, 0, NULL),
(719, 0, 0, 0, '订单结算', '12.54', '2018-06-06 12:59:37', '0.38', '0.13', '543791512706', '【狂欢价】美丽工匠  修眉剪刀带眉梳小梳子化妆剪眉毛初学者新手修眉刀工具', '1', '29', '美丽工匠化妆品旗舰店', '2018-06-02 15:00:15', '154124886889081760', NULL, 0, NULL),
(720, 0, 0, 0, '订单结算', '9.11', '2018-06-06 13:00:57', '1.37', '0', '565120562205', '【狂欢价】美丽工匠 网红便携式睫毛夹塑料小初学者卷翘持久迷你款送胶条', '1', '19.9', '美丽工匠化妆品旗舰店', '2018-06-02 15:00:15', '154124886889081760', NULL, 0, NULL),
(721, 0, 0, 0, '订单结算', '59', '2018-06-14 19:39:55', '4.72', '0.59', '37523448189', '【狂欢价】veet薇婷 蜜蜡脱毛男女士腋下脱腿毛膏学生蜡纸不永久非私处全身', '1', '83.9', 'veet薇婷旗舰店', '2018-06-10 10:24:48', '158702801622081760', NULL, 0, NULL),
(722, 0, 0, 0, '订单结算', '82', '2018-06-14 19:38:58', '2.87', '0.41', '40445644609', '【狂欢价】波奇网科德士宠物电推剪KP-3000猫狗狗剃毛器狗狗用品宠物剃毛器', '1', '246', '波奇网旗舰店', '2018-06-06 15:41:43', '156713263760081760', NULL, 0, NULL),
(723, 0, 0, 0, '订单结算', '108', '2018-06-15 08:46:21', '21.6', '0', '555192678312', 'FREEIN2018夏季新品书包大理石纹印花双肩包原创校园ins超火书包', '1', '298', 'FREEIN原创设计品牌', '2018-06-05 22:11:53', '172925871987192620', NULL, 0, NULL),
(724, 0, 0, 0, '订单结算', '43.12', '2018-06-14 19:39:15', '1.29', '0', '555760859188', '洁云卫生纸家用厕纸巾400张10包平板草纸家庭装加韧柔韧压花手纸', '1', '49', '优梵家居', '2018-06-04 19:48:04', '155487281268081760', NULL, 0, NULL),
(725, 0, 0, 0, '订单结算', '14', '2018-06-09 20:11:10', '0.84', '0', '45455095858', '晴雨伞女折叠两用遮阳伞太阳伞大号防晒防紫外线广告定制印字logo', '1', '123', '外带伞业', '2018-06-03 09:49:52', '154491933454552772', NULL, 0, NULL),
(726, 0, 0, 0, '订单结算', '16.9', '2018-06-13 13:34:59', '3.38', '0', '551879738742', 'a字裙百褶裙ulzzang短裙夏高腰半身裙女ins超火裙子2018新款格子', '1', '99', '语凝旗舰店', '2018-06-02 20:14:25', '170610214611282221', NULL, 0, NULL),
(727, 0, 0, 0, '订单结算', '18.12', '2018-06-06 12:59:16', '2.72', '0', '539423915976', '【狂欢价】美丽工匠 双眼皮贴蕾丝双眼皮隐形自然无痕网状仙女贴网红送胶水', '1', '49', '美丽工匠化妆品旗舰店', '2018-06-02 15:00:15', '154124886889081760', NULL, 0, NULL),
(728, 0, 0, 0, '订单结算', '25.93', '2018-06-06 13:00:35', '3.89', '0', '558290365767', '【狂欢价】美丽工匠 假睫毛轻柔自然裸妆浓密卷翘款透明梗素颜款3对装送胶水', '1', '39', '美丽工匠化妆品旗舰店', '2018-06-02 15:00:15', '154124886889081760', NULL, 0, NULL),
(729, 0, 0, 0, '订单结算', '12.54', '2018-06-06 12:59:37', '0.38', '0.13', '543791512706', '【狂欢价】美丽工匠  修眉剪刀带眉梳小梳子化妆剪眉毛初学者新手修眉刀工具', '1', '29', '美丽工匠化妆品旗舰店', '2018-06-02 15:00:15', '154124886889081760', NULL, 0, NULL),
(730, 0, 0, 0, '订单结算', '9.11', '2018-06-06 13:00:57', '1.37', '0', '565120562205', '【狂欢价】美丽工匠 网红便携式睫毛夹塑料小初学者卷翘持久迷你款送胶条', '1', '19.9', '美丽工匠化妆品旗舰店', '2018-06-02 15:00:15', '154124886889081760', NULL, 0, NULL),
(731, 0, 0, 0, '订单结算', '7', '2018-06-12 15:39:43', '2.1', '0', '16679231883', '【狂欢价】美丽工匠 盒装葫芦粉扑美妆蛋化妆海绵干湿两用水滴粉扑化妆工具', '1', '19.9', '美丽工匠化妆品旗舰店', '2018-06-02 14:55:58', '154062389353081760', NULL, 0, NULL);
INSERT INTO `tsg_order` (`id`, `delflag`, `createAt`, `updateAt`, `status`, `amount`, `dealTime`, `commissionAmount`, `subsidyAmount`, `productId`, `productName`, `productCount`, `productPrice`, `shopName`, `createTime`, `oid`, `withdrawalAt`, `isWithdrawal`, `fanli_id`) VALUES
(732, 0, 0, 0, '订单结算', '34.5', '2018-06-12 15:39:44', '5.18', '0', '540076073649', '【狂欢价】美丽工匠 皮质化妆刷具桶 美妆刷收纳筒收纳盒防尘防灰', '1', '99', '美丽工匠化妆品旗舰店', '2018-06-02 14:47:15', '154036852477081760', NULL, 0, NULL),
(733, 0, 0, 0, '订单结算', '26', '2018-06-12 09:37:55', '11.7', '0', '567127325865', '滚筒洗衣机罩防水防晒海尔美的小天鹅创维波轮上开盖防护套粉色', '1', '36', '天誉针织品店', '2018-06-01 18:26:57', '153572418303508454', 1529025007, 1, 17),
(734, 0, 0, 0, '订单结算', '132.71', '2018-06-02 15:02:11', '4.64', '0', '564314866023', '婴儿儿童摇马带音乐塑料小木马1周岁2宝宝礼物摇椅室内两用摇摇马', '1', '132.9', '佰佳乐玩具', '2018-05-28 13:25:13', '150938962254081760', NULL, 0, NULL),
(735, 0, 0, 0, '订单结算', '248', '2018-06-02 15:02:33', '62', '0', '559913562851', '素颜眼镜框女韩版潮复古小脸个性超轻金属眼睛框男文艺镜架配近视', '1', '369', '佐川太郎眼镜旗舰店', '2018-05-25 12:26:31', '149387005994081760', NULL, 0, NULL),
(736, 0, 0, 0, '订单结算', '91.72', '2018-05-27 17:03:06', '23.85', '0', '549553268062', '复古圆框眼镜男近视素颜眼镜框女圆形平光镜韩版潮眼睛框镜架学生', '1', '196', '百视康眼镜专营店', '2018-05-25 10:21:52', '149250616580907060', NULL, 0, NULL),
(737, 0, 0, 0, '订单结算', '54.28', '2018-05-27 17:05:06', '14.11', '0', '549553268062', '复古圆框眼镜男近视素颜眼镜框女圆形平光镜韩版潮眼睛框镜架学生', '1', '116', '百视康眼镜专营店', '2018-05-25 10:21:52', '149250616580907060', NULL, 0, NULL),
(738, 0, 0, 0, '订单结算', '59.9', '2018-06-02 08:48:23', '1.8', '0.3', '42215204468', '汽车收纳箱车载后备箱储物箱车内整理箱置物箱车用多功能车尾箱子', '1', '159.9', '友泰追风专卖店', '2018-05-22 20:27:59', '163596940621451029', NULL, 0, NULL),
(739, 0, 0, 0, '订单结算', '69', '2018-05-27 06:59:31', '5.52', '0.35', '566586201101', '改良旗袍女夏装2018新款少女黑复古中国风女装民族风连衣裙 sukol', '1', '128', '莫格旗舰店', '2018-05-21 13:26:34', '164664790312891461', NULL, 0, NULL),
(740, 0, 0, 0, '订单结算', '44', '2018-05-31 09:31:12', '2.2', '0', '566641927419', '夏装2018新款短袖女韩版冰丝针织衫纯色百搭荷叶边t恤打底衫薄款', '1', '168', '小薇姑娘 遇见美好', '2018-05-20 22:58:59', '164427967803081760', NULL, 0, NULL),
(741, 0, 0, 0, '订单结算', '3.99', '2018-05-31 11:37:22', '0.2', '0.02', '560812291830', '皮鞋鞋带圆形男女休闲马丁靴子黑色白色棕色细打蜡长鞋绳子带子短', '1', '4', '妆初过旗舰店', '2018-05-20 22:53:13', '164478952835081760', NULL, 0, NULL),
(742, 0, 0, 0, '订单结算', '7.98', '2018-05-31 11:37:46', '0.4', '0.04', '560851067859', '鞋带扁平帆布运动板鞋篮球鞋鞋带男女黑色白色韩版百搭浅灰色红色', '2', '4', '妆初过旗舰店', '2018-05-20 22:53:13', '164478952835081760', NULL, 0, NULL),
(743, 0, 0, 0, '订单结算', '78.31', '2018-05-31 17:08:16', '11.82', '0', '566450027916', 'ins超火复古温柔风冰丝针织高腰垂感阔腿裤夏女chic百褶薄款裤子', '1', '179.9', '曾小咸 HADDGISYSTUDIO', '2018-05-20 22:45:24', '164432783331081760', NULL, 0, NULL),
(744, 0, 0, 0, '订单结算', '49.59', '2018-05-30 22:29:44', '4.96', '0', '21843631263', '带胸垫裹胸 防走光抹胸运动小吊带背心 无钢圈文胸内衣瑜珈打底夏', '2', '49', '萝莉的诱惑', '2018-05-20 22:24:06', '164407331101081760', NULL, 0, NULL),
(745, 0, 0, 0, '订单结算', '45', '2018-05-30 21:42:44', '0.68', '0', '563046446910', '艺福堂胎玫瑰花茶80g+蜂蜜冻干柠檬片泡茶叶干片80g花草茶水果茶', '1', '59.6', '天猫超市', '2018-05-20 21:06:23', '164382745428081760', NULL, 0, NULL),
(746, 0, 0, 0, '订单结算', '52.9', '2018-05-30 21:42:44', '0.79', '0.26', '20896699903', '雀巢成人奶粉 安骼高钙高铁女士成人牛奶粉400g无蔗糖', '1', '99', '天猫超市', '2018-05-20 21:06:23', '164382745428081760', NULL, 0, NULL),
(747, 0, 0, 0, '订单结算', '150', '2018-06-01 14:25:40', '15', '0', '547603857981', '飘窗垫 窗台垫阳台垫子北欧定做现代简约欧式布艺四季通用防滑', '5', '30', '漫缘旗舰店', '2018-05-19 10:51:58', '163399918206081760', NULL, 0, NULL),
(748, 0, 0, 0, '订单结算', '590', '2018-05-28 14:00:48', '18.29', '5.9', '38548527755', '【新品上市】雅诗兰黛 红石榴能量水400ml清爽型补水保湿提亮肤色', '1', '590', 'Estee Lauder雅诗兰黛官方旗舰店', '2018-05-18 11:01:10', '161206580883784630', NULL, 0, NULL),
(749, 0, 0, 0, '订单结算', '55', '2018-05-19 22:55:13', '2.75', '0', '568520635118', '迷彩短裤男夏季新款运动工装短裤子大码五分裤军装宽松牛仔中裤潮', '1', '55', 'HOO自营店', '2018-05-17 17:47:04', '161018450468548834', NULL, 0, NULL),
(750, 0, 0, 0, '订单结算', '95', '2018-05-27 14:20:03', '19', '0', '550966324920', '北欧 纯棉布艺地毯卧室茶几床边垫爬行榻榻米地垫防滑可手洗机洗', '1', '190', '优蔓家纺专营店', '2018-05-17 12:34:01', '162419469333081760', NULL, 0, NULL),
(751, 0, 0, 0, '订单结算', '49.9', '2018-05-27 20:10:13', '14.97', '0', '568354668811', 'usb迷你加湿器静音家用卧室小型办公室桌面车载便携空气补水喷雾', '1', '99', '菲弛数码专营店', '2018-05-17 10:26:43', '162345887503081760', NULL, 0, NULL),
(752, 0, 0, 0, '订单结算', '13.27', '2018-05-26 20:45:45', '0.27', '0.07', '15593025545', '狗狗零食磨牙补钙泰迪金毛法斗小狗吃的饼干洁齿除口臭训练零食', '1', '13.8', '华元宠物用品专营店', '2018-05-16 12:35:17', '161904382375081760', NULL, 0, NULL),
(753, 0, 0, 0, '订单结算', '17.3', '2018-05-26 20:46:45', '0.35', '0.09', '39967850893', '誉丰 牛奶鸡蛋小馒头泰迪磨牙除臭宠物饼干 幼犬训练奖励狗狗零食', '1', '18', '华元宠物用品专营店', '2018-05-16 12:35:17', '161904382375081760', NULL, 0, NULL),
(754, 0, 0, 0, '订单结算', '70.75', '2018-05-26 20:47:23', '10.61', '0', '39674999756', '狗狗垫子可拆洗夏天凉席睡垫泰迪降温窝地垫狗窝夏季宠物冰垫四季', '2', '36.8', '华元宠物用品专营店', '2018-05-16 12:35:16', '161904382375081760', NULL, 0, NULL),
(755, 0, 0, 0, '订单结算', '22.98', '2018-05-26 20:47:03', '0.46', '0.11', '15472733204', '誉丰 狗狗零食除臭狗饼干幼犬磨牙棒洁齿除口臭泰迪比熊宠物补钙', '1', '30', '华元宠物用品专营店', '2018-05-16 12:35:16', '161904382375081760', NULL, 0, NULL),
(756, 0, 0, 0, '订单结算', '158', '2018-06-24 16:23:31', '4.74', '0.00 %', '571675583409', '凉鞋女夏2018新款韩版厚底鞋女中跟一字扣时尚露趾蝴蝶结鞋女', '1', '158', '灰姑娘的另一只鞋', '2018-06-20 22:23:33', '--', NULL, 0, NULL),
(757, 0, 0, 0, '订单结算', '49.9', '2018-06-24 16:23:38', '2', '0.50 %', '558542523051', '清沐纯子餐厅用纸巾批发抽纸家庭装整箱婴儿500抽取式家用无香纸', '1', '199', '清沐纯子旗舰店', '2018-06-19 16:10:45', '--', NULL, 0, NULL),
(758, 0, 0, 0, '订单结算', '88', '2018-06-18 18:29:04', '17.6', '0.00 %', '536607961349', '【狂欢价】情侣戒指一对男女纯银对戒日韩原创设计简约活口时间素戒刻字礼物', '1', '298', '卡蒂罗旗舰店', '2018-06-15 20:17:29', '--', NULL, 0, NULL),
(759, 0, 0, 0, '订单结算', '24.8', '2018-06-24 11:10:18', '0.37', '0.50 %', '536550152806', '【狂欢价】北伦美电动车雨衣摩托自行车带袖双大帽檐加大单人男女成人雨披', '1', '113.7', '北伦美旗舰店', '2018-06-14 10:47:33', '--', NULL, 0, NULL),
(760, 0, 0, 0, '订单结算', '54.99', '2018-06-24 13:52:54', '2.75', '0.00 %', '570763649679', '衬衫女2018夏装新款韩版宽松五分袖条纹拼接白色蝴蝶结假两件上衣', '1', '99', '茉语家', '2018-06-13 21:22:35', '--', NULL, 0, NULL),
(761, 0, 0, 0, '订单结算', '137.2', '2018-06-24 13:43:25', '6.86', '0.00 %', '569387440722', '棉麻连体裤女夏无袖2018新款韩版休闲宽松高腰连衣阔腿裤紫色裤子', '1', '198', '三木自制女装', '2018-06-13 20:50:10', '--', NULL, 0, NULL),
(762, 0, 0, 0, '订单结算', '43.8', '2018-06-23 15:11:38', '8.76', '0.00 %', '549225953295', '品胜iPhone6数据线6s苹果5s充电线器手机7Plus加长5快充se单头8X原裝正品iphonex冲电sp平板电', '2', '28', '辰耀数码专营店', '2018-06-13 13:20:19', '--', NULL, 0, NULL),
(763, 0, 0, 0, '订单结算', '46', '2018-06-23 13:43:38', '2.3', '0.00 %', '565017949432', '2018新款春装冰丝针织衫女套头七分袖条纹一字肩打底衫修身短款', '1', '168', '小薇姑娘 遇见美好', '2018-06-13 10:46:28', '--', NULL, 0, NULL),
(764, 0, 0, 0, '订单结算', '33.9', '2018-06-20 23:00:45', '3.39', '0.00 %', '565351003168', '美特斯邦威男装旗舰店体恤衫圆领短袖汗衫男短袖T恤官方正品', '1', '39', '美特斯邦威Meters Bonwe', '2018-06-13 00:47:59', '--', NULL, 0, NULL),
(765, 0, 0, 0, '订单结算', '19.9', '2018-06-16 02:53:02', '3.98', '0.00 %', '567140015001', '日系男士原宿港风情侣装韩版短袖白色T恤宽松个性简约上衣体恤潮', '1', '198', '熊大大情侣装旗航店', '2018-06-12 01:27:29', '--', NULL, 0, NULL),
(766, 0, 0, 0, '订单结算', '59', '2018-06-14 19:39:55', '4.72', '1.00 %', '37523448189', '【狂欢价】veet薇婷 蜜蜡脱毛男女士腋下脱腿毛膏学生蜡纸不永久非私处全身', '1', '83.9', 'veet薇婷旗舰店', '2018-06-10 10:24:48', '--', NULL, 0, NULL),
(767, 0, 0, 0, '订单结算', '39.8', '2018-06-24 10:56:16', '11.94', '0.00 %', '563457038105', '海飞丝洗发水750ml正品控油去屑止痒丝质柔滑型男女士通用洗发露', '1', '148', '鑫淼洗化用品店', '2018-06-09 19:16:11', '--', NULL, 0, NULL),
(768, 0, 0, 0, '订单结算', '18', '2018-06-17 13:18:05', '0.9', '0.30 %', '565665844803', '可爱小猪iphone8/X手机壳简约卡通女款7plus苹果6s全包软硅胶套潮', '1', '58', '诚一数码专营店', '2018-06-06 22:43:56', '--', NULL, 0, NULL),
(769, 0, 0, 0, '订单结算', '18', '2018-06-17 13:19:42', '0.9', '0.30 %', '565665844803', '可爱小猪iphone8/X手机壳简约卡通女款7plus苹果6s全包软硅胶套潮', '1', '58', '诚一数码专营店', '2018-06-06 22:43:56', '--', NULL, 0, NULL),
(770, 0, 0, 0, '订单结算', '82', '2018-06-14 19:38:58', '2.87', '0.50 %', '40445644609', '【狂欢价】波奇网科德士宠物电推剪KP-3000猫狗狗剃毛器狗狗用品宠物剃毛器', '1', '246', '波奇网旗舰店', '2018-06-06 15:41:43', '--', NULL, 0, NULL),
(771, 0, 0, 0, '订单结算', '108', '2018-06-15 08:46:21', '21.6', '0.00 %', '555192678312', 'FREEIN2018夏季新品书包大理石纹印花双肩包原创校园ins超火书包', '1', '298', 'FREEIN原创设计品牌', '2018-06-05 22:11:53', '--', NULL, 0, NULL),
(772, 0, 0, 0, '订单结算', '43.12', '2018-06-14 19:39:15', '1.29', '0.00 %', '555760859188', '洁云卫生纸家用厕纸巾400张10包平板草纸家庭装加韧柔韧压花手纸', '1', '49', '优梵家居', '2018-06-04 19:48:04', '--', NULL, 0, NULL),
(773, 0, 0, 0, '订单结算', '14', '2018-06-09 20:11:10', '0.84', '0.00 %', '45455095858', '晴雨伞女折叠两用遮阳伞太阳伞大号防晒防紫外线广告定制印字logo', '1', '123', '外带伞业', '2018-06-03 09:49:52', '--', NULL, 0, NULL),
(774, 0, 0, 0, '订单结算', '16.9', '2018-06-13 13:34:59', '3.38', '0.00 %', '551879738742', 'a字裙百褶裙ulzzang短裙夏高腰半身裙女ins超火裙子2018新款格子', '1', '99', '语凝旗舰店', '2018-06-02 20:14:25', '--', NULL, 0, NULL),
(775, 0, 0, 0, '订单结算', '18.12', '2018-06-06 12:59:16', '2.72', '0.00 %', '539423915976', '【狂欢价】美丽工匠 双眼皮贴蕾丝双眼皮隐形自然无痕网状仙女贴网红送胶水', '1', '49', '美丽工匠化妆品旗舰店', '2018-06-02 15:00:15', '淘宝客活动', NULL, 0, NULL),
(776, 0, 0, 0, '订单结算', '25.93', '2018-06-06 13:00:35', '3.89', '0.00 %', '558290365767', '【狂欢价】美丽工匠 假睫毛轻柔自然裸妆浓密卷翘款透明梗素颜款3对装送胶水', '1', '39', '美丽工匠化妆品旗舰店', '2018-06-02 15:00:15', '淘宝客活动', NULL, 0, NULL),
(777, 0, 0, 0, '订单结算', '12.54', '2018-06-06 12:59:37', '0.38', '1.00 %', '543791512706', '【狂欢价】美丽工匠  修眉剪刀带眉梳小梳子化妆剪眉毛初学者新手修眉刀工具', '1', '29', '美丽工匠化妆品旗舰店', '2018-06-02 15:00:15', '--', NULL, 0, NULL),
(778, 0, 0, 0, '订单结算', '9.11', '2018-06-06 13:00:57', '1.37', '0.00 %', '565120562205', '【狂欢价】美丽工匠 网红便携式睫毛夹塑料小初学者卷翘持久迷你款送胶条', '1', '19.9', '美丽工匠化妆品旗舰店', '2018-06-02 15:00:15', '淘宝客活动', NULL, 0, NULL),
(779, 0, 0, 0, '订单结算', '7', '2018-06-12 15:39:43', '2.1', '0.00 %', '16679231883', '【狂欢价】美丽工匠 盒装葫芦粉扑美妆蛋化妆海绵干湿两用水滴粉扑化妆工具', '1', '19.9', '美丽工匠化妆品旗舰店', '2018-06-02 14:55:58', '--', NULL, 0, NULL),
(780, 0, 0, 0, '订单结算', '34.5', '2018-06-12 15:39:44', '5.18', '0.00 %', '540076073649', '【狂欢价】美丽工匠 皮质化妆刷具桶 美妆刷收纳筒收纳盒防尘防灰', '1', '99', '美丽工匠化妆品旗舰店', '2018-06-02 14:47:15', '淘宝客活动', NULL, 0, NULL),
(781, 0, 0, 0, '订单结算', '26', '2018-06-12 09:37:55', '11.7', '0.00 %', '567127325865', '滚筒洗衣机罩防水防晒海尔美的小天鹅创维波轮上开盖防护套粉色', '1', '36', '天誉针织品店', '2018-06-01 18:26:57', '--', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `tsg_picture`
--

CREATE TABLE IF NOT EXISTS `tsg_picture` (
  `id` int(10) unsigned NOT NULL COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tsg_picture`
--

INSERT INTO `tsg_picture` (`id`, `path`, `url`, `md5`, `sha1`, `status`, `create_time`) VALUES
(1, '/Uploads/Picture/2017-11-28/5a1cc32ae764c.jpg', '', 'f824c3cd001b8d6ad563716735f79a52', '485dc89104973794871c349244aaef9eb41d0b40', 1, 1511834410),
(2, '/Uploads/Picture/2017-11-28/5a1cc3ab3ca74.jpg', '', 'ad41ca7ef2d4eafcf826e64b8b8d4bc7', '1470f5759139859a4736374cc628c2b53ca4fd42', 1, 1511834539),
(3, '/Uploads/Picture/2018-01-08/5a52ed5525b08.jpg', '', '7e59b6d7e0329e8cd9e1b3261ddd2667', '543f57b0f4e79b8112b07df6b109eb3a507548d1', 1, 1515384149),
(4, '/Uploads/Picture/2018-01-08/5a52eddac29d9.jpg', '', '350eabe34c593992b207a2788464a6ce', '6317a096e38e84c06bdfa390c5035ffa164f1627', 1, 1515384282);

-- --------------------------------------------------------

--
-- 表的结构 `tsg_ucenter_admin`
--

CREATE TABLE IF NOT EXISTS `tsg_ucenter_admin` (
  `id` int(10) unsigned NOT NULL COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- --------------------------------------------------------

--
-- 表的结构 `tsg_ucenter_app`
--

CREATE TABLE IF NOT EXISTS `tsg_ucenter_app` (
  `id` int(10) unsigned NOT NULL COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表';

-- --------------------------------------------------------

--
-- 表的结构 `tsg_ucenter_member`
--

CREATE TABLE IF NOT EXISTS `tsg_ucenter_member` (
  `id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- 转存表中的数据 `tsg_ucenter_member`
--

INSERT INTO `tsg_ucenter_member` (`id`, `username`, `password`, `email`, `mobile`, `reg_time`, `reg_ip`, `last_login_time`, `last_login_ip`, `update_time`, `status`) VALUES
(1, 'admin', '94cf4209ec3a517e6936fcf427ba7c02', 'yfsoftcom@126.com', '', 1525413849, 986770109, 1551076192, 1968397070, 1525413849, 1);

-- --------------------------------------------------------

--
-- 表的结构 `tsg_ucenter_setting`
--

CREATE TABLE IF NOT EXISTS `tsg_ucenter_setting` (
  `id` int(10) unsigned NOT NULL COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';

-- --------------------------------------------------------

--
-- 表的结构 `tsg_url`
--

CREATE TABLE IF NOT EXISTS `tsg_url` (
  `id` int(11) unsigned NOT NULL COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表';

-- --------------------------------------------------------

--
-- 表的结构 `tsg_userdata`
--

CREATE TABLE IF NOT EXISTS `tsg_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tsg_withdrawal`
--

CREATE TABLE IF NOT EXISTS `tsg_withdrawal` (
  `id` int(11) NOT NULL,
  `delflag` tinyint(4) NOT NULL DEFAULT '0',
  `createAt` bigint(20) NOT NULL,
  `updateAt` bigint(20) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT '0',
  `applyAt` bigint(20) NOT NULL,
  `clientid` int(11) NOT NULL,
  `alipay` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'WAITING',
  `dealAt` bigint(20) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `dealName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tsg_withdrawal`
--

INSERT INTO `tsg_withdrawal` (`id`, `delflag`, `createAt`, `updateAt`, `amount`, `applyAt`, `clientid`, `alipay`, `status`, `dealAt`, `comment`, `dealName`) VALUES
(1, 0, 1516429939, 0, 10, 1516429939, 3, '18112760275', 'DEAL', NULL, '返利', '17625580501'),
(2, 0, 1516429939, 1516429939, 10, 1516429939, 3, '18112760275', 'WAITING', 0, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tsg_action`
--
ALTER TABLE `tsg_action`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tsg_action_log`
--
ALTER TABLE `tsg_action_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `action_ip_ix` (`action_ip`),
  ADD KEY `action_id_ix` (`action_id`),
  ADD KEY `user_id_ix` (`user_id`);

--
-- Indexes for table `tsg_addons`
--
ALTER TABLE `tsg_addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tsg_attachment`
--
ALTER TABLE `tsg_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_record_status` (`record_id`,`status`);

--
-- Indexes for table `tsg_attribute`
--
ALTER TABLE `tsg_attribute`
  ADD PRIMARY KEY (`id`),
  ADD KEY `model_id` (`model_id`);

--
-- Indexes for table `tsg_auth_extend`
--
ALTER TABLE `tsg_auth_extend`
  ADD UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  ADD KEY `uid` (`group_id`),
  ADD KEY `group_id` (`extend_id`);

--
-- Indexes for table `tsg_auth_group`
--
ALTER TABLE `tsg_auth_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tsg_auth_group_access`
--
ALTER TABLE `tsg_auth_group_access`
  ADD UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `tsg_auth_rule`
--
ALTER TABLE `tsg_auth_rule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module` (`module`,`status`,`type`);

--
-- Indexes for table `tsg_category`
--
ALTER TABLE `tsg_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_name` (`name`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `tsg_channel`
--
ALTER TABLE `tsg_channel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `tsg_client`
--
ALTER TABLE `tsg_client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tsg_config`
--
ALTER TABLE `tsg_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_name` (`name`),
  ADD KEY `type` (`type`),
  ADD KEY `group` (`group`);

--
-- Indexes for table `tsg_document`
--
ALTER TABLE `tsg_document`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_category_status` (`category_id`,`status`),
  ADD KEY `idx_status_type_pid` (`status`,`uid`,`pid`);

--
-- Indexes for table `tsg_document_article`
--
ALTER TABLE `tsg_document_article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tsg_document_download`
--
ALTER TABLE `tsg_document_download`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tsg_fanli_apply`
--
ALTER TABLE `tsg_fanli_apply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tsg_feedback`
--
ALTER TABLE `tsg_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tsg_file`
--
ALTER TABLE `tsg_file`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_md5` (`md5`);

--
-- Indexes for table `tsg_hooks`
--
ALTER TABLE `tsg_hooks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `tsg_images`
--
ALTER TABLE `tsg_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tsg_member`
--
ALTER TABLE `tsg_member`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tsg_menu`
--
ALTER TABLE `tsg_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `tsg_model`
--
ALTER TABLE `tsg_model`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tsg_oauth`
--
ALTER TABLE `tsg_oauth`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tsg_order`
--
ALTER TABLE `tsg_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tsg_picture`
--
ALTER TABLE `tsg_picture`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tsg_ucenter_admin`
--
ALTER TABLE `tsg_ucenter_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tsg_ucenter_app`
--
ALTER TABLE `tsg_ucenter_app`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tsg_ucenter_member`
--
ALTER TABLE `tsg_ucenter_member`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tsg_ucenter_setting`
--
ALTER TABLE `tsg_ucenter_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tsg_url`
--
ALTER TABLE `tsg_url`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_url` (`url`);

--
-- Indexes for table `tsg_userdata`
--
ALTER TABLE `tsg_userdata`
  ADD UNIQUE KEY `uid` (`uid`,`type`,`target_id`);

--
-- Indexes for table `tsg_withdrawal`
--
ALTER TABLE `tsg_withdrawal`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tsg_action`
--
ALTER TABLE `tsg_action`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tsg_action_log`
--
ALTER TABLE `tsg_action_log`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=85;
--
-- AUTO_INCREMENT for table `tsg_addons`
--
ALTER TABLE `tsg_addons`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `tsg_attachment`
--
ALTER TABLE `tsg_attachment`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tsg_attribute`
--
ALTER TABLE `tsg_attribute`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `tsg_auth_group`
--
ALTER TABLE `tsg_auth_group`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tsg_auth_rule`
--
ALTER TABLE `tsg_auth_rule`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',AUTO_INCREMENT=217;
--
-- AUTO_INCREMENT for table `tsg_category`
--
ALTER TABLE `tsg_category`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `tsg_channel`
--
ALTER TABLE `tsg_channel`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tsg_client`
--
ALTER TABLE `tsg_client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=135;
--
-- AUTO_INCREMENT for table `tsg_config`
--
ALTER TABLE `tsg_config`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `tsg_document`
--
ALTER TABLE `tsg_document`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tsg_fanli_apply`
--
ALTER TABLE `tsg_fanli_apply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `tsg_feedback`
--
ALTER TABLE `tsg_feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tsg_file`
--
ALTER TABLE `tsg_file`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID';
--
-- AUTO_INCREMENT for table `tsg_hooks`
--
ALTER TABLE `tsg_hooks`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `tsg_images`
--
ALTER TABLE `tsg_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=96;
--
-- AUTO_INCREMENT for table `tsg_member`
--
ALTER TABLE `tsg_member`
  MODIFY `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tsg_menu`
--
ALTER TABLE `tsg_menu`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',AUTO_INCREMENT=130;
--
-- AUTO_INCREMENT for table `tsg_model`
--
ALTER TABLE `tsg_model`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tsg_oauth`
--
ALTER TABLE `tsg_oauth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=139;
--
-- AUTO_INCREMENT for table `tsg_order`
--
ALTER TABLE `tsg_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=782;
--
-- AUTO_INCREMENT for table `tsg_picture`
--
ALTER TABLE `tsg_picture`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tsg_ucenter_admin`
--
ALTER TABLE `tsg_ucenter_admin`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID';
--
-- AUTO_INCREMENT for table `tsg_ucenter_app`
--
ALTER TABLE `tsg_ucenter_app`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID';
--
-- AUTO_INCREMENT for table `tsg_ucenter_member`
--
ALTER TABLE `tsg_ucenter_member`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tsg_ucenter_setting`
--
ALTER TABLE `tsg_ucenter_setting`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID';
--
-- AUTO_INCREMENT for table `tsg_url`
--
ALTER TABLE `tsg_url`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识';
--
-- AUTO_INCREMENT for table `tsg_withdrawal`
--
ALTER TABLE `tsg_withdrawal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
