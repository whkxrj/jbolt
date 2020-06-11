alter table jb_application add column `link_target_id` int(11) DEFAULT NULL COMMENT '关联对象ID';
alter table jb_wechat_mpinfo add column `link_app_id` int(11) DEFAULT NULL COMMENT '关联应用ID';
alter table jb_wechat_user add column `update_time` datetime DEFAULT NULL COMMENT '更新时间';
alter table jb_wechat_user add column `first_login_time` datetime DEFAULT NULL COMMENT '首次登录时间';
alter table jb_wechat_user add column `last_login_time` datetime DEFAULT NULL COMMENT '最近一次登录时间';
alter table jb_wechat_user add column `first_auth_time` datetime DEFAULT NULL COMMENT '首次授权时间';
alter table jb_wechat_user add column `last_auth_time` datetime DEFAULT NULL COMMENT '最近一次授权时间';
alter table jb_wechat_user drop column `login_token`;