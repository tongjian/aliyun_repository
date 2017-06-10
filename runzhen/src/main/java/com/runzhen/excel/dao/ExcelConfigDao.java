package com.runzhen.excel.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.runzhen.excel.domain.ExcelConfigInfo;

/**
 * excel导入导出配置
*/
@Repository
public interface ExcelConfigDao {
	
	/**
	 * 根据id获取对象
	 * @param id 
	*/
	public ExcelConfigInfo findById(Integer id);
	
	/**
	 * 页面查询
	 * @param info 
	*/
	public List<ExcelConfigInfo> selectByPage(ExcelConfigInfo info);
	
	/**
	 * 查询总数
	 * @param info 
	*/
	public int getTotal(ExcelConfigInfo info);
	
	/**
	 * 查询所有记录
	 * @param info 
	*/
	public List<ExcelConfigInfo> findAll(ExcelConfigInfo info);
	
	/**
	 * 根据id删除对象
	 * @param id 
	*/
	public int deleteById(Integer id);
	
	/**
	 * 新增
	 * @param info 
	*/
	public int insert(ExcelConfigInfo info);
	
	/**
	 * 修改部分列
	 * @param info 
	*/
	public int updateByPrimaryKeySelective(ExcelConfigInfo info);
	
	/**
	 * 修改所有列
	 * @param info 
	*/
	public int updateByPrimaryKey(ExcelConfigInfo info);
}
