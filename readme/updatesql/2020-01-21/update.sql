alter table jb_permission add column `open_type` int(11) DEFAULT '1' COMMENT '打开类型';
alter table jb_permission add column `open_option` varchar(255) DEFAULT NULL COMMENT '组件属性Json';