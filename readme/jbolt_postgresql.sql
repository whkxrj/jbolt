/*
 Navicat Premium Data Transfer

 Source Server         : Postgresql
 Source Server Type    : PostgreSQL
 Source Server Version : 90616
 Source Host           : localhost:5432
 Source Catalog        : jbolt
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 90616
 File Encoding         : 65001

 Date: 23/02/2020 23:32:23
*/


-- ----------------------------
-- Table structure for jb_application
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_application";
CREATE TABLE "public"."jb_application" (
  "id" int4 NOT NULL DEFAULT nextval('jb_application_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "brief_info" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "app_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "app_secret" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "enable" char(1) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 0,
  "create_time" timestamp(6) NOT NULL,
  "update_time" timestamp(6) NOT NULL,
  "user_id" int4 NOT NULL,
  "update_user_id" int4 NOT NULL,
  "type" int4 NOT NULL,
  "need_check_sign" char(1) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "public"."jb_application"."id" IS '主键ID';
COMMENT ON COLUMN "public"."jb_application"."name" IS '应用名称';
COMMENT ON COLUMN "public"."jb_application"."brief_info" IS '应用简介';
COMMENT ON COLUMN "public"."jb_application"."app_id" IS '应用ID';
COMMENT ON COLUMN "public"."jb_application"."app_secret" IS '应用密钥';
COMMENT ON COLUMN "public"."jb_application"."enable" IS '是否启用';
COMMENT ON COLUMN "public"."jb_application"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."jb_application"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."jb_application"."user_id" IS '创建用户ID';
COMMENT ON COLUMN "public"."jb_application"."update_user_id" IS '更新用户ID';
COMMENT ON COLUMN "public"."jb_application"."type" IS 'app类型';
COMMENT ON COLUMN "public"."jb_application"."need_check_sign" IS '是否需要接口校验SIGN';
COMMENT ON TABLE "public"."jb_application" IS 'API应用中心的应用APP';

-- ----------------------------
-- Records of jb_application
-- ----------------------------
INSERT INTO "public"."jb_application" VALUES (17, 'JFinal电商小程序', 'JFinal电商小程序', 'jbyeu0hdq03tolt', 'bGd5dWh6N2VjNGd4aWVlM2M1MWk3ZmNxMHRmZm51eHU=', '1', '2019-10-19 19:46:06', '2019-12-13 22:19:46.512', 1, 1, 1, '0');

-- ----------------------------
-- Table structure for jb_brand
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_brand";
CREATE TABLE "public"."jb_brand" (
  "id" int4 NOT NULL DEFAULT nextval('jb_brand_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "enable" char(1) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 0,
  "sort_rank" int4 NOT NULL,
  "url" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "logo" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "remark" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "english_name" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."jb_brand"."sort_rank" IS '排序';
COMMENT ON COLUMN "public"."jb_brand"."url" IS '网址';
COMMENT ON COLUMN "public"."jb_brand"."logo" IS 'logo地址';
COMMENT ON COLUMN "public"."jb_brand"."remark" IS '备注描述';
COMMENT ON COLUMN "public"."jb_brand"."english_name" IS '英文名';
COMMENT ON TABLE "public"."jb_brand" IS '品牌';

-- ----------------------------
-- Records of jb_brand
-- ----------------------------
INSERT INTO "public"."jb_brand" VALUES (3, '阿迪达斯', '1', 3, NULL, 'upload/mall/brand/20190712/e565db09-6880-43ea-8086-cb81130fa328.png', NULL, 'addiss');
INSERT INTO "public"."jb_brand" VALUES (4, '乔丹', '1', 4, NULL, 'upload/mall/brand/20190712/210d3dad-d58f-458e-8173-55eee8115942.jpg', NULL, 'johdy');
INSERT INTO "public"."jb_brand" VALUES (6, '唐朝', '1', 6, NULL, 'upload/mall/brand/20190712/0f0b5d4f-b9c0-468b-98c4-8b8068dee971.jpg', NULL, 'tangcaosoft');
INSERT INTO "public"."jb_brand" VALUES (7, '无与伦比', '1', 7, NULL, 'upload/mall/brand/20190712/3e653be5-6f3d-423a-9d1a-50fb8ab8ff56.jpg', NULL, 'wylb');
INSERT INTO "public"."jb_brand" VALUES (9, '324234', '1', 9, NULL, NULL, NULL, '234');
INSERT INTO "public"."jb_brand" VALUES (10, '2342324', '1', 10, '234', NULL, '234', '234');
INSERT INTO "public"."jb_brand" VALUES (11, 'asd', '1', 9, 'asd', NULL, 'asd', 'asd');
INSERT INTO "public"."jb_brand" VALUES (5, '葫芦娃', '1', 5, NULL, 'upload/mall/brand/20190712/fa7cd969-87f0-44cb-809d-bbb402f4401c.png', NULL, 'hlw');
INSERT INTO "public"."jb_brand" VALUES (14, '123', '1', 9, '123', NULL, '123', '123');
INSERT INTO "public"."jb_brand" VALUES (15, '111', '1', 10, '111', NULL, '111', '111');
INSERT INTO "public"."jb_brand" VALUES (16, '6666', '1', 11, '6666', NULL, '6666', '6666');

-- ----------------------------
-- Table structure for jb_change_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_change_log";
CREATE TABLE "public"."jb_change_log" (
  "id" int4 NOT NULL DEFAULT nextval('jb_change_log_id_seq'::regclass),
  "content" text COLLATE "pg_catalog"."default" NOT NULL,
  "create_time" timestamp(6) NOT NULL,
  "jbolt_version_id" int4 NOT NULL
)
;
COMMENT ON COLUMN "public"."jb_change_log"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."jb_change_log"."jbolt_version_id" IS 'jbolt版本ID';
COMMENT ON TABLE "public"."jb_change_log" IS 'changeLog';

-- ----------------------------
-- Records of jb_change_log
-- ----------------------------
INSERT INTO "public"."jb_change_log" VALUES (5, '<p>最新版本的内容</p>', '2019-03-16 00:18:12', 2);
INSERT INTO "public"."jb_change_log" VALUES (6, '<p>测试厕撒大声地测试</p>', '2019-03-18 10:24:08', 3);
INSERT INTO "public"."jb_change_log" VALUES (7, '<p><img><br></p>', '2019-06-20 03:00:55', 4);
INSERT INTO "public"."jb_change_log" VALUES (8, '<p>1萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多萨达大所多</p><p><img src="/upload/jboltversion/20191110/ebe3f2f5-29a2-43c0-89d1-1ed5561d303f.jpeg" style="width: 500px;"><br></p>', '2019-09-11 00:42:55', 8);
INSERT INTO "public"."jb_change_log" VALUES (9, '<p>wasdsad</p>', '2019-09-21 21:45:43', 5);
INSERT INTO "public"."jb_change_log" VALUES (10, '<p>这是changelog内容</p><p><img src="/upload/jboltversion/20190922/0ba0f57d-b166-41ad-8935-7da865c66789.png" style="width: 427px;"><br></p>', '2019-09-22 00:18:05', 9);

-- ----------------------------
-- Table structure for jb_demotable
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_demotable";
CREATE TABLE "public"."jb_demotable" (
  "id" int4 NOT NULL,
  "demo_date" date,
  "demo_time" time(6),
  "demo_date_time" timestamp(6),
  "demo_week" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "demo_month" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "time" time(6),
  "enable" char(1) COLLATE "pg_catalog"."default",
  "pid" int4,
  "sort_rank" int4,
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "age" int4,
  "breif_info" varchar(255) COLLATE "pg_catalog"."default",
  "is_system_admin" char(1) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."jb_demotable"."id" IS '主键ID
';
COMMENT ON COLUMN "public"."jb_demotable"."demo_date" IS 'demo日期';
COMMENT ON COLUMN "public"."jb_demotable"."demo_time" IS 'demo时间';
COMMENT ON COLUMN "public"."jb_demotable"."demo_date_time" IS 'demo日期与时间';
COMMENT ON COLUMN "public"."jb_demotable"."demo_week" IS 'demo周';
COMMENT ON COLUMN "public"."jb_demotable"."demo_month" IS 'demo月';
COMMENT ON COLUMN "public"."jb_demotable"."time" IS 'demo纯时间';
COMMENT ON COLUMN "public"."jb_demotable"."enable" IS '启用';
COMMENT ON COLUMN "public"."jb_demotable"."pid" IS '父级ID';
COMMENT ON COLUMN "public"."jb_demotable"."sort_rank" IS '序号';
COMMENT ON COLUMN "public"."jb_demotable"."name" IS '姓名';
COMMENT ON COLUMN "public"."jb_demotable"."age" IS '年龄';
COMMENT ON COLUMN "public"."jb_demotable"."breif_info" IS '简介';
COMMENT ON COLUMN "public"."jb_demotable"."is_system_admin" IS '是否为管理';

-- ----------------------------
-- Table structure for jb_dictionary
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_dictionary";
CREATE TABLE "public"."jb_dictionary" (
  "id" int4 NOT NULL DEFAULT nextval('jb_dictionary_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "type_id" int4 NOT NULL,
  "pid" int4 NOT NULL,
  "sort_rank" int4 NOT NULL,
  "sn" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "type_key" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."jb_dictionary"."id" IS '字典ID主键';
COMMENT ON COLUMN "public"."jb_dictionary"."name" IS '名称';
COMMENT ON COLUMN "public"."jb_dictionary"."type_id" IS '字典类型ID';
COMMENT ON COLUMN "public"."jb_dictionary"."pid" IS '父类ID';
COMMENT ON COLUMN "public"."jb_dictionary"."sort_rank" IS '排序';
COMMENT ON COLUMN "public"."jb_dictionary"."sn" IS '编号编码';
COMMENT ON COLUMN "public"."jb_dictionary"."type_key" IS '字典类型KEY';
COMMENT ON TABLE "public"."jb_dictionary" IS '字典表';

-- ----------------------------
-- Records of jb_dictionary
-- ----------------------------
INSERT INTO "public"."jb_dictionary" VALUES (153, 'PDF文件', 9, 0, 1, '为其 第三方', 'fileType');
INSERT INTO "public"."jb_dictionary" VALUES (154, 'Zip压缩包', 9, 0, 2, NULL, 'fileType');
INSERT INTO "public"."jb_dictionary" VALUES (156, 'Excel表格', 9, 0, 3, NULL, 'fileType');
INSERT INTO "public"."jb_dictionary" VALUES (157, 'PPT幻灯片', 9, 0, 4, NULL, 'fileType');
INSERT INTO "public"."jb_dictionary" VALUES (158, '个', 11, 0, 1, NULL, 'goodsunit');
INSERT INTO "public"."jb_dictionary" VALUES (159, '件', 11, 0, 2, NULL, 'goodsunit');
INSERT INTO "public"."jb_dictionary" VALUES (160, '双', 11, 0, 3, NULL, 'goodsunit');
INSERT INTO "public"."jb_dictionary" VALUES (161, '桶', 11, 0, 4, NULL, 'goodsunit');
INSERT INTO "public"."jb_dictionary" VALUES (162, '只', 11, 0, 5, NULL, 'goodsunit');
INSERT INTO "public"."jb_dictionary" VALUES (163, '支', 11, 0, 6, NULL, 'goodsunit');

-- ----------------------------
-- Table structure for jb_dictionary_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_dictionary_type";
CREATE TABLE "public"."jb_dictionary_type" (
  "id" int4 NOT NULL DEFAULT nextval('jb_dictionary_type_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "mode_level" int4 NOT NULL,
  "type_key" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."jb_dictionary_type"."id" IS '主键ID';
COMMENT ON COLUMN "public"."jb_dictionary_type"."mode_level" IS '模式层级';
COMMENT ON COLUMN "public"."jb_dictionary_type"."type_key" IS '标识KEY';
COMMENT ON TABLE "public"."jb_dictionary_type" IS '字典类型';

-- ----------------------------
-- Records of jb_dictionary_type
-- ----------------------------
INSERT INTO "public"."jb_dictionary_type" VALUES (8, '数据分类', 2, 'group');
INSERT INTO "public"."jb_dictionary_type" VALUES (9, '文件类型', 1, 'fileType');
INSERT INTO "public"."jb_dictionary_type" VALUES (11, '商品单位', 1, 'goodsunit');

-- ----------------------------
-- Table structure for jb_download_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_download_log";
CREATE TABLE "public"."jb_download_log" (
  "id" int4 NOT NULL DEFAULT nextval('jb_download_log_id_seq'::regclass),
  "ipaddress" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "download_type" int4 NOT NULL,
  "download_time" timestamp(6) NOT NULL
)
;
COMMENT ON COLUMN "public"."jb_download_log"."download_type" IS '下载类型';
COMMENT ON COLUMN "public"."jb_download_log"."download_time" IS '下载时间';
COMMENT ON TABLE "public"."jb_download_log" IS '下载log';

-- ----------------------------
-- Table structure for jb_global_config
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_global_config";
CREATE TABLE "public"."jb_global_config" (
  "id" int4 NOT NULL DEFAULT nextval('jb_global_config_id_seq'::regclass),
  "config_key" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "config_value" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "create_time" timestamp(6) NOT NULL,
  "user_id" int4 NOT NULL,
  "update_time" timestamp(6) NOT NULL,
  "update_user_id" int4 NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "value_type" varchar(40) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."jb_global_config"."config_key" IS '配置KEY';
COMMENT ON COLUMN "public"."jb_global_config"."config_value" IS '配置项值';
COMMENT ON COLUMN "public"."jb_global_config"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."jb_global_config"."user_id" IS '创建用户ID';
COMMENT ON COLUMN "public"."jb_global_config"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."jb_global_config"."update_user_id" IS '更新用户ID';
COMMENT ON COLUMN "public"."jb_global_config"."value_type" IS '类型';
COMMENT ON TABLE "public"."jb_global_config" IS '全局配置';

-- ----------------------------
-- Records of jb_global_config
-- ----------------------------
INSERT INTO "public"."jb_global_config" VALUES (6, 'WECHAT_MP_SERVER_DOMAIN', 'http://mumengmeng.vicp.cc/wx/msg', '2019-05-14 01:35:03', 1, '2019-11-10 16:36:52', 1, '微信公众号_服务器配置_根URL', 'string');
INSERT INTO "public"."jb_global_config" VALUES (7, 'WECHAT_WXA_SERVER_DOMAIN', 'http://mumengmeng.vicp.cc/wxa/msg', '2019-05-14 01:35:03', 1, '2019-08-01 22:38:12', 1, '微信小程序_客服消息推送配置_根URL', 'string');
INSERT INTO "public"."jb_global_config" VALUES (12, 'SYSTEM_NAME', 'JBolt开发平台', '2019-05-16 15:15:03', 1, '2019-12-08 15:40:42.749', 1, '系统名称', 'string');
INSERT INTO "public"."jb_global_config" VALUES (13, 'SYSTEM_ADMIN_LOGO', '/assets/img/logo.png', '2019-05-16 15:15:03', 1, '2019-12-08 15:40:42.755', 1, '系统后台主页LOGO', 'string');
INSERT INTO "public"."jb_global_config" VALUES (14, 'SYSTEM_COPYRIGHT_COMPANY', '©JBolt(JBOLT.CN)', '2019-05-16 15:15:03', 1, '2019-12-08 15:40:42.758', 1, '系统版权所有人', 'string');
INSERT INTO "public"."jb_global_config" VALUES (15, 'SYSTEM_COPYRIGHT_LINK', 'http://jbolt.cn', '2019-05-16 15:15:03', 1, '2019-12-08 15:40:42.76', 1, '系统版权所有人的网址链接', 'string');
INSERT INTO "public"."jb_global_config" VALUES (16, 'WECHAT_ASSETS_SERVER_DOMAIN', 'http://mumengmeng.vicp.cc', '2019-07-04 11:48:56', 1, '2019-12-08 15:40:42.762', 1, '微信_静态资源_根URL', 'string');
INSERT INTO "public"."jb_global_config" VALUES (19, 'JBOLT_ADMIN_STYLE', 'jbolt_style_1', '2019-07-14 22:25:13', 1, '2019-12-08 15:40:42.766', 1, '系统Admin后台样式', 'string');
INSERT INTO "public"."jb_global_config" VALUES (20, 'JBOLT_ADMIN_WITH_TABS', 'true', '2019-08-04 13:21:25', 1, '2019-12-08 15:40:42.769', 1, '系统Admin后台是否启用多选项卡', 'boolean');
INSERT INTO "public"."jb_global_config" VALUES (21, 'JBOLT_LOGIN_FORM_STYLE_GLASS', 'true', '2019-08-06 17:12:23', 1, '2019-12-08 15:40:42.771', 1, '系统登录页面是否启用透明玻璃风格', 'boolean');
INSERT INTO "public"."jb_global_config" VALUES (22, 'JBOLT_LOGIN_USE_CAPTURE', 'true', '2019-09-07 20:57:26', 1, '2019-12-08 15:40:42.773', 1, '系统登录页面是否启用验证码', 'boolean');
INSERT INTO "public"."jb_global_config" VALUES (23, 'JBOLT_LOGIN_BGIMG_BLUR', 'true', '2019-09-26 04:48:10', 1, '2019-12-08 15:40:42.776', 1, '系统登录页面背景图是否启用模糊风格', 'boolean');
INSERT INTO "public"."jb_global_config" VALUES (24, 'JBOLT_LOGIN_CAPTURE_TYPE', 'bubble_png', '2019-09-27 10:52:45', 1, '2019-12-08 15:40:42.778', 1, '系统登录页验证码类型', 'string');
INSERT INTO "public"."jb_global_config" VALUES (25, 'JBOLT_LOGIN_BGIMG', '/assets/css/img/login_bg4.jpg', '2019-09-30 00:48:04', 1, '2019-12-08 15:40:42.78', 1, '系统登录页背景图', 'string');
INSERT INTO "public"."jb_global_config" VALUES (28, 'JBOLT_AUTO_CACHE_LOG', 'true', '2019-12-08 15:40:42.794', 1, '2019-12-09 13:28:56.762', 1, 'JBolt自动缓存Debug日志', 'boolean');
INSERT INTO "public"."jb_global_config" VALUES (27, 'JBOLT_ACTION_REPORT_WRITER', 'jboltlog', '2019-12-08 15:40:42.786', 1, '2019-12-09 13:28:59.872', 1, 'JFinal Action Report输出方式', 'string');
INSERT INTO "public"."jb_global_config" VALUES (29, 'ASSETS_VERSION', '20200204004142718', '2020-02-04 00:27:24.862', 1, '2020-02-04 00:41:42.72', 1, '系统静态资源版本号', 'string');
INSERT INTO "public"."jb_global_config" VALUES (30, 'JBOLT_LOGIN_NEST', 'true', '2020-02-04 00:41:47.467', 1, '2020-02-04 00:41:47.467', 1, '系统登录页是否开启线条特效', 'boolean');

-- ----------------------------
-- Table structure for jb_goods
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_goods";
CREATE TABLE "public"."jb_goods" (
  "id" int4 NOT NULL DEFAULT nextval('jb_goods_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "price" numeric(10,2) NOT NULL DEFAULT NULL::numeric,
  "original_price" numeric(10,2) DEFAULT NULL::numeric,
  "main_image" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "extra_images" text COLLATE "pg_catalog"."default",
  "content_type" int4,
  "groups" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "stock_count" int4,
  "sub_title" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "is_multispec" char(1) COLLATE "pg_catalog"."default" DEFAULT 0,
  "limit_count" int4 DEFAULT 0,
  "location_label" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "is_provide_invoices" char(1) COLLATE "pg_catalog"."default" DEFAULT 0,
  "is_guarantee" char(1) COLLATE "pg_catalog"."default" DEFAULT 0,
  "on_sale" char(1) COLLATE "pg_catalog"."default" DEFAULT 0,
  "under_time" timestamp(6),
  "on_sale_user_id" int4,
  "on_sale_time" timestamp(6),
  "create_user_id" int4 NOT NULL,
  "create_time" timestamp(6),
  "update_time" timestamp(6),
  "update_user_id" int4,
  "goods_unit" int4,
  "real_sale_count" int4 DEFAULT 0,
  "show_sale_count" int4 DEFAULT 0,
  "type_id" int4,
  "brand_id" int4,
  "is_hot" char(1) COLLATE "pg_catalog"."default" DEFAULT 0,
  "is_recommend" char(1) COLLATE "pg_catalog"."default" DEFAULT 0,
  "fcategory_key" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "bcategory_key" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "bcategory_id" int4 NOT NULL,
  "fcategory_id" int4,
  "under_user_id" int4,
  "is_delete" char(1) COLLATE "pg_catalog"."default" DEFAULT 0,
  "goods_no" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."jb_goods"."id" IS '主键ID';
COMMENT ON COLUMN "public"."jb_goods"."price" IS '单价';
COMMENT ON COLUMN "public"."jb_goods"."original_price" IS '原价';
COMMENT ON COLUMN "public"."jb_goods"."main_image" IS '主图';
COMMENT ON COLUMN "public"."jb_goods"."extra_images" IS '附图';
COMMENT ON COLUMN "public"."jb_goods"."content_type" IS '商品描述类型';
COMMENT ON COLUMN "public"."jb_goods"."groups" IS '商品组ID';
COMMENT ON COLUMN "public"."jb_goods"."stock_count" IS '库存量';
COMMENT ON COLUMN "public"."jb_goods"."sub_title" IS '二级标题';
COMMENT ON COLUMN "public"."jb_goods"."is_multispec" IS '是否是多规格';
COMMENT ON COLUMN "public"."jb_goods"."limit_count" IS '限购数量 0=不限制';
COMMENT ON COLUMN "public"."jb_goods"."location_label" IS '所在地';
COMMENT ON COLUMN "public"."jb_goods"."is_provide_invoices" IS '是否提供发票';
COMMENT ON COLUMN "public"."jb_goods"."is_guarantee" IS '是否保修';
COMMENT ON COLUMN "public"."jb_goods"."on_sale" IS '是否上架';
COMMENT ON COLUMN "public"."jb_goods"."under_time" IS '下架时间';
COMMENT ON COLUMN "public"."jb_goods"."on_sale_user_id" IS '上架处理人';
COMMENT ON COLUMN "public"."jb_goods"."on_sale_time" IS '上架时间';
COMMENT ON COLUMN "public"."jb_goods"."create_user_id" IS '创建人';
COMMENT ON COLUMN "public"."jb_goods"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."jb_goods"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."jb_goods"."update_user_id" IS '更新人';
COMMENT ON COLUMN "public"."jb_goods"."goods_unit" IS '商品单位';
COMMENT ON COLUMN "public"."jb_goods"."real_sale_count" IS '真实销量';
COMMENT ON COLUMN "public"."jb_goods"."show_sale_count" IS '展示营销销量';
COMMENT ON COLUMN "public"."jb_goods"."type_id" IS '商品类型';
COMMENT ON COLUMN "public"."jb_goods"."brand_id" IS '商品品牌';
COMMENT ON COLUMN "public"."jb_goods"."is_hot" IS '热销';
COMMENT ON COLUMN "public"."jb_goods"."is_recommend" IS '推荐';
COMMENT ON COLUMN "public"."jb_goods"."fcategory_key" IS '前台分类KEY';
COMMENT ON COLUMN "public"."jb_goods"."bcategory_key" IS '后台分类KEY';
COMMENT ON COLUMN "public"."jb_goods"."bcategory_id" IS '后端分类ID';
COMMENT ON COLUMN "public"."jb_goods"."fcategory_id" IS '前端分类ID';
COMMENT ON COLUMN "public"."jb_goods"."under_user_id" IS '下架处理人';
COMMENT ON COLUMN "public"."jb_goods"."is_delete" IS '是否已删除';
COMMENT ON COLUMN "public"."jb_goods"."goods_no" IS '商品编号';
COMMENT ON TABLE "public"."jb_goods" IS '商品';

-- ----------------------------
-- Records of jb_goods
-- ----------------------------
INSERT INTO "public"."jb_goods" VALUES (66, '新商品_66', 0.00, 0.00, 'upload/mall/goods/20190414/66/56dbaf57-1d83-46ae-ace2-26b8cb6add62.jpg', NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-04-14 20:40:28', '2019-04-14 20:40:28', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '78', 78, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (67, '新商品_67', 0.00, 0.00, 'upload/mall/goods/20190414/67/937106a5-53b3-4218-a8c7-b41d93503b2f.jpg', NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '1', NULL, 1, '2019-05-09 03:48:13', 1, '2019-04-14 23:17:19', '2019-08-05 11:48:22', 1, NULL, 0, 0, 0, NULL, '1', '0', NULL, '78', 78, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (68, '新商品_68', 23.00, 0.00, 'upload/mall/goods/20190620/68/113497a1-f838-40b7-b785-99a414f2875b.png', 'upload/mall/goods/20190620/68/58dd8388-5f89-4053-9281-018a971ccc11.png', 1, NULL, 12, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-06-20 02:12:36', '2019-06-20 02:13:31', 1, 159, 0, 0, 0, NULL, '0', '0', NULL, '78_80', 80, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (69, '新商品_69', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-06-20 02:44:54', '2019-06-20 02:59:18', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '79', 79, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (70, '新商品_70', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-05 11:47:52', '2019-08-05 11:47:52', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '79', 79, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (71, '新商品_71', 0.00, 0.00, 'upload/mall/goods/20190805/71/d60b18c1-c77d-466d-8d65-0ede12d47b65.png', 'upload/mall/goods/20190805/71/d6885ec0-380b-4d55-9a36-3e9e7cab1cfd.png,upload/mall/goods/20190805/71/a454e9cb-2cbc-41fb-84e2-c96269ece2bc.png', 1, NULL, 3, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-05 12:05:36', '2019-08-05 12:07:00', 1, 158, 0, 0, 0, NULL, '0', '0', NULL, '78_80', 80, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (72, '新商品_72', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-05 12:07:04', '2019-08-05 12:07:04', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '78_80', 80, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (73, '新商品_73', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-05 12:07:16', '2019-08-05 12:07:16', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '78_80', 80, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (74, '新商品_74', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-05 12:07:58', '2019-08-05 12:07:58', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '79', 79, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (75, '新商品_75', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-05 12:09:02', '2019-08-05 12:09:02', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '78_80', 80, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (76, '新商品_76', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-05 12:10:36', '2019-08-05 12:10:36', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '78_80', 80, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (77, '新商品_77', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-05 12:11:02', '2019-08-05 12:11:02', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '78_80', 80, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (78, '新商品_78', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-05 12:49:52', '2019-08-05 12:49:52', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '78_80', 80, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (79, '新商品_79', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-05 12:50:00', '2019-08-05 12:50:00', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '78_80', 80, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (80, '新商品_80', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-05 12:52:26', '2019-08-05 12:52:26', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '78_80', 80, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (81, '新商品_81', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-05 12:54:36', '2019-08-05 12:54:36', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '79', 79, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (82, '新商品_82', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-05 12:57:52', '2019-08-05 12:57:52', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '79', 79, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (83, '新商品_83', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-05 12:59:18', '2019-08-05 12:59:18', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '78_80', 80, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (84, '新商品_84', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-05 15:52:32', '2019-08-05 15:52:32', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '78_80', 80, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (85, '新商品_85', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-05 15:52:47', '2019-08-05 15:52:47', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '78_80', 80, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (86, '新商品_86', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-05 15:53:39', '2019-08-05 15:53:39', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '78_80', 80, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (87, '新商品_87', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-05 15:54:12', '2019-08-05 15:54:12', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '78_80', 80, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (88, '新商品_88', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-05 15:54:48', '2019-08-05 15:54:48', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '78_80', 80, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (89, '新商品_89', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-05 15:55:36', '2019-08-05 15:55:36', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '78_80', 80, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (90, '新商品_90', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-05 15:57:38', '2019-08-05 15:57:38', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '79', 79, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (91, '新商品_91', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-05 15:57:50', '2019-08-05 15:57:50', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '79', 79, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (92, '新商品_92', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-05 15:58:55', '2019-08-05 15:58:55', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '78_80', 80, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (93, '新商品_93', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-05 15:59:10', '2019-08-05 15:59:10', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '78_80', 80, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (94, '新商品_94', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-05 16:00:33', '2019-08-05 16:00:33', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '79', 79, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (95, '新商品_95', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-05 16:00:45', '2019-08-05 16:00:45', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '79', 79, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (96, '新商品_96', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-05 16:01:52', '2019-08-05 16:01:52', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '79', 79, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (97, '新商品_97', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-05 16:03:27', '2019-08-05 16:03:27', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '79', 79, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (98, '新商品_98', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-05 16:04:35', '2019-08-05 16:04:35', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '79', 79, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (99, '新商品_99', 0.00, 0.00, 'upload/mall/goods/20190819/99/65da226e-d312-4a0d-8ee7-948c89ccfdb1.jpg', 'upload/mall/goods/20190819/99/7dbb23b0-fcd8-447c-b83d-e6d1f2300d4c.jpg', 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-05 16:05:25', '2019-08-19 15:37:54', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '79', 79, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (100, '新商品_100', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-19 16:08:04', '2019-08-19 16:08:04', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '78_80', 80, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (101, '新商品_101', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-19 16:09:10', '2019-08-19 16:09:10', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '79', 79, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (102, '新商品_102', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-19 16:10:22', '2019-08-19 16:10:22', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '79', 79, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (103, '新商品_1032', 0.00, 0.00, NULL, NULL, 1, NULL, 11, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-19 16:15:42', '2019-08-19 16:15:42', 1, 160, 0, 0, 0, NULL, '0', '0', NULL, '79', 79, NULL, NULL, '1', NULL);
INSERT INTO "public"."jb_goods" VALUES (104, '新商品_104', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-19 16:30:30', '2019-08-19 16:30:30', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '79', 79, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (105, '新商品_105', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-19 16:51:30', '2019-08-19 16:51:30', 1, NULL, 0, 0, NULL, NULL, '0', '0', NULL, '78_80', 80, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (106, '新商品_106', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '1', '2019-09-22 00:12:01', 1, '2019-09-22 00:12:26', 1, '2019-08-19 16:53:13', '2019-09-22 00:12:26', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '79', 79, NULL, 1, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (107, '新商品_107', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '1', NULL, 1, '2019-09-21 21:47:19', 1, '2019-08-19 17:46:02', '2019-09-22 00:03:29', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '79', 79, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (108, '新商品_108', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '1', NULL, 1, '2019-08-19 21:39:18', 1, '2019-08-19 17:47:21', '2019-08-19 21:39:21', 1, NULL, 0, 0, 0, NULL, '1', '1', NULL, '79', 79, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (109, '新商品_109', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-20 09:12:55', '2019-08-20 09:12:55', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '79', 79, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (110, '新商品_110', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-20 09:13:30', '2019-08-20 09:13:30', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '79', 79, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (111, '新商品_111', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-20 09:15:42', '2019-08-20 09:15:42', 1, NULL, 0, 0, NULL, NULL, '0', '0', NULL, '78_80', 80, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (112, '新商品_112', 0.00, 0.00, 'upload/mall/goods/20190921/112/2cbee0c1-4295-468b-a123-48b67a70cb4f.png', 'upload/mall/goods/20190921/112/8de511fd-98b7-46fc-abaf-20db838668fc.jpg,upload/mall/goods/20190921/112/202fc638-1651-4bfd-afe9-b24def215c1d.png,upload/mall/goods/20190921/112/66b7ef18-1a5b-475e-be7e-ec7e0c2fb998.jpg', 1, NULL, 123, '123123123', '0', 1, NULL, '1', '1', '0', '2019-09-21 20:04:36', 1, '2019-09-21 20:04:30', 1, '2019-08-20 09:52:20', '2019-09-21 20:06:01', 1, 159, 0, 2, 0, NULL, '0', '0', NULL, '78_80', 80, NULL, 1, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (113, '新商品_113', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-20 10:06:31', '2019-08-20 10:06:31', 1, NULL, 0, 0, NULL, NULL, '0', '0', NULL, '78_80', 80, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (114, '新商品_114', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '1', NULL, 1, '2019-08-29 03:10:16', 1, '2019-08-20 10:07:40', '2019-08-29 03:10:16', 1, NULL, 0, 0, NULL, NULL, '0', '0', NULL, '79', 79, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (115, '新商品_115', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '1', NULL, 1, '2019-08-29 03:09:34', 1, '2019-08-21 13:08:44', '2019-08-29 03:10:08', 1, NULL, 0, 0, NULL, NULL, '0', '0', NULL, '79', 79, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (116, '新商品_116', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-08-29 16:07:58', '2019-08-29 16:07:58', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '79', 79, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (117, '新商品_117', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-09-02 17:56:59', '2019-09-02 17:56:59', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '79', 79, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (118, '新商品_118', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '1', NULL, 1, '2019-09-21 21:47:15', 1, '2019-09-02 17:58:24', '2019-09-21 21:47:15', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '79', 79, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (119, '新商品_119', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-09-02 17:59:37', '2019-09-02 17:59:37', 1, NULL, 0, 0, NULL, NULL, '0', '0', NULL, '78_83', 83, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (120, '新商品_120', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '1', NULL, 1, '2019-10-04 16:50:26', 1, '2019-09-27 19:20:51', '2019-10-04 16:50:26', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '78_80', 80, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (121, '新商品_121', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-10-14 22:37:21', '2019-10-14 22:37:21', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '78_83', 83, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (122, '新商品_122', 0.00, 0.00, NULL, NULL, 1, NULL, 23, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-11-02 11:44:52', '2019-11-02 11:44:52', 1, 159, 0, 0, 0, NULL, '0', '0', NULL, '78_83', 83, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (123, '新商品_123', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-11-02 11:45:15', '2019-11-02 11:45:15', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '78_83', 83, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (124, '新商品_1241211211', 1.00, 1.00, NULL, NULL, 1, NULL, 2, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-11-02 13:24:43', '2019-11-02 13:24:43', 1, 158, 0, 0, 0, NULL, '0', '0', NULL, '78_82', 82, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (125, '新商品_125333', 0.00, 0.00, NULL, NULL, 1, NULL, 2, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-11-02 17:02:27', '2019-11-02 17:02:27', 1, 159, 0, 0, 0, NULL, '0', '0', NULL, '78_82', 82, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (126, '新商品_126', 0.00, 0.00, NULL, NULL, 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-11-02 17:06:47', '2019-11-02 17:06:47', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '79', 79, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (127, '新商品_127231', 0.00, 0.00, NULL, NULL, 1, NULL, 123, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-11-02 17:07:01', '2019-11-02 17:07:01', 1, 159, 0, 0, 0, NULL, '0', '0', NULL, '79', 79, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (128, '新商品_1281', 0.00, 0.00, NULL, NULL, 1, NULL, 23, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-11-02 17:08:55', '2019-11-02 17:08:55', 1, 158, 0, 0, 0, NULL, '0', '0', NULL, '79', 79, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (130, '新商品_130', 0.00, 0.00, 'upload/mall/goods/20191110/130/de9ecfdf-6dc9-4c4b-b3f4-4ce2c5a69c0e.jpg', 'upload/mall/goods/20191110/130/e61cfdca-253a-4c78-ac35-dda744e08bb7.jpg,upload/mall/goods/20191110/130/66b069af-b2fc-4789-b361-e751e8096b3a.jpeg', 1, NULL, NULL, NULL, '0', 0, NULL, '0', '1', '1', NULL, 1, '2019-12-08 16:00:46.146', 1, '2019-11-10 17:14:01', '2019-12-08 16:00:46.146', 1, NULL, 0, 0, 0, NULL, '0', '0', NULL, '78_80', 80, NULL, NULL, '0', NULL);
INSERT INTO "public"."jb_goods" VALUES (129, '新商品_1292', 0.00, 0.00, 'upload/mall/goods/20191209/129/c767dfb6-9caa-467c-9d83-1edddcc0c0e4.png', 'upload/mall/goods/20191209/129/08dac5ff-ac73-41a5-9f11-ae55fd6502a2.jpg', 1, NULL, 2, NULL, '0', 0, NULL, '0', '1', '0', NULL, NULL, NULL, 1, '2019-11-02 17:11:05', '2019-12-09 23:51:14.169', 1, 158, 0, 0, 0, NULL, '0', '0', NULL, '78_80', 80, NULL, NULL, '0', NULL);

-- ----------------------------
-- Table structure for jb_goods_attr
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_goods_attr";
CREATE TABLE "public"."jb_goods_attr" (
  "id" int4 NOT NULL DEFAULT nextval('jb_goods_attr_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "value" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "goods_id" int4 NOT NULL
)
;
COMMENT ON COLUMN "public"."jb_goods_attr"."id" IS '主键ID';
COMMENT ON COLUMN "public"."jb_goods_attr"."name" IS '属性名';
COMMENT ON COLUMN "public"."jb_goods_attr"."value" IS '属性值';
COMMENT ON COLUMN "public"."jb_goods_attr"."goods_id" IS '商品ID';
COMMENT ON TABLE "public"."jb_goods_attr" IS '商品自定义属性';

-- ----------------------------
-- Table structure for jb_goods_back_category
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_goods_back_category";
CREATE TABLE "public"."jb_goods_back_category" (
  "id" int4 NOT NULL DEFAULT nextval('jb_goods_back_category_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "pid" int4 NOT NULL,
  "type_id" int4,
  "enable" char(1) COLLATE "pg_catalog"."default" NOT NULL,
  "category_key" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sort_rank" int4 NOT NULL
)
;
COMMENT ON COLUMN "public"."jb_goods_back_category"."id" IS '主键ID';
COMMENT ON COLUMN "public"."jb_goods_back_category"."type_id" IS '商品类型';
COMMENT ON COLUMN "public"."jb_goods_back_category"."enable" IS '启用 禁用';
COMMENT ON COLUMN "public"."jb_goods_back_category"."category_key" IS '所有上级和自身ID串联起来';
COMMENT ON COLUMN "public"."jb_goods_back_category"."sort_rank" IS '排序';
COMMENT ON TABLE "public"."jb_goods_back_category" IS '商品后台类目表 无限';

-- ----------------------------
-- Records of jb_goods_back_category
-- ----------------------------
INSERT INTO "public"."jb_goods_back_category" VALUES (78, '手机', 0, NULL, '1', '78', 1);
INSERT INTO "public"."jb_goods_back_category" VALUES (80, 'java', 78, NULL, '1', '78_80', 1);
INSERT INTO "public"."jb_goods_back_category" VALUES (83, '驱蚊器', 78, NULL, '1', '78_83', 2);
INSERT INTO "public"."jb_goods_back_category" VALUES (82, '萨顶顶', 78, NULL, '1', '78_82', 3);
INSERT INTO "public"."jb_goods_back_category" VALUES (79, '测试分类', 0, NULL, '1', '79', 0);

-- ----------------------------
-- Table structure for jb_goods_element_content
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_goods_element_content";
CREATE TABLE "public"."jb_goods_element_content" (
  "id" int4 NOT NULL DEFAULT nextval('jb_goods_element_content_id_seq'::regclass),
  "goods_id" int4 NOT NULL,
  "type" int4 NOT NULL,
  "content" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "sort_rank" int4 NOT NULL,
  "sku_id" int4 NOT NULL
)
;
COMMENT ON COLUMN "public"."jb_goods_element_content"."id" IS '关联商品ID';
COMMENT ON COLUMN "public"."jb_goods_element_content"."goods_id" IS '商品ID';
COMMENT ON COLUMN "public"."jb_goods_element_content"."content" IS '内容';
COMMENT ON COLUMN "public"."jb_goods_element_content"."sort_rank" IS '排序';
COMMENT ON COLUMN "public"."jb_goods_element_content"."sku_id" IS 'SKUID';
COMMENT ON TABLE "public"."jb_goods_element_content" IS '商品关联的单条图片或者问题分类的content列表';

-- ----------------------------
-- Table structure for jb_goods_group
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_goods_group";
CREATE TABLE "public"."jb_goods_group" (
  "id" int4 NOT NULL DEFAULT nextval('jb_goods_group_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "sort_rank" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "icon" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "goods_count" int4 NOT NULL,
  "enable" char(1) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "public"."jb_goods_group"."id" IS '主键ID';
COMMENT ON COLUMN "public"."jb_goods_group"."name" IS '名称';
COMMENT ON COLUMN "public"."jb_goods_group"."sort_rank" IS '排序';
COMMENT ON COLUMN "public"."jb_goods_group"."icon" IS '图标';
COMMENT ON COLUMN "public"."jb_goods_group"."goods_count" IS '商品数量';
COMMENT ON COLUMN "public"."jb_goods_group"."enable" IS '是否启用';
COMMENT ON TABLE "public"."jb_goods_group" IS '商品分组';

-- ----------------------------
-- Table structure for jb_goods_html_content
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_goods_html_content";
CREATE TABLE "public"."jb_goods_html_content" (
  "id" int4 NOT NULL DEFAULT nextval('jb_goods_html_content_id_seq'::regclass),
  "goods_id" int4,
  "content" text COLLATE "pg_catalog"."default",
  "sku_id" int4,
  "update_user_id" int4,
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."jb_goods_html_content"."id" IS '主键ID';
COMMENT ON COLUMN "public"."jb_goods_html_content"."goods_id" IS '商品ID';
COMMENT ON COLUMN "public"."jb_goods_html_content"."content" IS '详情内容';
COMMENT ON COLUMN "public"."jb_goods_html_content"."sku_id" IS 'SKUID';
COMMENT ON COLUMN "public"."jb_goods_html_content"."update_user_id" IS '更新人';
COMMENT ON COLUMN "public"."jb_goods_html_content"."update_time" IS '更新时间';
COMMENT ON TABLE "public"."jb_goods_html_content" IS '商品关联的html富文本详情';

-- ----------------------------
-- Records of jb_goods_html_content
-- ----------------------------
INSERT INTO "public"."jb_goods_html_content" VALUES (6, 66, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (7, 67, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (8, 68, '<p>zsasdasdasd</p>
<p><img src="http://127.0.0.1/upload/mall/goods/20190620/68/8712a064-e908-4faf-9db9-4a0c48661047.jpg"></p>', NULL, 1, '2019-06-20 02:13:31');
INSERT INTO "public"."jb_goods_html_content" VALUES (9, 69, '<p>sadasd</p>', NULL, 1, '2019-06-20 02:59:18');
INSERT INTO "public"."jb_goods_html_content" VALUES (10, 70, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (11, 71, '<p>awaweaw<img src="http://mumengmeng.vicp.cc/upload/mall/goods/20190805/71/779476e4-7863-46f9-bb27-4245b908b35d.jpg"></p>', NULL, 1, '2019-08-05 12:07:00');
INSERT INTO "public"."jb_goods_html_content" VALUES (12, 72, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (13, 73, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (14, 74, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (15, 75, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (16, 76, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (17, 77, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (18, 78, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (19, 79, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (20, 80, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (21, 81, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (22, 82, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (23, 83, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (24, 84, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (25, 85, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (26, 86, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (27, 87, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (28, 88, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (29, 89, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (30, 90, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (31, 91, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (32, 92, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (33, 93, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (34, 94, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (35, 95, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (36, 96, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (37, 97, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (38, 98, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (39, 99, '<p>dfgdf</p>', NULL, 1, '2019-08-19 15:37:54');
INSERT INTO "public"."jb_goods_html_content" VALUES (40, 100, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (41, 101, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (42, 102, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (43, 103, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (44, 104, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (45, 105, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (46, 106, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (47, 107, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (48, 108, '<p><img src="/upload/mall/goods/20190819/108/3399d8e4-ad5a-4e79-980e-54706a422af4.jpg" style="width: 778px;"><br></p>', NULL, 1, '2019-08-19 18:11:38');
INSERT INTO "public"."jb_goods_html_content" VALUES (49, 109, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (50, 110, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (51, 111, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (52, 112, '<p>123213<img src="/upload/mall/goods/20190921/112/40aae6ea-c43c-406f-82b5-d619e7f24064.png" style="width: 600px;"></p>', NULL, 1, '2019-09-21 20:06:01');
INSERT INTO "public"."jb_goods_html_content" VALUES (53, 113, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (54, 114, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (55, 115, '<p>dsadasdasd<img src="/upload/mall/goods/20190821/115/12430a0c-8eb4-4b51-abe1-c02ed5eba927.png" style="width: 778px;"></p>', NULL, 1, '2019-08-21 13:09:03');
INSERT INTO "public"."jb_goods_html_content" VALUES (56, 116, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (57, 117, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (58, 118, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (59, 119, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (60, 120, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (61, 121, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (62, 122, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (63, 123, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (64, 124, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (65, 125, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (66, 126, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (67, 127, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (68, 128, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (70, 130, NULL, NULL, NULL, NULL);
INSERT INTO "public"."jb_goods_html_content" VALUES (69, 129, '<p>撒大声所多</p>', NULL, 1, '2019-12-08 16:00:57.275');

-- ----------------------------
-- Table structure for jb_goods_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_goods_type";
CREATE TABLE "public"."jb_goods_type" (
  "id" int4 NOT NULL DEFAULT nextval('jb_goods_type_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "enable" char(1) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 0,
  "sort_rank" int4 NOT NULL,
  "spec_count" int4 NOT NULL DEFAULT 0,
  "attr_count" int4 NOT NULL DEFAULT 0,
  "brand_count" int4 NOT NULL DEFAULT 0,
  "pinyin" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "remark" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."jb_goods_type"."id" IS '主键ID';
COMMENT ON COLUMN "public"."jb_goods_type"."enable" IS '是否启用';
COMMENT ON COLUMN "public"."jb_goods_type"."sort_rank" IS '排序';
COMMENT ON COLUMN "public"."jb_goods_type"."spec_count" IS '规格数量';
COMMENT ON COLUMN "public"."jb_goods_type"."attr_count" IS '属性数量';
COMMENT ON COLUMN "public"."jb_goods_type"."brand_count" IS '品牌数量';
COMMENT ON COLUMN "public"."jb_goods_type"."pinyin" IS '拼音';
COMMENT ON COLUMN "public"."jb_goods_type"."remark" IS '备注信息';
COMMENT ON TABLE "public"."jb_goods_type" IS '商品类型';

-- ----------------------------
-- Records of jb_goods_type
-- ----------------------------
INSERT INTO "public"."jb_goods_type" VALUES (7, '山大为啊', '1', 1, 0, 0, 3, 'sdwa', NULL);
INSERT INTO "public"."jb_goods_type" VALUES (13, '啥ad', '1', 4, 0, 0, 0, 'sad', NULL);
INSERT INTO "public"."jb_goods_type" VALUES (9, 'asdasd', '1', 3, 0, 0, 0, 'asdasd', NULL);
INSERT INTO "public"."jb_goods_type" VALUES (12, 'asdsaasdasdasd', '0', 2, 0, 0, 3, 'asdsaasdasdasd', NULL);
INSERT INTO "public"."jb_goods_type" VALUES (15, 'asd', '1', 5, 0, 0, 0, 'asd', NULL);
INSERT INTO "public"."jb_goods_type" VALUES (16, 'asssd', '1', 6, 0, 0, 0, 'asssd', NULL);
INSERT INTO "public"."jb_goods_type" VALUES (17, 'asdasss', '1', 7, 0, 0, 0, 'asdasss', NULL);

-- ----------------------------
-- Table structure for jb_goods_type_brand
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_goods_type_brand";
CREATE TABLE "public"."jb_goods_type_brand" (
  "id" int4 NOT NULL DEFAULT nextval('jb_goods_type_brand_id_seq'::regclass),
  "goods_type_id" int4 NOT NULL,
  "brand_id" int4 NOT NULL
)
;
COMMENT ON COLUMN "public"."jb_goods_type_brand"."goods_type_id" IS '关联商品类型';
COMMENT ON COLUMN "public"."jb_goods_type_brand"."brand_id" IS '关联商品品牌';
COMMENT ON TABLE "public"."jb_goods_type_brand" IS '商品类型-品牌中间表';

-- ----------------------------
-- Records of jb_goods_type_brand
-- ----------------------------
INSERT INTO "public"."jb_goods_type_brand" VALUES (81, 3, 7);
INSERT INTO "public"."jb_goods_type_brand" VALUES (82, 4, 4);
INSERT INTO "public"."jb_goods_type_brand" VALUES (83, 4, 3);
INSERT INTO "public"."jb_goods_type_brand" VALUES (87, 10, 7);
INSERT INTO "public"."jb_goods_type_brand" VALUES (88, 10, 9);
INSERT INTO "public"."jb_goods_type_brand" VALUES (89, 7, 11);
INSERT INTO "public"."jb_goods_type_brand" VALUES (90, 7, 10);
INSERT INTO "public"."jb_goods_type_brand" VALUES (91, 7, 9);
INSERT INTO "public"."jb_goods_type_brand" VALUES (93, 12, 6);
INSERT INTO "public"."jb_goods_type_brand" VALUES (94, 12, 9);
INSERT INTO "public"."jb_goods_type_brand" VALUES (95, 12, 7);

-- ----------------------------
-- Table structure for jb_jbolt_file
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_jbolt_file";
CREATE TABLE "public"."jb_jbolt_file" (
  "id" int4 NOT NULL DEFAULT nextval('jb_jbolt_file_id_seq'::regclass),
  "local_path" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "local_url" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "cdn_url" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "create_time" timestamp(6) NOT NULL,
  "user_id" int4 NOT NULL,
  "file_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "file_type" int4 NOT NULL,
  "file_size" int8 NOT NULL,
  "file_suffix" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."jb_jbolt_file"."local_path" IS '保存物理地址';
COMMENT ON COLUMN "public"."jb_jbolt_file"."local_url" IS '本地可访问URL地址';
COMMENT ON COLUMN "public"."jb_jbolt_file"."cdn_url" IS '外部CDN地址';
COMMENT ON COLUMN "public"."jb_jbolt_file"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."jb_jbolt_file"."user_id" IS '用户ID';
COMMENT ON COLUMN "public"."jb_jbolt_file"."file_name" IS '文件名';
COMMENT ON COLUMN "public"."jb_jbolt_file"."file_type" IS '文件类型 图片 附件 视频 音频';
COMMENT ON COLUMN "public"."jb_jbolt_file"."file_size" IS '文件大小';
COMMENT ON COLUMN "public"."jb_jbolt_file"."file_suffix" IS '后缀名';
COMMENT ON TABLE "public"."jb_jbolt_file" IS '文件库';

-- ----------------------------
-- Records of jb_jbolt_file
-- ----------------------------
INSERT INTO "public"."jb_jbolt_file" VALUES (1, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\ada5b267-79f4-4b52-b1b5-cb2a120e1f86.png', 'upload\mall\goods\20190324/ada5b267-79f4-4b52-b1b5-cb2a120e1f86.png', NULL, '2019-03-24 01:41:19', 1, '艺术爬虫3.png', 1, 1150480, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (2, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\108cec9a-6dce-4f8a-af54-c8b816903408.png', 'upload\mall\goods\20190324/108cec9a-6dce-4f8a-af54-c8b816903408.png', NULL, '2019-03-24 02:13:57', 1, 'jbolt1.png', 1, 154734, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (3, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\ea88a8d5-fd6a-46ef-9688-be985db47f51.png', 'upload\mall\goods\20190324/ea88a8d5-fd6a-46ef-9688-be985db47f51.png', NULL, '2019-03-24 02:14:02', 1, 'jbolt2.png', 1, 153346, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (4, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\a0e9df8c-d953-41e9-a361-9d528faf12d0.png', 'upload\mall\goods\20190324/a0e9df8c-d953-41e9-a361-9d528faf12d0.png', NULL, '2019-03-24 02:19:11', 1, 'Jbolt生成.png', 1, 64684, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (5, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\bbc9d4ae-ef52-4b82-b8dc-5d45d6b3b27f.png', 'upload\mall\goods\20190324/bbc9d4ae-ef52-4b82-b8dc-5d45d6b3b27f.png', NULL, '2019-03-24 02:21:01', 1, '艺术爬虫2.png', 1, 1185075, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (6, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\fe7aaad7-e8ba-459d-bd5e-06445bba67bf.png', 'upload\mall\goods\20190324/fe7aaad7-e8ba-459d-bd5e-06445bba67bf.png', NULL, '2019-03-24 02:21:31', 1, 'Jbolt生成.png', 1, 64684, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (7, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\192617eb-904b-410d-b34f-a8c7cd1f9203.png', 'upload\mall\goods\20190324/192617eb-904b-410d-b34f-a8c7cd1f9203.png', NULL, '2019-03-24 02:21:37', 1, '艺术爬虫3.png', 1, 1150480, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (8, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\349f3f77-717c-419b-833b-90a3c5786fa8.png', 'upload\mall\goods\20190324/349f3f77-717c-419b-833b-90a3c5786fa8.png', NULL, '2019-03-24 02:21:59', 1, '艺术爬虫2.png', 1, 1185075, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (9, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\3a9d50f9-2795-4e4d-a16f-10054b7bf7c0.png', 'upload\mall\goods\20190324/3a9d50f9-2795-4e4d-a16f-10054b7bf7c0.png', NULL, '2019-03-24 02:22:19', 1, '艺术爬虫3.png', 1, 1150480, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (10, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\2503f667-5650-4a32-aa67-2f5890456f3d.png', 'upload\mall\goods\20190324/2503f667-5650-4a32-aa67-2f5890456f3d.png', NULL, '2019-03-24 02:22:24', 1, '艺术爬虫3.png', 1, 1150480, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (11, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\b5f3f496-d56f-40db-9f68-07d188ae866d.png', 'upload\mall\goods\20190324/b5f3f496-d56f-40db-9f68-07d188ae866d.png', NULL, '2019-03-24 02:24:42', 1, '艺术爬虫2.png', 1, 1185075, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (12, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\229a73c5-7548-4e2b-bc50-8cb728bc2c00.png', 'upload\mall\goods\20190324/229a73c5-7548-4e2b-bc50-8cb728bc2c00.png', NULL, '2019-03-24 03:20:39', 1, '艺术爬虫2.png', 1, 1185075, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (13, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\61a56856-23eb-43f3-9ae7-50507caa1814.jpg', 'upload\mall\goods\20190324/61a56856-23eb-43f3-9ae7-50507caa1814.jpg', NULL, '2019-03-24 03:20:43', 1, '艺术爬虫2.jpg', 1, 186049, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (14, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\c0d74cf6-7076-4d16-aafa-a55c1b2958ed.jpg', 'upload\mall\goods\20190324/c0d74cf6-7076-4d16-aafa-a55c1b2958ed.jpg', NULL, '2019-03-24 03:20:58', 1, '数据猫.jpg', 1, 62515, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (15, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\0cad4fb4-85da-4187-8bd0-762493028dd4.png', 'upload\mall\goods\20190324/0cad4fb4-85da-4187-8bd0-762493028dd4.png', NULL, '2019-03-24 03:21:36', 1, '艺术爬虫2.png', 1, 1185075, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (16, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\542f4b48-5fb5-4001-9b4e-02b377de2742.png', 'upload\mall\goods\20190324/542f4b48-5fb5-4001-9b4e-02b377de2742.png', NULL, '2019-03-24 03:25:44', 1, 'jbolt2.png', 1, 153346, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (17, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\dc39034b-af48-4d1a-adf1-72766a771c0d.png', 'upload\mall\goods\20190324/dc39034b-af48-4d1a-adf1-72766a771c0d.png', NULL, '2019-03-24 03:26:24', 1, '艺术爬虫0.png', 1, 26645, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (18, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\7b3dcba4-0fd7-4c11-af15-0681f6c61eff.png', 'upload\mall\goods\20190324/7b3dcba4-0fd7-4c11-af15-0681f6c61eff.png', NULL, '2019-03-24 03:27:03', 1, '艺术爬虫0.png', 1, 26645, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (19, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\6c29589a-c481-4959-84e9-dd3adaac1a79.jpg', 'upload\mall\goods\20190324/6c29589a-c481-4959-84e9-dd3adaac1a79.jpg', NULL, '2019-03-24 03:27:15', 1, '艺术爬虫4.jpg', 1, 196492, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (20, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\3f85b122-4a1c-4b1c-ab8f-b358e4519990.jpg', 'upload\mall\goods\20190324/3f85b122-4a1c-4b1c-ab8f-b358e4519990.jpg', NULL, '2019-03-24 03:27:29', 1, '艺术爬虫.jpg', 1, 200850, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (21, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\ef97b7f0-e45c-46e9-9a43-27045111688a.png', 'upload\mall\goods\20190324/ef97b7f0-e45c-46e9-9a43-27045111688a.png', NULL, '2019-03-24 03:28:13', 1, '艺术爬虫2.png', 1, 1185075, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (22, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\72f53164-5aaf-4755-8ab2-2ff38e5887cc.png', 'upload\mall\goods\20190324/72f53164-5aaf-4755-8ab2-2ff38e5887cc.png', NULL, '2019-03-24 03:28:28', 1, '艺术爬虫2.png', 1, 1185075, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (23, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\0ea48d26-f902-4ae3-b942-e231cb729ce5.png', 'upload\mall\goods\20190324/0ea48d26-f902-4ae3-b942-e231cb729ce5.png', NULL, '2019-03-24 03:28:48', 1, '艺术爬虫2.png', 1, 1185075, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (24, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\f25ba17b-182a-44f6-af09-9d73edd3e0c5.png', 'upload\mall\goods\20190324/f25ba17b-182a-44f6-af09-9d73edd3e0c5.png', NULL, '2019-03-24 03:30:00', 1, 'jbolt2.png', 1, 153346, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (25, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\b0913d6b-ac1b-4f33-ab1b-2c1aa033b6e5.png', 'upload\mall\goods\20190324/b0913d6b-ac1b-4f33-ab1b-2c1aa033b6e5.png', NULL, '2019-03-24 03:30:07', 1, '艺术爬虫2.png', 1, 1185075, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (26, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\ba396422-1b01-44e8-a745-6b5bf9b3fd48.png', 'upload\mall\goods\20190324/ba396422-1b01-44e8-a745-6b5bf9b3fd48.png', NULL, '2019-03-24 03:30:37', 1, '艺术爬虫4.png', 1, 697293, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (27, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\fd939058-b644-48ab-8d1c-2a16287c111d.png', 'upload\mall\goods\20190324/fd939058-b644-48ab-8d1c-2a16287c111d.png', NULL, '2019-03-24 03:31:57', 1, 'jbolt5.png', 1, 113464, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (28, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\fc901021-2830-4d1a-a4a6-46755cf07580.png', 'upload\mall\goods\20190324/fc901021-2830-4d1a-a4a6-46755cf07580.png', NULL, '2019-03-24 03:32:02', 1, 'ttg.png', 1, 372707, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (29, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\56442f30-860c-4499-9bbf-6261b5aa9e09.png', 'upload\mall\goods\20190324/56442f30-860c-4499-9bbf-6261b5aa9e09.png', NULL, '2019-03-24 03:34:01', 1, 'jbolt3.png', 1, 84097, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (30, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\d579ab80-591b-494c-92b5-ab9b5e918c66.png', 'upload\mall\goods\20190324/d579ab80-591b-494c-92b5-ab9b5e918c66.png', NULL, '2019-03-24 03:34:12', 1, 'jbolt4.png', 1, 62115, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (31, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\7216c9b5-dcd4-41c1-94ad-7a0222451cb0.png', 'upload\mall\goods\20190324/7216c9b5-dcd4-41c1-94ad-7a0222451cb0.png', NULL, '2019-03-24 03:34:26', 1, 'jbolt3.png', 1, 84097, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (32, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\eacbc38c-d158-45f1-b5b1-5386fd732dad.png', 'upload\mall\goods\20190324/eacbc38c-d158-45f1-b5b1-5386fd732dad.png', NULL, '2019-03-24 03:35:04', 1, 'jbolt3.png', 1, 84097, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (33, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\77ff0635-d84e-4655-9a06-4df1a137072b.png', 'upload\mall\goods\20190324/77ff0635-d84e-4655-9a06-4df1a137072b.png', NULL, '2019-03-24 03:35:31', 1, 'jbolt2.png', 1, 153346, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (34, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\53eebe1d-bf97-483b-852d-a71cc6b82f92.png', 'upload\mall\goods\20190324/53eebe1d-bf97-483b-852d-a71cc6b82f92.png', NULL, '2019-03-24 03:36:05', 1, 'jbolt1.png', 1, 154734, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (35, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\a4cead8b-bdf6-4eb5-9d94-f1a6b9edb387.png', 'upload\mall\goods\20190324/a4cead8b-bdf6-4eb5-9d94-f1a6b9edb387.png', NULL, '2019-03-24 03:40:04', 1, 'jbolt1.png', 1, 154734, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (36, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\00e61500-c7a2-4e3c-ab88-27afaae5bc06.jpg', 'upload\mall\goods\20190324/00e61500-c7a2-4e3c-ab88-27afaae5bc06.jpg', NULL, '2019-03-24 03:40:21', 1, '艺术爬虫2.jpg', 1, 186049, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (37, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\2980a7d7-3a74-4461-a5d2-f22304db3287.png', 'upload\mall\goods\20190324/2980a7d7-3a74-4461-a5d2-f22304db3287.png', NULL, '2019-03-24 03:41:27', 1, 'iii.png', 1, 51661, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (38, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\aa343550-401b-4269-831a-90fce0089920.png', 'upload\mall\goods\20190324/aa343550-401b-4269-831a-90fce0089920.png', NULL, '2019-03-24 03:42:38', 1, 'jbolt1.png', 1, 154734, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (39, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\635157d8-d480-4fda-9021-69dc41eeb465.jpg', 'upload\mall\goods\20190324/635157d8-d480-4fda-9021-69dc41eeb465.jpg', NULL, '2019-03-24 03:42:43', 1, '数据猫.jpg', 1, 62515, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (40, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\fb294ea5-06b4-47ac-907f-1f44e0e58f47.jpg', 'upload\mall\goods\20190324/fb294ea5-06b4-47ac-907f-1f44e0e58f47.jpg', NULL, '2019-03-24 03:42:53', 1, '数据猫.jpg', 1, 62515, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (41, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\0d98dd13-dcf8-4dca-b6b7-ba333ed2f9f3.png', 'upload\mall\goods\20190324/0d98dd13-dcf8-4dca-b6b7-ba333ed2f9f3.png', NULL, '2019-03-24 03:43:24', 1, '艺术爬虫2.png', 1, 1185075, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (42, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\f5dfa21c-85e4-4e9f-8df8-f3bf96fb952c.png', 'upload\mall\goods\20190324/f5dfa21c-85e4-4e9f-8df8-f3bf96fb952c.png', NULL, '2019-03-24 03:55:11', 1, 'jbolt5.png', 1, 113464, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (43, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\2aee8efd-b5ad-4d0f-96ef-92b4b80cdcf7.jpg', 'upload\mall\goods\20190324/2aee8efd-b5ad-4d0f-96ef-92b4b80cdcf7.jpg', NULL, '2019-03-24 03:55:17', 1, '艺术爬虫.jpg', 1, 200850, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (44, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\7069aa14-754f-4692-9b34-f623f1742e3f.png', 'upload\mall\goods\20190324/7069aa14-754f-4692-9b34-f623f1742e3f.png', NULL, '2019-03-24 03:57:08', 1, 'jbolt2.png', 1, 153346, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (45, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\67310b63-a980-43c9-b461-fd5f9f2384a7.jpg', 'upload\mall\goods\20190324/67310b63-a980-43c9-b461-fd5f9f2384a7.jpg', NULL, '2019-03-24 03:57:13', 1, '艺术爬虫4.jpg', 1, 196492, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (46, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\cbde4006-a12a-48f2-ba0d-95f458bcf6c3.jpg', 'upload\mall\goods\20190324/cbde4006-a12a-48f2-ba0d-95f458bcf6c3.jpg', NULL, '2019-03-24 03:57:18', 1, '艺术爬虫.jpg', 1, 200850, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (47, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\4a9a41a0-a0ad-4483-b8a6-a5edb493e8ba.png', 'upload\mall\goods\20190324/4a9a41a0-a0ad-4483-b8a6-a5edb493e8ba.png', NULL, '2019-03-24 03:57:22', 1, '艺术爬虫2.png', 1, 1185075, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (48, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\44f58972-1fe6-4deb-8c41-2ca276e19eaa.png', 'upload\mall\goods\20190324/44f58972-1fe6-4deb-8c41-2ca276e19eaa.png', NULL, '2019-03-24 03:58:22', 1, '艺术爬虫0.png', 1, 26645, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (49, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\2955cc8e-7981-4656-838c-2e8954c2a3d8.jpg', 'upload\mall\goods\20190324/2955cc8e-7981-4656-838c-2e8954c2a3d8.jpg', NULL, '2019-03-24 03:58:27', 1, '艺术爬虫2.jpg', 1, 186049, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (50, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\c4c83ba6-a5e4-4e8c-9fe8-dbe4bf8cbe90.png', 'upload\mall\goods\20190324/c4c83ba6-a5e4-4e8c-9fe8-dbe4bf8cbe90.png', NULL, '2019-03-24 03:58:40', 1, 'jbolt6.png', 1, 37818, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (51, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\0420785b-ba5a-4b28-af58-bd335c49005c.png', 'upload\mall\goods\20190324/0420785b-ba5a-4b28-af58-bd335c49005c.png', NULL, '2019-03-24 03:58:43', 1, 'jbolt5.png', 1, 113464, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (52, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\0d02ed90-19ed-477e-a914-d974b0647b5e.jpg', 'upload\mall\goods\20190324/0d02ed90-19ed-477e-a914-d974b0647b5e.jpg', NULL, '2019-03-24 03:58:48', 1, '艺术爬虫4.jpg', 1, 196492, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (53, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\efcde02a-1208-4576-972c-fe28021e95a0.png', 'upload\mall\goods\20190324/efcde02a-1208-4576-972c-fe28021e95a0.png', NULL, '2019-03-24 03:58:53', 1, 'jbolt创建项目.png', 1, 37076, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (54, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\5a250be2-36f5-443e-80a6-b20a7bc2ddd5.png', 'upload\mall\goods\20190324/5a250be2-36f5-443e-80a6-b20a7bc2ddd5.png', NULL, '2019-03-24 03:58:58', 1, 'navBg.png', 1, 1133, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (55, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\bc560e31-72cc-456f-bb59-27d6e212e95f.png', 'upload\mall\goods\20190324/bc560e31-72cc-456f-bb59-27d6e212e95f.png', NULL, '2019-03-24 04:02:52', 1, 'jbolt5.png', 1, 113464, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (56, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\c2fc7765-af4b-48d8-9da7-be20d13f2056.png', 'upload\mall\goods\20190324/c2fc7765-af4b-48d8-9da7-be20d13f2056.png', NULL, '2019-03-24 04:05:49', 1, '艺术爬虫0.png', 1, 26645, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (57, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\8a89bc61-0318-4ad5-bf1d-5d64a18bb7fd.png', 'upload\mall\goods\20190324/8a89bc61-0318-4ad5-bf1d-5d64a18bb7fd.png', NULL, '2019-03-24 04:05:54', 1, 'uuu.png', 1, 78200, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (58, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\7fe91880-1343-41bb-8a07-d3c8c49ce652.png', 'upload\mall\goods\20190324/7fe91880-1343-41bb-8a07-d3c8c49ce652.png', NULL, '2019-03-24 04:06:01', 1, '艺术爬虫3.png', 1, 1150480, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (59, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\39b35317-81c9-473c-b21d-23f8c32fa076.jpg', 'upload\mall\goods\20190324/39b35317-81c9-473c-b21d-23f8c32fa076.jpg', NULL, '2019-03-24 04:06:06', 1, '艺术爬虫3.jpg', 1, 204468, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (60, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\31231581-1a46-46a1-9a28-161fd784730d.png', 'upload\mall\goods\20190324/31231581-1a46-46a1-9a28-161fd784730d.png', NULL, '2019-03-24 04:06:10', 1, '艺术爬虫2.png', 1, 1185075, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (61, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\7617cb01-3960-453b-84ad-af083149d632.png', 'upload\mall\goods\20190324/7617cb01-3960-453b-84ad-af083149d632.png', NULL, '2019-03-24 04:06:53', 1, 'jbolt5.png', 1, 113464, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (62, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\b660481f-9d43-49ae-9fc0-ff7a8976af53.png', 'upload\mall\goods\20190324/b660481f-9d43-49ae-9fc0-ff7a8976af53.png', NULL, '2019-03-24 04:06:58', 1, 'jbolt6.png', 1, 37818, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (63, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\9af45fb5-ee1d-460b-94d4-cba11fef610b.png', 'upload\mall\goods\20190324/9af45fb5-ee1d-460b-94d4-cba11fef610b.png', NULL, '2019-03-24 04:07:02', 1, 'jbolt5.png', 1, 113464, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (64, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\25cae764-380e-4d2f-809a-9217cdcd2d27.png', 'upload\mall\goods\20190324/25cae764-380e-4d2f-809a-9217cdcd2d27.png', NULL, '2019-03-24 04:07:13', 1, 'jbolt6.png', 1, 37818, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (65, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\1fd48a01-3388-49d4-8312-2f20e2539709.png', 'upload\mall\goods\20190324/1fd48a01-3388-49d4-8312-2f20e2539709.png', NULL, '2019-03-24 04:07:17', 1, 'jbolt5.png', 1, 113464, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (66, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\1d0c3f22-f525-4b01-99be-2110a3c6aa69.jpg', 'upload\mall\goods\20190324/1d0c3f22-f525-4b01-99be-2110a3c6aa69.jpg', NULL, '2019-03-24 04:07:21', 1, '艺术爬虫4.jpg', 1, 196492, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (67, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\9fd72516-3f29-4c47-9afc-eb5abfeab36f.jpg', 'upload\mall\goods\20190324/9fd72516-3f29-4c47-9afc-eb5abfeab36f.jpg', NULL, '2019-03-24 04:07:25', 1, '艺术爬虫2.jpg', 1, 186049, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (68, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\a3d66e67-ae6a-4b3c-85c7-0b8b053aaf60.png', 'upload\mall\goods\20190324/a3d66e67-ae6a-4b3c-85c7-0b8b053aaf60.png', NULL, '2019-03-24 04:07:36', 1, 'jbolt6.png', 1, 37818, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (69, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\f70b8c53-1a5d-4fd7-aa8d-ac18efc8624b.png', 'upload\mall\goods\20190324/f70b8c53-1a5d-4fd7-aa8d-ac18efc8624b.png', NULL, '2019-03-24 04:07:39', 1, 'jbolt5.png', 1, 113464, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (70, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\bd1995a1-3173-4aa4-8592-c4f4d454be15.png', 'upload\mall\goods\20190324/bd1995a1-3173-4aa4-8592-c4f4d454be15.png', NULL, '2019-03-24 04:07:44', 1, 'jbolt3.png', 1, 84097, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (71, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\60a88721-a26c-41a9-aaa2-8ba1e7bc2dff.png', 'upload\mall\goods\20190324/60a88721-a26c-41a9-aaa2-8ba1e7bc2dff.png', NULL, '2019-03-24 04:07:48', 1, 'jbolt1.png', 1, 154734, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (72, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\a3b86c84-a17e-4796-bad0-3dd9596a3ff9.png', 'upload\mall\goods\20190324/a3b86c84-a17e-4796-bad0-3dd9596a3ff9.png', NULL, '2019-03-24 04:07:52', 1, 'ddd.png', 1, 30532, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (73, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\41bff6ad-8210-4bd6-86ea-ac2f4140f6e6.png', 'upload\mall\goods\20190324/41bff6ad-8210-4bd6-86ea-ac2f4140f6e6.png', NULL, '2019-03-24 04:07:57', 1, '艺术爬虫0.png', 1, 26645, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (74, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\fedf3a2e-4fef-4a62-81a5-3457ab2779a9.jpg', 'upload\mall\goods\20190324/fedf3a2e-4fef-4a62-81a5-3457ab2779a9.jpg', NULL, '2019-03-24 04:08:01', 1, '艺术爬虫4.jpg', 1, 196492, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (75, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\ee3a090f-ea71-476e-b9bc-c7794b9b9a55.jpg', 'upload\mall\goods\20190324/ee3a090f-ea71-476e-b9bc-c7794b9b9a55.jpg', NULL, '2019-03-24 04:08:04', 1, '艺术爬虫2.jpg', 1, 186049, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (76, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\f0d3e339-07c6-4fc7-8fd1-7074ed8e3b58.png', 'upload\mall\goods\20190324/f0d3e339-07c6-4fc7-8fd1-7074ed8e3b58.png', NULL, '2019-03-24 04:08:08', 1, '艺术爬虫3.png', 1, 1150480, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (77, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\6f3e71c9-15fa-4b71-af7f-7e042ab299e7.png', 'upload\mall\goods\20190324/6f3e71c9-15fa-4b71-af7f-7e042ab299e7.png', NULL, '2019-03-24 04:08:13', 1, '艺术爬虫2.png', 1, 1185075, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (78, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\fe0be010-0be7-4c86-8f8e-f3dfbec9e4a7.png', 'upload\mall\goods\20190324/fe0be010-0be7-4c86-8f8e-f3dfbec9e4a7.png', NULL, '2019-03-24 04:13:59', 1, 'iii.png', 1, 51661, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (79, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\a2dbeea8-16dc-4fa6-9b46-646e58561709.png', 'upload\mall\goods\20190324/a2dbeea8-16dc-4fa6-9b46-646e58561709.png', NULL, '2019-03-24 04:24:17', 1, 'jbolt5.png', 1, 113464, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (80, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\e76970dc-101b-4cbf-a850-54e22363cd65.png', 'upload\mall\goods\20190324/e76970dc-101b-4cbf-a850-54e22363cd65.png', NULL, '2019-03-24 04:24:20', 1, 'jbolt2.png', 1, 153346, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (81, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\92d010b3-5c82-45f7-8abf-4b70fede663e.png', 'upload\mall\goods\20190324/92d010b3-5c82-45f7-8abf-4b70fede663e.png', NULL, '2019-03-24 04:33:21', 1, 'jbolt2.png', 1, 153346, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (82, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\869b3590-de5d-4850-8cdb-7874accfa72e.png', 'upload\mall\goods\20190324/869b3590-de5d-4850-8cdb-7874accfa72e.png', NULL, '2019-03-24 04:33:37', 1, 'jbolt2.png', 1, 153346, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (83, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\f6382c9f-2b7a-4a3d-a761-7a3a4da3b869.png', 'upload\mall\goods\20190324/f6382c9f-2b7a-4a3d-a761-7a3a4da3b869.png', NULL, '2019-03-24 04:33:52', 1, 'jbolt2.png', 1, 153346, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (84, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\1a9eb20c-67e9-4c8e-a82d-fc2db3fda88a.png', 'upload\mall\goods\20190324/1a9eb20c-67e9-4c8e-a82d-fc2db3fda88a.png', NULL, '2019-03-24 04:33:56', 1, 'jbolt1.png', 1, 154734, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (85, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\0c56fbdc-db40-4d72-843a-d31f23302138.png', 'upload\mall\goods\20190324/0c56fbdc-db40-4d72-843a-d31f23302138.png', NULL, '2019-03-24 04:34:08', 1, 'ddd.png', 1, 30532, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (86, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\c6e68b35-34f9-4dfa-ae4e-c53523b77ce2.jpg', 'upload\mall\goods\20190324/c6e68b35-34f9-4dfa-ae4e-c53523b77ce2.jpg', NULL, '2019-03-24 04:35:30', 1, '艺术爬虫3.jpg', 1, 204468, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (87, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\f015fe54-8f7d-41c3-8314-38de697b74ff.jpg', 'upload\mall\goods\20190324/f015fe54-8f7d-41c3-8314-38de697b74ff.jpg', NULL, '2019-03-24 04:36:12', 1, '艺术爬虫2.jpg', 1, 186049, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (88, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\bc64ec2b-2f33-4b8a-a1d4-f3f3aa8b5bbd.jpg', 'upload\mall\goods\20190324/bc64ec2b-2f33-4b8a-a1d4-f3f3aa8b5bbd.jpg', NULL, '2019-03-24 04:36:48', 1, '艺术爬虫4.jpg', 1, 196492, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (89, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\27c5c66a-2dc3-476c-ada9-efbe0ee70aa9.jpg', 'upload\mall\goods\20190324/27c5c66a-2dc3-476c-ada9-efbe0ee70aa9.jpg', NULL, '2019-03-24 04:38:13', 1, '艺术爬虫3.jpg', 1, 204468, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (90, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\cd391065-54e0-4c13-bdb0-0270cc3ae0d9.jpg', 'upload\mall\goods\20190324/cd391065-54e0-4c13-bdb0-0270cc3ae0d9.jpg', NULL, '2019-03-24 04:38:23', 1, '艺术爬虫2.jpg', 1, 186049, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (91, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\0b9d0b2b-a215-4aed-9851-b7f403726cf7.jpg', 'upload\mall\goods\20190324/0b9d0b2b-a215-4aed-9851-b7f403726cf7.jpg', NULL, '2019-03-24 04:39:14', 1, '艺术爬虫4.jpg', 1, 196492, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (92, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\8add67d1-252e-4c0d-913c-035452675e00.png', 'upload\mall\goods\20190324/8add67d1-252e-4c0d-913c-035452675e00.png', NULL, '2019-03-24 04:39:36', 1, '艺术爬虫0.png', 1, 26645, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (93, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\b7b93c30-9443-4cd7-bfae-cdce937f5506.jpg', 'upload\mall\goods\20190324/b7b93c30-9443-4cd7-bfae-cdce937f5506.jpg', NULL, '2019-03-24 04:40:06', 1, '艺术爬虫4.jpg', 1, 196492, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (94, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\1e45e41b-105f-4fd4-a6de-ba07bd4d19c1.jpg', 'upload\mall\goods\20190324/1e45e41b-105f-4fd4-a6de-ba07bd4d19c1.jpg', NULL, '2019-03-24 04:41:13', 1, '艺术爬虫4.jpg', 1, 196492, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (95, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\0ceb9b89-ec35-4c5f-afc6-c60d7c798d8c.png', 'upload\mall\goods\20190324/0ceb9b89-ec35-4c5f-afc6-c60d7c798d8c.png', NULL, '2019-03-24 04:41:27', 1, 'jbolt1.png', 1, 154734, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (96, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\8455c805-c100-48c0-96ee-e997fe0c15d7.png', 'upload\mall\goods\20190324/8455c805-c100-48c0-96ee-e997fe0c15d7.png', NULL, '2019-03-24 04:42:30', 1, 'jbolt3.png', 1, 84097, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (97, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\207228e1-6c75-4aa1-adb6-9994742d2bac.png', 'upload\mall\goods\20190324/207228e1-6c75-4aa1-adb6-9994742d2bac.png', NULL, '2019-03-24 04:42:33', 1, 'jbolt2.png', 1, 153346, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (98, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\bc6cbbd2-34b1-4a82-a713-713024916a44.png', 'upload\mall\goods\20190324/bc6cbbd2-34b1-4a82-a713-713024916a44.png', NULL, '2019-03-24 04:45:09', 1, 'jbolt3.png', 1, 84097, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (99, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\5d861801-9120-4b60-a90d-7c434118386c.png', 'upload\mall\goods\20190324/5d861801-9120-4b60-a90d-7c434118386c.png', NULL, '2019-03-24 04:45:13', 1, 'jbolt1.png', 1, 154734, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (100, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\21190028-018e-4165-ac3a-4a698d045972.png', 'upload\mall\goods\20190324/21190028-018e-4165-ac3a-4a698d045972.png', NULL, '2019-03-24 04:45:19', 1, '艺术爬虫2.png', 1, 1185075, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (101, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\303836eb-2a03-4996-8be2-f782c2da42bd.png', 'upload\mall\goods\20190324/303836eb-2a03-4996-8be2-f782c2da42bd.png', NULL, '2019-03-24 04:45:26', 1, 'jbolt1.png', 1, 154734, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (102, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\2c38445f-2ca5-48e8-bde3-2345bc2ef7bd.png', 'upload\mall\goods\20190324/2c38445f-2ca5-48e8-bde3-2345bc2ef7bd.png', NULL, '2019-03-24 04:45:29', 1, 'jbolt4.png', 1, 62115, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (103, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\96bace22-74c2-445f-8b53-0f069a55cca2.jpg', 'upload\mall\goods\20190324/96bace22-74c2-445f-8b53-0f069a55cca2.jpg', NULL, '2019-03-24 04:52:22', 1, '艺术爬虫4.jpg', 1, 196492, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (104, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\78f91feb-a7b5-4166-abae-51162abc612a.jpg', 'upload\mall\goods\20190324/78f91feb-a7b5-4166-abae-51162abc612a.jpg', NULL, '2019-03-24 04:52:26', 1, '艺术爬虫2.jpg', 1, 186049, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (105, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\bf20effb-b8b1-46ed-a789-b8ce3558ac64.png', 'upload\mall\goods\20190324/bf20effb-b8b1-46ed-a789-b8ce3558ac64.png', NULL, '2019-03-24 04:52:40', 1, 'jbolt2.png', 1, 153346, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (106, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\d5757781-81a4-4bab-9e70-bec7b378b455.jpg', 'upload\mall\goods\20190324/d5757781-81a4-4bab-9e70-bec7b378b455.jpg', NULL, '2019-03-24 04:52:44', 1, '艺术爬虫.jpg', 1, 200850, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (107, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\05b539cd-901d-4318-833c-82d914b2a750.png', 'upload\mall\goods\20190324/05b539cd-901d-4318-833c-82d914b2a750.png', NULL, '2019-03-24 04:56:07', 1, 'jbolt4.png', 1, 62115, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (108, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\277faab1-f872-4eb7-974f-ce25e5725b9a.png', 'upload\mall\goods\20190324/277faab1-f872-4eb7-974f-ce25e5725b9a.png', NULL, '2019-03-24 04:56:16', 1, 'ddd.png', 1, 30532, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (109, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\681f603b-e597-45d1-bb56-9cfd35047160.png', 'upload\mall\goods\20190324/681f603b-e597-45d1-bb56-9cfd35047160.png', NULL, '2019-03-24 04:56:31', 1, 'ddd.png', 1, 30532, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (110, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\3270c2fa-b919-4181-a68b-2cd61a0f5cc5.jpg', 'upload\mall\goods\20190324/3270c2fa-b919-4181-a68b-2cd61a0f5cc5.jpg', NULL, '2019-03-24 04:57:19', 1, '艺术爬虫4.jpg', 1, 196492, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (111, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\140e5aed-3b2d-4e14-bd29-83279119985f.png', 'upload\mall\goods\20190324/140e5aed-3b2d-4e14-bd29-83279119985f.png', NULL, '2019-03-24 04:57:26', 1, 'ddd.png', 1, 30532, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (112, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\bca2dd99-e11f-43a5-abfd-b5c87ff7c6d7.png', 'upload\mall\goods\20190324/bca2dd99-e11f-43a5-abfd-b5c87ff7c6d7.png', NULL, '2019-03-24 04:58:20', 1, 'jbolt3.png', 1, 84097, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (113, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\698e2658-638e-44d5-98b2-3f3297af787f.png', 'upload\mall\goods\20190324/698e2658-638e-44d5-98b2-3f3297af787f.png', NULL, '2019-03-24 04:58:24', 1, 'ddd.png', 1, 30532, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (114, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\8403e00d-1c55-406d-ad07-1cbb0628eb59.png', 'upload\mall\goods\20190324/8403e00d-1c55-406d-ad07-1cbb0628eb59.png', NULL, '2019-03-24 04:58:56', 1, 'jbolt1.png', 1, 154734, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (115, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\615e3b2f-f339-4295-a202-d938b0698cfb.png', 'upload\mall\goods\20190324/615e3b2f-f339-4295-a202-d938b0698cfb.png', NULL, '2019-03-24 04:58:59', 1, '艺术爬虫0.png', 1, 26645, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (116, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\9f682f2a-ef65-4c57-bf2b-412d0c59aeaf.png', 'upload\mall\goods\20190324/9f682f2a-ef65-4c57-bf2b-412d0c59aeaf.png', NULL, '2019-03-24 04:59:55', 1, 'jbolt3.png', 1, 84097, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (117, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\17a3777a-d0d9-4829-b0c3-ead39901706f.png', 'upload\mall\goods\20190324/17a3777a-d0d9-4829-b0c3-ead39901706f.png', NULL, '2019-03-24 04:59:59', 1, 'jbolt1.png', 1, 154734, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (118, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\5e648181-2e1e-4bc3-8e6a-e0ec7a6831c5.png', 'upload\mall\goods\20190324/5e648181-2e1e-4bc3-8e6a-e0ec7a6831c5.png', NULL, '2019-03-24 05:00:21', 1, 'jbolt1.png', 1, 154734, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (119, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\003d193d-8bdc-4cc6-93df-56467ac93e37.png', 'upload\mall\goods\20190324/003d193d-8bdc-4cc6-93df-56467ac93e37.png', NULL, '2019-03-24 05:00:31', 1, 'ddd.png', 1, 30532, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (120, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\896aae89-37f0-434a-ba69-2b74aaafd561.png', 'upload\mall\goods\20190324/896aae89-37f0-434a-ba69-2b74aaafd561.png', NULL, '2019-03-24 05:01:28', 1, 'jbolt2.png', 1, 153346, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (121, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\b61e41fa-8bc4-4e1c-ab5f-e0bebcc98834.png', 'upload\mall\goods\20190324/b61e41fa-8bc4-4e1c-ab5f-e0bebcc98834.png', NULL, '2019-03-24 05:01:32', 1, '艺术爬虫3.png', 1, 1150480, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (122, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\694cf98c-80fd-4748-8bd5-022e99fbd594.png', 'upload\mall\goods\20190324/694cf98c-80fd-4748-8bd5-022e99fbd594.png', NULL, '2019-03-24 05:02:50', 1, 'jbolt5.png', 1, 113464, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (123, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\605ee5ad-372f-4bca-bcb0-c74ad2ce3338.png', 'upload\mall\goods\20190324/605ee5ad-372f-4bca-bcb0-c74ad2ce3338.png', NULL, '2019-03-24 05:02:54', 1, 'jbolt1.png', 1, 154734, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (124, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\f43db9d7-e557-44a5-9112-d7261d919d33.png', 'upload\mall\goods\20190324/f43db9d7-e557-44a5-9112-d7261d919d33.png', NULL, '2019-03-24 05:03:35', 1, 'jbolt5.png', 1, 113464, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (125, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\9ff555f9-1fca-4afd-873a-41e077191977.png', 'upload\mall\goods\20190324/9ff555f9-1fca-4afd-873a-41e077191977.png', NULL, '2019-03-24 05:03:38', 1, 'jbolt2.png', 1, 153346, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (126, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\3c35a658-5ef0-4d56-a968-dcc11edd324b.png', 'upload\mall\goods\20190324/3c35a658-5ef0-4d56-a968-dcc11edd324b.png', NULL, '2019-03-24 05:04:56', 1, 'jbolt2.png', 1, 153346, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (127, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\2184d12c-9fc6-4b53-96eb-09e8a71fe2c1.jpg', 'upload\mall\goods\20190324/2184d12c-9fc6-4b53-96eb-09e8a71fe2c1.jpg', NULL, '2019-03-24 05:05:06', 1, '艺术爬虫2.jpg', 1, 186049, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (128, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\6dd539f0-d26a-4124-9492-d561a147f981.png', 'upload\mall\goods\20190324/6dd539f0-d26a-4124-9492-d561a147f981.png', NULL, '2019-03-24 05:05:11', 1, '艺术爬虫4.png', 1, 697293, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (129, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\ba93bbde-f6df-4d6f-83cf-2cffac765ae3.jpg', 'upload\mall\goods\20190324/ba93bbde-f6df-4d6f-83cf-2cffac765ae3.jpg', NULL, '2019-03-24 05:13:14', 1, '艺术爬虫4.jpg', 1, 196492, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (130, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\6291d9c1-a4cd-4801-84db-96e0549eaad6.png', 'upload\mall\goods\20190324/6291d9c1-a4cd-4801-84db-96e0549eaad6.png', NULL, '2019-03-24 05:13:19', 1, '艺术爬虫2.png', 1, 1185075, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (131, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\f5eb7402-266b-4686-9d10-e0dd3aa48cba.jpg', 'upload\mall\goods\20190324/f5eb7402-266b-4686-9d10-e0dd3aa48cba.jpg', NULL, '2019-03-24 05:13:38', 1, '艺术爬虫3.jpg', 1, 204468, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (132, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\86293b00-206d-43a7-9811-dfc1d4d0471f.jpg', 'upload\mall\goods\20190324/86293b00-206d-43a7-9811-dfc1d4d0471f.jpg', NULL, '2019-03-24 05:13:42', 1, '艺术爬虫4.jpg', 1, 196492, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (133, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\8b4461d7-adc9-422d-807e-25f4c026e104.png', 'upload\mall\goods\20190324/8b4461d7-adc9-422d-807e-25f4c026e104.png', NULL, '2019-03-24 05:13:45', 1, '艺术爬虫2.png', 1, 1185075, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (134, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\91082d9c-3813-44cd-85f3-6e1ef631bb8f.png', 'upload\mall\goods\20190324/91082d9c-3813-44cd-85f3-6e1ef631bb8f.png', NULL, '2019-03-24 05:13:50', 1, '艺术爬虫2.png', 1, 1185075, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (135, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\01c88b74-10da-41ec-8e6c-518f3df5caf8.png', 'upload\mall\goods\20190324/01c88b74-10da-41ec-8e6c-518f3df5caf8.png', NULL, '2019-03-24 05:14:13', 1, '艺术爬虫0.png', 1, 26645, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (136, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\f95918da-a21e-4f5f-9723-1f09e3d2362a.png', 'upload\mall\goods\20190324/f95918da-a21e-4f5f-9723-1f09e3d2362a.png', NULL, '2019-03-24 05:14:17', 1, 'iii.png', 1, 51661, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (137, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\bce6bb12-e3f3-4fc6-a54b-355598677954.png', 'upload\mall\goods\20190324/bce6bb12-e3f3-4fc6-a54b-355598677954.png', NULL, '2019-03-24 05:18:33', 1, 'jbolt3.png', 1, 84097, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (138, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\d1c76a0d-1b18-4b58-9c03-b50b08657c1d.png', 'upload\mall\goods\20190324/d1c76a0d-1b18-4b58-9c03-b50b08657c1d.png', NULL, '2019-03-24 05:18:37', 1, 'ddd.png', 1, 30532, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (139, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\7e0a6102-6acd-4795-84ce-4260d7b9fa52.png', 'upload\mall\goods\20190324/7e0a6102-6acd-4795-84ce-4260d7b9fa52.png', NULL, '2019-03-24 05:18:42', 1, '艺术爬虫0.png', 1, 26645, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (140, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\e35af56e-4bc9-4d57-bb21-d4bd3fb2d9f9.png', 'upload\mall\goods\20190324/e35af56e-4bc9-4d57-bb21-d4bd3fb2d9f9.png', NULL, '2019-03-24 05:18:51', 1, 'iii.png', 1, 51661, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (141, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\4d32da13-beec-45fe-b70d-38bccf438693.jpg', 'upload\mall\goods\20190324/4d32da13-beec-45fe-b70d-38bccf438693.jpg', NULL, '2019-03-24 05:19:00', 1, '艺术爬虫2.jpg', 1, 186049, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (142, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\bafdb984-8209-4fcf-9054-1d8731561160.png', 'upload\mall\goods\20190324/bafdb984-8209-4fcf-9054-1d8731561160.png', NULL, '2019-03-24 05:19:04', 1, 'jbolt5.png', 1, 113464, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (143, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\66a1d847-f49f-466d-9eb4-16df8aa5c4fd.png', 'upload\mall\goods\20190324/66a1d847-f49f-466d-9eb4-16df8aa5c4fd.png', NULL, '2019-03-24 05:20:20', 1, 'jbolt2.png', 1, 153346, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (144, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\a5ed5099-df13-4037-a53f-06342178d76f.png', 'upload\mall\goods\20190324/a5ed5099-df13-4037-a53f-06342178d76f.png', NULL, '2019-03-24 05:20:25', 1, 'jbolt3.png', 1, 84097, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (145, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\2a9a608b-6a0a-4210-b729-ae8393a3cdf1.png', 'upload\mall\goods\20190324/2a9a608b-6a0a-4210-b729-ae8393a3cdf1.png', NULL, '2019-03-24 05:20:29', 1, '艺术爬虫2.png', 1, 1185075, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (146, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\ef343a35-eaaa-4d37-923b-e40498fac8be.jpg', 'upload\mall\goods\20190324/ef343a35-eaaa-4d37-923b-e40498fac8be.jpg', NULL, '2019-03-24 05:20:33', 1, '艺术爬虫4.jpg', 1, 196492, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (147, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\02cd64b5-b424-42ee-a24b-26601fa20cbc.png', 'upload\mall\goods\20190324/02cd64b5-b424-42ee-a24b-26601fa20cbc.png', NULL, '2019-03-24 05:21:05', 1, 'jbolt6.png', 1, 37818, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (148, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\67e3cfde-7762-41c8-bcef-6ac7ab4096fe.png', 'upload\mall\goods\20190324/67e3cfde-7762-41c8-bcef-6ac7ab4096fe.png', NULL, '2019-03-24 05:21:09', 1, 'jbolt2.png', 1, 153346, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (149, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\45f6023e-d2dc-417d-a249-c28f1384e793.png', 'upload\mall\goods\20190324/45f6023e-d2dc-417d-a249-c28f1384e793.png', NULL, '2019-03-24 05:21:13', 1, '艺术爬虫2.png', 1, 1185075, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (150, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\bdca0427-4cff-4ae9-8cd6-6642edb54d82.png', 'upload\mall\goods\20190324/bdca0427-4cff-4ae9-8cd6-6642edb54d82.png', NULL, '2019-03-24 05:22:28', 1, '艺术爬虫0.png', 1, 26645, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (151, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\602c72e0-6547-497c-b4f7-b7c1375606bc.jpg', 'upload\mall\goods\20190324/602c72e0-6547-497c-b4f7-b7c1375606bc.jpg', NULL, '2019-03-24 05:22:32', 1, '艺术爬虫4.jpg', 1, 196492, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (152, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\426a80f5-cf33-4943-8bee-166b6abcdc78.jpg', 'upload\mall\goods\20190324/426a80f5-cf33-4943-8bee-166b6abcdc78.jpg', NULL, '2019-03-24 05:22:35', 1, '艺术爬虫2.jpg', 1, 186049, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (153, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\f217a1fb-06a7-46c5-8fee-07366b33703e.jpg', 'upload\mall\goods\20190324/f217a1fb-06a7-46c5-8fee-07366b33703e.jpg', NULL, '2019-03-24 05:23:48', 1, '艺术爬虫.jpg', 1, 200850, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (154, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\f26ca0e4-78b7-4d90-a09e-b48954ad6a9c.jpg', 'upload\mall\goods\20190324/f26ca0e4-78b7-4d90-a09e-b48954ad6a9c.jpg', NULL, '2019-03-24 05:23:51', 1, '艺术爬虫4.jpg', 1, 196492, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (155, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\fdac986d-2375-4b29-adfd-0c8a26618dc5.png', 'upload\mall\goods\20190324/fdac986d-2375-4b29-adfd-0c8a26618dc5.png', NULL, '2019-03-24 05:23:55', 1, '艺术爬虫3.png', 1, 1150480, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (156, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\b8b1ad76-783d-4e25-9b9f-3b7b73c7ab1f.png', 'upload\mall\goods\20190324/b8b1ad76-783d-4e25-9b9f-3b7b73c7ab1f.png', NULL, '2019-03-24 05:24:43', 1, 'jbolt2.png', 1, 153346, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (157, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\6807af07-f86a-4c0e-a9eb-14d7840aedfb.png', 'upload\mall\goods\20190324/6807af07-f86a-4c0e-a9eb-14d7840aedfb.png', NULL, '2019-03-24 05:24:46', 1, 'jbolt4.png', 1, 62115, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (158, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\188f1118-1846-4d50-bd7e-fbcc0b1180ab.png', 'upload\mall\goods\20190324/188f1118-1846-4d50-bd7e-fbcc0b1180ab.png', NULL, '2019-03-24 05:25:22', 1, 'jbolt1.png', 1, 154734, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (159, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\8359b5b0-51e7-487d-84c8-7166221962c8.png', 'upload\mall\goods\20190324/8359b5b0-51e7-487d-84c8-7166221962c8.png', NULL, '2019-03-24 05:25:29', 1, 'jbolt1.png', 1, 154734, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (160, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\e07e5310-911b-4a0d-b090-a96d8def9dbd.jpg', 'upload\mall\goods\20190324/e07e5310-911b-4a0d-b090-a96d8def9dbd.jpg', NULL, '2019-03-24 05:35:56', 1, '艺术爬虫3.jpg', 1, 204468, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (161, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\da62e840-e2c1-45aa-bd18-d38bd2925205.png', 'upload\mall\goods\20190324/da62e840-e2c1-45aa-bd18-d38bd2925205.png', NULL, '2019-03-24 05:35:59', 1, '艺术爬虫0.png', 1, 26645, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (162, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\2e977f3d-76b2-40fb-ab0a-b17fdcba9cd6.png', 'upload\mall\goods\20190324/2e977f3d-76b2-40fb-ab0a-b17fdcba9cd6.png', NULL, '2019-03-24 05:36:03', 1, '艺术爬虫4.png', 1, 697293, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (163, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\6ea34671-f1f1-4a9a-89b1-5c392a7ab75d.png', 'upload\mall\goods\20190324/6ea34671-f1f1-4a9a-89b1-5c392a7ab75d.png', NULL, '2019-03-24 05:36:57', 1, 'jbolt2.png', 1, 153346, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (164, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\2afa1904-9c7b-4e41-b607-474231b6b919.png', 'upload\mall\goods\20190324/2afa1904-9c7b-4e41-b607-474231b6b919.png', NULL, '2019-03-24 05:37:01', 1, 'jbolt5.png', 1, 113464, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (165, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\a586e507-87f1-4c30-8e76-1ec6b48fbed5.png', 'upload\mall\goods\20190324/a586e507-87f1-4c30-8e76-1ec6b48fbed5.png', NULL, '2019-03-24 05:37:05', 1, 'jbolt1.png', 1, 154734, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (166, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\11e33619-d540-4771-83dc-1dc77afad298.png', 'upload\mall\goods\20190324/11e33619-d540-4771-83dc-1dc77afad298.png', NULL, '2019-03-24 05:37:10', 1, 'ddd.png', 1, 30532, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (167, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\e1dbdfb8-1341-4993-8781-644603953372.png', 'upload\mall\goods\20190324/e1dbdfb8-1341-4993-8781-644603953372.png', NULL, '2019-03-24 05:37:43', 1, '艺术爬虫0.png', 1, 26645, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (168, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\f7a5ac78-72d1-4f5d-b8d6-ea210dada270.jpg', 'upload\mall\goods\20190324/f7a5ac78-72d1-4f5d-b8d6-ea210dada270.jpg', NULL, '2019-03-24 05:37:47', 1, '艺术爬虫3.jpg', 1, 204468, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (169, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\fe35e236-9cb7-48fd-8cfd-d834c53aaff6.png', 'upload\mall\goods\20190324/fe35e236-9cb7-48fd-8cfd-d834c53aaff6.png', NULL, '2019-03-24 05:37:52', 1, '艺术爬虫4.png', 1, 697293, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (170, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\ddbf3a69-8da8-4099-bb6f-3e75045432c3.png', 'upload\mall\goods\20190324/ddbf3a69-8da8-4099-bb6f-3e75045432c3.png', NULL, '2019-03-24 05:38:33', 1, 'jbolt3.png', 1, 84097, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (171, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\3688d140-6c0d-4d2c-8412-8e74200844f6.png', 'upload\mall\goods\20190324/3688d140-6c0d-4d2c-8412-8e74200844f6.png', NULL, '2019-03-24 05:38:36', 1, 'jbolt1.png', 1, 154734, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (172, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\173c1fd8-3678-4ea8-9bf4-1df8936ff283.jpg', 'upload\mall\goods\20190324/173c1fd8-3678-4ea8-9bf4-1df8936ff283.jpg', NULL, '2019-03-24 05:38:39', 1, '艺术爬虫4.jpg', 1, 196492, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (173, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\8df090e9-24dc-4283-8941-3c323a4c367b.png', 'upload\mall\goods\20190324/8df090e9-24dc-4283-8941-3c323a4c367b.png', NULL, '2019-03-24 05:38:51', 1, 'jbolt3.png', 1, 84097, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (174, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\cab20214-1819-48d1-844f-67b2260506ea.png', 'upload\mall\goods\20190324/cab20214-1819-48d1-844f-67b2260506ea.png', NULL, '2019-03-24 06:29:08', 1, '99312d467b6d9a40bff8de6888f01da9_2_3_art.png', 1, 1869734, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (175, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\95a274ce-0b44-40d0-b3df-cd7a8a5d902d.png', 'upload\mall\goods\20190324/95a274ce-0b44-40d0-b3df-cd7a8a5d902d.png', NULL, '2019-03-24 06:29:13', 1, 'jbolt1.png', 1, 154734, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (176, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\f0f1d949-b852-4762-bce5-885979592a5d.png', 'upload\mall\goods\20190324/f0f1d949-b852-4762-bce5-885979592a5d.png', NULL, '2019-03-24 06:29:18', 1, '艺术爬虫0.png', 1, 26645, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (177, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\83bee5eb-df1b-4146-ae7f-15e744da04db.jpg', 'upload\mall\goods\20190324/83bee5eb-df1b-4146-ae7f-15e744da04db.jpg', NULL, '2019-03-24 06:29:23', 1, '数据猫.jpg', 1, 62515, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (178, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\76b550f2-0da4-4214-8543-e1da25169a5c.png', 'upload\mall\goods\20190324/76b550f2-0da4-4214-8543-e1da25169a5c.png', NULL, '2019-03-24 06:30:03', 1, 'jbolt5.png', 1, 113464, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (179, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\02191889-1f45-4fbf-8a45-a55db522ceeb.png', 'upload\mall\goods\20190324/02191889-1f45-4fbf-8a45-a55db522ceeb.png', NULL, '2019-03-24 06:30:08', 1, 'jbolt2.png', 1, 153346, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (180, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\3ea725de-4301-41d2-b50e-e7b6d9dfd50f.png', 'upload\mall\goods\20190324/3ea725de-4301-41d2-b50e-e7b6d9dfd50f.png', NULL, '2019-03-24 06:30:18', 1, 'jbolt1.png', 1, 154734, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (181, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\e2a79233-cfaa-4000-878d-eed60284c47d.jpg', 'upload\mall\goods\20190324/e2a79233-cfaa-4000-878d-eed60284c47d.jpg', NULL, '2019-03-24 06:30:22', 1, '数据猫.jpg', 1, 62515, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (182, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\971b606a-9457-4a96-9bb3-7e2d57b5bf1b.png', 'upload\mall\goods\20190324/971b606a-9457-4a96-9bb3-7e2d57b5bf1b.png', NULL, '2019-03-24 06:30:27', 1, '0033.png', 1, 607532, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (183, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\6654eddc-4edd-4bef-baa4-53b97e7bfe50.png', 'upload\mall\goods\20190324/6654eddc-4edd-4bef-baa4-53b97e7bfe50.png', NULL, '2019-03-24 06:30:31', 1, '艺术爬虫0.png', 1, 26645, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (184, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\0e1b951d-e9d8-47ab-b490-b5436aec99c2.png', 'upload\mall\goods\20190324/0e1b951d-e9d8-47ab-b490-b5436aec99c2.png', NULL, '2019-03-24 06:30:36', 1, 'jbolt3.png', 1, 84097, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (185, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\6b7000ee-cba7-4d42-8ce3-af9a64aa3b16.png', 'upload\mall\goods\20190324/6b7000ee-cba7-4d42-8ce3-af9a64aa3b16.png', NULL, '2019-03-24 06:30:40', 1, 'ddd.png', 1, 30532, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (186, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\330994b6-6f88-436b-94a1-7674d421d48f.png', 'upload\mall\goods\20190324/330994b6-6f88-436b-94a1-7674d421d48f.png', NULL, '2019-03-24 06:30:46', 1, 'jbolt.png', 1, 37818, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (187, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\45931ddd-2a84-4633-a062-e8ee03f3d007.png', 'upload\mall\goods\20190324/45931ddd-2a84-4633-a062-e8ee03f3d007.png', NULL, '2019-03-24 06:32:01', 1, 'JFinal学院小店_手机海报_2019.03.07 (1).png', 1, 173957, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (188, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190324\13f00ee5-b15a-44a9-9e28-30ced50eb233.png', 'upload\mall\goods\20190324/13f00ee5-b15a-44a9-9e28-30ced50eb233.png', NULL, '2019-03-24 06:33:06', 1, '定制研发_自定义px_2019.03.07.png', 1, 308742, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (189, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190325\1955ad49-eec1-4c53-828e-798c50e68018.jpg', 'upload\mall\goods\20190325/1955ad49-eec1-4c53-828e-798c50e68018.jpg', NULL, '2019-03-25 23:40:23', 1, '_wKgBDVuJApeAPVs0AABRpi0LyuE300 (1).jpg', 1, 20902, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (190, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190325\ec8f0347-14d8-40c8-8184-f9e20e14adf1.jpg', 'upload\mall\goods\20190325/ec8f0347-14d8-40c8-8184-f9e20e14adf1.jpg', NULL, '2019-03-25 23:40:35', 1, '艺术爬虫3.jpg', 1, 204468, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (191, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190325\08d64a73-63a4-4e5a-b6d7-65204850080a.png', 'upload\mall\goods\20190325/08d64a73-63a4-4e5a-b6d7-65204850080a.png', NULL, '2019-03-25 23:40:38', 1, '艺术爬虫4.png', 1, 697293, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (192, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190325\13e54b20-0c0c-4cca-8b24-0a6af71cfb21.jpg', 'upload\mall\goods\20190325/13e54b20-0c0c-4cca-8b24-0a6af71cfb21.jpg', NULL, '2019-03-25 23:43:24', 1, 't02.jpg', 1, 51013, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (193, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190325\3b30bd29-7f82-4a47-9a87-504cdedc7e4f.png', 'upload\mall\goods\20190325/3b30bd29-7f82-4a47-9a87-504cdedc7e4f.png', NULL, '2019-03-25 23:43:31', 1, '艺术爬虫0.png', 1, 26645, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (194, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190325\7db53ccd-7662-4afd-b252-c0c32cf2f175.jpg', 'upload\mall\goods\20190325/7db53ccd-7662-4afd-b252-c0c32cf2f175.jpg', NULL, '2019-03-25 23:43:38', 1, 'psb (2).jpg', 1, 28308, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (195, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190325\bf7d9872-1979-4b68-8a14-e5a6c59a379e.jpg', 'upload\mall\goods\20190325/bf7d9872-1979-4b68-8a14-e5a6c59a379e.jpg', NULL, '2019-03-25 23:43:45', 1, 't03.jpg', 1, 382231, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (196, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190325\f98e665c-0c7c-4783-a43b-21b0c4285368.png', 'upload\mall\goods\20190325/f98e665c-0c7c-4783-a43b-21b0c4285368.png', NULL, '2019-03-25 23:51:18', 1, '0.png', 1, 23680, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (197, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190325\c8b288af-24bc-48b5-be28-5bb90ceda1fe.png', 'upload\mall\goods\20190325/c8b288af-24bc-48b5-be28-5bb90ceda1fe.png', NULL, '2019-03-25 23:52:02', 1, '定制研发_自定义px_2019.03.07.png', 1, 308742, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (198, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190331\aad46976-ab79-4191-aca0-2cda17ef44b0.jpg', 'upload\mall\goods\20190331/aad46976-ab79-4191-aca0-2cda17ef44b0.jpg', NULL, '2019-03-31 16:58:58', 1, '_wKgBDVuJApeAPVs0AABRpi0LyuE300 (1).jpg', 1, 20902, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (199, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190331\b4d356ce-7c1b-49aa-b2dd-42fe9f13ee14.jpg', 'upload\mall\goods\20190331/b4d356ce-7c1b-49aa-b2dd-42fe9f13ee14.jpg', NULL, '2019-03-31 16:59:01', 1, '_wKgBDVuJApeAPVs0AABRpi0LyuE300 (1).jpg', 1, 20902, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (200, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190331\ec9f60cb-9149-4c5a-9a86-b37093b3d326.jpg', 'upload\mall\goods\20190331/ec9f60cb-9149-4c5a-9a86-b37093b3d326.jpg', NULL, '2019-03-31 16:59:05', 1, '_wKgBDVuJApeAPVs0AABRpi0LyuE300.jpg', 1, 74, NULL);
INSERT INTO "public"."jb_jbolt_file" VALUES (201, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190331\f600afd5-ce7d-41d8-b697-4af7c89e8c09.jpg', 'upload\mall\goods\20190331/f600afd5-ce7d-41d8-b697-4af7c89e8c09.jpg', NULL, '2019-03-31 16:59:08', 1, '_wKgBDVu_I5OAU41qAABZ0Jdjv8w043.jpg', 1, 22992, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (202, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190331\7e3382f1-a603-4ed6-96d7-404f816dd329.jpg', 'upload\mall\goods\20190331/7e3382f1-a603-4ed6-96d7-404f816dd329.jpg', NULL, '2019-03-31 17:27:16', 1, '_wKgBDVu_I5OAU41qAABZ0Jdjv8w043.jpg', 1, 22992, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (203, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190331\701d8620-e0fc-4e64-9a47-3239e62c1ea0.jpg', 'upload\mall\goods\20190331/701d8620-e0fc-4e64-9a47-3239e62c1ea0.jpg', NULL, '2019-03-31 18:28:05', 1, '_wKgBDVu_I5OAU41qAABZ0Jdjv8w043.jpg', 1, 22992, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (204, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190331\ee27da20-7646-46b8-93e7-e44fa7796f6d.png', 'upload\mall\goods\20190331/ee27da20-7646-46b8-93e7-e44fa7796f6d.png', NULL, '2019-03-31 19:18:28', 1, 'chuangye.png', 1, 4325, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (205, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190331\344b7957-f64c-4afd-b3b9-365698719a3f.png', 'upload\mall\goods\20190331/344b7957-f64c-4afd-b3b9-365698719a3f.png', NULL, '2019-03-31 19:18:32', 1, 'jfinal.png', 1, 72070, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (206, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods\20190331\b6d66ed3-1969-440b-bc60-500ca3c7d2f5.png', 'upload\mall\goods\20190331/b6d66ed3-1969-440b-bc60-500ca3c7d2f5.png', NULL, '2019-03-31 19:35:22', 1, 'avatar.png', 1, 2402, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (207, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods/20190331/5f950f58-3348-495c-897f-3887eb7ee92c.png', 'upload/mall\goods/20190331/5f950f58-3348-495c-897f-3887eb7ee92c.png', NULL, '2019-03-31 19:39:17', 1, 'jfinal.png', 1, 72070, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (208, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods/20190331/04e06b61-3829-4774-a78e-404234da2133.png', 'upload/mall\goods/20190331/04e06b61-3829-4774-a78e-404234da2133.png', NULL, '2019-03-31 19:41:57', 1, 'fa.png', 1, 122997, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (209, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods/20190331/19bae38f-6bc9-491f-ab19-bcb453df0a66.png', 'upload/mall\goods/20190331/19bae38f-6bc9-491f-ab19-bcb453df0a66.png', NULL, '2019-03-31 19:42:03', 1, 'fa.png', 1, 122997, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (210, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall\goods/20190331/f6aa281d-a74e-4e23-afb3-76ccdf991064.png', 'upload/mall\goods/20190331/f6aa281d-a74e-4e23-afb3-76ccdf991064.png', NULL, '2019-03-31 19:44:57', 1, 'fa.png', 1, 122997, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (211, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190331/ecb75f65-2fcb-4411-920a-b725e1e0a401.png', 'upload/mall/goods/20190331/ecb75f65-2fcb-4411-920a-b725e1e0a401.png', NULL, '2019-03-31 19:49:18', 1, 'biguanxueyuanxiao.png', 1, 7667, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (212, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190331/ee074ad4-afe7-45a3-bb86-07b46c0b11b5.png', 'upload/mall/goods/20190331/ee074ad4-afe7-45a3-bb86-07b46c0b11b5.png', NULL, '2019-03-31 19:52:08', 1, 'biguanxueyuannourl.png', 1, 1003432, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (213, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190331/00d582a5-f814-4343-ae0a-e43446d2c1a6.png', 'upload/mall/goods/20190331/00d582a5-f814-4343-ae0a-e43446d2c1a6.png', NULL, '2019-03-31 19:53:00', 1, 'dalogo.png', 1, 17234, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (214, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190331/e6612574-83e2-43b5-ad8b-63896116564d.png', 'upload/mall/goods/20190331/e6612574-83e2-43b5-ad8b-63896116564d.png', NULL, '2019-03-31 19:55:26', 1, 'favicon.png', 1, 18822, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (215, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190331/43650aec-fda6-40a7-8103-eca1807eb1b7.png', 'upload/mall/goods/20190331/43650aec-fda6-40a7-8103-eca1807eb1b7.png', NULL, '2019-03-31 19:55:35', 1, 'chuangye.png', 1, 4325, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (216, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190331/cae07a03-2cac-4e1a-9115-da19bd291cb0.png', 'upload/mall/goods/20190331/cae07a03-2cac-4e1a-9115-da19bd291cb0.png', NULL, '2019-03-31 19:58:43', 1, 'jfinalxueyuanbiglogo.png', 1, 1963777, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (217, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190331/8de621d4-be4d-4608-b98a-346d55fb2cfa.jpg', 'upload/mall/goods/20190331/8de621d4-be4d-4608-b98a-346d55fb2cfa.jpg', NULL, '2019-03-31 20:01:52', 1, '640.jpg', 1, 19018, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (218, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190331/476b409b-8c11-4c60-8ce6-c6d58a3f6540.png', 'upload/mall/goods/20190331/476b409b-8c11-4c60-8ce6-c6d58a3f6540.png', NULL, '2019-03-31 20:02:14', 1, 'jfinalxueyuanlogonew1.png', 1, 14856, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (219, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190331/4853830a-98d8-46c4-ab10-e5694cb3ac0d.png', 'upload/mall/goods/20190331/4853830a-98d8-46c4-ab10-e5694cb3ac0d.png', NULL, '2019-03-31 20:02:17', 1, 'jfinalxueyuanlogo.png', 1, 363132, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (220, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190331/2e1fd54e-ead5-4e68-9068-779144f4bcfe.png', 'upload/mall/goods/20190331/2e1fd54e-ead5-4e68-9068-779144f4bcfe.png', NULL, '2019-03-31 20:02:32', 1, '登录2.png', 1, 1221896, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (221, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190331/18a76b3c-c18a-4523-8d83-17aedf867359.png', 'upload/mall/goods/20190331/18a76b3c-c18a-4523-8d83-17aedf867359.png', NULL, '2019-03-31 20:02:47', 1, 'maven1.png', 1, 3409, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (222, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190331/7d8c6f42-f3ec-4d8d-82c7-8617c3e7bf6f.png', 'upload/mall/goods/20190331/7d8c6f42-f3ec-4d8d-82c7-8617c3e7bf6f.png', NULL, '2019-03-31 20:03:06', 1, '1540517922.png', 1, 45980, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (223, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190331/1aaae098-4faf-463d-aa5e-58b8141800b5.jpg', 'upload/mall/goods/20190331/1aaae098-4faf-463d-aa5e-58b8141800b5.jpg', NULL, '2019-03-31 20:03:21', 1, '_wKgBDVu_I5OAU41qAABZ0Jdjv8w043.jpg', 1, 22992, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (224, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190331/7331c335-e75b-48ff-b084-b2d98bbd8e5e.png', 'upload/mall/goods/20190331/7331c335-e75b-48ff-b084-b2d98bbd8e5e.png', NULL, '2019-03-31 20:03:28', 1, '1553529648.png', 1, 9119, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (225, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190331/85ec63f5-3a7f-47df-b107-c0b1d2970914.png', 'upload/mall/goods/20190331/85ec63f5-3a7f-47df-b107-c0b1d2970914.png', NULL, '2019-03-31 20:03:35', 1, '1.png', 1, 235126, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (226, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190331/0882d546-d9e2-4646-bc27-755f8990fbd4.png', 'upload/mall/goods/20190331/0882d546-d9e2-4646-bc27-755f8990fbd4.png', NULL, '2019-03-31 20:03:39', 1, '1539853740.png', 1, 4325, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (227, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190331/0eeace08-e3ac-4581-b76a-828f1bc760bd.jpeg', 'upload/mall/goods/20190331/0eeace08-e3ac-4581-b76a-828f1bc760bd.jpeg', NULL, '2019-03-31 20:03:44', 1, '5373472.jpeg', 1, 67978, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (228, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190331/05645250-e7a1-40be-a9de-4d0225a9ffac.png', 'upload/mall/goods/20190331/05645250-e7a1-40be-a9de-4d0225a9ffac.png', NULL, '2019-03-31 20:03:48', 1, '艺术爬虫4.png', 1, 697293, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (229, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190331/5fe8fc70-51de-41c4-822a-76fd6ae5cede.png', 'upload/mall/goods/20190331/5fe8fc70-51de-41c4-822a-76fd6ae5cede.png', NULL, '2019-03-31 20:03:57', 1, 'jboltlogo.png', 1, 5457, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (230, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190331/5f073313-c745-4d21-ae2e-5db7607b2c1e.png', 'upload/mall/goods/20190331/5f073313-c745-4d21-ae2e-5db7607b2c1e.png', NULL, '2019-03-31 20:04:07', 1, '99312d467b6d9a40bff8de6888f01da9_2_3_art.png', 1, 1869734, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (231, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190406/392de036-ac7d-4560-a5bd-1f841bf63333.png', 'upload/mall/goods/20190406/392de036-ac7d-4560-a5bd-1f841bf63333.png', NULL, '2019-04-06 12:57:26', 1, '1.png', 1, 429243, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (232, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190406/8aac7986-aec9-418b-aacd-8f844664bf48.png', 'upload/mall/goods/20190406/8aac7986-aec9-418b-aacd-8f844664bf48.png', NULL, '2019-04-06 12:57:34', 1, '1.png', 1, 429243, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (233, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190406/3a1dae43-d81f-4eee-9a0e-471bd8effb90.jpg', 'upload/mall/goods/20190406/3a1dae43-d81f-4eee-9a0e-471bd8effb90.jpg', NULL, '2019-04-06 12:57:39', 1, '11111111.jpg', 1, 14095, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (234, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190406/677d6adc-fd6d-4afb-ab0f-3219be8ac028.png', 'upload/mall/goods/20190406/677d6adc-fd6d-4afb-ab0f-3219be8ac028.png', NULL, '2019-04-06 12:57:43', 1, 'jfinalmeinvtu005.png', 1, 1187516, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (235, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190406/f4065771-433a-49d3-ab9e-8c034fdef3e7.jpg', 'upload/mall/goods/20190406/f4065771-433a-49d3-ab9e-8c034fdef3e7.jpg', NULL, '2019-04-06 12:57:58', 1, 'czjy.jpg', 1, 32673, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (236, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190409/376ea358-fbb4-4a08-b4ac-26c404805e9b.png', 'upload/mall/goods/20190409/376ea358-fbb4-4a08-b4ac-26c404805e9b.png', NULL, '2019-04-09 14:46:05', 1, '444.png', 1, 525678, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (237, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190409/3078bd29-ae5b-4b62-b672-c63681c3dbaf.jpg', 'upload/mall/goods/20190409/3078bd29-ae5b-4b62-b672-c63681c3dbaf.jpg', NULL, '2019-04-09 14:46:09', 1, '_wKgBDVu_I5OAU41qAABZ0Jdjv8w043.jpg', 1, 22992, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (238, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190409/079c0b63-5bfa-4ae2-816f-bce103cdcff0.jpg', 'upload/mall/goods/20190409/079c0b63-5bfa-4ae2-816f-bce103cdcff0.jpg', NULL, '2019-04-09 14:46:17', 1, '_wKgBDVu_I5OAU41qAABZ0Jdjv8w043.jpg', 1, 22992, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (239, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190409/884ab7e6-3438-4579-aa28-0ba3cd641db0.jpg', 'upload/mall/goods/20190409/884ab7e6-3438-4579-aa28-0ba3cd641db0.jpg', NULL, '2019-04-09 14:53:08', 1, '_wKgBDVu_I5OAU41qAABZ0Jdjv8w043.jpg', 1, 22992, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (240, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190409/559d2430-c7b2-41a9-b71c-3ff5f3a2efb0.jpg', 'upload/mall/goods/20190409/559d2430-c7b2-41a9-b71c-3ff5f3a2efb0.jpg', NULL, '2019-04-09 16:37:52', 1, '_wKgBDVu_I5OAU41qAABZ0Jdjv8w043.jpg', 1, 22992, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (241, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/c32f5af4-8e42-41c6-a295-a2f271aadebe.jpg', 'upload/mall/goods/20190410/65/c32f5af4-8e42-41c6-a295-a2f271aadebe.jpg', NULL, '2019-04-10 01:00:44', 1, '_wKgBDVu_I5OAU41qAABZ0Jdjv8w043.jpg', 1, 22992, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (242, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/3cdaec46-05fa-4b36-a96a-4640227808c4.png', 'upload/mall/goods/20190410/65/3cdaec46-05fa-4b36-a96a-4640227808c4.png', NULL, '2019-04-10 01:00:53', 1, '1.png', 1, 235126, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (243, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/7fa8e2c7-f3ee-4216-ae24-d53da4ad73d7.doc', 'upload/mall/goods/20190410/65/7fa8e2c7-f3ee-4216-ae24-d53da4ad73d7.doc', NULL, '2019-04-10 01:05:46', 1, '1c5a4f60-769a-43d4-9f47-039fd09af36e.doc', 1, 25088, 'xls');
INSERT INTO "public"."jb_jbolt_file" VALUES (244, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/dfa71cb9-35e7-4c9e-bb88-a8b59cac4de8.jpg', 'upload/mall/goods/20190410/65/dfa71cb9-35e7-4c9e-bb88-a8b59cac4de8.jpg', NULL, '2019-04-10 01:07:08', 1, '_wKgBDVu_I5OAU41qAABZ0Jdjv8w043.jpg', 1, 22992, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (245, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/8ec721e6-4263-448a-aa52-0d5885cdf132.doc', 'upload/mall/goods/20190410/65/8ec721e6-4263-448a-aa52-0d5885cdf132.doc', NULL, '2019-04-10 01:07:21', 1, '1c5a4f60-769a-43d4-9f47-039fd09af36e.doc', 1, 25088, 'xls');
INSERT INTO "public"."jb_jbolt_file" VALUES (246, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/ebfde4ca-01ef-4561-8501-5814baaface7.png', 'upload/mall/goods/20190410/65/ebfde4ca-01ef-4561-8501-5814baaface7.png', NULL, '2019-04-10 01:09:49', 1, '222.png', 1, 59711, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (247, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/68a15ad8-6813-4147-a593-24665bfca996.jpg', 'upload/mall/goods/20190410/65/68a15ad8-6813-4147-a593-24665bfca996.jpg', NULL, '2019-04-10 01:09:55', 1, '_wKgBDVu_I5OAU41qAABZ0Jdjv8w043.jpg', 1, 22992, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (248, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/ae6e0dfc-4004-4e48-a31f-bf803665b360.gif', 'upload/mall/goods/20190410/65/ae6e0dfc-4004-4e48-a31f-bf803665b360.gif', NULL, '2019-04-10 01:10:02', 1, 'doing.gif', 1, 133241, NULL);
INSERT INTO "public"."jb_jbolt_file" VALUES (249, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/f6089bb5-8f1a-4ace-9318-5075270f2a54.png', 'upload/mall/goods/20190410/65/f6089bb5-8f1a-4ace-9318-5075270f2a54.png', NULL, '2019-04-10 01:10:09', 1, 'JBolt平台二次开发入门指南.png', 1, 84158, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (250, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/a9c3f492-a8bb-4207-b39b-d6a314a593a6.jpg', 'upload/mall/goods/20190410/65/a9c3f492-a8bb-4207-b39b-d6a314a593a6.jpg', NULL, '2019-04-10 01:10:19', 1, 'gh_3dc91b668ea9_430.jpg', 1, 109386, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (251, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/668e8234-f9c1-4808-8e66-17fc437b4b48.doc', 'upload/mall/goods/20190410/65/668e8234-f9c1-4808-8e66-17fc437b4b48.doc', NULL, '2019-04-10 01:10:30', 1, '1c5a4f60-769a-43d4-9f47-039fd09af36e.doc', 1, 25088, 'xls');
INSERT INTO "public"."jb_jbolt_file" VALUES (252, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/9ebcb154-4ded-4307-ab48-76c533cf6f41.jpg', 'upload/mall/goods/20190410/65/9ebcb154-4ded-4307-ab48-76c533cf6f41.jpg', NULL, '2019-04-10 01:10:38', 1, '_wKgBDVu_I5OAU41qAABZ0Jdjv8w043.jpg', 1, 22992, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (253, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/93d5ba74-4651-452b-8ece-758632e5a189.png', 'upload/mall/goods/20190410/65/93d5ba74-4651-452b-8ece-758632e5a189.png', NULL, '2019-04-10 01:22:30', 1, '444.png', 1, 525678, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (254, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/a1f5874f-d456-412f-90f6-9d37328fffb0.jpg', 'upload/mall/goods/20190410/65/a1f5874f-d456-412f-90f6-9d37328fffb0.jpg', NULL, '2019-04-10 01:22:37', 1, '_wKgBDVu_I5OAU41qAABZ0Jdjv8w043.jpg', 1, 22992, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (255, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/0437f45a-9907-46f0-8b36-ac8254ca57c5.png', 'upload/mall/goods/20190410/65/0437f45a-9907-46f0-8b36-ac8254ca57c5.png', NULL, '2019-04-10 01:23:39', 1, '444.png', 1, 525678, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (256, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/1819af8e-4ce2-4178-b0df-46b9604141df.png', 'upload/mall/goods/20190410/65/1819af8e-4ce2-4178-b0df-46b9604141df.png', NULL, '2019-04-10 01:23:52', 1, '222.png', 1, 59711, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (257, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/dce56586-8196-48b4-81dc-b2b500a0f810.png', 'upload/mall/goods/20190410/65/dce56586-8196-48b4-81dc-b2b500a0f810.png', NULL, '2019-04-10 01:24:29', 1, '556.png', 1, 1747, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (258, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/d2843620-3e12-4a7d-b552-09586463404f.jpg', 'upload/mall/goods/20190410/65/d2843620-3e12-4a7d-b552-09586463404f.jpg', NULL, '2019-04-10 01:34:41', 1, '_wKgBDVu_I5OAU41qAABZ0Jdjv8w043.jpg', 1, 22992, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (259, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/caf26a1e-c3fb-4345-baac-08ecdf039560.png', 'upload/mall/goods/20190410/65/caf26a1e-c3fb-4345-baac-08ecdf039560.png', NULL, '2019-04-10 01:35:25', 1, 'jbolth后台管理系统_自定义px_2019.03.16.png', 1, 115725, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (260, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/49df64ac-162a-4f30-8381-870d9ad520bf.png', 'upload/mall/goods/20190410/65/49df64ac-162a-4f30-8381-870d9ad520bf.png', NULL, '2019-04-10 01:35:49', 1, '232.png', 1, 565872, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (261, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/5d87295d-ee16-4b1e-a205-c1e0456349f6.png', 'upload/mall/goods/20190410/65/5d87295d-ee16-4b1e-a205-c1e0456349f6.png', NULL, '2019-04-10 01:36:50', 1, '232.png', 1, 565872, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (262, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/c466c689-3d1d-4a12-b0ba-0d1229949a92.png', 'upload/mall/goods/20190410/65/c466c689-3d1d-4a12-b0ba-0d1229949a92.png', NULL, '2019-04-10 01:37:07', 1, '232.png', 1, 565872, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (263, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/ea4ff0af-ac9e-464b-a587-d62102fb95fc.png', 'upload/mall/goods/20190410/65/ea4ff0af-ac9e-464b-a587-d62102fb95fc.png', NULL, '2019-04-10 01:37:28', 1, 'jfinal生态调查报告.png', 1, 98246, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (264, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/833de525-5bb6-4470-a79d-cb3f8a95f02e.png', 'upload/mall/goods/20190410/65/833de525-5bb6-4470-a79d-cb3f8a95f02e.png', NULL, '2019-04-10 01:37:39', 1, 'jbolth后台管理系统_自定义px_2019.03.16.png', 1, 115725, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (265, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/5d67c835-a9d5-44cb-b23d-862104e12b82.png', 'upload/mall/goods/20190410/65/5d67c835-a9d5-44cb-b23d-862104e12b82.png', NULL, '2019-04-10 01:47:48', 1, '222.png', 1, 59711, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (266, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/1a888fb7-65d6-4a69-9bd6-150392af7211.png', 'upload/mall/goods/20190410/65/1a888fb7-65d6-4a69-9bd6-150392af7211.png', NULL, '2019-04-10 01:48:21', 1, '444.png', 1, 525678, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (267, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/65c739dc-6f43-4502-8923-b4cd4726dfad.png', 'upload/mall/goods/20190410/65/65c739dc-6f43-4502-8923-b4cd4726dfad.png', NULL, '2019-04-10 01:48:32', 1, '222.png', 1, 59711, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (268, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/c0fb4e02-7088-40b0-a3e7-1165aa1d21e5.png', 'upload/mall/goods/20190410/65/c0fb4e02-7088-40b0-a3e7-1165aa1d21e5.png', NULL, '2019-04-10 01:48:32', 1, '232.png', 1, 565872, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (269, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/448a4d71-0697-4b30-9c62-15117c8de3ff.png', 'upload/mall/goods/20190410/65/448a4d71-0697-4b30-9c62-15117c8de3ff.png', NULL, '2019-04-10 01:48:32', 1, '333.png', 1, 59082, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (270, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/740387c6-1048-4552-901c-1e7adf37e9e6.png', 'upload/mall/goods/20190410/65/740387c6-1048-4552-901c-1e7adf37e9e6.png', NULL, '2019-04-10 01:48:41', 1, '333.png', 1, 59082, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (271, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/aefed8f4-1b02-4356-87df-36c38819a635.png', 'upload/mall/goods/20190410/65/aefed8f4-1b02-4356-87df-36c38819a635.png', NULL, '2019-04-10 01:48:41', 1, '444.png', 1, 525678, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (272, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/b4fae148-a4c5-4885-b51a-3b9dd5043152.png', 'upload/mall/goods/20190410/65/b4fae148-a4c5-4885-b51a-3b9dd5043152.png', NULL, '2019-04-10 01:53:30', 1, '333.png', 1, 59082, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (273, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/eac9cbf0-6150-4956-b360-eb242d6cfbc5.png', 'upload/mall/goods/20190410/65/eac9cbf0-6150-4956-b360-eb242d6cfbc5.png', NULL, '2019-04-10 01:53:48', 1, '333.png', 1, 59082, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (274, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/7ea71c5b-875b-46e1-9fd0-a5f19eeac433.png', 'upload/mall/goods/20190410/65/7ea71c5b-875b-46e1-9fd0-a5f19eeac433.png', NULL, '2019-04-10 01:53:48', 1, '444.png', 1, 525678, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (275, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/38e45966-626f-4dac-981e-c1af3e19883b.png', 'upload/mall/goods/20190410/65/38e45966-626f-4dac-981e-c1af3e19883b.png', NULL, '2019-04-10 01:54:33', 1, '444.png', 1, 525678, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (276, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/1e053f6c-4ea7-4079-9923-261526a45928.png', 'upload/mall/goods/20190410/65/1e053f6c-4ea7-4079-9923-261526a45928.png', NULL, '2019-04-10 01:58:50', 1, '333.png', 1, 59082, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (277, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/62c34399-3088-4eca-b5e5-4efa473ee2bb.png', 'upload/mall/goods/20190410/65/62c34399-3088-4eca-b5e5-4efa473ee2bb.png', NULL, '2019-04-10 01:59:34', 1, '444.png', 1, 525678, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (278, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/ec3c330d-8006-49e6-b4f8-47dace85da73.png', 'upload/mall/goods/20190410/65/ec3c330d-8006-49e6-b4f8-47dace85da73.png', NULL, '2019-04-10 02:01:23', 1, '333.png', 1, 59082, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (279, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/315c96b2-8000-4f65-bb51-f33b3104056f.png', 'upload/mall/goods/20190410/65/315c96b2-8000-4f65-bb51-f33b3104056f.png', NULL, '2019-04-10 02:04:15', 1, '333.png', 1, 59082, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (280, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/0952f5fc-d8fe-47fb-9035-54b8240795cc.jpg', 'upload/mall/goods/20190410/65/0952f5fc-d8fe-47fb-9035-54b8240795cc.jpg', NULL, '2019-04-10 02:04:22', 1, 'gh_3dc91b668ea9_344 (3).jpg', 1, 65832, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (281, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/23c9f240-451d-4740-8aa0-c50b39180d11.jpg', 'upload/mall/goods/20190410/65/23c9f240-451d-4740-8aa0-c50b39180d11.jpg', NULL, '2019-04-10 02:04:22', 1, 'gh_3dc91b668ea9_344 (4).jpg', 1, 80636, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (282, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/a4327fd2-a99b-40b8-8b6e-c1d37f06deab.jpg', 'upload/mall/goods/20190410/65/a4327fd2-a99b-40b8-8b6e-c1d37f06deab.jpg', NULL, '2019-04-10 02:04:22', 1, 'gh_3dc91b668ea9_344.jpg', 1, 65843, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (283, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/ce9b1a32-a319-4023-903c-d7cd458b7830.jpg', 'upload/mall/goods/20190410/65/ce9b1a32-a319-4023-903c-d7cd458b7830.jpg', NULL, '2019-04-10 02:04:22', 1, 'gh_3dc91b668ea9_430.jpg', 1, 109386, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (284, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/dea3af9b-b267-4b31-9b1c-8adba41d5b9c.png', 'upload/mall/goods/20190410/65/dea3af9b-b267-4b31-9b1c-8adba41d5b9c.png', NULL, '2019-04-10 02:04:43', 1, '333.png', 1, 59082, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (285, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/c6867802-de3e-42b0-b9af-aa3194ade3fa.png', 'upload/mall/goods/20190410/65/c6867802-de3e-42b0-b9af-aa3194ade3fa.png', NULL, '2019-04-10 02:04:43', 1, '444.png', 1, 525678, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (286, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/96fa963d-3f0c-4111-8ba2-2640863a3df5.png', 'upload/mall/goods/20190410/65/96fa963d-3f0c-4111-8ba2-2640863a3df5.png', NULL, '2019-04-10 02:04:43', 1, '556.png', 1, 1747, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (287, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/eee3510c-b37d-4db5-a8a8-e7fb3f6e012e.jpg', 'upload/mall/goods/20190410/65/eee3510c-b37d-4db5-a8a8-e7fb3f6e012e.jpg', NULL, '2019-04-10 02:04:58', 1, '75fe84761c6a3576c668279f544c10173c10d1.jpg', 1, 15930, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (288, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/208188a2-65bf-4ba9-8bb4-7ca3f9fae0e5.png', 'upload/mall/goods/20190410/65/208188a2-65bf-4ba9-8bb4-7ca3f9fae0e5.png', NULL, '2019-04-10 02:04:58', 1, '222.png', 1, 59711, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (289, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/aaaea16d-449f-47b5-a3a0-3c2d1cda120c.png', 'upload/mall/goods/20190410/65/aaaea16d-449f-47b5-a3a0-3c2d1cda120c.png', NULL, '2019-04-10 02:04:58', 1, '232.png', 1, 565872, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (290, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/9b0fac3e-3c08-426a-891d-732895b94472.jpg', 'upload/mall/goods/20190410/65/9b0fac3e-3c08-426a-891d-732895b94472.jpg', NULL, '2019-04-10 02:05:08', 1, '75fe84761c6a3576c668279f544c10173c10d1.jpg', 1, 15930, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (291, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/390cd70e-efe2-4325-9bdd-82dbf95706d1.png', 'upload/mall/goods/20190410/65/390cd70e-efe2-4325-9bdd-82dbf95706d1.png', NULL, '2019-04-10 02:05:08', 1, '222.png', 1, 59711, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (292, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/4016aa39-17b5-47de-b7a2-82baeaed1c72.png', 'upload/mall/goods/20190410/65/4016aa39-17b5-47de-b7a2-82baeaed1c72.png', NULL, '2019-04-10 02:05:08', 1, '232.png', 1, 565872, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (293, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/c55da026-884b-47f9-b137-5c24f059d25f.png', 'upload/mall/goods/20190410/65/c55da026-884b-47f9-b137-5c24f059d25f.png', NULL, '2019-04-10 11:10:59', 1, '333.png', 1, 59082, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (294, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/3da5c083-2220-4e06-83dd-215804878e28.png', 'upload/mall/goods/20190410/65/3da5c083-2220-4e06-83dd-215804878e28.png', NULL, '2019-04-10 11:13:06', 1, '222.png', 1, 59711, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (295, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/17973394-fd42-45ea-ba00-2c466311c885.png', 'upload/mall/goods/20190410/65/17973394-fd42-45ea-ba00-2c466311c885.png', NULL, '2019-04-10 11:13:06', 1, '232.png', 1, 565872, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (296, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/09585e00-3ba3-4b0d-935b-2bb79d936a70.png', 'upload/mall/goods/20190410/65/09585e00-3ba3-4b0d-935b-2bb79d936a70.png', NULL, '2019-04-10 11:13:06', 1, '333.png', 1, 59082, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (297, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/d7840d77-ec0e-45f1-b735-636b49548aac.png', 'upload/mall/goods/20190410/65/d7840d77-ec0e-45f1-b735-636b49548aac.png', NULL, '2019-04-10 11:26:32', 1, '444.png', 1, 525678, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (298, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/5ca63f04-e1ef-4503-af5d-44954f8dc16d.png', 'upload/mall/goods/20190410/65/5ca63f04-e1ef-4503-af5d-44954f8dc16d.png', NULL, '2019-04-10 11:29:45', 1, '556.png', 1, 1747, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (299, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/08d36b78-5ae4-44ac-b104-0d2d69736133.PNG', 'upload/mall/goods/20190410/65/08d36b78-5ae4-44ac-b104-0d2d69736133.PNG', NULL, '2019-04-10 11:29:55', 1, '557fbe1dc12f4e2086e6cb6879b6a593.PNG', 1, 5425, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (300, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/21f01fbf-9209-4e74-b449-08b7d6719702.png', 'upload/mall/goods/20190410/65/21f01fbf-9209-4e74-b449-08b7d6719702.png', NULL, '2019-04-10 11:30:04', 1, '666.png', 1, 17509, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (301, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/72363792-2b66-4d22-82ae-1632fefba19d.png', 'upload/mall/goods/20190410/65/72363792-2b66-4d22-82ae-1632fefba19d.png', NULL, '2019-04-10 11:31:01', 1, '333.png', 1, 59082, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (302, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/368c746c-8331-409a-ac0e-c880fec04ff0.jpg', 'upload/mall/goods/20190410/65/368c746c-8331-409a-ac0e-c880fec04ff0.jpg', NULL, '2019-04-10 11:31:25', 1, '_wKgBDVu_I5OAU41qAABZ0Jdjv8w043.jpg', 1, 22992, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (303, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/aeba6da1-bdae-473f-af2c-8950dd3844d7.png', 'upload/mall/goods/20190410/65/aeba6da1-bdae-473f-af2c-8950dd3844d7.png', NULL, '2019-04-10 11:41:27', 1, '444.png', 1, 525678, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (304, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/5d89772b-66fd-4bf7-9e79-047fcfa26d17.png', 'upload/mall/goods/20190410/65/5d89772b-66fd-4bf7-9e79-047fcfa26d17.png', NULL, '2019-04-10 11:51:12', 1, '444.png', 1, 525678, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (305, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/b0c84ac3-51c4-4821-8203-a1cd1ad5181a.png', 'upload/mall/goods/20190410/65/b0c84ac3-51c4-4821-8203-a1cd1ad5181a.png', NULL, '2019-04-10 11:53:30', 1, '556.png', 1, 1747, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (306, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/1fccd21e-be12-4d4b-b3b9-01f0622cb102.', 'upload/mall/goods/20190410/65/1fccd21e-be12-4d4b-b3b9-01f0622cb102.', NULL, '2019-04-10 12:13:53', 1, 'blob', 1, 7148, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (307, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/5ee6b77c-193d-48be-b254-5a04b9b37050.', 'upload/mall/goods/20190410/65/5ee6b77c-193d-48be-b254-5a04b9b37050.', NULL, '2019-04-10 12:14:16', 1, 'blob', 1, 7148, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (308, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/9c37634c-e647-493f-8d5f-5cf5f71be4f9.', 'upload/mall/goods/20190410/65/9c37634c-e647-493f-8d5f-5cf5f71be4f9.', NULL, '2019-04-10 12:14:25', 1, 'blob', 1, 122173, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (309, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/8f1593d2-ceaa-44af-9600-8c109136bd72.', 'upload/mall/goods/20190410/65/8f1593d2-ceaa-44af-9600-8c109136bd72.', NULL, '2019-04-10 12:14:48', 1, 'blob', 1, 122173, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (310, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/bcb80301-2d2c-4659-b3ba-9610388ecce2.', 'upload/mall/goods/20190410/65/bcb80301-2d2c-4659-b3ba-9610388ecce2.', NULL, '2019-04-10 12:14:59', 1, 'blob', 1, 122173, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (311, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/bda32d24-b7a4-4cf8-a9a8-891906028541.png', 'upload/mall/goods/20190410/65/bda32d24-b7a4-4cf8-a9a8-891906028541.png', NULL, '2019-04-10 12:17:35', 1, '444.png', 1, 525678, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (312, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/eb2d06dd-cba2-4aea-a12c-cf824dece750.png', 'upload/mall/goods/20190410/65/eb2d06dd-cba2-4aea-a12c-cf824dece750.png', NULL, '2019-04-10 12:18:00', 1, '444.png', 1, 525678, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (313, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/e9cda933-2cbb-4171-9aac-ece28842caf8.png', 'upload/mall/goods/20190410/65/e9cda933-2cbb-4171-9aac-ece28842caf8.png', NULL, '2019-04-10 12:18:19', 1, '556.png', 1, 1747, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (314, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/479508f9-2499-4f60-9a69-0a12e7d91c73.png', 'upload/mall/goods/20190410/65/479508f9-2499-4f60-9a69-0a12e7d91c73.png', NULL, '2019-04-10 12:20:20', 1, '333.png', 1, 59082, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (315, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/4aa09925-88a4-4ffb-831a-9e8a7593d1f4.png', 'upload/mall/goods/20190410/65/4aa09925-88a4-4ffb-831a-9e8a7593d1f4.png', NULL, '2019-04-10 12:21:04', 1, '333.png', 1, 59082, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (316, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/f6a355ce-05d9-4d98-b714-f10234d47dea.png', 'upload/mall/goods/20190410/65/f6a355ce-05d9-4d98-b714-f10234d47dea.png', NULL, '2019-04-10 12:21:04', 1, '444.png', 1, 525678, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (317, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/d3000f2e-ac83-47fb-9857-ef3330910774.png', 'upload/mall/goods/20190410/65/d3000f2e-ac83-47fb-9857-ef3330910774.png', NULL, '2019-04-10 12:26:27', 1, '444.png', 1, 525678, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (318, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/3d59042c-fecc-488d-bd6c-ee5da0f19aeb.', 'upload/mall/goods/20190410/65/3d59042c-fecc-488d-bd6c-ee5da0f19aeb.', NULL, '2019-04-10 12:28:54', 1, 'blob', 1, 13981, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (319, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/3b40cfca-483e-4931-bf43-36d3803a9c2e.', 'upload/mall/goods/20190410/65/3b40cfca-483e-4931-bf43-36d3803a9c2e.', NULL, '2019-04-10 12:29:46', 1, 'blob', 1, 12596, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (320, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/86c6fa23-4604-4de5-8afc-1678671f6655.', 'upload/mall/goods/20190410/65/86c6fa23-4604-4de5-8afc-1678671f6655.', NULL, '2019-04-10 12:32:35', 1, 'blob', 1, 13631, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (321, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/3d2e1b33-1e52-426e-9ac3-da9c9fa91136.png', 'upload/mall/goods/20190410/65/3d2e1b33-1e52-426e-9ac3-da9c9fa91136.png', NULL, '2019-04-10 12:43:09', 1, '556.png', 1, 1747, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (322, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/72fd10c9-50ca-45ad-8a58-d15e33eec0eb.png', 'upload/mall/goods/20190410/65/72fd10c9-50ca-45ad-8a58-d15e33eec0eb.png', NULL, '2019-04-10 12:46:49', 1, '444.png', 1, 525678, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (323, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/943a6b5d-9cb2-482e-8638-d592564a4ca7.png', 'upload/mall/goods/20190410/65/943a6b5d-9cb2-482e-8638-d592564a4ca7.png', NULL, '2019-04-10 12:47:31', 1, 'blob', 1, 12599, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (324, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/c784ae20-0b75-41e4-a90a-7a5ca0fa8911.png', 'upload/mall/goods/20190410/65/c784ae20-0b75-41e4-a90a-7a5ca0fa8911.png', NULL, '2019-04-10 12:47:51', 1, 'blob', 1, 32819, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (325, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/86560c3a-4d76-4b16-9927-308a3e828ef3.png', 'upload/mall/goods/20190410/65/86560c3a-4d76-4b16-9927-308a3e828ef3.png', NULL, '2019-04-10 13:00:39', 1, 'blob', 1, 843480, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (326, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/83144434-6842-4be8-8fa1-74e18f723c80.png', 'upload/mall/goods/20190410/65/83144434-6842-4be8-8fa1-74e18f723c80.png', NULL, '2019-04-10 13:01:13', 1, 'blob', 1, 843480, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (327, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/068d2acb-4831-45c3-bce5-05c16aa6e184.png', 'upload/mall/goods/20190410/65/068d2acb-4831-45c3-bce5-05c16aa6e184.png', NULL, '2019-04-10 13:02:18', 1, 'blob', 1, 10199, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (328, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/658df461-0c69-4d7c-831b-7faf95a95f06.png', 'upload/mall/goods/20190410/65/658df461-0c69-4d7c-831b-7faf95a95f06.png', NULL, '2019-04-10 13:04:38', 1, 'blob', 1, 133436, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (329, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/2c4c8a2d-aba9-4c1c-a7f5-d49a9eb54572.png', 'upload/mall/goods/20190410/65/2c4c8a2d-aba9-4c1c-a7f5-d49a9eb54572.png', NULL, '2019-04-10 13:06:06', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (330, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/afcea48b-9109-4ecf-b2eb-30dc53166913.png', 'upload/mall/goods/20190410/65/afcea48b-9109-4ecf-b2eb-30dc53166913.png', NULL, '2019-04-10 13:06:06', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (331, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/54bb52f4-130d-4dde-bfe2-027c9908064c.png', 'upload/mall/goods/20190410/65/54bb52f4-130d-4dde-bfe2-027c9908064c.png', NULL, '2019-04-10 13:06:08', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (332, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/851af086-a0aa-482f-93fe-b88756b60559.png', 'upload/mall/goods/20190410/65/851af086-a0aa-482f-93fe-b88756b60559.png', NULL, '2019-04-10 13:06:08', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (333, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/92778252-930e-4628-bf07-384b8e677619.png', 'upload/mall/goods/20190410/65/92778252-930e-4628-bf07-384b8e677619.png', NULL, '2019-04-10 13:06:08', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (334, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/014a46d4-0407-42de-bdac-d695dcb3e482.png', 'upload/mall/goods/20190410/65/014a46d4-0407-42de-bdac-d695dcb3e482.png', NULL, '2019-04-10 13:06:08', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (335, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/e3887084-52a3-4326-9ae7-5baa6cec9879.png', 'upload/mall/goods/20190410/65/e3887084-52a3-4326-9ae7-5baa6cec9879.png', NULL, '2019-04-10 13:06:08', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (336, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/f967b947-482f-4ef2-bb26-42ef855f9376.png', 'upload/mall/goods/20190410/65/f967b947-482f-4ef2-bb26-42ef855f9376.png', NULL, '2019-04-10 13:06:08', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (337, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/0054eb81-2922-403c-b73a-68f3685740b6.png', 'upload/mall/goods/20190410/65/0054eb81-2922-403c-b73a-68f3685740b6.png', NULL, '2019-04-10 13:06:08', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (338, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/2116c244-637b-46b3-9955-78fdddb51f3a.png', 'upload/mall/goods/20190410/65/2116c244-637b-46b3-9955-78fdddb51f3a.png', NULL, '2019-04-10 13:06:09', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (339, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/5989217c-dc46-42d2-932b-7851f6f00226.png', 'upload/mall/goods/20190410/65/5989217c-dc46-42d2-932b-7851f6f00226.png', NULL, '2019-04-10 13:06:09', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (340, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/b1831405-1a5f-4102-a0a0-ce0146c6a159.png', 'upload/mall/goods/20190410/65/b1831405-1a5f-4102-a0a0-ce0146c6a159.png', NULL, '2019-04-10 13:06:09', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (341, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/bcab4380-0ced-4eb7-ae5c-dec7cbe36c46.png', 'upload/mall/goods/20190410/65/bcab4380-0ced-4eb7-ae5c-dec7cbe36c46.png', NULL, '2019-04-10 13:06:09', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (342, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/deae0e76-109b-4041-9c20-f64b527439b5.png', 'upload/mall/goods/20190410/65/deae0e76-109b-4041-9c20-f64b527439b5.png', NULL, '2019-04-10 13:06:09', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (343, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/2be9fd99-08f0-448a-b166-2ddc021324d2.png', 'upload/mall/goods/20190410/65/2be9fd99-08f0-448a-b166-2ddc021324d2.png', NULL, '2019-04-10 13:06:09', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (344, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/2d4d382f-1f2b-4685-8715-744992c4b809.png', 'upload/mall/goods/20190410/65/2d4d382f-1f2b-4685-8715-744992c4b809.png', NULL, '2019-04-10 13:06:09', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (345, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/3f484aa5-f37f-4fd4-9519-b1ee627979b5.png', 'upload/mall/goods/20190410/65/3f484aa5-f37f-4fd4-9519-b1ee627979b5.png', NULL, '2019-04-10 13:06:10', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (346, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/0b6929a0-3bfe-46b0-b779-51d8748f413d.png', 'upload/mall/goods/20190410/65/0b6929a0-3bfe-46b0-b779-51d8748f413d.png', NULL, '2019-04-10 13:06:10', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (347, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/fa9eea00-cf34-490a-829d-973973c4b8b0.png', 'upload/mall/goods/20190410/65/fa9eea00-cf34-490a-829d-973973c4b8b0.png', NULL, '2019-04-10 13:06:10', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (348, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/caebb6f3-a2c3-4920-90c1-6a368980df20.png', 'upload/mall/goods/20190410/65/caebb6f3-a2c3-4920-90c1-6a368980df20.png', NULL, '2019-04-10 13:06:10', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (349, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/94e9ff54-a350-4e98-90a4-0abb04428a9e.png', 'upload/mall/goods/20190410/65/94e9ff54-a350-4e98-90a4-0abb04428a9e.png', NULL, '2019-04-10 13:06:10', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (350, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/150f49b4-6f92-44d2-afa3-a9946d5bf3de.png', 'upload/mall/goods/20190410/65/150f49b4-6f92-44d2-afa3-a9946d5bf3de.png', NULL, '2019-04-10 13:06:11', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (351, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/310e21ee-73d6-45c0-bb41-faf1594ed2d9.png', 'upload/mall/goods/20190410/65/310e21ee-73d6-45c0-bb41-faf1594ed2d9.png', NULL, '2019-04-10 13:06:11', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (352, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/66d389b6-2a30-4c47-b3b3-575d5fb349fb.png', 'upload/mall/goods/20190410/65/66d389b6-2a30-4c47-b3b3-575d5fb349fb.png', NULL, '2019-04-10 13:06:11', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (353, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/e7c2bb70-ba92-49bd-bb2d-ed2ba0475d24.png', 'upload/mall/goods/20190410/65/e7c2bb70-ba92-49bd-bb2d-ed2ba0475d24.png', NULL, '2019-04-10 13:06:11', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (354, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/34ebe3fd-3725-4a22-9861-b2187c2f4205.png', 'upload/mall/goods/20190410/65/34ebe3fd-3725-4a22-9861-b2187c2f4205.png', NULL, '2019-04-10 13:06:11', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (355, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/65a12f75-e770-4b0c-a840-2bba7a894b9d.png', 'upload/mall/goods/20190410/65/65a12f75-e770-4b0c-a840-2bba7a894b9d.png', NULL, '2019-04-10 13:06:11', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (356, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/0c9d03e1-4104-46b0-8a41-17d248d95d03.png', 'upload/mall/goods/20190410/65/0c9d03e1-4104-46b0-8a41-17d248d95d03.png', NULL, '2019-04-10 13:06:11', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (357, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/e6b5becc-f1bc-4d23-99ce-d69698fbe7f7.png', 'upload/mall/goods/20190410/65/e6b5becc-f1bc-4d23-99ce-d69698fbe7f7.png', NULL, '2019-04-10 13:06:11', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (358, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/47f1c5a0-76d8-4854-b856-d74e4df836ed.png', 'upload/mall/goods/20190410/65/47f1c5a0-76d8-4854-b856-d74e4df836ed.png', NULL, '2019-04-10 13:06:11', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (359, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/1b2cdb7a-96c2-43ef-97e1-1cf8e146c0c7.png', 'upload/mall/goods/20190410/65/1b2cdb7a-96c2-43ef-97e1-1cf8e146c0c7.png', NULL, '2019-04-10 13:06:11', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (360, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/79d20456-afdd-49f1-b844-347f870f9c53.png', 'upload/mall/goods/20190410/65/79d20456-afdd-49f1-b844-347f870f9c53.png', NULL, '2019-04-10 13:06:11', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (361, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/b54bfd8a-3807-4e49-80bb-3db836027b45.png', 'upload/mall/goods/20190410/65/b54bfd8a-3807-4e49-80bb-3db836027b45.png', NULL, '2019-04-10 13:06:12', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (362, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/f45e66ed-2ba7-45f5-b408-e711ad40e479.png', 'upload/mall/goods/20190410/65/f45e66ed-2ba7-45f5-b408-e711ad40e479.png', NULL, '2019-04-10 13:06:12', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (363, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/11521933-3b49-4a22-b850-9a0a750f15aa.png', 'upload/mall/goods/20190410/65/11521933-3b49-4a22-b850-9a0a750f15aa.png', NULL, '2019-04-10 13:06:12', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (364, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/50c67e29-9d7f-4f31-9129-a15b8d1d85ab.png', 'upload/mall/goods/20190410/65/50c67e29-9d7f-4f31-9129-a15b8d1d85ab.png', NULL, '2019-04-10 13:06:13', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (365, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/4368b229-6741-4b98-906d-41ce9083e4c7.png', 'upload/mall/goods/20190410/65/4368b229-6741-4b98-906d-41ce9083e4c7.png', NULL, '2019-04-10 13:06:13', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (366, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/f4bf70eb-adc8-473b-8cff-e06a74b6fc7a.png', 'upload/mall/goods/20190410/65/f4bf70eb-adc8-473b-8cff-e06a74b6fc7a.png', NULL, '2019-04-10 13:06:13', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (367, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/9aaa5a44-0d51-4103-a669-ae116ab208d0.png', 'upload/mall/goods/20190410/65/9aaa5a44-0d51-4103-a669-ae116ab208d0.png', NULL, '2019-04-10 13:06:13', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (368, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/89d214a1-1a7b-45ac-9199-2c2ea7fd1be1.png', 'upload/mall/goods/20190410/65/89d214a1-1a7b-45ac-9199-2c2ea7fd1be1.png', NULL, '2019-04-10 13:06:14', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (369, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/1ca9c4a4-3604-42d7-a560-af88a3812a0a.png', 'upload/mall/goods/20190410/65/1ca9c4a4-3604-42d7-a560-af88a3812a0a.png', NULL, '2019-04-10 13:06:14', 1, 'blob', 1, 23542, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (370, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/f1932346-f917-49f3-a97c-3ec4f3f3c956.png', 'upload/mall/goods/20190410/65/f1932346-f917-49f3-a97c-3ec4f3f3c956.png', NULL, '2019-04-10 13:06:20', 1, 'blob', 1, 171808, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (371, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/9703bb88-db79-46eb-9b84-35a42eab3689.png', 'upload/mall/goods/20190410/65/9703bb88-db79-46eb-9b84-35a42eab3689.png', NULL, '2019-04-10 13:06:20', 1, 'blob', 1, 171808, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (372, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/50f42034-6ee8-4bda-8b3a-01a083f73170.png', 'upload/mall/goods/20190410/65/50f42034-6ee8-4bda-8b3a-01a083f73170.png', NULL, '2019-04-10 13:06:21', 1, 'blob', 1, 171808, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (373, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/6948cbad-57b4-4463-af9f-ba8440638aa3.png', 'upload/mall/goods/20190410/65/6948cbad-57b4-4463-af9f-ba8440638aa3.png', NULL, '2019-04-10 13:06:21', 1, 'blob', 1, 171808, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (374, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/5cdc0f2d-de43-4b8e-b5bb-b60a5cfb18e6.png', 'upload/mall/goods/20190410/65/5cdc0f2d-de43-4b8e-b5bb-b60a5cfb18e6.png', NULL, '2019-04-10 13:06:21', 1, 'blob', 1, 171808, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (375, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/580fb0eb-5094-4e0b-a208-8652fd606c88.png', 'upload/mall/goods/20190410/65/580fb0eb-5094-4e0b-a208-8652fd606c88.png', NULL, '2019-04-10 13:06:22', 1, 'blob', 1, 171808, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (376, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/4ba71519-ee85-4f5a-af07-b928e93af013.png', 'upload/mall/goods/20190410/65/4ba71519-ee85-4f5a-af07-b928e93af013.png', NULL, '2019-04-10 13:06:23', 1, 'blob', 1, 171808, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (377, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/a9d5a5bc-d74b-41df-b8f2-62786e1eaca4.png', 'upload/mall/goods/20190410/65/a9d5a5bc-d74b-41df-b8f2-62786e1eaca4.png', NULL, '2019-04-10 13:06:24', 1, 'blob', 1, 171808, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (378, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/d69fb64e-4d45-4dee-a2ce-043d5df9341d.png', 'upload/mall/goods/20190410/65/d69fb64e-4d45-4dee-a2ce-043d5df9341d.png', NULL, '2019-04-10 13:06:24', 1, 'blob', 1, 171808, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (379, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/6ae74381-9566-463f-b606-0a5d55eedb15.png', 'upload/mall/goods/20190410/65/6ae74381-9566-463f-b606-0a5d55eedb15.png', NULL, '2019-04-10 13:06:25', 1, 'blob', 1, 171808, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (380, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/87b44048-5bc2-4b92-acd4-d81cda762a2b.png', 'upload/mall/goods/20190410/65/87b44048-5bc2-4b92-acd4-d81cda762a2b.png', NULL, '2019-04-10 13:06:25', 1, 'blob', 1, 171808, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (381, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/405c371b-e8fe-4414-9008-6f945c7587b2.png', 'upload/mall/goods/20190410/65/405c371b-e8fe-4414-9008-6f945c7587b2.png', NULL, '2019-04-10 13:06:26', 1, 'blob', 1, 171808, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (382, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/5e43e36e-bab8-45b2-969f-2a99bb057994.png', 'upload/mall/goods/20190410/65/5e43e36e-bab8-45b2-969f-2a99bb057994.png', NULL, '2019-04-10 13:07:11', 1, 'blob', 1, 19175, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (383, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/6f162695-09b8-4bc8-9ebc-2db540a4fea6.png', 'upload/mall/goods/20190410/65/6f162695-09b8-4bc8-9ebc-2db540a4fea6.png', NULL, '2019-04-10 13:07:11', 1, 'blob', 1, 19175, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (384, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/da0e9588-9ebb-47fa-8c3a-1754b5d033ed.png', 'upload/mall/goods/20190410/65/da0e9588-9ebb-47fa-8c3a-1754b5d033ed.png', NULL, '2019-04-10 13:07:11', 1, 'blob', 1, 19175, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (385, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/718baed0-e162-4ff2-a344-605fa92377bf.png', 'upload/mall/goods/20190410/65/718baed0-e162-4ff2-a344-605fa92377bf.png', NULL, '2019-04-10 13:07:11', 1, 'blob', 1, 19175, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (386, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/4273e834-d9bd-4821-bdd0-8b87bd339ecf.png', 'upload/mall/goods/20190410/65/4273e834-d9bd-4821-bdd0-8b87bd339ecf.png', NULL, '2019-04-10 13:07:11', 1, 'blob', 1, 19175, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (387, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/2df5dc3a-256e-4316-9c0a-09cd313efbf3.png', 'upload/mall/goods/20190410/65/2df5dc3a-256e-4316-9c0a-09cd313efbf3.png', NULL, '2019-04-10 13:07:12', 1, 'blob', 1, 19175, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (388, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/c0ff25a7-53c8-4b3b-8983-caebddb06e7e.png', 'upload/mall/goods/20190410/65/c0ff25a7-53c8-4b3b-8983-caebddb06e7e.png', NULL, '2019-04-10 13:07:12', 1, 'blob', 1, 19175, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (389, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/d9d0f790-0a06-4c03-b26e-6eb814396921.png', 'upload/mall/goods/20190410/65/d9d0f790-0a06-4c03-b26e-6eb814396921.png', NULL, '2019-04-10 13:07:12', 1, 'blob', 1, 19175, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (390, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/9ada4497-ad48-4c76-b459-d8755e347476.png', 'upload/mall/goods/20190410/65/9ada4497-ad48-4c76-b459-d8755e347476.png', NULL, '2019-04-10 13:07:12', 1, 'blob', 1, 19175, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (391, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/e365cf23-333a-435f-8e3d-adc46291c28e.png', 'upload/mall/goods/20190410/65/e365cf23-333a-435f-8e3d-adc46291c28e.png', NULL, '2019-04-10 13:07:12', 1, 'blob', 1, 19175, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (392, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/77030058-ee98-418f-b72d-c307cc8844b6.png', 'upload/mall/goods/20190410/65/77030058-ee98-418f-b72d-c307cc8844b6.png', NULL, '2019-04-10 13:07:12', 1, 'blob', 1, 19175, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (393, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/a77edd8b-f6df-49b6-9d96-6fe1c3707076.png', 'upload/mall/goods/20190410/65/a77edd8b-f6df-49b6-9d96-6fe1c3707076.png', NULL, '2019-04-10 13:07:13', 1, 'blob', 1, 19175, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (394, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/7bea5f9d-b0e6-46aa-9864-2f2563f794ff.png', 'upload/mall/goods/20190410/65/7bea5f9d-b0e6-46aa-9864-2f2563f794ff.png', NULL, '2019-04-10 13:07:13', 1, 'blob', 1, 19175, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (395, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/6a88125f-c64f-4f4b-aa51-6fc376ce2317.png', 'upload/mall/goods/20190410/65/6a88125f-c64f-4f4b-aa51-6fc376ce2317.png', NULL, '2019-04-10 13:07:14', 1, 'blob', 1, 19175, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (396, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/3f7007d9-a87a-4902-864a-6cbf63361dc2.png', 'upload/mall/goods/20190410/65/3f7007d9-a87a-4902-864a-6cbf63361dc2.png', NULL, '2019-04-10 13:07:15', 1, 'blob', 1, 19175, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (397, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/6fd91186-3357-4636-8fea-d708411584a8.png', 'upload/mall/goods/20190410/65/6fd91186-3357-4636-8fea-d708411584a8.png', NULL, '2019-04-10 13:07:15', 1, 'blob', 1, 19175, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (398, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/f551a74b-e8ee-4a44-a2fd-e7fe7eb00a99.png', 'upload/mall/goods/20190410/65/f551a74b-e8ee-4a44-a2fd-e7fe7eb00a99.png', NULL, '2019-04-10 13:07:15', 1, 'blob', 1, 19175, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (399, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/57298e9a-e887-4737-98ce-e7e7f578ac8e.png', 'upload/mall/goods/20190410/65/57298e9a-e887-4737-98ce-e7e7f578ac8e.png', NULL, '2019-04-10 13:07:15', 1, 'blob', 1, 19175, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (400, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/39758809-2e70-4d85-98f2-deea5032f5eb.png', 'upload/mall/goods/20190410/65/39758809-2e70-4d85-98f2-deea5032f5eb.png', NULL, '2019-04-10 13:07:15', 1, 'blob', 1, 19175, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (401, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/1a5f7d0b-0f85-454e-8ae2-8ccca0851126.png', 'upload/mall/goods/20190410/65/1a5f7d0b-0f85-454e-8ae2-8ccca0851126.png', NULL, '2019-04-10 13:07:15', 1, 'blob', 1, 19175, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (402, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/57738165-f2b1-4c35-bbf3-8e9e08eb4597.png', 'upload/mall/goods/20190410/65/57738165-f2b1-4c35-bbf3-8e9e08eb4597.png', NULL, '2019-04-10 13:07:15', 1, 'blob', 1, 19175, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (403, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/543e3aa3-dd4d-4c54-a788-cae35258c2ff.png', 'upload/mall/goods/20190410/65/543e3aa3-dd4d-4c54-a788-cae35258c2ff.png', NULL, '2019-04-10 13:07:15', 1, 'blob', 1, 19175, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (404, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/939bc7a9-84b3-41de-8744-c1dff2919108.png', 'upload/mall/goods/20190410/65/939bc7a9-84b3-41de-8744-c1dff2919108.png', NULL, '2019-04-10 13:07:15', 1, 'blob', 1, 19175, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (405, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/95a1fc08-b94d-4615-8579-5be087e0f280.png', 'upload/mall/goods/20190410/65/95a1fc08-b94d-4615-8579-5be087e0f280.png', NULL, '2019-04-10 13:07:15', 1, 'blob', 1, 19175, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (406, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/35fa4e10-db64-4851-89e0-1c2ffa056867.png', 'upload/mall/goods/20190410/65/35fa4e10-db64-4851-89e0-1c2ffa056867.png', NULL, '2019-04-10 13:07:15', 1, 'blob', 1, 19175, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (407, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/4f0be544-1180-4f4f-8cae-f9dc05c777d2.png', 'upload/mall/goods/20190410/65/4f0be544-1180-4f4f-8cae-f9dc05c777d2.png', NULL, '2019-04-10 13:07:15', 1, 'blob', 1, 19175, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (408, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/5fcaea30-a137-4096-b9d0-762d6ce6a3e4.png', 'upload/mall/goods/20190410/65/5fcaea30-a137-4096-b9d0-762d6ce6a3e4.png', NULL, '2019-04-10 13:13:06', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (409, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/95a69785-8a5f-45ab-92fb-c9e8ced35122.png', 'upload/mall/goods/20190410/65/95a69785-8a5f-45ab-92fb-c9e8ced35122.png', NULL, '2019-04-10 13:13:07', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (410, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/cdb3192a-f7b5-497b-b4be-eda4abd696d2.png', 'upload/mall/goods/20190410/65/cdb3192a-f7b5-497b-b4be-eda4abd696d2.png', NULL, '2019-04-10 13:13:08', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (411, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/a05eb352-7a9a-4def-9a27-181b5fa00bd2.png', 'upload/mall/goods/20190410/65/a05eb352-7a9a-4def-9a27-181b5fa00bd2.png', NULL, '2019-04-10 13:13:08', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (412, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/f8d4db7b-c230-41ae-bf74-222c41a5237b.png', 'upload/mall/goods/20190410/65/f8d4db7b-c230-41ae-bf74-222c41a5237b.png', NULL, '2019-04-10 13:13:09', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (413, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/5d55e892-e8ac-4e9b-ab58-48c2f144d4f1.png', 'upload/mall/goods/20190410/65/5d55e892-e8ac-4e9b-ab58-48c2f144d4f1.png', NULL, '2019-04-10 13:13:09', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (414, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/82e64b6f-44b0-4693-8d59-74de7858bd1c.png', 'upload/mall/goods/20190410/65/82e64b6f-44b0-4693-8d59-74de7858bd1c.png', NULL, '2019-04-10 13:13:10', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (415, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/34d5e94e-499d-4269-a372-49b5770dc50b.png', 'upload/mall/goods/20190410/65/34d5e94e-499d-4269-a372-49b5770dc50b.png', NULL, '2019-04-10 13:13:10', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (416, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/310a169f-528a-4f99-88d5-f2dc0398544f.png', 'upload/mall/goods/20190410/65/310a169f-528a-4f99-88d5-f2dc0398544f.png', NULL, '2019-04-10 13:13:10', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (417, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/0a13bf49-0529-44d3-8322-c7060b564fbd.png', 'upload/mall/goods/20190410/65/0a13bf49-0529-44d3-8322-c7060b564fbd.png', NULL, '2019-04-10 13:13:10', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (418, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/f9191715-a66d-4af5-b150-49edfd6e555a.png', 'upload/mall/goods/20190410/65/f9191715-a66d-4af5-b150-49edfd6e555a.png', NULL, '2019-04-10 13:13:10', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (419, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/38bb40ce-fc4d-4ae1-92d5-888e0a269de8.png', 'upload/mall/goods/20190410/65/38bb40ce-fc4d-4ae1-92d5-888e0a269de8.png', NULL, '2019-04-10 13:13:10', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (420, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/a784d6aa-ad5c-4398-a8d0-b4dded653965.png', 'upload/mall/goods/20190410/65/a784d6aa-ad5c-4398-a8d0-b4dded653965.png', NULL, '2019-04-10 13:13:10', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (421, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/35aa195a-5651-4a2d-85ee-64f5cc94efe3.png', 'upload/mall/goods/20190410/65/35aa195a-5651-4a2d-85ee-64f5cc94efe3.png', NULL, '2019-04-10 13:13:11', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (422, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/c33a45e5-0d4a-462f-ac0d-bb840a171a42.png', 'upload/mall/goods/20190410/65/c33a45e5-0d4a-462f-ac0d-bb840a171a42.png', NULL, '2019-04-10 13:13:11', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (423, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/3e4a25f6-cdfe-4aa4-bd0d-8d237cbdda89.png', 'upload/mall/goods/20190410/65/3e4a25f6-cdfe-4aa4-bd0d-8d237cbdda89.png', NULL, '2019-04-10 13:13:11', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (424, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/563317d3-5c08-4840-bfdb-10b68b922e8e.png', 'upload/mall/goods/20190410/65/563317d3-5c08-4840-bfdb-10b68b922e8e.png', NULL, '2019-04-10 13:13:11', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (425, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/f4bfa5f3-cfb5-486d-b43d-7aebe1175027.png', 'upload/mall/goods/20190410/65/f4bfa5f3-cfb5-486d-b43d-7aebe1175027.png', NULL, '2019-04-10 13:13:11', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (426, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/420a2a7a-f1b0-4a4b-bb15-d81bfafe31be.png', 'upload/mall/goods/20190410/65/420a2a7a-f1b0-4a4b-bb15-d81bfafe31be.png', NULL, '2019-04-10 13:13:11', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (427, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/342d3248-4e85-42f3-9914-8345ba64c165.png', 'upload/mall/goods/20190410/65/342d3248-4e85-42f3-9914-8345ba64c165.png', NULL, '2019-04-10 13:13:11', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (428, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/ab107e9e-1b2d-4986-b594-885cd555471a.png', 'upload/mall/goods/20190410/65/ab107e9e-1b2d-4986-b594-885cd555471a.png', NULL, '2019-04-10 13:13:11', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (429, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/8b25204a-4423-440e-a07e-cb4de7f3f89c.png', 'upload/mall/goods/20190410/65/8b25204a-4423-440e-a07e-cb4de7f3f89c.png', NULL, '2019-04-10 13:13:11', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (430, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/39eb0189-b26a-45e8-99b3-3db18fdb091a.png', 'upload/mall/goods/20190410/65/39eb0189-b26a-45e8-99b3-3db18fdb091a.png', NULL, '2019-04-10 13:13:11', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (431, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/38ccfea9-1619-404b-99e2-f43763a9624a.png', 'upload/mall/goods/20190410/65/38ccfea9-1619-404b-99e2-f43763a9624a.png', NULL, '2019-04-10 13:13:11', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (432, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/d6a0aed9-a353-4f8d-a8aa-d5bab51f3dd2.png', 'upload/mall/goods/20190410/65/d6a0aed9-a353-4f8d-a8aa-d5bab51f3dd2.png', NULL, '2019-04-10 13:13:11', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (433, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/e97d2c39-4bb2-4c29-8413-22443ff228d2.png', 'upload/mall/goods/20190410/65/e97d2c39-4bb2-4c29-8413-22443ff228d2.png', NULL, '2019-04-10 13:13:11', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (434, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/f46a41e2-b95f-403a-88b1-e9e8423351b8.png', 'upload/mall/goods/20190410/65/f46a41e2-b95f-403a-88b1-e9e8423351b8.png', NULL, '2019-04-10 13:13:11', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (435, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/faf3e363-e618-4eaa-87f7-a682e3535da4.png', 'upload/mall/goods/20190410/65/faf3e363-e618-4eaa-87f7-a682e3535da4.png', NULL, '2019-04-10 13:13:11', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (436, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/34ead17c-68d0-49a5-8659-fba7048a4341.png', 'upload/mall/goods/20190410/65/34ead17c-68d0-49a5-8659-fba7048a4341.png', NULL, '2019-04-10 13:13:11', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (437, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/cfcfc536-972f-4865-92d9-c6adc88ff03e.png', 'upload/mall/goods/20190410/65/cfcfc536-972f-4865-92d9-c6adc88ff03e.png', NULL, '2019-04-10 13:13:12', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (438, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/e6834cd6-3071-4c50-bde7-269957845125.png', 'upload/mall/goods/20190410/65/e6834cd6-3071-4c50-bde7-269957845125.png', NULL, '2019-04-10 13:13:12', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (439, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/f2ecc2f3-54f6-4856-9309-8950895654fe.png', 'upload/mall/goods/20190410/65/f2ecc2f3-54f6-4856-9309-8950895654fe.png', NULL, '2019-04-10 13:13:12', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (440, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/036c753e-c3dd-425d-9244-5fb84dcd76d5.png', 'upload/mall/goods/20190410/65/036c753e-c3dd-425d-9244-5fb84dcd76d5.png', NULL, '2019-04-10 13:13:12', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (441, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/7fd3fe35-be35-41bf-a939-f04ae1955183.png', 'upload/mall/goods/20190410/65/7fd3fe35-be35-41bf-a939-f04ae1955183.png', NULL, '2019-04-10 13:13:12', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (442, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/bd349de9-86b8-4172-bfc1-0e4a7451cf6a.png', 'upload/mall/goods/20190410/65/bd349de9-86b8-4172-bfc1-0e4a7451cf6a.png', NULL, '2019-04-10 13:13:12', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (443, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/7a98e277-7e20-485e-a64d-3f871a984f25.png', 'upload/mall/goods/20190410/65/7a98e277-7e20-485e-a64d-3f871a984f25.png', NULL, '2019-04-10 13:13:12', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (444, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/7604c6d7-a7ca-4a3d-9965-c61f4376dad6.png', 'upload/mall/goods/20190410/65/7604c6d7-a7ca-4a3d-9965-c61f4376dad6.png', NULL, '2019-04-10 13:13:12', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (445, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/9c486e8c-c614-4c03-a867-0c8810c23301.png', 'upload/mall/goods/20190410/65/9c486e8c-c614-4c03-a867-0c8810c23301.png', NULL, '2019-04-10 13:13:12', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (446, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/f3ca250c-519d-4062-8502-0093b0335ed7.png', 'upload/mall/goods/20190410/65/f3ca250c-519d-4062-8502-0093b0335ed7.png', NULL, '2019-04-10 13:13:12', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (447, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/5709758b-3e3c-460f-ba28-598ce6f526fa.png', 'upload/mall/goods/20190410/65/5709758b-3e3c-460f-ba28-598ce6f526fa.png', NULL, '2019-04-10 13:13:12', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (448, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/7b6afcab-1f7a-4eae-9909-7c2ebde83784.png', 'upload/mall/goods/20190410/65/7b6afcab-1f7a-4eae-9909-7c2ebde83784.png', NULL, '2019-04-10 13:13:12', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (449, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/0d876f16-521c-4d0a-8189-49b2f1d9b055.png', 'upload/mall/goods/20190410/65/0d876f16-521c-4d0a-8189-49b2f1d9b055.png', NULL, '2019-04-10 13:13:12', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (450, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/77603514-02f6-4b48-9937-ecd2b2bba4e1.png', 'upload/mall/goods/20190410/65/77603514-02f6-4b48-9937-ecd2b2bba4e1.png', NULL, '2019-04-10 13:13:12', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (451, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/2bf9d91a-a763-4029-a490-e8791be15558.png', 'upload/mall/goods/20190410/65/2bf9d91a-a763-4029-a490-e8791be15558.png', NULL, '2019-04-10 13:13:12', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (452, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/c1b45a21-e193-4d1a-a52d-409376fca369.png', 'upload/mall/goods/20190410/65/c1b45a21-e193-4d1a-a52d-409376fca369.png', NULL, '2019-04-10 13:13:12', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (453, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/bc1e9e45-c004-43d4-9ae7-4b88b25b9814.png', 'upload/mall/goods/20190410/65/bc1e9e45-c004-43d4-9ae7-4b88b25b9814.png', NULL, '2019-04-10 13:13:12', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (454, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/63ea7246-7cca-4e1e-88c6-ce604f965a0a.png', 'upload/mall/goods/20190410/65/63ea7246-7cca-4e1e-88c6-ce604f965a0a.png', NULL, '2019-04-10 13:13:12', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (455, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/ea3174f1-2737-4ba4-bf52-27fc4c8af3fb.png', 'upload/mall/goods/20190410/65/ea3174f1-2737-4ba4-bf52-27fc4c8af3fb.png', NULL, '2019-04-10 13:13:12', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (456, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/5a78cebf-1846-424d-9f70-1b4ad7d26682.png', 'upload/mall/goods/20190410/65/5a78cebf-1846-424d-9f70-1b4ad7d26682.png', NULL, '2019-04-10 13:13:13', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (457, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/0cf83e5a-6d41-41ab-b241-d41b7008a54b.png', 'upload/mall/goods/20190410/65/0cf83e5a-6d41-41ab-b241-d41b7008a54b.png', NULL, '2019-04-10 13:13:13', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (458, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/368b12f0-f8e8-4741-9e12-c4fb1b69b921.png', 'upload/mall/goods/20190410/65/368b12f0-f8e8-4741-9e12-c4fb1b69b921.png', NULL, '2019-04-10 13:13:13', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (459, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/a8df779d-6247-4fca-a37b-8fe44c005c57.png', 'upload/mall/goods/20190410/65/a8df779d-6247-4fca-a37b-8fe44c005c57.png', NULL, '2019-04-10 13:13:13', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (460, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/4c60c887-55cf-4a5b-9065-8235904e124c.png', 'upload/mall/goods/20190410/65/4c60c887-55cf-4a5b-9065-8235904e124c.png', NULL, '2019-04-10 13:13:13', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (461, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/ea14f0d9-ce25-4f54-ab67-4dca2da613a8.png', 'upload/mall/goods/20190410/65/ea14f0d9-ce25-4f54-ab67-4dca2da613a8.png', NULL, '2019-04-10 13:13:13', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (462, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/2eab9e56-023b-4742-a9fe-5ab0661a6840.png', 'upload/mall/goods/20190410/65/2eab9e56-023b-4742-a9fe-5ab0661a6840.png', NULL, '2019-04-10 13:13:13', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (463, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/26f0c180-fe83-490f-82fb-892a895fbff3.png', 'upload/mall/goods/20190410/65/26f0c180-fe83-490f-82fb-892a895fbff3.png', NULL, '2019-04-10 13:13:13', 1, 'blob', 1, 7719, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (464, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/89e07db2-5fa1-4c1a-bad3-e76580cf3352.png', 'upload/mall/goods/20190410/65/89e07db2-5fa1-4c1a-bad3-e76580cf3352.png', NULL, '2019-04-10 13:15:01', 1, 'blob', 1, 3076, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (465, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/1e5a511d-a1f8-40af-ac84-267e063555b7.png', 'upload/mall/goods/20190410/65/1e5a511d-a1f8-40af-ac84-267e063555b7.png', NULL, '2019-04-10 13:15:01', 1, 'blob', 1, 3076, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (466, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/0c7585e0-0709-41d0-8103-1f4e36f148f5.png', 'upload/mall/goods/20190410/65/0c7585e0-0709-41d0-8103-1f4e36f148f5.png', NULL, '2019-04-10 13:15:02', 1, 'blob', 1, 3076, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (467, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/b8b99352-1440-4d8d-aeba-e0952baf3551.png', 'upload/mall/goods/20190410/65/b8b99352-1440-4d8d-aeba-e0952baf3551.png', NULL, '2019-04-10 13:15:02', 1, 'blob', 1, 3076, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (468, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/0edfa1f7-6844-4911-8304-db282b81c162.png', 'upload/mall/goods/20190410/65/0edfa1f7-6844-4911-8304-db282b81c162.png', NULL, '2019-04-10 13:15:02', 1, 'blob', 1, 3076, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (469, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/41916581-793f-4166-9560-fbd212ce679a.png', 'upload/mall/goods/20190410/65/41916581-793f-4166-9560-fbd212ce679a.png', NULL, '2019-04-10 13:15:02', 1, 'blob', 1, 3076, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (470, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/f6c1c030-358e-4022-b83d-356f867defb0.png', 'upload/mall/goods/20190410/65/f6c1c030-358e-4022-b83d-356f867defb0.png', NULL, '2019-04-10 13:15:02', 1, 'blob', 1, 3076, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (471, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/8fc0ac13-9aa0-4a8a-aabb-b8fc40414812.png', 'upload/mall/goods/20190410/65/8fc0ac13-9aa0-4a8a-aabb-b8fc40414812.png', NULL, '2019-04-10 13:15:03', 1, 'blob', 1, 3076, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (472, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/e3ec99c0-9f51-4c62-8a58-71c6ca21a4f6.png', 'upload/mall/goods/20190410/65/e3ec99c0-9f51-4c62-8a58-71c6ca21a4f6.png', NULL, '2019-04-10 13:15:03', 1, 'blob', 1, 3076, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (473, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/18760cb0-c1ed-4ca5-88a9-96e79c5b6f9d.png', 'upload/mall/goods/20190410/65/18760cb0-c1ed-4ca5-88a9-96e79c5b6f9d.png', NULL, '2019-04-10 13:15:03', 1, 'blob', 1, 3076, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (474, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/ae405a70-7c78-4fb9-bf12-7d27c8a156bd.png', 'upload/mall/goods/20190410/65/ae405a70-7c78-4fb9-bf12-7d27c8a156bd.png', NULL, '2019-04-10 13:15:03', 1, 'blob', 1, 3076, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (475, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/1a7d67c0-4785-4420-a5d3-06ec09268cc8.png', 'upload/mall/goods/20190410/65/1a7d67c0-4785-4420-a5d3-06ec09268cc8.png', NULL, '2019-04-10 13:15:03', 1, 'blob', 1, 3076, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (476, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/f59bc82a-9de4-4579-915e-3e6faf8ff598.png', 'upload/mall/goods/20190410/65/f59bc82a-9de4-4579-915e-3e6faf8ff598.png', NULL, '2019-04-10 13:15:03', 1, 'blob', 1, 3076, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (477, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/4db92170-738a-493a-9d55-80004cbe1f57.png', 'upload/mall/goods/20190410/65/4db92170-738a-493a-9d55-80004cbe1f57.png', NULL, '2019-04-10 13:15:03', 1, 'blob', 1, 3076, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (478, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/f724e273-f2bf-41b1-9fb9-ae9d83cb92e8.png', 'upload/mall/goods/20190410/65/f724e273-f2bf-41b1-9fb9-ae9d83cb92e8.png', NULL, '2019-04-10 13:15:03', 1, 'blob', 1, 3076, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (479, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/bbf9e7df-a7d1-4fe6-a19d-3b4479213775.png', 'upload/mall/goods/20190410/65/bbf9e7df-a7d1-4fe6-a19d-3b4479213775.png', NULL, '2019-04-10 13:15:03', 1, 'blob', 1, 3076, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (480, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/8abe25c4-0524-4e98-86f5-eefe717c223e.png', 'upload/mall/goods/20190410/65/8abe25c4-0524-4e98-86f5-eefe717c223e.png', NULL, '2019-04-10 13:15:03', 1, 'blob', 1, 3076, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (481, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/beb93350-6cfe-4f77-918b-77d67f12c07f.png', 'upload/mall/goods/20190410/65/beb93350-6cfe-4f77-918b-77d67f12c07f.png', NULL, '2019-04-10 13:15:03', 1, 'blob', 1, 3076, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (482, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/2d24cd84-1887-4fbf-949e-ccb55025ea24.png', 'upload/mall/goods/20190410/65/2d24cd84-1887-4fbf-949e-ccb55025ea24.png', NULL, '2019-04-10 13:15:03', 1, 'blob', 1, 3076, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (483, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/147d8386-77cf-4b81-ba1c-0743dd06520e.png', 'upload/mall/goods/20190410/65/147d8386-77cf-4b81-ba1c-0743dd06520e.png', NULL, '2019-04-10 13:15:04', 1, 'blob', 1, 3076, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (484, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/361307c4-b8d9-4b4e-bd37-219a988048da.png', 'upload/mall/goods/20190410/65/361307c4-b8d9-4b4e-bd37-219a988048da.png', NULL, '2019-04-10 13:15:04', 1, 'blob', 1, 3076, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (485, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/b4e8d89c-506b-44ad-95d0-b19500fcad30.png', 'upload/mall/goods/20190410/65/b4e8d89c-506b-44ad-95d0-b19500fcad30.png', NULL, '2019-04-10 13:15:04', 1, 'blob', 1, 3076, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (486, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/b75730bc-3180-4b3e-93a2-57ae180f266f.png', 'upload/mall/goods/20190410/65/b75730bc-3180-4b3e-93a2-57ae180f266f.png', NULL, '2019-04-10 13:15:04', 1, 'blob', 1, 3076, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (487, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/499c5b15-b568-49e3-afaa-0519acd9ef3f.png', 'upload/mall/goods/20190410/65/499c5b15-b568-49e3-afaa-0519acd9ef3f.png', NULL, '2019-04-10 13:15:04', 1, 'blob', 1, 3076, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (488, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/ae96d484-549c-454a-8b92-edc0095369b7.png', 'upload/mall/goods/20190410/65/ae96d484-549c-454a-8b92-edc0095369b7.png', NULL, '2019-04-10 13:16:25', 1, '222.png', 1, 59711, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (489, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/bafe0eae-1de4-496e-aeb4-fb2eeab2cc07.png', 'upload/mall/goods/20190410/65/bafe0eae-1de4-496e-aeb4-fb2eeab2cc07.png', NULL, '2019-04-10 13:16:25', 1, '232.png', 1, 565872, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (490, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/f03725ad-50f9-4891-b452-9c80a4e5b0f9.png', 'upload/mall/goods/20190410/65/f03725ad-50f9-4891-b452-9c80a4e5b0f9.png', NULL, '2019-04-10 13:16:25', 1, '333.png', 1, 59082, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (491, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/0e2b1a5b-35bb-4bb4-8791-e05b2681e316.png', 'upload/mall/goods/20190410/65/0e2b1a5b-35bb-4bb4-8791-e05b2681e316.png', NULL, '2019-04-10 13:16:25', 1, '444.png', 1, 525678, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (492, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/3670f70a-1bc0-4fa9-af1b-c6cc8fc23ff5.png', 'upload/mall/goods/20190410/65/3670f70a-1bc0-4fa9-af1b-c6cc8fc23ff5.png', NULL, '2019-04-10 13:16:25', 1, '556.png', 1, 1747, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (493, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/7bfada92-f7d5-4959-b46b-c9351496e93b.png', 'upload/mall/goods/20190410/65/7bfada92-f7d5-4959-b46b-c9351496e93b.png', NULL, '2019-04-10 13:16:36', 1, 'blob', 1, 33333, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (494, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/a0cba16b-f9b3-46dd-812f-64ae79ea371f.png', 'upload/mall/goods/20190410/65/a0cba16b-f9b3-46dd-812f-64ae79ea371f.png', NULL, '2019-04-10 13:17:20', 1, 'blob', 1, 43759, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (495, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/ac6e44ed-ccce-4784-8816-aac73d10280c.png', 'upload/mall/goods/20190410/65/ac6e44ed-ccce-4784-8816-aac73d10280c.png', NULL, '2019-04-10 13:18:08', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (496, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/c377b663-5a8c-4f14-ab0d-2ea0abe9287c.png', 'upload/mall/goods/20190410/65/c377b663-5a8c-4f14-ab0d-2ea0abe9287c.png', NULL, '2019-04-10 13:18:09', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (497, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/bf3cf689-8921-4016-ae89-1603327af785.png', 'upload/mall/goods/20190410/65/bf3cf689-8921-4016-ae89-1603327af785.png', NULL, '2019-04-10 13:18:12', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (498, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/393ee6f5-9b18-4f87-a2ae-e200bdc43f2f.png', 'upload/mall/goods/20190410/65/393ee6f5-9b18-4f87-a2ae-e200bdc43f2f.png', NULL, '2019-04-10 13:18:13', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (499, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/1c8c356f-aff8-41e9-94dc-cd723b5e008e.png', 'upload/mall/goods/20190410/65/1c8c356f-aff8-41e9-94dc-cd723b5e008e.png', NULL, '2019-04-10 13:18:13', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (500, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/dae0f65e-69de-4ce4-9015-dc21f64ee5f4.png', 'upload/mall/goods/20190410/65/dae0f65e-69de-4ce4-9015-dc21f64ee5f4.png', NULL, '2019-04-10 13:18:13', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (501, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/7f7ade18-ef99-429f-a76f-ffe8cdbb7437.png', 'upload/mall/goods/20190410/65/7f7ade18-ef99-429f-a76f-ffe8cdbb7437.png', NULL, '2019-04-10 13:18:13', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (502, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/ebc95ae4-3b13-4d64-89d3-b387dd969311.png', 'upload/mall/goods/20190410/65/ebc95ae4-3b13-4d64-89d3-b387dd969311.png', NULL, '2019-04-10 13:18:13', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (503, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/57969f2b-65d8-49d8-9bb9-0b47561ce025.png', 'upload/mall/goods/20190410/65/57969f2b-65d8-49d8-9bb9-0b47561ce025.png', NULL, '2019-04-10 13:18:14', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (504, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/75bfa71f-54d0-4f09-819f-833edcb70bd6.png', 'upload/mall/goods/20190410/65/75bfa71f-54d0-4f09-819f-833edcb70bd6.png', NULL, '2019-04-10 13:18:14', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (505, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/b0c37f44-4376-4a16-838b-2ec9bc6fcdfb.png', 'upload/mall/goods/20190410/65/b0c37f44-4376-4a16-838b-2ec9bc6fcdfb.png', NULL, '2019-04-10 13:18:14', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (506, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/f4856ae8-a9ab-4c09-bd36-42fc6ac32a12.png', 'upload/mall/goods/20190410/65/f4856ae8-a9ab-4c09-bd36-42fc6ac32a12.png', NULL, '2019-04-10 13:18:14', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (507, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/187f8e2e-87bd-4b39-9efd-8c6fe502b340.png', 'upload/mall/goods/20190410/65/187f8e2e-87bd-4b39-9efd-8c6fe502b340.png', NULL, '2019-04-10 13:18:16', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (508, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/4a7a5e72-b521-446f-9b4a-bb12662a71ae.png', 'upload/mall/goods/20190410/65/4a7a5e72-b521-446f-9b4a-bb12662a71ae.png', NULL, '2019-04-10 13:18:16', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (509, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/342e4121-2199-4a3d-b1ba-1daa2e488af7.png', 'upload/mall/goods/20190410/65/342e4121-2199-4a3d-b1ba-1daa2e488af7.png', NULL, '2019-04-10 13:18:16', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (510, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/8a6b8ed2-b7dd-4f17-a7e2-d4c57c1155f9.png', 'upload/mall/goods/20190410/65/8a6b8ed2-b7dd-4f17-a7e2-d4c57c1155f9.png', NULL, '2019-04-10 13:18:16', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (511, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/bb57a668-b274-48ee-8897-121861f78584.png', 'upload/mall/goods/20190410/65/bb57a668-b274-48ee-8897-121861f78584.png', NULL, '2019-04-10 13:18:16', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (512, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/063eb676-e429-4da2-a921-55e13b7dd152.png', 'upload/mall/goods/20190410/65/063eb676-e429-4da2-a921-55e13b7dd152.png', NULL, '2019-04-10 13:18:16', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (513, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/9771e6e4-3238-4c4a-a46f-60241a9381e3.png', 'upload/mall/goods/20190410/65/9771e6e4-3238-4c4a-a46f-60241a9381e3.png', NULL, '2019-04-10 13:18:16', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (514, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/077154c8-6ed8-47e4-860e-7b74dc600374.png', 'upload/mall/goods/20190410/65/077154c8-6ed8-47e4-860e-7b74dc600374.png', NULL, '2019-04-10 13:18:16', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (515, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/6ac96d36-3aaa-476e-993e-0f5547fad2d7.png', 'upload/mall/goods/20190410/65/6ac96d36-3aaa-476e-993e-0f5547fad2d7.png', NULL, '2019-04-10 13:18:17', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (516, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/227837b3-d111-49e8-a22c-9b7a71d1511e.png', 'upload/mall/goods/20190410/65/227837b3-d111-49e8-a22c-9b7a71d1511e.png', NULL, '2019-04-10 13:18:17', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (517, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/01a7737d-d2ab-406d-ab8a-ba354bc40de6.png', 'upload/mall/goods/20190410/65/01a7737d-d2ab-406d-ab8a-ba354bc40de6.png', NULL, '2019-04-10 13:18:17', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (518, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/4fe38f2c-bdae-4d0a-9b10-c173da05059f.png', 'upload/mall/goods/20190410/65/4fe38f2c-bdae-4d0a-9b10-c173da05059f.png', NULL, '2019-04-10 13:18:17', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (519, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/c8c87e97-c281-43c7-92eb-d873aa6a4286.png', 'upload/mall/goods/20190410/65/c8c87e97-c281-43c7-92eb-d873aa6a4286.png', NULL, '2019-04-10 13:18:17', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (520, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/e12d2545-a09b-4779-af71-7926806fbdea.png', 'upload/mall/goods/20190410/65/e12d2545-a09b-4779-af71-7926806fbdea.png', NULL, '2019-04-10 13:18:17', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (521, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/300cd0ba-f016-4b05-9bb7-cc1916c7d711.png', 'upload/mall/goods/20190410/65/300cd0ba-f016-4b05-9bb7-cc1916c7d711.png', NULL, '2019-04-10 13:18:17', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (522, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/79fb202c-e0a8-4ca4-81d7-94ac6f011bf7.png', 'upload/mall/goods/20190410/65/79fb202c-e0a8-4ca4-81d7-94ac6f011bf7.png', NULL, '2019-04-10 13:18:17', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (523, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/ae6e6de7-88b0-4e57-84ab-55f2bd31c798.png', 'upload/mall/goods/20190410/65/ae6e6de7-88b0-4e57-84ab-55f2bd31c798.png', NULL, '2019-04-10 13:18:17', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (524, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/be898f41-ff72-4ede-a1d3-71ed4b7a579d.png', 'upload/mall/goods/20190410/65/be898f41-ff72-4ede-a1d3-71ed4b7a579d.png', NULL, '2019-04-10 13:18:17', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (525, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/5ee7f8fa-1740-4000-8b64-04928e28ccd3.png', 'upload/mall/goods/20190410/65/5ee7f8fa-1740-4000-8b64-04928e28ccd3.png', NULL, '2019-04-10 13:18:17', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (526, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/d0eda022-cd14-4be9-8a6c-284aa15fae6e.png', 'upload/mall/goods/20190410/65/d0eda022-cd14-4be9-8a6c-284aa15fae6e.png', NULL, '2019-04-10 13:18:17', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (527, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/7a12a6ec-d53b-464e-bf62-033430204b5c.png', 'upload/mall/goods/20190410/65/7a12a6ec-d53b-464e-bf62-033430204b5c.png', NULL, '2019-04-10 13:18:17', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (528, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/079a996d-af9b-4791-86f6-f938ec9ee992.png', 'upload/mall/goods/20190410/65/079a996d-af9b-4791-86f6-f938ec9ee992.png', NULL, '2019-04-10 13:18:17', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (529, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/1907b9b3-ecc8-48ba-a5f8-743bd20e878c.png', 'upload/mall/goods/20190410/65/1907b9b3-ecc8-48ba-a5f8-743bd20e878c.png', NULL, '2019-04-10 13:18:17', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (530, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/0e792e58-17f0-4501-a45c-5fd4f1a85a5a.png', 'upload/mall/goods/20190410/65/0e792e58-17f0-4501-a45c-5fd4f1a85a5a.png', NULL, '2019-04-10 13:18:17', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (531, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/191ce113-e725-4ca3-b531-1ad8b27b4d4d.png', 'upload/mall/goods/20190410/65/191ce113-e725-4ca3-b531-1ad8b27b4d4d.png', NULL, '2019-04-10 13:18:17', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (532, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/5765b6ff-76e3-4db2-b9c8-99c49e7be833.png', 'upload/mall/goods/20190410/65/5765b6ff-76e3-4db2-b9c8-99c49e7be833.png', NULL, '2019-04-10 13:18:21', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (533, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/5b957d54-2551-4c33-ba33-ba3d9d24bf52.png', 'upload/mall/goods/20190410/65/5b957d54-2551-4c33-ba33-ba3d9d24bf52.png', NULL, '2019-04-10 13:18:21', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (534, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/72ebe653-e53e-40f3-943f-53d9188b8bf5.png', 'upload/mall/goods/20190410/65/72ebe653-e53e-40f3-943f-53d9188b8bf5.png', NULL, '2019-04-10 13:18:22', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (535, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/1e867933-11d8-4d76-b201-9a6bbc5b4a8b.png', 'upload/mall/goods/20190410/65/1e867933-11d8-4d76-b201-9a6bbc5b4a8b.png', NULL, '2019-04-10 13:18:22', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (536, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/570a7bc7-c2e5-4758-a1f2-a2de00eb1fd2.png', 'upload/mall/goods/20190410/65/570a7bc7-c2e5-4758-a1f2-a2de00eb1fd2.png', NULL, '2019-04-10 13:18:23', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (537, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/7871c42f-9f4d-4977-94e6-bca054bbdcf5.png', 'upload/mall/goods/20190410/65/7871c42f-9f4d-4977-94e6-bca054bbdcf5.png', NULL, '2019-04-10 13:18:23', 1, 'blob', 1, 39217, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (538, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/dfc15513-85d8-4edc-b363-77ba7a06f165.png', 'upload/mall/goods/20190410/65/dfc15513-85d8-4edc-b363-77ba7a06f165.png', NULL, '2019-04-10 13:20:41', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (539, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/ab2c503b-0d86-49a4-9d0e-f92a7024e40a.png', 'upload/mall/goods/20190410/65/ab2c503b-0d86-49a4-9d0e-f92a7024e40a.png', NULL, '2019-04-10 13:20:41', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (540, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/9cd130f4-ef7c-444a-a302-276bde12a850.png', 'upload/mall/goods/20190410/65/9cd130f4-ef7c-444a-a302-276bde12a850.png', NULL, '2019-04-10 13:20:42', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (541, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/b7453795-d7ba-475f-9c91-3db692e04cd8.png', 'upload/mall/goods/20190410/65/b7453795-d7ba-475f-9c91-3db692e04cd8.png', NULL, '2019-04-10 13:20:42', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (542, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/c52ac6f6-5226-44b6-91ce-76e046b663ac.png', 'upload/mall/goods/20190410/65/c52ac6f6-5226-44b6-91ce-76e046b663ac.png', NULL, '2019-04-10 13:20:43', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (543, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/23ae3b3e-3a4c-4e94-a495-855333ad2420.png', 'upload/mall/goods/20190410/65/23ae3b3e-3a4c-4e94-a495-855333ad2420.png', NULL, '2019-04-10 13:20:43', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (544, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/23f8b663-63ac-48b8-b8e8-5ad64b7d2d9a.png', 'upload/mall/goods/20190410/65/23f8b663-63ac-48b8-b8e8-5ad64b7d2d9a.png', NULL, '2019-04-10 13:20:43', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (545, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/6dde0e99-0f4d-43a5-b92a-952e3df31a35.png', 'upload/mall/goods/20190410/65/6dde0e99-0f4d-43a5-b92a-952e3df31a35.png', NULL, '2019-04-10 13:20:43', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (546, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/689651a0-4eb7-465a-b80e-cfc34638a76e.png', 'upload/mall/goods/20190410/65/689651a0-4eb7-465a-b80e-cfc34638a76e.png', NULL, '2019-04-10 13:20:43', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (547, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/70e5450b-993d-4ef8-8b21-197f357d0690.png', 'upload/mall/goods/20190410/65/70e5450b-993d-4ef8-8b21-197f357d0690.png', NULL, '2019-04-10 13:20:44', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (548, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/44a51ae6-3dfe-4555-b3a5-5af27dd1c8d5.png', 'upload/mall/goods/20190410/65/44a51ae6-3dfe-4555-b3a5-5af27dd1c8d5.png', NULL, '2019-04-10 13:20:44', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (549, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/c24f0af8-1c0c-413d-a063-9f96978a8280.png', 'upload/mall/goods/20190410/65/c24f0af8-1c0c-413d-a063-9f96978a8280.png', NULL, '2019-04-10 13:20:44', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (550, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/200d0e83-9786-42cd-9d56-17f61aac171b.png', 'upload/mall/goods/20190410/65/200d0e83-9786-42cd-9d56-17f61aac171b.png', NULL, '2019-04-10 13:20:45', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (551, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/d069c4c4-0cc6-4578-8173-4eca5b650114.png', 'upload/mall/goods/20190410/65/d069c4c4-0cc6-4578-8173-4eca5b650114.png', NULL, '2019-04-10 13:20:46', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (552, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/d52a45c4-2c34-481a-805b-d69d7b44e2ba.png', 'upload/mall/goods/20190410/65/d52a45c4-2c34-481a-805b-d69d7b44e2ba.png', NULL, '2019-04-10 13:20:50', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (553, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/81622af0-62b7-4a4d-884b-1ac5ac4201e0.png', 'upload/mall/goods/20190410/65/81622af0-62b7-4a4d-884b-1ac5ac4201e0.png', NULL, '2019-04-10 13:20:50', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (554, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/523fdf10-809f-4fac-a33b-da80e6430f54.png', 'upload/mall/goods/20190410/65/523fdf10-809f-4fac-a33b-da80e6430f54.png', NULL, '2019-04-10 13:20:52', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (555, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/cfb41266-a76c-4ce3-a683-b48350056e55.png', 'upload/mall/goods/20190410/65/cfb41266-a76c-4ce3-a683-b48350056e55.png', NULL, '2019-04-10 13:20:53', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (556, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/a70aadc0-cc71-4a6a-9f28-6728ad9f6fbc.png', 'upload/mall/goods/20190410/65/a70aadc0-cc71-4a6a-9f28-6728ad9f6fbc.png', NULL, '2019-04-10 13:20:53', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (557, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/c59209b4-4118-4232-ac6d-8cbbacd76e42.png', 'upload/mall/goods/20190410/65/c59209b4-4118-4232-ac6d-8cbbacd76e42.png', NULL, '2019-04-10 13:20:53', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (558, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/53a187e0-d9ad-4649-9300-5e625aa24333.png', 'upload/mall/goods/20190410/65/53a187e0-d9ad-4649-9300-5e625aa24333.png', NULL, '2019-04-10 13:20:53', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (559, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/9ad14d0c-15a4-4804-80e8-59cb72892d35.png', 'upload/mall/goods/20190410/65/9ad14d0c-15a4-4804-80e8-59cb72892d35.png', NULL, '2019-04-10 13:20:53', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (560, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/e9b95044-cce1-4038-ac34-c4df2a1d1abe.png', 'upload/mall/goods/20190410/65/e9b95044-cce1-4038-ac34-c4df2a1d1abe.png', NULL, '2019-04-10 13:20:53', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (561, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/c0b69fa6-91a8-4181-93c7-6c62e2b18b21.png', 'upload/mall/goods/20190410/65/c0b69fa6-91a8-4181-93c7-6c62e2b18b21.png', NULL, '2019-04-10 13:20:54', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (562, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/57bc41cd-5234-4204-822b-f02239435372.png', 'upload/mall/goods/20190410/65/57bc41cd-5234-4204-822b-f02239435372.png', NULL, '2019-04-10 13:20:54', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (563, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/14259432-eedb-4383-b6cb-144323e65dc1.png', 'upload/mall/goods/20190410/65/14259432-eedb-4383-b6cb-144323e65dc1.png', NULL, '2019-04-10 13:20:54', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (564, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/e52e2e8b-64cb-47ef-95c8-e897a42a2f47.png', 'upload/mall/goods/20190410/65/e52e2e8b-64cb-47ef-95c8-e897a42a2f47.png', NULL, '2019-04-10 13:20:54', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (565, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/ce86d80e-39fc-4fce-ad4d-e85540a58559.png', 'upload/mall/goods/20190410/65/ce86d80e-39fc-4fce-ad4d-e85540a58559.png', NULL, '2019-04-10 13:20:54', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (566, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/68fa1e5c-c401-4e3a-8340-8bcc035b367b.png', 'upload/mall/goods/20190410/65/68fa1e5c-c401-4e3a-8340-8bcc035b367b.png', NULL, '2019-04-10 13:20:54', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (567, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/5c0003c2-f94e-43e4-b83c-c4e6f980f6a1.png', 'upload/mall/goods/20190410/65/5c0003c2-f94e-43e4-b83c-c4e6f980f6a1.png', NULL, '2019-04-10 13:20:55', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (568, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/54f57ad2-9495-494f-bc0d-fe573868dd62.png', 'upload/mall/goods/20190410/65/54f57ad2-9495-494f-bc0d-fe573868dd62.png', NULL, '2019-04-10 13:20:55', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (569, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/3aca354d-a202-4d81-a1ad-3a174deb4dbf.png', 'upload/mall/goods/20190410/65/3aca354d-a202-4d81-a1ad-3a174deb4dbf.png', NULL, '2019-04-10 13:20:55', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (570, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/40ee7611-51e8-482a-b41f-8d4e4367432d.png', 'upload/mall/goods/20190410/65/40ee7611-51e8-482a-b41f-8d4e4367432d.png', NULL, '2019-04-10 13:20:55', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (571, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/a1c70112-a518-4c80-9666-86d48f956331.png', 'upload/mall/goods/20190410/65/a1c70112-a518-4c80-9666-86d48f956331.png', NULL, '2019-04-10 13:20:55', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (572, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/d80fe34e-4c9d-4bca-a60b-7d561f775c49.png', 'upload/mall/goods/20190410/65/d80fe34e-4c9d-4bca-a60b-7d561f775c49.png', NULL, '2019-04-10 13:20:55', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (573, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/6953f7fb-12c4-4090-aee1-3d45a141016c.png', 'upload/mall/goods/20190410/65/6953f7fb-12c4-4090-aee1-3d45a141016c.png', NULL, '2019-04-10 13:20:55', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (574, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/f1a51e20-f8df-4648-8ecb-942efd3f3556.png', 'upload/mall/goods/20190410/65/f1a51e20-f8df-4648-8ecb-942efd3f3556.png', NULL, '2019-04-10 13:20:56', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (575, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/9eb8a8b6-5aed-429c-8b02-3123c54264bd.png', 'upload/mall/goods/20190410/65/9eb8a8b6-5aed-429c-8b02-3123c54264bd.png', NULL, '2019-04-10 13:20:56', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (576, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/1cf6d7bd-9e1e-4d8d-9750-89a0f951e373.png', 'upload/mall/goods/20190410/65/1cf6d7bd-9e1e-4d8d-9750-89a0f951e373.png', NULL, '2019-04-10 13:20:57', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (577, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/bf1dde76-de7e-448d-8618-8302fb3cfecc.png', 'upload/mall/goods/20190410/65/bf1dde76-de7e-448d-8618-8302fb3cfecc.png', NULL, '2019-04-10 13:21:00', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (578, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/63747085-3320-4384-b2ca-253610402db4.png', 'upload/mall/goods/20190410/65/63747085-3320-4384-b2ca-253610402db4.png', NULL, '2019-04-10 13:21:00', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (579, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/e5269900-be6a-4528-96e7-044ba58a5b14.png', 'upload/mall/goods/20190410/65/e5269900-be6a-4528-96e7-044ba58a5b14.png', NULL, '2019-04-10 13:21:01', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (580, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/b7dfbecc-1be8-4e3d-af8d-25c28ca515b7.png', 'upload/mall/goods/20190410/65/b7dfbecc-1be8-4e3d-af8d-25c28ca515b7.png', NULL, '2019-04-10 13:21:03', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (581, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/3579b0fd-0c2a-414f-bec8-7a3d887ec304.png', 'upload/mall/goods/20190410/65/3579b0fd-0c2a-414f-bec8-7a3d887ec304.png', NULL, '2019-04-10 13:21:05', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (582, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/397deed3-7f49-455d-b6f0-a32f093574ef.png', 'upload/mall/goods/20190410/65/397deed3-7f49-455d-b6f0-a32f093574ef.png', NULL, '2019-04-10 13:21:05', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (583, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/a9f5904e-b3a8-4dc5-b480-c3511505cd1b.png', 'upload/mall/goods/20190410/65/a9f5904e-b3a8-4dc5-b480-c3511505cd1b.png', NULL, '2019-04-10 13:21:05', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (584, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/904c89b7-be8b-4f37-9334-59aba906326d.png', 'upload/mall/goods/20190410/65/904c89b7-be8b-4f37-9334-59aba906326d.png', NULL, '2019-04-10 13:21:05', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (585, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/e280e283-2aca-4001-8501-17fcef2e8476.png', 'upload/mall/goods/20190410/65/e280e283-2aca-4001-8501-17fcef2e8476.png', NULL, '2019-04-10 13:21:05', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (586, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/0450e88c-f216-4293-a34b-33fd6aa21c58.png', 'upload/mall/goods/20190410/65/0450e88c-f216-4293-a34b-33fd6aa21c58.png', NULL, '2019-04-10 13:21:05', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (587, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/7946cc51-24ac-4427-9944-ad11885a6d74.png', 'upload/mall/goods/20190410/65/7946cc51-24ac-4427-9944-ad11885a6d74.png', NULL, '2019-04-10 13:21:06', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (588, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/d4b2ec25-6336-44f6-a95c-d022854e22f5.png', 'upload/mall/goods/20190410/65/d4b2ec25-6336-44f6-a95c-d022854e22f5.png', NULL, '2019-04-10 13:21:06', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (589, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/d3cd2a54-9aa0-4a94-bc1e-6cedbb051575.png', 'upload/mall/goods/20190410/65/d3cd2a54-9aa0-4a94-bc1e-6cedbb051575.png', NULL, '2019-04-10 13:21:06', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (590, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/864d15f2-480f-4a15-9ebd-f189da35be64.png', 'upload/mall/goods/20190410/65/864d15f2-480f-4a15-9ebd-f189da35be64.png', NULL, '2019-04-10 13:21:06', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (591, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/24474377-2d4c-4e37-9d79-963d320dfbf6.png', 'upload/mall/goods/20190410/65/24474377-2d4c-4e37-9d79-963d320dfbf6.png', NULL, '2019-04-10 13:21:06', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (592, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/bc3f13be-5725-42e8-b868-39f0cee577f9.png', 'upload/mall/goods/20190410/65/bc3f13be-5725-42e8-b868-39f0cee577f9.png', NULL, '2019-04-10 13:21:06', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (593, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/f72ed647-ef09-4dd7-b437-1dec683df258.png', 'upload/mall/goods/20190410/65/f72ed647-ef09-4dd7-b437-1dec683df258.png', NULL, '2019-04-10 13:21:07', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (594, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/1b806ec2-174e-44e1-ad45-29f31f3b1d23.png', 'upload/mall/goods/20190410/65/1b806ec2-174e-44e1-ad45-29f31f3b1d23.png', NULL, '2019-04-10 13:21:07', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (595, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/110d08f9-1a3d-41c7-b541-d32519d762d9.png', 'upload/mall/goods/20190410/65/110d08f9-1a3d-41c7-b541-d32519d762d9.png', NULL, '2019-04-10 13:21:07', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (596, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/fbc42db3-2c20-4965-9731-68a9c28ffa91.png', 'upload/mall/goods/20190410/65/fbc42db3-2c20-4965-9731-68a9c28ffa91.png', NULL, '2019-04-10 13:21:07', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (597, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/e1012cd5-a7c4-4bb8-861c-1e503b43fdc0.png', 'upload/mall/goods/20190410/65/e1012cd5-a7c4-4bb8-861c-1e503b43fdc0.png', NULL, '2019-04-10 13:21:07', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (598, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/6b9b9f5c-fbc3-4810-b793-d1630622960e.png', 'upload/mall/goods/20190410/65/6b9b9f5c-fbc3-4810-b793-d1630622960e.png', NULL, '2019-04-10 13:21:07', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (599, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/ae83792c-075e-4260-bf0f-1d1fc38ab2f7.png', 'upload/mall/goods/20190410/65/ae83792c-075e-4260-bf0f-1d1fc38ab2f7.png', NULL, '2019-04-10 13:21:08', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (600, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/4309d238-0b56-4b2f-92ce-8af8cfa5ff68.png', 'upload/mall/goods/20190410/65/4309d238-0b56-4b2f-92ce-8af8cfa5ff68.png', NULL, '2019-04-10 13:21:08', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (601, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/8e59e902-97c4-479b-b0e3-34cb7547198f.png', 'upload/mall/goods/20190410/65/8e59e902-97c4-479b-b0e3-34cb7547198f.png', NULL, '2019-04-10 13:21:08', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (602, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/f61bcd4e-131e-4731-b26f-73205a8e18f7.png', 'upload/mall/goods/20190410/65/f61bcd4e-131e-4731-b26f-73205a8e18f7.png', NULL, '2019-04-10 13:21:08', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (603, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/72cf613c-d3ca-4151-8c1e-5378b0a797b7.png', 'upload/mall/goods/20190410/65/72cf613c-d3ca-4151-8c1e-5378b0a797b7.png', NULL, '2019-04-10 13:21:08', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (604, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/da367035-67cb-4f6f-bd9b-455dad320ca3.png', 'upload/mall/goods/20190410/65/da367035-67cb-4f6f-bd9b-455dad320ca3.png', NULL, '2019-04-10 13:21:09', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (605, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/4df8cf57-3675-43b5-a821-4084e93209f1.png', 'upload/mall/goods/20190410/65/4df8cf57-3675-43b5-a821-4084e93209f1.png', NULL, '2019-04-10 13:21:09', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (606, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/ab89d7d0-57e0-469a-b19d-1c3cee8505a1.png', 'upload/mall/goods/20190410/65/ab89d7d0-57e0-469a-b19d-1c3cee8505a1.png', NULL, '2019-04-10 13:21:09', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (607, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/eb6fd8e7-03d4-468f-bb31-7c194968c3fd.png', 'upload/mall/goods/20190410/65/eb6fd8e7-03d4-468f-bb31-7c194968c3fd.png', NULL, '2019-04-10 13:21:09', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (608, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/4288cc84-70e8-4eb7-a1a0-e66a275e7855.png', 'upload/mall/goods/20190410/65/4288cc84-70e8-4eb7-a1a0-e66a275e7855.png', NULL, '2019-04-10 13:21:09', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (609, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/787ed286-f109-4452-978b-6dbb1310aac0.png', 'upload/mall/goods/20190410/65/787ed286-f109-4452-978b-6dbb1310aac0.png', NULL, '2019-04-10 13:21:09', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (610, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/8e642980-44de-4fc3-8e09-1b5f4b48cc63.png', 'upload/mall/goods/20190410/65/8e642980-44de-4fc3-8e09-1b5f4b48cc63.png', NULL, '2019-04-10 13:21:10', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (611, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/627e09f8-2617-4281-8977-3648c77a3b00.png', 'upload/mall/goods/20190410/65/627e09f8-2617-4281-8977-3648c77a3b00.png', NULL, '2019-04-10 13:21:12', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (612, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/7f08a283-1f29-4610-8504-0a6ac7454402.png', 'upload/mall/goods/20190410/65/7f08a283-1f29-4610-8504-0a6ac7454402.png', NULL, '2019-04-10 13:21:12', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (613, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/8ef0fb33-6181-4d3b-8319-4223527c03f3.png', 'upload/mall/goods/20190410/65/8ef0fb33-6181-4d3b-8319-4223527c03f3.png', NULL, '2019-04-10 13:21:14', 1, 'blob', 1, 39582, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (614, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/e1bf8053-e6ab-41bb-b2ff-ffa14fc25fa2.png', 'upload/mall/goods/20190410/65/e1bf8053-e6ab-41bb-b2ff-ffa14fc25fa2.png', NULL, '2019-04-10 13:22:22', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (615, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/008a675c-ee2c-457c-bcb0-136db2f150ba.png', 'upload/mall/goods/20190410/65/008a675c-ee2c-457c-bcb0-136db2f150ba.png', NULL, '2019-04-10 13:22:23', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (616, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/af761e17-3835-41bc-8b14-7828ab425c68.png', 'upload/mall/goods/20190410/65/af761e17-3835-41bc-8b14-7828ab425c68.png', NULL, '2019-04-10 13:22:23', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (617, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/2e0cea14-19bf-4ec0-8b38-83871ee1cf3a.png', 'upload/mall/goods/20190410/65/2e0cea14-19bf-4ec0-8b38-83871ee1cf3a.png', NULL, '2019-04-10 13:22:24', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (618, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/15918595-a6bf-46d8-9cc2-c873e0e2ade4.png', 'upload/mall/goods/20190410/65/15918595-a6bf-46d8-9cc2-c873e0e2ade4.png', NULL, '2019-04-10 13:22:24', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (619, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/43fa031a-0675-4009-8869-14d46e5def58.png', 'upload/mall/goods/20190410/65/43fa031a-0675-4009-8869-14d46e5def58.png', NULL, '2019-04-10 13:22:24', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (620, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/a04861c1-b76d-4794-8c49-eb1fa8d88338.png', 'upload/mall/goods/20190410/65/a04861c1-b76d-4794-8c49-eb1fa8d88338.png', NULL, '2019-04-10 13:22:24', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (621, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/09e7da86-8ac4-43aa-977e-f581595269ab.png', 'upload/mall/goods/20190410/65/09e7da86-8ac4-43aa-977e-f581595269ab.png', NULL, '2019-04-10 13:22:25', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (622, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/edf52d8e-6a68-4d6d-bd9b-75bfaffffd73.png', 'upload/mall/goods/20190410/65/edf52d8e-6a68-4d6d-bd9b-75bfaffffd73.png', NULL, '2019-04-10 13:22:25', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (623, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/e41aae1c-54f5-40e6-b9c8-12a629d78249.png', 'upload/mall/goods/20190410/65/e41aae1c-54f5-40e6-b9c8-12a629d78249.png', NULL, '2019-04-10 13:22:25', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (624, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/e3a4047f-539c-4cb4-be62-8a53f8870102.png', 'upload/mall/goods/20190410/65/e3a4047f-539c-4cb4-be62-8a53f8870102.png', NULL, '2019-04-10 13:22:25', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (625, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/a30128c3-a1e4-4951-94e3-6605f33972cd.png', 'upload/mall/goods/20190410/65/a30128c3-a1e4-4951-94e3-6605f33972cd.png', NULL, '2019-04-10 13:22:25', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (626, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/7ad84be9-d0ee-47bf-b6f7-a6ef8f954fbf.png', 'upload/mall/goods/20190410/65/7ad84be9-d0ee-47bf-b6f7-a6ef8f954fbf.png', NULL, '2019-04-10 13:22:25', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (627, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/5745328f-f880-43f3-b1ad-0cd2f4a6c4fb.png', 'upload/mall/goods/20190410/65/5745328f-f880-43f3-b1ad-0cd2f4a6c4fb.png', NULL, '2019-04-10 13:22:26', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (628, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/7ea9b416-7e1f-4afc-8cb8-8193da7c5716.png', 'upload/mall/goods/20190410/65/7ea9b416-7e1f-4afc-8cb8-8193da7c5716.png', NULL, '2019-04-10 13:22:26', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (629, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/8cc4d849-9650-4952-8066-15f0c395cd09.png', 'upload/mall/goods/20190410/65/8cc4d849-9650-4952-8066-15f0c395cd09.png', NULL, '2019-04-10 13:22:26', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (630, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/2e24dfac-4195-4922-9de5-ce54415cdf1e.png', 'upload/mall/goods/20190410/65/2e24dfac-4195-4922-9de5-ce54415cdf1e.png', NULL, '2019-04-10 13:22:27', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (631, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/61479859-9487-4056-bd77-e50e3d42cbcd.png', 'upload/mall/goods/20190410/65/61479859-9487-4056-bd77-e50e3d42cbcd.png', NULL, '2019-04-10 13:22:28', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (632, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/5b5f31a1-869f-4b16-8e26-7c447fa321bc.png', 'upload/mall/goods/20190410/65/5b5f31a1-869f-4b16-8e26-7c447fa321bc.png', NULL, '2019-04-10 13:22:28', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (633, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/aa72ba56-6094-4265-ab65-18dcbaff6081.png', 'upload/mall/goods/20190410/65/aa72ba56-6094-4265-ab65-18dcbaff6081.png', NULL, '2019-04-10 13:22:28', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (634, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/d6c4c378-e5d6-41e5-9402-1d3feb77f719.png', 'upload/mall/goods/20190410/65/d6c4c378-e5d6-41e5-9402-1d3feb77f719.png', NULL, '2019-04-10 13:22:28', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (635, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/c33b93fc-b5f0-4a01-9af8-d1265e8fb181.png', 'upload/mall/goods/20190410/65/c33b93fc-b5f0-4a01-9af8-d1265e8fb181.png', NULL, '2019-04-10 13:22:28', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (636, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/42be8591-100d-4ff4-a44b-897eb449dc3d.png', 'upload/mall/goods/20190410/65/42be8591-100d-4ff4-a44b-897eb449dc3d.png', NULL, '2019-04-10 13:22:28', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (637, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/2f753733-8873-4704-acdc-202d144ca7c0.png', 'upload/mall/goods/20190410/65/2f753733-8873-4704-acdc-202d144ca7c0.png', NULL, '2019-04-10 13:22:28', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (638, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/77c7cd43-4273-4b87-82f2-8577b0b09f96.png', 'upload/mall/goods/20190410/65/77c7cd43-4273-4b87-82f2-8577b0b09f96.png', NULL, '2019-04-10 13:22:29', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (639, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/cd985e4a-3dea-49d1-8c04-7da3230566ac.png', 'upload/mall/goods/20190410/65/cd985e4a-3dea-49d1-8c04-7da3230566ac.png', NULL, '2019-04-10 13:22:29', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (640, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/a8f8f243-fae7-406d-8f19-564cda47e44e.png', 'upload/mall/goods/20190410/65/a8f8f243-fae7-406d-8f19-564cda47e44e.png', NULL, '2019-04-10 13:22:29', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (641, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/1eb11784-0fd1-4e09-8922-814b90dd259a.png', 'upload/mall/goods/20190410/65/1eb11784-0fd1-4e09-8922-814b90dd259a.png', NULL, '2019-04-10 13:22:29', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (642, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/fc009258-e00d-4f01-aea2-46985162025e.png', 'upload/mall/goods/20190410/65/fc009258-e00d-4f01-aea2-46985162025e.png', NULL, '2019-04-10 13:22:29', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (643, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/c5787797-e535-46b5-a204-604ec4d91ea7.png', 'upload/mall/goods/20190410/65/c5787797-e535-46b5-a204-604ec4d91ea7.png', NULL, '2019-04-10 13:22:29', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (644, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/6c77f255-438f-4ad0-aea9-b33446e9354b.png', 'upload/mall/goods/20190410/65/6c77f255-438f-4ad0-aea9-b33446e9354b.png', NULL, '2019-04-10 13:22:30', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (645, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/4fd19d19-f3af-4391-a3a1-4a5a8d5377d8.png', 'upload/mall/goods/20190410/65/4fd19d19-f3af-4391-a3a1-4a5a8d5377d8.png', NULL, '2019-04-10 13:22:31', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (646, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/6d9afd5c-12a2-47e8-bc6e-169055dc606a.png', 'upload/mall/goods/20190410/65/6d9afd5c-12a2-47e8-bc6e-169055dc606a.png', NULL, '2019-04-10 13:22:31', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (647, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/f0b4f567-8aba-44f6-bd76-c24b98a75395.png', 'upload/mall/goods/20190410/65/f0b4f567-8aba-44f6-bd76-c24b98a75395.png', NULL, '2019-04-10 13:22:32', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (648, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/b440565d-9fd5-42f0-9f58-cd1e818ea06e.png', 'upload/mall/goods/20190410/65/b440565d-9fd5-42f0-9f58-cd1e818ea06e.png', NULL, '2019-04-10 13:22:32', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (649, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/ec27a6fc-49ea-4fd2-aec2-12e3fc0a8e31.png', 'upload/mall/goods/20190410/65/ec27a6fc-49ea-4fd2-aec2-12e3fc0a8e31.png', NULL, '2019-04-10 13:22:32', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (650, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/068b7b79-b59f-4b7e-82fb-6aab9f2f9072.png', 'upload/mall/goods/20190410/65/068b7b79-b59f-4b7e-82fb-6aab9f2f9072.png', NULL, '2019-04-10 13:22:32', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (651, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/1ba61b3b-4027-442b-858b-fba4c24b65f0.png', 'upload/mall/goods/20190410/65/1ba61b3b-4027-442b-858b-fba4c24b65f0.png', NULL, '2019-04-10 13:22:32', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (652, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/b5e25737-63ce-4b0a-839d-3f40d0ea0816.png', 'upload/mall/goods/20190410/65/b5e25737-63ce-4b0a-839d-3f40d0ea0816.png', NULL, '2019-04-10 13:22:32', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (653, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/c7b92d07-ec14-41a5-a2d8-7a222df32e1c.png', 'upload/mall/goods/20190410/65/c7b92d07-ec14-41a5-a2d8-7a222df32e1c.png', NULL, '2019-04-10 13:22:33', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (654, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/6888b418-b19b-48e8-b455-f90f130e0b6f.png', 'upload/mall/goods/20190410/65/6888b418-b19b-48e8-b455-f90f130e0b6f.png', NULL, '2019-04-10 13:22:33', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (655, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/108c3072-a9e1-47ea-bd51-d5f8045dae55.png', 'upload/mall/goods/20190410/65/108c3072-a9e1-47ea-bd51-d5f8045dae55.png', NULL, '2019-04-10 13:22:33', 1, 'blob', 1, 38254, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (656, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/424ddedb-1ec6-4239-b2c9-1c7da6c49cb5.png', 'upload/mall/goods/20190410/65/424ddedb-1ec6-4239-b2c9-1c7da6c49cb5.png', NULL, '2019-04-10 13:22:37', 1, 'blob', 1, 117868, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (657, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/6e885fff-5ec6-496b-8659-a5520ec07272.png', 'upload/mall/goods/20190410/65/6e885fff-5ec6-496b-8659-a5520ec07272.png', NULL, '2019-04-10 13:22:37', 1, 'blob', 1, 117868, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (658, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/40cf5d80-8636-4ff8-9bd5-c5fe27fe7db4.png', 'upload/mall/goods/20190410/65/40cf5d80-8636-4ff8-9bd5-c5fe27fe7db4.png', NULL, '2019-04-10 13:22:41', 1, 'blob', 1, 117868, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (659, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/003ab648-247a-4063-89f2-c768a17eae1e.png', 'upload/mall/goods/20190410/65/003ab648-247a-4063-89f2-c768a17eae1e.png', NULL, '2019-04-10 13:22:45', 1, 'blob', 1, 117868, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (660, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/e88ad11b-6ab1-4819-b1ba-cefc4907718e.png', 'upload/mall/goods/20190410/65/e88ad11b-6ab1-4819-b1ba-cefc4907718e.png', NULL, '2019-04-10 13:22:46', 1, 'blob', 1, 117868, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (661, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/312965fe-2572-4f21-8708-2eded80d1677.png', 'upload/mall/goods/20190410/65/312965fe-2572-4f21-8708-2eded80d1677.png', NULL, '2019-04-10 13:22:48', 1, 'blob', 1, 117868, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (662, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/15082d7c-bac8-41f0-9db6-5aab882a8696.png', 'upload/mall/goods/20190410/65/15082d7c-bac8-41f0-9db6-5aab882a8696.png', NULL, '2019-04-10 13:23:10', 1, 'blob', 1, 117868, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (663, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/69a14a85-47cb-4fae-b0c4-e92b1d1b84c3.png', 'upload/mall/goods/20190410/65/69a14a85-47cb-4fae-b0c4-e92b1d1b84c3.png', NULL, '2019-04-10 13:23:12', 1, 'blob', 1, 117868, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (664, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/e4770c64-b496-4033-b817-d6834a8f9458.png', 'upload/mall/goods/20190410/65/e4770c64-b496-4033-b817-d6834a8f9458.png', NULL, '2019-04-10 13:23:17', 1, 'blob', 1, 117868, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (665, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/d891faa5-2fb9-4421-8a13-fac5f16be8d7.png', 'upload/mall/goods/20190410/65/d891faa5-2fb9-4421-8a13-fac5f16be8d7.png', NULL, '2019-04-10 13:23:24', 1, 'blob', 1, 117868, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (666, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/c4bdfa33-0ea1-4bbf-8438-ed013ef420b3.png', 'upload/mall/goods/20190410/65/c4bdfa33-0ea1-4bbf-8438-ed013ef420b3.png', NULL, '2019-04-10 13:23:25', 1, 'blob', 1, 117868, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (667, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/6ae9553f-efc9-4646-9b06-c6e4aff98ba6.png', 'upload/mall/goods/20190410/65/6ae9553f-efc9-4646-9b06-c6e4aff98ba6.png', NULL, '2019-04-10 13:23:28', 1, 'blob', 1, 117868, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (668, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/6257e0a7-7fce-4810-8bc0-acf2e1e3c805.png', 'upload/mall/goods/20190410/65/6257e0a7-7fce-4810-8bc0-acf2e1e3c805.png', NULL, '2019-04-10 13:34:42', 1, 'blob', 1, 26251, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (669, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/3b163bcb-c85d-4598-b24f-2855d5ac34aa.jpg', 'upload/mall/goods/20190410/65/3b163bcb-c85d-4598-b24f-2855d5ac34aa.jpg', NULL, '2019-04-10 13:34:47', 1, '75fe84761c6a3576c668279f544c10173c10d1.jpg', 1, 15930, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (670, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/a02bfa37-0345-4c10-8c8c-4d8c2d545624.png', 'upload/mall/goods/20190410/65/a02bfa37-0345-4c10-8c8c-4d8c2d545624.png', NULL, '2019-04-10 13:34:47', 1, '222.png', 1, 59711, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (671, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/a8072fc8-c2e0-472b-b473-29c7a5bfb617.png', 'upload/mall/goods/20190410/65/a8072fc8-c2e0-472b-b473-29c7a5bfb617.png', NULL, '2019-04-10 13:34:47', 1, '232.png', 1, 565872, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (672, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/d8762976-6df9-464f-b4fc-7cd7a576b340.png', 'upload/mall/goods/20190410/65/d8762976-6df9-464f-b4fc-7cd7a576b340.png', NULL, '2019-04-10 13:34:47', 1, '333.png', 1, 59082, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (673, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/ce0715dd-aa91-45ec-ada2-fad171bba6bb.png', 'upload/mall/goods/20190410/65/ce0715dd-aa91-45ec-ada2-fad171bba6bb.png', NULL, '2019-04-10 13:34:47', 1, '444.png', 1, 525678, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (674, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/bbaa39c0-05ec-4e84-8363-68e4ffa16318.png', 'upload/mall/goods/20190410/65/bbaa39c0-05ec-4e84-8363-68e4ffa16318.png', NULL, '2019-04-10 13:34:47', 1, '556.png', 1, 1747, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (675, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/b5b75e39-7a64-4526-892c-939b831108f5.png', 'upload/mall/goods/20190410/65/b5b75e39-7a64-4526-892c-939b831108f5.png', NULL, '2019-04-10 13:38:59', 1, 'jbolth后台管理系统_自定义px_2019.03.16.png', 1, 115725, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (676, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/257e7a9c-23f0-4c8e-9c57-b9bcb96d7df2.png', 'upload/mall/goods/20190410/65/257e7a9c-23f0-4c8e-9c57-b9bcb96d7df2.png', NULL, '2019-04-10 23:30:36', 1, '222.png', 1, 59711, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (677, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/8652868a-31a5-4886-b4ad-443a15bb0957.png', 'upload/mall/goods/20190410/65/8652868a-31a5-4886-b4ad-443a15bb0957.png', NULL, '2019-04-10 23:30:36', 1, '232.png', 1, 565872, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (678, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/cc68372e-1488-4609-a8c6-03e7840694af.png', 'upload/mall/goods/20190410/65/cc68372e-1488-4609-a8c6-03e7840694af.png', NULL, '2019-04-10 23:30:36', 1, '333.png', 1, 59082, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (679, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/dccec668-24b7-432c-a571-4a6a06cc006e.png', 'upload/mall/goods/20190410/65/dccec668-24b7-432c-a571-4a6a06cc006e.png', NULL, '2019-04-10 23:30:36', 1, '444.png', 1, 525678, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (680, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/999f70eb-9d14-445d-a3a7-5a4f86854c52.png', 'upload/mall/goods/20190410/65/999f70eb-9d14-445d-a3a7-5a4f86854c52.png', NULL, '2019-04-10 23:30:56', 1, '222.png', 1, 59711, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (681, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/03bb793c-5e90-4d55-9cf1-bf018c8383cd.png', 'upload/mall/goods/20190410/65/03bb793c-5e90-4d55-9cf1-bf018c8383cd.png', NULL, '2019-04-10 23:30:56', 1, '232.png', 1, 565872, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (682, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/1507873e-b24c-46ea-b122-b90bf641855b.png', 'upload/mall/goods/20190410/65/1507873e-b24c-46ea-b122-b90bf641855b.png', NULL, '2019-04-10 23:30:56', 1, '333.png', 1, 59082, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (683, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/108a1656-5eb3-46ce-9ac5-5910260fda0c.png', 'upload/mall/goods/20190410/65/108a1656-5eb3-46ce-9ac5-5910260fda0c.png', NULL, '2019-04-10 23:30:56', 1, '444.png', 1, 525678, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (684, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/7257bc14-a442-4edc-910c-d30307828e63.png', 'upload/mall/goods/20190410/65/7257bc14-a442-4edc-910c-d30307828e63.png', NULL, '2019-04-10 23:30:56', 1, '556.png', 1, 1747, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (685, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/0ed5774f-98cf-49dd-90b3-0e89fd4459c4.png', 'upload/mall/goods/20190410/65/0ed5774f-98cf-49dd-90b3-0e89fd4459c4.png', NULL, '2019-04-10 23:31:55', 1, '333.png', 1, 59082, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (686, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/e7764257-81f3-4a42-811b-deb59148904d.png', 'upload/mall/goods/20190410/65/e7764257-81f3-4a42-811b-deb59148904d.png', NULL, '2019-04-10 23:32:03', 1, '556.png', 1, 1747, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (687, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/5ad65d04-6d56-41f7-9a70-d8b5bb45241d.PNG', 'upload/mall/goods/20190410/65/5ad65d04-6d56-41f7-9a70-d8b5bb45241d.PNG', NULL, '2019-04-10 23:32:03', 1, '557fbe1dc12f4e2086e6cb6879b6a593.PNG', 1, 5425, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (688, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/6b8e145a-a44c-44e4-ad51-7a2af345355e.jpg', 'upload/mall/goods/20190410/65/6b8e145a-a44c-44e4-ad51-7a2af345355e.jpg', NULL, '2019-04-10 23:32:12', 1, '75fe84761c6a3576c668279f544c10173c10d1.jpg', 1, 15930, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (689, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/3ab12442-d192-4793-9975-bc346d34f098.png', 'upload/mall/goods/20190410/65/3ab12442-d192-4793-9975-bc346d34f098.png', NULL, '2019-04-10 23:32:12', 1, '222.png', 1, 59711, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (690, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/05f82ba7-8d19-45af-8028-910bcea525da.png', 'upload/mall/goods/20190410/65/05f82ba7-8d19-45af-8028-910bcea525da.png', NULL, '2019-04-10 23:32:12', 1, '232.png', 1, 565872, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (691, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/7d18cd23-78a9-4faf-8e20-56bf2157e402.png', 'upload/mall/goods/20190410/65/7d18cd23-78a9-4faf-8e20-56bf2157e402.png', NULL, '2019-04-10 23:32:12', 1, '333.png', 1, 59082, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (692, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/7da57eb5-f200-4445-910e-d8ee7dc406bd.png', 'upload/mall/goods/20190410/65/7da57eb5-f200-4445-910e-d8ee7dc406bd.png', NULL, '2019-04-10 23:32:12', 1, '444.png', 1, 525678, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (693, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/f8ea14f5-e152-4a68-bfd9-3ebf368d0a20.png', 'upload/mall/goods/20190410/65/f8ea14f5-e152-4a68-bfd9-3ebf368d0a20.png', NULL, '2019-04-10 23:35:59', 1, '222.png', 1, 59711, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (694, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/634685c0-deb7-4bc8-8255-44032829e23f.png', 'upload/mall/goods/20190410/65/634685c0-deb7-4bc8-8255-44032829e23f.png', NULL, '2019-04-10 23:35:59', 1, '232.png', 1, 565872, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (695, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/14f927b2-0a39-4187-8169-66c505ac84a2.png', 'upload/mall/goods/20190410/65/14f927b2-0a39-4187-8169-66c505ac84a2.png', NULL, '2019-04-10 23:40:34', 1, '444.png', 1, 525678, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (696, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/d0e656cb-3656-49b4-bdfc-aa79f71e753e.png', 'upload/mall/goods/20190410/65/d0e656cb-3656-49b4-bdfc-aa79f71e753e.png', NULL, '2019-04-10 23:43:30', 1, '444.png', 1, 525678, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (697, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/3511447c-876a-4725-a358-db0db92ce077.png', 'upload/mall/goods/20190410/65/3511447c-876a-4725-a358-db0db92ce077.png', NULL, '2019-04-10 23:44:18', 1, '444.png', 1, 525678, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (698, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190410/65/b44a6a39-3102-4d92-aa48-ed179cab31c2.png', 'upload/mall/goods/20190410/65/b44a6a39-3102-4d92-aa48-ed179cab31c2.png', NULL, '2019-04-10 23:51:39', 1, '1.png', 1, 235126, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (699, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/a8406c43-e4de-4e61-8b70-b71f328a214c.png', 'upload/mall/goods/20190411/65/a8406c43-e4de-4e61-8b70-b71f328a214c.png', NULL, '2019-04-11 00:00:13', 1, '222.png', 1, 59711, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (700, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/42920597-a65e-417e-92aa-30975f205737.png', 'upload/mall/goods/20190411/65/42920597-a65e-417e-92aa-30975f205737.png', NULL, '2019-04-11 00:00:13', 1, '232.png', 1, 565872, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (701, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/7a0036ad-a67c-4d9e-93fa-f866158e7d64.png', 'upload/mall/goods/20190411/65/7a0036ad-a67c-4d9e-93fa-f866158e7d64.png', NULL, '2019-04-11 00:00:13', 1, '333.png', 1, 59082, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (702, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/ee28e873-f5be-45a0-8364-528c05eab5cf.png', 'upload/mall/goods/20190411/65/ee28e873-f5be-45a0-8364-528c05eab5cf.png', NULL, '2019-04-11 00:00:13', 1, '444.png', 1, 525678, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (703, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/d880b416-689d-4348-a9e6-23bcd1659803.png', 'upload/mall/goods/20190411/65/d880b416-689d-4348-a9e6-23bcd1659803.png', NULL, '2019-04-11 00:00:13', 1, '556.png', 1, 1747, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (704, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/48b953a6-885a-4ce0-9f9f-1dcf8bdbca11.png', 'upload/mall/goods/20190411/65/48b953a6-885a-4ce0-9f9f-1dcf8bdbca11.png', NULL, '2019-04-11 01:28:10', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (705, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/c812f2af-1851-427e-a7e8-e5494f1846a3.png', 'upload/mall/goods/20190411/65/c812f2af-1851-427e-a7e8-e5494f1846a3.png', NULL, '2019-04-11 01:28:12', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (706, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/83097d8a-5a11-4830-a540-5530f5125079.png', 'upload/mall/goods/20190411/65/83097d8a-5a11-4830-a540-5530f5125079.png', NULL, '2019-04-11 01:28:13', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (707, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/fe14ea5e-306c-4c32-abbc-58220475ca4f.png', 'upload/mall/goods/20190411/65/fe14ea5e-306c-4c32-abbc-58220475ca4f.png', NULL, '2019-04-11 01:28:13', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (708, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/85f800a4-0c3e-4c00-895d-a5487e4d44b3.png', 'upload/mall/goods/20190411/65/85f800a4-0c3e-4c00-895d-a5487e4d44b3.png', NULL, '2019-04-11 01:28:13', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (709, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/8c36a309-19b3-4f74-af54-70261f3c6647.png', 'upload/mall/goods/20190411/65/8c36a309-19b3-4f74-af54-70261f3c6647.png', NULL, '2019-04-11 01:28:17', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (710, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/2de4c88a-f042-4117-acb4-36c61f3644b0.png', 'upload/mall/goods/20190411/65/2de4c88a-f042-4117-acb4-36c61f3644b0.png', NULL, '2019-04-11 01:28:17', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (711, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/f7923ba5-3115-49f8-92a7-7194e5ce6176.png', 'upload/mall/goods/20190411/65/f7923ba5-3115-49f8-92a7-7194e5ce6176.png', NULL, '2019-04-11 01:28:17', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (712, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/052b1100-fa47-4922-b729-af0115f1040d.png', 'upload/mall/goods/20190411/65/052b1100-fa47-4922-b729-af0115f1040d.png', NULL, '2019-04-11 01:28:17', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (713, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/0a5ac58a-0996-4e82-b0d1-ab062c8915da.png', 'upload/mall/goods/20190411/65/0a5ac58a-0996-4e82-b0d1-ab062c8915da.png', NULL, '2019-04-11 01:28:17', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (714, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/404761bc-be51-4383-880c-db18fbc196c1.png', 'upload/mall/goods/20190411/65/404761bc-be51-4383-880c-db18fbc196c1.png', NULL, '2019-04-11 01:28:17', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (715, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/5098bfdd-e537-4f92-b4ed-328bb4e620c9.png', 'upload/mall/goods/20190411/65/5098bfdd-e537-4f92-b4ed-328bb4e620c9.png', NULL, '2019-04-11 01:28:17', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (716, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/6502fbe9-5218-45e4-a724-fff22f5abc56.png', 'upload/mall/goods/20190411/65/6502fbe9-5218-45e4-a724-fff22f5abc56.png', NULL, '2019-04-11 01:28:17', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (717, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/f2650293-fcc8-4e4c-8b11-95cde610d43e.png', 'upload/mall/goods/20190411/65/f2650293-fcc8-4e4c-8b11-95cde610d43e.png', NULL, '2019-04-11 01:28:19', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (718, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/6ad5c4a4-5341-46bd-8d1e-80e0b8f1e669.png', 'upload/mall/goods/20190411/65/6ad5c4a4-5341-46bd-8d1e-80e0b8f1e669.png', NULL, '2019-04-11 01:28:20', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (719, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/939fec05-afbf-463f-a679-cebee9da6fb6.png', 'upload/mall/goods/20190411/65/939fec05-afbf-463f-a679-cebee9da6fb6.png', NULL, '2019-04-11 01:28:20', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (720, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/a94d487b-f351-46e3-983c-f7ca0249f8e3.png', 'upload/mall/goods/20190411/65/a94d487b-f351-46e3-983c-f7ca0249f8e3.png', NULL, '2019-04-11 01:28:21', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (721, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/dcaa2eeb-ab9f-4577-82b3-3306580683c0.png', 'upload/mall/goods/20190411/65/dcaa2eeb-ab9f-4577-82b3-3306580683c0.png', NULL, '2019-04-11 01:28:25', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (722, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/f64e8291-2660-464e-93db-389f98bafe2f.png', 'upload/mall/goods/20190411/65/f64e8291-2660-464e-93db-389f98bafe2f.png', NULL, '2019-04-11 01:28:25', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (723, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/c9f62c5e-81f8-4f24-ade4-cd1d49b9fa55.png', 'upload/mall/goods/20190411/65/c9f62c5e-81f8-4f24-ade4-cd1d49b9fa55.png', NULL, '2019-04-11 01:28:25', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (724, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/e9bd7dcb-ace7-41e3-a120-54db3babcb0e.png', 'upload/mall/goods/20190411/65/e9bd7dcb-ace7-41e3-a120-54db3babcb0e.png', NULL, '2019-04-11 01:28:25', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (725, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/82ec0216-a166-42d4-9b5e-f1193a39cfa7.png', 'upload/mall/goods/20190411/65/82ec0216-a166-42d4-9b5e-f1193a39cfa7.png', NULL, '2019-04-11 01:28:25', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (726, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/0faae354-0d83-4abf-a203-69316d77d3a4.png', 'upload/mall/goods/20190411/65/0faae354-0d83-4abf-a203-69316d77d3a4.png', NULL, '2019-04-11 01:28:25', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (727, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/3d1dbdd7-2b97-483d-bf8a-424302791dc6.png', 'upload/mall/goods/20190411/65/3d1dbdd7-2b97-483d-bf8a-424302791dc6.png', NULL, '2019-04-11 01:28:25', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (728, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/7340b236-9a24-4d59-938b-45caef38d445.png', 'upload/mall/goods/20190411/65/7340b236-9a24-4d59-938b-45caef38d445.png', NULL, '2019-04-11 01:28:25', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (729, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/bd99152b-f1d9-4e23-8f96-63df9481c764.png', 'upload/mall/goods/20190411/65/bd99152b-f1d9-4e23-8f96-63df9481c764.png', NULL, '2019-04-11 01:28:25', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (730, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/afc40ec8-acbc-4655-863e-123853b37478.png', 'upload/mall/goods/20190411/65/afc40ec8-acbc-4655-863e-123853b37478.png', NULL, '2019-04-11 01:28:25', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (731, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/f6a9f397-e1c2-4118-b590-458fc09818e2.png', 'upload/mall/goods/20190411/65/f6a9f397-e1c2-4118-b590-458fc09818e2.png', NULL, '2019-04-11 01:28:25', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (732, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/96db8252-5374-4bb1-bbc7-f8e112189441.png', 'upload/mall/goods/20190411/65/96db8252-5374-4bb1-bbc7-f8e112189441.png', NULL, '2019-04-11 01:28:25', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (733, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/0eaef3b8-b32a-4460-afde-87a9934332b9.png', 'upload/mall/goods/20190411/65/0eaef3b8-b32a-4460-afde-87a9934332b9.png', NULL, '2019-04-11 01:28:25', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (734, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/6ae0251b-0e5b-4c74-ba25-e2ae1132e673.png', 'upload/mall/goods/20190411/65/6ae0251b-0e5b-4c74-ba25-e2ae1132e673.png', NULL, '2019-04-11 01:28:25', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (735, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/7962df2b-cec5-4539-a78a-5b5ac2b3a336.png', 'upload/mall/goods/20190411/65/7962df2b-cec5-4539-a78a-5b5ac2b3a336.png', NULL, '2019-04-11 01:28:43', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (736, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/d800a797-871a-421a-8c15-6bd240e0ccb1.png', 'upload/mall/goods/20190411/65/d800a797-871a-421a-8c15-6bd240e0ccb1.png', NULL, '2019-04-11 01:28:49', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (737, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/8b8f2cf2-94df-439d-b247-d755bd212556.png', 'upload/mall/goods/20190411/65/8b8f2cf2-94df-439d-b247-d755bd212556.png', NULL, '2019-04-11 01:28:49', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (738, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/753da35b-f262-4b2a-901d-f4f8657e86b0.png', 'upload/mall/goods/20190411/65/753da35b-f262-4b2a-901d-f4f8657e86b0.png', NULL, '2019-04-11 01:28:49', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (739, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/0474a49c-47fb-4d1a-b95b-861b2cc8c124.png', 'upload/mall/goods/20190411/65/0474a49c-47fb-4d1a-b95b-861b2cc8c124.png', NULL, '2019-04-11 01:28:49', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (740, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/85a59cac-a437-4f0b-9c36-6fd68c954b55.png', 'upload/mall/goods/20190411/65/85a59cac-a437-4f0b-9c36-6fd68c954b55.png', NULL, '2019-04-11 01:28:49', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (741, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/a72cfb01-b619-4628-b3af-a44420d1d5e0.png', 'upload/mall/goods/20190411/65/a72cfb01-b619-4628-b3af-a44420d1d5e0.png', NULL, '2019-04-11 01:28:49', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (742, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/532123de-517e-477a-ab05-20eb4ebed22a.png', 'upload/mall/goods/20190411/65/532123de-517e-477a-ab05-20eb4ebed22a.png', NULL, '2019-04-11 01:28:49', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (743, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/bac1a142-6c50-4195-a60a-0e488a608d56.png', 'upload/mall/goods/20190411/65/bac1a142-6c50-4195-a60a-0e488a608d56.png', NULL, '2019-04-11 01:28:49', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (744, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/a56c29a1-9cf2-470f-a0d5-e61d665fa31e.png', 'upload/mall/goods/20190411/65/a56c29a1-9cf2-470f-a0d5-e61d665fa31e.png', NULL, '2019-04-11 01:28:49', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (745, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/716c1533-8b07-4ecc-b90f-eea538894269.png', 'upload/mall/goods/20190411/65/716c1533-8b07-4ecc-b90f-eea538894269.png', NULL, '2019-04-11 01:28:49', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (746, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/1fcc2829-88ed-4a06-97f0-507c29798180.png', 'upload/mall/goods/20190411/65/1fcc2829-88ed-4a06-97f0-507c29798180.png', NULL, '2019-04-11 01:28:49', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (747, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/78990a13-7c70-46e5-bf26-9dd5dec4fba1.png', 'upload/mall/goods/20190411/65/78990a13-7c70-46e5-bf26-9dd5dec4fba1.png', NULL, '2019-04-11 01:28:49', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (748, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/fec44a2b-54bd-45da-942d-cf016445b928.png', 'upload/mall/goods/20190411/65/fec44a2b-54bd-45da-942d-cf016445b928.png', NULL, '2019-04-11 01:28:49', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (749, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/6235bed7-52bd-4846-9281-53b72723a2ec.png', 'upload/mall/goods/20190411/65/6235bed7-52bd-4846-9281-53b72723a2ec.png', NULL, '2019-04-11 01:28:49', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (750, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/e2c3769e-a070-4958-86a6-e3f9ee64d0a1.png', 'upload/mall/goods/20190411/65/e2c3769e-a070-4958-86a6-e3f9ee64d0a1.png', NULL, '2019-04-11 01:28:49', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (751, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/20962e4e-389b-48c6-9b27-6255c5f110a8.png', 'upload/mall/goods/20190411/65/20962e4e-389b-48c6-9b27-6255c5f110a8.png', NULL, '2019-04-11 01:28:49', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (752, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/242131d4-fd18-451c-9e26-f25a75d6711f.png', 'upload/mall/goods/20190411/65/242131d4-fd18-451c-9e26-f25a75d6711f.png', NULL, '2019-04-11 01:28:49', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (753, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/4362d430-1e2b-4987-bede-8d0c8eb9b943.png', 'upload/mall/goods/20190411/65/4362d430-1e2b-4987-bede-8d0c8eb9b943.png', NULL, '2019-04-11 01:28:49', 1, 'blob', 1, 125233, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (754, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/b861323c-a37f-45da-b5e0-1903395a12e8.png', 'upload/mall/goods/20190411/65/b861323c-a37f-45da-b5e0-1903395a12e8.png', NULL, '2019-04-11 01:35:35', 1, 'blob', 1, 123617, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (755, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/74342ac6-bbb6-4d22-b1e1-cfb3f1e15254.png', 'upload/mall/goods/20190411/65/74342ac6-bbb6-4d22-b1e1-cfb3f1e15254.png', NULL, '2019-04-11 01:35:39', 1, 'blob', 1, 123617, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (756, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/b5c8197c-68a8-4533-8447-5f65bb6746fd.png', 'upload/mall/goods/20190411/65/b5c8197c-68a8-4533-8447-5f65bb6746fd.png', NULL, '2019-04-11 01:35:40', 1, 'blob', 1, 123617, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (757, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/e396e8f1-a080-4713-b97a-91f90935d49e.png', 'upload/mall/goods/20190411/65/e396e8f1-a080-4713-b97a-91f90935d49e.png', NULL, '2019-04-11 01:35:42', 1, 'blob', 1, 123617, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (758, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/cd53ebfc-25c0-42e9-9157-28449bd2c0fe.png', 'upload/mall/goods/20190411/65/cd53ebfc-25c0-42e9-9157-28449bd2c0fe.png', NULL, '2019-04-11 01:36:11', 1, 'blob', 1, 123617, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (759, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/79d8a885-1efb-4016-a417-8d29eb7420d4.png', 'upload/mall/goods/20190411/65/79d8a885-1efb-4016-a417-8d29eb7420d4.png', NULL, '2019-04-11 01:40:37', 1, 'blob', 1, 130279, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (760, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/dac095b0-d217-4fb6-84e8-eaa449d99ba2.png', 'upload/mall/goods/20190411/65/dac095b0-d217-4fb6-84e8-eaa449d99ba2.png', NULL, '2019-04-11 01:40:40', 1, 'blob', 1, 130279, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (761, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/9f8205fc-1515-4fee-947a-35631d09cef4.png', 'upload/mall/goods/20190411/65/9f8205fc-1515-4fee-947a-35631d09cef4.png', NULL, '2019-04-11 01:40:44', 1, '333.png', 1, 59082, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (762, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/c8434b63-ea66-40c9-80d2-ba6f54da6844.png', 'upload/mall/goods/20190411/65/c8434b63-ea66-40c9-80d2-ba6f54da6844.png', NULL, '2019-04-11 01:40:53', 1, '222.png', 1, 59711, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (763, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/09fcc062-dffe-4afc-b228-63adc7e0caac.png', 'upload/mall/goods/20190411/65/09fcc062-dffe-4afc-b228-63adc7e0caac.png', NULL, '2019-04-11 01:40:53', 1, '232.png', 1, 565872, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (764, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/065a714f-9b55-4b89-bfe0-63ee84d809ec.png', 'upload/mall/goods/20190411/65/065a714f-9b55-4b89-bfe0-63ee84d809ec.png', NULL, '2019-04-11 01:40:53', 1, '333.png', 1, 59082, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (765, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/91151cc2-866b-4c7b-af96-d297d0216339.png', 'upload/mall/goods/20190411/65/91151cc2-866b-4c7b-af96-d297d0216339.png', NULL, '2019-04-11 01:40:53', 1, '444.png', 1, 525678, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (766, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/4cb02a4c-ff48-4379-951e-82507283a526.png', 'upload/mall/goods/20190411/65/4cb02a4c-ff48-4379-951e-82507283a526.png', NULL, '2019-04-11 01:40:57', 1, 'blob', 1, 130279, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (767, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/c99b0aa9-ad9b-43fb-a975-bf3b79ed5e40.png', 'upload/mall/goods/20190411/65/c99b0aa9-ad9b-43fb-a975-bf3b79ed5e40.png', NULL, '2019-04-11 01:41:00', 1, 'blob', 1, 130279, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (768, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/bf372a7c-cb81-4f01-85b7-9b42d032deba.jpg', 'upload/mall/goods/20190411/65/bf372a7c-cb81-4f01-85b7-9b42d032deba.jpg', NULL, '2019-04-11 01:41:05', 1, '_wKgBDVu_I5OAU41qAABZ0Jdjv8w043.jpg', 1, 22992, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (769, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/21b84ec2-1470-4fb5-bba5-e85da14456de.png', 'upload/mall/goods/20190411/65/21b84ec2-1470-4fb5-bba5-e85da14456de.png', NULL, '2019-04-11 01:47:52', 1, 'blob', 1, 144591, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (770, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/592b70ab-3d63-42c4-9d73-838144854718.png', 'upload/mall/goods/20190411/65/592b70ab-3d63-42c4-9d73-838144854718.png', NULL, '2019-04-11 01:48:10', 1, 'blob', 1, 144591, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (771, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/710c9c04-b6c7-44c7-9d05-26267a54a91e.png', 'upload/mall/goods/20190411/65/710c9c04-b6c7-44c7-9d05-26267a54a91e.png', NULL, '2019-04-11 01:49:34', 1, 'blob', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (772, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/ad7f5875-9735-43b0-8a5e-b4400e121c75.png', 'upload/mall/goods/20190411/65/ad7f5875-9735-43b0-8a5e-b4400e121c75.png', NULL, '2019-04-11 01:49:56', 1, 'blob', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (773, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/213085b6-be42-47a6-8ac0-8de896be4bf0.png', 'upload/mall/goods/20190411/65/213085b6-be42-47a6-8ac0-8de896be4bf0.png', NULL, '2019-04-11 01:53:22', 1, 'blob', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (774, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/0145df8f-6231-434f-8dd1-f3fabbb56f15.png', 'upload/mall/goods/20190411/65/0145df8f-6231-434f-8dd1-f3fabbb56f15.png', NULL, '2019-04-11 01:53:58', 1, 'blob', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (775, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/733bd397-8565-4a97-8b88-e97465669a62.png', 'upload/mall/goods/20190411/65/733bd397-8565-4a97-8b88-e97465669a62.png', NULL, '2019-04-11 01:57:21', 1, 'blob', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (776, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/4f45d17d-b54a-4f64-be8f-332f60c310ab.png', 'upload/mall/goods/20190411/65/4f45d17d-b54a-4f64-be8f-332f60c310ab.png', NULL, '2019-04-11 01:58:27', 1, 'blob', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (777, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/745a4fc0-74c3-49ff-81fa-c80cb2ca2c7c.png', 'upload/mall/goods/20190411/65/745a4fc0-74c3-49ff-81fa-c80cb2ca2c7c.png', NULL, '2019-04-11 01:59:50', 1, 'blob', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (778, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/fa4a9970-311d-45f4-8953-65e1768bf5ae.png', 'upload/mall/goods/20190411/65/fa4a9970-311d-45f4-8953-65e1768bf5ae.png', NULL, '2019-04-11 02:02:21', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (779, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/4c4bcc27-0809-4613-b599-528925e139e0.png', 'upload/mall/goods/20190411/65/4c4bcc27-0809-4613-b599-528925e139e0.png', NULL, '2019-04-11 02:03:28', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (780, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/a4ec7429-0173-407d-a723-3aa575eb3968.png', 'upload/mall/goods/20190411/65/a4ec7429-0173-407d-a723-3aa575eb3968.png', NULL, '2019-04-11 02:07:51', 1, 'image.png', 1, 143320, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (781, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/0afb3e16-c338-40de-abd6-f8f37a5a92b0.png', 'upload/mall/goods/20190411/65/0afb3e16-c338-40de-abd6-f8f37a5a92b0.png', NULL, '2019-04-11 02:08:01', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (782, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/0438cf32-9843-4115-aead-8cdabc043117.png', 'upload/mall/goods/20190411/65/0438cf32-9843-4115-aead-8cdabc043117.png', NULL, '2019-04-11 02:08:54', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (783, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/1e652780-855a-401d-8def-e287594ba269.png', 'upload/mall/goods/20190411/65/1e652780-855a-401d-8def-e287594ba269.png', NULL, '2019-04-11 02:13:04', 1, 'image.png', 1, 130255, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (784, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/a5f38cf6-d201-42d7-b8e3-04579667bad4.png', 'upload/mall/goods/20190411/65/a5f38cf6-d201-42d7-b8e3-04579667bad4.png', NULL, '2019-04-11 02:13:25', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (785, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/d8ae03ce-50c0-4377-863e-14f84b3f93ee.png', 'upload/mall/goods/20190411/65/d8ae03ce-50c0-4377-863e-14f84b3f93ee.png', NULL, '2019-04-11 02:13:47', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (786, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/a6ba696f-5252-4602-aed9-39b73233c71e.png', 'upload/mall/goods/20190411/65/a6ba696f-5252-4602-aed9-39b73233c71e.png', NULL, '2019-04-11 02:14:04', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (787, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/a3d83b95-c577-407b-8f3a-cd6433b5583f.png', 'upload/mall/goods/20190411/65/a3d83b95-c577-407b-8f3a-cd6433b5583f.png', NULL, '2019-04-11 02:15:37', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (788, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/31c0728b-c42f-4b35-9e38-fced27be05bf.png', 'upload/mall/goods/20190411/65/31c0728b-c42f-4b35-9e38-fced27be05bf.png', NULL, '2019-04-11 02:17:10', 1, 'image.png', 1, 134752, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (789, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/18ca48bd-cf51-4a62-a4fd-ae088b4cd004.png', 'upload/mall/goods/20190411/65/18ca48bd-cf51-4a62-a4fd-ae088b4cd004.png', NULL, '2019-04-11 02:18:08', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (790, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/94c8d905-0f22-4778-bb22-16f50194d4cd.png', 'upload/mall/goods/20190411/65/94c8d905-0f22-4778-bb22-16f50194d4cd.png', NULL, '2019-04-11 02:18:26', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (791, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/d80e3418-ae8f-48ab-ac3c-0cea9e2d13df.png', 'upload/mall/goods/20190411/65/d80e3418-ae8f-48ab-ac3c-0cea9e2d13df.png', NULL, '2019-04-11 02:22:19', 1, '333.png', 1, 59082, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (792, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/56e8f6da-a1f9-443c-9a22-d776bf4cf072.png', 'upload/mall/goods/20190411/65/56e8f6da-a1f9-443c-9a22-d776bf4cf072.png', NULL, '2019-04-11 02:22:47', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (793, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/847ee7f7-8f6d-4ca5-b4ec-a0307658caa7.png', 'upload/mall/goods/20190411/65/847ee7f7-8f6d-4ca5-b4ec-a0307658caa7.png', NULL, '2019-04-11 02:22:49', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (794, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/ff32ce6a-f9a8-4125-b77d-0485a8376bf6.png', 'upload/mall/goods/20190411/65/ff32ce6a-f9a8-4125-b77d-0485a8376bf6.png', NULL, '2019-04-11 02:22:49', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (795, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/2b07d101-ef3a-4ef9-8af5-042f12cef61f.png', 'upload/mall/goods/20190411/65/2b07d101-ef3a-4ef9-8af5-042f12cef61f.png', NULL, '2019-04-11 02:22:50', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (796, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/a3fd4523-86d3-4d7a-a619-f00a351898e2.png', 'upload/mall/goods/20190411/65/a3fd4523-86d3-4d7a-a619-f00a351898e2.png', NULL, '2019-04-11 02:22:50', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (797, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/3535ba45-2314-41dd-8550-18673898f14c.png', 'upload/mall/goods/20190411/65/3535ba45-2314-41dd-8550-18673898f14c.png', NULL, '2019-04-11 02:22:50', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (798, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/63d525e2-2756-47c6-b2fb-97f192f78e59.png', 'upload/mall/goods/20190411/65/63d525e2-2756-47c6-b2fb-97f192f78e59.png', NULL, '2019-04-11 02:22:50', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (799, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/1c27f2e6-0c1f-4a33-b756-40985ed3b7c8.png', 'upload/mall/goods/20190411/65/1c27f2e6-0c1f-4a33-b756-40985ed3b7c8.png', NULL, '2019-04-11 02:22:51', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (800, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/57ca0214-2441-451b-bcef-85afca69e7c0.png', 'upload/mall/goods/20190411/65/57ca0214-2441-451b-bcef-85afca69e7c0.png', NULL, '2019-04-11 02:22:51', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (801, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/189879ea-541c-4582-a7bb-ad009bd34b3e.png', 'upload/mall/goods/20190411/65/189879ea-541c-4582-a7bb-ad009bd34b3e.png', NULL, '2019-04-11 02:22:51', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (802, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/28332ed0-dad0-4ff0-ace1-c6091d005052.png', 'upload/mall/goods/20190411/65/28332ed0-dad0-4ff0-ace1-c6091d005052.png', NULL, '2019-04-11 02:22:51', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (803, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/4730671d-210a-49d1-ad4e-9b0c0458714e.png', 'upload/mall/goods/20190411/65/4730671d-210a-49d1-ad4e-9b0c0458714e.png', NULL, '2019-04-11 02:22:51', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (804, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/6d463874-7866-4ea4-bab9-5ed2b1def2df.png', 'upload/mall/goods/20190411/65/6d463874-7866-4ea4-bab9-5ed2b1def2df.png', NULL, '2019-04-11 02:22:51', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (805, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/f3335441-7d1e-4327-a86f-f27646e580b7.png', 'upload/mall/goods/20190411/65/f3335441-7d1e-4327-a86f-f27646e580b7.png', NULL, '2019-04-11 02:22:51', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (806, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/6b349f82-e1d5-479d-9813-25bb2bc2c3ad.png', 'upload/mall/goods/20190411/65/6b349f82-e1d5-479d-9813-25bb2bc2c3ad.png', NULL, '2019-04-11 02:22:51', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (807, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/74950ef8-8c8f-4aa6-9a0b-974885d9bd95.png', 'upload/mall/goods/20190411/65/74950ef8-8c8f-4aa6-9a0b-974885d9bd95.png', NULL, '2019-04-11 02:22:51', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (808, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/e8a8c94d-9ddb-4a52-8101-cb3a2780e4b0.png', 'upload/mall/goods/20190411/65/e8a8c94d-9ddb-4a52-8101-cb3a2780e4b0.png', NULL, '2019-04-11 02:22:51', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (809, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/dbca0c49-be42-428c-b5cf-2e349c4dfd20.png', 'upload/mall/goods/20190411/65/dbca0c49-be42-428c-b5cf-2e349c4dfd20.png', NULL, '2019-04-11 02:22:51', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (810, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/3f6c74b0-6cca-4e40-ab5d-e8aee35893bc.png', 'upload/mall/goods/20190411/65/3f6c74b0-6cca-4e40-ab5d-e8aee35893bc.png', NULL, '2019-04-11 02:22:51', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (811, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/70ef3773-daf3-4d37-ab62-b719f3a9d455.png', 'upload/mall/goods/20190411/65/70ef3773-daf3-4d37-ab62-b719f3a9d455.png', NULL, '2019-04-11 02:22:51', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (812, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/75210bdb-a75e-4304-84c9-18ce1b92a9a9.png', 'upload/mall/goods/20190411/65/75210bdb-a75e-4304-84c9-18ce1b92a9a9.png', NULL, '2019-04-11 02:22:51', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (813, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/8f0d1a7b-1a1b-4c6f-af3b-d1ce07123da2.png', 'upload/mall/goods/20190411/65/8f0d1a7b-1a1b-4c6f-af3b-d1ce07123da2.png', NULL, '2019-04-11 02:22:52', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (814, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/65b1b483-11cd-4d7d-804d-a2e603b329b6.png', 'upload/mall/goods/20190411/65/65b1b483-11cd-4d7d-804d-a2e603b329b6.png', NULL, '2019-04-11 02:22:52', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (815, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/6f6c9d99-45d5-4a11-8d92-4c218f07e119.png', 'upload/mall/goods/20190411/65/6f6c9d99-45d5-4a11-8d92-4c218f07e119.png', NULL, '2019-04-11 02:22:52', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (816, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/bdb49ef1-5881-4514-b068-7f29a149187b.png', 'upload/mall/goods/20190411/65/bdb49ef1-5881-4514-b068-7f29a149187b.png', NULL, '2019-04-11 02:22:52', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (817, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/bc078641-fc80-4758-b14c-ba72297af80f.png', 'upload/mall/goods/20190411/65/bc078641-fc80-4758-b14c-ba72297af80f.png', NULL, '2019-04-11 02:22:52', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (818, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/d73a00a9-e40d-4069-9152-b929c87ee4b9.png', 'upload/mall/goods/20190411/65/d73a00a9-e40d-4069-9152-b929c87ee4b9.png', NULL, '2019-04-11 02:22:52', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (819, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/235301e0-1534-4f43-8fee-797e74f1fbea.png', 'upload/mall/goods/20190411/65/235301e0-1534-4f43-8fee-797e74f1fbea.png', NULL, '2019-04-11 02:22:52', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (820, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/7b83967b-d552-4b76-bc98-41df7d6d5a48.png', 'upload/mall/goods/20190411/65/7b83967b-d552-4b76-bc98-41df7d6d5a48.png', NULL, '2019-04-11 02:22:52', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (821, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/21ceeee3-b4dc-4d21-b1c1-eb5988d9945c.png', 'upload/mall/goods/20190411/65/21ceeee3-b4dc-4d21-b1c1-eb5988d9945c.png', NULL, '2019-04-11 02:22:52', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (822, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/0541f73d-6693-4d65-8da6-18c9e985299f.png', 'upload/mall/goods/20190411/65/0541f73d-6693-4d65-8da6-18c9e985299f.png', NULL, '2019-04-11 02:22:55', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (823, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/e0b754bc-8949-41ad-b673-c02d228b5565.png', 'upload/mall/goods/20190411/65/e0b754bc-8949-41ad-b673-c02d228b5565.png', NULL, '2019-04-11 02:22:55', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (824, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/6cfe7cc5-dcb7-4712-a345-e4799de53a86.png', 'upload/mall/goods/20190411/65/6cfe7cc5-dcb7-4712-a345-e4799de53a86.png', NULL, '2019-04-11 02:22:55', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (825, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/51a51bef-93f6-452d-a7f8-b57230e26eec.png', 'upload/mall/goods/20190411/65/51a51bef-93f6-452d-a7f8-b57230e26eec.png', NULL, '2019-04-11 02:22:55', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (826, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/3e61dea1-8bd3-4e64-89ce-aa4298f97ba2.png', 'upload/mall/goods/20190411/65/3e61dea1-8bd3-4e64-89ce-aa4298f97ba2.png', NULL, '2019-04-11 02:22:56', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (827, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/e2946d10-f18b-40f8-ba2d-958b8db61f1b.png', 'upload/mall/goods/20190411/65/e2946d10-f18b-40f8-ba2d-958b8db61f1b.png', NULL, '2019-04-11 02:22:56', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (828, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/034cbbf5-185c-4a67-8de9-b15acabbf8a5.png', 'upload/mall/goods/20190411/65/034cbbf5-185c-4a67-8de9-b15acabbf8a5.png', NULL, '2019-04-11 02:22:56', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (829, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/28219f9a-a861-4710-bc3c-822b5a7f600e.png', 'upload/mall/goods/20190411/65/28219f9a-a861-4710-bc3c-822b5a7f600e.png', NULL, '2019-04-11 02:22:56', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (830, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/9657a367-b0c9-4b70-8d4a-8c633b282a8e.png', 'upload/mall/goods/20190411/65/9657a367-b0c9-4b70-8d4a-8c633b282a8e.png', NULL, '2019-04-11 02:22:56', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (831, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/62bcfc12-af6e-41ec-ad82-3cee1776c0ea.png', 'upload/mall/goods/20190411/65/62bcfc12-af6e-41ec-ad82-3cee1776c0ea.png', NULL, '2019-04-11 02:22:56', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (832, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/d9828b68-55ac-43bf-858d-3a64df0912be.png', 'upload/mall/goods/20190411/65/d9828b68-55ac-43bf-858d-3a64df0912be.png', NULL, '2019-04-11 02:22:57', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (833, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/3fcc8558-611a-4d46-b8dd-be7c4e955832.png', 'upload/mall/goods/20190411/65/3fcc8558-611a-4d46-b8dd-be7c4e955832.png', NULL, '2019-04-11 02:22:57', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (834, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/4cee0eba-2642-47bd-a3b3-c118840430cd.png', 'upload/mall/goods/20190411/65/4cee0eba-2642-47bd-a3b3-c118840430cd.png', NULL, '2019-04-11 02:22:57', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (835, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/08220837-0a61-45a4-a97a-d10c69794d35.png', 'upload/mall/goods/20190411/65/08220837-0a61-45a4-a97a-d10c69794d35.png', NULL, '2019-04-11 02:22:57', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (836, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/e71bc539-e05b-4036-9343-83dfa3d3765a.png', 'upload/mall/goods/20190411/65/e71bc539-e05b-4036-9343-83dfa3d3765a.png', NULL, '2019-04-11 02:22:57', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (837, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/35e6d0b8-f86a-4172-ad34-418554e769bd.png', 'upload/mall/goods/20190411/65/35e6d0b8-f86a-4172-ad34-418554e769bd.png', NULL, '2019-04-11 02:22:57', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (838, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/b9f95cd1-8ed0-46d9-b10a-c8611728e241.png', 'upload/mall/goods/20190411/65/b9f95cd1-8ed0-46d9-b10a-c8611728e241.png', NULL, '2019-04-11 02:23:13', 1, 'image.png', 1, 126272, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (839, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/e16d925b-37f2-4b6d-be74-1454648aaecc.png', 'upload/mall/goods/20190411/65/e16d925b-37f2-4b6d-be74-1454648aaecc.png', NULL, '2019-04-11 02:23:14', 1, 'image.png', 1, 126272, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (840, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/1b4df9e2-539d-40a5-a784-a03fa88ca477.png', 'upload/mall/goods/20190411/65/1b4df9e2-539d-40a5-a784-a03fa88ca477.png', NULL, '2019-04-11 02:23:15', 1, 'image.png', 1, 126272, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (841, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/00b6e05e-926f-431f-aba7-54cc31e81d72.png', 'upload/mall/goods/20190411/65/00b6e05e-926f-431f-aba7-54cc31e81d72.png', NULL, '2019-04-11 02:23:15', 1, 'image.png', 1, 126272, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (842, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/09ba22db-cedc-459c-85e2-ba356d929325.png', 'upload/mall/goods/20190411/65/09ba22db-cedc-459c-85e2-ba356d929325.png', NULL, '2019-04-11 02:23:15', 1, 'image.png', 1, 126272, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (843, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/ff3b2b86-0e8c-4a70-b010-0db68fd63cbe.png', 'upload/mall/goods/20190411/65/ff3b2b86-0e8c-4a70-b010-0db68fd63cbe.png', NULL, '2019-04-11 02:23:16', 1, 'image.png', 1, 126272, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (844, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/01a363a6-8599-42d0-a4a5-f7635bf7d77a.png', 'upload/mall/goods/20190411/65/01a363a6-8599-42d0-a4a5-f7635bf7d77a.png', NULL, '2019-04-11 02:23:20', 1, 'image.png', 1, 126272, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (845, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/12b60318-36b1-4e98-b7ae-1dab287b9e0b.png', 'upload/mall/goods/20190411/65/12b60318-36b1-4e98-b7ae-1dab287b9e0b.png', NULL, '2019-04-11 02:23:20', 1, 'image.png', 1, 126272, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (846, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/5deaf4fa-718b-4acd-9934-d2e89f8e478f.png', 'upload/mall/goods/20190411/65/5deaf4fa-718b-4acd-9934-d2e89f8e478f.png', NULL, '2019-04-11 02:23:20', 1, 'image.png', 1, 126272, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (847, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/d8c55411-61df-45d9-a3cb-4368decc1d0c.png', 'upload/mall/goods/20190411/65/d8c55411-61df-45d9-a3cb-4368decc1d0c.png', NULL, '2019-04-11 02:23:21', 1, 'image.png', 1, 126272, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (848, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/6bcc7be1-804d-4131-9b32-f79d20ad024b.png', 'upload/mall/goods/20190411/65/6bcc7be1-804d-4131-9b32-f79d20ad024b.png', NULL, '2019-04-11 02:23:21', 1, 'image.png', 1, 126272, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (849, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/946eb978-3a4f-4da5-b2bc-68e72b8f45b0.png', 'upload/mall/goods/20190411/65/946eb978-3a4f-4da5-b2bc-68e72b8f45b0.png', NULL, '2019-04-11 02:23:21', 1, 'image.png', 1, 126272, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (850, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/477be964-99b0-492f-a9d8-33a072c361c7.png', 'upload/mall/goods/20190411/65/477be964-99b0-492f-a9d8-33a072c361c7.png', NULL, '2019-04-11 02:23:22', 1, 'image.png', 1, 126272, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (851, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/2ca4de6f-20b9-4a71-9182-cb8258aea334.png', 'upload/mall/goods/20190411/65/2ca4de6f-20b9-4a71-9182-cb8258aea334.png', NULL, '2019-04-11 02:24:40', 1, 'image.png', 1, 126272, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (852, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/78c8c05f-60d2-4d20-b01d-dc5c50490a1a.png', 'upload/mall/goods/20190411/65/78c8c05f-60d2-4d20-b01d-dc5c50490a1a.png', NULL, '2019-04-11 02:24:41', 1, 'image.png', 1, 126272, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (853, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/befbda36-e373-43e0-91a1-e2d4a89f771d.png', 'upload/mall/goods/20190411/65/befbda36-e373-43e0-91a1-e2d4a89f771d.png', NULL, '2019-04-11 02:24:41', 1, 'image.png', 1, 126272, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (854, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/f7a452bd-5480-4766-bb0a-1a8f74e35359.png', 'upload/mall/goods/20190411/65/f7a452bd-5480-4766-bb0a-1a8f74e35359.png', NULL, '2019-04-11 02:26:47', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (855, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/64ebc83e-5396-4210-9516-a8059ca63c31.png', 'upload/mall/goods/20190411/65/64ebc83e-5396-4210-9516-a8059ca63c31.png', NULL, '2019-04-11 02:26:49', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (856, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/7f556844-43ee-48a6-9c2f-3dc5cd999679.png', 'upload/mall/goods/20190411/65/7f556844-43ee-48a6-9c2f-3dc5cd999679.png', NULL, '2019-04-11 02:26:49', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (857, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/b755eba5-a8ca-4a3e-9af1-861d3ff42047.png', 'upload/mall/goods/20190411/65/b755eba5-a8ca-4a3e-9af1-861d3ff42047.png', NULL, '2019-04-11 02:26:49', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (858, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/2bb91165-eb55-4adb-b3d1-d1db62071a2e.png', 'upload/mall/goods/20190411/65/2bb91165-eb55-4adb-b3d1-d1db62071a2e.png', NULL, '2019-04-11 02:26:49', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (859, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/72c35dc3-0f3b-4743-8980-d48a28ebc746.png', 'upload/mall/goods/20190411/65/72c35dc3-0f3b-4743-8980-d48a28ebc746.png', NULL, '2019-04-11 02:26:50', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (860, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/36391ded-1b0a-4068-9203-bbcae912ba7c.png', 'upload/mall/goods/20190411/65/36391ded-1b0a-4068-9203-bbcae912ba7c.png', NULL, '2019-04-11 02:26:50', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (861, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/3e52d9b3-e3d7-4074-a762-b42d6f356c0c.png', 'upload/mall/goods/20190411/65/3e52d9b3-e3d7-4074-a762-b42d6f356c0c.png', NULL, '2019-04-11 02:26:50', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (862, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/bd44741b-2096-4126-83f2-c8d639134549.png', 'upload/mall/goods/20190411/65/bd44741b-2096-4126-83f2-c8d639134549.png', NULL, '2019-04-11 02:26:51', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (863, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/4bed9291-b227-497f-9dbc-82ac71c920a8.png', 'upload/mall/goods/20190411/65/4bed9291-b227-497f-9dbc-82ac71c920a8.png', NULL, '2019-04-11 02:26:51', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (864, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/82954a50-584a-4388-bdc5-b412b0a5706e.png', 'upload/mall/goods/20190411/65/82954a50-584a-4388-bdc5-b412b0a5706e.png', NULL, '2019-04-11 02:26:51', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (865, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/95584344-c92c-4acf-b3d7-0b84b373f8bc.png', 'upload/mall/goods/20190411/65/95584344-c92c-4acf-b3d7-0b84b373f8bc.png', NULL, '2019-04-11 02:26:52', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (866, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/a7e5a3ec-fe3b-47c1-8367-3efb40ed378e.png', 'upload/mall/goods/20190411/65/a7e5a3ec-fe3b-47c1-8367-3efb40ed378e.png', NULL, '2019-04-11 02:26:52', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (867, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/18c0e823-2044-4a26-8f2c-dee11984d3fc.png', 'upload/mall/goods/20190411/65/18c0e823-2044-4a26-8f2c-dee11984d3fc.png', NULL, '2019-04-11 02:26:52', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (868, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/00776a0b-9401-4dd3-bc2e-b37ce39960a0.png', 'upload/mall/goods/20190411/65/00776a0b-9401-4dd3-bc2e-b37ce39960a0.png', NULL, '2019-04-11 02:26:53', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (869, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/b019b881-9d9b-4de2-a5a1-f556b28deff0.png', 'upload/mall/goods/20190411/65/b019b881-9d9b-4de2-a5a1-f556b28deff0.png', NULL, '2019-04-11 02:26:53', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (870, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/ad0c5850-2033-4022-b590-ffca5f2fc636.png', 'upload/mall/goods/20190411/65/ad0c5850-2033-4022-b590-ffca5f2fc636.png', NULL, '2019-04-11 02:26:53', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (871, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/c120d713-53f4-45f6-bfd7-77b5b4b49caa.png', 'upload/mall/goods/20190411/65/c120d713-53f4-45f6-bfd7-77b5b4b49caa.png', NULL, '2019-04-11 02:26:54', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (872, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/bd00e5eb-7395-4e9b-afa1-7e85c203a5d6.png', 'upload/mall/goods/20190411/65/bd00e5eb-7395-4e9b-afa1-7e85c203a5d6.png', NULL, '2019-04-11 02:26:54', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (873, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/7eff1c5e-688b-4f0c-bd40-76b1e43345f2.png', 'upload/mall/goods/20190411/65/7eff1c5e-688b-4f0c-bd40-76b1e43345f2.png', NULL, '2019-04-11 02:26:54', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (874, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/90abfde8-78bf-439a-850f-674e1c1ae98b.png', 'upload/mall/goods/20190411/65/90abfde8-78bf-439a-850f-674e1c1ae98b.png', NULL, '2019-04-11 02:26:54', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (875, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/b12abfed-368c-42be-b7a5-34cbc99116d2.png', 'upload/mall/goods/20190411/65/b12abfed-368c-42be-b7a5-34cbc99116d2.png', NULL, '2019-04-11 02:26:55', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (876, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/c496cbad-fe4f-4b98-96e8-fb170b85af51.png', 'upload/mall/goods/20190411/65/c496cbad-fe4f-4b98-96e8-fb170b85af51.png', NULL, '2019-04-11 02:26:55', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (877, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/a8f8aede-f492-42a6-90f2-908974cddc3a.png', 'upload/mall/goods/20190411/65/a8f8aede-f492-42a6-90f2-908974cddc3a.png', NULL, '2019-04-11 02:26:55', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (878, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/6352f94e-4273-4385-8eda-965f5a5a1dbf.png', 'upload/mall/goods/20190411/65/6352f94e-4273-4385-8eda-965f5a5a1dbf.png', NULL, '2019-04-11 02:26:56', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (879, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/332d021f-3223-40ab-95f4-b90d2762b52b.png', 'upload/mall/goods/20190411/65/332d021f-3223-40ab-95f4-b90d2762b52b.png', NULL, '2019-04-11 02:26:56', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (880, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/09293867-608a-4ce3-a4b3-786aaa2becbc.png', 'upload/mall/goods/20190411/65/09293867-608a-4ce3-a4b3-786aaa2becbc.png', NULL, '2019-04-11 02:26:56', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (881, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/5a914557-772a-4372-a368-720ff31dd2a8.png', 'upload/mall/goods/20190411/65/5a914557-772a-4372-a368-720ff31dd2a8.png', NULL, '2019-04-11 02:26:57', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (882, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/cf4eda34-b061-40c9-8465-8a9709e30c7f.png', 'upload/mall/goods/20190411/65/cf4eda34-b061-40c9-8465-8a9709e30c7f.png', NULL, '2019-04-11 02:26:57', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (883, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/cb5216cb-7220-487c-b887-286b6e0c1fbc.png', 'upload/mall/goods/20190411/65/cb5216cb-7220-487c-b887-286b6e0c1fbc.png', NULL, '2019-04-11 02:26:57', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (884, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/10c8754f-78f0-4a97-ba79-6391dc0ff6c8.png', 'upload/mall/goods/20190411/65/10c8754f-78f0-4a97-ba79-6391dc0ff6c8.png', NULL, '2019-04-11 02:26:58', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (885, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/38048c49-b8ae-49d5-bc47-d12d121ea891.png', 'upload/mall/goods/20190411/65/38048c49-b8ae-49d5-bc47-d12d121ea891.png', NULL, '2019-04-11 02:26:58', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (886, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/075ed42a-add1-4c90-bac3-508645e6e92c.png', 'upload/mall/goods/20190411/65/075ed42a-add1-4c90-bac3-508645e6e92c.png', NULL, '2019-04-11 02:26:59', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (887, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/f35fad83-7b12-4f69-a958-16458e6c9e77.png', 'upload/mall/goods/20190411/65/f35fad83-7b12-4f69-a958-16458e6c9e77.png', NULL, '2019-04-11 02:26:59', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (888, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/5590665e-3cf5-4687-8b6b-5e1e481ee445.png', 'upload/mall/goods/20190411/65/5590665e-3cf5-4687-8b6b-5e1e481ee445.png', NULL, '2019-04-11 02:26:59', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (889, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/1d9f62ac-ad4b-4429-a677-8c8191e1baca.png', 'upload/mall/goods/20190411/65/1d9f62ac-ad4b-4429-a677-8c8191e1baca.png', NULL, '2019-04-11 02:27:00', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (890, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/78f3d6b4-a5e3-45c3-be37-cb7af4ba2004.png', 'upload/mall/goods/20190411/65/78f3d6b4-a5e3-45c3-be37-cb7af4ba2004.png', NULL, '2019-04-11 02:27:00', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (891, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/50686e1c-8e1b-4142-8f83-13ec6fee5ac1.png', 'upload/mall/goods/20190411/65/50686e1c-8e1b-4142-8f83-13ec6fee5ac1.png', NULL, '2019-04-11 02:27:01', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (892, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/d729daaa-7666-4443-9831-ae37d4395e71.png', 'upload/mall/goods/20190411/65/d729daaa-7666-4443-9831-ae37d4395e71.png', NULL, '2019-04-11 02:27:01', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (893, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/eedac4b8-ad4d-4947-b011-73c93587b184.png', 'upload/mall/goods/20190411/65/eedac4b8-ad4d-4947-b011-73c93587b184.png', NULL, '2019-04-11 02:27:01', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (894, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/be34ee4a-2bc1-40b0-9c0f-2fc3fe3f8cb5.png', 'upload/mall/goods/20190411/65/be34ee4a-2bc1-40b0-9c0f-2fc3fe3f8cb5.png', NULL, '2019-04-11 02:27:02', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (895, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/bcc54953-03de-447c-936f-d827af68d50a.png', 'upload/mall/goods/20190411/65/bcc54953-03de-447c-936f-d827af68d50a.png', NULL, '2019-04-11 02:27:02', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (896, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/f004fcf5-f452-450f-82d0-d0bf09ac7927.png', 'upload/mall/goods/20190411/65/f004fcf5-f452-450f-82d0-d0bf09ac7927.png', NULL, '2019-04-11 02:27:02', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (897, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/7c3aee7d-0b5d-4aac-b8f4-6ab8cbf8887b.png', 'upload/mall/goods/20190411/65/7c3aee7d-0b5d-4aac-b8f4-6ab8cbf8887b.png', NULL, '2019-04-11 02:27:03', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (898, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/01778142-0842-4dc7-8567-522aa6b0edae.png', 'upload/mall/goods/20190411/65/01778142-0842-4dc7-8567-522aa6b0edae.png', NULL, '2019-04-11 02:27:03', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (899, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/b3b42c7d-c128-49bc-8066-b2057e808e53.png', 'upload/mall/goods/20190411/65/b3b42c7d-c128-49bc-8066-b2057e808e53.png', NULL, '2019-04-11 02:27:04', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (900, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/765b59f3-2c74-4279-8e93-40da6abd0d40.png', 'upload/mall/goods/20190411/65/765b59f3-2c74-4279-8e93-40da6abd0d40.png', NULL, '2019-04-11 02:27:04', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (901, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/49db5f14-83e3-41a6-a852-dbd3a5133379.png', 'upload/mall/goods/20190411/65/49db5f14-83e3-41a6-a852-dbd3a5133379.png', NULL, '2019-04-11 02:27:04', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (902, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/b46a7b04-e52d-442f-a6d0-ce6e9b58bb83.png', 'upload/mall/goods/20190411/65/b46a7b04-e52d-442f-a6d0-ce6e9b58bb83.png', NULL, '2019-04-11 02:27:04', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (903, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/40fadca7-2503-479d-ab63-97cf4e04ba23.png', 'upload/mall/goods/20190411/65/40fadca7-2503-479d-ab63-97cf4e04ba23.png', NULL, '2019-04-11 02:27:05', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (904, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/e80d7d95-b345-4194-af0a-53e611b6df80.png', 'upload/mall/goods/20190411/65/e80d7d95-b345-4194-af0a-53e611b6df80.png', NULL, '2019-04-11 02:27:05', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (905, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/d22ed3c1-2fc7-4dcd-a815-7f8f2181c078.png', 'upload/mall/goods/20190411/65/d22ed3c1-2fc7-4dcd-a815-7f8f2181c078.png', NULL, '2019-04-11 02:27:05', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (906, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/007e157b-cb75-432b-9c96-b2b9639f4810.png', 'upload/mall/goods/20190411/65/007e157b-cb75-432b-9c96-b2b9639f4810.png', NULL, '2019-04-11 02:27:06', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (907, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/48bdbc31-aad8-4e85-8f72-32c37187f8b1.png', 'upload/mall/goods/20190411/65/48bdbc31-aad8-4e85-8f72-32c37187f8b1.png', NULL, '2019-04-11 02:27:06', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (908, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/415ad756-4090-405c-8afc-08cfe1b85fec.png', 'upload/mall/goods/20190411/65/415ad756-4090-405c-8afc-08cfe1b85fec.png', NULL, '2019-04-11 02:27:06', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (909, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/06022527-53ed-4c7e-a421-344325b8fc3f.png', 'upload/mall/goods/20190411/65/06022527-53ed-4c7e-a421-344325b8fc3f.png', NULL, '2019-04-11 02:27:07', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (910, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/ba22df62-f73a-40e7-94c5-f83e8fc4509b.png', 'upload/mall/goods/20190411/65/ba22df62-f73a-40e7-94c5-f83e8fc4509b.png', NULL, '2019-04-11 02:27:07', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (911, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/f7dccd1e-272c-4261-b953-7ff8af561ede.png', 'upload/mall/goods/20190411/65/f7dccd1e-272c-4261-b953-7ff8af561ede.png', NULL, '2019-04-11 02:27:07', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (912, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/99811779-600a-4671-a298-e40b87fb739f.png', 'upload/mall/goods/20190411/65/99811779-600a-4671-a298-e40b87fb739f.png', NULL, '2019-04-11 02:27:08', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (913, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/30ba01dd-e63c-4778-bdbd-d1433e0bceae.png', 'upload/mall/goods/20190411/65/30ba01dd-e63c-4778-bdbd-d1433e0bceae.png', NULL, '2019-04-11 02:27:08', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (914, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/78210865-7716-4301-adea-b6ceba65efb3.png', 'upload/mall/goods/20190411/65/78210865-7716-4301-adea-b6ceba65efb3.png', NULL, '2019-04-11 02:27:08', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (915, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/15189615-4091-4501-bb36-1e4320d86443.png', 'upload/mall/goods/20190411/65/15189615-4091-4501-bb36-1e4320d86443.png', NULL, '2019-04-11 02:27:09', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (916, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/edbfeab3-cb58-4d71-b799-173da6e0a494.png', 'upload/mall/goods/20190411/65/edbfeab3-cb58-4d71-b799-173da6e0a494.png', NULL, '2019-04-11 02:27:09', 1, 'image.png', 1, 147912, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (917, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/ba2de485-74d0-4fcc-8445-a6186cc8f0be.png', 'upload/mall/goods/20190411/65/ba2de485-74d0-4fcc-8445-a6186cc8f0be.png', NULL, '2019-04-11 02:28:39', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (918, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/51802bcb-bde6-400e-bb30-bc7638f18b97.png', 'upload/mall/goods/20190411/65/51802bcb-bde6-400e-bb30-bc7638f18b97.png', NULL, '2019-04-11 02:29:10', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (919, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/a4d7ccb0-ae32-4700-90d4-f7a1c0f67710.png', 'upload/mall/goods/20190411/65/a4d7ccb0-ae32-4700-90d4-f7a1c0f67710.png', NULL, '2019-04-11 02:29:14', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (920, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/5fc70860-aa98-4e42-a528-2497efdf2760.png', 'upload/mall/goods/20190411/65/5fc70860-aa98-4e42-a528-2497efdf2760.png', NULL, '2019-04-11 02:29:17', 1, 'image.png', 1, 48415, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (921, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/c519a68c-d198-48a4-847b-669995681c89.png', 'upload/mall/goods/20190411/65/c519a68c-d198-48a4-847b-669995681c89.png', NULL, '2019-04-11 02:35:21', 1, '222.png', 1, 59711, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (922, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/e9fcaab3-f1c3-4069-a1e9-886eb56fd51c.png', 'upload/mall/goods/20190411/65/e9fcaab3-f1c3-4069-a1e9-886eb56fd51c.png', NULL, '2019-04-11 02:35:32', 1, '333.png', 1, 59082, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (923, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/dba99419-08ec-4dec-9e19-b34188e7c25d.PNG', 'upload/mall/goods/20190411/65/dba99419-08ec-4dec-9e19-b34188e7c25d.PNG', NULL, '2019-04-11 02:35:41', 1, '557fbe1dc12f4e2086e6cb6879b6a593.PNG', 1, 5425, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (924, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/07fa789b-2582-4717-b225-95239c620172.png', 'upload/mall/goods/20190411/65/07fa789b-2582-4717-b225-95239c620172.png', NULL, '2019-04-11 02:35:53', 1, '222.png', 1, 59711, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (925, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190411/65/64752880-0be9-451e-aa11-a465ffb68240.png', 'upload/mall/goods/20190411/65/64752880-0be9-451e-aa11-a465ffb68240.png', NULL, '2019-04-11 02:36:31', 1, '333.png', 1, 59082, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (926, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190414/66/655d27a1-186c-4e02-b518-8bb590b15f3d.jpg', 'upload/mall/goods/20190414/66/655d27a1-186c-4e02-b518-8bb590b15f3d.jpg', NULL, '2019-04-14 20:40:35', 1, '_wKgBDVuJApeAPVs0AABRpi0LyuE300 (1).jpg', 1, 20902, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (927, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190414/66/71d14095-afac-4a9f-ba90-33800b23c2bb.jpg', 'upload/mall/goods/20190414/66/71d14095-afac-4a9f-ba90-33800b23c2bb.jpg', NULL, '2019-04-14 21:17:25', 1, '_wKgBDVu_I5OAU41qAABZ0Jdjv8w043.jpg', 1, 22992, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (928, 'c:/jbolt/upload\mall/goods/20190414/66/bc16aa1a-a627-47cd-8dda-ccc835d2eea8.jpg', 'c:/jbolt/upload/mall/goods/20190414/66/bc16aa1a-a627-47cd-8dda-ccc835d2eea8.jpg', NULL, '2019-04-14 21:24:03', 1, '_wKgBDVu_I5OAU41qAABZ0Jdjv8w043.jpg', 1, 22992, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (929, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190414/66/56dbaf57-1d83-46ae-ace2-26b8cb6add62.jpg', 'upload/mall/goods/20190414/66/56dbaf57-1d83-46ae-ace2-26b8cb6add62.jpg', NULL, '2019-04-14 22:48:26', 1, '_wKgBDVu_I5OAU41qAABZ0Jdjv8w043.jpg', 1, 22992, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (930, 'C:\dev\eclipsejeeneon3\work\jbolt\src\main\webapp\upload\mall/goods/20190414/67/937106a5-53b3-4218-a8c7-b41d93503b2f.jpg', 'upload/mall/goods/20190414/67/937106a5-53b3-4218-a8c7-b41d93503b2f.jpg', NULL, '2019-04-14 23:29:58', 1, '_wKgBDVuJApeAPVs0AABRpi0LyuE300 (1).jpg', 1, 20902, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (931, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\mall/goods/20190620/68/113497a1-f838-40b7-b785-99a414f2875b.png', 'upload/mall/goods/20190620/68/113497a1-f838-40b7-b785-99a414f2875b.png', NULL, '2019-06-20 02:12:50', 1, '微信截图_20190607131441.png', 1, 540344, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (932, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\mall/goods/20190620/68/58dd8388-5f89-4053-9281-018a971ccc11.png', 'upload/mall/goods/20190620/68/58dd8388-5f89-4053-9281-018a971ccc11.png', NULL, '2019-06-20 02:12:54', 1, '微信截图_20190607131441.png', 1, 540344, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (933, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\mall/goods/20190620/68/8712a064-e908-4faf-9db9-4a0c48661047.jpg', 'upload/mall/goods/20190620/68/8712a064-e908-4faf-9db9-4a0c48661047.jpg', NULL, '2019-06-20 02:13:13', 1, 'avatar.jpg', 1, 202612, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (934, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\mall/goods/20190620/69/bbda65e8-9cf8-4d59-a6be-261d357f4a6b.jpg', 'upload/mall/goods/20190620/69/bbda65e8-9cf8-4d59-a6be-261d357f4a6b.jpg', NULL, '2019-06-20 02:58:55', 1, 'avatar.jpg', 1, 202612, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (935, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\mall/goods/20190805/71/d60b18c1-c77d-466d-8d65-0ede12d47b65.png', 'upload/mall/goods/20190805/71/d60b18c1-c77d-466d-8d65-0ede12d47b65.png', NULL, '2019-08-05 12:06:02', 1, '10114_20190504113606.png', 1, 64461, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (936, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\mall/goods/20190805/71/a454e9cb-2cbc-41fb-84e2-c96269ece2bc.png', 'upload/mall/goods/20190805/71/a454e9cb-2cbc-41fb-84e2-c96269ece2bc.png', NULL, '2019-08-05 12:06:05', 1, '10114_20190504113606.png', 1, 64461, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (937, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\mall/goods/20190805/71/d6885ec0-380b-4d55-9a36-3e9e7cab1cfd.png', 'upload/mall/goods/20190805/71/d6885ec0-380b-4d55-9a36-3e9e7cab1cfd.png', NULL, '2019-08-05 12:06:09', 1, '112.png', 1, 976046, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (938, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\mall/goods/20190805/71/779476e4-7863-46f9-bb27-4245b908b35d.jpg', 'upload/mall/goods/20190805/71/779476e4-7863-46f9-bb27-4245b908b35d.jpg', NULL, '2019-08-05 12:06:58', 1, 'avatar_eyu.jpg', 1, 51391, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (939, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\mall/goods/20190819/99/6988732b-90f6-403c-ac85-128908630b80.jpg', 'upload/mall/goods/20190819/99/6988732b-90f6-403c-ac85-128908630b80.jpg', NULL, '2019-08-19 15:38:04', 1, 'avatar.jpg', 1, 202612, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (940, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\mall/goods/20190819/99/65da226e-d312-4a0d-8ee7-948c89ccfdb1.jpg', 'upload/mall/goods/20190819/99/65da226e-d312-4a0d-8ee7-948c89ccfdb1.jpg', NULL, '2019-08-19 15:38:27', 1, 'avatar.jpg', 1, 202612, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (941, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\mall/goods/20190819/99/7dbb23b0-fcd8-447c-b83d-e6d1f2300d4c.jpg', 'upload/mall/goods/20190819/99/7dbb23b0-fcd8-447c-b83d-e6d1f2300d4c.jpg', NULL, '2019-08-19 15:38:30', 1, 'avatar.jpg', 1, 202612, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (942, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\mall/goods/20190819/108/3399d8e4-ad5a-4e79-980e-54706a422af4.jpg', 'upload/mall/goods/20190819/108/3399d8e4-ad5a-4e79-980e-54706a422af4.jpg', NULL, '2019-08-19 18:11:37', 1, 'avatar.jpg', 1, 202612, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (943, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\mall/goods/20190821/115/12430a0c-8eb4-4b51-abe1-c02ed5eba927.png', 'upload/mall/goods/20190821/115/12430a0c-8eb4-4b51-abe1-c02ed5eba927.png', NULL, '2019-08-21 13:09:01', 1, '333.png', 1, 106647, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (944, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190828/16882c35-19d5-48c9-a0d7-3e41e1776f2a.png', 'upload/demo/editor/20190828/16882c35-19d5-48c9-a0d7-3e41e1776f2a.png', NULL, '2019-08-28 16:05:50', 1, '1566699989506.png', 1, 11984, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (945, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190828/9d0c2da6-fb80-4dfd-a708-cfc5bd41ff01.png', 'upload/demo/editor/20190828/9d0c2da6-fb80-4dfd-a708-cfc5bd41ff01.png', NULL, '2019-08-28 16:06:57', 1, '1566699989506.png', 1, 11984, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (946, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190828/b1db884e-385c-4438-a9c9-1510468f1d01.jpg', 'upload/demo/editor/20190828/b1db884e-385c-4438-a9c9-1510468f1d01.jpg', NULL, '2019-08-28 16:18:20', 1, 'gh_3dc91b668ea9_344.jpg', 1, 72126, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (947, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190828/3a0c1666-a8b6-4a84-839f-6a65a96ca5b6.png', 'upload/demo/editor/20190828/3a0c1666-a8b6-4a84-839f-6a65a96ca5b6.png', NULL, '2019-08-28 16:31:23', 1, '1566699989506.png', 1, 11984, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (948, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190829/6738ffd2-24ec-4174-be12-a889f028a94b.jpg', 'upload/demo/editor/20190829/6738ffd2-24ec-4174-be12-a889f028a94b.jpg', NULL, '2019-08-29 01:17:09', 1, 'avatar.jpg', 1, 202612, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (949, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190829/9a110d3d-6f84-4854-ac38-3d87fee5a734.jpeg', 'upload/demo/editor/20190829/9a110d3d-6f84-4854-ac38-3d87fee5a734.jpeg', NULL, '2019-08-29 01:17:27', 1, 'a8433299c4d249f6a85a90ee3c3d0d42.jpeg', 1, 29495, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (950, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190829/26fd17e4-cd8c-4201-972f-17fdc0bc1929.jpg', 'upload/demo/editor/20190829/26fd17e4-cd8c-4201-972f-17fdc0bc1929.jpg', NULL, '2019-08-29 01:20:05', 1, 'avatar.jpg', 1, 202612, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (951, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190829/ddd06bdf-39ad-48bb-bb3a-fbf4cb20d782.jpg', 'upload/demo/editor/20190829/ddd06bdf-39ad-48bb-bb3a-fbf4cb20d782.jpg', NULL, '2019-08-29 01:22:16', 1, 'avatar.jpg', 1, 202612, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (952, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190829/5efdb845-3052-4214-9cb4-f7792bd939a3.jpg', 'upload/demo/editor/20190829/5efdb845-3052-4214-9cb4-f7792bd939a3.jpg', NULL, '2019-08-29 01:22:30', 1, 'avatar.jpg', 1, 202612, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (953, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190829/9250522e-98fe-4266-9c27-11b6f125fa44.jpg', 'upload/demo/editor/20190829/9250522e-98fe-4266-9c27-11b6f125fa44.jpg', NULL, '2019-08-29 01:22:48', 1, '20170911182528696.jpg', 1, 18496, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (954, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190829/b20b3eaf-0524-486c-8ab5-57975694e9a5.jpg', 'upload/demo/editor/20190829/b20b3eaf-0524-486c-8ab5-57975694e9a5.jpg', NULL, '2019-08-29 01:24:53', 1, 'avatar.jpg', 1, 202612, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (955, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190829/fba56798-2fed-4ef4-83fe-a1da4cedfd37.jpg', 'upload/demo/editor/20190829/fba56798-2fed-4ef4-83fe-a1da4cedfd37.jpg', NULL, '2019-08-29 01:26:18', 1, 'avatar.jpg', 1, 202612, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (956, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190829/9055b2d7-8dce-4ea8-95b3-cbf0703f459f.jpg', 'upload/demo/editor/20190829/9055b2d7-8dce-4ea8-95b3-cbf0703f459f.jpg', NULL, '2019-08-29 01:26:29', 1, 'avatar.jpg', 1, 202612, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (957, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190829/8173f6da-8f2e-48d4-8ed6-de84aaca7b4e.jpg', 'upload/demo/editor/20190829/8173f6da-8f2e-48d4-8ed6-de84aaca7b4e.jpg', NULL, '2019-08-29 01:26:42', 1, 'avatar.jpg', 1, 202612, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (958, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190829/2c856ff7-399e-47b4-9f64-9447596440d5.jpg', 'upload/demo/editor/20190829/2c856ff7-399e-47b4-9f64-9447596440d5.jpg', NULL, '2019-08-29 01:27:20', 1, 'avatar.jpg', 1, 202612, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (959, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190829/b543253d-c64d-4e52-8502-4eacd53b6e91.jpg', 'upload/demo/editor/20190829/b543253d-c64d-4e52-8502-4eacd53b6e91.jpg', NULL, '2019-08-29 01:33:59', 1, '20170911182528696.jpg', 1, 18496, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (960, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190829/8b818159-0a39-4121-a1b8-1ba09c5d9a55.jpeg', 'upload/demo/editor/20190829/8b818159-0a39-4121-a1b8-1ba09c5d9a55.jpeg', NULL, '2019-08-29 01:34:12', 1, 'a8433299c4d249f6a85a90ee3c3d0d42.jpeg', 1, 29495, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (961, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190829/bf64f359-e287-4ea2-8d34-17fa2b18109e.jpg', 'upload/demo/editor/20190829/bf64f359-e287-4ea2-8d34-17fa2b18109e.jpg', NULL, '2019-08-29 01:38:13', 1, 'avatar.jpg', 1, 202612, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (962, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190829/c94efdc7-6bac-4249-bde2-a9e83384a4eb.jpg', 'upload/demo/editor/20190829/c94efdc7-6bac-4249-bde2-a9e83384a4eb.jpg', NULL, '2019-08-29 02:30:29', 1, 'avatar.jpg', 1, 202612, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (963, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/4e8f6f79-987c-4c13-8d72-c391f60d7f26.png', 'upload/demo/editor/20190901/4e8f6f79-987c-4c13-8d72-c391f60d7f26.png', NULL, '2019-09-01 17:44:02', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (964, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/6958f0b1-bdff-4c75-87b9-738aa30c410e.png', 'upload/demo/editor/20190901/6958f0b1-bdff-4c75-87b9-738aa30c410e.png', NULL, '2019-09-01 17:44:12', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (965, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/c7052d67-5580-4cc5-a93d-4a95af45627c.png', 'upload/demo/editor/20190901/c7052d67-5580-4cc5-a93d-4a95af45627c.png', NULL, '2019-09-01 17:44:15', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (966, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/534350ea-dc15-4dc0-a073-abaec6b29e72.png', 'upload/demo/editor/20190901/534350ea-dc15-4dc0-a073-abaec6b29e72.png', NULL, '2019-09-01 17:44:16', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (967, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/7302bc31-8253-43b2-97df-9d0ae6c18a46.png', 'upload/demo/editor/20190901/7302bc31-8253-43b2-97df-9d0ae6c18a46.png', NULL, '2019-09-01 17:44:16', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (968, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/5171cbb3-df3e-4331-b812-df67da5bf238.png', 'upload/demo/editor/20190901/5171cbb3-df3e-4331-b812-df67da5bf238.png', NULL, '2019-09-01 17:44:16', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (969, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/ccaf89a5-f9c7-43e2-822e-749907acfd6e.png', 'upload/demo/editor/20190901/ccaf89a5-f9c7-43e2-822e-749907acfd6e.png', NULL, '2019-09-01 17:44:16', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (970, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/745e5aef-d540-462a-9ae9-09f0e183aa1b.png', 'upload/demo/editor/20190901/745e5aef-d540-462a-9ae9-09f0e183aa1b.png', NULL, '2019-09-01 17:44:16', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (971, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/a2bb180b-401c-404e-adb5-e8815902ee3c.png', 'upload/demo/editor/20190901/a2bb180b-401c-404e-adb5-e8815902ee3c.png', NULL, '2019-09-01 17:44:16', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (972, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/75c6bdde-ca70-4406-a68e-7ccb13498b72.png', 'upload/demo/editor/20190901/75c6bdde-ca70-4406-a68e-7ccb13498b72.png', NULL, '2019-09-01 17:44:16', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (973, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/b4daed11-5189-41eb-ba53-7c80afa68f6f.png', 'upload/demo/editor/20190901/b4daed11-5189-41eb-ba53-7c80afa68f6f.png', NULL, '2019-09-01 17:44:16', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (974, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/1f98a41b-9c6d-4993-b464-24d122c1293c.png', 'upload/demo/editor/20190901/1f98a41b-9c6d-4993-b464-24d122c1293c.png', NULL, '2019-09-01 17:44:16', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (975, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/31a5cb13-9f04-40e6-bf9f-04489eeca400.png', 'upload/demo/editor/20190901/31a5cb13-9f04-40e6-bf9f-04489eeca400.png', NULL, '2019-09-01 17:44:16', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (976, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/a9ee3e2f-8882-458e-9389-d4a57ebc048c.png', 'upload/demo/editor/20190901/a9ee3e2f-8882-458e-9389-d4a57ebc048c.png', NULL, '2019-09-01 17:44:16', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (977, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/f21c509f-5fee-42d5-837a-dc3efc6465fa.png', 'upload/demo/editor/20190901/f21c509f-5fee-42d5-837a-dc3efc6465fa.png', NULL, '2019-09-01 17:44:16', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (978, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/e8dd80cb-a777-4347-b8e1-72bcc6a42f8a.png', 'upload/demo/editor/20190901/e8dd80cb-a777-4347-b8e1-72bcc6a42f8a.png', NULL, '2019-09-01 17:44:16', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (979, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/0eeb5cad-7bf1-49be-9d04-ea22643aa4bf.png', 'upload/demo/editor/20190901/0eeb5cad-7bf1-49be-9d04-ea22643aa4bf.png', NULL, '2019-09-01 17:44:16', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (980, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/01a52324-8c75-4571-afb8-de22a73b15df.png', 'upload/demo/editor/20190901/01a52324-8c75-4571-afb8-de22a73b15df.png', NULL, '2019-09-01 17:44:16', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (981, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/1e191070-be06-4b2c-ad2d-2f8d280a0eb6.png', 'upload/demo/editor/20190901/1e191070-be06-4b2c-ad2d-2f8d280a0eb6.png', NULL, '2019-09-01 17:44:16', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (982, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/4d0fc2b4-db26-4157-95c0-9bddeb1b3041.png', 'upload/demo/editor/20190901/4d0fc2b4-db26-4157-95c0-9bddeb1b3041.png', NULL, '2019-09-01 17:44:16', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (983, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/2644eb3e-2433-45cb-af3b-44465ca9b061.png', 'upload/demo/editor/20190901/2644eb3e-2433-45cb-af3b-44465ca9b061.png', NULL, '2019-09-01 17:44:16', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (984, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/3d941f76-3f7b-42d1-863a-d000d22371e6.png', 'upload/demo/editor/20190901/3d941f76-3f7b-42d1-863a-d000d22371e6.png', NULL, '2019-09-01 17:44:19', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (985, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/eb9f341f-2b5c-40e7-b555-6dfcb33e8fba.png', 'upload/demo/editor/20190901/eb9f341f-2b5c-40e7-b555-6dfcb33e8fba.png', NULL, '2019-09-01 17:44:20', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (986, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/f62dfd53-302c-4600-b3f3-499761b47fda.png', 'upload/demo/editor/20190901/f62dfd53-302c-4600-b3f3-499761b47fda.png', NULL, '2019-09-01 17:44:21', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (987, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/28f1e6a9-e9c3-4b70-96df-2ea4e1c0beea.png', 'upload/demo/editor/20190901/28f1e6a9-e9c3-4b70-96df-2ea4e1c0beea.png', NULL, '2019-09-01 17:44:22', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (988, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/3c3ea563-a997-478f-82e2-050cf714b1a5.png', 'upload/demo/editor/20190901/3c3ea563-a997-478f-82e2-050cf714b1a5.png', NULL, '2019-09-01 17:44:23', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (989, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/3b2924b3-92c6-416b-9a40-c974c4cee5ff.png', 'upload/demo/editor/20190901/3b2924b3-92c6-416b-9a40-c974c4cee5ff.png', NULL, '2019-09-01 17:44:23', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (990, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/5cbe4382-2d0d-4dbd-bec1-c32e98df4cc3.png', 'upload/demo/editor/20190901/5cbe4382-2d0d-4dbd-bec1-c32e98df4cc3.png', NULL, '2019-09-01 17:44:23', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (991, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/47dc87c1-dd23-45a3-8e13-85b21817ab72.png', 'upload/demo/editor/20190901/47dc87c1-dd23-45a3-8e13-85b21817ab72.png', NULL, '2019-09-01 17:44:23', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (992, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/190eeb7b-095d-4211-9b63-ab9bc1388c2f.png', 'upload/demo/editor/20190901/190eeb7b-095d-4211-9b63-ab9bc1388c2f.png', NULL, '2019-09-01 17:44:23', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (993, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/b3380363-6b48-4b12-91e1-b8330395748d.png', 'upload/demo/editor/20190901/b3380363-6b48-4b12-91e1-b8330395748d.png', NULL, '2019-09-01 17:44:23', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (994, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/fd3ebbbd-3b41-4e20-825b-eecf3c4edc10.png', 'upload/demo/editor/20190901/fd3ebbbd-3b41-4e20-825b-eecf3c4edc10.png', NULL, '2019-09-01 17:44:23', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (995, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/d76c8f9b-7465-4e41-b20e-18c7da1b3093.png', 'upload/demo/editor/20190901/d76c8f9b-7465-4e41-b20e-18c7da1b3093.png', NULL, '2019-09-01 17:44:23', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (996, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/f76d5c9a-3537-4c65-a8af-c06c2ed66dab.png', 'upload/demo/editor/20190901/f76d5c9a-3537-4c65-a8af-c06c2ed66dab.png', NULL, '2019-09-01 17:44:23', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (997, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/60b02701-c2ff-4098-b7df-6f0d6a0af5b2.png', 'upload/demo/editor/20190901/60b02701-c2ff-4098-b7df-6f0d6a0af5b2.png', NULL, '2019-09-01 17:44:23', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (998, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/d616fa27-0014-4a61-99d0-9756bb7b19c5.png', 'upload/demo/editor/20190901/d616fa27-0014-4a61-99d0-9756bb7b19c5.png', NULL, '2019-09-01 17:44:23', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (999, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/1897e2bc-b019-4614-a929-21ba38ef34bc.png', 'upload/demo/editor/20190901/1897e2bc-b019-4614-a929-21ba38ef34bc.png', NULL, '2019-09-01 17:44:23', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1000, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/917582ef-2808-4454-921a-c5ecdb4c5ddf.png', 'upload/demo/editor/20190901/917582ef-2808-4454-921a-c5ecdb4c5ddf.png', NULL, '2019-09-01 17:44:23', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1001, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/6aa89aa9-8f6c-4e7b-b00e-cfded801d144.png', 'upload/demo/editor/20190901/6aa89aa9-8f6c-4e7b-b00e-cfded801d144.png', NULL, '2019-09-01 17:44:23', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1002, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/239a5cb7-5067-4efc-a550-41a9ae80bbab.png', 'upload/demo/editor/20190901/239a5cb7-5067-4efc-a550-41a9ae80bbab.png', NULL, '2019-09-01 17:44:23', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1003, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/63b4e842-9ec2-4e68-9750-dfc1fb745636.png', 'upload/demo/editor/20190901/63b4e842-9ec2-4e68-9750-dfc1fb745636.png', NULL, '2019-09-01 17:44:23', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1004, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/4860c052-859c-4211-961c-8e104d26c7be.png', 'upload/demo/editor/20190901/4860c052-859c-4211-961c-8e104d26c7be.png', NULL, '2019-09-01 17:44:23', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1005, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/8d14cee4-8106-4d7a-b050-e81da8d06d13.png', 'upload/demo/editor/20190901/8d14cee4-8106-4d7a-b050-e81da8d06d13.png', NULL, '2019-09-01 17:44:23', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1006, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/28a96cda-ccc8-4926-ae6b-542b375b24cf.png', 'upload/demo/editor/20190901/28a96cda-ccc8-4926-ae6b-542b375b24cf.png', NULL, '2019-09-01 17:44:23', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1007, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/370ba088-a874-451f-947c-1743f7abea36.png', 'upload/demo/editor/20190901/370ba088-a874-451f-947c-1743f7abea36.png', NULL, '2019-09-01 17:44:23', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1008, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/553d6150-a200-4c7d-8e06-74723540c847.png', 'upload/demo/editor/20190901/553d6150-a200-4c7d-8e06-74723540c847.png', NULL, '2019-09-01 17:44:23', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1009, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/0725dac7-17fb-46b4-b8d6-fd65c61360ba.png', 'upload/demo/editor/20190901/0725dac7-17fb-46b4-b8d6-fd65c61360ba.png', NULL, '2019-09-01 17:44:23', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1010, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/70eb7dc4-b962-4f7b-bbc9-f13be2e5bcd8.png', 'upload/demo/editor/20190901/70eb7dc4-b962-4f7b-bbc9-f13be2e5bcd8.png', NULL, '2019-09-01 17:44:31', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1011, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/469225c0-6f0a-4734-95df-1d1e20e4905d.png', 'upload/demo/editor/20190901/469225c0-6f0a-4734-95df-1d1e20e4905d.png', NULL, '2019-09-01 17:44:32', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1012, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/fc877d45-9d33-4d46-ad19-00795aa024d7.png', 'upload/demo/editor/20190901/fc877d45-9d33-4d46-ad19-00795aa024d7.png', NULL, '2019-09-01 17:44:32', 1, 'image.png', 1, 4858, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1013, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\demo/editor/20190901/312d49e3-d1fc-4077-943d-06992175e6d5.png', 'upload/demo/editor/20190901/312d49e3-d1fc-4077-943d-06992175e6d5.png', NULL, '2019-09-01 17:44:44', 1, 'image.png', 1, 16524, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1014, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\neditor/image/20190903/dff02f86-e7b7-48db-bc48-aa59ee92702f.png', 'upload/neditor/image/20190903/dff02f86-e7b7-48db-bc48-aa59ee92702f.png', NULL, '2019-09-03 10:50:51', 1, 'enjouyeditor_First_Frame.png', 1, 80690, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1015, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\neditor/video/20190903/9c8b530b-6600-498d-b0b2-162983dc0bfc.mp4', 'upload/neditor/video/20190903/9c8b530b-6600-498d-b0b2-162983dc0bfc.mp4', NULL, '2019-09-03 10:56:10', 1, 'jboltlayer组件演示.mp4', 2, 2968231, NULL);
INSERT INTO "public"."jb_jbolt_file" VALUES (1016, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\summernote/image/20190903/332bc1b3-3fc9-4418-ba0f-474e34407e4b.png', 'upload/summernote/image/20190903/332bc1b3-3fc9-4418-ba0f-474e34407e4b.png', NULL, '2019-09-03 11:19:02', 1, 'jboltlayer组件演示_First_Frame.png', 1, 180052, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1017, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\neditor/image/20190903/6a09b4e8-4d30-4b2e-b83e-e943e833d071.png', 'upload/neditor/image/20190903/6a09b4e8-4d30-4b2e-b83e-e943e833d071.png', NULL, '2019-09-03 15:17:52', 1, 'image.png', 1, 167483, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1018, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\neditor/image/20190903/89c70dc2-7318-4cf5-86d1-0b6a64c0e482.png', 'upload/neditor/image/20190903/89c70dc2-7318-4cf5-86d1-0b6a64c0e482.png', NULL, '2019-09-03 15:17:58', 1, 'image.png', 1, 167483, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1019, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\neditor/image/20190903/5d3a6fff-39fd-4f96-a7f7-4ceda19add9a.png', 'upload/neditor/image/20190903/5d3a6fff-39fd-4f96-a7f7-4ceda19add9a.png', NULL, '2019-09-03 15:18:28', 1, 'image.png', 1, 167483, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1020, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\neditor/image/20190903/4478f4b6-331e-49ae-9362-ee443fb44930.png', 'upload/neditor/image/20190903/4478f4b6-331e-49ae-9362-ee443fb44930.png', NULL, '2019-09-03 15:18:43', 1, 'image.png', 1, 167483, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1021, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\neditor/image/20190903/b986f3d3-ffed-4d9e-b4d8-ee4c3a5b17ca.png', 'upload/neditor/image/20190903/b986f3d3-ffed-4d9e-b4d8-ee4c3a5b17ca.png', NULL, '2019-09-03 15:19:34', 1, 'image.png', 1, 167483, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1022, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\neditor/image/20190903/cb5bbcb7-cb18-4fff-b03e-1f7af2950039.png', 'upload/neditor/image/20190903/cb5bbcb7-cb18-4fff-b03e-1f7af2950039.png', NULL, '2019-09-03 15:19:44', 1, 'image.png', 1, 167483, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1023, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\neditor/image/20190903/02c21e32-d3cc-4342-870f-11090135f9bf.png', 'upload/neditor/image/20190903/02c21e32-d3cc-4342-870f-11090135f9bf.png', NULL, '2019-09-03 15:19:44', 1, 'image.png', 1, 167483, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1024, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\neditor/image/20190903/e74f9ef4-b785-45ba-923d-7f591653b404.png', 'upload/neditor/image/20190903/e74f9ef4-b785-45ba-923d-7f591653b404.png', NULL, '2019-09-03 15:19:44', 1, 'image.png', 1, 167483, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1025, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\neditor/image/20190903/431d3a31-bec0-495a-a63f-d270488de48b.png', 'upload/neditor/image/20190903/431d3a31-bec0-495a-a63f-d270488de48b.png', NULL, '2019-09-03 15:19:44', 1, 'image.png', 1, 167483, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1026, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\neditor/image/20190903/5f20c6fa-b976-4c94-a16a-c18761aeda56.png', 'upload/neditor/image/20190903/5f20c6fa-b976-4c94-a16a-c18761aeda56.png', NULL, '2019-09-03 15:19:45', 1, 'image.png', 1, 167483, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1027, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\neditor/image/20190903/a8ef71e5-68fe-4811-8cf4-5d4a2097235a.png', 'upload/neditor/image/20190903/a8ef71e5-68fe-4811-8cf4-5d4a2097235a.png', NULL, '2019-09-03 15:20:34', 1, 'image.png', 1, 8801, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1028, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\neditor/image/20190903/96299d2a-c33a-400e-a7d3-7983cb80415a.png', 'upload/neditor/image/20190903/96299d2a-c33a-400e-a7d3-7983cb80415a.png', NULL, '2019-09-03 15:52:18', 1, 'jboltlayer组件演示_First_Frame.png', 1, 180052, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1029, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\neditor/image/20190903/ed502387-2bf3-4914-b856-5563c5f09012.png', 'upload/neditor/image/20190903/ed502387-2bf3-4914-b856-5563c5f09012.png', NULL, '2019-09-03 16:36:05', 1, 'image.png', 1, 27264, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1030, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\neditor/image/20190903/3ec3ee3f-3de5-44a5-9b27-e4bb9462ddb8.png', 'upload/neditor/image/20190903/3ec3ee3f-3de5-44a5-9b27-e4bb9462ddb8.png', NULL, '2019-09-03 20:20:15', 1, 'jboltlayer组件演示_First_Frame.png', 1, 180052, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1031, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\neditor/image/20190903/9b027901-50a0-450f-b3b8-9632e030575c.png', 'upload/neditor/image/20190903/9b027901-50a0-450f-b3b8-9632e030575c.png', NULL, '2019-09-03 20:21:00', 1, '112.png', 1, 976046, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1032, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\neditor/video/20190903/69543985-5104-4080-8645-00e831d3e35b.mp4', 'upload/neditor/video/20190903/69543985-5104-4080-8645-00e831d3e35b.mp4', NULL, '2019-09-03 20:27:06', 1, 'test.mp4', 2, 1428764, NULL);
INSERT INTO "public"."jb_jbolt_file" VALUES (1033, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\neditor/video/20190903/98a27281-aa2c-46c6-aade-6dc473b84fc5.mp4', 'upload/neditor/video/20190903/98a27281-aa2c-46c6-aade-6dc473b84fc5.mp4', NULL, '2019-09-03 20:30:22', 1, 'test.mp4', 2, 1428764, NULL);
INSERT INTO "public"."jb_jbolt_file" VALUES (1034, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\neditor/video/20190903/2179fcbe-7743-43f2-bdde-5db0115a8fa7.mp4', 'upload/neditor/video/20190903/2179fcbe-7743-43f2-bdde-5db0115a8fa7.mp4', NULL, '2019-09-03 20:40:09', 1, 'test.mp4', 2, 1428764, NULL);
INSERT INTO "public"."jb_jbolt_file" VALUES (1035, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\neditor/image/20190912/bf89115b-c739-4037-93c0-f0b0510a5f1d.png', 'upload/neditor/image/20190912/bf89115b-c739-4037-93c0-f0b0510a5f1d.png', NULL, '2019-09-12 11:23:42', 1, 'scrawl-image.png', 1, 8677, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1036, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\neditor/video/20190912/fa044241-8eca-40e0-a1b6-e89c6603fe32.mp4', 'upload/neditor/video/20190912/fa044241-8eca-40e0-a1b6-e89c6603fe32.mp4', NULL, '2019-09-12 11:24:37', 1, 'test.mp4', 2, 1428764, NULL);
INSERT INTO "public"."jb_jbolt_file" VALUES (1037, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\mall/goods/20190921/112/2cbee0c1-4295-468b-a123-48b67a70cb4f.png', 'upload/mall/goods/20190921/112/2cbee0c1-4295-468b-a123-48b67a70cb4f.png', NULL, '2019-09-21 20:04:46', 1, '112.png', 1, 976046, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1038, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\mall/goods/20190921/112/8de511fd-98b7-46fc-abaf-20db838668fc.jpg', 'upload/mall/goods/20190921/112/8de511fd-98b7-46fc-abaf-20db838668fc.jpg', NULL, '2019-09-21 20:04:48', 1, '0002.jpg', 1, 19201, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (1039, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\mall/goods/20190921/112/202fc638-1651-4bfd-afe9-b24def215c1d.png', 'upload/mall/goods/20190921/112/202fc638-1651-4bfd-afe9-b24def215c1d.png', NULL, '2019-09-21 20:04:50', 1, '333.png', 1, 106647, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1040, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\mall/goods/20190921/112/66b7ef18-1a5b-475e-be7e-ec7e0c2fb998.jpg', 'upload/mall/goods/20190921/112/66b7ef18-1a5b-475e-be7e-ec7e0c2fb998.jpg', NULL, '2019-09-21 20:04:52', 1, '1.jpg', 1, 168640, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (1041, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\mall/goods/20190921/112/40aae6ea-c43c-406f-82b5-d619e7f24064.png', 'upload/mall/goods/20190921/112/40aae6ea-c43c-406f-82b5-d619e7f24064.png', NULL, '2019-09-21 20:06:00', 1, '10114_20190504113606.png', 1, 64461, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1042, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\neditor/image/20190930/820502c6-4bdc-442f-8783-3d1b4cccdd09.png', 'upload/neditor/image/20190930/820502c6-4bdc-442f-8783-3d1b4cccdd09.png', NULL, '2019-09-30 12:05:40', 1, '10114_20190504113606.png', 1, 64461, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1043, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\neditor/image/20190930/0f63ac6f-bc56-4241-8e38-c07af4e622cf.png', 'upload/neditor/image/20190930/0f63ac6f-bc56-4241-8e38-c07af4e622cf.png', NULL, '2019-09-30 12:16:17', 1, 'scrawl-image.png', 1, 4322, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1044, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\neditor/image/20190930/78530a3d-98f0-4802-8bb6-6a1255f6a77f.jpg', 'upload/neditor/image/20190930/78530a3d-98f0-4802-8bb6-6a1255f6a77f.jpg', NULL, '2019-09-30 12:17:30', 1, 'avatar_xianjin.jpg', 1, 26979, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (1045, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\neditor/image/20190930/14600c5e-7279-4bc3-af87-21057b2988c6.jpg', 'upload/neditor/image/20190930/14600c5e-7279-4bc3-af87-21057b2988c6.jpg', NULL, '2019-09-30 12:17:45', 1, 'avatar_qikange.jpg', 1, 53939, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (1046, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\neditor/image/20190930/e439fdaa-1c23-45b3-8641-cf959febc2f1.png', 'upload/neditor/image/20190930/e439fdaa-1c23-45b3-8641-cf959febc2f1.png', NULL, '2019-09-30 12:26:18', 1, 'scrawl-image.png', 1, 3805, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1047, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\neditor/image/20190930/b379febb-3205-4dab-9888-622a46e2a12d.png', 'upload/neditor/image/20190930/b379febb-3205-4dab-9888-622a46e2a12d.png', NULL, '2019-09-30 12:27:35', 1, 'scrawl-image.png', 1, 1874, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1048, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\mall/goods/20191110/130/e61cfdca-253a-4c78-ac35-dda744e08bb7.jpg', 'upload/mall/goods/20191110/130/e61cfdca-253a-4c78-ac35-dda744e08bb7.jpg', NULL, '2019-11-10 17:14:13', 1, '20170911182528696.jpg', 1, 18496, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (1049, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\mall/goods/20191110/130/66b069af-b2fc-4789-b361-e751e8096b3a.jpeg', 'upload/mall/goods/20191110/130/66b069af-b2fc-4789-b361-e751e8096b3a.jpeg', NULL, '2019-11-10 17:14:16', 1, 'a8433299c4d249f6a85a90ee3c3d0d42.jpeg', 1, 29495, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (1050, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\mall/goods/20191110/130/de9ecfdf-6dc9-4c4b-b3f4-4ce2c5a69c0e.jpg', 'upload/mall/goods/20191110/130/de9ecfdf-6dc9-4c4b-b3f4-4ce2c5a69c0e.jpg', NULL, '2019-11-10 17:14:18', 1, '20170911182528696.jpg', 1, 18496, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (1052, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\user/avatar/20191204/ba3763b4-64b9-470b-9a7f-2dc1c80c59f3.jpg', 'upload/user/avatar/20191204/ba3763b4-64b9-470b-9a7f-2dc1c80c59f3.jpg', NULL, '2019-12-04 17:16:00.897', 1, '1.jpg', 1, 168640, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (1053, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\user/avatar/20191206/7d8a75fd-9937-4141-9dd6-2fe0d86d830b.png', 'upload/user/avatar/20191206/7d8a75fd-9937-4141-9dd6-2fe0d86d830b.png', NULL, '2019-12-06 01:15:28.717', 1, '333.png', 1, 106647, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1054, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\user/avatar/20191206/741428b5-fe8b-4cd6-bafc-f5454dba6b1c.jpg', 'upload/user/avatar/20191206/741428b5-fe8b-4cd6-bafc-f5454dba6b1c.jpg', NULL, '2019-12-06 01:23:36.226', 1, '0002.jpg', 1, 19201, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (1055, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\user/avatar/20191206/40dd680e-054b-47e1-9c15-9fa79e9f2cae.jpg', 'upload/user/avatar/20191206/40dd680e-054b-47e1-9c15-9fa79e9f2cae.jpg', NULL, '2019-12-06 02:30:39.055', 1, '0002.jpg', 1, 19201, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (1056, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\user/avatar/20191206/1369e929-35fd-4155-b9d9-57f1a0ab42de.png', 'upload/user/avatar/20191206/1369e929-35fd-4155-b9d9-57f1a0ab42de.png', NULL, '2019-12-06 02:31:22.978', 1, '333.png', 1, 106647, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1057, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\user/avatar/20191206/5df5da44-e04c-40a6-abb9-52b7da151d96.jpg', 'upload/user/avatar/20191206/5df5da44-e04c-40a6-abb9-52b7da151d96.jpg', NULL, '2019-12-06 02:32:59.842', 1, '1.jpg', 1, 168640, 'jpg');
INSERT INTO "public"."jb_jbolt_file" VALUES (1058, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\mall/goods/20191209/129/c767dfb6-9caa-467c-9d83-1edddcc0c0e4.png', 'upload/mall/goods/20191209/129/c767dfb6-9caa-467c-9d83-1edddcc0c0e4.png', NULL, '2019-12-09 23:51:09.161', 1, '333.png', 1, 106647, 'png');
INSERT INTO "public"."jb_jbolt_file" VALUES (1059, 'C:\dev\gitcode\jbolt\src\main\webapp\upload\mall/goods/20191209/129/08dac5ff-ac73-41a5-9f11-ae55fd6502a2.jpg', 'upload/mall/goods/20191209/129/08dac5ff-ac73-41a5-9f11-ae55fd6502a2.jpg', NULL, '2019-12-09 23:51:11.921', 1, '1.jpg', 1, 168640, 'jpg');

-- ----------------------------
-- Table structure for jb_jbolt_version
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_jbolt_version";
CREATE TABLE "public"."jb_jbolt_version" (
  "id" int4 NOT NULL DEFAULT nextval('jb_jbolt_version_id_seq'::regclass),
  "version" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "publish_time" timestamp(6) NOT NULL,
  "is_new" char(1) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 0,
  "create_time" timestamp(6) NOT NULL,
  "user_id" int4 NOT NULL
)
;
COMMENT ON COLUMN "public"."jb_jbolt_version"."publish_time" IS '发布时间';
COMMENT ON COLUMN "public"."jb_jbolt_version"."is_new" IS '是否最新版';
COMMENT ON COLUMN "public"."jb_jbolt_version"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."jb_jbolt_version"."user_id" IS '用户ID';
COMMENT ON TABLE "public"."jb_jbolt_version" IS 'jbolt版本升级';

-- ----------------------------
-- Records of jb_jbolt_version
-- ----------------------------
INSERT INTO "public"."jb_jbolt_version" VALUES (10, '345345', '2019-09-10 00:00:00', '0', '2019-09-10 15:33:11', 1);
INSERT INTO "public"."jb_jbolt_version" VALUES (15, '水电费水电费第三方', '2019-09-10 00:00:00', '0', '2019-09-10 18:48:17', 1);
INSERT INTO "public"."jb_jbolt_version" VALUES (16, '水电费的说法', '2019-09-10 00:00:00', '0', '2019-09-10 18:48:21', 1);
INSERT INTO "public"."jb_jbolt_version" VALUES (17, '玩儿玩儿', '2019-09-10 00:00:00', '0', '2019-09-10 18:48:26', 1);
INSERT INTO "public"."jb_jbolt_version" VALUES (18, 'were无若', '2019-09-10 00:00:00', '0', '2019-09-10 18:48:30', 1);
INSERT INTO "public"."jb_jbolt_version" VALUES (19, '尔特瑞特让他', '2019-09-10 00:00:00', '0', '2019-09-10 18:48:34', 1);
INSERT INTO "public"."jb_jbolt_version" VALUES (20, '沃尔沃热', '2019-09-10 00:00:00', '0', '2019-09-10 18:48:39', 1);
INSERT INTO "public"."jb_jbolt_version" VALUES (21, '玩儿玩儿无热翁', '2019-09-10 00:00:00', '0', '2019-09-10 18:48:43', 1);
INSERT INTO "public"."jb_jbolt_version" VALUES (22, '玩儿玩儿', '2019-09-10 00:00:00', '0', '2019-09-10 18:48:56', 1);
INSERT INTO "public"."jb_jbolt_version" VALUES (23, '玩儿玩儿', '2019-09-10 00:00:00', '0', '2019-09-10 18:49:00', 1);
INSERT INTO "public"."jb_jbolt_version" VALUES (24, '吾尔文', '2019-09-10 00:00:00', '0', '2019-09-10 18:49:03', 1);
INSERT INTO "public"."jb_jbolt_version" VALUES (25, '热图尔特', '2019-09-10 00:00:00', '0', '2019-09-10 18:49:08', 1);
INSERT INTO "public"."jb_jbolt_version" VALUES (27, 'sdfsdf', '2019-09-10 00:00:00', '0', '2019-09-10 22:21:31', 1);
INSERT INTO "public"."jb_jbolt_version" VALUES (29, 'adasd', '2019-09-21 00:00:00', '0', '2019-09-21 21:46:37', 1);
INSERT INTO "public"."jb_jbolt_version" VALUES (30, '234324', '2019-11-10 00:00:00', '0', '2019-11-10 17:01:13', 1);
INSERT INTO "public"."jb_jbolt_version" VALUES (14, '345345345', '2019-09-10 00:00:00', '0', '2019-09-10 15:33:26', 1);
INSERT INTO "public"."jb_jbolt_version" VALUES (32, '123', '2019-12-09 00:00:00', '0', '2019-12-09 23:50:03.042', 1);
INSERT INTO "public"."jb_jbolt_version" VALUES (12, '345345', '2019-09-10 00:00:00', '0', '2019-09-10 15:33:18', 1);
INSERT INTO "public"."jb_jbolt_version" VALUES (13, '345345', '2019-09-10 00:00:00', '0', '2019-09-10 15:33:21', 1);

-- ----------------------------
-- Table structure for jb_jbolt_version_file
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_jbolt_version_file";
CREATE TABLE "public"."jb_jbolt_version_file" (
  "id" int4 NOT NULL DEFAULT nextval('jb_jbolt_version_file_id_seq'::regclass),
  "url" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "jbolt_version_id" int4 NOT NULL
)
;
COMMENT ON COLUMN "public"."jb_jbolt_version_file"."jbolt_version_id" IS 'jbolt版本ID';
COMMENT ON TABLE "public"."jb_jbolt_version_file" IS 'JBolt下载版本管理';

-- ----------------------------
-- Records of jb_jbolt_version_file
-- ----------------------------
INSERT INTO "public"."jb_jbolt_version_file" VALUES (7, 'http://www.jfinalxueyuan.com/jbolt/java.jar', 2);

-- ----------------------------
-- Table structure for jb_order
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_order";
CREATE TABLE "public"."jb_order" (
  "id" int4 NOT NULL DEFAULT nextval('jb_order_id_seq'::regclass),
  "order_no" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "create_time" timestamp(6) NOT NULL,
  "buyer_id" int4 NOT NULL,
  "buyer_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "update_time" timestamp(6) NOT NULL,
  "payment_time" timestamp(6),
  "consign_time" timestamp(6),
  "finish_time" timestamp(6),
  "close_time" timestamp(6),
  "buyer_message" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "buyer_rate" char(1) COLLATE "pg_catalog"."default" DEFAULT 0,
  "state" int4,
  "goods_amount" numeric(10,2) NOT NULL DEFAULT NULL::numeric,
  "post_fee" numeric(10,2) NOT NULL DEFAULT NULL::numeric,
  "payment_amount" numeric(10,2) NOT NULL DEFAULT NULL::numeric,
  "payment_type" int4 NOT NULL,
  "online_payment_type" int4,
  "close_type" int4,
  "close_uesr_id" int4
)
;
COMMENT ON COLUMN "public"."jb_order"."id" IS '主键ID';
COMMENT ON COLUMN "public"."jb_order"."order_no" IS '订单编号';
COMMENT ON COLUMN "public"."jb_order"."create_time" IS '下单时间';
COMMENT ON COLUMN "public"."jb_order"."buyer_id" IS '买家ID';
COMMENT ON COLUMN "public"."jb_order"."buyer_name" IS '冗余买家名字';
COMMENT ON COLUMN "public"."jb_order"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."jb_order"."payment_time" IS '付款时间';
COMMENT ON COLUMN "public"."jb_order"."consign_time" IS '发货时间';
COMMENT ON COLUMN "public"."jb_order"."finish_time" IS '交易完成时间';
COMMENT ON COLUMN "public"."jb_order"."close_time" IS '订单关闭时间';
COMMENT ON COLUMN "public"."jb_order"."buyer_message" IS '卖家留言';
COMMENT ON COLUMN "public"."jb_order"."buyer_rate" IS '买家是否已经评价';
COMMENT ON COLUMN "public"."jb_order"."state" IS '订单状态 待付款 已付款 已发货 订单完成 订单关闭';
COMMENT ON COLUMN "public"."jb_order"."goods_amount" IS '总额';
COMMENT ON COLUMN "public"."jb_order"."post_fee" IS '运费';
COMMENT ON COLUMN "public"."jb_order"."payment_amount" IS '应付总额';
COMMENT ON COLUMN "public"."jb_order"."payment_type" IS '支付类型 在线支付 货到付款';
COMMENT ON COLUMN "public"."jb_order"."online_payment_type" IS '在线支付选择了谁';
COMMENT ON COLUMN "public"."jb_order"."close_type" IS '通过什么方式关闭 后台管理 or 客户自身';
COMMENT ON COLUMN "public"."jb_order"."close_uesr_id" IS '关闭订单用户ID';
COMMENT ON TABLE "public"."jb_order" IS '商城订单';

-- ----------------------------
-- Table structure for jb_order_item
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_order_item";
CREATE TABLE "public"."jb_order_item" (
  "id" int4 NOT NULL DEFAULT nextval('jb_order_item_id_seq'::regclass),
  "order_id" int4 NOT NULL,
  "goods_id" int4 NOT NULL,
  "goods_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "goods_sub_title" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "price" numeric(10,2) NOT NULL DEFAULT 0.00,
  "goods_count" int4 NOT NULL DEFAULT 0,
  "goods_amount" numeric(10,2) NOT NULL DEFAULT 0.00,
  "goods_image" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "order_no" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "original_price" numeric(10,2) DEFAULT NULL::numeric,
  "save_price" numeric(10,2) NOT NULL DEFAULT 0.00,
  "save_amount" numeric(10,2) NOT NULL DEFAULT 0.00
)
;
COMMENT ON COLUMN "public"."jb_order_item"."id" IS '主键ID';
COMMENT ON COLUMN "public"."jb_order_item"."order_id" IS '订单ID';
COMMENT ON COLUMN "public"."jb_order_item"."goods_id" IS '商品ID';
COMMENT ON COLUMN "public"."jb_order_item"."goods_name" IS '商品名称';
COMMENT ON COLUMN "public"."jb_order_item"."goods_sub_title" IS '二级促销标题';
COMMENT ON COLUMN "public"."jb_order_item"."price" IS '单价';
COMMENT ON COLUMN "public"."jb_order_item"."goods_count" IS '商品数量';
COMMENT ON COLUMN "public"."jb_order_item"."goods_amount" IS '总额';
COMMENT ON COLUMN "public"."jb_order_item"."goods_image" IS '商品图';
COMMENT ON COLUMN "public"."jb_order_item"."order_no" IS '订单编号';
COMMENT ON COLUMN "public"."jb_order_item"."original_price" IS '原价';
COMMENT ON COLUMN "public"."jb_order_item"."save_price" IS '单个节省价格';
COMMENT ON COLUMN "public"."jb_order_item"."save_amount" IS '一共节省多少钱';
COMMENT ON TABLE "public"."jb_order_item" IS '订单详情表';

-- ----------------------------
-- Table structure for jb_order_shipping
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_order_shipping";
CREATE TABLE "public"."jb_order_shipping" (
  "id" int4 NOT NULL DEFAULT nextval('jb_order_shipping_id_seq'::regclass),
  "order_id" int4 NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "phone" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "mobile" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "buyer_nickname" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "province" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "city" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "county" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "address" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "zipcode" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "create_time" timestamp(6) NOT NULL,
  "update_time" timestamp(6) NOT NULL,
  "update_user_id" int4 NOT NULL,
  "order_no" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "buyer_id" int4 NOT NULL
)
;
COMMENT ON COLUMN "public"."jb_order_shipping"."id" IS '主键ID';
COMMENT ON COLUMN "public"."jb_order_shipping"."order_id" IS '订单ID';
COMMENT ON COLUMN "public"."jb_order_shipping"."name" IS '收件人姓名';
COMMENT ON COLUMN "public"."jb_order_shipping"."phone" IS '收件人固话';
COMMENT ON COLUMN "public"."jb_order_shipping"."mobile" IS '移动电话';
COMMENT ON COLUMN "public"."jb_order_shipping"."buyer_nickname" IS '买方昵称';
COMMENT ON COLUMN "public"."jb_order_shipping"."province" IS '省份';
COMMENT ON COLUMN "public"."jb_order_shipping"."city" IS '城市';
COMMENT ON COLUMN "public"."jb_order_shipping"."county" IS '区县';
COMMENT ON COLUMN "public"."jb_order_shipping"."address" IS '收件具体地址';
COMMENT ON COLUMN "public"."jb_order_shipping"."zipcode" IS '邮政编码';
COMMENT ON COLUMN "public"."jb_order_shipping"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."jb_order_shipping"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."jb_order_shipping"."update_user_id" IS '更新人ID';
COMMENT ON COLUMN "public"."jb_order_shipping"."order_no" IS '订单编号';
COMMENT ON COLUMN "public"."jb_order_shipping"."buyer_id" IS '买方用户ID';
COMMENT ON TABLE "public"."jb_order_shipping" IS '订单物流信息';

-- ----------------------------
-- Table structure for jb_permission
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_permission";
CREATE TABLE "public"."jb_permission" (
  "id" int4 NOT NULL DEFAULT nextval('jb_permission_id_seq'::regclass),
  "title" varchar(40) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "pid" int4 NOT NULL DEFAULT 0,
  "url" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "icons" varchar(40) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sort_rank" int4 NOT NULL,
  "permission_level" int4 NOT NULL,
  "permission_key" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "is_menu" char(1) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 1,
  "is_target_blank" char(1) COLLATE "pg_catalog"."default" DEFAULT 0,
  "is_system_admin_default" char(1) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 0,
  "open_type" int4 NOT NULL DEFAULT 1,
  "open_option" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."jb_permission"."id" IS '主键';
COMMENT ON COLUMN "public"."jb_permission"."url" IS '地址';
COMMENT ON COLUMN "public"."jb_permission"."icons" IS '图标';
COMMENT ON COLUMN "public"."jb_permission"."sort_rank" IS '排序';
COMMENT ON COLUMN "public"."jb_permission"."permission_level" IS '层级';
COMMENT ON COLUMN "public"."jb_permission"."permission_key" IS '权限资源KEY';
COMMENT ON COLUMN "public"."jb_permission"."is_menu" IS '是否是菜单';
COMMENT ON COLUMN "public"."jb_permission"."is_target_blank" IS '是否新窗口打开';
COMMENT ON COLUMN "public"."jb_permission"."is_system_admin_default" IS '是否系统超级管理员默认拥有的权限';
COMMENT ON COLUMN "public"."jb_permission"."open_type" IS '打开类型 1 默认 2 iframe 3 dialog';
COMMENT ON COLUMN "public"."jb_permission"."open_option" IS '组件属性json';
COMMENT ON TABLE "public"."jb_permission" IS 'function定义';

-- ----------------------------
-- Records of jb_permission
-- ----------------------------
INSERT INTO "public"."jb_permission" VALUES (177, '权限设置', 174, '/admin/permission', NULL, 3, 2, 'permission', '1', NULL, '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (173, '修改密码', 172, '/admin/user/pwd', NULL, 1, 2, 'userpwd', '1', NULL, '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (184, '操作日志', 174, '/admin/systemlog', NULL, 4, 2, 'systemlog', '1', NULL, '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (194, '基础数据管理', 174, '/admin/dictionary', NULL, 5, 2, 'dictionary', '1', NULL, '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (172, '个人设置', 0, NULL, 'fa fa-user', 2, 1, 'userinfomgr', '1', '0', '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (198, 'JBolt更新管理', 0, NULL, 'fa fa-refresh', 4, 1, 'jboltupdatemgr', '1', NULL, '0', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (208, 'Demo教程展示', 0, NULL, 'fa fa-cube', 5, 1, 'demoshow', '1', '0', '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (210, '电商平台', 0, NULL, 'fa fa-shopping-basket', 6, 1, 'mall', '1', NULL, '0', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (218, '微信模块', 0, NULL, 'fa fa-wechat', 7, 1, 'wechat', '1', NULL, '0', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (220, '一级菜单链接版', 0, 'http://www.jfinalxueyuan.com', 'fa fa-link', 8, 1, 'jfinalxueyuan', '1', '1', '0', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (251, 'API应用开发中心', 0, NULL, 'fa fa-cubes', 9, 1, 'app_dev_center', '1', '0', '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (197, '全局配置', 174, '/admin/globalconfig', NULL, 6, 2, 'globalconfig', '1', NULL, '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (243, 'Druid监控', 174, '/admin/druid/monitor', NULL, 7, 2, 'druid_monitor', '1', '1', '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (199, '版本管理', 198, '/admin/jboltversion', NULL, 1, 2, 'jboltversion', '1', NULL, '0', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (201, '更新下载资源管理', 198, '/admin/updatelibs', NULL, 2, 2, 'updatelibs', '1', NULL, '0', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (202, '更新日志记录', 198, '/admin/downloadlog', NULL, 3, 2, 'downloadlog', '1', NULL, '0', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (209, 'JBolt组件列表', 208, NULL, NULL, 1, 2, 'demo', '1', '0', '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (238, '二级模块', 208, NULL, NULL, 2, 2, 'level_2', '1', '0', '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (269, 'JBolt几种布局样式', 208, NULL, NULL, 3, 2, 'demo_layout', '1', '0', '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (255, 'AutoSelect组件', 209, '/demo/autoselect', NULL, 1, 3, 'demo_autoselect', '1', '0', '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (256, 'Autocomplete组件', 209, '/demo/autocomplete', NULL, 2, 3, 'demo_autocomplete', '1', '0', '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (257, 'PhotoBtn组件', 209, '/demo/photobtn', NULL, 3, 3, 'demo_photobtn', '1', '0', '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (258, 'ImageViewer组件', 209, '/demo/imgviewer', NULL, 4, 3, 'demo_imgviewer', '1', '0', '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (259, 'Radio组件', 209, '/demo/radio', NULL, 5, 3, 'demo_radio', '1', '0', '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (260, 'Checkbox组件', 209, '/demo/checkbox', NULL, 6, 3, 'demo_checkbox', '1', '0', '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (261, 'SwitchBtn组件', 209, '/demo/switchbtn', NULL, 7, 3, 'demo_switchbtn', '1', '0', '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (262, 'AjaxBtn组件', 209, '/demo/ajaxbtn', NULL, 8, 3, 'demo_ajaxbtn', '1', '0', '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (263, 'TabTrigger组件', 209, '/demo/tabtrigger', NULL, 9, 3, 'demo_trigger', '1', '0', '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (239, '三级菜单', 238, '/demo/level3menu', NULL, 1, 3, 'level_3', '1', '0', '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (250, '主从表DEMO', 269, '/demo/masterslave', NULL, 1, 3, 'demo_masterslave', '1', '0', '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (270, 'CURD_带分页', 269, '/demo/curdwithpage', NULL, 2, 3, 'demo_curd_withpage', '1', '0', '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (271, 'CURD_不带分页', 269, '/demo/curdwithoutpage', NULL, 3, 3, 'demo_curd_withouut_page', '1', '0', '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (211, '商品管理', 210, '/admin/mall/goods', NULL, 1, 2, 'mall_goods', '1', NULL, '0', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (212, '商品类目_后端', 210, '/admin/mall/goodsbackcategory', NULL, 2, 2, 'mall_goods_back_category', '1', NULL, '0', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (213, '商品类目_前端', 210, '/admin/mall/goodsfrontcategory', NULL, 3, 2, 'mall_goods_front_category', '1', NULL, '0', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (214, '物流配送', 210, 'shipping', NULL, 4, 2, 'shipping', '1', NULL, '0', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (215, '系统规格管理', 210, '/admin/mall/spec', NULL, 5, 2, 'mall_spec', '1', NULL, '0', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (216, '商品类型', 210, '/admin/mall/goodstype', NULL, 6, 2, 'mall_goodstype', '1', NULL, '0', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (217, '品牌库', 210, '/admin/mall/brand', NULL, 7, 2, 'mall_brand', '1', NULL, '0', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (219, '公众平台管理', 218, '/admin/wechat/mpinfo', NULL, 1, 2, 'wechat_mpinfo', '1', '0', '0', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (254, '微信客服网页版', 218, 'https://mpkf.weixin.qq.com/', NULL, 2, 2, 'wechat_mpkf', '1', '1', '0', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (225, '基础配置', 219, NULL, NULL, 1, 3, 'wechat_config_basemgr', '0', '0', '0', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (226, '菜单配置', 219, NULL, NULL, 2, 3, 'wechat_menu', '0', '0', '0', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (227, '支付配置', 219, NULL, NULL, 3, 3, 'wechat_config_paymgr', '0', '0', '0', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (228, '关注回复', 219, NULL, NULL, 4, 3, 'wechat_autoreply_subscribe', '0', '0', '0', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (229, '关键词回复', 219, NULL, NULL, 5, 3, 'wechat_autoreply_keywords', '0', '0', '0', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (230, '默认回复', 219, NULL, NULL, 6, 3, 'wechat_autoreply_default', '0', '0', '0', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (231, '素材库', 219, NULL, NULL, 7, 3, 'wechat_media', '0', '0', '0', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (232, '用户管理', 219, NULL, NULL, 8, 3, 'wechat_user', '0', '0', '0', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (233, '其它配置', 219, NULL, NULL, 9, 3, 'wechat_config_extramgr', '0', '0', '0', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (252, 'API应用管理', 251, '/admin/app', NULL, 1, 2, 'application', '1', '0', '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (143, '操作台', 0, '/admin/dashboard', 'fa fa-home', 1, 1, 'dashboard', '1', '0', '0', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (174, '系统维护', 0, NULL, 'fa fa-cogs', 3, 1, 'systemmgr', '1', NULL, '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (175, '角色权限管理', 174, '/admin/role', NULL, 1, 2, 'role', '1', NULL, '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (176, '内部人员管理', 174, '/admin/user', NULL, 2, 2, 'user', '1', NULL, '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (264, 'JBoltLayer组件', 209, '/demo/jboltlayer', NULL, 10, 3, 'demo_jboltlayer', '1', '0', '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (265, 'DialogBtn组件', 209, '/demo/dialogbtn', NULL, 11, 3, 'demo_dialogbtn', '1', '0', '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (266, '富文本编辑器', 209, '/demo/htmleditor', NULL, 12, 3, 'demo_htmleditor', '1', '0', '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (267, 'Laydate组件', 209, '/demo/laydate', NULL, 13, 3, 'demo_laydate', '1', '0', '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (268, 'Html5原生Date组件', 209, '/demo/html5date', NULL, 14, 3, 'demo_html5date', '1', '0', '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (272, 'webcam组件', 209, '/demo/webcam', NULL, 15, 3, 'web_cam', '1', '0', '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (273, 'ImgUploader组件', 209, '/demo/imguploader', NULL, 16, 3, 'demo_imguploader', '1', '0', '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (274, 'FileUploader组件', 209, '/demo/fileuploader', NULL, 17, 3, 'demo_fileuploader', '1', '0', '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (277, '多文件上传组件', 209, '/demo/multiplefileuploader', NULL, 18, 3, 'demo_multiple_file_upload', '1', '0', '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (279, '表单校验(内置)', 209, '/demo/formcheck', NULL, 19, 3, 'demo_formcheck', '1', '0', '1', 1, NULL);
INSERT INTO "public"."jb_permission" VALUES (282, '头像修改', 172, '/admin/user/avatar', NULL, 2, 2, 'useravatar', '1', '0', '1', 1, NULL);

-- ----------------------------
-- Table structure for jb_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_role";
CREATE TABLE "public"."jb_role" (
  "id" int4 NOT NULL DEFAULT nextval('jb_role_id_seq'::regclass),
  "name" varchar(20) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "pid" int4 NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "public"."jb_role"."id" IS '主键';
COMMENT ON COLUMN "public"."jb_role"."name" IS '名称';
COMMENT ON COLUMN "public"."jb_role"."pid" IS '父级角色ID';
COMMENT ON TABLE "public"."jb_role" IS '角色表';

-- ----------------------------
-- Records of jb_role
-- ----------------------------
INSERT INTO "public"."jb_role" VALUES (1, '系统总管理', 0);

-- ----------------------------
-- Table structure for jb_role_permission
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_role_permission";
CREATE TABLE "public"."jb_role_permission" (
  "id" int4 NOT NULL DEFAULT nextval('jb_role_permission_id_seq'::regclass),
  "role_id" int4 NOT NULL,
  "permission_id" int4 NOT NULL
)
;
COMMENT ON COLUMN "public"."jb_role_permission"."id" IS '主键';
COMMENT ON COLUMN "public"."jb_role_permission"."role_id" IS '角色ID';
COMMENT ON COLUMN "public"."jb_role_permission"."permission_id" IS '权限ID';
COMMENT ON TABLE "public"."jb_role_permission" IS '角色功能列表';

-- ----------------------------
-- Records of jb_role_permission
-- ----------------------------
INSERT INTO "public"."jb_role_permission" VALUES (4300, 2, 143);
INSERT INTO "public"."jb_role_permission" VALUES (4301, 2, 172);
INSERT INTO "public"."jb_role_permission" VALUES (4302, 2, 173);
INSERT INTO "public"."jb_role_permission" VALUES (4303, 2, 174);
INSERT INTO "public"."jb_role_permission" VALUES (4304, 2, 175);
INSERT INTO "public"."jb_role_permission" VALUES (4305, 2, 176);
INSERT INTO "public"."jb_role_permission" VALUES (4306, 2, 177);
INSERT INTO "public"."jb_role_permission" VALUES (4307, 2, 184);
INSERT INTO "public"."jb_role_permission" VALUES (4308, 2, 194);
INSERT INTO "public"."jb_role_permission" VALUES (4309, 2, 197);
INSERT INTO "public"."jb_role_permission" VALUES (4310, 2, 243);
INSERT INTO "public"."jb_role_permission" VALUES (4311, 2, 198);
INSERT INTO "public"."jb_role_permission" VALUES (4312, 2, 199);
INSERT INTO "public"."jb_role_permission" VALUES (4313, 2, 201);
INSERT INTO "public"."jb_role_permission" VALUES (4314, 2, 202);
INSERT INTO "public"."jb_role_permission" VALUES (4916, 25, 208);
INSERT INTO "public"."jb_role_permission" VALUES (4917, 25, 209);
INSERT INTO "public"."jb_role_permission" VALUES (4918, 25, 255);
INSERT INTO "public"."jb_role_permission" VALUES (4919, 25, 256);
INSERT INTO "public"."jb_role_permission" VALUES (4920, 25, 257);
INSERT INTO "public"."jb_role_permission" VALUES (4921, 25, 258);
INSERT INTO "public"."jb_role_permission" VALUES (4922, 25, 259);
INSERT INTO "public"."jb_role_permission" VALUES (4923, 25, 260);
INSERT INTO "public"."jb_role_permission" VALUES (4924, 25, 261);
INSERT INTO "public"."jb_role_permission" VALUES (4925, 25, 262);
INSERT INTO "public"."jb_role_permission" VALUES (4926, 25, 263);
INSERT INTO "public"."jb_role_permission" VALUES (4927, 25, 264);
INSERT INTO "public"."jb_role_permission" VALUES (4928, 25, 265);
INSERT INTO "public"."jb_role_permission" VALUES (4929, 25, 266);
INSERT INTO "public"."jb_role_permission" VALUES (4930, 25, 267);
INSERT INTO "public"."jb_role_permission" VALUES (4931, 25, 268);
INSERT INTO "public"."jb_role_permission" VALUES (4932, 25, 272);
INSERT INTO "public"."jb_role_permission" VALUES (4933, 25, 238);
INSERT INTO "public"."jb_role_permission" VALUES (4934, 25, 239);
INSERT INTO "public"."jb_role_permission" VALUES (4935, 25, 269);
INSERT INTO "public"."jb_role_permission" VALUES (4936, 25, 270);
INSERT INTO "public"."jb_role_permission" VALUES (4937, 25, 271);
INSERT INTO "public"."jb_role_permission" VALUES (4938, 25, 250);
INSERT INTO "public"."jb_role_permission" VALUES (4939, 25, 210);
INSERT INTO "public"."jb_role_permission" VALUES (4940, 25, 211);
INSERT INTO "public"."jb_role_permission" VALUES (4941, 25, 212);
INSERT INTO "public"."jb_role_permission" VALUES (4942, 25, 213);
INSERT INTO "public"."jb_role_permission" VALUES (4943, 25, 214);
INSERT INTO "public"."jb_role_permission" VALUES (4944, 25, 215);
INSERT INTO "public"."jb_role_permission" VALUES (4945, 25, 216);
INSERT INTO "public"."jb_role_permission" VALUES (4946, 25, 217);
INSERT INTO "public"."jb_role_permission" VALUES (4947, 25, 218);
INSERT INTO "public"."jb_role_permission" VALUES (4948, 25, 219);
INSERT INTO "public"."jb_role_permission" VALUES (4949, 25, 225);
INSERT INTO "public"."jb_role_permission" VALUES (4950, 25, 226);
INSERT INTO "public"."jb_role_permission" VALUES (4951, 25, 227);
INSERT INTO "public"."jb_role_permission" VALUES (4952, 25, 228);
INSERT INTO "public"."jb_role_permission" VALUES (4953, 25, 229);
INSERT INTO "public"."jb_role_permission" VALUES (4954, 25, 230);
INSERT INTO "public"."jb_role_permission" VALUES (4955, 25, 231);
INSERT INTO "public"."jb_role_permission" VALUES (4956, 25, 232);
INSERT INTO "public"."jb_role_permission" VALUES (4957, 25, 233);
INSERT INTO "public"."jb_role_permission" VALUES (4958, 25, 254);
INSERT INTO "public"."jb_role_permission" VALUES (5749, 1, 143);
INSERT INTO "public"."jb_role_permission" VALUES (5750, 1, 172);
INSERT INTO "public"."jb_role_permission" VALUES (5751, 1, 173);
INSERT INTO "public"."jb_role_permission" VALUES (5752, 1, 174);
INSERT INTO "public"."jb_role_permission" VALUES (5753, 1, 175);
INSERT INTO "public"."jb_role_permission" VALUES (5754, 1, 176);
INSERT INTO "public"."jb_role_permission" VALUES (5755, 1, 177);
INSERT INTO "public"."jb_role_permission" VALUES (5756, 1, 184);
INSERT INTO "public"."jb_role_permission" VALUES (5757, 1, 194);
INSERT INTO "public"."jb_role_permission" VALUES (5758, 1, 197);
INSERT INTO "public"."jb_role_permission" VALUES (5759, 1, 243);
INSERT INTO "public"."jb_role_permission" VALUES (5760, 1, 198);
INSERT INTO "public"."jb_role_permission" VALUES (5761, 1, 199);
INSERT INTO "public"."jb_role_permission" VALUES (5762, 1, 201);
INSERT INTO "public"."jb_role_permission" VALUES (5763, 1, 202);
INSERT INTO "public"."jb_role_permission" VALUES (5764, 1, 208);
INSERT INTO "public"."jb_role_permission" VALUES (5765, 1, 209);
INSERT INTO "public"."jb_role_permission" VALUES (5766, 1, 255);
INSERT INTO "public"."jb_role_permission" VALUES (5767, 1, 256);
INSERT INTO "public"."jb_role_permission" VALUES (5768, 1, 257);
INSERT INTO "public"."jb_role_permission" VALUES (5769, 1, 258);
INSERT INTO "public"."jb_role_permission" VALUES (5770, 1, 259);
INSERT INTO "public"."jb_role_permission" VALUES (5771, 1, 260);
INSERT INTO "public"."jb_role_permission" VALUES (5772, 1, 261);
INSERT INTO "public"."jb_role_permission" VALUES (5773, 1, 262);
INSERT INTO "public"."jb_role_permission" VALUES (5774, 1, 263);
INSERT INTO "public"."jb_role_permission" VALUES (5775, 1, 264);
INSERT INTO "public"."jb_role_permission" VALUES (5776, 1, 265);
INSERT INTO "public"."jb_role_permission" VALUES (5777, 1, 266);
INSERT INTO "public"."jb_role_permission" VALUES (5778, 1, 267);
INSERT INTO "public"."jb_role_permission" VALUES (5779, 1, 268);
INSERT INTO "public"."jb_role_permission" VALUES (5780, 1, 272);
INSERT INTO "public"."jb_role_permission" VALUES (5781, 1, 273);
INSERT INTO "public"."jb_role_permission" VALUES (5782, 1, 274);
INSERT INTO "public"."jb_role_permission" VALUES (5783, 1, 277);
INSERT INTO "public"."jb_role_permission" VALUES (5784, 1, 238);
INSERT INTO "public"."jb_role_permission" VALUES (5785, 1, 239);
INSERT INTO "public"."jb_role_permission" VALUES (5786, 1, 269);
INSERT INTO "public"."jb_role_permission" VALUES (5787, 1, 270);
INSERT INTO "public"."jb_role_permission" VALUES (5788, 1, 271);
INSERT INTO "public"."jb_role_permission" VALUES (5789, 1, 250);
INSERT INTO "public"."jb_role_permission" VALUES (5790, 1, 210);
INSERT INTO "public"."jb_role_permission" VALUES (5791, 1, 211);
INSERT INTO "public"."jb_role_permission" VALUES (5792, 1, 212);
INSERT INTO "public"."jb_role_permission" VALUES (5793, 1, 213);
INSERT INTO "public"."jb_role_permission" VALUES (5794, 1, 214);
INSERT INTO "public"."jb_role_permission" VALUES (5795, 1, 215);
INSERT INTO "public"."jb_role_permission" VALUES (5796, 1, 216);
INSERT INTO "public"."jb_role_permission" VALUES (5797, 1, 217);
INSERT INTO "public"."jb_role_permission" VALUES (5798, 1, 218);
INSERT INTO "public"."jb_role_permission" VALUES (5799, 1, 219);
INSERT INTO "public"."jb_role_permission" VALUES (5800, 1, 225);
INSERT INTO "public"."jb_role_permission" VALUES (5801, 1, 226);
INSERT INTO "public"."jb_role_permission" VALUES (5802, 1, 227);
INSERT INTO "public"."jb_role_permission" VALUES (5803, 1, 228);
INSERT INTO "public"."jb_role_permission" VALUES (5804, 1, 229);
INSERT INTO "public"."jb_role_permission" VALUES (5805, 1, 230);
INSERT INTO "public"."jb_role_permission" VALUES (5806, 1, 231);
INSERT INTO "public"."jb_role_permission" VALUES (5807, 1, 232);
INSERT INTO "public"."jb_role_permission" VALUES (5808, 1, 233);
INSERT INTO "public"."jb_role_permission" VALUES (5809, 1, 254);
INSERT INTO "public"."jb_role_permission" VALUES (5810, 1, 220);
INSERT INTO "public"."jb_role_permission" VALUES (5811, 1, 251);
INSERT INTO "public"."jb_role_permission" VALUES (5812, 1, 252);

-- ----------------------------
-- Table structure for jb_shelf
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_shelf";
CREATE TABLE "public"."jb_shelf" (
  "id" int4 NOT NULL DEFAULT nextval('jb_shelf_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "enable" char(1) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 0,
  "create_time" timestamp(6) NOT NULL,
  "create_user_id" int4 NOT NULL,
  "publish_user_id" int4,
  "publish_time" timestamp(6),
  "share_image" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "share_title" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "update_time" timestamp(6) NOT NULL,
  "update_user_id" int4 NOT NULL
)
;
COMMENT ON COLUMN "public"."jb_shelf"."id" IS '主键ID';
COMMENT ON COLUMN "public"."jb_shelf"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."jb_shelf"."create_user_id" IS '创建人ID';
COMMENT ON COLUMN "public"."jb_shelf"."publish_user_id" IS '上线发布人';
COMMENT ON COLUMN "public"."jb_shelf"."publish_time" IS '发布时间';
COMMENT ON COLUMN "public"."jb_shelf"."share_image" IS '分享图';
COMMENT ON COLUMN "public"."jb_shelf"."share_title" IS '分享标题';
COMMENT ON COLUMN "public"."jb_shelf"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."jb_shelf"."update_user_id" IS '更新人';
COMMENT ON TABLE "public"."jb_shelf" IS '电商货架-小程序首页风格';

-- ----------------------------
-- Table structure for jb_shelf_activity
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_shelf_activity";
CREATE TABLE "public"."jb_shelf_activity" (
  "id" int4 NOT NULL DEFAULT nextval('jb_shelf_activity_id_seq'::regclass),
  "poster_image" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "open_url" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "open_type" int4 NOT NULL,
  "shelf_element_id" int4 NOT NULL,
  "shelf_id" int4 NOT NULL
)
;
COMMENT ON COLUMN "public"."jb_shelf_activity"."id" IS '主键ID';
COMMENT ON COLUMN "public"."jb_shelf_activity"."poster_image" IS '海报地址';
COMMENT ON COLUMN "public"."jb_shelf_activity"."open_url" IS '打开地址';
COMMENT ON COLUMN "public"."jb_shelf_activity"."open_type" IS '打开方式 网页还是商品内页 还是分类 还是';
COMMENT ON COLUMN "public"."jb_shelf_activity"."shelf_element_id" IS '货架元素ID';
COMMENT ON COLUMN "public"."jb_shelf_activity"."shelf_id" IS '货架ID';
COMMENT ON TABLE "public"."jb_shelf_activity" IS '货架元素_活动';

-- ----------------------------
-- Table structure for jb_shelf_carousel
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_shelf_carousel";
CREATE TABLE "public"."jb_shelf_carousel" (
  "id" int4 NOT NULL DEFAULT nextval('jb_shelf_carousel_id_seq'::regclass),
  "imgurl" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "openType" int4 NOT NULL,
  "open_url" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "shelf_id" int4 NOT NULL,
  "shelf_element_id" int4 NOT NULL,
  "sort_rank" int4 NOT NULL
)
;
COMMENT ON COLUMN "public"."jb_shelf_carousel"."id" IS '主键ID';
COMMENT ON COLUMN "public"."jb_shelf_carousel"."imgurl" IS '图片地址';
COMMENT ON COLUMN "public"."jb_shelf_carousel"."openType" IS '打开模式 内置资源地址，网页地址';
COMMENT ON COLUMN "public"."jb_shelf_carousel"."open_url" IS '打开地址';
COMMENT ON COLUMN "public"."jb_shelf_carousel"."shelf_id" IS '货架ID';
COMMENT ON COLUMN "public"."jb_shelf_carousel"."shelf_element_id" IS '货架元素ID';
COMMENT ON COLUMN "public"."jb_shelf_carousel"."sort_rank" IS '排序';
COMMENT ON TABLE "public"."jb_shelf_carousel" IS '货架元素_轮播图';

-- ----------------------------
-- Table structure for jb_shelf_element
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_shelf_element";
CREATE TABLE "public"."jb_shelf_element" (
  "id" int4 NOT NULL DEFAULT nextval('jb_shelf_element_id_seq'::regclass),
  "type" int4 NOT NULL,
  "width" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "height" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "sort_rank" int4 NOT NULL
)
;
COMMENT ON COLUMN "public"."jb_shelf_element"."id" IS '主键ID';
COMMENT ON COLUMN "public"."jb_shelf_element"."type" IS '类型 轮播 楼层 分类 活动等';
COMMENT ON COLUMN "public"."jb_shelf_element"."width" IS '宽度';
COMMENT ON COLUMN "public"."jb_shelf_element"."height" IS '高度';
COMMENT ON COLUMN "public"."jb_shelf_element"."sort_rank" IS '排序';
COMMENT ON TABLE "public"."jb_shelf_element" IS '货架从上到下的元素';

-- ----------------------------
-- Table structure for jb_shelf_goods_floor
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_shelf_goods_floor";
CREATE TABLE "public"."jb_shelf_goods_floor" (
  "id" int4 NOT NULL DEFAULT nextval('jb_shelf_goods_floor_id_seq'::regclass),
  "group_id" int4 NOT NULL,
  "title" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "open_url" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "goods_count" int4 NOT NULL,
  "column_count" int4 NOT NULL,
  "sort_rank" int4 NOT NULL,
  "shelf_id" int4 NOT NULL,
  "shelf_element_id" int4 NOT NULL
)
;
COMMENT ON COLUMN "public"."jb_shelf_goods_floor"."id" IS '主键ID';
COMMENT ON COLUMN "public"."jb_shelf_goods_floor"."group_id" IS '商品分组ID';
COMMENT ON COLUMN "public"."jb_shelf_goods_floor"."title" IS '显示标题 默认是商品组的 可以改';
COMMENT ON COLUMN "public"."jb_shelf_goods_floor"."open_url" IS '打开地址';
COMMENT ON COLUMN "public"."jb_shelf_goods_floor"."goods_count" IS '显示商品数量';
COMMENT ON COLUMN "public"."jb_shelf_goods_floor"."column_count" IS '显示几列布局';
COMMENT ON COLUMN "public"."jb_shelf_goods_floor"."sort_rank" IS '排序';
COMMENT ON COLUMN "public"."jb_shelf_goods_floor"."shelf_id" IS '货架ID';
COMMENT ON COLUMN "public"."jb_shelf_goods_floor"."shelf_element_id" IS '货架元素ID';
COMMENT ON TABLE "public"."jb_shelf_goods_floor" IS '货架元素_商品楼层';

-- ----------------------------
-- Table structure for jb_shelf_goods_group
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_shelf_goods_group";
CREATE TABLE "public"."jb_shelf_goods_group" (
  "id" int4 NOT NULL DEFAULT nextval('jb_shelf_goods_group_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "icon" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "imgurl" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sub_title" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sort_rank" int4 NOT NULL,
  "shelf_id" int4 NOT NULL,
  "shelf_element_id" int4 NOT NULL
)
;
COMMENT ON COLUMN "public"."jb_shelf_goods_group"."id" IS '主键ID';
COMMENT ON COLUMN "public"."jb_shelf_goods_group"."icon" IS '图标';
COMMENT ON COLUMN "public"."jb_shelf_goods_group"."imgurl" IS '分类下的顶部修饰图';
COMMENT ON COLUMN "public"."jb_shelf_goods_group"."sub_title" IS '二级标题';
COMMENT ON COLUMN "public"."jb_shelf_goods_group"."sort_rank" IS '排序';
COMMENT ON COLUMN "public"."jb_shelf_goods_group"."shelf_id" IS '货架ID';
COMMENT ON COLUMN "public"."jb_shelf_goods_group"."shelf_element_id" IS '货架元素ID';
COMMENT ON TABLE "public"."jb_shelf_goods_group" IS '货架元素_商品组';

-- ----------------------------
-- Table structure for jb_sku
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_sku";
CREATE TABLE "public"."jb_sku" (
  "id" int4 NOT NULL DEFAULT nextval('jb_sku_id_seq'::regclass),
  "sku_key" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "sku_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "goods_id" int4 NOT NULL,
  "goods_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "type_id" int4 NOT NULL,
  "price" numeric(10,2) NOT NULL DEFAULT NULL::numeric,
  "original_price" numeric(10,2) DEFAULT NULL::numeric,
  "stock_count" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sub_title" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "on_sale" char(1) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 0,
  "sellout" char(1) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 0,
  "real_sale_count" int4 NOT NULL,
  "show_sale_count" int4 NOT NULL,
  "main_image" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "extra_images" text COLLATE "pg_catalog"."default" NOT NULL,
  "is_hot" char(1) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 0,
  "is_recommend" char(1) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 0,
  "need_content" char(1) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 0,
  "content_type" int4,
  "under_time" timestamp(6),
  "onSale_time" timestamp(6),
  "create_user_id" int4 NOT NULL,
  "create_time" timestamp(6) NOT NULL,
  "update_time" timestamp(6) NOT NULL,
  "update_user_id" int4 NOT NULL
)
;
COMMENT ON COLUMN "public"."jb_sku"."id" IS '主键ID';
COMMENT ON COLUMN "public"."jb_sku"."sku_key" IS '规格编码';
COMMENT ON COLUMN "public"."jb_sku"."sku_name" IS '规格名称';
COMMENT ON COLUMN "public"."jb_sku"."goods_id" IS '商品ID';
COMMENT ON COLUMN "public"."jb_sku"."goods_name" IS '商品名称';
COMMENT ON COLUMN "public"."jb_sku"."type_id" IS '类型ID';
COMMENT ON COLUMN "public"."jb_sku"."price" IS '单价';
COMMENT ON COLUMN "public"."jb_sku"."original_price" IS '原价';
COMMENT ON COLUMN "public"."jb_sku"."stock_count" IS '库存量';
COMMENT ON COLUMN "public"."jb_sku"."sub_title" IS '营销语';
COMMENT ON COLUMN "public"."jb_sku"."on_sale" IS '是否上架';
COMMENT ON COLUMN "public"."jb_sku"."sellout" IS '售罄';
COMMENT ON COLUMN "public"."jb_sku"."real_sale_count" IS '真实销量';
COMMENT ON COLUMN "public"."jb_sku"."show_sale_count" IS '展示营销销量';
COMMENT ON COLUMN "public"."jb_sku"."main_image" IS '主图';
COMMENT ON COLUMN "public"."jb_sku"."extra_images" IS '附图';
COMMENT ON COLUMN "public"."jb_sku"."is_hot" IS '热销';
COMMENT ON COLUMN "public"."jb_sku"."is_recommend" IS '推荐';
COMMENT ON COLUMN "public"."jb_sku"."need_content" IS '是否需要详情描述';
COMMENT ON COLUMN "public"."jb_sku"."content_type" IS '描述类型 是富文本还是分开的图片 文本段数据';
COMMENT ON COLUMN "public"."jb_sku"."under_time" IS '下架时间';
COMMENT ON COLUMN "public"."jb_sku"."onSale_time" IS '上架时间';
COMMENT ON COLUMN "public"."jb_sku"."create_user_id" IS '创建人';
COMMENT ON COLUMN "public"."jb_sku"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."jb_sku"."update_time" IS '最后更新时间';
COMMENT ON COLUMN "public"."jb_sku"."update_user_id" IS '最后更新人';
COMMENT ON TABLE "public"."jb_sku" IS 'SKU';

-- ----------------------------
-- Table structure for jb_sku_item
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_sku_item";
CREATE TABLE "public"."jb_sku_item" (
  "id" int4 NOT NULL DEFAULT nextval('jb_sku_item_id_seq'::regclass),
  "sku_id" int4 NOT NULL,
  "goods_id" int4 NOT NULL,
  "type_id" int4 NOT NULL,
  "spec_id" int4 NOT NULL,
  "spec_item_id" int4 NOT NULL
)
;
COMMENT ON COLUMN "public"."jb_sku_item"."id" IS '主键ID';
COMMENT ON COLUMN "public"."jb_sku_item"."sku_id" IS 'SKU ID';
COMMENT ON COLUMN "public"."jb_sku_item"."goods_id" IS '商品 ID';
COMMENT ON COLUMN "public"."jb_sku_item"."type_id" IS '商品分类';
COMMENT ON COLUMN "public"."jb_sku_item"."spec_id" IS '规格 ID';
COMMENT ON COLUMN "public"."jb_sku_item"."spec_item_id" IS '规格项 ID';
COMMENT ON TABLE "public"."jb_sku_item" IS 'sku详情';

-- ----------------------------
-- Table structure for jb_spec
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_spec";
CREATE TABLE "public"."jb_spec" (
  "id" int4 NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying
)
;
COMMENT ON TABLE "public"."jb_spec" IS '系统规格表';

-- ----------------------------
-- Table structure for jb_spec_item
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_spec_item";
CREATE TABLE "public"."jb_spec_item" (
  "id" int4 NOT NULL DEFAULT nextval('jb_spec_item_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "spec_id" int4 NOT NULL
)
;
COMMENT ON COLUMN "public"."jb_spec_item"."id" IS '主键ID';
COMMENT ON COLUMN "public"."jb_spec_item"."name" IS '选项名';
COMMENT ON COLUMN "public"."jb_spec_item"."spec_id" IS '所属规格';
COMMENT ON TABLE "public"."jb_spec_item" IS '规格选项表';

-- ----------------------------
-- Table structure for jb_system_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_system_log";
CREATE TABLE "public"."jb_system_log" (
  "id" int4 NOT NULL DEFAULT nextval('jb_system_log_id_seq'::regclass),
  "title" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "type" int4,
  "url" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "user_id" int4,
  "user_name" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "target_type" int4,
  "create_time" timestamp(6),
  "target_id" int4,
  "open_type" int4
)
;
COMMENT ON COLUMN "public"."jb_system_log"."id" IS '主键';
COMMENT ON COLUMN "public"."jb_system_log"."title" IS '标题';
COMMENT ON COLUMN "public"."jb_system_log"."type" IS '操作类型 删除 更新 新增';
COMMENT ON COLUMN "public"."jb_system_log"."url" IS '连接对象详情地址';
COMMENT ON COLUMN "public"."jb_system_log"."user_id" IS '操作人ID';
COMMENT ON COLUMN "public"."jb_system_log"."user_name" IS '操作人姓名';
COMMENT ON COLUMN "public"."jb_system_log"."target_type" IS '操作对象类型';
COMMENT ON COLUMN "public"."jb_system_log"."create_time" IS '记录创建时间';
COMMENT ON COLUMN "public"."jb_system_log"."target_id" IS '操作对象ID';
COMMENT ON COLUMN "public"."jb_system_log"."open_type" IS '打开类型URL还是Dialog';
COMMENT ON TABLE "public"."jb_system_log" IS '系统操作日志表';

-- ----------------------------
-- Table structure for jb_test
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_test";
CREATE TABLE "public"."jb_test" (
  "id" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for jb_update_libs
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_update_libs";
CREATE TABLE "public"."jb_update_libs" (
  "id" int4 NOT NULL DEFAULT nextval('jb_update_libs_id_seq'::regclass),
  "url" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "target" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "delete_all" char(1) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 0,
  "is_must" char(1) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "public"."jb_update_libs"."delete_all" IS '清空文件夹';
COMMENT ON COLUMN "public"."jb_update_libs"."is_must" IS '强制';
COMMENT ON TABLE "public"."jb_update_libs" IS '下载的libs';

-- ----------------------------
-- Records of jb_update_libs
-- ----------------------------
INSERT INTO "public"."jb_update_libs" VALUES (2, 'http://file.jbolt.cn/mchange-commons-java-0.2.15.jar', 'db/c3p0/mchange-commons-java-0.2.15.jar', '0', '1');
INSERT INTO "public"."jb_update_libs" VALUES (4, 'http://file.jbolt.cn/h2-1.4.197.jar', 'db/h2/h2-1.4.197.jar', '1', '0');
INSERT INTO "public"."jb_update_libs" VALUES (5, 'http://file.jbolt.cn/mysql-connector-java-5.1.46.jar', 'db/mysql/mysql-connector-java-5.1.46.jar', '1', '0');
INSERT INTO "public"."jb_update_libs" VALUES (6, 'http://file.jbolt.cn/ojdbc6-11.2.0.3.jar', 'db/oracle/ojdbc6-11.2.0.3.jar', '1', '0');
INSERT INTO "public"."jb_update_libs" VALUES (7, 'http://file.jbolt.cn/postgresql-9.4.1212.jar', 'db/postgresql/postgresql-9.4.1212.jar', '1', '0');
INSERT INTO "public"."jb_update_libs" VALUES (8, 'http://file.jbolt.cn/sqlite-jdbc-3.23.1.jar', 'db/sqlite/sqlite-jdbc-3.23.1.jar', '1', '0');

-- ----------------------------
-- Table structure for jb_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_user";
CREATE TABLE "public"."jb_user" (
  "id" int4 NOT NULL DEFAULT nextval('jb_user_id_seq'::regclass),
  "username" varchar(20) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "password" varchar(128) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "name" varchar(20) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "avatar" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "create_time" timestamp(6),
  "phone" varchar(40) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "enable" char(1) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 0,
  "sex" int4 DEFAULT 0,
  "pinyin" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "roles" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "is_system_admin" char(1) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 0,
  "create_user_id" int4
)
;
COMMENT ON COLUMN "public"."jb_user"."id" IS '主键';
COMMENT ON COLUMN "public"."jb_user"."username" IS '用户名';
COMMENT ON COLUMN "public"."jb_user"."name" IS '姓名';
COMMENT ON COLUMN "public"."jb_user"."avatar" IS '头像';
COMMENT ON COLUMN "public"."jb_user"."create_time" IS '记录创建时间';
COMMENT ON COLUMN "public"."jb_user"."phone" IS '手机号';
COMMENT ON COLUMN "public"."jb_user"."enable" IS '启用';
COMMENT ON COLUMN "public"."jb_user"."sex" IS '性别';
COMMENT ON COLUMN "public"."jb_user"."roles" IS '角色 一对多';
COMMENT ON COLUMN "public"."jb_user"."is_system_admin" IS '是否系统超级管理员';
COMMENT ON COLUMN "public"."jb_user"."create_user_id" IS '创建人';
COMMENT ON TABLE "public"."jb_user" IS '用户登录账户表';

-- ----------------------------
-- Records of jb_user
-- ----------------------------
INSERT INTO "public"."jb_user" VALUES (1, 'admin', '202cb962ac59075b964b07152d234b70', '总管理', 'upload/user/avatar/20191206/5df5da44-e04c-40a6-abb9-52b7da151d96.jpg', '2018-06-06 10:30:02', '187667356321', '1', 1, 'zgl,zongguanli', '1', '1', 0);
INSERT INTO "public"."jb_user" VALUES (20, 'test', 'cc03e747a6afbbcbf8be7668acfebee5', '测试001', '/assets/img/nan.png', '2020-02-04 00:43:17.443', '18756745555', '0', 1, 'cs001,ceshi001', '1', '0', 1);

-- ----------------------------
-- Table structure for jb_user_config
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_user_config";
CREATE TABLE "public"."jb_user_config" (
  "id" int4 NOT NULL DEFAULT nextval('jb_user_config_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "config_key" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "config_value" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "user_id" int4 NOT NULL,
  "create_time" timestamp(6) NOT NULL,
  "update_time" timestamp(6) NOT NULL,
  "value_type" varchar(40) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."jb_user_config"."id" IS '主键ID';
COMMENT ON COLUMN "public"."jb_user_config"."name" IS '配置名';
COMMENT ON COLUMN "public"."jb_user_config"."config_key" IS '配置KEY';
COMMENT ON COLUMN "public"."jb_user_config"."config_value" IS '配置值';
COMMENT ON COLUMN "public"."jb_user_config"."user_id" IS '用户ID';
COMMENT ON COLUMN "public"."jb_user_config"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."jb_user_config"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."jb_user_config"."value_type" IS '取值类型';
COMMENT ON TABLE "public"."jb_user_config" IS '用户系统样式自定义设置表';

-- ----------------------------
-- Records of jb_user_config
-- ----------------------------
INSERT INTO "public"."jb_user_config" VALUES (1, '系统Admin后台样式', 'JBOLT_ADMIN_STYLE', 'jbolt_style_3', 1, '2019-09-26 00:40:59', '2019-12-08 15:40:42.798', 'string');
INSERT INTO "public"."jb_user_config" VALUES (2, '系统Admin后台是否启用多选项卡', 'JBOLT_ADMIN_WITH_TABS', 'false', 1, '2019-09-26 00:40:59', '2019-12-08 15:40:42.801', 'boolean');
INSERT INTO "public"."jb_user_config" VALUES (3, '系统登录页面是否启用透明玻璃风格', 'JBOLT_LOGIN_FORM_STYLE_GLASS', 'true', 1, '2019-09-26 00:40:59', '2019-12-08 15:40:42.803', 'boolean');
INSERT INTO "public"."jb_user_config" VALUES (4, '系统登录页面背景图是否启用模糊风格', 'JBOLT_LOGIN_BGIMG_BLUR', 'true', 1, '2019-09-26 00:40:59', '2019-12-08 15:40:42.806', 'boolean');
INSERT INTO "public"."jb_user_config" VALUES (9, '系统Admin后台样式', 'JBOLT_ADMIN_STYLE', 'jbolt_style_1', 14, '2019-11-04 16:37:28', '2019-12-08 15:40:42.808', 'string');
INSERT INTO "public"."jb_user_config" VALUES (10, '系统Admin后台是否启用多选项卡', 'JBOLT_ADMIN_WITH_TABS', 'false', 14, '2019-11-04 16:37:28', '2019-12-08 15:40:42.81', 'boolean');
INSERT INTO "public"."jb_user_config" VALUES (11, '系统登录页面是否启用透明玻璃风格', 'JBOLT_LOGIN_FORM_STYLE_GLASS', 'false', 14, '2019-11-04 16:37:28', '2019-12-08 15:40:42.812', 'boolean');
INSERT INTO "public"."jb_user_config" VALUES (12, '系统登录页面背景图是否启用模糊风格', 'JBOLT_LOGIN_BGIMG_BLUR', 'true', 14, '2019-11-04 16:37:28', '2019-12-08 15:40:42.814', 'boolean');
INSERT INTO "public"."jb_user_config" VALUES (13, '系统Admin后台样式', 'JBOLT_ADMIN_STYLE', 'jbolt_style_1', 15, '2019-11-07 23:42:53', '2019-12-08 15:40:42.816', 'string');
INSERT INTO "public"."jb_user_config" VALUES (14, '系统Admin后台是否启用多选项卡', 'JBOLT_ADMIN_WITH_TABS', 'false', 15, '2019-11-07 23:42:53', '2019-12-08 15:40:42.818', 'boolean');
INSERT INTO "public"."jb_user_config" VALUES (15, '系统登录页面是否启用透明玻璃风格', 'JBOLT_LOGIN_FORM_STYLE_GLASS', 'false', 15, '2019-11-07 23:42:53', '2019-12-08 15:40:42.82', 'boolean');
INSERT INTO "public"."jb_user_config" VALUES (16, '系统登录页面背景图是否启用模糊风格', 'JBOLT_LOGIN_BGIMG_BLUR', 'true', 15, '2019-11-07 23:42:53', '2019-12-08 15:40:42.822', 'boolean');

-- ----------------------------
-- Table structure for jb_wechat_article
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_wechat_article";
CREATE TABLE "public"."jb_wechat_article" (
  "id" int4 NOT NULL DEFAULT nextval('jb_wechat_article_id_seq'::regclass),
  "title" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "content" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "create_time" timestamp(6) NOT NULL,
  "user_id" int4 NOT NULL,
  "update_time" timestamp(6) NOT NULL,
  "update_user_id" int4 NOT NULL,
  "brief_info" varchar(120) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "poster" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "view_count" int4 NOT NULL,
  "media_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "mp_id" int4 NOT NULL,
  "url" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "type" int4 NOT NULL
)
;
COMMENT ON COLUMN "public"."jb_wechat_article"."id" IS '主键ID';
COMMENT ON COLUMN "public"."jb_wechat_article"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."jb_wechat_article"."user_id" IS '用户 ID';
COMMENT ON COLUMN "public"."jb_wechat_article"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."jb_wechat_article"."update_user_id" IS '更新用户 ID';
COMMENT ON COLUMN "public"."jb_wechat_article"."brief_info" IS '文章摘要';
COMMENT ON COLUMN "public"."jb_wechat_article"."view_count" IS '阅读数';
COMMENT ON COLUMN "public"."jb_wechat_article"."media_id" IS '微信素材 ID';
COMMENT ON COLUMN "public"."jb_wechat_article"."mp_id" IS '微信 ID';
COMMENT ON COLUMN "public"."jb_wechat_article"."url" IS '图文链接地址';
COMMENT ON COLUMN "public"."jb_wechat_article"."type" IS '本地图文 公众号图文素材 外部图文';
COMMENT ON TABLE "public"."jb_wechat_article" IS '微信图文信息';

-- ----------------------------
-- Table structure for jb_wechat_autoreply
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_wechat_autoreply";
CREATE TABLE "public"."jb_wechat_autoreply" (
  "id" int4 NOT NULL DEFAULT nextval('jb_wechat_autoreply_id_seq'::regclass),
  "mp_id" int4 NOT NULL,
  "type" int4 NOT NULL DEFAULT 0,
  "name" varchar(40) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "reply_type" int4 NOT NULL,
  "create_time" timestamp(6) NOT NULL,
  "user_id" int4 NOT NULL,
  "enable" char(1) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "public"."jb_wechat_autoreply"."mp_id" IS '微信 ID';
COMMENT ON COLUMN "public"."jb_wechat_autoreply"."type" IS '类型 关注回复 无内容时回复 关键词回复';
COMMENT ON COLUMN "public"."jb_wechat_autoreply"."name" IS '规则名称';
COMMENT ON COLUMN "public"."jb_wechat_autoreply"."reply_type" IS '回复类型 全部还是随机一条';
COMMENT ON COLUMN "public"."jb_wechat_autoreply"."create_time" IS '记录创建时间';
COMMENT ON COLUMN "public"."jb_wechat_autoreply"."user_id" IS '用户 ID';
COMMENT ON TABLE "public"."jb_wechat_autoreply" IS '微信公众号自动回复规则';

-- ----------------------------
-- Table structure for jb_wechat_config
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_wechat_config";
CREATE TABLE "public"."jb_wechat_config" (
  "id" int4 NOT NULL DEFAULT nextval('jb_wechat_config_id_seq'::regclass),
  "mp_id" int4 NOT NULL,
  "config_key" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "config_value" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "type" int4 NOT NULL
)
;
COMMENT ON COLUMN "public"."jb_wechat_config"."mp_id" IS '微信 ID';
COMMENT ON COLUMN "public"."jb_wechat_config"."config_key" IS '配置key';
COMMENT ON COLUMN "public"."jb_wechat_config"."config_value" IS '配置值';
COMMENT ON COLUMN "public"."jb_wechat_config"."name" IS '配置项名称';
COMMENT ON COLUMN "public"."jb_wechat_config"."type" IS '配置类型';
COMMENT ON TABLE "public"."jb_wechat_config" IS '微信公众号配置表';

-- ----------------------------
-- Table structure for jb_wechat_keywords
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_wechat_keywords";
CREATE TABLE "public"."jb_wechat_keywords" (
  "id" int4 NOT NULL DEFAULT nextval('jb_wechat_keywords_id_seq'::regclass),
  "mp_id" int4 NOT NULL,
  "name" varchar(40) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "type" int4 NOT NULL DEFAULT 0,
  "auto_reply_id" int4 NOT NULL
)
;
COMMENT ON COLUMN "public"."jb_wechat_keywords"."mp_id" IS '微信 ID';
COMMENT ON COLUMN "public"."jb_wechat_keywords"."name" IS '关键词';
COMMENT ON COLUMN "public"."jb_wechat_keywords"."type" IS '模糊 全匹配';
COMMENT ON COLUMN "public"."jb_wechat_keywords"."auto_reply_id" IS '回复规则ID';
COMMENT ON TABLE "public"."jb_wechat_keywords" IS '微信关键词回复中的关键词定义';

-- ----------------------------
-- Table structure for jb_wechat_media
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_wechat_media";
CREATE TABLE "public"."jb_wechat_media" (
  "id" int4 NOT NULL DEFAULT nextval('jb_wechat_media_id_seq'::regclass),
  "title" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "digest" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "mp_id" int4 NOT NULL,
  "media_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "thumb_media_id" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "content_source_url" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "url" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "author" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "update_time" timestamp(6) NOT NULL,
  "server_url" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."jb_wechat_media"."id" IS '主键ID';
COMMENT ON COLUMN "public"."jb_wechat_media"."title" IS '标题';
COMMENT ON COLUMN "public"."jb_wechat_media"."digest" IS '描述';
COMMENT ON COLUMN "public"."jb_wechat_media"."type" IS '类型 image video voice news';
COMMENT ON COLUMN "public"."jb_wechat_media"."mp_id" IS '微信 ID';
COMMENT ON COLUMN "public"."jb_wechat_media"."media_id" IS '微信素材ID';
COMMENT ON COLUMN "public"."jb_wechat_media"."thumb_media_id" IS '封面图ID';
COMMENT ON COLUMN "public"."jb_wechat_media"."content_source_url" IS '原文地址';
COMMENT ON COLUMN "public"."jb_wechat_media"."url" IS '访问地址';
COMMENT ON COLUMN "public"."jb_wechat_media"."author" IS '图文作者';
COMMENT ON COLUMN "public"."jb_wechat_media"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."jb_wechat_media"."server_url" IS '存服务器URL';
COMMENT ON TABLE "public"."jb_wechat_media" IS '微信公众平台素材库同步管理';

-- ----------------------------
-- Table structure for jb_wechat_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_wechat_menu";
CREATE TABLE "public"."jb_wechat_menu" (
  "id" int4 NOT NULL DEFAULT nextval('jb_wechat_menu_id_seq'::regclass),
  "mp_id" int4 NOT NULL,
  "type" varchar(40) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "name" varchar(40) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "pid" int4 NOT NULL DEFAULT 0,
  "sort_rank" int4 NOT NULL,
  "value" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "app_id" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "page_path" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."jb_wechat_menu"."mp_id" IS '微信 ID';
COMMENT ON COLUMN "public"."jb_wechat_menu"."sort_rank" IS '排序';
COMMENT ON COLUMN "public"."jb_wechat_menu"."app_id" IS '微信小程序APPID';
COMMENT ON COLUMN "public"."jb_wechat_menu"."page_path" IS '微信小程序页面地址';
COMMENT ON TABLE "public"."jb_wechat_menu" IS '微信菜单';

-- ----------------------------
-- Table structure for jb_wechat_mpinfo
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_wechat_mpinfo";
CREATE TABLE "public"."jb_wechat_mpinfo" (
  "id" int4 NOT NULL DEFAULT nextval('jb_wechat_mpinfo_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "logo" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "create_time" timestamp(6) NOT NULL,
  "user_id" int4 NOT NULL,
  "enable" char(1) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 0,
  "update_time" timestamp(6) NOT NULL,
  "update_user_id" int4 NOT NULL,
  "brief_info" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "remark" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "type" int4 NOT NULL,
  "is_authenticated" char(1) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 0,
  "subject_type" int4 NOT NULL,
  "wechat_id" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "qrcode" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."jb_wechat_mpinfo"."id" IS '主键';
COMMENT ON COLUMN "public"."jb_wechat_mpinfo"."name" IS '平台名称';
COMMENT ON COLUMN "public"."jb_wechat_mpinfo"."logo" IS '头像LOGO';
COMMENT ON COLUMN "public"."jb_wechat_mpinfo"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."jb_wechat_mpinfo"."user_id" IS '用户ID';
COMMENT ON COLUMN "public"."jb_wechat_mpinfo"."enable" IS '是否启用';
COMMENT ON COLUMN "public"."jb_wechat_mpinfo"."update_time" IS '创建时间';
COMMENT ON COLUMN "public"."jb_wechat_mpinfo"."update_user_id" IS '更新人ID';
COMMENT ON COLUMN "public"."jb_wechat_mpinfo"."brief_info" IS '简介';
COMMENT ON COLUMN "public"."jb_wechat_mpinfo"."remark" IS '备注';
COMMENT ON COLUMN "public"."jb_wechat_mpinfo"."type" IS '类型 订阅号、服务号、小程序、企业号';
COMMENT ON COLUMN "public"."jb_wechat_mpinfo"."is_authenticated" IS '是否已认证';
COMMENT ON COLUMN "public"."jb_wechat_mpinfo"."subject_type" IS '申请认证主体的类型 个人还是企业';
COMMENT ON COLUMN "public"."jb_wechat_mpinfo"."wechat_id" IS '微信号';
COMMENT ON COLUMN "public"."jb_wechat_mpinfo"."qrcode" IS '二维码';
COMMENT ON TABLE "public"."jb_wechat_mpinfo" IS '微信公众号与小程序';

-- ----------------------------
-- Table structure for jb_wechat_reply_content
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_wechat_reply_content";
CREATE TABLE "public"."jb_wechat_reply_content" (
  "id" int4 NOT NULL DEFAULT nextval('jb_wechat_reply_content_id_seq'::regclass),
  "type" varchar(40) COLLATE "pg_catalog"."default" NOT NULL DEFAULT '0'::character varying,
  "title" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "content" text COLLATE "pg_catalog"."default",
  "poster" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "url" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "auto_reply_id" int4 NOT NULL,
  "create_time" timestamp(6) NOT NULL,
  "user_id" int4,
  "media_id" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "mp_id" int4 NOT NULL,
  "sort_rank" int4 NOT NULL,
  "enable" char(1) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "public"."jb_wechat_reply_content"."type" IS '类型 图文 文字 图片 音频 视频';
COMMENT ON COLUMN "public"."jb_wechat_reply_content"."auto_reply_id" IS '回复规则ID';
COMMENT ON COLUMN "public"."jb_wechat_reply_content"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."jb_wechat_reply_content"."user_id" IS '用户 ID';
COMMENT ON COLUMN "public"."jb_wechat_reply_content"."media_id" IS '关联数据';
COMMENT ON COLUMN "public"."jb_wechat_reply_content"."mp_id" IS '微信 ID';
COMMENT ON COLUMN "public"."jb_wechat_reply_content"."sort_rank" IS '排序';
COMMENT ON COLUMN "public"."jb_wechat_reply_content"."enable" IS '启用';
COMMENT ON TABLE "public"."jb_wechat_reply_content" IS '自动回复内容';

-- ----------------------------
-- Table structure for jb_wechat_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."jb_wechat_user";
CREATE TABLE "public"."jb_wechat_user" (
  "id" int4 NOT NULL DEFAULT nextval('jb_wechat_user_id_seq'::regclass),
  "nickname" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "open_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT NULL::character varying,
  "union_id" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sex" int4 DEFAULT 0,
  "language" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "subscibe" char(1) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 0,
  "country" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "province" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "city" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "head_img_url" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "subscribe_time" timestamp(6),
  "remark" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "group_id" int4,
  "tag_ids" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "subscribe_scene" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "qr_scene" int4,
  "qr_scene_str" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "realname" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "phone" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "check_code" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "is_checked" char(1) COLLATE "pg_catalog"."default" DEFAULT 0,
  "source" int4,
  "session_key" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "login_token" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "enable" char(1) COLLATE "pg_catalog"."default" DEFAULT 0,
  "create_time" timestamp(6),
  "checked_time" timestamp(6),
  "mp_id" int4,
  "weixin" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."jb_wechat_user"."id" IS '用户ID';
COMMENT ON COLUMN "public"."jb_wechat_user"."nickname" IS '用户昵称';
COMMENT ON COLUMN "public"."jb_wechat_user"."open_id" IS 'openId';
COMMENT ON COLUMN "public"."jb_wechat_user"."union_id" IS 'unionID';
COMMENT ON COLUMN "public"."jb_wechat_user"."sex" IS '性别 1男 2女 0 未知';
COMMENT ON COLUMN "public"."jb_wechat_user"."language" IS '语言';
COMMENT ON COLUMN "public"."jb_wechat_user"."subscibe" IS '是否已关注';
COMMENT ON COLUMN "public"."jb_wechat_user"."country" IS '国家';
COMMENT ON COLUMN "public"."jb_wechat_user"."province" IS '省';
COMMENT ON COLUMN "public"."jb_wechat_user"."city" IS '城市';
COMMENT ON COLUMN "public"."jb_wechat_user"."head_img_url" IS '头像';
COMMENT ON COLUMN "public"."jb_wechat_user"."subscribe_time" IS '关注时间';
COMMENT ON COLUMN "public"."jb_wechat_user"."remark" IS '备注';
COMMENT ON COLUMN "public"."jb_wechat_user"."group_id" IS '分组';
COMMENT ON COLUMN "public"."jb_wechat_user"."tag_ids" IS '标签';
COMMENT ON COLUMN "public"."jb_wechat_user"."subscribe_scene" IS '关注渠道';
COMMENT ON COLUMN "public"."jb_wechat_user"."qr_scene" IS '二维码场景-开发者自定义';
COMMENT ON COLUMN "public"."jb_wechat_user"."qr_scene_str" IS '二维码扫码场景描述-开发者自定义';
COMMENT ON COLUMN "public"."jb_wechat_user"."realname" IS '真实姓名';
COMMENT ON COLUMN "public"."jb_wechat_user"."phone" IS '手机号';
COMMENT ON COLUMN "public"."jb_wechat_user"."check_code" IS '手机验证码';
COMMENT ON COLUMN "public"."jb_wechat_user"."is_checked" IS '是否已验证';
COMMENT ON COLUMN "public"."jb_wechat_user"."source" IS '来源 小程序还是公众平台';
COMMENT ON COLUMN "public"."jb_wechat_user"."session_key" IS '小程序登录SessionKey';
COMMENT ON COLUMN "public"."jb_wechat_user"."login_token" IS '登录TOKEN';
COMMENT ON COLUMN "public"."jb_wechat_user"."enable" IS '禁用访问';
COMMENT ON COLUMN "public"."jb_wechat_user"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."jb_wechat_user"."checked_time" IS '验证绑定手机号时间';
COMMENT ON COLUMN "public"."jb_wechat_user"."mp_id" IS '所属公众平台ID';
COMMENT ON COLUMN "public"."jb_wechat_user"."weixin" IS '微信号';
COMMENT ON TABLE "public"."jb_wechat_user" IS '微信用户信息_模板表';

-- ----------------------------
-- Primary Key structure for table jb_application
-- ----------------------------
ALTER TABLE "public"."jb_application" ADD CONSTRAINT "jb_application_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_brand
-- ----------------------------
ALTER TABLE "public"."jb_brand" ADD CONSTRAINT "jb_brand_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_change_log
-- ----------------------------
ALTER TABLE "public"."jb_change_log" ADD CONSTRAINT "jb_change_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_demotable
-- ----------------------------
ALTER TABLE "public"."jb_demotable" ADD CONSTRAINT "jb_demotable_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_dictionary
-- ----------------------------
ALTER TABLE "public"."jb_dictionary" ADD CONSTRAINT "jb_dictionary_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_dictionary_type
-- ----------------------------
ALTER TABLE "public"."jb_dictionary_type" ADD CONSTRAINT "jb_dictionary_type_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_download_log
-- ----------------------------
ALTER TABLE "public"."jb_download_log" ADD CONSTRAINT "jb_download_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_global_config
-- ----------------------------
ALTER TABLE "public"."jb_global_config" ADD CONSTRAINT "jb_global_config_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_goods
-- ----------------------------
ALTER TABLE "public"."jb_goods" ADD CONSTRAINT "jb_goods_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_goods_attr
-- ----------------------------
ALTER TABLE "public"."jb_goods_attr" ADD CONSTRAINT "jb_goods_attr_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_goods_back_category
-- ----------------------------
ALTER TABLE "public"."jb_goods_back_category" ADD CONSTRAINT "jb_goods_back_category_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_goods_element_content
-- ----------------------------
ALTER TABLE "public"."jb_goods_element_content" ADD CONSTRAINT "jb_goods_element_content_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_goods_group
-- ----------------------------
ALTER TABLE "public"."jb_goods_group" ADD CONSTRAINT "jb_goods_group_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_goods_html_content
-- ----------------------------
ALTER TABLE "public"."jb_goods_html_content" ADD CONSTRAINT "jb_goods_html_content_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_goods_type
-- ----------------------------
ALTER TABLE "public"."jb_goods_type" ADD CONSTRAINT "jb_goods_type_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_goods_type_brand
-- ----------------------------
ALTER TABLE "public"."jb_goods_type_brand" ADD CONSTRAINT "jb_goods_type_brand_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_jbolt_file
-- ----------------------------
ALTER TABLE "public"."jb_jbolt_file" ADD CONSTRAINT "jb_jbolt_file_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_jbolt_version
-- ----------------------------
ALTER TABLE "public"."jb_jbolt_version" ADD CONSTRAINT "jb_jbolt_version_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_jbolt_version_file
-- ----------------------------
ALTER TABLE "public"."jb_jbolt_version_file" ADD CONSTRAINT "jb_jbolt_version_file_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_order
-- ----------------------------
ALTER TABLE "public"."jb_order" ADD CONSTRAINT "jb_order_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_order_item
-- ----------------------------
ALTER TABLE "public"."jb_order_item" ADD CONSTRAINT "jb_order_item_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_order_shipping
-- ----------------------------
ALTER TABLE "public"."jb_order_shipping" ADD CONSTRAINT "jb_order_shipping_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_permission
-- ----------------------------
ALTER TABLE "public"."jb_permission" ADD CONSTRAINT "jb_permission_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_role
-- ----------------------------
ALTER TABLE "public"."jb_role" ADD CONSTRAINT "jb_role_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_role_permission
-- ----------------------------
ALTER TABLE "public"."jb_role_permission" ADD CONSTRAINT "jb_role_permission_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_shelf
-- ----------------------------
ALTER TABLE "public"."jb_shelf" ADD CONSTRAINT "jb_shelf_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_shelf_activity
-- ----------------------------
ALTER TABLE "public"."jb_shelf_activity" ADD CONSTRAINT "jb_shelf_activity_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_shelf_carousel
-- ----------------------------
ALTER TABLE "public"."jb_shelf_carousel" ADD CONSTRAINT "jb_shelf_carousel_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_shelf_element
-- ----------------------------
ALTER TABLE "public"."jb_shelf_element" ADD CONSTRAINT "jb_shelf_element_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_shelf_goods_floor
-- ----------------------------
ALTER TABLE "public"."jb_shelf_goods_floor" ADD CONSTRAINT "jb_shelf_goods_floor_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_shelf_goods_group
-- ----------------------------
ALTER TABLE "public"."jb_shelf_goods_group" ADD CONSTRAINT "jb_shelf_goods_group_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_sku
-- ----------------------------
ALTER TABLE "public"."jb_sku" ADD CONSTRAINT "jb_sku_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_sku_item
-- ----------------------------
ALTER TABLE "public"."jb_sku_item" ADD CONSTRAINT "jb_sku_item_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_spec
-- ----------------------------
ALTER TABLE "public"."jb_spec" ADD CONSTRAINT "jb_spec_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_spec_item
-- ----------------------------
ALTER TABLE "public"."jb_spec_item" ADD CONSTRAINT "jb_spec_item_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_system_log
-- ----------------------------
ALTER TABLE "public"."jb_system_log" ADD CONSTRAINT "jb_system_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_test
-- ----------------------------
ALTER TABLE "public"."jb_test" ADD CONSTRAINT "jb_test_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_update_libs
-- ----------------------------
ALTER TABLE "public"."jb_update_libs" ADD CONSTRAINT "jb_update_libs_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_user
-- ----------------------------
ALTER TABLE "public"."jb_user" ADD CONSTRAINT "jb_user_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_user_config
-- ----------------------------
ALTER TABLE "public"."jb_user_config" ADD CONSTRAINT "jb_user_config_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_wechat_article
-- ----------------------------
ALTER TABLE "public"."jb_wechat_article" ADD CONSTRAINT "jb_wechat_article_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_wechat_autoreply
-- ----------------------------
ALTER TABLE "public"."jb_wechat_autoreply" ADD CONSTRAINT "jb_wechat_autoreply_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_wechat_config
-- ----------------------------
ALTER TABLE "public"."jb_wechat_config" ADD CONSTRAINT "jb_wechat_config_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_wechat_keywords
-- ----------------------------
ALTER TABLE "public"."jb_wechat_keywords" ADD CONSTRAINT "jb_wechat_keywords_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_wechat_media
-- ----------------------------
ALTER TABLE "public"."jb_wechat_media" ADD CONSTRAINT "jb_wechat_media_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_wechat_menu
-- ----------------------------
ALTER TABLE "public"."jb_wechat_menu" ADD CONSTRAINT "jb_wechat_menu_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_wechat_mpinfo
-- ----------------------------
ALTER TABLE "public"."jb_wechat_mpinfo" ADD CONSTRAINT "jb_wechat_mpinfo_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_wechat_reply_content
-- ----------------------------
ALTER TABLE "public"."jb_wechat_reply_content" ADD CONSTRAINT "jb_wechat_reply_content_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jb_wechat_user
-- ----------------------------
ALTER TABLE "public"."jb_wechat_user" ADD CONSTRAINT "jb_wechat_user_pkey" PRIMARY KEY ("id");