package com.runzhen.excel;

/**
 *  excel导入导出配置类;
 */
public class ExcelConfigConstant {
	
	/**
	 *  excel数据类型;1:字符串类型;2:数字类型;3:日期类型;
	 */
	public static final String DATATYPE_STRING = "1";			
	public static final String DATATYPE_NUMBER = "2";			
	public static final String DATATYPE_DATE = "3";
	
	/**
	 *  excel数据格式;
	 */
	public static final String DATAFORMAT_NUMBER_INT = "1";		//数字格式，整数格式
	public static final String DATAFORMAT_NUMBER_TWO = "2";		//数字格式，默认两位
	public static final String DATAFORMAT_DATE = "1";			//默认日期格式:"yyyy-MM-dd"
	public static final String DATAFORMAT_DATETIME = "2";		//默认日期时间格式:"yyyy-MM-dd hh:mm:ss"
	
	/**
	 *  是否导入列;
	 */
	public static final String IMPORT_FLALG = "0";				//是否导入；0：为导入，1：为不导入
	
	/**
	 *  是否导出列;
	 */
	public static final String EXPORT_FLALG = "0";				//是否导出；0：为导入，1：为不导入
}
