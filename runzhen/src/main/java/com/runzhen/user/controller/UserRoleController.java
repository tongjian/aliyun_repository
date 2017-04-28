package com.runzhen.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.runzhen.user.domain.UserRole;
import com.runzhen.user.service.IUserRoleService;

@Controller
@RequestMapping("/userRole")
public class UserRoleController {

	@Autowired
	private IUserRoleService userRoleService;
	
	/*
	 * 功能：显示用户列表,分页查询
	*/
	@RequestMapping("/list")
	@ResponseBody
	public Map<String,Object> getUserRoleList(UserRole record){
		Map<String,Object> result = new HashMap<String,Object>();
		List<UserRole> userRoleList = userRoleService.selectByPage(record);
		Integer total = userRoleService.getTotal(record);
		result.put("rows", userRoleList);
		result.put("total", total);
		return result;
	}
}
