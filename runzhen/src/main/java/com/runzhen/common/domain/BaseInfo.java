package com.runzhen.common.domain;

public class BaseInfo {
	private Integer limit;			//每页显示记录数
	
	private Integer offset;			//显示数据偏移量
	
	public Integer getLimit() {
		return limit;
	}

	public void setLimit(Integer limit) {
		this.limit = limit;
	}

	public Integer getOffset() {
		return offset;
	}

	public void setOffset(Integer offset) {
		this.offset = offset;
	}
}
