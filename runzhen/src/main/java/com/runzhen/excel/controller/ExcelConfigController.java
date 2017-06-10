package com.runzhen.excel.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.runzhen.common.util.CommonUtil;
import com.runzhen.excel.domain.ExcelConfigInfo;
import com.runzhen.excel.service.ExcelConfigService;

@Controller
@RequestMapping("/excelConfig")
public class ExcelConfigController {

	private static final Integer SUCCESS = 1;		//修改，删除成功
	
	@Autowired
	private ExcelConfigService excelConfigService;
	
	/**
	 * 根据id获取对象
	 * @param id 
	*/
	@RequestMapping("/findById")
	@ResponseBody
	public Map<String,Object> findById(Integer id){
		Map<String,Object> resultMap = CommonUtil.getReturnMap();
		ExcelConfigInfo excelConfigInfo = excelConfigService.findById(id);
		resultMap.put("excelConfigInfo", excelConfigInfo);
		return resultMap;
	}
	
	/**
	 * 分页查询
	 * @param info 
	*/
	@RequestMapping("/selectByPage")
	@ResponseBody
	public Map<String,Object> selectByPage(ExcelConfigInfo info){
		Map<String,Object> resultMap = CommonUtil.getReturnMap();
		List<ExcelConfigInfo> excelConfigList = excelConfigService.selectByPage(info);
		int total = excelConfigService.getTotal(info);
		resultMap.put("rows", excelConfigList);
		resultMap.put("total", total);
		return resultMap;
	}
	
	/**
	 * 查询所有记录
	 * @param info 
	*/
	@RequestMapping("/findAll")
	@ResponseBody
	public Map<String,Object> findAll(ExcelConfigInfo info){
		Map<String,Object> resultMap = CommonUtil.getReturnMap();
		List<ExcelConfigInfo> excelConfigList = excelConfigService.selectByPage(info);
		resultMap.put("excelConfigList", excelConfigList);
		return resultMap;
	}
	
	/**
	 * 根据id删除对象
	 * @param id 
	*/
	@RequestMapping("/deleteById")
	@ResponseBody
	public Map<String,Object> deleteById(Integer id){
		Map<String,Object> resultMap = CommonUtil.getReturnMap();
		int count = excelConfigService.deleteById(id);
		if(count == SUCCESS){
			resultMap.put("resultMessage", "删除成功!");
		}else{
			resultMap.put("resultMessage", "删除失败!");
		}
		return resultMap;
	}
	
	/**
	 * 保存对象
	 * @param info 
	*/
	@RequestMapping("/save")
	@ResponseBody
	public Map<String,Object> save(ExcelConfigInfo info){
		Map<String,Object> resultMap = CommonUtil.getReturnMap();
		Integer id = info.getId();
		Integer count = null;
		if(id != null){		//修改
			count = excelConfigService.updateByPrimaryKeySelective(info);
		}else{				//新增
			count = excelConfigService.insert(info);
		}
		
		if(count == SUCCESS){
			resultMap.put("resultMessage", "保存成功!");
		}else{
			resultMap.put("resultMessage", "保存失败!");
		}
		return resultMap;
	}
}
