package com.runzhen.excel.domain;

import com.runzhen.common.domain.BaseInfo;

public class ExcelConfigInfo extends BaseInfo {
	
	private Integer id;
	private String excelFileCode;
	private String titleCode;
	private String titleName;
	private String dataType;
	private String dataFormat;
	private String exportFlag;
	private String importFlag;
	private Integer titleIndex;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getExcelFileCode() {
		return excelFileCode;
	}
	public void setExcelFileCode(String excelFileCode) {
		this.excelFileCode = excelFileCode;
	}
	public String getTitleCode() {
		return titleCode;
	}
	public void setTitleCode(String titleCode) {
		this.titleCode = titleCode;
	}
	public String getTitleName() {
		return titleName;
	}
	public void setTitleName(String titleName) {
		this.titleName = titleName;
	}
	public String getDataType() {
		return dataType;
	}
	public void setDataType(String dataType) {
		this.dataType = dataType;
	}
	public String getDataFormat() {
		return dataFormat;
	}
	public void setDataFormat(String dataFormat) {
		this.dataFormat = dataFormat;
	}
	public String getExportFlag() {
		return exportFlag;
	}
	public void setExportFlag(String exportFlag) {
		this.exportFlag = exportFlag;
	}
	public String getImportFlag() {
		return importFlag;
	}
	public void setImportFlag(String importFlag) {
		this.importFlag = importFlag;
	}
	public Integer getTitleIndex() {
		return titleIndex;
	}
	public void setTitleIndex(Integer titleIndex) {
		this.titleIndex = titleIndex;
	}
	
}
