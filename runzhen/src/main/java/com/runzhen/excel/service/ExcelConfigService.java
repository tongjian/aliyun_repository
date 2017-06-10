package com.runzhen.excel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.runzhen.excel.dao.ExcelConfigDao;
import com.runzhen.excel.domain.ExcelConfigInfo;

@Service
public class ExcelConfigService {

	@Autowired
	private ExcelConfigDao excelConfigDao;
	
	/**
	 * 根据id获取对象
	 * @param id 
	*/
	public ExcelConfigInfo findById(Integer id){
		return excelConfigDao.findById(id);
	}
	
	/**
	 * 分页查询
	 * @param info 
	*/
	public List<ExcelConfigInfo> selectByPage(ExcelConfigInfo info){
		return excelConfigDao.selectByPage(info);
	}
	
	/**
	 * 查询总数
	 * @param info 
	*/
	public int getTotal(ExcelConfigInfo info){
		return excelConfigDao.getTotal(info);
	}
	
	/**
	 * 查询所有记录
	 * @param info 
	*/
	public List<ExcelConfigInfo> findAll(ExcelConfigInfo info){
		return excelConfigDao.findAll(info);
	}
	
	/**
	 * 根据id删除对象
	 * @param id 
	*/
	public int deleteById(Integer id){
		return excelConfigDao.deleteById(id);
	}
	
	/**
	 * 新增
	 * @param info 
	*/
	public int insert(ExcelConfigInfo info){
		return excelConfigDao.insert(info);
	}
	
	/**
	 * 修改部分列
	 * @param info 
	*/
	public int updateByPrimaryKeySelective(ExcelConfigInfo info){
		return excelConfigDao.updateByPrimaryKeySelective(info);
	}
	
	/**
	 * 修改所有列
	 * @param info 
	*/
	public int updateByPrimaryKey(ExcelConfigInfo info){
		return excelConfigDao.updateByPrimaryKey(info);
	}
}
