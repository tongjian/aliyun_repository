package com.runzhen.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.runzhen.user.domain.RoleInfo;
import com.runzhen.user.service.IRoleInfoService;

@Controller
@RequestMapping("/role")
public class RoleController {
	
	@Autowired
	private IRoleInfoService roleInfoService;
	
	/*
	 * 功能：显示用户列表
	*/
	@RequestMapping("/list")
	@ResponseBody
	public Map<String,Object> getRoleList(RoleInfo record){
		Map<String,Object> result = new HashMap<String,Object>();
		List<RoleInfo> roleList = roleInfoService.selectByPage(record);
		Integer total = roleInfoService.getTotal(record);
		result.put("rows", roleList);
		result.put("total", total);
		return result;
	}
}
