package com.runzhen.user.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.runzhen.common.util.CommonUtil;
import com.runzhen.user.UserConstant;
import com.runzhen.user.domain.RoleInfo;
import com.runzhen.user.service.IRoleInfoService;

@Controller
@RequestMapping("/role")
public class RoleController {
	
	@Autowired
	private IRoleInfoService roleInfoService;
	
	/*
	 * 功能：显示角色列表
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
	
	/*
	 * 功能：显示角色列表
	*/
	@RequestMapping("/save")
	@ResponseBody
	public Map<String,Object> saveRoleInfo(RoleInfo record,HttpSession httpSession){
		Map<String,Object> resultMap = CommonUtil.getReturnMap();
		
		String loginUser = String.valueOf((httpSession.getAttribute("userId")));		//登录人
		Integer roleId = record.getRoleId();
		if(roleId == null){
			/* 查询是否已有相同角色编码的记录 */
			RoleInfo info = new RoleInfo();
			info.setRoleCode(record.getRoleCode());
			List<RoleInfo> roleList = roleInfoService.findByInfo(info);
			if(!CollectionUtils.isEmpty(roleList)){
				resultMap.put(CommonUtil.RESULT_MESSAGE, UserConstant.INSERT_ROLE_RESULT_FAILD);
				return resultMap;
			}
			
			record.setCreateUser(loginUser);		//设置创建人
			record.setCreateDate(new Date());		//设置创建日期
			roleInfoService.insert(record);
		}else{
			record.setUpdateUser(loginUser);		//设置修改人
			record.setUpdateDate(new Date());		//设置修改日期
			roleInfoService.updateByPrimaryKeySelective(record);
		}
		
		resultMap.put(CommonUtil.RESULT_CODE, CommonUtil.RESULT_STATUS_SUCCESS);
		resultMap.put(CommonUtil.RESULT_MESSAGE, UserConstant.SAVE_RESULT_SUCCESS);
		
		return resultMap;
	}
	
	/*
	 * 功能：显示角色列表
	*/
	@RequestMapping("/findAll")
	@ResponseBody
	public Map<String,Object> findAllRole(RoleInfo record){
		Map<String,Object> resultMap = CommonUtil.getReturnMap();
		
		record.setActive(UserConstant.ACTIVITE_ON);  					//获取有效的角色
		List<RoleInfo> roleList = roleInfoService.findByInfo(record);
		resultMap.put(CommonUtil.RESULT_CODE, CommonUtil.RESULT_STATUS_SUCCESS);
		resultMap.put(CommonUtil.RESULT_OBJECT, roleList);
		
		return resultMap;
	}
}
