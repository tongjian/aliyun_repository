use runzhen;
--excel导入导出配置
create table excel_config (
	id int not null auto_increment primary key comment '主键',			
	excelFileCode varchar(30) not null comment '导出导入的excel文件编号',
	titleCode varchar(30) not null comment 'excel文件列头编码',
	titleName varchar(30) not null comment 'excel文件列头名称',
	dataType varchar(2) not null comment '列对应的数据类型;1:字符串;2:数字;3:日期,默认格式:"yyyy-MM-dd";4:日期时间,默认格式:"yyyy-MM-dd hh:mm:ss"',
	dataFormat varchar(20) not null comment '数据类型对应的数据格式',
	exportFlag varchar(2) default 0 comment '对应列是否导出;0:为导入,1:为不导出',
	importFlag varchar(2) default 0 comment '对应列是否导入;1:为导出,1:为不导入',
	titleIndex int default 0 comment '对应列在excel文件中排的顺序'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;